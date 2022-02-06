function [M3,meand]=M_statistic(B,Q)

% In this function in order to approach the mean we take more samples than
% in the simulation;
%just set a large number of "training" samples;
n=10^3;
d1=first_noise_direction_definition(n);
d2=second_noise_direction_definition(n);
for i=1:n
d(:,i)=B*[d1(i);d2(i)];
end
meand=sum(d,2);
term=d;
sumation=[0;0;0;0];
for i=1:n
    sumation=sumation+term(:,i)*term(:,i)'*Q*term(:,i);
end


M3=sumation/n;

end