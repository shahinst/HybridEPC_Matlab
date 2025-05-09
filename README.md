---

## 📌 Hybrid-EPC: MATLAB Implementation of a Community Detection Algorithm

This project is a full **MATLAB implementation** of the algorithm proposed in the paper:

**Hybrid-EPC: An Emperor Penguins Colony Algorithm with Crossover and Mutation Operators and its Application in Community Detection**
Published in *Progress in Artificial Intelligence*.

---

## ✅ About the Project

This repository implements the **Hybrid-EPC algorithm**, which is a **hybrid evolutionary optimization technique** inspired by:

* The **Emperor Penguins Colony (EPC)** optimization behavior
* Combined with **genetic operators** such as **crossover** and **mutation**

The algorithm is applied to the **Zachary Karate Club Network**, a well-known benchmark in social network analysis, to perform **community detection** by maximizing the **modularity score**.

---

## 🚀 What Has Been Done

Since the original paper provides **no source code**, we manually reconstructed and implemented the algorithm based on the paper's pseudocode and methodology.

Here’s what we built from scratch:

* Implemented `hybrid_epc.m`, a full version of the Hybrid-EPC algorithm
* Created `modularity_score.m` to evaluate community structures
* Added custom implementations of:

  * `arithmetic_crossover.m`
  * `gaussian_mutation.m`
* Built a modular folder structure
* Designed visualization tools to display:

  * Clustering results on the network
  * Convergence plots (2D & 3D)

---

## 🧱 Project Structure

```
HybridEPC_Project/
├── main.m                     # Main script to run the algorithm
├── hybrid_epc.m              # Core algorithm implementation
├── plot_graph_result.m       # Graph visualization
│
├── datasets/
│   ├── generate_zachary_matrix.m  # Generates the adjacency matrix
│   └── zachary_adj_matrix.mat     # Stored adjacency matrix of the network
│
├── utils/
│   └── modularity_score.m    # Modularity function
│
├── operators/
│   ├── arithmetic_crossover.m
│   └── gaussian_mutation.m
│
├── cost_functions/
│   └── sphere_func.m         # Example function for testing (optional)
```
---

## ⚙️ How to Run the Code

> Prerequisite: MATLAB installed (R2018a or later recommended)

### 1. Clone the repository

```bash
git clone https://github.com/your-username/HybridEPC_Project.git
cd HybridEPC_Project
```

### 2. Add all subfolders to MATLAB path

In the MATLAB Command Window:

```matlab
addpath(genpath(pwd))
```

### 3. Generate the dataset

If not already available:

```matlab
generate_zachary_matrix
```

### 4. Run the main script

```matlab
main
```

### 5. View the outputs

The script will automatically display:

* Best modularity score found (`Best Cost`)
* Graph visualization with colored clusters
* Cost evolution over iterations (2D and 3D)

---

## 📈 Output Example

* **Modularity Score (Best Cost):** 0.187
* **Graph Plot:** Clusters shown in distinct colors
* **Convergence Plot:** Shows optimization process across iterations

---

## 📚 Reference

If you use this code or build upon it, please consider citing the original paper:

```
Sahbi Bahroun, et al. Hybrid‑EPC: an Emperor Penguins Colony algorithm with crossover and mutation operators and its application in community detection. Progress in Artificial Intelligence (2022).
```

---

Do you want me to generate this README as a ready-to-publish Markdown file and ZIP your repo with it?
