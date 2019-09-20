function [cod,coda,X2c,Y2c,KY,KX,CPX,CPY] = COD_XY(STEP, X1STEP, Y1STEP)
[sizem, sizen] = size(STEP);
for i=1:sizen
    if isempty(find(isnan(STEP(:,i))==1, 1))==0
        PLEB = find(isnan(STEP(:,i))==1);
        UPPEROP(i) = max(PLEB);
        LOWEROP(i) = min(PLEB);
        X1n = LOWEROP(i)-1;
        X2n = UPPEROP(i)+1;
        X1na = X1n-1;
        X2na = X2n+1;
        X1nb = X1na-1;
        X2nb = X2na+1;
        codW1(i) = abs(STEP(X1n,i)-STEP(X2n,i));
        codW2(i) = abs(mean([STEP(X1n,i), STEP(X1na,i), STEP(X1nb,i)])-mean([STEP(X2n,i), STEP(X2na,i), STEP(X2nb,i)]));
        %         codW2(i) = abs(mean([STEP(i,X1na), STEP(i,X1nb)])-mean([STEP(i,X2na), STEP(i,X2nb)]));
        X1a(i) = X1STEP(X1n,i);
        X1b(i) = X1STEP(X2n,i);
        Y1a(i) = Y1STEP(X1n,i);
        Y1b(i) = Y1STEP(X2n,i);
        
        
    end
    
end

CPX = (X1a + X1b)/2;
KY = Y1a;
CPY = (Y1a + Y1b)/2;
KX = X1a;
X2c =[X1a, X1b];
Y2c =[Y1a, Y1b];
X2c(X2c==0) = [];
Y2c(Y2c==0) = [];
cod = codW1;
coda= codW2;
cod(cod==0) = [];
coda(coda==0) = [];
CPX(CPX==0) = [];
CPY(CPY==0) = [];