* THE BEGINNING OF THE SEARCHING PROGRM.

*******/////////////////////////////////////////initial weight
*$ontext

MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

SOLVE RICE MAXIMIZING UTILITY  USING NLP;
SOLVE RICE MAXIMIZING UTILITY1 USING NLP;
SOLVE RICE MAXIMIZING UTILITY2 USING NLP;
SOLVE RICE MAXIMIZING UTILITY2 USING NLP;


FNKM(N,T)   = KK.M(N,T);
FNKM(N,"1") = FNKM(N,"2");

FWKM(T)     = SUM(N,1/FNKM(N,T))/15;
LB(T,N)     = (1/FNKM(N,T))/FWKM(T);

DISPLAY KK.M,FNKM,FWKM,LB,TFP,SIGMA;

LOOP(ISER,
**   solve the first round optimal (equal weight)

     MIU.LO(N,T) = 0;
     MIU.UP(N,T) = 1;
     MIU.FX(N,"1") = INI_DATA("MIU0",N);

     SOLVE RICE MAXIMIZING UTILITY  USING NLP;
     SOLVE RICE MAXIMIZING UTILITY1 USING NLP;
     SOLVE RICE MAXIMIZING UTILITY2 USING NLP;
     DISPLAY KK.M,FNKM,FWKM,LB;

     NGDP(ISER,N,T) = Y.L(N,T);
     NSIG(ISER,N,T) = E.L(N,T)/Y.L(N,T);
     NKP(ISER,N,T)  = KK.M(N,T);
     NE(ISER,N,T)   = E.L(N,T);
     NES(ISER,T)    = ES.L(T);
     NTE(ISER,T)    = TE.L(T);

*save marginal capital
     NKM(ISER,N,T)    = KK.M(N,T);
     NKM(ISER,N,"1")  = KK.M(N,"2");

*world average marginal capital
     WKM(ISER,T)      = SUM(N,NKM(ISER,N,T))/15;
*calculate the gap between nation and the world
     GAP(ISER,N,T)    = NKM(ISER,N,T)-WKM(ISER,T);
*adjust the weight
     NWEI("1",N,T)   = LB(T,N);
     NWEI(ISER+1,N,T) = NWEI(ISER,N,T)*(1-0.10*GAP(ISER,N,T)/WKM(ISER,T));
*     WWEI(ISER,T)    = SUM(N,NWEI(ISER,N,T))/15;


     LB(T,N)            = 15*NWEI(ISER,N,T)/SUM(J,NWEI(ISER,J,T));
*     LB(T,N)           = NWEI(ISER,N,T)/WKM(ISER,T);
     LB("1",N)         = LB("2",N);
     SM(ISER,T)        = SUM(N,LB(T,N));
);
*$offtext
*//////////////////////////////////////////////////////////////////////////////
**Optimal Case
     MIU.LO(N,T) = 0;
     MIU.UP(N,T) = 1;
     MIU.FX(N,"1") = INI_DATA("MIU0",N);

SOLVE RICE MAXIMIZING UTILITY USING NLP;
SOLVE RICE MAXIMIZING UTILITY USING NLP;
SOLVE RICE MAXIMIZING UTILITY1 USING NLP;
SOLVE RICE MAXIMIZING UTILITY1 USING NLP;
SOLVE RICE MAXIMIZING UTILITY2 USING NLP;

CINTEN(N,T) = E.L(N,T)/Y.L(N,T);
KP(N,T)     = KK.M(N,T);

DISPLAY SM;

*///////////////////////////////////////////////////////////////////////////////
$ontext
$eolcom #
Execute_Unload 'result-optimal.gdx', MIU.L, Y.L, YG.L, Abatement.L, Impact.L, PAbate.L, PImpact.L,
C.L, I.L, K.L, ES.L, LU, E.L, M.L, MU.L, ML.L, F.L, ExogForc, TE.L, TL.L,
ATFP, ASIG, TFP, SIGMA, AY, AE, Year;
Execute 'GDXXRW.EXE result-optimal.gdx @output_optimal.txt';
$offtext
