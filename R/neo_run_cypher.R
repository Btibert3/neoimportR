#' Using the shell, import a cypher file you have on disk
#'
#' Import data into a running neo4j server using cypher via the shell import tool
#' ASSUMES that you have command line access.
#' @param neo_path character. The path for the neo4j install
#' @param cql character. A path to the cypher file which can contain multiple commands to
#' @export
#' neo_run_cypher

neo_run_cypher = function(neo_path="~/neo4j-community-3.2.0", cql) {
  ## ensure the that the server is running
  stopifnot(system(sprintf("%s/bin/neo4j status",
                           neo_path),
                   ignore.stderr = TRUE,
                   ignore.stdout = TRUE) == 0)
  ## ensure that a cql file was specified
  stopifnot(is.character(cql))
  ## temp
  return(TRUE)

}
