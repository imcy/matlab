%黄金分割法，其中f为待求函数，a,b为区间s为精度
function [x,k]=gloden(f,a,b,s,y)
if a>b
    c=a;
    a=b;
    b=c;
end

r=(sqrt(5)-1)/2; %黄金分割比0.618
l=b-a;
x1=a+(1-r)*l;
x2=a+r*l;
y1=subs(f,y,x1);
y2=subs(f,y,x2);
while abs(b-a>s)
    if y1<y2
        b=x2;
        x2=x1;
        x1=a+b-x2;
    end
    if y1>=y2
        a=x1;
        x1=x2;
        x2=a+b-x1;
    end
 y1=subs(f,y,x1);
 y2=subs(f,y,x2);
end
x=(a+b)/2;
k=subs(f,y,x);
end
