%Time division multiplexing of the two input sinusoids

clc;
clear all;
close all;
n=input('Enter the no of signals to be multiplexed');
fs=input('Enter the no of samples to be taken');
fc1=8;
fc2=4;
A=1;
B=1.5;
t=1/fs:1/fs:1;

%Input Sinusoidal Signals

y1=A*(sin(2*pi*fc1*t));
y2=B*(cos(2*pi*fc2*t));
figure;
subplot(3,1,1)
plot(t,y1)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sinusoidal wave 1::')
subplot(3,1,2)
plot(t,y2)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sinusoidal wave ::')

%Sampling the Input Sinusoids

itrain1=(square(2*pi*fc1*20*t)+1)/2;
itrain2=(square(2*pi*fc1*20*t+pi)+1)/2;
subplot(3,1,3)
plot(t,itrain1)
xlabel('t--->')
ylabel('Amplitude--->')
title('Impulse train')
z1=y1.*itrain1;
z2=y2.*itrain2;
figure;
subplot(2,1,1)
plot(t,z1)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sampled Sinusoidal wave 1::')
subplot(2,1,2)
plot(t,z2)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sampled Sinusoidal wave ::')

%{

%Sampling input sinusoids
h=ones(1,fs);
z3=y1.*h;
z4=y2.*h;
figure;
subplot(2,1,1)
stem(t,z3)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sampled Sinusoidal wave 1::')
axis([0 0.5 -1.5 1.5])
subplot(2,1,2)
stem(t,z4)
xlabel('t--->')
ylabel('Amplitude--->')
title('Sampled Sinusoidal wave ::')
axis([0 0.5 -1.5 1.5])
%}


%Multipexing the Generated Samples

mux_samples=z1+z2;
figure;
plot(abs(z1),'Color','yellow')
hold on;
plot(abs(z2),'Color','green')
xlabel('t--->')
ylabel('Amplitude--->')
title('Multiplexed Wave::')
figure;
plot(abs(mux_samples))
xlabel('t--->')
ylabel('Amplitude--->')
title('Multiplexed Wave::')

%Demultiplexing at the receiver end

itrain3=(2.*itrain1)-1;
itrain4=(2.*itrain2)-1;
demux_samples1=mux_samples.*itrain1;
demux_samples2=mux_samples.*itrain2;
figure;
subplot(2,1,1)
plot(demux_samples1)
title('Demultiplexed Samples 1');
ylabel('Amplitude--->');
xlabel('Time--->');
subplot(2,1,2)
plot(demux_samples2)
title('Demodulated Message 2');
ylabel('Amplitude--->');
xlabel('Time--->');

%Filtering of the Obtained Samples
%Reconstruction of the Analog Signal using a Filter
%fft of input signal


fs=100;
wn=2/(fs/2);  %lowpass
[b,a]=butter(2,wn);  %Choosing order as random N=2 here
f1=filter(b,a,demux_samples1); %Filter design
f2=filter(b,a,demux_samples2)
output_fft=fft(f1);
output_fft=fft(f2);
figure;
subplot(2,1,1)
plot(t,f1,'linewidth',1.5)
title('\color{red} RECONSTRUCTION FILTER USING BUTTERWORTH LOWPASS FILTER');
xlabel('frequency');
ylabel('Amplitude');
subplot(2,1,2)
plot(t,f2,'linewidth',1.5)
title('\color{red} RECONSTRUCTION FILTER USING BUTTERWORTH LOWPASS FILTER');
xlabel('frequency');
ylabel('Amplitude');






