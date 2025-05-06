### Scripts
This folder contains 3 different scripts to submit jobs to the cluster. Although I use different script for different purposes, they share many common instructions:

* #SBATCH --job-name=test : indicates the name of the job.
* #SBATCH --output=logs/n_%A_%a.out : indicates the name of the output files. In my case, I redirect these files to a specific folder. The output files have the id of the job (not the name) and the index.
* #SBATCH --error=logs/n_%A_%a.out : same thing, but for the error files.
* #SBATCH --array=0-9 : indices of the tasks. In this example, tasks range from 0 to 9 (10 tasks in total)
* #SBATCH --ntasks=1: you can submit more than one task per job. I haven't figured out yet how to do this and if it is relevant.
* #SBATCH --cpus-per-task=1: you can assign more than one cpu per task. I also haven't figured out yet how to do it and if it is relevant.
* #SBATCH --mem=1GB : Memory assigned for your jobs
* #SBATCH --time=1-12:00:00: Maximum time allowed for each task. You might want to stop running a job after a certain time. This can happen with the BMS sometimes.

* # module load python/3.8 : I am assuming this and subsequent line allow you to indicate the cluster the programming languages you are running your code on.


## slurm_script.sh

This is the simplest script. It submits a number of jobs (10, in my case) that are tied to the first external argument required by my code. In my case, this external argument takes values between 0 and 9, so this script allows me to do a whole run on this variable of my experiments. The index of the job ($SLURM_ARRAY_TASK_ID) substitutes the value of the external argument.

## slurm_array.sh

In my case, it is common that some of the jobs I submit get stuck and do not finish running. If I ran those jobs with the first script, I will have some scattered jobs unfinished that I need to run again (often several times). I use this script on those cases.

The trick is to declare an associative array (a dictionary in python language) that I call "job_array". In this associative array, keys are the indices of the jobs that I want to submit again, and values are strings containing the values of all the external parameters of the jobs that got stuck. In this case, the argument of the code is not going to be ($SLURM_ARRAY_TASK_ID), but ${job_array[$SLURM_ARRAY_TASK_ID]}

This is not an elegant solution, but it does the trick for me.

## slurm_multirun.sh

Certain jobs can get stuck multiple times. When that happens, I submit that specific job multiple times. This is what the last external argument of my code accounts for. This script is just a variation of the first one, where I simply put the index in the last position.

