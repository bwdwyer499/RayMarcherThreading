.\Release\Stage1.exe -runs 1 -threads 8 -output Outputs/stage1_03.bmp -input Scenes/all.txt -size 500 300 -samples 1 -debugProgress
.\Release\Stage1.exe -runs 1 -threads 8 -output Outputs/stage1_05.bmp -input Scenes/5000spheres.txt -size 240 135 -samples 1 -debugProgress

.\Release\Stage1.exe -runs 1 -threads 3   -input Scenes/all.txt -size 1024 1024 -samples 1 -debugProgress  -output Outputs/all.txt_1024x1024x1_Stage1.exe_3.bmp 
.\Release\Stage1.exe -runs 1 -threads 5   -input Scenes/all.txt -size 1024 1024 -samples 1 -debugProgress  -output Outputs/all.txt_1024x1024x1_Stage1.exe_5.bmp
.\Release\Stage1.exe -runs 1 -threads 6   -input Scenes/all.txt -size 1024 1024 -samples 1 -debugProgress  -output Outputs/all.txt_1024x1024x1_Stage1.exe_6.bmp
.\Release\Stage1.exe -runs 1 -threads 7   -input Scenes/all.txt -size 1024 1024 -samples 1 -debugProgress  -output Outputs/all.txt_1024x1024x1_Stage1.exe_7.bmp
.\Release\Stage1.exe -runs 1 -threads 513 -input Scenes/all.txt -size 1024 1024 -samples 1 -debugProgress  -output Outputs/all.txt_1024x1024x1_Stage1.exe_513.bmp

magick compare -metric mae Outputs\stage1_03.bmp Outputs_REFERENCE\all.txt_500x300x1_RaymarcherAss1.exe.bmp         Outputs\stage1diff_03.bmp
magick compare -metric mae Outputs\stage1_05.bmp Outputs_REFERENCE\5000spheres.txt_240x135x1_RaymarcherAss1.exe.bmp Outputs\stage1diff_05.bmp

magick compare -metric mae Outputs\all.txt_1024x1024x1_Stage1.exe_3.bmp   Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\stage1_tests2_test1a.bmp
magick compare -metric mae Outputs\all.txt_1024x1024x1_Stage1.exe_5.bmp   Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\stage1_tests2_test1b.bmp
magick compare -metric mae Outputs\all.txt_1024x1024x1_Stage1.exe_6.bmp   Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\stage1_tests2_test1c.bmp
magick compare -metric mae Outputs\all.txt_1024x1024x1_Stage1.exe_7.bmp   Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\stage1_tests2_test1d.bmp
magick compare -metric mae Outputs\all.txt_1024x1024x1_Stage1.exe_513.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\stage1_tests2_test1e.bmp
