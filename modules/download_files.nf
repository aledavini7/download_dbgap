

process download {
    
    label 'download'
    
    input:
    val(x)
    
    output:
    tuple val(x), path("${x}/${x}.sra")

    script:
    """
    vdb-config -s /libs/kns/connect/timeout=600000
    vdb-config -s /libs/kns/read/timeout=600000
    prefetch --ngc $params.my_key --max-size 200G --type sra --check-rs no -O . $x
    """
    
}

