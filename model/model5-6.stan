
data {
  int N;
  vector<lower=0,upper=1>[N] Sex;
  vector<lower=0>[N] Income;
  array[N] int<lower=0> M;
}

parameters {
  vector[3] b;
}

transformed parameters {
  vector[N] log_lambda = (b[1] + b[2]*Sex[1:N] + b[3]*Income[1:N]);
}

model {
  M[1:N] ~ poisson_log(log_lambda[1:N]); //use log link function to estimate lambda then we don't have to calculate exp(eta)
}

generated quantities {
  array[N] int mp = poisson_log_rng(log_lambda[1:N]);
}