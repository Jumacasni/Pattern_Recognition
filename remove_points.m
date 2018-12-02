function digit = remove_points(s)

[row col] = size(s);

% Compute the euclidean distance between consecutive points
    for i=1:(row-1)
        distance(i) = euclidean_distance(s(i,1), s(i+1,1), s(i,2), s(i+1,2));
    end

% Compute the mean of the distance between consecutive points
    mean_distance = mean(distance);
    digit(1,:) = s(1,:);

% Remove distances that are smaller than the average of the distance
% between consecutive points
    i = 1;
    j = 2;
    k = 2;
    while(j < row)
        if(euclidean_distance(s(i,1), s(j,1), s(i,2), s(j,2)) >= mean_distance)
            digit(k,:) = s(j,:);
            i = j;
            j = j+1;
            k = k+1;
        else
            j = j+1;
        end
    end

end