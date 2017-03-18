function levelset2image(out_filename)
% 水平集检验  体现图象与水平集的关系
% out_filename: 输出文件名

cd('level_set');
% 生成各层水平集－－－－－－－－－－－－－－－－－－－－－－－
temp=imread('level_set_0.bmp');
[size_r,size_c] = size(temp);
level_image = zeros(size_r,size_c,255);

for N = 0:254         
    level_image(:,:,N+1) = imread(strcat('level_set_',num2str(N),'.bmp'));    
end

% 求各层矩阵最大值
conduct_image = zeros(size_r,size_c);

% 由各层水平集重构图像－－－－－－－－－－－－－－－－－－－－
for row = 1:size_r
    for col = 1:size_c
        for i = 255:-1:1
            if level_image(row,col,i) == 255
                conduct_image(row,col) = i;  %%%%%%            
                break;
            end
        end
    end
end

imshow(conduct_image,[]);
title('重构出的图像');
imwrite(uint8(conduct_image),out_filename);
cd('..');