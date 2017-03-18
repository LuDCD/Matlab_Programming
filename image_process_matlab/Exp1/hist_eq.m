function hist_eq( image_input )  
%将图像直方图均衡化，并将变换前后的直方图输出
%参数输入  图像的文件名

subplot(2,2,1);
Image=imread(image_input);

Image=uint8( 128+double(Image)/4 ); % 产生质量差的图像
title('输入图像');
imshow(Image);
%imwrite(Image,'temp.bmp')

subplot(2,2,2);
title('输入图像的直方图');
imhist(Image);

Image_hist=histeq(Image);
subplot(2,2,3);
title('均衡化后图像');
imshow(Image_hist,[]);
%imwrite(Image_hist,'hist.bmp');

subplot(2,2,4);
title('均衡化后图像的直方图');
imhist(Image_hist);

