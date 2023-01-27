clc;
close all;
clear;
%% PEMBENTUKAN DATA LATIH
data = xlsread('iris.xlsx', 'Training');
data_train = data(1:105,:);

%data latih
input_train = data_train(:,2:5)';
target_train = data_train(:,1)'; 
target_train_vector = ind2vec(target_train);

%% Membuat Jaringan LVQ

% Melakukan Pembacaan Target
for i=1:105
    for j=1:4
        x(i,j)=data_train(i,j+1);
    end
end
x;
input_neuron = 4; % Jumlah Neuron Input
output_neuron = 3; % Jumlah Neuron Output
data_per_class = 35; % Jumlah Data tiap Kelas
alpha = 0.000001; % Laju Pembelajaran (Learning Rate)
eps = 0.00001; % Batas Perubahan Bobot

% Inisialisasi Bobot
for j = 1:3
    v(j,:) = x((((j - 1)*data_per_class)+1),:);
end
v;

% Pembelajaran LVQ
epoch = 500;
for it = 1:epoch
    k = 1;
    v_old = v;
    for loop = 1:105
        X = x(k, :);
        T = target_train(k);
        min = inf;
        for j = 1:3
            d(j) = 0;
            for i = 1:4
                d(j) = d(j) + ((X(1,i)-v(j,i))^2); % Menghitung Jarak antara Vji dengan Xi
            end
            d(j) = d(j)^0.5;
            if(d(j)<min)
                min = d(j);
                J = j;
            end
        end
        
        % Melakukan Perhitungan Nilai Pengubah Vektor Pewakil / Bobot
        delta_v = alpha*(X-v(J,:));
        
        % Melakukan Pengecekan Info Kelas dan Update Bobot
        if(J == T)
            vn = v(J,:)+delta_v;
        else
            vn = v(J,:)-delta_v;
        end
        v(J,:)=vn;
        k = k + data_per_class;
        if(k > 105)
            k = k-105+1;
        end
    end
    
    % Pengujian Kondisi Penghentian (Selisih Vji saat ini dengan Vji
    % sebelumnya)
    for j = 1:3
        for i = 1:4
            dv(j,i)=abs(v(j,i)-v_old(j,i));
        end
    end
    
    % Pengecekan Apakah Terdapat Data Selisih yang Melebihi Batas Perubahan
    cek_dv = 0;
    for i=1:4
        for j=1:3
            if(dv(j,i)>eps)
                cek_dv=cek_dv+1;
            end
        end
    end
    
    % Apabila Tidak terdapat Perubahan Maka Menghentikan Looping Iterasi
    if(cek_dv==0)
        break
    end
    
    % Melakukan Modifikasi Laju Pembelajaran
    alpha = alpha*0.5
end
it;
v;

%% PEMBENTUKAN DATA TESTING
data = xlsread('iris.xlsx', 'Testing');
data_test = data(1:45,:);

%data uji
input_test = data_test(:,2:5)';
target_test = data_test(:,1)';

%% Pengujian LVQ Terhadap Data Acak Pertama

% Melakukan Pembacaan Target
for i=1:45
    for j=1:4
        a(i,j)=data_test(i,j+1);
    end
end

correct = 0; % Counter Perhitungan Data yang Teridentifikasi Benar
nTest = 45;
in = 1;
false = [];
k = 1;
% Testing Process
for loop = 1:45
    X = a(k, :);
    T = target_test(k);
    min = inf;
    for j=1:3
        d(j) = 0;
        for i = 1:4
            d(j) = d(j) + ((v(j,i)-X(1,i))^2);
        end
        d(j) = d(j)^0.5;
        
        % Melakukan Pemeriksaan Bobot yang Memiliki Jarak yang Paling Dekat
        % dengan Xi
        if(d(j)<min)
            min = d(j);
            J=j;
        end
    end
    % Melakukan Pengecekan Kesesuaian Classification
    if (J==T)
        correct = correct+1;
    else
        false(in,:)=[k J T];
        in = in+1;
    end
    k = k+15;
    if(k>45)
        k = k-45+1;
    end
end

fprintf("Pengujian Model LVQ Terhadap Dataset Pertama\n");
epoch_terakhir = it
sum_train = nTest
sum_correct = correct
recognition_rate = (sum_correct/nTest)*100
false

%% Pengujian LVQ Terhadap Data Acak Kedua

correct = 0; % Counter Perhitungan Data yang Teridentifikasi Benar
in = 1;
false = [];
k = 1;
% Testing Process
for loop = 1:105
    X = x(k, :);
    T = target_train(k);
    min = inf;
    for j=1:3
        d(j) = 0;
        for i = 1:4
            d(j) = d(j) + ((v(j,i)-X(1,i))^2);
        end
        d(j) = d(j)^0.5;
        
        % Melakukan Pemeriksaan Bobot yang Memiliki Jarak yang Paling Dekat
        % dengan Xi
        if(d(j)<min)
            min = d(j);
            J=j;
        end
    end
    % Melakukan Pengecekan Kesesuaian Classification
    if (J==T)
        correct = correct+1;
    else
        false(in,:)=[k J T];
        in = in+1;
    end
    k = k+data_per_class;
    if(k>105)
        k = k-105+1;
    end
end

fprintf("Pengujian Model LVQ Terhadap Dataset Kedua\n");
epoch_terakhir = it
sum_correct = correct
recognition_rate = (sum_correct/105)*100
false
