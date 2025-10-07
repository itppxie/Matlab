%RESULTSHOW Batch test of different stimuli


clc;
close all;
clear;
addpath(genpath(pwd));
% stimulus = {'Looming_50ms.mat','Square_expanded-motion.mat','Bar_horizontal-motion.mat','Edge_horizontal-motion.mat','Bar_vertical-motion.mat','Edge_vertical-motion.mat','Grating_horizontal-motion.mat','Grating_vertical-motion.mat','Cross_centrifugal-motion.mat','Cross_concentric-motion.mat'};
% stimulus = {'combinedVideo1.mat'};
stimulus = {'realNear3.mat'};
% stimulus = {'Looming_50ms.mat'};
% stimulus = {'simulatedVideo.mat'};
% stimulus = {'Looming_50ms.mat','Square_expanded-motion.mat','combinedVideo1.mat','Edge_horizontal-motion.mat','Bar_vertical-motion.mat','Edge_vertical-motion.mat','Grating_horizontal-motion.mat','Grating_vertical-motion.mat','Cross_centrifugal-motion.mat','Cross_concentric-motion.mat'};
% stimulus = {'Looming_50ms.mat','Square_expanded-motion.mat','Bar_horizontal-motion.mat','Edge_horizontal-motion.mat','Bar_vertical-motion.mat','Edge_vertical-motion.mat','Grating_horizontal-motion.mat','Grating_vertical-motion.mat','Cross_centrifugal-motion.mat','combinedVideo1.mat'};
for n=1:2 % 1~multiplicative intrgration; 2~addtive intrgration;
    for i = 1:length(stimulus)
        LPLC2_core{i} = loom(stimulus{i},n); % stimulus{i}是第i个刺激视频，n是整合方式
    end
    
    Max=0;
    for i=1:length(LPLC2_core)
        Maxi=max(LPLC2_core{i});
        Max=max(Max,Maxi);
    end
    
    for i=1:length(LPLC2_core)
        LPLC2_core_Normal{n,i}=LPLC2_core{i}./Max;
    end
end

% test ground truth
figure('Name', 'ground truth');
set(gca, 'Position', [0.1 0.1 0.8 0.8]);


% 只画一个图
% set(gcf,'Units','normalized','Position',[0.3 0.3 0.5 0.5]);
colormap('gray');
% subplot(2,5,1)
plot(LPLC2_core_Normal{2,1},'k','LineWidth',1); % 加法整合
hold on
plot(LPLC2_core_Normal{1,1},'r','LineWidth',1); % 乘法整合
% xlim([1,500])
xlim([1, 300])
ylim([-0.2 1])

% 画10个图
% set(gcf,'Units','normalized','Position',[0.3 0.3 0.5 0.5]);
% colormap('gray');
% subplot(2,5,1)
% plot(LPLC2_core_Normal{2,1},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,1},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,2)
% plot(LPLC2_core_Normal{2,2},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,2},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,3)
% plot(LPLC2_core_Normal{2,3},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,3},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% title('the Response of LPLC2 to Different Stimuli','Position',[250,1.1],'Fontsize',12)
% 
% subplot(2,5,4)
% plot(LPLC2_core_Normal{2,4},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,4},'r','LineWidth',1);
% ylabel('the Activity in normalized','Position',[-50,0.4],'Fontsize',12);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,5)
% plot(LPLC2_core_Normal{2,5},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,5},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,6)
% plot(LPLC2_core_Normal{2,6},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,6},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,7)
% plot(LPLC2_core_Normal{2,7},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,7},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,8)
% plot(LPLC2_core_Normal{2,8},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,8},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% xlabel('Time (frame)','Position',[250,-0.4],'Fontsize',12);
% 
% subplot(2,5,9)
% plot(LPLC2_core_Normal{2,9},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,9},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])
% 
% subplot(2,5,10)
% plot(LPLC2_core_Normal{2,10},'k','LineWidth',1);
% hold on
% plot(LPLC2_core_Normal{1,10},'r','LineWidth',1);
% xlim([1,500])
% ylim([-0.2 1])


% 绘制Ground truth
% 指定值
scale_of_x_axis = [1, 300];         % 坐标轴x的起始刻度和终点刻度，必须跟xlim相对应！
scale_of_ground_truth = [1, 30]; % ground truth的起点和终点！
% 调用Ground truth函数
% t = Ground_truth_func(scale_of_x_axis, scale_of_ground_truth);