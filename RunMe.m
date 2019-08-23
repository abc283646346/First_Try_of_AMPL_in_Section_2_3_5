close all
clear all
clc

% ����AMPL�ն˲�ִ�������������� %
!ampl simple_case.run

% ����AMPL���õ��ľ��߱��� %
load x.txt
load y.txt
load theta.txt
load v.txt
load a.txt
load phy.txt
load w.txt
load tf.txt

% �ز����������� %
Nfe = length(x) / 4;
precision_level = 0.2;
[~, x] = GeneratePreciseProfileFromCollocationGrids(x, Nfe, tf, precision_level, 0);
[~, y] = GeneratePreciseProfileFromCollocationGrids(y, Nfe, tf, precision_level, 0);
[timeline_w, w] = GeneratePreciseProfileFromCollocationGrids(w, Nfe, tf, precision_level, 1);
[timeline_v, v] = GeneratePreciseProfileFromCollocationGrids(v, Nfe, tf, precision_level, 0);

% �����ز����켣 %
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