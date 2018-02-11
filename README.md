# TensorRT App Template

A TensorRT Application initial template makes your TensorRT code compiled more easier

## Run demo

 1. ```git clone https://github.com/whitelok/tensorrt-app-template.git```
 2. ```cd tensorrt-app-template```
 3. Download [caffe model](https://drive.google.com/open?id=1u0ZQamWEm_FYqPuzPqw9oWERj0PJCY1x) to data/
 4. Compile demo: ```make```
 5. ```cd bin```
 6. Run demo: ```sudo ./app```
 7. Convert ppm image to jpg image: ```cd ..; find bin -name "*.ppm" -exec python tools/convert_ppm_to_jpg.py {} \;``` 

![Main page demo](https://github.com/whitelok/tensorrt-app-template/blob/master/_resources/imgs/main-page-demo.PNG)


## Using demo with your code

 1. Copy all your .cpp file to src
 2. Copy all your .h file to include
 3. Compile in folder root path
 4. All binary file is in bin
 

