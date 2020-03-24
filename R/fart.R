#' Embarrass the user with a fart noise
#'
#' A short natural noise is played which is useful if you want to get notified,
#' for example, when the script encounters an error.
#' It is recommended to wrap this function on top of your script like so:
#' options(error = function() {fart(takes= NA)})
#' This way whole namespace becomes visible; otherwise,
#' you can play sound wherever you wish, like so: fart(takes= NA)
#'
#' @name fart
#' @param takes : Takes no parameter, NA by default
#' @return NULL
#'
#' @examples
#' \dontrun{fart(takes= NA)}
#' @examples
#' \dontrun{options(error = function() {fart(takes= NA)})}
#'
#' @importFrom stringr str_replace_all regex str_detect
#' @importFrom audio load.wave play
#' @export
fart <- function(takes= NA){

  natural_noise <- sample(c("QueenFarthur.wav","KingFarthur.wav" ,"HeiressFarthur.wav","HeirFarthur.wav"), 1)

  wav_location <- system.file(paste("sound/", natural_noise, sep=""), package= "farthur")

  tryCatch(make_natural_noise(wav_string= wav_location), error = function(ex) {
    warning("fart(takes= NA) failed to shame you due to a following error:\n", ex)
  })
}

make_natural_noise <- function(wav_string) {

  if(Sys.info()["sysname"] == "Linux") {
    if(nchar(Sys.which("paplay")) >= 1 &&
       stringr::str_detect(wav_string, stringr::regex("\\.wav$", ignore_case = TRUE))) {

      wav_string <- stringr::str_replace_all(wav_string, " ", "\\\\ ")
      system(paste0("paplay ", wav_string), ignore.stdout = TRUE, ignore.stderr=TRUE, wait = FALSE)
      invisible(NULL)

    } else if(nchar(Sys.which("aplay")) >= 1 &&
              stringr::str_detect(wav_string, stringr::regex("\\.wav$", ignore_case = TRUE))) {

      wav_string <- stringr::str_replace_all(wav_string, " ", "\\\\ ")
      system(paste0("aplay --buffer-time=48000 -N -q ", wav_string), ignore.stdout = TRUE, ignore.stderr=TRUE, wait = FALSE)
      invisible(NULL)

    } else if(nchar(Sys.which("vlc")) >= 1) {

      wav_string <- stringr::str_replace_all(wav_string, " ", "\\\\ ")
      system(paste0("vlc -Idummy --no-loop --no-repeat --playlist-autostart --no-media-library --play-and-exit ", wav_string),
             ignore.stdout = TRUE, ignore.stderr=TRUE, wait = FALSE)
      invisible(NULL)

    } else {

      sfx <- audio::load.wave(wav_string)
      audio::play(sfx)

    }
  } else {
    sfx <- audio::load.wave(wav_string)
    audio::play(sfx)
  }

}
