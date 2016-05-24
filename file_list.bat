::ドラッグ＆ドロップしたフォルダ内にあるPDFファイルリストをtmp.txtに出力
for /F "usebackq" %%i in (`dir %1 /a-d /on /b *.pdf`) do (echo %%i >> tmp.txt)


::リスト内の拡張子を削除する処理
set ofilename=list_.txt
type nul >%ofilename%

setlocal ENABLEDELAYEDEXPANSION
::tmp.txt内リストの拡張子を削除
for /f "delims=" %%A in (tmp.txt) do (
	set line=%%A
	::新たなリストをlist_.txtとして出力
	echo !line:.pdf =!>> %ofilename%
)
endlocal
::最初のリストファイルを削除
del tmp.txt


::[_]を[,]に置換しCSVとして出力する処理
set ofilename2=list.csv
type nul >%ofilename2%

setlocal ENABLEDELAYEDEXPANSION
for /f "delims=" %%A in (list_.txt) do (
	set line2=%%A
	echo !line2:_=,!>> %ofilename2%
)
endlocal
::置換用ファイルを削除
del list_.txt
