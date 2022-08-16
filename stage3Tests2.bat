.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8  -output Outputs/stage3_03_8.bmp  -input Scenes/all.txt -size 500 300 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 8  -output Outputs/stage3_05_8.bmp  -input Scenes/5000spheres.txt -size 240 135 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_03_64.bmp -input Scenes/all.txt -size 500 300 -samples 1
.\Release\Stage3.exe -runs 1 -threads 8 -blockSize 64 -output Outputs/stage3_05_64.bmp -input Scenes/5000spheres.txt -size 240 135 -samples 1

magick compare -metric mae Outputs\stage3_03_8.bmp  Outputs_REFERENCE\all.txt_500x300x1_RaymarcherAss1.exe.bmp         Outputs\stage3diff_03_8.bmp
magick compare -metric mae Outputs\stage3_05_8.bmp  Outputs_REFERENCE\5000spheres.txt_240x135x1_RaymarcherAss1.exe.bmp Outputs\stage3diff_05_8.bmp
magick compare -metric mae Outputs\stage3_03_64.bmp Outputs_REFERENCE\all.txt_500x300x1_RaymarcherAss1.exe.bmp         Outputs\stage3diff_03_64.bmp
magick compare -metric mae Outputs\stage3_05_64.bmp Outputs_REFERENCE\5000spheres.txt_240x135x1_RaymarcherAss1.exe.bmp Outputs\stage3diff_05_64.bmp

