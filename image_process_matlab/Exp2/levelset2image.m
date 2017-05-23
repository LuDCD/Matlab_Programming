function levelset2image(out_filename)
% ˮƽ������  ����ͼ����ˮƽ���Ĺ�ϵ
% out_filename: ����ļ���

cd('level_set');
% ���ɸ���ˮƽ������������������������������������������������
temp=imread('level_set_0.bmp');
[size_r,size_c] = size(temp);
level_image = zeros(size_r,size_c,255);

for N = 0:254         
    level_image(:,:,N+1) = imread(strcat('level_set_',num2str(N),'.bmp'));    
end

% �����������ֵ
conduct_image = zeros(size_r,size_c);

% �ɸ���ˮƽ���ع�ͼ�񣭣�������������������������������������
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
title('�ع�����ͼ��');
imwrite(uint8(conduct_image),out_filename);
cd('..');