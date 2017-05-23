function contour_line(image_name,N)
%��һͼ��ĵȸ���
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

subplot(1,2,2);
imshow(contour,[]);
title(strcat('ͼ��ĵȸ���(',num2str(N),')'));