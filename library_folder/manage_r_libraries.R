library(tidyverse)
library(fs)
library(scales)

# https://www.tidyverse.org/articles/2018/01/fs-1.0.0/

# setwd
setwd("~/R/win-library/3.5")
dir_info()


###################################################################################


# create copy_directory function as wrapper to dir_copy that gives progress update when used un-vectorized with map
# need to use un-vectorized version of dir_copy because i can't get vectorized version to work for some reason
copy_directory <- function(path, new_path, row_number, max_row_number, ...) {
        print(str_c(percent(row_number / max_row_number), " completed, copying ", path))
        dir_copy(path = path, new_path = new_path)
}


##################################################################################


# upload current packages

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
# can't get vectorized dir_copy to work, so just looping through single dir_copy
setwd("~/R/win-library/3.5")

tibble(path = not_uploaded_packages$package, 
       new_path = rep("C:/Users/Stephen/Desktop/R/r_3.5.1_library/library_folder", 
                      times = nrow(not_uploaded_packages))) %>% 
        mutate(row_number = row_number(), max_row_number = max(row_number)) %>%
        pmap(.l = ., .f = copy_directory)


##########################################################################################


# copy new packages from github repo download zip file to shared drive common folder
# note: github repo zip file should be saved in r_libraries folder 

# setwd 
setwd("H:/R/r_library")

# unzip repo zip file
unzip(zipfile = "r_3.5.1_library-master.zip")

# get uploaded packages 
setwd("H:/R/r_library/r_3.5.1_library-master/library_folder")

uploaded_packages <- dir_ls()
uploaded_packages <- tibble(package = uploaded_packages)
uploaded_packages

# get packages currently saved on share drive
setwd("L:/OP&S Doc Mgmt 2/RED/Statistical Software/R/R 3.5.1 libraries")

share_drive_packages <- dir_ls()
share_drive_packages <- tibble(package = share_drive_packages)
share_drive_packages

# get new packages not yet saved on share drive
packages_not_on_share_drive <- uploaded_packages %>% anti_join(., share_drive_packages, by = "package") %>% 
        filter(package != "manage_r_libraries.R") 
packages_not_on_share_drive

# copy packages_not_on_share_drive to share drive
setwd("H:/R/r_library/r_3.5.1_library-master/library_folder")

tibble(path = packages_not_on_share_drive$package, 
       new_path = rep("L:/OP&S Doc Mgmt 2/RED/Statistical Software/R/R 3.5.1 libraries", 
                      times = nrow(packages_not_on_share_drive))) %>% 
        mutate(row_number = row_number(), max_row_number = max(row_number)) %>%
        pmap(.l = ., .f = copy_directory)


##############################################################################


# copy new packages from share_drive to r library folder on personal drive

# get packages currently saved on share drive
setwd("L:/OP&S Doc Mgmt 2/RED/Statistical Software/R/R 3.5.1 libraries")

share_drive_packages <- dir_ls()
share_drive_packages <- tibble(package = share_drive_packages)
share_drive_packages

# get packages currently on personal drive
setwd("~/R/win-library/3.5") # on desktop
setwd("~/R/R-3.5.1/library") # on laptop

personal_drive_packages <- dir_ls()
personal_drive_packages <- tibble(package = personal_drive_packages)
personal_drive_packages

# get new packages not yet saved on personal drive
packages_not_on_personal_drive <- share_drive_packages %>% anti_join(., personal_drive_packages, by = "package") %>% 
        filter(package != "manage_r_libraries.R") 
packages_not_on_personal_drive

# copy packages_not_on_share_drive to share drive
setwd("L:/OP&S Doc Mgmt 2/RED/Statistical Software/R/R 3.5.1 libraries")

tibble(path = packages_not_on_personal_drive$package, 
       new_path = rep("~/R/win-library/3.5", times = nrow(packages_not_on_personal_drive))) %>% 
        mutate(row_number = row_number(), max_row_number = max(row_number)) %>%
        pmap(.l = ., .f = copy_directory)

