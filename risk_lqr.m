function[K_fliped,h_flipped,l_flipped]=risk_lqr(A,B,Q,R,mu,dt,...
    simulation_time,process_noise_covariance,n_states,mean_process_noise,M3)
%---------------------------in a function--------------------------------
%Risk-averse LQR Controller gains backward run.
k=1;
Qmu=Q+4*mu*Q*process_noise_covariance*Q;
V(:,:,1)=Qmu;
T(:,:,1)=zeros(n_states);
S(:,:,1)=Q;
for i=0:dt:simulation_time-2*dt
    V(:,:,k+1)=A'*V(:,:,k)*A+Qmu-(A'*V(:,:,k)*B*inv(B'*V(:,:,k)*B+R)*B'*V(:,:,k)*A);
    Kr(:,:,k)=-inv(B'*V(:,:,k+1)*B+R)*B'*V(:,:,k+1)*A;
    T(:,:,k+1)=(V(:,:,k)+T(:,:,k))*(A+B*Kr(:,:,k));
    S(:,:,k+1)=S(:,:,k)*(A+B*Kr(:,:,k))+Q;
    h(:,k+1)=-inv(B'*V(:,:,k)*B+R)*B'*(V(:,:,k)+T(:,:,k))*mean_process_noise;
    l(:,k+1)=-2*mu*inv(B'*V(:,:,k)*B+R)*B'*S(:,:,k)'*M3;
    k=k+1;
end
%[teleytaios,proteleytaios,]
%[N,N-1,N-2,N-3,...,1];
%[VN,VN-1,....,V1]
%[KN-1,KN-2,....,K0]

K_fliped=flip(Kr);
h_flipped=flip(h);
l_flipped=flip(l);
%-------------------------------------------------------------------------
end