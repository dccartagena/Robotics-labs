function TCD_antrop
    t_sim = 4;
    n_frames = 100;
    t = linspace(0, t_sim, n_frames);
    
    q1i = 0; q1f = 90;
    q1 = linspace(q1i, q1f, n_frames);
    
    q2i = 0; q2f = 90;
    q2 = linspace(q2i, q2f, n_frames);
    
    q3i = -90; q3f = 90;
    q3 = linspace(q3i, q3f, n_frames);
    
    q4i = 0; q4f = 90;
    q4 = linspace(q4i, q4f, n_frames);
    
    
    figure;
    for i = 1:n_frames
        T0 = [1 0 0 0
              0 1 0 0
              0 0 1 0
              0 0 0 1];
        P0 = T0(1:3, 4);
        
%         L0 = 2;
%         Tba = traslacionZ(T0, L0);
        TB = rotacionZ(T0, q1(i));
        PB = TB(1:3, 4);
        
        L1 = 4;
        T1a = traslacionZ(TB, L1);
        T1b = rotacionZ(T1a, 90);
        T1c = rotacionX(T1b, 90);
        T1d = rotacionZ(T1c, q2(i));
        P1 = T1d(1:3, 4);
        
        L2 = 1;
        T2a = traslacionY(T1d, L2);
        T2b = rotacionZ(T2a, q3(i));
        P2 = T2b(1:3, 4);
        
        L3 = -1;
        L4 = 5;
        T3a = traslacionZ(T2b, L3);
        T3b = traslacionX(T3a, L4);
        T3c = rotacionZ(T3b, q4(i));
        P3 = T3c(1:3, 4);
        
        subplot(3, 3, [1 2 4 5 7 8]); hold on;
        dibujatriedro(T0); dibujatriedro(TB);
        dibujatriedro(T1d); dibujatriedro(T2b);
        dibujatriedro(T3c);
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