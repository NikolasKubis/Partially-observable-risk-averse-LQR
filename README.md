# Partially observable risk-averse LQR
This package shows how to implement partially observable linear quadratic regulation subject to risk constraints. 
The latter are expressed by the predictive squared error variance of the state penalty. Essentially, the constraint represents a statistical spring in time 
that restricts the statistical variability of the penalized state Euclidean norm. 
The control problem has been separated from the filtering part and for the latter a Kalman filter has been deployed. 
The figure shows the penalty's variability over time. 



<p>
  <img src="state penalty.jpg" width="600" height="250"/>
</p>

Note that the risk-neutral LQR, although optimal on average, it experiences significant realization errors due to the skewed process noise. 
On the contrary, risk-averse LQR being cautious w.r.t. such noise gusts, maintaining a smaller variability 
but trading off a slightly worse average performance and an increased control effort.
