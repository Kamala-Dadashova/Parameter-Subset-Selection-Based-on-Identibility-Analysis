
%
  function dy = PBPK_right_handside(t,y,params)
    C_star = 1;
   %Define all parameters in the model.
    QT = params(1);
    LT = params(2);
    QB = params(3);
    LB = params(4);
    Vp  = params(5);
    RC_Tv = params(6);
    CLUP_T = params(7);
    FR = params(8);
    VTv = params(9);
    Kon_FcRn = params(10);
    Koff_FcRn = params(11);
    Kdeg = params(12);
    VTe = params(13);
    RC_TL = params(14);
    VTi = params(15);
    RC_BBB = params(16);
    QB_ECF = params(17);
    RC_BCSFB = params(18);
    QB_CSF = params(19);
    CLUP_B = params(20);
    CLUP_BBB = params(21);
    FR_B = params(22);
    CLUP_BCSFB = params(23);
    VBv = params(24);
    VBe_BBB = params(25);
    RC_B_ISF = params(26);
    VBi = params(27);
    VBe_BCSFB = params(28);
    RC_B_CSF = params(29);
    VCSF = params(30);
    VL = params(31);
    
    
    %Define the left hand side of DE in the model.
    C_P = y(1);
    C_T_V = y(2);
    C_T_E_U = y(3);
    C_T_E_B = y(4);
    C_T_I = y(5);
    C_B_V = y(6);
    C_B_EBBB_U = y(7);
    C_B_EBBB_B = y(8);
    C_B_I = y(9);
    C_B_EBCSFB_U = y(10);
    C_B_EBCSFB_B = y(11);
    C_B_CSF = y(12);
    C_L = y(13);
    C_T_FcRn_U = y(14);
    C_B_BBB_FcRn_U = y(15);
    C_B_BCSFB_FcRn_U = y(16);
    
    
% Construct the right-hand side


 %1. Plasma
    dC_Pdt = ((QT - LT) * C_T_V + (QB - LB) * C_B_V + (LT + LB) * C_L - QT * C_P - QB * C_P) / Vp;
     
    %dC_Pdt = ((QT - LT) * C_T_V + (QB - LB) * C_B_V - QT * C_P - QB * C_P) / Vp;
% Tissue
    % 2. Vascular
    dC_T_Vdt = (QT * C_P - (QT - LT) * C_T_V - ((1-RC_Tv) * LT * C_T_V) - CLUP_T * C_T_V + CLUP_T * FR * C_T_E_B) / VTv;

    % 3. Endosomal (Unbound)
    dC_T_E_Udt = (CLUP_T * (C_T_V + C_T_I)) / VTe - Kon_FcRn * C_T_E_U * C_T_FcRn_U*C_star + Koff_FcRn * C_T_E_B - Kdeg * C_T_E_U;

    % 4. Endosomal (Bound)
    dC_T_E_Bdt = Kon_FcRn * C_T_E_U * C_T_FcRn_U*C_star - Koff_FcRn * C_T_E_B - CLUP_T * C_T_E_B / VTe;

    % 5. Interstitial
    dC_T_Idt = (((1-RC_Tv) * LT * C_T_V) - ((1-RC_TL) * LT * C_T_I) + (CLUP_T * (1-FR) * C_T_E_B) - CLUP_T * C_T_I) / VTi;

% Brain
    % 6. Vascular
    dC_B_Vdt = (QB * C_P - (QB-LB) * C_B_V - ((1-RC_BBB) * QB_ECF * C_B_V) - ((1-RC_BCSFB) * QB_CSF * C_B_V)...
            - (CLUP_B * C_B_V) + (CLUP_BBB * FR_B * C_B_EBBB_B) + (CLUP_BCSFB * FR_B * C_B_EBCSFB_B)) / VBv;

    % 7. Endosomal BBB (Unbound)
    dC_B_EBBB_Udt = ((CLUP_BBB * (C_B_V + C_B_I)) / VBe_BBB) - Kon_FcRn * C_B_EBBB_U * C_B_BBB_FcRn_U*C_star+ Koff_FcRn * C_B_EBBB_B - Kdeg * C_B_EBBB_U;

    % 8. Endosomal BBB (Bound)
    dC_B_EBBB_Bdt = Kon_FcRn * C_B_EBBB_U * C_B_BBB_FcRn_U*C_star - Koff_FcRn * C_B_EBBB_B - (CLUP_BBB * C_B_EBBB_B) / VBe_BBB;

    % 9. Interstitial (ISF)
    dC_B_Idt = (((1-RC_BBB) * QB_ECF * C_B_V) - ((1-RC_B_ISF) * QB_ECF * C_B_I) + (CLUP_BBB * (1-FR_B) * C_B_EBBB_B)...
            - (CLUP_BBB * C_B_I) - (QB_ECF * C_B_I) + (QB_ECF * C_B_CSF)) / VBi;

    % 10. Endosomal BCSFB (Unbound)
    dC_B_EBCSFB_Udt = (CLUP_BCSFB * C_B_V + CLUP_BCSFB * C_B_CSF) / VBe_BCSFB...
        - Kon_FcRn * C_B_EBCSFB_U * C_B_BCSFB_FcRn_U*C_star + Koff_FcRn * C_B_EBCSFB_B - Kdeg * C_B_EBCSFB_U;

    % 11. Endosomal BCSFB (Bound)
    dC_B_EBCSFB_Bdt = Kon_FcRn * C_B_EBCSFB_U * C_B_BCSFB_FcRn_U*C_star - (Koff_FcRn * C_B_EBCSFB_B) - ((CLUP_BCSFB * C_B_EBCSFB_B) / VBe_BCSFB);

    % 12. Cerebrospinal Fluid (CSF)
    dC_B_CSFdt = ((1-RC_BCSFB) * QB_CSF * C_B_V - (CLUP_BCSFB) * C_B_CSF + (CLUP_BCSFB) * (1 - FR_B) * C_B_EBCSFB_B...
        + QB_ECF * C_B_I - (1-RC_B_CSF) * QB_CSF * C_B_CSF - QB_ECF * C_B_CSF) / VCSF;

    % 13. Lymph Node
    dC_Ldt = ((1-RC_TL) * LT * C_T_I + (1-RC_B_CSF) * (QB_CSF) * C_B_CSF + (1-RC_B_ISF) * QB_ECF * C_B_I - (LT+LB) * C_L) / VL;

% FcRn
    % 14. FcRn Tissue (Unbound)
    dC_T_FcRn_Udt = - Kon_FcRn * C_T_E_U * C_T_FcRn_U*C_star+ Koff_FcRn * C_T_E_B + CLUP_T * C_T_E_B / VTe;

    % 15. FcRn BBB (Unbound)
    dC_B_BBB_FcRn_Udt = - Kon_FcRn * C_B_EBBB_U * C_B_BBB_FcRn_U*C_star + Koff_FcRn * C_B_EBBB_B + (CLUP_BBB * C_B_EBBB_B) / VBe_BBB;

    % 16. FcRn BCSFB (Unbound)
    dC_B_BCSFB_FcRn_Udt = - Kon_FcRn * C_B_EBCSFB_U * C_B_BCSFB_FcRn_U*C_star+ Koff_FcRn * C_B_EBCSFB_B + CLUP_BCSFB * C_B_EBCSFB_B / VBe_BCSFB;


% Create dy vector
    dy = [dC_Pdt;
    dC_T_Vdt;
    dC_T_E_Udt;
    dC_T_E_Bdt;
    dC_T_Idt;
    dC_B_Vdt;
    dC_B_EBBB_Udt;
    dC_B_EBBB_Bdt;
    dC_B_Idt;
    dC_B_EBCSFB_Udt;
    dC_B_EBCSFB_Bdt;
    dC_B_CSFdt;
    dC_Ldt;
    dC_T_FcRn_Udt;
    dC_B_BBB_FcRn_Udt;
    dC_B_BCSFB_FcRn_Udt
   ];
  end



