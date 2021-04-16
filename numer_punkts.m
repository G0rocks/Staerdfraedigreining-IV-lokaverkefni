% Function sem tekur inn hnit punkts í gridinu og skilar út númeri punkts
function punktanumer = numer_punkts(i,j,n)
    % i er númer dálks, j er númer raðar og n er fjöldi punkta í hverri röð
    punktanumer = (j-1)*n + i;
end % function
