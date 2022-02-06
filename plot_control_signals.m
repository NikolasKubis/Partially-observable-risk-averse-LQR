function[]=plot_control_signals(controller_LQR,controller_risk_LQR,simulation_time,samples)
figure(11)
t=linspace(0,simulation_time,samples);
plot(t,controller_LQR(1,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
hold on
plot(t,controller_risk_LQR(1,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$controls \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on

figure(12)
t=linspace(0,simulation_time,samples);
plot(t,controller_LQR(2,:),'-','Linewidth',0.9,'color',[0 0.4470 0.7410])
hold on
plot(t,controller_risk_LQR(2,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$controls \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
end