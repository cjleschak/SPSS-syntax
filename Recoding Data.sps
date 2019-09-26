DATASET ACTIVATE DataSet1.

*Variable names appended with R are reverse-scored.
*Variable names appended with 2 are sums; those not 
*appended are averages (also see variable label).


*Recoded PBI from raw dataset b/c it was coded unintuitive direction (e.g. very much was 0 and very little was 3).
RECODE PBI_M_1 to PBI_M_25 PBI_F_1 to PBI_F_25 (0=3) (1=2) (2=1) (3=0).
EXECUTE.


*----------------------------------------------.
*Social Provisions Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.

*  RECODE oldVariableName1 oldVariableName2 (oldValue1=newValue1) (oldValue2=newValue2) INTO 
*  newVariableName1 newVariableName2.
*  VARIABLE LABELS newVariableName1 'newVariableLabel1' /newVariableName2 'newVariableLabel2'.
*  EXECUTE.

RECODE SPS_3 SPS_19 SPS_6 SPS_9 SPS_14 SPS_22 SPS_2 SPS_21 SPS_15 SPS_24 SPS_10 SPS_18 
    (1=4) (2=3) (3=2) (4=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    SPS_3R SPS_19R SPS_6R SPS_9R SPS_14R SPS_22R SPS_2R SPS_21R SPS_15R SPS_24R SPS_10R SPS_18R.
VARIABLE LABELS  
    SPS_3R 'SPS_3 reverse-coded' 
    /SPS_19R 'SPS_19 reverse-coded' 
    /SPS_6R 'SPS_6 reverse-coded' 
    /SPS_9R 'SPS_9 reverse-coded' 
    /SPS_14R 'SPS_14 reverse-coded' 
    /SPS_22R 'SPS_22 reverse-coded' 
    /SPS_2R 'SPS_2 reverse-coded' 
    /SPS_21R 'SPS_21 reverse-coded' 
    /SPS_15R 'SPS_15 reverse-coded' 
    /SPS_24R 'SPS_24 reverse-coded' 
    /SPS_10R 'SPS_10 reverse-coded' 
    /SPS_18R 'SPS_18 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT SPS_3R to SPS_18R (F3.0).
VALUE LABELS
SPS_3R to SPS_18R
1 'strongly agree'
2 'agree'
3 'disagree'
4 'strongly disagree'.
EXECUTE.



*3) Compute scales.
*For subjects that have missing data, note that this will still calculate the scales for them, but will 
*calculate the average out of those values the subject does have.

*  COMPUTE newVariableName = formula.
*  VARIABLE LABELS newVariableName 'newVariableLabel'.

*Total SPS.
COMPUTE SPS_total=MEAN(SPS_1, SPS_2R, SPS_3R, SPS_4, SPS_5, SPS_6R, SPS_7, SPS_8, SPS_9R, 
    SPS_10R, SPS_11, SPS_12, SPS_13, SPS_14R, SPS_15R, SPS_16, SPS_17, SPS_18R, SPS_19R, 
    SPS_20, SPS_21R, SPS_22R, SPS_23, SPS_24R).
VARIABLE LABELS  SPS_total 'Total score on SPS (higher scores = more support received) (average)'.
EXECUTE.
COMPUTE SPS_total2=sum(SPS_1, SPS_2R, SPS_3R, SPS_4, SPS_5, SPS_6R, SPS_7, SPS_8, SPS_9R, 
    SPS_10R, SPS_11, SPS_12, SPS_13, SPS_14R, SPS_15R, SPS_16, SPS_17, SPS_18R, SPS_19R, 
    SPS_20, SPS_21R, SPS_22R, SPS_23, SPS_24R).
VARIABLE LABELS  SPS_total2 'Total score on SPS (higher scores = more support received) (sum)'.
EXECUTE.
FORMAT SPS_total2(F3.0).

*Guidance SPS.
COMPUTE SPS_guid=MEAN(SPS_3R, SPS_12, SPS_16, SPS_19R).
VARIABLE LABELS  SPS_guid 'Guidance score on SPS (higher scores = more guidance received) (average)'.
EXECUTE.
COMPUTE SPS_guid2=sum(SPS_3R, SPS_12, SPS_16, SPS_19R).
VARIABLE LABELS  SPS_guid2 'Guidance score on SPS (higher scores = more guidance received) (sum)'.
EXECUTE.
FORMAT SPS_guid2(F3.0).

*Reassurance of Worth SPS.
COMPUTE SPS_worth=MEAN(SPS_6R, SPS_9R, SPS_13, SPS_20).
VARIABLE LABELS  SPS_worth 'Reassurance of Worth score on SPS (higher scores = more reassurance of worth received) (average)'.
EXECUTE.
COMPUTE SPS_worth2=sum(SPS_6R, SPS_9R, SPS_13, SPS_20).
VARIABLE LABELS  SPS_worth2 'Reassurance of Worth score on SPS (higher scores = more reassurance of worth received) (sum)'.
EXECUTE.
FORMAT SPS_worth2(F3.0).

*Social Integration SPS.
COMPUTE SPS_soc=MEAN(SPS_5, SPS_8, SPS_14R, SPS_22R).
VARIABLE LABELS  SPS_soc 'Social Integration score on SPS (higher scores = more social integration) (average)'.
EXECUTE.
COMPUTE SPS_soc2=sum(SPS_5, SPS_8, SPS_14R, SPS_22R).
VARIABLE LABELS  SPS_soc2 'Social Integration score on SPS (higher scores = more social integration) (sum)'.
EXECUTE.
FORMAT SPS_soc2(F3.0).

*Attachment SPS.
COMPUTE SPS_att=MEAN(SPS_2R, SPS_11, SPS_17, SPS_21R).
VARIABLE LABELS  SPS_att 'Attachment score on SPS (higher scores = more attachment) (average)'.
EXECUTE.
COMPUTE SPS_att2=sum(SPS_2R, SPS_11, SPS_17, SPS_21R).
VARIABLE LABELS  SPS_att2 'Attachment score on SPS (higher scores = more attachment) (sum)'.
EXECUTE.
FORMAT SPS_att2(F3.0).

*Nurturance SPS.
COMPUTE SPS_nurt=MEAN(SPS_4, SPS_7, SPS_15R, SPS_24R).
VARIABLE LABELS  SPS_nurt 'Nurturance score on SPS (higher scores = more nurturance received) (average)'.
EXECUTE.
COMPUTE SPS_nurt2=sum(SPS_4, SPS_7, SPS_15R, SPS_24R).
VARIABLE LABELS  SPS_nurt2 'Nurturance score on SPS (higher scores = more nurturance received) (sum)'.
EXECUTE.
FORMAT SPS_nurt2(F3.0).

*Reliable Alliance SPS.
COMPUTE SPS_alli=MEAN(SPS_1, SPS_10R, SPS_18R, SPS_23).
VARIABLE LABELS  SPS_alli 'Reliable Alliance score on SPS (higher scores = more reliable alliances) (average)'.
EXECUTE.
COMPUTE SPS_alli2=sum(SPS_1, SPS_10R, SPS_18R, SPS_23).
VARIABLE LABELS  SPS_alli2 'Reliable Alliance score on SPS (higher scores = more reliable alliances) (sum)'.
EXECUTE.
FORMAT SPS_alli2(F3.0).



*----------------------------------------------.
*UCLA Loneliness Scale.
*----------------------------------------------.

*1) Creating reverse-coded variables.
RECODE 
    UCLA_1 UCLA_5 UCLA_6 UCLA_9 UCLA_10 UCLA_15 UCLA_16 UCLA_19 UCLA_20 
    (1=4) (2=3) (3=2) (4=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    UCLA_1R UCLA_5R UCLA_6R UCLA_9R UCLA_10R UCLA_15R UCLA_16R UCLA_19R UCLA_20R.
VARIABLE LABELS  
    UCLA_1R 'UCLA_1 reverse-coded' 
    /UCLA_5R 'UCLA_5 reverse-coded' 
    /UCLA_6R 'UCLA_6 reverse-coded' 
    /UCLA_9R 'UCLA_9 reverse-coded' 
    /UCLA_10R 'UCLA_10 reverse-coded' 
    /UCLA_15R 'UCLA_15 reverse-coded' 
    /UCLA_16R 'UCLA_16 reverse-coded' 
    /UCLA_19R 'UCLA_19 reverse-coded' 
    /UCLA_20R 'UCLA_20 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT UCLA_1R to UCLA_20R (F3.0).
VALUE LABELS
UCLA_1R to UCLA_20R
1 'always'
2 'sometimes'
3 'rarely'
4 'never'.
EXECUTE.

*3) Compute scales.

*Total UCLA Loneliness (AVG).
COMPUTE UCLA_total=MEAN(UCLA_1R, UCLA_2, UCLA_3, UCLA_4, UCLA_5R, UCLA_6R, 
    UCLA_7, UCLA_8, UCLA_9R, UCLA_10R, UCLA_11, UCLA_12, UCLA_13, UCLA_14,
    UCLA_15R, UCLA_16R, UCLA_17, UCLA_18, UCLA_19R, UCLA_20R).
VARIABLE LABELS  UCLA_total 'Total score on UCLA Loneliness Scale (higher scores = more loneliness) (average)'.
EXECUTE.
COMPUTE UCLA_total2=sum(UCLA_1R, UCLA_2, UCLA_3, UCLA_4, UCLA_5R, UCLA_6R, 
    UCLA_7, UCLA_8, UCLA_9R, UCLA_10R, UCLA_11, UCLA_12, UCLA_13, UCLA_14,
    UCLA_15R, UCLA_16R, UCLA_17, UCLA_18, UCLA_19R, UCLA_20R).
VARIABLE LABELS  UCLA_total2 'Total score on UCLA Loneliness Scale (higher scores = more loneliness) (sum)'.
EXECUTE.
FORMAT UCLA_total2 (F3.0).

*----------------------------------------------.
*Two-Way Social Support Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
**N/A for this scale.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
**N/A for this scale.

*3) Compute scales.
*Total Two-Way Social Support Score.
COMPUTE TWSSS_total=MEAN(TWSSS_1, TWSSS_2, TWSSS_3, TWSSS_4, TWSSS_5, TWSSS_6, TWSSS_7, 
    TWSSS_8, TWSSS_9, TWSSS_10, TWSSS_11, TWSSS_12, TWSSS_13, TWSSS_14, TWSSS_15, 
    TWSSS_16, TWSSS_17, TWSSS_18, TWSSS_19, TWSSS_20, TWSSS_21).
VARIABLE LABELS  TWSSS_total 'Total score on Two-Way Social Support Scale (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_total2=sum(TWSSS_1, TWSSS_2, TWSSS_3, TWSSS_4, TWSSS_5, TWSSS_6, TWSSS_7, 
    TWSSS_8, TWSSS_9, TWSSS_10, TWSSS_11, TWSSS_12, TWSSS_13, TWSSS_14, TWSSS_15, 
    TWSSS_16, TWSSS_17, TWSSS_18, TWSSS_19, TWSSS_20, TWSSS_21).
VARIABLE LABELS  TWSSS_total2 'Total score on Two-Way Social Support Scale (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_total2 (F3.0).

*Giving  Support Score.
COMPUTE TWSSS_giv=MEAN(TWSSS_2, TWSSS_9, TWSSS_12, TWSSS_17, TWSSS_20, TWSSS_3, TWSSS_7, 
    TWSSS_14, TWSSS_19, TWSSS_21).
VARIABLE LABELS  TWSSS_giv 'Giving  Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_giv2=sum(TWSSS_2, TWSSS_9, TWSSS_12, TWSSS_17, TWSSS_20, TWSSS_3, TWSSS_7, 
    TWSSS_14, TWSSS_19, TWSSS_21).
VARIABLE LABELS  TWSSS_giv2 'Giving  Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_giv2 (F3.0).

*Receiving Support Score.
COMPUTE TWSSS_rec=MEAN(TWSSS_5, TWSSS_8, TWSSS_11, TWSSS_15, TWSSS_1, TWSSS_4, TWSSS_6, 
    TWSSS_10, TWSSS_13, TWSSS_16, TWSSS_18).
VARIABLE LABELS  TWSSS_rec 'Receiving Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_rec2=sum(TWSSS_5, TWSSS_8, TWSSS_11, TWSSS_15, TWSSS_1, TWSSS_4, TWSSS_6, 
    TWSSS_10, TWSSS_13, TWSSS_16, TWSSS_18).
VARIABLE LABELS  TWSSS_rec2 'Receiving Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_rec2 (F3.0).

*Giving Emotional Support Score.
COMPUTE TWSSS_givEmo=MEAN(TWSSS_3, TWSSS_7, TWSSS_14, TWSSS_19, TWSSS_21).
VARIABLE LABELS  TWSSS_givEmo 'Giving Emotional Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_givEmo2=sum(TWSSS_3, TWSSS_7, TWSSS_14, TWSSS_19, TWSSS_21).
VARIABLE LABELS  TWSSS_givEmo2 'Giving Emotional Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_givEmo2 (F3.0).

*Giving Instrumental Support Score.
COMPUTE TWSSS_givInst=MEAN(TWSSS_2, TWSSS_9, TWSSS_12, TWSSS_17, TWSSS_20).
VARIABLE LABELS  TWSSS_givInst 'Giving Instrumental Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_givInst2=MEAN(TWSSS_2, TWSSS_9, TWSSS_12, TWSSS_17, TWSSS_20).
VARIABLE LABELS  TWSSS_givInst2 'Giving Instrumental Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_givInst2 (F3.0).

*Receiving Instrumental Support Score.
COMPUTE TWSSS_recInst=MEAN(TWSSS_5, TWSSS_8, TWSSS_11, TWSSS_15).
VARIABLE LABELS  TWSSS_recInst 'Receiving Instrumental Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_recInst2=sum(TWSSS_5, TWSSS_8, TWSSS_11, TWSSS_15).
VARIABLE LABELS  TWSSS_recInst2 'Receiving Instrumental Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_recInst2 (F3.0).

*Receiving Emotional Support Score.
COMPUTE TWSSS_recEmo=MEAN(TWSSS_1, TWSSS_4, TWSSS_6, TWSSS_10, TWSSS_13, TWSSS_16, TWSSS_18).
VARIABLE LABELS  TWSSS_recEmo 'Receiving Emotional Support score (higher scores = more support) (average)'.
EXECUTE.
COMPUTE TWSSS_recEmo2=sum(TWSSS_1, TWSSS_4, TWSSS_6, TWSSS_10, TWSSS_13, TWSSS_16, TWSSS_18).
VARIABLE LABELS  TWSSS_recEmo2 'Receiving Emotional Support score (higher scores = more support) (sum)'.
EXECUTE.
FORMAT TWSSS_recEmo2 (F3.0).



*----------------------------------------------.
*CES-D Depression Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    CESD_4 CESD_8 CESD_12 CESD_16 
    (0=3) (1=2) (2=1) (3=0) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    CESD_4R CESD_8R CESD_12R CESD_16R.
VARIABLE LABELS  
    CESD_4R 'CESD_4 reverse-coded' 
    /CESD_8R 'CESD_8 reverse-coded'
    /CESD_12R 'CESD_12 reverse-coded'
    /CESD_16R 'CESD_16 reverse coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT CESD_4R to CESD_8R (F3.0).
VALUE LABELS
CESD_4R to CESD_8R
0 'most or all of the time (5-7 days)'
1 'Occassionally or a moderate amount of the time (3-4 days)'
2 'Some or a little of the time (1-2 days)'
3 'Rarely or none of the time (less than 1 day)'.
EXECUTE.

*3) Compute scales.
*Overall Depression Score.
COMPUTE CESD_total=MEAN(CESD_1, CESD_2, CESD_3, CESD_5, CESD_6, CESD_7, CESD_11, CESD_17, CESD_20, 
    CESD_4R, CESD_8R, CESD_12R, CESD_16R, CESD_9, CESD_10, CESD_13, CESD_14, CESD_15, CESD_18, CESD_19).
VARIABLE LABELS  CESD_total 'Overall Depression Score on CESD (higher scores = more depression) (average)'.
EXECUTE.
COMPUTE CESD_total2=sum(CESD_1, CESD_2, CESD_3, CESD_5, CESD_6, CESD_7, CESD_11, CESD_17, CESD_20, 
    CESD_4R, CESD_8R, CESD_12R, CESD_16R, CESD_9, CESD_10, CESD_13, CESD_14, CESD_15, CESD_18, CESD_19).
VARIABLE LABELS  CESD_total2 'Overall Depression Score on CESD (higher scores = more depression) (sum)'.
EXECUTE.
FORMAT CESD_total2 (F3.0).

*Somatic/Depressed Affect Score.
COMPUTE CESD_som=MEAN(CESD_1, CESD_2, CESD_3, CESD_5, CESD_6, CESD_7, CESD_11, CESD_17, CESD_20).
VARIABLE LABELS  CESD_som 'Somatic/Depressed Affect score on CESD (higher scores = more depressed affect) (average)'.
EXECUTE.
COMPUTE CESD_som2=sum(CESD_1, CESD_2, CESD_3, CESD_5, CESD_6, CESD_7, CESD_11, CESD_17, CESD_20).
VARIABLE LABELS  CESD_som2 'Somatic/Depressed Affect score on CESD (higher scores = more depressed affect) (sum)'.
EXECUTE.
FORMAT CESD_som2 (F3.0).

*Positive Affect Score.
COMPUTE CESD_pos=MEAN(CESD_4R, CESD_8R, CESD_12R, CESD_16R).
VARIABLE LABELS  CESD_pos 'Positive Affect score on CESD (higher scores = less pos. affect, e.g. more depression) (average)'.
EXECUTE.
COMPUTE CESD_pos2=sum(CESD_4R, CESD_8R, CESD_12R, CESD_16R).
VARIABLE LABELS  CESD_pos2 'Positive Affect score on CESD (higher scores = less pos. affect, e.g. more depression) (sum)'.
EXECUTE.
FORMAT CESD_pos2 (F3.0).

*Interpersonal/Depressed Affect Score.
COMPUTE CESD_inter=MEAN(CESD_9, CESD_10, CESD_13, CESD_14, CESD_15, CESD_18, CESD_19).
VARIABLE LABELS  CESD_inter 'Interpersonal/Depressed Affect score on CESD (higher scores = more depressed affect) (average)'.
EXECUTE.
COMPUTE CESD_inter2=sum(CESD_9, CESD_10, CESD_13, CESD_14, CESD_15, CESD_18, CESD_19).
VARIABLE LABELS  CESD_inter2 'Interpersonal/Depressed Affect score on CESD (higher scores = more depressed affect) (sum)'.
EXECUTE.
FORMAT CESD_inter2 (F3.0).




*----------------------------------------------.
*Need Threat Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    NTS_4 NTS_5 NTS_6 NTS_10 NTS_11 NTS_12
    (1=5) (2=4) (3=3) (4=2) (5=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    NTS_4R NTS_5R NTS_6R NTS_10R NTS_11R NTS_12R.
VARIABLE LABELS  
    NTS_4R 'NTS_4 reverse-coded' 
    /NTS_5R 'NTS_5 reverse-coded'
    /NTS_6R 'NTS_6 reverse-coded'
    /NTS_10R 'NTS_10 reverse-coded'
    /NTS_11R 'NTS_11 reverse-coded'
    /NTS_12R 'NTS_12 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT NTS_4R to NTS_12R (F3.0).
VALUE LABELS
NTS_4R to NTS_12R
1 'very much so'
3 'moderately'
5 'not at all'.
EXECUTE.

*3) Compute scales.
*NTS Total Score.
COMPUTE NTS_total=MEAN(NTS_1, NTS_2, NTS_3, NTS_4R, NTS_5R, NTS_6R, NTS_7, NTS_8, NTS_9, NTS_10R, NTS_11R, NTS_12R).
VARIABLE LABELS  NTS_total 'Overall score on NTS (higher scores = more threat to needs) (average)'.
EXECUTE.
FORMAT NTS_total (F3.0).

*NTS Belonging Score.
COMPUTE NTS_belong=MEAN(NTS_1, NTS_2, NTS_3).
VARIABLE LABELS  NTS_belong 'Belonging subscale score on NTS (higher scores = more threat to belonging) (average)'.
EXECUTE.
FORMAT NTS_belong (F3.0).

*NTS Self-Esteem Score.
COMPUTE NTS_esteem=MEAN(NTS_4R, NTS_5R, NTS_6R).
VARIABLE LABELS  NTS_esteem 'Self-esteem subscale score on NTS (higher scores = more threat to self-esteem) (average)'.
EXECUTE.
FORMAT NTS_esteem (F3.0).

*NTS Meaningful Existence Score.
COMPUTE NTS_meaning=MEAN(NTS_7, NTS_8, NTS_9).
VARIABLE LABELS  NTS_meaning 'Meaningful Existence subscale score on NTS (higher scores = more threat to meaningful existence) (average)'.
EXECUTE.
FORMAT NTS_meaning (F3.0).

*NTS Control Score.
COMPUTE NTS_control=MEAN(NTS_10R, NTS_11R, NTS_12R).
VARIABLE LABELS  NTS_control 'Control subscale score on NTS (higher scores = more threat to control) (average)'.
EXECUTE.
FORMAT NTS_control (F3.0).

*----------------------------------------------.
*Cyberball Post Task (PT) questions.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    PT_1 PT_2 
    (1=5) (2=4) (3=3) (4=2) (5=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    PT_1R PT_2R.
VARIABLE LABELS  
    PT_1R 'PT_1 reverse-coded' 
    /PT_2R 'PT_2 reverse-coded'.
EXECUTE.

RECODE
    PT_8
    (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (MISSING=SYSMIS) (ELSE=Copy) INTO
    PT_8R.
VARIABLE LABELS
    PT_8R 'PT_8 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT PT_1R PT_2R PT_8R (F3.0).
VALUE LABELS
PT_1R PT_2R
1 'very much so'
3 'moderately'
5 'not at all'/
PT_8R
1 'tense'
7 'relaxed'.
EXECUTE.

*3) Compute scales.
*Ostracism Index.
COMPUTE PT_ostr=MEAN(PT_1R, PT_2R, PT_3, PT_4).
VARIABLE LABELS  PT_ostr 'Ostracism Index from PT questions (higher scores = more feelings of exclusion) (average)'.
EXECUTE.


*----------------------------------------------.
*Close Other questions.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    COp1_12 COp1_13 COp1_14 COp1_15 COp2_12 COp2_13 COp2_14 COp2_15 
    (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    COp1_12R COp1_13R COp1_14R COp1_15R COp2_12R COp2_13R COp2_14R COp2_15R.
VARIABLE LABELS  
    COp1_12R 'COp1_12 reverse-coded' 
    /COp1_13R 'COp1_13 reverse-coded'
    /COp1_14R 'COp1_14 reverse-coded'
    /COp1_15R 'COp1_15 reverse-coded'
    /COp2_12R 'COp2_12 reverse-coded'
    /COp2_13R 'COp2_13 reverse-coded'
    /COp2_14R 'COp2_14 reverse-coded'
    /COp2_15R 'COp2_15 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT COp1_12R to COp2_15R (F3.0).
VALUE LABELS
COp1_12R to COp2_15R
1 'a great deal'
4 'somewhat'
7 'not at all'.
EXECUTE.

*3) Compute scales.

*Close Other Person 1 Composite.
COMPUTE COp1_total=MEAN(COp1_1, COp1_2, COp1_3, COp1_4, COp1_5, COp1_6, COp1_7, COp1_8, COp1_9, COp1_10, COp1_11, 
    COp1_12R, COp1_13R, COp1_14R, COp1_15R).
VARIABLE LABELS  COp1_total 'Close Other #1 closeness composite (higher scores = closer to/more pos. relationship with CO) (average)'.
EXECUTE.

*Close Other Person 2 Composite.
COMPUTE COp2_total=MEAN(COp2_1, COp2_2, COp2_3, COp2_4, COp2_5, COp2_6, COp2_7, COp2_8, COp2_9, COp2_10, COp2_11, 
    COp2_12R, COp2_13R, COp2_14R, COp2_15R).
VARIABLE LABELS  COp2_total 'Close Other #2 closeness composite (higher scores = closer to/more pos. relationship with CO) (average)'.
EXECUTE.

*Close Other Composite for both COs.
COMPUTE CO_total=MEAN(COp1_1, COp1_2, COp1_3, COp1_4, COp1_5, COp1_6, COp1_7, COp1_8, COp1_9, COp1_10, COp1_11, 
    COp1_12R, COp1_13R, COp1_14R, COp1_15R, COp2_1, COp2_2, COp2_3, COp2_4, COp2_5, COp2_6, COp2_7, COp2_8, COp2_9, 
    COp2_10, COp2_11, COp2_12R, COp2_13R, COp2_14R, COp2_15R).
VARIABLE LABELS  CO_total 'Close Other closeness composite (of both close others) (higher scores = closer to/more pos. relationship with COs) (average)'.
EXECUTE.

*Close Other Positive Composite (both COs).
COMPUTE CO_pos=MEAN(COp1_1, COp1_2, COp1_3, COp1_4, COp1_5, COp1_6, COp1_7, COp1_8, COp1_9, COp1_10, COp1_11, 
    COp2_1, COp2_2, COp2_3, COp2_4, COp2_5, COp2_6, COp2_7, COp2_8, COp2_9, COp2_10, COp2_11).
VARIABLE LABELS  CO_pos 'Close Other positive support (or presense of support) composite (both COs) (higher scores = higher degree of support) (average)'.
EXECUTE.

*Close Other Person 1 Positive Composite.
COMPUTE COp1_pos=MEAN(COp1_1, COp1_2, COp1_3, COp1_4, COp1_5, COp1_6, COp1_7, COp1_8, COp1_9, COp1_10, COp1_11).
VARIABLE LABELS  COp1_pos 'Close Other #1 positive support (or presense of support) composite (higher scores = higher degree of support) (average)'.
EXECUTE.

*Close Other Person 2 Positive Composite.
COMPUTE COp2_pos=MEAN(COp2_1, COp2_2, COp2_3, COp2_4, COp2_5, COp2_6, COp2_7, COp2_8, COp2_9, COp2_10, COp2_11).
VARIABLE LABELS  COp2_pos 'Close Other #2 positive support (or presense of support) composite (higher scores = higher degree of support) (average)'.
EXECUTE.

*Close Other Negative Composite (both COs).
COMPUTE CO_neg=MEAN(COp1_12, COp1_13, COp1_14, COp1_15, COp2_12, COp2_13, COp2_14, COp2_15).
VARIABLE LABELS  CO_neg 'Close Other negative support (or lack of support) composite (both COs)(higher scores = lacking more support) (average)'.
EXECUTE.

*Close Other Person 1 Negative Composite.
COMPUTE COp1_neg=MEAN(COp1_12, COp1_13, COp1_14, COp1_15).
VARIABLE LABELS  COp1_neg 'Close Other #1 negative support (or lack of support) composite (higher scores = lacking more support) (average)'.
EXECUTE.

*Close Other Person 2 Negative Composite.
COMPUTE COp2_neg=MEAN(COp2_12, COp2_13, COp2_14, COp2_15).
VARIABLE LABELS  COp2_neg 'Close Other #2 negative support (or lack of support) composite (higher scores = lacking more support) (average)'.
EXECUTE.



*----------------------------------------------.
*Eysenck Personality Questionnaire (extraversion/neuroticism).
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    EPQ_14 EPQ_20 
    (1=0) (0=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    EPQ_14R EPQ_20R.
VARIABLE LABELS  
    EPQ_14R 'EPQ_14 reverse-coded' 
    /EPQ_20R 'EPQ_20 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT EPQ_14R EPQ_20R (F3.0).
VALUE LABELS
EPQ_14R EPQ_20R
1 'no'
0 'yes'.
EXECUTE.

*3) Compute scales.
*Extraversion Score.
COMPUTE EPQ_extrav2=sum(EPQ_2, EPQ_4, EPQ_6, EPQ_8, EPQ_10, EPQ_12, EPQ_14R, EPQ_16, 
    EPQ_18, EPQ_20R, EPQ_22, EPQ_24).
VARIABLE LABELS  EPQ_extrav2 'Extraversion score on EPQ (higher scores = more extraverted) (sum)'.
EXECUTE.
FORMAT EPQ_extrav2 (F3.0).

*Neuroticism Score.
COMPUTE EPQ_neurot2=sum(EPQ_1, EPQ_3, EPQ_5, EPQ_7, EPQ_9, EPQ_11, EPQ_13, EPQ_15, 
    EPQ_17, EPQ_19, EPQ_21, EPQ_23).
VARIABLE LABELS  EPQ_neurot2 'Neuroticism score on EPQ (higher scores = more neurotic) (sum)'.
EXECUTE.
FORMAT EPQ_neurot2 (F3.0).


*----------------------------------------------.
*Perceived Stress Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    PSS_4 PSS_5 PSS_7 PSS_8
    (0=4) (1=3) (2=2) (3=1) (4=0) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    PSS_4R PSS_5R PSS_7R PSS_8R.
VARIABLE LABELS  
    PSS_4R 'PSS_4 reverse-coded' 
    /PSS_5R 'PSS_5 reverse-coded'
    /PSS_7R 'PSS_7 reverse-coded'
    /PSS_8R 'PSS_8 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT PSS_4R to PSS_8R (F3.0).
VALUE LABELS
PSS_4R to PSS_8R
0 'very often'
1 'fairly often'
2 'sometimes'
3 'almost never'
4 'never'.
EXECUTE.

*3) Compute scales.

*Perceved Stress Scale total.
COMPUTE PSS_total=MEAN(PSS_1, PSS_2, PSS_3, PSS_4R, PSS_5R, PSS_6, PSS_7R, PSS_8R, PSS_9, PSS_10).
VARIABLE LABELS  PSS_total 'Perceived Stress scale total score (higher scores = higher perceived stress) (average)'.
EXECUTE.
COMPUTE PSS_total2=sum(PSS_1, PSS_2, PSS_3, PSS_4R, PSS_5R, PSS_6, PSS_7R, PSS_8R, PSS_9, PSS_10).
VARIABLE LABELS  PSS_total2 'Perceived Stress scale total score (higher scores = higher perceived stress) (sum)'.
EXECUTE.
FORMAT PSS_total2 (F3.0).

*----------------------------------------------.
*Mehrabian Rejection Sensitivity Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    MRS_1 MRS_2 MRS_4 MRS_6 MRS_7 MRS_9 MRS_13 MRS_15 MRS_16 MRS_19 MRS_23 MRS_24 
    (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    MRS_1R MRS_2R MRS_4R MRS_6R MRS_7R MRS_9R MRS_13R MRS_15R MRS_16R MRS_19R MRS_23R MRS_24R.
VARIABLE LABELS  
    MRS_1R 'MRS_1 reverse-coded' 
    /MRS_2R 'MRS_2 reverse-coded'
    /MRS_4R 'MRS_4 reverse-coded'
    /MRS_6R 'MRS_6 reverse-coded'
    /MRS_7R 'MRS_7 reverse-coded'
    /MRS_9R 'MRS_9 reverse-coded'
    /MRS_13R 'MRS_13 reverse-coded'
    /MRS_15R 'MRS_15 reverse-coded'
    /MRS_16R 'MRS_16 reverse-coded'
    /MRS_19R 'MRS_19 reverse-coded'
    /MRS_23R 'MRS_23 reverse-coded'
    /MRS_24R 'MRS_24 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT MRS_1R to MRS_24R (F3.0).
VALUE LABELS
MRS_1R to MRS_24R
1 'strongly agree'
4 'neutral/mixed'
7 'strongly disagree'.
EXECUTE.

*3) Compute scales.
*Sensitivity to Rejection Total Score.
COMPUTE MRS_total=MEAN(MRS_1R, MRS_2R, MRS_3, MRS_4R, MRS_5, MRS_6R, MRS_7R, MRS_8, MRS_9R, MRS_10, MRS_11, 
    MRS_12, MRS_13R, MRS_14, MRS_15R, MRS_16R, MRS_17, MRS_18, MRS_19R, MRS_20, MRS_21, MRS_22, MRS_23R, MRS_24R).
VARIABLE LABELS  MRS_total 'Rejection Sensitvity score (higher scores = higher rejection sensitivity) (average)'.
EXECUTE.
COMPUTE MRS_total2=sum(MRS_1R, MRS_2R, MRS_3, MRS_4R, MRS_5, MRS_6R, MRS_7R, MRS_8, MRS_9R, MRS_10, MRS_11, 
    MRS_12, MRS_13R, MRS_14, MRS_15R, MRS_16R, MRS_17, MRS_18, MRS_19R, MRS_20, MRS_21, MRS_22, MRS_23R, MRS_24R).
VARIABLE LABELS  MRS_total2 'Rejection Sensitvity score (higher scores = higher rejection sensitivity) (sum)'.
EXECUTE.
FORMAT MRS_total2 (F3.0).


*----------------------------------------------.
*Well-Being Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
*N/A for this scale.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
*N/A for this scale.

*3) Compute scales.

*Overall Well-Being.
COMPUTE WB_total=MEAN(WB_1, WB_2, WB_3, WB_4, WB_5, WB_6, WB_7, WB_8, WB_9, WB_10, WB_11, WB_12, WB_13, WB_14).
VARIABLE LABELS  WB_total 'Overall Well-Being score on the WB scale (higher scores = better well-being) (average)'.
EXECUTE.
COMPUTE WB_total2=sum(WB_1, WB_2, WB_3, WB_4, WB_5, WB_6, WB_7, WB_8, WB_9, WB_10, WB_11, WB_12, WB_13, WB_14).
VARIABLE LABELS  WB_total2 'Overall Well-Being score on the WB scale (higher scores = better well-being) (sum)'.
EXECUTE.
FORMAT WB_total2 (F3.0).

*Hedonic (Emotional) Well-Being.
COMPUTE WB_hedon=MEAN(WB_1, WB_2, WB_3).
VARIABLE LABELS  WB_hedon 'Hedonic (Emotional) Well-Being score on the WB scale (higher scores = better well-being) (average)'.
EXECUTE.
COMPUTE WB_hedon2=sum(WB_1, WB_2, WB_3).
VARIABLE LABELS  WB_hedon2 'Hedonic (Emotional) Well-Being score on the WB scale (higher scores = better well-being) (sum)'.
EXECUTE.
FORMAT WB_hedon2 (F3.0).

*Eudaimonic Social Well-Being.
COMPUTE WB_eudSoc=MEAN(WB_4, WB_5, WB_6, WB_7, WB_8).
VARIABLE LABELS  WB_eudSoc 'Eudaimonic Social Well-Being score on the WB scale (higher scores = better well-being) (average)'.
EXECUTE.
COMPUTE WB_eudSoc2=sum(WB_4, WB_5, WB_6, WB_7, WB_8).
VARIABLE LABELS  WB_eudSoc2 'Eudaimonic Social Well-Being score on the WB scale (higher scores = better well-being) (sum)'.
EXECUTE.
FORMAT WB_eudSoc2 (F3.0).

*Eudaimonic Psychological Well-Being.
COMPUTE WB_eudPsych=MEAN(WB_9, WB_10, WB_11, WB_12, WB_13, WB_14).
VARIABLE LABELS  WB_eudPsych 'Eudaimonic Psychological Well-Being score on the WB scale (higher scores = better well-being) (average)'.
EXECUTE.
COMPUTE WB_eudPsych2=sum(WB_9, WB_10, WB_11, WB_12, WB_13, WB_14).
VARIABLE LABELS  WB_eudPsych2 'Eudaimonic Psychological Well-Being score on the WB scale (higher scores = better well-being) (sum)'.
EXECUTE.
FORMAT WB_eudPsych2 (F3.0).



*----------------------------------------------.
*Risky Families Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    RFS_1 RFS_3 RFS_6
    (1=5) (2=4) (3=3) (4=2) (5=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    RFS_1R RFS_3R RFS_6R.
VARIABLE LABELS  
    RFS_1R 'RFS_1 reverse-coded' 
    /RFS_3R 'RFS_3 reverse-coded'
    /RFS_6R 'RFS_6 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT RFS_1R to RFS_6R (F3.0).
VALUE LABELS
RFS_1R to RFS_6R
1 'very often'
5 'not at all'.
EXECUTE.

*3) Compute scales.

*Overall Risky Families Score.
COMPUTE RFS_total=MEAN(RFS_1R, RFS_2, RFS_3R, RFS_4, RFS_5, RFS_6R, RFS_7, RFS_8, RFS_9, RFS_10, RFS_11).
VARIABLE LABELS  RFS_total 'Overall risky families score on the RFS (higher scores = more risk) (average)'.
EXECUTE.
COMPUTE RFS_total2=sum(RFS_1R, RFS_2, RFS_3R, RFS_4, RFS_5, RFS_6R, RFS_7, RFS_8, RFS_9, RFS_10, RFS_11).
VARIABLE LABELS  RFS_total2 'WARNING: Scale is missing 2 items so sum may not be meaningful. Overall risky families score on the RFS (higher scores = more risk) (sum)'.
EXECUTE.
FORMAT RFS_total2 (F3.0).

*Abuse subscale.
COMPUTE RFS_abuse=MEAN(RFS_2, RFS_4).
VARIABLE LABELS  RFS_abuse 'Abuse subscale score on the RFS (higher scores = more abuse) (average)'.
EXECUTE.
COMPUTE RFS_abuse2=sum(RFS_2, RFS_4).
VARIABLE LABELS  RFS_abuse2 'Abuse subscale score on the RFS (higher scores = more abuse) (sum)'.
EXECUTE.
FORMAT RFS_abuse2 (F3.0).

*Neglect subscale.
COMPUTE RFS_neglect=MEAN(RFS_1R, RFS_3R, RFS_11).
VARIABLE LABELS  RFS_neglect 'Neglect subscale score on the RFS (higher scores = more neglect) (average)'.
EXECUTE.
COMPUTE RFS_neglect2=sum(RFS_1R, RFS_3R, RFS_11).
VARIABLE LABELS  RFS_neglect2 'Neglect subscale score on the RFS (higher scores = more neglect) (sum)'.
EXECUTE.
FORMAT RFS_neglect2 (F3.0).

*Chaotic Environment subscale.
COMPUTE RFS_chaos=MEAN(RFS_5, RFS_7, RFS_8, RFS_10).
VARIABLE LABELS  RFS_chaos 'Chaotic Environment score on the RFS (higher scores = more chaotic env''t) (average)'.
EXECUTE.
COMPUTE RFS_chaos2=sum(RFS_5, RFS_7, RFS_8, RFS_10).
VARIABLE LABELS  RFS_chaos2 'Chaotic Environment score on the RFS (higher scores = more chaotic env''t) (sum)'.
EXECUTE.
FORMAT RFS_chaos2 (F3.0).



*----------------------------------------------.
*Social Anxiety Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    SAS_2 SAS_3 SAS_6 SAS_10 SAS_15 
    (1=5) (2=4) (3=3) (4=2) (5=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    SAS_2R SAS_3R SAS_6R SAS_10R SAS_15R.
VARIABLE LABELS  
    SAS_2R 'SAS_2 reverse-coded' 
    /SAS_3R 'SAS_3 reverse-coded'
    /SAS_6R 'SAS_6 reverse-coded'
    /SAS_10R 'SAS_10 reverse-coded'
    /SAS_15R 'SAS_15 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT SAS_2R to SAS_15R (F3.0).
VALUE LABELS
SAS_2R to SAS_15R
1 'extremely characteristic of me'
2 'very characteristic of me'
3 'moderately characteristic of me'
4 'slightly characteristic of me'
5 'not at all characteristic of me'.
EXECUTE.

*3) Compute scales.

*Social Anxiety Scale Score.
COMPUTE SAS_total=MEAN(SAS_1, SAS_2R, SAS_3R, SAS_4, SAS_5, SAS_6R,
    SAS_7, SAS_8, SAS_9, SAS_10R, SAS_11, SAS_12, SAS_13, SAS_14, SAS_15R).
VARIABLE LABELS  SAS_total 'Social Anxiety score (higher scores = more anxiety) (average)'.
EXECUTE.
COMPUTE SAS_total2=sum(SAS_1, SAS_2R, SAS_3R, SAS_4, SAS_5, SAS_6R,
    SAS_7, SAS_8, SAS_9, SAS_10R, SAS_11, SAS_12, SAS_13, SAS_14, SAS_15R).
VARIABLE LABELS  SAS_total2 'Social Anxiety score (higher scores = more anxiety) (sum)'.
EXECUTE.
FORMAT SAS_total2 (F3.0).


*----------------------------------------------.
*Hurt Feelings Scale.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    HF_3 HF_4 HF_6
    (1=5) (2=4) (3=3) (4=2) (5=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    HF_3R HF_4R HF_6R.
VARIABLE LABELS  
    HF_3R 'HF_3 reverse-coded' 
    /HF_4R 'HF_4 reverse-coded'
    /HF_6R 'HF_6 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT HF_3R to HF_6R (F3.0).
VALUE LABELS
HF_3R to HF_6R
1 'extremely characteristic of me'
2 'very characteristic of me'
3 'moderately characteristic of me'
4 'slightly characteristic of me'
5 'not at all characteristic of me'.
EXECUTE.

*3) Compute scales.
*Total Hurt Feelings Score.
COMPUTE HF_total=MEAN(HF_1, HF_2, HF_3R, HF_4R, HF_5, HF_6R).
VARIABLE LABELS  HF_total 'Hurt Feelings score (higher scores = more hurt feelings) (average)'.
EXECUTE.



*----------------------------------------------.
*Experiences in Close Relationships.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    ECRS_2 ECRS_7 ECRS_14 ECRS_17 ECRS_18 
    (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    ECRS_2R ECRS_7R ECRS_14R ECRS_17R ECRS_18R.
VARIABLE LABELS  
    ECRS_2R 'ECRS_2 reverse-coded' 
    /ECRS_7R 'ECRS_7 reverse-coded'
    /ECRS_14R 'ECRS_14 reverse-coded'
    /ECRS_17R 'ECRS_17 reverse-coded'
    /ECRS_18R 'ECRS_18 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT ECRS_2R to ECRS_18R (F3.0).
VALUE LABELS
ECRS_2R to ECRS_18R
1 'strongly agree'
4 'neutral/mixed'
7 'strongly disagree'.
EXECUTE.

*3) Compute scales.

*Attachment-related Anxiety Score.
COMPUTE ECRS_anx=MEAN(ECRS_1, ECRS_3, ECRS_6, ECRS_8, ECRS_9, ECRS_10, ECRS_11, ECRS_12, ECRS_18R).
VARIABLE LABELS  ECRS_anx 'Attachment-related Anxiety score on ECRS (higher scores = more anxiety)(average)'.
EXECUTE.

*Attachment-related Avoidance Score.
COMPUTE ECRS_avoid=MEAN(ECRS_2R, ECRS_4, ECRS_5, ECRS_7R, ECRS_13, ECRS_14R, ECRS_15, ECRS_16, ECRS_17R).
VARIABLE LABELS  ECRS_avoid 'Attachment-related Avoidance score on ECRS (higher scores = more anxiety)(average)'.
EXECUTE.


*----------------------------------------------.
*PBI.
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    PBI_M_2 PBI_M_4 PBI_M_14 PBI_M_16 PBI_M_18 PBI_M_24 
    PBI_M_3 PBI_M_7 PBI_M_15 PBI_M_21 PBI_M_22 PBI_M_25
    PBI_F_2 PBI_F_4 PBI_F_14 PBI_F_16 PBI_F_18 PBI_F_24 
    PBI_F_3 PBI_F_7 PBI_F_15 PBI_F_21 PBI_F_22 PBI_F_25
    (0=3) (1=2) (2=1) (3=0) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    PBI_M_2R PBI_M_4R PBI_M_14R PBI_M_16R PBI_M_18R PBI_M_24R 
    PBI_M_3R PBI_M_7R PBI_M_15R PBI_M_21R PBI_M_22R PBI_M_25R
    PBI_F_2R PBI_F_4R PBI_F_14R PBI_F_16R PBI_F_18R PBI_F_24R 
    PBI_F_3R PBI_F_7R PBI_F_15R PBI_F_21R PBI_F_22R PBI_F_25R.
VARIABLE LABELS  
    PBI_M_2R 'PBI_M_2 reverse-coded' 
    /PBI_M_4R 'PBI_M_4 reverse-coded' 
    /PBI_M_14R 'PBI_M_14 reverse-coded' 
    /PBI_M_16R 'PBI_M_16 reverse-coded' 
    /PBI_M_18R 'PBI_M_18 reverse-coded' 
    /PBI_M_24R 'PBI_M_24 reverse-coded' 
    /PBI_M_3R 'PBI_M_3 reverse-coded' 
    /PBI_M_7R 'PBI_M_7 reverse-coded' 
    /PBI_M_15R 'PBI_M_15 reverse-coded' 
    /PBI_M_21R 'PBI_M_21 reverse-coded' 
    /PBI_M_22R 'PBI_M_22 reverse-coded' 
    /PBI_M_25R 'PBI_M_25 reverse-coded' 
    /PBI_F_2R 'PBI_F_2 reverse-coded' 
    /PBI_F_4R 'PBI_F_4 reverse-coded' 
    /PBI_F_14R 'PBI_F_14 reverse-coded' 
    /PBI_F_16R 'PBI_F_16 reverse-coded' 
    /PBI_F_18R 'PBI_F_18 reverse-coded' 
    /PBI_F_24R 'PBI_F_24 reverse-coded' 
    /PBI_F_3R 'PBI_F_3 reverse-coded' 
    /PBI_F_7R 'PBI_F_7 reverse-coded' 
    /PBI_F_15R 'PBI_F_15 reverse-coded' 
    /PBI_F_21R 'PBI_F_21 reverse-coded' 
    /PBI_F_22R 'PBI_F_22 reverse-coded' 
    /PBI_F_25R 'PBI_F_25 reverse-coded' .
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT PBI_M_2R to PBI_F_25R (F3.0).
VALUE LABELS
PBI_M_2R to PBI_F_25R
0 'very like'
1 'moderately like'
2 'moderately unlike'
3 'very unlike'.
EXECUTE.

*3) Compute scales.

*Care Subscale for Parental Average.
COMPUTE PBI_care=MEAN(PBI_M_1, PBI_M_2R, PBI_M_4R, PBI_M_5, PBI_M_6, PBI_M_11, 
    PBI_M_12, PBI_M_14R, PBI_M_16R, PBI_M_17, PBI_M_18R, PBI_M_24R, PBI_F_1, 
    PBI_F_2R, PBI_F_4R, PBI_F_5, PBI_F_6, PBI_F_11, PBI_F_12, PBI_F_14R, PBI_F_16R, 
    PBI_F_17, PBI_F_18R, PBI_F_24R).
VARIABLE LABELS  PBI_care 'Care subscale of the PBI for mother/father combined (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_care2=sum(PBI_M_1, PBI_M_2R, PBI_M_4R, PBI_M_5, PBI_M_6, PBI_M_11, 
    PBI_M_12, PBI_M_14R, PBI_M_16R, PBI_M_17, PBI_M_18R, PBI_M_24R, PBI_F_1, 
    PBI_F_2R, PBI_F_4R, PBI_F_5, PBI_F_6, PBI_F_11, PBI_F_12, PBI_F_14R, PBI_F_16R, 
    PBI_F_17, PBI_F_18R, PBI_F_24R).
VARIABLE LABELS  PBI_care2 'Care subscale of the PBI for mother/father combined (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_care2 (F3.0).

*Care Subscale for Mother Score.
COMPUTE PBI_M_care=MEAN(PBI_M_1, PBI_M_2R, PBI_M_4R, PBI_M_5, PBI_M_6, PBI_M_11, 
    PBI_M_12, PBI_M_14R, PBI_M_16R, PBI_M_17, PBI_M_18R, PBI_M_24R).
VARIABLE LABELS  PBI_M_care 'Care subscale of the PBI for mother (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_M_care2=sum(PBI_M_1, PBI_M_2R, PBI_M_4R, PBI_M_5, PBI_M_6, PBI_M_11, 
    PBI_M_12, PBI_M_14R, PBI_M_16R, PBI_M_17, PBI_M_18R, PBI_M_24R).
VARIABLE LABELS  PBI_M_care2 'Care subscale of the PBI for mother (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_M_care2 (F3.0).

*Care Subscale for Father Score.
COMPUTE PBI_F_care=MEAN(PBI_F_1, PBI_F_2R, PBI_F_4R, PBI_F_5, PBI_F_6, PBI_F_11, 
    PBI_F_12, PBI_F_14R, PBI_F_16R, PBI_F_17, PBI_F_18R, PBI_F_24R).
VARIABLE LABELS  PBI_F_care 'Care subscale of the PBI for father (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_F_care2=sum(PBI_F_1, PBI_F_2R, PBI_F_4R, PBI_F_5, PBI_F_6, PBI_F_11, 
    PBI_F_12, PBI_F_14R, PBI_F_16R, PBI_F_17, PBI_F_18R, PBI_F_24R).
VARIABLE LABELS  PBI_F_care2 'Care subscale of the PBI for father (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_F_care2 (F3.0).

*Overprotection Subscale for Parental Average.
COMPUTE PBI_over=MEAN(PBI_M_3R, PBI_M_7R, PBI_M_8, PBI_M_9, PBI_M_10, PBI_M_13, 
    PBI_M_15R, PBI_M_19, PBI_M_20, PBI_M_21R, PBI_M_22R, PBI_M_23, PBI_M_25R, 
    PBI_F_3R, PBI_F_7R, PBI_F_8, PBI_F_9, PBI_F_10, PBI_F_13, PBI_F_15R, 
    PBI_F_19, PBI_F_20, PBI_F_21R, PBI_F_22R, PBI_F_23, PBI_F_25R).
VARIABLE LABELS  PBI_over 'Overprotection subscale of the PBI for  mother/father combined (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_over2=sum(PBI_M_3R, PBI_M_7R, PBI_M_8, PBI_M_9, PBI_M_10, PBI_M_13, 
    PBI_M_15R, PBI_M_19, PBI_M_20, PBI_M_21R, PBI_M_22R, PBI_M_23, PBI_M_25R, 
    PBI_F_3R, PBI_F_7R, PBI_F_8, PBI_F_9, PBI_F_10, PBI_F_13, PBI_F_15R, 
    PBI_F_19, PBI_F_20, PBI_F_21R, PBI_F_22R, PBI_F_23, PBI_F_25R).
VARIABLE LABELS  PBI_over2 'Overprotection subscale of the PBI for  mother/father combined (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_over2 (F3.0).

*Overprotection Subscale for Mother Score.
COMPUTE PBI_M_over=MEAN(PBI_M_3R, PBI_M_7R, PBI_M_8, PBI_M_9, PBI_M_10, PBI_M_13, 
    PBI_M_15R, PBI_M_19, PBI_M_20, PBI_M_21R, PBI_M_22R, PBI_M_23, PBI_M_25R).
VARIABLE LABELS  PBI_M_over 'Overprotection subscale of the PBI for mother (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_M_over2=sum(PBI_M_3R, PBI_M_7R, PBI_M_8, PBI_M_9, PBI_M_10, PBI_M_13, 
    PBI_M_15R, PBI_M_19, PBI_M_20, PBI_M_21R, PBI_M_22R, PBI_M_23, PBI_M_25R).
VARIABLE LABELS  PBI_M_over2 'Overprotection subscale of the PBI for mother (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_M_over2 (F3.0).

*Overprotection Subscale for Father Score.
COMPUTE PBI_F_over=MEAN(PBI_F_3R, PBI_F_7R, PBI_F_8, PBI_F_9, PBI_F_10, PBI_F_13, 
    PBI_F_15R, PBI_F_19, PBI_F_20, PBI_F_21R, PBI_F_22R, PBI_F_23, PBI_F_25R).
VARIABLE LABELS  PBI_F_over 'Overprotection subscale of the PBI for father (higher scores = more care) (average)'.
EXECUTE.
COMPUTE PBI_F_over2=sum(PBI_F_3R, PBI_F_7R, PBI_F_8, PBI_F_9, PBI_F_10, PBI_F_13, 
    PBI_F_15R, PBI_F_19, PBI_F_20, PBI_F_21R, PBI_F_22R, PBI_F_23, PBI_F_25R).
VARIABLE LABELS  PBI_F_over2 'Overprotection subscale of the PBI for father (higher scores = more care) (sum)'.
EXECUTE.
FORMAT PBI_F_over2 (F3.0).




*----------------------------------------------.
*Multi-Symptom Fatigue Inventory (Short Form).
*----------------------------------------------.
*1) Creating reverse-coded variables.
RECODE 
    MFSI_SF_5 MFSI_SF_7 MFSI_SF_9 MFSI_SF_22 MFSI_SF_24 MFSI_SF_29 
    (0=4) (1=3) (2=2) (3=1) (4=0) (MISSING=SYSMIS) (ELSE=Copy) INTO 
    MFSI_SF_5R MFSI_SF_7R MFSI_SF_9R MFSI_SF_22R MFSI_SF_24R MFSI_SF_29R.
VARIABLE LABELS  
    MFSI_SF_5R 'MFSI_SF_5 reverse-coded'
    /MFSI_SF_7R 'MFSI_SF_7 reverse-coded'
    /MFSI_SF_9R 'MFSI_SF_9 reverse-coded'
    /MFSI_SF_22R 'MFSI_SF_22 reverse-coded'
    /MFSI_SF_24R 'MFSI_SF_24 reverse-coded'
    /MFSI_SF_29R 'MFSI_SF_29 reverse-coded'.
EXECUTE.

*2) Add the new labels for the reverse-coded vars.
*Also go ahead and change the decimal places to 0 if applicable (just helps clean things up a bit).
FORMAT MFSI_SF_5R to MFSI_SF_29R (F3.0).
VALUE LABELS
MFSI_SF_5R to MFSI_SF_29R
0 'extremely'
1 'quite a bit'
2 'moderately'
3 'a little'
4 'not at all'.
EXECUTE.

*3) Compute scales.


*General Fatigue Scale.
COMPUTE MFSI_general=MEAN(MFSI_SF_10, MFSI_SF_12, MFSI_SF_14, MFSI_SF_17, MFSI_SF_18, MFSI_SF_28).
VARIABLE LABELS  MFSI_general 'General fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_general2=sum(MFSI_SF_10, MFSI_SF_12, MFSI_SF_14, MFSI_SF_17, MFSI_SF_18, MFSI_SF_28).
VARIABLE LABELS  MFSI_general2 'General fatigue score on the MFSI-SF (higher scores = more fatigue) (sum)'.
EXECUTE.
FORMAT MFSI_general2 (F3.0).

*Physical Fatigue Scale.
COMPUTE MFSI_physical=MEAN(MFSI_SF_2, MFSI_SF_4, MFSI_SF_6, MFSI_SF_16, MFSI_SF_19, MFSI_SF_26).
VARIABLE LABELS  MFSI_physical 'Physical fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_physical2=sum(MFSI_SF_2, MFSI_SF_4, MFSI_SF_6, MFSI_SF_16, MFSI_SF_19, MFSI_SF_26).
VARIABLE LABELS  MFSI_physical2 'Physical fatigue score on the MFSI-SF (higher scores = more fatigue) (sum)'.
EXECUTE.
FORMAT MFSI_physical2 (F3.0).

*Emotional Fatigue Scale.
COMPUTE MFSI_emotion=MEAN(MFSI_SF_3, MFSI_SF_8, MFSI_SF_13, MFSI_SF_21, MFSI_SF_23, MFSI_SF_30).
VARIABLE LABELS  MFSI_emotion 'Emotional fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_emotion2=sum(MFSI_SF_3, MFSI_SF_8, MFSI_SF_13, MFSI_SF_21, MFSI_SF_23, MFSI_SF_30).
VARIABLE LABELS  MFSI_emotion2 'Emotional fatigue score on the MFSI-SF (higher scores = more fatigue) (sum)'.
EXECUTE.
FORMAT MFSI_emotion2 (F3.0).

*Mental Fatigue Scale.
COMPUTE MFSI_mental=MEAN(MFSI_SF_1, MFSI_SF_11, MFSI_SF_15, MFSI_SF_20, MFSI_SF_25, MFSI_SF_27).
VARIABLE LABELS  MFSI_mental 'Mental fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_mental2=sum(MFSI_SF_1, MFSI_SF_11, MFSI_SF_15, MFSI_SF_20, MFSI_SF_25, MFSI_SF_27).
VARIABLE LABELS  MFSI_mental2 'Mental fatigue score on the MFSI-SF (higher scores = more fatigue) (sum)'.
EXECUTE.
FORMAT MFSI_mental2 (F3.0).

*Vigor Scale.
COMPUTE MFSI_vigor=MEAN(MFSI_SF_5, MFSI_SF_7, MFSI_SF_9, MFSI_SF_22, MFSI_SF_24, MFSI_SF_29).
VARIABLE LABELS  MFSI_vigor 'Vigor score on the MFSI-SF (higher scores = more vigor) (average)'.
EXECUTE.
COMPUTE MFSI_vigorR=MEAN(MFSI_SF_5R, MFSI_SF_7R, MFSI_SF_9R, MFSI_SF_22R, MFSI_SF_24R, MFSI_SF_29R).
VARIABLE LABELS  MFSI_vigorR 'Vigor score on the MFSI-SF, reverse-coded (higher scores = less vigor, more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_vigorR2=sum(MFSI_SF_5R, MFSI_SF_7R, MFSI_SF_9R, MFSI_SF_22R, MFSI_SF_24R, MFSI_SF_29R).
VARIABLE LABELS  MFSI_vigorR2 'Vigor score on the MFSI-SF, reverse-coded (higher scores = less vigor, more fatigue) (sum)'.
EXECUTE.
FORMAT MFSI_vigorR2 (F3.0).
COMPUTE MFSI_vigor2=sum(MFSI_SF_5, MFSI_SF_7, MFSI_SF_9, MFSI_SF_22, MFSI_SF_24, MFSI_SF_29).
VARIABLE LABELS  MFSI_vigor2 'Vigor score on the MFSI-SF (higher scores = more vigor) (sum)'.
EXECUTE.
FORMAT MFSI_vigor2 (F3.0).

*Overall Fatigue Score.
COMPUTE MFSI_total = mean(MFSI_SF_10, MFSI_SF_12, MFSI_SF_14, MFSI_SF_17, MFSI_SF_18, MFSI_SF_28, MFSI_SF_2, MFSI_SF_4, MFSI_SF_6, 
    MFSI_SF_16, MFSI_SF_19, MFSI_SF_26, MFSI_SF_3, MFSI_SF_8, MFSI_SF_13, MFSI_SF_21, MFSI_SF_23, MFSI_SF_30, MFSI_SF_1, MFSI_SF_11, 
    MFSI_SF_15, MFSI_SF_20, MFSI_SF_25, MFSI_SF_27, MFSI_SF_5R, MFSI_SF_7R, MFSI_SF_9R, MFSI_SF_22R, MFSI_SF_24R, MFSI_SF_29R).
VARIABLE LABELS  MFSI_total 'Overall fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
COMPUTE MFSI_total2 = ((MFSI_general2 + MFSI_physical2 + MFSI_emotion2 + MFSI_mental2) - MFSI_vigor2).
VARIABLE LABELS  MFSI_total2 'Overall fatigue score on the MFSI-SF (higher scores = more fatigue) (average)'.
EXECUTE.
FORMAT MFSI_total2 (F3.0).

add files file *
/keep ID to MFSI_SF_29R MFSI_total MFSI_total2 MFSI_general to MFSI_vigor2  all.
execute.


**Order variables in SPSS file so that all reverse-coded items are together, and all scale composites are together.
add files file *
/keep ID to CheckedBy SPS_3R to SPS_18R UCLA_1R to UCLA_20R CESD_4R to CESD_16R NTS_4R to NTS_12R PT_1R to PT_8R 
COp1_12R to COp2_15R EPQ_14R EPQ_20R PSS_4R to PSS_8R MRS_1R to MRS_24R RFS_1R to RFS_6R SAS_2R to SAS_15R 
HF_3R to HF_6R ECRS_2R to ECRS_18R PBI_M_2R to PBI_F_25R MFSI_SF_5R to MFSI_SF_29R all.
execute.


