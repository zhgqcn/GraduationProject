file_path =  'D:/MATLAB/bin/IMAGES/Original_512/';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.tif'));%��ȡ���ļ���������jpg��ʽ��ͼ��
img_num = length(img_path_list);%��ȡͼ��������
if img_num > 0 %������������ͼ��
        for j = 1:img_num %��һ��ȡͼ��
            image_name = img_path_list(j).name;% ͼ����
            Image =  imread(strcat(file_path,image_name));
       
            I1=Image(:,:,2);%Gͨ��

            
            Img_R_path = strcat('D:/MATLAB/bin/IMAGES/G_channel/original_512/' , 'gc_512_', image_name);
       
            %������

            imwrite(I1,Img_R_path);

        end
end
