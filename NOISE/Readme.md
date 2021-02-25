This is about noise
# Random Numbers
_testcustomprng.m_ plot a uniform distribution ![uniform](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/unifom_dis.png) and a normal distribution
![normal](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/normal_dis.png)

# Coloring and Whitening
_colGaussNoiseDemo.m_ can produce estimated PSD. When the number of samples is 16384, the estimated PSD is ![1](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/PSD16384.png) If I times the number of samples by 4, the estimated PSD is ![4](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/PSD16384_4.png). The latter one is smoother due to central-limit theorem. The dispersion of fluctuation become smaller for larger number of samples.  
We zoom in the time series and can find gaps among them, that is different from white Guassian noise 

We plot its histogram for noise realization as
![hist](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/noise_hist.png)
It follows a normal distribution.
