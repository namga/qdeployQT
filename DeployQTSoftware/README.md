# HOW TO DEPLOY QT SOFTWARE

**2 way**

- Static linking (Static library) 
- Share Libraries

### Static linking (Static library)

**Pros**

- Have a few files to deploy 

**Cons**

- The executables are large and with no flexibility.(i.e a new version of the application, or of Qt, will require that the deployment process is repeated),
- Cannot deploy plugins

**Step to build**

Refer: http://doc.qt.io/qt-5/linux-deployment.html

- Building Qt Statically

		cd /path/to/Qt
		./configure -static -prefix /path/to/install <other parameters>
		make
		/// we will find lib at /path/to/install/lib
		
- Linking the Application to the Static Version of Qt
	- Check dependency with $ldd <"app"> or Dependency Walker tool
	- Add flag to project file
		
			DEPENDPATH += . ../testLib 
			INCLUDEPATH += ../testLib  // .h dir
			LIBS += -L[path to lib] -l[name of lib]
Note! that filename of lib: lib[nameOfLib].a and you have to pass 	only original part -l[nameOfLib]

- Rebuild project 

		make clean
		PATH=/path/to/Qt/bin:$PATH
		export PATH
		qmake -config release
		make

- Verify that the Qt libraries are not mentioned in the output.

		ldd ./application
		
Remember that if your application depends on compiler specific libraries, these must still be redistributed along with your application . and Since we cannot deploy plugins using the static linking approach, the executable we have prepared so far is incomplete. The application will run, but the functionality will be disabled due to the missing plugins. To deploy plugin-based applications we should use the shared library approach.

### Shared Libraries

Refer: http://doc.qt.io/qt-5/linux-deployment.html

**Pros**

- can use the shared library approach
- provide smaller, more flexible executables
- use the same Qt libraries for a family of applications
- In fact, if you download the binary installation of Qt, you will get Qt as a shared library. ( i never check before ) or you can install build-depends for any package

refer: https://wiki.qt.io/Building_Qt_5_from_Git
		
		sudo apt-get build-dep qt5-default
		sudo apt-get install libxcb-xinerama0-dev

	

**Cons**

- get more files to deploy


**Step to build**

- build app

		make clean
		qmake -config release
		make
		
- build plugins 

		cd path/to/plugins
		make clean
		qmake -config release
		make

- Create application package

		AppDir/|
			   |app.exe // app executable
			   |app.sh  // script to run 
			   |platforms/ libqxcb.so    // QT plugins 
			   |plugins/libpnp_basictools.so ... // plugins folder
			   |libQtcore.so
			   |libQtwidget.so ...  // lib Qt and orther lib 
			   
You can install .so lib to system folder such as /sys/lib or to AppDir and use app.sh to run app. You can also seach dependency .so by running CSLD.sh script for **app.exe** and **libqxcb.so** (Remember that we should search share library for both files)
			   
	
		
	
