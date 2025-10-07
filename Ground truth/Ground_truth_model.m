
% 显示“Ground truth”文本框
hold on;
annotation('textbox',...               % 属性：textbox文本框
    'Position',[0.1 0.9 0.09 0.03],... % 位置和尺寸，四元素向量[x_begin y_begin length height]。前两个元素指定文本框的左下角坐标，后两个元素指定文本框的长度和高度。默认情况下，使用归一化的图窗单位。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    'String',{'Ground truth:'},...     % 要显示的文本
    'HorizontalAlignment','left',...   % 文本框中文本的水平对齐方式："left" (默认) | "center" | "right"
    'VerticalAlignment','middle',...   % 文本框中文本的垂直对齐方式：'top' (默认) | 'middle' | 'bottom'
    'FontWeight','normal',...          % 字体粗细
    'FontSize',20,...                  % 字体大小
    'FontAngle','oblique',...          % 字体倾斜
    'FitBoxToText','off',...           % 使框宽和框高适合文本的选项：'on' (默认) | on/off 逻辑值
    'LineStyle','none',...                % 框轮廓的线型：'none'、'-'(默认)、'--'、'-.'、':'
    'EdgeColor', [1 0 0]);             % 框轮廓的颜色：[0 0 0] (default) | RGB triplet | hexadecimal color code | "r" | "g" | "b" | ... 


% 画线
hold on;
annotation('line',[0.2 0.5],... % 两个元素的向量[x_begin x_end]，表示起始x坐标和结束x坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。
    [0.5 0.5],...             % 两个元素的向量[y_begin y_end]，表示起始y坐标和结束y坐标。图窗的左下角映射到 (0,0)，右上角映射到 (1,1)。                   
    'LineStyle','-',... 
    'LineWidth',6,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]); % 颜色 


% 点线，用来显示ground truth线段左右的两条点线段。
% 两条点线段，分别是ground truth线段在向上平移前的左（右）端点坐标到向上平移0.015后的左（右）端点坐标。
% 线条，显示点线1。如从（0.42，0.9）到（0.42，0.915）
hold on;
annotation('line',[0.42 0.42],... % 两个元素的向量[x_begin x_end]
    [0.42 0.80],...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% 线条，显示点线2。如从（0.58，0.9）到（0.58，0.915）
hold on;
annotation('line',[0.58 0.58],... % 两个元素的向量[x_begin x_end]
    [0.58 0.90],...               % 两个元素的向量[y_begin y_end]   
    'LineStyle',':',...
    'LineWidth',2,...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);




