clc;
clear;
close all;

addpath('spgl1-1.9/');

load('skin1muscle1_trial2');
T_pulse=120e-6;
SampFr_DPO = 12.5e9;
fil1 = fir1(200,5e6/(SampFr_DPO/2));
RxWaveformFil = filtfilt(fil1,1,RxWaveform);
reducedSamplingRate = 4e6;
RxWaveformFilSubSample = resample(RxWaveformFil,reducedSamplingRate,SampFr_DPO );
f1 = fftshift(fft(RxWaveformFilSubSample));
ff = linspace(-reducedSamplingRate/2,reducedSamplingRate/2,length(RxWaveformFilSubSample));
figure; plot(ff,20*log10(abs(f1)));

t=0:1/reducedSamplingRate:T_pulse-1/reducedSamplingRate;


