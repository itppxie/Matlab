% 绘图中，画图板figure和坐标轴axis的设置

clc, clear all, close all;

% 如果设置了 axis off 命令，则不会显示坐标轴
axis on; % on/off

% 1.1、设置 Figure 在整个电脑屏幕中的 位置及大小，形式一。
% set(gcf, 'Position', [50 100 260 220]); % f代表figure，左边界50、下边界100、宽260、高220
% 第一个参数50，表示figure的左下角点距离显示器左侧边界50（单位？）
% 第二个参数100，表示figure的左下角点距离显示器下侧边界100（单位？）
% 第三个参数260，表示figure的宽度，宽260（单位？）
% 第三个参数220，表示figure的高度，高220（单位？）
% 参数 260 就对应的是figure图层的长是 7cm。7cm，也就是 word 半个页面的大小，不需要到 word 里再调整大小。

% 1.2、设置 Figure 在整个电脑屏幕中的 位置及大小，形式二。
% set(gcf, 'unit', 'centimeters', 'position', [10 5 8 4]); % f代表figure，左边界10cm、下边界5cm、宽8cm、高4cm
% 第一个参数10，表示figure的左下角点距离显示器左侧边界10cm；
% 第二个参数5，表示figure的左下角点距离显示器下侧边界5cm；
% 第三个参数8，表示figure的宽度，宽8cm；
% 第三个参数4，表示figure的高度，高4cm；

% 2.1、设置 Axis 在 Figture 中的边距、大小，形式一。
% set(gca,'Position', [0.1 0.2 0.4 0.75]); % a代表axis，左边界10%、下边界20%、宽40%、高75%
% 设置坐标轴axis 距离画板（图形窗口 Figure）边距。
% 参数分别为 Axes 在 Figure中 的左边界，下边界，宽度，高度。最小为 0，最大为1（左边界，下边界为0，上边界，右边界为1。

% 2.2、设置 Axis 在 Figture 中的边距、大小，形式二。
set(gca,'unit', 'centimeters', 'position', [5, 10, 8, 4]); % a代表axis，左边界5cm、下边界10cm、宽8cm、高4cm；
% 前两个值表示起始位置，后两个值表示大小。可自定义合适的大小。



