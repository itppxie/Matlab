
clc, clear all, close all;

% 确定坐标轴axis的位置和大小
figure(1);
set(gca, 'Position', [0.1 0.1 0.8 0.8]); % axis位置和大小设置，左边界10%、下边界10%、宽80%、高80%

% 1、绘制（0.05，0.1）到（1，0.1）的实文本箭头
hold on;
annotation('textarrow',[0.05 1],... % 两个元素的向量[x_begin x_end]，表示箭头的起点和终点的 x 坐标
    [0.1 0.1],...                    % 两个元素的向量[y_begin y_end]，表示箭头的起点和终点的 y 坐标
    'String', {'figure中', '验证y=0.1'},... % 换行显示文本
    'Color',[1 0 0],... % 箭头颜色
    'LineStyle','-',... % 箭杆样式："-" (默认) | "--" | ":" | "-." | "none"
    'LineWidth',0.5);   % 箭杆宽度

% 2、绘制（0.05，0.9）到（1，0.9）的实文本箭头
hold on;
annotation('textarrow',[0.05 1],... % 两个元素的向量[x_begin x_end]，表示箭头的起点和终点的 x 坐标
    [0.9 0.9],...                    % 两个元素的向量[y_begin y_end]，表示箭头的起点和终点的 y 坐标
    'String', {'figure中', '验证y=0.9'},... % 换行显示文本
    'Color',[1 0 0],... % 箭头颜色
    'LineStyle','-',... % 箭杆样式："-" (默认) | "--" | ":" | "-." | "none"
    'LineWidth',0.5);   % 箭杆宽度

% 3、绘制（0.1，0.05）到（0.1，1）的实文本箭头
hold on;
annotation('textarrow',[0.1 0.1],... % 两个元素的向量[x_begin x_end]，表示箭头的起点和终点的 x 坐标
    [0.05 1],...                    % 两个元素的向量[y_begin y_end]，表示箭头的起点和终点的 y 坐标
    'String', {'figure中', '验证x=0.1'},... % 换行显示文本
    'Color',[0 0 1],... % 箭头颜色
    'LineStyle','-',... % 箭杆样式："-" (默认) | "--" | ":" | "-." | "none"
    'LineWidth',0.5);   % 箭杆宽度

% 4、绘制（0.9，0.05）到（0.9，1）的实文本箭头
hold on;
annotation('textarrow',[0.9 0.9],... % 两个元素的向量[x_begin x_end]，表示箭头的起点和终点的 x 坐标
    [0.05 1],...                    % 两个元素的向量[y_begin y_end]，表示箭头的起点和终点的 y 坐标
    'String', {'figure中', '验证x=0.9'},... % 换行显示文本
    'Color',[0 0 1],... % 箭头颜色
    'LineStyle','-',... % 箭杆样式："-" (默认) | "--" | ":" | "-." | "none"
    'LineWidth',0.5);   % 箭杆宽度