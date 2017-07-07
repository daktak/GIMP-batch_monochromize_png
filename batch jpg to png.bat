@echo off
for /r %%x in (*.jpg) do (
   convert "%%~x" "%%~nx.png"
)