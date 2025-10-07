

clear all;
clc;

% LGMD Neuron
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LGMD1_FuQinbing2018\LGMD1_Fu2018\results\SMP.txt');
a=load('.\results\SMP.txt');
plot(a(:,1),a(:,2),'-g','LineWidth',3);
hold on;

% Threshold Level
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LGMD1_FuQinbing2018\LGMD1_Fu2018\results\Ts.txt');
a=load('.\results\Ts.txt');
plot(a(:,1),a(:,2),'--b','LineWidth',3);
hold on;

% Collision Alarm
% a=load('E:\Awodebiancheng\PyCharm\ScientificResearch\LGMD1_FuQinbing2018\LGMD1_Fu2018\results\warning.txt');
a=load('.\results\warning.txt');
plot(a(:,1),a(:,2),'-r','LineWidth',6);
hold on;

xlabel('frames','fontsize',35);
ylabel('excitation','fontsize',35);

grid off;

legend(' LGMD1 ', ' Spiking threshold ',' Collision Alarm ');

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





