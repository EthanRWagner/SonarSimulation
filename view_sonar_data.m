%% KNOWN SONAR ECHOES
% sonar echo: 2s, Fs 50kHz.2 seconds is time to and from reflected object
% data files: 50 ms, 50kHz.

fsample = 50e3; % Hz
audio_fs = 8192; % to listen to the playbacks
figure_num = 1;
duration = 50; % milliseconds
duration_s = 50e-3; % seconds
samples = fsample*duration_s + 1;
t = linspace(0, duration, samples);

% create 1 time-domain plot for each data file
figure(figure_num);
figure_num = figure_num + 1;

subplot(2, 2, 1);
stem(t, TxPulse, ".");
title("Transmit Pulse");
ylabel("Amplitude");
xlabel("Time (ms)");

subplot(2, 2, 2);
stem(t, AkulaSubEcho, ".");
title("Akula Sub Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

subplot(2, 2, 3);
stem(t, LosAngelesSubEcho, ".");
title("Los Angeles Sub Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

subplot(2, 2, 4);
stem(t, TyphoonSubEcho, ".");
title("Typhoon Sub Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

% create 1 frequency-domain plot for each data file

% obtain DFT data for each waveform
[DFT1,Fd1] = plot_DFT_mag(TxPulse,fsample, 1000);
[DFT2,Fd2] = plot_DFT_mag(AkulaSubEcho,fsample, 1000);
[DFT3,Fd3] = plot_DFT_mag(LosAngelesSubEcho,fsample, 1000);
[DFT4,Fd4] = plot_DFT_mag(TyphoonSubEcho,fsample, 1000);

% plot each DFT waveform
figure(figure_num)
figure_num = figure_num + 1;

subplot(2, 2, 1); % analog freq plot
stem(Fd1.*fsample, abs(DFT1) / samples, "."); % stem plot with dot markers
title("Transmit Pulse DFT")
xlabel("Analog Frequency (Hz)");
ylabel("DFT Magnitude");

subplot(2, 2, 2); % analog freq plot
stem(Fd2.*fsample, abs(DFT2) / samples, "."); % stem plot with dot markers
title("Akula Sub Echo DFT")
xlabel("Analog Frequency (Hz)");
ylabel("DFT Magnitude");

subplot(2, 2, 3); % analog freq plot
stem(Fd3.*fsample, abs(DFT3) / samples, "."); % stem plot with dot markers
title("Los Angeles Sub Echo DFT")
xlabel("Analog Frequency (Hz)");
ylabel("DFT Magnitude");

subplot(2, 2, 4); % analog freq plot
stem(Fd4.*fsample, abs(DFT4) / samples, "."); % stem plot with dot markers
title("Typhoon Sub Echo DFT")
xlabel("Analog Frequency (Hz)");
ylabel("DFT Magnitude");

% playback the sonar echoes
pause
soundsc(TxPulse); % transmit pulse sound
pause
soundsc(AkulaSubEcho); % Akula sub playback
pause
soundsc(LosAngelesSubEcho); % LA sub playback
pause
soundsc(TyphoonSubEcho); % Typhoon sub playback

%% DIRECTIONAL SONAR ECHOES
% plot the sonar echoes

% create 1 time-domain plot for each data file
duration = 2000;
duration_s = 2;
samples = fsample*duration_s + 1;
t = linspace(0, duration, samples);

figure(figure_num);
figure_num = figure_num + 1;
stem(t, DeadAheadEcho, ".");
title("Dead Ahead Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, DeadAsternEcho, ".");
title("Dead Astern Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, PortBowEcho, ".");
title("Port Bow Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1; 
stem(t, PortBeamEcho, ".");
title("Port Beam Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, PortQuarterEcho, ".");
title("Port Quarter Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, StarboardBowEcho, ".");
title("Starboard Bow Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, StarboardBeamEcho, ".");
title("Starboard Beam Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

figure(figure_num);
figure_num = figure_num + 1;
stem(t, StarboardQuarterEcho, ".");
title("Starboard Quarter Echo");
ylabel("Amplitude");
xlabel("Time (ms)");

% create 1 frequency-domain plot for each data file

% % obtain DFT data for each waveform
% [DFT1,Fd1] = plot_DFT_mag(DeadAheadEcho,fsample, 1000);
% [DFT2,Fd2] = plot_DFT_mag(DeadAsternEcho,fsample, 1000);
% 
% [DFT3,Fd3] = plot_DFT_mag(PortBowEcho,fsample, 1000);
% [DFT4,Fd4] = plot_DFT_mag(PortBeamEcho,fsample, 1000);
% [DFT5,Fd5] = plot_DFT_mag(PortQuarterEcho,fsample, 1000);
% 
% [DFT6,Fd6] = plot_DFT_mag(StarboardBowEcho,fsample, 1000);
% [DFT7,Fd7] = plot_DFT_mag(StarboardBeamEcho,fsample, 1000);
% [DFT8,Fd8] = plot_DFT_mag(StarboardQuarterEcho,fsample, 1000);
% 
% % plot each DFT waveform
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd1.*fsample, abs(DFT1) / samples, "."); % stem plot with dot markers
% title("Dead Ahead Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd2.*fsample, abs(DFT2) / samples, "."); % stem plot with dot markers
% title("Dead Astern Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd3.*fsample, abs(DFT3) / samples, "."); % stem plot with dot markers
% title("Port Bow Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd4.*fsample, abs(DFT4) / samples, "."); % stem plot with dot markers
% title("Port Beam Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd5.*fsample, abs(DFT5) / samples, "."); % stem plot with dot markers
% title("Port Quarter Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd6.*fsample, abs(DFT6) / samples, "."); % stem plot with dot markers
% title("Starboard Bow Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd7.*fsample, abs(DFT7) / samples, "."); % stem plot with dot markers
% title("Starboard Beam Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");
% 
% figure(figure_num);
% figure_num = figure_num + 1;
% stem(Fd8.*fsample, abs(DFT8) / samples, "."); % stem plot with dot markers
% title("Starboard Quarter Echo DFT")
% xlabel("Analog Frequency (Hz)");
% ylabel("DFT Magnitude");

% playback the sonar echoes
pause
soundsc(DeadAheadEcho); % DAh playback
pause
soundsc(DeadAsternEcho); % DAs playback
pause
soundsc(PortBowEcho); % PBo playback
pause
soundsc(PortBeamEcho); % PBe playback
pause
soundsc(PortQuarterEcho); % PQ playback
pause
soundsc(StarboardBowEcho); % SBo playback
pause
soundsc(StarboardBeamEcho); % Sbe playback
pause
soundsc(StarboardQuarterEcho); % SQ playback
