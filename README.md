# Run_Analysis_Project
This REPO includes run_analysis to complete course project for Getting and Cleaning Data
run_analysis notes for Getting and Cleaning Data course project. 

Data can be found: 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data should be in folder of working directory: UCI HAR Dataset which is the root folder of the extracted file

You can view the output using the following:

	data <- read.table("final_dataset.txt", header = TRUE) 
	View(data)


The script does the following:

1. Merges columns of Test data (Subject, Measures, Activity) called dat

2. Merges columns of Train data (Subject, Measures, Activity) called dat2

3. Merges rows of Test and Train data to create complete dataset called dataset
	  This creates a TIDY dataset in which each observation is a row, and each variable is in a column

4. Extract list of Features, called Features

5. Create logical vector to subset Subject, Features including "mean" or "std", and Activity -  called Subset_Logical

6. Subset dataset to only include Subject, mean & std Features, and Activity using logical vector created above - called data_subset

7. Rename Activity codes to meaningful labels (WALKING, LYING, etc)

8. Create vector to Name the columns of data_subset - called Subset_Labels

9. Assign meaningful labels to column names (using Features.txt file)

10. Re-order columns so that Subject and Activity appear in first 2 columns.

11. Summarize mean by Subject and Activity. 

12. Write to file in working directory - called final_dataset.txt
