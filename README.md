# CCSE_ICASSP
COMPRESSED CONVEX SPECTRAL EMBEDDING FOR BIRD SPECIES CLASSIFICATION

This code extracts CCSE from wav files, fits a Random Forest on these CCSE and utilizes this random forest for classification.
Corresponding paper is attached here. 

File details:

DEMO details:

demo.m: Reads a test wav file, calls obtain_CCSE_file.m to extract CCSE and stores CCSE.
obtain_CCSE_file.m: obtains CCSE for a file read in demo.m. Utilizes the pretrained dictionary (26 classes) to compute CCSE.

Random_Forest_Script_4_demo.py
Random_Forest_Script_4_demo.ipynb: Reads the CCSE (extracted from training files) stored in mat files, fits a random forest, utilizes it
to classify the CCSE obtained for the file read in demo.m

Obtaining CCSE:

train_test_divide.m: divides the wave files of classes into training and testing
training_learn_archetypes.m: Learns the class specific archetypal dictionaries
obtain_ccse_training.m: Obtains CCSE for all training files, along with labels
obtain_ccse_testing_in_batch.m: obtains CCSE for all testing files and stores the test examples of each class in each cell

Batch Classification:

batch_classification_random_forest.ipynb
batch_classification_random_forest.py: classifies all the CCSE examples stored in different class specific cells. 


DEPENDENCIES: SPAMS toolbox : http://spams-devel.gforge.inria.fr/

DATA files could not be included due to licensing issues. However, class-specific dictionaries, concantenated dictionaries and training CCSE
are provided here.

MAT FILES:
Dicts_N_26classes: cell containing 26 class-specific dictionaries, each having N archetypes.
con_Dicts_N_26classes: a mat file containing concatenated dictionary, where each class has a dictionary of N archeypes.
train_features_NDict: CCSE and labels, calculated from dictionary having N archetypes in each class-specific dictionary.



NOTE: MODULE TO DECREASE INTER DICTIONARY CORRELATION IS NOT ADDED. USERS CAN FIND THAT CODE AT: https://drive.google.com/file/d/0B19RtgC5jZu6MUVNNGh6V1l3bDg/view?usp=drive_open





