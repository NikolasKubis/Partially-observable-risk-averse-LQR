function[]=plot_penalty(rpenalty,penalty,simulation_time)
figure(10)
l=length(rpenalty);
t=linspace(0,simulation_time,l);
plot(t,penalty,'-','Linewidth',1.5,'color',[0 0.4470 0.7410]) %blue
hold on
plot(t,rpenalty,'-','Linewidth',1.5,'color',[0.8500 0.3250 0.0980]) %red
set(gca,'TickLabelInterpreter','latex');
set(gca,'fontweight','bold','fontsize',16)
ylabel('state penalty','interpreter','latex')
set(gca,'FontSize',16)
grid on
legend({'LQR','Risk-averse LQR'},'Location','northeast','Orientation','vertical')
end