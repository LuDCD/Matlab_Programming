function show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h)
%ÏÔÊ¾ÃÔ¹¬
figure(h)
line([.5,col+.5],[.5,.5]) % draw top border
line([.5,col+.5],[row+.5,row+.5]) % draw bottom border
line([.5,.5],[1.5,row+.5]) % draw left border
line([col+.5,col+.5],[.5,row-.5])  % draw right border
for ii=1:length(ptr_right)
    if ptr_right(ii)>0 % right passage blocked
        line([cc(ii)+.5,cc(ii)+.5],[rr(ii)-.5,rr(ii)+.5]);
        hold on
    end
    if ptr_down(ii)>0 % down passage blocked
        line([cc(ii)-.5,cc(ii)+.5],[rr(ii)+.5,rr(ii)+.5]);
        hold on
    end
   
end
axis equal
axis([.5,col+.5,.5,row+.5])
axis off
set(gca,'YDir','reverse')
return