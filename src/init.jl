function __init__()
    # MIPLIB 2017
    register(
        DataDep(
            "miplib2017-collection",
            """
            All instances in the MIPLIB 2017 collection set (size: 3.5 GB).
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/collection.zip",
            post_fetch_method = unpack,
        ),
    )
    register(
        DataDep(
            "miplib2017-benchmark",
            """
            All instances in the MIPLIB 2017 benchmark set (size: 317 MB).
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/benchmark.zip",
            post_fetch_method = unpack,
            "c756eefd544d83b31809306b45d3549a1a5b9378e6aa78b68738b1a3b6a418fa"
        ),
    )
    register(
        DataDep(
            "miplib2017-collection-list",
            """
            List of instances in the MIPLIB 2017 collection.
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/collection-v1.test",
            "c416f857083e2b7ec6edad87acc80437e2ea4be65debdbe7c4f3072881981c3f"
        ),
    )
    register(
        DataDep(
            "miplib2017-benchmark-list",
            """
            List of instances in the MIPLIB 2017 benchmark.
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/benchmark-v2.test",
            "0ee9758dba64bb1689cc121c794ee547992a046bcabe1cce9ea79158375dabd5"
        ),
    )
    # Mittelmann
    for (folder, names) in pairs(MITTELMANN_LP_INSTANCES)
        for name in names
            @info "$folder / $name"
            datadep_name = "mittelmann-lp-$name"
            # TODO: some paths are just .bz2, following no visible pattern
            if isnothing(folder)
                datadep_msg = """
                Instance $name from the Mittelmann LP benchmark set.
                Source: https://plato.asu.edu/ftp/lptestset/."""
                datadep_url = "https://plato.asu.edu/ftp/lptestset/$name.mps.bz2"
            else
                datadep_msg = """
                Instance $name from the Mittelmann LP benchmark set (folder $folder).
                Source: https://plato.asu.edu/ftp/lptestset/."""
                datadep_url = "https://plato.asu.edu/ftp/lptestset/$folder/$name.mps.bz2"
            end
            register(
                DataDep(datadep_name, datadep_msg, datadep_url)
            )
        end
    end
    return nothing
end
