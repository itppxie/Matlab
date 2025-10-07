% todo：生成模拟图像
% 图像1：在100行和200列的白色背景图像中，在右上区域中存在一个20*20的小黑块。
% 具体来说在高宽为100*200的白色图像上，在第20行到第40行与第160列到第180列的相交区域存在一个20*20的黑色小方块。
% 图像2：在100行和200列的白色背景图像中，在右下区域中存在一个20*20的小黑块。
% 具体来说在高宽为100*200的白色图像上，在第60行到第80行与第160列到第180列的相交区域存在一个20*20的黑色小方块。

clc, clear all, close all;

image1 = zeros(100, 200);
image1 = image1 + 255; % 白色背景

image2 = zeros(100, 200);
image2 = image2 + 255; % 白色背景

image1(20:1:40, 160:1:180) = 0; % 黑色块
image2(60:1:80, 160:1:180) = 0; % 黑色块


figure("Name", "my figure1");
colormap('gray');
image(image1);

figure("Name", "my figure2");
colormap('gray');
image(image2);

% 帧保存成图片
imwrite(image1, strcat('./images/', 'image1', '.jpg')); % 保存图像
imwrite(image2, strcat('./images/', 'image2', '.jpg')); % 保存图像



