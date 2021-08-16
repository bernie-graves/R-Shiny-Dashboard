# Movie Sales with a R Shiny Dashboard

<p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="Images/shiny_R_logo.png" alt="Logo" width="400" height="200">
  </a>
</p>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about">About</a></li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#quickstart">Quickstart</a></li>
    <li><a href="#details">Details</a></li>
  </ol>
</details>

## About
In this project we created a dahsboard in R using Shiny that allows us to look at movie sales over time.
We then dockerized our R file to the data accessible to anyone through a container.
We also created actions that automatically pushs and builds an image for any changes made to the R code into our current container.

## Prerequisites
In order run and modify our app you need to following tools:
- [R (version 4.0.5 and later)](https://mirror.las.iastate.edu/CRAN/)
- [Docker desktop version](https://docs.docker.com/get-docker/)
- [Github desktop version](https://desktop.github.com/)
- [An account on GitHub](https://github.com/)

## Quickstart
In order to only run the project you will only need Docker Desktop:
1. The first step is to open docker desktop and get it running
2. next go to any powershell (for example CMD or PowerShell) and type the following.
   ```
   docker pull berniegraves/shiny-dashboard:main
   ```
   This will pull the image into your computer.
3. next type the following to run the image:
   ```
   docker run -dp 3838:3838 berniegraves/shiny-dashboard:main
   ```
4. And done!
   You can now see the shiny dashboard on any browser by going to the following URL:
   ```
   127.0.0.1:3838
   ```

## Details
### Project contents
- In this project we did some basic data analysis using R and displayed it in the form of a dashboard using the Shiny package.
  - In order to learn more about Shiny as a package and how to use it, [this tutorial](https://rstudio.github.io/shinydashboard/get_started.html) will help do just that.
  - The reason we chose Shiny as our tool to display the data was because it is relatively easy to learn and requires very little to no experience in web development lanaguages such as HTML. In addition, Shiny allowed us to do a little more that simply display the graphs by adding sliders and user controlled buttons to make the visualization more interactive.
- In order to make the project public to anyone without having them download R and install the packages or the dataset, we utilized Docker and created a docker image of our dashboard.
  - Docker allows users to exchange codes and packages without the need to install each of the packages and applications on each computer. by placing the project in a docker container, anyone with Docker Desktop can run our dashboard (using the steps under "Quickstart").
- Finally, we created 2 Github actions.
  - The first action that we created built a new Docker image whenever a pull request was made (basically automatically update the current live code), This made it so if anyone made any change in the code, the docker file will automatically update the code that it holds.
  - The second action basically runs a basic test to make sure that after a change in the code was made, it didnt break anything in the dashboard.
  - Together these two GitHub actions saved us a lot of the intermidiate steps that we would have had to do everytime any change was made. 

making pull request
test
