function[left,middle,right]=push(f,x1,step)
f1=f(x1);
x2=x1+step;
f2=f(x2);
if (f1>f2)  %������ȷ���½�
    step=step*2;
    x3=x2+step;
    f3=f(x3);
    while(f2>f3)
        step=2*step;
        x3=x3+step;
        f3=f(x3);
    end
    left=x3-step;
    right=x3;
  
    else  %�����������
    x3=x1-step;
    f3=f(x3);
    while(f3<f1)
        step=2*step;
        x3=x3-step;
        f3=f(x3);
    end
    left=x3;
    right=x3+step;
end
    x4=(left+right)/2; %�ڲ�
    f4=f(x4);
    [s,i]=sort([f1,f2,f3,f4]);
    disp(s);
    disp(i);
    x=[x1,x2,x3,x4];
    left=x(i(2));
    middle=x(i(1));
    right=x(i(3));



