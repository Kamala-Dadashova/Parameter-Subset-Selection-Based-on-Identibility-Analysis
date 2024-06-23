# Local Identifiability Analysis, Parameter Subset Selection, and Verification for a Minimal Brain PBPK Model

The first chapter of my dissertation is about local sensitivity-based parameter subset selection algorithm for a minimal PBPK (Physiologically-based pharmacokinetic) model of the brain, which is critical for understanding drug delivery in the central nervous system. The approach focuses on identifying parameters that can be uniquely determined from experimental data, ensuring model accuracy for key concentrations such as plasma, brain interstitial fluid, and brain cerebrospinal fluid. These results are published.

## Key Concepts:
- **Parameter Identifiability**: Determines which parameters in the model can be uniquely identified from the data.
- **Local Sensitivity Analysis**: Evaluates how small changes in parameters affect model outputs.
- **Parameter Subset Selection (PSS)**: Identifies a subset of parameters that are most critical for accurate model predictions.

## Developed Algorithms to Find Identifiable Parameters:
1. **Parameter Subset Selection**:
   - **All-at-Once (AAO)**: Uses singular value decomposition (SVD) to identify non-identifiable parameters.
   - **One-at-a-Time (OAT)**: Iteratively removes the least identifiable parameter and recalculates the SVD.
3. **Verification**:
   - **Qualitative Method**: Compares response distributions when all parameters are varied versus when only identifiable parameters are varied.
   - **Quantitative Method**: Uses energy statistics to determine if the response distributions from the identifiable parameter subsets match those from the full parameter set.

## Results:
- The study demonstrates the effectiveness of the proposed methods in accurately identifying parameter subsets for the PBPK model, improving model reliability and reducing computational complexity.
- The one-at-a-time approach (OAT) generally outperforms the all-at-once method (AAO) in terms of accuracy.

## Applications:
This methodology is particularly useful for reducing model complexity, improving parameter estimation, and enhancing the robustness of PBPK models in drug development, especially for antibody therapeutics in the CNS.

## References:
- Bloomingdale et al. (2021)
- Chang et al. (2019)
- Additional references as cited in the paper.
- [Link to Full Paper](https://link.springer.com/article/10.1007/s11538-023-01234-4)


## Tools and Software:
- **Matlab (ver. 2022a)**: Used for solving the system of differential equations and performing sensitivity analysis.
- **Sensitivity Analysis Techniques**: Complex-step approximation for calculating local sensitivities.

