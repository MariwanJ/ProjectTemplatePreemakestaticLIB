## Premake5 template project for multi-static library 

This project is to combine several lib to one library. They will be collected inside the same library. 
Sometimes you need to collect several vendor libraries in one file. This was quite difficult and I couldn't 
find any info about that on the net. I even asked the question at  
https://stackoverflow.com/questions/77756685/static-library-that-dependency-on-another-static-libray-linux-undefined
but without any answer. 

### Project structure 
1-There is a workspace lua file that will create the solution and is the head of the whole solution/make files 

2-Application lua which generates an executable file. That project is depending on the library (PPCL) which depends on pathLib'

3-Pathlib is the library that is simulating vendor library. It will be incldued after compilation in the PPCL.lib or libPPCL.a


## Compiling the project: 

Create the project by running the following command : 

premake5 gmake2  ---LINUX

Premake5 VS2022  ---Windows.


To remove previously generated make files and solutions , run the following command:

call premake5.exe clean


Feel free to contribute and suggest changes to this project. I hope you find it useful. 

### Notes:
There are certan formats that you MUST keep to allow this project work. 
For example when I used this filter:


filter "system::Unix"

    system "linux" 
    
This causes a problem. The generated make file get a configuration of "debug/" folder without your intention. 
Remember also, lua is not pythont language. Just having some spaces (indentation) doesn't mean that the filter will not be applied for that line or section. 
Keep those lines before the filters. There is a note inside one of the lua files about that. 
 
