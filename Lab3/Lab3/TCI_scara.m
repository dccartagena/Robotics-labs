function [q1, q2, q3] = TCI_scara(xe, ye, ze, L0, L1, L2)

beta = atan(ye/xe);
r = sqrt(xe^2 + ye^2);
q2 = acos((r^2 - L1^2 - L2^2)/(2*L1*L2));
alfa = asin((L2*sin(q2))/r);
q1 = alfa + beta;
q3 = L0 - ze;