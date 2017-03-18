function maze_creat()
clc;
clear all;
row=5;
col=5;
rand('state',sum(100*clock))
[cc,rr]=meshgrid(1:col,1:row);
state = reshape([1:row*col],row,col);
id = reshape([1:row*col],row,col);
ptr_left = zeros(size(id));
ptr_up = zeros(size(id));
ptr_right = zeros(size(id));
ptr_down = zeros(size(id));
ptr_left(:,2:size(id,2)) = id(:,1:size(id,2)-1);
ptr_up(2:size(id,1),:) = id(1:size(id,1)-1,:);
ptr_right(:,1:size(id,2)-1) = id(:,2:size(id,2));
ptr_down(1:size(id,1)-1,:) = id(2:size(id,1),:);
the_maze = cat(2,reshape(id,row*col,1),reshape(rr,row*col,1),reshape(cc,row*col,1),reshape(state,row*col,1),...
reshape(ptr_left,row*col,1),reshape(ptr_up,row*col,1),reshape(ptr_right,row*col,1),reshape(ptr_down,row*col,1)  );
the_maze = sortrows(the_maze);
id=the_maze(:,1);
rr=the_maze(:,2);
cc=the_maze(:,3);
state=the_maze(:,4);
ptr_left=the_maze(:,5);
ptr_up=the_maze(:,6);
ptr_right=the_maze(:,7);
ptr_down=the_maze(:,8);
clear the_maze;
[state, ptr_left, ptr_up, ptr_right, ptr_down]=make_pattern(row,col,rr, cc, state, ptr_left, ptr_up, ptr_right, ptr_down);
h=figure('KeyPressFcn',@move_spot,'color','white');
show_maze(row, col, rr, cc, ptr_left, ptr_up, ptr_right, ptr_down,h);

% % 开始
% cursor_pos=[1,1];
% current_id=1;
% figure(h)
% text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');
% set(gcf,'Units','normalized');
% set(gcf,'position',[0 0 1 .91]);
% tic

% 记录过程

% while ~all(cursor_pos == [col,row])
%     waitfor(gcf,'CurrentCharacter')
%     set(gcf,'CurrentCharacter','~') % update to another character so repeats are recognized
%  
%     switch double(key(1))
%         case 108 % left
%             if ptr_left(current_id)<0 % check for legal move
%                 current_id=-ptr_left(current_id);
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);
%                 cursor_pos(1)=cursor_pos(1)-1;
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');
%             end
%         case 114 % right
%             if ptr_right(current_id)<0 % check for legal move
%                 current_id=-ptr_right(current_id);
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);
%                 cursor_pos(1)=cursor_pos(1)+1;
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');
%             end
%         case 117 % up
%             if ptr_up(current_id)<0 % check for legal move
%                 current_id=-ptr_up(current_id);
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);
%                 cursor_pos(2)=cursor_pos(2)-1;
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');
%             end
%         case 100 % down
%             if ptr_down(current_id)<0 % check for legal move
%                 current_id=-ptr_down(current_id);
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color',[.8,.8,.8]);
%                 cursor_pos(2)=cursor_pos(2)+1;
%                 text(cursor_pos(1),cursor_pos(2),'\diamondsuit','HorizontalAlignment','Center','color','r');
%             end
% 
%         otherwise
%     end
% 
% end
% 
% thyme=toc;
% title(cat(2,' Winning Time ',num2str(round(thyme*100)/100),'(sec)'),'FontSize',20)
return