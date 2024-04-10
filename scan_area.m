% directional echoes in an array to loop on
directions = [DeadAheadEcho; StarboardBowEcho; StarboardBeamEcho; ...
    StarboardQuarterEcho; DeadAsternEcho; PortQuarterEcho; ... 
    PortBeamEcho; PortBowEcho];
% item echoes in an array to loop on -> TxPulse would indicate rock/wall
objects = [TxPulse; TyphoonSubEcho; AkulaSubEcho; LosAngelesSubEcho];
v_sea = 1500;
fsamp = 50e3;
% threshold = 0.22;

rowNames = ["Dead Ahead";"Starboard Bow";"Starboard Beam"; ...
"Starboard Quarter";"Dead Astern";"Port Quarter";"Port Beam";"Port Bow"];

colNames = ["Rock/Wall", "Typhoon", "Akula", "LA"];

results = table('Size', [8, 4], 'RowNames', rowNames, ...
    'VariableNames',colNames, 'VariableTypes', repmat("cell", 1, 4));

for i=1:length(rowNames)
    dir_echo = directions(i, :);
    obj_corrs = zeros(1, length(colNames));
    obj_dist = zeros(1, length(colNames));
    threshold = 0; % get average xcorr value for some xcorr
    for j=1:(length(colNames))

        % Correlate a direction with each object
        Cxy = NormCrossCorrelate(dir_echo, objects(j, :));
        if (j == 1) % only take an average for one xcorr function
            % make threshold value with mean across a direction to go above noise
            threshold = mean(Cxy);
        end
%         % for testing
%         figure(1)
%         sgtitle(rowNames(i) + ", " + colNames(j));
%         soundsc(Cxy)
%         pause
        % take max(abs(hilbert(xn))) to find peak, index 
        % -> this is used to calc distance by * fsampl * speed of sound in sea
        % water ~ 1500 m/s ( dist / 2 because signal is time to an object and back)
        Cxy_envelope = abs(hilbert(Cxy));
        [peak_corr, n] = max(Cxy_envelope);
        obj_corrs(j) = peak_corr;
        peak_dist = round(n/fsamp*v_sea/2);
        obj_dist(j) = peak_dist;
    end
    % filter distance below threshold
    [detected, indices] = find(obj_corrs > threshold);
    final_distances = zeros(1, length(obj_dist));
    final_distances(indices) = obj_dist(indices);

    % for samples that are at the same distance see which has higher
    % correlation value
    determine_max = [];
    for j=1:length(final_distances)
        for k=1:length(final_distances)
            if(j ~= k)
                if((final_distances(j) >= (final_distances(k) - 5)) && ...
                        (final_distances(j) <= (final_distances(k) + 5)))
                    if(obj_corrs(j) >= obj_corrs(k))
                        final_distances(k) = 0; % eliminate k if j is greater
                    else
                        final_distances(j) = 0; % else eliminate j
                    end
                end
            end
        end
    end
    % convert nominal values to cell values for table
    results(i, :) = array2table(num2cell(final_distances));
end

display(results);



