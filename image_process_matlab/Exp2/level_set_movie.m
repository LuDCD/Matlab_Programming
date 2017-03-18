function level_set_movie(image_name)
% 将各层水平集组合层avi文件显示
image_input=imread(image_name);
% 求水平集 
[size_m,size_n]=size(image_input);

mkdir('level_set');
cd('level_set');

for N=0:254
    matrix_temp=zeros(size_m,size_n);
    for row=1:size_m
        for col=1:size_n
            if image_input(row,col) > N
                matrix_temp(row,col)=1;
            end
        end
    end
    imwrite( matrix_temp,strcat('level_set_',num2str(N),'.bmp') );
end

for index=0:254
    [a,map]=imread( strcat('level_set_',num2str(index),'.bmp') );
    MM(index+1)=im2frame(a,map);
end
movie(MM,1,4)

movie2avi(MM,'level_set.avi','compression','None')
cd('..');
