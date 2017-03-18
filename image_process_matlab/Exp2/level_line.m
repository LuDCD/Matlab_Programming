function level_line(image_name,N)
%求一图像的水平集、线
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

% 图像矩阵扩展   赋值 便于处理边界
matrix_ex=zeros(size_m+2,size_n+2);
for row=1:size_m
    for col=1:size_n
        matrix_ex(row+1,col+1)=matrix_temp(row,col);
    end
end
  
% 四邻域反填充  得水平线
matrix_new=matrix_temp;
for row=2:size_m+1
    for col=2:size_n+1
        if matrix_ex(row+1,col)==0 & matrix_ex(row-1,col)==0 & matrix_ex(row,col+1)==0 & matrix_ex(row,col-1)==0
            matrix_new(row-1,col-1)=1;
        end
    end
end

subplot(1,2,2);
imshow(matrix_new,[]);
title(strcat('图像的水平线(',num2str(N),')'));


