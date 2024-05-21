# convert an input image to a binary array suitable for the LED matrix
from PIL import Image
import numpy as np
import sys

def convert_image_to_abgr_array(image_path):
    # open the image file
    img = Image.open(image_path).convert("RGBA")

    # get image data as numpy array
    data = np.array(img)

    # prepare array to hold image
    abgr_array = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint32)

    # convert RGBA to ABGR
    for y in range(data.shape[0]):
        for x in range(data.shape[1]):
            r, g, b, a = data[y,x]
            abgr = (a<< 24) | (b << 16) | (g << 8) | r
            abgr_array[y, x] = abgr
    return abgr_array

if __name__ == '__main__':
    filename = sys.argv[1]
    abgr = convert_image_to_abgr_array(filename)
    abgr.tofile('output.bin')
