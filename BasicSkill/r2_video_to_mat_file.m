% 读取视频文件，保存成.mat文件
% 其实就是把视频文件保存在一个3D矩阵变量patt，然后将这个3D矩阵变量保存成.mat文件
clc, clear, clear all;

filename = './视频合成/真实靠近5.avi';
% filename = './视频合成/合成视频1.avi';
obj = VideoReader(filename);

numFrames = obj.NumFrames; % 帧的总数
first_frame = read(obj, 1); % 第一帧
rows = size(first_frame, 1);
colums = size(first_frame, 2);

patt = zeros(rows, colums, numFrames); % 装的灰度视频帧

for k = 1: numFrames
    frame = read(obj, k); % rgb
    frame_gray = rgb2gray(frame); % 灰度化
    patt(:, :, k) = frame_gray;
end

% 变量patt存入.mat文件，即realNear5.mat文件
save ./视频合成/realNear5 patt; % 将来读取realNear5.mat中存入的所有变量【load ./视频合成/realNear5】

