
clear all;
close all;
[dt,simulation_time,samples]=simulation_declaration();

[Ts,A,B,C,n_states,n_out] = system_declaration();

%Create system's noise: One direction is normal, the other skewed
%
%normal(first direction)
d1=first_noise_direction_definition(samples);
%mixture (second direction)
d2=second_noise_direction_definition(samples); %with mean zero;
process_noise=[d1;d2];
process_noise_covariance=pr_noise_cov(B); %ayti thelei ftiaximo

state_penalty=diag([1 0.1 2 0.1]);

[M3,mean_process_noise]=M_statistic(B,state_penalty);

%measurement_noise=normal_independent_channels
[epsilon_1,epsilon_2,epsilon_3,epsilon_4,meas_noise_covariance]...
    =measurement_noise_definition(samples);
%
measurment_noise=[epsilon_1;epsilon_2;epsilon_3;epsilon_4];


%----------------------------------LQR-------------------------------------
%system initialization
[state,out,state0]=system_state_initialization(samples,n_states,n_out);

state(:,1)=state0;

%LQR controller gains.

[K_lqr]=controller_lqr(A,B,state_penalty,dt,simulation_time);

correction(:,1)=[0;0;0;0];

corrected_cov(:,:,1)=zeros(4,4);

k=1;
controller_LQR=zeros(2,samples);
%---------------------------------LQR loop---------------------------------
for i=0:dt:simulation_time-2*dt

 controller_LQR(:,k)=K_lqr(:,:,k)*correction(:,k);
 
 %plant  
[state(:,k+1),out(:,k)]=...
   plant(A,B,C,state(:,k),controller_LQR(:,k),...
   process_noise(:,k),measurment_noise(:,k));

%Kalman filter
[correction(:,k+1),corrected_cov(:,:,k+1)]=...
    risk_neutral_filter(A,B,C,n_states,correction(:,k),...
                              corrected_cov(:,:,k),...
                              process_noise_covariance,...
                             meas_noise_covariance,controller_LQR(:,k),out(:,k));
%estimation error
 estimation_error=state(:,k)-correction(:,k);
 penalty(k)=state(:,k)'*state_penalty*state(:,k);                    
                         
 k=k+1;
end

plot_estimates(correction,simulation_time,samples);

plot_states(state,simulation_time,samples);

plot_estimation_error(state,correction,simulation_time,samples);

plot_out(out,simulation_time,samples);

%---------------------------------------Risk LQR-------------------------------------------------


[rstate,rout,rstate0]=system_state_initialization(samples,n_states,n_out);
rstate(:,1)=rstate0;


%Risk-averse LQR controller gains


% mu=0.00001;
mu=10;
%mu=0.0006;
%mu=0.00001;
control_penalty=diag([0.1 0.1]);
[K_risk_lqr,h,l]=risk_lqr(A,B,state_penalty,...
    control_penalty,mu,dt,...
    simulation_time,process_noise_covariance,n_states,mean_process_noise,M3);
 

K_risk_lqr=flip(K_risk_lqr);
h=0*flip(h);% EDO THELEI FTIAXIMO GIATI VGAZEIS TO MEAN KI AYTO KANEI ADD DC
l=flip(l);

rcorrection(:,1)=[0;0;0;0];
rcorrected_cov(:,:,1)=zeros(4,4);
k=1;


controller_risk_LQR=zeros(2,samples);
%----------------------------Risk LQR loop---------------------------------
for i=0:dt:simulation_time-2*dt
 controller_risk_LQR(:,k)=K_risk_lqr(:,:,k)*rcorrection(:,k)+h(:,k)+l(:,k);

[rstate(:,k+1),rout(:,k)]=...
   plant(A,B,C,rstate(:,k),controller_risk_LQR(:,k),...
   process_noise(:,k),measurment_noise(:,k));


[rcorrection(:,k+1),rcorrected_cov(:,:,k+1)]=...
    risk_neutral_filter(A,B,C,n_states,rcorrection(:,k),...
                              rcorrected_cov(:,:,k),...
                              process_noise_covariance,...
                             meas_noise_covariance,controller_risk_LQR(:,k),rout(:,k));

 estimation_error=rstate(:,k)-rcorrection(:,k);
        
 rpenalty(k)=rstate(:,k)'*state_penalty*rstate(:,k);                 
                         
 k=k+1;
end

plot_risk_estimates(rcorrection,simulation_time,samples);

plot_risk_states(rstate,simulation_time,samples);

plot_risk_estimation_error(rstate,rcorrection,simulation_time,samples);

plot_risk_out(rout,simulation_time,samples);


%---------------------------------------------------------------------------
plot_penalty(penalty,rpenalty,simulation_time);

plot_control_signals(controller_LQR,controller_risk_LQR,simulation_time,samples);
