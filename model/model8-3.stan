data {
  int N; //n of obs
  int C; //n of company
  vector[N] X;
  vector[N] Y;
  array[N] int<lower=1, upper=C> n2c; //company indexing 
}

parameters {
  real a_field; // fixed intercept
  real b_field; // fixed slope
  vector[C] a_diff; //deviation from the fixed intercept
  vector[C] b_diff; //deviation from the fixed slope
  real<lower=0> s_a;
  real<lower=0> s_b;
  real<lower=0> s_y;
}

transformed parameters {
  vector[C] a = a_field + a_diff[1:C]; //intercept for company C is composed of fixed and random intercept  
  vector[C] b = b_field + b_diff[1:C];
}

model {
  a_diff[1:C] ~ normal(0, s_a); //random effects - a difference is generated from the same normal distribution with sigma of s_a
  b_diff[1:C] ~ normal(0, s_b); // random effects
  
  Y[1:N] ~ normal(a[n2c] + b[n2c].*X[1:N], s_y);
}
