#! /usr/bin/env nextflow

nextflow.enable.dsl=2

println "\nI want to call gVCFS\n"



Channel
  .fromFilePairs('Sudan_newcrai/*.{cram,crai}') { file -> file.name.replaceAll(/.cram|.crai$/,'') }
  .set { samples_ch }

println params.outdir


process foo {
  input:
  set sampleId, file(cram) from samples_ch

  script:
  println params.threads


}
