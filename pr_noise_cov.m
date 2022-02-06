function process_noise_covariance=pr_noise_cov(B)

%for the normal sensor
c1=5;
term1=(0.2*60+0.8*30);
mean=0.2*80+0.8*30;
term2=0.2*(80-mean)^2+0.8*(30-mean)^2;
c2=term1+term2;
%process_noise_covariance=B*[c1 0;0 c2]*B';

process_noise_covariance=[5 5 0 0;5 5 0 0;0 0 436 436;0 0 436 436];



end