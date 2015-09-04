function(flatc GENERATED_HEADERS)
    set(${GENERATED_HEADERS})

    # Unfortunately, generated headers suffix is hardcoded inside 'flatc'
    set(flatc_gen_suffix "_generated.h")

    foreach(fps_file ${ARGN})
        get_filename_component(rel_path_to_file ${fps_file} PATH)
        get_filename_component(file_name ${fps_file} NAME_WE)

        set(output "${CMAKE_CURRENT_BINARY_DIR}/${rel_path_to_file}/${file_name}${flatc_gen_suffix}")

        add_custom_command(
            OUTPUT ${output}
            COMMAND flatc
            ARGS -o "${CMAKE_CURRENT_BINARY_DIR}/${rel_path_to_file}" -c "${CMAKE_CURRENT_SOURCE_DIR}/${fps_file}"
            DEPENDS ${fps_file}
            COMMENT "Generating headers for ${fps_file}"
        )

        list(APPEND ${GENERATED_HEADERS} ${output})
    endforeach()

    set_source_files_properties(${${GENERATED_HEADERS}} PROPERTIES GENERATED TRUE)
    set(${GENERATED_HEADERS} ${${GENERATED_HEADERS}} PARENT_SCOPE)
endfunction()