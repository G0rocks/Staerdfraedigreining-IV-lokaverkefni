figurecounter=0

% Fyrri hluti - Helmholtz

% lidur 2 - Prófunarkeyrsla
lambda = 1/100;
L1 = 1;
L2 = 1;
h = 1/4;
p = 1;

% Nálga helmholtz fylki
HZ = helmholtzeq(L1, L2, h, lambda);
disp("HZ");
disp(HZ);

HZ_lausn = [1. 1. 1. 1. 1.; .75 .75 .75 .75 .75; .50 .50 .50 .50 .50; .25 .25 .25 .25 .25; 0. 0. 0. 0. 0.];

disp("HZ_lausn:");
disp(HZ_lausn);

% lidur 3 - Prófa forrit á móti beinni lausn



% Liður 4 - Teikna graf lausnar




% Seinni hluti - Varmajafnvaegi

figurecounter=figurecounter+1;
%prufukeyrsla
psi1_handle = @(a,beta1,x) psi1(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2(a,beta2,x);

varmajafnvaegi(1,1,1,0,0.25, psi1_handle,psi2_handle,figurecounter)


figurecounter=figurecounter+1;
%liður3
psi1_handle = @(a,beta1,x) psi1(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2(a,beta2,x);

varmajafnvaegi(2,1,1,2,0.02, psi1_handle,psi2_handle,figurecounter)

figurecounter=figurecounter+1;
%liður 4
psi1_handle = @(a,beta1,x) psi1_okkar(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2_okkar(a,beta2,x);

varmajafnvaegi(2,1,1,2,0.02, psi1_handle,psi2_handle,figurecounter)
