clc;clear all;
% Ball Ϊ������·���ܴ���
Ball = ones(5).*2000;
for i=1:5
    Ball(i,i)=0;
end
save Ball Ball;

% Delall Ϊ�����и�����·��ʱ��
Delall = zeros(5);
for i=1:5
    for j=1:5
        if(i~=j)
            Delall(i,j)=rand()*10+5;
        end
    end
end
save Delall Delall;

% Savall Ϊ�����и�����·�Ŀɿ���
Savall = zeros(5);
for i=1:5
    for j=1:5
        if(i~=j)
            Savall(i,j)=rand()*5;
        end
    end
end
save Savall Savall;

% M Ϊn��Դ��n��Ŀ�Ľڵ����������
M = zeros(5);
M(1,5)=1000;M(2,4)=200;M(2,5)=1200;M(4,2)=550;M(5,1)=600;M(5,2)=900;
save M M;

% Del Ϊn��Դ��n��Ŀ�Ľڵ��ʱ��delay����
Del = zeros(5);
t = randperm(12);t=t(1:6);
Del(1,5)=t(1);Del(2,4)=t(2);Del(2,5)=t(3);Del(4,2)=t(4);Del(5,1)=t(5);Del(5,2)=t(6);
save Del Del;

% Sav Ϊn��Դ��n��Ŀ�Ľڵ�Ŀɿ���Safety����
Sav = zeros(5);
t = rand(1,6);
Sav(1,5)=t(1);Sav(2,4)=t(2);Sav(2,5)=t(3);Sav(4,2)=t(4);Sav(5,1)=t(5);Sav(5,2)=t(6);
save Sav Sav;

% P Ϊ��ʼ�Ļ�������
p1=zeros(5);
p2=zeros(5);
p3=p1;
p1 = data_creat_p(p1,Delall,1,5);
p2 = data_creat_p(p2,Savall,1,5);
p3 = data_creat_p(p3,Ball,1,5);

P(:,:,1)=p1;
P(:,:,2)=p2;
P(:,:,3)=p3;
save P P;