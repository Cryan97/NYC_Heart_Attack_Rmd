data {
  int<lower=0> H; // total number of hospitals in data set
  int<lower=0> N[H]; // total number of heart attack cases per hospital (trials)
  int<lower=0> S[H]; // total number of deaths per hospital (successes)
}
parameters {
  real<lower=0,upper=1> theta;
}
model {
  theta ~ beta(5, 45); // beta (5,45) prior for theta which is the same for all hospitals
  S ~ binomial(N, theta);
}
generated quantities {
  vector[H] log_lik;
  for (i in 1:H){
    log_lik[i] = binomial_lpmf(S[i] | N[i] , theta); //log-likelihood values
  }
}
