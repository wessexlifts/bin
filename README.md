# Scripts

These are singular purpose and intended to only be used by their creator.

To see more general use scripts for all users, see [this
repository](https://github.com/wessexlifts/all-users).


## `marketing-images.bat`

A batch script deployed in main image folder to rename images nicely (mainly remove the brackets and spaces from Windows default bulk renaming). Requires ImageMagick to resize the images and store them in the lq (low quality) folder. Folder structure is as follows;

```
	scripts
	|   marketing-images.bat
	|   
	+---EG
	|   +---final
	|   |   +---lq
	|   |   |       EG-1.jpg
	|   |   |       
	|   |   \---oq
	|   |           EG-1.jpg
	|   |           
	|   \---raw
	|           Unedited-EG (1).jpg
	etc.
```

## `file-extension-normalize.sh`

Shell script to normalize the file extensions in a folder; this is
mainly used to rename files from uppercase to
lowercase (`.JPG` to `.jpg`). JPEG is the default
filetype chosen, as we have a lot of uppercase JPG
extensions.

## `for-hootsuite.sh`

Another shell script to crop, minify, watermark,
and try and make all images comply with
specifications required by
[Hootsuite](https://www.hootsuite.com/) uploading.

## More Information

If you know what you're doing, feel free to make use of any part of these
scripts. 
