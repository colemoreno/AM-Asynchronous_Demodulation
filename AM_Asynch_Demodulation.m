clear all;
clc;

%Variable Settings
% hamoffset is the offset from the Ham It Up Upconverter. 
% AMoffset is a predetermined value to offset the center frequency since 
% the noncoherent demodulator needs a carrier frequency, not a baseband
% (0 Hz) frequency to be able to demodulate. AMoffset needs to be an order 
% of magnitude greater the signal bandwidth.
% RxFrequency is the frequency that is set on the SDR-RTL Receiver object
% TunerGain is variable depending on the strength of the output.
hamoffset = 125e6;      
fc = 1140e3;            
AMoffset = -40e3;   
RxFrequency = hamoffset + fc + AMoffset;
TunerGain = 60;
SampleRate = 240e3;
SamplesPerFrame = 4096;

%Setting up the audio device writer
player = audioDeviceWriter('Driver','WASAPI','SampleRate',48e3);

%% Function Settings

%Setting up the sdr
rx = comm.SDRRTLReceiver('CenterFrequency',RxFrequency,...
    'EnableTunerAGC',false,...
    'TunerGain', TunerGain,...
    'SampleRate',SampleRate,...
    'OutputDataType','double',...
    'SamplesPerFrame',SamplesPerFrame);

%Set up bandpass filter (centered at 40kHz with +-2.5kHz of passband)
BPF = firpm(100,[0 35e3 37.5e3 42.5e3 45e3 (240e3/2)]/(240e3/2), [0 0 1 1 0 0]);

%% AM Asynchronous Receiver
while(true)
%Getting data from sdr for one frame (SampleRate samples)
rxdata = rx();
%Multiply received signal by 10 to increase signal power
rxdata = rxdata*10;

%Pass rx signal through bandpass filter
y = conv2(rxdata,BPF,'same');

%Send y signal through absolute value
z = abs(y);

%Decimate z signal down to fs = 48e3 Hz. DecimationFactor = 5
output = decimate(z,5,'fir');

player(output);
end












