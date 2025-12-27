data {
  int<lower=0> N;
  int D;
  array[N] vector[D] Y;
}


parameters {
  vector[D] mu_vec;
  cov_matrix[D] cov;
}

model {
  Y[1:N] ~ multi_normal(mu_vec, cov);
}

generated quantities {
  vector[D] sigma;
  for(d in 1:D) {
    sigma[d] = sqrt(cov[d,d]);
  }
  
  real rho = cov[1,2]/(sigma[1]*sigma[2]);
}
