
% 极坐标图，基础知识


clc %https://zhuanlan.zhihu.com/p/312069817
clear all
close all
% 设置画布的位置
% figure('units','normalized','position',[0.1,0.1,0.7,0.6])
% set(gcf, 'units', 'normalized', 'position', [0.1, 0.1, 0.3, 0.3]);
set(gcf, 'position', [0, 0, 1000, 1000]); % 左0像素，底部0像素，宽1000像素，高1000像素

% t = 0:0.05:2*pi;
% r = abs(sqrt(sin(t).^5 + cos(t).^5));
t = [deg2rad(0), deg2rad(45), deg2rad(90), deg2rad(135), deg2rad(180), deg2rad(225), deg2rad(270), deg2rad(315), deg2rad(360)]; % 函数deg2rad是将度数转换为弧度！
r = [1, 0.75, 0.25, 0, 0, 0, 0.25, 0.75, 1];
polarplot(t,r,'-bo','linewidth',3) % 颜色blue，圆圈o

legend(' DS Neuron ');

set(gca,'linewidth',1,'fontsize',30,'fontname','Times');   % 字体显示

% 一、角度θ
% thetalim([0, 180]); % 更改t轴的角度范围，使其从0°到180°
% set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360]); % 角度范围0°到360°，且显示的刻度为0°、45°、90°……
set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360], 'thetaaxisunits', 'radians'); % 设置角度显示为pi
% 二、半径r
% rlim([-1, 1]); % 更改r轴的范围，使其从-1到1
set(gca, 'rlim', [0, 1], 'rtick', [0.2 0.4 0.6 0.8 1.0]); 

% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
set(gca, 'position', [0.164, 0.132, 0.655, 0.64]); % 

