




Channel.fromPath('../Sudan_newcrai/*.cram.crai').set{ samples_ch }

process foo {
  input:
  file x from samples_ch

  script:
  """
  echo $x
  """
}
