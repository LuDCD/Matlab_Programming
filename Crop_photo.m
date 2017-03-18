%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%程序用途：批量裁减图像（用任意多边形）
%程序设计：李林源   linyuan_Li@mail.bnu.edu.cn
%版本：1.0； 2.0; 3.0;
%版本介绍：1.0,只能指定输入点输入;  2.0，任意多点输入，同时画线和点; 3.0
%增加裁减参考板项目，选择是否对影像进行裁减。不进行裁减时依然标注角度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 主程序
%指定路径
path= 'D:\zhouheng\Matlab_Programming';
store_path='D:\zhouheng\Matlab_Programming';
ID=dir([path,'*.jpg']);
%批量交互式裁剪
for i=1:length(ID)
    img=imread(strcat(path,ID(i).name));  %注意strcat的使用
    r=img(:,:,1);
    g=img(:,:,2);
    b=img(:,:,3);
    figure;
    %显示本幅图像的名称
    set(gcf,'NumberTitle','off');
    set(gcf,'Name',ID(i).name);
    imshow(img);
    %选择是否对影像进行裁剪,不进行裁减时依然标注角度
    Choice=input('Please choose to crop or not(eg:Yes(1) or No(0))=\n')
    if Choice==0
        plane=input('Please choose PP(0) or CPP(1) {eg:0 or 1 }=\n');
        if plane==0
            zenith_angle=input('Please input angle(eg:+20 or -50)=\n');
            imwrite(img,strcat(store_path,'PP_zenith_angle=',[num2str(zenith_angle) '.tif']));
        else
            zenith_angle=input('Please input angle(eg:+20 or -50)=\n');
            imwrite(img,strcat(store_path,'CPP_zenith_angle=',[num2str(zenith_angle) '.tif']));
        end
        close all;
        continue;
    else
        %光标采集输入---注意：输入时一定要按照顺时针或者逆时针输入，不能任意输入
        
        %version：1.0如下，只能指定输入点输入
        %     hold on
        %     n=4;
        %     [x,y,key]=ginput(n);
        %     hold on
        %     plot(x,y,'r');
        
        %version：2.0，任意多点输入，同时画线和点
        hold on
        [x,y,c]=ginput(1);
        m(1)=x;
        n(1)=y;
        plot(x,y,'r');
        k=2;
        while(c==1)
            [x1,y1,c1]=ginput(1);
            if c1==1
                m(k)=x1;
                n(k)=y1;
                plot(x,y,'r');
                line([m(k-1) m(k)],[n(k-1) n(k)]);
                k=k+1;
                c=c1;
            else
                break
            end
        end
        line([m(k-1) m(1)],[n(k-1) n(1)]);
        
        %提取二值多边形
        BW = roipoly(img,m,n);
        r1=double(r).*double(BW);        %或者用bw1=cat(3, bw, bw, bw);img2 = img .* uint8(bw1);
        g1=double(g).*double(BW);
        b1=double(b).*double(BW);
        mask_img0=cat(3,r1,g1,b1);
        mask_img= uint8(mask_img0);
        figure;
        set(gcf,'NumberTitle','off');
        set(gcf,'Name',ID(i).name);
        imshow(mask_img);
        pause(3);
        close all
        %存储
        %确定主平面_PP（0）或者垂直主平面_CPP（1）或者参考板_REF（2）
        plane=input('Please choose PP(0) or CPP(1) or REF(2){eg:0 or 1 or 2}=\n');
        switch  plane
            case 0
                zenith_angle=input('Please input angle(eg:+20 or -50)=\n');
                imwrite(mask_img,strcat(store_path,'PP_zenith_angle=',[num2str(zenith_angle) '.jpg']));
            case 1
                zenith_angle=input('Please input angle(eg:+20 or -50)=\n');
                imwrite(mask_img,strcat(store_path,'CPP_zenith_angle=',[num2str(zenith_angle) '.jpg']));
            case 2
                number=input('Please input Reference number(eg:1 or 2 and so on)=\n');
                imwrite(mask_img,strcat(store_path,'Reference_',[num2str(number) '.jpg']));
        end
        close all
    end
    close all
end
close all
