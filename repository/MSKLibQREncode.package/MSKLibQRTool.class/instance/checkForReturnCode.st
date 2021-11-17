services
checkForReturnCode
	"Throws an exception if the expected childStatus is not an expected one"
	
	(self process notNil and:[ self process childStatus ~= 0]  ) 
		ifTrue: [ ExLibQR new info: 'rc = ',self process childStatus asString ; signal ].
