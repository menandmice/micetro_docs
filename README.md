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
It is possible to build the documentation in 2 ways, either by using sphinx directly or with shpinx-autobuild

### Sphinx
The following steps are needed for building micetro_docs with sphinx
 * Open a command line window
 * Checkout the Git repository at https://github.com/menandmice/micetro_docs.git in some local folder
 * Navigate to the local folder
 * Run `pip install pipenv`
 * Run `pipenv install`, this should install the necessary python libraries as defined in `requirements.txt`
 * Run `pipenv run sphinx-build -M html . build/` which will build the solution and put the output into the `build` folder
 * Navigate to `build\html` and open index.html in a browser
 * This should open up the documentation

This would be the preferred approach when it is only needed to build the documentation once e.g. in build pipelines for internal deployment and testing

### Sphinx autobuild
When working locally it can become cumbersome to manually build the documentation after every change. In this case it is better to use sphinx-autobuild as that will monitor a folder on the local filesystem and reload the documentation after every change, the end result is then hosted in a web server running on a local port. To start sphinx-autobuild
  * Open a command line windows
  * Checkout the Git repository at https://github.com/menandmice/micetro_docs.git in some local folder
  * Navigate to the local folder
  * Run `pip install sphinx-autobuild`
  * Run `sphinx-autobuild . build/html`

After this then sphinx should be running on http://127.0.0.1:8000 and navigating to this path in a browser should open up the documentation

For more information on sphinx-autobuild see https://github.com/sphinx-doc/sphinx-autobuild
