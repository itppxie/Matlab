% Ground truth主程序，调用Ground_truth_func函数；
% 也是一个demo

clc, clear all, close all;

figure(1);
set(gca, 'Position', [0.1 0.1 0.8 0.8]); % axis位置和大小设置，距离figure左边界10%、距离figure下边界10%、axis宽80%、axis高80%；
xlim([1, 10]);
ylim([0, 1]);

% 指定值
scale_of_x_axis = [1, 10];         % 坐标轴x的起始刻度和终点刻度，必须跟xlim相对应！
scale_of_ground_truth = [1, 3]; % ground truth的起点和终点！

% 调用
t = Ground_truth_func(scale_of_x_axis, scale_of_ground_truth);
