function Cxy = NormCrossCorrelate(xn,yn)
%   Cxy = NormCrossCorrelate(xn,yn);
%   The normalized cross correlation function takes two sequences and
%   computes the cross correlation of the signals using a zero-padded fft
%   function with normal xn sequence and time-reverse yn sequence. The 
%   result is then normalized with the root-product of the
%   autocorrelation for each sequence at lag position 0.
%   where the input arguments are:
%       xn = time domain samples of a discrete-time sequence
%       yn = time domain samples of a discrete-time sequence
%   and the outputs are:
%       Cxy = cross-correlation values at lag k
%-------------------------------------------------------------------------

rxx = CrossCorrelation(xn, xn); % autocorrelation of xn
ryy = CrossCorrelation(yn, yn); % autocorrelation of yn
rxy = CrossCorrelation(xn, yn); % cross correlation of xn, yn

Cxy = rxy ./ (sqrt(rxx(1) * ryy(1))); % normalizing the cross correlation

% % plot xn, yn, and Cxy
% figure(1)
% 
% subplot(3, 1, 1);
% stem(0:length(xn)-1, xn, ".");
% title("Input Signal xn");
% xlabel("n");
% ylabel("x[n]");
% 
% subplot(3, 1, 2);
% stem(0:length(yn)-1, yn, ".");
% title("Input Signal yn");
% xlabel("n");
% ylabel("y[n]");
% 
% subplot(3, 1, 3);
% stem(0:length(Cxy)-1, Cxy, ".");
% title("Cross Correlation of xn, yn");
% xlabel("k");
% ylabel("C_{xy}[k]");

end

