function T = ZXZ(phi, theta, chi)
    phi = deg2rad(phi);
    theta = deg2rad(theta);
    chi = deg2rad(chi);
    
    Rx = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
    Rz1 = [cos(phi) sin(phi) 0;-sin(phi) cos(phi) 0; 0 0 1];
    Rz2 = [cos(chi) sin(chi) 0;-sin(chi) cos(chi) 0; 0 0 1];
    
    T = Rz1*Rx*Rz2;
end