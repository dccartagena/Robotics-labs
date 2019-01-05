function grafeslabon(tipo)
% Ingresar 'r' para ver la gráfica del eslabon rotacional
% Ingresar 't' para ver la gráfica del eslabón translacional
%% Propiedades de movimiento
    L = 1;
    marco = 5;
    
    t_sim = 10;
    n_frame = 100;
    t = linspace(0, t_sim, n_frame);
    
    if tipo(1) == 'r'
    
    %% Creacion de un eslabon rotacional
    angulo_in = 30;
    angulo_fin = 150;
    angulo = linspace(angulo_in, angulo_fin, n_frame);
    eslabonRot1 = eslabonRot();
    eslabonRot1.setang(angulo_in);
    
    else
        
    %% Creacion de un eslabon traslacional
    eslabon_in = 0.2;
    eslabon_fin = 1.5;
    angulo = 45;
    eslabon = linspace(eslabon_in, eslabon_fin, n_frame);
    
    eslabontras1 = eslabonTrans();
    eslabontras1.setlongesl(eslabon_in);
    eslabontras1.setang(angulo);
    end
%% Representacion de movimiento
    figure;
    
    for i = 1:length(t)
%% Dibujo del triedro 
    T0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    P0 = T0(1:3, 4);
    dibujatriedro(T0);
        
%% Creación de gráfica
        hold on;
        
        plot([0 L], [0 0], 'r'); plot(L, 0, 'or');
        plot([0 0], [0 L], 'g'); plot(0, L, 'or');
%% Movimiento rotacional
        if tipo(1) == 'r'
            eslabonRot1.setang(angulo(i));

            plot(eslabonRot1.Xeje, eslabonRot1.Yeje, 'b', 'LineWidth', 3);
            plot(eslabonRot1.Xeje, eslabonRot1.Yeje, 'or');

%% Movimiento traslacional
        else
        eslabontras1.setlongesl(eslabon(i));
        
        plot(eslabontras1.Xeje_eslabon, eslabontras1.Yeje_eslabon, 'g', 'LineWidth', 3);
        plot(eslabontras1.Xeje_eslabon, eslabontras1.Yeje_eslabon, 'or');
        
        plot(eslabontras1.Xeje_base, eslabontras1.Yeje_base, 'b', 'LineWidth', 6);
        plot(eslabontras1.Xeje_base, eslabontras1.Yeje_base, 'or');
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