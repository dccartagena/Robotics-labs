function [B] = traslacionZ(A, d)
    trasZ = [1 0 0 d; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    B = A*trasZ;
end