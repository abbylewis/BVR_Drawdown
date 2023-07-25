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
