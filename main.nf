#! /usr/bin/env nextflow

println "\nI want to call gVCFS\n"
#to $params.dbDir/$params.dbName using $params.threads CPUs and output it to $params.outdir\n"





Channel.fromPath('../Sudan_newcrai/*.cram.crai').set{ samples_ch }

process foo {
  input:
  file x from samples_ch

  script:
  """
  echo $x
  """
}
