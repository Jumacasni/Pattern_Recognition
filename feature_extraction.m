function zones = feature_extraction(s)

[row col] = size(s);

% Divide the digit into 4 zones
% Each zone has a 15x150 size
    zone1(1) = 0;
    zone2(1) = 0;
    zone3(1) = 0;
    zone4(1) = 0;
    z1 = 1;
    z2 = 1;
    z3 = 1;
    z4 = 1;
    boundary_first_zone_x = [min(s(:,1)), (min(s(:,1)) + max(s(:,1)))/2];
    boundary_first_zone_y = [max(s(:,2)), (max(s(:,2)) + min(s(:,2)))/2];
    boundary_second_zone_x = [(min(s(:,1)) + max(s(:,1)))/2, max(s(:,1))];
    boundary_second_zone_y = [max(s(:,2)), (max(s(:,2)) + min(s(:,2)))/2];
    boundary_third_zone_x = [min(s(:,1)), (min(s(:,1)) + max(s(:,1)))/2];
    boundary_third_zone_y = [(max(s(:,2)) + min(s(:,2)))/2, min(s(:,2))];
    boundary_fourth_zone_x = [(min(s(:,1)) + max(s(:,1)))/2, max(s(:,1))];
    boundary_fourth_zone_y = [(max(s(:,2)) + min(s(:,2)))/2, min(s(:,2))];

% Extract the points of each zone
    for i=1:row
        if( s(i,1) >= boundary_first_zone_x(1) && s(i,1) <= boundary_first_zone_x(2) && s(i,2) <= boundary_first_zone_y(1)&& s(i,2) >= boundary_first_zone_y(2) )
            zone1(z1,1) = s(i,1);
            zone1(z1,2) = s(i,2);
            z1 = z1 + 1;

        elseif ( s(i,1) >= boundary_second_zone_x(1) && s(i,1) <= boundary_second_zone_x(2) && s(i,2) <= boundary_second_zone_y(1)&& s(i,2) >= boundary_second_zone_y(2) )
            zone2(z2,1) = s(i,1);
            zone2(z2,2) = s(i,2);
            z2 = z2 + 1;

        elseif ( s(i,1) >= boundary_third_zone_x(1) && s(i,1) <= boundary_third_zone_x(2) && s(i,2) <= boundary_third_zone_y(1)&& s(i,2) >= boundary_third_zone_y(2) )
            zone3(z3,1) = s(i,1);
            zone3(z3,2) = s(i,2);
            z3 = z3 + 1;

        else
            zone4(z4,1) = s(i,1);
            zone4(z4,2) = s(i,2);
            z4 = z4 + 1;
        end
    end

% Calculate the sum of the angles of each direction according to the
% directions that are explained in the documentation
    zones = zeros(8,4);

    for i=1:(size(zone1(:,1)) - 1)
        angle = atan((zone1(i+1,2) - zone1(i,2))/(zone1(i+1,1) - zone1(i, 1)));
        angle = rad2deg(angle);

        if (angle <= 15 && angle >= -15)
            zones(3,1) = zones(3,1) + angle;

        elseif (angle > 15 && angle <= 75)
            zones(2,1) = zones(2,1) + angle;

        elseif (angle > 75 && angle <= 105)
            zones(1,1) = zones(1,1) + angle;

        elseif (angle > 105 && angle <= 165)
            zones(8,1) = zones(8,1) + angle;

        elseif ((angle > 165 && angle <= 180) || (angle >= -180 && angle <= -165))
            zones(7,1) = zones(7,1) + angle;

        elseif (angle > -15 && angle >= -75)
            zones(4,1) = zones(4,1) + angle;

        elseif (angle < -75 && angle > -105)
            zones(5,1) = zones(5,1) + angle;

        else
            zones(6,1) = zones(6,1) + angle;  
        end
    end

    for i=1:(size(zone2(:,1)) - 1)
        angle = atan((zone2(i+1,2) - zone2(i,2))/(zone2(i+1,1) - zone2(i, 1)));
        angle = rad2deg(angle);

        if (angle <= 15 && angle >= -15)
            zones(3,2) = zones(3,2) + angle;

        elseif (angle > 15 && angle <= 75)
            zones(2,2) = zones(2,2) + angle;

        elseif (angle > 75 && angle <= 105)
            zones(1,2) = zones(1,2) + angle;

        elseif (angle > 105 && angle <= 165)
            zones(8,2) = zones(8,2) + angle;

        elseif ((angle > 165 && angle <= 180) || (angle >= -180 && angle <= -165))
            zones(7,2) = zones(7,2) + angle;

        elseif (angle > -15 && angle >= -75)
            zones(4,2) = zones(4,2) + angle;

        elseif (angle < -75 && angle > -105)
            zones(5,2) = zones(5,2) + angle;

        else
            zones(6,2) = zones(6,2) + angle;  
        end
    end

    for i=1:(size(zone3(:,1)) - 1)
        angle3 = atan2((zone3(i+1,2) - zone3(i,2)), (zone3(i+1,1) - zone3(i, 1)));
        angle3 = rad2deg(angle3);

        if (angle <= 15 && angle >= -15)
            zones(3,3) = zones(3,3) + angle;

        elseif (angle > 15 && angle <= 75)
            zones(2,3) = zones(2,3) + angle;

        elseif (angle > 75 && angle <= 105)
            zones(1,3) = zones(1,3) + angle;

        elseif (angle > 105 && angle <= 165)
            zones(8,3) = zones(8,3) + angle;

        elseif ((angle > 165 && angle <= 180) || (angle >= -180 && angle <= -165))
            zones(7,3) = zones(7,3) + angle;

        elseif (angle > -15 && angle >= -75)
            zones(4,3) = zones(4,3) + angle;

        elseif (angle < -75 && angle > -105)
            zones(5,3) = zones(5,3) + angle;

        else
            zones(6,3) = zones(6,3) + angle;  
        end
    end

    for i=1:(size(zone4(:,1)) - 1)
        angle = atan((zone4(i+1,2) - zone4(i,2))/(zone4(i+1,1) - zone4(i, 1)));
        angle = rad2deg(angle); 

        if (angle <= 15 && angle >= -15)
            zones(3,4) = zones(3,4) + angle;

        elseif (angle > 15 && angle <= 75)
            zones(2,4) = zones(2,4) + angle;

        elseif (angle > 75 && angle <= 105)
            zones(1,4) = zones(1,4) + angle;

        elseif (angle > 105 && angle <= 165)
            zones(8,4) = zones(8,4) + angle;

        elseif ((angle > 165 && angle <= 180) || (angle >= -180 && angle <= -165))
            zones(7,4) = zones(7,4) + angle;

        elseif (angle > -15 && angle >= -75)
            zones(4,4) = zones(4,4) + angle;

        elseif (angle < -75 && angle > -105)
            zones(5,4) = zones(5,4) + angle;

        else
            zones(6,4) = zones(6,4) + angle;  
        end
    end

end