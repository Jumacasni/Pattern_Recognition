function digit = preprocessing(s)
% We remove the z axis, that is, the third column
s(:,3) = [];

% First step: centering the position of the digit
    % calculate the minimum and maximum of x and y axis (boundary)
    minimum = min(s);
    maximum = max(s);

    % center point of the boundary
    center_point = (minimum + maximum)/2;

    % center the digit according the boundary
    digit = s - center_point;

% Second step: scale the digits
    % calculate the minimum and maximum of the digit
    minimum = min(digit);
    maximum = max(digit);

    % calculate the ratio according to the size that we want: 30x300
    wbhb = max(digit) - min(digit);
    r = 300/wbhb(:,2);
    digit(:,2) = digit(:,2) * r;
    r = 30/wbhb(:,1);
    digit(:,1) = digit(:,1) * r;

% Remove useless points
    digit = remove_points(digit);

end