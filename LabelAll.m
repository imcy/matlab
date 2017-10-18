
% Opens each image in the range of the for loop one at a time for labeling

%%%% Enter the range of image numbers you want to label here %%%%%

from=185; % image number to start labeling from
to= 186; % image number to label to

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% you can also hardcode the directory name here
%directory= input('Full path to directory where data is located:\n','s');
directory='G:/grasp/grapCode/testImage/14';
posNeg= 'p';
while(posNeg~='p'&&posNeg~='n')
    posNeg= input('Enter p for positive rectangles, n for negative rectangles\n','s');
end
if posNeg=='p'
    pos= true;
else 
    pos= false;
end
directory= strcat(directory,'/');

img_path_list = dir(strcat(directory,'*.png'));
img_num = length(img_path_list);%获取图像总数量
if img_num > 0 %有满足条件的图像
        for j = 1:img_num %逐一读取图像
            image_name = img_path_list(j).name;% 图像名
            %image_name = 'pcd0321r.png'
            try
                fprintf('%d %s\n',j,image_name);% 显示正在处理的图像名
                DrawRect2(directory, image_name, pos);
            catch error 
                if (strcmp(error.identifier,'MATLAB:imread:fileOpen'))
                    fprintf('\nError loading file %s from directory %s\nPlease try again',file,directory)
                end
            end   
        end
end