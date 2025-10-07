% First-order high-pass filter：一阶高通滤波器

clear; close all; clc;

% 生产一个周期为3s，持续时间为10s的方波，使用默认的采样时间。
[u,t] = gensig("square", 3, 10); % generate signal，u为信号序列，t为时间序列。
y1 = zeros(1, length(t));
fc = 10;
ts = 0.001;

% alpha = 1 / (2 * pi * fc * ts + 1); % α貌似写法有错误！
alpha = 0.75;

% u_k1 = 0;
% y_k1 = 0;
% for i = 1:length(t)
%     y1(i) = alpha * (u(i) - u_k1 + y_k1);
%     u_k1 = u(i);
%     y_k1 = y1(i);
% end

% 等价于下面这个
% y1(1) = 0;
for i = 2:length(t)
   y1(i) = alpha * y1(i-1) + alpha * (u(i) - u(i-1)); % 对u进行一阶高通滤波，过滤低频信号（即更新y1，滤波结果存入y1中）
end


plot(t, u, '-', ...
    t, y1, '.-');
legend("signal", "1 order")