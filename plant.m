function[next_state,out]=plant(A,B,C,state,controller,process_noise,measurment_noise)

next_state=A*state+B*controller+B*process_noise;
out=C*next_state+measurment_noise;

end