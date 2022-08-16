.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8 -output Outputs/stage3_01_8.bmp -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8 -output Outputs/stage3_02_8.bmp -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8 -output Outputs/stage3_04_8.bmp -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8 -output Outputs/stage3_06_8.bmp -input Scenes/sponge.txt -size 128 128 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_01_64.bmp -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_02_64.bmp -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_04_64.bmp -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_06_64.bmp -input Scenes/sponge.txt -size 128 128 -samples 1

magick compare -metric mae Outputs\stage3_01_8.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp        Outputs\stage3diff_01_8.bmp
magick compare -metric mae Outputs\stage3_02_8.bmp Outputs_REFERENCE\all.txt_1024x1024x4_RaymarcherAss1.exe.bmp        Outputs\stage3diff_02_8.bmp
magick compare -metric mae Outputs\stage3_04_8.bmp Outputs_REFERENCE\cornell.txt_1024x1024x1_RayMarcherAss1.exe.bmp    Outputs\stage3diff_04_8.bmp
magick compare -metric mae Outputs\stage3_06_8.bmp Outputs_REFERENCE\sponge.txt_128x128x1_RaymarcherAss1.exe.bmp       Outputs\stage3diff_06_8.bmp
magick compare -metric mae Outputs\stage3_01_64.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp       Outputs\stage3diff_01_64.bmp
magick compare -metric mae Outputs\stage3_02_64.bmp Outputs_REFERENCE\all.txt_1024x1024x4_RaymarcherAss1.exe.bmp       Outputs\stage3diff_02_64.bmp
magick compare -metric mae Outputs\stage3_04_64.bmp Outputs_REFERENCE\cornell.txt_1024x1024x1_RayMarcherAss1.exe.bmp   Outputs\stage3diff_04_64.bmp
magick compare -metric mae Outputs\stage3_06_64.bmp Outputs_REFERENCE\sponge.txt_128x128x1_RaymarcherAss1.exe.bmp      Outputs\stage3diff_06_64.bmp

