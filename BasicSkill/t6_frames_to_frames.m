% 修改帧的名称：删除帧名字中的中文名称

for i = 1: 1: 86 % 图像序列个数（正向，从1~177）
    filename = strcat('./视频帧/', num2str(i), '-副本', '.png');
    frame = imread(filename);
    imwrite(frame, strcat('./视频帧2/', num2str(i), '.png')); % 保存帧
end