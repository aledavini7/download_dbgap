

process convert {
    

    publishDir "${params.outdir}/${sample_id}", mode: 'copy'
      
    label 'convert'

    input:
    tuple val(sample_id), path(sra_files)

    output:
    tuple val(sample_id), path('*.bam')

    script:
    """
    $params.sratoolkit $sra_files | samtools view -Sb > ${sample_id}.bam
    """

}
