
% 在一个已知视频中，生成一组320×240的序列帧（表示一个黑色方块从中心点向内 收缩），并保存成视频
% 假定中心点的行标是120，列标是160
% 具体来说，是一个白色方块在自运动背景中收缩！

clc,clear all;

% 
video_1 = VideoWriter('./视频合成/模拟视频收缩1+白色方块'); % 初始化一个视频文件
video_1.FrameRate = 30; % 帧率
open(video_1);

num_frames = 39; % 帧的总数

frames = zeros(240, 320, num_frames); % 240高×320宽，共39帧
frames = frames + 1; % 注意是+1，这个矩阵最终只有1和0两类值！因为后面是乘法运算！
frames_white = zeros(240, 320, num_frames); % 这个矩阵的作用：把最后的黑色方块处区域填成白色！！！

figure(1);
colormap('gray');

% todo1：生成中间的方块，接下来的做法是：保证中间的黑色方块处矩阵值为0，而周围的矩阵值为1；
for k = 1: num_frames % 1~120
    if k <= 20
        row_up = 120 - k;       % 方块的上面行
        row_down = 120 + k;     % 方块的下面行
        column_left = 160 - k;  % 方块的左边列
        column_right = 160 + k; % 方块的右边列
        if (row_up > 1) && (row_down < 240) && (column_left > 1) && (column_right < 320)
            frames(row_up:1:row_down, column_left:1:column_right, k) = 0; % 黑色方块值为0
            frames_white(row_up:1:row_down, column_left:1:column_right, k) = 255; % 黑色方块处填的255；
        end
    end
    if k > 20
        row_up = 120 - 3*k;       % 方块的上面行
        row_down = 120 + 3*k;     % 方块的下面行
        column_left = 160 - 3*k;  % 方块的左边列
        column_right = 160 + 3*k; % 方块的右边列
        if (row_up > 1) && (row_down < 240) && (column_left > 1) && (column_right < 320)
            frames(row_up:1:row_down, column_left:1:column_right, k) = 0; % 黑色方块值为0
            frames_white(row_up:1:row_down, column_left:1:column_right, k) = 255; % 黑色方块处填的255；
        end
    end
    
end


% todo2：合成视频：两个矩阵中对应元素相乘
for k = 1: num_frames
    frame = frames(:, :, num_frames+1-k); % 方块帧，一维
    frame = uint8(frame); % 类型转换 double to uint8
    
    frame2 = imread(strcat('./视频帧/', num2str(k), '.png')); % 自运动背景帧，三维 uint8
    
    frame3 = frame .* frame2; % 两个矩阵对应元素相乘（一维×三维），得到的结果是，中间为黑色方块，周围不变
    
    frame_white = frames_white(:, :, num_frames+1-k); % 另外一个矩阵，使得中间的黑色方块处为255，其余位置为0；
    frame_white = uint8(frame_white); % 类型转换
    
    frame3 = frame3 + frame_white; % 两个矩阵对应元素相加（三维+一维），得到的结果是，精准地把中间的黑色方块换成了白色方块！
    
    image(frame3);
    pause(0.01);
    frame3 = uint8(frame3);
    writeVideo(video_1, frame3);
end




close(video_1);