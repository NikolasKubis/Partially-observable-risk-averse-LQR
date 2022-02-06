function[K]=controller_lqr(A,B,Q,dt,simulation_time)
%---------------------------in a function--------------------------------
%LQR Controller gains backward run.
k=1;
V(:,:,1)=Q;
R=diag([0.1 0.1]);
for i=0:dt:simulation_time-2*dt
    V(:,:,k+1)=A'*V(:,:,k)*A+Q-(A'*V(:,:,k)*B*inv(B'*V(:,:,k)*B+R)*B'*V(:,:,k)*A);
    K(:,:,k)=-inv(B'*V(:,:,k+1)*B+R)*B'*V(:,:,k+1)*A;
    k=k+1;
end
%[teleytaios,proteleytaios,]
%[N,N-1,N-2,N-3,...,1];
%[VN,VN-1,....,V1]
%[KN-1,KN-2,....,K0]
%%THE FUCKING SHIT IT FLIPS THE VECTOR!
end