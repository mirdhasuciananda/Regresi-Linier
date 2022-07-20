%%% Menyelesaikan permasalahan regresi linear sederhana %%%
clc; clear; close all;

%% Data
data = xlsread('SDR-2022-score.xls');      
x = (data(1,:));      % tahun                                                                    
y = (data(2,:));      % indeks nilai

%% Mendefinisikan 
k = size(data,2);     % jumlah data

valxy = 0;
for i = 1:k
    valxy = valxy + x(i)*y(i);
end 

valx = 0;
for i=1:k
    valx = valx + x(i);
end

valy = 0;
for i=1:k
    valy = valy + y(i);
end

valx2 = 0;
for i=1:k
    valx2 = valx2 + x(i)^2;
end

%% Menyelesaikan b
b1 = (k*valxy-valx*valy)/(k*valx2-(valx)^2);
b0 = (valy/k) - b1*(valx/k);

%% Prediksi nilai berdasarkan hasil linier regresi
y_predict = zeros (1,k);
for i=1:k
    y_predict(i) = b0 + b1*x(i);
    i=i+1;
end

%% Visualisasi
figure(1)
plot(x, y, 'Marker','*', 'LineWidth', 2);
hold on;
plot(x, y_predict, 'Marker','diamond', 'LineWidth', 2);
title('Indeks Nilai SDR Indonesia');
ylabel('Nilai')
xlabel('Tahun')
legend('Data','Prediksi');
grid on

%% Menghitung MAPE
MAPE = 100 * mean(abs((y_predict(:)-y(:))./y(:)));
