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
`TauCeti.IntegralLattice` of Tau Ceti's integral-lattice library, built to the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md): that is a
`ℤ`-submodule of a rational vector space with a rational bilinear form, and the difference is not
cosmetic: the theta series is a sum of `exp(π i ‖v‖² τ)` over `L`, so it needs a real norm to
converge, and Poisson summation needs the Haar measure of `E` and the covolume of `L`.  The two
models are related by a bridge built in Layer 2, and *all* discriminant-group and
discriminant-form theory is consumed from that library through the bridge rather than redeveloped
here.

**Rank.**  Layers 1–3 — Poisson summation, the lattice model, and the theta series with their
convergence, `q`-expansions, functoriality and the rank-one comparison with `jacobiTheta` — are
stated for a lattice of **arbitrary** rank.  From Layer 4 on, every statement that carries an
automorphy factor assumes **even** rank `n = 2k`, so that the factor is `(τ/i)^k = (-i)^k * τ^k`
with `k : ℕ`, an honest integer power, and `Complex.cpow` stays out of the modularity layers.  A
lattice of odd rank has a theta series of half-integral weight, which means the metaplectic group,
a theta multiplier and a branch of `√τ` tracked through every statement; half-integral weight is
out of scope, and a contributor should not attempt it here.  The one odd-rank *transformation*
statement in Mathlib, `jacobiTheta_S_smul`, is consumed only through its square (Layer 4), and the
same applies to the Gauss sums of Layer 6: reciprocity and Milgram's formula are stated at even
rank, and the rank-one Landsberg–Schaar identity, whose proof is the odd-rank `S`-law, is not a
target — its square at rank two is.

Suggested home: `TauCeti/NumberTheory/ThetaSeries/`, with separate files for lattice Poisson
summation, the real lattice model and the bridge, the theta series and its `q`-expansion, the
transformation laws, the level-one theorem, Gauss sums, the general-level theorem, and the worked
lattices.

## Scope and ownership

Two roadmaps border this one: the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md), whose material
is Tau Ceti library code under `TauCeti/LinearAlgebra/IntegralLattice/` and
`TauCeti/LinearAlgebra/FiniteBilinearModule/`, and the
[modular-forms roadmap](../ModularForms/README.md).  No other roadmap states a theta series or
Poisson summation on a lattice; whichever later needs them consumes them from here.  The boundary
is the following.

### Owned here

- **Poisson summation for a full-rank `ℤ`-lattice** in a finite-dimensional real inner product
  space, for Schwartz functions, with its translation, summability and Gaussian corollaries
  (Layer 1), and the dual lattice itself together with the biduality and covolume lemmas that go
  with it (2A, 2C).  This is the generic theorem; anyone who needs Poisson summation on a lattice
  takes it, and those lemmas, from here.
- The **real lattice model** — dual lattice, determinant, level, shells, representation numbers,
  scaling and orthogonal sums — and the **bridge** to the rational carrier `TauCeti.IntegralLattice`
  (Layer 2).  The **level** of an even lattice is defined here (2E) and identified through the
  bridge with the order of Tau Ceti's discriminant quadratic map.
- The **Kronecker symbol** and the **discriminant character** `χ_L` (Layers 2 and 6).
- The **theta series** `Θ_L` and the **coset theta series** `θ_γ`, `γ ∈ L^∨/L`, as holomorphic
  functions on `ℍ`, with convergence, `q`- and `q_N`-expansions, and functoriality (Layer 3).
- The **transformation laws** under `T` and `S`, scalar and vector-valued (Layer 4).
- **Gauss sums of a lattice**, their reciprocity law, their evaluation, and Milgram's formula for
  a positive-definite lattice (Layer 6).
- **Modularity**: `Θ_L ∈ M_k(SL(2,ℤ))` for even unimodular `L`, the Hecke–Schoeneberg theorem
  `Θ_L ∈ M_k(Γ₀(N), χ_L)`, and `θ_γ ∈ M_k(Γ(N))` (Layers 5 and 7).
- The **applications**: `Θ_{E₈}`, the Leech lattice, the rank-`16` pair `E₈ ⊕ E₈` and `D₁₆⁺` —
  including the construction of `D₁₆⁺` by gluing and the non-isometry of the pair, which no other
  roadmap builds — and `A₂` and `D₄` (Layer 8).

### Consumed, not redefined

- From Tau Ceti's integral-lattice library, cited by the layer of the completed roadmap that
  specified it: the rational carrier `TauCeti.IntegralLattice` with `IsEven`, `IsUnimodular`,
  `IsPosDef`, `Isometry`, `orthogonalSum`, `determinant` and `discriminant` (its *Layer 1: lattices
  with forms*); the dual `dualCarrier`, the discriminant group `DiscriminantGroup` and its pairing
  `discriminantPairing` (*Layer 2: duality and the finite discriminant group*); finite bilinear
  and quadratic modules `FiniteBilinearModule` and `FiniteQuadraticModule` with their isotropic
  and Lagrangian subgroups, orthogonal quotients and primary decomposition, and the half-norm
  discriminant quadratic map `discriminantQuadraticMap` of an even lattice (*Layer 3: finite
  bilinear and quadratic modules*); the overlattice correspondence
  `intermediateCarrierOfDiscriminantSubgroup` with `isEven_iff_isIsotropic_discriminantSubgroup`
  and its index and unimodularity criteria (*Layer 4: overlattices and isotropic subgroups*); and
  the rank-one and ADE lattices `rankOne`, `typeARootLattice`, `checkerboardLattice` (type `Dₙ` in
  Conway–Sloane coordinates, with its spinor class), `typeE₈RootLattice` and the glued
  `d8PlusLattice ≅ E₈`, with their discriminant forms (*Layer 5: rank one and ADE discriminant
  forms*).  Its `ofIntegralForm`, the rationalization of an integral form on a finite free
  `ℤ`-module, is the constructor the bridge of 2D uses.  This roadmap adds no competing definition
  of any of these; it transports them across the Layer-2 bridge.
- From the [modular-forms roadmap](../ModularForms/README.md): `modFormCharSpace` and the
  nebentypus decomposition, the parity lemma, the level-one graded ring, and the finite-index
  Sturm bound `ModularForm.sturm_bound_finiteIndex` with its corollary `eq_of_sturm_bound` (all
  landed in Tau Ceti); the **Eisenstein series with character** of its *Layer 0* — the
  normalized weight-`1` series for `χ₋₃` at level `3` and the weight-`2` combination
  `2E₂(2τ) - E₂(τ)` at level `2`, with their `q`-expansions and boundedness at every cusp — which
  the two general-level identifications at the end of Layer 8 compare against; and the Fricke
  matrix `W_N` with its raw slash (`frickeGL`, `frickeOperator`, `frickeScalar`, landed), against
  which 7F pins the Fricke identity in both normalizations, so that the normalized operator
  `𝒲_N = (√N)^{2-k} • (· ∣[k] W_N)` of its *Layer 6* evaluates on `Θ_L` by a citation.  No
  dimension formula is consumed anywhere in this roadmap.
- From Mathlib: everything listed under *Existing library material*.

### Not owned here

- **The number-field theta function and its Mellin transform** — the real-parameter Gaussian
  theta of an ideal lattice in the mixed space, its transformation with level and epsilon, and the
  completed zeta and Hecke L-functions it produces.  These are specific to number fields and are
  not the lattice theta series of this roadmap.  Whichever roadmap builds them *consumes* from
  here, by name, `poissonSummation`, `summable_poisson_left`, `summable_poisson_right`, `gaussian`,
  `gaussian_apply` and `fourier_gaussian` of Layer 1, together with `dual` (fixed in the
  conventions), `dual_dual` (2A) and `covolume_dual` (2C); this roadmap owns nothing specific to a
  number field.  ⚠ Layer 1 quantifies over a real inner product space `E`, and a consumer whose
  own model is not one — Mathlib's `NumberField.mixedEmbedding.mixedSpace` carries a product sup
  norm — applies it in a Euclidean model (`EuclideanSpace` or a `WithLp 2` space) reached by a
  **continuous real linear equivalence**, carrying with it the quadratic form, the dual pairing,
  the normalization of the measure, and the comparison of covolumes by the Jacobian of that
  equivalence.  It is not a linear isometry: no linear isometry from a sup-norm space onto an
  inner product space exists in general (in `ℝ²` with the sup norm,
  `‖e₁ + e₂‖² + ‖e₁ - e₂‖² = 2 ≠ 4 = 2‖e₁‖² + 2‖e₂‖²` fails the parallelogram law), and an
  isometry is the right tool only once the source carries a compatible inner-product norm.  That
  transport belongs to the consumer, and Layer 1 is not weakened to avoid it.
- **The arithmetic of the rational lattice beyond the library above** — Jordan splittings, the
  genus, the Gauss-sum signature `sign q ∈ ℤ/8` of a finite quadratic module, Milgram's theorem
  at indefinite signature, Nikulin's existence and uniqueness theory, the classification of
  unimodular lattices in low rank.  None of it is needed here: 6C is Milgram's formula for a
  *positive-definite* lattice, proved by theta asymptotics, which is exactly the form Layer 7
  consumes.
- **The Weil representation** of `SL(2, ℤ)` on `ℂ[A_L]`, and the presentation
  `SL(2, ℤ) ≅ ⟨S, T | S⁴ = 1, (ST)³ = S²⟩`.  Neither is needed for any theorem of this roadmap: the
  vector-valued transformation law (Layer 4) and the `Γ(N)`-modularity of the coset series
  (Layer 7) are proved directly.  A roadmap for the Weil representation would need the Gauss-sum
  signature of a finite quadratic module to state the `S`-matrix, and the explicit local formulas
  of Scheithauer and Strömberg for its values on `Γ₀(N)` and its congruence kernel; it would
  consume Layer 6 here.
- Theta series with spherical coefficients, Siegel and Jacobi theta series, Eisenstein series
  with character, the Siegel–Weil formula, sphere packing, the classification or uniqueness of
  any lattice, and the construction of Niemeier lattices.
- Half-integral weight, as above.

The completed integral-lattices roadmap records the same boundary from its side: its
introduction excludes theta series and modular forms from its scope, and the comparison lemmas it
admits between a positive-definite rational lattice extended to `ℝ` and its algebraic carrier are
exactly the bridge of Layer 2.  The modular-forms roadmap states no theta series, and this
roadmap states no Hecke theory, dimension formula or newform theory of its own; Layers 5, 7 and 8
consume its *Layer 0: diamond operators and modular forms with character (nebentypus)*, its
*Layer 6: Atkin–Lehner and Fricke operators*, and the finite-index Sturm bound of its *Layer 10:
the modular curve `Γ\ℍ` and the dimension formulas*, by the declaration names above; nothing here
consumes a dimension formula.

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
  discriminant group of the real model is the quotient `A_L := L^∨ ⧸ (L ∩ L^∨)`, which is the
  literal `L^∨ ⧸ L` exactly when `L` is integral.  The *type* is defined for every lattice, but
  every statement about it — finiteness, `|A_L| = det L`, `D_L ≠ 0`, the sum
  `Θ_{L^∨} = ∑_γ θ_γ`, the character `e(q_L)` and the Gauss sums indexed by it — carries
  `IsIntegral L` (or `IsEven L`) as a hypothesis, and the finiteness instance is gated on that
  hypothesis.  ⚠ Without integrality the quotient is not finite in general: `L = 2^{1/4} ℤ ⊂ ℝ`
  has `L^∨ = 2^{-1/4} ℤ` and `L ∩ L^∨ = 0` (since `2^{1/2}` is irrational), so `A_L ≅ ℤ`.  For
  integral `L` the determinant is a positive integer, equal to `|det Gram(b)|` for any `ℤ`-basis
  `b`.  Never call the covolume the determinant.
- **Discriminant forms are Tau Ceti's.**  The bilinear form `b_L` on `A_L` valued in
  `AddCircle (1 : ℚ)` is `TauCeti.IntegralLattice.discriminantPairing`, and — for even `L` only —
  the quadratic form `q_L(x + L) = ‖x‖² / 2 mod ℤ` in the **half-norm** convention is
  `discriminantQuadraticMap`; this roadmap transports them across the Layer-2 bridge and adds no
  competing definition.  Values quoted from Nikulin's full-norm `ℚ/2ℤ` convention are halved
  before use, exactly as in the completed integral-lattices roadmap.  Where a
  statement here needs `e(q_L(γ))` or `e(b_L(γ, δ))` as a complex number, it is
  `Complex.exp (2 π i ‖γ‖² / 2)` or `Complex.exp (2 π i ⟪γ, δ⟫)` computed on representatives in
  `E`, proved independent of the representatives; `e(x)` abbreviates `exp(2 π i x)` throughout this
  document.
- **The level.**  `level L` is the least `N : ℕ`, `0 < N`, with `N • q_L = 0`; equivalently the
  least `N` with `N ‖x‖² / 2 ∈ ℤ` for every `x ∈ L^∨`; equivalently the least `N` for which
  `N · Gram(b)⁻¹` is an even integral matrix, for any `ℤ`-basis `b`.  Every statement about it
  carries `IsEven L`.  The definition itself is the unguarded infimum, so it has a value on every
  lattice — `2` on the odd lattice `ℤ`, for instance — and nothing anywhere relies on that value;
  do not document it as `0` or as anything else.  Prove existence (so the `sInf` is not junk for
  even `L`), and prove `level L = 1 ↔ L` is even unimodular.  ⚠ The level is *not* the exponent of the group `A_L`, and it is not `det L`; both
  agree with it in small examples and neither agrees in general.  The level controls the dual
  inclusion `N • L^∨ ≤ L`, and `det L ∣ N^n` follows.
- **Scaling is not an invariance.**  For `0 < c`, the lattice `c • L` has dual `c⁻¹ • L^∨`,
  determinant `c^{2n} det L`, and theta series `Θ_{c • L}(τ) = Θ_L(c² τ)`.  None of the predicates
  integral, even, unimodular is preserved by a general positive scaling: `c • L` is integral if and
  only if `c² ⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, and in positive rank a unimodular lattice scaled by
  `0 < c ≠ 1` is never unimodular.  The scalings that occur here are by `√m` for a positive integer
  `m`, and they are stated as such: `√m • L` is integral when `L` is, even when `L` is even or `m`
  is even, and has `det (√m • L) = m^n det L`.  `√2 • E₈` is even and integral and is not
  unimodular.  A negative scalar gives the same lattice, and that is a lemma, not a convention.
  ⚠ Every strict statement here needs positive rank: the zero lattice in the zero-dimensional
  space is integral, even and self-dual, and every nonzero scaling fixes it.  State those
  theorems with `Nontrivial E`; do not exclude rank zero from anything else, since `Θ_0 = 1`,
  `det 0 = 1` and `level 0 = 1` are useful boundary checks.
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
- **The theta series of the dual.**  For integral `L`, `Θ_{L^∨} = ∑_{γ ∈ A_L} θ_{γ+L}`, a finite
  sum over the discriminant group.  The lattice's own series is the single term `θ_{0+L} = Θ_L`.
  ⚠ Integrality is not decorative: for `L = ½ ℤ`, `L^∨ = 2ℤ ⊂ L`, the quotient
  `L^∨ ⧸ (L ∩ L^∨)` is trivial, and the unguarded identity would read `Θ_{2ℤ} = Θ_{½ℤ}`, which
  is false at `τ = i`.
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
  e(a ‖y‖²/(2c) + ⟪y, m⟫/c)` for `m ∈ L^∨` are well defined because `L` is even *and* `m ∈ L^∨`.
  Every Gauss sum in this roadmap is one of these two.  ⚠ The summands are defined by lifting to
  the quotient, and the well-definedness obligation is false without both hypotheses, so the
  hypotheses are **arguments of the summand**: evenness as a proof argument and `m` as an element
  of the subtype `L^∨`, not of `E`.  For `L = ℤ`, `a = c = 1`, `m = 0`, the representatives `0`
  and `1` of the single class in `L/L` give `e(0) = 1` and `e(1/2) = -1`; for `L = √2 ℤ`,
  `a = c = 1` and `m = 1/(2√2) ∉ L^∨`, the representatives `0` and `√2` give `1` and `-1`.  The
  same applies to `e(q_L(γ))` on `A_L` (even `L` only: on `ℤ` the representatives `0`, `1` of the
  single class give `1`, `-1`) and to the dual-side summand `e(-c ‖y‖²/(2a))` on `L^∨ ⧸ aL`.  The
  pairing character `e(b_L(γ, δ))` alone needs no hypothesis, since `L` pairs integrally with
  `L^∨`.
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
  `FactorsThrough`, `factorsThrough_iff_ker_unitsMap`, `conductor`,
  `mem_conductorSet_iff_conductor_dvd`, `conductor_changeLevel`, `primitiveCharacter`,
  `conductor_dvd_level`, with `ZMod.unitsMap` from `Mathlib/Data/ZMod/Units.lean`.  The
  nebentypus and the conductor theorem are assembled from these in Layer 6.
- `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`, `.../Complex.lean`, `.../Real.lean` — quadratic
  forms and their diagonalisation over a field of characteristic `≠ 2`, used for the residue-field
  step of Layer 6.

Mathlib has no theta series of a lattice, no Poisson summation above dimension one, no Kronecker
symbol, no Gauss sums of a quadratic form modulo a composite integer, and no statement that any
theta series is a modular form.

### Tau Ceti and neighbouring roadmaps

- Tau Ceti's integral-lattice library, `TauCeti/LinearAlgebra/IntegralLattice/` and
  `TauCeti/LinearAlgebra/FiniteBilinearModule/`, realizes the
  [completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md): the rational
  carrier `TauCeti.IntegralLattice` (`Basic`, `Even`, `Unimodular`, `Signature`, `Gram`, `Norm`,
  `Isometry`, `OrthogonalSum`, `Scaling`), the dual lattice and discriminant group (`Dual/*`,
  `Discriminant/Group`), the discriminant bilinear and quadratic forms (`Discriminant/Bilinear`,
  `Discriminant/Quadratic`), finite bilinear and quadratic modules with their `CharacterModule`
  adjoints, orthogonal quotients and primary decomposition (`FiniteBilinearModule/*`), the
  overlattice/isotropic-subgroup correspondence with its index and discriminant formulas
  (`Overlattice/*`), the rationalization of an abstract integral form (`Rationalization`), and
  the rank-one, ADE and `D₈⁺ ≅ E₈` calculations (`RankOne`, `RootLattice/*`).  Layers 2, 4 and 8
  here depend on it, and its `vectorsOfNorm` and `discriminant` are the rational-model faces of
  the shells of 2G and the covolume identity of 2C.  The completed roadmap admits comparison
  lemmas with Mathlib's `IsZLattice` theory only where they transport a genuinely useful theorem
  between a positive-definite rational lattice extended to `ℝ` and its algebraic carrier; Layer 2
  below is that comparison, and the theorems it transports are the two modularity theorems.
- The [modular-forms roadmap](../ModularForms/README.md) owns `modFormCharSpace`, the nebentypus
  decomposition, the Eisenstein series with character, the valence formula, the level-one graded
  ring, the Fricke operators, the Sturm bound and the general-level dimension formulas.  Of these,
  the diamond operators and character spaces of its *Layer 0* (`modFormCharSpace`,
  `mem_modFormCharSpace_iff_nebentypus`, `isInternal_modFormCharSpace`, the parity lemma
  `char_neg_one_of_mem_modFormCharSpace`), the level-one graded ring (`valence_formula`,
  `mvPolynomialEquivModularForms`), the Fricke matrix and raw slash of its *Layer 6* (`frickeGL`,
  `frickeOperator`, `frickeScalar`) and the finite-index Sturm bound of its *Layer 10*
  (`ModularForm.sturm_bound_finiteIndex`, `eq_of_sturm_bound`,
  `finiteDimensional_modularForm_finiteIndex`, with `Gamma0_prime_index` for the indices) have
  **landed** in Tau Ceti, and Layers 5–8 here consume them.  One target of that roadmap that has
  not landed is consumed, by the two general-level identifications at the very end of Layer 8 and
  by nothing else: the *Layer 0* Eisenstein series with character.  7F states the Fricke
  identities against the landed `frickeGL` in both the raw and the normalized form, the latter
  as the explicit scalar multiple `(√N)^{2-k} • (· ∣[k] W_N)` that its *Layer 6* names `𝒲_N`.
  Nothing here consumes its dimension formulas, and every headline theorem here is independent
  of the unlanded target.
- Tau Ceti's root lattices `typeARootLattice`, `checkerboardLattice` and `typeE₈RootLattice`, read
  through the bridge, supply the ADE lattices used in the worked examples and in Layer 8; do not
  re-enter Cartan matrices here.

## What is missing (build here)

Poisson summation for a full-rank `ℤ`-lattice in a finite-dimensional real inner product space, in
four steps; the real-model lattice vocabulary and its bridge to the rational model; the level of an
even lattice; the Kronecker symbol; the theta series of a lattice and of each coset of it in its
dual, with convergence, holomorphy, `q`- and `q_N`-expansions and their support; the `T`- and
`S`-transformation laws, scalar and vector-valued; the theorem that an even unimodular lattice has
rank divisible by `8`; the theorem that its theta series is a level-one modular form of weight
`n/2`; the reciprocity law for Gauss sums of an even lattice, their evaluation, Milgram's formula
for a positive-definite lattice, and the theorem that the conductor of `(D_L / ·)` divides the
level; the Hecke–Schoeneberg theorem `Θ_L ∈ M_k(Γ₀(N), χ_L)` and `θ_γ ∈ M_k(Γ(N))`; the
identification of `Θ_{E₈}` and `Θ_{Leech}` in the level-one graded ring, with the
representation-number formulas that follow; and the rank-`16` pair `E₈ ⊕ E₈` and `D₁₆⁺`, summed
and glued here from Tau Ceti's root lattices, with their non-isometry.

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
  character is `e(+⟪v, m⟫)`.  Reindexing the dual sum by `m ↦ -m` reflects the transform as well
  as the character: it gives `∑_m 𝓕f(-m) e(-⟪v, m⟫)`, which is the minus-phase sum
  `∑_m 𝓕f(m) e(-⟪v, m⟫)` of sources with the opposite convention only when `𝓕f(-m) = 𝓕f(m)`,
  i.e. for even `f`; for a general Schwartz `f` that minus-phase sum is `covolume L` times the
  lattice sum at `-v`, not at `v`.  State the `+` version as the theorem and record two
  corollaries, so no downstream proof guesses:
  ```text
  ∑' ℓ : L, f (v + ℓ) = (ZLattice.covolume L)⁻¹ * ∑' m : L^∨, 𝓕 f (-m) * e(-⟪v, m⟫)
  ∑' ℓ : L, f (v + ℓ) = (ZLattice.covolume L)⁻¹ * ∑' m : L^∨, 𝓕 f m * e(-⟪v, m⟫)
  ```
  the first, the reflected form, for every `f`, and the second, the minus-phase form, under the
  explicit hypothesis `∀ x, f (-x) = f x`.  The Gaussian of 1F is even, so on the uses of 4A–4C
  all three agree; the distinction matters only for a general `f`.
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
  and `L` is integral; `det (√m • L) = m^n det L`.  Prove that in positive rank (`Nontrivial E`),
  for integral `L` and `m > 1`, the lattice `√m • L` is never unimodular (its determinant is
  `m^n det L ≥ m^n > 1`), so that in particular `√2 • E₈` is even and integral and not unimodular;
  and prove that in positive rank, for unimodular `L` and `0 < c ≠ 1`, `c • L` is not unimodular
  (`det = c^{2n} ≠ 1`).  ⚠ Both need `Nontrivial E`: in the zero-dimensional space the zero
  lattice is even, unimodular, and fixed by every scaling, with `det = m^0 · 1 = 1`.  ⚠ Do not
  state or use "invariance under scaling" for any of the three
  predicates; there is none.  Scaling *down* can create unimodularity (`(1/√2) • (√2 • ℤ) = ℤ`),
  which is one more reason the predicates are not scaling invariants.
- **2C. Covolume, determinant, index.**  Prove `ZLattice.covolume L^∨ = (ZLattice.covolume L)⁻¹`;
  that `det L = (covolume L)^2` is a positive integer for integral `L`; that for integral `L` the
  quotient `A_L = L^∨ ⧸ L` is finite of order `det L = [L^∨ : L]` (⚠ both need integrality; see
  the conventions); and that `det L = |det Gram(b)|` for any `ℤ`-basis, by consuming
  `covolume_eq_det` rather than reproving a determinant/index formula.  Deduce the two forms of
  unimodularity: for integral `L`, `L = L^∨ ↔ covolume L = 1 ↔ det L = 1 ↔ A_L` is trivial.
  ⚠ This equivalence is what lets a consumer holding the sphere-packing predicate
  `ZLattice.covolume L volume = 1` reach `L = L^∨`; state it in that direction explicitly.
- **2D. The bridge to the rational model.**  For an integral `L ⊆ E`, the integer-valued form
  `⟪·,·⟫ : L → L → ℤ` is a symmetric `LinearMap.BilinForm ℤ L`, and Tau Ceti's `ofIntegralForm`
  rationalizes it to a `TauCeti.IntegralLattice (ℚ ⊗[ℤ] L)` whose carrier is the image of `L`.
  Take that as `ratModel L`; prove it `IsNondegenerate` and `IsPosDef`, and `IsEven` and
  `IsUnimodular` exactly when `L` is; and prove that its `dualCarrier`, `DiscriminantGroup`,
  `discriminantPairing` and — when `L` is even — `discriminantQuadraticMap` correspond, under the
  evident map `ℚ ⊗[ℤ] L → E`, to `L^∨`, `L^∨ ⧸ L`, `⟪·,·⟫ mod ℤ` and `‖·‖²/2 mod ℤ` computed in
  `E`; in particular an additive equivalence `A_L ≃+ (ratModel L).DiscriminantGroup` carrying the
  pairing and, for even `L`, the quadratic form.  Prove the converse construction `realModel M` for
  an `IsPosDef` rational lattice `M` (extend scalars to `ℝ`, take the inner product induced by the
  form), that the two constructions are mutually inverse up to isometry, and that a real linear
  isometry carrying `realModel M` onto `realModel M'` induces a Tau Ceti `Isometry M M'` — so that
  non-isometry proved on the rational side transfers to the real model (8E).  Prove the invariants
  agree: rank; `discriminant` and `determinant` with `det` (a positive-definite Gram determinant
  is positive); evenness; unimodularity; shells with `vectorsOfNorm` (2G); and the level with the
  order of `discriminantQuadraticMap`.
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
  and the finiteness is the content.  For integral `L` the shells are Tau Ceti's `vectorsOfNorm`
  of `ratModel L` read in `E` rather than a second notion, and the bridge of 2D identifies them
  (`ncard_vectorsOfNorm_ratModel`); that they are the `q`-expansion coefficients of `Θ_L` is 3C's
  theorem and is stated only here.
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

Acceptance at this layer includes: the bridge applied to `⟨2m⟩` and to `A_n`, reproducing Tau
Ceti's rank-one and ADE discriminant values (`discriminantQuadraticMap_rankOneClass`,
`discriminantQuadraticMap_typeAFundamentalWeightClass`) from the real model;
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
  induced map `A_L → (ℍ → ℂ)` (this descent needs no hypothesis, since it quotients by elements
  of `L`), prove `θ_{0+L} = Θ_L`, `θ_{-γ} = θ_γ`, and, **for integral `L`**,
  `Θ_{L^∨} = ∑_{γ ∈ A_L} θ_{γ+L}` (a finite sum; `A_L` is finite by 2C under that hypothesis, and
  the identity is false without it — see the conventions).  ⚠ Record `θ_{-γ} = θ_γ`
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
  `Θ_L(τ + 2) = Θ_L(τ)`.  Iterating `N = level L` times gives
  `θ_γ(τ + N) = e(N q_L(γ)) θ_γ(τ) = θ_γ(τ)`, since `N ‖γ‖²/2 ∈ ℤ` for `γ ∈ L^∨` is the definition
  of the level: every coset series is invariant under `T^N`, which is the translation invariance
  inside `Γ(N)` that 7E uses.  ⚠ Evenness is exactly what the period-`1` statement needs and
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
  `γ = 0` summed over `A_L`; the `S`-law applied twice, with `covolume L^∨ = (covolume L)⁻¹` and
  `(L^∨)^∨ = L`, gives `Θ_L ∣[k] S² = (-i)^{2k} Θ_L = (-1)^k Θ_L`, which is exactly the action
  of `S² = -I` in weight `k` (`denom (-I) τ = -1`), so the two computations agree — ⚠ the scalar
  is `(-1)^k`, not `1`: `-I` acts trivially only in even weight, and the rank-two lattice `ℤ²`
  below has weight `1`, where it acts by `-1`; and the rank-**two** case `L = ℤ²` gives
  `Θ_{ℤ²}(-1/τ) = (τ/i) * Θ_{ℤ²}(τ)`, which by 3D and 3E is the square of `jacobiTheta_S_smul`.
  ⚠ This is the in-scope form of the comparison with Mathlib's `S`-law: the rank-one law itself
  carries `(-iτ)^{1/2}` and is not a target.

## Layer 5: level one — even unimodular lattices

- **5A. The rank is divisible by `8`.**  For `L` even unimodular of rank `n`, `8 ∣ n`.  Route of
  record, elementary and self-contained at this layer: replacing `L` by `L ⊕ L` or `L^{⊕4}`
  (again even unimodular, by 2A) reduces to `n ≡ 4 (mod 8)`, where 4B gives
  `Θ ∣[k] S = (-i)^k Θ = -Θ` and 4A gives `Θ ∣[k] T = Θ`, so `Θ ∣[k] (ST)^3 = -Θ`; but
  `(ST)^3 = S^2 = -I` acts by `(-1)^k = 1`, `k = n/2` being even there, whence `Θ = 0`,
  contradicting `Θ(i) > 0`
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
  as in the conventions, on the finite quotient `L ⧸ c • L` (`Nat.card = c^n`), with the evenness
  of `L` and the membership `m ∈ L^∨` as arguments of the summand, so that its descent to the
  quotient is a theorem with true hypotheses.  Prove:
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
  well defined because `L` is even.  Route of record: compute the limit
  ```text
  lim_{t → 0⁺} t^k * Θ_L(a/c + i t) = G_L(a, c) / (c^{2k} * covolume L)
  ```
  in two ways.  ⚠ The statement is **additive** — a leading term plus `o(t^{-k})`, equivalently
  the limit above — and not `G_L(a, c) * (...) * (1 + o(1))`: the Gauss sum can vanish while the
  theta series does not.  For `L = √2 • ℤ²`, `a = 1`, `c = 2`, `G_L(1, 2) = (1 - 1)² = 0`, yet
  `Θ_L(1/2 + it) = (∑_r (-1)^r e^{-2π t r²})² > 0`, positive by one-dimensional Poisson
  summation (`∑_r (-1)^r e^{-2πtr²} = (2t)^{-1/2} ∑_s e^{-π(s - 1/2)²/(2t)}`).  Record that
  example as a test of the statement's shape.
  - *The intermediate target.*  For any full-rank `L` of even rank and any `v : E`,
    `ε^k * θ_v(ε) → i^k * (covolume L)⁻¹` as `ε → 0` in `ℍ` along any path with
    `Im(-1/ε) = Im ε / |ε|² → ∞`.  This is 4C read at `τ = -1/ε`:
    `θ_v(ε) = (covolume L)⁻¹ (-i)^k (-1/ε)^k ∑_{m ∈ L^∨} e(⟪v, m⟫) exp(π i ‖m‖² (-1/ε))`, and
    the sum tends to its `m = 0` term because `Im(-1/ε) → ∞`.  ⚠ The real part of `ε` varies
    along the paths used below, so this is stated for complex `ε`, not for `ε = it`.
  - *The direct side.*  Split `L` into its classes `y + c • L`.  Since `L` is even,
    `exp(π i ‖y + cℓ‖² a/c) = e(a ‖y‖²/(2c))` for `ℓ ∈ L`, so
    `Θ_L(a/c + it) = ∑_{y ∈ L/cL} e(a ‖y‖²/(2c)) θ^{(cL)}_y(it)`, where `θ^{(cL)}_y` is the coset
    series of the lattice `c • L`; the intermediate target at `ε = it` gives
    `t^k θ^{(cL)}_y(it) → (covolume (c • L))⁻¹ = c^{-2k} (covolume L)⁻¹`, whence the limit
    displayed above.
  - *The other side.*  Put `z = a/c + it` and apply the scalar `S`-law 4B in the form
    `Θ_L(z) = (covolume L)⁻¹ (-i)^k (-1/z)^k Θ_{L^∨}(-1/z)`.  As `t → 0⁺`,
    `-1/z = (-ca + i c² t)/(a² + c² t²) → -c/a`; write `-1/z = -c/a + ε` with
    `ε = c³t²/(a(a² + c²t²)) + i c²t/(a² + c²t²)`, so `ε → 0` with `Im(-1/ε) ~ a²/(c² t) → ∞`.
    Split `L^∨` into its classes `y + a • L`: since `L` is even and `⟪y, ℓ⟫ ∈ ℤ`,
    `exp(π i ‖y + aℓ‖² (-c/a)) = e(-c ‖y‖²/(2a))`, so
    `Θ_{L^∨}(-c/a + ε) = ∑_{y ∈ L^∨/aL} e(-c ‖y‖²/(2a)) θ^{(aL)}_y(ε)`, and the intermediate
    target along this path gives `ε^k θ^{(aL)}_y(ε) → i^k a^{-2k} (covolume L)⁻¹`.  Multiplying
    by `t^k` and passing to the limit, with `(-1/z)^k → (-c/a)^k` and `t^k ε^{-k} → (a²/(i c²))^k`,
    yields the displayed reciprocity after `(covolume L)⁻¹ = (det L)^{-1/2}` and `i^k = e(n/8)`.
  ⚠ 4B is the `S`-law and nothing else; there is no "matrix carrying `∞` to `a/c`" available
  before Layer 7, and none is needed.  This is the same asymptotic argument that proves Milgram's
  formula, and it is the *only* analytic input to Layers 6 and 7; every other step is finite.
  The rank-two case `L = √2 • ℤ²` is the **square of the Landsberg–Schaar identity**
  `∑_{y mod c} e(a y²/c) = √(c/(2a)) e(1/8) ∑_{y mod 2a} e(-c y²/(4a))`, and is a mandatory
  test.  The rank-one identity itself is the odd-rank case, whose proof passes through the
  half-integral-weight `S`-law with a branch of `√τ` (see *Rank*), and it is not a target here.
- **6C. Milgram's formula.**  The case `a = c = 1` of 6B, which reads
  `1 = (det L)^{-1/2} e(n/8) ∑_{γ ∈ A_L} e(-q_L(γ))`, followed by **complex conjugation** of both
  sides (⚠ not the substitution `y ↦ -y`, which changes nothing since `q_L(-y) = q_L(y)`):
  ```text
  ∑_{γ ∈ A_L} e(q_L(γ)) = |A_L|^{1/2} * e(n/8)
  ```
  for `L` even and positive definite of even rank `n = 2k`, the generality of 6B.  Deduce `8 ∣ n`
  for even unimodular `L`, reproving 5A: for even `n` directly (`|A_L| = 1` forces `e(n/8) = 1`),
  and for odd `n` by applying the formula to `L ⊕ L`, even unimodular of rank `2n`, which gives
  `4 ∣ n` and contradicts oddness.  Deduce also that **`k` is even whenever `level L ∣ 2`**: then
  `2 q_L = 0`, every `e(q_L(γ))` is `±1` and the left side is an integer, while the right side
  `|A_L|^{1/2} i^k` is real only for even `k`.  This is what lets `-I`, which lies in `Γ(N)`
  exactly when `N ∣ 2`, act trivially on the coset series in 7E (`D₄`: level `2`, weight `2`).
  ⚠ This is Milgram's formula at positive-definite signature
  only, and the theta-asymptotic proof is the point: it is the analytic route Layer 7 needs.  The
  general theorem — the Gauss-sum signature `sign q ∈ ℤ/8` of a finite quadratic module and
  `sign q_L ≡ n₊ - n₋ (mod 8)` for an even lattice of any signature, by finite arithmetic — is not
  a target here; nothing in this roadmap needs the indefinite case.
- **6D. Evaluation at an odd modulus.**  For `a` odd and **coprime to `c`**, and `N ∣ c` (so `a`
  is coprime to `N` as well), the sum on the right of 6B collapses:
  ```text
  ∑_{y ∈ L^∨ / a L} e(-c ‖y‖² / (2a)) = det L * (D_L / a) * a^k
  ```
  with `(D_L / a)` the Jacobi symbol.  ⚠ Coprimality of `a` with `N` alone is **not** enough:
  for `L = √2 • ℤ²` (`n = 2`, `k = 1`, `N = 4`, `det L = 4`, `D_L = -4`) with `a = 3` and
  `c = 12`, every summand is `e(-(u² + v²)) = 1` on the `36` classes `y = (u, v)/√2`,
  `u, v mod 6`, so the left side is `36`, while `4 · (-4/3) · 3 = -12`; the hypothesis that fails
  is `gcd(a, c) = 1`, and it is what makes `c/N` a unit modulo `a` in step (ii).  Record this as
  a test.  Route: (i) the summand is invariant under `y ↦ y + a w` for
  `w ∈ L^∨` (this uses `N ∣ c` and `N • L^∨ ≤ L`), so the sum is `det L` times the sum over
  `L^∨ ⧸ a • L^∨`; (ii) on `L^∨ ⧸ a • L^∨ ≅ (ℤ/a)^n` the summand is `e(Q(y)/a)` for the integral
  quadratic form `Q = -(c/N) · (N ‖·‖²/2)` on `L^∨`, whose Gram determinant `(-c/N)^n N^n / det L`
  is a unit modulo `a` because `c/N` is (from `gcd(a, c) = 1`) and `N^n / det L` is (an integer
  dividing `N^n`, with `gcd(a, N) = 1`) — the form is **unimodular modulo `a`**; (iii) Gauss sums
  of a quadratic form
  are multiplicative over the prime factorisation of `a` (Chinese remainder theorem, with the
  cofactor units absorbed into the form); (iv) for `p` odd and `Q` unimodular modulo `p^e`, the sum
  over `(ℤ/p^e)^n` reduces to `p^n` times the sum over `(ℤ/p^{e-2})^n` when `e ≥ 2`, so only
  `e ∈ {0, 1}` remains; (v) over `ZMod p` diagonalise `Q` (Mathlib's diagonalisation of quadratic
  forms over a field of characteristic `≠ 2`) as `∑ u_i x_i²` and use `∑_x e(u x²/p) = (u/p) · g_p`
  with `g_p² = (-1/p) · p` (Mathlib's `gaussSum_sq`); the `n = 2k` rank-one factors pair up into
  `((-1)^k det Q / p) · p^k`, where `det Q = ∏ u_i` is, up to a square, the determinant of the
  coefficient matrix `B_Q / 2` of `Q`, with `B_Q` the Gram matrix of the bilinear form
  `(y, y') ↦ -c ⟪y, y'⟫` on `L^∨`; no sign of `g_p` is ever needed, and the `(-1)^k` enters here,
  from `g_p²`, and nowhere else; (vi) reassemble through Jacobi symbol multiplicativity, using
  that `(u²/a) = 1` for units and that `((-1)^k det Q / a) = ((-1)^k det L / a) = (D_L / a)`
  because **`det Q` and `det L` differ by a square** modulo `a`: in the dual basis `B_Q = -c · B⁻¹`
  for `B` the Gram matrix of `L`, so `det B_Q = (-c)^{2k} / det L = c^{2k} / det L` and
  `det B_Q / det L = (c^k / det L)²`, the division being legitimate modulo `a` since every prime
  of `det L` divides `N` and `gcd(a, N) = 1`, and the factor `2^{-2k}` between `det (B_Q / 2)` and
  `det B_Q` is itself a square modulo the odd `a`.  ⚠ There is no `(-1)^k` in this comparison:
  for `L = √2 • ℤ²`, `a = 3`, `c = 4`, `B = 2I` and `B_Q = -2I` both have determinant `4`, whose
  ratio `1` is a square modulo `3` while `-1` is not.  ⚠ Step (iv) is where a non-unimodular form
  would need Jordan theory; the form here
  is unimodular modulo `a` *because* `a` is coprime to the level, and that is the whole reason the
  route restricts to `a` coprime to `N` and moves the modulus from `c` to `a`.
- **6E. The closed form.**  Combining 6B and 6D: for `a` odd and positive, coprime to `c`, and
  `N ∣ c`,
  ```text
  G_L(a, c) = c^k * (det L)^{1/2} * e(n/8) * (D_L / a) .
  ```
- **6F. The conductor theorem and the nebentypus.**  From 6E with `c = N`: `G_L(a, N)` depends on
  `a` only modulo `2N`, and by 6A it is independent of `a` for `a ≡ 1 (mod N)` (`a = 1 + Nt` gives
  `e(t ‖y‖²/2) = 1`); hence `(D_L / a) = 1` for every odd positive `a ≡ 1 (mod N)` coprime to
  `N`.  The descent to the level is a statement about **unit groups**, and it does not assume
  `N ∣ |D_L|` (Layer 2 gives `N ∣ 2 det L`, not that): put `M = lcm(|D_L|, N)`, pull the
  Kronecker character up to `χ' = changeLevel (|D_L| ∣ M) (kroneckerChar D_L)`, and prove `χ'`
  trivial on the kernel of the unit reduction `ZMod.unitsMap : (ZMod M)ˣ → (ZMod N)ˣ`.  Two
  elementary lemmas do this: every unit class modulo `M` has an **odd positive representative**
  (a unit modulo an even `M` is odd; for odd `M`, one of `a`, `a + M` is odd), and a unit
  `≡ 1 (mod N)` therefore has an odd positive representative `a ≡ 1 (mod N)` coprime to `M`, on
  which `χ'(a) = (D_L / a) = 1`.  Mathlib's `factorsThrough_iff_ker_unitsMap` then gives
  `χ'.FactorsThrough N`, `mem_conductorSet_iff_conductor_dvd` gives `conductor χ' ∣ N`, and
  `conductor_changeLevel` identifies `conductor χ'` with `conductor (kroneckerChar D_L)`: the
  **conductor divides `N`**.  ⚠ A map `ZMod |D_L| → ZMod N` exists only when `N ∣ |D_L|`, which
  is not available, and the kernel that matters is the multiplicative one; do not argue on the
  additive ring kernel.  Define
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

- **7A. Reduction to `c > 0` and `a` odd and positive.**  For `A = !![a, b; c, d] ∈ Γ₀(N)`: if
  `c = 0` then `a = d = ε ∈ {±1}` and `A = εI · T^{εb}`, a signed power of `T` (⚠ not `±T^b`: for
  `ε = -1` the exponent is `-b`), and the statement is 4A for `T^{εb}` together with
  `Θ_L ∣[k] (εI) = ε^k Θ_L = χ_L(ε) Θ_L = χ_L(d) Θ_L`, using `χ_L(-1) = (-1)^k` from 6F.
  Otherwise replace `A` by `-A` to make `c > 0` (using `χ_L(-d) = (-1)^k χ_L(d)`), and then by
  `T^j A = !![a + jc, b + jd; c, d]`, which has the same `c` and `d`, lies in `Γ₀(N)`, and
  satisfies `Θ_L ∣[k] (T^j A) = Θ_L ∣[k] A` by 4A: choose `j ≥ 0` large enough that `a + jc > 0`
  and of the parity that makes `a + jc` odd — if `c` is odd, `j ≡ a + 1 (mod 2)`; if `c` is even,
  `a` is odd already because `ad - bc = 1`, and every `j` serves.  ⚠ 6E needs `a` odd **and
  positive**, with `gcd(a, c) = 1` supplied by `ad - bc = 1`; oddness alone is not enough, and the
  same `T^j` that fixes the parity fixes the sign.
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
- **7E. The coset series on `Γ(N)`.**  The reductions of 7A do not transfer: `-I ∉ Γ(N)` for
  `N > 2`, an unrestricted `T^j` leaves `Γ(N)` and moves the coset series, and `a ≡ 1 (mod N)`
  gives neither oddness nor positivity (`!![-2, -3; 3, 4] ∈ Γ(3)` has `a = -2`).  Reduce inside
  `Γ(N)` instead, for `A = !![a, b; c, d] ∈ Γ(N)`.  If `c < 0`, replace `A` by
  `A⁻¹ = !![d, -b; -c, a] ∈ Γ(N)`, whose lower-left entry `-c` is positive: invariance under
  `A⁻¹` gives invariance under `A` by the right-action law, `θ ∣[k] A = (θ ∣[k] A⁻¹) ∣[k] A`.  If
  `c > 0`, left-multiply by `T^{jN} ∈ Γ(N)`, which fixes every `θ_γ` by the period-`N` law of 4A
  and replaces `a` by `a + jNc`; choose `j` so that this is positive and odd — by the parity of
  `j` if `Nc` is odd, and automatically if `Nc` is even, since then `c` is even (`N` even and
  `N ∣ c` force `c` even) and so `a` is odd.  On the example,
  `T³ · !![-2, -3; 3, 4] = !![7, 9; 3, 4]`, in `Γ(3)` with `a = 7`.  If `c = 0`, then
  `A = εI · T^{εb}` with `N ∣ b`: `T^{εb}` fixes `θ_γ` by the period-`N` law, and `εI` acts by
  `ε^k`; `ε = -1` requires `-1 ≡ 1 (mod N)`, i.e. `N ∣ 2`, and for an even lattice of level
  dividing `2` the weight `k` is even (6C), so `ε^k = 1`.  ⚠ That corollary of Milgram's formula is
  load-bearing: `-I` acts on weight `k` by `(-1)^k`, so for `N ∣ 2` the claim
  `θ_γ ∣[k] (-I) = θ_γ` *is* the evenness of `k`, and nothing in the splitting below supplies it.
  With `c > 0` and `a` odd and positive, apply the splitting of 7B to `θ_{γ+L}` for `γ ∈ L^∨`,
  splitting the coset `γ + L` modulo `c • L`.  The twisted sums are now over `(γ + L) ⧸ c • L`, and
  the shift `y ↦ y + c w`, `w ∈ L^∨`, multiplies them by `e(a b_L(γ, w) + b_L(w, m))`, so they
  vanish unless `m ≡ -a γ` in `A_L`.  For `A ∈ Γ(N)`, `a ≡ 1 (mod N)` and `N γ ∈ L` give
  `m ≡ -γ`, so `θ_γ ∣[k] A` is a scalar multiple of `θ_{-γ} = θ_γ`; complete the square as in 6A
  and evaluate by 6E — applicable now that `a` is odd and positive, coprime to `c`, with `N ∣ c` —
  to find the scalar equal to `1`.  Hence `θ_γ ∣[k] A = θ_γ` for every `A ∈ Γ(N)`, and with
  boundedness at every cusp (the same argument as 7D) each `θ_γ` is a
  `ModularForm ((Gamma N).map (mapGL ℝ)) k`.  ⚠ This is the statement that the alternative route
  through the Weil representation would deliver as its congruence-kernel theorem; here it is the
  coset version of 7C and costs one more application of the same computation.
- **7F. Consequences to state here.**  The **Fricke operator** exchanges `Θ_L` and
  `Θ_{√N • L^∨}`, by 4B at `Nτ` and 3D, and the constant depends on the normalization, which is
  pinned here once.  With `W_N = !![0, -1; N, 0]` — Tau Ceti's `frickeGL ℝ N`, acting through
  Mathlib's slash, whose `ModularForm.slash_apply` carries the factor `|det A|^{k-1}` — the
  **raw slash** is
  ```text
  Θ_L ∣[k] W_N = (-i)^k * N^{k-1} * (det L)^{-1/2} * Θ_{√N • L^∨} ,
  ```
  and the **normalized operator** `𝒲_N = (√N)^{2-k} • (· ∣[k] W_N)` of the modular-forms
  roadmap's *Layer 6* (built on Tau Ceti's landed `frickeOperator`, whose square is
  `frickeScalar N k = (-1)^k N^{k-2}`) gives
  ```text
  𝒲_N Θ_L = (-i)^k * N^{k/2} * (det L)^{-1/2} * Θ_{√N • L^∨} .
  ```
  State both, the first against `frickeGL` directly and the second as the explicit scalar
  multiple `(√N)^{2-k} • (Θ_L ∣[k] W_N)`, which is what `𝒲_N` evaluates to; do not define a third
  normalization.  ⚠ `𝒲_N² = (-1)^k`, so "involution" is an even-weight statement, and even rank
  does not make the weight even: `A₂` has `k = 1`.  Also: the constant term of `Θ_L` at the cusp
  `∞` is `1`, so `Θ_L` is never a cusp form; and `Θ_L` is an eigenvector of every diamond operator
  `⟨d⟩` with eigenvalue `χ_L(d)`, which is the content of membership in `modFormCharSpace`.

## Layer 8: identification of the classical theta series

- **8A. Even unimodular rank 8 and 16.**  `dim M_4(SL(2,ℤ)) = 1` (Mathlib's level-one dimension
  formula), and the level-one Sturm bound at weight `4` is `⌊4/12⌋ = 0`, so a weight-`4` form is
  determined by its constant term alone.  Hence for **every** even unimodular `L` of rank `8`,
  `Θ_L = E₄`, and for every one of rank `16`, `Θ_L = E₄²`.  ⚠ No representation number is an
  input to either identity; both follow from `r_L(0) = 1`.
- **8B. `E₈`.**  `Θ_{E₈} = E₄`, and therefore `r_{E₈}(2m) = 240 * σ₃(m)` for `m ≥ 1`, from the
  `q`-expansion of `E₄` with `bernoulli 4 = -1/30`.  In particular the kissing number
  `r_{E₈}(2) = 240` is a **corollary**, not a hypothesis.  The lattice is the real model (2D) of
  Tau Ceti's `typeE₈RootLattice`, whose `isPosDef_typeE₈RootLattice`, `isEven_typeE₈RootLattice`
  and `isUnimodular_typeE₈RootLattice` are exactly the hypotheses of 8A after the bridge.  The
  sphere-packing project's `E8Lattice : Submodule ℤ (EuclideanSpace ℝ (Fin 8))` is a second model
  of the same lattice (see *Provenance*); 2C's `covolume = 1 ↔ L = L^∨` and
  `ZLattice.covolume_eq_det` connect its `E8Matrix_unimodular` to this roadmap's hypotheses, so
  that its facts can be consumed as well.
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
  have theta series `E₄²` by 8A; they are **not** isometric, so the theta series does not
  determine the lattice.  No other roadmap constructs `D₁₆⁺`, so both lattices and their
  non-isometry are built here, on the rational side from Tau Ceti's root lattices and gluing
  correspondence, and reach the real model through the converse direction of the bridge 2D.
  - **`E₈ ⊕ E₈`** is `orthogonalSum typeE₈RootLattice typeE₈RootLattice`: even, unimodular and
    positive definite by `isEven_orthogonalSum_iff`, `discriminant_orthogonalSum` and the
    signature of an orthogonal sum.
  - **`D₁₆⁺`** is glued exactly as Tau Ceti glues `d8PlusLattice` from `checkerboardLattice 8`.
    In `A_{D₁₆} ≅ (ℤ/2)²` the spinor class `s = checkerboardSpinorClass 16` has `q(s) = 16/8 ≡ 0`
    (`discriminantQuadraticMap_checkerboardSpinorClass`), so `AddSubgroup.zmultiples s` is
    quadratic-isotropic of order `2` in a group of order `4`, hence Lagrangian.  Its preimage
    `intermediateCarrierOfDiscriminantSubgroup` is even by
    `isEven_iff_isIsotropic_discriminantSubgroup` and has carrier `D₁₆ ∪ (s + D₁₆)`; its
    `toIntegralLattice` is unimodular by `IsIntegral.isUnimodular_iff_natCard_sq_eq_discriminant`
    (`2² = 4 = disc D₁₆`) and positive definite because gluing keeps the ambient dot product.
  - **Non-isometry, route of record: the index of the root sublattice.**  For an integral lattice
    `M` let `R(M) = span ℤ (vectorsOfNorm M 2)`, the sublattice generated by its norm-`2` vectors.
    An isometry `M ≅ M'` carries `vectorsOfNorm M 2` onto `vectorsOfNorm M' 2`, hence `R(M)` onto
    `R(M')`, so the index `[M : R(M)]` is an isometry invariant; state this for arbitrary integral
    lattices and an arbitrary `Isometry`, then compute.  In `E₈ ⊕ E₈` the norm-`2` vectors are the
    roots of the two summands (a vector of an even positive-definite sum with both components
    nonzero has norm `≥ 4`), and `typeE₈RootLattice` is spanned by its simple roots, of norm `2`,
    so the index is `1`.  In `D₁₆⁺` every vector of `s + D₁₆` has all coordinates in `½ + ℤ` and
    hence norm `≥ 16/4 = 4`, so the norm-`2` vectors are exactly the `480` roots `±eᵢ ± eⱼ` of
    `D₁₆`, which span `D₁₆`; thus `R(D₁₆⁺) = D₁₆` and the index is `2`.  Hence no `Isometry`
    exists, and by the transfer statement of 2D no real linear isometry of ambient spaces carries
    the real model of one lattice onto that of the other.
  ⚠ Keep the two halves apart.  Equality of theta series is 8A's and says nothing about
  isometry; the non-isometry is the index computation and nothing else.  A count of norm-`2`
  vectors separates nothing — both lattices have `480` — and no root-system classification is to
  be imported for this: `R(M)` and its index are elementary and are stated for any integral
  lattice.  This is the one place the roadmap constructs a lattice, and it is sequenced last.

## Worked examples (acceptance criteria)

Each is a formal acceptance test: the general theorem, instantiated, with every hypothesis
discharged from the lattice's own construction.  Entering a `q`-expansion by hand discharges
nothing.

- `thetaSeries ℤ = jacobiTheta` and `Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)` (Layers 3 and 4) — the
  convention checks — together with `Θ_{ℤ²} ∣[1] S² = -Θ_{ℤ²}`, the action of `-I` in weight `1`.
- The square of the Landsberg–Schaar identity as the case `L = √2 • ℤ²` of 6B, and
  `∑_{γ ∈ ℤ/3} e(γ²/3) = i√3` as Milgram's formula for `A₂` (`n = 2`, `|A_L| = 3`).
- `Θ_{E₈} = E₄`; `r_{E₈}(2) = 240`; `r_{E₈}(2m) = 240 σ₃(m)`.
- `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ`; `r_Λ(4) = 196560`;
  `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`.
- `Θ_{E₈ ⊕ E₈} = Θ_{D₁₆⁺} = E₄²`, with the two lattices non-isometric.
- `Θ_{A₂} ∈ M_1(Γ₀(3), χ₋₃)` and `Θ_{D₄} ∈ M_2(Γ₀(2))` (trivial character, since `D = 4`) — the
  general-level theorem at its two smallest interesting instances, with `level`, `det` and `χ`
  computed from the lattice through Layers 2 and 6 rather than quoted.  Weight `1` at `A₂` is
  admissible here because nothing in this roadmap needs a dimension formula to *state* modularity.
- **Identifying** `Θ_{A₂}` and `Θ_{D₄}` with Eisenstein series.  The comparison forms are the
  modular-forms roadmap's *Layer 0* **Eisenstein series with character** — the construction
  targets, with their `q`-expansions and boundedness at every cusp, not merely the landed
  `modFormCharSpace` interface — pinned by their normalizations:
  ```text
  Θ_{A₂}(τ) = 1 + 6 ∑_{m ≥ 1} ( ∑_{d ∣ m} χ₋₃(d) ) q^m                      in M_1(Γ₀(3), χ₋₃)
  Θ_{D₄}(τ) = 2E₂(2τ) - E₂(τ) = 1 + 24 ∑_{m ≥ 1} ( ∑_{d ∣ m, d odd} d ) q^m   in M_2(Γ₀(2))
  ```
  the first the weight-`1` series `E_1^{ψ,φ,t}` of that layer with `ψ = 1`, `φ = χ₋₃`, `t = 1`,
  scaled to constant term `1`; the second the weight-`2` corrected combination `E₂(τ) - t E₂(tτ)`
  of that layer at `t = 2`, scaled to constant term `1`.  Consequently
  `r_{A₂}(2m) = 6 ∑_{d ∣ m} χ₋₃(d)` and `r_{D₄}(2m) = 24 · (sum of the odd divisors of m)` for
  `m ≥ 1`, with `r_{A₂}(2) = 6` and `r_{D₄}(2) = 24` as corollaries.  **Uniqueness is the Sturm
  bound, not a dimension formula**: Tau Ceti's landed `ModularForm.eq_of_sturm_bound` says that
  two forms in `M_k(Γ)` agreeing on the coefficients up to `⌊k [SL₂(ℤ):Γ]/12⌋` are equal; with
  `[SL₂(ℤ):Γ₀(2)] = 3` (Tau Ceti's `Gamma0_prime_index`) and
  `[SL₂(ℤ):Γ₁(3)] = [SL₂(ℤ):Γ₀(3)] · |(ℤ/3)ˣ| = 4 · 2 = 8`, both bounds are
  `⌊6/12⌋ = ⌊8/12⌋ = 0`, so each identification is the equality of two constant terms, both `1`.
  ⚠ Weight `1` is exceptional in the supplier's dimension theory, and no weight-one dimension
  formula is invoked or needed: the `A₂` argument is the Sturm bound on `Γ₁(3)` as stated.  These
  two identifications depend on the supplier's Layer-0 Eisenstein construction and on nothing else
  outside this roadmap, and no target here depends on the supplier's dimension formulas.

### Boundary and off-hypothesis checks

Each of the following records an interface decision by the example that forces it.  Those that
are theorems about the objects defined here are acceptance tests and are to be proved; the others
are the reasons a hypothesis is an argument of a definition rather than of a later theorem.

- The zero lattice in the zero-dimensional space (`stdLattice 0`): `Θ_0 = 1`, `det 0 = 1`,
  `level 0 = 1`, and `c • 0 = 0` is unimodular for every `c ≠ 0` — which is why the strict
  statements of 2B carry `Nontrivial E`.
- `L = 2^{1/4} ℤ ⊂ ℝ`: `L ∩ L^∨ = 0`, so `L^∨ ⧸ (L ∩ L^∨)` is infinite — which is why
  finiteness of `A_L` and of `L^∨ ⧸ aL`, and `D_L ≠ 0`, carry `IsIntegral L`.
- `L = ½ ℤ`: `L^∨ = 2ℤ ⊂ L` and `Θ_{2ℤ}(i) ≠ Θ_{½ℤ}(i)` — which is why 3B's dual
  decomposition carries `IsIntegral L`.
- `L = ℤ`, `a = c = 1`, `m = 0`: the representatives `0, 1` of the single class of `L/L` give
  summands `1, -1`; `L = √2 ℤ`, `a = c = 1`, `m = 1/(2√2) ∉ L^∨`: the representatives `0, √2`
  give `1, -1`; `e(q_L)` on `A_ℤ`: the representatives `0, 1` give `1, -1` — which is why
  evenness and `m ∈ L^∨` are arguments of the Gauss summands and of `e(q_L)`.
- `L = √2 • ℤ²`, `a = 3`, `c = 12`: the sum of 6D is `36`, not `-12` — which is why 6D carries
  `gcd(a, c) = 1`.
- `L = √2 • ℤ²`, `a = 1`, `c = 2`: `G_L(1, 2) = 0` and `Θ_L(1/2 + it) > 0` — which is why the
  asymptotic of 6B is additive.
- `L = ℤ²`: `Θ ∣[1] S² = -Θ` — the central element acts by `(-1)^k`, and the double-`S` check
  of 4D carries that scalar.
- `L = √2 • ℤ²`, `a = 3`, `c = 4`: the Gram matrix `B = 2I` of `L` and the Gram matrix `B_Q = -2I`
  of `-c ⟪·,·⟫` on `L^∨` both have determinant `4`, so `det B_Q / det L = 1` is a square modulo
  `3` while `-1` is not — which is why 6D (vi) compares the two determinants by a square, and the
  `(-1)^k` of `D_L` comes from `g_p² = (-1/p) p` alone.
- `!![-2, -3; 3, 4] ∈ Γ(3)` has `a = -2`, negative and even, and `T³` times it is
  `!![7, 9; 3, 4] ∈ Γ(3)` with `a = 7` — which is why 7A and 7E arrange the sign of `a` as well
  as its parity before 6E is applied, and why 7E does so by `T^{jN}` inside `Γ(N)` rather than
  by `T^j` or `-I`.
- `D₄`: level `2`, so `-I ∈ Γ(2)`, and weight `k = 2`, so `-I` acts trivially — the instance of
  6C's corollary (`k` is even when the level divides `2`) that the `c = 0` case of 7E rests on.
- `√2 • E₈` has level `2` and `√2 • (√2 • E₈)^∨ = E₈` has level `1` — the Fricke partner's level
  divides `N` and need not equal it (2F).

## Ordering — the dependency graph

- **Layer 1** (lattice Poisson summation) → Mathlib only.
- **Layer 2** (real model, bridge, level, scaling, shells, Kronecker symbol) → Mathlib; Tau
  Ceti's integral-lattice library (`IntegralLattice`, `Dual/*`, `Discriminant/*`,
  `FiniteBilinearModule/*`, `Rationalization`, `RankOne`, `RootLattice/*`) for the bridge and its
  acceptance tests.  Independent of Layer 1 and can proceed beside it.
- **Layer 3** (the theta series) → Layers 1, 2.
- **Layer 4** (the two laws) → Layers 1, 3; Tau Ceti's `discriminantPairing` and
  `discriminantQuadraticMap`, through the bridge, for `b_L` and `q_L`.
- **Layer 5** (level one) → Layer 4, Mathlib's level-one generation lemma and dimension formula,
  Tau Ceti's landed level-one graded ring.
- **Layer 6** (Gauss sums) → Layer 4 for reciprocity; Mathlib's `gaussSum`, `jacobiSym` and
  `DirichletCharacter` API for the evaluation and the conductor theorem.  Independent of Layer 5.
- **Layer 7** (general level) → Layers 4, 6; modular-forms Layer 0 (**landed**) for
  `modFormCharSpace`; for 7F, Tau Ceti's landed `frickeGL`, `frickeOperator` and `frickeScalar`,
  against which both normalizations of the Fricke identity are stated.
- **Layer 8** (identifications) → Layer 5 only, for `E₈`, Leech and the theta series of the
  rank-16 pair; the bridge 2D with Tau Ceti's `typeE₈RootLattice`, `checkerboardLattice`,
  `orthogonalSum` and `Overlattice/*` for `E₈`, for the construction of `E₈ ⊕ E₈` and `D₁₆⁺`, and
  for their non-isometry; Layer 7, the landed finite-index Sturm bound (`eq_of_sturm_bound`,
  `Gamma0_prime_index`) and the modular-forms Layer-0 Eisenstein series with character for the
  two general-level identifications.  No dimension formula beyond Mathlib's level-one one is
  consumed.
- The Leech lattice is consumed as an *input* at Layer 8 and nowhere earlier, and `E₈`, `E₈ ⊕ E₈`
  and `D₁₆⁺` enter there through the bridge; nothing in Layers 1–7 mentions dimension `8`, `16`
  or `24`.

| Block | Status |
|---|---|
| Layer 1 lattice Poisson summation | **new** in general dimension; a dimension-24 instance exists (see *Provenance*) |
| Layer 2 real model and bridge | **new**; the bridge is anticipated by the completed integral-lattices roadmap |
| Layer 2 Kronecker symbol | **new**; Mathlib has `jacobiSym` only |
| Layer 3 theta series | **new** in general; a dimension-24 instance exists |
| Layer 4 transformation laws | `S` exists at dimension 24; the general-`v` and vector-valued forms are **new** |
| Layer 5 level one | **new**; the group-theoretic input is a single Mathlib lemma |
| Layer 6 Gauss sums, reciprocity, Milgram, conductor | **new**; the hardest single block of the roadmap |
| Layer 7 Hecke–Schoeneberg and the coset series | **new** |
| Layer 8 identifications | **new**; `E₈` and `D₁₆` are Tau Ceti's, `E₈ ⊕ E₈` and `D₁₆⁺` are summed and glued here, the Leech lattice is formalized elsewhere (see *Provenance*) |

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
| `SpherePacking/Dim8/E8/Basic.lean`, `.../Packing.lean`: `Submodule.E8`, `E8Lattice`, `E8_integral`, `E8_integral_self`, `E8Matrix_unimodular` | a second model of the `E₈` of 8B, whose real model is Tau Ceti's `typeE₈RootLattice`; comparison lemmas only |
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
  case `L ⧸ cL` against `L^∨ ⧸ aL`; its rank-one case is the classical Landsberg–Schaar identity,
  tested here through its square at rank two.
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
  the [completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md), and in
  its half-norm translation.
- N. R. Scheithauer, "The Weil representation of `SL₂(ℤ)` and some applications", *Int. Math. Res.
  Not.* **2009**, [DOI](https://doi.org/10.1093/imrn/rnn128), and F. Strömberg, "Weil
  representations associated with finite quadratic modules", *Math. Z.* **275** (2013),
  [DOI](https://doi.org/10.1007/s00209-013-1188-z) — the Weil representation, which this roadmap
  does not build; cited to fix what a future roadmap for it would need (see *Scope and ownership*).
- H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, "The sphere packing problem in
  dimension 24", *Ann. of Math.* **185** (2017), [arXiv:1603.06518](https://arxiv.org/abs/1603.06518)
  — the source of the formalized Leech lattice consumed at Layer 8.

## Acknowledgements

The Leech lattice of Layer 8 and a dimension-24 instance of Layers 1, 3 and 4 come from the
sphere-packing formalization; see *Provenance* for the coordination requirement.  The
discriminant-form vocabulary is Tau Ceti's, built to the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md), and the
modular-form vocabulary is the [modular-forms roadmap](../ModularForms/README.md)'s; this roadmap
adds the bridge between them and the one glue construction of 8E.
