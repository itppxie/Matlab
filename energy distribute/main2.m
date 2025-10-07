
clear all, clc, close all;

filename = './视频/过天桥20.avi'; % 读取的视频
obj = VideoReader(filename);

numFrames = obj.NumFrames; % 帧的总数
first_frame = read(obj, 1); % 第一帧
rows = size(first_frame, 1);
colums = size(first_frame, 2);

patt = zeros(rows, colums, numFrames); % patt存放灰度的视频序列

for k = 1: numFrames
    frame = read(obj, k); % rgb
    frame_gray = rgb2gray(frame); % 灰度化
    patt(:, :, k) = frame_gray;
end

% patt = 255 * patt;

% *******************************
% P layer
P = zeros(rows, colums, numFrames); % matrix of luminance change
% 第一帧的亮度差为0，第二帧、第三帧的亮度差……
for i = 2: numFrames
    temp = abs(patt(:, :, i) - patt(:, :, i-1));
    P(:, :, i) = temp;
end

Tp = 20; % threshold Tp
P_tilde = P .* (P >= Tp);

P_hat = P_tilde;

% E layer
E = zeros(rows, colums, numFrames); % 1~numFrames，且E(:, :, 1) = 0;
for j = 2: numFrames % 2~numFrames
    E(:, :, j) = P_hat(:, :, j-1); 
end

% S layer
W_E = 0.33;
W_P = 0.67;
Omega = [0.125, 0.25, 0.125; 0.25, 0, 0.25; 0.125, 0.25, 0.125];
S = zeros(rows, colums, numFrames);
for k = 1: numFrames
    output = energy_distribute(E(:, :, k), Omega);
    S(:, :, k) = output * W_E + P_hat(:, :, k) * W_P;
end

Ts = 8; % Ts = 12
S_hat = S .* (S >= Ts);

% test 输出S_hat
figure('Name', 'S_hat');
for kk = 1: size(S_hat, 3)
    imshow(S_hat(:, :, kk)); % 显示图像
%     imshow(uint8(S_hat(:, :, kk)));
    pause(0.01);
    
    % 帧保存成图片
    imwrite(S_hat(:, :, kk), strcat('./images/', num2str(kk), '.png')); % 保存帧
end







