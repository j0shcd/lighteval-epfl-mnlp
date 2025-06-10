# Evaluating MCQA Model
# lighteval accelerate \
#     --eval-mode "lighteval" \
#     --save-details \
#     --override-batch-size 1 \
#     --custom-tasks "community_tasks/mnlp_mcqa_evals.py" \
#     --output-dir "base_results" \
#     model_configs/mcqa_model.yaml \
#     "community|mnlp_mcqa_evals|0|0"

# Evaluating Quantized Model
# lighteval accelerate \
#     --eval-mode "lighteval" \
#     --save-details \
#     --override-batch-size <BATCH_SIZE> \
#     --custom-tasks "community_tasks/mnlp_mcqa_evals.py" \
#     --output-dir "<path-to-your-output-dir>" \
#     model_configs/quantized_model.yaml \
#     "community|mnlp_mcqa_evals|0|0"

# Evaluating DPO Model
# lighteval accelerate \
#     --eval-mode "dpo" \
#     --save-details \
#     --override-batch-size <BATCH_SIZE> \
#     --custom-tasks "community_tasks/mnlp_dpo_evals.py" \
#     --output-dir "<path-to-your-output-dir>" \
#     model_configs/dpo_model.yaml \
#     "community|mnlp_dpo_evals|0|0"

# Evaluating RAG Model
lighteval accelerate \
    --eval-mode "rag" \
    --save-details \
    --override-batch-size 1 \
    --custom-tasks "community_tasks/mnlp_mcqa_evals.py" \
    --output-dir "rag_results" \
    model_configs/rag_model.yaml \
    "community|mnlp_mcqa_evals|0|0"