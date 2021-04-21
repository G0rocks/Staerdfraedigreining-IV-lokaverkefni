% Fall sem tekur inn L1, L2,h og lambda og skilar Helmholtz fylkinu HZ
% 
function HZ = helmholtzeq(L1, L2, h, lambda)
  % Fjöldi bila (ATH ad fjoldi punkta = fjoldi bila + 1
  N = L1/h;
  M = L2/h;
  n = N+1; %Fjoldi punkta á ás
  m = M+1; % Fjöldi punkta á ás
  
  % Initialize HZ array with zeros
  HZ = zeros(M+1 , N+1);

  [A,b] = generate_A_and_b(0, lambda, n, m, h);
  %A_inv = inv(A);
  
  A_sparse = sparse(A);
  C = A_sparse\(b')
  %C = b.*A_inv
  
  for j = 1:m   % Rows
    for i = 1:n % Columns
      HZ(m-j+1,i) = C(numer_punkts(i,j,n))
    end    % Column for loop
  end  % Row for loop
end % Function