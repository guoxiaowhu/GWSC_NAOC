%% Low pass filter demo
% addpath ../SIGNALS;
sampFreq = 1024;
nSamples = 2048;

timeVec = (0:(nSamples-1))/sampFreq;

%% 3 sinusoids signals
% Signal parameters
A1 = 10;
A2 = 5;
A3 = 2.5;

f1 = 100;
f2 = 200;
f3 = 300;
% f1<f2<f3
phi1 = 0;
phi2 = pi/6;
phi3 = pi/4;

% Signal length
sigLen = (nSamples-1)/sampFreq;
%Maximum frequency
maxFreq = max([f1,f2,f3]);
df = 50;
%disp(['The maximum frequency of the signal is ', num2str(maxFreq)]);

% Generate signal
sigVec1 = crcbgenSinsig(timeVec,A1,f1,phi1); %s_1
sigVec2 = crcbgenSinsig(timeVec,A2,f2,phi2); %s_2
sigVec3 = crcbgenSinsig(timeVec,A3,f3,phi3); %s_3
sigVec = sigVec1 + sigVec2 + sigVec3;
%% Only allow signal s_1 to pass
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,(f2-df)/(sampFreq/2));
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure;
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);

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

% FFT of filtered signal
fftFilSig = fft(filtSig);
% Discard negative frequencies
fftFilSig = fftFilSig(1:kNyq);
%Plot periodogram
figure;
hold on;
plot(posFreq,abs(fftSig),'b');
plot(posFreq,abs(fftFilSig),'r');
xlabel('Frequency (Hz)');
%% Only allow signal s_2 to pass
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,[(f1+df)/(sampFreq/2) (f3-df)/(sampFreq/2)],'bandpass');
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure;
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);

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

% FFT of filtered signal
fftFilSig = fft(filtSig);
% Discard negative frequencies
fftFilSig = fftFilSig(1:kNyq);
%Plot periodogram
figure;
hold on;
plot(posFreq,abs(fftSig),'b');
plot(posFreq,abs(fftFilSig),'r');
xlabel('Frequency (Hz)');
%% Only allow signal s_3 to pass
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,(f2+df)/(sampFreq/2),'high');
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure;
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);

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

% FFT of filtered signal
fftFilSig = fft(filtSig);
% Discard negative frequencies
fftFilSig = fftFilSig(1:kNyq);
%Plot periodogram
figure;
hold on;
plot(posFreq,abs(fftSig),'b');
plot(posFreq,abs(fftFilSig),'r');
xlabel('Frequency (Hz)');