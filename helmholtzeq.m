% Fall sem tekur inn L1, L2,h og lambda og skilar Helmholtz fylkinu HZ
% 
function HZ = helmholtzeq(L1, L2, h, lambda, punktar)
  % Fjöldi bila (ATH ad fjoldi punkta = fjoldi bila + 1
  N = L1/h;
  M = L2/h;
  
  % Initialize HZ array with zeros
  HZ = zeros(M+1 , N+1);

  for i = 1:(M+1)   % Rows
    for j = 1:(N+1) % Columns
      HZ(i,j) = helmholtzNalgun(punktar, numer_punkts(i,j, N+1), 0, 0, L1, L2, lambda, N+1, M+1, h);
    end    % Column for loop
  end  % Row for loop
end % Function