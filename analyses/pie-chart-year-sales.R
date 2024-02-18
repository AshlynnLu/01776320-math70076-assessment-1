
ggplot(combined_county, aes(x = "", y = Prop, fill = County)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_brewer(palette = "Set3") +
  facet_wrap(~Year) +
  scale_fill_manual(values=c(GREEN, YELLOW, CYAN, BLUE, DARK_RED, LIGHT_GREEN, OTHER1))
