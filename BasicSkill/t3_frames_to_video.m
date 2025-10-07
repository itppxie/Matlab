% 将视频序列帧，合成视频（正向）
clc,clear, clear all;

video_1 = VideoWriter('./视频合成/小球从右向左202503310109'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率

open(video_1);


for i = 60: 1: 152 % 图像序列个数（正向，从1~177）
    filename = strcat('./视频帧/', num2str(i), '.png');
    frame = imread(filename);
    writeVideo(video_1, frame);
end

close(video_1);
