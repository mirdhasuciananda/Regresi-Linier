%%% Menyelesaikan permasalahan regresi linear berganda %%%

clc; clear; close all;

%% Data
data = xlsread('apartments.xls');      
y = (data(:,1));       % price                                                                    
x1 = (data(:,2));      % distance to city center
x2 = (data(:,3));      % rooms
x3 = (data(:,4));      % size

%% Mendefinisikan A
k = size(data,1);      % jumlah data
A1 = ones(k,1);
A = [A1 x1 x2 x3];

%% Menyelesaikan b
b = (inv(A'*A)*A')*y;

%% Prediksi nilai berdasarkan hasil linier regresi
y_predict = zeros (k,1);
for i=1:k
    y_predict(i) = b(1,1) + b(2,1)*x1(i) + b(3,1)*x2(i) + b(4,1)*x3(i);
end

%% Visualisasi
figure(1)
plot(y, 'Marker','*', 'LineWidth', 2);
hold on;
plot(y_predict, 'Marker','diamond', 'LineWidth', 2);
title('Harga Apartemen');
xlabel("Data Ke-")
ylabel("Harga")
legend('Data','Prediksi');
grid on

%% Menghitung MAPE
MAPE = 100 * mean(abs((y_predict(:)-y(:))./y(:)));
