% Solution to an elastic conservation of energy+momentum equation via graph
clear
# list of possible (final) puck velocities
vp=linspace(-45,45);

# from Kinetic Energy conservation
vg_KE = ((0.5*0.14*40^2-0.5*0.14*vp.^2)*(2.0/65)).^0.5;

# from momentum conservation
vg_P = (40*0.14+0.14*vp)/65;

plot(vp,vg_KE,"-",'DisplayName',"KE conservation")
  hold on
  plot(vp,vg_P,"-",'DisplayName',"P conservation")
  hold off
  ylabel("Goalie velocity, v_g (m/s)", 'FontSize', 14)
  xlabel("puck velocity, v_p, (m/s)", 'FontSize', 14)
  grid()
