CodeBook
========

* subject - [1,30]; unique ID of the subject
* activity - {"walking", "walking upstairs", "walking downstairs", "siting", "standing", "laying"}; identifier of the activity performed

Since there are few hundreds of feature variables, only the construction of variable names is described below:

* Domain ("time", "frequncy") prefixes - Indicates that the variable is from time/frequency domain.
* Stems of the variable names should be self explanatory
* Axis ("x", "y", "z") suffixes - Indicates what axis the variable is assigned to.
* Function suffixes copied from the original codebook:
  * mean: Mean value
  * std: Standard deviation
  * mad: Median absolute deviation 
  * max: Largest value in array
  * min: Smallest value in array
  * sma: Signal magnitude area
  * energy: Energy measure. Sum of the squares divided by the number of values. 
  * iqr: Interquartile range 
  * entropy: Signal entropy
  * arCoeff: Autorregresion coefficients with Burg order equal to 4
  * correlation: correlation coefficient between two signals
  * maxInds: index of the frequency component with largest magnitude
  * meanFreq: Weighted average of the frequency components to obtain a mean frequency
  * skewness: skewness of the frequency domain signal 
  * kurtosis: kurtosis of the frequency domain signal 
  * bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.
  * angle: Angle between to vectors.

The tidy data set presents only means of all variables for each combination of subject-activity. 
All feature variables are normalized and bounded within [-1,1].
