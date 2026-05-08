row = zeros(size(M));
col = zeros(size(M));

fwhm_xx = zeros(size(M));
fwhm_yy = zeros(size(M));

%% FWHM

%find maximum of the matrix
M = reshape( max(p_est,[],[1 2]), size(p_est,3), 1); 

half_max = M/2;

for i = 1:size(p_est,3)
    %find the indexes of the maximum (row col)
    [row(i),col(i)] = find( p_est(:,:,i) == M(i) );

    %number of element above the half max
    fwhm_xx(i) = size( find( p_est(row(i),:,i) >= half_max(i) ), 2);
    fwhm_yy(i) = size( find( p_est(:,col(i),i) >= half_max(i) ), 1);
end

diameter_fwhm = step*(fwhm_xx+fwhm_yy)/2;

%% Radiation Force at 20ºC
alpha = 2;
air_density = 1.2041;
speed_sound = 343.21;

force = zeros(size(M));
limits = round((fwhm_xx+fwhm_yy)/2);

for i=1:length(limits)
    if(mod(limits(i),2))
        limits(i) = limits(i) + 1;
    end
end

for n = 1:length(dc_array_all)
    for i=col(n)-limits(n)/2:col(n)+limits(n)/2
       for j=row(n)-limits(n)/2:row(n)+limits(n)/2
        force(n) = ( ( P_estimated(i,j,n)^2 / (air_density * speed_sound^2) ) * (step)^2 ) + force(n); 
       end 
    end
end

force = force * alpha;


