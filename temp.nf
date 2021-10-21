y = x.replaceAll(/".cram"/, "")
nextflow.enable.dsl=2

println "\nI want to call gVCFS\n"

params.basedir="$PWD"
params.crams="$params.basedir/Sudan_newcrai/*.{cram,crai}"



Channel
  .fromFilePairs(params.basedir/Sudan_newcrai/*.{cram,crai}) { file -> file.name.replaceAll(/.bam|bai$/,'') }
  .set { samples_ch }

println params.outdir + "   "  + params.crams
samples_ch.subscribe { println "value: $it" }
