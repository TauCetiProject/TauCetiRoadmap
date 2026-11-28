# Roadmap: second-kind integral equations

**Summary.** An integral equation of the second kind asks for a function φ with
φ − Aφ = f, where A is an integral operator. When A is compact, as it is for continuous,
weakly singular and square-integrable kernels, the Riesz theory makes the equation behave like a
finite linear system: uniqueness implies existence, the solution depends continuously on the data,
and in a dual system the solvability condition is orthogonality to the solutions of the adjoint
homogeneous equation (the Fredholm alternative). This roadmap builds that theory for integral
operators and then the numerical methods that rest on it. Projection methods (collocation,
Galerkin) converge when the projected operators approach the operator in norm. The Nyström method
replaces the integral by a quadrature rule; its operators never converge in norm, and its analysis
goes through collectively compact families, for which pointwise convergence suffices. Volterra
equations, smooth or weakly singular, are uniquely solvable through the resolvent kernel, and
their piecewise polynomial collocation solutions converge with order m, superconverge at the mesh
points when the collocation parameters satisfy orthogonality conditions, and recover the full
order on graded meshes despite the singularity of the solution at the origin.

The roadmap is a synthesis of several sources: Kress's monograph for the Riesz–Fredholm theory,
collective compactness and the Nyström method; Atkinson's monograph and the Atkinson–Han text for
projection methods and the perturbation lemma; Brunner's monograph for Volterra equations and
collocation. It consumes the compact-perturbation theory of Tau Ceti (I − K is Fredholm of index
zero, and the Neumann bound for perturbed inverses) and the convergence criterion for quadrature
rules of the QuadratureRulesAndPeanoKernels roadmap (§4.1, which identifies the convergent rules
on an interval that drive the Nyström method). Square-integrable kernels on L² are not treated
here: the Hilbert–Schmidt kernel operators of
[AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md) §0.8 and the compactness of
Hilbert–Schmidt operators in
[OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) supply them. The
roadmap also differs from the [CompactOperators](../CompactOperators/README.md) roadmap, which is
nonarchimedean, and from the elliptic Fredholm alternative of [PDE](../PDE/README.md) §4.3.
Downstream, the theory of boundary integral equations and boundary elements consumes the
compactness, Fredholm and approximation layers.

## How to read the build

Layer 1 is the spectrum of a compact operator and the compactness of integral operators with
continuous and weakly singular kernels. Layer 2 states the Fredholm alternative in a dual system
and specializes it to continuous kernels. Layer 3 is the abstract approximation theory:
collectively compact families, their uniformity lemma, and the perturbation theorem for I − Aₙ.
Layers 4 and 5 apply it: Layer 4 to projection methods, Layer 5 to the Nyström method. Layers 6
and 7 are Volterra equations, first their solvability and then their collocation solutions; they
need neither the dual systems nor the approximation theory of Layers 2–5.

Each subsection states its headlines in bold with their Lean names. A headline that restates a
source result carries the locator (theorem or equation number, printed page); a corollary or
adaptation carries a proof route. `Suggested.lean` states the headlines that carry a Lean name,
each with every conclusion attached to it here, and proves the two of them that close in one or
two library steps; it is not an exhaustive acceptance test, and the other headlines are targets of
the same standing, stated in prose. Each subsection ends with a *Needs:* line naming what it uses.

## Conventions

- Scalars are `RCLike 𝕜`. Operators are continuous linear maps with the operator norm. The
  inverse of an operator is `Ring.inverse`, whose value at a non-unit is `0`; every statement that
  uses an inverse also states the invertibility (`IsUnit`), and Banach-space completeness is
  stated wherever a Neumann series or Banach–Steinhaus is used.
- The second-kind equation is φ − Aφ = f (Kress's form) in Layers 2, 3, 5 and §4.3, and
  (λ − K)x = y (Atkinson's form) in §4.2; for λ ≠ 0 the two agree after division by λ.
- Function spaces on a compact metric space G are `C(G, 𝕜)` with the sup norm. An operator A is an
  integral operator with kernel k against a measure μ when `IsKernelOperator μ k A` holds: the
  identity (Aφ)(x) = ∫ k(x, y) φ(y) dμ(y) for every continuous φ and every x. The measure is any
  finite Borel measure: Lebesgue measure on a compact subset of ℝᵐ, surface measure, a quadrature
  rule, or a Dirac mass all fit.
- A dual system is a nondegenerate bilinear pairing `P : X →ₗ[𝕜] Y →ₗ[𝕜] 𝕜`
  (`LinearMap.Nondegenerate`), and operators A on X and B on Y are adjoint when
  P(Ax, y) = P(x, By) for all x and y. In the integral case the pairing is ∫ φψ dμ and B has the
  transposed kernel (x, y) ↦ k(y, x); no complex conjugation enters.
- A quadrature rule on G has nodes `x : Fin N → G` and weights `w : Fin N → 𝕜`. On an interval
  with real weights this is the rule of the QuadratureRulesAndPeanoKernels roadmap. Nyström
  statements do not need distinct nodes: the Nyström operator depends only on the sum of the
  weights at each node.
- Volterra equations are real, on [0, T], with kernels continuous on the closed triangle
  `volterraTriangle T` = {0 ≤ s ≤ t ≤ T}. The weakly singular factor (t − s)^(−α), 0 < α < 1, is
  the real power; its value at s = t is a single point and does not affect any integral. Smoothness
  is `ContDiffOn` on the set where it is used (the triangle, or [0, T]).
- Collocation parameters are `c : Fin m → ℝ`, strictly increasing in [0, 1]; on the cell
  [tᵢ, tᵢ₊₁] the collocation points are tᵢ + cⱼ(tᵢ₊₁ − tᵢ). A mesh of width h is a strictly
  increasing `t : Fin (N + 1) → ℝ` from 0 to T with every step at most h (`IsVolterraMesh`).

## Layer 1: compact operators and compact integral operators

### 1.1 The spectrum of a compact operator

Tau Ceti proves that I − K is Fredholm of index zero for compact K on a Banach space, with
finite-dimensional nullspace and cokernel (the first and second Riesz theorems, Kress Theorems 3.1
and 3.2, p. 34), the stabilisation of the chains N((I − K)ⁿ) and (I − K)ⁿX (the third Riesz
theorem, Kress Theorem 3.3, p. 35), and, in its module on the spectrum of compact operators, that
on a Banach space only finitely many spectral values have modulus at least ε > 0 and the spectrum
is countable (Kress Theorem 3.9, p. 40). Mathlib proves that a nonzero scalar is either an
eigenvalue of a compact operator or in its resolvent set, on any normed space, so that
injectivity of μ − K implies a bounded inverse (Kress Theorem 3.4, p. 38). This subsection adds
the two facts about the point 0.

- **No bounded inverse** (`not_exists_norm_le_mul_norm_of_isCompactOperator`). A compact operator
  from an infinite-dimensional normed space is not bounded below: there is no C with
  ‖x‖ ≤ C‖Ax‖ for all x (Kress Theorem 2.26, p. 28). Route: a lower bound makes A antilipschitz,
  so the unit ball is totally bounded, and a normed space with a totally bounded neighbourhood of
  0 is finite dimensional (`FiniteDimensional.of_totallyBounded_nhds_zero`).
- **Zero is a spectral value** (`IsCompactOperator.zero_mem_spectrum`, proved in `Suggested.lean`)
  of a compact operator on an infinite-dimensional normed space (Kress Theorem 3.9, p. 40). Route:
  if A were a unit, the identity A⁻¹A would be compact, and
  `isCompactOperator_id_iff_finiteDimensional` gives finite dimension.

**Checks.**
- On ℓ²(ℕ) the diagonal operator with entries 1/(n + 1) is compact and injective; its spectrum is
  {1/(n + 1)} ∪ {0}, and 0 is a spectral value that is not an eigenvalue.
- The hypothesis of infinite dimension is needed in both headlines: on 𝕜² the identity is
  compact, is bounded below with C = 1, and has spectrum {1}.

*Needs:* Mathlib `isCompactOperator_id_iff_finiteDimensional`,
`FiniteDimensional.of_totallyBounded_nhds_zero`.

### 1.2 Continuous kernels

**Integral operator** (`IsKernelOperator`): the predicate of the Conventions. It fixes A by its
values, so two operators with the same kernel agree.

- **Continuous kernels** (`exists_isKernelOperator_of_continuous`). For a finite measure μ on a
  compact metric space G and a continuous kernel k on G × G there is an integral operator A on
  `C(G, 𝕜)` with kernel k, and ‖A‖ = sup over x of ∫ |k(x, y)| dμ(y) (Kress Theorem 2.13, p. 22,
  for Lebesgue measure on a compact Jordan measurable set equal to the closure of its interior).
  Route for a general finite measure: the bound ≤ is immediate; for ≥, fix x₀ where the supremum
  is attained, and approximate the bounded function y ↦ conj(k(x₀, y))/|k(x₀, y)| in L¹(μ) by
  continuous functions of sup norm at most 1 (Lusin, every finite Borel measure on a compact
  metric space being regular). On an empty G both sides are 0.
- **Compactness** (`isCompactOperator_of_continuousKernel`). Such an operator is compact (Kress
  Theorem 2.27, p. 28). Route: the image of the unit ball is bounded by the supremum above and
  equicontinuous by the uniform continuity of k; apply `BoundedContinuousFunction.arzela_ascoli`.

**Checks.**
- For Lebesgue measure on [0, 1] and k ≡ 1, A maps φ to the constant ∫φ, and ‖A‖ = 1.
- For the Dirac measure at a point p, Aφ = φ(p) k(·, p) has rank one and
  ‖A‖ = sup over x of |k(x, p)|, the value of the formula.

*Needs:* Mathlib `BoundedContinuousFunction.arzela_ascoli` and the regularity of finite Borel
measures on metric spaces.

### 1.3 Weakly singular kernels

- **Compactness for weakly singular kernels** (`exists_isCompactOperator_of_weaklySingular`). Let G
  be a compact subset of ℝᵐ with Lebesgue measure, and k continuous on G × G off the diagonal with
  |k(x, y)| ≤ M|x − y|^(α − m) for x ≠ y, where α > 0. Then every section y ↦ k(x, y)φ(y) is
  integrable, and there is a compact integral operator on `C(G, 𝕜)` with kernel k (Kress Theorem
  2.29, p. 29). Kress takes G Jordan measurable and α ≤ m; the proof (cut off the kernel near the
  diagonal, apply §1.2 to the cut-off kernels, and bound the remainder uniformly by the integral
  of M|x − y|^(α − m) over a small ball) works for every compact G, and for α > m the kernel is
  bounded and the same proof applies.

**Checks.**
- On [0, 1] (m = 1) the kernel |x − y|^(−1/2) is weakly singular with α = 1/2. Applied to the
  constant 1 it gives 2(√x + √(1 − x)), which is continuous with maximum 2√2 ≈ 2.8284 at x = 1/2.
- The bound α > 0 is needed: on [0, 1] the kernel |x − y|^(−1), the case α = 0, has no integrable
  section at any x.

*Needs:* §1.2.

## Layer 2: the Fredholm alternative in dual systems

### 2.1 Dual systems

The setting is a dual system of Banach spaces X and Y with compact operators A on X and B on Y,
adjoint for the pairing (Kress Definitions 4.1 and 4.2, p. 45, and 4.5, p. 46).

- **First Fredholm theorem** (`finrank_ker_one_sub_eq`). The nullspaces of I − A and I − B are
  finite dimensional of the same dimension (Kress Theorem 4.15, p. 53).
- **Second Fredholm theorem** (`exists_fredholm_solution_iff_pairing`). φ − Aφ = f is solvable if
  and only if P(f, ψ) = 0 for every solution of ψ = Bψ, and symmetrically ψ − Bψ = g is solvable if
  and only if P(φ, g) = 0 for every solution of φ = Aφ (Kress Theorem 4.16, p. 54).
- **The Fredholm alternative** (`tfae_injective_surjective_one_sub`). Injectivity of I − A,
  surjectivity of I − A, injectivity of I − B and surjectivity of I − B are equivalent (Kress
  Theorem 4.17, p. 55; Atkinson Theorem 1.3.1, p. 13, and Atkinson–Han Theorem 2.8.10, p. 101, for
  a single operator).

Route: Kress's proofs. The range of I − A is closed of finite codimension and I − A has index zero
(`TauCeti.isFredholm_one_sub`, `ContinuousLinearMap.index_one_sub_eq_zero`). Choose bases of the
two nullspaces biorthogonal for the pairing, which exists by nondegeneracy; if the dimensions
differed, adding the finite-rank operator built from these bases to A would give a compact
operator for which I − A′ is injective but not surjective, contradicting index zero. The range
characterization follows by the same finite-rank modification. The pairing need not be
continuous. Kress states these theorems for normed spaces; Beyond records that generality.

**Checks.**
- On 𝕜ⁿ with the dot-product pairing, B is the transpose of A, and the first theorem is the
  equality of the ranks of I − A and its transpose.
- Nondegeneracy is needed: with the zero pairing every operator is adjoint to every other, and A = 0
  on 𝕜 and B = 1 on 𝕜 have nullspaces of dimensions 0 and 1.

*Needs:* Tau Ceti `TauCeti.isFredholm_one_sub`, `ContinuousLinearMap.index_one_sub_eq_zero`;
Mathlib `LinearMap.Nondegenerate`.

### 2.2 Continuous kernels

- **Fredholm's alternative for continuous kernels** (`fredholm_alternative_continuousKernel`). For
  a finite measure μ on a compact metric space G and a continuous kernel k, let A have kernel k and
  B the transposed kernel. Then I − A is bijective if and only if I − B is, their nullspaces are
  finite dimensional of the same dimension, and φ − Aφ = f is solvable if and only if
  ∫ fψ dμ = 0 for every solution of ψ = Bψ (Kress Corollary 4.18, p. 55, for Lebesgue measure on a
  set as in §1.2). No support condition on μ is needed. Route: the pairing ∫ φψ dμ is degenerate
  when μ does not charge every open set, so reduce to the support S of μ, a compact set with
  μ(G \ S) = 0. Let A′ and B′ be the integral operators on `C(S, 𝕜)` of the restricted kernel
  and measure. Restriction to S is a bijection from the nullspace of I − A onto that of I − A′,
  with inverse ψ ↦ (x ↦ the integral over S of k(x, y)ψ(y) dμ(y)), and likewise for B. If φ′
  solves the restricted equation with right-hand side the restriction of f, then
  φ(x) = f(x) + the integral over S of k(x, y)φ′(y) dμ(y) solves φ − Aφ = f on G and restricts
  to φ′. On `C(S, 𝕜)` the pairing is nondegenerate, so §2.1 applies there, with §1.2 for
  compactness, and the three conclusions transfer back.

**Checks.**
- On [0, 1] with μ the Dirac mass at 0 and k ≡ 1, A = B maps φ to the constant φ(0). Both
  nullspaces are the constants, and φ − φ(0) = f is solvable exactly when f(0) = 0, which is the
  condition ∫ fψ dμ = f(0)ψ(0) = 0 for constant ψ.
- With the same μ and k(x, y) = x, Aφ = φ(0)x and B = 0. Both nullspaces are zero, and
  φ = f + f(0)x solves the equation for every f.

*Needs:* §§1.2, 2.1.

## Layer 3: collectively compact operator approximation

### 3.1 Collectively compact families

**Collective compactness** (`IsCollectivelyCompact`): the union of the images of the closed unit
ball under the operators of the family has compact closure (Kress Definition 10.9, p. 190).

- **Members and pointwise limits** (`IsCollectivelyCompact.isCompactOperator`). Every operator of a
  collectively compact family is compact, the family is uniformly bounded, and a pointwise limit
  along a nontrivial filter is compact (Kress, the remarks after Definition 10.9, p. 190). Route:
  each image of the ball lies in the common compact set, and so does the image under the limit.
- **Uniformity** (`IsCollectivelyCompact.eventually_norm_sub_comp_le`). If Lₙ → L pointwise on a
  Banach space Y, then (Lₙ − L)A → 0 in norm uniformly over a collectively compact family of
  operators into Y (Kress Theorem 10.10, p. 190). Route: Banach–Steinhaus bounds the Lₙ, and a
  bounded pointwise convergent sequence converges uniformly on compact sets.
- **Anselone's lemma** (`IsCollectivelyCompact.tendsto_norm_sub_comp`). For a collectively compact
  sequence Aₙ on a Banach space with Aₙ → A pointwise, ‖(Aₙ − A)A‖ → 0 and ‖(Aₙ − A)Aₙ‖ → 0
  (Kress Corollary 10.11, p. 190). Route: the previous headline with Lₙ = Aₙ, applied to the
  families {A} and {Aₙ}; {A} is collectively compact because A is compact (first headline).

**Checks.**
- On ℓ²(ℕ) the rank-one projections onto the n-th coordinate are compact and tend to 0
  pointwise, but they are not collectively compact: the images of the unit ball contain all the
  unit vectors eₙ, which have no convergent subsequence. Their norm distance to the limit is
  always 1.

*Needs:* Mathlib `banach_steinhaus`.

### 3.2 Perturbation through (S − A)S

- **Perturbation through (S − A)S** (`isUnit_one_sub_of_norm_comp_lt`). On a Banach space, let
  I − A be invertible, S compact and q = ‖(I − A)⁻¹(S − A)S‖ < 1. Then I − S is invertible,
  ‖(I − S)⁻¹‖ ≤ (1 + ‖(I − A)⁻¹S‖)/(1 − q), and solutions of φ − Aφ = f and φₛ − Sφₛ = fₛ satisfy
  ‖φₛ − φ‖ ≤ (1 + ‖(I − A)⁻¹S‖)/(1 − q) · (‖(S − A)φ‖ + ‖fₛ − f‖) (Atkinson Theorem 4.1.1, p. 106;
  Atkinson–Han Theorem 12.4.3, (12.4.22)–(12.4.24), p. 510; Kress Theorem 10.12, p. 191, with
  S = Aₙ). The sources state the hypothesis and the bound with the products
  ‖(I − A)⁻¹‖ ‖(S − A)S‖ and ‖(I − A)⁻¹‖ ‖S‖; the same proof gives the norms of the composites.
  Route: with B = I + (I − A)⁻¹S one has B(I − S) = I − (I − A)⁻¹(S − A)S, which is invertible
  with inverse of norm at most 1/(1 − q) by `NormedRing.norm_inverse_add_le`. So I − S is
  injective, hence invertible by Kress Theorem 3.4 (S compact), and
  (I − S)⁻¹ = (I − (I − A)⁻¹(S − A)S)⁻¹B. The error identity is
  (I − S)(φₛ − φ) = (fₛ − f) + (S − A)φ.
- **Collectively compact approximation** (`eventually_secondKind_boundedInverse`). If Aₙ is
  collectively compact, Aₙ → A pointwise on a Banach space and I − A is injective, then for large n
  the operators I − Aₙ are invertible with uniformly bounded inverses, and
  ‖φₙ − φ‖ ≤ C(‖(Aₙ − A)φ‖ + ‖fₙ − f‖) (Kress Theorem 10.12 and Corollary 10.14, pp. 191–192;
  Atkinson–Han Theorem 12.4.4, p. 511). Route: A is compact by §3.1, so I − A is invertible
  (Kress Theorem 3.4); Anselone's lemma makes q → 0, and the previous headline applies with
  S = Aₙ.

**Checks.**
- In 𝕜 with A = a, S = s, the bound equals (1 − a + s)/((1 − s)(1 + s − a)) = 1/(1 − s), the exact
  value, whenever 1 + s − a > 0; at a = 1/2, s = 3/5 one gets q = 0.12 and the bound 2.5.
- Pointwise convergence alone is not enough: the sequence of the Check in §3.1 with A = 0 gives
  invertible I − Aₙ for no n, since 1 is an eigenvalue of each Aₙ.

*Needs:* §3.1; Tau Ceti `NormedRing.norm_inverse_add_le`; Mathlib
`IsCompactOperator.hasEigenvalue_or_mem_resolventSet`,
`IsCompactOperator.hasEigenvalue_iff_mem_spectrum`.

## Layer 4: projection methods

### 4.1 Norm convergence of projected operators

- **Compact operators and pointwise projections.** On a Banach space, if Pₙx → x for every x and
  K is compact, then ‖K − PₙK‖ → 0 (Atkinson Lemma 3.1.2, p. 57; Atkinson–Han Lemma 12.1.4,
  p. 481). This is the uniformity headline of §3.1 for the one-element family {K}, with Lₙ = Pₙ
  and L = I; Tau Ceti also proves it for bounded families of operators converging pointwise to 0
  (its module on strong convergence and compact operators).

*Needs:* §3.1.

### 4.2 Projection methods

- **Projection methods for second-kind equations** (`exists_projection_secondKind_bounds`). On a
  Banach space, let Pₙ be bounded projections with ‖K − PₙK‖ → 0 and λ − K invertible. Then for
  large n the operator λ − PₙK is invertible with uniformly bounded inverses, and the projection
  solution xₙ = (λ − PₙK)⁻¹Pₙy of (λ − K)x = y lies in the range of Pₙ, satisfies
  x − xₙ = λ(λ − PₙK)⁻¹(x − Pₙx), and
  |λ|/‖λ − PₙK‖ · ‖x − Pₙx‖ ≤ ‖x − xₙ‖ ≤ |λ| ‖(λ − PₙK)⁻¹‖ ‖x − Pₙx‖ (Atkinson Theorem 3.1.1,
  p. 55; Atkinson–Han Theorem 12.1.2 with (12.1.24), p. 479). So xₙ converges exactly as fast as
  the best approximation Pₙx. Route, as in Atkinson ((3.1.27), p. 55): λ − PₙK = (λ − K) +
  (K − PₙK), so `Units.add` and `NormedRing.norm_inverse_add_le` give invertibility and
  ‖(λ − PₙK)⁻¹‖ ≤ ‖(λ − K)⁻¹‖/(1 − ‖(λ − K)⁻¹‖ ‖K − PₙK‖) once the denominator is positive. The
  identity is (λ − PₙK)x = λ(x − Pₙx) + Pₙy. For λ ≠ 0, Pₙxₙ = xₙ because λxₙ = Pₙ(y + Kxₙ) and
  Pₙ² = Pₙ; for λ = 0 the invertibility of −PₙK makes Pₙ surjective, hence Pₙ = I, and every
  conclusion is immediate. Compactness of K is not needed, only the norm convergence; with K
  compact and Pₙ → I pointwise, §4.1 supplies it.

**Checks.**
- On ℓ²(ℕ) with K the diagonal operator of §1.1 and Pₙ the projection onto the first n coordinates,
  ‖K − PₙK‖ = 1/(n + 1).
- On ℝ² with K = [[0, 1/2], [1/2, 0]], λ = 1, y = (1, 1) and P the projection onto the first
  coordinate: x = (2, 2), I − PK = [[1, −1/2], [0, 1]], the projection solution is (1, 0), in the
  range of P, and x − xₙ = (1, 2) = (I − PK)⁻¹(x − Px), since x − Px = (0, 2).

*Needs:* §4.1; Tau Ceti `NormedRing.norm_inverse_add_le`; Mathlib `Units.add`.

### 4.3 Collocation with linear splines

**Piecewise linear interpolation** (`IsPiecewiseLinearInterpolation`): on a mesh of [a, b], Pφ
agrees with φ at the nodes and is affine on every cell.

- **Convergence of the interpolation** (`tendsto_pwLinearInterpolation`). On meshes of [a, b] whose
  widths tend to 0, the interpolation operators are projections of norm at most 1 converging
  pointwise to the identity on `C(Icc a b, 𝕜)` (Kress, the paragraph before Theorem 13.14, p. 251).
  Route: on each cell Pφ is a convex combination of two values of φ, and the error on a cell is at
  most the oscillation of φ over the cell.
- **Collocation with linear splines** (`pwLinear_collocation_tendsto`). For a compact operator A on
  `C(Icc a b, 𝕜)` with I − A injective, for large n the collocation equation φₙ − PₙAφₙ = Pₙf is
  uniquely solvable and ‖φₙ − φ‖ ≤ C‖Pₙφ − φ‖ (Kress Theorem 13.10, p. 246, and Theorem 13.14,
  p. 251, which applies it to continuous and weakly singular kernels). Route: §4.1 gives
  ‖A − PₙA‖ → 0; Kress Theorem 3.4 makes I − A invertible, and §4.2 with λ = 1 gives the
  invertibility of I − PₙA with bounded inverses and (I − PₙA)(φₙ − φ) = Pₙφ − φ.

**Checks.**
- On [0, 1] with nodes {0, 1}, φ(s) = s(1 − s) interpolates to 0, with error 1/4 = h²‖φ″‖/8.

*Needs:* §§4.1, 4.2; Mathlib `Set.IccExtend`.

## Layer 5: the Nyström method

### 5.1 Nyström operators

**The Nyström operator** (`nystromOperator`) of a continuous kernel k and a rule with nodes xⱼ and
weights wⱼ is φ ↦ ∑ⱼ wⱼ φ(xⱼ) k(·, xⱼ) (Kress (12.6), p. 224; Atkinson (4.1.4), p. 101). Its
evaluation formula `nystromOperator_apply` is proved in `Suggested.lean`.

- **Nyström operators of convergent rules** (`isCollectivelyCompact_nystromOperator`). If the rules
  converge, ∑ⱼ wₙⱼ g(xₙⱼ) → ∫ g dμ for every continuous g, then the Nyström operators are
  collectively compact and converge pointwise to the integral operator A, and if μ has no atoms
  then ‖A − Aₙ‖ ≥ ‖A‖ for every n (Kress Theorem 12.8, p. 225, whose proof gives the inequality,
  p. 226). Route: Banach–Steinhaus bounds the norms of the quadrature functionals, and
  |Aₙφ(x)| and |Aₙφ(x₁) − Aₙφ(x₂)| are values of these functionals at k(x, ·)φ and
  (k(x₁, ·) − k(x₂, ·))φ; the images of the unit ball are then bounded and equicontinuous by the
  uniform continuity of k, and Arzelà–Ascoli applies. For the inequality take x₀ attaining the norm
  formula of §1.2 and a continuous function of sup norm 1 that vanishes at the nodes and
  approximates the sign of k(x₀, ·) in L¹(μ); small neighbourhoods of the finitely many nodes have
  small measure because μ has no atoms.
- On an interval with real weights and distinct nodes, the convergence hypothesis holds exactly
  when the rules converge on polynomials and ∑ⱼ |wₙⱼ| is bounded. This is the convergence
  criterion of the QuadratureRulesAndPeanoKernels roadmap (§4.1), due to Pólya and Steklov (Kress
  Theorem 12.4 and Corollary 12.5, p. 222, in the form of Szegő), and by it the composite
  trapezoidal rule satisfies the hypothesis.

**Checks.**
- The hypothesis of no atoms is needed: for μ the Dirac mass at a point p and the one-point rule at
  p with weight 1, Aₙ = A, so ‖A − Aₙ‖ = 0 < ‖A‖ whenever k(·, p) ≠ 0.

*Needs:* §§1.2, 3.1; QuadratureRulesAndPeanoKernels §4.1; Mathlib `ContinuousMap.evalCLM`,
`banach_steinhaus`, `BoundedContinuousFunction.arzela_ascoli`.

### 5.2 Convergence of the Nyström method

- **The nodal system** (`nystrom_iff_nodal_system`, proved in `Suggested.lean`). φ solves
  φ − Aₙφ = f if and only if its nodal values solve the N × N system
  cᵢ − ∑ⱼ wⱼ k(xᵢ, xⱼ) cⱼ = f(xᵢ) and φ is given by the Nyström interpolation formula
  φ = f + ∑ⱼ wⱼ k(·, xⱼ) φ(xⱼ); conversely, the Nyström interpolant of every solution c of the
  system solves the Nyström equation and has nodal values c (Kress Theorem 12.7, p. 225;
  Atkinson (4.1.5), p. 101).
- **Convergence of the Nyström method** (`exists_nystrom_convergence`). For a convergent rule and
  a continuous kernel with I − A injective, for large n the Nyström equations are uniquely solvable
  with uniformly bounded inverses and ‖φ − φₙ‖ ≤ C‖(A − Aₙ)φ‖, the quadrature error of the rule
  applied to y ↦ k(x, y)φ(y) (Kress Corollary 12.9, p. 226; Atkinson Theorem 4.1.2, p. 107).
  Route: §5.1 and §3.2 with fₙ = f.

**Checks.**
- On [0, 1] with Lebesgue measure, k(x, y) = e^(xy)/3, the exact solution φ ≡ 1 and
  f(x) = 1 − (eˣ − 1)/(3x) (f(0) = 2/3), the composite trapezoidal rule with n subintervals gives
  errors ‖φ − φₙ‖ of 1.032·10⁻³, 2.569·10⁻⁴, 6.415·10⁻⁵, 1.603·10⁻⁵ and 4.008·10⁻⁶ for
  n = 8, 16, 32, 64, 128 (order 2), and the ratio of the error to ‖(A − Aₙ)φ‖ is 1.384, 1.378,
  1.376, 1.376 and 1.376.

*Needs:* §§3.2, 5.1.

## Layer 6: Volterra equations of the second kind

### 6.1 The resolvent kernel

**The triangle** (`volterraTriangle`): the closed triangle {0 ≤ s ≤ t ≤ T}.

- **The resolvent kernel** (`exists_volterra_resolvent`). A kernel K continuous on the triangle has
  a unique continuous resolvent kernel R with R(t, s) = K(t, s) + ∫ₛᵗ K(t, v) R(v, s) dv on the
  triangle, and R also satisfies R(t, s) = K(t, s) + ∫ₛᵗ R(t, v) K(v, s) dv (Brunner Definition
  2.1.1 and Theorem 2.1.2, p. 56, with the resolvent equations (2.1.9), p. 55). Route: R is the
  sum of the iterated kernels, which are bounded by ‖K‖ⁿ(t − s)ⁿ⁻¹/(n − 1)!.
- **Unique solvability by the resolvent** (`volterra_existsUnique_solution`). For continuous g,
  y(t) = g(t) + ∫₀ᵗ K(t, s) y(s) ds has exactly one continuous solution on [0, T], and it is
  y(t) = g(t) + ∫₀ᵗ R(t, s) g(s) ds for every continuous R satisfying the first resolvent
  equation (Brunner Theorem 2.1.2, p. 56; Kress Theorem 3.10, p. 41, which derives existence from
  the Riesz theory). Route: substitute and use the first resolvent equation and Fubini on the
  triangle; uniqueness is Gronwall's inequality for the difference.

**Checks.**
- For a constant kernel K ≡ λ the resolvent is R(t, s) = λe^(λ(t − s)), and both resolvent
  equations hold exactly.

*Needs:* Mathlib interval integrals and Fubini's theorem on the triangle.

### 6.2 Weakly singular Volterra equations

- **Weakly singular Volterra equations** (`volterra_weaklySingular_existsUnique`). For 0 < α < 1
  and K continuous on the triangle there is Q continuous on the triangle such that, for every
  continuous g, y(t) = g(t) + ∫₀ᵗ (t − s)^(−α) K(t, s) y(s) ds has exactly one continuous solution,
  y(t) = g(t) + ∫₀ᵗ (t − s)^(−α) Q(t, s) g(s) ds (Brunner Theorem 6.1.2, p. 343). Route: the
  iterated kernels are (t − s)^(n(1 − α) − 1) times continuous functions bounded by
  Γ(1 − α)ⁿ‖K‖ⁿ/Γ(n(1 − α)); after the first ⌈1/(1 − α)⌉ terms they are continuous, and their sum
  converges uniformly.

**Checks.**
- For K ≡ 1, α = 1/2 and g ≡ 1, the solution is the Mittag-Leffler function of index 1/2 at
  √(πt), that is y(t) = e^(πt) erfc(−√(πt)); with 30-digit quadrature its residual in the equation
  is below 10⁻¹⁵ at t = 1/4, 1/2 and 1.

*Needs:* §6.1; Mathlib's Gamma function and Beta integral.

## Layer 7: piecewise polynomial collocation for Volterra equations

### 7.1 Solvability and global order

**Mesh** (`IsVolterraMesh`) and **collocation equations** (`IsVolterraCollocation`): on each cell
(tᵢ, tᵢ₊₁] the approximation is a polynomial of degree less than m, and the integral equation holds
at the m collocation points of the cell, earlier cells entering through their full integrals
(Brunner Definition 2.2.1, p. 84; the collocation equations (2.2.6), p. 85). The collocation
solution need not be continuous at the mesh points.

- **Unique solvability** (`existsUnique_volterraCollocation`). For 0 ≤ α < 1 and K continuous,
  there is h̄ > 0 such that on every mesh of width less than h̄ and for every g the collocation
  equations for the kernel (t − s)^(−α) K(t, s) have exactly one solution (Brunner Theorem 2.2.1,
  p. 87, for α = 0 with distinct collocation parameters, and Theorem 6.2.1, p. 364, for
  0 < α < 1). Brunner assumes g continuous; the systems do not depend on g. Route: on each cell
  the equations are an m × m system I − h^(1 − α)Bᵢ with Bᵢ bounded uniformly in the mesh.
- **Global order m** (`exists_volterraCollocation_error_le`). For g in Cᵐ on [0, T] and K in Cᵐ on
  the triangle, the collocation error is at most Chᵐ on [0, T], with C independent of the mesh
  (Brunner Theorem 2.2.3, p. 92).

*Needs:* §6.1 (the resolvent of the error equation); Mathlib's Lagrange interpolation.

### 7.2 Superconvergence at the mesh points

**Orthogonality integrals** (`collocationMoment`): J(ν) = ∫₀¹ sᵛ ∏ᵢ (s − cᵢ) ds for ν = 0, 1, …
(Brunner (2.2.42), p. 98).

- **How many moments vanish** (`collocationMoment_order_le`). If J(ν) = 0 for all ν < κ then
  κ ≤ m, and κ ≤ m − 1 when 1 is a collocation parameter (Brunner Theorem 2.2.6, p. 98, its last
  sentence, for the second bound). Route: the degree-m polynomial ∏ᵢ (s − cᵢ) cannot be orthogonal
  to itself on [0, 1]; when κ = m it is the monic shifted Legendre polynomial, whose zeros lie in
  the open interval.
- **Nodal superconvergence** (`volterraCollocation_nodal_error_le`). If J(ν) = 0 for ν < κ and g,
  K are of class C^(m + κ), the iterated collocation solution g(t) + ∫₀ᵗ K(t, s) uₕ(s) ds has
  error O(h^(m + κ)) at the mesh points, and so does uₕ itself when 1 is a collocation parameter
  (Brunner Theorem 2.2.6, p. 98; its further condition J(κ) ≠ 0 only makes the order optimal).
- Corollaries in prose. Gauss points (κ = m) give order 2m for the iterated solution at the
  mesh points but only m for uₕ; Radau II points (κ = m − 1, cₘ = 1) give order 2m − 1 for uₕ at
  the mesh points (Brunner Corollaries 2.2.7 and 2.2.8, p. 98).

**Checks.**
- Two Gauss points (1/2 ∓ √3/6) give J(0), J(1), J(2) = 0, 0, 1/180: κ = 2 = m. The Radau II
  points (1/3, 1) give 0, −1/36, −1/45: κ = 1 = m − 1. The midpoint gives J(0), J(1) = 0, 1/12:
  κ = 1.
- For the test equation with K ≡ −1 and g ≡ 1 on [0, 1], whose solution is y = e^(−t), on uniform
  meshes with N = 16 and N = 32 cells: two Gauss points give observed orders 1.98 for uₕ on
  [0, 1] and at the mesh points and 4.00 for the iterated solution at the mesh points; the
  Radau II points give 2.99 for uₕ at the mesh points; the midpoint gives 0.98 for uₕ and 2.00
  for the iterated solution at the mesh points.

*Needs:* §7.1; Mathlib's polynomials and interval integrals.

### 7.3 Graded meshes for weakly singular equations

**Graded mesh** (`gradedMesh`): tⱼ = T(j/N)^r (Brunner (2.2.2), p. 83, and (6.2.31), p. 370, with
r ≥ 1).

- **Graded meshes** (`exists_graded_volterraCollocation_error_le`). For 0 < α < 1, g in Cᵐ, K in Cᵐ
  and μ ≥ 1 − α, on the graded mesh with exponent r = μ/(1 − α) and N large, the collocation
  solution of the weakly singular equation exists, is unique, and has error at most
  C(T/N)^min(μ, m) (Brunner Theorem 6.2.9, (6.2.35), p. 377). Route: uniqueness from §7.1, since
  the graded mesh has width at most rT/N; the error bound is Brunner's. The exact solution
  behaves like t^(1 − α) near 0, so on a uniform mesh (μ = 1 − α, r = 1) the order drops to
  1 − α, and the full order m needs r ≥ m/(1 − α).

**Checks.**
- For K ≡ −1, α = 1/2, g ≡ 1 the solution is y(t) = e^(πt) erfc(√(πt)). Two Gauss points on graded
  meshes with N = 64 and N = 128 cells give observed orders 0.50 for r = 1, 0.76 for r = 1.5 and
  1.96 for r = 4, against min(μ, m) = 0.5, 0.75 and 2.

*Needs:* §§6.2, 7.1.

## Downstream consumers

- The theory of boundary integral equations and boundary elements consumes the definition of
  integral operators (§1.2), the compactness of weakly singular operators (§1.3), the Fredholm
  alternative (§2.1) and collectively compact approximation (Layer 3) for the second-kind boundary
  equations of potential theory.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers.

Inputs:
- Tau Ceti's compact-perturbation theory and Neumann bound, and Mathlib's eigenvalue alternative
  for compact operators.
- The convergence criterion for quadrature rules of the QuadratureRulesAndPeanoKernels roadmap
  (§4.1).

Owned here:
- the point 0 in the spectrum of a compact operator on a normed space (§1.1);
- integral operators on `C(G, 𝕜)` against a finite measure, their norm and compactness for
  continuous and weakly singular kernels;
- the Fredholm theorems in dual systems of Banach spaces and their form for continuous kernels;
- collectively compact families and the approximation theorems built on them;
- projection methods for second-kind equations and collocation with linear splines;
- the Nyström operator, its collective compactness, the nodal system and its convergence;
- the Volterra resolvent kernel and the unique solvability of smooth and weakly singular Volterra
  equations of the second kind;
- piecewise polynomial collocation for Volterra equations, its order, nodal superconvergence and
  graded meshes.

Not owned:
- the Fredholm property and index zero of I − K, the Riesz chains, the finiteness of the spectrum
  away from 0 and its countability on Banach spaces, and the eigenvalue alternative (Tau Ceti and
  Mathlib);
- integral operators on L² with square-integrable kernels and their Hilbert–Schmidt norm
  ([AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md) §0.8), and the
  Hilbert–Schmidt class as an operator ideal with its compactness and the bound of the operator
  norm by the Hilbert–Schmidt norm
  ([OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), OI-B38 and
  OI-C14);
- compact operators and Fredholm determinants over nonarchimedean fields
  ([CompactOperators](../CompactOperators/README.md));
- the spectral decomposition of compact normal operators on Hilbert spaces
  ([OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  §C.8);
- the Fredholm alternative for elliptic boundary value problems ([PDE](../PDE/README.md) §4.3);
- the Pólya–Steklov criterion and the error theory of the quadrature rules themselves
  (QuadratureRulesAndPeanoKernels);
- perturbation bounds for linear systems and condition numbers (ConditioningAndPerturbation
  §1.1);
- equations of the first kind, the closed range of compact operators and their regularization
  (RegularizationOfLinearIllPosedProblems, §2.3);
- the Volterra transform x ↦ x + ∫ₐᵗ K(s)x(s) ds of continuous paths, with a kernel depending on s
  only, and its explicit inverse (Tau Ceti's module on Volterra transforms of continuous paths);
- integral operators on surfaces, layer potentials and boundary element methods, which belong to
  the theory of boundary integral equations.

Boundary in one sentence: second-kind equations with compact integral operators on `C(G, 𝕜)`, on
a compact metric space or an interval, and their projection, Nyström and collocation
discretizations are here; abstract Fredholm theory, L² kernel operators and quadrature theory are
consumed or owned elsewhere, and surface potentials are downstream.

## Exact supplier contracts

### From Tau Ceti

- `TauCeti.isFredholm_one_sub`: for compact K on a Banach space over a complete nontrivially
  normed field, I − K is Fredholm (`ContinuousLinearMap.IsFredholm`: closed range, finite
  dimensional kernel and cokernel), and `ContinuousLinearMap.index_one_sub_eq_zero`: its index is
  0. Used in §2.1.
- `NormedRing.norm_inverse_add_le`: for a unit u with ‖u⁻¹‖ ‖t‖ < 1 in a complete normed ring with
  ‖1‖ = 1, ‖(u + t)⁻¹‖ ≤ ‖u⁻¹‖/(1 − ‖u⁻¹‖ ‖t‖). Used in §§3.2, 4.2.

### From Mathlib

- `IsCompactOperator.hasEigenvalue_or_mem_resolventSet` and
  `IsCompactOperator.hasEigenvalue_iff_mem_spectrum`, for μ ≠ 0, on normed spaces. Used in §3.2
  (Kress Theorem 3.4) and §4.3.
- `isCompactOperator_id_iff_finiteDimensional` and `FiniteDimensional.of_totallyBounded_nhds_zero`
  (§1.1), `Units.add` (§4.2), `banach_steinhaus` (§§3.1, 5.1),
  `BoundedContinuousFunction.arzela_ascoli` (§§1.2, 5.1), `ContinuousMap.evalCLM` (§5.1),
  `LinearMap.Nondegenerate` (§2.1) and `Set.IccExtend` (§4.3).

### From the QuadratureRulesAndPeanoKernels roadmap

- §4.1, the convergence criterion: rules with distinct nodes in [a, b] and real weights converge
  for every continuous integrand if and only if they converge for polynomials and ∑ |wₙᵢ| is
  bounded. Used in §5.1 to identify the convergent rules on an interval, such as the composite
  trapezoidal rule of the Check in §5.2.

## Beyond this roadmap

- The spectral theorems of Kress Theorem 3.9 and the Fredholm theorems in dual systems on normed
  spaces that are not complete (Kress Chapters 3 and 4 state them so), and the Riesz
  decomposition X = N(Lʳ) ⊕ Lʳ(X) with its projection operator.
- Fredholm's determinant and the Fredholm series for continuous kernels.
- The iterated projection (Sloan) solution and the superconvergence of Galerkin methods
  (Atkinson §3.4).
- Nyström methods for weakly singular kernels by product integration (Atkinson, Chapter 4), and
  the Nyström method in L² for square-integrable kernels.
- Volterra equations of the first kind, nonlinear and integro-differential Volterra equations,
  and their collocation solutions (Brunner treats all three).
- Local superconvergence of collocation for weakly singular equations on graded meshes.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, states targets of Layers 1–7 in the module `NASC/IntegralEquations.lean`, in
its own form. It proves without `sorry` the first headline of §1.1, for a compact operator from
a normed space over a complete nontrivially normed field
(not_exists_norm_le_mul_norm_of_isCompactOperator). Its compactness, Fredholm, projection,
Nyström, resolvent and collocation statements are stated with `sorry`. Its modules are a cited
source, not the specification.

## References

- [A] K. E. Atkinson, *The Numerical Solution of Integral Equations of the Second Kind*,
  Cambridge University Press, 1997.
- [B] H. Brunner, *Collocation Methods for Volterra Integral and Related Functional Differential
  Equations*, Cambridge University Press, 2004.
- [AH] K. Atkinson and W. Han, *Theoretical Numerical Analysis: A Functional Analysis Framework*,
  3rd ed., Texts in Applied Mathematics 39, Springer, 2009.
- [K] R. Kress, *Linear Integral Equations*, 3rd ed., Applied Mathematical Sciences 82, Springer,
  2014.
