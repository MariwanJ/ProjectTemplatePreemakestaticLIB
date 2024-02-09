//
// This file is a part of the Open Source Design456App
// MIT License
//
// Copyright (c) 2024
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
#ifndef PPCL_LIB_H
#define PPCL_LIB_H

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
#include<string>

int PPCL_API CallpathLibFunc(std::string& ms);

#endif // !PPCL_LIB_H
