function x = customrand(a,b,N)
% This function is designed to produce a uniform distribution U(a,b)
% rand: uniform distribution
% randn: normal distribution
x= a + (b-a)*rand(1,N);
end