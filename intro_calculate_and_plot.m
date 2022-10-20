% intro calcuate and plot with Octave/Matlab
% Nathan Moore
% 2022-10-19

G = 6.67e-11; % N m^2 / kg^2
M_earth = 5.98e24; % kg
R=6378e3; %km
g=G*M_earth/R^2 ;

% create a list of radaii
r_vals=linspace(6378e3,6378e3+600e3);
% create a list of g-values from that list
g_vals=G*M_earth./r_vals.^2;
% note the funny ./ and .** operators.  They arise because
% you're doing this operation all at once on a matrix!
plot(r_vals,g_vals)
ylabel("gravitational acceleration, (N/kg)")
xlabel("radius from Earth, (meters)")
