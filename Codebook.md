# Wearable Computing
## Creating a Tidy Dataset from Publically Available Data on Samsung Galaxy S Smartphones
====================================

![alt text](http://archive.ics.uci.edu/ml/assets/logo.gif)  
Source: archive.ics.uci.edu/ml/assets/logo.gif  

**References:**  
[1] Reyes-Ortiz, J.L., Anguita, D., Ghio, A., & Oneto, L. (2012, December). *Human activity recognition on smartphones using a multiclass hardware-friendly support vector machine.* Retreived from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
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


For purposes of this data analysis, seven variables including the word "Mean" were not included in the tidy dataset as they were not means() of primary variables. Those variables ignored include:

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
A number of transformations were executed on the found pulled from the original source [2] in order to create a tidy dataset

1. After reading in all the tables explained above, the train and test datasets were merged into three dataframes using the rbind() command:

..1. activities - contains the y-train.txt and y-test.txt data
..2. subjects - contains the subject_train.txt and subject_test.txt data
..3. data - contains the explanatory variables from X_train.txt and X-test.txt

2. A new variable (activity) was generated by transforming the activities codes into plain names from the file "activity_labels.txt". Additionally, that variable was also transformed into a factor variable.

3. The measures for mean() and std() for each of the measures were extracted from the dataset named data, resulting in a dataset called dataInt 

4. A single data frame called transDatawas created by using the cbind() command to connect the three tables and one new variable in this order:

..1. [,1] subject {from subjects}
..2. [,2] activity {new variable with plain name of ActivityID}
..3. [,4:81] by variable features {from dataInt}

The tidy data set reduces the number of rows from 10,299 to 180. It provides the data grouped first by subject and then activity. 180 rows meets the tidy data rules because each row is an independent observation of means and standard deviations and each column is a separate variable. This data can then be manipulated by users to summarize means and standard deviations rolled up by subject or by activity.
