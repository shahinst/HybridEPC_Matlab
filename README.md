# Hybrid EPC for Community Detection

This project implements a Hybrid Enhanced Particle Collision (EPC) algorithm for community detection in social networks, with a specific focus on the Zachary Karate Club network as a case study.

## Overview

The Hybrid EPC algorithm combines several optimization techniques to efficiently detect communities in networks:
- Spiral movement for exploration
- Crossover operations for solution combination
- Mutation operations for diversity
- Parameter decay mechanisms for convergence

## Features

- Community detection in social networks
- Modularity-based optimization
- Multiple visualization options for results
- Configurable algorithm parameters
- Support for benchmark testing (Sphere function)

## Project Structure

```
├── main.m                 # Main script to run the algorithm
├── hybrid_epc.m          # Core algorithm implementation
├── plot_graph_result.m   # Visualization functions
├── datasets/             # Network data
│   └── zachary_adj_matrix.mat
├── utils/               # Utility functions
│   └── modularity_score.m
├── operators/           # Genetic operators
│   ├── arithmetic_crossover.m
│   └── gaussian_mutation.m
└── cost_functions/      # Objective functions
    └── sphere_func.m
```

## Requirements

- MATLAB (R2019b or later recommended)
- Statistics and Machine Learning Toolbox
- Graph and Network Algorithms Toolbox

## Usage

1. Clone the repository:
```bash
git clone https://github.com/shahinst/HybridEPC_Project
cd hybrid-epc
```

2. Open MATLAB and run the main script:
```matlab
main
```

## Parameters

The algorithm can be configured using the following parameters in `main.m`:

- `nPop`: Population size (default: 100)
- `MaxIter`: Maximum iterations (default: 200)
- `CrossoverRate`: Crossover probability (default: 0.7)
- `MutationRate`: Mutation probability (default: 0.2)
- `VarMin`: Minimum number of communities (default: 2)
- `VarMax`: Maximum number of communities (default: max(4, round(nVar/2)))

## Results

The algorithm provides:
- Best solution found
- Modularity score
- Multiple visualizations of the detected communities:
  - Force layout
  - Circle layout
  - 2D line plot
  - Subplot with multiple layouts

## Example Output

```
Best Cost: -0.17932
Best Modularity Q = 0.17932
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Citation

If you use this code in your research, please cite:

```bibtex
  author = {Shahin SalekTootoonchi},
  title = {Hybrid EPC for Community Detection},
  year = {2024},
  url = {https://github.com/shahinst/HybridEPC_Project}
}
```

## Acknowledgments

- Zachary Karate Club dataset
- MATLAB community for their excellent documentation and tools 
