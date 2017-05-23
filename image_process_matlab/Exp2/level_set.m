function level_set(image_name,N)
%��һͼ���ˮƽ��
%���������image_name������ͼ���ļ���
%        ��N������������������ֵ��0��255��
if nargin<1 
     disp('�������ļ���!!!');
     return;
elseif nargin<2
     N=128;
end

image_input=imread(image_name);
subplot(1,2,1);
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

subplot(1,2,2);
imshow(matrix_temp,[]);
title(strcat('ͼ��ĵ�ˮƽ��',num2str(N)));
