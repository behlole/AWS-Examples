require 'aws-sdk-s3'
require 'openssl'
require 'base64'
require 'securerandom'

puts "OpenSSL Version: #{OpenSSL::OPENSSL_VERSION}"

# Create a standard S3 client
s3 = Aws::S3::Client.new(region: 'us-east-1')

# Define your bucket and file name
bucket = 'behlole-encryption-client'
file_name = 'manually_encrypted.txt'

# Encryption parameters
begin
  # Generate a random AES key
  aes_key = SecureRandom.random_bytes(32) # 256-bit key

  # Create a cipher for encryption
  cipher = OpenSSL::Cipher.new('aes-256-cbc')
  cipher.encrypt
  cipher.key = aes_key
  iv = cipher.random_iv

  # The data we want to encrypt
  data = "This is sensitive data encrypted client-side with manual AES encryption"

  # Encrypt the data
  encrypted_data = cipher.update(data) + cipher.final

  # Base64 encode for storage
  encoded_data = Base64.strict_encode64(encrypted_data)

  puts "Data encrypted successfully"

  # Generate an RSA key pair for key encryption
  rsa_key = OpenSSL::PKey::RSA.new(2048)
  public_key = rsa_key.public_key

  # Encrypt the AES key with the RSA public key
  encrypted_key = public_key.public_encrypt(aes_key, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
  encoded_key = Base64.strict_encode64(encrypted_key)
  encoded_iv = Base64.strict_encode64(iv)

  puts "Encryption key secured with RSA"

  # Upload the encrypted data to S3
  resp = s3.put_object(
    bucket: bucket,
    key: file_name,
    body: encoded_data,
    metadata: {
      'x-amz-key' => encoded_key,
      'x-amz-iv' => encoded_iv,
      'x-amz-encryption-method' => 'AES-256-CBC',
      'x-amz-key-encryption-method' => 'RSA-OAEP'
    }
  )

  puts "Encrypted data uploaded successfully: #{resp.etag}"

  # Now retrieve and decrypt the data
  get_resp = s3.get_object(bucket: bucket, key: file_name)

  # Extract the encrypted data and metadata
  retrieved_data = get_resp.body.read
  retrieved_key = Base64.strict_decode64(get_resp.metadata['x-amz-key'])
  retrieved_iv = Base64.strict_decode64(get_resp.metadata['x-amz-iv'])

  # Decrypt the AES key using the RSA private key
  decrypted_key = rsa_key.private_decrypt(retrieved_key, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)

  # Create a cipher for decryption
  decipher = OpenSSL::Cipher.new('aes-256-cbc')
  decipher.decrypt
  decipher.key = decrypted_key
  decipher.iv = retrieved_iv

  # Decrypt the data
  decoded_data = Base64.strict_decode64(retrieved_data)
  decrypted_data = decipher.update(decoded_data) + decipher.final

  puts "Retrieved and decrypted data: #{decrypted_data}"

rescue StandardError => e
  puts "Error: #{e.message}"
  puts "Error type: #{e.class}"
  puts e.backtrace[0..3].join("\n")
end
