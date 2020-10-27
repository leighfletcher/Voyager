Retrieved temperature and para-hydrogen based on Voyager/IRIS spectra and using
the dimeric collision-induced absorption spectrum of Fletcher et al. (2018). 
Little change from the IRIS temperature retrievals presented by Orton et al.
(2015).

Spectra in the `spectra/` directory were binned based on the records downloaded
directly from the PDS.

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
* The SPECTRUM is then a 3-column array with wavenumber (cm-1), spectral radiance (W/cm2/sr/cm-1), radiance error.