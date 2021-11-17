# MSKLibQREncode
A wrapper around zbar-tools. You may load the Linux stuff via

```Bash
sudo apt-get install zbar-tools
```

with these external programs you may create images containing QR codes and you may even read image files to get the content out of the QR code.

## How to use it

a) You have a link and want to create a png file, containing the QR code for that link

```Smalltalk
 | aMSKLibQRTool childState |

  aMSKLibQRTool := MSKLibQRTool newPNGFor: 'www.spiegel.de'  path: '/var/www/html/test.png' .
  childState := aMSKLibQRTool
                  moduleSize: 15 ;
                  checkForToolPath ;
                  removeOutputFile ;
                  createQRCode ;
                  waitForProcessState ;
                  checkForOutputFile ;
                  checkForReturnCode
```
a.2) Or as an alternative, which does all the checkings automatically:

```Smalltalk
  | aMSKLibQRTool childState |

  aMSKLibQRTool := MSKLibQRTool newPNGFor: 'www.spiegel1.de'  path: '/var/www/html/test.png' .
  childState := aMSKLibQRTool
                  moduleSize: 15 ;
                  createQRCodeAndWaitForResult
```

b) You have a QR code (as png file) and want to get the link out of it:

```Smalltalk
  | aMSKLibQRTool qrInformation |
	aMSKLibQRTool := MSKLibQRTool readQRCodeFromPath: '/var/www/html/test.png' .
	qrInformation := 
	      aMSKLibQRTool
		readQRCode ;
		waitForProcessState ;
		checkForReturnCode ;
		qrContent
```


b.2) Or an alternative (with all checkings)

```Smalltalk
  | aMSKLibQRTool |
  	aMSKLibQRTool := MSKLibQRTool readQRCodeFromPath: '/var/www/html/test.png' .
		qrInformation :=  aMSKLibQRTool readQRCodeAndWaitForResult
```

In case of any errors exceptions should be thrown ...

## Installation

You can load MSKLibQREncode using Metacello

```Smalltalk
Metacello new
  repository: 'github://feldti/MSKLibQREncode:main/repository';
  baseline: 'MSKLibQREncodeLibrary';
  load
```
