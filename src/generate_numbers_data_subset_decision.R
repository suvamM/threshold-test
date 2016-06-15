library(dplyr)

load('../data/north_carolina_complete.RData')
nc = north_carolina

print(sprintf('Number of stops in raw dataset: %s',
        format(nrow(nc), digits = 0, big.mark = ',')))

print(with(nc, sprintf('%% Native American in raw dataset: %s%%',
        format(mean(race == 'Native American')*100, digits=4))))

print(with(nc, sprintf('%% race equals Other, NA or FALSE, in raw dataset: %s%%',
        format(mean(race == 'Other' | is.na(race) | race == 'FALSE')*100, digits=4))))

print(with(nc, sprintf('%% consent searches that recover contraband: %s%%',
        format(sum(contraband_found & search_type == 'Consent')/
                 sum(search_type == 'Consent')*100, digits=4))))

print(with(nc, sprintf('%% drivers arrested and subsequently searched: %s%%',
        format(sum(action == 'Arrest' & search_type == 'Incident To Arrest')/
                 (sum(action == 'Arrest' & search_type == 'Incident To Arrest') + sum(action == 'Arrest' & !search_conducted))*100, digits=4))))

print(with(nc, sprintf('%% searches justified by search warrant: %s%%',
                 format(sum(search_type == 'Search Warrant')/
                          sum(search_conducted)*100, digits=4))))

print(with(nc, sprintf('Number of police departments: %s',
                 format(length(unique(police_department)), digits=4))))

print(with(nc, sprintf('%% of stops conducted by state patrol: %s%%',
                 format(mean(police_department == 'NC State Highway Patrol')*100, digits=4))))


print(with(nc, sprintf('%% of searches conducted by state patrol: %s%%',
                 format(sum(search_conducted & police_department == 'NC State Highway Patrol')/sum(search_conducted)*100, digits=4))))

print(with(nc, sprintf('%% of successful searches conducted by state patrol: %s%%',
                 format(sum(contraband_found & police_department == 'NC State Highway Patrol')/sum(contraband_found)*100, digits=4))))

print(sprintf('%% of non-state patrol stops in largest 100 depts: %s%%',
                 format(
                   sum((nc %>% filter(police_department != 'NC State Highway Patrol') %>%
                         group_by(police_department) %>% tally() %>% arrange(desc(n)) %>% top_n(100))$n)/
                     sum(nc$police_department != 'NC State Highway Patrol')*100
                   , digits=4)))

