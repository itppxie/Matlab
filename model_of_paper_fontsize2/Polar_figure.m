% 极坐标图


clc %https://zhuanlan.zhihu.com/p/312069817
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 设置画布的位置
% figure('units','normalized','position',[0.1,0.1,0.7,0.6])
% set(gcf, 'units', 'normalized', 'position', [0.1, 0.1, 0.3, 0.3]);
% 原始的
set(gcf, 'position', [0, 0, 1000, 1000]); % 左0像素，底部0像素，宽1000像素，高1000像素
% set(gcf, 'position', [0, 0, 1000, 1100]); % 左0像素，底部0像素，宽1000像素，高1000像素


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 极坐标系下的角度theta
t = [deg2rad(0), deg2rad(45), deg2rad(90), deg2rad(135), deg2rad(180), deg2rad(225), deg2rad(270), deg2rad(315), deg2rad(360)]; % 函数deg2rad是将度数转换为弧度！
% r = [1, 0.75, 0.25, 0, 0, 0, 0.25, 0.75, 1];
% 读取L、R、U、D等文件里面的值
L=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_L_DSNN.txt'); % L
R=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_R_DSNN.txt'); % R
U=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_U_DSNN.txt'); % U
D=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_D_DSNN.txt'); % D
LU=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_LU_DSNN.txt'); % LU
LD=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_LD_DSNN.txt'); % LD
RU=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_RU_DSNN.txt'); % RU
RD=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\sf_RD_DSNN.txt'); % RD
i = 50; % 修改i，取八个对应文件里面的第几行
% 极坐标系下的半径r
r = [R(i, 2), RU(i, 2), U(i, 2), LU(i, 2), L(i, 2), LD(i, 2), D(i, 2), RD(i, 2), R(i, 2)];
polarplot(t,r,'-go','linewidth',6) % 颜色g，圆圈o
hold on;

% 读取Ts.txt中的阈值
Ts = load('D:\matlabWorkspace\model_of_paper_fontsize2\results\Ts.txt'); % Ts
r_Ts = [Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2), Ts(i, 2)];
% 画阈值
polarplot(t, r_Ts, '--b', 'linewidth', 3);
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%下面，是计算综合向量的位置，使用基向量R和基向量U，将所有向量都分解在基向量R和基向量U上！！！
R_vector_length = 0.0; % 向右向量（基向量）的长度
U_vector_length = 0.0; % 向上向量（基向量）的长度

r_length = R(i, 2);   % 表示R方向的向量长度
ru_length = RU(i, 2); % 表示RU方向的向量长度
u_length = U(i, 2);   % 表示U方向的向量长度
lu_length = LU(i, 2);
l_length = L(i, 2);
ld_length = LD(i, 2);
d_length = D(i, 2);
rd_length = RD(i, 2);

R_vector_length = r_length + ru_length / sqrt(2.0) - lu_length / sqrt(2.0) - l_length - ld_length / sqrt(2.0) + rd_length / sqrt(2.0); % 所有向量在基向量R上分解求和
U_vector_length = u_length + lu_length / sqrt(2.0) - ld_length / sqrt(2.0) - d_length - rd_length / sqrt(2.0) + ru_length / sqrt(2.0); % 所有向量在基向量U上分解求和

disp('所有方向向量合并之后，在R方向上分解的长度');
disp(R_vector_length);
disp('所有方向向量合并之后，在U方向上分解的长度');
disp(U_vector_length);
% 根据正切值计算弧度
theta = atan2(U_vector_length, R_vector_length); % atan2函数，根据正切值计算弧度
disp('所有方向向量合并之后的弧度为：');
disp(theta);
theta_length = sqrt(U_vector_length * U_vector_length + R_vector_length * R_vector_length); % 所有方向向量合并之后的长度
disp('所有方向向量合并之后的长度为：');
disp(theta_length);
if theta_length < 0.2 % 如果theta_length小于0.05，说明各个方向差距不大，因此直接置为0.01即可，这样绘制的就是一个点了！！！
    theta_length = 0.01;
end
% 绘制和向量的位置，即极坐标系下从(0, 0)到(theta, theta_length)
t_1 = [0, theta];
r_1 = [0, min(1,theta_length)]; % min()函数是防止theta_length越界超过1
polarplot(t_1, r_1, '-r', 'linewidth', 4);
hold on;
% 画箭头
theta1 = theta + pi/150; % 箭头的其中一条线的度数，注意，为保证箭头线不会太长，所以要求这个度数小一些
theta2 = theta - pi/150; % 箭头的另一条线的度数
% theta1 = theta + pi/230;
% theta2 = theta - pi/230;
r_arrow = theta_length - 0.1; % 终点缩短以显示箭头头部，原始的
% r_arrow = 1 - 0.1; 
% 绘制箭头头部的两条短线
if theta_length > 0.2 % 如果theta_length小于0.05，说明各个方向差距不大，因此可以不用绘制
    polarplot([theta, theta1], [min(1,theta_length), min(1,r_arrow)], 'r', 'LineWidth', 5);
    polarplot([theta, theta2], [min(1,theta_length), min(1,r_arrow)], 'r', 'LineWidth', 5);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图例
% legend_1 = legend(' DS Neuron ', ' Threshold ', ' Direction ');
% set(legend_1, 'box', 'off'); % 去除图例中的外边框

% set(gca,'linewidth',1,'fontsize',30,'fontname','Times');   % 字体显示
set(gca,'linewidth',1,'fontsize',45,'fontname','Times');   % 字体显示

% 一、角度θ
% thetalim([0, 180]); % 更改t轴的角度范围，使其从0°到180°
% set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360]); % 角度范围0°到360°，且显示的刻度为0°、45°、90°……
set(gca, 'thetalim', [0, 360], 'thetatick', [0, 45, 90, 135, 180, 225, 270, 315, 360], 'thetaaxisunits', 'radians'); % 设置角度显示为pi
% 二、半径r
% rlim([-1, 1]); % 更改r轴的范围，使其从-1到1
set(gca, 'rlim', [0, 1], 'rtick', [0.2 0.4 0.6 0.8 1.0]); 

% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
set(gca, 'position', [0.064, 0.032, 0.855, 0.94]); % 原始的
% set(gca, 'position', [0.064, 0.062, 0.82, 0.84]); % 原始的 可以展示图例的！！！但需配合[0,
% 0, 1000, 1100]使用
set(gca, 'position', [0.064, 0.032, 0.852, 0.93]); % 原始的

