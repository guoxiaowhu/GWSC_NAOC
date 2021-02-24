function x = customrandn(a,b,N)
% This function is designed to produce a normal distribution N(a,b)
% N represent the number of random numbers
% rand: uniform distribution
% randn: normal distribution
x= a + b*randn(1,N);
end