figurecounter=0

% Fyrri hluti - Helmholtz
% Er klárt

% lidur 2 - Prófunarkeyrsla
lambda = 1/100;
L1 = 1;
L2 = 1;
h = 1/4;
p = 1;

% handles
v_handle = @(x, u1,L1) v_HZ(x, u1,L1);
w_handle = @(x, u0,L1) w_HZ(x, u0,L1);

% Nálga helmholtz fylki
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, 0, 0);
%disp("HZ");
%disp(HZ);

HZ_lausn = [1. 1. 1. 1. 1.; .75 .75 .75 .75 .75; .50 .50 .50 .50 .50; .25 .25 .25 .25 .25; 0. 0. 0. 0. 0.];

%disp("HZ_lausn:");
%disp(HZ_lausn);

disp('Ef þetta fylki er nógu nálægt því að vera núll fylkið er helmholtz að virka');
disp(HZ_lausn-HZ);

% lidur 3 - Prófa forrit á móti beinni lausn
L1 = 1;
L2 = 2;
h = 1/20;
[X,Y] = meshgrid(0:h:L1,0:h:L2);

lambda = 1;
u_fylki = u_HZ(X,Y, lambda, L1, L2);

figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,u_fylki, 'FaceAlpha',0.7);
title(strcat('Bein lausn, Lambda = ',num2str(lambda)));

lambda = 10;
u_fylki = u_HZ(X,Y, lambda, L1, L2);

figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,u_fylki, 'FaceAlpha',0.7);
title(strcat('Bein lausn, Lambda = ',num2str(lambda)));
% Liður 4 - Teikna graf lausnar
L1 = 1;
L2 = 1;
u0 = 10;
u1 = 1;
h = 1/50;
[X,Y] = meshgrid(0:h:L1,0:h:L2);

% Handles
v_handle = @(x,u1, L1) v2_HZ(x, u1,L1);
w_handle = @(x,u0, L1) w2_HZ(x, u0,L1);

% Gera öll lambda-in
lambda = 1/100;
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, u0, u1);
figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,HZ, 'FaceAlpha',0.7);
title(strcat('Lambda = ',num2str(lambda)));

lambda = 1/10;
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, u0, u1);
figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,HZ, 'FaceAlpha',0.7);
title(strcat('Lambda = ',num2str(lambda)));

lambda = 1;
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, u0, u1);
figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,HZ, 'FaceAlpha',0.7);
title(strcat('Lambda = ',num2str(lambda)));

lambda = 10;
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, u0, u1);
figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,HZ, 'FaceAlpha',0.7);
title(strcat('Lambda = ',num2str(lambda)));

lambda = 30;
HZ = helmholtzeq(L1, L2, h, lambda, v_handle, w_handle, u0, u1);
figurecounter = figurecounter+1;
figure(figurecounter);
surf(X,Y,HZ, 'FaceAlpha',0.7);
title(strcat('Lambda = ',num2str(lambda)));

% Seinni hluti - Varmajafnvaegi

figurecounter=figurecounter+1;
%prufukeyrsla
psi1_handle = @(a,beta1,x) psi1(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2(a,beta2,x);

varmajafnvaegi(1,1,1,0,0.25, psi1_handle,psi2_handle,figurecounter)
title('Prufukeyrsla');

figurecounter=figurecounter+2;
%liður3
psi1_handle = @(a,beta1,x) psi1(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2(a,beta2,x);

varmajafnvaegi(2,1,1,2,0.02, psi1_handle,psi2_handle,figurecounter)
title('Liður 3');

figurecounter=figurecounter+2;
%liður 4
psi1_handle = @(a,beta1,x) psi1_okkar(a,beta1,x);
psi2_handle = @(a,beta2,x) psi2_okkar(a,beta2,x);

varmajafnvaegi(2,1,1,2,0.02, psi1_handle,psi2_handle,figurecounter)
title('Liður 4');
