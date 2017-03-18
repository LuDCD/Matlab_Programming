clc;clear;
X = imread('flower.jpg')
imshow(X);

% M=roipoly(X);
% L = imcrop(X);
[x,y] = ginput(4);
x1 = min(x);
y1=max(y);
x2 = max(x);
y2=min(y);

L=imcrop(X,[x1,y1,x2,y2]);

imshow(L);
B=imresize(L,2,'nearest');
figure,imshow(B);title('图像缩放2倍');

% [Row,Col] = size(L); 
% % Col = size(L,2);%图像行数和列数
% nn=2;%放大倍数   
% m = round(nn*Row);%求出变换后的坐标的最大值 
% n = round(nn*Col);  
% B = zeros(m,n,3);%定义变换后的图像   
% for i = 1 : m      
%     for j = 1 : n          
%         x = round(i/nn); 
%         y = round(j/nn);%最小临近法对图像进行插值         
%         if x==0  
%             x = 1; 
%         end          
%         if y==0  
%             y = 1; 
%         end         
%         if x>Row 
%             x = Row; 
%         end         
%         if y>Col 
%             y = Col;
%         end         
%         B(i,j,:) = L(x,y,:);     
%     end
% end
% B = uint8(B);%将矩阵转换成8位无符号整数 
% figure; 
% imshow(B);  
% title('最邻近插值法放大8倍1024*1024');
