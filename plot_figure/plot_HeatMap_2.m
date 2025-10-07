% 热力图

clc;
clear all;
close all;

picture_1 = zeros(500, 500); % 初始值
r = 50 % 局部视野域半径
x_center = 250;
y_center = 250;

picture_1();
for i = 1: 500
    for j = 1: 500
        if power(i - x_center, 2) + power(j - y_center, 2) <= power(r, 2)
            picture_1(i, j) = 255;
        end
    end
end


h = heatmap(picture_1);
h.CellLabelFormat = '%0.1f'; % 保留1位小数
% h.CellLabelColor = 'none';
colormap(gca, 'jet')
grid off; % 网格线