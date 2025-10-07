% 极坐标图（polar diagram），基础知识


clc %https://zhuanlan.zhihu.com/p/312069817
clear all;
close all;
t = 0:0.05:2*pi; % 角度
r = abs(sqrt(sin(t).^5 + cos(t).^5)); % 半径
polarplot(t,r,'-','linewidth',1); % 绘制极坐标图

% 一、角度θ
% thetalim([0, 180]); % 更改t轴的角度范围，使其从0°到180°
% set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360]); % 角度范围0°到360°，且显示的刻度为0°、45°、90°……
set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360], 'thetaaxisunits', 'radians'); % 设置角度显示为pi
% 二、半径r
% rlim([-1, 1]); % 更改r轴的范围，使其从-1到1
set(gca, 'rlim', [0, 1], 'rtick', [0.2 0.4 0.6 0.8 1.0]); 

