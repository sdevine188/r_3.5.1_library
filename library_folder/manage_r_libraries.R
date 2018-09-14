library(tidyverse)
library(fs)

# https://www.tidyverse.org/articles/2018/01/fs-1.0.0/

# setwd
setwd("~/R/win-library/3.5")
dir_info()

# get currently installed packages
current_packages <- dir_ls()
current_packages <- tibble(package = current_packages)
current_packages

# get uploaded packages
setwd("C:/Users/Stephen/Desktop/R/r_3.5.1_library/library_folder")
uploaded_packages <- dir_ls()
uploaded_packages <- tibble(package = uploaded_packages)
uploaded_packages

# find packages not yet uploaded
not_uploaded_packages <- current_packages %>% anti_join(., uploaded_packages, by = "package")
not_uploaded_packages

# copy not_uploaded_packages from working library to r_libraries folder
setwd("~/R/win-library/3.5")
dir_copy(path = path(not_uploaded_packages$package), new = "C:/Users/Stephen/Desktop/R/r_3.5.1_library/library_folder")








