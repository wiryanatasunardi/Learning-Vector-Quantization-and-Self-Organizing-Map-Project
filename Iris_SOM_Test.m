%% Testing

% Visualization variables
x = feature(:,1);
y = feature(:,2);
z = feature(:,3);
sz = feature(:,4);

for n_train = 1:N_DATA
    % Euclidian distance calculation
    for l = 1:y_size
        i_vect = feature_norm(n_train,:);
        c_vect = weight(:,l);
        e_dist(l) = sqrt(sum((i_vect - transpose(c_vect)) .^2));
    end
    % Closest cluster determination
    [c_dist, c_ind] = min(e_dist);
    
    if c_ind == 1
        color(n_train,:) = [1 0 0];
    else
        color(n_train,:) = [0 0 1];
    end
end

scatter3(x,y,z,sz,color)
