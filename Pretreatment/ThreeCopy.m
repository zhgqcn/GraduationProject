file_path =  'D:/ALL_DataSet/R_G_Partition/R_Part/train_input/';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.tif'));%��ȡ���ļ���������jpg��ʽ��ͼ��
img_num = length(img_path_list);%��ȡͼ��������
if img_num > 0 %������������ͼ��
        for k = 1:img_num %��һ��ȡͼ��
            image_name = img_path_list(k).name;% ͼ����
            img  =  imread(strcat(file_path,image_name));

            x = repmat(img,[1,1,3]);%����ͨ��ͼƬת��Ϊ��ͨ��ͼƬ

            Img_R_path = strcat('D:/ALL_DataSet/ThreeFoldGrayRed/train_input/TCR_' ,image_name);
            imwrite(x ,Img_R_path);
        end
end