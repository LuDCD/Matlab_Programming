clc;clear all;

% Image=imread('./Exp1_image/I13.bmp');
% imshow(Image,[]);

% Image=imread('./Exp1_image/C4.bmp');
% imshow(Image,[]);

% RGB_heft('./Exp1_image/C4.bmp');

% Image=imread('./Exp1_image/I2.bmp');
% [height width]=size(Image)

% get_pixel('./Exp1_image/I5.bmp', 21,46)

%% 2.3  ��Ӱ�ֽ�����ʾ ���Է�С�ڣ��� CTRL+ENTER ���Է�С�����С�
% �����ʽ��
% mov = aviread('��̬ͼ������.avi')��
% movie(mov,n,fps)��
% ���� aviread �� AVI (Audio Video Interleaved)�ļ���֡������ Ȼ�� movie ��
% �õ�Ӱ�ļ��� MATLAB �ĶԻ������ӳ������movie(mov,n,fps)������
% �� 2 ������ n Ϊ���Ŵ������� 3 ������ fps Ϊÿ�벥�ŵ�֡����
clc;clear all;
mov = aviread('./Exp1_image/Anna.avi');
movie(mov,1,12);



