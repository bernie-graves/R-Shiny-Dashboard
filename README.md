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
testing push actions
making pull request
test
