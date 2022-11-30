# This R script file requires the use of the "expss" and "dplyr" packages. 
# The following lines of code should be uncommented and run if these packages are not already installed 

#install.packages("expss")
#intall.packages("dplyr")
library(expss)
library(dplyr)

# -----------------------------------------------; 
# This program reads the 2012 Restricted-Use  
# NCHS Natality Data File 
# by Hye Jee Kim, hyejk@stanford.edu,  Sat Nov 26 2022 
# Please report errors to hyejk@stanford.edu
# -----------------------------------------------;

# The following line should contain the complete path and name of the raw data file.
# On a PC, use backslashes in paths as in C:\  ;

# Reading in File 

unlabeled_2012 <- read.fwf(file = "FILEPATH/NATL2012US.AllCnty.txt",
                           width = c(-6, 1, -7, 4, 2, 1,
                                     -2, 1, 4, 1,
                                     2, 2, -3, 3, 1,
                                     1, 1, -16, 1, 
                                     -9, 1, -4, 1, 
                                     -12, 1, 1, 2,
                                     2, 1, 
                                     2, -2, 2, 1, 
                                     2, -4, 2, 
                                     2, -3, 3, -3, 5, 
                                     -7, 1, 1, 1, 
                                     -2, 1, 1, 
                                     2, 2, 1, 1, 
                                     -3, 1, 1, 
                                     -2, 1, 1, 1,
                                     1, -3, 1, 
                                     -9, 1, -4, 1, 
                                     1, -6, 2, 
                                     2, 2, 
                                     2, 1, 1,
                                     -3, 1, 1,
                                     1, 1, 
                                     2, 
                                     -7, 2, -2, 1, -4, 1, 
                                     -25, 2, 2, 1, 
                                     -22, 2, 2, 1, 
                                     -1, 2, 1, 
                                     -1, 1, 1, 
                                     2, 2, 2, 2, 
                                     -4, 1, 
                                     -13, 1, -3, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 1, -1, 1, 
                                     1, 1, 
                                     1, 2, 1, 
                                     -3, 1, -3, 1, 1, 1,
                                     -7, 1, 1, -1, 1, 
                                     1, 1, 
                                     1, 1, 1, 1,
                                     -2, 1, -1, 1, 
                                     -2, 1, 1, 1, 
                                     1, 1, -1, 1, 1, 
                                     1, 1, 1, 1, 
                                     -1, 1, -5, 1, -2, 1, 
                                     -7, 1, 1, 1, 
                                     -4, 1, 1, 
                                     1, -1, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 
                                     1, 1, 1, 1, 
                                     -1, 2, 1, 1, -1, 1, 
                                     -2, 1, 1, 1, 
                                     -10, 1, 1, 
                                     2, -2, 4, 
                                     2, 1, 
                                     -2, 2, 2, 
                                     1, 1, 1, 1, 
                                     -4, 4, 
                                     -4, 2, 1, 1, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 1, 
                                     -9, 1, 1, 1, 1,
                                     1, 1, 1, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, -7, 1, -4, 1,
                                     -2, 1, -1, 1, 
                                     -2, 1, 1, 1, 1, -3, 1, 
                                     3, 2, 3, 
                                     2, 3, 2, 
                                     3, 3, 2, 
                                     1, 
                                     -11, 1, 1, 1, 1,
                                     1, 1, 1, 1, 
                                     1, 1, 1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 1, 
                                     -1, 1, 1, 1, 
                                     1, 1, 
                                     1, 1, -1, 1,
                                     1, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 
                                     -1, 1, 1, 1, 
                                     1, 1, 1,
                                     -2, 1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 
                                     1, 1, 1, 
                                     -1, 1, -3, 1, -15, 1, -2, 1, 
                                     1, 1, 1, 1, 
                                     1, 1, 
                                     1, 1, 
                                     -4, 1, -3, 1, 1, 
                                     1, 
                                     -12, 1, -1, 1, 
                                     -6, 1, -5, 1, -2, 1, 
                                     -12, 1, 1, 
                                     -16, 1, 1, -7, 1, 
                                     -4, 1, -2, 1, -1, 1,
                                     -316, 1, -2, 1, -2, 1, -2, 1,
                                     -2, 1, -2, 1, -2, 1, -2, 1, 
                                     -312, 1, -2, 1, -2, 1, -2, 1,
                                     -2, 1, -2, 1, -2, 1, -2, 1),
                           col.names = c("VERSION", "DOB_YY", "DOB_MM", "IMP_DOBMM",
                                         "IMP_DOBDD", "DOB_TT", "DOB_WK",
                                         "OSTATE", "XOSTATE", "OCNTYFIPS", "OCNTYPOP",
                                         "BFACIL", "UBFACIL", "BFACIL3",
                                         "DOBM_IMP", "DOBM_BYP",
                                         "MAGE_IMPFLG", "MAGE_REPFLG", "MAGER",
                                         "MAGER14", "MAGER9",
                                         "MBCNTRY", "MBSTATE", "MBSTATE_REC",
                                         "MRCNTRY", "XMRSTATE", 
                                         "MRSTATEPSTL", "MRCNTYFIPS", "MRCITYFIPS", 
                                         "RCNTY_POP", "RCITY_POP", "CITYLIM", 
                                         "RECTYPE", "RESTATUS", 
                                         "MBRACE", "MRACE", "MRACEREC", "MRACEIMP",
                                         "UMHISP", "MRACEHISP", 
                                         "MAR_P", "MAR", "MAR_IMP", 
                                         "MEDUC", "MEDUC_BYP", 
                                         "DOBF_IMP", "DOBF_BYP", 
                                         "FAGERPT_FLG", "FAGECOMB",
                                         "UFAGECOMB", "FAGEREC11", 
                                         "FBRACE", "FRACEIMP", "FRACEREC",
                                         "UFHISP", "FRACEHISP",
                                         "FEDUC", "FEDUC_BYP", 
                                         "UFRACE",
                                         "PRIORTERM", "LBO_REC", "TBO_REC", 
                                         "ILPCV_DOB", "PRECARE", "PRECARE_REC",
                                         "UPREVIS", "PREVIS_REC", "PREVIS_BYP", 
                                         "WTGAIN", "WTGAIN_REC", 
                                         "DFPC_IMP", "WIC", 
                                         "CIG_0", "CIG_1", "CIG_2", "CIG_3",
                                         "CIG_REC", 
                                         "PWGT_BYP", "DWGT_BYP", 
                                         "RF_DIAB", "RF_GEST", "RF_PHYP", "RF_GHYP",
                                         "RF_ECLAM", "RF_PPTERM", "RF_PPOUTC", "RF_INFTR",
                                         "RF_FEDRG", "RF_ARTEC", 
                                         "RF_CESAR", "RF_CESARN", "RF_CES_BYP",
                                         "URF_DIAB", "URF_CHYPER", "URF_PHYPER", "URF_ECLAM",
                                         "IP_GONN", "IP_SYPH", "IP_CHLAM", 
                                         "IP_HEPB", "IP_HEPC",
                                         "OP_CERV", "OP_TOCOL", "OP_ECVS", "OP_ECVF", 
                                         "UOP_INDUC", "UOP_TOCOL",
                                         "ON_RUPTR", "ON_PRECIP", "ON_PROL",
                                         "LD_INDL", "LD_AUGM", "LD_STER", "LD_ANTI",
                                         "LD_CHOR", "LD_MECS", "LD_FINT", "LD_ANES", 
                                         "ULD_MECO", "ULD_PRECIP", "ULD_BREECH",
                                         "ME_PRES", "ME_ROUT", "ME_TRIAL", 
                                         "UME_FORCP", "UME_VAC", 
                                         "RDMETH_REC", "DMETH_REC",
                                         "MM_MTR", "MM_PLAC", "MM_RUPT", "MM_UHYST", 
                                         "MM_ICU", "MM_UOPER",
                                         "ATTEND", "MTRAN", "PAY", "PAY_REC",
                                         "APGAR5", "APGAR5R", "APGAR10", "APGAR10R",
                                         "DPLURAL", "PLUR_BYP", "IMP_PLUR",
                                         "SEX", "IMP_SEX", 
                                         "DLMP_MM", "DLMP_YY",
                                         "ESTGEST", "OBGEST_BYP", 
                                         "COMBGEST", "GESTREC10", 
                                         "GESTREC3", "OBGEST_FLG", "GEST_IMP", "COMPGST_IMP",
                                         "DBWT", 
                                         "BWTR12", "BWTR4", "BWT_BYP", "BWTIMP", 
                                         "AB_AVEN1", "AB_AVEN6", "AB_NICU", "AB_SURF", 
                                         "AB_ANTI", "AB_SEIZ", "AB_BINJ", 
                                         "CA_ANEN", "CA_MNSB", "CA_CCHD", "CA_CDH",
                                         "CA_OMPH", "CA_GAST", "CA_LIMB", "CA_CLEFT", 
                                         "CA_CLPAL", "CA_DOWN", "CA_DISOR", "CA_HYPO",
                                         "UCA_ANEN", "UCA_SPINA", "UCA_OMPHA", "UCA_CLEFTLP", 
                                         "UCA_HERNIA", "UCA_DOWNS",
                                         "ITRAN", "ILIVE", "BFED", "BMI", "BMI_R",
                                         "ILLB_R", "ILLB_R11", "ILOP_R", 
                                         "ILOP_R11", "ILP", "ILP_R11", 
                                         "PWgt_R", "DWgt_R", "M_Ht_In", 
                                         "SetOrder_R", 
                                         "F_MORIGIN", "F_FORIGIN", "F_MEDUC", "F_FEDUC",
                                         "F_CLINEST", "F_APGAR5", "F_TOBACO", "F_M_HT",
                                         "F_PWGT", "F_DWGT", "F_WIC", "F_PAY", "F_BFED", 
                                         "F_RF_PDIAB", "F_RF_GDIAB", "F_RF_PHYPER", 
                                         "F_RF_GHYPER", "F_RF_ECLAMP", "F_RF_PPB", "F_RF_PPO",
                                         "F_RF_INFT", "F_RF_INFT_DRG", "F_RF_INF_ART", 
                                         "F_RF_CESAR", "F_RF_NCESAR", 
                                         "F_IP_GONOR", "F_IP_SYPH", "F_IP_CHLAM", 
                                         "F_IP_HEPATB", "F_IP_HEPATC", 
                                         "F_OB_CERVIC", "F_OB_TOCO", "F_OB_SUCC", "F_OB_FAIL", 
                                         "F_OL_RUPTURE", "F_OL_PRECIP", "F_OL_PROLONG", 
                                         "F_LD_INDUCT", "F_LD_AUGMENT", 
                                         "F_LD_STERIODS", "F_LD_ANTIBIO", "F_LD_CHORIO", 
                                         "F_LD_MECON", "F_LD_FINTOL", "F_LD_ANESTH", 
                                         "F_MD_PRESENT", "F_MD_ROUTE", "F_MD_TRIAL", 
                                         "F_MM_MTRANS", "F_MM_LACER", "F_MM_RUPTUR", 
                                         "F_MM_UHYSTR", "F_MM_ICU", "F_MM_OR", 
                                         "F_AB_VENT", "F_AB_VENT6", "F_AB_NICU", "F_AB_SURFAC", 
                                         "F_AB_ANTIBIO", "F_AB_SEIZ", "F_AB_INJ", 
                                         "F_CA_ANEN", "F_CA_MENIN", "F_CA_HEART", 
                                         "F_CA_HERNIA", "F_CA_OMPHA", "F_CA_GASTRO", 
                                         "F_CA_LIMB", "F_CA_CLEFTLP", "F_CA_CLEFT", 
                                         "F_CA_DOWNS", "F_CA_CHROM", "F_CA_HYPOS", 
                                         "F_WTGAIN", "F_MAR_G", "F_MPCB", "F_TPCV", 
                                         "F_CIGS_0", "F_CIGS_1", "F_CIGS_2", "F_CIGS_3", 
                                         "F_FACILITY", "F_LIMIT", 
                                         "F_PAY_REC", "F_RDMETH_REC", 
                                         "F_URF_DIABETES", "F_URF_CHYPER", "F_URF_PHYPER", 
                                         "F_URF_ECLAMP", 
                                         "F_UOB_INDUCT", "F_UOB_TOCOL", 
                                         "F_ULD_MECONIUM", "F_ULD_PRECIP", "F_ULD_BREECH", 
                                         "F_U_FORCEP", "F_U_VACUUM", 
                                         "F_UCA_ANEN", "F_UCA_SPINA", "F_UCA_OMPHALO", 
                                         "F_UCA_CLEFTLP", "F_UCA_HERNIA", "F_UCA_DOWNS", 
                                         "MRACE1E", "MRACE2E", "MRACE3E", "MRACE4E",
                                         "MRACE5E", "MRACE6E", "MRACE7E", "MRACE8E", 
                                         "FRACE1E", "FRACE2E", "FRACE3E", "FRACE4E", 
                                         "FRACE5E", "FRACE6E", "FRACE7E", "FRACE8E"))

## Creating Variable Labels 

# CERT - no observations 

unlabeled_2012 <- unlabeled_2012 %>% mutate(VERSION = as.numeric(case_when(
  VERSION == "A" ~ "1",
  VERSION == "S" ~ "0")))
var_lab(unlabeled_2012$VERSION) = "Version" 
val_lab(unlabeled_2012$VERSION) = num_lab("
                                          1 State used the 2003 version of the US Standard Birth Certificate (Revised)
                                          0 State used the 1989 version of the US Standard Birth Certificate (Unrevised)
                                          ") 

# RECWT - no observations 			
# LATEREC - no observations 

## Birth date Variables

var_lab(unlabeled_2012$DOB_YY) = "Birth Year"

var_lab(unlabeled_2012$DOB_MM) = "Birth Month"
val_lab(unlabeled_2012$DOB_MM) = num_lab("
                                          1 January 
                                          2 February 
                                          3 March 
                                          4 April 
                                          5 May 
                                          6 June
                                          7 July 
                                          8 August 
                                          9 September 
                                          10 October 
                                          11 November 
                                          12 December   
                                         ")

var_lab(unlabeled_2012$IMP_DOBMM) = "Birth Month Imputed"
val_lab(unlabeled_2012$IMP_DOBMM) = num_lab("
                                          1 Imputed
                                         ") # missing = not imputed 

# DOB_DD = no observations 

var_lab(unlabeled_2012$IMP_DOBDD) = "Birth Date Imputed"
val_lab(unlabeled_2012$IMP_DOBDD) = num_lab("
                                          1 Imputed
                                         ") # missing = not imputed 

var_lab(unlabeled_2012$DOB_TT) = "Birth Time"
val_lab(unlabeled_2012$DOB_TT) = num_lab("
                                          9999 Not Stated 
                                         ")

var_lab(unlabeled_2012$DOB_WK) = "Birth Day of Week"
val_lab(unlabeled_2012$DOB_WK) = num_lab("
                                          1 Sunday 
                                          2 Monday 
                                          3 Tuesday 
                                          4 Wednesday 
                                          5 Thursday
                                          6 Friday 
                                          7 Saturday   
                                         ")

## Geography
var_lab(unlabeled_2012$OSTATE) = "Occurrence Postal State"

var_lab(unlabeled_2012$XOSTATE) = "Expanded Occurrence State (NY = NY not including NYC, YC = NYC)"

var_lab(unlabeled_2012$OCNTYFIPS) = "Occurrence FIPS County"

var_lab(unlabeled_2012$OCNTYPOP) = "Occurrence County Population"
val_lab(unlabeled_2012$OCNTYPOP) = num_lab("
                                          0 County of 1,000,000 or more
                                          1 County of 500,000 to 1,000,000
				                                  2 County of 250,000 to 500,000
				                                  3 County of 100,000 to 250,000
				                                  4 County of 50,000 to 100,000
				                                  5 County of 25,000 to 50,000
				                                  6 County of 10,000 to 25,000 
				                                  9 County less than 10,000  
                                         ")

## Birth Place 
var_lab(unlabeled_2012$BFACIL) = "Birth Place (Revised)"
val_lab(unlabeled_2012$BFACIL) = num_lab("
                                         1 Hospital 
                                         2 Freestanding Birthing Center 
                                         3 Home (intended) 
                                         4 Home (not intended) 
                                         5 Home (unknown if intended)	
                                         6 Clinic / Doctor's Office
                                         7 Other 
                                         9 Unknown
                                         ")

var_lab(unlabeled_2012$UBFACIL) = "Birth Place"
val_lab(unlabeled_2012$UBFACIL) = num_lab("
                                         1 Hospital 
                                         2 Freestanding Birthing Center 
                                         3 Clinic / Doctor's Office
                                         4 Residence 
                                         5 Other 
                                         9 Unknown
                                         ")

# FACIDN - no observations 
# FACIDS - no observations 

var_lab(unlabeled_2012$BFACIL3) = "Birth Place Recode"
val_lab(unlabeled_2012$BFACIL3) = num_lab("
                                         1 In Hospital 
                                         2 Not in Hospital 
                                         3 Unknown or Not Stated
                                         ")

## Mother Birth Date and Age 
# DOBM_MM - no observations 
# DOBM_DD - no observations 

var_lab(unlabeled_2012$DOBM_IMP) = "Mother's Birth Day Imputed" 
val_lab(unlabeled_2012$DOBM_IMP) = num_lab("
                                           1 Birth day imputed
                                           ") # missing = not imputed 

# DOBM_YY - no observations 

var_lab(unlabeled_2012$DOBM_BYP) = "Mother's Age Bypass" 
val_lab(unlabeled_2012$DOBM_BYP) = num_lab("
                                           0 Edit passed
                                           1 Data Queried
                                           2 Invalid bypass response 
                                           ") # missing = not imputed 

# MAGERPT - no observations 
# MAGECOMP - no observations 
# MAGECOMB - no observations 

var_lab(unlabeled_2012$MAGE_IMPFLG) = "Mother's Age Imputed" 
val_lab(unlabeled_2012$MAGE_IMPFLG) = num_lab("
                                           1 Age imputed
                                           ") # missing = not imputed 

var_lab(unlabeled_2012$MAGE_REPFLG) = "Reported Age of Mother Used Flag"
val_lab(unlabeled_2012$MAGE_REPFLG) = num_lab("
                                          1 Reported age used
                                          ") # missing = reported age not used

var_lab(unlabeled_2012$MAGER) = "Mother's Age Recode 41"
val_lab(unlabeled_2012$MAGER) = num_lab("
                                    12 10-12 
                                    50 50 years and over
                                    ") 

var_lab(unlabeled_2012$MAGER14) = "Mother's Age Recode 14" 
val_lab(unlabeled_2012$MAGER14) = num_lab("
                                      1 Under 15 Years 
                                      3 15 years 
                                      04 16 years 
                                      05 17 years
                                      06 18 years 
                                      07 19 years 
                                      08 20-24 years 
                                      09 25-29 years
                                      10 30-34 years 
                                      11 35-39 years 
                                      12 40-44 years 
                                      13 45-49 years
                                      14 50-54 years 
                                      ") 

var_lab(unlabeled_2012$MAGER9) = "Mother's Age Recode 9" 
val_lab(unlabeled_2012$MAGER9) = num_lab("
                                     1 Under 15 years 
                                     2 15-19 years 
                                     3 20-24 years 
                                     4 25-29 years 
                                     5 30-34 years 
                                     6 35-39 years 
                                     7 40-44 years 
                                     8 45-49 years 
                                     9 50-54 years
                                      ") 

# Mother Birth Place Geography 
var_lab(unlabeled_2012$MBCNTRY) = "Mother's Birth Country Code" 

var_lab(unlabeled_2012$MBSTATE) = "Mother's Postal Birth State (Revised)" 

var_lab(unlabeled_2012$MBSTATE_REC) = "Mother's Birth State Recode"
val_lab(unlabeled_2012$MBSTATE_REC) = num_lab("
                                          1 Born in the U.S. (50 US States) 
                                          2 Born outside the U.S. (includes possessions)
                                          3 Unknown or Not Stated
                                          ") 

# Mother Residence Geography 
var_lab(unlabeled_2012$MRCNTRY) = "Mother's Residence Country"

var_lab(unlabeled_2012$XMRSTATE) = "Expanded State of Residence of Mother  (NY = NY not including NYC, YC = NYC)"

var_lab(unlabeled_2012$MRSTATEPSTL) = "Mother's Residence Postal State" 

var_lab(unlabeled_2012$MRCNTYFIPS) = "Mother's FIPS County"
val_lab(unlabeled_2012$MRCNTYFIPS) = num_lab("
                                          000 Foreign
                                          ") 

var_lab(unlabeled_2012$MRCITYFIPS) = "Mother's Residence City"
val_lab(unlabeled_2012$MRCITYFIPS) = num_lab("
                                          00000 Foreign
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(RCNTY_POP = as.numeric(case_when(
  RCNTY_POP == "Z" ~ "999",
  RCNTY_POP == "0" ~ "0",
  RCNTY_POP == "1" ~ "1",
  RCNTY_POP == "2" ~ "2",
  RCNTY_POP == "3" ~ "3",
  RCNTY_POP == "4" ~ "4",
  RCNTY_POP == "5" ~ "5",
  RCNTY_POP == "6" ~ "6",
  RCNTY_POP == "9" ~ "9")))
var_lab(unlabeled_2012$RCNTY_POP) = "Population of Residence County" 
val_lab(unlabeled_2012$RCNTY_POP) = num_lab("
                                        0 County of 1,000,000 or more
                                        1 County of 500,000 to 1,000,000
				                                2 County of 250,000 to 500,000
				                                3 County of 100,000 to 250,000
				                                4 County of 50,000 to 100,000
				                                5 County of 25,000 to 50,000
				                                6 County of 10,000 to 25,000
				                                9 County less than 10,000
					                              999 Foreign resident
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(RCITY_POP = as.numeric(case_when(
  RCITY_POP == "Z" ~ "999",
  RCITY_POP == "0" ~ "0",
  RCITY_POP == "1" ~ "1",
  RCITY_POP == "2" ~ "2",
  RCITY_POP == "3" ~ "3",
  RCITY_POP == "4" ~ "4",
  RCITY_POP == "5" ~ "5",
  RCITY_POP == "6" ~ "6",
  RCITY_POP == "9" ~ "9")))
var_lab(unlabeled_2012$RCITY_POP) = "Population of Residence City" 
val_lab(unlabeled_2012$RCITY_POP) = num_lab("
                                        0 City of 1,000,000 or more
                                        1 City of 500,000 to 1,000,000
                                        2 City of 250,000 to 500,000
                                        3 City of 100,000 to 250,000
                                        4 City of 50,000 to 100,000
                                        5 City of 25,000 to 50,000
                                        6 City of 10,000 to 25,000
                                        9 All other areas in the US
                                        999 Foreign resident 
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(CITYLIM = as.numeric(case_when(
  CITYLIM == "Y" ~ "1",
  CITYLIM == "N" ~ "0",
  CITYLIM == "U" ~ "9")))
var_lab(unlabeled_2012$CITYLIM) = "Inside City Limits" 
val_lab(unlabeled_2012$CITYLIM) = num_lab("
                                      0 No 
                                      1 Yes 
                                      9 Unknown or not stated	 
                                          ") 

var_lab(unlabeled_2012$RECTYPE) = "Record Type"
val_lab(unlabeled_2012$RECTYPE) = num_lab("
                                      1 Resident: State and county of occurrence and resident are the same
                                      2 Nonresident: State and county of occurrence and residence are different
                                          ") 

var_lab(unlabeled_2012$RESTATUS) = "Residence Status"
# same numbers = different labels for US and US territories (US / US territory)
# typo in codebook (3	INTERTERRITORY RESIDENT)
val_lab(unlabeled_2012$RESTATUS) = num_lab("
                                       1 Resident 
                                       2 Intrastate/Intraterritory Nonresident
                                       3 Interstate/Interterritory Resident 
                                       4 Foreign Resident
                                          ") 

## Mother Race 
var_lab(unlabeled_2012$MBRACE) = "Mother's Bridged Race" 
# labels for Puerto Rico (000 = Other; 01 = White; 02 = Black)
val_lab(unlabeled_2012$MBRACE) = num_lab("
                                       01 White 
                                       02 Black 
                                       03 American Indian 
                                       04 Asian Indian
                                       05 Chinese 
                                       06 Filipino 
                                       07 Japanese 
                                       08 Korean 
                                       09 Vietnamese
                                       10 Other Asian 
                                       11 Hawaiian
                                       12 Guamanian 
                                       13 Samoan
                                       14 Other Pacific Islander 
                                       21 Bridged White
                                       22 Bridged Black
                                       23 Bridged American Indian & Alaskan Native	
                                       24 Bridged Asian / Pacific Islander
                                       00 Other (not classified as White or Black; Puerto Rico only)
                                          ") 

var_lab(unlabeled_2012$MRACE) = "Mother's Race" 
# labels for Puerto Rico (00 = Other races; 01 = White; 02 = Black)
# labels for Guam (01-07, 58 same as US; 08 = Other Asian or Pacific Islander)
# all other territories (01-07 same as US; 08 = Other Asian or Pacific Islander)
val_lab(unlabeled_2012$MRACE) = num_lab("
                                        01 White
                                        02 Black 
                                        03 American Indian or Alaskan Native
                                        04 Chinese 
                                        05 Japanese
                                        06 Hawaiian (includes part Hawaiian)
                                        07 Filipino 
                                        18 Asian Indian
                                        28 Korean
                                        38 Samoan
                                        48 Vietnamese
                                        58 Guamanian
                                        68 Other Asian or Pacific Islander in areas reporting codes 18-58
                                        78 Combined other Asian or Pacific Islander, includes 18-68 for areas that do not report them separately
                                        00 Other race (Puerto Rico Only)
                                        08 Other Asian or Pacific Islander (Guam / Other Territories only)
                                        ") 

var_lab(unlabeled_2012$MRACEREC) = "Mother's Race Recode" 
# labels for Puerto Rico (0 = Other; 1 - White; 2 - Black)
val_lab(unlabeled_2012$MRACEREC) = num_lab("
                                           1 White
                                           2 Black
                                           3 American Indian or Alaskan Native
                                           4 Asian or Pacific Islander
                                           0 Other (not classified as White or Black; Puerto Rico Only)
                                        ") 

var_lab(unlabeled_2012$MRACEIMP) = "Mother's Race Imputed" 
# missing = not imputed 
val_lab(unlabeled_2012$MRACEIMP) = num_lab("
                                       1 Unknown race imputed 
                                       2 All other races, formerly coded 09, imputed
                                          ") 

## Mother Hispanic Origin 
# MHISP - no observations 

var_lab(unlabeled_2012$UMHISP) = "Mother's Hispanic Origin (Unrevised)" 
val_lab(unlabeled_2012$UMHISP) = num_lab("
                                       0 Non-Hispanic
                                       1 Mexican
                                       2 Puerto Rican 
                                       3 Cuban
                                       4 Central or South American
                                       5 Other and Unknown Hispanic
                                       9 Origin unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MRACEHISP) = "Mother's Race/Hispanic Origin"
val_lab(unlabeled_2012$MRACEHISP) = num_lab("
                                       1 Mexican 
                                       2 Puerto Rican
                                       3 Cuban
                                       4 Central or South American
                                       5 Other and Unknown Hispanic
                                       6 Non-Hispanic White
                                       7 Non-Hispanic Black
                                       8 Non-Hispanic Other Races
                                       9 Origin unknown or not stated
                                          ") 

## Marital Status and Paternity
# MAR_E - no observations 
# MAR_G - no observations 

unlabeled_2012 <- unlabeled_2012 %>% mutate(MAR_P = as.numeric(case_when(
  MAR_P == "Y" ~ "1",
  MAR_P == "N" ~ "0",
  MAR_P == "U" ~ "2",
  MAR_P == "X" ~ "9")))
var_lab(unlabeled_2012$MAR_P) = "Paternity Acknowledged" 
val_lab(unlabeled_2012$MAR_P) = num_lab("
                                     0 No 
                                     1 Yes 
                                     2 Unknown 
                                     9 Not Applicable  
                                          ") 

var_lab(unlabeled_2012$MAR) = "Mother's Marital Status" 
# variable labels different for United States & all non-Puerto Rican Territories
# and for Puerto Rico (1 = same, 2 = US / PR, 3 = PR only; 9 = same)
val_lab(unlabeled_2012$MAR) = num_lab("
                                      1 Yes
                                      2 No / Unmarried parents living together
                                      3 Unmarried parents not living together (Puerto Rico Only
                                      9 Unknown or not Stated
                                          ") 

var_lab(unlabeled_2012$MAR_IMP) = "Mother's Marital Status Imputed" 
val_lab(unlabeled_2012$MAR_IMP) = num_lab("
                                      1 Marital Status imputed 
                                          ") # missing = not imputed 

## Mother Education 
var_lab(unlabeled_2012$MEDUC) = "Mother's Education"
val_lab(unlabeled_2012$MEDUC) = num_lab("
                                    1 8th grade or less 
                                    2 9th through 12th grade with no diploma 
                                    3 High school graduate or GED completed
                                    4 Some college credit, but not a degree
                                    5 Associate degree (AA, AS)
                                    6 Bachelor's degree (BA, AB, BS)
                                    7 Master's degree (MA, MS, MEng, MEd, MSW, MBA)
                                    8 Doctorate (PHD, EdD) or Professional Degree (MD, DDS, DVM, LLB, JD)
                                    9 Unknown 
                                          ") 

# UMEDUC - no observations 
# MEDUC_REC - no observations 

var_lab(unlabeled_2012$MEDUC_BYP) = "Mother's Education Bypass"
val_lab(unlabeled_2012$MEDUC_BYP) = num_lab("
                                    0 Edit Passed
                                    1 Edit failed, data queried and verified
                                    2 Edit failed, data queried but not verified
                                          ") # missing = Bypass not used 

# MMULTIRACE - no observations

## Father Birth and Age 
# DOBF_MM - no observations 
# DOBF_DD - no observations 

var_lab(unlabeled_2012$DOBF_IMP) = "Father's Birth Day Imputed" 
val_lab(unlabeled_2012$DOBF_IMP) = num_lab("
                                          1 Birth day imputed
                                          ") # missing = not imputed 

# DOBF_YY - no observations 

var_lab(unlabeled_2012$DOBF_BYP) = "Father's Birth Day Bypass" 
val_lab(unlabeled_2012$DOBF_BYP) = num_lab("
                                           0 Edit Passed
                                           1 Data Queried
                                           2 Invalid Bypass Response
                                          ") # missing = Bypass not used 

var_lab(unlabeled_2012$FAGERPT_FLG) = "Father's Reported Age Used" 
val_lab(unlabeled_2012$FAGERPT_FLG) = num_lab("
                                          1 Father's reported age used
                                          ") # missing = not used 

# FAGERPT - no observations 
# FAGECOMP - no observations 
# UFAGECOMP - no observations 

var_lab(unlabeled_2012$FAGECOMB) = "Father's Combined Age (Revised)" 
val_lab(unlabeled_2012$FAGECOMB) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$UFAGECOMB) = "Father's Combined Age (Unrevised)"
val_lab(unlabeled_2012$UFAGECOMB) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$FAGEREC11) = "Father's Age Recode 11" 
val_lab(unlabeled_2012$FAGEREC11) = num_lab("
                                        1 Under 15 years 
                                        2 15-19 years 
                                        3 20-24 years 
                                        4 25-29 years
                                        5 30-34 years 
                                        6 35-39 years 
                                        7 40-44 years 
                                        8 45-49 years
                                        9 50-54 years 
                                        10 55-98 years 
                                        11 Not stated
                                          ")

## Father Race 
var_lab(unlabeled_2012$FBRACE) = "Father's Bridged Race" 
# labels for Puerto Rico (000 = Other; 01 = White; 02 = Black; 99 = Unknown or not stated)
val_lab(unlabeled_2012$FBRACE) = num_lab("
                                        01 White
                                        02 Black
                                        03 American Indian
                                        04 Asian Indian
                                        05 Chinese
                                        06 Filipino
                                        07 Japanese
                                        08 Korean
                                        09 Vietnamese
                                        10 Other Asian
                                        11 Hawaiian
                                        12 Guamanian
                                        13 Samoan
                                        14 Other Pacific Islander
                                        15 Other
                                        21 Bridged White
                                        22 Bridged Black
                                        23 Bridged American Indian & Alaskan Native
                                        24 Bridged Asian / Pacific Islander
                                        99 Unknown or not stated, also includes states not reporting multiple race
                                        00 Other (not classified as White or Black; Puerto Rico only)
                                          ")

var_lab(unlabeled_2012$FRACEIMP) = "Father's Race Imputed"
val_lab(unlabeled_2012$FRACEIMP) = num_lab("
                                        3 Father's race imputed
                                          ") # missing - not imputed 

var_lab(unlabeled_2012$FRACEREC) = "Father's Race Recode" 
# variable labels different for United States and non-Puerto Rican Territories
# and for Puerto Rico (1,2,9 = same; 3,4 = US and non-PR territories only; 0 = PR only)
val_lab(unlabeled_2012$FRACEREC) = num_lab("
                                           1 White
                                           2 Black
                                           3 American Indian or Alaskan Native
                                           4 Asian or Pacific Islander
                                           9 Unknown or not stated
                                           0 Other (not classified as White or Black; Puerto Rico Only)
                                          ") 

## Father Hispanic Origin 
# FHISP - no observations 

var_lab(unlabeled_2012$UFHISP) = "Father's Hispanic Origin-Unrevised" 
val_lab(unlabeled_2012$UFHISP) = num_lab("
                                         0 Non-Hispanic
                                         1 Mexican
                                         2 Puerto Rican
                                         3 Cuban
                                         4 Central or South American
                                         5 Other and Unknown Hispanic
                                         9 Origin unknown or not stated
                                          ") 

var_lab(unlabeled_2012$FRACEHISP) = "Father's Race/Hisp Origin"
val_lab(unlabeled_2012$FRACEHISP) = num_lab("
                                            1 Mexican
                                            2 Puerto Rican
                                            3 Cuban
                                            4 Central or South American
                                            5 Other and Unknown Hispanic
                                            6 Non-Hispanic White
                                            7 Non-Hispanic Black
                                            8 Non-Hispanic Other Races
                                            9 Origin unknown or not stated
                                            ") 

## Father's Education 
var_lab(unlabeled_2012$FEDUC) = "Father's Education"	 
val_lab(unlabeled_2012$FEDUC) = num_lab("
                                    1 8th grade or less 
                                    2 9th through 12th grade with no diploma
                                    3 High school graduate or GED completed 
                                    4 Some college credit, but not a degree
                                    5 Associate degree (AA, AS)
                                    6 Bachelor's degree (BA, AB, BS)
                                    7 Master's degree (MA, MS, MEng, MEd, MSW, MBA)
                                    8 Doctorate (PHD, EdD) or Professional Degree (MD, DDS, DVM, LLB, JD)
                                    9 Unknown
                                          ") 

var_lab(unlabeled_2012$FEDUC_BYP) = "Father's Education Bypass" 
val_lab(unlabeled_2012$FEDUC_BYP) = num_lab("
                                            0 Edit passed
                                            1 Edit failed, data queried and verified
                                            2 Edit failed, data queried and not verified
                                            ") # missing = Bypass not used 

## Father Race 
var_lab(unlabeled_2012$UFRACE) = "Father's Race (Unrevised)"
# labels for Puerto Rico (00 = Other races; 01, 99 = same as US; 03 = Black)
# SUSPECT TYPO IN CODEBOOK (CODEBOOK SAYS 03 = BLACK; SUSPECT IT IS ACTUALLY O2 = BLACK)
# labels for Guam (01-07, 58, 99 same as US; 08 = Other Asian or Pacific Islander)
# labels for all other territories (01-07, 99 same as US; 08 = Other Asian or Pacific Islander)
val_lab(unlabeled_2012$UFRACE) = num_lab("
                                         01 White
                                         02 Black
                                         03 American Indian & Alaskan Natives
                                         04 Chinese 05 Japanese 
                                         06 Hawaiian (includes part Hawaiian)
                                         07 Filipino
                                         08 Other Asian or Pacific Islander (Guam and All other territories only)
                                         18 Asian Indian
                                         28 Korean
                                         38 Samoan
                                         48 Vietnames
                                         58 Guamanian
                                         68 Other Asian or Pacific Islander in areas reporting codes 18-58
                                         78 Combined other Asian or Pacific Islander, includes 18-68 for areas that do not report them separately
                                         99 Unknown or not stated
                                         00 Other races not classified white or black (Puerto Rico Only)
                                          ") 

#FMULTIRACE - no observations 

## Prior Births 
# PRIORLIVE - no observations 
# PRIORDEAD - no observations 

var_lab(unlabeled_2012$PRIORTERM) = "Prior Other Terminations"
val_lab(unlabeled_2012$PRIORTERM) = num_lab("
                                            99 Unknown or not stated
                                           ") 

# LBO - no observations 

var_lab(unlabeled_2012$LBO_REC) = "Live Birth Order Recode"
val_lab(unlabeled_2012$LBO_REC) = num_lab("
                                       8 8 or more live births 
                                       9 Unknown or not stated
                                          ") 

# TBO - no observations 

var_lab(unlabeled_2012$TBO_REC) = "Total Birth Order Recode"
val_lab(unlabeled_2012$TBO_REC) = num_lab("
                                      8 8 or more total births 
                                      9 Unknown or not stated
                                          ") 

# DLLB_MM - no observations 
# DLLB_YY - no observations 
# DLOO_MM - no observations 
# DLOO_YY - no observations 
# ILLB - no observations 
# ILOO - no observations 
# ILP - no observations 

# Prenatal Care and Weight Gain
var_lab(unlabeled_2012$ILPCV_DOB) = "Interval Between Last Prenatal Care Visit & Date of Delivery" 
val_lab(unlabeled_2012$ILPCV_DOB) = num_lab("
                                            98 98 days and above
                                            99 Unknown or not stated
                                           ") 

var_lab(unlabeled_2012$PRECARE) = "Month Prenatal Care Began (Revised)" 
val_lab(unlabeled_2012$PRECARE) = num_lab("
                                          00 No prenatal care
                                          99 Unknown or not stated
                                           ") 

var_lab(unlabeled_2012$PRECARE_REC) = "Month Prenatal Care Began Recode (Revised)"
val_lab(unlabeled_2012$PRECARE_REC) = num_lab("
                                              1 1st to 3rd month
                                              2 4th to 6th month
                                              3 7th to final month
                                              4 No prenatal care
                                              5 Unknown or not stated
                                           ") 

# DFPC_MM - no observations 
# DFPC_DD - no observations 
# DFPC_YY - no observations 
# MPCB - no observations 
# MPCB_REC6 - no observations 
# MPCB_REC5 - no observations 					 
# DLPC_MM - no observations 
# DLPC_DD - no observations 					 
# DLPC_YY - no observations 					 
# PREVIS - no observations 

var_lab(unlabeled_2012$UPREVIS) = "Number of Prenatal Visits (Unrevised)"					
val_lab(unlabeled_2012$UPREVIS) = num_lab("
                                          99 Unknown or not stated
                                           ") 

var_lab(unlabeled_2012$PREVIS_REC) = "Number of Prenatal Visits Recode"			
val_lab(unlabeled_2012$PREVIS_REC) = num_lab("
                                             1 No visits
                                             2 1 to 2 visits
                                             3 3 to 4 visits
                                             4 5 to 6 visits
                                             5 7 to 8 visits
                                             6 9 to 10 visits
                                             7 11 to 12 visits
                                             8 13 to 14 visits
                                             9 15 to 16 visits
                                             10 17 to 18 visits
                                             11 19 or more visits
                                             12 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$PREVIS_BYP) = "Prenatal Visits Bypass" 
# missing = Bypass not used 
val_lab(unlabeled_2012$PREVIS_BYP) = num_lab("
                                             0 Edit passed
                                             1 Edit failed, number verified
                                             2 Edit failed, number not verified
                                            ") 

# APNCU - no observations

var_lab(unlabeled_2012$WTGAIN) = "Weight Gain"
val_lab(unlabeled_2012$WTGAIN) = num_lab("
                                         98 98 pounds and over
                                         99 Unknown or not stated
                                         ") 

var_lab(unlabeled_2012$WTGAIN_REC) =  "Weight Gain Recode"
val_lab(unlabeled_2012$WTGAIN_REC) = num_lab("
                                             1 Less than 11 pounds
                                             2 11 to 20 pounds
                                             3 21 to 30 pounds
                                             4 31 to 40 pounds
                                             5 41 to 98 pounds
                                             9 Unknown or not stated
                                         ") 

var_lab(unlabeled_2012$DFPC_IMP) =  "Date First Prenatal Imputed"
val_lab(unlabeled_2012$DFPC_IMP) = num_lab("
                                           1 Imputed
                                           ") # missing = not imputed 

## WIC
unlabeled_2012 <- unlabeled_2012 %>% mutate(WIC = as.numeric(case_when(
  WIC == "Y" ~ "1",
  WIC == "N" ~ "0",
  WIC == "U" ~ "9")))
var_lab(unlabeled_2012$WIC) = "WIC"
val_lab(unlabeled_2012$WIC) = num_lab("
                                   0 No
                                   1 Yes 
                                   9 Unknown or not stated
                                          ") 

## Cigarette Use 
var_lab(unlabeled_2012$CIG_0) = "Cigarettes Before Pregnancy" 
val_lab(unlabeled_2012$CIG_0) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CIG_1) = "Cigarettes 1st Trimester" 
val_lab(unlabeled_2012$CIG_1) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CIG_2) = "Cigarettes 2nd Trimester" 
val_lab(unlabeled_2012$CIG_2) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CIG_3) = "Cigarettes 3rd Trimester" 
val_lab(unlabeled_2012$CIG_3) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

# TOBUSE - no observations
# CIGS - no observations
# UCIG_REC6 - no observations

unlabeled_2012 <- unlabeled_2012 %>% mutate(CIG_REC = as.numeric(case_when(
  CIG_REC == "Y" ~ "1",
  CIG_REC == "N" ~ "0",
  CIG_REC == "U" ~ "9")))
var_lab(unlabeled_2012$CIG_REC) = "Cigarette Recode (Revised)"
val_lab(unlabeled_2012$CIG_REC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

## Mother Height and Weight 
# MHT_FT - no observations 
# MHT_IN - no observations 
# MHT_BYP - no observations 
# PWGT - no observations 

var_lab(unlabeled_2012$PWGT_BYP) = "Prepregnancy Weight Bypass"
val_lab(unlabeled_2012$PWGT_BYP) = num_lab("
                                           0 Edit passed
                                           1 Edit failed, verified
                                           2 Edit failed, not verified
                                          ") # missing = Bypass not used 

# DWGT - no observations 

var_lab(unlabeled_2012$DWGT_BYP) = "Delivery Weight Bypass"
val_lab(unlabeled_2012$DWGT_BYP) = num_lab("
                                           0 Edit passed
                                           1 Edit failed, verified
                                           2 Edit failed, not verified
                                          ") # missing = Bypass not used 

## Risk Factors 
unlabeled_2012 <- unlabeled_2012 %>% mutate(RF_DIAB = as.numeric(case_when(
  RF_DIAB == "Y" ~ "1",
  RF_DIAB == "N" ~ "0",
  RF_DIAB == "U" ~ "9")),
  RF_GEST = as.numeric(case_when(
    RF_GEST == "Y" ~ "1",
    RF_GEST == "N" ~ "0",
    RF_GEST == "U" ~ "9")),
  RF_PHYP = as.numeric(case_when(
    RF_PHYP == "Y" ~ "1",
    RF_PHYP == "N" ~ "0",
    RF_PHYP == "U" ~ "9")),
  RF_GHYP = as.numeric(case_when(
    RF_GHYP == "Y" ~ "1",
    RF_GHYP == "N" ~ "0",
    RF_GHYP == "U" ~ "9")),
  RF_ECLAM = as.numeric(case_when(
    RF_ECLAM == "Y" ~ "1",
    RF_ECLAM == "N" ~ "0",
    RF_ECLAM == "U" ~ "9")),
  RF_PPTERM = as.numeric(case_when(
    RF_PPTERM == "Y" ~ "1",
    RF_PPTERM == "N" ~ "0",
    RF_PPTERM == "U" ~ "9")),
  RF_PPOUTC = as.numeric(case_when(
    RF_PPOUTC == "Y" ~ "1",
    RF_PPOUTC == "N" ~ "0",
    RF_PPOUTC == "U" ~ "9")),
  RF_INFTR = as.numeric(case_when(
    RF_INFTR == "Y" ~ "1",
    RF_INFTR == "N" ~ "0",
    RF_INFTR == "U" ~ "9")))

var_lab(unlabeled_2012$RF_DIAB) = "Prepregnancy Diabetes"
val_lab(unlabeled_2012$RF_DIAB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_GEST) = "Gestational Diabetes"
val_lab(unlabeled_2012$RF_GEST) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_PHYP) = "Prepregnancy Hypertension"
val_lab(unlabeled_2012$RF_PHYP) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_GHYP) = "Gestational Hypertension"
val_lab(unlabeled_2012$RF_GHYP) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_ECLAM) = "Hypertension Eclampsia"
val_lab(unlabeled_2012$RF_ECLAM) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_PPTERM) = "Previous Preterm Birth"
val_lab(unlabeled_2012$RF_PPTERM) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_PPOUTC) = "Poor Pregnancy Outcome"
val_lab(unlabeled_2012$RF_PPOUTC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_INFTR) = "Infertility Treatment"
val_lab(unlabeled_2012$RF_INFTR) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(RF_FEDRG = as.numeric(case_when(
  RF_FEDRG == "Y" ~ "1",
  RF_FEDRG == "N" ~ "0",
  RF_FEDRG == "X" ~ "8",
  RF_FEDRG == "U" ~ "9")),
  RF_ARTEC = as.numeric(case_when(
    RF_ARTEC == "Y" ~ "1",
    RF_ARTEC == "N" ~ "0",
    RF_ARTEC == "X" ~ "8",
    RF_ARTEC == "U" ~ "9")))

var_lab(unlabeled_2012$RF_FEDRG) = "Fertility Enhancing Drugs"
val_lab(unlabeled_2012$RF_FEDRG) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_ARTEC) = "Asst. Reproductive Technology"
val_lab(unlabeled_2012$RF_ARTEC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(RF_CESAR = as.numeric(case_when(
  RF_CESAR == "Y" ~ "1",
  RF_CESAR == "N" ~ "0",
  RF_CESAR == "U" ~ "9")))
var_lab(unlabeled_2012$RF_CESAR) =  "Previous Cesareans"
val_lab(unlabeled_2012$RF_CESAR) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_CESARN) =  "Previous Cesareans Num"
val_lab(unlabeled_2012$RF_CESARN) = num_lab("
                                        00 None 
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$RF_CES_BYP) = "Cesarean Bypass" 
val_lab(unlabeled_2012$RF_CES_BYP) = num_lab("
                                             0 Edit passed
                                             1 Edit failed, verified
                                             2 Invalid response
                                             ") 

# Risk Factors (Unrevised) 
var_lab(unlabeled_2012$URF_DIAB) = "Diabetes" 
val_lab(unlabeled_2012$URF_DIAB) = num_lab("
                                           1 Yes
                                           2 No
                                           9 Unknown
                                             ") 

var_lab(unlabeled_2012$URF_CHYPER) = "Chronic Hypertension" 
val_lab(unlabeled_2012$URF_CHYPER) = num_lab("
                                           1 Yes
                                           2 No
                                           9 Unknown
                                             ") 

var_lab(unlabeled_2012$URF_PHYPER) = "Prepregnancy Associated Hypertension"
val_lab(unlabeled_2012$URF_PHYPER) = num_lab("
                                           1 Yes
                                           2 No
                                           9 Unknown
                                             ") 

var_lab(unlabeled_2012$URF_ECLAM) = "Eclampsia" 
val_lab(unlabeled_2012$URF_ECLAM) = num_lab("
                                           1 Yes
                                           2 No
                                           9 Unknown
                                             ") 

# Infections Present 
unlabeled_2012 <- unlabeled_2012 %>% mutate(IP_GONN = as.numeric(case_when(
  IP_GONN == "Y" ~ "1",
  IP_GONN == "N" ~ "0",
  IP_GONN == "U" ~ "9")),
  IP_SYPH = as.numeric(case_when(
    IP_SYPH == "Y" ~ "1",
    IP_SYPH == "N" ~ "0",
    IP_SYPH == "U" ~ "9")),
  
  # IP_HSV - no observations
  
  IP_CHLAM = as.numeric(case_when(
    IP_CHLAM == "Y" ~ "1",
    IP_CHLAM == "N" ~ "0",
    IP_CHLAM == "U" ~ "9")),
  IP_HEPB = as.numeric(case_when(
    IP_HEPB == "Y" ~ "1",
    IP_HEPB == "N" ~ "0",
    IP_HEPB == "U" ~ "9")),
  IP_HEPC = as.numeric(case_when(
    IP_HEPC == "Y" ~ "1",
    IP_HEPC == "N" ~ "0",
    IP_HEPC == "U" ~ "9")))

var_lab(unlabeled_2012$IP_GONN) =  "Gonorrhea" 
val_lab(unlabeled_2012$IP_GONN) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$IP_SYPH) =  "Syphilis" 
val_lab(unlabeled_2012$IP_SYPH) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$IP_CHLAM) =  "Chlamydia"
val_lab(unlabeled_2012$IP_CHLAM) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$IP_HEPB) = "Hepatitis B"
val_lab(unlabeled_2012$IP_HEPB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$IP_HEPC) = "Hepatitis C"
val_lab(unlabeled_2012$IP_HEPC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

# Obstetric Procedures
unlabeled_2012 <- unlabeled_2012 %>% mutate(
  OP_CERV = as.numeric(case_when(
    OP_CERV == "Y" ~ "1",
    OP_CERV == "N" ~ "0",
    OP_CERV == "U" ~ "9")),
  OP_TOCOL = as.numeric(case_when(
    OP_TOCOL == "Y" ~ "1",
    OP_TOCOL == "N" ~ "0",
    OP_TOCOL == "U" ~ "9")),
  OP_ECVS = as.numeric(case_when(
    OP_ECVS == "Y" ~ "1",
    OP_ECVS == "N" ~ "0",
    OP_ECVS == "U" ~ "9")),
  OP_ECVF = as.numeric(case_when(
    OP_ECVF == "Y" ~ "1",
    OP_ECVF == "N" ~ "0",
    OP_ECVF == "U" ~ "9")))

var_lab(unlabeled_2012$OP_CERV) = "Cervical Cerclage"
val_lab(unlabeled_2012$OP_CERV) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$OP_TOCOL) = "Tocolysis"
val_lab(unlabeled_2012$OP_TOCOL) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$OP_ECVS) = "Successful External Cephalic Version" 
val_lab(unlabeled_2012$OP_ECVS) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$OP_ECVF) = "Failed External Cephalic Version" 
val_lab(unlabeled_2012$OP_ECVF) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ")

# Obstetric Procedures (Unrevised)
var_lab(unlabeled_2012$UOP_INDUC) = "Induction of Labor" 
val_lab(unlabeled_2012$UOP_INDUC) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$UOP_TOCOL) = "Tocolysis"
val_lab(unlabeled_2012$UOP_TOCOL) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

# Onset of Labor 
unlabeled_2012 <- unlabeled_2012 %>% mutate(
  ON_RUPTR = as.numeric(case_when(
    ON_RUPTR == "Y" ~ "1",
    ON_RUPTR == "N" ~ "0",
    ON_RUPTR == "U" ~ "9")),
  ON_PRECIP = as.numeric(case_when(
    ON_PRECIP == "Y" ~ "1",
    ON_PRECIP == "N" ~ "0",
    ON_PRECIP == "U" ~ "9")),
  ON_PROL = as.numeric(case_when(
    ON_PROL == "Y" ~ "1",
    ON_PROL == "N" ~ "0",
    ON_PROL == "U" ~ "9")))

var_lab(unlabeled_2012$ON_RUPTR) = "Premature Rupture of Membrane" 
val_lab(unlabeled_2012$ON_RUPTR) = num_lab("
                                            1 Yes
                                            0 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$ON_PRECIP) = "Precipitous Labor"
val_lab(unlabeled_2012$ON_PRECIP) = num_lab("
                                            1 Yes
                                            0 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$ON_PROL) = "Prolonged Labor"
val_lab(unlabeled_2012$ON_PROL) = num_lab("
                                            1 Yes
                                            0 No
                                            9 Unknown or not stated
                                            ") 

## Characteristics of Labor and Delivery 
unlabeled_2012 <- unlabeled_2012 %>% mutate(LD_INDL = as.numeric(case_when(
  LD_INDL == "Y" ~ "1",
  LD_INDL == "N" ~ "0",
  LD_INDL == "U" ~ "9")),
  LD_AUGM = as.numeric(case_when(
    LD_AUGM == "Y" ~ "1",
    LD_AUGM == "N" ~ "0",
    LD_AUGM == "U" ~ "9")),
  
  # LD_NVPR - no observations
  
  LD_STER = as.numeric(case_when(
    LD_STER == "Y" ~ "1",
    LD_STER == "N" ~ "0",
    LD_STER == "U" ~ "9")),
  LD_ANTI = as.numeric(case_when(
    LD_ANTI == "Y" ~ "1",
    LD_ANTI == "N" ~ "0",
    LD_ANTI == "U" ~ "9")),
  LD_CHOR = as.numeric(case_when(
    LD_CHOR == "Y" ~ "1",
    LD_CHOR == "N" ~ "0",
    LD_CHOR == "U" ~ "9")),
  LD_MECS = as.numeric(case_when(
    LD_MECS == "Y" ~ "1",
    LD_MECS == "N" ~ "0",
    LD_MECS == "U" ~ "9")),
  LD_FINT = as.numeric(case_when(
    LD_FINT == "Y" ~ "1",
    LD_FINT == "N" ~ "0",
    LD_FINT == "U" ~ "9")),
  LD_ANES = as.numeric(case_when(
    LD_ANES == "Y" ~ "1",
    LD_ANES == "N" ~ "0",
    LD_ANES == "U" ~ "9")))

var_lab(unlabeled_2012$LD_INDL) = "Induction of Labor"
val_lab(unlabeled_2012$LD_INDL) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_AUGM) = "Augmentation of Labor"
val_lab(unlabeled_2012$LD_AUGM) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_STER) = "Steroids"
val_lab(unlabeled_2012$LD_STER) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_ANTI) =  "Antibiotics"
val_lab(unlabeled_2012$LD_ANTI) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_CHOR) = "Chorioamnionitis"
val_lab(unlabeled_2012$LD_CHOR) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_MECS) = "Meconium Staining"
val_lab(unlabeled_2012$LD_MECS) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_FINT) = "Fetal Intolerance"
val_lab(unlabeled_2012$LD_FINT) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$LD_ANES) = "Anesthesia"
val_lab(unlabeled_2012$LD_ANES) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

## Complications of Labor and Delivery (Unrevised)
var_lab(unlabeled_2012$ULD_MECO) = "Meconium"
val_lab(unlabeled_2012$ULD_MECO) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$ULD_PRECIP) = "Precipitous Labor"
val_lab(unlabeled_2012$ULD_PRECIP) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$ULD_BREECH) = "Breech"
val_lab(unlabeled_2012$ULD_BREECH) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

## Method of Delivery (Revised)  
# ME_ATTF - no observations 
# ME_ATTV - no observations 

var_lab(unlabeled_2012$ME_PRES) = "Fetal Presentation"
val_lab(unlabeled_2012$ME_PRES) = num_lab("
                                      1 Cephalic 
                                      2 Breech 
                                      3 Other 
                                      9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ME_ROUT) = "Route & Method of Delivery"
val_lab(unlabeled_2012$ME_ROUT) = num_lab("
                                      1 Spontaneous 
                                      2 Forceps 
                                      3 Vacuum 
                                      4 Cesarean 
                                      9 Unknown or not stated
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(ME_TRIAL = as.numeric(case_when(
  ME_TRIAL == "Y" ~ "1",
  ME_TRIAL == "N" ~ "0",
  ME_TRIAL == "X" ~ "8",
  ME_TRIAL == "U" ~ "9")))
var_lab(unlabeled_2012$ME_TRIAL) = "Trial of Labor Attempted" 
val_lab(unlabeled_2012$ME_TRIAL) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

## Method of Delivery (unrevised)
# UME_VAG - no observations 
# UME_VBAC - no observations 
# UME_PRIMC - no observations 
# UME_REPEC - no observations 

var_lab(unlabeled_2012$UME_FORCP) = "Forceps"
val_lab(unlabeled_2012$UME_FORCP) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

var_lab(unlabeled_2012$UME_VAC) = "Vacuum"
val_lab(unlabeled_2012$UME_VAC) = num_lab("
                                            1 Yes
                                            2 No
                                            9 Unknown or not stated
                                            ") 

# Method of Delivery
var_lab(unlabeled_2012$RDMETH_REC) = "Delivery Method Recode (Revised)"
val_lab(unlabeled_2012$RDMETH_REC) = num_lab("
                                         1 Vaginal (excludes vaginal after previous C-section)
                                         2 Vaginal after previous c-section
                                         3 Primary C-section
                                         4 Repeat C-section
                                         5 Vaginal (unknown if previous c-section) (2003 Standard only)
                                         6 C-section (unknown if previous c-section) (2003 Standard only)
                                         9 Not Stated
                                          ") 

# UDMETH_REC - no observations 

# DMETH_REC - has no provided label in codebook 
val_lab(unlabeled_2012$DMETH_REC) = num_lab("
                                        1 Vaginal 
                                        2 C-Section 
                                        9 Unknown
                                          ") 

# Maternal Morbidity 
unlabeled_2012 <- unlabeled_2012 %>% mutate(MM_MTR = as.numeric(case_when(
  MM_MTR == "Y" ~ "1",
  MM_MTR == "N" ~ "0",
  MM_MTR == "U" ~ "9")),
  MM_PLAC = as.numeric(case_when(
    MM_PLAC == "Y" ~ "1",
    MM_PLAC == "N" ~ "0",
    MM_PLAC == "U" ~ "9")),
  MM_RUPT = as.numeric(case_when(
    MM_RUPT == "Y" ~ "1",
    MM_RUPT == "N" ~ "0",
    MM_RUPT == "U" ~ "9")),
  MM_UHYST = as.numeric(case_when(
    MM_UHYST == "Y" ~ "1",
    MM_UHYST == "N" ~ "0",
    MM_UHYST == "U" ~ "9")),
  MM_ICU = as.numeric(case_when(
    MM_ICU == "Y" ~ "1",
    MM_ICU == "N" ~ "0",
    MM_ICU == "U" ~ "9")),
  MM_UOPER = as.numeric(case_when(
    MM_UOPER == "Y" ~ "1",
    MM_UOPER == "N" ~ "0",
    MM_UOPER == "U" ~ "9")))

var_lab(unlabeled_2012$MM_MTR) = "Maternal Transfusion" 
val_lab(unlabeled_2012$MM_MTR) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MM_PLAC) = "Perineal Laceration"
val_lab(unlabeled_2012$MM_PLAC) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MM_RUPT) = "Ruptured Uterus" 
val_lab(unlabeled_2012$MM_RUPT) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MM_UHYST) = "Unplanned Hysterectomy" 
val_lab(unlabeled_2012$MM_UHYST) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MM_ICU) = "Admit to Intensive Care"
val_lab(unlabeled_2012$MM_ICU) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$MM_UOPER) = "Unplanned Operation" 
val_lab(unlabeled_2012$MM_UOPER) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

## Hospital / Payment 
var_lab(unlabeled_2012$ATTEND) = "Attendant"
val_lab(unlabeled_2012$ATTEND) = num_lab("
                                     1 Doctor of Medicine (MD) 
                                     2 Doctor of Osteopathy (DO)
                                     3 Certified Nurse Midwife (CNM)
                                     4 Other Midwife
                                     5 Other 
                                     9 Unknown or not stated
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(MTRAN = as.numeric(case_when(
  MTRAN == "Y" ~ "1",
  MTRAN == "N" ~ "0",
  MTRAN == "U" ~ "9")))
var_lab(unlabeled_2012$MTRAN) ="Mother Transferred"
val_lab(unlabeled_2012$MTRAN) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown 
                                          ") 

var_lab(unlabeled_2012$PAY) = "Payment Source"
val_lab(unlabeled_2012$PAY) = num_lab("
                                  1 Medicaid 
                                  2 Private Insurance 
                                  3 Self-Pay 
                                  4 Indian Health Service
                                  5 CHAMPUS/TRICARE 
                                  6 Other Government (Federal, State, Local)
                                  8 Other 
                                  9 Unknown
                                          ") 

var_lab(unlabeled_2012$PAY_REC) = "Payment Recode" 
val_lab(unlabeled_2012$PAY_REC) = num_lab("
                                      1 Medicaid 
                                      2 Private Insurance 
                                      3 Self Pay 
                                      4 Other 
                                      9 Unknown
                                          ") 

# APGAR
var_lab(unlabeled_2012$APGAR5) = "Five Minute APGAR Score"
val_lab(unlabeled_2012$APGAR5) = num_lab("
                                     99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$APGAR5R) = "Five Minute APGAR Recode" 
val_lab(unlabeled_2012$APGAR5R) = num_lab("
                                      1 A score of 0-3
                                      2 A score of 4-6 
                                      3 A score of 7-8
                                      4 A score of 9-10
                                      5 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$APGAR10) = "Ten Minute APGAR Score"
val_lab(unlabeled_2012$APGAR10) = num_lab("
                                       88 Not applicable 
                                       99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$APGAR10R) = "Ten Minute APGAR Score Recode" 
val_lab(unlabeled_2012$APGAR10R) = num_lab("
                                       1 A score of 0-3 
                                       2 A score of 4-6 
                                       3 A score of 7-8
                                       4 A score of 9-10 
                                       5 Not stated/not applicable
                                          ") 

## Plurality 
# PLURAL - no observations 

var_lab(unlabeled_2012$DPLURAL) = "Plurality Recode"
val_lab(unlabeled_2012$DPLURAL) = num_lab("
                                       1 Single 
                                       2 Twin 
                                       3 Triplet 
                                       4 Quadruplet 
                                       5 Quintuplet or higher
                                          ") 

var_lab(unlabeled_2012$PLUR_BYP) = "Plurality Bypass"
val_lab(unlabeled_2012$PLUR_BYP) = num_lab("
                                           0 Edit passed
                                           1 Queried and correct
                                           2 Plurality / set order queried, inconsistent
                                           ") # missing = Bypass not used

var_lab(unlabeled_2012$IMP_PLUR) = "Plurality Imputed"
val_lab(unlabeled_2012$IMP_PLUR) = num_lab("
                                       1 Plurality is not imputed 
                                          ") # missing = imputed


# SETORDER - no observations
# LIVEBORN - no observations 
# MATCH - no observations 

# Sex 
unlabeled_2012 <- unlabeled_2012 %>% mutate(SEX = as.numeric(case_when(
  SEX == "M" ~ "1",
  SEX == "F" ~ "2")))
var_lab(unlabeled_2012$SEX) = "Sex of Infant"
val_lab(unlabeled_2012$SEX) = num_lab("
                                   1 Male 
                                   2 Female
                                          ") 

var_lab(unlabeled_2012$IMP_SEX) = "Imputed Sex" 
val_lab(unlabeled_2012$IMP_SEX) = num_lab("
                                      1 Infant Sex is Imputed 
                                          ") # missing = not imputed 

## Menses 
var_lab(unlabeled_2012$DLMP_MM) = "Last Normal Menses Month"
val_lab(unlabeled_2012$DLMP_MM) = num_lab("
                                      1 January 
                                      2 February 
                                      3 March 
                                      4 April 
                                      5 May 
                                      6 June
                                      7 July 
                                      8 August 
                                      9 September 
                                      10 October 
                                      11 November
                                      12 December 
                                      99 Unknown or not stated
                                          ") 

# DLMP_DD - no observations 

var_lab(unlabeled_2012$DLMP_YY) = "Last Normal Menses Year" 
val_lab(unlabeled_2012$DLMP_YY) = num_lab("
                                       9999 Unknown or not stated
                                          ") 

## Gestation 
var_lab(unlabeled_2012$ESTGEST) = "Obstetric Gestation Est. (A) / Clinical Gestation Est. (S)"
# A: 0-98 Reported Obstetric estimate of gestation 
# S: 17-47 Accepted range of Clinical estimate of gestation
val_lab(unlabeled_2012$ESTGEST) = num_lab("
                                          99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$OBGEST_BYP) = "Obstetric Gestation Bypass"
# missing = Not Reported 
val_lab(unlabeled_2012$OBGEST_BYP) = num_lab("
                                             0 Edit passed
                                             1 Queried data correct, out of range
                                             ") 

# COMPGEST  - no observations 

var_lab(unlabeled_2012$COMBGEST) = "Gestation – Detail in Weeks "
val_lab(unlabeled_2012$COMBGEST) = num_lab("
                                        99 Unknown
                                          ") 

var_lab(unlabeled_2012$GESTREC10) = "Gestation Recode 10"
val_lab(unlabeled_2012$GESTREC10) = num_lab("
                                        1 Under 20 weeks 
                                        2 20-27 weeks 
                                        3 28-31 weeks
                                        4 32-33 weeks 
                                        5 34-36 weeks 
                                        6 37-38 weeks
                                        7 39 weeks 
                                        8 40 weeks 
                                        9 41 weeks 
                                        10 42 weeks and over
                                        99 Unknown
                                          ") 

var_lab(unlabeled_2012$GESTREC3) = "Gestation Recode 3" 
val_lab(unlabeled_2012$GESTREC3) = num_lab("
                                       1 Under 37 weeks 
                                       2 37 weeks and over 
                                       3 Not stated
                                          ") 

var_lab(unlabeled_2012$OBGEST_FLG) = "Clinical Estimate of Gestation Used Flag"
val_lab(unlabeled_2012$OBGEST_FLG) = num_lab("
                                         1 Clinical Estimate is used 
                                          ") # missing = not used

var_lab(unlabeled_2012$GEST_IMP) = "Gestation Imputed Flag"
val_lab(unlabeled_2012$GEST_IMP) = num_lab("
                                         1 Gestation is imputed
                                          ") # missing = not used

var_lab(unlabeled_2012$COMPGST_IMP) = "Computed Gestation Imputation Flag"
val_lab(unlabeled_2012$COMPGST_IMP) = num_lab("
                                         1 Computed Gestation is imputed
                                          ") # missing = not imputed

## Birth Weight 
# BWT - no observations 

var_lab(unlabeled_2012$DBWT) = "Birth Weight - Detail in Grams (Edited)"
val_lab(unlabeled_2012$DBWT) = num_lab("
                                   9999 Not stated birth weight
                                       ") 

# BRTHWGT - no observations 

var_lab(unlabeled_2012$BWTR12) = "Birth Weight Recode 12"
val_lab(unlabeled_2012$BWTR12) = num_lab("
                                     1 0227 - 0499 grams 
                                     2 0500 - 0999 grams 
                                     3 1000 - 1499 grams
                                     4 1500 - 1999 grams 
                                     5 2000 - 2499 grams 
                                     6 2500 - 2999 grams
                                     7 3000 - 3499 grams 
                                     8 3500 - 3999 grams 
                                     9 4000 - 4499 grams	
                                     10 4500 - 4999 grams 
                                     11 5000 - 8165 grams 
                                     12 Not Stated
                                          ") 

var_lab(unlabeled_2012$BWTR4) = "Birth Weight Recode 4" 
val_lab(unlabeled_2012$BWTR4) = num_lab("
                                    1 0227 - 1499 grams
                                    2 1500 - 2499 grams 
                                    3 2500 - 8165 grams 
                                    4 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$BWT_BYP) = "Birth Weight Bypass" 
val_lab(unlabeled_2012$BWT_BYP) = num_lab("
                                          0 Edit passed
                                          1 Queried data correct, out of range
                                          2 Queried, failed birth weight / gestation edit
                                          ") # missing - Bypass not used

var_lab(unlabeled_2012$BWTIMP) = "Imputed Birth Weight Flag"
val_lab(unlabeled_2012$BWTIMP) = num_lab("
                                          1 Birth Weight is imputed
                                          ") # missing = not imputed  

## Abnormal Conditions of the Newborn 
unlabeled_2012 <- unlabeled_2012 %>% mutate(AB_AVEN1 = as.numeric(case_when(
  AB_AVEN1 == "Y" ~ "1",
  AB_AVEN1 == "N" ~ "0",
  AB_AVEN1 == "U" ~ "9")),
  AB_AVEN6 = as.numeric(case_when(
    AB_AVEN6 == "Y" ~ "1",
    AB_AVEN6 == "N" ~ "0",
    AB_AVEN6 == "U" ~ "9")),
  AB_NICU = as.numeric(case_when(
    AB_NICU == "Y" ~ "1",
    AB_NICU == "N" ~ "0",
    AB_NICU == "U" ~ "9")),
  AB_SURF = as.numeric(case_when(
    AB_SURF == "Y" ~ "1",
    AB_SURF == "N" ~ "0",
    AB_SURF == "U" ~ "9")),
  AB_ANTI = as.numeric(case_when(
    AB_ANTI == "Y" ~ "1",
    AB_ANTI == "N" ~ "0",
    AB_ANTI == "U" ~ "9")),
  AB_SEIZ = as.numeric(case_when(
    AB_SEIZ == "Y" ~ "1",
    AB_SEIZ == "N" ~ "0",
    AB_SEIZ == "U" ~ "9")),
  AB_BINJ = as.numeric(case_when(
    AB_BINJ == "Y" ~ "1",
    AB_BINJ == "N" ~ "0",
    AB_BINJ == "U" ~ "9")))

var_lab(unlabeled_2012$AB_AVEN1) = "Assisted Ventilation"
val_lab(unlabeled_2012$AB_AVEN1) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_AVEN6) = "Assisted Ventilation > 6 hrs"
val_lab(unlabeled_2012$AB_AVEN6) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_NICU) =  "Admission to NICU"
val_lab(unlabeled_2012$AB_NICU) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_SURF) =  "Surfactant"
val_lab(unlabeled_2012$AB_SURF) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_ANTI) =  "Antibiotics"
val_lab(unlabeled_2012$AB_ANTI) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_SEIZ) =  "Seizures"
val_lab(unlabeled_2012$AB_SEIZ) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$AB_BINJ) =  "Birth Injury"
val_lab(unlabeled_2012$AB_BINJ) = num_lab("
                                       0 No Complication reported 
                                       1 Yes, Complication reported 
                                       9 Unknown or not stated
                                          ") 

# Congenital Anomalies of the Newborn 
unlabeled_2012 <- unlabeled_2012 %>% mutate(CA_ANEN = as.numeric(case_when(
  CA_ANEN == "Y" ~ "1",
  CA_ANEN == "N" ~ "0",
  CA_ANEN == "U" ~ "9")),
  CA_MNSB = as.numeric(case_when(
    CA_MNSB == "Y" ~ "1",
    CA_MNSB == "N" ~ "0",
    CA_MNSB == "U" ~ "9")),
  CA_CCHD = as.numeric(case_when(
    CA_CCHD == "Y" ~ "1",
    CA_CCHD == "N" ~ "0",
    CA_CCHD == "U" ~ "9")),
  CA_CDH = as.numeric(case_when(
    CA_CDH == "Y" ~ "1",
    CA_CDH == "N" ~ "0",
    CA_CDH == "U" ~ "9")),
  CA_OMPH = as.numeric(case_when(
    CA_OMPH == "Y" ~ "1",
    CA_OMPH == "N" ~ "0",
    CA_OMPH == "U" ~ "9")),
  CA_GAST = as.numeric(case_when(
    CA_GAST == "Y" ~ "1",
    CA_GAST == "N" ~ "0",
    CA_GAST == "U" ~ "9")),
  CA_LIMB = as.numeric(case_when(
    CA_LIMB == "Y" ~ "1",
    CA_LIMB == "N" ~ "0",
    CA_LIMB == "U" ~ "9")),
  CA_CLEFT = as.numeric(case_when(
    CA_CLEFT == "Y" ~ "1",
    CA_CLEFT == "N" ~ "0",
    CA_CLEFT == "U" ~ "9")),
  CA_CLPAL = as.numeric(case_when(
    CA_CLPAL == "Y" ~ "1",
    CA_CLPAL == "N" ~ "0",
    CA_CLPAL == "U" ~ "9")))

var_lab(unlabeled_2012$CA_ANEN) = "Anencephaly"
val_lab(unlabeled_2012$CA_ANEN) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_MNSB) = "Meningomyelocele / Spina Bifida"
val_lab(unlabeled_2012$CA_MNSB) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_CCHD) = "Cyanotic Congenital Heart Disease"
val_lab(unlabeled_2012$CA_CCHD) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_CDH) = "Congenital Diaphragmatic Hernia"
val_lab(unlabeled_2012$CA_CDH) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_OMPH) = "Omphalocele"
val_lab(unlabeled_2012$CA_OMPH) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_GAST) = "Gastroschisis"
val_lab(t) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_LIMB) = "Limb Reduction Defect"
val_lab(unlabeled_2012$CA_LIMB) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_CLEFT) = "Cleft Lip w/ or w/o Cleft Palate"
val_lab(unlabeled_2012$CA_CLEFT) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$CA_CLPAL) = "Cleft Palate alone"
val_lab(unlabeled_2012$CA_CLPAL) = num_lab("
                                       0 No, anomaly not reported 
                                       1 Yes, anomaly reported 
                                       9 Unknown or not stated
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(CA_DOWN = as.numeric(case_when(
  CA_DOWN == "C" ~ "1",
  CA_DOWN == "P" ~ "2",
  CA_DOWN == "N" ~ "0",
  CA_DOWN == "U" ~ "9")),
  CA_DISOR = as.numeric(case_when(
    CA_DISOR == "C" ~ "1",
    CA_DISOR == "P" ~ "2",
    CA_DISOR == "N" ~ "0",
    CA_DISOR == "U" ~ "9")))

var_lab(unlabeled_2012$CA_DOWN) = "Down Syndrome" 
val_lab(unlabeled_2012$CA_DOWN) = num_lab("
                                       0 No 
                                       1 Confirmed 
                                       2 Pending 
                                       9 Unknown
                                          ") 

var_lab(unlabeled_2012$CA_DISOR) = "Suspected Chromosomal Disorder" 
val_lab(unlabeled_2012$CA_DISOR) = num_lab("
                                       0 No 
                                       1 Confirmed 
                                       2 Pending 
                                       9 Unknown
                                          ") 

unlabeled_2012 <- unlabeled_2012 %>% mutate(CA_HYPO = as.numeric(case_when(
  CA_HYPO == "Y" ~ "1",
  CA_HYPO == "N" ~ "0",
  CA_HYPO == "U" ~ "9")))
var_lab(unlabeled_2012$CA_HYPO) = "Hypospadias"
val_lab(unlabeled_2012$CA_HYPO) = num_lab("
                                      0 No, anomaly not reported 
                                      1 Yes, anomaly reported
                                      9 Unknown
                                          ") 

## Congenital Anomalies of the Newborn 
var_lab(unlabeled_2012$UCA_ANEN) = "Anencephalus"
val_lab(unlabeled_2012$UCA_ANEN) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

var_lab(unlabeled_2012$UCA_SPINA) = "Spina Bifida / Meningocele"
val_lab(unlabeled_2012$UCA_SPINA) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

var_lab(unlabeled_2012$UCA_OMPHA) = "Omphalocele / Gastroschisis"
val_lab(unlabeled_2012$UCA_OMPHA) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

var_lab(unlabeled_2012$UCA_CLEFTLP) = "Cleft Lip / Palate"
val_lab(unlabeled_2012$UCA_CLEFTLP) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

var_lab(unlabeled_2012$UCA_HERNIA) = "Diaphragmatic Hernia"
val_lab(unlabeled_2012$UCA_HERNIA) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

var_lab(unlabeled_2012$UCA_DOWNS) = "Down Syndrome"
val_lab(unlabeled_2012$UCA_DOWNS) = num_lab("
                                            1 Anomaly reported
                                            2 Anomaly not reported
                                            9 Anomaly not classifiable
                                            ") 

## Infant 
unlabeled_2012 <- unlabeled_2012 %>% mutate(ITRAN = as.numeric(case_when(
  ITRAN == "Y" ~ "1",
  ITRAN == "N" ~ "0",
  ITRAN == "U" ~ "9")),
  ILIVE = as.numeric(case_when(
    ILIVE == "Y" ~ "1",
    ILIVE == "N" ~ "0",
    ILIVE == "U" ~ "9")),
  BFED = as.numeric(case_when(
    BFED == "Y" ~ "1",
    BFED == "N" ~ "0",
    BFED == "U" ~ "9")))

var_lab(unlabeled_2012$ITRAN) = "Infant Transferred"
val_lab(unlabeled_2012$ITRAN) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILIVE) = "Infant Living at Time of Report"
val_lab(unlabeled_2012$ILIVE) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$BFED) = "Infant Being Breastfed"
val_lab(unlabeled_2012$BFED) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

## Body Mass Index 
# BMI - codebook inconsistent with the tabulation of the variable 

# typo in codebook: "Obesity I 35.0-39.9"
var_lab(unlabeled_2012$BMI_R) = "Body Mass Index Recode"
val_lab(unlabeled_2012$BMI_R) = num_lab("
                                        1 Underweight <18.5
                                        2 Normal 18.5-24.9
                                        3 Overweight 25.0-29.9
                                        4 Obesity I 30.0-34.9
                                        5 Obesity II 35.0-39.9
                                        6 Extreme Obesity III ≥ 40.0
                                        9 Unknown or not stated
                                          ") 

## Births 
var_lab(unlabeled_2012$ILLB_R) = "Interval of Last Live Birth Recode"
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2012$ILLB_R) = num_lab("
                                        888 Not applicable / 1st live birth
                                        999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILLB_R11) = "Interval of Last Live Birth Recode 11" 
val_lab(unlabeled_2012$ILLB_R11) = num_lab("
                                       0 Zero to 3 months (plural delivery) 
                                       1 4 to 11 months
                                       2 12 to 17 months 
                                       3 18 to 23 months 
                                       4 24 to 35 months
                                       5 36 to 47 months 
                                       6 48 to 59 months
                                       7 60 to 71 months
                                       8 72 months and over 
                                       88 Not applicable (1st live birth)
                                       99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILOP_R) = "Interval of Last Other Pregnancy" 
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2012$ILOP_R) = num_lab("
                                     888 Not applicable / 1st natality event 
                                     999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILOP_R11) = "Interval of Last Other Pregnancy Recode 11" 
val_lab(unlabeled_2012$ILOP_R11) = num_lab("
                                       0 Zero to 3 months (plural delivery) 
                                       1 4 to 11 months
                                       2 12 to 17 months
                                       3 18 to 23 months 
                                       4 24 to 35 months
                                       5 36 to 47 months
                                       6 48 to 59 months 
                                       7 60 to 71 months
                                       8 72 months and over 
                                       88 Not applicable (1st natality event)
                                       99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILP) = "Interval of Last Pregnancy"
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2012$ILP) = num_lab("
                                    888 Not applicable / no previous pregnancy
                                    999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2012$ILP_R11) = "Interval of Last Pregnancy Recode 11"
# label defining code below commented out because of likely typo in codebook
#val_lab(unlabeled_2012$ILP_R11) = num_lab("
#                                          0 Zero to 3 months (plural delivery)
#                                          1 4 to 11 months
#                                          00 12 to 17 months
#                                          1 18 to 23 months
#                                         2 24 to 35 months
#                                          3 36 to 47 months 
#                                          4 48 to 59 months 
#                                          5 60 to 71 months
#                                          6 72 months and over
#                                          88 Not applicable (no previous pregnancy)
#                                          99 Unknown or not stated
#                                          ") 

## Mother Height and Weight  
var_lab(unlabeled_2012$PWgt_R) = "Pre-pregnancy Weight Recode" 
val_lab(unlabeled_2012$PWgt_R) = num_lab("
                                     999 Unknown or not stated
                                          ")

var_lab(unlabeled_2012$DWgt_R) = "Delivery Weight Recode"
val_lab(unlabeled_2012$DWgt_R) = num_lab("
                                     999 Unknown or not stated
                                          ")

var_lab(unlabeled_2012$M_Ht_In) = "Mother's Height in Inches"
val_lab(unlabeled_2012$M_Ht_In) = num_lab("
                                      99 Unknown or not stated
                                          ")

## Birth Order 
var_lab(unlabeled_2012$SetOrder_R) = "Set Order Recode"
val_lab(unlabeled_2012$SetOrder_R) = num_lab("
                                         1 1st 
                                         2 2nd 
                                         3 3rd 
                                         4 4th 
                                         5 5th to 16th 
                                         9 Unknown or not stated
                                          ") 

# LiveBorn_R - no observations 

# Flag File for Reporting 
var_lab(unlabeled_2012$F_MORIGIN) = "Origin of Mother"
val_lab(unlabeled_2012$F_MORIGIN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_FORIGIN) = "Origin of Father"
val_lab(unlabeled_2012$F_FORIGIN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_MEDUC) = "Education of Mother"
val_lab(unlabeled_2012$F_MEDUC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_FEDUC) = "Education of Father"
val_lab(unlabeled_2012$F_FEDUC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_CLINEST) = "Clinical Estimate of Gestation"
val_lab(unlabeled_2012$F_CLINEST) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_APGAR5) = "Five minute APGAR"
val_lab(unlabeled_2012$F_APGAR5) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_TOBACO) = "Tobacco use"
val_lab(unlabeled_2012$F_TOBACO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_M_HT) = "Mother's Height"
val_lab(unlabeled_2012$F_M_HT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_PWGT) = "Prepregnancy Weight"
val_lab(unlabeled_2012$F_PWGT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_DWGT) = "Weight at Delivery"
val_lab(unlabeled_2012$F_DWGT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_WIC) = "WIC"
val_lab(unlabeled_2012$F_WIC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_PAY) = "Source of Payment"
val_lab(unlabeled_2012$F_PAY) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_BFED) = "Breastfed at Discharge"
val_lab(unlabeled_2012$F_BFED) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_PDIAB) = "Prepregnancy Diabetes"
val_lab(unlabeled_2012$F_RF_PDIAB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_GDIAB) = "Gestational Diabetes"
val_lab(unlabeled_2012$F_RF_GDIAB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_PHYPER) = "Prepregnancy Hypertension"
val_lab(t) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_GHYPER) = "Gestational Hypertension"
val_lab(unlabeled_2012$F_RF_GHYPER) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_ECLAMP) = "Hypertension Eclampsia"
val_lab(unlabeled_2012$F_RF_ECLAMP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_PPB) = "Previous Preterm Birth"
val_lab(unlabeled_2012$F_RF_PPB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_PPO) = "Poor Pregnancy outcomes"
val_lab(unlabeled_2012$F_RF_PPO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_INFT) = "Infertility Treatment"
val_lab(unlabeled_2012$F_RF_INFT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_INFT_DRG) = "Fertility Enhance Drugs"
val_lab(unlabeled_2012$F_RF_INFT_DRG) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_INF_ART) = "Reproductive Technology"
val_lab(unlabeled_2012$F_RF_INF_ART) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_CESAR) = "Previous Cesarean"
val_lab(unlabeled_2012$F_RF_CESAR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_RF_NCESAR) = "Number of Previous Cesareans"
val_lab(unlabeled_2012$F_RF_NCESAR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_IP_GONOR) = "Gonorrhea"
val_lab(unlabeled_2012$F_IP_GONOR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_IP_SYPH) = "Syphilis"
val_lab(unlabeled_2012$F_IP_SYPH) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

# F_IP_HSV - no observations

var_lab(unlabeled_2012$F_IP_CHLAM) = "Chlamydia"
val_lab(unlabeled_2012$F_IP_CHLAM) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_IP_HEPATB) = "Hepatitis B"
val_lab(unlabeled_2012$F_IP_HEPATB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_IP_HEPATC) = "Hepatitis C"
val_lab(unlabeled_2012$F_IP_HEPATC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_IP_HEPATC) = "Hepatitis C"
val_lab(unlabeled_2012$F_IP_HEPATC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OB_CERVIC) = "Cervical Cerclage"
val_lab(unlabeled_2012$F_OB_CERVIC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OB_TOCO) = "Tocolysis"
val_lab(unlabeled_2012$F_OB_TOCO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OB_SUCC) = "Successful External Cephalic Version"
val_lab(unlabeled_2012$F_OB_SUCC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OB_FAIL) = "Failed External Cephalic Version"
val_lab(unlabeled_2012$F_OB_FAIL) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OL_RUPTURE) = "Premature Rupture of the Membranes"
val_lab(unlabeled_2012$F_OL_RUPTURE) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OL_PRECIP) = "Precipitous Labor"
val_lab(unlabeled_2012$F_OL_PRECIP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_OL_PROLONG) = "Prolonged Labor"
val_lab(unlabeled_2012$F_OL_PROLONG) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_LD_INDUCT) = "Induction of Labor"
val_lab(unlabeled_2012$F_LD_INDUCT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_LD_AUGMENT) = "Augmentation of Labor"
val_lab(unlabeled_2012$F_LD_AUGMENT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_LD_STERIODS) = "Steroids"
val_lab(unlabeled_2012$F_LD_STERIODS) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_LD_ANTIBIO) = "Antibiotics"
val_lab(unlabeled_2012$F_LD_ANTIBIO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2012$F_LD_CHORIO) = "Chorioamnionitis"
val_lab(unlabeled_2012$F_LD_CHORIO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_LD_MECON) = "Meconium Staining"
val_lab(unlabeled_2012$F_LD_MECON) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_LD_FINTOL) = "Fetal Intolerance"
val_lab(unlabeled_2012$F_LD_FINTOL) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_LD_ANESTH) = "Anesthesia"
val_lab(unlabeled_2012$F_LD_ANESTH) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MD_PRESENT) = "Fetal Presentation"
val_lab(unlabeled_2012$F_MD_PRESENT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MD_ROUTE) = "Final Route and Method of Delivery"
val_lab(unlabeled_2012$F_MD_ROUTE) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MD_TRIAL) = "Trial of Labor Attempted"
val_lab(unlabeled_2012$F_MD_TRIAL) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_MTRANS) = "Maternal Transfusion"
val_lab(unlabeled_2012$F_MM_MTRANS) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_LACER) = "Perineal Laceration"
val_lab(unlabeled_2012$F_MM_LACER) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_RUPTUR) = "Ruptured Uterus"
val_lab(unlabeled_2012$F_MM_RUPTUR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_UHYSTR) = "Unplanned Hysterectomy"
val_lab(unlabeled_2012$F_MM_UHYSTR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_ICU) = "Admission to Intensive Care"
val_lab(unlabeled_2012$F_MM_ICU) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_MM_OR) = "Unplanned Operating Room Procedure"
val_lab(unlabeled_2012$F_MM_OR) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_VENT) = "Assisted Ventilation"
val_lab(unlabeled_2012$F_AB_VENT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_VENT6) = "Assisted Ventilation >6 hr"
val_lab(unlabeled_2012$F_AB_VENT6) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_NICU) = "Admission to NICU"
val_lab(unlabeled_2012$F_AB_NICU) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_SURFAC) = "Surfactant"
val_lab(unlabeled_2012$F_AB_SURFAC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_ANTIBIO) = "Antibiotics"
val_lab(unlabeled_2012$F_AB_ANTIBIO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_SEIZ) = "Seizures"
val_lab(unlabeled_2012$F_AB_SEIZ) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_AB_INJ) = "Birth Injury"
val_lab(unlabeled_2012$F_AB_INJ) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_ANEN) = "Anencephaly"
val_lab(unlabeled_2012$F_CA_ANEN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_MENIN) = "Meningomyelocele/Spina Bifida"
val_lab(unlabeled_2012$F_CA_MENIN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_HEART) = "Cyanotic Congenital Heart Disease"
val_lab(unlabeled_2012$F_CA_HEART) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_HERNIA) = "Congenital Diaphragmatic Hernia"
val_lab(unlabeled_2012$F_CA_HERNIA) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_OMPHA) = "Omphalocele"
val_lab(unlabeled_2012$F_CA_OMPHA) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_GASTRO) = "Gastroschisis"
val_lab(unlabeled_2012$F_CA_GASTRO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_LIMB) = "Limb Reduction Defect"
val_lab(unlabeled_2012$F_CA_LIMB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_CLEFTLP) = "Cleft Lip with or without Cleft Palate"
val_lab(unlabeled_2012$F_CA_CLEFTLP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_CLEFT) = "Cleft Palate Alone"
val_lab(unlabeled_2012$F_CA_CLEFT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_DOWNS) = "Down Syndrome"
val_lab(unlabeled_2012$F_CA_DOWNS) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_CHROM) = "Suspected Chromosomal Disorder"
val_lab(unlabeled_2012$F_CA_CHROM) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CA_HYPOS) = "Hypospadias"
val_lab(unlabeled_2012$F_CA_HYPOS) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_MED - no observations

var_lab(unlabeled_2012$F_WTGAIN) = "Weight Gain"
val_lab(unlabeled_2012$F_WTGAIN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_API - no observations 
# F_MAR_E - no observations

var_lab(unlabeled_2012$F_MAR_G) = "Mother's Marital Status (Revised)"
val_lab(unlabeled_2012$F_MAR_G) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_MAR_P - no observations
# F_LIVEB - no observations
# F_DOBMBYP - no observations
# F_MEDBYP - no observations
# F_DOBFBYP - no observations
# F_FEDBYP - no observations
# F_TPCVBYP - no observations
# F_MHTBYP - no observations
# F_PWGTBYP - no observations
# F_DWGTBYP - no observations 
# F_CESARBYP - no observations 
# F_PLURBYP - no observations 
# F_OBGESTBYP - no observations 
# F_BWTBYP - no observations 
# F_TOBAC - no observations 

var_lab(unlabeled_2012$F_MPCB) = "Month Prenatal Care Began"
val_lab(unlabeled_2012$F_MPCB) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_MPCB_U - no observations 
# F_CMBGST - no observations 

var_lab(unlabeled_2012$F_TPCV) = "Total Prenatal Care Visit"
val_lab(unlabeled_2012$F_TPCV) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CIGS_0) = "Cigarettes before Pregnancy"
val_lab(unlabeled_2012$F_CIGS_0) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CIGS_1) = "Cigarettes 1st Trimester"
val_lab(unlabeled_2012$F_CIGS_1) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CIGS_2) = "Cigarettes 2nd Trimester"
val_lab(unlabeled_2012$F_CIGS_2) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_CIGS_3) = "Cigarettes 3rd Trimester"
val_lab(unlabeled_2012$F_CIGS_3) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_FACILITY) = "Birth Place (Revised)"
val_lab(unlabeled_2012$F_FACILITY) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_LIMIT) = "City Limits"
val_lab(unlabeled_2012$F_LIMIT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_PAY_REC) = "Payment Recode"
val_lab(unlabeled_2012$F_PAY_REC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_RDMETH_REC) = "Method of Delivery Recode"
val_lab(unlabeled_2012$F_RDMETH_REC) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_UDMETH_REC - no observations 

var_lab(unlabeled_2012$F_URF_DIABETES) = "Diabetes Flag (Unrevised)"
val_lab(unlabeled_2012$F_URF_DIABETES) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_URF_CHYPER) = "Chron Hyper Flag (Unrevised)"
val_lab(unlabeled_2012$F_URF_CHYPER) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_URF_PHYPER) = "Prep Hyper Flag (Unrevised)"
val_lab(unlabeled_2012$F_URF_PHYPER) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_URF_ECLAMP) = "Eclampsia Flag (Unrevised)"
val_lab(unlabeled_2012$F_URF_ECLAMP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_APGAR10 - no observations 
# F_DFPC - no observations 
# F_DLPC - no observations

var_lab(unlabeled_2012$F_UOB_INDUCT) = "Induction Flag (Unrevised)"
val_lab(unlabeled_2012$F_UOB_INDUCT) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UOB_TOCOL) = "Tocolysis Flag (Unrevised)"
val_lab(unlabeled_2012$F_UOB_TOCOL) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_MTRAN - no observations        

var_lab(unlabeled_2012$F_ULD_MECONIUM) = "Meconium Flag (Unrevised)"
val_lab(unlabeled_2012$F_ULD_MECONIUM) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_ULD_PRECIP) = "Precip Flag (Unrevised)"
val_lab(unlabeled_2012$F_ULD_PRECIP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_ULD_BREECH) = "Breech Flag (Unrevised)"
val_lab(unlabeled_2012$F_ULD_BREECH) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

# F_U_VAGINAL - no observations 
# F_U_VBAC - no observations 
# F_U_PRIMAC - no observations 
# F_U_REPEAC - no observations 

var_lab(unlabeled_2012$F_U_FORCEP) = "Forceps Flag (Unrevised)"
val_lab(unlabeled_2012$F_U_FORCEP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_U_VACUUM) = "Vacuum Flag (Unrevised)"
val_lab(unlabeled_2012$F_U_VACUUM) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_ANEN) = "Anen Flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_ANEN) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_SPINA) = "Spina Bifita Flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_SPINA) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_OMPHALO) = "Omphalo Flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_OMPHALO) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_CLEFTLP) = "Cleft Lip Flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_CLEFTLP) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_HERNIA) = "Hernia flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_HERNIA) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")

var_lab(unlabeled_2012$F_UCA_DOWNS) = "Downs Syndrome Flag (Unrevised)"
val_lab(unlabeled_2012$F_UCA_DOWNS) = num_lab("
                                        0 Not reporting
                                        1 Reporting
                                          ")



# Mother's Race 
# MRACE1 - MRACE23 - no observations 

# Mother's Race Edited 
# MRACE1E - MRACE8E - nonmissing, no variable labels 
# 100-999 Mother's Race Edited Code 
# A00 - R99 

# Mother's Race Coded 
# MRACE16C - MRACE23C - no observations 

# Mother's Hispanic Race Checkbox 
# variables starting with MHSPCBX_ - no observations

# MHISPL - no observations 

# METHNIC - no observations 

# METHNIC5C - no observations 

# Father's Race 

# Father's Race Checkbox 
# FRACE1-FRACE23 - no observations 

# Father's Race Edited 
# FRACE1E - FRACE8E - nonmissing, no variable labels 
# 100-999 Father's Race Edited Code 
# A00 - R99 

# FRACE16C - FRACE23C - no observations 

# Father's Hispanic Race Checkbox
# variables starting with FHSPCBX_ - no observations 

# FHISPL - no observations 

# FETHNIC - no observations 

# FETHNIC5C - no observations 

# Save Data
# The following line should contain the path to your output '.Rdata' (labeled) file ;

labeled_2012 <- unlabeled_2012
save(labeled_2012, file = "FILEPATH/RestrictedVitalStatistics_Natality_2012_Labeled.RData")
