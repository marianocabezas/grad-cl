#!/bin/bash

CIFAR_100i="--n_layers 2 --n_hiddens 100 --data_path /data/IncrementalLearning/GradCL/ --save_path /data/repro-results/ --batch_size 10 --log_every 100 --samples_per_task 2500 --data_file cifar100.pt           --cuda yes --seed 0"

# model "EWC"
python main.py $CIFAR_100i --model ewc --lr 1.0  --n_memories 10   --memory_strength 1 --seed 0


# model "GEM"
python main.py $CIFAR_100i --model gem --lr 0.1 --n_memories 256 --memory_strength 0.5 --seed 0

python main.py $CIFAR_100i --model agem --lr 0.1 --n_memories 256 --memory_strength 0.5 --seed 0

python main.py $CIFAR_100i --model sgem --lr 0.1 --n_memories 256 --memory_strength 0.5 --seed 0

# ours
python main.py $CIFAR_100i --model newblockgem_group5_pca3_partmargin --lr 0.1 --n_memories 256 --memory_strength 0.5 --seed 0