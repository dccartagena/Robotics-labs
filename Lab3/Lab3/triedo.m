function triedo()
    
    %Generacion de la matriz noap
    n = [1 0 0]';
    o = [0 1 0]';
    a = [0 0 1]';
    p = [0 0 0]'; %Posicion del triedro
    
    %Matriz de transformacion homogenea
    T = [n o a p; zeros(1, 3) 1];
    
    %Posicion del triedro
    x = p(1); y = p(2); z = p(3);
    
    %Representacion grafica
    figure; hold on;
    
    plot3([x x+n(1)], [y y+n(2)], [z z+n(3)], 'r', 'LineWidth', [2]);
    plot3([  x+n(1)], [  y+n(2)], [  z+n(3)], 'or', 'LineWidth', [2]);
    
    plot3([x x+o(1)], [y y+o(2)], [z z+o(3)], 'g', 'LineWidth', [2]);
    plot3([  x+o(1)], [  y+o(2)], [  z+o(3)], 'or', 'LineWidth', [2]);
    
    plot3([x x+a(1)], [y y+a(2)], [z z+a(3)], 'b', 'LineWidth', [2]);
    plot3([  x+a(1)], [  y+a(2)], [  z+a(3)], 'or', 'LineWidth', [2]);
    
    plot3([x], [y], [z], 'or', 'LineWidth', [2]);
    
    marco = 5;
    
    axis([-marco marco -marco marco -marco marco]);
    box on; set(gca, 'View', [135 45]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
end