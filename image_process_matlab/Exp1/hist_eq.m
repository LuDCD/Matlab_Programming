function hist_eq( image_input )  
%��ͼ��ֱ��ͼ���⻯�������任ǰ���ֱ��ͼ���
%��������  ͼ����ļ���

subplot(2,2,1);
Image=imread(image_input);

Image=uint8( 128+double(Image)/4 ); % �����������ͼ��
title('����ͼ��');
imshow(Image);
%imwrite(Image,'temp.bmp')

subplot(2,2,2);
title('����ͼ���ֱ��ͼ');
imhist(Image);

Image_hist=histeq(Image);
subplot(2,2,3);
title('���⻯��ͼ��');
imshow(Image_hist,[]);
%imwrite(Image_hist,'hist.bmp');

subplot(2,2,4);
title('���⻯��ͼ���ֱ��ͼ');
imhist(Image_hist);

