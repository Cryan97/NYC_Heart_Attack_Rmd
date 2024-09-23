 
data {
  int<lower=0> H; // total number of hospitals in data set
  int<lower=0> N[H]; // total number of heart attack cases per hospital (trials)
  int<lower=0> S[H]; // total number of deaths per hospital (successes)
}
parameters {
  real<lower=0,upper=1> mu;
  real<lower=0> eta;
  vector<lower=0,upper=1>[H] theta;
}
transformed parameters {
  real alpha;
  real beta;
  alpha = eta * mu;
  beta = (1 - mu) * eta;
}
model {
  mu ~ beta(5, 45);
  eta ~ exponential(0.01);
  theta ~ beta(alpha, beta); 
  S ~ binomial(N, theta);
}
generated quantities {
  vector[H] log_lik;
  for (i in 1:H){
    log_lik[i] = binomial_lpmf(S[i] | N[i] , theta[i]); //log-likelihood values
  }
}