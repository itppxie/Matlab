function LPLC2_core = loom(stimulus,n) % stimulus����ǰ�̼���n�������Ϸ�ʽ��n=1�ǳ˷����ϣ�n=2�Ǽӷ����ϣ�
%LOOM EMD parameters setting & looming object detection from the present stimulus


load(stimulus); % ����.mat�ļ�����.mat�ļ��е����б������ص�workspace�У������ļ���Ӧ������Ϊpatt�ľ������ 600��800��500��
% patt = 255*patt(1:4:end, 1:4:end,:); % �Ŵ�ֻȡ����patt�Ĳ��� 600��800��500 -> 150��200��500��ΪʲôҪ�Ŵ�
tt = size(patt,3); % ����patt�ĵ�3ά�ĳ���500��Ҳ��patt����Ĳ���500
STEP = 0.01; % temporal resolution of EMD in seconds��EMD��ʱ��ֱ��ʣ�ÿ֡��ʱ����0.01s����

figure(1)
colormap('gray');
for k = 1:tt % ������ǰ�̼��ľ����ÿһ�㣨Ҳ��������ǰ�̼�������֡��
    imagesc(patt(:,:,k)); % imagesc(C) ������ C �е�������ʾΪһ��ͼ�񣬸�ͼ��ʹ����ɫͼ�е�ȫ����ɫ��
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end

tic; % tic��toc�������ʱ

%the first-order low-pass filter��һ�׵�ͨ�˲�������ô����������ͼ�񣿣�
tauL = 0.050;                         % in seconds, the filter's time constant or the RC circuit's time constant��0.050s����50ms����
dL = tauL/STEP; % dL=5 ʲô��˼��                     
a_low(1, 1) = 1/(dL+1); % 1/6
a_low(1, 2)= 1-a_low(1, 1); % ��ͨ�˲���������a_low�����ã�

%the first-order high-pass filter��һ�׸�ͨ�˲�������ô����������ͼ�񣿣�
tauH = 0.250;                         % in seconds, the filter's time constant��0.250s����250ms����
dH = tauH/STEP; % dH=25 ʲô��˼��                     
b_high(1, 1) = dH/(dH+1); % 25/26
b_high(1, 2) = b_high(1, 1); % ��ͨ�˲���������b_high�����ã�

%EMD_array
EMD_nx=size(patt, 1)-1; % EMD_nx=149��EMD���еĸ�
EMD_ny=size(patt, 2)-1; % EMD_ny=199��EMD���еĿ�
Fh_before = zeros(EMD_nx+1, EMD_ny+1); % 150��200��Fh_beforeʲô��˼��
Fd_Off_before=zeros(EMD_nx+1, EMD_ny+1); % 150��200��Fd_Off_beforeʲô��˼�� 

newpicture = patt(:, :, 1); % ��һ֡����Ƶ���еĵ�һ֡
readed = 1;
count = 0;
for i = 1:size(patt, 3)-1 % 1~499
    picture = newpicture; % ��һ֡����ǰ֡��
    readed = readed+1;
    newpicture = patt(:, :,readed ); % �ڶ�֡����һ֡��  
    [Fh, Off, Fd_Off, He_Off(:,:,i), Hi_Off(:,:,i), Ve_Off(:,:,i), Vi_Off(:,:,i)] = emd(EMD_nx, EMD_ny, a_low, b_high, Fh_before, Fd_Off_before, picture, newpicture);
    % EMD_nx, EMD_ny��EMD���еĸ�149�Ϳ�199�����е���Ƶ���й���
    % a_low, b_high����ͨ�˲������ͨ�˲����ĸ����������������е���Ƶ���й���
    % Fh_before,Fd_Off_before������150��200�ľ���������ڵ�1֡ȫ����������2֡�ͻᱻ���¶����㣬ʲô��˼������
    % Fh_before��ʾ��ǰ֡�ھ�����ͨ�˲�������֮ǰ�ľ���ֵ��Fd_Off_before��ʾ��ǰ֡�ھ���OFF�����͵�ͨ�˲�������֮ǰ�ľ���ֵ
    % picture, newpicture���������Ƶ���еĵ�ǰ֡����һ֡
    
    % ��emd����ֵ��Fh��Ӧ��Fh_before����ʾ��ǰ֡�ھ�����ͨ�˲�������֮��ľ�������Fd_Off��Ӧ��Fd_Off_before����ʾ��ǰ֡�ھ���OFF�����͵�ͨ�˲�������֮��ľ�����
    
    % i=1ʱLP�����һ�ף��ö���4�㣩��i=2ʱLPҲ�����һ�ף��ö�Ҳ��4�㣩����������Ƶ���е�ÿһ֡LP�������һ�ף��ж���֡LP�ͻ�������ٶף��Ҹö�LP����4�㣬
    LP(:,:,1,i) = Hi_Off(:,:,i); % leftward motion����i�׵ĵ�1�㣬�����->��
    LP(:,:,2,i) = He_Off(:,:,i); % rightward motion����i�׵ĵ�2�㣬�����->�ң�
    LP(:,:,3,i) = Vi_Off(:,:,i); % upward motion����i�׵ĵ�3�㣬�����->�ϣ�
    LP(:,:,4,i) = Ve_Off(:,:,i); % downward motion����i�׵ĵ�4�㣬�����->�£�
    % СҶ����Ĳ�LP1��LP2��LP3��LP4��ÿһ�㶼��Ӧ��һ��ƫ�÷��򣬶�LPLC2��Ԫ�����Ĳ�СҶ�������Ŀ����Ϊ����ȡ�ƽ�������Ϊ����ȡ�ƽ��������ӽǴ�С����
    
    % test
%     imshow(He_Off);
%     imshow(uint8(He_Off));
%     imshow(Hi_Off);
%     imshow(uint8(Hi_Off));
%     imshow(Ve_Off);
%     imshow(uint8(Ve_Off));
%     imshow(Vi_Off);
%     imshow(uint8(Vi_Off));
    
    LPLC2(:,:,i) = lplc2conv2(LP(:,:,:,i),n); % ÿһ��LP����4�㣨����4��LP����lplc2conv2�ǰ�ÿһ��LP��4�������������˷����ϻ�ӷ����ϣ�
    % ����ÿһ֡����LPLC2��ÿһ��
    % ����LPLC2���ǲ����Ѿ���ȡ���˱ƽ�������LPLC2��Ԫ���Ѿ������˱ƽ���������Ϣ��
    
    Fh_before = Fh;         % ����Fh_before
    Fd_Off_before = Fd_Off; % ����Fd_Off_before

    %collect the data from LPLC2
    count=count+1;
    nums(count)=numel(find(LPLC2(:,:,i)>0));
    LPLC2_core(i)=LPLC2(floor(end/2),floor(end/2),i); % ֻȡLPLC2��ά������ÿһ������м��Ǹ�Ԫ�أ��м����Ԫ�ش���ʲô�����أ���������LPLC2_core(i)Ӧ����һ����������ֵ���ͣ�LPLC2_coreӦ����һ������
    % ����LPLC2������֮��������Ƶ���е�ÿһ֡��ֻ�õ�һ��ֵ����Ϊ����ֵLPLC2_core(i)����ÿһֻ֡��Ӧһ��LPLC2����ֵ�ˣ��������ֵ����ʲô�����أ�����
end
% ע�⣺He_Off��Hi_Off��Ve_Off��Vi_Off����3D����ִ��������forѭ��֮������֡�ķ�����Ϣ���������4��3D�����У�ÿ֡��ӦΪ3D�����е�ÿһ�㣻
% ע�⣺LPΪ4D����149��199��4��499
% disp(size(LP));

% test ���LP�е�ĳһ��
% frame_num = 20;
% r1 = LP(:, :, 1, frame_num);
% r2 = LP(:, :, 2, frame_num);
% r3 = LP(:, :, 3, frame_num);
% r4 = LP(:, :, 4, frame_num);
% EMDLPLC_timing =toc;


% test ���He_Off
figure('Name', 'He_Off');
for kk = 1:size(He_Off, 3)
%     imshow(He_Off(:,:,kk));
    imshow(uint8(He_Off(:,:,kk)));
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end

% test ���Hi_Off
figure('Name', 'Hi_Off');
for kk = 1:size(Hi_Off, 3)
%     imshow(Hi_Off(:,:,kk));
    imshow(uint8(Hi_Off(:,:,kk)));
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end

% test ���Ve_Off
figure('Name', 'Ve_Off');
for kk = 1:size(Ve_Off, 3)
%     imshow(Ve_Off(:,:,kk));
    imshow(uint8(Ve_Off(:,:,kk)));
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end

% test ���Vi_Off
figure('Name', 'Vi_Off');
for kk = 1:size(Vi_Off, 3)
%     imshow(Vi_Off(:,:,kk));
    imshow(uint8(Vi_Off(:,:,kk)));
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end

% test ���LPLC2
figure('Name', 'LPLC2');
for kk = 1:size(LPLC2, 3)
%     imshow(LPLC2(:,:,kk));
    imshow(uint8(LPLC2(:,:,kk)));
    pause(STEP); % pause(n) ��ִͣ�� n �룬Ȼ�����ִ�С�
end
a = 1;
a = a + 1;
end
