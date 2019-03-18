# Load packages
library(stringr)
library(ape)
library(purrr)

# Define helper-functions
open_png_for_tree <- function(filename, tree) {
  # Opens a PNG device with the same filename as a Newick-tree
  new_filename <- str_replace(filename, "nwk", "png")
  png(new_filename,
    width = Ntip(tree) * 3.5, height = Nnode(tree) * 1.5,
    units = "cm", res = 300
  )
}
plot_tree <- function(filename) {
  # Reads in a Newick-tree, plots it nicely, saves plot as PNG-file
  tree <- read.tree(filename)
  open_png_for_tree(filename, tree)
  plot(tree,
    # Plot-window settings
    x.lim = c(0.5, Ntip(tree) + 0.5),
    y.lim = c(0, Nnode(tree) + 0.5),
    no.margin = TRUE,
    # Tree settings
    type = "cladogram",
    direction = "upwards",
    # Edge settings
    edge.width = 2,
    # Label settings
    show.node.label = TRUE,
    srt = -90,
    adj = 0.25,
    label.offset = 0.25
  )
  dev.off()
}

# Use these functions on the Newick-trees in trees/
tree_filenames <- list.files("trees",
  pattern = "nwk",
  full.names = TRUE
)
walk(tree_filenames, plot_tree)
