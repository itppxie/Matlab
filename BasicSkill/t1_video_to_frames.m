
% 读取视频文件，保存成帧
clc,clear,close all

% fileName = './视频素材/自运动视频1.mp4';
fileName = './视频素材/自运动视频2.mp4';
obj = VideoReader(fileName);

numFrames = obj.NumFrames; % 帧的总数

% frame1 = read(obj, 1); % 读取第一帧

delete ./视频帧/*.jpg; % 删除文件夹中所有带有.jpg格式的文件
for k = 1: numFrames % 读取数据
    frame = read(obj, k);
    gray_frame = rgb2gray(frame); % 灰度化
    imshow(gray_frame); % 显示帧
    pause(0.01);
    % 帧保存成图片
    imwrite(gray_frame, strcat('./视频帧/', num2str(k), '.jpg')); % 保存成灰度帧
%     imwrite(frame, '100.png') % 保存帧的格式
end

