% 读取视频文件
clc,clear,close all
fileName = './videos/侧面碰撞.avi';
obj = VideoReader(fileName);

numFrames = obj.NumFrames; % 帧的总数
% frames = read(obj); % 获取所有帧（彩色视频，四维，972×1920×3×3277，该矩阵占用内存非常大，17.1GB）
% frame = read(obj, 3); % 获取第3帧
% frame = read(obj, Inf); % 获取最后一帧

% disp('打印变量的每个维度的大小')
% disp(size(frames)); % 显示frames的每个维度的大小
% disp('打印变量的维度个数')
% disp(ndims(frames)); % 显示frames的维度个数

for k = 1: numFrames % 读取数据
    frame = read(obj, k);
    gray_frame = rgb2gray(frame); % 灰度化
    imshow(gray_frame); % 显示帧
%     pause(0.01);
    % 帧保存成图片
%     imwrite(gray_frame, strcat('./frames/', num2str(k), '.png')); % 保存灰度帧
    imwrite(frame, strcat('./frames/', num2str(k), '.png')); % 保存彩色帧
%     imwrite(frame, '100.png') % 保存帧的格式
end

