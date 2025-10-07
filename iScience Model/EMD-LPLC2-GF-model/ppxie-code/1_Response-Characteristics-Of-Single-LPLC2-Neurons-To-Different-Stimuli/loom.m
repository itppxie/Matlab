function LPLC2_core = loom(stimulus,n) % stimulus代表当前刺激，n代表整合方式（n=1是乘法整合，n=2是加法整合）
%LOOM EMD parameters setting & looming object detection from the present stimulus


load(stimulus); % 加载.mat文件（将.mat文件中的所有变量加载到workspace中），该文件中应该有名为patt的矩阵变量 600×800×500？
% patt = 255*patt(1:4:end, 1:4:end,:); % 放大，只取矩阵patt的部分 600×800×500 -> 150×200×500，为什么要放大？
tt = size(patt,3); % 返回patt的第3维的长度500，也即patt矩阵的层数500
STEP = 0.01; % temporal resolution of EMD in seconds（EMD的时间分辨率，每帧的时间间隔0.01s？）

figure(1)
colormap('gray');
for k = 1:tt % 遍历当前刺激的矩阵的每一层（也即遍历当前刺激的序列帧）
    imagesc(patt(:,:,k)); % imagesc(C) 将数组 C 中的数据显示为一个图像，该图像使用颜色图中的全部颜色。
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end

tic; % tic与toc给程序计时

%the first-order low-pass filter（一阶低通滤波器，怎么来处理数字图像？）
tauL = 0.050;                         % in seconds, the filter's time constant or the RC circuit's time constant（0.050s，即50ms？）
dL = tauL/STEP; % dL=5 什么意思？                     
a_low(1, 1) = 1/(dL+1); % 1/6
a_low(1, 2)= 1-a_low(1, 1); % 低通滤波器，数组a_low的作用？

%the first-order high-pass filter（一阶高通滤波器，怎么来处理数字图像？）
tauH = 0.250;                         % in seconds, the filter's time constant（0.250s，即250ms？）
dH = tauH/STEP; % dH=25 什么意思？                     
b_high(1, 1) = dH/(dH+1); % 25/26
b_high(1, 2) = b_high(1, 1); % 高通滤波器，数组b_high的作用？

%EMD_array
EMD_nx=size(patt, 1)-1; % EMD_nx=149，EMD阵列的高
EMD_ny=size(patt, 2)-1; % EMD_ny=199，EMD阵列的宽
Fh_before = zeros(EMD_nx+1, EMD_ny+1); % 150×200，Fh_before什么意思？
Fd_Off_before=zeros(EMD_nx+1, EMD_ny+1); % 150×200，Fd_Off_before什么意思？ 

newpicture = patt(:, :, 1); % 第一帧，视频序列的第一帧
readed = 1;
count = 0;
for i = 1:size(patt, 3)-1 % 1~499
    picture = newpicture; % 第一帧（当前帧）
    readed = readed+1;
    newpicture = patt(:, :,readed ); % 第二帧（后一帧）  
    [Fh, Off, Fd_Off, He_Off(:,:,i), Hi_Off(:,:,i), Ve_Off(:,:,i), Vi_Off(:,:,i)] = emd(EMD_nx, EMD_ny, a_low, b_high, Fh_before, Fd_Off_before, picture, newpicture);
    % EMD_nx, EMD_ny：EMD阵列的高149和宽199，所有的视频序列共用
    % a_low, b_high：低通滤波器与高通滤波器的各自两个参数，所有的视频序列共用
    % Fh_before,Fd_Off_before：两个150×200的矩阵变量，在第1帧全零向量，第2帧就会被更新而非零，什么意思？？？
    % Fh_before表示当前帧在经过高通滤波器处理之前的矩阵值，Fd_Off_before表示当前帧在经过OFF整流和低通滤波器处理之前的矩阵值
    % picture, newpicture：处理的视频序列的当前帧与下一帧
    
    % （emd返回值）Fh对应于Fh_before，表示当前帧在经过高通滤波器处理之后的矩阵结果；Fd_Off对应于Fd_Off_before，表示当前帧在经过OFF整流和低通滤波器处理之后的矩阵结果
    
    % i=1时LP会产生一蹲（该蹲有4层）、i=2时LP也会产生一蹲（该蹲也有4层）、……即视频序列的每一帧LP都会产生一蹲，有多少帧LP就会产生多少蹲，且该蹲LP都有4层，
    LP(:,:,1,i) = Hi_Off(:,:,i); % leftward motion（第i蹲的第1层，检测右->左）
    LP(:,:,2,i) = He_Off(:,:,i); % rightward motion（第i蹲的第2层，检测左->右）
    LP(:,:,3,i) = Vi_Off(:,:,i); % upward motion（第i蹲的第3层，检测下->上）
    LP(:,:,4,i) = Ve_Off(:,:,i); % downward motion（第i蹲的第4层，检测上->下）
    % 小叶板的四层LP1、LP2、LP3和LP4，每一层都对应有一个偏好方向，而LPLC2神经元对这四层小叶板的延申目的是为了提取逼近特征，为了提取逼近特征（视角大小）？
    
    % test
%     imshow(He_Off);
%     imshow(uint8(He_Off));
%     imshow(Hi_Off);
%     imshow(uint8(Hi_Off));
%     imshow(Ve_Off);
%     imshow(uint8(Ve_Off));
%     imshow(Vi_Off);
%     imshow(uint8(Vi_Off));
    
    LPLC2(:,:,i) = lplc2conv2(LP(:,:,:,i),n); % 每一蹲LP都有4层（代表4层LP），lplc2conv2是把每一蹲LP这4层整合起来（乘法整合或加法整合）
    % 现在每一帧都是LPLC2的每一层
    % 现在LPLC2中是不是已经提取到了逼近特征？LPLC2神经元中已经包含了逼近特征的信息？
    
    Fh_before = Fh;         % 更新Fh_before
    Fd_Off_before = Fd_Off; % 更新Fd_Off_before

    %collect the data from LPLC2
    count=count+1;
    nums(count)=numel(find(LPLC2(:,:,i)>0));
    LPLC2_core(i)=LPLC2(floor(end/2),floor(end/2),i); % 只取LPLC2三维矩阵中每一层的最中间那个元素（中间这个元素代表什么意义呢？？？），LPLC2_core(i)应该是一个单独的数值类型，LPLC2_core应该是一个数组
    % 经过LPLC2的整合之后，现在视频序列的每一帧都只得到一个值（即为中心值LPLC2_core(i)），每一帧只对应一个LPLC2中心值了，但是这个值代表什么含义呢？？？
end
% 注意：He_Off、Hi_Off、Ve_Off、Vi_Off都是3D矩阵，执行完整个for循环之后，所有帧的方向信息都存放在这4个3D矩阵中，每帧对应为3D矩阵中的每一层；
% 注意：LP为4D矩阵，149×199×4×499
% disp(size(LP));

% test 输出LP中的某一蹲
% frame_num = 20;
% r1 = LP(:, :, 1, frame_num);
% r2 = LP(:, :, 2, frame_num);
% r3 = LP(:, :, 3, frame_num);
% r4 = LP(:, :, 4, frame_num);
% EMDLPLC_timing =toc;


% test 输出He_Off
figure('Name', 'He_Off');
for kk = 1:size(He_Off, 3)
%     imshow(He_Off(:,:,kk));
    imshow(uint8(He_Off(:,:,kk)));
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end

% test 输出Hi_Off
figure('Name', 'Hi_Off');
for kk = 1:size(Hi_Off, 3)
%     imshow(Hi_Off(:,:,kk));
    imshow(uint8(Hi_Off(:,:,kk)));
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end

% test 输出Ve_Off
figure('Name', 'Ve_Off');
for kk = 1:size(Ve_Off, 3)
%     imshow(Ve_Off(:,:,kk));
    imshow(uint8(Ve_Off(:,:,kk)));
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end

% test 输出Vi_Off
figure('Name', 'Vi_Off');
for kk = 1:size(Vi_Off, 3)
%     imshow(Vi_Off(:,:,kk));
    imshow(uint8(Vi_Off(:,:,kk)));
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end

% test 输出LPLC2
figure('Name', 'LPLC2');
for kk = 1:size(LPLC2, 3)
%     imshow(LPLC2(:,:,kk));
    imshow(uint8(LPLC2(:,:,kk)));
    pause(STEP); % pause(n) 暂停执行 n 秒，然后继续执行。
end
a = 1;
a = a + 1;
end
