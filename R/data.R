#' Candidates Master metadata
#'
#' @description Basic information for each candidate.
#'
#' @format A data frame with 7398 rows and 15 columns, providing information
#' for each candidate:
#' \describe{
#'   \item{cand_id}{A code assigned to a candidate by the FEC, which remains
#'   the same across election cycles if running for the same office.}
#'   \item{cand_name}{Candidate name.}
#'   \item{cand_pty_aff}{The political party affiliation reported by the candidate.}
#'   \item{cand_election_yr}{Candidate's election year from a Statement of Candidacy or state ballot list.}
#'   \item{cand_office_st}{Candidate's state.}
#'   \item{cand_office}{Candidate office with designation: H = House, P = President, S = Senate.}
#'   \item{cand_office_dis}{Candidate's district.}
#'   \item{cand_ici}{Incumbent challenger status with designation: C = Challenger, I = Incumbent, O = Open Seat}
#'   \item{cand_status}{Candidate status with designation:C = Statutory candidate, F = Statutory candidate for future election, N = Not yet a statutory candidate, P = Statutory candidate in prior cycle }
#'   \item{cand_pcc}{ID of the candidate's principal campaign committee assigned by FEC.}
#'   \item{cand_sti}{Candidate's street address.}
#'   \item{cand_st2}{Candidate's second street address.}
#'   \item{cand_city}{Candidate's city address.}
#'   \item{cand_st}{Candidate's state address.}
#'   \item{cand_zip}{Candidate's zipcode address.}
#' }
#' @source <https://www.fec.gov/campaign-finance-data/candidate-master-file-description/>, downloaded 2019-12-04
"candidates"

#' Committee contributions metadata
#'
#' @description Provides data pertaining to each candidate and their contibutions from committees during the 2016 general election.
#'
#' @format A data frame with 1210 rows and 3 columns with information about candidate committee contibutions.
#' \describe{
#'   \item{cand_id}{Recipient Candidate ID. Candidate receiving money from the filing committee}
#'   \item{number_of_contributions}{Total number of contibutions from committees}
#'   \item{total_contributions}{Sum of all contributions made to committees in support of each candidate; in dollars}
#'   \item{net_contributions}{Sum of contributions made both for candidates as well as against them, to rival committees; in dollars}
#' }
#' @source <https://classic.fec.gov/finance/disclosure/metadata/DataDictionaryContributionstoCandidates.shtml>, downloaded 2019-12-09
"contributions"

#' Committees metadata
#'
#' @description Provides data pertaining to each committee registered with the Federal Election Commission.
#'
#' @format A data frame with 17654 rows and 15 columns with information about FEC committees.
#' \describe{
#'   \item{committee_id}{A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission.}
#'   \item{comittee_name}{Name of the committee}
#'   \item{treasurers_name}{The officially registered treasurer for the committee.}
#'   \item{city_or_town}{City or town of office}
#'   \item{state}{State of office}
#'   \item{zip_code}{Zip code of office}
#'   \item{committee_designation}{A = Authorized by a candidate
#'
#' B = Lobbyist/Registrant PAC
#'
#' D = Leadership PAC
#'
#' J = Joint fundraiser
#'
#' P = Principal campaign committee of a candidate
#'
#' U = Unauthorized}
#'   \item{committee_type}{FEC committee type, listed here: https://classic.fec.gov/finance/disclosure/metadata/CommitteeTypeCodes.shtml}
#'   \item{committee_party}{Party affiliation, listed here: https://classic.fec.gov/finance/disclosure/metadata/DataDictionaryPartyCodeDescriptions.shtml}
#'   \item{connected_org_name}{Organization connected to the committee}
#'   \item{cand_id}{A code assigned to a candidate by the FEC, which remains the same across election cycles if running for the same office; Included if committee type has designation H, S, P}
#' }
#' @source <https://classic.fec.gov/finance/disclosure/metadata/DataDictionaryCommitteeMaster.shtml>, downloaded 2019-12-04
"committees"

#' Individual Contributions Master metadata
#'
#' @description Basic information for a random sample of transactions from
#' individuals to candidates/committees.
#'
#' @format A data frame with 100000 rows and 5 columns, providing information for each transaction:
#' \describe{
#'   \item{committee_id}{A unique code assigned to a committee by the FEC}
#'   \item{state}{Individual's state}
#'   \item{zipcode}{Individuals's zipcode}
#'   \item{transaction_date}{Date of transaction}
#'   \item{transaction_amount}{Amount of transaction, in dollars}

#' }
#' @source <https://www.fec.gov/campaign-finance-data/contributions-individuals-file-description/>, downloaded 2019-12-09
"individuals"

#' Presidential General Election Results
#'
#' @description 2016 Presidential General Election Results for each state.
#'
#' @format A data frame with 2110 rows and 18 columns, providing information
#' for results in each state :
#' \describe{
#'   \item{cand_id}{A code assigned to a candidate by the FEC}
#'   \item{state}{The state of the votes}
#'   \item{general_election_date}{The election date}
#'   \item{first_name}{First name of candidate}
#'   \item{last_name}{Last name of candidate}
#'   \item{last_name_first}{First and last name of candidate}
#'   \item{party}{Party of the candidates}
#'   \item{general_results}{The number of people voted in that state}
#'   \item{general_percent}{The percent of people}
#'   \item{winner_indicator}{A logical variable: TRUE if candidate won, FALSE if not}
#' }
#' @source <https://transition.fec.gov/general/FederalElections2016.shtml>, last edited Feb 2018
"house_results"
