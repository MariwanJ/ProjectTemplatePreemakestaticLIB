project "pathLib"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    
    files
    {
        "src/*.c",
        "src/*.cpp",
        "src/*.h",
    }
    defines
    {
        "PPCL_BUILD_STATIC"
    }
    includedirs
    {
       "src/"
    }
    filter "system:linux"
    --    handle = io.popen("pwd")
    --    result = handle:read("*a")
    --    handle = io.popen("dirname " .. result)
    --    handle:close()
    --    filepath = result:gsub("^%s*(.-)%s*$", "%1")
        targetdir (linuxOutput .. "/bin/" )
        objdir (linuxOutput .. "/bin_int/")
        defines
        {
            "PPCL_PLATFORM_LINUX"
        }

    filter "system:Windows"
        ---targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
        ---objdir ("%{wks.location}/bin_int/" .. outputdir .. "/%{prj.name}")
        systemversion "latest"
        defines
        {
            "_CRT_SECURE_NO_WARNINGS",
            "PPCL_PLATFORM_WINDOWS"
        }
    



    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"