#' plot_facet.R
#' Written by Abby Lewis
#' Created 25 July 2023
#' 
#' @title Create standardized, facet-like plots
#' 
#' @description This function is a convenience wrapper to generate standardized 
#' facet-like plots for Figures 5-7 of the manuscript
#'
#' @param data the dataset to plot
#' @param var_name the variable to plot
#' @param xint_1 x intercept to mark with a line
#' @param xint_2 second x intercept to mark with a line (dotted)
#' @param color color to use in this facet
#' @param ylab y label
#' @param reverse reverse y axis (logical)
#' @param legend include legend on plot (logical)
#' @param ... other arguments passed to theme
#'
#' @return returns a plot of the target variable over time in 2021 and 2022
#'

plot_facet <- function(data, var_name, xint_1, xint_2 = NULL, color, ylab, reverse = F, legend = F, ...){
  plot = data %>%
    filter(name == var_name)%>%
    ggplot()+
    geom_rect(aes(xmin = opened,xmax = closed,ymin=-Inf,ymax=Inf),
              fill = "grey40", data = lines_rect, alpha = 0.2)+
    {if(!var_name=="thermo") {
      geom_point(aes(color = color,x = DateTime, y = value))}
    }+
    geom_point(aes(x = DateTime),y=NA, data = data)+
    geom_line(aes(x = DateTime, y = value, color = color, linetype = color))+
    geom_vline(aes(xintercept = xint_1, color = color), lwd = 2, alpha = 0.3, show.legend = F)+
    {if(!is_empty(xint_2)) {
      geom_vline(aes(xintercept = xint_2, color = color), 
                 lwd = 2, alpha = 0.3, show.legend = F, linetype = "11")
    }}+
    scale_color_manual(values = c(color))+
    facet_grid(cols = vars(Year), scales = "free", switch = "y")+
    labs(y=ylab)+
    theme(plot.margin = unit(c(0.1,0,0.3,0), "cm"),
          ...)+
    {if(reverse) scale_y_reverse(limits = c(NA,0))}+
    {if(legend) {
      guides(lty = guide_legend(byrow = TRUE,keyheight = 0.75, ncol = 2),
             color = guide_legend(byrow = TRUE,keyheight = 0.75))
    }}+
    force_panelsizes(rows = unit(.8, "in"),
                     cols = unit(2.5, "in"))
}