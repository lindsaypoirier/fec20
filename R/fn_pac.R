#' Political Action Committee (PAC) and Party Summary Financial Information
#'
#' \code{all_pac} returns a dataframe about the committees master data
#'
#' @param n_max integer specifying the max amount of entries in the dataset, defaults to the possible maximum
#' @return The entire dataframe. More information about variables is at `?pac`.
#' @examples
#' all_pac()
#' all_pac(n_max = 250)

all_pac <- function(n_max = Inf) {
  pac_dir <- usethis::use_zip(
    "https://www.fec.gov/files/bulk-downloads/2016/webk16.zip",
    destdir = tempdir(), cleanup = TRUE
  )

  pac_path <- fs::path(pac_dir, "webk16.txt")

  pac_names <- c("CMTE_ID", "CMTE_NM", "CMTE_TP", "CMTE_DSGN", "CMTE_FILING_FREQ", "TTL_RECEIPTS",
                 "TRANS_FROM_AFF", "INDV_CONTRIB", "OTHER_POL_CMTE_CONTRIB", "CAND_CONTRIB",
                 "CAND_LOANS", "TTL_LOANS_RECEIVED", "TTL_DISB", "TRANF_TO_AFF", "INDV_REFUNDS",
                 "OTHER_POL_CMTE_REFUNDS", "CAND_LOAN_REPAY", "LOAN_REPAY", "COH_BOP", "COH_COP",
                 "DEBTS_OWED_BY", "NONFED_TRANS_RECEIVED", "CONTRIB_TO_OTHER_CMTE", "IND_EXP",
                 "PTY_COORD_EXP", "NONFED_SHARE_EXP", "CVG_END_DT") %>%
    tolower()

  pac <- read_delim(
    n_max = n_max,
    pac_path,
    col_names = pac_names,
    delim = "|"
  ) %>% mutate(
    cvg_end_dt = lubridate::mdy(cvg_end_dt))
  return(pac)
}
