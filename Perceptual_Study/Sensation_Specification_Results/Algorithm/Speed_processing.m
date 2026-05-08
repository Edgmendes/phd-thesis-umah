clc;
clear;
close all;

total_participants = 18;             %participants involved in the study
number_of_participants_time = 15;    %participants where the Qt App had time control
number_of_participants_notime = 3;   %participants where the Qt App hadn't time control

size_line = 16;                      %size of each line (by excess)
size_n_lines = 60;                   %number of lines of the file
number_trials = 10;                 

dir_1 = "../STM_results";

speed_th_average = zeros(3,1);
speed_min_average = zeros(3,1);
speed_max_average = zeros(3,1);

for k = 1 : 2
        
    if(k==1)
        dir_2 = "LOW";
        speed_thresholds = zeros(total_participants,3);
%         speed_min = zeros(total_participants,3);
%         speed_max = zeros(total_participants,3);
        congruency_flag = zeros(number_of_participants_time,3);
    elseif(k==2)
        dir_2 = "HIGH";
%         total_participants = 12;            
%         number_of_participants_time = 7;
        speed_thresholds = zeros(total_participants,3);
%         speed_min = zeros(total_participants,3);
%         speed_max = zeros(total_participants,3);
        congruency_flag = zeros(number_of_participants_time,3);
    end
    
    %iterate over the different sample rate results
    for i = 1 : 3

        dir_time = "time";

        if(i==1)
            dir_3 = "10";
        elseif(i==2)
            dir_3 = "30";
        elseif(i==3)
            dir_3 = "50";
        end

        dir_to_process = dir_1 + "\" + dir_2 + "\" + dir_3 + "\" + dir_time + "\";

        participant = 1;
        %iterate over each participants (in which the time for each answer existed)
        for j=1:number_of_participants_time

            filename = dir_to_process+num2str(j)+".txt";

            [speed_thresholds(participant,i), speed_min(participant,i), speed_max(participant,i), congruency_flag(participant,i)] = read_process_file_4 (size_line, size_n_lines, number_trials, filename);
            participant = participant + 1;
        end

        dir_time = "notime";
        dir_to_process = dir_1 + "\" + dir_2 + "\" + dir_3 + "\" + dir_time + "\";

        %iterate over each participants
        for j=1:number_of_participants_notime

            filename = dir_to_process+num2str(j)+".txt";

            [speed_thresholds(participant,i), speed_min(participant,i), speed_max(participant,i)] = read_process_file_wout_time_4 (size_line, size_n_lines, number_trials, filename);
            participant = participant + 1;
        end

    end
    
        if(k==1)
        	speed_thresholds_low = speed_thresholds;
            congruency_flag_low = congruency_flag;
        elseif(k==2)
        	speed_thresholds_high = speed_thresholds;
            congruency_flag_high = congruency_flag;
        end
end

    speed_min_average = min(speed_thresholds,[],1)';
    speed_max_average = max(speed_thresholds,[],1)';
    speed_th_average = sum(speed_thresholds,1)' ./ total_participants;
    
    filename = dir_1 + "\" + dir_2 + "_average.txt";
    fileID = fopen(filename,'w');
    fprintf(fileID,'%s %d \n','SP TH AV     ',speed_th_average);
    fprintf(fileID,'%s %d \n','SP TH MIN     ',speed_min_average);
    fprintf(fileID,'%s %d \n','SP TH MAX     ',speed_max_average);
    fclose(fileID);

    
    
    
    
    
