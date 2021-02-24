
%% 1. generate 10,000 trials
N = 10000;

%uniform distribution
a=-2 ;
b=1 ;
U = customrand(a,b,N);
% PDF is U(x)= 1/(b-a)
Uf = 1/(b-a);

% normal distribution
mu = 1.5;
sigma = 2;
N = customrandn(mu,sigma,N);
% PDF
xx = (mu-3*sigma):(sigma/100):(mu+3*sigma);
yy =1/sqrt(2*pi*sigma^2)*exp(-(xx-mu).^2/(2*sigma^2));


figure;
hold on;
plot([a,b],[Uf,Uf],'r');
histogram(U,'normalization','pdf');
xlabel('x');
ylabel('PDF');
figure;
hold on;
plot(xx,yy,'r');
histogram(N,'normalization','pdf');
xlabel('x');
ylabel('PDF');