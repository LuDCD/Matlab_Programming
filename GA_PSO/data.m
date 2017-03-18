clc;clear all;
% Ball 为网络链路的总带宽
Ball = ones(5).*2000;
for i=1:5
    Ball(i,i)=0;
end
save Ball Ball;

% Delall 为网络中各个链路的时延
Delall = zeros(5);
for i=1:5
    for j=1:5
        if(i~=j)
            Delall(i,j)=rand()*10+5;
        end
    end
end
save Delall Delall;

% Savall 为网络中各个链路的可靠性
Savall = zeros(5);
for i=1:5
    for j=1:5
        if(i~=j)
            Savall(i,j)=rand()*5;
        end
    end
end
save Savall Savall;

% M 为n个源点n个目的节点的流量矩阵
M = zeros(5);
M(1,5)=1000;M(2,4)=200;M(2,5)=1200;M(4,2)=550;M(5,1)=600;M(5,2)=900;
save M M;

% Del 为n个源点n个目的节点的时延delay矩阵
Del = zeros(5);
t = randperm(12);t=t(1:6);
Del(1,5)=t(1);Del(2,4)=t(2);Del(2,5)=t(3);Del(4,2)=t(4);Del(5,1)=t(5);Del(5,2)=t(6);
save Del Del;

% Sav 为n个源点n个目的节点的可靠性Safety矩阵
Sav = zeros(5);
t = rand(1,6);
Sav(1,5)=t(1);Sav(2,4)=t(2);Sav(2,5)=t(3);Sav(4,2)=t(4);Sav(5,1)=t(5);Sav(5,2)=t(6);
save Sav Sav;

% P 为初始的基础粒子
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