
process convert {

    publishDir "${params.outdir}/${sample_id}", mode: 'copy'

    label 'convert'

    input:
    tuple val(sample_id), path(sra_file)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    sam-dump $sra_file | samtools view -Sb > ${sample_id}.bam
    """
}
