# CodeBook

## Raw data
This data results from transformation of the data set "Human Activity Recognition Using Smartphones Data Set". A full description is available [online](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Processed data

The raw data was manipulated to extract the means of all measured feature per test subject and activity

### Subject

Each test subject has been assigned an ID

### Acitivty

This describes the type of acitivity while the feature values are measured. Activities are
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Featue values

The features have composed names that are based on the raw data feature names.

They are either based on
* time (Time) or
* frequency (Frequency)

The values represent either
* mean (Mean) or
* standard deviation (Std)

The features come from measurements of the accelerometer and gyroscope 3-axial raw signals. The variable in the end represents the axis that is measured:
* X
* Y
* Z

The signals were either evaluated as
* acceleration (Acc)
* jerk (Jerk)
* magnitude (Mag)

#### Example:

Time.BodyAcc.Mean.X is the mean time of the body accelleration on the x-axis

#### Relation to original names

* the starting "f" and "t" were replaced by "Frequency." and "Time."
* the parts "mean()" and "std()" were replaced by ".Mean" and ".Std"

#### Important note:
Each feature value is a mean of all values of this feature for a specific subject and activity.*

