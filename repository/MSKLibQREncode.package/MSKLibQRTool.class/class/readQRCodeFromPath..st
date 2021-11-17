instance creation
readQRCodeFromPath: filePath

	^self new initialize
		filename: filePath ;
		qrToolFullPath: self defaultZBarImgPath ;
		yourself
