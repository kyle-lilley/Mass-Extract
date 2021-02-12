for /F %%I IN ('dir /b /s *.zip *.rar')
DO (
"C:\Program Files\7-Zip\7z.exe" x -o"%%~nI" "%%I"
)
PAUSE
