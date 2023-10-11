# Generate a full LaTeX academic paper format by dragging and dropping a text file that contains the LaTeX markdown

@echo off
:: Check for argument
IF "%~1"=="" (
    echo Usage: Drag and drop a text file containing LaTeX code onto this script.
    pause
    exit /b
)

:: Copy the text file to a .tex file
copy "%~1" document.tex

:: Compile the .tex file to produce a PDF
pdflatex document.tex

:: Open the PDF
start document.pdf
