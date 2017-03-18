function level_set(image_name,N)
%求一图像的水平集
%输入参数：image_name－－－图像文件名
%        ：N－－－－－－－－阀值（0～255）
if nargin<1 
     disp('请输入文件名!!!');
     return;
elseif nargin<2
     N=128;
end

image_input=imread(image_name);
subplot(1,2,1);
imshow(image_input);
title('原图像');
[size_m,size_n]=size(image_input);
matrix_temp=zeros(size_m,size_n);

% 求水平集 
for row=1:size_m
    for col=1:size_n
        if image_input(row,col) > N
            matrix_temp(row,col)=1;
        end
    end
end

subplot(1,2,2);
imshow(matrix_temp,[]);
title(strcat('图像的的水平集',num2str(N)));
