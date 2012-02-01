Rem Delete Delphi temporary file
Rem ****************************
@echo Delete Delphi temporary file
@dir/w/s *.~*
@echo Xóa tat ca cac file temp!
//@pause
@for /r . %%a in (.) do @if exist "%%a\*.~*" del "%%a\*.~*"
@for /r . %%a in (.) do @if exist "%%a\*.dcu" del "%%a\*.dcu"
rem @for /r . %%a in (.) do @if exist "%%a\*.res" del "%%a\*.res"
@for /r . %%a in (.) do @if exist "%%a\*.identcache" del "%%a\*.identcache"
@for /r . %%a in (.) do @if exist "%%a\*.tvsconfig" del "%%a\*.tvsconfig"
@for /r . %%a in (.) do @if exist "%%a\__history" RMDIR/s/q "%%a\__history"
@for /r . %%a in (.) do @if exist "%%a\*humbs.db" del "%%a\*humbs.db"
@for /r . %%a in (.) do @if exist "%%a\thumbs.db" del "%%a\thumbs.db"
@for /r . %%a in (.) do @if exist "%%a\Thumbs.db" del "%%a\Thumbs.db"
rem @for /r . %%a in (.) do @if exist "%%a\.svn" del "%%a\.svn"

@echo Xong!
Rem ****************************