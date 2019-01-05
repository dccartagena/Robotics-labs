%Triedro de referencia
L = 1;
%eslabon rotacional 1
L1 = 2;
% tetha1i = deg2rad(0); tetha1f = deg2rad(60); 
% tetha1 = linspace(tetha1i, tetha1f, n_frames);

%eslabon rotacional 2
L2 = 1.5;
% tetha2i = deg2rad(0); tetha2f = deg2rad(60); 
% tetha2 = linspace(tetha2i, tetha2f, n_frames);

n_frames = 100;
%% Trayectoria cuadrado
% %tramo1
% xei = 1; xef = 2;
% xe = linspace(xei, xef, n_frames);
% 
% yei = 1; yef = 1;
% ye = linspace(yei, yef, n_frames);
% 
% %tramo2
% xei = 2; xef = 2;
% xe = [xe linspace(xei, xef, n_frames)];
% 
% yei = 1; yef = 2;
% ye = [ye linspace(yei, yef, n_frames)];
% 
% %tramo3
% xei = 2; xef = 1;
% xe = [xe linspace(xei, xef, n_frames)];
% 
% yei = 2; yef = 2;
% ye = [ye linspace(yei, yef, n_frames)];
% 
% %tramo4
% xei = 1; xef = 1;
% xe = [xe linspace(xei, xef, n_frames)];
% 
% yei = 2; yef = 1;
% ye = [ye linspace(yei, yef, n_frames)];

%% Trayectoria circular
R = 1.5;
N = n_frames;
xe = zeros(1, N); ye = zeros(1, N);
j = 1;

theta = 0:0.01:2*pi;
xe = 1.3 + 1 * cos(theta);
ye = 1.3 + 1 * sin(theta);

L = 1;
t_sim = 20;
n_frames = length(ye);
t = linspace(0, t_sim, n_frames);

%posicion
posicion = [1 0];
x0 = posicion(1);
y0 = posicion(2);

%animacion
figure;

for i=1:length(t)
    hold on;
    
    [tetha1, tetha2] = TCI(xe(i), ye(i), L1, L2);
    
    plot([0 L], [0 0], 'r'); plot([L], [0], '>r');
    plot([0 0], [0 L], 'g'); plot([0], [L], '^g');
    
    x1(i) = x0 + L1*cos(tetha1);
    y1(i) = y0 + L1*sin(tetha1);
    
    x2(i) = x1(i) + L2*cos(tetha1 + tetha2);
    y2(i) = y1(i) + L2*sin(tetha1 + tetha2);
    
    plot([x0    x1(i)], [y0    y1(i)], 'b', 'LineWidth', 3);
    plot([x0    x1(i)], [y0    y1(i)], 'ro');
    plot([x1(i) x2(i)], [y1(i) y2(i)], 'b', 'LineWidth', 3);
    plot([x1(i) x2(i)], [y1(i) y2(i)], 'ro');
    
    plot(x2(1:i), y2(1:i), 'k:');
    
    marco = 5;
    axis([-marco marco -marco marco]);
    box on;
    title(['t=' num2str(t(i))]);
    pause(0.01);
    if (i ~= n_frames)
        clf;
    end
    axis('square');
end
        
    


