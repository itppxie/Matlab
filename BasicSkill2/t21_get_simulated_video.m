% todo：生成模拟视频
% 要求该视频图像是RGB彩色320*240*3，一共100帧，每一帧的像素都为0.

clc, clear all, close all;

myVideo = VideoWriter('./videos/my_video320x240'); % 初始化一个视频文件
myVideo.FrameRate = 100; % 帧率

open(myVideo);

for i = 1: 100
    frame = zeros(240, 320, 3); % （高，宽，通道数）
%     frame = frame + i;
    frame = uint8(frame); % 类型转换，double->uint32
    
%     disp(frame)
    writeVideo(myVideo, frame);
end

close(myVideo);