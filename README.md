# Cleaning-data
Getting and Cleaning Data Course Project
There were two main files in UCI HAR Dataset file named test and train. In the test file, there were two datasets contains main data as x-test in 2947 objects of 561 variables and the y-test tells us about the type of activities via 2947 objects of one variable. The same as the test file, we can find two main datasets x-train and y-train in the train file. The first one contains 7352 objects of 561 variables and the second one contains 7352 objects of one variable. 
As we are asked in the project, we substituted the numbers 1 to 6 with the related kind of activities in the y-test and the y-train files. Then we merged x-test with y-test (testbind) and x-train with y-train (trainbind). Finally, we merged both of them and make a new tidy dataset (databind).
We constructed a new data frame (tidydata) by extracting variables containing means and standard deviations. 
In the end, we classified mean.std by the type of activities into 6 variables called datasplit. For each variable (the type of activities) we computed the mean. The last table presented as the final list file.
