#! /usr/bin/env nextflow
println "\nI want to call gVCFS\n"





Channel
  .fromPath('Sudan_newcrai/*.cram') { file -> file.name.replaceAll(/.cram$/,'') }
  .set { samples_ch }

samples_ch.subscribe { println "value: $it" }


process foo {
  input:
  set sampleId, file(cram) from samples_ch

  script:
  println sampleId
  println cram

}
