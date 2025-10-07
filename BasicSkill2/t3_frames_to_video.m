% 将视频序列帧，合成视频（倒序，从200帧~100帧）
clc, clear all, close all;

video_1 = VideoWriter('./videos/侧面碰撞-远离'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率

open(video_1);

for i = 76: -1: 1 % 图像序列个数，循环【初始值:step:结束值】
%     filename = strcat('F:/frames/', num2str(i), '.png');
    filename = strcat('./frames/', num2str(i), '.png');
    disp(filename);
    frame = imread(filename);
    writeVideo(video_1, frame);
end
% for i = 32159: 2: 32310 % 图像序列个数，循环【初始值:step:结束值】
%     filename = strcat('F:/frames/', num2str(i), '.png');
%     disp(filename);
%     frame = imread(filename);
%     writeVideo(video_1, frame);
% end
% for i = 32311: 3: 32500 % 图像序列个数，循环【初始值:step:结束值】
%     filename = strcat('F:/frames/', num2str(i), '.png');
%     disp(filename);
%     frame = imread(filename);
%     writeVideo(video_1, frame);
% end

close(video_1);


