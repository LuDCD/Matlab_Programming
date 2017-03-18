B = imread('.\picture\1.jpg');
A= rgb2gray(B); 
[m,n]=size(A);
for i=1:1:m
    for j=1:1:n
        if(A(i,j)>130)
            A(i,j)=255;
        end
    end
end
imwrite(A,'.\picture\11.png')