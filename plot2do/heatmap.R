library('optparse')
library('RColorBrewer')
library('gplots')

option_list = list(
  make_option(c('-t', '--title'), type='character',
              help='title of the plot', metavar='title'),
  make_option(c('-m', '--min'), type='double',
              help='minimum allowed value for data', metavar='number'),
  make_option(c('-M', '--max'), type='double',
              help='maximum allowed value for data', metavar='number'),
  make_option(c('-p', '--palette'), type='character', default='Spectral',
              help='name of the RColorBrewer palette to use', metavar='palette'),
  make_option(c('-P', '--number-palette'), type='integer', default=11,
              help='number of colors for the heatmap', metavar='number'),
  make_option(c('-n', '--number-colors'), type='integer', default=200,
              help='number of colors for the heatmap', metavar='number'),
  make_option(c('-s', '--symmetry'), type='logical', default=FALSE,
              help='values are considered symmetric', metavar='boolean'),
  make_option(c('-W', '--width'), type='integer', default=900,
              help='width of PNG output', metavar='number'),
  make_option(c('-H', '--height'), type='integer', default=600,
              help='height of PNG output', metavar='number')
);

opt_parser = OptionParser(option_list=option_list);
arguments = parse_args(opt_parser, positional_arguments = TRUE);
opt = arguments$options

for (file in arguments$args) {
  cat('Creating heatmap for file', file, '\n')
  data = read.csv(file, sep='\t', row.names=1, check.names=FALSE)
  data = data[nrow(data):1, ]
  if (!is.null(opt$min)) {
    data[data < opt$min] = opt$min
  }
  if (!is.null(opt$max)) {
    data[data > opt$max] = opt$max
  }
  output = paste(tools::file_path_sans_ext(file), '.png', sep='')
  png(output, width=opt$width, height=opt$height)
  heatmap.2(as.matrix(data), Rowv=FALSE, Colv=FALSE, dendrogram='none', main=opt$title, trace='none', col=colorRampPalette(brewer.pal(opt[['number-palette']], opt$palette))(opt[['number-colors']]), symm=opt$symmetry, symbreaks=opt$symmetry, symkey=opt$symmetry)
  while (!is.null(dev.list()))  dev.off()
}
