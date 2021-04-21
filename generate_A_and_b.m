% Function sem tekur inn punktagridsvektor punktar
% x0 er vinstri endapunktur grid
% Lambda er lambda
% n er fjöldi dálka
% m er fjöldi raða
% h er skrefastærð

function [A,b] = generate_A_and_b(x0, lambda, n, m, h)
    P = n*m;
    A = zeros(P);
    b = zeros(1, P);
    
    % Rúlla í gegnum alla punkta
    for j = 1:m % y ás
        for i = 1:n % x ás
            numer = numer_punkts(i,j,n);
          % Ef botnpunktur
            if (j == 1)
                A(numer,numer) = 1;
                b(numer) = v_HZ(x0 + (i-1)*h);
            end % if

            % Ef topppunktur
          if (j == m)
              A(numer,numer) = 1;
              b(numer) = w_HZ(x0 + (i-1)*h);
          end % if

          % Ef vinstri hlið
          if (i == 1 && j > 1 && j < m)
            A(numer, numer)   = (4/h)-h*lambda*lambda;  % c_j
            A(numer, numer+1) = -2/h;   % c_r
            A(numer, numer_punkts(i,j-1,n)) = -1/h;   % c_s
            A(numer, numer_punkts(i,j+1,n)) = -1/h;   % c_t
            b(numer) = 0;
          end % if

          % Ef hægri hlið
          if (i == n && j > 1 && j < m)
            A(numer, numer) = (4/h-h*lambda*lambda);   % c_j
            A(numer, numer-1) = -2/h;   % c_l
            A(numer, numer_punkts(i,j-1,n)) = -1/h;   % c_s
            A(numer, numer_punkts(i,j+1,n)) = -1/h;   % c_t
            b(numer) = 0;
          end % if

          % Ef innri punktar
          if (j > 1 && j < m && i > 1 && i < n)
            h_i_minus_odru = 1/h/h;
            A(numer, numer) = (4/h/h) + q(lambda);   % c_j
            A(numer, numer-1) = -h_i_minus_odru;   % c_l
            A(numer, numer+1) = -h_i_minus_odru;   % c_r
            A(numer, numer_punkts(i,j-1,n)) = -h_i_minus_odru;   % c_s
            A(numer, numer_punkts(i,j+1,n)) = -h_i_minus_odru;   % c_t
            b(numer) = 0;
          end % if
          % Sja nalgunarjofnu 6 her: https://notendur.hi.is/vgmp/stae401/Kafli05.html#nalgunarjafna
        end % For
    end % For
end % Function
