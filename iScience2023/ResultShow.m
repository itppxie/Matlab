% 程序入口
% 注意，该程序从源代码版本中经过删减得来
% 注意，此时每次只能跑一个视频！！！

close all;
clear all;
addpath(genpath(pwd));
stimulus = {'撞上了前面的小车.avi'}; 
for i = 1:length(stimulus) 
    [patt,v{i}] = GF(stimulus{i});
end

figure(2)
set(gcf,'Units','normalized','Position',[0.2 0.02 0.6 0.5]);

% 如果需要标出“Ground truth”，那么就加入下面这句，把“Ground truth”的位置腾出来！如果无需标出则不加！！！
% 设置坐标轴axes，set(gca, 'position', [left, top, width, height])，其中left为axes距离figure左边框的距离​，top为axes距离figure上边框的距离，width为axes（即图像）的宽度，height为axes的高度。
% set(gca, 'position', [0.066, 0.125, 0.934, 0.84]);

colormap('gray');
set(gcf, 'color', 'w');
%============================================
k = 1;
stamp=1:length(v{k});
stamp=stamp/(20*100);
% plot(stamp,v{k},'-g', 'LineWidth', 6); % 原始的
% % 在画图之前，需先将stamp和v{1}进行延长！（撞上了前面的小车）
for i = 4302 : 1 : 14400
    stamp_value = 0.0005 * (i - 4301) + 2.1505;
    stamp = [stamp stamp_value]; % 给矩阵stamp加一列，加的一列数值为stamp_value
    v{k} = [v{k} -80]; % 给矩阵v{k}也加一列，加的一列数值为-80
end
% 在画图之前，需先将stamp和v{1}进行延长！（上方广告牌）
% for i = 4302 : 1 : 6600
%     stamp_value = 0.0005 * (i - 4301) + 2.1505;
%     stamp = [stamp stamp_value]; % 给矩阵stamp加一列，加的一列数值为stamp_value
%     v{k} = [v{k} -60]; % 给矩阵v{k}也加一列，加的一列数值为-60
% end
plot(stamp,v{k},'-r', 'LineWidth', 6); % 原始的

set(gca, 'position', [0.099, 0.178, 0.876, 0.763]);   % 修改第三处


% 以下是原始的写法
% xlabel('Time(s)', 'fontsize',35); 
% ylabel('Membrane potential (mV)', 'fontsize',35);
% set(gca,'Ylim',[-90,50], 'linewidth',1,'fontsize',35,'fontname','Times');
% set(gca,'Xlim',[0,stamp(end)], 'linewidth',1,'fontsize',35,'fontname','Times');

% 以下是修改之后的（修改了字体显示大小等）
xlabel('Time(s)', 'fontsize',53);
ylabel('Membrane potential', 'fontsize',53);
set(gca,'Ylim',[-90,50], 'linewidth',1,'fontsize',53,'fontname','Times');
% set(gca,'Xlim',[0,stamp(end)], 'linewidth',1,'fontsize',45,'fontname','Times'); % 原始写法
set(gca,'Xlim',[0,7.5], 'linewidth',1,'fontsize',53,'fontname','Times');

l = legend(' GF ');
set(l, 'Box', 'off'); % 隐藏图例的外边框

%%%%%%%%%%%%% 显示Ground truth部分
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
%%%%%%%%%%%%%
