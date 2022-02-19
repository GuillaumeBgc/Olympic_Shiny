#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(rintrojs)
library(shinyBS)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    output$data_winter = renderDT(
        data_winter, options = list(lengthChange = FALSE)
    )
    
    output$data_summer = renderDT(
        data_summer, options = list(lengthChange = FALSE)
    )

    observeEvent("", {
        show("summer_panel")
        hide("global_panel")
        hide("winter_panel")
    })
    
    observeEvent(input$summer, {
        show("summer_panel")
        hide("winter_panel")
        hide("global_panel")
    })
    observeEvent(input$winter, {
        hide("summer_panel")
        show("winter_panel")
        hide("global_panel")
    })
    observeEvent(input$global, {
        show("global_panel")
        hide("summer_panel")
        hide("winter_panel")
    })
    

})
