# Roadmap: spectral-subspace perturbation: Sylvester equations, Rosenblum's theorem and the Davis–Kahan `sin Θ` theorems

**Summary.** When a self-adjoint operator `A` on a Hilbert space is perturbed to `B`, a spectral
subspace `U` of `A` moves to a spectral subspace `V` of `B`, by principal angles whose sines are
the singular values of `P_{V⊥} P_U`. Davis and Kahan bound this sine operator by `B − A` divided by
a spectral gap, through the Sylvester equation `AX − XB = C`, which has one solution when the
spectra of `A` and `B` are separated. The separation decides the constant: one spectrum in an
interval and the other outside its `δ`-neighbourhood gives `δ N(X) ≤ N(C)` in every unitarily
invariant norm `N`; spectra only `δ` apart pairwise give the sharp `δ N(X) ≤ (π/2) N(C)`.
Bhatia, Davis and McIntosh proved the pairwise bound with a universal constant, the best one
lying between `√3/2` and `2`; the sharp constant `π/2` is the least `L¹` norm of a function whose
Fourier integral is `1/x` for `|x| ≥ 1`, and Layer 1 is an explicit kernel attaining it, which
Tau Ceti calls the Haagerup–Zsidó kernel. Yu, Wang and Samworth give a variant for statistics
with a gap in the unperturbed (population) operator alone.

The headline theorems:

- *Rosenblum's theorem.* Let `A` and `B` be self-adjoint operators, bounded or not, on complex
  Hilbert spaces, with disjoint spectra. A bounded `X` that maps the domain of `B` into that of
  `A` and satisfies `AXy = XBy` for every `y` in the domain of `B` is zero.
- *The unbounded `π/2` theorem.* If `|a − b| ≥ δ > 0` for every `a` in the spectrum of `A` and
  `b` in that of `B`, every bounded solution of `AX − XB = C` in the same sense satisfies
  `δ‖X‖ ≤ (π/2)‖C‖`.
- *The Davis–Kahan `tan Θ` theorem.* Let `A` be symmetric on a finite-dimensional inner product
  space, `U` an invariant subspace and `Z` a subspace with `dim Z = dim U`, with `R` the residual
  of the compression of `A` to `Z`. If the eigenvalues of the compression lie in `[β, α]` and
  those of `A` on `U⊥` in `[α + δ, ∞)`, with `δ > 0`, every principal angle from `Z` to `U` is
  below `π/2` and `δ N(tan Θ) ≤ N(R)` in every unitarily invariant norm.
- *Yu–Wang–Samworth.* If `U` and `V` are spanned by eigenvectors of symmetric `A` and `B` at the
  same `d` sorted indices, and the eigenvalues of `A` at those indices are at distance at least
  `Δ > 0` from its other eigenvalues, `U` and `V` have orthonormal bases `u`, `v` with
  `(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2} ≤ 2√2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ`.

Tau Ceti's library supplies the finite-dimensional and bounded theory beneath these: the kernel,
the Sylvester bounds, the residual, perturbation and `sin 2Θ` theorems, and the Yu–Wang–Samworth
`sin Θ` theorem. [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) supplies the
domain-aware Sylvester equation and the spectral measure that the first two theorems need. The
`sin Θ` theorems are used by
[MathematicalStatisticsNonparametric](../../MathematicalStatisticsNonparametric/README.md) and
[MathematicalStatisticsHighDimensional](../../MathematicalStatisticsHighDimensional/README.md), the
Hermitian dilation by [RandomMatrices](../../RandomMatrices/README.md).

The layers follow the theory: Layer 1, the Haagerup–Zsidó kernel; Layer 2, Sylvester equations,
the `π/2` bounds and Rosenblum's theorem; Layer 3, the Davis–Kahan theorems; Layer 4, the
Yu–Wang–Samworth variant.

## How to read the build

Section numbers are fixed: §k.n is item n of Layer k, and other roadmaps cite the items by the
labels `SSP-S01` and `SSP-A01`–`SSP-D19`, where `SSP-S01` is §0.1, `SSP-An` is §1.n, `SSP-Bn` is
§2.n, `SSP-Cn` is §3.n and `SSP-Dn` is §4.n. A number missing from a layer below is an item that
Tau Ceti's library states; Scope and ownership lists each one with its declarations, and the
supplier contracts state what is assumed of it. The shared internal gap §0.1 is Tau Ceti's, so
there is no Layer 0, and there is no item 18 in Layer 2.

The layers keep what the library lacks. Layer 1 keeps the two-sided decay of `e^{−a|x|}`. Layer 2
keeps the inverse bound for a coercive operator, the representation of the reciprocal multiplier
by unitary actions, and the three statements about unbounded self-adjoint operators: the `π/2`
bound, Rosenblum's theorem and its bounded case. Layer 3 keeps the `tan Θ` theorems and the
quarter-acute bound. Layer 4 keeps the dilation form of the pairwise theorem, the aligned-basis
and single-eigenvector theorems, and the left-singular-vector bound. Each *Needs:* line lists the
inputs of a statement and of its route, so that a target proved by another route is not blocked
behind an unrelated one.

## Conventions

1. **Scalars and spaces.** `𝕜` is `ℝ` or `ℂ` (Mathlib's `RCLike 𝕜`). The finite-dimensional
   statements are over `𝕜`, on finite-dimensional inner product spaces. The statements about
   unbounded operators, and §2.12, are over `ℂ`, on complete inner product spaces. Rectangular
   statements allow different source and target spaces.
2. **Operators.** A bounded operator `A` is *symmetric* when `(A : E →ₗ[𝕜] E).IsSymmetric`; for
   bounded operators on a complete space this is self-adjointness. A partial operator is Mathlib's
   `E →ₗ.[ℂ] E` (`LinearPMap`), self-adjoint in Mathlib's sense `IsSelfAdjoint A`, which needs a
   complete space. Its spectrum is Tau Ceti's `LinearPMap.spectrum`, the complement of the
   scalars `z` at which `z − A` has a bounded two-sided inverse on the domain; for a bounded
   operator viewed as a total partial operator it is Mathlib's `spectrum` (Tau Ceti
   `ContinuousLinearMap.spectrum_toPMap_top`), and for a self-adjoint operator it is real (Tau
   Ceti `IsSelfAdjoint.spectrum_subset_im_eq_zero`).
3. **The Sylvester equation.** For `A` on `E`, `B` on `F` and `X, C : F → E`, the equation is
   `AX − XB = C`: `A` acts on the target of `X` and `B` on its source. For bounded operators the
   map `X ↦ AX − XB` is Tau Ceti's `ContinuousLinearMap.sylvester`, written `A.sylvester B X`.
   For partial operators the *domain-aware* equation is Tau Ceti's
   `LinearPMap.SylvesterEquation A B X C`: `X` maps the domain of `B` into that of `A`, and
   `AXy − XBy = Cy` for every `y` in the domain of `B`. `X` solves it with `C = 0` exactly when
   `XB ⊆ AX`, which is Tau Ceti's `LinearPMap.Intertwines B A X`: the operator on the source of
   `X` comes first.
4. **Subspaces, projections and angles.** Subspaces carry orthogonal projections
   (`Submodule.HasOrthogonalProjection`; on a complete space, closed subspaces), written `P_U`
   (Mathlib `U.starProjection`); `U⊥` is the orthogonal complement. The *directed sine map* from
   `U` to `V` is `P_{V⊥} P_U` (Tau Ceti `Submodule.sinThetaMap U V`); in finite dimension its
   singular values are the *principal sines from `U` to `V`*, and their arcsines the principal
   angles, in `[0, π/2]` (Tau Ceti `Submodule.principalSines`, `Submodule.principalAngles`). The
   *projection gap* is `‖P_U − P_V‖` and the *directed gap* `‖P_{V⊥} P_U‖` (Tau Ceti
   `Submodule.projectionGap`, `Submodule.directedProjectionGap`). For a map `X : F → E` and a
   subspace `V` of `E`, the *sine embedding* of `X` is `P_{V⊥} X` and its *cosine embedding*
   `P_V X`; for the inclusion of a subspace `Z` the sine embedding is Tau Ceti's
   `Submodule.sinThetaEmbedding Z V`, and for square maps the two are `Submodule.sinThetaMap` and
   `Submodule.cosThetaMap`.
5. **Separation.** In finite dimension spectra are point spectra. The *restricted point spectrum*
   of `A` on `U` is the set of real `λ` with an eigenvector of `A` in `U` (Tau Ceti
   `Module.End.restrictedPointSpectrum`). With it, *pairwise separation* by `δ` asks
   `δ ≤ |λ − μ|` for every `λ` of `A` on `U` and `μ` of `B` on `V`
   (`Module.End.PointSpectraSeparated A U B V δ`); *ordered separation* asks `λ + δ ≤ μ`
   (`Module.End.PointOrderedGap`); *interval/exterior separation* asks the first set to lie in
   `[a, b]` and the second outside `(a − δ, b + δ)` (`Module.End.PointIntervalExteriorGap`). The
   *internal gap* §0.1 is pairwise separation of one operator from itself across `U` and `U⊥`,
   with `U` invariant (`Module.End.PointInternalGap A U δ`). For partial operators, separation of
   real spectra is Tau Ceti's `LinearPMap.SpectralSetsSeparated A B s t δ`, over the real points
   `LinearPMap.realSpectrum` of the two spectra.
6. **Unitarily invariant norms.** `N` is a unitarily invariant seminorm on the linear maps
   `E → F` (Tau Ceti `TauCeti.UnitarilyInvariantSeminorm 𝕜 E F`): `N(UAV) = N(A)` for unitaries
   `U` of `F` and `V` of `E`, acting independently. The operator, Frobenius, Ky Fan and Schatten
   norms are Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.opNorm`, `.frobenius`, `.kyFan` and
   `.schatten`; `‖·‖` is the operator norm and `‖·‖_F` the Frobenius norm.
7. **The Haagerup–Zsidó kernel.** The weight is `w(y) = tanh(πy/2)`, its Laplace transform
   `L(t) = ∫_{y>0} w(y) e^{−|t|y} dy`, the real kernel `r(t) = (sin t / 2) L(t)` and the kernel
   `k(t) = −i r(t)` (Tau Ceti `TauCeti.HaagerupZsido.weight`, `.weightLaplaceTransform`,
   `.realKernel`, `.reciprocalKernel`). The integral defining `L` converges for `t ≠ 0`; at
   `t = 0` it diverges and the library's value is `0`, the Bochner integral of a non-integrable
   function, which affects no statement since `{0}` is a null set. Fourier identities are written
   as the bare integral `∫_ℝ k(t) e^{itx} dt`; Mathlib's transform `𝓕 f (ξ) = ∫ e^{−2πitξ} f(t) dt`
   differs by the substitution `x = −2πξ`.
8. **Trial maps.** For bounded `A` on `E` and `X : F → E`, the *compression* is `X†AX` (Tau Ceti
   `ContinuousLinearMap.compression`), the *residual* for a model operator `M` on `F` is
   `R = AX − XM = A.sylvester M X`, and the *Ritz residual* of an isometric `X` takes `M = X†AX`.
9. **The statistical layer.** `A` (the population operator) and `B` (the perturbed or sample
   operator) are symmetric on a finite-dimensional space of dimension `n`; their eigenvalues are
   listed in decreasing order with orthonormal eigenvector bases (Mathlib
   `LinearMap.IsSymmetric.eigenvalues` and `.eigenvectorBasis`). *Corresponding eigenblocks* are
   spans of eigenvectors of `A` and `B` at the same sorted indices (Tau Ceti
   `LinearMap.IsSymmetric.CorrespondingEigenblocks`, with the eigenvectors chosen freely inside
   repeated eigenspaces). The *residual columns* of a selected index set `s` are
   `R_j = λ_j(A) v_j − A v_j` for `j ∈ s`, with `λ_j(A)` the `j`-th eigenvalue of `A` and `v_j`
   the `j`-th eigenvector of `B`. The Frobenius sine distance is `‖sin Θ(U, V)‖_F = ‖P_{V⊥} P_U‖_F`
   (Tau Ceti `Submodule.sinThetaFrobenius U V`), symmetric in `U` and `V` when their dimensions
   agree.
10. **Names.** The acceptance file `Suggested.lean` states the headline theorems in the namespace
    `TauCetiRoadmap.SpectralSubspacePerturbation`. Other targets are named in prose.

## Layer 1: the Haagerup–Zsidó kernel

The kernel, its Fourier and Laplace identities, its integrability and its exact mass `π/2` are
Tau Ceti's (§1.1–§1.15, §1.17–§1.26 under Scope and ownership). One elementary input is not.

### 1.16 Two-sided exponential decay

Prove that for `a > 0` and every real `s`, `e^{−a|x|} = o(|x|^s)` as `|x| → ∞`, that is, along
Mathlib's `Filter.cocompact ℝ`: `(fun x ↦ Real.exp (-(a * |x|))) =o[cocompact ℝ] (fun x ↦ |x| ^ s)`.
This is the decay hypothesis of Mathlib's Poisson summation formula
`Real.tsum_eq_tsum_fourier_of_rpow_decay`, in the form the Cauchy-kernel lattice identity of the
kernel's construction uses. Mathlib states only the one-sided limit `x → +∞` of `e^{−ax}`.
Route: both functions are even, and on `[0, ∞)` the statement is Mathlib's
`isLittleO_exp_neg_mul_rpow_atTop`.
*Needs:* Mathlib `isLittleO_exp_neg_mul_rpow_atTop`, `Filter.cocompact`.

### Examples

- The Fourier identity cannot reach far into `(−1, 1)`: `|∫ k(t) e^{itx} dt| ≤ ∫ |k| = π/2`, while
  `|1/x| > π/2` for `0 < |x| < 2/π`; at `x = 0` the integral is `0`, because `k` is odd and
  integrable (Tau Ceti `TauCeti.HaagerupZsido.reciprocalKernel_neg`,
  `TauCeti.HaagerupZsido.integrable_reciprocalKernel`). A kernel with this identity on all of
  `ℝ ∖ {0}` would not be integrable.
- The mass `∫ |k(t)| dt = π/2` comes from Tonelli: integrating `|sin t| e^{−y|t|}` in `t` gives
  `2(1 + e^{−πy})/((1 − e^{−πy})(1 + y²))`, and multiplied by `tanh(πy/2)/2` this is
  `1/(1 + y²)`, whose integral over `(0, ∞)` is `π/2`. Dropping the factor `1/2` in `r` would
  give the mass `π`.

### Dependencies

Mathlib: asymptotics and the cocompact filter. Tau Ceti: the Haagerup–Zsidó kernel (supplier
contracts).

## Layer 2: Sylvester equations and Rosenblum's theorem

The Sylvester operator, its finite-dimensional solution theory, and the dimension-free,
interval/exterior, Ky Fan, Frobenius and pairwise `π/2` bounds in finite dimension are Tau Ceti's
(§2.1–§2.4, §2.6–§2.11, §2.13–§2.15 under Scope and ownership). This layer adds the explicit inverse
bound for a coercive operator, the unitary representation behind the `π/2` constant, and the
statements for unbounded self-adjoint operators.

### 2.5 Coercive invertibility with the inverse bound

Let `E` be a complete inner product space over `𝕜`, `T : E →L[𝕜] E`, and `c > 0` with
`c‖x‖² ≤ Re⟪Tx, x⟫` for every `x`: the real bilinear form `(x, y) ↦ Re⟪Tx, y⟫` is coercive in the
sense of Mathlib's `IsCoercive`, with the witness `c` named. Prove that `T` is invertible in the
algebra of bounded operators (equivalently, a continuous linear equivalence of `E`) and that its
inverse has norm at most `c⁻¹`. Route: Tau Ceti's `ContinuousLinearMap.isUnit_of_coercive` gives
invertibility and `ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive` the lower bound
`c‖x‖ ≤ ‖Tx‖`, which `ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le` turns into
`‖T⁻¹‖ ≤ c⁻¹`. For real scalars Mathlib's Lax–Milgram theorem `IsCoercive.continuousLinearEquivOfBilin`
gives the equivalence, and `IsCoercive.antilipschitz` an unnamed constant; Tau Ceti's variational
form of Lax–Milgram is in `TauCeti/Analysis/InnerProductSpace/LaxMilgram.lean`.
*Needs:* Tau Ceti `ContinuousLinearMap.isUnit_of_coercive`,
`ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive`,
`ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le`; Mathlib `Ring.inverse`, `IsCoercive`.

**Checks.**
- On `ℝ²`, `T = [[1, 1], [−1, 1]]` is not symmetric, but `⟪Tx, x⟫ = ‖x‖²`, so `c = 1`; its inverse
  `(1/2)[[1, −1], [1, 1]]` has norm `1/√2 ≤ 1`. The hypothesis is on the real part of the form,
  not on symmetry.
- The unilateral shift `S` on `ℓ²(ℕ)` satisfies `‖Sx‖ = ‖x‖` and is not surjective; its form is
  not coercive, since `⟪Se₀, e₀⟫ = ⟪e₁, e₀⟫ = 0`. A version assuming only the lower bound
  `‖Tx‖ ≥ c‖x‖` would make `S` invertible.

### 2.12 The reciprocal multiplier as a combination of unitary actions

Let `E` and `F` be finite-dimensional complex inner product spaces, `A` on `E` and `B` on `F`
symmetric with orthonormal eigenvectors `uᵢ`, `vⱼ` and eigenvalues `αᵢ`, `βⱼ`, and `δ > 0` with
`|αᵢ − βⱼ| ≥ δ` for all `i, j` (`Module.End.PointSpectraSeparated A ⊤ B ⊤ δ`). The
*`δ`-normalised reciprocal multiplier* is the linear map `m_δ` on the maps `F → E` with
`⟪uᵢ, m_δ(C) vⱼ⟫ = δ ⟪uᵢ, C vⱼ⟫ / (αᵢ − βⱼ)`; it sends `C` to `δ` times the unique solution of
`AX − XB = C` (Tau Ceti `ContinuousLinearMap.sylvester_apply_eq_iff`). Prove that there are
finitely many unitaries `Uₖ` of `E` and `Vₖ` of `F` and complex numbers `aₖ` with
`∑ₖ |aₖ| ≤ π/2` such that `m_δ(C) = ∑ₖ aₖ Uₖ C Vₖ` for every `C`; the unitaries and the
coefficients do not depend on `C`. Route: by the exterior Fourier identity,
`m_δ(C) = ∫ δ k(δt) e^{itA} C e^{−itB} dt` (the integral representation of Albeverio, Makarov and
Motovilov 2003, Theorem 2.7, formula (2.12)), an integral of unitary actions with total mass
`∫ |k| = π/2`; the maps `C ↦ λ U C V` with `|λ| = 1` form a compact set in finite dimension, so
the normalised integral lies in its convex hull, and Carathéodory's theorem makes the combination
finite. The statement is over `ℂ`; for real scalars the bound it
implies, `δ N(X) ≤ (π/2) N(C)`, is Tau Ceti's
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`, proved through
the orbit hull of §2.14.
*Needs:* Tau Ceti `TauCeti.HaagerupZsido.integral_exp_mul_I_mul_reciprocalKernel`,
`TauCeti.HaagerupZsido.integral_norm_reciprocalKernel`, `ContinuousLinearMap.sylvester_apply_eq_iff`,
`TauCeti.UnitaryOrbitCertificate`; Mathlib `convexHull`, `NormedSpace.exp`, Carathéodory's theorem
`convexHull_eq_union`.

**Checks.**
- For `A = ¼·1` and `B = 0` on `ℂ`, `δ = ¼` and `m_δ` is the identity, a combination of mass
  `1 ≤ π/2`. The unnormalised multiplier, with entries `1/(αᵢ − βⱼ)`, is multiplication by `4`,
  of operator norm `4`; a combination of unitary actions of mass at most `π/2` has norm at most
  `π/2`, so the normalisation by `δ` is needed.
- Mass `1` does not suffice. For `A = diag(0, 2)` and `B = diag(1, −1)`, every `|αᵢ − βⱼ|` is at
  least `δ = 1`, and the unitary `C = (1/√2)[[1, 1], [1, −1]]` has `m_δ(C) = (1/√2)[[−1, 1], [1, −1/3]]`,
  of operator norm `(2 + √10)/(3√2) ≈ 1.2168 > 1 = ‖C‖`.

### 2.16 The domain-aware pairwise bound

Prove `mul_norm_le_pi_div_two_mul_norm_of_sylvesterEquation`: let `A` on `E` and `B` on `F` be
self-adjoint partial operators on complex Hilbert spaces and `δ > 0` with `δ ≤ |a − b|` for every
real point `a` of the spectrum of `A` and `b` of the spectrum of `B`
(`LinearPMap.SpectralSetsSeparated A B univ univ δ`; the spectra are real). If bounded
`X, C : F → E` satisfy the domain-aware equation `AX − XB = C`, then `δ‖X‖ ≤ (π/2)‖C‖`
(Seelmann 2014, Theorem 3.1; for weak solutions, Albeverio, Makarov and Motovilov 2003,
Theorem 2.7). Bhatia, Davis and McIntosh proved the bound with a universal constant
(Bhatia–Davis–McIntosh 1983, Theorem 4.1); by Albeverio, Makarov and Motovilov 2003, Remark 2.8,
they placed the best constant between `√3/2` and `2`, the value `π/2` goes back to Sz.-Nagy, and
its sharpness is McEachin's. For bounded `A` and `B`, viewed as total partial operators, it is the
operator-norm `π/2` bound on every Hilbert space. Route: `X` is
the weak integral `∫ k(δt) e^{itA} C e^{−itB} dt` of the unitary groups of `A` and `B` against the
Haagerup–Zsidó kernel, whose norm is at most `(π/2)‖C‖/δ` by the kernel-mass bound. To identify it
with `X`, cut `A` and `B` down by the spectral projections of bounded intervals: on their ranges
they act as bounded self-adjoint operators with `δ`-separated spectra, the cut-down `X` solves the
cut-down equation, and there the exterior Fourier identity, integrated against the spectral
measures, gives `(λ − μ)⁻¹` where `AX − XB = C` gives `(λ − μ)` times `X`; the cutoffs converge
strongly to the identity. Uniqueness of the solution is §2.17.
*Needs:* Tau Ceti `LinearPMap.SylvesterEquation`, `LinearPMap.SpectralSetsSeparated`,
`LinearPMap.spectrum`, `TauCeti.HaagerupZsido.integral_exp_mul_I_mul_reciprocalKernel`,
`TauCeti.HaagerupZsido.norm_integral_reciprocalKernel_smul_le`,
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (Stone's theorem);
SelfAdjointSpectralTheory SA-E01 (the spectral measure), SA-E06 and SA-E07 (spectral projections
commute with resolvents and preserve the domain), SA-E31 (strong convergence of interval cutoffs)
and SA-E37 (spectral ranges of bounded sets lie in the domain).

**Checks.**
- Constant one fails under pairwise separation. For `A = diag(0, 2)` and `B = diag(1, −1)` on
  `ℂ²`, every distance between the spectra is at least `δ = 1`, but neither spectrum lies in an
  interval whose `δ`-neighbourhood misses the other. The unitary `C = (1/√2)[[1, 1], [1, −1]]`
  gives the solution `Xᵢⱼ = Cᵢⱼ/(αᵢ − βⱼ)`, that is `X = (1/√2)[[−1, 1], [1, −1/3]]`, with
  `‖X‖ = (2 + √10)/(3√2) ≈ 1.2168`, more than `‖C‖ = 1` and less than `π/2 ≈ 1.5708`.
- The gap cannot be dropped to disjointness. On `ℓ²(ℕ)` let `A` and `B` be the diagonal operators
  with entries `aₙ = n` and `bₙ = n + 1/(n + 2)` on their maximal domains. Their spectra `ℕ` and
  `{n + 1/(n + 2)}` are closed and disjoint at distance `0`. For `C_k = e_k ⊗ e_k`, of norm one,
  the solution is `X_k = −(k + 2) e_k ⊗ e_k`, of norm `k + 2`: no bound `‖X‖ ≤ K‖C‖` holds.

### 2.17 Rosenblum's theorem

Prove `eq_zero_of_intertwines_of_disjoint_spectrum`: let `A` on `E` and `B` on `F` be
self-adjoint partial operators on complex Hilbert spaces with disjoint spectra. A bounded
`X : F → E` that maps the domain of `B` into that of `A` and satisfies `AXy = XBy` for every `y`
in the domain of `B` (Tau Ceti's `LinearPMap.Intertwines B A X`) is zero. For bounded `A` this is
part of a theorem of Krein, found independently by Daleckii and by Rosenblum (Albeverio, Makarov
and Motovilov 2003, Lemma 2.5 and the paragraph before it; Rosenblum 1956); for spectra at positive
distance it is the uniqueness in Seelmann 2014, Theorem 3.1. So the domain-aware Sylvester
equation has at most one bounded solution. Route: the intertwining passes to resolvents (Tau Ceti
`LinearPMap.intertwines_iff_comp_resolvent_eq`), hence to the spectral measures,
`X P_B(J) = P_A(J) X` for Borel `J`; the spectral measure of `A` vanishes on Borel sets of
resolvent points, so `X = X P_B(σ(B)) = P_A(σ(B)) X = 0`. A route without the Borel calculus uses
the Cayley transforms: `X` intertwines their continuous functional calculi (Tau Ceti
`LinearPMap.Intertwines.comp_cfc_cayley_eq`), and continuous symbols equal to `1` on the Cayley
image of `σ(B)` and `0` on that of `σ(A)` away from shrinking neighbourhoods of the point `1`
converge strongly to the identity and to `0`, because `1` carries no mass of any diagonal spectral
measure of a Cayley transform.
*Needs:* Tau Ceti `LinearPMap.spectrum`, `LinearPMap.Intertwines`,
`LinearPMap.intertwines_iff_comp_resolvent_eq`, `LinearPMap.cayley`,
`LinearPMap.Intertwines.comp_cfc_cayley_eq`; SelfAdjointSpectralTheory SA-E01, SA-E05 (the
resolvent formula) and SA-E08 (spectral support), or SA-E02 (zero mass at the Cayley singular
point) for the second route.

**Checks.**
- Disjoint point spectra do not suffice. Multiplication by `x` on `L²(0, 1)` is bounded and
  self-adjoint with spectrum `[0, 1]` and no eigenvalue; with `A = B` equal to it, the point
  spectra are empty and disjoint, and `X = 1` intertwines them. A statement with eigenvalues in
  place of spectra, which suffices in finite dimension, is false.
- For `A` and `B` the diagonal operators `n` and `n + 1/(n + 2)` of §2.16, the spectra are disjoint
  at distance `0`, and the theorem still applies: the only bounded intertwiner is `0`, since
  `(aₘ − bₙ) Xₘₙ = 0` with `aₘ ≠ bₙ` for every matrix entry.

### 2.19 The bounded Rosenblum theorem

Let `A` on `E` and `B` on `F` be bounded self-adjoint operators on complex Hilbert spaces whose
spectra (Mathlib `spectrum ℂ`) are disjoint. Prove that every bounded `X : F → E` with `AX = XB`
is zero (Rosenblum 1956; Albeverio, Makarov and Motovilov 2003, Lemma 2.5, which credits Krein
first). Route: viewed as total partial operators, `A` and `B` are self-adjoint with the same
spectra and `X` solves the domain-aware equation with `C = 0` (Tau Ceti
`LinearPMap.isSelfAdjoint_toPMap_top`, `ContinuousLinearMap.spectrum_toPMap_top`,
`LinearPMap.SylvesterEquation.ofBounded_iff`), so §2.17 applies. Directly, without §2.17: a
continuous function equal to `1` on the spectrum of `B` and `0` on that of `A`, which are disjoint
compact sets, gives `X = X f(B) = f(A) X = 0` (Tau Ceti `ContinuousLinearMap.comp_cfc_eq_cfc_comp`).
*Needs:* Tau Ceti `LinearPMap.isSelfAdjoint_toPMap_top`, `ContinuousLinearMap.spectrum_toPMap_top`,
`LinearPMap.SylvesterEquation.ofBounded_iff`, and §2.17; or `ContinuousLinearMap.comp_cfc_eq_cfc_comp`
alone.

### Examples

- In finite dimension the Sylvester equation is solved coordinatewise: in eigenbases,
  `(αᵢ − βⱼ) Xᵢⱼ = Cᵢⱼ` (Tau Ceti `ContinuousLinearMap.inner_sylvester_apply_eigenvectorBasis`), so
  the solution is unique exactly when no `αᵢ` equals a `βⱼ`, which is §2.19 for matrices.
- The bounded instance of §2.16 for `A = diag(0, 2)` and `B = diag(1, −1)` is worked out in its
  Checks; the finite-dimensional pairwise bound it illustrates is Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`.

### Dependencies

Layer 1 (the kernel, §2.12 and §2.16). SelfAdjointSpectralTheory Part E (the spectral measure of an
unbounded self-adjoint operator, §2.16 and §2.17). Tau Ceti: the Sylvester operator, the
`LinearPMap` resolvent, spectrum, separation, intertwining and Sylvester-equation API, the Cayley
transform and its continuous functional calculus, Stone's theorem, coercive operators. Mathlib:
`LinearPMap`, continuous functional calculus, convex hulls.

## Layer 3: the Davis–Kahan theorems

Trial maps and residuals, the graph-subspace model, the dimension-free and finite `sin Θ`
theorems in every unitarily invariant norm, the canonical spectral-subspace forms, the pairwise
`π/2` theorem, the symmetric two-orientation theorem, and the `sin 2θ`, `sin 2Θ` and per-vector
`tan 2θ` bounds are Tau Ceti's (§3.1–§3.27 and §3.30 under Scope and ownership). This layer adds
the `tan Θ` theorems and the quarter-acute bound.

### 3.28 The Ritz-residual `tan Θ` theorem, equal ranks

Prove `directedProjectionGap_lt_one_and_mul_map_tanThetaMap_le`: let `A` be symmetric on a
finite-dimensional inner product space `E` over `𝕜`, `U` an `A`-invariant subspace, and `Z` a
subspace with `dim Z = dim U`. Let `M` be the compression of `A` to `Z` and `R : Z → E` its Ritz
residual, `R = Aι − ιM` with `ι` the inclusion of `Z`. Suppose `β ≤ α`, `δ > 0`, the eigenvalues
of `M` lie in `[β, α]`, and the eigenvalues of `A` on `U⊥` lie in `[α + δ, ∞)`. Then the directed
gap `‖P_{U⊥} P_Z‖` from `Z` to `U` is less than `1`, so every principal angle `θⱼ` from `Z` to `U`
is below `π/2`; and the tangent map `T_{Z,U} : Z → E`, defined in a right singular basis of the
sine embedding of `Z` by the diagonal values `tan θⱼ` followed by the inclusion (Tau Ceti
`Submodule.tanThetaMap Z U`), whose singular values are the principal tangents, satisfies
`δ N(T_{Z,U}) ≤ N(R)` for every unitarily invariant seminorm `N` on the maps `Z → E` (Davis and
Kahan 1970, the `tan Θ` theorem). The hypotheses force `Z ∩ U⊥ = 0`: a unit `z` there would have
`α + δ ≤ ⟪Az, z⟫ = ⟪Mz, z⟫ ≤ α`. Hence `dim Z ≤ dim U` always, and §3.28 and §3.29 together cover
every case. Route: the proof of Davis and Kahan, in which the transversality makes `Z` the graph
of the tangent operator from `U` to `U⊥`, the Ritz residual is orthogonal to `Z` (Tau Ceti
`ContinuousLinearMap.adjoint_comp_sylvester_compression`), and the one-sided position of the two
spectra, the eigenvalues of `M` below those of `A` on `U⊥`, gives the constant one.
*Needs:* Tau Ceti `ContinuousLinearMap.compression`, `ContinuousLinearMap.sylvester`,
`ContinuousLinearMap.adjoint_comp_sylvester_compression`,
`Submodule.tanThetaMap`, `Submodule.singularValues_tanThetaMap`,
`Submodule.directedProjectionGap_lt_one_iff`,
`Submodule.forall_principalAngles_lt_pi_div_two_iff_directedProjectionGap_lt_one`,
`TauCeti.UnitarilyInvariantSeminorm`, and the separated Sylvester bounds of Layer 2.

**Checks.**
- The constant is sharp. On `ℝ²` let `A = diag(0, 1)`, `U = span e₁` and `Z` the span of
  `z = (cos φ, sin φ)` with `0 < φ < π/2`. Then `M = sin²φ = α = β`, `A` is `1` on `U⊥`, so
  `δ = cos²φ`, and `R = Az − zM = sin φ cos φ (−sin φ, cos φ)` has norm `sin φ cos φ`. The angle
  from `Z` to `U` is `φ`, and `δ tan φ = sin φ cos φ = ‖R‖`: equality. At `φ = π/4` both sides
  are `1/2`, while `δ sin φ = √2/4`; a bound with a smaller constant than one is false.

### 3.29 The Ritz-residual `tan Θ` theorem, lower rank

Under the hypotheses of §3.28 with `dim Z < dim U` in place of `dim Z = dim U`, prove the same
two conclusions: the directed gap from `Z` to `U` is less than `1`, and the tangent map
`T_{Z,U} : Z → E` of Tau Ceti's `Submodule.tanThetaMap Z U`, whose singular values are the
principal tangents, satisfies `δ N(T_{Z,U}) ≤ N(R)` for every unitarily invariant seminorm `N` on
the maps `Z → E` (Davis and Kahan 1970, the generalized `tan Θ` theorem). Route: as for §3.28;
the transversality now makes `Z` the graph of the tangent operator over the proper subspace
`P_U Z` of `U`.
*Needs:* as §3.28.

### 3.31 The quarter-acute bound for off-diagonal perturbations

Let `A` and `H` be bounded self-adjoint operators on a Hilbert space over `𝕜`, `U` a closed
`A`-invariant subspace and `V` a closed `(A + H)`-invariant subspace, and `a < b`. Suppose `A`
satisfies `b‖u‖² ≤ Re⟪Au, u⟫` for `u ∈ U` and `Re⟪Az, z⟫ ≤ a‖z‖²` for `z ∈ U⊥`, that `A + H`
satisfies the same two bounds relative to `V` and `V⊥`, and that `H` is off-diagonal relative to
`U ⊕ U⊥`: `H(U) ⊆ U⊥` and `H(U⊥) ⊆ U`. Prove `‖P_U − P_V‖ < √2/2`. In finite dimension
`dim U = dim V`, and the conclusion is equivalent to every principal angle from `U` to `V` being
less than `π/4` (Davis and Kahan 1970, the `tan 2Θ` theorem, in the form of Kostrykin, Makarov
and Motovilov 2004, (1.2) and (1.4)). Route: the bounds and the off-diagonal shape of `H` give
`V ∩ U⊥ = 0` and `V⊥ ∩ U = 0` (a unit vector in either would have its form value both at most `a`
and at least `b`, since `⟪Hz, z⟫ = 0` for `z` in `U` or in `U⊥`), so `V` is the graph of an angular
operator `K` from `U` to `U⊥`; the Davis–Kahan `tan 2Θ` argument, of which Tau Ceti's per-vector
`LinearMap.IsSymmetric.tan_two_theta_le` is the eigenvector case, gives
`‖K‖ ≤ tan(½ arctan(2‖H‖/(b − a))) < 1`, and the exact graph gap `‖K‖/√(1 + ‖K‖²)` concludes. In
finite dimension the two trivial intersections give `dim U = dim V`, so the projection gap equals
the directed gap and Tau Ceti's `Submodule.forall_principalAngles_lt_pi_div_four_iff` converts it.
*Needs:* Tau Ceti `Submodule.IsAngularOperator`, `Submodule.graphSubspace`,
`Submodule.IsAngularOperator.projectionGap_graphSubspace`, `LinearMap.IsSymmetric.tan_two_theta_le`,
`Submodule.projectionGap_eq_directedProjectionGap_of_finrank_eq`,
`Submodule.forall_principalAngles_lt_pi_div_four_iff`.

**Checks.**
- On `ℝ²` let `A = diag(1, 0)`, `U = span e₁`, `a = 0`, `b = 1`, and `H = [[0, h], [h, 0]]`. The
  eigenvalues `(1 ± √(1 + 4h²))/2` of `A + H` are at least `1` and at most `0`, so `V`, its top
  eigenline, satisfies the hypotheses for every `h`. The angle from `U` to `V` is
  `θ = ½ arctan(2h) < π/4`, with `‖P_U − P_V‖ = sin θ`: `0.6154` at `h = 2` and `0.7053` at
  `h = 100`, below and tending to `√2/2 ≈ 0.7071`. The bound `√2/2` cannot be lowered.
- The off-diagonal hypothesis is needed. For `H = diag(−1, 1)`, `A + H = diag(0, 1)` satisfies the
  two bounds relative to `V = span e₂`, which is orthogonal to `U`: `‖P_U − P_V‖ = 1`.

### Examples

- The residual form of the `sin Θ` theorem is Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`; in the
  example of §3.28's Check it gives `δ sin φ ≤ ‖R‖`, the weaker `cos²φ sin φ ≤ sin φ cos φ`.
- For `A = diag(1, 0)` and `B = [[1, ε], [ε, 0]]` with `ε = 2/3`, the perturbed top eigenline is
  at angle `θ` with `sin²θ = 1/5`, the gap from the top eigenvalue `1` of `A` to the lowest
  eigenvalue `(1 − 5/3)/2 = −1/3` of `B` is `δ = 4/3`, and the perturbation form of the
  `sin Θ` theorem (Tau Ceti
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`) reads
  `(4/3)/√5 ≈ 0.596 ≤ ‖B − A‖ = 2/3`.

### Dependencies

Layer 2 (the separated Sylvester bounds, Tau Ceti's). Tau Ceti: compression and residuals, the
graph-subspace model, principal angles and tangents, the per-vector double-angle bounds. Mathlib:
orthogonal projections, singular values.

## Layer 4: the Yu–Wang–Samworth variant

Corresponding eigenblocks, the Frobenius sine distance, singular subspaces, the Hermitian dilation
and its spectral transfer, the complement identity, the residual sandwich, the singular-subspace
`sin Θ` transfer, the population-gap `sin Θ` theorem and the right-singular-vector bound are Tau
Ceti's (§4.1–§4.14, §4.16 and the right half of §4.19 under Scope and ownership; the residual
columns §4.3 are notation, Convention 9). This layer adds the dilation form of the pairwise
theorem and the three vector forms.

### 4.15 The dilation pairwise-gap bound

Let `E` and `F` be finite-dimensional inner product spaces, `A, Â : E → F`, and `D(A)`, `D(Â)` their
Hermitian dilations `[[0, A†], [A, 0]]` on `E ⊕ F` (Tau Ceti `LinearMap.hermitianDilation`). Let
`Ω ⊆ ℝ`, write `E_D(Ω)` for the point-spectral subspace of `D` selected by `Ω` (Tau Ceti
`Module.End.pointSpectralSubspace`), and let `δ > 0`. If every eigenvalue of `D(A)` on
`E_{D(A)}(Ω)` is at distance at least `δ` from every eigenvalue of `D(Â)` on `E_{D(Â)}(Ω)⊥`, prove
`δ ‖P_{E_{D(Â)}(Ω)⊥} P_{E_{D(A)}(Ω)}‖ ≤ (π/2)‖D(Â) − D(A)‖`, and the right side equals
`(π/2)‖Â − A‖` (the pairwise `π/2` `sin Θ` bound, Seelmann 2014, Proposition 2.4, applied to
Hermitian dilations). Route: Tau Ceti's pairwise `sin Θ` theorem on `E ⊕ F`, with the dilations
symmetric and the point-spectral subspaces invariant, in the operator norm, and the dilation
isometry.
*Needs:* Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub`,
`TauCeti.UnitarilyInvariantSeminorm.opNorm`, `LinearMap.isSymmetric_hermitianDilation`,
`Module.End.map_pointSpectralSubspace_le`, `LinearMap.norm_toContinuousLinearMap_hermitianDilation_sub`.

**Checks.**
- For `A = 1` and `Â = −1` on `ℂ` and `Ω = (0, ∞)`, `E_{D(A)}(Ω)` is the line of `(1, 1)` and
  `E_{D(Â)}(Ω)` that of `(1, −1)`; `D(A)` is `1` on the first and `D(Â)` is `−1` on the
  complement of the second, so `δ = 2`. The sine map is the projection onto the line of `(1, 1)`,
  of norm `1`, and the bound reads `2 ≤ (π/2)·2`. A version selecting the same eigenvalue sign on
  both sides of the gap, `D(Â)` on `E_{D(Â)}(Ω)` in place of its complement, would compare `1`
  with `1` and have no gap at all.

### 4.17 Aligned bases

Prove `yuWangSamworth_alignedBasis_le`: let `A` and `B` be symmetric on a finite-dimensional inner
product space of dimension `n`, `U` and `V` corresponding eigenblocks of rank `d` (Convention 9),
and `Δ > 0` the internal gap of `A` at `U`, `Module.End.PointInternalGap A U Δ`. Then `U` and `V`
have orthonormal bases `(uᵢ)` and `(vᵢ)`, `i < d`, with
`(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2} ≤ 2√2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ` (Yu, Wang and Samworth 2015,
Theorem 2, inequality (3), proved there for real matrices and a run of consecutive indices),
`√2` times the bound of the population-gap `sin Θ` theorem. The discrepancy is the Frobenius
norm `(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2}`, with `v` rotated inside `V`. Route: for eigenvectors spanning `U`
the internal gap is the index gap of Tau Ceti's population-gap theorem; the Procrustes alignment
gives a basis `v` of `V` with `∑ᵢ ‖vᵢ − uᵢ‖² ≤ 2 ‖sin Θ(U, V)‖_F²`.
*Needs:* Tau Ceti `LinearMap.IsSymmetric.CorrespondingEigenblocks`, `Module.End.PointInternalGap`,
`LinearMap.IsSymmetric.sinThetaFrobenius_orderedEigenframe_le`,
`TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le`,
`Submodule.sq_sinThetaFrobenius_eq_sinThetaSq_of_orthonormal`.

**Checks.**
- The bases must be chosen. For `B = A` and `U = V` of dimension `2` with orthonormal basis
  `(e₁, e₂)`, the right side is `0`, attained by `v = u`; the bases `u = (e₁, e₂)` and
  `v = (e₂, e₁)` of the same subspace have discrepancy `2`. A statement for arbitrary bases is
  false.

### 4.18 A single eigenvector

Prove `yuWangSamworth_eigenvector_le`: let `A` and `B` be symmetric on a finite-dimensional inner
product space, `u` and `v` unit eigenvectors of `A` and `B` at the same sorted index (their lines
are corresponding eigenblocks), `λ` the eigenvalue of `u`, and `Δ > 0` with `Δ ≤ |λ − ν|` for
every eigenvalue `ν` of `A` on `u⊥`. Then some scalar `c` with `|c| = 1` gives
`‖cv − u‖ ≤ 2√2 ‖B − A‖/Δ`. Over `ℝ`, `c = ±1`, and this is Yu, Wang and Samworth 2015,
Corollary 3, with `c` the sign that makes `⟪cv, u⟫ ≥ 0`. Route: §4.17 with `d = 1`, where
`min(‖B − A‖, ‖B − A‖_F) = ‖B − A‖` and a unit vector of the line of `v` is `cv`.
*Needs:* §4.17.

**Checks.**
- The phase is needed. For `A = diag(1, 0)`, `B = [[1, ε], [ε, 0]]` with `ε = 2/3`, `u = e₁`,
  `λ = 1` and `Δ = 1`, `‖B − A‖ = 2/3` and the bound is `4√2/3 ≈ 1.8856`. The top unit eigenvector
  `v = (2/√5, 1/√5)` gives `‖v − u‖ = (2 − 4/√5)^{1/2} ≈ 0.4595`, while `−v`, also a unit
  eigenvector, gives `(2 + 4/√5)^{1/2} ≈ 1.9465`, above the bound.

### 4.19 Left singular vectors

Let `E` and `F` be finite-dimensional inner product spaces, `A, Â : E → F`, and `a, â, ε` with
`â, ε ≥ 0`, `‖Ax‖ ≤ a‖x‖`, `‖Âx‖ ≤ â‖x‖` and `‖(Â − A)x‖ ≤ ε‖x‖` for every `x`. Let `(u_k)` and
`(û_k)`, `k < dim F`, be the orthonormal eigenvector bases of `AA†` and `ÂÂ†` in decreasing
eigenvalue order (Mathlib's `LinearMap.IsSymmetric.eigenvectorBasis`), the *left singular
vectors*, and let `s` be a set of indices with a squared-singular-value gap `Γ ≥ 0`:
`Γ ≤ |λ_j(AA†) − λ_k(AA†)|` for `j ∈ s`, `k ∉ s`. Prove
`Γ² ∑_{j∈s} ∑_{k∉s} |⟪u_k, û_j⟫|² ≤ 4|s|((a + â)ε)²` (Yu, Wang and Samworth 2015, Theorem 4,
the remark after it, and steps (10)–(11) of its proof). The right form, with `A†A`, `Â†Â` and their eigenvector bases indexed by `k < dim E`, is Tau Ceti's
`LinearMap.sq_mul_sum_sum_norm_inner_rightSingularBasis_sq_le_four_mul_card_mul_sq`, which needs
no sign condition. Route: the right form for `A†` and `Â†`, whose right Gram operators are `AA†`
and `ÂÂ†`, with `‖A†‖ = ‖A‖` and the singular values of the adjoint.
*Needs:* Tau Ceti `LinearMap.sq_mul_sum_sum_norm_inner_rightSingularBasis_sq_le_four_mul_card_mul_sq`,
`LinearMap.rightSingularBasis`, `LinearMap.singularValues_adjoint`, `LinearMap.norm_adjoint_apply_le`;
Mathlib `LinearMap.isSymmetric_adjoint_comp_self`.

**Checks.**
- The left vectors are an eigenbasis of `AA†` indexed by `dim F`. For `A : ℂ → ℂ²`, `x ↦ (x, 0)`,
  `AA† = diag(1, 0)` has eigenbasis `(e₁, e₂)`, with `e₂` in the kernel of `A†`; the vectors
  `σᵢ⁻¹ A vᵢ`, `i < dim E = 1`, give only `e₁`, so a definition through them would not span `F`.

### Examples

- The worked population-gap example is §4.18's Check: there the `sin Θ` theorem gives
  `sin θ ≤ 2‖B − A‖/Δ = 4/3`, and the true value is `sin θ = 1/√5 ≈ 0.447`.
- The two-sided-gap comparison: when interval/exterior gaps `δ` hold in both orientations, between
  `A` on `U` and `B` on `V⊥` and between `B` on `V` and `A` on `U⊥`, the symmetric constant-one
  theorem of Layer 3 (Tau Ceti `TauCeti.UnitarilyInvariantSeminorm.mul_map_sub_starProjection_le_map_sub`)
  gives `δ N(P_U − P_V) ≤ N(B − A)`, without the factor `2` of the population-gap theorem and at
  the price of a hypothesis on `B`. In the example above, with `U` and `V` the top eigenlines,
  both gaps are `4/3` and the projector difference has operator norm `sin θ = 1/√5 ≤ (2/3)/(4/3)`.

### Dependencies

Layer 3 (the pairwise `sin Θ` theorem and the symmetric theorem, Tau Ceti's). Tau Ceti: eigenframes
and corresponding eigenblocks, the Frobenius sine distance, the Procrustes alignment, Hermitian
dilations, singular subspaces and singular bases. Mathlib: eigenvector bases of symmetric operators,
singular values.

## Downstream consumers

- [MathematicalStatisticsNonparametric](../../MathematicalStatisticsNonparametric/README.md) §8.6
  uses `SSP-C16` (§3.16), the dimension-free projector bound, for functional principal components:
  Tau Ceti `Submodule.mul_projectionGap_le_norm_sub` and `Submodule.projectionGap_le_norm_sub_div`,
  resting on `SSP-C15` (§3.15).
- [MathematicalStatisticsHighDimensional](../../MathematicalStatisticsHighDimensional/README.md)
  §8.1 uses `SSP-C17` (§3.17), the residual `sin Θ` theorem, for the leading eigenvector: Tau Ceti
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`.
- [RandomMatrices](../../RandomMatrices/README.md) §1.3 and §2.6 use `SSP-D06` and `SSP-D13`
  (§4.6, §4.13), the Hermitian dilation and its operator-norm perturbation identity: Tau Ceti
  `LinearMap.hermitianDilation` and `LinearMap.norm_toContinuousLinearMap_hermitianDilation_sub`.
- [ProbabilisticAndMetricNumberTheoryPartII](../../ProbabilisticAndMetricNumberTheoryPartII/README.md)
  draws its boundary with this roadmap: its Layer 4 perturbation theory assumes neither an inner
  product nor an adjoint.

## Provenance

This section is secondary and prescribes nothing. An Apache-2.0 implementation of the material of
all four layers exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.).
That implementation adapted its Sylvester and `sin Θ` material from the Spectra Formalization
Project (upstream revision `8dbaaf6728d1342ae16acf79fd7eef7c59b37e63`); its kernel material is
not adapted from it.

## Scope and ownership

**This roadmap owns** the perturbation theory of spectral subspaces of self-adjoint operators:
the Haagerup–Zsidó kernel, Sylvester equations with their bounds and Rosenblum's theorem, the
Davis–Kahan `sin Θ`, `tan Θ`, `sin 2Θ` and `tan 2Θ` theorems, and the Yu–Wang–Samworth variant.
Its targets above are §1.16, §2.5, §2.12, §2.16, §2.17, §2.19, §3.28, §3.29, §3.31, §4.15, §4.17,
§4.18 and the left half of §4.19. The internal gap §0.1 is the member of the separation family with
both spectra from one operator; it belongs here, and the other separation predicates belong to
PrincipalAngles.

**Stated by Tau Ceti.** Every other item of the plan is a declaration of the pinned Tau Ceti, in
the form recorded here (paths under `TauCeti/Analysis/`; the supplier contracts give the
hypotheses). Several are more general than the item: no symmetry or `δ > 0` where the proof needs
none, any unitarily invariant seminorm where the item names one.

| § (label) | Content | Tau Ceti declaration |
|---|---|---|
| 0.1 (`SSP-S01`) | internal point-spectrum gap | `Module.End.PointInternalGap` (`InnerProductSpace/PointSpectrum.lean`) |
| 1.1–1.4 (`SSP-A01`–`A04`) | weight, Laplace transform, real kernel, kernel | `TauCeti.HaagerupZsido.weight`, `.weightLaplaceTransform`, `.realKernel`, `.reciprocalKernel` (`Fourier/HaagerupZsido/Basic.lean`) |
| 1.5–1.8 (`A05`–`A08`) | weight positive and continuous; `L` positive and even | `TauCeti.HaagerupZsido.weight_nonneg`, `.continuous_weight`, `.weightLaplaceTransform_nonneg`, `.weightLaplaceTransform_neg` |
| 1.9–1.13 (`A09`–`A13`) | measurability, oddness, the norm of `k` is the absolute value of `r` | `TauCeti.HaagerupZsido.measurable_realKernel`, `.measurable_reciprocalKernel`, `.realKernel_neg`, `.reciprocalKernel_neg`, `.norm_reciprocalKernel` |
| 1.14 (`A14`) | oscillatory two-sided Laplace integral | `TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs` (`Fourier/ExpNegAbs.lean`) |
| 1.15 (`A15`) | Fourier transform of the two-sided exponential | `TauCeti.fourier_exp_neg_mul_abs`; at rate `2πy`, `TauCeti.Probability.fourier_exp_neg_mul_abs_eq_cauchyPDFReal_zero_loc` |
| 1.17 (`A17`) | Laplace transform of the absolute value of `sin` | `TauCeti.integral_abs_sin_mul_exp_neg_mul_abs` (`SpecialFunctions/Integrals/AbsSinExp.lean`) |
| 1.18 (`A18`) | Poisson summation for the Cauchy kernel | `TauCeti.tsum_exp_neg_mul_abs_int_eq_tsum_div`, `TauCeti.tsum_int_inv_sq_add_sq` (`Fourier/Poisson/CauchyLattice.lean`) |
| 1.19 (`A19`) | odd-pole expansion of the weight | `TauCeti.hasSum_pi_div_two_mul_tanh` (`SpecialFunctions/Trigonometric/TanhSeries.lean`) |
| 1.20 (`A20`) | rational telescoping integral | `TauCeti.HaagerupZsido.integral_weight_mul_mul_inv_sub_inv` (`Fourier/HaagerupZsido/OddPole.lean`) |
| 1.21–1.22 (`A21`–`A22`) | integrability | `TauCeti.HaagerupZsido.integrable_kernelIntegrand`, `.integrable_reciprocalKernel`, `.integrable_realKernel` |
| 1.23 (`A23`) | exterior Fourier identity | `TauCeti.HaagerupZsido.integral_exp_mul_I_mul_reciprocalKernel`; real form `.integral_realKernel_mul_sin` |
| 1.24 (`A24`) | mass `π/2` | `TauCeti.HaagerupZsido.integral_norm_reciprocalKernel`, `.integral_abs_realKernel` |
| 1.25 (`A25`) | Mathlib's normalisation | `TauCeti.HaagerupZsido.fourier_reciprocalKernel` |
| 1.26 (`A26`) | kernel-mass integral bound | `TauCeti.HaagerupZsido.norm_integral_reciprocalKernel_smul_le`, `.integrable_reciprocalKernel_smul` |
| 2.1 (`B01`) | Sylvester map | `ContinuousLinearMap.sylvester` (`InnerProductSpace/Sylvester.lean`) |
| 2.2–2.4 (`B02`–`B04`) | injectivity, canonical solution, coordinate equation | `ContinuousLinearMap.sylvester_injective`, `.sylvester_sum_eigenvectorBasis`, `.sylvester_bijective`, `.sylvester_apply_eq_iff`, `.inner_sylvester_apply_eigenvectorBasis`, `.inner_sylvester_apply_of_apply_eq_smul` |
| 2.6 (`B06`) | Lyapunov bound | `ContinuousLinearMap.add_mul_norm_le_norm_comp_add_comp` |
| 2.7–2.8 (`B07`–`B08`) | separated bounds | `ContinuousLinearMap.mul_norm_le_norm_sylvester_apply_of_le_re_inner_of_re_inner_le`, `.mul_norm_le_norm_sylvester_apply_of_re_inner_le_of_le_re_inner` |
| 2.9–2.10 (`B09`–`B10`) | interval/exterior bounds, both orientations | `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap`, `…_swap` (`InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Basic.lean`) |
| 2.11 (`B11`) | Ky Fan prefixes | `ContinuousLinearMap.mul_kyFanSum_le_pi_div_two_mul_kyFanSum_sylvester_apply` (`…/Sylvester/Pairwise.lean`) |
| 2.13 (`B13`) | pairwise `π/2` bound | `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply` |
| 2.14 (`B14`) | orbit-hull form | `ContinuousLinearMap.smul_mem_twoSidedUnitaryOrbitHull_sylvester_apply` |
| 2.15 (`B15`) | Frobenius bound | `ContinuousLinearMap.mul_frobenius_le_frobenius_sylvester_apply` |
| 3.1 (`C01`) | compression | `ContinuousLinearMap.compression` (`InnerProductSpace/RayleighRitz.lean`) |
| 3.2–3.3 (`C02`–`C03`) | residual, Ritz residual | `A.sylvester M X` and `A.sylvester (A.compression X) X`, with `ContinuousLinearMap.sylvester_compression` |
| 3.4 (`C04`) | minimality of the Ritz residual | `TauCeti.UnitarilyInvariantSeminorm.map_sylvester_compression_le_map_sylvester`, `.sq_frobenius_sylvester_eq_sq_frobenius_sylvester_compression_add` |
| 3.5–3.6 (`C05`–`C06`) | sine and cosine embeddings | Convention 4; `Submodule.sinThetaEmbedding`, `Submodule.sinThetaMap`, `Submodule.cosThetaMap` |
| 3.7–3.8 (`C07`–`C08`) | their singular values | `Submodule.principalSines_range_eq_singularValues`, `.singularValues_sinThetaEmbedding`, `.principalCosines_range_eq_singularValues` |
| 3.9–3.10 (`C09`–`C10`) | reduced extension and its form bounds | `ContinuousLinearMap.reducedExtension`, `.isSymmetric_reducedExtension`, `.re_inner_reducedExtension_self_le_of_pointSpectrumIn`, `.le_re_inner_reducedExtension_self_of_pointSpectrumIn` |
| 3.11–3.14 (`C11`–`C14`) | angular operator, graph subspace, its projection, exact gap | `Submodule.IsAngularOperator`, `Submodule.graphSubspace`, `Submodule.IsAngularOperator.starProjection_graphSubspace`, `.projectionGap_graphSubspace` |
| 3.15–3.16 (`C15`–`C16`) | dimension-free directed and projector bounds | `Submodule.mul_norm_starProjection_comp_starProjection_le_norm_sub`, `.norm_starProjection_comp_starProjection_le_norm_sub_div`, `.mul_directedProjectionGap_le_norm_sub`, `.mul_projectionGap_le_norm_sub`, `.projectionGap_le_norm_sub_div` |
| 3.17 (`C17`) | residual `sin Θ` | `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply` |
| 3.18 (`C18`) | perturbation `sin Θ` | `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`, `…_swap` |
| 3.19 (`C19`) | spectral-subspace residual form | `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_orthogonal_pointSpectralSubspace_comp_le_map_sylvester_apply` |
| 3.20 (`C20`) | eigenspace-projector bound | `Module.End.mul_norm_sub_starProjection_pointSpectralSubspace_le`, `Submodule.mul_projectionGap_le_norm_sub_of_pointIntervalExteriorGap` |
| 3.21–3.22 (`C21`–`C22`) | Frobenius and Ky Fan forms | `TauCeti.UnitarilyInvariantSeminorm.mul_frobenius_starProjection_comp_le_frobenius_sylvester_apply`, `.mul_frobenius_starProjection_comp_starProjection_le_frobenius_sub`, `.mul_kyFan_starProjection_comp_le_kyFan_sylvester_apply`, `.mul_kyFan_starProjection_comp_starProjection_le_kyFan_sub` |
| 3.23 (`C23`) | pairwise `π/2` `sin Θ` | `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub` |
| 3.24 (`C24`) | symmetric constant-one theorem | `TauCeti.UnitarilyInvariantSeminorm.mul_map_sub_starProjection_le_map_sub`, `.mul_map_sinAngleOperator_le_map_sub` |
| 3.25–3.26 (`C25`–`C26`) | per-eigenvector `sin 2θ` | `LinearMap.IsSymmetric.sin_two_theta_le`, `.sin_two_arccos_le` (`InnerProductSpace/DoubleAngle/Vector.lean`) |
| 3.27 (`C27`) | `sin 2Θ` | `TauCeti.UnitarilyInvariantSeminorm.mul_map_sinTwoAngleOperator_le_two_mul_map_sub` |
| 3.30 (`C30`) | per-eigenvector `tan 2θ` | `LinearMap.IsSymmetric.tan_two_theta_le` |
| 4.1 (`D01`) | corresponding eigenblocks | `LinearMap.IsSymmetric.CorrespondingEigenblocks` (`InnerProductSpace/Spectral/Eigenframe.lean`) |
| 4.2 (`D02`) | Frobenius sine distance | `Submodule.sinThetaFrobenius` |
| 4.3 (`D03`) | residual columns | Convention 9 |
| 4.4–4.5 (`D04`–`D05`) | left and right singular subspaces | `LinearMap.leftSingularSubspace`, `LinearMap.rightSingularSubspace` |
| 4.6 (`D06`) | Hermitian dilation | `LinearMap.hermitianDilation` |
| 4.7 (`D07`) | complement identity | `OrthonormalBasis.sq_sinThetaFrobenius_spanIndices`, with `Submodule.sinThetaFrobenius_comm` |
| 4.8–4.10 (`D08`–`D10`) | residual sandwich | `LinearMap.IsSymmetric.sq_mul_sum_sum_norm_inner_sq_le_sum_norm_smul_sub_apply_sq`, `.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_frobenius_sq`, `.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_card_mul_sq` |
| 4.11 (`D11`) | residual decomposition | `LinearMap.IsSymmetric.smul_sub_apply_eigenvectorBasis`, `.norm_smul_sub_apply_eigenvectorBasis_le`, with Weyl's `.abs_eigenvalue_sub_eigenvalue_le` |
| 4.12 (`D12`) | singular-subspace transfer | `LinearMap.mul_norm_sinThetaMap_rightSingularSubspace_le`, `.mul_norm_sinThetaMap_leftSingularSubspace_le` |
| 4.13–4.14 (`D13`–`D14`) | dilation norm and spectrum | `LinearMap.norm_toContinuousLinearMap_hermitianDilation_sub`; `LinearMap.map_fstₗ_pointSpectralSubspace_hermitianDilation`, `.hasEigenvalue_hermitianDilation_iff` and their companions |
| 4.16 (`D16`) | population-gap `sin Θ` | `LinearMap.IsSymmetric.sinThetaFrobenius_orderedEigenframe_le`, `.sinThetaFrobenius_eigenvectorSpan_le` |
| 4.19, right half (`D19`) | right singular vectors | `LinearMap.sq_mul_sum_sum_norm_inner_rightSingularBasis_sq_le_four_mul_card_mul_sq` |

**Owned elsewhere and consumed here.**

- *The domain-aware Sylvester equation*, the `LinearPMap` resolvent and spectrum, the Cayley
  transform and the spectral measure of an unbounded self-adjoint operator:
  [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) (SA-C66, SA-D01–SA-D02,
  SA-D24–SA-D34, Part E). Its solvability and its a priori estimates (§2.16, §2.17) belong here.
- *Unitarily invariant norms*, Ky Fan sums and Fan dominance:
  [Majorization](../Majorization/README.md), stated by Tau Ceti.
- *Principal angles, the projection gap, point-spectral subspaces, the separation predicates and
  the directed sine map*: [PrincipalAngles](../PrincipalAngles/README.md), stated by Tau Ceti.
- *Singular values, the operator modulus and polar decomposition*:
  [PolarDecomposition](../PolarDecomposition/README.md).
- Mathlib's `fuglede_putnam_rosenblum` is a different theorem of Rosenblum's (an intertwiner of
  normal elements intertwines their adjoints) and is not §2.17.

## Exact supplier contracts

### From Mathlib

- `LinearPMap` (`E →ₗ.[𝕜] E`), its adjoint and `IsSelfAdjoint` for partial operators on a complete
  space; `spectrum`; the continuous functional calculus `cfc`; `Ring.inverse`.
- `Submodule.starProjection` and `Submodule.HasOrthogonalProjection`; `LinearMap.IsSymmetric`,
  `LinearMap.IsSymmetric.eigenvalues` (decreasing) and `LinearMap.IsSymmetric.eigenvectorBasis`;
  `LinearMap.isSymmetric_adjoint_comp_self`; `LinearMap.singularValues`.
- `IsCoercive`, `IsCoercive.continuousLinearEquivOfBilin` and `IsCoercive.antilipschitz` (real Lax–Milgram).
- `isLittleO_exp_neg_mul_rpow_atTop` (`e^{−ax} = o(x^b)` as `x → +∞`, for `a > 0`),
  `Filter.cocompact`, `Real.tsum_eq_tsum_fourier_of_rpow_decay` (Poisson summation under decay
  `O(|x|^{−b})`, `b > 1`, of the function and its transform), the Fourier transform `𝓕`.
- `convexHull`, `convexHull_eq_union` (Carathéodory), `NormedSpace.exp`.

### From Tau Ceti

All declarations below are proved at the pin. Paths are under `TauCeti/Analysis/` unless they begin with `TauCeti/`. `𝕜` is
`RCLike`; finite-dimensional statements carry `[FiniteDimensional 𝕜 E]` (and `F`).

*Separation and point spectra* (`InnerProductSpace/PointSpectrum.lean`):
`Module.End.restrictedPointSpectrum A U` (the real `λ` with an eigenvector of `A` in `U`),
`Module.End.PointSpectrumIn A U Ω`, `Module.End.pointSpectralSubspace A Ω` (the span of the
eigenspaces for `λ ∈ Ω`), `Module.End.PointSpectraSeparated A U B V δ`,
`Module.End.PointOrderedGap`, `Module.End.PointIntervalExteriorGap A U B V a b δ` (fields: `A` on
`U` in `[a, b]`, `B` on `V` outside `(a − δ, b + δ)`), and `Module.End.PointInternalGap A U δ`
(fields: `U` is `A`-invariant, and `Module.End.PointSpectraSeparated A U A U⊥ δ`; on any inner
product space, no finite dimension), with `Module.End.PointInternalGap.mono_gap`,
`Module.End.PointInternalGap.of_pointOrderedGap`, `Module.End.PointInternalGap.of_pointSpectrumIn`,
`Module.End.pointInternalGap_pointSpectralSubspace`, `Module.End.pointSpectrumIn_pointSpectralSubspace`,
`Module.End.map_pointSpectralSubspace_le`, `Module.End.PointSpectraSeparated.disjoint`.

*Unitarily invariant seminorms* (`InnerProductSpace/UnitarilyInvariantSeminorm/`, `KyFan.lean`,
`FanDominance.lean`): `TauCeti.UnitarilyInvariantSeminorm 𝕜 E F` (a seminorm on `E →ₗ[𝕜] F` with
`N (U ∘ A ∘ V) = N A` for linear isometric equivalences `U` of `F` and `V` of `E`), its instances
`TauCeti.UnitarilyInvariantSeminorm.opNorm` (`‖A‖`), `.frobenius` (`(∑ᵢ ‖A bᵢ‖²)^{1/2}` for any
orthonormal basis), `.kyFan k` (the sum of the `k` largest singular values,
`LinearMap.kyFanSum`), `TauCeti.UnitarilyInvariantSeminorm.nuclear` and
`TauCeti.UnitarilyInvariantSeminorm.schatten`; `LinearMap.twoSidedUnitaryOrbitHull`,
`TauCeti.UnitaryOrbitCertificate` and `TauCeti.UnitarilyInvariantSeminorm.map_le_of_mem_twoSidedUnitaryOrbitHull`
(`N X ≤ N C` on the hull); Fan dominance `TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`.

*The Haagerup–Zsidó kernel* (`Fourier/HaagerupZsido/`, namespace `TauCeti.HaagerupZsido`): the
definitions of Convention 7 and, for all real `t` unless stated, `weight_nonneg` (`y ≥ 0`),
`continuous_weight`, `weightLaplaceTransform_nonneg`, `weightLaplaceTransform_neg`,
`measurable_realKernel`, `measurable_reciprocalKernel`, `realKernel_neg`, `reciprocalKernel_neg`,
`norm_reciprocalKernel` (`‖k(t)‖ = |r(t)|`), `abs_realKernel_le` (`|r(t)| ≤ π/(2(1 + t²))`),
`integrable_realKernel`, `integrable_reciprocalKernel`; the product integrand `kernelIntegrand` on
`(0, ∞) × ℝ` with `integrable_kernelIntegrand`; `integral_weight_mul_mul_inv_sub_inv` (for `a ≥ 0`,
`∫_{y>0} w(y) y ((y² + a²)⁻¹ − (y² + (a + 2)²)⁻¹) dy = 2/(a + 1)`);
`integral_exp_mul_I_mul_reciprocalKernel` (for `1 ≤ |x|`, `∫ e^{ixt} k(t) dt = 1/x`) and
`integral_realKernel_mul_sin` (`∫ r(t) sin(xt) dt = 1/x`); `fourier_reciprocalKernel` (for
`1 ≤ 2π|ξ|`, `𝓕 k (ξ) = −1/(2πξ)`); `integral_norm_reciprocalKernel` and `integral_abs_realKernel`
(`π/2`); and, for `G` a complex normed space and `F : ℝ → G` with `‖F(t)‖ ≤ C` almost everywhere,
`integrable_reciprocalKernel_smul` (when `F` is a.e. strongly measurable) and
`norm_integral_reciprocalKernel_smul_le` (`‖∫ k(t) F(t) dt‖ ≤ (π/2) C`). The two-sided
exponential: `TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs` (for `a > 0`,
`∫ e^{ibx} e^{−a|x|} dx = 2a/(a² + b²)`), `TauCeti.fourier_exp_neg_mul_abs`
(`𝓕 (e^{−a|x|}) (ξ) = 2a/(a² + (2πξ)²)`) and
`TauCeti.Probability.fourier_exp_neg_mul_abs_eq_cauchyPDFReal_zero_loc` (the rate `2πγ`, with the
Cauchy density `γ/(π(ξ² + γ²))`); `TauCeti.integral_abs_sin_mul_exp_neg_mul_abs` (for `a > 0`,
`∫ |sin t| e^{−a|t|} dt = 2(1 + e^{−πa})/((1 − e^{−πa})(1 + a²))`); the Cauchy lattice
`TauCeti.tsum_exp_neg_mul_abs_int_eq_tsum_div` (for `y > 0`,
`∑_{n∈ℤ} e^{−2πy|n|} = ∑_{n∈ℤ} y/(π(y² + n²))`) and `TauCeti.tsum_int_inv_sq_add_sq`
(`∑_{n∈ℤ} (y² + n²)⁻¹ = (π/y)(1 + e^{−2πy})/(1 − e^{−2πy})`); and the odd-pole expansion
`TauCeti.hasSum_pi_div_two_mul_tanh` (for every real `y`,
`∑_{n≥0} 2y/(y² + (2n + 1)²) = (π/2) tanh(πy/2)`, which for `y > 0` is
`w(y)/y = (4/π) ∑_{n≥0} (y² + (2n + 1)²)⁻¹`).

*The Sylvester operator* (`InnerProductSpace/Sylvester.lean`, `…/UnitarilyInvariantSeminorm/Sylvester/`):
`ContinuousLinearMap.sylvester` (`X ↦ AX − XB`, over any normed field) with
`ContinuousLinearMap.sylvester_apply`. In finite dimension, for symmetric `A` and `B` whose point
spectra are disjoint: `ContinuousLinearMap.sylvester_injective`, `.sylvester_bijective`,
`.sylvester_sum_eigenvectorBasis` and `.sylvester_apply_eq_iff` (the solution is
`∑ᵢⱼ (αᵢ − βⱼ)⁻¹ ⟪uᵢ, C vⱼ⟫ uᵢ ⊗ vⱼ`); `.inner_sylvester_apply_eigenvectorBasis` and, for an
eigenvector `u` of symmetric `A` and `v` of `B` in any dimension,
`.inner_sylvester_apply_of_apply_eq_smul` (`⟪u, (AX − XB)v⟫ = (α − β)⟪u, Xv⟫`). On any inner
product spaces, with `A`, `B` bounded and not necessarily symmetric:
`.add_mul_norm_le_norm_comp_add_comp` (if `α‖x‖² ≤ Re⟪Ax, x⟫` and `β‖y‖² ≤ Re⟪By, y⟫`, then
`(α + β)‖X‖ ≤ ‖AX + XB‖`; the Lyapunov bound is `α = β = δ`),
`.mul_norm_le_norm_sylvester_apply_of_le_re_inner_of_re_inner_le` (if `(c + g)‖x‖² ≤ Re⟪Ax, x⟫` and
`Re⟪By, y⟫ ≤ c‖y‖²`, then `g‖X‖ ≤ ‖AX − XB‖`) and
`.mul_norm_le_norm_sylvester_apply_of_re_inner_le_of_le_re_inner` (the reverse). In finite
dimension, for symmetric `A`, `B` and every unitarily invariant `N` on `F → E`:
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap`
(spectrum of `A` in `[a, b]`, of `B` outside `(a − δ, b + δ)`: `δ N(X) ≤ N(AX − XB)`) and its
`_swap` (the roles exchanged), with subspace forms `_of_mem`;
`ContinuousLinearMap.mul_kyFanSum_le_pi_div_two_mul_kyFanSum_sylvester_apply` (pairwise separation
by `δ`: `δ K_k(X) ≤ (π/2) K_k(AX − XB)` for every `k`);
`ContinuousLinearMap.smul_mem_twoSidedUnitaryOrbitHull_sylvester_apply` (for `δ ≥ 0`, `(2δ/π) X`
lies in the convex hull of the two-sided unitary orbit of `AX − XB`);
`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`
(`δ N(X) ≤ (π/2) N(AX − XB)`); `ContinuousLinearMap.mul_frobenius_le_frobenius_sylvester_apply`
(`δ ‖X‖_F ≤ ‖AX − XB‖_F`). None of these needs `δ > 0`.

*Coercive operators* (`InnerProductSpace/Coercive.lean`, `Normed/Operator/Basic.lean`):
`ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive` (if `c‖z‖² ≤ Re⟪Nz, z⟫` for all `z`, then
`c‖z‖ ≤ ‖Nz‖`), `ContinuousLinearMap.isUnit_of_coercive` (on a complete space with `c > 0`, `N` is
a unit), `ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le` (a unit `A` with
`‖x‖ ≤ M‖Ax‖`, `M ≥ 0`, has `‖Ring.inverse A‖ ≤ M`); the Lax–Milgram API in
`InnerProductSpace/LaxMilgram.lean`.

*Partial operators* (`TauCeti/Topology/Algebra/Module/LinearPMap/`, `InnerProductSpace/LinearPMap/`,
`Normed/Operator/LinearPMap/`): `LinearPMap.resolventSet` and `LinearPMap.spectrum` (Convention 2),
`ContinuousLinearMap.spectrum_toPMap_top`; `LinearPMap.realSpectrum` and
`LinearPMap.SpectralSetsSeparated A B s t d` (`d ≤ |a − b|` for real spectral points `a ∈ s` of
`A` and `b ∈ t` of `B`); `IsSelfAdjoint.spectrum_subset_im_eq_zero`;
`LinearPMap.SylvesterEquation A B X C` (fields: `X` maps the domain of `B` into that of `A`, and
`A(Xy) − X(By) = Cy` there) with `LinearPMap.SylvesterEquation.ofBounded_iff` (for bounded `A`, `B`
as total partial operators it is `AX − XB = C`); `LinearPMap.isSelfAdjoint_toPMap_top`;
`LinearPMap.Intertwines A B X` (for `X : E → F`, `XA ⊆ BX`),
`ContinuousLinearMap.intertwines_toPMap_top_iff`, `LinearPMap.intertwines_iff_comp_resolvent_eq`
(at common resolvent points, intertwining is `X R_A(z) = R_B(z) X`); over `ℂ`, `LinearPMap.cayley`
and `LinearPMap.Intertwines.comp_cfc_cayley_eq` (for self-adjoint `A`, `B`, an intertwiner
intertwines `f` of the Cayley transforms for every `f` continuous on their spectra);
`ContinuousLinearMap.comp_cfc_eq_cfc_comp` (the same for bounded operators). Stone's theorem
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Semigroups/Group/Stone/Unbounded.lean`:
a self-adjoint `A` on a complex Hilbert space has exactly one unitary group with complex generator
`iA`).

*Trial maps, angles and graph subspaces* (`InnerProductSpace/RayleighRitz.lean`,
`InnerProductSpace/Projection/`): `ContinuousLinearMap.compression` (complete spaces);
`ContinuousLinearMap.sylvester_compression` (for an isometry `X` with a projection onto its range,
the Ritz residual is `P_{(range X)⊥} A X`);
`TauCeti.UnitarilyInvariantSeminorm.map_sylvester_compression_le_map_sylvester` (for an isometry
`X`, the Ritz residual minimises `N(AX − XM)` over `M`, every `N`) and
`.sq_frobenius_sylvester_eq_sq_frobenius_sylvester_compression_add` (the Pythagoras identity);
`Submodule.sinThetaMap`, `Submodule.cosThetaMap`, `Submodule.sinThetaEmbedding`,
`Submodule.principalSines`, `Submodule.principalCosines`, `Submodule.principalAngles`,
`Submodule.principalTangents`, `Submodule.projectionGap`, `Submodule.directedProjectionGap`,
`Submodule.projectionGap_eq_max`, `Submodule.projectionGap_eq_directedProjectionGap_of_finrank_eq`;
`Submodule.principalSines_range_eq_singularValues` and
`Submodule.principalCosines_range_eq_singularValues` (for an isometry `X` between
finite-dimensional spaces, the principal sines and cosines from `range X` to `V` are the singular
values of `P_{V⊥} X` and `P_V X`), `Submodule.singularValues_sinThetaEmbedding`;
`Submodule.directedProjectionGap_lt_one_iff` (gap `< 1` iff `U ∩ V⊥ = 0`),
`Submodule.forall_principalAngles_lt_pi_div_two_iff_directedProjectionGap_lt_one`,
`Submodule.forall_principalAngles_lt_pi_div_four_iff` (all angles `< π/4` iff directed gap
`< √2/2`); `Submodule.tanThetaMap Z U` (Convention: the tangent map of §3.28, a linear map
`Z → E`) with `Submodule.singularValues_tanThetaMap` (when the directed gap from `Z` to `U` is
below `1`, its singular values are the principal tangents); `ContinuousLinearMap.reducedExtension`
(`A P_U + κ P_{U⊥}`), `ContinuousLinearMap.isSymmetric_reducedExtension`,
`ContinuousLinearMap.re_inner_reducedExtension_self_le_of_pointSpectrumIn` and
`ContinuousLinearMap.le_re_inner_reducedExtension_self_of_pointSpectrumIn` (for symmetric `T`, an
invariant finite-dimensional block `W` with point spectrum in `(−∞, c]`, resp. `[c, ∞)`, and the
scalar `κ` on the same side: the global form bound); `Submodule.IsAngularOperator`
(`XP_U = X`, `P_U X = 0`), `Submodule.graphSubspace` (`{u + Xu : u ∈ U}`),
`Submodule.IsAngularOperator.starProjection_graphSubspace` (on a complete space,
`P_graph = (P_U + X)(1 + X†X)⁻¹(P_U + X)†`), `Submodule.IsAngularOperator.projectionGap_graphSubspace`
(`‖P_U − P_graph‖ = ‖X‖/√(1 + ‖X‖²)`).

*The `sin Θ` family* (`InnerProductSpace/Projection/SinTheta.lean`,
`…/UnitarilyInvariantSeminorm/SinTheta/`, `…/Projection/SpectralPerturbation.lean`,
`…/DoubleAngle/Vector.lean`): `Submodule.mul_norm_starProjection_comp_starProjection_le_norm_sub`
and `.norm_starProjection_comp_starProjection_le_norm_sub_div` (on any inner product space, for
`B` symmetric, `U` `A`-invariant and `W` `B`-invariant with projections, `(c + g)‖u‖² ≤ Re⟪Au, u⟫`
on `U` and `Re⟪Bw, w⟫ ≤ c‖w‖²` on `W`: `g ‖P_W P_U‖ ≤ ‖B − A‖`);
`Submodule.mul_directedProjectionGap_le_norm_sub` (the same with `W = V⊥`) and
`Submodule.mul_projectionGap_le_norm_sub`, `Submodule.projectionGap_le_norm_sub_div` (both
orientations, constants `c` and `c'`: `g ‖P_U − P_V‖ ≤ ‖B − A‖`); in finite dimension, for
symmetric `A`, `B` and every unitarily invariant `N`:
`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply` (spectrum
of `M` in `[a, b]`, of `A` on `U⊥` outside `(a − δ, b + δ)`, `U` `A`-invariant, any `X`:
`δ N(P_{U⊥} X) ≤ N(AX − XM)`), `.mul_map_starProjection_comp_starProjection_le_map_sub` and `_swap`
(interval/exterior separation of `A` on `U` from `B` on `V⊥`: `δ N(P_{V⊥} P_U) ≤ N(B − A)`),
`.mul_map_starProjection_orthogonal_pointSpectralSubspace_comp_le_map_sylvester_apply` and its
`_Ioo` form (the residual form for a point-spectral subspace),
`Module.End.mul_norm_sub_starProjection_pointSpectralSubspace_le` and
`Submodule.mul_projectionGap_le_norm_sub_of_pointIntervalExteriorGap` (equal ranks:
`δ ‖P_U − P_V‖ ≤ ‖B − A‖`), `Submodule.mul_norm_sinThetaMap_le_norm_sub_of_pointIntervalExteriorGap`,
the Frobenius and Ky Fan forms `TauCeti.UnitarilyInvariantSeminorm.mul_frobenius_starProjection_comp_le_frobenius_sylvester_apply`,
`.mul_frobenius_starProjection_comp_starProjection_le_frobenius_sub`,
`.mul_kyFan_starProjection_comp_le_kyFan_sylvester_apply`,
`.mul_kyFan_starProjection_comp_starProjection_le_kyFan_sub`,
`.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub` (pairwise separation of
`A` on `U` from `B` on `V⊥`: `δ N(P_{V⊥} P_U) ≤ (π/2) N(B − A)`),
`.mul_map_sub_starProjection_le_map_sub` and `.mul_map_sinAngleOperator_le_map_sub`
(interval/exterior gaps in both orientations, with independent intervals and a common `δ`:
`δ N(P_U − P_V) ≤ N(B − A)`), `.mul_map_sinTwoAngleOperator_le_two_mul_map_sub` (if
`Re⟪Az, z⟫ ≤ a‖z‖²` on `U⊥` and `b‖y‖² ≤ Re⟪Ay, y⟫` on `U`, then
`(b − a) N(2 P_{U⊥} P_V P_U) ≤ 2 N(B − A)`); on any inner product space, for symmetric `T`, `H`
and `U` `T`-invariant with `b‖u‖² ≤ Re⟪Tu, u⟫` on `U`, `Re⟪Tw, w⟫ ≤ a‖w‖²` on `U⊥` and
`‖Hv‖ ≤ ε‖v‖`, and `x` with `Tx + Hx = μx`: `LinearMap.IsSymmetric.sin_two_theta_le` (`‖x‖ = 1`:
`(b − a)‖P_U x‖‖P_{U⊥} x‖ ≤ ε`), `.sin_two_arccos_le` (`(b − a) sin(2 arccos ‖P_U x‖) ≤ 2ε`) and
`.tan_two_theta_le` (both diagonal blocks of `H` zero:
`(b − a)‖P_U x‖‖P_{U⊥} x‖ ≤ |‖P_U x‖² − ‖P_{U⊥} x‖²| ε`).

*Yu–Wang–Samworth* (`InnerProductSpace/Spectral/Eigenframe.lean`, `…/YuWangSamworth/`,
`…/HermitianDilation/`, `…/SingularSubspace/`, `…/Orthonormal/`, `…/Projection/FrobeniusSine.lean`,
`…/CourantFischer.lean`): `LinearMap.IsSymmetric.IsOrderedEigenframe` and
`LinearMap.IsSymmetric.CorrespondingEigenblocks hA hB hn e U V` (for `e : ι ↪ Fin n`, `U` and `V`
are spans of orthonormal eigenvectors of `A` and `B` with the eigenvalues at the indices `e i`);
`LinearMap.IsSymmetric.eigenvectorSpan`; `Submodule.sinThetaFrobenius` (Convention 9) with
`Submodule.sinThetaFrobenius_comm` (equal dimensions) and
`Submodule.sq_sinThetaFrobenius_eq_sinThetaSq_of_orthonormal`;
`OrthonormalBasis.sq_sinThetaFrobenius_spanIndices` (for orthonormal bases `a`, `b` and index sets
`s`, `t`, `‖sin Θ(span b_t, span a_s)‖_F² = ∑_{j∈t} ∑_{k∉s} |⟪a_k, b_j⟫|²`);
`LinearMap.IsSymmetric.sq_mul_sum_sum_norm_inner_sq_le_sum_norm_smul_sub_apply_sq` (for `Δ ≥ 0`
and an index gap `Δ ≤ |λ_j(A) − λ_k(A)|`, `j ∈ s`, `k ∉ s`, and any vectors `w_j`:
`Δ² ∑_{j∈s} ∑_{k∉s} |⟪u_k, w_j⟫|² ≤ ∑_{j∈s} ‖λ_j(A) w_j − A w_j‖²`),
`.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_frobenius_sq`
(`∑_{j∈s} ‖R_j‖² ≤ 4‖B − A‖_F²`) and `.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_card_mul_sq` (with
`‖(B − A)x‖ ≤ ε‖x‖`: `∑_{j∈s} ‖R_j‖² ≤ 4|s|ε²`), their frame forms
`.sum_sq_norm_frameResidual_le` and `.sum_sq_norm_frameResidual_le_of_opNorm`;
`.smul_sub_apply_eigenvectorBasis` and `.norm_smul_sub_apply_eigenvectorBasis_le` (the residual
column splits into an eigenvalue-displacement term and `(B − A) v_j`) with Weyl's inequality
`LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le`;
`LinearMap.IsSymmetric.sinThetaFrobenius_orderedEigenframe_le` and
`.sinThetaFrobenius_eigenvectorSpan_le` (for corresponding blocks of rank `d` and an index gap
`δ > 0` of `A`: `‖sin Θ(U, V)‖_F ≤ 2 min(√d ‖B − A‖, ‖B − A‖_F)/δ`);
`TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le` (Procrustes: orthonormal `u`, `v` admit an
orthonormal `w` spanning the span of `v` with `∑ⱼ ‖wⱼ − uⱼ‖² ≤ 2 sin²_F Θ`, `TauCeti.sinThetaSq`);
`LinearMap.leftSingularSubspace A Ω` and `LinearMap.rightSingularSubspace A Ω` (point-spectral
subspaces of `AA†` and `A†A` for a set `Ω` of squared singular values);
`LinearMap.mul_norm_sinThetaMap_rightSingularSubspace_le` and
`LinearMap.mul_norm_sinThetaMap_leftSingularSubspace_le` (interval/exterior gap of `A†A` on
`U_R` from `Â†Â` on `Û_R⊥`, resp. of `AA†`, `ÂÂ†`:
`δ ‖sin Θ‖ ≤ (‖Â‖ + ‖A‖)‖Â − A‖`), with `ContinuousLinearMap.norm_adjoint_comp_self_sub_adjoint_comp_self_le`;
`LinearMap.hermitianDilation` (`[[0, A†], [A, 0]]` on `WithLp 2 (E × F)`),
`LinearMap.isSymmetric_hermitianDilation`,
`LinearMap.norm_toContinuousLinearMap_hermitianDilation_sub`
(`‖D(A) − D(B)‖ = ‖A − B‖`), `LinearMap.mem_eigenspace_hermitianDilation_iff`,
`LinearMap.map_fstₗ_pointSpectralSubspace_hermitianDilation` (and the `sndₗ` form: the
point-spectral subspace of `D(A)` for `Ω` projects onto the right, resp. left, singular subspace
for the squares of `Ω`), `LinearMap.hasEigenvalue_hermitianDilation_iff` (for `μ ≠ 0`, `μ` is an
eigenvalue of `D(A)` iff `μ²` is one of `A†A`), `LinearMap.finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self`;
`LinearMap.rightSingularBasis` (the eigenvector basis of `A†A`), `LinearMap.singularValues_adjoint`,
`LinearMap.norm_adjoint_apply_le`, and
`LinearMap.sq_mul_sum_sum_norm_inner_rightSingularBasis_sq_le_four_mul_card_mul_sq` (for
`‖Ax‖ ≤ a‖x‖`, `‖Âx‖ ≤ â‖x‖`, `‖(Â − A)x‖ ≤ ε‖x‖`, `Γ ≥ 0` and a gap
`Γ ≤ |σ_j(A)² − σ_k(A)²|`: `Γ² ∑_{j∈s} ∑_{k∉s} |⟪v_k(A), v_j(Â)⟫|² ≤ 4|s|((a + â)ε)²`).

### From TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory

From [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md), for a self-adjoint
`A : H →ₗ.[ℂ] H`: SA-E01 (the spectral projection-valued measure on `ℝ`), SA-E02 (no diagonal
measure of the Cayley spectral measure charges the point `1`), SA-E05 (the resolvent formula
`⟪ξ, R(z)ξ⟫ = ∫ (z − s)⁻¹ dμ_ξ(s)`), SA-E06 and SA-E07 (spectral projections commute with
resolvents and preserve the domain), SA-E08 (the spectral measure vanishes on Borel sets of
resolvent points), SA-E31 (spectral projections of bounded intervals exhausting `ℝ` converge
strongly to the identity) and SA-E37 (the range of the spectral projection of a bounded set lies
in the domain, where `A` acts boundedly). §2.16 and §2.17 consume them.

## References

- C. Davis, W. M. Kahan, *The rotation of eigenvectors by a perturbation. III*, SIAM J. Numer.
  Anal. **7** (1970), 1–46 — the principal worked source.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6** (1963),
  159–173 — the `sin 2θ` theorem.
- M. Rosenblum, *On the operator equation BX − XA = Q*, Duke Math. J. **23** (1956), 263–269.
- R. Bhatia, C. Davis, A. McIntosh, *Perturbation of spectral subspaces and solution of linear
  operator equations*, Linear Algebra Appl. **52/53** (1983), 45–67.
- S. Albeverio, K. A. Makarov, A. K. Motovilov, *Graph subspaces and the spectral shift function*,
  Canad. J. Math. **55** (2003), 449–503; arXiv:math/0105142, whose version 3 fixes the numbering
  cited.
- A. Seelmann, *Notes on the sin 2Θ theorem*, Integral Equations Operator Theory **79** (2014),
  579–597; arXiv:1310.2036, whose version 1 fixes the numbering cited.
- V. Kostrykin, K. A. Makarov, A. K. Motovilov, *A generalization of the tan 2Θ theorem*, Oper.
  Theory Adv. Appl. **149** (2004), 349–372; arXiv:math/0302020, whose version 1 fixes the
  numbering cited.
- R. Bhatia, *Matrix Analysis*, GTM 169, Ch. VII.2 — the separated bound of Layer 2 (§2.7) is the
  half-line case of Theorem VII.2.3, by an integral-free proof.
- Y. Yu, T. Wang, R. J. Samworth, *A useful variant of the Davis–Kahan theorem for
  statisticians*, Biometrika **102** (2015), 315–323; arXiv:1405.0680, whose version 1 fixes the
  numbering cited.
