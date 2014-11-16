getdata-009
===========

Coursera Getting and Cleaning Data Project CodeBook 

Sorry to be lazy, this section is incomplete
programs/codebook.R produce part of the documentation.

Tables:

activity

subject

features

smartphones_Mean_tidy_Axis_5

smartphones_Mean_tidy_Magnitude_5

smartphones_MeanStd_descriptive_3

programs/codebook.R 
 - produce part of the documentation.

Table: activity.csv
     |------->activity_id    integer   [1..6]
     |------->activity_description    character 
[WALKING|WALKING_UPSTAIRS|WALKING_DOWNSTAIRS|SITTING|STANDING|LAYING]

Table: subject.csv
     |------->subject_id    integer   [1..30]
     |------->subject_code    character [Subject 1|Subject 2|Subject 3|Subject 4|Subject 5|Subject 
6|Subject 7|Subject 8|Subject 9|Subject 10|Subject 11|Subject 12|Subject 13|Subject 14|Subject 
15|Subject 16|Subject 17|Subject 18|Subject 19|Subject 20|Subject 21|Subject 22|Subject 23|Subject 
24|Subject 25|Subject 26|Subject 27|Subject 28|Subject 29|Subject 30]
	 |------->subject_group    character [train|test]

	 Table: features.csv
     |------->feature_id    integer   [1..561]
     |------->feature_field_name    character 
	 
[time_Body_Acc_mean.fn_X|time_Body_Acc_mean.fn_Y|time_Body_Acc_mean.fn_Z|time_Body_Acc_std.fn_X|time_Body
_Acc_std.fn_Y|time_Body_Acc_std.fn_Z|time_Body_Acc_mad.fn_X|time_Body_Acc_mad.fn_Y|time_Body_Acc_mad.fn_Z
|time_Body_Acc_max.fn_X|time_Body_Acc_max.fn_Y|time_Body_Acc_max.fn_Z|time_Body_Acc_min.fn_X|time_Body_Ac
c_min.fn_Y|time_Body_Acc_min.fn_Z|time_Body_Acc_sma.fn|time_Body_Acc_energy.fn_X|time_Body_Acc_energy.fn_
Y|time_Body_Acc_energy.fn_Z|time_Body_Acc_iqr.fn_X|time_Body_Acc_iqr.fn_Y|time_Body_Acc_iqr.fn_Z|time_Bod
y_Acc_entropy.fn_X|time_Body_Acc_entropy.fn_Y|time_Body_Acc_entropy.fn_Z|time_Body_Acc_arCoeff.fn_X.to.1|
time_Body_Acc_arCoeff.fn_X.to.2|time_Body_Acc_arCoeff.fn_X.to.3|time_Body_Acc_arCoeff.fn_X.to.4|time_Body
_Acc_arCoeff.fn_Y.to.1|time_Body_Acc_arCoeff.fn_Y.to.2|time_Body_Acc_arCoeff.fn_Y.to.3|time_Body_Acc_arCo
eff.fn_Y.to.4|time_Body_Acc_arCoeff.fn_Z.to.1|time_Body_Acc_arCoeff.fn_Z.to.2|time_Body_Acc_arCoeff.fn_Z.
to.3|time_Body_Acc_arCoeff.fn_Z.to.4|time_Body_Acc_correlation.fn_X.to.Y|time_Body_Acc_correlation.fn_X.t
o.Z|time_Body_Acc_correlation.fn_Y.to.Z|time_Gravity_Acc_mean.fn_X|time_Gravity_Acc_mean.fn_Y|time_Gravit
y_Acc_mean.fn_Z|time_Gravity_Acc_std.fn_X|time_Gravity_Acc_std.fn_Y|time_Gravity_Acc_std.fn_Z|time_Gravit
y_Acc_mad.fn_X|time_Gravity_Acc_mad.fn_Y|time_Gravity_Acc_mad.fn_Z|time_Gravity_Acc_max.fn_X|time_Gravity
_Acc_max.fn_Y|time_Gravity_Acc_max.fn_Z|time_Gravity_Acc_min.fn_X|time_Gravity_Acc_min.fn_Y|time_Gravity_
Acc_min.fn_Z|time_Gravity_Acc_sma.fn|time_Gravity_Acc_energy.fn_X|time_Gravity_Acc_energy.fn_Y|time_Gravi
ty_Acc_energy.fn_Z|time_Gravity_Acc_iqr.fn_X|time_Gravity_Acc_iqr.fn_Y|time_Gravity_Acc_iqr.fn_Z|time_Gra
vity_Acc_entropy.fn_X|time_Gravity_Acc_entropy.fn_Y|time_Gravity_Acc_entropy.fn_Z|time_Gravity_Acc_arCoef
f.fn_X.to.1|time_Gravity_Acc_arCoeff.fn_X.to.2|time_Gravity_Acc_arCoeff.fn_X.to.3|time_Gravity_Acc_arCoef
f.fn_X.to.4|time_Gravity_Acc_arCoeff.fn_Y.to.1|time_Gravity_Acc_arCoeff.fn_Y.to.2|time_Gravity_Acc_arCoef
f.fn_Y.to.3|time_Gravity_Acc_arCoeff.fn_Y.to.4|time_Gravity_Acc_arCoeff.fn_Z.to.1|time_Gravity_Acc_arCoef
f.fn_Z.to.2|time_Gravity_Acc_arCoeff.fn_Z.to.3|time_Gravity_Acc_arCoeff.fn_Z.to.4|time_Gravity_Acc_correl
ation.fn_X.to.Y|time_Gravity_Acc_correlation.fn_X.to.Z|time_Gravity_Acc_correlation.fn_Y.to.Z|time_Body_A
ccJerk_mean.fn_X|time_Body_AccJerk_mean.fn_Y|time_Body_AccJerk_mean.fn_Z|time_Body_AccJerk_std.fn_X|time_
Body_AccJerk_std.fn_Y|time_Body_AccJerk_std.fn_Z|time_Body_AccJerk_mad.fn_X|time_Body_AccJerk_mad.fn_Y|ti
me_Body_AccJerk_mad.fn_Z|time_Body_AccJerk_max.fn_X|time_Body_AccJerk_max.fn_Y|time_Body_AccJerk_max.fn_Z
|time_Body_AccJerk_min.fn_X|time_Body_AccJerk_min.fn_Y|time_Body_AccJerk_min.fn_Z|time_Body_AccJerk_sma.f
n|time_Body_AccJerk_energy.fn_X|time_Body_AccJerk_energy.fn_Y|time_Body_AccJerk_energy.fn_Z|time_Body_Acc
Jerk_iqr.fn_X|time_Body_AccJerk_iqr.fn_Y|time_Body_AccJerk_iqr.fn_Z|time_Body_AccJerk_entropy.fn_X|time_B
ody_AccJerk_entropy.fn_Y|time_Body_AccJerk_entropy.fn_Z|time_Body_AccJerk_arCoeff.fn_X.to.1|time_Body_Acc
Jerk_arCoeff.fn_X.to.2|time_Body_AccJerk_arCoeff.fn_X.to.3|time_Body_AccJerk_arCoeff.fn_X.to.4|time_Body_
AccJerk_arCoeff.fn_Y.to.1|time_Body_AccJerk_arCoeff.fn_Y.to.2|time_Body_AccJerk_arCoeff.fn_Y.to.3|time_Bo
dy_AccJerk_arCoeff.fn_Y.to.4|time_Body_AccJerk_arCoeff.fn_Z.to.1|time_Body_AccJerk_arCoeff.fn_Z.to.2|time
_Body_AccJerk_arCoeff.fn_Z.to.3|time_Body_AccJerk_arCoeff.fn_Z.to.4|time_Body_AccJerk_correlation.fn_X.to
.Y|time_Body_AccJerk_correlation.fn_X.to.Z|time_Body_AccJerk_correlation.fn_Y.to.Z|time_Body_Gyro_mean.fn
_X|time_Body_Gyro_mean.fn_Y|time_Body_Gyro_mean.fn_Z|time_Body_Gyro_std.fn_X|time_Body_Gyro_std.fn_Y|time
_Body_Gyro_std.fn_Z|time_Body_Gyro_mad.fn_X|time_Body_Gyro_mad.fn_Y|time_Body_Gyro_mad.fn_Z|time_Body_Gyr
o_max.fn_X|time_Body_Gyro_max.fn_Y|time_Body_Gyro_max.fn_Z|time_Body_Gyro_min.fn_X|time_Body_Gyro_min.fn_
Y|time_Body_Gyro_min.fn_Z|time_Body_Gyro_sma.fn|time_Body_Gyro_energy.fn_X|time_Body_Gyro_energy.fn_Y|tim
e_Body_Gyro_energy.fn_Z|time_Body_Gyro_iqr.fn_X|time_Body_Gyro_iqr.fn_Y|time_Body_Gyro_iqr.fn_Z|time_Body
_Gyro_entropy.fn_X|time_Body_Gyro_entropy.fn_Y|time_Body_Gyro_entropy.fn_Z|time_Body_Gyro_arCoeff.fn_X.to
.1|time_Body_Gyro_arCoeff.fn_X.to.2|time_Body_Gyro_arCoeff.fn_X.to.3|time_Body_Gyro_arCoeff.fn_X.to.4|tim
e_Body_Gyro_arCoeff.fn_Y.to.1|time_Body_Gyro_arCoeff.fn_Y.to.2|time_Body_Gyro_arCoeff.fn_Y.to.3|time_Body
_Gyro_arCoeff.fn_Y.to.4|time_Body_Gyro_arCoeff.fn_Z.to.1|time_Body_Gyro_arCoeff.fn_Z.to.2|time_Body_Gyro_
arCoeff.fn_Z.to.3|time_Body_Gyro_arCoeff.fn_Z.to.4|time_Body_Gyro_correlation.fn_X.to.Y|time_Body_Gyro_co
rrelation.fn_X.to.Z|time_Body_Gyro_correlation.fn_Y.to.Z|time_Body_GyroJerk_mean.fn_X|time_Body_GyroJerk_
mean.fn_Y|time_Body_GyroJerk_mean.fn_Z|time_Body_GyroJerk_std.fn_X|time_Body_GyroJerk_std.fn_Y|time_Body_
GyroJerk_std.fn_Z|time_Body_GyroJerk_mad.fn_X|time_Body_GyroJerk_mad.fn_Y|time_Body_GyroJerk_mad.fn_Z|tim
e_Body_GyroJerk_max.fn_X|time_Body_GyroJerk_max.fn_Y|time_Body_GyroJerk_max.fn_Z|time_Body_GyroJerk_min.f
n_X|time_Body_GyroJerk_min.fn_Y|time_Body_GyroJerk_min.fn_Z|time_Body_GyroJerk_sma.fn|time_Body_GyroJerk_
energy.fn_X|time_Body_GyroJerk_energy.fn_Y|time_Body_GyroJerk_energy.fn_Z|time_Body_GyroJerk_iqr.fn_X|tim
e_Body_GyroJerk_iqr.fn_Y|time_Body_GyroJerk_iqr.fn_Z|time_Body_GyroJerk_entropy.fn_X|time_Body_GyroJerk_e
ntropy.fn_Y|time_Body_GyroJerk_entropy.fn_Z|time_Body_GyroJerk_arCoeff.fn_X.to.1|time_Body_GyroJerk_arCoe
ff.fn_X.to.2|time_Body_GyroJerk_arCoeff.fn_X.to.3|time_Body_GyroJerk_arCoeff.fn_X.to.4|time_Body_GyroJerk
_arCoeff.fn_Y.to.1|time_Body_GyroJerk_arCoeff.fn_Y.to.2|time_Body_GyroJerk_arCoeff.fn_Y.to.3|time_Body_Gy
roJerk_arCoeff.fn_Y.to.4|time_Body_GyroJerk_arCoeff.fn_Z.to.1|time_Body_GyroJerk_arCoeff.fn_Z.to.2|time_B
ody_GyroJerk_arCoeff.fn_Z.to.3|time_Body_GyroJerk_arCoeff.fn_Z.to.4|time_Body_GyroJerk_correlation.fn_X.t
o.Y|time_Body_GyroJerk_correlation.fn_X.to.Z|time_Body_GyroJerk_correlation.fn_Y.to.Z|time_Body_AccMag_me
an.fn|time_Body_AccMag_std.fn|time_Body_AccMag_mad.fn|time_Body_AccMag_max.fn|time_Body_AccMag_min.fn|tim
e_Body_AccMag_sma.fn|time_Body_AccMag_energy.fn|time_Body_AccMag_iqr.fn|time_Body_AccMag_entropy.fn|time_
Body_AccMag_arCoeff.fn1|time_Body_AccMag_arCoeff.fn2|time_Body_AccMag_arCoeff.fn3|time_Body_AccMag_arCoef
f.fn4|time_Gravity_AccMag_mean.fn|time_Gravity_AccMag_std.fn|time_Gravity_AccMag_mad.fn|time_Gravity_AccM
ag_max.fn|time_Gravity_AccMag_min.fn|time_Gravity_AccMag_sma.fn|time_Gravity_AccMag_energy.fn|time_Gravit
y_AccMag_iqr.fn|time_Gravity_AccMag_entropy.fn|time_Gravity_AccMag_arCoeff.fn1|time_Gravity_AccMag_arCoef
f.fn2|time_Gravity_AccMag_arCoeff.fn3|time_Gravity_AccMag_arCoeff.fn4|time_Body_AccJerkMag_mean.fn|time_B
ody_AccJerkMag_std.fn|time_Body_AccJerkMag_mad.fn|time_Body_AccJerkMag_max.fn|time_Body_AccJerkMag_min.fn
|time_Body_AccJerkMag_sma.fn|time_Body_AccJerkMag_energy.fn|time_Body_AccJerkMag_iqr.fn|time_Body_AccJerk
Mag_entropy.fn|time_Body_AccJerkMag_arCoeff.fn1|time_Body_AccJerkMag_arCoeff.fn2|time_Body_AccJerkMag_arC
oeff.fn3|time_Body_AccJerkMag_arCoeff.fn4|time_Body_GyroMag_mean.fn|time_Body_GyroMag_std.fn|time_Body_Gy
roMag_mad.fn|time_Body_GyroMag_max.fn|time_Body_GyroMag_min.fn|time_Body_GyroMag_sma.fn|time_Body_GyroMag
_energy.fn|time_Body_GyroMag_iqr.fn|time_Body_GyroMag_entropy.fn|time_Body_GyroMag_arCoeff.fn1|time_Body_
GyroMag_arCoeff.fn2|time_Body_GyroMag_arCoeff.fn3|time_Body_GyroMag_arCoeff.fn4|time_Body_GyroJerkMag_mea
n.fn|time_Body_GyroJerkMag_std.fn|time_Body_GyroJerkMag_mad.fn|time_Body_GyroJerkMag_max.fn|time_Body_Gyr
oJerkMag_min.fn|time_Body_GyroJerkMag_sma.fn|time_Body_GyroJerkMag_energy.fn|time_Body_GyroJerkMag_iqr.fn
|time_Body_GyroJerkMag_entropy.fn|time_Body_GyroJerkMag_arCoeff.fn1|time_Body_GyroJerkMag_arCoeff.fn2|tim
e_Body_GyroJerkMag_arCoeff.fn3|time_Body_GyroJerkMag_arCoeff.fn4|fourier_Body_Acc_mean.fn_X|fourier_Body_
Acc_mean.fn_Y|fourier_Body_Acc_mean.fn_Z|fourier_Body_Acc_std.fn_X|fourier_Body_Acc_std.fn_Y|fourier_Body
_Acc_std.fn_Z|fourier_Body_Acc_mad.fn_X|fourier_Body_Acc_mad.fn_Y|fourier_Body_Acc_mad.fn_Z|fourier_Body_
Acc_max.fn_X|fourier_Body_Acc_max.fn_Y|fourier_Body_Acc_max.fn_Z|fourier_Body_Acc_min.fn_X|fourier_Body_A
cc_min.fn_Y|fourier_Body_Acc_min.fn_Z|fourier_Body_Acc_sma.fn|fourier_Body_Acc_energy.fn_X|fourier_Body_A
cc_energy.fn_Y|fourier_Body_Acc_energy.fn_Z|fourier_Body_Acc_iqr.fn_X|fourier_Body_Acc_iqr.fn_Y|fourier_B
ody_Acc_iqr.fn_Z|fourier_Body_Acc_entropy.fn_X|fourier_Body_Acc_entropy.fn_Y|fourier_Body_Acc_entropy.fn_
Z|fourier_Body_Acc_maxInds_X|fourier_Body_Acc_maxInds_Y|fourier_Body_Acc_maxInds_Z|fourier_Body_Acc_meanF
req.fn_X|fourier_Body_Acc_meanFreq.fn_Y|fourier_Body_Acc_meanFreq.fn_Z|fourier_Body_Acc_skewness.fn_X|fou
rier_Body_Acc_kurtosis.fn_X|fourier_Body_Acc_skewness.fn_Y|fourier_Body_Acc_kurtosis.fn_Y|fourier_Body_Ac
c_skewness.fn_Z|fourier_Body_Acc_kurtosis.fn_Z|fourier_Body_Acc_bandsEnergy.fn_1.to.8_X|fourier_Body_Acc_
bandsEnergy.fn_9.to.16_X|fourier_Body_Acc_bandsEnergy.fn_17.to.24_X|fourier_Body_Acc_bandsEnergy.fn_25.to
.32_X|fourier_Body_Acc_bandsEnergy.fn_33.to.40_X|fourier_Body_Acc_bandsEnergy.fn_41.to.48_X|fourier_Body_
Acc_bandsEnergy.fn_49.to.56_X|fourier_Body_Acc_bandsEnergy.fn_57.to.64_X|fourier_Body_Acc_bandsEnergy.fn_
1.to.16_X|fourier_Body_Acc_bandsEnergy.fn_17.to.32_X|fourier_Body_Acc_bandsEnergy.fn_33.to.48_X|fourier_B
ody_Acc_bandsEnergy.fn_49.to.64_X|fourier_Body_Acc_bandsEnergy.fn_1.to.24_X|fourier_Body_Acc_bandsEnergy.
fn_25.to.48_X|fourier_Body_Acc_bandsEnergy.fn_1.to.8_Y|fourier_Body_Acc_bandsEnergy.fn_9.to.16_Y|fourier_
Body_Acc_bandsEnergy.fn_17.to.24_Y|fourier_Body_Acc_bandsEnergy.fn_25.to.32_Y|fourier_Body_Acc_bandsEnerg
y.fn_33.to.40_Y|fourier_Body_Acc_bandsEnergy.fn_41.to.48_Y|fourier_Body_Acc_bandsEnergy.fn_49.to.56_Y|fou
rier_Body_Acc_bandsEnergy.fn_57.to.64_Y|fourier_Body_Acc_bandsEnergy.fn_1.to.16_Y|fourier_Body_Acc_bandsE
nergy.fn_17.to.32_Y|fourier_Body_Acc_bandsEnergy.fn_33.to.48_Y|fourier_Body_Acc_bandsEnergy.fn_49.to.64_Y
|fourier_Body_Acc_bandsEnergy.fn_1.to.24_Y|fourier_Body_Acc_bandsEnergy.fn_25.to.48_Y|fourier_Body_Acc_ba
ndsEnergy.fn_1.to.8_Z|fourier_Body_Acc_bandsEnergy.fn_9.to.16_Z|fourier_Body_Acc_bandsEnergy.fn_17.to.24_
Z|fourier_Body_Acc_bandsEnergy.fn_25.to.32_Z|fourier_Body_Acc_bandsEnergy.fn_33.to.40_Z|fourier_Body_Acc_
bandsEnergy.fn_41.to.48_Z|fourier_Body_Acc_bandsEnergy.fn_49.to.56_Z|fourier_Body_Acc_bandsEnergy.fn_57.t
o.64_Z|fourier_Body_Acc_bandsEnergy.fn_1.to.16_Z|fourier_Body_Acc_bandsEnergy.fn_17.to.32_Z|fourier_Body_
Acc_bandsEnergy.fn_33.to.48_Z|fourier_Body_Acc_bandsEnergy.fn_49.to.64_Z|fourier_Body_Acc_bandsEnergy.fn_
1.to.24_Z|fourier_Body_Acc_bandsEnergy.fn_25.to.48_Z|fourier_Body_AccJerk_mean.fn_X|fourier_Body_AccJerk_
mean.fn_Y|fourier_Body_AccJerk_mean.fn_Z|fourier_Body_AccJerk_std.fn_X|fourier_Body_AccJerk_std.fn_Y|four
ier_Body_AccJerk_std.fn_Z|fourier_Body_AccJerk_mad.fn_X|fourier_Body_AccJerk_mad.fn_Y|fourier_Body_AccJer
k_mad.fn_Z|fourier_Body_AccJerk_max.fn_X|fourier_Body_AccJerk_max.fn_Y|fourier_Body_AccJerk_max.fn_Z|four
ier_Body_AccJerk_min.fn_X|fourier_Body_AccJerk_min.fn_Y|fourier_Body_AccJerk_min.fn_Z|fourier_Body_AccJer
k_sma.fn|fourier_Body_AccJerk_energy.fn_X|fourier_Body_AccJerk_energy.fn_Y|fourier_Body_AccJerk_energy.fn
_Z|fourier_Body_AccJerk_iqr.fn_X|fourier_Body_AccJerk_iqr.fn_Y|fourier_Body_AccJerk_iqr.fn_Z|fourier_Body
_AccJerk_entropy.fn_X|fourier_Body_AccJerk_entropy.fn_Y|fourier_Body_AccJerk_entropy.fn_Z|fourier_Body_Ac
cJerk_maxInds_X|fourier_Body_AccJerk_maxInds_Y|fourier_Body_AccJerk_maxInds_Z|fourier_Body_AccJerk_meanFr
eq.fn_X|fourier_Body_AccJerk_meanFreq.fn_Y|fourier_Body_AccJerk_meanFreq.fn_Z|fourier_Body_AccJerk_skewne
ss.fn_X|fourier_Body_AccJerk_kurtosis.fn_X|fourier_Body_AccJerk_skewness.fn_Y|fourier_Body_AccJerk_kurtos
is.fn_Y|fourier_Body_AccJerk_skewness.fn_Z|fourier_Body_AccJerk_kurtosis.fn_Z|fourier_Body_AccJerk_bandsE
nergy.fn_1.to.8_X|fourier_Body_AccJerk_bandsEnergy.fn_9.to.16_X|fourier_Body_AccJerk_bandsEnergy.fn_17.to
.24_X|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_X|fourier_Body_AccJerk_bandsEnergy.fn_33.to.40_X|fouri
er_Body_AccJerk_bandsEnergy.fn_41.to.48_X|fourier_Body_AccJerk_bandsEnergy.fn_49.to.56_X|fourier_Body_Acc
Jerk_bandsEnergy.fn_57.to.64_X|fourier_Body_AccJerk_bandsEnergy.fn_1.to.16_X|fourier_Body_AccJerk_bandsEn
ergy.fn_17.to.32_X|fourier_Body_AccJerk_bandsEnergy.fn_33.to.48_X|fourier_Body_AccJerk_bandsEnergy.fn_49.
to.64_X|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_X|fourier_Body_AccJerk_bandsEnergy.fn_25.to.48_X|four
ier_Body_AccJerk_bandsEnergy.fn_1.to.8_Y|fourier_Body_AccJerk_bandsEnergy.fn_9.to.16_Y|fourier_Body_AccJe
rk_bandsEnergy.fn_17.to.24_Y|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_Y|fourier_Body_AccJerk_bandsEne
rgy.fn_33.to.40_Y|fourier_Body_AccJerk_bandsEnergy.fn_41.to.48_Y|fourier_Body_AccJerk_bandsEnergy.fn_49.t
o.56_Y|fourier_Body_AccJerk_bandsEnergy.fn_57.to.64_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.16_Y|fouri
er_Body_AccJerk_bandsEnergy.fn_17.to.32_Y|fourier_Body_AccJerk_bandsEnergy.fn_33.to.48_Y|fourier_Body_Acc
Jerk_bandsEnergy.fn_49.to.64_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_Y|fourier_Body_AccJerk_bandsEn
ergy.fn_25.to.48_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.8_Z|fourier_Body_AccJerk_bandsEnergy.fn_9.to.
16_Z|fourier_Body_AccJerk_bandsEnergy.fn_17.to.24_Z|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_Z|fourie
r_Body_AccJerk_bandsEnergy.fn_33.to.40_Z|fourier_Body_AccJerk_bandsEnergy.fn_41.to.48_Z|fourier_Body_AccJ
erk_bandsEnergy.fn_49.to.56_Z|fourier_Body_AccJerk_bandsEnergy.fn_57.to.64_Z|fourier_Body_AccJerk_bandsEn
ergy.fn_1.to.16_Z|fourier_Body_AccJerk_bandsEnergy.fn_17.to.32_Z|fourier_Body_AccJerk_bandsEnergy.fn_33.t
o.48_Z|fourier_Body_AccJerk_bandsEnergy.fn_49.to.64_Z|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_Z|fouri
er_Body_AccJerk_bandsEnergy.fn_25.to.48_Z|fourier_Body_Gyro_mean.fn_X|fourier_Body_Gyro_mean.fn_Y|fourier
_Body_Gyro_mean.fn_Z|fourier_Body_Gyro_std.fn_X|fourier_Body_Gyro_std.fn_Y|fourier_Body_Gyro_std.fn_Z|fou
rier_Body_Gyro_mad.fn_X|fourier_Body_Gyro_mad.fn_Y|fourier_Body_Gyro_mad.fn_Z|fourier_Body_Gyro_max.fn_X|
fourier_Body_Gyro_max.fn_Y|fourier_Body_Gyro_max.fn_Z|fourier_Body_Gyro_min.fn_X|fourier_Body_Gyro_min.fn
_Y|fourier_Body_Gyro_min.fn_Z|fourier_Body_Gyro_sma.fn|fourier_Body_Gyro_energy.fn_X|fourier_Body_Gyro_en
ergy.fn_Y|fourier_Body_Gyro_energy.fn_Z|fourier_Body_Gyro_iqr.fn_X|fourier_Body_Gyro_iqr.fn_Y|fourier_Bod
y_Gyro_iqr.fn_Z|fourier_Body_Gyro_entropy.fn_X|fourier_Body_Gyro_entropy.fn_Y|fourier_Body_Gyro_entropy.f
n_Z|fourier_Body_Gyro_maxInds_X|fourier_Body_Gyro_maxInds_Y|fourier_Body_Gyro_maxInds_Z|fourier_Body_Gyro
_meanFreq.fn_X|fourier_Body_Gyro_meanFreq.fn_Y|fourier_Body_Gyro_meanFreq.fn_Z|fourier_Body_Gyro_skewness
.fn_X|fourier_Body_Gyro_kurtosis.fn_X|fourier_Body_Gyro_skewness.fn_Y|fourier_Body_Gyro_kurtosis.fn_Y|fou
rier_Body_Gyro_skewness.fn_Z|fourier_Body_Gyro_kurtosis.fn_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_X|fo
urier_Body_Gyro_bandsEnergy.fn_9.to.16_X|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_X|fourier_Body_Gyro_ba
ndsEnergy.fn_25.to.32_X|fourier_Body_Gyro_bandsEnergy.fn_33.to.40_X|fourier_Body_Gyro_bandsEnergy.fn_41.t
o.48_X|fourier_Body_Gyro_bandsEnergy.fn_49.to.56_X|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_X|fourier_Bo
dy_Gyro_bandsEnergy.fn_1.to.16_X|fourier_Body_Gyro_bandsEnergy.fn_17.to.32_X|fourier_Body_Gyro_bandsEnerg
y.fn_33.to.48_X|fourier_Body_Gyro_bandsEnergy.fn_49.to.64_X|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_X|fo
urier_Body_Gyro_bandsEnergy.fn_25.to.48_X|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_Y|fourier_Body_Gyro_ban
dsEnergy.fn_9.to.16_Y|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_Y|fourier_Body_Gyro_bandsEnergy.fn_25.to.
32_Y|fourier_Body_Gyro_bandsEnergy.fn_33.to.40_Y|fourier_Body_Gyro_bandsEnergy.fn_41.to.48_Y|fourier_Body
_Gyro_bandsEnergy.fn_49.to.56_Y|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_Y|fourier_Body_Gyro_bandsEnergy
.fn_1.to.16_Y|fourier_Body_Gyro_bandsEnergy.fn_17.to.32_Y|fourier_Body_Gyro_bandsEnergy.fn_33.to.48_Y|fou
rier_Body_Gyro_bandsEnergy.fn_49.to.64_Y|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_Y|fourier_Body_Gyro_ban
dsEnergy.fn_25.to.48_Y|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_Z|fourier_Body_Gyro_bandsEnergy.fn_9.to.16
_Z|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_Z|fourier_Body_Gyro_bandsEnergy.fn_25.to.32_Z|fourier_Body_G
yro_bandsEnergy.fn_33.to.40_Z|fourier_Body_Gyro_bandsEnergy.fn_41.to.48_Z|fourier_Body_Gyro_bandsEnergy.f
n_49.to.56_Z|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.16_Z|fouri
er_Body_Gyro_bandsEnergy.fn_17.to.32_Z|fourier_Body_Gyro_bandsEnergy.fn_33.to.48_Z|fourier_Body_Gyro_band
sEnergy.fn_49.to.64_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_Z|fourier_Body_Gyro_bandsEnergy.fn_25.to.4
8_Z|fourier_Body_AccMag_mean.fn|fourier_Body_AccMag_std.fn|fourier_Body_AccMag_mad.fn|fourier_Body_AccMag
_max.fn|fourier_Body_AccMag_min.fn|fourier_Body_AccMag_sma.fn|fourier_Body_AccMag_energy.fn|fourier_Body_
AccMag_iqr.fn|fourier_Body_AccMag_entropy.fn|fourier_Body_AccMag_maxInds|fourier_Body_AccMag_meanFreq.fn|
fourier_Body_AccMag_skewness.fn|fourier_Body_AccMag_kurtosis.fn|fourier_Body_AccJerkMag_mean.fn|fourier_B
ody_AccJerkMag_std.fn|fourier_Body_AccJerkMag_mad.fn|fourier_Body_AccJerkMag_max.fn|fourier_Body_AccJerkM
ag_min.fn|fourier_Body_AccJerkMag_sma.fn|fourier_Body_AccJerkMag_energy.fn|fourier_Body_AccJerkMag_iqr.fn
|fourier_Body_AccJerkMag_entropy.fn|fourier_Body_AccJerkMag_maxInds|fourier_Body_AccJerkMag_meanFreq.fn|f
ourier_Body_AccJerkMag_skewness.fn|fourier_Body_AccJerkMag_kurtosis.fn|fourier_Body_GyroMag_mean.fn|fouri
er_Body_GyroMag_std.fn|fourier_Body_GyroMag_mad.fn|fourier_Body_GyroMag_max.fn|fourier_Body_GyroMag_min.f
n|fourier_Body_GyroMag_sma.fn|fourier_Body_GyroMag_energy.fn|fourier_Body_GyroMag_iqr.fn|fourier_Body_Gyr
oMag_entropy.fn|fourier_Body_GyroMag_maxInds|fourier_Body_GyroMag_meanFreq.fn|fourier_Body_GyroMag_skewne
ss.fn|fourier_Body_GyroMag_kurtosis.fn|fourier_Body_GyroJerkMag_mean.fn|fourier_Body_GyroJerkMag_std.fn|f
ourier_Body_GyroJerkMag_mad.fn|fourier_Body_GyroJerkMag_max.fn|fourier_Body_GyroJerkMag_min.fn|fourier_Bo
dy_GyroJerkMag_sma.fn|fourier_Body_GyroJerkMag_energy.fn|fourier_Body_GyroJerkMag_iqr.fn|fourier_Body_Gyr
oJerkMag_entropy.fn|fourier_Body_GyroJerkMag_maxInds|fourier_Body_GyroJerkMag_meanFreq.fn|fourier_Body_Gy
roJerkMag_skewness.fn|fourier_Body_GyroJerkMag_kurtosis.fn|angle_fn.tBodyAccMean.to.gravity.fn|angle_fn.t
BodyAccJerkMean.to.gravityMean.fn|angle_fn.tBodyGyroMean.to.gravityMean.fn|angle_fn.tBodyGyroJerkMean.to.
gravityMean.fn|angle_fn.X.to.gravityMean.fn|angle_fn.Y.to.gravityMean.fn|angle_fn.Z.to.gravityMean.fn]
          |------->feature_field_name    character [time_Body_Acc_mean.fn_X|time_Body_Acc_mean.fn_Y|time_Body_Acc_mean.fn_Z|time_Body_Acc_std.fn_X|time_Body_Acc_std.fn_Y|time_Body_Acc_std.fn_Z|time_Body_Acc_mad.fn_X|time_Body_Acc_mad.fn_Y|time_Body_Acc_mad.fn_Z|time_Body_Acc_max.fn_X|time_Body_Acc_max.fn_Y|time_Body_Acc_max.fn_Z|time_Body_Acc_min.fn_X|time_Body_Acc_min.fn_Y|time_Body_Acc_min.fn_Z|time_Body_Acc_sma.fn|time_Body_Acc_energy.fn_X|time_Body_Acc_energy.fn_Y|time_Body_Acc_energy.fn_Z|time_Body_Acc_iqr.fn_X|time_Body_Acc_iqr.fn_Y|time_Body_Acc_iqr.fn_Z|time_Body_Acc_entropy.fn_X|time_Body_Acc_entropy.fn_Y|time_Body_Acc_entropy.fn_Z|time_Body_Acc_arCoeff.fn_X.to.1|time_Body_Acc_arCoeff.fn_X.to.2|time_Body_Acc_arCoeff.fn_X.to.3|time_Body_Acc_arCoeff.fn_X.to.4|time_Body_Acc_arCoeff.fn_Y.to.1|time_Body_Acc_arCoeff.fn_Y.to.2|time_Body_Acc_arCoeff.fn_Y.to.3|time_Body_Acc_arCoeff.fn_Y.to.4|time_Body_Acc_arCoeff.fn_Z.to.1|time_Body_Acc_arCoeff.fn_Z.to.2|time_Body_Acc_arCoeff.fn_Z.to.3|time_Body_Acc_arCoeff.fn_Z.to.4|time_Body_Acc_correlation.fn_X.to.Y|time_Body_Acc_correlation.fn_X.to.Z|time_Body_Acc_correlation.fn_Y.to.Z|time_Gravity_Acc_mean.fn_X|time_Gravity_Acc_mean.fn_Y|time_Gravity_Acc_mean.fn_Z|time_Gravity_Acc_std.fn_X|time_Gravity_Acc_std.fn_Y|time_Gravity_Acc_std.fn_Z|time_Gravity_Acc_mad.fn_X|time_Gravity_Acc_mad.fn_Y|time_Gravity_Acc_mad.fn_Z|time_Gravity_Acc_max.fn_X|time_Gravity_Acc_max.fn_Y|time_Gravity_Acc_max.fn_Z|time_Gravity_Acc_min.fn_X|time_Gravity_Acc_min.fn_Y|time_Gravity_Acc_min.fn_Z|time_Gravity_Acc_sma.fn|time_Gravity_Acc_energy.fn_X|time_Gravity_Acc_energy.fn_Y|time_Gravity_Acc_energy.fn_Z|time_Gravity_Acc_iqr.fn_X|time_Gravity_Acc_iqr.fn_Y|time_Gravity_Acc_iqr.fn_Z|time_Gravity_Acc_entropy.fn_X|time_Gravity_Acc_entropy.fn_Y|time_Gravity_Acc_entropy.fn_Z|time_Gravity_Acc_arCoeff.fn_X.to.1|time_Gravity_Acc_arCoeff.fn_X.to.2|time_Gravity_Acc_arCoeff.fn_X.to.3|time_Gravity_Acc_arCoeff.fn_X.to.4|time_Gravity_Acc_arCoeff.fn_Y.to.1|time_Gravity_Acc_arCoeff.fn_Y.to.2|time_Gravity_Acc_arCoeff.fn_Y.to.3|time_Gravity_Acc_arCoeff.fn_Y.to.4|time_Gravity_Acc_arCoeff.fn_Z.to.1|time_Gravity_Acc_arCoeff.fn_Z.to.2|time_Gravity_Acc_arCoeff.fn_Z.to.3|time_Gravity_Acc_arCoeff.fn_Z.to.4|time_Gravity_Acc_correlation.fn_X.to.Y|time_Gravity_Acc_correlation.fn_X.to.Z|time_Gravity_Acc_correlation.fn_Y.to.Z|time_Body_AccJerk_mean.fn_X|time_Body_AccJerk_mean.fn_Y|time_Body_AccJerk_mean.fn_Z|time_Body_AccJerk_std.fn_X|time_Body_AccJerk_std.fn_Y|time_Body_AccJerk_std.fn_Z|time_Body_AccJerk_mad.fn_X|time_Body_AccJerk_mad.fn_Y|time_Body_AccJerk_mad.fn_Z|time_Body_AccJerk_max.fn_X|time_Body_AccJerk_max.fn_Y|time_Body_AccJerk_max.fn_Z|time_Body_AccJerk_min.fn_X|time_Body_AccJerk_min.fn_Y|time_Body_AccJerk_min.fn_Z|time_Body_AccJerk_sma.fn|time_Body_AccJerk_energy.fn_X|time_Body_AccJerk_energy.fn_Y|time_Body_AccJerk_energy.fn_Z|time_Body_AccJerk_iqr.fn_X|time_Body_AccJerk_iqr.fn_Y|time_Body_AccJerk_iqr.fn_Z|time_Body_AccJerk_entropy.fn_X|time_Body_AccJerk_entropy.fn_Y|time_Body_AccJerk_entropy.fn_Z|time_Body_AccJerk_arCoeff.fn_X.to.1|time_Body_AccJerk_arCoeff.fn_X.to.2|time_Body_AccJerk_arCoeff.fn_X.to.3|time_Body_AccJerk_arCoeff.fn_X.to.4|time_Body_AccJerk_arCoeff.fn_Y.to.1|time_Body_AccJerk_arCoeff.fn_Y.to.2|time_Body_AccJerk_arCoeff.fn_Y.to.3|time_Body_AccJerk_arCoeff.fn_Y.to.4|time_Body_AccJerk_arCoeff.fn_Z.to.1|time_Body_AccJerk_arCoeff.fn_Z.to.2|time_Body_AccJerk_arCoeff.fn_Z.to.3|time_Body_AccJerk_arCoeff.fn_Z.to.4|time_Body_AccJerk_correlation.fn_X.to.Y|time_Body_AccJerk_correlation.fn_X.to.Z|time_Body_AccJerk_correlation.fn_Y.to.Z|time_Body_Gyro_mean.fn_X|time_Body_Gyro_mean.fn_Y|time_Body_Gyro_mean.fn_Z|time_Body_Gyro_std.fn_X|time_Body_Gyro_std.fn_Y|time_Body_Gyro_std.fn_Z|time_Body_Gyro_mad.fn_X|time_Body_Gyro_mad.fn_Y|time_Body_Gyro_mad.fn_Z|time_Body_Gyro_max.fn_X|time_Body_Gyro_max.fn_Y|time_Body_Gyro_max.fn_Z|time_Body_Gyro_min.fn_X|time_Body_Gyro_min.fn_Y|time_Body_Gyro_min.fn_Z|time_Body_Gyro_sma.fn|time_Body_Gyro_energy.fn_X|time_Body_Gyro_energy.fn_Y|time_Body_Gyro_energy.fn_Z|time_Body_Gyro_iqr.fn_X|time_Body_Gyro_iqr.fn_Y|time_Body_Gyro_iqr.fn_Z|time_Body_Gyro_entropy.fn_X|time_Body_Gyro_entropy.fn_Y|time_Body_Gyro_entropy.fn_Z|time_Body_Gyro_arCoeff.fn_X.to.1|time_Body_Gyro_arCoeff.fn_X.to.2|time_Body_Gyro_arCoeff.fn_X.to.3|time_Body_Gyro_arCoeff.fn_X.to.4|time_Body_Gyro_arCoeff.fn_Y.to.1|time_Body_Gyro_arCoeff.fn_Y.to.2|time_Body_Gyro_arCoeff.fn_Y.to.3|time_Body_Gyro_arCoeff.fn_Y.to.4|time_Body_Gyro_arCoeff.fn_Z.to.1|time_Body_Gyro_arCoeff.fn_Z.to.2|time_Body_Gyro_arCoeff.fn_Z.to.3|time_Body_Gyro_arCoeff.fn_Z.to.4|time_Body_Gyro_correlation.fn_X.to.Y|time_Body_Gyro_correlation.fn_X.to.Z|time_Body_Gyro_correlation.fn_Y.to.Z|time_Body_GyroJerk_mean.fn_X|time_Body_GyroJerk_mean.fn_Y|time_Body_GyroJerk_mean.fn_Z|time_Body_GyroJerk_std.fn_X|time_Body_GyroJerk_std.fn_Y|time_Body_GyroJerk_std.fn_Z|time_Body_GyroJerk_mad.fn_X|time_Body_GyroJerk_mad.fn_Y|time_Body_GyroJerk_mad.fn_Z|time_Body_GyroJerk_max.fn_X|time_Body_GyroJerk_max.fn_Y|time_Body_GyroJerk_max.fn_Z|time_Body_GyroJerk_min.fn_X|time_Body_GyroJerk_min.fn_Y|time_Body_GyroJerk_min.fn_Z|time_Body_GyroJerk_sma.fn|time_Body_GyroJerk_energy.fn_X|time_Body_GyroJerk_energy.fn_Y|time_Body_GyroJerk_energy.fn_Z|time_Body_GyroJerk_iqr.fn_X|time_Body_GyroJerk_iqr.fn_Y|time_Body_GyroJerk_iqr.fn_Z|time_Body_GyroJerk_entropy.fn_X|time_Body_GyroJerk_entropy.fn_Y|time_Body_GyroJerk_entropy.fn_Z|time_Body_GyroJerk_arCoeff.fn_X.to.1|time_Body_GyroJerk_arCoeff.fn_X.to.2|time_Body_GyroJerk_arCoeff.fn_X.to.3|time_Body_GyroJerk_arCoeff.fn_X.to.4|time_Body_GyroJerk_arCoeff.fn_Y.to.1|time_Body_GyroJerk_arCoeff.fn_Y.to.2|time_Body_GyroJerk_arCoeff.fn_Y.to.3|time_Body_GyroJerk_arCoeff.fn_Y.to.4|time_Body_GyroJerk_arCoeff.fn_Z.to.1|time_Body_GyroJerk_arCoeff.fn_Z.to.2|time_Body_GyroJerk_arCoeff.fn_Z.to.3|time_Body_GyroJerk_arCoeff.fn_Z.to.4|time_Body_GyroJerk_correlation.fn_X.to.Y|time_Body_GyroJerk_correlation.fn_X.to.Z|time_Body_GyroJerk_correlation.fn_Y.to.Z|time_Body_AccMag_mean.fn|time_Body_AccMag_std.fn|time_Body_AccMag_mad.fn|time_Body_AccMag_max.fn|time_Body_AccMag_min.fn|time_Body_AccMag_sma.fn|time_Body_AccMag_energy.fn|time_Body_AccMag_iqr.fn|time_Body_AccMag_entropy.fn|time_Body_AccMag_arCoeff.fn1|time_Body_AccMag_arCoeff.fn2|time_Body_AccMag_arCoeff.fn3|time_Body_AccMag_arCoeff.fn4|time_Gravity_AccMag_mean.fn|time_Gravity_AccMag_std.fn|time_Gravity_AccMag_mad.fn|time_Gravity_AccMag_max.fn|time_Gravity_AccMag_min.fn|time_Gravity_AccMag_sma.fn|time_Gravity_AccMag_energy.fn|time_Gravity_AccMag_iqr.fn|time_Gravity_AccMag_entropy.fn|time_Gravity_AccMag_arCoeff.fn1|time_Gravity_AccMag_arCoeff.fn2|time_Gravity_AccMag_arCoeff.fn3|time_Gravity_AccMag_arCoeff.fn4|time_Body_AccJerkMag_mean.fn|time_Body_AccJerkMag_std.fn|time_Body_AccJerkMag_mad.fn|time_Body_AccJerkMag_max.fn|time_Body_AccJerkMag_min.fn|time_Body_AccJerkMag_sma.fn|time_Body_AccJerkMag_energy.fn|time_Body_AccJerkMag_iqr.fn|time_Body_AccJerkMag_entropy.fn|time_Body_AccJerkMag_arCoeff.fn1|time_Body_AccJerkMag_arCoeff.fn2|time_Body_AccJerkMag_arCoeff.fn3|time_Body_AccJerkMag_arCoeff.fn4|time_Body_GyroMag_mean.fn|time_Body_GyroMag_std.fn|time_Body_GyroMag_mad.fn|time_Body_GyroMag_max.fn|time_Body_GyroMag_min.fn|time_Body_GyroMag_sma.fn|time_Body_GyroMag_energy.fn|time_Body_GyroMag_iqr.fn|time_Body_GyroMag_entropy.fn|time_Body_GyroMag_arCoeff.fn1|time_Body_GyroMag_arCoeff.fn2|time_Body_GyroMag_arCoeff.fn3|time_Body_GyroMag_arCoeff.fn4|time_Body_GyroJerkMag_mean.fn|time_Body_GyroJerkMag_std.fn|time_Body_GyroJerkMag_mad.fn|time_Body_GyroJerkMag_max.fn|time_Body_GyroJerkMag_min.fn|time_Body_GyroJerkMag_sma.fn|time_Body_GyroJerkMag_energy.fn|time_Body_GyroJerkMag_iqr.fn|time_Body_GyroJerkMag_entropy.fn|time_Body_GyroJerkMag_arCoeff.fn1|time_Body_GyroJerkMag_arCoeff.fn2|time_Body_GyroJerkMag_arCoeff.fn3|time_Body_GyroJerkMag_arCoeff.fn4|fourier_Body_Acc_mean.fn_X|fourier_Body_Acc_mean.fn_Y|fourier_Body_Acc_mean.fn_Z|fourier_Body_Acc_std.fn_X|fourier_Body_Acc_std.fn_Y|fourier_Body_Acc_std.fn_Z|fourier_Body_Acc_mad.fn_X|fourier_Body_Acc_mad.fn_Y|fourier_Body_Acc_mad.fn_Z|fourier_Body_Acc_max.fn_X|fourier_Body_Acc_max.fn_Y|fourier_Body_Acc_max.fn_Z|fourier_Body_Acc_min.fn_X|fourier_Body_Acc_min.fn_Y|fourier_Body_Acc_min.fn_Z|fourier_Body_Acc_sma.fn|fourier_Body_Acc_energy.fn_X|fourier_Body_Acc_energy.fn_Y|fourier_Body_Acc_energy.fn_Z|fourier_Body_Acc_iqr.fn_X|fourier_Body_Acc_iqr.fn_Y|fourier_Body_Acc_iqr.fn_Z|fourier_Body_Acc_entropy.fn_X|fourier_Body_Acc_entropy.fn_Y|fourier_Body_Acc_entropy.fn_Z|fourier_Body_Acc_maxInds_X|fourier_Body_Acc_maxInds_Y|fourier_Body_Acc_maxInds_Z|fourier_Body_Acc_meanFreq.fn_X|fourier_Body_Acc_meanFreq.fn_Y|fourier_Body_Acc_meanFreq.fn_Z|fourier_Body_Acc_skewness.fn_X|fourier_Body_Acc_kurtosis.fn_X|fourier_Body_Acc_skewness.fn_Y|fourier_Body_Acc_kurtosis.fn_Y|fourier_Body_Acc_skewness.fn_Z|fourier_Body_Acc_kurtosis.fn_Z|fourier_Body_Acc_bandsEnergy.fn_1.to.8_X|fourier_Body_Acc_bandsEnergy.fn_9.to.16_X|fourier_Body_Acc_bandsEnergy.fn_17.to.24_X|fourier_Body_Acc_bandsEnergy.fn_25.to.32_X|fourier_Body_Acc_bandsEnergy.fn_33.to.40_X|fourier_Body_Acc_bandsEnergy.fn_41.to.48_X|fourier_Body_Acc_bandsEnergy.fn_49.to.56_X|fourier_Body_Acc_bandsEnergy.fn_57.to.64_X|fourier_Body_Acc_bandsEnergy.fn_1.to.16_X|fourier_Body_Acc_bandsEnergy.fn_17.to.32_X|fourier_Body_Acc_bandsEnergy.fn_33.to.48_X|fourier_Body_Acc_bandsEnergy.fn_49.to.64_X|fourier_Body_Acc_bandsEnergy.fn_1.to.24_X|fourier_Body_Acc_bandsEnergy.fn_25.to.48_X|fourier_Body_Acc_bandsEnergy.fn_1.to.8_Y|fourier_Body_Acc_bandsEnergy.fn_9.to.16_Y|fourier_Body_Acc_bandsEnergy.fn_17.to.24_Y|fourier_Body_Acc_bandsEnergy.fn_25.to.32_Y|fourier_Body_Acc_bandsEnergy.fn_33.to.40_Y|fourier_Body_Acc_bandsEnergy.fn_41.to.48_Y|fourier_Body_Acc_bandsEnergy.fn_49.to.56_Y|fourier_Body_Acc_bandsEnergy.fn_57.to.64_Y|fourier_Body_Acc_bandsEnergy.fn_1.to.16_Y|fourier_Body_Acc_bandsEnergy.fn_17.to.32_Y|fourier_Body_Acc_bandsEnergy.fn_33.to.48_Y|fourier_Body_Acc_bandsEnergy.fn_49.to.64_Y|fourier_Body_Acc_bandsEnergy.fn_1.to.24_Y|fourier_Body_Acc_bandsEnergy.fn_25.to.48_Y|fourier_Body_Acc_bandsEnergy.fn_1.to.8_Z|fourier_Body_Acc_bandsEnergy.fn_9.to.16_Z|fourier_Body_Acc_bandsEnergy.fn_17.to.24_Z|fourier_Body_Acc_bandsEnergy.fn_25.to.32_Z|fourier_Body_Acc_bandsEnergy.fn_33.to.40_Z|fourier_Body_Acc_bandsEnergy.fn_41.to.48_Z|fourier_Body_Acc_bandsEnergy.fn_49.to.56_Z|fourier_Body_Acc_bandsEnergy.fn_57.to.64_Z|fourier_Body_Acc_bandsEnergy.fn_1.to.16_Z|fourier_Body_Acc_bandsEnergy.fn_17.to.32_Z|fourier_Body_Acc_bandsEnergy.fn_33.to.48_Z|fourier_Body_Acc_bandsEnergy.fn_49.to.64_Z|fourier_Body_Acc_bandsEnergy.fn_1.to.24_Z|fourier_Body_Acc_bandsEnergy.fn_25.to.48_Z|fourier_Body_AccJerk_mean.fn_X|fourier_Body_AccJerk_mean.fn_Y|fourier_Body_AccJerk_mean.fn_Z|fourier_Body_AccJerk_std.fn_X|fourier_Body_AccJerk_std.fn_Y|fourier_Body_AccJerk_std.fn_Z|fourier_Body_AccJerk_mad.fn_X|fourier_Body_AccJerk_mad.fn_Y|fourier_Body_AccJerk_mad.fn_Z|fourier_Body_AccJerk_max.fn_X|fourier_Body_AccJerk_max.fn_Y|fourier_Body_AccJerk_max.fn_Z|fourier_Body_AccJerk_min.fn_X|fourier_Body_AccJerk_min.fn_Y|fourier_Body_AccJerk_min.fn_Z|fourier_Body_AccJerk_sma.fn|fourier_Body_AccJerk_energy.fn_X|fourier_Body_AccJerk_energy.fn_Y|fourier_Body_AccJerk_energy.fn_Z|fourier_Body_AccJerk_iqr.fn_X|fourier_Body_AccJerk_iqr.fn_Y|fourier_Body_AccJerk_iqr.fn_Z|fourier_Body_AccJerk_entropy.fn_X|fourier_Body_AccJerk_entropy.fn_Y|fourier_Body_AccJerk_entropy.fn_Z|fourier_Body_AccJerk_maxInds_X|fourier_Body_AccJerk_maxInds_Y|fourier_Body_AccJerk_maxInds_Z|fourier_Body_AccJerk_meanFreq.fn_X|fourier_Body_AccJerk_meanFreq.fn_Y|fourier_Body_AccJerk_meanFreq.fn_Z|fourier_Body_AccJerk_skewness.fn_X|fourier_Body_AccJerk_kurtosis.fn_X|fourier_Body_AccJerk_skewness.fn_Y|fourier_Body_AccJerk_kurtosis.fn_Y|fourier_Body_AccJerk_skewness.fn_Z|fourier_Body_AccJerk_kurtosis.fn_Z|fourier_Body_AccJerk_bandsEnergy.fn_1.to.8_X|fourier_Body_AccJerk_bandsEnergy.fn_9.to.16_X|fourier_Body_AccJerk_bandsEnergy.fn_17.to.24_X|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_X|fourier_Body_AccJerk_bandsEnergy.fn_33.to.40_X|fourier_Body_AccJerk_bandsEnergy.fn_41.to.48_X|fourier_Body_AccJerk_bandsEnergy.fn_49.to.56_X|fourier_Body_AccJerk_bandsEnergy.fn_57.to.64_X|fourier_Body_AccJerk_bandsEnergy.fn_1.to.16_X|fourier_Body_AccJerk_bandsEnergy.fn_17.to.32_X|fourier_Body_AccJerk_bandsEnergy.fn_33.to.48_X|fourier_Body_AccJerk_bandsEnergy.fn_49.to.64_X|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_X|fourier_Body_AccJerk_bandsEnergy.fn_25.to.48_X|fourier_Body_AccJerk_bandsEnergy.fn_1.to.8_Y|fourier_Body_AccJerk_bandsEnergy.fn_9.to.16_Y|fourier_Body_AccJerk_bandsEnergy.fn_17.to.24_Y|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_Y|fourier_Body_AccJerk_bandsEnergy.fn_33.to.40_Y|fourier_Body_AccJerk_bandsEnergy.fn_41.to.48_Y|fourier_Body_AccJerk_bandsEnergy.fn_49.to.56_Y|fourier_Body_AccJerk_bandsEnergy.fn_57.to.64_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.16_Y|fourier_Body_AccJerk_bandsEnergy.fn_17.to.32_Y|fourier_Body_AccJerk_bandsEnergy.fn_33.to.48_Y|fourier_Body_AccJerk_bandsEnergy.fn_49.to.64_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_Y|fourier_Body_AccJerk_bandsEnergy.fn_25.to.48_Y|fourier_Body_AccJerk_bandsEnergy.fn_1.to.8_Z|fourier_Body_AccJerk_bandsEnergy.fn_9.to.16_Z|fourier_Body_AccJerk_bandsEnergy.fn_17.to.24_Z|fourier_Body_AccJerk_bandsEnergy.fn_25.to.32_Z|fourier_Body_AccJerk_bandsEnergy.fn_33.to.40_Z|fourier_Body_AccJerk_bandsEnergy.fn_41.to.48_Z|fourier_Body_AccJerk_bandsEnergy.fn_49.to.56_Z|fourier_Body_AccJerk_bandsEnergy.fn_57.to.64_Z|fourier_Body_AccJerk_bandsEnergy.fn_1.to.16_Z|fourier_Body_AccJerk_bandsEnergy.fn_17.to.32_Z|fourier_Body_AccJerk_bandsEnergy.fn_33.to.48_Z|fourier_Body_AccJerk_bandsEnergy.fn_49.to.64_Z|fourier_Body_AccJerk_bandsEnergy.fn_1.to.24_Z|fourier_Body_AccJerk_bandsEnergy.fn_25.to.48_Z|fourier_Body_Gyro_mean.fn_X|fourier_Body_Gyro_mean.fn_Y|fourier_Body_Gyro_mean.fn_Z|fourier_Body_Gyro_std.fn_X|fourier_Body_Gyro_std.fn_Y|fourier_Body_Gyro_std.fn_Z|fourier_Body_Gyro_mad.fn_X|fourier_Body_Gyro_mad.fn_Y|fourier_Body_Gyro_mad.fn_Z|fourier_Body_Gyro_max.fn_X|fourier_Body_Gyro_max.fn_Y|fourier_Body_Gyro_max.fn_Z|fourier_Body_Gyro_min.fn_X|fourier_Body_Gyro_min.fn_Y|fourier_Body_Gyro_min.fn_Z|fourier_Body_Gyro_sma.fn|fourier_Body_Gyro_energy.fn_X|fourier_Body_Gyro_energy.fn_Y|fourier_Body_Gyro_energy.fn_Z|fourier_Body_Gyro_iqr.fn_X|fourier_Body_Gyro_iqr.fn_Y|fourier_Body_Gyro_iqr.fn_Z|fourier_Body_Gyro_entropy.fn_X|fourier_Body_Gyro_entropy.fn_Y|fourier_Body_Gyro_entropy.fn_Z|fourier_Body_Gyro_maxInds_X|fourier_Body_Gyro_maxInds_Y|fourier_Body_Gyro_maxInds_Z|fourier_Body_Gyro_meanFreq.fn_X|fourier_Body_Gyro_meanFreq.fn_Y|fourier_Body_Gyro_meanFreq.fn_Z|fourier_Body_Gyro_skewness.fn_X|fourier_Body_Gyro_kurtosis.fn_X|fourier_Body_Gyro_skewness.fn_Y|fourier_Body_Gyro_kurtosis.fn_Y|fourier_Body_Gyro_skewness.fn_Z|fourier_Body_Gyro_kurtosis.fn_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_X|fourier_Body_Gyro_bandsEnergy.fn_9.to.16_X|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_X|fourier_Body_Gyro_bandsEnergy.fn_25.to.32_X|fourier_Body_Gyro_bandsEnergy.fn_33.to.40_X|fourier_Body_Gyro_bandsEnergy.fn_41.to.48_X|fourier_Body_Gyro_bandsEnergy.fn_49.to.56_X|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_X|fourier_Body_Gyro_bandsEnergy.fn_1.to.16_X|fourier_Body_Gyro_bandsEnergy.fn_17.to.32_X|fourier_Body_Gyro_bandsEnergy.fn_33.to.48_X|fourier_Body_Gyro_bandsEnergy.fn_49.to.64_X|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_X|fourier_Body_Gyro_bandsEnergy.fn_25.to.48_X|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_Y|fourier_Body_Gyro_bandsEnergy.fn_9.to.16_Y|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_Y|fourier_Body_Gyro_bandsEnergy.fn_25.to.32_Y|fourier_Body_Gyro_bandsEnergy.fn_33.to.40_Y|fourier_Body_Gyro_bandsEnergy.fn_41.to.48_Y|fourier_Body_Gyro_bandsEnergy.fn_49.to.56_Y|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_Y|fourier_Body_Gyro_bandsEnergy.fn_1.to.16_Y|fourier_Body_Gyro_bandsEnergy.fn_17.to.32_Y|fourier_Body_Gyro_bandsEnergy.fn_33.to.48_Y|fourier_Body_Gyro_bandsEnergy.fn_49.to.64_Y|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_Y|fourier_Body_Gyro_bandsEnergy.fn_25.to.48_Y|fourier_Body_Gyro_bandsEnergy.fn_1.to.8_Z|fourier_Body_Gyro_bandsEnergy.fn_9.to.16_Z|fourier_Body_Gyro_bandsEnergy.fn_17.to.24_Z|fourier_Body_Gyro_bandsEnergy.fn_25.to.32_Z|fourier_Body_Gyro_bandsEnergy.fn_33.to.40_Z|fourier_Body_Gyro_bandsEnergy.fn_41.to.48_Z|fourier_Body_Gyro_bandsEnergy.fn_49.to.56_Z|fourier_Body_Gyro_bandsEnergy.fn_57.to.64_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.16_Z|fourier_Body_Gyro_bandsEnergy.fn_17.to.32_Z|fourier_Body_Gyro_bandsEnergy.fn_33.to.48_Z|fourier_Body_Gyro_bandsEnergy.fn_49.to.64_Z|fourier_Body_Gyro_bandsEnergy.fn_1.to.24_Z|fourier_Body_Gyro_bandsEnergy.fn_25.to.48_Z|fourier_Body_AccMag_mean.fn|fourier_Body_AccMag_std.fn|fourier_Body_AccMag_mad.fn|fourier_Body_AccMag_max.fn|fourier_Body_AccMag_min.fn|fourier_Body_AccMag_sma.fn|fourier_Body_AccMag_energy.fn|fourier_Body_AccMag_iqr.fn|fourier_Body_AccMag_entropy.fn|fourier_Body_AccMag_maxInds|fourier_Body_AccMag_meanFreq.fn|fourier_Body_AccMag_skewness.fn|fourier_Body_AccMag_kurtosis.fn|fourier_Body_AccJerkMag_mean.fn|fourier_Body_AccJerkMag_std.fn|fourier_Body_AccJerkMag_mad.fn|fourier_Body_AccJerkMag_max.fn|fourier_Body_AccJerkMag_min.fn|fourier_Body_AccJerkMag_sma.fn|fourier_Body_AccJerkMag_energy.fn|fourier_Body_AccJerkMag_iqr.fn|fourier_Body_AccJerkMag_entropy.fn|fourier_Body_AccJerkMag_maxInds|fourier_Body_AccJerkMag_meanFreq.fn|fourier_Body_AccJerkMag_skewness.fn|fourier_Body_AccJerkMag_kurtosis.fn|fourier_Body_GyroMag_mean.fn|fourier_Body_GyroMag_std.fn|fourier_Body_GyroMag_mad.fn|fourier_Body_GyroMag_max.fn|fourier_Body_GyroMag_min.fn|fourier_Body_GyroMag_sma.fn|fourier_Body_GyroMag_energy.fn|fourier_Body_GyroMag_iqr.fn|fourier_Body_GyroMag_entropy.fn|fourier_Body_GyroMag_maxInds|fourier_Body_GyroMag_meanFreq.fn|fourier_Body_GyroMag_skewness.fn|fourier_Body_GyroMag_kurtosis.fn|fourier_Body_GyroJerkMag_mean.fn|fourier_Body_GyroJerkMag_std.fn|fourier_Body_GyroJerkMag_mad.fn|fourier_Body_GyroJerkMag_max.fn|fourier_Body_GyroJerkMag_min.fn|fourier_Body_GyroJerkMag_sma.fn|fourier_Body_GyroJerkMag_energy.fn|fourier_Body_GyroJerkMag_iqr.fn|fourier_Body_GyroJerkMag_entropy.fn|fourier_Body_GyroJerkMag_maxInds|fourier_Body_GyroJerkMag_meanFreq.fn|fourier_Body_GyroJerkMag_skewness.fn|fourier_Body_GyroJerkMag_kurtosis.fn|angle_fn.tBodyAccMean.to.gravity.fn|angle_fn.tBodyAccJerkMean.to.gravityMean.fn|angle_fn.tBodyGyroMean.to.gravityMean.fn|angle_fn.tBodyGyroJerkMean.to.gravityMean.fn|angle_fn.X.to.gravityMean.fn|angle_fn.Y.to.gravityMean.fn|angle_fn.Z.to.gravityMean.fn]
     
Table: smartphones_Mean_tidy_Axis_5.csv
     |------->activity_id    integer   [1..6]
     |------->activity_description    character 
[WALKING|WALKING_UPSTAIRS|WALKING_DOWNSTAIRS|SITTING|STANDING|LAYING]
     |------->subject_id    integer   [1..30]
     |------->origin    character [time|fourier]
     |------->base    character [Body|Gravity]
     |------->device    character [Acc|AccJerk|Gyro|GyroJerk]
     |------->measure    character [mean.fn]
     |------->axis    character [X|Y|Z]
     |------->result.fn    

Table: smartphones_Mean_tidy_Magnitude_5.csv
     |------->activity_id    integer   [1..6]
     |------->activity_description    character 
[WALKING|WALKING_UPSTAIRS|WALKING_DOWNSTAIRS|SITTING|STANDING|LAYING]
     |------->subject_id    integer   [1..30]
     |------->origin    character [time|fourier]
     |------->base    character [Body|Gravity]
     |------->magnitude    character [Acc|AccJerk|Gyro|GyroJerk]
     |------->measure    character [mean.fn]
     |------->result.fn    

Table: smartphones_MeanStd_descriptive_3.csv
     |------->activity_id    integer   [1..6]
     |------->activity_description    character 
[WALKING|WALKING_UPSTAIRS|WALKING_DOWNSTAIRS|SITTING|STANDING|LAYING]
     |------->subject_id    integer   [1..30]
     |------->time_Body_Acc_mean.fn_X    
     |------->time_Body_Acc_mean.fn_Y    
     |------->time_Body_Acc_mean.fn_Z    
     |------->time_Body_Acc_std.fn_X    
     |------->time_Body_Acc_std.fn_Y    
     |------->time_Body_Acc_std.fn_Z    
     |------->time_Gravity_Acc_mean.fn_X    
     |------->time_Gravity_Acc_mean.fn_Y    
     |------->time_Gravity_Acc_mean.fn_Z    
     |------->time_Gravity_Acc_std.fn_X    
     |------->time_Gravity_Acc_std.fn_Y    
     |------->time_Gravity_Acc_std.fn_Z    
     |------->time_Body_AccJerk_mean.fn_X    
     |------->time_Body_AccJerk_mean.fn_Y    
     |------->time_Body_AccJerk_mean.fn_Z    
     |------->time_Body_AccJerk_std.fn_X    
     |------->time_Body_AccJerk_std.fn_Y    
     |------->time_Body_AccJerk_std.fn_Z    
     |------->time_Body_Gyro_mean.fn_X    
     |------->time_Body_Gyro_mean.fn_Y    
     |------->time_Body_Gyro_mean.fn_Z    
     |------->time_Body_Gyro_std.fn_X    
     |------->time_Body_Gyro_std.fn_Y    
     |------->time_Body_Gyro_std.fn_Z    
     |------->time_Body_GyroJerk_mean.fn_X    
     |------->time_Body_GyroJerk_mean.fn_Y    
     |------->time_Body_GyroJerk_mean.fn_Z    
     |------->time_Body_GyroJerk_std.fn_X    
     |------->time_Body_GyroJerk_std.fn_Y    
     |------->time_Body_GyroJerk_std.fn_Z    
     |------->time_Body_AccMag_mean.fn    
     |------->time_Body_AccMag_std.fn    
     |------->time_Gravity_AccMag_mean.fn    
     |------->time_Gravity_AccMag_std.fn    
     |------->time_Body_AccJerkMag_mean.fn    
     |------->time_Body_AccJerkMag_std.fn    
     |------->time_Body_GyroMag_mean.fn    
     |------->time_Body_GyroMag_std.fn    
     |------->time_Body_GyroJerkMag_mean.fn    
     |------->time_Body_GyroJerkMag_std.fn    
     |------->fourier_Body_Acc_mean.fn_X    
     |------->fourier_Body_Acc_mean.fn_Y    
     |------->fourier_Body_Acc_mean.fn_Z    
     |------->fourier_Body_Acc_std.fn_X    
     |------->fourier_Body_Acc_std.fn_Y    
     |------->fourier_Body_Acc_std.fn_Z    
     |------->fourier_Body_AccJerk_mean.fn_X    
     |------->fourier_Body_AccJerk_mean.fn_Y    
     |------->fourier_Body_AccJerk_mean.fn_Z    
     |------->fourier_Body_AccJerk_std.fn_X    
     |------->fourier_Body_AccJerk_std.fn_Y    
     |------->fourier_Body_AccJerk_std.fn_Z    
     |------->fourier_Body_Gyro_mean.fn_X    
     |------->fourier_Body_Gyro_mean.fn_Y    
     |------->fourier_Body_Gyro_mean.fn_Z    
     |------->fourier_Body_Gyro_std.fn_X    
     |------->fourier_Body_Gyro_std.fn_Y    
     |------->fourier_Body_Gyro_std.fn_Z    
     |------->fourier_Body_AccMag_mean.fn    
     |------->fourier_Body_AccMag_std.fn    
     |------->fourier_Body_AccJerkMag_mean.fn    
     |------->fourier_Body_AccJerkMag_std.fn    
     |------->fourier_Body_GyroMag_mean.fn    
     |------->fourier_Body_GyroMag_std.fn    
     |------->fourier_Body_GyroJerkMag_mean.fn    
     |------->fourier_Body_GyroJerkMag_std.fn    
