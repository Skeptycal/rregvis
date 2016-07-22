
#' Visualize Regular Expresions
#'
#' This add-in helps you visualize the result of executing an R regular
#' expression.
#'
#' @export
rregvisAddin <- function() {

  context <- rstudioapi::getActiveDocumentContext()

  ui <- miniPage(
    gadgetTitleBar("Regular Expression"),
    miniContentPanel(
      textInput("regex", "Regex: ", value = context$selection[[1]]$text),
      checkboxInput("perl", "Perl-compatible", value = FALSE),
      checkboxInput("substitute", "Substitute", value = FALSE),
      rregvisOutput("result")
    )
  )

  server <- function(input, output, session) {
    output$result <- renderRregvis({
      rregvis(input$regex, NULL, input$regex)
    })
  }

  viewer <- dialogViewer("Regular Expression Visualizer",
                         width = 600, height = 700)
  runGadget(ui, server, viewer = viewer)
}
