function level_line_set(image_name)
% 求一图像的阀值N取各值所对应的水平线的叠加 
% 输入参数：image_name－－－图像文件名
 
image_input=imread(image_name);    %不变量
[size_m,size_n]=size(image_input); %不变量

matrix_out=zeros(size_m,size_n);    %循环中不需重新初始化的变量
% 输出矩阵初始化（白）
for row=1:size_m
    for col=1:size_n
        matrix_out(row,col)=1;         
    end
end

matrix_ex=zeros(size_m+2,size_n+2); % 扩展矩阵

subplot(1,2,1);
imshow(image_input);
title('原图像');

for N=1:32:255    % N为相应阀值
         
         matrix_temp=zeros(size_m,size_n); % 重新初始化 （黑）

         for row=1:size_m          
             for col=1:size_n
                 if image_input(row,col) >=N
                     matrix_temp(row,col)=1;     % 求水平集－－－－－ 
                 end
             end      
         end

         % 图像矩阵扩展   赋值 便于处理边界
         for row=1:size_m
             for col=1:size_n
                 matrix_ex(row+1,col+1)=matrix_temp(row,col);
             end
         end
  
         % 四邻域（黑区域填白）反填充  得水平线
         matrix_new=matrix_temp;
         
         for row=2:size_m+1
             for col=2:size_n+1
                 if matrix_ex(row+1,col)==0 & matrix_ex(row-1,col)==0 & matrix_ex(row,col+1)==0 & matrix_ex(row,col-1)==0
                     matrix_new(row-1,col-1)=1;    % 填白
                 end
             end
         end

         matrix_out=min(matrix_out,matrix_new);  %各级水平线叠加
end

matrix_out(1,1)=0;
matrix_out(2,1)=1;
subplot(1,2,2);
imshow(matrix_out,[]);
title('图像部分水平集的叠加');



