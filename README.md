# OpenFAAS functions
Various OpenFAAS functions to be deployed using the faas cli.  
OpenFaas home page: https://www.openfaas.com/  
Install OpenFAAS CLI: https://docs.openfaas.com/cli/install/  

## YouTube functions
Assorted functions for downloading a YouTube movie. It will download the highest quality available.

### youtubedl2
Based on https://github.com/faas-and-furious/youtube-dl. Unfortunately this version do not work (at least for me). It takes a very long time and then you get a 502 HTTP error. Updated it to use the of-watchdog and bash-streaming template. 

It is using the excellent python based youtube-dl utility behind the scenes:
https://github.com/ytdl-org/youtube-dl

Invoke using the FAAS CLI:
```
echo -n https://www.youtube.com/watch?v=aqz-KE-bpKQ | faas invoke youtubedl2 > big_buck_bunny.webm
```

Invoke using CURL:
```
curl https://your-openfaas.com/function/youtubedl2 -d "https://www.youtube.com/watch?v=aqz-KE-bpKQ" -o big_buck_bunny.webm
```

### youtube-filename
Get the original filename from the given YouTube URL or ID

Invoke using the FAAS CLI:
```
echo -n https://www.youtube.com/watch?v=aqz-KE-bpKQ | faas invoke youtube-filename

echo -n aqz-KE-bpKQ | faas invoke youtube-filename
```

Invoke using CURL:
```
curl https://your-openfaas.com/function/youtube-filename -d "https://www.youtube.com/watch?v=aqz-KE-bpKQ"

curl https://your-openfaas.com/function/youtube-filename -d "aqz-KE-bpKQ"
```

The result in this case will be:  
Big_Buck_Bunny_60fps_4K_-_Official_Blender_Foundation_Short_Film.webm

### Download a movie with the original filename
```
export YOUTUBE_URL=https://www.youtube.com/watch?v=aqz-KE-bpKQ
export DOWNLOAD_FILE=$(echo -n $YOUTUBE_URL | faas invoke youtube-filename)
echo -n $YOUTUBE_URL | faas invoke youtubedl2 > $DOWNLOAD_FILE
```
