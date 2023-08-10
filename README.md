# BVR_Drawdown

## Summary

Analyzing the effects of a 2022 drawdown on water quality in Beaverdam Reservoir

![Graphical abstract for BVR drawdown](https://github.com/abbylewis/BVR_Drawdown/assets/51751937/cd04fca6-2424-43f3-a99d-2fd2ba2ba5bc)

## Keywords

Carbon dioxide, drawdown, dissolved oxygen, high-frequency sensors, nitrogen, phosphorus, phytoplankton, reservoir, thermal stratification, water level

## Data availability

* Data for this study published in the Environmental Data Initiative data portal. Data analysis code directly pulls from these sources: 
    * [Water chemistry](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.199.11) (Carey et al. 2023a)
    * [Greenhouse gases](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.551.7) (Carey et al. 2023b)
    * [CTD](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.200.12) (Carey et al. 2023c)
    * [YSI oxygen sensor](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.198.11) (Carey et al. 2023d)
    * [Phytoplankton spectral groups](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.272.7) (Carey et al. 2023e)
    * [In-situ sensors](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.725.3) (Carey et al. 2023f)
    * [Meteorology](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.389.7) (Carey and Breef-Pilz 2023)
    * [Metals](https://portal.edirepository.org/nis/mapbrowse?packageid=edi.455.7) (Schreiber et al. 2023)

* Additional auxiliary data are presented in ./External data:
    * NID_YearCompleted_SurfaceArea_State.csv: National Inventory of Dams Database (available [here](https://nid.sec.usace.army.mil/#/)). These data were obtained on xxxx (just in case it changes...)

## Repo content information

### [01_Load_and_process_data](01_Load_and_process_data)

Scripts to load data from EDI and calculate relevant summary metrics (e.g., Schmidt stability). Each code file corresponds to one data package on EDI. These code files do not produce any statistics or figures for the main manuscript, rather they output compiled data products, which are stored in [Processed_data](Processed_data). [R/install.R](R/install.R) can be used to download all necessary packages.

* [Metals.Rmd](01_Load_and_process_data/Metals.Rmd):
   * Load and format metals data from EDI
* [Chem.Rmd](01_Load_and_process_data/Chem.Rmd)
   * Load and format chemistry (N, P, DOC) data from EDI
* [GHG.Rmd](01_Load_and_process_data/GHG.Rmd)
   * Load and format greenhouse gas (GHG) data from EDI
* [CTD.Rmd](01_Load_and_process_data/CTD.Rmd)
   * Load and format CTD data from EDI and calculate euphotic zone depth
* [Fluoroprobe.Rmd](01_Load_and_process_data/Fluoroprobe.Rmd)
   * Load and format fluoroprobe data from EDI and calculate peak width and Cmax depth
* [Thermistors.Rmd](01_Load_and_process_data/Thermistors.Rmd)
   * Load and format in-situ thermistor and meteorological data from EDI. Calculate physical metrics that will be used in Figures 2, 3, 4, and 7
* [Meteorology.Rmd](01_Load_and_process_data/Meteorology.Rmd)
   * Load and format meteorological data

### [02_Plotting_and_stats](02_Plotting_and_stats)

These scripts use data files in ./Processed_data (generated using the scripts in [01_Load_and_process_data](01_Load_and_process_data)) to produce figures and statistics for the manuscript. [R/install.R](R/install.R) can be used to download all necessary packages.

* [Figures_2to4.Rmd](02_Plotting_and_stats/Figures_2to4.Rmd)
   * Analyze reservoir physics and meteorological data and generate Figures 2-4
* [Figures_5to7.Rmd](02_Plotting_and_stats/Figures_5to7.Rmd)
   * Generate time-series line plots of variables of interest (Figures 5-7)
* [Fluoroprobe - SI figure and summary stats.Rmd](02_Plotting_and_stats/Fluoroprobe-SI_figure_summary_stats.Rmd)
   * Calculate summary statistics for fluoroprobe data and create an SI figure
* [SI_habitat_suitability.Rmd](02_Plotting_and_stats/SI_habitat_suitability.Rmd)
   * Generate figures of habitat suitability for SI
* [SI_NID.Rmd](02_Plotting_and_stats/SI_NID.Rmd)
   * Analyze data from the national inventory of dams to understand the distribution of reservoir sizes in the U.S.

### [Raw_external_data](Raw_external_data)

Downloaded data (unmodified from original source)

### [Processed_data](Processed_data)

Compiled datasets, created by the scripts in [01_Load_and_process_data](01_Load_and_process_data)

### [R](R)

Helper functions referenced by data analysis code
