FROM rocker/rstudio

LABEL source="https://github.com/davetang/learning_docker/blob/main/rstudio/Dockerfile"

LABEL MAINTAINER="MARIO VEJLUPEK"

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        libpq-dev \
    && apt-get clean all && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "options(repos = c(CRAN = 'https://cloud.r-project.org'));"
RUN Rscript -e "install.packages(c('pillar', 'rmarkdown', 'tidyverse', 'workflowr', 'BiocManager', 'tibble', 'RPostgres', 'ggplot2'));"
# RUN Rscript -e "BiocManager::install(version = '${bioc_ver}')"

# # the rstudio/ path is set for building with GitHub Actions
# COPY --chown=rstudio:rstudio rstudio/rstudio-prefs.json /home/rstudio/.config/rstudio
# COPY --chown=rstudio:rstudio rstudio/.Rprofile /home/rstudio/

WORKDIR /home/rstudio