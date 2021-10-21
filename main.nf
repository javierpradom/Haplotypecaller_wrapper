#! /usr/bin/env nextflow

nextflow.enable.dsl=2

println "\nI want to call gVCFS\n"

params.crams='Sudan_newcrai/*.{cram,crai}'


Channel
  .fromFilePairs(params.crams)
  .set { samples_ch }


process foo {
  input:
  set sampleId, file(cram) from samples_ch


  script:
  println sampleId 


}
