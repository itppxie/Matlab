function LPLC2 = lplc2conv2(LP,n)
%LPLC2CONV2 LPLC2 array extracts looming feature based on the visual-motions inputs estimated by EMD array

threshold = 2.0;                        % 阈值是什么意思？
% threshold = 0.5; % 修改threshold
% define convolution kernel
side = 100;                              % side should be positive even number:2n
Hside =side/2;                           % half-width must be positive integer，中心位置
kernel = zeros(side,side,4);             % 卷积核大小3D：100*100*4

kernel(Hside-19:Hside+20, Hside+1:end,1) = 1;   % 1层:右卷积核？
kernel(Hside-19:Hside+20, 1:Hside,2) = 1;       % 2层:左卷积核？
kernel(Hside+1:end, Hside-19:Hside+20,3) = 1;   % 3层:下卷积核？
kernel(1:Hside, Hside-19:Hside+20,4) = 1;       % 4层:上卷积核？
 
% 卷积运算什么意思？
pre_LPLC2(:,:,1) = conv2(LP(:,:,1)-LP(:,:,2),kernel(:,:,1),'same');
pre_LPLC2(:,:,2) = conv2(LP(:,:,2)-LP(:,:,1),kernel(:,:,2),'same');
pre_LPLC2(:,:,3) = conv2(LP(:,:,3)-LP(:,:,4),kernel(:,:,3),'same');
pre_LPLC2(:,:,4) = conv2(LP(:,:,4)-LP(:,:,3),kernel(:,:,4),'same');
               
% pre_LPLC2 = pre_LPLC2.*(pre_LPLC2>threshold); % (pre_LPLC2>threshold)是一个logical数组，".*"是两个矩阵对应元素相乘；
% pre_LPLC2.*(pre_LPLC2>threshold)的目的：pre_LPLC2中大于threshold的元素保留，其余元素用0占位；

% 感觉这才是论文中“公式5”的表达
% test threshold 
threshold = 1.0; % 修改threshold阈值！
pre_LPLC2 = (pre_LPLC2 - threshold) .* ((pre_LPLC2 - threshold) > 0); 

if n==1
    LPLC2 = pre_LPLC2(:,:,1).*pre_LPLC2(:,:,2).*pre_LPLC2(:,:,3).*pre_LPLC2(:,:,4); %multiplicative intrgration
else
    LPLC2 = pre_LPLC2(:,:,1)+pre_LPLC2(:,:,2)+pre_LPLC2(:,:,3)+pre_LPLC2(:,:,4);    %additive integration
end
end
