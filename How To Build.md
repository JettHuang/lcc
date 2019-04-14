##how to build the source file with vs2013 toolset.

经过修改lcc的部分代码,目前能够在vs2013工具集下编译生成.
ref: doc\install.html  #Install on Windows.

1. run command line tool 'cmd';
2. run bat: C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat
3. set BUILDDIR=D:\GitHub\lcc-4.2\bin
4. nmake -f makefile.nt all  生成所有可执行文件(rcc lburg cpp lcc bprint liblcc).
5. nmake -f makefile.nt test 进行自动化测试

Build完毕后，可在命令行中开始使用lcc.
> lcc.exe -o 8q.exe tst\8q.c
