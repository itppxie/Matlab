% 2D高斯分布

clc;
clear all;
x0 = 3;
y0 = 4;
sigma_x = 2;
sigma_y = 3;
rho = 0;

% 设置中心点
mu = [x0, y0];  % 均值向量，中心点坐标

% 设置协方差矩阵
sigma = [sigma_x^2, rho * sigma_x * sigma_y; 
         rho * sigma_x * sigma_y, sigma_y^2];  % sigma_x 和 sigma_y 为各自方向上的标准差，rho 为相关系数

% 生成N个二维正态分布的样本
N = 1000;  % 生成数据的数量
data = mvnrnd(mu, sigma, N);  % mvnrnd生成二维正态分布的样本
disp(data);

% 可视化数据
scatter(data(:,1), data(:,2));
xlabel('X');
ylabel('Y');
title('2D Gaussian Distribution');
axis equal;
