
close all
clear all
clc
fileHeader='B';
numZeros=5;
sprint_im=['%0' int2str(numZeros) 'd'];

% rec = [97    91    97   132]; %r04
% rec = [90   123   102   108]; %r01


folderName='E:\Codes\Codes_Simon\Displacement\';
for i = 90
%     [9 33 42 59 75 90]
    fileName=[fileHeader sprintf(sprint_im,i) '.txt']

%% Import displcement
Dimport{i} = [folderName fileName];
temp{i}=importdata(Dimport{i});
D= temp{i};
BC{i} = [min(D(:,1)) max(D(:,1));min(D(:,2)) max(D(:,2))];%Defines region of interest in millimeters or pixels

close all
%% Crack detection
% try
    [UyD{i} PC{i} seg{i} cod{i} CrackLength(i) CPX{i} CPY{i}] = CrackProfile_A(D,4,1.2,0.8);%Ahmet's code
    CPXtemp = CPX{i};
    CPYtemp = CPY{i};
    CT(1,i) = CPXtemp(1);
    CT(2,i) = CPYtemp(1);
    CM(1,i) = CPXtemp(end);
    CM(2,i) = CPYtemp(end);

%     CT(1,i) = 2.07372;
%     CT(2,i) = -0.39918;
%     CM(1,i) = 3.83309;
%     CM(2,i) = -0.27341;

    CrackPoints{i} = strcat('((',num2str(CT(1,i),'%.7g'),',',num2str(CT(2,i),'%.7g'),'),(',num2str(CM(1,i),'%.7g'),',',num2str(CM(2,i),'%.7g'),'))');
    
    
    % Dimport  - (string) location of Text file
    % CrackPoints - (string) crack points
    


%% 




% catch
%     UyD{i}=0;PC{i}=0;seg{i}=0;cod{i}=0;CrackLength(i)=0;CPX{i}=0;CPY{i}=0;
% end



end
% for i=13
% if ~isnan(cod{i})
% CODNOTCH(i) = cod{i}(end);
% 
% end
% 
% end

% close all