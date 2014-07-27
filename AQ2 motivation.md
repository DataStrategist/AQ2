AQ2 Asset viewer motivation
========================================================
author: Amit Kohli
date: 2014.07.25

Introduction
========================================================

Main Problem: Assets of the [AQUASTAT](http://www.fao.org/nr/water/aquastat/main/index.stm) programme are very varied and dispersed; Users frequently find some but not all products. Since users are varied, some are looking for info by country, others by topic, and others by type.

Solution: Provide an interface that unites assets from:

- Main country database
- Website
- Various topical analyses

... and provides all assets in one easy-to-use platform, temporarily
called AQ2 (2nd query form for AQUASTAT).

Walk before you can run
========================================================

This project is possible due to the significant efforts made to 
process 'unstructured data'. Processing includes standardization (mainly in terms of file-names and locations) and metadata assignment, which allows assets to be treated logically (and also allows them to be put in a database and queried). As you can imagine, this has been and continues to be a considerable task.

About 3 000 assets have been identified (some of which are dynamic links that in turn query our main database). This project uses 507 entries, none of which are dyamic, just to prove the concept.

Notable challenges
===================================================

- The main challenge is to standardize different assets that have been generated over more than a decade. The selected approach is to have an excel file that uses macros and userforms to help staff complete standardization exercises and metadata assignment.

- Asset allocation to a country is sometimes tricky. Consider the difference between a global table with data on many countries, and a global report with information about the world. The first is a world-level file with information on individual countries, whereas the second is a world-level file with information about the world. Thus we see the difference between the *file*-level (determines in which tab results go), and the *offered*-level (selected by user in the dropdown).

Presentation thoughts
===============================================
How should results be presented? The first conceptual mockup consisted of a two step process:

1. Since the list of assets was in Excel, VBA was used to create a metadata-rich html file for each asset (name of html file is asset ID).
2. A query userform was created to identify desired assets, get the corresponding html files, and **include** them into a results page in the appropriate row/column.

Query userform  | Result page
------------- | -------------
![query userform](queryform.png)|![query userform](results.png)

Final product!
===============

The mockup proved that the idea was 'cute' but unwieldy, had a lot of moving parts, and would require lots of messing around in css... (read: Expensive, ugly and brittle!)

Enter Shiny :) It was decided to prove the concept with a table. It's intuitive and simple enough for everybody to use. Without further ado:

[Go see my project!](http://amit.shinyapps.io/AQ_asset_viewer/)

Note: This is far from a finished product. Country names and IDs are not harmonized, most assets are absent, and no parsing has been done (see my [to-do list](https://github.com/mexindian/AQ2/blob/master/to-do.txt) to see more details). It's at a good point to show the tool flexibility and to take the next and final step based on this.
