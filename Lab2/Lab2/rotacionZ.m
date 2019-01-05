function [B] = rotacionZ(A, theta)
    rotZ = [cosd(theta) -sind(theta) 0 0;...
            sind(theta)  cosd(theta) 0 0;...
            0            0           1 1;...
            0            0           0 1];
    B = A*rotZ;
end