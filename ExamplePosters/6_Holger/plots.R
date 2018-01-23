# author: Holger Metzler
# date: 2016-02-03

if (!require("reshape2")) install.packages('rehsape2')
if (!require("ggplot2")) install.packages('ggplot2')
if (!require("latex2exp")) install.packages('latex2exp')
if (!require("extrafont")) install.packages('extrafont')
if (!require("grid")) install.packages('grid')


##### plots for the poster #####


# solution
soln <- read.csv('solution.csv')
names(soln)[1] = 'year'
soln_data <- soln
soln_data$value <- soln_data$value/1000

plt_soln <- ggplot(soln_data, aes(x = year, y = value, color = factor(pool))) + 
  geom_line() +
  scale_x_continuous("Time (yr)", limits = c(1765, 2500), expand = c(0,0)) +
  scale_y_continuous("Mass (1000 PgC)", limits = c(0, 8.700), expand = c(0,0)) +
  theme_bw(20) + 
  theme(#text=element_text(family="CM Roman"), 
    legend.position = c(0.2,0.8), 
    legend.background = element_blank(), 
    legend.title = element_blank(),
    legend.key = element_blank(),
    axis.title.x = element_blank(), 
    axis.title.y = element_text(vjust = 0.5),
    plot.margin = unit(c(2, 1, 0, 0), "cm")
  ) +
  scale_color_brewer(palette = "Set1", labels = list('total', 'atmosphere', 'terrestrial biosphere', 'surface ocean'))
plt_soln

btt_density <- read.csv("btt_dens.csv")
output_flux_data <- read.csv('output_flux.csv')
output_flux <- output_flux_data[output_flux_data$pool==-1, c('value')][[1]]
btt_density_normalized <- btt_density
btt_density_normalized$value <- btt_density$value / output_flux
names(btt_density_normalized) <- c('age', 'year', 'btt')
btt_density_normalized <- btt_density_normalized[btt_density_normalized$year==1765, c('age', 'btt')]

age_density <- ss_age_density_data[ss_age_density_data$pool==-1, c('age', 'value')]
age_density_normalized <- age_density
content <- soln[(soln$year==1765) & (soln$pool==-1), 'value']
age_density_normalized$value <- age_density_normalized$value / content

names(age_density_normalized) <- c('age', 'A')
dat <- merge(btt_density_normalized, age_density_normalized, id.vars = C('age'))
dat <- melt(dat, id.vars = c('age'))

ss_norm_stats <- ggplot(dat, aes(x = age, y = value, color = factor(variable))) + 
  geom_line() +
  scale_x_continuous(TeX("Age $y$ (yr)"), expand = c(0,0)) +
  scale_y_continuous(TeX("Normalized density $f$"), expand = c(0,0)) +
  theme_bw(40) + 
  theme(#text=element_text(family="CM Roman"), 
    legend.position = c(0.75,0.5), 
    legend.background = element_blank(), 
    legend.title = element_blank(),
    legend.key = element_blank(),
    axis.title.y = element_text(vjust = 0.5),
    axis.title.x = element_text(vjust = 0.5),
    plot.margin = unit(c(1, 1, 1, 0), "cm")
  ) +
  scale_color_brewer(palette = "Set1", labels = list('transit time', 'age')) 
ss_norm_stats

# system age and BTT means

age_mean_data <- read.csv("age_mean.csv")
age_mean <- age_mean_data[age_mean_data$pool==-1, c('time', 'value')]
names(age_mean) <- c('year', 'age_mean')
btt_mean <- read.csv("btt_mean.csv")
names(btt_mean) <- c('year', 'btt_mean')
dat <- melt(merge(age_mean, btt_mean, id.vars = c('year')), id.vars = c('year'))

plt_means <- ggplot(dat, aes(x = year, y = value, color = factor(variable))) + 
  geom_line(size=2) +
  scale_x_continuous(TeX("Age $y$ (yr)"), expand = c(0,0), breaks = c(1765, 2000, 2250, 2500)) +
  scale_y_continuous(TeX("Normalized density $f$"), limits = c(50,200), expand = c(0,0), breaks = c(50, 100, 150, 200), labels = c("", "100", "150", "200")) +
  theme_bw(40) + 
  theme(#text=element_text(family="CM Roman"), 
    legend.position = c(0.4,0.1), 
    legend.background = element_blank(), 
    legend.title = element_blank(),
    legend.key = element_blank(),
    axis.title.y = element_blank(),
    axis.title.x = element_blank(),
    plot.margin = unit(c(1, 2, 1, 0), "cm")
  ) +
  scale_color_brewer(palette = "Set1", labels = list("mean system age", "mean backward transit time")) +
  guides(color=guide_legend(
    keywidth=0.5,
    keyheight=0.5,
    default.unit="inch"))
plt_means

# single curves

age_mean_data <- read.csv("age_mean.csv")
age_mean <- age_mean_data[age_mean_data$pool==0, c('time', 'value')]

plt_sc <- ggplot(age_mean, aes(x = time, y = value)) + 
  geom_line(size=10, color = "blue") +
  scale_x_continuous(TeX("Age $y$ (yr)"), expand = c(0,0)) +
  scale_y_continuous(TeX("Normalized density $f$"), limits = c(50,200), expand = c(0,0)) +
  theme_bw(40) + 
  theme(#text=element_text(family="CM Roman"), 
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )
plt_sc



age_density_data <- read.csv("age_dens.csv")
names(age_density_data) <- c('age', 'year', 'pool', 'value')
ss_age_density <- age_density_data[(age_density_data$year==1765) & (age_density_data$pool==0), c('age', 'value')]

plt_ss_s <- ggplot(ss_age_density, aes(x = age, y = value)) + 
  geom_line(size = 10, color = "red") +
  theme_bw(40) + 
  theme(#text=element_text(family="CM Roman"), 
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  ) 
plt_ss_s


