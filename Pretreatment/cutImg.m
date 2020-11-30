%% crop the im into 256*256

clear;clc;
file_path = 'D:\ALL_DataSet\BSDS\train_HR_4\';              % �趨����ͼƬ��Ŀ¼
img_path_list = dir(strcat(file_path, '*.png')); % ѡ��׺Ϊ .png ��ͼƬ
img_num = length(img_path_list); %���ͼƬ����

for j = 1:img_num 
    image_name = img_path_list(j).name;
    image = imread(strcat(file_path, image_name));
    [m,n]=size(image);
    if m == 481
        crop_image = imcrop(image, [0, 0, 320, 320]); % ʹ�� imcrop() �������ü�ͼƬ���ڶ��������ĸ�ʽΪ [XMIN YMIN WIDTH HEIGHT]
    else
        crop_image = imcrop(image, [0, 0, 320, 320]); % ʹ�� imcrop() �������ü�ͼƬ���ڶ��������ĸ�ʽΪ [XMIN YMIN WIDTH HEIGHT]
    end
    
    imwrite(crop_image, strcat('D:\ALL_DataSet\BSDS200\train_HR_4\', image_name)); % �����ļ�
end
