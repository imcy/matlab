%%清理操作
clear all %清除所有变量
clc %清除命令行中所有命令

%%变量名称,区分大小写
A=2;
a=3;
A=rand(3,5);
str='Hello world'; %定义字符串
num2str(34); %数字转字母

%%矩阵基本运算
B=[1 4 5;2 6 9 ;3 4 6]; %定义矩阵
B_1=B'; %矩阵转置
C=B(:);
D=inv(B); %矩阵求逆
B*D; %乘以逆矩阵得到单位阵

%%多维矩阵
E=zeros(10,5,3)  %定义类似图像的三维矩阵
%%元胞数组
ce=cell(1,6)  %维度可以不同
ce{2}=eye(3) %赋值
ce{5}=magic(5)
k=ce{5}

%%结构体
books=struct('name',{{'machine learning','data mining'}},'price',[30,40])
books.name %返回cell
books.name{1} %返回字符串

%%矩阵定义
B=1:2:9 %创建全奇数数组
C=repmat(B,3,1) %复制B矩阵3行1列

%%矩阵算法
A=[1 2 3;4 5 6;7 8 9]
B=[1 2 3;4 5 6;7 8 9]
A*B;%矩阵相乘
A.*B %对应位置相乘
A(1,2) %取第一行第二个
A(2,:) %取第二行
A(:,2) %取第二列