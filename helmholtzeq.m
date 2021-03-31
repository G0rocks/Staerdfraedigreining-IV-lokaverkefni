% Fall sem tekur inn L1, L2,h og lambda og skilar Helmholtz fylkinu HZ
% 
function HZ = helmholtzeq(L1, L2, h, lambda)
  % 
  N = L1/h;
  M = L2/h;
  
  % Initialize HZ array with zeros
  HZ = zeros(M+1 , N+1)

  for i = 1:(M+1)   % Rows
    y = (i-1).*h
    for j = 1:(N+1) % Columns
      x = (j-1).*h
      HZ(i,j) = helmholtzNalgun(x,y)
    end    % Column for loop
  end  % Row for loop
end % Function