file_path_r =  'D:/ALL_DataSet/R_G_Partition/R_Part/train_target/';% ͼ���ļ���·��
file_path_g =  'D:/ALL_DataSet/R_G_Partition/G_Part/train_target_1024_128/';% ͼ���ļ���·��
img_path_list_r = dir(strcat(file_path_r,'*.tif'));%��ȡ���ļ���������tif��ʽ��ͼ��
img_path_list_g = dir(strcat(file_path_g,'*.tif'));%��ȡ���ļ���������tif��ʽ��ͼ��
img_num = length(img_path_list_r);%��ȡͼ��������
if img_num > 0 %������������ͼ��
        for k = 1:img_num %��һ��ȡͼ��
            image_name_r = img_path_list_r(k).name;% 
            image_name_g = img_path_list_g(k).name;% ͼ����
            
            imgr  =  imread(strcat(file_path_r,image_name_r));
            imgg  =  imread(strcat(file_path_g,image_name_g));
            black =  imread('D:/PycharmDOC/test_photo/all_black.tif');
            
            x = cat(3, imgr, imgg, imgg);

            Img_R_path = strcat('D:/ALL_DataSet/RGGE/train/RGGE_' ,image_name_r);
            imwrite(x ,Img_R_path);
        end
end  