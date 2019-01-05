function dibujatriedro(M)
    
    n = M(1:3,1); o = M(1:3,2); a = M(1:3,3);
    p = M(1:3,4); x = p(1); y = p(2); z = p(3);
    
    plot3([x x+n(1)], [y y+n(2)], [z z+n(3)], 'r', 'LineWidth', [2]);
    plot3([  x+n(1)], [  y+n(2)], [  z+n(3)], 'or', 'LineWidth', [2]);
    
    plot3([x x+o(1)], [y y+o(2)], [z z+o(3)], 'b', 'LineWidth', [2]);
    plot3([  x+o(1)], [  y+o(2)], [  z+o(3)], 'or', 'LineWidth', [2]);
    
    plot3([x x+a(1)], [y y+a(2)], [z z+a(3)], 'g', 'LineWidth', [2]);
    plot3([  x+a(1)], [  y+a(2)], [  z+a(3)], 'or', 'LineWidth', [2]);
    
    plot3([x], [y], [z], 'or', 'LineWidth', [2]);
    
    
end