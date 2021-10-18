initialize
initialize

	super initialize.

	filename := nil.
	moduleSize := 3.
	correctionLevel := MSKLibQRToolOptions errorCorrectionLevelL.                  
	symbolVersion := MSKLibQRToolOptions symbolAuto.	
	marginsWidth := 4.
	pngDPI  := 75.
	graphicsFormat := MSKLibQRToolOptions formatPNG.	                  
	makeStructuredSymbols := false.
	assumeKanjiMode := false.
	enableMicroCode := false.
	foreground := nil.                 
	background := nil.
	qrToolFullPath := MSKLibQREncodeLibrary qrToolFullPath.
	text := ''
