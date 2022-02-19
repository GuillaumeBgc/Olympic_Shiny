#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shinydashboard)
library(shinyjs)
library(rintrojs)
library(shinyBS)
library(DT)

# DASHBOARD PAGE ------------------------------------------------------------------

dashboardPage(
    
    skin = "black",
    title = "OLYMPIC GAMES",
    
    # DASHBOARD HEADER ------------------------------------------------------------
    
    dashboardHeader(title = div(class="test",img(src = "Olympic_rings.png", height = 35),"OLYMPIC GAMES"),
                    titleWidth = 450),
    
    
    # DASHBOARD SIDEBAR ------------------------------------------------------------
    
    dashboardSidebar(
        br(),
        sidebarMenu(id="tabs",
                    menuItem("Home", tabName="home", icon=icon("home")),
                    menuItem("Analysis", tabName = "analysis", icon=icon("charts"), selected=TRUE),
                    menuItem("Tables",  icon = icon("file-text-o"),
                             menuSubItem("data", tabName = "data", icon = icon("angle-right")),
                             menuSubItem("data_winter", tabName = "data_winter", icon = icon("angle-right")),
                             menuSubItem("data_summer", tabName = "data_summer", icon = icon("angle-right"))
                    ),
                    menuItem("About", tabName = "about", icon = icon("question"))
        )
        
    ),
    
    # DASHBOAR DHEADER -------------------------------------------------------------
    
    dashboardBody(
        
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
        ),
        
        useShinyjs(),
        introjsUI(),

        # ANALYSIS PART -----------------------------------------------------------
        
        tabItems(
            tabItem(tabName = "analysis",
                    # summer, winter and global buttons 
                    br(),
                    fluidRow(
                        column(
                            width = 12,
                            introBox(
                                bsButton("summer", 
                                         label = "SUMMER", 
                                         icon = icon("sun"), 
                                         style = "summer"),
                                bsButton("winter", 
                                         label = "WINTER", 
                                         icon = icon("snowflake"), 
                                         style = "winter"),
                                bsButton("global", 
                                         label = "GLOBAL", 
                                         icon = icon("globe"), 
                                         style = "global")
                            )
                        )
                    ),
                    # summer page
                    fluidRow(
                        div(
                            id = "summer_panel", 
                            column(
                                width = 12
                                
                                )
                            ,
                            column(
                                width = 6,
                                h1("test")
                            ),
                            column(
                                width = 6
                                
                            )
                        )
                    ),
                    fluidRow(
                        div(
                            id = "winter_panel", 
                            column(
                                width = 12
                                
                            )
                            ,
                            column(
                                width = 6,
                                h1("test")
                            ),
                            column(
                                width = 6
                                
                            )
                        )
                    ),
                    fluidRow(
                        div(
                            id = "global_panel", 
                            column(
                                width = 12
                                
                            )
                            ,
                            column(
                                width = 6,
                                h1("test")
                            ),
                            column(
                                width = 6
                                
                            )
                        )
                    )
            ),
            tabItem(tabName = "home",
                    fluidRow(
                        column(
                            width = 12,
                            
                        )
                    )
            ),
            tabItem(tabName = "data_winter",
                    fluidRow(
                        column(
                            width = 12,
                            DTOutput('data_winter')
                        )
                    )
            ),
            tabItem(tabName = "data_summer",
                    fluidRow(
                        column(
                            width = 12,
                            DTOutput('data_summer')
                            
                        )
                    )
            )
            
        )
        
    
    )
)