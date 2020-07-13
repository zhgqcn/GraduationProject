file_path =  'D:\MATLAB\bin\IMAGES\R_G_Enhanced\G_Channel\G_target_1024_enhanced\';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.tif'));%��ȡ���ļ���������jpg��ʽ��ͼ��
img_num = length(img_path_list);%��ȡͼ��������
img_num_need = img_num - 8;
if img_num > 0 %������������ͼ��
        for k = img_num_need + 1 : img_num  %��һ��ȡͼ��
            image_name = img_path_list(k).name;% ͼ����
            Im=  imread(strcat(file_path,image_name));
            
   
            L = size(Im);
            height= 128 ;
            width= 128 ;
            max_row = floor(L(1)/height);
            max_col = floor(L(2)/width);
            seg = cell(max_row,max_col);
            %�ֿ�
            for row = 1:max_row      
                for col = 1:max_col        
                seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};  
                end
            end 
 
            
            for i=1:max_row*max_col
            imwrite(seg{i},strcat('D:\MATLAB\bin\IMAGES\R_G_Partition\G_Part\test_target_1024_128\',int2str(i),'part_',image_name));  
            end
%             �����ֿ�ı߽�
%             for row = 1:max_row      
%                 for col = 1:max_col  
%              rectangle('Position',[160*(col-1),160*(row-1),160,160],...
%                      'LineWidth',2,'LineStyle','-','EdgeColor','r');
%                     end
%             end 
%             hold off


        end
end

