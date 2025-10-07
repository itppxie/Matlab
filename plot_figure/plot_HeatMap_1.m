% 热力图

clc;
clear all;
close all;

a = rand(5,5); % rand函数生产5行5列的均匀分布的伪随机数，分布在（0~1）之间
h = heatmap(a);
h.CellLabelFormat = '%0.2f'; % 保留两位小数
% h.CellLabelColor = 'none';
colormap(gca, 'parula'); % 颜色