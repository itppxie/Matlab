
% 注意：调用该函数之前，必须保证坐标轴axis的位置和大小是[0.1 0.1 0.8 0.8])！！！！
% 注：实际使用当中，可以把第二步中的“辅助线一”和“辅助线二”注释掉，不显示
function [test] = Ground_truth(scale_of_x_axis, scale_of_ground_truth)

test = 0;

% scale_of_x_axis = [x_origin, x_destination]; % 坐标轴x的起始刻度和终点刻度！
% scale_of_ground_truth = [x1, x2]; % ground truth的起点和终点！
x_origin = scale_of_x_axis(1);                  % x轴的起始刻度，从0或1开始
x_destination = scale_of_x_axis(2);             % x的结束刻度
x_groundTruth_start = scale_of_ground_truth(1); % ground truth的起始值
x_groundTruth_end = scale_of_ground_truth(2);   % ground truth的结束值

% （x1_groundTruth_preTranslate，y1_groundTruth_preTranslate）为ground truth线段，在向上平移0.015之前，计算出来的左端点坐标
% （x2_groundTruth_preTranslate，y2_groundTruth_preTranslate）为ground truth线段，在向上平移0.015之前，计算出来的右端点坐标
x1_groundTruth_preTranslate = 0; 
y1_groundTruth_preTranslate = 0;
x2_groundTruth_preTranslate = 0;
y2_groundTruth_preTranslate = 0;
% （x1_groundTruth_postTranslate，y1_groundTruth_postTranslate）为ground truth线段，在向上平移0.015之后，计算出来的左端点坐标
% （x2_groundTruth_postTranslate，y2_groundTruth_postTranslate）为ground truth线段，在向上平移0.015之后，计算出来的右端点坐标
x1_groundTruth_postTranslate = 0; 
y1_groundTruth_postTranslate = 0;
x2_groundTruth_postTranslate = 0;
y2_groundTruth_postTranslate = 0;

% 计算在figure坐标系下的点坐标，向上平移之前的：
x1_groundTruth_preTranslate = 0.1 + (1.0 * (x_groundTruth_start - x_origin)) / (1.0 * (x_destination - x_origin)) * 0.8;
y1_groundTruth_preTranslate = 0.9;
x2_groundTruth_preTranslate = 0.1 + (1.0 * (x_groundTruth_end - x_origin)) / (1.0 * (x_destination - x_origin)) * 0.8;
y2_groundTruth_preTranslate = 0.9;

% 计算向上平移0.015后的：
x1_groundTruth_postTranslate = x1_groundTruth_preTranslate;
y1_groundTruth_postTranslate = y1_groundTruth_preTranslate + 0.015; % 0.915
x2_groundTruth_postTranslate = x2_groundTruth_preTranslate;
y2_groundTruth_postTranslate = y2_groundTruth_preTranslate + 0.015; % 0.915


% % 第一步：先确定坐标轴axis的位置和大小
% figure(1);
% set(gca, 'Position', [0.1 0.1 0.8 0.8]); % axis位置和大小设置，距离figure左边界10%、距离figure下边界10%、axis宽80%、axis高80%；

% 第二步：再根据公式确定ground truth线段在figure图板中的起点坐标和终点坐标，如（0.42，0.9）到（0.58，0.9）
% 1、辅助线一，绘制（0.42，0.1）到（0.42，0.9）的虚文本箭头
x_scale_11 = [x1_groundTruth_preTranslate, x1_groundTruth_preTranslate];
y_scale_111 = [0.1, y2_groundTruth_preTranslate];
hold on;
annotation('textarrow',x_scale_11,... 
    y_scale_111,...                    
    'String', 'figure中坐标为？',...
    'Color',[0 0 0],... % 箭头颜色
    'LineStyle','-.',... 
    'LineWidth',0.5);

% 2、辅助线二，绘制（0.58，0.1）到（0.58，0.9）的虚文本箭头
x_scale_22 = [x2_groundTruth_preTranslate, x2_groundTruth_preTranslate];
y_scale_222 = [0.1, y2_groundTruth_preTranslate];
hold on;
annotation('textarrow',x_scale_22,... 
    y_scale_222,...                    
    'String', 'figure中坐标为？',...
    'Color',[0 0 0],... % 箭头颜色
    'LineStyle','-.',... 
    'LineWidth',0.5);

% 第三步：连接起点坐标和终点坐标，即可得到向上平移之前的ground truth线段，如（0.42，0.9）到（0.58，0.9）
% 绘制（0.42，0.9）到（0.58，0.9）的实文本箭头，即为真实的ground truth线段
x_scale_1 = [x1_groundTruth_preTranslate, x2_groundTruth_preTranslate];
y_scale_1 = [y1_groundTruth_preTranslate, y2_groundTruth_preTranslate];
hold on;
annotation('textarrow',x_scale_1,... 
    y_scale_1,...                    
    'String', 'figure中坐标为？',...
    'Color',[0 1 0],... % 箭头颜色
    'LineStyle','-',... 
    'LineWidth',0.5);   

% 第四步：实际当中，ground truth线段往往要向上平移一点点，方便显示更美观。
% 向上平移一点点（平移0.015），如绘制（0.42，0.915）到（0.58，0.915）的实线段，即为需要的ground truth线段
x_scale_2 = [x1_groundTruth_postTranslate, x2_groundTruth_postTranslate];
y_scale_2 = [y1_groundTruth_postTranslate, y2_groundTruth_postTranslate];
hold on;
annotation('line',x_scale_2,... % 两个元素的向量[x_begin x_end]，表示起始x坐标和结束x坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    y_scale_2,...             % 两个元素的向量[y_begin y_end]，表示起始y坐标和结束y坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。                   
    'LineStyle','-',... 
    'LineWidth',6,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]); % 颜色 

% 第五步：文本框，用来显示“Ground truth”字样（文本框 宽0.09，高0.03 都是定值，只需确定起始点坐标！）
% 在第四步已经确定了ground truth线段的基础上，（向上平移前的）线段左端点，向左平移0.09，即可作为textbox的左下角坐标，如起始点（0.33，0.9）
% 注意，最后隐藏文本框，即设置LineStyle为'none'！
temp1 = x1_groundTruth_preTranslate - 0.09;
temp2 = y1_groundTruth_preTranslate; % 0.9
position_1 = [temp1 temp2 0.09 0.03];
hold on;
annotation('textbox',...               % 属性：textbox文本框
    'Position',position_1,... % 位置和尺寸，四元素向量[x_begin y_begin length height]。前两个元素指定文本框的左下角坐标，后两个元素指定文本框的长度和高度。默认情况下，使用归一化的图窗单位。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
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
x_scale_3 = [x1_groundTruth_preTranslate, x1_groundTruth_postTranslate];
y_scale_3 = [y1_groundTruth_preTranslate, y1_groundTruth_postTranslate];
hold on;
annotation('line',x_scale_3,... % 两个元素的向量[x_begin x_end]
    y_scale_3,...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% 线条，显示点线2。如从（0.58，0.9）到（0.58，0.915）
x_scale_4 = [x2_groundTruth_preTranslate, x2_groundTruth_postTranslate];
y_scale_4 = [y2_groundTruth_preTranslate, y2_groundTruth_postTranslate];
hold on;
annotation('line',x_scale_4,... % 两个元素的向量[x_begin x_end]
    y_scale_4,...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

end

