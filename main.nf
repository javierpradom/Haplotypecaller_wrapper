#! /usr/bin/env nextflow

nextflow.enable.dsl=2

println "\nI want to call gVCFS\n"



Channel
  .fromFilePairs('Sudan_newcrai/*.{cram,crai}') { file -> file.name.replaceAll(/.cram|.crai$/,'') }
  .set { samples_ch }

samples_ch.subscribe { println "value: $it" }

process foo {
  input:
  set sampleId, file(cram), file(crai) from samples_ch


  script:
  println sampleId + cram


}
