@echo off
SET /P input=GIF name:
ffmpeg -i %input%.gif -c:v libx265 -preset veryslow -crf 0 -pix_fmt yuv420p10le -x265-params "log-level=2" -movflags +faststart -pass 1 -an -f mp4 %input%_TMP1.mp4 && ffmpeg -i %input%.gif -c:v libx265 -preset veryslow -crf 0 -pix_fmt yuv420p10le -x265-params "log-level=2" -movflags +faststart -pass 2 %input%.mp4
DEL %input%_TMP1.mp4
DEL *.log
pause
