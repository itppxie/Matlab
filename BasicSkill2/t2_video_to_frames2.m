% ��ȡ��Ƶ�ļ�
clc,clear,close all
fileName = './videos/������ײ.avi';
obj = VideoReader(fileName);

numFrames = obj.NumFrames; % ֡������
% frames = read(obj); % ��ȡ����֡����ɫ��Ƶ����ά��972��1920��3��3277���þ���ռ���ڴ�ǳ���17.1GB��
% frame = read(obj, 3); % ��ȡ��3֡
% frame = read(obj, Inf); % ��ȡ���һ֡

% disp('��ӡ������ÿ��ά�ȵĴ�С')
% disp(size(frames)); % ��ʾframes��ÿ��ά�ȵĴ�С
% disp('��ӡ������ά�ȸ���')
% disp(ndims(frames)); % ��ʾframes��ά�ȸ���

for k = 1: numFrames % ��ȡ����
    frame = read(obj, k);
    gray_frame = rgb2gray(frame); % �ҶȻ�
    imshow(gray_frame); % ��ʾ֡
%     pause(0.01);
    % ֡�����ͼƬ
%     imwrite(gray_frame, strcat('./frames/', num2str(k), '.png')); % ����Ҷ�֡
    imwrite(frame, strcat('./frames/', num2str(k), '.png')); % �����ɫ֡
%     imwrite(frame, '100.png') % ����֡�ĸ�ʽ
end

