# Roadmap: the Krein–Rutman theorem and positive operators

**Summary.** The Perron–Frobenius theorem says that a nonnegative square matrix has its spectral
radius as an eigenvalue with a nonnegative eigenvector. Krein and Rutman carried this to operators
on a real Banach space that leave a closed cone invariant. This roadmap builds that theory for a
closed convex cone `K` with `K ∩ (−K) = {0}` (a salient cone) in a real Banach space. The spectrum
and the spectral radius `r(T)` of a real operator are those of its complexification, as for real
matrices.

- *The Krein–Rutman theorem.* Let the span of `K` be dense and let `T` be a compact operator with
  `T K ⊆ K` and `r(T) > 0`. Then `T x = r(T) x` for some nonzero `x` in `K`, and the dual
  operator has an eigenfunctional for `r(T)` that is nonzero and nonnegative on `K`.
- *Strongly positive operators.* Suppose `T` is compact and maps every nonzero point of `K` into
  the interior of `K`, and `K ≠ {0}`. Then `r(T) > 0`, its eigenvector can be taken in the
  interior of `K`, `r(T)` is an algebraically simple eigenvalue, no other real eigenvalue has an
  eigenvector in `K`, every other point of the spectrum has modulus below `r(T)`, and the dual
  eigenfunctional is strictly positive on the nonzero points of `K`.
- *Comparison.* If `T` is compact, `K` has dense span, and both `T` and `P − T` map `K` into `K`,
  then `r(T) ≤ r(P)`. If `T` and `P` are compact, `T` is strongly positive, `K ≠ {0}`, and
  `P x − T x` is a nonzero point of `K` for each nonzero `x` in `K`, then `r(T) < r(P)`.

Each hypothesis comes with an example showing that the conclusion fails without it: a rotation of
the plane (salience), a ray in the plane (dense span), the Volterra operator (`r(T) > 0`), the
shift on `ℓ²` (compactness), and nonnegative matrices that are not strongly positive (simplicity
and strict dominance).

The work rests on Tau Ceti's complexification of real normed spaces, its Riesz decomposition of
compact operators at nonzero scalars, the BanachAlgebras roadmap's finiteness of the large
eigenvalues of a compact operator, and Mathlib's Fredholm alternative, Gelfand formula and
Hahn–Banach separation. For matrices on `n → ℝ` the spectral radius agrees with the one used in
Tau Ceti's Perron–Frobenius files, and the theorems here specialise to them.

## How to read the build

Layer 1 fixes the spectral radius, proves positivity of the Neumann series, gives a lower bound for
`r(T)` from one vector of the cone, and matches the matrix convention. Layer 2 proves the
Krein–Rutman theorem for cones with dense span. Layer 3 treats strongly positive operators.
Layer 4 compares spectral radii.

## Conventions

- `E` is a real Banach space (`[NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]`) and
  `K : ProperCone ℝ E` is a closed convex cone containing `0`. Salience is the hypothesis
  `(K : ConvexCone ℝ E).Salient`, that is `x ∈ K`, `x ≠ 0` imply `−x ∉ K`. A ProperCone in
  Mathlib need not be salient: the whole space is one.
- `IsTotalCone K`: the span of `K` is dense in `E`. A cone with nonempty interior spans `E`
  (if a ball of radius `ρ` about `y` lies in `K`, then for `x ≠ 0` and `0 < a < ρ/‖x‖` one has
  `x = (y + a x)/(2a) − (y − a x)/(2a)`), so it is total.
- An operator `T : E →L[ℝ] E` is positive when `MapsTo T K K`, and `IsStronglyPositive K T` when
  `T x ∈ interior K` for every nonzero `x ∈ K`. Strong positivity is stronger than mapping the
  nonzero points of `K` to nonzero points of `K`; if `K ≠ {0}` it forces the interior of `K` to be
  nonempty, and then `T K ⊆ K`.
- `realSpectralRadius T` is `spectralRadius ℂ T.complexify`, with Tau Ceti's complexification
  `ContinuousLinearMap.complexify` on `TauCeti.Complexification E` (Taylor norm, complete when `E`
  is). It is a value in `ℝ≥0∞`, finite because it is at most `‖T‖`, and it is written `r(T)`; the
  eigenvalue equations use `(realSpectralRadius T).toReal`. By the Gelfand formula and
  `‖Tⁿ‖ = ‖(T.complexify)ⁿ‖`, `r(T)` is the limit of `‖Tⁿ‖^(1/n)`. Mathlib's `spectralRadius ℝ T`
  is a different number: it sees only the real spectrum.
- A functional `φ : E →L[ℝ] ℝ` is an eigenfunctional of the dual operator for `r` when
  `φ.comp T = r • φ`.
- Algebraic simplicity of a real eigenvalue `t` is the statement
  `Module.End.maxGenEigenspace (T : Module.End ℝ E) t = span {x}` for an eigenvector `x`: the
  generalized eigenspace is one-dimensional.

## Layer 1: positivity and the spectral radius

### 1.1 The Neumann series is positive

`exists_hasSum_inverse_mapsTo`: if `MapsTo T K K` and `r(T) < μ` for a real `μ`, then the series
`∑ (μ ^ (n + 1))⁻¹ • T ^ n` converges in `E →L[ℝ] E` to an operator `R` with
`(μ • 1 − T) * R = 1`, `R * (μ • 1 − T) = 1` and `MapsTo R K K`.

(Proved here.) Since `r(T) ≥ 0`, `μ > 0`. Choose `q` with `r(T) < q < μ`. By the Gelfand formula
for the complete algebra of operators on the complexification, `‖(T.complexify)ⁿ‖^(1/n) → r(T)`,
and `‖Tⁿ‖ = ‖(T.complexify)ⁿ‖` (Tau Ceti `complexify_pow` and `norm_complexify`); so
`‖Tⁿ‖ ≤ qⁿ` for large `n`, and the series converges absolutely in the Banach space `E →L[ℝ] E`.
Its partial sums `R_N` satisfy `(μ • 1 − T) * R_N = 1 − μ^(−N) • T^N = R_N * (μ • 1 − T)`, and
`μ^(−N) ‖T^N‖ → 0`. Each term maps `K` into `K` (a positive multiple of a power of `T`), so does
each partial sum (`K` is a convex cone), and so does the limit, because `K` is closed and
evaluation at a point is continuous. The source states the positivity for the complexified
resolvent (Gerhat, proof of Theorem 6.1.3, (6.1.2), p. 78).

*Needs:* Mathlib `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`; Tau Ceti
`ContinuousLinearMap.norm_complexify`, `ContinuousLinearMap.complexify_pow`,
`TauCeti.Complexification.instCompleteSpace`.

**Checks.**

- Without `r(T) < μ` there may be no inverse: for `T = 1` on `ℝ` with `K = [0, ∞)`, `r(T) = 1`
  and `μ • 1 − T = 0` at `μ = 1`.
- For `T = [[2, 1], [1, 2]]` on `ℝ²` and `μ = 4`, `(4 − T)⁻¹ = (1/3)[[2, 1], [1, 2]]`, which is
  entrywise nonnegative; at `μ = 2`, below `r(T) = 3`, the inverse of `2 − T` is
  `[[0, −1], [−1, 0]]`, with negative entries.

### 1.2 A lower bound for the spectral radius

`ofReal_le_realSpectralRadius`: let `K` be salient, `MapsTo T K K`, `u ∈ K`, `u ≠ 0`, and let
`T u − c • u ∈ K` for a real `c`. Then `ENNReal.ofReal c ≤ r(T)`.

This is the operator form of the lower Collatz–Wielandt bound, Tau Ceti
`Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`; no compactness is assumed.

(Proved here.) For `c ≤ 0` the left side is `0`. Let `c > 0`. Since `K` is salient, `−u ∉ K`;
Hahn–Banach separation of the point `−u` from the closed convex set `K` gives `ψ` and `s` with
`ψ(−u) < s < ψ(k)` for all `k ∈ K`. Then `s < 0` (take `k = 0`), and `ψ ≥ 0` on `K` (if
`ψ(k) < 0`, then `ψ(n k) → −∞` while `n k ∈ K`), and `ψ(u) > −s > 0`. By induction
`Tⁿ u − cⁿ u ∈ K`: `T^(n+1) u − c^(n+1) u = T(Tⁿ u − cⁿ u) + cⁿ (T u − c u)`. Hence
`cⁿ ψ(u) ≤ ψ(Tⁿ u) ≤ ‖ψ‖ ‖Tⁿ‖ ‖u‖`, so `c ≤ (‖ψ‖ ‖u‖ / ψ(u))^(1/n) ‖Tⁿ‖^(1/n)`, and letting
`n → ∞` with the Gelfand formula of 1.1 gives `c ≤ r(T)`.

*Needs:* Mathlib `geometric_hahn_banach_point_closed`,
`spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`; Tau Ceti
`ContinuousLinearMap.norm_complexify`, `ContinuousLinearMap.complexify_pow`.

**Checks.**

- Salience is needed: with `K = ℝ²`, `T = 0` and `u = (1, 0)`, `T u − c u = −c u ∈ K` for every
  `c`, while `r(T) = 0`.
- For `T = [[2, 1], [1, 2]]`, `K = [0, ∞)²` and `u = (1, 0)`, `T u − 2u = (0, 1) ∈ K`, and indeed
  `2 ≤ r(T) = 3`; `u = (1, 1)` gives the sharp value `c = 3`.

### 1.3 Matrices

`realSpectralRadius_toContinuousLinearMap`: for `A : Matrix n n ℝ` with `n` finite, the spectral
radius of the operator `v ↦ A v` on `n → ℝ` equals `spectralRadius ℂ (A.map (↑))`.

(Proved here.) Tau Ceti's `TauCeti.Complexification.equivPi` identifies the complexification of
`n → ℝ` with `n → ℂ`; under it the complexification of `v ↦ A v` is `z ↦ (A.map (↑)) z` (both
are complex-linear and agree on real vectors, `TauCeti.Complexification.ext_ofReal`). For
`n = Fin m` this conjugate is Tau Ceti's `ContinuousLinearMap.complexifyCoords`, whose matrix is
`A.map (↑)` by `ContinuousLinearMap.toMatrix'_complexifyCoords`; a general finite `n` is handled by
the same two-line argument with `ext_ofReal`, or by reindexing along `n ≃ Fin m`. Conjugation
by a continuous linear equivalence is an algebra equivalence of operator algebras; on the
finite-dimensional space `n → ℂ` continuous and plain linear endomorphisms are the same
(`LinearMap.toContinuousLinearMap`), and `Matrix.toLinAlgEquiv'` identifies the latter with
matrices. Algebra equivalences preserve spectra (`AlgEquiv.spectrum_eq`), hence spectral radii.
For empty `n` both algebras are trivial and both sides are `0`.

*Needs:* Tau Ceti `TauCeti.Complexification.equivPi`, `TauCeti.Complexification.ext_ofReal`,
`ContinuousLinearMap.complexifyCoords`, `ContinuousLinearMap.toMatrix'_complexifyCoords`; Mathlib `LinearMap.toContinuousLinearMap`, `Matrix.toLinAlgEquiv'`, `AlgEquiv.spectrum_eq`.

**Checks.**

- The rotation `[[0, −1], [1, 0]]` has characteristic polynomial `X² + 1`: both sides equal `1`,
  while its real spectrum is empty and `spectralRadius ℝ` of the operator is `0`. This tells the
  convention here apart from the real one.

### Examples

- On `ℝ²` with `K = [0, ∞)²`, `[[1, 1], [0, 2]]` has characteristic polynomial
  `(X − 1)(X − 2)` and spectral radius `2`.

### Dependencies

Mathlib (Gelfand formula, Hahn–Banach separation, matrix algebra equivalences); Tau Ceti
(complexification).

## Layer 2: the Krein–Rutman theorem for total cones

### 2.1 The Krein–Rutman theorem

`exists_eigenvector_of_isCompactOperator`: let `K` be salient and total, `T` compact with
`MapsTo T K K` and `0 < r(T)`. Then there are `x ∈ K`, `x ≠ 0`, with `T x = r(T) x`, and a
nonzero `φ : E →L[ℝ] ℝ` with `φ ≥ 0` on `K` and `φ.comp T = r(T) • φ`.

Source: Gerhat, Theorem 6.1.3, p. 77 (proof pp. 77–81), which she gives as the first part of
Krein and Rutman's theorem (their Theorem 6.1, 1948); her cones are closed, salient and
different from `{0}`, and positivity is `T K ⊆ K`, as here. The eigenvector half for a closed
salient generating cone (`K − K = E`) is also Intissar, Theorem 2.2, p. 11 (cones as in his
Definition 2.1, p. 10).

Route, with `S = T.complexify` and `r = r(T)`.

1. `S` is compact: under `TauCeti.Complexification.equivProd` it is `T × T` on `E × E`, and the
   image of a bounded set lies in a product of relatively compact sets.
2. Finiteness. The spectral points of `S` of modulus at least `r/2` are finitely many: they are
   eigenvalues by the Fredholm alternative (Mathlib
   `IsCompactOperator.hasEigenvalue_iff_mem_spectrum`), and a compact operator has only finitely
   many eigenvalues of modulus at least `ε` for each `ε > 0`, the eigenvalue-threshold theorem of
   BanachAlgebras 8.1. That theorem is a README item there, so its short proof is kept here: if
   `λ₁, λ₂, …` were distinct eigenvalues with `|λ_k| ≥ ε` and eigenvectors `x_k`, the spans `M_k`
   of `x₁, …, x_k` would increase strictly (`Module.End.eigenvectors_linearIndependent`), and
   `riesz_lemma` in `M_k` gives `y_k ∈ M_k` with `‖y_k‖ = 1` at distance at least `1/2` from
   `M_(k−1)`; for `j < k`, `S y_k − S y_j = λ_k y_k − ((λ_k − S) y_k + S y_j)` with the bracket in
   `M_(k−1)`, so `‖S y_k − S y_j‖ ≥ ε/2`, against compactness. In particular the peripheral
   spectrum `{λ ∈ spectrum ℂ S : |λ| = r}` is finite and relatively open in the spectrum.
3. If `r ∈ spectrum ℂ S`: it is an eigenvalue (Fredholm alternative). Tau Ceti
   `IsCompactOperator.exists_projection_ker_range_pow_sub_smul` gives a bounded idempotent `P`
   commuting with `S`, with range `ker (S − r)^p` (finite dimensional, Tau Ceti
   `IsCompactOperator.finiteDimensional_genEigenspace_nat`) and kernel `range (S − r)^p`. On the
   kernel summand `S − r` is bijective (injective because the summands meet in `0`, surjective
   because the ranges have stabilised), hence invertible there by the open mapping theorem, and
   so is `S − μ` for `μ` near `r`, with a bounded inverse; on the finite-dimensional range summand
   `S − r` is nilpotent. Let `m ≥ 1` be least with
   `(S − r)^m P = 0`. Splitting along `P`, for real `μ ↓ r` the operators
   `(μ − r)^m (μ − S)⁻¹` converge in norm to `Q = (S − r)^(m−1) P ≠ 0`: on the range of `1 − P`
   the inverse stays bounded, and on the range of `P` it is
   `∑_(k<m) (μ − r)^(−k−1) (S − r)^k`. For `μ > r` the inverse is the complexification of the
   real inverse `R_μ` of 1.1, and complexification is an isometry, so `(μ − r)^m R_μ` converges
   in `E →L[ℝ] E` to a real `Q₀` with `Q₀.complexify = Q`. By 1.1 and closedness `Q₀ K ⊆ K`;
   `Q₀ ≠ 0`; and `(T − r) Q₀ = 0 = Q₀ (T − r)`, since `(S − r) Q = (S − r)^m P = 0` and `P`
   commutes with `S`. If `Q₀` vanished on `K`, it would vanish on the span of `K` and, by
   density, on `E`; so `x = Q₀ u ≠ 0` for some `u ∈ K`, and `x ∈ K`, `T x = r x`. For the dual
   statement separate `−x` from `K` as in 1.2 to get `ψ ≥ 0` on `K` with `ψ(x) > 0`, and put
   `φ = ψ ∘ Q₀`: then `φ ≥ 0` on `K`, `φ(u) = ψ(x) > 0`, and `φ ∘ T = ψ ∘ Q₀ ∘ T = r φ`.
4. If a spectral point `λ` with `|λ| = r` has `λⁿ > 0` for some `n ≥ 1`: by the spectral mapping
   theorem (Mathlib `spectrum.map_polynomial_aeval_of_nonempty`) `rⁿ = λⁿ ∈ spectrum ℂ Sⁿ` and
   `r(Tⁿ) = rⁿ`, and `Tⁿ` is compact and positive, so step 3 gives `u ∈ K`, `u ≠ 0`, with
   `Tⁿ u = rⁿ u`. Then `x = ∑_(k<n) r^(n−1−k) T^k u` lies in `K`, satisfies `T x = r x` by
   telescoping (Gerhat, Lemma 6.1.1, p. 76), and is nonzero, since `x − r^(n−1) u ∈ K` and
   `x = 0` would put `−u` in `K`. As `r ∈ spectrum ℂ S` now, step 3 also gives `φ`.
5. Otherwise no peripheral point has a positive power. Choose a peripheral `λ₀` of largest real
   part. For small `ε > 0` the compact positive operator `T + ε T²` has spectrum
   `{λ + ελ² : λ ∈ spectrum ℂ S}` (spectral mapping) and, by Gerhat's Lemma 6.1.2 (p. 76, which
   needs the peripheral set to be relatively open, given by step 2), its peripheral spectrum lies
   in `{λ₀ + ελ₀², conj}`: for `|λ| = r`, `|λ + ελ²|² = r² (1 + 2ε Re λ + ε² r²)`. Choosing `ε_k → 0` with `arg(λ₀ + ε_k λ₀²)/(2π)` rational, step 4
   applies to `T + ε_k T²` and makes `λ₀ + ε_k λ₀²` real and positive; in the limit `λ₀ = r`,
   contradicting the case assumption. So step 3 or step 4 applies.

*Needs:* 1.1, 1.2 (its separation step); BanachAlgebras 8.1 (the eigenvalue-threshold theorem);
Mathlib `IsCompactOperator.hasEigenvalue_iff_mem_spectrum`, `spectrum.map_polynomial_aeval_of_nonempty`,
`spectrum.exists_nnnorm_eq_spectralRadius`, `geometric_hahn_banach_point_closed`,
`Module.End.eigenvectors_linearIndependent`, `riesz_lemma`; Tau Ceti
`IsCompactOperator.exists_projection_ker_range_pow_sub_smul`,
`IsCompactOperator.finiteDimensional_genEigenspace_nat`, `TauCeti.Complexification.equivProd`,
`ContinuousLinearMap.norm_complexify`.

**Checks.**

- Salience is needed: `K = ℝ²` is closed and total, the rotation `[[0, −1], [1, 0]]` maps it into
  itself and has `r = 1`, and `ker (T − 1) = 0`.
- Totality is needed: for the ray `K = {(t, 0) : t ≥ 0}` and `T = diag(0, 1)`, `T K = {0} ⊆ K`,
  `r(T) = 1`, and `ker (T − 1)` is the second axis, which meets `K` only in `0`.
- `r(T) > 0` is needed: the Volterra operator `(V f)(x) = ∫₀ˣ f` on `C([0, 1])` with the cone of
  nonnegative functions is compact and positive, `Vⁿ 1 = xⁿ/n!` and `‖Vⁿ‖ = 1/n!`, so
  `r(V) = 0`; and `V f = 0` forces `f = 0`, so no nonzero `x ∈ K` has `V x = r(V) x`.
- Compactness is needed: the right shift on `ℓ²` with the cone of nonnegative sequences is
  positive, an isometry (so `r = 1`), and has no eigenvalue, since `S x = λ x` gives
  `λ x₀ = 0` and `λ x_(k+1) = x_k`.

### Examples

- `[[1, 1], [0, 2]]` on `[0, ∞)²`: `x = (1, 1)` with `T x = 2x`, and `φ = (0, 1)` with
  `Tᵀ φ = 2φ`. The library's `Matrix.exists_mulVec_eq_smul_of_nonneg` gives the same eigenvalue.
- The integral operator with kernel `min(x, y)` on `C([0, 1])` is compact and positive; its
  eigenfunctions are `sin((2k − 1)πx/2)` with eigenvalues `4/((2k − 1)²π²)` (an eigenfunction for
  a nonzero eigenvalue is twice differentiable with `λ f″ = −f`, `f(0) = 0`, `f′(1) = 0`), so
  `r = 4/π²`, with the nonnegative eigenfunction `sin(πx/2)`. The operator is not strongly
  positive: every `T f` vanishes at `0`.

### Dependencies

Layer 1; BanachAlgebras 8.1 (finitely many eigenvalues of a compact operator above each
threshold); Mathlib (Fredholm alternative, spectral mapping, separation); Tau Ceti
(complexification, Riesz decomposition of compact operators).

## Layer 3: strongly positive operators

The four theorems assume that `K` is salient and has a nonzero point, that `T` is compact and that
`IsStronglyPositive K T`. Then the interior of `K` is nonempty, `K` is total and `T K ⊆ K`
(Conventions). For `K = {0}` strong positivity says nothing: 3.1 and 3.4 fail there (Checks),
while 3.2 and 3.3 would hold for the trivial reason that `K` has no nonzero point (take `φ = 0` in
3.2); the hypothesis is kept in all four so that they speak about the same cones.

### 3.1 A positive spectral radius and an interior eigenvector

`exists_eigenvector_mem_interior`: `0 < r(T)` and `T x = r(T) x` for some `x` in the interior of
`K`.

Source: Gerhat, Theorem 6.2.3 (i), p. 84, proof p. 85 (assumes nonempty interior; a nonzero
point is equivalent under strong positivity).

Route. For `x ≠ 0` in `K`, `u = T x` is an interior point, so `K` is total (Conventions), and
`u ≠ 0` (if `0` were interior, `K` would be all of `E`, against salience, as `E ≠ 0`). Also `T u`
is interior: a ball of radius `δ` about `T u` lies in `K`, so `T u − a u ∈ K` for
`0 < a < δ/‖u‖`, and 1.2 gives `r(T) ≥ a > 0`. Theorem 2.1 gives `y ∈ K`, `y ≠ 0`, with
`T y = r(T) y`; then `r(T) y = T y` is interior, and so is `y`, the interior of a cone being
stable under positive scalars.

*Needs:* 1.2, 2.1.

**Checks.**

- Salience is needed: for `K = ℝ²` every operator is strongly positive, and the rotation has no
  real eigenvector.
- `K ≠ {0}` is needed: for `K = {0}` in `ℝ²` the zero operator is compact and strongly positive
  with `r = 0`.

### 3.2 A strictly positive eigenfunctional

`exists_strictlyPositive_eigenfunctional`: there is `φ : E →L[ℝ] ℝ` with
`φ.comp T = r(T) • φ` and `φ x > 0` for every nonzero `x ∈ K`.

Source: Gerhat, Theorem 6.2.3 (iv), p. 85, proof p. 89.

Route. By 3.1, `r = r(T) > 0`, and `K` is total. Theorem 2.1 gives a nonzero `φ ≥ 0` on `K` with
`φ ∘ T = r φ`. Then `φ(w) > 0` at every interior point `w` of `K` (Gerhat, Proposition 5.3.2,
p. 71): if `φ(w) = 0`, then for every `k ∈ E` and small `a > 0` both `w + a k` and `w − a k` lie
in `K`, so `±a φ(k) ≥ 0`, `φ(k) = 0`, and `φ = 0`. For nonzero `x ∈ K`, `T x` is interior, so
`r φ(x) = φ(T x) > 0` and `φ(x) > 0`.

*Needs:* 2.1, 3.1.

**Checks.**

- Salience is needed: for `K = ℝ²` and the identity, `φ(x) > 0` and `φ(−x) > 0` cannot both
  hold.
- `[[2, 1], [1, 2]]` on `[0, ∞)²`: `φ = (1, 1)`, `Tᵀ φ = 3φ`; for the positive but not strongly
  positive `[[1, 1], [0, 2]]` the eigenfunctional `(0, 1)` vanishes at `e₁`.

### 3.3 Simplicity

`maxGenEigenspace_eq_span_and_eq_of_mem`: (a) for every nonzero `x ∈ K` with `T x = r(T) x`, the
generalized eigenspace of `T` for `r(T)` is `span {x}`; (b) if `y ∈ K`, `y ≠ 0` and `T y = t y`
for a real `t`, then `t = r(T)`.

Source: Gerhat, Theorem 6.2.3 (i) and (ii), pp. 84–87; her proof compares gauges
(Lemma 6.2.1, p. 82) where the route below uses the eigenfunctional of 3.2.

Route. Let `r = r(T) > 0` (3.1), `φ` as in 3.2, and `x ∈ K`, `x ≠ 0`, `T x = r x`; then
`x = r⁻¹ T x` is interior.

1. `ker (T − r) = span {x}`. Let `T y = r y` with `y ∉ span {x}`. By salience one of `y`, `−y`,
   call it `w`, is not in `K`. The set `{a ≥ 0 : x + a w ∈ K}` is closed and convex, contains
   `[0, ε)` for some `ε > 0` (`x` is interior), and is bounded (if `x + a w ∈ K` for all `a`,
   then `a⁻¹ x + w ∈ K`, and `w ∈ K` in the limit); so it is `[0, a*]` with `a* > 0`. The point
   `z = x + a* w` lies in `K` but not in its interior (else `x + (a* + δ) w ∈ K` for small
   `δ > 0`), and `z ≠ 0` since `w ∉ span {x}`. But `T z = r z`, so `z = r⁻¹ T z` is interior: a
   contradiction.
2. `ker (T − r)² = ker (T − r)`. If `(T − r)² y = 0`, then `(T − r) y ∈ ker (T − r)`, so
   `(T − r) y = b x` for a real `b`. Applying `φ`, `b φ(x) = φ(T y) − r φ(y) = 0`, and
   `φ(x) > 0` gives `b = 0`.
3. By induction `ker (T − r)^(k+1) = ker (T − r)^k` for `k ≥ 1`: if `(T − r)^(k+1) y = 0`, then
   `(T − r)^(k−1) y ∈ ker (T − r)² = ker (T − r)`. So every finite stage of the generalized
   eigenspace is `span {x}`, and so is `Module.End.maxGenEigenspace`, their union.
4. For (b): `t φ(y) = φ(T y) = r φ(y)` and `φ(y) > 0` (3.2), so `t = r`.

*Needs:* 3.1, 3.2.

**Checks.**

- Strong positivity is needed for (a): `[[1, 1], [0, 1]]` on `[0, ∞)²` is compact and positive,
  `r = 1`, `ker (T − 1) = span {e₁}` but `ker (T − 1)² = ℝ²`; and the identity of `ℝ²` has a
  two-dimensional eigenspace.
- Strong positivity is needed for (b): `diag(1, 2)` has the nonnegative eigenvector `e₁` for
  `1 ≠ r = 2`.
- Salience is needed for (a): the identity is strongly positive for `K = ℝ²`.

### 3.4 Strict dominance

`norm_lt_of_mem_spectrum`: every `μ ∈ spectrum ℂ T.complexify` with `μ ≠ r(T)` has
`‖μ‖ < r(T)`.

Source: Gerhat, Theorem 6.2.3 (iii), pp. 85 and 87–89.

Route. Let `r = r(T) > 0` and `x` interior with `T x = r x` (3.1), `φ` as in 3.2, and
`S = T.complexify`. Every spectral point has `‖μ‖ ≤ r`, the spectral radius being the supremum of
the moduli, and `μ = 0` has `‖μ‖ < r`. Let `μ = σ + iτ ≠ 0`, `μ ≠ r`, and suppose `‖μ‖ = r`.
`S` is compact (2.1, step 1), so `μ` is an eigenvalue: `S (u + i v) = μ (u + i v)` with `u`, `v`
in `E` not both `0`, that is `T u = σ u − τ v` and `T v = τ u + σ v`. Let `V` be the real span of
`u` and `v`; it is `T`-invariant, and `A = r⁻¹ T` maps it to itself.

1. `φ` vanishes on `V`: from `φ ∘ T = r φ`, `(r − μ)(φ(u) + i φ(v)) = 0`, and `μ ≠ r`. As
   `φ(x) > 0`, `x ∉ V`.
2. A compact set `C ⊆ V \ {0}` with `A C = C`. If `τ = 0`, then `μ = −r`; take `y ∈ {u, v}`
   nonzero, so `A y = −y`, and `C = {y, −y}`. If `τ ≠ 0`, `u` and `v` are linearly independent
   (`v = c u` with `u ≠ 0` gives `τ (1 + c²) u = 0`, and `u = 0` gives `τ v = 0`); writing
   `σ = r cos θ`, `τ = r sin θ`, one has `A (cos s · u + sin s · v) = cos (s − θ) · u + sin (s − θ) · v`,
   so the ellipse `C = {cos s · u + sin s · v : s ∈ ℝ}` works.
3. The gauge `g(w) = min {t ∈ ℝ : w + t x ∈ K}`. The set is nonempty (`x` is interior), closed,
   closed upwards (add multiples of `x`) and bounded below (if `w + t x ∈ K` as `t → −∞`, then
   `−x ∈ K` in the limit, against salience). If the ball of radius `ρ` about `x` lies in `K`, then
   `w + (‖w‖/ρ) x ∈ K`, so `g(w₁) ≤ g(w₂) + ‖w₁ − w₂‖/ρ`, and `g` is continuous. Let `g` attain
   its maximum on `C` at `w₀`, and let `w₁ = A⁻¹ w₀ ∈ C`. The point `w₁ + g(w₁) x` lies in `K` and
   is nonzero (`x ∉ V`, `w₁ ∈ V`, `w₁ ≠ 0`), so its image `r (w₀ + g(w₁) x)` is interior. Hence
   `w₀ + (g(w₁) − δ) x ∈ K` for small `δ > 0`, and `g(w₀) < g(w₁)`, against the choice of `w₀`.

So `‖μ‖ < r`.

*Needs:* 2.1 (step 1), 3.1, 3.2; Mathlib `IsCompactOperator.hasEigenvalue_iff_mem_spectrum`.

**Checks.**

- Strong positivity is needed: `[[0, 1], [1, 0]]` on `[0, ∞)²` is compact and positive, sends
  `e₁` to `e₂` on the boundary, and has the eigenvalue `−1` of modulus `r = 1`.
- `K ≠ {0}` is needed: for `K = {0}` the rotation of `ℝ²` is strongly positive, `r = 1`, and `i`
  is a spectral point of modulus `1`.

### Examples

- `[[2, 1], [1, 2]]` on `[0, ∞)²` is strongly positive: `r = 3` with eigenvector `(1, 1)`, the
  generalized eigenspace of `3` is the line through `(1, 1)` (`ker (T − 3)² = ker (T − 3)`), and
  the other eigenvalue is `1 < 3`. This agrees with Tau Ceti's
  `Matrix.exists_mulVec_eq_smul_of_pos` and `Matrix.spectralRadius_eq_of_mulVec_eq_smul`.
- A strongly positive operator need not have nonnegative entries. On `ℝ³` with the Lorentz cone
  `K = {x : x₀ ≥ (x₁² + x₂²)^(1/2)}`, `T x = (2x₀, −x₂, x₁)` maps a nonzero `x ∈ K` (so `x₀ > 0`)
  to a point with `2x₀ > (x₁² + x₂²)^(1/2)`, an interior point. Its spectrum is `{2, i, −i}`:
  `r = 2` with the interior eigenvector `(1, 0, 0)`, the other spectral points have modulus
  `1 < 2`, and `φ(x) = x₀` satisfies `φ ∘ T = 2φ` and is positive on the nonzero points of `K`.
- The kernel `1 + xy` on `C([0, 1])` gives a strongly positive operator of rank two, since
  `T f ≥ ∫ f > 0` for nonzero `f ≥ 0`. On `span {1, x}`, `T(a + bx) = (a + b/2) + (a/2 + b/3)x`,
  with matrix `[[1, 1/2], [1/2, 1/3]]` and eigenvalues `(4 ± √13)/6`; so `r = (4 + √13)/6`, with
  eigenfunction `1 + ((√13 − 2)/3) x`, positive on `[0, 1]`; the spectrum is
  `{(4 + √13)/6, (4 − √13)/6, 0}`.

### Dependencies

Layers 1 and 2.

## Layer 4: comparison of spectral radii

### 4.1 Monotonicity

`realSpectralRadius_le`: let `K` be salient and total, `T` compact with `MapsTo T K K`, and let
`P` be any bounded operator with `MapsTo (P − T) K K`. Then `r(T) ≤ r(P)`.

(Proved here.) If `r(T) = 0` there is nothing to prove. Otherwise 2.1 gives `x ∈ K`, `x ≠ 0`,
`T x = r(T) x`. Then `P` maps `K` into `K` (as `T + (P − T)`), and
`P x − r(T) x = (P − T) x ∈ K`, so 1.2 gives `r(T) ≤ r(P)`. Intissar, Corollary 2.3, p. 11,
argues the same way for a generating cone and compact `T` and `P`. The matrix case, for nonnegative
`0 ≤ A ≤ B`, is the classical comparison theorem; the operator `P` is not assumed compact.

*Needs:* 1.2, 2.1.

**Checks.**

- Salience is needed: on `K = ℝ²`, `T = 2·[[0, −1], [1, 0]]` and `P = 0` satisfy the inclusions,
  with `r(T) = 2 > r(P) = 0`.
- Totality is needed: on the ray `K = {(t, 0) : t ≥ 0}`, `T = diag(0, 1)` and `P = 0`:
  `(P − T) K = {0}`, and `r(T) = 1 > 0`.
- `T = [[1, 1], [1, 1]]`, `P = [[2, 1], [1, 1]]`: `P − T = diag(1, 0)`, `r(T) = 2`,
  `r(P) = (3 + √5)/2`.

### 4.2 Strict monotonicity

`realSpectralRadius_lt`: let `K` be salient with a nonzero point, `T` and `P` compact, `T`
strongly positive, and `P x − T x ∈ K`, `P x ≠ T x` for every nonzero `x ∈ K`. Then
`r(T) < r(P)`.

Source: Gerhat, Corollary 6.2.5, pp. 90–91 (with a cone of nonempty interior).

Route. `P` is strongly positive: `P x = T x + (P x − T x)`, and an interior point plus a point of
`K` is interior. By 3.1 for `P`, `P y = r(P) y` with `y` interior; by 3.2 for `T`, a strictly
positive `φ` with `φ ∘ T = r(T) φ`. Then
`r(P) φ(y) = φ(P y) = r(T) φ(y) + φ(P y − T y)`, with `φ(y) > 0` and `φ(P y − T y) > 0`; as both
radii are finite, `r(T) < r(P)`.

*Needs:* 3.1, 3.2; Mathlib `spectralRadius_le_nnnorm` (finiteness).

**Checks.**

- `K ≠ {0}` is needed: for `K = {0}` the hypotheses hold for `P = T`.
- `T = [[1, 1], [1, 1]]`, `P = T + 1`: `P x − T x = x`, `r(T) = 2 < r(P) = 3`.

### Examples

- With `T` as in the last Check and `P = [[2, 1], [1, 1]]`, the difference `diag(1, 0)` vanishes
  at `e₂`, so 4.2 does not apply, while 4.1 gives `2 ≤ (3 + √5)/2`.

### Dependencies

Layers 2 and 3.

## Scope and ownership

Owned here: the definitions `IsTotalCone`, `IsStronglyPositive`, `realSpectralRadius` and the ten
theorems above, for compact operators on real Banach spaces leaving a closed salient cone
invariant.

Already in the library and not restated: the Perron–Frobenius theorems for nonnegative,
positive and irreducible real matrices with the complexified spectral radius
(`TauCeti/LinearAlgebra/Matrix/PerronFrobenius/`), which 1.3 connects to this roadmap; the
complexification of real normed spaces and operators; the Riesz decomposition of compact
operators. Mathlib has the Fredholm alternative for compact operators, the Gelfand formula and
Hahn–Banach separation, and no Krein–Rutman theorem.

Other roadmaps: PeriodicNonnegativeMatrices (Layer 2, the peripheral spectrum of irreducible
matrices) treats the finite-dimensional rotation of the peripheral spectrum, which is not treated
here for operators. BanachAlgebras 8.1 (compact spectral decomposition) owns the theorem that a
compact operator has finitely many eigenvalues of modulus above each positive threshold; step 2 of
2.1 consumes it. Its Riesz decomposition and Schauder's fixed-point theorem (8.2) are not used:
the routes here use the library's Riesz splitting directly and no fixed-point theorem. ClassicalErgodicTheory (8.6) states the Ruelle–Perron–Frobenius theorem for
transfer operators; nothing of it is restated here.

Not treated: Jentzsch's theorem for integral operators on `L²`, Banach lattices and the
de Pagter and Niiro–Sawashima theorems, normal cones and the spectral radius of noncompact positive
operators, nonlinear Krein–Rutman theory and the principal eigenvalue of elliptic operators.
The comparison theory of nonnegative matrices (spectral radii of entrywise dominated and
irreducible matrices, the Neumann series criterion, regular splittings) is not treated here; the
orthant cases of 1.1 and 4.1 are its simplest statements.

Monotonicity 4.1 needs no normality of the cone because `T` is compact: Theorem 2.1 provides an
eigenvector of `T` in `K`, and 1.2 bounds `r(P)` from below through a functional positive at that
vector. Without compactness the comparison `0 ≤ T ≤ P ⇒ r(T) ≤ r(P)` is usually proved from a
normal cone, which is not treated here.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Convex/Cone/Basic.lean`: `ProperCone` (a `ClosedSubmodule` over the
  nonnegative scalars). `Mathlib/Geometry/Convex/Cone/Basic.lean`: `ConvexCone.Salient`.
- `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`:
  `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius` (complete normed `ℂ`-algebra),
  `spectrum.exists_nnnorm_eq_spectralRadius` (same, nontrivial).
  `Mathlib/Analysis/Normed/Algebra/Spectrum.lean`: `spectralRadius_le_nnnorm`.
- `Mathlib/Analysis/LocallyConvex/Separation.lean`: `geometric_hahn_banach_point_closed`
  (closed convex set, point outside it, locally convex real space).
  `Mathlib/Analysis/Normed/Module/RieszLemma.lean`: `riesz_lemma`.
  `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.eigenvectors_linearIndependent`.
- `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean`:
  `IsCompactOperator.hasEigenvalue_iff_mem_spectrum` (compact operator on a Banach space over a
  complete field, nonzero scalar).
- `Mathlib/FieldTheory/IsAlgClosed/Spectrum.lean`: `spectrum.map_polynomial_aeval_of_nonempty`
  (algebraically closed field, nonempty spectrum).
- `Mathlib/Algebra/Algebra/Spectrum/Basic.lean`: `AlgEquiv.spectrum_eq`.
  `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLinAlgEquiv'`.
  `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`: `LinearMap.toContinuousLinearMap`
  (finite-dimensional domain). `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`:
  `Module.End.maxGenEigenspace`.

### From Tau Ceti

- `TauCeti/Analysis/Normed/Module/Complexification.lean`: `TauCeti.Complexification`,
  `ContinuousLinearMap.complexify`, `ContinuousLinearMap.norm_complexify`
  (`‖T.complexify‖ = ‖T‖`), `ContinuousLinearMap.complexify_pow`,
  `TauCeti.Complexification.instCompleteSpace`, `TauCeti.Complexification.equivProd`,
  `TauCeti.Complexification.equivPi`, `TauCeti.Complexification.ext_ofReal`.
- `TauCeti/Analysis/Complex/CoordinateRealification.lean`: `ContinuousLinearMap.complexifyCoords`
  (the complexification of an operator on `Fin m → ℝ` read in the coordinates `equivPi`),
  `ContinuousLinearMap.toMatrix'_complexifyCoords` (its matrix is the real matrix mapped to `ℂ`).
- `TauCeti/Analysis/Normed/Operator/Compact/Decomposition.lean`:
  `IsCompactOperator.exists_projection_ker_range_pow_sub_smul` (compact operator on a real or
  complex Banach space, nonzero scalar: a bounded idempotent commuting with it onto the stable
  kernel of the powers of `K − μ • 1`, along their stable range).
- `TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean`:
  `IsCompactOperator.finiteDimensional_genEigenspace_nat` (nonzero scalar).
- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Nonnegative.lean` and `Positive.lean`:
  `Matrix.exists_mulVec_eq_smul_of_nonneg`, `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`,
  `Matrix.exists_mulVec_eq_smul_of_pos`, `Matrix.spectralRadius_eq_of_mulVec_eq_smul`, in the
  Examples and in 1.2.

## References

- B. M. Gerhat, *Krein–Rutman Theorem on the Spectrum of Compact Positive Operators on Ordered
  Banach Spaces*, Diplomarbeit, Technische Universität Wien (2016), advisor M. Kaltenbäck; open
  at repositum.tuwien.at, handle 20.500.12708/2936. Definition 3.1.6 (spectrum through the
  complexification), Proposition 3.1.5, Definitions 5.1.1, 5.1.3, 5.2.1, Propositions 5.1.5,
  5.3.2, 5.3.3, Lemmas 6.1.1, 6.1.2, Theorem 6.1.3, Lemmas 6.2.1, 6.2.2, Theorem 6.2.3,
  Corollary 6.2.5.
- A. Intissar, *On a generalization of the Perron–Frobenius theorem in an ordered Banach space*,
  arXiv:1910.01120v1 (2019). Definition 2.1, p. 10; Theorem 2.2 and Corollary 2.3, p. 11.
