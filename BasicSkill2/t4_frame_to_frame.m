

for i = 36800: 3: 37440 % 图像序列个数，循环【初始值:step:结束值】
    filename = strcat('F:/frames/', num2str(i), '.png');
    disp(filename);
    frame = imread(filename);
    imwrite(frame, strcat('./images_jump/', num2str(i), '.png')); % 保存彩色帧
end