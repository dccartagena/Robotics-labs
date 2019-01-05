function TCI_scara
%Esta funcion sirve para simular la trayectoria de un robot scada, por
%defecto genera cuadrados en dos planos
    t_sim = 5;
    n_frames = 105;
    t = linspace(0, t_sim, n_frames);
    
    %% Definicion de parametros fisicos del robot
    L0 = 3;
    L1 = 3;
    L2 = 3;
    %% Trayectoria cuadrado
    
    %tramo1
    xei = 1; xef = 3;
    xe = linspace(xei, xef, n_frames/7);

    yei = 1; yef = 1;
    ye = linspace(yei, yef, n_frames/7);

    zei = 3; zef = 3;
    ze = linspace(zei, zef, n_frames/7);
    
    %Tramo 2
    xei = 3; xef = 3;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 1; yef = 3;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 3; zef = 3;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    %Tramo 3
    xei = 3; xef = 1;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 3; yef = 3;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 3; zef = 3;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    %Tramo 4
    xei = 1; xef = 1;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 3; yef = 1;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 3; zef = 3;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    %Tramo 5
    xei = 1; xef = 1;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 1; yef = 1;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 3; zef = 2;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    %Tramo 6
    xei = 1; xef = 3;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 1; yef = 1;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 2; zef = 2;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    %Tramo 7
    xei = 3; xef = 3;
    xe = [xe linspace(xei, xef, n_frames/7)];

    yei = 1; yef = 1;
    ye = [ye linspace(yei, yef, n_frames/7)];

    zei = 2; zef = 3;
    ze = [ze linspace(zei, zef, n_frames/7)];
    
    x0 = 0;
    y0 = 0;
    z0 = 0;
    P0 = [x0 y0 z0];
    
    %Inicializacion de variables
    x1 = zeros(1, n_frames);
    y1 = zeros(1, n_frames);
    z1 = zeros(1, n_frames);
    
    x2 = zeros(1, n_frames);
    y2 = zeros(1, n_frames);
    z2 = zeros(1, n_frames);
    
    x3 = zeros(1, n_frames);
    y3 = zeros(1, n_frames);
    z3 = zeros(1, n_frames);
    
    x4 = zeros(1, n_frames);
    y4 = zeros(1, n_frames);
    z4 = zeros(1, n_frames);
    
    %Animacion
    figure;
    for i = 1:n_frames
        %%Calculo TCI
        [q1, q2, q3] = TCI_scara(xe(i), ye(i), ze(i), L0, L1, L2);
        
        x1(i) = x0;
        y1(i) = y0;
        z1(i) = z0 + L0;
        P1 = [x1(i) y1(i) z1(i)];
        
        x2(i) = x1(i) + L1*cos(q1);
        y2(i) = y1(i) + L1*sin(q1);
        z2(i) = z1(i);
        P2 = [x2(i) y2(i) z2(i)];
        
        x3(i) = x2(i) + L2*cos(q1 - q2);
        y3(i) = y2(i) + L2*sin(q1 - q2);
        z3(i) = z2(i);
        P3 = [x3(i) y3(i) z3(i)];
        
        x4(i) = x3(i);
        y4(i) = y3(i);
        z4(i) = z3(i) - q3;
        P4 = [x4(i) y4(i) z4(i)];
        
        %% Calculo de la TCD
        T0 = [1 0 0 0
              0 1 0 0
              0 0 1 0
              0 0 0 1];
        
        TB = traslacionZ(T0, L0);
        
        T1a = rotacionZ(TB, rad2deg(q1));
        T1b = traslacionX(T1a,  L1);
        
        T2a = rotacionZ(T1b, rad2deg(-q2));
        T2b = traslacionX(T2a, L2);
        
        T3 = traslacionZ(T2b, -q3);
        R3 = T3(1:3, 4);
        
        subplot(3, 3, [1 2 4 5 7 8]); hold on;
        dibujatriedro(T0); dibujatriedro(TB);
        dibujatriedro(T1b); dibujatriedro(T2b);
        dibujatriedro(T3);
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2);
        grafeslabon3D(P2, P3); grafeslabon3D(P3, P4);
        
        plot3(x4(1:i), y4(1:i), z4(1:i), 'k:');
        
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('grafica eslabon'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [45 45]);
        text(-6, -6, -6, ['Posicion del extremo: [' num2str(R3(1)) ', ' num2str(R3(2)) ', ' num2str(R3(3)) ']']);
        
        subplot(3, 3, 3); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3); grafeslabon3D(P3, P4);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje x'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [0 0]);
        
        subplot(3, 3, 6); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3); grafeslabon3D(P3, P4);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje y'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [90 0]);
        
        subplot(3, 3, 9); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3); grafeslabon3D(P3, P4);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje z'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [0 90]);

        pause(0.01);
        if (i ~= n_frames)
            clf;
        end
    end