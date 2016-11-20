function[left,right]=push(f,x1,step,y)
f1=subs(f,y,x1);
x2=x1+step;
f2=subs(f,y,x2);
if (f1>f2)  %方向正确，下降
    step=step*2;
    x3=x2+step;
    f3=subs(f,y,x3);
    while(f2>f3)
        step=2*step;
        x3=x3+step;
        f3=subs(f,y,x3);
    end
    left=x3-step;
    right=x3;
  
    else  %方向错误，上升
    x3=x1-step;
    f3=subs(f,y,x3);
    while(f3<f1)
        step=2*step;
        x3=x3-step;
        f3=subs(f,y,x3);
    end
    left=x3;
    right=x3+step;
end
    x4=(left+right)/2; %内插
    f4=subs(f,y,x4);
    [s,i]=sort([f1,f2,f3,f4]);
    x=[x1,x2,x3,x4];
    left=x(i(2));
    middle=x(i(1));
    right=x(i(3));



