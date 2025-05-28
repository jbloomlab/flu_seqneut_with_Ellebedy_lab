"""Top-level ``snakemake`` file that runs analysis."""

import pandas as pd
from os.path import join

configfile: "config.yml"

include: "seqneut-pipeline/seqneut-pipeline.smk"


rule all:
    input:
        seqneut_pipeline_outputs  # outputs from pipeline
        # "results/plots_for_paper/plot_specific_sera/curves.pdf" # outputs from plotting notebook


