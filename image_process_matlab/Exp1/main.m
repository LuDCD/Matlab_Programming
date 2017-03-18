clc;clear all;

% Image=imread('./Exp1_image/I13.bmp');
% imshow(Image,[]);

% Image=imread('./Exp1_image/C4.bmp');
% imshow(Image,[]);

% RGB_heft('./Exp1_image/C4.bmp');

% Image=imread('./Exp1_image/I2.bmp');
% [height width]=size(Image)

% get_pixel('./Exp1_image/I5.bmp', 21,46)

%% 2.3  电影分解与显示 可以分小节，按 CTRL+ENTER 可以分小节运行。
% 命令格式：
% mov = aviread('动态图像名字.avi')；
% movie(mov,n,fps)；
% 程序 aviread 将 AVI (Audio Video Interleaved)文件的帧读出， 然后 movie 将
% 该电影文件在 MATLAB 的对话框里放映出来。movie(mov,n,fps)命令中
% 第 2 个参数 n 为播放次数，第 3 个参数 fps 为每秒播放的帧数。
clc;clear all;
mov = aviread('./Exp1_image/Anna.avi');
movie(mov,1,12);



