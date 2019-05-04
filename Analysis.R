####policing data analysis###

##load data
#downloaded data as a .csv from https://openpolicing.stanford.edu/data/ 
traffic_update = read.csv("ca_statewide_2019_02_25.csv", header = TRUE) #read csv

##subsetting
#subset data
sacramento_update = traffic_update[traffic_update$county_name %in% "Sacramento County", ] #subset for sacramento
black_sac = sacramento_update[sacramento_update$subject_race == "black", ] #subset for black sacramento
yte_sac = sacramento_update[sacramento_update$subject_race == "white", ] #subset for white sacramento
nonblack_sac = sacramento_update[sacramento_update$subject_race != "black", ] #subset for nonblack sacramento

##outcomes
#this column shows follwoing possible outcomes: arrest, citation, summons, warning 
#divide the matrix of outcomes for black people by the number of non-NA entries to get percentages: (table(black_sac$outcome) / length(which(is.na(black_sac$outcome) == FALSE)))
#divide the matrix of outcomes for white people by the number of non-NA entries to get percentages: (table(yte_sac$outcome) / length(which(is.na(yte_sac$outcome) == FALSE)))
#divide the resulting matrices to get the relative percentages
  
(table(black_sac$outcome) / length(which(is.na(black_sac$outcome) == FALSE))) /
  (table(yte_sac$outcome) / length(which(is.na(yte_sac$outcome) == FALSE)))

##frisk performed
#same logic as above-- do not need to control for NAs because only values are TRUE or NA
(table(black_sac$frisk_performed) / length(black_sac$frisk_performed)) /
  (table(yte_sac$frisk_performed) / length(yte_sac$frisk_performed))

##search conducted
#same logic as above
(table(black_sac$search_conducted) / length(which(
  is.na(black_sac$search_conducted) == FALSE
))) / (table(yte_sac$search_conducted) / length(which(
  is.na(yte_sac$search_conducted) == FALSE
)))

#search basis
(table(black_sac$search_basis) / length(which(is.na(
  black_sac$search_basis
) == FALSE))) / (table(yte_sac$search_basis) / length(which(is.na(
  yte_sac$search_basis
) == FALSE)))

#reason for search
(table(black_sac$reason_for_search) / length(which(
  is.na(black_sac$reason_for_search) == FALSE
))) / (table(yte_sac$reason_for_search) / length(which(
  is.na(yte_sac$reason_for_search) == FALSE
)))

##contraband_found
(table(black_sac$contraband_found) / length(which(
  is.na(black_sac$contraband_found) == FALSE
))) / (table(yte_sac$contraband_found) / length(which(
  is.na(yte_sac$contraband_found) == FALSE
)))
