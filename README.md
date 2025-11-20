# llac_for_seeslab

The repo contains a simple bash script to run a python code on the llac cluster.


## Script usage:

To submit your job:

    sbatch ./slurm_script.sh

To check jobs in the cluster:

    squeue

To check your specific jobs:

    squeue --users=<user_name>

In both cases, the terminal will show a list with different columns:

* JOBID: The id number assigned to your job (see scripts/)
* PARTITION
* NAME: The name you assigned to the job (see scripts/)
* USER:
* ST: Status of your job. 'R' stands for running, 'PD' stands for pending. Check [here](https://confluence.cscs.ch/spaces/KB/pages/278036745/Meaning+of+Slurm+job+state+codes) for other status codes.
* TIME
* NODES
* NODELIST(REASON)

To cancel your jobs:

    scancel <job_id>

For more information, check the [documentation](https://slurm.schedmd.com/documentation.html)

## Acessing the cluster:

If you don't have an account in the cluster, contact the system administrator and ask for one. You should get a user name and a password to access the cluster:

    ssh <your_user_name>@10.112.11.131

## Sending information to the cluster:

Copy files from your local computer to the cluster:

     scp <file_name>  <user_name>@10.112.11.131:/home/sees/<user_name>/<destination_path>

Copy folders from from your local computer to the cluster:

    scp -r <folder_name> <user_name>@10.112.11.131:/home/sees/<user_name>/<destination_path>

If this does not work, try copying the files from your local computer to the seeslab server first:

    scp <file_name>  <user_name>@10.112.36.76:<destination_path>
    
    scp -r <folder_name> <user_name>@10.112.36.76:<destination_path>

## Sending information to your local computer

Copy files/folders to your local computer:

    scp <user_name>@llac.dqfi.urv.cat:<file_name> <destination_path>

    scp -r <user_name>@llac.dqfi.urv.cat:<folder_name> <destination_path>

If this does not work, try copying files to the seeslab server first:

    scp <file_name> <user_name>@10.112.36.76:<destination_path>

    scp -r <folder_name> <user_name>@10.112.36.76:<destination_path>