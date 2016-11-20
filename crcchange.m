%坐标轮换法
function crcchange(f,x,k,s)
e=[1,0;0,1];
syms y;
while(1)
    x1=x;
    for i=1:2
        x_new=y*e(i,:)+x;
        m=subs(f,{k(1),k(2)},{x_new}); 
        [left,right]=push(m,0,0.1,y); %求区间
        [min_y,min]=gloden(m,left,right,0.0001,y); %黄金分割求极值
        x=min_y*e(i,:)+x; %更改坐标值
        x=roundn(x,-2);%保留小数点后两位
        disp(x);
    end
    if(norm(x-x1)<s)
         break;
    end
end





