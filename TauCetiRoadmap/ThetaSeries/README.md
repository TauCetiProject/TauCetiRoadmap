# Roadmap: theta series of lattices

The theta series of a positive-definite lattice is the generating function of its representation
numbers, and the theorem that makes it useful is that it is a modular form.  This roadmap builds
that bridge: Poisson summation for a full-rank `ℤ`-lattice in a finite-dimensional real inner
product space (Mathlib has it in dimension one only), the theta series of a lattice and of each
coset of it in its dual, the two transformation laws, the Gauss sums that the general-level theorem
rests on, and the two modularity theorems — level one for an even unimodular lattice, and `Γ₀(N)`
with a quadratic nebentypus for an even lattice of level `N` (Hecke–Schoeneberg).  It ends by
identifying the theta series of `E₈` and of the Leech lattice inside the level-one graded ring and
reading the classical representation-number formulas off those identities.

The primary object is a full `ℤ`-lattice `L` in a finite-dimensional **real inner product space**
`E`, expressed by `Submodule ℤ E` together with Mathlib's `IsZLattice ℝ L`.  This is not the carrier
of the [integral-lattices roadmap](../IntegralLattices/README.md), which is a `ℤ`-submodule of a
rational vector space with a rational bilinear form, and the difference is not cosmetic: the theta
series is a sum of `exp(π i ‖v‖² τ)` over `L`, so it needs a real norm to converge, and Poisson
summation needs the Haar measure of `E` and the covolume of `L`.  The two models are related by a
bridge built in Layer 2, and *all* discriminant-group and discriminant-form theory is consumed from
that roadmap through the bridge rather than redeveloped here.

**Rank.**  Layers 1–3 — Poisson summation, the lattice model, and the theta series with their
convergence, `q`-expansions, functoriality and the rank-one comparison with `jacobiTheta` — are
stated for a lattice of **arbitrary** rank.  From Layer 4 on, every statement that carries an
automorphy factor assumes **even** rank `n = 2k`, so that the factor is `(τ/i)^k = (-i)^k * τ^k`
with `k : ℕ`, an honest integer power, and `Complex.cpow` stays out of the modularity layers.  A
lattice of odd rank has a theta series of half-integral weight, which means the metaplectic group,
a theta multiplier and a branch of `√τ` tracked through every statement; half-integral weight is
out of scope, and a contributor should not attempt it here.  The one odd-rank *transformation*
statement in Mathlib, `jacobiTheta_S_smul`, is consumed only through its square (Layer 4).

Suggested home: `TauCeti/NumberTheory/ThetaSeries/`, with separate files for lattice Poisson
summation, the real lattice model and the bridge, the theta series and its `q`-expansion, the
transformation laws, the level-one theorem, Gauss sums, the general-level theorem, and the worked
lattices.

## Scope and ownership

Three roadmaps touch theta series of lattices.  The boundary between them is the following, and
each of the three records the same boundary.

### Owned here

- **Poisson summation for a full-rank `ℤ`-lattice** in a finite-dimensional real inner product
  space, for Schwartz functions, with its translation, summability and Gaussian corollaries
  (Layer 1), and the dual lattice itself together with the biduality and covolume lemmas that go
  with it (2A, 2C).  This is the generic theorem; anyone who needs Poisson summation on a lattice
  takes it, and those lemmas, from here.
- The **real lattice model** — dual lattice, determinant, level, shells, representation numbers,
  scaling and orthogonal sums — and the **bridge** to the rational carrier of the integral-lattices
  roadmap (Layer 2).
- The **Kronecker symbol** and the **discriminant character** `χ_L` (Layers 2 and 6).
- The **theta series** `Θ_L` and the **coset theta series** `θ_γ`, `γ ∈ L^∨/L`, as holomorphic
  functions on `ℍ`, with convergence, `q`- and `q_N`-expansions, and functoriality (Layer 3).
- The **transformation laws** under `T` and `S`, scalar and vector-valued (Layer 4).
- **Gauss sums of a lattice**, their reciprocity law, their evaluation, and Milgram's formula for
  a positive-definite lattice (Layer 6).
- **Modularity**: `Θ_L ∈ M_k(SL(2,ℤ))` for even unimodular `L`, the Hecke–Schoeneberg theorem
  `Θ_L ∈ M_k(Γ₀(N), χ_L)`, and `θ_γ ∈ M_k(Γ(N))` (Layers 5 and 7).
- The **applications**: `Θ_{E₈}`, the Leech lattice, the theta identity for the rank-`16` pair,
  `A₂` and `D₄` (Layer 8).

### Consumed, not redefined

- From the [integral-lattices roadmap](../IntegralLattices/README.md), by milestone label: the
  rational carrier `IntegralLattice` and its predicates (0A), the dual (1B) and the discriminant
  group `A_L = L^∨/L` (1C), the discriminant bilinear form `b_L` and (for even `L`) the half-norm
  quadratic form `q_L` (1D), the integral and even overlattice/isotropic-subgroup correspondences
  (1E, 1F), finite bilinear and quadratic modules with their isotropic and Lagrangian subgroups,
  primary decomposition and generator classification (1G), the level (1J), the ADE lattices with
  their discriminant forms and the `D₈⁺ ≅ E₈` calculation (1K), and the rank-`16` pair `E₈ ⊕ E₈`
  and `D₁₆⁺` with their non-isometry (6D).  This roadmap adds no competing definition of any of
  these; it transports them across the Layer-2 bridge.
- From the [modular-forms roadmap](../ModularForms/README.md): `modFormCharSpace`, the nebentypus
  decomposition, the level-one graded ring, and the general-level dimension formulas.
- From Mathlib: everything listed under *Existing library material*.

### Not owned here

- **The number-field theta function and its Mellin transform** — the real-parameter Gaussian
  theta of an ideal lattice in the mixed space, its transformation with level and epsilon, and the
  completed zeta and Hecke L-functions it produces — belong to the L-functions roadmap.  That
  roadmap owns only what is specific to number fields, and *consumes* from here, by name,
  `poissonSummation`, `summable_poisson_left`, `summable_poisson_right`, `gaussian`,
  `gaussian_apply` and `fourier_gaussian` of Layer 1, together with `dual` (fixed in the
  conventions), `dual_dual` (2A) and `covolume_dual` (2C).  ⚠ Layer 1 quantifies over a real inner
  product space `E`, and a consumer whose own model is not one — the mixed space of a number field
  carries a product sup norm — applies it after transporting along a linear isometry.  That
  transport belongs to the consumer, and Layer 1 is not weakened to avoid it.
- **Discriminant forms and everything arithmetic about the rational lattice** — Jordan
  splittings, the genus, the Gauss-sum invariant `sign q` of a finite quadratic module (1H) and
  Milgram's theorem at every signature (1I), Nikulin's theory, the classification of unimodular
  lattices in low rank — belong to the integral-lattices roadmap.  It *consumes* the theta series,
  its transformation laws and its modularity from here, and states no theta series of its own.
  ⚠ Milgram is deliberately not deduplicated.  That roadmap's 1I is every signature, by finite
  arithmetic from 1H; 6C here is the positive-definite instance, by theta asymptotics, because
  Layer 6 needs it in that form and because it gives a second route to `8 ∣ n`.  Both are wanted,
  the bridge of 2D identifies them, and neither is derived from the other; collapsing them would
  drop the indefinite case, which is out of scope here.
- **The Weil representation** of `SL(2, ℤ)` on `ℂ[A_L]`, and the presentation
  `SL(2, ℤ) ≅ ⟨S, T | S⁴ = 1, (ST)³ = S²⟩`.  Neither is needed for any theorem of this roadmap: the
  vector-valued transformation law (Layer 4) and the `Γ(N)`-modularity of the coset series
  (Layer 7) are proved directly.  A roadmap for the Weil representation would need the
  finite-quadratic-module signature (the integral-lattices roadmap's 1H) to state
  the `S`-matrix, and the explicit local formulas of Scheithauer and Strömberg for its values on
  `Γ₀(N)` and its congruence kernel; it would consume Layer 6 here.
- Theta series with spherical coefficients, Siegel and Jacobi theta series, Eisenstein series
  with character, the Siegel–Weil formula, sphere packing, the classification or uniqueness of
  any lattice, and the construction of Niemeier lattices.
- Half-integral weight, as above.

The `D₁₆⁺` application (Layer 8) is the one target whose *input* is a lattice the
integral-lattices roadmap constructs by gluing; it is sequenced after that roadmap's 6D and
stated against it, and everything before it is independent of that construction.

## Standing conventions

Decide these once; implementors diverge otherwise, and a convention that drifts halfway through a
transformation law is unrecoverable.

- **The ambient space and the carrier.**  `E` is a finite-dimensional real inner product space
  (`[NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]`, with
  `[MeasurableSpace E] [BorelSpace E]` so that `volume` is the Haar measure normalised by
  orthonormal bases), and a lattice is `L : Submodule ℤ E` with `[DiscreteTopology L]` and
  `[IsZLattice ℝ L]`.  Use Mathlib's `Mathlib/Algebra/Module/ZLattice/*` API — bases, covolume,
  discreteness, the summability estimates — and do not introduce a private finite-free model.  The
  **rank** is `Module.finrank ℝ E`, equal to `Module.finrank ℤ L`.
- **Positive definiteness is structural, not a hypothesis.**  The form is the inner product of `E`,
  so definiteness holds by construction and no `PosDef` side condition appears anywhere.  This is
  the deliberate difference from the integral-lattices carrier, where definiteness is a predicate
  because indefinite and degenerate lattices are objects of the same type.  Indefinite lattices have
  no convergent theta series and are not in scope.
- **The form as a bilinear form.**  Where a bilinear form is needed, it is Mathlib's
  `innerₗ E : LinearMap.BilinForm ℝ E`, not a fresh copy.  **Integral** means
  `∀ x ∈ L, ∀ y ∈ L, ⟪x, y⟫_ℝ ∈ ℤ`, and the definition of record is the submodule inequality
  `L ≤ (innerₗ E).dualSubmodule L`, with the elementwise form proved equivalent.  **Even** means
  `∀ x ∈ L, ∃ m : ℤ, ‖x‖ ^ 2 = 2 * m`.  Do not infer evenness from integrality; do prove that
  evenness implies integrality, by polarization.
- **The dual lattice** is literally `L^∨ = (innerₗ E).dualSubmodule L`, Mathlib's
  `LinearMap.BilinForm.dualSubmodule` with `R = ℤ`, `S = ℝ`, `M = E`.  Do not define a second
  dual-lattice notion for the real model.  **Unimodular** means the equality `L = L^∨`; that
  `ZLattice.covolume L volume = 1` is *equivalent* to it for an integral `L` is a theorem of Layer 2,
  not an alternative definition.
- **Determinant and discriminant group.**  `det L := (ZLattice.covolume L volume) ^ 2`.  The
  discriminant group of the real model is the literal quotient `A_L := L^∨ ⧸ L`, finite of order
  `det L` for integral `L`; for integral `L` the determinant is therefore a positive integer, equal to
  `|det Gram(b)|` for any `ℤ`-basis `b`.  Never call the covolume the determinant.
- **Discriminant forms come from the integral-lattices roadmap.**  The bilinear form `b_L` on `A_L`
  valued in `AddCircle (1 : ℚ)` and — for even `L` only — the quadratic form
  `q_L(x + L) = ‖x‖² / 2 mod ℤ` in the **half-norm** convention are that roadmap's; this roadmap
  transports them across the Layer-2 bridge and adds no competing definition.  Values quoted from
  Nikulin's full-norm `ℚ/2ℤ` convention are halved before use, exactly as in that roadmap.  Where a
  statement here needs `e(q_L(γ))` or `e(b_L(γ, δ))` as a complex number, it is
  `Complex.exp (2 π i ‖γ‖² / 2)` or `Complex.exp (2 π i ⟪γ, δ⟫)` computed on representatives in
  `E`, proved independent of the representatives; `e(x)` abbreviates `exp(2 π i x)` throughout this
  document.
- **The level.**  `level L` is the least `N : ℕ`, `0 < N`, with `N • q_L = 0`; equivalently the
  least `N` with `N ‖x‖² / 2 ∈ ℤ` for every `x ∈ L^∨`; equivalently the least `N` for which
  `N · Gram(b)⁻¹` is an even integral matrix, for any `ℤ`-basis `b`.  It is defined for even `L`
  only.  Prove existence (so the `sInf` is not junk), and prove `level L = 1 ↔ L` is even
  unimodular.  ⚠ The level is *not* the exponent of the group `A_L`, and it is not `det L`; both
  agree with it in small examples and neither agrees in general.  The level controls the dual
  inclusion `N • L^∨ ≤ L`, and `det L ∣ N^n` follows.
- **Scaling is not an invariance.**  For `0 < c`, the lattice `c • L` has dual `c⁻¹ • L^∨`,
  determinant `c^{2n} det L`, and theta series `Θ_{c • L}(τ) = Θ_L(c² τ)`.  None of the predicates
  integral, even, unimodular is preserved by a general positive scaling: `c • L` is integral if and
  only if `c² ⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, and an integral lattice scaled by `c ≠ 1` is never
  unimodular.  The scalings that occur here are by `√m` for a positive integer `m`, and they are
  stated as such: `√m • L` is integral when `L` is, even when `L` is even or `m` is even, and has
  `det (√m • L) = m^n det L`.  `√2 • E₈` is even and integral and is not unimodular.  A negative
  scalar gives the same lattice, and that is a lemma, not a convention.
- **The theta series and its `q`-parameter.**  For `τ : ℍ`,
  `Θ_L(τ) = ∑' v : L, Complex.exp (π * I * ‖v‖ ^ 2 * τ)`, and for `γ ∈ L^∨` the coset series
  `θ_{γ+L}(τ) = ∑' v : L, Complex.exp (π * I * ‖γ + v‖ ^ 2 * τ)`, depending only on `γ + L ∈ A_L`.
  With `q = Complex.exp (2 π i τ)` and `L` even, `Θ_L(τ) = ∑_{m ≥ 0} r_L(2m) q^m`, where
  `r_L(t) = #{v ∈ L | ‖v‖² = t}`.  ⚠ The exponent is `π i ‖v‖² τ`, not `2 π i ‖v‖² τ`: with this
  choice the `q`-expansion of an even lattice is indexed by `m = ‖v‖²/2` and the level-one series
  match `E₄` and `Δ` on the nose.
- **Coset representation numbers and `q_N`-support.**  For `γ ∈ L^∨` and `t : ℝ`,
  `r_{γ+L}(t) = #{v ∈ L | ‖γ + v‖² = t}`.  For even `L` of level `N` and
  `q_N = Complex.exp (2 π i τ / N)`, the coset series has the expansion
  `θ_{γ+L}(τ) = ∑_{m ≥ 0} r_{γ+L}(2m/N) q_N^m`, and every exponent `m` with a nonzero coefficient
  satisfies `m ≡ N q_L(γ) (mod N)`, where `N q_L(γ) ∈ ℤ/Nℤ` is the well-defined residue of
  `N ‖γ‖²/2`.  ⚠ `q_L(γ) ∈ ℚ/ℤ` is a congruence class of exponents, not an exponent: the first
  nonzero exponent is `N/2` times the minimal squared norm in the coset `γ + L`, and it is
  determined by that minimum, not by `q_L(γ)`.  The support congruence is what boundedness at every
  cusp is read off from (Layer 7).
- **The theta series of the dual.**  `Θ_{L^∨} = ∑_{γ ∈ A_L} θ_{γ+L}`, a finite sum over the
  discriminant group.  The lattice's own series is the single term `θ_{0+L} = Θ_L`.
- **Two names, one object.**  `thetaSeries L : ℍ → ℂ` is the bare function; the bundled
  `ModularForm` produced in Layers 5 and 7 is a separate declaration whose coercion is
  `thetaSeries L`, proved by `rfl` or a `simp` lemma.  State analytic facts about the function and
  membership facts about the bundled form; do not restate the transformation laws on a raw `ℍ → ℂ`
  once the bundled form exists.
- **The slash action and the modular group** are Mathlib's: `ModularForm.slash`, `SlashAction`,
  `ModularGroup.S`, `ModularGroup.T`, `CongruenceSubgroup.Gamma`, `Gamma0`, `Gamma1`, and the
  right-action convention `f ∣[k] (A * B) = (f ∣[k] A) ∣[k] B`.  Spaces with nebentypus are Tau
  Ceti's `modFormCharSpace k χ` (the joint diamond eigenspace inside
  `ModularForm ((Gamma1 N).map (mapGL ℝ)) k`), with `χ : (ZMod N)ˣ →* ℂˣ`; the classical
  transformation law is reached through the landed `mem_modFormCharSpace_iff_nebentypus`.  Do not
  introduce a `ModularFormWithCharacter` type; that decision belongs to the modular-forms roadmap
  and is already made there.
- **Gauss sums of a lattice.**  For an even lattice `L`, `a : ℤ` and `0 < c : ℕ`,
  `G_L(a, c) = ∑_{y ∈ L/cL} e(a ‖y‖² / (2c))`, a finite sum over the quotient `L ⧸ c • L` of order
  `c^n`, well defined because `L` is even.  The twisted sums `G_L(a, c; m) = ∑_{y ∈ L/cL}
  e(a ‖y‖²/(2c) + ⟪y, m⟫/c)` for `m ∈ L^∨` are well defined for the same reason.  Every Gauss sum in
  this roadmap is one of these two.
- **The nebentypus.**  `D_L = (-1)^k det L` is the **signed discriminant** of an even lattice of
  rank `2k`; it is `≡ 0` or `1 (mod 4)`.  The **Kronecker character** `(D_L / ·)` is a Dirichlet
  character modulo `|D_L|`; the **nebentypus** `χ_L : DirichletCharacter ℂ N`, `N = level L`, is
  the character induced at level `N` from its primitive character, which is legitimate because the
  conductor of `(D_L / ·)` divides `N` — a theorem of Layer 6, not a convention.  Its
  unit-homomorphism face, needed by `modFormCharSpace`, is `MulChar.equivToUnitHom χ_L`.  Keep both
  faces, as the modular-forms roadmap does; do not fuse them.
- **Isometry** means a `LinearIsometryEquiv` of the ambient spaces carrying one lattice onto the
  other.  Every invariance statement (of `det`, `level`, `A_L`, `q_L`, `r_L`, `Θ_L`) is stated
  against that, never against a bare additive or module equivalence.
- **Orthogonal direct sums** use `WithLp 2 (E × F)` with the product inner product, and the
  external direct sum of lattices inside it.  Fix this once: `Θ_{L ⊕ M} = Θ_L · Θ_M`,
  `det (L ⊕ M) = det L * det M`, `level (L ⊕ M) = lcm (level L) (level M)`, and `A_{L⊕M} ≅ A_L × A_M`
  as finite quadratic modules.  Integrality, evenness and unimodularity are each preserved by
  orthogonal sum and by isometry.

## Existing library material to consume

### Mathlib

- `Mathlib/Algebra/Module/ZLattice/Basic.lean` — `IsZLattice`, `ZSpan` bases, fundamental domains,
  discreteness.  `.../Covolume.lean` — `ZLattice.covolume`, `covolume_pos`, `covolume_ne_zero`,
  `covolume_eq_det`, `covolume_eq_det_mul_measureReal`, and the covolume/relative-index comparison
  for a sublattice.  The last is what turns `det L = [L^∨ : L]` into a citation rather than a proof.
  `.../Summable.lean` — `normBound`, `summable_norm_rpow`, `summable_norm_sub_rpow`: the decay
  estimates that make every theta sum summable without a fresh lattice-point count.
- `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean` — `LinearMap.BilinForm.dualSubmodule`,
  `mem_dualSubmodule`, `le_flip_dualSubmodule`, `dualSubmoduleToDual`, the dual-basis description.
  Instantiated at `R = ℤ`, `S = ℝ`, `M = E` this *is* the dual lattice; complete its advertised
  missing consequences rather than reimplementing it.
- `Mathlib/Analysis/InnerProductSpace/Basic.lean` — `innerₗ` and its symmetry.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`, `section InnerProductSpace` —
  the Fourier transform of `x ↦ cexp (-b ‖x‖² + c ⟪w, x⟫)` on a finite-dimensional real inner
  product space, with `0 < b.re`.  This is the Gaussian input to the `S`-transformation, already at
  the generality this roadmap needs; do not redo it in coordinates.
- `Mathlib/Analysis/Distribution/SchwartzSpace.lean` — `SchwartzMap`, `compCLMOfContinuousLinearEquiv`,
  the seminorm API.  Lattice Poisson summation is stated for Schwartz functions.
- `Mathlib/Analysis/Fourier/PoissonSummation.lean` — Poisson summation **for `ℤ ⊆ ℝ` only**, for
  Schwartz functions and for functions with power decay.  It is the base case of the Layer-1
  theorem, iterated `n` times.
- `Mathlib/Analysis/Fourier/FourierTransform.lean` — `𝓕`, `VectorFourier.fourierIntegral`, and
  the behaviour of the transform under translation, modulation and linear isometries.
- `Mathlib/NumberTheory/ModularForms/*` — `ModularForm`, `CuspForm`, `ModularFormClass`,
  `SlashAction`, `ModularForm.slash`, `CongruenceSubgroup.Gamma/Gamma0/Gamma1`, `UpperHalfPlane`,
  `qExpansion`, `cuspFunction`, `BoundedAtCusp`, `IsZeroAtImInfty`, and the level-one theory:
  invariance under `S` and `T` implies invariance under `SL(2, ℤ)`; `ModularForm.dimension_level_one`
  and the level-one Sturm bound; `CuspForm.discriminant` in `.../Discriminant.lean`, which is built
  from the two transformation laws of `Δ` exactly as `Θ_L` is built here and is the model to
  imitate.
- `Mathlib/NumberTheory/ModularForms/EisensteinSeries/*` — `EisensteinSeries.E hk` for `3 ≤ k`, the
  abbreviations `E₄`, `E₆`, and the `q`-expansion: the constant term is `1` and the `m`-th
  coefficient is `-(2k / bernoulli k) * σ (k-1) m`.  Every representation-number corollary in
  Layer 8 is this plus an identity of forms.
- `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean` — `jacobiTheta`,
  `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul`, `hasSum_nat_jacobiTheta`.  This is the rank-one
  theta series of `ℤ ⊆ ℝ`; Layer 3 proves the identification of functions and `q`-expansions, which
  is the cheapest available check that the conventions above are the standard ones.
- `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean` — `jacobiSym` (`J(a | b)` for odd `b`),
  its complete multiplicativity, and quadratic reciprocity.  The Kronecker symbol is *not* there and
  is built in Layer 2 on top of it.
- `Mathlib/NumberTheory/GaussSum.lean` and `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/*` —
  `gaussSum` of a multiplicative character against an additive one, `gaussSum_mul_gaussSum_eq_card`,
  `gaussSum_sq`, and the quadratic character of `ZMod p`.  Layer 6 needs the rank-one quadratic
  Gauss sum modulo an odd prime *only through its square*, so Gauss's sign determination is never
  needed.
- `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` — `DirichletCharacter`, `changeLevel`,
  `conductor`, `primitiveCharacter`, `conductor_dvd_level`.  The nebentypus is assembled from these
  in Layer 6.
- `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`, `.../Complex.lean`, `.../Real.lean` — quadratic
  forms and their diagonalisation over a field of characteristic `≠ 2`, used for the residue-field
  step of Layer 6.

Mathlib has no theta series of a lattice, no Poisson summation above dimension one, no Kronecker
symbol, no Gauss sums of a quadratic form modulo a composite integer, and no statement that any
theta series is a modular form.

### Tau Ceti and neighbouring roadmaps

- The [integral-lattices roadmap](../IntegralLattices/README.md) owns the rational carrier, the dual
  lattice and discriminant group, the discriminant bilinear and quadratic forms, finite bilinear and
  quadratic modules with their `CharacterModule` adjoints and primary decomposition, the
  overlattice/isotropic-subgroup correspondence, and the ADE and `D₈⁺ ≅ E₈` calculations.  Its
  0A, 1B–1G, 1J, 1K and 6D are dependencies of Layers 2, 4 and 8 here, and its 2B and 2D are the
  rational-model faces of the shells of 2G and the covolume identity of 2C.  This roadmap
  contributes exactly one thing back to it: the real-model comparison its conventions section
  anticipates ("add comparison lemmas only where they transport a genuinely useful theorem").
  Layer 2 below is that comparison, and the theorems it transports are the two modularity
  theorems.
- The [modular-forms roadmap](../ModularForms/README.md) owns `modFormCharSpace`, the nebentypus
  decomposition, the valence formula, the level-one graded ring, and the general-level dimension
  formulas.  Its Layer 0 and its level-one summit have **landed** (`modFormCharSpace`,
  `mem_modFormCharSpace_iff_nebentypus`, `isInternal_modFormCharSpace`, `valence_formula`,
  `mvPolynomialEquivModularForms`), and Layers 5–8 here consume them.  Its **Layer 10** — the exact
  dimension formulas at general level — is consumed only by the two general-level identifications
  at the very end of Layer 8, and by nothing before them.  Every headline theorem here is
  independent of it.
- The L-functions roadmap consumes the nine declarations named under *Scope and ownership* —
  Layer 1's Poisson, summability and Gaussian statements, and `dual`, `dual_dual` and
  `covolume_dual` — and owns nothing this roadmap needs.
- Tau Ceti's root-system library and the integral-lattices bridge supply the ADE lattices used in
  the worked examples; do not re-enter Cartan matrices here.

## What is missing (build here)

Poisson summation for a full-rank `ℤ`-lattice in a finite-dimensional real inner product space, in
four steps; the real-model lattice vocabulary and its bridge to the rational model; the level of an
even lattice; the Kronecker symbol; the theta series of a lattice and of each coset of it in its
dual, with convergence, holomorphy, `q`- and `q_N`-expansions and their support; the `T`- and
`S`-transformation laws, scalar and vector-valued; the theorem that an even unimodular lattice has
rank divisible by `8`; the theorem that its theta series is a level-one modular form of weight
`n/2`; the reciprocity law for Gauss sums of an even lattice, their evaluation, Milgram's formula
for a positive-definite lattice, and the theorem that the conductor of `(D_L / ·)` divides the
level; the Hecke–Schoeneberg theorem `Θ_L ∈ M_k(Γ₀(N), χ_L)` and `θ_γ ∈ M_k(Γ(N))`; and the
identification of `Θ_{E₈}` and `Θ_{Leech}` in the level-one graded ring, with the
representation-number formulas that follow.

---

## Layer 1: Poisson summation for a lattice

The analytic engine.  Mathlib has the one-dimensional case and nothing else, and every
transformation law below is an instance of this theorem.  It is stated for a general `E` and
general `n` from the outset; a dimension-`8` or dimension-`24` version would be immediately useless
to the other, and the sphere-packing formalization already demonstrates the cost of the specialized
form (see *Provenance*).  It has no dependency on the lattice vocabulary of Layer 2 and can proceed
beside it.

- **1A. The statement.**  For a full-rank `ℤ`-lattice `L` in a finite-dimensional real inner
  product space `E`, a Schwartz function `f : 𝓢(E, ℂ)`, and `v : E`,
  ```text
  ∑' ℓ : L, f (v + ℓ) = (ZLattice.covolume L)⁻¹ * ∑' m : L^∨, 𝓕 f m * e(⟪v, m⟫)
  ```
  with `𝓕` Mathlib's Fourier transform (`∫ f x * e(-⟪x, y⟫)`), and both families summable.
  ⚠ **The sign convention is fixed by `𝓕`, not by the literature.**  With Mathlib's `𝓕` the
  character is `e(+⟪v, m⟫)`.  Sources that write `e(-⟪v, m⟫)` agree with this after `m ↦ -m`, and
  for the even functions used below the two are literally equal.  State the `+` version as the
  theorem and record the `-` version as a corollary, so no downstream proof guesses.
- **1B. The standard lattice.**  `ℤ^n ⊆ EuclideanSpace ℝ (Fin n)`: prove 1A for it by `n`
  applications of Mathlib's one-dimensional theorem.  This needs, as separate targets: that fixing
  all but one coordinate of a Schwartz function on `EuclideanSpace ℝ (Fin n)` gives a Schwartz
  function on `ℝ`, uniformly in the frozen coordinates (the partial seminorm bounds); that the
  partial Fourier transform in one coordinate of a Schwartz function is Schwartz and that `𝓕` on
  `EuclideanSpace ℝ (Fin n)` is the composite of the `n` partial transforms (Fubini for the
  Fourier integral); and absolute summability of the iterated lattice sums, so that
  `∑' over ℤ^n` may be computed coordinate by coordinate.  ⚠ The reduction from `L` to `ℤ^n` is by
  change of variables, not by induction on `n`: an inductive proof over general lattices would need
  a Schwartz structure on the partial sums that nothing in Mathlib supplies.
- **1C. Fourier change of variables.**  For a linear automorphism `A : E ≃L[ℝ] E` of a
  finite-dimensional real inner product space, `𝓕 (f ∘ A) = |det A|⁻¹ * (𝓕 f) ∘ (A⁻¹)ᵀ`, where
  `(A⁻¹)ᵀ` is the adjoint of the inverse (`ContinuousLinearMap.adjoint`).  Mathlib has the
  isometry case; prove the general one from the change-of-variables formula for `volume` under a
  linear map.  Passing between `E` and `EuclideanSpace ℝ (Fin n)` is the isometry case, so
  automorphisms of one space suffice.
- **1D. Dual-lattice transport.**  For `A : E ≃L[ℝ] E` and a full-rank `L`, `A L` is a full-rank
  lattice, `(A L)^∨ = (A⁻¹)ᵀ L^∨`, and `covolume (A L) = |det A| * covolume L`.  The dual of the
  standard lattice is itself.  Together with a `ℤ`-basis of `L` (which gives the `A` carrying the
  image of `ℤ^n` onto `L`), 1B, 1C and 1D assemble into 1A: `|det A| = covolume L` supplies the
  constant.
- **1E. Summability, separately.**  Prove absolute summability of both sides of 1A for Schwartz `f`,
  from `ZLattice.summable_norm_rpow` and the Schwartz seminorm bounds.  Downstream proofs need the
  summability statements on their own, not only inside the equality.
- **1F. Gaussians.**  Prove that `x ↦ cexp (π i τ ‖x‖²)` is Schwartz for `0 < τ.im`, that
  translating it by `γ` stays Schwartz, and, from Mathlib's inner-product-space Gaussian Fourier
  transform, that
  `𝓕 (fun x ↦ cexp (π i τ ‖x‖²)) y = (τ/i)^{-n/2} * cexp (π i (-1/τ) ‖y‖²)` for `0 < τ.im`.  State
  the general-rank version with Mathlib's `cpow` (this is the one place `cpow` appears, and it is
  not a modularity statement) and the even-rank version `((-i)^k * τ^k)⁻¹` as a genuine integer
  power; the latter is the shape Layer 4 consumes.

## Layer 2: the real lattice model, the bridge, and the arithmetic invariants

Everything downstream reads its hypotheses from this layer, so it is built first and completely.
Rank is arbitrary throughout the layer.

- **2A. Predicates and their equivalences.**  Define integrality, evenness, and unimodularity as
  above.  Prove: evenness implies integrality (polarization); integrality is equivalent to
  `L ≤ L^∨`; `L^∨` is again a full `ℤ`-lattice, with `IsZLattice ℝ L^∨` as an instance so no
  downstream statement carries it as a side condition; `(L^∨)^∨ = L`; and each predicate is
  invariant under isometry and preserved by orthogonal direct sum.
- **2B. Scaling.**  For `0 < c`: `c • L` is a full-rank lattice, `(c • L)^∨ = c⁻¹ • L^∨`,
  `covolume (c • L) = c^n covolume L`, `det (c • L) = c^{2n} det L`, and `(-c) • L = c • L`.
  Prove the exact criterion `IsIntegral (c • L) ↔ ∀ x y ∈ L, c² ⟪x, y⟫ ∈ ℤ`, and for a positive
  integer `m`: `√m • L` is integral when `L` is; `√m • L` is even when `L` is even or `m` is even
  and `L` is integral; `det (√m • L) = m^n det L`.  Prove that for integral `L` and `m > 1` the
  lattice `√m • L` is never unimodular (its determinant is `m^n det L > 1`), so that in particular
  `√2 • E₈` is even and integral and not unimodular; and prove that for unimodular `L` and `c ≠ 1`,
  `c • L` is not unimodular.  ⚠ Do not state or use "invariance under scaling" for any of the three
  predicates; there is none.  Scaling *down* can create unimodularity (`(1/√2) • (√2 • ℤ) = ℤ`),
  which is one more reason the predicates are not scaling invariants.
- **2C. Covolume, determinant, index.**  Prove `ZLattice.covolume L^∨ = (ZLattice.covolume L)⁻¹`;
  that `det L = (covolume L)^2` is a positive integer for integral `L`; that `det L = [L^∨ : L]`
  and `A_L` is finite; and that `det L = |det Gram(b)|` for any `ℤ`-basis, by consuming
  `covolume_eq_det` rather than reproving a determinant/index formula.  Deduce the two forms of
  unimodularity: for integral `L`, `L = L^∨ ↔ covolume L = 1 ↔ det L = 1 ↔ A_L` is trivial.
  ⚠ This equivalence is what lets a consumer holding the sphere-packing predicate
  `ZLattice.covolume L volume = 1` reach `L = L^∨`; state it in that direction explicitly.
- **2D. The bridge to the rational model.**  For an integral `L ⊆ E`, the integer-valued form
  `⟪·,·⟫ : L → L → ℤ` base-changes to a symmetric, integral, positive-definite
  `LinearMap.BilinForm ℚ (ℚ ⊗[ℤ] L)`, and `L` embeds as a `Submodule.IsLattice ℚ` in
  `ℚ ⊗[ℤ] L`.  Construct the resulting `IntegralLattice (ℚ ⊗[ℤ] L)` of the integral-lattices
  roadmap (its 0A, with the dual of 1B, the discriminant group of 1C and the forms of 1D), prove
  it nondegenerate and even exactly when `L` is, and prove that its dual submodule, discriminant
  group, discriminant bilinear form and — when `L` is even — its discriminant quadratic form
  correspond, under the evident map `ℚ ⊗[ℤ] L → E`, to `L^∨`,
  `L^∨ ⧸ L`, `⟪·,·⟫ mod ℤ` and `‖·‖²/2 mod ℤ` computed in `E`; in particular an additive
  equivalence `A_L ≃+ (ratModel L).DiscriminantGroup` carrying the pairing and, for even `L`, the
  quadratic form.  Prove the converse construction for a positive-definite rational lattice (extend
  scalars to `ℝ`, take the inner product induced by the form) and that the two constructions are
  mutually inverse up to isometry.  Prove the invariants agree: rank, determinant, signed
  discriminant, evenness, unimodularity, level.
  ⚠ This is the *only* place the two models are compared.  After it, discriminant-form facts are
  quoted through the bridge and never reproved in `E`.
- **2E. The level.**  Define `level L` for even `L`; prove `0 < level L` and the three
  characterizations above are equivalent; prove `level L = 1 ↔ L` is even unimodular; prove `level`
  is invariant under isometry, prove `level (L ⊕ M) = lcm (level L) (level M)`, and prove that the
  exponent of `A_L` divides `level L`, that `level L` divides `2 * det L`, that `N • L^∨ ≤ L` for
  `N = level L`, and hence `det L ∣ N^n`.  Prove that every prime dividing `det L` divides `N`.
- **2F. The Fricke partner.**  For even `L` of level `N`, `√N • L^∨` is again an even lattice, with
  `det (√N • L^∨) = N^n / det L`, and its level **divides** `N`.  Prove the exact value: with
  `c_L` the greatest common divisor of the half-norms `‖x‖²/2` over `x ∈ L` (the *content* of `L`),
  `level (√N • L^∨) = N / gcd (N, c_L)`; in particular the level is `N` exactly when no prime
  dividing `N` divides every half-norm of `L`.  ⚠ `level (√N • L^∨) = N` is **false** in general:
  `√2 • E₈` is even of level `2`, and `√2 • (√2 • E₈)^∨ = E₈` has level `1`.  Record that
  counterexample as a test.
- **2G. Shells and representation numbers.**  `shell L t = {v ∈ L | ‖v‖² = t}` and
  `r_L t = (shell L t).ncard`.  Prove each shell finite (from discreteness and boundedness),
  `r_L 0 = 1`, `r_L` invariant under isometry, and the polynomial bound `r_L t = O(t^{n/2})` needed
  for the `q`-expansion estimates.  Prove that for even `L` the shells are empty unless `t ∈ 2ℕ`,
  and that for integral `L` they are empty unless `t ∈ ℕ`.  For the coset shells
  `shell (γ + L) t = {v ∈ L | ‖γ + v‖² = t}` and `r_{γ+L} t` prove the same finiteness and, for
  even `L` of level `N` and `γ ∈ L^∨`, that `shell (γ + L) t` is empty unless `N t / 2 ∈ ℕ` and
  `N t / 2 ≡ N q_L(γ) (mod N)`.  **Convolution.**  For even `L` and `M` and `m : ℕ`,
  `r_{L ⊕ M} (2m) = ∑_{i ≤ m} r_L (2i) * r_M (2(m - i))`, a finite sum over `Finset.range (m+1)`.
  For general real lattices state the same identity as a sum over the finite set of squared norms
  `s ≤ t` represented by `L`: `r_{L ⊕ M} t = ∑_{s ∈ norms(L) ∩ [0, t]} r_L s * r_M (t - s)`.  ⚠ Do
  not write a sum over all real `s`; there is no such sum.  ⚠ Define the shell as a `Set` with a
  finiteness theorem, not as a `Finset` behind a decidability instance; the sets are not decidable
  and the finiteness is the content.  These are the integral-lattices roadmap's shells and
  representation numbers (its 2B) read in `E` rather than a second notion, and the bridge of 2D
  identifies them; that they are the `q`-expansion coefficients of `Θ_L` is 3C's theorem and is
  stated only here.
- **2H. The Kronecker symbol.**  Mathlib has `jacobiSym` for odd denominators only.  Define
  `kroneckerSym : ℤ → ℤ → ℤ` extending it, with the standard values at `2`, `-1` and `0`, and
  prove: complete multiplicativity in the second argument, agreement with `jacobiSym` and
  `legendreSym` where those are defined, and, for `D ≡ 0, 1 (mod 4)`, `D ≠ 0`, that
  `kroneckerSym D` is periodic modulo `|D|` and multiplicative in `D` — so that it defines
  `kroneckerChar D : DirichletCharacter ℂ |D|`, a quadratic character with
  `kroneckerChar D (-1) = sign D`.  Prove that for an even lattice of even rank `n = 2k`,
  `D_L = (-1)^k * det L` satisfies `D_L ≡ 0 (mod 4) ∨ D_L ≡ 1 (mod 4)`.  ⚠ Nothing in this layer
  produces a character modulo the *level*; that needs the conductor theorem of Layer 6, and
  `χ_L` is defined there.

Acceptance at this layer includes: the bridge applied to `⟨2m⟩` and to `A_n`, reproducing the
integral-lattices rank-one and ADE discriminant values (its 1K) from the real model;
`level (E₈) = 1`; `level (A₂) = 3`, `det (A₂) = 3`, `D = -3`; `level (D₄) = 2`, `det (D₄) = 4`,
`D = 4`;
`level (√2 • ℤ²) = 4`, `det = 4`, `D = -4`; and the Fricke test `level (√2 • E₈) = 2` with
`level (√2 • (√2 • E₈)^∨) = 1`.

## Layer 3: the theta series

Rank is arbitrary throughout this layer.

- **3A. Definitions and convergence.**  `thetaSeries L : ℍ → ℂ` and `thetaCoset L γ : ℍ → ℂ`
  (for `γ : E`; the hypothesis `γ ∈ L^∨` enters only where a statement needs it) as above.  Prove
  summability for every `τ : ℍ` with an explicit bound on the terms
  (`‖exp (π i ‖v‖² τ)‖ = exp (-π ‖v‖² τ.im)`), local uniform convergence on `ℍ`, and hence
  holomorphy: both `DifferentiableOn ℂ` on the upper half-plane set and
  `MDifferentiable` in the `UpperHalfPlane` charts, since the bundled `ModularForm` needs the
  latter and every analytic argument wants the former.
- **3B. Well-definedness on `A_L`.**  `thetaCoset L γ` depends only on `γ + L`; package the
  induced map `A_L → (ℍ → ℂ)`, prove `θ_{0+L} = Θ_L`, `θ_{-γ} = θ_γ`, and
  `Θ_{L^∨} = ∑_{γ ∈ A_L} θ_{γ+L}` (a finite sum; `A_L` is finite by 2C).  ⚠ Record `θ_{-γ} = θ_γ`
  prominently: the family `(θ_γ)_{γ ∈ A_L}` is **not** linearly independent, and more relations
  come from every isometry of `L`; no statement about matrices acting on `ℂ[A_L]` can be read off
  identities between theta functions.  This roadmap never does so.
- **3C. `q`-expansions.**  For even `L`, prove
  `HasSum (fun m : ℕ ↦ (r_L (2m) : ℂ) * q^m) (thetaSeries L τ)` with `q = exp (2 π i τ)`, and
  identify `(qExpansion 1 (thetaSeries L)).coeff m = r_L (2m)` through the uniqueness of
  `q`-expansion coefficients.  For integral `L`, the same with `q^{1/2}`, i.e. period `2`, the
  shape of `jacobiTheta_T_sq_smul`.  For even `L` of level `N` and `γ ∈ L^∨`, prove
  `HasSum (fun m : ℕ ↦ (r_{γ+L} (2m/N) : ℂ) * q_N^m) (thetaCoset L γ τ)` and that the coefficient
  vanishes unless `m ≡ N q_L(γ) (mod N)` (from 2G).  Prove `Θ_L` and every `θ_γ` bounded at `i∞`,
  that the constant term of `Θ_L` is `1`, and that `Θ_L(iy) > 0` for `y > 0` — the positivity is
  the nonvanishing witness that Layer 5's rank argument needs, and it is one line here and a
  nuisance later.
- **3D. Functoriality.**  `Θ` and `θ` are invariant under isometry; `Θ_{L ⊕ M} = Θ_L · Θ_M` and
  `θ_{(γ,δ)+(L⊕M)} = θ_{γ+L} · θ_{δ+M}`; `Θ_{c • L}(τ) = Θ_L(c² τ)` for `0 < c`.  Each of these is
  used in the worked examples, and each is a one-line consequence of a reindexing that should be
  proved once.
- **3E. The rank-one comparison.**  `thetaSeries (ℤ ∙ 1 : Submodule ℤ ℝ) = jacobiTheta` (after
  the identification `ℝ ≃ EuclideanSpace ℝ (Fin 1)`), hence `thetaSeries (√2 • ℤ) τ = jacobiTheta (2 τ)`,
  and the `q`-expansions agree termwise with `hasSum_nat_jacobiTheta`.  ⚠ This is an acceptance
  test for the conventions, not a curiosity: if it fails, the exponent convention or the norm
  convention is wrong, and it is far cheaper to discover that here than inside a `Γ₀(N)`
  computation.  It compares *functions and `q`-expansions only*; the `S`-transformation of
  `jacobiTheta` is a half-integral-weight statement and is not reproduced (see 4D).

## Layer 4: the two transformation laws

From here on the rank is even, `n = 2k`, wherever an automorphy factor appears.

- **4A. Translation.**  `θ_γ(τ + 1) = e(q_L(γ)) * θ_γ(τ)` for even `L` and `γ ∈ L^∨`, where
  `e(q_L(γ)) = exp (2 π i ‖γ‖²/2)` is well defined on `A_L` precisely because `L` is even.  In
  particular `Θ_L(τ + 1) = Θ_L(τ)`, i.e. `Θ_L ∣[k] T = Θ_L`, for even `L`; for integral `L`,
  `Θ_L(τ + 2) = Θ_L(τ)`.  ⚠ Evenness is exactly what the period-`1` statement needs and
  integrality is not enough (`jacobiTheta` has period `2`); do not weaken the hypothesis.  Rank is
  arbitrary in this item.
- **4B. Inversion, scalar form.**  For any full-rank `L` of even rank (no integrality needed) and
  `τ : ℍ`,
  ```text
  Θ_L (-1/τ) = (ZLattice.covolume L)⁻¹ * (-i)^k * τ^k * Θ_{L^∨} (τ)
  ```
  by Layer 1 applied to the Gaussian at `v = 0`.  In slash form,
  `Θ_L ∣[k] S = (-i)^k * (covolume L)⁻¹ * Θ_{L^∨}`.
- **4C. Inversion at a general translate, and the vector-valued law.**  For any full-rank `L` of
  even rank, `v : E`, and `τ : ℍ`,
  ```text
  θ_v (-1/τ) = (covolume L)⁻¹ * (-i)^k * τ^k * ∑' m : L^∨, e(⟪v, m⟫) * exp (π i ‖m‖² τ)
  ```
  which is Layer 1 at the Gaussian translated by `v`; this general-`v` form is what Layer 7's coset
  splitting consumes, so state it before specialising.  For even `L` and `γ ∈ L^∨` the sum over
  `L^∨` breaks into cosets and the character descends to `A_L`, giving
  ```text
  θ_γ (-1/τ) = (covolume L)⁻¹ * (-i)^k * τ^k * ∑ δ : A_L, e(b_L(γ, δ)) * θ_δ (τ)
  ```
  the sum over the finite discriminant group.  Record `(covolume L)⁻¹ = (det L)^{-1/2} = |A_L|^{-1/2}`
  as a rewriting lemma, since the literature states the coefficient in the third form.  Note the
  sign remark of Layer 1: `θ_δ = θ_{-δ}` makes `e(b_L(γ,δ))` and `e(-b_L(γ,δ))` interchangeable
  here, and the roadmap's stated form is the one Poisson summation produces.
- **4D. Consistency checks, proved not assumed.**  `Θ_{L^∨} = ∑_γ θ_γ` recovered from 4C at
  `γ = 0` summed over `A_L`; the two laws applied twice give `Θ_L(τ) = Θ_L(τ)` through `S² = -I`
  acting trivially in even weight; and the rank-**two** case `L = ℤ²` gives
  `Θ_{ℤ²}(-1/τ) = (τ/i) * Θ_{ℤ²}(τ)`, which by 3D and 3E is the square of `jacobiTheta_S_smul`.
  ⚠ This is the in-scope form of the comparison with Mathlib's `S`-law: the rank-one law itself
  carries `(-iτ)^{1/2}` and is not a target.

## Layer 5: level one — even unimodular lattices

- **5A. The rank is divisible by `8`.**  For `L` even unimodular of rank `n`, `8 ∣ n`.  Route of
  record, elementary and self-contained at this layer: replacing `L` by `L ⊕ L` or `L^{⊕4}`
  (again even unimodular, by 2A) reduces to `n ≡ 4 (mod 8)`, where 4B gives
  `Θ ∣[k] S = (-i)^k Θ = -Θ` and 4A gives `Θ ∣[k] T = Θ`, so `Θ ∣[k] (ST)^3 = -Θ`; but
  `(ST)^3 = S^2 = -I` acts trivially in even weight, whence `Θ = 0`, contradicting `Θ(i) > 0`
  from 3C.  ⚠ The reduction is what keeps this inside even rank: for odd `n`, `4n` is even and
  `≡ 4 (mod 8)`, so no half-integral-weight theta series is ever formed.  Layer 6 reproves this in
  one line from Milgram's formula; both proofs are wanted, and the elementary one is not
  superseded.
- **5B. The theorem.**  For `L` even unimodular of rank `n = 2k`, `Θ_L ∣[k] γ = Θ_L` for every
  `γ ∈ SL(2, ℤ)`, and `Θ_L` is a `ModularForm 𝒮ℒ k`.  The proof is Mathlib's level-one
  generation lemma (invariance under `S` and `T` gives invariance under `SL(2, ℤ)`) applied to the
  two laws of Layer 4, with `L^∨ = L` and `covolume L = 1` collapsing the `S`-factor to
  `(-i)^k = 1` by `8 ∣ n`; holomorphy and boundedness at the cusp come from Layer 3.  Build it the
  way `CuspForm.discriminant` is built in Mathlib.
- **5C. The basic API of the bundled form.**  `qExpansion 1 (thetaForm L) |>.coeff m = r_L (2m)`;
  `thetaForm L ≠ 0`; `thetaForm (L ⊕ M) = thetaForm L * thetaForm M` as modular forms (via
  `ModularForm.mul`); invariance under isometry.  These are what the identifications of Layer 8
  actually consume.
- **5D. The structural corollary.**  `⨁_{4 ∣ k} M_k(SL(2,ℤ)) = ℂ[E₄, Δ]`: from Tau Ceti's
  `mvPolynomialEquivModularForms` (the graded ring is freely generated by `E₄` and `E₆`), the
  weights divisible by `4` are spanned by monomials `E₄^a E₆^b` with `b` even, and
  `E₆² = E₄³ - 1728 Δ`.  Hence the theta series of an even unimodular lattice of rank `2k` is
  `∑_{4a + 12b = k} c_{a,b} E₄^a Δ^b` for a unique family of coefficients `c_{a,b} ∈ ℂ`, in fact in
  `ℚ`.  This is the general statement of which Layer 8's two headline identities are instances,
  and it is proved here, not one lattice at a time.

## Layer 6: Gauss sums of a lattice

The arithmetic input to the general-level theorem, isolated so that Layer 7 is an assembly.  The
route of record is **analytic**: the one nontrivial identity, the reciprocity law, is proved from
Layer 1 by the asymptotics of theta series, and everything else is finite algebra over `ℤ/aℤ` for
an *odd* modulus `a`.  Nothing here classifies finite quadratic modules, uses Jordan splittings, or
touches the prime `2` beyond the residue of `D_L` modulo `4` and `8`.  `L` is even of even rank
`n = 2k` throughout.

- **6A. The Gauss sums and their elementary properties.**  Define `G_L(a, c)` and `G_L(a, c; m)`
  as in the conventions, on the finite quotient `L ⧸ c • L` (`Nat.card = c^n`).  Prove:
  invariance under isometry; multiplicativity under orthogonal sum; `G_L(a + 2c t, c) = G_L(a, c)`;
  `G_L(1, 1) = 1`; and the two facts the coset splitting of Layer 7 needs, for `N ∣ c`,
  `N = level L`:
  - **vanishing**: `G_L(a, c; m) = 0` unless `m ∈ L`, because shifting `y ↦ y + c w` for
    `w ∈ L^∨` (legitimate since `c • L^∨ ≤ L`) multiplies the sum by `e(⟪w, m⟫)`, and
    `⟪w, m⟫ ∈ ℤ` for all `w ∈ L^∨` says exactly `m ∈ L`;
  - **completing the square**: for `m ∈ L` and `a d ≡ 1 (mod c)`,
    `G_L(a, c; m) = e(-a d² ‖m‖²/(2c)) * G_L(a, c)`.
- **6B. Reciprocity.**  For an even lattice `L` of rank `n = 2k` and coprime positive integers
  `a, c`,
  ```text
  G_L(a, c) = (c/a)^k * (det L)^{-1/2} * e(n/8) * ∑_{y ∈ L^∨ / a L} e(-c ‖y‖² / (2a))
  ```
  where the right-hand sum is over the finite quotient `L^∨ ⧸ a • L` of order `a^n det L`, and is
  well defined because `L` is even.  Route of record: compare the two evaluations of
  `Θ_L(a/c + i t)` as `t → 0⁺`.  Directly, splitting `L` into classes modulo `c • L` and applying
  4C to each class gives `Θ_L(a/c + it) = G_L(a, c) * (covolume L)⁻¹ * (c² t)^{-k} * (1 + o(1))`;
  applying 4B at the matrix carrying `∞` to `a/c` and then the same splitting to `L^∨` modulo
  `a • L` gives the other side.  ⚠ This is the same asymptotic argument that proves Milgram's
  formula, and it is the *only* analytic input to Layers 6 and 7; every other step is finite.  The
  rank-one case is the Landsberg–Schaar identity, which is a mandatory test.
- **6C. Milgram's formula.**  The case `a = c = 1` of 6B, after `y ↦ -y`:
  ```text
  ∑_{γ ∈ A_L} e(q_L(γ)) = |A_L|^{1/2} * e(n/8)
  ```
  for `L` even and positive definite of rank `n`.  Deduce `8 ∣ n` for even unimodular `L` in one
  line (`|A_L| = 1`), reproving 5A.  ⚠ This is the positive-definite instance of the
  integral-lattices roadmap's Gauss-sum invariant (its 1H) and Milgram theorem (its 1I,
  `sign q_L ≡ t₊ - t₋` at every signature, proved there by finite arithmetic from 1H).  Both are
  wanted: that one covers the indefinite case this roadmap does not, this one is the analytic
  route Layer 7 needs, the bridge of 2D identifies them, and neither is derived from the other.
  Do not replace this milestone by a citation of that one.
- **6D. Evaluation at an odd modulus.**  For `a` odd, coprime to `N`, and `N ∣ c`, the sum on the
  right of 6B collapses:
  ```text
  ∑_{y ∈ L^∨ / a L} e(-c ‖y‖² / (2a)) = det L * (D_L / a) * a^k
  ```
  with `(D_L / a)` the Jacobi symbol.  Route: (i) the summand is invariant under `y ↦ y + a w` for
  `w ∈ L^∨` (this uses `N ∣ c` and `N • L^∨ ≤ L`), so the sum is `det L` times the sum over
  `L^∨ ⧸ a • L^∨`; (ii) on `L^∨ ⧸ a • L^∨ ≅ (ℤ/a)^n` the summand is `e(Q(y)/a)` for the integral
  quadratic form `Q = -(c/N) · (N ‖·‖²/2)` on `L^∨`, whose Gram determinant `(-c/N)^n N^n / det L`
  is a unit modulo `a` — the form is **unimodular modulo `a`**; (iii) Gauss sums of a quadratic form
  are multiplicative over the prime factorisation of `a` (Chinese remainder theorem, with the
  cofactor units absorbed into the form); (iv) for `p` odd and `Q` unimodular modulo `p^e`, the sum
  over `(ℤ/p^e)^n` reduces to `p^n` times the sum over `(ℤ/p^{e-2})^n` when `e ≥ 2`, so only
  `e ∈ {0, 1}` remains; (v) over `ZMod p` diagonalise `Q` (Mathlib's diagonalisation of quadratic
  forms over a field of characteristic `≠ 2`) and use `∑_x e(u x²/p) = (u/p) · g_p` with
  `g_p² = (-1/p) · p` (Mathlib's `gaussSum_sq`); the `n = 2k` rank-one factors pair up into
  `((-1)^k det Q / p) · p^k`, and no sign of `g_p` is ever needed; (vi) reassemble through Jacobi
  symbol multiplicativity, using that `(u²/a) = 1` for units and that `((-1)^k det Q / a) =
  ((-1)^k det L / a) = (D_L / a)` since `det Q` and `det L` differ by a square times `(-1)^k`
  modulo `a`.  ⚠ Step (iv) is where a non-unimodular form would need Jordan theory; the form here
  is unimodular modulo `a` *because* `a` is coprime to the level, and that is the whole reason the
  route restricts to `a` coprime to `N` and moves the modulus from `c` to `a`.
- **6E. The closed form.**  Combining 6B and 6D: for `a` odd and positive, coprime to `c`, and
  `N ∣ c`,
  ```text
  G_L(a, c) = c^k * (det L)^{1/2} * e(n/8) * (D_L / a) .
  ```
- **6F. The conductor theorem and the nebentypus.**  From 6E with `c = N`: `G_L(a, N)` depends on
  `a` only modulo `2N`, and by 6A it is independent of `a` for `a ≡ 1 (mod N)` (`a = 1 + Nt` gives
  `e(t ‖y‖²/2) = 1`); hence `(D_L / a) = 1` for every odd positive `a ≡ 1 (mod N)`.  Since every
  class modulo `|D_L|` that is `≡ 1 (mod N)` has an odd positive representative, the Kronecker
  character `kroneckerChar D_L` is trivial on the kernel of `ZMod |D_L| → ZMod N`; conclude that its
  **conductor divides `N`**.  Define
  `χ_L := changeLevel (conductor ∣ N) (primitiveCharacter (kroneckerChar D_L)) : DirichletCharacter ℂ N`,
  and prove: `χ_L a = (D_L / a)` for `a` coprime to `N`; `χ_L` is quadratic; `χ_L (-1) = (-1)^k`
  (the compatibility with the modular-forms roadmap's parity lemma `M_k(N, χ) ≠ 0 → χ(-1) = (-1)^k`);
  `χ_L` is trivial when `D_L` is a square, and in particular when `L` is unimodular.  ⚠ The order
  matters: the character is first constructed at modulus `|D_L|`, where periodicity is elementary
  (2H); the passage to modulus `N` is the lattice theorem above and is *not* Mathlib's generic
  `conductor_dvd_level`.  Nothing before 6F produces a character modulo `N`.

## Layer 7: general level — the Hecke–Schoeneberg theorem

The summit.  The route of record is Schoeneberg's coset splitting; it needs no group presentation
and no representation, and it delivers the `Γ(N)`-statement for the coset series by the same
computation.  `L` is even of even rank `n = 2k` and level `N`.

- **7A. Reduction to `c > 0` and `a` odd.**  For `A = !![a, b; c, d] ∈ Γ₀(N)`: if `c = 0` then
  `A = ±T^b` and the statement is 4A with `Θ_L ∣[k] (-I) = (-1)^k Θ_L = χ_L(-1) Θ_L`.  Otherwise
  replace `A` by `-A` to make `c > 0` (using `χ_L(-d) = (-1)^k χ_L(d)`), and by `T^j A`, which has
  the same `c` and `d` and `Θ_L ∣[k] (T^j A) = Θ_L ∣[k] A`, to make `a` odd (possible whenever `c`
  is odd, and automatic when `c` is even).
- **7B. The coset splitting.**  For `c > 0`, `Aτ = a/c - 1/(c(cτ + d))`.  Splitting `L` into its
  classes `y + c • L` and applying 4C at `v = y/c` and `σ = (cτ + d)/c` to each class gives, for
  every even `L` (no level condition yet),
  ```text
  Θ_L(Aτ) = (covolume L)⁻¹ * ((cτ + d)/(ic))^k * ∑_{m ∈ L^∨} G_L(a, c; m) * e(d ‖m‖²/(2c)) * exp (π i ‖m‖² τ)
  ```
  as an absolutely convergent sum.  This identity is a target in its own right, stated for every
  `A ∈ SL(2, ℤ)` with `c > 0`.
- **7C. The `Γ₀(N)` formula.**  For `N ∣ c`, 6A kills every `m ∉ L` and evaluates the rest, and
  `e((d - a d²) ‖m‖²/(2c)) = e(-b d ‖m‖²/2) = 1` for `m ∈ L`, so
  `Θ_L ∣[k] A = (-i)^k * c^{-k} * (covolume L)⁻¹ * G_L(a, c) * Θ_L`, and 6E turns the constant
  into `(D_L / a) = χ_L(a) = χ_L(d)`.  Hence the **Hecke–Schoeneberg theorem**:
  ```text
  Θ_L ∣[k] A = χ_L(d) * Θ_L   for every   A = !![a, b; c, d] ∈ Γ₀(N) .
  ```
- **7D. Boundedness at every cusp and the bundled form.**  For `A ∈ SL(2, ℤ)` with `c > 0`, 7B
  writes `Θ_L ∣[k] A` as a finite combination of the coset series `θ_{m+L}`, `m ∈ A_L`, each of
  which has a `q_N`-expansion supported in nonnegative exponents (3C); so `Θ_L ∣[k] A` is bounded at
  `i∞`.  Together with 7C and 3A this makes `Θ_L` a
  `ModularForm ((Gamma1 N).map (mapGL ℝ)) k` lying in `modFormCharSpace k χ_L`, with `χ_L` in its
  unit-homomorphism face; prove the `Γ₀(N)`-spelling and the character-space spelling equivalent
  through the landed `mem_modFormCharSpace_iff_nebentypus`, and prove that the level-one theorem of
  Layer 5 is the case `N = 1` of this one.
- **7E. The coset series on `Γ(N)`.**  Apply the splitting of 7B to `θ_{γ+L}` for `γ ∈ L^∨`,
  splitting the coset `γ + L` modulo `c • L`.  The twisted sums are now over `(γ + L) ⧸ c • L`, and
  the shift `y ↦ y + c w`, `w ∈ L^∨`, multiplies them by `e(a b_L(γ, w) + b_L(w, m))`, so they
  vanish unless `m ≡ -a γ` in `A_L`.  For `A ∈ Γ(N)`, `a ≡ 1 (mod N)` and `N γ ∈ L` give
  `m ≡ -γ`, so `θ_γ ∣[k] A` is a scalar multiple of `θ_{-γ} = θ_γ`; complete the square as in 6A
  and evaluate by 6E to find the scalar equal to `1`.  Hence `θ_γ ∣[k] A = θ_γ` for every
  `A ∈ Γ(N)`, and with boundedness at every cusp (the same argument as 7D) each `θ_γ` is a
  `ModularForm ((Gamma N).map (mapGL ℝ)) k`.  ⚠ This is the statement that the alternative route
  through the Weil representation would deliver as its congruence-kernel theorem; here it is the
  coset version of 7C and costs one more application of the same computation.
- **7F. Consequences to state here.**  The Fricke involution `W_N` exchanges `Θ_L` and
  `Θ_{√N • L^∨}` up to the explicit constant `(-i)^k N^{k/2} (det L)^{-1/2}`, by 4B and 3D; the
  constant term of `Θ_L` at the cusp `∞` is `1`, so `Θ_L` is never a cusp form; and `Θ_L` is an
  eigenvector of every diamond operator `⟨d⟩` with eigenvalue `χ_L(d)`, which is the content of
  membership in `modFormCharSpace`.

## Layer 8: identification of the classical theta series

- **8A. Even unimodular rank 8 and 16.**  `dim M_4(SL(2,ℤ)) = 1` (Mathlib's level-one dimension
  formula), and the level-one Sturm bound at weight `4` is `⌊4/12⌋ = 0`, so a weight-`4` form is
  determined by its constant term alone.  Hence for **every** even unimodular `L` of rank `8`,
  `Θ_L = E₄`, and for every one of rank `16`, `Θ_L = E₄²`.  ⚠ No representation number is an
  input to either identity; both follow from `r_L(0) = 1`.
- **8B. `E₈`.**  `Θ_{E₈} = E₄`, and therefore `r_{E₈}(2m) = 240 * σ₃(m)` for `m ≥ 1`, from the
  `q`-expansion of `E₄` with `bernoulli 4 = -1/30`.  In particular the kissing number
  `r_{E₈}(2) = 240` is a **corollary**, not a hypothesis.  The lattice is the sphere-packing
  project's `E8Lattice : Submodule ℤ (EuclideanSpace ℝ (Fin 8))`, whose integrality, evenness and
  `E8Matrix_unimodular` are already formalized; 2C's `covolume = 1 ↔ L = L^∨` and
  `ZLattice.covolume_eq_det` connect them to this roadmap's hypotheses.
- **8C. Even unimodular rank 24, in general.**  `dim M_12(SL(2,ℤ)) = 2` with basis `E₄³, Δ`, and
  the Sturm bound at weight `12` is `1`, so a weight-`12` form is determined by its first **two**
  coefficients.  For every even unimodular `L` of rank `24`,
  ```text
  Θ_L = E₄³ + (r_L(2) - 720) * Δ
  ```
  since `E₄³` has `q`-coefficient `720` and `Δ` has `q`-coefficient `1`.  Prove this general form
  first; the Leech identity is its rootless case.
- **8D. The Leech lattice.**  `Θ_Λ = E₄³ - 720 Δ`, from the general rank-24 formula and
  `r_Λ(2) = 0`, which is the sphere-packing project's already-formalized `leech_rootless`; the
  remaining hypotheses are `leech_evenNormSq` and `leech_covolume = 1`.  Prove the equivalent
  Eisenstein form `Θ_Λ = E₁₂ - (65520/691) Δ`, and deduce
  ```text
  r_Λ(2m) = (65520/691) * (σ₁₁(m) - τ(m))
  ```
  with `τ` the Ramanujan tau function (the `q`-expansion coefficients of `Δ`).  In particular the
  Leech kissing number `r_Λ(4) = 196560` is a corollary.  ⚠ `196560` is an **output** of this
  roadmap, not an input: it must not appear as a hypothesis anywhere, and a proof that computes it
  by counting has not discharged this target.
- **8E. The rank-16 pair.**  `E₈ ⊕ E₈` and `D₁₆⁺` are both even unimodular of rank `16`, so both
  have theta series `E₄²` by 8A; they are **not** isometric.  Both lattices and their non-isometry
  are the integral-lattices roadmap's 6D, which builds `D₁₆⁺` by the even-overlattice gluing of
  its 1F — in `A_{D₁₆} ≅ (ℤ/2)²` the spinor class has `q(s) = 16/8 ≡ 0`, so `⟨s⟩` is
  quadratic-isotropic of order `2` in a group of order `4`, hence Lagrangian, and its preimage
  under that roadmap's `ofIsotropicSubgroup` is even unimodular — and which separates the two by
  their root systems.  They reach this roadmap through the converse direction of the bridge 2D.
  What is owned here is the theta identity `Θ_{E₈ ⊕ E₈} = Θ_{D₁₆⁺} = E₄²` and the statement that
  the theta series does not determine the lattice, assembled from 8A and the consumed
  non-isometry.  ⚠ Keep the two halves apart.  Equality of theta series is 8A's and says nothing
  about isometry; the non-isometry is 6D's and is not reproved here, whether by a root-sublattice
  index, by a vector count (both lattices have `480` vectors of norm `2`, so the count separates
  nothing), or by any other route.  Stating only the first invites the reader to conclude the
  second.  This is the one item of the roadmap whose input lattice is built by another roadmap's
  gluing theorem, and it is sequenced after 6D and stated against it.

## Worked examples (acceptance criteria)

Each is a formal acceptance test: the general theorem, instantiated, with every hypothesis
discharged from the lattice's own construction.  Entering a `q`-expansion by hand discharges
nothing.

- `thetaSeries ℤ = jacobiTheta` and `Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)` (Layers 3 and 4) — the
  convention checks.
- The Landsberg–Schaar identity as the rank-one case of 6B, and `∑_{γ ∈ ℤ/3} e(γ²/3) = i√3` as
  Milgram's formula for `A₂` (`n = 2`, `|A_L| = 3`).
- `Θ_{E₈} = E₄`; `r_{E₈}(2) = 240`; `r_{E₈}(2m) = 240 σ₃(m)`.
- `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ`; `r_Λ(4) = 196560`;
  `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`.
- `Θ_{E₈ ⊕ E₈} = Θ_{D₁₆⁺} = E₄²`, with the two lattices non-isometric.
- `Θ_{A₂} ∈ M_1(Γ₀(3), χ₋₃)` and `Θ_{D₄} ∈ M_2(Γ₀(2))` (trivial character, since `D = 4`) — the
  general-level theorem at its two smallest interesting instances, with `level`, `det` and `χ`
  computed from the lattice through Layers 2 and 6 rather than quoted.  Weight `1` at `A₂` is
  admissible here because nothing in this roadmap needs a dimension formula to *state* modularity.
- ⚠ **Identifying** `Θ_{D₄}` with the weight-`2` Eisenstein series `2E₂(2τ) - E₂(τ)`, and `Θ_{A₂}`
  with its weight-`1` Eisenstein series, needs `dim M_2(Γ₀(2)) = 1` and `dim M_1(Γ₀(3), χ₋₃) = 1`,
  which is **Layer 10 of the modular-forms roadmap** — the exact general-level dimension formulas.
  These two identifications are therefore sequenced last and are the only targets of this roadmap
  that depend on that layer; they are cited as a dependency on that roadmap, and every other target
  above is independent of it.  A contributor should not attempt a private dimension count to
  unblock them.

## Ordering — the dependency graph

- **Layer 1** (lattice Poisson summation) → Mathlib only.
- **Layer 2** (real model, bridge, level, scaling, shells, Kronecker symbol) → Mathlib;
  integral-lattices 0A, 1B–1D, 1G, 1J, 1K.  Independent of Layer 1 and can proceed beside it.
- **Layer 3** (the theta series) → Layers 1, 2.
- **Layer 4** (the two laws) → Layers 1, 3; integral-lattices 1D for `q_L` and `b_L`.
- **Layer 5** (level one) → Layer 4, Mathlib's level-one generation lemma and dimension formula,
  Tau Ceti's landed level-one graded ring.
- **Layer 6** (Gauss sums) → Layer 4 for reciprocity; Mathlib's `gaussSum`, `jacobiSym` and
  `DirichletCharacter` API for the evaluation and the conductor theorem.  Independent of Layer 5.
- **Layer 7** (general level) → Layers 4, 6; modular-forms Layer 0 (**landed**) for
  `modFormCharSpace`.
- **Layer 8** (identifications) → Layer 5 only, for `E₈`, Leech and the theta series of the
  rank-16 pair; integral-lattices 6D, through the gluing of its 1F, for the construction of
  `D₁₆⁺` and its non-isometry; Layer 7 and modular-forms Layer 10 for the two general-level
  identifications.
- The sphere-packing lattices are consumed as *inputs* at Layer 8 and nowhere earlier; nothing in
  Layers 1–7 mentions dimension `8` or `24`.

| Block | Status |
|---|---|
| Layer 1 lattice Poisson summation | **new** in general dimension; a dimension-24 instance exists (see *Provenance*) |
| Layer 2 real model and bridge | **new**; the bridge is anticipated by the integral-lattices roadmap |
| Layer 2 Kronecker symbol | **new**; Mathlib has `jacobiSym` only |
| Layer 3 theta series | **new** in general; a dimension-24 instance exists |
| Layer 4 transformation laws | `S` exists at dimension 24; the general-`v` and vector-valued forms are **new** |
| Layer 5 level one | **new**; the group-theoretic input is a single Mathlib lemma |
| Layer 6 Gauss sums, reciprocity, Milgram, conductor | **new**; the hardest single block of the roadmap |
| Layer 7 Hecke–Schoeneberg and the coset series | **new** |
| Layer 8 identifications | **new**; the lattices themselves are formalized elsewhere |

## Provenance

The dimension-8 and dimension-24 lattices, and a dimension-24 instance of Layers 1, 3 and 4, exist
in the sphere-packing formalization
([github.com/math-inc/Sphere-Packing-Lean](https://github.com/math-inc/Sphere-Packing-Lean),
Apache-2.0), which builds on the original EPFL project of Hariharan, Viazovska, Birkbeck, Lee, Ma
and Mehta ([github.com/thefundamentaltheor3m/Sphere-Packing-Lean](https://github.com/thefundamentaltheor3m/Sphere-Packing-Lean)).
**Coordinate with its authors and obtain their agreement before porting any of it**, and discuss the
plan on the Lean Zulip; the licence permitting reuse is not on its own a reason to reuse.

This section is secondary and is **not** prescriptive: the source is a map of what exists, not a
specification, and the roadmap above is written so the material could be built fresh.  In
particular, everything cited here is hard-wired to `EuclideanSpace ℝ (Fin 24)` or
`EuclideanSpace ℝ (Fin 8)` and must be *generalized*, not copied, and the ad-hoc predicates
`EvenNormSq`, `Integral`, `Rootless`, `Unimodular` there are replaced by the Layer-2 vocabulary
above, with comparison lemmas so the existing `E₈` and Leech facts can be consumed.

| Existing | Roadmap target |
|---|---|
| `SpherePacking/Dim8/E8/Basic.lean`, `.../Packing.lean`: `Submodule.E8`, `E8Lattice`, `E8_integral`, `E8_integral_self`, `E8Matrix_unimodular` | consumed as an input at Layer 8 |
| `SpherePacking/Dim24/LeechLattice/*`: `LeechLattice`, `leech_covolume`, `leech_norm_lower_bound`, `IsZLattice` instance | consumed as an input at Layer 8 |
| `.../Uniqueness/LatticeInvariants.lean`: `EvenNormSq`, `Integral`, `Rootless`, `Unimodular`, `leech_evenNormSq`, `leech_rootless`, `leech_unimodular` | Layer 2 predicates, plus comparison lemmas |
| `SpherePacking/CohnElkies/PoissonSummation*`: `SchwartzMap.poissonSummation_lattice` | Layer 1, generalized from `ℝ²⁴` to any `E` |
| `.../Classify/EvenUnimodular/ThetaAnalytic.lean`, `ThetaSeries.lean`: `thetaSeries`, `thetaShell`, `thetaCoeff`, `summable_thetaTerm`, `thetaSeries_add_one_of_even` | Layers 2 and 3, generalized |
| `.../Classify/EvenUnimodular/ThetaTransform.lean`: `thetaSeries_transform_S` | Layer 4, generalized, with the general-`v` and vector-valued forms added |
| `.../Classify/EvenUnimodular/{Discrete,FiniteShells,MinNorm,FundamentalDomain}.lean` | Layer 2 shells and finiteness, generalized |

Nothing in the sphere-packing project states that a theta series is a modular form; the modularity
theorems, the Gauss-sum layer, the general-level theorem and every identification in Layer 8 are
new formalization ground, and we found no Lean prior art for them (as of August 2026).

## References

- J.-P. Serre, *A Course in Arithmetic*, GTM 7 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-1-4684-9884-4).  Ch. VII §6 is the level-one theorem: the theta
  series of an even unimodular lattice is a modular form of weight `n/2`, with the `8 ∣ n` argument
  by passing to `L ⊕ L` and `L^{⊕4}` used in Layer 5, and §3 is the structure of `M_*(SL(2,ℤ))`.
- W. Ebeling, *Lattices and Codes*, 3rd ed. (Springer, 2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9).  Ch. 2 for theta series, Poisson summation and
  the transformation formula; Ch. 3 for the Hecke–Schoeneberg theory (the results are attributed
  there to Hecke and Schoeneberg, following Ogg and Schoeneberg): for an even lattice `Λ` of level
  `ℓ` and dimension `n = 2k`, `θ_Λ ∈ M_k(Γ₀(ℓ), χ_Λ)` with `χ_Λ(·) = ((-1)^k det Λ / ·)`, proved
  by the coset splitting and Gauss sums of Layers 6 and 7.  Ch. 3 also has the `E₈`, `E₈ ⊕ E₈` and
  `D₁₆⁺` calculations of Layer 8.
- A. Ogg, *Modular Forms and Dirichlet Series* (Benjamin, 1969), Ch. VI — the source Ebeling
  follows for the general-level transformation formula and the Gauss-sum evaluation.
- B. Schoeneberg, *Elliptic Modular Functions: An Introduction*, Grundlehren 203 (Springer, 1974),
  [DOI](https://doi.org/10.1007/978-3-642-65663-7).  Ch. IX is the original coset-splitting proof
  that Layer 7 follows, via the decomposition of a `Γ₀(N)` matrix in `SL(2, ℝ)`.
- H. Iwaniec, *Topics in Classical Automorphic Forms*, GSM 17 (AMS, 1997),
  [DOI](https://doi.org/10.1090/gsm/017), Ch. 10 — theta functions attached to quadratic forms, the
  general transformation formula, and the Gauss sums, in the form closest to the Layer-6
  computation.
- J. Milnor and D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-3-642-88330-9).  Appendix 4 is Gauss sums and **Milgram's
  formula**, `∑_{γ} e(q(γ)) = |A|^{1/2} e(σ/8)`, proved by the theta-asymptotic method of Layer 6.
- V. Turaev, "Reciprocity for Gauss sums on finite abelian groups", *Math. Proc. Cambridge Philos.
  Soc.* **124** (1998), [DOI](https://doi.org/10.1017/S0305004198002655) — the reciprocity law of
  6B for a quadratic function on a finite abelian group, of which the lattice statement is the
  case `L ⧸ cL` against `L^∨ ⧸ aL`; the rank-one case is the classical Landsberg–Schaar identity.
- T. Miyake, *Modular Forms* (Springer, 1989), [DOI](https://doi.org/10.1007/3-540-29593-3), §4.9 —
  theta series with spherical coefficients and their nebentypus; the numbering the modular-forms
  roadmap follows elsewhere.  ⚠ The spherical-coefficient generality is **not** a target here.
- J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed. (Springer, 1999),
  [DOI](https://doi.org/10.1007/978-1-4757-6568-7).  Ch. 2 §2.3 for theta series and the `E₈`,
  `A₂`, `D₄` expansions; Ch. 4 §11 for the Leech lattice theta series
  `Θ_Λ = E₁₂ - (65520/691) Δ` and the formula `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`; Ch. 7 for the
  even unimodular theta series as polynomials in `E₄` and `Δ`.
- V. V. Nikulin, "Integral symmetric bilinear forms and some of their applications", *Math.
  USSR-Izv.* **14** (1980), [MathNet](https://www.mathnet.ru/eng/im1677),
  [DOI](https://doi.org/10.1070/IM1980v014n01ABEH001060).  §1.1 and §1.4 — cited here only through
  the [integral-lattices roadmap](../IntegralLattices/README.md), and in its half-norm translation.
- N. R. Scheithauer, "The Weil representation of `SL₂(ℤ)` and some applications", *Int. Math. Res.
  Not.* **2009**, [DOI](https://doi.org/10.1093/imrn/rnn128), and F. Strömberg, "Weil
  representations associated with finite quadratic modules", *Math. Z.* **275** (2013),
  [DOI](https://doi.org/10.1007/s00209-013-1188-z) — the Weil representation, which this roadmap
  does not build; cited to fix what a future roadmap for it would need (see *Scope and ownership*).
- H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, "The sphere packing problem in
  dimension 24", *Ann. of Math.* **185** (2017), [arXiv:1603.06518](https://arxiv.org/abs/1603.06518)
  — the source of the formalized Leech lattice consumed at Layer 8.

## Acknowledgements

The lattices of Layer 8 and a dimension-24 instance of Layers 1, 3 and 4 come from the
sphere-packing formalization; see *Provenance* for the coordination requirement.  The
discriminant-form vocabulary is the [integral-lattices roadmap](../IntegralLattices/README.md)'s,
and the modular-form vocabulary is the [modular-forms roadmap](../ModularForms/README.md)'s; this
roadmap adds only the bridge between them.
