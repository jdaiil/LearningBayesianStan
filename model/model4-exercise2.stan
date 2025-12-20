data {
  int<lower=0> N1;
  int<lower=0> N2;
  vector[N1] Y1;
  vector[N2] Y2;
}


parameters {
  real mu1;
  real mu2;
  real<lower = 0> sigma1;
  real<lower = 0> sigma2;
}


model {

  Y1[1:N1] ~ normal(mu1, sigma1);
  Y2[1:N2] ~ normal(mu2, sigma2);
  
}

