# llac_for_seeslab

The repo contains a simple bash script to run a python code on the llac cluster.


## Script usage:

To submit your job:

    sbatch ./slurm_script.sh

To check jobs in the cluster:

    squeue

To check your jobs:

    squeue --users=<user_name>

To cancel your jobs:

    scancel <job_id>

For more information, check the [documentation](https://slurm.schedmd.com/documentation.html)

## Acessing the cluster:

    ssh <your_user_name>@10.112.11.131

## Sending information to the cluster:

Copy files from your local computer to seeslab server:

    scp <file_name>  <user_name>@10.30.41.62:<destination_path>
    
Copy folders from your local computer to seeslab server:

    scp -r <folder_name> <user_name>@10.30.41.62:<destination_path>

Copy files from the seeslab server to the cluster:

    scp <file_name>  <user_name>@10.112.11.131:/home/sees/<user_name>/<destination_path>

Copy folders from the seeslab server to the cluster:

    scp -r <folder_name> <user_name>@10.112.11.131:/home/sees/<user_name>/<destination_path>

## Sending information to your local computer

Copy files to the seeslab server:

    scp <file_name> <user_name>@10.30.41.62:<destination_path>

Copy folders to the seeslab server:

    scp -r <folder_name> <user_name>@10.30.41.62:<destination_path>



Copy files/folders to your local computer:

    scp <file_name> <user_name>@10.30.41.xyz:<destination_path>

    scp -r <folder_name> <user_name>@10.30.41.xyz:<destination_path>