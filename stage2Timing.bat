@ECHO OFF
set runs=%1
if "%1"=="" set runs=3
@ECHO ON
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/all.txt -size 500 300 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/5000spheres.txt -size 240 135 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 1  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 2  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 3  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 4  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 5  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 6  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 7  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 8  -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 16 -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage2.exe -runs %runs% -debugProgress -threads 32 -input Scenes/sponge.txt -size 128 128 -samples 1
                                  
                                  
                                  