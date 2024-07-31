

process download {

    input:
    val(x)
    
    output:
    tuple val(x), path('*.sra')

    script:
    """
    $params.sratoolkit_prefetch --ngc $params.my_key --max-size 200G --output-file "${x}.sra" $x
    """

}


process download_only {

    publishDir "${params.outdir}", mode: 'copy'
    
    input:
    val(x)
    
    output:
    tuple val(x), path('*.sra')

    script:
    """
    $params.sratoolkit_prefetch --ngc $params.my_key --max-size 200G --output-file "${x}.sra" $x
    """

}
