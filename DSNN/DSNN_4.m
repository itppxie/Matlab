
% 注意：原来DSNN画图表示方向时，朝哪个方向的运动那个方向的值就最低，这样的话其实与常理相反。
% 所以，这里的做法是，朝哪个方向的运动那个方向的值就最高，这样符合常理些！


clear all;
clc;

a=load('E:\Awodebiancheng\VisualStudio2015\OpencvStudyingSolution\DSNN\result\L.txt'); % L 绿色
plot(a(:,1),a(:,2),'--*','LineWidth',1);
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

legend('R', 'L', 'D', 'U', 'RD', 'RU', 'LD', 'LU');

set(gca,'linewidth',1,'fontsize',35,'fontname','Times');

set(gca,'ytick',[0.5 0.525 0.550 0.575 0.6 0.625 0.650 0.675 0.7 0.725 0.750 0.775 0.8 0.825 0.850 0.875 0.9 0.925 0.950 0.975 1.0]);




% *************************************************
% *************************************************







