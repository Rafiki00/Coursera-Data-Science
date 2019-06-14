
#Method

The R script puts into variables the information contained in the test and train files and then assembles them into a larger dataset. The large dataset is then reshaped. Only the columns that have a measure of mean or of standard deviation are kept.

This was done manually, by looking in the variable names file. The column number of the useful columns was written in a vector to then extract those columns and drop the rest.Then, another vector containing the names of the variables was passed to the names() function to rename the variables to make them more descriptive.

With the dataset ready, using the "dplyr" package, the means of each column was taken, in relation to subject and activity.

Finally, the activities are renamed to provide a more clear dataset, that is output to a text file in the final step.


#Variables

In lines 1-16 of the R script, the variables created are mere holders of data from the test and train files, extracted via read.table. 

`test_train` is the variable that holds the combined train and test data together. After selecting the columns wanted, the test_train data passes from having 563 variables to having the necessary 68.

`datameans` is the variable created to hold the results of applying the function colMeans to the (subject + activity) cases.
