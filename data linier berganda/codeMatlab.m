%%% Menyelesaikan permasalahan regresi linear berganda %%%

clc; clear;

%% Data
data = xlsread('apartments.xls');      
y = (data(:,1));       % price                                                                    
x1 = (data(:,2));      % distance to city center
x2 = (data(:,3));      % rooms
x3 = (data(:,4));      % size

%% Mendefinisikan A
A1 = ones(76,1);
A = [A1 x1 x2 x3];

%% Menyelesaikan b
b = (inv(A'*A)*A')*y;