data {
  int N;
  vector[N] Sex;
  vector[N] Income;
  vector[N] Y;
}

parameters {
  vector[4] b; //b1~b4
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu = b[1] + b[2]*Sex + b[3]*Income + b[4]*Sex .*Income; //.* element-wise multiplication
}

model {
  Y ~ normal(mu, sigma);
}

generated quantities {
  array[N] real yrep = normal_rng(mu, sigma); //for pp_check 
}