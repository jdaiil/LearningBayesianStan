data {
  int N;
  vector<lower=0, upper=1>[N] Sex;
  vector<lower=0>[N] Income;
  vector<lower = 0, upper=1> [N] Y;
}


parameters { //What MCMC estimates 
  vector[3] b; //regression coefficients can be stored as a vector 
  real<lower = 0> sigma;
}


//useful when need to use parameters after estimation 
//like when sampling from the posterior or for predictive check 
transformed parameters { 
  
   vector[N] mu = b[1] + b[2]*Sex[1:N] + b[3]*Income[1:N]; //mu is linear combination of b1:b3, thus can be defined in the transformed parameters. In other words, mu is transformed using parameters defined in the parameters block 

}

model {

  Y[1:N] ~ normal(mu[1:N], sigma);

}

//can use any variables before the model blocks 
generated quantities {
  array[N] real yp = normal_rng(mu[1:N], sigma);
}