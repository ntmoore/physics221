# Nathan
# physics 221 example
# 2022-10-07

# how do you read from file? 
# https://www.mathworks.com/help/matlab/ref/csvread.html
# skip the first two rows, read all columns
R1=2;
C1=0;
exp_data=csvread(
'data.csv',
R1,
C1
);

# create 1D arrays from 2D CSV data
t = exp_data(:, 1);
v = exp_data(:, 2);
x = exp_data(:,3)  ;

# theoretical line
t_th = linspace(0,4);
v_th = t_th*2;

plot(t,v, "o", t_th,v_th, ":" )
ylabel("ylabel, velocity???");
xlabel("xlabel, time???");
legend("experimental data","line from the book");