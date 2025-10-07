

clear all;
clc;

% L
a=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\L-FVBNN.txt');
plot(a(:,1),a(:,2),'-g','LineWidth',3);
hold on;

% R
a=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\R-FVBNN.txt');
plot(a(:,1),a(:,2),'--r','LineWidth',3);
hold on;

% F
a=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\F-FVBNN.txt');
plot(a(:,1),a(:,2),'-b','LineWidth',3);
hold on;

% B
a=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\B-FVBNN.txt');
plot(a(:,1),a(:,2),'--k','LineWidth',3);
hold on;

% 赤道E
a=load('D:\matlabWorkspace\model_of_paper_fontsize2\results\E-FVBNN.txt');
plot(a(:,1),a(:,2),':c','LineWidth',3);
hold on;

% xlabel('frames','fontsize',35);     % 原始字体
% ylabel('excitation','fontsize',35); % 原始字体
xlabel('Frames','fontsize',45);       % 修改第一处
ylabel('Membrane potential','fontsize',45);

grid off;

legend(' L-FVBNN ', ' R-FVBNN ',' F-FVBNN ', ' B-FVBNN ', ' E-FVBNN ');

% set(gca,'linewidth',1,'fontsize',35,'fontname','Times'); % 原始字体
set(gca,'linewidth',1,'fontsize',45,'fontname','Times');   % 修改第二处

% 如果需要标出“Ground truth”，那么就加入下面这句，把“Ground truth”的位置腾出来！如果无需标出则不加！！！
% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
% set(gca, 'position', [0.066, 0.125, 0.934, 0.84]); % 可能有部分横坐标刻度显示不完！！！
% set(gca, 'position', [0.066, 0.125, 0.920, 0.84]); % 基本能显示清楚每个横坐标刻度了！
set(gca, 'position', [0.084, 0.160, 0.892, 0.79]);   % 修改第三处

% y坐标范围为[-0.05, 1.05]，但是刻度上并不显示-0.05和1.05这两个刻度，只显示[0, 1.0]这些刻度
% set(gca, 'ylim', [-0.05, 1.05], 'ytick', [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
set(gca, 'ylim', [0, 1.05], 'ytick', [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);




% *************************************************
% *************************************************


hold on;
annotation('line',[0.699853587115711 0.699853587115673],...
    [0.982419584634774 0.957575757575758],'LineStyle',':','LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

hold on;
annotation('line',[0.817715959004416 0.81698389458274],...
    [0.980962559569737 0.957683982683982],'LineStyle',':','LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

hold on;
annotation('textbox',...
    [0.56588579795022 0.954162031162886 0.162503660322133 0.0569620253164556],...
    'String',{'Ground truth:'},...
    'HorizontalAlignment','center',...
    'FontWeight','light',...
    'FontSize',35,...
    'FontAngle','oblique',...
    'FitBoxToText','off',...
    'LineStyle','none');

hold on;
annotation('line',[0.699853587115666 0.819180087847731],...
    [0.98030303030303 0.98030303030303],'LineWidth',9,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);





