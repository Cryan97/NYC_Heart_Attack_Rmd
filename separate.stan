 
data {
  int<lower=0> H; // total number of hospitals in data set
  int<lower=0> N[H]; // total number of heart attack cases per hospital (trials)
  int<lower=0> S[H]; // total number of deaths per hospital (successes)
}
parameters {
  vector<lower=0,upper=1>[H] mu;
  vector<lower=0>[H] eta;
  vector<lower=0,upper=1>[H] theta;
}
transformed parameters {
  vector[H] alpha;
  vector[H] beta;
  for (n in 1:H){
    alpha[n] = eta[n] * mu[n];
    beta[n] = (1 - mu[n]) * eta[n];
  }
}
model {
  mu ~ beta(5,45); // beta(5,45) prior for mu (same as hierarchical)
  eta ~ exponential(0.01); // exp(0.01) prior for eta (same as hierarchical)
  theta ~ beta(alpha, beta); // beta(alpha, beta) prior for theta, separate theta sampled for each hospital
  S ~ binomial(N, theta);
}
generated quantities {
  vector[H] log_lik;
  for (i in 1:H){
    log_lik[i] = binomial_lpmf(S[i] | N[i] , theta[i]); //log-likelihood values
  }
}