% Energy Landscape for the ranger problem
%
% Nathan Moore, Winona State
% 2022-10-29
%
% system parameters
clear
m_earth = 5.98e24; % kg
m_moon = 7.35e22; % kg
m_ranger = 135.0; %kg
r_earth = 6378.0e3; % m
r_moon = 1.74e6; % m
initial_height_above_earth = 50.0e3; % m
G = 6.67e-11; % N m^2 / kg^2
d_earth_to_moon = 3.85e8; % m

r=linspace(r_earth+initial_height_above_earth, d_earth_to_moon-r_moon,1000);

U_moon = -G*m_moon*m_ranger./(d_earth_to_moon-r);
U_earth = -G*m_moon*m_earth./(r);

F_moon = G*m_moon*m_ranger./(d_earth_to_moon-r).^2;
F_earth = -G*m_earth*m_ranger./(r.^2);

subplot (2, 2, 1)
  plot(r,U_moon,"-",'DisplayName',"U_{Moon}")
  hold on
  plot(r,U_earth,"-",'DisplayName',"U_{Earth}")
  plot(r,U_moon+U_earth,"-",'DisplayName',"U_{Total}")
  hold off
  ylabel("Energy, (Joules)", 'FontSize', 14)
  xlabel("radius from Earth's center, r, (m)", 'FontSize', 14)
  legend('Location','South', 'FontSize', 14)
  grid()
subplot (2, 2, 3)
  plot(r,U_moon,"-",'DisplayName',"U_{Moon}")
  ylabel("Energy, (Joules)", 'FontSize', 14)
  xlabel("radius from Earth's center, r, (m)", 'FontSize', 14)
  legend('Location','South', 'FontSize', 14)
  grid()
subplot (2, 2, [2,4])
  plot(r,F_moon,"-",'DisplayName',"F_{Moon}")
  hold on
  plot(r,F_earth,"-",'DisplayName',"F_{Earth}")
  plot(r,F_moon+F_earth,"-",'DisplayName',"F_{Total}")
  hold off
  ylabel("Force (N)", 'FontSize', 14)
  xlabel("radius from Earth's center, r, (m)", 'FontSize', 14)
  legend('Location','South', 'FontSize', 14)
  grid()
