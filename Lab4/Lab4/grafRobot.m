function grafRobot()
% Por el momento la funcion solo puede ser modificada desde el código
% En la construcción del robot, ingresar tantos eslabones como se deseen
% eslabonRot(angulo inicial, longitud, [0 0]), para crear un eslabon
% rotacional
% eslabonTrans(angulo inicial, longitud de base, longitud eslabon inicial, [0 0])
% Por defecto la posición del primer eslabon es [0 0], no es necesario
% ingresar las otras, puesto que estas se actualizan
%% Propiedades de movimiento
    L = 1;
    marco = 5;
    
    t_sim = 10;
    n_frame = 100;
    t = linspace(0, t_sim, n_frame);
    
%% Parametros de ejercicio 1
%     mov_in = [0 0]; %Vector de posición inicial del robot
%     vel = [0.4 -4.8]; %Vector de velocidad inical del robot, tener en cuenta el tipo de eslabon
%     acel = [1.2 5]; %Vector de aceleraciones inical del robot, tener en cuenta el tipo de eslabon

%% Parametros de ejercio 2
%     mov_in = [0 0]; %Vector de posición inicial del robot
%     vel = [3 0.05]; %[0.5 5e-3]; %Vector de velocidad inical del robot, tener en cuenta el tipo de eslabon
%     acel = [0 0]; %[1.5 1.5e-2]; %Vector de aceleraciones inical del robot, tener en cuenta el tipo de eslabon
    
%% Creación del Robot 4 GDL
    %Trayectoria de cada eslabon, tener en cuenta si es rotacional o
    %translacional
    mov_in = [0 0 0 0]; %Vector de posición inicial del robot
    vel = [0.4 0.7 0.5 5e-3]; %Vector de velocidad inical del robot, tener en cuenta el tipo de eslabon
    acel = [1.0 2.0 1.5 1.5e-2]; %Vector de aceleraciones inical del robot, tener en cuenta el tipo de eslabon

    mov = zeros(length(mov_in), n_frame);
    
    %Creacion del robot
    %Ro = Robot(eslabonRot(mov_in(1), 1, [0 0]), eslabonRot(mov_in(2), 1, [0 0])); %Ejercicio 1
    %Ro = Robot(eslabonTrans(mov_in(1), 1, mov_in(2), [0 0])); %Ejercicio 2
    Ro = Robot(eslabonRot(mov_in(1), 1, [0 0]), eslabonRot(mov_in(2), 1, [0 0]),...
        eslabonTrans(mov_in(3), 1, mov_in(4), [0 0])); %Robot 4 GDL

%% Definicion de trayectorias
% Movimiento uniformemente acelerado
    for i=1:Ro.Nart
        if (strcmp(Ro.eslabones{i}.tipo, 'rotacional'))
            for j=1:n_frame
                mov(i,j) = mov_in(i) + vel(i)*t(j) + 0.5*acel(i)*(t(j))^2; %Parametro para generar trayectoria
            end
        else
            for j=1:n_frame
                mov(i,j) = mov_in(i) + vel(i)*t(j) + 0.5*acel(i)*(t(j))^2; %Parametro para generar trayectoria
                mov(i+1,j) = mov_in(i + 1) + vel(i + 1)*t(j) + 0.5*acel(i + 1)*(t(j))^2; %Parametro para generar trayectoria
            end
        end
    end
    %% Representacion de movimiento
    figure;
    
    for i = 1:length(t)
%% Creación de gráfica
        hold on;
        
        plot([0 L], [0 0], 'r'); plot(L, 0, 'or');
        plot([0 0], [0 L], 'g'); plot(0, L, 'or');
        
%% Movimiento del Robot
        for j = 1: Ro.Nart
            Ro.robotUP(mov(:, i));
            if (strcmp(Ro.eslabones{j}.tipo, 'rotacional'))
                
                % Dibujo del eslabon rotacional
                plot(Ro.eslabones{j}.Xeje, Ro.eslabones{j}.Yeje, 'b', 'LineWidth', 3);
                plot(Ro.eslabones{j}.Xeje, Ro.eslabones{j}.Yeje, 'or');
            else
                
                %Dibujo del eslabon traslacional
                plot(Ro.eslabones{j}.Xeje_eslabon, Ro.eslabones{j}.Yeje_eslabon, 'g', 'LineWidth', 3);
                plot(Ro.eslabones{j}.Xeje_eslabon, Ro.eslabones{j}.Yeje_eslabon, 'or');
                
                plot(Ro.eslabones{j}.Xeje_base, Ro.eslabones{j}.Yeje_base, 'r', 'LineWidth', 5);
                plot(Ro.eslabones{j}.Xeje_base, Ro.eslabones{j}.Yeje_base, 'or');
            end
        end
        
%% Propiedades de grafica
        axis([-marco marco -marco marco]);
        box on;
        title(['t= ' num2str(t(i))]);
        pause(0.01);
        
        if (i~=length(t))
            clf
        end
    end
end