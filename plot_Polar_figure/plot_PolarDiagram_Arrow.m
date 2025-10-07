% 在极坐标系下，绘制箭头

clc;
clear all;
close all;

% 创建极坐标轴
figure;
pax = polaraxes;
hold(pax, 'on');

% 箭头起点和终点
theta = pi/4; % 角度 (45°)
r = [1.5, 2.5];   % 半径 (起点 r1=1.5, 终点 r2=2.5)

% 绘制箭头主线
polarplot(pax, [theta, theta], r, 'r', 'LineWidth', 2);

% 算出箭头头部的两个角度
arrow_length = 0.1; % 箭头大小
theta1 = theta + pi/100; % 侧翼角度
theta2 = theta - pi/100;

r_arrow = r(2) - arrow_length; % 终点缩短以显示箭头头部

% 绘制箭头头部的两条短线
polarplot(pax, [theta, theta1], [r(2), r_arrow], 'r', 'LineWidth', 2);
polarplot(pax, [theta, theta2], [r(2), r_arrow], 'r', 'LineWidth', 2);

% 标题
title('使用 polarplot 绘制极坐标箭头');
