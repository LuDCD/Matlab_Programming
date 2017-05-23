%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������;�������ü�ͼ�����������Σ�
%������ƣ�����Դ   linyuan_Li@mail.bnu.edu.cn
%�汾��1.0�� 2.0; 3.0;
%�汾���ܣ�1.0,ֻ��ָ�����������;  2.0�����������룬ͬʱ���ߺ͵�; 3.0
%���Ӳü��ο�����Ŀ��ѡ���Ƿ��Ӱ����вü��������вü�ʱ��Ȼ��ע�Ƕ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ������
%ָ��·��
path= 'D:\zhouheng\Matlab_Programming';
store_path='D:\zhouheng\Matlab_Programming';
ID=dir([path,'*.jpg']);
%��������ʽ�ü�
for i=1:length(ID)
    img=imread(strcat(path,ID(i).name));  %ע��strcat��ʹ��
    r=img(:,:,1);
    g=img(:,:,2);
    b=img(:,:,3);
    figure;
    %��ʾ����ͼ�������
    set(gcf,'NumberTitle','off');
    set(gcf,'Name',ID(i).name);
    imshow(img);
    %ѡ���Ƿ��Ӱ����вü�,�����вü�ʱ��Ȼ��ע�Ƕ�
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
        %���ɼ�����---ע�⣺����ʱһ��Ҫ����˳ʱ�������ʱ�����룬������������
        
        %version��1.0���£�ֻ��ָ�����������
        %     hold on
        %     n=4;
        %     [x,y,key]=ginput(n);
        %     hold on
        %     plot(x,y,'r');
        
        %version��2.0�����������룬ͬʱ���ߺ͵�
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
        
        %��ȡ��ֵ�����
        BW = roipoly(img,m,n);
        r1=double(r).*double(BW);        %������bw1=cat(3, bw, bw, bw);img2 = img .* uint8(bw1);
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
        %�洢
        %ȷ����ƽ��_PP��0�����ߴ�ֱ��ƽ��_CPP��1�����߲ο���_REF��2��
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
