function [fwhm] = FWHM(data, step)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

data = squeeze(data);
[maxVal, linearIndex] = max(data,[],'all');
[row, col] = ind2sub(size(data), linearIndex);

half_max = maxVal / 2;

data_vector_row = data(row,:);
data_vector_col = data(:,col);

fwhm_row = length(find(data_vector_row >= half_max));
fwhm_col = length(find(data_vector_col >= half_max));

fwhm = (fwhm_row + fwhm_col)/2 * step;

[minVal_row, Imin_row] = min(data_vector_row);
[minVal_col, Imin_col] = min(data_vector_col);

diam_row = (abs(row-Imin_row))*2;
diam_col = (abs(col-Imin_col))*2;

diameter = (diam_row + diam_col)/2 * step;

f1 = sprintf('FWHM: %d', fwhm);
f2 = sprintf('Diameter: %d', diameter);

disp(f1);
disp(f2);
end