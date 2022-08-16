.\Release\Stage1.exe -runs 1 -threads 16 -output Outputs/stage1_01.bmp -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\Stage1.exe -runs 1 -threads 16 -output Outputs/stage1_04.bmp -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\Stage1.exe -runs 1 -threads 16 -output Outputs/stage1_06.bmp -input Scenes/sponge.txt -size 128 128 -samples 1
									  
magick compare -metric mae Outputs\stage1_01.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp       Outputs\stage1diff_01.bmp
magick compare -metric mae Outputs\stage1_04.bmp Outputs_REFERENCE\cornell.txt_1024x1024x1_RayMarcherAss1.exe.bmp   Outputs\stage1diff_04.bmp
magick compare -metric mae Outputs\stage1_06.bmp Outputs_REFERENCE\sponge.txt_128x128x1_RaymarcherAss1.exe.bmp      Outputs\stage1diff_06.bmp

