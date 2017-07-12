#' Totally wipe out the default Neo4j database data.
#'
#' Function to stop a Neo4j server, if running, and totally rebuild the default database from scratch. This is
#' different from wiping the database via commands but keeping the server running.
#' Why?:  Replicate a fresh database instance, which is helpful for developing and certain analytic instances.
#' @param neo_path character. The path for the neo4j install
#' @param cql character. A path to the cypher file which can contain multiple commands to
#' @export
#' neo_wipe

neo_wipe = function(neo_path="~/neo4j-community-3.2.0") {
  ## is the server running, if so, stop
  CMD = sprintf("%s/bin/neo4j status", neo_path)
  resp = system(CMD, ignore.stderr = TRUE, ignore.stdout = TRUE)

  ## if the server was active, let the user know
  if (resp == 0) {
    cat("the Neo4j server is running and will be stopped, and wiped\n")
    system(sprintf("%s/bin/neo4j stop", neo_path), ignore.stdout = TRUE, ignore.stderr = TRUE)
    cat("the Neo4j server is stopped\n")
  }

  ## confirm the server is not running
  resp2 = system(CMD, ignore.stderr = TRUE, ignore.stdout = TRUE)
  stopifnot(resp2 == 3)

  ## delete the data files
  PATH = sprintf("%s/data/databases/graph.db", neo_path)
  system(sprintf("rm -rf %s", PATH))

  ## print a message
  cat("the data have been wiped from the default location\n")


}
