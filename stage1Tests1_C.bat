.\Release\Stage1.exe -runs 3 -threads 8 -output Outputs/stage1_03.bmp -input Scenes/all.txt -size 500 300 -samples 1 -debugProgress
.\Release\Stage1.exe -runs 3 -threads 8 -output Outputs/stage1_05.bmp -input Scenes/5000spheres.txt -size 240 135 -samples 1 -debugProgress
						   
.\Release\Stage1.exe -runs 3 -threads 1   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_1.bmp 
.\Release\Stage1.exe -runs 3 -threads 2   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_2.bmp 
.\Release\Stage1.exe -runs 3 -threads 3   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_3.bmp 
.\Release\Stage1.exe -runs 3 -threads 4   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_4.bmp 
.\Release\Stage1.exe -runs 3 -threads 5   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_5.bmp
.\Release\Stage1.exe -runs 3 -threads 6   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_6.bmp
.\Release\Stage1.exe -runs 3 -threads 7   -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_7.bmp
.\Release\Stage1.exe -runs 3 -threads 13  -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_16.bmp
.\Release\Stage1.exe -runs 3 -threads 32  -input Scenes/sponge.txt -size 128 128 -samples 1 -debugProgress  -output Outputs/sponge.txt_128x128x1_Stage1.exe_32.bmp
									  
magick compare -metric mae Outputs\stage1_01.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp       Outputs\stage1diff_01.bmp
magick compare -metric mae Outputs\stage1_04.bmp Outputs_REFERENCE\cornell.txt_1024x1024x1_RayMarcherAss1.exe.bmp   Outputs\stage1diff_04.bmp
magick compare -metric mae Outputs\stage1_06.bmp Outputs_REFERENCE\sponge.txt_128x128x1_RaymarcherAss1.exe.bmp      Outputs\stage1diff_06.bmp

