#! /usr/bin/env nextflow

println "\nI want to call gVCFS\n"



Channel
    .fromFilePairs('Sudan_test/*.{cram,crai}') { file -> file.name.replaceAll(/.cram|.crai$/,'') }
    .set { samples_ch }


println samples_ch



process foo {
  input:
  file x from samples_ch

  script:
  println x


}
