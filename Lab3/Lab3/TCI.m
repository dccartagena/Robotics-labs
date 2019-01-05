function [tetha1, tetha2] = TCI(xe, ye, L1, L2)

    rho = sqrt(xe^2 + ye^2);
    gamma = acos((L1^2 + L2^2 - rho^2)/(2*L1*L2));
    alfa = atan(ye/xe);
    beta = acos((L1^2 + rho^2 - L2^2)/(2*L1*rho));
    %% solucion codo arriba
    tetha2 = -pi + gamma;
    tetha1 = alfa + beta;
    
    %% solucion codo abajo
%     tetha2 = pi - gamma;
%     tetha1 = alfa - beta;
    
    return;