//
// This file is a part of the Open Source Design456App
// MIT License
//
// Copyright (c) 2023
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//  Author :Mariwan Jalal    mariwan.jalal@gmail.com
//
#ifndef FR_PATH_H
#define FR_PATH_H

	#include <string>
	#include <iostream>



	//for ResourcePath
#if defined(_WIN32)
	#ifdef PPCL_BUILD_STATIC
		#define PPCL_API             //NOTHING
	#else
		#ifdef PPCL_BUILD_DLL
		#define PPCL_API __declspec(dllexport)
		#else
		#define PPCL_API __declspec(dllimport)
		#endif
	#endif
#elif defined __linux__
// Linux-specific code for symbol visibility
	#ifdef PPCL_BUILD_STATIC
		#define PPCL_API //nothing
	#else
		#define PPCL_API __attribute__((visibility("default")))
	#endif
#elif defined __APPLE__
	#error FRTK NOT IMPLEMENTED
#endif



	//for ResourcePath
#if defined(_WIN32)
		#include <windows.h>
		#include <Shlwapi.h>
		#include <io.h>
		#define access _access_s

		#ifdef PPCL_BUILD_STATIC
			#define PPCL_API             //NOTHING
		#else
			#ifdef PPCL_BUILD_DLL
				#define PPCL_API __declspec(dllexport)
			#else
				#define PPCL_API __declspec(dllimport)
			#endif
		#endif
	
	#elif defined __linux__
	#include <limits.h>
	#include <libgen.h>
	#include <unistd.h>
	#include <cstring>

	#if defined(__sun)
	#define PROC_SELF_EXE "/proc/self/path/a.out"
	#else
	#define PROC_SELF_EXE "/proc/self/exe"
	#endif

	// Linux-specific code for symbol visibility
	#ifdef PPCL_BUILD_STATIC
	#define PPCL_API //nothing
	#else
	#define PPCL_API __attribute__((visibility("default")))

	#endif

	#elif defined __APPLE__
		#include <libgen.h>
		#include <limits.h>
		#include <mach-o/dyld.h>
		#include <unistd.h>
		#error FRTK NOT IMPLEMENTED

#endif

	// https://stackoverflow.com/questions/1528298/get-path-of-executable
/**
*   Assume that you have a tree of folders like bellow
*     ProjectPathConfig
*        --ProjectPathConfig        ---Main App
*             --src                 --- Source files for the Main App
*        --PPCL                     ---lIBRARIES
*               --src               ---Source file for the MAIN LIB
*               --vendor            --- Third party Libraries
*                   ---pathLib      ---pathLib  this is just an example but it also
									 contains the implementation of the relative path
						 ---src     ---Source files for the pathLib

*/

std::string PPCL_API getExecutablePath();
std::string PPCL_API getExecutableDir();
std::string PPCL_API getResourceDir();
std::string PPCL_API mergePaths(std::string pathA, std::string pathB);
int PPCL_API CheckpathLib(std::string& st);

bool PPCL_API checkIfFileExists(const std::string& filePath);
std::string PPCL_API exePath();
std::string PPCL_API meshPath();
std::string PPCL_API shaderPath();
std::string PPCL_API imgPath();

//end for ResourcePath

#endif
