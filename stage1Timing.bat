@ECHO OFF
set runs=%1
if "%1"=="" set runs=3
@ECHO ON
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/all.txt -size 500 300 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/5000spheres.txt -size 240 135 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 1  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 2  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 3  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 4  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 5  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 6  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 7  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 8  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 16 -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage1.exe -runs %runs% -threads 32 -input Scenes/sponge.txt -size 128 128 -samples 1
