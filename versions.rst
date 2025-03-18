.. meta::
   :description: An explanation of Micetro's versioning methodology
   :keywords: Micetro, version numbers, calendar-based

.. _version-numbers:

Versions
========

Micetro uses calendar-based versioning, in which releases are numbered according to the year in which they are released, along with two rolling numbers that indicate the exact release number within a calendar year. In this methodology, version numbers are structured as **Year.Release.Patch**. For example, in the version 25.1.1:

* **Year** indicates the last two digits of the calendar year, e.g., 25 means the version was released in the year 2025. The first two digits of the year (e.g., 20) are not used.
* **Release** indicates the number of releases in the year, e.g., 1 indicates that it's the first release of the year. 
* **Patch** indicates the number of the patch for the given release starting from 0, e.g., 25.1.1 is the first patch after the release of 25.1.0.

Calendar-based versioning will not be applied retroactively to versions that were released before this change, i.e., 11.1.0 will remain 11.1.0.

Each release builds on top of the previous releases, so any new release contains fixes for bugs and issues that were resolved in previous releases. Patches are only used when specific issues in a particular release need to be addressed. Any fixes applied in a patch will also be aprt of the next release and any releases in the future.
Releases are supported for two years from their original release dates. Any patches applied on top of a release do not reset this timeframe, which always refers to the release date for which .0 is the patch number.

Accessing documentation for your version
----------------------------------------
If you're using a version of Micetro that is not the most recent, you can access the version-specific documentation---including an installation guide, user guide, admin guide, and reference articles---by selecting your version from the dropdown in the upper left corner of the screen.

Because year releases are supported for two years, the documentation for year releases are also maintained for two years.
