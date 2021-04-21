function varmajafnvaegi(a,b,beta1,beta2,h,psi1_local,psi2_local, figurecounter)
A=zeros(((a/h)+1)*((b/h)+1),((a/h)+1)*((b/h)+1));
b_fylki=zeros(((a/h)+1)*((b/h)+1));
X= 0:h:a;
Y= 0:h:b;
N=(a/h);
M=(b/h);
for j=2:N   %innri punktar
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)-1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=4;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)+1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1;
        b_fylki(j+(N+1)*(k-1))=0;
    end
end
A;

for j=1:1   %vinstri
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1/2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)+1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1/2;
        b_fylki(j+(N+1)*(k-1))=0;
    end
end
A;

for j=N+1:N+1   %hægri
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1/2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)-1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=2;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1/2;
        b_fylki(j+(N+1)*(k-1))=0;
    end
end

A;
x=0;
for j=1:N+1   %uppi
    for k=1:1
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=1;
        b_fylki(j+(N+1)*(k-1))=psi1_local(a,beta1,x);
    end
    x=x+h;
end

A;
x=0;
for j=1:N+1 %niðri

    for k=M+1:M+1
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=1;
        b_fylki(j+(N+1)*(k-1))= psi2_local(a,beta2,x);
    end
    x=x+h;
end
A;
b_fylki;
A_sparse=sparse(A);
c=A_sparse\b_fylki;
c=reshape(c,1,[]);
c=c(1:(N+1)*(M+1));
c=reshape(c,[N+1,M+1]);
V=c';

figure(figurecounter);
surf(X,Y,V)
%contour(X,Y,V)