% v function

function v = v_HZ(x, u1,L1)
  if (x >= 0 && x <= 1)
    v = 0;
    return;
  end % if
  
  v = NaN;
  disp(strcat("v_HZ Error: Can not compute v with x = ", num2str(x)));
end   % Function
