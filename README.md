# OpenFAAS functions
Assorted functions for downloading a YouTube movie. It will download the highest quality available.

## youtubedl2
Based on https://github.com/faas-and-furious/youtube-dl. Unfortunately this version do not work (at least for me). It takes a very long time and then you get a 502 HTTP error. Updated it to use the of-watchdog and bash-streaming template. 

It is using the great python based youtube-dl utility behind the scenes:
https://github.com/ytdl-org/youtube-dl

Invoke using the FAAS CLI:
```echo -n https://www.youtube.com/watch?v=aqz-KE-bpKQ | faas invoke youtubedl2 > movie.mp4```

## youtube-filename
Get a filename from the given YouTube URL or ID

Invoke using the FAAS CLI:
```
echo -n https://www.youtube.com/watch?v=aqz-KE-bpKQ | faas invoke youtube-filename

echo -n aqz-KE-bpKQ | faas invoke youtube-filename
```
The result in this case will be:  
Big_Buck_Bunny_60fps_4K_-_Official_Blender_Foundation_Short_Film.webm

## Download a movie with the original filename
```
export YOUTUBE_URL=https://www.youtube.com/watch?v=aqz-KE-bpKQ
export DOWNLOAD_FILE=$(echo -n $YOUTUBE_URL | faas invoke youtube-filename)
echo -n $YOUTUBE_URL | faas invoke youtubedl2 > $DOWNLOAD_FILE
```
