#! /usr/bin/env nextflow

println "\nI want to call gVCFS\n"





Channel.fromPath('../Sudan_newcrai/*.cram.crai').set{ samples_ch }

process foo {
  input:
  file x from samples_ch

  script:
  """
  println $x
  """
}
