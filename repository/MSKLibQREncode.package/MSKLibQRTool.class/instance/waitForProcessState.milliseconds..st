services
waitForProcessState: maxCount milliseconds: milliseconds
	"wait for the process"
	| currentCounter |

	currentCounter := 0.

	"so this is the attempt to reap a possible zombie process"
	[self process childStatus isNil and: [ currentCounter < maxCount ]] whileTrue: [
		currentCounter := currentCounter + 1.
		(Delay forMilliseconds: milliseconds) wait
	].

	^self process childStatus
