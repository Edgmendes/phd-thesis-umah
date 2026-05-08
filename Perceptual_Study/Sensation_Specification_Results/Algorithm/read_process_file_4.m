function [speed_threshold, speed_min, speed_max, congruency_flag] = read_process_file_4 (size_line, size_n_lines, number_trials, filename)
    
    %open file
    fileID = fopen(filename,'r');
    
    %read file
    formatspec = '%c';
    A = fscanf(fileID,formatspec);

    %organize file by lines
    lines = repmat(' ',size_n_lines,size_line);
    aux = 1;
    aux2 = 1;
    for i = 1 : length(A)

        %display(A(i));
        lines(aux,aux2) = A(i);

        aux2 = aux2 + 1;

        if(double(A(i)) == 10)  %% detect line feed (ascii 10)
            aux = aux + 1;
            aux2 = 1;
        end    

    end

    %organize each line by speed, answer and times
    speed = zeros(size_n_lines,1);
    times = zeros(size_n_lines,1);
    answer = repmat(' ',size_n_lines,1);
    flag = 1;
    aux_index = 0;
    run = 1;
    i = 1;
    j = 1;
    flag_end = 0;
    
    while(run)
        
        if(double(lines(i,j)) == 32)  %%white space
            if(flag)
                speed(i,:) = str2double(lines(i,1:j-1));
                flag = 0;
            else
                answer(i,:) = lines(i,j-1);
                aux_index = j;
                flag = 1;
            end
        elseif(double(lines(i,j)) == 13) %%carriage return
            times(i,:) = str2double(lines(i,aux_index+1:j-1));
            j = 1;
            i = i + 1;
            flag_end = 1;
        end

        %finish condition
        if(i == size_n_lines+1 && j == flag_end )
            run = 0;    
        end

        j = j + 1;

    end

    %delete the first time, it may be a "false positive"
    times(1,1) = 0;

    %identify speeds
    aux_speeds = [0 0 0 0 0 0];
    aux = 1;
    aux1 = 1;

    for i = 1 : length(aux_speeds)
        aux_speeds(1,i) = speed(1);
    end

    run = 1;
    while(run)


        if(speed(aux) ~= aux_speeds(1) && speed(aux) ~= aux_speeds(2) && speed(aux) ~= aux_speeds(3) && ...
                speed(aux) ~= aux_speeds(4) && speed(aux) ~= aux_speeds(5) && speed(aux) ~= aux_speeds(6))

           aux_speeds(aux1) = speed(aux);
           aux1 = aux1 + 1;
           aux = 0;

        end

        %finish condition
        if(aux1 == 6)
            run = 0;
        end

        aux = aux + 1;

    end

    %organize the speed from lowest to greatest
    aux_speeds = sort(aux_speeds);

    %find the indexes associated with each speed
    indexes_speeds = zeros(length(aux_speeds),number_trials);
    aux2 = 1;
    for i = 1 : length(aux_speeds)

        for j = 1 : size_n_lines

            if(speed(j) == aux_speeds(i))
                indexes_speeds(i,aux2) = j;
                aux2 = aux2 + 1;
            end

        end

        aux2 = 1;
    end

    %compute the answers of each speed
    data_answer_speeds = zeros(length(aux_speeds),3);

    for i = 1 : length(aux_speeds)
        data_answer_speeds(i,1) = aux_speeds(1,i);
    end

    for i = 1 : length(aux_speeds)

        for j = 1 : number_trials

            if(answer(indexes_speeds(i,j)) == 'B')
                data_answer_speeds(i,2) = data_answer_speeds(i,2) + 1;
            end

        end

    end

    %calculate the near value to the 50% thresholds
    data_answer_speeds(:,3) = abs(1 -  data_answer_speeds(:,2) ./ 5);
    
%     figure(1);
%     plot(data_answer_speeds(:, 2));
%     ylim([0 10]);
%     grid on;
%     
%     figure(2);
%     plot(data_answer_speeds(:, 3));
%     ylim([0 1]);
%     grid on;
     
    %find the index of that value, the first minimum index is considered as
    % threshold
    [Min,Imin] = min(data_answer_speeds(:,3));
    
    % % %
    if( data_answer_speeds(Imin, 2) > 5 )
        index_upper = find(data_answer_speeds(:, 2) > 5);
        speed_threshold = (data_answer_speeds(index_upper(1), 1) + data_answer_speeds(index_upper(1)-1, 1)) / 2;
    elseif( data_answer_speeds(Imin, 2) < 5 )
        index_under = find( data_answer_speeds(:, 2) < 5 );
        speed_threshold = (data_answer_speeds(index_under(end)+1, 1) + data_answer_speeds(index_under(end), 1)) / 2;
    else
        index_equal = find(data_answer_speeds(:, 2) == 5);

        if(numel(index_equal) > 1)
            speed_threshold = (data_answer_speeds(index_equal(1),1)+data_answer_speeds(index_equal(2),1)) / 2;
        else
            index_upper = find(data_answer_speeds(:, 2) >= 5);
            if(index_upper(1) ~= index_equal(1))
                speed_threshold = (data_answer_speeds(index_upper(1),1)+data_answer_speeds(index_upper(1)-1,1)) / 2;
            else
                speed_threshold = data_answer_speeds(index_equal(1),1);
            end
        end
    end
    
    % % %
    [Imin_idx] = find(round(data_answer_speeds(:,3),1) == round(Min,1));
    
    %calculate the medium times to check if it is congruent with the speed
    %threshold index
    data_answer_times = zeros(length(aux_speeds),2);

    for i = 1 : length(aux_speeds)
        data_answer_times(i,1) = aux_speeds(1,i);
    end

    for i = 1 : length(aux_speeds)
        for j = 1 : number_trials
                data_answer_times(i,2) = times(indexes_speeds(i,j)) + data_answer_times(i,2);
        end
    end
    
    [Max,Imax] = max(data_answer_times(:,2));
    
    congruency_flag = 0;
        
    speed_min = data_answer_speeds(1,1);
    speed_max = data_answer_speeds(length(aux_speeds),1);

    fclose(fileID);

end

