# Setup
# -----

# The CML library includes
# a number of helper functions you can use from within R sessions.

library('cml')

# This library is available under the name "cdsw" when using legacy engines.
# Uncomment the below line if you are using legacy engines.
# library('cdsw')

# [ggplot2](http://ggplot2.org/) is a great way to make pretty graphs.



library('ggplot2')

# Load Data
# ---------

library('MASS')
head(Cars93)
summary(Cars93$Type)



# Explore
# -------

qplot(Cars93$MPG.city, main="Cars MPG City")
qplot(Cars93$MPG.city, Cars93$Horsepower,
  main="City MPG vs. Horsepower",
  xlab="City MPG", ylab="Horsepower")
qplot(Cars93$Wheelbase, Cars93$Weight,
    main="Wheelbase Vs. Car Weight",
    xlab="Wheelbase", ylab="Car Weight") +
  geom_smooth(method = "loess")


# Model
# -----
#
# Regress City MPG on number of cylinders and weight

fit <- lm(MPG.city ~ Cylinders + Weight, data=Cars93)
summary(fit)

# Worker Engines
# -----------------
#
# Worker engines run on remote containers and can be networked together
# to run distributed jobs.  Using workers, you can easily scale your analysis
# 100s of cores.  All workers share the same project filesystem, have
# access to a virtual private network, and multiplex their output into
# a single master engine for easy debugging.
#
# The following command launches two workers and runs some code remotely:

# workers <- launch.workers(n=2, cpu=0.2, memory=0.5, code="print('Hello from a CML Worker')")

# You can stop workers with `stop.workers()`.  All workers will automatically
# be cleaned up when you stop the session as well (top-right session drop down).
