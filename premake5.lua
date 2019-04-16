-- premake5.lua

-- solution
workspace "LCCAll"
    configurations { "Debug", "Release" }
    location "Build"
    language "C"
    architecture "x86"
    
	-- Catch requires RTTI and exceptions
	exceptionhandling "On"
	rtti "On"

    defines {"WIN32"}
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
        -- targetsuffix("_d")

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
    
    filter {}

    targetdir("build/bin")  
    objdir("Build/Obj/%{prj.name}/%{cfg.longname}")
    
-- project rcc
project "rcc"
    kind "ConsoleApp"
    dependson {"librcc"}
    links {"librcc"}
    files {
        "src/main.c"
    }

-- project librcc
project "librcc"
    kind "StaticLib"
    dependson {"lburg"}
    includedirs {"src"}
    files {
        "src/c.h",
        "src/ops.h",
        "src/token.h",
        "src/config.h",
        "src/alloc.c",
        "src/bind.c",
        "src/dag.c",
        "src/decl.c",
        "src/enode.c",
        "src/error.c",
        "src/event.c",
        "src/expr.c",
        "src/gen.c",
        "src/init.c",
        "src/inits.c",
        "src/input.c",
        "src/lex.c",
        "src/list.c",
        "src/main.c",
        "src/null.c",
        "src/output.c",
        "src/prof.c",
        "src/profio.c",
        "src/simp.c",
        "src/stmt.c",
        "src/string.c",
        "src/sym.c",
        "src/symbolic.c",
        "src/bytecode.c",
        "src/trace.c",
        "src/tree.c",
        "src/types.c",
        "src/stab.c",
        "src/stab.h",
        "build/bin/dagcheck.c",
        "build/bin/alpha.c",
        "build/bin/mips.c",
        "build/bin/sparc.c",
        "build/bin/x86.c",
        "build/bin/x86linux.c"
    }
    prebuildcommands {
        ".\\bin\\lburg.exe ..\\src\\dagcheck.md .\\bin\\dagcheck.c",
        ".\\bin\\lburg.exe ..\\src\\alpha.md  .\\bin\\alpha.c",
        ".\\bin\\lburg.exe ..\\src\\mips.md  .\\bin\\mips.c",
        ".\\bin\\lburg.exe ..\\src\\sparc.md  .\\bin\\sparc.c",
        ".\\bin\\lburg.exe ..\\src\\x86.md  .\\bin\\x86.c",
        ".\\bin\\lburg.exe ..\\src\\x86linux.md  .\\bin\\x86linux.c"
    }
    
--project lburg
project "lburg"
    kind "ConsoleApp"
    targetsuffix("")
    files {
        "lburg/lburg.h",
        "lburg/lburg.c",
        "lburg/gram.c"
    }

--project cpp
project "cpp"
    kind "ConsoleApp"
    files {
        "cpp/cpp.h",
        "cpp/cpp.c",
        "cpp/lex.c",
        "cpp/nlist.c",
        "cpp/tokens.c",
        "cpp/macro.c",
        "cpp/eval.c",
        "cpp/include.c",
        "cpp/hideset.c",
        "cpp/getopt.c",
        "cpp/unix.c"
    }

--project lcc
project "lcc"
    kind "ConsoleApp"
    defines {"LCCDIR=\"" .. os.getcwd() .. "/build/bin/\""}
    files {
        "etc/lcc.c",
        "etc/win32.c"
    }

--project bprint
project "bprint"
    kind "ConsoleApp"

    includedirs {"src"}
    files {
        "etc/bprint.c"
        -- "src/profio.c"
    }

--project ops
project "ops"
    kind "ConsoleApp"

    includedirs {"src"}
    files {
        "etc/ops.c",
        "src/ops.h"
    }

--project liblcc
project "liblcc"
    kind "StaticLib"

    files {
        "lib/assert.c",
        "lib/yynull.c",
        "lib/bbexit.c"
    }
