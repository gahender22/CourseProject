# CODEBOOK

**subjectidnumber** an integer from 1 to 30 that identifies the subject associated with the record

**activity** one of six labels in the set of; WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, LAYING DOWN, SITTING, STANDING. The  label describes the activity being preformed by the subject while the data was collected

**COLLECTED DATA FEATURE NAMES**
  each feature name follows a formatting structure that describes what it measures
  *First letter*
    * t - indicates the value is a measure in the time domain
    * f - indicates the value is a measure in the frequency domain (result of Fast Fourier Transform)
  *Accelleration*
    * Linear accelleration measured by smart phone accellerometer is borken into that experienced by the body and the gravity component (bodyacc or gravityacc) by use of low pass filter.
    * Measurements of the angular accelleration are labeled by 'bodygyro'
  *Jerk*
    Linear accelleration was differentiated by time to calculate the jerk component of the movement (indicated by 'jerk')
  *Measurement type*
    * mean - indicates the measurement is the mean 
    * std - indcates the measurement is the standard deviation
  *Direction and Magnitude*
    * mag - indicates measurement is the magnitude of the feature calculated using Euclidian norm
    * x,y or z - indicates the direction of measure in 3 dimensional space
    
  **Notes**
  * All features are the mean of the feature as grouped by the subject and activity type
  * All linear measurements are in standard gravity units 'g'
  * All angular measurements are in radians/second
  * All measurements are intially normalized between -1 and 1
  
 
