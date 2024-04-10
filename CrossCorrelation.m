function Cxy = CrossCorrelation(xn,yn)
%   Cxy = CrossCorrelation(xn,yn);
%   Cross correlation takes two sequences and
%   computes the cross correlation of the signals using a zero-padded fft
%   function with normal xn sequence and time-reverse yn sequence.
%   where the input arguments are:
%       xn = time domain samples of a discrete-time sequence
%       yn = time domain samples of a discrete-time sequence
%   and the outputs are:
%       Cxy = cross-correlation values at lag k
%-------------------------------------------------------------------------
% compute zero padding length
x_length = length(xn); % length of x
n_x = 0:(x_length-1); % sample array for x
y_length = length(yn); % length of y
n_y = 0:(y_length-1); % sample array for y

% what the ACTUAL c length will be
c_length = x_length + y_length - 1;
n_c = 0:(y_length-1);

% length to zero pad sequences to a power of 2 to speed up fft
npow2_length = 2^nextpow2(c_length);

x_zs = zeros(npow2_length - x_length, 1).'; % num of 0s to append to x
y_zs = zeros(npow2_length - y_length, 1).'; % num of 0s to append to y

x_p = [xn x_zs]; % x zero padded sequence
y_p = [yn y_zs]; % h zero padded sequence

% take fft of each sequence
xk = fft(x_p); % dft of zero padded xn
n_x_k = (0:(length(xk)-1)) ./ length(xk); % sample values of xk
yk = fft(fliplr(y_p)); % dft of time reversed zero padded yn
n_y_k = (0:(length(yk)-1)) ./ length(yk); % sample values of yk

% complex multiply X(k).*Y(k)
ck = xk.*yk; % freq domain multiplication
n_c_k = (0:(length(ck)-1)) ./ length(ck); % sample values of ck

% C(k) is product and c[n] is ifft
cn_zp = ifft(ck); % inverse fft to get cn
Cxy = cn_zp(1:c_length);
end

