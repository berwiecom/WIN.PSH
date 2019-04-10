$ErrorActionPreference = 'SilentlyContinue'    # https://serverfault.com/questions/336121/


	# PROGRAMM OneDrive
	
# explorer.exe $HOME\OneDrive
echo darija@
echo x!


	# PROGRAMM Powershell
	
# & %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
#   & C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe
#   & C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe G:\000.ams\start.ps1

echo "
	HowTo: Running Powershell
http://www.itprotoday.com/management-mobility/running-powershell-scripts-easy-1-2-3
https://ss64.com/ps/syntax-run.html
"

	# PROGRAMM Notepad++
	
# pushd "C:\Program Files (x86)\Notepad++\"
# & .\notepad++.exe E:\000.ams\start.ps1
# cp "$HOME\Desktop\ComparePlugin.dll" "C:\Program Files (x86)\Notepad++\" ; ls
# popd


	# SYNCING
echo "
	# CMD: Examples
http://powershelltutorial.net/FileSystem/Powershell-with-FileSystem-Copy-file

	# CMD: copy-item
Copy-Item –Recurse -Path C:\SOURCE_DIR -Filter *.jpg -Destination C:\TARGET_DIR
Copy-i    -rp            C:\SOURCE_DIR -fi     *.jpg -d           C:\TARGET_DIR

	# Exclude
$exclude = @('Thumbs.db','*-Log.csv','web.config','Logs/*')   # https://superuser.com/questions/359031/

	# CMD: ROBOCOPY
https://ss64.com/nt/robocopy.html
robocopy    SOURCE-DIR DESTINATION-DIR [FILES_TO_COPY] [options]
robocopy c:\SOURCE     d:\TARGET /S /XF *.doc *.xls /XD c:\EXCLUDED   # /S : Subfolders
robocopy   $SOURCE       $TARGET /S                 /XD   $EXCLUDED

	# Merging
https://www.adamtheautomator.com/copy-item-copying-files-powershell/


	# Loop, Schleifen, for each
http://powershelltutorial.net/FileSystem/Powershell-with-FileSystem-Copy-file
https://docs.microsoft.com/de-de/powershell/module/microsoft.powershell.core/about/about_foreach

foreach ($FILE in $FILES)
	{
		write-host $FILE.FullName
		Copy-Item  $FILE.FullName -Destination $DESTINATIONDIRECTORY 
	}
"

	# CLEANING
	
pushd $HOME\Desktop\ ; rm *.url ; rm *.lnk ; rm Internet* ; popd


	# SYNCING

echo "
#######################################
	# syncing inclusive

	# definitions
$FF_DESK="Desktop\prg.net..waterfox.portable"
$FF_PROFILE_DESK="Data\profile"
$DEVICES="E", "F", "G"
$FF_FILES="App", "WaterfoxPortable.exe", "WaterfoxPortable.Help.html"
$FF_CONFIG_FILES="places.sqlite", "prefs.js", "sessionstore.js"
mkdir $HOME\$FF_DESK\$FF_PROFILE_DESK 2>&1 | Out-Null

	# copy via robocopy
# foreach ($DEV in $DEVICES) { robocopy ${DEV}:\000.ams\prg.net..waterfox.portable\Data\places.sqlite $HOME\Desktop\ }

	# copy via copy-item
foreach ($DEV in $DEVICES) { 
 foreach ($FF_FILE in $FF_FILES) {
  Copy-Item -r ${DEV}:\000.ams\prg.net..waterfox.portable\${FF_FILE}             $HOME\$FF_DESK\                  2>&1 | Out-Null
 }
 foreach ($FF_CONFIG_FILE in $FF_CONFIG_FILES) {
  Copy-Item    ${DEV}:\000.ams\prg.net..waterfox.portable\Data\${FF_CONFIG_FILE} $HOME\$FF_DESK\$FF_PROFILE_DESK\ 2>&1 | Out-Null
 }
}

& $HOME\${FF_DESK}\WaterfoxPortable.exe

	# CLEANING
pushd $HOME\Desktop\ ; rm *.url ; 
rm *.lnk ; rm Internet* ; popd
#######################################"



	# syncing exclusive
	
# $SOURCE="F:\000.ams\prg.net..waterfox.portable"
# $TARGET="$HOME\Desktop\prg.net..waterfox.portable"
# $EXCLUDED = @("cache*", "Data1", "Data2", "Data3", "jumpListCache", "OfflineCache*", "safebrowsing*", "saved-telemetry-pings*", "storage*", "thumbnails")



	# SYNCING BACKKKKKKKKKK
echo "
$SOURCE="$HOME\Desktop\prg.net..waterfox.portable"
$TARGET="F:\000.ams\prg.net..waterfox.portable"
$EXCLUDED = @("cache*", "Data1", "Data2", "Data3", "jumpListCache", "OfflineCache*", "safebrowsing*", "saved-telemetry-pings*", "storage*", "thumbnails")
#robocopy c:\SOURCE d:\TARGET /S /XF *.doc *.xls /XD c:\EXCLUDED
 robocopy   $SOURCE   $TARGET /S                 /XD   $EXCLUDED
$HOME\Desktop\prg.net..waterfox.portable\WaterfoxPortable.exe"

echo "
################ back #################
foreach ($DEV in $DEVICES) { 
 foreach ($FF_CONFIG_FILE in $FF_CONFIG_FILES) {
  Copy-Item $HOME\$FF_DESK\$FF_PROFILE_DESK\${FF_CONFIG_FILE} ${DEV}:\000.ams\prg.net..waterfox.portable\Data\ 2>&1 | Out-Null
 }
}
#######################################"
