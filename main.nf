#! /usr/bin/env nextflow
println "\nI want to call gVCFS\n"



Channel
  .fromFilePairs('Sudan_newcrai/*.{cram,crai}') { file -> file.name.replaceAll(/.cram|.crai$/,'') }
  .set { samples_ch }



process foo {
  input:
  set sampleId, file(cram) from samples_ch

  script:
  println sampleId
  println cram

}
