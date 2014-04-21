# Wearable Computing
## Creating a Tidy Dataset from Publically Available Data on Samsung Galaxy S Smartphones
====================================

![alt text](http://archive.ics.uci.edu/ml/assets/logo.gif)  
Source: archive.ics.uci.edu/ml/assets/logo.gif  

**References:**  
[1] Reyes-Ortiz, J.L., Anguita, D., Ghio, A., & Oneto, L. (2012, December). *Human activity recognition on smartphones using a multiclass hardware-friendly support vector machine.* Retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
[2] Coursera Data Source. Retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
 
### CONTENTS 

**1) Variable Dictionary**  
**2) Data Files Required to Reproduce Analysis**    
**3) Data Transformations in script run_analysis.R**  

====  

#### 1) Variable Dictionary  

All data is based on work by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto [1] and furthered refined by course instructors [2].  

A total of 81 variables appears in the synthesized tidy dataset. The first two are identifier variables:  
* subjectid - categorical variable identifying the subject by identification number {1 through 30}  
* activities - categorical variable identifying one of six activities taken by the subject {walking, walkingupstairs, walkingdownstairs, sitting, standing, laying}. It is the dependent variable.  

The remaining 79 variables are all numerical and serve as the explanatory (independent) variables. The 79 variables are comprised of two categories of signals: time domain and frequency domain. These signals were used to estimate variables of the feature vector for each pattern.  

**Time domain signals (variables) - as denoted by the 't' prefix**
*Note:*  
* *'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*  
* *mean() indicates Mean value and std() indicates Standard Deviation*  

| Variable             | Description                               |
| ---------------------| ----------------------------------------- |
| tbodyacc-mean-x      | mean of body accelerometer signal in X    |
| tbodyacc-mean-y      | mean of body accelerometer signal in Y    |
| tbodyacc-mean-z      | mean of body accelerometer signal in Z    |
| tbodyacc-std-x       | s.d. of body accelerometer signal in X    |  
| tbodyacc-std-y       | s.d. of body accelerometer signal in Y    |  
| tbodyacc-std-z       | s.d. of body accelerometer signal in Z    |  
| tgravityacc-mean-x   | mean of gravity accelerometer signal in X | 
| tgravityacc-mean-y   | mean of gravity accelerometer signal in Y |   
| tgravityacc-mean-z   | mean of gravity accelerometer signal in Z |   
| tgravityacc-std-x    | s.d. of gravity accelerometer signal in X |   
| tgravityacc-std-y    | s.d. of gravity accelerometer signal in Y |
| tgravityacc-std-z    | s.d. of gravity accelerometer signal in Z |
| tbodyaccjerk-mean-x  | mean of body linear acceleration in X     | 
| tbodyaccjerk-mean-y  | mean of body linear acceleration in Y     |  
| tbodyaccjerk-mean-z  | mean of body linear acceleration in Z     |  
| tbodyaccjerk-std-x   | s.d. of body linear acceleration in X     |  
| tbodyaccjerk-std-y   | s.d. of body linear acceleration in Y     |  
| tbodyaccjerk-std-z   | s.d. of body linear acceleration in Z     | 
| tbodygyro-mean-x     | mean of gyroscope 3-axial signal in X     |
| tbodygyro-mean-y     | mean of gyroscope 3-axial signal in Y     |
| tbodygyro-mean-z     | mean of gyroscope 3-axial signal in Z     |
| tbodygyro-std-x      | s.d. of gyroscope 3-axial signal in X     |
| tbodygyro-std-y      | s.d. of gyroscope 3-axial signal in Y     |
| tbodygyro-std-z      | s.d. of gyroscope 3-axial signal in Z     |
| tbodygyrojerk-mean-x | mean of angular velocity in X             |
| tbodygyrojerk-mean-y | mean of angular velocity in Y             |
| tbodygyrojerk-mean-z | mean of angular velocity in Z             |
| tbodygyrojerk-std-x  | s.d. of angular velocity in X             |
| tbodygyrojerk-std-y  | s.d. of angular velocity in Y             |
| tbodygyrojerk-std-z  | s.d. of angular velocity in Z             |
| tbodyaccmag-mean     | mean of magnitude of bodyacc signal       |
| tbodyaccmag-std      | s.d. of magnitude of bodyacc signal       |
| tgravityaccmag-mean  | mean of magnitude of gravityacc signal    |
| tgravityaccmag-std   | s.d. of magnitude of gravityacc signal    |
| tbodyaccjerkmag-mean | mean of magnitude of bodyaccjerk signal   |
| tbodyaccjerkmag-std  | s.d. of magnitude of bodyaccjerk signal   |
| tbodygyromag-mean    | mean of magnitude of bodygyro signal      |
| tbodygyromag-std     | s.d. of magnitude of bodygyro signal      |
| tbodygyrojerkmag-mean| mean of magnitude of bodygyrojerk signal  |
| tbodygyrojerkmag-std | s.d. of magnitude of bodygyrojerk signal  |


**Frequency domain signals (variables) - as denoted by the 'f' prefix**
*Note:*  
* *'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*  
* *mean() indicates Mean value and std() indicates Standard Deviation*

| Variable                      | Description                                 |
| ------------------------------| ------------------------------------------- |
| fbodyacc-mean-x               | mean of body accelerometer signal in X      |
| fbodyacc-mean-y               | mean of body accelerometer signal in Y      |
| fbodyacc-mean-z               | mean of body accelerometer signal in Z      |
| fbodyacc-std-x                | s.d. of body accelerometer signal in X      |  
| fbodyacc-std-y                | s.d. of body accelerometer signal in Y      |  
| fbodyacc-std-z                | s.d. of body accelerometer signal in Z      |  
| fbodyacc-meanfreq-x           | mean freq of bodyacc in X                   |  
| fbodyacc-meanfreq-y           | mean freq of bodyacc in Y                   |
| fbodyacc-meanfreq-z           | mean freq of bodyacc in Z                   |
| fbodyaccjerk-mean-x           | mean of body linear acceleration in X       | 
| fbodyaccjerk-mean-y           | mean of body linear acceleration in Y       |  
| fbodyaccjerk-mean-z           | mean of body linear acceleration in Z       |  
| fbodyaccjerk-std-x            | s.d. of body linear acceleration in X       |  
| fbodyaccjerk-std-y            | s.d. of body linear acceleration in Y       |  
| fbodyaccjerk-std-z            | s.d. of body linear acceleration in Z       | 
| fbodyaccjerk-meanfreq-x       | mean freq of bodyaccjerk in X               |  
| fbodyaccjerk-meanfreq-y       | mean freq of bodyaccjerk in Y               |
| fbodyaccjerk-meanfreq-z       | mean freq of bodyaccjerk in Z               |
| fbodygyro-mean-x              | mean of gyroscope 3-axial signal in X       |
| fbodygyro-mean-y              | mean of gyroscope 3-axial signal in Y       |
| fbodygyro-mean-z              | mean of gyroscope 3-axial signal in Z       |
| fbodygyro-std-x               | s.d. of gyroscope 3-axial signal in X       |
| fbodygyro-std-y               | s.d. of gyroscope 3-axial signal in Y       |
| fbodygyro-std-z               | s.d. of gyroscope 3-axial signal in Z       |
| fbodygyro-meanfreq-x          | mean freq of gyroscope 3-axial signal in X  |
| fbodygyro-meanfreq-y          | mean freq of gyroscope 3-axial signal in Y  |
| fbodygyro-meanfreq-z          | mean freq of gyroscope 3-axial signal in Z  |
| fbodyaccmag-mean              | mean of magnitude of bodyaccmag signal      |
| fbodyaccmag-std               | s.d. of magnitude of bodyaccmag signal      |
| fbodyaccmag-meanfreq          | mean freq of bodyaccmag                     |
| fbodyaccjerkmag-mean          | mean of magnitude of bodyaccjerkmag signal  |
| fbodyaccjerkmag-std           | s.d. of magnitude of bodyaccjerkmag signal  |
| fbodyaccjerkmag-meanfreq      | mean freq of bodyaccjerkmag                 |                   
| fbodygyromag-mean             | mean of magnitude of bodygyromag signal     |
| fbodygyromag-std              | s.d. of magnitude of bodygyromag signal     |
| fbodygyromag-meanfreq         | mean freq of bodygyromag                    |
| fbodygyrojerkmag-mean         | mean of magnitude of bodygyrojerkmag signal |
| fbodygyrojerkmag-std          | s.d. of magnitude of bodygyrojerkmag signal |
| fbodygyrojerkmag-meanfreq     | mean freq of bodygyrojerkmag signal         |


For purposes of this data analysis, seven variables for angle measures including the word "Mean" were not included in the tidy dataset as they were not means() of primary variables. Rather, they were angles of earlier captured mean() variables. Those variables ignored include:

* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)


#### 2) Data Files Required to Reproduce Analysis
There are eight files required from the source dataset [2] to allow reproducible results of this analysis:

**Dependent Variables:**

* y_train.txt - containing activity performed for each observation in the training dataset
* y_test.txt - containing activity performed for each observation in the test dataset

**Independent (Explanatory) Variables:**

* X_train.txt - containing the training set of explanatory variable data
* X_test.txt - containing the test set of explanatory variable data

**Subject Variables:**

* subject_train.txt - containing subjects extracted for the train set
* subject_test.txt - containing subjects used in the test set

**Variable Names:**

* features.txt - containing names of all the explanatory variables
* activity_labels.txt - containing names of the six dependent variables

#### 3) Data Transformations in script run_analysis.R
Five primary transformations were executed on the dataset pulled from the original source [2] in order to create a tidy dataset for this Coursera course.

1. Merge training and test sets
After reading in all the tables explained above, the datasets split into train and test components were combined by rows into three dataframes using the rbind() command:
  * subjects - contains the subject_train.txt and subject_test.txt data
  * activities - contains the y-train.txt and y-test.txt data
  * data - contains the explanatory variables from X_train.txt and X-test.txt

After generating each of these three combined datasets the original files were removed from the environment using the rm() to keep the environment more readable to users.

2. Extract only measurements on the means and standard deviations
The measures for mean() and std() for each of the measures were extracted from the dataset named data using the grep() command. This resulted in a dataset called dataInt - isolating only the variables of interest. As noted above, this totaled 79 variables because it included the 13 meanfreq() variables but did not include the seven angle measures that used earlier harvested mean() variables.

A single data frame called transData was created by using the cbind() command to connect the three tables *subjects*, *activity*, and *dataInt*. This resulted in a 10,299 by 81 data frame with the following variables:
  * [,1] subject {from subjects}
  * [,2] activity {plain name of ActivityID}
  * [,4:81] by variable features {from data of interest} 

3. Use descriptive activity names
The activities dataset was transformed according to tidy data principles by changing the numeric codes for activities into plain names (e.g., standing) as provided in the file "activity_labels.txt". This variable was also transformed into a factor variable.

4. Appropriately label dataset with descriptive variables
As noted in the discussion forum, this was a step prone to misunderstanding. For purposes of this dataset, the instruction was interpreted to mean create descriptive variable names following tidy data principles for each of the 81 variables. This included the following transformations:
  * all variables were converted to lower case using the tolower() command
  * the parentheses after mean() and std() were removed to ease typing variable names into the console
  * the last nine variables in the dataset of interest were repaired to eliminate the duplication of the term "bodybody" to simply "body" for these three signals (fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag). The rationale was that the sequence "bodybody" did not appear in the source dataset documentation [1].

5. Create a second, independent tidy set with the average of each variable for each activity and each subject
A tidy dataset was created from a data table by using lapply() to apply the mean function across the 10,299 by 81 data frame. The lapply() command was used to tier the activities by subject. In other words, all observations for Subject 1 were aggregated to find the mean by activities 1 through 6 and recorded that way. This was repeated for Subjects 2 through 30. This resulted in a tidy data set of 180 rows (30 subjects * 6 activities/subject) by 81 columns.

This approach meets the tidy data rules because each row is an independent observation of means and standard deviations and each column is a separate variable. This data can then be manipulated by users to summarize means and standard deviations rolled up by subject or by activity.

Lastly, the tidy dataset generated in the R environment was written to a tab-delimited text version which allows it to be easily ingested into other platforms for viewing outside of R.