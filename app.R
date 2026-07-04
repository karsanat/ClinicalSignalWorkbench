source('global.R')

ui <- fluidPage(
  titlePanel(APP_TITLE),
  sidebarLayout(
    sidebarPanel(
      h4(sprintf('Version %s', APP_VERSION)),
      fileInput('adam_zip','Upload ADaM Files',multiple=TRUE)
    ),
    mainPanel(
      h3('Clinical Signal Intelligence Workbench'),
      p('Repository under active development.'),
      verbatimTextOutput('status')
    )
  )
)

server <- function(input, output, session){
  output$status <- renderPrint({
    if (is.null(input$adam_zip)) 'Awaiting upload...' else input$adam_zip[,c('name','size')]
  })
}

shinyApp(ui, server)
