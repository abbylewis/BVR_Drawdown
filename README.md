# BVR_Drawdown

## Summary

Analyzing the effects of a 2022 drawdown on water quality in Beaverdam Reservoir

![Graphical abstract for BVR drawdown](https://github.com/abbylewis/BVR_Drawdown/assets/51751937/cd04fca6-2424-43f3-a99d-2fd2ba2ba5bc)

## Keywords

Carbon dioxide, drawdown, dissolved oxygen, high-frequency sensors, nitrogen, phosphorus, phytoplankton, reservoir, thermal stratification, water level

## Data availability

* Data for this study published in the Environmental Data Initative data portal. Data analysis code directly pulls from these sources: 
    * [Water chemistry](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.199.11)
    * [Greenhouse gasses](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.551.7)
    * [CTD](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.200.12)
    * [YSI oxygen sensor](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.198.11)
    * [Phytoplankton spectral groups](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.272.7)
    * [In-situ sensors](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.725.3)
    * [Meteorology](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.389.7)
    * [Metals](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.455.7)

* Additional auxilary data are presented in ./External data:
    * NID_YearCompleted_SurfaceArea_State.csv: National Inventory of Dams Database (available [here](https://nid.sec.usace.army.mil/#/))

## Repo content information

### Code files

* 01_Metals.Rmd
* 02_Chem.Rmd
* 03_GHG.Rmd
* 04_Fluora.Rmd
* 05_Physical metrics.Rmd
* 06_CTD.Rmd
* 07_Figures_5to7.Rmd
* 08_Met_stats.Rmd
* 09_NID.Rmd

### ./Raw_external_data

Downloaded data (unmodified from original source)

### ./Compiled_data

Compiled datasets, created by the data analysis scripts
