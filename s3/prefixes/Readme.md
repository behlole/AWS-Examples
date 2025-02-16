
## Create a Bucket
```shell
aws s3 mb s3://prefixes-fun-behlole
```
## Create a Folder
```shell
aws s3api put-object --bucket=prefixes-fun-behlole --key="hello/"
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dictum fermentum. Morbi lacinia vitae lorem in elementum. In vitae nibh malesuada nulla pharetra suscipit. Morbi id ligula magna. Maecenas sed lectus at velit vulputate molestie eu a tortor. Aenean turpis felis, congue id risus sit amet, cursus laoreet lacus. Phasellus dapibus nunc metus, id semper odio elementum a. Nullam consectetur lectus in risus varius fringilla. Nullam vehicula dui quis enim commodo, nec posuere elit sagittis. Vivamus at libero commodo libero mattis imperdiet. Quisque velit enim, bibendum vel aliquet ac, ullamcorper tristique lectus. Quisque vitae eros gravida, efficitur ipsum vitae, viverra mi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce in sollicitudin libero, sit amet blandit sem. Maecenas non orci non magna malesuada posuere. Cras condimentum erat sagittis massa placerat, id malesuada orci volutpat. Sed non fermentum ex. Nulla gravida volutpat nunc et sit.
## Create many Folders
```shell
aws s3api put-object --bucket=prefixes-fun-behlole --key="Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Vestibulum/cursus/dictum/fermentum/Morbi/lacinia/vitae/lorem/in/elementum/In/vitae/nibh/malesuada/nulla/pharetra/suscipit/Morbi/id/ligula/magna/Maecenas/sed/lectus/at/velit/vulputate/molestie/eu/a/tortor/Aenean/turpis/felis/congue/id/risus/sit/amet/cursus/laoreet/lacus/Phasellus/dapibus/nunc/metus/id/semper/odio/elementum/a/Nullam/consectetur/lectus/in/risus/varius/fringilla/Nullam/vehicula/dui/quis/enim/commodo/nec/posuere/elit/sagittis/Vivamus/at/libero/commodo/libero/mattis/imperdiet/Quisque/velit/enim/bibendum/vel/aliquet/ac/ullamcorper/tristique/lectus/Quisque/vitae/eros/gravida/efficitur/ipsum/vitae/viverra/mi/Class/aptent/taciti/sociosqu/ad/litora/torquent/per/conubia/nostra/per/inceptos/himenaeos/Fusce/in/sollicitudin/libero/sit/amet/blandit/sem/Maecenas/non/orci/non/magna/malesuada/posuere/Cras/condimentum/erat/sagittis/massa/placerat/id/malesuada/orci/volutpat/Sed/non/fermentum/ex/Nulla/gravida/volutpat/nunc/et/sit/"
```
