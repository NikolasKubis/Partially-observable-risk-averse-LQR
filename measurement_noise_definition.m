function[epsilon_1,epsilon_2,epsilon_3,epsilon_4,noise_covariance]=measurement_noise_definition(samples)
epsilon_variance_1=2;
epsilon_1=sqrt(epsilon_variance_1)*randn(1,samples);
epsilon_variance_2=2;
epsilon_2=sqrt(epsilon_variance_2)*randn(1,samples);
epsilon_variance_3=2;
epsilon_3=sqrt(epsilon_variance_3)*randn(1,samples);
epsilon_variance_4=2;
epsilon_4=sqrt(epsilon_variance_4)*randn(1,samples);
noise_covariance=diag([epsilon_variance_1,epsilon_variance_2,epsilon_variance_3,epsilon_variance_4]);
end