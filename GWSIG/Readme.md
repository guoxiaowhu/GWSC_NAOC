These are some codes about GW signals.
# Antenna Pattern Function
## Analytical Form
Code _Skyplot_plus_cross.m_ (with _skyplot.m_) plots F_plus and F_cross as ![F_p](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/F_plus.png) and ![F_c](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/F_cross.png)

## Tensor Contraction
Code _testdetframefpfc.m_ (with _detframefpfc.m_ et al) plots F_plus and F_cross as the same as analyitcal form, but it is based on tensor contraction. _vcrossprod.m_ defines the vector cross product.

By the way, in Mohanty's code, he left out the 1/2 in the detector tensor, so that the result from tensor contraction is as twice as analytical form. We have corrected this bug in our codes. 

## Polarization Angle
In order to increase the polarization angle psi, we write the code _testdetframefpfc\_psi.m_ (with _detframefpfc\_psi.m_ et al) to describe different psi.
The analytical experssion for antenna pattern function including polarization angle psi is in the code _testdetframefpfc\_psi.m_. We compare two ways and obtain consistent results. 

# Strain
## With Tensor Contraction
_Strain\_Tensor.m_ calculates the strain with the contraction of wave tensor and detector tensor.
## With Antenna Pattern Function
According to  s = hp * Fp + hc * Fc, _Strain\_F.m_ (with _detframefpfc_psi.m_) directly computes the strain based on antenna pattern function.

# LISA
## LISA's Orbit
Accoring to Soumya D. Mohanty's code, we can plot a GIF file to show the orbit of LISA
![LISA orbit](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/LISA_orbitography.gif)

## LISA's Antenna Pattern Function
