%% Plot the linear transient chirp signal
% Signal parameters
t_a = 0.45;
f_0= 40;
f_1= 100;
A=10;
phi_0=0;
L=0.3;
tmax = 1;
%maximum frequency is
%f_0 + f_1* (tmax-t_a)
maxFreq = f_0 +f_1* (tmax-t_a);
samplFreq = 10*maxFreq;% >2
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:tmax;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec =  crcbgenLTCsig(timeVec,A,t_a,f_0,f_1,phi_0,L);
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
ovrlp = 0.001;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
