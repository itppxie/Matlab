function LPLC2 = lplc2conv2(LP)
%LPLC2CONV2 LPLC2 array extracts looming feature based on the visual-motions inputs estimated by EMD array
%   Code written by Junyu Zhao.
%   December 20,2022. 

threshold = 2.0;
% threshold = 0.5;
% define convolution kernel
side = 100;                              % side should be positive even number:2n
% side = 50; % �޸�side
Hside =side/2;                           % half-width must be positive integer
kernel = zeros(side,side,4); % �����100*100*4����4��

kernel(Hside-19:Hside+20, Hside+1:end,1) = 1; % ����ˣ���1��
kernel(Hside-19:Hside+20, 1:Hside,2) = 1;     % ����ˣ���2��
kernel(Hside+1:end, Hside-19:Hside+20,3) = 1; % ����ˣ���3��
kernel(1:Hside, Hside-19:Hside+20,4) = 1;     % ����ˣ���4��

pre_LPLC2(:,:,1) = conv2(LP(:,:,1)-LP(:,:,2),kernel(:,:,1),'same'); % C = conv2(A,B,'same') ���ؾ������д�С�� A ��ͬ�����Ĳ��֡�
pre_LPLC2(:,:,2) = conv2(LP(:,:,2)-LP(:,:,1),kernel(:,:,2),'same');
pre_LPLC2(:,:,3) = conv2(LP(:,:,3)-LP(:,:,4),kernel(:,:,3),'same');
pre_LPLC2(:,:,4) = conv2(LP(:,:,4)-LP(:,:,3),kernel(:,:,4),'same');

pre_LPLC2 = pre_LPLC2.*(pre_LPLC2>threshold); % pre_LPLC2������Ԫ�أ�����threshold�Ĳ��䣬С��threshold����0��
LPLC2 = pre_LPLC2(:,:,1).*pre_LPLC2(:,:,2).*pre_LPLC2(:,:,3).*pre_LPLC2(:,:,4); %multiplicative intrgration
% LPLC2 = pre_LPLC2(:,:,1) + pre_LPLC2(:,:,2) + pre_LPLC2(:,:,3) + pre_LPLC2(:,:,4); % addtive intrgration;
end