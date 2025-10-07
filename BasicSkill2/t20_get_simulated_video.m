% todo：生成模拟视频
% 要求该视频图像是RGB彩色10*10*3，一共10帧，第一帧的像素全为1，第二帧的像素全为2，……，第十帧的像素全为10.

clc, clear all, close all;

myVideo = VideoWriter('./videos/my_video'); % 初始化一个视频文件
myVideo.FrameRate = 10; % 帧率

open(myVideo);

for i = 1: 10
    frame = zeros(10, 10, 3);
    frame = frame + i;
    frame = uint8(frame); % 类型转换，double->uint32
    
%     disp(frame)
    writeVideo(myVideo, frame);
end

close(myVideo);