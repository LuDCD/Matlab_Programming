% ��Ҫ����
% 1 ͼ��ˮƽ���ϣ�
% 2 ͼ������㷨��
% 3 ��Ե��ȡ��
% 4 ����ͼ��Ĳ���.

%% һ��ˮƽ����ˮƽ��
% 1 ��ˮƽ��
% �����ʽ
% level_set('����ͼ����',  �� );
% ��ʾͼ�������ˮƽ����������ֵ �� ȡ 0��255 ������
clc;clear all;
level_set('./Exp2_image/6I4.bmp',128);

%% 2��ˮƽ��
% �����ʽ
% level_line('����ͼ����',��);
% ��ʾͼ�������ˮƽ��, ������ֵ �� ȡ 0��255 ������
% level_line_set('����ͼ����');
% ��ʾͼ����ʾ����һ��ˮƽ�ߣ�Ĭ�Ϸ�ֵ �� Ϊ 32,64,96,128,160,192,224�� ��
% ����������������������˲��Ĺ⻬�̶ȡ�
clc;clear;
% level_line('./Exp2_image/6I4.bmp',128);

level_line_set('./Exp2_image/2before.bmp');
figure;
level_line_set('./Exp2_image/1after.bmp');

%% 3��ȸ���
% �����ʽ
% contour_line('����ͼ����',��);
% ��ʾһ�����������ϵĵȸ���
clc;clear all;
% contour_line('./Exp2_image/6I4.bmp',128);

% Ϊ�˷��㣬�����ṩ�˽���ˮƽ�ߡ�ˮƽ���͵ȸ��߷���һ��ʹ��
level('./Exp2_image/17I14.bmp',128);

%% 4ˮƽ���ϵĶ�̬��ʾ
% �����ʽ
% levelset_set('����ͼ����');
% ����������������ͼ�������ˮƽ������ 256 ��ˮƽ���ļ����̶�����Ϊ
% level_set_i(i= 0,1,2, ,255)�����Ƿ��ڵ�ǰĿ¼�� level_set ��Ŀ¼�С�

% level_set_movie((' ����ͼ���� ');
% ����ʵ���� levelset_set �����Ĺ��ܣ� ͬʱ����һ����Ӱ�ļ��� �������˲��ţ�
% ���е�Ӱ�ļ���Ϊ level_set ��Ŀ¼�µ� level_set.avi.

% ע�⣺level_set ��һ����ʱ����Ŀ¼��ִ�� levelset_set ���� level_set_movie
% ����ͻ��滻���е����ݡ�������Ҫ�����뼰ʱ���ơ�

clc;clear;
levelset_set('./Exp2_image/13I9.bmp ');
level_set_movie('./Exp2_image/13I9.bmp');

%% 5��ˮƽ����ϲ���ԭͼ��
% �����ʽ
% levelset2image('���ͼ����');
% ��ˮƽ��ת��Ϊͼ������ˮƽ���ļ��ϱ������ָ����Ŀ¼�е�ǰĿ¼��
% level_set ��Ŀ¼�С�
clc;clear all;
levelset_set('./Exp2_image/9I6.bmp');
levelset2image('9I6copy.bmp');