%

function v = v2_HZ(x, u1,L1)
    v = (u1*x/L1)*(1-x/L1)*(1+x/L1)*(1+x/L1);
end % function