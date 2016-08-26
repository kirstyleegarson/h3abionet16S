#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: longyee/usearch

inputs:
  otusRawFasta:
    type: File
    inputBinding:
      prefix: "-uchime_ref"
  goldFasta:
    type: File
    inputBinding:
      prefix: "-db"
  strandInfo:
    type: string
    inputBinding:
      prefix: "-strand"

#baseCommand: [ usearch8,  "-nonchimeras", otus_chimOUT.fasta ]
baseCommand: [ "-nonchimeras", otus_chimOUT.fasta ]

outputs:
  chimeraOutFasta:
    type: File
    outputBinding:
      glob: otus_chimOUT.fasta

#usearch8 -uchime_ref $outDir/otus_raw.fa -db /scratch/DB/bio/qiime/uchime/gold.fa -nonchimeras $outDir/otus_chimOUT.fa -strand plus