MIU.LO(N,T)   = 0;
MIU.UP(N,T)   = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

******////////////////////////////////////////////////////////////////////******
*************************** Calculate Nash Equilibrium *************************
******/////////////////////////////formua/////////////////////////////////******
LOOP(ITER,

* Calculating the reaction path of the 1st region.

E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);


MIE(ITER,"1",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 1)=MIE(ITER,"1",J,T);
EIE(ITER,"1",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 1)=EIE(ITER,"1",J,T);
SOLVE  RICE MAXIMIZING UT1 USING NLP;
SOLVE  RICE MAXIMIZING UT11 USING NLP;
SOLVE  RICE MAXIMIZING UT111 USING NLP;

SCC("USA",T) = -1000*EE.M("USA",T)/(.00001+CC.M("USA",T));
ABTM("USA",T)= -1000*EE.M("USA",T)/(.00001+ABT.M("USA",T));
DMGM("USA",T)= 1000*EE.M("USA",T)/(.00001+IMP.M("USA",T));

* Calculating the reaction path of the 2nd region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"2",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 2)=MIE(ITER,"2",J,T);
EIE(ITER,"2",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 2)=EIE(ITER,"2",J,T);
SOLVE RICE MAXIMIZING UT2 USING NLP;
SOLVE RICE MAXIMIZING UT22 USING NLP;
SOLVE RICE MAXIMIZING UT222 USING NLP;

SCC("RUS",T) = -1000*EE.M("RUS",T)/(.00001+CC.M("RUS",T));
ABTM("RUS",T)= -1000*EE.M("RUS",T)/(.00001+ABT.M("RUS",T));
DMGM("RUS",T)=  1000*EE.M("RUS",T)/(.00001+IMP.M("RUS",T));

* Calculating the reaction path of the 3rd region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"3",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 3)=MIE(ITER,"3",J,T);
EIE(ITER,"3",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 3)=EIE(ITER,"3",J,T);
SOLVE RICE MAXIMIZING UT3 USING NLP;
SOLVE RICE MAXIMIZING UT33 USING NLP;
SOLVE RICE MAXIMIZING UT333 USING NLP;

SCC("JAP",T) = -1000*EE.M("JAP",T)/(.00001+CC.M("JAP",T));
ABTM("JAP",T)= -1000*EE.M("JAP",T)/(.00001+ABT.M("JAP",T));
DMGM("JAP",T)=  1000*EE.M("JAP",T)/(.00001+IMP.M("JAP",T));

* Calculating the reaction path of the 4th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"4",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 4)=MIE(ITER,"4",J,T);
EIE(ITER,"4",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 4)=EIE(ITER,"4",J,T);
SOLVE RICE MAXIMIZING UT4 USING NLP;
SOLVE RICE MAXIMIZING UT44 USING NLP;
SOLVE RICE MAXIMIZING UT444 USING NLP;

SCC("CAN",T) = -1000*EE.M("CAN",T)/(.00001+CC.M("CAN",T));
ABTM("CAN",T)= -1000*EE.M("CAN",T)/(.00001+ABT.M("CAN",T));
DMGM("CAN",T)=  1000*EE.M("CAN",T)/(.00001+IMP.M("CAN",T));

* Calculating the reaction path of the 5th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"5",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 5)=MIE(ITER,"5",J,T);
EIE(ITER,"5",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 5)=EIE(ITER,"5",J,T);
SOLVE RICE MAXIMIZING UT5 USING NLP;
SOLVE RICE MAXIMIZING UT55 USING NLP;
SOLVE RICE MAXIMIZING UT555 USING NLP;

SCC("UMB",T) = -1000*EE.M("UMB",T)/(.00001+CC.M("UMB",T));
ABTM("UMB",T)= -1000*EE.M("UMB",T)/(.00001+ABT.M("UMB",T));
DMGM("UMB",T)=  1000*EE.M("UMB",T)/(.00001+IMP.M("UMB",T));

* Calculating the reaction path of the 6th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"6",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 6)=MIE(ITER,"6",J,T);
EIE(ITER,"6",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 6)=EIE(ITER,"6",J,T);
SOLVE RICE MAXIMIZING UT6 USING NLP;
SOLVE RICE MAXIMIZING UT66 USING NLP;
SOLVE RICE MAXIMIZING UT666 USING NLP;

SCC("EU",T) = -1000*EE.M("EU",T)/(.00001+CC.M("EU",T));
ABTM("EU",T)= -1000*EE.M("EU",T)/(.00001+ABT.M("EU",T));
DMGM("EU",T)=  1000*EE.M("EU",T)/(.00001+IMP.M("EU",T));

* Calculating the reaction path of the 7th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"7",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 7)=MIE(ITER,"7",J,T);
EIE(ITER,"7",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 7)=EIE(ITER,"7",J,T);
SOLVE RICE MAXIMIZING UT7 USING NLP;
SOLVE RICE MAXIMIZING UT77 USING NLP;
SOLVE RICE MAXIMIZING UT777 USING NLP;

SCC("CHN",T) = -1000*EE.M("CHN",T)/(.00001+CC.M("CHN",T));
ABTM("CHN",T)= -1000*EE.M("CHN",T)/(.00001+ABT.M("CHN",T));
DMGM("CHN",T)=  1000*EE.M("CHN",T)/(.00001+IMP.M("CHN",T));

* Calculating the reaction path of the 8th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"8",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 8)=MIE(ITER,"8",J,T);
EIE(ITER,"8",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 8)=EIE(ITER,"8",J,T);
SOLVE RICE MAXIMIZING UT8 USING NLP;
SOLVE RICE MAXIMIZING UT88 USING NLP;
SOLVE RICE MAXIMIZING UT888 USING NLP;

SCC("IND",T) = -1000*EE.M("IND",T)/(.00001+CC.M("IND",T));
ABTM("IND",T)= -1000*EE.M("IND",T)/(.00001+ABT.M("IND",T));
DMGM("IND",T)=  1000*EE.M("IND",T)/(.00001+IMP.M("IND",T));

* Calculating the reaction path of the 9th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"9",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 9)=MIE(ITER,"9",J,T);
EIE(ITER,"9",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 9)=EIE(ITER,"9",J,T);
SOLVE RICE MAXIMIZING UT9 USING NLP;
SOLVE RICE MAXIMIZING UT99 USING NLP;
SOLVE RICE MAXIMIZING UT999 USING NLP;

SCC("BRZ",T) = -1000*EE.M("BRZ",T)/(.00001+CC.M("BRZ",T));
ABTM("BRZ",T)= -1000*EE.M("BRZ",T)/(.00001+ABT.M("BRZ",T));
DMGM("BRZ",T)=  1000*EE.M("BRZ",T)/(.00001+IMP.M("BRZ",T));

* Calculating the reaction path of the 10th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"10",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 10)=MIE(ITER,"10",J,T);
EIE(ITER,"10",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 10)=EIE(ITER,"10",J,T);
SOLVE RICE MAXIMIZING UTa USING NLP;
SOLVE RICE MAXIMIZING UTaa USING NLP;
SOLVE RICE MAXIMIZING UTaaa USING NLP;

SCC("SAF",T) = -1000*EE.M("SAF",T)/(.00001+CC.M("SAF",T));
ABTM("SAF",T)= -1000*EE.M("SAF",T)/(.00001+ABT.M("SAF",T));
DMGM("SAF",T)=  1000*EE.M("SAF",T)/(.00001+IMP.M("SAF",T));

* Calculating the reaction path of the 11th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"11",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 11)=MIE(ITER,"11",J,T);
EIE(ITER,"11",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 11)=EIE(ITER,"11",J,T);
SOLVE RICE MAXIMIZING UTb USING NLP;
SOLVE RICE MAXIMIZING UTbb USING NLP;
SOLVE RICE MAXIMIZING UTbbb USING NLP;

SCC("OEU",T) = -1000*EE.M("OEU",T)/(.00001+CC.M("OEU",T));
ABTM("OEU",T)= -1000*EE.M("OEU",T)/(.00001+ABT.M("OEU",T));
DMGM("OEU",T)=  1000*EE.M("OEU",T)/(.00001+IMP.M("OEU",T));

* Calculating the reaction path of the 12th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"12",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 12)=MIE(ITER,"12",J,T);
EIE(ITER,"12",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 12)=EIE(ITER,"12",J,T);
SOLVE RICE MAXIMIZING UTc USING NLP;
SOLVE RICE MAXIMIZING UTcc USING NLP;
SOLVE RICE MAXIMIZING UTccc USING NLP;

SCC("REF",T) = -1000*EE.M("REF",T)/(.00001+CC.M("REF",T));
ABTM("REF",T)= -1000*EE.M("REF",T)/(.00001+ABT.M("REF",T));
DMGM("REF",T)=  1000*EE.M("REF",T)/(.00001+IMP.M("REF",T));

* Calculating the reaction path of the 13th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"13",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 13)=MIE(ITER,"13",J,T);
EIE(ITER,"13",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 13)=EIE(ITER,"13",J,T);
SOLVE RICE MAXIMIZING UTd USING NLP;
SOLVE RICE MAXIMIZING UTdd USING NLP;
SOLVE RICE MAXIMIZING UTddd USING NLP;

SCC("ASIA",T) = -1000*EE.M("ASIA",T)/(.00001+CC.M("ASIA",T));
ABTM("ASIA",T)= -1000*EE.M("ASIA",T)/(.00001+ABT.M("ASIA",T));
DMGM("ASIA",T)=  1000*EE.M("ASIA",T)/(.00001+IMP.M("ASIA",T));

* Calculating the reaction path of the 14th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"14",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 14)=MIE(ITER,"14",J,T);
EIE(ITER,"14",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 14)=EIE(ITER,"14",J,T);
SOLVE RICE MAXIMIZING UTe USING NLP;
SOLVE RICE MAXIMIZING UTee USING NLP;
SOLVE RICE MAXIMIZING UTeee USING NLP;

SCC("MAF",T) = -1000*EE.M("MAF",T)/(.00001+CC.M("MAF",T));
ABTM("MAF",T)= -1000*EE.M("MAF",T)/(.00001+ABT.M("MAF",T));
DMGM("MAF",T)=  1000*EE.M("MAF",T)/(.00001+IMP.M("MAF",T));

* Calculating the reaction path of the 15th region.

*E.LO(N,T) = 0.1;
E.LO(N,T) = 0;
E.UP(N,T) = 100;
MIU.LO(N,T) = 0;
MIU.UP(N,T) = 1;
MIU.FX(N,"1") = INI_DATA("MIU0",N);

MIE(ITER,"15",N,T)=MIU.L(N,T);
MIU.FX(J,T)$(ORD(J) NE 15)=MIE(ITER,"15",J,T);
EIE(ITER,"15",N,T)=E.L(N,T);
E.FX(J,T)$(ORD(J) NE 15)=EIE(ITER,"15",J,T);
SOLVE RICE MAXIMIZING UTf USING NLP;
SOLVE RICE MAXIMIZING UTff USING NLP;
SOLVE RICE MAXIMIZING UTfff USING NLP;

SCC("LAM",T) = -1000*EE.M("LAM",T)/(.00001+CC.M("LAM",T));
ABTM("LAM",T)= -1000*EE.M("LAM",T)/(.00001+ABT.M("LAM",T));
DMGM("LAM",T)=  1000*EE.M("LAM",T)/(.00001+IMP.M("LAM",T));



DISPLAY MIU.L,Y.L,TFP,K.L,GAMMA,I.L,E.L,abatement.L,Impact.L,TE.L,ES.L;
*$include Adjusted.gms

* Reset for the next iteration.
MIE(ITER,"16",N,T)=MIU.L(N,T);
EIE(ITER,"16",N,T)=E.L(N,T);
MIE(ITER+1,"1",N,T)=MIE(ITER,"16",N,T);
EIE(ITER+1,"1",N,T)=EIE(ITER,"16",N,T);

);




