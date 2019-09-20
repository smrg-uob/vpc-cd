clear all
close all
clc

load('C:\AlTi\Thin_Short\DVC_V32_80OVL\FC_U.mat')


% ODw = 15;
% ODt = 0.0005; WORKS!!

ODw = 15;
ODt = 0.001;



A = FC_Uz(:,70:130,:);

B = OutDel3(A,ODw,ODt);

C = inpaintn(B);
disp('It is now loaded :)')
w = waitforbuttonpress;

for i=1:50
    figure(1)
    subplot(1,3,1)
    imagesc(squeeze(A(:,i,:)))
    axis square
    
    subplot(1,3,2)
    imagesc(squeeze(B(:,i,:)))
    axis square
    
    subplot(1,3,3)
    imagesc(squeeze(C(:,i,:)))
    axis equal
    drawnow;
    pause(0.5)
    
end