# BVR_Drawdown

## Summary

Analyzing the effects of a 2022 drawdown on water quality in Beaverdam Reservoir

![Graphical abstract for BVR drawdown](https://github.com/abbylewis/BVR_Drawdown/assets/51751937/cd04fca6-2424-43f3-a99d-2fd2ba2ba5bc)

## Keywords

Carbon dioxide, drawdown, dissolved oxygen, high-frequency sensors, nitrogen, phosphorus, phytoplankton, reservoir, thermal stratification, water level

## Data availability

* Data for this study published in the Environmental Data Initative data portal. Data analysis code directly pulls from these sources: 
    * [Water chemistry](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.199.11)
    * [Greenhouse gases](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.551.7)
    * [CTD](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.200.12)
    * [YSI oxygen sensor](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.198.11)
    * [Phytoplankton spectral groups](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.272.7)
    * [In-situ sensors](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.725.3)
    * [Meteorology](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.389.7)
    * [Metals](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.455.7)

* Additional auxilary data are presented in ./External data:
    * NID_YearCompleted_SurfaceArea_State.csv: National Inventory of Dams Database (available [here](https://nid.sec.usace.army.mil/#/))

## Repo content information

### 01_Load_and_process_data

Scripts to load data from EDI and calculate relevant summary metrics (e.g., Schmidt stability). These files are organized based on the origin data package and so not produce any statistics or figures for the main manuscript. Output data files are stored in ./Processed_data

* 01_Metals.Rmd:
   * Load and format metals data from EDI
* 02_Chem.Rmd
   * Load and format chemistry (N, P, DOC) data from EDI
* 03_GHG.Rmd
   * Load and format greenhouse gas (GHG) data from EDI
* 04_CTD.Rmd
   * Load and format CTD data from EDI and calculate euphotic zone
* 05_Fluora.Rmd
   * Load fluoroprobe data from EDI and calculate peak width and cmax depth
* 06_Physical metrics.Rmd
   * Load in-situ thermistor and meteorological data from EDI, calculate physical metrics for Figures 2, 3, 4, and 7

### 02_Plotting_and_stats

Use data files in ./Processed_data to produce figures and statistics for the manuscript

* 07_Figures_5to7.Rmd
   * Generate time-series line plots of variables of interest (Figures 5-7)
* 08_Met_stats.Rmd
   * Calculate summary statistics for meteorological data
* 09_NID.Rmd
   * Analyze data from the national inventory of dams to understand the distribution of reservoir sizes in the U.S.

### ./Raw_external_data

Downloaded data (unmodified from original source)

### ./Compiled_data

Compiled datasets, created by the data analysis scripts

### ./R

Helper functions referenced by data analysis code
