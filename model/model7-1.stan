
data {
  int<lower=0> N;
  vector[N] Y;
  vector[N] X;
  int Np;
  vector[Np] Xp;
}

parameters {
  vector[2] b; //b[1] intercept, b[2] slope
  real<lower=0> sigma; 
}

transformed parameters{
  vector[N] mu = b[1] + b[2]*X;
}

model {
  Y ~ normal(mu, sigma);
}

generated quantities{
  array[N] real yp_n = normal_rng(mu, sigma);
  array[Np] real yp_np = normal_rng(b[1] + b[2]*Xp, sigma);
}


