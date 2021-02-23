These are some codes about GW signals.
# Antenna Pattern Function
## Analytical Form
Code _Skyplot_plus_cross.m_ (with _skyplot.m_) plots F_plus and F_cross as ![F_p](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/F_plus.png) and ![F_c](https://raw.githubusercontent.com/guoxiaowhu/GWSC_NAOC/main/figs/F_cross.png)

## Tensor Contraction
Code _testdetframefpfc.m_ (with _detframefpfc.m_ at al) plots F_plus and F_cross as the same as analyitcal form, but it is based on tensor contraction. _vcrossprod.m_ defines the vector cross product.

# Strain
## With Tensor Contraction
_Strain\_Tensor.m_
## With Antenna Pattern Function
s = hp * Fp + hc * Fc
_Strain\_F.m_ (with _detframefpfc.m_) 
