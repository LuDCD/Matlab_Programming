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
figure,imshow(B);title('ͼ������2��');

% [Row,Col] = size(L); 
% % Col = size(L,2);%ͼ������������
% nn=2;%�Ŵ���   
% m = round(nn*Row);%����任�����������ֵ 
% n = round(nn*Col);  
% B = zeros(m,n,3);%����任���ͼ��   
% for i = 1 : m      
%     for j = 1 : n          
%         x = round(i/nn); 
%         y = round(j/nn);%��С�ٽ�����ͼ����в�ֵ         
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
% B = uint8(B);%������ת����8λ�޷������� 
% figure; 
% imshow(B);  
% title('���ڽ���ֵ���Ŵ�8��1024*1024');
