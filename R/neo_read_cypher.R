#' Read in a cypher file
#'
#' Read a cypher file that exists on disk into a character vector of length 1.
#' @param cypher_file character. The path to the cypher file to be read into memory.
#' @export
#' neo_read_cypher

neo_read_cypher = function(cypher_file) {
  ## if cypher file is not defined, yell
  stopifnot(is.character(cypher_file))
  cypher = readChar(cypher_file, file.info(cypher_file)$size)
  return(cypher)
}
