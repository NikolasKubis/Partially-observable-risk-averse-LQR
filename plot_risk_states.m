function[]=plot_risk_states(state,simulation_time,samples)
figure(5)
subplot(4,1,1)
t=linspace(0,simulation_time,samples);
plot(t,state(1,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$x_{1} \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,2)
t=linspace(0,simulation_time,samples);
plot(t,state(2,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$x_{2} \ (m)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,3)
t=linspace(0,simulation_time,samples);
plot(t,state(3,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$x_{3} \ (m/s)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
subplot(4,1,4)
t=linspace(0,simulation_time,samples);
plot(t,state(4,:),'-','Linewidth',0.9,'color',[0.8500 0.3250 0.0980])
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('$x_{4} \ (m/s)$','interpreter','latex')
set(gca,'FontSize',16)
grid on
end