% What is the power necessary to push a car through the atmosphere?
%
% Nathan Moore, Winona State
% 2022-10-28
%

% Toyota Prius
m = 1380.0; % kg
Cd=0.25; % flat plate
width= 69.0*(1.0/39.37); % inches to m
height = 59.0*(1.0/39.37); % inches to m
A=width*height; % cross-sectional area
rho_air=1.225; % kg/m^3

% velocities
v=linspace(1,60);

f_air = 0.5*Cd*A*rho_air*v.^2;

% power = force*velocity
power = f_air.*v

subplot (2, 1, 1)
  plot(v*(1.0/0.44704),f_air*(1/4.448))
  xlabel("speed, mph")
  ylabel("Air Resistance Force, lbs")
  title("2013 Toyota Prius")
  grid()
subplot (2, 1, 2)
  plot(v*(1.0/0.44704),power*(1.0/746.0))
  xlabel("speed, mph")
  ylabel("Required power, hp")
  title("2013 Toyota Prius, 80hp electric, 98hp gas, 134hp overall")
  grid()
% multiple plots via
% https://www.dm.unibo.it/~achilles/calc/octave.html/Multiple-Plots-on-One-Page.html
