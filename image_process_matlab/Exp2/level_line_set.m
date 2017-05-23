function level_line_set(image_name)
% ��һͼ��ķ�ֵNȡ��ֵ����Ӧ��ˮƽ�ߵĵ��� 
% ���������image_name������ͼ���ļ���
 
image_input=imread(image_name);    %������
[size_m,size_n]=size(image_input); %������

matrix_out=zeros(size_m,size_n);    %ѭ���в������³�ʼ���ı���
% ��������ʼ�����ף�
for row=1:size_m
    for col=1:size_n
        matrix_out(row,col)=1;         
    end
end

matrix_ex=zeros(size_m+2,size_n+2); % ��չ����

subplot(1,2,1);
imshow(image_input);
title('ԭͼ��');

for N=1:32:255    % NΪ��Ӧ��ֵ
         
         matrix_temp=zeros(size_m,size_n); % ���³�ʼ�� ���ڣ�

         for row=1:size_m          
             for col=1:size_n
                 if image_input(row,col) >=N
                     matrix_temp(row,col)=1;     % ��ˮƽ������������ 
                 end
             end      
         end

         % ͼ�������չ   ��ֵ ���ڴ���߽�
         for row=1:size_m
             for col=1:size_n
                 matrix_ex(row+1,col+1)=matrix_temp(row,col);
             end
         end
  
         % �����򣨺�������ף������  ��ˮƽ��
         matrix_new=matrix_temp;
         
         for row=2:size_m+1
             for col=2:size_n+1
                 if matrix_ex(row+1,col)==0 & matrix_ex(row-1,col)==0 & matrix_ex(row,col+1)==0 & matrix_ex(row,col-1)==0
                     matrix_new(row-1,col-1)=1;    % ���
                 end
             end
         end

         matrix_out=min(matrix_out,matrix_new);  %����ˮƽ�ߵ���
end

matrix_out(1,1)=0;
matrix_out(2,1)=1;
subplot(1,2,2);
imshow(matrix_out,[]);
title('ͼ�񲿷�ˮƽ���ĵ���');



