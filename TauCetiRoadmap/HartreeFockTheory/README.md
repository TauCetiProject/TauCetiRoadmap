# Roadmap: Hartree–Fock theory in a finite-dimensional one-particle space

**Summary.** This roadmap treats Hartree–Fock theory for `N` fermions whose one-particle space is
finite-dimensional: the space of functions on a finite set `ι` (an orbital basis or a lattice), so
that every operator is a matrix. The analytic theory of atoms and molecules, with Coulomb
potentials on `L²(ℝ³)`, is not treated. The data are a Hermitian one-body matrix `T`, a Hermitian
two-body matrix `V` on pairs of indices with the exchange symmetry `⟨qp|V|sr⟩ = ⟨pq|V|rs⟩`, and the
particle number `N`. The Hartree–Fock functional `E(γ) = tr(Tγ) + ½ tr(V(1 − Ex)(γ ⊗ γ))` is a
quadratic function of a matrix `γ`; the `N`-fermion space is the space of antisymmetric functions
on `ι^N`, and a Slater determinant is the normalised determinant `det[φⱼ(xᵢ)]` of `N` orbitals.

The headline theorems are these.

- **Hartree–Fock equations.** If a projection `γ` of rank `N` is a local minimiser of `E` among
  the projections of rank `N`, then the Fock operator `F(γ) = T + J(γ) − K(γ)` commutes with `γ`.
- **Lieb's variational principle.** If `V` is nonnegative on antisymmetric two-particle vectors,
  then for every matrix `γ` with `0 ≤ γ ≤ 1` and `tr γ = N` there is a projection `P` of rank `N`
  with `E(P) ≤ E(γ)`; if `V` is positive there, every minimiser over this convex set is a
  projection. Positivity on antisymmetric vectors cannot be dropped.
- **There are no unfilled shells** (Bach, Lieb, Loss and Solovej). If `V` is positive on nonzero
  antisymmetric two-particle vectors and `γ` minimises `E` among the projections of rank `N`,
  every occupied unit vector has a strictly smaller Fock energy than every empty one, and every
  eigenvector of `F(γ)` is occupied or empty.
- **Coleman's theorem.** A matrix is the one-particle density matrix of a mixed state of `N`
  fermions exactly when `0 ≤ γ ≤ 1` and `tr γ = N`; the extreme points of this set are the
  projections of rank `N`, the density matrices of Slater determinants.

Around them stand the Slater–Condon rules, Brillouin's theorem and Thouless' parametrisation of
determinants not orthogonal to a given one.

The roadmap rests on the pinned libraries: Tau Ceti's Cauchy–Binet expansion of the determinant of
a product, its Kronecker powers of matrices and partial traces, and its Rado theorem on
permutation orbits (the combinatorial core of Coleman's theorem); Mathlib's spectral theorem,
Loewner order and exterior powers. Its many-body space is the finite-dimensional, first-quantised
case of the fermionic sector of QuantumFoundations, and it is identified with Mathlib's exterior
power. It is meant as a foundation: configuration interaction and coupled cluster rest on the
Slater–Condon rules and Thouless' theorem, density-matrix functionals on Coleman's theorem and
Lieb's principle, and self-consistent-field iterations on the Fock map and the gap of Layer 1.

Layer 1 below is matrix theory on one-particle density matrices and stands alone. Layer 2 builds
the `N`-fermion space, its Slater determinants and one-particle density matrices, and connects
them to Layer 1.

## Conventions

- **One-particle space.** `ι` is a finite type with decidable equality, `n = card ι`; vectors are
  `ι → ℂ` with inner product `⟨x, y⟩ = star x ⬝ᵥ y = ∑ₚ conj(x p) y p`, conjugate-linear in the
  first argument (Mathlib's inner product on `EuclideanSpace ℂ ι` under `WithLp.toLp 2`).
  `IsOrthonormal φ` says `⟨φ i, φ j⟩ = δᵢⱼ`; it is Mathlib's `Orthonormal ℂ` for the family
  `WithLp.toLp 2 ∘ φ` in `EuclideanSpace ℂ ι`, since the inner products agree. `orbitalDensity φ`
  is `∑ᵢ |φᵢ⟩⟨φᵢ|`, written with Mathlib's `Matrix.vecMulVec (φ i) (star (φ i))`; for an
  orthonormal family it is the orthogonal projection onto its span. Real orbitals are the special
  case of real entries; there is no separate real theory.
- **Density matrices.** `IsAdmissible N γ` means `γ` positive semidefinite, `1 − γ` positive
  semidefinite and `tr γ = N` (with `N` cast to `ℂ`). Positivity is Mathlib's `Matrix.PosSemidef`
  for the order on `ℂ` of the scope `ComplexOrder`; under `open scoped MatrixOrder` the first two
  conditions are `0 ≤ γ` and `γ ≤ 1` in the Loewner order (Mathlib's `Matrix.nonneg_iff_posSemidef`
  and `Matrix.le_iff`). `IsRankProjection N γ` means `γ` Hermitian, `γ * γ = γ`, `tr γ = N`. Both
  sets are empty when `N > n` (the trace of `γ ≤ 1` is at most `n`).
- **Two-body operators.** `V : Matrix (ι × ι) (ι × ι) ℂ` with `V (p, q) (r, s) = ⟨pq|V|rs⟩`:
  particle one goes from `r` to `p`, particle two from `s` to `q` (physicists' notation; the
  chemists' `(pr|qs)` is the same number). For vectors, `⟨ab|V|cd⟩` is
  `⟨a ⊗ b, V (c ⊗ d)⟩` with `(a ⊗ b) (p, q) = a p * b q`. *Exchange symmetry* is
  `V.submatrix Prod.swap Prod.swap = V`, that is `⟨qp|V|sr⟩ = ⟨pq|V|rs⟩`; it is stated as a
  hypothesis wherever a statement uses it, and Hermiticity `V.IsHermitian` likewise.
  `antisymmProduct x y` is the two-particle vector `x ⊗ y − y ⊗ x`.
  `IsNonnegOnAntisymm V` says `0 ≤ re ⟨ψ, V ψ⟩` for every `ψ` with `ψ (q, p) = −ψ (p, q)`, and
  `IsPosOnAntisymm V` says `0 < re ⟨ψ, V ψ⟩` for every nonzero such `ψ`. For `n = 1` the only
  antisymmetric `ψ` is `0`, so both hold for every `V`.
- **Direct, exchange and Fock operators.** `direct V γ p r = ∑_{q,s} V (p, q) (r, s) γ s q`
  (`J`), `exchangeTerm V γ p r = ∑_{q,s} V (p, q) (s, r) γ s q` (`K`), and
  `fockOperator T V γ = T + J(γ) − K(γ)` (`F`). In Tau Ceti's partial trace,
  `J(γ) = Matrix.partialTraceRight (V * (1 ⊗ₖ γ))` and
  `K(γ) = Matrix.partialTraceRight (V * Ex * (1 ⊗ₖ γ))`, where `Ex` is the flip matrix
  `(Equiv.prodComm ι ι).permMatrix ℂ` (symmetric, so its orientation does not matter); by
  `Matrix.partialTraceRight_apply` both are the displayed sums.
- **The functional.** `hfEnergy T V γ = re tr(Tγ) + ½ re tr((J(γ) − K(γ)) γ)`, defined for every
  matrix `γ`. In index form it is
  `re ∑ T p q γ q p + ½ re ∑ V (p, q) (r, s) (γ r p γ s q − γ s p γ r q)`, and it equals
  `re tr(Tγ) + ½ re tr(V (1 − Ex) (γ ⊗ₖ γ))`. For a Hermitian `γ` the two traces are real; the
  real part is taken so that the functional is real-valued on all matrices. The functional depends
  on `V` only through its exchange symmetrisation `½(V + V.submatrix Prod.swap Prod.swap)`, and
  in fact only through `Pₐ V Pₐ`, `Pₐ = ½(1 − Ex)` the projection onto antisymmetric two-particle
  vectors: `γ ⊗ₖ γ` commutes with `Ex`, so `tr(V Pₐ (γ ⊗ₖ γ)) = tr(Pₐ V Pₐ (γ ⊗ₖ γ))`. This is why
  positivity of `V` on antisymmetric vectors is the natural hypothesis of Lieb's principle and of
  1.4. For a Hermitian `γ`, `re tr(Tγ) = tr(T′γ)` with `T′ = ½(T + Tᴴ)`, and the two-body term
  likewise sees only `½(V + Vᴴ)`; so a statement without Hermiticity hypotheses (1.1, 1.3,
  `pairInteraction_le_of_isMinOn`) is in effect about these Hermitian parts, while the Fock
  operator is built from `T` and `V` as given, which is why the commutation statements (1.2, the
  second part of 1.4, 2.5) assume `T` and `V` Hermitian. `pairInteraction V x y = ½ re ⟨x ⊗ y − y ⊗ x, V (x ⊗ y − y ⊗ x)⟩` (`W(x, y)`); for an
  exchange-symmetric `V` it equals `re(⟨xy|V|xy⟩ − ⟨xy|V|yx⟩)`.
- **The `N`-fermion space** (Layer 2). Functions `ψ : (Fin N → ι) → ℂ` with the inner product
  `star ψ ⬝ᵥ χ`, a sum over all `N`-tuples (no factor `1/N!`). `antisymmSubmodule N ι` consists of
  the `ψ` with `ψ (x ∘ σ) = sign σ • ψ x`. `slater φ x = (√N!)⁻¹ det [φ j (x i)]`: rows are
  particles, columns are orbitals, and the normalisation makes `slater φ` a unit vector for
  orthonormal `φ`. Changing one orbital is replacing one column (`Function.update φ i a`), so no
  permutation sign ever appears. For `N = 0` the type `Fin 0 → ι` has one element, the
  antisymmetric space is `ℂ`, `slater` of the empty family is the constant `1`, and all sums over
  particles are empty. For `N > n` (in particular for `ι` empty and `N ≥ 1`) every tuple repeats an
  index and the antisymmetric space is `0`.
- **Many-body objects.** `manyBodyHamiltonian N T V` is `∑ₖ Tₖ + ∑_{k<l} V_{kl}` as a matrix on
  `Fin N → ι`: its entry at `(x, y)` is the sum of `T (x k) (y k)` over the `k` with `x`, `y`
  agreeing off `k`, plus the sum of `V (x k, x l) (y k, y l)` over the pairs `k < l` with `x`, `y`
  agreeing off `{k, l}`. With `T` and `V` Hermitian it is Hermitian. For an exchange-symmetric `V`
  it maps antisymmetric functions to antisymmetric functions: conjugating `V_{kl}` by the
  transposition of particles `k` and `l` gives the operator of `V.submatrix Prod.swap Prod.swap`,
  which is `V`. Without exchange symmetry this fails. A mixed state is a matrix
  `ρ : Matrix (Fin N → ι) (Fin N → ι) ℂ`; `IsFermionicState N ρ` says `ρ` positive semidefinite,
  of trace `1`, with antisymmetric columns (hence, being Hermitian, antisymmetric rows); for a
  unit antisymmetric `ψ` the pure state is `Matrix.vecMulVec ψ (star ψ)`, with entries
  `ψ x * conj (ψ y)`. `oneRDM ρ p q` is the sum of `ρ x y` over the particles `k` and the pairs
  `x, y` that agree off `k` with `x k = p`, `y k = q`. Its trace is `N tr ρ`: the normalisation is
  `tr γ = N`, not `1`.
- **Second quantisation of one-body operators.** For `A : Matrix ι ι ℂ`, `dΓ(A)` is
  `manyBodyHamiltonian N A 0`. Then `tr(dΓ(A) ρ) = tr(A · oneRDM ρ)` for every `ρ` (both sides are
  the sum of `A (x k) (y k) ρ y x` over `k` and the pairs `x, y` agreeing off `k`), and the
  `N`-fold one-particle transformation of a matrix `U` is Tau Ceti's
  `Matrix.kroneckerPower (Fin N) U`, with entries `∏ᵢ U (x i) (y i)`
  (`Matrix.kroneckerPower_apply`).
- **Relation to Mathlib and Tau Ceti.** At the pins Mathlib's inner product on exterior powers
  (`exteriorPower.inner_ιMulti_ιMulti`, `OrthonormalBasis.exteriorPower`) is defined over `ℝ` only,
  and Tau Ceti's Hermitian form on the exterior algebra
  (`LinearAlgebra/ExteriorAlgebra/HermitianMetric.lean`)
  is built from a basis and is not an inner-product-space instance. The roadmap therefore works
  with antisymmetric functions, where the inner product is the `ℓ²` sum, and states the relation:
  by 2.1(c) there is a linear equivalence from Mathlib's `⋀[ℂ]^N (ι → ℂ)` onto
  `antisymmSubmodule N ι` sending `exteriorPower.ιMulti ℂ N φ` to `√N! • slater φ`; divided by
  `√N!` it carries the increasing wedge basis of the standard basis, which Tau Ceti's Hermitian
  form makes orthonormal, to the Slater determinants of increasing tuples, orthonormal by 2.1(a),
  so it is an isometry for that form. For `N = 2` the antisymmetric functions on `Fin 2 → ι`, read through `x ↦ (x 0, x 1)`,
  are the antisymmetric two-particle vectors above; their basis-free counterpart in Tau Ceti is
  `TauCeti.antisymmetricTensors`, identified with `⋀²` by
  `TauCeti.antisymmetricTensorsEquivExteriorPower`.

**Checks.**

- The index form, the `Pₐ V Pₐ` form and the `(1 − Ex)(γ ⊗ₖ γ)` form of the functional agree with
  the definition for arbitrary `T`, `V`, `γ` (Gaussian-integer entries, `n = 2, 3`), and so do the
  partial-trace forms of `J` and `K`. The functional and the form `re ⟨ψ, V ψ⟩` on antisymmetric
  `ψ` are unchanged when `V` is replaced by its exchange symmetrisation.
- `J(γ)` is Hermitian for Hermitian `V` and `γ`; `K(γ)` needs exchange symmetry as well: for a
  Hermitian, not exchange-symmetric `V` on `n = 3` an exact instance has `K(γ)` not Hermitian. For
  Hermitian `T`, `V`, exchange-symmetric `V` and Hermitian `γ`, `F(γ)` is Hermitian.
- For `n = 3`, `N = 2` and an exchange-symmetric `V` the Hamiltonian maps a Slater determinant to
  an antisymmetric function; for a Hermitian `V` without exchange symmetry it does not.

## Layer 1: the Hartree–Fock functional on one-particle density matrices

Everything in this layer is matrix theory on `Matrix ι ι ℂ`; nothing from the `N`-fermion space
is used. The layer is meant for every later use of the functional: relaxed density-matrix
functionals rest on 1.3, and self-consistent-field iterations on the Fock map and the gap of 1.4.

### 1.0 The Fock operator and the functional

Define `direct`, `exchangeTerm`, `fockOperator`, `hfEnergy` and `pairInteraction` as in the
Conventions.

- `J` and `K` are linear in `γ`. Write `Q(α, β) = tr((J(α) − K(α)) β)`. For an exchange-symmetric
  `V`, `Q(α, β) = Q(β, α)` for all matrices `α`, `β`: renaming `(p, q, r, s)` to `(q, p, s, r)` in
  `∑ V (p, q) (r, s) α s q β r p` and using `V (q, p) (s, r) = V (p, q) (r, s)` gives
  `∑ V (p, q) (r, s) β s q α r p`, and the same renaming handles `K`.
- `Q(|x⟩⟨x|, |x⟩⟨x|) = ⟨xx|V|xx⟩ − ⟨xx|V|xx⟩ = 0` for every `x` and every `V`: a single orbital
  does not interact with itself.
- `Q(|x⟩⟨x|, |y⟩⟨y|) = ⟨yx|V|yx⟩ − ⟨yx|V|xy⟩`, which for an exchange-symmetric `V` is
  `⟨xy|V|xy⟩ − ⟨xy|V|yx⟩`, with real part `W(x, y)`.

**Checks.**

- For `N = 1`, `hfEnergy T V (|x⟩⟨x|) = re ⟨x, T x⟩` for every `x` and every `V` (no
  self-interaction: `Q(|x⟩⟨x|, |x⟩⟨x|) = 0`, above); on `γ = ½ · 1` with `n = 2`, `T = 0`, `V = −Pₐ`
  the value is `−¼`, so off the projections the self-interaction does not cancel.
- With `n = 3`, `T = diag(0, 0, 1)` and `V = Pₐ`: `F(|e₀⟩⟨e₀|) = diag(0, 1, 2)` and
  `F(|e₀⟩⟨e₀| + |e₁⟩⟨e₁|) = diag(1, 1, 3)`; `W(e₀, e₁) = 1`.

### 1.1 Quadratic expansion and the replacement formula

Prove the quadratic expansion: for an exchange-symmetric `V`, every `T` and all matrices `γ`, `δ`,

    hfEnergy T V (γ + δ) = hfEnergy T V γ + re tr(F(γ) δ) + ½ re tr((J(δ) − K(δ)) δ).

It is the lemma behind 1.2, 1.3 and the replacement formula, and is not stated separately in
`Suggested.lean`. Prove `hfEnergy_sub_add_vecMulVec`, the replacement formula: for an
exchange-symmetric `V`, every
`T`, every matrix `γ` and all vectors `x`, `y` (not necessarily unit or orthogonal),

    E(γ − |x⟩⟨x| + |y⟩⟨y|) = E(γ) + re ⟨y, F(γ) y⟩ − re ⟨x, F(γ) x⟩ − W(x, y).

Its cases `x = 0` and `y = 0` are Koopmans' identities for frozen orbitals:
`E(γ + |y⟩⟨y|) − E(γ) = re ⟨y, F(γ) y⟩` and `E(γ) − E(γ − |x⟩⟨x|) = re ⟨x, F(γ) x⟩`, with no
projection or eigenvector hypothesis. (Proved here. The orbital form of these identities is used in
the proof of Bach, Lieb, Loss and Solovej, arXiv:cond-mat/9307066, p. 4, display (5) and the
energy difference before it; Koopmans' identity is attributed to Koopmans.)

Route. By linearity of `J`, `K` and of the trace, `E(γ + δ) = E(γ) + re tr(Tδ) +
½ re(Q(γ, δ) + Q(δ, γ)) + ½ re Q(δ, δ)`; by the symmetry of `Q` (1.0) the middle term is
`re Q(γ, δ)`, and `tr(Tδ) + Q(γ, δ) = tr(F(γ) δ)`. For the replacement put
`δ = |y⟩⟨y| − |x⟩⟨x|`: `tr(F |y⟩⟨y|) = ⟨y, F y⟩`, and by 1.0
`Q(δ, δ) = Q(yy*, yy*) + Q(xx*, xx*) − 2 Q(xx*, yy*) = −2 Q(xx*, yy*)`, whose real part is
`−2 W(x, y)`.

**Checks.**

- Both identities hold exactly for random Gaussian-integer `T`, `γ`, `δ`, `x`, `y` and
  exchange-symmetric `V`, Hermitian or not (`n = 2, 3`).
- Exchange symmetry cannot be dropped: for `n = 2`, `T = 0`, `V` with the single nonzero entry
  `V (0, 1) (0, 1) = 1`, `γ = |e₀⟩⟨e₀|`, `δ = |e₁⟩⟨e₁|`, the left side of the expansion is `½` and
  the right side `0`; after adding `V (1, 0) (1, 0) = 1` both sides are `1`.

*Needs:* 1.0.

### 1.2 The Hartree–Fock equations

Prove `commute_fockOperator_iff`: for Hermitian `T` and `V`, `V` exchange-symmetric, and a
Hermitian idempotent `γ`, `F(γ)` commutes with `γ` exactly when `re tr(F(γ) δ) = 0` for every
Hermitian `δ` with `γδ + δγ = δ`. These `δ` are the tangent directions to the projections at `γ`,
and by 1.1 `re tr(F(γ) δ)` is the first-order change of `E` along them, so this characterises the
critical points. (Cancès and Le Bris, M2AN 34 (2000), Lemma 1 (items 3–4, eq. (6)), pp. 753–754,
and Lemma 2, eq. (7), p. 754, for the Hartree–Fock problem with Coulomb potentials; proved here in
this setting.)

Prove `commute_fockOperator_of_isLocalMinOn`, the Hartree–Fock equations: for Hermitian `T` and
`V`, `V` exchange-symmetric, a rank-`N` projection `γ` that is a local minimiser of `E` on the set
of rank-`N` projections (`IsLocalMinOn`, for the product topology of `Matrix ι ι ℂ`) satisfies
`F(γ) γ = γ F(γ)`. (Proved here.)

Route. *Tangent directions.* From `γδ + δγ = δ`, multiplying by `γ` on both sides gives
`γδγ = 0`, and `(1 − γ)δ(1 − γ) = 0`, so `δ = γδ(1 − γ) + (1 − γ)δγ`. If `F` commutes with `γ`,
`tr(F γδ(1 − γ)) = tr((1 − γ)Fγ δ) = 0` and likewise for the other term. Conversely, for
`x ∈ ran γ`, `y ∈ ker γ` and `c ∈ ℂ`, `δ = c |y⟩⟨x| + c̄ |x⟩⟨y|` is Hermitian with
`γδ + δγ = δ`, and `tr(F δ) = c ⟨x, F y⟩ + c̄ ⟨y, F x⟩ = 2 re(c ⟨x, F y⟩)` since `F` is Hermitian
(Conventions). Vanishing for `c = 1` and `c = i` gives `⟨x, F y⟩ = 0`. Since `γu ∈ ran γ` and
`(1 − γ)v ∈ ker γ` for all `u`, `v`, this is `γ F (1 − γ) = 0`; its adjoint is
`(1 − γ) F γ = 0`, and then `Fγ = γFγ = γF`.
*Local minimisers.* Let `x ∈ ran γ`, `y ∈ ker γ` be unit vectors, `|c| = 1`, and
`x_t = cos t · x + sin t · c y`. Then `γ_t = γ − |x⟩⟨x| + |x_t⟩⟨x_t|` is a rank-`N` projection
(`γ − |x⟩⟨x|` is the projection onto `ran γ ⊖ ℂx`, and `x_t` is a unit vector orthogonal to it),
`t ↦ γ_t` is continuous with `γ₀ = γ`, and
`γ_t − γ = sin t cos t (c |y⟩⟨x| + c̄ |x⟩⟨y|) + sin² t (|y⟩⟨y| − |x⟩⟨x|)`. So `f(t) = E(γ_t)` has
a local minimum at `0`, and by 1.1 it is a polynomial in `cos t`, `sin t` whose terms other than
`sin t cos t · 2 re(c ⟨x, F y⟩)` are of order `t²`; hence `f′(0) = 2 re(c ⟨x, F y⟩) = 0` (Mathlib's
`IsLocalMin.deriv_eq_zero`). As above this gives `γ F (1 − γ) = 0` and the commutation.

**Checks.**

- For `n = 4`, `N = 2` and the projection onto two columns of an exact rational unitary (a Cayley
  transform `(1 − A)(1 + A)⁻¹` of an anti-Hermitian Gaussian-integer `A`), the curve with
  `cos t = (1 − s²)/(1 + s²)`, `sin t = 2s/(1 + s²)` at `s = 1/3, −2/5` and `c = 1, i, (3 + 4i)/5`
  stays in the rank-2 projections, and `γ_t − γ` and `re tr(F(γ)(γ_t − γ))` agree exactly with the
  displayed formulas.
- For a density–density interaction (`V (p, q) (r, s) = w p q` when `(r, s) = (p, q)`, else `0`)
  and diagonal `T`, `F(|e₀⟩⟨e₀|)` is diagonal and every tangent direction has slope `0`; for a
  projection with `[F, γ] ≠ 0` a tangent direction with nonzero slope exists.
- Hermiticity of `T` is needed: for `n = 2`, `N = 1`, `V = 0`, `T = [[0, 1], [−1, 0]]`, every
  rank-one projection has `E = re tr(Tγ) = 0`, so `|e₀⟩⟨e₀|` is a minimiser, yet `F = T` does not
  commute with it. Hermiticity of `V` is needed: for `n = 3`, `N = 2`, `T = 0` and `V = iA` with
  `A` Hermitian and exchange-symmetric, `E = 0` on all rank-2 projections (the trace is `i` times
  a real number), and an exact instance has `F(γ)` not commuting with `γ = |e₀⟩⟨e₀| + |e₁⟩⟨e₁|`.

*Needs:* 1.1; Mathlib `IsLocalMin.deriv_eq_zero`.

### 1.3 Lieb's variational principle

Prove `exists_isRankProjection_hfEnergy_le`: if `V` is nonnegative on antisymmetric two-particle
vectors (`IsNonnegOnAntisymm V`), then for every `T` and every admissible `γ` there is a rank-`N`
projection `P` with `E(P) ≤ E(γ)`. Neither Hermiticity nor exchange symmetry is assumed. Prove
`isRankProjection_of_isMinOn`: if `V` is positive on nonzero antisymmetric vectors
(`IsPosOnAntisymm V`), every minimiser of `E` over the admissible set is a projection. (Lieb,
1981; Bach, *Hartree–Fock theory, Lieb's variational principle, and their generalizations*,
arXiv:2209.10189v1, Theorem 3, eq. (III.6), p. 15, with the descent proof on pp. 15–16, which
assumes strict positivity and that the infimum is attained; Bach, Lieb and Solovej,
arXiv:cond-mat/9312044, Theorem 2.12, eq. (2c.33), p. 23, including the second statement. Both
sources assume `V` positive on all two-particle vectors, and a Hermitian Hamiltonian; the form
here, with positivity on antisymmetric vectors only and arbitrary `T`, `V`, and the non-strict
descent below, for every admissible `γ`, are proved here.)

So the infimum of `E` over the admissible set equals its infimum over the rank-`N` projections;
both are attained when `N ≤ n` (Examples).

Route. *Reduction.* Put `V′ = ½(V + V.submatrix Prod.swap Prod.swap)`. It is exchange-symmetric,
`E` is the same for `V` and `V′` (Conventions), and `⟨ψ, V′ψ⟩ = ⟨ψ, Vψ⟩` for antisymmetric `ψ`
(the substitution `(p, q, r, s) ↦ (q, p, s, r)` and two sign changes of `ψ`), so `V′` satisfies
the same positivity hypothesis; we may assume `V` exchange-symmetric. *Descent.* Diagonalise
`γ = ∑ₖ λₖ |fₖ⟩⟨fₖ|` with an orthonormal basis `fₖ` and `λₖ ∈ [0, 1]`, `∑ λₖ = N` (Mathlib's
`Matrix.IsHermitian.spectral_theorem`), and argue by strong induction on the number `m` of
eigenvalues in `(0, 1)` counted with multiplicity. If `m = 0`, `γ` is a rank-`N` projection. If
`m ≥ 1`, the fractional eigenvalues sum to an integer (`N` minus the number of eigenvalues `1`),
so `m ≥ 2`; pick `p ≠ q` with `λ_p, λ_q ∈ (0, 1)` and put `D = |f_p⟩⟨f_p| − |f_q⟩⟨f_q|`. For
`s ∈ [a, b]`, `a = max(−λ_p, λ_q − 1) < 0 < b = min(1 − λ_p, λ_q)`, the matrix `γ + sD` is
admissible, and by 1.1 and 1.0
`E(γ + sD) = E(γ) + s re tr(F(γ) D) − s² W(f_p, f_q)` with `W(f_p, f_q) ≥ 0` by hypothesis. This
is a concave function of `s` vanishing at the interior point `0`, so its value at one endpoint is
`≤ 0`; at that endpoint one of `λ_p + s`, `λ_q − s` lies in `{0, 1}`, so `m` drops and `E` does not
increase. *Strict case.* If `γ` minimises and `m ≥ 2`, `f_p ∧ f_q ≠ 0` gives `W(f_p, f_q) > 0`,
so `g(s) = E(γ + sD) − E(γ)` is strictly concave on `[a, b]` with `g(0) = 0 ≤ g(a), g(b)`;
strict concavity at the interior point `0` gives `0 > 0`.

**Checks.**

- Exact descents from `γ = U diag(λ) U*` (Cayley unitary `U`) for
  `λ = (1/2, 1/3, 1/6)` (`n = 3`, `N = 1`), `(3/4, 3/4, 1/4, 1/4)` and `(1/2, 1/2, 2/3, 1/3)`
  (`n = 4`, `N = 2`) and `(1, 2/3, 2/3, 2/3)` (`n = 4`, `N = 3`), with `V = G − 100 Pₛ` (`G` a
  positive semidefinite exchange-symmetric Gram matrix, `Pₛ = ½(1 + Ex)`), which is nonnegative on
  antisymmetric vectors but negative on `e₀ ⊗ e₀`: every quadratic `E(γ + sD)` agrees with the
  displayed formula, each step's chosen endpoint has value `≤ 0`, and the end point is a rank-`N`
  projection with `E(P) ≤ E(γ)`. The same holds for two `V` that are neither Hermitian nor
  exchange-symmetric, with `Pₐ V Pₐ` positive semidefinite, descending with `V′`.
- The hypothesis cannot be dropped: `n = 2`, `N = 1`, `T = 0`, `V = −Pₐ` (Hermitian,
  exchange-symmetric, negative on `e₀ ∧ e₁`): `E(½ · 1) = −¼`, while `E(P) = 0` for every
  rank-one projection by the first Check of 1.0.
- Strict positivity is needed in the second statement: for `V = 0`, `T = 0` every admissible `γ`
  minimises, including `½ · 1`, which is not a projection.

*Needs:* 1.0, 1.1; Mathlib `Matrix.IsHermitian.spectral_theorem`.

### 1.4 There are no unfilled shells

Prove `pairInteraction_le_of_isMinOn`: for an exchange-symmetric `V`, every `T` and a rank-`N`
projection `γ` minimising `E` on the rank-`N` projections, every unit `x` with `γx = x` and unit
`y` with `γy = 0` satisfy `re ⟨x, F(γ) x⟩ + W(x, y) ≤ re ⟨y, F(γ) y⟩`. No positivity of `V` is
assumed here. Prove `no_unfilled_shells`: if moreover `T` and `V` are Hermitian and `V` is positive
on nonzero antisymmetric vectors, then `re ⟨x, F(γ) x⟩ < re ⟨y, F(γ) y⟩` for all such `x`, `y`, and
every eigenvector `v` of `F(γ)` (`F(γ) v = μ v`) satisfies `γv = v` or `γv = 0`. With 1.2 this
says: `γ` is the spectral projection of `F(γ)` onto its `N` lowest eigenvalues counted with
multiplicity, and when `0 < N < n` the `N`-th eigenvalue is strictly below the `(N + 1)`-st, so no
degenerate level is partly filled. (Bach, Lieb, Loss and Solovej, *There are no unfilled shells in
unrestricted Hartree–Fock theory*, arXiv:cond-mat/9307066v1, Theorem, p. 3, under positive
definiteness of `V` on all two-particle functions, proof pp. 4–5, which gives the gap
`W(x, y)` as here; Bach, Lieb and Solovej, arXiv:cond-mat/9312044, Lemma 2.13, p. 24, and
Theorem 2.14, p. 25. Stated here for positivity on antisymmetric vectors, on which `E` alone
depends; proved here.)

Route. For unit `x ∈ ran γ`, `y ∈ ker γ`, the matrix `γ′ = γ − |x⟩⟨x| + |y⟩⟨y|` is a rank-`N`
projection (`γ − |x⟩⟨x|` is a projection, `⟨x, y⟩ = ⟨γx, y⟩ = ⟨x, γy⟩ = 0`, and `y` is orthogonal
to its range), so `E(γ′) ≥ E(γ)`, and 1.1 turns this into the first inequality. In the strict
case `x ⊗ y − y ⊗ x ≠ 0` (contracting it with `x̄` in the first slot gives `y`), so `W(x, y) > 0`.
For the eigenvectors: a global minimiser is a local one (Mathlib's `IsMinOn.isLocalMinOn`), so
`F(γ)` commutes with `γ` by 1.2 and `γv`, `(1 − γ)v` are eigenvectors for `μ` or zero; if both
were nonzero, their normalisations `x`, `y` would give `re ⟨x, F x⟩ = re μ = re ⟨y, F y⟩`,
contradicting the strict inequality.

**Checks.**

- `n = 3`, `N = 1`, `T = diag(0, 0, 1)`, `V = Pₐ` (positive on antisymmetric vectors): by the
  first Check of 1.0, `E(|x⟩⟨x|) = ⟨x, T x⟩`, so `|e₀⟩⟨e₀|` minimises although `T` is degenerate
  at its lowest level; `F = diag(0, 1, 2)` separates `e₀` from `e₁` by `W(e₀, e₁) = 1`. With
  `N = 2`, `E(P) = tr(TP) + 1` on the rank-2 projections (checked exactly on three projections),
  the unique minimiser is `|e₀⟩⟨e₀| + |e₁⟩⟨e₁|` and `F = diag(1, 1, 3)`.
- Positivity is needed for the strict statement: for `V = 0`, `T = 0`, `N = 1`, `n = 2` every
  projection minimises and `F = 0` has no gap. For the attractive `V = −Pₐ` with `T = diag(0, 1)`,
  `N = 1`: `|e₀⟩⟨e₀|` minimises, `F(γ) = 0` and `W(e₀, e₁) = −1`, so the first statement reads
  `0 − 1 ≤ 0` (the replacement formula gives `E(|e₁⟩⟨e₁|) − E(|e₀⟩⟨e₀|) = 0 − 0 + 1 = 1`), while
  the occupied and the empty level of `F(γ)` coincide.
- Degenerate cases: for `N = 0` (`γ = 0`) and `N = n` (`γ = 1`) there is no unit `x` resp. `y`,
  and every vector satisfies `γv = 0` resp. `γv = v`; for `N > n` there is no rank-`N` projection.

*Needs:* 1.1, 1.2; Mathlib `IsMinOn.isLocalMinOn`.

### Examples

- Existence of minimisers: for `N ≤ n` the rank-`N` projections form a nonempty compact subset of
  `Matrix ι ι ℂ` (closed and bounded; the diagonal projection onto `N` basis vectors lies in it)
  and `E` is continuous (a polynomial in the entries), so Mathlib's `IsCompact.exists_isMinOn`
  gives a minimiser; by 1.3 it also minimises over the admissible set when `V` is nonnegative on
  antisymmetric vectors.
- The non-interacting case `V = 0`: `E(γ) = re tr(Tγ)`, and for Hermitian `T` the minimum over the
  rank-`N` projections is the sum of the `N` smallest eigenvalues of `T`, by Tau Ceti's Ky Fan
  inequality `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` applied to `−T`
  (the trace inequality is item MAJ-A27 of OperatorTheory/Majorization).
- Roothaan's form: if orbitals are expanded in a basis with Gram matrix `S` positive definite, the
  orthonormal basis `S^(−1/2)` turns the equations of 1.2 for coefficient vectors into
  `F C = S C ε` (Löwdin's change of basis); this is a change of coordinates and is not a target.

### Dependencies

1.0 is definitions. 1.1 needs 1.0. 1.2 needs 1.1. 1.3 needs 1.0 and 1.1. 1.4 needs 1.1 and 1.2.

## Layer 2: the `N`-fermion space and the bridge

The layer builds the antisymmetric functions, Slater determinants, one-particle density matrices
and the many-body Hamiltonian, and connects them to Layer 1. Configuration interaction and coupled
cluster are meant to rest on 2.1, 2.4 and 2.6; density-matrix functionals on 2.2 and 2.3.

### 2.0 Definitions

Define `antisymmSubmodule`, `slater`, `oneRDM`, `manyBodyHamiltonian` and `IsFermionicState` as in
the Conventions, and `orbitalDensity`, `IsOrthonormal` as there.

- For every family `φ`, `slater φ ∈ antisymmSubmodule N ι`: permuting the rows of `[φ j (x i)]`
  multiplies the determinant by the sign.
- *Column operations.* `slater (fun j ↦ ∑ᵢ M i j • φ i) = det M • slater φ`, since the matrix is
  `[φ i (x k)] * M` (Mathlib `Matrix.det_mul`); a determinant depends on its orbitals only through
  their span, up to a scalar. A repeated orbital gives `0`.
- *One-body operators on determinants.* Write `D_φ = √N! • slater φ`. For every
  `A : Matrix ι ι ℂ`, `dΓ(A) D_φ = ∑ⱼ D_{update φ j (A φⱼ)}`: by the Leibniz formula
  (`Matrix.det_apply`) both sides are the sum over `σ` and `k` of
  `sign σ · (A φ_{σk})(x k) ∏_{i ≠ k} φ_{σi}(x i)`. Likewise, for every two-body `V`,
  `∑_{k ≠ l} V_{kl} D_φ = ∑_{i ≠ j} D_φ[(i, j) ← V(φᵢ ⊗ φⱼ)]`, where for a two-particle vector
  `w = ∑ w(p, q) e_p ⊗ e_q` the function `D_φ[(i, j) ← w]` is
  `∑ w(p, q) D_{update (update φ i e_p) j e_q}`: for `V = E_{pr} ⊗ E_{qs}` both sides expand to the
  same Leibniz sum, and the general case is linearity.
- *Many-body unitaries.* For unitary `U`, `Matrix.kroneckerPower (Fin N) U` maps `slater φ` to
  `slater (fun j ↦ U *ᵥ φ j)` (multilinearity of the determinant in its rows), preserves
  antisymmetry, and is unitary (`Matrix.kroneckerPower_mul` with `Uᴴ U = 1`).

**Checks.**

- `slater (fun j ↦ ∑ᵢ M i j • φ i) = det M • slater φ` and `U^⊗N slater φ = slater (Uφ)` hold
  exactly for `(n, N) = (3, 2), (4, 2), (4, 3), (3, 0)`.

### 2.1 Slater determinants

Prove `inner_slater`: for all families `φ`, `χ : Fin N → ι → ℂ`, orthonormal or not,
`⟨slater φ, slater χ⟩ = det [⟨φ i, χ j⟩]`. Prove `span_slater_eq_antisymmSubmodule`: the Slater
determinants of standard basis vectors `slater (fun i ↦ Pi.single (x i) 1)`, `x : Fin N → ι`, span
`antisymmSubmodule N ι`. Prove `exists_linearEquiv_exteriorPower`: there is a linear equivalence
`⋀[ℂ]^N (ι → ℂ) ≃ₗ[ℂ] antisymmSubmodule N ι` sending `exteriorPower.ιMulti ℂ N φ` to
`√N! • slater φ` for every `φ`. (Proved here; (a) is the complex, first-quantised counterpart of
Mathlib's real `exteriorPower.inner_ιMulti_ιMulti`.) The dimension of `antisymmSubmodule N ι` is
then `(card ι).choose N` (so `0` for `N > n` and `1` for `N = 0`), by `LinearEquiv.finrank_eq`,
Mathlib's `exteriorPower.finrank_eq` and `Module.finrank_fintype_fun_eq_card`; this corollary is
not stated separately in `Suggested.lean`.

Route. (a) By Leibniz, `conj det [φ j (x i)] = ∑_σ sign σ ∏ᵢ conj φ_{σi}(x i)`. For fixed `σ`
substitute `x = y ∘ σ`: the product becomes `∏ₖ conj φₖ(y k)` and `det [χ j (y (σ i))] =
sign σ · det [χ j (y i)]`, so `∑ₓ conj det Φₓ · det Χₓ = N! ∑_y ∏ₖ conj φₖ(y k) · det [χ j (y i)]`.
Tau Ceti's `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` with `A k p = conj φₖ(p)`
(`Matrix (Fin N) ι ℂ`) and `B p j = χ j p` (`Matrix ι (Fin N) ℂ`) says that the last sum is
`det (A * B) = det [⟨φ i, χ j⟩]`; divide by `N!`. (b) For antisymmetric `ψ`,
`ψ = (√N!)⁻¹ ∑ₓ ψ x • slater (e ∘ x)`, `e p = Pi.single p 1`: at a tuple `y` with a repeated
index both sides vanish (swapping the two equal coordinates gives `ψ y = −ψ y`, and the
determinants have two equal rows), and at an injective `y` the terms with `x = y ∘ σ` contribute
`ψ (y ∘ σ) · sign σ / N! = ψ y / N!` each and all others vanish. (c) `φ ↦ (x ↦ det [φ j (x i)])`
is an alternating multilinear map into `antisymmSubmodule N ι` (linear in each column, zero for two
equal columns); Mathlib's `exteriorPower.alternatingMapLinearEquiv` gives a linear map `e` with
`e (ιMulti φ) = √N! • slater φ` (`exteriorPower.alternatingMapLinearEquiv_apply_ιMulti`). It is
onto by (b), so `finrank (antisymmSubmodule N ι) ≤ finrank ⋀[ℂ]^N (ι → ℂ) = (card ι).choose N`
(`LinearMap.finrank_le_finrank_of_surjective`, `exteriorPower.finrank_eq`,
`Module.finrank_fintype_fun_eq_card`). Conversely, fix a linear order on `ι`: by (a) the
determinants of the strictly increasing tuples are orthonormal (for distinct increasing tuples some
row of the overlap matrix is zero), hence linearly independent, and there are
`(card ι).choose N` of them (`LinearIndependent.fintype_card_le_finrank`). So the dimensions agree
and `e` is bijective by `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

**Checks.**

- The overlap formula holds exactly for random Gaussian-integer families (not orthonormal) for
  `(n, N) = (3, 2), (4, 2), (4, 3), (3, 1), (1, 1)`, and in the degenerate cases `(3, 0)` (both
  sides `1`), `(2, 3)`, `(0, 1)` (both sides `0`) and `(0, 0)`.
- The dimension of the antisymmetric space, computed as the dimension of the solution space of the
  antisymmetry equations, equals the rank of the basis determinants and `C(n, N)` for
  `(n, N) = (3, 2), (4, 2), (4, 3), (3, 0), (2, 3), (3, 3), (1, 0), (0, 0), (0, 2)`.
- A normalisation `det [φ j (x i)]` without `(√N!)⁻¹` would give overlaps `N! det [⟨φ i, χ j⟩]`,
  so `‖slater φ‖² = 2` for two orthonormal orbitals.

*Needs:* 2.0; Tau Ceti `Matrix.det_mul_eq_sum_prod_mul_det_submatrix`; Mathlib `Matrix.det_apply`,
`exteriorPower.alternatingMapLinearEquiv_apply_ιMulti`, `exteriorPower.finrank_eq`,
`Module.finrank_fintype_fun_eq_card`, `LinearMap.finrank_le_finrank_of_surjective`,
`LinearIndependent.fintype_card_le_finrank`, `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

### 2.2 One-particle density matrices and the Pauli principle

Prove `isAdmissible_oneRDM`, the Pauli principle: for a fermionic state `ρ`, `oneRDM ρ` is positive
semidefinite, `1 − oneRDM ρ` is positive semidefinite and `tr (oneRDM ρ) = N`. Prove
`oneRDM_slater`: for orthonormal `φ`, `oneRDM (vecMulVec (slater φ) (star (slater φ)))` is
`orbitalDensity φ`, the projection onto the span of `φ`. (Bach, arXiv:2209.10189v1, Lemma 1
(i)–(ii),
eqs. (II.25)–(II.26), p. 12, and Lemma 2 (i), eq. (III.1), p. 14, for states on Fock space; proved
here.)

Route. *Hermitian and positive.* `oneRDM ρ` is Hermitian when `ρ` is. For a vector `v`,
`⟨v, γ v⟩ = ∑ₖ ∑_z ⟨w_{k,z}, ρ w_{k,z}⟩ ≥ 0`, where `z` runs over the assignments of the
coordinates other than `k` and `w_{k,z} x = v (x k)` when `x` agrees with `z` off `k`, else `0`.
*Trace.* `tr γ = ∑ₖ ∑ₓ ρ x x = N tr ρ = N`. *Upper bound.* For every `ρ` and every unitary `U`,
`oneRDM (K ρ Kᴴ) = U (oneRDM ρ) Uᴴ` with `K = Matrix.kroneckerPower (Fin N) U` (the sums over the
other coordinates give `(Uᴴ U) (b j) (a j) = δ`), and `K ρ Kᴴ` is again fermionic (2.0). For a unit
`v`, extend it to an orthonormal basis (Mathlib `Orthonormal.exists_orthonormalBasis_extension`)
and let `U` have it as columns, `v` first. Then `⟨v, γ v⟩` is the diagonal entry of
`oneRDM (Kᴴ ρ K)` at the first index `p₀`, which is `∑ₓ ρ′ x x · #{k | x k = p₀}` with
`ρ′ = Kᴴ ρ K`. The diagonal of `ρ′` is nonnegative (`Matrix.PosSemidef.diag_nonneg`) and vanishes
at tuples with a repeated index (antisymmetry in a pair of equal coordinates), so the count is at
most `1` where `ρ′ x x ≠ 0`, and `⟨v, γ v⟩ ≤ tr ρ′ = 1`. *Determinants.* By duality
(Conventions), `tr(A · oneRDM(Φ Φ*)) = ⟨Φ, dΓ(A) Φ⟩` for `Φ = slater φ`; by 2.0 and 2.1(a) this is
`∑ⱼ det` of the overlap matrix of `φ` against `update φ j (A φⱼ)`, which is the identity except in
column `j`, so its determinant is `⟨φⱼ, A φⱼ⟩`. Hence `tr(A γ) = tr(A ∑ⱼ |φⱼ⟩⟨φⱼ|)` for every
`A`, and the two matrices agree.

**Checks.**

- For random antisymmetric `ψ` (Gaussian-integer combinations of basis determinants) with
  `(n, N) = (3, 2), (4, 2), (4, 3), (3, 1)`: `oneRDM` is positive semidefinite, below `‖ψ‖² · 1`
  and of trace `N ‖ψ‖²` (exact principal minors); a mixture `⅓, ⅔` of two normalised such states
  is admissible; covariance under a Cayley unitary and the duality `⟨ψ, dΓ(A) ψ⟩ = tr(A γ)` hold.
- Antisymmetry is essential: the product state `e₀ ⊗ e₀` (`n = N = 2`) has `oneRDM = 2 |e₀⟩⟨e₀|`,
  so `γ ≤ 1` fails; and the trace is `N`, not `1`.
- `oneRDM_slater` holds exactly for Cayley orbitals with `(n, N) = (3, 2), (4, 2), (4, 3), (3, 0)`.

*Needs:* 2.0, 2.1(a); Tau Ceti `Matrix.kroneckerPower_apply`, `Matrix.kroneckerPower_mul`;
Mathlib `Orthonormal.exists_orthonormalBasis_extension`, `Matrix.PosSemidef.diag_nonneg`.

### 2.3 Coleman's theorem

Prove `exists_isFermionicState_oneRDM_eq_iff`: a matrix `γ` is `oneRDM ρ` for some fermionic
`N`-particle state `ρ` exactly when `IsAdmissible N γ`; for `N > n` both sides are false. Prove
`extremePoints_isAdmissible`: the extreme points (Mathlib's `Set.extremePoints ℝ`) of the
admissible set are exactly the rank-`N` projections. (Coleman, 1963, attributed; Bach,
arXiv:2209.10189v1, Theorem 5, p. 26, for `N ≥ 2` in a general one-particle Hilbert space, proved
there by an averaged state, with the remark on p. 25 that Lieb's 1981 paper already proves it. The
route through Rado's theorem is proved here.)

Route. (→) is 2.2. (←) Diagonalise `γ = U diag(λ) Uᴴ` (spectral theorem), `λ ∈ [0, 1]^n`,
`∑ λ = N`; transport `ι` to `Fin n`. With `w = (1, …, 1, 0, …, 0)` (`N` ones; `N ≤ n` because
`N = tr γ ≤ n`), which is antitone, the prefix sums of the decreasing rearrangement of `λ` are at
most `min(k, N)`, the prefix sums of `w`, and the totals agree; Tau Ceti's Rado theorem
`TauCeti.mem_convexHull_range_comp_perm_iff` puts `λ` in the convex hull of the permutations of
`w`, i.e. `λ = ∑_S t_S 1_S` over `N`-element sets `S` with `t_S ≥ 0`, `∑ t_S = 1`. Put
`ρ = ∑_S t_S |slater(U_S)⟩⟨slater(U_S)|`, `U_S` the columns of `U` indexed by `S`. It is
positive semidefinite, of trace `1` (2.1(a)) and has antisymmetric columns, and by linearity and
2.2 `oneRDM ρ = ∑_S t_S U diag(1_S) Uᴴ = γ`. *Extreme points.* A rank-`N` projection `P` is
admissible. If `P = θA + (1 − θ)B` with `A`, `B` admissible and `0 < θ < 1`, then for
`v ∈ ker P`, `0 = θ⟨v, Av⟩ + (1 − θ)⟨v, Bv⟩` with both terms `≥ 0`, so `Av = 0`; for `v ∈ ran P`,
`‖v‖² = θ⟨v, Av⟩ + (1 − θ)⟨v, Bv⟩` with both terms `≤ ‖v‖²`, so `(1 − A)v = 0`; hence `A = P`, and
likewise `B = P`. Conversely, an admissible `γ` that is not a projection has an eigenvalue in
`(0, 1)`, hence two (the eigenvalues sum to the integer `N`), say `λ_p`, `λ_q` with orthonormal
eigenvectors `f_p`, `f_q`; with `D = |f_p⟩⟨f_p| − |f_q⟩⟨f_q|`,
`γ = ½((γ + sD) + (γ − sD))` with both points admissible and distinct for small `s > 0`.

**Checks.**

- For `λ = (1/2, 1/3, 1/6)` (`N = 1`), `(3/4, 3/4, 1/4, 1/4)`, `(1/2, 1/2, 2/3, 1/3)` (`N = 2`),
  `(1, 2/3, 2/3, 2/3)` (`N = 3`) and the cases `N = 0`, `N = n = 3`, an explicit convex combination
  of two or three Slater determinants of Cayley orbitals has `oneRDM` equal to `γ` exactly.
- `γ` with eigenvalues `(3/4, 1/4, 1, 0)` (`n = 4`, `N = 2`) is the midpoint of the admissible
  points with eigenvalues `(1, 0, 1, 0)` and `(1/2, 1/2, 1, 0)`.
- For `N = 0` the only state is `ρ = [1]` and `oneRDM ρ = 0`, the only admissible matrix.

*Needs:* 2.1(a), 2.2;
Tau Ceti `TauCeti.mem_convexHull_range_comp_perm_iff`;
Mathlib `Matrix.IsHermitian.spectral_theorem`.

### 2.4 The Slater–Condon rules

Let `φ` be orthonormal, `γ = orbitalDensity φ`, `Φ = slater φ` and `H = manyBodyHamiltonian N T V`.

- Prove `slater_energy`: for every `T` and `V`, `re ⟨Φ, H Φ⟩ = hfEnergy T V γ`. In orbitals this
  is `∑ᵢ re ⟨φᵢ, T φᵢ⟩ + ½ ∑_{i,j} re(⟨φᵢφⱼ|V|φᵢφⱼ⟩ − ⟨φᵢφⱼ|V|φⱼφᵢ⟩)` for exchange-symmetric `V`.
- Prove `slaterCondon_single`: for exchange-symmetric `V`, every `T`, every `i` and every `a`
  orthogonal to all `φⱼ`, `⟨Φ, H slater (update φ i a)⟩ = ⟨φᵢ, F(γ) a⟩`.
- Prove `slaterCondon_double`: for exchange-symmetric `V`, every `T`, `i ≠ j` and `a`, `b`
  orthogonal to all `φₖ` (not necessarily to each other),
  `⟨Φ, H slater (update (update φ i a) j b)⟩ = ⟨φᵢφⱼ|V|ab⟩ − ⟨φᵢφⱼ|V|ba⟩`.
- Prove `slaterCondon_of_three_le`: for every `T` and `V`, if each `χ i` is `φ i` or orthogonal to
  all `φⱼ`, and at least three `χ i` differ from `φ i`, then `⟨Φ, H slater χ⟩ = 0`.

(Slater and Condon, attributed; the energy formula is Bach, arXiv:2209.10189v1,
eq. (II.27), p. 12, with Lemma 2 (ii), eq. (III.2), p. 14, and Bach, Lieb, Loss and Solovej,
arXiv:cond-mat/9307066v1, p. 4. All four are proved here.)

Route. *Energy.* By duality and 2.2, `⟨Φ, dΓ(T) Φ⟩ = tr(Tγ)`. For the two-body part, conjugating
by the transposition of particles `k` and `l` (which maps `Φ` to `−Φ`) shows
`⟨Φ, V_{kl} Φ⟩ = ⟨Φ, V′_{kl} Φ⟩` with `V′ = V.submatrix Prod.swap Prod.swap`, and the functional is
the same for `V` and `½(V + V′)` (Conventions); so we may take `V` exchange-symmetric. Then
`V_{lk} = V_{kl}` and `∑_{k<l} V_{kl} = ½ ∑_{k≠l} V_{kl}`. By 2.0,
`⟨Φ, ∑_{k≠l} V_{kl} Φ⟩ = ∑_{i≠j} ⟨Φ, slater φ[(i, j) ← V(φᵢ ⊗ φⱼ)]⟩`, and by 2.1(a) the overlap
with `slater (update (update φ i u) j v)`, `i ≠ j`, is the determinant of a matrix that is the
identity except in columns `i`, `j`, i.e. `⟨φᵢ, u⟩⟨φⱼ, v⟩ − ⟨φⱼ, u⟩⟨φᵢ, v⟩
= ⟨φᵢ ⊗ φⱼ − φⱼ ⊗ φᵢ, u ⊗ v⟩`. So the two-body part is
`½ ∑_{i≠j} (⟨φᵢφⱼ|V|φᵢφⱼ⟩ − ⟨φⱼφᵢ|V|φᵢφⱼ⟩)`; the terms `i = j` vanish, exchange symmetry turns the
second into `⟨φᵢφⱼ|V|φⱼφᵢ⟩`, and the sums `∑_{i,j}` are `tr(J(γ)γ)` and `tr(K(γ)γ)`.
*Single.* Write `φ′ = update φ i a`; the overlap matrix of `φ` against `φ′` has column `i` equal
to `0`. In `⟨Φ, dΓ(T) slater φ′⟩ = ∑ⱼ ⟨Φ, slater (update φ′ j (T φ′ⱼ))⟩` only `j = i` survives,
giving `⟨φᵢ, T a⟩`. In the two-body part only the pairs `(i, l)` and `(l, i)` survive; by the
overlap formula above they give `⟨φᵢφₗ|V|aφₗ⟩ − ⟨φₗφᵢ|V|aφₗ⟩` and `⟨φₗφᵢ|V|φₗa⟩ − ⟨φᵢφₗ|V|φₗa⟩`,
equal by exchange symmetry, and the half-sum over `l` is `∑ₗ (⟨φᵢφₗ|V|aφₗ⟩ − ⟨φᵢφₗ|V|φₗa⟩)`
(the term `l = i` vanishes by exchange symmetry), which is `⟨φᵢ, (J(γ) − K(γ)) a⟩`.
*Double.* One-body terms leave a zero column; of the two-body terms only `(i, j)` and `(j, i)`
survive, and both give `⟨φᵢφⱼ|V|ab⟩ − ⟨φᵢφⱼ|V|ba⟩`. *Three or more.* By Leibniz,
`√N! • slater χ = ∑_τ sign τ · (χ_{τ1} ⊗ ⋯ ⊗ χ_{τN})`, a signed sum of product functions
`x ↦ ∏ₘ χ_{τm}(x m)`. A term `T_k` or `V_{kl}` of `H` changes only the factors at the particles
`k` (and `l`) of such a product, and the inner product of a product function with the product
`φ_{σ1} ⊗ ⋯ ⊗ φ_{σN}` is the product of the factorwise inner products. So every term of
`⟨√N! slater φ, H √N! slater χ⟩` contains a factor `⟨φ_{σm}, χ_{τm}⟩` for each of the at least
`N − 2` particles `m` the term of `H` does not touch; since at least three `χ i` are orthogonal to
all `φⱼ`, one of these factors has such a `χ i` and vanishes. No hypothesis on `T` or `V` is used.

**Checks.**

- The energy formula holds as a complex identity `⟨Φ, H Φ⟩ = tr(Tγ) + ½ tr((J − K)(γ) γ)` for
  random `T` and `V` that are neither Hermitian nor exchange-symmetric, for
  `(n, N) = (3, 2), (4, 2), (4, 3), (3, 1), (2, 0)`.
- The single and double rules hold exactly for exchange-symmetric, non-Hermitian `V` and random
  `a`, `b` in the span of the remaining Cayley columns, for every `i` and every ordered pair
  `i ≠ j`, with `(n, N) = (3, 2), (4, 2), (4, 3)` (single also `(3, 1)`); without exchange symmetry
  both fail on exact instances (Hermitian `V`, `n = 3, 4`).
- Three replaced orbitals: `n = 6`, `N = 3`, `χ` the last three Cayley columns, random `T` and `V`
  with no symmetry: the matrix element is `0`.

*Needs:* 2.0, 2.1(a), 2.2; the Conventions on symmetrisation; Mathlib `Matrix.det_apply`.

### 2.5 Brillouin's theorem and the variational bounds

Prove `brillouin`: for Hermitian `T`, `V`, `V` exchange-symmetric and orthonormal `φ`,
`F(γ)` commutes with `γ = orbitalDensity φ` exactly when `⟨Φ, H slater (update φ i a)⟩ = 0` for
every `i` and every `a` orthogonal to all `φⱼ`; in particular at every local minimiser of 1.2.
(Brillouin, attributed; proved here.)

Lieb's inequality is a short consequence of 1.3 and 2.4 (route below) and is not stated in
`Suggested.lean`: if `V` is nonnegative on antisymmetric vectors, every `T` and every admissible
`γ` admit orthonormal orbitals `φ` with `re ⟨slater φ, H slater φ⟩ ≤ E(γ)` (Bach, Lieb and
Solovej, arXiv:cond-mat/9312044, the paragraph after Theorem 2.12, p. 23, and eq. (2c.36), p. 24,
for `V` positive on all two-particle vectors).

So the lowest energy `E₀` of `H` on unit antisymmetric functions is at most the infimum of `E`
over the admissible set. Without positivity, for every rank-`N` projection `P` an orthonormal
basis `φ` of its range gives `re ⟨slater φ, H slater φ⟩ = E(P)` by 2.2 and 2.4, so `E₀` is at most
the Hartree–Fock energy over projections for every `V`.

Route. *Brillouin.* By 2.4, the matrix elements are `⟨φᵢ, F a⟩`, `a ∈ ker γ`; since the `φᵢ`
span `ran γ`, all vanish exactly when `γ F (1 − γ) = 0`. Now
`Fγ − γF = (1 − γ) F γ − γ F (1 − γ)`, and for Hermitian `F` (Conventions) the first term is the
adjoint of the second, so this is the commutation.
*Lieb's inequality.* 1.3 gives a rank-`N` projection `P` with `E(P) ≤ E(γ)`; its trace is its rank,
so its range has an orthonormal basis `φ` of `N` vectors and `orbitalDensity φ = P`; 2.4 gives
`re ⟨slater φ, H slater φ⟩ = E(P)`.

**Checks.**

- Density–density `V` with diagonal `T`, `n = 4`, `N = 2`, `φ = (e₀, e₁)`: `F` commutes with `γ`
  and all four single matrix elements vanish; for random Hermitian exchange-symmetric `V` and
  Cayley orbitals, `[F, γ] ≠ 0` and some single matrix element is nonzero.
- In the descents of 1.3 with a `V` that is neither Hermitian nor exchange-symmetric, the Slater
  determinant of the final projection has energy exactly `E(P) ≤ E(γ)`.
- `N = 0`: both sides of Brillouin's equivalence hold trivially; `N = n`: the only `a` is `0`.

*Needs:* 1.3, 2.1, 2.2, 2.4; Mathlib `Matrix.IsHermitian.spectral_theorem` (an orthonormal basis
of `ran P`).

### 2.6 Thouless' theorem

Prove `thouless`: for orthonormal `φ`, `γ = orbitalDensity φ`, and any family `ψ` with
`c = ⟨slater φ, slater ψ⟩ ≠ 0`, there is exactly one matrix `X` with `(1 − γ) X γ = X` and
`slater ψ = c • slater (fun i ↦ φ i + X *ᵥ φ i)`. (Thouless, attributed; proved here.)

Moreover, for every `X` with `(1 − γ) X γ = X`, the amplitudes are overlaps:
`⟨slater (update φ i a), slater (φ + Xφ)⟩ = ⟨a, X φᵢ⟩` for `a` orthogonal to all `φⱼ` (by 2.1(a)
the overlap matrix is the identity except row `i`, whose diagonal entry is `⟨a, φᵢ + Xφᵢ⟩`), and
`X² = 0`, so `Matrix.kroneckerPower (Fin N) (1 + X)` maps `Φ` to `slater (φ + Xφ)` and
`1 + X = exp X`: this is the single-excitation exponential of coupled-cluster theory.

Route. Let `M = [⟨φ i, ψ j⟩]`; `det M = c ≠ 0` by 2.1(a). Put `χ j = ∑ₖ (M⁻¹) k j • ψ k`; then
`γ χⱼ = φⱼ`, and `slater ψ = det M • slater χ` (2.0, column operations). With
`X = ∑ⱼ |(1 − γ)χⱼ⟩⟨φⱼ|`, `X φⱼ = (1 − γ)χⱼ`, so `φⱼ + Xφⱼ = χⱼ`, and `(1 − γ) X γ = X`.
Uniqueness: if `X′` is another, then `slater (φ + X′φ) = slater (φ + Xφ)` because `c ≠ 0`; the
amplitude formula gives `⟨a, X′φᵢ⟩ = ⟨a, Xφᵢ⟩` for all `a ∈ ker γ`, and `X′φᵢ`, `Xφᵢ` lie in
`ker γ`, so `X′φᵢ = Xφᵢ`; finally `X′ = X′γ = ∑ᵢ |X′φᵢ⟩⟨φᵢ|` is determined.

**Checks.**

- For random Gaussian-integer `ψ` and Cayley `φ` with `(n, N) = (3, 2), (4, 2), (4, 3), (3, 1)`
  and `(2, 0)`: `(1 − γ) X γ = X`, `slater ψ = c • slater (φ + Xφ)` with `c = det M`, the
  amplitudes equal `⟨a, X φᵢ⟩` for `a` the remaining Cayley columns, and `X² = 0`.
- `N = 0`: `γ = 0`, so `X = 0` is forced, and `slater ψ = 1 = c`.

*Needs:* 2.0, 2.1(a).

### Examples

- Overlaps and principal angles: for orthonormal `φ`, `ψ`, `|⟨slater φ, slater ψ⟩|² = det(MᴴM)`
  is the product of the squared singular values of `M = [⟨φ i, ψ j⟩]`, which are the principal
  cosines of the two spans (Tau Ceti `TauCeti.cosPrincipalAngles`,
  `Orthonormal.principalCosines_eq_cosPrincipalAngles`; OperatorTheory/PrincipalAngles, Part A).
  Two determinants are orthogonal exactly when some principal angle is a right angle.
- The Hartree–Fock ground state of 1.2–1.4 is the Slater determinant of an orthonormal basis of
  `ran γ`; by 2.4 its energy is `E(γ)` and by 2.5 it bounds `E₀` from above.

### Dependencies

2.0 is definitions. 2.1 needs 2.0. 2.2 needs 2.0 and 2.1(a). 2.3 needs 2.1 and 2.2. 2.4 needs
2.0, 2.1(a) and 2.2. 2.5 needs 1.3, 2.1, 2.2 and 2.4.
2.6 needs 2.0 and 2.1(a).

## Scope and ownership

This roadmap owns Hartree–Fock theory for `N` fermions in a finite-dimensional one-particle space:
the functional on one-particle density matrices with its quadratic expansion and Koopmans'
identities, the Hartree–Fock equations, Lieb's variational principle, the absence of unfilled
shells, Slater determinants and their overlaps in the first-quantised model of antisymmetric
functions on `ι^N`, one-particle density matrices and the Pauli principle, Coleman's theorem, the
Slater–Condon rules, Brillouin's theorem with the variational bounds, and Thouless' theorem.

- *QuantumFoundations* §6.2 restricts the completed tensor power `H^(⊗̂n)` to the fermionic sector
  `Λⁿ(H)` (the range of the antisymmetriser of OperatorAlgebraDynamics D8); for `H = ℂ^ι` this
  sector is the space of antisymmetric functions above, and nothing of §6.2 is restated. Its §6.4
  proves that the CAR occupation basis is a Hilbert basis of the antisymmetric Fock space; for
  `H = ℂ^ι` its words of length `N` are, up to the factor `√N!`, the Slater determinants of basis
  vectors. 2.1(b) is the counterpart of that statement for one particle number in the
  coordinate model of antisymmetric functions on `ι^N`, which is the carrier of Layer 2, with the
  dimension count; the transport between the two carriers is not stated here.
- *OperatorAlgebraDynamics* D8 constructs CAR algebras, the antisymmetric Fock space and the
  gauge-invariant quasi-free states with the determinant Wick formula, grand-canonical objects on
  the Fock space; this roadmap works at fixed particle number and restates none of them.
- *OperatorTheory/Majorization* (Ky Fan's trace inequality, MAJ-A27) and
  *OperatorTheory/PrincipalAngles* are cited in the Examples of the two layers only.
- Already in the libraries and cited: the Cauchy–Binet expansion over all maps
  (`Matrix.det_mul_eq_sum_prod_mul_det_submatrix`), Kronecker powers, partial traces, Rado's
  theorem, Ky Fan's inequality and principal angles (Tau Ceti); exterior powers, their bases and
  the real inner product on them, the spectral theorem and the Loewner order (Mathlib).
- Public Lean developments outside the pinned libraries have Slater determinants of their own:
  the lattice density-functional files of the LeanPool collection (real orbitals on a finite
  lattice), the LiebThirring project (continuum orbitals with spin) and FQChem (vectors of
  Mathlib's exterior power); PhysLean has a Wick theorem for super-commuting operator algebras.
  The Slater determinant `(√N!)⁻¹ det [φ j (x i)]` and the antisymmetry condition are the
  textbook formulas, which those developments also use; no declaration here is taken from them.

Not treated: the analytic theory for atoms and molecules (existence of minimisers in `L²(ℝ³)`
after Lieb and Simon, Coulomb singularities, ionisation bounds); finite-temperature Hartree–Fock
theory; restricted, spin-adapted and generalised (Bogoliubov) Hartree–Fock theory; pure-state
`N`-representability (the generalised Pauli constraints) and the representability of two-particle
density matrices; second-order stability conditions of Hartree–Fock minimisers; Roothaan's
equations in a non-orthogonal basis beyond the change of basis of the Layer 1 Examples;
configuration interaction, coupled cluster and density-functional theory, which can rest on the
two layers; and self-consistent-field iterations (Roothaan's algorithm, level shifting, the
convergence theory of Cancès and Le Bris).

## Exact supplier contracts

### From Mathlib

- `Matrix.PosSemidef` (with `open scoped ComplexOrder`), `Matrix.nonneg_iff_posSemidef`,
  `Matrix.le_iff` (`Mathlib/Analysis/Matrix/Order.lean`), `Matrix.PosSemidef.diag_nonneg`.
- `Matrix.IsHermitian.spectral_theorem`: a Hermitian matrix is unitarily diagonal with real
  eigenvalues (1.3, 2.3).
- `Matrix.det_apply` (Leibniz), `Matrix.det_mul`, `Matrix.det_updateCol_add`
  (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`) (2.0, 2.1).
- `exteriorPower.ιMulti`, `exteriorPower.alternatingMapLinearEquiv_apply_ιMulti`
  (`Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`), `exteriorPower.finrank_eq`: the `n`-th
  exterior power of a free module of rank `r` has rank `r.choose n`
  (`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean`) (2.1(c)).
- `exteriorPower.inner_ιMulti_ιMulti`, `OrthonormalBasis.exteriorPower`
  (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean`, real inner product spaces), cited in
  the Conventions.
- `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`, `LinearEquiv.finrank_eq`,
  `Module.finrank_fintype_fun_eq_card`, `LinearMap.finrank_le_finrank_of_surjective`,
  `LinearIndependent.fintype_card_le_finrank` (2.1(c));
  `Orthonormal.exists_orthonormalBasis_extension` (2.2); `IsLocalMin.deriv_eq_zero` (1.2);
  `IsMinOn.isLocalMinOn` (1.4); `IsCompact.exists_isMinOn` (Layer 1 Examples);
  `Set.extremePoints` (2.3); `Equiv.Perm.permMatrix`, `Matrix.kronecker` (Conventions).

### From Tau Ceti

- `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` (`TauCeti/LinearAlgebra/Matrix/Divisibility.lean`):
  for `A : Matrix ι m R`, `B : Matrix m ι R` over a commutative ring,
  `det (A * B) = ∑_f (∏ i, A i (f i)) * det (B.submatrix f id)` over all maps `f : ι → m` (2.1(a)).
- `Matrix.kroneckerPower`, `Matrix.kroneckerPower_apply` (entries `∏ i, A (v i) (u i)`),
  `Matrix.kroneckerPower_mul` (`TauCeti/LinearAlgebra/Matrix/KroneckerPower.lean`) (2.0, 2.2, 2.6).
- `Matrix.partialTraceRight`, `Matrix.partialTraceRight_apply`
  (`TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean`) (Conventions).
- `TauCeti.mem_convexHull_range_comp_perm_iff` (`TauCeti/Analysis/Convex/PermutationOrbit.lean`):
  for antitone `w : Fin n → ℝ`, `x` lies in the convex hull of the permutations of `w` exactly
  when the prefix sums `TauCeti.prefixSum k` of the decreasing rearrangement of `x` are at most
  those of `w` and the totals agree (2.3).
- `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`
  (`TauCeti/Analysis/InnerProductSpace/KyFan.lean`) (Layer 1 Examples).
- `TauCeti.cosPrincipalAngles`, `Orthonormal.principalCosines_eq_cosPrincipalAngles`
  (`TauCeti/Analysis/InnerProductSpace/Orthonormal/Overlap.lean`) (Layer 2 Examples).
- `TauCeti/LinearAlgebra/ExteriorAlgebra/HermitianMetric.lean` (the Hermitian form on `⋀ M` for
  which the increasing wedge basis is orthonormal), `TauCeti.antisymmetricTensors`
  (`TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean`) and
  `TauCeti.antisymmetricTensorsEquivExteriorPower` (`TauCeti/LinearAlgebra/TensorSquare.lean`):
  cited in the Conventions.

### From roadmaps on main

Cited in the scope section and the Examples only (QuantumFoundations §6.2 and §6.4,
OperatorAlgebraDynamics D8, OperatorTheory/Majorization MAJ-A27, OperatorTheory/PrincipalAngles
Part A); no target rests on them.

## References

- V. Bach, *Hartree–Fock theory, Lieb's variational principle, and their generalizations*,
  arXiv:2209.10189v1 (2022).
- V. Bach, E. H. Lieb, M. Loss, J. P. Solovej, *There are no unfilled shells in unrestricted
  Hartree–Fock theory*, Phys. Rev. Lett. 72 (1994) 2981–2983; arXiv:cond-mat/9307066v1.
- V. Bach, E. H. Lieb, J. P. Solovej, *Generalized Hartree–Fock theory and the Hubbard model*,
  J. Stat. Phys. 76 (1994) 3–89; arXiv:cond-mat/9312044v1.
- E. Cancès, C. Le Bris, *On the convergence of SCF algorithms for the Hartree–Fock equations*,
  M2AN Math. Model. Numer. Anal. 34 (2000) 749–774 (Numdam).
- Attributed without locators (no open copy read): E. H. Lieb, *Variational principle for
  many-fermion systems*, Phys. Rev. Lett. 46 (1981) 457–459, as cited by Bach and by Bach, Lieb
  and Solovej, and A. J. Coleman, *Structure of fermion density matrices*, Rev. Mod. Phys. 35
  (1963) 668–689, as listed by Bach; Koopmans' identity, the Slater–Condon rules, Brillouin's theorem and Thouless'
  theorem are attributed by name.
