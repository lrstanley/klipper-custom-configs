# klipper-custom-configs

Repo containing configurations for my printers running Klipper

## Volumetric flow rate calculations

### For calculating maximum linear speed that you can print at, from mm/s extrusion speed (what shows up in the Fluidd UI):

```
7 * (1.75/2)^2 * 3.14 / 0.4 / 0.2 == 210mm/s linear speed
```
or
```
<speed of extrude in mm/s> * (<filament width>/2)^2 * 3.14 / <line width> / <line height>
```

### For calculating maximum linear speed that you can print at, with just mm^3/s (from slicer):

```
<volumetric-flow-rate> / <line width> / <line height>
```

e.g. 15 / 0.4 / 0.2 == ~187mm/s linear speed

### Calculating mm/s extrusion speed into mm^3/s:

```
<speed of extrude in mm/s> * (<filament width>/2)^2 * 3.14
```
