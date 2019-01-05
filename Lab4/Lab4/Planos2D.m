function Planos2D()
figure; hold on;

L = 1;

plot([0 L],[0 0], 'r'); plot3([L],[0],[0], '>r');
plot([0 0],[0 L], 'g'); plot3([0],[L],[0], '>g');

marco = 5;

axis([-marco marco -marco marco]);
box on;
end