# ReadNatalityData

In the United States, State laws require birth certificates to be completed for all births, and Federal law mandates national collection and publication of births and other vital statistics data. The National Vital Statistics System, the Federal compilation of this data, is the result of the cooperation between the National Center for Health Statistics (NCHS) and the states to provide access to statistical information from birth certificates.

The National Center for Health Statistics makes annual natality micro-data datasets including all births occurring in a given calendar year within the United States [publicly available](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm). The data are based on information abstracted from birth certificates filed in vital statistics offices of each State and District of Columbia. 

Since 2005, publicly available national vital statistics micro-data files that include state, county, or larger city geography are no longer available without approval. This restriction was established to preserve confidentiality. The data in the restricted files with geography information are at such a level of detail that open access to the public is not appropriate.

Restricted-access annual natality datasets with state, county and geography information are provided to researchers upon request by the NCHS in text format. Researchers interested in obtaining these data should contact the [National Center for Health Statistics](https://www.cdc.gov/nchs/nvss/nvss-restricted-data.htm#:~:text=Conditions%20of%20Use%20for%20Restricted%20Data,-Once%20researchers%20have&text=The%20data%20files%20cannot%20be,in%20the%20data%20use%20agreement.). The restricted-access datasets do not include a dictionary to read the data into standard statistical software or to label variables and variable categories. 

As a service to the research community, we are making available the stata and R code to read restricted-access datasets with state, county, and geographic information. This code is similar to the code used for public-access natality data provided by the [NBER natality data](https://www.nber.org/research/data/vital-statistics-birth-data-nber), but it includes variables capturing state, county and geography. It also includes value labels for all variables. 

We currently provide code to read restricted-access natality data into stata and R for years 2015 to 2019. We will keep expanding this resource, adding natality data for prior and more current years. 

Please note that these files might include typos and errors. If you use them and find errors, please contact Hye Jee Kim (hyejk@stanford.edy).

We acknowledge funding from the Russell Sage Foundation.

--------
| Stata do files | R scripts |
| -------------- | -------------- |
| 2015 | 2015 |
| 2016 | 2016 |
| 2017 | 2017 |
| 2018 | 2018 |
| 2019 | 2019 |