%% Plot the AM signal
% Signal parameters
b = 10;
f_0= 40;
f_1 = 10;
A=10;
%where f_0 > f_1

% for FM signal
%phi(t)=2*pi*f_0*t + b*cos(2*pi*f_1*t)
%phi'(t)=2*pi*f_0 - b*2*pi*f_1*sin(2*pi*f_1*t)
%max(phi'(t)) = 2*pi*f_0 + b*2*pi* f_1
%thus the maximum frequency of AM-FM signal is f_1 + 2*pi*f_0 + b*2*pi* f_1

maxFreq =  f_0 + b*f_1;
samplFreq = 5*maxFreq;% >2
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec =  crcbgenFMsig(timeVec,A,b,f_0,f_1);
%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);

%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));

%Plot a spectrogram
%----------------
winLen = 0.02;%sec
ovrlp = 0.01;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');