% 将多张图像保存成GIF文件
clc, clear all, close all;

gif_name = './视频合成/test.gif'; % 定义GIF文件名字

% todo：将多张图像保存到一个GIF文件中
for i = 1: 72 % 图像，1~72帧
    image_name = strcat('./视频帧/', num2str(i), '.bmp');
%     disp(image_name); % 打印 读取图像的名字
    frame = imread(image_name);
    [I, map] = rgb2ind(frame, 256);     % 如果是彩图，将RGB图像转换为索引图像
%     [I, map] = gray2ind(frame, 256);  % 如果是灰度图像，将GRAY图像转换为索引图像

    if(i==1)
        imwrite(I, map, gif_name, 'gif', 'DelayTime', 0.05, 'LoopCount', Inf)      % 第一帧
        % DelayTime为0.05指GIF动画中每个图像的显示之间有0.05秒的延迟
    else
        imwrite(I, map, gif_name, 'gif', 'DelayTime', 0.05, 'WriteMode', 'append') % 其余帧   
        % 0.05s的延迟
    end
end