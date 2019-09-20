clear all
close all
clc

load('E:\AlTi\DVC\AlTi_Thick_Short\VPC-CD analysis\MainData.mat')
% return
%% 3D Segmentation
ittern = 500; %Number of ittetation

propagation_weight = 0.015;
GAC_weight = .02;
% g = ones(size(V)); % linear diffusion
g = ac_gradient_map(VPC,1);
delta_t = 1;
mu = 0.4;

fileHeader='B';
numZeros=5;


%% Initial condition

center = [7,180,43]; % Seeding point V16
% % Stage6-10;
margin = 1;

phi = zeros(size(VPC));
phi(center(1)-margin:center(1)+margin,...
    center(2)-margin:center(2)+margin,...
    center(3)-margin:center(3)+margin) = 1;
%% MAIN SNAKE ALGORITHM
cd('E:\SegmentationMovie\') 
figure(1);

grid minor

for i = 1:ittern %%

figure(1);

    phi = ac_hybrid_model(VPC-mu, phi-.5, propagation_weight, GAC_weight, g, ...
        delta_t, 1);
    if exist('h','var') && all(ishandle(h)), delete(h); end
    iso = isosurface(phi,0);
    h = patch(iso,'edgecolor','r','facecolor','w');  axis equal;  view(3);
    set(gcf,'name', sprintf('#iters = %d',i));
 
ylim([0 100])
xlim([0 365])
zlim([20 60])
    drawnow;
    %% Save image
    sprint_im=['%0' int2str(numZeros) 'd'];
    fileName1=[fileHeader sprintf(sprint_im,i) '.tiff'];
    print('-f1',fileName1,'-dpng')
end
