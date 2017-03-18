function noise(filename)

Image=imread(filename);

subplot(2,2,1);
imshow(Image,[]);   % 原图像
title('原图像');

noise_g=imnoise(Image,'gaussian'); % 增加高斯白噪声
subplot(2,2,2);
imshow(noise_g,[]);  
%imwrite(noise_g,'noise_g.bmp')
title('高斯白噪声');

noise_s=imnoise(Image,'salt & pepper');
subplot(2,2,3);
imshow(noise_s,[]);  
title('黑白象素点噪声(椒盐)');
%imwrite(noise_s,'noise_s.bmp')

noise_p=imnoise(Image,'speckle');  
subplot(2,2,4);
imshow(noise_p,[]);  
%imwrite(noise_p,'noise_p.bmp')
title('乘积性噪声');



