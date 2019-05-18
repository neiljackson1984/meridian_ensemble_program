buildDirectory=build
# buildDirectory:=$(shell mktemp --directory --dry-run)
inputFile=poster.tex
texOutputFile=${buildDirectory}/$(notdir $(basename ${inputFile})).pdf
#this is what TexStudio view by default.
viewableOutputFile=$(basename ${inputFile}).pdf

# ${viewableOutputFile}:${texOutputFile} 
	# #cp "${texOutputFile}" "${viewableOutputFile}"

${texOutputFile}: ${inputFile} ${buildDirectory}
	# latexmk -xelatex  -gg --interaction=nonstopmode --aux-directory="$(shell cygpath --windows $(abspath ${buildDirectory}))" --output-directory="$(shell cygpath --windows $(abspath $(dir ${texOutputFile})))" -jobname="$(basename $(notdir ${texOutputFile}))" "$(shell cygpath --windows $(abspath ${inputFile}))"
	latexmk -xelatex  -gg --interaction=nonstopmode --aux-directory="$(shell cygpath --windows $(abspath ${buildDirectory}))" --output-directory="$(shell cygpath --windows $(abspath $(dir ${texOutputFile})))" -jobname="$(basename $(notdir ${texOutputFile}))" "${inputFile}"
	# latexmk -xelatex  -c --interaction=nonstopmode --aux-directory="$(shell cygpath --windows $(abspath ${buildDirectory}))" --output-directory="$(shell cygpath --windows $(abspath $(dir ${texOutputFile})))" -jobname="$(basename $(notdir ${texOutputFile}))" "${inputFile}"
	# latexmk -xelatex  -c --interaction=nonstopmode --aux-directory="$(shell cygpath --windows $(abspath ${buildDirectory}))" --output-directory="$(shell cygpath --windows $(abspath $(dir ${texOutputFile})))" -jobname="$(basename $(notdir ${texOutputFile}))" "$(shell cygpath --windows $(abspath ${inputFile}))"
	# latexmk -xelatex  -c --interaction=nonstopmode --aux-directory="$(shell cygpath --windows $(abspath ${buildDirectory}))" --output-directory="$(shell cygpath --windows $(abspath $(dir ${texOutputFile})))" -jobname="$(basename $(notdir ${texOutputFile}))" "${inputFile}"


${buildDirectory}:
	echo making the build directory: ${buildDirectory}
	mkdir --parents ${buildDirectory}
	
# .SILENT:
	

