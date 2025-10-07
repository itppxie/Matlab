function [patt, nums] = loom(tao) % patt:��ǰ�̼��nums:��ǰ֡�б������LPLC2��Ԫ����Nact��
%LOOM EMD parameters setting & looming object detection from the present stimulus
%   Code written by Junyu Zhao, Shengkai Xi.
%   December 20, 2022.

% pattӦ���Ǳƽ��̼��ľ��������������ά�ģ�����ƽ��̼�����Ƶ���У�����
% �²�loomingObject�����Ǹ���tao�����ɱƽ��̼�����Ƶ���У��洢��patt��ά��������У�����
% patt = loomingObject(tao); % pixel value in range 0~1; 600*800*100 
% patt = patt(1:4:end, 1:4:end,:); % ��Ƶ�����У�ֻȡ�����кͲ�����150*200*100

% test ����patt
load ./ppxie_stimuli/realNear5;

tt = size(patt,3); % tt=100
STEP = 0.01;                          % temporal resolution of EMD in seconds

figure(1)
colormap('gray');
for k = 1:tt
    imagesc(patt(:,:,k));
    pause(STEP); % ÿ֡���ż��STEP=0.01s
end

tic;

%the first-order low-pass filter
tauL = 0.050;                         % in seconds, the filter's time constant or the RC circuit's time constant
dL = tauL/STEP; % dL=5                      
a_low(1, 1) = 1/(dL+1);               % ��ͨ�˲�������һ������
a_low(1, 2)= 1-a_low(1, 1);           % ��ͨ�˲������ڶ�������

%the first-order high-pass filter
tauH = 0.250;                         % in seconds, the filter's time constant 
dH = tauH/STEP; % dH=25                     
b_high(1, 1) = dH/(dH+1);             % ��ͨ�˲�������һ������
b_high(1, 2) = b_high(1, 1);          % ��ͨ�˲������ڶ�������

%EMD_array
EMD_nx=size(patt, 1)-1;  % EMD_nx=149
EMD_ny=size(patt, 2)-1;  % EMD_ny=199
Fh_before = zeros(EMD_nx+1, EMD_ny+1); % 150��200��Fh_before�����֡������ͨ�˲�������֮��Ľ���������һ����ά���󣿣�
Fd_On_before=zeros(EMD_nx+1, EMD_ny+1); % 150��200��Fd_On_before�����֡����ON�����͵�ͨ�˲�������֮��Ľ������
Fd_Off_before=zeros(EMD_nx+1, EMD_ny+1); % 150��200��Fd_Off_before�����֡����OFF�����͵�ͨ�˲�������֮��Ľ������

newpicture = patt(:, :, 1); 
readed = 1;
count = 0;
for i = 1:size(patt, 3)-1 % 1~99: һ��һ��ض�ȡ��ά����patt��ÿһ�㣨ÿһ�㼴������Ƶ���е�ÿһ֡������һ֡һ֡�Ķ�ȡ��Ƶ����
    picture = newpicture; % ��һ֡����ǰ֡��
    readed = readed+1;
    newpicture = patt(:, :,readed ); %  �ڶ�֡����һ֡��
    [Fh, Fd_On, Fd_Off, He_On(:,:,i), Hi_On(:,:,i), Ve_On(:,:,i), Vi_On(:,:,i), He_Off(:,:,i), Hi_Off(:,:,i), Ve_Off(:,:,i), Vi_Off(:,:,i)] = emd(EMD_nx, EMD_ny, a_low, b_high, Fh_before, Fd_On_before, Fd_Off_before, picture, newpicture);
    
    LP(:,:,1,i) = Hi_On(:,:,i)+Hi_Off(:,:,i); % leftward motion
    LP(:,:,2,i) = He_On(:,:,i)+He_Off(:,:,i); % rightward motion
    LP(:,:,3,i) = Vi_On(:,:,i)+Vi_Off(:,:,i); % upward motion
    LP(:,:,4,i) = Ve_On(:,:,i)+Ve_Off(:,:,i); % downward motion
    % ����EMD����֮��ÿһ֡����õ�һ�ף���Ƶ����һ���м�֡�ͻ��ж��ٶף�������ÿһ�׶���4�㣬����4����λ��LP1��LP2��LP3��LP4��
    
    % LPLC2���ϣ�����ÿһ�׵�4�㶼���ϵ�һ�㣬����֮��ÿһ֡����LPLC2����ά���󣩵�ÿһ��
    LPLC2(:,:,i) = lplc2conv2(LP(:,:,:,i)); % ���˷����ϣ���ô���ϣ������ά����LPLC2�����ʲô���壿

    % ����Fh_before��Fd_On_before��Fd_Off_before
    Fh_before = Fh;
    Fd_On_before = Fd_On; 
    Fd_Off_before = Fd_Off; 

    %collect the data from LPLC2
    count=count+1;
    nums(count)=numel(find(LPLC2(:,:,i)>0)); % nums��һ������nums(1)��nums(2)����������Ƶ���е�ÿһ֡��ͳ��LPLC2����0��Ԫ�صĸ���������ͳ��ÿһ֡��LPLC2�ı��������Ԫ����Nact������
end
EMDLPLC_timing =toc;

% test LP�ĵ�һ��
figure('Name', 'LP�ĵ�һ�㣬������');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 1, kk));
    imshow(uint8(LP(:, :, 1, kk)));
    pause(STEP);
    % ֡�����ͼƬ
    imwrite(uint8(LP(:, :, 1, kk)), strcat('C:\\Users\\Administrator\\Desktop\\matlabWorkspace\\Test\\��Ƶ֡\\', num2str(kk), '.jpg')); % ����֡
end

% test LP�ĵڶ���
figure('Name', 'LP�ĵڶ��㣬�����ң�');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 2, kk));
    imshow(uint8(LP(:, :, 2, kk)));
    pause(STEP);
end

% test LP�ĵ�����
figure('Name', 'LP�ĵ����㣬�����ϣ�');
for kk = 1: size(LP, 4)
%     imshow(LP(:, :, 3, kk));
    imshow(uint8(LP(:, :, 3, kk)));
    pause(STEP);
end

% test LP�ĵ��Ĳ�
figure('Name', 'LP�ĵ��Ĳ㣬�����£�');
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
