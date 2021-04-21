% Function sem tekur inn punktagridsvektor punktar
% x0 er vinstri endapunktur grid
% y0 er neðri endapunktur grid
% L1 er hægri endapunktur grid
% L2 er efri endapunktur grids
% Lambda er lambda
% n er fjöldi dálka
% m er fjöldi raða
% h er skrefastærð

function [A,b] = generate_A_and_b(punktar, x0, y0, L1, L2, lambda, n, m, h)
    A = [];
    b = [];
    
    % Rúlla í gegnum alla punkta
    for j = 1:(n*m)
      % Ef botnpunktur
        if (j <= n)
            c = v_HZ(punktar(j,1));
        end % if

        % Ef topppunktur
      if (j >= ((m-1)*n+1))
          c = w_HZ(punktar(j,1));
      end % if

      % Ef vinstri hlið
      if (mod(j,n) == 1)
      end % if

      % Ef hægri hlið
      if (mod(j, n) == 0)
       end % if

      % Rest eru innri punktar
       % Sja nalgunarjofnu 6 her: https://notendur.hi.is/vgmp/stae401/Kafli05.html#nalgunarjafna
    end % For
end % Function
