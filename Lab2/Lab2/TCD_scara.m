function TCD_scara
    t_sim = 10;
    n_frames = 100;
    t = linspace(0, t_sim, n_frames);
    
    q1i = 0; q1f = 135;
    q1 = linspace(q1i, q1f, n_frames);
    
    q2i = 0; q2f = -135;
    q2 = linspace(q2i, q2f, n_frames);
    
    q3i = 0; q3f = -1.5;
    q3 = linspace(q3i, q3f, n_frames);
    
    figure;
    for i = 1:n_frames
        T0 = [1 0 0 0
              0 1 0 0
              0 0 1 0
              0 0 0 1];
        P0 = T0(1:3, 4);
        
        L0 = 5;
        TB = traslacionZ(T0, L0);
        PB = TB(1:3, 4);
        
        L1 = 3;
        T1a = rotacionZ(TB, q1(i));
        T1b = traslacionX(T1a, L1);
        P1 = T1b(1:3, 4);
        
        L2 = 4;
        T2a = rotacionZ(T1b, q2(i));
        T2b = traslacionX(T2a, L2);
        P2 = T2b(1:3, 4);
        
        L3 = -4;
        T3 = traslacionZ(T2b, q3(i));
        P3 = T3(1:3, 4);
        
        subplot(3, 3, [1 2 4 5 7 8]); hold on;
        dibujatriedro(T0); dibujatriedro(TB);
        dibujatriedro(T1b); dibujatriedro(T2b);
        dibujatriedro(T3);
        grafeslabon3D(P0, PB); grafeslabon3D(PB, P1);
        grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('grafica eslabon'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [45 45]);
        text(-6, -6, -6, ['Posicion del extremo: [' num2str(P3(1)) ', ' num2str(P3(2)) ', ' num2str(P3(3)) ']']);
        
        subplot(3, 3, 3); hold on;
        grafeslabon3D(P0, PB); grafeslabon3D(PB, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje x'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [0 0]);
        
        
        subplot(3, 3, 6); hold on;
        grafeslabon3D(P0, PB); grafeslabon3D(PB, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje y'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [90 0]);
        
        
        subplot(3, 3, 9); hold on;
        grafeslabon3D(P0, PB); grafeslabon3D(PB, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje z'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [90 90]);
        
%         tamano_pantalla = get(0, 'ScreenSize');
%         set(gcf, 'Position', [0 0 tamano_pantalla(3) tamano_pantalla(4)]);

        pause(0.01);
        if (i ~= n_frames)
            clf;
        end
    end