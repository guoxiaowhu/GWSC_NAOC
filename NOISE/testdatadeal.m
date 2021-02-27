data =load('testData.txt');
time = data(:,1);
noise = data(:,2);
sampFreq = length(data)/(data(end)-data(1));
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
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(noise,winLenSmpls,ovrlpSmpls,[],samplFreq);
[WS,WF,WT]=spectrogram(whiteNoise,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
figure;
imagesc(WT,WF,abs(WS)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
figure;
hold on;
plot(time,noise,'r');
figure;
plot(time,whiteNoise,'b');
xlabel('time')


