# Marketing Department Scripts

For scripts for all users, see [this
repository](https://github.com/wessexlifts/all-users).

## `marketing-images.bat`

A DOSBatch script deployed in main images folder to rename images nicely (mainly remove the brackets and spaces from Windows default bulk renaming). Requires [ImageMagick](https://imagemagick.org/) to resize the images and store them in the lq (low quality) folder. Folder structure is as follows;

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
...
```

## `file-extension-normalize.sh`

A shell script (tested with [Cygwin](https://www.cygwin.com/) to normalize the file extensions in a folder; this is
mainly used to rename files from uppercase to
lowercase (`.JPG` to `.jpg`). JPEG is the default
filetype chosen, as we have a lot of uppercase JPG
extensions.

## `for-hootsuite.sh` - WIP

Another shell script to crop, minify, watermark,
and make all images comply with
specifications required by
[Hootsuite](https://www.hootsuite.com/) uploading.

## More Information

Use any part of these scripts. Get in contact for
more information on them.
