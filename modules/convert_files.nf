

process convert {

    conda '/hpcnfs/home/ieo5898/miniconda3/envs/snake'

    publishDir "${params.outdir}/${sample_id}", mode: 'copy'

    input:
    tuple val(sample_id), path(sra_files)

    output:
    tuple val(sample_id), path('*.bam')

    script:
    """
    $params.sratoolkit $sra_files | samtools view -Sb > ${sample_id}.bam
    """

}