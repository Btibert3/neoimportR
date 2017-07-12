#' Using the shell, import a cypher file you have on disk
#'
#' Import data into a running neo4j server using cypher via the shell import tool
#' ASSUMES that you have command line access.
#' @param neo_path character. The path for the neo4j install
#' @param neo_tool character. The sub-directory for the shell tool where we can pass cypher statements to a running server instance.
#' @param cql character. A path to the cypher file which can contain multiple commands, just end each statement with a ";"
#' @export
#' neo_run_cypher

neo_run_cypher = function(neo_path = "~/neo4j-community-3.2.0",
                          neo_tool = "bin/neo4j-shell",
                          cql) {

  ## testing = cql = "~/neo4j-test-import.cql"
  ## ensure the that the server is running
  stopifnot(system(sprintf("%s/bin/neo4j status",
                           neo_path),
                   ignore.stderr = TRUE,
                   ignore.stdout = TRUE) == 0)

  ## ensure that a cql file was specified
  stopifnot(is.character(cql))

  ## read in the cypher file
  cypher = neo_read_cypher(cql)

  ## define and run the statement
  CMD = sprintf("%s/%s -file %s", neo_path, neo_tool, cql)
  system(CMD)


}
