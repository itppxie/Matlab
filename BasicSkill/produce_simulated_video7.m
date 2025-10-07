
% 生成一组320×240的序列帧（颜色从白色逐渐渐变成黑色），并保存成视频

clc,clear all;

% 
video_1 = VideoWriter('./视频合成/模拟视频-颜色渐变'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率
open(video_1);

frames = zeros(240, 320, 52); % 240高×320宽，共120帧
frames = frames + 255; % 白色

figure(1);
colormap('gray');
for k = 1: size(frames, 3) % 1~52
    frames(:, :, k) = 260 - 5 * k;
    frame = frames(:, :, k);
    image(frame);
    pause(0.01);
    
    frame = uint8(frame);
    writeVideo(video_1, frame);
end

close(video_1);