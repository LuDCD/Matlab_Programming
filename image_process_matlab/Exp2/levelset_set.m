function level_set_movie(image_name)
% ������ˮƽ����ϲ�avi�ļ���ʾ
image_input=imread(image_name);
% ��ˮƽ�� 
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

cd('..');
