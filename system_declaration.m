function [Ts,A,B,C,n_states,n_out] = system_declaration()
Ts=0.5;
A=[1 Ts 0 0;0 1 0 0;0 0 1 Ts;0 0 0 1];
B=[((Ts)^2)/2 Ts 0 0;0 0 ((Ts)^2)/2 (Ts)]';
C=eye(4);
n_states=size(A,1);
n_out=size(C,1);
end