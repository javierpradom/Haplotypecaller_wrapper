




Channel.fromPath('reads/*_1.fq.gz').set{ samples_ch }

process foo {
  input:
  file x from samples_ch

  script:
  """
  echo $x
  """
}
