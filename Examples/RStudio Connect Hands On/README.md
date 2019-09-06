# RStudio Portfolio Training Exercises

Welcome! This document will guide you through a series of exercises that will introduce Flexdashboards, R Markdown and parameterized reports. These artifacts will be explored in the context of RStudio Connect.

Ignore this...
The best way to follow along is to use these exercises in the associated [RStudio Cloud project]( https://rstudio.cloud/spaces/679/join?access_code=1cBXxVAKvrGT0974ADsvqT6MJWaGSswElR2qQV1s).

## Getting Started

The exercises begin with a notebook labelled `01_building_blocks.Rmd`. This notebook includes the building blocks that will be used to populate the data products we'll build.

Start by opening the notebook and rendering each code chunk. The results should be an interactive chart, table, and some statistics on the latest Google (`GOOG`) stock prices.

Our motivation is to give insight to organization on how different stock prices change over time.

> A quick setup note. Please navigate to `Tools -> Global Options -> R Markdown` and change the dropdown for "Show output preview in" from Window to Viewer Pane.

## Answering Questions: Creating a Dashboard

To begin, we'd like to take the building blocks and compose them into a dashboard. Start by opening `02_dashboard_skeleton.Rmd`. This document uses the `flexdashboard` package, which is a powerful templating package for arranging building blocks into a composite dashboard.

1. Knit `02_dashboard_skeleton.Rmd`. Comparing the result side-by-side with the RMD, how does the Markdown syntax correspond to the resulting dashboard? (TIP: Expand the "Viewer" pane to be wide enough for the dashboard to appear fully). Without writing any code in the code snippets, can you change the skeleton to have two rows in the left column instead of the right column? 

1. Copy the code snippets from the code chunks in `01_building_blocks.Rmd` into the flexdashboard and then re-knit the document. I've included the `setup` chunk already.

2. Replace `sprintf('%g%%', round(volatility*100,2))` with `valueBox(sprintf('%g%%', round(volatility*100,2)))` and then re-render the document. What changes occur? Run `?valueBox` to explore the other available options.


## Transitioning to a Report: Parameterized R Markdown

In the first section we created a RMD report that allows users to explore information on a single stock. This type of exploratory analysis is very helpful but often people want to explore other views.

> Quick setup note! Please run the following in the R console: `webshot::install_phantomjs()`

1. Open `03_parameterized_report.Rmd`. This report uses the same building blocks, and renders a html document. Knit the document to see the differences.

Before, our report was hard-coded the use of `GOOG`. We'd like to make the document more flexible so that we can see data for different stocks. 

2. Add at the bottom of the YAML header (insert between lines 3 and 4):

```
params:
  ticker: 'GOOG'
```

3. Replace the 3 occurrences of `'GOOG'` inside the R code chunks with `params$ticker`. Once complete, use the dropdown by the "Knit" button on top of the source pane, select "Knit with Parameters". What happens?


### Dashboards on RStudio Connect

Now that we are happy with the dashboard, we want to deploy it to RStudio Connect. 

To do so, first visit: https://github.com/sol-eng/classroom-getting-started and go to step 6. 

Then, open `03_parameterized_report.Rmd` and click the blue publish icon in the upper right hand corner of the RStudio source pane. Select "Publish with Source Code". 

You'll be prompted to link RStudio to the account you created on RStudio Connect, enter the [URL for your server, it will look like this](http://ec2-54-202-230-54.us-west-2.compute.amazonaws.com/). Once connected, you'll be prompted to publish the application. **Please title the application as: yourFirstName_app**.

Once published, take some time to play with the RStudio Connect interface.

6. Usually you'll want your boss / colleagues to visit the app without seeing the RStudio Connect dashboard. Can you find the link that wil open the report outside of the RStudio Connect dashboard? 

7. How would you restrict access to your app? Can you visit your neighbour's app? Change the access controls so your neighbour can view your app. 

8. **Challenge**: Make some changes to the report and redeploy it. Can you figure out how to rollback to the first deployed version of the application?


### Parameterized Reports on RStudio Connect

Now that the report is built, we can use RStudio Connect to handle regularly running the report and pushing out notifications. 

With `03_parameterized_report.Rmd` published, investigate the different options in Connect for parameterized reports. Can you email yourself the report? Can you setup a schedule to email your neighbour the report? Can you view previous renderings of the report?

6. Our report accepts a parameter - the stock ticker symbol. See if you can configure RStudio Connect to email a version of the report for GOOG every Monday and a version for TSLA every Tuesday. 

Hint: On the left hand side you'll see a bar that says "Input", open the sidebar to change the parameters. Elect "Save" to create a new version of the report.

STOP HERE

Below is for you to investigate later

### Customizing email output

7. Here is where things get exciting. RStudio Connect allows you to customize the email sent to your audience using hidden code in the report. To see this, create a new R code chunk at the end of  `03_parameterized_report.Rmd` and copy the following:

```r
change <- price$change[price$date == Sys.Date()-1]
volume <- price$volume[price$date == Sys.Date()-1]
adj <- price$adjusted[price$date == Sys.Date()-1]
sign <- ifelse( change > 0, 'up', 'down')

subject <- sprintf(
  '%s is %s by $%s yesterday!', 
  params$ticker, 
  sign, 
  as.character(abs(round(change, 2)))
)

body <- glue("
   Hello Team,
   
   Yesterday, {params$ticker} closed {sign} by ${abs(round(change,2))}.
   The volume was {volume} and the final adjusted price was ${round(adj, 2)}.
   Let's keep an eye on the volatility, currently at {sprintf('%g%%', round(volatility*100,2))}.
   
   Best,
   
   Steven
")

rmarkdown::output_metadata$set("rsc_email_subject" = subject)
rmarkdown::output_metadata$set("rsc_email_body_text" = body)
```

8. Redeploy the R Markdown document by clicking the blue publish button again. Once deployed, have RStudio Connect send you an email based off of the new report (by clicking the mail icon in the top menu bar in RStudio Connect).

**Challenge Questions**: 

Skim through http://docs.rstudio.com/connect/user/r-markdown.html#r-markdown-email-customization. Brainstorm some R code that would:

9. Only have RStudio Connect send an email if the price change yesterday was greater than 5% of the stock's value.

10. Include a csv file in the output that contains the stock's ohlc data. 

Hints: http://colorado.rstudio.com/rsc/connect/#/apps/1008/access/1086

### What's Next?

One of the interesting use cases for R Markdown within RStudio Connect is using R Markdown to schedule and automate tasks that are not specific to reporting. Many organizations create R Markdown documents that run ETL processes. You can even include code chunks for other languages!

Some examples:

http://colorado.rstudio.com/rsc/connect/#/apps/1032/access/1110

http://colorado.rstudio.com/rsc/connect/#/apps/7/access/6


## Extending to Services:  Plumber APIs

The previous two sections covered how to share analytic insights with end users through web applications, reports, and push notifications (email). Another important class of analytic "consumers" are external services like front-end web sites, Java applications, point-and-click BI tools, or ETL pipelines. Unlike people, these tools don't consume R through applications and documents. Instead, these tools communicate through APIs (Application Programming Interfaces). 

The plumber package makes it easy to turn an R function into a RESTful API, which allows all those other external services to communicate with R.

Our goal is to use plumber to create a RESTful API that will allow other systems to pass R a stock ticker symbol and receive back from R the stock's volatility. 

To begin, open `plumber.R`. I've created the scaffolding for our API. 

1. Using our building blocks code, fill in a function that will return volatility given a stock ticker symbol. In the IDE, click "RUN API" and play around with the results.

2. **Challenge** Can you change the API to take a series of ticker symbols instead of a single one, and return the volatility of each?

Hint: You'll want your function to accept a JSON request object instead of just accepting a single function argument that is a string. Then you'll want to parse the JSON request, calculate the volatility, and then return a JSON object with the results. See: https://www.rplumber.io/docs/routing-and-input.html#request-body

```r
library(jsonlite)

get_volatilities <- function(json_input) {
  tickers <- fromJSON(json_input)
  volatilities <- sapply(tickers, get_volatility)
  toJSON(volatilities)
}

# create test inputs using toJSON
tickers <- c('GOOG', 'TSLA')
test_input <- toJSON(tickers)
get_volatilities(test_input)
```

Full Solution: https://gist.github.com/slopp/721e84ba595da5c3dc074a1957aa7929

### Plumber APIs on RStudio Connect

Just like Shiny applications, once you've developed an API you need a way to deploy, scale, and secure it. Use the same publish button to publish `plumber.R` to RStudio Connect, **please title your content yourName_api**.

3. List the RStudio Connect settings that are relevant for Plumber APIs

4. In the RStudio Connect settings pane for your API, change the access controls to "Anyone". Then,  using the auto-generated documentation for the API, follow the "Try It Out" instructions. Near the bottom you should see a sample curl command. Copy that command and then open the RStudio Terminal to run it. 

5. **Challenge** RStudio Connect supports authentication for plumber APIs just like other content types. However, external services requesting an API can't interactively  authenticate. Instead, RStudio Connect supports API keys. In the RStudio Connect settings pane for your API, restrict the access to your API to a "Just me". Follow these instructions to see create an API key for your user, and then see if you can craft a curl command that uses the API key to authenticate against your API.

Instructions: http://docs.rstudio.com/connect/user/api-keys.html#api-keys-examples


 https://gist.github.com/slopp/bbc9e8a88a6fe1aebafe9ca425c574f3/revisions?diff=split&w=1
