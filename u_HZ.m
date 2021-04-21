% Bein lausn af u

function u = u_HZ(x,y, lambda, L1, L2)
    u = sin(lambda*(L2-y))/sin(lambda*L2);
end