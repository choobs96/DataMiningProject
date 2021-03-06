*;
* IMPUTE VARIABLE: foreign_gross;
*;
format IMP_foreign_gross BEST12.0;
label IMP_foreign_gross = 'Imputed foreign_gross';
IMP_foreign_gross = foreign_gross;
if missing(IMP_foreign_gross) then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_foreign_gross = 'Predicted: foreign_gross';
label _WARN_ = 'Warnings';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 333570751 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
333570751 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 34467176 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 34467176 <= domestic_opening THEN DO;
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
IF NOT MISSING(total_gross ) AND
total_gross < 796064558 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
796064558 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 258063773.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 258063773.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 70742152 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 70742152 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 1173321529 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
1173321529 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 395635047 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 395635047 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 170075966 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 170075966 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 880817490.857143;
END;
ELSE DO;
P_foreign_gross = 624109284.166666;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 515453961 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
515453961 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 55022506.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 55022506.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 189581777 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 189581777 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( genre_ThrillMysSusp , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets ) THEN DO;
IF 41.5 <= markets THEN DO;
_BRANCH_ = 1;
END;
ELSE IF markets < 41.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 353959407.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 353959407.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 335637642;
END;
ELSE DO;
P_foreign_gross = 419185801.947368;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 152404433.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
152404433.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 60690117 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 60690117 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 468025168.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 468025168.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 434941024.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
434941024.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 216169234.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 216169234.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF 35091196.5 <= domestic_opening THEN DO;
_BRANCH_ = 1;
END;
ELSE IF domestic_opening < 35091196.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 255317758.166666;
END;
ELSE DO;
P_foreign_gross = 190317060.625;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 399948624.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
399948624.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 126919325 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 126919325 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(user_rating_count ) THEN DO;
IF user_rating_count < 30768.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 30768.5 <= user_rating_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 325340304.166666;
END;
ELSE DO;
P_foreign_gross = 257838707.947368;
END;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 128247981 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
128247981 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 72593391 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 72593391 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 22869188 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 22869188 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 203666326 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
203666326 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 119859607.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 119859607.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 27361133 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 27361133 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 124078576.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
124078576.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 39583096 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 39583096 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_count ) THEN DO;
IF ss_count < 272 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 272 <= ss_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 300840742.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
300840742.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF 92.5 <= runtime THEN DO;
_BRANCH_ = 1;
END;
ELSE IF runtime < 92.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 41681949 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 41681949 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 163640281.2;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 160000703 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
160000703 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets ) THEN DO;
IF markets < 51.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 51.5 <= markets THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF runtime < 116.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 116.5 <= runtime THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 73723519.2;
END;
ELSE DO;
P_foreign_gross = 116383937.857142;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 254051473 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
254051473 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 99563400 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 99563400 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 37657919 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 37657919 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 220220803.5;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 62515358.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
62515358.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 128511.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 128511.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF runtime < 69 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 69 <= runtime THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_foreign_gross = 187019588.833333;
END;
ELSE DO;
P_foreign_gross = 138509576.066666;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 66228219 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
66228219 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 20933293 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 20933293 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF 113 <= runtime THEN DO;
_BRANCH_ = 1;
END;
ELSE IF runtime < 113 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 14774067.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
14774067.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets ) THEN DO;
IF markets < 28.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 28.5 <= markets THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 104221 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 104221 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_foreign_gross = 165265229.666666;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 148375315.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
148375315.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_count ) THEN DO;
IF ss_count < 152.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 152.5 <= ss_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 152.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 152.5 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_foreign_gross = 91036847.6;
END;
ELSE DO;
P_foreign_gross = 120481953.352941;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 154981478.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
154981478.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 72079588.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 72079588.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF 102 <= runtime THEN DO;
_BRANCH_ = 1;
END;
ELSE IF runtime < 102 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 90542583 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
90542583 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 28578085 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 28578085 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets ) THEN DO;
IF 34.5 <= markets THEN DO;
_BRANCH_ = 1;
END;
ELSE IF markets < 34.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 29557019.4285714;
END;
ELSE DO;
P_foreign_gross = 63644394.7777777;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 86234027.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
86234027.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(runtime ) THEN DO;
IF 102 <= runtime THEN DO;
_BRANCH_ = 1;
END;
ELSE IF runtime < 102 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF ss_mean < 0.49457534246575 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.49457534246575 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_foreign_gross = 94398937;
END;
ELSE DO;
P_foreign_gross = 68659082.4166666;
END;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 46538116.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
46538116.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 26305165.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 26305165.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 9162834.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 9162834.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 76345104.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
76345104.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 40932449.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 40932449.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 14331840 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 14331840 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 42751451.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
42751451.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets_missing ) THEN DO;
_ARBFMT_12 = PUT( markets_missing , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 15421220 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 15421220 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( markets_missing , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_count ) THEN DO;
IF 115 <= ss_count THEN DO;
_BRANCH_ = 1;
END;
ELSE IF ss_count < 115 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF 115 <= tomatometer_count THEN DO;
_BRANCH_ = 1;
END;
ELSE IF tomatometer_count < 115 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 407424.307692307;
END;
ELSE DO;
P_foreign_gross = 15469435.125;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 20797517 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
20797517 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 148347 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 148347 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 47330282 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 47330282 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_foreign_gross = 45576413;
END;
ELSE DO;
P_foreign_gross = 25744922.5434782;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 37329873.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
37329873.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 11408116 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 11408116 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(genre_Action ) THEN DO;
_ARBFMT_12 = PUT( genre_Action , BEST12.);
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
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 10257345 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
10257345 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(markets ) THEN DO;
IF markets < 35 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 35 <= markets THEN DO;
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
P_foreign_gross = 89132353.375;
END;
ELSE DO;
P_foreign_gross = 64906873.3;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 83377559.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
83377559.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 125760294 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 125760294 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 30378703.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 30378703.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 10734996.875;
END;
ELSE DO;
P_foreign_gross = 46279609.8035714;
END;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 9468904.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
9468904.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 7468960 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 7468960 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 2608009.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 2608009.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 3486692.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
3486692.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 79490 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 79490 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(genre_ArthouseInter ) THEN DO;
_ARBFMT_12 = PUT( genre_ArthouseInter , BEST12.);
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
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 20732789 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
20732789 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(genre_FamilyKids ) THEN DO;
_ARBFMT_12 = PUT( genre_FamilyKids , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(ss_mean ) THEN DO;
IF ss_mean < 0.95658263305322 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 0.95658263305322 <= ss_mean THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 27615570.2962963;
END;
ELSE DO;
P_foreign_gross = 12990142.3275862;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(markets ) AND
markets < 24.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(markets ) AND
24.5 <= markets THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 18638757 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 18638757 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF 25468392.5 <= domestic_gross THEN DO;
_BRANCH_ = 1;
END;
ELSE IF domestic_gross < 25468392.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 11569691.1785714;
END;
ELSE DO;
P_foreign_gross = 4494244.40449438;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 2888328.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
2888328.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 2398226.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 2398226.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(tomatometer_count ) THEN DO;
IF tomatometer_count < 118.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 118.5 <= tomatometer_count THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(domestic_gross ) AND
domestic_gross < 2922219.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(domestic_gross ) AND
2922219.5 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 135276 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 135276 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(total_gross ) THEN DO;
IF total_gross < 7858367.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 7858367.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 1129605.81333333;
END;
ELSE DO;
P_foreign_gross = 4611556.21383647;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(total_gross ) AND
total_gross < 928632.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(total_gross ) AND
928632.5 <= total_gross THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_gross ) THEN DO;
IF domestic_gross < 810953 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 810953 <= domestic_gross THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(domestic_opening ) THEN DO;
IF domestic_opening < 282262.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 282262.5 <= domestic_opening THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_foreign_gross = 1162121.8442211;
END;
ELSE DO;
P_foreign_gross = 112683.306962025;
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
* ASSIGN VALUE TO: foreign_gross;
*;
IMP_foreign_gross = P_FOREIGN_GROSS;
END;
