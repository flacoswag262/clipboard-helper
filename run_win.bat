call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"

git clone https://github.com/dacap/clip
cd clip
cmake .
cmake --build . --target clip --config Release
cd ..

wget https://github.com/nlohmann/json/releases/download/v3.5.0/json.hpp

copy helper.mm helper.cpp
cl.exe /D NDEBUG /c /W3 /WX- /EHsc /MD helper.cpp
cl.exe /D NDEBUG /c /W3 /WX- /EHsc /MD extra/win.cpp

link.exe /OUT:"helper.exe" .\clip\Release\clip.lib user32.lib gdi32.lib /SUBSYSTEM:CONSOLE /machine:X86 win.obj helper.obj

7z a -tzip windows.zip helper.exe .\installer\win\install.bat .\installer\win\uninstall.bat
