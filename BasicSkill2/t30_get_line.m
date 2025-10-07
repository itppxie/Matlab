% todo：在一个行列601*601的黑色背景图像中，画几条白色线条
% 根据直线方程，画直线

clc, clear all, close all;

image1 = zeros(601, 601, 3); % 宽高601*601，3通道

% 在第301行（正中间行）画一条白线
for i = 1: 601 % 1~601列
    image1(301, i, :) = 255;
end

% 在第301列（正中间列）画一条白线
for i = 1: 601 % 1~601行
    image1(i, 301, :) = 255;
end

% 在图像上画一条斜对角白线（左上-右下）
for i = 1: 601
    image1(i, i, :) = 255;
end

% 在图像上画一条斜对角白线（左下-右上）
for i = 1: 601 % 1~601行
    image1(i, 602 - i, :) = 255;
end

% 再画一条写白线：y = 1.493*x - 148.393 这里，坐标原点为左上角，x水平向右，y垂直向下
for i = 1: 601 % 1~601行，即y从1~601
    y = i;
    x = (y + 148.393) / 1.493; % double类型
    x = int32(x);
    image1(y, x, :) = 255; % 坐标点（y，x）是第y行第x列
end

figure('Name', 'my figure');
colormap('gray');
image(image1);

% 帧保存成图片
imwrite(image1, strcat('./images/', 'image_lines', '.jpg')); % 保存图像
