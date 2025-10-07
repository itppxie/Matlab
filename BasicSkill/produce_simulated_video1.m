% 生成运动条

clc,clear all;

frames = zeros(100, 100, 50);
frames = frames + 255; % 白色

% figure(1);
% colormap('gray');
% % imagesc(frame);
% image(frame);
% % pause(5); 

figure(1);
colormap('gray');
for k = 1: size(frames, 3) % 1~50
    frames(40:1:60, 1:1:k, k) = 0; % 第40~60行，每增加一帧就多增加一列为黑色；
    image(frames(:, :, k));
    pause(0.01);
end

% patt = frames;
% save ./resultDirectory/simulatedVideo patt;