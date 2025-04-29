#!/bin/bash                                
#SBATCH --job-name=test                                                                            
#SBATCH --output=logs/n_%A_%a.out    # %A=job ID, %a=array index. Print script outputs to file
#SBATCH --error=logs/array_%A_%a.err # Print errors to a file
#SBATCH --array=0-9                  # Run 10 jobs with indices 0-9. These match names of variable
#SBATCH --ntasks=1                   # Each job runs 1 task. ?? Maybe I could run two variables?
#SBATCH --cpus-per-task=1                                                                          
#SBATCH --mem=1GB                    #Memory allowed per job (or task?)   
#SBATCH --time=1-12:00:00            #Max time allowed


# Load required modules (if needed)                                                                
# module load python/3.8                                                                           

#Your job commands go here. The first external argument matches the job id.
python3 get_trace.py ${SLURM_ARRAY_TASK_ID} tanh 0.02 0 0 
