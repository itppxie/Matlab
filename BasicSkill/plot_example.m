% 绘图例子

clc, clear, clear all;

x = 0:1:6;
y = 10.^x;
y = log(y);
plot(x, y, 'r--');

title('绘图');
xlabel('x');
ylabel('e^y');
legend('y=10^x', 'Location', 'northeast');
grid on;

% 使用axis命令/函数 控制x轴和y轴范
x = -2*pi:pi/20:2*pi;
y = sin(x);
plot(x, y);
title('y=sin(x)的图像');
xlabel('x');
ylabel('y');
grid on;

x = -2*pi:pi/20:2*pi;
y = sin(x);
plot(x, y);
axis([0 pi 0 1]);
title('y=sin(x)的图像');
xlabel('x');
ylabel('y');
grid on;

% 使用figure函数创建多个绘图窗口
figure(1);
x = 0:0.02:2;
y1 = exp(x);
plot(x, y1);
title('y=exp(x)的图像');
xlabel('x');
ylabel('y');
grid on;

figure(2);
y2 = exp(-x);
plot(x, y2);
title('y=exp(-x)的图像');
xlabel('x');
ylabel('y');
grid on;

% 使用subplot函数创建多个子图
figure(1);
subplot(2, 1, 1);
x = -pi:pi/20:pi;
y = sin(x);
plot(x, y);
title('y=sin(x)的图像');
xlabel('x');
ylabel('y');
grid on;% 显示空格线

subplot(2, 1, 2);
x = -pi:pi/20:pi;
y = cos(x);
plot(x, y);
title('y=cos(x)的图像');
xlabel('x');
ylabel('y');
grid on;