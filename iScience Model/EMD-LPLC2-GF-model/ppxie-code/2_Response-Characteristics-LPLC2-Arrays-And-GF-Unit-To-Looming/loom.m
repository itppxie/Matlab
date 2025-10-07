function [patt, nums] = loom(tao) % patt:当前刺激物，nums:当前帧中被激活的LPLC2神经元数量Nact？
%LOOM EMD parameters setting & looming object detection from the present stimulus
%   Code written by Junyu Zhao, Shengkai Xi.
%   December 20, 2022.

% patt应该是逼近刺激的矩阵变量，且是三维的，代表逼近刺激的视频序列？？？
% 猜测loomingObject函数是根据tao来生成逼近刺激的视频序列，存储在patt三维矩阵变量中？？？
% patt = loomingObject(tao); % pixel value in range 0~1; 600*800*100 
% patt = patt(1:4:end, 1:4:end,:); % 视频序列中，只取部分行和部分列150*200*100

% test 生成patt
load ./ppxie_stimuli/realNear5;

tt = size(patt,3); % tt=100
STEP = 0.01;                          % temporal resolution of EMD in seconds

figure(1)
colormap('gray');
for k = 1:tt
    imagesc(patt(:,:,k));
    pause(STEP); % 每帧播放间隔STEP=0.01s
end

tic;

%the first-order low-pass filter
tauL = 0.050;                         % in seconds, the filter's time constant or the RC circuit's time constant
dL = tauL/STEP; % dL=5                      
a_low(1, 1) = 1/(dL+1);               % 低通滤波器，第一个参数
a_low(1, 2)= 1-a_low(1, 1);           % 低通滤波器，第二个参数

%the first-order high-pass filter
tauH = 0.250;                         % in seconds, the filter's time constant 
dH = tauH/STEP; % dH=25                     
b_high(1, 1) = dH/(dH+1);             % 高通滤波器，第一个参数
b_high(1, 2) = b_high(1, 1);          % 高通滤波器，第二个参数

%EMD_array
EMD_nx=size(patt, 1)-1;  % EMD_nx=149
EMD_ny=size(patt, 2)-1;  % EMD_ny=199
Fh_before = zeros(EMD_nx+1, EMD_ny+1); % 150×200（Fh_before代表该帧经过高通滤波器处理之后的结果，结果是一个二维矩阵？）
Fd_On_before=zeros(EMD_nx+1, EMD_ny+1); % 150×200（Fd_On_before代表该帧经过ON整流和低通滤波器处理之后的结果？）
Fd_Off_before=zeros(EMD_nx+1, EMD_ny+1); % 150×200（Fd_Off_before代表该帧经过OFF整流和低通滤波器处理之后的结果？）

newpicture = patt(:, :, 1); 
readed = 1;
count = 0;
for i = 1:size(patt, 3)-1 % 1~99: 一层一层地读取三维矩阵patt的每一层（每一层即代表视频序列的每一帧），即一帧一帧的读取视频序列
    picture = newpicture; % 第一帧（当前帧）
    readed = readed+1;
    newpicture = patt(:, :,readed ); %  第二帧（后一帧）
    [Fh, Fd_On, Fd_Off, He_On(:,:,i), Hi_On(:,:,i), Ve_On(:,:,i), Vi_On(:,:,i), He_Off(:,:,i), Hi_Off(:,:,i), Ve_Off(:,:,i), Vi_Off(:,:,i)] = emd(EMD_nx, EMD_ny, a_low, b_high, Fh_before, Fd_On_before, Fd_Off_before, picture, newpicture);
    
    LP(:,:,1,i) = Hi_On(:,:,i)+Hi_Off(:,:,i); % leftward motion
    LP(:,:,2,i) = He_On(:,:,i)+He_Off(:,:,i); % rightward motion
    LP(:,:,3,i) = Vi_On(:,:,i)+Vi_Off(:,:,i); % upward motion
    LP(:,:,4,i) = Ve_On(:,:,i)+Ve_Off(:,:,i); % downward motion
    % 经过EMD处理之后，每一帧都会得到一蹲（视频序列一共有几帧就会有多少蹲），并且每一蹲都有4层，代表4个方位的LP1、LP2、LP3、LP4？
    
    % LPLC2整合，即把每一蹲的4层都整合到一层，整合之后每一帧就是LPLC2（三维矩阵）的每一层
    LPLC2(:,:,i) = lplc2conv2(LP(:,:,:,i)); % （乘法整合）怎么整合？这个三维矩阵LPLC2表达了什么意义？

    % 更新Fh_before、Fd_On_before和Fd_Off_before
    Fh_before = Fh;
    Fd_On_before = Fd_On; 
    Fd_Off_before = Fd_Off; 

    %collect the data from LPLC2
    count=count+1;
    nums(count)=numel(find(LPLC2(:,:,i)>0)); % nums是一个数组nums(1)、nums(2)、…：在视频序列的每一帧中统计LPLC2大于0的元素的个数，即是统计每一帧中LPLC2的被激活的神经元数量Nact？？？
end
EMDLPLC_timing =toc;

% test LP的第一层
figure('Name', 'LP的第一层，即向左？');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 1, kk));
    imshow(uint8(LP(:, :, 1, kk)));
    pause(STEP);
    % 帧保存成图片
    imwrite(uint8(LP(:, :, 1, kk)), strcat('C:\\Users\\Administrator\\Desktop\\matlabWorkspace\\Test\\视频帧\\', num2str(kk), '.jpg')); % 保存帧
end

% test LP的第二层
figure('Name', 'LP的第二层，即向右？');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 2, kk));
    imshow(uint8(LP(:, :, 2, kk)));
    pause(STEP);
end

% test LP的第三层
figure('Name', 'LP的第三层，即向上？');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 3, kk));
    imshow(uint8(LP(:, :, 3, kk)));
    pause(STEP);
end

% test LP的第四层
figure('Name', 'LP的第四层，即向下？');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 4, kk));
    imshow(uint8(LP(:, :, 4, kk)));
    pause(STEP);
end

% test LPLC2
figure('Name', 'LPLC2');
for kk = 1: size(LPLC2, 3)
%     imshow(LPLC2(:, :, kk));
    imshow(uint8(LPLC2(:, :, kk)));
    pause(STEP);
end

a = 1;
a = a + 1;


end
