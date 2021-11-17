services
qrContent
	"^<String | nil> the content of the QR image was written to stdout of the child process ... so reading this channels gives us the result"

	| stream |

	stream := ReadStream on: (process stdout readString: 4096).
	^stream nextLine
