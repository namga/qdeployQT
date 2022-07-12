# How to compile on window 

## Install QT IDE

#### Download setup file 
- Goto https://www.qt.io/download/ and chose the guild answer to get QT Open Source 

- After that choose **View All Downloads** and download : **Qt 5.7.1 for Windows 32-bit (MinGW 5.3.0, 1.1 GB)    (info)** to get **qt-opensource-windows-x86-mingw530-5.7.1.exe**

- Open **qt-opensource-windows-x86-mingw530-5.7.1.exe** and install QT


#### Build step

- open **QT_OrbitTool.pro** with **QT Creator**

- **Build>Clean all**  then **Build>Build All**


#### Make app portable 

- copy dependency lib from QT lib into tartget folder and make release folder structure like this :

		platforms/qwindow.dll
		libgcc_s_dw2-1.dll
		libstdc++-6.dll
		libwinpthread-1.dll
		Qt5Core.dll
		Qt5DBus.dll
		Qt5Gui.dll
		Qt5Network.dll
		Qt5Widgets.dll
		QT_OrbitTool.exe

 

