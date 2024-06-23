
%
  function dy = PBPK31_right_handside_sen(t,y,params)
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
    C_P_QT = y(17);
    C_T_V_QT = y(18);
    C_T_E_U_QT = y(19);
    C_T_E_B_QT = y(20);
    C_T_I_QT = y(21);
    C_B_V_QT = y(22);
    C_B_EBBB_U_QT = y(23);
    C_B_EBBB_B_QT = y(24);
    C_B_I_QT = y(25);
    C_B_EBCSFB_U_QT= y(26);
    C_B_EBCSFB_B_QT = y(27);
    C_B_CSF_QT = y(28);
    C_L_QT = y(29);
    C_T_FcRn_U_QT = y(30);
    C_B_BBB_FcRn_U_QT = y(31);
    C_B_BCSFB_FcRn_U_QT = y(32);
    C_P_LT = y(33);
    C_T_V_LT = y(34);
    C_T_E_U_LT = y(35);
    C_T_E_B_LT = y(36);
    C_T_I_LT = y(37);
    C_B_V_LT = y(38);
    C_B_EBBB_U_LT = y(39);
    C_B_EBBB_B_LT = y(40);
    C_B_I_LT = y(41);
    C_B_EBCSFB_U_LT= y(42);
    C_B_EBCSFB_B_LT = y(43);
    C_B_CSF_LT = y(44);
    C_L_LT = y(45);
    C_T_FcRn_U_LT = y(46);
    C_B_BBB_FcRn_U_LT = y(47);
    C_B_BCSFB_FcRn_U_LT = y(48);
    C_P_QB = y(49);
    C_T_V_QB = y(50);
    C_T_E_U_QB = y(51);
    C_T_E_B_QB = y(52);
    C_T_I_QB = y(53);
    C_B_V_QB = y(54);
    C_B_EBBB_U_QB = y(55);
    C_B_EBBB_B_QB = y(56);
    C_B_I_QB = y(57);
    C_B_EBCSFB_U_QB= y(58);
    C_B_EBCSFB_B_QB = y(59);
    C_B_CSF_QB = y(60);
    C_L_QB = y(61);
    C_T_FcRn_U_QB = y(62);
    C_B_BBB_FcRn_U_QB = y(63);
    C_B_BCSFB_FcRn_U_QB = y(64);
    C_P_LB = y(65);
    C_T_V_LB = y(66);
    C_T_E_U_LB = y(67);
    C_T_E_B_LB = y(68);
    C_T_I_LB = y(69);
    C_B_V_LB = y(70);
    C_B_EBBB_U_LB = y(71);
    C_B_EBBB_B_LB = y(72);
    C_B_I_LB = y(73);
    C_B_EBCSFB_U_LB= y(74);
    C_B_EBCSFB_B_LB = y(75);
    C_B_CSF_LB = y(76);
    C_L_LB = y(77);
    C_T_FcRn_U_LB = y(78);
    C_B_BBB_FcRn_U_LB = y(79);
    C_B_BCSFB_FcRn_U_LB = y(80);
    C_P_Vp = y(81);
    C_T_V_Vp = y(82);
    C_T_E_U_Vp = y(83);
    C_T_E_B_Vp = y(84);
    C_T_I_Vp = y(85);
    C_B_V_Vp = y(86);
    C_B_EBBB_U_Vp = y(87);
    C_B_EBBB_B_Vp = y(88);
    C_B_I_Vp = y(89);
    C_B_EBCSFB_U_Vp= y(90);
    C_B_EBCSFB_B_Vp = y(91);
    C_B_CSF_Vp = y(92);
    C_L_Vp = y(93);
    C_T_FcRn_U_Vp = y(94);
    C_B_BBB_FcRn_U_Vp = y(95);
    C_B_BCSFB_FcRn_U_Vp = y(96);
    C_P_RC_Tv = y(97);
    C_T_V_RC_Tv = y(98);
    C_T_E_U_RC_Tv = y(99);
    C_T_E_B_RC_Tv = y(100);
    C_T_I_RC_Tv = y(101);
    C_B_V_RC_Tv = y(102);
    C_B_EBBB_U_RC_Tv = y(103);
    C_B_EBBB_B_RC_Tv = y(104);
    C_B_I_RC_Tv = y(105);
    C_B_EBCSFB_U_RC_Tv= y(106);
    C_B_EBCSFB_B_RC_Tv = y(107);
    C_B_CSF_RC_Tv = y(108);
    C_L_RC_Tv = y(109);
    C_T_FcRn_U_RC_Tv = y(110);
    C_B_BBB_FcRn_U_RC_Tv = y(111);
    C_B_BCSFB_FcRn_U_RC_Tv = y(112);
    C_P_CLUP_T = y(113);
    C_T_V_CLUP_T = y(114);
    C_T_E_U_CLUP_T = y(115);
    C_T_E_B_CLUP_T = y(116);
    C_T_I_CLUP_T = y(117);
    C_B_V_CLUP_T = y(118);
    C_B_EBBB_U_CLUP_T = y(119);
    C_B_EBBB_B_CLUP_T = y(120);
    C_B_I_CLUP_T = y(121);
    C_B_EBCSFB_U_CLUP_T= y(122);
    C_B_EBCSFB_B_CLUP_T = y(123);
    C_B_CSF_CLUP_T = y(124);
    C_L_CLUP_T = y(125);
    C_T_FcRn_U_CLUP_T = y(126);
    C_B_BBB_FcRn_U_CLUP_T = y(127);
    C_B_BCSFB_FcRn_U_CLUP_T = y(128);
    C_P_FR = y(129);
    C_T_V_FR = y(130);
    C_T_E_U_FR = y(131);
    C_T_E_B_FR = y(132);
    C_T_I_FR = y(133);
    C_B_V_FR = y(134);
    C_B_EBBB_U_FR = y(135);
    C_B_EBBB_B_FR = y(136);
    C_B_I_FR = y(137);
    C_B_EBCSFB_U_FR= y(138);
    C_B_EBCSFB_B_FR = y(139);
    C_B_CSF_FR = y(140);
    C_L_FR = y(141);
    C_T_FcRn_U_FR = y(142);
    C_B_BBB_FcRn_U_FR = y(143);
    C_B_BCSFB_FcRn_U_FR = y(144);
    C_P_VTv = y(145);
    C_T_V_VTv = y(146);
    C_T_E_U_VTv = y(147);
    C_T_E_B_VTv = y(148);
    C_T_I_VTv = y(149);
    C_B_V_VTv = y(150);
    C_B_EBBB_U_VTv = y(151);
    C_B_EBBB_B_VTv = y(152);
    C_B_I_VTv = y(153);
    C_B_EBCSFB_U_VTv= y(154);
    C_B_EBCSFB_B_VTv = y(155);
    C_B_CSF_VTv = y(156);
    C_L_VTv = y(157);
    C_T_FcRn_U_VTv = y(158);
    C_B_BBB_FcRn_U_VTv = y(159);
    C_B_BCSFB_FcRn_U_VTv = y(160);  
    C_P_Kon_FcRn = y(161);
    C_T_V_Kon_FcRn = y(162);
    C_T_E_U_Kon_FcRn = y(163);
    C_T_E_B_Kon_FcRn = y(164);
    C_T_I_Kon_FcRn = y(165);
    C_B_V_Kon_FcRn = y(166);
    C_B_EBBB_U_Kon_FcRn = y(167);
    C_B_EBBB_B_Kon_FcRn = y(168);
    C_B_I_Kon_FcRn = y(169);
    C_B_EBCSFB_U_Kon_FcRn= y(170);
    C_B_EBCSFB_B_Kon_FcRn = y(171);
    C_B_CSF_Kon_FcRn = y(172);
    C_L_Kon_FcRn = y(173);
    C_T_FcRn_U_Kon_FcRn = y(174);
    C_B_BBB_FcRn_U_Kon_FcRn = y(175);
    C_B_BCSFB_FcRn_U_Kon_FcRn = y(176);     
    C_P_Koff_FcRn = y(177);
    C_T_V_Koff_FcRn = y(178);
    C_T_E_U_Koff_FcRn = y(179);
    C_T_E_B_Koff_FcRn = y(180);
    C_T_I_Koff_FcRn = y(181);
    C_B_V_Koff_FcRn = y(182);
    C_B_EBBB_U_Koff_FcRn = y(183);
    C_B_EBBB_B_Koff_FcRn = y(184);
    C_B_I_Koff_FcRn = y(185);
    C_B_EBCSFB_U_Koff_FcRn= y(186);
    C_B_EBCSFB_B_Koff_FcRn = y(187);
    C_B_CSF_Koff_FcRn = y(188);
    C_L_Koff_FcRn = y(189);
    C_T_FcRn_U_Koff_FcRn = y(190);
    C_B_BBB_FcRn_U_Koff_FcRn = y(191);
    C_B_BCSFB_FcRn_U_Koff_FcRn = y(192);
    C_P_Kdeg = y(193);
    C_T_V_Kdeg = y(194);
    C_T_E_U_Kdeg = y(195);
    C_T_E_B_Kdeg = y(196);
    C_T_I_Kdeg = y(197);
    C_B_V_Kdeg = y(198);
    C_B_EBBB_U_Kdeg = y(199);
    C_B_EBBB_B_Kdeg = y(200);
    C_B_I_Kdeg = y(201);
    C_B_EBCSFB_U_Kdeg= y(202);
    C_B_EBCSFB_B_Kdeg = y(203);
    C_B_CSF_Kdeg = y(204);
    C_L_Kdeg = y(205);
    C_T_FcRn_U_Kdeg = y(206);
    C_B_BBB_FcRn_U_Kdeg = y(207);
    C_B_BCSFB_FcRn_U_Kdeg = y(208);
    C_P_VTe = y(209);
    C_T_V_VTe = y(210);
    C_T_E_U_VTe = y(211);
    C_T_E_B_VTe = y(212);
    C_T_I_VTe = y(213);
    C_B_V_VTe = y(214);
    C_B_EBBB_U_VTe = y(215);
    C_B_EBBB_B_VTe = y(216);
    C_B_I_VTe = y(217);
    C_B_EBCSFB_U_VTe= y(218);
    C_B_EBCSFB_B_VTe = y(219);
    C_B_CSF_VTe = y(220);
    C_L_VTe = y(221);
    C_T_FcRn_U_VTe = y(222);
    C_B_BBB_FcRn_U_VTe = y(223);
    C_B_BCSFB_FcRn_U_VTe = y(224);
    C_P_RC_TL = y(225);
    C_T_V_RC_TL = y(226);
    C_T_E_U_RC_TL = y(227);
    C_T_E_B_RC_TL = y(228);
    C_T_I_RC_TL = y(229);
    C_B_V_RC_TL = y(230);
    C_B_EBBB_U_RC_TL = y(231);
    C_B_EBBB_B_RC_TL = y(232);
    C_B_I_RC_TL = y(233);
    C_B_EBCSFB_U_RC_TL= y(234);
    C_B_EBCSFB_B_RC_TL = y(235);
    C_B_CSF_RC_TL = y(236);
    C_L_RC_TL = y(237);
    C_T_FcRn_U_RC_TL = y(238);
    C_B_BBB_FcRn_U_RC_TL = y(239);
    C_B_BCSFB_FcRn_U_RC_TL = y(240);
    C_P_VTi = y(241);
    C_T_V_VTi = y(242);
    C_T_E_U_VTi = y(243);
    C_T_E_B_VTi = y(244);
    C_T_I_VTi = y(245);
    C_B_V_VTi = y(246);
    C_B_EBBB_U_VTi = y(247);
    C_B_EBBB_B_VTi = y(248);
    C_B_I_VTi = y(249);
    C_B_EBCSFB_U_VTi= y(250);
    C_B_EBCSFB_B_VTi = y(251);
    C_B_CSF_VTi = y(252);
    C_L_VTi = y(253);
    C_T_FcRn_U_VTi = y(254);
    C_B_BBB_FcRn_U_VTi = y(255);
    C_B_BCSFB_FcRn_U_VTi = y(256);
    C_P_RC_BBB = y(257);
    C_T_V_RC_BBB = y(258);
    C_T_E_U_RC_BBB = y(259);
    C_T_E_B_RC_BBB = y(260);
    C_T_I_RC_BBB = y(261);
    C_B_V_RC_BBB = y(262);
    C_B_EBBB_U_RC_BBB = y(263);
    C_B_EBBB_B_RC_BBB = y(264);
    C_B_I_RC_BBB = y(265);
    C_B_EBCSFB_U_RC_BBB= y(266);
    C_B_EBCSFB_B_RC_BBB = y(267);
    C_B_CSF_RC_BBB = y(268);
    C_L_RC_BBB = y(269);
    C_T_FcRn_U_RC_BBB = y(270);
    C_B_BBB_FcRn_U_RC_BBB = y(271);
    C_B_BCSFB_FcRn_U_RC_BBB = y(272);  
    C_P_QB_ECF = y(273);
    C_T_V_QB_ECF = y(274);
    C_T_E_U_QB_ECF = y(275);
    C_T_E_B_QB_ECF = y(276);
    C_T_I_QB_ECF = y(277);
    C_B_V_QB_ECF = y(278);
    C_B_EBBB_U_QB_ECF = y(279);
    C_B_EBBB_B_QB_ECF = y(280);
    C_B_I_QB_ECF = y(281);
    C_B_EBCSFB_U_QB_ECF= y(282);
    C_B_EBCSFB_B_QB_ECF = y(283);
    C_B_CSF_QB_ECF = y(284);
    C_L_QB_ECF = y(285);
    C_T_FcRn_U_QB_ECF = y(286);
    C_B_BBB_FcRn_U_QB_ECF = y(287);
    C_B_BCSFB_FcRn_U_QB_ECF = y(288);   
    C_P_RC_BCSFB = y(289);
    C_T_V_RC_BCSFB = y(290);
    C_T_E_U_RC_BCSFB = y(291);
    C_T_E_B_RC_BCSFB = y(292);
    C_T_I_RC_BCSFB = y(293);
    C_B_V_RC_BCSFB = y(294);
    C_B_EBBB_U_RC_BCSFB = y(295);
    C_B_EBBB_B_RC_BCSFB = y(296);
    C_B_I_RC_BCSFB = y(297);
    C_B_EBCSFB_U_RC_BCSFB= y(298);
    C_B_EBCSFB_B_RC_BCSFB = y(299);
    C_B_CSF_RC_BCSFB = y(300);
    C_L_RC_BCSFB = y(301);
    C_T_FcRn_U_RC_BCSFB = y(302);
    C_B_BBB_FcRn_U_RC_BCSFB = y(303);
    C_B_BCSFB_FcRn_U_RC_BCSFB = y(304);  
    C_P_QB_CSF = y(305);
    C_T_V_QB_CSF = y(306);
    C_T_E_U_QB_CSF = y(307);
    C_T_E_B_QB_CSF = y(308);
    C_T_I_QB_CSF = y(309);
    C_B_V_QB_CSF = y(310);
    C_B_EBBB_U_QB_CSF = y(311);
    C_B_EBBB_B_QB_CSF = y(312);
    C_B_I_QB_CSF = y(313);
    C_B_EBCSFB_U_QB_CSF= y(314);
    C_B_EBCSFB_B_QB_CSF = y(315);
    C_B_CSF_QB_CSF = y(316);
    C_L_QB_CSF = y(317);
    C_T_FcRn_U_QB_CSF = y(318);
    C_B_BBB_FcRn_U_QB_CSF = y(319);
    C_B_BCSFB_FcRn_U_QB_CSF = y(320);   
    C_P_CLUP_B = y(321);
    C_T_V_CLUP_B = y(322);
    C_T_E_U_CLUP_B = y(323);
    C_T_E_B_CLUP_B = y(324);
    C_T_I_CLUP_B = y(325);
    C_B_V_CLUP_B = y(326);
    C_B_EBBB_U_CLUP_B = y(327);
    C_B_EBBB_B_CLUP_B = y(328);
    C_B_I_CLUP_B = y(329);
    C_B_EBCSFB_U_CLUP_B= y(330);
    C_B_EBCSFB_B_CLUP_B = y(331);
    C_B_CSF_CLUP_B = y(332);
    C_L_CLUP_B = y(333);
    C_T_FcRn_U_CLUP_B = y(334);
    C_B_BBB_FcRn_U_CLUP_B = y(335);
    C_B_BCSFB_FcRn_U_CLUP_B = y(336);
    C_P_CLUP_BBB = y(337);
    C_T_V_CLUP_BBB = y(338);
    C_T_E_U_CLUP_BBB = y(339);
    C_T_E_B_CLUP_BBB = y(340);
    C_T_I_CLUP_BBB = y(341);
    C_B_V_CLUP_BBB = y(342);
    C_B_EBBB_U_CLUP_BBB = y(343);
    C_B_EBBB_B_CLUP_BBB = y(344);
    C_B_I_CLUP_BBB = y(345);
    C_B_EBCSFB_U_CLUP_BBB= y(346);
    C_B_EBCSFB_B_CLUP_BBB = y(347);
    C_B_CSF_CLUP_BBB = y(348);
    C_L_CLUP_BBB = y(349);
    C_T_FcRn_U_CLUP_BBB = y(350);
    C_B_BBB_FcRn_U_CLUP_BBB = y(351);
    C_B_BCSFB_FcRn_U_CLUP_BBB = y(352);
    C_P_FR_B = y(353);
    C_T_V_FR_B = y(354);
    C_T_E_U_FR_B = y(355);
    C_T_E_B_FR_B = y(356);
    C_T_I_FR_B = y(357);
    C_B_V_FR_B = y(358);
    C_B_EBBB_U_FR_B = y(359);
    C_B_EBBB_B_FR_B = y(360);
    C_B_I_FR_B = y(361);
    C_B_EBCSFB_U_FR_B= y(362);
    C_B_EBCSFB_B_FR_B = y(363);
    C_B_CSF_FR_B = y(364);
    C_L_FR_B = y(365);
    C_T_FcRn_U_FR_B = y(366);
    C_B_BBB_FcRn_U_FR_B = y(367);
    C_B_BCSFB_FcRn_U_FR_B = y(368);  
    C_P_CLUP_BCSFB = y(369);
    C_T_V_CLUP_BCSFB = y(370);
    C_T_E_U_CLUP_BCSFB = y(371);
    C_T_E_B_CLUP_BCSFB = y(372);
    C_T_I_CLUP_BCSFB = y(373);
    C_B_V_CLUP_BCSFB = y(374);
    C_B_EBBB_U_CLUP_BCSFB = y(375);
    C_B_EBBB_B_CLUP_BCSFB = y(376);
    C_B_I_CLUP_BCSFB = y(377);
    C_B_EBCSFB_U_CLUP_BCSFB= y(378);
    C_B_EBCSFB_B_CLUP_BCSFB = y(379);
    C_B_CSF_CLUP_BCSFB = y(380);
    C_L_CLUP_BCSFB = y(381);
    C_T_FcRn_U_CLUP_BCSFB = y(382);
    C_B_BBB_FcRn_U_CLUP_BCSFB = y(383);
    C_B_BCSFB_FcRn_U_CLUP_BCSFB = y(384);
    C_P_VBv = y(385);
    C_T_V_VBv = y(386);
    C_T_E_U_VBv = y(387);
    C_T_E_B_VBv = y(388);
    C_T_I_VBv = y(389);
    C_B_V_VBv = y(390);
    C_B_EBBB_U_VBv = y(391);
    C_B_EBBB_B_VBv = y(392);
    C_B_I_VBv = y(393);
    C_B_EBCSFB_U_VBv= y(394);
    C_B_EBCSFB_B_VBv = y(395);
    C_B_CSF_VBv = y(396);
    C_L_VBv = y(397);
    C_T_FcRn_U_VBv = y(398);
    C_B_BBB_FcRn_U_VBv = y(399);
    C_B_BCSFB_FcRn_U_VBv = y(400);  
    C_P_VBe_BBB = y(401);
    C_T_V_VBe_BBB = y(402);
    C_T_E_U_VBe_BBB = y(403);
    C_T_E_B_VBe_BBB = y(404);
    C_T_I_VBe_BBB = y(405);
    C_B_V_VBe_BBB = y(406);
    C_B_EBBB_U_VBe_BBB = y(407);
    C_B_EBBB_B_VBe_BBB = y(408);
    C_B_I_VBe_BBB = y(409);
    C_B_EBCSFB_U_VBe_BBB= y(410);
    C_B_EBCSFB_B_VBe_BBB = y(411);
    C_B_CSF_VBe_BBB = y(412);
    C_L_VBe_BBB = y(413);
    C_T_FcRn_U_VBe_BBB = y(414);
    C_B_BBB_FcRn_U_VBe_BBB = y(415);
    C_B_BCSFB_FcRn_U_VBe_BBB = y(416);  
    C_P_RC_B_ISF = y(417);
    C_T_V_RC_B_ISF = y(418);
    C_T_E_U_RC_B_ISF = y(419);
    C_T_E_B_RC_B_ISF = y(420);
    C_T_I_RC_B_ISF = y(421);
    C_B_V_RC_B_ISF = y(422);
    C_B_EBBB_U_RC_B_ISF = y(423);
    C_B_EBBB_B_RC_B_ISF = y(424);
    C_B_I_RC_B_ISF = y(425);
    C_B_EBCSFB_U_RC_B_ISF= y(426);
    C_B_EBCSFB_B_RC_B_ISF = y(427);
    C_B_CSF_RC_B_ISF = y(428);
    C_L_RC_B_ISF = y(429);
    C_T_FcRn_U_RC_B_ISF = y(430);
    C_B_BBB_FcRn_U_RC_B_ISF = y(431);
    C_B_BCSFB_FcRn_U_RC_B_ISF = y(432);
    C_P_VBi = y(433);
    C_T_V_VBi = y(434);
    C_T_E_U_VBi = y(435);
    C_T_E_B_VBi = y(436);
    C_T_I_VBi = y(437);
    C_B_V_VBi = y(438);
    C_B_EBBB_U_VBi = y(439);
    C_B_EBBB_B_VBi = y(440);
    C_B_I_VBi = y(441);
    C_B_EBCSFB_U_VBi= y(442);
    C_B_EBCSFB_B_VBi = y(443);
    C_B_CSF_VBi = y(444);
    C_L_VBi = y(445);
    C_T_FcRn_U_VBi = y(446);
    C_B_BBB_FcRn_U_VBi = y(447);
    C_B_BCSFB_FcRn_U_VBi = y(448); 
    C_P_VBe_BCSFB = y(449);
    C_T_V_VBe_BCSFB = y(450);
    C_T_E_U_VBe_BCSFB = y(451);
    C_T_E_B_VBe_BCSFB = y(452);
    C_T_I_VBe_BCSFB = y(453);
    C_B_V_VBe_BCSFB = y(454);
    C_B_EBBB_U_VBe_BCSFB = y(455);
    C_B_EBBB_B_VBe_BCSFB = y(456);
    C_B_I_VBe_BCSFB = y(457);
    C_B_EBCSFB_U_VBe_BCSFB= y(458);
    C_B_EBCSFB_B_VBe_BCSFB = y(459);
    C_B_CSF_VBe_BCSFB = y(460);
    C_L_VBe_BCSFB = y(461);
    C_T_FcRn_U_VBe_BCSFB = y(462);
    C_B_BBB_FcRn_U_VBe_BCSFB = y(463);
    C_B_BCSFB_FcRn_U_VBe_BCSFB = y(464); 
    C_P_RC_B_CSF = y(465);
    C_T_V_RC_B_CSF = y(466);
    C_T_E_U_RC_B_CSF = y(467);
    C_T_E_B_RC_B_CSF = y(468);
    C_T_I_RC_B_CSF = y(469);
    C_B_V_RC_B_CSF = y(470);
    C_B_EBBB_U_RC_B_CSF = y(471);
    C_B_EBBB_B_RC_B_CSF = y(472);
    C_B_I_RC_B_CSF = y(473);
    C_B_EBCSFB_U_RC_B_CSF= y(474);
    C_B_EBCSFB_B_RC_B_CSF = y(475);
    C_B_CSF_RC_B_CSF = y(476);
    C_L_RC_B_CSF = y(477);
    C_T_FcRn_U_RC_B_CSF = y(478);
    C_B_BBB_FcRn_U_RC_B_CSF = y(479);
    C_B_BCSFB_FcRn_U_RC_B_CSF = y(480);
    C_P_VCSF = y(481);
    C_T_V_VCSF = y(482);
    C_T_E_U_VCSF = y(483);
    C_T_E_B_VCSF = y(484);
    C_T_I_VCSF = y(485);
    C_B_V_VCSF = y(486);
    C_B_EBBB_U_VCSF = y(487);
    C_B_EBBB_B_VCSF = y(488);
    C_B_I_VCSF = y(489);
    C_B_EBCSFB_U_VCSF= y(490);
    C_B_EBCSFB_B_VCSF = y(491);
    C_B_CSF_VCSF = y(492);
    C_L_VCSF = y(493);
    C_T_FcRn_U_VCSF = y(494);
    C_B_BBB_FcRn_U_VCSF = y(495);
    C_B_BCSFB_FcRn_U_VCSF = y(496);
    C_P_VL = y(497);
    C_T_V_VL = y(498);
    C_T_E_U_VL = y(499);
    C_T_E_B_VL = y(500);
    C_T_I_VL = y(501);
    C_B_V_VL = y(502);
    C_B_EBBB_U_VL = y(503);
    C_B_EBBB_B_VL = y(504);
    C_B_I_VL = y(505);
    C_B_EBCSFB_U_VL= y(506);
    C_B_EBCSFB_B_VL = y(507);
    C_B_CSF_VL = y(508);
    C_L_VL = y(509);
    C_T_FcRn_U_VL = y(510);
    C_B_BBB_FcRn_U_VL = y(511);
    C_B_BCSFB_FcRn_U_VL = y(512);
    
    
    
    
    
    
% Construction of Sensitivity Equations.
  Svec = [C_P_QT ;C_T_V_QT ;C_T_E_U_QT ;C_T_E_B_QT ;C_T_I_QT ;C_B_V_QT ;C_B_EBBB_U_QT;C_B_EBBB_B_QT ;C_B_I_QT;C_B_EBCSFB_U_QT;
    C_B_EBCSFB_B_QT ;C_B_CSF_QT ;C_L_QT ;C_T_FcRn_U_QT ;C_B_BBB_FcRn_U_QT ;C_B_BCSFB_FcRn_U_QT; C_P_LT ;C_T_V_LT; C_T_E_U_LT ;C_T_E_B_LT ;C_T_I_LT ;C_B_V_LT ;C_B_EBBB_U_LT;...
    C_B_EBBB_B_LT ;C_B_I_LT ;C_B_EBCSFB_U_LT; C_B_EBCSFB_B_LT ;C_B_CSF_LT ;C_L_LT ;C_T_FcRn_U_LT ;C_B_BBB_FcRn_U_LT;...
    C_B_BCSFB_FcRn_U_LT;C_P_QB ;C_T_V_QB; C_T_E_U_QB ;C_T_E_B_QB ;C_T_I_QB ;C_B_V_QB ;C_B_EBBB_U_QB;...
    C_B_EBBB_B_QB ;C_B_I_QB ;C_B_EBCSFB_U_QB; C_B_EBCSFB_B_QB ;C_B_CSF_QB ;C_L_QB ;C_T_FcRn_U_QB ;C_B_BBB_FcRn_U_QB;...
    C_B_BCSFB_FcRn_U_QB;C_P_LB ;C_T_V_LB; C_T_E_U_LB ;C_T_E_B_LB ;C_T_I_LB ;C_B_V_LB ;C_B_EBBB_U_LB;...
    C_B_EBBB_B_LB ;C_B_I_LB ;C_B_EBCSFB_U_LB; C_B_EBCSFB_B_LB ;C_B_CSF_LB ;C_L_LB ;C_T_FcRn_U_LB ;C_B_BBB_FcRn_U_LB;...
    C_B_BCSFB_FcRn_U_LB;C_P_Vp ;C_T_V_Vp; C_T_E_U_Vp ;C_T_E_B_Vp ;C_T_I_Vp ;C_B_V_Vp ;C_B_EBBB_U_Vp;...
    C_B_EBBB_B_Vp ;C_B_I_Vp ;C_B_EBCSFB_U_Vp; C_B_EBCSFB_B_Vp ;C_B_CSF_Vp ;C_L_Vp ;C_T_FcRn_U_Vp ;C_B_BBB_FcRn_U_Vp;...
    C_B_BCSFB_FcRn_U_Vp;C_P_RC_Tv ;C_T_V_RC_Tv; C_T_E_U_RC_Tv ;C_T_E_B_RC_Tv ;C_T_I_RC_Tv ;C_B_V_RC_Tv ;C_B_EBBB_U_RC_Tv;...
    C_B_EBBB_B_RC_Tv ;C_B_I_RC_Tv ;C_B_EBCSFB_U_RC_Tv; C_B_EBCSFB_B_RC_Tv ;C_B_CSF_RC_Tv ;C_L_RC_Tv ;C_T_FcRn_U_RC_Tv ;C_B_BBB_FcRn_U_RC_Tv;...
    C_B_BCSFB_FcRn_U_RC_Tv;C_P_CLUP_T ;C_T_V_CLUP_T; C_T_E_U_CLUP_T ;C_T_E_B_CLUP_T ;C_T_I_CLUP_T ;C_B_V_CLUP_T ;C_B_EBBB_U_CLUP_T;...
    C_B_EBBB_B_CLUP_T ;C_B_I_CLUP_T ;C_B_EBCSFB_U_CLUP_T; C_B_EBCSFB_B_CLUP_T ;C_B_CSF_CLUP_T ;C_L_CLUP_T ;C_T_FcRn_U_CLUP_T ;C_B_BBB_FcRn_U_CLUP_T;...
    C_B_BCSFB_FcRn_U_CLUP_T;C_P_FR ;C_T_V_FR; C_T_E_U_FR ;C_T_E_B_FR ;C_T_I_FR ;C_B_V_FR ;C_B_EBBB_U_FR;...
    C_B_EBBB_B_FR ;C_B_I_FR ;C_B_EBCSFB_U_FR; C_B_EBCSFB_B_FR ;C_B_CSF_FR ;C_L_FR ;C_T_FcRn_U_FR ;C_B_BBB_FcRn_U_FR;...
    C_B_BCSFB_FcRn_U_FR;C_P_VTv ;C_T_V_VTv; C_T_E_U_VTv ;C_T_E_B_VTv ;C_T_I_VTv ;C_B_V_VTv ;C_B_EBBB_U_VTv;...
    C_B_EBBB_B_VTv ;C_B_I_VTv ;C_B_EBCSFB_U_VTv; C_B_EBCSFB_B_VTv ;C_B_CSF_VTv ;C_L_VTv ;C_T_FcRn_U_VTv ;C_B_BBB_FcRn_U_VTv;...
    C_B_BCSFB_FcRn_U_VTv;C_P_Kon_FcRn ;C_T_V_Kon_FcRn; C_T_E_U_Kon_FcRn ;C_T_E_B_Kon_FcRn ;C_T_I_Kon_FcRn ;C_B_V_Kon_FcRn ;C_B_EBBB_U_Kon_FcRn;...
    C_B_EBBB_B_Kon_FcRn ;C_B_I_Kon_FcRn ;C_B_EBCSFB_U_Kon_FcRn; C_B_EBCSFB_B_Kon_FcRn ;C_B_CSF_Kon_FcRn ;C_L_Kon_FcRn ;C_T_FcRn_U_Kon_FcRn ;C_B_BBB_FcRn_U_Kon_FcRn;...
    C_B_BCSFB_FcRn_U_Kon_FcRn;C_P_Koff_FcRn ;C_T_V_Koff_FcRn; C_T_E_U_Koff_FcRn ;C_T_E_B_Koff_FcRn ;C_T_I_Koff_FcRn ;C_B_V_Koff_FcRn ;C_B_EBBB_U_Koff_FcRn;...
    C_B_EBBB_B_Koff_FcRn ;C_B_I_Koff_FcRn ;C_B_EBCSFB_U_Koff_FcRn; C_B_EBCSFB_B_Koff_FcRn ;C_B_CSF_Koff_FcRn ;C_L_Koff_FcRn ;C_T_FcRn_U_Koff_FcRn ;C_B_BBB_FcRn_U_Koff_FcRn;...
    C_B_BCSFB_FcRn_U_Koff_FcRn;C_P_Kdeg ;C_T_V_Kdeg; C_T_E_U_Kdeg ;C_T_E_B_Kdeg ;C_T_I_Kdeg ;C_B_V_Kdeg ;C_B_EBBB_U_Kdeg;...
    C_B_EBBB_B_Kdeg ;C_B_I_Kdeg ;C_B_EBCSFB_U_Kdeg; C_B_EBCSFB_B_Kdeg ;C_B_CSF_Kdeg ;C_L_Kdeg ;C_T_FcRn_U_Kdeg ;C_B_BBB_FcRn_U_Kdeg;...
    C_B_BCSFB_FcRn_U_Kdeg;C_P_VTe ;C_T_V_VTe; C_T_E_U_VTe ;C_T_E_B_VTe ;C_T_I_VTe ;C_B_V_VTe ;C_B_EBBB_U_VTe;...
    C_B_EBBB_B_VTe ;C_B_I_VTe ;C_B_EBCSFB_U_VTe; C_B_EBCSFB_B_VTe ;C_B_CSF_VTe ;C_L_VTe ;C_T_FcRn_U_VTe ;C_B_BBB_FcRn_U_VTe;...
    C_B_BCSFB_FcRn_U_VTe;C_P_RC_TL ;C_T_V_RC_TL; C_T_E_U_RC_TL ;C_T_E_B_RC_TL ;C_T_I_RC_TL ;C_B_V_RC_TL ;C_B_EBBB_U_RC_TL;...
    C_B_EBBB_B_RC_TL ;C_B_I_RC_TL ;C_B_EBCSFB_U_RC_TL; C_B_EBCSFB_B_RC_TL ;C_B_CSF_RC_TL ;C_L_RC_TL ;C_T_FcRn_U_RC_TL ;C_B_BBB_FcRn_U_RC_TL;...
    C_B_BCSFB_FcRn_U_RC_TL;C_P_VTi ;C_T_V_VTi; C_T_E_U_VTi ;C_T_E_B_VTi ;C_T_I_VTi ;C_B_V_VTi ;C_B_EBBB_U_VTi;...
    C_B_EBBB_B_VTi ;C_B_I_VTi ;C_B_EBCSFB_U_VTi; C_B_EBCSFB_B_VTi ;C_B_CSF_VTi ;C_L_VTi ;C_T_FcRn_U_VTi ;C_B_BBB_FcRn_U_VTi;...
    C_B_BCSFB_FcRn_U_VTi;C_P_RC_BBB ;C_T_V_RC_BBB; C_T_E_U_RC_BBB ;C_T_E_B_RC_BBB ;C_T_I_RC_BBB ;C_B_V_RC_BBB ;C_B_EBBB_U_RC_BBB;...
    C_B_EBBB_B_RC_BBB ;C_B_I_RC_BBB ;C_B_EBCSFB_U_RC_BBB; C_B_EBCSFB_B_RC_BBB ;C_B_CSF_RC_BBB ;C_L_RC_BBB ;C_T_FcRn_U_RC_BBB ;C_B_BBB_FcRn_U_RC_BBB;...
    C_B_BCSFB_FcRn_U_RC_BBB;C_P_QB_ECF ;C_T_V_QB_ECF; C_T_E_U_QB_ECF ;C_T_E_B_QB_ECF ;C_T_I_QB_ECF ;C_B_V_QB_ECF ;C_B_EBBB_U_QB_ECF;...
    C_B_EBBB_B_QB_ECF ;C_B_I_QB_ECF ;C_B_EBCSFB_U_QB_ECF; C_B_EBCSFB_B_QB_ECF ;C_B_CSF_QB_ECF ;C_L_QB_ECF ;C_T_FcRn_U_QB_ECF ;C_B_BBB_FcRn_U_QB_ECF;...
    C_B_BCSFB_FcRn_U_QB_ECF;C_P_RC_BCSFB ;C_T_V_RC_BCSFB; C_T_E_U_RC_BCSFB ;C_T_E_B_RC_BCSFB ;C_T_I_RC_BCSFB ;C_B_V_RC_BCSFB ;C_B_EBBB_U_RC_BCSFB;...
    C_B_EBBB_B_RC_BCSFB ;C_B_I_RC_BCSFB ;C_B_EBCSFB_U_RC_BCSFB; C_B_EBCSFB_B_RC_BCSFB ;C_B_CSF_RC_BCSFB ;C_L_RC_BCSFB ;C_T_FcRn_U_RC_BCSFB ;C_B_BBB_FcRn_U_RC_BCSFB;...
    C_B_BCSFB_FcRn_U_RC_BCSFB;C_P_QB_CSF ;C_T_V_QB_CSF; C_T_E_U_QB_CSF ;C_T_E_B_QB_CSF ;C_T_I_QB_CSF ;C_B_V_QB_CSF ;C_B_EBBB_U_QB_CSF;...
    C_B_EBBB_B_QB_CSF ;C_B_I_QB_CSF ;C_B_EBCSFB_U_QB_CSF; C_B_EBCSFB_B_QB_CSF ;C_B_CSF_QB_CSF ;C_L_QB_CSF ;C_T_FcRn_U_QB_CSF ;C_B_BBB_FcRn_U_QB_CSF;...
    C_B_BCSFB_FcRn_U_QB_CSF; C_P_CLUP_B ;C_T_V_CLUP_B; C_T_E_U_CLUP_B ;C_T_E_B_CLUP_B ;C_T_I_CLUP_B ;C_B_V_CLUP_B ;C_B_EBBB_U_CLUP_B;...
    C_B_EBBB_B_CLUP_B ;C_B_I_CLUP_B ;C_B_EBCSFB_U_CLUP_B; C_B_EBCSFB_B_CLUP_B ;C_B_CSF_CLUP_B ;C_L_CLUP_B ;C_T_FcRn_U_CLUP_B ;C_B_BBB_FcRn_U_CLUP_B;...
    C_B_BCSFB_FcRn_U_CLUP_B;C_P_CLUP_BBB ;C_T_V_CLUP_BBB; C_T_E_U_CLUP_BBB ;C_T_E_B_CLUP_BBB ;C_T_I_CLUP_BBB ;C_B_V_CLUP_BBB ;C_B_EBBB_U_CLUP_BBB;...
    C_B_EBBB_B_CLUP_BBB ;C_B_I_CLUP_BBB ;C_B_EBCSFB_U_CLUP_BBB; C_B_EBCSFB_B_CLUP_BBB ;C_B_CSF_CLUP_BBB ;C_L_CLUP_BBB ;C_T_FcRn_U_CLUP_BBB ;C_B_BBB_FcRn_U_CLUP_BBB;...
    C_B_BCSFB_FcRn_U_CLUP_BBB;C_P_FR_B ;C_T_V_FR_B; C_T_E_U_FR_B ;C_T_E_B_FR_B ;C_T_I_FR_B ;C_B_V_FR_B ;C_B_EBBB_U_FR_B;...
    C_B_EBBB_B_FR_B ;C_B_I_FR_B ;C_B_EBCSFB_U_FR_B; C_B_EBCSFB_B_FR_B ;C_B_CSF_FR_B ;C_L_FR_B ;C_T_FcRn_U_FR_B ;C_B_BBB_FcRn_U_FR_B;...
    C_B_BCSFB_FcRn_U_FR_B;C_P_CLUP_BCSFB ;C_T_V_CLUP_BCSFB; C_T_E_U_CLUP_BCSFB ;C_T_E_B_CLUP_BCSFB ;C_T_I_CLUP_BCSFB ;C_B_V_CLUP_BCSFB ;C_B_EBBB_U_CLUP_BCSFB;...
    C_B_EBBB_B_CLUP_BCSFB ;C_B_I_CLUP_BCSFB ;C_B_EBCSFB_U_CLUP_BCSFB; C_B_EBCSFB_B_CLUP_BCSFB ;C_B_CSF_CLUP_BCSFB ;C_L_CLUP_BCSFB ;C_T_FcRn_U_CLUP_BCSFB ;C_B_BBB_FcRn_U_CLUP_BCSFB;...
    C_B_BCSFB_FcRn_U_CLUP_BCSFB;C_P_VBv ;C_T_V_VBv; C_T_E_U_VBv ;C_T_E_B_VBv ;C_T_I_VBv ;C_B_V_VBv ;C_B_EBBB_U_VBv;...
    C_B_EBBB_B_VBv ;C_B_I_VBv ;C_B_EBCSFB_U_VBv; C_B_EBCSFB_B_VBv ;C_B_CSF_VBv ;C_L_VBv ;C_T_FcRn_U_VBv ;C_B_BBB_FcRn_U_VBv;...
    C_B_BCSFB_FcRn_U_VBv;C_P_VBe_BBB ;C_T_V_VBe_BBB; C_T_E_U_VBe_BBB ;C_T_E_B_VBe_BBB ;C_T_I_VBe_BBB ;C_B_V_VBe_BBB ;C_B_EBBB_U_VBe_BBB;...
    C_B_EBBB_B_VBe_BBB ;C_B_I_VBe_BBB ;C_B_EBCSFB_U_VBe_BBB; C_B_EBCSFB_B_VBe_BBB ;C_B_CSF_VBe_BBB ;C_L_VBe_BBB ;C_T_FcRn_U_VBe_BBB ;C_B_BBB_FcRn_U_VBe_BBB;...
    C_B_BCSFB_FcRn_U_VBe_BBB;C_P_RC_B_ISF ;C_T_V_RC_B_ISF; C_T_E_U_RC_B_ISF ;C_T_E_B_RC_B_ISF ;C_T_I_RC_B_ISF ;C_B_V_RC_B_ISF ;C_B_EBBB_U_RC_B_ISF;...
    C_B_EBBB_B_RC_B_ISF ;C_B_I_RC_B_ISF ;C_B_EBCSFB_U_RC_B_ISF; C_B_EBCSFB_B_RC_B_ISF ;C_B_CSF_RC_B_ISF ;C_L_RC_B_ISF ;C_T_FcRn_U_RC_B_ISF ;C_B_BBB_FcRn_U_RC_B_ISF;...
    C_B_BCSFB_FcRn_U_RC_B_ISF;C_P_VBi ;C_T_V_VBi; C_T_E_U_VBi ;C_T_E_B_VBi ;C_T_I_VBi ;C_B_V_VBi ;C_B_EBBB_U_VBi;...
    C_B_EBBB_B_VBi ;C_B_I_VBi ;C_B_EBCSFB_U_VBi; C_B_EBCSFB_B_VBi ;C_B_CSF_VBi ;C_L_VBi ;C_T_FcRn_U_VBi ;C_B_BBB_FcRn_U_VBi;...
    C_B_BCSFB_FcRn_U_VBi;C_P_VBe_BCSFB ;C_T_V_VBe_BCSFB; C_T_E_U_VBe_BCSFB ;C_T_E_B_VBe_BCSFB ;C_T_I_VBe_BCSFB ;C_B_V_VBe_BCSFB ;C_B_EBBB_U_VBe_BCSFB;...
    C_B_EBBB_B_VBe_BCSFB ;C_B_I_VBe_BCSFB ;C_B_EBCSFB_U_VBe_BCSFB; C_B_EBCSFB_B_VBe_BCSFB ;C_B_CSF_VBe_BCSFB ;C_L_VBe_BCSFB ;C_T_FcRn_U_VBe_BCSFB ;C_B_BBB_FcRn_U_VBe_BCSFB;...
    C_B_BCSFB_FcRn_U_VBe_BCSFB;C_P_RC_B_CSF ;C_T_V_RC_B_CSF; C_T_E_U_RC_B_CSF ;C_T_E_B_RC_B_CSF ;C_T_I_RC_B_CSF ;C_B_V_RC_B_CSF ;C_B_EBBB_U_RC_B_CSF;...
    C_B_EBBB_B_RC_B_CSF ;C_B_I_RC_B_CSF ;C_B_EBCSFB_U_RC_B_CSF; C_B_EBCSFB_B_RC_B_CSF ;C_B_CSF_RC_B_CSF ;C_L_RC_B_CSF ;C_T_FcRn_U_RC_B_CSF ;C_B_BBB_FcRn_U_RC_B_CSF;...
    C_B_BCSFB_FcRn_U_RC_B_CSF;C_P_VCSF ;C_T_V_VCSF; C_T_E_U_VCSF ;C_T_E_B_VCSF ;C_T_I_VCSF ;C_B_V_VCSF ;C_B_EBBB_U_VCSF;...
    C_B_EBBB_B_VCSF ;C_B_I_VCSF ;C_B_EBCSFB_U_VCSF; C_B_EBCSFB_B_VCSF ;C_B_CSF_VCSF ;C_L_VCSF ;C_T_FcRn_U_VCSF ;C_B_BBB_FcRn_U_VCSF;...
    C_B_BCSFB_FcRn_U_VCSF; C_P_VL ;C_T_V_VL; C_T_E_U_VL ;C_T_E_B_VL ;C_T_I_VL ;C_B_V_VL ;C_B_EBBB_U_VL;...
    C_B_EBBB_B_VL ;C_B_I_VL ;C_B_EBCSFB_U_VL; C_B_EBCSFB_B_VL ;C_B_CSF_VL ;C_L_VL ;C_T_FcRn_U_VL ;C_B_BBB_FcRn_U_VL;...
    C_B_BCSFB_FcRn_U_VL];



% %     J =[-(QB + QT)/Vp                         -(LT - QT)/Vp                            0                         0                                0                                                            -(LB - QB)/Vp                                0                                 0                                                   0                                    0                                    0                                                   0                            (LB + LT)/Vp                   0                           0                              0;
% %         QT/VTv        -(CLUP_T-LT +QT-LT*(RC_Tv - 1))/VTv                            0            (CLUP_T*FR)/VTv                               0                                                                    0                                    0                                 0                                                   0                                    0                                    0                                                   0                                0                          0                           0                              0;
% %              0                                 CLUP_T/VTe     -Kdeg-C_T_FcRn_U*Kon_FcRn                 Koff_FcRn                       CLUP_T/VTe                                                                   0                                    0                                 0                                                   0                                    0                                    0                                                   0                                0               -C_T_E_U*Kon_FcRn                      0                              0;
% %              0                                        0             C_T_FcRn_U*Kon_FcRn      -Koff_FcRn-(CLUP_T/VTe)                            0                                                                    0                                    0                                 0                                                   0                                    0                                    0                                                   0                                0                C_T_E_U*Kon_FcRn                      0                              0;
% %              0                      -(LT*(RC_Tv - 1))/VTi                            0       -(CLUP_T*(FR - 1))/VTi     -(CLUP_T - LT*(RC_TL - 1))/VTi                                                               0                                    0                                 0                                                   0                                    0                                    0                                                   0                                0                          0                           0                              0;
% %         QB/VBv                                        0                              0                         0                                0              (LB-CLUP_B -QB +QB_ECF*(RC_BBB- 1)+QB_CSF*(RC_BCSFB - 1))/VBv                              0                      (CLUP_BBB*FR_B)/VBv                                            0                                    0                      (CLUP_BCSFB*FR_B)/VBv                                             0                                0                          0                           0                              0;
% %              0                                        0                              0                         0                                0                                                        CLUP_BBB/VBe_BBB              -Kdeg-C_B_BBB_FcRn_U*Kon_FcRn                      Koff_FcRn                                     CLUP_BBB/VBe_BBB                             0                                    0                                                   0                                0                          0                 -C_B_EBBB_U*Kon_FcRn                     0;
% %              0                                        0                              0                         0                                0                                                                    0                       C_B_BBB_FcRn_U*Kon_FcRn            -Koff_FcRn-(CLUP_BBB/VBe_BBB)                                   0                                    0                                    0                                                   0                                0                          0                  C_B_EBBB_U*Kon_FcRn                     0;
% %              0                                        0                              0                         0                                0                                                 -(QB_ECF*(RC_BBB - 1))/VBi                              0                     -(CLUP_BBB*(FR_B - 1))/VBi            -(CLUP_BBB+QB_ECF-QB_ECF*(RC_B_ISF - 1))/VBi                   0                                    0                                              QB_ECF/VBi                            0                          0                           0                              0;
% %              0                                        0                              0                         0                                0                                                       CLUP_BCSFB/VBe_BCSFB                              0                                 0                                                   0                      -Kdeg-C_B_BCSFB_FcRn_U*Kon_FcRn                Koff_FcRn                                     CLUP_BCSFB/VBe_BCSFB                       0                          0                           0                      -C_B_EBCSFB_U*Kon_FcRn;
% %              0                                        0                              0                         0                                0                                                                    0                                    0                                 0                                                   0                            C_B_BCSFB_FcRn_U*Kon_FcRn         -Koff_FcRn-(CLUP_BCSFB/VBe_BCSFB)                              0                                0                          0                           0                      C_B_EBCSFB_U*Kon_FcRn;
% %              0                                        0                              0                         0                                0                                                -(QB_CSF*(RC_BCSFB-1))/VCSF                              0                                 0                                             QB_ECF/VCSF                                0                         -(CLUP_BCSFB*(FR_B - 1))/VCSF         -(CLUP_BCSFB+QB_ECF-QB_CSF*(RC_B_CSF - 1))/VCSF           0                          0                           0                              0;
% %              0                                        0                              0                         0                 -(LT*(RC_TL - 1))/VL                                                                0                                    0                                 0                                -(QB_ECF*(RC_B_ISF - 1))/VL                             0                                    0                                    -(QB_CSF*(RC_B_CSF - 1))/VL                 -(LB+LT)/VL                    0                           0                              0;
% %              0                                        0            -C_T_FcRn_U*Kon_FcRn       Koff_FcRn+(CLUP_T/VTe)                            0                                                                    0                                    0                                 0                                                   0                                    0                                    0                                                   0                                0                          0                           0                              0;
% %              0                                        0                              0                         0                                0                                                                    0                     -C_B_BBB_FcRn_U*Kon_FcRn            Koff_FcRn+(CLUP_BBB/VBe_BBB)                                     0                                    0                                    0                                                   0                                0                 -C_T_E_U*Kon_FcRn           -Kon_FcRn * C_B_EBBB_U                  0;
% %              0                                        0                              0                         0                                0                                                                    0                                    0                                 0                                                   0                         -C_B_BCSFB_FcRn_U*Kon_FcRn         Koff_FcRn+(CLUP_BCSFB/VBe_BCSFB)                                 0                                0                          0                           0                    -C_B_EBCSFB_U*Kon_FcRn];
% % 

J=[-(QB + QT)/Vp                         -(LT - QT)/Vp                             0                               0                              0                                                        -(LB - QB)/Vp                                0                                   0                                                0                                  0                                  0                                                   0           (LB + LT)/Vp                        0                           0                              0;
        QT/VTv       -(CLUP_T-LT +QT-LT*(RC_Tv - 1))/VTv                           0                    (CLUP_T*FR)/VTv                           0                                                                    0                                0                                   0                                                0                                  0                                  0                                                   0                      0                        0                           0                              0;
             0                               CLUP_T/VTe     -Kdeg-C_T_FcRn_U*Kon_FcRn*C_star                Koff_FcRn                     CLUP_T/VTe                                                                   0                                0                                   0                                                0                                  0                                  0                                                   0                      0        -C_T_E_U*Kon_FcRn*C_star                    0                              0;
             0                                        0          C_T_FcRn_U*Kon_FcRn*C_star     -Koff_FcRn-CLUP_T/VTe                             0                                                                    0                                0                                   0                                                0                                  0                                  0                                                   0                      0         C_T_E_U*Kon_FcRn*C_star                    0                              0;
             0                    -(LT*(RC_Tv - 1))/VTi                            0           -(CLUP_T*(FR - 1))/VTi   -(CLUP_T - LT*(RC_TL - 1))/VTi                                                                 0                                0                                   0                                                0                                  0                                  0                                                   0                      0                        0                           0                              0;
        QB/VBv                                        0                            0                               0                              0        (LB-CLUP_B -QB +QB_ECF*(RC_BBB- 1)+QB_CSF*(RC_BCSFB - 1))/VBv                                0                  (CLUP_BBB*FR_B)/VBv                                               0                                  0                     (CLUP_BCSFB*FR_B)/VBv                                            0                      0                        0                           0                              0;
             0                                        0                            0                               0                              0                                                     CLUP_BBB/VBe_BBB     -Kdeg-C_B_BBB_FcRn_U*Kon_FcRn*C_star                      Koff_FcRn                                 CLUP_BBB/VBe_BBB                               0                                  0                                                   0                      0                        0         -C_B_EBBB_U*Kon_FcRn*C_star                      0;
             0                                        0                            0                               0                              0                                                                    0          C_B_BBB_FcRn_U*Kon_FcRn*C_star     -Koff_FcRn-CLUP_BBB/VBe_BBB                                             0                                  0                                  0                                                   0                      0                        0          C_B_EBBB_U*Kon_FcRn*C_star                      0;
             0                                        0                            0                               0                              0                                           -(QB_ECF*(RC_BBB - 1))/VBi                                0             -(CLUP_BBB*(FR_B - 1))/VBi      -(CLUP_BBB+QB_ECF-QB_ECF*(RC_B_ISF - 1))/VBi                              0                                  0                                          QB_ECF/VBi                      0                        0                           0                              0;
             0                                        0                            0                               0                              0                                                 CLUP_BCSFB/VBe_BCSFB                                0                                   0                                                0     -Kdeg-C_B_BCSFB_FcRn_U*Kon_FcRn*C_star                          Koff_FcRn                                CLUP_BCSFB/VBe_BCSFB              0                        0                           0         -C_B_EBCSFB_U*Kon_FcRn*C_star;
             0                                        0                            0                               0                              0                                                                    0                                0                                   0                                                0          C_B_BCSFB_FcRn_U*Kon_FcRn*C_star     -Koff_FcRn-CLUP_BCSFB/VBe_BCSFB                                           0                      0                        0                           0          C_B_EBCSFB_U*Kon_FcRn*C_star;
             0                                        0                            0                               0                              0                                          -(QB_CSF*(RC_BCSFB-1))/VCSF                                0                                   0                                      QB_ECF/VCSF                                  0              -(CLUP_BCSFB*(FR_B - 1))/VCSF      -(CLUP_BCSFB+QB_ECF-QB_CSF*(RC_B_CSF - 1))/VCSF             0                        0                           0                              0;
             0                                        0                            0                               0           -(LT*(RC_TL - 1))/VL                                                                    0                                0                                   0                      -(QB_ECF*(RC_B_ISF - 1))/VL                                  0                                  0                         -(QB_CSF*(RC_B_CSF - 1))/VL             -(LB+LT)/VL                       0                           0                              0;
             0                                        0         -C_T_FcRn_U*Kon_FcRn*C_star           Koff_FcRn+CLUP_T/VTe                        0                                                                    0                                0                                   0                                                0                                  0                                  0                                                   0                      0        -C_T_E_U*Kon_FcRn*C_star                    0                              0;
             0                                        0                            0                               0                              0                                                                    0         -C_B_BBB_FcRn_U*Kon_FcRn*C_star     Koff_FcRn+CLUP_BBB/VBe_BBB                                              0                                  0                                  0                                                   0                      0                        0         -C_B_EBBB_U*Kon_FcRn*C_star                      0;
             0                                        0                            0                               0                              0                                                                    0                                0                                   0                                                0         -C_B_BCSFB_FcRn_U*Kon_FcRn*C_star     Koff_FcRn+CLUP_BCSFB/VBe_BCSFB                                            0                      0                        0                           0         -C_B_EBCSFB_U*Kon_FcRn*C_star];
  


  
   Der = blkdiag(J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J,J); 
   Grad = [-(C_P - C_T_V)/Vp; (C_P - C_T_V)/VTv; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; (C_L - C_T_V)/Vp;  (C_T_V + C_T_V*(RC_Tv - 1))/VTv;0;0;...
       (C_T_I*(RC_TL - 1) - C_T_V*(RC_Tv - 1))/VTi;0;0;0;0;0;0;0;-(C_L + C_T_I*(RC_TL - 1))/VL;0;0;0;...
       (C_B_V - C_P)/Vp;0;0;0;0;-(C_B_V - C_P)/VBv;0;0;0;0;0;0;0;0;0;0;...
       -(C_B_V - C_L)/Vp;0;0;0;0;C_B_V/VBv;0;0;0;0;0;0;-C_L/VL;0;0;0;...
       (C_P*QB - C_L*(LB + LT) + C_P*QT + C_B_V*(LB - QB) + C_T_V*(LT - QT))/Vp^2;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;...
       0;(C_T_V*LT)/VTv;0;0;-(C_T_V*LT)/VTi;0;0;0;0;0;0;0;0;0;0;0;
       0;-(C_T_V - C_T_E_B*FR)/VTv;(C_T_I + C_T_V)/VTe;-C_T_E_B/VTe;-(C_T_I + C_T_E_B*(FR - 1))/VTi;0;0;0;0;0;0;0;0;C_T_E_B/VTe;0;0;...
       0;(CLUP_T*C_T_E_B)/VTv;0;0;-(CLUP_T*C_T_E_B)/VTi;0;0;0;0;0;0;0;0;0;0;0;...
       0;-(C_P*QT - CLUP_T*C_T_V + C_T_V*(LT - QT) + CLUP_T*C_T_E_B*FR + C_T_V*LT*(RC_Tv - 1))/VTv^2;0;0;0;0;0;0;0;0;0;0;0;0;0;0;...
       0;0;-C_T_E_U*C_T_FcRn_U*C_star;C_T_E_U*C_T_FcRn_U*C_star;0;0;-C_B_EBBB_U*C_B_BBB_FcRn_U*C_star;C_B_EBBB_U*C_B_BBB_FcRn_U*C_star;0;-C_B_EBCSFB_U*C_B_BCSFB_FcRn_U*C_star;C_B_EBCSFB_U*C_B_BCSFB_FcRn_U*C_star;0;0;-C_T_E_U*C_T_FcRn_U*C_star;-C_B_EBBB_U*C_B_BBB_FcRn_U*C_star;-C_B_EBCSFB_U*C_B_BCSFB_FcRn_U*C_star;...
       0;0;C_T_E_B;-C_T_E_B;0;0;C_B_EBBB_B;-C_B_EBBB_B;0;C_B_EBCSFB_B;-C_B_EBCSFB_B;0;0;C_T_E_B;C_B_EBBB_B; C_B_EBCSFB_B;...
       0;0;-C_T_E_U;0;0;0;-C_B_EBBB_U;0;0;-C_B_EBCSFB_U;0;0;0;0;0;0;...
       0;0;-(CLUP_T*(C_T_I + C_T_V))/VTe^2;(CLUP_T*C_T_E_B)/VTe^2;0;0;0;0;0;0;0;0;0;-(CLUP_T*C_T_E_B)/VTe^2;0;0;...
       0;0;0;0;(C_T_I*LT)/VTi;0;0;0;0;0;0;0;-(C_T_I*LT)/VL;0;0;0;...
       0;0;0;0;(CLUP_T*C_T_I + CLUP_T*C_T_E_B*(FR - 1) - C_T_I*LT*(RC_TL - 1) + C_T_V*LT*(RC_Tv - 1))/VTi^2;0;0;0;0;0;0;0;0;0;0;0;...
       0;0;0;0;0;(C_B_V*QB_ECF)/VBv;0;0;-(C_B_V*QB_ECF)/VBi;0;0;0;0;0;0;0;...
       0;0;0;0;0;(C_B_V*(RC_BBB - 1))/VBv;0;0;-(C_B_I - C_B_CSF + C_B_V*(RC_BBB - 1) - C_B_I*(RC_B_ISF - 1))/VBi;0;0;(C_B_I - C_B_CSF)/VCSF; -(C_B_I*(RC_B_ISF - 1))/VL;0;0;0;...
       0;0;0;0;0;(C_B_V*QB_CSF)/VBv;0;0;0;0;0;-(C_B_V*QB_CSF)/VCSF;0;0;0;0;...
       0;0;0;0;0;(C_B_V*(RC_BCSFB - 1))/VBv;0;0;0;0;0;-(C_B_V*(RC_BCSFB - 1) - C_B_CSF*(RC_B_CSF - 1))/VCSF;-(C_B_CSF*(RC_B_CSF - 1))/VL;0;0;0;...
       0;0;0;0;0;-C_B_V/VBv;0;0;0;0;0;0;0;0;0;0;...
       0;0;0;0;0;(C_B_EBBB_B*FR_B)/VBv;(C_B_I + C_B_V)/VBe_BBB;-C_B_EBBB_B/VBe_BBB;-(C_B_I + C_B_EBBB_B*(FR_B - 1))/VBi;0;0;0;0;0;C_B_EBBB_B/VBe_BBB;0;...
       0;0;0;0;0;(CLUP_BBB*C_B_EBBB_B + CLUP_BCSFB*C_B_EBCSFB_B)/VBv;0;0;-(CLUP_BBB*C_B_EBBB_B)/VBi;0;0;-(CLUP_BCSFB*C_B_EBCSFB_B)/VCSF;0;0;0;0;...
       0;0;0;0;0;(C_B_EBCSFB_B*FR_B)/VBv;0;0;0;(C_B_V + C_B_CSF)/VBe_BCSFB; -C_B_EBCSFB_B/VBe_BCSFB;-(C_B_CSF + C_B_EBCSFB_B*(FR_B - 1))/VCSF;0;0;0;C_B_EBCSFB_B/VBe_BCSFB;...
       0;0;0;0;0;-(C_P*QB - CLUP_B*C_B_V + C_B_V*(LB - QB) + CLUP_BBB*C_B_EBBB_B*FR_B + CLUP_BCSFB*C_B_EBCSFB_B*FR_B + C_B_V*QB_ECF*(RC_BBB - 1) + C_B_V*QB_CSF*(RC_BCSFB - 1))/VBv^2;0;0;0;0;0;0;0;0;0;0;...
       0;0;0;0;0;0;-(CLUP_BBB*(C_B_I + C_B_V))/VBe_BBB^2; (CLUP_BBB*C_B_EBBB_B)/VBe_BBB^2;0;0;0;0;0;0;-(CLUP_BBB*C_B_EBBB_B)/VBe_BBB^2;0;...
       0;0;0;0;0;0;0;0;(C_B_I*QB_ECF)/VBi;0;0;0;-(C_B_I*QB_ECF)/VL;0;0;0;...
       0;0;0;0;0;0;0;0;(CLUP_BBB*C_B_I + C_B_I*QB_ECF - C_B_CSF*QB_ECF + CLUP_BBB*C_B_EBBB_B*(FR_B - 1) + C_B_V*QB_ECF*(RC_BBB - 1) - C_B_I*QB_ECF*(RC_B_ISF - 1))/VBi^2;0;0;0;0;0;0;0;...
       0;0;0;0;0;0;0;0;0;-(CLUP_BCSFB*C_B_V + CLUP_BCSFB*C_B_CSF)/VBe_BCSFB^2; (CLUP_BCSFB*C_B_EBCSFB_B)/VBe_BCSFB^2;0;0;0;0;-(CLUP_BCSFB*C_B_EBCSFB_B)/VBe_BCSFB^2;...
       0;0;0;0;0;0;0;0;0;0;0;(C_B_CSF*QB_CSF)/VCSF;-(C_B_CSF*QB_CSF)/VL;0;0;0;...
       0;0;0;0;0;0;0;0;0;0;0;(CLUP_BCSFB*C_B_CSF - C_B_I*QB_ECF + C_B_CSF*QB_ECF + CLUP_BCSFB*C_B_EBCSFB_B*(FR_B - 1) + C_B_V*QB_CSF*(RC_BCSFB - 1) - C_B_CSF*QB_CSF*(RC_B_CSF - 1))/VCSF^2;0;0;0;0;...
       0;0;0;0;0;0;0;0;0;0;0;0;(C_L*(LB + LT) + C_T_I*LT*(RC_TL - 1) + C_B_I*QB_ECF*(RC_B_ISF - 1) + C_B_CSF*QB_CSF*(RC_B_CSF - 1))/VL^2;0;0;0];
   Sen = Der*Svec + Grad;


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
    dC_B_BCSFB_FcRn_Udt;
   Sen ] ;
  end


