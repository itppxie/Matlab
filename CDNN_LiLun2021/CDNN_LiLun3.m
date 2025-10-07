
% 画LDN、DDN、RDN、CDNf、Tf、Alarm

clear all;
clc;

% LDN
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\Nf_L.txt');
a=load('.\results\Nf_L.txt');
plot(a(:,1),a(:,2),'--g','LineWidth',1);
hold on;

% DDN
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\Nf_D.txt');
a=load('.\results\Nf_D.txt');
plot(a(:,1),a(:,2),'--b','LineWidth',1);
hold on;

% RDN
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\Nf_R.txt');
a=load('.\results\Nf_R.txt');
plot(a(:,1),a(:,2),'--c','LineWidth',1);
hold on;

% CDNf
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\CDNf.txt');
a=load('.\results\CDNf.txt');
plot(a(:,1),a(:,2),'-b','LineWidth',2);
hold on;

% Tf
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\Tf.txt');
a=load('.\results\Tf.txt');
plot(a(:,1),a(:,2),'-c','LineWidth',2);
hold on;

% Alarm
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LiLun2021\LiLun2021\results\Alarm_f.txt');
a=load('.\results\Alarm_f.txt');
plot(a(:,1),a(:,2),'-r','LineWidth',2);
hold on;

xlabel('frames','fontsize',35);
ylabel('excitation','fontsize',35);

grid off;

legend(' LDN ', ' DDN ', ' RDN ', ' CDNf ', ' Tf ', ' Alarm ');

set(gca,'linewidth',1,'fontsize',35,'fontname','Times');

set(gca,'ytick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);




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





