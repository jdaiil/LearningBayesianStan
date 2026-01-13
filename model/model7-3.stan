data {
  int T;
  vector[T] X;
  vector[T] Y;
  int Tp;
  vector[Tp] Xp;
}

parameters {
  real<lower=0, upper=100> a;
  real<lower=0, upper=5> b;
  real<lower=0> sigma;
}

model {
  Y ~ normal(a*(1-exp(-b*X)), sigma);
}

generated quantities {
  array[T] real yrep = normal_rng(a*(1-exp(-b*X)), sigma); //for pp_check 
  array[Tp] real yp = normal_rng(a*(1-exp(-b*Xp)), sigma); //for prediction 
}