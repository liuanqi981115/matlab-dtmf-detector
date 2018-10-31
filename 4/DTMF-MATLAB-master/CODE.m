 [tel,fs] = audioread('¸½¼þ1.1.wav'); %reads the >>%data from the tel.wav file as the vector tel >>%at sampling frequency fs
 sound(tel); %plays the data in the vector tel >>%as an audio signal. 
 n=7; %number of tel.(how many notes in wav)
 d = floor(length(tel)/n); %the length of each >>%interval

 tel1 = tel(1:d);  %extracting the first of n >>%intervals of length d from the tel vector. >>%This should be done n times, with the in- >>%terval shifted by d each time to get each new >>%digit. 
 tel2 = tel(d+1:2*d);
 tel3 = tel(2*d: 3*d);
 tel4 = tel(3*d: 4*d);
 tel5 = tel(4*d: 5*d);
 tel6 = tel(5*d: 6*d);
 tel7 = tel(6*d:7*d);

 N=100000; %Number of samples.
 fs=8000; %Sampling rate.
TEL1 = fftshift(fft(tel1,N)); %extracting the >>%first of n intervals of length from the tel >>%vector. This should be done n times, with the >>%in- terval shifted by d each time to get each >>%new digit. 
TEL2 = fftshift(fft(tel2,N));
TEL3 = fftshift(fft(tel3,N));
TEL4 = fftshift(fft(tel4,N));
TEL5 = fftshift(fft(tel5,N));
TEL6 = fftshift(fft(tel6,N));
TEL7 = fftshift(fft(tel7,N));



 f = linspace(-fs/2,fs/2,N); %creating a >>%frequency vector with N samples from -fs/2 to >>%fs/2 (the maximum frequency is half of the >>%sampling frequency - the sampling theorem)


figure;
plot(f, abs(TEL1)); %plotting the magnitude of the spectrum xlabel(â€™Frequency - Hzâ€?;
ylabel('|TEL1|'); xlabel('Frequency - Hz');
