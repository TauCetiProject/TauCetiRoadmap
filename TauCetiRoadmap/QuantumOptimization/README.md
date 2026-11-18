# Roadmap: quantum optimization: Ising and Max-Cut formulations, the adiabatic theorem and QAOA

**Summary.** This roadmap develops the mathematics behind optimization over bit strings by quantum
dynamics. Its objects are real-valued functions on `{0,1}^n` (quadratic ones in particular), their
diagonal Hamiltonians on `n` qubits, and the unitary evolutions built from such a Hamiltonian and
the transverse field. It includes the classical side of the subject: the reductions between
quadratic binary optimization, Ising energies and cuts, and the Goemans–Williamson rounding bound
for Max-Cut. Everything is finite-dimensional: bit strings are indexed by a finite type, graphs
are finite, and operators are complex square matrices.

The headline theorems are these.

- Every quadratic function of `n` binary variables is the negative of the cut-weight function of a
  symmetric real weight matrix on `n + 1` vertices, so that minimizing the one is maximizing a cut
  in the other; the weights are explicit, and no constant is added.
- For a weight matrix with nonnegative entries and unit vectors `u_i` in a finite-dimensional real
  inner product space, the cut produced by a standard Gaussian hyperplane has expected weight at
  least `α` times `Σ w_ij (1 − ⟨u_i, u_j⟩)/4` (sum over ordered pairs), where `α` is the minimum of
  `(2/π) θ/(1 − cos θ)` over `0 < θ ≤ π`, and `0.878 < α < 0.879`.
- Let `H(s)` be a twice continuously differentiable family of Hermitian matrices and `P(s)` the
  spectral projection of a band of eigenvalues that two continuous curves keep apart from the rest
  of the spectrum, at distance `g(s) > 0`. If `U` solves `i U' = T H(s) U`, `U(0) = 1`, with `T > 0`,
  then for `s ≥ 0` the norm of `U(s) P(0) U(s)* − P(s)` is at most
  `(1/T) (‖H'(0)‖/g(0)² + ‖H'(s)‖/g(s)² + ∫₀ˢ (‖H''‖/g² + 7 ‖H'‖²/g³))`.
- On every finite `3`-regular graph, the depth-one alternating state with angles
  `γ = arctan(1/√2)`, `β = π/8` has expected cut size at least `1/2 + 1/(3√3) > 0.6924` times the
  size of every cut; and for every cost function, the expected cost of the alternating states
  comes arbitrarily close to its maximum as the depth grows.

The roadmap builds on Tau Ceti's Dyson series for time-dependent linear equations (the propagator),
its Sylvester estimates behind the Davis–Kahan theorems (the gap dependence of the adiabatic
bound), its Perron–Frobenius theorem for irreducible matrices (simplicity of the top eigenvalue
along the interpolation), its Gaussian measures (hyperplane rounding), and Mathlib's matrix
exponential and continuous functional calculus.

Layer 1 below is classical: quadratic pseudo-Boolean functions, Ising energies, cuts, and penalty
formulations with exact thresholds. Layer 2 is the semidefinite relaxation of Max-Cut and its
rounding; it uses only the cut weight of Layer 1. Layer 3 puts cost functions on qubits and
analyses the transverse-field mixer; it uses Layer 1. Layer 4 is the adiabatic theorem for
Hermitian matrix families and uses none of Layers 1–3. Layer 5 is the quantum approximate
optimization algorithm (QAOA); it uses Layers 1, 3 and 4, and not Layer 2.

## Conventions

- **Configurations.** `ι` is a finite type of variables (`[Fintype ι]`, with `[DecidableEq ι]`
  from Layer 3 on). A configuration is `x : ι → Bool`. Its bit values are `bit x i ∈ {0, 1}`
  (`1` when `x i` is true) and its spins are `spin x i = 1 − 2 · bit x i ∈ {1, −1}`, so that the
  spin is the eigenvalue of the Pauli operator `Z` on the basis state `|x i⟩`. The other common
  convention `s = 2x − 1` differs by the sign of every field.
- **Ordered sums.** Quadratic forms are sums over all ordered pairs `(i, j)`, diagonal included,
  with an arbitrary real coefficient matrix. A sum `Σ_{i<j} c_ij` of the literature is the ordered
  sum of the symmetric matrix with entries `c_ij / 2` off the diagonal. Lucas's Ising energy
  `−Σ_{i<j} J_ij s_i s_j − Σ h_i s_i` is `ising (−J/2) (−h)` for symmetric `J` with zero diagonal.
- **Minimization and maximization.** Layer 1 states reductions as identities of values, so that
  they preserve minimizers and maximizers alike; `IsMinOn f Set.univ x` is Mathlib's notion of a
  global minimizer. Layers 2 and 5 maximize (cut weights, the cost `C`). No statement divides by an
  optimal value: guarantees are inequalities `c · (value of any cut) ≤ (achieved value)`.
- **Graphs.** A weighted graph is a real matrix `w` on the vertex type; symmetry (`w.IsSymm`) and
  nonnegativity of the entries are hypotheses where they are needed. A simple graph is Mathlib's
  `SimpleGraph ι` with decidable adjacency, and its weight matrix is `G.adjMatrix ℝ`.
- **Qubits.** The state space of the qubits `ι` is `(ι → Bool) → ℂ`, and operators are matrices
  `Matrix (ι → Bool) (ι → Bool) ℂ`. For `ι` empty this is `ℂ`, and all statements include that
  case.
- **Matrix norms.** Norms of matrices are Euclidean operator norms (Mathlib's scoped instances
  `Matrix.Norms.L2Operator`); derivatives of matrix-valued functions of a real variable are taken
  in that norm.
- **Families.** A Hamiltonian family is a function `H : ℝ → Matrix d d ℂ` on the whole line with
  `H r` Hermitian for every `r`. A family given on `[0, 1]` and twice continuously differentiable
  there is extended by its second-order Taylor polynomials at the two ends, which keeps it
  Hermitian and twice continuously differentiable; the statements of Layer 4 at `s ∈ [0, 1]` do
  not depend on the extension.
- **Evolution.** The Schrödinger equation is `i ∂ₛ U = T H(s) U`, that is `U' = −i T H(s) U`, with
  `U(0) = 1`.
- **QAOA.** A list of angle pairs `(γ, β)` describes the product of the layers
  `exp(−iβ B) exp(−iγ H_C)`, the head of the list acting first; the depth is the length of the
  list. The cost is maximized, as in Farhi, Goldstone and Gutmann.

## Layer 1: quadratic pseudo-Boolean functions, Ising energies and cuts

### 1.1 Quadratic functions of bits and of spins

Define `bit` and `spin` as in the Conventions, the quadratic pseudo-Boolean function
`qubo Q x = Σ_i Σ_j Q i j · bit x i · bit x j` of a real matrix `Q`, and the Ising energy
`ising J h x = Σ_i Σ_j J i j · spin x i · spin x j + Σ_i h i · spin x i` of couplings `J` and
fields `h`. Since `bit² = bit`, the diagonal of `Q` carries the linear terms; since `spin² = 1`,
the diagonal of `J` contributes the constant `Σ_i J i i`. Prove:

- `qubo_eq_ising`: `qubo Q x = ising (Q/4) h x + c` with `h i = −Σ_j (Q i j + Q j i)/4` and
  `c = Σ_i Σ_j Q i j / 4`;
- `ising_eq_qubo`: `ising J h x = qubo Q x + c` with
  `Q = 4J − diag(2 (Σ_j (J i j + J j i) + h i))` and `c = Σ_i Σ_j J i j + Σ_i h i`;
- consequently `x` minimizes one side exactly when it minimizes the other, and the minimal values
  differ by `c`;
- `qubo Q` depends only on `Q + Qᵀ`, and `ising J h` only on `h` and on the off-diagonal part of
  `J + Jᵀ` up to the constant `Σ_i J i i`;
- every `f : (ι → Bool) → ℝ` has exactly one expansion `f x = Σ_S c_S Π_{i ∈ S} bit x i` over
  subsets `S` of `ι`, and `f` is of the form `qubo Q + c` exactly when `c_S = 0` for all `S` with
  more than two elements.

(Lucas 2014, Section 1.1, equation (3), and Section 1.2 for the two forms; the coefficient
formulas are proved here.)

**Checks.**

- One variable, `Q = (q)`: `J = (q/4)`, `h = −q/2`, `c = q/4`, and the right side is `q` at
  `x = true` (spin `−1`) and `0` at `x = false`. With the convention `s = 2x − 1` the field would
  be `+q/2`.
- Two variables, `Q` with the single nonzero entry `Q 1 2 = 1`: `qubo Q x = x₁ x₂`, while the
  symmetric matrix with `Q 1 2 = Q 2 1 = 1` gives `2 x₁ x₂`.

*Needs:* finite sums in Mathlib.

### 1.2 Removing fields with one more spin

For `J`, `h` on `ι`, let `J'` be the matrix on `Option ι` that is `J` on `ι`, has entries `h i / 2`
in the row and in the column of the new index, and `0` at the new diagonal entry. Prove
`ising_ancilla`: for every `y : Option ι → Bool`, `ising J' 0 y = ising J h x` where
`x i = y (some i) xor y none`. The map `y ↦ x` is two-to-one and onto, so the two energies have
the same minimal value, and the minimizers of the field-free energy are the two lifts of the
minimizers of the original. (Proved here.)

**Checks.**

- `ι` one point, `J = 0`: `J'` has two entries `h/2`, the energy is `h · s₀ · s₁`, and `s₀ s₁` is
  the spin of `x`.
- Putting `h i` instead of `h i / 2` in both the row and the column doubles the field.

*Needs:* 1.1.

### 1.3 Cuts

Define `cutWeight w x = Σ_i Σ_j w i j · bit x i · (1 − bit x j)`: the total weight of the ordered
pairs from the true side to the false side. For symmetric `w` each unordered pair across the cut
is counted once, and the diagonal of `w` never contributes. Prove:

- `cutWeight_eq_ising`: for symmetric `w`, `cutWeight w x = W/4 − ising (w/4) 0 x` with
  `W = Σ_i Σ_j w i j`, so maximum cuts are the ground states of the Ising energy with couplings
  `w/4`;
- for every `w`, symmetric or not, `cutWeight w x = −qubo (w − diag(Σ_j w i j)) x`;
- `qubo_eq_neg_cutWeight`: for every `Q` on `ι` and `y : Option ι → Bool`,
  `qubo Q x = −cutWeight w' y` with `x i = y (some i) xor y none` and `w'` the symmetric matrix on
  `Option ι` with `w' i j = (Q i j + Q j i)/2` on `ι` and `w' none i = −Σ_k (Q i k + Q k i)/2`.
  The weights `w'` may be negative even when `Q ≥ 0`.

(Williamson and Shmoys 2011, Lemma 6.3, for the spin form of a cut; the reduction of a quadratic
function to a cut is proved here from 1.1 and 1.2.)

**Checks.**

- Two vertices, `w 1 2 = w 2 1 = 1`: the cut weight is `1` at `(true, false)` and at
  `(false, true)` and `0` otherwise. With `w 1 2 = 1`, `w 2 1 = 0` it is `1` at `(true, false)`
  only: for asymmetric weights `cutWeight` is a directed cut.
- The triangle with unit weights: `W = 6`, and a vertex against the other two gives
  `6/4 − (2 − 4)/4 = 2`, the maximum.
- `Q = (1)`: `w' none 0 = −1`; at `y none = false`, `y (some 0) = true` the cut weight is `−1`
  and `qubo Q x = 1`.
- For `w = G.adjMatrix ℝ` the cut weight is the number of edges of `G` between `{i | x i}` and
  its complement.
- The two-variable cost `f ![a, b] = −w` if `a ≠ b` and `0` otherwise, with `w > 0`, has Mathlib's
  `Function.HasMaxCutPropertyAt f false true`; with `w = 0` it does not.

*Needs:* 1.1, 1.2; Mathlib `Matrix.IsSymm`.

### 1.4 Penalty formulations

Each item is an identity or an equivalence between minimizers of an explicit quadratic function
and optimal solutions of a combinatorial problem, with the range of penalties for which it holds.

- **Number partitioning.** For `a : ι → ℝ`, `ising (a aᵀ) 0 x = (Σ_i a i · spin x i)²`: the
  energy is the squared difference of the two part sums, it is `0` exactly at the perfect
  partitions, and its minimizers are the partitions of least imbalance (Lucas 2014, Section 2.1,
  equation (6)).
- **Maximum independent set.** For a simple graph `G` and `0 < B < A`, the function
  `x ↦ A · #{edges inside x} − B · #x`, which is `qubo ((A/2) • G.adjMatrix ℝ − B • 1)`, has as
  its minimizers exactly the maximum independent sets (`isMinOn_qubo_independentSet_iff`); its
  minimal value is then `−B` times the independence number (Lucas 2014, Section 4.2, equations
  (30)–(32); the equivalence is proved here). An internal edge costs at least `A`, and deleting one
  of its ends removes that cost and raises the second term by exactly `B`.
- **Minimum vertex cover.** For `0 < B < A`, the minimizers of
  `x ↦ A · #{edges with no end in x} + B · #x` are exactly the minimum vertex covers; this is the
  previous item for the complement of `x` (Lucas 2014, Section 4.3, equations (33)–(34)).
- **Exact cover.** For a family `S : ι → Finset α` of subsets of a finite type `α`, define
  `exactCoverEnergy S A B x = A Σ_a (1 − #{i | x i, a ∈ S i})² + B · #x`. For `A > 0` the first
  term vanishes exactly at the exact covers. If an exact cover exists and `A > |α| · B > 0`, the
  minimizers are exactly the exact covers with the fewest sets
  (`isMinOn_exactCoverEnergy_iff`) (Lucas 2014, Section 4.1, equations (28)–(29); proved here: a
  smallest exact cover has no empty set, hence at most `|α|` sets and energy at most `|α| B < A`).
- **Colouring.** For `k` colours, the function of `x : ι × Fin k → Bool`
  `Σ_v (1 − Σ_c x(v,c))² + Σ_{uv ∈ E} Σ_c x(u,c) x(v,c)` is nonnegative and vanishes exactly at the
  encodings of proper `k`-colourings (Lucas 2014, Section 6.1, equation (51)).

**Checks.**

- The single edge with `A = B = 1`: both ends together have energy `1 − 2 = −1`, the same as one
  end, so a set that is not independent minimizes. The strict inequality `B < A` is needed.
- The triangle with `A = 2`, `B = 1`: single vertices have energy `−1`, pairs `0`.
- `α = {1, 2}`, `S = ({1}, {2}, {1, 2})`, `A = 3`, `B = 1`: the exact covers have energies `2`
  and `1`, and the minimizer is the single set `{1, 2}`.
- `α = {1, 2}` and the single set `{1}` (no exact cover), `A > 2B`: the minimizer is that set,
  with energy `A + B < 2A`, and it is not an exact cover.
- `α = {1, 2, 3, 4}`, `S = ({1, 2}, {3}, {4}, {2, 3, 4})`, `B = 1`: for `A = 5` the minimizer
  is the exact cover by the first three sets, energy `3`; for `A = 3/2`, below `|α| B = 4`, it is
  the last set alone, energy `5/2`, which is not a cover.
- With `B = 0` every exact cover minimizes, whatever its size.

*Needs:* 1.1; Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.IsMaximumIndepSet`.

### 1.5 Quadratization

Prove the substitution step: for real `c`, `M` and bits `x₁, x₂, x₃`, with the penalty
`p(x₁, x₂, y) = x₁ x₂ − 2 x₁ y − 2 x₂ y + 3 y` (which is `0` when `y = x₁ x₂` and at least `1`
otherwise), `min over y ∈ {0,1} of (c y x₃ + M p(x₁, x₂, y)) = c x₁ x₂ x₃` holds for all bits
exactly when `M ≥ |c|`, and `y = x₁ x₂` is the only minimizer for all bits exactly when `M > |c|`.
Prove from it, by induction on the expansion of 1.1, `exists_quadratization`: for every
`f : (ι → Bool) → ℝ` there are `m`, a matrix `Q` on `ι ⊕ Fin m` and a constant `c` such that for
every `x`, `f x` is the least value of `y ↦ qubo Q (x, y) + c` over `y : Fin m → Bool`. (The
substitution is due to Rosenberg, 1975; proved here.)

**Checks.**

- `p` takes the values `0, 3, 0, 1, 0, 1, 1, 0` at `(x₁, x₂, y) = 000, 001, 010, 011, 100, 101,
  110, 111`.
- `c = 1`, `M = 1/2`: at `x = (1, 1, 1)` the values at `y = 0, 1` are `1/2` and `1`, and the
  minimum `1/2` is not `c x₁ x₂ x₃ = 1`. With `M = 1` the values are `1` and `1`: the minimum is
  right and the minimizer is not unique.
- `ι` empty: `m = 0`, `Q` empty and `c` the value of `f`.

*Needs:* 1.1.

### Examples

The triangle as a Max-Cut instance and as an Ising energy; the single edge as an independent-set
instance at and below the penalty threshold.

### Dependencies

1.1 uses finite sums only; 1.2 uses 1.1; 1.3 uses 1.1 and 1.2; 1.4 uses 1.1 and Mathlib's
adjacency matrix and maximum independent sets; 1.5 uses 1.1.

## Layer 2: the semidefinite relaxation of Max-Cut and hyperplane rounding

### 2.1 The constant

Define `gwConstant` as the infimum of `(2/π) θ/(1 − cos θ)` over `0 < θ ≤ π`; the set of values
is nonempty and bounded below by `0`. Prove:

- `gwConstant_eq`: the infimum is attained at exactly one point `θ₀`, which lies in `(π/2, π)`
  and is the solution there of `tan(θ₀/2) = θ₀`;
- `gwConstant_mem_Ioo`: `0.878 < gwConstant < 0.879`;
- `gwConstant_mul_le_arccos`: `gwConstant · (1 − t)/2 ≤ arccos t / π` for `−1 ≤ t ≤ 1`;
- equality holds in the last inequality at `t = 1` and at `t = cos θ₀`.

The derivative of `θ/(1 − cos θ)` has the sign of `1 − cos θ − θ sin θ`, which vanishes on
`(0, π]` exactly where `tan(θ/2) = θ`. (Williamson and Shmoys 2011, Lemma 6.8, with `0.878` in
place of the constant; the definition as a minimum is that of Goemans and Williamson, 1995; the
characterization and the bounds are proved here.)

**Checks.**

- The function is `1` at `θ = π/2` and at `θ = π`, tends to `+∞` at `0`, and
  `θ₀ = 2.33112…`, `gwConstant = 0.87856…`.
- The inequality of the third item fails for the constant `0.879` at `t = cos θ₀`.

*Needs:* Mathlib `Real.arccos`, `Real.pi_gt_d6`, `Real.pi_lt_d6`.

### 2.2 The hyperplane probability

Let `E` be a finite-dimensional real inner product space with its Borel σ-algebra and `u, v` unit
vectors. Prove `stdGaussian_sign_inner_ne`: under the standard Gaussian measure of `E`, the set of
`g` with `sign ⟪g, u⟫ ≠ sign ⟪g, v⟫` has measure `arccos ⟪u, v⟫ / π`; and the one-sided form: the
set where `⟪g, u⟫ < 0 ≤ ⟪g, v⟫` has measure `arccos ⟪u, v⟫ / (2π)`.

The inner products depend only on the projection of `g` to the span of `u` and `v`, which is
standard Gaussian there; in the plane the direction of a standard Gaussian vector is uniform on
the circle; with `θ = arccos ⟪u, v⟫`, the two-sided event is a pair of opposite arcs of angle `θ`
and the one-sided event is one of them. If `u = v` both events are empty; if `u = −v` the span is
a line, the two-sided event is the complement of the origin and the one-sided event is an open
half-line. (Williamson and Shmoys 2011, Fact 6.4, Corollary 6.6 and Lemma 6.7.)

**Checks.**

- `u = v`: probability `0`. `u = −v`: probability `1`, and the one-sided event has probability
  `1/2`. Orthogonal `u`, `v`: `1/2` and `1/4`.
- The unit-norm hypotheses are needed. For `u = 0` and a unit `v` the left side is `1` (the
  sign of `⟪g, v⟫` is almost surely not `0`) while `arccos 0 / π = 1/2`. For `u`, `v` of norm `2`
  at an angle of `π/3` the left side is `1/3`, while `⟪u, v⟫ = 2` and Mathlib's `arccos 2` is `0`.

*Needs:* Mathlib `ProbabilityTheory.stdGaussian`; Tau Ceti
`Submodule.map_orthogonalProjectionOnto_stdGaussian`,
`TauCeti.Probability.stdGaussian_map_sphereDirection`,
`TauCeti.Probability.map_circleSphereHomeomorph_haarAddCircle`.

### 2.3 The relaxation and the rounding guarantee

Define `cutRelaxation w X = Σ_i Σ_j w i j (1 − X i j)/4`, the objective of the relaxation at a
real matrix `X`; the feasible points are the positive semidefinite `X` with unit diagonal, which
are the Gram matrices `X i j = ⟪u i, u j⟫` of families of unit vectors. Define
`hyperplaneCut u g`, the configuration that is true at `i` when `⟪g, u i⟫ < 0`. Prove, for `u` a
family of unit vectors in `E` as in 2.2:

- for symmetric `w` and every configuration `x`, `cutWeight w x = cutRelaxation w (s sᵀ)` with
  `s = spin x`, and `s sᵀ` is feasible: the relaxation bounds every cut from above;
- `integral_cutWeight_hyperplaneCut`: for every real `w`, the expectation of
  `cutWeight w (hyperplaneCut u g)` over standard Gaussian `g` is
  `Σ_i Σ_j w i j · arccos ⟪u i, u j⟫ / (2π)`;
- `gwConstant_mul_cutRelaxation_le_integral`: if all `w i j ≥ 0`, that expectation is at least
  `gwConstant · cutRelaxation w X` for the Gram matrix `X` of `u`;
- `exists_gwConstant_mul_cutRelaxation_le_cutWeight`: if all `w i j ≥ 0`, every feasible `X` has
  a configuration `x` with `gwConstant · cutRelaxation w X ≤ cutWeight w x`;
- for symmetric `w ≥ 0` the continuous function `cutRelaxation w` attains its maximum on the
  compact feasible set, and by the first and fourth items the maximum cut weight lies between
  `gwConstant` times that maximum and that maximum.

(Williamson and Shmoys 2011, Theorem 6.9 and its proof, for symmetric weights on the edges of a
graph; the statements for ordered pairs, which need no symmetry, are proved here.)

**Checks.**

- The pentagon with unit weights and `u i` at angles `4πi/5` in the plane: the objective is
  `(5/2)(1 − cos(4π/5)) = 4.5225…`, the expected rounded cut is `10 · (4π/5)/(2π) = 4`, the
  maximum cut, and `4/4.5225… = 0.8844… ≥ gwConstant`.
- With `w 1 2 = −1` and `u 1 = −u 2` the expectation is `−1/2` and the relaxation term is
  `−1/2`, so the inequality `gwConstant · (−1/2) ≤ −1/2` fails: nonnegativity is needed.

*Needs:* 1.3, 2.1, 2.2; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`.

### Examples

The pentagon, where the relaxation is strictly above the maximum cut; a bipartite graph, where
the antipodal embedding makes the relaxation, the rounding and the maximum cut coincide.

### Dependencies

2.1 uses real analysis in Mathlib; 2.2 uses the standard Gaussian measure and Tau Ceti's
projection, direction and uniform-angle theorems; 2.3 uses 1.3, 2.1, 2.2 and Tau Ceti's Gram
factorization.

## Layer 3: diagonal and transverse-field Hamiltonians on qubits

### 3.1 Diagonal Hamiltonians and Pauli operators

Define `diagHam C`, the diagonal matrix with entries `C x`, for `C : (ι → Bool) → ℝ`. The Pauli
operator `Z` on qubit `i` is `diagHam (spin · i)`. Define `pauliX i`, the permutation matrix of
the flip of bit `i`. Prove:

- `C ↦ diagHam C` is an injective homomorphism of real algebras into the Hermitian matrices, so
  that the diagonal Hamiltonian of `ising J h` is `Σ_i Σ_j J i j Z_i Z_j + Σ_i h i Z_i`, and that
  of `cutWeight w` for symmetric `w` is `Σ_i Σ_j w i j (1 − Z_i Z_j)/4`;
- the real spectrum of `diagHam C` is the range of `C`; the eigenspace of a value `c` is spanned
  by the basis states `x` with `C x = c`; in particular the lowest eigenspace is spanned by the
  minimizers of `C`, and it has dimension `1` exactly when the minimizer is unique;
- the exponential of `−iγ · diagHam C` is the diagonal matrix with entries `exp(−iγ C x)`;
- `X_i² = Z_i² = 1`, `X_i Z_i = −Z_i X_i`, and operators on distinct qubits commute.

(Lucas 2014, Section 1.1, equation (4), for the diagonal Hamiltonian of an Ising energy; proved
here.)

**Checks.**

- One qubit, basis ordered `(false, true)`: `Z = diag(1, −1)`, `X` has rows `(0, 1)` and
  `(1, 0)`, and `diagHam (bit · 0) = (1 − Z)/2 = diag(0, 1)`.
- No qubits: every matrix is `1 × 1`, and `diagHam C` is the value of `C` at the empty
  configuration.
- `C = 0` on two qubits: the lowest eigenspace is everything, of dimension `4`.

*Needs:* 1.1, 1.3; Mathlib `Matrix.diagonal`, `spectrum_diagonal`, `Matrix.exp_diagonal`.

### 3.2 The transverse-field mixer

Define `mixer ι = Σ_i pauliX i` and `plusState ι`, the vector with all entries `2^(−n/2)`,
`n = Fintype.card ι`. Prove:

- for each subset `S` of `ι`, the vector `x ↦ Π_{i ∈ S} spin x i` is an eigenvector of the mixer
  with eigenvalue `n − 2 |S|`, and these `2^n` vectors are an orthogonal basis;
- `charpoly_mixer`: the characteristic polynomial of the mixer is
  `Π_{k=0}^{n} (X − (n − 2k))^(n choose k)`;
- the largest eigenvalue `n` is simple with unit eigenvector `plusState ι`, and the smallest,
  `−n`, is simple with eigenvector `x ↦ Π_i spin x i`;
- `exp_mixer_apply`: the `(x, y)` entry of `exp(−iβ · mixer)` is
  `cos(β)^(n − d) · (−i sin β)^d`, where `d` is the number of `i` with `x i ≠ y i`.

(Proved here.)

**Checks.**

- No qubits: the mixer is the `1 × 1` zero matrix and the formula gives the polynomial `X`.
- Two qubits: eigenvalues `2, 0, 0, −2`.
- One qubit: `exp(−iβ X) = cos β − i sin β · X`; the sign `+i` would be `exp(+iβ X)`.

*Needs:* 3.1; Mathlib `NormedSpace.exp`, `Matrix.exp_sum_of_commute`.

### 3.3 The top eigenvalue along the interpolation

For a cost `C` and `0 ≤ s < 1` let `A(s) = (1 − s) · mixer + s · diagHam C`. Prove:

- `exists_pos_eigenvector_interpolation`: there are a real `r` and a vector `v` with positive
  real entries such that `A(s) v = r v` and every eigenvalue of `A(s)` is at most `r`;
- `eigenvalues₀_interpolation_lt`: `r` is a simple eigenvalue: in Mathlib's decreasing list
  `eigenvalues₀` of the Hermitian matrix `A(s)`, every entry after the first is strictly smaller
  than the first;
- for the unit eigenvector `v` of the top eigenvalue and `0 < s < 1`,
  `Σ_x C x · v x² ≥ max C − n (1 − s)/s`.

The same holds for the lowest eigenvalue of `−(1 − s) · mixer + s · diagHam C` (apply the above to
`−C`), a matrix with nonpositive off-diagonal entries.

For `c > s · max |C|` the real matrix `c + A(s)` has nonnegative entries and positive diagonal,
and its off-diagonal entries are positive exactly at the pairs of configurations that differ in
one bit, a connected graph; so it is irreducible, and the Perron–Frobenius theorem gives `r` and
`v` and the one-dimensional eigenspace. That `r` is the largest eigenvalue follows from symmetry:
if `w` is a real eigenvector of the largest eigenvalue, the Rayleigh quotient of `|w|` is at least
that of `w`, so `|w|` is one too, and a nonnegative eigenvector has eigenvalue `r`. The third item
compares the top eigenvalue with the Rayleigh quotients at a maximizer of `C` and at `v`; the
mixer has zero diagonal and norm `n`. (Farhi, Goldstone and Gutmann 2014, Section VI, state the
simplicity; proved here.)

**Checks.**

- One qubit, `C = (0, c)`: the eigenvalues of `A(s)` are `(sc ± √(s²c² + 4(1 − s)²))/2`, distinct
  for `s < 1`.
- `s = 1` is excluded: `diagHam C` has a simple top eigenvalue only if `C` has one maximizer, and
  for `C = 0` on one qubit both eigenvalues are `0`.
- No qubits: the matrix is `1 × 1` and the statement about later entries is empty.

*Needs:* 3.1, 3.2; Mathlib `Matrix.IsIrreducible`, `Matrix.IsHermitian.eigenvalues₀`,
`Matrix.IsHermitian.spectral_theorem`; Tau Ceti `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg`,
`Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul`.

### Examples

One qubit with `C = (0, 1)`; two qubits with the cut size of a single edge, where the top
eigenspace of `diagHam C` has dimension `2` and that of `A(s)`, `s < 1`, has dimension `1`.

### Dependencies

3.1 uses 1.1, 1.3 and Mathlib's diagonal matrices; 3.2 uses 3.1 and the matrix exponential; 3.3
uses 3.1, 3.2 and Tau Ceti's Perron–Frobenius theorems.

## Layer 4: the adiabatic theorem for Hermitian matrix families

Throughout, `d` is a finite type and `H : ℝ → Matrix d d ℂ` a family as in the Conventions.

### 4.1 The Schrödinger propagator

Define `schrodingerPropagator H T s` as Tau Ceti's left Dyson series of `r ↦ −iT · H r` at `s`.
For continuous `H` prove: it is `1` at `s = 0`; it is differentiable in `s` with derivative
`−iT H(s) U(s)`, and it is the only such function; it is unitary when `H` is a Hermitian family;
for constant `H` it is `exp(−iTs H)`; the propagator of the shifted family `r ↦ H(a + r)` at `s`
is `U(a + s) U(a)⁻¹`. Prove the comparison `norm_schrodingerPropagator_sub_le`: for continuous
Hermitian families `H₁`, `H₂`, real `T` and `s ≥ 0`,
`‖U₁(s) − U₂(s)‖ ≤ |T| ∫₀ˢ ‖H₁ − H₂‖`. For `W = U₁* U₂` one has
`W' = iT U₁* (H₁ − H₂) U₂`, and `‖U₁ − U₂‖ = ‖1 − W‖`. (Proved here.)

**Checks.**

- `d` one point, `H = (h)` constant, `T = 1`: `U(s) = exp(−ish)`, not `exp(+ish)`.
- `H₁ = H₂`: the bound is `0`. `d` one point, `H₁ = 1`, `H₂ = 0`, `T = 1`:
  `|exp(−is) − 1| = 2 |sin(s/2)| ≤ s`.
- For a family that is not Hermitian the propagator need not be unitary: `d` one point and
  `H = (i)` give `U(s) = exp(Ts)`.

*Needs:* Tau Ceti `TauCeti.dysonSeriesLeft`, `TauCeti.dysonSeriesLeft_zero`,
`TauCeti.hasDerivAt_dysonSeriesLeft`, `TauCeti.eq_dysonSeriesLeft_mul`,
`TauCeti.dysonSeries_mem_unitary`, `TauCeti.op_dysonSeriesLeft`; Mathlib
`Matrix.Norms.L2Operator`, `intervalIntegral.norm_integral_le_integral_norm`.

### 4.2 Bands, their projections and the reduced resolvent

For a Hermitian matrix `A` and reals `a`, `b` define `bandProj A a b`, the continuous functional
calculus of the indicator of `[a, b]` at `A`: the orthogonal projection onto the sum of the
eigenspaces with eigenvalues in `[a, b]`. Define `bandGap A a b`, the least distance between an
eigenvalue in `[a, b]` and one outside, with the value `0` when either set is empty. For a family
`H` and band edges `a, b : ℝ → ℝ` write `P(r) = bandProj (H r) (a r) (b r)`, `Q = 1 − P` and
`g(r) = bandGap (H r) (a r) (b r)`. Prove:

- `P(r)` is a star projection commuting with `H(r)`; if `a(r), b(r)` are not eigenvalues, it is
  the Riesz integral `−(2πi)⁻¹ ∮ (H(r) − z)⁻¹ dz` over the circle with diameter
  `[a(r), b(r)]` when `a(r) < b(r)`;
- `contDiffAt_bandProj`: if `H` is `n` times continuously differentiable at `s` (`n` a natural
  number or `∞`), the edges are continuous at `s`, and `a(s)`, `b(s)` are not eigenvalues of
  `H(s)`, then `P` is `n` times continuously differentiable at `s`;
- under the same hypotheses with `n = 0`, the rank of `P` is constant near `s` and `g` is
  continuous at `s`;
- for a matrix `X`, the reduced-resolvent transform `X̃ = (2πi)⁻¹ ∮ (H − z)⁻¹ X (H − z)⁻¹ dz`
  satisfies `P X̃ P = Q X̃ Q = 0` and `H X̃ − X̃ H = P X − X P`, and `‖X̃‖ ≤ ‖X‖ / g` when the band
  and its complement are both nonempty;
- `P' = (H')̃`, `P P' P = Q P' Q = 0`, and `norm_deriv_bandProj_le`: if `H` is differentiable at
  `s`, the edges are continuous at `s` and are not eigenvalues there, then `‖P'(s)‖ ≤ ‖H'(s)‖/g(s)`;
- for a twice continuously differentiable family, `‖(P')̃‖ ≤ ‖H'‖/g²`,
  `‖Q P'' P‖ ≤ ‖H''‖/g + 4 ‖H'‖²/g²` and `‖Q ((P')̃)' P‖ ≤ ‖H''‖/g² + 6 ‖H'‖²/g³`.

The blocks `P X̃ Q` and `Q X̃ P` solve Sylvester equations for `H` restricted to the band and to
its complement, whose eigenvalues lie in an interval and outside the interval enlarged by `g`;
Tau Ceti's interval/exterior Sylvester bound gives `g ‖P X̃ Q‖ ≤ ‖P X Q‖`, and likewise for the
other block (the band is the interval side in both blocks, in the two orientations of the cited
bound, so the band may lie anywhere in the spectrum), and the norm of an off-diagonal matrix is
the larger of the norms of its blocks. The
remaining estimates apply this bound to the derivative formulas. (Jansen, Ruskai and Seiler 2007,
Lemmas 2 and 5–8 and equations (17)–(18), arXiv version 3. Their Lemma 7 bounds `‖X̃‖` by
`√m ‖X‖/g` for a band with `m` distinct eigenvalues, and their Lemma 8 carries the resulting
powers of `√m`; the Sylvester bound removes them. Proved here.)

**Checks.**

- `A = diag(0, 1, 3)`: the band `[1/2, 2]` has projection `diag(0, 1, 0)` and gap `1`; the band
  `[−1, 2]` has projection `diag(1, 1, 0)` and gap `2`, the spacing inside the band not counting;
  the bands `[5, 6]` and `[−1, 4]` have projections `0` and `1` and gap `0` by convention, and
  then `P' = 0`.
- `H(r) = cos(πr/2) Z + sin(πr/2) X` on one qubit, band around the eigenvalue `1`: `g = 2`,
  `‖H'‖ = π/2`, `P(r)` projects on `(cos(πr/4), sin(πr/4))` and `‖P'‖ = π/4 = ‖H'‖/g`: the bound
  is attained.
- If `H` is not differentiable at `s` the bound fails: `H(r) = |r| · 1 + H₀(r)` with edges
  `|r| + a₀`, `|r| + b₀` has the projection of `H₀`, while Mathlib's `deriv H 0` is `0`.

*Needs:* Mathlib `cfc`, `circleIntegral`, `circleIntegral.integral_sub_inv_of_mem_ball`,
`contDiffAt_ringInverse`; Tau Ceti `TauCeti.isStarProjection_cfc_indicator`,
`Matrix.IsHermitian.toEuclideanLin_cfc_indicator`,
`Matrix.IsHermitian.inv_sub_smul_one_eq_conjStarAlgAut_diagonal`, `Matrix.continuous_eigenvalues₀`,
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_of_mem`,
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_swap_of_mem`,
`TauCeti.UnitarilyInvariantSeminorm.opNorm`.

### 4.3 The intertwining evolution

Prove Kato's intertwining property in a complete normed real algebra
(`dysonSeriesLeft_mul_eq_mul_dysonSeriesLeft`): if `P : ℝ → B` is continuously differentiable
with every `P(s)` idempotent and `A : ℝ → B` is continuous with `A(s) P(s) = P(s) A(s)`, then the
solution `Γ` of `Γ' = (A + P' P − P P') Γ`, `Γ(0) = 1`, satisfies `Γ(s) P(0) = P(s) Γ(s)` for all
`s`. Both sides solve the same linear equation with the same value at `0`, because `P' = P' P +
P P'` and `P P' P = 0`. For `A = −iT H` and `P` the band projection of 4.2 this is the adiabatic
evolution; it is unitary because `P' P − P P'` is skew-adjoint. (Jansen, Ruskai and Seiler 2007,
Lemma 1 and equation (7), arXiv version 3; Kato 1950 in prose there.)

**Checks.**

- `A = 0` and `P(s)` the projection of the plane on the line at angle `s`: `P' P − P P'` is the
  generator of rotations, `Γ(s)` is the rotation by `s`, and it carries the line at angle `0` to
  the line at angle `s`.
- Without the commutation the conclusion fails: constant `P = diag(1, 0)` and constant `A` the
  generator of rotations give `Γ(s)` the rotation by `s`, which does not commute with `P`.

*Needs:* Tau Ceti `TauCeti.dysonSeriesLeft`, `TauCeti.hasDerivAt_dysonSeriesLeft`,
`TauCeti.eq_dysonSeriesLeft_mul`.

### 4.4 The adiabatic bound

Let `H` be a twice continuously differentiable Hermitian family, `s ≥ 0`, and `a`, `b` continuous
on `[0, s]` with `a(r)`, `b(r)` not eigenvalues of `H(r)` for `r ∈ [0, s]`. With `P`, `g` as in
4.2, `U = schrodingerPropagator H T` and `T > 0`, prove `norm_adiabatic_sub_bandProj_le`:

    ‖U(s) P(0) U(s)* − P(s)‖ ≤ (1/T) ( ‖H'(0)‖/g(0)² + ‖H'(s)‖/g(s)²
                                       + ∫₀ˢ ( ‖H''(r)‖/g(r)² + 7 ‖H'(r)‖²/g(r)³ ) dr ).

Consequently `‖(1 − P(s)) U(s) P(0)‖` has the same bound, and a unit vector in the range of
`P(0)` is found outside the range of `P(s)` with probability at most the square of the bound.

With `Γ` the adiabatic evolution of 4.3 and `Ω = Γ* U`, the left side is the norm of
`Q(0) Ω P(0) − P(0) Ω Q(0)`, the larger of the norms of the two blocks. `Ω` solves a Volterra
equation whose kernel is `Γ* (P' P − P P') Γ`; one integration by parts, using the reduced
resolvent to invert the commutator with `H`, produces the factor `1/T`, two boundary terms bounded
by `‖(P')̃‖` and two integrals bounded by `‖Q ((P')̃)' P‖` and `‖(P')̃‖ ‖P'‖`. On `[0, s]` the
band is nonempty throughout or empty throughout, `g` is continuous, and it is positive when the
band and its complement are nonempty; in the other cases `P` is `0` or `1` and the left side is
`0`. (Jansen, Ruskai and Seiler 2007, Theorem 3, with equations (9)–(11) and Lemmas 3 and 8,
arXiv version 3. Theorem 3 there has the factors `m`, `m` and `7 m √m` on the three terms, `m`
being the number of distinct eigenvalues in the band, and it follows from the bound above when
the band is nonempty. Proved here with the estimates of 4.2.)

For `H(r) = (1 − r) H₀ + r H₁` and `g ≥ g₀ > 0` on `[0, s]` the bound is at most
`(‖H₁ − H₀‖/T) (2/g₀² + 7 s ‖H₁ − H₀‖/g₀³)`.

**Checks.**

- `H(r) = cos(πr/2) Z + sin(πr/2) X` on one qubit, band around the eigenvalue `1`, `s = 1`: the
  left side is `(π/4) |sin Ω| / Ω` with `Ω = √(T² + π²/16)`, at most `π/(4T)`; the bound is
  `(π/4 + 9π²/32)/T = 3.561…/T`.
- `T → 0` is excluded: at `T = 0` the left side is `‖P(0) − P(s)‖`, which is `1/√2` in the
  previous example (the closed form at `Ω = π/4`), while the right side is `0` because Lean's
  `1/0 = 0`.
- Constant `H`: the left side and the bound are `0`.
- A band that is the whole spectrum or empty: both sides are `0`, with `g = 0` by convention.
- The curves are needed: for constant `H = diag(0, 1)` and the edges `a = −1/2`, `b = 1/2` for
  `r < 1/2` and `a = 1/2`, `b = 3/2` for `r ≥ 1/2`, no edge is an eigenvalue, the left side at
  `s = 1` is `1` and the right side is `0`; the edges are not continuous.

*Needs:* 4.1, 4.2, 4.3; Mathlib `intervalIntegral.integral_mul_deriv_eq_deriv_mul`.

### Examples

The rotating field on one qubit, where every quantity is explicit; the interpolation
`(1 − r) H₀ + r H₁` with a simple lowest or highest eigenvalue.

### Dependencies

4.1 uses Tau Ceti's Dyson series; 4.2 uses the functional calculus of Hermitian matrices, contour
integrals, and Tau Ceti's spectral projections, resolvents, eigenvalue continuity and Sylvester
bounds; 4.3 uses the Dyson series; 4.4 uses 4.1, 4.2 and 4.3.

## Layer 5: the quantum approximate optimization algorithm

### 5.1 Alternating states and their expectations

For a cost `C : (ι → Bool) → ℝ` define `qaoaLayer C (γ, β) = exp(−iβ · mixer) · exp(−iγ · diagHam C)`,
the state `qaoaState C θ` obtained from `plusState ι` by applying the layers of the list `θ`,
head first, and `qaoaMean C D θ = Σ_x D x · |qaoaState C θ x|²`, the expectation of the
observable `diagHam D`. Prove:

- every layer is unitary and `qaoaState C θ` is a unit vector;
- `qaoaMean_le_sup'`: `qaoaMean C C θ ≤ max C`, and likewise `min C ≤ qaoaMean C C θ`;
- `exists_qaoaMean_eq_of_le`: for `θ` of length `p` and `q ≥ p` there is `θ'` of length `q` with
  the same expectation of `C` (append pairs `(0, 0)`), so the supremum over the angles of depth
  `p` is nondecreasing in `p`;
- `qaoaMean C D θ` is `π`-periodic in each `β`, because `exp(−iπ · mixer) = (−1)^n`.

(Farhi, Goldstone and Gutmann 2014, equations (6)–(9), arXiv version 1.)

**Checks.**

- Depth `0`: `qaoaMean C D [] ` is the average of `D` over all configurations; for the cut size
  of a graph it is half the number of edges.
- One qubit, `C = (0, 1)`: `qaoaMean C C [(γ, β)] = (1 + sin 2β sin γ)/2`, with maximum `1` at
  `(π/2, π/4)`. With the two factors of the layer in the other order the value is `1/2` for all
  angles.
- No qubits: every expectation is the value of `D`.

*Needs:* 3.1, 3.2; Mathlib `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`.

### 5.2 The product formula

Prove `norm_exp_add_sub_exp_mul_exp_le`: for Hermitian matrices `A`, `B` and real `t`,
`‖exp(−it(A + B)) − exp(−itA) exp(−itB)‖ ≤ (t²/2) ‖AB − BA‖`. The function
`S(t) = exp(−itA) exp(−itB)` satisfies `S' = −i(A + B) S + R` with
`R(t) = exp(−itA) (exp(itA) iB exp(−itA) − iB) exp(−itB)`; the bracket is an integral of a
conjugate of `[A, B]` over `[0, t]`, and the variation of constants formula with unitary factors
gives the bound. (Childs, Su, Tran, Wiebe and Zhu 2021,
Section 5.1, equation (143) and Proposition 15, arXiv version 3, for `t ≥ 0`.)

**Checks.**

- Commuting `A`, `B`: both sides are `0`.
- `A = X`, `B = Z` on one qubit and small `t`: the left side is `t² + O(t³)` and the right side
  is `t²`, since `‖XZ − ZX‖ = 2`; the constant `1/2` cannot be lowered.

*Needs:* Mathlib `hasDerivAt_exp_smul_const'`,
`NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`, `intervalIntegral.norm_integral_le_integral_norm`.

### 5.3 Convergence to the maximum

Prove `exists_lt_qaoaMean`: for every cost `C` and `ε > 0` there is a list of angles `θ` with
`qaoaMean C C θ > max C − ε`. With 5.1, the supremum over the angles of depth `p` increases to
`max C` as `p → ∞`.

Fix `s₁ < 1` with `n (1 − s₁)/s₁ < ε/3`. On `[0, s₁]` the family
`H(r) = −((1 − r) · mixer + r · diagHam C)` has a simple lowest eigenvalue by 3.3; for `n ≥ 1`
(for `n = 0` every expectation is the value of `C`) the midpoint of the two lowest eigenvalues
and a curve below the lowest are continuous band edges, and the gap is bounded below on the
compact interval. The vector `plusState ι` spans the band at `r = 0`
(3.2). By 4.4, for large `T` the evolved vector `U(s₁) plusState` is as close as desired, up to a
phase, to the unit eigenvector of 3.3 at `s₁`, whose expected cost is at least `max C − ε/3` by
the third item of 3.3. Cutting `[0, s₁]` into `N` steps, 4.1
compares the propagator on each step with the exponential of the frozen Hamiltonian, 5.2 splits
that exponential into a mixer factor and a cost factor, and the product of the `N` pairs is an
alternating state; the total error in norm is `O(T²/N)`, and expectations of `C` are Lipschitz
in the state. (Farhi, Goldstone and Gutmann 2014, Section VI and equation (10), arXiv version 1,
where the argument is sketched with the evolution run up to `s = 1`; the simple top eigenvalue is
available only for `s < 1`, and the proof here stops at `s₁`.)

**Checks.**

- One qubit, `C = (0, 1)`: depth `1` already attains `max C = 1` (5.1).
- A constant cost: every expectation equals the constant.
- Two qubits and the cut size of the single edge, where the maximum is attained at two
  configurations: the top eigenvalue of `diagHam C` is not simple, and the statement still
  holds, by the estimate at `s₁ < 1`.

*Needs:* 3.2, 3.3, 4.1, 4.2, 4.4, 5.1, 5.2; Tau Ceti `Matrix.continuous_eigenvalues₀`.

### 5.4 Locality for cuts

For a simple graph `G` define `cutSize G x = cutWeight (G.adjMatrix ℝ) x`, the number of edges
across `x`, and `edgeTerm u v x`, which is `1` when `x u ≠ x v` and `0` otherwise; `cutSize G`
is the sum of `edgeTerm u v` over the edges. Prove `qaoaMean_cutSize_edgeTerm_congr`: if `G` and
`G'` are graphs on `ι`, `θ` has length `p`, and every pair `a, b` with `a` at distance less than
`p` from `u` or from `v` in `G` is adjacent in `G` exactly when it is adjacent in `G'`, then the
expectations of `edgeTerm u v` in the states of `cutSize G` and of `cutSize G'` at `θ` are equal.
Distances are Mathlib's extended distances, infinite between different components.

Conjugating `Z_u Z_v` by the mixing unitary gives an operator on the qubits `u, v`; conjugating
an operator on a set `L` of qubits by `exp(−iγ H)` involves only the edge terms of `H` that meet
`L`, and enlarges `L` to its neighbourhood; after `p` layers the operator depends only on edges
with an end at distance less than `p` from `{u, v}`. (Farhi, Goldstone and Gutmann 2014,
Section II, equations (13)–(17), arXiv version 1.)

**Checks.**

- Depth `0`: there is no condition, and the expectation is `1/2` for `u ≠ v` in every graph.
- Depth `1`, the path `a – u – v` and a fourth vertex `w`: adding the edge `a w` (both ends at
  distance at least `1`) does not change the expectation of the term of `u v`, and adding the edge
  `u w` changes it (from `0.7841…` to `0.7551…` at `γ = 0.7`, `β = 0.4`).
- `u = v`: the term is `0`.

*Needs:* 1.3, 3.1, 3.2, 5.1; Mathlib `SimpleGraph.edist`, `SimpleGraph.adjMatrix`,
`Matrix.exp_sum_of_commute`.

### 5.5 Depth one: the closed form

Prove `qaoaMean_cutSize_edgeTerm_singleton`: for adjacent `u, v` in `G`, with `d = deg u − 1`,
`e = deg v − 1` and `f` the number of common neighbours of `u` and `v`,

    qaoaMean (cutSize G) (edgeTerm u v) [(γ, β)]
      = 1/2 + (1/4) sin 4β sin γ (cos^d γ + cos^e γ) − (1/4) sin² 2β cos^(d+e−2f) γ (1 − cos^f 2γ).

For a triangle-free `(k + 1)`-regular graph with `m` edges the depth-one expectation of the cut
size is therefore `(m/2)(1 + sin 4β sin γ cos^k γ)`. Prove
`isGreatest_qaoaMean_cutSize_singleton`: its greatest value over all angles is
`(m/2)(1 + √(k^k/(k + 1)^(k+1)))`. For `k ≥ 1` it is attained at `γ = arctan(1/√k)`, `β = π/8`.
(Wang, Hadfield, Jiang and Rieffel 2018, Theorem 1 and Corollary 1, equations (14)–(16), arXiv
version 2.)

**Checks.**

- The single edge (`d = e = f = 0`): `1/2 + (1/2) sin 4β sin γ`, equal to `1` at `(π/2, π/8)`;
  with the opposite sign of `γ` the value there would be `0`.
- An edge of the triangle (`d = e = f = 1`):
  `1/2 + (1/2) sin 4β sin γ cos γ − (1/4) sin² 2β (1 − cos 2γ)`.
- `k = 1`, a cycle of length at least `4`: the greatest value is `3m/4`. `k = 0`, a perfect
  matching: the greatest value is `m`, with `0^0 = 1`, attained at `γ = π/2`.
- The exponent `d + e − 2f` is a natural number because the common neighbours are among the
  other neighbours of each end.

*Needs:* 3.2, 5.1, 5.4.

### 5.6 Depth one on 3-regular graphs

Prove `mul_cutSize_le_qaoaMean_of_isRegularOfDegree_three`: for every `3`-regular graph `G` on a
finite vertex type and every configuration `x`,

    (1/2 + 1/(3√3)) · cutSize G x ≤ qaoaMean (cutSize G) (cutSize G) [(arctan(1/√2), π/8)].

With `c = 1/2 + 1/(3√3) = 0.69245…`, at these angles 5.5 gives the edge values `c`, `c − 1/18`
and `c − 1/9` for an edge in `0`, `1` or `2` triangles. In a `3`-regular graph two triangles that
share a vertex share an edge, so the triangles group into isolated triangles (three edges in one
triangle each), pairs sharing an edge (four edges in one triangle and one in two) and copies of
the complete graph on four vertices (six edges in two triangles); every cut leaves uncut at
least `1`, `1` and `2` edges of these groups, whose total deficits `1/6`, `1/3` and `2/3` are at
most `c`, `c` and `2c`. For a triangle-free `3`-regular bipartite graph both sides are `c · m` at
a maximum cut, and by 5.5 no depth-one angles do better. (Farhi, Goldstone and Gutmann 2014,
Section V, equations (32)–(35), arXiv version 1, obtain the ratio `0.6924` for connected
`3`-regular graphs other than the complete graph on four vertices by numerical minimization over
the densities of isolated triangles and crossed squares; the statement with explicit angles and
constant is proved here.)

**Checks.**

- The complete graph on four vertices: the right side is `6 (c − 1/9) = 3.488…` and the maximum
  cut is `4`, with `4c = 2.769…`.
- The complete bipartite graph on `3 + 3` vertices and the cube: the right side is `9c` and
  `12c`, and the maximum cuts are `9` and `12`: equality.
- The empty vertex type: both sides are `0`.

*Needs:* 5.5.

### Examples

The single edge, the triangle and the complete graph on four vertices at depth one; the cube as
an extremal `3`-regular graph.

### Dependencies

5.1 uses 3.1 and 3.2; 5.2 uses the matrix exponential in Mathlib; 5.3 uses 3.2, 3.3, 4.1, 4.2,
4.4, 5.1 and 5.2; 5.4 uses 1.3, 3.1, 3.2 and 5.1; 5.5 uses 3.2, 5.1 and 5.4; 5.6 uses 5.5.

## Downstream consumers

No roadmap on main consumes these targets.

## Scope and ownership

This roadmap owns the targets of Layers 1–5 above: the bit and spin forms of quadratic functions
on finite configuration spaces and their reductions; the constant, the hyperplane probability and
the rounding inequality of Goemans and Williamson; diagonal Hamiltonians on qubits, the Pauli
operators `X` and `Z` as matrices on configurations, and the mixer; the Schrödinger propagator of
a matrix family as an instance of Tau Ceti's Dyson series, band projections with their derivative
estimates, the intertwining evolution and the adiabatic bound; the alternating states, the product
formula for two Hermitian matrices, and the depth-one and large-depth theorems.

It consumes, and does not prove again, the items of the supplier contracts below. In particular
the existence, uniqueness and unitarity of propagators, the Perron–Frobenius theorem, the
interval/exterior Sylvester bound and the star-projection property of spectral indicators are
already in the library.

Boundaries with roadmaps on main:

- GraphConnectivityAndFlows owns cuts of capacitated networks, minimum cuts and max-flow/min-cut
  (its 1.2, 3 and 4). Its pair-capacity cut function is for nonnegative capacities on unordered
  pairs; `cutWeight` above is its extension to signed real weights on ordered pairs, which the
  equivalence with quadratic functions needs, and agrees with it for symmetric nonnegative `w`.
- OperatorTheory/SpectralSubspacePerturbation owns Sylvester equations and the Davis–Kahan
  theorems (its Part B and Part C). Layer 4 uses the pinned interval/exterior Sylvester bound and
  states only its consequences for a differentiable family.
- OperatorTheory/UnboundedOperators 5.5 owns analytic perturbation theory and Rellich branches for
  analytic families. Layer 4 concerns finitely differentiable families of Hermitian matrices and
  bands of several eigenvalues, with no analyticity.
- VariationalMethods 4.4 owns the Courant–Fischer theorem; 3.3 uses only Rayleigh quotients of a
  real symmetric matrix at explicit vectors.
- OperatorAlgebraDynamics D9 owns quasi-local algebras of infinite spin systems; this roadmap has
  finitely many qubits.
- TemperleyLiebOperatorAlgebras 1.7 uses Pauli matrices in Clifford-algebra models; the operators
  of 3.1 are indexed by configurations and are not taken from there.

- BanachAlgebras 2.1 owns Riesz projections of a separated part of the spectrum in a Banach
  algebra. The first bullet of 4.2 only compares the band projection of a Hermitian matrix with
  that integral; it is not a second construction.

No roadmap on main treats splitting or composition schemes as integrators of differential
equations; the two-matrix bound 5.2 is owned here. Tau Ceti's Trotter product formula for Lie groups
(`TauCeti/Geometry/Lie/Exponential/Trotter.lean`) is a limit statement without a rate; 5.2 is the
quantitative bound for two Hermitian matrices and does not follow from it.

Out of scope: complexity classes and hardness (the reductions of Layer 1 are identities of
values); quantum circuits, gate sets and depth; Grover search and amplitude amplification;
annealing hardware and graph embeddings; simulated annealing; adiabatic theorems on
infinite-dimensional spaces and for unbounded operators; exponentially small adiabatic errors;
variational eigensolvers; the solution of the semidefinite relaxation and its duality theory;
other problems of Lucas's list; QAOA at depth two and beyond on particular graphs, including the
ring of disagrees.

Existing formalizations, which are reference material and not the specification. In Lean 4:
QuantumOptimization by U. Kol, M. Ben-Shahar, K. Sulimany and D. Englund (Apache-2.0,
<https://github.com/urikol/QuantumOptimization>), an independent library that happens to share
this folder's name, proves that depth-`p` QAOA on the ring of
disagrees has optimal ratio `(2p + 1)/(2p + 2)`; axiom-physics by N. Y. Li (Apache-2.0,
<https://github.com/N-Y-L/axiom-physics>) contains a uniformly gapped quantum adiabatic theorem,
including unbounded Hamiltonians on a common domain; Lean-QuantumInfo (MIT,
<https://github.com/Timeroot/Lean-QuantumInfo>) has the one-qubit Pauli unitaries and their
relations; finite-mkcs-penalties (Apache-2.0, <https://github.com/bernalde/finite-mkcs-penalties>)
proves penalty thresholds for a quadratic formulation of the maximum `k`-colourable subgraph
problem. The repository lean4-mlir (BSD-3, <https://github.com/brettkoonce/lean4-mlir>) has a
numerical neural-quantum-state demonstration for the transverse-field Ising chain, which relies
on the positivity proved in 3.3, and no proofs of this material. The roadmap develops the
mathematics independently of all of them.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.adjMatrix` (`Combinatorics/SimpleGraph/AdjMatrix.lean`),
  `SimpleGraph.IsMaximumIndepSet` (`Combinatorics/SimpleGraph/Clique.lean`: an independent finset
  such that no independent finset has more elements), `SimpleGraph.edist`
  (`Combinatorics/SimpleGraph/Metric.lean`, with value `⊤` between different components),
  `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.CliqueFree`; `Matrix.IsSymm`.
- `Function.HasMaxCutPropertyAt` (`Combinatorics/Optimization/ValuedCSP.lean`):
  `f ![a, b] = f ![b, a]` and this value is the minimum of `f`, attained only at `![a, b]` and
  `![b, a]`. It is used in a Check of 1.3 only.
- `Real.arccos`, `Real.pi_gt_d6`, `Real.pi_lt_d6` (`Analysis/Real/Pi/Bounds.lean`).
- `ProbabilityTheory.stdGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean`), the
  standard Gaussian measure of a finite-dimensional real inner product space with a Borel
  σ-algebra.
- `Matrix.diagonal`, `spectrum_diagonal` (`LinearAlgebra/Eigenspace/Matrix.lean`: over a
  field, the spectrum of a diagonal matrix is the range of its diagonal), `Matrix.exp_diagonal`
  and `Matrix.exp_sum_of_commute` (`Analysis/Normed/Algebra/MatrixExponential.lean`),
  `NormedSpace.exp`, `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`
  (`Analysis/Normed/Algebra/Exponential.lean`), `hasDerivAt_exp_smul_const'`
  (`Analysis/SpecialFunctions/Exponential.lean`).
- `Matrix.Norms.L2Operator` (`Analysis/CStarAlgebra/Matrix.lean`), the scoped Euclidean operator
  norm making `Matrix n n ℂ` a normed algebra and a C⋆-algebra.
- `Matrix.IsHermitian.eigenvalues₀`, the eigenvalues in decreasing order, and
  `Matrix.IsHermitian.spectral_theorem` (`Analysis/Matrix/Spectrum.lean`); `Matrix.IsIrreducible`
  (`LinearAlgebra/Matrix/Irreducible/Defs.lean`): nonnegative entries and, for every ordered pair
  of indices, a path of positive length through positive entries.
- `cfc` for Hermitian matrices (`Analysis/Matrix/HermitianFunctionalCalculus.lean`);
  `circleIntegral` and `circleIntegral.integral_sub_inv_of_mem_ball`
  (`MeasureTheory/Integral/CircleIntegral.lean`); `contDiffAt_ringInverse`
  (`Analysis/Calculus/ContDiff/Operations.lean`).
- `intervalIntegral.norm_integral_le_integral_norm`
  (`MeasureTheory/Integral/IntervalIntegral/Basic.lean`, for `a ≤ b`) and
  `intervalIntegral.integral_mul_deriv_eq_deriv_mul`
  (`MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean`), integration by parts for
  products in a complete normed algebra.

### From Tau Ceti

- `TauCeti/Analysis/ODE/DysonSeries.lean`, for a complete normed real algebra `B` and a continuous
  `p : ℝ → B`: `TauCeti.dysonSeriesLeft p`, with `TauCeti.dysonSeriesLeft_zero` (value `1` at
  `0`), `TauCeti.hasDerivAt_dysonSeriesLeft` (derivative `p t * Γ t` at every `t`),
  `TauCeti.eq_dysonSeriesLeft_mul` (every `f` with `f' t = p t * f t` for all `t` is `Γ t * f 0`),
  `TauCeti.op_dysonSeriesLeft` (the left series is the series of the opposite algebra), and
  `TauCeti.dysonSeries_mem_unitary` (in a star algebra with continuous star, if
  `star (p t) = −p t` for all `t` the series is unitary).
- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`, for an irreducible real matrix
  `A`: `Matrix.IsIrreducible.exists_mulVec_eq_smul` (on a nonempty index type there are `r > 0`
  and `v` with positive entries and `A v = r v`),
  `Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg` (a nonzero nonnegative eigenvector has
  the eigenvalue of a positive one), `Matrix.IsIrreducible.exists_eq_smul_of_mulVec_eq_smul` (every
  eigenvector for the eigenvalue of a positive eigenvector `v` is a multiple of `v`).
- `TauCeti.isStarProjection_cfc_indicator`
  (`TauCeti/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Projection.lean`) and
  `Matrix.IsHermitian.toEuclideanLin_cfc_indicator` (`TauCeti/Analysis/Matrix/FunctionalCalculus.lean`):
  for Hermitian `A` and `Ω ⊆ ℝ`, `cfc (Ω.indicator 1) A` is a star projection, the orthogonal
  projection onto the sum of the eigenspaces with eigenvalues in `Ω`.
- `Matrix.IsHermitian.inv_sub_smul_one_eq_conjStarAlgAut_diagonal`
  (`TauCeti/Analysis/Matrix/Resolvent/Basic.lean`): off the spectrum, `(A − z)⁻¹` is the conjugate
  by the eigenvector unitary of the diagonal matrix of the `(λ_j − z)⁻¹`.
- `Matrix.continuous_eigenvalues₀` (`TauCeti/Analysis/Matrix/Eigenvalues/Continuous.lean`): the
  decreasing eigenvalue list is continuous on the Hermitian matrices.
- `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_of_mem`
  and its companion with the suffix `_swap_of_mem`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Basic.lean`): for
  symmetric operators `A`, `B` on finite-dimensional inner product spaces with invariant subspaces
  `S`, `T`, such that the eigenvalues of one of them on its subspace lie in `[a, b]` and those of
  the other on its subspace lie outside `(a − δ, b + δ)`, and `X` with values in `S` vanishing on
  the orthogonal complement of `T`, `δ N(X) ≤ N(A X − X B)` for every unitarily invariant
  seminorm `N`; with `TauCeti.UnitarilyInvariantSeminorm.opNorm`, the operator norm as such a
  seminorm (`…/UnitarilyInvariantSeminorm/OpNorm.lean`).
- `Submodule.map_orthogonalProjectionOnto_stdGaussian`
  (`TauCeti/Probability/Distributions/Gaussian/Projection.lean`): the orthogonal projection onto
  a subspace maps the standard Gaussian measure to that of the subspace; and
  `TauCeti.Probability.stdGaussian_map_sphereDirection`
  (`TauCeti/Probability/Distributions/Uniform/Sphere/Basic.lean`): the direction of a standard
  Gaussian vector has the uniform law on the unit sphere; and
  `TauCeti.Probability.map_circleSphereHomeomorph_haarAddCircle`
  (`TauCeti/Probability/Distributions/Uniform/Sphere/Circle.lean`): in the Euclidean plane that
  law is the image of the normalized Haar measure of the circle `ℝ/2πℤ` under
  `t ↦ (cos t, sin t)`, so an arc of angle `θ` has probability `θ/(2π)`; the uniform law is
  carried to itself by linear isometric equivalences (`Basic.lean` in the same directory).
- `Matrix.posSemidef_iff_eq_conjTranspose_mul_self` (`TauCeti/Analysis/Matrix/GramFactorization.lean`):
  a square matrix is positive semidefinite exactly when it is `Aᴴ A` for a square `A`.

## References

- A. M. Childs, Y. Su, M. C. Tran, N. Wiebe and S. Zhu, *Theory of Trotter error with commutator
  scaling*, Phys. Rev. X **11** (2021), 011020, arXiv:1912.08854.
- E. Farhi, J. Goldstone and S. Gutmann, *A quantum approximate optimization algorithm*,
  arXiv:1411.4028, 2014.
- M. X. Goemans and D. P. Williamson, *Improved approximation algorithms for maximum cut and
  satisfiability problems using semidefinite programming*, J. ACM **42** (1995), 1115–1145.
- S. Jansen, M.-B. Ruskai and R. Seiler, *Bounds for the adiabatic approximation with applications
  to quantum computation*, J. Math. Phys. **48** (2007), 102111, arXiv:quant-ph/0603175.
- T. Kato, *On the adiabatic theorem of quantum mechanics*, J. Phys. Soc. Japan **5** (1950),
  435–439.
- A. Lucas, *Ising formulations of many NP problems*, Front. Phys. **2** (2014), 5,
  arXiv:1302.5843.
- I. G. Rosenberg, *Reduction of bivalent maximization to the quadratic case*, Cahiers Centre
  Études Rech. Opér. **17** (1975), 71–74.
- Z. Wang, S. Hadfield, Z. Jiang and E. G. Rieffel, *Quantum approximate optimization algorithm
  for MaxCut: a fermionic view*, Phys. Rev. A **97** (2018), 022304, arXiv:1706.02998.
- D. P. Williamson and D. B. Shmoys, *The design of approximation algorithms*, Cambridge
  University Press, 2011; electronic web edition, <https://www.designofapproxalgs.com>.
