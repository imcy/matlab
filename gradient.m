%�����½���
function gradient(f,x,x_s,s)
syms a;
d=jacobian(f,x_s);
while(1)
    d_new=-[subs(d,x_s,x)]; %�����½�����
    if(norm(double(d_new))<s)
        break;
    end
    x_j=x+a*d_new; %�����Ų���a
    a_f=subs(f,x_s,x_j);
    a_f_g=diff(a_f,a);%�󲽳��������ݶ�
    a_new=solve(a_f_g);%a_newΪ���Ų���
    x=x+a_new*d_new
    fmin=subs(f,x_s,x)
end
