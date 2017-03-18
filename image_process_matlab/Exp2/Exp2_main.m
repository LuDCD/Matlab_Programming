% 主要内容
% 1 图像水平集合；
% 2 图像加密算法；
% 3 边缘提取；
% 4 噪音图像的产生.

%% 一、水平集、水平线
% 1 求水平集
% 命令格式
% level_set('输入图像名',  λ );
% 显示图像和它的水平集，其中阈值 λ 取 0～255 整数。
clc;clear all;
level_set('./Exp2_image/6I4.bmp',128);

%% 2求水平线
% 命令格式
% level_line('输入图像名',λ);
% 显示图像和它的水平线, 其中阈值 λ 取 0～255 整数。
% level_line_set('输入图像名');
% 显示图像并显示它的一族水平线（默认阀值 λ 为 32,64,96,128,160,192,224） ，
% 这个函数经常被用来分析滤波的光滑程度。
clc;clear;
% level_line('./Exp2_image/6I4.bmp',128);

level_line_set('./Exp2_image/2before.bmp');
figure;
level_line_set('./Exp2_image/1after.bmp');

%% 3求等高线
% 命令格式
% contour_line('输入图像名',λ);
% 显示一个地理意义上的等高线
clc;clear all;
% contour_line('./Exp2_image/6I4.bmp',128);

% 为了方便，我们提供了将这水平线、水平集和等高线放在一起使用
level('./Exp2_image/17I14.bmp',128);

%% 4水平集合的动态显示
% 命令格式
% levelset_set('输入图像名');
% 它产生了所有输入图像的所有水平集，即 256 个水平集文件，固定命名为
% level_set_i(i= 0,1,2, ,255)，它们放在当前目录的 level_set 子目录中。

% level_set_movie((' 输入图像名 ');
% 不仅实现了 levelset_set 函数的功能， 同时生成一个电影文件， 并进行了播放，
% 其中电影文件名为 level_set 子目录下的 level_set.avi.

% 注意：level_set 是一个临时的子目录，执行 levelset_set 或者 level_set_movie
% 命令就会替换其中的内容。所以需要保存请及时复制。

clc;clear;
levelset_set('./Exp2_image/13I9.bmp ');
level_set_movie('./Exp2_image/13I9.bmp');

%% 5由水平集组合产生原图像
% 命令格式
% levelset2image('输出图像名');
% 将水平集转化为图像，其中水平集的集合必须放在指定的目录中当前目录的
% level_set 子目录中。
clc;clear all;
levelset_set('./Exp2_image/9I6.bmp');
levelset2image('9I6copy.bmp');