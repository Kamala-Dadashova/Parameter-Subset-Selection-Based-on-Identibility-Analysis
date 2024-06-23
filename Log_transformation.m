% 
%PBPK_model.
clear 
close all
format long
%Access previous code.
% global p %to access previous code
p = parameters_human_mPBPKv2;
%Define parameters in the model.
%Note that all CLUP values either involve kCLUP or BR_kCLUP.
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
%%RC_BBB =0.99;
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

param_names = ["Q_{T}" "L_{T}" "Q_{B}" "L_{B}" "V_{P}" "\sigma_{T_{V}}" "CLUP_{T}" "FR" "V_{T_{V}}" "kon_{FcRn}" "koff_{FcRn}" "k_{deg}" "V_{T_{E}}" "\sigma_{T_{L}}" "V_{T_{I}}"...
        "\sigma_{BBB}" "Q_{B_{ECF}}" "\sigma_{BCSFB}" "Q_{B_{CSF}}" "CLUP_{B}" "CLUP_{BBB}" "FR_{B}" "CLUP_{BCSFB}"...
        "V_{B_{V}}" "V_{B_{EBBB}}" "\sigma_{B_{ISF}}" "V_{B_{I}}" "V_{B_{EBCSFB}}" "\sigma_{B_{CSF}}" "V_{CSF}" "V_{L}"];
idxparam = containers.Map(1:31,param_names);
y_names = ["CP" "CTV" "CTEU" "CTEB" "CTI" "CBV" "CB_{EBBB_U}" "CB_{EBBB_B}" "CBI"...
    "CB_{EBCSFB_U}" "CB_{EBCSFB_B}" "CB_CSF" "C_L" "CT_{FcRn_U}" "CB_{BBB_FcRn_U}" "CB_{BCSFB_{FcRn_U}}"];
idxy = containers.Map(1:16,y_names);
%Set initial conditions.
DoseIVmgkg=10;
BodyWeight = 70;             % Body Weight (kg)
MolecularWeight= 150;        % Molecular Weight (kDa)
DoseIV = BodyWeight * DoseIVmgkg / MolecularWeight * 1000;
yIV=DoseIV/Vp/(1e9);          %(Convert amount initial condition(nmol) to Conc (M))   
yinitial = zeros(512,1);
yinitial(14,1) = p.FcRn_Conc; % Tissue
yinitial(15,1) = p.FcRn_Conc; % BBB
yinitial(16,1) = p.FcRn_Conc; % BCSFB
yinitial=yinitial+[yIV; zeros(511,1)];
tf = 1000;
dt = 1;
t_vals = 0:dt:tf;
t_length = length(t_vals);
C_star=1;
Y0=yinitial./C_star;


%Solve ode equations and sensitivity equations.
ode_options = odeset('RelTol',1e-10,'AbsTol',1e-10);
[t, Y_sen] = ode15s(@PBPK31_right_handside_sen,t_vals,Y0,ode_options,params);
%Y_sen=Y_sen*C_star;
%[Y]_{t_length x 512}
% 1 - 16 outputs, 17-32 sensitivities w.r.t first param,... 497-512
% sensitivities w.r.t last param

% Plot concentrations
% k = 1;
% numberFigures = 16;
% numberTiles   = 2; % 2x2
% fig_handles = zeros(numberFigures,1);
% for i = 1:16
%     if mod(i,4) == 1
%         fig_handles(i) = figure;
%         tiles = tiledlayout(numberTiles,numberTiles);
%     end
%     nexttile
%     semilogy(t, abs(Y_sen(:, i)) ,'-b','linewidth',1.5)
%     set(gca,'FontSize',14) 
%     xlabel('Time')
%     ylabel(idxy(i))
%     if mod(i,4) == 0
%      exportgraphics(tiles,'Solution_of_the_model.pdf','Append',true, 'Resolution',400)
%     end
% end



% figure(1)
% plot(t, Y_sen(:, k),'-b','linewidth',3)
% set(gca,'Fontsize', 22);
% xlabel('Time')
% ylabel(idxy(k))


%Complex-step approximations to find sensitivities.
clear Y0
h = 1e-16;
yIV=DoseIV/Vp/(1e9);
Y0 = zeros(16,1);
Y0(14,1) = p.FcRn_Conc; 
Y0(15,1) = p.FcRn_Conc; 
Y0(16,1) = p.FcRn_Conc;
Y0=(Y0+[yIV; zeros(15,1)]);
Y_complex = zeros(t_length,16*31);
for i = 1:31
    new_param = params;
    new_param(i) = complex(params(i), h);
    [~, Y] = ode15s(@PBPK_right_handside,t_vals,Y0,ode_options,new_param);
    Y_complex(:,((i-1)*16+1):i*16) = imag(Y)./h;
end
% 1-16 sensitivities w.r.t first param,... 480-496
% sensitivities w.r.t last param

% Find the sensitivy graph of the specific output w.r.t. all params
k = 1; % index of the output
% numberFigures = 31;
% numberTiles   = 2; % 2x2
% fig_handles = zeros(numberFigures,1);
% 
% for i=1:31
%     if mod(i,4) == 1
%         fig_handles(i) = figure;
%         tiles = tiledlayout(numberTiles,numberTiles);
%     end
%     nexttile
%     plot(t, Y_sen(:, 16*i +k)*params(i) ,'-b',t, (Y_complex(:,16*(i-1) + k)*params(i)),'--r','linewidth',3)
%     set(gca,'FontSize',23) 
%     xlabel('Time')
%     ylabel(idxy(k)+ "_{" + idxparam(i)+"}")
% %     if mod(i,4) == 0 || i==31
% %      exportgraphics(tiles,'Sensitivity_plots_1.pdf','Append',true, 'Resolution',300)
% %     end
% 
% end

%Find the sensitivy graph of the all output w.r.t specific params
% l = 1; % index of the parameter
% numberFigures = 16;
% numberTiles   = 2; % 2x2
% fig_handles = zeros(numberFigures,1);
% for i = 1:16
%     if mod(i,4) == 1
%         fig_handles(i) = figure;
%         tiles = tiledlayout(numberTiles,numberTiles);
%     end
%     nexttile
%     semilogy(t, abs(Y_sen(:,16*l +i)*params(l)) ,'-b',t, abs(Y_complex(:,16*(l-1) +i)*params(l)),'--r','linewidth',3)
%     set(gca,'FontSize',23) 
%     xlabel('Time')
%     ylabel(idxy(i)+ "_{" + idxparam(l)+"}")
%     if mod(i,4) == 0
%      exportgraphics(tiles,'Sensitivity_plots_2.pdf','Append',true, 'Resolution',300)
%     end
% end

%Sensitivity matrix
S1 = zeros(t_length, 31); 
k=1; % index of the output

for i=1:31
    S1(:,i) = Y_complex(:, 16*(i-1) + k)*params(i);
   %S1(:,i) = Y_complex(t_0:t_1, 16*(i-1) + k)*params(i);
end


% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,1e-7, 1e-2)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy, (1e-8)/2,1e-7)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,1e-10,(1e-8)/2)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,0,1e-10)
% 

% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,(1e-8), 1)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,(1e-9)/1.3,(1e-8))
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,(1e-10)*1.5,(1e-9)/1.3)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,0,(1e-10)*1.5)

% 
% % plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,1e-7, 1e-2)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy, (1e-9)/1.5,1e-8)
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,(1e-10)*1.2,(1e-9/1.5))
% plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,0,(1e-10)*1.2)
% 

%Run PSS algorithms
 eta=1e-12;
%[Id_svd, UnId1_svd] = PSS_SVD_onedec(S1,eta);
[Id1, UnId]= PSS_SVD(S1,eta);
%[Rel_error] = metrics(Id1);

%Convert index to parameter names. 
for i=1:length(Id1)
    idxparam(Id1(i))
end

