clc;clear all;
%% 1ͼ��ķ�ת��ʾ
% �����ʽ��
% I=imread('�ļ���');
% JJ=imadjust(I,[0 1],[1 0]);
% imshow(JJ,[])
% ͼ��ķ�ת��������Ƭ�ĵ�Ƭ�����Ҷ�ֵΪ i �����ص㰴 255-i(��ֵͼ��1-i)��ʾ��
% JJ ���ǵõ��ķ�תͼ��
I=imread('./Exp1_image/I2.bmp');
JJ=imadjust(I,[0 1],[1 0]);
imshow(I,[]);
figure;
imshow(JJ,[])

%% 2ͼ��ֱ��ͼ
% ͼ��ֱ��ͼ��ͼ��ֱ��ͼ���⻯�ĸ�������� 3.2 �ڡ�
% �����ʽ
% Image=imread('����ͼ����');
% imhist(Image);

Image=imread('./Exp1_image/I4.bmp');
imhist(Image);

%% 3ͼ��Ҷȵı任
% �����ʽ
% Image = imread('����ͼ����');
% Image = g(Image)
% ͨ�� Image = g(Image)��������ʵ�ֶ�ͼ��ÿ������ֵ�� g �任����
% �������е�����[I,J]
% Image[I,J]=g(Image[I,J])
clc;clear all;
Image=imread('./Exp1_image/I4.bmp');
Image=0.5*double(Image);
imshow(Image);
imshow(uint8(Image));
figure;
imhist(Image)

%% 4ֱ��ͼ���⻯
% ֱ��ͼ���⻯��ͼ����ǿ��һ����Ҫ�����������Ѿ�����˺ܶ�ֱ��ͼ��
% �⻯�͹涨�����㷨�����л����ۻ��ֲ��������㷨��Ϊ���䡣Histeq �������
% �������־�����㷨��
% �����ʽ��
% Image=imread('����ͼ����');
% Out_Image = histeq(Image);
% Out_Image Ϊ���⻯���ͼ��

clc;clear all;
Image=imread('./Exp1_image/I20_256.bmp');
Out_Image = histeq(Image);
imshow(Out_Image);

%% 5����Ƚ�
% ���ǽ� 2��3��4�����ʹ�ã������бȽϣ�Ϊ�˱��ڹ۲�ֱ��ͼ���⻯ǰ��
% ͼ��ĶԱȶȵı仯���Ȳ���һ�������ϲƫ������ƫ����Ҷ�ֵ���У���ͼ
% �񣬾��⻯��ԭͼ��ĶԱȶȵõ�����ǿ��ԭͼ���ֱ��ͼ��Ӧ�ر��ƽ̹��
% �Ҷ�ֵ���ȵطֲ��� 0��255��
% �����ʽ��
% hist_eq('ͼ���ļ���');
% ����Ĭ�ϲ����ϲ�����ͼ��ĺ���Ϊ
% u'(I,J)=128+u(I,J)/4
% ���� u'(I,J),u(I,J)�ֱ�ָĳԭͼ��Ͳ�����ͼ��������(I,J)���ĻҶ�ֵ��
hist_eq('./Exp1_image/I13.bmp')