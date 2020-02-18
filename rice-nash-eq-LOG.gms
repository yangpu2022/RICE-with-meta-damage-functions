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

OBJ1..      LUT1  =E=  Q*SUM(T,SWDF(T)*L("USA",T)*LOG(C("USA",T)/L("USA",T)));
OBJ2..      LUT2  =E=  Q*SUM(T,SWDF(T)*L("RUS",T)*LOG(C("RUS",T)/L("RUS",T)));
OBJ3..      LUT3  =E=  Q*SUM(T,SWDF(T)*L("JAP",T)*LOG(C("JAP",T)/L("JAP",T)));
OBJ4..      LUT4  =E=  Q*SUM(T,SWDF(T)*L("CAN",T)*LOG(C("CAN",T)/L("CAN",T)));
OBJ5..      LUT5  =E=  Q*SUM(T,SWDF(T)*L("UMB",T)*LOG(C("UMB",T)/L("UMB",T)));
OBJ6..      LUT6  =E=  Q*SUM(T,SWDF(T)*L("EU",T)*LOG(C("EU",T)/L("EU",T)));
OBJ7..      LUT7  =E=  Q*SUM(T,SWDF(T)*L("CHN",T)*LOG(C("CHN",T)/L("CHN",T)));
OBJ8..      LUT8  =E=  Q*SUM(T,SWDF(T)*L("IND",T)*LOG(C("IND",T)/L("IND",T)));
OBJ9..      LUT9  =E=  Q*SUM(T,SWDF(T)*L("BRZ",T)*LOG(C("BRZ",T)/L("BRZ",T)));
OBJa..      LUTa  =E=  Q*SUM(T,SWDF(T)*L("SAF",T)*LOG(C("SAF",T)/L("SAF",T)));
OBJb..      LUTb  =E=  Q*SUM(T,SWDF(T)*L("OEU",T)*LOG(C("OEU",T)/L("OEU",T)));
OBJc..      LUTc  =E=  Q*SUM(T,SWDF(T)*L("REF",T)*LOG(C("REF",T)/L("REF",T)));
OBJd..      LUTd  =E=  Q*SUM(T,SWDF(T)*L("ASIA",T)*LOG(C("ASIA",T)/L("ASIA",T)));
OBJe..      LUTe  =E=  Q*SUM(T,SWDF(T)*L("MAF",T)*LOG(C("MAF",T)/L("MAF",T)));
OBJf..      LUTf  =E=  Q*SUM(T,SWDF(T)*L("LAM",T)*LOG(C("LAM",T)/L("LAM",T)));

OBJ11..      UT11  =E=  Q1*SUM(T,SWDF(T)*L("USA",T)*LOG(C("USA",T)/L("USA",T)));
OBJ22..      UT22  =E=  Q1*SUM(T,SWDF(T)*L("RUS",T)*LOG(C("RUS",T)/L("RUS",T)));
OBJ33..      UT33  =E=  Q1*SUM(T,SWDF(T)*L("JAP",T)*LOG(C("JAP",T)/L("JAP",T)));
OBJ44..      UT44  =E=  Q1*SUM(T,SWDF(T)*L("CAN",T)*LOG(C("CAN",T)/L("CAN",T)));
OBJ55..      UT55  =E=  Q1*SUM(T,SWDF(T)*L("UMB",T)*LOG(C("UMB",T)/L("UMB",T)));
OBJ66..      UT66  =E=  Q1*SUM(T,SWDF(T)*L("EU",T)*LOG(C("EU",T)/L("EU",T)));
OBJ77..      UT77  =E=  Q1*SUM(T,SWDF(T)*L("CHN",T)*LOG(C("CHN",T)/L("CHN",T)));
OBJ88..      UT88  =E=  Q1*SUM(T,SWDF(T)*L("IND",T)*LOG(C("IND",T)/L("IND",T)));
OBJ99..      UT99  =E=  Q1*SUM(T,SWDF(T)*L("BRZ",T)*LOG(C("BRZ",T)/L("BRZ",T)));
OBJaa..      UTaa  =E=  Q1*SUM(T,SWDF(T)*L("SAF",T)*LOG(C("SAF",T)/L("SAF",T)));
OBJbb..      UTbb  =E=  Q1*SUM(T,SWDF(T)*L("OEU",T)*LOG(C("OEU",T)/L("OEU",T)));
OBJcc..      UTcc  =E=  Q1*SUM(T,SWDF(T)*L("REF",T)*LOG(C("REF",T)/L("REF",T)));
OBJdd..      UTdd  =E=  Q1*SUM(T,SWDF(T)*L("ASIA",T)*LOG(C("ASIA",T)/L("ASIA",T)));
OBJee..      UTee  =E=  Q1*SUM(T,SWDF(T)*L("MAF",T)*LOG(C("MAF",T)/L("MAF",T)));
OBJff..      UTff  =E=  Q1*SUM(T,SWDF(T)*L("LAM",T)*LOG(C("LAM",T)/L("LAM",T)));

OBJ111..      UT111  =E=  Q2*SUM(T,SWDF(T)*L("USA",T)*LOG(C("USA",T)/L("USA",T)));
OBJ222..      UT222  =E=  Q2*SUM(T,SWDF(T)*L("RUS",T)*LOG(C("RUS",T)/L("RUS",T)));
OBJ333..      UT333  =E=  Q2*SUM(T,SWDF(T)*L("JAP",T)*LOG(C("JAP",T)/L("JAP",T)));
OBJ444..      UT444  =E=  Q2*SUM(T,SWDF(T)*L("CAN",T)*LOG(C("CAN",T)/L("CAN",T)));
OBJ555..      UT555  =E=  Q2*SUM(T,SWDF(T)*L("UMB",T)*LOG(C("UMB",T)/L("UMB",T)));
OBJ666..      UT666  =E=  Q2*SUM(T,SWDF(T)*L("EU",T)*LOG(C("EU",T)/L("EU",T)));
OBJ777..      UT777  =E=  Q2*SUM(T,SWDF(T)*L("CHN",T)*LOG(C("CHN",T)/L("CHN",T)));
OBJ888..      UT888  =E=  Q2*SUM(T,SWDF(T)*L("IND",T)*LOG(C("IND",T)/L("IND",T)));
OBJ999..      UT999  =E=  Q2*SUM(T,SWDF(T)*L("BRZ",T)*LOG(C("BRZ",T)/L("BRZ",T)));
OBJaaa..      UTaaa  =E=  Q2*SUM(T,SWDF(T)*L("SAF",T)*LOG(C("SAF",T)/L("SAF",T)));
OBJbbb..      UTbbb  =E=  Q2*SUM(T,SWDF(T)*L("OEU",T)*LOG(C("OEU",T)/L("OEU",T)));
OBJccc..      UTccc  =E=  Q2*SUM(T,SWDF(T)*L("REF",T)*LOG(C("REF",T)/L("REF",T)));
OBJddd..      UTddd  =E=  Q2*SUM(T,SWDF(T)*L("ASIA",T)*LOG(C("ASIA",T)/L("ASIA",T)));
OBJeee..      UTeee  =E=  Q2*SUM(T,SWDF(T)*L("MAF",T)*LOG(C("MAF",T)/L("MAF",T)));
OBJfff..      UTfff  =E=  Q2*SUM(T,SWDF(T)*L("LAM",T)*LOG(C("LAM",T)/L("LAM",T)));

LOBJ111..      LUT1  =E=  UT1;
LOBJ222..      LUT2  =E=  UT2;
LOBJ333..      LUT3  =E=  UT3;
LOBJ444..      LUT4  =E=  UT4;
LOBJ555..      LUT5  =E=  UT5;
LOBJ666..      LUT6  =E=  UT6;
LOBJ777..      LUT7  =E=  UT7;
LOBJ888..      LUT8  =E=  UT8;
LOBJ999..      LUT9  =E=  UT9;
LOBJaaa..      LUTa  =E=  UTa;
LOBJbbb..      LUTb  =E=  UTb;
LOBJccc..      LUTc  =E=  UTc;
LOBJddd..      LUTd  =E=  UTd;
LOBJeee..      LUTe  =E=  UTe;
LOBJfff..      LUTf  =E=  UTf;

