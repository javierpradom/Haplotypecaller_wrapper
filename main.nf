#! /usr/bin/env nextflow


println "\nI want to call gVCFS\n"

params.basedir="$PWD"
params.crams="$params.basedir/Sudan_newcrai/*.{cram,crai}"



Channel
  .fromFilePairs(params.basedir/Sudan_newcrai/*.{cram,crai}) { file -> file.name.replaceAll(/.bam|bai$/,'') }
  .set { samples_ch }

println params.outdir + "   "  + params.crams
samples_ch.subscribe { println "value: $it" }


process sayHello {

    """
    echo 'Hello world!' > $params.basedir/test_file
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
