% 没有ground truth版本，简化版

clear all;
clc;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\L.txt'); % L 绿色
plot(a(:,1),a(:,2),'-g','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\R.txt');  % R 蓝色
plot(a(:,1),a(:,2),'-b','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\U.txt');  % U 红色
plot(a(:,1),a(:,2),'-r','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\D.txt');  % D 黑色-实线
plot(a(:,1),a(:,2),'-k','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\LU.txt');  % LU 黄色
plot(a(:,1),a(:,2),'-y','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\LD.txt');  % LD 洋红
plot(a(:,1),a(:,2),'-m','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\RU.txt');  % RU 青绿
plot(a(:,1),a(:,2),'-c','LineWidth',3);
hold on;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\RD.txt');  % RD 黑色-虚线
plot(a(:,1),a(:,2),'--k','LineWidth',3);
hold on;

xlabel('x','fontsize',35);
ylabel('y','fontsize',35);

grid off;

legend('L', 'R', 'U', 'D', 'LU', 'LD', 'RU', 'RD');

set(gca,'linewidth',1,'fontsize',35,'fontname','Times');

set(gca,'ytick',[0.5 0.525 0.550 0.575 0.6 0.625 0.650 0.675 0.7 0.725 0.750 0.775 0.8 0.825 0.850 0.875 0.9 0.925 0.950 0.975 1.0]);




% *************************************************
% *************************************************







