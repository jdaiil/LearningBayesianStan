data {
  int<lower=0> N;
  vector[N] Y;
  vector[N] X;
  int Np;
  vector[Np] Xp;
}


parameters { //What MCMC estimates 
  real a;
  real b;
  real<lower = 0> sigma;
}


//useful when need to use parameters after estimation 
//like when sampling from the posterior or for predictive check 
transformed parameters { 
  
  vector[N] y_base = a+b*X[1:N]; //variable declartion deterministic 

}

model {

  Y[1:N] ~ normal(y_base[1:N], sigma);

}

//can use any variables before the model blocks 
generated quantities {
  vector[Np] yp_base = a+b*Xp[1:N];
  array[Np] real yp = normal_rng(yp_base[1:N], sigma); //yp is sampled from normal(yp_base, sigma)
  //XX_rng() means random number generator following XX distribution 
  //XX_rng() can only be stored using array 
}