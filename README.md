# Wearable Computing
## Creating a Tidy Dataset from Publically Available Data on Samsung Galaxy S Smartphones
====================================

![alt text](http://archive.ics.uci.edu/ml/assets/logo.gif)  
Source: archive.ics.uci.edu/ml/assets/logo.gif  

**References:**  
[1] Coursera Data Source. Retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
[2] Reyes-Ortiz, J.L., Anguita, D., Ghio, A., & Oneto, L. (2012, December). *Human activity recognition on smartphones using a multiclass hardware-friendly support vector machine.* Retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
  
 
### README CONTENTS 

**1) File Download and Placement**  
**2) R Packages Required to Execute Script**  
**3) Information About the Dataset**

====  

#### 1) File Download and Placement  

Thank you for taking an interest in this data analysis. The information in this README file will help you download the source data and place the data in the proper directory on your computer so the R script *run_analysis.R* executes properly. This is the only script necessary to reproduce this data analysis.

**File Download**

The data for this project was provided by the course instructor [1] and is based on the original source [2] at a machine learning site. Please download this .zip file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**File Placement**

Once downloaded, you must extract all the files such that all files are located in a folder called "UCI HAR Dataset". There are 

>**Please Note**: Be sure that during the extraction you place the files in the correct location. Very often, the file extraction utility will create a folder "UCI HAR Dataset" and then place **another folder of the same name** within that folder. To avoid this, at the dialog box that says *"Files will be extracted to this folder"* ensure that "UCI HAR Dataset" is not included in the path.

Once complete you should see the following files in a folder called "UCI HAR Dataset":
* *README.txt*
* *features_info.txt*
* *features.txt*
* *activity_labels.txt*
* *train/X_train.txt*
* *train/y_train.txt*
* *test/X_test.txt*
* *test/y_test.txt*
* *train/subject_train.txt*
* *test/subject_test.txt*

There are also files in folders called *Inertial Signals* but they are not used for this analysis.

#### 2) R Packages Required to Execute Script

The only package required in the script is the *data.table* package. You can check your loaded packages to see if you have it. If not, from the R console type the command *install.packages("data.table")* and it will download from the internet. 

The *library(data.table)* command is already included in the script so if you have the package loaded the script will activate the package.

#### 3) Information About the Dataset

The source data was collected during an experiment utilizing 30 subjects. Here is a description of the data as noted by Reyes-Ortiz, Anguita, Ghio, and Oneto [2]:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The [CodeBook.md](../master/Codebook.md) contained in this repository and the file *features_info.txt* provide additional details about the data.

Again, thank you for your interest in this analysis. I look forward to your comments and feedback.  
*Jay Gendron*