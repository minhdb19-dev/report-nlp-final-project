@echo off
setlocal
echo =======================================================
echo Compiling ACL LaTeX Paper with MiKTeX...
echo =======================================================

set "MIKTEX_PATH=C:\Users\KingSpec Official\AppData\Local\Programs\MiKTeX\miktex\bin\x64"
set "PATH=%MIKTEX_PATH%;%PATH%"

echo [1/4] Running pdflatex (Pass 1)...
pdflatex.exe -interaction=nonstopmode -enable-installer main.tex > nul

echo [2/4] Running bibtex...
bibtex.exe main > nul

echo [3/4] Running pdflatex (Pass 2)...
pdflatex.exe -interaction=nonstopmode -enable-installer main.tex > nul

echo [4/4] Running pdflatex (Pass 3 - Final)...
pdflatex.exe -interaction=nonstopmode -enable-installer main.tex > nul

:: Clean up auxiliary files automatically
del /f /q main.aux main.bbl main.blg main.log main.out 2>nul

if exist main.pdf (
    echo =======================================================
    echo Compilation SUCCESS! Clean output: main.pdf
    echo =======================================================
    start main.pdf
) else (
    echo =======================================================
    echo Compilation FAILED.
    echo =======================================================
)
