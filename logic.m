A=rand(1,10)
C=0.75
B=(A>C)
%%if ���
if any(B)
    fprintf('�д���%4.2f����\n',C);
    disp(find(B))  %��ʾ���д���0.75�����±�
else
    fprintf('ȫ����С��%4.2f\n',C);
end
%%for���
test=zeros(5,5);

for i=1:5
    for j=1:5
        test(i,j)=j*i;
    end
end
disp(test)

%%case����
in=input('������:');
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
