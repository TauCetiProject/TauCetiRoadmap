# Roadmap: small ramification and the base cases for Serre modularity

**Summary.** This roadmap develops the arithmetic results that terminate the level-one arguments for
Serre modularity. Its first tools turn a small local different into a small global discriminant. In
characteristics two and three, finite subgroup theory then makes an absolutely irreducible
representation impossible. For abelian varieties, the corresponding argument starts with finite flat
torsion, determines its simple factors and extensions, and compares growing torsion with a fixed
finite-field point count. Fontaine's theorem and Schoof's five-prime theorem are the resulting
geometric base cases. Finally, a realisation theorem for weight-two representations brings these
geometric results back to residual representations and supplies a precise table of terminal weights.

The endpoint is a collection of independent base cases, rather than the full induction proving
Serre's conjecture. The consumers are `ClassicalSerreModularity:R26.1`, `R26.5` and `R33.4`. In
particular, the argument below never assumes the level-one modularity theorem it will help prove.
Layer 5 specifies the minimal lifting, compatible-family, ordinary and potential-modularity
statements needed by the terminal arguments, together with the shared raw compatible-system data
and their representation operations. Finite flat group schemes, local reciprocity,
ramification filtrations, abelian schemes and Néron models are also imported. Here we specialise
their theorems, carry out the small arithmetic calculations, and assemble the contradictions.

## Scope and ownership

The new work is the local representation-specific different bounds, the explicit discriminant
inequalities and finite arithmetic bounds, the finite-flat simple-object classifications, dyadic
filtration specializations, and the terminal applications. The existence of an abelian-variety
structure alone does not provide integral models, the Néron–Ogg–Shafarevich criterion, a Tate-module endomorphism theorem, or
independence of the auxiliary prime. Similarly, the definition of a unit filtration alone does not
provide its image under reciprocity.

General local invariants belong to LocalFieldsRamification. Its native interfaces include
`TauCeti.differentExponent`, `TauCeti.ramificationIndex`,
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` and
`TauCeti.differentExponent_le_ramificationIndex_sub_one_add_natCastValuation`. They use compatible
local-field valuations and give the general different estimate `d ≤ e−1+v_E(e)`. The local
arithmetic targets below use these invariants and their compatible valuations.

### Prerequisites and boundaries

The dyadic square threshold, its sharpness and its critical Artin–Schreier obstruction are supplied
by Tau Ceti `NumberTheory/LocalField/Squares.lean`:
`unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two` and
`unitFiltration_le_range_powMonoidHom_two_iff`. LocalFieldsRamification Layer 1 also fixes the
square-class count. For an unramified dyadic field the threshold is three and the critical residue
map is `a ↦ a²+a`, with cokernel of size two. These are inputs to the two-adic different estimate,
not targets here. The cubic power maps below specialise the residue-characteristic-three case. The
local definitions are used with `[ValuativeExtension K E]` and finite extension hypotheses;
a field type alone does not specify a valuation.

The class-number-one calculation for `ℚ(√(−3)) = ℚ(ζ₃)` is Mathlib's
`IsCyclotomicExtension.Rat.three_pid`, converted by `NumberField.classNumber_eq_one_iff`. The new
quadratic bound below covers the other six primes needed by the dihedral argument.

## Conventions

Throughout, `p` and `ℓ` denote rational primes; when both occur in a finite-flat argument,
`p ≠ ℓ`. A residual coefficient field is finite and has the discrete topology. Absolute
irreducibility means irreducibility after extension to an algebraic closure. A continuous
representation into `GL₂(𝔽̄_p)`, with discrete target, has finite image
and descends to a finite coefficient field. This descent is supplied by
`ArithmeticGaloisRepresentations Layer 1`. All changes of coefficient field below respect this
convention.

For a finite extension `E/ℚ_p`, write `e(E)` and `f(E)` for its ramification index and
residue degree. The integer `d(E)` is the exponent of the different measured with `v_E(π_E) = 1`.
Its *normalised* different is `δ(E) = d(E)/e(E)`. Thus the valuation used to compare local and
global discriminants has `v_p(p) = 1`. The exponent of the local discriminant is `f(E)d(E)`, and
`δ(E)` is also that exponent divided by `[E:ℚ_p]`. The valuations on an extension must
restrict to the specified base valuation; merely providing unrelated discrete valuations does not
express this situation.

For a number field `K`, `d_K` denotes its absolute discriminant, `n = [K:ℚ]`, and
`rd(K) = |d_K|^{1/n}`. Write `r₁+2r₂ = n` for its signature. Root
discriminants are positive real numbers. All explicit-formula bounds in this roadmap are
unconditional; they require positivity throughout the critical strip, not just on its central line.

For a finite commutative flat group scheme, order means its finite locally free rank. A simple
object is nonzero and has no proper nonzero closed flat subgroup. In an extension written `0 → H → G → Q → 0`, the Ext group is `Ext¹(Q,H)`. In particular,
`Ext¹(μ_p,ℤ/pℤ)` concerns a *constant subobject* and a
*multiplicative quotient*. For `p = 2` the statement splits `0 → ℤ/2ℤ → G → μ₂ → 0`,
yielding constant subobject and multiplicative quotient. The converse ordering is a different Ext
group.

An abelian variety is defined over the number field indicated in its notation; endomorphisms used
for `GL₂`-type are defined over that same field. An abelian variety of dimension zero is the trivial
one. The pinned Tau Ceti dimension has values in `WithBot ℕ∞`, so an equality with a natural number
uses the canonical coercion. The realisation theorem uses Snowden's Hodge–Tate convention, in which
the cyclotomic character has weight `−1` and weight two means weights `{0,−1}`. The
compatible-system and lifting arguments often use the opposite convention `{0,k−1}`; the interface
must translate this sign before applying either theorem.

The symbol `k(ρ̄)` means Serre's weight of the representation itself. It does not mean the
smallest weight among cyclotomic twists. A statement about that smallest weight says so explicitly.
This distinction is particularly important at `(p,k) = (11,14)`.

The declaration namespace is `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases`.
[Suggested.lean](Suggested.lean) records suggested forms for headline theorems expressible over the
pinned carriers and the definitions needed to state them. It is not an exhaustive checklist. Every
target, including the geometric and representation constructions, is specified here. Names of
interfaces elsewhere in this document specify mathematical targets; they do not assert declarations
in that file.

`Suggested.lean` declares `localRootDiscrExp_le_two_of_char_two`,
`localRootDiscrExp_le_of_char_three`, `poitouLowerBound_le_log_abs_discr`,
`tate_no_levelOne_char_two`, `serre_no_levelOne_char_three`, `simple_two_groupScheme_over_int`,
`dim_eq_zero_of_goodReduction_everywhere`, `fieldCriterion_two_three`, `fieldCriterion_three_two`,
`fieldCriterion_five_two`, `fieldCriterion_seven_three`, `fieldCriterion_thirteen_two` and
`not_isLevelOneResidual_of_mem_two_three_five_seven`.

`Suggested.lean` defines `localRootDiscrExp`, `odlyzkoKernel`, `poitouTestFunction`,
`poitouLowerBound`, `ResidualRep`, `IsAbsolutelyIrreducible`, `inertiaAbove`, `IsUnramifiedAt`,
`IsOdd`, `IsLevelOneResidual`, `FFGroupSchemeOver`, `FFGroupScheme`, `order`, `schemeHom`,
`IsSimpleGroupScheme`, `HasGoodReductionEverywhere`, `cyclotomicSubfield` and `FieldCriterion`.
Its module docstring identifies the geometric, Hodge-theoretic, automorphic and Serre-weight objects
missing at the pins for the remaining headline statements.

## Exact supplier contracts

The library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib already defines discriminants, different ideals,
ramification indices, residue degrees, cyclotomic extensions, class numbers, absolute Galois groups
and matrix groups. Its Minkowski bound and its level-one modular-form dimensions provide genuine
parts of the proofs. Tau Ceti supplies finite locally free commutative affine group schemes, Cartier
duality, abelian varieties, unit filtrations, some different estimates, and the positive-definite
Fourier tools. These objects are used directly.

The interfaces needed from neighbouring roadmaps are as follows. Each named layer identifies the
owner of the general result and the part used here.

| Owner | Required interface and use |
| --- | --- |
| `ArithmeticGaloisRepresentations Layer 1` | Finite coefficient descent and absolute irreducibility under scalar extension; used in Layer 2 |
| `ArithmeticGaloisRepresentations`, §2.7, `finite-order-hecke-functional-equation` / LFunctions Layer 5 | Trivial-character meromorphic extension, completed functional equation and poles of Dedekind zeta; §1.0 identifies the Euler product and proves the explicit formula |
| `ArithmeticGaloisRepresentations Layer 2` | Decomposition groups, inertia, kernel fields and their ramification; used to connect representations to completions |
| `ArithmeticGaloisRepresentations Layer 4` | Dickson classification, normal p-subgroup fixed vectors, and the cyclotomic restriction criterion; used in Layer 1, Layer 2 and Layer 5 |
| `ArithmeticGaloisRepresentations`, §§6.1, 6.4 / `TateModule.lambdaTateModule` | Rational Tate modules and `λ`-factors with continuous Galois action, coefficient extension and dimension; specialized in §5.1 |
| `TauCetiRoadmap.LocalFieldsRamification`, Layer 1 | Completeness and deep-unit power maps or logarithms, with compatible valuation normalisations |
| `TauCetiRoadmap.LocalFieldsRamification`, Layer 3 | Different formula, upper and lower ramification, Herbrand's theorem and Hasse–Arf |
| `TauCetiRoadmap.LocalFieldsRamification`, Layer 4 | Tame inertia and Frobenius conjugation; used for prime-to-p characters |
| `TauCetiRoadmap.ClassFieldTheory`, Layer 7 | Local Artin reciprocity on unit filtrations and equivariance under field automorphisms |
| `TauCetiRoadmap.ClassFieldTheory`, Layer 13 | Hilbert and ray class fields, Kronecker–Weber and conductor–discriminant calculations, using the class-field correspondence of ClassFieldTheory Layer 12 |
| `TauCetiRoadmap.NumberFieldArithmetic`, Layer 5 | Localisation of the different, completions and decomposition degrees |
| `Tau Ceti NumberFieldArithmetic, Layer 6` | Compatibility of local ramification with global inertia |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.1.2, R07.1.7, R07.1.20, R07.1.23, R07.1.34–R07.1.39 | Étale Galois modules, Cartier duality, flat closure, simplicity, Oort–Tate order-p classification, Katz–Mazur extensions and gluing of Hom and Ext |
| `ModularCurves`, Layers 0B–0C | Finite locally free closed subgroups, representable fppf quotients and exactness, used in the finite-flat filtrations |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.G5, `admissible-global-ext-vanishing` / `admissibleConnectedEtaleFiltration` | All-prime global Ext vanishing and the admissible connected–étale filtration over `ℤ`; §3.3 specializes at `ℓ = 2` after §3.2 establishes admissibility |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.5` | Fontaine's strict different bound for a finite flat group scheme killed by p |
| `AbelianSchemesAndArithmeticModuli A2` | Polarizations and isogenies to the dual abelian variety |
| `AbelianSchemesAndArithmeticModuli A3` | Finite flat torsion of rank `p^{2gn}`, finite flat quotients and duality of torsion |
| `AbelianSchemesAndArithmeticModuli`, §§A6.1, A6.5, A6.8, A6.10–A6.12, A6.30–A6.33 | Degree, Poincaré decomposition, rational endomorphisms, endomorphism polynomials, `traceDegreeSubfield` freeness, Weil restriction and induction of Tate modules; the point-count argument is §3.4 here |
| `NeronModelsAndSemistableAbelianVarieties §§1.8–1.9` | Good reduction and extension to an abelian scheme |
| `NeronModelsAndSemistableAbelianVarieties §§3.5–3.11` | Grothendieck's monodromy criterion and `(σ−1)² = 0` for semistable torsion |
| `NeronModelsAndSemistableAbelianVarieties`, §§5.1–5.3 and 6.10 | Rational whole-Tate-module Weil–Deligne compatibility, including the residue-characteristic comparison, and reduction criteria; the K-equivariant refinement and conjugate-factor reduction tests are targets of §5.4 here |
| `ClassicalArithmeticCompletion`, §5.1 | Class groups generated by prime ideals within the Minkowski bound |
| `TauCetiRoadmap.ProfiniteCohomology`, Layer 9 / `kummerIso`, `kummerIso_res` | Field Kummer cohomology and localization compatibility; §4.3 owns the S-unit restriction and local Ext calculations over `ℤ[1/ℓ]` for `p = 2,3`, using the stated PID calculations; the global calculation over `ℤ` in §3.3 specializes R07.G5 |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.39` / `mayerVietoris_exact` | The exact finite-flat Hom and Ext gluing sequence used in §§3.3 and 4.3 |
| `GL2AutomorphicRepresentationsAndTransfer R17.3.1 and R17.3.10` | Jacquet–Langlands transfer to a quaternion algebra split at one real place over an odd-degree totally real field |
| `GL2AutomorphicRepresentationsAndTransfer R17.4.10 and R17.6.18–R17.6.19` | Conditional solvable descent with supplied compatible families, intermediate Galois attachments and common twist index; §5.0b here constructs the single-representation weight-two descent and its Hilbert attachments |
| `ShimuraVarieties`, §§8.1–8.5, 8.18–8.19 | Canonical open tower, proper normal minimal compactification and extended Hecke legs; §5.0c specializes to smooth proper curves at neat level |
| `JacobianChallenge`, Layers D–F | Layer D supplies unpointed Picard representability and Layers E–F the pointed Jacobian theory; §5.0c here supplies unpointed abelian descent and correspondence actions |
| `InverseGaloisAndArithmeticFundamentalGroups IG.0.T1` / `VanishingCycles.curveEndomorphismTrace` | Finite-level and rational curve–Jacobian `H¹` comparisons with pullback/pushforward orientation, used for the Tate realization of §5.0c |
| `AlgebraicModularFormsAndSerreWeights`, §R15.5A.2, and `GL2AutomorphicRepresentationsAndTransfer`, §R17.6.4 | Classical attachments and ramified local–global compatibility for the exact-level comparison of §5.0e |
| `AlgebraicModularFormsAndSerreWeights R15.4` | The full local weight recipe, cyclotomic twisting, parity and niveau-two characters |
| `LocalGaloisDeformationRings`, §0.3 / `RankTwoOrdinaryEndpoints`, §§5.4–5.5 | Ordinary and nonordinary local rank-two endpoints, including the Berger–Li–Zhu boundary, specialized in §5.0e |

The cited roadmap interfaces are mathematical targets of their named sections. A library identifier
denotes an existing declaration at the pins above. The analytic explicit formula in §1.0 and the
specialized lifting and realization inputs in §5.0 are targets here. In particular, the geometric
arguments use Néron reduction and the endomorphism comparison of §5.2; they do not require the
entire finiteness theory or a general classification of Néron-model component groups.

### Further Mathlib and Tau Ceti contracts

Several general declarations occur at multiple transitions. They are listed here to make their
precise role explicit. All are existing pinned tools, not further targets.

| Declaration | Role |
| --- | --- |
| `AlgebraicClosure` | Scalar extension in absolute irreducibility and the ambient field for kernel and torsion fields |
| `Ideal.isUnramifiedAt_iff_inertia_eq_bot` | Converts unramifiedness of an ideal in a Galois extension to trivial inertia |
| `NumberField.finrank_eq_one_of_unramified` | The number-field degree-one conclusion for an extension unramified at all finite places |
| `TauCeti.bochner` | Identifies a continuous positive-definite function with the Fourier transform of a finite positive measure; compatible with the Lorentzian argument |
| `TauCeti.RootsOfUnityGroup.groupScheme` | The group-scheme model `μp` |
| `TauCeti.DiagonalizableGroup.groupScheme` | Diagonalizable finite groups occurring in the reordered filtration |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor` | Base change to `ℤ[1/ℓ,ζℓ]` in the cyclotomic splitting theorem |
| `Real.pi_gt_d6`, `Real.pi_lt_d6` | Finer rational `π` enclosures for the degree bounds and the small-discriminant calculations |

The native finite locally free models are `TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme R (Multiplicative (ZMod n))` and `TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme R` applied
to `TauCeti.FGCommGrpCat.of (Multiplicative (ZMod n))`, for positive n. The second is `μn`. Both live
in `TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant`; no separate constructor
for either model is a target. Short exactness is `TauCeti.CommHopfAlgCat.IsShortExact` in
`TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Quotient.Kernel.Exact`, applied to the contravariant
coordinate maps through
`TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat`.
This requires a faithfully flat quotient map, a closed subgroup, and equality with the
scheme-theoretic kernel. The notation `0 → H → G → Q → 0` always has this meaning.

The native local identities used without new copies are `TauCeti.differentExponent_eq_zero_iff`,
`TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff` and `TauCeti.differentExponent_tower`,
from `NumberTheory.LocalField.Different.Basic` and `NumberTheory.LocalField.Different.Tower`; and
`TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent` from
`NumberTheory.LocalField.Discriminant.Basic`. The first two characterize unramified and tame
extensions; the tower formula is `d(M/K) = d(M/L) + e(M/L)d(L/K)`.
`IsDedekindDomain.HeightOneSpectrum.differentExponent_adicCompletion_eq_multiplicity_differentIdeal`
in `NumberTheory.NumberField.LocalGlobal.Different.Exponent` supplies the local/global different
comparison. These theorems carry the local-field, separability and compatible-valuation hypotheses.
The normalized rational quantity in §1.1 is a specialization of these invariants.

Mathlib's `Representation.IsIrreducible`, composed with `Matrix.GeneralLinearGroup.toLin` on the
natural module, supplies irreducibility. For `IsAbsolutelyIrreducible`, first extend the matrices
through the native coefficient map to the algebraic closure, then apply this representation
predicate.

The group-scheme base-change functor is a functor on the existing finite locally free category. The
exactness and point-action compatibilities needed by this roadmap are part of
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; existence of the functor alone is not an
exactness theorem. Likewise, the library's different ideal and divisibility estimates provide the
algebraic foundation, while the full ramification filtration and reciprocity comparison remain
LocalFieldsRamification Layers 3–4 and ClassFieldTheory Layer 7 inputs.

## How to read the build

The six layers first establish the local and global discriminant estimates, then the Tate–Serre
exclusions, Fontaine’s integral filtration argument, and Schoof’s five-prime calculation. The fifth
layer brings abelian varieties back to weight-two and terminal residual representations. The last
layer records the precise domains of these independent base cases for their consumers.

## Layer 1: Local and global discriminant bounds

This layer separates three tasks: normalising local ramification, proving the two
small-characteristic estimates, and obtaining lower bounds for number fields. The first two feed
Tate–Serre directly. The analytic part is needed for the characteristic-three case and for the
larger auxiliary fields in Schoof's argument.

### 1.0 The Dedekind-zeta explicit formula

For every number field K of degree n and signature `(r₁,r₂)`, use
ArithmeticGaloisRepresentations §2.7, `finite-order-hecke-functional-equation`, supplied by
LFunctions Layer 5 and specialized to the trivial idele-class character,
for Dedekind-zeta meromorphic extension, its completed functional equation and poles. Identify its Euler
product `∏𝔭 (1 − N𝔭⁻ˢ)⁻¹` on `Re(s)>1` with the ArithmeticDirichletSeries presentation.
Use the completion

```text
Λ_K(s) = |d_K|^(s/2) (π^(-s/2) Γ(s/2))^r₁ ((2π)^(-s) Γ(s))^r₂ ζ_K(s).
Λ_K(s) = Λ_K(1-s).
```

Multiplication of `Λ` by the constant `2^r₂` gives the same convention. The target
`dedekindZeta_explicitFormula` proves that its nontrivial
zeros lie in the closed strip, counted with analytic multiplicity. For real even, compactly
supported `C¹` F, piecewise `C²` on a finite partition with integrable second derivative, with
`F(0) = 1` and `F(x) = 1+O(x²)` at zero, put `Φ(s) = ∫ℝ F(x) exp((s−1/2)x) dx`. The explicit formula is

```text
log |d_K| = r₁π/2 + n(γ + log(8π))
  − n ∫₀∞ (1−F(x))/(2 sinh(x/2)) dx
  − r₁ ∫₀∞ (1−F(x))/(2 cosh(x/2)) dx
  − 4 ∫₀∞ F(x) cosh(x/2) dx
  + Σρ Φ(ρ)
  + 2 Σ𝔭 Σm≥1 log(N𝔭) (N𝔭)^(-m/2) F(m log(N𝔭)).
```

The zero sum is the symmetric limit by imaginary height, with conjugate terms grouped; prove
convergence for the displayed test functions and the equality in this convention. The compact
support makes the prime sum finite. The analytic API proves zero location, trivial-zero
descriptions, conjugation of zeros, the grouped zero-sum convergence and this explicit formula
for the supplied function. In particular, the pole term has the negative sign shown.
This is a target here; it uses Mathlib's gamma functions, integrals and number-field invariants, and
ArithmeticDirichletSeries (completed), Layers 1–3, for Dirichlet-series convergence and
Euler-product operations. Source: Odlyzko's survey, §2, (2.1)–(2.3), pp. 121–122;
meromorphic extension, the completed equation and poles are supplied by the trivial-character specialization
of ArithmeticGaloisRepresentations §2.7, `finite-order-hecke-functional-equation` (LFunctions Layer 5).

**Checks.**

- For `K = ℚ`, the Euler factors are those of Riemann zeta, `n = r₁ = 1` and `log |d_K| = 0`.
- For `K = ℚ(√−3)`, `n = 2` and `r₁ = 0`; replacing `r₁` by the number of complex places changes the formula.
- For `F_b` of §1.7 the pole integral is `16b/π²`, with a negative sign on the right side.
- Nonnegativity only at zeros on `Re(s) = 1/2` does not justify dropping the complete zero sum; §1.6
  proves the required positivity on the entire strip.

### 1.1 Normalised local differents

Define `localRootDiscrExp p E` as `d(E)/e(E)`, a rational number. Its purpose is to measure the
exponent of p in a global root discriminant. It must therefore keep the local ramification index
separate from the total extension degree. The library declarations are `Padic`, `differentIdeal`,
`pow_sub_one_dvd_differentIdeal` and
`TauCeti.differentExponent_le_ramificationIndex_sub_one_add_natCastValuation`; the full tower and
ramification formulas come from LocalFieldsRamification Layer 3.

Develop the following properties, with finite-extension and compatible-valuation hypotheses
throughout:

- Equality with `v_p(disc(E))/[E:ℚ_p]`, used in globalisation.
- For Galois E, equality with the sum over upper jumps u of
  `(|G^{u+}|⁻¹−|G^u|⁻¹)(u+1)`, used in the wild bounds.
- Vanishing exactly for unramified extensions.
- In tame extensions, the value `1−1/e`.
- Invariance under unramified extension of E and under base-preserving valued field isomorphism.
- For `ℚ_p ⊆ E ⊆ E'`, the tower value
  `δ(E)+d(E'/E)/e(E'/ℚ_p)`; hence monotonicity in a tower.

The jump sum uses right limits at a break and includes the tame break at zero. It follows from the
different formula by grouping the lower-index terms with Herbrand's function. For a tame extension
the single contribution is `1−1/e`, providing an immediate convention check. Jones, §1.1, equations
(1) and (3), pp. 2–3, calls this quantity a mean slope.

**Checks.**

- `δ(ℚ₂(i)) = 1`.
- `δ(ℚ₂(√2)) = 3/2`, separating the
  normalised exponent from the integer different exponent three.
- For `ℚ₂(ζ₁₂)`, `e = f = 2`, `d = 2`, discriminant exponent four, and
  `δ = 1`. Dividing d by the degree gives the wrong value `1/2`; dividing the discriminant
  exponent by e gives two.
- The splitting field of `X³−3` over `ℚ₃` has
  degree six and different exponent eleven, giving `11/6`.
- The base field and its unramified quadratic extension both give zero; a
  formula with an added tame constant fails here.

The local-to-global theorem, `rootDiscr_eq_prod_rpow_localRootDiscrExp`, proves that a Galois number
field K satisfies

`rd(K) = ∏_p p^{δ(K_𝔭)},`

where any prime above p may be chosen and only ramified primes contribute. There are g primes above
p, all with the same e, f and different exponent d; the degree formula `gef = n` gives `v_p(|d_K|) = gfd = nδ`. Use `NumberField.absNorm_differentIdeal`,
`NumberField.not_dvd_discr_iff_isUnramifiedIn`, `NumberField.rootDiscr_def`, `NumberField.discr`,
`IsGalois` and `Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn`, together with
completion compatibility from NumberFieldArithmetic Layers 5–6. The one-prime case is
`rd(K) = p^{δ(K_𝔭)}`. Checks include `ℚ(√(−3))`, with root
discriminant `√3`, and the real cubic subfield of `ℚ(ζ₉)`, with discriminant 81 and
exponent `4/3`. See Jones, §3.1, p. 9, and Moon–Taguchi, §3, pp. 6–7.

### 1.2 Inertia and power maps on units

`orderOf_map_inertia_dvd_card_residueField_sub_one` concerns a finite abelian quotient of a local
Galois group whose order is prime to p. If the residue field has q elements, its inertia is cyclic
of order dividing `q−1`. Wild inertia is killed because it is a p-group (`IsPGroup`), while the tame
relation `φτφ⁻¹ = τ^q` becomes `τ^{q−1} = 1` in an abelian quotient. Thus a prime-to-2
character over `ℚ₂` is unramified; over `ℚ₃` its inertia has order at most two.
The residue field must be that of the base field, not of an arbitrary unramified enlargement.
LocalFieldsRamification Layer 4 supplies the tame relation. See Moon–Taguchi, §2, after (2.1), p. 2,
and Jones, §2.3, p. 9.

`exists_upperTriangular_of_wildInertia_ne_bot` places a faithful finite local image
`D ⊆ GL₂(𝔽̄_p)` in upper-triangular form when its wild inertia `P`
is nontrivial. A nontrivial unipotent element has a unique fixed line; normality of P makes that
line D-stable. On this basis P consists of upper-unitriangular matrices, hence is elementary
abelian, and conjugation acts on its additive parameters through the ratio of the diagonal
characters. The preceding character result makes `I/P` cyclic of order dividing `p−1`. In particular
`I = P` for `p = 2`. `ArithmeticGaloisRepresentations Layer 4` supplies fixed vectors for p-groups;
`Matrix.GeneralLinearGroup`, `IsPGroup` and `Subgroup.normalizer` supply the ambient language. The
characteristic-three `S₃` image and the characteristic-two upper-unitriangular group with four
elements test the assertion. The claim does not assert that the *global* irreducible image is
triangular. See Moon–Taguchi, §2, p. 2 and the proof of Lemma 1, p. 3; the same fixed-line argument
works in either characteristic.

`unitFiltration_two_le_map_pow_three` and `unitFiltration_pow_three_of_ramificationIndex_eq_two`
provide the precise local calculations used after reciprocity in residue characteristic three. Write
`U^i = 1+𝔪^i` for a local field with surjective integral valuation. For an unramified
extension of `ℚ₃`, `U² ⊆ (U¹)³`. For absolute ramification index two in residue
characteristic three, `(U¹)³ ⊆ U³`, `U⁴ ⊆ (U¹)³`, and

`[U³:U⁴((U¹)³∩U³)] ≤ 3.`

Indeed, the critical graded map is `a ↦ a³+θ₀a`, with kernel of size at most three;
subsequent graded maps are bijective and completeness lifts the roots. For a ramified quadratic
extension in characteristic three, its nontrivial involution acts on `U^i/U^{i+1}` by `(−1)^i`.
Choose a uniformizer carried to its negative and expand `1+aπ^i`; this proves the equivariance
needed below. These are instances of Fesenko–Vostokov, Ch. I, (5.7), pp. 14–15, and (5.8), Corollary
2, p. 16. The starting declaration is `TauCeti.unitFiltration`; the completeness and valuation
interfaces belong to LocalFieldsRamification Layer 1.

### 1.3 Sharp bounds in characteristics two and three

`localRootDiscrExp_le_two_of_char_two` proves `δ(E) ≤ 2` for a finite Galois extension
`E/ℚ₂` whose group embeds faithfully in `GL₂(𝔽̄₂)`. If its
wild inertia has order at most two, the sharper bound is `δ(E) ≤ 3/2`. These hypotheses concern
an actual two-dimensional representation; they do not bound all 2-adic extensions.

The tame case has `δ<1`. Otherwise the Borel form gives `I = P`. Over the maximal unramified
subfield, unit reciprocity and the square maps show that the upper breaks are at most two and that
`a = |P²|` is either one or two. The different sum becomes

`δ(E) = 3−1/a−2/(|P|).`

For a nonabelian local image the diagonal ratio acts nontrivially on P. An order-two stable subgroup
would have trivial action on its only nonzero element, so `a = 1`. The value is then `2−2/|P|`. For an abelian image, inertia is a quotient of the units of `ℚ₂` modulo squares, with
order at most four; the possible character conductors give `δ ≤ 2`. If `|P| ≤ 2`, the
same calculation gives `δ ≤ 3/2`. The extension `ℚ₂(ζ₈)` reaches 2, with
character conductors 0, 2, 3 and 3, so replacing the bound by a strict inequality would fail.

The inputs are the local normalisation, Borel and cubic-power results, together with the dyadic
supplier contract, local Artin reciprocity including equivariance, and
ArithmeticGaloisRepresentations Layer 4. Moon–Taguchi, Lemma 3 and its proof, §2, pp. 4–5, supply
the unit-character computation and nonabelian branch. Their statement has an unramified quadratic
*base*; the abelian branch here instead uses the units of `ℚ₂`. Jones, §2.3, pp. 8–9,
records Tate's original estimate `5/2−2/|P|`, which is weaker than the sharp bound proved
here. Attribution to Tate does not substitute for the two new branches.

`localRootDiscrExp_le_of_char_three` proves

`δ(E) ≤ 13/6−1/(|P|)`

for a faithfully represented finite Galois extension of `ℚ₃` with nontrivial wild inertia
P. If `I = P`, the unit calculation over the unramified base gives `2−2/|P|`, which is
smaller. Otherwise `I/P` has order two. Let `E₁/E₀` be this ramified quadratic tame extension. The
action on P has sign `ε = ±1`, determined by the diagonal ratio. Reciprocity carries
`U^i(E₁)` to the upper ramification groups and intertwines the quadratic involution. Its graded
action is `(−1)^i`; incompatible signs force the corresponding image to disappear.

When `ε = −1`, the upper breaks over `E₀` can be `1/2` and `3/2`. The last subgroup has
order `a ≤ 3`, by the critical cube map, and the different is `5/2−1/|P|−1/a`. When
`ε = 1`, the odd graded pieces are absent, so only the break at one over `E₀` remains and
the different is `2−3/(2|P|)`. Both are at most `13/6−1/|P|`. For `|P| = 3` this is `11/6`, attained by the splitting field of `X³−3`. The compositum `ℚ₃(ζ₃,∛2,∛3)` has `|P| = 9` and exponent `37/18`, another useful
equality check.

Use the Borel, unit and different targets, ArithmeticGaloisRepresentations Layer 4, and the local
reciprocity equivariance theorem. Fesenko–Vostokov, Ch. IV, (3.4)(1) and (3.5), p. 135, are the
latter statements. Ghitza–Yamauchi, §2.3, Lemma 2.6, p. 5, gives `5/2−2/|P|` in this
situation, sufficient when `|P| = 3` but weaker in general. The two-sign argument supplies
the stronger estimate required here. Dieulefait–Pacetti, Theorem 1.1, §1.1, p. 3, states the
application to Serre's characteristic-three base case.

For the diagonal-ratio convention, take `s = diag(−1,1)` and `u = (1,1;0,1)` over `𝔽₃`. Then `s u s⁻¹ = (1,−1;0,1)`: the upper-right entry is multiplied by `ψ₁/ψ₂ = −1`. This fixes the conjugation
direction.

### 1.4 Minkowski thresholds

`two_lt_rootDiscr` proves, for every number field,

`n ≥ 3 ⇒ rd>2, n ≥ 6 ⇒ rd>3, n ≥ 12 ⇒ rd>4.`

Start with `NumberField.abs_discr_ge'`: `n^{2n}/((4/π)^{2r₂}(n!)²) ≤ |d_K|`. Since
`2r₂ ≤ n`, it is enough to use `B_n = (π/4)^n(n^n/n!)²`. Prove the inequalities `B₃>2³`,
`B₆>3⁶`, and `B₁₂>4¹²` with rational bounds on `π`. To propagate a threshold c, compare
`B_{n+1}/B_n` with c; the factor `(1+1/n)^{2n}` increases with n, and its value at the starting
degree already suffices. No transcendental numerical approximation is a proof. The precise library
inputs are `NumberField.rootDiscr_def`, `NumberField.InfinitePlace.nrComplexPlaces`,
`NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `Nat.factorial`, `Real.pi_gt_d2` and
`Real.pi_lt_d2`. See Odlyzko, §1, p. 119. Ghitza–Yamauchi, Proposition 3.2, §3, p. 7,
proves the analogous tame exclusion using Odlyzko tables; the weaker sufficient thresholds here
are proved directly from Mathlib’s Minkowski bound.

### 1.5 The compactly supported kernel

`odlyzkoKernel` defines the real even function

    g(x) = (1−|x|) cos(π x) + sin(π|x|)/π,  |x| ≤ 1;
           0,                                |x| > 1.

For `h(x) = cos(πx)` on `[−1/2,1/2]`, zero elsewhere, `g = 2(h*h)`. This proves positive
definiteness by a convolution square, and nonnegativity follows because both factors are nonnegative
on their support. Direct differentiation on `[0,1]` gives `g'(x) = −π(1−x) sin(πx)`; its endpoint
values establish `C¹` regularity. The integral on the positive half-line is `4/π²`. This
classical kernel meets the requirements in Odlyzko, §2, (2.4)–(2.5), p. 122; it is not the optimised
kernel mentioned later in that source.

Develop the convolution characterisation, the value at zero, evenness, support and regularity,
positive definiteness, nonnegativity and the half-line integral. These properties make
`odlyzkoKernel` usable in the explicit formula. They use `Real.cos`, `Real.sin`,
`MeasureTheory.convolution` and
`TauCeti.IsPositiveDefiniteSub`.

**Checks.**

- `g(0) = 1` fixes the normalisation.
- `g(1/2) = 1/π` detects the coefficient of the sine term.
- `g(−1/2) = 1/π` rejects a signed sine argument without absolute value.
- `g(1) = g(2) = 0` checks the boundary and the exterior support.
- `g(3/4)>0` rejects the truncated cosine without its sine
  correction.
- The positive-half-line integral is `4/π²`, rejecting omission of
  the `1/π` factor.

### 1.6 Positivity throughout the critical strip

`isPositiveDefiniteSub_cosh_div_cosh` establishes that `k_a(x) = cosh(ax)/cosh(x/2)` is positive
definite for `|a| ≤ 1/2`. Euler's sine product gives the hyperbolic-cosine product and
expresses this ratio as the pointwise limit of finite products of

`4a²+(1−4a²)c_j²/(c_j²+x²), c_j = (2j−1)π.`

Each factor is a convex combination of the constant function and a Lorentzian. In Mathlib’s
Fourier convention, `c_j²/(c_j²+x²)` is the transform of the positive measure with density
`πc_j exp(−2πc_j|t|)`. Equivalently it is the integral of `exp(itx)` against
`(c_j/2) exp(−c_j|t|) dt` in the unnormalized oscillatory pairing. Thus finite products and
their limit are positive definite. The endpoints `a = ±1/2` give the constant 1. If
`|a|>1/2`, the quotient is unbounded and cannot be positive definite with value 1 at zero.
This separate lemma supplies the nontrivial step behind Odlyzko's positivity criterion, §2, after
(2.3), p. 122.

Use `Complex.tendsto_euler_sin_prod`, `Real.cosh`, `TauCeti.isPositiveDefiniteSub_const`,
`TauCeti.IsPositiveDefiniteSub.add`, `TauCeti.IsPositiveDefiniteSub.real_smul`,
`TauCeti.IsPositiveDefiniteSub.prod` and `TauCeti.IsPositiveDefiniteSub.of_tendsto`, and
`TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs`. `re_poitouTransform_nonneg` then assumes an even,
continuous, compactly supported, nonnegative positive-definite function f and puts
`F(x) = f(x)/cosh(x/2)`. Its transform

`Φ(s) = ∫_ℝ F(x)e^{(s−1/2)x} dx`

has nonnegative real part for `0 ≤ Re(s) ≤ 1`. Evenness identifies this real part with the Fourier
transform of `f(x)k_a(x)`, where `a = Re(s)−1/2`, at frequency `Im(s)/(2π)`. The preceding lemma
and `TauCeti.IsPositiveDefiniteSub.mul` make this product positive definite;
`TauCeti.isPositiveDefiniteSub_iff_posSemidef` and `TauCeti.fourier_re_nonneg_of_posSemidef` prove
the Fourier assertion. See Odlyzko, §2, the text before (2.4), p. 122.

Positivity on the central line alone would not justify dropping zeros from an unconditional explicit
formula. Removing the cosh denominator is also invalid: a sufficiently wide dilation of g has
negative transform real part at some points on the strip boundary. The full strip statement is the
interface used in the next theorem.

**Checks.**

- The Lorentzian measure has mass one, and its Fourier transform is one at zero.
- At frequency `x = c_j` the corrected transform is 1/2; using the unscaled density in Mathlib’s
  convention would give `1/(1+4π²)`.
- At `a = ±1/2` the cosh quotient is one; for `|a|>1/2` it is unbounded, so positivity fails.

### 1.7 Poitou's explicit lower bound

For `b>0`, set `F_b(x) = g(x/b)/cosh(x/2)` and define

`I₁(b) = ∫₀^∞(1−F_b(x))/(2 sinh(x/2)) dx, I₂(b) = ∫₀^∞(1−F_b(x))/(2 cosh(x/2)) dx.`

For `poitouTestFunction`, prove evenness, normalization at zero, vanishing for `|x| ≥ b` when
`b>0`, nonnegativity and continuous differentiability, together with the integral and transform
properties used in this section. Source: the kernel of
§1.5 and Odlyzko, §2,
(2.3)–(2.5), p. 122.

**Checks.**

- For `b>0`, `F_b(0) = 1` fixes the normalisation.
- `F_b(b) = F_b(2b) = 0` fixes the scaled boundary and exterior support.
- `F_b(b/2) = 1/(π cosh(b/4))` detects either a missing cosh denominator or an incorrectly scaled
  sine term.

`poitouLowerBound` defines

`P(n,r₁,b) = r₁π/2+n(γ+log(8π)) −nI₁(b)−r₁I₂(b)−16b/π².`

At zero, `1−F_b(x) = O(x²)`, so the apparent singularity in `I₁` is integrable. Both tails decay
exponentially. Since g has support in `[−1,1]`, the tail of `I₁` is `−log tanh(b/4)`, and that of
`I₂` is `π−2 arctan(e^{b/2})`. The pole contribution is `−4∫₀^∞F_b(x) cosh(x/2) dx = −16b/π²`. In particular, its sign is negative. This is the right side of
Odlyzko, §2, (2.3), p. 122, after removing the zero and prime contributions.

Prove integrability of both archimedean integrands, the equality of `poitouLowerBound` with the
explicit-formula expression and the stated hyperbolic tail identity. For `b>0` and `0<n ≤ m`, prove
`P(n,0,b)/n ≤ P(m,0,b)/m`. Indeed only the
negative pole term depends on n after division. The explicit and tail equalities are what make the
definition usable for exact integral estimates. Library inputs include
`Real.eulerMascheroniConstant`, `Real.cosh` and `Real.sinh`.

**Checks.**

- `P(1,1,b) ≤ 0` for `b = 1/2,1,2`, as the rational field has
  discriminant one.
- `P(2,0,1) ≤ log 3` checks the totally complex quadratic
  signature.
- `P(2,2,3/2) ≤ log 5` checks the real quadratic signature.
- For `b>0` and positive degrees the normalised bound increases with
  degree, with limit `γ+log(8π)−I₁(b)<log(4πe^γ)`. The negative pole term has the
  direction required for this inequality; degree zero is excluded.
- `−0.09<P(1,1,1)<−0.08`. This two-sided value detects
  `log(4π)` in place of `log(8π)`, a missing real-place contribution or a wrong pole sign.

`poitouIntegral_sinh_lt` is a separate bound lemma:

`I₁(13/2)<1.04, I₁(8)<0.94.`

Both inequalities are exact real-number targets. The tail identity above and the elementary sine,
cosine and exponential inequalities give analytic bounds for the integrands, including at the
removable singularity at zero. In particular, the stronger upper bounds 1.0037 and 0.9217 suffice,
respectively. The targets concern these integrals and inequalities, as inequalities between exact
integrals and rational numbers. Source context is Odlyzko, §2, p. 123, specialized to the displayed
kernel.

`poitouLowerBound_le_log_abs_discr` states that, for every number field K and every `b>0`,
`P(n,r₁,b) ≤ log |d_K|`, hence `exp(P(n,r₁,b)/n) ≤ rd(K)`. Apply §1.0 to
`F_b`. The prime sum has nonnegative terms because `F_b ≥ 0`, and the zero sum has nonnegative real
terms by positivity on the full strip. Dropping them gives precisely P. This uses
`TauCeti.IsPositiveDefiniteSub.comp_smul`, `NumberField.InfinitePlace.nrRealPlaces` and the
preceding analytic targets. The source is Odlyzko, §2, (2.3)–(2.5), p. 122; the attribution of the
unconditional improvement to Poitou is discussed in §1, p. 121.

`ten_lt_rootDiscr_of_isTotallyComplex` specialises to `r₁ = 0`: degree at least 24 implies root
discriminant greater than 10, and degree at least 36 implies root discriminant greater than 12. Use
`b = 13/2` and 8, the integral bounds, and a rational lower bound `γ>0.5722` obtained from
`Real.eulerMascheroniSeq` at 100 and `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`. The
resulting lower bounds for `P/n` exceed 2.3163 and 2.4952, respectively, with room above `log 10` and
`log 12`. Monotonicity propagates them to larger degrees. `NumberField.IsTotallyComplex`,
`NumberField.nrRealPlaces_eq_zero_iff` and `NumberField.rootDiscr` identify the signature and
conclusion. See Odlyzko, §2, (2.5), p. 122, and Ghitza–Yamauchi, §3, Proposition 3.3, p. 7.

### 1.8 Fontaine's finite-flat different bound

`rootDiscr_torsionField_lt` is the global form of FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.6.5. Let G be a finite commutative flat group scheme over `ℤ[1/N]`, killed by p, with
`p ∤ N`. Its geometric-point field L is finite Galois, unramified outside the primes dividing pN,
and satisfies

`δ(L_𝔭)<1+1/(p−1).`

If its inertia at each prime dividing N is tame, globalisation gives

`rd(L)<p^{1+1/(p−1)} ∏_{ℓ ∣ N}ℓ^{1−1/e_ℓ}.`

The strict inequality, the condition that G is killed by p, and the normalisation `v_p(p) = 1` are all
part of the theorem. The target includes the general `ℤ[1/N]` bound with its tame factor
`∏_{ℓ ∣ N}ℓ^{1−1/e_ℓ}` and the case `N = 1` over `ℤ`. For `N = 1` it gives `rd(L)<4` at `p = 2` and
`rd(L)<3^{3/2}` at `p = 3`. A general group killed by `p^n` has the different estimate
involving n instead; one may not apply the killed-by-p bound to all higher torsion. Fontaine,
introduction, Corollary to Théorème A, p. 516, proves the local result with this normalisation;
Schoof, Proposition 5.1, pp. 853–854, uses its global form. Brumer–Kramer, Proposition 3.2, pp. 7–8,
provides a further account. The prerequisites are FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.6.5, the finite-flat generic-fibre Galois action from
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, local-to-global different compatibility and the
earlier tame formula. The field `ℚ(ζ₈)`, whose root discriminant is 4, cannot be the
point field of a group scheme killed by two over `ℤ`; it tests the strictness of the conclusion.

### 1.9 Degree bounds for Schoof's fields

`finrank_le_of_rootDiscr_lt_of_isTotallyComplex` packages the additional unconditional inequalities
used in Layer 4. For a totally complex number field K, each line below gives an upper bound on its
degree n. The parameter b is used at the first excluded degree, and monotonicity handles all higher
degrees. The first five inequalities have strict hypotheses; the last five allow equality.

| Label | Root-discriminant hypothesis | Degree conclusion | b | First excluded degree |
| --- | --- | --- | --- | --- |
| (a) | `rd < 8.25` | `n ≤ 14` | 41/8 | 15 |
| (b) | `rd < 6.93` | `n ≤ 10` | 17/4 | 11 |
| (c) | `rd < 8.95` | `n ≤ 19` | 6 | 20 |
| (d) | `rd < 19.02` | `n ≤ 287` | 145/8 | 288 |
| (e) | `rd < 14.43` | `n ≤ 59` | 79/8 | 60 |
| (f) | `rd ≤ 5.72` | `n ≤ 8` | 15/4 | 9 |
| (g) | `rd ≤ 4.48` | `n ≤ 5` | 23/8 | 6 |
| (h) | `rd ≤ 13.19` | `n ≤ 43` | 69/8 | 44 |
| (i) | `rd ≤ 16.83` | `n ≤ 119` | 13 | 120 |
| (j) | `rd ≤ 10.199` | `n ≤ 23` | 13/2 | 24 |

For the displayed values of b, the Poitou bound at the first excluded degree exceeds the
root-discriminant threshold. The exact real inequalities give lower bounds 8.41, 7.00, 9.76, 19.12,
14.60, 6.13, 4.54, 13.34, 16.98 and 10.199 in row order; the last is strict. The first excluded
degree need not be even: the bound is evaluated as a function of n and then applies to all permitted
number-field degrees. The normalized bound increases with n, so each strict numerical inequality
implies the stated conclusion for all higher degrees.

The sources are Odlyzko's unconditional 1976 Table 2, totally complex column, and Schoof, §6, pp.
855–858. The degree bounds here are deliberately only as strong as these bounds establish. For
example, lines (c), (d) and (j) state 19, 287 and 23, respectively. The field-degree divisibilities
in the later argument make these bounds sufficient. This target uses the Poitou inequality and
integral API, the Euler-constant and `π` bounds, and `NumberField.IsTotallyComplex`; it does not take
the printed decimal table as an unproved oracle.

This layer's principal landmarks are the sharp two-adic and three-adic different bounds and the
Poitou–Odlyzko inequality. Each bound retains the field signature and valuation hypotheses stated
above.

### 1.10 The finite-flat arithmetic predicates

Use Tau Ceti's finite locally free commutative affine group schemes. `FFGroupSchemeOver R`,
`FFGroupScheme` and `FFGroupSchemeAway l` are just the specializations to `Spec R`, `Spec ℤ` and
`Spec ℤ[1/l]`. The bases of the arithmetic statements are domains of characteristic zero. For such a
base, `order G` is the constant rank of its coordinate Hopf algebra, expressed by `Module.finrank R`; it is not a count of R-rational points. Over a disconnected base, use the supplier's locally
constant rank function instead of this natural-valued specialization.
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra` supplies the coordinate
algebra; `schemeHom` projects a morphism to its underlying scheme map. `algebraAwayRat` is the
localization map sending an integer to the same rational number; it is used only for nonzero l.
These aliases introduce no new category or structure theory. The localization map sends `l⁻¹` to
`1/l`, is the identity on integers, and for `l = 1` is the ordinary map `ℤ → ℚ`; these fix the localization
convention.

Prove invariance of rank under isomorphism, rank equal to cardinality for a finite constant group,
rank n for `μn`, and `order G = order H · order Q` for a short exact sequence over a connected
arithmetic base. They specialize
finite local freeness, finite duality and the native exactness contract. Source: Fontaine, §3.4.5,
Remarque b, p. 536; Schoof, §2.2, p. 849.

**Checks.**

- `order` of `μ₂` and of the constant order-two scheme is two, although `μ₂` has only one geometric
  point on its characteristic-two fibre.
- The trivial group scheme has order one, not zero.
- The constant scheme of `(ℤ/2ℤ)²` has order four, and the product of two order-two schemes has rank
  four; counting generators would give the wrong answer.

`IsKilledBy G n` says that multiplication by n on G is the zero homomorphism. On coordinates it is
`WithConv.toConv (AlgHom.id R (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G)) ^ n = 1`, the
convolution counit. Its API includes `isKilledBy_iff_mul_zero`, stability under closed flat
subgroups, quotients, base change and Cartier duality, and `isKilledBy_mul`, from annihilation by n
to annihilation by mn. This is a predicate on the existing carrier. Source: Schoof, §2, pp. 848–849;
Fontaine, statement of Théorème A, p. 515.

**Checks.**

- Both `μp` and the constant order-p scheme are killed by p.
- The constant scheme `ℤ/p²ℤ` is not killed by p, separating exponent from prime-power order.
- The trivial scheme is killed by one and by every n, while a nontrivial group is not killed by one;
  multiplication by zero kills every group.

`IsSimpleGroupScheme G` is the constant-rank specialization of the simplicity notion owned by
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.23: `order G ≠ 1`, and every closed flat
subgroup embedding `M → G` has rank one or is an isomorphism. Use the supplier's predicate as an
alias when its API is available; `IsSimpleGroupScheme` unfolds this condition on the pinned
finite locally free carrier. The supplier owns invariance under isomorphism and Cartier duality,
prime-order simplicity, and the Dedekind-base comparison. This roadmap owns the classification over
`ℤ` in §3.2.

The generic-fibre comparison specializes as follows: for a Dedekind domain R
with fraction field K of characteristic zero, G is simple if and only if `G(K̄)` is nontrivial and
has no proper nontrivial Galois-stable subgroup. In particular `K = ℚ` covers `ℤ` and `ℤ[1/l]`.
Generic fibres are finite étale in characteristic zero, and the supplier's
§R07.1.20 identifies generic subgroups with their finite flat schematic closures over R. These
hypotheses belong to the comparison, not to the definition of simplicity. Sources:
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.20, R07.1.23; Raynaud (1974), §2.1,
pp. 259–260; Schoof, proof of Proposition 5.1, p. 854.

**Checks.**

- The trivial scheme fails the nonzero condition, and its generic point group is trivial.
- Both `μ₂` and the constant order-two scheme pass, with simple generic Galois modules, although
  their integral models differ.
- The constant scheme `(ℤ/2ℤ)²` fails because a rank-two closed subgroup is proper; its generic
  module has the corresponding invariant line.
- Over `ℤ_p[ζ_p]`, the closure of the graph subgroup in `ℤ/pℤ × μ_p` has rank p and is simple;
  this uses the Dedekind-base comparison and does not identify the two factors over `ℤ`.

`IsConstantGroupScheme G` means an isomorphism to the native constant scheme of a finite commutative
group. `IsDiagonalizableGroupScheme G` means its Cartier dual is constant, so it is the split
diagonalizable condition. Their APIs include invariance under isomorphism, base change, closure
under finite products, and interchange under Cartier duality. The étale and multiplicative-type
theories, and the distinction between split and nonsplit forms, are supplied by
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2–R07.1.7.

**Checks for the constant predicate.**

- The constant scheme `ℤ/2ℤ` over `ℤ` passes.
- `μ₂` over `ℤ` fails: its characteristic-two fibre is not étale.
- Over `ℤ[1/2]`, `μ₂` is constant, by its two distinct sections 1 and `−1`; both the base and the integral
  model matter.
- Over `ℤ[1/7]`, the order-three scheme with point module `𝔽₃` twisted by the quadratic character
  of `ℚ(√(−7))` from §4.1 is finite étale but not constant: its generic Galois action is nontrivial.

**Checks for the diagonalizable predicate.**

- `μ₂` over `ℤ` passes, with constant Cartier dual.
- The trivial scheme passes, with trivial character group.
- The constant scheme `ℤ/2ℤ` over `ℤ` fails, since its dual `μ₂` is not constant over `ℤ`.
- The Cartier dual of the preceding quadratic twist over `ℤ[1/7]` is of multiplicative type but
  not diagonalizable, since its dual is the nonconstant finite étale scheme.

`Ext1Vanishes A B` means that every native short exact sequence `0 → B → E → A → 0` has a section `s : A → E` of its quotient, `s ≫ q = 𝟙 A`. This asserts the vanishing of `Ext¹` with quotient first. Its
API consists of invariance under isomorphisms in both entries, interchange of the two entries after
Cartier duality, and `ext1Vanishes_iff_all_split`. The exact gluing sequence is supplied by
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.38–R07.1.39; §3.3 specializes its
§R07.G5 global vanishing, and §4.3 specifies the arithmetic vanishing over `ℤ[1/ℓ]`
(Schoof, §4, pp. 851–853).

**Checks.**

- `Ext1Vanishes μ₂ (ℤ/2ℤ)` over `ℤ` holds by §3.3.
- The reversed pair fails over `ℤ`: the Katz–Mazur extension attached to `−1` has constant quotient and
  multiplicative subobject and is nonsplit; `ext_zModTwo_muTwo_nonzero` states this boundary.
- An extension with either endpoint trivial splits; this must not require positive rank greater than
  one at both endpoints.

For a base R equipped with its map to `ℚ`, `points G` is the convolution group of R-algebra maps from
the coordinate Hopf algebra to `ℚ̄`, and `galoisAct G σ x` postcomposes such a map by `σ`. The action
API is the identity and composition laws, with `galoisAct_mul` giving the composition law,
compatibility with group multiplication, morphisms,
Cartier duality and base change. `torsionField G` is the intermediate field generated by all values
of all these coordinate maps. Its API includes `numberField_torsionField`, `isGalois_torsionField`
for Galois normality in
characteristic zero, `torsionField_fixingSubgroup` for equality of its fixing subgroup with the
kernel of the point action, and invariance under isomorphism. These are the point-action specialization used in §1.8, supplied
geometrically by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.2 and its generic-fibre
comparisons. Source: Schoof, Proposition 5.1 and proof, pp. 853–854. Number-field structures used in
root-discriminant statements are supplied by this finiteness theorem, not by a data axiom.

**Checks for geometric points.**

- The constant order-n scheme has n geometric points, with the original group operation.
- `μp` has exactly p points over `ℚ̄`, although its characteristic-p fibre has just one point.
- The trivial scheme has one point, the identity, so an empty-point interpretation fails.

**Checks for the action.**

- Galois acts trivially on a constant scheme.
- On `μ₃`, complex conjugation exchanges the two primitive third roots.
- On `μ₂`, complex conjugation is trivial; applying inversion indiscriminately to every constant group
  would give the wrong action.

**Checks for the torsion field.**

- A constant scheme has field `ℚ`.
- `μ₃` has field `ℚ(ζ₃)` of degree two.
- `μ₂` has field `ℚ`, whereas `μ₄` has field `ℚ(i)`; the annihilator does not determine the field.

### Examples

The local normalisation and analytic checks above fix the tame break at zero, the residue-degree
factor and the negative pole term. The rational field has root discriminant one, so none of the
strict degree thresholds applies to degree one.

### Dependencies

Mathlib discriminants, root discriminants, Minkowski, real analysis and number-field signatures; Tau
Ceti positive definiteness and local unit filtrations; LocalFieldsRamification Layers 1, 3 and 4,
NumberFieldArithmetic Layers 5–6, ClassFieldTheory Layers 7 and 13, ArithmeticGaloisRepresentations
Layer 4, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.5, and §1.0.

## Layer 2: The Tate–Serre base cases

This layer uses a kernel field to combine local discriminant bounds with the possible orders of an
irreducible finite image. It proves nonexistence over every finite coefficient field, not only over
the prime field.

### 2.0 Residual carriers and their arithmetic interpretation

`ResidualRep F` specializes `ContinuousMonoidHom` to `G_ℚ → GL₂(F)`, with F finite and discrete in
every arithmetic theorem. An element of `G_ℚ` acts as its underlying `ℚ`-algebra automorphism of `ℚ̄`.
`IsAbsolutelyIrreducible ρ` extends coefficients through `F → AlgebraicClosure F` and applies
Mathlib's `Representation.IsIrreducible` on the natural module. Subgroup images use this same
coefficient map. The API is image monotonicity, scalar-extension compatibility, restriction, and equality
of irreducibility with absence of a stable line in dimension two. ArithmeticGaloisRepresentations
§§1.1–1.7 and 4.2–4.4 own these general interfaces. Sources: Faber, §2, Theorems B–C, p. 3; Khare,
§1, pp. 2–3.

**Checks for images.**

- The trivial subgroup has trivial image.
- The diagonal representation has an invariant coordinate line after scalar extension.
- Restricting the cyclic cubic example to the subgroup fixing its real cubic field gives trivial
  image, although its full image has order three.

**Checks for absolute irreducibility.**

- The trivial rank-two representation fails.
- The cyclic matrix `cubicOrderThreeMatrix = (0,1;1,1)` is irreducible over `𝔽₂` but splits over `𝔽₄`;
  its order is three and its polynomial is `X²+X+1`. It fails absolute irreducibility.
  The theorem `cubicOrderThreeMatrix_irreducible_not_absolute` states the eigenline distinction.
- The natural `S₃` image on the two-torsion of `x0Eleven` is absolutely irreducible: its two distinct
  transvections have different fixed lines.

The cubic matrix itself has determinant one, cube one, and square `(1,1;1,0) ≠ 1`. Its polynomial
has no root in `𝔽₂` and has two distinct roots in `𝔽₄`. These distinguish it from an involution and from
a scalar matrix.

`inertiaAbove l` is the union, over maximal ideals P of the integral closure of `ℤ` in `ℚ̄` containing
l, of the automorphisms `σ` satisfying `σ(x)−x ∈ P` for every algebraic integer x. This is a set of
inertia elements at all primes above l, not a selected decomposition group. `IsUnramifiedAt l ρ`
means every element of this set maps to one. `IsTameAt p ρ` means every inertia image at p has order
prime to p; for finite image this is equivalent to killing wild inertia. Their API includes
conjugation and coefficient extension invariance, the discriminant criterion for the finite Galois
kernel field, and the wild-inertia equivalence. These are the specializations of
ArithmeticGaloisRepresentations §§2.1–2.3 to finite coefficients. The prime condition is part of
every arithmetic use. Source: Ghitza–Yamauchi, §2.3, pp. 5–6.

**Checks for inertia and unramifiedness.**

- The trivial representation is unramified at every prime.
- The mod-three cyclotomic character is unramified away from three, but its inertia at three is
  nontrivial; its kernel field is `ℚ(ζ₃)`.
- The two-torsion representation of `x0Eleven` is ramified at eleven despite being unramified at
  every other odd prime; a definition checking only p would miss it.

**Checks for tameness.**

- An unramified representation is tame.
- The mod-three cyclotomic character is tame at three, with inertia image of order two.
- The faithful local `S₃` representation over `𝔽₃` from the splitting field of `X³−3` is not tame at
  three: its wild inertia has order three.

`IsOdd ρ` means determinant `−1` at every conjugation element specified by a compatible embedding `ℚ̄ → ℂ`. Its API is conjugation invariance, finite coefficient extension invariance and agreement with
ArithmeticGaloisRepresentations §4.1. Sources: Khare, §1, p. 2; Dieulefait–Pacetti, §1.1, p. 3.

**Checks.**

- `diag(1,−1)` in odd characteristic is odd.
- Scalar `−1` has determinant one in dimension two and fails oddness in odd characteristic.
- Every characteristic-two representation is odd in this determinant sense, including the trivial
  representation; oddness does not imply irreducibility.

`kernelField ρ` is `IntermediateField.fixedField ρ.toMonoidHom.ker`. Its API is finite extension
degree, Galois normality, equality of its Galois group with the image, and the inertia/discriminant
comparison. It is a finite extension because the discrete image is finite and the continuous kernel
open. ArithmeticGaloisRepresentations §§1.4 and 2.1–2.2 supply this Galois correspondence. Source:
Moon–Taguchi, §3, pp. 5–7.

**Checks.**

- The trivial representation has kernel field `ℚ`.
- `1 ⊕ ω₃` has kernel field `ℚ(ζ₃)`, of degree two.
- The real cubic example has kernel field `ℚ(ζ₉)⁺`, of degree three; coefficient extension to `𝔽₄`
  preserves this field even though it splits the representation.

`cyclotomicSubfield n` is the subfield of `ℚ̄` generated by all n-th roots of unity;
`realCyclotomicSubfield n` is generated by their sums `ζ+ζ⁻¹`. Use positive n. Their API is
identification with the usual cyclotomic extension and its complex-conjugation fixed field, Galois
normality over `ℚ`, and compatibility for m dividing n. Sources: Jones, §3.1, p. 9; Schoof, §6, pp.
855–858. These specialize Mathlib’s `IntermediateField.adjoin` and cyclotomic extension theory.
`numberField_adjoin_roots` proves finiteness of the field generated by all roots of `Xⁿ−a`
for positive n inside `ℚ̄`. Its specialization `numberField_cyclotomicSubfield` supplies the
number-field instance for each positive cyclotomic index used in discriminants.

**Checks for the cyclotomic subfield.**

- `n = 1` and `n = 2` both give `ℚ`.
- `n = 3` gives `ℚ(√−3)`, whereas `n = 4` gives `ℚ(i)`.
- `n = 12` gives degree four and discriminant 144; adjoining just one chosen real part would instead
  give a real field of smaller degree.

**Checks for the real subfield.**

- `n = 1,2,3,4` give `ℚ`.
- `n = 5` gives `ℚ(√5)`, of degree two.
- `n = 9` gives a real cubic field of discriminant 81, rather than the degree-six cyclotomic field.

`x0Eleven` has Weierstrass coefficients `(0,−1,1,−10,−20)` over `ℚ`. The equation is fixed, not chosen
by a property of its Galois representation. Its discriminant is `−11⁵`, the Weierstrass
invariant `b₂` is `−4`, and its cubic two-torsion polynomial is `4X³−4X²−40X−79`; these
checks fix the linear-y term and the two-torsion model. The API identifies its rational base changes
and geometric point action, with the torsion and basis construction specified in §2.1. Source:
Schoof, §7, pp. 858–859, gives the equation, the surjective `S₃`
action on `J₀(11)[2]` and its simplicity; Mathlib’s Weierstrass invariants give the displayed
computations.

### 2.1 Level-one residual representations

Define `IsLevelOneResidual p ρ̄` for a continuous homomorphism `ρ̄:G_ℚ → GL₂(F)`, with F finite of characteristic p. Its three conditions are absolute
irreducibility, `det ρ̄(c) = −1` for complex conjugation, and trivial inertia at every finite
prime other than p. The last condition is prime-to-p conductor one. It imposes no bound on the Serre
weight and no finite-flat condition at p. Khare, §1, p. 2, and Dieulefait–Pacetti, Theorem 1.1,
§1.1, p. 3, use precisely this setting.

The representation object builds on `Field.absoluteGaloisGroup`, `ContinuousMonoidHom`,
`Matrix.GeneralLinearGroup`, `Representation.IsIrreducible` and `DiscreteTopology`, together with
ArithmeticGaloisRepresentations Layer 1, ArithmeticGaloisRepresentations Layer 2 and
ArithmeticGaloisRepresentations Layer 4. Develop the following properties of `IsLevelOneResidual`:

- Equivalent conditions on the finite Galois kernel field: unramified outside p, absolutely
  irreducible image, and the determinant condition at infinity.
- Invariance under finite coefficient-field extension with discrete target and under change of
  basis in `GL₂(F)`.
- Automatic determinant oddness in characteristic two.
- Total complexity of the kernel field for odd p.

For the last statement, complex conjugation has determinant `−1` and therefore nontrivial image. Since
the kernel field is Galois, it has no real embedding. In characteristic two, an order-two matrix has
determinant one, equal to `−1`, so oddness is automatic. This does not imply absolute irreducibility.

**Checks.**

- `not_isLevelOneResidual_one_add_omega`: at `p = 3` the actual diagonal representation
  `1 ⊕ ω̄₃` is odd and unramified outside three, but fails absolute irreducibility.
- `not_isLevelOneResidual_X0_eleven_two_torsion`: the geometric two-torsion of
  `y²+y = x³−x²−10x−20` has image `S₃` and is absolutely irreducible, but is ramified at eleven.
- For every basis of `x0Eleven`[2], its absolutely irreducible `S₃` action remains absolutely
  irreducible over `𝔽₄` and keeps its kernel field. This is a positive coefficient-extension control.
- An order-two matrix has determinant `1 = −1` in `𝔽₂`. The explicit
  conjugation test fixes this sign without asserting irreducibility.
- `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two`: the generator matrix
  `(0,1;1,1)` has polynomial `X²+X+1`. The cyclic
  real cubic field `ℚ(ζ₉)^+` is irreducible over `𝔽₂` and reducible over `𝔽₄`, so the
  predicate rejects it.

Coefficient-extension invariance over `𝔽₂ → 𝔽₄` specializes the supplier's general theorem; both
level-one predicates are false by Tate’s theorem.

The test objects are specified independently of their expected properties. `oneAddCyclotomic 3 F`
sends `σ` to `diag(1,ω̄₃(σ))`. `realCubicModTwo` uses the mod-nine
cyclotomic character modulo `{±1}`: the cosets `{1,8}`, `{2,7}` and `{4,5}` map to `1`, A
and `A²`, where `A = (0,1;1,1)`. Its kernel field is
tested to equal `ℚ(ζ₉)^+` and to have degree three. For the conductor-eleven example,
`x0Eleven` is the displayed Weierstrass equation, `X0ElevenTwoTorsion` is its actual geometric
two-torsion point group, and `x0ElevenTwoTorsionRep` writes the coordinate Galois action in a chosen
`𝔽₂`-basis. A basis-existence theorem accompanies the construction, and the test holds for
every such basis. `x0ElevenTwoTorsionRep_equivariant` identifies the transported matrix action
with coordinate postcomposition on the included geometric points. Mathlib's
`WeierstrassCurve.Affine.Point.map`, `AddSubgroup.torsionBy` and
`Matrix.GeneralLinearGroup.toLin'` provide these underlying constructions. The generic-fibre point
representation does not supply an integral group scheme over `ℤ[1/11]`.

The representation-construction targets retain their genuine codomains. `modCyclotomicCharacter p F`
is a continuous character `G_ℚ → Fˣ`, the native modular cyclotomic character followed by the
prime-field embedding. `modNineCyclotomicCharacter` is the corresponding character with values in
`(ZMod 9)ˣ`. Their API is multiplicativity, continuity, the action on the specified roots, and the
kernel-field and inertia comparisons. For each, the identity maps to one and arithmetic Frobenius at
a prime q prime to the modulus maps to q. Complex conjugation maps to `−1`; at `p = 2` this equals one,
whereas modulo nine it is eight. These three checks distinguish the native cyclotomic character from
its inverse and from a trivial character. Sources: Khare, §1 and Lemma 5.1, pp. 2 and 20; Mathlib's
`modularCyclotomicCharacter` fixes the action convention.

`oneAddCyclotomic p F` has codomain `ResidualRep F` and diagonal entries `1,ω_p`. Its API identifies
the first invariant line, determinant `ωp`, continuity and unramifiedness away from p. At `p = 3` it is
odd and reducible; at `p = 2` it is the trivial rank-two representation; at a Frobenius with `ωp = q` its
trace is `1+q` and determinant q. A product or scalar character would fail these checks.
`realCubicModTwo : ResidualRep (ZMod 2)` has the three specified cosets and matrices of §2.1; its
API identifies its degree-three kernel field, realness, ramification only at three and
irreducibility over `𝔽₂`. Its generator has order three; complex conjugation maps to one; extension to
`𝔽₄` splits it. These are independent controls on its image, parity and absolute irreducibility
(Jones, §3.1, p. 9; Moon–Taguchi, §3, pp. 5–7).

`X0ElevenTwoTorsion` is the subgroup killed by two in the geometric point group of `x0Eleven`.
Construct its `ZMod 2`-module structure and coordinate Galois action `x0ElevenTwoTorsionAction σ`,
prove `x0ElevenTwoTorsion_basis_exists`, and express that action as `x0ElevenTwoTorsionRep b : ResidualRep (ZMod 2)` for each basis b. The API includes compatibility with the subgroup inclusion,
the identity and composition laws, a two-element basis and the change-of-basis conjugacy formula.
Three checks of the module and action are: the module has four points rather than two; its identity
point is fixed; the three nonzero points are permuted through `S₃`, rather than a trivial or cyclic
action. For its matrix representation, changing basis preserves its kernel field; its image has
order six and is absolutely irreducible; it is ramified at eleven. The equation and two-torsion
polynomial in §2.0 specify the geometric construction independently of these properties. Source:
Schoof, §7, pp. 858–859, for the equation, surjective `S₃` action
and simplicity, and the native Mathlib point-action API.

The operations `ResidualRep.map` and `twist` are coefficient extension and scalar-character twist
from ArithmeticGaloisRepresentations §1.2. Use those supplier operations rather than a second
constructed representation. Their specializations send matrices through the field embedding and
multiply them by the scalar character, respectively. Identity coefficient extension fixes `ρ`,
composition of coefficient embeddings composes the changes, and a field extension preserves the
kernel field. The trivial character fixes a twist, a pair of twists multiplies the characters, and
twisting multiplies the determinant by the square of the character. Those checks pin the direction
and the power in the determinant formula.

### 2.2 Determinant and the tame case

`det_eq_one_of_char_two` asserts that a characteristic-two representation unramified outside two has
determinant one. Its determinant image has odd order. Locally at two the prime-to-p character result
makes it unramified, and at odd primes it is unramified by hypothesis. The corresponding abelian
extension of `ℚ` is unramified at every finite prime, hence trivial by `NumberField.abs_discr_gt_two`
and `NumberField.not_dvd_discr_iff_isUnramifiedIn`. Thus the image lies in `SL₂(F)`. Use the
kernel-field interface and the Layer 1 character lemma; see Moon–Taguchi, §3, pp. 5–6.

`not_isAbsolutelyIrreducible_of_tame` requires `p = 2` or 3, continuity and unramifiedness outside p,
and trivial wild inertia at p. It concludes that the representation is not absolutely irreducible.
The kernel field has root discriminant less than p by the tame formula. Minkowski therefore bounds
its degree by two when `p = 2`, and by five when `p = 3`. Every group of these possible orders is abelian.
After extending to an algebraic closure, commuting matrices have a common eigenvector, contradicting
absolute irreducibility. Use
`TauCeti.exists_unitHom_jointEigenvector_of_pairwise_commute_of_isAlgClosed` for this last step. In
particular, no oddness is needed for the tame lemma itself. The source is Ghitza–Yamauchi,
Proposition 3.2 and proof, §3, p. 7; prerequisites are the globalisation and Minkowski targets and
ArithmeticGaloisRepresentations Layer 2.

### 2.3 The possible irreducible images

`dihedral_or_SL2_of_irreducible_char_two` is a specialised consequence of the Dickson theorem
supplied by ArithmeticGaloisRepresentations Layer 4. A finite irreducible subgroup of `SL₂(𝔽̄₂)` is
either dihedral of order `2r`, where r is odd and at least three, or conjugate to `SL₂(𝔽_q)` with
`q = 2^j ≥ 4`. In the first case an order-two subgroup is its own normalizer; in the second case the
group has order `q(q²−1) ≥ 60`. Upper-triangular cases have a stable line and are excluded. The
dihedral normalizer statement follows by conjugating a reflection by powers of a rotation of odd
order. `Matrix.SpecialLinearGroup` and `Subgroup.normalizer` supply the ambient definitions. The
projective classification is Faber, Theorems B–C, §2, p. 3, and Theorem 6.1, §6, p. 16
(arXiv:1112.1999v1). Its application here is also described by Moon–Taguchi, §3, p. 5, and
Dieulefait–Pacetti, §3, p. 15; Jones, §2.3, pp. 8–9, supplies the Sylow and ramification facts
rather than the classification itself.

`twentyFour_dvd_card_of_irreducible_char_three` assumes a finite irreducible subgroup of `GL₂(𝔽̄₃)`
whose order is divisible by three. It proves that `−1` belongs to the group, that 24 divides its
order, and that either its 3-part is three or its order is at least 720. Faber's projective
classification (Theorem B, §2, p. 3, and Theorem 6.1, §6, p. 16) leaves `PSL₂(𝔽_q)`, `PGL₂(𝔽_q)` for q a
power of three, and `A₅` after excluding groups fixing a line. At `q = 3` the first two groups are `A₄` and
`S₄`. A projective Klein four lifts to anticommuting matrices, whose commutator is `−1`; this supplies
the central factor two needed for the order divisibility. The small cases have 3-part three. The
next field-size cases have order at least 720. Scalar extensions of prime-to-three order do not
change the 3-part. The p-subgroup, matrix-group and projective-image interfaces belong to
ArithmeticGaloisRepresentations Layer 4. Dieulefait–Pacetti, the proof of Theorem 1.3, §1.1, p. 3,
describes the projective classification in the solvable branch. The commutator and order calculation
is this roadmap’s specialization of Faber. The lift to `GL₂` follows by the commutator
argument just given: these projective groups have order divisible by twelve, their scalar kernel has
even order, and that kernel has order prime to three. For `q ≥ 9` the projective order is at least 360,
giving the lower bound 720.

### 2.4 Nonexistence in characteristic two

`tate_no_levelOne_char_two` states that no continuous absolutely irreducible `G_ℚ → GL₂(F)`, for any finite field F of characteristic two, is unramified outside two. Its
proposed declaration is `tate_no_levelOne_char_two`.

The determinant lemma puts the image G in `SL₂`. The tame case is already excluded. In the dihedral
case, wild inertia P has order two. Its decomposition group normalizes P, hence equals P by the
normalizer calculation. The local different bound gives `rd(K) ≤ 2^{3/2}<3`, whereas
`|G| ≥ 6` and Minkowski give root discriminant greater than three. In the `SL₂(𝔽_q)` case,
`|G| ≥ 60` and the sharp two-adic bound gives root discriminant at most four, whereas
Minkowski gives greater than four from degree twelve onward. Both are contradictions. This proof
uses only the algebraic discriminant thresholds: the analytic lower bound is not required here.

The dependencies are the determinant, tame, subgroup and two-adic targets and kernel-field
globalisation. Dieulefait–Pacetti, Theorem 1.1 and proof, §1.1, p. 3, attributes the theorem to
Tate; Khare, §1.1, p. 2, states its role in level one. Moon–Taguchi, §3, pp. 5–7, gives the related
local-to-global discriminant method. The theorem has no separate oddness hypothesis and no
restriction to `F = 𝔽₂`.

### 2.5 Nonexistence in characteristic three

`serre_no_levelOne_char_three` states that no continuous odd absolutely irreducible
characteristic-three representation with finite coefficients is unramified outside three. Its
declaration is `serre_no_levelOne_char_three`. Oddness makes the kernel field K totally complex. The
tame case is excluded first. Otherwise three divides the image order, and the subgroup theorem gives
`24 ∣ [K:ℚ]`.

If the 3-part is three, wild inertia has order three and `rd(K) ≤ 3^{11/6}<7.5`. The
totally complex lower bound at degree 24 is greater than ten. If the 3-part is larger, the degree is
at least 720 and `rd(K)<3^{13/6}<10.81`, whereas the lower bound from degree 36
onward exceeds twelve. Both cases contradict the explicit analytic thresholds. The prerequisites are
the oddness and kernel-field API, the tame and subgroup targets, the three-adic bound and the
totally complex thresholds. See Dieulefait–Pacetti, Theorem 1.1, §1.1, p. 3, and Khare, §1.1, p. 2.

`not_isLevelOneResidual_of_le_three` combines these as `not_isLevelOneResidual_of_le_three`: for p
in `{2,3}`, `IsLevelOneResidual p ρ̄` is impossible. The algebraic-closure version follows by
finite coefficient descent, with discrete target topology. This is the form consumed by R26.1 and by
the 3-adic terminal step of R33.4. Khare, §8, pp. 29–30, also explains why the discriminant strategy
does not simply extend to all characteristics. The Ramanujan representation in characteristic eleven
is a concrete reminder that a level-one nonexistence theorem cannot be asserted for every p.

### Examples

The diagonal, cyclic-cubic and conductor-eleven representations distinguish oddness, absolute
irreducibility and ramification. Their equations and characters specify the examples independently
of the properties being tested.

### Dependencies

Layer 1; ArithmeticGaloisRepresentations Layer 1, ArithmeticGaloisRepresentations Layer 2 and
ArithmeticGaloisRepresentations Layer 4; Mathlib absolute Galois groups, matrix groups, finite
subfields and the geometric elliptic-curve point action; ClassFieldTheory Layer 13 for the small
abelian fields.

## Layer 3: Fontaine's theorem

The essential distinction from Layer 2 is that the representation on torsion need not be
irreducible. A discriminant bound first constrains its field; finite-flat structure then constrains
all its composition factors and extensions. The resulting filtration is applied to every level of
torsion.

### 3.1 Étale schemes and small two-ramified fields

`isConstant_of_etale_over_int` proves that every finite étale commutative group scheme over `ℤ` is
constant. Its geometric points form a finite Galois module unramified at every finite prime. Each
connected number-field component of its finite étale algebra has discriminant of absolute value one.
`NumberField.abs_discr_gt_two` forces its degree to be one. The generic Galois action is trivial,
and the étale Galois-module equivalence identifies the integral model with the constant scheme. The
declaration is `isConstant_of_etale_over_int`. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1
for that equivalence and the discriminant-unramifiedness theorem for the arithmetic step. See
Schoof, the proof of Proposition 3.1, §3, p. 850, and Odlyzko, §1, p. 119.

`isPGroup_two_of_rootDiscr_lt_four` proves a field statement: if a finite Galois extension
`L/ℚ` is unramified at every odd prime and has root discriminant less than four, its degree
is a power of two. Minkowski gives degree at most eleven. Every odd-order abelian quotient is
unramified at two by the character-inertia lemma, hence trivial globally. Among groups of order at
most eleven, the only remaining groups whose order is not a power of two are `S₃` and `D₁₀`; the
elementary small-order group classification is sufficient here. They have quadratic fixed fields
`k = ℚ(i)` or `ℚ(√(±2))`, since k is unramified outside two. The cyclic odd
extension `L/k` is unramified above two: the residue field of k there is `𝔽₂` and a prime-to-two abelian
inertia quotient has order dividing one. It is unramified elsewhere as well. Thus
`rd(L) = rd(k) ≤ √8<3`, contradicting Minkowski since its degree is
six or ten. `isPGroup_two_of_rootDiscr_lt_four` records the conclusion. Inputs are Layer 1,
quadratic discriminants and the local/global Galois interface. Source context is Schoof, Proposition
5.1, §5, pp. 853–854, and Moon–Taguchi, §3, pp. 5–6.

### 3.2 Simple finite flat two-group schemes

`simple_two_groupScheme_over_int` classifies a nonzero simple finite flat commutative group scheme G
of 2-power order over `ℤ` as `ℤ/2ℤ` or `μ₂`. First, flat closure of the generic
subgroup killed by two shows that a simple object is itself killed by two. Fontaine's bound then
gives a point field of root discriminant less than four, and the preceding theorem makes its Galois
group a 2-group. A simple `𝔽₂`-module for a 2-group has a nonzero invariant vector, hence is the
trivial one-dimensional module. Its order is two, and the order-two Oort–Tate classification over `ℤ`
leaves exactly the constant and multiplicative models.

The nonzero hypothesis must appear in `simple_two_groupScheme_over_int`; without it the trivial
scheme satisfies the no-proper-subgroup condition and is neither listed model. The proof uses
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 for flat closure and order-p classification,
ArithmeticGaloisRepresentations Layer 4 for fixed vectors, and the Fontaine and field targets.
`TauCeti.ConstantGroup.groupScheme` provides the constant model, while multiplicative models and
Cartier duality use `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`. See Schoof, Proposition 5.1
and proof, §5, p. 854.

### 3.3 The Ext group and reordering a filtration

`ext_muTwo_zModTwo_eq_zero` specializes FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.G5, target `admissible-global-ext-vanishing`, at `ℓ = 2`. The specialization equation is
`Ext¹_ℤ(μ_ℓ,ℤ/ℓℤ)|_{ℓ=2} = Ext¹_ℤ(μ₂,ℤ/2ℤ) = 0`. Thus every native exact sequence
`0 → ℤ/2ℤ → G → μ₂ → 0` has a section of its quotient, exactly the assertion of
`Ext1Vanishes μ₂ (ℤ/2ℤ)`. The all-prime arithmetic vanishing and its comparison with the
local/complement gluing sequence belong to that supplier. Sources: Mazur, I Proposition 2.1
and proof, pp. 49–54; Schoof, Proposition 4.1, §4, p. 851, and the proof of Corollary 4.2,
p. 853, for the local/Kummer comparison.

**Checks.**

- The three nonidentity S-unit square classes `−1`, 2 and `−2` over `ℤ[1/2]` all remain
  nontrivial over `ℚ₂`, so the restriction kernel in the gluing calculation is zero.
- The local extension over `ℤ₂` with constant subobject and `μ₂` quotient splits by its
  connected component.
- Reversing the endpoints admits the nonsplit Katz–Mazur extension for `−1`, as asserted by
  `ext_zModTwo_muTwo_nonzero`.

`exists_diagonalizable_constant_filtration` specializes FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.G5, target `admissible-global-ext-vanishing`, and its `admissibleConnectedEtaleFiltration`.
For a finite flat commutative G over `ℤ` of rank `2^n`, §3.2's independent theorem
`simple_two_groupScheme_over_int` identifies every simple factor as `ℤ/2ℤ` or `μ₂`.
A composition series therefore makes G admissible at two; the rank-one trivial group has the
empty series. With this admissibility proof, the specialization equation for the supplied
sequence is `(M₂(G) → G → C₂(G)) = admissibleConnectedEtaleFiltration(ℓ := 2, G)`.
Its conclusions are `0 → M₂(G) → G → C₂(G) → 0`, with M₂(G) μ-type and C₂(G) constant.
Here μ-type means Cartier dual to a finite constant group, exactly
`IsDiagonalizableGroupScheme M₂(G)` in §1.10. The adapter returns the native closed flat
subgroup and quotient maps, these two predicates, and the rank equality
`order M₂(G) * order C₂(G) = order G` by multiplicativity of rank in short exact sequences.

The supplier owns the reordering and admissible filtration for every prime; §3.2's
classification and §§3.4–3.5's applications remain targets here. No splitting of the final
sequence is asserted. Sources: Mazur, I §4, Steps 1–2 of the proof of Proposition 4.5,
pp. 59–60 (the argument preceding the odd-prime splitting step); Fontaine, Théorème B(ii),
p. 516, and §3.4.5, Remark b, p. 536; Schoof, Proposition 3.1 and proof, §3, p. 850.

**Checks.**

- For the trivial G, both M₂(G) and C₂(G) are trivial and the rank equality is `1 * 1 = 1`.
- For `G = μ₄`, M₂(G) is G and C₂(G) is trivial; for the constant `ℤ/4ℤ`, M₂(G) is
  trivial and C₂(G) is G. The construction covers groups not killed by two.
- The nonsplit Katz–Mazur group for `−1` has M₂(G) isomorphic to `μ₂` and C₂(G) isomorphic
  to `ℤ/2ℤ`, with `2 * 2 = 4`. A filtration does not imply a product decomposition.

### 3.4 Isogenies and finite-field point counts

`card_points_eq_of_isogeny` proves `#A(k) = #B(k)` for an isogeny `A → B` defined over a finite
field k. Let F be its Frobenius endomorphism. The isogeny commutes with F and hence with `1−F`. The
latter map is separable because its differential is the identity, and its degree equals the size of
its kernel A(k). Comparing degrees in the commuting square and cancelling the positive degree of the
isogeny yields equality of point counts. This handles inseparable isogenies as well: it is `1−F`,
rather than the given isogeny, whose separability matters. Geometric isomorphism over an algebraic
closure would not suffice, as quadratic twists can have different point counts. The declaration
`card_points_eq_of_isogeny` builds on AbelianSchemesAndArithmeticModuli A6, with Frobenius, degree
multiplicativity and finite-field rational points. See Schoof, Proposition 3.1 and proof, §3, p.
850.

Define `numPoints A` as the natural cardinality of the set of k-morphisms `Spec k → A`. Over a
finite field this is finite; the API includes invariance under k-isomorphism, multiplicativity for
products, the equality with the kernel of `1−Frob`, and `card_points_eq_of_isogeny` above. Source:
Schoof, Proposition 3.1, pp. 850–851.

**Checks.**

- The zero abelian variety has one rational point.
- The product `A×B` has `numPoints A · numPoints B` points, not the sum.
- Over `𝔽₅`, `y² = x³−x` has eight points including infinity; its quadratic twist `y² = x³+x` has four.
  Geometric isomorphism alone cannot replace a k-isogeny.

### 3.5 The good-reduction contradiction

`dim_eq_zero_of_goodReduction_everywhere` states that an abelian variety A over `ℚ` with good
reduction at every finite prime has dimension zero. By NeronModelsAndSemistableAbelianVarieties
§§1.8–1.9 it extends to an abelian scheme over `ℤ`. If `g = dim A`, the group scheme `A[2^n]` has rank
`2^{2gn}`, by AbelianSchemesAndArithmeticModuli A3. Apply the filtration theorem to obtain `M_n` and
`C_n`. Fix one finite residue field k of odd characteristic. The quotient `A/M_n` is isogenous to A
and contains the constant group `C_n`; hence `#C_n ≤ #A(k)`.

Cartier duality gives the corresponding constant group `M_n^D` in a quotient isogenous to the dual
of A. A polarization, supplied by AbelianSchemesAndArithmeticModuli A2, identifies the point count
of that dual with the point count of A. Thus `#M_n ≤ #A(k)` as well. Consequently

`2^{2gn} = #M_n#C_n ≤ #A(k)²`

for every n, with the right side independent of n. This forces `g = 0`. The proposed declaration is
`dim_eq_zero_of_goodReduction_everywhere`. Its dependencies are the filtration, point-count theorem,
finite flat torsion and quotients, polarizations, and good-reduction extension to an abelian scheme.
The proof uses the killed-by-two Fontaine bound only in the simple-factor classification; it does
not apply that bound directly to the field of `A[2^n]`.

Fontaine, §3.4.6, Corollary 2 and proof, pp. 536–537, states a result also covering three particular
quadratic fields. The theorem here is its rational-field case, not a claim that the source's theorem
is confined to `ℚ`. Schoof, Proposition 3.1 and proof, §3, pp. 850–851, gives the
constant-by-diagonalizable point-count argument. Brumer–Kramer, §1, p. 1, records Fontaine's theorem
as the starting case of the one-bad-prime problem.

The specialization `HasGoodReductionEverywhere A` means that `A/ℚ` is the generic fibre of a smooth
proper group scheme over `ℤ` with geometrically connected fibres. Its API is invariance under
`ℚ`-isomorphism and isogeny, agreement with good reduction at every finite place, and stability under
products; the general reduction theory is supplied by NeronModelsAndSemistableAbelianVarieties
§§1.8–1.9 and 5.1–5.2. Source: Fontaine, §3.4.6, pp. 536–537.

**Checks.**

- The dimension-zero variety passes, with its trivial abelian-scheme model.
- `x0Eleven` fails at eleven despite good reduction at every other prime.
- `y² = x³−x` fails at two; good reduction at all odd primes does not satisfy the predicate.

Fontaine's nonexistence theorem uses the finite-flat classification and the filtration, not just the
final dimension-zero statement, because Layer 4 reuses the same mechanism over a cyclotomic base.

### Examples

The trivial group scheme is not simple; the constant and multiplicative order-two schemes are
simple. The Ext direction is fixed by `0 → ℤ/2ℤ → G → μ₂ → 0`; the theorem splits this extension.
Fontaine allows the dimension-zero variety and excludes positive dimension.

### Dependencies

Layer 1; finite locally free group schemes and Cartier duality in Tau Ceti;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.6.5, AbelianSchemesAndArithmeticModuli A2, AbelianSchemesAndArithmeticModuli A3 and
AbelianSchemesAndArithmeticModuli A6, and NeronModelsAndSemistableAbelianVarieties §§1.8–1.9.

## Layer 4: Schoof's five-prime theorem

This layer proves the exact set of semistable one-bad-prime exclusions `ℓ ∈ {2,3,5,7,13}`. It
combines a categorical criterion with a small Ext calculation and five field calculations. The pair
`(ℓ,p)` always lists the possible bad prime first and the torsion prime second.

### 4.1 The semistable category

Define `SemistableCategory p l G` as the predicate cutting out the full subcategory `D(p,ℓ)` of finite
flat commutative p-group schemes over `ℤ[1/ℓ]` such that `(σ−1)² = 0` on geometric points for
every inertia element above `ℓ`. Here p and `ℓ` are distinct primes. This is a condition on the generic
Galois module; it must coexist with the integral finite-flat model. The construction builds on
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` and its base-change functor, with
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 supplying generic points, exactness and duality.
Schoof, Definition 2.1(ii), §2, p. 848, defines this category.

The API names `SemistableCategory`, `SemistableCategory.subobject` (including the quotient
statement), `SemistableCategory.prod`, `SemistableCategory.cartierDual`,
`SemistableCategory.inertia_pow` and `SemistableCategory.of_extension`. Closed flat subobjects and
quotients inherit the square-zero condition; finite products satisfy it componentwise. Cartier
duality preserves it because the cyclotomic character is unramified at `ℓ` and the inverse transpose
of `1+N`, with `N² = 0`, is `1−N^{t}`. If `p^k` kills G, then `(1+N)^{p^k} = 1`; thus inertia
acts through a finite p-group and, since `p ≠ ℓ`, acts tamely.

An arbitrary extension of objects of D need not lie in D: combining square-zero blocks can produce a
longer unipotent block. The extension lemma has the stronger hypothesis that inertia acts trivially
on both end objects. Then `σ−1` maps into the subobject and kills it, so its square is zero. In
particular, every extension with end objects `μ_p` and `ℤ/pℤ` belongs to D, and
its Ext group inside D is the same as the ambient finite-flat Ext group. This precise statement is
what makes the criterion below applicable.

**Checks.**

- `zModP_mem_semistableCategory`: the constant order-p scheme and `μp` lie in `D(p,ℓ)` for distinct
  primes; omitting the distinct-prime condition makes the cyclotomic assertion fail.
- `katzMazur_mem_semistableCategory`: every extension with constant quotient and multiplicative
  subobject, including `G_ε`, has upper-unitriangular inertia and lies in D.
- `not_mem_semistableCategory_quadratic_twist`: the finite étale order-three scheme with quadratic
  character of `ℚ(√(−7))` is tame but outside D(3,7), since `(−1−1)² = 1 ≠ 0` in `𝔽₃`.
- `X0_eleven_two_torsion_mem`: the actual integral `J₀(11)[2]` is a simple order-four object of
  D(2,11). It rejects a definition allowing only order-p simple objects and explains the prime
  boundary (Schoof, §7, pp. 858–859: equation, surjective `S₃`
  point action and simplicity).

The twist test uses the finite étale scheme whose geometric point module is `𝔽₃` with the
quadratic character of `ℚ(√(−7))`; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1
supplies its descent and the equivariant point identification. The eleven test uses the kernel of
multiplication by two on the abelian-scheme model of the actual `J₀(11)` over `ℤ[1/11]`;
NeronModelsAndSemistableAbelianVarieties §§1.8–1.9 and AbelianSchemesAndArithmeticModuli A3 supply
that model and its finite flat kernel, with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1's
generic-fibre comparison. These are tests of the identified schemes. These two scheme constructions
and their membership statements are targets with the specified generic-fibre identifications.

`torsion_mem_semistableCategory` proves that if `A/ℚ` has good reduction away from `ℓ` and semistable
reduction at `ℓ`, its abelian-scheme model over `ℤ[1/ℓ]` has `A[p^n] ∈ D(p,ℓ)` of rank `p^{2gn}`,
for every `n ≥ 1`. NeronModelsAndSemistableAbelianVarieties §§1.8–1.9 supplies the model,
AbelianSchemesAndArithmeticModuli A3 supplies the finite flat kernel and rank, and
NeronModelsAndSemistableAbelianVarieties §§3.5–3.11 supplies Grothendieck's `(σ−1)² = 0`
monodromy criterion. See Schoof, §2.1, p. 849. The theorem applies to the whole torsion group
scheme, not just its semisimplified generic representation.

A square-zero condition need not survive an arbitrary extension of two objects already satisfying
it. Over `𝔽₃`, the three-by-three unipotent Jordan matrix `J = (1,1,0;0,1,1;0,0,1)` has `(J−1)²` with
top-right entry one, although its length-two submodule and one-dimensional quotient have square-zero
inertia. The extension API therefore requires inertia to be trivial on both endpoints.

### 4.2 Splitting over a fixed cyclotomic base

`isConstant_baseChange_cyclotomic` considers a finite étale p-group scheme C over `ℤ[1/ℓ]` with a
filtration by constant order-p quotients. Its point representation has unipotent image, a finite
p-group P, and is unramified outside `ℓ`. Its maximal abelian quotient cuts out a p-power subfield of
`ℚ(ζ_ℓ)`, by Kronecker–Weber and tameness at `ℓ`. Consequently `P^{ab}` is
cyclic. The p-group Frattini theorem implies P is cyclic as well, and the entire representation
therefore factors through `Gal(ℚ(ζ_ℓ)/ℚ)`. C becomes constant
over `ℤ[1/ℓ,ζℓ]`. Cartier duality makes an iterated extension of `μp` diagonalizable over that same
ring.

The declarations `isConstant_baseChange_cyclotomic` and `isDiagonalizable_baseChange_cyclotomic`
expose both conclusions and the generic action factorisation. Their inputs are
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, ClassFieldTheory Layer 13,
`TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top` and `TauCeti.commutator_le_proPFrattini`, with
finite p-groups viewed as pro-p groups. The base extension is independent of n and of the length of
the filtration; this uniformity is needed for a fixed point count. See Schoof, Proposition 3.1 and
proof, §3, p. 850.

The finite-filtration predicate `IsIteratedExtensionOf A G` means that G has a finite filtration by
closed flat subgroup schemes, with every nonzero successive quotient isomorphic to A. Its intended
signature is a predicate on two finite locally free commutative group schemes over the same
arithmetic base. Include the empty filtration of the trivial group, a one-step filtration of A, and
concatenation along native short exact sequences. The API is invariance under isomorphism and
Cartier duality, construction from a short exact sequence and filtrations of its endpoints, and rank
`order G = (order A)^r` for a filtration of length r. Source: Schoof, Proposition 3.1 and proof, §3,
pp. 850–851; subgroup and quotient existence is FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.20 and AbelianSchemesAndArithmeticModuli A3.

**Checks.**

- The trivial group is an iterated extension of every A, with length zero.
- The constant group `ℤ/p²ℤ` has a two-step filtration by constant `ℤ/pℤ`; it need not be killed by p.
- `μ₂` over `ℤ` is not an iterated extension of constant `ℤ/2ℤ`: its rank forces length one, which would
  identify a non-étale model with an étale one.

`no_semistable_of_simple_and_ext` assumes that the only nonzero simple objects of `D(p,ℓ)` are the
constant and multiplicative order-p schemes and that `Ext¹_{ℤ[1/ℓ]}(μ_p,ℤ/pℤ) = 0`. It concludes that an abelian variety over `ℚ` with good
reduction away from `ℓ` and semistable reduction at `ℓ` has dimension zero. Composition factors of its
torsion can be reordered exactly as in Layer 3, because the Ext group in D agrees with the ambient
group for these endpoints. Over the fixed cyclotomic base, the lower part becomes diagonalizable and
the upper quotient constant. Choose a finite residue field of that base away from `pℓ`. The same
isogeny and duality argument gives `p^{2gn} ≤ #A(k)²` for every n. This forces `g = 0`. The
declaration `no_semistable_of_simple_and_ext` depends on torsion membership, cyclotomic splitting,
the Layer 3 point-count theorem and AbelianSchemesAndArithmeticModuli A2–A3. See Schoof, Proposition
3.1, §3, pp. 850–851.

### 4.3 Computing the Ext obstruction

`ext_muP_zModP_eq_zero` computes, for `p = 2` or 3, the `𝔽p`-dimension of the Ext group in the criterion.
It is one precisely when `ℓ ≡ ±1mod 8` for `p = 2`, or `ℓ ≡ ±1mod 9` for `p = 3`;
otherwise it is zero. In particular it vanishes for all five chosen pairs
`(2,3),(3,2),(5,2),(7,3),(13,2)`.

Use `mayerVietoris_exact` of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.39 and
`kummerIso`, `kummerIso_res` of ProfiniteCohomology Layer 9. Prove as auxiliary statements here
the local finite-flat Ext calculation and the S-unit restriction sequence at `p = 2,3`: the stated
PID computations eliminate the class-group term and identify the allowed valuation directions.
After adjoining `ζp`, the generic extension classes are identified
with the cyclotomic-character-square eigenspace of S-units modulo p-th powers, subject to triviality
in the relevant local quotient at p. Both the global and local terms and the equality with the
kernel have to be computed. For `p = 2`, the surviving unit direction is represented by `ℓ` and the local
square condition gives the mod-eight criterion. For `p = 3`, units in `ℚ(ζ₃)` and the cube condition give
the mod-nine criterion. The rings of integers needed in these two cases are principal;
`IsCyclotomicExtension.Rat.three_pid` supplies the nontrivial one. Thus no general Herbrand theorem
for arbitrary p is hidden in this calculation. The vanishing part is exposed as
`ext_muP_zModP_eq_zero`; the full dimension statement remains part of the mathematical target. See
Schoof, Corollary 4.2, §4, p. 852, and its proof, p. 853.

**Checks.**

- For `(ℓ,p) = (5,2)`, 5 is not a square in `ℚ₂` and the Ext group vanishes.
- For `(ℓ,p) = (7,3)`, 7 is not congruent to `±1` modulo nine and the Ext group vanishes.
- At `(ℓ,p) = (17,2)`, the exceptional square class gives dimension one, so uniform vanishing fails.

### 4.4 A field criterion for simple objects

`simple_eq_of_fieldCriterion` sets F equal to the degree-p subfield of `ℚ(ζℓ)` if `p ∣ ℓ−1`, and
to `ℚ` otherwise, and puts `M = F(ζ_{2p},ℓ^{1/p})`. Assume that *every* finite Galois extension
`L/ℚ` containing M, unramified over M away from p, with `δ(L_𝔭)<1+1/(p−1)`, has
`[L:ℚ(ζ_p)]` a power of p. Then every nonzero simple object of `D(p,ℓ)` is `ℤ/pℤ` or `μp`.

To prove it, a simple object is first shown to be killed by p. Enlarge its point field by adjoining
the standard auxiliary group schemes used by Schoof: the Katz–Mazur extension for `ℓ`, and the
appropriate constant Galois module (or the order-two auxiliary model). Their combined field contains
M. Membership in D makes inertia at `ℓ` have order at most p; Fontaine's strict bound applies at p.
This enlarged field satisfies the field criterion. Over `ℚ(ζp)` the point action is therefore a
p-group action, whose invariants are nonzero. Simplicity forces the generic module to be
one-dimensional. The remaining order-p Oort–Tate models are possible twists of the constant or
multiplicative model. Their twisting character has prime-to-p order and is unramified at `ℓ` and at p
in the relevant quotient; it is unramified everywhere and hence trivial. This yields precisely the
two stated schemes.

`FieldCriterion l p` records the universally quantified field condition;
`simple_eq_of_fieldCriterion` applies it to a simple G with order different from one. The arithmetic
interpretation of “unramified over M” is relative inertia, not unramifiedness of `L/ℚ` at the primes
already ramified in M. The prerequisites are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, the
D API, the Fontaine bound, ArithmeticGaloisRepresentations Layer 4 and global class-field theory.
See Schoof, Proposition 5.1 and proof, §5, pp. 853–854.

The `FieldCriterion` predicate is used only for distinct primes. Its API is invariance under
`ℚ`-isomorphism of the marked auxiliary fields, the equivalent absolute-degree conclusion
`[L:ℚ] = (p−1)p^r`, and the application to simple objects in this section.

**Checks.**

- At `(ℓ,p) = (2,3)`, the degree-p cyclotomic part F is `ℚ` and M is the degree-six splitting field of
  `X³−2`; setting F to the full `ℓ`-th cyclotomic field in every case would be incorrect.
- At `(ℓ,p) = (13,2)`, `F = ℚ(√13)` and `M = ℚ(i,√13)`; the 2p-th root of unity is essential.
- An inertia element at `ℓ` may act nontrivially on M. Relative unramifiedness requires only that one
  fixing M also fixes L, and the strict local bound excludes equality at two when `p = 2`. Absolute
  unramifiedness at `ℓ` and a non-strict bound are different conditions.

### 4.5 Class-number bounds used in the five cases

`classNumber_eq_one_small_fields` establishes class number one for four specific fields, with the
conclusion that each has no nontrivial unramified abelian extension. These are arithmetic bounds,
not calls to a numerical class-number oracle.

For `M = ℚ(ζ₃,∛2)`, the degree is six and the discriminant is `2⁴ 3⁷`, giving
root discriminant below 5.72. Its Hilbert class field has the same root discriminant and degree
`6h_M`. Line (f) of the degree table gives `6h_M ≤ 8`, so `h_M = 1`. For `M = ℚ(i,√5)`, the
degree is four and the discriminant is 400; root discriminant is below 4.48, and line (g) gives
`4h_M ≤ 5`, again forcing one.

For `ℚ(ζ₁₂)`, the discriminant is 144. The direct small-discriminant PID criterion
proves class number one: `RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`, with degree four and
two complex places, requires `|d_M|<(4π²/3)²`, whose right side is about 173.2. The
inequality 144 below this threshold is sufficient. A root-discriminant degree bound alone would
permit class number two and is insufficient. `NumberField.classNumber_eq_one_iff` translates
principality to class number one.

For `ℚ(i,√13)`, the discriminant is 2704 and the Minkowski ideal-class bound is less
than eight. The prime above two has norm four and is generated by `1+i`. At rational primes three,
five and seven, the residue degrees are two, so the prime norms exceed the bound. Every class
therefore has a principal representative. Use ClassicalArithmeticCompletion §5.1 or
`RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_lt_or_isPrincipal_of_mem_primesOver_of_mem_Icc`
for the small-prime generation argument, and
`TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant` together with the discriminant tower
theorem for the values. Global class-field theory ClassFieldTheory Layer 13 turns these calculations
into the asserted unramified-extension exclusions. The proposed combined declaration is
`classNumber_eq_one_small_fields`. Sources are Schoof, §6, pp. 855–858, and Odlyzko, 1976 Table 2 at
degrees six and nine for the analytic comparisons.

### 4.6 The pairs (2,3), (3,2) and (5,2)

`fieldCriterion_two_three` proves `FieldCriterion 2 3` and the stronger assertion that an admissible
L equals `M = ℚ(ζ₃,∛2)`. Tame inertia at two has order three, while the Fontaine
bound at three gives `rd(L)<2^{2/3}3^{3/2}<8.25`. Line (a) restricts the degree to at
most fourteen. Since six divides the degree, L is M or a quadratic extension of M. The class-number
bound excludes an unramified quadratic extension. There is a unique prime above three, with residue
field `𝔽₃`, and the unit `−1` maps to its nontrivial residue unit. Thus the prime-to-three ray class
quotient there is trivial, excluding a ramified quadratic extension as well. The result is `fieldCriterion_two_three`, together with the stronger conclusion `L = M` and
`[L:ℚ] = 6` for the concrete subfield `schoofFieldTwoThree` of `ℚ̄`. Its inputs are the field criterion, class-number theorem, local/global
different formulas, ray class theory and degree line (a). See Schoof, §6, the case `ℓ = 2`, `p = 3`, p. 855.

`fieldCriterion_three_two` proves `FieldCriterion 3 2`. Here `M = ℚ(ζ₁₂)` has degree
four. Inertia at three has order two and the strict two-adic bound gives
`rd(L)<√3·4<6.93`. Line (b) gives degree at most ten; divisibility by four
leaves only four or eight. Both are powers of two, so no class-field calculation is needed for this
criterion. The target `fieldCriterion_three_two` includes the stronger degree-four-or-eight
conclusion using the concrete subfield `schoofFieldThreeTwo`. They use the same different and field interfaces with degree line (b). See
Schoof, §6, `ℓ = 3`, `p = 2`, pp. 855–856.

`fieldCriterion_five_two` proves `FieldCriterion 5 2` for `M = ℚ(i,√5)`. Now
`rd(L)<√5·4<8.95`, so line (c) gives degree at most nineteen. The possible
multiples of four are four, eight, twelve and sixteen. Degree twelve would be a cyclic cubic
extension of M unramified away from two. Class number one excludes its unramified part. At the
unique prime above two, the residue field is `𝔽₄` and `η = (1+√5)/2` reduces to an element
satisfying `η² = η+1`, generating `𝔽₄×`. Units therefore kill the possible tame cubic ray-class
quotient, excluding degree twelve. The remaining degrees are four, eight and sixteen. The
target is `fieldCriterion_five_two`, including the three degree possibilities for the concrete
field `schoofFieldFiveTwo`. Use line (c), the class-number
bound, reciprocity and the different formulas. Schoof, §6, `ℓ = 5`, `p = 2`, pp. 856–857, gives the
corresponding computation over `ℚ(ζ₂₀)` using Proposition 5.2; the argument here is the Proposition
5.1 form over `ℚ(i,√5)` and uses only line (c). The degree conclusion does not require a stronger
bound than nineteen.

All three companion statements take a finite Galois subfield `L ⊆ ℚ̄`
containing the specified M. They assume `L/M` is unramified away from p and `v_p(d_L)/[L:ℚ]<1+1/(p−1)`. The relative unramifiedness premise means that, at every prime `q ≠ p`, an inertia
element fixing M also fixes L. It retains the ramification already present in M at `ℓ`; it does
not assert that L is unramified there over `ℚ`.

The light intermediate-field definitions `schoofFieldTwoThree`, `schoofFieldThreeTwo` and
`schoofFieldFiveTwo` are the indicated composita inside `ℚ̄`. Their API is equality with the specified
splitting or cyclotomic field, Galois normality, degree, discriminant and invariance under a
different primitive root or radical choice. Establish number-field structures using finiteness of
the field generated by the roots of a positive power equation, cyclotomic finiteness and finite
composita. Sources: Schoof, §6,
pp. 855–857.

**Checks for `schoofFieldTwoThree`.**

- It has degree six, rather than the degree-three non-Galois pure cubic field.
- Its absolute discriminant is `2⁴3⁷`.
- It contains all three roots of `X³−2` and has Galois group `S₃`; omitting `ζ₃` fails this check.

**Checks for `schoofFieldThreeTwo`.**

- It equals `ℚ(ζ₁₂) = ℚ(i,√3)`, of degree four.
- Its discriminant is 144 and it is totally complex.
- Its ramification index at three is two, so it is not the quadratic field `ℚ(√3)`.

**Checks for `schoofFieldFiveTwo`.**

- It has degree four and discriminant 400.
- Its unique prime over two has residue field `𝔽₄`; a totally ramified degree-four model fails.
- `(1+√5)/2` reduces to a generator of `𝔽₄×`, with square equal to itself plus one.

### 4.7 The pair (7,3)

`fieldCriterion_seven_three` proves `FieldCriterion 7 3` with `K = M = ℚ(ζ₃,ζ₇+ζ₇⁻¹,∛7)`, of degree eighteen. The root-discriminant upper bound is
`3^{3/2}7^{2/3}<19.02`. Line (d) implies `[L:ℚ] ≤ 287`, so `π = Gal(L/K)` has
order at most fifteen. Such groups are solvable.

First, K has class number one. Its root discriminant is `3^{7/6}7^{2/3}<13.19`, and line (h)
restricts the degree of its Hilbert class field to at most forty-three, so the class number is at
most two. A quadratic Hilbert class field would be Galois over `ℚ(ζ₃)`, with central kernel of order
two over the odd-order 3-group `Gal(K/ℚ(ζ₃))`. The unique Sylow-3
complement descends an unramified quadratic extension to `ℚ(ζ₃)`. Its degree over `ℚ` would be four and
its root discriminant `√3`, contradicting Minkowski. Therefore the class number is one. The
different calculation uses
`NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`.

At the unique prime of K over three the residue field is `𝔽₂₇`. The units `−1` and
`c = ζ₇+ζ₇⁻¹` generate its multiplicative group: the image of c has order thirteen or
twenty-six. Together with class number one, this eliminates every prime-to-three abelian extension
of K unramified outside three. Thus `π^{ab}` is a 3-group. Its possible orders are one,
three or nine. If it has order one, solvability forces `π` trivial; if nine, the order bound forces `π`
itself to have order nine.

Suppose its order is three, and let `K′` be the corresponding cyclic cubic extension. Its conductor is
`𝔭^a`. The conductor–discriminant formula gives

`rd(K') = 3^{7/6+a/9}7^{2/3}.`

The strict upper bound on L forces `a ≤ 2`, while wild ramification forces `a ≥ 2`. Hence `a = 2` and
`rd(K')<16.83`. The degree of `K′` is fifty-four, and line (i) restricts its Hilbert
class field to degree at most 119; its class number is at most two. A quadratic unramified extension
is again ruled out by the central extension argument over `ℚ(ζ₃)`, now with a Galois 3-group of order
twenty-seven. Thus `K′` also has class number one.

Let `π' = Gal(L/K')`; its order is at most five and it is abelian. The extension `K′/K`
is totally ramified at three and has the same residue field `𝔽₂₇`. The same two units from K therefore
still generate the residue units in `K′`. Class number one of `K′` and this new local unit calculation
exclude every prime-to-three part of `π′`. If `π′` had order three, `π` would have order nine and hence be
abelian, contradicting the assumption that its abelianisation has order three. Thus `π′` is trivial.
In every case `L/ℚ(ζ₃)` has 3-power degree, as required by `fieldCriterion_seven_three`.

It is not valid to descend an arbitrary abelian extension of `K′` merely by taking a compositum with
K: an abelian quotient of a subgroup need not be an abelian quotient of the whole group. The
argument above proves the needed exclusion directly over `K′`. Its ingredients are the field
criterion, degree lines (d), (h), (i), Minkowski, unit reciprocity and conductor–discriminant
theory. Schoof, §6, `ℓ = 7`, `p = 3`, pp. 857–858, supplies the field and unit calculations.

### 4.8 The pair (13,2)

`fieldCriterion_thirteen_two` proves `FieldCriterion 13 2` for `M = ℚ(i,√13)`. The
root-discriminant upper bound is `4√13<14.43`. Line (e) gives degree at most fifty-nine, so
`[L:M] ≤ 14`. Kronecker–Weber and the local strict bound identify M as the maximal abelian subfield
of L over `ℚ`: additional 2-power cyclotomic ramification would introduce the forbidden two-adic
exponent two, while inertia at thirteen has order at most two.

Put `π' = Gal(L/M)`, the commutator subgroup of the global Galois group. M has class
number one. Its unique prime above two has residue field `𝔽₄`, and `η = (3+√13)/2` generates
the residue-unit group. Thus `(π')^{ab}` is a 2-group. For a quadratic extension of
conductor `𝔭^a`, the normalised two-adic exponent is `1+a/4<2`, so `a ≤ 3`. The possible
quadratic conductor exponents are 0, 2, 4 and 5, leaving only two. The corresponding ray class field
has degree two and is `K = M(√η)`. The image of i in the units modulo `𝔭²` supplies
the remaining unit calculation. An abelian extension of larger degree would already violate the
strict local bound; hence `|(π')^{ab}| ≤ 2`.

If this abelianisation is trivial, solvability of the group of order at most fourteen forces `π′`
trivial. Otherwise it has order two and K is the associated quadratic subfield. Its degree is eight
and root discriminant `2^{3/2}√13<10.199`. Line (j) gives degree at most twenty-three for the
Hilbert class field, so its class number is at most two. This excludes the odd part of any
unramified abelian extension. The prime above two remains unique with residue field `𝔽₄`, and the
inherited units still generate `𝔽₄×`; thus it also has no odd-degree tame abelian extension ramified
only there.

Let `π'' = Gal(L/K)`, of order at most seven. The Frattini argument implies its
abelianisation has odd order: a nontrivial 2-quotient would give a larger 2-part in the
abelianisation of `π′`. The preceding class-field and unit calculations make that odd abelianisation
trivial. A solvable perfect group is trivial, so `π″` is trivial. L therefore has degree four or
eight, in either case a power of two. The declaration is `fieldCriterion_thirteen_two`.

The argument uses lines (e) and (j), the class-number bound, ray class theory, the different tower
formula and `TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`. It does not assert that the class
number of K has already been proved to be one: the bound by two is sufficient because only an odd
abelian quotient must be excluded. See Schoof, §6, `ℓ = 13`, `p = 2`, p. 858.

### 4.9 The theorem and its boundary

`no_semistable_abelianVariety_one_prime` now applies the criterion in each of the five pairs. The
Ext calculation vanishes, and the field criterion gives the required simple objects. Thus every `A/ℚ`
with good reduction away from `ℓ ∈ {2,3,5,7,13}` and semistable reduction at `ℓ` has dimension
zero. The declaration is `no_semistable_abelianVariety_one_prime`. This is Schoof, Theorem 1.1, §1,
p. 847, and Dieulefait–Pacetti, Theorem 1.2, §1.1, p. 3.

The statement excludes neither arbitrary additive reduction nor the prime eleven. For example
`y² = x³−x` has additive reduction at two, so “good away from two” alone is insufficient. The
nonzero Jacobian `J₀(11)` is semistable and good away from eleven. Its simple order-four
two-torsion forces `not_fieldCriterion_eleven_two`, the failure of `FieldCriterion 11 2`. More generally, `J₀(ℓ)`
explains the sharp prime set. The geometric statement concerns every dimension; `GL₂`-type is not a
hypothesis here. The Schoof theorem and the semistable category are the layer's landmarks, with five
independently justified field criteria as its arithmetic conclusions.

### Examples

The quadratic order-three twist separates tameness from the square-zero condition. The order-four
torsion at eleven separates membership in D from the simple-object classification proved only at the
five listed primes.

### Dependencies

Layers 1 and 3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.5, NeronModelsAndSemistableAbelianVarieties
§§1.8–1.9 and NeronModelsAndSemistableAbelianVarieties §§3.5–3.11, AbelianSchemesAndArithmeticModuli
A2, AbelianSchemesAndArithmeticModuli A3 and AbelianSchemesAndArithmeticModuli A6; ClassFieldTheory
Layer 13, ProfiniteCohomology Layer 9, and ClassicalArithmeticCompletion
ClassicalArithmeticCompletion §5.1 for the Ext and class-number calculations.

## Layer 5: Realisation and terminal weights

This layer connects two-dimensional p-adic representations to abelian varieties, verifies the
hypotheses needed to use that connection, and then excludes a short list of residual weights. The
sequence of the proofs matters: characteristic two and three are settled first; weight two is
settled using Fontaine; the selected weights `p+1` are settled using Schoof; the remaining small
weights use these results at an auxiliary prime. None of those steps imports the completed Serre
modularity theorem.

### 5.0 Lifting and realization inputs

The following targets fix the precise lifting and comparison statements used in this layer. Their
carriers are the continuous representations and lattices of ArithmeticGaloisRepresentations Layer 1,
the local weight recipe of AlgebraicModularFormsAndSerreWeights R15.4, and the de Rham, crystalline,
semistable and labelled-weight predicates of FiniteFlatGroupsAndIntegralPadicHodgeTheory
§§R07.P2–R07.P5a and R07.P7. Representations over `ℚ̄p` are understood through a model over a finite
extension of `ℚp`. No property is an unconstrained proposition field. These specialized mathematical
targets belong here and are not assumptions of residual level-one modularity.

#### 5.0a The cyclotomic restriction condition

`SatisfiesA1Residual p ρ` means absolute irreducibility of the restriction to the subgroup fixing
`cyclotomicSubfield p`, after extension to an algebraic closure of the finite coefficient field. Its
API is invariance under coefficient extension and conjugation, stability under restriction to an
extension linearly disjoint from the compositum of the residual field and `ℚ(ζp)`, and the
dihedral-failure criterion used in §5.6. General
restriction and image theory is supplied by ArithmeticGaloisRepresentations §§1.7, 4.6–4.7. Source:
Snowden, §3.1, p. 6; Khare, Lemma 5.1, pp. 20–21.

**Checks.**

- A reducible diagonal representation fails the condition.
- At `p = 2` the cyclotomic subfield is `ℚ`, so the condition is ordinary absolute irreducibility,
  as stated by `satisfiesA1Residual_two_iff`.
- For the natural representation of `GL₂(𝔽₃)`, restriction to `SL₂(𝔽₃)` is still absolutely
  irreducible: the two elementary unipotent matrices have different fixed lines. Thus a
  determinant-kernel restriction need not destroy irreducibility.
- Let L split `X³−2`, and take its standard `S₃` representation over `𝔽₇`. It satisfies (A1),
  since L and `ℚ(ζ₇)` are disjoint. Although `F′ = ℚ(√21)` is disjoint from L,
  `F′ℚ(ζ₇)` contains `ℚ(√−3)`, the quadratic subfield of L. The restricted image is `C₃`
  and splits over `𝔽₇`. Disjointness from L alone therefore does not preserve (A1).

#### 5.0b Potential modularity with disjointness

For p odd, a continuous finitely ramified odd rank-two representation of `G_ℚ`, de Rham at p with
Snowden weights `{0,−1}` and residual condition (A1), prove
`potentialModularity_weightTwo_disjoint`: for every finite extension `M/ℚ` there is a finite totally
real Galois extension `F″/ℚ` disjoint from the compositum of M, the residual field and `ℚ(ζp)`,
and a cuspidal parallel
weight-two Hilbert eigenform f over `F″` whose p-adic representation is the restriction of `ρ`. The
disjointness must be asserted for the compositum of the prescribed finite fields. The `p = 5` condition
(A2) holds over `ℚ` because its fifth cyclotomic extension has degree four. Source: Snowden, Theorem
5.1.2, §5.1, p. 15, and Proposition 9.4.1, pp. 29–30. *Needs:* the representation, lattice, local
Hodge and abelian-moduli suppliers above. The solvable descent used in §5.3 is the following
weight-two target.

`weightTwo_solvable_descent` provides the following single-representation descent. Let `E/F` be
finite solvable Galois between totally real number fields, p a rational prime, and `ρ` a continuous
rank-two representation of `G_F` over `ℚ̄p`, defined over a finite extension of `ℚp`. Assume `ρ|G_E` is
absolutely irreducible and a cuspidal parallel weight-two Hilbert eigenform over E has p-adic
representation isomorphic to `ρ|G_E`. Produce a cuspidal parallel weight-two Hilbert eigenform over
F whose p-adic representation is `ρ`.

As part of this target, construct the weight-two Hilbert Galois attachments of the intermediate
cuspidal descents in a prime-cyclic tower: finite coefficient descent, continuity, good-prime
characteristic polynomials, and compatibility of restriction with cyclic base change. Retain the
arithmetic-dual convention of GL2AutomorphicRepresentationsAndTransfer. Its R17.4.10 supplies the
tower descent and character-fibre interfaces. At each prime-cyclic step, matching good-prime
polynomials and the supplier's strong multiplicity one prove invariance of the upper form, giving
a cuspidal descent. Absolute irreducibility and Schur's lemma
compare an attached descent with `ρ` by a finite quotient character; class field theory identifies
the automorphic twist giving the required match. This proves the character choice at the fixed
p-adic embedding, without assuming an entire compatible family for `ρ`. R17.6.18–R17.6.19 apply
only when their compatible families and common-index hypotheses are also supplied; they do not
supply these Hilbert attachments. Source: Snowden, proof of Proposition 9.4.1, p. 30, the solvable
descent step. *Needs:* ArithmeticGaloisRepresentations Layers 1–2 for coefficient and restriction
API, ClassFieldTheory Layer 11 for finite characters, and GL2AutomorphicRepresentationsAndTransfer
R17.4.10 for automorphic solvable descent; the stated weight-two Hilbert attachments belong here.

**Checks.**

- `E = F` returns the supplied form and the same p-adic attachment.
- At a prime-cyclic step of degree `ℓ`, the `ℓ` descent twists are compared with `ρ`; matching the
  restriction alone does not select the untwisted descent. The quotient character selects the match.
- The natural `GL₂(𝔽₃)` representation restricted to `SL₂(𝔽₃)` remains absolutely irreducible,
  whereas a representation with reducible restriction does not satisfy the descent hypothesis.
- A single p-adic match asserts no common twist index at other coefficient places; use of
  R17.6.18 requires its compatible-family hypotheses in addition.

#### 5.0c The weight-two geometric eigensummand

Construct `shimuraCurve_picard_correspondences` for the smooth proper geometrically connected
curve components used here over their number fields of definition. The Jacobian `Pic⁰` is an abelian
variety without a rational-point hypothesis: descend the pointed construction from a finite Galois
extension with a point, and identify it with the identity component of the Picard sheaf supplied by
JacobianChallenge Layer D. The descent identifications are independent of the chosen point and
satisfy the cocycle law. Construct pullback and norm pushforward on `Pic⁰` for the finite maps of
smooth proper curves, hence the action `b_* a^*` of a correspondence `C ← D → C`. Prove the
composition law, field descent, base change and compatibility with the homological Tate realization
and its dual `H¹`. For the split quaternion case, first specialize ShimuraVarieties §§8.18–8.19 to
the smooth proper compactification at neat level and its extended Hecke legs; the open curve alone
has no proper Jacobian of the required kind. Sources: Bosch–Lütkebohmert–Raynaud, §9.3, p. 258,
and §9.4, Proposition 4, pp. 260–261; Milne, *Jacobian Varieties*, Theorem 1.1, §4 and §6,
Corollary 6.3, pp. 2, 14–16, 20–21, for descent and the correspondence construction. For the Tate
comparison, use InverseGaloisAndArithmeticFundamentalGroups IG.0.T1 /
`VanishingCycles.curveEndomorphismTrace`, which supplies the finite-level and rational
curve–Jacobian `H¹` comparisons and the pullback/pushforward orientation. Prove compatibility of
the descended correspondence actions with those comparisons.

**Checks.**

- A smooth pointless conic has `Pic⁰ = 0`, even though it has no degree-one line bundle over the
  base field. No rational point is required for the abelian variety `Pic⁰`.
- For a finite curve map f of degree d, `f_* f^* = [d]`; the diagonal correspondence acts as identity.
- For a split quaternion algebra, adjoining the cusps gives the proper modular curve; the extended
  Hecke action agrees with its open action and descends over the same field.

For a totally real field F of odd degree and a cuspidal parallel weight-two Hilbert eigenform f,
prove `weightTwo_quaternionicJacobian`: after Jacquet–Langlands transfer to a quaternion algebra
split at exactly one real place, the f-eigensystem cuts out a nonzero isogeny factor A of the
Jacobian of the corresponding smooth proper Shimura curve. Its coefficient field K acts on A by
F-rational endomorphisms up to isogeny, `[K:ℚ] = dim A`, and its `λ`-factor is the representation
attached to f, with the homological/cohomological duality and cyclotomic sign fixed as in the
conventions. Include the construction of this Hecke eigensummand, its rational coefficient action
and descent; an abstract abelian variety without a marking is insufficient. Source: Snowden, Lemma
9.4.3 and proof, §9.4, p. 29. *Needs:* GL2AutomorphicRepresentationsAndTransfer R17.3.1 and
R17.3.10; ShimuraVarieties §§8.1–8.5 and 8.18–8.19 for the canonical tower, compactification
and extended Hecke legs; JacobianChallenge Layers D–F for Picard representability and the pointed
construction, with `shimuraCurve_picard_correspondences` for unpointed descent and actions;
AbelianSchemesAndArithmeticModuli A6.5, A6.8 and A6.10–A6.12 for isogeny factors and endomorphisms.

The same correspondence action on the actual modular Jacobian is used in the `J₀(23)` check of §5.1.
Prove its dimension two and the embedding of `ℚ(√5)`, rather than invoking a separate unidentified
Hecke-action supplier. Sources: the modular-curve genus and weight-two dimension formulas in
ModularCurves Layer 10 and ModularForms Layer 10, with the Jacobian construction of
JacobianChallenge Layer E.

#### 5.0d Minimal lifts and their compatible families

For p odd, a level-one residual representation with (A1), actual Serre weight `2 ≤ k ≤ p+1` and `k ≠ p`, prove `minimalLift_levelOne`: it has an odd characteristic-zero lift, defined over a finite
extension of `ℚp` with a stable lattice reducing to the given representation, unramified outside p and
crystalline at p of weights `{0,k−1}`. When `k = p+1`, also prove `steinbergLift_levelOne`: there is a
weight-two lift unramified outside p, semistable noncrystalline at p of weights `{0,1}`, with
nonzero monodromy and unramified Steinberg twist. Require residual absolute irreducibility, not
merely a reducible semisimplification. The determinant of the crystalline lift is the Teichmüller
lift of the residual finite character times `χ_cyc^(k−1)`; for the Steinberg lift use exponent one.
Its finite part is unramified away from p. Source: Khare–Wintenberger, version of record, Theorem
3.3, p. 239 (proof, p. 243), and Theorem 4.2, pp. 244–245; the first preprint's corresponding lift results are
in §3.

The shared raw carrier `AutomorphicSystemData` is a target here, independent of any automorphic
existence theorem. For an arbitrary number field F and rank `n ≥ 1`, it records a coefficient
number field E, a finite bad set S, monic degree-n good-place polynomials with nonzero constant
term, continuous semisimple members at every finite coefficient place λ, and integer Hodge
multisets of size n at the labelled embeddings of F. Each member has a specified finite local
realization field `L_λ/E_λ` and coefficient embedding into an algebraic closure. The carrier
records these data without asserting polynomial, Hodge or period compatibility. In particular,
E-valued polynomials do not imply that a member descends to `E_λ`. These raw data and their
operations have this single owner; specialized arithmetic and automorphic compatibility predicates
are additional conditions on them. Source: Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–
Taylor–Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf),
§7.1, pp. 1084–1086, separating the five-tuple from its compatibility clauses.

Its basic API transports the data under coefficient extension and conjugation, finite base-field
restriction, direct sum, tensor product, dual and Tate twist, with identity and composition laws.
On polynomials, sums take products, tensors take pairwise products of roots, and duals invert
roots; Hodge multisets concatenate, add pairwise and negate respectively. Restriction raises
Frobenius roots to residue degrees, restricts the Hodge labels and enlarges S by ramified places.
The raw convention is geometric Frobenius and `HT(χ_cyc) = −1`: twisting by `χ_cyc^t` scales roots
by `q_v^(−t)` and subtracts t from Hodge labels. These formulas concern the raw data; they assert
no local comparison without its hypotheses. Source: the same §7.1 and the definitions of these
representation operations in ArithmeticGaloisRepresentations Layers 1–2 and 5.

**Checks for the shared data.**

- The trivial rank-one system has polynomial `X−1` and label 0; the cyclotomic system has
  geometric polynomial `X−q_v⁻¹` and label `−1`.
- Unrelated polynomials and members are valid raw data but fail the common-polynomial condition.
- Direct sums and tensor products of two rank-two data have rank four, so these operations stay
  in the same carrier without imposing a rank-two hypothesis.
- Specifying a member over `L_λ/E_λ` does not supply an `E_λ`-model; such a model requires a chosen
  descent and an identification after scalar extension.

Define `ArithmeticCompatibleFamily` as the base-`ℚ`, rank-two specialization of these data,
with chosen `E_λ`-models and equivariant identifications after scalar extension, and the following
additional predicates. Retain just one copy of the coefficient field, S, polynomials and Hodge data.
Each member is unramified outside S and its residue characteristic, and has the prescribed
common polynomial at good primes of different residue characteristic. The members are de Rham
with the fixed Hodge pair and crystalline at good coefficient-prime places. Specify a common
Frobenius-semisimple Weil–Deligne parameter, including monodromy, with a finite field of definition
when a model is required, and require its comparison outside an explicitly given finite exceptional
set of coefficient places and at the selected pairs used below. Crystalline or Steinberg conditions
at those selected coefficient-prime pairs remain explicit hypotheses or conclusions.

The adapter to the arithmetic convention used in the lifting statements sends a geometric
polynomial P of degree n to `X^n P(1/X)/P(0)` and negates the numerical Hodge labels when using
`HT(χ_cyc) = +1`. In a WD comparison, arithmetic Frobenius is the inverse of geometric
Frobenius: invert its r-matrix, keep the inertia action and N, and invert the corresponding
Frobenius–N conjugation relation. These convention changes leave the representation unchanged.
Thus the stored negative Hodge pair
corresponds to the pair `{0,k−1}` in that convention. This is separate from taking the dual,
which changes the representation, inverts its Frobenius roots and negates its Hodge labels within
a fixed convention.

The finite-exception condition here is distinct from the almost-strict condition of
Dieulefait–Pacetti, Definition 1.10, pp. 6–7. That condition permits omission only at a
coefficient-prime pair with reducible global residual representation and either residue
characteristic two or ramified common WD parameter. At an odd unramified coefficient prime it
still requires comparison. An agreement with that predicate requires its de Rham, crystalline and
pairwise WD clauses at every non-omitted pair, including coefficient places in the finite
exceptional set here; no implication from finiteness of that set alone is asserted. Sources:
Dieulefait–Pacetti, Definition 1.10; Khare–Wintenberger, Theorem 4.2, pp. 244–245.

The family API includes coefficient extension with the chosen models, residual representations
through stable lattices, recognition of a semisimple member by common Frobenius polynomials, and
propagation of modularity from one member to members with those same polynomials. General
representation operations and recognition use ArithmeticGaloisRepresentations Layers 1, 2 and 5;
GL2AutomorphicRepresentationsAndTransfer §§R17.6.17–R17.6.19 supply the transfer comparisons.
The minimal-lift construction and its selected auxiliary-prime comparisons remain targets here.

**Checks for the arithmetic specialization.**

- For an elliptic Tate system at a good prime q, the geometric polynomial is
  `X²−(a_q/q)X+1/q`; the adapter gives the arithmetic polynomial `X²−a_qX+q`.
- Unramifiedness outside S and the coefficient characteristic does not assert unramifiedness
  at the coefficient characteristic; the crystalline comparison is a separate clause.
- Different twists at different λ that change the good-prime traces fail the common-polynomial
  condition, even when dimensions and Hodge pairs agree.
- Omitting comparison at an odd unramified coefficient prime with reducible reduction is not
  allowed by Definition 1.10, even if that coefficient place lies in the finite exceptional set.
- A Steinberg parameter has nonzero monodromy; its Frobenius polynomial alone does not identify
  its WD parameter with one having zero monodromy.

Prove `minimalLift_compatibleFamily`: the minimal crystalline lifts above admit such a family with S
empty, the same Hodge–Tate pair and an identified original member. Retain the following specific
auxiliary comparisons, as part of the theorem: for weights two and four, a 3-adic member; for weight
six, a 5-adic member; for weight eight, a 7-adic member; and for weight fourteen, a 13-adic member.
Each selected member is irreducible, odd, unramified outside its residue prime and crystalline at
that prime with pair `{0,k−1}`. Its residual weight and ordinarity alternatives are exactly those of
§5.7 and AlgebraicModularFormsAndSerreWeights R15.4. The exceptional coefficient set cannot be used
to omit one of these required comparisons. Source: Khare–Wintenberger, first preprint, Theorem 3.1
and proof, pp. 15–18, and the proofs of Theorem 4.3, pp. 19–21; version of record, Theorem 4.2, pp.
244–245, and proof of Theorem 5.4, pp. 247–248. The terminal case at five also retains the
crystalline or weight-two Steinberg member selected in Dieulefait–Pacetti, §2, Paso 6, p. 14.

#### 5.0e Ordinary modularity and exact level

Apply LocalGaloisDeformationRings §0.3 / `RankTwoOrdinaryEndpoints` and §§5.4–5.5 to the
five pairs of §5.7, using AlgebraicModularFormsAndSerreWeights R15.4 to identify the residual
inertia characters. The supplied Fontaine–Laffaille and Berger–Li–Zhu alternatives say that a
crystalline rank-two representation with reducible residual semisimplification and the indicated
weights is ordinary, whereas the nonordinary case has the stated irreducible niveau-two reduction.
The specialization `ordinary_terminal_local` includes the boundary `k = p+1` and retains the supplier’s
branch hypotheses; it applies that local classification at these five pairs. Its carriers are the
finite-field and crystalline categories of FiniteFlatGroupsAndIntegralPadicHodgeTheory Layers
R07.3–R07.5, with the weight normalization of AlgebraicModularFormsAndSerreWeights R15.4. Source:
Khare–Wintenberger, first preprint, proof of
Theorem 4.3, pp. 20–21; Dieulefait–Pacetti, Paso 6, p. 14.

Prove `ordinary_terminal_modular`: for each `(p,k) = (3,2),(3,4),(5,6),(7,8),(13,14)`, an irreducible
odd ordinary representation of `G_ℚ`, unramified outside p, crystalline at p with weights `{0,k−1}`,
and residual semisimplification a sum of the two characters determined in §5.7, comes from a
classical cusp eigenform of weight k. The two inertia characters are required to be distinct, with
quotient `ω^(k−1) = ω`, and the ordinary quotient has the matching unramified normalization. This is
the specialized Skinner–Wiles statement needed here, a target with those global and local
hypotheses. No assertion for coincident residual characters is made. Use the Skinner–Wiles
application in the two source arguments just cited.

The exact-level comparison `ordinary_terminal_levelOne` says that the form obtained in this
situation has primitive level one: unramifiedness determines its conductor away from p, and the
ordinary crystalline comparison determines its p-part. The former is supplied by
GL2AutomorphicRepresentationsAndTransfer §R17.6.4, applied to the actual attachments of
AlgebraicModularFormsAndSerreWeights §R15.5A.2. Include the latter, at the residue prime, as part of
this target. Sources: Khare–Wintenberger, proof of Theorem 5.4, pp. 247–248, and the ordinary
argument of Dieulefait–Pacetti, §2, Paso 6, p. 14. This makes level one a theorem with local
hypotheses, rather than a consequence of modularity alone.

### 5.1 Abelian varieties of GL₂-type

Define `GL2TypeAction A K` for an abelian variety A over a number field F and a number field K:
it contains a chosen unital action `ι : K →+* End⁰_F(A)` and the equality `[K:ℚ] = dim A`.
The predicate `IsGL2Type A K` asserts existence of such data and carries no chosen action.
Since the dimension is positive and K is a field, the action is faithful. The base F is essential:
the descent theorem passes through an abelian variety over a finite extension of `ℚ`. No simplicity
hypothesis on A is required. Sources: Snowden, §9.4, before Lemma 9.4.3, p. 29;
Khare–Wintenberger, Theorem 3.1(ii), §3, p. 16 of the arXiv version.

The library carriers are `TauCeti.AlgebraicGeometry.AbelianVariety`, its `dim` and its `End`.
AbelianSchemesAndArithmeticModuli A6 supplies rational endomorphisms and their Tate action;
A6.12 / `traceDegreeSubfield` gives rank-two freeness for the specified action. Specialize
ArithmeticGaloisRepresentations §6.4 / `TateModule.lambdaTateModule` using the embedding ι and its
image subfield: the identification `K ≃ ι(K)` transports its scalars back to K. Thus each realization
uses the input action, with no fresh choice from `IsGL2Type`. The API is:

- `GL2TypeAction.lambdaAdicRep`: For marked data h and `λ|p`, the continuous `G_F`-representation
  `V_λ(A,h) = V_p(A) ⊗_{K ⊗ ℚ_p} K_λ`, using `h.action` in the tensor product. Its identification
  with the supplied `TateModule.lambdaTateModule` is K-equivariant and compatible with coefficient
  extension and the decomposition over all `λ|p`.
- `GL2TypeAction.finrank_lambdaAdicRep`: For the same h, its `K_λ`-dimension is two.
- `GL2TypeAction.free_tateModule`: For the same h, `V_p(A)` is free of rank two over `K ⊗ ℚ_p`.
- `GL2TypeAction.isogeny`: For an F-isogeny `f:A → B`, transport h by
  `ι_B(a) = f ι_A(a) f⁻¹` in the rational isogeny category. The induced Tate map intertwines
  these marked K-actions and identifies their λ-factors.
- `GL2TypeAction.baseChange`: For a finite extension `F′/F`, transport ι by base change of
  F-rational endomorphisms. The marked λ-representation is the restriction to `G_F′`.
- `IsGL2Type.isogeny` and `IsGL2Type.baseChange`: The corresponding unmarked existence results.
- `ComesFromGL2Type`: Existence of A, K, marked data `h : GL2TypeAction A K`, a specified embedding
  `K ↪ ℚ̄_p` inducing λ, and an equivariant isomorphism from the scalar extension of
  `GL2TypeAction.lambdaAdicRep h λ` to the given rank-two representation.

`endZeroAlgebra A` denotes `ℚ ⊗[ℤ] A.End`, with the endomorphism-ring structure and scalar extension
from AbelianSchemesAndArithmeticModuli A6.8 and A6.10–A6.12. Its API includes the natural map from
integral endomorphisms and scalar compatibility. The theorem `endZeroIsogeny_exists` supplies a
positive integer n and an integral quasi-inverse g
with `f g = [n]` and `g f = [n]`; it characterizes conjugation on `1 ⊗ x` by
`(1/n) ⊗ (f x g)`. The choice `endZeroIsogeny` satisfies this formula by
`endZeroIsogeny_characterization`. The transport maps are `endZeroIsogeny`, the
unital ring isomorphism given by conjugation with an F-isogeny, and `endZeroBaseChange`, the
unital ring map induced by base change to a finite extension. The theorem `endZeroBaseChange_tmul`
states that it sends `q ⊗ x` to `q ⊗ x_F′`, using the native integral endomorphism base change.
Their identity and composition laws
agree with conjugation and base change of endomorphisms. For a non-CM elliptic
curve its value is `ℚ`; for a CM elliptic curve with all endomorphisms defined over the base it is the
imaginary quadratic CM field; for `E×E` with E non-CM it is `M₂(ℚ)`. These three checks distinguish
rationalization, the rationality field of endomorphisms and the product algebra (Snowden, §9.4, pp.
29–30; the rational endomorphism supplier above).

`ComesFromGL2Type` has API lemmas for isomorphism of representations, coefficient extension, isogeny
and finite restriction, retaining both the chosen action and the specified embedding of K into `ℚ̄p`.
Isogeny and restriction use exactly the two marked transports above. Its checks are the elliptic
Tate module `(K = ℚ)`, the marked `λ`-factor of `J₀(23)` `(K = ℚ(√5))`, and exclusion of a one-dimensional
character by rank. The whole four-dimensional `ℚp` Tate module of `J₀(23)` is not its two-dimensional
`λ`-factor. These pin both the realization marking and its dimension.

The supplied `traceDegreeSubfield` theorem gives equal multiplicities of the K-embeddings and
freeness of rank `2 dim A / [K:ℚ] = 2`; its hypotheses include a unital K-action. Isogeny transport
uses the invertibility of an isogeny in the rational endomorphism category, whose underlying notion
is `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`.

**Checks.**

- `isGL2Type_ellipticCurve`: dimension one with `K = ℚ` satisfies the predicate and yields the usual
  two-dimensional Tate module.
- `isGL2Type_J0_23`: the actual dimension-two modular Jacobian with its Hecke embedding of `ℚ(√5)`
  satisfies the predicate and has a two-dimensional `λ`-factor.
- A dimension-two surface such as `E×E` fails the predicate with `K = ℚ`. This
  tests the dimension equality, not a prohibition on `GL₂`-type: a quadratic field can embed in
  `M₂(ℚ)`.
- For such a product `E×E`, a quadratic embedding and its conjugate by a rational invertible
  matrix give marked actions transported by the corresponding quasi-isogeny; forgetting the
  action preserves `IsGL2Type` but does not specify a λ-factor.
- The identity isogeny preserves ι, and finite base change sends every `ι(a)` to its base change;
  both tests compare the marked λ-factor with `TateModule.lambdaTateModule` for that same action.
- `isGL2Type_zero`: dimension zero fails for every number field K, whose degree is positive.

The `J₀(23)` test uses the modular Jacobian itself and its Hecke embedding `ℚ(√5) ↪ End⁰_ℚ(J₀(23))`. Tau Ceti's ModularCurves Layer
10 supplies the compactified curve, and JacobianChallenge Layer E supplies its Jacobian. The Hecke
action on that Jacobian requires a separate geometric Hecke interface: ModularCurves' “Mazur
interface” assigns it to a downstream Eisenstein-ideal supplier, using ModularForms' Hecke theory.
The target includes this Hecke action and the exact dimension-two test. An existence statement about
an unspecified abelian surface would not test this example.

### 5.2 Descent of a realisation

`comesFromGL2Type_of_restrict` states that if `ρ:G_F → GL₂(ℚ̄_p)` is
irreducible, `F′/F` is finite, its restriction remains irreducible, and the restriction comes from a
`GL₂`-type abelian variety over `F′`, then `ρ` comes from such an abelian variety over F. The declaration
`comesFromGL2Type_of_restrict` must include irreducibility both before and after restriction.
Potential realisation of a reducible restriction does not meet this hypothesis.

Let `A′` be the realising variety and form its Weil restriction B. Its Tate module is the induced
representation of the Tate module of `A′`. With the coefficient-field action retained, Frobenius
reciprocity detects `ρ` in this induced module with the relevant one-dimensional multiplicity space.
Faltings' endomorphism theorem identifies the representation commutant with rational endomorphisms
of B after scalar extension. The semisimple decomposition of that endomorphism algebra, together
with Poincaré decomposition, cuts out a simple isogeny factor whose endomorphism field supplies a
`GL₂`-type action. The multiplicity calculation forces its Tate module factor to be two-dimensional
over that field. This returns the requested `A/F` rather than leaving only an induced representation
of larger dimension.

The proof uses Weil restriction, induced Tate modules and semisimple endomorphisms from
AbelianSchemesAndArithmeticModuli A6.5, A6.8 and A6.30–A6.33. Include the specialized Tate
endomorphism comparison as the target `weilRestriction_tateEnd`: for the Weil restriction `B/F` of the
realizing abelian variety over `F′` and every rational prime p, the natural map `End_F(B) ⊗ ℚp → End_{G_F}(V_p(B))` is an algebra isomorphism, and `V_p(B)` is semisimple. The source is the Faltings
comparison invoked in Snowden's proof of Lemma 9.4.4, p. 30; the statement retains F-rational
endomorphisms. It is used to descend the indicated isogeny factor and entails no finiteness
assertion for families of abelian varieties. It uses the preceding `GL₂`-type interface. Snowden,
Lemma 9.4.4 and proof, §9.4, pp. 29–30, is the source and credits the descent argument to Taylor.
These imports do not require a finiteness theorem for abelian varieties with bounded bad reduction.

### 5.3 Snowden's weight-two realisation

`comesFromGL2Type_of_weightTwo` assumes p is odd and `ρ:G_ℚ → GL₂(ℚ̄_p)` is continuous, finitely ramified, odd, and de Rham at p
with Hodge–Tate weights 0 and `−1`. A stable lattice defines a residual representation `ρ̄`;
require its restriction to `G_{ℚ(ζ_p)}` to be absolutely irreducible, Snowden's (A1).
Then `ρ` is realised by an abelian variety `A/ℚ` of `GL₂(K)`-type, for some number field K and embedding
into `ℚ̄_p`. Its proposed declaration is `comesFromGL2Type_of_weightTwo`.
Snowden's additional condition (A2), concerning a projective `PGL₂(𝔽₅)` image, is automatic over `ℚ`
because `[ℚ(ζ₅):ℚ] = 4`. The theorem is not stated for `p = 2`.

Potential modularity (§5.0b) gives a totally real Galois extension `F″` disjoint from the compositum
of the residual field and `ℚ(ζp)`, over which `ρ` is modular. Choose a Sylow-2 subgroup of its Galois group. Its fixed field `F′` has
odd degree over `ℚ`, and `F″/F′` is solvable. The target `weightTwo_solvable_descent` of §5.0b,
including its intermediate Hilbert attachments and matching character choices, descends the form
to `F′`. In odd degree,
GL2AutomorphicRepresentationsAndTransfer R17.3.1 and R17.3.10 transfers the parallel weight-two form
to the quaternion algebra split at exactly one real place. §5.0c realises it in the Tate module of a
Shimura-curve Jacobian, producing a `GL₂`-type realisation over `F′`. Disjointness retains
irreducibility of the restriction. The preceding descent lemma now returns a realisation over `ℚ`.

This is Snowden, Proposition 9.4.1, p. 29, and its proof, p. 30. The definition of weight two and
its sign convention are in §1.2, p. 2; (A1) and (A2) are in §3.1, p. 6. The use in
Dieulefait–Pacetti, Paso 6, §2, p. 14, is the application developed below. The potential-modularity
and Shimura-Jacobian targets of §5.0 enter this argument with their stated disjointness and
coefficient conditions; this target assembles them without invoking Serre's conjecture.

### 5.4 Reading the reduction type from one λ-factor

`reduction_of_comesFromGL2Type` verifies the local hypotheses needed to use Fontaine or Schoof after
realisation. Suppose `A/ℚ` of `GL₂(K)`-type realises `ρ` through a prime `λ` above p. Then:

- At `ℓ ≠ p`, an unramified `ρ` implies good reduction of A; an unramified semisimple Weil–Deligne
  parameter implies semistable reduction.
- At p, a crystalline `ρ` implies good reduction of A. A semistable `ρ` with unramified Steinberg twist
  and nonzero monodromy implies multiplicative reduction.
- The dimension of A is `[K:ℚ] ≥ 1`.

Prove `gl2Type_equivariant_weilDeligne`: for a marked unital action
`K → End⁰_ℚ(A)` with `[K:ℚ] = dim A`, refine the rational whole-Tate-module comparison of
NeronModelsAndSemistableAbelianVarieties §§5.1–5.3 and 6.10 by retaining K on the geometric
potentially semistable realization and all its comparison maps, including at the residue
characteristic. Prove that trivial finite inertia, zero monodromy, and rank-one monodromy on one
two-dimensional factor hold on every factor selected by an embedding of K. Use endomorphism
naturality on the Raynaud toric and abelian pieces and descent, with the supplied equal-multiplicity
theorem; the rational comparison alone does not compare marked K-factors. The Frobenius
polynomials of conjugate factors can be conjugate rather than equal. Sources: Khare–Wintenberger,
first preprint, proof of Theorem 3.1(ii), pp. 17–18, for the coefficient-field realization and
semistability transition; the endomorphism-equivariant geometric comparison is constructed from
the Raynaud and p-adic comparisons of the Néron supplier §§3.10–3.14, 5.3 and 6.10.

**Checks.**

- With `K = ℚ` there is one factor, and the statement is the whole-Tate-module comparison.
- For the Hecke action of `ℚ(√5)` on `J₀(23)`, the two embedding factors have the same inertia
  triviality and monodromy ranks; their Frobenius traces need not coincide.
- A weight-two Steinberg factor has rank-one monodromy in every conjugate factor, whereas a
  crystalline factor has zero monodromy throughout; a ramified finite twist fails trivial inertia.

Apply this refinement before using any whole-Tate-module reduction criterion.
It transfers the indicated inertia and monodromy conditions to every component.
NeronModelsAndSemistableAbelianVarieties §§3.5–3.11 and the good-reduction criterion then apply to
the full Tate module. For the multiplicative case, the rank-one monodromy in every two-dimensional
factor sums to `dim A`, the full toric rank. The Steinberg twist must have unramified semisimple
part: an arbitrary ramified twist gives only potential semistability and does not justify the stated
reduction type. The lifts used here have actual Steinberg type and satisfy this condition.

`reduction_of_comesFromGL2Type` is the proposed interface. Its inputs are
NeronModelsAndSemistableAbelianVarieties §§3.5–3.11, NeronModelsAndSemistableAbelianVarieties
§§5.1–5.3 and 6.10, the p-adic comparison theories they use, `gl2Type_equivariant_weilDeligne`,
and the supplied `GL₂`-type rank-two specialization.
Dieulefait–Pacetti, Paso 6, §2, p. 14, uses this transition at five. Khare–Wintenberger, the proof
of Theorem 3.1, §3, p. 18 of the arXiv version, explains the same good/semistable distinction using
Weil–Deligne parameters.

### 5.5 Imaginary quadratic class numbers

`classNumber_sqrt_neg_prime_eq_one` proves class number one for `ℚ(√(−p))` with
`p ∈ {3,7,11,19,43,67,163}`. Its declaration is `classNumber_sqrt_neg_prime_eq_one`. This finite
arithmetic result is what rules out the relevant dihedral representations; the list is not used as
an unproved class-number table.

For `p = 7`, the discriminant `−p` is small enough for the direct PID criterion. For the remaining primes,
the Minkowski ideal-class bound is `(2/π)√p`. Enumerate rational primes up to that bound.
Since `p ≡ 3mod 8`, two is inert; the finitely many odd primes needed have quadratic symbol
`(−p/q) = −1`. Inert prime ideals have norm `q²` and are generated by q, so any appearing below the
bound are already principal. No ramified prime occurs within the bound. The small-prime generation
theorem gives principality of the whole class group. For `p = 163` only `q = 2,3,5,7` require testing,
making the bound short and exact.

Use `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`,
`RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`, the small-prime PID theorem named in Layer 4,
and `NumberField.classNumber_eq_one_iff`. The class-field consequence comes from ClassFieldTheory
Layer 13. Khare, Lemma 5.1(i), §5, p. 20, uses these cases together with the cyclotomic supplier
case in the boundaries section. In contrast, `ℚ(√−23)` has class number three and two splits, so no
assertion for every p congruent to three modulo four follows from the calculation.

### 5.6 The level-one dihedral exception

`levelOne_dihedral_classification` assumes p odd and an odd absolutely irreducible residual
representation unramified outside p. If its restriction to `G_{ℚ(ζ_p)}` is reducible,
its projective image is dihedral, by ArithmeticGaloisRepresentations Layer 4. For a level-one
dihedral representation, p is three modulo four, the quadratic field `Q = ℚ(√(−p))` has
class number greater than one, and projective inertia at p has order two. A cyclotomic twist has
normalised Serre weight `(p+1)/2`.

To see the arithmetic restriction, write the projective group as `D₂t`. The rotation order t is odd:
an even t would produce two independent quadratic characters and thus a quadratic extension
unramified everywhere. The unique quadratic character therefore cuts out Q. Oddness makes Q
imaginary. Tame projective inertia is a reflection, and the cyclic extension of degree t over Q is
unramified everywhere. Consequently t divides its class number and is nontrivial. The local
decomposition group centralizes the reflection, so it equals the reflection subgroup; the local
representation is split, and the Serre-weight recipe gives the normalised weight `(p+1)/2`.

It follows that (A1) holds if p is one modulo four, or p belongs to the class-number-one list above,
or no twist has weight `(p+1)/2`. The actual terminal weights 2, 4, 6, 8 and 14 satisfy the required
exclusion by this local recipe and the listed class numbers. In particular the needed primes 5, 7
and 13 all satisfy (A1). The declaration `levelOne_dihedral_classification` exposes these sufficient
conditions. The full local distinction, including split and niveau-two inertia, comes from
AlgebraicModularFormsAndSerreWeights R15.4; the finite-image restriction criterion comes from
ArithmeticGaloisRepresentations Layer 4. Sources are Khare, Lemma 5.1 and proof, §5, pp. 20–21, and
Dieulefait–Pacetti, Lemma 1.13, §1.5, p. 8. Dihedral level-one behaviour in characteristic
twenty-three is compatible with this statement and is not excluded.

### 5.7 Ordinary members with reducible reduction

`no_levelOne_crystalline_of_reducible_terminal` considers the pairs

`(p,k) = (3,2),(3,4),(5,6),(7,8),(13,14).`

Let `ρ:G_ℚ → GL₂(ℚ̄_p)` be odd and irreducible, unramified
outside p, crystalline at p with Hodge–Tate weights `{0,k−1}`, and have reducible reduction. Then
`ρ` is ordinary and p-distinguished, arises from a level-one cusp form of weight k, and therefore
cannot exist.

The residual characters are globally unramified outside p; the local crystalline weight recipe,
together with the absence of everywhere-unramified characters of `G_ℚ`, identifies their
semisimplification, up to twist, with `1 ⊕ ω̄^{k−1}`. In the Fontaine–Laffaille range
`k ≤ p`, the reducible reduction gives ordinarity. At `k = p+1`, Berger–Li–Zhu supplies the same conclusion:
the nonordinary alternative has irreducible niveau-two reduction. Here `k−1 ≡ 1mod {p−1}`, so
the two residual inertia characters are distinct. This is the p-distinguished hypothesis needed for
the Skinner–Wiles theorem supplied by §5.0e.

Modularity alone does not force level one. §5.0e supply local–global compatibility, so
unramifiedness away from p and crystallinity at p give the level-one form of the required weight.
For `k = 2,4,6,8`, `CuspForm.rank_eq_zero_of_weight_lt_twelve` proves the cusp space vanishes. For `k = 14`,
`ModularForm.dimension_level_one` and `ModularForm.rank_eq_one_add_rank_cuspForm` give the same
conclusion: the modular-form space has rank one and its Eisenstein quotient has rank one.
Equivalently, dividing a cusp form by Δ would give a weight-two modular form, which is zero.

The proposed declaration is `no_levelOne_crystalline_of_reducible_terminal`. Its inputs are §5.0e,
the character calculation from Layer 2 and the stated modular-form dimensions. The required
vanishing is at exactly the terminal weights `2,4,6,8,14` on the pinned cusp-form spaces. See
Dieulefait–Pacetti, Paso 6, p. 14, for the 3-adic cases, and Khare–Wintenberger, the proof of
Theorem 4.3, pp. 20–21 of the arXiv version, for the three `p+1` cases. This argument is independent
of residual irreducible modularity.

### 5.8 Excluding weight two

`not_levelOne_weight_two` asserts that, in every characteristic p, there is no level-one residual
representation with actual Serre weight two. Its declaration is `not_levelOne_weight_two`. For `p = 2`
or 3 use Tate–Serre. For `p ≥ 5` the dihedral classification ensures (A1), and §5.0d gives a minimal
crystalline weight-two lift. Residual absolute irreducibility makes this lift irreducible. Apply
Snowden's realisation and the reduction interface: the lift is unramified away from p and
crystalline at p, so its realising abelian variety has good reduction everywhere and positive
dimension. Fontaine's theorem contradicts this.

The prerequisites are Tate–Serre, the dihedral and realisation targets, §5.0d,
AlgebraicModularFormsAndSerreWeights R15.4 and Fontaine. Khare–Wintenberger, Theorem 4.1(i), §4, p.
18 of the arXiv version, states this exclusion. Its proof there uses auxiliary members of compatible
systems and other weight-two results. The proof chosen here is the Snowden–Fontaine route. In
particular, one may not use Theorem 3.1(ii) of that arXiv version to realise the very level-one
crystalline case it expressly excludes. An alternative route would use §5.0d to pass to a 3-adic
member, Tate–Serre for its reduction and the preceding ordinary argument; that route has its own
compatible-system prerequisites.

### 5.9 Excluding p+1 at Schoof's primes

`not_levelOne_weight_succ_of_schoofPrime` asserts `k(ρ̄) ≠ p+1` for a level-one
representation when `p ∈ {5,7,13}`. Use (A1) from the dihedral classification and the minimal
weight-two Steinberg lift from §5.0d. It is unramified outside p and semistable of the stated
Steinberg type at p. Snowden realises it by a positive-dimensional `GL₂`-type abelian variety, and the
reduction interface makes that variety semistable and good away from p. Schoof's theorem excludes
it. The declaration is `not_levelOne_weight_succ_of_schoofPrime`. Its dependencies are §5.0d,
AlgebraicModularFormsAndSerreWeights R15.4, realisation, reduction and the exact Schoof prime set.
See Khare–Wintenberger, Theorem 4.1(iii), §4, p. 18, and Dieulefait–Pacetti, Paso 6, p. 14 for `p = 5`.

The prime eleven cannot be added. The residual representation from Δ modulo eleven gives the
relevant weight twelve, which equals `p+1`. The elliptic curve `X₀(11)` is semistable with good
reduction away from eleven, so the geometric contradiction also fails there. Its minimal
discriminant has eleven-adic valuation five, producing the très ramifiée local behaviour in the
weight recipe. Both sides of the argument therefore respect the omitted prime.

### 5.10 Weight fourteen in characteristic eleven

`weight_fourteen_eleven_twist` is a local classification and dichotomy, rather than an unconditional
weight-fourteen exclusion. Let `ρ̄` be level one in characteristic eleven with
`k(ρ̄) = 14`, and let `ω` be the mod-eleven cyclotomic character. The full local recipe from
AlgebraicModularFormsAndSerreWeights R15.4 gives four possible inertia types:

| Case | Inertia type | Effect of twisting |
| --- | --- | --- |
| (a) | Split `ω ⊕ ω²` | Twist by `ω⁻¹` has weight two |
| (b) | Non-split peu ramifiée extension with subcharacter `ω²` and quotient `ω` | Twist by `ω⁻¹` has weight two |
| (c) | Niveau-two characters `ω₂¹³ ⊕ ω₂²³` | Twist by `ω⁻¹` has weight two |
| (d) | Non-split extension with subcharacter `ω` and quotient `ω²` | Twist by `ω⁻¹` has weight twenty-two; twist by `ω⁻²` has weight ten |

The first three cases are excluded by the weight-two theorem. In the fourth, no twist has weight
two; its twist-normalised weight is ten, which this roadmap does not exclude. Subcharacter and
quotient cannot be exchanged in a nonsplit extension. The theorem `weight_fourteen_eleven_twist`
records the resulting alternative: weight two after the first twist, or weights twenty-two and ten
after the indicated two twists. It does not deduce nonexistence in the second alternative.

Khare–Wintenberger, the arXiv version, proof of Theorem 4.3, p. 21, asserted a weight-two twist at
eleven without this exception. The version of record, Annals of Mathematics 169 (2009), Theorem 5.4,
p. 247, explicitly restricts its weight-fourteen conclusion to `p ≠ 11`. The theorem here uses that
published restriction and the complete local case split. Its dependencies are
AlgebraicModularFormsAndSerreWeights R15.4 and the weight-two exclusion, not a weight-ten induction
from R26.

### 5.11 The small-weight theorem

`not_levelOne_small_weight` proves that no level-one representation, in any characteristic p, has
`2 ≤ k(ρ̄) ≤ 8`, or has `k(ρ̄) = 14` with `p ≠ 11`. These are actual Serre weights. The
declaration is `not_levelOne_small_weight`. Its immediate corollary is nonexistence of level-one odd
absolutely irreducible representations in characteristics 2, 3, 5 and 7, without a weight
restriction: a cyclotomic twist in these characteristics has normalised weight at most `p+1 ≤ 8`.
This unrestricted corollary is stated in `Suggested.lean` as
`not_isLevelOneResidual_of_mem_two_three_five_seven`.

For odd p, level-one determinant and oddness force even weight, so it remains to handle 2, 4, 6 and
8, followed by 14. Weight two is already settled. At weight four, the minimal crystalline lift
belongs to a compatible system with empty ramification set, by §5.0d and §5.0d. Its 3-adic member is
irreducible, has reducible reduction by Tate–Serre, and is crystalline of weight four. The ordinary
terminal theorem at (3,4) excludes it.

For weight six, first settle characteristic five: twist-normalised weights are 2, 4 or 6, the first
two already excluded and the last excluded by the Schoof `p+1` theorem. For a larger characteristic,
pass through the compatible system to its 5-adic member. The local crystalline recipe at weight `p+1`
gives residual weight two or six if its reduction is irreducible, both impossible. Its reduction is
therefore reducible, and the (5,6) ordinary theorem excludes the member.

For weight eight, first settle characteristic seven in the same way, using the previous weights and
the Schoof theorem at seven. An auxiliary 7-adic member then has reducible reduction and is excluded
by the (7,8) ordinary theorem. This also proves the unrestricted characteristic-seven corollary.

For weight fourteen, the characteristics at most seven are already excluded in every weight. At
thirteen, the Schoof `p+1` theorem applies. At larger characteristics, pass to a 13-adic member. The
crystalline local recipe restricts an irreducible reduction to weight two or fourteen, both already
excluded at thirteen; its reduction is therefore reducible. The (13,14) ordinary theorem gives the
contradiction. Characteristic eleven is kept outside this statement, as the preceding four-case
calculation requires.

The proof imports compatible systems and the Serre weight recipe, and uses the earlier exclusions in
the order just given. It also uses the dihedral check for the minimal lifts and local–global
compatibility in the ordinary theorem. The source statements are Khare–Wintenberger, arXiv Theorem
4.3 and proof, pp. 19–21, Corollary 4.4, p. 21, with the corrected published Theorem 5.4, p. 247.
Khare, §1.1, p. 3, explains their role in the level-one induction. Weight twelve is not excluded: Δ
supplies a level-one cuspidal representation of that weight. Weight ten belongs to the later
weight-reduction argument, outside this terminal list.

### 5.12 The characteristic-five end of Paso 6

Prove `modularity_transfer_at_five`: let `ρ` be an odd continuous rank-two representation over a
finite extension of `ℚ₅`, ramified at finitely many primes, de Rham at five with weights `{0,k−1}`,
`k ≥ 2`. A stable lattice defines its reduction. If that reduction is modular and absolutely
irreducible on `G_{ℚ(ζ₅)}`, then `ρ` comes from a classical cusp eigenform of weight k. Source:
Dieulefait–Pacetti, Theorem 1.4, §1.2.1, p. 4. The cyclotomic restriction implies the theorem’s
restriction condition over `ℚ(√5)`; this specialized target supplies congruence transfer between
families, in addition to recognition within a family by common Frobenius polynomials.

**Checks.**

- A modular minimal lift gives modularity of its residual representation at five, so the target
  applies to a different lift satisfying its own de Rham and (A1) hypotheses.
- Distinct weights `{0,k−1}` exclude the repeated-weight case `k = 1`.
- A reducible residual representation fails (A1), and belongs to the ordinary modularity interface
  rather than this target.

`paso_six` is the terminal application used by `ClassicalSerreModularity:R33.4`. Start with an
almost strictly compatible system with empty ramification set whose original 5-adic member is
continuous, odd, finitely ramified and de Rham at five with weights `{0,w−1}`, `w ≥ 2`. Require a
stable lattice with residual (A1), equivalently the non-bad-dihedral condition here together with
residual absolute irreducibility. If its Serre weight is two or four, take a minimal crystalline
lift and a system containing it. Its 3-adic member is irreducible and has reducible reduction by Tate–Serre. The
ordinary criterion at (3,2) or (3,4), including the distinct inertia characters, makes this member
modular. Common Frobenius polynomials give modularity of the new family’s 5-adic lift and hence
of its residual representation. Apply `modularity_transfer_at_five` to the original 5-adic member
with its own de Rham and residual hypotheses. Its modularity then propagates within the original
family by their common Frobenius polynomials. If the weight is six, the minimal weight-two Steinberg lift would realise a positive-dimensional semistable
abelian variety good away from five, contradicting Schoof.

The proposed `paso_six` states these two branches with the original member’s hypotheses above.
Its inputs are §5.0d, `modularity_transfer_at_five`, Tate–Serre, the ordinary terminal theorem,
the `p+1` exclusion at five and the dihedral classification, which makes (A1) automatic at five. The level-one hypothesis is used to eliminate the bad-dihedral branch; it is not
a replacement for this check in systems with nonempty ramification set. Dieulefait–Pacetti, §2, Paso
6, p. 14, gives precisely this end of the argument, with its role in the completed
odd-characteristic proof stated on p. 15.

This layer's landmarks are `GL₂`-type, Snowden's realisation and the small-weight theorem with its
characteristic-eleven restriction. Its applications require all the local transition checks;
possession of a realisation theorem without its reduction and (A1) checks would not justify either
geometric application.

### Examples

Dimension one with coefficient field `ℚ` passes the `GL₂`-type predicate, dimension two with `ℚ` fails,
and dimension zero fails for every number field. The actual weight fourteen at eleven has an
exceptional local type; it is not added to the exclusion theorem.

### Dependencies

Layers 2–4; the targets of §5.0; ArithmeticGaloisRepresentations Layers 1, 4 and 6;
AlgebraicModularFormsAndSerreWeights R15.4 and R15.5A.2; GL2AutomorphicRepresentationsAndTransfer
R17.3.1, R17.3.10, R17.4.10 and R17.6.4, R17.6.17–R17.6.19; NeronModelsAndSemistableAbelianVarieties
§§5.1–5.3 and 6.10; AbelianSchemesAndArithmeticModuli A2–A3 and A6; ShimuraVarieties §§8.1–8.5
and 8.18–8.19; LocalGaloisDeformationRings §0.3 / `RankTwoOrdinaryEndpoints` and §§5.4–5.5;
ModularCurves Layer 10 and JacobianChallenge Layers D–F for Picard and pointed Jacobian theory,
with §5.0c here for unpointed descent and correspondence actions, and
InverseGaloisAndArithmeticFundamentalGroups IG.0.T1 for the curve–Jacobian Tate comparison.

## Layer 6: The base-case table

### 6.1 Rows and their mathematical domains

The nine rows below state the mathematical domains of the independent base-case theorems. They
record characteristic and actual weight, ramification, image and coefficient hypotheses, and the
local conditions needed for application. The geometric rows concern abelian varieties in every
dimension, rather than residual weights. A row asserts its theorem with all of its hypotheses; an
index or declaration name carries no mathematical proof.

| Row | Hypotheses and conclusion | Supplier | Consumer and local check |
| --- | --- | --- | --- |
| Tate | Finite characteristic-two coefficients, continuous absolutely irreducible residual representation, unramified outside two: impossible; all weights | `tate_no_levelOne_char_two` | R26.1 and the characteristic-two base case; determinant oddness is automatic |
| Serre | Finite characteristic-three coefficients, odd absolutely irreducible residual representation, unramified outside three: impossible; all weights | `serre_no_levelOne_char_three` | R26.1 and R33.4's 3-adic member; check oddness and ramification |
| Fontaine | Abelian variety over `ℚ`, good reduction at every prime: dimension zero | `dim_eq_zero_of_goodReduction_everywhere` | R26.5 through weight two; verify good reduction at p as well as away from p |
| Schoof | Abelian variety over `ℚ`, semistable at `ℓ` and good away from `ℓ ∈ {2,3,5,7,13}`: dimension zero | `no_semistable_abelianVariety_one_prime` | R26.5 at weights `p+1`, and R33.4 at `ℓ = 5`; check semistability and the exact prime set |
| Weight two | Level-one absolutely irreducible residual representation of weight two, any p: impossible | `not_levelOne_weight_two` | R26.5; check actual Serre weight, minimal crystallinity and (A1) |
| Selected `p+1` | Level-one residual representation, p in `{5,7,13}`, weight `p+1`: impossible | `not_levelOne_weight_succ_of_schoofPrime` | R26.5; check the Steinberg weight-two lift and reduction type |
| Ordinary terminal members | Irreducible odd crystalline p-adic member of weight k, unramified outside p, with reducible reduction, at (3,2), (3,4), (5,6), (7,8), (13,14): impossible | `no_levelOne_crystalline_of_reducible_terminal` | R33.4 and R26.5; check ordinarity, p-distinguishedness and level-one local–global compatibility |
| Small weights | Level-one residual representation with actual weight between two and eight, or weight fourteen with `p ≠ 11`: impossible | `not_levelOne_small_weight` | R26.5; retain the actual-weight convention and the exception at eleven |
| Paso 6 | Almost strictly compatible system with empty ramification set; original 5-adic member continuous, odd, finitely ramified, de Rham of weights `{0,w−1}`, `w ≥ 2`, with stable lattice and residual (A1): residual weights two and four give modularity of the original system; weight six is impossible | `paso_six` | R33.4; check the original member’s lifting hypotheses, minimal lift, compatibility and `modularity_transfer_at_five` |

**Checks.**

- `baseCases_schoof_primes`: the geometric row has exactly the bad-prime set `{2,3,5,7,13}`; `J₀(11)`
  rejects an interval of all primes at most thirteen.
- `baseCases_tate_no_oddness`: the characteristic-two row carries no independent oddness assumption.
- `baseCases_weight_list`: no residual row contains (11,12); the Δ representation tests this
  boundary.
- `baseCases_fontaine_schoof_distinct`: the two geometric rows have distinct suppliers and different
  reduction conditions.
- `baseCases_weight_fourteen_excludes_eleven`: no residual exclusion row contains (11,14),
  preserving the version-of-record exception.

There are three additional branches whose theorems have other owners. A solvable image is treated by
Langlands–Tunnell in `GL2AutomorphicRepresentationsAndTransfer:R17.5`, and in characteristic two by
Rohrlich–Tunnell in `R17.6`. The reducible-reduction cases needed here are precisely those of §5.7.
Failure of (A1) away from level one belongs to `ClassicalSerreModularity:R27.1` and
`ClassicalSerreModularity:R33.2`. The arithmetic dihedral classification here addresses level one
only. These branches remain supplier applications and are not additional nonexistence claims in the
table.

The conjunction of these nine statements is the layer's end theorem, `baseCases_holds`. Each
quantified statement has precisely the hypotheses recorded in its row and the corresponding earlier
section. The dependence runs from the discriminant, geometric and representation theorems to this
conjunction and then to the level-one and terminal compatible-system applications.

The sources for the organisation are Dieulefait–Pacetti, §1.1, Theorems 1.1–1.3, pp. 3–4, and the
end of the odd-characteristic argument, §2, p. 15; Khare, §1.1, pp. 2–3, gives the level-one base
cases. The table theorem conjoins the independent results with their full hypotheses; it gives no
additional exclusion at eleven, weight ten or weight twelve.

### Examples

The five row checks above pin the exact prime sets, characteristic-two oddness, and the boundaries
at weights twelve and fourteen in characteristic eleven.

### Dependencies

Layers 2–5. ClassicalSerreModularity consumes the table; it is not a prerequisite.

## Downstream consumers

ClassicalSerreModularity R26.1 and R26.5 use the residual and geometric base cases; R33.4 uses the
terminal compatible-system arguments. The table records the actual weight, coefficient, ramification
and image hypotheses needed at each transition. Its exceptional characteristic-eleven rows are not
exclusions.

## References

All results above are stated in the conventions fixed here. The references distinguish source
versions because the weight-fourteen theorem changed between the first preprint and the published
paper. Printed page numbers are used for books and published articles; for arXiv versions, the
document's own page numbers are used.

- **Dieulefait–Pacetti.** Luis Dieulefait and Ariel Pacetti, [A simplified proof of Serre's
  conjecture](https://arxiv.org/abs/2108.07577v2), arXiv:2108.07577v2, 3 May 2022; published in
  RACSAM 117 (2023), article 153. Theorem 1.1 and 1.2, §1.1, p. 3, state the Tate–Serre and Schoof
  base cases. Lemma 1.13, §1.5, p. 8, supplies the cyclotomic restriction check; §2, Paso 6, pp.
  14–15, is the terminal application.
- **Khare.** Chandrashekhar Khare, [On Serre's modularity conjecture for 2-dimensional mod p
  representations unramified outside p](https://arxiv.org/abs/math/0504080v1), arXiv:math/0504080v1,
  5 April 2005; published under the title *Serre's modularity conjecture: the level one case*, Duke
  Mathematical Journal 134 (2006), 557–589. §1, pp. 2–3, fixes level one and its base cases; Lemmas
  5.1–5.2, §5, pp. 20–21, give the dihedral and twisting calculations; §§7.2–8, pp. 29–30, discuss
  the discriminant approach and its limits.
- **Moon–Taguchi.** Hyunsuk Moon and Yuichiro Taguchi, [The non-existence of certain mod 2 Galois
  representations of some small quadratic fields](https://arxiv.org/abs/0710.1319v1),
  arXiv:0710.1319v1, 5 October 2007. §2, (2.1) and Lemmas 1–3, pp. 2–5, give the Borel and
  unit-conductor calculations; §3, pp. 5–7, gives the global discriminant method.
- **Jones.** John W. Jones, [Wild ramification bounds and simple group Galois extensions ramified
  only at 2](https://hobbes.la.asu.edu/papers/simple2.pdf), author preprint dated 2 April 2010.
  §1.1, equations (1)–(3), pp. 2–3, describes discriminant exponents and mean slopes. §2.3, pp. 8–9,
  compares the wild bounds, including Tate's original estimate; §3.1, p. 9, connects them to root
  discriminants.
- **Faber.** Xander Faber, [Finite p-Irregular Subgroups of
  PGL(2,k)](https://arxiv.org/abs/1112.1999v1), arXiv:1112.1999v1, 9 December 2011. Theorems B–C,
  §2, p. 3, and Theorem 6.1, §6, p. 16, classify the projective subgroups used in the
  characteristic-two and characteristic-three arguments.
- **Ghitza–Yamauchi.** Alexandru Ghitza and Takuya Yamauchi, [The non-existence of some Galois
  representations of moderate dimension in small
  characteristic](https://arxiv.org/abs/2509.00635v2), arXiv:2509.00635v2, 31 October 2025. §2.3,
  Lemma 2.6, p. 5, states the general different bound; §3, Propositions 3.2–3.3, p. 7, applies
  discriminant and subgroup restrictions.
- **Fesenko–Vostokov.** Ivan B. Fesenko and Sergei V. Vostokov, *Local Fields and Their
  Extensions*, second edition, American Mathematical Society, 2002. Ch. I, (5.7)–(5.8), pp. 14–16,
  proves the power maps on unit filtrations; Ch. IV, (3.4)(1) and (3.5), pp. 135–136, proves reciprocity equivariance
  and the upper-ramification comparison.
- **Odlyzko, survey.** Andrew M. Odlyzko, [Bounds for discriminants and related estimates for class
  numbers, regulators and zeros of zeta functions: a survey of recent
  results](https://www.numdam.org/item/JTNB_1990__2_1_119_0/), Journal de Théorie des Nombres de
  Bordeaux 2 (1990), 119–141. §1, pp. 119–121, discusses Minkowski and the unconditional method. §2,
  (2.1)–(2.5), pp. 121–122, gives the completed-zeta explicit formula and its test-function
  requirements; p. 123 discusses finite-degree evaluations.
- **Odlyzko, tables.** Andrew M. Odlyzko, [Discriminant
  bounds](https://www-users.cse.umn.edu/~odlyzko/unpublished/index.html), unpublished tables dated
  29 November 1976, especially [Table
  2](https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table2), the unconditional
  totally complex column, and the accompanying description. The roadmap's numerical conclusions are
  proved by rational bounds for the explicit formula, rather than by trusting rounded entries.
- **Mazur.** Barry Mazur, [Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf),
  Publications Mathématiques de l’IHÉS 47 (1977), 33–186. I Proposition 2.1 and proof,
  pp. 49–54, gives all-prime global Ext vanishing; I §4, Steps 1–2 in the proof of
  Proposition 4.5, pp. 59–60, give the admissible multiplicative/constant filtration.
- **Fontaine.** Jean-Marc Fontaine, [Il n'y a pas de variété abélienne sur
  Z](https://www.imo.universite-paris-saclay.fr/~fontaine/varabZ.pdf), Inventiones Mathematicae 81
  (1985), 515–538, author-hosted publisher scan. The introduction, pp. 515–517, states Théorèmes A
  and B and their corollaries. §3.4.5–3.4.6, pp. 536–537, gives the finite-flat filtration and the
  abelian-variety nonexistence consequence.
- **Brumer–Kramer.** Armand Brumer and Kenneth Kramer, [Non-existence of certain semistable abelian
  varieties](https://arxiv.org/abs/math/0011270v1), arXiv:math/0011270v1, 2 November 2000;
  Manuscripta Mathematica 106 (2001), 291–304. §1, p. 1, states Fontaine's theorem; Proposition 3.2
  and (3.3), §3, pp. 7–8, give the different-bound input.
- **Schoof.** René Schoof, [Abelian varieties over Q with bad reduction in one prime
  only](https://www.mat.uniroma2.it/~schoof/abvar1prime.pdf), Compositio Mathematica 141 (2005),
  847–868, author-hosted published copy. Theorem 1.1, p. 847, is the five-prime theorem. Definition
  2.1 and the examples of §§2.2–2.4, pp. 848–850, define D and the Katz–Mazur extensions `G_ε`;
  Proposition 3.1 and proof, pp. 850–851, gives the
  point-count criterion. Proposition 4.1 and Corollary 4.2, pp. 851–853, compute Ext. Proposition
  5.1, pp. 853–854, gives the simple-object field criterion. The explicit field calculations needed
  here are in §6, pp. 855–858.
- **Bosch–Lütkebohmert–Raynaud.** *Néron Models*, Springer, 1990, §9.3, p. 258, and §9.4,
  Proposition 4, pp. 260–261, supply the unpointed `Pic⁰` construction and descent.
- **Milne, Jacobians.** J. S. Milne, [*Jacobian Varieties*](https://www.jmilne.org/math/xnotes/JVs.pdf),
  corrected notes dated 12 June 2021, Theorem 1.1, §4 and §6, Corollary 6.3, pp. 2, 14–16,
  20–21, for Jacobians, descent and correspondence functoriality.
- **Snowden.** Andrew Snowden, [On two dimensional weight two odd representations of totally real
  fields](https://arxiv.org/abs/0905.4266v1), arXiv:0905.4266v1, 26 May 2009. §1.2, p. 2, fixes the
  Hodge–Tate convention; §3.1, p. 6, lists (A1) and (A2). Proposition 9.4.1 and Lemmas 9.4.3–9.4.4,
  §9.4, pp. 29–30, give realisation and descent.
- **Khare–Wintenberger, first preprint.** Chandrashekhar Khare and Jean-Pierre Wintenberger, [On
  Serre's reciprocity conjecture for 2-dimensional mod p
  representations](https://arxiv.org/abs/math/0412076v1), arXiv:math/0412076v1, 3 December 2004.
  Theorem 3.1, pp. 15–18, and Theorems 4.1 and 4.3 with proofs and Corollary 4.4, pp. 18–21, are the
  early terminal-weight arguments. The weight-fourteen assertion at eleven on p. 21 is not used as a
  theorem here.
- **Khare–Wintenberger, version of record.** [On Serre's conjecture for 2-dimensional mod p
  representations of Gal(ℚ̄/ℚ)](https://annals.math.princeton.edu/2009/169-1/p05), Annals of
  Mathematics 169 (2009), 229–253, [published
  PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf). Theorem 5.4, p.
  247, is the small-weight statement used here, with `p ≠ 11` in its weight-fourteen clause.
