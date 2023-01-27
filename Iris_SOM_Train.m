clear;
close all;

%% Data Input
load('IrisData.mat')

N_DATA = 150;

feature = IrisData(1:N_DATA,1:4);
feature = feature{:,:};

[feature_row,feature_col] = size(feature);

%% Normalisasi

%Normalisasi Min-Max
feature_norm = zeros(size(feature));
for m = 1 : feature_row
    for n_train = 1 : feature_col
       feature_norm(m,n_train) = ((feature(m,n_train) - min(feature(:,n_train)))/(max(feature(:,n_train)) - min(feature(:,n_train))));
    end
end

%% Hyperparameter & Declare Variable

%Hyperparameter
x_size  = feature_col; %Input layer 
y_size = 2; %Output layer (number of cluster(s))

alpha = 0.6;
beta = 0.99; %alpha decrease rate
max_epoch = 1000;

%Variable
stop = 0;
alpha_target = 0.00001;
epoch_count = 1;

%% Initialisasi

%Random init
rng(0) %Randomizer seed 
epsilon_init = 1; %Range random number

%Weight init
weight = rand(x_size, y_size) * 2 * epsilon_init - epsilon_init;
disp(weight) % Weight before training

%% Training

while stop == 0 && epoch_count <= max_epoch
    for n_train = 1:N_DATA
        % Euclidian distance calculation
        for l = 1:y_size
            i_vect = feature_norm(n_train,:);
            c_vect = weight(:,l);
            e_dist(l) = sqrt(sum((i_vect - transpose(c_vect)) .^2));
        end
        % Closest cluster determination
        [c_dist, c_ind] = min(e_dist);
        % Weight update on closest cluster
        for i = 1:x_size
            weight(i,c_ind) = weight(i,c_ind) + alpha*(i_vect(i)-weight(i,c_ind));
        end
    end
    
    alpha = beta * alpha; % Learning rate update
    
    if alpha <= alpha_target
        stop = 1;
    end
    
    epoch_count = epoch_count + 1;
end

disp(weight) % Weight after training

Iris_SOM_Test
