function Maze = makeMaze(n)
    showProgress = false;
 
    colormap([1,1,1;1,1,1;0,0,0]);  % 3×3矩阵
    set(gcf,'color','w');   % 图的背景设置为白色。gcf 返回当前Figure 对象的句柄值
 
    NoWALL      = 0;
    WALL        = 2;
    NotVISITED  = -1;
    VISITED     = -2;
 
    m = 2*n+3;  % n为正方迷宫的大小；
    Maze = NotVISITED(ones(m)); % ones(m)生成m×m的全1矩阵；
    offsets = [-1, m, 1, -m];
 
    Maze([1 2:2:end end],:) = WALL;
    Maze(:,[1 2:2:end end]) = WALL;
 
    currentCell = sub2ind(size(Maze),3,3);
    Maze(currentCell) = VISITED;
 
    S = currentCell;
 
    while ( ~isempty(S) )
        moves = currentCell + 2*offsets;
        unvistedNeigbors = find(Maze(moves)==NotVISITED);
 
        if (~isempty(unvistedNeigbors))
            next = unvistedNeigbors(randi(length(unvistedNeigbors),1));
            Maze(currentCell + offsets(next)) = NoWALL;
 
            newCell = currentCell + 2*offsets(next);
            if (any(Maze(newCell+2*offsets)==NotVISITED))
                S = [S newCell];
            end
 
            currentCell = newCell;
            Maze(currentCell) = VISITED;
        else
            currentCell = S(1);
            S = S(2:end);
        end
 
        if (showProgress)
            image(Maze-VISITED);
            axis equal off;
            drawnow;
            pause(.01);
        end
    end
 
    image(Maze-VISITED);
    axis equal off;