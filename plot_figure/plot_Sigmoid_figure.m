% 绘制sigmoid函数

clc, clear all, close all;

x = -10: 0.01: 10; % x
y = (1 + exp(-x)).^(-1); % sigmoid函数
plot(x, y);