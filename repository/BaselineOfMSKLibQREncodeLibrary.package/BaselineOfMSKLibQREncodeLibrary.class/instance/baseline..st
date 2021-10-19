other
baseline: spec 
	<baseline>
	spec
		for: #'gemstone'
		do: [
			"First the prerequisites"
			spec
				baseline: 'MSKPlatformExtension'	
				with: [ 
					spec
						loads: #('MSKPlatformExtension');
						repository: 'github://feldti/MSKPlatformExtension:main/repository' ];
				yourself.

			"Now the actual delivered packages"
			spec
				package: 'MSKLibQREncode';
				yourself.

			"Now the names for more specific loading"
			spec
				group: 'default' with: #('MSKLibQREncode');
				yourself
		]
