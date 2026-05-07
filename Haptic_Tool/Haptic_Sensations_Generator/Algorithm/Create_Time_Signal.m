function [t] = Create_Time_Signal(duration, step)

t = -duration/2 : step : duration/2-step;

end