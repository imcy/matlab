%ţ�ٷ�
function newton(f,x,x_s,s)
syms a;
J=jacobian(f,x_s)
H=jacobian(J,x_s)

while(1)
    fx=subs(J,x_s,x); %xkһ���ݶ�ֵ
    h=subs(H,x_s,x); 
    d_new=-inv(h)*(fx');%��xk��ţ�ٷ���
    if(norm(double(fx))<s)
        disp(norm(double(fx)));
        break;
    end
     x_j=x+a*(d_new)'; %�����Ų���a
     a_f=subs(f,x_s,x_j);
     a_f_g=diff(a_f,a);%�󲽳��������ݶ�
     a_new=solve(a_f_g)%a_newΪ���Ų���
     x=x+a_new(1)*(d_new')
end