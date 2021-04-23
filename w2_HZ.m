%

function w = w2_HZ(x, u0,L1)
    w = -(u0*x/L1)*(-1+x/L1)*(-1+x/L1)*(1+x/L1);
end % function