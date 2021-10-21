#! /usr/bin/env nextflow

nextflow.enable.dsl=2

println "\nI want to call gVCFS\n"

params.crams='Sudan_newcrai/*.{cram,crai}'


Channel
  .fromFilePairs(params.crams)
  .set { samples_ch }

println params.outdir
samples_ch.subscribe { println "value: $it" }


process sayHello {

    """
    echo 'Hello world!' > test_file
    """

}



process foo {
  input:
  set sampleId, file(cram) from samples_ch


  script:
  """
  echo $sampleId >> test_samples.txt
  """


}
