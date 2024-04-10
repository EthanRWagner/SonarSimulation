function yn = fftconv(xn, hn)
%function yn = fftconv( xn, hn )
%   where the input arguments are:
%       xn = time domain samples of a discrete-time input signal
%       hn = time domain samples of a D-T system Unit Sample Response 
%   and the output is:
%       yn = time domain samples of a discrete-time system output signal

LIMIT = 1000; % limit of samples for figure rendering

% compute zero padding length
x_length = length(xn); % length of x
n_x = 0:(x_length-1); % sample array for x
h_length = length(hn); % length of h
n_h = 0:(h_length-1); % sample array for h

% what the ACTUAL y length will be
y_length = x_length + h_length - 1;
n_y = 0:(y_length-1);

% length to zero pad sequences to a power of 2 to speed up fft
npow2_length = 2^nextpow2(y_length);

x_zs = zeros(npow2_length - x_length, 1).'; % num of 0s to append to x
h_zs = zeros(npow2_length - h_length, 1).'; % num of 0s to append to h

x_p = [xn x_zs]; % x zero padded sequence
h_p = [hn h_zs]; % h zero padded sequence

% take fft of each sequence
xk = fft(x_p); % dft of zero padded xn
n_x_k = (0:(length(xk)-1)) ./ length(xk); % sample values of xk
hk = fft(h_p); % dft of zero padded hn
n_h_k = (0:(length(hk)-1)) ./ length(hk); % sample values of hk

% complex multiply X(k).*H(k)
yk = xk.*hk; % freq domain multiplication
n_y_k = (0:(length(yk)-1)) ./ length(yk); % sample values of yk

% Y(k) is product and y[n] is ifft
yn_zp = ifft(yk); % inverse fft to get yn
yn = yn_zp(1:y_length);

% plot time-domain and freq spectrum plots
figure(1);
if(length(xn) <= LIMIT)
    subplot(3, 2, 1); % x[n]
    stem(n_x, xn, ".");
    xlabel("Sample n");
    ylabel("Amplitude");
    title("x[n] Sequence");
end

if(length(xk) <= LIMIT)
    subplot(3, 2, 2); % X[k]
    plot(n_x_k, abs(xk));
    xlabel("Digital Freq - cyc/sample");
    ylabel("Magnitude Response");
    title("X[k] Spectrum");
end

if(length(hn) <= LIMIT)
    subplot(3, 2, 3); % h[n]
    stem(n_h, hn, ".");
    xlabel("Sample n");
    ylabel("Amplitude");
    title("h[n] Sequence");
end

if(length(hk) <= LIMIT)
    subplot(3, 2, 4); % H[k]
    plot(n_h_k, abs(hk));
    xlabel("Digital Freq - cyc/sample");
    ylabel("Magnitude Response");
    title("H[k] Spectrum");
end

if(length(yn) <= LIMIT)
    subplot(3, 2, 5); % y[n]
    stem(n_y, yn, ".");
    xlabel("Sample n");
    ylabel("Amplitude");
    title("y[n] Sequence");
end

if(length(yk) <= LIMIT)
    subplot(3, 2, 6); % Y[k]
    plot(n_y_k, abs(yk));
    xlabel("Digital Freq - cyc/sample");
    ylabel("Magnitude Response");
    title("Y[k] Spectrum");
end 

end

