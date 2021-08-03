boyd <- wstack %>%
  filter(filer2017) %>%
  select(-c(RECID, filer2017, c00100, e00200, standard, c04470, c18300, s006, iitax, agibase)) %>%
  group_by(type, wtype, stubnum, stub) %>%
  summarise(across(.cols=everything(), sum), .groups="drop")


glimpse(wstack)
boyd <- wstack %>%
  filter(wtype=="REWT2021") %>%
  select(RECID, type, filer2017, stubnum, stub, c00100, standard, c04470, c18300, usweight)

boyd %>%
  filter(c18300 > 0) %>%
  group_by(type) %>%
  summarise(std=sum(standard))
