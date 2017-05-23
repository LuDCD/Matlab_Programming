function level_set(image_name,N)
%��һͼ���ˮƽ������
%���������image_name������ͼ���ļ���
%        ��N������������������ֵ��0��255��
if nargin<1 
     disp('�������ļ���!!!');
     return;
elseif nargin<2
     N=128;
end

image_input=imread(image_name);
subplot(2,2,1);
imshow(image_input);
title('ԭͼ��');
[size_m,size_n]=size(image_input);
matrix_temp=zeros(size_m,size_n);

% ��ˮƽ�� 
for row=1:size_m
    for col=1:size_n
        if image_input(row,col) > N
            matrix_temp(row,col)=1;
        end
    end
end

subplot(2,2,2);
imshow(matrix_temp,[]);
title('ͼ���ˮƽ��');
imwrite(matrix_temp,'level_setzhan.bmp');
% ͼ�������չ   ��ֵ ���ڴ���߽�
matrix_ex=zeros(size_m+2,size_n+2);
for row=1:size_m
    for col=1:size_n
        matrix_ex(row+1,col+1)=matrix_temp(row,col);
    end
end
  
% ���������  ��ˮƽ��
matrix_new=matrix_temp;
for row=2:size_m+1
    for col=2:size_n+1
        if matrix_ex(row+1,col)==0 & matrix_ex(row-1,col)==0 & matrix_ex(row,col+1)==0 & matrix_ex(row,col-1)==0
            matrix_new(row-1,col-1)=1;
        end
    end
end

subplot(2,2,3);
imshow(matrix_new,[]);
title('ͼ���ˮƽ��');
%imwrite(matrix_new,'level_line.bmp');

% ��ͼ��ĵȸ���
contour=zeros(size_m,size_n);

for row=1:size_m
    for col=1:size_n
        if image_input(row,col)==N
            contour(row,col)=1;
        end
        contour(row,col)=1-contour(row,col);
    end
end

subplot(2,2,4);
imshow(contour,[]);
title('ͼ��ĵȸ���');
%imwrite(contour,'contour.bmp');