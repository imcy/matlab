%最速下降法
function gradient(f,x,x_s,s)
syms a;
d=jacobian(f,x_s);
while(1)
    d_new=-[subs(d,x_s,x)]; %最速下降方向
    if(norm(double(d_new))<s)
        break;
    end
    x_j=x+a*d_new; %求最优步长a
    a_f=subs(f,x_s,x_j);
    a_f_g=diff(a_f,a);%求步长函数的梯度
    a_new=solve(a_f_g);%a_new为最优步长
    x=x+a_new*d_new
    fmin=subs(f,x_s,x)
end
