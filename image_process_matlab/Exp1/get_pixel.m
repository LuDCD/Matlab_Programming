function value=get_pixel(image_name,row,col)
% ���ͼ���һ������ֵ
% ���������
% image_name:   ͼ���ļ���(ע��д��չ����)
% row,col:      ͼ�����������
if length(image_name)<5
    disp('������ͼ���ļ�����չ��������');
    return;
end

if nargin<3
    disp('�밴����˵����ȷ�������������');
    return;
end

image=imread(image_name);

value=0;
if isgray(image)==1
    value=image(row,col);
end

if isrgb(image)==1
    value=image(row,col,1);
    value=[value,image(row,col,2)];
    value=[value,image(row,col,3)];
end

disp( strcat( image_name,'��(',num2str(row),',',num2str(col),')','λ�õ�����ֵ�ǣ�'));%