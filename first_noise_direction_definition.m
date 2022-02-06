function[d1]=first_noise_direction_definition(samples)
mean_d1=0;
variance_d1=5;
d1=sqrt(variance_d1)*randn(1,samples);
end