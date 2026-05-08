% secondsBreak: timer (seconds) haptic is turned off;
% secondsBreakInterval: time (seconds) haptic will be turned on (must enconpass the time the system wil be turned on);
% scondsWorkTime: total time of the simulation 
%   NOTE: The timer handlers set the System Duty Cicle, so you should
%   change the DC accordingly in the handlers.
%
function t = timer_haptic_init(secondsBreakInterval,secondsWorkTime,device)
    t = timer;
    t.UserData = device;
    t.TimerFcn = @takebreak;
    t.StopFcn = @timercleanup;
    t.Period = secondsBreakInterval;
    t.StartDelay = t.Period-device.UserData;
    t.TasksToExecute = ceil(secondsWorkTime/t.Period);
    t.ExecutionMode = 'fixedRate';
end


function takebreak(mTimer,~)
    str1 = sprintf('Haptic OFF %d seconds', mTimer.UserData.UserData);
    disp(str1);
    
    %Set the Dut cycle
    writeline(mTimer.UserData,"3");
    writeline(mTimer.UserData,"0");

    pause(mTimer.UserData.UserData);

    %Set the Dut cycle
    writeline(mTimer.UserData,"3");
    writeline(mTimer.UserData,"5");
    
    disp("Turn Haptic ON");
end

function timercleanup(mTimer,~)
    
    %Set the Dut cycle
    writeline(mTimer.UserData,"3");
    writeline(mTimer.UserData,"0");
    
    disp('Timer clean up');
    %fclose(mTimer.UserData); %disconect UART
    delete(mTimer);
end