#! /usr/bin/env nextflow

println "\nI want to call gVCFS\n"





Channel
  .fromPath('../Sudan_test/*.cram') { file -> file.name.replaceAll(/.bam|.bai$/,'') }
  .set{ samples_ch }

println samples_ch



process foo {
  input:
  file x from samples_ch

  script:
  println x


}
