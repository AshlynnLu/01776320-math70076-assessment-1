

ggplot() +
  geom_bar(data = combined_county,
           aes(x = 0, y = Prop, fill = County),
           stat = "identity",
           width = 1) +
  coord_polar("y", start = 0) +
  xlim(c(-1.5, 1.5)) +
  theme_void() +
  facet_wrap(~Year, nrow = 2) +
  scale_fill_manual(values=c(BLUE, CYAN, YELLOW, GREEN, DARK_RED, LIGHT_GREEN, OTHER1)) +
  geom_text(data = total_sales_by_year,
            aes(label = paste("Total\n", "$", round(Total_Sales/1e6), "m")),
            x = -1.5, y = 0, size = 7.5/.pt) +
  labs(title = "The total sales by year",
       caption = "Source: the Colorado Department of Revenue") +
  theme(
    plot.title = element_text(size = 9.5, face = "bold"),
    legend.title = element_blank(),
    legend.key.height = unit(7.5, "pt"),
    legend.key.width = unit(5, "pt"),
    legend.text = element_text(size = 7.5, family = "Econ Sans Cnd"),
    # Adjust the size of facet titles (year titles)
    strip.text = element_text(size = 8, family = "Econ Sans Cnd",
                              margin = margin(0,0,-10,0), hjust = 0),
    plot.caption = element_markdown(size = 6.5, hjust = 0, color = source_color),
    strip.clip = "off"
  )

annotate_npc <- function(x, y, height, width, ...) {
  grid::grid.draw(grid::rectGrob(
    x = unit(x, "npc"), y = unit(y, "npc"), height = unit(height, "npc"), width = unit(width, "npc"),
    gp = grid::gpar(...)
  ))
}

p
annotate_npc(x = 0.07, y = 1, height = 0.05, width = 0.05, fill = "red", col = NA)



ggsave
