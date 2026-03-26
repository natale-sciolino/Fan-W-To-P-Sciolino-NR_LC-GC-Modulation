# LC–GC Modulation Dataset

## Overview

This repository contains neural population data and analysis code for studying how locus coeruleus (LC) activation modulates gustatory cortex (GC) taste representations.

Each dataset corresponds to a **separate experiment**, defined by:
- a specific **sensory attribute** (e.g., palatability, mixture ratio, intensity)
- a specific **LC stimulation pattern** (e.g., phasic, tonic)

Neural activity was recorded in GC and aligned to taste delivery.

## Data Structure

Each dataset corresponds to a single experiment and is stored as a MATLAB struct:

```matlab
dataset.data_by_subject   % {1 × N subjects} cell array
dataset.subject_ids       % {1 × N subjects}
dataset.trial_type_names  % {1 × 4} tastant labels (e.g., {'S','N','C','Q'})
dataset.time_vector       % [1 × T] time axis

dataset.data_by_subject{s}
%cells × trials × time × tastant
```
There are 24 trials per tastant, sorted such that:
  trials 1–12  → no stimulation (no-stim)
  trials 13–24 → LC stimulation (stim)
