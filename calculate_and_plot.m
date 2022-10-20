% calculate and plot in Octave (Matlab) 
% Nathan Moore
% 2022-10-19
%
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

%sattelite information from https://www.wmo-sat.info/oscar/satellites
r_earth=R;
r_everest=8848+R;
r_airline=13000+R;
r_ISS=400e3+R;
r_ICESAT2=481e3+R;
r_worldview1=499e3+R;
r_tianhui=498e3+R;
% plot, w/ axes labels
plot(r_vals-R,g_vals,'DisplayName',"GM_E/R^2")
hold on % need this for multiple plot commands to be stacked
plot(r_earth-R,G*M_earth/r_earth^2,"o",'DisplayName',"Earth's Surface")
plot(r_everest-R,G*M_earth/r_everest^2,"o",'DisplayName',"Mount Everest")
plot(r_airline-R,G*M_earth/r_airline^2,"o",'DisplayName',"Airline service ceiling")
plot(r_ISS-R,G*M_earth/r_ISS^2,"o",'DisplayName',"International Space Station")
plot(r_ICESAT2-R,G*M_earth/r_ICESAT2^2,"o",'DisplayName',"ICEsta-2 (NASA)")
plot(r_worldview1-R,G*M_earth/r_worldview1^2,"s",'DisplayName',"DigitalGlobe (Commercial)")
plot(r_tianhui-R,G*M_earth/r_tianhui^2,"x",'DisplayName',"Tian Hui - 1 (Chinese PLA)")
hold off
%
legend()
ylabel("gravitational acceleration, g (N/kg)")
xlabel("height above the earth's surface, h, (m)")
