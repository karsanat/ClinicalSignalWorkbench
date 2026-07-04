mod_signal_dashboard_ui <- function(id){
 ns <- shiny::NS(id)
 shiny::tagList(
  shiny::fluidRow(
   shiny::column(12, shiny::h2('Clinical Signal Dashboard')),
   shiny::column(12, DT::DTOutput(ns('summary')))
  )
 )
}

mod_signal_dashboard_server <- function(id, data_reactive){
 shiny::moduleServer(id, function(input, output, session){
  output$summary <- DT::renderDT({
   dat <- data_reactive()
   if(is.null(dat)) return(data.frame(Status='No data loaded'))
   if(!'AVAL' %in% names(dat)) return(data.frame(Status='AVAL column not found'))
   signal_summary(dat, 'AVAL')
  })
 })
}
