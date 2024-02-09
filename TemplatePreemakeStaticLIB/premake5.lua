project "TemplatePreemakeStaticLIB"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    ---runtime "Debug"
    --[[
            Note: Windows Only
            To use /MT in premake:
            staticruntime "on"
            runtime "Release"

            To use /MTd in premake:
            staticruntime "on"
            runtime "Debug"

            To use /MD in premake:
            staticruntime "off"
            runtime "Release"

            To use /MDd in premake:
            staticruntime "off"
            runtime "Debug"
    ]]--
    files
    {
        "src/**.h",
        "src/**.cpp"
    }
    includedirs
    {
        "%{IncludeDir.PPCL}",
        "src/"
    }
    defines{
        "PPCL_BUILD_STATIC"
    }

    flags
    {
        "MultiProcessorCompile",
    }

    filter "system:Windows"
        targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
        objdir ("%{wks.location}/bin_int/" .. outputdir .. "/%{prj.name}")
        systemversion "latest"
        defines
            {
                "PPCL_PLATFORM_WINDOWS"
            }
        links{
            "PPCL",
            "shlwapi.lib",
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
        libdirs{ 
            linuxOutput 
        }
        links{
            "PPCL"
        }

    filter "configurations:Debug"
        runtime "Debug" 
        symbols "on"

    filter "configurations:Release"
        runtime "Release" 
        optimize "on"

include "PPCL"