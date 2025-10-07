% 有ground truth版本

clear all;
clc;

a=load('D:\matlabWorkspace\model_of_paper\results\L.txt'); % L 绿色
plot(a(:,1),a(:,2),'-g','LineWidth',3);
hold on;

a=load('D:\matlabWorkspace\model_of_paper\results\R.txt');  % R 蓝色
plot(a(:,1),a(:,2),'-b','LineWidth',3);
hold on;

a=load('D:\matlabWorkspace\model_of_paper\results\U.txt');  % U 红色
plot(a(:,1),a(:,2),'-r','LineWidth',3);
hold on;

a=load('D:\matlabWorkspace\model_of_paper\results\D.txt');  % D 黑色-实线
plot(a(:,1),a(:,2),'-k','LineWidth',3);
hold on;


xlabel('frames','fontsize',35);
ylabel('membrane potential','fontsize',35);

grid off;

legend('L', 'R', 'U', 'D');

set(gca,'linewidth',1,'fontsize',35,'fontname','Times');

% 如果需要标出“Ground truth”，那么就加入下面这句，把“Ground truth”的位置腾出来！如果无需标出则不加！！！
% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
% set(gca, 'position', [0.066, 0.125, 0.926, 0.84]);
set(gca, 'position', [0.066, 0.125, 0.920, 0.84]);

% y坐标范围为[-0.05, 1.05]，但是刻度上并不显示-0.05和1.05这两个刻度，只显示[0, 1.0]这些刻度
% set(gca, 'ylim', [-0.05, 1.05], 'ytick', [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
set(gca, 'ylim', [0, 1.05], 'ytick', [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);




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





