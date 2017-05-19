import numpy as np
import cv2
import sys
import os

imagefile = sys.argv[1]
uznfile = sys.argv[2]
dest_folder = sys.argv[3]

boxes = np.loadtxt(uznfile,usecols=[0,1,2,3],dtype=np.uint16)
I = cv2.cvtColor(cv2.imread(imagefile,0),cv2.COLOR_GRAY2BGR)
if len(boxes.shape)>1:
    for b in boxes:
        cv2.rectangle(I,(b[0],b[1]),(b[2]+b[0],b[3]+b[1]),(255,0,0),1)
else:
    b = boxes
    cv2.rectangle(I,(b[0],b[1]),(b[2]+b[0],b[3]+b[1]),(255,0,0),1)
cv2.imwrite(os.path.join(dest_folder,os.path.basename(imagefile)[:-4]+"_uzn.tif"),I);

