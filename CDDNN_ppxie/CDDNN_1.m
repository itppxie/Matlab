
% 画出左侧区域Left、右侧区域Right区域、前向区域Forward、碰撞警报Alarm

clear all;
clc;

% Left
a=load('.\results\kf_Left.txt');
plot(a(:,1),a(:,2),'--g','LineWidth',2);
hold on;

% Right
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\CDDNN3_ppxie\CDDNN\results\kf_Right.txt');
a=load('.\results\kf_Right.txt');
plot(a(:,1),a(:,2),'--b','LineWidth',2);
hold on;

% Forward
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\CDDNN3_ppxie\CDDNN\results\kf_Forward.txt');
a=load('.\results\kf_Forward.txt');
plot(a(:,1),a(:,2),'--m','LineWidth',2);
hold on;

% Collision Alarm
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\CDDNN3_ppxie\CDDNN\results\warning.txt');
a=load('.\results\warning.txt');
plot(a(:,1),a(:,2),'-r','LineWidth',6);
hold on;


xlabel('frames','fontsize',35);
ylabel('excitation','fontsize',35);

grid off;

% legend(' Left ', ' Right ', ' Forward ', ' Collision Alarm ');
legend(' Left ', ' Right ', ' Forward ');

set(gca,'linewidth',1,'fontsize',35,'fontname','Times');

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
    [0.56588579795022 0.954162031162886 0.132503660322133 0.0569620253164556],...
    'String',{'Ground truth:'},...
    'HorizontalAlignment','center',...
    'FontWeight','light',...
    'FontSize',20,...
    'FontAngle','oblique',...
    'FitBoxToText','off',...
    'LineStyle','none');

hold on;
annotation('line',[0.699853587115666 0.819180087847731],...
    [0.98030303030303 0.98030303030303],'LineWidth',6,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);





