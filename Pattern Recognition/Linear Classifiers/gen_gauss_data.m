function X=gen_gauss_data(m,S,N, seed)
rng('default');
X = mvnrnd(m,S,N)';