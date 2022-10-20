% Code to simulate dropping a pizza from a 3rd story window. 
% program updates kinematics via simple Physics 221 (Euler) 
% constant-acceleration motion equations
%
% Nathan Moore, Winona State
% 2022-10-19
%
% kinematic parameters
v1=1e-20; % start from rest
x1=12; % start on the 4th floor of a building (12m)
t1=0; % s
dt=0.01; % s

% pizza parameters
m = 4.0; % 8lb pizza?
g = 9.81; % m/s^2
Cd=1.12; % flat plate
A=pi*(8*0.0254)^2; % area of 16" pizza, m^2
rho_air=1.225; % kg/m^3

%how long to simulate?
T=3; %sec
% number of steps to simulate
num_steps = round(T/dt);

% we'll store the kinematics trajectories in a list, initially zero
x=zeros(1,num_steps);
v=zeros(1,num_steps);
f=zeros(1,num_steps);
t=zeros(1,num_steps);

% initial conditions
x(1)=x1;
v(1)=v1;
t(1)=t1;

% Net force calculation
F_g = -m*g;
F_air = 0.5*Cd*A*rho_air*v(1)*v(1);
F_air_direction = -v(1)/abs(v(1));
% the last bit in the air resistance force is a unit vector that makes
% sure F_air points against the object's velocity
f(1) = F_g + F_air*F_air_direction;


% repeat the following commands "num_steps" times.  This is roughly 
% equivalent to Riemann Sum box integration.
for i = 2:num_steps
  t(i) = t(i-1) + dt;
  x(i) = x(i-1) + v(i-1)*dt;
  v(i) = v(i-1) + (1/m)*f(i-1)*dt;
  F_g = -m*g;
  F_air = 0.5*Cd*A*rho_air*v(i)*v(i);
  F_air_direction = -v(i)/abs(v(i));
  f(i) = F_g + F_air*F_air_direction;
  
  % check to see if the pizza hit the ground
  if(x(i-1)>0 && x(i)<0)
    t_hit = (t(i)+t(i-1))*0.5;
    disp(['hit ground at ',num2str(t_hit),' sec'])
  end
end

plot_choice = 3; %(or 2 or 3)
if(plot_choice==1)
  % plot the pizza's height
  ground=0.0;
  plot([t(1),t(num_steps)],[ground,ground],"-")
  hold on
  plot(t,x)
  hold off
  ylabel("height, h, (m)")
  xlabel("time, t, (s)")
  % fancy title via 
  % ghttps://www.mathworks.com/matlabcentral/answers/154272-input-a-variable-into-a-plot-title
  title([num2str(num_steps),' simulation steps, with dt = ',num2str(dt)," sec"])
elseif (plot_choice==2) 
  % or, plot the pizza's velocity
  plot(t,v)
  ylabel("velocity, v, (m/s)")
  xlabel("time, t, (s)")
  title([num2str(num_steps),' simulation steps, with dt = ',num2str(dt)," sec"])
elseif (plot_choice==3)
  % or, plot the pizza's velocity
  plot(t,f)
  ylabel("net force , F_{net}, (m/s)")
  xlabel("time, t, (s)")
  title([num2str(num_steps),' simulation steps, with dt = ',num2str(dt)," sec"])
end
% Note, you could get cute with multiple plots via 
% https://www.dm.unibo.it/~achilles/calc/octave.html/Multiple-Plots-on-One-Page.html
