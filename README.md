# `ffmpeg-fetcher`
This will download https://ffmpeg.zeranoe.com/builds/win64/shared/ffmpeg-latest-win64-shared.zip, extract it, and install it to `C:\opt\bin\ffmpeg`.

## Steps
- Create `C:\opt\` (Make a pull request if you want to add command-line options or something. It's fine for my uses and I don't care.)
- Install 7-Zip if you don't have it already. Make sure it's the right arch because `ffmpeg-fetcher` looks for it at `C:\Program Files\7-Zip\7zG.exe`.
- After install has finished, add `C:\opt\ffmpeg\bin` to your path (only need to do this part one time, obviously).
