function grafeslabon3D(p_i, p_f)
    plot3([p_i(1) p_f(1)], [p_i(2) p_f(2)], [p_i(3) p_f(3)], 'or', 'LineWidth', 4);
    line([p_i(1) p_f(1)], [p_i(2) p_f(2)], [p_i(3) p_f(3)])
return