#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rregvis <- function(before,
                    matches,
                    after,
                    width = NULL, height = NULL) {

  # process matches for serialization
  matches <- lapply(matches, function(match) {
    lengths <- attr(match, "match.length", exact = TRUE)
    match <- as.integer(match)
    lapply(seq_along(match), function(idx) {
      c(match[[idx]], lengths[[idx]])
    })
  })

  x = list(
    before = before,
    matches = matches,
    after = after
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rregvis',
    x,
    width = width,
    height = height,
    package = 'rregvis'
  )
}

#' Shiny bindings for rregvis
#'
#' Output and render functions for using rregvis within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rregvis
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rregvis-shiny
#'
#' @export
rregvisOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rregvis', width, height,
                                 package = 'rregvis')
}

#' @rdname rregvis-shiny
#' @export
renderRregvis <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rregvisOutput, env, quoted = TRUE)
}

