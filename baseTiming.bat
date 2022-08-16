@ECHO OFF
set runs=%1
if "%1"=="" set runs=3
@ECHO ON
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/all.txt -size 500 300 -samples 1
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/5000spheres.txt -size 240 135 -samples 1
.\Release\RaymarcherAss1.exe -runs %runs% -input Scenes/sponge.txt -size 128 128 -samples 1
