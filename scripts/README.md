### Scripts
This folder contains 3 different scripts to submit jobs to the cluster. Although I use different script for different purposes, they share many common instructions:

-#SBATCH --job-name=test : indicates the name of the job.
-#SBATCH --output=logs/n_%A_%a.out : indicates the name of the output files. In my case, I redirect these files to a specific folder. The output files have the id of the job (not the name) and the index.
-#SBATCH --error=logs/n_%A_%a.out : same thing, but for the error files.
-#SBATCH --array=0-9 : indices of the tasks. In this example, tasks range from 0 to 9 (10 tasks in total)
-#SBATCH --ntasks=1: you can submit more than one task per job. I haven't figured out yet how to do this and if it is relevant.
#SBATCH --cpus-per-task=1: you can assign more than one cpu per task. I also haven't figured out yet how to do it and if it is relevant.
-#SBATCH --mem=1GB : Memory assigned for your jobs
-#SBATCH --time=1-12:00:00: Maximum time allowed for each task. You might want to stop running a job after a certain time. This can happen with the BMS sometimes.

-# module load python/3.8 : I am assuming this and subsequent line allow you to indicate the cluster the programming languages you are running your code on.


##slurm_script.sh

This is the simplest script. It submits a number of jobs (10) that are related to the first external argument required by my code. In my case, this external argument takes values between 0 and 9, so this script allows me to do a whole run on this variable.

##slurm_array.sh