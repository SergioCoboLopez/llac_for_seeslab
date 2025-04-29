# llac_for_seeslab
Simple repo to use the llac cluster

The repo contains a simple bash script to run a python code on the llac cluster.

To submit your job:

    sbatch ./slurm_script.sh

To check jobs in the cluster:

    squeue

To check your jobs:

   squeue --users=cobo

To cancel your jobs:

   scancel <job_id>
