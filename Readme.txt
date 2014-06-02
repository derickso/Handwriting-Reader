Instructions for running the Java program (decision Tree):
Step 1: Check if all the files are in the right path. The default root path of this program is “D:\\workspace\\AITree\\”. All the files, including training data and test data, should be at this path. Or change the rootPath in the code to make it work on a different platform. Make changes to trainMain.java and DecisionTree.java, variable name rootPath.

Step 2: Train the program by typing in ( 1 TrainfileFolderName\ FileName ).

Note: The file name should be contained in the train folder and are numbered. For example TimesNewRoman1, TimesNewRoman2, TimesNewRoman3…

Step 3: Form and test the test set by typing in ( 3 TestfileFolderName\ FileName).

Note: The test file name should be contained in the test folder and are numbered.

Step 4: Train the program by learning the wrong prediction by typing in ( 5 ).

Step 5: Retest the test set by typing in ( 4 ) or create a new testing set by going back to Step 3 to form a new testing set and test it.


List of Commands

1 - Train

Usage: 1 TrainfileFolderName FileName

2 - TrainAll  //This can only be done after at least one train

Usage: 2

3 - Test  //Form Test All

Usage: 3 TestfileFolderName FileName

4 - Test All //This can only be done after at least one test

Usage 4

5 - Train Wrong //This can only be done after at least one test

Usage: 5


Instructions for the Template Matcher:

Run Readme.m
This will use the image templates from the Templates folder and create output file 'output2.txt' in the results folder. 
This shows the top 5 letter choices and their SSD scores for each letter in the image.

Run DictionaryLookup.py
This will read the 'output2.txt' file and create 'output3.txt' This is the final output
