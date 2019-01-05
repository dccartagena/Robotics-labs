function ejercicio1
    d1 = 1; d2 = 4; d3 = 4;
    a1 = 45; a2 = 90; a3 = 30;
    
    figure; hold on;
    
    T0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    P0 = T0(1:3, 4);
    %dibujatriedro(T0);
       
    T1 = traslacionX(T0, d1);
    dibujatriedro(T1);
    P1 = T1(1:3, 4);
    grafeslabon3D(P0, P1);
    
    T2 = rotacionZ(T1, a1);
    dibujatriedro(T2);
    P2 = T2(1:3, 4);
    grafeslabon3D(P1, P2);
    
    T3 = traslacionY(T2, d2);
    dibujatriedro(T3);
    P3 = T3(1:3, 4);
    grafeslabon3D(P2, P3);
    
    T4 = rotacionX(T3, a2);
    dibujatriedro(T4);
    P4 = T4(1:3, 4);
    grafeslabon3D(P3, P4);
    
    T5 = traslacionZ(T4, d3);
    dibujatriedro(T5);
    P5 = T5(1:3, 4);
    grafeslabon3D(P4, P5);
    
    T6 = rotacionY(T5, a3);
    dibujatriedro(T6);
    P6 = T6(1:3, 4);
    grafeslabon3D(P5, P6);
    
    marco = 8;
    
    axis([-marco marco -marco marco -marco marco]);
    box on; set(gca, 'View', [135 45]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title('ejercicio 1')
end