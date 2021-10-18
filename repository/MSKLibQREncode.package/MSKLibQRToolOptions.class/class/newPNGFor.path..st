instance creation
newPNGFor: aString path: filePath

	^self new initialize
		text: aString ;
		filename: filePath ;
		yourself
