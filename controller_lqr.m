function[K]=controller_lqr(A,B,Q,dt,simulation_time)
%LQR Controller gains backward run.
k=1;
V(:,:,1)=Q;
R=diag([0.1 0.1]);
for i=0:dt:simulation_time-2*dt
    V(:,:,k+1)=A'*V(:,:,k)*A+Q-(A'*V(:,:,k)*B*inv(B'*V(:,:,k)*B+R)*B'*V(:,:,k)*A);
    K(:,:,k)=-inv(B'*V(:,:,k+1)*B+R)*B'*V(:,:,k+1)*A;
    k=k+1;
end
% No need to flip it, the function does it for free..(!!??)
end
