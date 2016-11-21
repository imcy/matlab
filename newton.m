%牛顿法
function newton(f,x,x_s,s)
syms a;
J=jacobian(f,x_s)
H=jacobian(J,x_s)

while(1)
    fx=subs(J,x_s,x); %xk一阶梯度值
    h=subs(H,x_s,x); 
    d_new=-inv(h)*(fx');%求xk的牛顿方向
    if(norm(double(fx))<s)
        disp(norm(double(fx)));
        break;
    end
     x_j=x+a*(d_new)'; %求最优步长a
     a_f=subs(f,x_s,x_j);
     a_f_g=diff(a_f,a);%求步长函数的梯度
     a_new=solve(a_f_g)%a_new为最优步长
     x=x+a_new(1)*(d_new')
end