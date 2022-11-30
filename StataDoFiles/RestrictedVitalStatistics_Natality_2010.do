clear all 
capture log close
log using RestrictedVitalStatistics_Natality_2010.log, replace 
set more off

** -----------------------------------------------; 
** This program reads the 2010 Restricted-Use  
** NCHS Natality Data File 
** by Hye Jee Kim, hyejk@stanford.edu,  Thurs Nov 10, 2022 
** Please report errors to hyejk@stanford.edu
** -----------------------------------------------;

** The following line should contain
** the complete path of the working directory
** On a PC, use backslashes in paths as in C:\  ;

// cd "FILEPATH" 

** Reading in File ** 
infix str VERSION 7 ///
      str DOB_YY 15-18 str DOB_MM 19-20 str IMP_DOBMM 21 ///
	  str IMP_DOBDD 24 str DOB_TT 25-28 str DOB_WK 29 ///
      str OSTATE 30-31 str XOSTATE 32-33 ///
	  str OCNTYFIPS 37-39 str OCNTYPOP 40 /// 
      str BFACIL 41 str UBFACIL 42 str BFACIL3 59 /// 
	  str DOBM_IMP 69 str DOBM_BYP 74 ///
      str MAGE_IMPFLG 87 MAGE_REPFLG 88 ///
      str MAGER 89-90 str MAGER14 91-92 str MAGER9 93 ///
      str MBCNTRY 94-95 str MBSTATE 98-99 str MBSTATE_REC 100 ///
	  str MRCNTRY 101-102 str XMRSTATE 107-108 ///
	  str MRSTATEPSTL 109-110 str MRCNTYFIPS 114-116 str MRCITYFIPS 120-124 /// 
      str RCNTY_POP 132 str RCITY_POP 133 str CITYLIM 134 /// 
	  str RECTYPE 137 str RESTATUS 138 ///
      str MBRACE 139-140 str MRACE 141-142 str MRACEREC 143 str MRACEIMP 144 ///  
	  str UMHISP 148 str MRACEHISP 149 ///
	  str MAR_P 152 str MAR 153 str MAR_IMP 154 /// 
      str MEDUC 155 str MEDUC_BYP 159 /// 
	  str DOBF_IMP 169 str DOBF_BYP 174 ///
	  str FAGERPT_FLG 175 str FAGECOMB 182-183 ///
	  str UFAGECOMB 184-185 str FAGEREC11 186-187 ///
      str FBRACE 188-189 str FRACEIMP 190 str FRACEREC 191 ///
      str UFHISP 195 str FRACEHISP 196 ///
	  str FEDUC 197 str FEDUC_BYP 198 /// 
	  str UFRACE 199-200 ///
	  str PRIORTERM 208-209 str LBO_REC 212 str TBO_REC 217 /// 
	  str ILPCV_DOB 243-244 str PRECARE 245-246 str PRECARE_REC 247 /// 
	  str UPREVIS 270-271 str PREVIS_REC 272-273 str PREVIS_BYP 274 /// 
      str WTGAIN 276-277 str WTGAIN_REC 278 ///
      str DFPC_IMP 280 str WIC 281 ///
      str CIG_0 282-283 str CIG_1 284-285 str CIG_2 286-287 str CIG_3 288-289 ///
	  str CIG_REC 294 ///
	  str PWGT_BYP 308 str DWGT_BYP 312 ///
	  str RF_DIAB 313 str RF_GEST 314 str RF_PHYP 315 str RF_GHYP 316 ///
	  str RF_ECLAM 317 str RF_PPTERM 318 str RF_PPOUTC 319 str RF_INFTR 321 ///
	  str RF_FEDRG 322 str RF_ARTEC 323 str RF_CESAR 324 str RF_CESARN 325-326 ///
	  str RF_CES_BYP 327 ///
	  str URF_DIAB 331 str URF_CHYPER 335 str URF_PHYPER 336 str URF_ECLAM 337 ///
	  str IP_GONN 345 str IP_SYPH 346 str IP_CHLAM 348 ///
	  str IP_HEPB 349 str IP_HEPC 350 /// 
	  str OP_CERV 351 str OP_TOCOL 352 str OP_ECVS 353 str OP_ECVF 354 /// 
	  str UOP_INDUC 357 str UOP_TOCOL 359 ///
	  str ON_RUPTR 362 str ON_PRECIP 363 str ON_PROL 364 /// 
	  str LD_INDL 365 str LD_AUGM 366 str LD_STER 368 ///
	  str LD_ANTI 369 str LD_CHOR 370 str LD_MECS 371 str LD_FINT 372 ///
	  str LD_ANES 373 ///
	  str ULD_MECO 375 str ULD_PRECIP 381 str ULD_BREECH 384 ///
	  str ME_PRES 392 str ME_ROUT 393 str ME_TRIAL 394 ///
	  str UME_FORCP 399 str UME_VAC 400 ///
	  str RDMETH_REC 401 str DMETH_REC 403 /// 
	  str MM_MTR 404 str MM_PLAC 405 str MM_RUPT 406 str MM_UHYST 407 ///
	  str MM_ICU 408 str MM_UOPER 409 /// 
	  str ATTEND 410 str MTRAN 411 str PAY 412 str PAY_REC 413 /// 
	  str APGAR5 415-416 str APGAR5R 417 str APGAR10 418 str APGAR10R 420 ///
	  str DPLURAL 423 str PLUR_BYP 424 str IMP_PLUR 425 ///
	  str SEX 436 str IMP_SEX 437 ///
	  str DLMP_MM 438-439 str DLMP_YY 442-445 ///
	  str ESTGEST 446-447 str OBGEST_BYP 448 ///
	  str COMBGEST 451-452 str GESTREC10 453-454 ///
	  str GESTREC3 455 str OBGEST_FLG 456 str GEST_IMP 457 str COMPGST_IMP 458 /// 
	  str DBWT 463-466 ///
	  str BWTR12 471-472 str BWTR4 473 str BWT_BYP 474 str BWTIMP 475 ///
	  str AB_AVEN1 476 str AB_AVEN6 477 str AB_NICU 478 str AB_SURF 479 ///
	  str AB_ANTI 480 str AB_SEIZ 481 str AB_BINJ 482 ///
	  str CA_ANEN 492 str CA_MNSB 493 str CA_CCHD 494 str CA_CDH 495 ///
	  str CA_OMPH 496 str CA_GAST 497 str CA_LIMB 498 str CA_CLEFT 499 ///
	  str CA_CLPAL 500 str CA_DOWN 501 str CA_DISOR 502 str CA_HYPO 503 /// 
	  str UCA_ANEN 504 str UCA_SPINA 505 str UCA_OMPHA 513 str UCA_CLEFTLP 518 ///
	  str UCA_HERNIA 521 str UCA_DOWNS 523 ///
	  str ITRAN 526 str ILIVE 527 str BFED 528 str BMI 529 str BMI_R 533 ///
	  str ILLB_R 534-536 str ILLB_R11 537-538 str ILOP_R 539-541 /// 
	  str ILOP_R11 542-543 str ILP 544-546 str ILP_R11 547-548 /// 
	  str PWgt_R 549-551 str DWgt_R 552-554 str M_Ht_In 555-556 ///
	  str SetOrder_R 557 /// 
	  str F_MORIGIN 569 str F_FORIGIN 570 str F_MEDUC 571 str F_FEDUC 572 ///
	  str F_CLINEST 573 str F_APGAR5 574 str F_TOBACO 575 str F_M_HT 576 ///
	  str F_PWGT 577 str F_DWGT 578 str F_WIC 579 str F_PAY 580 str F_BFED 581 /// 
	  str F_RF_PDIAB 582 str F_RF_GDIAB 583 str F_RF_PHYPER 584 /// 
	  str F_RF_GHYPER 585 str F_RF_ECLAMP 586 str F_RF_PPB 587 str F_RF_PPO 588 /// 
	  str F_RF_INFT 590 str F_RF_INFT_DRG 591 str F_RF_INF_ART 592 ///
	  str F_RF_CESAR 593 str F_RF_NCESAR 594 ///
	  str F_IP_GONOR 595 str F_IP_SYPH 596 str F_IP_CHLAM 598 ///
	  str F_IP_HEPATB 599 str F_IP_HEPATC 600 /// 
	  str F_OB_CERVIC 601 str F_OB_TOCO 602 str F_OB_SUCC 603 str F_OB_FAIL 604 ///
	  str F_OL_RUPTURE 605 str F_OL_PRECIP 606 str F_OL_PROLONG 607 ///
	  str F_LD_INDUCT 608 str F_LD_AUGMENT 609 /// 
	  str F_LD_STERIODS 611 str F_LD_ANTIBIO 612 str F_LD_CHORIO 613 ///
	  str F_LD_MECON 614 str F_LD_FINTOL 615 str F_LD_ANESTH 616 ///
	  str F_MD_PRESENT 619 str F_MD_ROUTE 620 str F_MD_TRIAL 621 ///
	  str F_MM_MTRANS 622 str F_MM_LACER 623 str F_MM_RUPTUR 624 /// 
	  str F_MM_UHYSTR 625 str F_MM_ICU 626 str F_MM_OR 627 ///
	  str F_AB_VENT 628 str F_AB_VENT6 629 str F_AB_NICU 630 str F_AB_SURFAC 631 /// 
	  str F_AB_ANTIBIO 632 str F_AB_SEIZ 633 str F_AB_INJ 634 ///
	  str F_CA_ANEN 635 str F_CA_MENIN 636 str F_CA_HEART 637 ///
	  str F_CA_HERNIA 638 str F_CA_OMPHA 639 str F_CA_GASTRO 640 ///
	  str F_CA_LIMB 641 str F_CA_CLEFTLP 642 str F_CA_CLEFT 643 ///
	  str F_CA_DOWNS 644 str F_CA_CHROM 645 str F_CA_HYPOS 646 ///
	  str F_WTGAIN 648 str F_MAR_G 652 str F_MPCB 668 str F_TPCV 671 ///
	  str F_CIGS_0 672 str F_CIGS_1 673 str F_CIGS_2 674 str F_CIGS_3 675 ///
	  str F_FACILITY 676 str F_LIMIT 677 ///
	  str F_PAY_REC 678 str F_RDMETH_REC 679 ///
	  str F_URF_DIABETES 684 str F_URF_CHYPER 688 str F_URF_PHYPER 689 ///
	  str F_URF_ECLAMP 690 ///
	  str F_UOB_INDUCT 703 str F_UOB_TOCOL 705 ///
	  str F_ULD_MECONIUM 712 str F_ULD_PRECIP 718 str F_ULD_BREECH 721 ///
	  str F_U_FORCEP 734 str F_U_VACUUM 735 ///
	  str F_UCA_ANEN 752 str F_UCA_SPINA 753 str F_UCA_OMPHALO 761 ///
	  str F_UCA_CLEFTLP 766 str F_UCA_HERNIA 769 str F_UCA_DOWNS 771 ///
	  str MRACE1E 1088 str MRACE2E 1091 str MRACE3E 1094 str MRACE4E 1097 /// 
	  str MRACE5E 1100 str MRACE6E 1103 str MRACE7E 1106 str MRACE8E 1109 ///
	  str FRACE1E 1422 str FRACE2E 1425 str FRACE3E 1428 str FRACE4E 1431 /// 
	  str FRACE5E 1434 str FRACE6E 1437 str FRACE7E 1440 str FRACE8E 1443 /// 
	  using "/FILEPATH/NATL2010us.AllCnty.txt"
	  
** The above line should contain
** the complete path and name of the raw data file.
	  
** The following line should contain the path to your output '.dta' (unlabeled) file ;
save "/FILEPATH/Clean Stata Data/RestrictedVitalStatistics_Natality_2010.dta", replace 
destring, replace
	  	 
** The lines below do NOT need to be changed, save for the final line;

** Creating Variable Labels ** 

// CERT - no observations 

lab var VERSION "Version"
replace VERSION = "1" if VERSION == "A"
replace VERSION = "0" if VERSION == "S"
destring VERSION, replace
lab def VERSION1 1 "State used the 2003 version of the US Standard Birth Certificate (Revised)" ///
				0 "State used the 1989 version of the US Standard Birth Certificate (Unrevised)"
lab val VERSION VERSION1
tab VERSION, mi 
				
// RECWT - no observations 			
// LATEREC - no observations 

// Birth Date Variables 
lab var DOB_YY "Birth Year"

lab var DOB_MM "Birth Month"
lab def DOB_MM1 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" ///
                7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December" 
lab val DOB_MM DOB_MM1
tab DOB_MM, mi

lab var IMP_DOBMM "Birth Month Imputed" // missing = not imputed 
lab def IMP_DOBMM1 1 "Imputed"
lab val IMP_DOBMM IMP_DOBMM1 
tab IMP_DOBMM, mi 

// DOB_DD = no observations 

lab var IMP_DOBDD "Birth Date Imputed" // missing = not imputed 
lab def IMP_DOBDD1 1 "Imputed"
lab val IMP_DOBDD IMP_DOBDD1 
tab IMP_DOBDD, mi 

lab var DOB_TT "Birth Time" 
lab def DOB_TT1 9999 "Not Stated"
lab val DOB_TT DOB_TT1
tab DOB_TT, mi

lab var DOB_WK "Birth Day of Week"
lab def DOB_WK1 1 "Sunday" 2 "Monday" 3 "Tuesday" 4 "Wednesday" 5 "Thursday" ///
        6 "Friday" 7 "Saturday"  
lab val DOB_WK DOB_WK1
tab DOB_WK, mi

// Geography 
lab var OSTATE "Occurrence Postal State"

lab var XOSTATE "Expanded Occurrence State (NY = NY not including NYC, YC = NYC)"

lab var OCNTYFIPS "Occurrence FIPS County"

lab var OCNTYPOP "Occurrence County Population"
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
lab var BFACIL "Birth Place (Revised)"
lab def BFACIL1 1 "Hospital" 2 "Freestanding Birthing Center" 3 "Home (intended)" ///
                4 "Home (not intended)" 5 "Home (unknown if intended)" ///
				6 "Clinic / Doctor's Office" 7 "Other" 9 "Unknown" 
lab val BFACIL BFACIL1
tab BFACIL, mi 

lab var UBFACIL "Birth Place" 
lab def UBFACIL1 1 "Hospital" 2 "Freestanding Birthing Center" 3 "Clinic / Doctor's Office" ///
				 4 "Residence" 5 "Other" 9 "Unknown"
lab val UBFACIL UBFACIL1 
tab UBFACIL, mi		

// FACIDN - no observations 
// FACIDS - no observations 

lab var BFACIL3 "Birth Place Recode"
lab def BFACIL31 1 "In Hospital" 2 "Not in Hospital" 3 "Unknown or Not Stated"
lab val BFACIL3 BFACIL31 
tab BFACIL3, mi 

// Mother Birth Date and Age 
// DOBM_MM - no observations 
// DOBM_DD - no observations 

lab var DOBM_IMP "Mother's Birth Day Imputed" 
lab def DOBM_IMP1 1 "Birth day imputed" // missing - not imputed 
lab val DOBM_IMP DOBM_IMP1
tab DOBM_IMP, mi

// DOBM_YY - no observations 

lab var DOBM_BYP "Mother's Age Bypass" 
// missing - no response 
lab def DOBM_BYP1 0 "Edit passed" 1 "Data Queried" 2 "Invalid bypass response" 
lab val DOBM_BYP DOBM_BYP1 
tab DOBM_BYP, mi 

// MAGERPT - no observations 
// MAGECOMP - no observations 
// MAGECOMB - no observations 

lab var MAGE_IMPFLG "Mother's Age Imputed" 
lab def MAGE_IMPFLG1 1 "Age imputed" // missing - not imputed 
lab val MAGE_IMPFLG MAGE_IMPFLG1
tab MAGE_IMPFLG, mi 

lab var MAGE_REPFLG "Reported Age of Mother Flag" 
lab def MAGE_REPFLG1 1 "Reported age used" // missing - not used
lab val MAGE_REPFLG MAGE_REPFLG1
tab MAGE_REPFLG, mi 

lab var MAGER "Mother's Age Recode 41"
lab def MAGER1 12 "10-12 years" 50 "50 years and over"
lab val MAGER MAGER1
tab MAGER, mi 

lab var MAGER14 "Mother's Age Recode 14" 
lab def MAGER1410 1 "Under 15 Years" 03 "15 years" 04 "16 years" 05 "17 years" ///
                 06 "18 years" 07 "19 years" 08 "20-24 years" 09 "25-29 years" ///
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

// Mother Birth Place Geography 
lab var MBCNTRY "Mother's Birth Country"

lab var MBSTATE "Mother's Postal Birth State (Revised)"

lab var MBSTATE_REC "Mother's Birth State Recode"
lab def MBSTATE_REC1 1 "Native born (50 US States)" ///
					 2 "Foreign born (include possessions)" ///
					 3 "Unknown or Not Stated"
lab val MBSTATE_REC MBSTATE_REC1
tab MBSTATE_REC, mi 	

// Mother Residence Geography 
lab var MRCNTRY "Mother's Residence Country"

lab var XMRSTATE "Expanded State of Residence of Mother (NY = NY not including NYC, YC = NYC)" 

lab var MRSTATEPSTL "Mother's Residence Postal State" 

lab var MRCNTYFIPS "Mother's FIPS County" 
lab def MRCNTYFIPS1 000 "Foreign" 
lab val MRCNTYFIPS MRCNTYFIPS1
tab MRCNTYFIPS, mi

lab var MRCITYFIPS "Mother's Residence City"
lab def MRCITYFIPS1 00000 "Foreign"
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

lab var CITYLIM "Inside City Limits" 
replace CITYLIM = "1" if CITYLIM == "Y"	
replace CITYLIM = "0" if CITYLIM == "N"	
replace CITYLIM = "9" if CITYLIM == "U"	
destring CITYLIM, replace 	
lab define CITYLIM1 0 "No" 1 "Yes" 9 "Unknown or not stated"	
lab val CITYLIM CITYLIM1
tab CITYLIM, mi		

lab var RECTYPE "Record Type"
lab def RECTYPE1 1 "Resident: State and county of occurrence and resident are the same" /// 
                 2 "Nonresident: State and county of occurrence and residence are different"
lab val RECTYPE RECTYPE1
tab RECTYPE, mi

lab var RESTATUS "Residence Status" 
// same numbers = different labels for US and US territories (US / US territory)
lab def RESTATUS1 1 "Resident" 2 "Intrastate/Intraterritory Nonresident" ///
		          3 "Interstate/Interterritory Resident" 4 "Foreign Resident"
lab val RESTATUS RESTATUS1 
tab RESTATUS, mi

// Mother Race 
lab var MBRACE "Mother's Bridged Race" 
// labels for Puerto Rico (000 = Other; 01 = White; 02 = Black)
lab def MBRACE1 01 "White" 02 "Black" 03 "American Indian" 04 "Asian Indian" ///
				05 "Chinese" 06 "Filipino" 07 "Japanese" 08 "Korean" 09 "Vietnamese" ///
				10 "Other Asian" 11 "Hawaiian" 12 "Guamanian" 13 "Samoan" ///
				14 "Other Pacific Islander" 21 "Bridged White" 22 "Bridged Black" ///
				23 "Bridged American Indian & Alaskan Native" ///
				24 "Bridged Asian / Pacific Islander" ///
				00 "Other (not classified as White or Black; Puerto Rico only)"
lab val MBRACE MBRACE1
tab MBRACE, mi			

lab var MRACE "Mother's Race" 
// labels for Puerto Rico (00 = Other races; 01 = White; 02 = Black)
// labels for Guam (01-07, 58 same as US; 08 = Other Asian or Pacific Islander)
// all other territories (01-07 same as US; 08 = Other Asian or Pacific Islander)
lab def MRACE1 01 "White" 02 "Black" 03 "American Indian or Alaskan Native" ///
			   04 "Chinese" 05 "Japanese" 06 "Hawaiian (includes part Hawaiian)" ///
			   07 "Filipino" 18 "Asian Indian" 28 "Korean" 38 "Samoan" ///
			   48 "Vietnamese" 58 "Guamanian" ///
			   68 "Other Asian or Pacific Islander in areas reporting codes 18-58" ///
			   78 "Combined other Asian or Pacific Islander, includes 18-68 for areas that do not report them separately" ///
			  00 "Other race (Puerto Rico Only)" ///
			  08 "Other Asian or Pacific Islander (Guam / Other Territories only)"
lab val MRACE MRACE1
tab MRACE, mi 			

lab var MRACEREC "Mother's Race Recode" 
// labels for Puerto Rico (0 = Other; 1 - White; 2 - Black)
lab def MRACEREC1 1 "White" 2 "Black" 3 "American Indian or Alaskan Native" ///
				  4 "Asian or Pacific Islander" /// 
				  0 "Other (not classified as White or Black; Puerto Rico Only)"
lab val MRACEREC MRACEREC1
tab MRACEREC, mi				  
				  
lab var MRACEIMP "Mother's Race Imputed" 
// missing = not imputed 
lab def MRACEIMP1 1 "Unknown race imputed" 2 "All other races, formerly coded 09, imputed" 				 
lab val MRACEIMP MRACEIMP1
tab MRACEIMP, mi				  
			 
// Mother Hispanic Origin 
// MHISP - no observations 

lab var UMHISP "Mother's Hispanic Origin (Unrevised)"
lab def UMHISP1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				4 "Central or South American" 5 "Other and Unknown Hispanic" ///
				9 "Origin unknown or not stated"
lab val UMHISP UMHISP1 
tab UMHISP, mi				

lab var MRACEHISP "Mother's Race/Hispanic Origin"
lab def MRACEHISP1 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				   4 "Central or South American" 5 "Other and Unknown Hispanic" ///
				   6 "Non-Hispanic White" 7 "Non-Hispanic Black" 8 "Non-Hispanic Other Races" ///
				   9 "Origin unknown or not stated"
lab val MRACEHISP MRACEHISP1 
tab MRACEHISP, mi

// Marital Status and Paternity
// MAR_E - no observations 
// MAR_G - no observations 

lab var MAR_P "Paternity Acknowledged" 
replace MAR_P = "1" if MAR_P == "Y"	
replace MAR_P = "0" if MAR_P == "N"	
replace MAR_P = "2" if MAR_P == "U"	
replace MAR_P = "9" if MAR_P == "X"	
destring MAR_P, replace 
lab def MAR_P1 0 "No" 1 "Yes" 2 "Unknown" 9 "Not Applicable"
lab val MAR_P MAR_P1 
tab MAR_P, mi

lab var MAR "Mother's Marital Status" 
// variable labels different for US / all Outlying Areas of the United States except Puerto Rico
// and for Puerto Rico (1 = same, 2 = US / PR, 3 = PR only; 9 = same)
lab def MAR1 1 "Yes" 2 "No / Unmarried parents living together" ///
			 3 "Unmarried parents not living together (Puerto Rico Only)" ///
			 9 "Unknown or not Stated"
lab val MAR MAR1
tab MAR, mi			 
			 
lab var MAR_IMP "Mother's Marital Status Imputed" 
lab def MAR_IMP1 1 "Marital Status imputed" // missing = not imputed 
lab val MAR_IMP MAR_IMP1
tab MAR_IMP, mi

// Mother Education 
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

// UMEDUC - no observations 
// MEDUC_REC - no observations 

lab var MEDUC_BYP "Mother's Education Bypass"
// missing = Bypass not used 
lab def MEDUC_BYP1 0 "Edit Passed" 1 "Edit failed, data queried and verified" ///
				   2 "Edit failed, data queried but not verified" 
tab MEDUC_BYP, mi			   
				   
// Father Birth and Age 
// DOBF_MM - no observations 
// DOBF_DD - no observations 

lab var DOBF_IMP "Father's Birth Day Imputed" 
lab def DOBF_IMP1 1 "Birth day imputed" // missing = not imputed 
lab val DOBF_IMP DOBF_IMP1 
tab DOBF_IMP, mi

// DOBF_YY - no observations 

lab var DOBF_BYP "Father's Birth Day Bypass" 
// missing = Bypass not used 
lab def DOBF_BYP1 0 "Edit Passed" 1 "Data Queried" 2 "Invalid Bypass Response"
lab val DOBF_BYP DOBF_BYP1 
tab DOBF_BYP, mi 

lab var FAGERPT_FLG "Father's Reported Age Used" 
lab def FAGERPT_FLG1 1 "Father's reported age used" // missing = not used 
lab val FAGERPT_FLG FAGERPT_FLG1
tab FAGERPT_FLG, mi

// FAGERPT - no observations 
// FAGECOMP - no observations 
// UFAGECOMP - no observations 

lab var FAGECOMB "Father's Combined Age (Revised)"
lab def FAGECOMB1 99 "Unknown or not stated"
lab val FAGECOMB FAGECOMB1
tab FAGECOMB, mi 

lab var UFAGECOMB "Father's Combined Age (Unrevised)"
lab def UFAGECOMB1 99 "Unknown or not stated"
lab val UFAGECOMB UFAGECOMB1
tab UFAGECOMB, mi

lab var FAGEREC11 "Father's Age Recode 11" 
lab def FAGEREC111 01 "Under 15 years" 02 "15-19 years" 03 "20-24 years" 04 "25-29 years" ///
                   05 "30-34 years" 06 "35-39 years" 07 "40-44 years" 08 "45-49 years" ///
				   09 "50-54 years" 10 "55-98 years" 11 "Not stated"
lab val FAGEREC11 FAGEREC111
tab FAGEREC11, mi   

// Father Race 
lab var FBRACE "Father's Bridged Race" 
// labels for Puerto Rico (000 = Other; 01 = White; 02 = Black; 99 = Unknown or not stated)
lab def FBRACE1 01 "White" 02 "Black" 03 "American Indian" 04 "Asian Indian" ///
				05 "Chinese" 06 "Filipino" 07 "Japanese" 08 "Korean" 09 "Vietnamese" ///
				10 "Other Asian" 11 "Hawaiian" 12 "Guamanian" 13 "Samoan" ///
				14 "Other Pacific Islander" 15 "Other" ///
				21 "Bridged White" 22 "Bridged Black" ///
				23 "Bridged American Indian & Alaskan Native" ///
				24 "Bridged Asian / Pacific Islander" ///
				99 "Unknown or not stated, also includes states not reporting multiple race" ///
				00 "Other (not classified as White or Black; Puerto Rico only)"
lab val FBRACE FBRACE1
tab FBRACE, mi		

lab var FRACEIMP "Father's Race Imputed"
lab def FRACEIMP1 3 "Father's race imputed" // missing - not imputed 
lab val FRACEIMP FRACEIMP1
tab FRACEIMP, mi

lab var FRACEREC "Father's Race Recode" 
// variable labels different for US / all Outlying Areas of the United States except Puerto Rico
// and for Puerto Rico (1,2,9 = same; 3,4 = US and non-PR territories only; 0 = PR only)
lab def FRACEREC1 1 "White" 2 "Black" 3 "American Indian or Alaskan Native" ///
				  4 "Asian or Pacific Islander" 9 "Unknown or not stated" ///
				  0 "Other (not classified as White or Black; Puerto Rico Only)"
lab val FRACEREC FRACEREC1
tab FRACEREC, mi


// Father Hispanic Origin 
// FHISP - no observations 

lab var UFHISP "Father's Hispanic Origin-Unrevised" 
lab def UFHISP1 0 "Non-Hispanic" 1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				4 "Central or South American" 5 "Other and Unknown Hispanic" ///
				9 "Origin unknown or not stated"
lab val UFHISP UFHISP1 
tab UFHISP, mi

lab var FRACEHISP "Father's Race/Hisp Origin"
lab def FRACEHISP1  1 "Mexican" 2 "Puerto Rican" 3 "Cuban" ///
				   4 "Central or South American" 5 "Other and Unknown Hispanic" ///
				   6 "Non-Hispanic White" 7 "Non-Hispanic Black" 8 "Non-Hispanic Other Races" ///
				   9 "Origin unknown or not stated"
lab val FRACEHISP FRACEHISP1 
tab FRACEHISP, mi 

// Father Education 
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

lab var FEDUC_BYP "Father's Education Bypass" 
// missing = Bypass not used 
lab def FEDUC_BYP1 0 "Edit passed" 1 "Edit failed, data queried and verified" ///
				   2 "Edit failed, data queried and not verified"  
tab FEDUC_BYP, mi			 
				   
// Father Race 
lab var UFRACE "Father's Race (Unrevised)"
// labels for Puerto Rico (00 = Other races; 01, 99 = same as US; 03 = Black)
// SUSPECT TYPO IN CODEBOOK (CODEBOOK SAYS 03 = BLACK; SUSPECT IT IS ACTUALLY O2 = BLACK)
// labels for Guam (01-07, 58, 99 same as US; 08 = Other Asian or Pacific Islander)
// labels for all other territories (01-07, 99 same as US; 08 = Other Asian or Pacific Islander)
lab def UFRACE1 01 "White" 02 "Black" 03 "American Indian & Alaskan Natives" /// 
				04 "Chinese" 05 "Japanese" 06 "Hawaiian (includes part Hawaiian)" /// 
				07 "Filipino" ///
				08 "Other Asian or Pacific Islander (Guam and All other territories only)" ///
				18 "Asian Indian" 28 "Korean" 38 "Samoan" ///
				48 "Vietnamese" 58 "Guamanian" ///
				68 "Other Asian or Pacific Islander in areas reporting codes 18-58" ///
				78 "Combined other Asian or Pacific Islander, includes 18-68 for areas that do not report them separately" /// 
				99 "Unknown or not stated" ///
				00 "Other races not classified white or black (Puerto Rico Only)"
lab val UFRACE UFRACE1
tab UFRACE, mi
 
// Prior Births 
// PRIORLIVE - no observations 
// PRIORDEAD - no observations 

lab var PRIORTERM "Prior Other Terminations"
lab def PRIORTERM1 99 "Unknown or not stated"
lab val PRIORTERM PRIORTERM1 
tab PRIORTERM, mi

// LBO - no observations 

lab var LBO_REC "Live Birth Order Recode"
lab def LBO_REC1 8 "8 or more live births" 9 "Unknown or not stated"
lab val LBO_REC LBO_REC1
tab LBO_REC, mi 

// TBO - no observations 

lab var TBO_REC "Total Birth Order Recode"
lab def TBO_REC1 8 "8 or more total births" 9 "Unknown or not stated"
lab val TBO_REC TBO_REC1 
tab TBO_REC, mi 

// DLLB_MM - no observations 
// DLLB_YY - no observations 
// DLOO_MM - no observations 
// DLOO_YY - no observations 
// ILLB - no observations 
// ILOO - no observations 
// ILP - no observations 

// Prenatal Care and Weight Gain
lab var ILPCV_DOB "Interval Between Last Prenatal Care Visit & Date of Delivery" 
lab def ILPCV_DOB1 98 "98 days and above" 99 "Unknown or not stated"
lab val ILPCV_DOB ILPCV_DOB1 
tab ILPCV_DOB, mi

lab var PRECARE "Month Prenatal Care Began (Revised)" 
lab def PRECARE1 00 "No prenatal care" 99 "Unknown or not stated"
lab val PRECARE PRECARE1
tab PRECARE, mi

lab var PRECARE_REC "Month Prenatal Care Began Recode (Revised)"
lab def PRECARE_REC1 1 "1st to 3rd month" 2 "4th to 6th month" ///
					 3 "7th to final month" 4 "No prenatal care" ///
					 5 "Unknown or not stated"
lab val PRECARE_REC PRECARE_REC1 
tab PRECARE_REC, mi 

// DFPC_MM - no observations 
// DFPC_DD - no observations 
// DFPC_YY - no observations 
// MPCB - no observations 
// MPCB_REC6 - no observations 
// MPCB_REC5 - no observations 					 
// DLPC_MM - no observations 
// DLPC_DD - no observations 					 
// DLPC_YY - no observations 					 
// PREVIS - no observations 

lab var UPREVIS "Number of Prenatal Visits (Unrevised)"					 
lab def UPREVIS1 99 "Unknown or not stated"
lab val UPREVIS UPREVIS1 
tab UPREVIS, mi				 
				
lab var PREVIS_REC "Number of Prenatal Visits Recode"			
lab def PREVIS_REC1 1 "No visits" 2 "1 to 2 visits" 3 "3 to 4 visits" ///
                    4 "5 to 6 visits" 5 "7 to 8 visits" 6 "9 to 10 visits" ///
				    7 "11 to 12 visits" 8 "13 to 14 visits" 9 "15 to 16 visits" ///
				    10 "17 to 18 visits" 11 "19 or more visits" 12 "Unknown or not stated"
lab val PREVIS_REC PREVIS_REC1
tab PREVIS_REC, mi				 
									 
lab var PREVIS_BYP "Prenatal Visits Bypass" 
// missing = Bypass not used 
lab def PREVIS_BYP1 0 "Edit passed" 1 "Edit failed, number verified" ///
					2 "Edit failed, number not verified"
tab PREVIS_BYP, mi	
					
// APNCU - no observations

lab var WTGAIN "Weight Gain"
lab def WTGAIN1 98 "98 pounds and over" 99 "Unknown or not stated" 
lab val WTGAIN WTGAIN1
tab WTGAIN, mi

lab var WTGAIN_REC "Weight Gain Recode"
lab def WTGAIN_REC1 1 "Less than 11 pounds" 2 "11 to 20 pounds" 3 "21 to 30 pounds" ///
                    4 "31 to 40 pounds" 5 "41 to 98 pounds" 9 "Unknown or not stated"
lab val WTGAIN_REC WTGAIN_REC1
tab WTGAIN_REC, mi
		 
lab var DFPC_IMP "Date First Prenatal Imputed"
lab def DFPC_IMP1 1 "Imputed" // missing = not imputed 
lab val DFPC_IMP DFPC_IMP1 
tab DFPC_IMP, mi
			
// WIC
lab var WIC "WIC"
replace WIC = "1" if WIC == "Y"
replace WIC = "0" if WIC == "N"
replace WIC = "9" if WIC == "U"
destring WIC, replace 
lab def WIC1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val WIC WIC1
tab WIC, mi 	

// Cigarette Use
lab var CIG_0 "Cigarettes Before Pregnancy" 

lab var CIG_1 "Cigarettes 1st Trimester" 

lab var CIG_2 "Cigarettes 2nd Trimester" 

lab var CIG_3 "Cigarettes 3rd Trimester" 

foreach c of varlist CIG_0 CIG_1 CIG_2 CIG_3 {
	lab def `c'1 98 "98 or more cigarettes daily" 99 "Unknown or not stated"
	lab val `c' `c'1
	tab `c', mi
}

// TOBUSE - no observations
// CIGS - no observations
// UCIG_REC6 - no observations

lab var CIG_REC "Cigarette Recode (Revised)"
replace CIG_REC = "1" if CIG_REC == "Y"
replace CIG_REC = "0" if CIG_REC == "N"
replace CIG_REC = "9" if CIG_REC == "U"
destring CIG_REC, replace 
lab def CIG_REC1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val CIG_REC CIG_REC1
tab CIG_REC, mi

// Mother Height and Weight 
// MHT_FT - no observations 
// MHT_IN - no observations 
// MHT_BYP - no observations 
// PWGT - no observations 

lab var PWGT_BYP "Prepregnancy Weight Bypass"
// missing = Bypass not used 
lab def PWGT_BYP1 0 "Edit passed" 1 "Edit failed, verified" /// 
				  2 "Edit failed, not verified"
lab val PWGT_BYP PWGT_BYP
tab PWGT_BYP, mi

// DWGT - no observations 

lab var DWGT_BYP "Delivery Weight Bypass"
// missing = Bypass not used 
lab def DWGT_BYP1 0 "Edit passed" 1 "Edit failed, verified" ///
				  2 "Edit failed, not verified"
lab val DWGT_BYP DWGT_BYP1 
tab DWGT_BYP, mi			  
				  
// Risk Factors  
lab var RF_DIAB "Prepregnancy Diabetes"

lab var RF_GEST "Gestational Diabetes"

lab var RF_PHYP "Prepregnancy Hypertension"

lab var RF_GHYP "Gestational Hypertension"

lab var RF_ECLAM "Hypertension Eclampsia"

lab var RF_PPTERM "Previous Preterm Birth"

lab var RF_PPOUTC "Poor Pregnancy Outcome"

lab var RF_INFTR "Infertility Treatment"

foreach x of varlist RF_DIAB RF_GEST RF_PHYP RF_GHYP RF_ECLAM RF_PPTERM RF_PPOUTC RF_INFTR {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 
		
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

lab var RF_CESAR "Previous Cesareans"
replace RF_CESAR = "1" if RF_CESAR == "Y"
replace RF_CESAR = "0" if RF_CESAR == "N"
replace RF_CESAR = "9" if RF_CESAR == "U"
destring RF_CESAR, replace 
lab def RF_CESAR1 0 "No" 1 "Yes" 9 "Unknown or not stated"
lab val RF_CESAR RF_CESAR1
tab RF_CESAR, mi 

lab var RF_CESARN "Previous Cesareans Num" 
lab def RF_CESARN1 00 "None" 99 "Unknown or not stated"
lab val RF_CESARN RF_CESARN1 
tab RF_CESARN, mi
				  
lab var RF_CES_BYP "Cesarean Bypass" 
// missing = Bypass not used 
lab def RF_CES_BYP1 0 "Edit passed" 1 "Edit failed, verified" ///
					2 "Invalid response"	
lab val RF_CES_BYP RF_CES_BYP1 
tab RF_CES_BYP, mi				
				  
// Risk Factors (Unrevised) 
lab var URF_DIAB "Diabetes" 

lab var URF_CHYPER "Chronic Hypertension" 

lab var URF_PHYPER "Prepregnancy Associated Hypertension"

lab var URF_ECLAM "Eclampsia" 

foreach x of varlist URF_DIAB URF_CHYPER URF_PHYPER URF_ECLAM {

	lab def `x' 1 "Yes" 2 "No" 9 "Unknown"
    lab val `x' `x'
	tab `x', mi 
}

// Infections Present
lab var IP_GONN "Gonorrhea" 

lab var IP_SYPH "Syphilis" 

// IP_HSV - no observations

lab var IP_CHLAM "Chlamydia"

lab var IP_HEPB "Hepatitis B"

lab var IP_HEPC "Hepatitis C"

foreach x of varlist IP_GONN IP_SYPH IP_CHLAM IP_HEPB IP_HEPC { 
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

// Obstetric Procedures 
lab var OP_CERV "Cervical Cerclage"

lab var OP_TOCOL "Tocolysis"

lab var OP_ECVS "Successful External Cephalic Version"

lab var OP_ECVF "Failed External Cephalic Version"

foreach x of varlist OP_CERV OP_TOCOL OP_ECVS OP_ECVF {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 

// Obstetric Procedures (Unrevised)
lab var UOP_INDUC "Induction of Labor" 

lab var UOP_TOCOL "Tocolysis "

foreach x of varlist UOP_INDUC UOP_TOCOL {
	lab def `x' 1 "Yes" 2 "No" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 

// Onset of Labor 
lab var ON_RUPTR "Premature Rupture of Membrane" 

lab var ON_PRECIP "Precipitous Labor"

lab var ON_PROL "Prolonged Labor"

foreach x of varlist ON_RUPTR ON_PRECIP ON_PROL { 
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

// Characteristics of Labor and Delivery 
lab var LD_INDL "Induction of Labor"

lab var LD_AUGM "Augmentation of Labor"

// LD_NVPR - no observations

lab var LD_STER "Steroids"

lab var LD_ANTI "Antibiotics"

lab var LD_CHOR "Chorioamnionitis"

lab var LD_MECS "Meconium Staining"

lab var LD_FINT "Fetal Intolerance"

lab var LD_ANES "Anesthesia"

foreach x of varlist LD_INDL LD_AUGM LD_STER LD_ANTI LD_CHOR LD_MECS LD_FINT LD_ANES { 
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

// Complications of Labor and Delivery (Unrevised)
lab var ULD_MECO "Meconium"

lab var ULD_PRECIP "Precipitous Labor"

lab var ULD_BREECH "Breech"

foreach x of varlist ULD_MECO ULD_PRECIP ULD_BREECH {
	lab def `x' 1 "Yes" 2 "No" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 

// Method of Delivery (Revised)  
// ME_ATTF - no observations 
// ME_ATTV - no observations 

lab var ME_PRES "Fetal Presentation"
lab def ME_PRES1 1 "Cephalic" 2 "Breech" 3 "Other" 9 "Unknown or not stated"
lab val ME_PRES ME_PRES1
tab ME_PRES, mi

lab var ME_ROUT "Route & Method of Delivery" 
lab def ME_ROUT1 1 "Spontaneous" 2 "Forceps" 3 "Vacuum" 4 "Cesarean" 9 "Unknown or not stated"
lab val ME_ROUT ME_ROUT1 
tab ME_ROUT, mi

lab var ME_TRIAL "Trial of Labor Attempted" 
replace ME_TRIAL = "1" if ME_TRIAL == "Y"
replace ME_TRIAL = "0" if ME_TRIAL == "N"
replace ME_TRIAL = "8" if ME_TRIAL == "X"
replace ME_TRIAL = "9" if ME_TRIAL == "U"
destring ME_TRIAL, replace 
lab def ME_TRIAL1 0 "No" 1 "Yes" 8 "Not applicable" 9 "Unknown or not stated"
lab val ME_TRIAL ME_TRIAL1
tab ME_TRIAL, mi 

// Method of Delivery (unrevised)
// UME_VAG - no observations 
// UME_VBAC - no observations 
// UME_PRIMC - no observations 
// UME_REPEC - no observations 

lab var UME_FORCP "Forceps"

lab var UME_VAC "Vacuum"

foreach x of varlist UME_FORCP UME_VAC {
	lab def `x' 1 "Yes" 2 "No" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
} 

// Method of Delivery
lab var RDMETH_REC "Delivery Method Recode (Revised)"
lab def RDMETH_REC1 1 "Vaginal (excludes vaginal after previous C-section)" ///
                    2 "Vaginal after previous c-section" ///
					3 "Primary C-section" ///
					4 "Repeat C-section" ///
					5 "Vaginal (unknown if previous c-section) (2003 Standard only)" ///
					6 "C-section (unknown if previous c-section) (2003 Standard only)" ///
					9 "Not stated"
lab val RDMETH_REC RDMETH_REC1
tab RDMETH_REC, mi	

// UDMETH_REC - no observations 

// DMETH_REC - has no provided label in codebook 
lab def DMETH_REC1 1 "Vaginal" 2 "C-Section" 9 "Unknown"
lab val DMETH_REC DMETH_REC1 
tab DMETH_REC, mi 

// Maternal Morbidity 
lab var MM_MTR "Maternal Transfusion"

lab var MM_PLAC "Perineal Laceration"

lab var MM_RUPT "Ruptured Uterus"

lab var MM_UHYST "Unplanned Hysterectomy"

lab var MM_ICU "Admit to Intensive Care"

lab var MM_UOPER "Unplanned Operation" 

foreach x of varlist MM_MTR MM_PLAC MM_RUPT MM_UHYST MM_ICU MM_UOPER { 
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

// Hospital / Payment 
lab var ATTEND "Attendant"
lab def ATTEND1 1 "Doctor of Medicine (MD)" 2 "Doctor of Osteopathy (DO)" ///
                3 "Certified Nurse Midwife (CNM)" 4 "Other Midwife" ///
				5 "Other" 9 "Unknown or not stated"
lab val ATTEND ATTEND1
tab ATTEND, mi 

lab var MTRAN "Mother Transferred"
replace MTRAN = "1" if MTRAN == "Y"
replace MTRAN = "0" if MTRAN == "N"
replace MTRAN = "9" if MTRAN == "U"
destring MTRAN, replace 
lab def MTRAN1 0 "No" 1 "Yes" 9 "Unknown"
lab val MTRAN MTRAN1
tab MTRAN, mi 

lab var PAY "Payment Source"
lab def PAY1 1 "Medicaid" 2 "Private Insurance" 3 "Self-Pay" 4 "Indian Health Service" ///
             5 "CHAMPUS/TRICARE" 6 "Other Government (Federal, State, Local)" ///
			 8 "Other" 9 "Unknown"
lab val PAY PAY1
tab PAY, mi

lab var PAY_REC "Payment Recode" 
lab def PAY_REC1 1 "Medicaid" 2 "Private Insurance" 3 "Self Pay" 4 "Other" 9 "Unknown"
lab val PAY_REC PAY_REC1
tab PAY_REC, mi

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

lab var APGAR10 "Ten Minute APGAR Score" 
lab def APGAR101 88 "Not applicable" 99 "Unknown or not stated"
lab val APGAR10 APGAR101 
tab APGAR10, mi

lab var APGAR10R "Ten Minute APGAR Score Recode" 
lab def APGAR10R1 1 "A score of 0-3" 2 "A score of 4-6" 3 "A score of 7-8" ///
                  4 "A score of 9-10" 5 "Not stated/not applicable"
lab val APGAR10R APGAR10R1
tab APGAR10R, mi 

// Plurality 
// PLURAL - no observations 

lab var DPLURAL "Plurality Recode"
lab def DPLURAL1 1 "Single" 2 "Twin" 3 "Triplet" 4 "Quadruplet" 5 "Quintuplet or higher"
lab val DPLURAL DPLURAL1
tab DPLURAL, mi

lab var PLUR_BYP "Plurality Bypass"
// missing = Bypass not used
lab def PLUR_BYP1 0 "Edit passed" 1 "Queried and correct" ///
				  2 "Plurality / set order queried" 
lab val PLUR_BYP PLUR_BYP1
tab PLUR_BYP, mi

lab var IMP_PLUR  "Plurality Imputed"
lab def IMP_PLUR1 1 "Plurality is not imputed" // missing = imputed 
lab val IMP_PLUR IMP_PLUR1 
tab IMP_PLUR, mi

// SETORDER - no observations
// LIVEBORN - no observations 
// MATCH - no observations 

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

// DLMP_DD - no observations 

lab var DLMP_YY "Last Normal Menses Year" 
lab def DLMP_YY1 9999 "Unknown or not stated"
lab val DLMP_YY DLMP_YY1
tab DLMP_YY, mi

// Gestation 
lab var ESTGEST "Obstetric Gestation Est. (A) / Clinical Gestation Est. (S)"
// A: 0-98 Reported Obstetric estimate of gestation 
// S: 17-47 Accepted range of Clinical estimate of gestation
lab def ESTGEST1 99 "Unknown or not stated"
lab val ESTGEST ESTGEST1 
tab ESTGEST, mi

lab var OBGEST_BYP  "Obstetric Gestation Bypass"
// missing = Not Reported 
lab def OBGEST_BYP1 0 "Edit passed" 1 "Queried data correct, out of range" 
lab val OBGEST_BYP OBGEST_BYP1 
tab OBGEST_BYP, mi 				

// COMPGEST  - no observations 

lab var COMBGEST "Gestation – Detail in Weeks "
lab def COMBGEST1 99 "Unknown" 
lab val COMBGEST COMBGEST1 
tab COMBGEST, mi

lab var GESTREC10 "Gestation Recode 10"
lab def GESTREC101 1 "Under 20 weeks" 2 "20-27 weeks" 3 "28-31 weeks"  ///
				   4 "32-33 weeks" 5 "34-36 weeks" 6 "37-38 weeks" ///
				   7 "39 weeks" 8 "40 weeks" 9 "41 weeks" 10 "42 weeks and over" ///
				   99 "Unknown"
lab val GESTREC10 GESTREC101
tab GESTREC10, mi
 
lab var GESTREC3 "Gestation Recode 3" 
lab def GESTREC31 1 "Under 37 weeks" 2 "37 weeks and over" 3 "Not stated"
lab val GESTREC3 GESTREC31
tab GESTREC3, mi

lab var OBGEST_FLG "Clinical Estimate of Gestation Used Flag"
lab def OBGEST_FLG1 1 "Clinical Estimate is used" // missing = not used 
lab val OBGEST_FLG OBGEST_FLG1 
tab OBGEST_FLG, mi

lab var GEST_IMP "Gestation Imputed Flag"
lab def GEST_IMP1 1 "Gestation is imputed" // missing = not imputed 
lab val GEST_IMP GEST_IMP1 
tab GEST_IMP, mi 

lab var COMPGST_IMP "Computed Gestation Imputation Flag"
lab def COMPGST_IMP1 1 "Computed Gestation is imputed" // missing = not imputed 
lab val COMPGST_IMP COMPGST_IMP1 
tab COMPGST_IMP, mi

// Birth Weight
// BWT - no observations 

lab var DBWT "Birth Weight – Detail in Grams (Edited)"
lab def DBWT1 9999 "Not started birth weight"
lab val DBWT DBWT1 
tab DBWT, mi 

// BRTHWGT - no observations 

lab var BWTR12 "Birth Weight Recode 12"
lab def BWTR121 1 "0227-0499 grams" 2 "0500 - 0999 grams" 3 "1000 - 1499 grams" ///
			    4 "1500 - 1999 grams" 5 "2000 - 2499 grams" 6 "2500 - 2999 grams" ///
				7 "3000 - 3499 grams" 8 "3500 - 3999 grams" 9 "4000 - 4499 grams" ///
				10 "4500 - 4999 grams" 11 "5000 - 8165 grams" 12 "Not Stated"
lab val BWTR12 BWTR121
tab BWTR12, mi

lab var BWTR4  "Birth Weight Recode 4"
lab def BWTR41 1 "0227-1499 grams" 2 "1500-2499 grams" 3 "2500-8165 grams" ///
			   4 "Unknown or not stated"
lab val BWTR4 BWTR41
tab BWTR4, mi	

lab var BWT_BYP  "Birth Weight Bypass" 
// missing - Bypass not used
lab def BWT_BYP1 0 "Edit passed" 1 "Queried data correct, out of range" /// 
				 2 "Queried, failed birth weight / gestation edit"
lab val BWT_BYP BWT_BYP1 
tab BWT_BYP, mi 			

lab var BWTIMP "Imputed Birth Weight Flag"
lab def BWTIMP1 1 "Birth Weight is imputed" // missing = not imputed  
lab val BWTIMP BWTIMP1 
tab BWTIMP, mi 

// Abnormal Conditions of the Newborn 
lab var AB_AVEN1 "Assisted Ventilation"

lab var AB_AVEN6 "Assisted Ventilation > 6 hrs"

lab var AB_NICU "Admission to NICU"

lab var AB_SURF "Surfactant"

lab var AB_ANTI  "Antibiotics"

lab var AB_SEIZ  "Seizures"

lab var AB_BINJ  "Birth Injury"

foreach a of varlist AB_AVEN1 AB_AVEN6 AB_NICU AB_SURF AB_ANTI AB_SEIZ AB_BINJ {
	replace `a' = "1" if `a' == "Y"
	replace `a' = "0" if `a' == "N"
    replace `a' = "9" if `a' == "U"
	destring `a', replace
	lab def `a' 1 "Yes, Complication reported" 0 "No Complication reported" ///
				9 "Unknown or not stated"
    lab val `a' `a'
	tab `a', mi 
} 

// Congenital Anomalies of the Newborn 
lab var CA_ANEN "Anencephaly"

lab var CA_MNSB "Meningomyelocele / Spina Bifida"

lab var CA_CCHD "Cyanotic Congenital Heart Disease"

lab var CA_CDH "Congenital Diaphragmatic Hernia"

lab var CA_OMPH "Omphalocele"

lab var CA_GAST "Gastroschisis"

lab var CA_LIMB "Limb Reduction Defect"

lab var CA_CLEFT "Cleft Lip w/ or w/o Cleft Palate"

lab var CA_CLPAL "Cleft Palate alone"

foreach c of varlist CA_ANEN CA_MNSB CA_CCHD CA_CDH CA_OMPH CA_GAST CA_LIMB CA_CLEFT CA_CLPAL {
	replace `c' = "1" if `c' == "Y"
	replace `c' = "0" if `c' == "N"
    replace `c' = "9" if `c' == "U"
	destring `c', replace
	lab def `c' 1 "Yes, anomaly reported" 0 "No, anomaly not reported" ///
				9 "Unknown or not stated"
    lab val `c' `c'
	tab `c', mi 
} 

lab var CA_DOWN "Down Syndrome"

lab var CA_DISOR "Suspected Chromosomal Disorder"

foreach c of varlist CA_DOWN CA_DISOR {
	replace `c' = "1" if `c' == "C"
	replace `c' = "2" if `c' == "P"
	replace `c' = "3" if `c' == "N"
    replace `c' = "9" if `c' == "U"
	destring `c', replace
	lab def `c' 1 "Confirmed" 2 "Pending" 3 "No" 9 "Unknown"
    lab val `c' `c'
	tab `c', mi 
} 

lab var CA_HYPO "Hypospadias"
replace CA_HYPO = "1" if CA_HYPO == "Y"
replace CA_HYPO = "0" if CA_HYPO == "N"
replace CA_HYPO = "9" if CA_HYPO == "U"
destring CA_HYPO, replace
lab def CA_HYPO1 1 "Yes, anomaly reported" 0 "No, anomaly not reported" ///
			    9 "Unknown or not stated"
lab val CA_HYPO CA_HYPO1
tab CA_HYPO, mi 

// Congenital Anomalies of the Newborn 
lab var UCA_ANEN "Anencephalus"

lab var UCA_SPINA "Spina Bifida / Meningocele"

lab var UCA_OMPHA "Omphalocele / Gastroschisis"

lab var UCA_CLEFTLP "Cleft Lip / Palate"

lab var UCA_HERNIA "Diaphragmatic Hernia"

lab var UCA_DOWNS "Down Syndrome"

foreach x of varlist UCA_ANEN  UCA_SPINA UCA_OMPHA UCA_CLEFTLP UCA_HERNIA UCA_DOWNS { 
	lab def `x' 1 "Anomaly reported" 2 "Anomaly not reported" 9 "Anomaly not classifiable"
    lab val `x' `x'
	tab `x', mi 
}

// Infant 
lab var ITRAN "Infant Transferred"

lab var ILIVE "Infant Living at Time of Report"

lab var BFED "Infant Being Breastfed"

foreach x of varlist ITRAN ILIVE BFED {
	replace `x' = "1" if `x' == "Y"
	replace `x' = "0" if `x' == "N"
    replace `x' = "9" if `x' == "U"
	destring `x', replace 
	lab def `x' 0 "No" 1 "Yes" 9 "Unknown or not stated"
    lab val `x' `x'
	tab `x', mi 
}

// Body Mass Index 
// BMI - codebook inconsistent with the tabulation of the variable 

// typo in codebook: "Obesity I 35.0-39.9"
lab var BMI_R "Body Mass Index Recode"
lab def BMI_R1 1 "Underweight <18.5" 2 "Normal 18.5-24.9" 3 "Overweight 25.0-29.9" ///
               4 "Obesity I 30.0-34.9" 5 "Obesity II 35.0-39.9" ///
			   6 "Extreme Obesity III ≥ 40.0" 9 "Unknown or not stated"
lab val BMI_R BMI_R1 
tab BMI_R, mi 

// Births
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

lab var ILOP_R "Interval of Last Other Pregnancy" 
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

lab var ILP "Interval of Last Pregnancy"
// 000-003 Plural delivery, 004-3000 months since last live birth
lab def ILP1 888 "Not applicable / no previous pregnancy" 999 "Unknown or not stated" 
lab val ILP ILP1
tab ILP, mi 

lab var ILP_R11 "Interval of Last Pregnancy Recode 11"
// label defining code below commented out because of likely typo in codebook
/*lab def ILP_R111  0 "Zero to 3 months (plural delivery)" 1 "4 to 11 months" ///
                  00 "12 to 17 months" 1 "18 to 23 months" 2 "24 to 35 months" ///
				  3 "36 to 47 months" 4 "48 to 59 months" 5 "60 to 71 months" /// 
				  6 "72 months and over" 88 "Not applicable (no previous pregnancy)" ///
				  99 "Unknown or not stated" 
lab val ILP_R11	ILP_R111 */ 
tab ILP_R11, mi	   

// Mother Height and Weight 
lab var PWgt_R "Pre-pregnancy Weight Recode" 
lab def PWgt_R1 999 "Unknown or not stated"
lab val PWgt_R PWgt_R1 
tab PWgt_R, mi 

lab var DWgt_R "Delivery Weight Recode"
lab def DWgt_R1 999 "Unknown or not stated"
lab val DWgt_R DWgt_R1 
tab DWgt_R, mi 

lab var M_Ht_In "Mother's Height in Inches"
lab def M_Ht_In1 99 "Unknown or not stated"
lab val M_Ht_In M_Ht_In1 
tab M_Ht_In, mi

// Birth Order 
lab var SetOrder_R "Set Order Recode"
lab def SetOrder_R1 1 "1st" 2 "2nd" 3 "3rd" 4 "4th" 5 "5th to 16th" 9 "Unknown or not stated"
lab val SetOrder_R SetOrder_R1 
tab SetOrder_R, mi

// LiveBorn_R - no observations 

// Flag File for Reporting 
lab var F_MORIGIN "Origin of Mother"

lab var F_FORIGIN "Origin of Father"

lab var F_MEDUC "Education of Mother"

lab var F_FEDUC "Education of Father"

lab var F_CLINEST "Clinical Estimate of Gestation"

lab var F_APGAR5 "Five minute APGAR"

lab var F_TOBACO "Tobacco use"

lab var F_M_HT "Mother's Height"

lab var F_PWGT "Prepregnancy Weight"

lab var F_DWGT "Weight at Delivery"

lab var F_WIC "WIC"

lab var F_PAY "Source of Payment"

lab var F_BFED "Breastfed at Discharge"

lab var F_RF_PDIAB "Prepregnancy Diabetes"

lab var F_RF_GDIAB "Gestational Diabetes"

lab var F_RF_PHYPER "Prepregnancy Hypertension"

lab var F_RF_GHYPER "Gestational Hypertension"

lab var F_RF_ECLAMP "Hypertension Eclampsia"

lab var F_RF_PPB "Previous Preterm Birth"

lab var F_RF_PPO "Poor Pregnancy outcomes"

lab var F_RF_INFT "Infertility Treatment"

lab var F_RF_INFT_DRG "Fertility Enhance Drugs"

lab var F_RF_INF_ART "Reproductive Technology"

lab var F_RF_CESAR "Previous Cesarean"

lab var F_RF_NCESAR "Number of Previous Cesareans"

lab var F_IP_GONOR "Gonorrhea"

lab var F_IP_SYPH "Syphilis"

// F_IP_HSV - no observations

lab var F_IP_CHLAM "Chlamydia"

lab var F_IP_HEPATB "Hepatitis B"

lab var F_IP_HEPATC "Hepatitis C"

lab var F_OB_CERVIC "Cervical Cerclage"

lab var F_OB_TOCO "Tocolysis"

lab var F_OB_SUCC "Successful External Cephalic Version"

lab var F_OB_FAIL "Failed External Cephalic Version"

lab var F_OL_RUPTURE "Premature Rupture of the Membranes"

lab var F_OL_PRECIP "Precipitous Labor"

lab var F_OL_PROLONG "Prolonged Labor"

lab var F_LD_INDUCT "Induction of Labor"

lab var F_LD_AUGMENT "Augmentation of Labor"

lab var F_LD_STERIODS "Steroids"

lab var F_LD_ANTIBIO "Antibiotics"

lab var F_LD_CHORIO "Chorioamnionitis"

lab var F_LD_MECON "Meconium Staining"

lab var F_LD_FINTOL "Fetal Intolerance"

lab var F_LD_ANESTH "Anesthesia"

lab var F_MD_PRESENT "Fetal Presentation"

lab var F_MD_ROUTE "Final Route and Method of Delivery"

lab var F_MD_TRIAL "Trial of Labor Attempted"

lab var F_MM_MTRANS "Maternal Transfusion"

lab var F_MM_LACER "Perineal Laceration"

lab var F_MM_RUPTUR "Ruptured Uterus"

lab var F_MM_UHYSTR "Unplanned Hysterectomy"

lab var F_MM_ICU "Admission to Intensive Care"

lab var F_MM_OR "Unplanned Operating Room Procedure"

lab var F_AB_VENT "Assisted Ventilation"

lab var F_AB_VENT6 "Assisted Ventilation >6 hr"

lab var F_AB_NICU "Admission to NICU"

lab var F_AB_SURFAC "Surfactant"

lab var F_AB_ANTIBIO "Antibiotics"

lab var F_AB_SEIZ "Seizures"

lab var F_AB_INJ "Birth Injury"

lab var F_CA_ANEN "Anencephaly"

lab var F_CA_MENIN "Meningomyelocele/Spina Bifida"

lab var F_CA_HEART "Cyanotic Congenital Heart Disease"

lab var F_CA_HERNIA "Congenital Diaphragmatic Hernia"

lab var F_CA_OMPHA "Omphalocele"

lab var F_CA_GASTRO "Gastroschisis"

lab var F_CA_LIMB "Limb Reduction Defect"

lab var F_CA_CLEFTLP "Cleft Lip with or without Cleft Palate "

lab var F_CA_CLEFT "Cleft Palate Alone"

lab var F_CA_DOWNS "Down Syndrome"

lab var F_CA_CHROM "Suspected Chromosomal Disorder"

lab var F_CA_HYPOS "Hypospadias"

// F_MED - no observations

lab var F_WTGAIN "Weight Gain"

// F_API - no observations 

// F_MAR_E - no observations

lab var F_MAR_G "Mother's Marital Status (Revised)"

// F_MAR_P - no observations

// F_LIVEB - no observations

// F_DOBMBYP - no observations

// F_MEDBYP - no observations

// F_DOBFBYP - no observations

// F_FEDBYP - no observations

// F_TPCVBYP - no observations

// F_MHTBYP - no observations

// F_PWGTBYP - no observations

// F_DWGTBYP - no observations 

// F_CESARBYP - no observations 

// F_PLURBYP - no observations 

// F_OBGESTBYP - no observations 

// F_BWTBYP - no observations 

// F_TOBAC - no observations 

lab var F_MPCB "Month Prenatal Care Began"

// F_MPCB_U - no observations 

// F_CMBGST - no observations 

lab var F_TPCV	"Total Prenatal Care Visit"

lab var F_CIGS_0 "Cigarettes before Pregnancy"

lab var F_CIGS_1 "Cigarettes 1st Trimester"

lab var F_CIGS_2 "Cigarettes 2nd Trimester"

lab var F_CIGS_3 "Cigarettes 3rd Trimester"

lab var F_FACILITY "Birth Place (Revised)"

lab var F_LIMIT	 "City Limits"

lab var F_PAY_REC "Payment Recode"

lab var F_RDMETH_REC "Method of Delivery Recode"

// F_UDMETH_REC - no observations 

lab var F_URF_DIABETES "Diabetes Flag (Unrevised)"

lab var F_URF_CHYPER "Chron Hyper Flag (Unrevised)"

lab var F_URF_PHYPER  "Prep Hyper Flag (Unrevised)"

lab var F_URF_ECLAMP  "Eclampsia Flag (Unrevised)"

// F_APGAR10 - no observations 

// F_DFPC - no observations 

// F_DLPC - no observations

lab var F_UOB_INDUCT  "Induction Flag (Unrevised)"

lab var F_UOB_TOCOL  "Tocolysis Flag (Unrevised)"

// F_MTRAN - no observations          

lab var F_ULD_MECONIUM  "Meconium Flag (Unrevised)"

lab var F_ULD_PRECIP "Precip Flag (Unrevised)"

lab var F_ULD_BREECH "Breech Flag (Unrevised)"

// F_U_VAGINAL - no observations 

// F_U_VBAC - no observations 

// F_U_PRIMAC - no observations 

// F_U_REPEAC - no observations 

lab var F_U_FORCEP "Forceps Flag (Unrevised)"

lab var F_U_VACUUM "Vacuum Flag (Unrevised)"

lab var F_UCA_ANEN  "Anen Flag (Unrevised)"

lab var F_UCA_SPINA  "Spina Bifita Flag (Unrevised)"

lab var F_UCA_OMPHALO  "Omphalo Flag (Unrevised)"

lab var F_UCA_CLEFTLP "Cleft Lip Flag (Unrevised)"

lab var F_UCA_HERNIA "Hernia flag (Unrevised)"

lab var F_UCA_DOWNS "Downs Syndrome Flag (Unrevised)"

foreach f of varlist F_MORIGIN F_FORIGIN F_MEDUC F_FEDUC F_CLINEST F_APGAR5 F_TOBACO F_M_HT F_PWGT F_DWGT F_WIC F_PAY F_BFED F_RF_PDIAB F_RF_GDIAB F_RF_PHYPER F_RF_GHYPER F_RF_ECLAMP F_RF_PPB F_RF_PPO F_RF_INFT F_RF_INFT_DRG F_RF_INF_ART F_RF_CESAR F_RF_NCESAR F_IP_GONOR F_IP_SYPH F_IP_CHLAM F_IP_HEPATB F_IP_HEPATC F_OB_CERVIC F_OB_TOCO F_OB_SUCC F_OB_FAIL F_OL_RUPTURE F_OL_PRECIP F_OL_PROLONG F_LD_INDUCT F_LD_AUGMENT F_LD_STERIODS F_LD_ANTIBIO F_LD_CHORIO F_LD_MECON F_LD_FINTOL F_LD_ANESTH F_MD_PRESENT F_MD_ROUTE F_MD_TRIAL F_MM_MTRANS F_MM_LACER F_MM_RUPTUR F_MM_UHYSTR F_MM_ICU F_MM_OR F_AB_VENT F_AB_VENT6 F_AB_NICU F_AB_SURFAC F_AB_ANTIBIO F_AB_SEIZ F_AB_INJ F_CA_ANEN F_CA_MENIN F_CA_HEART F_CA_HERNIA F_CA_OMPHA F_CA_GASTRO F_CA_LIMB F_CA_CLEFTLP F_CA_CLEFT F_CA_DOWNS F_CA_CHROM F_CA_HYPOS F_WTGAIN F_MAR_G F_MPCB F_TPCV F_CIGS_0 F_CIGS_1 F_CIGS_2 F_CIGS_3 F_FACILITY F_LIMIT F_PAY_REC F_RDMETH_REC F_URF_DIABETES F_URF_CHYPER F_URF_PHYPER F_URF_ECLAMP F_UOB_INDUCT F_UOB_TOCOL F_ULD_MECONIUM F_ULD_PRECIP F_ULD_BREECH F_U_FORCEP F_U_VACUUM F_UCA_ANEN F_UCA_SPINA F_UCA_OMPHALO F_UCA_CLEFTLP F_UCA_HERNIA F_UCA_DOWNS {
	lab def `f' 0 "Not reporting" 1 "Reporting"
	lab val `f' `f'
	tab `f', mi
}


// Occ - no observations 
// CutNumber - no observations 
// RunNumber - no observations 

// Mother's Race 

// MRACE1 - MRACE23 - no observations 

// Mother's Race Edited 

// MRACE1E - MRACE8E - nonmissing, no variable labels 
// 100-999 Mother's Race Edited Code 
// A00 - R99 

// Mother's Race Coded 
// MRACE16C - MRACE23C - no observations 

// Mother's Hispanic Race Checkbox 

// variables starting with MHSPCBX_ - no observations

// MHISPL - no observations 

// METHNIC - no observations 

// METHNIC5C - no observations 

// Father's Race 

// Father's Race Checkbox 

// FRACE1-FRACE23 - no observations 

// Father's Race Edited 

// FRACE1E - FRACE8E - nonmissing, no variable labels 
// 100-999 Father's Race Edited Code 
// A00 - R99 

// FRACE16C - FRACE23C - no observations 

// Father's Hispanic Race Checkbox

// variables starting with FHSPCBX_ - no observations 

// FHISPL - no observations 

// FETHNIC - no observations 

// FETHNIC5C - no observations 

** The following line should contain the path to your output '.dta' (labeled) file ;

save "/FILEPATH/Clean Stata Data/RestrictedVitalStatistics_Natality_2010_Labeled.dta", replace 

 







