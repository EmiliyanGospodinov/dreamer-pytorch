#!/bin/bash
sbatch << EOT
#!/bin/sh
#SBATCH --job-name=vanilla-dreamer-reference-$1
#SBATCH --partition=$2
#SBATCH --time=$3:00:00
#SBATCH --gres=gpu:1
#SBATCH --output=/home/kit/anthropomatik/pt9280/dreamer-pytorch/outputs/$1/vanilla-dreamer-reference-%j.out
#SBATCH --array=1-$4

source /home/kit/anthropomatik/pt9280/miniconda3/bin/activate $5

HYDRA_FULL_ERROR=1 MUJOCO_GL=egl python /home/kit/anthropomatik/pt9280/dreamer-pytorch/main.py --algo dreamer --env $1 --action-repeat 2 --id Vanilla_Dreamer_Reference_$1 --worldmodel-LogProbLoss

EOT