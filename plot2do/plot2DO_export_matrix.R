# Read Rdata files.
library('optparse')
opt_parser = OptionParser();
arguments = parse_args(opt_parser, positional_arguments = TRUE);
opt = arguments$options

for (rdata in arguments$args) {
  load(file=rdata)
  colnames(occMatrix) = seq(-beforeRef, afterRef)
  rownames(occMatrix) = seq(lMin, lMax)
  output = paste(tools::file_path_sans_ext(rdata), '.txt', sep='')
  write.table(occMatrix, file=output, sep='\t', col.names=NA)
}
