% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neo_stop.R
\name{neo_stop}
\alias{neo_stop}
\title{If Neo4j is running, stop the database}
\usage{
neo_stop(neo_path = "~/neo4j-community-3.2.0")
}
\arguments{
\item{neo_path}{character. The Quorum HOST URL}
}
\description{
This function will check to see if Neo4j is running, and if so, stop the database.
ASSUMES that you have command line access.
}
