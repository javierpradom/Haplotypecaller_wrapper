#! /usr/bin/env nextflow


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
