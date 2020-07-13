file_path =  'D:/MATLAB/bin/IMAGES/R_G_SingleChannels/G_channel/original_1024/';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.tif'));%��ȡ���ļ���������jpg��ʽ��ͼ��
img_num = length(img_path_list);%��ȡͼ��������
if img_num > 0 %������������ͼ��
        for k = 1:img_num %��һ��ȡͼ��
            image_name = img_path_list(k).name;% ͼ����
            Ipi  =  imread(strcat(file_path,image_name));

%             figure;
%             subplot(2,2,1);
%             imshow(uint8(Ipi));title('1024��ɫ��ͨ��');
% 
%             original512 = imread('D:\MATLAB\bin\IMAGES\R_channel\original512\rc_512_1-512pix-speed7-ave1.tif')
%             subplot(2,2,2)
%             imshow(original512);title('512��ɫ��ͨ��')

            %-- ����������������������� --%
            CL = 54;   
            Ipi_CL = Ipi + CL;
%             subplot(2,2,3);
%             imshow(uint8(Ipi_CL));title('�������Ч��');
            %-----------------------------%

            %-- �������������ԻҶ����죡������--%
            % gamma < 1 �ͻҶ���ǿ���죬�߻Ҷ�������������ѹ��
            Ipi_histequ = imadjust(Ipi_CL, [57/255, 150/255], [40/255, 255/255], 0.85);
%             subplot(2,2,4)
%             imshow(uint8(Ipi_histequ));title('�����ԻҶ�����');

            Img_R_path = strcat('D:/MATLAB/bin/IMAGES/R_G_Enhanced/G_Channel/G_target_1024_enhanced/' ,image_name);
            imwrite(Ipi_histequ ,Img_R_path);
        end
end