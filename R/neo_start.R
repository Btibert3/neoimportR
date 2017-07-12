#' If Neo4j is not running, start the database
#'
#' This function will check to see if Neo4j is running, and if not, it
#' will kick off the database.  ASSUMES that you have command line access.
#' @param neo_path character. The Quorum HOST URL
#' @export
#' neo_start

neo_start = function(neo_path="~/neo4j-community-3.2.0") {
  ## navigate the server location
  #setwd(neo_path)
  ## build the command to check the status of the server
  CMD = sprintf("%s/bin/neo4j status", neo_path)
  resp = system(CMD, ignore.stderr = TRUE, ignore.stdout = TRUE)
  ## if the server was active, let the user know
  if (resp == 0) {
    cat("the Neo4j server was already running\n")
  }
  ## if the status is 3 (not started), start the database
  if (resp == 3) {
    CMD = sprintf("%s/bin/neo4j start", neo_path)
    status = system(CMD, ignore.stderr = TRUE, ignore.stdout = TRUE)
  }
  ## if the status is now 0
  if (status == 0) {
    cat("the server was started as part of this call\n")
  }

}
