
k=1;
j = -1;
while j<0
    if D(k,2)==D(k+1,2)
        k=k+1;  
    else
        lx=k;
        j=1;
    end
end
ly=size(D,1)/lx;
X=reshape(D(:,1),lx,ly);
Y=reshape(D(:,2),lx,ly);

Ux=reshape(D(:,3),lx,ly);
Uy=reshape(D(:,4),lx,ly);
Ux(Ux==0)=nan;
Uy(Uy==0)=nan;

