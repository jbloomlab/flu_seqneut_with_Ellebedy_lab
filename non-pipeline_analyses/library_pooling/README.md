# Library pooling

This directory describes the initial pooling of assessing viral barcode balancing, and assessing the fraction of viral barcode reads on increasing plated MDCK-SIAT1 cells. This library took the 78 H3 strains in Kikawa et al (2025), and 5 additional circulating H3's, as well as additional H1's from [flu_seqneut_pdmH1N1_2023-2024] (https://github.com/jbloomlab/flu_seqneut_pdmH1N1_2023-2024).  Authors: Ariana Ghez Farrell and  Caroline Kikawa

The initial pooling of the 78 strain library with additional H1's and H3's showed some major imbalances.  Specifically, A/Victoria/4897/2022 (which was rescued by Andrea Loes and then passaged by me) is far overrepresented in this pool.  In contrast, many of the H1 strains have way too low representation in the pool.  The most dramatic is A/Victoria/2570/2019 (which was rescued and passaged by Catherine Jacob-Dolan), which is about 100X too low.  This strain is important to include in our library because it is the H1 strain of the 2022-2023 Fluarix vaccine which Fluarix sera cohort received.

To calculate repooling of the library strains, I used [.results/strain_representation_A2_B2.csv] (./results/strain_representation_A2_B2.csv), which contains frac_strain and mean_frac_strains columns, which I then used to calculate re-pooling proportions for the strains in the library which needed adjustment. This plot takes the data from wells A2 and B2, which were in the linear range  in the plot showing neutralization standard vs pooled library dilution (plot disucced further below).

I tested infection for 16h with different concentration of cells/well, to see whether infecting more cells would result in more viral reads. As this plot shows [.figures/barcode_fraction_per_strain.png] (./figures/barcode_fraction_per_strain.png), using more cells per well (>1.5e5 cells/well) actually resulted in a higher fraction of neutralization standard per well, indicating that we were getting less virus out of those cells, likely because of incomplete lysis.  Going forward, I will use 1.5e5 cells/well, which is our attempt to maximize infectible cells from which we can extract virus per well.

## Input

All data for the notebooks are pulled directly from seqneut-pipeline output.

## Running the analysis

Library pool takes in a .csv from the data/miscellaneous_plates folder which contains the following columns, "well", "serum", "dilution factor", "replicate", "fastq", mapping the fastq.gz file path. 

This analysis also reads in the strain_order.csv containing the names of all the H1 and H3 strains included in the library in one column, as well as the neut_standards.csv in the data/ folder.

Finally this analysis requires the viral_library csv, located in data/viral_libraries, mapping the library strains to their barcodes.

## Output files
1. [./figures/ave_barcodes_per_well.png] (./figures/ave_barcodes_per_well.png) shows a barchart with average barcode counts per well
2. [.figures/barcode_fraction_per_strain.png] (./figures/barcode_fraction_per_strain.png)  shows a barchart with the barcode fraction for each of the three barcodes for all strains
3. [.figures/neut_standard_fracs_plot.png] shows the fraction of neutralization standard vs pooled library dilutions
4. [.figures/strains_chart.png] (./figures/strains_chart.png) shows the fraction of reads from each strain in the pool 
5. [.results/strain_representation_A2_B2.csv] (./results/strain_representation_A2_B2.csv) is a .csv which contains the relative ratios of each strain in the library. 
 