# This R script file requires the use of the "expss" and "dplyr" packages. 
# The following lines of code should be uncommented and run if these packages are not already installed 

#install.packages("expss")
#intall.packages("dplyr")
library(expss)
library(dplyr)

# -----------------------------------------------; 
# This program reads the 2016 Restricted-Use  
# NCHS Natality Data File 
# by Hye Jee Kim, hyejk@stanford.edu,  Tue Aug 23 2022 
# Please report errors to hyejk@stanford.edu
# -----------------------------------------------;

# The following line should contain the complete path and name of the raw data file.
# On a PC, use backslashes in paths as in C:\  ;

# Reading in File 
unlabeled_2016 <- read.fwf(file = "FILEPATH/NATL2016US.AllCnty.txt",
                           width = c(-8, 4, 2, -4, 4, 1, 
                                      2, 2, 3, 1, 
                                      1, 1, -16, 1,
                                    -22, 1, 1, 2, 2, 1,
                                      2, 2, 1,
                                      2, 2, 2, 3, 5, 
                                      1, 1, 1, 1,
                                      1, 1,
                                      2, 1, 2, 1, 1,
                                     -3, 1, 1, 1,
                                     -1, 1, 1, 1, -1, 1,
                                      1, -1, 1,
                                     -15, 1, -4, 2, 2,
                                      2, 1, 2, 1,
                                     -3, 1, 1, 1,
                                      1, -1, 1,
                                     -5, 2, 2, 2,
                                     -2, 1, -2, 1,
                                    -15, 3, 2,
                                     -3, 3, 2,
                                     -3, 3, 2,
                                     -5, 2, 1, 1,
                                    -10, 2, -2, 2, 1,
                                     -6, 1, 1,
                                      2, 2, 2, 2,
                                      1, 1, 1, 1,
                                      1, 1, 1, 1,
                                      1, 1,
                                    -9, 2, 1, 4, 1,
                                    -4, 3, 1, -3, 3, -1, 1,
                                     2, 1, 1, 
                                    -5, 1, 1, 1, 1,
                                     1, 1, 
                                     1, 1, 1,
                                     1, 1, 1,
                                     1, 1, 1,
                                     1, 1, 1, 
                                     1, 2,
                                    -1, 1, 1, 
                                     1,
                                    -5, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 
                                     1,
                                    -6, 1, 1, -1, 1, 1,
                                   -18, 1, 1, 1, 1, 
                                     1, 1,
                                     1, 1, 1, 1, 
                                     1, 1, 1,
                                    -5, 1, 1, 1, 
                                     1, 1, 1, 
                                     1 , 1, 1,
                                    -5, 1, 1, 1, 1, 1,
                                    -1, 1, 1, 1, 1, 1,
                                    -1, 1,
                                    -5, 1, 1, 1, 1,
                                     1, 1,
                                    -5, 2, 1, 1, 2, 1,
                                    -3, 1, -1, 1, -2, 1, 
                                   -15, 1, 1,
                                     2, -2, 4,
                                    -3, 1, 1, 2,
                                     2, 1, -3, 1, 
                                     2, 2, 1,
                                     4, -1, 2, 1, 
                                    -5, 1, 1, 1, 1, 1, 1,
                                    -1, 1, 1, 1, 1, 1, 1, 
                                    -1, 1,
                                    -5, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 
                                     1, 1, 1, 1, 1, 1, 
                                     1, 1, 1, 1,
                                     1, 1, 1,
                                    -5, 1, 1, 1, 1),
                           col.names = c("DOB_YY", "DOB_MM", "DOB_TT", "DOB_WK", 
                                         "OSTATE", "XOSTATE", "OCNTYFIPS", "OCNTYPOP",
                                         "BFACIL", "F_FACILITY", "BFACIL3",
                                         "MAGE_IMPFLG", "MAGE_REPFLG", "MAGER", "MAGER14", "MAGER9",
                                         "MBCNTRY", "MBSTATE", "MBSTATE_REC",
                                         "MRCNTRY", "XMRSTATE", "MRSTATEPSTL", "MRCNTYFIPS", "MRCITYFIPS", 
                                         "RCNTY_POP", "RCITY_POP", "CITYLIM", "F_LIMIT",
                                         "RECTYPE", "RESTATUS",
                                         "MRACE31", "MRACE6", "MRACE15","MBRACE", "MRACEIMP",
                                         "MHISP_R", "F_MHISP", "MRACEHISP",
                                         "MAR_P",  "DMAR", "MAR_IMP", "F_MAR_P",
                                         "MEDUC", "F_MEDUC", 
                                         "FAGERPT_FLG", "FAGECOMB", "FAGEREC11",
                                         "FRACE31", "FRACE6", "FRACE15", "FBRACE",
                                         "FHISP_R", "F_FHISP", "FRACEHISP",
                                         "FEDUC", "F_FEDUC", 
                                         "PRIORLIVE", "PRIORDEAD", "PRIORTERM", 
                                         "LBO_REC", "TBO_REC",
                                         "ILLB_R", "ILLB_R11",
                                         "ILOP_R", "ILOP_R11",
                                         "ILP_R", "ILP_R11",
                                         "PRECARE", "F_MPCB", "PRECARE5",
                                         "PREVIS", "PREVIS_REC", "F_TPCV",
                                         "WIC", "F_WIC", 
                                         "CIG_0", "CIG_1","CIG_2", "CIG_3", 
                                         "CIG0_R", "CIG1_R", "CIG2_R", "CIG3_R",
                                         "F_CIGS_0", "F_CIGS_1", "F_CIGS_2", "F_CIGS_3",
                                         "CIG_REC", "F_TOBACO",
                                         "M_Ht_In", "F_M_HT", "BMI", "BMI_R",
                                         "PWgt_R", "F_PWGT", "DWgt_R", "F_DWGT", 
                                         "WTGAIN", "WTGAIN_REC", "F_WTGAIN",
                                         "RF_PDIAB", "RF_GDIAB", "RF_PHYPE", "RF_GHYPE",
                                         "RF_EHYPE", "RF_PPTERM", 
                                         "F_RF_PDIAB", "F_RF_GDIAB", "F_RF_PHYPER", 
                                         "F_RF_GHYPER", "F_RF_ECLAMP", "F_RF_PPB",
                                         "RF_INFTR", "RF_FEDRG", "RF_ARTEC", 
                                         "F_RF_INFT", "F_RF_INF_DRG", "F_RF_INF_ART", 
                                         "RF_CESAR", "RF_CESARN",
                                         "F_RF_CESAR", "F_RF_NCESAR", 
                                         "NO_RISKS",
                                         "IP_GON", "IP_SYPH", "IP_CHLAM", "IP_HEPB", "IP_HEPC",
                                         "F_IP_GONOR", "F_IP_SYPH", "F_IP_CHLAM", "F_IP_HEPATB", "F_IP_HEPATC", 
                                         "NO_INFEC",
                                         "OB_ECVS", "OB_ECVF", "F_OB_SUCC", "F_OB_FAIL",
                                         "LD_INDL", "LD_AUGM", "LD_STER", "LD_ANTB", 
                                         "LD_CHOR", "LD_ANES", 
                                         "F_LD_INDL", "F_LD_AUGM", "F_LD_STER", "F_LD_ANTB",
                                         "F_LD_CHOR", "F_LD_ANES", "NO_LBRDLV",
                                         "ME_PRES", "ME_ROUT", "ME_TRIAL", 
                                         "F_ME_PRES", "F_ME_ROUT", "F_ME_TRIAL",
                                         "RDMETH_REC", "DMETH_REC", "F_DMETH_REC",
                                         "MM_MTR", "MM_PLAC", "MM_RUPT", "MM_UHYST", "MM_AICU",
                                         "F_MM_MTR", "F_MM_PLAC", "F_MM_RUPT", "F_MM_UHYST", "F_MM_AICU",
                                         "NO_MMORB",
                                         "ATTEND", "MTRAN", "PAY", "PAY_REC",
                                         "F_PAY", "F_PAY_REC", 
                                         "APGAR5", "APGAR5R", "F_APGAR5", "APGAR10", "APGAR10R",
                                         "DPLURAL", "IMP_PLUR", "SETORDER_R",
                                         "SEX", "IMP_SEX", 
                                         "DLMP_MM", "DLMP_YY", 
                                         "COMBGST_IMP", "OBGEST_FLG", "COMBGEST", 
                                         "GESTREC10", "GESTREC3", "LMPUSED", 
                                         "OEGest_Comb", "OEGest_R10", "OEGest_R3", 
                                         "DBWT", "BWTR12", "BWTR4",
                                         "AB_AVEN1", "AB_AVEN6", "AB_NICU", "AB_SURF", "AB_ANTI", "AB_SEIZ",
                                         "F_AB_VENT", "F_AB_VENT6", "F_AB_NICU", "F_AB_SURFAC", "F_AB_ANTIBIO", "F_AB_SEIZ",
                                         "NO_ABNORM",
                                         "CA_ANEN", "CA_MNSB", "CA_CCHD", "CA_CDH", "CA_OMPH", "CA_GAST",
                                         "F_CA_ANEN", "F_CA_MENIN", "F_CA_HEART", "F_CA_HERNIA", "F_CA_OMPHA", "F_CA_GASTRO",
                                         "CA_LIMB", "CA_CLEFT", "CA_CLPAL", "CA_DOWN", "CA_DISOR", "CA_HYPO",
                                         "F_CA_LIMB", "F_CA_CLEFTLP", "F_CA_CLEFT", "F_CA_DOWNS",
                                         "F_CA_CHROM", "F_CA_HYPOS", "NO_CONGEN",
                                         "ITRAN", "ILIVE", "BFED", "F_BFED"))

# The following line should contain the path to your output '.Rdata' (unlabeled) file 

save(unlabeled_2016, file = "FILEPATH/RestrictedVitalStatistics_Natality_2016.RData")

# The lines below do NOT need to be changed, save for the final line;

# Creating Variable Labels 

# Birth date Variables
var_lab(unlabeled_2016$DOB_YY) = "Birth Year"

var_lab(unlabeled_2016$DOB_MM) = "Birth Month"
val_lab(unlabeled_2016$DOB_MM) = num_lab("
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

var_lab(unlabeled_2016$DOB_TT) = "Time of Birth"
val_lab(unlabeled_2016$DOB_TT) = num_lab("
                                          9999 Not Stated 
                                         ")

var_lab(unlabeled_2016$DOB_WK) = "Birth Day of Week"
val_lab(unlabeled_2016$DOB_WK) = num_lab("
                                          1 Sunday 
                                          2 Monday 
                                          3 Tuesday 
                                          4 Wednesday 
                                          5 Thursday
                                          6 Friday 
                                          7 Saturday   
                                         ")

# Geography
var_lab(unlabeled_2016$OSTATE) = "Occurrence Postal State"

var_lab(unlabeled_2016$XOSTATE) = "Expanded Occurrence State (NY = NY not including NYC, YC = NYC)"

var_lab(unlabeled_2016$OCNTYFIPS) = "Occurrence FIPS County"

var_lab(unlabeled_2016$OCNTYPOP) = "Occurrence County Population"
val_lab(unlabeled_2016$OCNTYPOP) = num_lab("
                                          0 County of 1,000,000 or more
                                          1 County of 500,000 to 1,000,000
				                                  2 County of 250,000 to 500,000
				                                  3 County of 100,000 to 250,000
				                                  4 County of 50,000 to 100,000
				                                  5 County of 25,000 to 50,000
				                                  6 County of 10,000 to 25,000 
				                                  9 County less than 10,000  
                                         ")

# Birth Place 
var_lab(unlabeled_2016$BFACIL) = "Birth Place"
val_lab(unlabeled_2016$BFACIL) = num_lab("
                                         1 Hospital 
                                         2 Freestanding Birthing Center 
                                         3 Home (intended) 
                                         4 Home (not intended) 
                                         5 Home (unknown if intended)	
                                         6 Clinic / Doctor's Office
                                         7 Other 
                                         9 Unknown
                                         ")

var_lab(unlabeled_2016$F_FACILITY) = "Reporting Flag for Birth Place"
val_lab(unlabeled_2016$F_FACILITY) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                         ")

var_lab(unlabeled_2016$BFACIL3) = "Birth Place Recode"
val_lab(unlabeled_2016$BFACIL3) = num_lab("
                                         1 In Hospital 
                                         2 Not in Hospital 
                                         3 Unknown or Not Stated
                                         ")

# Mother's Age 
var_lab(unlabeled_2016$MAGE_IMPFLG) = "Mother's Age Imputed"
val_lab(unlabeled_2016$MAGE_IMPFLG) = num_lab("
                                        1 Age imputed 
                                         ") # missing = age not imputed 

var_lab(unlabeled_2016$MAGE_REPFLG) = "Reported Age of Mother Used Flag"
val_lab(unlabeled_2016$MAGE_REPFLG) = num_lab("
                                          1 Reported age used
                                          ") # missing = reported age not used


var_lab(unlabeled_2016$MAGER) = "Mother's Age Recode 41"
val_lab(unlabeled_2016$MAGER) = num_lab("
                                    12 10-12 
                                    50 50 years and over
                                    ") 

var_lab(unlabeled_2016$MAGER14) = "Mother's Age Recode 14" 
val_lab(unlabeled_2016$MAGER14) = num_lab("
                                      1 Under 15 Years 
                                      3 15 years 
                                      04 16 years 
                                      05 17 years
                                      6 18 years 
                                      7 19 years 
                                      8 20-24 years 
                                      9 25-29 years
                                      10 30-34 years 
                                      11 35-39 years 
                                      12 40-44 years 
                                      13 45-49 years
                                      14 50-54 years 
                                      ") 

var_lab(unlabeled_2016$MAGER9) = "Mother's Age Recode 9" 
val_lab(unlabeled_2016$MAGER9) = num_lab("
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
var_lab(unlabeled_2016$MBCNTRY) = "Mother's Birth Country Code" 

var_lab(unlabeled_2016$MBSTATE) = "Mother's Postal Birth State (Revised)" 

var_lab(unlabeled_2016$MBSTATE_REC) = "Mother's Nativity"
val_lab(unlabeled_2016$MBSTATE_REC) = num_lab("
                                          1 Born in the U.S. (50 US States) 
                                          2 Born outside the U.S. (includes possessions)
                                          3 Unknown or Not Stated
                                          ") 

# Mother Residence Geography 
var_lab(unlabeled_2016$MRCNTRY) = "Mother's Residence Country"

var_lab(unlabeled_2016$XMRSTATE) = "Expanded State of Residence of Mother"

var_lab(unlabeled_2016$MRSTATEPSTL) = "Mother's Residence Postal State" 

var_lab(unlabeled_2016$MRCNTYFIPS) = "Mother's FIPS County"
val_lab(unlabeled_2016$MRCNTYFIPS) = num_lab("
                                          999 Foreign
                                          ") 

var_lab(unlabeled_2016$MRCITYFIPS) = "Mother's Residence City FIPS Place" 
val_lab(unlabeled_2016$MRCITYFIPS) = num_lab("
                                          99999  Foreign
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(RCNTY_POP = as.numeric(case_when(
  RCNTY_POP == "Z" ~ "999",
  RCNTY_POP == "0" ~ "0",
  RCNTY_POP == "1" ~ "1",
  RCNTY_POP == "2" ~ "2",
  RCNTY_POP == "3" ~ "3",
  RCNTY_POP == "4" ~ "4",
  RCNTY_POP == "5" ~ "5",
  RCNTY_POP == "6" ~ "6",
  RCNTY_POP == "9" ~ "9")))
var_lab(unlabeled_2016$RCNTY_POP) = "Population of Residence County" 
val_lab(unlabeled_2016$RCNTY_POP) = num_lab("
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

unlabeled_2016 <- unlabeled_2016 %>% mutate(RCITY_POP = as.numeric(case_when(
  RCITY_POP == "Z" ~ "999",
  RCITY_POP == "0" ~ "0",
  RCITY_POP == "1" ~ "1",
  RCITY_POP == "2" ~ "2",
  RCITY_POP == "3" ~ "3",
  RCITY_POP == "4" ~ "4",
  RCITY_POP == "5" ~ "5",
  RCITY_POP == "6" ~ "6",
  RCITY_POP == "9" ~ "9")))
var_lab(unlabeled_2016$RCITY_POP) = "Population of Residence City" 
val_lab(unlabeled_2016$RCITY_POP) = num_lab("
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

unlabeled_2016 <- unlabeled_2016 %>% mutate(CITYLIM = as.numeric(case_when(
  CITYLIM == "Y" ~ "1",
  CITYLIM == "N" ~ "0",
  CITYLIM == "U" ~ "9")))
var_lab(unlabeled_2016$CITYLIM) = "Insider City Limits" 
val_lab(unlabeled_2016$CITYLIM) = num_lab("
                                      0 No 
                                      1 Yes 
                                      9 Unknown or not stated	 
                                          ") 

var_lab(unlabeled_2016$F_LIMIT) = "Reporting Flag for City Limits"
val_lab(unlabeled_2016$F_LIMIT) = num_lab("
                                      0 Non-Reporting
                                      1 Reporting
                                          ") 

var_lab(unlabeled_2016$RECTYPE) = "Record Type"
val_lab(unlabeled_2016$RECTYPE) = num_lab("
                                      1 Resident: State and county of occurrence and resident are the same
                                      2 Nonresident: State and county of occurrence and residence are different
                                          ") 

var_lab(unlabeled_2016$RESTATUS) = "Residence Status"
# same numbers = different labels for US and US territories (US / US territory)
val_lab(unlabeled_2016$RESTATUS) = num_lab("
                                       1 Resident 
                                       2 Intrastate/Intraterritory Nonresident
                                       3 Interstate/Interterritory Resident 
                                       4 Foreign Resident
                                          ") 

# Mother Race 
var_lab(unlabeled_2016$MRACE31) = "Mother's Race Recode 31"
val_lab(unlabeled_2016$MRACE31) = num_lab("
                                      1 White (only) [only one race reported] 
                                      2 Black (only)
                                      3 AIAN (American Indian or Alaskan Native) (only) 
                                      4 Asian (only) 
                                      5 NHOPI (Native Hawaiian or Other Pacific Islander) (only)
                                      6 Black and White
                                      7 Black and AIAN 
                                      8 Black and Asian 
                                      9 Black and NHOPI  
                                      10 AIAN and White 
                                      11 AIAN and Asian
                                      12 AIAN and NHOPI 
                                      13 Asian and White 
                                      14 Asian and NHOPI
                                      15 NHOPI and White 
                                      16 Black, AIAN, and White
                                      17 Black, AIAN, and Asian 
                                      18 Black, AIAN, and NHOPI
                                      19 Black, Asian, and White 
                                      20 Black, Asian, and NHOPI
                                      21 Black, NHOPI, and White 
                                      22 AIAN, Asian, and White
                                      23 AIAN, NHOPI, and White 
                                      24 AIAN, Asian, and NHOPI
                                      25 Asian, NHOPI, and White 
                                      26 Black, AIAN, Asian, and White
                                      27 Black, AIAN, Asian, and NHOPI 
                                      28 Black, AIAN, NHOPI, and White
                                      29 Black, Asian, NHOPI, and White 
                                      30 AIAN, Asian, NHOPI, and White
                                      31 Black, AIAN, Asian, NHOPI, and White
                                          ") 

var_lab(unlabeled_2016$MRACE6) = "Mother's Race Recode 6"
val_lab(unlabeled_2016$MRACE6) = num_lab("
                                     1 White (only) 
                                     2 Black (only) 
                                     3 AIAN (only) 
                                     4 Asian (only) 
                                     5 NHOPI (only) 
                                     6 More than one race
                                          ") 

var_lab(unlabeled_2016$MRACE15) = "Mother's Race Recode 15"
val_lab(unlabeled_2016$MRACE15) = num_lab("
                                      1 White (only) 
                                      2 Black (only)  
                                      3 AIAN (only)
                                      4 Asian Indian (only) 
                                      5 Chinese (only) 
                                      6 Filipino (only)
                                      7 Japanese (only) 
                                      8 Korean (only) 
                                      9 Vietnamese (only)
                                      10 Other Asian (only) 
                                      11 Hawaiian (only) 
                                      12 Guamanian (only)
                                      13 Samoan (only) 
                                      14 Other Pacific Islander (only)
                                      15 More than one race 
                                          ") 

var_lab(unlabeled_2016$MBRACE) = "Bridged Race Mother" 
#variable labels different for US and all Outlying Areas of the United States except Puerto Rico
# and for Puerto Rico (0 = Puerto Rico label, 1 2 = same, 3 4 = US label)
val_lab(unlabeled_2016$MBRACE) = num_lab("
                                     0 Other (not classified as White or Black)
                                     1 White 
                                     2 Black
                                     3 American Indian or Alaskan Native 
                                     4 Asian or Pacific Island 
                                          ") 

var_lab(unlabeled_2016$MRACEIMP) = "Mother's Race Imputed" 
# missing = Mother's race not imputed 
val_lab(unlabeled_2016$MRACEIMP) = num_lab("
                                       1 Unknown race imputed 
                                       2 All other races, formerly coded 09, imputed
                                          ") 

# Mother Hispanic Origin 
var_lab(unlabeled_2016$MHISP_R) = "Mother's Hispanic Origin Recode" 
val_lab(unlabeled_2016$MHISP_R) = num_lab("
                                      0 Non-Hispanic 
                                      1 Mexican 
                                      2 Puerto Rican 
                                      3 Cuban 
                                      4 Central and South American 
                                      5 Other and Unknown Hispanic origin
                                      9 Hispanic origin not stated
                                          ") 

var_lab(unlabeled_2016$F_MHISP) = "Reporting Flag for Mother's Origin"
val_lab(unlabeled_2016$F_MHISP) = num_lab("
                                      0 Non-Reporting 
                                      1 Reporting
                                          ") 

var_lab(unlabeled_2016$MRACEHISP) = "Mother's Race/Hispanic Origin" 
val_lab(unlabeled_2016$MRACEHISP) = num_lab("
                                        1 Non-Hispanic White (only) 
                                        2 Non-Hispanic Black (only)
                                        3 Non-Hispanic AIAN (only) 
                                        4 Non-Hispanic Asian (only)
                                        5 Non-Hispanic NHOPI (only) 
                                        6 Non-Hispanic more than one race
                                        7 Hispanic 
                                        8 Origin unknown or not stated
                                          ") 

# Mother Marital Status / Paternity 
unlabeled_2016 <- unlabeled_2016 %>% mutate(MAR_P = as.numeric(case_when(
  MAR_P == "Y" ~ "1",
  MAR_P == "N" ~ "0",
  MAR_P == "U" ~ "2",
  MAR_P == "X" ~ "9")))
var_lab(unlabeled_2016$MAR_P) = "Paternity Acknowledged" 
val_lab(unlabeled_2016$MAR_P) = num_lab("
                                     0 No 
                                     1 Yes 
                                     2 Unknown 
                                     9 Not Applicable  
                                          ") 

var_lab(unlabeled_2016$DMAR) = "Marital Status" 
# variable labels different for US and all Outlying Areas of the United States except Puerto Rico
# and for Puerto Rico (1 = same, 2 = US / PR, >3 = just PR)
val_lab(unlabeled_2016$DMAR) = num_lab("
                                  1 Married 
                                  2 Unmarried/Unmarried parents living together
                                  3 Unmarrried parents not living together 
                                  9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$MAR_IMP) = "Marital Status" 
val_lab(unlabeled_2016$MAR_IMP) = num_lab("
                                   1 Marital Status imputed
                                          ") # missing = not imputed 

var_lab(unlabeled_2016$F_MAR_P) = "Reporting Flag for Paternity Acknowledged" 
val_lab(unlabeled_2016$F_MAR_P) = num_lab("
                                      0 Non-Reporting
                                      1 Reporting
                                          ") 

# Mother's Education 
var_lab(unlabeled_2016$MEDUC) = "Mother's Education"
val_lab(unlabeled_2016$MEDUC) = num_lab("
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

var_lab(unlabeled_2016$F_MEDUC) = "Reporting Flag for Education of Mother"
val_lab(unlabeled_2016$F_MEDUC) = num_lab("
                                      0 Non-Reporting 
                                      1 Reporting 
                                          ") 

# Father's Age 
var_lab(unlabeled_2016$FAGERPT_FLG) = "Father's Reported Age Used" 
val_lab(unlabeled_2016$FAGERPT_FLG) = num_lab("
                                          1 Father's reported age used
                                          ") # missing = Father's reported age not used 

var_lab(unlabeled_2016$FAGECOMB) = "Father's Combined Age (Revised)" # in years
val_lab(unlabeled_2016$FAGECOMB) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$FAGEREC11) = "Father's Age Recode 11" 
val_lab(unlabeled_2016$FAGEREC11) = num_lab("
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

# Father's Race 
var_lab(unlabeled_2016$FRACE31) = "Father's Race Recode 31" 
val_lab(unlabeled_2016$FRACE31) = num_lab("
                                      1 White (only) [only one race reported] 
                                      2 Black (only)
                                      3 AIAN (American Indian or Alaskan Native) (only)
                                      4 Asian (only) 
                                      5 NHOPI (Native Hawaiian or Other Pacific Islander) (only)
                                      6 Black and White 
                                      7 Black and AIAN 
                                      8 Black and Asian
                                      9 Black and NHOPI 
                                      10 AIAN and White 
                                      11 AIAN and Asian
                                      12 AIAN and NHOPI 
                                      13 Asian and White 
                                      14 Asian and NHOPI
                                      15 NHOPI and White 
                                      16 Black, AIAN, and White
                                      17 Black, AIAN, and Asian 
                                      18 Black, AIAN, and NHOPI 
                                      19 Black, Asian, and White 
                                      20 Black, Asian, and NHOPI
                                      21 Black, NHOPI, and White 
                                      22 AIAN, Asian, and White
                                      23 AIAN, NHOPI, and White 
                                      24 AIAN, Asian, and NHOPI
                                      25 Asian, NHOPI, and White 
                                      26 Black, AIAN, Asian, and White
                                      27 Black, AIAN, Asian, and NHOPI 
                                      28 Black, AIAN, NHOPI, and White
                                      29 Black, Asian, NHOPI, and White 
                                      30 AIAN, Asian, NHOPI, and White
                                      31 Black, AIAN, Asian, NHOPI, and White 
                                      99 Unknown or Not Stated
                                          ") 

var_lab(unlabeled_2016$FRACE6) = "Father's Race Recode 6" 
val_lab(unlabeled_2016$FRACE6) = num_lab("
                                     1 White (only) 
                                     2 Black (only) 
                                     3 AIAN (only)
                                     4 Asian (only) 
                                     5 NHOPI (only) 
                                     6 More than one race	
                                     9 Unknown or Not Stated
                                          ") 

var_lab(unlabeled_2016$FRACE15) = "Father's Race Recode 15" 
val_lab(unlabeled_2016$FRACE15) = num_lab("
                                      1 White (only) 
                                      2 Black (only) 
                                      3 AIAN (only)
                                      4 Asian Indian (only) 
                                      5 Chinese (only) 
                                      6 Filipino (only) 
                                      7 Japanese (only) 
                                      8 Korean (only) 
                                      9 Vietnamese (only)
                                      10 Other Asian (only) 
                                      11 Hawaiian (only) 
                                      12 Guamanian (only)
                                      13 Samoan (only) 
                                      14 Other Pacific Islander (only)
                                      15 More than one race
                                      99 Unknown or Not Stated
                                          ") 

var_lab(unlabeled_2016$FBRACE) = "Bridged Race Father"
# variable labels different for US and all Outlying Areas of the United States except Puerto Rico
# and for Puerto Rico (0 = Puerto Rico label, 1 2 same, 3 4 = US label)	
val_lab(unlabeled_2016$FBRACE) = num_lab("
                                    0 Other (not classified as White or Black) 
                                    1 White 
                                    2 Black
                                    3 American Indian or Alaskan Native 
                                    4 Asian or Pacific Island 
                                          ")  
# 9 code presumably unknown, not in codebook  

# Father's Hispanic Origin 
var_lab(unlabeled_2016$FHISP_R) = "Father's Hispanic Origin Recode"  
val_lab(unlabeled_2016$FHISP_R) = num_lab("
                                      0 Non-Hispanic 
                                      1 Mexican 
                                      2 Puerto Rican 
                                      3 Cuban 
                                      4 Central and South American 
                                      5 Other and Unknown Hispanic origin
                                      9 Hispanic origin not stated
                                          ") 

var_lab(unlabeled_2016$F_FHISP) = "Reporting Flag for Father's Origin"  
val_lab(unlabeled_2016$F_FHISP) = num_lab("
                                      0 Non-Reporting 
                                      1 Reporting
                                          ") 

var_lab(unlabeled_2016$FRACEHISP) = "Father's Race/Hispanic Origin"  		 
val_lab(unlabeled_2016$FRACEHISP) = num_lab("
                                        1 Non-Hispanic White (only) 
                                        2 Non-Hispanic Black (only)
                                        3 Non-Hispanic AIAN (only) 
                                        4 Non-Hispanic Asian (only)
                                        5 Non-Hispanic NHOPI (only) 
                                        6 Non-Hispanic more than one race
                                        7 Hispanic 
                                        8 Origin unknown or not stated
                                        9 Race unknown or not stated (Non-Hispanic)
                                          ") 

# Father's Education 
var_lab(unlabeled_2016$FEDUC) = "Father's Education"	 
val_lab(unlabeled_2016$FEDUC) = num_lab("
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

var_lab(unlabeled_2016$F_FEDUC) = "Reporting Flag for Education of Father"	 
val_lab(unlabeled_2016$F_FEDUC) = num_lab("
                                      0 Non-Reporting 
                                      1 Reporting
                                          ") 

# Births 
var_lab(unlabeled_2016$PRIORLIVE) = "Prior Births Now Living"	 
val_lab(unlabeled_2016$PRIORLIVE) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$PRIORDEAD) = "Prior Births Now Dead"
val_lab(unlabeled_2016$PRIORDEAD) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$PRIORTERM) = "Prior Other Terminations"
val_lab(unlabeled_2016$PRIORTERM) = num_lab("
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LBO_REC) = "Live Birth Order Recode"
val_lab(unlabeled_2016$LBO_REC) = num_lab("
                                       8 8 or more live births 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$TBO_REC) = "Total Birth Order Recode"
val_lab(unlabeled_2016$TBO_REC) = num_lab("
                                      8 8 or more total births 
                                      9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ILLB_R) = "Interval of Last Live Birth Recode"
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2016$ILLB_R) = num_lab("
                                      888 Not applicable / 1st live birth 
                                      999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ILLB_R11) = "Interval of Last Live Birth Recode 11" 
val_lab(unlabeled_2016$ILLB_R11) = num_lab("
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

var_lab(unlabeled_2016$ILOP_R) = "Interval of Last Other Pregnancy Recode" 
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2016$ILOP_R) = num_lab("
                                     888 Not applicable / 1st natality event 
                                     999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ILOP_R11) = "Interval of Last Other Pregnancy Recode 11" 
val_lab(unlabeled_2016$ILOP_R11) = num_lab("
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

var_lab(unlabeled_2016$ILP_R) = "Interval of Last Pregnancy Recode"
# 000-003 Plural delivery, 004-3000 months since last live birth
val_lab(unlabeled_2016$ILP_R) = num_lab("
                                    888 Not applicable / no previous pregnancy
                                    999 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ILP_R11) = "Interval of Last Pregnancy Recode 11"
val_lab(unlabeled_2016$ILP_R11) = num_lab("
                                      0 Zero to 3 months (plural delivery) 
                                      1 4 to 11 months
                                      2 12 to 17 months 
                                      3 18 to 23 months 
                                      4 24 to 35 months
                                      5 36 to 47 months 
                                      6 48 to 59 months 
                                      7 60 to 71 months
                                      8 72 months and over 
                                      88 Not applicable (no previous pregnancy)
                                      99 Unknown or not stated
                                          ") 

# Prenatal Care 
var_lab(unlabeled_2016$PRECARE) = "Month Prenatal Care Began" 
val_lab(unlabeled_2016$PRECARE) = num_lab("
                                       0 No prenatal care 
                                       99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_MPCB) = "Reporting Flag for Month Prenatal Care Began"
val_lab(unlabeled_2016$F_MPCB) = num_lab("
                                     0 Non-Reporting 
                                     1 Reporting
                                          ") 

var_lab(unlabeled_2016$PRECARE5) = "Month Prenatal Care Began Recode" 
val_lab(unlabeled_2016$PRECARE5) = num_lab("
                                       1 1st to 3rd month 
                                       2 4th to 6th month 
                                       3 7th to final month
                                       4 No prenatal care 
                                       5 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$PREVIS) = "Number of Prenatal Visits (Revised)" 
val_lab(unlabeled_2016$PREVIS) = num_lab("
                                     99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$PREVIS_REC) = "Number of Prenatal Visits Recode"
val_lab(unlabeled_2016$PREVIS_REC) = num_lab("
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

var_lab(unlabeled_2016$F_TPCV) = "Reporting Flag for Total Prenatal Care Visits" 
val_lab(unlabeled_2016$F_TPCV) = num_lab("
                                     0 Non-Reporting 
                                     1 Reporting
                                          ") 

#WIC
unlabeled_2016 <- unlabeled_2016 %>% mutate(WIC = as.numeric(case_when(
  WIC == "Y" ~ "1",
  WIC == "N" ~ "0",
  WIC == "U" ~ "9")))
var_lab(unlabeled_2016$WIC) = "WIC"
val_lab(unlabeled_2016$WIC) = num_lab("
                                   0 No
                                   1 Yes 
                                   9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_WIC) = "Reporting Flag for WIC"
val_lab(unlabeled_2016$F_WIC) = num_lab("
                                    0 Non-Reporting 
                                    1 Reporting
                                          ") 

# Cigarette Use 
var_lab(unlabeled_2016$CIG_0) = "Cigarettes Before Pregnancy" 
val_lab(unlabeled_2016$CIG_0) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG_1) = "Cigarettes 1st Trimester" 
val_lab(unlabeled_2016$CIG_1) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG_2) = "Cigarettes 2nd Trimester" 
val_lab(unlabeled_2016$CIG_2) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG_3) = "Cigarettes 3rd Trimester" 
val_lab(unlabeled_2016$CIG_3) = num_lab("
                                    98 98 or more cigarettes daily
                                    99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG0_R) = "Cigarettes Before Pregnancy Recode" 
val_lab(unlabeled_2016$CIG0_R) = num_lab("
                                     0 Nonsmoker 
                                     1 1-5 
                                     2 6-10
                                     3 11-20 
                                     4 21-40 
                                     5 41 or more
                                     6 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG1_R) = "Cigarettes 1st Trimester Recode"
val_lab(unlabeled_2016$CIG1_R) = num_lab("
                                     0 Nonsmoker 
                                     1 1-5 
                                     2 6-10
                                     3 11-20 
                                     4 21-40 
                                     5 41 or more
                                     6 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG2_R) = "Cigarettes 2nd Trimester Recode" 
val_lab(unlabeled_2016$CIG2_R) = num_lab("
                                     0 Nonsmoker 
                                     1 1-5 
                                     2 6-10
                                     3 11-20 
                                     4 21-40 
                                     5 41 or more
                                     6 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CIG3_R) = "Cigarettes 3rd Trimester Recode" 
val_lab(unlabeled_2016$CIG3_R) = num_lab("
                                     0 Nonsmoker 
                                     1 1-5 
                                     2 6-10
                                     3 11-20 
                                     4 21-40 
                                     5 41 or more
                                     6 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_CIGS_0) = "Reporting Flag for Cigarettes before Pregnancy" 
val_lab(unlabeled_2016$F_CIGS_0) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CIGS_1) = "Reporting Flag for Cigarettes 1st Trimester" 
val_lab(unlabeled_2016$F_CIGS_1) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CIGS_2) = "Reporting Flag for Cigarettes 2nd Trimester"
val_lab(unlabeled_2016$F_CIGS_2) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CIGS_3) = "Reporting Flag for Cigarettes 3rd Trimester" 
val_lab(unlabeled_2016$F_CIGS_3) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(CIG_REC = as.numeric(case_when(
  CIG_REC == "Y" ~ "1",
  CIG_REC == "N" ~ "0",
  CIG_REC == "U" ~ "9")))
var_lab(unlabeled_2016$CIG_REC) = "Cigarette Recode (Revised)"
val_lab(unlabeled_2016$CIG_REC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_TOBACO) = "Reporting Flag for Tobacco use"
val_lab(unlabeled_2016$F_TOBACO) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ")

# Mother Height and Weight 
var_lab(unlabeled_2016$M_Ht_In) = "Mother's Height in Inches"
val_lab(unlabeled_2016$M_Ht_In) = num_lab("
                                      99 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$F_M_HT) = "Reporting Flag for Mother's Height" 
val_lab(unlabeled_2016$F_M_HT) = num_lab("
                                      0 Non-Reporting 
                                      1 Reporting
                                          ")

unlabeled_2016 <- unlabeled_2016 %>% mutate(BMI = ifelse(BMI == 99.9, 99, BMI))
var_lab(unlabeled_2016$BMI) = "BMI" 
val_lab(unlabeled_2016$BMI) = num_lab("
                                      99 Unknown or not stated
                                          ")

# typo in codebook: "Obesity I 35.0-39.9"
var_lab(unlabeled_2016$BMI_R) = "Body Mass Index Recode"
val_lab(unlabeled_2016$BMI_R) = num_lab("
                                    1 Underweight <18.5
                                    2 Normal 18.5-24.9
                                    3 Overweight 25.0-29.9
                                    4 Obesity I 30.0-34.9 
                                    5 Obesity II 35.0-39.9
                                    6 Extreme Obesity III ≥ 40.0 
                                    9 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$PWgt_R) = "Pre-pregnancy Weight Recode" 
val_lab(unlabeled_2016$PWgt_R) = num_lab("
                                     999 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$F_PWGT) = "Reporting Flag for Pre-pregnancy Weight"
val_lab(unlabeled_2016$F_PWGT) = num_lab("
                                     0 Non-Reporting 
                                     1 Reporting
                                          ")

var_lab(unlabeled_2016$DWgt_R) = "Delivery Weight Recode"
val_lab(unlabeled_2016$DWgt_R) = num_lab("
                                     999 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$F_DWGT) = "Reporting Flag for Delivery Weight"
val_lab(unlabeled_2016$F_DWGT) = num_lab("
                                     0 Non-Reporting 
                                     1 Reporting
                                          ")

var_lab(unlabeled_2016$WTGAIN) = "Weight Gain"
val_lab(unlabeled_2016$WTGAIN) = num_lab("
                                     98 98 pounds and over 
                                     99 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$WTGAIN_REC) = "Weight Gain Recode" 
val_lab(unlabeled_2016$WTGAIN_REC) = num_lab("
                                         1 Less than 11 pounds 
                                         2 11 to 20 pounds 
                                         3 21 to 30 pounds
                                         4 31 to 40 pounds 
                                         5 41 to 98 pounds 
                                         9 Unknown or not stated
                                          ")

var_lab(unlabeled_2016$F_WTGAIN) = "Reporting Flag for Weight Gain"
val_lab(unlabeled_2016$F_WTGAIN) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ")

# Risk Factors 
unlabeled_2016 <- unlabeled_2016 %>% mutate(RF_PDIAB = as.numeric(case_when(
  RF_PDIAB == "Y" ~ "1",
  RF_PDIAB == "N" ~ "0",
  RF_PDIAB == "U" ~ "9")),
  RF_GDIAB = as.numeric(case_when(
    RF_GDIAB == "Y" ~ "1",
    RF_GDIAB == "N" ~ "0",
    RF_GDIAB == "U" ~ "9")),
  RF_PHYPE = as.numeric(case_when(
    RF_PHYPE == "Y" ~ "1",
    RF_PHYPE == "N" ~ "0",
    RF_PHYPE == "U" ~ "9")),
  RF_GHYPE = as.numeric(case_when(
    RF_GHYPE == "Y" ~ "1",
    RF_GHYPE == "N" ~ "0",
    RF_GHYPE == "U" ~ "9")),
  RF_EHYPE = as.numeric(case_when(
    RF_EHYPE == "Y" ~ "1",
    RF_EHYPE == "N" ~ "0",
    RF_EHYPE == "U" ~ "9")),
  RF_PPTERM = as.numeric(case_when(
    RF_PPTERM == "Y" ~ "1",
    RF_PPTERM == "N" ~ "0",
    RF_PPTERM == "U" ~ "9")))

var_lab(unlabeled_2016$RF_PDIAB) = "Pre-pregnancy Diabetes"
val_lab(unlabeled_2016$RF_PDIAB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_GDIAB) = "Gestational Diabetes"
val_lab(unlabeled_2016$RF_GDIAB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_PHYPE) = "Pre-pregnancy Hypertension"
val_lab(unlabeled_2016$RF_PHYPE) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_GHYPE) = "Gestational Hypertension"
val_lab(unlabeled_2016$RF_GHYPE) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_EHYPE) = "Hypertension Eclampsia"
val_lab(unlabeled_2016$RF_EHYPE) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_PPTERM) = "Previous Preterm Birth"
val_lab(unlabeled_2016$RF_PPTERM) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_RF_PDIAB) = "Reporting Flag for Pre-pregnancy Diabetes"
val_lab(unlabeled_2016$F_RF_PDIAB) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_GDIAB) = "Reporting Flag for Gestational Diabetes"
val_lab(unlabeled_2016$F_RF_GDIAB) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_PHYPER) = "Reporting Flag for Pre-pregnancy Hypertension" 
val_lab(unlabeled_2016$F_RF_PHYPER) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_GHYPER) = "Reporting Flag for Gestational Hypertension"
val_lab(unlabeled_2016$F_RF_GHYPER) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_ECLAMP) = "Reporting Flag for Hypertension Eclampsia"
val_lab(unlabeled_2016$F_RF_ECLAMP) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_PPB) = "Reporting Flag for Previous Preterm Birth"
val_lab(unlabeled_2016$F_RF_PPB) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(RF_INFTR = as.numeric(case_when(
  RF_INFTR == "Y" ~ "1",
  RF_INFTR == "N" ~ "0",
  RF_INFTR == "U" ~ "9")))
var_lab(unlabeled_2016$RF_INFTR) = "Infertility Treatment" # use reporting flag in field 319 for 2015
val_lab(unlabeled_2016$RF_INFTR) = num_lab("
                                        0 No 
                                        1 Yes 
                                        9 Unknown or not stated
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(RF_FEDRG = as.numeric(case_when(
  RF_FEDRG == "Y" ~ "1",
  RF_FEDRG == "N" ~ "0",
  RF_FEDRG == "X" ~ "8",
  RF_FEDRG == "U" ~ "9")),
  RF_ARTEC = as.numeric(case_when(
    RF_ARTEC == "Y" ~ "1",
    RF_ARTEC == "N" ~ "0",
    RF_ARTEC == "X" ~ "8",
    RF_ARTEC == "U" ~ "9")))

var_lab(unlabeled_2016$RF_FEDRG) = "Fertility Enhancing Drugs"
val_lab(unlabeled_2016$RF_FEDRG) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_ARTEC) = "Asst. Reproductive Technology"
val_lab(unlabeled_2016$RF_ARTEC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_RF_INFT) = "Reporting Flag for Infertility Treatment"
val_lab(unlabeled_2016$F_RF_INFT) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_INF_DRG) = "Reporting Flag for Fertility Enhance Drugs"
val_lab(unlabeled_2016$F_RF_INF_DRG) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_INF_ART) =  "Reporting Flag for Reproductive Technology" 
val_lab(unlabeled_2016$F_RF_INF_ART) = num_lab("
                                           0 Non-Reporting 
                                           1 Reporting
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(RF_CESAR = as.numeric(case_when(
  RF_CESAR == "Y" ~ "1",
  RF_CESAR == "N" ~ "0",
  RF_CESAR == "U" ~ "9")))
var_lab(unlabeled_2016$RF_CESAR) =  "Previous Cesareans"
val_lab(unlabeled_2016$RF_CESAR) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$RF_CESARN) =  "Previous Cesareans Number"
val_lab(unlabeled_2016$RF_CESARN) = num_lab("
                                        0 None 
                                        99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_RF_CESAR) = "Reporting Flag for Previous Cesarean" 
val_lab(unlabeled_2016$F_RF_CESAR) = num_lab("
                                           0 Non-Reporting 
                                           1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_RF_NCESAR) = "Reporting Flag for Number of Previous Cesareans"
val_lab(unlabeled_2016$F_RF_NCESAR) = num_lab("
                                           0 Non-Reporting 
                                           1 Reporting
                                          ") 

var_lab(unlabeled_2016$NO_RISKS) = "No Risk Factors Checked" 
val_lab(unlabeled_2016$NO_RISKS) = num_lab("
                                       1 True 
                                       0 False 
                                       9 Not Reported
                                          ") 

# f_Eclampsia - no observations 

# Infections Present 
unlabeled_2016 <- unlabeled_2016 %>% mutate(IP_GON = as.numeric(case_when(
  IP_GON == "Y" ~ "1",
  IP_GON == "N" ~ "0",
  IP_GON == "U" ~ "9")),
  IP_SYPH = as.numeric(case_when(
    IP_SYPH == "Y" ~ "1",
    IP_SYPH == "N" ~ "0",
    IP_SYPH == "U" ~ "9")),
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

var_lab(unlabeled_2016$IP_GON) =  "Gonorrhea" 
val_lab(unlabeled_2016$IP_GON) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$IP_SYPH) =  "Syphilis" 
val_lab(unlabeled_2016$IP_SYPH) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$IP_CHLAM) =  "Chlamydia"
val_lab(unlabeled_2016$IP_CHLAM) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$IP_HEPB) = "Hepatitis B"
val_lab(unlabeled_2016$IP_HEPB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$IP_HEPC) = "Hepatitis C"
val_lab(unlabeled_2016$IP_HEPC) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_IP_GONOR) = "Reporting Flag for Gonorrhea"
val_lab(unlabeled_2016$F_IP_GONOR) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_IP_SYPH) = "Reporting Flag for Syphilis" 
val_lab(unlabeled_2016$F_IP_SYPH) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_IP_CHLAM) = "Reporting Flag for Chlamydia" 
val_lab(unlabeled_2016$F_IP_CHLAM) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_IP_HEPATB) = "Reporting Flag for Hepatitis B" 
val_lab(unlabeled_2016$F_IP_HEPATB) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_IP_HEPATC) = "Reporting Flag for Hepatitis C" 
val_lab(unlabeled_2016$F_IP_HEPATC) = num_lab("
                                         0 Non-Reporting 
                                         1 Reporting 
                                          ") 

var_lab(unlabeled_2016$NO_INFEC) = "No Infections Checked" 
val_lab(unlabeled_2016$NO_INFEC) = num_lab("
                                       1 True 
                                       0 False 
                                       9 Not Reported
                                          ") 

# Obstetric Procedures
unlabeled_2016 <- unlabeled_2016 %>% mutate(OB_ECVS = as.numeric(case_when(
  OB_ECVS == "Y" ~ "1",
  OB_ECVS == "N" ~ "0",
  OB_ECVS == "U" ~ "9")),
  OB_ECVF = as.numeric(case_when(
    OB_ECVF == "Y" ~ "1",
    OB_ECVF == "N" ~ "0",
    OB_ECVF == "U" ~ "9")))

var_lab(unlabeled_2016$OB_ECVS) = "Successful External Cephalic Version" 
val_lab(unlabeled_2016$OB_ECVS) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$OB_ECVF) = "Failed External Cephalic Version" 
val_lab(unlabeled_2016$OB_ECVF) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_OB_SUCC) =  "Reporting Flag for Successful External Cephalic Version" 
val_lab(unlabeled_2016$F_OB_SUCC) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_OB_FAIL) =  "Reporting Flag for Failed External Cephalic Version"
val_lab(unlabeled_2016$F_OB_FAIL) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

# Characteristics of Labor and Delivery 
unlabeled_2016 <- unlabeled_2016 %>% mutate(LD_INDL = as.numeric(case_when(
  LD_INDL == "Y" ~ "1",
  LD_INDL == "N" ~ "0",
  LD_INDL == "U" ~ "9")),
  LD_AUGM = as.numeric(case_when(
    LD_AUGM == "Y" ~ "1",
    LD_AUGM == "N" ~ "0",
    LD_AUGM == "U" ~ "9")),
  LD_STER = as.numeric(case_when(
    LD_STER == "Y" ~ "1",
    LD_STER == "N" ~ "0",
    LD_STER == "U" ~ "9")),
  LD_ANTB = as.numeric(case_when(
    LD_ANTB == "Y" ~ "1",
    LD_ANTB == "N" ~ "0",
    LD_ANTB == "U" ~ "9")),
  LD_CHOR = as.numeric(case_when(
    LD_CHOR == "Y" ~ "1",
    LD_CHOR == "N" ~ "0",
    LD_CHOR == "U" ~ "9")),
  LD_ANES = as.numeric(case_when(
    LD_ANES == "Y" ~ "1",
    LD_ANES == "N" ~ "0",
    LD_ANES == "U" ~ "9")))

var_lab(unlabeled_2016$LD_INDL) = "Induction of Labor"
val_lab(unlabeled_2016$LD_INDL) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LD_AUGM) = "Augmentation of Labor"
val_lab(unlabeled_2016$LD_AUGM) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LD_STER) = "Steroids"
val_lab(unlabeled_2016$LD_STER) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LD_ANTB) =  "Antibiotics"
val_lab(unlabeled_2016$LD_ANTB) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LD_CHOR) = "Chorioamnionitis"
val_lab(unlabeled_2016$LD_CHOR) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$LD_ANES) = "Anesthesia"
val_lab(unlabeled_2016$LD_ANES) = num_lab("
                                       0 No
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_LD_INDL) =  "Reporting Flag for Induction of Labor"
val_lab(unlabeled_2016$F_LD_INDL) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_LD_AUGM) =  "Reporting Flag for Augmentation of Labor"
val_lab(unlabeled_2016$F_LD_AUGM) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_LD_STER) = "Reporting Flag for Steroids" 
val_lab(unlabeled_2016$F_LD_STER) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_LD_ANTB) = "Reporting Flag for Antiobiotics"
val_lab(unlabeled_2016$F_LD_ANTB) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_LD_CHOR) =  "Reporting Flag for Chorioamnionitis"
val_lab(unlabeled_2016$F_LD_CHOR) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_LD_ANES) =  "Reporting Flag for Anesthesia"
val_lab(unlabeled_2016$F_LD_ANES) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$NO_LBRDLV) = "No Characteristics of Labor Checked"
val_lab(unlabeled_2016$NO_LBRDLV) = num_lab("
                                        1 True 
                                        0 False 
                                        9 Not Reported
                                          ") 

# Method of Delivery 
var_lab(unlabeled_2016$ME_PRES) = "Fetal Presentation"
val_lab(unlabeled_2016$ME_PRES) = num_lab("
                                      1 Cephalic 
                                      2 Breech 
                                      3 Other 
                                      9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ME_ROUT) = "Final Route & Method of Delivery"
val_lab(unlabeled_2016$ME_ROUT) = num_lab("
                                      1 Spontaneous 
                                      2 Forceps 
                                      3 Vacuum 
                                      4 Cesarean 
                                      9 Unknown or not stated
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(ME_TRIAL = as.numeric(case_when(
  ME_TRIAL == "Y" ~ "1",
  ME_TRIAL == "N" ~ "0",
  ME_TRIAL == "X" ~ "8",
  ME_TRIAL == "U" ~ "9")))
var_lab(unlabeled_2016$ME_TRIAL) = "Trial of Labor Attempted" 
val_lab(unlabeled_2016$ME_TRIAL) = num_lab("
                                       0 No 
                                       1 Yes 
                                       8 Not applicable 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_ME_PRES) =  "Reporting Flag for Fetal Presentation"
val_lab(unlabeled_2016$F_ME_PRES) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_ME_ROUT) = "Reporting Flag for Final Route and Method of Delivery" 
val_lab(unlabeled_2016$F_ME_ROUT) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$F_ME_TRIAL) = "Reporting Flag for Trial of Labor Attempted"
val_lab(unlabeled_2016$F_ME_TRIAL) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting 
                                          ") 

var_lab(unlabeled_2016$RDMETH_REC) = "Delivery Method Recode"
val_lab(unlabeled_2016$RDMETH_REC) = num_lab("
                                         1 Vaginal (excludes vaginal after previous C-section)
                                         2 Vaginal after previous c-section
                                         3 Primary C-section
                                         4 Repeat C-section
                                         5 Vaginal (unknown if previous c-section)
                                         6 C-section (unknown if previous c-section)
                                         9 Not Stated
                                          ") 

var_lab(unlabeled_2016$DMETH_REC) = "Delivery Method Recode Combined"
val_lab(unlabeled_2016$DMETH_REC) = num_lab("
                                        1 Vaginal 
                                        2 C-Section 
                                        9 Unknown
                                          ") 

var_lab(unlabeled_2016$F_DMETH_REC) = "Reporting Flag for Method of Delivery Recode"
val_lab(unlabeled_2016$F_DMETH_REC) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

# Maternal Morbidity 
unlabeled_2016 <- unlabeled_2016 %>% mutate(MM_MTR = as.numeric(case_when(
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
  MM_AICU = as.numeric(case_when(
    MM_AICU == "Y" ~ "1",
    MM_AICU == "N" ~ "0",
    MM_AICU == "U" ~ "9")))

var_lab(unlabeled_2016$MM_MTR) = "Maternal Transfusion" 
val_lab(unlabeled_2016$MM_MTR) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$MM_PLAC) = "Perineal Laceration"
val_lab(unlabeled_2016$MM_PLAC) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$MM_RUPT) = "Ruptured Uterus" 
val_lab(unlabeled_2016$MM_RUPT) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$MM_UHYST) = "Unplanned Hysterectomy" 
val_lab(unlabeled_2016$MM_UHYST) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$MM_AICU) = "Admit to Intensive Care"
val_lab(unlabeled_2016$MM_AICU) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_MM_MTR) = "Reporting Flag for Maternal Transfusion"
val_lab(unlabeled_2016$F_MM_MTR) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_MM_PLAC) = "Reporting Flag for Perineal Laceration"
val_lab(unlabeled_2016$F_MM_PLAC) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_MM_RUPT) = "Reporting Flag for Ruptured Uterus"
val_lab(unlabeled_2016$F_MM_RUPT) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_MM_UHYST) = "Reporting Flag for Unplanned Hysterectomy"
val_lab(unlabeled_2016$F_MM_UHYST) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_MM_AICU) = "Reporting Flag for Admission to Intensive Care"
val_lab(unlabeled_2016$F_MM_AICU) = num_lab("
                                          0 Non-Reporting 
                                          1 Reporting
                                          ") 

var_lab(unlabeled_2016$NO_MMORB) = "No Maternal Morbidity Checked"
val_lab(unlabeled_2016$NO_MMORB) = num_lab("
                                       1 True 
                                       0 False 
                                       9 Not Reported
                                          ") 

# Hospital / Payment 
var_lab(unlabeled_2016$ATTEND) = "Attendant"
val_lab(unlabeled_2016$ATTEND) = num_lab("
                                     1 Doctor of Medicine (MD) 
                                     2 Doctor of Osteopathy (DO)
                                     3 Certified Nurse Midwife (CNM)
                                     4 Other Midwife
                                     5 Other 
                                     9 Unknown or not stated
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(MTRAN = as.numeric(case_when(
  MTRAN == "Y" ~ "1",
  MTRAN == "N" ~ "0",
  MTRAN == "U" ~ "9")))
var_lab(unlabeled_2016$MTRAN) ="Mother Transferred"
val_lab(unlabeled_2016$MTRAN) = num_lab("
                                     0 No
                                     1 Yes 
                                     9 Unknown 
                                          ") 

var_lab(unlabeled_2016$PAY) = "Payment Source"
val_lab(unlabeled_2016$PAY) = num_lab("
                                  1 Medicaid 
                                  2 Private Insurance 
                                  3 Self-Pay 
                                  4 Indian Health Service
                                  5 CHAMPUS/TRICARE 
                                  6 Other Government (Federal, State, Local)
                                  8 Other 
                                  9 Unknown
                                          ") 

var_lab(unlabeled_2016$PAY_REC) = "Payment Recode" 
val_lab(unlabeled_2016$PAY_REC) = num_lab("
                                      1 Medicaid 
                                      2 Private Insurance 
                                      3 Self Pay 
                                      4 Other 
                                      9 Unknown
                                          ") 

var_lab(unlabeled_2016$F_PAY) = "Reporting Flag for Source of Payment"
val_lab(unlabeled_2016$F_PAY) = num_lab("
                                    0 Non-Reporting 
                                    1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_PAY_REC) = "Reporting Flag for Payment Recode"
val_lab(unlabeled_2016$F_PAY_REC) = num_lab("
                                    0 Non-Reporting 
                                    1 Reporting
                                          ") 


# APGAR5 
var_lab(unlabeled_2016$APGAR5) = "Five Minute APGAR Score"
val_lab(unlabeled_2016$APGAR5) = num_lab("
                                     99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$APGAR5R) = "Five Minute APGAR Recode" 
val_lab(unlabeled_2016$APGAR5R) = num_lab("
                                      1 A score of 0-3
                                      2 A score of 4-6 
                                      3 A score of 7-8
                                      4 A score of 9-10
                                      5 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_APGAR5) = "Reporting Flag for Five minute APGAR" 
val_lab(unlabeled_2016$F_APGAR5) = num_lab("
                                       0 Non-Reporting 
                                       1 Reporting 
                                          ") 

var_lab(unlabeled_2016$APGAR10) = "Ten Minute APGAR Score" # use reporting flag in field 126 for 2015 
val_lab(unlabeled_2016$APGAR10) = num_lab("
                                       88 Not applicable 
                                       99 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$APGAR10R) = "Ten Minute APGAR Score Recode" # use reporting flag in field 126 for 2015 
val_lab(unlabeled_2016$APGAR10R) = num_lab("
                                       1 A score of 0-3 
                                       2 A score of 4-6 
                                       3 A score of 7-8
                                       4 A score of 9-10 
                                       5 Not stated/not applicable
                                          ") 

# F_APGAR10 no observations 

# Plurality and Order 
var_lab(unlabeled_2016$DPLURAL) = "Plurality Recode"
val_lab(unlabeled_2016$DPLURAL) = num_lab("
                                       1 Single 
                                       2 Twin 
                                       3 Triplet 
                                       4 Quadruplet 
                                       5 Quintuplet or higher
                                          ") 

var_lab(unlabeled_2016$IMP_PLUR) = "Plurality Recode"
val_lab(unlabeled_2016$IMP_PLUR) = num_lab("
                                       1 Plurality is not imputed 
                                          ") # missing = imputed

var_lab(unlabeled_2016$SETORDER_R) = "Set Order Recode"
val_lab(unlabeled_2016$SETORDER_R) = num_lab("
                                         1 1st 
                                         2 2nd 
                                         3 3rd 
                                         4 4th 
                                         5 5th to 16th 
                                         9 Unknown or not stated
                                          ") 

# Sex 
unlabeled_2016 <- unlabeled_2016 %>% mutate(SEX = as.numeric(case_when(
  SEX == "M" ~ "1",
  SEX == "F" ~ "2")))
var_lab(unlabeled_2016$SEX) = "Sex of Infant"
val_lab(unlabeled_2016$SEX) = num_lab("
                                   1 Male 
                                   2 Female
                                          ") 

var_lab(unlabeled_2016$IMP_SEX) = "Imputed Sex" 
val_lab(unlabeled_2016$IMP_SEX) = num_lab("
                                      1 Infant Sex is Imputed 
                                          ") # missing = not imputed 

# Menses 
var_lab(unlabeled_2016$DLMP_MM) = "Last Normal Menses Month"
val_lab(unlabeled_2016$DLMP_MM) = num_lab("
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
                                          ") # missing = not imputed 

var_lab(unlabeled_2016$DLMP_YY) = "Last Normal Menses Year" 
val_lab(unlabeled_2016$DLMP_YY) = num_lab("
                                       9999 Unknown or not stated
                                          ") 

# Gestation 
var_lab(unlabeled_2016$COMBGST_IMP) = "Combined Gestation Imputed"
val_lab(unlabeled_2016$COMBGST_IMP) = num_lab("
                                       1 Combined Gestation is imputed 
                                          ") # missing = not imputed

var_lab(unlabeled_2016$OBGEST_FLG) = "Obstetric Estimate of Gestation Used Flag"
val_lab(unlabeled_2016$OBGEST_FLG) = num_lab("
                                         1 Clinical Estimate is used 
                                          ") # missing = not used

var_lab(unlabeled_2016$COMBGEST) ="Combined Gestation - Detail in Weeks"
val_lab(unlabeled_2016$COMBGEST) = num_lab("
                                        99 Unknown
                                          ") 

var_lab(unlabeled_2016$GESTREC10) = "Combined Gestation Recode 10"
val_lab(unlabeled_2016$GESTREC10) = num_lab("
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

var_lab(unlabeled_2016$GESTREC3) = "Combined Gestation Recode 3" 
val_lab(unlabeled_2016$GESTREC3) = num_lab("
                                       1 Under 37 weeks 
                                       2 37 weeks and over 
                                       3 Not stated
                                          ") 

var_lab(unlabeled_2016$LMPUSED) = "Computed (LMP) Gestation Used Flag"
val_lab(unlabeled_2016$LMPUSED) = num_lab("
                                      1 LMP used for gestation 
                                          ") # missing = not used 

var_lab(unlabeled_2016$OEGest_Comb) = "Obstetric Estimate Edited"
val_lab(unlabeled_2016$OEGest_Comb) = num_lab("
                                           99 Not stated
                                          ") 

var_lab(unlabeled_2016$OEGest_R10) = "Obstetric Estimate Recode 10"
val_lab(unlabeled_2016$OEGest_R10) = num_lab("
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

var_lab(unlabeled_2016$OEGest_R3) = "Obstetric Estimate Recode 3" 
val_lab(unlabeled_2016$OEGest_R3) = num_lab("
                                        1 Under 37 weeks 
                                        2 37 weeks and over 
                                        3 Not stated
                                          ") 

# Birth Weight 
var_lab(unlabeled_2016$DBWT) = "Birth Weight - Detail in Grams (Edited)"
val_lab(unlabeled_2016$DBWT) = num_lab("
                                   9999 Not stated birth weight
                                          ") 

var_lab(unlabeled_2016$BWTR12) = "Birth Weight Recode 12"
val_lab(unlabeled_2016$BWTR12) = num_lab("
                                     1 0227-0499 grams 
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

var_lab(unlabeled_2016$BWTR4) = "Birth Weight Recode 4" 
val_lab(unlabeled_2016$BWTR4) = num_lab("
                                    1 0227 - 1499 grams
                                    2 1500-2499 grams 
                                    3 2500-8165 grams 
                                    4 Unknown or not stated
                                          ") 

# Abnormal Conditions of the Newborn 
unlabeled_2016 <- unlabeled_2016 %>% mutate(AB_AVEN1 = as.numeric(case_when(
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
    AB_SEIZ == "U" ~ "9")))

var_lab(unlabeled_2016$AB_AVEN1) = "Assisted Ventilation"
val_lab(unlabeled_2016$AB_AVEN1) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$AB_AVEN6) = "Assisted Ventilation > 6 hrs"
val_lab(unlabeled_2016$AB_AVEN6) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$AB_NICU) = "Admission to NICU"
val_lab(unlabeled_2016$AB_NICU) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$AB_SURF) = "Surfactant"
val_lab(unlabeled_2016$AB_SURF) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$AB_ANTI) = "Antibiotics"
val_lab(unlabeled_2016$AB_ANTI) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$AB_SEIZ) = "Seizures"
val_lab(unlabeled_2016$AB_SEIZ) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_AB_VENT) = "Reporting Flag for Assisted Ventilation" 
val_lab(unlabeled_2016$F_AB_VENT) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_AB_VENT6) = "Reporting Flag for Assisted Ventilation > 6 hours"
val_lab(unlabeled_2016$F_AB_VENT6) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_AB_NICU) = "Reporting Flag for Admission to NICU" # typo in codebook F_AB_NIUC
val_lab(unlabeled_2016$F_AB_NICU) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_AB_SURFAC) = "Reporting Flag for Surfactant"
val_lab(unlabeled_2016$F_AB_SURFAC) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_AB_ANTIBIO) = "Reporting Flag for Antibiotics"
val_lab(unlabeled_2016$F_AB_ANTIBIO) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_AB_SEIZ) = "Reporting Flag for Seizures"
val_lab(unlabeled_2016$F_AB_SEIZ) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$NO_ABNORM) = "No Abnormal Conditions Checked" 
val_lab(unlabeled_2016$NO_ABNORM) = num_lab("
                                        1 True 
                                        0 False 
                                        9 Not Reported
                                          ") 

# Congenital Anomalies of the Newborn 
unlabeled_2016 <- unlabeled_2016 %>% mutate(CA_ANEN = as.numeric(case_when(
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
    CA_GAST == "U" ~ "9")))

var_lab(unlabeled_2016$CA_ANEN) = "Anencephaly"
val_lab(unlabeled_2016$CA_ANEN) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_MNSB) = "Meningomyelocele / Spina Bifida"
val_lab(unlabeled_2016$CA_MNSB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_CCHD) = "Cyanotic Congenital Heart Disease"
val_lab(unlabeled_2016$CA_CCHD) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_CDH) = "Congenital Diaphragmatic Hernia"
val_lab(unlabeled_2016$CA_CDH) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_OMPH) = "Omphalocele"
val_lab(unlabeled_2016$CA_OMPH) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_GAST) = "Gastroschisis"
val_lab(unlabeled_2016$CA_GAST) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_CA_ANEN) = "Reporting Flag for Anencephaly"
val_lab(unlabeled_2016$F_CA_ANEN) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_MENIN) = "Reporting Flag for Meningomyelocele/Spina Bifida"
val_lab(unlabeled_2016$F_CA_MENIN) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_HEART) = "Reporting Flag for Cyanotic Congenital Heart Disease"
val_lab(unlabeled_2016$F_CA_HEART) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_HERNIA) = "Reporting Flag for Congenital Diaphragmatic Hernia"
val_lab(unlabeled_2016$F_CA_HERNIA) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_OMPHA) = "Reporting Flag for Omphalocele"
val_lab(unlabeled_2016$F_CA_OMPHA) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_GASTRO) = "Reporting Flag for Gastroschisis"
val_lab(unlabeled_2016$F_CA_GASTRO) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(CA_LIMB = as.numeric(case_when(
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

var_lab(unlabeled_2016$CA_LIMB) = "Limb Reduction Defect"
val_lab(unlabeled_2016$CA_LIMB) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_CLEFT) = "Cleft Lip w/ or w/o Cleft Palate"
val_lab(unlabeled_2016$CA_CLEFT) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$CA_CLPAL) = "Cleft Palate alone"
val_lab(unlabeled_2016$CA_CLPAL) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(CA_DOWN = as.numeric(case_when(
  CA_DOWN == "C" ~ "1",
  CA_DOWN == "P" ~ "2",
  CA_DOWN == "N" ~ "0",
  CA_DOWN == "U" ~ "9")),
  CA_DISOR = as.numeric(case_when(
    CA_DISOR == "C" ~ "1",
    CA_DISOR == "P" ~ "2",
    CA_DISOR == "N" ~ "0",
    CA_DISOR == "U" ~ "9")))

var_lab(unlabeled_2016$CA_DOWN) = "Down Syndrome" 
val_lab(unlabeled_2016$CA_DOWN) = num_lab("
                                       0 No 
                                       1 Confirmed 
                                       2 Pending 
                                       9 Unknown
                                          ") 

var_lab(unlabeled_2016$CA_DISOR) = "Suspected Chromosomal Disorder"
val_lab(unlabeled_2016$CA_DISOR) = num_lab("
                                       0 No 
                                       1 Confirmed 
                                       2 Pending 
                                       9 Unknown
                                          ") 

unlabeled_2016 <- unlabeled_2016 %>% mutate(CA_HYPO = as.numeric(case_when(
  CA_HYPO == "Y" ~ "1",
  CA_HYPO == "N" ~ "0",
  CA_HYPO == "U" ~ "9")))
var_lab(unlabeled_2016$CA_HYPO) = "Hypospadias"
val_lab(unlabeled_2016$CA_HYPO) = num_lab("
                                      0 No, anomaly not reported 
                                      1 Yes, anomaly reported
                                      9 Unknown
                                          ") 

var_lab(unlabeled_2016$F_CA_LIMB) = "Reporting Flag for Limb Reduction Defect"
val_lab(unlabeled_2016$F_CA_LIMB) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_CLEFTLP) = "Reporting Flag for Cleft Lip with or without Cleft Palate"
val_lab(unlabeled_2016$F_CA_CLEFTLP) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_CLEFT) = "Reporting Flag for Cleft Plate Alone"
val_lab(unlabeled_2016$F_CA_CLEFT) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_DOWNS) = "Reporting Flag for Down Syndrome"
val_lab(unlabeled_2016$F_CA_DOWNS) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_CHROM) = "Reporting Flag for Suspected Chromosomal Disorder"
val_lab(unlabeled_2016$F_CA_CHROM) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$F_CA_HYPOS) = "Reporting Flag for Hypospadias"
val_lab(unlabeled_2016$F_CA_HYPOS) = num_lab("
                                        0 Non-Reporting 
                                        1 Reporting
                                          ") 

var_lab(unlabeled_2016$NO_CONGEN) = "No Congenital Anomalies Checked" 
val_lab(unlabeled_2016$NO_CONGEN) = num_lab("
                                        1 True 
                                        0 False 
                                        9 Not Reported
                                          ") 

# Infant 
unlabeled_2016 <- unlabeled_2016 %>% mutate(ITRAN = as.numeric(case_when(
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

var_lab(unlabeled_2016$ITRAN) = "Infant Transferred"
val_lab(unlabeled_2016$ITRAN) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$ILIVE) = "Infant Living at Time of Report"
val_lab(unlabeled_2016$ILIVE) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$BFED) = "Infant Being Breastfed"
val_lab(unlabeled_2016$BFED) = num_lab("
                                       0 No 
                                       1 Yes 
                                       9 Unknown or not stated
                                          ") 

var_lab(unlabeled_2016$F_BFED) = "Reporting Flag for Breastfed at Discharge"
val_lab(unlabeled_2016$F_BFED) = num_lab("
                                      0 Non-Reporting
                                      1 Reporting
                                          ") 

# Mother's Race Edited (checked MRACE1E MRACE8E) - no observations 
# Father's Race Edited (checked FRACE1E FRACE8E) - no observations 

# Historic File Temporary re-additions  (uBFacil - uCA_Down) - no observations

# Save Data
# The following line should contain the path to your output '.Rdata' (labeled) file ;

labeled_2016 <- unlabeled_2016
save(labeled_2016, file = "FILEPATH/RestrictedVitalStatistics_Natality_2016_Labeled.RData")

