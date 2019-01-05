function [B] = traslacionX(A, d)
    trasX = [1 0 0 d; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    B = A*trasX;
end