function [DFTx,Fd] = plot_DFT_mag(x,fsample, figure_num)
% function [DFTx,Fd] = plot_DFT_mag(x,fsample, figure_num);
%   where the input arguments are:
%       x = time domain samples of a discrete-time sequence
%       fsample = sampling frequency (samples / second)
%       figure_num = number of the figure to use for the two plots
%   and the outputs are:
%       DFTx = DFT spectrum values (complex)[same # samples as x]
%       Fd = Digital frequency values for each DFT sample

DFTx = fft(x); % DFT of x
num_of_samples = length(DFTx); % number of samples
Fd = (0:(num_of_samples - 1)) ./ num_of_samples; % digital freq value

% plot magnitude responses
figure(figure_num);
subplot(2, 1, 1); % digital freq plot
stem(Fd, abs(DFTx) / num_of_samples, "."); % stem plot with dot markers
xlabel("Digital Frequency (cycles/sample)");
ylabel("DFT Magnitude");
title("DFT Magnitude Spectrum");

subplot(2, 1, 2); % analog freq plot
stem(Fd.*fsample, abs(DFTx) / num_of_samples, "."); % stem plot with dot markers
xlabel("Analog Frequency (Hz)");
ylabel("DFT Magnitude");

end

