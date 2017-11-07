%In class 19
clear all; close all
% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];
%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 
placebo_mean=mean(placebo);
treatment1_mean=mean(treatment1);
treatment2_mean=mean(treatment2);
means=[ placebo_mean treatment1_mean treatment2_mean];
std_devs=[std(placebo), std(treatment1), std(treatment2)];
figure(1)
bar(means)
hold on
errorbar(means, std_devs, '.')
hold off
%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
data=[placebo, treatment1, treatment2];
groups={'placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2'};
figure(2)
[p, table, stats]=anova1(data,groups)
%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 
figure(3)
multcompare(stats)
%treatment 2 is significantly different from placebo

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

data=load('data.mat');
%xdat, ydat
%1st order is best
x=data.xdat;
y=data.ydat;
yy=data.ydat2;
figure(4)
plot(x, y, 'r.', 'MarkerSize', 20);
[coeff_x1, ~] = polyfit(x, y,1);
hold on;
plot(x, polyval(coeff_x1, x), 'k-', 'LineWidth', 3);
hold off;
figure(5)
plot(x, y, 'r.', 'MarkerSize', 20);
[coeff_x2, ~] = polyfit(x, y,2);
hold on;
plot(x, polyval(coeff_x2, x), 'k-', 'LineWidth', 3);
hold off;
figure(6)
plot(x, y, 'r.', 'MarkerSize', 20);
[coeff_x3, ~] = polyfit(x, y,3);
hold on;
plot(x, polyval(coeff_x3, x), 'k-', 'LineWidth', 3);
hold off;

%xdat, ydat2
%3rd order is best
figure(7)
plot(x, y, 'r.', 'MarkerSize', 20);
[coeff_xx1, ~] = polyfit(x, yy,1);
hold on;
plot(x, polyval(coeff_xx1, x), 'k-', 'LineWidth', 3);
hold off;
figure(8)
plot(x, yy, 'r.', 'MarkerSize', 20);
[coeff_xx2, ~] = polyfit(x, yy,2);
hold on;
plot(x, polyval(coeff_xx2, x), 'k-', 'LineWidth', 3);
hold off;
figure(9)
plot(x, yy, 'r.', 'MarkerSize', 20);
[coeff_xx3, ~] = polyfit(x, yy,3);
hold on;
plot(x, polyval(coeff_xx3, x), 'k-', 'LineWidth', 3);
hold off;

%xdat,ydat2 with fit
figure(10)
fit_out1 = fit(x', yy', 'poly1');
plot(fit_out1, x, yy)
figure(11)
fit_out2 = fit(x', yy', 'poly2');
plot(fit_out2, x, yy)
figure(12)
fit_out3 = fit(x', yy', 'poly3');
plot(fit_out3, x, yy)
