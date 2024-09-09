# Micetro

Welcome to the documentation repository for Micetro, a backend-agnostic DDI orchestration software for complex enterprise network environments.

![micetro](https://user-images.githubusercontent.com/7282347/137749200-e209daf1-f00b-4489-9b0e-419d9928259c.png)


Deployed in any on-premises, hybrid, or multicloud network environment, Micetro acts as a non-disruptive overlay that unifies server management under a single GUI and API. Micetro is a modular, software-defined DDI solution built around a number of components, and accessed through a unified user interface and API.

Learn more on https://menandmice.com

A free trial is available at https://https://bluecatnetworks.com/products/micetro/#form-micetrotrial

# How to build the documentation locally
When writing documentation it is a good practice to have a local build to verify the setup and overall syntax before making a pull request to change the documentation itself. This section describes how to do a local build.

## Prerequisites
To be able to build the `micetro_docs` repository using Sphinx, the following tools needs to be installed:
  * Python 3
  * Git

## Build
It is possible to build the documentation in 2 ways, either by using Sphinx directly or with Shpinx autobuild

### Sphinx
The following steps are needed for building micetro_docs with Sphinx
 * Open a command line window.
 * Check out the Git repository at https://github.com/menandmice/micetro_docs.git in some local folder.
 * Navigate to the local folder.
 * Run `pip install pipenv`.
 * Run `pipenv install`, this should install the necessary python libraries as defined in `requirements.txt`.
 * Run `pipenv run sphinx-build -M html . build/` which will build the solution and put the output into the `build` folder.
 * Navigate to `build\html` and open index.html in a browser.
 * This should open up the documentation.

This would be the preferred approach if you only need to build the documentation once, such as in build pipelines for internal deployment and testing.

### Sphinx autobuild
When working locally, it can become cumbersome to manually rebuild the documentation after every change. In this case, it is better to use Sphinx, autobuild as that will monitor a folder on the local filesystem and rebuilds the documentation after each change, the end result is then hosted on a web server running on a local port. To start sphinx-autobuild:
  * Open a command line windows.
  * Checkout the Git repository at https://github.com/menandmice/micetro_docs.git in some local folder.
  * Navigate to the local folder.
  * Run `pip install sphinx-autobuild`.
  * Run `sphinx-autobuild . build/html`.

After this, Sphinx should be running on http://127.0.0.1:8000 and navigating to this path in a browser should open up the documentation.

For more information on Sphinx autobuild, see https://github.com/sphinx-doc/sphinx-autobuild.
