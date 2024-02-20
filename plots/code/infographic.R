library(grid)
library(useful)
library(png)

line_plot <- readPNG("plots/figure/total-sales-line-plot.png")
donut_plot <- readPNG("plots/figure/county_sales_donut_chart.png")
bar_plot <- readPNG("plots/figure/total-sale-bar-plot.png")

pdf("Infographics1.pdf", width = 20, height = 24)
grid.newpage()
pushViewport(viewport(layout = grid.layout(4, 3)))
grid.rect(gp = gpar(fill = "white", col = "white"))
grid.text("INFOGRAPHIC", y = unit(1, "npc"), x = unit(0.5, "npc"), vjust = 1, hjust = .5, gp = gpar(col = "#BFD8E5", cex = 12, alpha = 0.3))
grid.text("Marijuana Sales Reports", y = unit(0.94, "npc"), gp = gpar(col = "#006BA2", cex = 6.4))
print(line_plot, vp = vplayout(1, 1:3))
print(donut_plot, vp = vplayout(2, 1:3))
grid.rect(gp = gpar(fill = "#E7A922", col = "#E7A922"), x = unit(0.5, "npc"), y = unit(0.82, "npc"), width = unit(1, "npc"), height = unit(0.11, "npc"))
grid.text("CATEGORY", y = unit(0.82, "npc"), x = unit(0.5, "npc"), vjust = .5, hjust = .5, gp = gpar(col = "#CA8B01", cex = 13, alpha = 0.3))
grid.text("A VERY VERY VERY VERY LONG TITLE", vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.88, "npc"), gp = gpar(col = "#552683", cex = 1.2))
grid.text("DATA INFO", vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.86, "npc"), gp = gpar(col = "white", cex = 1.2))
grid.text(paste(
  "Syndicated to",
  "Source",
  "Author",
  "Maintainer",
  "Frequency of Update",
  "Granularity",
  "Temporal Date", sep = "\n"), vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.79, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
grid.text(paste(
  "http://alstatr.blogspot.com",
  "http://alstatr.blogspot.com",
  "Analysis with Programming",
  "Al-Ahmadgaid B. Asaad",
  "Annually",
  "National",
  "2011-2013", sep = "\n"), vjust = 0, hjust = 0, x = unit(0.15, "npc"), y = unit(0.79, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
dev.off()

# Generate Infographic in PNG Format
png("~/Documents/Infographics1.png", width = 10, height = 20, units = "in", res = 500)
grid.newpage()
pushViewport(viewport(layout = grid.layout(4, 3)))
grid.rect(gp = gpar(fill = "#E2E2E3", col = "#E2E2E3"))
grid.text("INFOGRAPHIC", y = unit(1, "npc"), x = unit(0.5, "npc"), vjust = 1, hjust = .5, gp = gpar(fontfamily = "Impact", col = "#A9A8A7", cex = 12, alpha = 0.3))
grid.text("RProgramming", y = unit(0.94, "npc"), gp = gpar(fontfamily = "Impact", col = "#E7A922", cex = 6.4))
grid.text("BY AL-AHMADGAID B. ASAAD", vjust = 0, y = unit(0.92, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
grid.text("ANALYSIS WITH PROGRAMMING", vjust = 0, y = unit(0.913, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
grid.text("alstatr.blogspot.com", vjust = 0, y = unit(0.906, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
print(p3, vp = vplayout(4, 1:3))
print(p1, vp = vplayout(3, 1:3))
print(p2, vp = vplayout(2, 1:3))
grid.rect(gp = gpar(fill = "#E7A922", col = "#E7A922"), x = unit(0.5, "npc"), y = unit(0.82, "npc"), width = unit(1, "npc"), height = unit(0.11, "npc"))
grid.text("CATEGORY", y = unit(0.82, "npc"), x = unit(0.5, "npc"), vjust = .5, hjust = .5, gp = gpar(fontfamily = "Impact", col = "#CA8B01", cex = 13, alpha = 0.3))
grid.text("A VERY VERY VERY VERY LONG TITLE", vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.88, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 1.2))
grid.text("DATA INFO", vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.86, "npc"), gp = gpar(fontfamily = "Impact", col = "white", cex = 1.2))
grid.text(paste(
  "Syndicated to",
  "Source",
  "Author",
  "Maintainer",
  "Frequency of Update",
  "Granularity",
  "Temporal Date", sep = "\n"), vjust = 0, hjust = 0, x = unit(0.01, "npc"), y = unit(0.79, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
grid.text(paste(
  "http://alstatr.blogspot.com",
  "http://alstatr.blogspot.com",
  "Analysis with Programming",
  "Al-Ahmadgaid B. Asaad",
  "Annually",
  "National",
  "2011-2013", sep = "\n"), vjust = 0, hjust = 0, x = unit(0.15, "npc"), y = unit(0.79, "npc"), gp = gpar(fontfamily = "Impact", col = "#552683", cex = 0.8))
dev.off()

grid.newpage()

pushViewport(viewport(layout = grid.layout(4, 3)))

grid.rect(gp = gpar(fill = "white", col = "white"))


grid.text("text", x = unit(15, "cm"), y = unit(1, "pt"))

print(total_sale_line_plot, vp = vplayout(1, 1:3))

