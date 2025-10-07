


clear all;
clc;

% Collision Alarm
a=load('D:\matlabWorkspace\model_of_paper_fontsize4\results\result.txt');
% plot(a(:,1)/30,a(:,2),'-b','LineWidth',6);
% hold on;

a_2_column = a(:,2); % 获取a的第二列数据
stem(a_2_column, 'Color', [0.5 0.5 0.5], 'LineWidth', 1); % 绘制针状图，[0.5 0.5 0.5]灰色

% 画一条垂直于x轴的虚线段(10, 0)至(10, 1.3)，表示warning time
line([10 10], [0 1.15], 'linestyle', '--', 'Color', 'r', 'LineWidth', 3); % 红色
% 画一条垂直于x轴的虚线段(148, 0)至(148, 1.3)，表示crash time
line([148 148], [0 1.15], 'linestyle', '--', 'Color', 'b', 'LineWidth', 3); % 蓝色


xlabel('Frames','fontsize',53);
ylabel('Membrane potential','fontsize',53);

grid off;

l =legend(' Spiking ');
set(l, 'Box', 'off'); % 隐藏图例的外边框

% gtext('测试文本'); % 在图形中加入普通文本标注
annotation('textbox', [0.2,0.2,0.3,0.4], 'LineStyle', '-', 'LineWidth', 2, 'String', 'Warning Time', 'FitBoxToText', 'on', 'fontsize', 53, 'Color', 'r', 'fontname','Times');
annotation('textbox', [0.2,0.2,0.3,0.4], 'LineStyle', '-', 'LineWidth', 2, 'String', 'Crash Time', 'FitBoxToText', 'on', 'fontsize', 53, 'Color', 'b', 'fontname','Times');

box on; % 显示边框线

set(gca,'linewidth',1,'fontsize',53,'fontname','Times');

% 如果需要标出“Ground truth”，那么就加入下面这句，把“Ground truth”的位置腾出来！如果无需标出则不加！！！
% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
% set(gca, 'position', [0.066, 0.125, 0.934, 0.84]);
% set(gca, 'position', [0.066, 0.125, 0.920, 0.84]);
set(gca, 'position', [0.095, 0.178, 0.876, 0.763]);   % 修改第三处

% y坐标范围为[-0.05, 1.05]，但是刻度上并不显示-0.05和1.05这两个刻度，只显示[0, 1.0]这些刻度
% set(gca, 'ylim', [-0.05, 1.05], 'ytick', [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
set(gca, 'ylim', [0, 1.5], 'ytick', [0 1.0]);

set(gca, 'xlim', [0 220]);




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
    [0.56588579795022 0.954162031162886 0.192503660322133 0.0569620253164556],...
    'String',{'Ground truth:'},...
    'HorizontalAlignment','center',...
    'FontWeight','light',...
    'FontSize',43,...
    'FontAngle','oblique',...
    'FitBoxToText','off',...
    'LineStyle','none');

hold on;
annotation('line',[0.699853587115666 0.819180087847731],...
    [0.98030303030303 0.98030303030303],'LineWidth',11,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);






