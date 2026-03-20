
function perievent_matrix = align_event_miniscope(traces, timestamps, events, pre_time, post_time)

% Make an empty 3D matrix: Cell x trial x time
cell_count = size(traces, 2);
trial_count_lick = length(events);
FR = 10;
frame_count_lick = (post_time + pre_time)* FR +1;
perievent_matrix = zeros(cell_count, trial_count_lick, frame_count_lick);

% fill the matrix using the align function
for i = 1:cell_count
    perievent_matrix(i,:,:) = align_events(traces(:,i), timestamps, events, pre_time, post_time);
end

end

%Aligning functions



function perievent_signal = align_events(signal, timestamps, events, pre_time, post_time)
% This function stores the signals during each perievent window
% into a matrix "perievent_signal" and returns it. The window is defined by pre_time
% and post_time



%Find the signal timestamps that are closest to the event
% and get their indices
event_inds = [];
for i = 1:length(events)
   [~, event_inds(i)] = min(abs(timestamps - events(i)));
end

% This converts pre and post event time into frame numbers
pre_ind_num = abs(pre_time)*10;
post_ind_num = abs(post_time)*10;

%This stores the signals during each of the window into a matrix
perievent_signal = [];
for i = 1:length(event_inds)
    perievent_signal(i, :) = signal((event_inds(i)-pre_ind_num):(event_inds(i)+post_ind_num));
end

end

