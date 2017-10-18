
% Open a window for the user to label either positive or negative
% rectangles for an image. The first two clicks define the endpoint
% of a line PARALLEL to the gripper plate. The third click point is
% projected onto the perpendicular line coming from the second click 
% point
function DrawRect2(dir,str, pos)
img= imread(strcat(dir, str));
if pos
    last= 'cpos.txt';
else 
    last= 'cneg.txt';
end
imshow(img);
hold on
dir=strcat(dir,'rawLabel/',str(1:length(str)-5),last);
disp(dir);
data=importdata(dir);
filenum=str2num(str(4:length(str)-5));
[H W]=size(data);
repeat= true;
while(repeat)
    for i=1:4:H-3
        x2=data(i,1);
        y2=data(i,2);
        x1=data(i+1,1);
        y1=data(i+1,2);
        x0=data(i+2,1);
        y0=data(i+2,2);
        x3=data(i+3,1);
        y3=data(i+3,2);
        plot([x0 x1], [y0 y1], 'b');
        plot([x1 x2], [y1 y2], 'r');
        plot([x2 x3], [y2 y3], 'b');
        plot([x0 x3], [y0 y3], 'r');
        temp=x0*y1 - x1*y0 - x0*y3 + x1*y2 - x2*y1 + x3*y0 + x2*y3 - x3*y2;
        x=(x0*x1*y2 - x1*x2*y0 - x0*x1*y3 + x0*x3*y1 - x0*x3*y2 + x2*x3*y0 + x1*x2*y3 - x2*x3*y1)/temp;
        y=(x0*y1*y2 - x2*y0*y1 - x1*y0*y3 + x3*y0*y1 - x0*y2*y3 + x2*y0*y3 + x1*y2*y3 - x3*y1*y2)/temp;
        width=sqrt((x0-x1)^2+(y0-y1)^2);
        height=sqrt((x0-x3)^2+(y0-y3)^2);
        angle=acos((x0-x1)/width)*(180/pi);
        m=[filenum,x,y,angle,height,width];
        %keep= input('keep? y for yes\n','s');
        %if keep== 'y'
            dlmwrite('append.txt', m,'-append');
        %    break;
        %   end      
    end
    % another= input('another? y for yes\n','s');
    %if another== 'y'
        repeat= false;
    %else
    %    repeat= true;
   % end
end
hold off
close all
fclose(FID);
    