clear all
close all
clc

load('E:\AlTi\DVC\AlTi_Thick_Short\VPC-CD analysis\MainData.mat')

v1 = 0.0011; %Voxel resolution 1 voxel = XX mm


v = v1*3;%v = 0.00975; % Data point spacing in mm (Voxel size* data point spacing)


X = X*v;
Y = Y*v;
Z = Z*v;


Seg3D = zeros(size(VPC));
Seg3D(phi>0)=1; %% Logical map of segmentation


%% Uz
DispSeg = FOFC_Uz*1.1;

DispSeg(Seg3D==1)=nan;
LC = size(DispSeg,3);
for i = 1:size(DispSeg,2)

    STEP = squeeze(DispSeg(:,i,:));
%     imagesc(STEP)
%     pause(0.5)
% end

%     figure
%     surf(STEP)
  try
    [cod1,cod1a] = COD(STEP);
    cod{i} = [cod1 zeros(1,LC - length(cod1))];
    coda{i} = [cod1a zeros(1,LC - length(cod1a))];
  catch
      cod{i} = zeros(1,LC);
      coda{i} = zeros(1,LC);
  end
end

for i=1:size(cod,2)
    i
    A(i,1:LC) = cod{i};
    B(i,1:LC) = coda{i};
end
imagesc(0:v:v*size(A,2),0:v:v*size(A,1),A);
axis tight
ylabel('Y-axis (Thickness) (mm)') % x-axis label
xlabel('X-axis (Distance from notch) (mm)') % y-axis label
zlabel('COD(mm)') % y-axis label
view([0 -90])
set(gca,'FontSize',14)
% shading interp
%  set(h,'linestyle','none','facecolor',[0 .7 0]);
colorbar('eastoutside')
axis equal
grid off
grid minor

% %% Ux
% figure
% DispSeg = FOFC_Ux;
% 
% DispSeg(Seg3D==1)=nan;
% LC = size(DispSeg,3);
% for i = 1:size(DispSeg,2)
% 
%     STEP = squeeze(DispSeg(:,i,:));
% %     imagesc(STEP)
% %     pause(0.5)
% % end
% 
% %     figure
% %     surf(STEP)
%   try
%     [cod1,cod1a] = COD(STEP);
%     cod{i} = [cod1 zeros(1,LC - length(cod1))];
%     coda{i} = [cod1a zeros(1,LC - length(cod1a))];
%   catch
%       cod{i} = zeros(1,LC);
%       coda{i} = zeros(1,LC);
%   end
% end
% 
% for i=1:size(cod,2)
%     i
%     A(i,1:LC) = cod{i};
%     B(i,1:LC) = coda{i};
% end
% imagesc(A)
% axis equal
% grid minor
% %% Uy
% figure
% DispSeg = FOFC_Uy;
% 
% DispSeg(Seg3D==1)=nan;
% LC = size(DispSeg,3);
% for i = 1:size(DispSeg,2)
% 
%     STEP = squeeze(DispSeg(:,i,:));
% %     imagesc(STEP)
% %     pause(0.5)
% % end
% 
% %     figure
% %     surf(STEP)
%   try
%     [cod1,cod1a] = COD(STEP);
%     cod{i} = [cod1 zeros(1,LC - length(cod1))];
%     coda{i} = [cod1a zeros(1,LC - length(cod1a))];
%   catch
%       cod{i} = zeros(1,LC);
%       coda{i} = zeros(1,LC);
%   end
% end
% 
% for i=1:size(cod,2)
%     i
%     A(i,1:LC) = cod{i};
%     B(i,1:LC) = coda{i};
% end
% 
% imagesc(A)
% axis equal
% grid minor

