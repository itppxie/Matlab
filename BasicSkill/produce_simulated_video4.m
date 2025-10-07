
% 在一个已知视频中，生成一组320×240的序列帧（表示一个黑色方块从中心点向内 收缩），并保存成视频
% 假定中心点的行标是120，列标是160
% 具体来说，可以是一个黑色方块在白色背景中收缩，也可以是一个白色方块在黑色背景中收缩！

clc,clear all;

% 
video_1 = VideoWriter('./视频合成/模拟视频收缩1+黑色'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率
open(video_1);

num_frames = 39; % 帧的总数

frames = zeros(240, 320, num_frames); % 240高×320宽，共39帧
frames = frames + 255; % 白色

figure(1);
colormap('gray');

% todo1：生成中间的方块
for k = 1: num_frames % 1~120
    if k <= 20
        row_up = 120 - k;       % 方块的上面行
        row_down = 120 + k;     % 方块的下面行
        column_left = 160 - k;  % 方块的左边列
        column_right = 160 + k; % 方块的右边列
        if (row_up > 1) && (row_down < 240) && (column_left > 1) && (column_right < 320)
            frames(row_up:1:row_down, column_left:1:column_right, k) = 0;
        end
    end
    if k > 20
        row_up = 120 - 3*k;       % 方块的上面行
        row_down = 120 + 3*k;     % 方块的下面行
        column_left = 160 - 3*k;  % 方块的左边列
        column_right = 160 + 3*k; % 方块的右边列
        if (row_up > 1) && (row_down < 240) && (column_left > 1) && (column_right < 320)
            frames(row_up:1:row_down, column_left:1:column_right, k) = 0;
        end
    end
    
end


% todo2：合成视频
for k = 1: num_frames
    frame = frames(:, :, num_frames+1-k);
    
    image(frame);
    pause(0.01);
    frame = uint8(frame);
    writeVideo(video_1, frame);
end




close(video_1);