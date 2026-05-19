
process sam_dump {

    label 'sam_dump'

    input:
    tuple val(sample_id), path(sra_file)

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    sam-dump $sra_file > ${sample_id}.sam
    """
}

process sam_to_bam {

    publishDir "${params.outdir}/${sample_id}", mode: 'copy'

    label 'sam_to_bam'

    input:
    tuple val(sample_id), path(sam_file)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    samtools view -Sb $sam_file > ${sample_id}.bam
    """
}
