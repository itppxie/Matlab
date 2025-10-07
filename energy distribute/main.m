
clear, clear all, clc, close all;

Ef = [1, 2, 3; 10, 20, 30];
Omega = [1, 1, 1; 1, 0, 1; 1, 1, 1];

output = energy_distribute(Ef, Omega);
disp(output);