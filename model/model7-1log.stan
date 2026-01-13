
data {
  int<lower=0> N;
  vector[N] Y;
  vector[N] X;
}

parameters {
  vector[2] b;
  real<lower=0> sigma;
}

transformed parameters{
  vector[N] mu = b[1] + b[2]*X;
}

model {
  Y ~ normal(mu, sigma);
}


