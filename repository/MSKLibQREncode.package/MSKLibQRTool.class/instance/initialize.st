initialize
initialize

	super initialize.

	filename := nil.
	moduleSize := 3.
	correctionLevel := self class errorCorrectionLevelL.                  
	symbolVersion := self class symbolAuto.	
	marginsWidth := 4.
	pngDPI  := 75.
	graphicsFormat := self class formatPNG.	                  
	makeStructuredSymbols := false.
	assumeKanjiMode := false.
	enableMicroCode := false.
	foreground := Color black.                 
	background := Color white.
	text := ''.
	debug := false.
	msWait := 10.
	msWaitLoopCounter := 10.
