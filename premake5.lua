-- TemplatePreemakeStaticLIB
workspace "TemplatePreemakeStaticLIB"
    architecture "x64"
    startproject "TemplatePreemakeStaticLIB"
    cppdialect "C++17"
    configurations
    {
        "Debug",
        "Release"
    }

    flags
    {
        "MultiProcessorCompile",
    }


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" 
---linuxOutput = "%{wks.location}" 
linuxOutput = os.getcwd()

-- Include directories relative to this project
IncludeDir = {}
    IncludeDir["pathLib"] = "../PPCL/vendor/pathLib/src/"    --- You must use the ../ otherwise the path is wrong
    IncludeDir["PPCL"] = "../PPCL/src/"                    --- You must use the ../ otherwise the path is wrong

--Projects
--Include other lua scripts and group them as dependecies
group "Dependencies"
   include "PPCL"

-- -- Don't remove below line. Without this, the following names will be grouped as dependecies.
group ""
    include "TemplatePreemakeStaticLIB"