#!/bin/bash
#SBATCH --job-name=lighteval_mnlp
#SBATCH --output=logs/lighteval_jaccard_%j.out
#SBATCH --error=logs/lighteval_jaccard_%j.err
#SBATCH --time=02:00:00
#SBATCH --gpus=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G

# Load required modules
module load gcc python

# Activate your virtual environment (adjust path as needed)
source ~/lighteval-epfl-mnlp/lighteval_env/bin/activate

# Create logs directory if it doesn't exist
mkdir -p logs

# Create output directory
OUTPUT_DIR="/home/$USER/lighteval-epfl-mnlp/RAG_output/jaccard_run_${SLURM_JOB_ID}"
mkdir -p "$OUTPUT_DIR"

# Navigate to your project directory (adjust as needed)
cd ~/lighteval-epfl-mnlp/

# RAG pipeline
lighteval accelerate \
    --eval-mode "rag" \
    --save-details \
    --override-batch-size 8 \
    --custom-tasks "community_tasks/mnlp_mcqa_evals.py" \
    --output-dir "$OUTPUT_DIR" \
    model_configs/rag_model_jaccard.yaml \
    "community|mnlp_mcqa_evals|0|0"

# MCQA pipeline
# lighteval accelerate \
#     --eval-mode "lighteval" \
#     --save-details \
#     --override-batch-size 4 \
#     --custom-tasks "community_tasks/mnlp_mcqa_evals.py" \
#     --output-dir "base_results" \
#     model_configs/mcqa_model.yaml \
#     "community|mnlp_mcqa_evals|0|0"

echo "Done, outputs in $OUTPUT_DIR"