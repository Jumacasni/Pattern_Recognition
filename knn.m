function C = knn(trainclass, traindata, data, k)

% Substract the sum of the angles of the same direction of the training
% data from the test data
    for i = 1:size(traindata,3)
        for j = 1:size(traindata,2)
            distances(:,j) = abs(traindata(:,j,i) - data(:,j,1));
        end
% Compute the mean of the mean of the substraction calculated before
        mean_distance(i) = mean2(distances);
    end
    
% Sort distances in ascending orders
    [sortval sortpos] = sort(mean_distance);
% Select k neighbors
    k_neighbors = sortpos(1:k);

% Calculate the class of each neighbor
    for j = 1:k
        k_neighbors_classes(j) = trainclass(k_neighbors(j));
    end

% Get the most frequent class of the neighbors
    C = mode(k_neighbors_classes);

end