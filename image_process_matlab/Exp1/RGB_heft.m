function RGB_heft(image_input)
%��һ��GRBͼ���ļ�����RGB������һ�������зֱ���ʾ
%�������Ϊ ͼ���ļ���������չ����
image_I=imread(image_input);
if isrgb(image_I)==0
    disp('��ͼ����RGBͼ��');
    return;
end

subplot(2,2,1);
imshow(image_input);

matrix_R(:,:,1)=image_I(:,:,1);
matrix_R(:,:,2)=0;
matrix_R(:,:,3)=0;

subplot(2,2,2);
imshow(matrix_R);
imwrite(matrix_R,'matrix_R.bmp')
title('R����');

matrix_G(:,:,2)=image_I(:,:,2);
matrix_G(:,:,1)=0;
matrix_G(:,:,3)=0;

subplot(2,2,3);
imshow(matrix_G);
title('G����');
imwrite(matrix_G,'matrix_G.bmp')

matrix_B(:,:,3)=image_I(:,:,3);
matrix_B(:,:,1)=0;
matrix_B(:,:,2)=0;
imwrite(matrix_B,'matrix_B.bmp')

subplot(2,2,4);
imshow(matrix_B);
title('B����');
