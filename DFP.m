%ţ�ٷ�
function DFP(f,x,x_s,s)
syms a;%����
J=jacobian(f,x_s);
H=eye(2);
n=ndims(H);
k=0;
count=0;
while(1)
   g_k=subs(J,x_s,x); %xkһ���ݶ�ֵ
   d_new=(-H*g_k')';
   
   x_k=x+a*d_new;%�����Ų���a
   a_f=subs(f,x_s,x_k);
   a_f_g=diff(a_f,a);%�󲽳��������ݶ�
   a_new=solve(a_f_g)%a_newΪ���Ų���
   x2=x+a_new(1)*d_new
   count=count+1;
   g_k2=subs(J,x_s,x2);%xkһ���ݶ�ֵ
   
   %�����ж�
   if(norm(double(g_k2))<s)
        break;
   end
   if(k==n)
       x=x2;
   else
        d_x=(x2-x)';
        d_g=(g_k2-g_k)';
        H=H+(d_x*d_x')/(d_g'*d_x)-(H*d_g*d_g'*H)/(d_g'*H*d_g) %���µ�H����
        k=k+1;
        x=x2;
   end
end
disp(subs(f,x_s,x2));
disp(count);