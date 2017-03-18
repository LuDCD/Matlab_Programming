function edge_distill(image_name)

Image_I=imread(image_name);
if isgray(Image_I)==0
    disp('请输入灰度图像！');
    return;
end

subplot(2,3,1);
imshow(Image_I);
title( '原图像' );

subplot(2,3,2);
BW_S=edge( Image_I,'sobel' );
imshow(BW_S);
%imwrite(BW_S,'BW_S.bmp')
title('sobel 算子');

subplot(2,3,3);
BW_P=edge( Image_I,'prewitt' );
imshow(BW_P);
%imwrite(BW_P,'BW_P.bmp')
title('prewitt 算子');

subplot(2,3,4);
BW_R=edge( Image_I,'roberts' );
imshow(BW_R);
%imwrite(BW_R,'BW_R.bmp')
title('roberts 算子');

subplot(2,3,5);
BW_L=edge( Image_I,'log' );
imshow(BW_L);
%imwrite(BW_L,'BW_L.bmp')
title('log 算子');

subplot(2,3,6);
BW_Z=edge( Image_I,'zerocross' );
imshow(BW_Z);
%imwrite(BW_Z,'BW_Z.bmp')
title('zerocross 算子');
