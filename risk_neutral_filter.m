function[estimate,corrected_cov]=risk_neutral_filter(A,B,C,n_states,correction,corrected_cov,...
                              process_noise_covariance,...
                              meas_noise_covariance,controller,out)

%prediction
prediction= A*correction+B*controller;

predicted_cov=A*corrected_cov*A'+process_noise_covariance;

prediction_error=out-C*prediction;


%correction
gain=predicted_cov*C'*inv(C*predicted_cov*C'+meas_noise_covariance);

next_correction=prediction+gain*prediction_error;

next_corrected_cov=(eye(n_states)-gain*C)*predicted_cov;

estimate=next_correction;

corrected_cov=next_corrected_cov;

end