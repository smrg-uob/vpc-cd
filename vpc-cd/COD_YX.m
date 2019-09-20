function [cod,coda,KY,KX,CPX,CPY] = COD_YX(STEP, X1STEP, Y1STEP)
[sizem, sizen] = size(STEP);
for i=1:sizem
    if isempty(find(isnan(STEP(i,:))==1, 1))==0
        PLEB = find(isnan(STEP(i,:))==1);
        UPPEROP(i) = max(PLEB);
        LOWEROP(i) = min(PLEB);
        X1n = LOWEROP(i)-1;
        X2n = UPPEROP(i)+1;
        X1na = X1n-1;
        X2na = X2n+1;
        X1nb = X1na-1;
        X2nb = X2na+1;
        codW1(i) = abs(STEP(i,X1n)-STEP(i,X2n));
        codW2(i) = abs(mean([STEP(i,X1n), STEP(i,X1na), STEP(i,X1nb)])-mean([STEP(i,X2n), STEP(i,X2na), STEP(i,X2nb)]));
        %         codW2(i) = abs(mean([STEP(i,X1na), STEP(i,X1nb)])-mean([STEP(i,X2na), STEP(i,X2nb)]));
        X1a(i) = X1STEP(i,X1n);
        X1b(i) = X1STEP(i,X2n);
        Y1a(i) = Y1STEP(i,X1n);
        Y1b(i) = Y1STEP(i,X2n);
        KY(i) = (X1n+X2n)/2;
        KX(i) = i;
        
        
        
        
    end
    
    
    
    
end




CPX = (X1a + X1b)/2;

CPY = (Y1a + Y1b)/2;


cod = codW1;
coda= codW2;
cod(cod==0) = [];
coda(coda==0) = [];
CPX(CPX==0) = [];
CPY(CPY==0) = [];