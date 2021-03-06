*;
* IMPUTE VARIABLE: domestic_opening;
*;
format IMP_domestic_opening BEST12.0;
label IMP_domestic_opening = 'Imputed domestic_opening';
IMP_domestic_opening = domestic_opening;
if missing(IMP_domestic_opening) then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_domestic_opening = 'Predicted: domestic_opening';
label _WARN_ = 'Warnings';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 211746763.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
211746763.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 609539041 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 609539041 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 362415006 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 362415006 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 404876001.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
404876001.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 1053086479 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1053086479 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 882114592 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 882114592 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 174478338;
END;
ELSE DO;
P_domestic_opening = 84695096.076923;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 44629108.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
44629108.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 94466223 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 94466223 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 55466006 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 55466006 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 308944051 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
308944051 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 177991695.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 177991695.5 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 110356419 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 110356419 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 152404433.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
152404433.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF 208722786.5 <= foreign_gross THEN DO;
_BRANCH_ = 1;
END;
ELSE IF foreign_gross < 208722786.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 469606267 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 469606267 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 49290865.1363636;
END;
ELSE DO;
P_domestic_opening = 34226591.5;
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( genre_DramaTele , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF runtime < 112.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 112.5 <= runtime THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF ss_mean < 0.67028985507246 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.67028985507246 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(ss_mean ) AND
ss_mean < 0.78655793025871 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(ss_mean ) AND
0.78655793025871 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_std ) THEN DO;
IF 0.41048958651352 <= ss_std THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_std < 0.41048958651352 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_p25 ) THEN DO;
IF ss_p25 < 0.625 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.625 <= ss_p25 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 8593660.83333333;
END;
ELSE DO;
P_domestic_opening = 19051679;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 132880741.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
132880741.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_count ) THEN DO;
IF ss_count < 439.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 439.5 <= ss_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF ss_mean < 0.94214876033057 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.94214876033057 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 40056058.8571428;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(foreign_gross ) AND
foreign_gross < 190677 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(foreign_gross ) AND
190677 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets_missing ) THEN DO;
_ARBFMT_12 = PUT( markets_missing , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 48896935.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 48896935.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_domestic_opening = 6582388.75;
END;
ELSE DO;
P_domestic_opening = 21547463.4583333;
END;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 14762629.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
14762629.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 28116744.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 28116744.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 18431774 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 18431774 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(ss_std ) AND
ss_std < 0.40204604052328 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(ss_std ) AND
0.40204604052328 <= ss_std THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF 0.79810426540284 <= ss_mean THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_mean < 0.79810426540284 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_p25 ) THEN DO;
IF 0.875 <= ss_p25 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_p25 < 0.875 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(ss_count ) AND
ss_count < 135 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(ss_count ) AND
135 <= ss_count THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 135 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 135 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(NR ) THEN DO;
_ARBFMT_12 = PUT( NR , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_domestic_opening = 6354422.15384615;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( genre_Comedy , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(genre_DramaTele ) THEN DO;
_ARBFMT_12 = PUT( genre_DramaTele , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF 39385973.5 <= domestic_gross THEN DO;
_BRANCH_ = 1;
END;
ELSE IF domestic_gross < 39385973.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_domestic_opening = 4345494.75;
END;
ELSE DO;
P_domestic_opening = 697694.68;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 34589536 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
34589536 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 10939519 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 10939519 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 24507662.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 24507662.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_domestic_opening = 4999623.25490196;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 21596662.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
21596662.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF 0.80719517449375 <= ss_mean THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_mean < 0.80719517449375 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 34775650.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 34775650.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_domestic_opening = 5880725.625;
END;
ELSE DO;
P_domestic_opening = 10921931.7582417;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 5749767.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
5749767.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 277 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 277 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(ss_p25 ) AND
ss_p25 < 0.25 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(ss_p25 ) AND
0.25 <= ss_p25 THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF ss_mean < 0.72836879432624 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.72836879432624 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_std ) THEN DO;
IF 0.43702028471427 <= ss_std THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_std < 0.43702028471427 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 1807763.34042553;
END;
ELSE DO;
P_domestic_opening = 3380107.53448275;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 1891899.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
1891899.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 145.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 145.5 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(foreign_gross ) THEN DO;
IF foreign_gross < 305546739.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 305546739.5 <= foreign_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(ss_mean ) AND
ss_mean < 0.7150974025974 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(ss_mean ) AND
0.7150974025974 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_std ) THEN DO;
IF 0.46216231162625 <= ss_std THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_std < 0.46216231162625 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_p25 ) THEN DO;
IF ss_p25 < 0.375 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.375 <= ss_p25 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 423898.252747252;
END;
ELSE DO;
P_domestic_opening = 1199077.61111111;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 904497 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
904497 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 163.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 163.5 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_count ) THEN DO;
IF ss_count < 163.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 163.5 <= ss_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_domestic_opening = 219165.172839506;
END;
ELSE DO;
P_domestic_opening = 14420.8646322378;
END;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: domestic_opening;
*;
IMP_domestic_opening = P_DOMESTIC_OPENING;
END;
