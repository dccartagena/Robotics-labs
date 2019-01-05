function grafeslabon3D_triedro()
    figure; hold on;
    marco = 8;
    axis([-marco marco -marco marco -marco marco]);
    box on; title('grafica eslabon'); xlabel('x'); ylabel('y'); zlabel('z');
    tamano_pantalla = get(0, 'ScreenSize');
    set(gcf, 'Position', [0 0 tamano_pantalla(3) tamano_pantalla(4)]);
    
    T0 = eye(4);
    P0 = T0(1:3, 4);
    %dibujatriedro(T0);
    
    d1 = 4;
    T1 = traslacionX(T0, d1);
    P1 = T1(1:3, 4);
    grafeslabon3D(P0, P1);
    dibujatriedro(T1);