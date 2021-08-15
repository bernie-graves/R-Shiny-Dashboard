FROM rocker/shiny:4.0.5

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev 

RUN R -e 'install.packages(c(\
    "shiny", \
    "shinydashboard", \
    "ggplot2" \
    ), \
    repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
    )'


COPY ./shiny-app/* /shiny-app/
COPY Attributes_DataFrame.csv /shiny-app/Attributes_DataFrame.csv

# Exposing to port 3838 - the default port for shiny apps
# EXPOSE 3838

# command to run the app
CMD ["R", "-e", "shiny::runApp('/shiny-app', host = '0.0.0.0', port = 3838)"]
