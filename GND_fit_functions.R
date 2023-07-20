### GND_fit_functions_THL
### THLeach, leachth@miamioh.edu
### July 6, 2016

### this files only needs to be sourced for run Script_S1_DCM_curvefitting.R

## functions needed to fit generalized normal distributions (GND) with 
## shape parameter for adjust the weight of the tails. This script includes 3
## functions: (1) r2, which calculates the Rsquared of the modelled ChlF data
## (2) fit.GND, which fits the GND to the ChlF data, and (3) r2.fit which uses (1)
## to actually get the Rsquared values from the GND curve fit. 

# good background on GND: https://en.wikipedia.org/wiki/Generalized_normal_distribution
# https://cran.r-project.org/web/packages/pgnorm/pgnorm.pdf

library(pgnorm)

#calculate the R^2 on the modelled data
r2 <- function(y,fit){
  yhat = mean(y)
  sserr = 0  # 
  sstot = 0 # sum, over all obsevations of (mean.predicted - mean.observed)^2
  
  for(i in 1:length(y)){
    sstot = sstot + (y[i] - yhat)^2 
    sserr = sserr + (y[i] - fit[i])^2 #
  }
  return(1-(sserr/sstot))
  
}


## Function to fit the GND to the ChlF data -  starting values for optimization is the depth at which chl is the highest
fit.GND = function(depths, values){
  
  # estimate starting parameters for optimizing fit
  depth.at.max = depths[which.max(values)] # mean; sets the mean of curve to depth of the max. chl value
  mean.value   = mean(values, na.rm=TRUE) # additive parameter; adjusts the baseline of the curve to the mean value of the profile 
  range.value  = diff(range(values, na.rm=TRUE)) # multiplicative parameter; adjusts the height of the curve
  # sd/sigma = 1  
  # p or shape parameter = 2 (which is the p of a standard normal curve)
  
  params = c(mean.value, range.value, depth.at.max, 1, 2)
  
  to.fit = function(params){
    if(params[4] <= 0 | params[4] > 0.5*max(depths)){
      return(NA)
    }
    if(params[5]<= 0){
      return(NA)
    }
    if(params[1] <= -10){
      return(NA)
    }
    #if(params[2]<= 0){
    #  return(NA)
    #}
    if(params[3]<= -0.01 | params[3] > max(depths) ){
      return(NA)
    }
    estim.values = params[1] + params[2] * dpgnorm(depths, mean=params[3], sigma=params[4], p = params[5])
    #estim.values = params[1] + params[2] * dnorm(depths, mean=params[3], sd=params[4])
    return(sum((estim.values - values)^2)) #total sum of squares for the model fit
  }
  
  return(optim(params, to.fit, control=list(maxit=1e6), method='Nelder-Mead'))
  #return(optim(params, to.fit, control=list(maxit=1e6), 
  #            method='L-BFGS-B', 
  #           lower = rep(0, length(params)), 
  #          upper = rep(1e6, length(params))
  #         )
  #  )
  
}

## R^2 of the fit from fit.GND
r2.fit = function(fit.params, depths, values){
  #estim.values = fit.params[1] + fit.params[2] * dnorm(depths, mean=fit.params[3], sd=fit.params[4])
  estim.values = fit.params[1] + fit.params[2] * dpgnorm(depths, mean=fit.params[3], sigma=fit.params[4], p = fit.params[5])
  r_squared = r2(values, estim.values)
  
  return(r_squared)
}


###  for reference the outut from the curve fitting procedure are as follows.      
#DCM.depth  = DCM.fit$par[3]
#DCM.std    = DCM.fit$par[4]
#add.par    = DCM.fit$par[1]
#multi.par  = DCM.fit$par[2]
#DCM.shape = DCM.fit$par[5]