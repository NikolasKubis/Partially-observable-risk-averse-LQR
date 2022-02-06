function[]=plot_estimattes(correction,simulation_time,samples)
figure(3)
subplot(4,1,1)
t=linspace(0,simulation_time,samples);
plot(t,correction(1,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$\widehat{x}_{1} \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,2)
t=linspace(0,simulation_time,samples);
plot(t,correction(2,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$\widehat{x}_{2} \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,3)
t=linspace(0,simulation_time,samples);
plot(t,correction(3,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$\widehat{x}_{3} \ (m/s)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,4)
t=linspace(0,simulation_time,samples);
plot(t,correction(4,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$\widehat{x}_{4} \ (m/s)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
end