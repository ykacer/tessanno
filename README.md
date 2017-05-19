# Create Pascal-VOC xml files from .uzn annotation files

We propose here a simple bash script that creates Pascal-VOC xml files from .uzn annotation file.
Thus, these xml files could be use for further text detection purpose.

## .uzn file

These file simply describe bounding boxes of interest in an image. There are in the form of integer values that correpond
to pixel localization.
Each line describes a single bounding box.

`x1 y1 w1 h1

x2 y2 w2 h2
...`

For each .uzn file, the corresponding .tif image should be present in same folder with same name.

## Examples from [ISRI evaluation datasets](https://code.google.com/archive/p/isri-ocr-evaluation-tools/downloads?page=1)

### Downaload and detar ISRI datasets

`mkdir unlv

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/isri-ocr-evaluation-tools/spn.3B.tar.gz

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/isri-ocr-evaluation-tools/news.3B.tar.gz

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/isri-ocr-evaluation-tools/bus.3B.tar.gz

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/isri-ocr-evaluation-tools/mag.3B.tar.gz
 
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/isri-ocr-evaluation-tools/doe3.3B.tar.gz

tar -xzvf spn.3B.tar.gz -C unlv

tar -xzvf news.3B.tar.gz -C unlv

tar -xzvf bus.3B.tar.gz -C unlv

tar -xzvf mag.3B.tar.gz -C unlv

tar -xzvf doe3.3B.tar.gz -C unlv`

### Create destination folder and extract xml files
`mkdir annotations

./runxmlannotator unlv annotations`

