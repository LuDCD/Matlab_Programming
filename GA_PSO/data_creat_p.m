function p = data_creat_p(pp,Mat,sb,db)
% ���ݴ�������Matȷ��ѡ���·��������pp�������ء�
% ���룺a���ڽӾ���(aij)��ָi��j֮��ľ��룬�����������
% sb�����ı��, db���յ�ı��
% �����mydistance�����·�ľ���, mypath�����·��·��

[value,t] = mydijkstra(Mat,sb,db);
for i=1:length(t)-1
    pp(t(i),t(i+1))=1;
end
p = pp;
end