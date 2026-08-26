# Roadmap: theta series of lattices

The theta series of a positive-definite lattice is the generating function of its representation
numbers, and the theorem that makes it useful is that it is a modular form.  This roadmap builds
that bridge: the analytic engine (Poisson summation for a full-rank `ℤ`-lattice, which Mathlib has
only in dimension one), the theta series of a lattice and of each coset of it in its dual, the two
transformation laws, and the two modularity theorems they yield — level one for an even unimodular
lattice, and `Γ₀(N)` with a quadratic nebentypus for an even lattice of level `N`.  It ends by
identifying the theta series of `E₈` and of the Leech lattice inside the level-one graded ring, and
reading the classical representation-number formulas off those identities.

The primary object is a full `ℤ`-lattice `L` in a finite-dimensional **real inner product space**
`E`, expressed by `Submodule ℤ E` together with Mathlib's `IsZLattice ℝ L`.  This is not the carrier
of the [integral-lattices roadmap](../IntegralLattices/README.md), which is a `ℤ`-submodule of a
rational vector space with a rational bilinear form, and the difference is not cosmetic: the theta
series is a sum of `exp(π i ‖v‖² τ)` over `L`, so it needs a real norm to converge, and Poisson
summation needs the Haar measure of `E` and the covolume of `L`.  The two models are related by a
bridge built in Layer 0, and *all* discriminant-group and discriminant-form theory is consumed from
that roadmap through the bridge rather than redeveloped here.

**Rank is even throughout.**  A lattice of odd rank has a theta series of half-integral weight, and
half-integral weight means the metaplectic group, a theta multiplier, and a square root of `τ`
whose branch has to be tracked in every statement.  Restricting to even rank `n = 2k` makes the
automorphy factor `(τ/i)^k` an honest integer power and keeps `Complex.cpow` out of the entire
development.  Half-integral weight is out of scope: it is not a later layer of this roadmap, and a
contributor should not attempt it here.

This roadmap does **not** classify lattices in any rank, prove uniqueness of `E₈` or of the Leech
lattice, construct Niemeier lattices or enumerate them, develop theta series with spherical
coefficients (Hecke's `θ(L, P)` for harmonic `P`), Siegel or Jacobi theta series, Eisenstein series
with character, the Siegel–Weil formula, or any part of sphere packing.  It does not develop
discriminant forms — that is the integral-lattices roadmap — and it does not develop Hecke theory,
newforms, or the general-level dimension formulas — that is the
[modular-forms roadmap](../ModularForms/README.md).

Suggested home: `TauCeti/NumberTheory/ThetaSeries/`, with separate files for the real lattice model
and the bridge, lattice Poisson summation, the theta series and its `q`-expansion, the
transformation laws, the level-one theorem, the Weil representation and the general-level theorem,
and the worked lattices.

## Standing conventions

Decide these once; implementors diverge otherwise, and a convention that drifts halfway through a
transformation law is unrecoverable.

- **The ambient space and the carrier.**  `E` is a finite-dimensional real inner product space
  (`[NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]`), and a lattice is
  `L : Submodule ℤ E` with `[DiscreteTopology L]` and `[IsZLattice ℝ L]`.  Use Mathlib's
  `Mathlib/Algebra/Module/ZLattice/*` API — bases, covolume, discreteness, the summability
  estimates — and do not introduce a private finite-free model.  The **rank** is
  `Module.finrank ℝ E`, equal to `Module.finrank ℤ L`.
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
  `ZLattice.covolume L volume = 1` is *equivalent* to it for an integral `L` is a theorem of Layer 0,
  not an alternative definition.
- **Determinant and discriminant.**  `det L := (ZLattice.covolume L volume) ^ 2`.  For integral `L`
  this is a positive integer, equal to `|det Gram(b)|` for any `ℤ`-basis `b` of `L` and to the
  cardinality of `L^∨/L`.  Never call the covolume the determinant.
- **The discriminant group and form come from the integral-lattices roadmap.**  `A_L = L^∨/L`, its
  bilinear form `b_L` valued in `AddCircle (1 : ℚ)`, and — for even `L` only — its quadratic form
  `q_L(x + L) = ‖x‖² / 2 mod ℤ` in the **half-norm** convention.  This roadmap transports those
  objects across the Layer-0 bridge and adds no competing definition.  Values quoted from Nikulin's
  full-norm `ℚ/2ℤ` convention are halved before use, exactly as in that roadmap.
- **The level.**  `level L` is the least `N : ℕ`, `0 < N`, with `N • q_L = 0`; equivalently the
  least `N` with `N ‖x‖² / 2 ∈ ℤ` for every `x ∈ L^∨`.  It is defined for even `L` only.  Prove
  existence (so the `sInf` is not junk), and prove `level L = 1 ↔ L` is even unimodular.  ⚠ The
  level is *not* the exponent of the group `A_L`, and it is not `det L`; both agree with it in small
  examples and neither agrees in general.
- **Even rank, integer weight, and no `cpow`.**  Write `n = 2k` for the rank and `k` for the weight.
  Every automorphy factor is `(τ/i)^k = (-i)^k * τ^k` with `k : ℕ`, elaborated through `Monoid.npow`.
  ⚠ `Complex.cpow` must not appear in any statement in this roadmap.  If a signature needs it, the
  even-rank hypothesis has been dropped somewhere upstream.
- **The theta series and its `q`-parameter.**  For `τ : ℍ`,
  `Θ_L(τ) = ∑' v : L, Complex.exp (π * I * ‖v‖ ^ 2 * τ)`, and for `γ ∈ L^∨` the coset series
  `θ_{γ+L}(τ) = ∑' v : L, Complex.exp (π * I * ‖γ + v‖ ^ 2 * τ)`, depending only on `γ + L ∈ A_L`.
  With `q = Complex.exp (2 π i τ)` and `L` even, `Θ_L(τ) = ∑_{m ≥ 0} r_L(2m) q^m`, where
  `r_L(t) = #{v ∈ L | ‖v‖² = t}`.  ⚠ The exponent is `π i ‖v‖² τ`, not `2 π i ‖v‖² τ`: with this
  choice the `q`-expansion of an even lattice is indexed by `m = ‖v‖²/2` and the level-one series
  match `E₄` and `Δ` on the nose.  The coset series `θ_{γ+L}` has period `level L`, and its
  expansion is read in `q_N = exp (2 π i τ / N)` through Mathlib's `qExpansion N`.
- **Two names, one object.**  `thetaSeries L : ℍ → ℂ` is the bare function; the bundled
  `ModularForm` produced in Layers 4 and 5 is a separate declaration whose coercion is
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
- **The nebentypus.**  `χ_L` is the Kronecker character of the discriminant
  `D_L = (-1)^k * det L`, that is `χ_L(d) = (D_L / d)`, regarded as a `DirichletCharacter ℂ N` for
  `N = level L`, and converted to the unit-homomorphism face by Mathlib's `MulChar.equivToUnitHom`
  where a character space needs it.  Keep both faces, as the modular-forms roadmap does; do not fuse
  them.
- **Isometry** means a `LinearIsometryEquiv` of the ambient spaces carrying one lattice onto the
  other.  Every invariance statement (of `det`, `level`, `A_L`, `q_L`, `r_L`, `Θ_L`) is stated
  against that, never against a bare additive or module equivalence.
- **Orthogonal direct sums** use `WithLp 2 (E × F)` with the product inner product, and the
  external direct sum of lattices inside it.  Fix this once: `Θ_{L ⊕ M} = Θ_L · Θ_M`,
  `det (L ⊕ M) = det L * det M`, `level (L ⊕ M) = lcm (level L) (level M)`, and `A_{L⊕M} ≅ A_L × A_M`
  as finite quadratic modules.
- **Scaling.**  For `0 < c`, `c • L` has `Θ_{c • L}(τ) = Θ_L(c² τ)`.  State the hypothesis `0 < c`;
  a negative scalar gives the same lattice and the same theta series, and that is a lemma, not a
  convention.

## Existing library material to consume

### Mathlib

- `Mathlib/Algebra/Module/ZLattice/Basic.lean` — `IsZLattice`, `ZSpan` bases, fundamental domains,
  discreteness.  `.../Covolume.lean` — `ZLattice.covolume`, `covolume_pos`, `covolume_ne_zero`,
  `covolume_eq_det`, `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex`.  The
  last is what turns `det L = [L^∨ : L]` into a citation rather than a proof.  `.../Summable.lean` —
  `normBound`, `summable_norm_rpow`, `summable_norm_sub_rpow`: the decay estimates that make every
  theta sum summable without a fresh lattice-point count.
- `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean` — `LinearMap.BilinForm.dualSubmodule`,
  `mem_dualSubmodule`, `le_flip_dualSubmodule`, `dualSubmoduleToDual`, the dual-basis description.
  Instantiated at `R = ℤ`, `S = ℝ`, `M = E` this *is* the dual lattice; complete its advertised
  missing consequences rather than reimplementing it.
- `Mathlib/Analysis/InnerProductSpace/Basic.lean` — `innerₗ`, `isSymm_inner`, `flip_innerₗ`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`, `section InnerProductSpace` —
  the Fourier transform of `x ↦ cexp (-b ‖x‖² + c ⟪w, x⟫)` on a finite-dimensional real inner
  product space, with `0 < b.re`.  This is the Gaussian input to the `S`-transformation, already at
  the generality this roadmap needs; do not redo it in coordinates.
- `Mathlib/Analysis/Distribution/SchwartzSpace.lean` — `SchwartzMap`, `compCLMOfContinuousLinearEquiv`,
  the seminorm API.  Lattice Poisson summation is stated for Schwartz functions.
- `Mathlib/Analysis/Fourier/PoissonSummation.lean` — `SchwartzMap.tsum_eq_tsum_fourier`, Poisson
  summation **for `ℤ ⊆ ℝ` only**.  It is the base case of the Layer-1 theorem and the induction is on
  a linear change of variables, not on the dimension.
- `Mathlib/NumberTheory/ModularForms/*` — `ModularForm`, `CuspForm`, `ModularFormClass`,
  `SlashAction`, `ModularForm.slash`, `CongruenceSubgroup.Gamma/Gamma0/Gamma1`, `UpperHalfPlane`,
  `qExpansion`, `cuspFunction`, `ModularFormClass.qExpansion_coeff_unique`, `BoundedAtCusp`,
  `IsZeroAtImInfty`.
- `Mathlib/NumberTheory/ModularForms/LevelOne/Basic.lean` —
  `SlashInvariantForm.slash_action_generators_SL2Z`: invariance under `S` and `T` gives invariance
  under all of `SL(2, ℤ)`.  This single lemma is the entire group-theoretic content of Layer 4;
  `CuspForm.discriminant` in `.../Discriminant.lean` is built exactly this way and is the model to
  imitate for `Θ_L`.
- `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean` — `dimension_level_one`,
  `sturm_bound_levelOne`, `sturm_bound_levelOne_nat`, `levelOne_weight_four_rank_one`,
  `CuspForm.rank_eq_one_of_weight_eq_twelve`, `E₄_qExpansion_coeff_one`.
- `Mathlib/NumberTheory/ModularForms/EisensteinSeries/*` — `EisensteinSeries.E hk` for `3 ≤ k`, the
  abbreviations `E₄`, `E₆`, and `E_qExpansion_coeff`: the constant term is `1` and the `m`-th
  coefficient is `-(2k / bernoulli k) * σ (k-1) m`.  Every representation-number corollary in Layer 6
  is this lemma plus an identity of forms.
- `Mathlib/NumberTheory/ModularForms/Discriminant.lean` — `ModularForm.discriminant` (`Δ = η²⁴`) and
  the bundled `CuspForm.discriminant : CuspForm 𝒮ℒ 12`.
- `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean` — `jacobiTheta`,
  `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul`, `hasSum_nat_jacobiTheta`.  This is the rank-one
  theta series of `ℤ ⊆ ℝ`; Layer 2 proves the identification, which is the cheapest available check
  that the conventions above are the standard ones.
- `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean` — `jacobiSym` (`J(a | b)` for odd `b`),
  its complete multiplicativity, and quadratic reciprocity.  The Kronecker symbol is *not* there and
  is built in Layer 0 on top of it.
- `Mathlib/GroupTheory/CoprodI.lean` (free products, with the ping-pong injectivity criterion),
  `Mathlib/GroupTheory/PresentedGroup.lean`, `Mathlib/GroupTheory/FinitelyPresentedGroup.lean`, and
  `Matrix.SpecialLinearGroup.SL2Z_generators` — the inputs to the presentation of `SL(2, ℤ)` in
  Layer 5.
- `Mathlib/Algebra/Module/CharacterModule.lean`, `Mathlib/Analysis/Fourier/FiniteAbelian/*` —
  characters of a finite abelian group and their orthogonality, for the Gauss sums of Layer 5.

Mathlib has no theta series of a lattice, no Poisson summation above dimension one, no Kronecker
symbol, no presentation of `SL(2, ℤ)`, no Weil representation, and no statement that any theta
series is a modular form.

### Tau Ceti and neighbouring roadmaps

- The [integral-lattices roadmap](../IntegralLattices/README.md) owns the dual lattice, the
  discriminant group `A_L`, the discriminant bilinear and quadratic forms, finite bilinear and
  quadratic modules with their `CharacterModule` adjoints and primary decomposition, the
  overlattice/isotropic-subgroup correspondence, and the ADE and `D₈⁺ ≅ E₈` calculations.  Its
  Layers 2, 3 and 5 are dependencies of Layers 0, 5 and 6 here.  This roadmap contributes exactly
  one thing back to it: the real-model comparison its conventions section anticipates
  ("add comparison lemmas only where they transport a genuinely useful theorem").  Layer 0 below is
  that comparison, and the theorems it transports are the two modularity theorems.
- The [modular-forms roadmap](../ModularForms/README.md) owns `modFormCharSpace`, the nebentypus
  decomposition, the valence formula, the level-one graded ring, and the general-level dimension
  formulas.  Its Layer 0 and its level-one summit have **landed** (`modFormCharSpace`,
  `mem_modFormCharSpace_iff_nebentypus`, `isInternal_modFormCharSpace`, `valence_formula`,
  `mvPolynomialEquivModularForms`), and Layers 4–6 here consume them.  Its **Layer 10** — the exact
  dimension formulas at general level — has not been started, and it is the one unbuilt dependency
  of this roadmap: it is consumed only by the general-level worked examples at the very end, and by
  nothing before them.  Every headline theorem here is independent of it.
- Tau Ceti's root-system library and the integral-lattices bridge supply the ADE lattices used in
  the worked examples; do not re-enter Cartan matrices here.

## What is missing (build here)

Poisson summation for a full-rank `ℤ`-lattice in a finite-dimensional real inner product space; the
real-model lattice vocabulary and its bridge to the rational model; the level of an even lattice;
the Kronecker symbol and the discriminant character `χ_L`; the theta series of a lattice and of each
coset of it in its dual, with convergence, holomorphy, and `q`-expansion; the `T`- and
`S`-transformation laws, scalar and vector-valued; the theorem that an even unimodular lattice has
rank divisible by `8`; the theorem that its theta series is a level-one modular form of weight
`n/2`; a presentation of `SL(2, ℤ)`; the Weil representation of `SL(2, ℤ)` on `ℂ[A_L]` attached to
a finite quadratic module; Gauss sums over a finite quadratic module and Milgram's formula; the
Hecke–Schoeneberg theorem `Θ_L ∈ M_k(Γ₀(N), χ_L)`; and the identification of `Θ_{E₈}` and
`Θ_{Leech}` in the level-one graded ring, with the representation-number formulas that follow.

---

## Layer 0: the real lattice model, the bridge, and the arithmetic invariants

Everything downstream reads its hypotheses from this layer, so it is built first and completely.

- **Predicates and their equivalences.**  Define integrality, evenness, and unimodularity as above.
  Prove: evenness implies integrality (polarization); integrality is equivalent to `L ≤ L^∨`;
  `L^∨` is again a full `ℤ`-lattice, with `IsZLattice ℝ L^∨` as an instance so no downstream
  statement carries it as a side condition; `(L^∨)^∨ = L`; and each predicate is invariant under
  isometry, orthogonal direct sum, and positive scaling (with the scaling laws
  `det (c • L) = c^{2n} det L` and the evenness of `c • L` for suitable `c` stated exactly, not
  gestured at).
- **Covolume, determinant, index.**  Prove `ZLattice.covolume L^∨ = (ZLattice.covolume L)⁻¹`; that
  `det L = (covolume L)^2` is a positive integer for integral `L`; that `det L = [L^∨ : L]` and
  `A_L` is finite; and that `det L = |det Gram(b)|` for any `ℤ`-basis, by consuming
  `covolume_eq_det` rather than reproving a determinant/index formula.  Deduce the two forms of
  unimodularity: for integral `L`, `L = L^∨ ↔ covolume L = 1 ↔ det L = 1 ↔ A_L` is trivial.
  ⚠ This equivalence is what lets a consumer holding the sphere-packing predicate
  `ZLattice.covolume L volume = 1` reach `L = L^∨`; state it in that direction explicitly.
- **The bridge to the rational model.**  For an integral `L ⊆ E`, the `ℚ`-span `V_ℚ` of `L` inside
  `E` is a `ℚ`-vector space, `L` is a `Submodule.IsLattice ℚ` in it, and the restriction of
  `innerₗ E` is a symmetric, integral, positive-definite `LinearMap.BilinForm ℚ V_ℚ`.  Construct the
  resulting `IntegralLattice V_ℚ` of the integral-lattices roadmap, and prove that its dual
  submodule, discriminant group, discriminant bilinear form and — when `L` is even — its
  discriminant quadratic form are carried by the inclusion `V_ℚ ↪ E` to the dual lattice,
  `L^∨/L`, `⟪·,·⟫ mod ℤ` and `‖·‖²/2 mod ℤ` computed in `E`.  Prove the converse construction for a
  positive-definite rational lattice (extend scalars to `ℝ`, take the inner product induced by the
  form) and that the two constructions are mutually inverse up to isometry.  Prove the invariants
  agree: rank, signed determinant, discriminant, evenness, unimodularity.
  ⚠ This is the *only* place the two models are compared.  After it, discriminant-form facts are
  quoted through the bridge and never reproved in `E`.
- **The level.**  Define `level L` for even `L`; prove `0 < level L` and the two characterizations
  above are equivalent; prove `level L = 1 ↔ L` is even unimodular; prove `level` is invariant under
  isometry, prove `level (L ⊕ M) = lcm (level L) (level M)`, and prove that the exponent of `A_L`
  divides `level L` and that `level L` divides `2 * det L`.  Prove `√N · L^∨` is again an even
  lattice, of level `N`, with `det = N^n / det L` — the Fricke partner of `L`, recorded here because
  it is the cheapest witness that the level is the right invariant.
- **Shells and representation numbers.**  `shell L t = {v ∈ L | ‖v‖² = t}` and
  `r_L t = (shell L t).ncard`.  Prove each shell finite (from discreteness and boundedness),
  `r_L 0 = 1`, `r_L` invariant under isometry, the convolution formula
  `r_{L ⊕ M} t = ∑ r_L s * r_M (t - s)`, and the polynomial bound `r_L t = O(t^{n/2})` needed for
  the `q`-expansion estimates.  Prove that for even `L` the shells are empty unless `t ∈ 2ℕ`.
  ⚠ Define the shell as a `Set` with a finiteness theorem, not as a `Finset` behind a
  decidability instance; the sets are not decidable and the finiteness is the content.
- **The Kronecker symbol and the discriminant character.**  Mathlib has `jacobiSym` for odd
  denominators only.  Define `kroneckerSym : ℤ → ℤ → ℤ` extending it, with the standard values at
  `2`, `-1` and `0`, and prove: complete multiplicativity in each argument, the periodicity
  `kroneckerSym D · ` is periodic modulo `|D|` for `D ≡ 0, 1 [ZMOD 4]`, and agreement with
  `jacobiSym` and `legendreSym` where those are defined.  Prove that for an even lattice of even
  rank `n = 2k`, `D_L = (-1)^k * det L` satisfies `D_L ≡ 0 [ZMOD 4] ∨ D_L ≡ 1 [ZMOD 4]`.  Define
  `χ_L : DirichletCharacter ℂ (level L)` from `kroneckerSym D_L`, prove it is quadratic, prove its
  conductor divides `level L`, and prove the parity `χ_L (-1) = (-1)^k` — the compatibility with the
  modular-forms roadmap's parity lemma `M_k(N, χ) ≠ 0 → χ(-1) = (-1)^k`, and the first check that
  the character is the right one.

Acceptance at this layer includes: the bridge applied to `⟨2m⟩` and to `A_n`, reproducing the
integral-lattices rank-one and ADE discriminant values from the real model; `level (E₈) = 1`;
`level (A₂) = 3`, `det (A₂) = 3`, `D = -3`; `level (D₄) = 2`, `det (D₄) = 4`, `D = 4`, `χ` trivial;
and `level (⟨2⟩) = 4`, `det = 2`, `D = -4`, `χ = χ₋₄`.

## Layer 1: Poisson summation for a lattice

The analytic engine.  Mathlib has the one-dimensional case and nothing else, and every
transformation law below is an instance of this theorem.

- **The statement.**  For a full-rank `ℤ`-lattice `L` in a finite-dimensional real inner product
  space `E`, a Schwartz function `f : 𝓢(E, ℂ)`, and `v : E`,
  ```text
  ∑' ℓ : L, f (v + ℓ) = (ZLattice.covolume L)⁻¹ * ∑' m : L^∨, 𝓕 f m * exp (2 π i ⟪v, m⟫)
  ```
  with `𝓕` Mathlib's Fourier transform (`∫ f x * exp (-2 π i ⟪x, y⟫)`), and both families summable.
  ⚠ **The sign convention is fixed by `𝓕`, not by the literature.**  With Mathlib's `𝓕` the
  character is `exp (+2 π i ⟪v, m⟫)`.  Sources that write `exp (-2 π i ⟪v, m⟫)` agree with this
  after `m ↦ -m`, and for the even functions used below the two are literally equal.  State the
  `+` version as the theorem and record the `-` version as a corollary, so no downstream proof
  guesses.
- **The route.**  Choose a `ℤ`-basis of `L`, let `A : E ≃ₗ[ℝ] E` carry the standard lattice of
  `EuclideanSpace ℝ (Fin n)` onto `L`, reduce to the standard lattice by
  `SchwartzMap.compCLMOfContinuousLinearEquiv`, and reduce the standard lattice to `n` applications
  of Mathlib's `SchwartzMap.tsum_eq_tsum_fourier` by Fubini for Schwartz functions.  The dual of the
  standard lattice is itself; the transpose-inverse of `A` carries it onto `L^∨`, and
  `|det A| = covolume L` supplies the constant.  ⚠ The reduction is by change of variables, not by
  induction on `n`: an inductive proof needs a Schwartz structure on the partial sums that nothing
  in Mathlib supplies.
- **Summability, separately.**  Prove absolute summability of both sides for Schwartz `f`, from
  `ZLattice.summable_norm_rpow` and the Schwartz seminorm bounds.  Downstream proofs need the
  summability statements on their own, not only inside the equality.
- **Supporting API.**  Prove `𝓕` of a Gaussian on `E` from Mathlib's inner-product-space Gaussian
  Fourier transform in the exact shape Layer 3 consumes:
  `𝓕 (fun x ↦ cexp (π i τ ‖x‖²)) y = (τ/i)^{-n/2} * cexp (π i (-1/τ) ‖y‖²)` for `0 < τ.im`, with
  the even-rank version stated as a genuine integer power.  Prove that the Gaussian is Schwartz for
  `0 < τ.im`, and that translating it by `γ` stays Schwartz.

⚠ This layer is stated for a general `E` and general `n` from the outset.  A dimension-24 or
dimension-8 version would be immediately useless to the other, and the sphere-packing formalization
already demonstrates the cost of the specialized form (see *Provenance*).

## Layer 2: the theta series

- **Definitions and convergence.**  `thetaSeries L : ℍ → ℂ` and `thetaSeriesCoset L γ : ℍ → ℂ` as
  above.  Prove summability for every `τ : ℍ` with an explicit bound on the terms
  (`‖exp (π i ‖v‖² τ)‖ = exp (-π ‖v‖² τ.im)`), local uniform convergence on `ℍ`, and hence
  holomorphy: both `DifferentiableOn ℂ` on the upper half-plane set and
  `MDifferentiable` in the `UpperHalfPlane` charts, since the bundled `ModularForm` needs the
  latter and every analytic argument wants the former.
- **Well-definedness on `A_L`.**  `thetaSeriesCoset L γ` depends only on `γ + L`; package the
  induced map `A_L → (ℍ → ℂ)`, and prove `θ_{-γ} = θ_γ`.  ⚠ Record the last one prominently: it is
  why the family `(θ_γ)` is **not** linearly independent, and why the Weil representation of Layer 5
  cannot be defined by reading off transition matrices from the theta functions themselves.
- **`q`-expansion.**  For even `L`, prove
  `HasSum (fun m : ℕ ↦ (r_L (2m) : ℂ) * q^m) (thetaSeries L τ)` with `q = exp (2 π i τ)`, and
  identify `(qExpansion 1 (thetaSeries L)).coeff m = r_L (2m)` through
  `ModularFormClass.qExpansion_coeff_unique`.  For `θ_γ`, prove periodicity with period `level L`
  and the corresponding expansion in `q_N`, with the leading exponent `q_L(γ)`.  Prove
  `Θ_L` is bounded at `i∞` and that `Θ_L(iy) > 0` for `y > 0` — the positivity is the
  nonvanishing witness that Layer 4's rank argument needs, and it is one line here and a nuisance
  later.
- **Functoriality.**  `Θ` is invariant under isometry; `Θ_{L ⊕ M} = Θ_L · Θ_M`;
  `Θ_{c • L}(τ) = Θ_L(c² τ)` for `0 < c`; `Θ_L(τ) = ∑_{γ ∈ A_L} θ_γ(τ)` summed over `A_L` recovers
  `Θ_{L^∨}`.  Each of these is used in the worked examples, and each is a one-line consequence of a
  reindexing that should be proved once.
- **The rank-one identification.**  `thetaSeries (ℤ ∙ 1 : Submodule ℤ ℝ) = jacobiTheta` (after the
  identification `ℝ ≃ EuclideanSpace ℝ (Fin 1)`), and consequently
  `thetaSeries (√2 • ℤ) τ = jacobiTheta (2 τ)`.  ⚠ This is an acceptance test for the conventions,
  not a curiosity: if it fails, the exponent convention or the norm convention is wrong, and it is
  far cheaper to discover that here than inside a `Γ₀(N)` computation.

## Layer 3: the two transformation laws

- **Translation.**  `θ_γ(τ + 1) = exp (2 π i q_L(γ)) * θ_γ(τ)` for even `L` and `γ ∈ L^∨`, where
  `q_L(γ) ∈ ℚ/ℤ` is the discriminant quadratic form and the exponential is well defined precisely
  because the value is taken mod `ℤ`.  In particular `Θ_L(τ + 1) = Θ_L(τ)`, i.e.
  `Θ_L ∣[k] T = Θ_L`, for even `L`.  ⚠ Evenness is exactly what this needs and integrality is not
  enough; do not weaken the hypothesis.
- **Inversion, scalar form.**  For any full-rank `L` (no integrality needed) and `0 < τ.im`,
  ```text
  Θ_L (-1/τ) = (ZLattice.covolume L)⁻¹ * (τ/i)^{n/2} * Θ_{L^∨} (τ)
  ```
  by Layer 1 applied to the Gaussian at `v = 0`.  For even rank state the factor as `(-i)^k * τ^k`.
  In slash form, `Θ_L ∣[k] S = (-i)^k * (covolume L)⁻¹ * Θ_{L^∨}`.
- **Inversion, vector-valued.**  For even `L`, `γ ∈ L^∨`, and `0 < τ.im`,
  ```text
  θ_γ (-1/τ) = (covolume L)⁻¹ * (τ/i)^{n/2} * ∑ δ : A_L, exp (2 π i b_L(γ, δ)) * θ_δ (τ)
  ```
  the sum over the finite discriminant group, with `b_L` the discriminant bilinear form.  This is
  Layer 1 at `v = γ`, with the sum over `L^∨` broken into cosets; the character
  `exp (2 π i ⟪γ, m⟫)` descends to `A_L` exactly because `γ ∈ L^∨` and `⟪γ, ℓ⟫ ∈ ℤ` for `ℓ ∈ L`.
  Record `(covolume L)⁻¹ = (det L)^{-1/2} = |A_L|^{-1/2}` as a rewriting lemma, since the literature
  states the coefficient in the third form.  Note the sign remark of Layer 1: `θ_δ = θ_{-δ}` makes
  `exp(2 π i b_L(γ,δ))` and `exp(-2 π i b_L(γ,δ))` interchangeable here, and the roadmap's stated
  form is the one Poisson summation produces.
- **Consistency checks, proved not assumed.**  `Θ_{L^∨}` recovered from `∑_γ θ_γ`; the two laws
  applied twice give `Θ_L(τ) = Θ_L(τ)` through `S² = -I` acting trivially in even weight; and the
  rank-one case reproduces `jacobiTheta_S_smul`.

## Layer 4: level one — even unimodular lattices

- **The rank is divisible by `8`.**  For `L` even unimodular of rank `n`, `8 ∣ n`.  Route of
  record, elementary and self-contained at this layer: replacing `L` by `L ⊕ L` or `L^{⊕4}`
  (again even unimodular, by Layer 0) reduces to `n ≡ 4 [MOD 8]`, where Layer 3 gives
  `Θ ∣[k] S = (-i)^k Θ = -Θ` and `Θ ∣[k] T = Θ`, so `Θ ∣[k] (ST)^3 = -Θ`; but `(ST)^3 = S^2 = -I`
  acts trivially in even weight, whence `Θ = 0`, contradicting `Θ(i) > 0` from Layer 2.  ⚠ The
  reduction is what keeps this inside even rank: for odd `n`, `4n` is even and `≡ 4 [MOD 8]`, so
  no half-integral-weight theta series is ever formed.  Layer 5 reproves this in one line from
  Milgram's formula; both proofs are wanted, and the elementary one is not superseded.
- **The theorem.**  For `L` even unimodular of rank `n = 2k`, `Θ_L ∣[k] γ = Θ_L` for every
  `γ ∈ SL(2, ℤ)`, and `Θ_L` is a `ModularForm 𝒮ℒ k`.  The proof is
  `SlashInvariantForm.slash_action_generators_SL2Z` applied to the two laws of Layer 3, with
  `L^∨ = L` and `covolume L = 1` collapsing the `S`-factor to `(-i)^k = 1` by `8 ∣ n`; holomorphy
  and boundedness at the cusp come from Layer 2.  Build it the way `CuspForm.discriminant` is built
  in Mathlib.
- **The basic API of the bundled form.**  `qExpansion 1 (thetaForm L) |>.coeff m = r_L (2m)`;
  `thetaForm L ≠ 0`; `thetaForm (L ⊕ M) = thetaForm L * thetaForm M` as modular forms (via
  `ModularForm.mul`); invariance under isometry.  These are what the identifications of Layer 6
  actually consume.
- **The structural corollary.**  `⨁_{4 ∣ k} M_k(SL(2,ℤ)) = ℂ[E₄, Δ]`: from Tau Ceti's
  `mvPolynomialEquivModularForms` (the graded ring is freely generated by `E₄` and `E₆`), the
  weights divisible by `4` are spanned by monomials `E₄^a E₆^b` with `b` even, and
  `E₆² = E₄³ - 1728 Δ`.  Hence the theta series of an even unimodular lattice is a polynomial in
  `E₄` and `Δ` with `4a + 12b = k`.  This is the general statement of which Layer 6's two headline
  identities are instances, and it is proved here, not one lattice at a time.

## Layer 5: general level — the Hecke–Schoeneberg theorem

The summit.  The route of record is the vector-valued one, because the objects it needs are the
discriminant forms that the integral-lattices roadmap already builds, and because it delivers the
`Γ(N)`-statement for the coset series as well as the `Γ₀(N)`-statement for `Θ_L`.

- **A presentation of `SL(2, ℤ)`.**  `SL(2, ℤ) ≅ ⟨S, T | S⁴ = 1, (ST)³ = S²⟩`, equivalently
  `PSL(2, ℤ) ≅ ℤ/2 * ℤ/3`, proved by the ping-pong lemma on `ℍ` (or on `ℝ`) with Mathlib's
  `Monoid.CoprodI` machinery, together with `Matrix.SpecialLinearGroup.SL2Z_generators` for
  surjectivity.  ⚠ This is genuinely absent from Mathlib and is a project in its own right; it is
  also independently valuable, and it is the only way to obtain a *homomorphism* out of `SL(2, ℤ)`
  defined on generators.  It cannot be replaced by reading transition matrices off the theta
  functions, because `θ_γ = θ_{-γ}` makes them dependent (Layer 2).
- **The Weil representation.**  For a nondegenerate finite quadratic module `(A, q)` of even
  signature — in particular for `(A_L, q_L)` with `L` even of even rank — define
  `ρ_{A,q} : SL(2, ℤ) →* GL (A →₀ ℂ)` by
  ```text
  ρ(T) e_γ = exp (2 π i q(γ)) • e_γ,      ρ(S) e_γ = σ • ∑ δ, exp (2 π i b(γ, δ)) • e_δ
  ```
  with `σ = |A|^{-1/2} * (-i)^{n/2}`, well defined by the presentation once the two relations are
  checked — and checking them **is** the Gauss-sum computation, not a formality.  Prove: `ρ` is
  unitary, `ρ(-I) e_γ = (-1)^k e_{-γ}`, `ρ` factors through `SL(2, ℤ/N)` for `N` the level, and `ρ`
  is compatible with orthogonal sums of finite quadratic modules and with negation.
- **Gauss sums and Milgram's formula.**  For a finite quadratic module, the Gauss sums
  `G(a, A) = ∑ γ, exp (2 π i a q(γ))` for `a` prime to the level; multiplicativity over the primary
  decomposition (consumed from the integral-lattices roadmap); evaluation of `G(1, A_L)`:
  ```text
  ∑ γ : A_L, exp (2 π i q_L(γ)) = |A_L|^{1/2} * exp (2 π i n / 8)
  ```
  for `L` positive definite of rank `n` — **Milgram's formula**, the signature-mod-`8` theorem — and
  the evaluation of `G(a, A_L)` in terms of `kroneckerSym D_L a` and `G(1, A_L)`.  Deduce `8 ∣ n`
  for even unimodular `L` in one line (`|A_L| = 1`), reproving Layer 4's theorem from the general
  statement.  ⚠ This is the hardest single input of the roadmap.  Price it as such: it is where the
  character `χ_L` actually comes from, and no route to the general-level theorem avoids it.
- **Vector-valued modularity.**  The `ℂ[A_L]`-valued function `Θ = ∑_γ θ_γ e_γ` satisfies
  `Θ ∣[k] A = ρ_{A_L}(A) Θ` for every `A ∈ SL(2, ℤ)`, by the presentation and Layer 3.  Deduce
  `θ_γ ∈ M_k(Γ(N))` for every `γ`, and boundedness of each `θ_γ` at every cusp — the latter from the
  transformation law itself, since every `θ_δ` has a `q_N`-expansion supported in nonnegative
  exponents.
- **The `Γ₀(N)` formula.**  For `A = !![a, b; c, d] ∈ Γ₀(N)`, `ρ_{A_L}(A) e_0 = χ_L(d) • e_0`,
  and hence the **Hecke–Schoeneberg theorem**: for `L` even of even rank `n = 2k` and level `N`,
  ```text
  Θ_L ∣[k] A = χ_L(d) * Θ_L   for every   A = !![a, b; c, d] ∈ Γ₀(N)
  ```
  so `Θ_L` is a `ModularForm ((Gamma1 N).map (mapGL ℝ)) k` lying in `modFormCharSpace k χ_L`, where
  `χ_L` is the Layer-0 character in its unit-homomorphism face.  Prove the `Γ₀(N)`-spelling and the
  character-space spelling equivalent through the landed `mem_modFormCharSpace_iff_nebentypus`, and
  prove the level-one theorem of Layer 4 is the case `N = 1` of this one.
  ⚠ **The alternative route, recorded and not taken.**  Schoeneberg's own proof decomposes
  `A = T^{a/c} · diag(1/c, c) · S · T^{d/c}` in `SL(2, ℝ)` for `c ≠ 0` and computes
  `Θ_L(τ + a/c)` by splitting `L` into classes mod `cL`, producing the same Gauss sums without any
  group presentation.  It is a legitimate route and a contributor who finds the presentation
  blocking may take it; it does **not** deliver the `Γ(N)`-statement for the coset series, which is
  then a separate target.  Say which route a pull request takes.
- **Consequences to state here.**  `Θ_{√N L^∨}` and the Fricke involution `W_N` exchange `Θ_L` and
  `Θ_{√N L^∨}` up to an explicit constant; `Θ_L` is bounded at every cusp; and the constant term of
  `Θ_L` at the cusp `∞` is `1`, so `Θ_L` is never a cusp form.

## Layer 6: identification of the classical theta series

- **Even unimodular rank 8 and 16.**  `dim M_4(SL(2,ℤ)) = 1` (Mathlib's
  `levelOne_weight_four_rank_one`), and the level-one Sturm bound at weight `4` is `⌊4/12⌋ = 0`, so
  a weight-`4` form is determined by its constant term alone.  Hence for **every** even unimodular
  `L` of rank `8`, `Θ_L = E₄`, and for every one of rank `16`, `Θ_L = E₄²`.  ⚠ No representation
  number is an input to either identity; both follow from `r_L(0) = 1`.
- **`E₈`.**  `Θ_{E₈} = E₄`, and therefore `r_{E₈}(2m) = 240 * σ₃(m)` for `m ≥ 1`, from
  `EisensteinSeries.E_qExpansion_coeff` with `bernoulli 4 = -1/30`.  In particular the kissing
  number `r_{E₈}(2) = 240` is a **corollary**, not a hypothesis.  The lattice is the sphere-packing
  project's `E8Lattice : Submodule ℤ (EuclideanSpace ℝ (Fin 8))`, whose integrality, evenness and
  `E8Matrix_unimodular` are already formalized; Layer 0's `covolume = 1 ↔ L = L^∨` and
  `ZLattice.covolume_eq_det` connect them to this roadmap's hypotheses.
- **Even unimodular rank 24, in general.**  `dim M_12(SL(2,ℤ)) = 2` with basis `E₄³, Δ`, and the
  Sturm bound at weight `12` is `1`, so a weight-`12` form is determined by its first **two**
  coefficients.  For every even unimodular `L` of rank `24`,
  ```text
  Θ_L = E₄³ + (r_L(2) - 720) * Δ
  ```
  since `E₄³` has `q`-coefficient `720` and `Δ` has `q`-coefficient `1`.  Prove this general form
  first; the Leech identity is its rootless case.
- **The Leech lattice.**  `Θ_Λ = E₄³ - 720 Δ`, from the general rank-24 formula and `r_Λ(2) = 0`,
  which is the sphere-packing project's already-formalized `leech_rootless`; the remaining
  hypotheses are `leech_evenNormSq` and `leech_covolume = 1`.  Prove the equivalent Eisenstein form
  `Θ_Λ = E₁₂ - (65520/691) Δ`, and deduce
  ```text
  r_Λ(2m) = (65520/691) * (σ₁₁(m) - τ(m))
  ```
  with `τ` the Ramanujan tau function (the `q`-expansion coefficients of `Δ`).  In particular the
  Leech kissing number `r_Λ(4) = 196560` is a corollary.  ⚠ `196560` is an **output** of this
  roadmap, not an input: it must not appear as a hypothesis anywhere, and a proof that computes it
  by counting has not discharged this target.
- **The rank-16 pair.**  `E₈ ⊕ E₈` and `D₁₆⁺` are both even unimodular of rank `16`, so both have
  theta series `E₄²`; they are **not** isometric.  `D₁₆⁺` is an instance of the integral-lattices
  roadmap's Lagrangian-glue theorem: in `A_{D₁₆} ≅ (ℤ/2)²` the spinor class has `q(s) = 16/8 ≡ 0`,
  so `⟨s⟩` is quadratic-isotropic of order `2` in a group of order `4`, hence Lagrangian, and its
  preimage is even unimodular.  Non-isometry: the sublattice generated by the vectors of norm `2` is
  an isometry invariant, and it is the whole lattice for `E₈ ⊕ E₈` and of index `2` for `D₁₆⁺`
  (both have `480` such vectors, so the count does not separate them).  ⚠ Keep the two statements
  apart: equality of theta series is Layer 6's, and non-isometry is a root-sublattice computation
  consuming the integral-lattices `D_n` coordinate model.  Stating only the first invites the reader
  to conclude the second.

## Worked examples (acceptance criteria)

Each is a formal acceptance test: the general theorem, instantiated, with every hypothesis
discharged from the lattice's own construction.  Entering a `q`-expansion by hand discharges
nothing.

- `thetaSeries ℤ = jacobiTheta` (Layer 2) — the convention check.
- `Θ_{E₈} = E₄`; `r_{E₈}(2) = 240`; `r_{E₈}(2m) = 240 σ₃(m)`.
- `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ`; `r_Λ(4) = 196560`;
  `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`.
- `Θ_{E₈ ⊕ E₈} = Θ_{D₁₆⁺} = E₄²`, with the two lattices non-isometric.
- `Θ_{A₂} ∈ M_1(Γ₀(3), χ₋₃)` and `Θ_{D₄} ∈ M_2(Γ₀(2))` (trivial character, since `D = 4`) — the
  general-level theorem at its two smallest interesting instances, with `level`, `det` and `χ`
  computed from the lattice through Layer 0 rather than quoted.  Weight `1` at `A₂` is admissible
  here because nothing in this roadmap needs a dimension formula to *state* modularity.
- ⚠ **Identifying** `Θ_{D₄}` with the weight-`2` Eisenstein series `2E₂(2τ) - E₂(τ)`, and `Θ_{A₂}`
  with its weight-`1` Eisenstein series, needs `dim M_2(Γ₀(2)) = 1` and `dim M_1(Γ₀(3), χ₋₃) = 1`,
  which is **Layer 10 of the modular-forms roadmap** — the exact general-level dimension formulas,
  not yet started there.  These two identifications are therefore sequenced last and are the only
  targets of this roadmap gated on unbuilt material; they are cited as a dependency on that
  roadmap, and every other target above is independent of it.  A contributor should not attempt a
  private dimension count to unblock them.

## Ordering — the dependency graph

- **Layer 0** (real model, bridge, level, Kronecker symbol) → Mathlib; integral-lattices Layers 1–3.
- **Layer 1** (lattice Poisson summation) → Mathlib only.  Independent of Layer 0 and can proceed
  beside it.
- **Layer 2** (the theta series) → Layers 0, 1.
- **Layer 3** (the two laws) → Layers 1, 2; integral-lattices Layer 3 for `q_L` and `b_L`.
- **Layer 4** (level one) → Layer 3, Mathlib's `slash_action_generators_SL2Z` and level-one
  dimension formula, Tau Ceti's landed level-one graded ring.
- **Layer 5** (general level) → Layers 3, 4; integral-lattices Layers 3–4 for finite quadratic
  modules and their primary decomposition; modular-forms Layer 0 (**landed**) for
  `modFormCharSpace`.  The `SL(2, ℤ)` presentation is a sub-block with no dependency but Mathlib,
  and should be started early since everything in the layer waits on it.
- **Layer 6** (identifications) → Layer 4 only, for `E₈`, Leech and the rank-16 pair; Layer 5 and
  modular-forms Layer 10 (**not started**) for the two general-level identifications.
- The sphere-packing lattices are consumed as *inputs* at Layer 6 and nowhere earlier; nothing in
  Layers 0–5 mentions dimension `8` or `24`.

| Block | Status |
|---|---|
| Layer 0 real model and bridge | **new**; the bridge is anticipated by the integral-lattices roadmap |
| Layer 0 Kronecker symbol | **new**; Mathlib has `jacobiSym` only |
| Layer 1 lattice Poisson summation | **new** in general dimension; a dimension-24 instance exists (see *Provenance*) |
| Layer 2 theta series | **new** in general; a dimension-24 instance exists |
| Layer 3 transformation laws | `S` exists at dimension 24; the vector-valued form is **new** |
| Layer 4 level one | **new**; the group-theoretic input is a single Mathlib lemma |
| Layer 5 `SL(2, ℤ)` presentation | **new**; independently valuable, and the gate on the rest of the layer |
| Layer 5 Weil representation, Gauss sums, Milgram | **new**; hardest single input of the roadmap |
| Layer 6 identifications | **new**; the lattices themselves are formalized elsewhere |

## Provenance

The dimension-8 and dimension-24 lattices, and a dimension-24 instance of Layers 1–3, exist in the
sphere-packing formalization
([github.com/math-inc/Sphere-Packing-Lean](https://github.com/math-inc/Sphere-Packing-Lean),
Apache-2.0), which builds on the original EPFL project of Hariharan, Viazovska, Birkbeck, Lee, Ma
and Mehta ([github.com/thefundamentaltheor3m/Sphere-Packing-Lean](https://github.com/thefundamentaltheor3m/Sphere-Packing-Lean)).
**Coordinate with its authors and obtain their agreement before porting any of it**, and discuss the
plan on the Lean Zulip; the licence permitting reuse is not on its own a reason to reuse.

This section is secondary and is **not** prescriptive: the source is a map of what exists, not a
specification, and the roadmap above is written so the material could be built fresh.  In
particular, everything cited here is hard-wired to `EuclideanSpace ℝ (Fin 24)` or
`EuclideanSpace ℝ (Fin 8)` and must be *generalized*, not copied, and the ad-hoc predicates
`EvenNormSq`, `Integral`, `Rootless`, `Unimodular` there are replaced by the Layer-0 vocabulary
above, with comparison lemmas so the existing `E₈` and Leech facts can be consumed.

| Existing | Roadmap target |
|---|---|
| `SpherePacking/Dim8/E8/Basic.lean`, `.../Packing.lean`: `Submodule.E8`, `E8Lattice`, `E8_integral`, `E8_integral_self`, `E8Matrix_unimodular` | consumed as an input at Layer 6 |
| `SpherePacking/Dim24/LeechLattice/*`: `LeechLattice`, `leech_covolume`, `leech_norm_lower_bound`, `IsZLattice` instance | consumed as an input at Layer 6 |
| `.../Uniqueness/LatticeInvariants.lean`: `EvenNormSq`, `Integral`, `Rootless`, `Unimodular`, `leech_evenNormSq`, `leech_rootless`, `leech_unimodular` | Layer 0 predicates, plus comparison lemmas |
| `SpherePacking/CohnElkies/PoissonSummation*`: `SchwartzMap.poissonSummation_lattice` | Layer 1, generalized from `ℝ²⁴` to any `E` |
| `.../Classify/EvenUnimodular/ThetaAnalytic.lean`, `ThetaSeries.lean`: `thetaSeries`, `thetaShell`, `thetaCoeff`, `summable_thetaTerm`, `thetaSeries_add_one_of_even` | Layers 0 and 2, generalized |
| `.../Classify/EvenUnimodular/ThetaTransform.lean`: `thetaSeries_transform_S` | Layer 3, generalized, with the vector-valued form added |
| `.../Classify/EvenUnimodular/{Discrete,FiniteShells,MinNorm,FundamentalDomain}.lean` | Layer 0 shells and finiteness, generalized |

Nothing in the sphere-packing project states that a theta series is a modular form; the modularity
theorems, the Weil representation, the general-level theorem and every identification in Layer 6 are
new formalization ground, and we found no Lean prior art for them (as of August 2026).

## References

- J.-P. Serre, *A Course in Arithmetic*, GTM 7 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-1-4684-9884-4).  Ch. VII §6 is the level-one theorem: the theta
  series of an even unimodular lattice is a modular form of weight `n/2`, with the `8 ∣ n` argument
  by passing to `L ⊕ L` and `L^{⊕4}` used in Layer 4, and §3 is the structure of `M_*(SL(2,ℤ))`.
- W. Ebeling, *Lattices and Codes*, 3rd ed. (Springer, 2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9).  Ch. 2 for theta series, Poisson summation and
  the transformation formula; Ch. 3, §3.1 for the Hecke–Schoeneberg theory (the results are
  attributed there to Hecke and Schoeneberg, following Ogg and Schoeneberg), whose Theorem 3.2 is
  the general-level statement of Layer 5: for an even lattice `Λ` of level `ℓ` and dimension
  `n = 2k`, `θ_Λ ∈ M_k(Γ₀(ℓ), χ_Λ)` with `χ_Λ(·) = ((-1)^k det Λ / ·)`.  Ch. 3 also has the `E₈`,
  `E₈ ⊕ E₈` and `D₁₆⁺` calculations of Layer 6.
- A. Ogg, *Modular Forms and Dirichlet Series* (Benjamin, 1969), Ch. VI — the source Ebeling
  follows for the general-level transformation formula and the Gauss-sum evaluation.
- B. Schoeneberg, *Elliptic Modular Functions: An Introduction*, Grundlehren 203 (Springer, 1974),
  [DOI](https://doi.org/10.1007/978-3-642-65663-7).  Ch. IX is the original route of the alternative
  proof recorded in Layer 5, via the decomposition of a `Γ₀(N)` matrix in `SL(2, ℝ)`.
- T. Miyake, *Modular Forms* (Springer, 1989), [DOI](https://doi.org/10.1007/3-540-29593-3), §4.9 —
  theta series with spherical coefficients and their nebentypus; the numbering the modular-forms
  roadmap follows elsewhere.  ⚠ The spherical-coefficient generality is **not** a target here.
- H. Iwaniec, *Topics in Classical Automorphic Forms*, GSM 17 (AMS, 1997),
  [DOI](https://doi.org/10.1090/gsm/017), Ch. 10 — theta functions, the general transformation
  formula, and the Gauss sums, in the form closest to the Layer-5 computation.
- J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed. (Springer, 1999),
  [DOI](https://doi.org/10.1007/978-1-4757-6568-7).  Ch. 2 §2.3 for theta series and the `E₈`,
  `A₂`, `D₄` expansions; Ch. 4 §11 for the Leech lattice theta series
  `Θ_Λ = E₁₂ - (65520/691) Δ` and the formula `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`; Ch. 7 for the
  even unimodular theta series as polynomials in `E₄` and `Δ`.
- J. Milnor and D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-3-642-88330-9).  Appendix 4 is Gauss sums and **Milgram's
  formula**, `∑_{γ} e(q(γ)) = |A|^{1/2} e(σ/8)`, the Layer-5 signature theorem.
- V. V. Nikulin, "Integral symmetric bilinear forms and some of their applications", *Math.
  USSR-Izv.* **14** (1980), [MathNet](https://www.mathnet.ru/eng/im1677),
  [DOI](https://doi.org/10.1070/IM1980v014n01ABEH001060).  §1.1 and §1.4 — cited here only through
  the [integral-lattices roadmap](../IntegralLattices/README.md), and in its half-norm translation.
- N. R. Scheithauer, "The Weil representation of `SL₂(ℤ)` and some applications", *Int. Math. Res.
  Not.* **2009**, [DOI](https://doi.org/10.1093/imrn/rnn128) — explicit formulas for `ρ_L(A)` at an
  arbitrary `A ∈ SL(2, ℤ)`, and the `Γ₀(N)` specialization of Layer 5.  F. Strömberg, "Weil
  representations associated with finite quadratic modules", *Math. Z.* **275** (2013),
  [DOI](https://doi.org/10.1007/s00209-013-1188-z) — the same in the finite-quadratic-module
  language this roadmap uses.
- J.-P. Serre, *Trees* (Springer, 1980), [DOI](https://doi.org/10.1007/978-3-642-61856-7), §I.4 —
  `PSL(2, ℤ) ≅ ℤ/2 * ℤ/3`, the presentation of Layer 5.  R. C. Alperin, "`PSL₂(ℤ) = ℤ/2 * ℤ/3`",
  *Amer. Math. Monthly* **100** (1993), [DOI](https://doi.org/10.2307/2324046) — the short
  ping-pong proof, which is the route of record.
- H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, "The sphere packing problem in
  dimension 24", *Ann. of Math.* **185** (2017), [arXiv:1603.06518](https://arxiv.org/abs/1603.06518)
  — the source of the formalized Leech lattice consumed at Layer 6.

## Acknowledgements

The lattices of Layer 6 and a dimension-24 instance of Layers 1–3 come from the sphere-packing
formalization; see *Provenance* for the coordination requirement.  The discriminant-form vocabulary
is the [integral-lattices roadmap](../IntegralLattices/README.md)'s, and the modular-form vocabulary
is the [modular-forms roadmap](../ModularForms/README.md)'s; this roadmap adds only the bridge
between them.
