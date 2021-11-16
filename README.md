# MSKLibQREncode
A wrapper around zbar-tools. You may load the Linux stuff via

```Bash
sudo apt-get install zbar-tools
```

with these external programs you may create images containing QR codes and you may even read image files to get the content out of the QR code.

## How to use it

a) You have a link and want to create a png file, containting the QR code for that link

```Smalltalk
  | aMSKLibQRToolOptions |

  aMSKLibQRToolOptions := MSKLibQRToolOptions newPNGFor: 'www.schrievkrom.de/extfiles/public-smalltalk'  path: '/var/www/html/extfiles/test.png' .
  aMSKLibQRToolOptions
    moduleSize: 15 ;
		foreground: Color black ;
		background: Color white.

	MSKLibQREncodeLibrary qrToolCreateQRCode: aMSKLibQRToolOptions
```

b) You have a QR code (as png file) and want to get the link out of it:

```Smalltalk
  MSKLibQREncodeLibrary zbarReadQRCode: '/var/www/html/extfiles/test.png' 
```

## Installation

You can load MSKLibQREncode using Metacello

```Smalltalk
Metacello new
  repository: 'github://feldti/MSKLibQREncode:main/repository';
  baseline: 'MSKLibQREncodeLibrary';
  load
```
