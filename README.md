# GettingandCleaningData
Part 1
The script extracts the data from the url and unzip the file into the current working directory. Then combines the Test and Training datasets into one single dataset.
 1.1 The subject_test.txt and subject_train.txt file are first combined into one dataset.
 1.2 Then X_test.txt and Y_train.txt are combined into one dataset.
 1.3 Then subject dataframe, activity labels and the activity reading dataset(561 vector) are combined into one dataframe.
 1.4 Then the respective files in the Inertial Signals folder are combined together.

Part 2
Then the code extracts only the measurements on the mean and standard deviation for each measurement.

Part 3
In this part of the code the activity code is replaced with the activity labels.
Then stored into a data frame called "HumanActRecgAct"(for 561 vector data) and "HumanActRecgMeanStdAct"(for Mean and Standard deviation data extracted as part of setp2).

Part 4
"HumanActRecgAct" is assigned the variable names and "HumanActRecgMeanStdAct" was already assigned the variable name as part of the extraction in Part 3

Part 5
Then from the 561 column dataset(HumanActRecgAct), a tidy aggregrated dataset is created from it and written to a txt file called "TidyDataSet.txt" in the working directory.

