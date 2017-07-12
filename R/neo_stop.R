#' If Neo4j is running, stop the database
#'
#' This function will check to see if Neo4j is running, and if so, stop the database.
#' ASSUMES that you have command line access.
#' @param neo_path character. The Quorum HOST URL
#' @export
#' neo_stop

neo_stop = function(neo_path="~/neo4j-community-3.2.0") {
  ## navigate the server location
  #setwd(neo_path)
  ## build the command to check the status of the server
  CMD = sprintf("%s/bin/neo4j status", neo_path)
  resp = system(CMD, ignore.stderr = TRUE, ignore.stdout = TRUE)
  ## if the server was active, stop it
  if (resp == 0) {
    CMD = sprintf("%s/bin/neo4j stop", neo_path)
    status = system(CMD)
    cat("the server was started as part of this call\n")
  }
  ## if the status is 3 (not started), do nothing
  if (resp == 3) {
    cat("the server is not running, so nothing occurred\n")
  }
}
