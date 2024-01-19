# Micetro by Men&Mice

Welcome to the documentation repository for Micetro by Men&Mice, a backend-agnostic DDI orchestration software for complex enterprise network environments.

![micetro](https://user-images.githubusercontent.com/7282347/137749200-e209daf1-f00b-4489-9b0e-419d9928259c.png)


Deployed in any on-premises, hybrid, or multicloud network environment, Micetro acts as a non-disruptive overlay that unifies server management under a single GUI and API. Micetro is a modular, software-defined DDI solution built around a number of components, and accessed through a unified user interface and API.

Learn more on https://menandmice.com

A free trial is available on https://menandmice.com/free-trial

# How to build the documentation locally
When writing documentation it is a good practice to have local build in order to verify the setup and overall syntax before making a pull-request to change the documentation itself. This section describes how to do a local build

## Prerequisites
In order to be able to build the `micetro_docs` repository using sphinx then the following tools needs to be installed
  * Python 3
  * Git

## Build
The following steps are needed for building micetro_docs
 * Open a command line window
 * Checkout the Git repository at https://github.com/menandmice/micetro_docs.git in some local folder
 * Navigate to the local folder
 * Run `pipenv install`, this should install the necessary python libraries as defined in `requirements.txt`
 * Run `pipenv run sphinx-build -M html . build/` which will build the solution and put the output into the `build` folder
 * Navigate to `build\html` and open index.html in a browser
 * This should open up the documentation
