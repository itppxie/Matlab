
clc, clear all, close all;

% 第一步：先确定坐标轴axis的位置和大小
figure(1);
set(gca, 'Position', [0.1 0.1 0.8 0.8]); % axis位置和大小设置，距离figure左边界10%、距离figure下边界10%、axis宽80%、axis高80%；
xlim([0 500]);
ylim([0 1]);

% 第二步：再根据公式确定ground truth线段在figure图板中的起点坐标和终点坐标，如（0.42，0.9）到（0.58，0.9）
% 1、辅助线一，绘制（0.42，0.1）到（0.42，0.9）的虚文本箭头
% hold on;
% annotation('textarrow',[0.42 0.42],... 
%     [0.1 0.9],...                    
%     'String', 'figure中坐标为(0.42, 0.1)',...
%     'Color',[0 0 0],... % 箭头颜色
%     'LineStyle','-.',... 
%     'LineWidth',0.5);

% 2、辅助线二，绘制（0.58，0.1）到（0.58，0.9）的虚文本箭头
% hold on;
% annotation('textarrow',[0.58 0.58],... 
%     [0.1 0.9],...                    
%     'String', 'figure中坐标为(0.58, 0.1)',...
%     'Color',[0 0 0],... % 箭头颜色
%     'LineStyle','-.',... 
%     'LineWidth',0.5);

% 第三步：连接起点坐标和终点坐标，即可得到最终的ground truth线段，如（0.42，0.9）到（0.58，0.9）
% 3、绘制（0.42，0.9）到（0.58，0.9）的实文本箭头，即为真实的ground truth线段
hold on;
annotation('textarrow',[0.42 0.58],... 
    [0.9 0.9],...                    
    'String', 'figure中坐标为(0.42, 0.9)',...
    'Color',[0 1 0],... % 箭头颜色
    'LineStyle','-',... 
    'LineWidth',0.5);   

% 第四步：实际当中，ground truth线段往往要向上平移一点点，方便显示更美观。
% 向上平移一点点（平移0.015），如绘制（0.42，0.915）到（0.58，0.915）的实线段，即为需要的ground truth线段
hold on;
annotation('line',[0.42 0.58],... % 两个元素的向量[x_begin x_end]，表示起始x坐标和结束x坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    [0.915 0.915],...             % 两个元素的向量[y_begin y_end]，表示起始y坐标和结束y坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。                   
    'LineStyle','-',... 
    'LineWidth',6,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]); % 颜色 

% 第五步：文本框，用来显示“Ground truth”字样（文本框 宽0.09，高0.03 都是定值，只需确定起始点坐标！）
% 在第四步已经确定了ground truth线段的基础上，（向上平移前的）线段左端点，向左平移0.09，即可作为textbox的左下角坐标，如起始点（0.33，0.9）
% 注意，最后隐藏文本框，即设置LineStyle为'none'！
hold on;
annotation('textbox',...               % 属性：textbox文本框
    'Position',[0.33 0.9 0.09 0.03],... % 位置和尺寸，四元素向量[x_begin y_begin length height]。前两个元素指定文本框的左下角坐标，后两个元素指定文本框的长度和高度。默认情况下，使用归一化的图窗单位。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    'String',{'Ground truth:'},...     % 要显示的文本
    'HorizontalAlignment','left',...   % 文本框中文本的水平对齐方式："left" (默认) | "center" | "right"
    'VerticalAlignment','middle',...   % 文本框中文本的垂直对齐方式：'top' (默认) | 'middle' | 'bottom'
    'FontWeight','normal',...          % 字体粗细
    'FontSize',20,...                  % 字体大小
    'FontAngle','oblique',...          % 字体倾斜
    'FitBoxToText','off',...           % 使框宽和框高适合文本的选项：'on' (默认) | on/off 逻辑值
    'LineStyle','none',...                % 框轮廓的线型：'none'、'-'(默认)、'--'、'-.'、':'
    'EdgeColor', [1 0 0]);             % 框轮廓的颜色：[0 0 0] (default) | RGB triplet | hexadecimal color code | "r" | "g" | "b" | ... 

% 第六步：点线，用来显示ground truth线段左右的两条点线段。
% 两条点线段，分别是ground truth线段在向上平移前的左（右）端点坐标到向上平移0.015后的左（右）端点坐标。
% 线条，显示点线1。如从（0.42，0.9）到（0.42，0.915）
hold on;
annotation('line',[0.42 0.42],... % 两个元素的向量[x_begin x_end]
    [0.9 0.915],...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% 线条，显示点线2。如从（0.58，0.9）到（0.58，0.915）
hold on;
annotation('line',[0.58 0.58],... % 两个元素的向量[x_begin x_end]
    [0.9 0.915],...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

