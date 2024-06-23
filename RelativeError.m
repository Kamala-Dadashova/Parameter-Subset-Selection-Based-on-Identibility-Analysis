function [Rel_error] = RelativeError(Id) %t_0 is any fixed time.

%-------------------------------Parameters--------------------------------------------------------------------------
p=parameters_human_mPBPKv2;
format short g
FR = p.FR;                              % Fraction of antibody recycled to plasma space (-) 
FR_B = p.BR_FR;                         % Fraction of antibody recycled to plasma space from brain (-)
Kdeg = p.Kdeg_IgG;                      % First order degradation rate of antibody in endosome (1/h)
Kon_FcRn = p.FcRn_Kon;                  % Association rate constant between antibody and FcRn (1/M/h)
Koff_FcRn = p.FcRn_Koff;                % Dissociation rate constant of antibody_FcRn complex (1/M/h)
Vp = p.plasma_volume;                   % Plasma Volume (L)
VTv = p.tissue_volume_vascular;         % Tissue Vascular Volume (L)
VTe = p.tissue_volume_endosomal;        % Tissue Endosomal Volume (L)
VTi = p.tissue_volume_interstitial;     % Tissue Interstitial Volume (L)
VBv = p.brain_volume_vascular;          % Brain Vascualr Volume (L)
VBe_BBB = p.brain_volume_BBB;           % Brain Endosomal Volume of BBB (L)
VBe_BCSFB = p.brain_volume_BCSFB;       % Brain Endosomal Volume of BCSFB (L)
VBi = p.brain_volume_interstitial;      % Brian Interstitial Volume (L)
VCSF = p.CSF_volume_total ;             % Brain CSF Volume (L)
VL = p.lymph_volume;                    % Lymph Volume
QT = p.tissue_flow_plasma;              % Tissue Flow (L/h)
QB = p.brain_flow_plasma;               % Brain Flow (L/h)
LT = p.tissue_flow_lymph;               % Lymph Flow from Tissues (L/h)
LB = p.brain_flow_lymph;                % Lymph Flow from Brain (L/h) * Note: LB = QB_ECF + QB_CSF
QB_ECF = p.ECF_flow_total;              % Brain Interstitial Fluid (or Extracellular Fluid) Flow (L/h)
QB_CSF = p.CSF_flow_total;              % Brain CSF Flow (L/h)
RC_Tv = p.tissue_RC_vascular;           % Tissue Vascular Reflection Coefficient (-)
RC_TL = p.tissue_RC_lymph;              % Tissue Lymphatic Reflection Coefficient (-)
RC_BBB = p.BR_BBB_RC;                   % BBB Reflection Coefficient (-)
RC_BCSFB = p.BR_BCSFB_RC;               % BBB Reflection Coefficient (-)
RC_B_ISF = p.BR_ISF_RC;                 % ISF Glymphatic Reflection Coefficient (-)
RC_B_CSF = p.BR_SAS_RC;                 % CSF Glymphatic Reflection Coefficient (-)
CLUP_T = p.kCLUP*p.tissue_volume_endosomal; % Tissue clearance uptake by the vascular endothelial cells (L/h)
CLUP_BCSFB = p.BR_kCLUP * p.brain_volume_endosomal * (1 - p.BR_BBB_BCSFB_FR);   % BCSFB clearance uptake by epithelial cells (L/h)
CLUP_BBB = p.BR_kCLUP * p.brain_volume_endosomal * p.BR_BBB_BCSFB_FR;           % BBB clearance uptake by the vascular endothelial cells (L/h)
CLUP_B = p.BR_kCLUP * p.brain_volume_endosomal; 

params=[QT LT QB LB Vp RC_Tv CLUP_T  FR VTv Kon_FcRn  Koff_FcRn  Kdeg VTe RC_TL VTi... 
    RC_BBB  QB_ECF  RC_BCSFB  QB_CSF  CLUP_B  CLUP_BBB  FR_B  CLUP_BCSFB...
    VBv  VBe_BBB  RC_B_ISF  VBi  VBe_BCSFB  RC_B_CSF  VCSF  VL ];


 

%-------------------------Generate distributions---------------------------------------------------------

%Create a vector of 1000 random values. Use the rand function to draw the values from a uniform distribution in the open interval, (a,b).
% r= (b-a).*rand(1000,1) + a on [0.9, 1.1].
rng(100)
M=1000;
eps=0.1;
param = zeros(1000, 31);
for  i=1:31
    param(:,i)=(1-eps).*params(i) + 2*eps.*params(i).*rand(M,1);
    
end


%--------------------------Initial conditions------------------------------------
DoseIVmgkg=10;
BodyWeight = 70;         
MolecularWeight= 150;       
DoseIV = BodyWeight * DoseIVmgkg / MolecularWeight * 1000;
yIV=DoseIV/Vp/(1e9);   
yinitial = zeros(16,1);
yinitial(14,1) = p.FcRn_Conc; 
yinitial(15,1) = p.FcRn_Conc; 
yinitial(16,1) = p.FcRn_Conc; 
yinitial=yinitial+[yIV; zeros(15,1)];
tf = 1000;
dt = 1;
t_vals = 0:dt:tf;
Y0=yinitial;

%---------------Solve ODE system using randomly chosen parameters----------------------------------

C_P = zeros(length(t_vals), M);
% C_T_V = zeros(M, 1);
% C_T_E_U = zeros(M, 1);
% C_T_E_B = zeros(M, 1);
% C_T_I = zeros(M, 1);
% C_B_V = zeros(M, 1);
% C_B_EBBB_U = zeros(M, 1);
% C_B_EBBB_B = zeros(M, 1);
 %C_B_I = zeros(length(t_vals), M);
% C_B_EBCSFB_U = zeros(M, 1);
% C_B_EBCSFB_B =zeros(M, 1);
 %C_B_CSF = zeros(length(t_vals), M);
% C_L = zeros(M, 1);
% C_T_FcRn_U = zeros(M, 1);
% C_B_BBB_FcRn_U =zeros(M, 1);
% C_B_BCSFB_FcRn_U = zeros(M, 1);

for i=1:M
    ode_options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
    [~,y] = ode15s(@PBPK_right_handside, t_vals, Y0, ode_options, param(i,:));
    C_P(:, i) = y(:,1);
%     C_T_V(i) = y(end,2);
%     C_T_E_U(i) = y(end,3);
%     C_T_E_B(i) = y(end,4);
%     C_T_I(i) = y(end,5);
%     C_B_V(i) = y(end,6);
%     C_B_EBBB_U(i) = y(end,7);
%     C_B_EBBB_B(i) = y(end,8);
    % C_B_I(:,i) = y(:,9);
%     C_B_EBCSFB_U(i) = y(end,10);
%     C_B_EBCSFB_B(i) = y(end,11);
      %C_B_CSF(:,i) = y(:,12);
%     C_L(i) = y(end,13);
%     C_T_FcRn_U(i) = y(end,14);
%     C_B_BBB_FcRn_U(i) = y(end,15);
%     C_B_BCSFB_FcRn_U(i) = y(end,16);
end

%---------------------Choosing Unidentifiable parameters------------------
for i=1:31
    if any(Id == i)
        continue
    else
        param(:, i) = params(i);
    end
end


%-----------------Solve ODE system using randomly chosen identifaiable---------------------
%-----------------------and fixed  unidentiable params-------------------------------------

C_P_fixed = zeros(length(t_vals), M);
% C_T_V_fixed = zeros(M, 1);
% C_T_E_U_fixed = zeros(M, 1);
% C_T_E_B_fixed = zeros(M, 1);
% C_T_I_fixed = zeros(M, 1);
% C_B_V_fixed = zeros(M, 1);
% C_B_EBBB_U_fixed = zeros(M, 1);
% C_B_EBBB_B_fixed = zeros(M, 1);
 %C_B_I_fixed = zeros(length(t_vals), M);
% C_B_EBCSFB_U_fixed = zeros(M, 1);
% C_B_EBCSFB_B_fixed =zeros(M, 1);
 %C_B_CSF_fixed = zeros(length(t_vals), M);
% C_L_fixed = zeros(M, 1);
% C_T_FcRn_U_fixed = zeros(M, 1);
% C_B_BBB_FcRn_U_fixed =zeros(M, 1);
% C_B_BCSFB_FcRn_U_fixed = zeros(M, 1);

    for i=1:M
    ode_options = odeset('RelTol',1e-10,'AbsTol',1e-10);
    [~,y] = ode15s(@PBPK_right_handside,t_vals,Y0,ode_options,param(i,:));
    C_P_fixed(:, i) = y(:, 1);
    %C_B_I_fixed(:,i)=y(:,9);
    %C_B_CSF_fixed(:,i)=y(:,12);
    end
%     C_T_V_fixed(i) = y(end,2);
%     C_T_E_U_fixed(i) = y(end,3);
%     C_T_E_B_fixed(i) = y(end,4);
%     C_T_I_fixed(i) = y(end,5);
%     C_B_V_fixed(i) = y(end,6);
%     C_B_EBBB_U_fixed(i) = y(end,7);
%     C_B_EBBB_B_fixed(i) = y(end,8);
%     C_B_I_fixed(i) = y(end,9);
%     C_B_EBCSFB_U_fixed(i) = y(end,10);
%     C_B_EBCSFB_B_fixed(i) = y(end,11);
%     C_B_CSF_fixed(i) = y(end,12);
%     C_L_fixed(i) = y(end,13);
%     C_T_FcRn_U_fixed(i) = y(end,14);
%     C_B_BBB_FcRn_U_fixed(i) = y(end,15);
%     C_B_BCSFB_FcRn_U_fixed(i) = y(end,16);

%------------------Relative error and Energy Statistics-------------------

Rel_error = zeros(length(t_vals), 1);
for i = 1:length(t_vals)
 [density_C_P, ~] = ksdensity(C_P(i, :));
 [density_C_P_fix, ~] = ksdensity(C_P_fixed(i, :));
 Rel_error(i) = norm(density_C_P_fix-density_C_P, 2)/norm(density_C_P,2);
end
end