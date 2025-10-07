% 将视频序列帧，合成视频（反向，从200帧~100帧）
clc, clear all, close all;

video_1 = VideoWriter('./videos/正面碰撞'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率

open(video_1);

for i = 200: -1: 100 % 图像序列个数（反向，200~100）
    filename = strcat('./frames/', num2str(i), '.png');
    frame = imread(filename);
    writeVideo(video_1, frame);
end

close(video_1);


