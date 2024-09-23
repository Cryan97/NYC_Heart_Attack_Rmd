This repository contains code used for an assignment I completed as part of the MSc Data Analytics from UCD for the module "Bayesian Analysis". I received an A+ grade for this assignment.

In this assigment, I fit 3 Bayesian Beta-Binomial models to describe the death rates from heart attacks at 13 Manhattan hospitals in 2015. I investigate whether a hierarchical, separate or pooled model best describes this data. The essential idea is that we can employ a binomial model treating cases of heart attack as ‘trials’ and the
deaths as ‘successes’.

Employing a "pooled" model essentially means not allowing for any variation in death rate between the 13 hospitals. A "separate" model assumes a different prior probability of death for each hospital and so does not use information from other hospitals to inform the death rate from heart attacks at another hospital. Finally, a "hierarchical" model offers a compromise between these two models, where the prior probability of death for each hospital are ‘connected’ via a distribution parameterised by hyperparameter(s) which means all death rates are sampled from the same distribution but still allow variability for each hospital.

I compare the performance of each of these models on the data and then rank the hospitals in terms of their respective death rates from heart attacks from lowest to highest using the hierachical model.
