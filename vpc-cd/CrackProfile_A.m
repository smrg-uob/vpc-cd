function [Uy,PC,seg,cod,CrackLength,CPX,CPY ] = CrackProfile_A(D,PC_1,PC_2,SEG_1)


DDD

X1 = X;
Y1 = Y;

Uy =inpaint_nans(Uy,1);

A1 = Uy;
A1(A1==0)=nan;
A1 =inpaint_nans(A1,1);


% A2= [A1',flipud(imrotate(A1,180)')]';
% X2 =[X1',flipud(imrotate(X1,180)')]';
% Y2 =[Y1',flipud(imrotate(Y1,180)')]';

PC = phasecongmono(A1, 6,PC_1, 2, 0.55, 1.0,0.25,10,PC_2,-1);
% assignin('base', 'UYT', A1) 
% PC=(PC-min(PC(:)))/(max(PC(:))-min(PC(:)));

I = PC;
KA = A1-min(min(A1));
% KA = A2-min(min(A2));
AL = (bfilter2(double(KA)/max(max(KA)),2,   [20 0.1]));
AL(AL==1) = nan;
AL =inpaint_nans(AL,1);
figure
surf(AL)

m = edge(AL,'sobel');



[H,T,R] = hough(m);
P  = houghpeaks(H,7,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(m,T,R,P,'FillGap',5,'MinLength',10);
figure, imshow(m), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue')

theta = (atan((xy(1,2)-xy(2,2))/(xy(1,1)-xy(2,1))))*57.2957795
m = selectCc(m,[],xy_long(2,2),xy_long(2,1));



seg = region_seg(I, m, 100,SEG_1); %-- Run segmentation
% subplot(2,2,4); imshow(seg); title('Global Region-Based Segmentation');

%%%%%% Calculation of COD

% [WSTEP, ~] = Step2Nan(A1,seg);
% [X1STEP, ~] = Step2Nan(X1,seg);
% [Y1STEP, ~] = Step2Nan(Y1,seg);

WSTEP = A1;WSTEP(seg==1)=nan;
X1STEP = X1;X1STEP(seg==1)=nan;
Y1STEP = Y1;Y1STEP(seg==1)=nan;


figure
surf(WSTEP)
% figure
% surf(WSTEP)
[cod,~,~,~,CPX,CPY] = COD_YX(WSTEP, X1STEP, Y1STEP);
CPX(CPX==0)=[];
CPY(CPY==0)=[];
% length(CPX)
% length(cod)
% figure
% plot(CPX,coda)
CrackLength = abs(CPX(1)-CPX(end));


