function Planos3D()
figure; hold on;

L = 1;
plot3([0 L],[0 0],[0 0], 'r'); plot3(L,0,0, '>r');
plot3([0 0],[0 L],[0 0], 'g'); plot3(0,L,0, '>g');
plot3([0 0],[0 0],[0 L], 'b'); plot3(0,0,L, '>b');

marco = 5;
axis([-marco marco -marco marco -marco marco]);
box on;

set(gca, 'CameraPosition', [75 -45 20]);
end