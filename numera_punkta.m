% Fall sem skilar vigri með hnitum á punktum sem maður fær ef maður gefur
% þeim vigri númer punkts.

function punktar = numera_punkta(x0, y0, L1, L2, h)
    n = L1/h+1;
    m = L2/h+1;      % Vantar kóða sem dílar við þegar h gengur ekki upp í L1 eða L2

    punktar = zeros(1, 2);
    for j = 1:m % Raðir
        y = y0 + (j-1).*h;
        for i = 1:n % Dálkar
            x = x0 + (i-1)*h;
            numer_punkts = (j-1)*n + i;
            punktar(numer_punkts,1) = x;
            punktar(numer_punkts,2) = y;
            x = x+h;
        end % For dálkar
    end % For raðir
end % Function