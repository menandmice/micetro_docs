.. meta::
   :description: An explanation of Micetro's versioning methodology
   :keywords: Micetro, version numbers, calendar-based

.. _version-numbers:

Versions
========

Starting with version 25.1.0, Micetro uses calendar-based versioning. In this methodology, version numbers are structured as **Year.Release Number in Year.Patch**. For example, in the version 25.1.1:

* **Year** indicates the last two digits of the calendar year, e.g., 25 indicates the version was released in the year 2025.
* **Release Number in Year** indicates the number of releases in the year, e.g., 1 indicates that it's the first release of the year. 
* **Patch** indicates the number of the patch for the given release, e.g., 1 indicates that it's the first patch after the release of 25.1.0.

Calendar-based versioning will not be applied retroactively to versions that were released before this change, i.e., 11.1.0 will remain 11.1.0.

Year releases are supported for two years.

Accessing documentation for your version
----------------------------------------
If you're using a version of Micetro that is not the most recent, you can access the documentation---including an installation guide, user guide, admin guide, and reference articles---by selecting your version from the dropdown in the upper left corner of the screen.

Because year releases are supported for two years, the documentation for year releases are also maintained for two years.
