% 有ground truth版本

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

% 线条，显示点线1
hold on;
annotation('line',[0.699853587115711 0.699853587115673],... % 两个元素的向量[x_begin x_end]
    [0.982419584634774 0.957575757575758],...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% 线条，显示点线2
hold on;
annotation('line',[0.817715959004416 0.81698389458274],...
    [0.980962559569737 0.957683982683982],...
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% 文本框，用来显示“Ground truth：”字样
hold on;
annotation('textbox',...               % 属性：textbox文本框
    'Position',[0.56588579795022 0.954162031162886 0.132503660322133 0.0569620253164556],... % 位置和尺寸，四个元素的向量[x_begin y_begin length height]。前两个元素指定文本框的左下角坐标，后两个元素指定文本框的长度和高度。
    'String',{'Ground truth:'},...     % 要显示的文本
    'HorizontalAlignment','center',... % 文本框中文本的水平对齐方式
    'FontWeight','normal',...          % 字体粗细
    'FontSize',20,...                  % 字体大小
    'FontAngle','oblique',...          % 字体倾斜
    'FitBoxToText','off',...           % 使框宽和框高适合文本的选项
    'LineStyle','none');               % 框轮廓的线型

% 线条，显示横线
hold on;
annotation('line',[0.699853587115666 0.819180087847731],... % 两个元素的向量[x_begin x_end]，表示起始x坐标和结束x坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    [0.98030303030303 0.98030303030303],...                 % 两个元素的向量[y_begin y_end]，表示起始y坐标和结束y坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    'LineStyle','-',...                                     % Line style："-" (default) | "--" | ":" | "-." | "none"
    'LineWidth',6,...                                       %  Line width：0.5 (default) | positive value
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]); % Line color：[0 0 0] (default) | RGB triplet | hexadecimal color code | "r" | "g" | "b" | ...





