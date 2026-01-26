
data{
  int N;
  int C;
  vector[N] X;
  vector[N] Y;
  array[N] int<lower=1, upper=C> n2c; // indicates where each n belongs to category C 
}

parameters{
  vector[C] a; // declares that a is a vector with C length 
  vector[C] b;
  real<lower=0> s_y;
}

model{
  Y[1:N] ~ normal(a[n2c] + b[n2c].*X[1:N], s_y); // .* means multiplication by row not matrix multiplication
}
