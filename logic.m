A=rand(1,10)
C=0.75
B=(A>C)
%%if 语句
if any(B)
    fprintf('有大于%4.2f的数\n',C);
    disp(find(B))  %显示所有大于0.75数的下标
else
    fprintf('全部都小于%4.2f\n',C);
end
%%for语句
test=zeros(5,5);

for i=1:5
    for j=1:5
        test(i,j)=j*i;
    end
end
disp(test)

%%case操作
in=input('请输入:');
switch in
    case -1
        disp('negative one');
    case 0
        disp('zero')
    case 1
        disp('one')
    otherwise
        disp('other value')
end
