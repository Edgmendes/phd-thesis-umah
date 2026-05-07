# -*- coding: utf-8 -*-
"""
Created on Mon Sep 15 14:56:57 2025

@author: Eduardo_Mendes
"""

import os
import math
from PIL import Image
from natsort import natsorted

# Pasta onde estão os .png
folder = "images_top_SP/"  # muda para a tua pasta
files = [f for f in os.listdir(folder) if f.endswith(".png")]

files = natsorted(files);

files = files[0:len(files)-1]

num_imgs = len(files)

# Calcula linhas e colunas para mosaico aproximado quadrado
cols = math.ceil(math.sqrt(num_imgs))
rows = math.ceil(num_imgs / cols)


imgs = [Image.open(folder+f) for f in files]
w, h = imgs[0].size
rows, cols = rows, cols

mosaic = Image.new("RGB", (cols*w, rows*h),color="white")
for i, img in enumerate(imgs):
    r, c = divmod(i, cols)
    mosaic.paste(img, (c*w, r*h))

mosaic.save("mosaic/mosaic.png")