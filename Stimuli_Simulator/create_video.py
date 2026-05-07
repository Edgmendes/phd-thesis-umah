import os

if not os.path.exists("videos"):
    os.mkdir("videos");

def create_video_with_ffmpeg(image_folder, output_video, frame_rate=30):
    #os.system(f"ffmpeg -framerate {frame_rate} -i {image_folder}/fig_%01d.png -c:v mpeg4 -pix_fmt yuv420p {output_video}")                   # LOW
    #os.system(f"ffmpeg -framerate {frame_rate} -i {image_folder}/fig_%01d.png -c:v libx264 -preset slow -crf 12 -pix_fmt yuv420p {output_video}")    # HIGH
    os.system(f"ffmpeg -framerate {frame_rate} -i {image_folder}/fig_%01d.png -c:v libx264 -preset veryslow -crf 0 -pix_fmt yuv444p {output_video}")     #

## TOP
image_folder = "./images_top"
output_video = "./videos/video_top.mp4"

create_video_with_ffmpeg(image_folder, output_video)

# ## SIDE
# image_folder = "./images_side"
# output_video = "./videos/video_side.mp4"

# create_video_with_ffmpeg(image_folder, output_video)