#!/bin/bash
# File:        runxmlannotator.sh
# Description: Script to create PascalVOC-like bouding-box xml annotation file from ISRI .uzn file.
#	       .uzn is a text file containing a bounding-box at each line, in the form of: x y w h.
#	       The first parameter is the source folder. This folder should contain a text file "pages" containing
#	       at each line, the uzn file name (without extension) and its subdirectory.
#	       See unlv ISRI datasets for examples (https://code.google.com/archive/p/isri-ocr-evaluation-tools/downloads?page=1)
# Author:      Youcef KACER
# Created:     Thu May 18 22:22:00 PDT 2017
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ $# -ne 2 ]
then
   echo "Usage:$0 datadir destination-folder"
   exit 1
fi

imdir="$1"
vid="$2"
testsets="bus.3B doe3.3B mag.3B news.3B spn.3B"

annotator=./tessanno/annotator
for set in $testsets
do
    if [ -r $imdir/$set/pages ]
    then
	while read page dir
	do
		if [ "$dir" ]
		then
			srcdir="$imdir/$set/$dir"
		else
			srcdir="$imdir/$set"
		fi
		database=$set
		ownername=$imdir
		size=$(identify $srcdir/$page.tif | cut -d' ' -f3)
		width=$(echo $size | cut -dx -f1)
		height=$(echo $size | cut -dx -f2)
		echo $srcdir/$page.uzn
		echo $width $height
		$annotator -v f="$page" -v d="$database" o=$ownername fo=$srcdir w=$width h=$height $srcdir/$page.uzn > $vid/$page.xml
	done <$imdir/$set/pages
    fi
done
