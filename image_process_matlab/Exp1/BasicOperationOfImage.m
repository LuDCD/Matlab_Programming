clc;clear all;
%% 1图像的反转显示
% 命令格式：
% I=imread('文件名');
% JJ=imadjust(I,[0 1],[1 0]);
% imshow(JJ,[])
% 图像的反转类似于照片的底片，将灰度值为 i 的像素点按 255-i(二值图像按1-i)显示。
% JJ 就是得到的反转图像。
I=imread('./Exp1_image/I2.bmp');
JJ=imadjust(I,[0 1],[1 0]);
imshow(I,[]);
figure;
imshow(JJ,[])

%% 2图像直方图
% 图像直方图和图像直方图均衡化的概念见书上 3.2 节。
% 命令格式
% Image=imread('输入图像名');
% imhist(Image);

Image=imread('./Exp1_image/I4.bmp');
imhist(Image);

%% 3图像灰度的变换
% 命令格式
% Image = imread('输入图像名');
% Image = g(Image)
% 通过 Image = g(Image)的语句可以实现对图像每个像素值的 g 变换，即
% 对于所有的像素[I,J]
% Image[I,J]=g(Image[I,J])
clc;clear all;
Image=imread('./Exp1_image/I4.bmp');
Image=0.5*double(Image);
imshow(Image);
imshow(uint8(Image));
figure;
imhist(Image)

%% 4直方图均衡化
% 直方图均衡化是图像增强的一个重要方法，人们已经提出了很多直方图均
% 衡化和规定化的算法，其中基于累积分布函数的算法最为经典。Histeq 命令就是
% 基于这种经典的算法。
% 命令格式：
% Image=imread('输入图像名');
% Out_Image = histeq(Image);
% Out_Image 为均衡化后的图像。

clc;clear all;
Image=imread('./Exp1_image/I20_256.bmp');
Out_Image = histeq(Image);
imshow(Out_Image);

%% 5结果比较
% 我们将 2）3）4）结合使用，并进行比较，为了便于观察直方图均衡化前后
% 图像的对比度的变化，先产生一幅质量较差（偏暗或者偏亮或灰度值集中）的图
% 像，均衡化后，原图像的对比度得到了增强，原图像的直方图相应地变得平坦，
% 灰度值均匀地分布在 0～255。
% 命令格式：
% hist_eq('图像文件名');
% 我们默认产生较差质量图像的函数为
% u'(I,J)=128+u(I,J)/4
% 其中 u'(I,J),u(I,J)分别指某原图像和差质量图像在像素(I,J)处的灰度值。
hist_eq('./Exp1_image/I13.bmp')