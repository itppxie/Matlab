% 绘制 FOE（Focus Of Expansion）位置

clc;
clear;
m = 500;
n = 500;



% 设置图像尺寸
image_size = [m, n];  % 图像的高度和宽度 (m, n)

% 中心点坐标 (x0, y0)
x0 = floor(m / 2);  % 中心点x坐标
y0 = floor(n / 2);  % 中心点y坐标

% 正态分布的标准差
sigma = 50;  % 标准差（可以根据需要调整）

% 生成坐标网格
[x, y] = meshgrid(1:n, 1:m);  % 创建网格，x是列坐标，y是行坐标

% 计算每个点到中心点的距离（欧氏距离）
distance = sqrt((x - x0).^2 + (y - y0).^2);

% 使用高斯公式计算每个像素的值
% 这里使用二维高斯函数：f(x, y) = exp(-(d^2 / (2 * sigma^2)))
image = exp(-(distance.^2) / (2 * sigma^2));

% ppxie 将所有像素值大于0.48的都设置为0.48
for i = 1: 500
    for j = 1: 500
        if image(i, j) > 0.48
            image(i, j) = 0.48;
        end
    end
end
% ppxie 设置中心点周围的几个像素点的颜色
r = 4;
for i = 1: 500
    for j = 1: 500
        if power(i - x0, 2) + power(j - y0, 2) <= power(r, 2)
            image(i, j) = 1;
        end
    end
end
set(gca, 'position', [0, 0, 1, 1]); % 设置坐标系位置
set(gcf, 'Position', [300, 300, 600, 600]); % 设置figure位置



% 可视化图像
% imagesc(image);
imshow(image);
colormap('jet');  % 设置颜色图
% % colorbar;         % 显示颜色条
% title('2D Gaussian Distribution of Pixel Values');
axis equal;

%%%%%%%%%%%%%%%%%%%%%%%%显示每个像素点的颜色值
% % 获取图像的大小
% [m, n] = size(image);
% 
% % 在每个像素上显示其颜色值
% hold on;  % 保持图像，不覆盖
% 
% for i = 1:m
%     for j = 1:n
%         value = image(i, j);  % 获取对应像素的颜色值（灰度值）
%         
%         % 在每个像素位置添加文本，显示其颜色值
%         text(j, i, sprintf('%.2f', value), 'Color', 'white', 'FontSize', 8, ...
%              'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

