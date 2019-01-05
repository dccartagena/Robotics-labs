%Transformada cinemática inversa para un robot de 6GDL
syms L1 L2 L3 L4 q1 q2 q3 q4 q5 q6 real %Declaración de variables

%Transformación de 0 a 1
A0_1 = [cos(q1) -sin(q1) 0 0; sin(q1) cos(q1) 0 0; 0 0 1 0; 0 0 0 1];

%Transformación de 1 a 2
A1_2 = [1 0 0 0; 0 1 0 0; 0 0 1 L1; 0 0 0 1]*...
    [1 0 0 0; 0 cos(-pi/2) -sin(-pi/2) 0; 0 -sin(-pi/2) cos(-pi/2) 0; 0 0 0 1]*...
    [cos(q2) -sin(q2) 0 0; sin(q2) cos(q2) 0 0; 0 0 1 0; 0 0 0 1];

%Transformación de 2 a 3
A2_3 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1]*...
    [cos(-q3) -sin(-q3) 0 0; sin(-q3) cos(-q3) 0 0; 0 0 1 0; 0 0 0 1];

%Transformación de 3 a 4
A3_4 = [cos(pi/2) 0 sin(pi/2) 0; 0 1 0 0; -sin(pi/2) 0 cos(pi/2) 0; 0 0 0 1]*...
    [cos(q4) -sin(q4) 0 0; sin(q4) cos(q4) 0 0; 0 0 1 0; 0 0 0 1];

%Transformación de 4 a 5
A4_5 = [1 0 0 0; 0 1 0 0; 0 0 1 L3; 0 0 0 1]*...
    [cos(-pi/2) 0 sin(-pi/2) 0; 0 1 0 0; -sin(-pi/2) 0 cos(-pi/2) 0; 0 0 0 1]*...
    [cos(q5) -sin(q5) 0 0; sin(q5) cos(q5) 0 0; 0 0 1 0; 0 0 0 1];

%Transformación de 5 a 6
A5_6 = [1 0 0 0; 0 1 0 0; 0 0 1 L4; 0 0 0 1]*...
    [cos(-pi/2) 0 sin(-pi/2) 0; 0 1 0 0; -sin(-pi/2) 0 cos(-pi/2) 0; 0 0 0 1]*...
    [cos(-pi/2) 0 sin(-pi/2) 0; 0 1 0 0; -sin(-pi/2) 0 cos(-pi/2) 0; 0 0 0 1]*...
    [cos(q6) -sin(q6) 0 0; sin(q6) cos(q6) 0 0; 0 0 1 0; 0 0 0 1];

%Matriz de transformación cinemática

T = simple(A0_1*A1_2*A2_3*A3_4*A4_5*A5_6)

%Usar el comando subs para los simbólicos

