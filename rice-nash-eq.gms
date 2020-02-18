EQUATIONS
* Objective functions of individual regions

        OBJ1
        OBJ2
        OBJ3
        OBJ4
        OBJ5
        OBJ6
        OBJ7
        OBJ8
        OBJ9
        OBJa
        OBJb
        OBJc
        OBJd
        OBJe
        OBJf

        OBJ11
        OBJ22
        OBJ33
        OBJ44
        OBJ55
        OBJ66
        OBJ77
        OBJ88
        OBJ99
        OBJaa
        OBJbb
        OBJcc
        OBJdd
        OBJee
        OBJff

        OBJ111
        OBJ222
        OBJ333
        OBJ444
        OBJ555
        OBJ666
        OBJ777
        OBJ888
        OBJ999
        OBJaaa
        OBJbbb
        OBJccc
        OBJddd
        OBJeee
        OBJfff

        LOBJ111
        LOBJ222
        LOBJ333
        LOBJ444
        LOBJ555
        LOBJ666
        LOBJ777
        LOBJ888
        LOBJ999
        LOBJaaa
        LOBJbbb
        LOBJccc
        LOBJddd
        LOBJeee
        LOBJfff
;

*$ontext
* Objective functions for different solution procedures.
$ontext
OBJ1..                  UT1 =E= Q*SUM(T,SWDF(T)*L("USA",T)*(C("USA",T)/L("USA",T))**(1-ALPHA)/(1-ALPHA));
OBJ2..                  UT2 =E= Q*SUM(T,SWDF(T)*L("RUS",T)*(C("RUS",T)/L("RUS",T))**(1-ALPHA)/(1-ALPHA));
OBJ3..                  UT3 =E= Q*SUM(T,SWDF(T)*L("JAP",T)*(C("JAP",T)/L("JAP",T))**(1-ALPHA)/(1-ALPHA));
OBJ4..                  UT4 =E= Q*SUM(T,SWDF(T)*L("CAN",T)*(C("CAN",T)/L("CAN",T))**(1-ALPHA)/(1-ALPHA));
OBJ5..                  UT5 =E= Q*SUM(T,SWDF(T)*L("UMB",T)*(C("UMB",T)/L("UMB",T))**(1-ALPHA)/(1-ALPHA));
OBJ6..                  UT6 =E= Q*SUM(T,SWDF(T)*L("EU",T)*(C("EU",T)/L("EU",T))**(1-ALPHA)/(1-ALPHA));
OBJ7..                  UT7 =E= Q*SUM(T,SWDF(T)*L("CHN",T)*(C("CHN",T)/L("CHN",T))**(1-ALPHA)/(1-ALPHA));
OBJ8..                  UT8 =E= Q*SUM(T,SWDF(T)*L("IND",T)*(C("IND",T)/L("IND",T))**(1-ALPHA)/(1-ALPHA));
OBJ9..                  UT9 =E= Q*SUM(T,SWDF(T)*L("BRZ",T)*(C("BRZ",T)/L("BRZ",T))**(1-ALPHA)/(1-ALPHA));
OBJa..                  UTa =E= Q*SUM(T,SWDF(T)*L("SAF",T)*(C("SAF",T)/L("SAF",T))**(1-ALPHA)/(1-ALPHA));
OBJb..                  UTb =E= Q*SUM(T,SWDF(T)*L("OEU",T)*(C("OEU",T)/L("OEU",T))**(1-ALPHA)/(1-ALPHA));
OBJc..                  UTc =E= Q*SUM(T,SWDF(T)*L("REF",T)*(C("REF",T)/L("REF",T))**(1-ALPHA)/(1-ALPHA));
OBJd..                  UTd =E= Q*SUM(T,SWDF(T)*L("ASIA",T)*(C("ASIA",T)/L("ASIA",T))**(1-ALPHA)/(1-ALPHA));
OBJe..                  UTe =E= Q*SUM(T,SWDF(T)*L("MAF",T)*(C("MAF",T)/L("MAF",T))**(1-ALPHA)/(1-ALPHA));
OBJf..                  UTf =E= Q*SUM(T,SWDF(T)*L("LAM",T)*(C("LAM",T)/L("LAM",T))**(1-ALPHA)/(1-ALPHA));
$offtext

OBJ1..                  LUT1 =E= Q*SUM(T,SWDF(T)*L("USA",T)*(C("USA",T)/L("USA",T))**(1-ALPHA)/(1-ALPHA));
OBJ2..                  LUT2 =E= Q*SUM(T,SWDF(T)*L("RUS",T)*(C("RUS",T)/L("RUS",T))**(1-ALPHA)/(1-ALPHA));
OBJ3..                  LUT3 =E= Q*SUM(T,SWDF(T)*L("JAP",T)*(C("JAP",T)/L("JAP",T))**(1-ALPHA)/(1-ALPHA));
OBJ4..                  LUT4 =E= Q*SUM(T,SWDF(T)*L("CAN",T)*(C("CAN",T)/L("CAN",T))**(1-ALPHA)/(1-ALPHA));
OBJ5..                  LUT5 =E= Q*SUM(T,SWDF(T)*L("UMB",T)*(C("UMB",T)/L("UMB",T))**(1-ALPHA)/(1-ALPHA));
OBJ6..                  LUT6 =E= Q*SUM(T,SWDF(T)*L("EU",T)*(C("EU",T)/L("EU",T))**(1-ALPHA)/(1-ALPHA));
OBJ7..                  LUT7 =E= Q*SUM(T,SWDF(T)*L("CHN",T)*(C("CHN",T)/L("CHN",T))**(1-ALPHA)/(1-ALPHA));
OBJ8..                  LUT8 =E= Q*SUM(T,SWDF(T)*L("IND",T)*(C("IND",T)/L("IND",T))**(1-ALPHA)/(1-ALPHA));
OBJ9..                  LUT9 =E= Q*SUM(T,SWDF(T)*L("BRZ",T)*(C("BRZ",T)/L("BRZ",T))**(1-ALPHA)/(1-ALPHA));
OBJa..                  LUTa =E= Q*SUM(T,SWDF(T)*L("SAF",T)*(C("SAF",T)/L("SAF",T))**(1-ALPHA)/(1-ALPHA));
OBJb..                  LUTb =E= Q*SUM(T,SWDF(T)*L("OEU",T)*(C("OEU",T)/L("OEU",T))**(1-ALPHA)/(1-ALPHA));
OBJc..                  LUTc =E= Q*SUM(T,SWDF(T)*L("REF",T)*(C("REF",T)/L("REF",T))**(1-ALPHA)/(1-ALPHA));
OBJd..                  LUTd =E= Q*SUM(T,SWDF(T)*L("ASIA",T)*(C("ASIA",T)/L("ASIA",T))**(1-ALPHA)/(1-ALPHA));
OBJe..                  LUTe =E= Q*SUM(T,SWDF(T)*L("MAF",T)*(C("MAF",T)/L("MAF",T))**(1-ALPHA)/(1-ALPHA));
OBJf..                  LUTf =E= Q*SUM(T,SWDF(T)*L("LAM",T)*(C("LAM",T)/L("LAM",T))**(1-ALPHA)/(1-ALPHA));

OBJ11..                  UT11 =E= Q1*SUM(T,SWDF(T)*L("USA",T)*(C("USA",T)/L("USA",T))**(1-ALPHA)/(1-ALPHA));
OBJ22..                  UT22 =E= Q1*SUM(T,SWDF(T)*L("RUS",T)*(C("RUS",T)/L("RUS",T))**(1-ALPHA)/(1-ALPHA));
OBJ33..                  UT33 =E= Q1*SUM(T,SWDF(T)*L("JAP",T)*(C("JAP",T)/L("JAP",T))**(1-ALPHA)/(1-ALPHA));
OBJ44..                  UT44 =E= Q1*SUM(T,SWDF(T)*L("CAN",T)*(C("CAN",T)/L("CAN",T))**(1-ALPHA)/(1-ALPHA));
OBJ55..                  UT55 =E= Q1*SUM(T,SWDF(T)*L("UMB",T)*(C("UMB",T)/L("UMB",T))**(1-ALPHA)/(1-ALPHA));
OBJ66..                  UT66 =E= Q1*SUM(T,SWDF(T)*L("EU",T)*(C("EU",T)/L("EU",T))**(1-ALPHA)/(1-ALPHA));
OBJ77..                  UT77 =E= Q1*SUM(T,SWDF(T)*L("CHN",T)*(C("CHN",T)/L("CHN",T))**(1-ALPHA)/(1-ALPHA));
OBJ88..                  UT88 =E= Q1*SUM(T,SWDF(T)*L("IND",T)*(C("IND",T)/L("IND",T))**(1-ALPHA)/(1-ALPHA));
OBJ99..                  UT99 =E= Q1*SUM(T,SWDF(T)*L("BRZ",T)*(C("BRZ",T)/L("BRZ",T))**(1-ALPHA)/(1-ALPHA));
OBJaa..                  UTaa =E= Q1*SUM(T,SWDF(T)*L("SAF",T)*(C("SAF",T)/L("SAF",T))**(1-ALPHA)/(1-ALPHA));
OBJbb..                  UTbb =E= Q1*SUM(T,SWDF(T)*L("OEU",T)*(C("OEU",T)/L("OEU",T))**(1-ALPHA)/(1-ALPHA));
OBJcc..                  UTcc =E= Q1*SUM(T,SWDF(T)*L("REF",T)*(C("REF",T)/L("REF",T))**(1-ALPHA)/(1-ALPHA));
OBJdd..                  UTdd =E= Q1*SUM(T,SWDF(T)*L("ASIA",T)*(C("ASIA",T)/L("ASIA",T))**(1-ALPHA)/(1-ALPHA));
OBJee..                  UTee =E= Q1*SUM(T,SWDF(T)*L("MAF",T)*(C("MAF",T)/L("MAF",T))**(1-ALPHA)/(1-ALPHA));
OBJff..                  UTff =E= Q1*SUM(T,SWDF(T)*L("LAM",T)*(C("LAM",T)/L("LAM",T))**(1-ALPHA)/(1-ALPHA));

OBJ111..                  UT111 =E= Q2*SUM(T,SWDF(T)*L("USA",T)*(C("USA",T)/L("USA",T))**(1-ALPHA)/(1-ALPHA));
OBJ222..                  UT222 =E= Q2*SUM(T,SWDF(T)*L("RUS",T)*(C("RUS",T)/L("RUS",T))**(1-ALPHA)/(1-ALPHA));
OBJ333..                  UT333 =E= Q2*SUM(T,SWDF(T)*L("JAP",T)*(C("JAP",T)/L("JAP",T))**(1-ALPHA)/(1-ALPHA));
OBJ444..                  UT444 =E= Q2*SUM(T,SWDF(T)*L("CAN",T)*(C("CAN",T)/L("CAN",T))**(1-ALPHA)/(1-ALPHA));
OBJ555..                  UT555 =E= Q2*SUM(T,SWDF(T)*L("UMB",T)*(C("UMB",T)/L("UMB",T))**(1-ALPHA)/(1-ALPHA));
OBJ666..                  UT666 =E= Q2*SUM(T,SWDF(T)*L("EU",T)*(C("EU",T)/L("EU",T))**(1-ALPHA)/(1-ALPHA));
OBJ777..                  UT777 =E= Q2*SUM(T,SWDF(T)*L("CHN",T)*(C("CHN",T)/L("CHN",T))**(1-ALPHA)/(1-ALPHA));
OBJ888..                  UT888 =E= Q2*SUM(T,SWDF(T)*L("IND",T)*(C("IND",T)/L("IND",T))**(1-ALPHA)/(1-ALPHA));
OBJ999..                  UT999 =E= Q2*SUM(T,SWDF(T)*L("BRZ",T)*(C("BRZ",T)/L("BRZ",T))**(1-ALPHA)/(1-ALPHA));
OBJaaa..                  UTaaa =E= Q2*SUM(T,SWDF(T)*L("SAF",T)*(C("SAF",T)/L("SAF",T))**(1-ALPHA)/(1-ALPHA));
OBJbbb..                  UTbbb =E= Q2*SUM(T,SWDF(T)*L("OEU",T)*(C("OEU",T)/L("OEU",T))**(1-ALPHA)/(1-ALPHA));
OBJccc..                  UTccc =E= Q2*SUM(T,SWDF(T)*L("REF",T)*(C("REF",T)/L("REF",T))**(1-ALPHA)/(1-ALPHA));
OBJddd..                  UTddd =E= Q2*SUM(T,SWDF(T)*L("ASIA",T)*(C("ASIA",T)/L("ASIA",T))**(1-ALPHA)/(1-ALPHA));
OBJeee..                  UTeee =E= Q2*SUM(T,SWDF(T)*L("MAF",T)*(C("MAF",T)/L("MAF",T))**(1-ALPHA)/(1-ALPHA));
OBJfff..                  UTfff =E= Q2*SUM(T,SWDF(T)*L("LAM",T)*(C("LAM",T)/L("LAM",T))**(1-ALPHA)/(1-ALPHA));

LOBJ111..                  LUT1   =E= UT1;
LOBJ222..                  LUT2   =E= UT2;
LOBJ333..                  LUT3   =E= UT3;
LOBJ444..                  LUT4   =E= UT4;
LOBJ555..                  LUT5   =E= UT5;
LOBJ666..                  LUT6   =E= UT6;
LOBJ777..                  LUT7   =E= UT7;
LOBJ888..                  LUT8   =E= UT8;
LOBJ999..                  LUT9   =E= UT9;
LOBJaaa..                  LUTa   =E= UTa;
LOBJbbb..                  LUTb   =E= UTb;
LOBJccc..                  LUTc   =E= UTc;
LOBJddd..                  LUTd   =E= UTd;
LOBJeee..                  LUTe   =E= UTe;
LOBJfff..                  LUTf   =E= UTf;


*$offtext
