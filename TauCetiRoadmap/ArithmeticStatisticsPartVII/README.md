# Roadmap: arithmetic statistics, Part VII: quadratic probability models and twist applications

**Summary.** Build quadratic-isotropic and alternating-matrix probability models and their global Selmer comparisons, then state the corresponding arithmetic conjectures and conditional twist applications. Quadratic vanishing at two, a common primewise parity and the exact three-isogeny counting hypothesis remain explicit.

## Scope and ownership

This part owns quadratic-isotropic and alternating-matrix probability laws, their Selmer comparisons, arithmetic distribution conjectures and conditional three-isogeny twist applications. The shared layer notation places these targets in Layer 5. ArithmeticStatisticsPartVIII is a downstream consumer.

EllipticCurves Layers 1, 4–7 supply isogenies, formal and local point groups, quadratic twists, Mordell–Weil and finite Selmer groups with their exact sequences. Its Layer 8 supplies the unique integral minimal short model over `ℚ`. ArithmeticStatisticsPartI supplies its family-height adapter; this part keeps that denominator distinct from the global-field coefficient-model families. The pointwise two-Selmer rank identity is supplied by EllipticCurves Layers 6–7, with explicit descent bounds already in `WeierstrassCurve.Affine.card_range_μ` and `pow_rank_le_card_of_range_μ_le` in `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup`.

Finite quadratic isotropy and quadratic orthogonal quotients use Tau Ceti's existing finite quadratic modules. The new work is the varying maximal-isotropic parameter space, reduction maps, intersection counts and canonical probabilities. The arbitrary-field `QuadraticForm` adapter retains quadratic vanishing in characteristic two. Restricted-product groups and product measures use Mathlib and the [RestrictedProducts, Export contract](../../Completed/RestrictedProducts/README.md#export-contract); the new structure is quadratic self-duality and its finite reductions. Scalar exponential-moment determinacy uses Tau Ceti; the group-class and rank-grid moment theorems are supplied by ArithmeticStatisticsPartIV.

The exact arithmetic, cohomological and geometric suppliers are listed below. CM Hecke characters, ideal-kernel comparisons and twist estimates needed here are local targets in [CM twist and descent estimates](#support-cm). Every three-isogeny mean retains the explicit analytic hypothesis `C(F,φ,Σ)` from ArithmeticStatisticsPartIII's windowed cubic counting contract; each base extension uses the contract over the new field.

## Conventions

All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in `x`-degree, and changes of variables use row vectors. Cubics use the determinant-twisted GL2 action; quartics use either the ordinary GL2 action for integral orbit enumeration or the determinant-to-the-minus-two action of PGL2 for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=-12`, `J=0`, `Δ=-256`; this fixes the sign. With `E:y²=x³+Ax+B`, `(I,J)=(-3A,-27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The `p`-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Every arithmetic conjecture is a proposition, not an axiom or an unconditional distribution theorem. Distribution convergence does not imply convergence of unbounded moments. Fixed-`q` degree limits, fixed-degree large-`q` limits and iterated liminf/limsup limits are kept distinct. Selmer dimension, `p`-infinity Selmer corank and Mordell–Weil rank are distinguished; passing from corank to rank requires the stated condition on the divisible part of Sha. A degree-one Picard-scheme point, an actual degree-one divisor, and a point over an odd-degree extension are compared only under the explicit Brauer/local-solubility hypotheses.

## Exact supplier contracts

From Mathlib use `Northcott`, `ClassGroup`, `CommGroup.primaryComponent`, `NumberField.discr`, `Squarefree`, finite sets and orbit quotients; `Representation`, `LinearMap.ker`, `QuadraticForm`, `QuadraticMap.polarBilin`, `LinearMap.BilinForm.orthogonal` and `LinearMap.BilinForm.finrank_add_finrank_orthogonal`; `Submodule.finrank_quotient_add_finrank`, matrices, finite-dimensional modules and Smith normal form. `Matrix.card_GL_field` supplies the finite general-linear-group order. `ContinuousAddEquiv` and `ContinuousAddMonoidHom` carry the compact-open polar adjoint. For probability use `tprod`, `Multipliable`, `ENNReal.tsum_mul_left`, `MeasureTheory.Measure.haarMeasure`, `MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.infinitePi_map_restrict`, `MeasureTheory.IsProjectiveLimit.unique`, `MeasureTheory.measure_limsup_atTop_eq_zero` and `ProbabilityTheory.measure_limsup_eq_one`, with their measurability, finite-measure, summability or independence hypotheses.

From `TauCeti.LinearAlgebra.FiniteBilinearModule.Quadratic` use `TauCeti.FiniteQuadraticModule.IsIsotropic`, `IsLagrangian`, `orthogonalQuotient`, `orthogonalQuotientMk`, `orthogonalQuotient_quadratic_mk`, `orthogonalQuotient_pairing_mk`, `orthogonalQuotientMk_surjective`, `orthogonalQuotientMk_eq_iff` and `IsNondegenerate.isNondegenerate_orthogonalQuotient`. The quotient requires an isotropic subgroup, and its nondegeneracy requires that of the original module. Identify the value group over `𝔽_p` with the `p`-torsion of `ℚ/ℤ`. The locally compact reductions use these finite quadratic carriers. `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` and `TauCeti.Measure.ext_of_mgf` in `TauCeti.Probability.Moments.Determinacy` supply scalar finite-measure determinacy, with their exponential-integrability hypotheses, rather than a group-valued moment theorem.

EllipticCurves Layers 1, 4–8 supply the exact isogeny, local-group, twist, rank, Selmer and minimal-model contracts in Scope and ownership. ClassFieldTheory Layers 6–7 (local reciprocity) and Chebotarev Layer 10 (Dirichlet density) are used for CM twists and the finite-module local-global vanishing criterion. GlobalNumberFields Layers 9–11 and NumberFieldArithmetic Layers 1 and 4 supply class groups, discriminants and their functoriality in the quadratic-field conjectures.

AbelianSchemesAndArithmeticModuli §§A2.2–A2.5 and A3.1–A3.7 supply dual abelian varieties, isogenies, finite-flat subgroup quotients, Cartier-dual kernels, Weil pairings and theta groups. Its §§A6.1, A6.34 supply homomorphism degrees and `QuadraticAbelianTwist`, including the trivial twist and descent of the inversion cocycle. SelmerIwasawaCohomology §§2.10–2.12a supply Pontryagin duals, coranks, passage to `p`-infinity, the number-field abelian Kummer/Selmer/Sha carriers, finite Selmer groups, finite-cotype primary decomposition and all-place Kummer annihilators. Its §4.29 supplies the cohomological Cassels–Tate pairing, divisible radicals, isogeny adjointness and congruent-number two-primary parity. HeightsRationalPointsAndObstructions §§1.1–1.2 supply arbitrary-field fppf Kummer maps and the prime-to-characteristic function-field unramified comparison; §1.7 supplies `fg_points` for abelian varieties over number fields. The theta quadratic refinement and direct-summand comparisons in §§5.27 and 5.31 use these maps, retaining fppf cohomology when the characteristic divides the degree.

ArithmeticGaloisDuality §§R02.4.2–R02.4.5 and R02.5.1 supply restricted products of local cohomology, finite Poitou–Tate, local invariant normalization and Greenberg–Wiles, including the specified prime-to-characteristic function-field cases. Its §§D7.4–D7.6 supply the characteristic-zero local abelian duality and isogeny comparisons; the positive-characteristic flat comparisons are targets below. The Cassels–Tate pairing is consumed from SelmerIwasawaCohomology §4.29.

AlgebraicModuliForArithmeticGeometry §§1.1–1.3 supply projective bundles, coherent Grassmannians and Plücker embeddings; the split quadratic locus and its integral smoothness are proved here. AdelicAlgebraicGroups §2.4 supplies local gauge measures and change of variables for smooth algebraic groups. The Oesterlé–Serre measure for general finite-type schemes and their rank strata is the target of §5.29 here, not a supplied group-Haar theorem.

AnalyticNumberTheoryPartI Layer 3 supplies partial summation and convergent-product estimates; AnalyticNumberTheoryPartII §5.29 supplies the quadratic large sieve and real-character moments used in the twist comparison. The arithmetic use of cubic counting consumes ArithmeticStatisticsPartIII's exact windowed contract below, rather than a second cubic-algebra construction.

### From earlier arithmetic-statistics parts

The class-group `p`-primary subgroup is Mathlib’s `CommGroup.primaryComponent` applied to `ClassGroup (𝓞 K)`, with its additive form when needed. Normalization of the predicted limits is ArithmeticStatisticsPartIV §3.3’s Cohen–Lenstra mass formula and `cohenLenstraMeasure`; it is consumed directly.

From ArithmeticStatisticsPartI require [ArithmeticStatisticsPartI: invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [ArithmeticStatisticsPartI: arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), [ArithmeticStatisticsPartI: elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family), [ArithmeticStatisticsPartI: even parity classes have half density](../ArithmeticStatisticsPartI/README.md#even-parity-classes-have-half-density), [ArithmeticStatisticsPartI: positive squarefree family over q](../ArithmeticStatisticsPartI/README.md#positive-squarefree-family-over-q), [ArithmeticStatisticsPartI: density one restricts to subfamilies of positive lower density](../ArithmeticStatisticsPartI/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density), [ArithmeticStatisticsPartI: family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [ArithmeticStatisticsPartI: binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [ArithmeticStatisticsPartI: twist denominator frontier](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartIII require [ArithmeticStatisticsPartIII: refinement number field twist orbit count](../ArithmeticStatisticsPartIII/README.md#refinement-number-field-twist-orbit-count). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below. In addition consume its [ArithmeticStatisticsPartIII: windowed cubic counting contract](../ArithmeticStatisticsPartIII/README.md#support-coregular-count): `C(F,φ,Σ)` is the conjunction of the windowed main term and the two uniform tails, with the specified representation, multiplicity weights, local spreading, finite archimedean window, local mass factors and `SL₂` Tamagawa volume one. All seven contract items, the actual abelian Kummer images and a positive squareclass denominator are retained.

From ArithmeticStatisticsPartIV require [ArithmeticStatisticsPartIV: cohen lenstra measure](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure), [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups), [ArithmeticStatisticsPartIV: surjection count](../ArithmeticStatisticsPartIV/README.md#surjection-count), [ArithmeticStatisticsPartIV: distribution convergence does not force moment convergence](../ArithmeticStatisticsPartIV/README.md#distribution-convergence-does-not-force-moment-convergence), [ArithmeticStatisticsPartIV: moment convergence implies distribution convergence](../ArithmeticStatisticsPartIV/README.md#moment-convergence-implies-distribution-convergence), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient), [ArithmeticStatisticsPartIV: friedman washington cokernel law](../ArithmeticStatisticsPartIV/README.md#friedman-washington-cokernel-law), [ArithmeticStatisticsPartIV: friedman washington translation form](../ArithmeticStatisticsPartIV/README.md#friedman-washington-translation-form), [ArithmeticStatisticsPartIV: cohen lenstra measure over a finite set of primes](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure-over-a-finite-set-of-primes), [ArithmeticStatisticsPartIV: cauchy q binomial theorem](../ArithmeticStatisticsPartIV/README.md#cauchy-q-binomial-theorem). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartV require [ArithmeticStatisticsPartV: davenport heilbronn mean of three torsion](../ArithmeticStatisticsPartV/README.md#davenport-heilbronn-mean-of-three-torsion), [ArithmeticStatisticsPartV: malle conjecture](../ArithmeticStatisticsPartV/README.md#malle-conjecture), [ArithmeticStatisticsPartV: bhargava mean of two torsion in cubic class groups](../ArithmeticStatisticsPartV/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups), [ArithmeticStatisticsPartV: relative three torsion propagation](../ArithmeticStatisticsPartV/README.md#relative-three-torsion-propagation), [ArithmeticStatisticsPartV: two extension three torsion means](../ArithmeticStatisticsPartV/README.md#two-extension-three-torsion-means). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartVI require [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [ArithmeticStatisticsPartVI: average size of the 2 selmer group is three](../ArithmeticStatisticsPartVI/README.md#average-size-of-the-2-selmer-group-is-three), [ArithmeticStatisticsPartVI: rational p torsion has density zero](../ArithmeticStatisticsPartVI/README.md#rational-p-torsion-has-density-zero). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

## How to read the build

Build §5.4 and the Poonen–Rains weights, normalization, moments and parity of §5.5 first. Build the general Oesterlé measure and the orthogonal geometry/counts of §5.29 next. Then build the alternating laws of §5.6, the Delaunay weights and compatibility in §5.5, and §5.7. Build §§5.23–5.24 and the character-duality targets before §5.26; build the finite-flat cohomology adapters before §5.27. The arithmetic conjectures and applications follow their respective model inputs, and the three-isogeny applications retain their counting hypotheses. The subsection numbers preserve the common layer notation across parts.

The mathematical specification is this README; `Suggested.lean` states headline theorems on the pinned carriers, with the definitions needed to express them. The required API lists specify library targets; only the signatures explicitly identified below are declarations in `Suggested.lean`. The sections below state every target with its hypotheses, source locator, API and Checks. Definitions requiring new arithmetic or geometric carriers are README targets. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

## Layer 5: Quadratic probability models and twist applications

### 5.1 Cohen–Lenstra arithmetic conjectures

<a id="cohen-lenstra-heuristic-for-quadratic-fields"></a>

**Cohen lenstra heuristic for quadratic fields.** Conjecture (a proposition, not a theorem). Let `p` be an odd prime and `K_d = ℚ(√d)` for squarefree `d ≠ 1`. (Imaginary, `u = 0`) For every finite abelian `p`-group `B`, `#{d < 0 : |disc K_d| ≤ X, Cl(K_d)_p ≅ B} / #{d < 0 : |disc K_d| ≤ X} → μ_{p,0}(B)`. (Real, `u = 1`) The same with `d > 0` and limit `μ_{p,1}(B) = ∏_{k≥1}(1 − p^{−k−1})/(|B||Aut B|)`. Here `Cl(K)_p` is the `p`-primary part of the class group and the fields are ordered by absolute discriminant. Proved instances in the moment form: the `ℤ/3`-moment (Davenport–Heilbronn, Layer 3) and its Datskovsky–Wright extension; the full distribution is presented as a conjecture in the cited sources, and is retained as a conjecture.

The required API is:

- `CohenLenstraHeuristic`: The conjecture as a proposition in `p`, `u` and the family `K`.
- `IsQuadraticFamily`: `K d ≅ ℚ(√d)` for all squarefree `d ≠ 1`.
- `quadraticFamilyUpTo`: The squarefree `d` of the given sign with `|disc K_d| ≤ X`.
- `quadraticFamilyUpTo_finite`: The counting sets are finite.
- `cohenLenstraHeuristic_iff_primary_independent`: The conjecture does not depend on the chosen family `K` (isomorphic fields have isomorphic class groups).

For the proof, Encode the family by a function `d ↦ K_d` with `[K_d : ℚ] = 2` and a square root of `d` in `K_d` (`IsQuadraticFamily`); the class-group isomorphism type of `K_d` does not depend on the choice. Define the counting sets `S^±_X` of squarefree `d` of the given sign with `|NumberField.discr K_d| ≤ X` (finite: at most `2X + 1` values of `d` since `|disc| ≥ |d|`). State the limit of the ratio of cardinalities as `X → ∞` for every class `B`, with `μ_{p,u}` from [ArithmeticStatisticsPartIV: cohen lenstra measure](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure); the `p`-part is Mathlib's `CommGroup.primaryComponent` of `ClassGroup (𝓞 K)`.

*Needs:* [ArithmeticStatisticsPartIV: cohen lenstra measure](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure), [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups), `ClassGroup` (Mathlib), `CommGroup.primaryComponent` (Mathlib), `NumberField.discr` (Mathlib), `Squarefree` (Mathlib), `Module.finrank` (Mathlib), [ArithmeticStatisticsPartV: davenport heilbronn mean of three torsion](../ArithmeticStatisticsPartV/README.md#davenport-heilbronn-mean-of-three-torsion).

(Imaginary `u=0`: [[38]](#ref-38), arXiv 1504.04391v1, Conjecture 1.1, pp. 1–2; [[37]](#ref-37), Annals 183 (2016), §8.5, p. 774. Real `u=1`: Wang–Wood, [arXiv:1907.11201v2](https://arxiv.org/pdf/1907.11201v2), Conjecture 3.4, p. 7, Theorem 4.1, p. 8, and Theorem 6.1, p. 11, specialized to real quadratic extensions of `ℚ`.)

**Checks.**

- The conjecture for `p = 3` predicts that the proportion of imaginary quadratic fields with trivial 3-part tends to `c_{3,0}`.
- The conjecture for `p = 3` predicts that the proportion of imaginary quadratic fields with `3 | h` tends to `1 − c_{3,0} ≈ 0.440` (not the printed value of EVW §1.1).
- For real fields the predicted mass of `ℤ/p` is `c_{p,1}/(p(p − 1))`, not the imaginary value `c_{p,0}/(p − 1)`.
- The predicted proportion of imaginary quadratic fields with `3 ∤ h` is `c_{3,0} ≈ 0.560` (EVW §1.1 prints ≈ 0.440 for indivisibility).
- Changing the ordering (e.g. by `|d|` instead of `|disc|`) is a different statement until a comparison is proved (Layer 0's acceptance).

<a id="cohen-lenstra-moment-conjecture-for-quadratic-fields"></a>

**Cohen lenstra moment conjecture for quadratic fields.** Conjecture (a proposition). For an odd prime `p`, `u ∈ {0, 1}` and every finite abelian `p`-group `A`: the average over squarefree `d` of the given sign with `|disc K_d| ≤ X` of `|Sur(Cl(K_d)_p, A)|` tends to `|A|^{−u}` (EVW (8.5.1) for `u = 0`).

The required API is:

- `CohenLenstraMomentConjecture`: The moment form as a proposition in `p`, `u` and `K`.
- `cohenLenstraHeuristic_of_momentConjecture`: For `p` odd, the `u = 0` moment form implies the heuristic ([cohen lenstra moment form implies heuristic](#cohen-lenstra-moment-form-implies-heuristic)).
- `quadraticFamilyUpTo`: The counting sets shared with the heuristic.

For the proof, Same family and counting sets as [cohen lenstra heuristic for quadratic fields](#cohen-lenstra-heuristic-for-quadratic-fields); average `surjCard` over the finite set; state the limit for every A.

*Needs:* [cohen lenstra heuristic for quadratic fields](#cohen-lenstra-heuristic-for-quadratic-fields), [ArithmeticStatisticsPartIV: surjection count](../ArithmeticStatisticsPartIV/README.md#surjection-count).

(Imaginary `u=0`: [[37]](#ref-37), Annals 183 (2016), (8.5.1), p. 774. Real `u=1`: Wang–Wood, [arXiv:1907.11201v2](https://arxiv.org/pdf/1907.11201v2), Conjecture 3.4, p. 7, Theorem 4.1, p. 8, and Theorem 6.1, p. 11, with `G=C₂`.)

**Checks.**

- Under the conjecture with `p = 3`, `u = 0` the average of `|Sur(Cl, ℤ/3)|` tends to 1.
- At `A = 0` the prediction is 1, which holds for every eventually nonempty finite-cutoff family; both quadratic families here have counts tending to infinity.
- The prediction for `|Hom(Cl, ℤ/3)| = |Cl[3]|` is 2, not 1: averaging homomorphisms instead of surjections changes the constant.
- `A = ℤ/3`, `u = 0`: average `|Cl[3]| → 2`, Davenport–Heilbronn (Layer 3); for `u = 1` the average `|Cl[3]| → 4/3`.
- `A = 0`: trivially true (both sides 1).

<a id="cohen-lenstra-moment-form-implies-heuristic"></a>

**Cohen lenstra moment form implies heuristic.** For an odd prime `p` and a quadratic family `K`: if the `u = 0` moment conjecture holds, then the `u = 0` Cohen–Lenstra heuristic holds. (The converse needs a uniform tail estimate: [ArithmeticStatisticsPartIV: distribution convergence does not force moment convergence](../ArithmeticStatisticsPartIV/README.md#distribution-convergence-does-not-force-moment-convergence).)

For the proof, The empirical laws `ν_X(B) = #{d ∈ S^-_X : Cl(K_d)_p ≅ B}/#S^-_X` are probability measures on `L` with A-moment equal to the average of `|Sur(Cl(K_d)_p, A)|`. Apply [ArithmeticStatisticsPartIV: moment convergence implies distribution convergence](../ArithmeticStatisticsPartIV/README.md#moment-convergence-implies-distribution-convergence) along `X → ∞` (any sequence `X_n → ∞`).

*Needs:* [ArithmeticStatisticsPartIV: moment convergence implies distribution convergence](../ArithmeticStatisticsPartIV/README.md#moment-convergence-implies-distribution-convergence), [cohen lenstra heuristic for quadratic fields](#cohen-lenstra-heuristic-for-quadratic-fields), [cohen lenstra moment conjecture for quadratic fields](#cohen-lenstra-moment-conjecture-for-quadratic-fields).

([[37]](#ref-37), Annals 183 (2016), §8.5, p. 774.)

**Checks.**

- The Davenport–Heilbronn `ℤ/3`-moment alone does not give the law of `Cl_3`: all moments are needed.

### 5.2 Cohen–Martinet predictions and wreath-type comparisons

<a id="cohen-martinet-predicted-surjection-moment"></a>

**Cohen martinet predicted surjection moment.** For a finite group `G`, a prime `p`, a finite `𝔽_p[G]`-module `Z` (representation `ρ`) and elements `σ_v ∈ G` (one for each infinite place `v` of the base field `k`, `σ_v` in the conjugacy class of complex conjugation over `v`), the predicted moment is `M(Z, σ) = ∏_v |Z^{σ_v}|^{−1}`, where `Z^{σ} = {z : ρ(σ)z = z}`.

The required API is:

- `cohenMartinetPredictedMoment`: `M(Z, σ) = ∏_v |Z^{σ_v}|^{−1}`.
- `cohenMartinetPredictedMoment_nil`: With no infinite places the prediction is 1.
- `cohenMartinetPredictedMoment_cons`: `M(Z, σ :: σ') = |Z^{σ}|^{−1} M(Z, σ')`.
- `cohenMartinetPredictedMoment_eq_pow`: `M(Z, σ) = p^{−Σ_v dim Z^{σ_v}}`.
- `equivariantSurjCard`: `|Sur_G(M, Z)|`, the number of `G`-equivariant surjections.

For the proof, Define the product over the list `σ` of `|ker(ρ(σ_v) − 1)|`, then invert. Since `Z^{σ}` is an `𝔽_p`-subspace, `M(Z, σ) = p^{−Σ_v dim Z^{σ_v}}`.

*Needs:* `Representation` (Mathlib), `LinearMap.ker` (Mathlib).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, proof of Proposition 7.1, p. 38.)

**Checks.**

- `G = C_2` acting by −1 on `𝔽_p` with `p` odd, `σ` the generator: prediction 1 (Cohen–Lenstra `u = 0`).
- At `p=2` the sign action on `𝔽₂` is trivial, so the same fixed-space formula gives 1/2, not 1. This tests the formula outside the coprime-prime hypotheses of the arithmetic conjecture.
- `σ = 1`: prediction 1/`p` (Cohen–Lenstra `u = 1`).
- For the sign representation of `C_2` over `𝔽₃` and `σ = [1]` the prediction is 1/3 although `Z^G = 0`: using `G-invariants` instead of `σ_v`-invariants is wrong.
- `G = C_2` acting on `𝔽_p` (`p` odd) by −1, `σ` the generator (complex conjugation at the real base place for an imaginary quadratic extension): `M = 1`, the Cohen–Lenstra `u = 0` moment.
- `σ = 1` (a real place): `M = 1/p`, the `u = 1` moment.

<a id="cohen-lenstra-martinet-average-conjecture"></a>

**Cohen lenstra martinet average conjecture.** Conjecture (a proposition). For a number field `k`, a transitive permutation group `G` and a prime `p ∤ |G|`, there is `c_{k,G,p} > 0` with `lim_{X→∞} |E_k(G, X)|^{−1} Σ_{K∈E_k(G,X)} |Cl_K[p]| = c_{k,G,p}`, where `E_k(G, X)` is the set of extensions `K/k` (in a fixed algebraic closure) with Galois-closure group `G` and `Disc(K) ≤ X`. Cohen, Lenstra and Martinet fix the enriched signature; (1.1) additionally assumes that the frequencies of enriched signatures exist. Proved cases: `(S_2, 3)` (Davenport–Heilbronn, Datskovsky–Wright), and, by LOWW, every transitive 2-group with a transposition and `p = 3`; these proofs are Layer 3's. The related proved `(S_3,2)` torsion-average result of Bhargava lies outside the displayed `p ∤ |G|` restriction, since 2 divides 6.

The required API is:

- `CohenLenstraMartinetAverage`: The conjecture (1.1) for a counted family `E` of fields and a prime `p`.
- `CohenLenstraMartinetAverage.exists_pos_limit`: Extract the constant `c_{k,G,p} > 0` and the convergence.
- `cohenLenstraMartinetAverage_of_eventually_const`: If eventually every field of the family has `|Cl_K[p]| = m ≥ 1` and the family is nonempty, the conjecture holds with `c = m`.
- `cohenLenstraMartinetAverage_empty`: The conjecture fails for the empty family (the average is 0).

For the proof, Take the family `E_k(G, X)` from Layer 3 (`G`-extension families ordered by discriminant) as a finite set of subfields of an algebraic closure. State the existence of a positive limit of the average of `|Cl_K[p]|` (the `p`-torsion of the class group of the ring of integers).

*Needs:* [ArithmeticStatisticsPartV: malle conjecture](../ArithmeticStatisticsPartV/README.md#malle-conjecture), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [ArithmeticStatisticsPartV: davenport heilbronn mean of three torsion](../ArithmeticStatisticsPartV/README.md#davenport-heilbronn-mean-of-three-torsion), [ArithmeticStatisticsPartV: bhargava mean of two torsion in cubic class groups](../ArithmeticStatisticsPartV/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), `ClassGroup` (Mathlib), `IsGalois` (Mathlib).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, §1, (1.1), p. 2; [[44]](#ref-44), Forum Math. Pi 13 (2025), e19, §1.4, pp. 5–6.)

**Checks.**

- A nonempty family in which every field has `|Cl_K[3]| = 3` satisfies the conjecture with `c = 3`.
- A nonempty family with trivial `p`-torsion everywhere satisfies it with `c = 1`.
- The empty family does not satisfy the conjecture: the limit must be positive.
- For `(G, p) = (S_2, 3)`, `k = ℚ` the proved constants are 2 (imaginary) and 4/3 (real) per signature; the conjecture (1.1) averages over both signatures.
- The constant is not determined by (1.1) alone; the Cohen–Martinet framework predicts it per enriched signature ([cohen martinet surjection moment conjecture](#cohen-martinet-surjection-moment-conjecture)).

<a id="cohen-martinet-surjection-moment-conjecture"></a>

**Cohen martinet surjection moment conjecture.** For a family of Galois `G`-extensions `K̃/k` with fixed decomposition data `σ_v` at the infinite places, ordered by discriminant, and a finite `𝔽_p[G]`-module `V` with no trivial constituent, `p∤|G|` and `p∤#μ(k)`, define the classical predicted moment by average `|Sur_G(Cl_(K̃/k),V)| → ∏_v |V^(σ_v)|^(−1)`. This is a conjectural proposition for the specified family. The dependence on ordering is essential: the weighted-subfield comparisons below test its validity and prevent assuming it for arbitrary discriminant-ordered families. When `p|#μ(k)`, a different arithmetic conjecture is required; the classical assertion here does not cover that case. The numerical moment prediction is not an assertion that a general random Γ-group construction exists. Sources: Cohen–Martinet Hypothèse 6.6 and Wang–Wood Conjecture 3.4, Remark 3.5, Proposition 6.6, Theorems 4.1 and 6.2.

The required API is:

- `CohenMartinetMomentConjecture`: The conjecture for a counted family with `G`-modules `C_i`, a representation `V` and decomposition data `σ`.
- `CohenMartinetMomentConjecture.tendsto`: The conjecture gives convergence of the average of `|Sur_G(C_i, V)|` to `∏_v|V^{σ_v}|^{−1}`.
- `cohenMartinetMomentConjecture_zero_module`: For `V = 0` the conjecture holds for every eventually nonempty family.

For the proof, For a counted family `E` of indices with relative class groups `C_i` carrying a `G`-action, define the average of `equivariantSurjCard (C_i) ρ` and state its limit equals `cohenMartinetPredictedMoment ρ σ`.

*Needs:* [cohen martinet predicted surjection moment](#cohen-martinet-predicted-surjection-moment), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, proof of Proposition 7.1, p. 38; Wang–Wood, [arXiv:1907.11201v2](https://arxiv.org/pdf/1907.11201v2), Conjecture 3.4 and Remark 3.5, pp. 7–8.)

**Checks.**

- For `G = C_2` acting by −1 on `V = 𝔽_p` and `σ` the generator, the conjecture predicts average `|Sur(C_i, 𝔽_p)| → 1`, the Cohen–Lenstra `u = 0` moment.
- For the trivial module `V = 𝔽_p` the formula would predict 1/`p` for real places, but `Cl_{K̃/k}` has no trivial quotient: the hypothesis 'no trivial constituent' is needed.
- For `V = 0` the count is 1 and the prediction is 1.
- The base `k=ℚ(ζ₃)`, `p=3`, `G=C₂` and two sign constituents satisfy the coprime-group and nontrivial-constituent conditions but are excluded because `3|#μ(k)`. The finite fixed-space formula still makes sense there.
- For `G = C_2` and `V` the sign character over `𝔽_p` it is the Cohen–Lenstra moment conjecture (`u = 0` imaginary, `u = 1` real).
- LOWW Theorem `1.2 = 6.11` proves the `V = Ind_{S_F}^G U` case for `C_2 ≀ H` families (Layer 3).

<a id="relative-three-torsion-as-irreducible-hom-count"></a>

**Relative three torsion as irreducible hom count.** Let `G = C_2 ≀ H` be a transitive 2-group with a transposition, `S_K` the stabilizer of a point, `S_F = C_2^d ⋊ Stab_H(1)`, `U` the sign representation of `S_F/S_K` over `𝔽₃` and `V = Ind_{S_F}^G U`. Then `V` is irreducible, and for a `G`-extension `K̃/k` with index-2 subfield `F` of `K`: `h_3(K/F) = |Hom_{S_F}(Cl_{K̃/k}, U)| = |Hom_G(Cl_{K̃/k}, V)| = 1 + |Sur_G(Cl_{K̃/k}, V)|`.

For the proof, With `e = |S_K|^{−1}Σ_{g∈S_K} g`, multiplication by e maps `Cl_{K̃/k}/3` onto `Cl_{K/k}/3` and every `S_F`-map to `U` factors through it; `Cl_{K/F}/3` is the −1 eigenspace of `S_F/S_K`, so `h_3(K/F) = |Hom_{S_F}(Cl, U)|`. Frobenius reciprocity: `Hom_{S_F}(Cl, U) ≅ Hom_G(Cl, Ind U)`. `V` is irreducible: in a nonzero vector `x=Σ c_i e_i` choose `c_i≠0`. Let `t_i` flip only the `i`-th sign. Then `(x−t_i x)/(2c_i)=e_i` lies in the `G`-stable span of `x`. Transitivity of `H` gives all `e_j`. A single signed permutation need not take `x` to `e_i`; the group-algebra linear combination is necessary. Every nonzero `G`-map to an irreducible module is onto (image is a nonzero submodule), so `|Hom_G| = 1 + |Sur_G|`.

*Needs:* [ArithmeticStatisticsPartIV: surjection count](../ArithmeticStatisticsPartIV/README.md#surjection-count), [cohen martinet predicted surjection moment](#cohen-martinet-predicted-surjection-moment), `Representation` (Mathlib).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, proof of Proposition 7.1, p. 38.)

**Checks.**

- `G = D_4 (H = C_2): V` is 2-dimensional over `𝔽₃` and `h_3(K/F) = 1 + |Sur_{D_4}(Cl, V)|`.

<a id="cohen-martinet-prediction-for-relative-three-torsion"></a>

**Cohen martinet prediction for relative three torsion.** In the setting of [relative three torsion as irreducible hom count](#relative-three-torsion-as-irreducible-hom-count), assuming `3∤#μ(k)`, for a family of `C_2 ≀ H`-extensions `K/k` with relative unit `rank u = rk O_K^× − rk O_F^×: Σ_v dim V^{σ_v} = u`, so the Cohen–Martinet moment conjecture for `V` predicts that the average of `h_3(K/F)` tends to `1 + 3^{−u}`. This is the value LOWW prove (Theorem `1.2 = 6.11`, at Layer 3), so their theorem confirms a new case of the heuristics.

For the proof, By [relative three torsion as irreducible hom count](#relative-three-torsion-as-irreducible-hom-count), `h_3(K/F) = 1 + |Sur_G(Cl, V)|`; average and apply the conjecture: the limit is `1 + ∏_v |V^{σ_v}|^{−1}`. `σ_v = x_v ⋊ r_v` permutes the basis lines `𝔽₃ e_i`: a fixed point of `r_v` with trivial `x_v`-coordinate gives a trivial line (an infinite place of `F` split in `K`), a 2-cycle gives a regular representation of `σ_v` with one trivial dimension (a place of `F` ramified over `k`); a fixed point with nontrivial coordinate contributes 0. Hence `Σ_v dim V^{σ_v}` is the number of infinite places of `F` not ramified in `K`, which is the relative unit rank `u`; so `∏_v|V^{σ_v}|^{−1} = 3^{−u}` (`cohenMartinetPredictedMoment_eq_pow`).

*Needs:* [relative three torsion as irreducible hom count](#relative-three-torsion-as-irreducible-hom-count), [cohen martinet surjection moment conjecture](#cohen-martinet-surjection-moment-conjecture), [cohen martinet predicted surjection moment](#cohen-martinet-predicted-surjection-moment).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, Proposition 7.1, p. 38; [[44]](#ref-44), Forum Math. Pi 13 (2025), e19, proof of Proposition 7.1, p. 39.)

**Checks.**

- `G = C_2` (`H` trivial), `k = ℚ: h_3(K/ℚ) = h_3(K)`, `u = 0` for imaginary and 1 for real quadratic `K`: predictions 2 and 4/3 (Davenport–Heilbronn).
- The prediction depends only on `u`, not on the individual decomposition groups.

- For `k=ℚ(ζ₃)`, this classical arithmetic-moment deduction is excluded by `3|#μ(k)`; the finite fixed-space computation remains available.

<a id="cohen-martinet-prediction-for-three-torsion-of-two-extensions"></a>

**Cohen martinet prediction for three torsion of two extensions.** For `G = C_2 ≀ H` with `W = Ind_{S_F}^G 𝔽₃` the permutation representation of `H` and `W' = W/𝔽₃`: assuming `3∤#μ(k)` and the Cohen–Martinet moment conjectures for every submodule of `V ⊕ W'`, where `W' = ∏_i V_i^{a_i}` is the decomposition into pairwise nonisomorphic irreducible constituents, the predicted average of `h_3(K/k)` over `G`-extensions with given behaviour at infinity is `(1 + x_V) ∏_i Σ_{j=0}^{a_i} [a_i choose j]_{q_i} x_i^j`, where `x_Z = ∏_v|Z^{σ_v}|^{−1}`, `x_i = x_{V_i}` and `q_i = |End_G(V_i)|` (Gaussian binomial). When `W'` is irreducible this is `(1 + 3^{−u(K/F)})(1 + 3^{−u(F/k)})`, `u(·/·)` the relative unit ranks.

`G = C_2 ≀ H` transitive with a transposition The Cohen–Martinet moment predictions for every module `V^ε ⊕ ⊕_i V_i^{j_i}`, `ε∈{0,1}`, `0≤j_i≤a_i`, on the same counted family (including the zero target, hence eventual nonemptiness). Predictions for the individual irreducibles alone are insufficient.

For the proof, `Ind_{S_K}^G 𝔽₃ = W × V` and `h_3(K/k) = |Hom_{S_K}(Cl_{K̃/k}, 𝔽₃)| = |Hom_G(Cl_{K̃/k}, W' × V)|` (`Cl_{K̃/k}` has no trivial quotient). Expand `|Hom_G(Cl,V⊕W′)|` as `Σ_{Z≤V⊕W′}|Sur_G(Cl,Z)|`. Semisimplicity and the absence of `V` from `W′` imply that submodules of type `V^ε⊕⊕_i V_i^{j_i}` number `∏_i [a_i choose j_i]_{q_i}`. Apply the assumed moment convergence to every such direct-sum target: its predicted value is `x_V^ε ∏_i x_i^{j_i}`, since fixed spaces commute with direct sums. The finite sum of these limits factors into the displayed product. This uses joint moments, not an unsupported interchange of averages with products. Count fixed points: `∏_v|W^{σ_v}| = 3^{r_1(F)+r_2(F)}` and `∏_v|(W')^{σ_v}| = 3^{u(F/k)}`; with Proposition 7.1 for `V` the irreducible case gives the product formula.

*Needs:* [cohen martinet prediction for relative three torsion](#cohen-martinet-prediction-for-relative-three-torsion), [cohen martinet surjection moment conjecture](#cohen-martinet-surjection-moment-conjecture), [cohen martinet predicted surjection moment](#cohen-martinet-predicted-surjection-moment), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, §7.2, pp. 39–40; numerical table and weighted-average explanation, p. 40.)

**Checks.**

- Example `7.2 (k = ℚ, G = D_4)`: predicted averages of `h_3(K)` are 40/27, 16/9, 8/3, 8/3 for the four group signatures (), (24), (13)(24), (12)(34).
- The same families have proven averages ≈ 1.12, 1.34, 2.01, 1.41 ([dihedral quartic proven average versus prediction](#dihedral-quartic-proven-average-versus-prediction)).

- For base `ℚ` the roots-of-unity exclusion holds at three; for `ℚ(ζ₃)` these classical joint-moment hypotheses are not asserted.

<a id="dihedral-quartic-proven-average-versus-prediction"></a>

**Dihedral quartic proven average versus prediction.** For `k = ℚ` and `G = D_4` (quartic fields with a quadratic subfield `F`), in each group signature the proven average of `h_3(K)` (LOWW Theorem 6.1, at Layer 3) is `C_{G,Σ} = (1 + 3^{−u(K/F)}) · A_w(Σ̄)`, where `A_w` is the average of `h_3(F)` over quadratic `F` of the matching signature weighted by `Res_{s=1}ζ_F/(ζ_F(2)Disc(F)²)`, whereas the Cohen–Lenstra–Martinet prediction replaces `A_w` by the discriminant-uniform average `1 + 3^{−u(F/ℚ)}` (Datskovsky–Wright). The source reports approximate values 1.12, 1.34, 2.01, 1.41. A strict comparison is conditional on explicit bounds: for each signature assume the weighted numerator lies in `[L_Σ,U_Σ]`, its positive denominator lies in `[d_Σ,D_Σ]` with `d_Σ>0`, and `(1+3^(−u))U_Σ/d_Σ` is strictly below the displayed prediction. These numerical bounds imply the strict inequality; evaluating the series is not a target.

`k = ℚ`, `G = D_4` LOWW Theorem 6.1 (Layer 3)

For the proof, Read the factorisation `C_{G,Σ} = (1 + 3^{−u(K/F)}) ×` (weighted average of `h_3(F)`) from the formula of LOWW Theorem 6.1 (Layer 3). Compare with [cohen martinet prediction for three torsion of two extensions](#cohen-martinet-prediction-for-three-torsion-of-two-extensions): the first factors agree (Proposition 7.1), the second is the weighted versus the uniform average. For the strict comparison, assume the displayed numerator and denominator bounds, including their tails, for the series with weights `Res ζ_F/(ζ_F(2)Disc(F)²)`. Positivity and division give the claimed upper bound. The exact factorization does not require those numerical hypotheses.

*Needs:* [cohen martinet prediction for three torsion of two extensions](#cohen-martinet-prediction-for-three-torsion-of-two-extensions), [cohen martinet prediction for relative three torsion](#cohen-martinet-prediction-for-relative-three-torsion), [ArithmeticStatisticsPartV: relative three torsion propagation](../ArithmeticStatisticsPartV/README.md#relative-three-torsion-propagation), [ArithmeticStatisticsPartV: two extension three torsion means](../ArithmeticStatisticsPartV/README.md#two-extension-three-torsion-means).

([[44]](#ref-44), Forum Math. Pi 13 (2025), e19, Example 7.2, pp. 39–40; numerical table and weighted-average explanation, p. 40.)

**Checks.**

- LOWW's table: CLM predicted `(1 + 1/9)(1 + 1/3) ≈ 1.48` versus proven ≈ 1.12 for `σ_v = ()`.
- The relative average `h_3(K/F)` is not biased: its proven average `1 + 3^{−u}` equals the prediction.

- Without the strict numerator/denominator interval inequality, the approximate table alone does not prove a strict inequality.


### 5.3 Joint Frobenius cokernels

<a id="enhanced-cohen-lenstra-finite-level-law"></a>

**Enhanced cohen lenstra finite level law.** For a prime `ℓ`, `g ≥ 0` and a tuple `n = (n_1, …, n_k)` of positive integers, the finite-level law on `k`-tuples of classes is `CL^{(g)}_{n,ℓ}(H_1, …, H_k) = Haar_g(F ∈ End_g(ℤ_ℓ) : coker(1 − F^{n_j}) ≅ H_j for all j)`. The enhanced law `CL_{n,ℓ}` (Lipnowski–Tsimerman Definition 5.16, distinct `n_j`) is its limit as `g → ∞`, defined only where the limit exists (EnhancedCohenLenstraLimitExists); `CL_{n,S}` is the product over `ℓ ∈ S`.

`ℓ` prime `n_j ≥ 1`

The required API is:

- `enhancedCokernelLaw`: The finite-`g` joint law of `(coker(1 − F^{n_j}))_j`.
- `EnhancedCohenLenstraLimitExists`: The proposition that every finite-`g` mass converges as `g → ∞`.
- `enhancedCohenLenstra`: `CL_{n,ℓ}(H)` as the limit of the finite-`g` masses.
- `enhancedCokernelLaw_one`: For `n = (1)` the finite-`g` law is the law of `coker(1 − F)`.
- `enhancedCohenLenstra_one`: `CL_{(1),ℓ} = μ_{ℓ,0}` (by Friedman–Washington).
- `tsum_enhancedCokernelLaw`: Each finite-`g` law has total mass 1.
- `enhancedCokernelLaw_zero_zero`: `CL^{(g)}_{(1,2),ℓ}(0, 0) = P(1 − F² invertible mod ℓ)` for `F` uniform in `M_g(𝔽_ℓ)`.

For the proof, Define the finite-`g` law as the Haar measure of the set of `F` with the prescribed cokernels (`padicMatrixHaar` on `M_g(ℤ_ℓ)`). Each `det(1−F^{n_j})` is a nonzero polynomial (its value at `F=0` is 1). Its Haar-zero vanishing set follows by one-variable root finiteness and Fubini, as in the Haar-cokernel law. Outside the finite union of these null sets all cokernels are finite. Smith normal form makes each prescribed finite-cokernel event measurable via a sufficiently deep finite congruence quotient. The joint class events therefore partition a full-measure set. Define the existence proposition for the limits and the limit (`limUnder`) as separate declarations; no limiting measure is asserted.

*Needs:* [ArithmeticStatisticsPartIV: friedman washington cokernel law](../ArithmeticStatisticsPartIV/README.md#friedman-washington-cokernel-law), [ArithmeticStatisticsPartIV: friedman washington translation form](../ArithmeticStatisticsPartIV/README.md#friedman-washington-translation-form), [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups), `MeasureTheory.Measure.haarMeasure` (Mathlib).

([[45]](#ref-45), arXiv 1511.02212v1, Definition 5.16, p. 35.)

**Checks.**

- For `g = 0` all cokernels are trivial: the mass of (0, 0) is 1.
- The mass of `(ℤ/ℓ, 0)` for `n = (1, 2)` is 0: the components are not independent, so a product of Cohen–Lenstra measures is the wrong definition.
- For `n = (1)` the finite-`g` laws converge to `μ_{ℓ,0}`.
- `n = (1)` recovers the Friedman–Washington law of `coker(1 − F)` ([ArithmeticStatisticsPartIV: friedman washington translation form](../ArithmeticStatisticsPartIV/README.md#friedman-washington-translation-form)).
- The components are dependent: `coker(1 − F)` is a quotient-compatible piece of `coker(1 − F²)` since `1 − F² = (1 − F)(1 + F)`.

<a id="zero-cokernel-probability-at-two"></a>

**Zero cokernel probability at two.** For `F` uniform in `M_g(𝔽₂)`, `P(1 − F² ∈ GL_g(𝔽₂)) = |GL_g(𝔽₂)|/2^{g²} = ∏_{j=1}^{g}(1 − 2^{−j})`; it decreases to `∏_{j≥1}(1 − 2^{−j}) = c_{2,0} ≈ 0.2888 > 0`. Hence `CL^{(g)}_{(1,2),2}(0, 0) = ∏_{j=1}^{g}(1 − 2^{−j})`.

`g ∈ ℕ`

For the proof, In characteristic 2, `1 − F² = (1 − F)²`, which is invertible iff `1 − F` is. `F ↦ 1 − F` is a bijection of `M_g(𝔽₂)`, so the count equals `|GL_g(𝔽₂)|` (`Matrix.card_GL_field`) out of `2^{g²}` matrices. For the `ℓ`-adic law: `coker(1 − F) = coker(1 − F²) = 0` iff `1 − F²` is invertible over `ℤ_2` iff it is invertible mod 2 (`enhancedCokernelLaw_zero_zero`), and Haar measure pushes forward to the uniform measure mod 2.

*Needs:* [enhanced cohen lenstra finite level law](#enhanced-cohen-lenstra-finite-level-law), `Matrix.card_GL_field` (Mathlib).

([[45]](#ref-45), arXiv 1511.02212v1, Example 5.17, p. 35.)

**Checks.**

- `g = 1`: exactly 1 of the 2 matrices has invertible `1−F²`, giving probability `1/2`.
- `g = 2`: exactly 6 of the 16 matrices have invertible `1−F²`, giving probability `3/8`.
- The limit `c_{2,0}` is positive, as Lipnowski–Tsimerman need.

<a id="zero-cokernel-probability-lower-bound-at-odd-primes"></a>

**Zero cokernel probability lower bound at odd primes.** For an odd prime `ℓ` and every `g`, `F` uniform in `M_g(𝔽_ℓ): P(1 − F² ∈ GL_g(𝔽_ℓ)) ≥ 2c_{3,0} − 1 = 2∏_{k≥1}(1 − 3^{−k}) − 1 ≈ 0.1202 > 0`. This proves a positive lim inf of `CL^{(g)}_{(1,2),ℓ}(0, 0)`, not the existence of the limit.

`ℓ` odd prime `g ∈ ℕ`

For the proof, `1 − F² = (1 − F)(1 + F)` is invertible iff neither 1 nor −1 is an eigenvalue of `F` (`1 ≠ −1` since `ℓ` is odd). Union bound: `P(1 or −1 eigenvalue) ≤ P(1 eigenvalue) + P(−1 eigenvalue) = 2(1 − |GL_g(𝔽_ℓ)|/ℓ^{g²})`, using the bijections `F ↦ 1 − F` and `F ↦ −1 − F`. `|GL_g(𝔽_ℓ)|/ℓ^{g²} = ∏_{j=1}^{g}(1 − ℓ^{−j}) ≥ c_{ℓ,0} ≥ c_{3,0}` (`Matrix.card_GL_field`; monotonicity in `ℓ`).

*Needs:* [enhanced cohen lenstra finite level law](#enhanced-cohen-lenstra-finite-level-law), [ArithmeticStatisticsPartIV: cohen lenstra measure](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure), `Matrix.card_GL_field` (Mathlib).

([[45]](#ref-45), arXiv 1511.02212v1, Example 5.17, p. 36.)

**Checks.**

- `ℓ = 3`, `g = 1`: exactly 1 of the 3 matrices has invertible `1−F²`, so `P = 1/3 ≥ 0.1202`.
- `ℓ = 5`, `g = 2`: exactly 365 of the 625 matrices have invertible `1−F²`, so `P = 0.584`.
- The printed chain in LT has the same bound 0.12025….

<a id="enhanced-cohen-lenstra-conjecture"></a>

**Enhanced cohen lenstra conjecture.** Conjecture (a proposition about one family). Let `p` be a prime, `S` a finite set of primes not containing `p`, `n = (n_1, …, n_k)` distinct positive integers, and `(F_g)_g` a family of `g`-dimensional abelian varieties over `𝔽_p` with sampling laws `P_g`. Assume the limits defining `CL_{n,ℓ}` exist for `ℓ ∈ S`. If `CL_S` models `A(𝔽_p)_S` (for every `H`, `P_g(A(𝔽_p)_S ≅ H) → CL_S(H)`), then `CL_{n,S}` models the joint law: `P_g(A(𝔽_{p^{n_j}})_S ≅ H_j for all j) → ∏_{ℓ∈S} CL_{n,ℓ}((H_j)_ℓ)`. Lipnowski–Tsimerman state it for 'geometric' families, which the source does not define; the proposition here is attached to a given family.

The required API is:

- `EnhancedCohenLenstraConjecture`: The conjecture for a family `(Ω_g, P_g, pt)` and exponents `n`.
- `EnhancedCohenLenstraConjecture.apply`: Given the `CL_S` hypothesis, the joint convergence to `∏_ℓ CL_{n,ℓ}`.
- `enhancedCohenLenstraConjecture_single`: For `n = (1)` the conjecture holds for every family.

For the proof, Represent the family by probability mass functions `P_g` on finite sets `Ω_g` and the `ℓ`-primary point groups `pt(g, ω, m, ℓ)` of `A_ω(𝔽_{p^m})` as classes. State the implication between the two convergence statements, with `CL_S` from [ArithmeticStatisticsPartIV: cohen lenstra measure over a finite set of primes](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure-over-a-finite-set-of-primes) and `CL_{n,ℓ}` from [enhanced cohen lenstra finite level law](#enhanced-cohen-lenstra-finite-level-law).

*Needs:* [ArithmeticStatisticsPartIV: cohen lenstra measure over a finite set of primes](../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure-over-a-finite-set-of-primes), [enhanced cohen lenstra finite level law](#enhanced-cohen-lenstra-finite-level-law).

([[45]](#ref-45), arXiv 1511.02212v1, Conjecture 5.18, p. 36.)

**Checks.**

- For `k = 1` and `n = (1)` the conjecture holds for every family (conclusion `=` hypothesis, `CL_{(1),ℓ} = μ_{ℓ,0}`).
- Under the conjecture with `n = (1, 2)` and `S = {2}`, `P_g(A(𝔽_p)_2 = 0 and A(𝔽_{p²})_2 = 0) → lim_g ∏_{j=1}^{g}(1 − 2^{−j}) = c_{2,0}`.
- The conclusion is not asserted unconditionally: a family whose `A(𝔽_p)_S` is not `CL_S`-distributed satisfies the proposition vacuously.
- For `n = (1)` the conclusion equals the hypothesis.
- Lipnowski–Tsimerman Corollary 5.20 gives, conditionally, incompatibility of random principally polarized abelian varieties with the proposed joint target law. Refuting the implication encoded here additionally requires establishing its marginal Cohen–Lenstra premise; failure of the joint law alone does not do that.

### 5.4 Finite quadratic intersection laws

<a id="maximal-isotropic-subspaces-of-a-quadratic-space"></a>

**Maximal isotropic subspaces of a quadratic space.** This is the submodule parameter-space adapter over an arbitrary field, extending the finite quadratic-module boundary above. Let `K` be a field, `V` a finite-dimensional `K`-vector space and `Q : V → K` a quadratic form (Mathlib `QuadraticForm`, any characteristic), with polar form `b_Q(x, y) = Q(x + y) − Q(x) − Q(y)`. For a subspace `W` let `W^⊥` be its `b_Q`-orthogonal. `W` is maximal isotropic if `Q|_W = 0` and `W^⊥ = W`; `I_V` denotes the set of maximal isotropic subspaces. `(V, Q)` is nondegenerate if `b_Q` is nondegenerate, and weakly metabolic if moreover `I_V ≠ ∅`. For `K = 𝔽_p` this is Poonen–Rains' definition for a quadratic form with values in `(1/p)ℤ/ℤ ≅ 𝔽_p`. The condition `Q|_W = 0` is part of the definition: in characteristic 2, `W^⊥ = W` does not imply it.

`V` finite-dimensional over `K`; `Q` a quadratic form on `V`

The parameter-space definitions in `Suggested.lean` are `IsMaxIsotropic`, `maxIsotropicSubspaces` and `IsWeaklyMetabolic`. Develop their dimension and isometry theory: a maximal isotropic in a nondegenerate space of dimension `2n` has dimension `n`; conversely a quadratic-isotropic subspace of dimension `n` is maximal. Quadratic isometries transport maximal isotropics bijectively. For `Q(x,y)=xy` on `K²`, the maximal isotropics are exactly the two coordinate axes.

For the proof, Define `W^⊥` as `LinearMap.BilinForm.orthogonal` of `QuadraticMap.polarBilin Q`. Define `IsMaxIsotropic Q W := (∀ w ∈ W, Q w = 0) ∧ W^⊥ = W`, and `I_V` as the set of such `W`. Nondegenerate: `LinearMap.BilinForm.Nondegenerate` of the polar form; weakly metabolic: nondegenerate and `I_V` nonempty.

*Needs:* `QuadraticForm` (Mathlib), `QuadraticMap.polarBilin` (Mathlib), `LinearMap.BilinForm.orthogonal` (Mathlib), `LinearMap.BilinForm.Nondegenerate` (Mathlib), `LinearMap.BilinForm.finrank_add_finrank_orthogonal` (Mathlib).

([[28]](#ref-28), §2.1, p. 5; [[28]](#ref-28), §2.1, Remark 2.3, p. 5.)

**Checks.**

- For `K = 𝔽_p` and `Q(x, y) = x y` on `K²`, the set `maxIsotropicSubspaces Q` has exactly 2 elements.
- Over `𝔽₂` with `Q(x, y) = x y`, `W = span{(1, 1)}` has `W^⊥ = W` for the polar form but is not maximal isotropic.
- `Q(x, y) = x² + x y + y²` on `𝔽₂²` is nondegenerate but has no maximal isotropic subspace, so it is not weakly metabolic.
- On `V = 0` the unique maximal isotropic subspace is `⊥` (the zero subspace).
- `(K², xy)` is weakly metabolic with exactly two maximal isotropic subspaces `K × 0` and `0 × K`.
- If `(V, Q)` is weakly metabolic of dimension `2n` then every `W ∈ I_V` has dimension `n`.
- Over `𝔽₂` the form `Q(x, y) = xy` and the line `W = 𝔽₂(1, 1)` satisfy `W^⊥ = W` but `Q(1, 1) = 1`, so `W ∉ I_V`.

<a id="isotropic-reduction-map"></a>

**Isotropic reduction map.** The new map reduces a varying maximal isotropic; the quotient-form adapter extends the finite quadratic quotient to arbitrary fields. Let `(V, Q)` be a nondegenerate quadratic space over a field `K` and `X ⊆ V` an isotropic subspace `(Q|_X = 0)`. Then `X ⊆ X^⊥`, the quotient `X^⊥/X` carries the induced quadratic form `Q_X(v + X) := Q(v)`, which is well defined and has nondegenerate polar form, and `dim X^⊥/X = dim V − 2 dim X`. For `W ∈ I_V`, the subspace `(W ∩ X^⊥) + X` lies in `I_V` and its image `π_X(W) := ((W ∩ X^⊥) + X)/X` lies in `I_{X^⊥/X}`. The map `π_X` : `I_V → I_{X^⊥/X}` is the isotropic reduction map; if `X ⊆ W` then `π_X(W) = W/X`, and for `X ⊆ Y` isotropic, `π_{Y/X} ∘ π_X = π_Y`.

`(V, Q)` nondegenerate, finite-dimensional `X` isotropic: `Q|_X = 0`

The required API is:

- `isotropicQuotientForm`: `Q_X` on `X^⊥/X`, `Q_X(v + X) = Q(v)`.
- `isotropicQuotientForm_nondegenerate`: The polar form of `Q_X` is nondegenerate.
- `finrank_isotropicQuotient`: `dim X^⊥/X = dim V − 2 dim X`.
- `isotropicReduction`: `π_X` : `I_V → I_{X^⊥/X}`, `W ↦ ((W ⊓ X^⊥) ⊔ X)/X`.
- `isotropicReduction_of_le`: `X ≤ W ∈ I_V ⇒ π_X(W) = W/X`: its preimage in `X^⊥` is `W` (note `W = W^⊥ ⊆ X^⊥`).
- `isotropicReduction_bot`: `π_0 = id`: the preimage of `π_0(W)` is `W`.
- `isotropicReduction_comp`: For `X ≤ Y` isotropic and `W ∈ I_V`, `π_Y` factors through `π_X` under `(Y^⊥/X)/(Y/X) ≅ Y^⊥/Y`; in particular `dim π_Y(W) = dim π_X(W) − (dim Y − dim X)`.

For the proof, Well-definedness of `Q_X`: for `x ∈ X` and `v ∈ X^⊥`, `Q(v + x) = Q(v) + Q(x) + b_Q(v, x) = Q(v)`. Nondegeneracy of `Q_X`: if `v ∈ X^⊥` pairs to zero with `X^⊥` then `v ∈ (X^⊥)^⊥ = X` (double orthogonal for a nondegenerate form, from `mathlib:LinearMap.BilinForm.finrank_add_finrank_orthogonal` and inclusion). Dimension: `dim X^⊥ = dim V − dim X` by nondegeneracy, so `dim X^⊥/X = dim V − 2 dim X` (`mathlib:Submodule.finrank_quotient_add_finrank`). `W' := (W ∩ X^⊥) + X` is isotropic: `Q` vanishes on `W ∩ X^⊥ ⊆ W` and on `X`, and `b_Q(W ∩ X^⊥, X) = 0`. `dim W' = n` when `dim V = 2n: dim(W ∩ X^⊥) = 2n − dim(W + X) = n − dim X + dim(W ∩ X)` (orthogonal of a sum, `W^⊥ = W`), so `dim W' = dim(W ∩ X^⊥) + dim X − dim(W ∩ X) = n`; an isotropic subspace of dimension `n` in a nondegenerate `2n`-space equals its orthogonal, so `W' ∈ I_V`. Its image in `X^⊥/X` is maximal isotropic by the lattice correspondence between subspaces of `X^⊥` containing `X` and subspaces of `X^⊥/X`. Compatibility `π_{Y/X} ∘ π_X = π_Y`: unwind the definitions using the third isomorphism theorem.

*Needs:* [maximal isotropic subspaces of a quadratic space](#maximal-isotropic-subspaces-of-a-quadratic-space), `LinearMap.BilinForm.finrank_add_finrank_orthogonal` (Mathlib), `Submodule.finrank_quotient_add_finrank` (Mathlib).

([[28]](#ref-28), §2.1, Remark 2.4(a),(b), p. 5.)

**Checks.**

- `isotropicReduction Q ⊥ W = W` (after the identification `⊥^⊥/⊥ ≅ V`).
- For `Q(x, y) = x y` on `K²` and `X = K × 0`, the space `X^⊥/X` is zero.
- For `dim V = 2n` and `dim X = k` with `X` isotropic, `finrank (X^⊥/X) = 2n − 2k`.
- Over `𝔽₂` with `Q(x,y)=xy`, `X=𝔽₂(1,1)` satisfies `X=X^⊥`, so the quotient exists; `Q` cannot descend because 0 and `(1,1)` represent the same class but have values 0 and 1. In odd characteristic the same line is not even contained in its orthogonal.
- `X = 0: π_0` is the identity of `I_V`.
- `V` the hyperbolic plane and `X = K × 0: X^⊥/X = 0` and `π_X` is the constant map to `{0}`.
- `dim X^⊥/X = 2n − 2 dim X` when `dim V = 2n`.

<a id="fibres-of-the-isotropic-reduction-map"></a>

**Fibres of the isotropic reduction map.** Let `(V, Q)` be a weakly metabolic quadratic space of dimension `2n` over `𝔽_p` and `X ⊆ V` an isotropic subspace. Then every fibre of `π_X` : `I_V → I_{X^⊥/X}` has exactly `∏_{i=1}^{dim X} (p^{n−i} + 1)` elements.

`(V, Q)` weakly metabolic over `𝔽_p`, `dim V = 2n`; `X` isotropic

For the proof, Reduce to `dim X = 1` by choosing a full flag `0 = X_0 ⊂ X_1 ⊂ … ⊂ X_k = X` and factoring `π_X` as the composite of the reductions `π_{X_{i}/X_{i−1}}` ([isotropic reduction map](#isotropic-reduction-map), API `isotropicReduction_comp`); the space at stage `i` has dimension `2(n − i + 1)`. Case `X = 𝔽_p v`: fix `W̄ ∈ I_{X^⊥/X}` and its preimage `W ⊇ X` in `I_V`. The map `Z ↦ Z ∩ W` from the fibre over `W̄` to `{hyperplanes of W not containing v} ∪ {W}` is a bijection: if `v ∈ Z` then `Z = W`; if `v ∉ Z` then `Z ∩ W` is a hyperplane `W_1` of `W`. Conversely, for a hyperplane `W_1 ⊂ W` not containing `v`, the `Z ∈ I_V` containing `W_1` correspond to maximal isotropic lines of the 2-dimensional weakly metabolic space `W_1^⊥/W_1 ≅ (𝔽_p², xy)`, of which there are exactly two ([maximal isotropic subspaces of a quadratic space](#maximal-isotropic-subspaces-of-a-quadratic-space), the hyperbolic-plane classification): one is `W`, the other `Z` has `Z ∩ W = W_1` and reduces to `W̄`. Since `v∉W₁`, the other `Z` cannot contain `v` (otherwise it contains `W₁+𝔽_pv=W` and equals `W`). The printed source omits this necessary hyperplane restriction. Count: the hyperplanes of the `n`-dimensional `W` not containing `v` number `(p^n − 1)/(p − 1) − (p^{n−1} − 1)/(p − 1) = p^{n−1}`; adding `Z = W` gives `p^{n−1} + 1` elements in each fibre when `dim X = 1`; the product over the flag gives `∏_{i=1}^{dim X}(p^{n−i} + 1)`.

*Needs:* [isotropic reduction map](#isotropic-reduction-map), [maximal isotropic subspaces of a quadratic space](#maximal-isotropic-subspaces-of-a-quadratic-space), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient).

([[28]](#ref-28), Proposition 2.6(a) and its proof, pp. 5–6; [[28]](#ref-28), Proof of Proposition 2.6(a), p. 6.)

**Checks.**

- `dim X = 0`: fibres are singletons (empty product).
- `n = 1`, `X` a line: the fibre over the single point of `I_0` is all of `I_V`, of size `p^0 + 1 = 2`.

<a id="number-of-maximal-isotropic-subspaces"></a>

**Number of maximal isotropic subspaces.** If `(V, Q)` is a weakly metabolic quadratic space of dimension `2n` over a finite field `𝔽_q`, then `#I_V = ∏_{j=0}^{n−1} (q^j + 1)`. The count uses the actual submodule parameter set.

`(V, Q)` weakly metabolic over a finite field `𝔽_q`, `dim V = 2n`

For the proof, Apply [fibres of the isotropic reduction map](#fibres-of-the-isotropic-reduction-map) with `X` a maximal isotropic subspace `(dim X = n): X^⊥/X = 0` has exactly one maximal isotropic subspace, so `#I_V = ∏_{i=1}^n(q^(n−i)+1) = ∏_{j=0}^{n−1}(q^j+1)`. The same flag and hyperplane count works over every finite field.

*Needs:* [fibres of the isotropic reduction map](#fibres-of-the-isotropic-reduction-map).

([[28]](#ref-28), Proposition 2.6(b) and proof, pp. 5–6; Remark 2.7, p. 7, for arbitrary finite fields.)

**Checks.**

- `n = 1: #I_V = 2` (the hyperbolic plane).
- `p = 2`, `n = 2: #I_V = (1 + 1)(2 + 1) = 6`.
- At `n=0` the parameter set is a singleton and the empty product is one.

<a id="intersection-dimension-generating-function"></a>

**Intersection dimension generating function.** Let `(V, Q)` be weakly metabolic of dimension `2n` over a finite field `𝔽_q` and fix `W ∈ I_V`. For `Z` uniform on `I_V` let `X_n := dim(Z ∩ W)` and `a_{d,n} := Prob(X_n = d)`. Then `X_n` is distributed as a sum of independent Bernoulli variables `B_1`, …, `B_n` with `Prob(B_i = 1) = 1/(q^{i−1} + 1)`; equivalently `Σ_{d≥0} a_{d,n} z^d = ∏_{i=0}^{n−1} (z + q^i)/(1 + q^i)`, `i`.e. `Σ_{Z ∈ I_V} z^{dim(Z ∩ W)} = ∏_{i=0}^{n−1} (z + q^i)` as polynomials in `z`. `Distributions.maxIsotropic_intersection_generating_function` states its evaluation at every real `z`.

`(V, Q)` weakly metabolic over `𝔽_q`, `dim V = 2n`; `W ∈ I_V` fixed; `Z` uniformly distributed on the finite set `I_V`

For the proof, Induction on `n; n = 0` is trivial. For `n > 0` fix `0 ≠ v ∈ W` and `X = 𝔽_q v`, and write `Z̄ := π_X(Z)` ([isotropic reduction map](#isotropic-reduction-map)). `dim(Z ∩ W) = dim(Z̄ ∩ W̄) + [v ∈ Z]`, where `W̄ = W/X ∈ I_{X^⊥/X} (dim 2n − 2)`. `Z̄` is uniform on `I_{X^⊥/X}` because every fibre of `π_X` has the same size `q^{n−1} + 1` ([fibres of the isotropic reduction map](#fibres-of-the-isotropic-reduction-map)); so `dim(Z̄ ∩ W̄)` has the law of `X_{n−1}`. Conditionally on `Z̄`, exactly one of the `q^{n−1} + 1` elements of the fibre contains `v` (the preimage of `Z̄` in `X^⊥`), so `[v ∈ Z]` is Bernoulli with parameter `1/(q^{n−1} + 1)`, independent of `Z̄`. Multiply generating functions: `(z + q^{n−1})/(1 + q^{n−1})` times the generating function of `X_{n−1}`; the count form follows from [number of maximal isotropic subspaces](#number-of-maximal-isotropic-subspaces).

*Needs:* [isotropic reduction map](#isotropic-reduction-map), [fibres of the isotropic reduction map](#fibres-of-the-isotropic-reduction-map), [number of maximal isotropic subspaces](#number-of-maximal-isotropic-subspaces).

([[28]](#ref-28), Proposition 2.6(c),(d), pp. 6–7; Remark 2.7, p. 7.)

**Checks.**

- `n = 1: X_1` is 0 or 1 with probability 1/2 each.
- At `n=0` the generating polynomial is one, so half-parity does not apply.
- `z = 1` gives total mass `1; z = −1` gives `Prob(X_n even) − Prob(X_n odd) = 0` for `n ≥ 1` (the `i = 0` factor vanishes).

<a id="intersection-dimension-law-closed-form"></a>

**Intersection dimension law closed form.** In the setting of [intersection dimension generating function](#intersection-dimension-generating-function), for `0 ≤ d ≤ n: a_{d,n} = ∏_{j=0}^{n−1} (1 + p^{−j})^{−1} · ∏_{j=1}^{d} p/(p^{j} − 1) · ∏_{j=0}^{d−1} (1 − p^{j−n})`.

`p` prime `0 ≤ d ≤ n`

For the proof, Rewrite the generating function as `∏_{i=0}^{n−1}(1 + p^{−i}z) / ∏_{i=0}^{n−1}(1 + p^{−i})`. Apply [ArithmeticStatisticsPartIV: cauchy q binomial theorem](../ArithmeticStatisticsPartIV/README.md#cauchy-q-binomial-theorem) with `t = 1/p`: the coefficient of `z^d` in `∏_{i=0}^{n−1}(1 + p^{−i} z)` is `p^{−d(d−1)/2}[n d]_{1/p}`. Simplify `p^{−d(d−1)/2}[n d]_{1/p} = ∏_{j=1}^{d} p/(p^j − 1) · ∏_{j=0}^{d−1}(1 − p^{j−n})` using the product formula `gaussBinom_eq_prod` ([ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient)); routine algebra.

*Needs:* [intersection dimension generating function](#intersection-dimension-generating-function), [ArithmeticStatisticsPartIV: cauchy q binomial theorem](../ArithmeticStatisticsPartIV/README.md#cauchy-q-binomial-theorem), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient).

([[28]](#ref-28), Proposition 2.6(e) and proof, pp. 6–7.)

**Checks.**

- `n = 1`, `d = 0`, `1: a_{0,1} = a_{1,1} = 1/2`.
- `d = n: a_{n,n} = ∏_{j=0}^{n−1}(1 + p^{j})^{−1} = 1/#I_V (Z = W)`.

### 5.5 The Poonen–Rains law and parity

<a id="poonen-rains-distribution"></a>

**Poonen rains distribution.** For a prime `p`, the Poonen–Rains distribution is the probability measure on `ℤ_{≥0}` with `Prob(X_{Sel_p} = d) = a_d := c_p ∏_{j=1}^{d} p/(p^{j} − 1)`, where `c_p := ∏_{j≥0} (1 + p^{−j})^{−1} = (1/2) ∏_{i≥0} (1 − p^{−(2i+1)})`. (The `j = 0` factor is 1/2.) That the `a_d` sum to 1 is the theorem [intersection law converges to poonen rains](#intersection-law-converges-to-poonen-rains), which is used to package the weights as a probability mass function.

`p` prime

The weights in `Suggested.lean` are `poonenRainsConstant` and `poonenRainsWeight`. Package the normalized weights as a probability mass function, prove the alternate product for `c_p`, the recurrence `a_(d+1)=a_d p/(p^(d+1)−1)` and positivity of every weight. Identify its even mass as one half and its weights with the parity-averaged alternating-kernel limit.

For the proof, Define `c_p` as the convergent infinite product `∏_{j≥0}(1 + p^{−j})^{−1}` (convergent since `Σ p^{−j} < ∞`; `mathlib:tprod`, `mathlib:Multipliable`). Define the weights `a_d` by the finite products and the measure from the summation theorem. The second expression for `c_p`: substitute `1 + p^{−j} = (1 − p^{−2j})/(1 − p^{−j})` for `j ≥ 1` and cancel (telescoping of even exponents).

*Needs:* [intersection dimension law closed form](#intersection-dimension-law-closed-form), `tprod` (Mathlib), `Multipliable` (Mathlib).

([[28]](#ref-28), Proposition 2.6(f), p. 6; [[28]](#ref-28), Definition 2.9, p. 7.)

**Checks.**

- `poonenRainsWeight p 0 = poonenRainsConstant p`.
- `poonenRainsWeight 2 1 = 2 · poonenRainsWeight 2 0`.
- `poonenRainsWeight 2 0 ≠ ∏'_{i≥1}(1 − 2^{−i})` (the Cohen–Lenstra probability that the 2-rank is 0), since `c_2 < 1/4 < 0.28`.
- `poonenRainsWeight p d > 0` for all `d`, so no dimension is excluded.
- `p = 2: c_2 = (1/2)∏_{i≥0}(1 − 2^{−(2i+1)}) ≈ 0.2097`, `a_0 ≈ 0.2097`, `a_1 ≈ 0.4194`, `a_2 ≈ 0.2796`.
- `a_{d+1}/a_d = p/(p^{d+1} − 1)`.

<a id="intersection-law-converges-to-poonen-rains"></a>

**Intersection law converges to poonen rains.** `Distributions.intersectionLaw_tendsto_poonenRains` states normalization of the limiting weights and total-variation convergence of the actual finite quadratic intersection laws, whose probabilities are `Distributions.intersectionWeight`. For every `d ≥ 0`, `a_{d,n} → a_d` as `n → ∞; Σ_{d≥0} a_d = 1; Σ_d a_d z^d = ∏_{i≥0}(1 + p^{−i}z)/(1 + p^{−i})` for every complex `z` (both sides converge absolutely); and the laws of `X_n` converge in total variation to the Poonen–Rains distribution.

`p` prime

For the proof, Termwise limit: in the closed formula ([intersection dimension law closed form](#intersection-dimension-law-closed-form)) the factor `∏_{j=0}^{d−1}(1 − p^{j−n}) → 1` and `∏_{j=0}^{n−1}(1 + p^{−j})^{−1} → c_p` (`mathlib:tprod` of a multipliable family). Total mass: `a_{d,n} ≤ C·∏_{j=1}^{d} p/(p^j − 1)` with `C` independent of `n`, and `Σ_d ∏_{j=1}^d p/(p^j−1) < ∞` (ratio test: consecutive ratio `p/(p^{d+1} − 1) → 0`); dominated convergence for sums (`mathlib:ENNReal.tsum_mul_left` for the rearrangement) gives `Σ_d a_d = lim_n Σ_d a_{d,n} = 1`. For each fixed complex `z` the same majorant with an extra `|z|^d` is summable by the ratio test. Dominated convergence therefore passes the finite generating polynomial to `Σ_d a_d z^d`. The finite products converge absolutely because `Σ_i |z−1|p^{−i}/(1+p^{−i})<∞`. This also proves both convergence assertions in the complex generating-function statement. Total variation: pointwise convergence of probability mass functions with limit of total mass 1 (Scheffé's lemma for counting measure) implies convergence in total variation.

*Needs:* [intersection dimension law closed form](#intersection-dimension-law-closed-form), [poonen rains distribution](#poonen-rains-distribution), `tprod` (Mathlib), `ENNReal.tsum_mul_left` (Mathlib).

([[28]](#ref-28), Proposition 2.6(d),(f), p. 6; proof of (f), p. 7.)

**Checks.**

- `Σ_d a_d = 1` for `p = 2` and `p = 3` numerically to 10 digits.
- `a_{d,n} = 0` for `d > n`, while `a_d > 0`: the convergence is not uniform in `d` in ratio.
- The finite zero-dimensional law has mass one at zero; the limiting law has positive mass at every dimension.

<a id="poonen-rains-moments"></a>

**Poonen rains moments.** `Distributions.poonenRainsWeight_moments` states summability and the limiting moment identity. For `m ≥ 0: E[p^{m X_n}] = ∏_{i=1}^{m} (p^{i} + 1)/(1 + p^{−(n−i)})` for `n ≥ m`, and `E[p^{m X_{Sel_p}}] = ∏_{i=1}^{m} (p^{i} + 1)`. In particular `E[p^{X_{Sel_p}}] = p + 1` and `E[p^{2X_{Sel_p}}] = (p + 1)(p² + 1)` (`= 15` for `p = 2`).

`p` prime `m ≥ 0`

For the proof, Substitute `z = p^m` in the generating function of [intersection dimension generating function](#intersection-dimension-generating-function): `∏_{i=0}^{n−1}(p^m + p^i)/(1 + p^i)`; the factors with `i ≥ m` telescope against the denominators, leaving the stated product. Substitute `z=p^m` in the entire generating-function identity proved in intersection-law-converges-to-poonen-rains and cancel the finite shifted factors, obtaining `∏_{i=1}^m(p^i+1)`. Alternatively couple `X_n=Σ_{i≤n}B_i` with independent Bernoulli `B_i`: then `p^{mX_n}` increases almost surely, so monotone convergence applies to these random variables. The individual masses `a_{d,n}` are not monotone in `n` (`a_{0,n}` decreases), so monotone convergence cannot be applied to those masses.

*Needs:* [intersection dimension generating function](#intersection-dimension-generating-function), [intersection law converges to poonen rains](#intersection-law-converges-to-poonen-rains).

([[28]](#ref-28), Proposition 2.22(a) and proof, p. 12.)

**Checks.**

- `m = 1`, `p = 2: E[2^{X}] = 3`, the Bhargava–Shankar average of `#Sel_2`.
- `m = 2`, `p = 2: 15`, the bound of Bhargava–Shankar–Swaminathan Theorem 1.1.
- At `m=0` both the finite and limiting moments are one.

<a id="poonen-rains-parity"></a>

**Poonen rains parity.** `Prob(X_n even) = 1/2` for every `n > 0` and `Prob(X_{Sel_p} even) = 1/2`. Conditioning on either parity leaves the moments `E[p^{m X_{Sel_p}}]` unchanged, and the same holds for `E[p^{m X_n}]` when `m < n`.

`p` prime `n > 0`

For the proof, Substitute `z = −1` in the generating function ([intersection dimension generating function](#intersection-dimension-generating-function)): the `i = 0` factor `(z + 1)/2` vanishes, so `Σ_d (−1)^d a_{d,n} = 0`. Substitute `z = −p^m`: the factor with `i = m` vanishes when `m < n`, so `Σ_d (−1)^d a_{d,n} p^{md} = 0`, `i`.e. even and odd parts contribute equally; pass to the limit as in [poonen rains moments](#poonen-rains-moments).

*Needs:* [intersection dimension generating function](#intersection-dimension-generating-function), [poonen rains moments](#poonen-rains-moments).

([[28]](#ref-28), Proposition 2.22(b),(c), p. 12.)

**Checks.**

- `Σ_{d even} a_d = Σ_{d odd} a_d = 1/2`.
- At `n=0` the finite law is entirely even, so the positive-dimension hypothesis is necessary.
- At `m=n` the finite parity-conditioned moments need not agree: for `n=m=1`, they are 1 and `p`.

<a id="delaunay-sha-p-rank-law"></a>

**Delaunay sha p rank law.** For a prime `p` and `r ∈ ℤ_{≥0}`, `X_{Ш[p],r}` is the probability measure on `2ℤ_{≥0}` with `Prob(X_{Ш[p],r} = 2n) = p^{−n(2r+2n−1)} ∏_{i=n+1}^{∞} (1 − p^{−(2r+2i−1)}) / ∏_{i=1}^{n} (1 − p^{−2i})`. It is Delaunay's heuristic law with Poonen–Rains' correction (`u/2` replaced by `u = r`).

`p` prime `r ≥ 0`

The definition in `Suggested.lean` is `delaunayWeight`. Prove its zero-dimensional product formula, positivity and total mass one at every fixed rank. Identify the rank-zero law with the even-size alternating-kernel limit, the `p`-rank marginal of `A_0`.

For the proof, Define the weights by the convergent product (`mathlib:tprod`); total mass one follows for every `r≥0` from [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit), by its `dim G[p]` marginal. The compatibility theorem then uses these normalized laws.

*Needs:* [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit), `tprod` (Mathlib).

([[28]](#ref-28), §5, p. 21.)

**Checks.**

- `delaunayWeight p 0 0 = ∏'_{i≥1}(1 − p^{1−2i})`.
- `delaunayWeight p 1 0 > delaunayWeight p 0 0` (higher rank makes `Ш[p]` smaller).
- The law is indexed by `n` with dimension `2n` and already has total mass `Σ_n delaunayWeight p 0 n = 1`, so odd dimensions get mass 0: `dim Ш[p]` is even (alternating pairing).
- `poonenRainsWeight p (2n) = delaunayWeight p 0 n / 2` and `poonenRainsWeight p (2n+1) = delaunayWeight p 1 n / 2`.
- `Prob(X_{Ш[p],0} = 0) = ∏_{i≥1}(1 − p^{1−2i})`.
- Supported on even integers only.

<a id="delaunay-compatibility-of-the-selmer-model"></a>

**Delaunay compatibility of the selmer model.** `Distributions.delaunay_compatibility` states the equivalence between the finite convolution identities and the half-rank prior. For each prime `p`, the unique `ℤ_{≥0}`-valued random variable `R` such that `X_{Sel_p}` and `R + X_{Ш[p],R}` have the same distribution is the variable taking the values 0 and 1 with probability 1/2 each. (Here `X_{Ш[p],R}` is drawn from Delaunay's law with parameter `r = R.`)

`p` prime `R` is a nonnegative-integer-valued prior; conditionally on `R=r`, draw the Sha-dimension from the Delaunay law with that parameter. No unconditional independence of `R` and the resulting dimension is assumed.

For the proof, Existence: the identities `Prob(X_{Sel_p} = 2n) = (1/2)Prob(X_{Ш[p],0} = 2n)` and `Prob(X_{Sel_p} = 2n + 1) = (1/2)Prob(X_{Ш[p],1} = 2n)`, obtained by rewriting `c_p ∏_{j=1}^{2n} p/(p^j − 1)` with `c_p = (1/2)∏(1 − p^{−(2i+1)})` ([poonen rains distribution](#poonen-rains-distribution), the alternate product for `c_p`) and splitting even and odd factors; routine product manipulation. Uniqueness: with `f_r(s) := Prob(X_{Ш[p],r} = s − r)`, the hypothesis gives `Σ_r Prob(R = r) f_r = Σ_r Prob(R' = r) f_r` for the conjectured `R'`; the `f_r` are linearly independent in the `ℓ¹` sense because `f_r(s) = 0` for `s < r` and `f_r(r) > 0` ([delaunay sha p rank law](#delaunay-sha-p-rank-law), positivity of Delaunay weights); induct on `r`.

*Needs:* [poonen rains distribution](#poonen-rains-distribution), [delaunay sha p rank law](#delaunay-sha-p-rank-law).

([[28]](#ref-28), §5, Theorem 5.2 and proof, pp. 21–22.)

**Checks.**

- `p = 2: a_0 = (1/2)Prob(X_{Ш[2],0} = 0) = (1/2)∏_{i≥1}(1 − 2^{1−2i}) ≈ 0.2097`.
- An even-dimension mixture of ranks 0 and 2 cannot reproduce the positive odd Poonen–Rains masses.
- With half-mass at ranks 0 and 1, dimension `2n` receives only the rank-zero contribution and dimension `2n+1` only the rank-one contribution.

### 5.6 Alternating matrices and symplectic cokernels

<a id="count-of-nondegenerate-alternating-matrices"></a>

**Count of nondegenerate alternating matrices.** Let `M_m(𝔽_p)^alt` be the set of alternating `m × m` matrices over `𝔽_p` (zero diagonal, `Aᵗ = −A`), of cardinality `p^{m(m−1)/2}`, and `GL_m(𝔽_p)^alt` its subset of invertible ones. If `m` is odd, `GL_m(𝔽_p)^alt = ∅`. If `m` is even, `#GL_m(𝔽_p)^alt / #M_m(𝔽_p)^alt = ∏_{i=1}^{m/2} (1 − p^{1−2i})`.

`p` prime `m ≥ 0`

For the proof, `#M_m(𝔽_p)^alt = p^{m(m−1)/2}`: an alternating matrix is determined freely by its strictly upper triangular entries. Odd `m: det A = det Aᵗ = det(−A) = −det A` in odd dimension, and for `p = 2` an alternating (zero-diagonal symmetric) form of odd rank does not exist; in all characteristics the rank of an alternating form is even (symplectic basis), so `A` is singular. The `m=0` case is the unique empty matrix and gives the empty product 1. For even `m≥2`, Even `m`, induction on `m`: the first column of an invertible alternating `A` is any of the `p^{m−1} − 1` nonzero vectors with zero first entry; the number of completions does not depend on it (a change of basis in `GL_m(𝔽_p)` fixing `e_1` moves any admissible column to any other), and splitting off the hyperbolic plane spanned by `e_1` and a partner leaves `p^{m−2}` free coupling entries times an invertible alternating `(m − 2)`-matrix: `#GL_m^alt = (p^{m−1} − 1) p^{m−2} #GL_{m−2}^alt`. Divide by `p^{m(m−1)/2} = p^{2m−3} p^{(m−2)(m−3)/2}`: the factor is `(p^{m−1} − 1)/p^{m−1} = 1 − p^{1−m}`; with `m = 2i` this is `1 − p^{1−2i}`.

*Needs:* `Matrix.card_GL_field` (Mathlib).

([[29]](#ref-29), §3.6, Lemma 3.6 and proof, p. 8.)

**Checks.**

- `m = 2`: the invertible alternating `2 × 2` matrices are `[[0, a], [−a, 0]]` with `a ≠ 0`: ratio `(p − 1)/p = 1 − p^{−1}`.
- `p = 2`, `m = 4: 28` of the 64 alternating matrices are invertible, and `(1 − 2^{−1})(1 − 2^{−3}) = 7/16 = 28/64`.
- At `m=0` the empty matrix is invertible and the proportion is one.

<a id="alternating-matrix-kernel-law"></a>

**Alternating matrix kernel law.** For a prime `p` and integers `n ≥ j ≥ 0`, `P_p(j | n)` is the probability that a uniformly random alternating `n × n` matrix over `𝔽_p` has kernel of dimension exactly `j: P_p(j | n) := #{A ∈ M_n(𝔽_p)^alt : dim ker A = j} / p^{n(n−1)/2}`. It vanishes unless `j ≡ n (mod 2)`. The parity-averaged limit law is `P_p(j | ∞) := lim_{n→∞} (1/2)(P_p(j | 2n) + P_p(j | 2n+1))`. For `p = 2` these are Smith's `P^Alt(j | n)` and `P^Alt(j | ∞)` (Smith I, Definition 1.4); `(P_2(j' | j))_{j,j'}` are the transition probabilities of the Markov chain `r_2 ≥ r_4 ≥ …` of `2^k-Selmer` ranks in Smith's theorem.

`p` prime `0 ≤ j ≤ n`

The finite law in `Suggested.lean` is `alternatingKernelLaw`. Prove its parity support, its full-nullity mass `p^(−n(n−1)/2)`, its normalization and the closed formula below. Define the parity-averaged limit and identify it with the Poonen–Rains law. The limit signature is `alternatingKernelLimit_eq_poonenRains`.

For the proof, Define the finite count over the finite set of alternating matrices (`Matrix (Fin n) (Fin n) (ZMod p)` with zero diagonal and transpose equal to the negative) and the kernel dimension via `Module.finrank` of `LinearMap.ker` of `mulVecLin`. Define the parity-averaged limit as a limit of real sequences; its existence and value are [alternating kernel law limit is poonen rains](#alternating-kernel-law-limit-is-poonen-rains).

*Needs:* [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices), `Module.finrank` (Mathlib).

([[24]](#ref-24), §1.1, Definition 1.4, pp. 3–4 (arXiv v2); [[25]](#ref-25), §2, Case 2.13, p. 9 (arXiv v2).)

**Checks.**

- `alternatingKernelLaw 2 0 2 = 1/2` and `alternatingKernelLaw 2 2 2 = 1/2`.
- `alternatingKernelLaw 2 2 4 = 35/64` and `alternatingKernelLaw 2 0 4 = 28/64`.
- `alternatingKernelLaw p 1 2 = 0`: an alternating `2 × 2` matrix never has a 1-dimensional kernel.
- `alternatingKernelLaw p 0 0 = 1`.
- `alternatingKernelLaw 2 1 3 = 7/8`, whereas a uniformly random `3 × 3` matrix over `𝔽₂` has a 1-dimensional kernel with probability `294/512 = 147/256`: the alternating constraint changes the law.
- `P_p(n | n) = p^{−n(n−1)/2}` (only the zero matrix).
- `P_2(0 | 2) = P_2(2 | 2) = 1/2; P_2(2 | 4) = 35/64`.
- `P_p(j | n) = 0` when `j ≢ n (mod 2)`.

<a id="alternating-kernel-law-formula"></a>

**Alternating kernel law formula.** For `n ≥ j ≥ 0` with `n ≡ j (mod 2): P_p(j | n) = [n j]_p · p^{(n−j)(n−j−1)/2} ∏_{i=1}^{(n−j)/2}(1 − p^{1−2i}) / p^{n(n−1)/2} = p^{−j(j−1)/2} ∏_{k=1}^{j} (1 − p^{−(n−j)−k})/(1 − p^{−k}) · ∏_{k=1}^{(n−j)/2} (1 − p^{1−2k})`. For `p = 2` this corrects the display in Smith II, Case 2.13, whose factor `1 − 2^{−n−j+k}` must read `1 − 2^{−n+j−k}`.

`p` prime `n ≥ j ≥ 0 n ≡ j (mod 2)`

For the proof, Count by kernels: for each `j`-dimensional subspace `K ⊆ 𝔽_p^n`, the alternating `A` with `ker A = K` correspond bijectively to nondegenerate alternating forms on `𝔽_p^n / K` (an alternating form vanishing on `K` descends; `ker A = K` exactly when the descended form is nondegenerate). There are `[n j]_p` subspaces `K` ([ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient)) and, for each, `#GL_{n−j}(𝔽_p)^alt = p^{(n−j)(n−j−1)/2}∏_{i=1}^{(n−j)/2}(1 − p^{1−2i})` forms ([count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices)). Divide by `p^{n(n−1)/2}` and rewrite `[n j]_p = p^{j(n−j)} ∏_{k=1}^{j}(1 − p^{−(n−j)−k})/(1 − p^{−k})`; the exponent `j(n−j) + (n−j)(n−j−1)/2 − n(n−1)/2` equals `−j(j−1)/2` (routine).

*Needs:* [alternating matrix kernel law](#alternating-matrix-kernel-law), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient), [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices).

([[25]](#ref-25), §2, Case 2.13, displayed formula for `P(j | n)`, p. 9 (arXiv v2); [[29]](#ref-29), §3.6, Lemma 3.6, p. 8.)

**Checks.**

- `P_2(2 | 2) = 1/2` (the printed Smith II display gives 7/8).
- `P_2(3 | 3) = 1/8` (only the zero matrix; printed display ≈ 0.303).
- `P_2(2 | 4) = 35/64` (printed display gives 155/256).

<a id="alternating-kernel-law-limit-is-poonen-rains"></a>

**Alternating kernel law limit is poonen rains.** `Distributions.alternatingKernelLimit_eq_poonenRains` states total-variation convergence of the parity-averaged laws. For every `j ≥ 0: lim_{n→∞, n ≡ j (mod 2)} P_p(j | n) = 2 a_j`, where `a_j = c_p ∏_{i=1}^{j} p/(p^{i} − 1)` is the Poonen–Rains weight. Consequently `P_p(j | ∞) = a_j`, and for `p = 2` Smith's starting law `P^Alt(j | ∞)` is the Poonen–Rains distribution `X_{Sel_2}`; the laws `(1/2)(P_p(· | 2n) + P_p(· | 2n+1))` converge to it in total variation.

`p` prime

For the proof, From [alternating kernel law formula](#alternating-kernel-law-formula), as `n → ∞` with `n ≡ j: ∏_{k=1}^{j}(1 − p^{−(n−j)−k}) → 1` and `∏_{k=1}^{(n−j)/2}(1 − p^{1−2k}) → ∏_{k≥1}(1 − p^{1−2k}) = 2c_p` ([poonen rains distribution](#poonen-rains-distribution), the alternate product for `c_p`). `p^{−j(j−1)/2}∏_{k=1}^{j}(1 − p^{−k})^{−1} = ∏_{k=1}^{j} p^{−(k−1)}/(1 − p^{−k}) = ∏_{k=1}^{j} p/(p^{k} − 1)`; so the limit is `2a_j`. For fixed `j` only one of `P_p(j | 2n)`, `P_p(j | 2n+1)` is nonzero, giving `P_p(j | ∞) = a_j`. Total variation: pointwise convergence and total mass `Σ a_j = 1` ([intersection law converges to poonen rains](#intersection-law-converges-to-poonen-rains)) give convergence in total variation (Scheffé).

*Needs:* [alternating kernel law formula](#alternating-kernel-law-formula), [poonen rains distribution](#poonen-rains-distribution), [intersection law converges to poonen rains](#intersection-law-converges-to-poonen-rains).

([[24]](#ref-24), §1.1, after Definition 1.4, p. 4 (arXiv v2); [[28]](#ref-28), §1.1, p. 1.)

**Checks.**

- `j = 0`, `p = 2`: `lim_{n even} P_2(0 | n) = ∏_{k≥1}(1 − 2^{1−2k}) ≈ 0.4194 = 2 a_0`.
- Smith I, Figure 1.1: the Markov chain starts at an even state with probability 1/2 and an odd state with probability 1/2.
- Along odd matrix sizes the nullity-zero mass is zero; the two size parities cannot be replaced by a single subsequence.

<a id="symplectic-finite-abelian-p-groups"></a>

**Symplectic finite abelian p groups.** A symplectic `p`-group is a finite abelian `p`-group `G` with a nondegenerate alternating bilinear pairing `[ , ] : G × G → ℚ_p/ℤ_p`; `Sp(G)` is the group of automorphisms preserving `[ , ]`. `G` admits such a pairing if and only if `G ≅ H × H` for a finite abelian `p`-group `H`, and any two symplectic structures on the same group are isomorphic; hence isomorphism classes of symplectic `p`-groups are the classes of groups `H × H`, indexed by partitions all of whose parts occur with even multiplicity ([ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups)), and `#Sp(G)` depends only on the class of `G`.

`p` prime `G` finite abelian `p`-group

The required API is:

- `IsSymplecticClass`: A class `⟨n, λ⟩` is symplectic iff every part of `λ` has even multiplicity `(G ≅ H × H)`.
- `symplecticAutCard`: `#Sp(G)` for the standard symplectic structure on the representative of a symplectic class.
- `isSymplecticClass_iff_exists_pairing`: A finite abelian `p`-group admits a nondegenerate alternating `ℚ_p/ℤ_p`-valued pairing iff its class is symplectic.
- `symplectic_pairing_unique`: Two nondegenerate alternating pairings on the same group are isomorphic.
- `symplecticAutCard_pos`: `#Sp(G) ≥ 1`.
- `symplecticAutCard_elementary`: `#Sp((ℤ/p)^{2k}) = p^{k²}∏_{i=1}^{k}(p^{2i} − 1)`.

For the proof, Define the pairing condition (bilinear into `ℚ_p/ℤ_p`, alternating `[x, x] = 0`, nondegenerate: the adjoint `G → Hom(G, ℚ_p/ℤ_p)` is bijective). Normal form: a nondegenerate alternating pairing on a finite abelian `p`-group has a symplectic basis `{e_i, f_i}` with `⟨e_i⟩ ≅ ⟨f_i⟩ ≅ ℤ/p^{a_i}` and `[e_i, f_i] = p^{−a_i}`; induct on the exponent by splitting off a hyperbolic pair generated by an element of maximal order and a partner of equal order (routine). Existence on `H × H`: the standard pairing `[(h, χ), (h', χ')] := χ'(h) − χ(h')` on `H × H^∨` with `H^∨ ≅ H`; uniqueness follows from the normal form.

*Needs:* [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups), `LinearMap.IsAlt` (Mathlib).

([[29]](#ref-29), §3.2, p. 6.)

**Checks.**

- `symplecticAutCard p` (the class of `(ℤ/p)²`) `= p(p² − 1)`.
- The class of `ℤ/p` is not symplectic.
- The trivial class is symplectic and `symplecticAutCard p trivial = 1`.
- `ℤ/p² × ℤ/p × ℤ/p` is not symplectic although its order `p⁴` is a square.
- `G = (ℤ/p)²: Sp(G) = SL_2(𝔽_p)`, of order `p(p² − 1)`.
- `G = ℤ/p` has no symplectic structure.
- `G = 0: Sp(G)` is trivial.

<a id="alternating-cokernel-law"></a>

**Alternating cokernel law.** For `n` even and a finite abelian `p`-group class `G`, `π_n(G)` is the probability that `coker(A) ≅ G` for `A` Haar-random in `M_n(ℤ_p)^alt`. It is computed at finite level: for any `e ≥ 1` with `p^{e−1}G = 0`, `π_n(G) = #{Ā ∈ M_n(ℤ/p^e)^alt : coker(Ā) ≅ G} / p^{e·n(n−1)/2}`, and this is independent of such e. (A cokernel `coker(A) ≅ ℤ_p^s ⊕ F` is isomorphic to `G` iff `s = 0` and `F ≅ G`, which is detected `mod p^e.`)

`p` prime `n` even `e ≥ 1` with `p^{e−1}G = 0`

The required API is:

- `alternatingCokernelLaw`: `π_n(G)` via the finite-level count modulo `p^e` with e one greater than the largest exponent `a` among the cyclic factors `ℤ/p^a` of `G` (take `e=1` for `G=0`).
- `alternatingCokernelLaw_eq_of_le`: The finite-level count is the same for every `e ≥ 1` with `p^{e−1}G = 0`.
- `alternatingCokernelLaw_trivial`: `π_n(0) = ∏_{i=1}^{n/2}(1 − p^{1−2i})`.
- `alternatingCokernelLaw_eq_zero_of_not_symplectic`: `π_n(G) = 0` if `G` is not symplectic.
- `sum_alternatingCokernelLaw`: `Σ_G π_n(G) = 1` (the singular locus has measure zero).
- `alternatingCokernelLaw_tendsto`: `π_n(G) → A_0(G)` ([bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit)).

For the proof, Define the finite count over alternating matrices with entries in `ZMod (p^e)` and the cokernel as the quotient of `(ℤ/p^e)^n` by the image of Ā, compared with the standard representative of `G`. Independence of e: reduction `M_n(ℤ/p^{e+1})^alt → M_n(ℤ/p^e)^alt` is surjective with fibres of size `p^{n(n−1)/2}`, and for `p^{e−1}G = 0` the condition `coker ≅ G` is detected `mod p^e` (a cyclic summand `ℤ/p^f`, `f ≥ e`, or a free summand would give an element of order `p^e` in the reduction).

*Needs:* [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups](../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups), [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices), `ZMod` (Mathlib).

([[29]](#ref-29), §1.4 and §3.7, pp. 4, 9.)

**Checks.**

- `alternatingCokernelLaw p 2 trivial = 1 − p^{−1}`.
- `alternatingCokernelLaw p n (class of ℤ/p) = 0`: cokernels of alternating matrices are symplectic.
- For `n = 0`, `alternatingCokernelLaw p 0 G = 1` if `G` is trivial and 0 otherwise.
- For `G = (ℤ/p)²`, the counts with `e = 2` and `e = 3` give the same value.
- `π_n(0) = #GL_n(𝔽_p)^alt / #M_n(𝔽_p)^alt (e = 1)`.
- `π_n(G) = 0` unless `G` is symplectic.

<a id="bklpr-alternating-cokernel-limit"></a>

**Bklpr alternating cokernel limit.** (a) For each symplectic `p`-group `G`, `lim_{n→∞, n even} π_n(G) = A_0(G) := #G/#Sp(G) · ∏_{i≥1}(1 − p^{1−2i})`, and `Σ_G A_0(G) = 1`. (b) For `r ≥ 0`, define `A_r(G) := (#G)^{1−r}/#Sp(G) · ∏_{i≥r+1}(1 − p^{1−2i})` for symplectic `G`; then `Σ_G A_r(G) = 1`, and `A_r` is the limit as `n → ∞` (`n − r` even) of the laws of `(coker A)_tors` for `A` drawn from the natural probability measure on alternating `n × n` matrices over `ℤ_p` of rank `n − r` (BKLPoonen–Rains Theorem 3.11).

`p` prime `G` a symplectic `p`-group

For the proof, (a) Fix `G` and `m = n − dim_{𝔽_p} G[p]`. Surjections `ℤ_p^n → G` pull back the pairing of `G` to alternating pairings on `ℤ_p^n` inducing `G`; `Sp(G)` acts freely on `Sur(ℤ_p^n, G)` with these pairings as orbits, so there are `#Sur(ℤ_p^n, G)/#Sp(G)` of them ([symplectic finite abelian p groups](#symplectic-finite-abelian-p-groups), [ArithmeticStatisticsPartIV: surjection count](../ArithmeticStatisticsPartIV/README.md#surjection-count)). The probability that the pairing of `A` equals a fixed one is `#GL_m(𝔽_p)^alt/#M_m(𝔽_p)^alt · (#G)^{1−n}` (BKLPR Corollaries `3.4–3.5: A ∈ D + D M_n(ℤ_p) D` with rank condition), so `π_n(G) = #Sur(ℤ_p^n, G)/#Sp(G) · #GL_m^alt/#M_m^alt · (#G)^{1−n}`; as `n → ∞`, `#Sur(ℤ_p^n, G)/(#G)^n → 1` and [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices) gives the limit. Total mass: `Σ_G π_n(G)=1` because the determinant polynomial is not identically zero on even alternating matrices, so its zero set has Haar measure zero. Let `c=∏_{i≥1}(1−p^{1−2i})>0`. Fatou and the established pointwise limit `c·#G/#Sp(G)` give `Σ_G #G/#Sp(G)≤1/c<∞`. The bound `π_n(G)≤#G/#Sp(G)` is now a summable domination, so dominated convergence yields `Σ_G A_0(G)=1`. (b) For `r ≥ 1` the measure on rank-`(n − r)` alternating matrices is the normalised canonical measure on the `ℤ_p`-points of that scheme (BKLPoonen–Rains Proposition 2.1, Lemma 3.13); its existence and the pushforward identity are the Oesterlé–Serre measure contract stated below. Given it, the proof integrates `|det|^r` (BKLPR Lemma 3.12) and repeats (a).

*Needs:* [general Oesterlé measure](#general-oesterle-measure), [alternating rank-stratum measure and pushforward](#alternating-stratum-measure), [alternating cokernel law](#alternating-cokernel-law), [symplectic finite abelian p groups](#symplectic-finite-abelian-p-groups), [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices), [ArithmeticStatisticsPartIV: surjection count](../ArithmeticStatisticsPartIV/README.md#surjection-count).

([[29]](#ref-29), §3.7, Theorem 3.9 and proof, pp. 9–10; [[29]](#ref-29), §3.8, Theorem 3.11, p. 11.)

**Checks.**

- `A_0(0) = ∏_{i≥1}(1 − p^{1−2i}) ≈ 0.4194` for `p = 2`.
- `A_1(0) = ∏_{i≥2}(1 − p^{1−2i})`.
- The `p`-rank marginal of `A_0` is the even-`n` limit of the kernel law `P_p(· | n)` (reduce A mod `p`).

### 5.7 p-adic isotropic intersections

<a id="bklpr-model"></a>

**Bklpr model.** For a prime `p`, the BKLPR distribution `Q` is the probability measure on pairs `(r, T)`, `r ∈ ℤ_{≥0}` and `T` a symplectic `p`-group class, given by `Q(r, T) := (1/2) A_r(T)` for `r ∈ {0, 1}` and `Q(r, T) := 0` for `r ≥ 2` (`A_r` from [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit)). A pair `(r, T)` stands for the split short exact sequence `0 → (ℚ_p/ℤ_p)^r → (ℚ_p/ℤ_p)^r ⊕ T → T → 0` of co-finite type `ℤ_p`-modules, which models `0 → E(k) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E) → Ш(E)[p^∞] → 0`; every isomorphism class of such split sequences with finite cokernel arises from exactly one pair. BKLPR define `Q` as the limit of the laws `Q_{2n}` of intersections of random maximal isotropic `ℤ_p`-submodules; their proof of Theorem 1.2 identifies `Q_{2n}` with this mixture ([bklpr random isotropic intersection law](#bklpr-random-isotropic-intersection-law)).

`p` prime

The required API is:

- `bklprModel`: The probability mass function on `ℕ × FinAbPGroupClass` with weights `(1/2)A_r(T)` for `r ≤ 1`.
- `bklprModel_apply`: `bklprModel p (r, T) =` (1/2)·`bklprShaLaw p r T` if `r ≤ 1`, else 0.
- `bklprModel_rank_marginal`: The marginal law of `r` is uniform on `{0, 1}`.
- `bklprModel_sha_conditional`: Conditionally on `r ∈ {0, 1}`, `T` has law `A_r`.
- `bklprModel_selmer_p_rank`: The law of `r + dim T[p]` under `bklprModel` is `poonenRainsDistribution p`.
- `bklprShaLaw`: `A_r(T) = (#T)^{1−r}/#Sp(T) ∏_{i≥r+1}(1 − p^{1−2i})` on symplectic classes, 0 otherwise.

For the proof, Define `Q` on `ℕ ×` (symplectic classes) by the displayed weights; total mass `(1/2)(Σ A_0 + Σ A_1) = 1` by [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit). Derived laws: the modelled Selmer group `S = (ℚ_p/ℤ_p)^r ⊕ T`, its `p`-torsion `rank r + dim T[p]`, and `S[p^e]`.

*Needs:* [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit), [symplectic finite abelian p groups](#symplectic-finite-abelian-p-groups).

([[29]](#ref-29), §5.4, proof of Theorem 1.2, p. 19; [[29]](#ref-29), §1.3, Conjecture 1.3, p. 2.)

**Checks.**

- `bklprModel p (2, T) = 0` for every `T`: the model gives `rank ≥ 2` probability zero.
- `bklprModel p (0, trivial) = (1/2)∏_{i≥1}(1 − p^{1−2i})`.
- `bklprModel p (0, class of ℤ/p) = 0` since `ℤ/p` is not symplectic.
- `Σ_{(r,T)} bklprModel p (r, T) = 1`.
- `Q(r = 0) = Q(r = 1) = 1/2` and `Q(r ≥ 2) = 0`.
- The law of `dim_{𝔽_p} S[p] = r + dim T[p]` under `Q` is the Poonen–Rains distribution (BKLPR §5.5, Poonen–Rains Theorem 5.2 identities).

<a id="bklpr-random-isotropic-intersection-law"></a>

**Bklpr random isotropic intersection law.** Let `n≥1` and `V = ℤ_p^{2n}` with the hyperbolic form `Q(x, y) = Σ x_i y_i`, `OGr_n(ℤ_p)` its maximal isotropic direct summands with the canonical probability measure, and `Z`, `W ∈ OGr_n(ℤ_p)` independent random. Put `R := (Z ∩ W) ⊗ ℚ_p/ℤ_p`, `S := (Z ⊗ ℚ_p/ℤ_p) ∩ (W ⊗ ℚ_p/ℤ_p)` and `T := S/R`. Then: `(i) R ≅ (ℚ_p/ℤ_p)^r` with `r = rk(Z ∩ W) ∈ {0, 1}`, each with probability 1/2 (Proposition 5.6); (ii) `T` is finite and the sequence splits (Corollaries 5.2–5.3); (iii) the law `Q_{2n}` of `(r, T)` converges as `n → ∞` to the BKLPR model `Q`, and the law `T_{2n,r}` of `T` given `r` converges to `A_r` (Theorems 1.2, 1.6(a)–(b), 1.10(b)); (iv) `S[q] ≅ Z/qZ ∩ W/qW` for `q` a power of `p` (Proposition 5.4).

`p` prime `Z`, `W` independent and distributed by the canonical measure on `OGr_n(ℤ_p) n ≥ 1`; when `n=0` the only pair is `Z=W=0` and the rank law is concentrated at 0.

For the proof, Canonical measure: `OGr_n` is a smooth projective `ℤ`-scheme of relative dimension `n(n − 1)/2` with two isomorphic components distinguished by parity (BKLPoonen–Rains Propositions 4.4–4.5); the measure on `OGr_n(ℤ_p)` is the normalised limit of counts `mod p^e` (Proposition 2.1). This input is the integral orthogonal geometry and canonical-measure target below. (i): the Schubert loci `S_{n,r}` with `r ≥ 2` have smaller dimension (Proposition 4.9) hence measure zero; the parity of `rk(Z ∩ W)` is equidistributed by the isomorphism of the two components. (ii),(iv): divisibility and co-finite type arguments (BKLPoonen–Rains Proposition 5.1, Corollaries 5.2–5.3, Proposition 5.4); routine module theory over `ℤ_p`. (iii): represent `Z = W_1ᵀ ⊕ graph(A)` for a random decomposition and a random alternating `A` of corank `r`, so `T ≅ (coker A)_tors`; the size `n − m` of `A` tends to `∞` in probability ([alternating matrix kernel law](#alternating-matrix-kernel-law) and BKLPR Lemma 3.7), so `T_{2n,r} → A_r` by [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit); combine with (i).

*Needs:* [bklpr model](#bklpr-model), [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit), [alternating matrix kernel law](#alternating-matrix-kernel-law), [maximal isotropic subspaces of a quadratic space](#maximal-isotropic-subspaces-of-a-quadratic-space).

([[29]](#ref-29), §1.2, Theorem 1.2, p. 2; [[29]](#ref-29), §5.3, Proposition 5.6, p. 17.)

**Checks.**

- `Q_{2n}(r ≥ 2) = 0` for every `n`.
- For `q = p`, (iv) and Poonen–Rains Proposition 2.6 recover the Poonen–Rains Selmer model.

<a id="maximal-isotropic-direct-summands-modulo-prime-powers"></a>

**Maximal isotropic direct summands modulo prime powers.** For `q=p^e`, `e≥1` and `n≥0`, identify the hyperbolic quadratic direct summands of `(ℤ/q)^{2n}` with `OGr_n(ℤ/q)`. Apply [ogr prime power count](#refinement-ogr-prime-power-count) to obtain `q^(n(n−1)/2)∏_{i=1}^n(1+p^(i−n))` points. This is the direct-summand adapter for the integral count.

For the proof, Match the universal locally direct-summand subbundle and its quadratic vanishing equations with the module definition; use the count owned in §5.29.

*Needs:* [ogr prime power count](#refinement-ogr-prime-power-count).

([[29]](#ref-29), §4.3, Lemma 4.8, p. 14.)

**Checks.**

- At `n=0` the unique zero summand gives count 1.
- At `n=1` the count is 2 at every prime-power level.
- At `n=2,p=2,e=2` the count is 12; non-direct-summand subgroups are excluded.

<a id="bklpr-injection-moments"></a>

**Bklpr injection moments.** `Distributions.bklpr_injection_moments` states the limiting moment, using the actual quadratic-isotropic direct summands `Distributions.hyperbolicSummands` and their uniform injection average `Distributions.isotropicInjectionAverage`. For `q = p^e` and `m ≥ 0`, let `I_m(G)` be the number of injective homomorphisms `(ℤ/qℤ)^m → G`. As `Z`, `W` range over `OGr_n(ℤ/qℤ)` (uniformly and independently), the average of `I_m(Z ∩ W)`, for `m≤n`, equals `q^{m(m+1)/2} ∏_{i=0}^{m−1}(1 − p^{i−n}) ∏_{i=n−m}^{n−1}(1 + p^{−i})^{−1}`, which tends to `q^{m(m+1)/2}` as `n → ∞`. If `m>n` the injection count is zero. The reciprocal on the last product corrects the displayed simplification in the cited preprint.

`q = p^e`, `e ≥ 1 m ≥ 0`

For the proof, For `m>n` there are no injections. For `m≤n` fix `W` using orthogonal transitivity. A map `h:(ℤ/p^e)^m→W≅(ℤ/p^e)^n` is injective iff its reduction modulo `p` has full column rank; the Smith normal form proves this criterion. Consequently `im(h)` is a direct summand, and the number of injections is `q^{nm}∏_{i=0}^{m−1}(1−p^{i−n})`, involving `p` rather than `q` in the factors. The `Z ⊇ im(h)` correspond to maximal isotropic direct summands of `im(h)^⊥/im(h)`, a hyperbolic module of rank `2n − 2m` ([isotropic reduction map](#isotropic-reduction-map), over `ℤ/q`); their number is `#OGr_{n−m}(ℤ/q)` ([maximal isotropic direct summands modulo prime powers](#maximal-isotropic-direct-summands-modulo-prime-powers)). The ratio of the two Grassmannian counts is `q^{−nm+m(m+1)/2}/∏_{i=n−m}^{n−1}(1+p^{−i})`. Multiply by the injection count to obtain the displayed corrected formula. For fixed `m`, both finite products tend to 1 as `n→∞`. The finite-field isotropic-reduction node supplies motivation; over `ℤ/p^e` use the direct-summand orthogonal quotient and a hyperbolic basis, as in the lifting charts of maximal-isotropic-direct-summands-modulo-prime-powers.

*Needs:* [maximal isotropic direct summands modulo prime powers](#maximal-isotropic-direct-summands-modulo-prime-powers), [isotropic reduction map](#isotropic-reduction-map).

([[29]](#ref-29), §5.5, Theorem 5.10 and proof, p. 20.)

**Checks.**

- `q = p`, `m = 1`: limit `p`, `i`.e. the average of `#(Z ∩ W) − 1` is `p`, so the average of `#Sel_p` is `p + 1` (Poonen–Rains Proposition 2.22).
- `q = p`, general `m`: equivalent to Poonen–Rains Proposition 2.22(a) (BKLPR Remark 5.13).
- `n=m=1`: for fixed `W`, half the two isotropic lines equal `W`, so the average is `φ(p^e)/2 = p^e(1−1/p)/2`. This rules out multiplying by the final factor 2. For `e>1`, injections from `(ℤ/p^e)^m` into an arbitrary finite module are not determined by its cardinality; no such polynomial claim is used.

### 5.8 Selmer distribution conjectures

<a id="poonen-rains-selmer-conjecture"></a>

**Poonen rains selmer conjecture.** For a prime `p`, the Poonen–Rains conjecture over `ℚ` is the proposition `PR(p)`: over the family of elliptic curves `E_{A,B}` : `y² = x³ + Ax + B` (`A, B ∈ ℤ`, `4A³ + 27B² ≠ 0`, no prime `ℓ` with `ℓ⁴ | A` and `ℓ⁶ | B`) ordered by the naive height `H(E_{A,B}) = max(4|A|³, 27B²)` (the family and height of Layer 0), (a) for every `d ≥ 0` the set `{E : dim_{𝔽_p} Sel_p(E) = d}` has density `a_d` (the Poonen–Rains weight), and (`c`) for every `m ≥ 1` the `m`-th moment of `#Sel_p(E)` exists and equals `∏_{i=1}^{m}(p^{i} + 1)` (moments as in [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family)); (b) is (`c`) with `m = 1`, average `p + 1`. It is a conjecture: this node defines the proposition so that theorems can take it as a hypothesis and proved cases can be compared with it. `Sel_p(E)` is the `p`-Selmer group of Tau Ceti EllipticCurves Layer 7. Poonen–Rains state it over any global field with an unspecified height on the coefficients; the definition is pinned over `ℚ` with the height above.

`p` prime

The required API is:

- `PoonenRainsSelmerConjecture`: The proposition `PR(p) = (∀ d, density of dim Sel_p = d is a_d) ∧ (∀ m ≥ 1, m-th moment of #Sel_p is ∏(p^i + 1))`.
- `PoonenRainsSelmerConjecture.density`: `PR(p)` ⇒ for each `d`, `density{E : dim Sel_p E = d} = a_d`.
- `PoonenRainsSelmerConjecture.moment`: `PR(p)` ⇒ for each `m ≥ 1`, `M_m(#Sel_p) = ∏_{i=1}^{m}(p^i + 1)`.
- `PoonenRainsSelmerConjecture.average`: `PR(p)` ⇒ the average of `#Sel_p` is `p + 1`.
- `poonenRainsSelmerConjecture_of_bklpr`: The BKLPR conjecture for `p` implies clause (a) of `PR(p)` ([bklpr conjecture implies rank and selmer laws](#bklpr-conjecture-implies-rank-and-selmer-laws)).

For the proof, Compose: the family carrier and height (Layer 0, EllipticCurves Layer 8 minimal short models), `Sel_p(E)` and its `𝔽_p`-dimension (EllipticCurves Layer 7), the densities and moments ([ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family)), and the weights ([poonen rains distribution](#poonen-rains-distribution)). The proposition is the conjunction of the density statement for each `d` and the moment statement for each `m`.

*Needs:* [ArithmeticStatisticsPartI: invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [ArithmeticStatisticsPartI: arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [poonen rains distribution](#poonen-rains-distribution), [ArithmeticStatisticsPartI: elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height).

([[28]](#ref-28), §1.2, Conjecture 1.1, p. 2.)

**Checks.**

- `PR(2)` implies that the average of `#Sel_2` is 3, the value proved by Bhargava–Shankar ([ArithmeticStatisticsPartVI: average size of the 2 selmer group is three](../ArithmeticStatisticsPartVI/README.md#average-size-of-the-2-selmer-group-is-three)).
- `PR(2)` predicts the second moment `15 = (2 + 1)(4 + 1)`.
- `PR(p)` is a statement about `dim Sel_p`, not about `rank E(ℚ)`: it gives positive density to `dim Sel_p = 2`, which is not a rank prediction.
- The `m=0` moment is 1 for every eventually nonempty finite-cutoff family, including the full elliptic-curve family, so the moment clause starts at `m=1`.
- Proved instances of clause (`c`) with `m = 1: p = 2`, 3, 5 (Bhargava–Shankar); with `m = 2`, `p = 2` the upper bound 15 (Bhargava–Shankar–Swaminathan) but not the equality.
- Clause (a) is left conjectural for the full family in the cited sources; it is not a consequence of the model calculation.

<a id="bhargava-shankar-selmer-average-conjecture"></a>

**Bhargava shankar selmer average conjecture.** For an integer `n ≥ 1`, `BS(n)` is the proposition: over the family of elliptic curves `E_{A,B}/ℚ` ordered by naive height (Layer 0), the average of `#Sel_n(E)` exists and equals `σ(n) = Σ_{d | n} d`. It is Bhargava–Shankar's Conjecture 4, the `n`-analogue of Poonen–Rains Conjecture 1.4(b); proved for `n ≤ 5`.

`n ≥ 1`

The required API is:

- `SelmerAverageConjecture`: `BS(n)`: the average of `#Sel_n` over `E_{A,B}` ordered by height exists and equals `σ(n)`.
- `SelmerAverageConjecture.average`: `BS(n) ⇒ M_1(#Sel_n) = σ(n)`.
- `selmerAverageConjecture_one`: `BS(1)` holds.
- `selmerAverageConjecture_prime_iff`: For `n = p` prime, `BS(p)` is clause (b) of the Poonen–Rains conjecture `(p + 1 = σ(p))`.

For the proof, Compose the family and height (Layer 0), `Sel_n(E)` (EllipticCurves Layer 7) and the first moment ([ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family)).

*Needs:* [ArithmeticStatisticsPartI: invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [ArithmeticStatisticsPartI: elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height).

([[31]](#ref-31), §1, Conjecture 4, p. 2 (arXiv v1).)

**Checks.**

- `BS(4)` predicts the average `7 = 1 + 2 + 4` (proved by Bhargava–Shankar).
- `BS(6)` predicts the average `12 = σ(6)`.
- `BS(1)` is true since `Sel_1(E) = 0` has one element.
- `BS(4)` is not implied by `BS(2)`: the average of `#Sel_4` is not the second moment of `#Sel_2 (7 ≠ 15)`.
- `BS(1)` holds trivially `(Sel_1 = 0, σ(1) = 1)`.
- `BS(2)`, `BS(3)`, `BS(4)`, `BS(5)` are theorems (Layer 4 and Layer 5 nodes).

<a id="selmer-average-conjecture-implies-rank-at-most-one"></a>

**Selmer average conjecture implies rank at most one.** Assume `BS(n)` ([bhargava shankar selmer average conjecture](#bhargava-shankar-selmer-average-conjecture)) for every `n` in an infinite set `N` of positive integers. Then the set of `E_{A,B}/ℚ` with `rank E(ℚ) ≥ 2` has density zero.

`BS(n)` for all `n` in an infinite set `N`

For the proof, If `rank E(ℚ) ≥ 2` then `(ℤ/n)² ↪ E(ℚ)/nE(ℚ) ↪ Sel_n(E)`, so `#Sel_n(E) ≥ n²` (Kummer injection of EllipticCurves Layer 7 and Mordell–Weil structure, EllipticCurves Layer 6). Markov ([ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), API `familyUpperDensity_le_upperMoment_div`): `μ⁺(rank ≥ 2) ≤ σ(n)/n²`. `σ(n)/n² → 0` along `N` since `σ(n) = O(n log log n)` (routine: `σ(n)/n ≤ Σ_{d|n} 1/d ≤ 1 + log n` suffices).

*Needs:* [bhargava shankar selmer average conjecture](#bhargava-shankar-selmer-average-conjecture), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[31]](#ref-31), §1, Proposition 5, p. 2 (arXiv v1).)

**Checks.**

- With `N = {2, 3, 4, 5}` alone one only gets `μ⁺(rank ≥ 2) ≤ min(3/4, 4/9, 7/16, 6/25) = 6/25`.

<a id="bklpr-selmer-conjecture"></a>

**Bklpr selmer conjecture.** For a prime `p`, `BKLPR(p)` is the proposition: over the family `E_{A,B}/ℚ` ordered by naive height (Layer 0), for every `r ≥ 0` and every finite abelian `p`-group class `G`, the set `{E : rank E(ℚ) = r and Ш(E)[p^∞] ≅ G}` has density `Q(r, G)` ([bklpr model](#bklpr-model)). Since `E(ℚ) ⊗ ℚ_p/ℤ_p` is divisible the sequence `0 → E(ℚ) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E) → Ш(E)[p^∞] → 0` splits, and its isomorphism class is determined by `(r, Ш[p^∞])` when `Ш[p^∞]` is finite; so this is BKLPR Conjecture 1.3 for `k = ℚ`. It is a conjecture, defined as a proposition.

`p` prime

The required API is:

- `BKLPRSelmerConjecture`: `BKLPR(p)`: `∀ r G`, `density{E : rank E(ℚ) = r ∧ Ш(E)[p^∞] ≅ G} = Q(r, G)`.
- `BKLPRSelmerConjecture.density`: The density statement for a given `(r, G)`.
- `BKLPRShaConjecture`: BKLPR Conjecture 1.7 over `ℚ`: for `r` with infinitely many rank-`r` curves, the density of `Ш[p^∞] ≅ G` among rank-`r` curves is `A_r(G)`.
- `bklprSelmerConjecture_rank`: `BKLPR(p)` ⇒ `density{rank 0} = density{rank 1} = 1/2` ([bklpr conjecture implies rank and selmer laws](#bklpr-conjecture-implies-rank-and-selmer-laws)).

For the proof, Compose the family (Layer 0), `rank E(ℚ)` (EllipticCurves Layer 6), `Ш(E)[p^∞]` and `Sel_{p^∞}` (EllipticCurves Layer 7 and SelmerIwasawaCohomology §§2.10–2.12a), densities ([ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family)) and `Q`. Equivalence with the sequence formulation: a split sequence `0 → (ℚ_p/ℤ_p)^r → S → T → 0` with `T` finite is determined up to isomorphism by `(r, T)` (routine).

*Needs:* [bklpr model](#bklpr-model), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [ArithmeticStatisticsPartI: arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), SelmerIwasawaCohomology §§2.10–2.12a.

([[29]](#ref-29), §1.3, Conjecture 1.3, p. 2.)

**Checks.**

- `BKLPR(p)` implies `density{E : rank E(ℚ) ≥ 2} = 0`.
- `BKLPR(p)` gives density 0 to `Ш[p^∞] ≅ ℤ/p` (not symplectic), consistent with Cassels–Tate.
- `BKLPR(p)` for two primes `p`, `p'` predicts the same rank densities 1/2, 1/2.
- `BKLPR(p)` predicts `density{rank 0, Ш[p^∞] = 0} = (1/2)∏_{i≥1}(1 − p^{1−2i})`.
- `BKLPR(p)` predicts density `1/2 · ∏_{i≥1}(1 − p^{1−2i})` for rank 0 with `Ш[p^∞] = 0`.

<a id="bklpr-conjecture-implies-rank-and-selmer-laws"></a>

**Bklpr conjecture implies rank and selmer laws.** Assume `BKLPR(p)` ([bklpr selmer conjecture](#bklpr-selmer-conjecture)) for a prime `p`. Then over `E_{A,B}/ℚ` ordered by height: (i) the sets of curves of rank 0 and of rank 1 each have density 1/2, and `rank ≥ 2` has density `0`; (ii) `Ш(E)[p^∞]` is finite for a density-one set of `E`; (iii) for every `d`, the set `{E : dim_{𝔽_p} Sel_p(E) = d}` has density `a_d`, `i`.e. clause (a) of `PR(p)` holds.

`BKLPR(p)`

For the proof, (i),(ii): sum the densities `Q(r, G)` over `G` (countably many classes; `Σ_G Q(r, G) = 1/2` for `r ≤ 1`, 0 for `r ≥ 2`) — the density of a countable union needs a tightness step: the densities of the finitely many-`G` events are lower densities, and `1 − Σ_{r ≤ 1, G} Q(r, G) = 0` bounds the upper density of the complement (routine with [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), API `familyLowerDensity_compl`). (iii): off the density-zero set of curves with `E(ℚ)[p] ≠ 0` ([ArithmeticStatisticsPartVI: rational p torsion has density zero](../ArithmeticStatisticsPartVI/README.md#rational-p-torsion-has-density-zero)), `Sel_p(E) ≅ Sel_{p^∞}(E)[p]` (BKLPoonen–Rains Proposition 5.9(`c`); Kummer sequences of EllipticCurves Layer 7), so `dim Sel_p(E) = r + dim Ш[p^∞][p]`. Under `Q`, `r + dim T[p]` has the Poonen–Rains law ([bklpr model](#bklpr-model), API `bklprModel_selmer_p_rank`; for `r = 0` from the kernel law of alternating matrices, [alternating kernel law limit is poonen rains](#alternating-kernel-law-limit-is-poonen-rains), and for `r = 1` from the identity `a_{2n+1} = (1/2)Prob(X_{Ш[p],1} = 2n)` of [delaunay compatibility of the selmer model](#delaunay-compatibility-of-the-selmer-model) together with the equality of the `p`-rank marginal of `A_1` with Delaunay's `X_{Ш[p],1}` (the finite alternating-matrix rank marginal)). Sum the densities over the classes with given `r + dim G[p]`, as in the first step.

*Needs:* [bklpr selmer conjecture](#bklpr-selmer-conjecture), [bklpr model](#bklpr-model), [ArithmeticStatisticsPartVI: rational p torsion has density zero](../ArithmeticStatisticsPartVI/README.md#rational-p-torsion-has-density-zero), [alternating kernel law limit is poonen rains](#alternating-kernel-law-limit-is-poonen-rains), [delaunay compatibility of the selmer model](#delaunay-compatibility-of-the-selmer-model), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [poonen rains selmer conjecture](#poonen-rains-selmer-conjecture).

([[29]](#ref-29), §1.3, list after Remark 1.5, p. 3; [[29]](#ref-29), §5.5, Proposition 5.9, p. 19.)

**Checks.**

- The conclusion (i) is Goldfeld–Katz–Sarnak's minimalist prediction; it follows from `BKLPR(p)` for a single `p`.

### 5.9 Twist laws and corank consequences

<a id="full-two-torsion-descent-data"></a>

**Full two-torsion descent data.** Fix `E:y²=∏_{i=1}^3(x−c_i)` over `ℚ` with distinct rational `c_i` and no rational cyclic subgroup of order four. Let `S` contain 2, infinity and all bad primes, and let `D` be divisible by 8 and every finite prime in `S`. Construct the full two-descent identification of `Sel₂(E_b)` with `U_b∩W_b` in the product of local squareclass triples of product one, for squarefree `b` prime to `D`. Use the Hilbert-symbol symplectic pairing. Give bases and their pairing entries in terms of signs, local data at `S`, classes of the prime factors modulo `D`, and the pairwise Legendre symbols subject to quadratic reciprocity. Retain the two-dimensional rational 2-torsion subspace and define the reduced dimension `r_b=dim Sel₂(E_b)−2`.

For the proof, Apply the supplied elliptic Kummer/descent construction, evaluate the local images at primes dividing `2D` and at the new prime factors, and compute the Hilbert symbols. The local data at infinity include the sign of `b`; negative twists and twists by divisors of `D` have their own fixed local data. Prove `|U∩W|=|V|^(−1/2)Σ_(u,w)(−1)^⟨u,w⟩` with these explicit bases.

*Needs:* EllipticCurves Layers 5–7, ClassFieldTheory (Hilbert symbols and reciprocity), ArithmeticGaloisDuality (local Kummer pairings), Mathlib finite linear algebra and quadratic reciprocity.

(Kane [[34]](#ref-34), §1 and §4, pp. 1–3, 18–21; Swinnerton–Dyer, [*The effect of twisting on the 2-Selmer group*](https://doi.org/10.1017/S0305004108001588), §§2–4, pp. 514–521.)

**Checks.**

- Every twist retains the rational `E[2]`, so the full dimension is at least two and `#Sel₂/4=2^r_b`.
- A negative twist changes the real local condition; deleting the sign slot does not give the same descent matrix.
- At an odd prime dividing `b` the local Kummer image has the two generators displayed by Kane in §4; replacing its Hilbert symbols by independent ordered Legendre symbols violates quadratic reciprocity.

<a id="swinnerton-dyer-transition"></a>

**Swinnerton–Dyer transition and stationary limit.** For the preceding descent data with fixed local squareclasses at `S`, construct the auxiliary partial-descent dimensions and prove the transition probabilities `P(i,i+2)=2^(−2i−1)`, `P(i,i)=3·2^(−i)−5·2^(−2i−1)` and `P(i,i−2)=1−3·2^(−i)+2^(1−2i)`, with other transitions zero. The distributional recursion has total variation error `O((15/16)^n)` before the terminal step, where `n` is the number of exposed prime factors. Prove irreducibility, aperiodicity, positive recurrence and convergence on each parity class, and carry the terminal rational-torsion correction through to the actual Selmer data. For fixed local parity `ε`, the full dimension `d` has limiting data frequency `2a_(d−2)` when `d≡ε mod2` and zero otherwise; averaging equally over the two parities gives `a_(d−2)`.

For the proof, Add one prime to the explicit descent matrix, bound the exceptional dependencies of its new row and column, and compute the three possible dimension jumps. Use detailed balance for the conditional Poonen–Rains weights and the summable recursion error; prove the terminal comparison separately. These are data-space limits as the number of prime factors increases, before any arithmetic height averaging.

*Needs:* [full two-torsion descent data](#full-two-torsion-descent-data), [poonen rains distribution](#poonen-rains-distribution), [poonen rains parity](#poonen-rains-parity); finite/countable Markov-chain convergence and its perturbation argument are included in this target.

(Swinnerton–Dyer, *The effect of twisting on the 2-Selmer group*, Theorem 1 and §§5–7, especially (20)–(21), pp. 514, 521–526; Kane [[34]](#ref-34), Theorem 2, p. 2.)

**Checks.**

- At auxiliary state `i=0`, the probabilities of states 0 and 2 are each 1/2 and the negative-state probability is zero.
- At `i=1`, the probabilities of states 1 and 3 are 7/8 and 1/8, with no transition to −1.
- Each transition preserves parity. A single fixed local parity cannot have the unconditional half-even/half-odd stationary law.

<a id="kane-prime-character-estimates"></a>

**Kane prime-tuple character estimates and arithmetic moments.** Fix `D` with `4|D`, `log log N>1` and `(log log N)/2<n<2log log N`. Put `ε(p)=(p−1)/2 mod2`. Let `S_(N,n,D)` be the ordered tuples of distinct primes of product at most `N` and prime to `D`. For quadratic `χ_i` of modulus dividing `D` and symmetric zero-diagonal binary arrays `d_ij,e_ij`, bound the `1/n!`-normalized sum of `∏χ_i(p_i)∏_(i<j)(−1)^(ε(p_i)ε(p_j)d_ij)(p_i/p_j)^e_ij` by `O_(c,D)(N c^m)` for every fixed `c>0` when the number `m` of active indices is positive. An index is active if some incident `e_ij=1`, or its character has conductor not dividing four, or it has conductor four with every incident `d_ij=0`. Also prove Kane Proposition 10's residue-data equidistribution, uniformly for `‖f‖∞≤1`, with error `O_D(N log log log N/log log N)`. Constants are independent of `n`, the arrays and the characters in this range.

For the proof, Use AnalyticNumberTheoryPartII §5.29 only for its quadratic large-sieve inequality. Supply the prime-supported bilinear reductions, the one-character prime-sum estimates, and Kane's recursive removal of active indices here. Retain the exceptional real character: in Proposition 11 use the zero parameter `β`, cutoff `B=max(exp((C+2)β log log N), exp(K(C+2)²(log D)²(log log(DN))²), n(log N)^(C+2))` and hypothesis `B^n<√N`. In the variable-modulus recursion isolate the worst exceptional modulus and control the second-worst zero as in §§3.2–3.3; no effective uniform zero-free constant is assumed. Prove the Hardy–Ramanujan tail `#{b≤N:|ω(b)−log log N|>(log log N)^(3/4)}≪N exp(−c√(log log N))`. On the central window, combine the estimates with the descent expansion and stationary limit to obtain all moments of `2^r_b` tending to `∏_{i=1}^k(2^i+1)` and parity expectation tending to zero. The outside-window count is negligible for bounded dimension indicators; no unbounded-moment transfer across that tail is inferred from its density alone.

*Needs:* [full two-torsion descent data](#full-two-torsion-descent-data), [swinnerton–dyer transition and stationary limit](#swinnerton-dyer-transition), [AnalyticNumberTheoryPartII §5.29](../AnalyticNumberTheoryPartII/README.md#s5-29), AnalyticNumberTheoryPartI (prime sums and real-character zero estimates), [poonen rains moments](#poonen-rains-moments).

(Kane [[34]](#ref-34), Corollary 8, Propositions 9–11, Lemmas 12–17 and Proposition 18, pp. 5–18, §§3–4.)

**Checks.**

- A tuple of `n` distinct primes occurs `n!` times; omitting the normalizing factor changes the moment denominator.
- If every character and symbol is trivial, `m=0` and the sum is the full tuple count; the positive-`m` cancellation bound is inapplicable.
- The central window eventually lies inside `(log log N)/2<n<2log log N`; a fixed-`n` estimate alone does not cover it. A possible exceptional character remains in the cutoff and cannot be discarded.

<a id="parity-sensitive-twist-moment-determinacy"></a>

**Parity-sensitive twist moment determinacy.** The signature is `Distributions.parity_sensitive_twist_moment_determinacy`: let `ν_N(r)` be probability laws on nonnegative reduced dimensions, with all moments summable and uniformly bounded, `sup_N Σ_r ν_N(r)2^(kr)≤R_k<∞` for each integer `k≥0`. Assume these moments converge to `M_k=∏_{i=1}^k(2^i+1)` for every `k`, and `Σ_r(−1)^rν_N(r)→0`. Then every dimension frequency converges to the Poonen–Rains weight `a_r`. This is the recovery theorem for the central-window twist laws just constructed.

For the proof, Bound the weighted tail after dimension `L` by `R_(k+1)2^(−L)`; subsequential limits retain the moments and parity. Their generating functions are entire, and the limiting coefficient bound is `O(2^(−r(r−1)/2))`, obtained by optimizing `ν(r)≤M_k2^(−kr)`. Prove Kane's entire-function uniqueness argument with values at `−1,1,2,4,…`, then use subsequence compactness to recover every coefficient. The scalar exponential-moment criterion for `#Sel₂` is not an input.

*Needs:* [kane prime-tuple character estimates and arithmetic moments](#kane-prime-character-estimates), [poonen rains moments](#poonen-rains-moments), [poonen rains parity](#poonen-rains-parity), Mathlib dominated convergence and complex Jensen formula; the indicated generating-function uniqueness argument is part of this target.

(Kane [[34]](#ref-34), §4, Lemmas 19–20 and proof of Theorem 3, pp. 24–27.)

**Checks.**

- The Poonen–Rains law conditioned on even dimensions and that conditioned on odd dimensions have the same positive cardinality moments; the parity expectations +1 and −1 distinguish them.
- A mixture with even weight `t` has parity expectation `2t−1`; the zero-parity condition selects `t=1/2`.
- The `(k+1)`-st uniform bound controls the `k`-th weighted tail; convergence of bounded indicators alone supplies no such moment-tail bound.


<a id="two-selmer-distribution-in-full-two-torsion-twist-families"></a>

**Two selmer distribution in full two torsion twist families.** `two_selmer_twist_distribution` states the signed and positive integer limits using `twistTwoSelmerCard`, the cardinality of Tau Ceti’s native two-Selmer group for the twist at every finite place and the real place. Its twist model is `W.quadraticTwistOf 0 (−b)`, whose parameter `4b` has the same squareclass as `b`. Let `E` : `y² = (x − c_1)(x − c_2)(x − c_3)` with `c_i ∈ ℚ` distinct and none of `(c_i − c_j)(c_i − c_k)` a rational square (equivalently `E(ℚ)[2] = E[2]` and `E` has no `ℚ`-rational cyclic subgroup of order 4), and for `b ∈ ℤ \ {0}` let `E_b` : `y² = (x − bc_1)(x − bc_2)(x − bc_3)` be the quadratic twist by `ℚ(√b)`. Then for every `d ≥ 0`, `lim_{N→∞} #{b ∈ ℤ : 0 < |b| ≤ N, dim_{𝔽₂} Sel_2(E_b) = d + 2}/(2N) = a_d`, the Poonen–Rains weight at `p = 2` ([poonen rains distribution](#poonen-rains-distribution)); the same holds among positive `b`, and among squarefree `b` prime to any fixed `D` divisible by 8 and the bad primes (relative density). For `E` : `y² = x³ − x` this is Heath-Brown's theorem.

`c_1`, `c_2`, `c_3 ∈ ℚ` distinct `(c_i − c_j)(c_i − c_k) ∉ ℚ^{×2}` for `{i, j, k} = {1, 2, 3}`

For the proof, Use [full two-torsion descent data](#full-two-torsion-descent-data) and [swinnerton–dyer transition and stationary limit](#swinnerton-dyer-transition) for the algebraic data law. On the central prime-factor window, [kane prime-tuple character estimates and arithmetic moments](#kane-prime-character-estimates) supplies the normalized cardinality moments and parity frequencies. Apply [parity-sensitive twist moment determinacy](#parity-sensitive-twist-moment-determinacy), then discard the negligible complement for dimension indicators. For positive integers remove fixed square factors and factors dividing `D` by the source's summable denominator decomposition; repeat with the negative base twist for signed integers. On the central window the full Selmer-size moments are `4^k∏_{i=1}^k(2^i+1)`.

*Needs:* [full two-torsion descent data](#full-two-torsion-descent-data), [swinnerton–dyer transition and stationary limit](#swinnerton-dyer-transition), [kane prime-tuple character estimates and arithmetic moments](#kane-prime-character-estimates), [parity-sensitive twist moment determinacy](#parity-sensitive-twist-moment-determinacy), [poonen rains distribution](#poonen-rains-distribution), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family).

([[34]](#ref-34), §1, setting, p. 1 (arXiv v4); [[34]](#ref-34), §1, Theorem 3 and Corollaries 4–5, p. 2 (arXiv v4); [[34]](#ref-34), §1, Theorem 2, p. 2 (arXiv v4).)

**Checks.**

- `d = 0` (`Sel_2 = E[2]` only): density `a_0 ≈ 0.2097`.
- The parity of `dim Sel_2(E_b)` depends only on the class of `b` in `∏_{v∈S}ℚ_v^×/ℚ_v^{×2}`, and is even for exactly half of the classes (Kane, Lemma 1).

- Conditioning on a single parity changes the dimension law even though every positive cardinality moment is unchanged; parity recovery is required.

<a id="geometric-height-weierstrass-family"></a>

**Geometric-height Weierstrass family.** For each finite field `𝔽_q`, construct the carrier of elliptic curves over the fixed field `𝔽_q(t)` modulo origin-preserving base-field isomorphism. Define `h(E)` as the least `d≥0` admitting a long Weierstrass equation with `A_i∈H⁰(P¹,O(id))`, `i=1,2,3,4,6`. Construct the associated relatively minimal regular elliptic surface with section and identify `d` with the degree of its invariant-differential line bundle. Prove exact-height slices finite and their origin-preserving automorphism groups finite. Coordinate changes preserve the base `P¹`; quotienting by `PGL₂(𝔽_q)` is not part of this carrier.

For the proof, Build the minimal long-Weierstrass surface, glue the local DVR minimal regular models over `P¹`, and prove the contraction comparison. Trivialize its line bundle by degree, and count coefficient tuples in the finite section spaces; every exact-height class has such a representative. The regular-model construction and its height comparison are included here.

*Needs:* EllipticCurves (long equations and isomorphisms), AlgebraicCurves (divisors and Riemann–Roch), AlgebraicVectorBundles (line bundles on `P¹`), StableReduction Layers 4–5 (DVR regular models, modifications and minimal models), NeronModelsAndSemistableAbelianVarieties §2.7 (smooth locus comparison).

(de Jong [[56]](#ref-56), §1.1, §§4.1–4.10 and Appendix B, author pp. 1, 5–8, 28.)

**Checks.**

- Height zero gives constant elliptic curves; this slice is not used as an asymptotic denominator.
- Multiplying a minimal equation's line bundle by `O(m)` gives a nonminimal presentation of higher degree and does not change its least height.
- An automorphism of `𝔽_q(t)` changing `t` does not identify two classes in this carrier; every allowed isomorphism fixes the base field.

<a id="de-jong-weighted-denominator"></a>

**De Jong weighted denominator.** On these exact-height slices set `I_d=Σ_(h(E)=d)1/#Aut(E,0)`. Prove `q^(−10d−1)I_d→L(q)=(1−q^(−9))(1−q^(−10))/(1−q⁻¹)>0`. Keep fixed `q` while `d→∞`, and prove eventual nonemptiness from this limit.

For the proof, Count nonsingular minimal long equations, subtract nonminimal presentations indexed by effective divisors on `P¹`, and divide each orbit by the coordinate-change group with its actual stabilizer. Solve the resulting recursion as in Proposition 4.12; only its limiting denominator is required here.

*Needs:* [geometric-height Weierstrass family](#geometric-height-weierstrass-family), Mathlib finite orbit/stabilizer counts; AlgebraicCurves (effective divisors on `P¹`).

(de Jong [[56]](#ref-56), Proposition 4.12, author pp. 8–9.)

**Checks.**

- The constant-height stack mass is `I₀=q`.
- `L(q)>0` for every prime power `q>1`; a limit ratio is taken only after this positivity.
- `L(q)→1` as `q→∞`; changing the normalization from `q^(10d+1)` to `q^(10d)` changes the limit by a factor of `q`.

<a id="de-jong-constant-j-estimates"></a>

**De Jong constant-j estimates.** In the same family, prove `#{E:h(E)=d,j(E)∈𝔽_q}=O_q(dq^(9d))` for `d≥1`, and an absolute `C₁>0` with `dim_𝔽₃ Sel₃(E)≤C₁d` for these curves when `char(𝔽_q)≠3`. Include the long-equation classifications at characteristics two and three for the curve count. For sufficiently large fixed `q>3^C₁`, deduce that the constant-j contribution to the unweighted Selmer numerator is `o(q^(10d))`.

For the proof, Count the constant-j normal forms with their coordinate stabilizers as in Proposition 4.14. Construct a separable trivializing cover of degree at most 24 and genus `O(d)` as in Lemma 10.1, then bound the constant-curve Selmer cohomology after restriction and its kernel. Establish the prime-to-characteristic function-field elliptic Kummer/Selmer adapter through the flat contracts below. Uniformly bounded automorphism orders turn weighted class counts into unweighted counts.

*Needs:* [geometric-height Weierstrass family](#geometric-height-weierstrass-family), [finite-flat local topology and duality](#flat-local-duality), [integral flat reference and Kummer annihilators](#flat-integral-kummer), AlgebraicCurves (finite covers, genus and torsors), ArithmeticGaloisDuality §R02.4.5.

(de Jong [[56]](#ref-56), Proposition 4.14 and Lemmas 10.1–10.2, author pp. 10–11, 28–29.)

**Checks.**

- `d=0` is excluded from the linear Selmer-dimension bound; constant curves can have nonzero Selmer groups there.
- In characteristic two the long-equation constant-j count is required; a short-model count misses curves.
- The exponential estimate is `dq^(9d)3^(C₁d)=o(q^(10d))` only for `q>3^C₁`; it does not give the unweighted conclusion for every fixed small `q`.

<a id="de-jong-torsor-surface-comparison"></a>

**De Jong torsor/surface comparison.** For `d≥1` and `char(𝔽_q)≠3`, construct the degree-three genus-one torsors attached to nonidentity `Sel₃` classes, their relatively minimal regular surfaces, and their degree-three divisor classes. Build the relative section algebra and its Gorenstein cubic model `Y→P¹`: the fibres are connected genus-one Gorenstein curves, `ω_(Y/P¹)=g*O(d)`, and the effective divisor `D` is flat of relative degree three with `O(D)` relatively very ample. Call a pair nondegenerate when its generic divisor class is not three times a degree-one class. Identify pairs under base-preserving isomorphism and rational equivalence of the divisor up to a fibre multiple. Define `A_(3,d)` as the reciprocal-automorphism mass of these nondegenerate cubic pairs. Prove `Σ_(h(E)=d)(#Sel₃(E)−1)/#Aut(E,0)≤A_(3,d)`.

For the proof, Construct order-preserving degree-three torsor/divisor data, extend and adjust the divisors along singular fibres, and prove the section-algebra generation and contraction statements needed for the cubic model. Compare the automorphism groups and discard only the degenerate identity contribution. These geometric extensions and comparisons are targets here, including the Gorenstein genus-one section-algebra statements of Appendices A–B.

*Needs:* [geometric-height Weierstrass family](#geometric-height-weierstrass-family), [integral flat reference and Kummer annihilators](#flat-integral-kummer), AlgebraicCurves (genus-one torsors, divisors and Riemann–Roch), AlgebraicModuliForArithmeticGeometry (relative Proj and projective bundles), StableReduction Layers 4–5 (DVR regular and minimal models).

(de Jong [[56]](#ref-56), §§5.2–5.5, Proposition 5.14 and Appendices A–B, author pp. 15–16, 20, 26–28.)

**Checks.**

- The zero Selmer class contributes the subtracted one and is not counted as a nondegenerate cubic pair.
- A degree-three rational divisor class is not replaced by a rational point on the torsor; the latter would trivialize it.
- The comparison uses `d≥1` to exclude nonzero connected-component torsion sections in the automorphism kernel; it is not applied at height zero.

<a id="de-jong-projective-cubic-count"></a>

**De Jong projective-cubic count and geometric sum.** For the preceding `A_(3,d)`, normalize the rank-three bundle to `O⊕O(a)⊕O(b)` with `0≤a≤d` and `a≤b≤d+a`. Put `V_(a,b)=H⁰(P¹,Sym³(O⊕O(a)⊕O(b))⊗O(d−a−b))` and `PG_(a,b)=Aut(O⊕O(a)⊕O(b))/𝔽_q×`. Prove `A_(3,d)≤Σ_(a,b)#P(V_(a,b))/#PG_(a,b)` and that this finite sum, divided by `q^(10d+1)`, tends to `C(q)=3/((1−q⁻³)(1−q⁻²)²(1−q⁻¹)²)` for fixed `q`.

For the proof, Prove the required rank-three bundle splitting over `P¹` and its uniqueness up to ordered degrees, using the maximal-degree line-subbundle argument and Riemann–Roch. Embed every cubic pair into its normalized projective bundle, derive the displayed inequalities from smoothness and nondegeneracy, and identify its automorphisms with the projective stabilizer. Count all projective cubic sections to obtain an upper bound, then evaluate the section dimensions and triangular bundle-automorphism counts in the finite geometric sum. The bundle splitting and this orbit-to-sum reduction are owned here.

*Needs:* [de jong torsor/surface comparison](#de-jong-torsor-surface-comparison), AlgebraicVectorBundles (bundles and projectivization), AlgebraicCurves (cohomology of `O(m)` on `P¹`), Mathlib finite general-linear-group orders and geometric sums.

(de Jong [[56]](#ref-56), §§6–7, Propositions 7.5 and 7.9, author pp. 21–25.)

**Checks.**

- For `(a,b)=(0,0)`, the automorphism quotient is `PGL₃(𝔽_q)`; scalar bundle automorphisms are divided out once.
- A section with singular generic cubic is included in the upper bound, not falsely identified with a smooth genus-one torsor.
- The normalized summands with `a+b>d` have vanishing total limit; the remaining sum has `C(q)→3`, rather than three surviving individual cubic orbits.


<a id="function-field-3-selmer-average-bound"></a>

**Function field 3 selmer average bound.** For all sufficiently large prime powers `q` of characteristic different from three, let `E` run over `𝔽_q(t)`-isomorphism classes of elliptic curves of exact geometric height `d`. This height is the least `d` admitting a long Weierstrass equation whose coefficient `A_i` is a homogeneous section of `O(id)` on `P¹`. Put `C(q)=3/((1−q^(−3))(1−q^(−2))²(1−q^(−1))²)` and `L(q)=(1−q^(−9))(1−q^(−10))/(1−q^(−1))`. Then `limsup_(d→∞) average_E #Sel3(E) ≤ 1+C(q)/L(q)=4+O(q^(−1))`. This is an exact-height limsup, not existence of an ordinary height limit. The weighted version uses weight `1/#Aut(E,0)`.

The carrier consists of isomorphism classes over the fixed base `𝔽_q(t)`; the automorphisms fix the origin and the base. Height `d` is exact, with `d` tending to infinity before `q`. For the unweighted comparison take `q` larger than the absolute constant arising from the constant-`j` Selmer bound; no assertion uniform over small `q` is made.

For the proof, de Jong Theorem 1.2 bounds `q^(−10d−1) Σ_(h(E)=d)(#Sel3(E)−1)/#Aut(E,0)` by `C(q)` in limsup. Its inputs are the genus-one torsor/surface comparison (Proposition 5.14), projective ternary-cubic orbit bound (Proposition 7.5) and evaluated geometric sum (Proposition 7.9). Proposition 4.12 gives `q^(−10d−1) Σ_(h(E)=d)1/#Aut(E,0)→L(q)>0`. Divide only after this positive limit to get weighted mean at most `1+C(q)/L(q)`. Outside constant `j`, `#Aut(E,0)=2`. Propositions 4.14 and Lemma 10.2 bound the number of constant-`j` curves by `O(dq^(9d))` and their three-Selmer dimension by `C₁d` with an absolute `C₁`. For fixed `q>3^(C₁)`, their unweighted Selmer contribution is `O(d(3^(C₁)q⁹)^d)=o(q^(10d))`. Remove these curves from numerator and denominator, cancel the factor two, and obtain the unweighted comparison. The rational functions `C(q)` and `L(q)` tend to three and one with error `O(q^(−1))`. Any other coefficient family or cumulative-height convention requires its own denominator and boundary comparison.

*Needs:* [geometric-height Weierstrass family](#geometric-height-weierstrass-family), [de jong weighted denominator](#de-jong-weighted-denominator), [de jong constant-j estimates](#de-jong-constant-j-estimates), [de jong torsor/surface comparison](#de-jong-torsor-surface-comparison), [de jong projective-cubic count and geometric sum](#de-jong-projective-cubic-count), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[56]](#ref-56), Theorem 1.2, §1.1, Proposition 4.12, Proposition 4.14 and Lemma 10.2; author DVI pp.1–2,8–11,29. The projective-cubic bounds are Propositions 5.14,7.5,7.9, author pp.20,24–25.)

**Checks.**

- At exact height `d=0` only constant elliptic curves occur; the asserted height asymptotic is a `d→∞` statement and is not applied to this slice.
- `C(q)→3` and `L(q)→1`; the identity Selmer element contributes the additional one.
- An automorphism-weighted count cannot be changed to an unweighted count without the constant-`j` estimate; for sufficiently large fixed `q` the displayed exponential comparison makes it negligible.
- The least long-Weierstrass degree is geometric height; replacing it by the `ℚ` invariant height has no meaning for this family.

<a id="p-infinity-selmer-corank-distribution-in-twist-families"></a>

**P infinity selmer corank distribution in twist families.** Let `E` be an elliptic curve over a number field `F` and `p` a prime; write `c_p(E/F) := corank_{ℤ_p} Sel_{p^∞}(E/F)` (the `ℚ_p`-dimension of the Pontryagin dual of `Sel_{p^∞}` tensored with `ℚ_p`; SelmerIwasawaCohomology §§2.10–2.12a). For a squareclass `s ∈ F^×/F^{×2}` let `E^s` be the quadratic twist of `E` by `F(√s)/F` (`E^s ≅ E` when `s` is a square; Tau Ceti EllipticCurves Layer 5). (i) Signed-integer ordering over `ℚ` (Smith): for `r ≥ 0` and an integer `H ≥ 1`, `N_r(H) := #{d ∈ ℤ : 0 < |d| ≤ H, c_p(E^d/ℚ) = r}` and the proportion `N_r(H)/(2H)`; every nonzero integer `d` is counted, squares and non-squarefree `d` included, and `E^d` depends only on the squareclass of `d`. (ii) Squareclass ordering (Bhargava–Klagsbrun–Lemke Oliver–Shnidman, Burungale–Tian): for `Σ ⊆ F^×/F^{×2}` and `X > 0`, `Σ(X) := {s ∈ Σ : H(s) < X}` with `H(s) := ∏_{𝔭 : v_𝔭(s) odd} N𝔭`, each squareclass counted once ([ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family)), and the proportion `#{s ∈ Σ(X) : c_p(E^s/F) = r}/#Σ(X)`. (iii) For a probability vector `π = (π_r)_{r≥0}`, `E` has twist-corank law `π` at `p` (in ordering (i) or (ii)) if every proportion converges to `π_r`; lower bounds are stated with liminf. For `F = ℚ` the squareclass height of the class of a squarefree `d` is `|d|`.

The required API is:

- `signedTwistCorankCount`: `N_r(H) = #{d : 0 < |d| ≤ H, c(d) = r}` for a corank function `c` : `ℤ → ℕ`. Here `H∈ℕ`; for real `H≥0` the total count is `2⌊H⌋`.
- `HasSignedTwistCorankLaw`: `∀ r`, `N_r(H)/(2H) → π_r` as `H → ∞`.
- `squareclassTwistCorankCount`: `#{s ∈ Σ(X) : c(s) = r}` for the squareclass family `Σ(X)`.
- `LowerSquareclassCorankDensity`: `liminf_{X→∞} #{s ∈ Σ(X) : c(s) = r}/#Σ(X)`.
- `sum_signedTwistCorankCount`: `Σ_r N_r(H) = 2H`: the counts over `r` partition the nonzero `d` with `|d| ≤ H`. Here `H∈ℕ`; for real `H≥0` the total count is `2⌊H⌋`.
- `signedTwistCorankCount_mono`: `N_r(H) ≤ N_r(H')` for `H ≤ H'`.
- `hasSignedTwistCorankLaw_tail`: If `E` has signed law `π` with `π_0 + π_1 = 1` then `#{0 < |d| ≤ H : c(d) ≥ 2}/(2H) → 0` ([two point corank law forces zero density of high corank](#two-point-corank-law-forces-zero-density-of-high-corank)).

For the proof, Import `c_p(E/F)` (SelmerIwasawaCohomology §§2.10–2.12a) and the twist `E^s` (Tau Ceti EllipticCurves Layer 5, quadratic-twist construction). Define the counting functions as finite counts: `{d : 0 < |d| ≤ H}` is finite; `Σ(X)` is finite by [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family) (units modulo squares and finiteness of the class group). Define the law predicates as limits (resp. liminf) of the proportions; the densities are the ones of [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family) specialised to these families.

*Needs:* [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), SelmerIwasawaCohomology §§2.10–2.12a.

([[24]](#ref-24), §1.1, pp. 2–3 (arXiv v2); [[24]](#ref-24), §1.1, Theorem 1.2, p. 3 (arXiv v2); [[2]](#ref-2), §3.2.2, Theorem 3.5, p. 7.)

**Checks.**

- For `c ≡ 0`, `signedTwistCorankCount c 0 H = 2H` and `HasSignedTwistCorankLaw c (point mass at 0)`. The exact identity uses `H∈ℕ`.
- For `c(d) = (1 if d > 0 else 0)`, `HasSignedTwistCorankLaw c π` with `π_0 = π_1 = 1/2`.
- For `c(d) = |d|`, every proportion `N_r(H)/(2H)` tends to 0, so `c` has limiting proportions 0 for every `r`, which is not a probability vector: pointwise limits do not imply tightness.
- Over `F = ℚ` with `Σ = ℚ^×/ℚ^{×2}`, `Σ(X)` is in bijection with the squarefree `d` with `|d| < X`.
- If `c_p(E^d/ℚ) = 0` for all `d` then the law is the point mass at 0.
- Signed ordering (i) versus squarefree ordering: the non-squarefree `d` have positive density `(1 − 6/π²)` in (i) but `E^d = E^{d'}` for the squarefree part `d'`; the two orderings are different families and need a comparison.

<a id="smith-twist-family-hypothesis"></a>

**Smith twist family hypothesis.** An elliptic curve `A/ℚ` satisfies Smith's Assumption 1.1 if one of the following holds: `(1) A(ℚ)[2] = 0; (2) A(ℚ)[2] ≅ ℤ/2` and, for the unique `ℚ`-isogeny `φ : A → A_0` of degree 2, `ℚ(A_0[2]) ≠ ℚ` and `ℚ(A_0[2]) ≠ ℚ(A[2]); (3) A(ℚ)[2] ≅ (ℤ/2)²` and A has no cyclic `ℚ`-isogeny of degree 4. For a model `y² = f(x)` with `f ∈ ℚ[x]` monic separable cubic this is equivalent to: (1) `f` has no rational root; or (2) `f` has exactly one rational root e and, writing `f(x + e) = x(x² + ax + b)`, neither `b` nor `b(a² − 4b)` is a rational square; or `(3) f = (x − e_1)(x − e_2)(x − e_3)` with `e_i ∈ ℚ` and none of `(e_i − e_j)(e_i − e_k) ({i, j, k} = {1, 2, 3})` is a rational square. The cubic criterion fixes the intended predicate.

The required API is:

- `SmithTwistHypothesis`: The disjunction of the three cubic-root conditions for a monic separable cubic `f ∈ ℚ[x]`.
- `SmithTwistHypothesis.caseThree`: Case (3): three rational roots with no `(e_i − e_j)(e_i − e_k)` a square.
- `smithTwistHypothesis_of_irreducible`: If `f` is irreducible over `ℚ` (no rational root) then case (1) holds.
- `smithTwistHypothesis_caseThree_iff`: For `f = (x − e_1)(x − e_2)(x − e_3)`: `case (3) ↔ ¬IsSquare((e_1 − e_2)(e_1 − e_3)) ∧ ¬IsSquare((e_2 − e_1)(e_2 − e_3)) ∧ ¬IsSquare((e_3 − e_1)(e_3 − e_2))`.
- `smithTwistHypothesis_twist`: The hypothesis holds for `f(x)` iff it holds for `d³f(x/d)` (the twist by `d ≠ 0`).

For the proof, `A(ℚ)[2] \ {O} = {(e, 0) : f(e) = 0, e ∈ ℚ}` (2-torsion of a Weierstrass curve; Mathlib WeierstrassCurve points). Case (2): for A : `y² = x(x² + ax + b)` the 2-isogenous curve is `A_0` : `y² = x(x² − 2ax + a² − 4b)` (Vélu; Tau Ceti EllipticCurves Layer 1), so `ℚ(A[2]) = ℚ(√(a² − 4b))` and `ℚ(A_0[2]) = ℚ(√b)`; two quadratic fields coincide iff the product of the radicands is a square. Case (3): a cyclic subgroup of order 4 is `⟨P⟩` with `2P = (e_i, 0)` and `x(P) = e_i ± √((e_i − e_j)(e_i − e_k)); ⟨P⟩` is Galois-stable iff `x(P) ∈ ℚ`; so no cyclic `ℚ`-isogeny of degree 4 iff no `(e_i − e_j)(e_i − e_k)` is a square (equivalence stated by Kane, §1).

*Needs:* `WeierstrassCurve` (Mathlib), `Polynomial.coeff` (Mathlib).

([[24]](#ref-24), §1.1, Assumption 1.1, p. 3 (arXiv v2); [[34]](#ref-34), §1, p. 1 (arXiv v4).)

**Checks.**

- `SmithTwistHypothesis (X³ − X)` holds by case (3).
- For `f = X(X − 1)(X − 4)` the product `(0 − 1)(0 − 4) = 4` is a square, so case (3) fails and `SmithTwistHypothesis f` is false (`y² = x(x − 1)(x − 4)` has a rational cyclic subgroup of order 4).
- `SmithTwistHypothesis (X³ − 2)` holds by case (1).
- For `f = X(X² + 4)` (`a = 0`, `b = 4` a square) case (2) fails and cases (1), (3) do not apply.
- `y² = x³ − x` satisfies (3) ([congruent number curve satisfies smith hypothesis](#congruent-number-curve-satisfies-smith-hypothesis)).
- `y² = x³ + 4x` (Cremona 32a1) has a rational 4-torsion point `(2, 4)`, so it fails `(2): b = 4` is a square.

<a id="congruent-number-curve-satisfies-smith-hypothesis"></a>

**Congruent number curve satisfies smith hypothesis.** `E` : `y² = x³ − x` satisfies Smith's Assumption 1.1, case `(3): E(ℚ)[2] = {O, (0, 0), (1, 0), (−1, 0)} ≅ (ℤ/2)²` and `E` has no cyclic `ℚ`-isogeny of degree 4.

`E` : `y² = x³ − x` over `ℚ`

For the proof, The roots of `x³ − x` are 0, 1, −1; the products `(e_i − e_j)(e_i − e_k)` are `(0 − 1)(0 + 1) = −1`, `(1 − 0)(1 + 1) = 2` and `(−1 − 0)(−1 − 1) = 2`, none a rational square; apply the cubic criterion of [smith twist family hypothesis](#smith-twist-family-hypothesis) (API `smithTwistHypothesis_caseThree_iff`).

*Needs:* [smith twist family hypothesis](#smith-twist-family-hypothesis).

([[2]](#ref-2), §3.2.1, Theorem 3.3, p. 6; [[34]](#ref-34), §1, p. 3 (arXiv v4).)

**Checks.**

- The twists `E^(n)` : `y² = x³ − n²x` have roots 0, `±n` and products `−n²`, `2n²`, `2n²`, again non-squares.

<a id="smith-selmer-rank-limit-equals-corank"></a>

**Smith selmer rank limit equals corank.** Let `E` be an elliptic curve over a number field `F` and `ℓ` a prime. For `k ≥ 1` let `r_{ℓ^k}(E/F)` be the largest `r` such that `(ℤ/ℓ^k)^r` injects into `Sel_{ℓ^k}(E/F)/im(E(F)_tors)`. Then `r_ℓ ≥ r_{ℓ²} ≥ …`, the sequence is eventually constant, and its limit `r_{ℓ^∞}(E/F)` equals `corank_{ℤ_ℓ} Sel_{ℓ^∞}(E/F)`.

For the proof, Kummer: the sequence `0 → E(F)[ℓ^∞]/ℓ^k → Sel_{ℓ^k}(E/F) → Sel_{ℓ^∞}(E/F)[ℓ^k] → 0` is exact (surjectivity of `H¹(F, E[ℓ^k]) → H¹(F, E[ℓ^∞])[ℓ^k]` with kernel `E(F)[ℓ^∞]/ℓ^k`, compatible with local conditions; EllipticCurves Layer 7 and SelmerIwasawaCohomology §§2.10–2.12a). The image of `E(F)_tors` in `Sel_{ℓ^k}` is the image of `E(F)[ℓ^∞]/ℓ^k` (the prime-to-`ℓ` torsion is `ℓ^k`-divisible), so `Sel_{ℓ^k}/im(E(F)_tors) ≅ Sel_{ℓ^∞}[ℓ^k]`. `Sel_{ℓ^∞} ≅ (ℚ_ℓ/ℤ_ℓ)^c ⊕ G` with `G` finite (finite cotype; SelmerIwasawaCohomology §2.12a), `c` the corank; so `Sel_{ℓ^∞}[ℓ^k] ≅ (ℤ/ℓ^k)^c ⊕ G[ℓ^k]` and the largest free `ℤ/ℓ^k-rank` is `c + #{cyclic factors of G of order ≥ ℓ^k}`, which equals `c` once `ℓ^k` exceeds the exponent of `G`.

*Needs:* SelmerIwasawaCohomology §§2.10–2.12a.

([[24]](#ref-24), §1.1, p. 2 (arXiv v2); [[36]](#ref-36), §2, Definition and Remark 2.1, p. 7 (arXiv v2).)

**Checks.**

- If `Ш(E/F)[ℓ^∞]` is finite then `r_{ℓ^∞}(E/F) = rank E(F)`.
- Finite `2-Selmer rank r_2` can exceed the corank: for `y² = x³ − x` twisted by `n = 5` (a congruent number with rank 1) `r_2 = 1 = corank`, but twists with `Ш[2] ≠ 0` have `r_2 > r_{2^∞}`.

<a id="two-point-corank-law-forces-zero-density-of-high-corank"></a>

**Two point corank law forces zero density of high corank.** Let `c` : `ℤ \ {0} → ℤ_{≥0}` be any function and suppose that `#{0 < |d| ≤ H : c(d) = 0}/(2H) → π_0` and `#{0 < |d| ≤ H : c(d) = 1}/(2H) → π_1` with `π_0 + π_1 = 1`. Then `#{0 < |d| ≤ H : c(d) ≥ 2}/(2H) → 0`. In particular this holds when `E` has signed twist-corank law `(1/2, 1/2, 0, 0, …)`, the conclusion of Smith I Theorem 1.2.

`c` : `ℤ \ {0} → ℤ_{≥0} π_0 + π_1 = 1`

For the proof, `#{0 < |d| ≤ H : c(d) ≥ 2} = 2⌊H⌋ − N_0(H) − N_1(H)` ([p infinity selmer corank distribution in twist families](#p-infinity-selmer-corank-distribution-in-twist-families), API `sum_signedTwistCorankCount`); divide by `2H` and take limits. For natural cutoffs the floor is `H`, in the natural-cutoff API; for real `H`, `⌊H⌋/H→1` gives the same limit. Note that the convergence of each `N_r(H)/(2H)` with `r ≥ 2` to 0 would not suffice without `π_0 + π_1 = 1` (tightness).

*Needs:* [p infinity selmer corank distribution in twist families](#p-infinity-selmer-corank-distribution-in-twist-families).

([[24]](#ref-24), §1.1, Theorem 1.2 and Remark 1.3, p. 3 (arXiv v2).)

**Checks.**

- For Smith's law: the proportion of `|d| ≤ H` with `corank ≥ 2` tends to 0; Smith's Remark 1.3 gives the rate `exp(−c(log log log H)^{1/2})`.

<a id="even-congruent-twists-have-corank-zero-given-smith-law"></a>

**Even congruent twists have corank zero given smith law.** Let `E:y²=x³−x`, and `E^(n):ny²=x³−x` for nonzero integers `n`. Assume the following corank law: for each `r≥0`, the proportion of integers `0<|d|≤H` with `corank_(ℤ₂)Sel_(2^∞)(E^d/ℚ)=r` tends to 1/2 for `r=0`, to 1/2 for `r=1`, and to zero for `r≥2`. Then a density-one subset of the positive squarefree `n≡1,2,3 (mod 8)` has corank zero. The conclusion is an implication from the stated corank law, combined with the twist invariance, squareclass denominator and parity comparisons; it does not prove that law.

`E` : `y² = x³ − x` over `ℚ` Smith's law: the signed-integer `2^∞-Selmer corank` law of the twists of `E` is `(1/2, 1/2, 0, …)`

For the proof, Translate Smith's `r_{2^∞}` into `corank_{ℤ_2} Sel_{2^∞}` ([smith selmer rank limit equals corank](#smith-selmer-rank-limit-equals-corank)) and `E^(n)` into Smith's `A^n` (the model `y² = x³ − n²x` of `A^d: y² = x³ + d²ax + d³b` with `a = −1`, `b = 0`; isomorphism `(x, y) ↦ (nx, n²y)`, Tau Ceti EllipticCurves Layer 5). Zero density of high `corank: #{0 < |d| ≤ H : corank_{ℤ_2} Sel_{2^∞}(E^d) ≥ 2} = o(H)` ([two point corank law forces zero density of high corank](#two-point-corank-law-forces-zero-density-of-high-corank)). Parity: for positive squarefree `n ≡ 1, 2, 3 (mod 8)`, `corank_{ℤ_2} Sel_{2^∞}(E^(n)/ℚ)` is even (SelmerIwasawaCohomology §4.29: 2-parity `(−1)^{corank} = w(E^(n)/ℚ)` together with `w(E^(n)/ℚ) = +1` exactly for `n ≡ 1, 2, 3 mod 8`). Hence `corank ≠ 0` implies `corank ≥ 2` on `S`. Positive density of `S`: `S` has relative density 1/2 in the positive squarefree integers ([ArithmeticStatisticsPartI: even parity classes have half density](../ArithmeticStatisticsPartI/README.md#even-parity-classes-have-half-density)), hence `#S(X) ~ (3/π²)X` ([ArithmeticStatisticsPartI: positive squarefree family over q](../ArithmeticStatisticsPartI/README.md#positive-squarefree-family-over-q)). Conclude: `#{n ∈ S(X) : corank ≠ 0} ≤ #{0 < |d| ≤ X : corank ≥ 2} = o(X) = o(#S(X))`; equivalently, the density-one set of all nonzero `d` with `corank ≤ 1` restricts to relative density one in `S` ([ArithmeticStatisticsPartI: density one restricts to subfamilies of positive lower density](../ArithmeticStatisticsPartI/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density)), and on `S corank ≤ 1` with even corank means `corank 0`.

*Needs:* [congruent number curve satisfies smith hypothesis](#congruent-number-curve-satisfies-smith-hypothesis), [smith selmer rank limit equals corank](#smith-selmer-rank-limit-equals-corank), [two point corank law forces zero density of high corank](#two-point-corank-law-forces-zero-density-of-high-corank), [p infinity selmer corank distribution in twist families](#p-infinity-selmer-corank-distribution-in-twist-families), SelmerIwasawaCohomology §4.29, [ArithmeticStatisticsPartI: even parity classes have half density](../ArithmeticStatisticsPartI/README.md#even-parity-classes-have-half-density), [ArithmeticStatisticsPartI: positive squarefree family over q](../ArithmeticStatisticsPartI/README.md#positive-squarefree-family-over-q), [ArithmeticStatisticsPartI: density one restricts to subfamilies of positive lower density](../ArithmeticStatisticsPartI/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family).

([[2]](#ref-2), §3.2.1, Theorem 3.3, p. 6; [[2]](#ref-2), §1.0.2, footnote 2, p. 2; [[24]](#ref-24), §1.1, Theorem 1.2, p. 3 (arXiv v2); [[36]](#ref-36), §5, Theorem 5.1, p. 27 (arXiv v2).)

**Checks.**

- The conclusion concerns `2^∞-Selmer` coranks, not finite 2-Selmer ranks: `dim Sel_2(E^(n)) − 2` is not 0 for a density-one subset (its law is Poonen–Rains, [two selmer distribution in full two torsion twist families](#two-selmer-distribution-in-full-two-torsion-twist-families)).
- Burungale–Tian Theorem 1.2 (analytic rank 0 for the same density-one set) follows by combining this conclusion with the rank-zero 2-converse; that analytic converse is a downstream application and is outside this part.

### 5.10 Three-isogeny ratios and twist averages

<a id="selmer-ratio-of-an-isogeny"></a>

**Selmer ratio of an isogeny.** Let `φ : A → A'` be an isogeny of abelian varieties over a number field `F`. For a place `v` of `F` put `c_v(φ) := #coker(φ : A(F_v) → A'(F_v)) / #ker(φ : A(F_v) → A'(F_v)) ∈ ℚ_{>0}`. The groups are finite by the local isogeny/Kummer finiteness theorem, including finiteness of `H¹(F_v,A[φ])`. The global Selmer ratio is `c(φ) := ∏_v c_v(φ)`, a finite product because `c_v(φ) = 1` for all finite `v ∤ deg φ` at which `A` has good reduction; `c_v` is multiplicative under composition of isogenies (index multiplicativity). For `s ∈ F^×/F^{×2}` let `φ_s` : `A^s → A'^s` be the twist by the common central automorphism `[−1]`. For elliptic curves this is the quadratic twist of Tau Ceti EllipticCurves Layer 5. For deg `φ = 3`, `c(φ_s) ∈ 3^ℤ` and `t(φ_s) := ord_3 c(φ_s)`; for `m ∈ ℤ`, `T_m(φ) := {s ∈ F^×/F^{×2} : c(φ_s) = 3^m}` (signed; BKLOS §9 notation), and `|T|_m := T_m ∪ T_{−m}` is BKLOS `§2's T_m`.

The required API is:

- `localSelmerRatio`: `c_v(φ) = #coker/#ker` of `φ` on `F_v`-points, as a positive rational.
- `globalSelmerRatio`: `c(φ) = ∏_v c_v(φ)` (finite support).
- `logSelmerRatio`: `t(φ) = ord_3 c(φ)` for a 3-isogeny.
- `selmerRatioClass`: `T_m(φ) = {s : c(φ_s) = 3^m}`.
- `localSelmerRatio_of_good`: If the finite kernel and cokernel have the same cardinality, their ratio is 1. The local Tamagawa formula proves this at good finite places away from `deg φ`; it does not assert that the map on local points is bijective.
- `localSelmerRatio_complex`: If `φ` is surjective on points with kernel of order 3 (a 3-isogeny at a complex place) then `c(φ) = 1/3`.
- `localSelmerRatio_comp`: `c(ψ ∘ φ) = c(φ)·c(ψ)` for homomorphisms with finite kernels and cokernels (snake lemma); for elliptic curves the global identity `c(φ)c(φ̂) = 1` is [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula).
- `globalSelmerRatio_twist_local`: For deg `φ=3`, `c(φ_s)` depends only on the images of `s` in `F_v^×/F_v^{×2}` for `v` in a fixed finite set `S`, independent of `s`.

For the proof, Define `c_v(φ)` from the finite local Kummer groups and take the product over all places. At good finite places away from `deg φ`, the étale isogeny on the formal groups and equality of the finite-field point counts give `c_v=1`; for elliptic curves this is also [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers). Define the twisted isogeny `φ_s` and the classes `T_m(φ)` as subsets of the squareclass group ([ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family)). For degree three the uniform assertion `c_v(φ_s)=1` outside `{v | 6∞} ∪ {bad v}` is BKLOS Theorem 6.2; the finite remaining local squareclass groups give the ratio strata. The elliptic specialization is [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined).

*Needs:* [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family), AbelianSchemesAndArithmeticModuli:A2–A3, SelmerIwasawaCohomology §2.12a, `WeierstrassCurve` (Mathlib) for the elliptic specialization.

([[26]](#ref-26), §2, p. 2 and Theorem 6.2, p. 10 (arXiv v2); local archimedean formula: Proposition 10.1, p. 14.)

**Checks.**

- A homomorphism surjective on points with kernel of order 3 (a 3-isogeny at a complex place) has localSelmerRatio `= 1/3`.
- For `φ` surjective on points (a 3-isogeny over `ℝ`): `c = 1` when the kernel is trivial (`E[φ](ℝ) = 0`), and `c = 1/3` when it has order 3.
- For `φ` an isomorphism, `c_v(φ) = 1` for all `v` and `c(φ) = 1`.
- The Selmer ratio is a quotient of indices, not a group order: it is 1 for the identity of `ℤ/3` and 1/3 for the zero map `ℤ/3 → 0`; so `c(φ)` is not `#Sel_φ`, which Cassels' formula relates to `c(φ)` only through the ratio `#Sel_φ/#Sel_φ̂`.
- For `F =` `ℂ`-type places: `c_v(φ) = 1/3` at every complex place ([local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers)).
- For the curve 19a3 over `ℚ` with its 3-isogeny, every `s` lies in `T_0 ∪ T_{±1}` (BKLOS §2).

<a id="local-selmer-ratio-via-tamagawa-numbers"></a>

**Local selmer ratio via tamagawa numbers.** Let `φ : E → E'` be an isogeny of elliptic curves over a local field `F`. (a) If `F` is a finite extension of `ℚ_p`, then `c(φ) = (c(E')/c(E)) · |φ'(0)|_F^{−1}`, where `c(·) = #E(F)/E_0(F)` is the Tamagawa number and `|φ'(0)|_F` is the normalised absolute value of the derivative at the origin of the map of formal groups induced by `φ` on minimal models; in particular `c(φ) = c(E')/c(E)` if `p ∤ deg φ`, and `c(φ) = 1` if moreover `E` has good reduction. (b) For deg `φ = 3`: if `F = ℂ` then `c(φ) = 1/3`; if `F = ℝ` then `c(φ) = 1/3` when `E[φ](ℝ) ≅ ℤ/3` and `c(φ) = 1` when `E[φ](ℝ) = 0`.

For the proof, (a) Filter `E(F) ⊇ E_0(F) ⊇ E_1(F) = Ê(𝔪)` (Tau Ceti EllipticCurves Layer 4: reduction, component group; Layer 1: formal groups). The index of `φ` on each graded piece multiplies: `#coker/#ker` is multiplicative in short exact sequences of finite-index maps (snake lemma). On `E(F)/E_0(F)` the ratio is `c(E')/c(E)` after accounting for `E_0/E_1`, where `φ` induces an isogeny of the reduction (finite groups of the same order for an isogeny of connected algebraic groups over a finite field: ratio 1). On `Ê(𝔪)`: for a homomorphism of one-dimensional formal groups with `φ'(0) ≠ 0`, `#coker/#ker` on `𝔪`-points equals `|φ'(0)|^{−1}` (compare with the filtration `Ê(𝔪^r) ≅ 𝔪^r` for `r` large, where `φ` acts as multiplication by `φ'(0)`). (b) Over `ℝ` or `ℂ` the identity component of `E'(F)` is divisible and its component group is a 2-group, so `φ(E(F)) = E'(F)` when `deg φ` is odd and `c(φ) = 1/#E[φ](F)`, which is 1/3 over `ℂ` and 1/3 or 1 over `ℝ`.

*Needs:* [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny).

([[26]](#ref-26), §10.2, Proposition 10.2 and Corollary 10.3, p. 15 (arXiv v2), citing Schaefer [34, Lem. 3.8]; [[26]](#ref-26), §10.1, Proposition 10.1, p. 14 (arXiv v2).)

**Checks.**

- `p ≠ 3`, good reduction: `c(φ) = 1`.
- `F = ℂ: c(φ) = 1/3` for every 3-isogeny.

<a id="tamagawa-ratio-under-potentially-good-reduction"></a>

**Tamagawa ratio under potentially good reduction.** Let `L` be a finite extension of `ℚ_p` and `φ : E → E'` a 3-isogeny over `L`. If some quadratic twist of `E` has good reduction, then `c(E) = c(E')`. Consequently, for `p ≠ 3`, `c(φ) = 1` ([local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers)).

For the proof, Reduce to additive potentially good reduction (good reduction is immediate: both Tamagawa numbers are 1). `p > 3: E` is a ramified quadratic twist of a curve with good reduction, so `E` has Kodaira type `I_0^*`; its Tamagawa number is `1 + #{roots in the residue field of the reduced cubic}`, determined by the Galois module `E[2]`; a 3-isogeny induces `E[2] ≅ E'[2]` and `E'` is the twist of the corresponding good-reduction isogenous curve, so `c(E) = c(E')` (Tate's algorithm, Tau Ceti EllipticCurves Layer 4; BKLOS derive the same from their Theorem 6.2). `p = 2: c(E')/c(E)` equals the ratio of norm indices `[E'(L) : N E'(M)]/[E(L) : N E(M)]` for the quadratic extension `M` trivialising the twist (Dokchitser–Dokchitser, 'Local invariants of isogenous elliptic curves', Lemma 4.6), a power of 2; `c(E')/c(E)` is a power of 3, because `φ` and `φ̂` induce maps between the component groups `E(L)/E_0(L)` and `E'(L)/E'_0(L)` whose composites are multiplication by 3, so the kernel and cokernel of the induced map are 3-groups; hence the ratio is 1. `p = 3`: the analogous argument with Dokchitser–Dokchitser Lemma 4.7. Prove these two local norm-index comparisons as part of the CM local tables stated below.

*Needs:* [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers).

([[26]](#ref-26), §11, Lemma 11.1 and proof, p. 18 (arXiv v2).)

**Checks.**

- Good reduction: `c(E) = c(E') = 1`.
- For `p > 3` and type `I_0^*`, `c(E) ∈ {1, 2, 4}`.

<a id="selmer-ratio-classes-are-locally-defined"></a>

**Selmer ratio classes are locally defined.** Let `φ : E → E'` be a 3-isogeny over a number field `F` and `Σ ⊆ F^×/F^{×2}` a set defined by finitely many local conditions. Then for every `m ∈ ℤ`, `Σ ∩ T_m(φ)` is a finite disjoint union of families defined by finitely many local conditions; `T_m(φ)` is empty for all but finitely many `m`; and each `Σ ∩ T_m(φ)` has a density in the squareclass ordering, which is positive when the set is nonempty.

For the proof, Let `S` be the finite set of places dividing `3·∞`, the places of bad reduction of `E` and the places above 2. For `v ∉ S`, `E^s` has either good reduction (`v(s)` even) or is a ramified quadratic twist of a good-reduction curve (`v(s)` odd), and in both cases `c_v(φ_s) = 1` ([tamagawa ratio under potentially good reduction](#tamagawa-ratio-under-potentially-good-reduction) with [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers)). For `v ∈ S`, `c_v(φ_s)` depends only on the class of `s` in `F_v^×/F_v^{×2}`, a finite set; so `c(φ_s) = ∏_{v∈S} c_v(φ_s)` takes finitely many values and each level set is a finite union of sets defined by local conditions at `S`. Decompose the finite set of allowed local squareclass tuples into single tuples. ArithmeticStatisticsPartI, [Positive squareclass denominator](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier), supplies the unconditional positive denominator asymptotic for each inhabited local rectangle. Sum these asymptotics over the finite disjoint decomposition. A level set of the product of local ratios need not itself be a rectangle, and its density is a sum of products, not one product. The analytic hypothesis `C` is needed for the Selmer numerator, not for this denominator theorem.

*Needs:* [ArithmeticStatisticsPartI: positive squareclass denominator](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier), [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), [tamagawa ratio under potentially good reduction](#tamagawa-ratio-under-potentially-good-reduction), [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers), [ArithmeticStatisticsPartI: family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family).

([[26]](#ref-26), §9.1, proof of Theorem 2.4, p. 14 (arXiv v2); [[26]](#ref-26), §2, p. 2 (arXiv v2).)

**Checks.**

- Over `ℚ` with `φ` the 3-isogeny of 19a3 (conductor 19): `S = {2, 3, 19, ∞}`.

- A nonempty local rectangle has a positive squareclass denominator without assuming `C`; that hypothesis is used for the Selmer numerator.
- Two disjoint rectangles with the same global ratio contribute the sum of their densities; their coupled level set need not have a single product density.

<a id="bklos-average-size-of-three-isogeny-selmer-groups"></a>

**BKLOS average size of three-isogeny Selmer groups.** Let `φ:E→E′` be a degree-three isogeny of elliptic curves over a number field `F`, and `Σ` a nonempty family defined by finitely many local squareclass conditions. Assume `C(F,φ,Σ)`. In the unweighted squareclass height `H(s)=∏_(v finite, v(s) odd)Nv`, the mean of `#Sel_(φ_s)(E_s)` exists and is `1+average_Σ c(φ_s)`. For a local rectangle the latter average is the product of the additive-Haar local averages, with the finite archimedean window of Layer 2; finite unions use disjoint denominator-weighted sums. The value is rational. The general-abelian form is [abelian three-isogeny average](#refinement-abelian-three-isogeny-average).

For the proof, the number-field orbit count under its explicitly quantified counting hypothesis gives the nonidentity numerator `c_Σ R_Σ X+o(X)`, and the matched squareclass count gives `c_Σ X+o(X)`, `c_Σ>0`. Add the unique reducible identity orbit for each twist. The seven named supplier targets in the coregular contract specify the representation, exact multiplicity weights, local spreading, finite infinity window, main term, two tails and mass computation. `C` remains an explicit hypothesis here and in its rank consumers.

*Needs:* [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family), [ArithmeticStatisticsPartI: family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [ArithmeticStatisticsPartI: binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [ArithmeticStatisticsPartIII: number field twist orbit count](../ArithmeticStatisticsPartIII/README.md#refinement-number-field-twist-orbit-count).

([[26]](#ref-26), §2, Theorem 2.1, p. 3 (arXiv v2); [[26]](#ref-26), §8, proof of Theorem 8.1, p. 13 (arXiv v2).)

**Checks.**

- For the CM 3-isogeny of [cm three isogeny has selmer ratio one](#cm-three-isogeny-has-selmer-ratio-one), the average of `#Sel_{φ_s}` is 2.
- Unlike the Bhargava–Shankar averages over all curves, the answer depends on the family `Σ` through the local averages at `v | 3 f_E ∞`.

<a id="cassels-isogeny-selmer-ratio-formula"></a>

**Cassels isogeny selmer ratio formula.** Let `φ : E → E'` be an isogeny of elliptic curves over a number field `F` with dual `φ̂`. Then `#Sel_φ(E)/#Sel_φ̂(E') = c(φ) · #E(F)[φ]/#E'(F)[φ̂]`; in particular `c(φ)·c(φ̂) = 1`.

For the proof, Local conditions: the images of the local Kummer maps `E'(F_v)/φE(F_v) ↪ H¹(F_v, E[φ])` and `E(F_v)/φ̂E'(F_v) ↪ H¹(F_v, E'[φ̂])` are exact annihilators under local Tate duality for the Weil pairing `E[φ] × E'[φ̂] → μ_{deg φ}` (SelmerIwasawaCohomology §2.12a (all-place Kummer annihilators) for the annihilator property of these Kummer conditions; local duality from ArithmeticGaloisDuality §D7.6). Greenberg–Wiles/Poitou–Tate Euler characteristic formula for dual Selmer structures on finite modules (ArithmeticGaloisDuality §§R02.4.3, R02.5.1): `#Sel/#Sel^* = (#H⁰(F, E[φ])/#H⁰(F, E'[φ̂])) ∏_v #L_v/#H⁰(F_v, E[φ])`. `#L_v/#H⁰(F_v, E[φ]) = #coker(φ_v)/#ker(φ_v) = c_v(φ)` ([selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny)); take the product. `c(φ)c(φ̂) = 1`: apply the formula to `φ` and to `φ̂` (whose dual is `φ`) and multiply.

*Needs:* [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), SelmerIwasawaCohomology §2.12a (all-place Kummer annihilators), ArithmeticGaloisDuality §§R02.4.3, R02.5.1.

([[26]](#ref-26), §9.1, equation (9.2), p. 14 (arXiv v2), citing Cassels 1965; [[36]](#ref-36), §2.2, p. 11 (arXiv v2).)

**Checks.**

- `φ = [n]` on `E` (not of prime degree) recovers no information: both sides are 1.
- For a 3-isogeny with `c(φ) = 1` and trivial torsion, `#Sel_φ(E) = #Sel_φ̂(E')`.

<a id="isogeny-factorisation-selmer-exact-sequence"></a>

**Isogeny factorisation selmer exact sequence.** Let `φ_1` : `A_1 → A_2` and `φ_2` : `A_2 → A_3` be isogenies of abelian varieties over a number field `F` and `ψ = φ_2 ∘ φ_1`. There is an exact sequence `0 → A_2(F)[φ_2]/φ_1(A_1(F)[ψ]) → Sel_{φ_1}(A_1) → Sel_ψ(A_1) → Sel_{φ_2}(A_2) → Ш(A_2)[φ_2]/φ_1(Ш(A_1)[ψ]) → 0`. For elliptic curves and a 3-isogeny `φ : E → E'` with `ψ = φ̂ ∘ φ = [3]` this gives `dim_{𝔽₃} Sel_3(E) ≤ dim Sel_φ(E) + dim Sel_φ̂(E')`.

For the proof, The short exact sequence of Galois modules `0 → A_1[φ_1] → A_1[ψ] → A_2[φ_2] → 0` gives a long exact cohomology sequence compatible with the Kummer sequences of `φ_1`, `ψ, φ_2` globally and locally (SelmerIwasawaCohomology §2.12a and the abelian Kummer contract; Tau Ceti EllipticCurves Layer 7 supplies the elliptic specialization). Diagram chase with the local conditions (the images of local points) gives exactness at the Selmer terms and identifies the kernel and cokernel with the displayed torsion and `Ш` quotients (Schaefer–Stoll, Corollary 1). The inequality: exactness at `Sel_ψ(A_1)` bounds its dimension by the dimensions of its neighbours.

*Needs:* [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), AbelianSchemesAndArithmeticModuli:A2–A3, SelmerIwasawaCohomology §2.12a.

([[26]](#ref-26), §9, Lemma 9.1 and (9.1), p. 13 (arXiv v2); [[27]](#ref-27), §8.1, Proposition 42(i) and (22), p. 21 (arXiv v1), citing Schaefer–Stoll.)

**Checks.**

- `φ_1 = φ_2 = id`: all terms vanish except `Sel_id = 0`.
- For `[3] = φ̂φ` and `E(F)[3] = 0: dim Sel_3(E) ≤ dim Sel_φ(E) + dim Sel_φ̂(E')`.

<a id="three-isogeny-selmer-parity"></a>

**Three isogeny selmer parity.** Let `φ : E → E'` be a 3-isogeny of elliptic curves over a number field `F` with `c(φ) = 3^m`. Then `dim_{𝔽₃} Sel_3(E) − dim_{𝔽₃} E(F)[3] ≡ m (mod 2)`.

For the proof, Apply [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence) to `[3] = φ̂ ∘ φ: dim Sel_3(E) = dim Sel_φ(E) + dim Sel_φ̂(E') − dim(E'(F)[φ̂]/φ(E(F)[3])) − dim(Ш(E')[φ̂]/φ(Ш(E)[3]))`. The last group has even `𝔽₃`-dimension: `φ` is adjoint for the Cassels–Tate pairing, which induces a nondegenerate alternating pairing on `Ш(E')[φ̂]/φ(Ш(E)[3])` (the Cassels–Tate and isogeny-adjointness contract of SelmerIwasawaCohomology §4.29). By [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula), `dim Sel_φ(E) − dim Sel_φ̂(E') = m + dim E(F)[φ] − dim E'(F)[φ̂]`. Combine and reduce modulo 2 using `dim E(F)[3] = dim E(F)[φ] + dim(E'(F)[φ̂] ∩ φ(E(F)[3]))` (routine torsion bookkeeping).

*Needs:* [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula).

([[27]](#ref-27), §8.1, Proposition 42(ii) and proof, p. 21 (arXiv v1); [[26]](#ref-26), §9.2, p. 14 (arXiv v2).)

**Checks.**

- `m = 0` and `E(F)[3] = 0: dim Sel_3(E)` is even.

<a id="finite-set-twist-density-zero"></a>

**Finite set twist density zero.** Prove that for finite squareclass height slices `F(X)` with `N(X)=#F(X)→∞`, every finite set `B` of squareclasses has relative density zero. The same assertion holds in any family with finite sublevels and a growing denominator.

For the proof, `0≤#(B∩F(X))/N(X)≤#B/N(X)` eventually, and the upper bound tends to zero. The positive squareclass denominator supplies growth in each inhabited finite-local-condition family.

*Needs:* [ArithmeticStatisticsPartI: positive squareclass denominator](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier), Mathlib finite-set cardinal bounds, `Filter.Tendsto` and elementary inverse-limit rules.

(Source: the elementary finite-subset density argument, with the squareclass height convention of BKLOS [[26]](#ref-26), §2, p. 2.)

**Checks.**

- The empty set has count and density zero at every cutoff.
- A fixed singleton has count at most one, so its density is zero in a growing squareclass family.
- A singleton family with constant denominator one has singleton density one; the denominator-growth hypothesis cannot be omitted.


<a id="finitely-many-twists-with-rational-p-torsion"></a>

**Finitely many twists with rational p torsion.** Let `E` be an elliptic curve over a number field `F` and `p` an odd prime. Then `{s ∈ F^×/F^{×2} : E^s(F)[p] ≠ 0}` has at most `p² − 1` elements; in particular it has density zero in the squareclass ordering.

`p` odd prime

For the proof, `E^s(F)[p] ≅ {P ∈ E(F̄)[p] : σP = χ_s(σ)P for all σ}` with `χ_s` the quadratic character of `F(√s)/F` (twist of `E` by −1 along `χ_s`, Tau Ceti EllipticCurves Layer 5). A nonzero `P` determines `χ_s`: if `σP = χ(σ)P = χ'(σ)P` then `χ(σ) = χ'(σ)` because `P ≠ 0` and `±1` are distinct mod `p` (`p` odd). So distinct squareclasses with nonzero `p`-torsion use disjoint sets of nonzero points of `E[p]`, giving at most `p² − 1` classes; a finite set has density zero by [finite set twist density zero](#finite-set-twist-density-zero).

*Needs:* [finite set twist density zero](#finite-set-twist-density-zero), EllipticCurves Layer 5 (quadratic-twist Galois action), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family).

(Silverman, *The Arithmetic of Elliptic Curves*, Chapter X §5, quadratic-twist Galois action; EllipticCurves Layer 5. The bound `p²−1` is the elementary disjoint-eigenspace argument above; its density consequence uses the positive squareclass denominator.)

**Checks.**

- `p = 3` and `E` with `E(F)[3] ≠ 0: s = 1` is one of the at most 8 exceptional classes.

- At `p=2`, every twist has the same geometric sign action on 2-torsion, so the odd-prime argument fails.
- For distinct quadratic characters at odd `p`, their nonzero eigenspaces are disjoint; a common nonzero point would force the two characters equal.

<a id="reduced-p-selmer-rank-bounds-the-corank"></a>

**Reduced p selmer rank bounds the corank.** For an elliptic curve `E` over a number field `F` and a prime `p: corank_{ℤ_p} Sel_{p^∞}(E/F) ≤ dim_{𝔽_p} Sel_p(E/F) − dim_{𝔽_p} E(F)[p]`. In particular, if `dim Sel_p(E/F) = dim E(F)[p]` then `corank_{ℤ_p} Sel_{p^∞}(E/F) = 0`.

For the proof, Kummer sequence at level `p: 0 → E(F)[p^∞]/p → Sel_p(E/F) → Sel_{p^∞}(E/F)[p] → 0` (as in [smith selmer rank limit equals corank](#smith-selmer-rank-limit-equals-corank), with `k = 1`). `dim_{𝔽_p} E(F)[p^∞]/p = dim E(F)[p]` (a finite abelian `p`-group `A` has `#A/pA = #A[p]`). `Sel_{p^∞} ≅ (ℚ_p/ℤ_p)^c ⊕ G` gives `dim Sel_{p^∞}[p] = c + dim G[p] ≥ c`.

*Needs:* [smith selmer rank limit equals corank](#smith-selmer-rank-limit-equals-corank), SelmerIwasawaCohomology §§2.10–2.12a.

([[29]](#ref-29), §5.5, Proposition 5.9, p. 19; [[2]](#ref-2), §1.0.1, p. 1.)

**Checks.**

- `E` with `E(F)[p] = 0` and `Sel_p(E/F) = 0: corank 0`.
- The inequality can be strict when `Ш[p^∞]` has nontrivial finite part.

<a id="three-selmer-rank-zero-in-selmer-ratio-one-twists"></a>

**Three selmer rank zero in selmer ratio one twists.** Assume `C` for `φ` and its dual on each nonempty local ratio stratum in the stated family. Let `φ : E → E'` be a 3-isogeny over a number field `F` and `Σ ⊆ F^×/F^{×2}` a set defined by finitely many local conditions with `Σ ∩ T_0(φ) ≠ ∅`. Put `r_3(E^s) := dim_{𝔽₃} Sel_3(E^s) − dim_{𝔽₃} E^s(F)[3]`. Then `liminf_{X→∞} #{s ∈ Σ(X) ∩ T_0(φ) : r_3(E^s) = 0}/#(Σ(X) ∩ T_0(φ)) ≥ 1/2`; hence the lower density of `{s ∈ Σ : r_3(E^s) = 0}` within `Σ` is at least `(1/2)μ(Σ ∩ T_0)/μ(Σ)`. BKLOS state the conclusion for Mordell–Weil rank 0; their proof gives this 3-Selmer statement, which implies it.

For the proof, `Σ' := Σ ∩ T_0(φ)` is a finite disjoint union of nonempty rectangles of local squareclasses, each with positive density (selmer-ratio-classes-are-locally-defined). Averages: by [bklos average size of three isogeny selmer groups](#bklos-average-size-of-three-isogeny-selmer-groups) for `φ` and for `φ̂` on `Σ'`, and `c(φ_s) = c(φ̂_s) = 1` on `T_0` ([cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula)), the averages of `#Sel_{φ_s}` and `#Sel_{φ̂_s}` over `Σ'` are both 2. Apply the cited average theorem to each rectangle and combine using their limiting relative densities; this extends it to `Σ′`. Convexity: `k ≤ (3^k − 1)/2` for integers `k ≥ 0`, so the upper averages of `dim Sel_{φ_s}` and `dim Sel_{φ̂_s}` are at most 1/2 ([ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family), monotonicity and subadditivity). `dim Sel_3(E^s) ≤ dim Sel_{φ_s} + dim Sel_{φ̂_s}` ([isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence)), so the upper average of `r_3` over `Σ'` is at most `1; r_3 ≥ 0` because `E^s(F)[3^∞]/3` injects by Kummer and has the same `F₃`-dimension as `E^s(F)[3]`. Parity: `r_3(E^s)` is even for `s ∈ T_0` ([three isogeny selmer parity](#three-isogeny-selmer-parity)). If `P_X` is the proportion of `s ∈ Σ'(X)` with `r_3 = 0`, the average of `r_3` over `Σ'(X)` is at least `2(1 − P_X)`; taking limsup, `1 ≥ 2(1 − liminf P_X)`.

*Needs:* [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined), [bklos average size of three isogeny selmer groups](#bklos-average-size-of-three-isogeny-selmer-groups), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula), [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), [three isogeny selmer parity](#three-isogeny-selmer-parity), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[26]](#ref-26), §2, Theorem 2.5, p. 4 (arXiv v2); [[26]](#ref-26), §9.2, proof of Theorem 2.5, p. 14 (arXiv v2).)

**Checks.**

- If `Σ ⊆ T_0` then at least half of `Σ` has `r_3 = 0`.
- The bound 1/2 is attained by the model in which `r_3 ∈ {0, 2}` with probability 1/2 each.

<a id="three-selmer-rank-one-in-odd-selmer-ratio-twists"></a>

**Three selmer rank one in odd selmer ratio twists.** Assume `C` for `φ` and its dual on each nonempty local ratio stratum in the stated family. Let `φ : E → E'` be a 3-isogeny over `F` and `Σ` a set defined by finitely many local conditions with `Σ ∩ (T_1(φ) ∪ T_{−1}(φ)) ≠ ∅`. Then `liminf_{X→∞}` of the proportion of `s ∈ Σ(X) ∩ (T_1 ∪ T_{−1})` with `r_3(E^s) = 1` is at least 5/6.

For the proof, On `Σ ∩ T_1` the averages of `#Sel_φ` and `#Sel_φ̂` are 4 and 4/3 ([bklos average size of three isogeny selmer groups](#bklos-average-size-of-three-isogeny-selmer-groups), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula)); on `T_{−1}` the roles are exchanged. Decompose each nonempty intersection into finitely many disjoint local-squareclass rectangles and combine their averages using the positive density weights. Convexity `2k + 1 − 2m ≤ 3^{k−m}`: the upper averages of `dim Sel_φ` and `dim Sel_φ̂` are at most `1/2 + 4/6` and `−1/2 + 2/3`, so the upper average of `r_3` is at most 4/3. For `T₁` use `m=1` for the `φ`-dimension and `m=0` for the dual dimension; reverse these choices on `T₋₁`. Combine the two strata by their limiting relative densities. The inequality holds for every integer `k−m`, including negative values. Parity: `r_3` is odd on `T_{±1}` ([three isogeny selmer parity](#three-isogeny-selmer-parity)), so `r_3 ∈ {1, 3, 5, …}` and `2·Prob(r_3 ≥ 3) ≤ 4/3 − 1`; hence `Prob(r_3 = 1) ≥ 5/6` in the liminf sense.

*Needs:* [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined), [bklos average size of three isogeny selmer groups](#bklos-average-size-of-three-isogeny-selmer-groups), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula), [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), [three isogeny selmer parity](#three-isogeny-selmer-parity), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[26]](#ref-26), §9.2, p. 14 (arXiv v2).)

**Checks.**

- For 19a3 over `ℚ`, half the squareclasses lie in `T_{±1}`, giving at least 41.6% of twists with 3-Selmer rank 1 (BKLOS §2).

<a id="positive-proportions-of-three-selmer-ranks-in-local-subfamilies"></a>

**Positive proportions of three selmer ranks in local subfamilies.** Assume `C` for `φ` and its dual on each nonempty local ratio stratum used in this assertion. Let `E/F` have a 3-isogeny `φ` and let nonempty `Σ ⊆ F^×/F^{×2}` be defined by finitely many local conditions. Then, in the squareclass ordering, the lower density within `Σ` of `{s : r_3(E^s) = 0}` is at least `(1/2)μ(Σ ∩ T_0(φ))/μ(Σ)`, and that of `{s : r_3(E^s) = 1}` is at least `(5/6)μ(Σ ∩ (T_1 ∪ T_{−1}))/μ(Σ)`. In particular, if `Σ` meets both `T_0(φ)` and `T_1(φ) ∪ T_{−1}(φ)`, positive proportions of the twists in `Σ` have 3-Selmer rank 0 and 1. This is the input used by Castella–Grossi–Lee–Skinner (Corollary 5.2.3) for `F = ℚ` and a local condition at 3; it is not BKLOS Theorem 2.6 itself.

`E/F` with a 3-isogeny `φ Σ` is nonempty and defined by finitely many local conditions; its density `μ(Σ)` is therefore positive.

For the proof, Apply [three selmer rank zero in selmer ratio one twists](#three-selmer-rank-zero-in-selmer-ratio-one-twists) and [three selmer rank one in odd selmer ratio twists](#three-selmer-rank-one-in-odd-selmer-ratio-twists) to `Σ ∩ T_0` and `Σ ∩ (T_1 ∪ T_{−1})`; these have densities ([selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined)), positive when nonempty. Remove the finitely many `s` with `E^s(F)[3] ≠ 0` ([finitely many twists with rational p torsion](#finitely-many-twists-with-rational-p-torsion)), so the torsion correction in `r_3` changes only finitely many `s` and no lower density.

*Needs:* [three selmer rank zero in selmer ratio one twists](#three-selmer-rank-zero-in-selmer-ratio-one-twists), [three selmer rank one in odd selmer ratio twists](#three-selmer-rank-one-in-odd-selmer-ratio-twists), [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined), [finitely many twists with rational p torsion](#finitely-many-twists-with-rational-p-torsion).

([[35]](#ref-35), §5.2, Corollary 5.2.3 and proof, p. 32 (arXiv v2); [[26]](#ref-26), §2, Theorem 2.5, p. 4 (arXiv v2).)

**Checks.**

- For `F = ℚ` and 19a3 with `Σ` all squareclasses: at least 25% have `r_3 = 0` and at least 41.6% have `r_3 = 1`.

### 5.11 CM three-isogeny twists

<a id="cm-curves-have-a-twist-with-good-reduction"></a>

**Cm curves have a twist with good reduction.** Let `E/F` be an elliptic curve over a number field with `End_F(E)=O_K` for an imaginary quadratic field `K⊆F`. At each finite place `v` there is a twist of `E` by an `O_K^×`-valued character having good reduction; for `j(E)∉{0,1728}` the twist is quadratic. This is the maximal-order setting of Rubin Corollary 5.22, fixed at the start of §5.1; it is the case needed by cm-three-isogeny-has-selmer-ratio-one.

For the proof, Use the Hecke character `ψ_E` of Rubin Theorem 5.15, specified in [CM twist and descent estimates](#support-cm). On local units `U_v`, part (i) places `ψ_E(U_v)` in `O_K^×`; part (ii) identifies it with the inertia action on prime-to-`v` Tate modules. This conclusion requires the Hecke-character theorem: finite order in `(K⊗ℚ_ℓ)^×` alone does not imply membership in `K`. For the local assertion, extend `ψ_E|U_v` to `F_v^×` by assigning 1 to a uniformizer. Local class field theory gives an `O_K^×`-valued Galois character `χ` with that inertia restriction. Twist by `χ⁻¹`: inertia acts trivially, so Néron–Ogg–Shafarevich gives good reduction. Rubin Corollary 5.22 constructs even a global twist using the corresponding character-extension statement. If `j` is neither 0 nor 1728, `Aut(E)=O_K^×={±1}`, so this twist is quadratic. The non-maximal-order case of the final corank theorem uses the separate isogeny to maximal order, not this lemma.

*Needs:* [CM twist and descent estimates](#support-cm).

([[26]](#ref-26), §11, proof of Theorem 11.2, p. 18 (arXiv v2), citing Rubin [32, 5.22]; [[55]](#ref-55), §5.1 p.16; Theorem 5.15 pp.19–20; Corollary 5.22 pp.21–22.)

**Checks.**

- `j(E) ∉ {0, 1728}`: a quadratic twist has good reduction at `v`.
- `E : y² = x³ + 1` (`j = 0`, CM by `ℤ[ζ₃]`) over `ℚ(ζ₃)`: a sextic twist may be needed at `v | 2` or 3.

<a id="cm-three-isogeny-has-selmer-ratio-one"></a>

**Cm three isogeny has selmer ratio one.** Let `φ : E → E'` be a 3-isogeny of elliptic curves over a number field `F` with `End_F(E) ≅ End_F(E') ≅ O_K` for an imaginary quadratic field `K` (all CM endomorphisms are defined over `F`, hence `K ⊆ F`). Then `c(φ) = 1`.

For the proof, Every finite `v: c_v(E) = c_v(E') —` by [cm curves have a twist with good reduction](#cm-curves-have-a-twist-with-good-reduction) some twist of `E` has good reduction at `v`; if it is quadratic, apply [tamagawa ratio under potentially good reduction](#tamagawa-ratio-under-potentially-good-reduction); otherwise `j(E) ∈ {0, 1728}: j = 1728` is impossible here: a 3-isogeny preserving the maximal CM order would give an ideal of norm 3 in `ℤ[i]`, whereas 3 is inert, and for `j = 0` also `j(E') = 0`, and its `O_K`-stable degree-3 kernel is the unique ideal kernel `E[(√−3)]`; quotienting by this kernel identifies `E′` with `E` over `F`, with `φ` corresponding to `√−3` up to automorphism. Consequently, for `v∤3`, `c_v(φ) = 1` by [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers). Infinite places are complex `(K ⊆ F): c_v(φ) = 1/3` at each of the `[F : ℚ]/2` complex places. Places above `3: c_v(φ) = |φ'(0)|_v^{−1}` (Tamagawa numbers equal by the first step). Choose a prime `ℓ ≠ 3` and an `ℓ`-isogeny `λ : E' → E` (exists since `End(E') ≅ O_K` and ideal classes have prime representatives; [CM twist and descent estimates](#support-cm)); `λ ∘ φ = a ∈ O_K`, `|λ'(0)|_v = 1`, and `|a'(0)|_v = |a|_v` (the normalised action of `O_K` on the invariant differential, [CM twist and descent estimates](#support-cm); Rubin Prop. 3.14). So `∏_{v|3} c_v(φ) = ∏_{v|3} |a|_v^{−1} = (3-part of N_{K/ℚ}(a))^{[F:K]} = 3^{[F:K]}`, because deg `a = N(a) = 3ℓ`. Product: `c(φ) = 3^{[F:K]} · 3^{−[F:ℚ]/2} = 1`.

*Needs:* [cm curves have a twist with good reduction](#cm-curves-have-a-twist-with-good-reduction), [tamagawa ratio under potentially good reduction](#tamagawa-ratio-under-potentially-good-reduction), [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers), [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), [CM twist and descent estimates](#support-cm).

([[26]](#ref-26), §11, Theorem 11.2, p. 18 (arXiv v2); [[26]](#ref-26), §11, proof of Theorem 11.2, p. 19 (arXiv v2); [[55]](#ref-55), Proposition 3.14, p.11.)

**Checks.**

- `K = ℚ(√−3)`, `E` : `y² = x³ + 1` over `F = K`, `φ = √−3: c(φ) = 1`.
- Non-maximal orders can give `c(φ) ≠ 1` (BKLOS Remark 11.3).

<a id="cm-twists-have-corank-zero-at-least-half"></a>

**Cm twists have corank zero at least half.** Assume `C` over `K` for an ideal-kernel degree-three isogeny of a `K`-isogenous maximal-order CM curve and its dual on the full twist family. Let `K` be an imaginary quadratic field in which 3 is not inert, and `E/K` an elliptic curve with CM by an order `O` of `K`. Then, ordering `t ∈ K^×/K^{×2}` by `H(t) = ∏_{v_𝔭(t) odd} N𝔭` (each squareclass once), `liminf_{X→∞} #{t : H(t) < X, corank_{ℤ_3} Sel_{3^∞}(E^t/K) = 0}/#{t : H(t) < X} ≥ 1/2`. This is BKLOS Theorem 2.7 for `F = K` in its Selmer form (BKLOS state the Mordell–Weil consequence; the Selmer statement is what their proof gives). No finiteness of `Ш` is assumed.

For the proof, Maximal order: if `End(E) ≅ O_K`, let `𝔭 ⊂ O_K` have norm 3 (3 is not inert) and `φ : E → E' := E/E[𝔭]` the ideal-kernel 3-isogeny; `End(E') ≅ O_K` ([CM twist and descent estimates](#support-cm): ideal action and isogeny degree). Twisting preserves the endomorphism rings, so `End(E^s) ≅ End(E'^s) ≅ O_K` for every `s`, and [cm three isogeny has selmer ratio one](#cm-three-isogeny-has-selmer-ratio-one) gives `c(φ_s) = 1`: every `s` lies in `T_0(φ)`. [three selmer rank zero in selmer ratio one twists](#three-selmer-rank-zero-in-selmer-ratio-one-twists) with `Σ = K^×/K^{×2} = T_0(φ)`: the lower density of `{s : dim Sel_3(E^s) − dim E^s(K)[3] = 0}` is at least 1/2. For such `s`, `corank_{ℤ_3} Sel_{3^∞}(E^s/K) = 0` ([reduced p selmer rank bounds the corank](#reduced-p-selmer-rank-bounds-the-corank)). Non-maximal order: choose `Ẽ/K` with `End(Ẽ) ≅ O_K` and a `K`-isogeny `E → Ẽ` ([CM twist and descent estimates](#support-cm); Rubin Prop. 5.3); twisting gives `K`-isogenies `E^s → Ẽ^s`, and isogenous curves have equal `ℤ_3`-coranks of `Sel_{3^∞}` (isogeny functoriality and the dual-isogeny composites: the induced maps have bounded-exponent kernels and cokernels, which are finite by finite cotype). So the set of `s` with `corank 0` is the same for `E` and `Ẽ`. The finitely many `s` with `E^s(K)[3] ≠ 0` ([finitely many twists with rational p torsion](#finitely-many-twists-with-rational-p-torsion)) do not affect lower densities.

*Needs:* [cm three isogeny has selmer ratio one](#cm-three-isogeny-has-selmer-ratio-one), [three selmer rank zero in selmer ratio one twists](#three-selmer-rank-zero-in-selmer-ratio-one-twists), [reduced p selmer rank bounds the corank](#reduced-p-selmer-rank-bounds-the-corank), [finitely many twists with rational p torsion](#finitely-many-twists-with-rational-p-torsion), [p infinity selmer corank distribution in twist families](#p-infinity-selmer-corank-distribution-in-twist-families), [CM twist and descent estimates](#support-cm), SelmerIwasawaCohomology §§2.10–2.12a, [ArithmeticStatisticsPartI: quadratic twist squareclass family](../ArithmeticStatisticsPartI/README.md#quadratic-twist-squareclass-family).

([[2]](#ref-2), §3.2.2, Theorem 3.5, p. 7; [[26]](#ref-26), §11, proof of Theorem 2.7, p. 19 (arXiv v2); [[55]](#ref-55), Proposition 5.3 and proof, p.15.)

**Checks.**

- The cube-sum curves `E_n` : `x³ + y³ = 2n` over `K = ℚ(ζ₃)` (3 ramified) satisfy the hypotheses (Burungale–Tian Remark 3.6(i)).
- The conclusion is a lower bound 1/2 on the lower density, not a density-one statement; all twists have root number `+1` over `K`.
- `K = ℚ(i)` (3 inert) is excluded.

### 5.23 Locally compact quadratic spaces

<a id="refinement-lc-quadratic"></a>

**Lc quadratic.** Locally compact quadratic data on a locally compact Hausdorff topological abelian group `V` consist of a continuous `QuadraticMap ℤ V (ℝ/ℤ) q` together with a polar adjoint `V ≃ₜ+ Hom_cont(V,ℝ/ℤ)`, with compact-open topology; its value on `(x,y)` is `q(x+y)−q(x)−q(y)`. Store this homeomorphic additive equivalence, not just injectivity. Second countability is imposed on the measure theorem, not on the carrier.

`V` is locally compact, Hausdorff and a topological abelian group.

Develop orthogonal subgroups with their membership criterion and order reversal. Prove the polar formula, its diagonal value `2q(x)` including at two, and bijectivity of the stored adjoint onto all continuous characters.

For the proof, Use the existing quadratic-map and continuous-homomorphism carriers. Record the adjoint equation as a constraint on the actual topological additive equivalence. Obtain orthogonal subgroups from the kernel equations of the polar bilinear map.

*Needs:* `QuadraticMap` (Mathlib), `QuadraticMap.polar` (Mathlib), `QuadraticMap.polarBilin` (Mathlib), `ContinuousAddEquiv` (Mathlib), `ContinuousAddMonoidHom` (Mathlib).

([[119]](#ref-119), Definition 2.13 and preceding nondegeneracy convention, pp. 8–9.)

**Checks.**

- On `V=(Z/2)²` with the discrete topology, `q(x,y)=xy/2` in `ℝ/ℤ` has polar value 1/2 on `((1,0),(0,1))`, but value 0 on `((1,0),(1,0))`. Its four polar characters are distinct and exhaust the character group.
- For the same `q`, `q(1,1)=1/2` and `polar(q)((1,1),(1,1))=0=2q(1,1)`. Quadratic value and polar diagonal must not be identified at two.
- The zero quadratic map on `Z/2` is continuous but its polar adjoint is zero, so it cannot define these data. On the zero group it does define the unique such data.

<a id="refinement-weak-metabolic"></a>

**Weak metabolic.** Given locally compact quadratic data `D` and an additive subgroup `W≤V`, weak metabolicity means that `W` is compact and open, `q` vanishes on `W`, and `W⊥=W`. Vanishing of the polar form alone is insufficient, particularly at 2.

`D` is as in the locally compact quadratic carrier.

Prove the characterization by compactness, openness, quadratic vanishing and self-annihilation, together with each of these consequences. The intersection of two distinguished weakly metabolic subgroups is open.

For the proof, Define the predicate by compactness, openness, quadratic vanishing and computed self-annihilation. Transport its conclusions by subgroup intersections and isometries.

*Needs:* [lc quadratic](#refinement-lc-quadratic).

([[119]](#ref-119), Definition 2.14, p. 9.)

**Checks.**

- In the discrete hyperbolic plane `V=(Z/2)²` with `q(x,y)=xy/2`, each coordinate axis is compact and open, `q` vanishes on it, and its orthogonal is itself. Both axes are weakly metabolic.
- The diagonal in that plane is self-orthogonal for the polar form but contains `(1,1)`, where `q=1/2`. It is not weakly metabolic.
- The zero subgroup in that nonzero plane is compact, open and quadratic-isotropic, but its orthogonal is `V`. It is not weakly metabolic.
- For `V=ℝ²` and `q(x,y)=xy` modulo `ℤ`, the `x`-axis is closed and quadratic-isotropic with orthogonal itself; it is neither compact nor open. It therefore fails weak metabolicity despite satisfying the algebraic conditions.

### 5.24 Locally compact maximal isotropics

<a id="refinement-maximal-isotropics"></a>

**Maximal isotropics.** `I(V)` consists of closed additive subgroups `Z≤V` on which `q` vanishes and with `Z⊥=Z`. It is the subtype of actual subgroups satisfying these equations. Its probability topology is supplied by finite quotient reductions; it is not the discrete topology on a countable list of subgroup names.

`D` is locally compact quadratic data.

Prove injectivity of the underlying-subgroup map and that every point has a closed, quadratic-isotropic, self-annihilating underlying subgroup.

For the proof, Form the closed, quadratic-isotropic, self-annihilating subtype. Construct the inverse-limit topology only after the finite quotient comparison.

*Needs:* [lc quadratic](#refinement-lc-quadratic), [weak metabolic](#refinement-weak-metabolic).

([[119]](#ref-119), Paragraph preceding Theorem 2.19 and Theorem 2.19(c), pp. 9–10.)

**Checks.**

- In the discrete hyperbolic plane `(Z/2)²` with `q(x,y)=xy/2`, `I(V)` has exactly two points, the coordinate axes. The diagonal is polar-isotropic but is excluded because `q(1,1)=1/2`.
- For `V=0`, `I(V)` is a singleton. In the nonzero hyperbolic plane the zero subgroup is not a point, since its orthogonal is all of `V`.
- For `V=ℝ²` with `q(x,y)=xy` modulo `ℤ`, the `x`-axis is a point of `I(V)`. It is closed and self-orthogonal with `q` zero, although it is not compact-open; replacing all maximal isotropics by the weakly metabolic subgroups would lose it.

### 5.25 Common-parity product laws

<a id="refinement-joint-parity-weight"></a>

**Joint parity weight.** For `k` selected prime factors and weights `w_i(d)`, define the common-parity weight on `d∈ℕ^k` to be 1 when `k=0`; for `k>0` it is `2^(k−1)∏_i w_i(d_i)` when all `d_i` have the same parity, and zero otherwise. Each marginal must have total even and total odd mass 1/2. The `k=0` carrier is the singleton function space, corresponding to `n=1`.

The prime laws are nonnegative and summable; each parity has mass 1/2.

Prove that the empty rank vector has weight one, that one prime recovers its marginal and that mixed parity has weight zero. Prove nonnegativity and, under summability and half-mass in each parity, summability and total mass one.

For the proof, Use a finite dependent product indexed by `Fin k`. Mix the two common-parity conditional product laws with equal weight. Treat the empty product directly, rather than applying the nonempty normalization.

*Needs:* [poonen rains parity](#poonen-rains-parity), [poonen rains distribution](#poonen-rains-distribution).

([[119]](#ref-119), Conjecture 1.4(a), p. 3, with the `n=1` convention separated.)

**Checks.**

- For two factors and rank vector `(0,0)`, the weight is `2w₀(0)w₁(0)`.
- For two factors and rank vector `(0,1)`, the weight is zero.
- The empty rank vector has weight 1.
- For one prime the coupled weight equals its original marginal. For two prime laws supported at 0 and 1 with weight 1/2 each, the four rank vectors have weights `1/2,0,0,1/2` and total one.
- If both prime laws put all mass at zero, the coupled mass at `(0,0)` is 2. Total mass one for each marginal alone does not normalize the coupling; the half-parity hypotheses are necessary.

### Character duality for the locally compact model

<a id="lc-character-annihilator-duality"></a>

**Locally compact character and annihilator duality.** For a Hausdorff locally compact abelian group `G`, prove continuous character extension from a compact-open subgroup to `G`. For groups with a compact-open subgroup, construct topological evaluation biduality and extension from every closed subgroup. For `LCQuadraticData V` with a compact-open subgroup and every closed `H≤V`, identify the character dual of `V/H` with `H⊥` under the stored polar adjoint, with the quotient and compact-open topologies. Prove `(H⊥)⊥=H`; if `H` is compact-open, so is `H⊥`. If `X` is compact-open and quadratic-isotropic, `X⊥/X` is finite with a nondegenerate induced quadratic form. No bounded-exponent assumption is imposed on this target.

For the proof, Extend a character from an open subgroup algebraically using divisibility of `ℝ/ℤ`; openness makes that extension continuous. Establish separation, closed-subgroup extension and biduality through compact-group duality and the discrete quotient by a compact-open subgroup, then prove the quotient-dual comparison. The stored adjoint transports these facts to polar annihilators. Compactness and discreteness make `X⊥/X` finite; the double annihilator computes its radical. ArithmeticGaloisDuality §R02.4.2's character-duality target supplies the bounded-exponent arithmetic specialization; the general compact-open development is owned here.

*Needs:* Mathlib `PontryaginDual`, `ContinuousAddMonoidHom`, quotient topologies and compactness; ArithmeticGaloisDuality §R02.4.2 (character duality for bounded-exponent arithmetic groups); [lc quadratic](#refinement-lc-quadratic).

(Poonen–Rains [[119]](#ref-119), Proposition 2.11, Corollary 2.12, Remark 2.15 and Examples 2.17–2.18, pp. 8–9; Pontryagin–van Kampen structure theorem, van Kampen 1935, Theorem 2, as cited there.)

**Checks.**

- Restricting a character of `ℤ/4` to `2ℤ/4` is surjective on character groups; extending the character with value `1/2` at 2 requires value `1/4` at 1.
- For `G=ℚ_p` and the standard additive character of conductor `ℤ_p`, the annihilator of `p^aℤ_p` is `p^(−a)ℤ_p`, with its compact-open topology.
- The finite-support subgroup of `∏_ℕ ℤ/2` is dense and proper. Its double annihilator is its closure, so closedness cannot be removed.

<a id="restricted-product-character-duality"></a>

**Restricted product character duality.** For Hausdorff locally compact abelian `V_i` with compact-open `W_i`, prove the topological character-dual comparison `(∏′(V_i,W_i))^∨≃∏′(V_i^∨,W_i^ann)`, by summing the evaluations. Transport factor polar adjoints through this comparison when `W_i` is self-annihilating. The reference subgroup in the dual is the annihilator of `W_i`, rather than all local characters.

For the proof, A character on the compact product `∏W_i` is trivial on all but finitely many factors. Extend those finitely many restrictions and subtract them; the remaining character factors through the discrete direct sum `⊕(V_i/W_i)`. Identify both compact-open topologies using product compact sets and open reference subgroups.

*Needs:* [locally compact character and annihilator duality](#lc-character-annihilator-duality), [RestrictedProducts, Export contract](../../Completed/RestrictedProducts/README.md#export-contract).

(Poonen–Rains [[119]](#ref-119), Examples 2.17–2.18, pp. 8–9; the character-duality reference of the preceding target.)

**Checks.**

- The empty product has the trivial character group.
- One factor recovers its ordinary character dual, with no restriction on that factor.
- For `V_i=(ℤ/2)²` and `W_i` one hyperbolic axis, a tuple of dual characters nontrivial on `W_i` at infinitely many indices does not define a continuous character of `∏W_i`.


### 5.26 Locally compact quadratic probability

<a id="refinement-lc-finite-reductions"></a>

**Lc finite reductions.** For second-countable nondegenerate locally compact quadratic `(V,q)` with a weakly metabolic `W`, compact-open `q`-isotropic subgroups `X` form a countable directed system ordered by reverse inclusion. `X⊥/X` is a finite nondegenerate quadratic module. The reduction of `Z∈I(V)` is `((Z∩X⊥)+X)/X`, a maximal isotropic subgroup; reductions compose. If a cofinal decreasing sequence `X_j` has intersection zero, `I(V)` is bijective to the inverse limit of these finite isotropic spaces.

For the proof, Apply [locally compact character and annihilator duality](#lc-character-annihilator-duality) to show finiteness and nondegeneracy of `X⊥/X`. Reuse the finite quadratic carrier and finite isotropic reduction supplied by Tau Ceti and §5.4. Choose a countable cofinal system inside `W`; lift compatible subgroups and prove closure, isotropy and self-annihilation.

*Needs:* [locally compact character and annihilator duality](#lc-character-annihilator-duality), [lc quadratic](#refinement-lc-quadratic), [weak metabolic](#refinement-weak-metabolic), [maximal isotropics](#refinement-maximal-isotropics), `TauCeti.FiniteQuadraticModule` (Tau Ceti), [isotropic reduction map](#isotropic-reduction-map).

([[119]](#ref-119), Theorem 2.19(a)–(c) and proof, pp. 9–10.)

**Checks.**

- In a finite discrete metabolic space, `X=0` recovers the original finite maximal-isotropic set and the reduction map is the identity.
- Reducing a hyperbolic plane by either coordinate axis gives the zero quadratic module and its singleton maximal-isotropic set.
- The diagonal in the dyadic hyperbolic plane is polar-self-orthogonal but has nonzero quadratic value, so it is rejected as a reduction subgroup.

<a id="refinement-lc-canonical-measure"></a>

**Lc canonical measure.** Assume additionally that `p` is prime, `pV=0` and `p·q(v)=0` for every `v∈V`. Thus the finite reductions take quadratic values in `(1/p)ℤ/ℤ`; at `p=2` the value-group condition is additional. The inverse-limit topology on `I(V)` carries a unique Borel probability whose pushforward to every finite quadratic reduction is the uniform maximal-isotropic law. This measure is invariant under every continuous quadratic isometry of `V`. Second countability and the inverse-limit Borel structure are part of the assertion.

For the proof, The finite reduction map has constant fibre size, giving consistent uniform marginals. Construct the consistent finite-isotropic inverse system and its measure extension on `I(V)`; existence and the comparison with the cofinal product/cylinder Borel structure are supporting probability targets below. After the comparison, apply Mathlib’s uniqueness for finite projective marginals; naturality of the reductions gives isometry invariance.

*Needs:* [lc finite reductions](#refinement-lc-finite-reductions), [fibres of the isotropic reduction map](#fibres-of-the-isotropic-reduction-map), `MeasureTheory.IsProjectiveLimit.unique` (Mathlib).

([[119]](#ref-119), Proposition 2.6, Remark 2.8 and Theorem 2.19(d)–(e), pp. 6–10.)

**Checks.**

- For `V=0`, the unique maximal isotropic has mass one.
- In a finite hyperbolic plane over `𝔽₂`, each of its two maximal quadratic-isotropic lines has probability 1/2.
- In a split four-dimensional quadratic space over `𝔽₂`, the six maximal quadratic-isotropic planes each have mass 1/6; their intersections with a fixed plane have dimensions 0, 1 and 2 with respective probabilities 1/3, 1/2 and 1/6.

<a id="refinement-lc-random-intersection"></a>

**Lc random intersection.** Under the preceding hypotheses a random `Z∈I(V)` is discrete almost surely and `Z∩W` is finite almost surely. If `V` has infinite `𝔽_p`-dimension, `dim_Fp(Z∩W)` has exactly the Poonen–Rains law. A finite-dimensional `V` instead has the finite intersection law, not its infinite limit.

For the proof, Choose an exhaustion of the countable discrete dual `W*` and its annihilator filtration. Use the finite constant-fibre laws to obtain the independent Bernoulli coordinates in the source proof. A summable exceptional-event bound and Borel–Cantelli give discreteness and finiteness; identify the limit using the law.

*Needs:* [lc canonical measure](#refinement-lc-canonical-measure), [intersection law converges to poonen rains](#intersection-law-converges-to-poonen-rains), `MeasureTheory.measure_limsup_atTop_eq_zero` (Mathlib).

([[119]](#ref-119), Theorem 2.19(f) and proof, pp. 10–11.)

**Checks.**

- A finite hyperbolic plane has only intersection dimensions zero and one; do not assign its law the positive tail of the infinite-dimensional distribution.
- The quadratic map `q(x,y)=(x²−y²)/4 mod ℤ` on `V=(ℤ/2)²` has the diagonal as its zero locus and a value not killed by two. This map has nondegenerate polar matrix `diag(1/2,1/2)`, but its only maximal quadratic-isotropic subgroup is the diagonal. Its intersection dimension is always one. It fails `2q=0`, although `2V=0`; the half-zero/half-one law does not apply.
- For `V=0`, intersection dimension is identically zero, with no half-parity conclusion.

<a id="refinement-lc-restricted-product"></a>

**Lc restricted product.** Let `(V_i,q_i,W_i)` be nondegenerate weakly metabolic locally compact quadratic modules. On the existing restricted-product group `∏′(V_i,W_i)`, `q((v_i))=Σ_i q_i(v_i)` is a finite sum for each point and defines nondegenerate locally compact quadratic data; `∏W_i` is weakly metabolic. If `I` is countable and every `V_i` is second-countable, the restricted product is second-countable.

For the proof, Use the completed RestrictedProducts carrier and its compact-open product subgroup. Quadratic vanishing on `W_i` makes the pointwise sum finite; prove continuity on product neighborhoods. Prove that the sum of local characters identifies the restricted product with its compact-open character dual: on the product of reference subgroups a continuous character uses finitely many nontrivial coordinates. Apply the local polar adjoints. Countable support patterns give the second-countability assertion.

*Needs:* [restricted product character duality](#restricted-product-character-duality), `RestrictedProduct` (Mathlib), [lc quadratic](#refinement-lc-quadratic), [weak metabolic](#refinement-weak-metabolic).

([[119]](#ref-119), Examples 2.17–2.18 and proof, p. 9.)

**Checks.**

- With an empty index set the restricted product is zero and its quadratic form vanishes.
- With one index the quadratic form and reference subgroup are those of the single factor.
- For an infinite family of finite hyperbolic planes with reference axes `W_i`, a tuple outside `W_i` at infinitely many indices is excluded, even if some of its individual quadratic values happen to vanish.

### Finite-flat cohomology for the global comparison

<a id="flat-local-duality"></a>

**Finite-flat local topology and duality.** Let `L` be a complete discretely valued field of positive characteristic with finite residue field, and `N/L` a finite commutative group scheme with Cartier dual `Nᴰ`. Construct the Hausdorff locally compact, second-countable topology on `H¹_fppf(L,N)` and the continuous cup/invariant pairing identifying it topologically with `H¹_fppf(L,Nᴰ)^∨`. Give `H⁰` the finite discrete topology and `H²` the discrete topology; their Cartier-dual pairing is perfect. Construct local abelian-variety Tate duality and compatibility with the two isogeny Kummer sequences, including inseparable kernels. Use HeightsRationalPointsAndObstructions §1.1 for the arbitrary-field fppf Kummer map and extend its exact sequence to `0→B(L)/φA(L)→H¹(L,A[φ])→H¹(L,A)[φ]→0`, natural in fields and isogenies; for smooth abelian varieties identify fppf torsors with the usual étale torsors.

For the proof, Build the flat cohomology topology by finite splitting covers and integral cocycles, and prove independence of the cover. Establish duality for étale, multiplicative and local-local constituents and pass through exact sequences. Use the Poincaré biextension for abelian duality and the isogeny compatibility. The finite étale prime-to-characteristic cases agree with ArithmeticGaloisDuality; the general flat adapters are targets here.

*Needs:* AbelianSchemesAndArithmeticModuli §§A2.2–A2.5, A3.1–A3.7 (native kernels, Cartier duals and fppf quotients); SchemeAndStackFoundations (flat descent and torsors); ArithmeticGaloisDuality §§R02.4.5, D7.6 for their prime-to-characteristic and characteristic-zero specializations; HeightsRationalPointsAndObstructions §1.1 (arbitrary-field fppf Kummer).

(Poonen–Rains [[119]](#ref-119), §4.2, pp. 17–18; Milne, [Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf), III §§6–7, especially III.6.5, III.6.10 and III.7.8, pp. 270–285.)

**Checks.**

- For `N=α_p`, `H¹(L,N)=L/L^p` is generally infinite; its residue-differential Cartier pairing must be a topological duality, not finite-group duality.
- For `N=μ_p`, `H¹(L,N)=L×/L×p` pairs with Artin–Schreier `H¹(L,ℤ/p)`; these are flat Kummer and étale additive classes respectively.
- If the order of `N` is prime to `char(L)`, recover the finite discrete local Tate pairing. The identity isogeny has zero Kummer image and zero kernel cohomology.

<a id="flat-integral-kummer"></a>

**Integral flat reference and Kummer annihilators.** For such `L` and finite flat commutative `𝒩/O_L`, prove `H¹(O_L,𝒩)→H¹(L,N)` is injective with compact-open image, and the reference images for `𝒩` and `𝒩ᴰ` are exact annihilators. For an isogeny extending between abelian schemes over `O_L`, identify this reference image with `B(L)/φA(L)`. For every local abelian isogeny, its Kummer image and that of the dual isogeny are compact-open exact annihilators; for the self-dual theta refinement, prove quadratic vanishing.

For the proof, Properness identifies integral and field-valued abelian points; finite-field torsor vanishing and the flat Kummer sequence identify the good-place image. Integral Cartier duality supplies annihilators, and local abelian duality supplies the general Kummer statement. The theta obstruction is constructed on the flat site using the supplied theta extension.

*Needs:* [finite-flat local topology and duality](#flat-local-duality), AbelianSchemesAndArithmeticModuli §§A3.3–A3.7, ReductiveGroupsPartII §RG2.3.7 (Lang torsor vanishing).

(Poonen–Rains [[119]](#ref-119), Propositions 4.8, 4.10 and 4.12, pp. 17–18; Milne, III §§6–8, and the flat global-duality reference in the next target.)

**Checks.**

- `α_p` over `O_L` gives the proper compact-open subgroup `O_L/O_L^p` inside `L/L^p`; replacing it by a finite unramified group loses classes.
- An inseparable isogeny of a good-reduction abelian variety still has its integral flat reference subgroup equal to its Kummer image.
- For `[1]`, the local reference, Kummer image and Selmer group all vanish. At a bad place the good-reduction identification is not asserted.

<a id="flat-global-poitou-tate"></a>

**Finite-flat global Poitou–Tate.** Let `k` be a global function field and `N/k` a finite commutative group scheme, extending to a finite flat group scheme over some nonempty open of its smooth proper constant-field curve. With all places included and the integral flat references outside a finite set, construct the nine-term Poitou–Tate sequence in fppf cohomology. In particular prove the exact middle sequence `H¹(k,N)→∏′_v H¹(k_v,N)→H¹(k,Nᴰ)^∨`, where the second arrow is the sum of local Cartier-cup invariants. Give global `H¹` its discrete topology and prove its image is closed. Include the finite Sha pairings and the global Brauer reciprocity sum. For self-dual `N`, the middle sequence identifies the global image with its own annihilator. This target includes connected `p`-primary kernels. For abelian isogenies over `k`, construct the flat Selmer and Sha carriers from the Kummer maps, prove their descent exact sequences and finite Selmer groups, with comparison to the number-field and prime-to-characteristic interfaces on their common domains.

For the proof, Develop flat compact-support duality on the open curve and pass through shrinking opens to the all-place restricted product, preserving the integral subgroups. Establish strictness and closedness of localization and the compatible Brauer trace. ArithmeticGaloisDuality supplies the prime-to-characteristic specialization; the connected flat case and this limit comparison are owned here. The global `H¹` image is countable and closed in a locally compact Hausdorff group, hence discrete by Baire. Its intersection with the compact product of Kummer images is finite; the finite Sha¹ kernel then gives finite Selmer groups. No finiteness of unrestricted flat cohomology on an affine curve is asserted.

*Needs:* [integral flat reference and Kummer annihilators](#flat-integral-kummer), [finite-flat local topology and duality](#flat-local-duality), SchemeAndStackFoundations (fppf cohomology and descent), AlgebraicCurves (global function-field curve and its opens), ArithmeticGaloisDuality §R02.4.5 (prime-to-characteristic compact-support sequence and reciprocity).

(Poonen–Rains [[119]](#ref-119), §4.3 and proof of Theorem 4.13, pp. 18–20; its references Milne I.4.10(c), III.8, and González-Avilés, [*Arithmetic duality theorems for 1-motives over function fields*](https://arxiv.org/pdf/0709.4255), Proposition 4.11 and Theorem 4.12, pp. 17–19.)

**Checks.**

- For prime-to-characteristic `N`, the integral references become the unramified references and the sequence agrees with ArithmeticGaloisDuality §R02.4.5.
- For `N=α_p`, localization uses `k/k^p` and `k_v/k_v^p`; passing to geometric points would erase these nonzero cohomology groups.
- For the trivial group scheme all terms vanish. For a global Brauer class the local invariant sum is zero, which gives quadratic isotropy of the global theta obstruction.


### 5.27 Global cohomology as an isotropic intersection

<a id="refinement-sha-one-vanishing"></a>

**Sha one vanishing.** For a global field `k`, `Sha¹(k,M)=ker(H¹(k,M)→∏_v H¹(k_v,M))`. It vanishes for constant cyclic `ℤ/n` modules, permutation modules and their direct summands. For a finite `𝔽_p`-module `M` it also vanishes when every Sylow `p`-subgroup of `Aut(M)` is cyclic. In particular `Sha¹(k,E[p])=0` for elliptic `E` and `p≠char(k)`; for an odd-degree hyperelliptic Jacobian with `char(k)≠2`, `Sha¹(k,J[2])=0`.

For the proof, Use Chebotarev to inject constant cyclic classes into the local family, then Shapiro and direct summands. For the Sylow criterion restrict to a cyclic Sylow extension and use restriction-corestriction. Apply to the elliptic torsion representation and the odd-degree root permutation module.

*Needs:* SelmerIwasawaCohomology §2.12a, ArithmeticGaloisDuality §§R02.4.2–R02.4.5, D7.6.

([[119]](#ref-119), Proposition 3.3 and proof, pp. 13–14.)

**Checks.**

- A constant cyclic module must give zero `Sha¹` even when the associated abelian variety has nonzero Tate–Shafarevich group.

<a id="refinement-selmer-quadratic-intersection"></a>

**Selmer quadratic intersection.** Let `k` be global, `A/k` abelian, and `λ:A→Â` a self-dual isogeny of odd degree or induced by a symmetric line bundle. The theta-group quadratic maps into local Brauer groups, followed by invariants in `ℝ/ℤ`, have polarization equal to the negative Weil-cup pairing (without division by 2) and make `V=∏′_v H¹(k_v,A[λ])` a second-countable weakly metabolic locally compact quadratic module. The Kummer subgroup `W=∏_v im(Â(k_v)/λA(k_v))` is compact-open maximal isotropic; the image `Z` of `H¹(k,A[λ])` is maximal isotropic. `Sel_λ(A)/Sha¹(k,A[λ])≅Z∩W`. In characteristic dividing `deg λ` all cohomology is fppf and uses the finite-flat local, integral and global targets above; the number-field supplier alone does not supply this case. `Sha¹` of the finite group scheme is not `Sha(A)`.

For the proof, Import the existing A3 theta-group extension; extend it to the fppf quadratic Brauer obstruction. Poonen–Rains Corollary 4.6 gives its polar form as the negative Weil-cup pairing; in odd degree `q(x)=−(1/2)(x cup x)`. Local duality and the symmetric-sheaf or odd-degree hypothesis give quadratic, rather than merely bilinear, isotropy of Kummer images. Poitou–Tate and global reciprocity give global maximal isotropy; compute the kernel of localization to obtain the quotient.

*Needs:* [finite-flat local topology and duality](#flat-local-duality), [integral flat reference and Kummer annihilators](#flat-integral-kummer), [finite-flat global Poitou–Tate](#flat-global-poitou-tate), [lc restricted product](#refinement-lc-restricted-product), [maximal isotropics](#refinement-maximal-isotropics), AbelianSchemesAndArithmeticModuli:A3, SelmerIwasawaCohomology §2.12a (all-place Kummer annihilators), ArithmeticGaloisDuality §§R02.4.2–R02.4.5, D7.6, AbelianSchemesAndArithmeticModuli §A3.6, AbelianSchemesAndArithmeticModuli §A3.5.

([[119]](#ref-119), Corollary 4.6, pp. 15–16; Theorem 4.13 and Sections 4.1–4.3, pp. 14–21.)

**Checks.**

- For `λ=[2]`, retain the theta quadratic refinement and the symmetric-sheaf hypothesis; a polar alternating pairing alone cannot certify quadratic isotropy.

- In characteristic `p`, a kernel containing `α_p` has nonzero flat local cohomology despite trivial geometric points; the finite étale supplier is insufficient.
- At a good function-field place, the local Kummer subgroup is the integral flat reference even for an inseparable kernel; its annihilator is computed by flat local duality.


### Global coefficient families

<a id="global-coefficient-model-families"></a>

**Global coefficient-model families.** Fix a global field `k` and its scalar Northcott height `H_k`. For a number field use Mathlib's `Height.mulHeight₁` with its number-field admissible absolute values, the unnormalized product `∏_v max(1,|x|_v)` with local degrees in the absolute values. For a function field with full constant field `𝔽_q`, use `H_k(x)=q^(deg(div_∞ x))`, with `H_k(0)=1`; degrees are over `𝔽_q`. All coefficient weights are one and a tuple has height the maximum of its scalar coefficient heights. Construct the nonsingular short Weierstrass tuples `(a,b)` when `char(k)≠2,3`, the nonsingular long tuples `(a₁,a₂,a₃,a₄,a₆)` when `char(k)=2,3`, and, for `g≥1` and `char(k)≠2`, separable polynomial tuples of exact degree `2g+1` or `2g+2` with nonzero leading coefficient. The sublevels are inclusive `H≤B`, finite and eventually nonempty, with cardinality tending to infinity. Count each coefficient tuple once, with no quotient by coordinate changes, scaling, or isomorphism of curves or Jacobians. Construct the associated elliptic curve or smooth hyperelliptic model and Jacobian on each tuple.

For the proof, Finite products of scalar Northcott sets give finiteness, and restriction to the nonsingular or separable locus preserves it. In the function-field case, bound pole divisors and use finite-dimensional Riemann–Roch spaces over the finite constant field. Explicit nonsingular equations and separable polynomials give nonemptiness; infinitely many distinct nonsingular coefficient tuples give denominator growth. These choices specify the coefficient-height interpretation of the arithmetic conjectures here; the minimal integral `ℚ` family remains a separate carrier.

*Needs:* Mathlib `Height.mulHeight₁`, `NumberField.finite_setOfPred_mulHeight₁_le` and `Northcott`; AlgebraicCurves (divisors, Riemann–Roch and smooth double covers); EllipticCurves Layers 1 and 5; [SchemeAndStackFoundations §3.6](../SchemeAndStackFoundations/README.md#36-picard-torsors-of-a-curve-without-a-rational-point-and-rational-divisor-classes) (`jacobian`, `jacobian_dim` for smooth projective geometrically connected curves without a rational point); JacobianChallenge Layers D–E (pointed comparison); [ArithmeticStatisticsPartI: arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family).

(Poonen–Rains [[119]](#ref-119), Conjectures 1.1, 1.7–1.8, pp. 2–4; BKLPR [[120]](#ref-120), Conjecture 6.9, p. 28. The scalar-height normalizations and coefficient weights are fixed as above.)

**Checks.**

- Over `ℚ`, `H_k(a/b)=max(|a|,|b|)` in lowest terms. The two short coefficient tuples `(−1,0)` and `(−16,0)` are distinct models of isomorphic curves and are counted separately.
- In characteristic two the long equation `y²+xy=x³+1` is nonsingular and belongs to the family; a short equation does not replace its five coefficient slots.
- A repeated-root polynomial and a tuple with zero leading coefficient are excluded. In `𝔽_q(t)`, `H_k(t^m)=q^m`; changing the constant-field normalization changes the cutoff and must be specified.
- Over `ℚ`, the separable degree-six polynomial `−x⁶−1` defines a smooth genus-two curve with no real point, including at infinity. Its Jacobian is constructed without a rational base point.


### 5.28 Composite Selmer and Jacobian conjectures

<a id="refinement-joint-parity-moments"></a>

**Joint parity moments.** For `k≥1` prime laws `w_i` with half even/odd mass, assume for every `m≥1` each parity-restricted sum `Σ_{d≡ε(2)}w_i(d)p_i^(md)` equals `(1/2)∏_{j=1}^m(p_i^j+1)`. The normalized common-parity law then has `m`-th cardinality moment `∏_i∏_{j=1}^m(p_i^j+1)`. Its first moment is `∏_i(p_i+1)=σ(∏p_i)` for distinct primes. For `k=0` the moment is 1.

For the proof, Sum separately over the two parity classes; factor each nonnegative summable product. The factor `2^(k−1)` and two equal contributions cancel the `k` half-masses. Import the parity-conditioned moment identity and the divisor formula.

*Needs:* [joint parity weight](#refinement-joint-parity-weight), [poonen rains parity](#poonen-rains-parity).

([[119]](#ref-119), Conjecture 1.4(b)–(c), pp. 3–4; Proposition 2.22, p. 12.)

**Checks.**

- The empty selection has every moment 1; primes 2 and 3 have joint first cardinality moment 12.

<a id="refinement-squarefree-selmer-conjecture"></a>

**Squarefree selmer conjecture.** Fix a global field `k` and a squarefree integer `n>1`. In [global coefficient-model families](#global-coefficient-model-families), with the height choices specified there, use short Weierstrass coefficients `a,b` in `k` of height bounded by `B` when `char(k)` is not 2 or 3, and the source’s long Weierstrass equations in characteristics 2 and 3; discard singular models and let `B` tend to infinity. The joint dimensions `dim_Fp Sel_p(E)`, `p|n`, are conjectured to have the common-parity product law. Separately, every positive `m`-th cardinality moment of `Sel_n` is conjectured to tend to `∏_{p|n}∏_{j=1}^m(p^j+1)`. Distribution convergence alone does not establish these unbounded moments. At `n=1` the group is trivial. The denominator counts these coefficient models, not minimal integral `ℚ`-isomorphism classes ordered by invariant height.

This is a stated conjectural proposition, not an established arithmetic limit.

The required API is:

- `Distributions.squarefree_selmer_conjecture.distribution`: Project the empirical joint-frequency assertion.
- `Distributions.squarefree_selmer_conjecture.moments`: Project each separately quantified cardinality-moment assertion.
- `Distributions.squarefree_selmer_conjecture.average`: At `m=1` the predicted numerical constant is `σ(n)`, as in the Bhargava–Shankar conjecture of §5.8. Transfer to that different minimal-model invariant-height denominator requires a separate family comparison and is not asserted.

For the proof, Express the precise finite-height averaging assertion on the supplied arithmetic family. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

*Needs:* [global coefficient-model families](#global-coefficient-model-families), [joint parity weight](#refinement-joint-parity-weight), [joint parity moments](#refinement-joint-parity-moments), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[119]](#ref-119), Conjecture 1.1 and its coefficient-height convention, p. 2; Conjecture 1.4(a)–(c), pp. 3–4.)

**Checks.**

- `n=1` has mass and every moment 1.
- Mixed parity has limiting mass zero for `n=pq`.
- `n=6,m=1` predicts 12, while independent distribution convergence is insufficient to prove it.

<a id="refinement-odd-degree-jacobian-conjecture"></a>

**Odd degree jacobian conjecture.** Fix `g≥1` over a global field of characteristic not 2. For separable coefficient models `y²=f(x)` of degree `2g+1` in the source coefficient-height family, the Jacobian `Sel_p` laws, squarefree composite coupling and moments are predicted to match the elliptic laws; the rank distribution is 0 and 1 with probabilities 1/2 each and average rank 1/2. For degree `2g+2` the same statements are proposed only for odd `n`. The height denominator counts models, not Jacobian isomorphism classes.

This is a stated conjectural proposition, not an established arithmetic limit.

The required API is:

- `Distributions.odd_degree_jacobian_conjecture.law`: Project the source-scoped Selmer-law assertion.
- `Distributions.odd_degree_jacobian_conjecture.rank`: Project the rank frequencies and separate average-rank assertion.
- `Distributions.odd_degree_jacobian_conjecture.even_degree_odd_n`: The even-degree version retains the restriction to odd `n`.

For the proof, Use [global coefficient-model families](#global-coefficient-model-families), with the stated polynomial degree and inclusive coefficient cutoff. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

*Needs:* [global coefficient-model families](#global-coefficient-model-families), [squarefree selmer conjecture](#refinement-squarefree-selmer-conjecture).

([[119]](#ref-119), Conjecture 1.7, p. 4.)

**Checks.**

- The `degree-2g+2` assertion does not include `n=2`.
- The Selmer cardinality prediction at `n=1` is 1.
- Isomorphic Jacobians from different coefficient models retain their model multiplicities.

<a id="refinement-even-genus-two-selmer-conjecture"></a>

**Even genus two selmer conjecture.** For even `g>0`, separable models of degree `2g+2` in the source family over a global field of characteristic not 2 have predicted `dim_𝔽₂ Sel_2(J)=1+X_PR`. Consequently the predicted mean size is 6 and `m`-th cardinality moment is `2^m∏_{j=1}^m(2^j+1)`. This statement is conjectural and does not apply to odd genus.

This is a stated conjectural proposition, not an established arithmetic limit.

The required API is:

- `Distributions.even_genus_two_selmer_conjecture.law`: The rank law is the one-unit shift.
- `Distributions.even_genus_two_selmer_conjecture.moments`: Each `m`-th cardinality moment carries the factor `2^m`.
- `Distributions.even_genus_two_selmer_conjecture.average`: The first moment is 6.

For the proof, Use [global coefficient-model families](#global-coefficient-model-families), with the stated polynomial degree and inclusive coefficient cutoff. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

*Needs:* [global coefficient-model families](#global-coefficient-model-families), [poonen rains distribution](#poonen-rains-distribution), [poonen rains moments](#poonen-rains-moments).

([[119]](#ref-119), Conjecture 1.8, p. 4.)

**Checks.**

- `g=2` gives predicted mean6, not3.
- The shifted law has zero mass at dimension0.
- No assertion is obtained for `g=1` from this proposition.

### 5.29 Integral orthogonal Grassmannians and rank strata

<a id="general-oesterle-measure"></a>

**General Oesterlé measure.** Let `p` be prime and `X/ℤ_p` finite type with nonempty generic fibre of dimension `d`. Construct the unique bounded Borel measure on `X(ℤ_p)` characterized on clopen `S` by `μ_X(S)=lim_e #im(S→X(ℤ/p^e))/p^(ed)`. An empty generic fibre has zero measure and no probability normalization. Prove that subschemes of smaller generic dimension have measure zero, and that an open set containing an integral point smooth of generic dimension `d` has positive measure. Normalize to a probability when such a point exists. Reduction images, rather than all finite-level points, determine the measure.

For the proof, Establish the reduction-image limit and boundedness on affine charts by the Oesterlé–Serre counting argument and extend from clopen cylinders by the measure extension theorem. Glue finite affine covers by uniqueness. Prove lower-dimensional vanishing and positivity in a smooth generic chart. The local analytic counting argument is part of this target, not an invariant-group-form import.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.1–1.3 (finite-type schemes and charts), Mathlib Borel measures and measure extension; `PadicInt` and finite reductions.

(BKLPR [[120]](#ref-120), Proposition 2.1(a)–(c), Corollary 2.2, pp. 5–6; Oesterlé, *Réduction modulo pⁿ des sous-ensembles analytiques fermés de ℤ_pᴺ*, Théorème 2; Serre's analytic counting theorem, as cited there.)

**Checks.**

- On `Spec ℤ_p`, `d=0` and the unique point has mass one.
- On `A¹_ℤp`, the measure is normalized additive Haar. Its closed point `0` has zero ambient mass but its own intrinsic point mass one.
- For `X=Spec(ℤ_p[T]/(T²))`, the unique integral point has mass one: counting all nonreduced solutions modulo `p^e` would give the wrong limit.

<a id="alternating-stratum-measure"></a>

**Alternating rank-stratum measure and pushforward.** Let `0≤r≤n` with `n−r` even. The closure of the rank-`n−r` alternating locus in `A^(n(n−1)/2)_ℤp` has generic dimension `binomial(n,2)−binomial(r,2)`. Construct its intrinsic Oesterlé measure `μ`; its smaller-rank locus is null, so the normalized measure restricts to integral matrices of exact generic corank `r`. For `m=n−r` and `β(M,A)=Mᵀ diag(A,0_r)M`, prove `β_*(μ_GL_n × |det A|_p^r μ_Alt_m)=c_(n,r) μ` on that locus, with `c_(n,r)>0` and with Haar mass one on `GL_n(ℤ_p)`. For even `m`, also prove `∫_Alt_m |det A|_p^s dμ=∏_{i=1}^{m/2}(1−p^(1−2i))/(1−p^(1−2i−2s))` for `s≥0`. These are the measure comparisons used in the all-rank alternating limit.

For the proof, Map a rank-stratum matrix to its image plane; the fibre is the open nondegenerate alternating locus, giving the dimension. Count the fibres of `β` in reduction images, retaining the determinant valuation, and pass to the intrinsic measure limit. Splitting off one hyperbolic block gives the determinant-integral recursion. This construction also supplies the intrinsic measure convention used on the orthogonal Schubert schemes below.

*Needs:* [general Oesterlé measure](#general-oesterle-measure), [count of nondegenerate alternating matrices](#count-of-nondegenerate-alternating-matrices), AlgebraicModuliForArithmeticGeometry §§1.1–1.3 (Grassmannians), Mathlib Smith normal form.

(BKLPR [[120]](#ref-120), Lemmas 3.10, 3.12–3.13 and proof of Theorem 3.11, pp. 10–12.)

**Checks.**

- At `r=n`, the rank-zero stratum is a point with intrinsic mass one; for `n≥2` it is null under the ambient alternating measure.
- At `r=0`, the dimension is `n(n−1)/2` and the determinant-zero locus has measure zero.
- At `m=2`, the determinant integral is `(1−p⁻¹)/(1−p^(−1−2s))`; the exponent is `2s` because `det [[0,a],[−a,0]]=a²`. At `m=0` it is the empty product one.


<a id="refinement-smooth-cylinder-measure"></a>

**Smooth cylinder measure.** Let `p` be prime and `X/ℤ_p` smooth proper of pure relative dimension `d`, with `X(𝔽_p)` nonempty. The requested Oesterlé–Serre measure has total mass `#X(𝔽_p)p^(−d)`; its probability normalization assigns `red_e^(−1)(B)` mass `#B/#X(ℤ/p^e)` for every subset `B` of the finite reduction. Smooth lifting supplies `p^d` points per fibre. For a general finite-type model the measure counts the reduction image of `X(ℤ_p)`, not every nonliftable or nonreduced finite-level point.

For the proof, Apply [general Oesterlé measure](#general-oesterle-measure) with reduction-image counts. Formal smoothness and properness give surjective compatible reductions with constant fibres `p^d`. Compute the total mass and cylinder normalization directly.

*Needs:* [general Oesterlé measure](#general-oesterle-measure), AlgebraicModuliForArithmeticGeometry §§1.1–1.3.

([[120]](#ref-120), Proposition 2.1 and Corollary 2.2, pp. 5–6; Lemma 4.8, p. 14.)

**Checks.**

- For `X=Spec ℤ_p`, total mass and the unique cylinder probability are one.
- For `X=P¹` over `ℤ_p`, total mass is `(p+1)/p` and every level-e point cylinder has probability `1/((p+1)p^(e−1))`.
- For `P¹ ⨿ P¹`, unnormalized mass is `2(p+1)/p`; the normalized law gives each component mass 1/2 and each level-e point cylinder half its one-component probability.

<a id="refinement-ogr-smooth-projective"></a>

**Ogr smooth projective.** For `n≥0` the subfunctor of `Gr(n,2n)` consisting of rank-`n` locally direct-summand subbundles on which `q(x,y)=Σ_i x_i y_i` vanishes is represented by a smooth projective `ℤ`-scheme `OGr_n` of relative dimension `n(n−1)/2`. This integral statement includes characteristic2 and requires quadratic vanishing, not merely alternating polar isotropy.

For the proof, Import the generic Grassmannian, universal subbundle and closed quadratic vanishing equations. Use graph charts from complementary isotropic subbundles: the free coordinates are alternating forms including a zero diagonal at2. Projectivity follows from the closed immersion into the Grassmannian; charts and transitivity prove smoothness of the stated dimension. Construct the global orthogonal Grassmannian and verify its chart closure.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.1–1.3, [maximal isotropic subspaces of a quadratic space](#maximal-isotropic-subspaces-of-a-quadratic-space).

([[120]](#ref-120), Section 4.2 and Proposition 4.4, pp. 12–14.)

**Checks.**

- `OGr₀` is a point.
- `OGr₁` has two points in each fibre, including characteristic two; it is not the whole projective line.
- `OGr₂(𝔽₂)` has six points, whereas `Gr(2,4)(𝔽₂)` has 35; quadratic vanishing is a proper condition.

<a id="refinement-ogr-components"></a>

**Ogr components.** For `n>0`, `OGr_n` is the disjoint union of two isomorphic `ℤ`-schemes with geometrically integral fibres, distinguished over every field by parity of `dim(Z∩W)` for the standard `W`. Two points `Z,Z′` lie on the same component iff `dim(Z∩Z′)≡n mod2`. For `n=0` there is one point, with an empty odd component.

For the proof, Use the requested integral component morphism to `Spec(Z×Z)`. Graph charts give geometric integrality; the orthogonal component switch identifies the two pieces. Compute the relative parity and retain the `n=0` exception.

*Needs:* [ogr smooth projective](#refinement-ogr-smooth-projective).

([[120]](#ref-120), Proposition 4.5 and Remark 4.6, p. 14.)

**Checks.**

- At `n=1`, the two coordinate isotropic lines lie in different components because their intersection dimension is zero.

<a id="refinement-ogr-prime-power-count"></a>

**Ogr prime power count.** For prime `p`, `e≥1` and `n≥0`, `#OGr_n(ℤ/p^e)=p^(e n(n−1)/2)∏_{i=1}^n(1+p^(i−n))`. This counts direct summands. At `n=0` the count is1; at `n=1` it is2 at every level, including `p=2`. This target owns the finite-field-to-prime-power lifting count.

For the proof, Use the finite-field maximal-isotropic count at `e=1`. Each smooth reduction fibre has size `p^(n(n−1)/2)`. Induct in e, matching exactly the direct-summand count and its normalization.

*Needs:* [ogr smooth projective](#refinement-ogr-smooth-projective), [number of maximal isotropic subspaces](#number-of-maximal-isotropic-subspaces).

([[120]](#ref-120), Lemma 4.8, p. 14.)

**Checks.**

- For `n=2,p=2,e=2` the formula gives 12 direct-summand points; `n=1` gives 2 at every prime-power level.

- At `n=0` the product is empty and the count is one.
- At `e=1,n=2,p=2` the count is six, and each lift to the next level has two preimages.

<a id="refinement-ogr-schubert-dimension"></a>

**Ogr schubert dimension.** For `0≤r≤n` the locus `S_(n,r)⊂OGr_n` of points with `dim(Z∩W)≥r` and `dim(Z∩W)≡r mod2` is closed and has relative dimension `(n−r)(n+r−1)/2`. Its exact-rank open stratum has this dimension. Fixed-rank random models use the intrinsic measure on `S_(n,r)`; when `r≥2` they cannot be defined by conditioning the ambient OGr law on a positive-probability rank-`r` event.

For the proof, Use the fixed parity component and determinantal intersection equations. Resolve by pairs `(Z,X)` with `X` an `r`-plane in `Z∩W`; over `Gr(r,W)`, select the component of `OGr_(n−r)` on which `dim((Z/X)∩(W/X))` is even. For `n=r` this fibre is the single point `OGr₀`. On the exact-rank locus `X` is unique, and the part of the fibre transverse to `W/X` is the affine space of alternating graph maps. Lower-dimensional vanishing in the requested measure gives the conditioning warning.

*Needs:* [ogr components](#refinement-ogr-components), [ogr smooth projective](#refinement-ogr-smooth-projective), AlgebraicModuliForArithmeticGeometry §§1.1–1.3, [general Oesterlé measure](#general-oesterle-measure).

([[120]](#ref-120), Section 4.4 and Proposition 4.9, pp. 14–15; Section 5.1, p. 15.)

**Checks.**

- At `n=2,r=2` the locus is a point and is null for the dimension-one ambient measure; it still has its own normalized intrinsic point mass.
- At `n=1,r=0` the even-intersection locus is one of the two points of `OGr₁`. Using both components as the resolution fibre would add the excluded odd-intersection point.

- For `r=0`, the dimension is `n(n−1)/2`; for `r=n`, it is zero. The intrinsic measure is normalized in each dimension separately.


### 5.30 Delaunay models at all primes

<a id="refinement-all-rank-delaunay"></a>

**All rank delaunay.** For every prime `p` and `r≥0` the intrinsic fixed-rank isotropic-intersection limit `T_r` equals the alternating cokernel law `A_r`; for a finite symplectic `p`-group `G` its mass is `(#G)^(1−r)/#Sp(G)` times `∏_{i≥r+1}(1−p^(1−2i))`. This is the `p`-primary Delaunay model with corrected rank parameter `r`, and is a model theorem for all `r`. The unconditional arithmetic rank frequencies do not follow from it.

For the proof, Import the `A_r` formula and its mass-one proof. Use the Schubert intrinsic-measure contract and the graph-of-alternating-map comparison in the random-intersection proof. Compare the displayed symplectic weights; make no arithmetic frequency assertion.

*Needs:* [ogr schubert dimension](#refinement-ogr-schubert-dimension), [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit), [bklpr random isotropic intersection law](#bklpr-random-isotropic-intersection-law).

([[120]](#ref-120), Theorem 1.6(c), p. 3; Theorem 1.10, p. 4; Sections 3.6,5.4, pp. 7–11,17–19.)

**Checks.**

- For the trivial symplectic `p`-group, the mass is `∏_{i≥r+1}(1−p^(1−2i))`; the first factor changes when `r` increases.

<a id="refinement-positive-rank-all-primes"></a>

**Positive rank all primes.** Fix `r≥1` and independently choose `T_p` from `A_(p,r)` for every prime `p`. Then `T=⊕_p T_p` is finite almost surely and has the multiplicative Delaunay law with rank parameter `r`. The exceptional probability is `1−∏_{i≥r+1}(1−p^(1−2i))=O_r(p^(−1−2r))`, so its sum over all primes is finite.

For the proof, Apply Mathlib’s infinite product measure to the finite-group probability carriers; realize the coordinate events as measurable independent events using its finite marginals. Bound nontriviality by the first-moment estimate on the infinite product. Apply Borel–Cantelli and multiply independent local masses for each finite symplectic group.

*Needs:* [all rank delaunay](#refinement-all-rank-delaunay), `MeasureTheory.Measure.infinitePi` (Mathlib), `MeasureTheory.Measure.infinitePi_map_restrict` (Mathlib), `MeasureTheory.measure_limsup_atTop_eq_zero` (Mathlib).

([[120]](#ref-120), Theorem 5.15 and proof, p. 21.)

**Checks.**

- At `r=1` the nontriviality probability is `O(p^(−3))`, so infinitely many nontrivial components have probability zero.

<a id="refinement-rank-zero-all-primes-infinite"></a>

**Rank zero all primes infinite.** Independently choose `T_p` from `A_(p,0)` over all primes. The direct sum is infinite almost surely and assigns probability0 to each specified finite group. For any set `P` with `Σ_{p∈P}1/p` finite, `⊕_{p∈P}T_p` is instead finite almost surely. The full-prime rank-zero model is not a probability on finite symplectic-group isomorphism classes.

For the proof, Apply Mathlib’s infinite product measure to the finite-group probability carriers; realize the coordinate events as measurable independent events using its finite marginals. The nontriviality probability is at least `1/p` from the `i=1` product factor and at most `C/p`. Use prime harmonic divergence, independence and the second Borel–Cantelli lemma for all primes. For sparse `P` apply the first Borel–Cantelli lemma.

*Needs:* [all rank delaunay](#refinement-all-rank-delaunay), `MeasureTheory.Measure.infinitePi` (Mathlib), `MeasureTheory.Measure.infinitePi_map_restrict` (Mathlib), `MeasureTheory.measure_limsup_atTop_eq_zero` (Mathlib), `ProbabilityTheory.measure_limsup_eq_one` (Mathlib).

([[120]](#ref-120), Paragraphs following Theorem 5.15, pp. 21–22; derived Borel–Cantelli formulation.)

**Checks.**

- For `P` consisting of one prime the group is finite almost surely; for the set of all primes it is infinite almost surely.

<a id="refinement-symplectic-harmonic-weights"></a>

**Symplectic harmonic weights.** With `w_G=#G/#Sp(G)`, for every `N≥1`, `Σ_{#G=N²}w_G=N^(−1)∏_{p^j∥N}∏_{i=1}^j(1−p^(−2i))^(−1)`, which lies between `1/N` and `2/N`. Thus the bounded-order denominator diverges at least logarithmically, and weights in an order interval `[L,N]` have `O(log(N/L)+1)` total mass. The finite divisor product is reciprocal.

For the proof, Use the symplectic mass formula as a formal power-series identity and Cauchy’s `q`-binomial theorem. Factor over primes. Bound the product of reciprocal `(1−p^(−2i))` factors by `∏_{m≥2}(1−m^(−2))^(−1)=2`: prime powers `p^i` are distinct integers and the larger product telescopes. A `ζ(2)` bound accounts only for `i=1` and is insufficient. Sum the resulting harmonic bounds, with integer-floor endpoint control.

*Needs:* [symplectic finite abelian p groups](#symplectic-finite-abelian-p-groups), [ArithmeticStatisticsPartIV: cauchy q binomial theorem](../ArithmeticStatisticsPartIV/README.md#cauchy-q-binomial-theorem), [bklpr alternating cokernel limit](#bklpr-alternating-cokernel-limit).

([[120]](#ref-120), Lemma 5.17 and Corollary 5.18, pp. 22–23.)

**Checks.**

- For `N=1` the sum is 1; for `N=p` the sole order-p² symplectic group has weight `p/(p²−1)`.

<a id="refinement-sparse-prime-weighted-limit"></a>

**Sparse prime weighted limit.** Let `P` be primes with `Σ_P1/p<∞` and let `f` on finite symplectic `P`-groups satisfy `Σ_H|f(H)|w_H<∞`. Extend `f` to every finite symplectic `G` by `f(G)=f(G_P)`. Then `lim_{N→∞}(Σ_{#G≤N}f(G_P)w_G)/(Σ_{#G≤N}w_G)=c_PΣ_Hf(H)w_H`, where `c_P=∏_{p∈P}∏_{i≥1}(1−p^(1−2i))>0`. These are group-weight averages, not established elliptic-curve averages.

For the proof, For mean-zero `f` truncate the absolutely summable `P`-group tail and use the harmonic interval estimate. Use numerator bound `2ε logN+O(logM)`, denominator at least `(1/2)logN`; `limsup≤4ε` suffices. Let `ε→0`; restore the mean. The stronger printed constant is unnecessary.

*Needs:* [rank zero all primes infinite](#refinement-rank-zero-all-primes-infinite), [symplectic harmonic weights](#refinement-symplectic-harmonic-weights).

([[120]](#ref-120), Theorem 5.16 and proof, pp. 22–24.)

**Checks.**

- For `f` the indicator that the `P`-primary part is trivial, the limit is `c_P`; absolute summability is required before the truncation step.

### 5.31 Injection moments and Kummer summands

<a id="refinement-injection-moment-conjecture"></a>

**Injection moment conjecture.** Fix `q=p^e` with `p` prime and `e≥1`. For `m≥0` define `I_m(S)=#Inj((ℤ/q)^m,S)` on the finite `ℤ/q`-module carrier. For minimal short Weierstrass curves over `ℚ` ordered by invariant height, the conjectural mean of `I_m(Sel_q E)` is `q^(m(m+1)/2)`. For `e>1` this is not a polynomial solely in `#S`. The random-model identity does not transfer to arithmetic without uniform integrability.

This is a stated conjectural proposition, not an established arithmetic limit.

The required API is:

- `Distributions.injection_moment_conjecture.moments`: Each `m` has the specified limiting average.
- `Distributions.injection_moment_conjecture.zero`: `I_0(S)=1`.
- `Distributions.injection_moment_conjecture.uniform_integrability`: A bounded `(m+1)-st` cardinality moment plus empirical distribution convergence suffices for transfer of the `m`-th injection moment.

For the proof, Express the precise finite-height averaging assertion on the supplied arithmetic family. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

*Needs:* [bklpr injection moments](#bklpr-injection-moments), [bklpr selmer conjecture](#bklpr-selmer-conjecture), [ArithmeticStatisticsPartVI: height moments in an arithmetic family](../ArithmeticStatisticsPartVI/README.md#height-moments-in-an-arithmetic-family).

([[120]](#ref-120), Conjecture 5.11 and discussion, pp. 20–21.)

**Checks.**

- `m=0` predicts1.
- `m=1` predicts `q`.
- For `q=4`, `Z/4` has 2 injections from `Z/4`, whereas `(Z/2)^2` has 0 despite equal cardinality.

<a id="bounded-exponent-splitting"></a>

**Bounded-exponent splitting.** For `n>0`, every abelian group killed by `n` is a possibly infinite direct sum of cyclic groups of positive orders dividing `n`. Prove this at the stated generality, without finite generation. Consequently: if `δ:A→B` is a homomorphism between groups killed by `n` and `A/mA→B/mB` is injective for every `m|n`, then `δ` admits an additive retraction; in particular its image is a direct summand. Equivalently the pure subgroup of a bounded group splits.

For the proof, Decompose into primary parts and construct cyclic bases by induction on the exponent, choosing bases of the successive `p`-power layers and lifting compatible generators. For the splitting criterion take `C=coker δ`; the modulo-`m` condition gives surjectivity `B[m]→C[m]`. Lift the generator of every cyclic summand of `C` with its exact order to obtain a section. This also splits Kummer sequences whose torsion in the quotient has such order-preserving lifts.

*Needs:* Mathlib direct sums, quotients and elementary primary decomposition; the infinite cyclic decomposition is a target here, not the finitely generated PID classification.

(BKLPR [[120]](#ref-120), Proposition 6.7 and Lemma 6.11, pp. 27–28; the bounded abelian-group structure theorem, proved here in the infinite form used in that argument.)

**Checks.**

- `⊕_ℕ ℤ/4` is included despite not being finitely generated.
- `2ℤ/4⊂ℤ/4` fails injectivity modulo 2 and does not split.
- `n=1` forces both groups to be zero; requiring the condition only modulo `n=4` would incorrectly accept `2ℤ/4⊂ℤ/4`.


<a id="refinement-kummer-direct-summand"></a>

**Kummer direct summand.** For any field `k`, abelian variety `A/k` and `n>0`, the Kummer image of `A(k)/nA(k)` in `H¹(k,A[n])` is a `ℤ/n`-module direct summand. Interpret cohomology as fppf when `char(k)|n`. This is an algebraic splitting; continuity of a complement is not asserted.

For the proof, For every `m|n`, the `m`-torsion Kummer sequence lifts an order-`m` class of `H¹(k,A)[n]` to an order-`m` class in `H¹(k,A[n])`. Use [bounded-exponent splitting](#bounded-exponent-splitting), including its infinite cyclic decomposition. Lift cyclic generators of `H¹(k,A)[n]` with their exact orders to split the quotient.

*Needs:* [bounded-exponent splitting](#bounded-exponent-splitting), [finite-flat local topology and duality](#flat-local-duality), SelmerIwasawaCohomology §2.12a, AbelianSchemesAndArithmeticModuli §A3.3, HeightsRationalPointsAndObstructions §1.1 (`kummer`).

([[120]](#ref-120), Proposition 6.7 and proof, pp. 27–28.)

**Checks.**

- At `n=1` both the Kummer image and the quotient cohomology are zero; in characteristic `p`, `n=p` must use fppf cohomology.

- For an infinite quotient such as `⊕_ℕ ℤ/p²`, lift each cyclic generator with its exact order; finite generation is not required.
- The inclusion `2ℤ/4⊂ℤ/4` does not split; Kummer order-preserving lifts, rather than bounded exponent alone, supply the splitting.

<a id="refinement-adelic-kummer-direct-summand"></a>

**Adelic kummer direct summand.** For global `k`, `A/k` abelian and `n>0` the adelic Kummer image is an algebraic direct summand of the restricted-product group `H¹(A_k,A[n])`. Choose complements `C_v` to each local Kummer image, using the good unramified integral reference subgroup outside finitely many places; the global complement is `⊕_v C_v`. Replacing it by `∏_v C_v` generally leaves the restricted product.

For the proof, Apply the local algebraic splitting theorem. Outside the finite bad set the Kummer image is the integral reference subgroup. Decompose each adelic class into a product Kummer component and a finitely supported complement component.

*Needs:* [integral flat reference and Kummer annihilators](#flat-integral-kummer), [kummer direct summand](#refinement-kummer-direct-summand), `RestrictedProduct` (Mathlib), SelmerIwasawaCohomology §2.12a.

([[120]](#ref-120), Corollary 6.8 and proof, p. 28.)

**Checks.**

- A complement tuple with nonzero entries at infinitely many good places is excluded unless those entries belong to the integral reference subgroups.

- For a single place this is the local Kummer splitting.
- For `n=1`, every local cohomology group and the adelic complement are zero.

<a id="refinement-global-image-splitting-conjecture"></a>

**Global image splitting conjecture.** Fix a global field `k` and `n≥1`, with the inclusive coefficient-height elliptic family of [global coefficient-model families](#global-coefficient-model-families) (long Weierstrass equations in characteristic2 or3). The image of `H¹(k,E[n])→H¹(A_k,E[n])` is conjectured to be a `ℤ/n`-module direct summand for a density-one subset. The local Kummer splitting theorem does not prove this global-image assertion.

This is a stated conjectural proposition, not an established arithmetic limit.

The required API is:

- `Distributions.global_image_splitting_conjecture.density`: The exceptional height-frequency tends to0.
- `Distributions.global_image_splitting_conjecture.one`: `n=1` has trivial cohomology and splitting.
- `Distributions.global_image_splitting_conjecture.family`: The family uses the source height and characteristic-appropriate equations.

For the proof, Express the precise finite-height averaging assertion on the supplied arithmetic family. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

*Needs:* [global coefficient-model families](#global-coefficient-model-families), SelmerIwasawaCohomology §2.12a, [adelic kummer direct summand](#refinement-adelic-kummer-direct-summand).

([[120]](#ref-120), Conjecture 6.9, p. 28.)

**Checks.**

- `n=1` satisfies splitting for every model.
- As a module diagnostic, the distinguished local subgroup 0 of `Z/4` is a direct summand, while the putative global subgroup `2(Z/4)` has no complementary `Z/4`-submodule. This tests that the conjecture checks the actual global image; it is not an arithmetic counterexample.
- In characteristic2 the denominator does not use short Weierstrass equations.

<a id="refinement-trivial-action-global-splitting"></a>

**Trivial action global splitting.** Let `k` be global, `E/k` elliptic, `n≥1` prime to `char(k)`, and suppose `G_k` acts trivially on `E[n]`. Then the image of `H¹(k,E[n])` in `H¹(A_k,E[n])` is an algebraic direct summand. This special thin family does not prove the density-one conjecture.

For the proof, The Weil pairing gives `µ_n⊂k` and `E[n]≅µ_n²`. For every `m|n`, Chebotarev gives the local-global injectivity of `k×/k×m` into adelic `m`-th-power classes. The purity condition modulo every divisor `m` and [bounded-exponent splitting](#bounded-exponent-splitting) split the image.

*Needs:* [bounded-exponent splitting](#bounded-exponent-splitting), [finite-flat local topology and duality](#flat-local-duality), AbelianSchemesAndArithmeticModuli:A3, SelmerIwasawaCohomology §2.12a, ArithmeticGaloisDuality §§R02.4.2–R02.4.5, D7.6.

([[120]](#ref-120), Lemma 6.10 and Lemma 6.11, p. 28.)

**Checks.**

- At `n=1` the assertion is tautological; at larger `n` retain both trivial torsion action and invertibility of `n` in `k`.

- For a direct sum of constant cyclic torsion modules, the modulo-`m` tests are the corresponding local-global power-class tests.
- The subgroup `2ℤ/4⊂ℤ/4` passes the modulo-four injectivity test but fails the modulo-two test; checking only the exponent does not suffice.


### 5.32 Abelian three-isogeny twist applications

Every mean and rank consequence in this subsection assumes `C` for each degree-three isogeny and each local stratum whose mean is used. Base extension requires `C` over the new field. The complex-place obstruction is pointwise and does not require `C`.

<a id="refinement-abelian-three-isogeny-average"></a>

**Abelian three-isogeny average.** Let `F` be a number field, `φ:A→A′` a degree-three isogeny of abelian varieties, and `Σ⊂F×/F×²` nonempty and specified by finitely many local conditions. Assume `C(F,φ,Σ)`, with the Kummer images of this `A` and `φ`. Count each squareclass once in `H(s)=∏_(v finite, v(s) odd)Nv`. Then `average_(s∈Σ)#Sel_(φ_s)(A_s)=1+average_Σ c(φ_s)`. Use normalized additive Haar on the finite local representative sets and the finite window at infinity; finite unions are denominator-weighted sums.

For the proof, apply the general-abelian orbit count in Layer 2, whose dictionary is exactly BKLOS Theorems 7.1–7.2, not an extension guessed from the elliptic case. The representation and stabilizer depend on the degree-three kernel; the soluble local subsets are the actual Kummer images of `φ`. Their cardinal mass is `#coker/#ker` in every dimension. Under `C` the seven supplier targets give a matching numerator and denominator, and adding the identity yields the mean. This conditional formulation makes no unconditional assertion that the windowed analytic estimates have been formalized or proved merely by a kernel identification.

*Needs:* [ArithmeticStatisticsPartI: positive squareclass denominator](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier), [ArithmeticStatisticsPartIII: number field twist orbit count](../ArithmeticStatisticsPartIII/README.md#refinement-number-field-twist-orbit-count), [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), AbelianSchemesAndArithmeticModuli:A3, SelmerIwasawaCohomology §2.12a.

([[127]](#ref-127), Theorem 2.1, pp. 2–3; Sections 3–8, pp. 5–12.)

**Checks.**

- For a local-ratio-one subfamily the formula predicts mean 2. Keep the height and Haar conventions when passing from elliptic to higher-dimensional A.

<a id="refinement-endomorphism-rank-bound"></a>

**Endomorphism rank bound.** Let `ψ:A→A` factor over `F` as a nonempty chain of degree3 isogenies `φ_i`. Assume `C` for every factor and averaging family, and additionally a constant `c>0`, independent of `s`, such that `log₃#(A_s(F)/ψ_s A_s(F))≥c·rank_Z A_s(F)` for every quadratic twist `s`. Then `limsup average rank A_s(F)≤c^(−1)Σ_i(1+average c(φ_(i,s)))<∞`. The source’s unrestricted `ψ` claim is conditional here, because its `e/t` index estimate is not justified for a general `ℤ[ψ]`-module.

For the proof, Iterate the general-abelian [isogeny-chain exact sequence](#isogeny-factorisation-selmer-exact-sequence) of BKLOS Lemma 9.1 to bound `log₃#Sel_ψ` by the sum of degree-3 Selmer dimensions. Embed the Mordell–Weil quotient in `Sel_ψ` and apply the explicit uniform rank-index hypothesis. Bound each dimension by its cardinality and apply the abelian average theorem.

*Needs:* [abelian three isogeny average](#refinement-abelian-three-isogeny-average), [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), AbelianSchemesAndArithmeticModuli §A6.1, SelmerIwasawaCohomology §2.12a.

([[127]](#ref-127), Theorem 2.2, p. 3; Lemma 9.1 and Section 9 proof, pp. 12–13, corrected conditional formulation.)

**Checks.**

- An endomorphism acting as identity on one product factor cannot use its degree to infer a positive uniform index bound on that factor; the additional `c` hypothesis is mandatory.

<a id="refinement-multiplication-three-rank-bound"></a>

**Multiplication three rank bound.** If `[3]:A→A` factors over `F` as a chain of degree3 isogenies and `C` holds for each factor in the full twist family, the average rank of all quadratic twists `A_s/F` under `H(s)=∏_{v(s) odd}Nv` is bounded. In this case `#A_s(F)/3A_s(F)≥3^(rank A_s(F))`, so the preceding theorem applies with `c=1`. This conclusion needs no assumption that `ℤ[ψ]`-modules have uniform index `e/t`.

For the proof, Mordell–Weil finite generation computes the3-quotient of the free part exactly. In positive dimension the factorization is nonempty, so use the preceding conditional rank bound with `ψ=[3]` and `c=1`. If `dim A=0`, the factorization is empty and every twist has rank zero directly.

*Needs:* [endomorphism rank bound](#refinement-endomorphism-rank-bound), AbelianSchemesAndArithmeticModuli §A3.3, HeightsRationalPointsAndObstructions §1.7 (`fg_points`).

([[127]](#ref-127), Abstract, p. 1; Theorem 2.2 and Section 9, pp. 3,12–13, source-faithful multiplication-by-three specialization.)

**Checks.**

- On a free Mordell–Weil group of `rank r`, the quotient by three has exactly `3^r` elements; torsion can only increase that index.
- For the zero abelian variety, `[3]` is the identity and the degree-three chain is empty. Every twist has rank zero, so this case does not require a factor to which `C` applies.

<a id="refinement-finite-extension-rank-bound"></a>

**Finite extension rank bound.** For every abelian `A/F` there is a finite extension `L/F` and a factorization of `[3]` on `A_L` into degree-three isogenies. Assuming `C` over `L` for each of these factors, the average ranks of all twists of `A_L` over `L` are bounded in the `L`-squareclass height ordering. Take `L` making `A[3]` rational; a complete flag in A[3](L) factors multiplication by3 into degree3 isogenies. Neither a bound over the original `F` nor uniformity as `L` varies is asserted.

For the proof, Pass to the finite3-torsion splitting extension. Use the requested finite subgroup-scheme quotient and flag API to factor `[3]`. Apply the multiplication-by-three rank bound to the new `L`-family, without transferring densities between `F` and `L`.

*Needs:* [multiplication three rank bound](#refinement-multiplication-three-rank-bound), AbelianSchemesAndArithmeticModuli:A3.

([[127]](#ref-127), Theorem 2.3 and preceding deduction, p. 3.)

**Checks.**

- The torsion-splitting extension and complete flag factor `[3]`; all twist averages then use `L`-squareclasses, not the old `F` denominator.

<a id="refinement-elliptic-explicit-twist-rank"></a>

**Elliptic explicit twist rank.** Let `φ:E→E′` be a3-isogeny over a number field `F` and `Σ` a nonempty family defined by finitely many local conditions. Assume `C` for `φ` and its dual on every nonempty ratio stratum of `Σ`. In the unweighted squareclass height ordering, `limsup average rank E_s(F)≤average_Σ(|t(s)|+3^(−|t(s)|))`, with `t(s)=ord₃c(φ_s)`. Only finitely many `t`-values occur; each stratum is a finite union of local rectangles.

For the proof, On a signed `t=m` stratum, use Cassels’ formula to compare `φ` and dual Selmer dimensions after deleting the finitely many rational odd-torsion twists. Use the two isogeny averages and convexity to bound the sum of Selmer dimensions by `|m|+3^(−|m|)`. The exact sequence bounds reduced3-Selmer rank and hence Mordell–Weil rank; average the finite set of strata with proved densities.

*Needs:* [abelian three isogeny average](#refinement-abelian-three-isogeny-average), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula), [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), [selmer ratio classes are locally defined](#selmer-ratio-classes-are-locally-defined), [finitely many twists with rational p torsion](#finitely-many-twists-with-rational-p-torsion), [ArithmeticStatisticsPartIII: number field twist orbit count](../ArithmeticStatisticsPartIII/README.md#refinement-number-field-twist-orbit-count).

([[127]](#ref-127), Theorem 2.4, pp. 3–4; Section 9.1, p. 14.)

**Checks.**

- On `t=0` the rank bound is 1; on `|t|=1` it is 4/3. The strata must have the established local densities.

<a id="attainable-local-three-isogeny-ratios"></a>

**Attainable local three-isogeny ratios.** For every 3-isogeny `φ:E→E′` over a finite extension `L/ℚ_p` with `p≠3`, prove that some quadratic twist has `c(φ_s)=1`, including `p=2`. For `L/ℚ₃` of degree `d`, prove that some twist has `1≤c(φ_s)≤3^d`. Supply the Kodaira/twist and differential tables used in these existence statements, rather than using only CM tables. At three prove `1≤α_(φ,L)≤3^d`, `α_(φ,L)α_(φ̂,L)=3^d`, and `#H¹(L,E[φ])=3^d#E(L)[φ]#E′(L)[φ̂]`.

For the proof, Away from three use the split-multiplicative and IV/IV* exceptions of Proposition 10.4 with the quadratic-twist table, including the dyadic case. At three the formal differential and its dual bound `α`; choose `s` outside the at most two kernel squareclasses for `φ` and `φ̂`. Both rational kernels then vanish and local Kummer duality makes the two integer local ratios multiply to `3^d`, giving the attainable interval. To combine these choices globally apply weak approximation at the finitely many bad, dyadic, three-adic and real places; outside this set all ratios are one. The inhabited rectangle has positive denominator by ArithmeticStatisticsPartI.

*Needs:* [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers), [tamagawa ratio under potentially good reduction](#tamagawa-ratio-under-potentially-good-reduction), EllipticCurves Layer 4 (Tate's algorithm, formal differentials), ArithmeticGaloisDuality (local Euler characteristic and Kummer duality), GlobalNumberFields (weak approximation), [ArithmeticStatisticsPartI: positive squareclass denominator](../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier).

(BKLOS [[127]](#ref-127), Propositions 10.4, 10.6–10.7, Theorem 10.5, Lemmas 10.8–10.9, Corollaries 10.10–10.11 and signature proof, pp. 15–18.)

**Checks.**

- At a good place away from three, the untwisted ratio is one; the theorem also includes bad dyadic places where the odd-prime twist table cannot be used.
- At three the chosen squareclass avoids both kernel characters, so both local cokernel sizes are integers with product `3^d`; a hypothetical ratio below one is excluded for that choice.
- Over a totally real degree-`d` field, the real-place ratios can independently be 1 or 1/3. Weak approximation combines their choices with a finite-place exponent between 0 and `d` to inhabit `T₀`.

<a id="universal-twist-local-table"></a>

**Universal-twist local table.** For `k≥1`, set `t_k=4^k3⁸` and `E_k:y²=x³+(t_k+27)(x+4)²`, with the 3-isogeny having kernel generated by `(0,4√(t_k+27))`. Over every number field `F`, prove the local table for every squareclass `s`: `c_v(φ_s)=1` away from `6∞`; at `v|2` it lies in `{1,3}`; at `v|3` it lies in `{3^[F_v:ℚ₃],3^([F_v:ℚ₃]+1)}`; at a real place it lies in `{1,1/3}` and at a complex place equals `1/3`. In the exceptional twist with rational dual kernel, prove split multiplicative reduction at every place over 2 and 3, giving the extra factors required for `c(φ_s)≥3^(r₂+2)`.

For the proof, Compute the two `j`-invariants and their valuations, apply the local Tamagawa and differential tables, and handle every twist, not a single attainable squareclass. For the exceptional twist `−c₆` has squareclass `1−4^(2k)3¹³−4^(k+1)3⁷`; it is a square in both `ℚ₂` and `ℚ₃` and remains so after extension.

*Needs:* [attainable local three-isogeny ratios](#attainable-local-three-isogeny-ratios) (local tables), [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers), EllipticCurves Layer 4.

(BKLOS [[127]](#ref-127), Example 13.3 and Proposition 13.4, pp. 22–23; the printed kernel-coordinate factor 2 is corrected to 4.)

**Checks.**

- At `x=0`, `y²=16(t_k+27)`; the two nonidentity kernel points have `y`-coordinates `±4√(t_k+27)`.
- At `v|2`, `v(j(E′))=3v(j(E))`; the split multiplicative ratio is 3, not 1/3.
- At `v|3`, `v(j(E))=−2v(3)` and `v(j(E′))=−6v(3)`; the differential factor gives the stated degree-dependent lower bound.
- For `k=1`, the exceptional expression is 1 modulo 8 and modulo 3, so it is a square locally. At `k=0` it is 2 modulo 8, and that argument fails.


<a id="refinement-signature-positive-twists"></a>

**Signature positive twists.** For a number field `F` and an elliptic curve `E/F` with a3-isogeny, assume `C` for that isogeny and its dual on the local ratio strata used below: if `F` is totally real, positive lower proportions of twists have rank0 and3-Selmer rank1; if `F` has at most one complex place and at least one real place, a positive lower proportion has3-Selmer rank1; if `F` is imaginary quadratic, a positive lower proportion has Mordell–Weil rank0 or1 in union. These statements use the squareclass height; the last does not give both proportions separately.

For the proof, Use [attainable local three-isogeny ratios](#attainable-local-three-isogeny-ratios), archimedean Selmer ratios and weak approximation at the finite controlling set of places to prove positive-density support at `t=0` or `|t|=1` under the indicated signatures. Apply the `T₀` and `|T₁|` proportion inequalities. For the imaginary-quadratic case retain the source argument giving the union of low algebraic ranks, with its parity and descent inputs.

*Needs:* [attainable local three-isogeny ratios](#attainable-local-three-isogeny-ratios), [elliptic explicit twist rank](#refinement-elliptic-explicit-twist-rank), [positive proportions of three selmer ranks in local subfamilies](#positive-proportions-of-three-selmer-ranks-in-local-subfamilies), [three isogeny selmer parity](#three-isogeny-selmer-parity), [ArithmeticStatisticsPartIII: number field twist orbit count](../ArithmeticStatisticsPartIII/README.md#refinement-number-field-twist-orbit-count), [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers).

([[127]](#ref-127), Theorem 2.6(i)–(iii), p. 4; Section 10 local ratios, pp. 14–17; Section 11 signature proof, p. 18.)

**Checks.**

- The imaginary-quadratic conclusion is positive density of the union of algebraic ranks zero and one; neither individual density is asserted.

- For a totally real field, independently chosen real squareclasses can cancel the attainable finite-place exponent to inhabit `T₀`; local denominator positivity then gives positive density.
- At most one complex place with at least one real place permits an attained exponent of absolute value one. The construction combines local choices by weak approximation.

<a id="refinement-complex-place-obstruction"></a>

**Complex place obstruction.** For every number field `F` with `r₂` complex places, there exists an elliptic `E/F` with a3-isogeny such that `dim_𝔽₃ Sel₃(E_s)≥r₂` for every quadratic twist `s`. Thus signature hypotheses in the positive-proportion theorem cannot simply be removed. This is an existence construction, not a typical-curve law.

For the proof, Use `E_k:y²=x³+(4^k·3^8+27)(x+4)²` with an integer `k≥1`. The local ratios `at2,3` and infinity give `c(φ_s)≥3^r₂` for every `s`. The local/global Selmer-ratio formula and exact sequence force the Selmer dimension lower bound. In the exceptional dual-torsion twist, the remaining factor `1−4^(2k)3^13−4^(k+1)3^7` is a square in `ℚ₂` and `ℚ₃`: it is 1 modulo 8 and 1 modulo 3. This supplies the split multiplicative cases in Proposition13.4 after any base extension.

*Needs:* [universal-twist local table](#universal-twist-local-table), [selmer ratio of an isogeny](#selmer-ratio-of-an-isogeny), [cassels isogeny selmer ratio formula](#cassels-isogeny-selmer-ratio-formula), [isogeny factorisation selmer exact sequence](#isogeny-factorisation-selmer-exact-sequence), [local selmer ratio via tamagawa numbers](#local-selmer-ratio-via-tamagawa-numbers).

([[127]](#ref-127), Final assertion of Theorem 2.6, p. 4; Example 13.3 and Proposition 13.4, pp. 22–23.)

**Checks.**

- The example must work for every squareclass after one finite choice of `k` satisfying the local conditions; it is not an average-only lower bound.
- `k=1` gives a remaining factor congruent to 1 modulo 8 and modulo 3. At `k=0` it is 2 modulo 8, so the `ℚ₂` square argument requires the stated positive lower bound on `k`.

- In the exceptional rational-dual-kernel twist, every place above 2 and 3 contributes the extra multiplicative factor, giving the required two additional powers of three.


### Supporting probability and arithmetic comparisons

<a id="support-quadratic-probability"></a>

For a second-countable weakly metabolic locally compact quadratic group `V` with `pV=0` and `p·q(v)=0` for every `v`, for a fixed prime `p`, prove that the compact-open quadratic-isotropic reductions form a countable cofinal inverse system, that maximal-isotropic reductions compose and that the inverse-limit topology is the specified Borel structure. Under these group-exponent and quadratic-value hypotheses, use compatible finite uniform laws to obtain a unique Borel probability; prove continuous isometry invariance, almost-sure discreteness and finiteness of intersection with the fixed compact-open maximal isotropic. Infinite `𝔽_p`-dimension gives the limiting Poonen–Rains law, while finite dimension gives its finite intersection law. Source: Poonen–Rains Proposition 2.6, Remark 2.8 and Theorem 2.19, pp. 6–11. The countable projective-measure extension is imported from Mathlib; the quadratic finite reductions and their compatibility are proved here.

For the arithmetic intersection prove the finite-flat theta obstruction and its local invariant normalization, with polar pairing the *negative* Weil-cup product and no division by two. Use global duality to identify the global image and local Kummer image as maximal isotropics and obtain `Sel_λ/Sha¹(k,A[λ])≃Z∩W`. Prove the finite-module Sha1 vanishing criteria separately from any assertion on `Sha(A)`. Characteristic dividing the isogeny degree uses fppf cohomology throughout. Source: Poonen–Rains Proposition 3.3, Corollary 4.6 and Theorem 4.13, pp. 13–21; AbelianSchemesAndArithmeticModuli §A3.6 supplies the theta extension. The finite-flat local, integral and global targets supply the positive-characteristic duality and Kummer adapters; ArithmeticGaloisDuality §D7.6 supplies its characteristic-zero specialization.

For integral quadratic models construct the smooth projective split orthogonal Grassmannian over `ℤ` and prove its finite reduction counts and component parity, including `p=2`. Oesterlé–Serre measure counts the liftable reduction image. In the smooth proper nonempty case the mass is `#X(𝔽_p)p^-d`, and each reduction fibre has `p^d` lifts; the probability mass of a cylinder is its finite relative cardinality. Fixed-rank intersections use the intrinsic measure of their Schubert stratum, not conditioning on an ambient zero-probability rank-`r` event. Source: BKLPoonen–Rains Proposition 2.1, Corollary 2.2, Propositions 4.4–4.9 and §5.1, pp. 5–6 and 12–15.

For the all-prime symplectic model prove the primewise error bound and apply Borel–Cantelli: positive rank has summable nontrivial-primary probabilities, while rank zero has a divergent harmonic tail and yields an almost-sure infinite direct sum. The bounded-order rank-zero group-weight averages use the reciprocal finite product in the harmonic weight identity. They are not a probability on finite groups over all primes. Source: BKLPoonen–Rains Theorems 5.15–5.16 and Lemma 5.17, pp. 21–24.

<a id="support-cm"></a>

<a id="cm-reciprocity"></a>

**CM reciprocity.** Construct `cm_reciprocity` for an imaginary quadratic field `K⊂ℂ`, a fractional `O_K`-ideal `a`, and a maximal-order CM elliptic curve with a chosen analytic uniformization `ξ:ℂ/a≃E(ℂ)` compatible with this embedding on differentials. For `σ∈Aut(ℂ/K)` and an idele `x∈A_K×` whose Artin image is `σ|K^ab`, construct the unique uniformization `ξ′:ℂ/x⁻¹a≃E^σ(ℂ)` with `σξ(t)=ξ′(x⁻¹t)` on `K/a`. Fix Artin reciprocity so a uniformizer acts by arithmetic Frobenius on unramified torsion; the inverse idele acts on the ideal lattice. Prove compatibility with products of ideles, principal ideles and the CM ideal-isogeny action. This main reciprocity theorem is a target here.

For the proof, Develop the ideal action on CM lattices and algebraic isogenies, identify their conjugates and their torsion action through reciprocity, and prove the canonical comparison and composition law. Use the existing complex uniformization and class-field reciprocity carriers; the CM comparison connecting them is included in this target.

*Needs:* EllipticCurves Layers 1–3 (isogenies, Tate modules and complex uniformization), GlobalNumberFields (fractional ideals and ideles), ClassFieldTheory (Artin reciprocity), [CM ideal-isogeny comparison](#cm-ideal-isogeny-comparison).

(Rubin [[55]](#ref-55), Theorem 5.11 and its diagram, pp. 17–18; §5.1, pp. 15–16.)

**Checks.**

- For the trivial idele and identity automorphism, the comparison is the original uniformization.
- A principal idele changes the lattice by the corresponding scalar and acts trivially through the global Artin map; its uniformization comparison cancels that scalar.
- On a prime-to-conductor ideal class, the conjugate CM lattice is in the inverse ideal class. Replacing `x⁻¹a` by `xa` reverses the stated Artin convention.

<a id="cm-hecke-character"></a>

**CM Hecke character.** Construct `cm_hecke_character` for a number field `F⊂ℂ` containing `K` and an elliptic curve `E/F` with `End_F(E)=O_K`, using the chosen differential embedding `ι:K↪ℂ`. It supplies a continuous Hecke character `ψ_E:A_F×/F×→ℂ×`. For `x` and `y=N_(F/K)x`, prove the lattice identity `ψ_E(x)O_K=ι(y_∞)⁻¹(yO_K)`. For finite ideles `x` and every prime ideal `𝔭` of `K`, `ψ_E(x)y_𝔭⁻¹∈O_(K,𝔭)×` and Artin acts on `E[𝔭^∞]` by this element. On ideals `b` prime to the conductor, `ψ_E(b)O_K=N_(F/K)b`. Use the same arithmetic-Frobenius Artin convention as CM reciprocity.

For the proof, Apply CM reciprocity to compare the uniformization of `E` with its conjugate by the Artin image of `x`. The comparison scalar `ψ_fin(x)∈K×` has ideal `yO_K`; put `ψ_E(x)=ι(y_∞)⁻¹ψ_fin(x)`. Prove multiplication, principal-idele triviality, continuity and the finite-idelic torsion identity.

*Needs:* [CM reciprocity](#cm-reciprocity), GlobalNumberFields (norms and Hecke characters), ClassFieldTheory (norm/Artin compatibility), EllipticCurves (CM Tate-module action).

(Rubin [[55]](#ref-55), Theorem 5.15(i)–(ii) and Corollary 5.16, pp. 19–20.)

**Checks.**

- A principal idele has `ψ_E=1`; omitting the infinite norm factor generally violates this identity.
- For a finite local unit idele, the ideal formula forces `ψ_E(x)∈O_K×`.
- At a good prime, the ideal value reduces to the Frobenius endomorphism, fixing the Artin normalization and its inverse in the torsion formula.

<a id="cm-local-unit-character"></a>

**CM local unit character.** Prove `cm_local_unit_character`: for a number field `F` containing `K` and `E/F` with `End_F(E)=O_K`, the CM Hecke character restricted to `O_v×` takes values in `O_K×` and recovers the inertia action on every prime-to-`v` Tate module under local reciprocity. For each fixed finite place extend this finite unit character to an `O_K×`-valued global character using Kummer theory and weak approximation; its inverse twist has trivial prime-to-residue-characteristic inertia and hence good reduction by Néron–Ogg–Shafarevich. At `j=1728` and `j=0` use fourth and sixth twists respectively. Source: Rubin Theorem 5.15 and Corollary 5.22, pp. 19–22.

*Needs:* [CM Hecke character](#cm-hecke-character), ClassFieldTheory (local reciprocity and Kummer characters), GlobalNumberFields (weak approximation), EllipticCurves Layer 4 (Néron–Ogg–Shafarevich).

**Checks.**

- If `E` already has good reduction, the local unit character is trivial.
- Restriction recovers inertia on every Tate module with prime different from the residue characteristic; the residue-characteristic Tate module is not included in this implication.
- For `O_K×` of order four or six the inverse character can require a fourth or sixth twist; a quadratic twist alone is not asserted.

<a id="cm-ideal-isogeny-comparison"></a>

Prove `cm_ideal_isogeny_comparison`: for such `E` and every nonzero ideal `a` of `O_K`, `E[a]` is base-stable, has order `N(a)`, and its quotient retains maximal-order CM; every base-defined CM order admits a base-defined isogeny to maximal order. Keep the ideal-class action and prime-ideal representatives in the inverse isogeny comparison (Rubin Proposition 5.3, Proposition 5.4 and §5.1, pp. 15–16). Normalize the differential action by `a*(ω)=ι(a)ω`, so the formal linear coefficient is `ι(a)` (Rubin Proposition 3.14, p. 11). These are mathematical comparison targets on the elliptic isogeny API.

For CM twists retain the arithmetic CM action: maximal-order CM, all endomorphisms defined over the stated base, and the existence of a twist with good reduction. Then prove the local three-isogeny Tamagawa ratio and differential comparison at every place, including two and three. For nonmaximal orders pass through a base-defined isogeny and use corank invariance, rather than assert that geometric CM alone forces every local ratio one. At `j=0` and 1728 use the appropriate larger twist automorphism group; the squareclass-to-twist map is used with its actual fibre at those exceptional `j`-values. Sources: BKLOS §11, Lemma 11.1 and Theorem 11.2, pp. 18–19, and proof of Theorem 2.7, p. 19; Rubin §5.1, Proposition 5.3, pp. 15–16, Theorem 5.15, pp. 19–20, and Corollary 5.22, pp. 21–22. Cassels–Tate adjointness is supplied by SelmerIwasawaCohomology §4.29; its application yields the exact isogeny Selmer-ratio and parity statements here.

The general endomorphism rank application assumes a uniform constant `c>0` with `log3#(A_s(F)/ψ_sA_s(F))≥c rank A_s(F)`. Prove the bound from that hypothesis and the factorization into degree-three isogenies. For `ψ=[3]` it holds with `c=1` by finite generation. Do not infer it for every `ℤ[ψ]`-module from a degree/exponent ratio. Source: BKLOS Theorem 2.2 and Lemma 9.1, pp. 3 and 12–13; the multiplication-by-three specialization and finite-extension corollary assume `C` for every degree-three factor, over the field where the mean is taken.

### Examples

In a split hyperbolic plane there are two quadratic-isotropic lines, even at `p=2`. Their intersection with a fixed one has dimension zero or one with probability one half. At dimension zero there is one maximal isotropic and its intersection dimension is zero with probability one; no half-parity assertion applies. In a two-dimensional `𝔽₂` space with quadratic form `x²+xy+y²`, every nonzero vector has value one, although its polar form has isotropic lines. This witnesses why the quadratic condition cannot be dropped.

The symmetric two-by-two matrices over `𝔽₃` have rank counts `1,8,18`, totaling 27; bordering a fixed rank-`r` matrix has fibres `3^r`, `2·3^r`, and `3^(n+1)-3^(r+1)` for rank jumps zero, one and two. For `p`-adic alternating matrices the parity of nullity follows the size, so the two size-parity subsequences must be mixed as specified to get the Poonen–Rains law.

For a prime law with half even and half odd mass, the `k`-prime common-parity weight is `2^(k-1)∏w_i` for `k≥1`. At `k=0` the carrier is a singleton of mass one; substituting `k=0` into the scalar factor would incorrectly give one half. A symplectic rank-zero all-prime model is infinite almost surely, whereas restricting to primes with convergent `Σ1/p` yields a finite group almost surely.

The split plane, anisotropic plane and split four-dimensional space in the Checks of §5.4 have forms `xy`, `x²+xy+y²` and `x₁y₁+x₂y₂` over `𝔽₂`. The characteristic-two value-group example is described in §5.26.

**Checks.**

- The diagonal in the split plane equals its polar orthogonal but contains a vector of nonzero quadratic value.
- Every nonzero vector of the anisotropic plane has nonzero quadratic value, so polar isotropy cannot replace quadratic isotropy.
- The split four-dimensional space has six maximal quadratic-isotropic planes, by the count in §5.4.

The locally compact quadratic data carry a continuous quadratic map and a polar topological self-duality. For the parity-coupled law the empty prime set has weight one and mixed-parity rank vectors have weight zero. The normalization theorem assumes summability and exactly half-mass in each parity.

### Dependencies

ArithmeticStatisticsPartI Layer 0 supplies families; ArithmeticStatisticsPartIII Layer 2 supplies the conditional cubic count; ArithmeticStatisticsPartIV §§3.1–3.6 supplies finite-group laws and moments; ArithmeticStatisticsPartV Layer 3 supplies field torsion means; ArithmeticStatisticsPartVI Layer 4 supplies Selmer averages. AnalyticNumberTheoryPartI Layer 3 and AnalyticNumberTheoryPartII §5.29 supply analytic summation, products and character estimates. The quadratic and scalar-determinacy boundaries are the existing Tau Ceti declarations in Scope and ownership. Mathlib supplies product and projective measures. AbelianSchemesAndArithmeticModuli §§A2.2–A2.5, A3.1–A3.7, ArithmeticGaloisDuality §§R02.4.2–R02.4.5, D7.6 and SelmerIwasawaCohomology §§2.10–2.12a, 4.29 supply theta groups, local cohomology, duality and elliptic parity. The three-isogeny applications retain `C(F,φ,Σ)` for every used factor over the actual averaging field.

## Downstream consumers

ArithmeticStatisticsPartVIII consumes the probability and twist targets stated here. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. AnalyticNumberTheoryPartI Layer 3 and AnalyticNumberTheoryPartII §5.29 supply the analytic inputs.

## References

<a id="ref-2"></a>

[2] Ashay A. Burungale and Ye Tian. [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (latest version), 11 October 2025, 7 pp.; Annals of Mathematics 203 (2026), no. 1, 1–13.

<a id="ref-24"></a>

[24] Alexander Smith. [The distribution of ℓ^∞-Selmer groups in degree ℓ twist families I](https://arxiv.org/pdf/2207.05674v2). arXiv:2207.05674v2 (8 February 2023); published J. Amer. Math. Soc. 39 (2026), 1–72.

<a id="ref-25"></a>

[25] Alexander Smith. [The distribution of ℓ^∞-Selmer groups in degree ℓ twist families II](https://arxiv.org/pdf/2207.05143v2). arXiv:2207.05143v2 (8 February 2023).

<a id="ref-26"></a>

[26] Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver, Ari Shnidman. [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://arxiv.org/pdf/1709.09790v2). arXiv:1709.09790v2 (30 November 2017); published Duke Math. J. 168 (2019), 2951–2989.

<a id="ref-27"></a>

[27] Manjul Bhargava, Noam Elkies, Ari Shnidman. [The average size of the 3-isogeny Selmer groups of elliptic curves y² = x³ + k](https://arxiv.org/pdf/1610.05759v1). arXiv:1610.05759v1 (18 October 2016).

<a id="ref-28"></a>

[28] Bjorn Poonen, Eric Rains. [Random maximal isotropic subspaces and Selmer groups](https://arxiv.org/pdf/1009.0287v2). arXiv:1009.0287v2 (12 April 2011); published J. Amer. Math. Soc. 25 (2012), 245–269.

<a id="ref-29"></a>

[29] Manjul Bhargava, Daniel M. Kane, Hendrik W. Lenstra Jr., Bjorn Poonen, Eric Rains. [Modeling the distribution of ranks, Selmer groups, and Shafarevich–Tate groups of elliptic curves](https://arxiv.org/pdf/1304.3971v2). arXiv:1304.3971v2 (6 August 2013); published Cambridge J. Math. 3 (2015), 275–321.

<a id="ref-31"></a>

[31] Manjul Bhargava, Arul Shankar. [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1). arXiv:1312.7333v1 (27 December 2013).

<a id="ref-34"></a>

[34] Daniel M. Kane. [On the ranks of the 2-Selmer groups of twists of a given elliptic curve](https://arxiv.org/pdf/1009.1365v4). arXiv:1009.1365v4 (3 September 2013); published Algebra & Number Theory 7 (2013), 1253–1279.

<a id="ref-35"></a>

[35] Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner. [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2). arXiv:2008.02571v2 (14 September 2021); published Invent. Math. 227 (2022), 517–580.

<a id="ref-36"></a>

[36] Tim Dokchitser. [Notes on the parity conjecture](https://arxiv.org/pdf/1009.5389v2). arXiv:1009.5389v2 (17 January 2012); in Elliptic curves, Hilbert modular forms and Galois deformations, Birkhäuser 2013.

<a id="ref-37"></a>

[37] Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland. [Homological stability for Hurwitz spaces and the Cohen-Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), no. 3, 729–786 (published PDF); compared with arXiv 0912.0325v4 (1 Dec 2015).

<a id="ref-38"></a>

[38] Melanie Matchett Wood. [Random integral matrices and the Cohen Lenstra heuristics](https://arxiv.org/pdf/1504.04391). Amer. J. Math. 141 (2019), 383–398.

<a id="ref-44"></a>

[44] Robert J. Lemke Oliver, Jiuya Wang, Melanie Matchett Wood. [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009). Forum of Mathematics, Pi 13 (2025), e19 (open-access published PDF); compared with arXiv 2110.07712v2.

<a id="ref-45"></a>

[45] Michael Lipnowski, Jacob Tsimerman. [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1). Duke Math. J. 167 (2018), 3403–3453.

<a id="ref-55"></a>

[55] Karl Rubin. [Elliptic Curves with Complex Multiplication and the Conjecture of Birch and Swinnerton-Dyer](https://swc-math.github.io/notes/files/99RubinCM.pdf). 1999 Cetraro notes; public SWC-hosted 68-page author text.

<a id="ref-56"></a>

[56] A. J. de Jong. [Counting elliptic surfaces over finite fields](https://www.math.columbia.edu/~dejong/papers/surfaces2.dvi). Author-hosted DVI, 30 pages; journal reference Moscow Mathematical Journal 2 (2002), 281–311. Locators use the author DVI pagination.

<a id="ref-119"></a>

[119] Bjorn Poonen; Eric Rains. [Random maximal isotropic subspaces and Selmer groups](https://arxiv.org/pdf/1009.0287v2). arXiv:1009.0287v2; all page locators below are the preprint’s printed pages.

<a id="ref-120"></a>

[120] Manjul Bhargava; Daniel M. Kane; Hendrik W. Lenstra Jr.; Bjorn Poonen; Eric Rains. [Modeling the distribution of ranks, Selmer groups, and Shafarevich–Tate groups of elliptic curves](https://arxiv.org/pdf/1304.3971v2). arXiv:1304.3971v2; printed preprint pages.

<a id="ref-127"></a>

[127] Manjul Bhargava; Zev Klagsbrun; Robert J. Lemke Oliver; Ari Shnidman. [3-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://arxiv.org/pdf/1709.09790v2). arXiv:1709.09790v2; printed preprint pages.
