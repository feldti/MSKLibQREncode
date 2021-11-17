other
baseline: spec 
	<baseline>
	spec
		for: #'gemstone'
		do: [
			"Now the actual delivered packages"
			spec
				package: 'MSKLibQREncode' ;
				yourself.

			"Now the names for more specific loading"
			spec
				group: 'core' with: #('MSKLibQREncode');
				group: 'default' with: #('MSKLibQREncode');
				yourself
		]
