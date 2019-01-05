function A = DHCraig(alpha, a, d, tetha)
    A = [cos(tetha)                   -sin(tetha)                    0                  a;...
         sin(tetha)*round(cos(alpha))  cos(tetha)*round(cos(alpha)) -round(sin(alpha)) -d*round(sin(alpha));...
         sin(tetha)*round(sin(alpha))  cos(tetha)*round(sin(alpha))  round(cos(alpha))  d*round(cos(alpha));...
         0                             0                             0                  1                 ];
end