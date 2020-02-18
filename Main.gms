$TITLE  THE RICE MODEL
$stitle Version: RICE 2010 tstep=5
* GDP and capital stock is from IMF
* Emission is from CDIAC in GtC (not EDGAR in GtCO2)
* calibration from 2005

*OPTION NLP= conopt;
*OPTION NLP= minos;
OPTION NLP= conopt4;


SETS
        T               /1*60/
        TFIRST(T)
        TLAST(T)
        TEARLY(T)
        TLATE(T)
        CENT(T);

TLATE(T)  =YES$(ORD(T)>50);
CENT(T)   =YES$(ORD(T)<55);
TFIRST(T) =YES$(ORD(T)=1);
TLAST(T)  =YES$(ORD(T)=CARD(T));


SCALARS

**  Technical scalars.
        TSTEP   Length of time step                                      /5   /
        Q       Utility derivative scaling factor                        /1E1 /
        Q1                                                               /1E0 /
        Q2                                                               /1E2 /
        ININUT  initial nash utility to for the "log" equation           /-1E4/
        VEPS    provide a small value EPS                                /1E-13/

**  generationnal discount rate
        SRTP0   Initial generational time preference(pct per year)       / 1.5 /
        ALPHA   elasticty of marginal utility of consumption             / 1.45/
        GAMMA                                                            / 0.3 /
        DELTA   Annual rate of depreciation (percent)                    / 0.1 /
        WBP     world average backstop price in 2005[1.26] 2015          /1.198/
        ELOW    multiplier for the emission next year                    / 0.7 /
**  Climate circumstances in 2015 from DICE2016
        M0      Initial atmospheric concentration of CO2 (GTC)           /851/
        MU0     Initial concentration of CO2 in upper box (GTC)          /460/
        ML0     Initial concentration of CO2 in deep oceans (GTC)        /1740/
        TE0     Initial atmospheric temperature (deg C above preind)     /0.85/
        TL0     Initial temperature of deep oceans (deg C above preind)  /0.0068/
;
********************************************************************************
*****///////////             CHANGE 2 GDXXRW to SSP             ///////////*****
********************************************************************************

$CALL GDXXRW input_2015-2100.xlsx @Input_step5.txt
$GDXIN input_2015-2100.gdx

Sets N(*)    Reginal Breakdown
     VN(*)   Variable names
;
$LOAD N VN
Parameter INI_DATA(VN,N) Initial macroeconomic data;
$LOAD INI_DATA
Parameter POP_DATA(T,N) Population ;
$LOAD POP_DATA
Parameter SIG_DATA(T,N) Carbon Intensity;
$LOAD SIG_DATA
Parameter TFP_DATA(T,N) TFP;
$LOAD TFP_DATA
Parameter LU_DATA(T,N) Landuse;
$LOAD LU_DATA
$GDXIN

ALIAS   (N, J);
ALIAS   (T, S);


PARAMETERS
L(N,T)            Population (millions)
TFP(N,T)          Total factor productivity
SIGMA(N,T)        Emission-output ratio
BP(N,T)           National backstop price
LU(N,T)           Carbon emissions from land-use change (GTCO2 per year)
LB(T,N)
SWDF(T)           Social welfare discount factor
EXOGFORC(T)       Exogenous forcing (W per meter squared)
YEAR(T)

NUT1         Nash Utility of USA
NUT2         Nash Utility of RUS
NUT3         Nash Utility of JAP
NUT4         Nash Utility of CAN
NUT5         Nash Utility of UMB
NUT6         Nash Utility of EU
NUT7         Nash Utility of CHN
NUT8         Nash Utility of IND
NUT9         Nash Utility of BRZ
NUTa         Nash Utility of SAF
NUTb         Nash Utility of OECD
NUTc         Nash Utility of REF
NUTd         Nash Utility of ASIA
NUTe         Nash Utility of MAF
NUTf         Nash Utility of LAM
;

*///////////////////////////////////////////////////////////////////////////////
*******************Exogenesis Parameters-GAMMA L TFP SIGMA LU*******************
*///////////////////////////////////////////////////////////////////////////////

TFP(N,T)   = TFP_DATA(T,N);
SIGMA(N,T) = SIG_DATA(T,N);
L(N,T)     = POP_DATA(T,N);
LU(N,T)    = LU_DATA(T,N);

DISPLAY SIGMA,TFP;
*backstop for 1yr 0.995; 5yrs 0.975
BP(N,"1")   =  WBP * INI_DATA("NBPr",N);
LOOP(T,
BP(N,T+1)   =  0.1*BP(N,"1")+(BP(N,T)-0.1*BP(N,"1"))*0.975;
);

**nation welfare weight
LB(T,N) = 1;

**pure time preference
SWDF(t) = (1+srtp0/100)**(TSTEP*(1-ORD(T)));

**other GHG forcing
**regression using data from AGGI Table
EXOGFORC(T)=0.0289*ORD(T)+1.03818;

**provide an initial value for proxy nash utility in Linda Scenario
NUT1        =        ININUT;
NUT2        =        ININUT;
NUT3        =        ININUT;
NUT4        =        ININUT;
NUT5        =        ININUT;
NUT6        =        ININUT;
NUT7        =        ININUT;
NUT8        =        ININUT;
NUT9        =        ININUT;
NUTa        =        ININUT;
NUTb        =        ININUT;
NUTc        =        ININUT;
NUTd        =        ININUT;
NUTe        =        ININUT;
NUTf        =        ININUT;

INI_DATA("Dnd101","BRZ")=INI_DATA("Dnd101","BRZ")/10;
INI_DATA("Dnd102","BRZ")=INI_DATA("Dnd102","BRZ")/10;

VARIABLES
* Economic variables.
        YG(N,T)          Gross output   ($trillions per year)
        Y(N,T)           Output         ($trillions per year)
        PAbate(N,T)      Abatement      (fraction of GDP)
        PSLRI(N,T)     Damage         (fraction of GDP)
        PImpact(N,T)     Damage         (fraction of GDP)
        Abatement(N,T)   Abatement cost
        Impact(N,T)      damage cost

        K(N,T)           Capital stock   ($trillions per year)
        I(N,T)           Capital investment
        C(N,T)           Consumption
        MIU(N,T)         Emission control rates
        E(N,T)           Regional Carbon emission (GTC per Year)
        ES(T)            World aggregate CO2 emissions

* Climate variables.
        M(T)             Atmospheric concentration of carbon (GTC)
        MU(T)            Concentration of carbon in upper box (GTC)
        ML(T)            Concentration of carbon in deep oceans (GTC)
        F(T)             Radiative forcing
        TE(T)            Atmospheric temperature (deg C above preindustrial)
        TL(T)            Deep ocean temperature (deg C above preindustrial)

*  Maximand
        UT(N)            National Utility
        LDUT             National Utility
        UTILITY          Social welfare function
        UTILITY1         Social welfare function
        UTILITY2         Social welfare function
;
$include rice-nash-va.gms

POSITIVE VARIABLES C, Y, K, I, MIU, TE, TL, M, MU, ML, E, ES, ET, CA, TEMP;

*///////////////////////////////////////////////////////////////////////////////
*///////////////////////////////////////////////////////////////////////////////
************************************Equations***********************************
*///////////////////////////////////////////////////////////////////////////////
*///////////////////////////////////////////////////////////////////////////////


EQUATIONS
* Economy equations
        YYG(N,T)          Gross Output
        YY(N,T)           accounted GDP
        PABT(N,T)          Abatement fraction of GDP
*        PSLR(N,T)          SLR Damage fraction of GDP
        PIMP(N,T)          Damage fraction of GDP
        ABT(N,T)          Abatement cost
        IMP(N,T)          Damage cost
        KFIRST(N,T)       First period capital stock
        KK(N,T)           Capital accumulation equation
        KLAST(N,T)        Terminal condition of K
        CC(N,T)           Definition of consumption
        EE(N,T)           Industrial carbon emissions
*        ELB(N,T)          Industrial carbon emissions[lower bounds]
        EES(T)            World emissions

* Climate equations
        MFIRST(T)         First period atmospheric concentration
        MMAT(T)                        Atmospheric concentration
        MUFIRST(T)        First period upper box concentration
        MUMU(T)                        Upper box concentration
        MLFIRST(T)        First period deep ocean concentration
        MLML(T)                        Deep ocean concentration
        FF(T)             Radiative forcing
        TEFIRST(T)        First period temperature
        TTE(T)                         Temperature equation
        TLFIRST(T)        First period deep ocean temperature
        TLTL(T)                        Deep ocean temperature

**  Objective functions (to be scaled properly)
        OBJ              Objective function
        OBJJ             Objective function
        OBJJJ            Objective function
        LDOBJ            Objective function
;
**  //**------Choose the form of welfare function-------**//
*$include rice-nash-eq.gms
$include rice-nash-eq-LOG.gms


*** Nordhaus Damage function with //**------Para2010-------**// ***
YY(N,T)..               Y(N,T)        =E= YG(N,T)+Impact(N,T)-Abatement(N,T);
YYG(N,T)..              YG(N,T)       =E= TFP(N,T)*K(N,T)**GAMMA*L(N,T)**(1-GAMMA);
PABT(N,T)..             PAbate(N,T)   =E= BP(N,T)*SIGMA(N,T)/2.8*MIU(N,T)**2.8;
ABT(N,T)..              Abatement(N,T)=E= YG(N,T)*PAbate(N,T);


*///////////////////////////////////////////////////////////////////////////////
*** RICE                Damage function   aT+bT^2
*PIMP(N,T)..             PImpact(N,T)  =E= -(INI_DATA("Dnd101",N)*TE(T)+INI_DATA("Dnd102",N)*(TE(T)**2))/100;

*///////////////////////////////////////////////////////////////////////////////
*** Meta Damage function      //**--without interval--**//  Threshold = 0.13
PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("Dco1",N)*0.13+INI_DATA("Dco2",N)*(TE(T)-0.13);

*///////////////////////////////////////////////////////////////////////////////
*** Richard Tol [2009]  Damage function     aT+bT^2
*PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoTl1",N)*TE(T)+INI_DATA("DcoTl2",N)*TE(T)**2;

*///////////////////////////////////////////////////////////////////////////////
*** Nordhaus [Meta]     Damage function     aT^2
*PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoNd",N)*TE(T)**2;

*///////////////////////////////////////////////////////////////////////////////
*** Hope                Damage function     aT
*PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoHp",N)*TE(T);

*///////////////////////////////////////////////////////////////////////////////
*** Karp                Damage function     a+b*exp(T)
*PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoKr1",N)+INI_DATA("DcoKr2",N)*EXP(TE(T));

*///////////////////////////////////////////////////////////////////////////////
*** WeitzmanA           Damage function     a*T^2+b*T^6       [pre-trangular part
**PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoWzA1",N)*TE(T)**2+((10**7)*INI_DATA("DcoWzA2",N))*TE(T)**6;

*///////////////////////////////////////////////////////////////////////////////
*** WeitzmanB           Damage function     a*T^2+b*T^7
**PIMP(N,T)..             PImpact(N,T)  =E= INI_DATA("DcoWzB1",N)*TE(T)**2+INI_DATA("DcoWzB2",N)*TE(T)**7;


IMP(N,T)..              Impact(N,T)   =E= YG(N,T)*PImpact(N,T);



*** //**----- Long term investment and capital stock -------**// ***
CC(N,T)..               C(N,T)        =E= Y(N,T) - I(N,T);
KFIRST(N,"1")..         K(N,"1")      =E= INI_DATA("K0", N);
KK(N,T+1)..             K(N,T+1)      =E= (1-DELTA)**TSTEP*K(N,T)+TSTEP*I(N,T);
KLAST(N,TLAST)..        DELTA*K(N,TLAST) =G= I(N,TLAST);
EE(N,T)..               E(N,T)        =E= SIGMA(N,T)*(1-MIU(N,T))*YG(N,T)+LU(N,T);
** change bounds
*ELB(N,T+1)..            E(N,T+1)      =G= ELOW*E(N,T);
EES(T)..                ES(T)         =E= SUM(N,E(N,T));

*///////////////////////////////////////////////////////////////////////////////
*[DICE2016] emission-temperature change model  #total emission need to trans from GtCO2 to GtC#
*///////////////////////////////////////////////////////////////////////////////
MFIRST(TFIRST)..        M(TFIRST)  =E= M0;
MMAT(T+1)..             M(T+1)     =E= TSTEP*ES(T)*12/44+0.88*M(T)+0.196*MU(T);
MUFIRST(TFIRST)..       MU(TFIRST) =E= MU0;
MUMU(T+1)..             MU(T+1)    =E=             0.12*M(T)+0.797*MU(T)+0.001465*ML(T);
MLFIRST(TFIRST)..       ML(TFIRST) =E= ML0;
MLML(T+1)..             ML(T+1)    =E=                       0.007*MU(T)+0.998535*ML(T);

FF(T)..                 F(T) =E= 3.6813*LOG(M(T)/588)/LOG(2)+EXOGFORC(T);

TEFIRST(TFIRST)..       TE(TFIRST) =E= TE0;
TTE(T+1)..              TE(T+1)    =E= TE(T)+0.1005*(F(T+1)-(3.6813/3.1)*TE(T)-0.088*(TE(T)-TL(T)));
TLFIRST(TFIRST)..       TL(TFIRST) =E= TL0;
TLTL(T+1)..             TL(T+1)    =E= TL(T)+0.025*(TE(T)-TL(T));

OBJ..                   UTILITY  =E= Q* SUM((N,T), LB(T,N)*SWDF(T)*L(N,T)*LOG(C(N,T)/L(N,T)));
OBJJ..                  UTILITY1 =E= Q1*SUM((N,T), LB(T,N)*SWDF(T)*L(N,T)*LOG(C(N,T)/L(N,T)));
OBJJJ..                 UTILITY2 =E= Q2*SUM((N,T), LB(T,N)*SWDF(T)*L(N,T)*LOG(C(N,T)/L(N,T)));
LDOBJ..                 LDUT  =E= LOG(UT1-NUT1)+LOG(UT2-NUT2)+LOG(UT3-NUT3)+LOG(UT4-NUT4)+LOG(UT5-NUT5)+LOG(UT6-NUT6)+LOG(UT7-NUT7)+LOG(UT8-NUT8)
                                 +LOG(UT9-NUT9)+LOG(UTa-NUTa)+LOG(UTb-NUTb)+LOG(UTc-NUTc)+LOG(UTd-NUTd)+LOG(UTe-NUTe)+LOG(UTf-NUTf);

*///////////////////////////////////////////////////////////////////////////////
*******************************Upper and lower bounds***************************
*///////////////////////////////////////////////////////////////////////////////

K.LO(N,T) = 0.1*INI_DATA("K0", N);
Y.LO(N,T) = 0.8*INI_DATA("Y0", N);
I.LO(N,T) = 0.15*INI_DATA("Y0", N);
C.LO(N,T) = 0.4*INI_DATA("Y0", N);


MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);


M.LO(T)     = 0.5*M0;
MU.LO(T)    = 0.5*MU0;
ML.LO(T)    = 0.5*ML0;
TE.LO(T)    = 0.5*TE0;
TE.UP(T)    = 15;
TL.LO(T)    = 0.5*TL0;
TL.UP(T)    = 5;
E.LO(N,T)   = 0;



MODEL RICE /ALL/;

OPTION ITERLIM = 99999;
OPTION LIMROW = 0;
OPTION LIMCOL = 0;
OPTION SOLPRINT = ON;
OPTION RESLIM = 99999;

RICE.OPTFILE = 1;

SET
    ISER    Weight searching interation index  /1*5 /
    ITER    Nash loop                          /1*5 /
    SIT     Nash loop for region1-15           /1*20/

;

PARAMETERS

    CINTEN(N,T)   carbon intensity output
    KP(N,T)       capital price output
    EIE(ITER,SIT,N,T)
    MIE(ITER,SIT,N,T)
    SCC(N,T)
    ABTM(N,T)
    DMGM(N,T)
;

********************************************************************************
*****///////////     Equal Weight Solve  --  Negishi weight     ///////////*****
********************************************************************************
PARAMETERS

    CINTEN(N,T)
    KP(N,T)
    EIE(ITER,SIT,N,T)
    MIE(ITER,SIT,N,T)

** Negishi parameters
    FNKM(N,T)             first round national KK.M
    FWKM(T)               first round world KK.M
    NKM(ISER,N,T)         National marginal Capital
    WKM(ISER,T)           World average marginal K
    NWEI(ISER,N,T)        National adjusted weight
    WWEI(ISER,T)          World adjusted weight
    GAP(ISER,N,T)         Gap between nation weight and world average
    AVG(N)                Average 20 weight
    SM(ISER,T)

    NGDP(ISER,N,T)        Negishi adjusting GDP
    NSIG(ISER,N,T)        Negishi adjusting SIGMA
    NKP(ISER,N,T)         Negishi adjusting KK.M
    NE(ISER,N,T)          Negishi adjusting Emission
    NES(ISER,T)           Negishi adjusting World Emission
    NTE(ISER,T)           Negishi adjusting World Temperature
;

$include S-NegishiOptimal.gms

SCC(N,T) = -1000*EE.M(N,T)/(.00001+CC.M(N,T));
ABTM(N,T)= -1000*EE.M(N,T)/(.00001+ABT.M(N,T));
DMGM(N,T)=  1000*EE.M(N,T)/(.00001+IMP.M(N,T));

Execute_Unload 'result_2015-2100.gdx',SCC, ABTM, DMGM, MIU.L, Y.L, YG.L, Abatement.L, Impact.L, PAbate.L, PImpact.L, PSLRI.L,
C.L, I.L, K.L, ES.L, LU, E.L, M.L, MU.L, ML.L, F.L, ExogForc, TE.L, TL.L, LB;
Execute 'GDXXRW.EXE result_2015-2100.gdx @output_NGoptimal.txt';



********************************************************************************
*****///////////                 Nash Equilibrium               ///////////*****
********************************************************************************

**release the bounds
*M.LO(T)    = 0.5*M0;
*M.UP(T)    = 15000;

$include S-Nash-FX1.gms

* the SCC is stored in each national sub-solve

DISPLAY IMPACT.M,Abatement.M,IMPACT.M,Abatement.M,SCC;
Execute_Unload 'result_2015-2100.gdx', SCC, ABTM, DMGM, MIU.L, Y.L, YG.L, Abatement.L, Impact.L, PAbate.L, PImpact.L, PSLRI.L,
C.L, I.L, K.L, ES.L, LU, E.L, M.L, MU.L, ML.L, F.L, ExogForc, TE.L, TL.L;
Execute 'GDXXRW.EXE result_2015-2100.gdx @output_nash.txt';


