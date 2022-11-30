### Florencia Torche
### Stanford University


In the United States, State laws require birth certificates to be completed for all births, and Federal law mandates national collection and publication of births and other vital statistics data. The National Vital Statistics System, the Federal compilation of this data, is the result of the cooperation between the National Center for Health Statistics (NCHS) and the states to provide access to statistical information from birth certificates.

The National Center for Health Statistics makes annual natality micro-data datasets including all births occurring in a given calendar year within the United States [publicly available](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm). The data are based on information abstracted from birth certificates filed in vital statistics offices of each State and District of Columbia. 

Since 2005, publicly available national vital statistics micro-data files that include state, county, or larger city geography are no longer available without approval. This restriction was established to preserve confidentiality. The data in the restricted files with geography information are at such a level of detail that open access to the public is not appropriate.

Restricted-access annual natality datasets with state, county and geography information are provided to researchers upon request by the NCHS in text format. Researchers interested in obtaining these data should contact the [National Center for Health Statistics](https://www.cdc.gov/nchs/nvss/nvss-restricted-data.htm#:~:text=Conditions%20of%20Use%20for%20Restricted%20Data,-Once%20researchers%20have&text=The%20data%20files%20cannot%20be,in%20the%20data%20use%20agreement.). The restricted-access datasets do not include a dictionary to read the data into standard statistical software or to label variables and variable categories. 

As a service to the research community, we are making available the stata and R code to read restricted-access datasets with state, county, and geographic information. This code is similar to the code used for public-access natality data provided by the [NBER natality data](https://www.nber.org/research/data/vital-statistics-birth-data-nber), but it includes variables capturing state, county and geography. It also includes value labels for all variables. 

We currently provide code to read restricted-access natality data into stata and R for years 2015 to 2019. We will keep expanding this resource, adding natality data for prior and more current years. 

We acknowledge funding from the Russell Sage Foundation. Website created by Amy Johnson.

Please note that these files might include typos and errors. If you use them and find errors, please contact Hye Jee Kim (hyejk@stanford.edu).

If you use the files, we suggest the following citation:
 
Stata files:
> Kim, Hye Jee and Florencia Torche. 2022 “Code for Reading Restricted Access Natality Data into Stata and Assigning Variable and Value Labels, Year(s) [XXXX-YYYY]” Stanford University, Department of Sociology. https://florenciatorche.github.io/ReadNatalityData/ Accessed on [ZZZZ].
 
R files: 
> Kim, Hye Jee and Florencia Torche. 2022 “Code for Reading Restricted Access Natality Data into R and Assigning Variable and Value Labels, Year(s) [XXXX-YYYY]” Stanford University, Department of Sociology. https://florenciatorche.github.io/ReadNatalityData/ Accessed on [ZZZZ].


--------

| Stata do files | R scripts |
| -------------- | -------------- |
| [2010](StataDoFiles/RestrictedVitalStatistics_Natality_2010.do) | [2010](RScripts/RestrictedVitalStatistics_Natality_2010.R) |
| [2011](StataDoFiles/RestrictedVitalStatistics_Natality_2011.do) | [2011](RScripts/RestrictedVitalStatistics_Natality_2011.R) |
| [2012](StataDoFiles/RestrictedVitalStatistics_Natality_2012.do) | [2012](RScripts/RestrictedVitalStatistics_Natality_2012.R) |
| [2013](StataDoFiles/RestrictedVitalStatistics_Natality_2013.do) | [2013](RScripts/RestrictedVitalStatistics_Natality_2013.R) |
| [2014](StataDoFiles/RestrictedVitalStatistics_Natality_2014.do) | [2014](RScripts/RestrictedVitalStatistics_Natality_2014.R) |
| [2015](StataDoFiles/RestrictedVitalStatistics_Natality_2015.do) | [2015](RScripts/RestrictedVitalStatistics_Natality_2015.R) |
| [2016](StataDoFiles/RestrictedVitalStatistics_Natality_2016.do) | [2016](RScripts/RestrictedVitalStatistics_Natality_2016.R) |
| [2017](StataDoFiles/RestrictedVitalStatistics_Natality_2017.do) | [2017](RScripts/RestrictedVitalStatistics_Natality_2017.R) |
| [2018](StataDoFiles/RestrictedVitalStatistics_Natality_2018.do) | [2018](RScripts/RestrictedVitalStatistics_Natality_2018.R) |
| [2019](StataDoFiles/RestrictedVitalStatistics_Natality_2019.do) | [2019](RScripts/RestrictedVitalStatistics_Natality_2019.R) |