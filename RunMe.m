close all
clear all
clc

% 调用AMPL终端并执行求解批处理过程 %
!ampl simple_case.run

% 导入AMPL求解得到的决策变量 %
load x.txt
load y.txt
load theta.txt
load v.txt
load a.txt
load phy.txt
load w.txt
load tf.txt

% 重采样参数设置 %
Nfe = length(x) / 4;
precision_level = 0.2;
[~, x] = GeneratePreciseProfileFromCollocationGrids(x, Nfe, tf, precision_level, 0);
[~, y] = GeneratePreciseProfileFromCollocationGrids(y, Nfe, tf, precision_level, 0);
[timeline_w, w] = GeneratePreciseProfileFromCollocationGrids(w, Nfe, tf, precision_level, 1);
[timeline_v, v] = GeneratePreciseProfileFromCollocationGrids(v, Nfe, tf, precision_level, 0);

% 绘制重采样轨迹 %
figure(1)
set(0,'DefaultLineLineWidth',3);
plot(x,y,'k');
axis equal; box on; grid on; axis tight;
xlabel('x axis / m','Fontsize',16,'FontWeight','bold');
ylabel('y axis / m','Fontsize',16,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold');

figure(2)
set(0,'DefaultLineLineWidth',2);
plot(timeline_v, v,'k');
box on; grid on; axis tight;
xlabel('Time /sec','Fontsize',16,'FontWeight','bold');
ylabel('Velocity / m/s','Fontsize',16,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold');

figure(3)
set(0,'DefaultLineLineWidth',2);
plot(timeline_w, w,'k');
box on; grid on; axis tight;
xlabel('Time /s','Fontsize',16,'FontWeight','bold');
ylabel('Derivative of Steering Angle / rad/s','Fontsize',16,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold');