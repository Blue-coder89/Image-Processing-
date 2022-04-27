from PIL import Image
import os
dir=os.getcwd()
def imgtohex(location):
    f=open("testimage.hex","w+")
    im = Image.open(location, 'r')
    width, height = im.size
    pixel_values = list(im.getdata())
    for i in range(height):
        for j in range(width):
            f.write(hex(pixel_values[i*width+j][0])[2:])
            f.write('\n')
            f.write(hex(pixel_values[i*width+j][1])[2:])
            f.write('\n')
            f.write(hex(pixel_values[i*width+j][2])[2:])
            f.write('\n')
    f.close()
    f=open("dimensions.hex","w")
    f.write(hex(width)[2:]+"\n"+hex(height)[2:])
    f.close()
    return((width,height))
w,h = imgtohex("C:\\Users\\HP\\Downloads\\Final Project\\parrot.jpg")