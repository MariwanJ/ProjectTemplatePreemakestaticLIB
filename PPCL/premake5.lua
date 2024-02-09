project "PPCL"              --    TemplatePreemakeStaticLIBurationLibrary
    kind "StaticLib"--kind "SharedLib"                             use sharedlib if you want DLL/so libraries
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    --runtime "Debug"

--[[       Note: Windows Only
            To use /MT in premake:
            staticruntime "on"
            runtime "Release"

            --To use /MTd in premake:
            staticruntime "on"
            runtime "Debug"

            --To use /MD in premake:
            staticruntime "off"
            runtime "Release"

            --To use /MDd in premake:
            staticruntime "off"
            runtime "Debug"  ]]

    -- WARNING!!! : put these definitions that will be applied to all configuration before having any filter
    --              Otherwise they will go under the filter. This is not a python. Lua dont care about spaces.
    --              Having these under filter xxxx will be applied ONLY for that filter.
    --              This is important to notice owtherwise it will be wrong.!!!


    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }
    files
    {
        "src/**.h",
        "src/**.cpp",
        "src/**.cxx",
        "src/**.c",
    }
    includedirs     ---This will not work if you put it after filter "configurations:Debug"/filter "configurations:Release"
    {
        "%{IncludeDir.pathLib}",
        "%{IncludeDir.PPCL}",
    }
    libdirs {"pathLib"}
    links 
    {   
        "pathLib"
    }


    filter "system:linux"
    --    handle = io.popen("pwd")
    --    result = handle:read("*a")
    --    handle = io.popen("dirname " .. result)
    --    handle:close()
    --    filepath = result:gsub("^%s*(.-)%s*$", "%1")
        targetdir (linuxOutput .. "/bin/" )
        objdir (linuxOutput .. "/bin_int/")

    filter "system:Windows"
        targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
        objdir ("%{wks.location}/bin_int/" .. outputdir .. "/%{prj.name}")
        systemversion "latest"
        defines
        {
        "PPCL_PLATFORM_WINDOWS",
        "PPCL_BUILD_STATIC"
                --put your defins here
        }
        
    filter "configurations:Debug"
        ---- for example "MYPROJ_DEBUG" - remove comment when you use it
        -- defines {
        --}  
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

--- Combine join two libraries into one library
filter "system:linux"
    postbuildcommands {
    "ar -x " ..  (linuxOutput .. "/bin/libpathLib.a"),
    "ar -x " ..  (linuxOutput .. "/bin/libPPCL.a"),
    "ar -r " ..  (linuxOutput .. "/bin/libPPCL.a") .." "  ..  ("*.o"),
    "rm -f *.o"  -- Remove temporary object files
}

include "vendor/pathLib"