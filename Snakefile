rule get_data_cern:
    output: "train.csv", "test.csv"
    shell:
        "bash get_data_cern.sh"

rule fit_ml:
    input:  "train.csv", "test.csv"
    output: "ml_score.dat"
    shell:
        "runipy COMET\ -\ ML.ipynb"
        
