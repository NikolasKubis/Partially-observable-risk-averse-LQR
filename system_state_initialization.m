function[state,out,state0]=system_state_initialization(samples,n_states,n_out)

state=zeros(n_states,samples);

state0=[10, 20, 30, 20];

out=zeros(n_out,samples);
end

