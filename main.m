% Fyrri hluti - Helmholtz

% lidur 2 - Prófunarkeyrsla
lambda = 1/100;
L1 = 1;
L2 = 1;
h = 1./4;
p = 1;

punktar = numera_punkta(0, 0, L1, L2, h);

% Handles fyrir v og w föll
v_handle = @v_HZ;
w_handle = @w_HZ;

% Nálga helmholtz fylki
HZ = helmholtzeq(L1, L2, h, lambda, punktar);
disp("HZ")
disp(HZ)


HZ_lausn = [1. 1. 1. 1. 1.; .75 .75 .75 .75 .75; .50 .50 .50 .50 .50; .25 .25 .25 .25 .25; 0. 0. 0. 0. 0.];

disp("HZ_lausn:");
disp(HZ_lausn);


% lidur 3 - Prófa forrit á móti beinni lausn



% Liður 4 - Teikna graf lausnar




% Seinni hluti - Varmajafnvaegi

varmajafnvaegi(1,1,1,0,0.25)