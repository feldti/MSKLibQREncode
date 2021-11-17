instance creation
newPNGFor: aString path: filePath

	^self new initialize
		text: aString ;
		filename: filePath ;
		qrToolFullPath: self defaultQRToolFullPath ;
		yourself
