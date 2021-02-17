#' @title Väestörakenne: Väestö iän (1-v.), sukupuolen ja kielen mukaan kunnan osa-alueittain, 2019
#'
#' @description Population demographics: Population in different city districts
#' divided by age, sex and language in year 2019
#'
#' @docType data
#'
#' @usage data(turku_vaesto_ika_sukupuoli_kieli_2019)
#'
#' @keywords datasets
#'
#' @source \href{https://dev.turku.fi/datasets/pienaluetilastot/}{Turun kaupungin pienaluetilastot}
#'
#' @format A data frame with 160344 observations and 7 variables
#' \describe{
#'   \item{Osa-alue}{District number and name, e.g. 853 Turku}
#'   \item{Vuosi}{Year, e.g. 2019}
#'   \item{Ikä}{Inhabitants' ages in 1 year intervals}
#'   \item{Sukupuoli}{Sex}
#'   \item{Kieli}{Language}
#'   \item{Tiedot}{Data gathering date, usually 31.12.}
#'   \item{value}{Number of inhabitants}
#'   }
#'
#' @examples
#' data(turku_vaesto_ika_sukupuoli_kieli_2019)
"turku_vaesto_ika_sukupuoli_kieli_2019"


#' @title Väestörakenne: Väestö sukupuolen ja kielen mukaan kunnan osa-alueittain, 2010-2019
#'
#' @description Population demographics: Population in different city districts
#' divided by sex and language in years 2010-2019
#'
#' @docType data
#'
#' @usage data(turku_vaesto_sukupuoli_kieli_2010_2019)
#'
#' @keywords datasets
#'
#' @source \href{https://dev.turku.fi/datasets/pienaluetilastot/}{Turun kaupungin pienaluetilastot}
#'
#' @format A data frame with 15720 observations and 6 variables
#' \describe{
#'   \item{Osa-alue}{District number and name, e.g. 853 Turku}
#'   \item{Vuosi}{Year, 2010-2019}
#'   \item{Sukupuoli}{Sex}
#'   \item{Kieli}{Language}
#'   \item{Tiedot}{Data gathering date, usually 31.12.}
#'   \item{value}{Number of inhabitants}
#'   }
#'
#' @examples
#' data(turku_vaesto_sukupuoli_kieli_2010_2019)
"turku_vaesto_sukupuoli_kieli_2010_2019"


#' @title Väestörakenne: Väestö iän (1-v.) mukaan kunnan osa-alueittain, 2010-2019
#'
#' @description Population demographics: Population in different city districts
#' divided by age in years 2010-2019
#'
#' @docType data
#'
#' @usage data(turku_vaesto_ika_2010_2019)
#'
#' @keywords datasets
#'
#' @source \href{https://dev.turku.fi/datasets/pienaluetilastot/}{Turun kaupungin pienaluetilastot}
#'
#' @format A data frame with 133620 observations and 5 variables
#' \describe{
#'   \item{Osa-alue}{District number and name, e.g. 853 Turku}
#'   \item{Vuosi}{Year, 2010-2019}
#'   \item{Ikä}{Inhabitants' ages in 1 year intervals}
#'   \item{Tiedot}{Data gathering date, usually 31.12.}
#'   \item{value}{Number of inhabitants}
#'   }
#'
#' @examples
#' data(turku_vaesto_ika_2010_2019)
"turku_vaesto_ika_2010_2019"