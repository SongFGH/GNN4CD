#!/bin/bash

# all commands that start with SBATCH contain commands that are just used by SLURM forscheduling
#################
# set a job name
#SBATCH --job-name=81_5gnnyeD_30_8_1_3200
#################
# a file for job output, you can check job progress
#SBATCH --output=disac5_gnn_yeD_otf_nl30_nf8_J1_ntr6000.out
#################
# a file for errors from the job
#SBATCH --error=disac5_gnn_yeD_otf_nl30_nf8_J1_ntr6000.err
#################
# time you think you need; default is one hour
# in minutes
# In this case, hh:mm:ss, select whatever time you want, the less you ask for the
# fasteryour job will run.
# Default is one hour, this example will run in less that 5 minutes.
#SBATCH --time=06:00:00
#################
# --gres will give you one GPU, you can ask for more, up to 4 (or how ever many are on the node/card)
#SBATCH --gres gpu:1
# We are submitting to the batch partition
#SBATCH --qos=batch
#################
#number of nodes you are requesting
#SBATCH --nodes=1
#################
#memory per node; default is 4000 MB per CPU
#SBATCH --mem=100000
#################
# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=zc1216@nyu.edu

source activate py36
python3 main_gnn_otf_cp.py \
--path_logger '' \
--path_gnn '' \
--filename_existing_gnn '' \
--num_examples_train 6000 \
--num_examples_test 100 \
--p_SBM 0.0 \
--q_SBM 0.045 \
--generative_model 'SBM_multiclass' \
--batch_size 1 \
--mode 'train' \
--clip_grad_norm 40.0 \
--num_features 8 \
--num_layers 30 \
--J 1 \
--N_train 400 \
--N_test 400 \
--print_freq 1 \
--n_classes 5 \
--lr 0.004
