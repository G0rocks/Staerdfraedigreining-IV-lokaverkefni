function varmajafnvaegi2(a,b,beta1,beta2,h)
N=a/h;
M=b/h;
A=zeros(((a/h)+1)*((b/h)+1),((a/h)+1)*((b/h)+1));
b=zeros(((a/h)+1)*((b/h)+1));
M+1
N+1
for j=2:N   %innri punktar
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)-1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=4;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)+1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1 ;
        b(j+(N+1)*(k-1))=0;
    end
end
A;

for j=1:1   %vinstri
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1/2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)+1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1/2;
        b(j+(N+1)*(k-1))=0;
    end
end
A;

for j=N+1:N+1   %hægri
    for k=2:M
        A(j+(N+1)*(k-1),j+(N+1)*(k-2))=-1/2;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1)-1)=-1;
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=2;
        A(j+(N+1)*(k-1),j+(N+1)*(k))=-1/2;
        b(j+(N+1)*(k-1))=0;
    end
end

A;
x=0
for j=1:N+1   %uppi
    for k=1:1
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=1;
        b(j+(N+1)*(k-1))=psi1(a,beta1,x);
        j
        psi1(a,beta1,j)
    end
    x=x+h
end

A;
x=0
for j=1:N+1 %niðri

    for k=M+1:M+1
        A(j+(N+1)*(k-1),j+(N+1)*(k-1))=1;
        b(j+(N+1)*(k-1))= psi2(a,beta2,x);
    end
    x=x+h
end
A;
b
A_sparse=sparse(A);
c=A_sparse\b;
c=reshape(c,1,[]);
c=c(1:(N+1)*(M+1))
c=reshape(c,[N+1,M+1])
c_transp=c'


