function[x,y]=par(f,x1,x2,x3) %�����߷�
A=[x1*x1,x2*x2,x3*x3;
   x1,x2,x3;
   1,1,1];
B=[f(x1);f(x2);f(x3)];
X=A\B; %��������
disp(X);
a=X(1);
b=X(2);
c=X(3);
x=-b/(2*a);
y=f(x);