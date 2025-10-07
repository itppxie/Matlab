% 画三维图

clc;
clear all;

% x坐标
x = 0:1:100;
% x = zeros(1, 100);

% y坐标
y = 0:1:100;
% disp(y); % 打印数组
% disp(size(y)); % 打印数组维度
% y = zeros(1, 100);


% z坐标
% z = 0:0.1:1;
% z = zeros(1, 100);
z = x.^2 + y.^2;


plot3(x, y, z);

grid on;
xlabel('x');
ylabel('y');
zlabel('z');
