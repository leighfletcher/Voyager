Saturn observations from Voyager/IRIS, as published by Fletcher et al. (2016) in
comparison to Cassini/CIRS.

Retrieved temperatures and para-H2 fraction are presented in
`vg1_temp_fpara.eps`.



NEMESIS SPX files have the following format:

* FWHM LAT LON NGEOM
* NPTS
* NAV
* LAT LON SOLAR_ANGLE EMISSION_ANGLE AZIMUTH_ANGLE WEIGHT
* SPECTRUM = FLTARR(NPTS, 3) 

The acronyms stand for:

* FWHM=Full-Width at Half Maximum for the spectral resolution
* NPTS=number of points in the spectrum
* NAV=field-of-view averagign points, usually one.
* LAT=planetographic latitude
* LON=System III West lontitude
* WEIGHT=usually one if NAV=1
* ANGLES have their usual meaning.
* The SPECTRUM is then a 3-column array with wavenumber (cm-1), spectral radiance
(W/cm2/sr/cm-1), radiance error.
