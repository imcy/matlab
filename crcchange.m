%�����ֻ���
function crcchange(f,x,k,s)
e=[1,0;0,1];
syms y;
while(1)
    x1=x;
    for i=1:2
        x_new=y*e(i,:)+x;
        m=subs(f,{k(1),k(2)},{x_new}); 
        [left,right]=push(m,0,0.1,y); %������
        [min_y,min]=gloden(m,left,right,0.0001,y); %�ƽ�ָ���ֵ
        x=min_y*e(i,:)+x; %��������ֵ
        x=roundn(x,-2);%����С�������λ
        disp(x);
    end
    if(norm(x-x1)<s)
         break;
    end
end





