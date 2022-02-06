function[d2]=second_noise_direction_definition(samples)
mean=[30;80];
variance=zeros(1,1,2);
variance_d2_component_1=30;
variance_d2_component_2=60;
variance(:,:,1)=sqrt(variance_d2_component_1);
variance(:,:,2)=sqrt(variance_d2_component_2);
p=[0.8;0.2];
gm = gmdistribution(mean,variance,p);
mean=0.8*30+0.2*80;
d2=(random(gm,samples))'-mean;

% mean_d1=0;
% variance_d1=50;
% d2=sqrt(variance_d1)*randn(1,samples);

end