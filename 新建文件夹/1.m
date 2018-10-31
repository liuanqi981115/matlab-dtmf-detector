%% DTMF Decoder
%% 18/04/2015    6:00 PM   'C:\Users\SAJIL\Documents\MATLAB\DTMFDecoder.m'

%Version 1.0
%Sajil C. K., DCB, Uok.
%This program Reads and analyses DTMF(wav) files from Hard disk, plots its
%Spectrogram and plays it. This program demonstrate the classic
%Time-Frequency resolution problem


%% Screen Display Specifications

%Measure screen size of the device
%Calculate position values of figure Windows

scrsz = get(0,'ScreenSize');
P1=[40 500 scrsz(3)/3 scrsz(4)/3];
P2=[40 80 scrsz(3)/3 scrsz(4)/3];
P3=[600 500 scrsz(3)/3 scrsz(4)/3];
P4=[600 80 scrsz(3)/3 scrsz(4)/3];
P5=[1000 500 scrsz(3)/3 scrsz(4)/3];
P6=[1000 80 scrsz(3)/3 scrsz(4)/3];

%% File Reading  
[y, Fs] = audioread('¸½¼þ1.1.wav');
L=length(y);
N = nextpow2(L);
T=1/Fs;


%% Signal Analysis Part

t=(0:T:(L-1)/Fs)';
NFFT = 2^nextpow2(L);
Y = fft(y,NFFT);%/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
Mag=2*abs(Y(1:NFFT/2+1));


%% Plot Signal
figure('position', P1);
figure(1);
plot(t,y,'k');
grid on
title('Time Domain');
xlabel('Time in Seconds');
ylabel('Amplitude');
legend('DTMF Tone');


%% Plot single-sided Amplitude Spectrum.
figure('position',P2);
figure(2);
plot(f,Mag);
grid on
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
legend('Frequency Spectrum');


%% DTMF Signal Table
I = imread('DTMF.png');
figure('position',P3);
figure(3);
image(I)
f=text(0.4,0.4,'Original Input is 0696675356','FontSize',12);
axis off


%% Spectrogram Display Part
figure('position',P4);
figure(4);
%spectrogram(x,window,noverlap,f,fs)
spectrogram(y,32);
text(0.4,28,'Frame Size 32','FontSize',12);
%colormap bone

figure('position',P5);
figure(5);
%spectrogram(x,window,noverlap,f,fs)
spectrogram(y,256);
text(0.4,28,'Frame Size 256','FontSize',12);

figure('position',P6);
figure(6);
%spectrogram(x,window,noverlap,f,fs)
spectrogram(y,512);
text(0.4,28,'Frame Size 512','FontSize',12);


%% Play back block
soundsc(y,Fs);