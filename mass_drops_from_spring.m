# calculation to support the lab where a mass drops, and is attached to a spring
# Nathan Moore
# 2022-11-03
#
clear
set(groot,'defaultAxesFontSize',18)
set(groot,'defaultAxesFontName','Comic Sans MS')

# kinematic paremeters
v1=0;
xeq=0.3;
x1=xeq;
#
# system information
m=0.2;
k=15.0;
g=9.81;
#
# time
t1=0;
dt=0.001;
sim_duration=0.75;
num_steps=sim_duration/dt;

# we'll store the kinematics trajectories in a list, initially zero
x=zeros(1,num_steps);
v=zeros(1,num_steps);
f=zeros(1,num_steps);
t=zeros(1,num_steps);

# initial conditions
x(1)=x1;
v(1)=v1;
t(1)=t1;

# Net force calculation, DOWN is positive
F_g = m*g;
F_spring = -k*(x1-xeq);
f(1) = F_g + F_spring;

# repeat the following commands "num_steps" times.  This is roughly
# equivalent to Riemann Sum box integration.
for i = 2:num_steps
  t(i) = t(i-1) + dt;
  x(i) = x(i-1) + v(i-1)*dt;
  v(i) = v(i-1) + (1/m)*f(i-1)*dt;
  F_g = m*g;
  F_spring = -k*(x(i)-xeq);
  f(i) = F_g + F_spring;
end

# "Whole Universe" system energy
KE=0.5*m*v.^2;
U_g=-m*g*x;
U_sp=0.5*k*(x-xeq).^2;

subplot (3, 3, 1)
  plot(t,x)
  xlabel("time (s)")
  ylabel("position (m)")
  grid()

subplot (3, 3, 4)
  plot(t,v)
  xlabel("time (s)")
  ylabel("velocity (m/s)")
  grid()

subplot (3, 3, 7)
  plot(t,f)
  xlabel("time (s)")
  ylabel("Net force (N)")
  grid()

subplot (3, 3, [2,5,8])
  plot(t,KE,'DisplayName',"KE")
  hold on
  plot(t,U_sp,'DisplayName',"U_{spring}")
  plot(t,U_g,'DisplayName',"U_{gravity}")
  plot(t,KE+U_sp+U_g,'DisplayName',"U_{gravity}")
  hold off
  xlabel("time (s)")
  ylabel("Energy (J)")
  grid()
  legend()
  title(['m = ',num2str(m),'(kg), k = ',num2str(k),'(N/m), x_0= ',num2str(xeq),' (m)'])

subplot(3,3,[3,6,9])
  # phase plot
  plot(x,v)
  xlabel("position (m)")
  ylabel("velocity (m/s)")
  grid()

