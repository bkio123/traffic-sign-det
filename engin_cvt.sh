#!/bin/bash

dirname=${PWD}

echo 'generate .wts from pytorch with .pt' 
cp best.pt ./yolov5
cp ./tensorrtx/yolov5/gen_wts.py ./yolov5
cd ./yolov5
echo "python gen_wts.py -w best.pt -o yolov5s.wts"
echo "file best.wts will be generated."
/usr/bin/python3 gen_wts.py -w best.pt -o best.wts

cd ${dirname}
cp ./yolov5/best.wts ./tensorrtx/yolov5/build

# For example yolov5s
cd ${dirname}
cd ./tensorrtx/yolov5/build
sudo ./yolov5 -s best.wts best.engine s

cp best.engine /home/nano/workspace/models/traffic-sign-det/
cp libmyplugins.so /home/nano/workspace/models/traffic-sign-det/
cp best.engine ${dirname}
cp libmyplugins.so ${dirname}
