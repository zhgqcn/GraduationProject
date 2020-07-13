%======================================================
% MPM�ҶȾ���
% f1=imadjust��f��[low_in  high_in],[low_out  high_out],gamma��
%=======================================================

clc
close all
clearvars
tic

[FileName, FilePath]=uigetfile('*.jpg;*.png;*.tif;*.img;*.bmp;','��ѡ��һ���ο�ͼƬ');
image_name = [FilePath FileName];

Iorg = imread(image_name);
[rI, cI] = size(Iorg(:,:,1));

%-- �ж�ͼ����Ϣ���ڵ�ͨ�� --%
ifocus = zeros(1,3);      % ��Ҫ����ķ�������ʼֵΪ0����Ӧ������ֵʱ��Ԫ�ر�Ϊ1  [0,0,0]
for i=1:3   % i=1��ɫ ; i=2��ɫ; i=3��ɫ 
   Inidraw = Iorg(:,:,i);    %ͨ����ȡ
   Meani = mean(Inidraw(:)); %�ȰѾ���ת��Ϊ������Ȼ������ֵ
   if(Meani>1)  % �÷�������Ϣ��������Ӧ�ô���0��˵������Ϣ������Ϊ��ȥ�룬����Դ��ֵ
       ifocus(i) = 1;
   end
end
%---------------------------%

[r,c,v] = find(ifocus~=0);

%%
% ֻ��������Ϣ�ķ���
Ir = zeros(rI, cI, 3); 
for i=2
    Ipi = Iorg(:,:,c(i));
    figure;
    subplot(2,2,1);
    imshow(uint8(Ipi));title('1024��ɫ��ͨ��');
    
    original512 = imread('D:\MATLAB\bin\IMAGES\R_G_SingleChannels\G_channel\original_512\gc_512_1-512pix-speed7-ave1.tif')
    subplot(2,2,2)
    imshow(original512);title('512��ɫ��ͨ��')
    
    %-- ����������������������� --%
    CL = 54;   
    Ipi_CL = Ipi + CL;
    subplot(2,2,3);
    imshow(uint8(Ipi_CL));title('�������Ч��');
    %-----------------------------%
    
    %-- �������������ԻҶ����죡������--%
    % gamma < 1 �ͻҶ���ǿ���죬�߻Ҷ�������������ѹ��
    Ipi_histequ = imadjust(Ipi_CL, [57/255, 150/255], [40/255, 255/255], 0.85);
    subplot(2,2,4)
    imshow(uint8(Ipi_histequ));title('�����ԻҶ�����');
    %---------------------------------%
    
    Ir(:,:,i) = Ipi_histequ;
   
    %-- �Ҷ�ֱ��ͼ(ԭͼ) --%
    %[count_pi, x_pi] = imhist(Ipi);   % xn�ǻҶ�ֵ��count_n�ǳ��ֵĴ���
    %[count_ri, x_ri] = imhist(Ir(:,:,i));
    %f_pi = count_pi/(rI*cI);          % ���ִ�����һ��
    %f_ri = count_ri/(rI*cI);

    figure
    subplot(2,2,1);
%     stem(x_pi, f_pi, 'b.');
    imhist(Ipi);
    title('�Ҷ�ֱ��ͼ-ԭͼ');
    
    subplot(2,2,2);
    imhist(Ipi_CL);title('�Ҷ�ֱ��ͼ-�������');
    
    subplot(2,2,3);
%     stem(x_ri, f_ri, 'r.');
    imhist(uint8(Ir(:,:,i)));
    title('�Ҷ�ֱ��ͼ-�����');
    %-----------------------------%
   
    %-----------------------------%
    figure
    IpiShow = zeros(rI,cI,3);
    IpiShow(:,:,i) = Ipi;
    imshow(uint8(IpiShow));title('ԭʼRGBͼ');   

    figure
    IriShow = zeros(rI,cI,3);
    IriShow(:,:,i) = Ipi_histequ;
    imgs = uint8(IriShow);
    imshow(uint8(IriShow));title('����������������RGBͼ');
    %-----------------------------%
    
    %-- ����ͼ��--%
    switch i
        case 1
            ChannelName = 'R-';
        case 2
            ChannelName = 'G-';
        case 3
            ChannelName = 'B-';
    end
    
    rfpi = [FilePath, 'org-', ChannelName, FileName];
    imwrite(uint8(IpiShow), rfpi);
    
    rfri = [FilePath, 'Heq-', ChannelName, FileName];
    I1 = imgs(:,:,1);
    imwrite(I1, rfri);
    %--------------%
end








toc