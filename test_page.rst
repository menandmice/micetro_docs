.. _test-page:

.. meta::
  :description: Test page for Viska
  :keywords: restructuredtext, rst, test page

.. This is a comment. It shouldn't show up on the page, but it's useful internally.

See the page source for the meta and comments directives.

Most pages have a 'toctree' directive to control structure and the sidebar navigation.

.. toctree::
  :maxdepth: 2

Sometimes I use the 'contents' directive instead, which doesn't affect the sidebar.

.. tip::
  Take a look at `the reStructured Text directives <https://docutils.sourceforge.io/docs/ref/rst/directives.html>`_ as we might pick from those in the future/on occasion. Below are the ones that I'm already using a lot.

Part header
###########

Such as "Implementation Guide" or "User Manual".

I often use directives for:

.. warning::
  This is a warning.

.. danger::
  This is a danger warning.

.. note::
  This is a note.

.. tip::
  This is a tip.

Chapter header
**************

Such as "DNS" or "Automation".

Although *right now* I'm not using it often, but the next stage in developing the documentation will focus on splitting the large pages into a bunch of small ones, and using the 'include' directive, like so:

.. include:: include_test_page

Section header (usually used as h1 on pages)
============================================

Subsection header (h2)
----------------------

Be sure to look at the `reStructured Text Primer <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ for stuff I may have missed.

.. highlights::

  This is a highlight.

  * Sometimes

  * with

  * a list.

.. _inline-markup:

Paragraph header
""""""""""""""""

Since this is a documentation, there's a lot of internal links (such as :ref:`webapp-filtering`) and some `external links <https://menandmice.com>`_. External links should open in a new tab, internal links stay in the current tab. (Unless directed by the user.) Internal references are unique across the entire documentation (per branch) and you can see how they're constructed in the page source above the "Paragraph header" here.

Inline markup is generally limited to **strong**, *italic*, and ``literal`` (for stuff like inline code or the like). [1]_

.. [1] footnotes I also use here and there.

There's menu selection formatting: :menuselection:`File --> New --> DHCP server`

And formatting that signifies buttons and other GUI elements: :guilabel:`Add --> New DNS zone`

There are images:

.. image:: ../../images/micetro.png
  :width: 75%
  :align: center

And "figures" (images with captions):

.. figure:: ../../images/menandmice.png
  :width: 75%
  :align: center

  Image caption.

Two kinds of tables:

1. csv table

.. csv-table::
  :header: "Column 1", "Column 2"
  :widths: 30, 70

  "Cell 1", "Cell 2"
  "Cell 3", "Cell 4"

2. "drawn" table (for when I need multiple lines or more complex inline markup within cells)

+-------------------------+----------------------------------------------------------------+
| I don't like to use it  | But sometimes it's necessary.                                  |
| because it's a pain     |                                                                |
| to create and maintain. |                                                                |
+=========================+================================================================+
|                         | * item 1                                                       |
| Like when I need a list |                                                                |
|                         | * item 2                                                       |
+-------------------------+----------------------------------------------------------------+

I also use code snippets sort of often:

1. code blocks with syntax highlighting (bash, xml, yaml; not many more)

.. code-block:: yaml
  :linenos:

    - name: Create a new zone
      mm_zone:
        state: present
        name: example.com
        nameserver: ns1.example.com
        authority: micetro.example.net
        customproperties:
          location: London
        provider:
          mmurl: http://micetro.example.net
          user: apiuser
          password: apipasswd
      delegate_to: localhost

For ``bash`` (instructions to be done in the command line) I don't use line numbers. Configuration files and scripts and the like will get the line numbers.

2. "Literal paragraphs" meaning whatever I put into this will be unformatted. Mostly used for licenses and some of the config files in Ansible/Terraform.

::

  This is a literal block.

  It will stay unformatted and uses a monotype font.

----

(Check the separator line.)

I also often use "glossary" such as:

Keyword
  Explanation.

A lot of the different markups can be nested within each other, like:

Start with a "glossary"
  that goes into an explanation

  .. note::
    But there's a note.

  And another level of glossary
    With explanation

    .. csv-table::
      :widths: 50, 50

      "And", "a table"
      "**bold**", "with ``code``"

    .. warning::
      Here be dragons.

Back to
  safety.
