
fluidPage(
  
  #Application Title and Logo
  fixedRow(
    column(8,
           titlePanel("Prioritizing the management of quality issues related to
                      substandard medicines"), 
    
           h5("Developed by: Ang PS, Teo CHD, Toh YL, Ng SYM, Choong CT, Phuah STD, Tan HMD, Tan MF, Tan SHM, Koh ST, Thinn WM, Poh WWJ & Dorajoo SR"),
           h6("Vigilance and Compliance Branch, Health Sciences Authority, Singapore"),
           
           offset = 2, align = "center")
    
          
  ),	#Brackets closing "fixedRow"
  
  hr(),	
  
  #Sidebar
  sidebarLayout(
    sidebarPanel(width = 4,
      
  
      

      h4("Enter case details here:"),

radioButtons(inputId = "vizD",
             label = "1. Visual detectability of defect", choices = list("Visible" = 1, 
                                                                        "Not visible / poorly visible" = 2), selected = 1, inline=TRUE),

selectInput(inputId = "ORA", label = "2. Overseas regulatory action", width = 500,
            choices = c("Yes" = 1, "No" = 2, "Unknown at present" = 3), selected = 3),

selectInput(inputId = "Txid", label = "3. Therapeutic indication of product", width = 500,
            choices = c("Lifesaving therapy" = 1, "Disease treatment" = 2, "Symptomatic relief" = 3, 
                        "Diagnostic use" = 4, "Prophylactic vaccine" = 5), selected = 2),

selectInput(inputId = "meddra",width = 500,
            label = "4. Select the most appropriate MedDRA LLT", 
            choices = list("Accompanying dose delivery device issue" = 1, 
                           "Contamination with chemical substance" = 2,
                           "Contamination with microbes" = 3,
                           "Contamination with glass and/or metal particle" = 4,  
                           "Contamination with foreign matter" = 5,
                           "Contamination with body fluid" = 6,
                           "Product mix up" = 7,
                           "Product inner label issue impacting strength, dose and/or safety" = 8,
                           "Product inner label issue NOT impacting strength, dose and/or safety" = 9,
                           "Product outer label issue impacting strength, dose and/or safety" = 10,
                           "Product outer label issue NOT impacting strength, dose and/or safety" = 11,
                           "Product leaflet missing" = 12,
                           "Product leaflet issue impacting strength, dose and/or safety" = 13,
                           "Product leaflet issue NOT impacting strength, dose and/or safety" = 14,
                           "Product batch number missing, illegible or incorrect" = 15,
                           "Product expiration date missing, illegible or incorrect" = 16,
                           "Product primary packaging issue" = 17,
                           "Product secondary packaging issue" = 18,
                           "Product adhesion issue" = 19,
                           "Product deposit" = 20,
                           "Product physical issue" = 21,
                           "Product volume incorrect" = 22,
                           "Product quantity incorrect" =23,
                           "Product adulterated and/or contains prohibited substance" = 24,
                           "Product counterfeit" = 25,
                           "Product unregistered" = 26,
                           "Out of specification or out of trend test result" = 27,
                           "Manufacturing non-compliance" = 28,
                           "Product formulation issue" =29, 
                           "Product storage issue" = 30,
                           "Inappropriate release of product for distribution" =31,
                           "Lack of efficacy" = 32), selected = 3),


      align = "left"),	#Brackets closing "sidebarPanel"
    
    mainPanel(
      br(),
      h4(("Critical case details:"), align = "left"),

    
div(textOutput("TXIDDisplay"), style = "color:black", align = "left"),
div(textOutput("meddraDisplay2"), style = "color:black", align = "left"),
div(textOutput("vizDdisplay"), style = "color:black", align = "left"),
div(textOutput("ORADisplay"), style = "color:black", align = "left"),

br(),
textOutput("statement"),
textOutput("class")

      
    )	#Brackets closing "mainPanel"
    
  )	#Brackets closing "sidebarLayout"
  
)	#Brackets closing "fixedPage"
