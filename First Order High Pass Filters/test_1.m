% First-order high-pass filter：一阶高通滤波器
% 三角函数系列：y = A*sin(w*x+Ph)

Serial = 0:0.1:100;
Fs = 1;
Phase = 0; % 相位
Amp = 1;   % amplitude振幅

N0 = 2*pi*Fs*Serial - Phase;
X0 = Amp*sin(N0); % X0 = sin(2*pi*x)，频率为1
subplot(4,1,1);
plot(X0);
xlabel('x'),ylabel('X0');
legend('X0 = sin(2*pi*x)');

Fs = 0.02;
N1 = 2*pi*Fs*Serial - Phase;
X1 = Amp*sin(N1); % X1 = sin(2*pi*0.02*x)，频率为0.02
subplot(4,1,2);
plot(X1);
xlabel('x'),ylabel('X1');
legend('X1 = sin(2*pi*0.02*x)');

X2=X0+X1;         % 傅里叶变换: X2 = X0 + X1 = sin(2*pi*x) + sin(2*pi*0.02*x)
subplot(4,1,3);
plot(X2);
xlabel('x'),ylabel('X2');
legend('X2 = sin(2*pi*x) + sin(2*pi*0.02*x)');

len = length(X2);
y=X2; %
p=0.75;

for i=2:len
    y(i) = p*y(i-1)+p*(X2(i)- X2(i-1)); % 对X2进行一阶高通滤波，过滤低频信号（即更新y，滤波结果存入y中）
end

subplot(4,1,4);
plot(y);
xlabel('x'),ylabel('y');
legend('y');

% X2图像是由X0和X1组合而来的（由一个高频和一个低频组合而来）。经过HPF处理之后，从y可以看出，貌似已经过滤掉了低频的X1，保留了高频的X0.
