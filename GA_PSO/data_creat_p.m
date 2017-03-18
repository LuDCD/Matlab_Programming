function p = data_creat_p(pp,Mat,sb,db)
% 根据传进来的Mat确定选择的路径，更新pp，并返回。
% 输入：a—邻接矩阵(aij)是指i到j之间的距离，可以是有向的
% sb—起点的标号, db—终点的标号
% 输出：mydistance—最短路的距离, mypath—最短路的路径

[value,t] = mydijkstra(Mat,sb,db);
for i=1:length(t)-1
    pp(t(i),t(i+1))=1;
end
p = pp;
end