function ejercicio1()

    %% Definicion de parámetros de simulacion
    t_sim = 5;
    n_frames = 51;
    t = linspace(0, t_sim, n_frames);
    delta_t = 0.1;
    
    %% Parametros del robot
    % Longitudes de los eslabones
    L1 = 4;
    L2 = 3;
    L3 = 2;
    
    q = deg2rad([10 20 30]'); % Angulos iniciales del robot
    dX = [0.2 -0.3 -0.2]'; % Velocidades de las articulaciones
    W = [1 2 3]'; %Fuerzas y torques en el extremo
    
    Tao = zeros(3, 1); %Matriz de torquez
    
    T0 = eye(4);
    %% Variables de graficas
    points = zeros(n_frames, 3);
    plotq = zeros(n_frames, 3);
    plotdq = zeros(n_frames, 3);
    plotdX = zeros(n_frames, 3);
    plottao = zeros(n_frames, 3);
    detJ = zeros(1, n_frames);
    %figure;
    
    % Inicio de la simulación
    for i = 1:n_frames
        
        % Calculo de la transformada cinemática directa via D-H
        TA = DHCraig(0, 0,  0, q(1));
        TB = DHCraig(0, L1, 0, q(2));
        TC = DHCraig(0, L2, 0, q(3));
        
        % Calculo de la matriz de jacobianos
        J = jacobiano(L1, L2, L3, q(1), q(2), q(3));
        dq = J\dX;
        detJ(i) = det(J);
        
        % Calculo de las matrices TCD para los eslabones
        T1 = TA;
        T2 = TB*T1;
        T3 = TC*T2;
        
        % Asignacion de coordenadas a los eslabones
        P0 = T0(1:3, 4);
        P1 = T1(1:3, 4);
        P2 = T2(1:3, 4);
        P3 = T3(1:3, 4);
        
        %Visualizacion del recorrido
        points(i, :) = P3;
        
        % Calculo de torques
        tao = J'*W;
        
        % Calculo del angulo para la siguiente iteracion
        for j = 1:3
            q(j) = resolverRate(delta_t, q(j), dq(j));
        end
        
        %Graficas
        subplot(3, 3, [1 2 4 5 7 8]); hold on;
        dibujatriedro(T0); dibujatriedro(T1);
        dibujatriedro(T2); dibujatriedro(T3);
        
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2);
        grafeslabon3D(P2, P3);
        
        marco = 7.5;
        axis([-1 marco -marco marco -marco marco]);
        box on; title('grafica eslabon'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [45 225]);
        text(-6, -6, -6, ['Posicion del extremo: [' num2str(P3(1)) ', ' num2str(P3(2)) ', ' num2str(P3(3)) ']']);

        plot3(points(1:i, 1), points(1:i, 2), points(1:i, 3), 'k:');
       
        subplot(3, 3, 3); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje x'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [0 0]); 
        
        subplot(3, 3, 6); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje y'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [90 0]);
        
        subplot(3, 3, 9); hold on;
        grafeslabon3D(P0, P1); grafeslabon3D(P1, P2); grafeslabon3D(P2, P3);
        marco = 8;
        axis([-marco marco -marco marco -marco marco]);
        box on; title('Proyeccion del eje z'); xlabel('x'); ylabel('y'); zlabel('z');
        set(gca, 'View', [90 90]);
        
%         tamano_pantalla = get(0, 'ScreenSize');
%         set(gcf, 'Position', [0 0 tamano_pantalla(3) tamano_pantalla(4)]);

        plotq(i,:) = q;
        plotdq(i,:) = dq;
        plotdX(i, 1:2) = P3(1:2);
        plotdX(i, 3) = sum(q);
        plottao(i, :) = tao; 
        pause(0.1);
        if (i ~= n_frames)
            clf;
        end
        
    end
    
    figure;
    plot(t, plotq);
    title('Ángulo de articulación vs tiempo'); xlabel('tiempo en segundos'); ylabel('angulo en rad');
    legend('q1', 'q2', 'q3');
    
    figure;
    plot(t, plotdq);
    title('Velocidad angular de articulación vs tiempo'); xlabel('tiempo en segundos'); ylabel('Velocidad angular en rad/s');
    legend('dq1', 'dq2', 'dq3');
    
    figure;
    plot(t, detJ);
    title('Determinante de matriz Jacobiana vs tiempo'); xlabel('tiempo en segundos');% ylabel('Det(J)');
    legend('Det(J)');
    
    figure;
    [ax,p1,p2] = plotyy(t, plotdX(:, 1:2), t, plotdX(:, 3), 'plot', 'plot');
    title('Distancia en eje vs tiempo'); xlabel('tiempo en segundos'); ylabel(ax(1), 'distancia en metros'); ylabel(ax(2), 'angulo en rad');
    legend('X', 'Y', 'phi');

    figure;
    plot(t, plottao);
    title('Torque de articulación vs tiempo'); xlabel('tiempo en segundos'); ylabel('Torque en N.m');
    legend('tao1', 'tao2', 'tao3');
end