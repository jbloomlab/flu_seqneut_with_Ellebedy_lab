# Design of an additional five H3 HA strains circulating in 2024 to add to the 2023-2024 H3 library
Author: Caroline Kikawa

## Quick summary


## How the run the analysis
First, build and activate a `conda` environment containing `augur`. Theres an environment placed in [environments](environments) that can be built and activated with

    conda env create -f environments/nextstrain_environment.yaml
    conda activate nextstrain_library_design
    
I used the following command to download the Nexstrain 2-year H3N2 HA trees and place them in [data](data). 
    
    curl https://nextstrain.org/seasonal-flu/h3n2/ha/2y --header 'Accept: application/vnd.nextstrain.dataset.main+json' --compressed > data/flu_seasonal_h3n2_ha_2y_dowloaded250224.json

Then, use the following command(s) to extract a table of relevant attributes from the tree JSON, see [original gist](https://gist.github.com/huddlej/5d7bd023d3807c698bd18c706974f2db) for more details:

        python scripts/auspice_tree_to_table.py \
            --tree data/flu_seasonal_h3n2_ha_2y_dowloaded250224.json \
            --output-metadata data/flu_seasonal_h3n2_ha_2y.tsv \
            --attributes div num_date clade_membership subclade haplotype

This produces a table of metadata in [data/flu_seasonal_h3n2_ha_6m.tsv](data/flu_seasonal_h3n2_ha_6m.tsv) that is then used in interactive notebooks placed in [notebooks](notebooks). Results from that analysis are placed in [results](results).

