%牛顿法
function DFP(f,x,x_s,s)
syms a;%步长
J=jacobian(f,x_s);
H=eye(2);
n=ndims(H);
k=0;
count=0;
while(1)
   g_k=subs(J,x_s,x); %xk一阶梯度值
   d_new=(-H*g_k')';
   
   x_k=x+a*d_new;%求最优步长a
   a_f=subs(f,x_s,x_k);
   a_f_g=diff(a_f,a);%求步长函数的梯度
   a_new=solve(a_f_g)%a_new为最优步长
   x2=x+a_new(1)*d_new
   count=count+1;
   g_k2=subs(J,x_s,x2);%xk一阶梯度值
   
   %条件判断
   if(norm(double(g_k2))<s)
        break;
   end
   if(k==n)
       x=x2;
   else
        d_x=(x2-x)';
        d_g=(g_k2-g_k)';
        H=H+(d_x*d_x')/(d_g'*d_x)-(H*d_g*d_g'*H)/(d_g'*H*d_g) %求新的H矩阵
        k=k+1;
        x=x2;
   end
end
disp(subs(f,x_s,x2));
disp(count);