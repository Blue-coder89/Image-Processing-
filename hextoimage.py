from PIL import Image
import os
dir=os.getcwd()
def hextoimg(width,height,location):
    f=open("output.hex","r")
    newimg=Image.new("RGB",(width,height))
    for i in range(height-3):
            for j in range(width):
                a=int(f.readline(),16)
                b=int(f.readline(),16)
                c=int(f.readline(),16)
                newimg.putpixel((j,i),(a,b,c))
    newimg.save(location)
file = open('dimensions.hex', 'r')
w = int(file.readline(),16)
h = int(file.readline(),16)
hextoimg(w,h,"processed_image.png")