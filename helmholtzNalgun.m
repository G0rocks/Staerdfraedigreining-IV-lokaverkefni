% Function sem tekur inn númer punkts, j
% x0 er vinstri endapunktur grid
% y0 er neðri endapunktur grid
% L1 er hægri endapunktur grid
% L2 er efri endapunktur grids
% Lambda er lambda
% n er fjöldi dálka
% m er fjöldi raða
% h er skrefastærð

% Skilar nalgunargildinu c

function c = helmholtzNalgun(punktar, j, x0, y0, L1, L2, lambda, n, m, h);
  % Inverse quadratic interpolation
  % Hér þarf að nota mismunaaðferðina

  % Ef botnpunktur
    if (j <= n)
        c = v_HZ(punktar(j,1));
        return;
    end % if

    % Ef topppunktur
  if (j >= ((m-1)*n+1))
      c = w_HZ(punktar(j,1));
      return;
  end % if
  
  % Ef vinstri hlið
  if (mod(j,n) == 1)
      c = vinstripunktsformula;
      return;
  end % if
  
  % Ef hægri hlið
  if (mod(j, n) == 0)
    c = haegripunktsformula;
    return;
  end % if
  
  % Rest eru innri punktar
  c  = innripunktaformula; % Sja nalgunarjofnu 6 her: https://notendur.hi.is/vgmp/stae401/Kafli05.html#nalgunarjafna
  
end
