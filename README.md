# MSKLibQREncode
A wrapper around zbar-tools. You may load the Linux stuff via

```Bash
sudo apt-get install zbar-tools
```

## Installation

You can load MSKLibQREncode using Metacello

```Smalltalk
Metacello new
  repository: 'github://feldti/MSKLibQREncode:main/repository';
  baseline: 'MSKLibQREncodeLibrary';
  load
```
