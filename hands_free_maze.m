function hands_free_maze
rr=20;
cc=30;
ii=1;
while 1
    close all
    score(ii,1) = maze(rr,cc,'r')
    pause(5)
    rr=round(rr*1.12);
    cc=round(cc*1.12);
    ii=ii+1;
end