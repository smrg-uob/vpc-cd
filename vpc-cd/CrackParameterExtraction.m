function [COD_Ux, COD_Uy, COD_Ux_3P, COD_Uy_3P, CrackPath_X, CrackPath_Y, SubP_CrackPath_X, SubP_CrackPath_Y] = CrackParameterExtraction(Seg_Ux, Seg_Uy, C_X, C_Y,PC,CrackSeg, Orientation);

%% Find Crack Boundaries and Faces
[m_size, n_size] = size(Seg_Ux);
Seg_X = C_X;
Seg_X(CrackSeg==1)=nan;
Seg_Y = C_Y;
Seg_Y(CrackSeg==1)=nan;
if Orientation=='V'
    
    for i=1:m_size
        if sum(isnan(Seg_Ux(i,:)))>1
            NaNLoc = find(isnan(Seg_Ux(i,:))==1);
            UpperB(i) = max(NaNLoc);
            LowerB(i) = min(NaNLoc);
            UpperFace(i) = UpperB(i) + 1;
            LowerFace(i) = LowerB(i) - 1;
            
            UpperFace3P = [UpperFace(i) UpperFace(i)+1 UpperFace(i)+2];
            LowerFace3P = [LowerFace(i) LowerFace(i)-1 LowerFace(i)-2];
            
            %% Step 12
            
            COD_Ux(i) = abs(Seg_Ux(i,UpperFace(i))-Seg_Ux(i,LowerFace(i)));
            COD_Uy(i) = abs(Seg_Uy(i,UpperFace(i))-Seg_Uy(i,LowerFace(i)));
            COD_Ux_3P(i) = abs(mean(Seg_Ux(i,UpperFace3P))-mean(Seg_Ux(i,LowerFace3P)));
            COD_Uy_3P(i) = abs(mean(Seg_Uy(i,UpperFace3P))-mean(Seg_Uy(i,LowerFace3P)));
            
            
            
            
            CartSpaceUpperX(i) = Seg_X(i,UpperFace(i));
            CartSpaceLowerX(i) = Seg_X(i,LowerFace(i));
            CartSpaceUpperY(i) = Seg_Y(i,UpperFace(i));
            CartSpaceLowerY(i) = Seg_Y(i,LowerFace(i));
            
            
            
            
        end
    end
    %% Step 13
    % Crack Path (Mid-point)
    
    CrackPath_X = CartSpaceUpperX;
    CrackPath_Y = (CartSpaceUpperY + CartSpaceLowerY)/2;
    
    % PC-weighted mean (Sub-point CrackPath)
    ii = 0;
    for i=1:size(CrackSeg,1)
        if sum(CrackSeg(i,:)==1)>1
            ii = ii + 1;
            CP_Y = [];
            CP_Y = find(CrackSeg(i,:)==1);
            SubP_CrackPath_Y(ii) = (sum(PC(i,CP_Y).*C_Y(i,CP_Y)))./sum(PC(i,CP_Y));
        else continue
        end
    end
    SubP_CrackPath_X = CrackPath_X;
    %%
    
elseif Orientation=='H'
    for i=1:n_size
        if sum(isnan(Seg_Ux(:,i)))>1
            NaNLoc = find(isnan(Seg_Ux(:,i))==1);
            UpperB(i) = max(NaNLoc);
            LowerB(i) = min(NaNLoc);
            UpperFace(i) = UpperB(i) + 1;
            LowerFace(i) = LowerB(i) - 1;
            
            UpperFace3P(i) = [UpperFace(i) UpperFace(i)+1 UpperFace(i)+2];
            LowerFace3P(i) = [LowerFace(i) LowerFace(i)-1 LowerFace(i)-2];
            
            
            %% Step 12
            COD_Ux(i) = abs(Seg_Ux(UpperFace(i),i)-Seg_Ux(LowerFace(i),i));
            COD_Uy(i) = abs(Seg_Uy(UpperFace(i),i)-Seg_Uy(LowerFace(i),i));
            COD_Ux_3P(i) = abs(mean(Seg_Ux(UpperFace3P,i))-mean(Seg_Ux(LowerFace3P,i)));
            COD_Uy_3P(i) = abs(mean(Seg_Uy(UpperFace3P,i))-mean(Seg_Uy(LowerFace3P,i)));
            
            CartSpaceUpperX(i) = Seg_X(UpperFace(i),i);
            CartSpaceLowerX(i) = Seg_X(LowerFace(i),i);
            CartSpaceUpperY(i) = Seg_y(UpperFace(i),i);
            CartSpaceLowerY(i) = Seg_Y(LowerFace(i),i);
            
        end
    end
    %% Step 13
    % Crack Path (Mid-point)
    
    
    CrackPath_X = (CartSpaceUpperX + CartSpaceLowerX)/2;
    CrackPath_Y = CartSpaceUpperY;
    
    
    % PC-weighted mean (Sub-point CrackPath)
    ii = 0;
    for i=1:size(CrackSeg,1)
        if sum(CrackSeg(:,i)==1)>1
            ii = ii + 1;
            CP_X = [];
            CP_X = find(CrackSeg(:,i)==1);
            SubP_CrackPath_X(ii) = (sum(PC(CP_X,i).*C_X(CP_X,i)))./sum(PC(CP_X,i));
        else continue
        end
    end
    
    SubP_CrackPath_Y = CrackPath_Y;
    
end

COD_Ux(COD_Ux==0) = [];
COD_Uy(COD_Uy==0) = [];
COD_Ux_3P(COD_Ux_3P==0) = [];
COD_Uy_3P(COD_Uy_3P==0) = [];
CrackPath_X(CrackPath_X==0) = [];
CrackPath_Y(CrackPath_Y==0) = [];
SubP_CrackPath_X(SubP_CrackPath_X==0) = [];
SubP_CrackPath_Y(SubP_CrackPath_Y==0) = [];

end
