rule test:
    input: "ml_score.dat", "manual_score.dat"
        
rule get_data_cern:
    output: "train.csv", "test.csv"
    shell:
        "bash get_data_cern.sh"

rule fit_ml:
    input:  "train.csv", "test.csv"
    output: "ml_score.dat"
    shell:
        "runipy COMET\ -\ ML.ipynb"
        
rule fit_manual:
    input:  "train.csv", "test.csv"
    output: "manual_score.dat"
    shell:
        "runipy COMET\ -\ manual.ipynb"
