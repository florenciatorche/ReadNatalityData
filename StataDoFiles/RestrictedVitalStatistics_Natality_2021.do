clear all 
capture log close
set more off

** -----------------------------------------------; 
** This program reads the 2021 Restricted-Use  
** NCHS Natality Data File 
** by Hye Jee Kim, hyejk@stanford.edu,  Fri Sept 8 2023
** Please report errors to hyejk@stanford.edu
** -----------------------------------------------;

** The following line should contain
** the complete path of the working directory
** On a PC, use backslashes in paths as in C:\  ;

cd "FILEPATH" 
log using RestrictedVitalStatistics_Natality_2021.log, replace 

** Reading in File **  

infix str DOB_YY 9-12 str DOB_MM 13-14 str DOB_TT 19-22 str DOB_WK 23 /// 
      str OCTERR 24-25 str XOSTATE 26-27 str OCNTYFIPS 28-30 str OCNTYPOP 31 ///
      str BFACIL 32 str F_FACILITY 33 str BFACIL3 50 ///
	  str MAGE_IMPFLG 73 str MAGE_REPFLG 74 str MAGER 75-76 ///  
	  str MAGER14 77-78 str MAGER9 79 ///
      str MBCNTRY 80-81 str MBSTATE 82-83 str MBSTATE_REC 84 /// 
	  str MRCNTRY 85-86 str XMRSTATE 87-88 str MRTERR 89-90 ///
      str RCNTY 91-93 str MRCITYFIPS 94-98 ///  
	  str RCNTY_POP 99 str RCITY_POP 100 ///
	  str CITYLIM 101 str F_LIMIT 102 /// 
	  str RECTYPE 103 str RESTATUS 104 /// 
	  str MRACE31 105-106 str MRACE6 107 str MRACE15 108-109 str MRACEIMP 111 ///
	  str MHISPX 112 /// // MHISPX not in 2019 .do file
      str MHISP_R 115 str F_MHISP 116 str MRACEHISP 117 ///
	  str MAR_P 119 str DMAR 120 str MAR_IMP 121 str F_MAR_P 123 ///
      str MEDUC 124 str F_MEDUC 126 ///  
	  str FAGERPT_FLG 142 str FAGECOMB 147-148 str FAGEREC11 149-150 /// 
      str FRACE31 151-152 str FRACE6 153 str FRACE15 154-155 ///
	  str FHISPX 159 /// // FHISPX not in 2019 
      str FHISP_R 160 str F_FHISP 161 str FRACEHISP 162 /// 
 	  str FEDUC 163 str F_FEDUC 165 ///
	  str PRIORLIVE 171-172 str PRIORDEAD 173-174 str PRIORTERM 175-176 ///  
      str LBO_REC 179 str TBO_REC 182 ///
	  str ILLB_R 198-200 str ILLB_R11 201-202 ///
	  str ILOP_R 206-208 str ILOP_R11 209-210 ///
	  str ILP_R 214-216 str ILP_R11 217-218 ///
	  str PRECARE 224-225 str F_MPCB 226 str PRECARE5 227 ///
	  str PREVIS 238-239 str PREVIS_REC 242-243 str F_TPCV 244 /// 
	  str WIC 251 str F_WIC 252 ///
	  str CIG_0 253-254 str CIG_1 255-256 str CIG_2 257-258 str CIG_3 259-260 ///  
	  str CIG0_R 261 str CIG1_R 262 str CIG2_R 263 str CIG3_R 264 ///
	  str F_CIGS_0 265 str F_CIGS_1 266 str F_CIGS_2 267 str F_CIGS_3 268 /// 
	  str CIG_REC 269 str F_TOBACO 270 ///
	  str M_Ht_In 280-281 str F_M_HT 282 str BMI 283-286 str BMI_R 287 /// 
	  str PWgt_R 292-294 str F_PWGT 295 str DWgt_R 299-301 str F_DWGT 303 ///
	  str WTGAIN 304-305 str WTGAIN_REC 306 str F_WTGAIN 307 ///
	  str RF_PDIAB 313 str RF_GDIAB 314 str RF_PHYPE 315 str RF_GHYPE 316 ///  
	  str RF_EHYPE 317 str RF_PPTERM 318 ///
	  str F_RF_PDIAB 319 str F_RF_GDIAB 320 str F_RF_PHYPER 321 ///
	  str F_RF_GHYPER 322 str F_RF_ECLAMP 323 str F_RF_PPB 324 ///
	  str RF_INFTR 325 str RF_FEDRG 326 str RF_ARTEC 327 ///
	  str F_RF_INFT 328 str F_RF_INF_DRG 329 str F_RF_INF_ART 330 ///
	  str RF_CESAR 331 str RF_CESARN 332-333 ///
	  str F_RF_CESAR 335 str F_RF_NCESAR 336 ///
	  str NO_RISKS 337 ///
	  str IP_GON 343 str IP_SYPH 344 str IP_CHLAM 345 str IP_HEPB 346 ///  
	  str IP_HEPC 347 ///
	  str F_IP_GONOR 348 str F_IP_SYPH 349 str F_IP_CHLAM 350 str F_IP_HEPATB 351 ///
	  str F_IP_HEPATC 352 str NO_INFEC 353 /// 
	  str OB_ECVS 360 str OB_ECVF 361 str F_OB_SUCC 363 str F_OB_FAIL 364 ///
	  str LD_INDL 383 str LD_AUGM 384 str LD_STER 385 str LD_ANTB 386 ///
	  str LD_CHOR 387 str LD_ANES 388 /// 
	  str F_LD_INDL 389 str F_LD_AUGM 390 str F_LD_STER 391 str F_LD_ANTB 392 ///
	  str F_LD_CHOR 393 str F_LD_ANES 394 str NO_LBRDLV 395 ///
	  str ME_PRES 401 str ME_ROUT 402 str ME_TRIAL 403 ///
	  str F_ME_PRES 404 str F_ME_ROUT 405 str F_ME_TRIAL 406 ///
	  str RDMETH_REC 407 str DMETH_REC 408 str F_DMETH_REC 409 ///
	  str MM_MTR 415 str MM_PLAC 416 str MM_RUPT 417 str MM_UHYST 418 ///  
	  str MM_AICU 419 ///
	  str F_MM_MTR 421 str F_MM_PLAC 422 str F_MM_RUPT 423 str F_MM_UHYST 424 /// 
	  str F_MM_AICU 425 str NO_MMORB 427 ///
	  str ATTEND 433 str MTRAN 434 str PAY 435 str PAY_REC 436 ///
	  str F_PAY 437 str F_PAY_REC 438 ///
	  str APGAR5 444-445 str APGAR5R 446 str F_APGAR5 447 str APGAR10 448-449 ///
	  str APGAR10R 450 /// 
	  str DPLURAL 454 str IMP_PLUR 456 str SETORDER_R 459 ///  
	  str SEX 475 str IMP_SEX 476 ///
	  str DLMP_MM 477-478 str DLMP_YY 481-484 ///
	  str COMPGST_IMP 488 str OBGEST_FLG 489 str COMBGEST 490-491 ///
	  str GESTREC10 492-493 str GESTREC3 494 str LMPUSED 498 ///
	  str OEGest_Comb 499-500 str OEGest_R10 501-502 str OEGest_R3 503 ///
	  str DBWT 504-507 str BWTR12 509-510 str BWTR4 511 ///
	  str AB_AVEN1 517 str AB_AVEN6 518 str AB_NICU 519 str AB_SURF 520 ///  
	  str AB_ANTI 521 str AB_SEIZ 522 ///
	  str F_AB_VENT 524 str F_AB_VENT6 525 str F_AB_NICU 526 str F_AB_SURFAC 527 ///
	  str F_AB_ANTIBIO 528 str F_AB_SEIZ 529 str NO_ABNORM 531 ///
	  str CA_ANEN 537 str CA_MNSB 538 str CA_CCHD 539 str CA_CDH 540 ///
	  str CA_OMPH 541 str CA_GAST 542 ///
	  str F_CA_ANEN 543 str F_CA_MENIN  544 str F_CA_HEART 545 str F_CA_HERNIA 546 ///
	  str F_CA_OMPHA 547 str F_CA_GASTRO 548 ///
	  str CA_LIMB 549 str CA_CLEFT 550 str CA_CLPAL 551 str CA_DOWN 552 /// 
	  str CA_DISOR 553 str CA_HYPO 554 /// 
	  str F_CA_LIMB 555 str F_CA_CLEFTLP 556 str F_CA_CLEFT 557 str F_CA_DOWNS 558 ///
	  str F_CA_CHROM 559 str F_CA_HYPOS 560 str NO_CONGEN 561 ///
	  str ITRAN 567 str ILIVE 568 ///  
	  str BFED 569 str F_BFED 570 ///
	  using "FILEPATH/nat2021us.AllCnty.txt" 

** The above line should contain
** the complete path and name of the raw data file.
	  
** The following line should contain the path to your output '.dta' (unlabeled) file ;

save "FILEPATH/RestrictedVitalStatistics_Natality_2021.dta", replace
destring, replace

** The lines below do NOT need to be changed, save for the final line;

** Creating Variable Labels ** 

// Birth Date Variables 

lab var DOB_YY "Birth Year"

lab var DOB_MM "Birth Month"
lab def DOB_MM1 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" ///
                7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December" 
lab val DOB_MM DOB_MM1
tab DOB_MM, mi

lab var DOB_TT "Time of Birth"
lab def DOB_TT1 9999 "Not Stated"
lab val DOB_TT DOB_TT1 
tab DOB_TT, mi

lab var DOB_WK "Birth Day of Week"
lab def DOB_WK1 1 "Sunday" 2 "Monday" 3 "Tuesday" 4 "Wednesday" 5 "Thursday" ///
                6 "Friday" 7 "Saturday"  
lab val DOB_WK DOB_WK1
tab DOB_WK, mi	

// Geography

// OCTERR - variable in same position in 2019 called OSTATE 
// (relabeling variable to reflect that states are clearly included in this)
lab var OCTERR "Mother's Occurrence State or Territory/Possession"
tab OCTERR, mi

// XOSTATE - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook 
lab var XOSTATE "Expanded Occurrence State (NY = NY not including NYC, YC = NYC)"
tab XOSTATE, mi

lab var OCNTYFIPS "Occurrence FIPS County"
lab def OCNTYFIPS1 021 "Bayamón" 025 "Caguas" 031 "Carolina" 097 "Mayaguez" 113 "Ponce" ///
		           127 "San Juan" 000 "No county level geography"
lab val OCNTYFIPS OCNTYFIPS1
tab OCNTYFIPS, mi

lab var OCNTYPOP "Occurrence County Pop"
lab def OCNTYPOP1 0 "County of 1,000,000 or more" ///
                  1 "County of 500,000 to 1,000,000" ///
				  2 "County of 250,000 to 500,000" ///
				  3 "County of 100,000 to 250,000" ///
				  4 "County of 50,000 to 100,000" ///
				  5 "County of 25,000 to 50,000" ///
				  6 "County of 10,000 to 25,000" ///
				  9 "County less than 10,000" 
lab val OCNTYPOP OCNTYPOP1
tab OCNTYPOP, mi

// Birth Place 

lab var BFACIL "Birth Place"
lab def BFACIL1 1 "Hospital" 2 "Freestanding Birthing Center" 3 "Home (intended)" ///
                4 "Home (not intended)" 5 "Home (unknown if intended)" ///
				6 "Clinic / Doctor's Office" 7 "Other" 9 "Unknown" 
lab val BFACIL BFACIL1
tab BFACIL, mi 	  
	  
lab var F_FACILITY "Reporting Flag for Birth Place" 
lab def F_FACILITY1 0 "Non-Reporting" 1 "Reporting"
lab val F_FACILITY F_FACILITY1
tab F_FACILITY, mi 
	  
lab var BFACIL3 "Birth Place Recode"
lab def BFACIL31 1 "In Hospital" 2 "Not in Hospital" 3 "Unknown or Not Stated"
lab val BFACIL3 BFACIL31 
tab BFACIL3, mi 	 

// Mother's Age 

lab var MAGE_IMPFLG "Mother's Age Imputed"
lab def MAGE_IMPFLG1 1 "Age imputed" // missing = age not imputed 
lab val MAGE_IMPFLG MAGE_IMPFLG1 
tab MAGE_IMPFLG, mi 

lab var MAGE_REPFLG "Reported Age of Mother Used Flag"
lab def MAGE_REPFLG1 1 "Reported age used" // missing = reported age not used
lab val MAGE_REPFLG MAGE_REPFLG1 
tab MAGE_REPFLG, mi

lab var MAGER "Mother's Single Years of Age"
lab def MAGER1 12 "10-12" 50 "50 years and over"
lab val MAGER MAGER1 
tab MAGER, mi 	   
	   
lab var MAGER14 "Mother's Age Recode 14" 
lab def MAGER141 1 "Under 15 Years" 3 "15 years" 04 "16 years" 05 "17 years" ///
                 6 "18 years" 7 "19 years" 8 "20-24 years" 9 "25-29 years" ///
				 10 "30-34 years" 11 "35-39 years" 12 "40-44 years" 13 "45-49 years" /// 
				 14 "50-54 years" 
lab val MAGER14 MAGER141 
tab MAGER14, mi 
	   
lab var MAGER9 "Mother's Age Recode 9"
lab def MAGER91 1 "Under 15 years" 2 "15-19 years" 3 "20-24 years" 4 "25-29 years" ///
               5 "30-34 years" 6 "35-39 years" 7 "40-44 years" 8 "45-49 years" ///
			   9 "50-54 years"
lab val MAGER9 MAGER91
tab MAGER9, mi
	   
// Mother's Birth Place Geography 	 
  
lab var MBCNTRY "Mother's Birth Country" 
tab MBCNTRY, mi

// MBSTATE - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook 
lab var MBSTATE "Mother's Postal Birth State (Revised)"
tab MBSTATE, mi 

lab var MBSTATE_REC "Mother's Nativity"
lab def MBSTATE_REC1 1 "Born in the U.S. (50 US States)" 2 "Born outside the U.S. (includes possessions)" ///
                     3 "Unknown or Not Stated"
lab val MBSTATE_REC MBSTATE_REC1 
tab MBSTATE_REC, mi	
	 
// Mother Residence Geography 

lab var MRCNTRY "Mother's Residence Country"
tab MRCNTRY, mi 

// XMRSTATE - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook 
lab var XMRSTATE "Expanded State of Residence of Mother"
tab XMRSTATE, mi 
	  	  
// MRTERR - variable in same position in 2019 called MRSTATEPSTL 
// (relabeling variable to reflect that states are clearly included in this)	  
lab var MRTERR "Mother's Residence State or Territory/Possession"
tab MRTERR, mi 
	  
// RCNTY - variable in same position in 2019 is MRCNTYFIPS
lab var RCNTY "Residence FIPS County"
// 000, 999 = Other Outlying Areas of the US; All other labels = Puerto Rico
lab def RCNTY1 000 "No county level geography" 021 "Bayamón" 025 "Caguas" ///
               031 "Carolina" 097 "Mayaguez" 113 "Ponce" ///
		       127 "San Juan" 999 "County of less than 100,000"
lab val RCNTY RCNTY1
tab RCNTY, mi
	
// MRCITYFIPS - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook   
lab var MRCITYFIPS "Mother's Residence City FIPS Place" 
lab def MRCITYFIPS1 99999  "Foreign"
lab val MRCITYFIPS MRCITYFIPS1 
tab MRCITYFIPS, mi  

lab var RCNTY_POP "Population of Residence County"
replace RCNTY_POP = "999" if RCNTY_POP == "Z"
destring RCNTY_POP, replace
lab define RCNTY_POP1  0 "County of 1,000,000 or more" ///
                       1 "County of 500,000 to 1,000,000" ///
				       2 "County of 250,000 to 500,000" ///
				       3 "County of 100,000 to 250,000" ///
				       4 "County of 50,000 to 100,000" ///
				       5 "County of 25,000 to 50,000" ///
				       6 "County of 10,000 to 25,000" ///
				       9 "County less than 10,000" ///
					   999 "Foreign resident"
lab val RCNTY_POP RCNTY_POP1 
tab RCNTY_POP, mi

lab var RCITY_POP "Population of Residence City" 
replace RCITY_POP = "999" if RCITY_POP == "Z"
destring RCITY_POP, replace 
lab define RCITY_POP1  0 "City of 1,000,000 or more" ///
                       1 "City of 500,000 to 1,000,000" ///
				       2 "City of 250,000 to 500,000" ///
				       3 "City of 100,000 to 250,000" ///
				       4 "City of 50,000 to 100,000" ///
				       5 "City of 25,000 to 50,000" ///
				       6 "City of 10,000 to 25,000" ///
				       9 "All other areas in the US" ///
					   999 "Foreign resident" 
lab val RCITY_POP RCITY_POP1
tab RCITY_POP, mi 	
	 
// CITYLIM - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook 
lab var CITYLIM "Insider City Limits"
replace CITYLIM = "1" if CITYLIM == "Y"	
replace CITYLIM = "0" if CITYLIM == "N"	
replace CITYLIM = "9" if CITYLIM == "U"	
destring CITYLIM, replace 	
lab define CITYLIM1 0 "No" 1 "Yes" 9 "Unknown or not stated"	
lab val CITYLIM CITYLIM1
tab CITYLIM, mi	

// F_LIMIT - in 2019, not in 2021 codebook 
// Variable clearly exists and is the same, though, so using 2019 codebook 
lab var F_LIMIT	 "Reporting Flag for City Limits"
lab def F_LIMIT1 0 "Non-Reporting" 1 "Reporting"
lab val F_LIMIT F_LIMIT1
tab F_LIMIT, mi

lab var RECTYPE "Record Type"
lab def RECTYPE1 1 "Resident: Territory and county of occurrence and resident are the same" /// 
                 2 "Nonresident: Territory and county of occurrence and residence are different"
lab val RECTYPE RECTYPE1
tab RECTYPE, mi

lab var RESTATUS "Residence Status" 
// same numbers = different labels for US and US territories (US / US territory)
lab def RESTATUS1 1 "Resident" 2 "Intrastate/Intraterritory Nonresident" ///
		          3 "Interstate/Interterritory Resident" 4 "Foreign Resident"
// typo in codebook "Interterritory Resident" should be "Interterritory Nonresident"				 
lab val RESTATUS RESTATUS1 
tab RESTATUS, mi

// Mother Race 

lab var MRACE31 "Mother's Race Recode 31"
lab def MRACE311 1 "White (only) [only one race reported]" 2 "Black (only)" ///
	             3 "AIAN (American Indian or Alaskan Native) (only)" ///
				 4 "Asian (only)" 5 "NHOPI (Native Hawaiian or Other Pacific Islander) (only)" ///
		         6 "Black and White" 7 "Black and AIAN" 8 "Black and Asian" ///
		         9 "Black and NHOPI"  10 "AIAN and White" 11 "AIAN and Asian" ///
		         12 "AIAN and NHOPI" 13 "Asian and White" 14 "Asian and NHOPI" ///
		         15 "NHOPI and White" 16 "Black, AIAN, and White" ///
		         17 "Black, AIAN, and Asian" 18 "Black, AIAN, and NHOPI" ///
		         19 "Black, Asian, and White" 20 "Black, Asian, and NHOPI" /// 
		         21 "Black, NHOPI, and White" 22 "AIAN, Asian, and White" ///
		         23 "AIAN, NHOPI, and White" 24 "AIAN, Asian, and NHOPI" ///
		         25 "Asian, NHOPI, and White" 26 "Black, AIAN, Asian, and White" ///
		         27 "Black, AIAN, Asian, and NHOPI" 28 "Black, AIAN, NHOPI, and White" ///
		         29 "Black, Asian, NHOPI, and White" 30 "AIAN, Asian, NHOPI, and White" ///
		         31 "Black, AIAN, Asian, NHOPI, and White"
lab val MRACE31 MRACE311
tab MRACE31, mi
	 
lab var MRACE6 "Mother's Race Recode 6"  
lab def MRACE61 1 "White (only)" 2 "Black (only)" 3 "AIAN (only)" ///
                4 "Asian (only)" 5 "NHOPI (only)" 6 "More than one race" 
lab val MRACE6 MRACE61 
tab MRACE6, mi
	 
lab var MRACE15 "Mother's Race Recode 15" 
lab def MRACE151 1 "White (only)" 2 "Black (only) " 3 "AIAN (only)" ///
                 4 "Asian Indian (only)" 5 "Chinese (only)" 6 "Filipino (only)" ///
				 7 "Japanese (only)" 8 "Korean (only)" 9 "Vietnamese (only)" ///
				 10 "Other Asian (only)" 11 "Hawaiian (only)" 12 "Guamanian (only)" ///
				 13 "Samoan (only)" 14 "Other Pacific Islander (only)" ///
				 15 "More than one race" 
lab val MRACE15 MRACE151 
tab MRACE15, mi		 

lab var MRACEIMP "Mother's Race Imputed"
// missing = Mother's race not imputed 
lab def MRACEIMP1 1 "Unknown race imputed" 2 "All other races, formerly coded 09, imputed"
lab val MRACEIMP MRACEIMP1
tab MRACEIMP, mi

// Mother Hispanic Origin 

lab var MHISPX "Mother's Hispanic Origin" 
lab def MHISPX1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				4 "Central and South American" 5 "Dominican" ///
				6 "Other and Unknown Hispanic origin" ///
				9 "Origin unknown or not stated	"
lab val MHISPX MHISPX1
tab MHISPX, mi				
				
lab var MHISP_R "Mother's Hispanic Origin Recode" 
lab def MHISP_R1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
                 4 "Central and South American" 5 "Other and Unknown Hispanic origin" ///
				 9 "Hispanic origin not stated"
lab val MHISP_R	MHISP_R1 
tab MHISP_R, mi

lab var F_MHISP "Reporting Flag for Mother's Origin"
lab def F_MHISP1 0 "Non-Reporting" 1 "Reporting"
lab val F_MHISP F_MHISP1 
tab F_MHISP, mi

lab var MRACEHISP "Mother's Race/Hispanic Origin" 
lab def MRACEHISP1 1 "Non-Hispanic White (only)" 2 "Non-Hispanic Black (only)" ///
                   3 "Non-Hispanic AIAN (only)" 4 "Non-Hispanic Asian (only)" ///
				   5 "Non-Hispanic NHOPI (only)" 6 "Non-Hispanic more than one race" ///
				   7 "Hispanic" 8 "Origin unknown or not stated"
lab val MRACEHISP MRACEHISP1	
tab MRACEHISP, mi

// Mother Marital Status / Paternity 

lab var MAR_P "Paternity Acknowledged"
replace MAR_P = "1" if MAR_P == "Y"	
replace MAR_P = "0" if MAR_P == "N"	
replace MAR_P = "2" if MAR_P == "U"	
replace MAR_P = "9" if MAR_P == "X"	
destring MAR_P, replace 
lab def MAR_P1 0 "No" 1 "Yes" 2 "Unknown" 9 "Not Applicable"
lab val MAR_P MAR_P1 
tab MAR_P, mi

lab var DMAR "Marital Status" 
// variable labels different for US and all Outlying Areas of the United States except Puerto Rico
// and for Puerto Rico (1 = same, 2 = US / PR, >=3 = just PR)
lab define DMAR1 1 "Married" 2 "Unmarried/Unmarried parents living together" ///
                 3 "Unmarrried parents not living together" 9 "Unknown or not stated"
lab val DMAR DMAR1 
tab DMAR, mi

lab var MAR_IMP "Mother's Marital Status Imputed" 
lab def MAR_IMP1 1 "Marital Status imputed" // missing = not imputed 
lab val MAR_IMP MAR_IMP1 	
tab MAR_IMP, mi	

lab var F_MAR_P "Reporting Flag for Paternity Acknowledged" 
lab define F_MAR_P1 0 "Non-Reporting" 1 "Reporting" 	
lab val F_MAR_P F_MAR_P1
tab F_MAR_P, mi	

// Mother's Education

lab var MEDUC "Mother's Education"
lab def MEDUC1 1 "8th grade or less" 2 "9th through 12th grade with no diploma" ///
               3 "High school graduate or GED completed" ///
			   4 "Some college credit, but not a degree" ///
			   5 "Associate degree (AA, AS)" ///
			   6 "Bachelor's degree (BA, AB, BS)" ///
			   7 "Master's degree (MA, MS, MEng, MEd, MSW, MBA)" ///
			   8 "Doctorate (PHD, EdD) or Professional Degree (MD, DDS, DVM, LLB, JD)" ///
			   9 "Unknown" 
lab val MEDUC MEDUC1	
tab MEDUC, mi	

lab var F_MEDUC "Reporting Flag for Education of Mother"
lab def F_MEDUC1 0 "Non-Reporting" 1 "Reporting" 
lab val F_MEDUC F_MEDUC1 
tab F_MEDUC, mi  

// Father's Age

lab var FAGERPT_FLG "Father's Reported Age Used" 
lab def FAGERPT_FLG1 1 "Father's reported age used" // missing = Father's reported age not used 
lab val FAGERPT_FLG FAGERPT_FLG1
tab FAGERPT_FLG, mi 

lab var FAGECOMB "Father's Combined Age" // in years
lab def FAGECOMB1 99 "Unknown or not stated"
lab val FAGECOMB FAGECOMB1
tab FAGECOMB, mi 

lab var FAGEREC11 "Father's Age Recode 11" 
lab def FAGEREC111 1 "Under 15 years" 2 "15-19 years" 3 "20-24 years" 4 "25-29 years" ///
                   5 "30-34 years" 6 "35-39 years" 7 "40-44 years" 8 "45-49 years" ///
				   9 "50-54 years" 10 "55-98 years" 11 "Not stated"
lab val FAGEREC11 FAGEREC111
tab FAGEREC11, mi 	  
	  
// Father's Race	 
 
lab var	FRACE31 "Father's Race Recode 31" 
lab def FRACE311 1 "White (only) [only one race reported]" 2 "Black (only)" ///
	             3 "AIAN (American Indian or Alaskan Native) (only)" ///
				 4 "Asian (only)" 5 "NHOPI (Native Hawaiian or Other Pacific Islander) (only)" ///
		         6 "Black and White" 7 "Black and AIAN" 8 "Black and Asian" ///
		         9 "Black and NHOPI"  10 "AIAN and White" 11 "AIAN and Asian" ///
		         12 "AIAN and NHOPI" 13 "Asian and White" 14 "Asian and NHOPI" ///
		         15 "NHOPI and White" 16 "Black, AIAN, and White" ///
		         17 "Black, AIAN, and Asian" 18 "Black, AIAN, and NHOPI" ///
		         19 "Black, Asian, and White" 20 "Black, Asian, and NHOPI" /// 
		         21 "Black, NHOPI, and White" 22 "AIAN, Asian, and White" ///
		         23 "AIAN, NHOPI, and White" 24 "AIAN, Asian, and NHOPI" ///
		         25 "Asian, NHOPI, and White" 26 "Black, AIAN, Asian, and White" ///
		         27 "Black, AIAN, Asian, and NHOPI" 28 "Black, AIAN, NHOPI, and White" ///
		         29 "Black, Asian, NHOPI, and White" 30 "AIAN, Asian, NHOPI, and White" ///
		         31 "Black, AIAN, Asian, NHOPI, and White" 99 "Unknown or Not Stated"
lab val FRACE31 FRACE311 
tab FRACE31, mi 
	  
lab var FRACE6 "Father's Race Recode 6" 
lab def FRACE61 1 "White (only)" 2 "Black (only)" 3 "AIAN (only)" ///
                4 "Asian (only)" 5 "NHOPI (only)" 6 "More than one race"  ///
				9 "Unknown or Not Stated" 		   
lab val FRACE6 FRACE61 		
tab FRACE6, mi 	
  
lab var FRACE15 "Father's Race Recode 15"
lab def FRACE151 1 "White (only)" 2 "Black (only) " 3 "AIAN (only)" ///
                 4 "Asian Indian (only)" 5 "Chinese (only)" 6 "Filipino (only)" ///
				 7 "Japanese (only)" 8 "Korean (only)" 9 "Vietnamese (only)" ///
				 10 "Other Asian (only)" 11 "Hawaiian (only)" 12 "Guamanian (only)" ///
				 13 "Samoan (only)" 14 "Other Pacific Islander (only)" ///
				 15 "More than one race" ///
				 99 "Unknown or Not Stated"
lab val FRACE15 FRACE151
tab FRACE15, mi	

// Father's Hispanic Origin 

lab var FHISPX "Father's Hispanic Origin" 
lab def FHISPX1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				4 "Central or South American" 5 "Dominican" 6 "Other and Unknown Hispanic" ///
				9 "Origin unknown or not stated"
lab val FHISPX FHISPX1
tab FHISPX, mi

lab var FHISP_R "Father's Hispanic Origin Recode"  
lab	def FHISP_R1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
                 4 "Central and South American" 5 "Other and Unknown Hispanic origin" ///
				 9 "Hispanic origin not stated"
lab val FHISP_R	FHISP_R1    
tab FHISP_R, mi	

lab var F_FHISP "Reporting Flag for Father's Origin"	
lab def F_FHISP1 0 "Non-Reporting" 1 "Reporting" 
lab val F_FHISP F_FHISP1 
tab F_FHISP, mi

lab var FRACEHISP "Father's Race/Hispanic Origin"  				   
lab define FRACEHISP1 1 "Non-Hispanic White (only)" 2 "Non-Hispanic Black (only)" ///
                      3 "Non-Hispanic AIAN (only)" 4 "Non-Hispanic Asian (only)" ///
				      5 "Non-Hispanic NHOPI (only)" 6 "Non-Hispanic more than one race" ///
				      7 "Hispanic" 8 "Origin unknown or not stated" ///
					  9 "Race unknown or not stated (Non-Hispanic)" 
lab val FRACEHISP FRACEHISP1 
tab FRACEHISP, mi

// Father's Education 

lab var FEDUC "Father's Education"
lab def FEDUC1 1 "8th grade or less" 2 "9th through 12th grade with no diploma" ///
               3 "High school graduate or GED completed" ///
			   4 "Some college credit, but not a degree" ///
			   5 "Associate degree (AA, AS)" ///
			   6 "Bachelor's degree (BA, AB, BS)" ///
			   7 "Master's degree (MA, MS, MEng, MEd, MSW, MBA)" ///
			   8 "Doctorate (PHD, EdD) or Professional Degree (MD, DDS, DVM, LLB, JD)" ///
			   9 "Unknown" 
lab val FEDUC FEDUC1
tab FEDUC, mi	  
	  
lab var F_FEDUC "Reporting Flag for Education of Father"
lab def F_FEDUC1 0 "Non-Reporting" 1 "Reporting" 
lab val F_FEDUC F_FEDUC1
tab F_FEDUC, mi 
	  
// Births

lab var PRIORLIVE "Prior Births Now Living"

lab var PRIORDEAD "Prior Births Now Dead"

lab var PRIORTERM "Prior Other Terminations"

foreach x of varlist PRIORLIVE PRIORDEAD PRIORTERM {
	lab def `x'1 99 "Unknown or not stated"
    lab val `x' `x'1
	tab `x', mi 
} 

lab var LBO_REC "Live Birth Order Recode"
lab def LBO_REC1 8 "8 or more live births" 9 "Unknown or not stated"
lab val LBO_REC LBO_REC1
tab LBO_REC, mi 

lab var TBO_REC "Total Birth Order Recode"
lab def TBO_REC1 8 "8 or more total births" 9 "Unknown or not stated"
lab val TBO_REC TBO_REC1
tab TBO_REC, mi 	  

// for ILLB_R - ILP_R11, codebook note: use reporting flag in field 126  
lab var ILLB_R "Interval of Last Live Birth Recode"
// 000-003 Plural delivery, 004-3000 months since last live birth
lab def ILLB_R1 888 "Not applicable / 1st live birth" 999 "Unknown or not stated" 
lab val ILLB_R ILLB_R1 
tab ILLB_R, mi
	  
lab var ILLB_R11 "Interval of Last Live Birth Recode 11" 
lab def ILLB_R111 0 "Zero to 3 months (plural delivery)" 1 "4 to 11 months" ///
                  2 "12 to 17 months" 3 "18 to 23 months" 4 "24 to 35 months" ///
				  5 "36 to 47 months" 6 "48 to 59 months" 7 "60 to 71 months" /// 
				  8 "72 months and over" 88 "Not applicable (1st live birth)" ///
				  99 "Unknown or not stated"
lab val ILLB_R11 ILLB_R111
tab ILLB_R11, mi

lab var ILOP_R "Interval of Last Other Pregnancy Recode" 
// 000-003 Plural delivery, 004-3000 months since last live birth
lab def ILOP_R1 888 "Not applicable / 1st natality event" 999 "Unknown or not stated" 
lab val ILOP_R ILOP_R1 
tab ILOP_R, mi

lab var ILOP_R11 "Interval of Last Other Pregnancy Recode 11" 
lab def ILOP_R111 0 "Zero to 3 months (plural delivery)" 1 "4 to 11 months" ///
                  2 "12 to 17 months" 3 "18 to 23 months" 4 "24 to 35 months" ///
				  5 "36 to 47 months" 6 "48 to 59 months" 7 "60 to 71 months" /// 
				  8 "72 months and over" 88 "Not applicable (1st natality event)" ///
				  99 "Unknown or not stated"
lab val ILOP_R11 ILOP_R111
tab ILOP_R11, mi

lab var ILP_R "Interval of Last Pregnancy Recode"
// 000-003 Plural delivery, 004-3000 months since last live birth
lab def ILP_R1 888 "Not applicable / no previous pregnancy" 999 "Unknown or not stated"
lab val ILP_R ILP_R1
tab ILP_R, mi

lab var ILP_R11 "Interval of Last Pregnancy Recode 11"
lab def ILP_R111  0 "Zero to 3 months (plural delivery)" 1 "4 to 11 months" ///
                  2 "12 to 17 months" 3 "18 to 23 months" 4 "24 to 35 months" ///
				  5 "36 to 47 months" 6 "48 to 59 months" 7 "60 to 71 months" /// 
				  8 "72 months and over" 88 "Not applicable (no previous pregnancy)" ///
				  99 "Unknown or not stated"
lab val ILP_R11	ILP_R111
tab ILP_R11, mi	 

// Prenatal Care

lab var PRECARE "Month Prenatal Care Began" 
lab def PRECARE1 0 "No prenatal care" 99 "Unknown or not stated"
lab val PRECARE PRECARE1
tab PRECARE, mi 
	  
lab var F_MPCB "Reporting Flag for Month Prenatal Care Began"
lab def F_MPCB1 0 "Non-Reporting" 1 "Reporting"
lab val F_MPCB F_MPCB1 
tab F_MPCB, mi	  
	  
lab var PRECARE5 "Month Prenatal Care Began Recode" 
lab def PRECARE51 1 "1st to 3rd month" 2 "4th to 6th month" 3 "7th to final month" ///
                  4 "No prenatal care" 5 "Unknown or not stated"
lab val PRECARE5 PRECARE51 
tab PRECARE5, mi
	  
lab var PREVIS "Number of Prenatal Visits" 
lab def PREVIS1 99 "Unknown or not stated"
lab val PREVIS PREVIS1 
tab PREVIS, mi   
	  
lab var PREVIS_REC "Number of Prenatal Visits Recode"
lab def PREVIS_REC1 1 "No visits" 2 "1 to 2 visits" 3 "3 to 4 visits" ///
                    4 "5 to 6 visits" 5 "7 to 8 visits" 6 "9 to 10 visits" ///
				    7 "11 to 12 visits" 8 "13 to 14 visits" 9 "15 to 16 visits" ///
				    10 "17 to 18 visits" 11 "19 or more visits" 12 "Unknown or not stated"
lab val PREVIS_REC PREVIS_REC1
tab PREVIS_REC, mi
	  
lab var F_TPCV "Reporting Flag for Total Prenatal Care Visits" 
lab def F_TPCV1 0 "Non-Reporting" 1 "Reporting"
lab val F_TPCV F_TPCV1 
tab F_TPCV, mi  	  
	  
// WIC	  

lab var WIC "WIC"
replace WIC = "1" if WIC == "Y"
replace WIC = "0" if WIC == "N"
replace WIC = "9" if WIC == "U"
destring WIC, replace 
lab def WIC1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val WIC WIC1
tab WIC, mi	  
	  
lab var F_WIC "Reporting Flag for WIC"
lab def F_WIC1 0 "Non-Reporting" 1 "Reporting"
lab val F_WIC F_WIC1
tab F_WIC, mi	  
	  
// Cigarette Use 

lab var CIG_0 "Cigarettes Before Pregnancy" 

lab var CIG_1 "Cigarettes 1st Trimester" 

lab var CIG_2 "Cigarettes 2nd Trimester" 

lab var CIG_3 "Cigarettes 3rd Trimester" 

foreach x of varlist CIG_0 CIG_1 CIG_2 CIG_3 {
	lab def `x'1 98 "98 or more cigarettes daily" 99 "Unknown or not stated"
	lab val `x' `x'1
	tab `x', mi
}	 	  
	  
lab var CIG0_R "Cigarettes Before Pregnancy Recode" 

lab var CIG1_R "Cigarettes 1st Trimester Recode" 

lab var CIG2_R "Cigarettes 2nd Trimester Recode" 

lab var CIG3_R "Cigarettes 3rd Trimester Recode" 

foreach x of varlist CIG0_R CIG1_R CIG2_R CIG3_R {
	lab def `x'1 0 "Nonsmoker" 1 "1-5" 2 "6-10" 3 "11-20" 4 "21-40" 5 "41 or more" ///
                 6 "Unknown or not stated"
	lab val `x' `x'1
	tab `x', mi
}
	  
lab var F_CIGS_0 "Reporting Flag for Cigarettes before Pregnancy" 

lab var F_CIGS_1 "Reporting Flag for Cigarettes 1st Trimester" 
			   
lab var F_CIGS_2 "Reporting Flag for Cigarettes 2nd Trimester" 
			   
lab var F_CIGS_3 "Reporting Flag for Cigarettes 3rd Trimester" 
			   
foreach x of varlist F_CIGS_0 F_CIGS_1 F_CIGS_2 F_CIGS_3 {
	lab def `x'1 0 "Non-Reporting" 1 "Reporting"
	lab val `x' `x'1
	tab `x', mi
}
			  	  
lab var CIG_REC "Cigarette Recode"
replace CIG_REC = "1" if CIG_REC == "Y"
replace CIG_REC = "0" if CIG_REC == "N"
replace CIG_REC = "9" if CIG_REC == "U"
destring CIG_REC, replace 
lab def CIG_REC1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val CIG_REC CIG_REC1
tab CIG_REC, mi
			   
lab var F_TOBACO "Reporting Flag for Tobacco use"
lab def F_TOBACO1 0 "Non-Reporting" 1 "Reporting"
lab val F_TOBACO F_TOBACO1
tab F_TOBACO, mi	  
	  
// Mother Height and Weight 

lab var M_Ht_In "Mother's Height in Total Inches"
lab def M_Ht_In1 99 "Unknown or not stated"
lab val M_Ht_In M_Ht_In1 
tab M_Ht_In, mi
			   
lab var F_M_HT "Reporting Flag for Mother's Height" 
lab def F_M_HT1 0 "Non-Reporting" 1 "Reporting"
lab val F_M_HT F_M_HT1 
tab F_M_HT, mi			   
			   	  
lab var BMI "BMI" 
replace BMI = 99 if BMI == 99.9 
lab def BMI1 99 "Unknown or not stated"
lab val BMI BMI1 
tab BMI, mi

// typo in codebook: "Obesity I 35.0-34.9"
lab var BMI_R "Body Mass Index Recode" 
lab def BMI_R1 1 "Underweight <18.5" 2 "Normal 18.5-24.9" 3 "Overweight 25.0-29.9" ///
               4 "Obesity I 30.0-34.9" 5 "Obesity II 35.0-39.9" /// 
			   6 "Extreme Obesity III ≥ 40.0" 9 "Unknown or not stated"
lab val BMI_R BMI_R1 
tab BMI_R, mi 	  
	  
lab var PWgt_R "Pre-pregnancy Weight Recode" 
lab def PWgt_R1 999 "Unknown or not stated"
lab val PWgt_R PWgt_R1 
tab PWgt_R, mi 

lab var F_PWGT "Reporting Flag for Pre-pregnancy Weight"
lab def F_PWGT1 0 "Non-Reporting" 1 "Reporting"
lab val F_PWGT F_PWGT1 
tab F_PWGT, mi 	  
	  
lab var DWgt_R "Delivery Weight Recode"
lab def DWgt_R1 999 "Unknown or not stated"
lab val DWgt_R DWgt_R1 
tab DWgt_R, mi 			  
	  
lab var F_DWGT "Reporting Flag for Delivery Weight"
lab def F_DWGT1 0 "Non-Reporting" 1 "Reporting"
lab val F_DWGT F_DWGT1 
tab F_DWGT, mi	  
	  
lab var WTGAIN "Weight Gain"
lab def WTGAIN1 98 "98 pounds and over" 99 "Unknown or not stated"
lab val WTGAIN WTGAIN1
tab WTGAIN, mi
	  
lab var WTGAIN_REC "Weight Gain Recode" 
lab def WTGAIN_REC1 1 "Less than 11 pounds" 2 "11 to 20 pounds" 3 "21 to 30 pounds" ///
                    4 "31 to 40 pounds" 5 "41 to 98 pounds" 9 "Unknown or not stated"
lab val WTGAIN_REC WTGAIN_REC1
tab WTGAIN_REC, mi

lab var F_WTGAIN "Reporting Flag for Weight Gain"
lab def F_WTGAIN1 0 "Non-Reporting" 1 "Reporting"
lab val F_WTGAIN F_WTGAIN1 
tab F_WTGAIN, mi	  
	  
// Risk Factors 

lab var RF_PDIAB "Pre-pregnancy Diabetes"

lab var RF_GDIAB "Gestational Diabetes"

lab var RF_PHYPE "Pre-pregnancy Hypertension"

lab var RF_GHYPE "Gestational Hypertension"

lab var RF_EHYPE "Hypertension Eclampsia"

lab var RF_PPTERM "Previous Preterm Birth"

foreach x of varlist RF_PDIAB RF_GDIAB RF_PHYPE RF_GHYPE RF_EHYPE RF_PPTERM {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 
	  
lab var F_RF_PDIAB "Reporting Flag for Pre-pregnancy Diabetes"

lab var F_RF_GDIAB "Reporting Flag for Gestational Diabetes"

lab var F_RF_PHYPER "Reporting Flag for Pre-pregnancy Hypertension" 

lab var F_RF_GHYPER "Reporting Flag for Gestational Hypertension"

lab var  F_RF_ECLAMP "Reporting Flag for Hypertension Eclampsia" 

lab var F_RF_PPB "Reporting Flag for Previous Preterm Birth"

foreach x of varlist F_RF_PDIAB F_RF_GDIAB F_RF_PHYPER F_RF_GHYPER F_RF_ECLAMP F_RF_PPB {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}	  
	  
lab var RF_INFTR "Infertility Treatment Used" 
replace RF_INFTR = "1" if RF_INFTR == "Y"
replace RF_INFTR = "0" if RF_INFTR == "N"
replace RF_INFTR = "9" if RF_INFTR == "U"
destring RF_INFTR, replace 
lab def RF_INFTR 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val RF_INFTR RF_INFTR
tab RF_INFTR, mi 
	  
lab var RF_FEDRG "Fertility Enhancing Drugs"

lab var RF_ARTEC "Asst. Reproductive Technology"

foreach x of varlist RF_FEDRG RF_ARTEC {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
	replace `x' = "8" if `x' == "X"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 8 "Not applicable" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}	  
	  
lab var F_RF_INFT "Reporting Flag for Infertility Treatment" 

lab var F_RF_INF_DRG "Reporting Flag for Fertility Enhance Drugs"

lab var F_RF_INF_ART "Reporting Flag for Reproductive Technology" 

foreach x of varlist F_RF_INFT F_RF_INF_DRG F_RF_INF_ART {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}	  
	  
lab var RF_CESAR "Previous Cesareans"
replace RF_CESAR = "1" if RF_CESAR == "Y"
replace RF_CESAR = "0" if RF_CESAR == "N"
replace RF_CESAR = "9" if RF_CESAR == "U"
destring RF_CESAR, replace 
lab def RF_CESAR1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val RF_CESAR RF_CESAR1
tab RF_CESAR, mi 	  
	  
lab var RF_CESARN "Number of Previous Cesareans"
lab define RF_CESARN1 0 "None" 99 "Unknown or not stated"
lab val RF_CESARN RF_CESARN1
tab RF_CESARN, mi 	  

lab var F_RF_CESAR "Reporting Flag for Previous Cesareans" 

lab var F_RF_NCESAR "Reporting Flag for Number of Previous Cesareans"

foreach x of varlist F_RF_CESAR F_RF_NCESAR {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var NO_RISKS "No Risk Factors Checked" 
lab def NO_RISKS1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_RISKS NO_RISKS1 
tab NO_RISKS, mi 
	  
// Infections Present 

lab var IP_GON "Gonorrhea" 

lab var IP_SYPH "Syphilis" 

lab var IP_CHLAM "Chlamydia"

lab var IP_HEPB "Hepatitis B"

lab var IP_HEPC "Hepatitis C"

foreach x of varlist IP_GON IP_SYPH IP_CHLAM IP_HEPB IP_HEPC {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_IP_GONOR "Reporting Flag for Gonorrhea"

lab var F_IP_SYPH "Reporting Flag for Syphilis" 

lab var F_IP_CHLAM "Reporting Flag for Chlamydia" 

lab var F_IP_HEPATB "Reporting Flag for Hepatitis B"

lab var F_IP_HEPATC "Reporting Flag for Hepatitis C"

foreach x of varlist F_IP_GONOR F_IP_SYPH F_IP_CHLAM F_IP_HEPATB F_IP_HEPATC {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}
	  
lab var NO_INFEC "No Infections Reported" 
lab def NO_INFEC1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_INFEC NO_INFEC1
tab NO_INFEC, mi
	  
// Obstetric Procedures	  

lab var OB_ECVS "Successful External Cephalic Version" 

lab var OB_ECVF "Failed External Cephalic Version" 

foreach x of varlist OB_ECVS OB_ECVF {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}
	  
lab var F_OB_SUCC "Reporting Flag for Successful External Cephalic Version" 

lab var F_OB_FAIL "Reporting Flag for Failed External Cephalic Version"

foreach x of varlist F_OB_SUCC F_OB_FAIL {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}	  
	  
// Characteristics of Labor and Delivery 

lab var LD_INDL "Induction of Labor"

lab var LD_AUGM "Augmentation of Labor"

lab var LD_STER "Steroids"

lab var LD_ANTB "Antibiotics"

lab var LD_CHOR "Chorioamnionitis"

lab var LD_ANES "Anesthesia"

foreach x of varlist LD_INDL LD_AUGM LD_STER LD_ANTB LD_CHOR LD_ANES {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_LD_INDL "Reporting Flag for Induction of Labor" 

lab var F_LD_AUGM "Reporting Flag for Augmentation of Labor"

lab var F_LD_STER "Reporting Flag for Steroids" 

lab var F_LD_ANTB "Reporting Flag for Antiobiotics"

lab var F_LD_CHOR "Reporting Flag for Chorioamnionitis"

lab var F_LD_ANES "Reporting Flag for Anesthesia"

foreach x of varlist F_LD_INDL F_LD_AUGM F_LD_STER F_LD_ANTB F_LD_CHOR F_LD_ANES {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var NO_LBRDLV "No Characteristics of Labor Checked"
lab def NO_LBRDLV1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_LBRDLV NO_LBRDLV1
tab NO_LBRDLV, mi

// Method of Delivery 

lab var ME_PRES "Fetal Presentation at Delivery" 
lab def ME_PRES1 1 "Cephalic" 2 "Breech" 3 "Other" 9 "Unknown or not stated"
lab val ME_PRES ME_PRES1
tab ME_PRES, mi

lab var ME_ROUT "Final Route & Method of Delivery"
lab def ME_ROUT1 1 "Spontaneous" 2 "Forceps" 3 "Vacuum" 4 "Cesarean" 9 "Unknown or not stated"
lab val ME_ROUT ME_ROUT1 
tab ME_ROUT, mi

lab var ME_TRIAL "Trial of Labor Attempted (if cesarean)"
replace ME_TRIAL = "1" if ME_TRIAL == "Y"
replace ME_TRIAL = "0" if ME_TRIAL == "N"
replace ME_TRIAL = "8" if ME_TRIAL == "X"
replace ME_TRIAL = "9" if ME_TRIAL == "U"
destring ME_TRIAL, replace 
lab def ME_TRIAL1 0 "No" 1 "Yes" 8 "Not applicable" 9 "Unknown or not stated"
lab val ME_TRIAL ME_TRIAL1
tab ME_TRIAL, mi 

lab var F_ME_PRES "Reporting Flag for Fetal Presentation"

lab var F_ME_ROUT "Reporting Flag for Final Route and Method of Delivery" 

lab var F_ME_TRIAL "Reporting Flag for Trial of Labor Attempted"

foreach x of varlist F_ME_PRES F_ME_ROUT F_ME_TRIAL {
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var RDMETH_REC "Delivery Method Recode"
lab def RDMETH_REC1 1 "Vaginal (excludes vaginal after previous C-section)" ///
                    2 "Vaginal after previous c-section" ///
					3 "Primary C-section" ///
					4 "Repeat C-section" ///
					5 "Vaginal (unknown if previous c-section)" ///
					6 "C-section (unknown if previous c-section)" ///
					9 "Not stated"
lab val RDMETH_REC RDMETH_REC1
tab RDMETH_REC, mi	

lab var DMETH_REC "Delivery Method Recode" // 2019 codebook calls this variable "Delivery Method Recode Combined"
lab def DMETH_REC1 1 "Vaginal" 2 "C-Section" 9 "Unknown"
lab val DMETH_REC DMETH_REC1
tab DMETH_REC, mi

lab var F_DMETH_REC "Reporting Flag for Method of Delivery Recode"
lab def F_DMETH_REC1 0 "Non-Reporting" 1 "Reporting"
lab val F_DMETH_REC F_DMETH_REC1
tab F_DMETH_REC, mi

// Maternal Morbidity 

lab var MM_MTR "Maternal Transfusion" 

lab var MM_PLAC "Perineal Laceration"

lab var MM_RUPT "Ruptured Uterus" 

lab var MM_UHYST "Unplanned Hysterectomy" 

lab var MM_AICU "Admit to Intensive Care"

foreach x of varlist MM_MTR MM_PLAC MM_RUPT MM_UHYST MM_AICU {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_MM_MTR "Reporting Flag for Maternal Transfusion"

lab var F_MM_PLAC "Reporting Flag for Perineal Laceration"

lab var F_MM_RUPT "Reporting Flag for Ruptured Uterus"

lab var F_MM_UHYST "Reporting Flag for Unplanned Hysterectomy"

lab var F_MM_AICU "Reporting Flag for Admission to Intensive Care"

foreach x of varlist F_MM_MTR F_MM_PLAC F_MM_RUPT F_MM_UHYST F_MM_AICU { 
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var NO_MMORB "No Maternal Morbidity Reported"
lab def NO_MMORB1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_MMORB NO_MMORB1 
tab NO_MMORB, mi 

// Hospital / Payment 

lab var ATTEND "Attendant at Birth"
lab def ATTEND1 1 "Doctor of Medicine (MD)" 2 "Doctor of Osteopathy (DO)" ///
                3 "Certified Nurse Midwife (CNM/CM)" 4 "Other Midwife" ///
				5 "Other" 9 "Unknown or not stated"
lab val ATTEND ATTEND1
tab ATTEND, mi

lab var MTRAN "Mother Transferred" // codebook note: use reporting flag in field 126
replace MTRAN = "1" if MTRAN == "Y"
replace MTRAN = "0" if MTRAN == "N"
replace MTRAN = "9" if MTRAN == "U"
destring MTRAN, replace 
lab def MTRAN1 0 "No" 1 "Yes" 9 "Unknown"
lab val MTRAN MTRAN1
tab MTRAN, mi 	  
	  
lab var PAY "Payment Source for Delivery"
lab def PAY1 1 "Medicaid" 2 "Private Insurance" 3 "Self-Pay" 4 "Indian Health Service" ///
             5 "CHAMPUS/TRICARE" 6 "Other Government (Federal, State, Local)" ///
			 8 "Other" 9 "Unknown"
lab val PAY PAY1
tab PAY, mi
	  
lab var PAY_REC "Payment Recode" 
lab def PAY_REC1 1 "Medicaid" 2 "Private Insurance" 3 "Self Pay" 4 "Other" 9 "Unknown"
lab val PAY_REC PAY_REC1
tab PAY_REC, mi	  
	  
lab var F_PAY "Reporting Flag for Source of Payment"

lab var F_PAY_REC "Reporting Flag for Payment Recode"

foreach x of varlist F_PAY F_PAY_REC { 
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x',
}	  
	  
// APGAR 

lab var APGAR5 "Five Minute APGAR Score"
lab def APGAR51 99 "Unknown or not stated"
lab val APGAR5 APGAR51 
tab APGAR5, mi
	  
lab var APGAR5R "Five Minute APGAR Recode" 
lab def APGAR5R1 1 "A score of 0-3" 2 "A score of 4-6" 3 "A score of 7-8" ///
                 4 "A score of 9-10" 5 "Unknown or not stated"
lab val APGAR5R APGAR5R1 
tab APGAR5R, mi 	  
	  
lab var F_APGAR5 "Reporting Flag for Five minute APGAR" 
lab def F_APGAR51 0 "Non-Reporting" 1 "Reporting" 
lab val F_APGAR5 F_APGAR51 
tab F_APGAR5, mi	  
	  
lab var APGAR10 "Ten Minute APGAR Score" // codebook note: use reporting flag in field 126 
lab def APGAR101 88 "Not applicable" 99 "Unknown or not stated"
lab val APGAR10 APGAR101 
tab APGAR10, mi	  
	  
lab var APGAR10R "Ten Minute APGAR Score Recode" // codebook note: use reporting flag in field 126 for 2015 
lab def APGAR10R1 1 "A score of 0-3" 2 "A score of 4-6" 3 "A score of 7-8" ///
                  4 "A score of 9-10" 5 "Not stated/not applicable"
lab val APGAR10R APGAR10R1
tab APGAR10R, mi

// str F_APGAR10 451 -  Variable in 2019 data, but not present in 2021 data 
	  
// Plurality and Order 

lab var DPLURAL "Plurality Recode"
lab def DPLURAL1 1 "Single" 2 "Twin" 3 "Triplet" 4 "Quadruplet or higher" 
// 2019 has additional level of: 5 "Quintuplet or higher"
lab val DPLURAL DPLURAL1
tab DPLURAL, mi
	  
lab var IMP_PLUR "Plurality Imputed"
lab def IMP_PLUR1 1 "Plurality is imputed" // missing = not imputed (this is the opposite of the 2019 codebook)
lab val IMP_PLUR IMP_PLUR1 
tab IMP_PLUR, mi
	  
lab var SETORDER_R "Set Order Recode" // codebook note: use reporting flag in field 126
lab def SETORDER_R1 1 "1st" 2 "2nd" 3 "3rd" 4 "4th" 5 "5th to 16th" 9 "Unknown or not stated"
lab val SETORDER_R SETORDER_R1 
tab SETORDER_R, mi

// Sex 

lab var SEX "Sex of Infant"
replace SEX = "1" if SEX == "M" 
replace SEX = "2" if SEX == "F"
destring SEX, replace
lab def SEX1 1 "Male" 2 "Female"
lab val SEX SEX1
tab SEX, mi	  
	  
lab var IMP_SEX "Imputed Sex" 
lab def IMP_SEX1 1 "Infant Sex is Imputed" // missing = not imputed 
lab val IMP_SEX IMP_SEX1 
tab IMP_SEX, mi 	  
	  
// Menses
	  
lab var DLMP_MM "Last Normal Menses Month"
lab def DLMP_MM1 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" ///
                 7 "July" 8 "August" 9 "September" 10 "October" 11 "November" ///
				 12 "December" 99 "Unknown or not stated"
lab val DLMP_MM DLMP_MM1
tab DLMP_MM, mi	  
	  
lab var DLMP_YY "Last Normal Menses Year" 
lab def DLMP_YY1 9999 "Unknown or not stated"
lab val DLMP_YY DLMP_YY1
tab DLMP_YY, mi
	  
// Gestation

// Variable in same position in 2019 is called COMBGST_IMP 
lab var COMPGST_IMP "Combined Gestation Imputed Flag"
lab def COMPGST_IMP 1 "Combined Gestation is imputed" // missing = not imputed
lab val COMPGST_IMP COMPGST_IMP1
tab COMPGST_IMP, mi 	  
	  
lab var OBGEST_FLG "Obstetric Estimate of Gestation Used Flag"
// 2019 label = "Clinical Estimate is used"
lab def OBGEST_FLG1 1 "Obstetric Estimate is used" // missing = not used 
lab val OBGEST_FLG OBGEST_FLG1 
tab OBGEST_FLG, mi
	  
lab var COMBGEST "Combined Gestation - Detail in Weeks"
lab def COMBGEST1 99 "Unknown"
lab val COMBGEST COMBGEST1 
tab COMBGEST, mi 
	  
lab var GESTREC10 "Combined Gestation Recode 10"
lab def GESTREC101 1 "Under 20 weeks" 2 "20-27 weeks" 3 "28-31 weeks"  ///
				   4 "32-33 weeks" 5 "34-36 weeks" 6 "37-38 weeks" ///
				   7 "39 weeks" 8 "40 weeks" 9 "41 weeks" 10 "42 weeks and over" ///
				   99 "Unknown"
lab val GESTREC10 GESTREC101
tab GESTREC10, mi
	  
lab var GESTREC3 "Combined Gestation Recode 3" 
lab def GESTREC31 1 "Under 37 weeks" 2 "37 weeks and over" 3 "Not stated"
lab val GESTREC3 GESTREC31
tab GESTREC3, mi	  
	  
lab var LMPUSED "Combined Gestation Used Flag" // 2019 codebook calls this variable "Computed (LMP) Gestation Used Flag"
lab def LMPUSED1 1 "Combined gestation used" // missing = not used 
// 2019 label = "LMP used for gestation"
lab val LMPUSED LMPUSED1
tab LMPUSED, mi 	  
	  
lab var OEGest_Comb "Obstetric Estimate Edited"
lab def OEGest_Comb1 99 "Not stated"
lab val OEGest_Comb OEGest_Comb1 
tab OEGest_Comb, mi	  
	  
lab var OEGest_R10 "Obstetric Estimate Recode 10"
lab def OEGest_R101 1 "Under 20 weeks" 2 "20-27 weeks" 3 "28-31 weeks"  ///
				    4 "32-33 weeks" 5 "34-36 weeks" 6 "37-38 weeks" ///
				    7 "39 weeks" 8 "40 weeks" 9 "41 weeks" 10 "42 weeks and over" ///
				    99 "Unknown"
lab val OEGest_R10 OEGest_R101
tab OEGest_R10, mi	  
	  
lab var OEGest_R3 "Obstetric Estimate Recode 3" 
lab def OEGest_R31 1 "Under 37 weeks" 2 "37 weeks and over" 3 "Not stated"
lab val OEGest_R3 OEGest_R31 
tab OEGest_R3, mi	  

// Birth Weight 

lab var DBWT "Birth Weight - Detail in Grams (Edited)"
lab def DBWT1 9999 "Not stated birth weight"
lab val DBWT DBWT1
tab DBWT, mi 	  
	  
lab var BWTR12 "Birth Weight Recode 12"
lab def BWTR121 1 "0227-0499 grams" 2 "0500 - 0999 grams" 3 "1000 - 1499 grams" ///
			    4 "1500 - 1999 grams" 5 "2000 - 2499 grams" 6 "2500 - 2999 grams" ///
				7 "3000 - 3499 grams" 8 "3500 - 3999 grams" 9 "4000 - 4499 grams" ///
				10 "4500 - 4999 grams" 11 "5000 - 8165 grams" 12 "Not Stated"
lab val BWTR12 BWTR121
tab BWTR12, mi

lab var BWTR4 "Birth Weight Recode 4" 
lab def BWTR41 1 "0227-1499 grams" 2 "1500-2499 grams" 3 "2500-8165 grams" ///
			   4 "Unknown or not stated"
lab val BWTR4 BWTR41
tab BWTR4, mi

// Abnormal Conditions of the Newborn 

lab var AB_AVEN1 "Assisted Ventilation (immediately)"

lab var AB_AVEN6 "Assisted Ventilation > 6 hrs"

lab var AB_NICU "Admission to NICU"

lab var AB_SURF "Surfactant"

lab var AB_ANTI "Antibiotics for Newborn"

lab var AB_SEIZ "Seizures"

foreach x of varlist AB_AVEN1 AB_AVEN6 AB_NICU AB_SURF AB_ANTI AB_SEIZ {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_AB_VENT "Reporting Flag for Assisted Ventilation (immediately)" 

lab var F_AB_VENT6 "Reporting Flag for Assisted Ventilation > 6 hours"

lab var F_AB_NICU "Reporting Flag for Admission to NICU" // typo in codebook: F_AB_NIUC

lab var F_AB_SURFAC "Reporting Flag for Surfactant"

lab var F_AB_ANTIBIO "Reporting Flag for Antibiotics"

lab var F_AB_SEIZ "Reporting Flag for Seizures"
 
foreach x of varlist F_AB_VENT F_AB_VENT6 F_AB_NICU F_AB_SURFAC F_AB_ANTIBIO F_AB_SEIZ { 
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
} 

lab var NO_ABNORM "No Abnormal Conditions Checked" 
lab def NO_ABNORM1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_ABNORM NO_ABNORM1
tab NO_ABNORM, mi

// Congenital Anomalies of the Newborn 

lab var CA_ANEN "Anencephaly"

lab var CA_MNSB "Meningomyelocele / Spina Bifida"

lab var CA_CCHD "Cyanotic Congenital Heart Disease"

lab var CA_CDH "Congenital Diaphragmatic Hernia"

lab var CA_OMPH "Omphalocele"
 
lab var CA_GAST "Gastroschisis"

foreach x of varlist CA_ANEN CA_MNSB CA_CCHD CA_CDH CA_OMPH CA_GAST{
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_CA_ANEN "Reporting Flag for Anencephaly"

lab var F_CA_MENIN "Reporting Flag for Meningomyelocele/Spina Bifida"

lab var F_CA_HEART "Reporting Flag for Cyanotic Congenital Heart Disease"

lab var F_CA_HERNIA "Reporting Flag for Congenital Diaphragmatic Hernia"

lab var F_CA_OMPHA "Reporting Flag for Omphalocele"

lab var F_CA_GASTRO "Reporting Flag for Gastroschisis"

foreach x of varlist F_CA_ANEN F_CA_MENIN F_CA_HEART F_CA_HERNIA F_CA_OMPHA F_CA_GASTRO { 
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var CA_LIMB "Limb Reduction Defect"

lab var CA_CLEFT "Cleft Lip w/ or w/o Cleft Palate"

lab var CA_CLPAL "Cleft Palate alone"

foreach x of varlist CA_LIMB CA_CLEFT CA_CLPAL  {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var CA_DOWN "Down Syndrome" 

lab var CA_DISOR "Suspected Chromosomal Disorder"

foreach x of varlist CA_DOWN CA_DISOR {
	replace `x' = "1" if `x' == "C"
	replace `x' = "2" if `x' == "P"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Confirmed" 2 "Pending" 9 "Unknown"
    lab val `x' `x'
	tab `x', mi 
}

lab var CA_HYPO "Hypospadias"
replace CA_HYPO = "1" if CA_HYPO == "Y"
replace CA_HYPO = "0" if CA_HYPO == "N"
replace CA_HYPO = "9" if CA_HYPO == "U"
destring CA_HYPO, replace 
lab def CA_HYPO1 0 "No, anomaly not reported" 1 "Yes, anomaly reported" 9 "Unknown"
lab val CA_HYPO CA_HYPO1
tab CA_HYPO, mi 

lab var F_CA_LIMB "Reporting Flag for Limb Reduction Defect"

lab var F_CA_CLEFTLP "Reporting Flag for Cleft Lip with or without Cleft Palate"

lab var F_CA_CLEFT "Reporting Flag for Cleft Palate Alone"

lab var F_CA_DOWNS "Reporting Flag for Down Syndrome"

lab var F_CA_CHROM "Reporting Flag for Suspected Chromosomal Disorder"

lab var F_CA_HYPOS "Reporting Flag for Hypospadias"

foreach x of varlist F_CA_LIMB  F_CA_CLEFTLP F_CA_CLEFT F_CA_DOWNS F_CA_CHROM F_CA_HYPOS { 
	lab def `x' 0 "Non-Reporting" 1 "Reporting" 
	lab val `x' `x'
	tab `x', mi
}

lab var NO_CONGEN "No Congenital Anomalies Checked" 
lab def NO_CONGEN1 1 "True" 0 "False" 9 "Not Reported"
lab val NO_CONGEN NO_CONGEN1
tab NO_CONGEN, mi

// Infant 

lab var ITRAN "Infant Transferred" // codebook note: use reporting flag in field 126

lab var ILIVE "Infant Living at Time of Report" // codebook note: use reporting flag in field 126

lab var BFED "Infant Breastfed at Discharge"

foreach x of varlist ITRAN ILIVE BFED {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

lab var F_BFED "Reporting Flag for Breastfed at Discharge"
lab def F_BFED1 0 "Non-Reporting" 1 "Reporting"
lab val F_BFED F_BFED1 
tab F_BFED, mi

** The following line should contain the path to your output '.dta' (labeled) file 
save "FILEPATH/RestrictedVitalStatistics_Natality_2021_Labeled.dta", replace 





	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  