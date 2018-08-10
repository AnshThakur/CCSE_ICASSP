function [t,f, ps ] = calculateSpectrogram(y,fs)
[t,f,g]=spgrambw(y,fs,'pJcw',90.5); %% 20ms with 5 ms overlap
ps=g;
end

