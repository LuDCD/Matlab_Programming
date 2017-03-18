function value=get_pixel(image_name,row,col)
% 获得图象的一个象素值
% 输入参数：
% image_name:   图像文件名(注意写扩展名！)
% row,col:      图像的行列坐标
if length(image_name)<5
    disp('请输入图像文件的扩展名！！！');
    return;
end

if nargin<3
    disp('请按参数说明正确输入参数！！！');
    return;
end

image=imread(image_name);

value=0;
if isgray(image)==1
    value=image(row,col);
end

if isrgb(image)==1
    value=image(row,col,1);
    value=[value,image(row,col,2)];
    value=[value,image(row,col,3)];
end

disp( strcat( image_name,'在(',num2str(row),',',num2str(col),')','位置的像素值是：'));%