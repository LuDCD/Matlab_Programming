function noise(filename)

Image=imread(filename);

subplot(2,2,1);
imshow(Image,[]);   % ԭͼ��
title('ԭͼ��');

noise_g=imnoise(Image,'gaussian'); % ���Ӹ�˹������
subplot(2,2,2);
imshow(noise_g,[]);  
%imwrite(noise_g,'noise_g.bmp')
title('��˹������');

noise_s=imnoise(Image,'salt & pepper');
subplot(2,2,3);
imshow(noise_s,[]);  
title('�ڰ����ص�����(����)');
%imwrite(noise_s,'noise_s.bmp')

noise_p=imnoise(Image,'speckle');  
subplot(2,2,4);
imshow(noise_p,[]);  
%imwrite(noise_p,'noise_p.bmp')
title('�˻�������');



