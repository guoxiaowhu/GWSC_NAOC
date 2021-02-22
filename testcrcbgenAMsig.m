%% Plot the AM signal
% Signal parameters
% b = 10;
f_0= 10;
f_1 = 2;
phi_0 = 0;
A=10;
%where f_0 > f_1

% Instantaneous frequency after 1 sec is 
% According to product to sum formula, sin(A)cos(B)=(sin(A+B)+sin(A-B))/2
% thus for AM signal, the maximum frequency is f_1+f_0

maxFreq = f_0 + f_1;
samplFreq = 20*maxFreq;% >2
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec =  crcbgenAMsig(timeVec,A,f_0,f_1,phi_0);
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
plot(posFreq,abs(fftSig));% two components: f_0+f_1, abs(f_0-f_1)

%Plot a spectrogram
%----------------
winLen = 0.04;%sec
ovrlp = 0.02;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');