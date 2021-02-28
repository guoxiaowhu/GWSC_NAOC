data =load('testData.txt');
time = data(:,1);
noise = data(:,2);
sampFreq = 1024; %length(data)/(time(end)-0);
[pxx,f]=pwelch(noise, 256,[],[],sampFreq);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');
fltrOrdr = 500;
whiteNoise= WhitenNoise(noise,[f,pxx],fltrOrdr,sampFreq);

winLen = 0.1;
ovrlp = 0.05;
%Convert to integer number of samples 
winLenSmpls = floor(winLen*sampFreq);
ovrlpSmpls = floor(ovrlp*sampFreq);
[S,F,T]=spectrogram(noise,winLenSmpls,ovrlpSmpls,[],sampFreq);
[WS,WF,WT]=spectrogram(whiteNoise,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
colorbar;
figure;
imagesc(WT,WF,abs(WS)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
colorbar;
figure;
plot(time,noise,'r');
figure;
plot(time,whiteNoise,'b');
xlabel('time')


