---
author: Kyoko Yamaguchi
date: 23 June 2026
title: Multivariate Statistics
---

# Overview
This code repository holds code relevant to multivariate statistics.

For now, it mostly contains analyses performed for the "Applied Multivariate Statistics" class at OSU taken by the author in Autumn of 2021.

# Data

Handwritten digits scanned from the ZIP codes written on samples of U.S. postal envelopes. In this project, we focus on digits "7" and "9" only. Each digit image (resulting from a 16 x 16 grayscale matrix) is represented by a 256 dimensional vector of normalized intensity values.

The computer code, final.R, was provided to help read in and visualize individual digit images (train.7.txt and train.9.txt), and split the data into a training set of 800 observations (400 for each digit) and a test set of 489 (245 "7"s and 244 "9"s).

# Goals

The main focus of this project is how to represent the data in much fewer dimensions and how to use such representations for classification of the two digits.


# Structure
* code: All relelvant code is found in "code".
* reports: The corresponding knitted HTML/PDF documents if applicable.
* data: data used for the analysis.