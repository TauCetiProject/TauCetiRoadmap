# Roadmap: modular forms — Hecke theory, newforms, and L-functions

**Summary.** Develop the general classical theory of integral-weight modular forms, building
on the analytic forms, Hecke actions, newforms, periods and L-functions in Mathlib and Tau Ceti.
The remaining end theorems are integral Hecke polynomiality in arbitrary positive rank,
cross-level strong multiplicity one, weight-one coefficient arithmetic, Galois stability,
general-level dimension formulas and the level-one Eichler–Selberg trace formula. The build
includes character Eisenstein series, partial Atkin–Lehner operators, twists and newform orbit
invariants, and the uniformisation and scheme–analytic comparison of the level moduli on which
the weight-one arithmetic rests, with all primes and all positive congruence levels retained.

## Scope and ownership

This is the classical modular-forms roadmap. It owns the extensions in the layers below;
its foundations are supplied by the pinned libraries, rather than reconstructed. In particular,
Tau Ceti supplies the character spaces, Petersson product, old/new spaces, normalized newforms,
fixed-level strong multiplicity one, the coefficient field in weight at least two,
character Eisenstein series in weight at least three, the corrected weight-two E₂,
Atkin–Lehner character transport and the trivial-character sign theory, Satake parameters
and conditional angles, complex conjugation of newforms, the Fricke
functional equation, the level-one graded ring, and the full-index valence formula.
Mathlib supplies the continued modular-form L-function. The exact contracts follow below.

FuchsianOrbifolds Layers 3–6 own cusp charts, compactification, compact-surface degree theory
and the level-one sphere identification. Ownership of the normalized level-one j-function
(j = E₄³/Δ, j − 1728 = E₆²/Δ, its modular invariance, q-expansion and exact elliptic orders)
moves from this roadmap to FuchsianOrbifolds Layer 6, which is to construct j from Mathlib's
E₄, E₆ and Δ; this roadmap supplies no j-input module and consumes only the resulting
identification X(1) ≃ ℙ¹, in §10A and §10D. The generic analytic cohomology and Riemann–Roch chain of §10B remains here; algebraic
Riemann–Roch is a different theory and is not substituted for the analytic comparison.

PolynomialGaloisGroups, “What this roadmap consumes from the Number Field Arithmetic roadmap”
and Layer 1, “The recognition theorems”, own the factorization-to-cycle-type interface and
permutation-group recognition.
The weight-60 example uses those mathematical results. No solvability decision procedure or
certificate checker belongs here. Noncongruence forms, half-integral weights, Galois
representations of newforms, and general-level trace formulas belong to their separate
roadmaps; none is a prerequisite for the classical targets below.

The characteristic-zero arithmetic comparison in §8.0 and rational descent in §8.1
belong to this roadmap's coefficient theory. ModularCurves Layers 1–5, 9 and 10 supply the
elliptic families, level moduli, descent formalism and the Tate curve; §8.0 constructs the
arithmetic modular-form laws, their all-cusp Laurent criterion and their analytic comparison.
The scheme–analytic comparison on which that analytic comparison rests is owned here, in
§10D: the uniformisation of the complex level moduli by Γ₁(N)\ℍ, the Riemann-surface
structure of the ℂ-points of the fine curve Y₁(N), the complex Tate curve at the cusps and
the algebraicity of holomorphic sections of the powers of ω. It is stated for these affine
level curves and this line bundle only, with no analytification functor and no coherent
GAGA for arbitrary complex schemes. ModularCurves lists the uniformisation of its twisted
curve among its external contracts and AlgebraicCurves leaves the compact-Riemann-surface
comparison to a GAGA development; neither supplies the comparison used here.
ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8 and 7.1 and EllipticPeriods §2.4 plan the
same objects under the same conventions (the Weierstrass curve with a₄ = −g₂/4 and
a₆ = −g₃/4, the marked point 1/N, the frame 2πi du = dt/t and the multiplier (cz+d)⁻¹);
ModularCurvesPartII consumes Layers 2–8 and 10A–10C of this roadmap and EllipticPeriods
consumes ModularCurvesPartII, so both take the lattice uniformisation, the lattice–modular
comparison, the moduli bijection, the complex Tate curve and the automorphy of ω from §10D,
and nothing of either is cited here. Integral
geometric modular forms and characteristic-p operations belong to
AlgebraicModularFormsAndSerreWeights Layers 1–3, which consume this rational theory.

## Conventions

Levels N are positive, weights k are integers, and coefficients of analytic forms lie in ℂ.
Write aₙ(f) for the coefficient of qⁿ in `UpperHalfPlane.qExpansion 1 f` on Γ₁(N), with
q = exp(2πiz). At another cusp use its strict translation width. Characters have both the
unit-homomorphism form (ℤ/Nℤ)ˣ → ℂˣ and the zero-extended form
`DirichletCharacter ℂ N`; `MulChar.equivToUnitHom` and `MulChar.ofUnitHom` relate them.
A nonzero weight-k χ-form requires χ(−1) = (−1)ᵏ.

Hecke operators use the arithmetic normalization, with positive index n. At a prime p ∣ N,
Tₚ is Uₚ; a diamond automorphism exists only at a unit modulo N. In formulas χ(p) = 0 at
bad primes, and a(m/p) means zero unless p divides m. The recurrence is
`a(p^(r+2)) = a(p)*a(p^(r+1)) - chi(p)*p^(k-1)*a(p^r)` for r ≥ 0, with complex integer
powers when k is an integer. There is no operator at index zero in these conventions.

A normalized form has a₁ = 1. A native newform is a nonzero good-Hecke eigenform, with
its character, in the newspace, normalized by a₁ = 1; eigen-ness at bad primes is a theorem.
The coefficient field is the embedded field ℚ(aₙ : n ≥ 1) ⊆ ℂ, not an abstract field chosen
up to isomorphism. A field embedding acting on coefficients is not assumed continuous.

For Q an exact divisor of N, Q ∣ N and gcd(Q,N/Q) = 1. The full normalized Fricke operator
is (√N)^(2−k) times the native weight-k slash by the matrix (0,−1;N,0). With this choice
Λ_N(k−s,f) = iᵏ Λ_N(s,𝒲_N f). For trivial character the functional-equation sign is
(−1)^(k/2) times the Fricke eigenvalue.

**Checks.**
- For Δ, (a₁,a₂,a₃,a₄,a₆) = (1,−24,252,−1472,−6048):
  252·(−24) = −6048 and (−24)² − 2¹¹ = −1472 fix the arithmetic normalization.
- For η(z)²η(11z)², a₁₁ = 1 and χ(11) = 0, so a₁₂₁ = 1; inserting a nonzero
  diamond value at 11 would give 1−11 instead.
- At level 11 and weight 2, Fricke eigenvalue −1 gives i²·(−1) = +1; for Δ,
  weight 12 and Fricke eigenvalue +1 give i¹² = +1.

## Exact supplier contracts

### From Mathlib

- `ModularForm`, `CuspForm`, `ModularFormClass` and `CuspFormClass` in
  `Mathlib/NumberTheory/ModularForms/Basic.lean`: slash invariance, holomorphy and boundedness
  or vanishing at every cusp, together with the complex module structures. These hypotheses
  are carried by the form type; a raw holomorphic function is not a modular form.
- `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`,
  `UpperHalfPlane.qExpansion`, the Eisenstein series, `CuspForm.discriminant`, and
  `ModularForm.discriminant_ne_zero`: subgroup, expansion and level-one analytic inputs.
- `ModularForm.dimension_level_one` and `ModularForm.sturm_bound_levelOne` in
  `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean`.
- `ModularForm.L` in `Mathlib/NumberTheory/ModularForms/LFunction.lean` is the continued
  L-function. `CuspForm.differentiable_L` requires positive weight and the cusp-form class;
  the modular-form continuation alone need not be entire.
- `CuspFormClass.exists_sum_range_norm_sq_qExpansion_coeff_le_of_mem_strictPeriods`
  in `Mathlib/NumberTheory/ModularForms/Bounds.lean`: for nonnegative integral weight,
  an arithmetic subgroup, a cusp form and a positive strict period h, the sum of the first M squared coefficient
  norms is at most C M^k. Use h=1 for Γ₁(N), including k=1.
- `PeriodPair.weierstrassP`, `PeriodPair.derivWeierstrassP_sq`, `PeriodPair.G`,
  `PeriodPair.g₂` and `PeriodPair.g₃` in
  `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`: the Weierstrass ℘-function
  of a period pair, its periodicity and meromorphy, and the differential equation
  ℘′² = 4℘³ − g₂℘ − g₃ with g₂ = 60G₄ and g₃ = 140G₆ as lattice sums. No comparison of
  these lattice sums with the modular Eisenstein series is supplied; §10D proves it.
- `WeierstrassCurve.exists_variableChange_of_j_eq` in
  `Mathlib/AlgebraicGeometry/EllipticCurve/IsomOfJ.lean`: over a separably closed field, two
  elliptic Weierstrass curves with equal j-invariant differ by a change of variables. The
  implicit-function, open-mapping and removable-singularity theorems supply the analytic
  structure used in §10D.
- `Equiv.Perm.subgroup_eq_top_of_swap_mem` in `Mathlib/GroupTheory/Perm/Cycle/Type.lean`:
  a subgroup of S_p, p prime, of order divisible by p and containing a transposition is S_p;
  this is the recognition theorem behind the weight-60 example.
- `ArithmeticFunction.moebius`, `ArithmeticFunction.sigma`, `Polynomial.dickson`,
  `LinearMap.trace`, `LinearMap.charpoly`, `IntermediateField` and `NumberField` supply the
  arithmetic, linear algebra and field carriers used in the acceptance signatures.

### From Tau Ceti

All paths in this list start at `TauCeti/NumberTheory/`.

- Character spaces and parity: `modFormCharSpace`, `cuspFormCharSpace`,
  `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` in `ModularForms/DiamondOperators.lean`
  and `ModularForms/Parity.lean`. The spaces are diamond eigenspaces, with the trivial
  character identified with forms on Γ₀(N); their character decomposition is used throughout.
- `TauCeti.EisensteinSeries.normalizedCharEisensteinSeriesMF` and
  `TauCeti.EisensteinSeries.qExpansion_normalizedCharEisensteinSeriesMF_coeff` in
  `ModularForms/EisensteinSeries/Normalized.lean`: character series and positive-coefficient
  divisor sums for k≥3, primitive second character and compatible parity, including level raises.
  `TauCeti.eisensteinSubspace` in `ModularForms/EisensteinSeries/Subspace.lean` is their span.
  `TauCeti.EisensteinSeries.isCompl_primitiveEisensteinSubspace_cuspFormSubmodule` in
  `ModularForms/EisensteinSeries/Primitive.lean` is the lattice-series decomposition for k≥3;
  identifying its fixed-character part with the character-series span remains a comparison.
  `TauCeti.EisensteinSeries.correctedE2` in `ModularForms/EisensteinSeries/WeightTwo/Basic.lean`
  supplies E₂(z)−tE₂(tz), its coefficients and the exceptional zero at t=1.
- Valence: `TauCeti.ModularForm.valence_formula_weighted` in
  `ModularForms/LevelOne/ValenceFormula.lean`, and
  `TauCeti.ModularForm.valence_formula_finiteIndex` in `ModularForms/Norm/Cusps.lean`.
  The latter uses the full SL₂ index, interior weights 2/|Stab| and cusp translation orbits;
  §1.1 compares these to geometric cusp orbits and the projective index.
- `TauCeti.ModularForm.sturm_bound_finiteIndex`,
  `TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z`,
  `TauCeti.ModularForm.eq_of_sturm_bound` in `ModularForms/SturmBound.lean`, and
  `TauCeti.ModularForm.mvPolynomialEquivModularForms` in `ModularForms/LevelOne/GradedRing.lean`:
  finite-index coefficient uniqueness and the level-one graded ring ℂ[E₄,E₆].
- The abstract Hecke convolution and coset API in `HeckeRing/Basic.lean`; the integral
  rank-n ring, elementary divisors, degree and transpose anti-involution in `HeckeRing/GLn/`.
  `HeckeRing.GLn.evalHomLocal` in `HeckeRing/GLn/PolynomialRing/Basic.lean` is the canonical
  polynomial evaluation map. Its rank-one and rank-two surjectivity and the injectivity
  results in `HeckeRing/GLn/PolynomialRing/Injective.lean` are inputs to the arbitrary-rank target.
- `HeckeRing.GL2.heckeTNat`, `HeckeRing.GL2.heckeTCuspNat` in
  `ModularForms/HeckeSlash/Operators.lean`, and the coefficient and recurrence API in
  `ModularForms/HeckeSlash/Nebentypus/`: the prime-index arithmetic operators. For arbitrary
  positive n use `HeckeRing.GL2.heckeTCompositeGamma0` in
  `HeckeRing/GL2/Gamma0/Diagonal/Composite.lean`, acting through
  `HeckeRing.GL2.heckeRingHomCuspCharSpace` in
  `ModularForms/HeckeSlash/Nebentypus/Action.lean`; the single diag(1,n) double coset
  differs from this composite element when n has a square factor.
- `TauCeti.cuspFormsOld`, `TauCeti.cuspFormsNew`,
  `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` in `ModularForms/Newforms/Basic.lean`.
  Oldforms use only proper divisor levels M ≠ N. These use the native Petersson inner
  product and its orthogonal-complement API; §3.1 adds fixed-character indexing.
- `HeckeRing.GL2.Newform` in `ModularForms/Newforms/Newform.lean`,
  `HeckeRing.GL2.Newform.toEigenform` in `ModularForms/Newforms/FullEigenform.lean`,
  `HeckeRing.GL2.Newform.basis` in `ModularForms/Newforms/OrthogonalBasis.lean`, and
  `HeckeRing.GL2.EigenformAwayFromLevel.exists_newform_eigenvalue_eq` in
  `ModularForms/Newforms/Decomposition.lean`. These supply full eigen-ness, the orthogonal
  basis and primitive-associate existence; §5.1 strengthens the uniqueness across levels.
- `HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq` and
  `HeckeRing.GL2.Newform.level_eq_of_dvd_of_forall_prime_eigenvalue_eq` in
  `ModularForms/Newforms/StrongMultiplicityOne.lean`: respectively fixed level/character
  with finite exceptional indices, and divisor-level rigidity with no exceptional good primes.
- `TauCeti.atkinLehnerGamma1CharCuspRestrict` and
  `TauCeti.atkinLehnerOperatorGamma1Cusp_mul_left_of_mem_cuspFormCharSpace` in
  `ModularForms/AtkinLehner/Gamma1.lean`: the Γ₁ slash operator, character transport and
  the factor χ(d_γ) when W is replaced by γW. `TauCeti.atkinLiMatrix` in
  `ModularForms/AtkinLehner/Matrix.lean` fixes the Atkin–Li matrix choice.
  `TauCeti.Nat.ExactDivisor.normalizedAtkinLehnerCuspRepresentation` in
  `ModularForms/AtkinLehner/Normalized.lean` supplies the normalized Boolean-group action
  on Γ₀ cusp forms, including involutions and composition.
  `HeckeRing.GL2.Newform.atkinLehnerSign` in `ModularForms/AtkinLehner/Sign.lean` supplies
  the ±1 newform signs for trivial character. §6.1 extends the newform comparison to
  general nebentypus, rather than reconstructing these operators and sign results.
- `TauCeti.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace`
  in `ModularForms/Fricke/Hecke.lean` gives 𝒲_N Tₙf = χ(n) Tₙ𝒲_Nf for gcd(n,N)=1.
  The source and target characters are χ and χ⁻¹.
- `CuspForm.frickeCompletedL`, `CuspForm.differentiable_frickeCompletedL`,
  `CuspForm.frickeCompletedL_functional_equation` in
  `ModularForms/LFunction/FunctionalEquation.lean`: positive weight, arithmetic width-one
  carriers, cusp forms f and g, and the normalized Fricke-companion equation.
  `HeckeRing.GL2.Newform.L_eulerProduct_tprod` in `ModularForms/LFunction/EulerProduct.lean`
  gives all Euler factors, including bad primes, in Re(s) > k/2+1.
  `HeckeRing.GL2.Newform.analyticRank` and `HeckeRing.GL2.Newform.analyticConductorAt` in
  `ModularForms/Newforms/AnalyticInvariants.lean` use the continued L-function.
- `TauCeti.ModularSymbols.periodMap_injective` in
  `ModularForms/ModularSymbols/Period/Injective.lean` and
  `TauCeti.ModularSymbols.periodMap_heckeTCuspNat` in
  `ModularForms/ModularSymbols/Period/Hecke.lean`: the period functional on integral symbols
  for k = w+2, w ≥ 0, its injectivity and Hecke equivariance by precomposition.
  No Petersson boundary-cancellation assertion is required for this contract.
- `HeckeRing.GL2.Newform.satakeParameters`, `HeckeRing.GL2.Newform.satakeAngle` and
  `HeckeRing.GL2.Newform.satakeParameters_eq_exp_satakeAngle` in
  `ModularForms/Newforms/Satake.lean`: the root multiset, its sum/product and Euler factor;
  the angle requires a prime, a real coefficient and the explicit Ramanujan bound, while
  the exponential root formula additionally requires χ(p)=1.
  `HeckeRing.GL2.Newform.conj` and `HeckeRing.GL2.Newform.qExpansion_conj` in
  `ModularForms/Newforms/Conjugate.lean` supply complex conjugation and its coefficient
  identity, including newness and inverse character.
- `TauCeti.CoefficientField`, `TauCeti.CharacterField`,
  `TauCeti.CharacterField_le_CoefficientField` in `ModularForms/Newforms/Fields.lean`, and
  `TauCeti.numberField_CoefficientField` in `ModularForms/Newforms/NumberField.lean`.
  The last theorem, and newform coefficient integrality there, require k ≥ 2.
- `TauCeti.hurwitzClassNumber` in `HurwitzClassNumber.lean` has H(0)=−1/12,
  H(3)=1/3, H(4)=1/2. `ModularForms/LevelOne/PeriodPolynomial/` supplies period-polynomial
  spaces and their dimension count; `ModularForms/LevelOne/TraceFormula/` supplies the
  determinant-matrix module, explicit element, exchange relations and ambient trace
  reduction. §11.1 completes the comparison and assembles the classical trace identity.

### From TauCetiRoadmap.FuchsianOrbifolds

Layers 0–4 supply the effective projective action, cusp data with their q-coordinates, and the
compactified quotient X(Γ) as a compact Riemann surface.
Layer 5 supplies finite holomorphic maps, degree, divisor pullback and topological
Riemann–Hurwitz, with no use of analytic Riemann–Roch. Layer 6 supplies X(1) ≃ ℙ¹.
The local multiplicity, degree and divisor constructions also have native modules
`TauCeti/Analysis/Complex/RiemannSurface/LocalMultiplicity.lean`, `Degree.lean` and
`Divisor.lean`; the compactified modular quotient and genus comparison still require the
stated geometric contracts.

### From TauCetiRoadmap.ModularCurves

Layers 1–2 supply elliptic curves over schemes, Weierstrass models and their variable changes
(§1C), invariant differentials and isogenies; Layers 3–5 supply level structures, the
Weierstrass presentation, rigidifying descent (§4C, with the effective descent of sections of
§0E) and, for N ≥ 4, the fine affine curve Y₁(N) of §5A in Tate normal form, relatively finite
étale over elliptic curves; §§9A–9B supply the quotient-level moduli and their actions, and
§9E the coarse j-line. Layer 10 supplies the Tate curve over ℤ[1/N₀]((q)) with its subgroup
schemes, for the prime level N₀ ≥ 5 of that layer; its coefficient series lie in ℤ[[q]] and do
not depend on N₀, and §8.0 base-changes the curve from ℤ[1/N₀]((q)) to K((q)), which contains
1/N₀ because K has characteristic zero, and adds the canonical μ_N-embedding for every N. Over
characteristic-zero fields, the μ_N-marked moduli used in §8.0 are obtained from these level
problems by finite étale descent. The ordinary point marking and the μ_N marking are identified
after choosing a primitive N-th root of unity, not over ℚ without that choice.

### From PolynomialGaloisGroups

Consume its factorization-type input contract and Layer 1, “The recognition theorems”: a
transitive subgroup of S_p of prime degree p containing a transposition is S_p, which is
Mathlib's `Equiv.Perm.subgroup_eq_top_of_swap_mem`. No algorithmic construction is imported
into the modular-forms targets.

## How to read the build

The layer numbers preserve the classical order: character Eisenstein series and geometric
order conventions precede Hecke extensions, fixed-character old/new bookkeeping and primitive
uniqueness; partial Atkin–Lehner theory and sharp convergence then feed the arithmetic and orbit
layers. Layer 10 builds analytic cohomology and exact dimensions from the independent Fuchsian
geometry, and its §10D proves the uniformisation and algebraicity statements that the
analytic comparison of §8.0 consumes; that reference, like §9.3's use of §10C, is a proof
input across layers, not a build-order inversion. Layer 11 uses the integral-period and polynomial inputs for the level-one trace
formula. Each Needs list names the statement's carriers and one proof route; another proof
may use different inputs. `Suggested.lean` contains only the remaining statable headlines.

## Layer 0: character Eisenstein series

### 0.1 Eisenstein series and the constant-term quotient

Extend the character-series construction to weights k=1 and k=2, with primitive
characters ψ modulo u and φ modulo v, ψ(−1)φ(−1)=(−1)ᵏ, and t≥1 with tuv∣N.
For k=2 exclude ψ=φ=1 from this extension and use the corrected E₂ contract instead.
At t=1 require the positive-coefficient formula
`a(n) = sum_{d | n} psi(n/d)*phi(d)*d^(k-1)`.
Write B_(k,φ)=v^(k−1)Σ_(a=1)^v φ(a)B_k(a/v), with B₁(x)=x−1/2.
At weight two the constant term is −B_(2,φ)/4 if ψ=1 and zero otherwise.
At weight one it is −(1_(ψ=1)B_(1,φ)+1_(φ=1)B_(1,ψ))/2; this symmetric formula
is required when either character is trivial. At k=1 impose the symmetry relations between the two character parameters
instead of counting them as independent generators (Diamond–Shurman §§4.5–4.8;
Stein, Chapter 5, Theorems 5.8–5.9).

For k=1,2 define the character Eisenstein subspace as the span of these series and the
weight-two corrections. The extension and comparison API must include:

- In weights one and two, membership in the specified character space, compatibility
  with level raising, and the coefficient formula including the constant term.
- Comparison with the congruence-lattice Eisenstein series by finite Fourier inversion
  and Gauss sums, preserving the order of the two characters.
- The common kernel of the constant terms at every cusp is the cusp space. The series
  span the image of the constant-term map and meet the cusp space trivially, giving
  M_k(N,χ)=S_k(N,χ)⊕E_k(N,χ). Separate the weight-two residue relation and weight-one
  relations from the k≥3 argument.

**Checks.**
- At level one, E₄ has a₀=1, a₁=240, while the divisor-sum normalization has a₁=1
  and a₀=1/240; these are scalar multiples, not identical normalizations.
- For the odd quadratic character χ modulo 3, B_(1,χ)=1/3−2/3=−1/3.
  Both weight-one orderings (1,χ) and (χ,1) therefore have a₀=1/6 and a₁=1;
  using only the weight-two constant-term rule would give zero in the second ordering.
- E₂−2E₂(2z) has first coefficients (−1,−24,−24); at t=1 the correction is zero.
- A nonzero odd-weight form with trivial character is excluded by χ(−1)=1≠−1;
  the zero form lies in every character space.
- For trivial χ the character space agrees with forms on Γ₀(N); at level one and
  weight four the decomposition has dimensions 1=0+1, while at level 11 and weight two
  it has dimensions 2=1+1.

*Needs:* native character spaces and parity; Mathlib Eisenstein series, Dirichlet characters,
Gauss sums and q-expansions; native primitive Eisenstein decomposition for k≥3.

### Examples

E₄ and E₂−2E₂(2z) distinguish the ordinary and exceptional-weight constructions.

### Dependencies

Only the analytic, character and Eisenstein supplier contracts enter this layer.

## Layer 1: geometric orders and the projective valence formula

### 1.1 The order dictionary

For a finite-index Γ≤SL₂(ℤ), compare the native full-index valence formula with orders
on the effective quotient. Put δ=[±Γ:Γ], equal to 1 if −I∈Γ and 2 otherwise.
Interior orders are divided by the effective stabilizer order. At a regular cusp of
geometric width h use q_h; at an irregular cusp use q_(2h) in every weight, and define
geometric order as half the exponent. It is half-integral precisely when odd weight
forces an odd exponent (Diamond–Shurman §3.2, author errata for pp.74–75).

The order API must prove:

- Independence from the cusp scaling and quotient representative.
- Additivity under products of nonzero forms.
- Finite support for every nonzero form.

 The resulting valence identity is
`sum_P ord_P(f)/e_P = k*[SL2(Z):±Gamma]/12`, with e_P=1 at cusps. Derive it from the native
identity by dividing its entire mass by δ, not by an unconditional factor 2. In odd weight
with −I∉Γ a product over projective cosets changes sign when one representative is negated;
the full-coset norm is well-defined. Applying the projective norm to f² is another route,
with both its weight and every geometric order doubled (Diamond–Shurman §§3.2–3.3).

**Checks.**
- For Δ at level one, δ=1 and ord∞=1=12/12; a factor 2 would incorrectly give 1/2.
- Γ(3) has full index 24 and projective index 12, so δ=2. An odd-weight slash factor
  changes from f∣γ to −f∣γ when γ is replaced by −γ.
- At an irregular cusp, exponents 1 and 3 give orders 1/2 and 3/2; their product has
  exponent 4 and order 2, equal to the sum. Reading exponent 4 without halving fails.
- E₄ and E₆ have total masses 1/3 and 1/2, from their simple zeros at ρ and i;
  these equal 4/12 and 6/12.

*Needs:* native full-index valence and cusp translation orbits, the norm-map order formulas,
and FuchsianOrbifolds Layers 1 and 3 for effective stabilizers and geometric cusp coordinates.

### Examples

The Δ and Γ(3) computations distinguish the two index conventions.

### Dependencies

The native order and norm APIs precede the dictionary; compact-surface cohomology is not used.

## Layer 2: integral Hecke polynomiality and local comparison

### 2.1 Polynomiality in arbitrary positive rank

For every n≥1 and prime p, prove `integralHeckePolynomiality`: the native evaluation map
`HeckeRing.GLn.evalHomLocal n p` from ℤ[X₁,…,Xₙ] to the p-local integral Hecke ring is bijective
(Shimura, Theorem 3.20). Its variables map to the diagonal cosets with respectively one,
two, …, n entries equal to p. This extends the rank-one and rank-two results to arbitrary
rank. A triangular proof must identify the leading elementary-divisor vector and recover
its exponents, prove well-foundedness of the chosen dominance order, and prove that the
leading coefficient is 1 over ℤ; a rational triangular inverse is insufficient.

**Checks.**
- At rank one, XᵃXᵇ maps to the coset of p^(a+b), so the coefficient of that coset is 1.
- At rank two the generator exponents (a,b) have leading diagonal exponent vector
  (b,a+b); its inverse is b=e₁, a=e₂−e₁ for e₁≤e₂.
- For p=2 in rank two, T(1,2)²=T(1,4)+3T(2,2); the leading coefficient is 1,
  not 2 or 3. The lower term cannot be discarded in an integral presentation.
- Rank zero is excluded explicitly; p=1 is excluded because its diagonal generators
  collapse to the identity and polynomial evaluation is not injective.

*Needs:* native integral GLₙ Hecke ring, elementary-divisor parametrization, coprime
factorization, transpose anti-involution, degree map and polynomial evaluation.

### 2.2 The integral and rational p-adic comparisons

Identify the p-local integral ring with the double-coset ring of
(GLₙ(ℤ_p), Mₙ(ℤ_p)∩GLₙ(ℚ_p)). The map sends a p-primary finite-index lattice to its
ℤ_p-completion. Prove equality of structure constants by matching intermediate lattices,
not just a bijection of double-coset bases. Inverting the central coset of pI gives the
full spherical ring ℤ[T₁,…,T_(n−1),Tₙ,Tₙ⁻¹]. State the integral inclusion separately from
this localization equivalence (Rhodes–Shemanske, 12 June 1998 manuscript, §3.1 Proposition 3.2 and §3.2 Lemma 3.3).

The comparison API includes:

- Preservation of identity, multiplication and degree by the integral comparison.
- Positive Smith representatives using SLₙ(ℤ) changes of basis, with invariance under
  simultaneous sign changes.
- The universal property of central localization, specifying the integral ring as source
  and the rational-matrix ring as target.

**Checks.**
- In rank one the integral monoid is p^ℕ and the rational monoid is p^ℤ; p⁻¹ is absent
  from the first and present in the second.
- In rank two the coset of diag(1,p) has degree p+1 on both sides; at p=2 both give 3.
- The central coset pI has degree 1, and in the localization its product with p⁻¹I is 1.

*Needs:* §2.1, Mathlib p-adic fields and integer rings, native elementary divisors and lattice
index theory. The local comparison owns no general Satake transform.

### Examples

The rank-one polynomial-to-Laurent inclusion and rank-two degree 3 fix the direction and scale.

### Dependencies

This independent rank-n lane uses no modular-curve geometry; its n=2 specialization connects
to the native arithmetic Hecke action.

## Layer 3: fixed-character old and new spaces

### 3.1 Descent of the oldspace indexing

In a character space S_k(N,χ), identify the intersection with the native oldspace as
`sum_{M | N, M != N, cond(chi) | M} sum_{d | N/M} V_d S_k(M,chi_M)`,
where χ_M is the descent of the primitive character of χ to modulus M, and V_df(z)=f(dz).
This is an indexing and character-transport theorem on the native oldspace. Its orthogonal
complement inside S_k(N,χ) is the intersection with the native newspace
(Diamond–Shurman §5.6, Theorem 5.8.3).

The fixed-character API includes:

- Equality of the descended character after change of level and compatibility with diamonds.
- Injectivity of every level raise with positive dilation parameter.
- Orthogonal decomposition into the fixed-character old and new spaces.

Prove that the oldspace intersection has this description before using it in Möbius inversion.

**Checks.**
- At level 11, weight 2 and trivial character, the only proper-level source is S₂(1)=0.
  Thus old dimension is 0 and new dimension is 1; allowing M=N would give old dimension 1.
- At level one the sum is empty, so oldspace is zero and the weight-12 newspace contains Δ.
- At level 22, weight two and trivial character, the level-11 form f and f(2z) have
  leading terms q and q².
  They are independent, old dimension is 2 and new dimension is 0.

*Needs:* native Petersson product, old/new complement, character decomposition and level raises.

### Examples

Level 11 distinguishes the proper-level oldspace from the all-divisor newform decomposition.

### Dependencies

The target transports the native theory to fixed characters; it does not reconstruct the
Petersson integral, its positivity, good-prime adjoints or bad-prime newspace stability.

## Layer 4: primitive associates

### 4.1 The conductor of a good eigenform

For a normalized good-Hecke cusp eigenform at level L with character χ, combine primitive
associate existence with §5.1 to obtain a unique pair (M,g), where M∣L, cond(χ)∣M,
g is a normalized newform of character χ_M, and the original form lies in the span of
g(dz), d∣L/M. The character at M must induce χ at L. The conductor is this least level M;
its definition includes independence from the chosen primitive associate
(Miyake, Corollary 4.6.20; Diamond–Shurman, Theorem 5.8.3 and Proposition 5.8.4).

The conductor API includes:

- Divisibility of the ambient level.
- Invariance under a further level raise.
- Equality of primitive associates exactly when the good eigensystems agree outside a
  finite set.

The ambient form need not be a single degeneracy image.

**Checks.**
- Δ at level one has conductor 1.
- Viewed at level two, Δ(z)+cΔ(2z) has a₁=1 for every c and primitive associate Δ;
  its a₂ is −24+c, so good eigenvalues cannot determine the bad-prime coefficient.
- The level-11 weight-two newform has conductor 11; as a form at level 22 it is old
  but still has conductor 11, not 22.

*Needs:* native primitive-associate existence, §3.1 character transport, §5.1 uniqueness.
Existence precedes Layer 5; the unique-conductor definition follows it.

### Examples

The family Δ(z)+cΔ(2z) separates a primitive associate from a U₂-stabilization.

### Dependencies

The native decomposition supplies existence; Layer 5 supplies only the remaining uniqueness.

## Layer 5: cross-level strong multiplicity one

### 5.1 Arbitrary levels and finitely many exceptional primes

Prove `crossLevelStrongMultiplicityOne`: for k≥1, positive levels N,M, normalized native
newforms f and g, and a finite set S of primes, if aₚ(f)=aₚ(g) whenever p∤NM and p∉S,
then N=M, their characters agree after transport along this equality, and their underlying
functions agree on ℍ (Miyake, Theorem 4.6.19). Equality of levels is equality of primitive
conductors. Unlike the native divisor-level theorem, neither level divides the other in
the hypotheses, and unlike fixed-space strong multiplicity one the character need not be
assumed equal.

A route is to remove the exceptional primes by Hecke sieving, compare at a common multiple
of the levels, and use the primitive decomposition and level-lowering argument. Prove each
comparison on the old/new carriers, preserving the character; a good eigenform at a larger
ambient level cannot replace either newform in this theorem.

**Checks.**
- f=g=Δ, N=M=1 and S={2,3} give equal functions and the same trivial character.
- Δ at level 2 as an oldform has the same aₚ for p odd, but fails native newspace
  membership; it cannot force 2=1.
- Multiplying a normalized form by 2 gives a₁=2, so it fails normalization even if
  one records the same Hecke eigenvalues. The conclusion is equality, not proportionality.

*Needs:* native newforms, Hecke sieving and level descent, primitive decomposition and fixed-level
strong multiplicity one. No conductor uniqueness from Layer 4 is used in its proof.

### Examples

The same-level case and the oldform counterexample fix the quantifiers.

### Dependencies

Only the native analytic newform machinery and character transport enter the proof.

## Layer 6: partial Atkin–Lehner operators

### 6.1 Exact divisors and character transport

For Q‖N take the native Γ₁ slash operator for the fixed Atkin–Li matrix and multiply
it by (√Q)^(2−k), denoting this normalized map by 𝒲_Q. Decompose χ=χ_Qχ_(N/Q)
by the Chinese remainder theorem. Prove the extension to general-character newspaces
and the normalized companion-form comparison. For gcd(n,N)=1 prove the relation 𝒲_Q Tₙf=χ_Q(n) Tₙ𝒲_Qf. At Q=N this agrees with the native
Fricke–Hecke relation; it is not unqualified commutation at general character
(Atkin–Li, §§1–2, W-operator relations).

The partial-operator API includes:

- Preservation of the newspace at arbitrary nebentypus, using the supplied character
  transport for the ambient cusp spaces.
- Compatibility of the newform comparison with the native full Fricke comparison and
  its matrix-choice scalars.
- Pseudo-eigenvalues of modulus one between normalized primitive companion forms.
 For nontrivial character retain the transported companion form rather than claiming
it is the original form. The specialization to trivial character must agree with the
normalized action and signs in the supplier contract.

**Checks.**
- For χ(2)=i modulo 5 and the weight-three Eisenstein pair, the T₂ eigenvalues are
  1+4i and 4−i; i(4−i)=1+4i, whereas 4−i≠1+4i.
- For trivial character at level 11 and weight 2, 𝒲₁₁²=1 and the eta-product form
  has eigenvalue −1, so the functional-equation sign is +1.
- Q=1 gives the identity with χ_Q=1. At N=12 the exact divisors are 1,3,4,12;
  Q=2 is excluded since gcd(2,6)=2.
- At full level one 𝒲₁Δ=Δ; replacing its square by −1 would contradict weight 12.

*Needs:* native slash, Fricke and newform APIs; §3.1; Chinese remainder character decomposition.

### Examples

The quartic character detects the scalar in the commutation law; N=12 tests exact divisibility.

### Dependencies

The matrix, character-transport and trivial-character sign contracts precede the
general-character newform comparison at every exact divisor.

## Layer 7: sharp L-series convergence

### 7.1 The noncuspidal abscissa

For k>0, N>0 and f∈M_k(Γ₁(N)), prove `modularFormAbscissaLeWeight`: the coefficient
Dirichlet series has abscissa of absolute convergence at most k (Diamond–Shurman,
Proposition 5.9.1). For k≥3 use the Eisenstein divisor sums and the cusp-form estimate.
For k=2 use aₙ=O(n^(1+ε)) for every ε>0 rather than the false bound σ₁(n)=O(n).
For k=1 use the strict-period mean-square contract with period 1 to obtain
Σ_(n≤X)|aₙ|²=O_f(X). Cauchy–Schwarz on dyadic intervals gives an O_f(X) bound for
Σ_(X<n≤2X)|aₙ|, hence absolute convergence for Re(s)>1. This uses the bound at every
cusp through the native cusp-form class (Diamond–Shurman §5.9).

**Checks.**
- E₄ has L-series 240ζ(s)ζ(s−3), with abscissa 4 and a pole at 4; it is not cuspidal.
- For Δ the native safe bound is 7 and the target bound is 12; this target does not
  assert equality with the abscissa, nor replace the stronger cusp estimate.
- At weight one, dyadic Cauchy–Schwarz gives
  Σ_(X<n≤2X)|aₙ|≤X^(1/2)·O(X^(1/2))=O(X); summing X^(1−σ) converges for σ>1.
- For f=0 the abscissa is −∞, which satisfies the bound; a nonzero constant has no
  positive coefficients, so it is not a counterexample to an upper bound.

*Needs:* §0.1; native coefficient bounds, Mathlib L-series abscissa and Cauchy–Schwarz;
the strict-period mean-square contract and dyadic summation.

### Examples

The pole of E₄ at 4 distinguishes sharp convergence from the entire cusp-form completion.

### Dependencies

The Euler product and cusp-form functional equation are supplier contracts. Entireness always
requires cusp forms on both sides of the companion equation.

## Layer 8: weight-one arithmetic and Galois stability

### 8.0 Characteristic-zero arithmetic forms and analytic comparison

For N≥1, k≥1 and a characteristic-zero field K, define an arithmetic modular form
on Γ₁(N) as a rule on elliptic families E over K-algebras with an embedding
α:μ_N↪E[N], taking values in the k-th tensor power of the invariant-differential line
ω_E=e*Ω¹_(E/A), compatible with isomorphisms and every base change of K-algebras.
Impose holomorphy at every cusp; its arithmetic meaning is the absence of negative
powers in every Tate expansion after adjoining the required roots of unity and cusp
parameter. The cusp subspace additionally has constant term zero in every such
expansion. Denote these spaces by M_k^arith(N,K) and S_k^arith(N,K)
(Deligne–Serre §2.1, p.510, including its Laurent-expansion formulation).

Take the Tate curve over ℤ[1/N₀]((q)) with its subgroup schemes from ModularCurves Layer 10,
for the prime level N₀ ≥ 5 of that layer, and base-change it from ℤ[1/N₀]((q)) to K((q)),
which contains 1/N₀ because K has characteristic zero; the coefficient series of the curve
lie in ℤ[[q]] and do not depend on N₀. Construct here, for every N ≥ 1, the canonical embedding
μ_N ↪ Tate(q)[N] induced by μ_N ⊂ 𝔾_m and the parametrization 𝔾_m/q^ℤ, the differential
dt/t, and the evaluation of rules on these data: the Tate expansion at the standard cusp,
and the expansions at all other cusps using the level structures ζ ↦ ζ^a q^(b/N), for (a,b)
of exact order N modulo N, after adjoining the N-th roots of unity and the parameter q^(1/N),
each a Laurent series in a cusp parameter q^(1/w). Prove independence from the finite
splitting field and compatible changes of cusp parameter. The cusp subspace is the joint
kernel of the constant-term maps on the holomorphic space, with one map at each geometric
cusp. Retain the finite stabilizer action at small levels in these expansions
(Deligne–Serre §§2.1(c), 2.5, pp.510–512; deligne-serre lines 178–188).

Prove the characteristic-zero comparison: over ℂ, evaluation on
E_z=ℂ/(ℤ+zℤ), with α(exp(2πi/N))=1/N, and division by (2πi du)^k gives
linear isomorphisms from M_k^arith(N,ℂ) and S_k^arith(N,ℂ) to the native analytic
modular and cusp spaces on Γ₁(N). The Tate expansion agrees coefficient by coefficient
with `UpperHalfPlane.qExpansion 1`; the maps commute with diamonds and good Hecke
operators in the arithmetic normalization (Deligne–Serre §§2.2–2.5, pp.510–512,
especially equations (2.4.1)–(2.4.2) and (2.5.1); deligne-serre lines 168–194).

The map is evaluation on the family E_z. For N ≥ 4 a rule is the pullback of its value on
the universal family over the fine curve Y₁(N), so its avatar is holomorphic along the
uniformisation of §10D and modular because the isomorphism (E_z, α_z) ≅ (E_(γz), α_(γz)) of
§10D rescales du by (cz+d)⁻¹; holomorphy at every cusp is the all-cusp Laurent criterion
read through the complex Tate curve of §10D. Injectivity is Tate expansion. Surjectivity is
the algebraicity theorem of §10D: an analytic form is the avatar of a rational section of
ω^k over Y₁(N) that is regular at every point and holomorphic in every Tate expansion, hence
of a rule holomorphic at the cusps. For N ≤ 3 choose an auxiliary level M ≥ 4 coprime to N
(M = 4 for N = 1 or 3, M = 5 for N = 2). Then Γ₁(N) ∩ Γ₁(M) = Γ₁(NM), a rule on Γ₁(N) is a
rule on Γ₁(NM) whose two pullbacks to the moduli of (E, α_N, α_M, α′_M) agree (the
simultaneous-structure moduli of ModularCurves §4C, relatively finite étale by §5A, with the
effective descent of sections of §0E), and an analytic form on Γ₁(N) is a form
on Γ₁(NM) fixed by the slash action of Γ₁(N); the comparison at level NM restricts to these
two descent conditions, which correspond under it.

The arithmetic-form API includes:

- Pullback along K-algebra maps, identity and composition, and descent through the
  rigidifying level covers; no choice of trivialization of ω_E enters the value.
- For a trivialized differential η and a unit u, the scalar coefficient changes by
  u^(−k) when η is replaced by uη; this is the tensor-power convention above.
- Injectivity of Tate expansion on each of these arithmetic spaces, and compatibility
  with scalar extension and diamond action.
- For every extension K′/K of characteristic-zero fields, the natural map
  K′⊗_K S_k^arith(N,K) → S_k^arith(N,K′) is an isomorphism; these spaces are finite
  dimensional. A form over K′ descends to K exactly when its canonical Tate
  coefficients lie in K (Deligne–Serre §2.6, equation (2.6.1), p.512).

**Checks.**
- With t=exp(2πiu), dt/t=2πi du. On Δ, both normalizations therefore give
  q−24q²; omitting 2πi multiplies both coefficients by (2πi)¹². E₄ has constant
  term 1 and lies in M₄ but not S₄; testing no cusp would admit it to the wrong space.
- At N=3, a primitive root satisfies X²+X+1=0 and is not rational, whereas the
  canonical μ₃ embedding in Tate(q) is defined over ℚ((q)). Replacing it by an
  unexplained rational point of order 3 would change the rational model.
- With q=t², q−24q² becomes t²−24t⁴; t↦−t preserves these terms and the zero
  constant. Cusp conditions concern the expansion, not a preferred root parameter.
- Under ℚ→ℚ[ε]/(ε²), the arithmetic value Δ pulls back to Δ, whereas its multiple
  (1+ε)Δ has coefficients 1+ε and −24−24ε. Reducing to the geometric fibre loses
  these nonzero nilpotent terms, so naturality concerns whole families.
- Replacing η by 2η changes the scalar of a weight-one value from 1 to 1/2,
  and that of a weight-two value from 1 to 1/4; using u^k reverses the convention.
- The element −1 at levels 1 and 2 acts by (−1)^k on the differential power:
  odd-weight sections must be zero. The weight-one form η(z)η(23z) has a₁=1,
  so the same vanishing assertion cannot be imposed at every level.
- Over ℚ(√2), √2Δ has a₁=√2 and does not descend to ℚ; Δ/11 does descend,
  with a₁=1/11. Rational descent is distinct from integral coefficients.
- On Tate(q) over ℂ((q^(1/N))), the level structure ζ ↦ q^(1/N) is the point z/N of E_z and
  gives the expansion at the cusp 0, the standard ζ ↦ ζ is the point 1/N and gives the
  expansion at ∞; at N = 1 the two coincide, as there is one cusp. Reading the cusp-0
  expansion of a form of level N > 1 from the standard structure would be a different
  form's expansion.
- At N = 1 with auxiliary level 4, a form on Γ₁(4) fixed by the slash action of SL₂(ℤ)
  satisfies f(i) = i^(−k)f(i), so it vanishes at i unless 4 ∣ k: E₆(i) = 0 while Δ(i) ≠ 0.
  The quotient Γ₁(4)\ℍ alone has no elliptic point and would not record this stabilizer.
- At N = 2 the auxiliary level is 5, not 4: Γ₁(2) ∩ Γ₁(4) = Γ₁(4) is not Γ₁(2M) for a
  level M coprime to 2, and the descent condition would not be a condition on a μ₁₀-structure.

*Needs:* ModularCurves Layers 1–5 and §§9A–9B for elliptic families, level moduli,
isogenies and descent, §4C and §0E for the auxiliary-level descent, and Layer 10 for the
Tate curve over ℤ[1/N₀]((q)); §10D for the uniformisation, the complex Tate curve and the
algebraicity of holomorphic sections; Mathlib differential, tensor and power-series carriers;
§0.1 for the analytic character action. The canonical μ_N-embedding and Tate evaluation,
all-cusp Laurent criterion, analytic comparison and field-base-change theorem are targets of
this subsection.

### 8.1 Rational descent and the weight-one lattice

Apply §8.0 to identify the arithmetic cusp space over ℚ with the native analytic cusp
forms having rational q-expansion. For every characteristic-zero field K the canonical
map K⊗_ℚ S_k^arith(N,ℚ) → S_k^arith(N,K) is an isomorphism; its K=ℂ specialization
is `rationalCuspFormSpan`. This includes k=1 and the diamond action, before any
coefficient-field or Galois-conjugacy assertion (Deligne–Serre §2.6, equation (2.6.1), p.512).

For weight one, form the actual subgroup L of rational cusp forms whose expansions at
infinity after every diamond translate have integral coefficients. Prove that it is finite
free, spans S₁ over ℂ, and is stable under all good Hecke operators and diamonds
(Deligne–Serre Proposition 2.7, p.512). Spanning needs bounded denominators, not just
q-expansion injectivity. For that input, multiplication by Δ embeds S₁(Γ₁(N)) into
S₁₃(Γ₁(N)). The native newform decomposition and coefficient integrality in weight 13 give
bounded denominators for a rational form there: choose a basis of degeneracy images with
algebraic-integral coefficients, invert a nonsingular finite coefficient matrix to express
the rational form, and clear the finitely many algebraic denominators. Rational coefficients
that become algebraic integers are integers. Multiplication by
Δ⁻¹=q⁻¹∏(1−qⁿ)⁻²⁴ then preserves a single denominator bound. Apply this to each diamond
translate; there are finitely many of them (Deligne–Serre Remark 2.8, p.512).

The lattice API includes:

- An injective inclusion of a finite free ℤ-module into the rational cusp space.
- Equality of its complex span with the whole analytic cusp space.
- Integral matrices for the good Hecke and diamond actions in every integral basis.
 Prove bad-prime Uₚ-stability separately: Uₚ commutes with
diamonds and extracts the coefficients a_(pn), so it preserves integrality after every
diamond translate. This gives a finite integral algebra for all positive Hecke indices,
not just the good ones. Its eigenvalue homomorphism on a normalized weight-one newform
has finite integral image; the native coefficient recurrences then prove
`weightOneCoefficientField` and `weightOneCoefficientIntegral`, including every prime
(Deligne–Serre Proposition 2.7; Diamond–Shurman §5.2 for the bad-prime coefficient formula).

**Checks.**
- A rational basis b₁,…,b_r with common denominator D becomes Db₁,…,Db_r in L;
  the complex span still has dimension r. The subgroup {0} fails this when r>0.
- The rational form Δ/11 has first coefficient 1/11, so clearing only primes away
  from the level 11 is insufficient. Multiplication by 11 gives first coefficient 1.
- For f=η(z)η(23z), the first terms are q−q²−q³+…; fΔ starts q²−25q³+…,
  and multiplication by Δ⁻¹ recovers (a₁,a₂)=(1,−1) with denominator 1.
- At level one S₁=0, so L has rank 0; this does not justify replacing every lattice by zero.
- On an integral series q−q²−q³+…, U₂ has first coefficient −1; every coefficient
  remains an integer because it is an existing coefficient of the original series.

*Needs:* §8.0 for arithmetic cusp forms, rational descent and the all-weight analytic comparison;
the native weight-13 newform decomposition
and coefficient integrality; Mathlib Δ, its nonvanishing and integral inverse expansion;
native Hecke action, diamond commutation and the bad-prime coefficient formula.

### 8.2 Galois stability and rational Hecke algebras

For a positive-weight newform f and every ℚ-embedding σ of its embedded coefficient field
into ℂ, prove `existsUniqueGaloisConjugate`: there is a unique newform g of the same level and
weight with aₙ(g)=σ(aₙ(f)) for every positive n, and χ_g(u)=σ(χ_f(u)) for every unit u.
Use rational descent and the arithmetic Hecke action, not termwise application of a
discontinuous automorphism to a holomorphic function (Deligne–Serre Proposition 2.7(4),
p.512; Diamond–Shurman §6.5).

Descend the finite newspace Hecke algebra to ℚ(χ) for fixed character and to ℚ over a whole
character orbit. Prove that base extension recovers the complex algebra and its newform
characters, and that the characteristic polynomial of each Tₙ is the product of
Norm_(K_f/ℚ(χ))(X−aₙ(f)) over relative orbits. Over the whole character orbit use ℚ.
Factors may repeat, and one Hecke operator need not generate a coefficient field.

The orbit API includes:

- Independence from extending σ to ℂ, and the identity and composition laws.
- Transport of the character by the same field embedding.
- Orbit cardinality [K_f:ℚ], and relative cardinality [K_f:ℚ(χ)].

The fixed-character rational structure must be built before using the norm factorization.

**Checks.**
- Δ has K_f=ℚ: the identity embedding gives Δ and an orbit of size 1.
- For a quadratic coefficient field and an element a=√2 generating it, the two
  embeddings give ±√2 and norm factor X²−2; for a=1 the factor is (X−1)² instead.
- For a quartic nebentypus with χ(u)=i, complex conjugation gives −i; it leaves the
  character orbit invariant but does not preserve that fixed character space.
- A zero-dimensional newspace has characteristic polynomial 1, the empty orbit product.

*Needs:* §§8.0–8.1 for the all-weight analytic comparison and rational descent;
native coefficient and character
fields, complex newform basis and Hecke character correspondence; §5.1 for uniqueness.

### Examples

The rank-zero lattice and the nonzero weight-one eta product test spanning in both cases.
The factors X²−2 and (X−1)² distinguish a joint eigensystem from one eigenvalue.

### Dependencies

The weight-at-least-two integral-period route is supplied. The weight-one route uses rational
descent and bounded denominators explicitly; the Galois route uses that same rational descent.

## Layer 9: newform invariants and twists

### 9.1 Galois transport and self-duality

For every coefficient-field embedding σ and every prime p, prove that the Satake multiset
of f^σ is the multiset obtained by applying any extension of σ to the two algebraic roots
of X²−aₚX+χ(p)p^(k−1). The resulting multiset is independent of that extension, because
it is determined by the transformed polynomial. Include bad primes: their multisets are
{aₚ,0}, with multiplicity if aₚ=0 (Diamond–Shurman §§5.9, 6.5).

Define literal self-duality by f=f.conj, using the native conjugate newform. Its API includes:

- Equality with its contragredient if and only if every coefficient aₙ is real.
- Compatibility with the inverse-character contract; literal self-duality forces χ=χ⁻¹.
- The separate predicate of being equal to the contragredient up to a primitive twist.

The conditional angle contract is used only with its reality and bound hypotheses; a field
embedding into ℂ is not assumed to preserve a real angle.

**Checks.**
- For Δ at p=2, the polynomial is X²+24X+2048, with sum −24 and product 2048.
- At the level-11 bad prime with a₁₁=1 the roots are {1,0}, with product 0;
  inserting 11 for the determinant would violate the linear Euler factor.
- For aₚ=0, trivial character and weight one, the roots are i and −i and θₚ=π/2;
  for aₚ=2 the repeated root is 1 and θₚ=0.
- For real aₚ=3 in weight one the bound fails; an angle with 3=2cos θ does not exist.
- Coefficients 1 and −24 are fixed by conjugation, whereas i goes to −i, so a form
  with coefficient i cannot be literally self-dual.
- A quartic character with value i is transported to the inverse value −i; self-duality
  would force i=−i, so that character excludes it.
- The zero function is real but is not a newform, since its first coefficient is 0≠1.

*Needs:* native newforms and coefficient fields; §8.2; Mathlib polynomial roots and real cosine.

### 9.2 Character twists and inner twists

For a Dirichlet character ψ of specified positive modulus m, `existsCoefficientTwist`
asserts existence of the following cusp form. Define the coefficient twist by
aₙ(f⊗ψ)=ψ(n)aₙ(f), using its actual zero extension. Prove modularity and cuspidality at
level Nm² with nebentypus χψ² transported to that level: write ψ(n) as a finite sum of
additive characters e(nv/m), so that f⊗ψ is a combination of the translates f(z+v/m), and
conjugate Γ₁(Nm²) into Γ₁(N) by the translations (1, v/m; 0, 1) (Shimura, Proposition 3.64;
Miyake, Lemma 4.3.10(2)). For primitive ψ of conductor r,
prove the sharper bound lcm(N,r·cond(χψ),r²) for the twist, with the character conductors
computed after passage to a common modulus (Atkin–Li, Theorem 3.1).

For imprimitive ψ induced by ψ₀, the primitive character of conductor r∣m, prove the
identity between f⊗ψ and the depletion of f⊗ψ₀ at the primes dividing m but not r.
For p prime, depletion is 1−VₚUₚ on expansions, with Uₚ extracting coefficients a_(pn)
and Vₚ replacing q by qᵖ. It kills exactly the coefficients whose indices are divisible
by p; justify each modular source and target level in the Nm² theorem. The sharp
conductor bound is not asserted for an arbitrary modulus-m zero extension.

Pass to the primitive associate of the twist using Layer 4. Fix an algebraic closure ℚ̄⊆ℂ containing the coefficients. An inner twist consists of an
automorphism σ of ℚ̄ over ℚ preserving K_f and a primitive Dirichlet character ψ with
f^σ=primitive(f⊗ψ). Identify characters by their primitive inducing character before forming
the group. The composition law for applying (τ,φ) then (σ,ψ) is
(σ∘τ, primitive(ψ·σ(φ))). Here σ acts on every value of φ by its specified action on ℚ̄;
a restriction to K_f alone is not used to define an action on arbitrary roots of unity. Self-twists have σ=id, and a nontrivial quadratic self-twist is the
CM case (Atkin–Li §§3–4).

The twist API includes:

- The coefficient formula at every index, with identity and composition retaining depletion.
- Character transport and compatibility with the primitive associate.
- Identity, inverse and composition for the inner-twist group on the specified automorphisms.
 Do not identify raw twists
with their primitive associates at bad indices.

**Checks.**
- The primitive trivial twist of Δ is Δ, with (a₁,a₂)=(1,−24).
- The trivial character modulo 2 has conductor 1 but zero value at every even integer.
  Its twist has (a₁,a₂)=(1,0), the 2-depletion, with level 4 available; it is not Δ.
- Applying 1−V₂U₂ to q−24q²+252q³ gives q+252q³. Applying it twice gives the same
  expansion, so a repeated prime in m does not cause a second independent depletion.
- The identity inner twist is (id,1). A nontrivial quadratic ψ has ψ²=1 on units,
  but the raw double twist still deletes coefficients at primes in its modulus; only
  passage to primitive associates recovers the group law.

*Needs:* native Hecke coefficient formulas, character conductors and level raises; Layers 4,
5 and 8; Atkin–Li twisting and partial Atkin–Lehner relations.

### 9.3 Trace forms and orbit separation

For a Galois orbit O of newforms define its trace form as Σ_(g∈O)g in S_k(Γ₁(N)).
Its coefficient is Tr_(K_f/ℚ)(aₙ(f)), an integer, and its first coefficient is [K_f:ℚ].
For fixed N,k and character orbit [χ], distinct newform orbits have distinct trace vectors
(a₁,…,a_B), B=⌊k[SL₂(ℤ):Γ₁(N)]/12⌋. Indeed their disjoint sums of independent normalized
newforms are distinct, and Sturm's theorem separates them by a coefficient with n≤B.
This also proves independence of choosing a representative f (Diamond–Shurman §§5.8, 6.5;
Sturm's coefficient-uniqueness theorem).

The trace-form API includes:

- Integral coefficients and invariance under the coefficient Galois action.
- Additivity for disjoint unions of orbits.
- Completeness: orbit degrees sum to the newspace dimension, so distinct orbits whose
  degrees have that sum exhaust the orbit set.
 Define labels by level, weight,
character orbit and the lexicographic order of these trace vectors, with the integer
position encoded as a=0,…,z=25,ba=26. Order the character orbits with the trivial orbit
first and the others lexicographically by their integer-valued character-trace vectors
on the unit representatives 1≤u≤N in increasing order. These mathematical labels agree
with external labels only when the character and trace-vector ordering conventions agree.
The bad-prime set is the set of prime divisors of the primitive level, not of a chosen
larger ambient level.

**Checks.**
- The level-11 weight-two rational orbit has first trace coefficient 1 and occupies
  the entire one-dimensional newspace, giving 11.2.a.a.
- For a quadratic orbit with a₂=√2, the first two trace coefficients are (2,0);
  replacing the trace form by one representative would give (1,√2).
- Distinct one-dimensional eigensystems can agree at a₂; equality of just that entry
  is not the separation criterion. Equality through B forces equality of trace forms.
- At N=1 the bad-prime set is empty; at N=12 it is {2,3}, without multiplicities.
- A primitive level-11 form viewed at level 22 still has bad-prime set {11}, excluding 2.
- The empty orbit union has trace form 0; the union of two singleton rational orbits has
  first coefficient 2=1+1, not 1.
- Integer positions 25 and 26 encode z and ba, not z and aa.

*Needs:* §8.2, native newform linear independence, finite-index Sturm bound and §10C.

### Examples

The Δ depletion tests the distinction between a modulus and a conductor. Quadratic traces
test the distinction between an orbit sum and an individual eigenform.

### Dependencies

No Galois-group checker is built. The coefficient-field example below uses the separate
polynomial Galois-group supplier.

## Layer 10: the analytic modular curve and dimension formulas

### 10A Arithmetic specialization of the quotient

For a congruence subgroup Γ≤SL₂(ℤ), specialize the Fuchsian compactification to X(Γ).
Identify its cusp orbits with Γ-orbits on ℙ¹(ℚ) and its elliptic points with the effective
stabilizers of orders 2 and 3. Define ε₂, ε₃, ε∞ as the cardinalities of these finite
sets, and distinguish regular from irregular cusps. Prove their invariance under conjugacy,
the cusp-width sum, and the explicit congruence-subgroup formulas for Γ₀(N), Γ₁(N) and Γ(N)
(Diamond–Shurman §§3.7–3.9).

Identify the degree of X(Γ)→X(1) with d=[PSL₂(ℤ):Γ̄]. Prove that the local multiplicities
are the elliptic stabilizer and cusp-width ratios, then apply Riemann–Hurwitz to obtain
`g = 1 + d/12 - epsilon2/4 - epsilon3/3 - epsilonInfinity/2`.
Use the supplied X(1)≃ℙ¹; no normalized j-input is exported back from this layer.

**Checks.**
- For Γ₀(11), (d,ε₂,ε₃,ε∞)=(12,0,0,2), giving g=1+1−1=1.
- For Γ₀(2), (d,ε₂,ε₃,ε∞)=(3,1,0,2), giving g=1+1/4−1/4−1=0.
- For Γ₁(13), the full index is 168, the projective index is 84 and there are 12
  cusps with no elliptic points; g=1+7−6=2. Using 168 gives the wrong genus 9.
- At level one (d,ε₂,ε₃,ε∞)=(1,1,1,1), giving 1+1/12−1/4−1/3−1/2=0.

*Needs:* FuchsianOrbifolds Layers 0–6, native congruence subgroups and their arithmetic indices.

### 10B Compact-Riemann-surface cohomology

For a nonempty connected compact Riemann surface X, construct its holomorphic structure sheaf,
the sheaf of sections of each holomorphic line bundle L, and the divisor sheaf 𝒪(D).
Construct Čech H⁰ and H¹ with refinement maps, identify H⁰ with global sections and prove
refinement independence using the degree-one Leray theorem. Acyclicity of discs comes from
the local ∂̄-lemma, which is a target asserting local solutions, unique modulo holomorphic
sections, with restricted solutions solving the restricted equation; it is not a consequence of having an abstract Čech complex
(Forster, §§12–14).

The sheaf/cohomology API includes:

- Restriction and gluing, line-bundle isomorphism invariance and finite direct sums.
- The divisor inclusion 𝒪(D)→𝒪(D+P), with quotient the point skyscraper.
- The six-term cohomology sequence induced by that exact sequence.
 Prove H⁰(X,𝒪)=ℂ by the maximum principle and
H¹(X,ℂ_P)=0. Every map in the sequence is induced from the named sheaf map.

**Checks.**
- On the empty surface H⁰(𝒪)=0≠ℂ, so nonemptiness is essential.
- On ℙ¹, H⁰(𝒪) has dimension 1 and H¹(𝒪) has dimension 0; the zero sheaf has
  both groups zero.
- For the point skyscraper ℂ_P, H⁰ is ℂ and H¹ is zero; treating its support as
  empty would incorrectly give H⁰=0.
- On ℙ¹ the sequence for 𝒪(−P)→𝒪 gives dimensions 0→0→1→1→0→0;
  the evaluation map ℂ→ℂ is the identity in the constant trivialization.

Prove finite-dimensionality of H¹(X,L) for every holomorphic line bundle, not just
𝒪(D). A route uses finite coordinate covers, L² estimates on cochains, Cauchy–Taylor
estimates for restriction to smaller discs, partitions of unity and local ∂̄ solutions,
and the open-mapping theorem for uniform lifting. The estimates must apply in line-bundle
trivializations and be compatible on overlaps (Forster §14).

Prove Riemann–Roch first for divisor sheaves by successive point twists:
χ(𝒪(D))=deg D+1−g_an, with g_an=dim H¹(X,𝒪). For arbitrary L, use the staircase
L(nP): every point twist raises χ by 1, and each failure of h⁰ to rise lowers the finite
number h¹. Thus L admits a nonzero meromorphic section, L≃𝒪(D), and the divisor
formula applies. The degree is independent of that section because a principal divisor
has degree zero, proved by the residue theorem for df/f (Forster §§15–16).

Construct meromorphic differentials and the canonical bundle K. The residue pairing
H¹(X,L)×H⁰(X,K⊗L⁻¹)→ℂ must be perfect. Deduce Serre duality, h⁰(K)=g_an,
deg K=2g_an−2, and H¹(X,L)=0 when deg L>2g_an−2. The API includes functoriality
under line-bundle isomorphisms, bilinearity, representative independence and identification
of the two dual vector spaces (Forster §17).

**Checks.**
- On ℙ¹, 𝒪(−2) has (h⁰,h¹)=(0,1) and χ=−1=−2+1; 𝒪(−1) has (0,0).
- On ℙ¹, 𝒪 has (1,0) and deg K=−2. On a genus-one surface, 𝒪 has (1,1)
  and deg K=0; omitting h¹ in Riemann–Roch would give 1=0.
- On genus one, L=𝒪 has degree 0=2g−2 and H¹ dimension 1: the vanishing threshold
  must be strict. A degree-one line bundle has (h⁰,h¹)=(1,0).
- For a point twist, χ(L(P))−χ(L)=1; if h⁰ does not change, h¹ drops by exactly 1.
  It cannot do so more than h¹(L) times, which forces a nonzero meromorphic section.

Define analytic genus by g_an=dim H¹(X,𝒪), then prove equality with the topological genus
of the shared surface carrier. Construct a finite meromorphic map X→ℙ¹ using a line
bundle of sufficiently large degree and Riemann–Roch. Its canonical-divisor formula gives
2g_an(X)−2=−2deg(f)+deg(R_f). Compare this with the independent topological
Riemann–Hurwitz formula. For X(Γ) the map through X(1) provides the required finite map.
The generic comparison is proved for every connected compact Riemann surface
(Forster §§17,19; FuchsianOrbifolds Layer 5).

**Checks.**
- The identity ℙ¹→ℙ¹ has degree 1 and ramification degree 0, so both genus formulas give −2.
- The power map z↦z² on ℙ¹ has degree 2 and two simple ramification points, giving
  −2=−4+2; omitting either endpoint gives −3.
- A degree-two map from a genus-one surface branched at four points gives 0=−4+4,
  hence analytic and topological genus both equal 1.

*Needs:* FuchsianOrbifolds Layers 4–5 for the surface, degree and topological genus; Mathlib
complex analysis, sheaf and Čech algebra, Hilbert-space and open-mapping theory; the local
∂̄, finiteness, residue and point-twist targets in this subsection in the order given.

### 10C Automorphy sheaves and exact dimensions

For Γ congruence and weight k, construct the automorphy line bundle on the coarse compact
curve when the ineffective stabilizer acts trivially. At an elliptic chart descend the
invariant sections; at a regular or irregular cusp use the geometric order dictionary of
§1.1. Specify transitions and prove their cocycle law. If −I∈Γ and k is odd, the form
space is zero by parity; do not assign it a spurious rank-one descent. The API identifies
holomorphic sections with M_k(Γ), sections with the cusp condition with S_k(Γ), and tracks
all floor corrections to the degrees. At k=2 it identifies cusp forms with holomorphic
differentials. At odd weight a meromorphic reference section is supplied by §10B's theorem
for all line bundles, not by an assumed square root (Diamond–Shurman §§3.5–3.6).

**Checks.**
- At level one and weight 2, M₂=0 even though meromorphic weight-two forms exist;
  a holomorphic trivialization must not be assumed.
- At an irregular cusp an odd leading exponent 1 contributes 1/2 to the order;
  its square contributes 1. On the coarse curve the multiplication map can acquire a
  cusp zero: the descended weight-one line squared need not be the weight-two line.
- At −I, weight 3 and trivial character give the scalar −1, so invariant sections
  vanish; weight 4 gives +1 and permits E₄.

For even k≥2 prove
`dim M_k = (k-1)(g-1) + floor(k/4)*epsilon2 + floor(k/3)*epsilon3 + (k/2)*epsilonInfinity`.
For even k≥4 replace the final coefficient by k/2−1 for S_k; at k=2,
dim S₂=g. At k=0, dim M₀=1 and dim S₀=0; negative weights vanish. These formulas use
the actual invariants of X(Γ), not arbitrary scalar parameters. Upper bounds follow from
valence; Riemann–Roch and duality supply lower bounds (Diamond–Shurman, Theorem 3.5.1).

For odd k≥3 and −I∉Γ, ε₂=0. Writing c_reg and c_irr for the two cusp counts, prove
`dim M_k = (k-1)(g-1) + floor(k/3)*epsilon3 + (k/2)*c_reg + ((k-1)/2)*c_irr`,
and replace k/2 by (k−2)/2 for S_k. Interpret halves in ℚ and prove the resulting values
are nonnegative integers. At weight one state the exact exceptional relation
`dim M_1 - dim S_1 = c_reg/2`; if c_reg>2g−2, then dim S₁=0 and dim M₁=c_reg/2;
otherwise dim S₁≤g and dim M₁≤g+c_reg/2. Do not assert a dimension determined only by
(g,ε₂,ε₃,c_reg,c_irr) in that exceptional range (Diamond–Shurman, Theorem 3.6.1,
with the author errata for pp.74–75 and 90).

**Checks.**
- At Γ₀(11), k=2 gives dim M₂=0+2=2 and dim S₂=1; at Γ₀(23), dim S₂=2.
- At Γ₀(2), dim S₂=0; at Γ₁(13), dim S₂=2. These distinguish Γ₀ from Γ₁.
- At level one and k=12 the formula gives dim M₁₂=−11+3+4+6=2 and dim S₁₂=1.
- At Γ(3), (g,ε₃,c_reg,c_irr)=(0,0,4,0); k=3 gives dim M₃=−2+6=4
  and dim S₃=−2+2=0, while k=1 gives dim M₁=2 and dim S₁=0.

Prove `newspaceDimension` for all integer weights and positive N:
`dim S_k(Gamma1(N))^new = sum_{M | N} beta(N/M)*dim S_k(Gamma1(M))`,
where β=μ*μ, so β(1)=1, β(p)=−2, β(p²)=1 and β(pʳ)=0 for r≥3.
The input is the all-divisor decomposition
`S_k(Gamma1(N)) = directSum_{M | N, d | N/M} V_d S_k(Gamma1(M))^new`.
Here M=N must be retained. Distinct primitive systems are separated by §5.1; for a fixed
normalized g, the degeneracy images have distinct leading exponents qᵈ. Take dimensions
and apply divisor convolution inversion. For fixed χ restrict to cond(χ)∣M∣N and χ_M;
the same β formula applies, including trivial character (Diamond–Shurman, Theorem 5.8.3).

**Checks.**
- At level 11 and weight two, new dimension is 1−2·0=1.
- For Γ₀(22) with trivial character it is 2−2·1−2·0+4·0=0, with the oldspace
  generated by f and f(2z). For Γ₁(22), genus 6 instead gives 6−2·1=4;
  using the Γ₀ dimension in the all-character formula would give the wrong answer.
- At Γ₁(13), new dimension is 2; at Γ₀(13) it is 0.
- Convolution with the divisor count gives 2−2=0 at p, 3−4+1=0 at p² and
  4−6+2=0 at p³, testing the signs and the zero higher coefficients.

*Needs:* §10A counts, §10B cohomology and genus comparison, §1.1 orders, native finite-index
Sturm finiteness; §3.1, §5.1 and native decomposition for the newspace identity.

### 10D Uniformisation of the level moduli and algebraicity of sections

For z ∈ ℍ write Λ_z = ℤ + ℤz, E_z = ℂ/Λ_z and q = exp(2πiz). For a lattice Λ ⊂ ℂ let E_Λ be
the Weierstrass curve Y² = X³ − (g₂(Λ)/4)X − g₃(Λ)/4, with g₂ = 60G₄(Λ) and g₃ = 140G₆(Λ) the
native lattice sums; every elliptic curve over ℂ is a Weierstrass curve, and isomorphisms
between Weierstrass curves are variable changes (ModularCurves §1C).

Prove the lattice–modular comparison: for m ≥ 2, G_(2m)(Λ_z) = 2ζ(2m)E_(2m)(z), with E_(2m)
the native normalized Eisenstein series of constant term 1. Hence g₂(Λ_z) = (4π⁴/3)E₄(z),
g₃(Λ_z) = (8π⁶/27)E₆(z), g₂³ − 27g₃² = (2π)¹²Δ(z), and the Mathlib j-invariant of E_Λ at
Λ = Λ_z is 1728g₂³/(g₂³ − 27g₃²) = E₄³/Δ = j(z) (Milne, Proposition 3.10; milne-mf lines
2090–2103).

Prove the uniformisation of complex elliptic curves: u ↦ (℘_Λ(u), ℘′_Λ(u)/2) for u ∉ Λ, and
u ↦ ∞ for u ∈ Λ, is a bijection ℂ/Λ → E_Λ(ℂ) and a group isomorphism for the Weierstrass
group law; it identifies (1/N)Λ/Λ with E_Λ(ℂ)[N]. Every elliptic curve E over ℂ is
isomorphic to some E_Λ with Λ = Λ_z: the equation j(z) = j(E) has a solution because the
descended j is the degree-one map X(1) → ℙ¹ of §10A, and
`WeierstrassCurve.exists_variableChange_of_j_eq` over ℂ supplies the isomorphism. Prove
homogeneity ℘_(αΛ)(αu) = α⁻²℘_Λ(u), and that every isomorphism E_Λ → E_(Λ′) of elliptic
curves is induced by u ↦ αu for a unique α with αΛ = Λ′: transported through the
parametrizations it is a holomorphic map ℂ/Λ → ℂ/Λ′ fixing 0, which lifts through the
universal covering ℂ → ℂ/Λ to an entire function with doubly periodic derivative, hence to
u ↦ αu (Milne, Propositions 3.3 and 3.12 with its addition formula, and Corollary 3.5;
milne-mf lines 1946–1975 and 2165–2175).

Prove the moduli bijection: for N ≥ 1, z ↦ (E_z, α_z) with α_z(exp(2πi/N)) = 1/N induces a
bijection from Γ₁(N)\ℍ to the isomorphism classes of pairs (E, α) over ℂ, E an elliptic
curve and α: μ_N ↪ E[N], the μ_N-marked structure of ModularCurves Layer 3 over ℂ, which the
choice exp(2πi/N) identifies with a point of exact order N. Indeed an isomorphism
(E_z, α_z) ≅ (E_(z′), α_(z′)) is u ↦ αu with αΛ_z = Λ_(z′), which forces z′ = γz for some
γ = (a, b; c, d) ∈ SL₂(ℤ) and α = (cz+d)⁻¹, and then α·(1/N) ≡ 1/N modulo Λ_(z′) exactly when
c ≡ 0 and d ≡ 1 modulo N (Milne, Lemma 8.7, for the full-level pattern; milne-mf lines
5157–5162; Diamond–Shurman, Theorem 1.5.1).

Prove the Riemann-surface structure of the fine curve for N ≥ 4: give the ℂ-points of the
smooth affine plane model of Y₁(N) of ModularCurves §5A the complex structure whose chart at
each point is supplied by the implicit function theorem (smoothness supplies a nonvanishing
partial derivative), so that regular functions are holomorphic and an algebraic uniformizer
at a ℂ-point is an analytic coordinate there. Prove that the division values
z ↦ ℘(x+yz; Λ_z) and z ↦ ℘′(x+yz; Λ_z) are holomorphic on ℍ for fixed rational (x,y) ∉ ℤ²,
by the locally uniform convergence of the lattice sums in z (as for the Eisenstein series:
Milne, Proposition 3.10). The Tate normal form of (E_z, 1/N) has coefficients that are
rational functions of g₂(Λ_z), g₃(Λ_z) and the division values at 1/N, hence holomorphic,
and z ↦ that point is a holomorphic map ℍ → Y₁(N)(ℂ) which factors through Γ₁(N)\ℍ and is bijective there
by the moduli bijection and the universal property of §5A. A bijective holomorphic map of
Riemann surfaces is biholomorphic (the open mapping theorem, and the nonvanishing derivative
of an injective holomorphic function), so Γ₁(N)\ℍ ≅ Y₁(N)(ℂ) as Riemann surfaces, and the
analytic order of a regular function at a point equals its algebraic order.

Prove the complex Tate curve: for z ∈ ℍ, u ↦ t = exp(2πiu) induces E_z ≅ ℂˣ/q^ℤ, and the
Tate curve of ModularCurves Layer 10, base-changed to ℂ((q)) and evaluated at q, whose
coefficient series converge for |q| < 1, is isomorphic to E_Λ at Λ = Λ_z through (2πi)⁻²℘(u; Λ_z) − 1/12 = X_Tate(t), with
dt/t = 2πi du and the canonical μ_N ⊂ ℂˣ corresponding to α_z (Silverman, Advanced Topics,
Theorem V.1.1; deligne-serre lines 168–194). Consequently the Tate expansion of a rule of
§8.0 at the standard cusp is the q-expansion of its analytic avatar, coefficient by
coefficient, and the expansion at the level structure ζ ↦ ζ^d q^(c/N), for γ = (a, b; c, d) in
SL₂(ℤ), is the expansion of f|_kγ at the cusp γ(∞). In particular regular functions on Y₁(N)
are meromorphic at every cusp of the compact Riemann surface X₁(N)^an = Γ₁(N)\ℍ* of
FuchsianOrbifolds Layer 4, whose cusp coordinates are the parameters q^(1/w).

Prove algebraicity for N ≥ 4: the field of meromorphic functions on X₁(N)^an is ℂ(Y₁(N)),
inside the Γ₁(N)-invariant meromorphic functions on ℍ. Regular functions are meromorphic on
X₁(N)^an by the previous paragraphs. Conversely j has analytic degree d = [PSL₂(ℤ):Γ̄₁(N)] on
X₁(N)^an (§10A); a meromorphic function on a compact Riemann surface carrying a degree-d map
to ℙ¹ is algebraic of degree at most d over the pulled-back field, by the elementary
symmetric functions of its values on fibres (Forster, §8); and ℂ(Y₁(N)) has degree at least
d over ℂ(j), because the regular functions of an affine scheme of finite type separate the d
points of a fibre over which j is unramified, and continue to separate the nearby fibres. So
the degree of the meromorphic function field over ℂ(j) is at most d and at least the degree of
ℂ(Y₁(N)), which forces equality. Then, for every integer k, let s be a nonzero rational section
of ω over Y₁(N); its avatar s^an is a meromorphic function on ℍ with s^an(γz) = (cz+d)s^an(z),
because ω restricted to E_z is spanned by du and the isomorphism E_z → E_(γz), u ↦ u/(cz+d),
pulls du back to (cz+d)⁻¹du. For f in the native M_k(Γ₁(N)), the quotient f/(s^an)^k is a
Γ₁(N)-invariant meromorphic function, meromorphic at every cusp, hence a rational function
φ, and f = φ·(s^an)^k is the avatar of the rational section φs^k of ω^k, regular at each
ℂ-point of Y₁(N) by the order comparison and holomorphic in every Tate expansion by the cusp
comparison. This is the surjectivity input of §8.0, which extends it to N ≤ 3 through the
auxiliary level.

No analytification functor on complex schemes, no comparison for arbitrary coherent sheaves and
no compactified algebraic curve X₁(N) is constructed: the cusps enter only through the complex
Tate curve and the Fuchsian compactification.

The comparison API includes:

- The lattice–modular comparison for every even weight at least four, with the constants
  2ζ(2m), and homogeneity g₂(αΛ) = α⁻⁴g₂(Λ), g₃(αΛ) = α⁻⁶g₃(Λ).
- The uniformisation bijection is a group isomorphism and identifies the N-torsion with
  (1/N)Λ/Λ; isomorphisms of pairs are the scalars α with αΛ = Λ′ carrying the marked point.
- Naturality of the moduli bijection for the inclusions Γ₁(NM) ⊂ Γ₁(N), which forget the
  auxiliary marking, and for the diamond action: ⟨d⟩ acts on pairs by precomposing α with
  multiplication by d on μ_N.
- Under the biholomorphism the pullback of ω along ℍ → Y₁(N)(ℂ) is trivialized by du, and the
  transition (cz+d)⁻¹ identifies ω^an with the weight-one automorphy line bundle of §10C.
- Equality of algebraic and analytic orders of rational sections at ℂ-points, and of the
  Tate order in q^(1/w) with the analytic order at each cusp.

**Checks.**
- With g₂ = (4π⁴/3)E₄ and g₃ = (8π⁶/27)E₆, 1728g₂³/(g₂³ − 27g₃²) = 1728·64/(27·4096)·E₄³/Δ
  = E₄³/Δ, since 1728·64 = 27·4096 = 110592. Taking g₂ = 60E₄ and g₃ = 140E₆ without the
  zeta constants gives a function with constant term 1728·216000/(216000 − 529200) at the
  cusp, with no pole there, whereas j has a simple pole.
- The rule (E, ω) ↦ c₄ of the Weierstrass model adapted to ω evaluates at (E_z, 2πi du) to
  12g₂(Λ_z)/(2πi)⁴ = E₄(z) = 1 + 240q + ⋯, and at (E_z, du) to 16π⁴E₄(z). The discriminant
  rule evaluates at (E_z, 2πi du) to (2π)¹²Δ(z)/(2πi)¹² = Δ(z) = q − 24q² + ⋯.
- The automorphism −1 of E_z fixes 1/N modulo Λ_z exactly when 2/N ∈ Λ_z, that is for N ≤ 2,
  matching −I ∈ Γ₁(N) exactly for N ≤ 2. At N = 3 and z₀ = 1/2 + i√3/6, the fixed point of
  (1, −1; 3, −2) ∈ Γ₁(3), multiplication by ρ = exp(2πi/3) fixes 1/3 because
  (ρ − 1)/3 = z₀ − 1 ∈ Λ_(z₀); so (E_(z₀), 1/3) has an automorphism of order 3, and the fine
  threshold N ≥ 4 of §5A is sharp.
- For γ ∈ Γ₀(N) with lower-right entry d, the point (cz+d)/N is congruent to d/N modulo Λ_z,
  so the diamond ⟨d⟩ is α ↦ α∘[d]; for γ = S the point is z/N, the Tate point q^(1/N), and the
  expansion of f|S at the cusp 0 is a series in q^(1/N), the width of that cusp for Γ₁(N).
- At level one d = 1, and the field equality is the degree-one statement X(1) ≃ ℙ¹ with
  function field ℂ(j); for Γ₁(13), d = 84, so no meromorphic function on X₁(13)^an has degree
  85 over ℂ(j). At a point over j = 1728 the fibre of X₁(13)^an → X(1) has 42 points, each
  with multiplicity 2; the separation argument uses fibres over j ∉ {0, 1728, ∞}.
- Dividing E₄ at level 4 by (s^an)⁴, for a rational section s with a simple pole at a point
  P where E₄ does not vanish, gives a rational function with a zero of order 4 at P;
  multiplying back by s⁴ returns a section regular at P. Equality of algebraic and analytic
  orders is what excludes a spurious pole there.

*Needs:* §10A for the degree of j and X(1) ≃ ℙ¹; FuchsianOrbifolds Layers 3–4 for cusp
coordinates and X₁(N)^an; ModularCurves §§1C, 3N, 5A, 4C, 0E and 9E and Layer 10 for variable
changes, level structures, the fine curve, descent, the coarse j-line and the Tate curve;
Mathlib ℘, the lattice sums, the j-invariant isomorphism theorem, the Eisenstein series, and
the implicit-function, open-mapping and removable-singularity theorems. The lattice–modular
comparison, the uniformisation, the moduli bijection, the Riemann-surface structure, the
complex Tate curve and the function-field equality are targets of this subsection, in that
order.

### Examples

The five dimensions 1,2,0,2,2 at S₂(Γ₀(11)), S₂(Γ₀(23)), S₂(Γ₀(2)), M₂(Γ₀(11))
and S₂(Γ₁(13)) are Checks of the general theorem, not substitute acceptance signatures.
The constants 2ζ(4) and 2ζ(6) with the identity 1728·64 = 27·4096, and the order-three
automorphism at level 3, test the lattice–modular comparison and the fineness threshold.

### Dependencies

The geometric chain is independent of primitive-associate uniqueness until the newspace
identity. The topological genus and its comparison must not be proved from the dimension
formula they are used to establish. §10D uses the Fuchsian compactification, the fine curve
and the degree of j, not the dimension formulas; §8.0 consumes it.

## Layer 11: the Eichler–Selberg trace formula at level one

### 11.1 Period comparison and the trace identity

For even k≥4 and n≥1, prove `eichlerSelbergTrace` for the composite Hecke action on
the trivial-character cusp space at level one, identified with S_k(SL₂(ℤ)):

    tr(T_n | S_k(SL2(Z)))
      = -(1/2) sum_{t in Z, t^2 <= 4*n} P_k(t,n)*H(4*n-t^2)
        -(1/2) sum_{d | n, d > 0} min(d,n/d)^(k-1).

Use the native Hurwitz class number H with H(0)=−1/12, and the Dickson polynomial
P_k(t,n)=(dickson 2 n (k−2))(t). It is the coefficient of x^(k−2) in
(1−tx+nx²)⁻¹. For distinct roots ρ,ρ′ of X²−tX+n it equals
(ρ^(k−1)−ρ′^(k−1))/(ρ−ρ′); for a repeated root it equals (k−1)ρ^(k−2).
Never evaluate the divided-difference expression at ρ=ρ′ (Popa–Zagier, arXiv:1711.00327v2,
§2, equation (4) and its corollary; §§3–4).

Complete the transfer from periods to modular forms on the supplied polynomial carriers.
For w=k−2, use the right action with S=(0,−1;1,0), U=(1,−1;1,0) and
W_w=ker(1+S)∩ker(1+U+U²). Prove injectivity and Hecke equivariance of the odd period map
S_k→W_w⁻ and the extended even map M_k→W_w⁺, recording the scalar carrying E_k to
Xʷ−Yʷ. Full-period injectivity alone does not imply injectivity of its odd projection;
that restriction is a separate target. With the native dimension count this gives a
Hecke-equivariant isomorphism M_k⊕S_k≃W_w and therefore
`tr(T_n | S_k) = (tr(T_n | W_w) - sigma_(k-1)(n))/2`.

Assemble the supplied determinant-matrix element and exchange relations with the ambient
trace computation. Prove the conjugacy-class weight identity in each case: scalar,
elliptic, split hyperbolic, nonsplit hyperbolic and parabolic, including zero contributions.
Compare elliptic matrix classes with positive binary quadratic forms, preserving orientation
and stabilizer weights, and compare the induced action to the arithmetic Tₙ on forms.
The scalar boundary t²=4n is accounted for by H(0), separately from the elliptic classes.
This route uses the period comparison, not a single coinvariant-zero boundary period.

**Checks.**
- H(0)=−1/12, H(3)=1/3, H(4)=1/2, H(7)=H(8)=1;
  at n=1, k=4 the class sum is −1 and the divisor sum is 1, giving trace 0.
- At n=1, k=12 the class sum is −3 and the divisor sum is 1, giving trace 1.
- At n=2, k=12 the class sum is 46 and the divisor sum is 2, giving −23−1=−24,
  the same a₂(Δ) as the coefficient formula.
- At n=4, k=12, the composite operator has trace −1472. The single diag(1,4)
  coset has trace −2496; the scalar-coset correction is 2¹⁰=1024. Using that
  single coset as T₄ would contradict the recurrence a₄=a₂²−2¹¹.
- At n=1, t=2, P₁₂(2,1)=11. A quotient with zero denominator would give a
  spurious 0 instead of the required scalar contribution −11/12.
- In weight two a period sends (1−γ)D to 0 for γ∈Γ₁(N), since its coefficient
  representation is trivial. For the nonzero level-11 form f the diagonal Petersson
  expression is 2⟨f,f⟩>0, so it cannot equal a scalar times that boundary period.
- At k=2 and n=1 the displayed formula gives −1 instead of 0; this formula requires
  k≥4. The weight-two correction is not part of this target.

*Needs:* native period-polynomial spaces, dimension and trace-reduction API, native integral
period injectivity and equivariance, Mathlib level-one dimensions, the odd/extended-even
comparison and conjugacy-class weights just specified.

### Examples

T₁ gives the dimension and T₂ on S₁₂ gives −24, fixing both the scalar contribution and the
factor 1/2 in the transfer. Traces at powers of 2 determine the weight-60 characteristic
polynomial by the Hecke recurrence and Newton identities.

### Dependencies

This lane uses the analytic period and arithmetic Hecke suppliers, not the general-level
cohomology of Layer 10. General-level and weight-two trace formulas are outside its scope.

## Downstream consumers

The classical forms, primitive conductors, twisting and orbit theory supply automorphic
representations, modularity and arithmetic applications. NoncongruenceModularForms consumes
the order dictionary and analytic Riemann–Roch; it extends the congruence dimension theory
to finite-index groups. The rank-n local comparison supplies the spherical Hecke algebra
input for automorphic representations. ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8
and 7.1 consume the lattice uniformisation, the homotheties, the differential dictionary, the
moduli bijection for Γ₁(N), the complex Tate curve and the automorphy of ω of §10D, and
EllipticPeriods §2.4 consumes its lattice–modular comparison g₂ = (4π⁴/3)E₄, g₃ = (8π⁶/27)E₆.
AlgebraicModularFormsAndSerreWeights consumes the rational coefficient theory of Layer 8 and
reaches §10D through ModularCurvesPartII §7.1 for its geometric forms. ModularCurves'
external uniformisation contract concerns its twisted curve and is not discharged by §10D.
LeanBridge consumes finite-coefficient uniqueness and
newform invariants for its explicit examples; its computations are not library targets here.

## Worked examples

The level-11 weight-two form f=η(z)²η(11z)² has a₁=1, a₂=−2, a₁₁=1 and
Fricke eigenvalue −1. Its functional-equation sign is +1, which forces even analytic rank,
not nonvanishing at the center. The product η(z)η(11z) has translation multiplier −1
since 1+11=12 is not divisible by 24; it is not a Dirichlet-nebentypus weight-one form.
The product η(z)η(23z) has weight 1 and the odd quadratic character modulo 23; 1+23=24
and 23+1=24 satisfy the eta-product congruences (the eta transformation law).

At level 37 and weight two, genus 2 and absence of lower-level cusp forms give a
newspace of dimension 2. This alone does not say whether the two newforms are rational
or form one quadratic orbit, nor whether their Atkin–Lehner signs are opposite.

For weight 60 at level one, the T₂ characteristic polynomial is

    X^5 + 449691864 X^4 - 2209450184054433792 X^3
      - 736010060393513697870348288 X^2
      + 810634763334812972416233648439689216 X
      + 263222216157060824115203098902237248565018624.

It is squarefree and irreducible modulo 83. Modulo 37 it factors as
(X−16)(X−22)(X−23)(X²+30X+34), with derivative gcd 1; the quadratic discriminant is
24 and 24¹⁸=−1 modulo 37. Thus the degree-five field has a transitive Galois closure
containing a transposition, so its Galois group is S₅ and is not solvable. Modulo 17 the
factorization is (X−6)²(X−10)²(X−9) and the derivative gcd is X²+X+9: that reduction
cannot supply an unramified Frobenius cycle type. This is a small mathematical example of
the polynomial Galois-group contract, not a certificate-checking target.

The polynomial and a finite-coefficient uniqueness statement occur in
`LeanBridge/LMFDB/ModularForms/LevelOne/Weight_60.lean` at revision
f0afa3e2d05622ada4221ec267350fc54026c76d. Its theorem
`LeanBridge.QExpansion.LMFDB.W60.identifies_lmfdb_1_60_a_orbit` identifies a weight-60
level-one modular form with the displayed construction provided coefficients 0 through 5
match. This conditional uniqueness theorem does not by itself prove newness, irreducibility
or the Galois-group assertion (leanbridge lines 39–45 and 698–718).

## References

- F. Diamond and J. Shurman, *A First Course in Modular Forms*, GTM 228, 2005:
  Theorem 1.5.1; §§3.2–3.9, Theorems 3.5.1 and 3.6.1; §§4.5–4.8; Theorems 5.8.2–5.8.3,
  Propositions 5.8.4–5.8.5 and 5.9.1; §6.5. Use the author errata for pp.74–75 and 90.
- T. Miyake, *Modular Forms*, 1989: §§4.5–4.6, Theorem 4.6.19 and Corollary 4.6.20;
  Lemma 4.3.10(2) for the level-Nm² twist.
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*, 1971:
  Theorem 3.20 for integral Hecke polynomiality; Proposition 3.64 for the level-Nm² twist.
- J. S. Milne, [*Modular Functions and Modular Forms*](https://www.jmilne.org/math/CourseNotes/MF.pdf),
  version 1.31, 2017: Propositions 3.3, 3.10, 3.12, 3.13 and Corollary 3.5, pp.42–47;
  Lemma 8.7, p.100 (milne-mf lines 1946–1975, 2090–2103, 2165–2184 and 5157–5162).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151, 1994:
  Theorem V.1.1 for the complex Tate curve.
- J. A. Rhodes and T. R. Shemanske, *Bruhat–Tits buildings and Hecke operators*,
  12 June 1998 author manuscript, §3.1 Proposition 3.2 and §3.2 Lemma 3.3 for the
  classical and p-adic Hecke comparisons (rhodes-shemanske lines 364–411).
- A. O. L. Atkin and W. Li, *Twists of newforms and pseudo-eigenvalues of W-operators*,
  Inventiones Mathematicae 48 (1978), 221–243, §§1–4, especially Theorem 3.1.
- P. Deligne and J.-P. Serre, [*Formes modulaires de poids 1*](https://www.numdam.org/item/ASENS_1974_4_7_4_507_0/),
  Annales scientifiques de l'École normale supérieure 7 (1974), 507–530:
  §§2.1–2.6, pp.510–512, Proposition 2.7 and Remark 2.8, p.512
  (deligne-serre lines 128–224; the Tate-curve identification at lines 168–194).
- O. Forster, *Lectures on Riemann Surfaces*, GTM 81, 1981, §8 for the degree bound on
  meromorphic function fields of branched coverings, §§12–19 for cohomology and duality.
- A. Popa and D. Zagier, [*An elementary proof of the Eichler–Selberg trace formula*](https://arxiv.org/abs/1711.00327),
  arXiv:1711.00327v2, Theorem 1, §2 Corollary 1 and Proposition 2; §§3–4; published in J. Reine Angew. Math. 762 (2020), 105–122.
- W. Stein, [*Modular Forms: A Computational Approach*](https://wstein.org/books/modform/stein-modform.pdf),
  2007, Chapters 5–6 for Eisenstein series and the dimension examples.
- J. Sturm, *On the congruence of modular forms*, LNM 1240 (1987), 275–280.
- LeanBridge, revision f0afa3e2d05622ada4221ec267350fc54026c76d,
  `LeanBridge/LMFDB/ModularForms/LevelOne/Weight_60.lean`, polynomial and uniqueness theorem
  (leanbridge lines 39–45 and 698–718).
