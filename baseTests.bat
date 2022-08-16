.\Release\RaymarcherAss1.exe -output Outputs/base_01.bmp -input Scenes/all.txt -size 1024 1024 -samples 1
.\Release\RaymarcherAss1.exe -output Outputs/base_02.bmp -input Scenes/all.txt -size 1024 1024 -samples 4
.\Release\RaymarcherAss1.exe -output Outputs/base_03.bmp -input Scenes/all.txt -size 500 300 -samples 1
.\Release\RaymarcherAss1.exe -output Outputs/base_04.bmp -input Scenes/cornell.txt -size 1024 1024 -samples 1
.\Release\RaymarcherAss1.exe -output Outputs/base_05.bmp -input Scenes/5000spheres.txt -size 240 135 -samples 1
.\Release\RaymarcherAss1.exe -output Outputs/base_06.bmp -input Scenes/sponge.txt -size 128 128 -samples 1

magick compare -metric mae Outputs\base_01.bmp Outputs_REFERENCE\all.txt_1024x1024x1_RaymarcherAss1.exe.bmp Outputs\basediff_01.bmp
magick compare -metric mae Outputs\base_02.bmp Outputs_REFERENCE\all.txt_1024x1024x4_RaymarcherAss1.exe.bmp Outputs\basediff_02.bmp
magick compare -metric mae Outputs\base_03.bmp Outputs_REFERENCE\all.txt_500x300x1_RaymarcherAss1.exe.bmp Outputs\basediff_03.bmp
magick compare -metric mae Outputs\base_04.bmp Outputs_REFERENCE\cornell.txt_1024x1024x1_RayMarcherAss1.exe.bmp Outputs\basediff_04.bmp
magick compare -metric mae Outputs\base_05.bmp Outputs_REFERENCE\5000spheres.txt_240x135x1_RaymarcherAss1.exe.bmp Outputs\basediff_05.bmp
magick compare -metric mae Outputs\base_06.bmp Outputs_REFERENCE\sponge.txt_128x128x1_RaymarcherAss1.exe.bmp Outputs\basediff_06.bmp
