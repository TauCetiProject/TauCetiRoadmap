# Roadmap: arithmetic statistics, Part VI: Selmer averages and arithmetic applications

**Summary.** Compute Selmer averages from locally soluble orbit counts and matching positive family denominators. State the higher-moment, rank and rational-solubility consequences with their precise local, torsion, parity and analytic hypotheses.

## Scope and ownership

This part owns the Selmer averages of the arithmetic-statistics roadmap and their arithmetic applications: the local-mass computation giving average two-Selmer size three, the three-, four- and five-Selmer averages and the two-Selmer second-moment bound, the rank and Sha consequences of these averages, height moments, the hyperelliptic two-Selmer averages and their consequences for odd-degree points and the index, simultaneous algebraic and analytic rank one under supplied modular comparison data, rational solubility of plane cubics from a positive-rank lower count, and the three- and five-Selmer rank applications. Its numbered subsections keep the common layer notation of the roadmap: Layer 0 is the family interface (Part I), Layer 1 the orbit dictionaries (Part II), Layer 2 the counts (Part III), Layer 3 the field and finite-group tools (Parts IV–V), Layer 4 the Selmer means (this part), and Layer 5 the probability and geometric comparisons (Parts VII–VIII). An exact link identifies the supplying part whenever a target of an earlier part is used.

The following boundaries fix the carriers and prevent parallel versions of existing mathematics.

- TauCetiRoadmap.EllipticCurves Layers 1, 4–8 supply isogenies, local point groups, quadratic twists, Mordell–Weil, finite Selmer groups and their exact sequence, and the unique integral minimal short pair over Q. Here the new elliptic-family adapter sends that pair `(A,B)` to `(-3A,-27B)` and tracks the resulting height and local-density factors. Tau Ceti's pointwise `WeierstrassCurve.Affine.Point.naiveHeight` is a height on points and is not this curve-family height.
- SchemeAndStackFoundations §§3.6–3.7 owns unpointed Picard schemes and their degree torsors, the Picard–Brauer obstruction, rational-divisor-class comparison and the section-free Abel maps; TauCetiRoadmap.JacobianChallenge Layer D supplies the Abel maps `Sym^k C → Pic^k`. The hyperelliptic targets below use them without choosing a base point. AbelianSchemesAndArithmeticModuli:A3 supplies theta groups and Cartier-dual isogeny kernels.
- ArithmeticStatisticsPartII §1.12 owns the oriented-ideal dictionary and integral pencil representatives. HeightsRationalPointsAndObstructions §§3.18–3.18c supplies the Bhargava–Gross–Wang route for locally soluble hyperelliptic models: coordinate-chart transport of the supplied pencil orbit parametrization and integral representatives (`PencilSelmerOrbit`, §3.18a); the weighted pencil orbit count, the local masses `a_v` (with `a_∞=2^(−g)`, `a_2=2^g`, `a_p=1` otherwise), the Tamagawa number `tamagawa_SLquotient_two` of `SL_n/μ₂` for even `n`, the codimension-two coefficient tail `codimensionTwo_congruenceTail` and the average bound `average_SelmerPicOne_le_two` (§3.18b); and the biquadratic two-Selmer parity `biquadratic_SelmerParity`, the real effective fraction and the qualitative real-root count (§3.18c). The hyperelliptic targets of §§4.15–4.21 import those statements where they coincide. What they add is the family generality: actual-Div¹-soluble and admissible congruence families, the corank and finite-dimension parities of BGW Appendix A, the order-k averages, the index and Sha consequences, and the corrected two-prime criterion.
- TauCetiRoadmap.ReductiveGroupsPartII RG2.4.4 supplies the Cartan decomposition of a split group over a local field with a hyperspecial maximal compact subgroup; RG2.4.4, “rank-one-and-nonsplit-examples”, also supplies the PGL₂ index `(q+1)q^(k−1)` for k≥1. This part adds the entry/determinant valuation description and transports those indices to its right-coset convention. HeightsRationalPointsAndObstructions §1.17 supplies the elliptic local and real doubling ratios; this part adds the abstract finite-index-group API and the quartic orbit comparisons. Tau Ceti's `AddSubgroup.index_range_nsmul_mul_card_ker` supplies the invariance of `(G : nG)/#G[n]` under passage to a finite-index subgroup; the abstract finite-index calculation here specializes it to an open `Z_p` subgroup.
- TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0 supplies induction and restriction of representations; the Brauer relations and regulator constants built on it are a supporting target of this part.

The pointwise two-Selmer rank identity is supplied by EllipticCurves Layer 7's exact sequence and Layer 6's Mordell–Weil theorem: `dim Sel₂(E)=rank E(Q)+dim E(Q)[2]+dim Sha(E)[2]`. Its explicit descent cardinal formula and rank inequality are already `WeierstrassCurve.Affine.card_range_μ` and `pow_rank_le_card_of_range_μ_le` in `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup`, transported by EllipticCurves' explicit/cohomological comparison. These pointwise facts are prerequisites; the new results here average them in the specified family.

AnalyticNumberTheoryPartII §§5.4–5.7 is a prerequisite of every part of this roadmap and takes no input from any part. The other suppliers used below are lower in the build: SchemeAndStackFoundations; GeometryOfNumbersAndQuadraticArithmetic; AdelicAlgebraicGroups; DiophantineApproximationAndTranscendence; InverseGaloisAndArithmeticFundamentalGroups; AbelianSchemesAndArithmeticModuli; ArithmeticGaloisRepresentations; SelmerIwasawaCohomology; ArithmeticGaloisDuality; NeronModelsAndSemistableAbelianVarieties; HeightsRationalPointsAndObstructions; and DeligneWeightsAndPurity. Specialized facts are local supporting targets. Suppliers that only the other parts use (field counting, class groups, finite quadratic modules, moment determinacy, Hurwitz spaces) are listed in those parts.

## Conventions

All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in x-degree, and changes of variables use row vectors. Cubics use the determinant-twisted GL2 action; quartics use either the ordinary GL2 action for integral orbit enumeration or the determinant-to-the-minus-two action of PGL2 for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=-12`, `J=0`, `Δ=-256`; this fixes the sign. With `E:y²=x³+Ax+B`, `(I,J)=(-3A,-27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The p-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Arithmetic conjectures are propositions, not axioms or unconditional distribution theorems. Distribution convergence does not imply convergence of unbounded moments. Fixed-q degree limits, fixed-degree large-q limits and iterated liminf/limsup limits are kept distinct. Selmer dimension, p-infinity Selmer corank and Mordell–Weil rank are distinguished; passing from corank to rank requires the stated condition on the divisible part of Sha. A degree-one Picard-scheme point, an actual degree-one divisor, and a point over an odd-degree extension are compared only under the explicit Brauer/local-solubility hypotheses.

The elliptic family consists of curves `E_{A,B}` : y² = x³ + Ax + B with A, B ∈ ℤ, 4A³ + 27B² ≠ 0 and no prime ℓ with ℓ⁴ | A and ℓ⁶ | B (one representative of each ℚ-isomorphism class), ordered by H(`E_{A,B}`) = max(4|A|³, 27B²) (Layer 0 and Tau Ceti EllipticCurves Layer 8); a subfamily defined by finitely many congruence conditions is the set of `E_{A,B}` with (A, B) in a finite union of residue classes modulo some N ([family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions)). Averages are first moments in the sense of [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family); `Sel_n(E)` is the n-Selmer group of EllipticCurves Layer 7.

## Exact supplier contracts

From Mathlib use finite sets, `Set.ncard`, `Nat.card`, `Nat.choose`, quotient and orbit types (`QuotientGroup.rightRel`, `MulAction.stabilizer`, `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`, `Subgroup.card_mul_index`, `Subgroup.index_ker`); `Polynomial.discr`, `Polynomial.resultant_deriv`, `Polynomial.resultant_eq_zero_iff`, `PerfectField.separable_iff_squarefree`, `Cubic.discr_eq_prod_three_roots` and `isInteger_of_is_root_of_monic`; `PadicInt`, `padicValRat` and `hensels_lemma`; `Matrix.ProjGenLinGroup`, `Matrix.card_GL_field`, `Matrix.det` and `Submodule.smithNormalForm`; `MeasureTheory.Measure.haarMeasure`, real and extended nonnegative integrals, filters, `Filter.limsup` and `Filter.liminf`; `riemannZeta_eulerProduct_tprod` and `riemannZeta_two`; `WeierstrassCurve.Affine.Point`, `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.HasGoodReduction` and `WeierstrassCurve.HasMultiplicativeReduction`; `ZMod` and `Real.sqrt`. The prime-counting estimate is `Chebyshev.eventually_primeCounting_le` in `Mathlib.NumberTheory.Chebyshev`: for every ε>0 and eventually x, `π(⌊x⌋)≤(log 4+ε)x/log x`. The prime tails below use partial summation from that estimate.

From Tau Ceti use `WeierstrassCurve.Affine.finite_point` (finiteness of the point group over a finite field), `AddSubgroup.index_range_nsmul_mul_card_ker` (for a finite-index subgroup `U ≤ G`, `(G : nG)·#U[n] = #G[n]·(U : nU)`), and the explicit descent statements `WeierstrassCurve.Affine.card_range_μ` and `pow_rank_le_card_of_range_μ_le`.

From TauCetiRoadmap.EllipticCurves require the finite exact sequence `0→E(K)/nE(K)→Sel_n(E/K)→Sha(E/K)[n]→0`, compatibility with localization, naturality under isogenies, and rational torsion. Over Q require a unique integral short pair with no prime satisfying `p⁴|A` and `p⁶|B`, nonsingular discriminant, finiteness of bounded-height pairs and invariance under Q-isomorphism. Over `Q_p` require a finite-index open formal subgroup isomorphic to an open additive `Z_p` subgroup and the reduction/component/Tamagawa dictionary. Over R require the one- or two-component compact Lie-group description. These exact local groups, not only their cardinalities, enter the five-adic labels.

From HeightsRationalPointsAndObstructions §1.17 require `card_quotient_two_padic` and its real counterpart, specialized to dimension one over Q_p and R, for the local-mass contracts. From TauCetiRoadmap.ReductiveGroupsPartII RG2.4.4 require both the PGL₂ indices in “rank-one-and-nonsplit-examples” and the Cartan decomposition `G(E) = ⊔ Kλ(ϖ)K` over dominant cocharacters for split `G` and hyperspecial `K`. From TauCetiRoadmap.ClassFieldTheory Layer 10 require the global Brauer sequence, in particular injectivity of `Br(Q)` into the sum of the local Brauer groups, used in the degree-one comparison. From TauCetiRoadmap.JacobianChallenge Layer D require the Abel maps `Sym^k C → Pic^k`, `D ↦ O(D)`. From TauCetiRoadmap.ModularForms Layer 7 require the analytic continuation and Mellin transform of weight-two newforms used in the analytic-rank inputs. From TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0 require induction, restriction and transitivity for finite groups.

From GeometryOfNumbersAndQuadraticArithmetic §4.1 require the Davenport estimate for a bounded semialgebraic region with bounded complexity, including translates, projections and multiplicity. From AdelicAlgebraicGroups AA.3.3 require GLₙ finite class number one over Q and the integral rational intersection, specialized at n=2. From AdelicAlgebraicGroups Layers 0–4 require Haar integration on the specified adelic group, its gauge-form (Tamagawa) normalization, and arithmetic reduction and fundamental sets. Representation-specific Jacobians, cusps and Tamagawa values below still have to be proved, except where HeightsRationalPointsAndObstructions §3.18b already supplies them.

From SchemeAndStackFoundations §§3.6–3.7 require unpointed Picard degree torsors, the Picard–Brauer exact sequence and the section-free Abel maps. From AbelianSchemesAndArithmeticModuli:A3 require abelian isogenies, duality, polarizations and theta-group commutators, with fppf cohomology when the degree meets the characteristic. From NeronModelsAndSemistableAbelianVarieties §1.7 and Layers 3–5 require local existence, semistable reduction, normalization/Picard exact sequences, graph monodromy and the identity-component comparison used in the twist parity formulas.

From SelmerIwasawaCohomology Layer 0 and §§2.8–2.12a require continuous Kummer localization, finite Selmer and Sha comparisons, Greenberg conditions and p-infinity coranks; Layer 3 supplies Iwasawa control and §4.26 the elliptic Bloch–Kato comparison. Fppf isogeny torsors use AbelianSchemesAndArithmeticModuli A3. From ArithmeticGaloisDuality §§D7.6–D7.7 require the Poitou–Tate annihilator statement and local invariant normalization and local Tate duality. From SelmerIwasawaCohomology §4.29 require the cohomological Cassels–Tate pairing, divisible radicals, finite reduced-primary pairings and dual-isogeny adjointness. From ArithmeticGaloisRepresentations §§1.7–1.9, 2.1–2.3 require residual actions and inertia; ordinary filtrations use SelmerIwasawaCohomology §2.8a. ModularSymbolsPadicLFunctions §§1.1, 1.3 and 2.5 supplies the saturated-period ordinary p-adic L-function and interpolation. ShimuraVarieties §§8.1–8.5, 8.18–8.19, GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10 and SmallRamificationAndAbelianVarietyBaseCases §5.0c supply the quaternionic curve, transfer and marked Jacobian factor. The ordinary divisibility, anticyclotomic implication, Heegner logarithm/low-rank implication, anticyclotomic character nonvanishing and Selmer multiplicity-one statements, and elliptic p-parity are named supporting targets here. They take modular comparison data as hypotheses; control theory alone supplies none of these analytic theorems. From HeightsRationalPointsAndObstructions §3.18 require the degree/index and actual-divisor obstruction comparison, without identifying a rational relative Picard point with a line bundle before the obstruction vanishes; from its §§3.18–3.18c require the statements listed under Scope and ownership, with their hypotheses (locally soluble models of even degree `n=2g+2`, after the coefficient scaling stated there).

From InverseGaloisAndArithmeticFundamentalGroups:IG.2 require quantitative Hilbert irreducibility in the weighted coefficient boxes used here. From DeligneWeightsAndPurity §1.6 require `#C(F_(q^m))=q^m+1-Σ_i α_i^m` and `|#C(F_(q^m))-(q^m+1)|≤2gq^(m/2)` for a smooth proper geometrically connected curve. From DiophantineApproximationAndTranscendence §4.3 require Thue finiteness. The uniform bound of twelve solutions is [a target here](#support-cubic-thue).

From AnalyticNumberTheoryPartII require the binary-cubic interface, through the uniformity estimates of Parts III and V that this part imports: the [binary-cubic action and discriminant](../AnalyticNumberTheoryPartII/README.md#s5-4) (§5.4), [cubic algebras and projective forms](../AnalyticNumberTheoryPartII/README.md#s5-5) (§5.5), [discriminant fibres and weighted cubic coefficients](../AnalyticNumberTheoryPartII/README.md#s5-6) (§5.6) and the [uniform small-degree field-discriminant count](../AnalyticNumberTheoryPartII/README.md#s5-7) (§5.7). The projective equivalence includes nonprincipal rank-two modules, stabilizers and determinant-line discriminants; the cubic descriptions used below are import and compatibility contracts for those objects, not a second construction of them.

### From earlier arithmetic-statistics parts

From ArithmeticStatisticsPartI require [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [binary quartic height](../ArithmeticStatisticsPartI/README.md#binary-quartic-height), [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), [quartic to curve height normalisation](../ArithmeticStatisticsPartI/README.md#quartic-to-curve-height-normalisation), [stabilizer weighted orbit count](../ArithmeticStatisticsPartI/README.md#stabilizer-weighted-orbit-count), [relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j), [quartic discriminant is the polynomial discriminant](../ArithmeticStatisticsPartI/README.md#quartic-discriminant-is-the-polynomial-discriminant), [count of squarefree monic polynomials over a finite field](../ArithmeticStatisticsPartI/README.md#count-of-squarefree-monic-polynomials-over-a-finite-field), [acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function), [all elliptic curves form a large family](../ArithmeticStatisticsPartI/README.md#all-elliptic-curves-form-a-large-family), [relative density](../ArithmeticStatisticsPartI/README.md#relative-density), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), [density one restricts to subfamilies of positive lower density](../ArithmeticStatisticsPartI/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density), [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box), [constant rescaling of a height](../ArithmeticStatisticsPartI/README.md#constant-rescaling-of-a-height), [density denominator comparisons](../ArithmeticStatisticsPartI/README.md#density-denominator-comparisons). Each use retains the hypotheses, weights, cutoffs and normalizations.

From ArithmeticStatisticsPartII’s [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization) require `GenusOneModel.solubleOrbitEquiv`, `GenusOneModel.stabilizerEquiv`, `GenusOneModel.localizeCovering`, `GenusOneModel.selmerOrbitEquiv`, `GenusOneModel.exists_integral` and `GenusOneModel.invariantComparison`. The degree-five transport retains `(I_BS,J_BS)=(6⁴I,6⁶J)`. From ArithmeticStatisticsPartII require [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer), [binary quartic parametrization of e mod 2e](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e), [stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion), [local integral representatives of soluble quartics](../ArithmeticStatisticsPartII/README.md#local-integral-representatives-of-soluble-quartics), [ternary cubic forms and their invariants](../ArithmeticStatisticsPartII/README.md#ternary-cubic-forms-and-their-invariants), [invariance of ternary cubic invariants](../ArithmeticStatisticsPartII/README.md#invariance-of-ternary-cubic-invariants), [refinement genus one stabilizer schemes](../ArithmeticStatisticsPartII/README.md#refinement-genus-one-stabilizer-schemes), [marked quartic selmer embedding](../ArithmeticStatisticsPartII/README.md#marked-quartic-selmer-embedding), [refinement field pencil stabilizers](../ArithmeticStatisticsPartII/README.md#refinement-field-pencil-stabilizers), [refinement locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), [refinement good prime integral pencils](../ArithmeticStatisticsPartII/README.md#refinement-good-prime-integral-pencils), [refinement integral soluble pencils](../ArithmeticStatisticsPartII/README.md#refinement-integral-soluble-pencils). Each use retains the hypotheses, weights, cutoffs and normalizations.

From ArithmeticStatisticsPartIII require [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [uniformity estimate for infinitely many congruence conditions](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-infinitely-many-congruence-conditions), [refinement ternary cubic acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-ternary-cubic-acceptable-count), [refinement quaternary acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-quaternary-acceptable-count), [refinement quinary acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-quinary-acceptable-count), [refinement smoothed quaternary count](../ArithmeticStatisticsPartIII/README.md#refinement-smoothed-quaternary-count), [refinement smoothed orbit unfolding](../ArithmeticStatisticsPartIII/README.md#refinement-smoothed-orbit-unfolding), [refinement pencil finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-finite-congruence-count), [refinement pencil infinite weight upper bound](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-infinite-weight-upper-bound), [refinement large coefficient family tail](../ArithmeticStatisticsPartIII/README.md#refinement-large-coefficient-family-tail), [refinement ternary cubic finite count](../ArithmeticStatisticsPartIII/README.md#refinement-ternary-cubic-finite-count). Each use retains the hypotheses, weights, cutoffs and normalizations.

From ArithmeticStatisticsPartV require [cubic fields totally ramified at large primes are sparse](../ArithmeticStatisticsPartV/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse). Each use retains the hypotheses, weights, cutoffs and normalizations.

## How to read the build

This README specifies the mathematics; `Suggested.lean` states the headline theorems expressible on pinned carriers, with the definitions needed to state them. The sections below state every target with its hypotheses, source locator, API and Checks. The module docstring identifies headline statements requiring arithmetic or geometric objects absent from the pins. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

## Layer 4: Selmer averages and arithmetic applications

The two-Selmer calculation is a quotient of two asymptotics with positive matching local masses. The local Kummer index contributes two at p=2 and one half at infinity; their product is one, and the PGL2 Tamagawa factor is two. Higher Selmer means use their own integral representations. Rank and analytic-rank applications specify separately which parity, residual, ordinary and local-restriction hypotheses they need.

### 4.1 Height averages and rational orbit weights

<a id="rational-orbit-weight"></a>

**Rational orbit weight.** Let a group G act on a set V, let Γ ≤ G be a subgroup and Y ⊆ V a Γ-stable subset. For v ∈ V put `G_{v,Y}` := {g ∈ G : g·v ∈ Y}; it is a union of right cosets Γg. The orbit weight of v is `w_{Γ,Y}(v)` := #(Γ\`G_{v,Y}`), the number of right cosets Γg contained in `G_{v,Y}` (a natural number when the coset set is finite; the value 0 marks an infinite set, following Nat.card), and the orbit count is `n_{Γ,Y}(v)` := #(Γ\ (G·v ∩ Y)). For binary quartic forms, with `PGL_2` acting through the twisted action `γ·f(x,y) = (det γ)^{-2} f((x,y)·γ)` of Layer 0: the global weight of f ∈ `V_Z` is m(f) := `w_{PGL_2(Z),V_Z}(f)` for G = `PGL_2(Q)` acting on `V_Q`, and the local weight of f ∈ `V_{Z_p}` is `m_p(f) := w_{PGL_2(Z_p),V_{Z_p}}(f)` for G = `PGL_2(Q_p)` acting on `V_{Q_p}`; `PGL_2(Z)` and `PGL_2(Z_p)` are the images of `GL_2(Z)` and `GL_2(Z_p)`. Equivalently m(f) = `#[PGL_2(Z)\PGL_2(Q)_f]` and `m_p(f)` = `#[PGL_2(Z_p)\PGL_2(Q_p)_f]` with `PGL_2(Q)_f` := {γ : γ·f ∈ `V_Z`}, the description used in the proof of Proposition 3.6.

Y is Γ-stable, so that membership g·v ∈ Y depends only on the right coset Γg. The action is the twisted action (21)/(32): the centre acts trivially and I, J are invariant. With the untwisted action every scalar would stabilise the invariants only up to a power, and `G_{v,Y}` would not descend to `PGL_2`. The source defines m(f) as the stabilizer sum `Σ_{f'∈B(f)}` #`Aut_Q(f')`/#`Aut_Z(f')`; the coset count is equal to it whenever `Aut_Q(f)` is finite (lemma orbit-weight-as-a-stabilizer-sum), in particular whenever Δ(f) ≠ 0.

Required API:

- `orbitWeight`: `w_{Γ,Y}(v)` = #(Γ\{g ∈ G : g·v ∈ Y}), counted with Nat.card.

- `orbitCount`: `n_{Γ,Y}(v)` = #(Γ\ (G·v ∩ Y)), counted with Nat.card.

- `one_le_orbitWeight`: If v ∈ Y and the coset set Γ\`G_{v,Y}` is finite then 1 ≤ `w_{Γ,Y}(v)`.

- `orbitWeight_smul`: `w_{Γ,Y}(g·v)` = `w_{Γ,Y}(v)` for every g ∈ G.

- `orbitWeight_eq_one_iff`: For v ∈ Y: `w_{Γ,Y}(v)` = 1 if and only if `G_{v,Y}` = Γ.

- `orbitWeight_of_eq_top`: If Γ = G and v ∈ Y then `w_{Γ,Y}(v)` = 1.

- `orbitCount_le_orbitWeight`: If `Stab_G(v)` is finite and both counts are finite then `n_{Γ,Y}(v)` ≤ `w_{Γ,Y}(v)`, with equality exactly when `Stab_Γ(v')` = `Stab_G(v')` for every v' ∈ G·v ∩ Y (from orbit-weight-as-a-stabilizer-sum).

- `binaryQuarticWeight`: m(f) for f ∈ `V_Z`: the orbit weight for `PGL_2(Z)` ≤ `PGL_2(Q)` acting on `V_Q` with Y = `V_Z`.

- `localBinaryQuarticWeight`: `m_p(f)` for f ∈ `V_{Z_p}`: the orbit weight for `PGL_2(Z_p)` ≤ `PGL_2(Q_p)` acting on `V_{Q_p}` with Y = `V_{Z_p}`.

- `binaryQuarticWeight_smul`: m(γ·f) = m(f) for γ ∈ `PGL_2(Q)` with f, γ·f ∈ `V_Z`; likewise `m_p` over `Q_p`.

Form `G_{v,Y}` ⊆ G and its image in the right-coset space Γ\G; `w_{Γ,Y}(v)` is the cardinality of that image. Γ-stability of Y gives (γg)·v ∈ Y ⟺ g·v ∈ Y, so `G_{v,Y}` is a union of right Γ-cosets. Specialise to (G, Γ, Y) = (`PGL_2(Q)`, `PGL_2(Z)`, `V_Z`) and (`PGL_2(Q_p)`, `PGL_2(Z_p)`, `V_{Z_p}`), using the twisted action of [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form) descended to `PGL_2` (the scalar matrices act trivially).

*Needs:* [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), `Matrix.ProjGenLinGroup` (Mathlib), `QuotientGroup.rightRel` (Mathlib), `Nat.card` (Mathlib), `PadicInt` (Mathlib).

([[1]](#ref-1), §3.2, p. 24, definition of m(f); [[1]](#ref-1), Proof of Proposition 3.6, pp. 24–25.)

**Checks.**

- For `S_3` acting on Fin 3 by permutation, Γ = ⊥ and Y = {0}: `w_{Γ,Y}(0)` = 2.

- For Γ = ⊤ and Y = Set.univ, `w_{Γ,Y}(v)` = 1 for every v.

- In the `S_3` example, `n_{Γ,Y}(0)` = 1 ≠ 2 = `w_{Γ,Y}(0)`: the weight is not the number of Γ-orbits in the G-orbit.

- ZMod 6 acting on itself by addition, Γ = {0, 3}, Y = {0, 1, 3, 4}: `w_{Γ,Y}(0)` = 2 = `n_{Γ,Y}(0)`.

- For every odd prime p, `m_p(x⁴ − y⁴)` = 1 (the discriminant −256 is a p-adic unit).

- For v ∈ Y the identity coset lies in Γ\`G_{v,Y}`, so `w_{Γ,Y}(v)` ≥ 1 whenever it is finite.

- w is G-invariant: w(g·v) = w(v), through the bijection `Γh ↦ Γhg^{-1}` of coset sets.

<a id="locally-soluble-forms-attached-to-a-family"></a>

**Locally soluble forms attached to a family.** Let F be a family of elliptic curves over Q defined by congruence conditions (Layer 0), with invariant set Inv(F) = {(I(E), J(E)) : E ∈ F} ⊆ Z², local sets `Inv_p(F)` ⊆ Z_p² and sign set `Inv_∞(F)` ⊆ R². Define S(F) := {f ∈ `V_Z` : f is locally soluble and (I(f), J(f)) = (2⁴I, 2⁶J) for some (I, J) ∈ Inv(F)}, each `PGL_2(Z)`-orbit weighted by 1/m(f); for every prime p, `S_p(F)` := {f ∈ `V_{Z_p}` : f is `Q_p`-soluble, 2⁴ | I(f) and 2⁶ | J(f) in `Z_p`, and `(2^{-4}I(f), 2^{-6}J(f)) ∈ Inv_p(F)`}, weighted by 1/`m_p(f)`; and `S_∞(F)` := {f ∈ `V_R` : f is R-soluble and (I(f), J(f)) ∈ `Inv_∞(F)`}. Here a form over a field K is K-soluble when z² = f(x, y) has a solution with x, y, z ∈ K and (x, y) ≠ (0, 0), and locally soluble means R-soluble and `Q_p`-soluble for every p (Layer 1). The set `S_p(F)` is the local condition set; the source calls `S_p(F)` the p-adic closure of S(F) and then uses exactly this description.

F is presented as `F_Σ` by closed local sets `Σ_p` with null boundary (Layer 0), so that `Inv_p(F)` ⊆ `Σ_p` is relatively closed in the nonsingular locus. This does not by itself imply null boundary for `Inv_p(F)`; that additional assertion is justified in the positive-mass case at count-of-curves-in-a-large-family. The scaling (2⁴, 2⁶) is forced by Theorem 3.5 (Layer 1): Selmer elements of `E^{I,J}` are classes of integral forms with invariants (2⁴I, 2⁶J), not (I, J). Because `Inv_∞(F)` is a union of sign conditions, it is invariant under (I, J) ↦ (λ²I, λ³J) for λ > 0; in particular (2⁴I, 2⁶J) ∈ `Inv_∞(F)` iff (I, J) ∈ `Inv_∞(F)`.

Required API:

- `locallySolubleSet`: S(F) ⊆ `V_Z`.

- `localSolubleSet`: `S_p(F)` ⊆ `V_{Z_p}`.

- `realSolubleSet`: `S_∞(F)` ⊆ `V_R`.

- `invariants_of_mem_locallySolubleSet`: If f ∈ S(F) then 2⁴ | I(f), 2⁶ | J(f) and (I(f)/2⁴, J(f)/2⁶) ∈ Inv(F).

- `locallySolubleSet_smul`: S(F) is stable under `PGL_2(Z)`, `S_p(F)` under `PGL_2(Z_p)` and `S_∞(F)` under `PGL_2(R)`; moreover for γ ∈ `PGL_2(Q_p)` with f, γ·f ∈ `V_{Z_p}`, f ∈ `S_p(F)` iff γ·f ∈ `S_p(F)`.

- `disc_ne_zero_of_mem_localSolubleSet`: Every f ∈ `S_p(F)` has Δ(f) ≠ 0, because `Inv_p(F)` excludes Δ = 0.

- `mem_locallySolubleSet_iff`: For f ∈ `V_Z`: f ∈ S(F) iff f ∈ `S_∞(F)` and f ∈ `S_p(F)` for every prime p (promoted to the lemma locally-soluble-set-is-cut-out-by-local-conditions).

Define the three sets as subsets of `V_Z`, `V_{Z_p}` and `V_R` through the invariants I, J of [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants) and the solubility predicates of Layer 1. Attach the weights 1/m and 1/`m_p` of rational-orbit-weight. Record `PGL_2(Z)`- (resp. `PGL_2(Z_p)`-, `PGL_2(R)`-) stability: solubility and the invariants are preserved by the twisted action.

*Needs:* [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [rational orbit weight](#rational-orbit-weight).

([[1]](#ref-1), §3.2, p. 24; [[1]](#ref-1), §3.3, p. 25 and proof of Proposition 3.9, p. 26; [[1]](#ref-1), §3.6, p. 33.)

**Checks.**

- x⁴ (Δ = 0) ∉ `S_p(F)` for every prime p and every family F.

- x³y − 16xy³ = xy(x − 4y)(x + 4y) has invariants (48, 0) = (2⁴·3, 2⁶·0) and a rational root, so it lies in S(F) for the family of all curves (it is the identity class for E: y² = x³ − x).

- −x⁴ − y⁴ is negative definite, hence not R-soluble, hence in no `S_∞(F)`.

- x³y − xy³ has I = 3, not divisible by 2⁴, so it lies in no S(F).

<a id="local-masses-of-a-family"></a>

**Local masses of a family.** For (I, J) in a field K ⊇ Q with Δ(I, J) = (4I³ − J²)/27 ≠ 0 let `E^{I,J}: y² = x³ − (I/3)x − J/27`. For a family F defined by congruence conditions define, with dIdJ the Haar probability measure on Z_p² and the Lebesgue measure on R²: `M_p(V, F) := ∫_{Inv_p(F)} #(E^{I,J}(Q_p)/2E^{I,J}(Q_p)) / #E^{I,J}(Q_p)[2] dIdJ`; `M_∞(F; X) := ∫_{(I,J) ∈ Inv_∞(F), H(I,J) < X} dIdJ`; `M_∞(V, F; X) := ∫_{(I,J) ∈ Inv_∞(F), H(I,J) < X} #(E^{I,J}(R)/2E^{I,J}(R)) / #E^{I,J}(R)[2] dIdJ`. The unweighted local mass `M_p(F) = ∫_{Inv_p(F)} dIdJ` is the local density of the family at p supplied by [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions).

The integrands are finite: `E^{I,J}(K)[2]` has at most 4 elements, and E(`Q_p`)/2E(`Q_p`), E(R)/2E(R) are finite (local-two-descent-index, archimedean-selmer-ratio-is-one-half). The measure on Z_p² is the Haar probability measure, so `M_p(F)` ≤ 1; the archimedean measure is Lebesgue measure in the coordinates (I, J), with the height H(I, J) = max{|I|³, J²/4} of Layer 0. The curve `E^{I,J}` is written in the source's normalisation (Theorem 3.2); for integral (I, J) = (−3A, −27B) it is `E_{A,B}`.

Required API:

- `localSelmerMass`: `M_p(V, F)`.

- `archimedeanMass`: `M_∞(F; X)`.

- `archimedeanSelmerMass`: `M_∞(V, F; X)`.

- `archimedeanMass_homogeneous`: `M_∞(F; X) = X^{5/6} M_∞(F; 1)` and `M_∞(V, F; X) = X^{5/6} M_∞(V, F; 1)` for X > 0, since H(λ²I, λ³J) = λ⁶H(I, J).

- `archimedeanMass_pos`: `M_∞(F; X)` > 0 for X > 0 (`Inv_∞(F)` is a nonempty open cone).

- `localSelmerMass_nonneg`: 0 ≤ `M_p(V, F)` ≤ 2 `M_p(F)`.

- `archimedeanMass_of_sign`: `M_∞(F; X) = (8/5)X^{5/6}`, `(32/5)X^{5/6}` or `8X^{5/6}` for the three sign conditions.

Define the integrands as functions of (I, J) on {Δ ≠ 0} and integrate over the local invariant sets of Layer 0. Measurability: the integrands are locally constant on {Δ ≠ 0} (they take finitely many values determined by the sign of Δ at ∞, and by local-two-descent-index at p).

*Needs:* [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [binary quartic height](../ArithmeticStatisticsPartI/README.md#binary-quartic-height), `MeasureTheory.Measure.haarMeasure` (Mathlib), `WeierstrassCurve.Affine.Point` (Mathlib).

([[1]](#ref-1), Proposition 3.9, (54), p. 26; [[1]](#ref-1), §3.5, (68)–(69), p. 32.)

**Checks.**

- For `Inv_∞` = {Δ > 0}: `M_∞(F; X) = (8/5)X^{5/6}`.

- For `Inv_∞` = {Δ < 0}: `M_∞(F; X) = (32/5)X^{5/6}`.

- `M_∞(V, F; 1)` = `M_∞(F; 1)`/2 ≠ `M_∞(F; 1)`: the archimedean Selmer mass is not the unweighted mass.

- `M_∞(F; X)` = 0 for X ≤ 0.

- For the family of all curves `M_2(V, F) = 2(1 − 2^{-10})`, twice the local density at 2.

- For `Inv_∞(F)` = {Δ ≠ 0}, `M_∞(F; X) = 8X^{5/6}`, the sum of the two sign cases (source (24), (25)).

- For the family of all curves: `M_p(F) = 1 − p^{-10}` for p ≥ 5, `M_3(F) = 3^{-4}(1 − 3^{-10})` and `M_2(F) = 1 − 2^{-10}`, so ∏_p `M_p(F)` = 1/(81 ζ(10)).

- `M_p(V, F)` = `M_p(F)` for odd p and `M_2(V, F)` = 2M_2(F); `M_∞(V, F; X)` = `M_∞(F; X)`/2 (local-selmer-mass-ratios).

<a id="average-over-a-height-ordered-family"></a>

**Average over a height ordered family.** Let F be an arithmetic family in the sense of Layer 0 (a set with a height h having finite sublevel sets) and φ a real function on F. For X ∈ R let N(F; X) := #{E ∈ F : h(E) < X} and `Avg_F(φ; X)` := (`Σ_{E ∈ F, h(E) < X}` φ(E)) / N(F; X) (with value 0 when N(F; X) = 0). φ has average c over F if `Avg_F(φ; X)` → c as X → ∞; its upper average is `limsup_{X→∞}` `Avg_F(φ; X)`. For elliptic curves over Q the height is H(E) = max{4|A|³, 27B²} or H'(E) = max{|I(E)|³, J(E)²/4}; since 27H = 4H' (Layer 0) the two orderings give the same averages and upper averages. The average size of the 2-Selmer group over F is the average of E ↦ #`S_2(E)`. The Lean definitions `minimalShortPairs`, `shortCurve`, `shortPairSublevel` and `shortPairAverage` specialize this construction to minimal nonsingular integral short pairs, strict real height cutoffs and the actual family denominator. The sum over a finite sublevel is written as `tsum`; an empty sublevel still has average zero.

The average is a limit of ratios of finite sums; its existence is part of any theorem asserting it. Upper averages (limsup) are used for statements, such as the rank bound, that assert no limit. Rescaling h to c·h with c>0 changes N(F; X) into `N_h(F; X/c)`, and `Avg_{c·h}(φ;X)`=`Avg_h(φ;X/c)`. Limits and limsups as X → ∞ are unchanged; finite-cutoff averages need not agree at the same X.

Required API:

- `familyAverage`: `Avg_F(φ; X)` = (`Σ_{h(E)<X}` φ(E))/N(F; X).

- `HasFamilyAverage`: The proposition `Avg_F(φ; X)` → c as X → ∞.

- `upperFamilyAverage`: `limsup_{X→∞}` `Avg_F(φ; X)`.

- `hasFamilyAverage_const`: If F is infinite, the constant function c has average c.

- `HasFamilyAverage.add`: Averages add: if φ has average c and ψ has average d then φ + ψ has average c + d.

- `HasFamilyAverage.const_mul`: If φ has average c then aφ has average ac.

- `upperFamilyAverage_mono`: If φ ≤ ψ pointwise, `Avg_F(ψ; X)` is eventually bounded above and `Avg_F(φ; X)` is cobounded below along atTop, then the real-valued upper average of φ is at most that of ψ. Nonnegative φ supplies the lower condition. Real limsup has junk values for functions tending to −∞, so the lower condition cannot be dropped.

- `HasFamilyAverage.upperFamilyAverage_eq`: If φ has average c then its upper average is c.

- `hasFamilyAverage_rescale_iff`: For c > 0, φ has average d for the height h iff it has average d for the height c·h.

Define N(F; X) and the partial sums with the counting API of [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family) (strict inequality h < X, as in the source). Define the average as a filter limit at X → ∞ and the upper average as the limsup.

*Needs:* [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), [quartic to curve height normalisation](../ArithmeticStatisticsPartI/README.md#quartic-to-curve-height-normalisation), `Filter.limsup` (Mathlib).

([[1]](#ref-1), Theorem 1.1 and Corollary 1.2, pp. 1–2; [[1]](#ref-1), §3, p. 22.)

**Checks.**

- For an infinite family, the constant function 1 has average 1.

- For X below every height, `Avg_F(φ; X)` = 0.

- For the family of elliptic curves, an average with respect to H equals the average with respect to H' = (27/4)H.

- `Avg_F(φ; X)` is a ratio, not the partial sum: for φ = 1 the partial sum N(F; X) tends to ∞ while the average is 1.

- The constant function c has average c over any infinite family.

- Over all elliptic curves the indicator of {B = 0} has average 0 (`#{A : 4|A|³ < X} ≍ X^{1/3}` while `N ≍ X^{5/6}`).

- For positive integers with h(n)=n, φ(n)=n and strict cutoff X=5, `Avg_h(φ;5)`=5/2 whereas `Avg_{2h}(φ;5)`=3/2. The limiting-average rescaling statement must not assert equality at the same finite cutoff.

<a id="orbit-weight-as-a-stabilizer-sum"></a>

**Orbit weight as a stabilizer sum.** In the setting of rational-orbit-weight let v ∈ Y with `Stab_G(v)` finite and Γ\ (G·v ∩ Y) finite. Then `w_{Γ,Y}(v)` = `Σ_{Γv' ∈ Γ\ (G·v ∩ Y)}` #`Stab_G(v')` / #`Stab_Γ(v')`, and #`Stab_G(v')` = #`Stab_G(v)` for every v' ∈ G·v. Consequently `n_{Γ,Y}(v)` ≤ `w_{Γ,Y}(v)` ≤ #`Stab_G(v)`·`n_{Γ,Y}(v)`, and `w_{Γ,Y}(v)` = `n_{Γ,Y}(v)` iff `Stab_Γ(v')` = `Stab_G(v')` for every v' ∈ G·v ∩ Y; in particular w = n when `Stab_G(v)` = 1. For binary quartic forms: m(f) = `Σ_{f' ∈ B(f)}` #`Aut_Q(f)`/#`Aut_Z(f')` and `m_p(f)` = `Σ_{f' ∈ B_p(f)}` #`Aut_{Q_p}(f)`/#`Aut_{Z_p}(f')`, and for the `PGL_2(Z_p)`-orbits `f_1`, …, `f_k` inside one `PGL_2(Q_p)`-class, `Σ_i` 1/#`Aut_{Z_p}(f_i)` = `m_p(f)`/#`Aut_{Q_p}(f)`.

`Stab_G(v)` finite; for binary quartic forms with Δ(f) ≠ 0 the stabilizer in `PGL_2(K)` is isomorphic to `E^{I,J}(K)[2]` (Layer 1, Theorem 3.2), of order at most 4. `Stab_Γ(v')` = Γ ∩ `Stab_G(v')` is a subgroup of `Stab_G(v')`, so each ratio is a positive integer.

The orbit map `G_{v,Y}` → G·v ∩ Y, g ↦ g·v, is surjective and Γ-equivariant, so it induces a surjection Γ\`G_{v,Y}` → Γ\ (G·v ∩ Y). The fibre over Γv' with v' = g'·v is {Γg : g·v ∈ Γ·v'} = Γ\ (Γg'`Stab_G(v)`), in bijection with `(g'^{-1}Γg' ∩ Stab_G(v))\Stab_G(v)` ≅ `Stab_Γ(v')`\`Stab_G(v')`, of size #`Stab_G(v')`/#`Stab_Γ(v')` by Lagrange (mathlib:Subgroup.card_mul_index). Stabilizers along one G-orbit are conjugate, so #`Stab_G(v')` = #`Stab_G(v)`; sum over the fibres. The ratio is ≥ 1 with equality iff `Stab_Γ(v')` = `Stab_G(v')`, which gives the comparison with n and the equality criterion. For the last formula apply the first one inside the class of f and use `m_p(f_i)` = `m_p(f)`.

*Needs:* [rational orbit weight](#rational-orbit-weight), [stabilizer weighted orbit count](../ArithmeticStatisticsPartI/README.md#stabilizer-weighted-orbit-count), `MulAction.stabilizer` (Mathlib), `Subgroup.card_mul_index` (Mathlib).

([[1]](#ref-1), §3.2, p. 24; [[1]](#ref-1), Proof of Proposition 3.6, p. 24; [[1]](#ref-1), Proof of Corollary 3.8, p. 26.)

**Checks.**

- For `S_3` acting on {0,1,2} with Γ = 1 and Y = {0}: the sum has one term #`S_2`/1 = 2 = w(0).

- If Γ = G the sum is Σ 1 over the single orbit, giving w = 1.

- The identity `Σ_i` φ(`f_i`)/(`m_p(f_i)`#`Aut_{Z_p}(f_i)`) = φ(f)/#`Aut_{Q_p}(f)` in the proof of Corollary 3.8 is the last formula.

### 4.2 Local translates and the global weight product

<a id="cartan-decomposition-of-pgl2-over-qp"></a>

**Cartan decomposition of pgl2 over qp.** For every prime p and every γ ∈ `GL_2(Q_p)` there are `k_1`, `k_2` ∈ `GL_2(Z_p)` and integers a ≤ b with γ = `k_1`·diag(p^a, p^b)·`k_2`, and (a, b) is uniquely determined by γ (a = min of the valuations of the entries, a + b = `v_p(det γ)`). Consequently every element of `PGL_2(Q_p)` outside `PGL_2(Z_p)` lies in `PGL_2(Z_p)`·diag(1, p^k)·`PGL_2(Z_p)` for a unique integer k ≥ 1, and each such double coset is a finite union of `p^{k−1}(p + 1)` right cosets `PGL_2(Z_p)`·g.

`Z_p` is a principal ideal domain (a discrete valuation ring). The statement is about `GL_2` and its image `PGL_2` = `GL_2`/`Q_p`^×; scaling by p^m shifts (a, b) to (a + m, b + m), so the `PGL_2` invariant is k = b − a.

The decomposition and the uniqueness of the double coset are the split `GL_2` case of the Cartan decomposition of TauCetiRoadmap.ReductiveGroupsPartII RG2.4.4, with K = `GL_2(Z_p)` hyperspecial and λ = (a, b) dominant; what is added here is the description of (a, b) by valuations and transport of the index to right cosets. Directly: multiply γ by a power of p so that it has entries in `Z_p`; then the `Z_p`-lattice Z_p²·γ is a submodule of Z_p². Apply the Smith normal form over the PID `Z_p` (mathlib:Submodule.smithNormalForm): there is a basis of Z_p² in which the submodule is spanned by d_1e_1, d_2e_2 with `d_1` | `d_2`; write `d_i = u_i p^{a_i}` with units `u_i`. The change-of-basis matrices lie in `GL_2(Z_p)`; absorb the units into `k_1` to obtain γ = `k_1` diag(p^a, p^b) `k_2`. Uniqueness: the minimum valuation of the entries and `v_p(det)` are invariant under multiplication by `GL_2(Z_p)` on either side. Import the index `(p+1)p^(k−1)` from RG2.4.4, “rank-one-and-nonsplit-examples”. Inversion identifies left and right cosets; conjugating the inverse diagonal by the Weyl element and rescaling returns the same PGL₂ Cartan class.

*Needs:* TauCetiRoadmap.ReductiveGroupsPartII RG2.4.4, `Submodule.smithNormalForm` (Mathlib), `PadicInt` (Mathlib), `Matrix.ProjGenLinGroup` (Mathlib).

([[1]](#ref-1), Proof of Proposition 3.18, p. 32.)

**Checks.**

- diag(p, p) is scalar, hence trivial in `PGL_2(Q_p)`: k = 0.

- diag(1, p) has (a, b) = (0, 1) and k = 1; there are p + 1 right cosets in its double coset.

- Inversion preserves the Cartan distance k and exchanges left and right coset conventions.

<a id="nonintegral-local-translates-force-square-discriminant"></a>

**Nonintegral local translates force square discriminant.** Let p be any prime and f ∈ `V_{Z_p}` with Δ(f) ≠ 0. If γ·f ∈ `V_{Z_p}` for some γ ∈ `PGL_2(Q_p)` \ `PGL_2(Z_p)` (twisted action), then p² | Δ(f). Equivalently: if p² ∤ Δ(f) then `PGL_2(Q_p)_f` = `PGL_2(Z_p)` and `m_p(f)` = 1; in particular `m_p(f)` = 1 whenever p ∤ Δ(f). More precisely, if γ·f ∈ `V_{Z_p}` with γ ∈ `PGL_2(Z_p)` diag(1, p^k) `PGL_2(Z_p)` then `p^{2k} | Δ(f)`; hence `PGL_2(Q_p)_f` is a finite union of right `PGL_2(Z_p)`-cosets and `m_p(f)` is finite.

Valid for every prime p, including p = 2 and p = 3 (only the solubility half of Proposition 3.18 needs p odd). The twisted action preserves I, J and Δ, and elements of `PGL_2(Z_p)` preserve integrality.

By cartan-decomposition-of-pgl2-over-qp write γ = `k_1` δ `k_2` with δ = diag(1, p^k) or diag(p^k, 1), k ≥ 1; since `k_1` preserves `V_{Z_p}`, δ·(`k_2`·f) ∈ `V_{Z_p}`, and Δ(`k_2`·f) = Δ(f) ([relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j)). Replace f by `k_2`·f. For δ = diag(1, p^k) the twisted action sends the coefficients (a, b, c, d, e) to `(p^{-2k}a, p^{-k}b, c, p^{k}d, p^{2k}e)`; integrality forces `p^{2k} | a` and `p^{k} | b`. For diag(p^k, 1) the roles of (a, b) and (e, d) are exchanged. Δ lies in the ideal (a, b²) of Z[a, b, c, d, e]: Δ(0, b, c, d, e) = −b²(27b²e² − 18bcde + 4bd³ + 4c³e − c²d²) = b²·disc(bx³ + cx² + dx + e); and Δ(a, b, c, d, e) = Δ(e, d, c, b, a). Every monomial of Δ is therefore divisible by a or by b², hence `p^{2k} | Δ(f)`. Since `v_p`(Δ(f)) is finite, k ≤ `v_p`(Δ(f))/2, and each double coset contains finitely many right cosets; so `PGL_2(Z_p)\PGL_2(Q_p)_f` is finite.

*Needs:* [cartan decomposition of pgl2 over qp](#cartan-decomposition-of-pgl2-over-qp), [rational orbit weight](#rational-orbit-weight), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j).

([[1]](#ref-1), Proof of Proposition 3.18, p. 32; [[1]](#ref-1), Proof of Proposition 3.6, p. 25.)

**Checks.**

- For f = p²x⁴ + y⁴ (Δ = 256p⁶), δ = diag(1, p) gives δ·f = x⁴ + p²y⁴ ∈ `V_{Z_p}`, so `m_p(f)` ≥ 2, consistent with p² | Δ.

- For p odd and f = x⁴ − y⁴ (Δ = −256), `PGL_2(Q_p)_f` = `PGL_2(Z_p)`.

<a id="class-number-one-for-pgl2-over-q"></a>

**Class number one for pgl2 over q.** The diagonal map τ: `PGL_2(Z)`\`PGL_2(Q)` → ∏'_p `PGL_2(Z_p)`\`PGL_2(Q_p)`, into the families (`σ_p`)_p with `σ_p` the identity coset for all but finitely many p, is a bijection. Equivalently: `PGL_2(Q)` ∩ ∏_p `PGL_2(Z_p)` = `PGL_2(Z)` inside ∏_p `PGL_2(Q_p)`, and for every such family (`σ_p`) there is γ ∈ `PGL_2(Q)` with `PGL_2`(`Z_p`)γ = `σ_p` for all p.

The restricted product condition (`σ_p` trivial for almost all p) is necessary: the image of any γ ∈ `PGL_2(Q)` is integral at all p not dividing the entries' denominators and det. Right cosets `PGL_2`(Z)γ correspond to homothety classes of lattices Z²γ ⊆ Q².

Specialize AdelicAlgebraicGroups AA.3.3, GLₙ finite class number one over Q, to n=2. Invert its factorization to obtain the bijection of left integral cosets with restricted local cosets; its rational intersection gives injectivity. Pass to `PGL_2`: homothety classes. The map Q^× → ⊕_p Z, t ↦ (`v_p(t)`)_p (mathlib:padicValRat), is surjective with kernel {±1}, so homothety classes of global lattices correspond bijectively to families of local homothety classes. Injectivity in group form: if γ ∈ `PGL_2(Q)` lies in `PGL_2(Z_p)` for every p, take a primitive integral representative g; then det g is a p-adic unit for all p, so det g = ±1 and γ ∈ `PGL_2(Z)`.

*Needs:* AdelicAlgebraicGroups AA.3.3 (GLₙ finite class number one over Q), `padicValRat` (Mathlib), `Matrix.ProjGenLinGroup` (Mathlib), `PadicInt` (Mathlib).

([[1]](#ref-1), Proof of Proposition 3.6, p. 25.)

**Checks.**

- The family (`σ_p`) with σ_ℓ = `PGL_2(Z_ℓ)` diag(1, ℓ) and `σ_p` trivial for p ≠ ℓ is the image of diag(1, ℓ).

- A non-restricted family (`σ_p` nontrivial for infinitely many p) is not in the image.

- A scalar representative pI₂ has nonunit determinant but represents the identity projective class; use a primitive representative for the rational-intersection test.

<a id="global-weight-is-product-of-local-weights"></a>

**Global weight is product of local weights.** For every f ∈ `V_Z` with Δ(f) ≠ 0: `m_p(f)` = 1 for every p ∤ Δ(f), each `m_p(f)` is finite, and m(f) = ∏_p `m_p(f)`.

Δ(f) ≠ 0; the product is finite because `m_p(f)` = 1 for p ∤ Δ(f).

By rational-orbit-weight, m(f) = #`PGL_2(Z)\PGL_2(Q)_f` and `m_p(f)` = #`PGL_2(Z_p)\PGL_2(Q_p)_f`. The diagonal map τ: `PGL_2(Z)\PGL_2(Q)_f` → ∏_p `PGL_2(Z_p)\PGL_2(Q_p)_f` is well defined; the product is finite by nonintegral-local-translates-force-square-discriminant (`PGL_2(Q_p)_f` = `PGL_2(Z_p)` for p ∤ Δ(f)), and each factor is finite by the same lemma. τ is injective by class-number-one-for-pgl2-over-q (`PGL_2(Q)` ∩ ∏_p `PGL_2(Z_p)` = `PGL_2(Z)`). τ is surjective: class-number-one-for-pgl2-over-q gives γ ∈ `PGL_2(Q)` with prescribed local cosets; then γ·f ∈ `V_{Z_p}` for all p, so γ·f ∈ `V_Z` and γ ∈ `PGL_2(Q)_f`.

*Needs:* [rational orbit weight](#rational-orbit-weight), [nonintegral local translates force square discriminant](#nonintegral-local-translates-force-square-discriminant), [class number one for pgl2 over q](#class-number-one-for-pgl2-over-q).

([[1]](#ref-1), Proposition 3.6 and proof, pp. 24–25.)

**Checks.**

- For f = 4x⁴ + y⁴ one has `Δ(f) = 2^{14}`, so `m_p(f)` = 1 for every odd p and m(f) = `m_2(f)` ≥ 2 (diag(1, 2) maps f to x⁴ + 4y⁴).

- For f = x⁴ − y⁴ (Δ = −2⁸) one has m(f) = `m_2(f)`.

### 4.3 Finite-field quartics and local solubility

<a id="count-of-nonsingular-binary-quartic-forms-over-a-finite-field"></a>

**Count of nonsingular binary quartic forms over a finite field.** For every finite field `F_q`, #{f ∈ `V_{F_q}` : Δ(f) ≠ 0} = q²(q + 1)(q − 1)², where Δ is the integral discriminant polynomial of Layer 0 reduced to `F_q`.

Holds for every finite field, including characteristic 2 and 3 (verified by exhaustive count for q = 2, 3, 5, 7, 11). Δ(f) is the discriminant of the dehomogenisation f(x, 1) when a ≠ 0 ([quartic discriminant is the polynomial discriminant](../ArithmeticStatisticsPartI/README.md#quartic-discriminant-is-the-polynomial-discriminant)), and Δ(0, b, c, d, e) = b²·disc(bx³ + cx² + dx + e).

Case a ≠ 0: Δ(f) = disc(f(x, 1)) ≠ 0 iff f(x, 1) is separable (mathlib:Polynomial.`resultant_deriv` with mathlib:Polynomial.resultant_eq_zero_iff) iff it is squarefree (mathlib:PerfectField.separable_iff_squarefree, finite fields being perfect); scaling out a gives (q − 1)(q⁴ − q³) forms by count-of-squarefree-monic-polynomials-over-a-finite-field. Case a = 0: Δ(f) = b²·disc(bx³ + cx² + dx + e) ≠ 0 iff b ≠ 0 and the cubic is squarefree: (q − 1)(q³ − q²) forms. Sum: (q − 1)(q⁴ − q²) = q²(q + 1)(q − 1)².

*Needs:* [count of squarefree monic polynomials over a finite field](../ArithmeticStatisticsPartI/README.md#count-of-squarefree-monic-polynomials-over-a-finite-field), [quartic discriminant is the polynomial discriminant](../ArithmeticStatisticsPartI/README.md#quartic-discriminant-is-the-polynomial-discriminant), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), `Polynomial.discr` (Mathlib), `Polynomial.resultant_deriv` (Mathlib), `Polynomial.resultant_eq_zero_iff` (Mathlib), `PerfectField.separable_iff_squarefree` (Mathlib).

([[1]](#ref-1), §3.4, p. 31.)

**Checks.**

- q = 3: 144 forms; q = 5: 2400; q = 2: 12 (checked by exhaustive enumeration).

- The count equals #`PGL_2(F_q)` · #{(I, J) ∈ F_q² : Δ(I, J) ≠ 0} = q(q² − 1)·q(q − 1) for q ≥ 5, as the proof of nonsingular-binary-quartic-forms-over-finite-fields-are-soluble requires.

<a id="nonsingular-binary-quartic-forms-over-finite-fields-are-soluble"></a>

**Nonsingular binary quartic forms over finite fields are soluble.** Let p be an odd prime and f ∈ `V_{F_p}` with Δ(f) ≠ 0. Then f is `F_p`-soluble: there are x, y, z ∈ `F_p` with (x, y) ≠ (0, 0) and z² = f(x, y). Consequently, for p ≥ 5 and (I, J) ∈ F_p² with Δ(I, J) ≠ 0, `Σ_{f ∈ PGL_2(F_p)\V_{F_p}(I, J)}` 1/#`Aut_{F_p}(f)` = 1 (the second assertion of Lemma 3.15).

p odd. For p ≥ 5 the proof is uniform; p = 3 is a finite verification; p = 2 is excluded (squares are not a proper subgroup of `F_2`^×). The `PGL_2(F_p)`-action is the twisted action, which preserves (I, J).

(p ≥ 5) For (I, J) with Δ(I, J) ≠ 0 let `E = E^{I,J}`. By Layer 1 (Theorem 3.2 over K = `F_p`, characteristic ≠ 2, 3) the `F_p`-soluble `PGL_2(F_p)`-orbits in V(I, J) := {f : (I(f), J(f)) = (I, J)} correspond to E(`F_p`)/2E(`F_p`), and every stabilizer is isomorphic to E(`F_p`)[2]. E(`F_p`) is finite (tauceti:WeierstrassCurve.Affine.`finite_point`), and for a finite abelian group #(G/2G) = #G[2] (mathlib:Subgroup.`index_ker` with mathlib:Subgroup.card_mul_index applied to multiplication by 2). Orbit–stabilizer (mathlib:MulAction.card_orbit_mul_card_stabilizer_eq_card_group): the number of soluble f ∈ V(I, J) is #`PGL_2(F_p)`·#(E/2E)/#E[2] = #`PGL_2(F_p)` = p(p² − 1). There are p² − p pairs (I, J) with Δ(I, J) ≠ 0 (the curve J² = 4I³ has the p points (t², 2t³)), so the number of soluble nonsingular forms is (p² − p)p(p² − 1) = p²(p + 1)(p − 1)², which is the number of all nonsingular forms by count-of-nonsingular-binary-quartic-forms-over-a-finite-field. Hence every nonsingular form is soluble, and the mass formula follows. (p = 3) Exhaustive check of the 3⁵ = 243 forms over `F_3`: each of the 144 forms with Δ ≠ 0 vanishes at a point of P¹(`F_3`) or takes the nonzero square value 1 there.

*Needs:* [count of nonsingular binary quartic forms over a finite field](#count-of-nonsingular-binary-quartic-forms-over-a-finite-field), `WeierstrassCurve.Affine.finite_point` (Tau Ceti), `Subgroup.index_ker` (Mathlib), `Subgroup.card_mul_index` (Mathlib), `MulAction.card_orbit_mul_card_stabilizer_eq_card_group` (Mathlib), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [binary quartic parametrization of e mod 2e](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e), [stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion).

([[1]](#ref-1), Lemma 3.15, second assertion, and proof, p. 30; [[1]](#ref-1), Proof of Proposition 3.18, p. 33.)

**Checks.**

- Over `F_5` all 2400 nonsingular forms are soluble; over `F_7` all 14112 (exhaustive check).

- Over `F_p` with p ≥ 5 and Δ(I, J) ≠ 0 the fibre V(I, J) has exactly p(p² − 1) elements.

- The hypothesis Δ ≠ 0 is needed: 2(x² + y²)² over `F_3` (Δ = 0) takes only the non-square value 2 on P¹(`F_3`) and is not `F_3`-soluble.

<a id="local-solubility-away-from-square-discriminant"></a>

**Local solubility away from square discriminant.** Let p be an odd prime and f ∈ `V_{Z_p}` with Δ(f) ≠ 0. If f is not `Q_p`-soluble then p² | Δ(f). In particular every f ∈ `V_{Z_p}` with p ∤ Δ(f) is `Q_p`-soluble.

p odd: the Hensel lifting of a square root of a unit uses that 2 is a unit. Splitting types refer to the factorisation of the reduction f̄ ∈ `V_{F_p}` into irreducible binary forms, as in the source.

If p ∤ Δ(f): by nonsingular-binary-quartic-forms-over-finite-fields-are-soluble there are (x̄, ȳ, z̄) with z̄² = f̄(x̄, ȳ). If z̄ ≠ 0, lift z by Hensel's lemma (mathlib:`hensels_lemma` for Z² − f(x, y), derivative 2z a unit). If z̄ = 0, (x̄ : ȳ) is a simple root of f̄ and lifts to a root of f in P¹(`Q_p`), giving a solution with z = 0. If f ≡ 0 (mod p) then p⁶ | Δ(f). If p | Δ(f) and f̄ ≠ 0, f̄ has a repeated factor; its splitting type is (1²11), (1²2), (1³1), (1²1²), (2²) or (1⁴). Types (1²11) and (1³1) have a simple `F_p`-rational root, which lifts as above. Type (1²2): work modulo p: move the double root to [0:1], then complete the square in the irreducible quadratic factor using a change preserving that root. This gives f̄ = ā x²(x² − n̄ y²), with n̄ a nonsquare. If ā is a square, f̄(1,0) is a nonzero square. Otherwise take the first square (c+1)n̄ in n̄,2n̄,…,(p−1)n̄, choose x̄₀²=(c+1)n̄, and note x̄₀²−n̄=cn̄ is a nonsquare. Thus f̄(x̄₀,1) is a nonzero square. Lift its square root by Hensel; no simultaneous exact p-adic diagonalization is needed. Types (1²1²), (2²), (1⁴) mean f̄ = c·ḡ² for a binary quadratic form ḡ. Δ and its gradient vanish identically on forms c·g² (polynomial identity), so Δ(c g² + p h) ≡ 0 (mod p²) for all lifts.

*Needs:* [nonsingular binary quartic forms over finite fields are soluble](#nonsingular-binary-quartic-forms-over-finite-fields-are-soluble), `hensels_lemma` (Mathlib), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer).

([[1]](#ref-1), Proof of Proposition 3.18, p. 33.)

**Checks.**

- Every f ∈ `V_{Z_5}` with 5 ∤ Δ(f) is `Q_5`-soluble (exhaustive check over `F_5` and Hensel lifting).

- f = 2(x² + y²)² + 3xy³ = 2x⁴ + 4x²y² + 3xy³ + 2y⁴ has Δ(f) = 28116 = 2²·3²·781 and is not `Q_3`-soluble: for primitive (x, y), f(x, y) ≡ 2 (mod 3) is a non-square unit. Its type at 3 is (2²) and 3² | Δ(f), as the lemma requires.

- Forms of type (1²2) are soluble although p | Δ(f): the lemma is not the converse statement.

### 4.4 Local constancy and real solubility

<a id="local-weights-and-solubility-are-locally-constant"></a>

**Local weights and solubility are locally constant.** Let p be a prime. On the open set {f ∈ `V_{Z_p}` : Δ(f) ≠ 0} the functions f ↦ `m_p(f)` and f ↦ 1[f is `Q_p`-soluble] are locally constant; precisely, `m_p` is constant on `f + p^{δ+1}V_{Z_p}` where δ = `v_p`(Δ(f)). The set {f ∈ `V_{Z_p}` : Δ(f) = 0} is closed and has Haar measure zero. Consequently, for a family F defined by congruence conditions whose actual invariant closure `Inv_p(F)` has null boundary, `φ_p := 1_{S_p(F)}/m_p` is a function `V_{Z_p}` → [0, 1] that is locally constant outside the closed null set `{Δ = 0} ∪ {f : (2^{-4}I(f), 2^{-6}J(f)) ∈ ∂Inv_p(F)}`.

For the final consequence, assume `μ_p`(∂`Inv_p(F)`) = 0 explicitly. Closedness and null boundary of `Σ_p` alone do not justify it for a closed subset `Inv_p(F)`. For large families with positive local specification masses, count-of-curves-in-a-large-family supplies this assertion by CRT and the discriminant tail estimate. The zero-mass case of the weighted count uses an upper bound at one prime instead. The invariant map is a submersion on the nonsingular locus, so the p-adic inverse-function/change-of-variables input pulls Haar-null subsets of Q_p² back to null subsets of Q_p⁵. Use the nonsingular submersion change-of-variables assertion stated below, independently of the full orbit-integral formula. The divisibility conditions at 2 cut out clopen subsets.

`m_p`: by nonintegral-local-translates-force-square-discriminant only double cosets `PGL_2(Z_p)` diag(1, p^k) `PGL_2(Z_p)` with 2k ≤ δ can meet `PGL_2(Q_p)_f`; whether `δ_k`·(κ·f) is integral (κ ∈ `PGL_2(Z_p)`) depends only on f modulo `p^{2k}`; `f' ≡ f (mod p^{δ+1})` has `v_p`(Δ(f')) = δ, so the same cosets occur for f and f'. Solubility is open: a solution (x, y, z) with z ≠ 0 persists because `Q_p^{×2}` is open (Hensel's lemma, mathlib:`hensels_lemma`); a solution with z = 0 is a simple root of f (Δ(f) ≠ 0) and persists under perturbation by Hensel's lemma. Insolubility is open: if f is insoluble, f(x, y) lies in the open set `Q_p`^× \ `Q_p^{×2}` for all primitive (x, y) ∈ Z_p², a compact set; by continuity of (f, x, y) ↦ f(x, y) and compactness (tube lemma) the same holds on a neighbourhood of f. {Δ = 0} is null: for fixed (a, b, c, d) with (a, b) ≠ (0, 0), Δ is a nonzero polynomial of degree at most 3 in e, so it has at most 3 roots; Fubini on Z_p⁴ × `Z_p` with the Haar measure (mathlib:MeasureTheory.Measure.haarMeasure) gives measure zero. `φ_p` takes values in [0, 1] because `m_p` ≥ 1 (rational-orbit-weight) and is locally constant off the displayed closed null set.

*Needs:* [rational orbit weight](#rational-orbit-weight), [nonintegral local translates force square discriminant](#nonintegral-local-translates-force-square-discriminant), [locally soluble forms attached to a family](#locally-soluble-forms-attached-to-a-family), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function), `hensels_lemma` (Mathlib), `MeasureTheory.Measure.haarMeasure` (Mathlib).

([[1]](#ref-1), §2.7, p. 19; [[1]](#ref-1), Proof of Theorem 3.19, p. 33.)

**Checks.**

- `m_p(x⁴ − y⁴)` = 1 on the whole ball (x⁴ − y⁴) + p `V_{Z_p}` for odd p.

- The indicator of `Q_3`-solubility is 0 on the ball `f_0 + 3V_{Z_3}` with `f_0` = 2x⁴ + 4x²y² + 3xy³ + 2y⁴ (all values ≡ 2 mod 3).

<a id="real-solubility-of-binary-quartic-forms"></a>

**Real solubility of binary quartic forms.** A form f ∈ `V_R` with Δ(f) ≠ 0 is R-soluble if and only if f is not negative definite, i.e. iff f ∉ `V_R^{(2−)}`. Hence `S_∞(F)` ∩ {Δ ≠ 0} is the union of the components `V_R^{(0)}` and `V_R^{(2+)}` over {Δ > 0} ∩ `Inv_∞(F)` and the component `V_R^{(1)}` over {Δ < 0} ∩ `Inv_∞(F)`.

`V_R^{(i)}` (i = 0, 1, 2) is the set of forms with nonzero discriminant and 4 − 2i real roots in P¹, and `V_R^{(2±)}` splits the definite forms by sign (source §2.1; the real orbit structure is in [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp)).

If f(`x_0`, `y_0`) ≥ 0 for some (`x_0`, `y_0`) ≠ (0, 0) then z = √f(`x_0`, `y_0`) (mathlib:Real.sqrt) gives a solution; conversely a solution forces f(x, y) = z² ≥ 0. A form with a real root takes the value 0; a positive definite form takes positive values; a negative definite form takes only negative values on R² \ {0}. Forms in `V_R^{(0)}` and `V_R^{(1)}` have real roots; hence exactly `V_R^{(2−)}` is insoluble.

*Needs:* [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), `Real.sqrt` (Mathlib).

([[1]](#ref-1), §2.1, p. 8; [[1]](#ref-1), §3.6, p. 33.)

**Checks.**

- x⁴ + y⁴ ∈ `V_R^{(2+)}` is R-soluble; −x⁴ − y⁴ ∈ `V_R^{(2−)}` is not.

- x³y − xy³ ∈ `V_R^{(0)}` (four real roots) is R-soluble with z = 0.

### 4.5 Quartic orbit Jacobians and p-adic masses

<a id="jacobian-of-the-orbit-map"></a>

**Jacobian of the orbit map.** Let `s_{I,J}` := x³y − (I/3)xy³ − (J/27)y⁴, so that I(`s_{I,J}`) = I and J(`s_{I,J}`) = J, and let ψ: `PGL_2` × A² → V, ψ(g, I, J) := g·`s_{I,J}` (twisted action). Let ω be the left-invariant top-degree form on `PGL_2` whose value at the identity on the images of `E_{11}`, `E_{12}`, `E_{21}` in `pgl_2` = `gl_2`/(scalars) is 1 (these images form a Z-basis of `gl_2(Z)`/Z·1, so ω generates the invariant top-degree forms of `PGL_2` over Z, as in the source's Proposition 2.8), and let dv = da ∧ db ∧ dc ∧ dd ∧ de. Then ψ*(dv) = −(1/27)·ω ∧ dI ∧ dJ identically on `PGL_2` × A², over every commutative ring in which 3 is invertible. At g = 1 the Jacobian matrix (rows a, …, e; columns `E_{11}`, `E_{12}`, `E_{21}`, ∂_I, ∂_J) is [[0,1,0,0,0],[1,0,0,0,0],[0,−I,3,0,0],[I/3,−4J/27,0,−1/3,0],[2J/27,0,−I/3,0,−1/27]], of determinant −1/27.

The action is the twisted action, whose determinant on the 5-dimensional space V is 1 (for the untwisted action it would be `(det g)^{10}`). The sign of ω is fixed by the ordered basis (`E_{11}`, `E_{12}`, `E_{21}`); only |−1/27| enters the measure statements.

The twisted action of g on V has determinant 1 (polynomial identity), and ω is left-invariant, so the Jacobian of ψ at (g, I, J) equals its value at (1, I, J). At g = 1 the derivative of t ↦ (1 + tE)·`s_{I,J}` for E ∈ {`E_{11}`, `E_{12}`, `E_{21}`} and the partial derivatives ∂_I s, ∂_J s give the displayed matrix; its determinant (mathlib:Matrix.det) is −1/27, independent of (I, J). The identity is a polynomial identity with coefficients in Z[1/3], hence valid after base change to R, `Q_p` and every Z[1/3]-algebra.

*Needs:* [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j), `Matrix.det` (Mathlib).

([[1]](#ref-1), §2.4, Proposition 2.8 and the sentence after it, p. 13; [[1]](#ref-1), §3.4, Proposition 3.11 and p. 30–31.)

**Checks.**

- |−1/27|_p = 1 for p ≠ 3 and |−1/27|_3 = 27, the values the source obtains in §3.4 by counting points modulo p (p ≠ 3) and modulo 9 (p = 3).

- |−1/27|_∞ = 1/27 is the constant of the source's Proposition 2.8.

<a id="volume-of-pgl2-zp"></a>

**Volume of pgl2 zp.** For every prime p, with |ω|_p the Haar measure on `PGL_2(Q_p)` attached to the Z-generator ω of jacobian-of-the-orbit-map, `vol(PGL_2(Z_p)) = #PGL_2(F_p)/p³ = 1 − p^{-2}`.

ω is the Z-generator, so |ω|_p gives the principal congruence subgroup volume `p^{-3}`.

Reduction `PGL_2(Z_p)` → `PGL_2(F_p)` is surjective (`GL_2(Z_p)` → `GL_2(F_p)` is surjective by lifting a matrix with unit determinant) with kernel K(1), the image of 1 + `pM_2(Z_p)`. In the coordinates of the Z-basis (`E_{11}`, `E_{12}`, `E_{21}`) normalize a representative to have lower-right entry 1; the chart (a,b,c) ↦ [[1+a,b],[c,1]], for (a,b,c) ∈ (`pZ_p`)³, identifies K(1) with (`pZ_p`)³, with unit Jacobian for ω; by the p-adic change of variables, `vol(K(1)) = p^{-3}`. #`PGL_2(F_p)` = #`GL_2(F_p)`/(p − 1) = (p² − 1)(p² − p)/(p − 1) = p(p² − 1) (mathlib:Matrix.card_GL_field), hence `vol(PGL_2(Z_p)) = p(p² − 1)/p³ = 1 − p^{-2}`.

*Needs:* [jacobian of the orbit map](#jacobian-of-the-orbit-map), `Matrix.card_GL_field` (Mathlib), `Matrix.ProjGenLinGroup` (Mathlib), `PadicInt` (Mathlib).

([[1]](#ref-1), §3.4, p. 30; [[1]](#ref-1), §3.6, p. 34.)

**Checks.**

- p = 2: vol = 6/8 = 3/4; p = 3: vol = 24/27 = 8/9 (used in the source's computation of |J|_3).

- `∏_p vol(PGL_2(Z_p)) = ∏_p (1 − p^{-2}) = 1/ζ(2)`.

<a id="p-adic-change-of-measure-for-binary-quartic-forms"></a>

**P adic change of measure for binary quartic forms.** Let p be a prime, df the Haar probability measure on `V_{Z_p}` = Z_p⁵, dIdJ the Haar probability measure on Z_p² and dg = |ω|_p on `PGL_2(Z_p)`. For every nonnegative measurable φ: `V_{Z_p}` → R, `∫_{V_{Z_p}} φ(f) df = |1/27|_p ∫_{(I,J) ∈ Z_p², Δ(I,J) ≠ 0} ( Σ_{f ∈ PGL_2(Z_p)\V_{Z_p}(I,J)} (1/#Aut_{Z_p}(f)) ∫_{PGL_2(Z_p)} φ(g·f) dg ) dIdJ`, where `V_{Z_p}(I, J)` = {f ∈ `V_{Z_p}` : I(f) = I, J(f) = J} is a finite union of `PGL_2(Z_p)`-orbits when Δ(I,J) ≠ 0 and `Aut_{Z_p}(f)` is the (finite) stabilizer of f in `PGL_2(Z_p)`. For `PGL_2(Z_p)`-invariant φ the right side is `|1/27|_p (1 − p^{-2}) ∫ Σ_f φ(f)/#Aut_{Z_p}(f) dIdJ`.

Nonnegative measurable φ (the source states continuous φ in Proposition 3.7 and measurable φ in Proposition 3.12); indicator functions of the sets `S_p(F)` are included. The constant is |1/27|_p = 1 for p ≠ 3 and 27 for p = 3. The stabilizers are finite: `Aut_{Z_p}(f) ⊆ Aut_{Q_p}(f) ≅ E^{I,J}(Q_p)[2]` ([stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion), over `Q_p`). The statement for nonnegative measurable φ uses the extended nonnegative integral and the nonsingular p-adic change-of-variables input of the supporting targets at the end of this layer; its real-valued form for integrable `PGL_2(Z_p)`-invariant φ is a specialization.

By jacobian-of-the-orbit-map, ψ*(dv) = −(1/27) ω ∧ dI ∧ dJ over `Q_p`. To transfer the Jacobian calculation from the soluble section to an arbitrary nonsingular geometric orbit, use the single geometric orbit for fixed invariants over an algebraic closure and determinant-one invariance of the action; descend the resulting differential-form identity. The local transverse section is then supplied by the p-adic inverse function theorem. For `f_0` ∈ `V_{Z_p}` with Δ(`f_0`) ≠ 0 choose, as in the source, a plane P through `f_0` defined over Q and a neighbourhood `P_0` on which the invariant map is injective and the stabilizer order is constant; the map `PGL_2(Z_p)` × `P_0` → `V_{Z_p}` is #`Aut_{Z_p}(f_0)`-to-one onto its open image. The p-adic change-of-variables formula for polynomial maps with nonvanishing Jacobian (the p-adic change-of-variables supporting target below) gives #`Aut_{Z_p}(f_0)`·vol(`PGL_2(Z_p)`·`P_0`) = |1/27|_p vol(`PGL_2(Z_p)`) vol(Inv(`P_0`)). `V_{Z_p}(I, J)` is compact and each `PGL_2(Z_p)`-orbit in it is open (the orbit map is submersive by the Jacobian identity), so it is a finite union of orbits. Cover {Δ ≠ 0} by such neighbourhoods and sum; the set {Δ = 0} is null (local-weights-and-solubility-are-locally-constant). For invariant φ, `∫_{PGL_2(Z_p)} φ(g·f) dg = vol(PGL_2(Z_p)) φ(f) = (1 − p^{-2})φ(f)` by volume-of-pgl2-zp.

*Needs:* [jacobian of the orbit map](#jacobian-of-the-orbit-map), [volume of pgl2 zp](#volume-of-pgl2-zp), [local weights and solubility are locally constant](#local-weights-and-solubility-are-locally-constant), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), `MeasureTheory.Measure.haarMeasure` (Mathlib), [binary quartic parametrization of e mod 2e](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e), [stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion).

([[1]](#ref-1), Proposition 3.7, (50), p. 25; [[1]](#ref-1), Proof of Proposition 3.12, p. 29.)

**Checks.**

- φ = 1: both sides are 1, so `∫ Σ_{f} 1/#Aut_{Z_p}(f) dIdJ = |27|_p/(1 − p^{-2})`, the total mass of integral orbits.

- For p ≠ 3 and φ the indicator of {f : (I(f), J(f)) ≡ (`I_0`, `J_0`) mod p} with Δ(`I_0`, `J_0`) ≢ 0: the left side is `#PGL_2(F_p)/p⁵ = (1 − p^{-2})p^{-2}`, and the right side is `(1 − p^{-2})·p^{-2}` by the source's Lemma 3.15 (unit mass of integral orbits with p ∤ Δ), recovering the source's |J|_p = 1.

- p = 3, φ the indicator of {I(f) ≡ 3 (mod 9)}: the left side is 24/3⁵ and the right side is `27·(8/9)·3^{-5} = 24/3⁵` (again with unit mass), recovering |J|_3 = 27.

<a id="weighted-p-adic-change-of-measure"></a>

**Weighted p adic change of measure.** Let p be a prime and φ: `V_{Z_p}` → `R_{≥0}` measurable and `PGL_2(Q_p)`-invariant (φ(γ·f) = φ(f) whenever f, γ·f ∈ `V_{Z_p}`), such that every f in the support of φ has Δ(f) ≠ 0, is `Q_p`-soluble, and satisfies 2⁴·3 | I(f), 2⁶·3³ | J(f). Then `∫_{V_{Z_p}} φ(f)/m_p(f) df = |1/27|_p (1 − p^{-2}) ∫_{(I,J) ∈ D_p} (1/#E^{I,J}(Q_p)[2]) Σ_{σ ∈ E^{I,J}(Q_p)/2E^{I,J}(Q_p)} φ(f_σ) dIdJ`, where `f_σ` ∈ `V_{Z_p}` is any integral form in the `PGL_2(Q_p)`-class corresponding to σ under Theorem 3.2 (Layer 1).

`D_p` = {(I,J) ∈ Z_p² : Δ(I,J) ≠ 0, 2⁴·3 | I, 2⁶·3³ | J}. The outer integral is restricted to `D_p`; outside it integral representatives `f_σ` need not exist, so an unrestricted sum over such representatives is not defined. The divisibility conditions guarantee (local form of Lemma 3.4, Layer 1) that every soluble `PGL_2(Q_p)`-class with these invariants meets `V_{Z_p}`, so `f_σ` exists. `m_p` is `PGL_2(Z_p)`-invariant and `PGL_2(Q_p)`-invariant on `V_{Z_p}` (rational-orbit-weight).

Apply p-adic-change-of-measure-for-binary-quartic-forms to the `PGL_2(Z_p)`-invariant function φ/`m_p`. Group the `PGL_2(Z_p)`-orbits `f_1`, …, `f_k` in `V_{Z_p}(I, J)` by `PGL_2(Q_p)`-class; by orbit-weight-as-a-stabilizer-sum, `Σ_i` φ(`f_i`)/(`m_p(f_i)`#`Aut_{Z_p}(f_i)`) = φ(f)/#`Aut_{Q_p}(f)`. By Layer 1 (Theorem 3.2 over `Q_p` and the local Lemma 3.4) the soluble `PGL_2(Q_p)`-classes in `V_{Z_p}(I, J)` correspond to `E^{I,J}(Q_p)/2E^{I,J}(Q_p)`, and `Aut_{Q_p}(f) ≅ E^{I,J}(Q_p)[2]`.

*Needs:* [p adic change of measure for binary quartic forms](#p-adic-change-of-measure-for-binary-quartic-forms), [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum), [rational orbit weight](#rational-orbit-weight), [binary quartic parametrization of e mod 2e](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e), [stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion), [local integral representatives of soluble quartics](../ArithmeticStatisticsPartII/README.md#local-integral-representatives-of-soluble-quartics).

([[1]](#ref-1), Corollary 3.8, (51), p. 25; [[1]](#ref-1), Proof of Corollary 3.8, p. 26.)

**Checks.**

- With φ the indicator of the soluble forms with invariants in a small ball around (`I_0`, `J_0`), the right side is `|1/27|_p(1 − p^{-2})` times the ball's volume times #(E(`Q_p`)/2E(`Q_p`))/#E(`Q_p`)[2].

- An implementation that forgets 1/`m_p` double-counts the `PGL_2(Z_p)`-orbits inside one `PGL_2(Q_p)`-class.

<a id="local-mass-formula-for-locally-soluble-forms"></a>

**Local mass formula for locally soluble forms.** For every family F defined by congruence conditions and every prime p, `∫_{S_p(F)} m_p(f)^{-1} df = |2^{10}/27|_p (1 − p^{-2}) M_p(V, F)`.

`S_p(F)` is the local set of locally-soluble-forms-attached-to-a-family; `Inv_p(F)` ⊆ 3Z_p × 27Z_p because I(E) = −3A and J(E) = −27B.

Apply weighted-p-adic-change-of-measure to `φ = 1_{S_p(F)}`: every f ∈ `S_p(F)` has Δ(f) ≠ 0, is `Q_p`-soluble, and has invariants (2⁴I, 2⁶J) with 3 | I, 27 | J, so 2⁴·3 | I(f) and 2⁶·3³ | J(f); φ is `PGL_2(Q_p)`-invariant. For (I, J) = (2⁴I', 2⁶J') the curves `E^{I,J}` and `E^{I',J'}` are isomorphic over `Q_p` ((x, y) ↦ (4x, 8y)), so the Selmer ratio is unchanged, and every soluble class is counted exactly when (I', J') ∈ `Inv_p(F)`. The substitution (I, J) = (2⁴I', 2⁶J') has Jacobian `|2^{10}|_p`, giving `|2^{10}|_p·|1/27|_p(1 − p^{-2}) M_p(V, F)`.

*Needs:* [weighted p adic change of measure](#weighted-p-adic-change-of-measure), [locally soluble forms attached to a family](#locally-soluble-forms-attached-to-a-family), [local masses of a family](#local-masses-of-a-family), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions).

([[1]](#ref-1), Proposition 3.9, p. 26.)

**Checks.**

- For p ≥ 5 the factor `|2^{10}/27|_p` is 1; for p = 2 it is `2^{-10}`; for p = 3 it is 27.

- The product over all p of `|2^{10}/27|_p` is `27/2^{10}`, which cancels the archimedean factor `2^{10}/27` in selmer-average-as-product-of-local-masses.

### 4.6 Local Kummer indices

<a id="two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup"></a>

**Two division quotient of a group with a finite index zp subgroup.** Let G be an abelian group and U ≤ G a subgroup of finite index with U ≅ (`Z_p`, +) as abstract groups, p prime. Then G[2] and G/2G are finite and `#(G/2G) = |2|_p^{-1}·#G[2]`: #(G/2G) = #G[2] for p odd and #(G/2G) = 2·#G[2] for p = 2.

Only the abstract group structure is used; G is written additively and 2G is the image of multiplication by 2. Require finiteness of the kernel and quotient, using `nsmulAddMonoidHom` and `AddSubgroup.index` on the existing additive groups.

Tau Ceti's `AddSubgroup.index_range_nsmul_mul_card_ker` with n = 2 gives (G : 2G)·#U[2] = #G[2]·(U : 2U) for the finite-index subgroup U. Here U[2] = `Z_p`[2] = 0 and `(U : 2U) = #(Z_p/2Z_p) = |2|_p^{-1}`. G[2] meets U trivially, so it injects into the finite group G/U and is finite; then the displayed identity gives `#(G/2G) = |2|_p^{-1}·#G[2]`, and G/2G is finite.

*Needs:* `AddSubgroup.index_range_nsmul_mul_card_ker` (Tau Ceti), `PadicInt` (Mathlib).

([[1]](#ref-1), Lemma 3.20, p. 34.)

**Checks.**

- G = `Z_2` × Z/2: #(G/2G) = 4 = 2·#G[2].

- G = `Z_3` × Z/2 × Z/2: #(G/2G) = 4 = #G[2].

- Taking U=G=Z₂ gives trivial two-torsion and quotient of order two; replacing U by 2Z₂ leaves the same ratio.

<a id="local-two-descent-index"></a>

**Local two descent index.** Let p be a prime and E an elliptic curve over `Q_p`. Then #(E(`Q_p`)/2E(`Q_p`)) = #E(`Q_p`)[2] if p ≠ 2 and #(E(`Q_p`)/2E(`Q_p`)) = 2·#E(`Q_p`)[2] if p = 2.

E elliptic over `Q_p`, given by any Weierstrass equation (the statement is invariant under isomorphism). Require the finite kernel, finite doubling index and displayed cardinal identity on `WeierstrassCurve.Affine.Point`, for every prime p and every elliptic Weierstrass equation over `Padic p`.

Import HeightsRationalPointsAndObstructions §1.17, `card_quotient_two_padic`, with g=1 and F=Q_p. Its normalized absolute value gives |2|_p⁻¹=1 at odd p and 2 at p=2. Transport along the elliptic point-group comparison.

*Needs:* HeightsRationalPointsAndObstructions §1.17 (`card_quotient_two_padic`), [two division quotient of a group with a finite index zp subgroup](#two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup), `WeierstrassCurve.Affine.Point` (Mathlib).

([[1]](#ref-1), Lemma 3.20, p. 34.)

**Checks.**

- E: y² = x³ − x over `Q_3` has E(`Q_3`)[2] of order 4, so #(E(`Q_3`)/2E(`Q_3`)) = 4; over `Q_2` it is 8.

- Over `Q_5`, y² = x³ + 1 = (x + 1)(x² − x + 1) has exactly one 2-torsion point besides O (−3 is not a square mod 5), so #(E(`Q_5`)/2E(`Q_5`)) = 2.

- The dyadic multiplier is two even when E has only the identity rational two-torsion point.

<a id="archimedean-selmer-ratio-is-one-half"></a>

**Archimedean selmer ratio is one half.** For (I, J) ∈ R² with Δ(I, J) ≠ 0 and `E = E^{I,J}`: #E(R)[2] = 4 and #(E(R)/2E(R)) = 2 if Δ(I, J) > 0, and #E(R)[2] = 2 and #(E(R)/2E(R)) = 1 if Δ(I, J) < 0; in both cases the ratio is 1/2. Moreover for f ∈ `V_R^{(i)}` with invariants (I, J), #`Stab_{PGL_2(R)}(f)` = #E(R)[2], i.e. `n_0 = n_{2±} = 4` and `n_1` = 2.

Δ(I, J) = (4I³ − J²)/27 is the discriminant of the cubic x³ − (I/3)x − J/27 (polynomial identity). Require the doubling-ratio identity for every real elliptic Weierstrass equation, together with finiteness of its kernel and quotient. The quartic stabilizer comparison uses the orbit dictionary specified here.

Import the real counterpart of HeightsRationalPointsAndObstructions §1.17 for the doubling quotient. The additions here identify the quartic real orbits and stabilizers with that ratio. E(R)[2] = {O} ∪ {(r, 0) : r a real root of x³ − (I/3)x − J/27}; the cubic has three real roots iff its discriminant is positive and one iff negative (discriminant as the product of squared root differences, mathlib:Cubic.discr_eq_prod_three_roots over C: a complex-conjugate pair contributes a negative square). By Layer 1 (Theorem 3.2 over K = R), #(E(R)/2E(R)) is the number of R-soluble `PGL_2(R)`-orbits with invariants (I, J), and stabilizers are ≅ E(R)[2]. By the real orbit structure (Layer 2, §2.1 of the source) the forms with invariants (I, J) form one `SL_2`^±(R)-orbit (in `V^{(1)}`) if Δ < 0 and three (in `V^{(0)}`, `V^{(2+)}`, `V^{(2−)}`) if Δ > 0; `PGL_2(R)`-orbits coincide with `SL_2`^±(R)-orbits for the twisted action. By real-solubility-of-binary-quartic-forms the soluble ones are `V^{(1)}` (Δ < 0) and `V^{(0)}`, `V^{(2+)}` (Δ > 0), giving 1 and 2.

*Needs:* HeightsRationalPointsAndObstructions §1.17 (real doubling index), [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [real solubility of binary quartic forms](#real-solubility-of-binary-quartic-forms), `Cubic.discr_eq_prod_three_roots` (Mathlib), [binary quartic parametrization of e mod 2e](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e), [stabilizer of a binary quartic is two torsion](../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion).

([[1]](#ref-1), §3.6, p. 33; [[1]](#ref-1), Proof of Lemma 2.2, pp. 20–21.)

**Checks.**

- y² = x³ − x (Δ > 0): E(R) has two components, E(R)[2] has 4 points, E(R)/2E(R) has 2.

- y² = x³ + 1 (Δ < 0): E(R) is connected, E(R)[2] = {O,(−1,0)}, and E(R)/2E(R) is the trivial group (cardinality 1).

- For x⁴−y⁴ one has Δ<0 and a stabilizer of order two; no negative-definite orbit enters its soluble count.

<a id="local-selmer-mass-ratios"></a>

**Local selmer mass ratios.** For every family F defined by congruence conditions: `M_p(V, F)` = `M_p(F)` for every odd prime p, `M_2(V, F)` = 2·`M_2(F)`, and `M_∞(V, F; X)` = `M_∞(F; X)`/2 for every X.

`M_p(F)` is the local density of Layer 0; the ratios hold whether or not `M_p(F)` is positive.

The integrand of `M_p(V, F)` is identically 1 (p odd) or 2 (p = 2) on {Δ ≠ 0} by local-two-descent-index; integrate over `Inv_p(F)`. The integrand of `M_∞(V, F; X)` is identically 1/2 by archimedean-selmer-ratio-is-one-half.

*Needs:* HeightsRationalPointsAndObstructions §1.17 (p-adic and real doubling indices), [local masses of a family](#local-masses-of-a-family), [local two descent index](#local-two-descent-index), [archimedean selmer ratio is one half](#archimedean-selmer-ratio-is-one-half), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions).

([[1]](#ref-1), (74), p. 34.)

**Checks.**

- When all finite local masses are positive, the product of local mass ratios over all places is (1/2)·2 = 1. The multiplied-out identities remain true when a mass is zero; the quotient at that place is then not used.

- An implementation that uses the odd-prime value at p = 2 obtains the average 2 instead of 3.

- At an odd prime with family mass t the soluble mass is t, while at two it is 2t, including t=0.

### 4.7 From soluble orbits to Selmer numerators

<a id="locally-soluble-set-is-cut-out-by-local-conditions"></a>

**Locally soluble set is cut out by local conditions.** Let F = `F_Σ` be a family of elliptic curves defined by congruence conditions (Layer 0). For f ∈ `V_Z`: f ∈ S(F) if and only if f ∈ `S_∞(F)` and f ∈ `S_p(F)` for every prime p (regarding `V_Z` inside `V_{Z_p}` and `V_R`). Consequently, for f ∈ `V_Z` with Δ(f) ≠ 0 and `φ_p := 1_{S_p(F)}/m_p`: `1_{S_∞(F)}(f)·Π_p φ_p(f) = 1_{S(F)}(f)/m(f)`.

F is presented as `F_Σ`: `E^{I,J} ∈ F` iff (I, J) ∈ `Σ_p` for every p, with Inv(F) ⊆ `Inv_p(F)` ⊆ `Σ_p`, and (I, J) = (−3A, −27B) for a minimal pair (A, B), a condition that is local at every prime.

Locally soluble means R-soluble and `Q_p`-soluble for all p (Layer 1). (I(f), J(f)) = (2⁴I, 2⁶J) with (I, J) ∈ Z² iff 2⁴ | I(f) and 2⁶ | J(f), a condition at p = 2 only. (I, J) ∈ Z² lies in Inv(F) iff it lies in `Inv_p(F)` for every p and in `Inv_∞(F)`: one direction because Inv(F) ⊆ `Inv_p(F)`; the other because (I, J) ∈ `Inv_p(F)` ⊆ `Σ_p` for all p puts `E^{I,J}` in `F_Σ` = F (Layer 0). Multiply the local weights: `Π_p m_p(f)^{-1} = m(f)^{-1}` by global-weight-is-product-of-local-weights.

*Needs:* [locally soluble forms attached to a family](#locally-soluble-forms-attached-to-a-family), [global weight is product of local weights](#global-weight-is-product-of-local-weights), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer).

([[1]](#ref-1), §3.2, p. 25; [[1]](#ref-1), §3, p. 22.)

**Checks.**

- For F the family of all curves and f = x³y − 16xy³, f lies in every `S_p(F)` and in `S_∞(F)`.

- For F = {E : A ≡ 1 (mod 5)} the condition at p = 5 alone excludes forms whose invariants have A ≢ 1 (mod 5).

<a id="selmer-count-as-weighted-orbit-count"></a>

**Selmer count as weighted orbit count.** Let F be a family of elliptic curves defined by congruence conditions. For every ε > 0 and X ≥ 1, `Σ_{E ∈ F, H'(E) < X} (#S_2(E) − 1) = Σ_{PGL_2(Z)·f ⊆ S(F), f irreducible over Q, H(f) < 2^{12}X} 1/m(f) + O_ε(X^{3/4+ε})`, where `S_2(E)` is the (finite) 2-Selmer group and the implied constant is independent of F.

`S_2(E)` is finite (Tau Ceti EllipticCurves layer 7) and is identified with the locally soluble 2-coverings of Layer 1. The weights 1/m(f) and 1/n(f) lie in (0, 1]; the error comes only from orbits with a nontrivial stabilizer in `PGL_2(Q)` and from forms that are products of two irreducible quadratic forms.

By Layer 1 (Theorem 3.5), the nonidentity elements of `S_2(E^{I,J})` correspond bijectively to the `PGL_2(Q)`-classes of locally soluble integral forms with invariants (2⁴I, 2⁶J) and no rational linear factor; distinct curves have distinct invariants, and `H(2⁴I, 2⁶J) = 2^{12}H(I, J)` (Layer 0). Each such class C meets `V_Z` in n(f) `PGL_2(Z)`-orbits, and `Σ_{orbits in C}` 1/n(f) = 1. By orbit-weight-as-a-stabilizer-sum, m(f) = n(f) unless some orbit in C has a nontrivial stabilizer in `PGL_2(Q)`; by Layer 2 (Lemma 2.4) the `PGL_2(Z)`-orbits of height < Y with nontrivial `PGL_2(Q)`-stabilizer number `O_ε(Y^{3/4+ε})`, and each weight is at most 1. Forms with no rational linear factor are irreducible or products of two irreducible quadratic forms; the latter have a ≠ 0 and are reducible, so by Layer 2 (Lemma 2.3 and Proposition 2.7: the cusp contains only forms with a = 0) they number `O_ε(Y^{2/3+ε})`.

*Needs:* [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer), [rational orbit weight](#rational-orbit-weight), [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum), [locally soluble forms attached to a family](#locally-soluble-forms-attached-to-a-family), [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [quartic to curve height normalisation](../ArithmeticStatisticsPartI/README.md#quartic-to-curve-height-normalisation), [binary quartic height](../ArithmeticStatisticsPartI/README.md#binary-quartic-height).

([[1]](#ref-1), §3.2, pp. 23–24; [[1]](#ref-1), Proof of Theorem 3.19, p. 33.)

**Checks.**

- For E: y² = x³ − x (A = −1, B = 0), `S_2(E)` has order 4 (E(Q) = E(Q)[2] and Ш[2] = 0), so E contributes 3 to the left side; since E(Q)[2] ≠ 0 its forms have nontrivial `PGL_2(Q)`-stabilizers and may be weighted differently on the right, which is why the error term is needed.

- The identity class (forms with a rational linear factor, e.g. x³y − 16xy³ for y² = x³ − x) is excluded from the right side.

<a id="bad-forms-have-square-discriminant"></a>

**Bad forms have square discriminant.** Call f ∈ `V_{Z_p}` bad at p if f is not `Q_p`-soluble or `m_p(f)` ≠ 1. If f ∈ `V_Z` (or `V_{Z_p}`) with Δ(f) ≠ 0 is bad at a prime p > 2, then p² | Δ(f). The half concerning `m_p` holds for every prime p.

p > 2 for the solubility half; Δ(f) ≠ 0.

If `m_p(f)` ≠ 1: nonintegral-local-translates-force-square-discriminant. If f is not `Q_p`-soluble: local-solubility-away-from-square-discriminant.

*Needs:* [nonintegral local translates force square discriminant](#nonintegral-local-translates-force-square-discriminant), [local solubility away from square discriminant](#local-solubility-away-from-square-discriminant).

([[1]](#ref-1), Proposition 3.18, p. 32.)

**Checks.**

- `f_0` = 2x⁴ + 4x²y² + 3xy³ + 2y⁴ is bad at 3 and 3² | Δ(`f_0`) = 28116.

- For p ≥ 5 every f with p² ∤ Δ(f) is good at p: this is what makes `1_{S_p(F)}/m_p` acceptable.

<a id="count-of-real-soluble-integral-orbits"></a>

**Count of real soluble integral orbits.** For a family F defined by congruence conditions and every ε > 0, N(`V_Z` ∩ `S_∞(F)`; X) = (1/27)·Vol(`PGL_2(Z)`\`PGL_2(R)`)·`M_∞(V, F; X)` + `O_ε(X^{3/4+ε})`.

Vol(`PGL_2(Z)`\`PGL_2(R)`) is taken with respect to |ω|_∞ for the ω of jacobian-of-the-orbit-map; its value 2ζ(2) is supplied by Layer 2.

By Layer 2 (Theorem 2.1 in the form (20), with the volumes (23)–(26)), `N(V_Z^{(i)} ∩ {Inv_∞}; X) = Vol(R_X(L^{(i)}))/n_i + O_ε(X^{3/4+ε})` with `Vol(R_X(L^{(i)})) = (1/27)·Vol(PGL_2(Z)\PGL_2(R))·∫_{R^{(i)}(X)} dIdJ`. By real-solubility-of-binary-quartic-forms the R-soluble components over `Inv_∞(F)` are i ∈ {0, 2+} above Δ > 0 and i = 1 above Δ < 0. By archimedean-selmer-ratio-is-one-half, `n_i` = #E(R)[2] and the number of soluble components above (I, J) is #(E(R)/2E(R)); summing, `Σ_{soluble i}` 1/`n_i` = #(E(R)/2E(R))/#E(R)[2], whose integral over {(I, J) ∈ `Inv_∞(F)`, H < X} is `M_∞(V, F; X)`.

*Needs:* [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [real solubility of binary quartic forms](#real-solubility-of-binary-quartic-forms), [archimedean selmer ratio is one half](#archimedean-selmer-ratio-is-one-half), [local masses of a family](#local-masses-of-a-family).

([[1]](#ref-1), §3.6, p. 33.)

**Checks.**

- For `Inv_∞` = {Δ > 0}: `2·(1/27)·2ζ(2)·(8/5)X^{5/6}/4 = (8/135)ζ(2)X^{5/6}`, which is `(1/27)·2ζ(2)·(4/5)X^{5/6}`.

- For `Inv_∞` = {Δ < 0}: `(1/27)·2ζ(2)·(32/5)X^{5/6}/2 = (32/135)ζ(2)X^{5/6}`.

### 4.8 Elliptic family denominators

<a id="lattice-points-of-bounded-invariant-height"></a>

**Lattice points of bounded invariant height.** Let L ⊆ Z² be a union of k cosets of mZ² (m ≥ 1). Then, uniformly in X ≥ 1, `#{(I, J) ∈ L : H(I, J) < X, 4I³ − J² > 0} = (k/m²)·(8/5)X^{5/6} + O_m(X^{1/2})` and `#{(I, J) ∈ L : H(I, J) < X, 4I³ − J² < 0} = (k/m²)·(32/5)X^{5/6} + O_m(X^{1/2})`.

H(I, J) = max{|I|³, J²/4}; the regions R^±(X) have areas `(8/5)X^{5/6}` and `(32/5)X^{5/6}` (source (24), (25)).

Count by columns: for fixed I with `|I| < X^{1/3}`, the admissible J form at most two intervals of total length ℓ_±(I) (`|J| < 2X^{1/2}` and J² < 4I³, resp. J² > 4I³), so each column contains ℓ_±(I)/m + O(1) points of each coset. Summing over the `O(X^{1/3}/m + 1)` admissible I in each residue class gives `(1/m)Σ_I ℓ_±(I) + O(X^{1/3})`, and `Σ_{I ≡ i_0 (m)} ℓ_±(I) = (1/m)∫ℓ_±(I) dI + O(max ℓ) = area/m + O(X^{1/2})`, since ℓ_± is piecewise monotone with a bounded number of pieces.

*Needs:* [binary quartic height](../ArithmeticStatisticsPartI/README.md#binary-quartic-height), `MeasureTheory.Measure.haarMeasure` (Mathlib).

([[1]](#ref-1), §3.5, p. 31; [[1]](#ref-1), Proof of Proposition 2.10, p. 14.)

**Checks.**

- L = Z² (k = m = 1): `#{H < X, Δ > 0} = (8/5)X^{5/6} + O(X^{1/2})`.

- L = 3Z × 27Z, the pairs (−3A, −27B), is the union of k = 9 cosets of 27Z², of density 9/27² = 1/81: the factor `3^{-4}` in `M_3` for the family of all curves before minimality.

<a id="tail-estimate-for-square-divisors-of-the-discriminant"></a>

**Tail estimate for square divisors of the discriminant.** There is an absolute constant C such that for all M ≥ 5 and X ≥ 2, `#{(A, B) ∈ Z² : 4|A|³ < X, 27B² < X, 4A³ + 27B² ≠ 0, p² | 4A³ + 27B² for some prime p > M} ≤ C(X^{5/6}/M + X^{5/6}/log X)`. In particular `limsup_{X→∞} X^{-5/6}·#{E : H(E) < X, p² | Δ(E) for some p > M} = O(1/M)`.

Pairs (A, B), not only minimal pairs, are counted; H(`E_{A,B}`) = max{4|A|³, 27B²}. Δ(`E_{A,B}`) = −16(4A³ + 27B²); for p ≥ 5 the conditions p² | Δ and p² | 4A³ + 27B² agree.

If p² | D := 4A³ + 27B² ≠ 0 then p² ≤ |D| ≪ X, so only primes `p ≪ X^{1/2}` occur. Multiplicative case p ∤ A (p ≥ 5): then p ∤ B, and for fixed A the congruence B² ≡ −4A³/27 (mod p²) has at most 2 solutions modulo p², so the number of pairs is `≪ (X^{1/3} + 1)(X^{1/2}/p² + 1) ≪ X^{5/6}/p² + X^{1/3}`. Additive case p | A: then p | B, and the number of pairs is `≪ (X^{1/3}/p + 1)(X^{1/2}/p + 1) ≪ X^{5/6}/p² + X^{1/2}/p + 1`. Sum over `M < p ≪ X^{1/2}`: `Σ X^{5/6}/p² ≪ X^{5/6}/M`, `Σ X^{1/3} ≪ X^{1/3}·X^{1/2}/log X`, `Σ X^{1/2}/p ≪ X^{1/2} log log X`, `Σ 1 ≪ X^{1/2}`.

*Needs:* [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), [binary quartic height](../ArithmeticStatisticsPartI/README.md#binary-quartic-height).

([[1]](#ref-1), Proof of Proposition 3.16, p. 32; [[1]](#ref-1), §3.5, p. 32.)

**Checks.**

- Pairs with p | A and p | B satisfy p² | 4A³ + 27B² and have density `p^{-2}`, so the tail is `≫ X^{5/6}/(M log M)`: the bound `O(X^{5/6}/M)` is sharp up to the logarithm.

- The per-prime bound `O(X^{5/6}/p² + X^{1/3})` is uniform, but its `X^{1/3}` remainder has no p-decay. Summing only over `p ≪ X^{1/2}` and using the elementary prime-counting bound is what gives the required `o(X^{5/6})` remainder.

<a id="binary-cubic-short-representative-uniformity"></a>

**Binary cubic short-representative uniformity.** Uniformly in primes p and real X≥1, `binaryCubic_shortRepresentative_uniformity` bounds by O(X/p²) the number of determinant-twisted GL₂(Z)-classes of integral binary cubics with 0<|Disc|<X, p² dividing Disc, and a representative x³+Axy²+By³ with A,B integral. Reducible cubics and orders nonmaximal away from p are included.

Prove the reducible contribution separately using its rational linear factor and quadratic-order discriminant/index description; retain the monic-short-representative restriction. For irreducible forms nonmaximal at p, use PartIII’s nonmaximal estimate. For the remaining field orders, let O be the order and O_K its maximal order. Prove the suborder/index summation, with Disc(O)=[O_K:O]²Disc(K), that transports PartV’s totally-ramified maximal-field estimate to orders maximal at p but nonmaximal elsewhere. This includes a uniform count of suborders at each index with the required local conditions and convergence of the resulting index sum; an unweighted count of fields cannot replace this sum.

*Needs:* [uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [cubic fields totally ramified at large primes are sparse](../ArithmeticStatisticsPartV/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse), [full-lattice order comparison](../ArithmeticStatisticsPartII/README.md#full-lattice-order-comparison), GlobalNumberFields Layer 11 (quadratic orders and ideals).

(Source: [[1]](#ref-1), proof of Proposition 3.16, p.32, the all-cubic estimate attributed there to Davenport–Heilbronn, Proposition 1.)

**Checks.**

- E:y²=x³−x gives x(x−y)(x+y), of discriminant four; the p=2 count includes this reducible class.
- For x³−5y³ the order Z[∛5] is maximal and totally ramified at five. Its suborder Z[2∛5] has short representative x³−40y³, index eight and discriminant −43200=8²(−675); it remains maximal at five and is nonmaximal at two.
- Nonzero discriminant is essential: x³ is excluded. The bound has no additive error independent of p; it gives zero once p²≥X.

<a id="uniformity-estimate-for-elliptic-curves"></a>

**Uniformity estimate for elliptic curves.** The number of elliptic curves E/Q with H'(E) < X and p² | Δ(E) is `O(X^{5/6}/p^{3/2})`, with the implied constant independent of p and X.

The count is over Q-isomorphism classes, i.e. minimal pairs (A, B) (Layer 0 / Tau Ceti EllipticCurves layer 8). For `p ≤ X^{1/3}` the elementary counts of tail-estimate-for-square-divisors-of-the-discriminant suffice; for larger p the proof uses [binary cubic short-representative uniformity](#binary-cubic-short-representative-uniformity), together with a uniform bound on the number of preimages.

Embed x³ + Ax + B ↦ the binary cubic form x³ + Axy² + By³; a `GL_2(Z)`-class has at most 12 preimages, since each preimage gives a distinct integral solution of v(a, b) = 1 and a cubic Thue equation of nonzero discriminant has at most 12 solutions (the [cubic Thue bound](#support-cubic-thue)). Apply `binaryCubic_shortRepresentative_uniformity` with discriminant cutoff CX, including its reducible and suborder contributions. Hence the curves with p² | Δ number O(X/p²). Additive reduction (p | A, p | B): `O(X^{5/6}/p² + X^{1/2}/p + 1)`, combined with O(X/p²) gives `O(X^{5/6}/p^{5/3})`. Multiplicative reduction with p² | Δ: `O(X^{1/3}(X^{1/2}/p² + 1))`, combined with O(X/p²) gives `O(X^{5/6}/p^{3/2})`.

*Needs:* [binary cubic short-representative uniformity](#binary-cubic-short-representative-uniformity), [tail estimate for square divisors of the discriminant](#tail-estimate-for-square-divisors-of-the-discriminant), [uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [cubic fields totally ramified at large primes are sparse](../ArithmeticStatisticsPartV/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height).

([[1]](#ref-1), Proposition 3.16 and proof, pp. 31–32; [[1]](#ref-1), Proof of Proposition 3.16, p. 32.)

**Checks.**

- For `p > X^{1/2}` the count is 0: H'(E) < X gives |4A³ + 27B²| ≤ 8X/27, and p² | Δ ≠ 0 forces p² ≤ 8X/27.

- Summing the bound over p > M gives `O(X^{5/6}/M^{1/2})`, a weaker tail than the elementary tail estimate but uniform in X.

- The curve y²=x³−x maps to the reducible cubic x(x−y)(x+y); its discriminant four is counted at p=2. The twelve-preimage argument does not require irreducibility.

<a id="count-of-curves-in-a-large-family"></a>

**Count of curves in a large family.** Let F be a large family of elliptic curves defined by congruence conditions and N(F; X) := #{E ∈ F : H'(E) < X}. Then `N(F; X) = M_∞(F; X)·Π_p M_p(F) + o(X^{5/6})`, and the product converges: `1 − M_p(F) = O(p^{-2})` for all but finitely many p.

For every nonempty finite union of coefficient residue classes admitting a minimal nonsingular pair, the denominator in height H has a positive limit of `N(F; X)/X^(5/6)`. Use the actual union of residue classes and its denominator; the general local-mass formula retains its stated hypotheses.

Curves are counted up to Q-isomorphism, through their invariants (I, J) = (−3A, −27B) for the unique minimal pair (A, B) (Layer 0, from Tau Ceti EllipticCurves layer 8). The main term may vanish (if some `M_p(F)` = 0); the statement is still true, and theorems dividing by N(F; X) assume `Π_p` `M_p(F)` > 0.

First incorporate the local minimal-pair conditions and I ∈ 3Z_p, J ∈ 27Z_p into `Σ_p`, obtaining `T_p`. The minimal-pair and divisibility conditions are clopen off Δ = 0. Intersecting them with the given relatively closed, null-boundary `Σ_p` makes `T_p` relatively closed there with null boundary; `T_p` itself need not be clopen. `Inv_p(F)` ⊆ `T_p`. For all sufficiently large p, largeness implies {p² ∤ Δ} ⊆ `Inv_p(F)` ⊆ `T_p`, so `1−μ_p(T_p)=O(p^{-2})`. If `μ_q(T_q)`=0 for some q, then `μ_q`(`Inv_q(F)`)=0. Compact clopen outer neighbourhoods of the closure of `T_q` have arbitrarily small mass (adding Δ=0 costs zero mass). The finite-congruence lattice count bounds `N(F;X)/X^{5/6}` by an arbitrarily small constant, proving the claimed zero main term without any regularity assertion about `Inv_p(F)` at other primes. Otherwise every `μ_p(T_p)`>0. Fix a prime q and a nonempty clopen ball B contained in the interior of `T_q`. CRT counts with finitely many inner clopen approximations to the other `T_p` have positive normalized main term: the infinite product of their masses is positive since `1−μ_p(T_p)=O(p^{-2})`. Choose the approximation errors summably small and the prime cutoff Y large enough that the discriminant-tail bound O(1/Y) is smaller than this main term. Count first as X→∞ with all finite data fixed. At least one resulting global minimal pair lies in B, meets all `T_p` and satisfies the chosen real sign. Repeating inside every subball proves interior(`T_q`) ⊆ `Inv_q(F)`. Thus, in this positive-mass case, interior(`T_p`) ⊆ `Inv_p(F)` ⊆ `T_p` for every p. The difference is supported on ∂`T_p`, so `μ_p`(`Inv_p(F)`)=`μ_p(T_p)`>0 and ∂`Inv_p(F)` is null. This supplies the boundary assertion; it is not inherited merely by taking a closed subset. Finite approximation: for a finite set of primes P and closed-open sets `U_p` ⊆ Z_p² that are finite unions of cosets of p^kZ_p², lattice-points-of-bounded-invariant-height gives `#{(I, J) ∈ Z² : (I, J) ∈ U_p ∀p ∈ P, (I, J) ∈ Inv_∞(F), H < X} = M_∞(F; X)Π_{p∈P} μ_p(U_p) + O_P(X^{1/2})`. Upper bound: in the positive-mass case, since ∂`Inv_p(F)` is null by the preceding CRT/tail argument, choose `U_p` ⊇ `Inv_p(F)` with `μ_p`(`U_p` \ `Inv_p(F)`) small; letting P grow gives `limsup N(F; X)/X^{5/6} ≤ M_∞(F; 1)Π_p M_p(F)`. Lower bound: choose `U_p` ⊆ `Inv_p(F)` for p ≤ Y; a pair in all `U_p` (p ≤ Y) but outside Inv(F) fails `Inv_p(F)` at some p > Y, and for Y beyond the exceptional primes of largeness this forces p² | Δ(I, J); by tail-estimate-for-square-divisors-of-the-discriminant these number `O(X^{5/6}/Y + X^{5/6}/log X)`. Convergence: for p ≥ 5 outside the exceptional set, `Inv_p(F)` ⊇ {p² ∤ Δ}, and `μ_p{p² | Δ(I, J)} ≤ 3p^{-2}` (at most 2 residues of J modulo p² for each unit I, and p² classes with p | I, p | J). Let Y → ∞.

*Needs:* [lattice points of bounded invariant height](#lattice-points-of-bounded-invariant-height), [tail estimate for square divisors of the discriminant](#tail-estimate-for-square-divisors-of-the-discriminant), [local masses of a family](#local-masses-of-a-family), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height).

([[1]](#ref-1), Theorem 3.17, (70), p. 32.)

**Checks.**

- Family of all curves: `N(F; X) ~ 8X^{5/6}/(81ζ(10))`; in terms of H(E) < T this is `(2^{4/3}/(3^{3/2}ζ(10)))T^{5/6}`.

- For a large family with a measure-zero Cantor-type condition at 5 the main term is 0 and `N(F; X) = o(X^{5/6})`.

- For a nonempty finite union of residue classes, split into disjoint classes and add their positive curve-count constants; coupled congruences need not give a product of marginal densities.

### 4.9 From soluble orbits to Selmer numerators

<a id="count-of-locally-soluble-orbits-in-a-large-family"></a>

**Count of locally soluble orbits in a large family.** Let F be a large family of elliptic curves defined by congruence conditions. Then, as Y → ∞, `Σ_{PGL_2(Z)·f ⊆ S(F), f irreducible, H(f) < Y} 1/m(f) = N(V_Z ∩ S_∞(F); Y)·Π_p ∫_{S_p(F)} m_p(f)^{-1} df + o(Y^{5/6})`, where N(`V_Z` ∩ `S_∞(F)`; Y) is the number of irreducible `GL_2(Z)`-orbits of integral forms that are R-soluble with invariants in `Inv_∞(F)` and height < Y, and the Euler product converges absolutely.

F large: for all but finitely many p, `Inv_p(F)` contains every (I, J) ∈ Z_p² with p² ∤ Δ(I, J) (Layer 0). The sieve of Layer 2 (Theorem 2.21) is applied separately to each component `V^{(i)}`, i ∈ {0, 1, 2+, 2−}; only the R-soluble components with invariants in `Inv_∞(F)` contribute.

Use the regularity dichotomy proved in count-of-curves-in-a-large-family. When every local specification has positive mass, each actual `Inv_p(F)` has null boundary and the following acceptable-weight argument applies. If a specification has zero mass at q, then `M_q(F)`=0 and the local mass formula makes the Euler product zero. Bound `1_{S(F)}/m ≤ 1_{S_q(F)}`; clopen outer approximations to the null inverse image of `Inv_q(F)`, followed by the one-prime Layer 2 lattice count, give a global `o(Y^{5/6})` upper bound. No boundary assertion at the other primes is needed in that case. Local weights: `φ_p := 1_{S_p(F)}/m_p: V_{Z_p} → [0, 1]` is locally constant outside a closed null set (local-weights-and-solubility-are-locally-constant). Product: for f ∈ `V_Z` with Δ(f) ≠ 0 in an R-soluble component with invariants in `Inv_∞(F)`, `Π_p φ_p(f) = 1_{S(F)}(f)/m(f)` (locally-soluble-set-is-cut-out-by-local-conditions, global-weight-is-product-of-local-weights); the product converges because `φ_p(f)` = 1 for p ∤ 6Δ(f) outside the exceptional primes of largeness. Acceptability ([acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function)): for p ≥ 5 outside the finite exceptional set, if p² ∤ Δ(f) then f is `Q_p`-soluble and `m_p(f)` = 1 (bad-forms-have-square-discriminant), and `(2^{-4}I(f), 2^{-6}J(f)) ∈ Inv_p(F)` by largeness since `Δ(2^{-4}I, 2^{-6}J) = 2^{-12}Δ(f)`; so `φ_p(f)` = 1. Apply Theorem 2.21 (Layer 2) on each R-soluble component and add; the Euler product converges because `1 − ∫φ_p ≤ μ_p{p² | Δ} = O(p^{-2})` for large p.

*Needs:* [uniformity estimate for infinitely many congruence conditions](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-infinitely-many-congruence-conditions), [acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function), [local weights and solubility are locally constant](#local-weights-and-solubility-are-locally-constant), [locally soluble set is cut out by local conditions](#locally-soluble-set-is-cut-out-by-local-conditions), [global weight is product of local weights](#global-weight-is-product-of-local-weights), [bad forms have square discriminant](#bad-forms-have-square-discriminant), [real solubility of binary quartic forms](#real-solubility-of-binary-quartic-forms), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [count of curves in a large family](#count-of-curves-in-a-large-family), [local mass formula for locally soluble forms](#local-mass-formula-for-locally-soluble-forms).

([[1]](#ref-1), Proof of Theorem 3.19, (72), p. 33; [[1]](#ref-1), §2.7, p. 19.)

**Checks.**

- For the family of all curves the local factor at p ≥ 5 is `∫_{S_p} m_p^{-1} = (1 − p^{-2})(1 − p^{-10})` (local-mass-formula-for-locally-soluble-forms and (74)).

- Replacing the weight 1/m by 1 would count `PGL_2(Z)`-orbits rather than Selmer elements and change every local factor at the primes dividing the discriminants.

### 4.10 The mean two-Selmer theorem

<a id="selmer-average-as-product-of-local-masses"></a>

**Selmer average as product of local masses.** Let F be a large family of elliptic curves defined by congruence conditions with `M_p(F)` > 0 for every prime p. Then `lim_{X→∞} (Σ_{E ∈ F, H'(E) < X} (#S_2(E) − 1)) / N(F; X) = Vol(PGL_2(Z)\PGL_2(R))·(M_∞(V, F; X)/M_∞(F; X))·Π_p ((1 − p^{-2})·M_p(V, F)/M_p(F))`, where the archimedean ratio `M_∞(V, F; X)`/`M_∞(F; X)`, taken at X > 0 so that `M_∞(F; X)` > 0, does not depend on X.

The positivity hypothesis `M_p(F)` > 0 for all p is not in the source's statement; without it the main terms may vanish and the argument gives no limit. Heights: forms of height < `2^{12}X` correspond to curves of height H' < X.

Fix 0 < ε < 1/12 so that `X^{3/4+ε}=o(X^{5/6})`. Numerator: by selmer-count-as-weighted-orbit-count and count-of-locally-soluble-orbits-in-a-large-family, `Σ(#S_2(E) − 1) = N(V_Z ∩ S_∞(F); 2^{12}X)·Π_p ∫_{S_p(F)} m_p^{-1} + o(X^{5/6})`. By count-of-real-soluble-integral-orbits and homogeneity (`M_∞(V, F; 2^{12}X) = 2^{10}M_∞(V, F; X)`), `N(V_Z ∩ S_∞(F); 2^{12}X) = (2^{10}/27)Vol(PGL_2(Z)\PGL_2(R))M_∞(V, F; X) + O(X^{3/4+ε})`. By local-mass-formula-for-locally-soluble-forms, `∫_{S_p(F)} m_p^{-1} = |2^{10}/27|_p(1 − p^{-2})M_p(V, F)`; the product formula gives `(2^{10}/27)·Π_p |2^{10}/27|_p = 1`. Denominator: count-of-curves-in-a-large-family, with `M_∞(F; X)Π_p M_p(F) ≍ X^{5/6}` by the positivity hypothesis. Take the ratio; `M_∞(V, F; X)`/`M_∞(F; X)` is constant by homogeneity (local-masses-of-a-family).

*Needs:* [selmer count as weighted orbit count](#selmer-count-as-weighted-orbit-count), [count of locally soluble orbits in a large family](#count-of-locally-soluble-orbits-in-a-large-family), [count of real soluble integral orbits](#count-of-real-soluble-integral-orbits), [local mass formula for locally soluble forms](#local-mass-formula-for-locally-soluble-forms), [count of curves in a large family](#count-of-curves-in-a-large-family), [local masses of a family](#local-masses-of-a-family), [average over a height ordered family](#average-over-a-height-ordered-family).

([[1]](#ref-1), Theorem 3.19, (71)–(73), p. 33.)

**Checks.**

- The Euler factors `(1 − p^{-2})M_p(V, F)/M_p(F)` are `1 − p^{-2}` for odd p and 2(1 − 1/4) = 3/2 at p = 2.

- The limit is a product over all places, with the archimedean factor 2ζ(2)·(1/2).

<a id="tamagawa-number-of-pgl2-is-two"></a>

**Tamagawa number of pgl2 is two.** With the measures |ω|_ν attached to the Z-generator ω of jacobian-of-the-orbit-map, `Vol(PGL_2(Z)\PGL_2(R))·Π_p vol(PGL_2(Z_p)) = 2ζ(2)·Π_p (1 − p^{-2}) = 2`.

The archimedean volume Vol(`PGL_2(Z)`\`PGL_2(R)`) = 2ζ(2) is supplied by Layer 2 (the source cites Langlands [33]).

Vol(`PGL_2(Z)`\`PGL_2(R)`) = 2ζ(2) (Layer 2). `vol(PGL_2(Z_p)) = 1 − p^{-2}` (volume-of-pgl2-zp). `Π_p (1 − p^{-2})^{-1} = ζ(2)` (Euler product, mathlib:riemannZeta_eulerProduct_tprod at s = 2), and ζ(2) = π²/6 ≠ 0 (mathlib:`riemannZeta_two`).

*Needs:* [averaging over the fundamental domain and cutting the cusp](../ArithmeticStatisticsPartIII/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [volume of pgl2 zp](#volume-of-pgl2-zp), `riemannZeta_eulerProduct_tprod` (Mathlib), `riemannZeta_two` (Mathlib).

([[1]](#ref-1), §3.6, p. 34; [[1]](#ref-1), §2.4, (23), p. 13.)

**Checks.**

- 2ζ(2)`Π_p(1 − p^{-2})` = 2ζ(2)/ζ(2) = 2: check the cancellation explicitly.

- Truncating the product at p ≤ 3 gives 2·(π²/6)·(3/4)(8/9) ≈ 2.19, and the partial products decrease to 2.

<a id="average-size-of-the-2-selmer-group-is-three"></a>

**Average size of the 2 selmer group is three.** Let F be a large family of elliptic curves over Q defined by congruence conditions (Layer 0) with `M_p(F)` > 0 for every prime p. When the curves in F are ordered by height H (equivalently H'), the average size of the 2-Selmer group is 3: `lim_{X→∞}` `Σ_{E ∈ F, H(E) < X}` #`S_2(E)` / #{E ∈ F : H(E) < X} = 3. The average of #`S_2(E)` − 1 equals Vol(`PGL_2(Z)`\`PGL_2(R)`)·`Π_p` vol(`PGL_2(Z_p)`) = 2, the Tamagawa number of `PGL_2`.

The Lean statement `average_twoSelmer_largeFamily` uses `IsLargeFamily` on integral short pairs. The definition uses the actual coefficient closures `localPairClosure` and their additive Haar probability measures `pairHaar`, with positive masses, null boundaries, the large-prime square-discriminant condition and a nonempty permitted real sign set. The transformation `(A,B)↦(−3A,−27B)` identifies these coefficient conditions with the invariant conditions above.

F must be large, not merely defined by congruence conditions: largeness allows infinitely many conditions but requires that at all but finitely many p nothing is excluded away from p² | Δ. `M_p(F)` > 0 for every p: an added hypothesis without which the source's proof does not apply. The ordering is by the naive height; a different ordering (by conductor or discriminant) is a different theorem. `S_2(E)` is the 2-Selmer group `Sel_2(E/Q)` of Tau Ceti EllipticCurves layer 7, identified by Layer 1 with the locally soluble 2-coverings; it is finite.

By selmer-average-as-product-of-local-masses the average of #`S_2(E)` − 1 is `Vol(PGL_2(Z)\PGL_2(R))·(M_∞(V, F; X)/M_∞(F; X))·Π_p (1 − p^{-2})M_p(V, F)/M_p(F)`. By local-selmer-mass-ratios the ratios are 1/2 at ∞, 2 at p = 2 and 1 at odd p. By tamagawa-number-of-pgl2-is-two the value is `2ζ(2)·(1/2)·2·Π_p(1 − p^{-2}) = 2`. Add the constant 1 (average-over-a-height-ordered-family: averages add) and pass from H' to H (27H = 4H').

*Needs:* [selmer average as product of local masses](#selmer-average-as-product-of-local-masses), [local selmer mass ratios](#local-selmer-mass-ratios), [tamagawa number of pgl2 is two](#tamagawa-number-of-pgl2-is-two), [average over a height ordered family](#average-over-a-height-ordered-family), [quartic to curve height normalisation](../ArithmeticStatisticsPartI/README.md#quartic-to-curve-height-normalisation), [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer).

([[1]](#ref-1), Definition of a large family, p. 22; [[1]](#ref-1), Theorem 3.1, p. 22; [[1]](#ref-1), §3.6, p. 34.)

**Checks.**

- Largeness check: the families of all curves, of finitely many congruence conditions, and of semistable curves are large (Layer 0); the semistable family excludes a positive-density set at every p (the additive pairs, all with p² | Δ) and is still large. What largeness forbids is excluding, at infinitely many p, pairs with p² ∤ Δ(I, J).

- Local-mass check: the ratio is 2 at p = 2 and 1 at the other primes; an implementation that treats p = 2 like the others obtains the average 2.

- Tamagawa check: 2ζ(2)`Π_p(1 − p^{-2})` = 2ζ(2)/ζ(2) = 2; verify the cancellation explicitly.

- Averaging check: the theorem computes the average of #`S_2(E)`, a size, not of the 2-Selmer rank; the passage to ranks costs the inequality 2k ≤ 2^k of rank-bound-from-the-selmer-average.

- Consistency: the value 3 agrees with the heuristic predictions of Poonen–Rains and of Delaunay combined with Goldfeld–Katz–Sarnak (source p. 2); those models are statements of Layer 5, not inputs here.

<a id="families-of-theorems-1-1-and-1-3-have-positive-local-masses"></a>

**Families of theorems 1 1 and 1 3 have positive local masses.** The family of all elliptic curves and the family of semistable elliptic curves are large families `F_Σ` with positive local masses. Every nonempty family of minimal pairs in a single residue class modulo m ≥ 1, with either discriminant sign condition or none, has the same properties. A general nonempty union of residue classes is a finite disjoint union of these families after empty classes are discarded. It is itself large and has positive local projection masses, but need not equal the intersection of those projections.

Nonemptiness in (b): a union of residue classes containing no minimal pair with Δ ≠ 0 (e.g. p⁴ | A and p⁶ | B) defines the empty family. In (c) semistability at 2 and 3 is a condition on the minimal model, not on the short model (A, B), which is never minimal at 2 when it has good reduction.

For one residue class, CRT factors its condition into independent prime-power conditions. Intersect these with local minimality and the permitted real sign. For all curves use the trivial residue condition. For semistability use the good-or-multiplicative locus, relatively clopen off Δ=0 by the layer-4 reduction-type input; at 2 and 3 this is a condition on a minimal model, not the original short equation. To show density in a specified admissible ball at one prime, choose a nonzero integer B satisfying that ball and all the finitely many prescribed congruences. For each additional prime dividing B, impose A≡1 there by CRT; at specified primes retain the existing local minimality conditions. For semistability impose the open good-or-multiplicative conditions at 2 and 3 first and require gcd(A,B) prime to every other prime. The resulting progression of A has arbitrarily large positive and negative members, providing either discriminant sign and avoiding the finitely many singular choices. This proves the needed actual local closures and largeness. Each nonempty local condition has interior containing a ball around a member of the family. For semistability use y²+y=x³−x as a simultaneous witness of good reduction at 2 and 3; local constancy supplies the balls. Haar measure of a nonempty ball is positive. For a general allowed set modulo m, partition it into its individual residue classes. Apply the preceding assertions separately; do not replace the allowed set by the product of its projections, which can add classes.

*Needs:* [all elliptic curves form a large family](../ArithmeticStatisticsPartI/README.md#all-elliptic-curves-form-a-large-family), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [local masses of a family](#local-masses-of-a-family), `WeierstrassCurve.HasGoodReduction` (Mathlib), `WeierstrassCurve.HasMultiplicativeReduction` (Mathlib), `WeierstrassCurve.IsMinimal` (Mathlib).

([[1]](#ref-1), §3, p. 22.)

**Checks.**

- For (a): `M_p = 1 − p^{-10}` (p ≥ 5), `M_3 = 3^{-4}(1 − 3^{-10})`, `M_2 = 1 − 2^{-10}`.

- The family {B = 0} (j = 1728) is not large (Layer 0), and the Cantor-type family is large with `M_5(F)` = 0: both fail the hypotheses.

- A∈{0,1} mod 6 is not equivalent to its separate projections at 2 and 3: their intersection also permits A≡3,4 mod 6. Use the two disjoint classes A≡0 and A≡1, each with its own product of local conditions.

<a id="average-selmer-size-over-all-curves-and-congruence-families"></a>

**Average selmer size over all curves and congruence families.** When all elliptic curves over Q are ordered by height (Theorem 1.1), or those in any nonempty family E: y² = x³ + Ax + B defined by finitely many congruence conditions on A and B (Theorem 1.3), or all semistable elliptic curves, the average size of the 2-Selmer group `S_2(E)` is 3.

Ordering by the naive height H(`E_{A,B}`) = max{4|A|³, 27B²} of the minimal pair. The Lean target `average_twoSelmer_congruence` states the finite-congruence assertion using `twoSelmerSize`, the cardinality of Tau Ceti's `WeierstrassCurve.Affine.selmerGroup₂` with `R = ℤ` and the single real completion. Its hypothesis `IsFiniteCongruenceFamily` requires a minimal nonsingular pair in the permitted residue set and allows either discriminant sign or both, with coupled residue conditions retained. Taking all residue classes gives the all-curve theorem.

Apply average-size-of-the-2-selmer-group-is-three to all curves, to each nonempty individual residue class, and to the semistable family. For a finite disjoint union F=⊔`F_i`, the deviations `Σ_{E∈F_i,H<X}`(#S₂(E)−3) are o(N(`F_i`;X)); for any ε>0 choose a common threshold for all finitely many i, add the bounds, and divide by `Σ_i` N(`F_i`;X). The union also has average 3, without any assertion that it is one independent product of local conditions.

*Needs:* [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three), [families of theorems 1 1 and 1 3 have positive local masses](#families-of-theorems-1-1-and-1-3-have-positive-local-masses).

([[1]](#ref-1), Theorems 1.1 and 1.3, pp. 1–2.)

**Checks.**

- Restricting to A ≡ 1 (mod 5) does not change the average: it is still 3.

- Restricting to Δ > 0 or Δ < 0 (a condition at ∞) does not change the average either.

- A residue set forcing p⁴|A and p⁶|B has no minimal nonsingular pair; it fails the Lean theorem's nonemptiness hypothesis and its empty sublevels have average zero.

### 4.11 Rank and torsion consequences

<a id="rational-two-torsion-has-density-zero"></a>

**Rational two torsion has density zero.** #{(A, B) ∈ Z² : max{4|A|³, 27B²} < X, x³ + Ax + B has a rational root} = `O(X^{1/2})`. Consequently, for every large family F with `M_p(F)` > 0 for all p, the proportion of E ∈ F with E(Q)[2] ≠ 0 tends to 0 and the average of `r_2`(E(Q)[2]) over F is 0.

`E_{A,B}(Q)`[2] ≠ 0 iff x³ + Ax + B has a rational root; `r_2`(E(Q)[2]) ≤ 2.

A rational root of the monic integral cubic is an integer r (mathlib:isInteger_of_is_root_of_monic), and then B = −r³ − Ar. With `|A| ≤ α := (X/4)^{1/3}`: if `r² ≥ 4α` then `|r³ + Ar| ≥ (3/4)|r|³ ≥ 6α^{3/2} > (X/27)^{1/2}`, so `|r| < 2α^{1/2} ≪ X^{1/6}`; each pair (A, r) determines B, giving `O(X^{1/3}·X^{1/6}) = O(X^{1/2})` pairs. By count-of-curves-in-a-large-family, `N(F; X) ≫ X^{5/6}` when `Π_p` `M_p(F)` > 0; divide.

*Needs:* [count of curves in a large family](#count-of-curves-in-a-large-family), [average over a height ordered family](#average-over-a-height-ordered-family), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), `isInteger_of_is_root_of_monic` (Mathlib).

([[1]](#ref-1), §1.1, p. 2.)

**Checks.**

- The family y² = x³ + Ax (B = 0, r = 0) has rational 2-torsion and `O(X^{1/3})` members of height < X.

- The bound is a density statement, not an inequality between ranks.

<a id="rank-bound-from-the-selmer-average"></a>

**Rank bound from the selmer average.** Let F be a large family with `M_p(F)` > 0 for every prime p (for Corollary 1.2 itself, the family of all elliptic curves), ordered by height. Then `limsup_{X→∞}` `Avg_F`(`r_2`(`S_2(E)`); X) ≤ 3/2 and `limsup_{X→∞}` `Avg_F`(r(E); X) ≤ 3/2: the average 2-Selmer rank, and hence the average rank, of elliptic curves in F is bounded by 1.5. This bounds the Mordell–Weil rank; it does not compute it, since r(E) and `r_2`(`S_2(E)`) differ by `r_2`(E(Q)[2]) + `r_2(Ш_E[2])`, which is not controlled.

The conclusion is about the upper average (limsup); no lower bound and no limit is asserted. The Lean target `average_rank_le_of_twoSelmer_mean` states the Mordell–Weil rank consequence for any set of short pairs whose two-Selmer average tends to three, with rank `Module.finrank ℤ (shortCurve ab).Point`. Its conclusion is the eventual bound `Avg_F(rank; X) ≤ 3/2+ε` for every ε>0, which also excludes an infinite upper average. The inequality 2k ≤ 2^k for k ∈ N, an equality exactly at k = 1, 2, is where the loss from average size 3 to average rank 1.5 occurs. The rank bound needs E(Q) finitely generated and `S_2(E)` finite (EllipticCurves Layer 7's pointwise identity).

Pointwise, `2·r_2(S_2(E)) ≤ 2^{r_2(S_2(E))} = #S_2(E)` (mathlib:Nat.mul_le_pow with a = 2: 2k ≤ 2^k). Average: `Avg_F`(`r_2(S_2)`; X) ≤ `Avg_F(#S_2; X)`/2 → 3/2 by average-size-of-the-2-selmer-group-is-three, so the upper average is at most 3/2. r(E) ≤ `r_2`(`S_2(E)`) (EllipticCurves Layer 7's pointwise identity), so the upper average of r(E) is at most 3/2 (`upperFamilyAverage_mono`).

*Needs:* [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three), EllipticCurves Layer 7's pointwise two-Selmer rank identity (Scope and ownership), [average over a height ordered family](#average-over-a-height-ordered-family), `Nat.mul_le_pow` (Mathlib).

([[1]](#ref-1), Corollary 1.2 with the identity (2) and the surrounding argument, p. 2.)

**Checks.**

- The Selmer average bounds the rank only through the proved inequality 2k ≤ 2^k, and the Selmer rank is not equated with the Mordell–Weil rank; the difference `r_2`(E(Q)[2]) + `r_2(Ш_E[2])` is not controlled.

- Check the loss: #`S_2(E)` is always a power of 2, and 2k ≤ 2^k is an equality only at k = 1, 2. Mean size 3 gives mean 2-Selmer rank ≤ 3/2 through this inequality (Jensen's inequality would give only log₂3 ≈ 1.585). The conjectured average rank 1/2 (Goldfeld, Katz–Sarnak, p. 1) is a separate statement about Mordell–Weil ranks.

- Check the direction: Theorem 1.1 is an equality (average exactly 3); Corollary 1.2 is only an upper bound for ranks.

- Check that the 2-torsion term is handled by a density statement (rational-two-torsion-has-density-zero), not by an inequality.

<a id="average-two-rank-of-sha-is-at-most-three-halves"></a>

**Average two rank of sha is at most three halves.** For every large family F with `M_p(F)` > 0 for all p: `limsup_{X→∞}` `Avg_F`(`r_2(Ш_E[2])`; X) ≤ 3/2 and `Avg_F`(`r_2`(E(Q)[2]); X) → 0.

Ш_E[2] is the 2-torsion of the Shafarevich–Tate group of Tau Ceti EllipticCurves layer 7; no finiteness of Ш_E is assumed.

The three summands in EllipticCurves Layer 7's pointwise identity are nonnegative, so `r_2(Ш_E[2])` ≤ `r_2`(`S_2(E)`); apply rank-bound-from-the-selmer-average. The 2-torsion average is rational-two-torsion-has-density-zero.

*Needs:* EllipticCurves Layer 7's pointwise two-Selmer rank identity (Scope and ownership), [rank bound from the selmer average](#rank-bound-from-the-selmer-average), [rational two torsion has density zero](#rational-two-torsion-has-density-zero).

([[1]](#ref-1), §1.1, p. 2.)

**Checks.**

- The bound on Ш[2] is not a statement about Ш_E itself, whose finiteness is not known.

- The same bound 3/2 holds for each summand separately, not for their sum beyond `r_2(S_2)`.

### 4.12 Height moments

<a id="height-moments-in-an-arithmetic-family"></a>

**Height moments in an arithmetic family.** Let F be an arithmetic family ordered by a height ([arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family)): a set F with h : F → ℝ such that F(X) := {x ∈ F : h(x) < X} is finite for every X, and `N_F(X)` := #F(X) → ∞. For f : F → [0, ∞] and an integer m ≥ 1 put `S_m(f; X)` := `Σ_{x ∈ F(X)}` f(x)^m. The upper and lower m-th height moments of f are M⁺_m(f) := `limsup_{X→∞}` `S_m(f;X)`/`N_F(X)` and M⁻_m(f) := `liminf_{X→∞}` `S_m(f;X)`/`N_F(X)`, both in [0, ∞]; the m-th moment exists when they agree. For m = 1 these give extended nonnegative upper and lower averages. For real-valued f ≥ 0 with eventually bounded averages, the upper moment is ENNReal.ofReal of the real upper average of [average over a height ordered family](#average-over-a-height-ordered-family); when the averages converge, both moments equal that average. Without boundedness the extended upper moment can be ∞ while real limsup takes a junk value. For an indicator 1_A they are the upper and lower relative densities of [relative density](../ArithmeticStatisticsPartI/README.md#relative-density); Layer 5 writes μ^±(A) for those densities and does not redefine them. The family, its height and its counting function are imported unchanged from Layer 0; this node adds the higher moments and the [0, ∞]-valued upper and lower versions. Limits are taken over real X → ∞; no weighting other than the one fixed by Layer 0 (counting each member once) is used.

Here F(X) is finite for every real X, `N_F(X)` → ∞, f takes values in [0, ∞] and m ≥ 1. The compatibility statement `familyUpperMoment_one_eq_upperFamilyAverage` takes the limsup after ENNReal.ofReal; it does not move ENNReal.ofReal outside a real limsup. The comparison with the real limsup carries an eventual upper-bound hypothesis.

Required API:

- `familyUpperMoment`: M⁺_m(f) := `limsup_{X→∞}` (`Σ_{x∈F(X)}` f(x)^m)/#F(X) in [0,∞].

- `familyLowerMoment`: M⁻_m(f) := `liminf_{X→∞}` (`Σ_{x∈F(X)}` f(x)^m)/#F(X) in [0,∞].

- `familyUpperDensity`: familyUpperMoment of the indicator of A with m = 1 equals Layer 0's upper relative density d̄(A | F).

- `familyLowerDensity`: familyLowerMoment of the indicator of A with m = 1 equals Layer 0's lower relative density d̲(A | F).

- `familyUpperMoment_one_eq_upperFamilyAverage`: For real f ≥ 0, the extended upper moment equals limsup in ENNReal of ENNReal.ofReal of the finite-cutoff averages. Identifying this with ENNReal.ofReal of Layer 4 real limsup additionally requires eventual boundedness above of those averages.

- `familyLowerMoment_le_familyUpperMoment`: M⁻_m(f) ≤ M⁺_m(f) once #F(X) → ∞.

- `familyUpperMoment_mono`: f ≤ g pointwise implies M⁺_m(f) ≤ M⁺_m(g) and M⁻_m(f) ≤ M⁻_m(g).

- `familyUpperMoment_add_le`: M⁺_1(f + g) ≤ M⁺_1(f) + M⁺_1(g) (subadditivity of limsup).

- `familyLowerDensity_compl`: μ⁻(F \ A) = 1 − μ⁺(A).

- `familyUpperDensity_le_upperMoment_div`: Markov: for t > 0, μ⁺({x : t ≤ f(x)}) ≤ M⁺_1(f)/t.

- `familyUpperMoment_const`: For the constant function c, M⁺_m(c) = M⁻_m(c) = c^m.

- `familyUpperMoment_one_eq_ofReal_limsup`: For real f ≥ 0 with eventually bounded finite-cutoff averages, the extended upper first moment equals ENNReal.ofReal of the real limsup. The eventual boundedness premise is essential.

Define `S_m(f;X)` as a finite sum over F(X) (finiteness from [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family)) and the ratio `S_m(f;X)`/`N_F(X)` in [0, ∞] for X large enough that F(X) is nonempty. Define M⁺_m, M⁻_m as limsup and liminf along X → ∞ in [0, ∞] (Filter.limsup / Filter.liminf on ENNReal, which always exist), and the densities as the first moments of indicator functions. Relative density: the ratio of the two counting functions of B and A, defined when #(A ∩ F(X)) → ∞.

*Needs:* [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), [relative density](../ArithmeticStatisticsPartI/README.md#relative-density), [average over a height ordered family](#average-over-a-height-ordered-family), `Filter.limsup` (Mathlib).

([[28]](#ref-28), §1.2, Conjecture 1.1(a), parenthetical definition, p. 2; [[29]](#ref-29), §5.5, Remark 5.12, p. 20.)

**Checks.**

- For F = positive integers ordered by h(n) = n and A = even integers, familyUpperDensity A = familyLowerDensity A = 1/2.

- If #F(X) → ∞ and A is finite then familyUpperDensity A = 0.

- There is A ⊆ `ℤ_{≥1}` (the integers n with ⌊log₂ n⌋ even) with familyUpperDensity A + familyUpperDensity (F \ A) > 1, so upper density is not additive and cannot be replaced by a limit without proof.

- For an indicator function, familyUpperMoment (1_A) m = familyUpperDensity A for every m ≥ 1.

- M⁻_m(f) ≤ M⁺_m(f) always; equality for f constant.

- Markov inequality: μ⁺({f ≥ t}) ≤ M⁺_1(f)/t for every t > 0, the step used to pass from average Selmer sizes to proportions of Selmer ranks.

### 4.13 Selmer distribution conjectures

<a id="rational-p-torsion-has-density-zero"></a>

**Rational p torsion has density zero.** For every prime p, the set of `E_{A,B}` with E(ℚ)[p] ≠ 0 has density 0 in the family of elliptic curves over ℚ ordered by naive height.

Here p is any prime. The density is the height average of the indicator of a nonidentity point killed by p on the Weierstrass point group.

p = 2: this is [rational two torsion has density zero](#rational-two-torsion-has-density-zero) (an integer root t of x³ + Ax + B gives B = −t³ − At with `|t| ≪ X^{1/6}`, so `O(X^{1/2})` pairs against `≍ X^{5/6}` curves). p odd: E(ℚ)[p] ≠ 0 forces a rational root of the p-division polynomial of `E_{A,B}`. The generic curve over ℚ(A, B) has no rational p-torsion (its mod-p image is `GL_2(𝔽_p)`, so its p-division polynomial has no root in ℚ(A, B); this generic statement is part of the present target), so the set is contained in a thin set of (A, B) ∈ ℤ², which by the counting form of Hilbert irreducibility has `o(X^{5/6})` points in the box `|A| ≪ X^{1/3}, |B| ≪ X^{1/2}` (InverseGaloisAndArithmeticFundamentalGroups:IG.2).

*Needs:* [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), InverseGaloisAndArithmeticFundamentalGroups:IG.2, [rational two torsion has density zero](#rational-two-torsion-has-density-zero).

([[28]](#ref-28), §5, first paragraph, p. 21; [[29]](#ref-29), §5.5, Lemma 5.7 and proof, p. 19.)

**Checks.**

- The Tate normal forms show infinitely many curves with rational 3-, 5- and 7-torsion, so the set is infinite; it has density zero only.

- For p=2, the family B=0 has a nonidentity two-torsion point and only `O(X^(1/3))` members below height X; its relative density is zero.

- The identity is always killed by p. The indicator excludes it, so a curve with trivial rational p-torsion contributes zero.

### 4.14 Proved Selmer means and higher moments

<a id="average-size-of-the-3-selmer-group"></a>

**Average size of the 3 selmer group.** Let F be a large elliptic family with positive local masses and nonempty real sign region. Ordered by the minimal-short-pair height, average #`Sel_3(E)` exists and equals 4. Finite disjoint unions use their actual denominator weights. The full family and nonempty finite-congruence families are included.

Apply the acceptable-weight orbit sieve of PartIII to the actual family and local-solubility weights. At all sufficiently large primes the weight is one away from square discriminant; its weighted tail permits the infinite-prime limit after the height limit. The matching curve denominator is `c_F X^(5/6)+o(X^(5/6))` with `c_F>0` by [count of curves in a large family](#count-of-curves-in-a-large-family). Retain the same invariant scaling, real sign region and finite congruences in numerator and denominator.

Parametrisation (source §3): 3-Selmer elements of `E_{A,B}` correspond to `PGL_3(ℚ)`-classes for the determinant-twisted action γ·f(x)=det(γ)⁻¹f(xγ) of locally soluble ternary cubic forms with invariants (I, J) matching (A, B) (up to fixed scalars), with integral representatives and stabiliser E[3]; this is a genus-one orbit parametrisation in the scope of Layer 1 (the explicit genus-one orbit dictionaries stated there). Counting (source §2): the number of `SL_3(ℤ)`-classes of strongly irreducible integral ternary cubic forms (no rational flex) of height < X, via averaging over a fundamental domain for `SL_3(ℤ)` acting on `SL_3(ℝ)` and cutting off the cusp, is `(vol) · X^{5/6} + o(X^{5/6})`; this is the geometry-of-numbers step of Layer 2 for the representation Sym³(3) of `SL_3`, with Davenport's lemma imported from GeometryOfNumbersAndQuadraticArithmetic §4.1. Sieve to locally soluble forms and to F (source §3): multiply by local masses; the uniformity estimate for infinitely many congruence conditions is the Layer 2 tail estimate. Mass computation: the product of local masses and the Tamagawa number τ(`PGL_3`) = 3 give 3 nontrivial elements on average; add the identity element: 1 + 3 = 4 = σ(3). The smooth finite-field ternary-cubic count in source Lemma 33 must use stack weights: the claim of exactly one `F_p`-isomorphism class per j is false because of twists. For each elliptic curve, degree-3 line bundles modulo translations carry mass #E(`F_p`)/3E(`F_p`) divided by #E(`F_p`)[3], which is 1; summing 1/#Aut(E) over elliptic curves gives p. Equation scalings then give p(p−1)#PGL₃(`F_p`). This repairs the stated finite-field count without the false j-class assertion.

*Needs:* [count of curves in a large family](#count-of-curves-in-a-large-family), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family), [ternary cubic forms and their invariants](../ArithmeticStatisticsPartII/README.md#ternary-cubic-forms-and-their-invariants), [invariance of ternary cubic invariants](../ArithmeticStatisticsPartII/README.md#invariance-of-ternary-cubic-invariants), [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), [ternary cubic acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-ternary-cubic-acceptable-count), [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three).

([[30]](#ref-30), Theorem 27, §3, p.15; §1, Theorem 1, p. 1 (arXiv v2); [[30]](#ref-30), §1, Theorem 3, p. 1 (arXiv v2); [[30]](#ref-30), §1, p. 2 (arXiv v2).)

**Checks.**

- The value 4 = 3 + 1 is the Poonen–Rains prediction p + 1 at p = 3 and the value σ(3) of the sum-of-divisors prediction σ(n) for the average size of `Sel_n`.

- Independent of the congruence family: the average is 4 for every such F (contrast: twist families, BKLOS).

- The squarefree-discriminant family of §4.22 has infinitely many local conditions and is covered by this sieve; a family with a zero local mass is excluded.

<a id="average-rank-bound-from-the-3-selmer-average"></a>

**Average rank bound from the 3 selmer average.** Over `E_{A,B}`/ℚ ordered by height, the upper average of the 3-Selmer rank `r_3(E)` := `dim_{𝔽_3}` `Sel_3(E)` is at most 7/6; hence the upper average of rank E(ℚ) is at most 7/6 < 1.17. Use the minimal-pair, congruence-family, height and moment conventions above.

The input is that the average of #`Sel_3` is 4 ([average size of the 3 selmer group](#average-size-of-the-3-selmer-group)). The Lean target `average_rank_le_seven_sixths` states the Mordell–Weil conclusion on `shortCurve` point groups for `IsLargeFamily` or `IsFiniteCongruenceFamily`, as an eventual bound `7/6+ε` for each ε>0.

For every integer r ≥ 0, 6r − 3 ≤ 3^r (equality at r = 1, 2; convexity). At each nonempty height cutoff, the pointwise inequality gives `6·Avg(r₃)≤Avg(3^{r₃})+3`. Take limsup and use `Avg(3^{r₃})→4` to obtain M⁺₁(r₃)≤7/6. This is an affine inequality at finite cutoffs; an upper moment is not generally linear under sums. rank E(ℚ) ≤ `r_3(E)` since E(ℚ)/3E(ℚ) ↪ `Sel_3(E)` (EllipticCurves Layer 7), the step of [rank bound from the selmer average](#rank-bound-from-the-selmer-average).

*Needs:* [average size of the 3 selmer group](#average-size-of-the-3-selmer-group), [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family), [rank bound from the selmer average](#rank-bound-from-the-selmer-average).

([[30]](#ref-30), §1, Corollary 2, p. 1 (arXiv v2).)

**Checks.**

- With 2r ≤ 2^r and the 2-Selmer average 3 the same argument gives the Layer 4 bound 3/2.

- Equality in `6r−3≤3^r` occurs at r=1 and r=2; at r=0 the inequality is strict.

- A residue condition admitting no minimal nonsingular pair is excluded from the Lean statement; its zero empty-family average gives no rank information.

<a id="average-size-of-the-4-selmer-group"></a>

**Average size of the 4 selmer group.** When the curves of any nonempty subfamily of `E_{A,B}`/ℚ defined by finitely many congruence conditions are ordered by height, the average of #`Sel_4(E)` exists and equals 7 = σ(4). Use the minimal-pair, congruence-family, height and moment conventions above.

Here F is a nonempty family of `E_{A,B}`/ℚ defined by finitely many congruence conditions on (A, B), and its height counting function tends to infinity; the congruence conditions must admit minimal nonsingular models, so empty congruence families are excluded.

Parametrisation: locally soluble 4-coverings of E embed in ℙ³ as intersections of two quadrics (Cassels), so 4-Selmer elements correspond to locally soluble G(ℚ)-orbits on pairs of quaternary quadratic forms 2 ⊗ Sym²(4), `G = {(g_2, g_4) : det g_2 det g_4 = 1}/{(λ^{−2}I_2, λI_4)}`, whose invariants correspond to (A, B) (the explicit genus-one orbit dictionaries stated there; scope of Layer 1). Counting integral orbits of bounded height in a fundamental domain and sieving to local solubility and to F (Layer 2 methods, GeometryOfNumbersAndQuadraticArithmetic §4.1 Davenport input). Mass computation with τ(G) and local masses gives σ(4) = 7 on average, the kernel of `Sel_4(E)→Sel_2(E)` restored through the two-descent sequence. The two-Selmer image is this kernel, and the map is injective when E(Q)[2]=0; prove separately that rational-two-torsion curves have negligible weighted contribution in the quaternary count, using its cusp and exceptional-orbit estimates rather than coefficient density alone. Strong irreducibility excludes the trivial induced two-cover, rather than every four-Selmer class of order at most two. Use PartII `GenusOneModel`’s induced-cover comparison and [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three).

*Needs:* [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family), [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), [quaternary acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-quaternary-acceptable-count), [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three).

([[31]](#ref-31), §1, Theorem 2, p. 1 (arXiv v1); [[31]](#ref-31), §1, p. 2 (arXiv v1).)

**Checks.**

- 7 = 1 + 2 + 4 = σ(4) agrees with the sum-of-divisors prediction σ(n) for the average size of `Sel_n`; for n prime it reduces to n + 1, while n = 4 is not prime.

- Not a moment of `Sel_2`: the second moment of #`Sel_2` is predicted to be 15, not 7.

- On E:y²=x³−x, the class of (0,0) has order two in E(Q)/4E(Q), but nonzero reduction in E(Q)/2E(Q); its resolvent u⁴+4v⁴ has no rational linear factor.

<a id="average-size-of-the-5-selmer-group"></a>

**Average size of the 5 selmer group.** Let F be a large elliptic family with positive local masses and nonempty real sign region. Ordered by the minimal-short-pair height, average #`Sel_5(E)` exists and equals 6. Finite disjoint unions use their actual denominator weights. The full family and nonempty finite-congruence families are included.

Apply the acceptable-weight orbit sieve of PartIII to the actual family and local-solubility weights. At all sufficiently large primes the weight is one away from square discriminant; its weighted tail permits the infinite-prime limit after the height limit. The matching curve denominator is `c_F X^(5/6)+o(X^(5/6))` with `c_F>0` by [count of curves in a large family](#count-of-curves-in-a-large-family). Retain the same invariant scaling, real sign region and finite congruences in numerator and denominator.

Parametrisation: locally soluble 5-coverings embed in ℙ⁴ as genus-one normal curves of degree 5, cut out by the 4 × 4 Pfaffians of a 5 × 5 alternating matrix of linear forms; 5-Selmer elements correspond to locally soluble G(ℚ)-orbits on quintuples of 5 × 5 alternating matrices, where G={(g₁,g₂)∈GL₅×GL₅:(det g₁)²det g₂=1}/{(λI₅,λ⁻²I₅)}. The simply connected group SL₅×SL₅ has the same invariant polynomials, but its rational orbits are not the required parametrization (the explicit genus-one orbit dictionaries stated there; scope of Layer 1). Counting and sieving as for n = 3, 4 (Layer 2 methods). Mass computation: 5 nontrivial elements on average plus the identity.

*Needs:* [count of curves in a large family](#count-of-curves-in-a-large-family), [family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family), [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), [quinary acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-quinary-acceptable-count).

([[32]](#ref-32), Theorem 31, §4, p.21; §1, Theorem 2, p. 1 (arXiv v1); [[32]](#ref-32), §1, p. 2 (arXiv v1).)

**Checks.**

- 6 = 5 + 1 is the Poonen–Rains prediction p + 1 at p = 5.

- Combined with Layer 4's rank inequality the average rank is at most (6 + 15)/20 = 1.05 using 20r − 15 ≤ 5^r; the sharper bound 0.885 follows from the [root-balanced-family mixture](#refinement-five-full-average-rank).

- The squarefree-discriminant family of §4.22 has infinitely many local conditions and is covered by this sieve; a family with a zero local mass is excluded.

<a id="marked-quartic-factorial-moment-bound"></a>

**Marked quartic factorial-moment bound.** Let F be a nonempty family of minimal short elliptic curves over Q specified by finitely many congruence conditions, with either discriminant sign or none. Write N(E)=#Sel₂(E), H(E)=max(4|A|³,27B²), and `D_F(X)`=#{E∈F:H(E)<X}. Then

```text
limsup_(X→∞) D_F(X)⁻¹ Σ_(E∈F,H(E)<X) (N(E)−1)(N(E)−2) ≤ 8.
```

The summand is nonnegative: N(E) is a power of two, so it is zero when N=1 or 2. It counts an ordered nonidentity first class and a second class excluding the identity and that first class. Equivalently, mark each nontrivial quartic covering of E, then remove its two distinguished second classes. The denominator is the count of elliptic curves, not the count of marked quartics. Use real subtraction in the finite-congruence-family bound; it gives an eventual upper bound `8+ε` for every ε>0.

Prove this bound by inserting the [marked quartic Selmer embedding](../ArithmeticStatisticsPartII/README.md#marked-quartic-selmer-embedding) into the smoothed orbit integral. Retain the reciprocal transporter weights on both the quartic and the fixed-A representations. Nongeneric nondistinguished orbits contribute `O_F`(X^(5/6−λ)) for some λ>0 after integration, rather than merely having coefficient density zero. The two distinguished classes account exactly for the subtracted 2 for every generic first class.

The leading-coefficient sum requires the following uniform estimates as part of this target. If p divides a exactly once, the special integral representatives have rank at most one modulo p; their local density is p⁻⁶. For valuation j≥2 the specialness condition comes from the integral ideal-square-root construction, not just that rank-one reduction. It has a majorant with prime-power factors p⁻¹² at j=2, p⁻¹⁷ at j=3, and p^(−11j/2) at j≥4. These give a summable bound on coefficients with a large squareful part. More precisely, for small fixed θ,ε>0, the contribution with squareful part exceeding X^θ is `O_F`,ε(X^(5/6−θ/6+ε)); the range |a|≤(X^(1/6)/t⁴)^(1−ρ), in the quartic torus coordinate t, contributes `O_F`,ε(X^(5/6−ρ/6+ε)) for small fixed ρ>0. Thus neither range is estimated by multiplying an unweighted exceptional density by an unbounded Selmer size.

On the complementary range use finite-level upper approximations to the actual local weights. At p^l their mass error is O(p^(−l/60)); at primes with p²|a the source's depth is increased by 360v_p(a). The modulus bound is consequently X^(361θ) before expressing it in the fixed-A size parameter. Choose θ and ρ sufficiently small in terms of the absolute saving in the [smoothed quaternary count](../ArithmeticStatisticsPartIII/README.md#refinement-smoothed-quaternary-count), then choose ε. Sum its errors over a and integrate the torus variable. The remaining local-volume error from large square divisors is controlled by Σ_(p²|a,p≥L)1/p, whose sum over |a|≤T is O(T/L²).

Evaluate the main term using the same invariant differentials on `PSO_A` and PGL₂. The split adjoint quaternary group `PSO_A` is PGL₂×PGL₂ and has Tamagawa number 4, the product of the two PGL₂ values 2. The quotient (SL₂×SL₂)/diag(μ₂) is `SO_A`, whose remaining center must also be quotiented to obtain `PSO_A`. The local Kummer ratios are 2 at two, 1/2 at infinity, and 1 at odd primes. Their product is 1. Rational Jacobian constants and the fixed integral scaling cancel by the product formula, giving the bound 8 above. Smooth majorants of each sign's height region remove smoothing: let X tend to infinity before the approximation error tends to zero. Finite unions of residue conditions use disjoint curve counts and their actual denominator weights.

*Needs:* [marked quartic Selmer embedding](../ArithmeticStatisticsPartII/README.md#marked-quartic-selmer-embedding), [smoothed orbit unfolding](../ArithmeticStatisticsPartIII/README.md#refinement-smoothed-orbit-unfolding), [smoothed quaternary count](../ArithmeticStatisticsPartIII/README.md#refinement-smoothed-quaternary-count), [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum), [local Selmer mass ratios](#local-selmer-mass-ratios), [count of curves in a large family](#count-of-curves-in-a-large-family), [Tamagawa number of PGL₂ is two](#tamagawa-number-of-pgl2-is-two), AdelicAlgebraicGroups Layers 0–4 (quotient/product measures) and the split adjoint D₂ isomorphism.

([[33]](#ref-33), Lemma 7.3 and Theorem 7.4, pp.41–42; Theorem 7.7 and estimates (62)–(65), pp.43–44; Lemma 7.8, pp.44–45; Proposition 7.10 through Theorem 7.14, pp.45–46; removal of smoothing, p.47. The displayed bound uses limsup; the argument does not require existence of a second-moment limit.)

**Checks.**

- N=1,2,4 gives respectively 0,0,6 marked pairs after excluding the two distinguished second classes. Counting N(N−1) instead would give 0,2,12.
- The first-moment limit 3 gives average (N−1)→2. Restoring the two distinguished classes therefore changes the upper bound 8 to 12 for N(N−1).
- Dividing this latter bound by the marked-cover denominator, asymptotic to 2D_F(X), gives 6, the marked-Jacobian bound. Multiplying two unconditioned Selmer means would instead give 9 and would not prove either statement.
- At a square prime divisor p²|a, rank at most one modulo p alone cannot supply p⁻¹²; retain the higher-depth specialness condition.
- The split SO₄ cover has a residual central μ₂, whereas PSO₄≅PGL₂×PGL₂ has trivial center. Computing its mass as if it were SO₄ gives the wrong group and normalization.

<a id="second-moment-of-the-2-selmer-group"></a>

**Second moment of the 2 selmer group.** When elliptic curves over ℚ, or those of any nonempty subfamily defined by finitely many congruence conditions, are ordered by height, the upper second moment M⁺_2(#`Sel_2(E)`) is at most 15. (15 = (2 + 1)(4 + 1) is the Poonen–Rains prediction for the second moment; equality is not proved.) Bhargava–Shankar–Swaminathan use the model `E_{I,J}` : y² = x³ − (I/3)x − J/27 with height (4/27)max(|I|³, J²/4); its comparison with (`E_{A,B}`, max(4|A|³, 27B²)) is the normalisation comparison owned by [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs) and changes no average. Use the minimal-pair, congruence-family, height and moment conventions above.

Here F is a nonempty family of elliptic curves over ℚ defined by finitely many congruence conditions, and its height counting function tends to infinity; the congruence conditions must admit minimal nonsingular models, so empty congruence families are excluded. The Lean target `secondMoment_twoSelmer_le` uses `shortPairAverage` and `twoSelmerSize` on every `IsFiniteCongruenceFamily`, including either real sign or both. It states that for every ε>0, the average of `twoSelmerSize²` is eventually at most `15+ε`, expressing the upper bound without assuming a second-moment limit.

put N(E)=#Sel₂(E) and use the pointwise identity N²=(N−1)(N−2)+3N−2. The [marked quartic factorial-moment bound](#marked-quartic-factorial-moment-bound) gives upper average at most 8 for the first term, and the first-moment theorem gives average N→3. Thus the upper second moment is at most 8+9−2=15. The marked count excludes two distinguished second classes, not one. Its integral parametrization, uniform leading-coefficient estimates and mass normalization are specified in the linked parametrization and marked-count targets. This argument does not multiply two unconditioned averages or identify the Selmer groups before and after monicization.

*Needs:* [height moments in an arithmetic family](#height-moments-in-an-arithmetic-family), [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three), [marked quartic factorial-moment bound](#marked-quartic-factorial-moment-bound), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs).

([[33]](#ref-33), §1.1, Theorem 1.1, p. 2 (arXiv v1); [[33]](#ref-33), §1.1, p. 2 (arXiv v1).)

**Checks.**

- Consistency: `M_1(#Sel_2)` = 3 and M⁺_2(#`Sel_2`) ≤ 15 give, by Cauchy–Schwarz, no contradiction (9 ≤ 15).

- The Poonen–Rains moment formula at p = 2, m = 2 equals 15 (the finite quadratic-intersection model has second moment (2+1)(4+1)).

- A family containing no minimal nonsingular pair is excluded; otherwise its zero empty-family average would convey no Selmer moment information.

### 4.15 Hyperelliptic degree-one torsors and orbit weights

<a id="refinement-admissibility"></a>

**Admissibility.** For n=2g+2 with g≥1 and a congruence family F of integral binary forms, let `L_p` be its actual p-adic coefficient closure. The added admissibility predicate says that there is P such that, for every prime p>P, `L_p` contains every coefficient tuple a for which z²=`Σ_i` `a_i` x^(n−i)y^i has a `Q_p`-point with (x,y)≠(0,0). Smooth nonzero-discriminant models suffice: for closed `L_p`, point-bearing singular equations lie in their closure by point-preserving smooth perturbation. This predicate supplements the imported congruence-family definition; it does not assert positive density, local Div¹-solubility at small places or admissibility of an arbitrary collection of local sets. Over a number field K use actual closures L_p⊆O_(K_p)^N indexed by nonzero prime ideals, containing all K_p-point-bearing coefficient tuples beyond a fixed norm threshold. Include all archimedean completions in local Div¹-solubility; the coordinate height uses the fixed integral basis in [number-field coefficient count](#number-field-coefficient-count).

Required API:

- `ArithmeticSelmerRefinement.admissible_threshold`: Admissibility is equivalent to a single integer threshold beyond which all local point-bearing tuples are allowed.

- `ArithmeticSelmerRefinement.admissible_mono`: If `L_p`⊆`M_p` for every prime and L is admissible, M is admissible.

- `ArithmeticSelmerRefinement.admissible_finite_change`: If L is admissible and `L_p`=`M_p` beyond a fixed threshold, M is admissible.

- `ArithmeticSelmerRefinement.admissible_of_local_points`: Containing the local point locus at every prime implies admissibility.

Use Layer 0 coefficient models and the actual local closures from Layer 2. At each sufficiently large prime impose inclusion of the point-bearing locus. Closedness permits smooth perturbation; changing finitely many local conditions preserves the predicate.

*Needs:* [acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), `PadicInt` (Mathlib).

([[110]](#ref-110), Definition 43 p.34.)

**Checks.**

- All local coefficient sets equal to the whole space satisfy the predicate.

- Taking the empty set for p≤P and the whole space for p>P passes the local threshold predicate. A family application must separately verify that its local inputs are actual closures; this test only checks finite-place insensitivity.

- Taking every local coefficient set empty is not admissible: a₀=1 and `a_i`=0 for i>0 has the local point (x,y,z)=(1,0,1) at every prime.

<a id="refinement-degree-one-arithmetic-comparison"></a>

**Degree one arithmetic comparison.** For a smooth hyperelliptic C/Q of genus g≥1 with a Q-rational degree-two hyperelliptic divisor class d represented by a divisor, and actual degree-one divisors over every completion, every rational Picard-scheme point descends to an actual line bundle/divisor. Thus J¹(Q)≠∅ iff C has a point over some finite odd-degree extension iff index(C)=1; otherwise index(C)=2. Here index is the positive generator of the degree subgroup of rational divisors, not the minimum degree of a closed point.

Apply the Picard/Brauer obstruction sequence and global-to-local injectivity of Br(Q); local actual Div¹ kills the obstruction. Trace an odd-degree point, then subtract ((k−1)/2)d. Conversely an odd-degree rational divisor must involve an odd-degree closed point. The rational degree-two divisor forces the index to divide two.

*Needs:* SchemeAndStackFoundations §§3.6–3.7 (unpointed degree torsors), SchemeAndStackFoundations §§3.6–3.7 (Picard–Brauer obstruction), TauCetiRoadmap.ClassFieldTheory Layer 10.

([[110]](#ref-110), Introduction pp.1–4, Theorems 1,2,12.)

<a id="refinement-generic-weierstrass-class"></a>

**Generic weierstrass class.** In the coefficient-height genus-g model family, outside a density-zero exceptional set, the finite J[2]-torsor W[2]={P∈J¹:2P=d}, the fibre of the canonical map J¹→J² over the hyperelliptic class d, defines a nonzero class in H¹(Q,J[2]), and J(Q)[2]=0. On the subfamily with everywhere locally soluble actual Div¹, W[2] belongs to Sel₂(J). These conclusions hold relatively in every such sieve-controlled congruence subfamily of positive lower density.

Import HeightsRationalPointsAndObstructions §§1.12–1.13, `W2` and `W2_eq_zero_of_odd_factor`, for the odd-partition comparison, and its Weierstrass description of J[2] for even partitions, including quadratically conjugate factors. Prove the coefficient-family density and the actual-Div¹ local extension here. Hilbert irreducibility gives full symmetric Galois group away from a density-zero set. Restrict using positive-density denominator comparison. Use a local degree-one divisor to identify J¹(`Q_v`) with a J(`Q_v`)-torsor with a point. The class of W[2] is then a local Kummer class. This step is conditional on local Div¹, whereas full `S_n` gives nonvanishing without that condition.

*Needs:* HeightsRationalPointsAndObstructions §§1.12–1.13 (`W2`, `W2_eq_zero_of_odd_factor`), [field pencil stabilizers](../ArithmeticStatisticsPartII/README.md#refinement-field-pencil-stabilizers), [locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), InverseGaloisAndArithmeticFundamentalGroups:IG.2, [density one restricts to subfamilies of positive lower density](../ArithmeticStatisticsPartI/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density).

([[110]](#ref-110), Introduction p.2, Theorem 5 proof pp.3–4, and §8 pp.21–22.)

**Checks.**

- For n=4, S4 has no invariant odd partition and no nontrivial even partition modulo complement; no claim is made about each exceptional polynomial.

- Distinguish a nonzero H¹(Q,J[2]) class in all models from its Selmer membership in the locally actual-Div¹-soluble subfamily.

- An irreducible sextic can have conjugate cubic factors, as x⁶−2 does; use full symmetric Galois group rather than irreducibility alone.

<a id="refinement-pencil-local-global-weight"></a>

**Pencil local global weight.** For G=SL_(2g+2)/μ₂ acting on pairs of symmetric matrices, define w(v) as the reciprocal of the imported finite rational-orbit weight when v is locally soluble and its invariant belongs to F, and zero otherwise. The global weight is the product of its integral-local counterparts, is locally constant off the discriminant locus, and equals one at sufficiently large odd primes with p²∤Disc(f). The group is the central quotient as an algebraic group; rational points cannot be replaced by `SL_n(Q)`/{±1}.

Use the finite transporter/stabilizer formula of [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum). The weight factors locally through the oriented-ideal classification of integral pencils supplied by ArithmeticStatisticsPartII §1.12. HeightsRationalPointsAndObstructions §3.18a (`pencilOrbit_integralRepresentative`) supplies coordinate-chart transport of that dictionary and its integral representatives over ℤ. Good-prime uniqueness comes from the Layer 1 import.

*Needs:* [integral pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-integral-pencil-orbits), [field pencil stabilizers](../ArithmeticStatisticsPartII/README.md#refinement-field-pencil-stabilizers), [rational orbit weight](#rational-orbit-weight), [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum), [good prime integral pencils](../ArithmeticStatisticsPartII/README.md#refinement-good-prime-integral-pencils), HeightsRationalPointsAndObstructions §3.18a.

([[110]](#ref-110), §11 pp.31–32, (19) and cited weight factorisation.)

**Checks.**

- Take the regular integral pencil A=I₄, B=diag(0,1,2,3), with invariant det(xA−yB)=x(x−y)(x−2y)(x−3y). A coefficient-family condition excluding this invariant gives weight zero, regardless of its transporter count.
- Allow that invariant instead. The intersection q_A=q_B=0 has no real projective point because q_A is positive definite; this pencil orbit is insoluble over R and still has weight zero, although its invariant hyperelliptic curve has real points.
- For the allowed invariant f=x⁴−xy³−y⁴, use A=((0,0,0,1),(0,0,1,0),(0,1,0,0),(1,0,0,1)) and B=((0,0,1,0),(0,1,0,0),(1,0,0,1),(0,0,1,1)). Their determinant pencil is f, with Disc(f)=−283, and (1,0,0,0) is a common isotropic vector, so this genus-one pencil is soluble over Q. Its rational G-orbit contains exactly one integral G(Z)-orbit, and both stabilizers are trivial; hence its reciprocal weight and total weight are one. For the complete classification, put R=Z[θ], θ⁴−θ−1=0. The matrices are the coefficient-of-θ³ pairings uv and θuv on the power basis. The squarefree discriminant makes R maximal. In the rational orbit of (R,1,1), the oriented-ideal classification reduces an integral representative, after rescaling by an element of Q(θ)×, to (I,t,t²) with t∈Q×. Unimodularity forces I²=tR. Every rational prime has an odd ramification index above it: all indices are one away from 283, and at 283 the pattern is (2,1,1). Thus every valuation of t is even, t=±a², and I=aR; rescaling and the integral central-quotient action of −1 give the displayed single orbit. Irreducibility modulo two and the irreducible cubic resolvent u³+4u−1, together with the nonsquare discriminant, give Galois group S₄. There is no invariant nontrivial even partition modulo complement, so the rational stabilizer J[2](Q) is trivial, as is its integral subgroup. Use the group-scheme G(Z), including its −1 Kummer class. The orbit classification uses [[110]](#ref-110), Theorems 16–17, §2, pp.7–8.

<a id="refinement-pencil-selmer-weighted-count"></a>

**Pencil selmer weighted count.** For F with locally soluble actual Div¹ and coefficients in 16Z, the sum of #Sel₂(J¹_f) over H(f)<X is at most the sum of the weighted integral-orbit counts `N_w` over the real soluble components, plus o(X^(n+1)), after generic rational stabilizers are separated. The left side itself equals the unweighted rational locally soluble orbit count represented integrally. An individual rational class with integral representatives `v_i` satisfies `Σ_i` w(`v_i`)/#`Stab_Z(v_i)`=1/#`Stab_Q(v)`. One may use `Σ_i` w(`v_i`)=1 only when the rational stabilizer is trivial.

Scale the invariant by 16, using κ=4 and z↦4z; transport the Selmer set through the curve isomorphism. Apply the orbit bijection and the existing stabilizer sum. Bound stabilizers by 2^(2g). Control the exceptional rational stabilizers by the weighted estimate in the unbounded fundamental domain (HeightsRationalPointsAndObstructions §3.18b, `pencilOrbit_cuspBound` and its generic-stabilizer sieve), not by coefficient density zero alone.

*Needs:* [integral soluble pencils](../ArithmeticStatisticsPartII/README.md#refinement-integral-soluble-pencils), [locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), [pencil local global weight](#refinement-pencil-local-global-weight), [orbit weight as a stabilizer sum](#orbit-weight-as-a-stabilizer-sum), [pencil finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-finite-congruence-count), HeightsRationalPointsAndObstructions §3.18b.

([[110]](#ref-110), Theorem 40 pp.31–32, (18)–(20).)

### 4.16 Hyperelliptic local masses and the upper average

<a id="refinement-hyperelliptic-local-mass-ratio"></a>

**Hyperelliptic local mass ratio.** For an abelian variety J/`Q_v` of dimension g and a nonempty J-torsor T(`Q_v`), the finite torsor quotient T(`Q_v`)/2J(`Q_v`) has the same cardinality as J(`Q_v`)/2J(`Q_v`). For the hyperelliptic Jacobian this gives `ρ_v`=#(J¹(`Q_v`)/2J(`Q_v`))/#J(`Q_v`)[2]: `ρ_∞`=2^(−g), `ρ_2`=2^g and `ρ_p`=1 for odd p. Thus Π_vρ_v=1. The quotient numerator is not the number of rational points, and an empty local torsor is excluded.

The three values are the local masses `a_v` of HeightsRationalPointsAndObstructions §3.18b; import them. Choose a torsor point only to identify the two finite quotients; show cardinal independence of that choice. Use the p-adic finite-index `Z_p^g` subgroup calculation and compact real Lie-group multiplication-by-two index. Their exceptional factors cancel.

*Needs:* SchemeAndStackFoundations §§3.6–3.7 (unpointed degree torsors), [two division quotient of a group with a finite index zp subgroup](#two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup), AdelicAlgebraicGroups §2.4, HeightsRationalPointsAndObstructions §3.18, HeightsRationalPointsAndObstructions §3.18b (local masses `a_v`).

([[110]](#ref-110), §11 p.32, local factors following (20).)

**Checks.**

- At g=1 the real and 2-adic factors are 1/2 and 2; at g=2 they are 1/4 and 4. Do not reuse the elliptic formula with g fixed to one.

<a id="refinement-pencil-measure-comparison"></a>

**Pencil measure comparison.** Fix integral invariant top forms dτ on G and dμ on coefficient A^(n+1), with `μ_∞` Euclidean and `μ_p`(`Z_p`^(n+1))=1. A single nonzero rational orbit-Jacobian constant 𝒥 satisfies c_(m,r)X^(n+1)=|𝒥|_∞`τ_∞`(G(Z)\G(R)) `μ_∞`({f∈I(m):H(f)<X})/#J(R)[2], and ∫`w_p`(v)dv=|𝒥|_pτ_p(G(`Z_p`))`μ_p`(`F_p`)`ρ_p`. Sum over the soluble real orbit components r, whose count is #(J¹(R)/2J(R)). All factors use the same algebraic-group differential; independently normalized Haar volumes cannot be substituted.

Use the invariant-map Jacobian formula on the regular orbit locus and disintegrate the measure with stabilizers; 𝒥 is the rational constant J₀ computed on a diagonal pencil in HeightsRationalPointsAndObstructions §3.18b. Integrate the reciprocal orbit weights so one rational local class has mass 1/#Stab. Sum real soluble components before applying the product formula.

*Needs:* [hyperelliptic local mass ratio](#refinement-hyperelliptic-local-mass-ratio), [pencil local global weight](#refinement-pencil-local-global-weight), [pencil finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-finite-congruence-count), AdelicAlgebraicGroups §2.4.

([[110]](#ref-110), §11 p.32, two displayed mass identities.)

<a id="refinement-tamagawa-central-quotient"></a>

**Tamagawa central quotient.** For every even n≥4, the split Q-group G=`SL_n`/μ₂ has Tamagawa number two, for the adelic measure attached to an integral invariant top differential and the matching convergence convention. G(Q) is the group-scheme quotient’s rational points, not the naive quotient of `SL_n(Q)` by its rational centre. The rational Jacobian constant in the orbit integral changes no Tamagawa value.

Import `tamagawa_SLquotient_two` from HeightsRationalPointsAndObstructions §3.18b. There τ(`SL_n`)=1 is proved by unfolding the action on nonzero vectors, and the vertical character index of (`SL_n`×`G_m`)/μ₂ gives τ(`SL_n`/μ₂)=2, following Igusa and Ono as cited in that section. Check that the invariant differential and the convergence convention there are the ones used in [pencil measure comparison](#refinement-pencil-measure-comparison).

*Needs:* HeightsRationalPointsAndObstructions §3.18b (`tamagawa_SLquotient_two`), AdelicAlgebraicGroups §2.4.

([[110]](#ref-110), Theorem 41 p.33, τ(G)=2 in (21).)

**Checks.**

- Do not replace this value by τ(`SL_n`)=1, or by τ(PGL₂)=2 of [Tamagawa number of PGL₂ is two](#tamagawa-number-of-pgl2-is-two), which concerns another group and differential.

<a id="refinement-hyperelliptic-weighted-upper-bound"></a>

**Hyperelliptic weighted upper bound.** Let n=2g+2, g≥1, and F be a positive-mass sieve-controlled congruence family contained in the everywhere actual-Div¹-soluble locus, with all coefficients in 16Z. For each non-negative-definite real root stratum I(m), let its allowed part be `F_∞`∩I(m); use the full strata when no extra real restriction is imposed. Assuming the corresponding real-region count, the Selmer numerator is at most 2 `Σ_m` `μ_∞`({f∈`F_∞`∩I(m):H(f)<X}) `Π_p` `μ_p(F_p)`+`o_F`(X^(n+1)). Here `F_∞` is a union of these strata; more general real restrictions require the matching counting extension. The same allowed real mass occurs in the coefficient denominator. The value τ(`SL_n`/μ₂)=2 is `tamagawa_SLquotient_two` of HeightsRationalPointsAndObstructions §3.18b. The infinite-weight count gives an upper bound without a matching lower bound.

Apply Layer 2’s one-sided infinite-weight bound. Multiply the compatible local integrals and real components. Sum the non-negative-definite invariant strata with the same real-family indicator used in the denominator; negative-definite forms have no actual real degree-one divisor. Cancel `Π_v`|𝒥|_v and Π_vρ_v using the product formula. Use the exact Tamagawa number of the central quotient, not that of simply connected `SL_n`.

*Needs:* [pencil selmer weighted count](#refinement-pencil-selmer-weighted-count), [pencil measure comparison](#refinement-pencil-measure-comparison), [pencil infinite weight upper bound](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-infinite-weight-upper-bound), [tamagawa central quotient](#refinement-tamagawa-central-quotient).

([[110]](#ref-110), Theorem 41 p.33, (21).)

**Checks.**

- The numerator constant is two, with no extra identity class; the source’s 16^n divisibility is replaced by the sufficient 16Z condition.

- Use the identical allowed real mass in numerator and denominator; do not replace it by the volume of the whole coefficient cube.

### 4.17 Restricted Selmer sets and small odd-degree points

<a id="refinement-restricted-selmer-set"></a>

**Restricted selmer set.** Given a finite set S, places V, actual local targets `Q_v`, localisation maps `loc_v`:S→`Q_v` (or maps from a containing carrier), and local images `I_v`⊆`Q_v`, define the restriction `S^res`={s∈S:∀v,`loc_v(s)`∈`I_v`}. For the order-k application S=Sel₂(J¹), k>0 odd, `Q_v`=J¹(`Q_v`)/2J(`Q_v`), and `I_v` is the image of effective degree-k divisors e under e−((k−1)/2)d. Use effective divisors over `Q_v`, including conjugate pairs, rather than only k-tuples of `Q_v`-points. The torsor-cover/local-orbit dictionary giving `loc_v` is imported from Layer 1 and must be natural under local choices.

Required API:

- `ArithmeticSelmerRefinement.restricted_mem`: Membership requires membership in S and every local condition.

- `ArithmeticSelmerRefinement.restricted_subset`: The restricted set is contained in S.

- `ArithmeticSelmerRefinement.restricted_finite`: If S is finite, its restricted set is finite.

- `ArithmeticSelmerRefinement.restricted_mono`: Enlarging every `I_v` enlarges the restricted set. Applying this to `I_k`⊆I_(k+2) gives the order inclusion.

- `ArithmeticSelmerRefinement.restricted_card_le`: For finite S, the natural cardinal of its restriction is at most S.ncard.

- `ArithmeticSelmerRefinement.restricted_transport`: For an equivalence e:A≃B, transporting S and precomposing loc with e⁻¹ transports the restricted set by e.

Intersect the pullbacks of the effective-divisor images with the finite Selmer set. The construction is independent of the presentation of candidates. Translate torsor identifications and divisor images together; adding d proves the geometric order-k to order-(k+2) inclusion. Import Sym^k C→Pic^k, D↦O(D), from TauCetiRoadmap.JacobianChallenge Layer D and the section-free Pic¹ convention from SchemeAndStackFoundations §§3.6–3.7. Translate by the actual degree-two hyperelliptic divisor. What remains to prove is compatibility with the covering localisation of Layer 1, not a second construction of the Abel map.

*Needs:* [locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), TauCetiRoadmap.JacobianChallenge Layer D, `Set.ncard` (Mathlib), SchemeAndStackFoundations §§3.6–3.7 (section-free Abel maps), SchemeAndStackFoundations §§3.6–3.7 (unpointed degree torsors).

([[110]](#ref-110), Order-k definition p.3 and Theorem 7 proof pp.33–34.)

**Checks.**

- For S=Fin 3, identity localisation at one place and image {0,2}, the restriction is {0,2}.

- For two identity localisations with images {0,1} and {1,2}, the answer is {1}, not their union.

- With no places the restriction is S.

- An empty image at one place makes the restriction empty.

<a id="refinement-odd-component-bound"></a>

**Odd component bound.** Define `S_m(k)`=Σ_(0≤j≤k,j odd) binomial(m,j), with binomial(m,j)=0 for j>m; the empty sum is zero. For m≥1 the normalized component bound is `S_m(k)`/2^(m−1). This numerical construction records the image bound from degree-k real divisors; it is not asserted to equal the geometric image cardinal in every real model.

Required API:

- `ArithmeticSelmerRefinement.component_bound_mono`: `S_m(k)`≤`S_m(l)` for k≤l.

- Full-quotient bound: For m>0, `S_m(k)`≤2^(m−1).

- Saturation: For m>0 and k≥m, `S_m(k)`=2^(m−1).

- Strictness: For m>0, k odd and k<m−1, `S_m(k)`<2^(m−1).

- Fixed-cutoff decay: For each fixed k, `S_m(k)`/2^(m−1) tends to zero as m→∞.

- Single component: For k>0, `S_1(k)`=1, the saturated single-component boundary case.

Count odd subsets of connected components. Each real point contributes its component mod two; a conjugate pair contributes zero. Use finite binomial sums and the exponential denominator to obtain the stated API.

*Needs:* `Nat.choose` (Mathlib).

([[110]](#ref-110), Theorem 7 proof p.34, `S_m(k)` and (23).)

**Checks.**

- `S_3(1)`=3, distinguishing the missing third-degree contribution.

- `S_5(3)`=15, strictly smaller than 16.

- `S_m(0)`=0 for every m.

- `S_3(9)`=4: terms above m vanish and even terms stay excluded.

- `S_1(k)`=1 for k>0.

- At m=0,k=0 the bound is zero, whereas natural subtraction gives `2^(0−1)=1`; saturation requires m>0.

<a id="refinement-real-effective-divisor-image"></a>

**Real effective divisor image.** Let C/R be a smooth genus-g hyperelliptic curve with 2m real branch points and m>0. Its m real components give #J(R)/2J(R)=2^(m−1). For k>0 odd, the image of actual effective degree-k R-divisors in J¹(R)/2J(R), after translation by ((k−1)/2)d, has cardinal at most `S_m(k)`. Conjugate nonreal pairs have trivial class modulo 2J(R), and 2P−d∈2J(R) for real P. The m=0 cases require their own soluble real components and are only bounded by the full local quotient.

Import HeightsRationalPointsAndObstructions §3.18c, `realEffectiveFraction` and its effective-divisor image bound, including conjugate-pair cancellation. This part adds compatibility with restricted-Selmer localization and the actual-Div¹ family convention. Use the section-free Abel map from TauCetiRoadmap.JacobianChallenge Layer D and SchemeAndStackFoundations §§3.6–3.7, translated by the actual hyperelliptic divisor.

*Needs:* HeightsRationalPointsAndObstructions §3.18c (`realEffectiveFraction` and effective-divisor image bound), [restricted selmer set](#refinement-restricted-selmer-set), [odd component bound](#refinement-odd-component-bound), TauCetiRoadmap.JacobianChallenge Layer D, [field pencil stabilizers](../ArithmeticStatisticsPartII/README.md#refinement-field-pencil-stabilizers), SchemeAndStackFoundations §§3.6–3.7 (section-free Abel maps), SchemeAndStackFoundations §§3.6–3.7 (unpointed degree torsors).

([[110]](#ref-110), Theorem 7 proof pp.33–34.)

**Checks.**

- At m=1 and every positive odd k the component fraction is one.
- At m=4,k=1 the fraction is 4/8=1/2; at k=3 it is one.
- A conjugate pair contributes zero to the component parity and cannot be counted as two independently chosen real components.

### Supporting number-field coefficient families

<a id="number-field-coefficient-count"></a>

**Number-field coefficient count.** For a fixed number field K of degree r, an integral basis of O_K and N=n+1 coefficient slots, let H be the maximum absolute value of the rN integer coordinates. For a nonzero integral ideal m and a subset R⊆(O_K/m)^N of cardinal k,
`numberFieldCoefficientCount` gives
`#{a:H(a)≤T, a mod m∈R} = (k/Norm(m)^N)(2T+1)^(rN)+O_(K,basis,N,m)(T^(rN−1))`
for integral T→∞. Removing the zero-leading-coefficient and discriminant-zero loci changes only the error. Require fixed n≥3 for the smooth hyperelliptic application.

Identify m^N with a full sublattice of the coefficient lattice of index Norm(m)^N. Count each translated lattice in the coordinate cube by a fixed fundamental parallelepiped; only boundary cubes contribute error. CRT supplies the proportions for conditions at pairwise coprime prime-power ideals.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.1 (lattice estimates), Mathlib ideal norm, integral bases and CRT; [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box) for the integer-coordinate box convention.

(Source: BGW Appendix A, Theorem A.2 and proof, pp.35–37; lattice counting specializes Davenport’s estimate in the cited supplier.)

**Checks.**

- K=Q and m=(q) gives density k/q^N and exponent N.
- For one allowed residue modulo a prime ideal of residue degree f, the density is p^(−fN), not p^(−rN).
- The unit ideal with its unique residue class gives the full cube `(2T+1)^(rN)`; an empty R gives zero.

<a id="number-field-coefficient-tail"></a>

**Number-field coefficient tail.** With the same fixed K, basis and N, let Z be a fixed closed subscheme of affine N-space over O_K whose generic fibre has codimension at least two. Discard a fixed finite set of prime ideals so that its remaining fibres have codimension at least two. The target `numberFieldCoefficientTail` is
`lim_(M→∞) limsup_(T→∞) #{a:H(a)≤T, ∃ prime ideal p, Norm(p)>M, a mod p∈Z(O_K/p)}/(2T+1)^(rN) = 0`.
The envelope Z is fixed independently of p,T and M. Consequently an admissible family with actual local closures, null local boundaries, positive finite-place masses and positive real mass has the Euler-product denominator whenever every sufficiently large excluded reduction lies in Z.

Prove the number-field geometric sieve on this coefficient lattice. On affine elimination charts use two relatively prime equations cutting out Z, split by prime-ideal norm relative to T, and sum their residue bounds and resultant divisibility estimates; include prime ideals of higher residue degree. The fixed exceptional primes enter the finite CRT modulus. Apply this estimate to the scalar-square locus, which has codimension at least two for n≥3. Finite-prime counts then converge to the same positive Euler product in numerator and denominator.

*Needs:* [number-field coefficient count](#number-field-coefficient-count), GeometryOfNumbersAndQuadraticArithmetic §4.1, Mathlib ideals, norms, resultants and CRT. The coefficient-lattice sieve over O_K is a target here, rather than an assertion that the Z-coefficient tail already covers it.

(Source: BGW Appendix A, proof of Theorem A.2, p.37, and its density input [27], Poonen–Stoll, “A local-global principle for densities”, pp.241–244; the codimension-two argument is Poonen–Stoll, “The Cassels–Tate pairing on polarized abelian varieties”, Lemmas 20–22, pp.21–22 of the author text; the fixed-envelope geometric sieve is the number-field form of the argument used in HeightsRationalPointsAndObstructions §3.18b.)

**Checks.**

- Z empty gives zero at every cutoff.
- For K=Q and Z given by the first two coefficients zero, the large-prime residue bound is summable in p⁻².
- A divisor such as the first coefficient zero violates codimension two; the theorem gives no tail bound for it. A vertical exceptional fibre is removed only in the fixed finite set.

<a id="number-field-twist-height"></a>

**Number-field twist height.** For fixed α∈K× choose a nonzero integer t with β=t²α∈O_K. The target `numberFieldTwistHeight` gives constants 0<c≤C, depending only on α,t and the basis, such that `c H(f)≤H(βf)≤C H(f)` for every integral coefficient vector f. This model is K-isomorphic to the α-twist via the fixed square scaling. Multiplication by β is injective, and the finite collection of twists 1,α,β′,αβ′ has uniformly bounded fibres in the model-counting argument.

The integral matrix of multiplication by β is invertible over Q; its operator norm and that of its inverse for the coordinate maximum norm give the two constants. Use the same denominator-clearing square for every vector, and retain actual local closures when transporting congruences.

*Needs:* [number-field coefficient count](#number-field-coefficient-count), Mathlib finite-dimensional linear algebra and integral bases.

(Source: BGW Appendix A, proof of Theorem A.2, p.37, twist-height comparison; this coordinate-height formulation uses the full multiplication matrix rather than a field norm alone.)

**Checks.**

- K=Q and integral α gives H(αf)=|α|H(f).
- α=1/2 admits t=2, β=2, so H(βf)=2H(f); multiplying by α directly need not preserve integral models.
- For an irrational unit the multiplication matrix can mix basis coordinates; nonzero determinant supplies both bounds even though its field norm is ±1.

### Supporting Selmer duality and isogeny quotients

<a id="selmer-isogeny-quotient"></a>

**Selmer isogeny quotient.** For a number field K and an isogeny φ:A→B of abelian varieties with fixed nonzero invariant top differentials, import the invariant Q, its finiteness, composition and direct-sum multiplicativity, and `Q([p])=p^(corank Sel_(p∞)(A/K))` from HeightsRationalPointsAndObstructions §3.18c. Import its foundational Euler formula `Selmer_isogenyEulerCharacteristic`, retaining all places and the finite reduced primary Sha terms.
The comparison target `selmer_isogenyQuotient` identifies its local factors with the periods and differential factors in
`(#B(K)_tors/#A(K)_tors)(#B∨(K)_tors/#A∨(K)_tors)(c̃_A/c̃_B)(Ω_A/Ω_B)·Π_(p|deg φ)(#Sha_A^[p]/#Sha_B^[p]) = Q(φ∨)/Q(φ)`.
Here Ω is the product of real and complex period integrals, c̃ includes finite-place differential factors and Sha^[p] is the finite reduced p-primary quotient. The formula does not assume finite full Sha.

Use the imported Euler formula and its separation of the free Mordell–Weil cokernel, divisible-Sha kernel and reduced-primary terms. Match its real/complex local factors with period integrals and its finite local factors with c̃, and prove independence of the chosen differentials by the product formula. For the Brauer-relation application apply this comparison to the Weil-restriction isogeny associated to the permutation lattices; its torsion and period factors cancel before taking valuations modulo two.

*Needs:* HeightsRationalPointsAndObstructions §3.18c (Q and `Selmer_isogenyEulerCharacteristic`), SelmerIwasawaCohomology §§2.10–2.12a and §4.29, ArithmeticGaloisDuality D7.6–D7.7 (Poitou–Tate and local duality), AbelianSchemesAndArithmeticModuli §§A3.1–A3.7 and A6.30–A6.33, NeronModelsAndSemistableAbelianVarieties Layer 3, HeightsRationalPointsAndObstructions §§1.7–1.8 (Mordell–Weil and regulators).

(Source: Dokchitser–Dokchitser, [On the Birch–Swinnerton-Dyer quotients modulo squares](https://arxiv.org/abs/math/0610290v3), Definition 4.1, Lemma 4.2 and Theorem 4.3, pp.17–18.)

**Checks.**

- An isomorphism has Q=1 and gives equality of all the matched quotient factors.
- For [p] on a rank-r variety with d divisible p-primary Sha summands, Q=p^(r+d); omitting the divisible kernel loses p^d.
- At p=2 a principal polarization alone does not force the reduced Sha factor to be square; retain it. Changing a global differential cancels by the product formula.

<a id="selmer-dual-self-dual"></a>

**Selmer dual self-duality.** For a number field K, an abelian variety A/K, a finite Galois extension F/K with group G and a prime p, `selmerDual_selfDual` identifies the finite-dimensional rational Pontryagin dual `X_p(A/F)` with its contragredient as a Q_p[G]-representation. Equivalently it admits a nondegenerate G-invariant bilinear pairing. No finiteness of Sha or principal polarization is required.

Use the Kummer and divisible-Sha exact sequences, dual isogenies and the isogeny quotient below. Apply them to the permutation-lattice isogenies of Weil restrictions to compare character multiplicities with their duals, as in Dokchitser–Dokchitser’s proof. The pairing is a representation-theoretic pairing, not a claim that the Cassels–Tate form is nondegenerate on unreduced Sha.

*Needs:* SelmerIwasawaCohomology §§2.10–2.12a and §4.29, AbelianSchemesAndArithmeticModuli §§A3.1–A3.7 and A6.30–A6.33 (dual isogenies and Weil restriction), [Selmer isogeny quotient](#selmer-isogeny-quotient), ArithmeticGaloisDuality D7.6–D7.7.

(Source: Dokchitser–Dokchitser, [Self-duality of Selmer groups](https://arxiv.org/abs/0705.1899v2), Theorem 1.1, p.2, proof §2.)

**Checks.**

- F=K gives a finite-dimensional vector space with trivial action, hence its ordinary dual.
- If the p-primary Sha is finite, X_p is the dual Mordell–Weil representation, whose height pairing supplies the same self-duality.
- A divisible Sha summand remains in X_p; discarding it or applying the reduced Cassels–Tate pairing directly would not prove this theorem.

### 4.18 Parity in four-twist families

Throughout this section K is a number field and all extensions F/K are finite extensions of number fields.

<a id="refinement-selmer-regulator-parity"></a>

**Selmer regulator parity.** Let K be a number field, A/K principally polarized, F/K finite Galois with group G, p prime, and Θ=`Σ_i` `n_i` `H_i` a Brauer relation (`Σ_i` `n_i` Ind_(`H_i`)^G 1=0). For each self-dual irreducible `Q_p`-representation ρ let `m_ρ` be its multiplicity in the rational Pontryagin dual `X_p(A/F)` of Sel_(p∞). Put `S_Θ`={ρ:`ord_p` C(Θ,ρ) odd}. Then Σ_(ρ∈`S_Θ`)`m_ρ`≡`ord_p` `Π_i`( c̃_(A/F^Hi)·#Sha_(A/F^Hi)^[p])^(`n_i`) mod 2. Here c̃=Π_(finite v)`c_v`|ω/`ω_v`^Néron|_v for a fixed global invariant top differential; Sha^[p] is the finite p-primary part of Sha modulo its maximal divisible subgroup. No finiteness of all Sha is assumed and the p=2 factor may not be dropped.

Apply `selmerDual_selfDual` and `selmer_isogenyQuotient` over the number fields just specified; retain the finite Sha quotient from that formula. Use regulator-constant multiplicativity on the self-dual decomposition. Non-self-dual dual pairs have square regulator constant. At odd p the finite Sha contribution is a square; at p=2 use the formula before removing the polarization obstruction.

*Needs:* [Selmer dual self-duality](#selmer-dual-self-dual), [Selmer isogeny quotient](#selmer-isogeny-quotient), SelmerIwasawaCohomology §§2.10–2.12a and §4.29, TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0 and [Brauer relations and regulator constants](#support-regulator-constants), NeronModelsAndSemistableAbelianVarieties Layer 3.

([[110]](#ref-110), Theorem A.7 pp.37–38.)

**Checks.**

- Sha^[p] means the finite p-primary quotient modulo divisibles, rather than Sha[p]; any parity comparison between their orders must use the Poonen–Stoll pairing theorem.

- The exponent `n_i` belongs on each factor in the Brauer product. The p=2 formula retains Sha when the polarization is not known to come from a rational divisor.

- Over K=C there is no number-field finite-place product of this type; K is restricted to a number field.

<a id="refinement-biquadratic-parity-formula"></a>

**Biquadratic parity formula.** For every number field K, principally polarized A/K and biquadratic F=K(√α,√β), the sum of the four 2∞-Selmer coranks of A,A^α,A^β,A^(αβ) over K is congruent modulo two to ord₂[c̃_(K√α)c̃_(K√β)c̃_(K√αβ)/(c̃_F c̃_K²)] plus ord₂[#Sha^[2]_(K√α)#Sha^[2]_(K√β)#Sha^[2]_(K√αβ)/(#Sha^[2]_F (#Sha^[2]_K)²)]. All A subscripts in the local products refer to the same base-changed A. The coranks of twists come from the four character multiplicities, not from a presumed equality with Mordell–Weil ranks.

Use Θ={1}−`H_α`−`H_β`−H_(αβ)+2G. Each of the four one-dimensional characters has regulator constant square class two. Identify each character multiplicity by quadratic descent. Reversing the quotient in the integer valuation leaves its parity unchanged.

*Needs:* [selmer regulator parity](#refinement-selmer-regulator-parity), SelmerIwasawaCohomology §§2.10–2.12a.

([[110]](#ref-110), Corollary A.8 pp.38–39.)

**Checks.**

- The four characters each have regulator constant square class two for this Brauer relation.
- Reversing the displayed quotient changes the valuation sign and leaves parity unchanged.
- A quadratic extension in place of a biquadratic one has only two characters and does not satisfy this four-twist formula.

<a id="refinement-four-twist-local-parity"></a>

**Four twist local parity.** Let K be a number field and F=K(√α,√β) be biquadratic and let p₀ have a unique prime above it. Let C/K be a smooth curve with Jacobian J. Require C(K_p₀)≠∅ and split semistable reduction of J of toric rank one at p₀. At every other finite prime with a unique prime above it, require C(`K_p`)≠∅ and good reduction of J. The sum of the four 2∞-Selmer coranks is odd. If all four twists of C also have local points at every prime with a unique prime above it, the sum of the four finite 2-Selmer dimensions is odd. At other places decomposition groups are cyclic and their Brauer local products cancel. The finite two-Selmer conclusion is `biquadratic_SelmerParity` of HeightsRationalPointsAndObstructions §3.18c, under the same local hypotheses; the corank conclusion is the addition here.

Group modified Tamagawa and deficiency contributions by places of K. Use cyclic decomposition cancellation at places with more than one prime above them. Actual local points kill deficiency; good reduction kills all remaining terms except p₀. The split toric-rank-one monodromy factor gives square class two there. Compare finite Selmer dimension with 2∞ corank, rational two-torsion and the finite Sha quotient. The four twists have the same two-torsion and their deficiency contributions cancel under the additional point hypothesis.

*Needs:* SelmerIwasawaCohomology §4.29 (Cassels–Tate and reduced-primary pairings), [biquadratic parity formula](#refinement-biquadratic-parity-formula), HeightsRationalPointsAndObstructions §3.18c (`biquadratic_SelmerParity`), SelmerIwasawaCohomology §2.12a, NeronModelsAndSemistableAbelianVarieties §§4.2–4.5, NeronModelsAndSemistableAbelianVarieties Layer 3, TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0 and [Brauer relations and regulator constants](#support-regulator-constants).

([[110]](#ref-110), Theorem A.3 p.36 and proof p.39.)

**Checks.**

- The extra four-twist local-point hypothesis is required for finite Selmer dimensions. Never say every odd prime splits completely in Q(i,√2).

- A nonsplit node does not supply the stated split monodromy factor.
- A good-reduction full-decomposition place contributes a square; the distinguished toric-rank-one place is the only odd contribution.

<a id="refinement-mod-eight-parity-family"></a>

**Mod eight parity family.** For squarefree f(x)=Σ_(i=0)^n `a_ix^i` over Q, n≥3 and n∈{2g+1,2g+2}, suppose a₂≡1 mod 8, a_(2g+1)≡4 mod 8 and all other `a_i`≡0 mod 8. Among the four curves y²=f,−f,2f,−2f, at least one Jacobian has even and at least one has odd 2∞-Selmer corank. This proposition alone is not a finite-2-Selmer parity assertion.

Substitute y=2Y+x and divide by four. The reduced equation Y²+xY=x^(2g+1) has one split node and a smooth point at infinity. Use F=Q(i,√2). Its only finite prime with a unique prime above it is two; odd primes have cyclic decomposition groups. Apply the corank part of A.3.

*Needs:* [four twist local parity](#refinement-four-twist-local-parity), NeronModelsAndSemistableAbelianVarieties §§3.8–3.9.

([[110]](#ref-110), Proposition A.4 p.36.)

<a id="refinement-odd-residue-field-models"></a>

**Odd residue field models.** Let K/`Q_p` be finite with p odd, residue field `F_q`, and let C:y²=f(x) be a smooth hyperelliptic curve with integral coefficients and degree n≥3, hence genus ⌊(n−1)/2⌋. Reduction may drop degree in (iii), but (i) and (ii) retain degree n. (i) If f̄ is squarefree of degree n and has an `F_q`-root, J has good reduction and every quadratic twist of C has a K-point. (ii) If f̄=(x−a)²h, h squarefree of degree n−2, h(a) a nonzero square, and h has an `F_q`-root, J is split semistable of toric rank one and every quadratic twist has a K-point. (iii) If f̄ is not a scalar multiple of a square and q>4n², then C(K)≠∅. In (ii) the root of h is automatically different from a and simple. In (iii) the factorisation f̄=l h² does not require l,h coprime.

For (i),(ii), lift the simple residue root of f by Hensel; the point (b,0) survives all twists. Compute the split-node graph and Néron identity component. For (iii), factor the odd-multiplicity squarefree part and use the finite-field curve point bound, excluding the finitely many roots and points at infinity, to get a smooth affine point. Hensel lifts it.

*Needs:* NeronModelsAndSemistableAbelianVarieties §4.1, NeronModelsAndSemistableAbelianVarieties §§3.8–3.9, NeronModelsAndSemistableAbelianVarieties §§4.2–4.5, [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), DeligneWeightsAndPurity §1.6 (curve point bounds).

([[110]](#ref-110), Lemma A.5 p.37.)

**Checks.**

- A node with h(a) nonsquare is not split; a repeated root does not replace the simple root used for twist points.

<a id="refinement-full-family-corank-parities"></a>

**Full family corank parities.** For every degree n≥3, in the full coefficient-height family of smooth hyperelliptic equations y²=f(x) of degree n over Q, both even and odd 2∞-Selmer corank occur with lower density at least 2^(−4n−4). Assuming finiteness of the Jacobians’ 2-primary Sha groups, the same bound holds for Mordell–Weil rank parity. Without that assumption this remains a Selmer-corank statement.

The prescribed coefficient residue class modulo eight, inside H<X/2, has density 8^(−n−1)2^(−n−1)=2^(−4n−4) relative to H<X. Its four twists stay in H<X. The blocks are disjoint: their x² coefficients have residues 1,7,2,6 modulo eight, so each block determines its original member. Select one member of each parity. Singular equations have density zero. Sha finiteness identifies corank with Mordell–Weil rank only in the conditional clause.

*Needs:* [mod eight parity family](#refinement-mod-eight-parity-family), [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family).

([[110]](#ref-110), Theorem A.1 p.35 and Proposition A.4 p.36.)

<a id="refinement-admissible-family-selmer-parities"></a>

**Admissible family selmer parities.** For each fixed genus and each positive-density admissible congruence family over Q with the coefficient-height convention, both even and odd finite 2-Selmer dimension, and both even and odd 2∞-Selmer corank, occur with positive lower density. The number-field form uses integral coefficient models over `O_K`, a fixed integral basis and coefficient-coordinate maximum height; assume actual local closures with null boundaries, positive local and archimedean masses, and a fixed codimension-two envelope for the sufficiently large excluded reductions. Its denominator, CRT proportions and fixed-twist transport are [number-field coefficient count](#number-field-coefficient-count), [number-field coefficient tail](#number-field-coefficient-tail) and [number-field twist height](#number-field-twist-height). Admissibility is indexed by prime ideals and K_p as specified above. This is not claimed for every printed large family.

Put small residue fields and primes above two into a finite set Σ. Choose α,β square-close to one there, and prescribe a unique-prime split-node condition at p₀ outside Σ. At the finitely many other unique-prime places impose good reduction with a simple root; outside these places avoid the scalar-square reduction locus of codimension≥2. CRT and the coefficient sieve give positive density. All four twists remain in the family by admissibility. Apply both parts of A.3; fixed twist-height factors and finite multiplicity transfer positive density.

*Needs:* [number-field coefficient count](#number-field-coefficient-count), [number-field coefficient tail](#number-field-coefficient-tail), [number-field twist height](#number-field-twist-height), [admissibility](#refinement-admissibility), [four twist local parity](#refinement-four-twist-local-parity), [odd residue field models](#refinement-odd-residue-field-models), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box), [large coefficient family tail](../ArithmeticStatisticsPartIII/README.md#refinement-large-coefficient-family-tail).

([[110]](#ref-110), Theorem A.2 p.35 and proof p.37.)

**Checks.**

- For K=Q the coefficient exponent is n+1; for a quadratic K it is 2(n+1).
- The auxiliary twists are fixed before the height limit, so their comparison constants do not vary with the coefficients.
- Without a fixed codimension-two envelope the number-field Euler-product denominator is not a consequence of admissibility alone.

### 4.19 Hyperelliptic local masses and the upper average

<a id="refinement-hyperelliptic-average-two"></a>

**Hyperelliptic average two.** For each g≥1, coefficient-height ordering of all smooth integral degree-(2g+2) binary models whose actual Div¹ is soluble over every completion has limsup average #Sel₂(J¹)≤2. The same holds in positive-mass congruence families for which excluded p-adic coefficients, at every sufficiently large p, reduce into a fixed codimension-at-least-two coefficient subscheme. In particular it holds for the full locally C-soluble and locally Div¹-soluble families and admissible positive-mass families restricted to local Div¹. Existence of an average equal to two is not asserted. The extension to a reduction-only Definition 39 family is asserted only with the fixed codimension-two envelope hypothesis just stated.

For the full locally soluble family this is `average_SelmerPicOne_le_two` of HeightsRationalPointsAndObstructions §3.18b. For the other families sieve the coefficient denominator with the uniform excluded-prime tail O(X^(n+1)/M)+O(X^n) of `codimensionTwo_congruenceTail` (same section), obtaining `c_FX`^(n+1)+o with `c_F`>0. Local-solubility failure reduces to the scalar-square locus by Poonen–Stoll Lemma 15 and A.5(3). Divide the numerator upper bound by the actual positive denominator. Remove the 16 scaling by the imported height and curve-isomorphism transport.

*Needs:* [hyperelliptic weighted upper bound](#refinement-hyperelliptic-weighted-upper-bound), [large coefficient family tail](../ArithmeticStatisticsPartIII/README.md#refinement-large-coefficient-family-tail), [average over a height ordered family](#average-over-a-height-ordered-family), [constant rescaling of a height](../ArithmeticStatisticsPartI/README.md#constant-rescaling-of-a-height), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), [pencil infinite weight upper bound](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-infinite-weight-upper-bound), [odd residue field models](#refinement-odd-residue-field-models), HeightsRationalPointsAndObstructions §3.18, HeightsRationalPointsAndObstructions §3.18b.

([[110]](#ref-110), Theorem 6 p.3; Proposition 42 and proof pp.33–34.)

**Checks.**

- A fixed codimension-two envelope gives the excluded-prime tail; reduction-only largeness alone does not.
- A zero local mass prevents division by a positive coefficient main term.
- The conclusion is a limsup bound of two, not existence of a mean equal to two.

### 4.20 Restricted Selmer sets and small odd-degree points

<a id="refinement-order-k-strict-average"></a>

**Order k strict average.** For k>0 odd and k<g, the limsup average cardinality of the order-k two-Selmer set over the full coefficient-height family of locally soluble genus-g hyperelliptic models is strictly below two. The same conclusion applies to positive-mass sieve-controlled finite-prime congruence subfamilies that retain positive measure of the fully split real stratum. No conclusion is made for a family whose real restrictions delete that stratum.

Sieve the numerator by the real effective-divisor image and by the remaining local images. The fully split stratum has m=g+1 and positive Euclidean volume. There S_(g+1)(k)<2^g, giving a strictly smaller real mass in the compatible upper-bound calculation.

*Needs:* [hyperelliptic average two](#refinement-hyperelliptic-average-two), [real effective divisor image](#refinement-real-effective-divisor-image), [odd component bound](#refinement-odd-component-bound), [pencil infinite weight upper bound](../ArithmeticStatisticsPartIII/README.md#refinement-pencil-infinite-weight-upper-bound).

([[110]](#ref-110), Theorem 7 pp.3,33–34.)

<a id="refinement-order-k-vanishing-average"></a>

**Order k vanishing average.** For fixed k>0 odd, let A_(g,k) be the limsup coefficient-height average of the order-k two-Selmer set over either the full locally C-soluble or the full locally actual-Div¹-soluble genus-g model family. Then A_(g,k)→0 as g→∞. Height tends to infinity first, separately for each g. The statement is not a uniform joint estimate in height and genus and does not apply to arbitrary genus-dependent real subfamilies.

For a fixed component cutoff M, control the many-component real strata by sup_(m≥M) `S_m(k)`/2^(m−1). Uniform independent coefficients on [−1,1] satisfy the fixed-few-root probability theorem; a finite sum over each bounded real-root count tends to zero. The qualitative statement that the real-root count tends to infinity in probability, `uniformCoefficient_realRoots_unboundedInProbability` of HeightsRationalPointsAndObstructions §3.18c, already suffices for this step. For each fixed g, cancel the common finite-place Euler product in numerator and denominator before taking the genus limit. Normalize the remaining real coefficient law by real solubility, whose probability is at least 1/2 because a positive leading coefficient gives a real point. Handle zero-root/no-point strata under this conditioning; conditioning multiplies any exceptional probability by at most two. Take genus→∞, then M→∞. No log n/log log n endpoint estimate is needed.

*Needs:* [hyperelliptic average two](#refinement-hyperelliptic-average-two), [real effective divisor image](#refinement-real-effective-divisor-image), [odd component bound](#refinement-odd-component-bound), [fixed-real-root probability estimate](#support-real-roots), HeightsRationalPointsAndObstructions §3.18c, [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box).

([[110]](#ref-110), Theorem 7 and (23) p.34.)

**Checks.**

- A finite-place Euler product tending to zero with g still cancels at each fixed g.
- Real solubility has probability at least 1/2, so a vanishing few-root probability remains vanishing after conditioning.
- The genus limit follows the height limit; no uniform positive finite-place product is used.

<a id="refinement-small-odd-degree-points-disappear"></a>

**Small odd degree points disappear.** For every fixed positive integer m, the lower density, among all smooth genus-g coefficient-height hyperelliptic models, of curves with no point over any odd-degree extension of degree≤m tends to one as g→∞. Height tends to infinity first. All extensions are included, not only Galois extensions or rational points.

The Lean statement `small_odd_degree_points_disappear` uses `hyperellipticPolynomial` in descending coefficients, the smooth degree-(2g+2) coefficient cubes `hyperellipticSublevel`, and `hasOddDegreePoint`. The equation predicate `hyperellipticHasPoint` includes affine points and the points at infinity, which exist over a field precisely when the leading coefficient is a square. Finite extensions range over finite-dimensional intermediate fields of an algebraic closure of Q. The inner height liminf precedes the genus limit.

Choose the largest odd k≤m. Trace a point of any smaller odd degree to an effective rational divisor and add effective degree-two hyperelliptic fibres to reach k. An odd-degree global divisor together with the degree-two divisor gives an actual degree-one divisor over each completion. Hence a curve outside the locally actual-Div¹-soluble family has no odd-degree point. Inside that family, the effective degree-k divisor gives a member of the restricted Selmer set; Markov’s inequality bounds the proportion with such a point by its average cardinal. Multiply by the family’s proportion, which is at most one. Use the ordered-limit Div¹ version with the finite-place product cancelled; no local C-point implication is used.

*Needs:* [restricted selmer set](#refinement-restricted-selmer-set), [order k vanishing average](#refinement-order-k-vanishing-average), [hyperelliptic model family](../ArithmeticStatisticsPartI/README.md#hyperelliptic-model-family), [density denominator comparisons](../ArithmeticStatisticsPartI/README.md#density-denominator-comparisons).

([[110]](#ref-110), Corollary 8 p.3.)

**Checks.**

- Do not assume an odd-degree global point implies C(`Q_v`)≠∅. It gives actual Div¹(`Q_v`), which is the required family for the extended order-k argument.

### 4.21 Empty Selmer sets and index two

<a id="refinement-positive-empty-selmer-set"></a>

**Positive empty selmer set.** For every g≥1, in any positive-density admissible coefficient-height congruence family restricted to everywhere actual-Div¹-soluble models, a positive lower proportion have Sel₂(J¹)=∅. More precisely, if the even finite 2-Selmer-dimension subfamily has lower density δ>0, the empty-set subfamily has lower density at least δ/2 after the generic exceptions are removed.

Outside generic exceptions, a nonempty Sel₂(J¹) has size #Sel₂(J)≥2 and at least four on even-dimensional curves. For height-truncated counts N,E,Z and total Selmer cardinal T, use T≥2N+2E−4Z−4B with B the exceptional count. Combine B/N→0 and limsup T/N≤2.

*Needs:* [hyperelliptic average two](#refinement-hyperelliptic-average-two), [generic weierstrass class](#refinement-generic-weierstrass-class), [admissible family selmer parities](#refinement-admissible-family-selmer-parities), [locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), HeightsRationalPointsAndObstructions §3.18c (the same deduction for locally soluble models).

([[110]](#ref-110), Theorem 5 p.3, introduction pp.3–4 and §12 p.34.)

<a id="refinement-positive-index-two"></a>

**Positive index two.** For each g≥1, a positive lower proportion of locally C-soluble genus-g coefficient-height models over Q have no point over any finite odd-degree extension; equivalently J¹(Q)=∅ and index(C)=2. The same holds in the positive-density admissible families of the preceding target, with actual Div¹-solubility locally in place of local C-points.

The Lean statement `positive_no_odd_degree_points` states the no-odd-degree-point conclusion for every g≥1 in the full locally C-soluble family `locallySolubleHyperelliptic`, with its actual smooth coefficient-cube denominator. The point condition includes the real completion and every p-adic completion. The Picard and index identifications and the admissible-family assertion retain the hypotheses above.

A rational point of J¹ pulls multiplication-by-two on J back to a locally soluble two-cover, so an empty Selmer set forces J¹(Q) empty. Apply the actual-divisor comparison and the index-divides-two argument.

*Needs:* [positive empty selmer set](#refinement-positive-empty-selmer-set), [degree one arithmetic comparison](#refinement-degree-one-arithmetic-comparison).

([[110]](#ref-110), Theorems 1,2 pp.1–2 and Theorem 12 p.4.)

<a id="refinement-positive-nontrivial-sha-two"></a>

**Positive nontrivial sha two.** For a positive lower proportion in each family of the index-two target, Sha(J/Q)[2] is nontrivial. The image of W[2] is the nontrivial locally trivial J¹-torsor. No conjectural finiteness of Sha is used.

Use the cohomological Kummer exact sequence to map the two-cover class W[2] to [J¹]. J¹ is everywhere locally trivial but has no rational point and is killed by two because the hyperelliptic degree-two class is rational.

*Needs:* [positive index two](#refinement-positive-index-two), [locally soluble pencil orbits](../ArithmeticStatisticsPartII/README.md#refinement-locally-soluble-pencil-orbits), SelmerIwasawaCohomology §§2.10–2.12a.

([[110]](#ref-110), Corollary 3 p.2.)

<a id="refinement-degree-one-points-empty-or-infinite"></a>

**Degree one points empty or infinite.** For density one of locally actual-Div¹-soluble genus-g coefficient-height models, J¹(Q) is either empty or infinite. If it is nonempty, the nonzero W[2] lies in J(Q)/2J(Q), while J(Q)[2]=0; the finitely generated group J(Q) consequently has positive Mordell–Weil rank.

Use the generic two-torsion and W[2] statements and the Kummer kernel. A finite group with no two-torsion has trivial quotient by two. Mordell–Weil therefore gives positive rank, and torsor translation gives infinitely many degree-one points.

*Needs:* [generic weierstrass class](#refinement-generic-weierstrass-class), [degree one arithmetic comparison](#refinement-degree-one-arithmetic-comparison), HeightsRationalPointsAndObstructions §3.18.

([[110]](#ref-110), Remark 4 p.2.)

<a id="refinement-corrected-two-prime-criterion"></a>

**Corrected two prime criterion.** Let g≥1 and F be a positive-density sieve-controlled congruence family of degree n=2g+2 models with locally soluble actual Div¹. Suppose odd distinct primes p,q are each quadratic nonresidues modulo the other. On a positive lower proportion of f, require f,pf,qf,pqf∈F, all four curves to have points over `Q_p` and `Q_q`, `J_f` split semistable of toric rank one at p and good at q. If two has a unique prime above it in Q(√p,√q), also require good reduction of `J_f` at two and Q₂-points on all four curves. Then a positive lower proportion of F have empty Sel₂(J¹), no odd-degree point and index two. The printed Theorem 44 omits the dyadic requirement; the reduction-only Definition 39 extension requires the fixed codimension-two envelope hypothesis of [hyperelliptic average two](#refinement-hyperelliptic-average-two).

In Q(√p,√q), the only possible unique-prime finite places are p,q,two. Apply A.3 with p₀=p and all its point/reduction hypotheses. Twist-height bounds and finite fibres produce positive even Selmer proportion in F. Apply the empty-set counting argument.

*Needs:* [four twist local parity](#refinement-four-twist-local-parity), [hyperelliptic average two](#refinement-hyperelliptic-average-two), [generic weierstrass class](#refinement-generic-weierstrass-class), [degree one arithmetic comparison](#refinement-degree-one-arithmetic-comparison).

([[110]](#ref-110), Theorem 44 pp.34–35, corrected with Theorem A.3 p.36.)

**Checks.**

- For (p,q)=(5,3), two has a unique prime above it, so the added conditions are essential to this proof.

- The four Q_p and Q_q point conditions apply to all twists, not just the original curve.
- A reduction-only family without the fixed envelope does not satisfy the stated denominator hypothesis.

### 4.22 Rank-one converse and local five-Selmer labels

The rank-one converse and its analytic consumers take the modular comparison data of [the analytic contract](#support-analytic-rank) as hypotheses. The coefficient family, local-label comparison and weighted Selmer counts are independent of those data.

<a id="refinement-rank-one-selmer-criterion"></a>

**Rank one selmer criterion.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Let E/Q have squarefree conductor with at least two odd prime factors, p≥5 a prime of good ordinary reduction, and irreducible E[p]. If `Sel_p(E)`≅`F_p` and its restriction to E(`Q_p`)/pE(`Q_p`) is not contained in the image of E(`Q_p`)[p], then both algebraic and analytic rank of E are one. This is the statistical application of the exact Skinner converse, not an assumption of finite Sha or a use of its converse direction.

Use the finite-to-p∞ Kummer and local comparison in Lemma 8 to obtain a one-dimensional rational Selmer group with injective local restriction. Apply Skinner’s Theorem C: for squarefree conductor with at least two odd factors, either one is nonsplit multiplicative or at least two are split multiplicative. Use [anticyclotomic main-conjecture implication](#anticyclotomic-main-conjecture-implication) and [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank) with the supplied modular comparison data.

*Needs:* [anticyclotomic main-conjecture implication](#anticyclotomic-main-conjecture-implication), [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank), SelmerIwasawaCohomology §§2.10–2.12a, [modular comparison data and the specialized analytic inputs](#support-analytic-rank).

([[112]](#ref-112), Bhargava–Skinner Theorem 3 pp.2–3 and proof pp.6–8; [[114]](#ref-114), Theorem C p.332 and its surrounding hypotheses pp.331–332.)

**Checks.**

- A Selmer line contained in the local p-torsion image fails the criterion.
- One nonsplit odd multiplicative prime or two split odd multiplicative primes supply Skinner’s alternatives.
- The modular comparison data identify the continued newform L-function, including every bad Euler factor.

<a id="refinement-twisted-rank-one-selmer-criterion"></a>

**Twisted rank one selmer criterion.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Let E/Q have squarefree conductor N with at least two odd prime factors, p≥5 good ordinary, and E[p] irreducible. Let K/Q be imaginary quadratic of odd discriminant D, with 2 and p split and gcd(D,N)=1. Require E[p] ramified at an odd prime q inert in K, `Sel_p(E)`=0, `Sel_p(E^D)`≅`F_p`, and restriction of `Sel_p(E^D)` not contained in the local p-torsion image. Then E^D has algebraic and analytic rank one. E^D itself need not have squarefree conductor.

Compare the Bloch–Kato Selmer group over K with the invariant and anti-invariant groups over Q; the E component vanishes and the twist component is a line with injective restriction. Apply Skinner Theorem B to E over K and use L(E/K,s)=L(E,s)L(E^D,s). Use [anticyclotomic main-conjecture implication](#anticyclotomic-main-conjecture-implication) and [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank) with the supplied modular comparison data; do not apply Theorem C to the ramified twist.

*Needs:* [anticyclotomic main-conjecture implication](#anticyclotomic-main-conjecture-implication), [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank), SelmerIwasawaCohomology §§2.10–2.12a, [modular comparison data and the specialized analytic inputs](#support-analytic-rank).

([[112]](#ref-112), Bhargava–Skinner Theorem 4 p.3 and proof pp.7–8; [[114]](#ref-114), Theorem B p.331; introduction pp.329–334.)

**Checks.**

- For D=−39, two and five split and seven is inert.
- The conductor of E^D need not be squarefree; Theorem B is applied to E over K.
- Sel_p(E)=0 is needed to isolate the anti-invariant Selmer line.

<a id="refinement-rank-one-family"></a>

**Rank one family.** The family F is the set of integral short pairs (A,B) with v₂(A)=4, B≡16 mod64, Δ₀=−4A³−27B²=256d, d positive odd squarefree, gcd(Δ₀,195)=1, Δ₀ a square modulo 39, 7|d, 864B a nonsquare in `F_7`, and #E_(A,B)(`F_5`) not congruent to one modulo five. These last two coefficient tests express nonsplit multiplicative reduction at seven and good ordinary reduction at five; #E(`F_5`)=1+# {(x,y)∈F_5²:y²=x³+Ax+B}. Via the imported unique minimal-short-pair convention this is the family F of elliptic-curve isomorphism classes. Use H=max(4|A|³,27B²) and the fixed quadratic discriminant D=−39.

Required API:

- `ArithmeticSelmerRefinement.rankOne_delta`: A pair in F has Δ₀=256d with d>0, odd and squarefree.

- `ArithmeticSelmerRefinement.rankOne_good_discriminant`: A pair in F is nonsingular and gcd(Δ₀,195)=1.

- `ArithmeticSelmerRefinement.rankOne_ordinary_test`: Its actual finite-field point count satisfies #E(`F_5`) mod 5≠1.

- `ArithmeticSelmerRefinement.rankOne_twist_disjoint`: For (A,B)∈F the raw −39 twist pair (39²A,(−39)³B) is not in F, since its discriminant is divisible by 39.

- `ArithmeticSelmerRefinement.rankOne_twist_height`: For every raw short pair H(39²A,(−39)³B)=39⁶H(A,B). The family-properties theorem supplies that the twist pair is already minimal-short, so this equals isomorphism-class height.

Replace the local reduction conditions by their discriminant/c₆ and finite-field trace tests; the gcd and squarefree conditions make the models smooth and the seven-valuation exactly one. Take the subset of the existing short-pair carrier, not a new quotient of arbitrary Weierstrass equations.

*Needs:* [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), `ZMod` (Mathlib).

([[112]](#ref-112), §2 pp.3–4 and §5 p.14. The v1 source prints `2³∥A`; the valuation-four and B mod64 conditions here give the displayed integral good-reduction model.)

**Checks.**

- (−208,464) belongs to F: d=117901=7·16843, Δ₀ mod39=10=7² mod39, 864B mod7=6 and #E(`F_5`)=7. Its good integral model is y²+y=x³−13x+7.

- (−208,656) satisfies the other coefficient conditions but fails the nonsplit-seven test: 864B mod7=1 is a square.

- (208,464) has negative d and is excluded.

- (−32,464) violates v₂(A)=4 and is excluded. The pair (−136,16) also fails this valuation condition: its short-model c₄ has valuation seven, incompatible with good reduction after the only possible dyadic discriminant scaling.

- The pair (−880,464) satisfies the other coefficient conditions but has #E(F₅)=6, so it is excluded by the ordinary test.

<a id="refinement-rank-one-family-properties"></a>

**Rank one family properties.** F has asymptotic count `c_F` X^(5/6)+o(X^(5/6)), `c_F`>0, in the minimal-short-pair height. Every E∈F is semistable of odd squarefree conductor d, with at least two odd factors; E[5] is irreducible and ramified at every factor of d. For D=−39, 2 and 5 split in Q(√D), seven is inert, and E,E^D have opposite root numbers. The twist short pair is minimal and H(E^D)=39⁶H(E); the original and twisted families are disjoint as isomorphism classes.

At two use y²+y=x³+(A/16)x+(B/16−1)/4. Its coefficients are integral and its discriminant is d, so reduction is good. The dyadic residue condition has coefficient Haar mass 1/(32·64); the other finitely imposed local conditions have positive mass, witnessed by (−208,464). For sufficiently large odd primes the excluded square-discriminant locus has mass O(p⁻²), so its convergent Euler product is positive. Apply the discriminant tail to pass from finite CRT densities to the large-family asymptotic. Neither the dyadic density nor the reduction assertion uses the printed valuation-three condition. At odd bad primes the minimal discriminant valuation is one, so the conductor is d and mod-five inertia is nontrivial. A reducible residual semistable ordinary representation would have semisimplification 1⊕ω; its Frobenius eigenvalues contradict nonsplit reduction at seven because 7≠−1 mod 5. Verify the quadratic characters and root-number formula. Squarefreeness with seven dividing d and d square mod 39 excludes conductor seven alone. Apply the imported large-family denominator, with the local positivity witnessed explicitly.

*Needs:* [rank one family](#refinement-rank-one-family), [count of curves in a large family](#count-of-curves-in-a-large-family), ArithmeticGaloisRepresentations §§1.7–1.9, 2.1–2.3, NeronModelsAndSemistableAbelianVarieties Layer 5, SelmerIwasawaCohomology §§2.10–2.12a.

([[112]](#ref-112), Lemma 14 and Lemma 15 pp.14–15; §2 pp.3–4; final proof p.17.)

**Checks.**

- For (A,B)=(−208,464), y²+y=x³−13x+7 has odd squarefree discriminant 117901.
- The dyadic coefficient cylinder has mass 1/2048 before the other local restrictions.
- The pair (−136,16) has v₂(c₄)=7 and v₂(Δ)=12, so scaling the discriminant to a unit would give v₂(c₄)=3, impossible for an integral Weierstrass model.

<a id="refinement-local-five-quotient-comparison"></a>

**Local five quotient comparison.** For E/`Q_5` of good ordinary reduction, a sufficiently small open coefficient disc W identifies the finite groups E′(`Q_5`)/5E′(`Q_5`) with E(`Q_5`)/5E(`Q_5`) and identifies their actual rational-five-torsion images. In the quinary covering representation the soluble G(`Q_5`)-orbits admit corresponding disjoint compact open integral labels over W. Under the covering-to-Kummer map these labels agree with the point-group identifications. A bijection of sets that fails to preserve the torsion image is insufficient.

Import the local point-group comparison (good reduction suffices for this application), using smooth reduction and closeness of torsion division-polynomial roots. Separate compact stable integral orbit fibres and shrink the invariant disc using openness of the invariant map. Verify compatibility via nearby points on the covering. This requires the exact Layer 1 quinary covering supplier contract, not just its invariant polynomials.

*Needs:* [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), NeronModelsAndSemistableAbelianVarieties §1.7, SelmerIwasawaCohomology §§2.10–2.12a.

([[112]](#ref-112), Propositions 11–12 and Theorem 7 deduction pp.11–13.)

**Checks.**

- At a good ordinary curve the local quotient has size 5 or 25 according to the local rational-five-torsion size.
- Any comparison carries the actual torsion image, not just the quotient cardinality.
- The quinary invariant transport uses (I_BS,J_BS)=(6⁴I,6⁶J), not equality of the two coefficient normalizations.

<a id="refinement-five-selmer-local-equidistribution"></a>

**Five selmer local equidistribution.** Let F be a large positive-density family of elliptic curves contained in a sufficiently small five-adic disc W as above, with the actual local group Q and its torsion image identified throughout W. For each q∈Q, the number of pairs (E,s), H(E)<X, s∈Sel₅(E)\{0}, res(s)=q, divided by #F_(H<X), tends to 5/#Q. More generally a subset I⊆Q gives average 5#I/#Q. This weights curves by the number of nonidentity elements; it does not say each individual Selmer group maps uniformly.

Restrict the acceptable quinary orbit weight to any compact open local orbit label. The stabilizer-weighted local mass is proportional to the number of labels. Apply the same acceptable weighted count and prime-tail theorem to the restricted weights, divide by the positive curve denominator and use average #Sel₅=6, hence average nonidentity size five.

*Needs:* [local five quotient comparison](#refinement-local-five-quotient-comparison), [quinary acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-quinary-acceptable-count), [average size of the 5 selmer group](#average-size-of-the-5-selmer-group).

([[112]](#ref-112), Theorems 7,9 pp.4,10–11, proof pp.10–13.)

**Checks.**

- For a singleton label the mean is 5/#Q, not 6/#Q; curves with Sel₅={0} contribute no elements.

- The whole label set gives mean five nonidentity elements.
- An empty set of labels gives zero; adding the identity would give an incorrect constant.

### 4.23 Counting simultaneous algebraic and analytic rank one

<a id="refinement-rank-one-torsion-image-bound"></a>

**Rank one torsion image bound.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Use F, D=−39, p=5, height cut H(E)<X, and write `N_i` for Selmer dimension i, `N_even`,`N_odd` for the parity counts, and `B_1` for dimension-one curves whose entire restricted Selmer line lies in the local rational-torsion image. Superscript D counts the twists using the original E-height cutoff. Then `B_1`≤N/(p−1)−(`N_even`−`N_0`)−(p+1)(`N_odd`−`N_1`)+o(X^(5/6)), and `B_1^D`≤N/(p−1)−(`N_odd`−`N_0^D`)−(p+1)(`N_even`−`N_1^D`)+o(X^(5/6)). The formula applies here because #Q=p#E(`Q_p`)[p] and both local torsion images are transported correctly.

Partition the compact five-adic good-reduction parameter locus into finitely many comparison discs. Equidistribution gives N+o(X^(5/6)) nonidentity elements restricting into torsion. The local quotient modulo the torsion image has size p. A finite `F_p`-space of dimension≥2 has at least p−1 nonzero kernel elements; dimension≥3 has at least p²−1. Dimension-one trapped lines contribute p−1. Divide the total inequality by p−1. Repeat for the twisted family. Opposite root numbers and [p-Selmer parity](#support-p-parity) interchange `N_even`,`N_odd`.

*Needs:* SelmerIwasawaCohomology §4.29 (Cassels–Tate and reduced-primary pairings), [five selmer local equidistribution](#refinement-five-selmer-local-equidistribution), [rank one family properties](#refinement-rank-one-family-properties), SelmerIwasawaCohomology §§2.10–2.12a.

([[112]](#ref-112), Lemma 16 pp.15–16.)

**Checks.**

- The source proof’s odd-rank≥3 case requires `Sel_p` not isomorphic to `F_p`, not merely nonzero. At p=5 the trapped-line leading bound is N/4.

- A dimension-two space has at least p−1 nonzero vectors in the kernel of a map to a one-dimensional quotient.
- For the twist the even/odd labels are exchanged by opposite root numbers and the supplied finite p-parity theorem.

<a id="refinement-rank-one-saturated-count"></a>

**Rank one saturated count.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Let `N_sat` count E∈F_(H<X) satisfying the Q criterion and `N_sat^D` those satisfying the imaginary-twist criterion. These are disjoint subsets of the original F, because the first has odd finite five-Selmer dimension and the second has dimension zero. Then `N_sat`+`N_sat^D`≥(1−2/(p−1))N+o(X^(5/6)) with p=5, so their sum is at least N/2+o(X^(5/6)). This does not count every twist by its own height at this step.

Use `N_sat`=`N_1`−`B_1` and `N_sat^D`≥`N_1^D`−`B_1^D`+`N_0`−`N_even`. Insert both torsion-image bounds and cancel the even/odd and dimension-zero terms. Higher odd and even dimensions contribute nonnegative terms.

*Needs:* [rank one torsion image bound](#refinement-rank-one-torsion-image-bound), [rank one selmer criterion](#refinement-rank-one-selmer-criterion), [twisted rank one selmer criterion](#refinement-twisted-rank-one-selmer-criterion), [rank one family properties](#refinement-rank-one-family-properties).

([[112]](#ref-112), Proposition 17 p.16.)

**Checks.**

- Substituting p=3 gives zero; the proof must use p=5 rather than the 3-Selmer average.

- The Q criterion requires dimension one, while the twist criterion requires original dimension zero, so the counted subsets are disjoint.
- The factor 39⁵ enters only when the successful twists are compared in the full-family height denominator.

<a id="refinement-positive-simultaneous-rank-one"></a>

**Positive simultaneous rank one.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Among all Q-isomorphism classes of elliptic curves ordered by the unique minimal-short-pair height H=max(4|A|³,27B²), the lower density with `rank_ZE(Q)`=ord_(s=1)L(E,s)=1 is positive. If #F_(H<X)~`c_F` X^(5/6) and #E_(H<X)~`c_E` X^(5/6), the proof gives lower bound `c_F`/(2c_E·39^5). The lower limits of both average ranks are consequently positive; their limits are not asserted to exist.

The satisfied E and their successful D-twists have height below 39⁶X and are disjoint curve classes. The twist map is injective on the supplied class carrier. Use the all-curve asymptotic `c_E(39⁶X)`^(5/6)=`c_E`·39^5X^(5/6), then the saturated lower bound. Apply nonnegativity of rank for the average-rank consequences.

*Needs:* [rank one saturated count](#refinement-rank-one-saturated-count), [rank one family properties](#refinement-rank-one-family-properties), [elliptic curves over q ordered by height](../ArithmeticStatisticsPartI/README.md#elliptic-curves-over-q-ordered-by-height), [count of curves in a large family](#count-of-curves-in-a-large-family).

([[112]](#ref-112), Theorem 1 and Corollary 2 pp.1–2; final proof p.17; [[114]](#ref-114), Theorem D p.332.)

**Checks.**

- Scaling the cutoff by 39⁶ scales the all-curve denominator by 39⁵.
- The success bound N/2 is relative to the original family before the twist-height change.
- This analytic conclusion assumes the modular comparison data throughout both families.

### 4.24 Rational solubility of plane cubics

<a id="refinement-soluble-generic-three-selmer-elements"></a>

**Soluble generic three selmer elements.** Assume a positive lower proportion of minimal-short-pair elliptic curves has positive Mordell–Weil rank. Among height-ordered elliptic curves, the number of pairs (E,s) with s a nonidentity Kummer image in Sel₃(E), H(E)<X, is at least cX^(5/6) for some c>0. Each positive-rank E supplies at least two such classes of exact order three; their associated smooth plane cubics have a rational projective point and no rational flex. The positive proportion relative to all nonidentity Sel₃ elements also follows from average #Sel₃=4.

Use E(Q)/3E(Q)↪Sel₃(E) and the finite-generation rank-one quotient. Both nonzero classes have exact order three even if rational three-torsion is present. Apply the soluble ternary-cover orbit dictionary and global rational-point interpretation; divide by the Selmer average only when asserting an element proportion.

*Needs:* [positive simultaneous rank one](#refinement-positive-simultaneous-rank-one), [average size of the 3 selmer group](#average-size-of-the-3-selmer-group), [ternary cubic forms and their invariants](../ArithmeticStatisticsPartII/README.md#ternary-cubic-forms-and-their-invariants), [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), SelmerIwasawaCohomology §§2.10–2.12a.

([[113]](#ref-113), Plane-cubic §1.2 pp.4–5 and Theorem 11 §3 p.8.)

**Checks.**

- A positive-rank finitely generated group has at least two nonzero classes modulo three.
- A rational flex represents the identity class and is excluded from the generic count.
- The positive-rank count is an explicit hypothesis; the simultaneous-rank target supplies it when its modular data are given.

<a id="refinement-plane-cubic-height-and-orbit-transfer"></a>

**Plane cubic height and orbit transfer.** For integral ternary cubics use G=PGL₃ acting by (γ·f)(x)=det(γ)^(−1)f(xγ); scalar matrices act trivially. A(v),B(v) are normalized so the Jacobian is y²=x³+Ax+B and `H_AB`=max(|A|³,B²), homogeneous of degree twelve in v. Over Q, soluble rational G-orbits at fixed invariants correspond to E(Q)/3E(Q) and have stabilizer E(Q)[3]. Every everywhere locally soluble Sel₃ class at integral invariants admits an integral representative, and one can choose distinct G(Z)-orbits for distinct classes. Generic means nonsingular with no Q-flex. SL₃(Z)-orbits give the same integral action image; PGL₃(Q)-orbits must not be replaced by SL₃(Q)-orbits.

Import the ternary covering, classification and integral-representative statements from PartII’s Supporting descent and integral realization, via the six `GenusOneModel` maps specified in the supplier contract. Prove the height and counting normalization transport here. Transport the chosen invariants and measure normalization. With Fisher c₄,c₆, A=−c₄/48, B=−c₆/864, whereas the Layer 2 counting normalization I=c₄/16,J=c₆/32 gives `H_IJ`=max(27|A|³,729B²/4). Thus 27H_AB≤`H_IJ`≤(729/4)`H_AB`. Also `H_AB`≤`H_BS`≤27H_AB. Bounded comparisons transfer positive lower counts, not exact average constants. For heights h≤h′≤C h on the same carrier, {h′<X}⊆{h<X}⊆{h′<CX}. Thus counts bounded below at h′<X/C remain bounded below at h<X. Apply this inclusion and the X^(5/6) denominator; the ratio `H_BS`/`H_AB` need not be constant on finitely many pieces.

*Needs:* [ternary cubic forms and their invariants](../ArithmeticStatisticsPartII/README.md#ternary-cubic-forms-and-their-invariants), [invariance of ternary cubic invariants](../ArithmeticStatisticsPartII/README.md#invariance-of-ternary-cubic-invariants), [Supporting descent and integral realization](../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization), [arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family).

([[113]](#ref-113), Plane-cubic Theorems 12–14 and Corollary 15 pp.8–10.)

**Checks.**

- det^(−1) substitution preserves the invariants and kills scalar matrices; plain substitution is not the PGL₃ action.

- The identity cubic y²z−x³+xz² has (I,J)=(3,0), with a rational flex.
- Two integral orbits in one rational orbit represent one Selmer class; use the rational dictionary before the count.

<a id="refinement-soluble-ternary-fundamental-count"></a>

**Soluble ternary fundamental count.** Assume a positive lower proportion of minimal-short-pair elliptic curves has positive Mordell–Weil rank. For the integral ternary-cubic representation and `H_AB` invariant height, take a finite-volume real fundamental region F₁ with compatible orbit and stabilizer multiplicities. Require a fixed finite bound M≥1 on the multiplicity of each coefficient vector, with M=1 for a set of representatives; boundary choices must satisfy the same convention. Its dilate `F_t`=tF₁ corresponds to `H_AB`<t^12. Weighted generic integral points satisfy `N_gen(F_t)`=c₁t^10+o(t^10), c₁>0, and weighted generic points with a rational projective zero have count at least c₃t^10+o(t^10), c₃>0. The total, soluble and bounded-intersection counts use this one convention. Passing from a multiset count to distinct coefficient vectors divides a lower bound by at most M.

The positive-rank count is the input to this algebraic transport; it follows from the simultaneous-rank theorem when the family modular comparison data are supplied. Use the homogeneous geometry-of-numbers fundamental region with the corrected invariant region. Import the Layer 2 cusp and nongeneric estimates; make the normalization extension explicit. Inject the nontrivial rational Selmer classes into integral generic orbits and use the rank-one lower count. Degree-twelve invariant height and X^(5/6) produce t^10, matching the coefficient dimension. Choose a genuine fundamental set as in the source, or verify a finite multiplicity bound M independent of t for the chosen multiset. Carry the same multiplicity convention through total counts and bounded intersections; divide by M when counting distinct vectors.

*Needs:* [soluble generic three selmer elements](#refinement-soluble-generic-three-selmer-elements), [plane cubic height and orbit transfer](#refinement-plane-cubic-height-and-orbit-transfer), [ternary cubic finite count](../ArithmeticStatisticsPartIII/README.md#refinement-ternary-cubic-finite-count), [ternary cubic acceptable count](../ArithmeticStatisticsPartIII/README.md#refinement-ternary-cubic-acceptable-count).

([[113]](#ref-113), Theorem 16 p.10; Theorem 2 statement p.3 and proof pp.11–13.)

**Checks.**

- A weighted orbit/multiset count implies a coefficient-vector lower count only after a uniform point-multiplicity bound is fixed.

- The exponent is ten because invariant height has degree twelve and the elliptic count exponent is 5/6.
- A multiplicity bound depending on the dilation would not give the stated positive coefficient density.

<a id="refinement-positive-plane-cubic-solubility"></a>

**Positive plane cubic solubility.** The target `positive_plane_cubic_solubility` assumes a positive lower proportion of minimal-short-pair elliptic curves has positive Mordell–Weil rank. Equivalently for its Lean signature, the count of minimal nonsingular pairs with infinitely many rational affine points and H≤T⁶, divided by T⁵, has positive liminf; Mordell–Weil and the all-curve asymptotic give the equivalence. Use `ternaryCubicValue c x` for evaluation in the stated monomial basis. Let c run over all integral ten-tuples, the coefficients of x³,x²y,x²z,xy²,xyz,xz²,y³,y²z,yz²,z³. For the cube |`c_i`|≤T, let `N_sol(T)` count tuples whose homogeneous cubic has a nonzero rational zero. Then liminf_(T→∞) `N_sol(T)`/(2⌊T⌋+1)^10>0. Restricting the numerator and denominator to smooth plane cubics preserves this conclusion because the discriminant-zero coefficient locus has density zero. The denominator counts equation models without GL₃, scalar or isomorphism quotients.

Choose r so the bounded intersection F₁∩r[−1,1]^10 captures all but less than c₃/2 of the generic total weighted mass. Use the total asymptotic minus the bounded-intersection lattice asymptotic to control the omitted cusp count. Volume smallness alone is insufficient. At least (c₃/2)t^10 weighted soluble generic points remain in rt[−1,1]^10. The fixed multiplicity bound M gives at least (c₃/(2M))t^10 distinct integral coefficient vectors. Put T=rt and divide by the actual ten-dimensional lattice-box count, giving lower bound c₃/(2M(2r)^10)>0. Remove singular forms only using their codimension-one lattice estimate; the all-form and smooth denominators are asymptotic. The same bound holds along integer coefficient cutoffs by monotonicity and adjacent-cutoff comparison.

*Needs:* [soluble ternary fundamental count](#refinement-soluble-ternary-fundamental-count), [coefficient box](../ArithmeticStatisticsPartI/README.md#coefficient-box), GeometryOfNumbersAndQuadraticArithmetic §4.1 (Davenport estimate), `Set.ncard` (Mathlib), `Filter.limsup` (Mathlib).

([[113]](#ref-113), Theorem 16 p.10; Theorem 2 statement p.3 and proof pp.11–13.)

**Checks.**

- The coefficient denominator is (2T+1)¹⁰, with no quotient by GL₃.
- The singular discriminant locus has density zero, so deleting it preserves the positive lower proportion.
- A count at curve height T⁶ has scale T⁵; this is the positive-rank hypothesis in the Lean signature.

### 4.25 Three-Selmer rank and nonvanishing consequences

<a id="refinement-balanced-three-rank-zero"></a>

**Balanced three rank zero.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Let F be a positive-density large family of minimal integral elliptic curves over Q ordered by H=max(4|A|³,27B²). Suppose root signs have limiting proportions 1/2 each. Then the lower density in F of trivial 3-Selmer group, hence Mordell–Weil rank 0, is at least 1/4. The mean 3-Selmer bound≤4 and density-zero rational 3-torsion are used.

Use the [p-Selmer parity theorem](#support-p-parity) at p = 3 on the curves with E(Q)[3] = 0. At each finite height a nonzero even rank contributes at least 9 and odd rank at least 3. Use the mean bound and balanced parity to bound the zero-rank proportion before taking liminf.

*Needs:* SelmerIwasawaCohomology §4.29 (Cassels–Tate and reduced-primary pairings), [average size of the 3 selmer group](#average-size-of-the-3-selmer-group), [rational p torsion has density zero](#rational-p-torsion-has-density-zero), [p-Selmer parity](#support-p-parity), SelmerIwasawaCohomology §§2.10–2.12a, [count of curves in a large family](#count-of-curves-in-a-large-family), [average over a height ordered family](#average-over-a-height-ordered-family).

([[30]](#ref-30), Theorem 41 and proof, pp. 21–22.)

**Checks.**

- The finite-height minimal costs are 1 at dimension zero, 9 at nonzero even dimension and 3 at odd dimension; these yield the exact 1/4 bound.

- A nonzero even dimension costs at least nine, whereas an odd dimension costs at least three.
- Finite p-parity uses the elliptic reduced-primary pairing, so the rational torsion correction is retained before removing the negligible subset.

<a id="refinement-balanced-three-rank-one"></a>

**Balanced three rank one.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Under the preceding large-family/root-balance hypotheses, if Sha(E) is finite for every E∈F, the lower density of Mordell–Weil rank 1 is at least 5/12. A one-dimensional 3-Selmer group has rank 1 because the finite alternating Cassels–Tate pairing forces dim Sha[3] even. The Sha-finiteness hypothesis is retained.

Odd 3-Selmer ranks are 1 or at least 3, hence cardinalities 3 or at least 27. The balanced mean bound forces at least 5/6 of the odd half to have Selmer dimension 1. Use the exact Kummer sequence and alternating finite Sha pairing to identify Mordell–Weil rank 1.

*Needs:* SelmerIwasawaCohomology §4.29 (Cassels–Tate and reduced-primary pairings), [balanced three rank zero](#refinement-balanced-three-rank-zero), SelmerIwasawaCohomology §2.12a, SelmerIwasawaCohomology §§2.10–2.12a.

([[30]](#ref-30), Theorem 41 and proof, pp. 21–22.)

**Checks.**

- Odd dimensions one and at least three cost 3 and at least 27; the resulting 5/12 conclusion must retain finite Sha.

- A divisible Sha summand can supply a Selmer line without a Mordell–Weil point; finite Sha is retained.
- The one-dimensional Selmer classes have rational torsion removed on a density-one subset.

<a id="refinement-positive-three-ranks"></a>

**Positive three ranks.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Among all minimal elliptic curves over Q ordered by invariant height, a positive lower proportion has rank 0. If all elliptic curves in the source family have finite Sha, a positive lower proportion has rank 1. Produce a positive-density finite union of large families invariant under the height-preserving −1 twist with opposite root signs; root-number balance of the full elliptic family is not assumed.

Use additive dyadic reduction with unit j, the source odd-prime discriminant squarefreeness restrictions and the mod 4 odd discriminant condition. Verify invariance under E↦E^(−1), opposite root signs and positive local density. Apply the two balanced-family inequalities and multiply by the family density.

*Needs:* [balanced three rank zero](#refinement-balanced-three-rank-zero), [balanced three rank one](#refinement-balanced-three-rank-one), [density denominator comparisons](../ArithmeticStatisticsPartI/README.md#density-denominator-comparisons), [count of curves in a large family](#count-of-curves-in-a-large-family), [relative density](../ArithmeticStatisticsPartI/README.md#relative-density), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions).

([[30]](#ref-30), Theorem 4, p. 1; Theorem 5, p. 2; Section 4.1, pp. 21–22.)

**Checks.**

- The −1 twist preserves H and acts on the constructed subfamily. The proof must establish opposite root signs there without assuming full-family root balance.

- The root-balance construction uses a finite union with its actual denominator weights.
- The rank-one clause retains finite Sha, in addition to the supplied modular data for p-parity.

<a id="refinement-analytic-rank-zero-criterion"></a>

**Analytic rank zero criterion.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Let E/Q have trivial 3-Selmer group, good ordinary reduction at 3, irreducible residual action on E[3], and a prime ℓ≠3 with ℓ∥`N_E` at which the residual representation is ramified. Then L(E,1)≠0. Prove this special Skinner–Urban input here, from [ordinary main-conjecture divisibility](#ordinary-main-conjecture-divisibility) and the supplied control algebra.

Import the residual representation, ordinary local condition and elliptic L-function carriers. The specialized main-conjecture implication converts vanishing 3-Selmer to nonvanishing of L(E,1). Do not substitute the different rank-one criterion of [rank one selmer criterion](#refinement-rank-one-selmer-criterion).

*Needs:* [ordinary main-conjecture divisibility](#ordinary-main-conjecture-divisibility), [modular comparison data and the specialized analytic inputs](#support-analytic-rank), AbelianSchemesAndArithmeticModuli:A3, SelmerIwasawaCohomology Layer 3, SelmerIwasawaCohomology §§2.8–2.9, 4.26.

([[30]](#ref-30), Theorem 43, pp. 22–23 (source attribution to Skinner–Urban).)

**Checks.**

- All four source conditions must be present, including ramification at the multiplicative prime distinct from three.

- Residual irreducibility is weaker than residual surjectivity; Theorem 2(b) needs only the former.
- A zero finite three-Selmer group forces corank zero, which contradicts central-value vanishing under ordinary divisibility.

<a id="refinement-positive-analytic-rank-zero"></a>

**Positive analytic rank zero.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. A positive lower proportion of all height-ordered minimal elliptic curves over Q has both algebraic and analytic rank 0. More precisely, in a positive-density large family with good ordinary 3, 5∥`Δ_E` and balanced root signs, at least 1/4 have analytic rank 0, after deleting the density-zero reducible residual 3-action subset.

Intersect the root-balanced rank-zero construction with good ordinary 3 and 5∥Δ. Use quantitative generic residual irreducibility and the multiplicative-reduction inertia calculation at 5. The trivial 3-Selmer subset satisfies every hypothesis of the special analytic criterion.

*Needs:* [balanced three rank zero](#refinement-balanced-three-rank-zero), [analytic rank zero criterion](#refinement-analytic-rank-zero-criterion), [positive three ranks](#refinement-positive-three-ranks).

([[30]](#ref-30), Theorem 6, p. 2; Theorem 44 and proof, p. 23.)

**Checks.**

- The family has good ordinary reduction at three and exactly valuation one at five for its discriminant; the residual ramification at five must be checked for every member.

- The density-zero reducible residual-action subset is removed relative to a positive-density family.
- The analytic L-value is the one fixed by the family modular comparison data.

<a id="refinement-positive-weak-bsd"></a>

**Positive weak bsd.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. A positive lower proportion of the height-ordered full elliptic family satisfies rank E(Q)=ord_(s=1)L(E,s)=0. This is the rank assertion of BSD, with no leading-coefficient or regulator formula asserted.

Use the common algebraic-and-analytic-rank-zero subset in the preceding theorem. Identify analytic rank 0 with the nonzero central value.

*Needs:* [positive analytic rank zero](#refinement-positive-analytic-rank-zero).

([[30]](#ref-30), Corollary 7, p. 2; final deduction, p. 23.)

**Checks.**

- The conclusion stops at algebraic and analytic rank zero; no formula for the central-value leading coefficient is obtained.

- Analytic rank zero means the continued central value is nonzero.
- The positive denominator is the full minimal-short-pair count, not the soluble-orbit count.

### 4.26 Two-Selmer elements that do not lift

<a id="refinement-two-selmer-nonlift"></a>

**Two selmer nonlift.** In the full minimal elliptic family over Q ordered by invariant height, `liminf_X` average(#Sel₂(E)−#im([2]:Sel₄(E)→Sel₂(E)))≥3/5. Since the limiting mean#Sel₂ is 3, at least 1/5 of all 2-Selmer elements in aggregate fail to lift. This is not a1/5 lower proportion of curves.

Discard rational 2-torsion using a weighted tail controlled by the second-moment upper bound. For the torsion-free generic case write Sel₄≅(Z/4)^a×(Z/2)^b and Sel₂≅(Z/2)^(a+b); the liftable subgroup has size 2^a. Mean#Sel₄=7 and mean#Sel₂=3 give mean exact-order 4 count 4. The inequality 5·2^a−8≤4^a−2^a bounds mean liftable count by 12/5. Subtract and divide finite aggregate counts, then take the appropriate limits.

*Needs:* [average size of the 4 selmer group](#average-size-of-the-4-selmer-group), [second moment of the 2 selmer group](#second-moment-of-the-2-selmer-group), [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three), SelmerIwasawaCohomology §2.12a.

([[31]](#ref-31), Theorem 3, p. 1; final deduction, pp. 21–22.)

**Checks.**

- The pointwise bound 5·2^a−8≤4^a−2^a holds already at a=0 and a=1. The 1/5 bound has Selmer-element, rather than curve, denominator.

### 4.27 Five-Selmer rank bounds

<a id="refinement-five-basic-bounds"></a>

**Five basic bounds.** In every large family F with positive local masses and nonempty real sign region of minimal elliptic curves over Q ordered by invariant height, limsup average(`dim_F5` Sel₅)≤21/20 and lower density(dim Sel₅≤1)≥19/24. These hold from mean#Sel₅=6, after controlling rational 5-torsion; Mordell–Weil rank is bounded by the reduced Selmer dimension.

The Lean target `fiveSelmer_basic_rank_bounds` states the Mordell–Weil consequences for every `IsLargeFamily` or `IsFiniteCongruenceFamily`, using `shortPairAverage` for the rank and the rank-at-most-one indicator. Its eventual bounds for every ε>0 express upper average rank at most 21/20 and lower proportion at least 19/24.

Use 20r−15≤5^r for every integer r≥0. Use the cost 5^r≥25 on r≥2 and≥1 elsewhere. Apply the mean bound to finite-height inequalities; take limsup or liminf only after the pointwise comparison.

*Needs:* [average size of the 5 selmer group](#average-size-of-the-5-selmer-group), [rational p torsion has density zero](#rational-p-torsion-has-density-zero), [average over a height ordered family](#average-over-a-height-ordered-family).

([[32]](#ref-32), Proposition 38, p. 28.)

**Checks.**

- At dimensions zero and one the rank-cost inequality 20r−15≤5^r holds, and every dimension at least two costs at least 25.

- At dimension two the cost is 25, yielding the bound 19/24 for dimensions at most one.
- Positive local masses are required to normalize the family numerator.

<a id="refinement-five-balanced-bounds"></a>

**Five balanced bounds.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. If the positive-local-mass large family F also has limiting root signs 1/2 each, limsup average(dim Sel₅)≤3/4, lower density(dim Sel₅≤1)≥7/8, and lower density(dim Sel₅=0)≥3/8. Apply the [p-Selmer parity theorem](#support-p-parity) at p = 5 after removing the negligible torsion subset. All estimates use finite-height inequalities so independent limsups are not added.

Use 12r+1≤5^r on even r and 60r−55≤5^r on odd r. At each fixed height, combine the even and odd sums with the one total mean and the lower bound on the odd sum. For low-rank densities use the finite even/odd counts and costs 1, 25 and 5, 125. Root balance then gives the stated constants.

*Needs:* SelmerIwasawaCohomology §4.29 (Cassels–Tate and reduced-primary pairings), [five basic bounds](#refinement-five-basic-bounds), [p-Selmer parity](#support-p-parity), SelmerIwasawaCohomology §§2.10–2.12a.

([[32]](#ref-32), Proposition 40 and proof, p. 29, with corrected limiting argument.)

**Checks.**

- Prove the inequality using the total finite-height sum, not separately attained conditional limsups; retain the rounded constants 3/4,7/8,3/8.

- Even dimensions at least two cost 25 and odd dimensions at least three cost 125.
- The denominator weights of the two signs tend to one half; their separate moment limits are not assumed.

<a id="refinement-five-root-balanced-family"></a>

**Five root balanced family.** Form the source's finite union F of large congruence families, invariant under E↦E^(−1), with opposite root signs (equations (30)–(32), §5, pp.25–27). Let `d_j` be the normalized real mass of its sign stratum j, and `u_(p,j)` its local mass divided by the all-curve local mass, retaining the dyadic and 3-adic conditions and the infinite good-prime exclusions. Assume numerical lower bounds `b_j≤d_j∏_p u_(p,j)` with `Σ_j b_j>5501/10000`. Then F has height density greater than `5501/10000`, and balanced root signs. These local-mass bounds are explicit hypotheses; the two real signs do not each have mass one half.

Apply the large-family denominator to the disjoint sign strata and add their actual masses. The height-preserving −1 twist pairs opposite root signs. The residue-table values and the bounded-prime product with its remaining-tail bound enter through the numerical hypothesis.

*Needs:* [count of curves in a large family](#count-of-curves-in-a-large-family), [density denominator comparisons](../ArithmeticStatisticsPartI/README.md#density-denominator-comparisons), [elliptic families defined by congruence conditions](../ArithmeticStatisticsPartI/README.md#elliptic-families-defined-by-congruence-conditions), [constant rescaling of a height](../ArithmeticStatisticsPartI/README.md#constant-rescaling-of-a-height).

([[32]](#ref-32), Theorem 6, pp. 4–5; Section 5, Propositions 35–37 and local tables, pp. 23–27.)

**Checks.**

- Changing the real-sign masses to one half need not preserve the numerical hypothesis. The bound uses the actual sum `Σ_j b_j`.

<a id="refinement-five-full-average-rank"></a>

**Five full average rank.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Assume the numerical local-mass bounds of [five root balanced family](#refinement-five-root-balanced-family). In the full height-ordered minimal elliptic family, limsup average rank≤88497/100000<177/200=.885. The mixture uses the root-balanced subfamily with density≥.5501 and its complement; the 5-Selmer average bound on the complement follows by finite-height subtraction from the full and subfamily means.

Use balanced bound 3/4 on F and basic bound 21/20 on its complement. At finite height derive the complement mean from the exact mean 6 on the full and large subfamilies, then apply the rank inequality. Compute .5501·.75+.4499·1.05=.88497 exactly; density larger than.5501 improves the bound.

*Needs:* [five basic bounds](#refinement-five-basic-bounds), [five balanced bounds](#refinement-five-balanced-bounds), [five root balanced family](#refinement-five-root-balanced-family).

([[32]](#ref-32), Theorem 3, p. 2; final deduction, pp. 29–30.)

**Checks.**

- The exact rational mixture is 88497/100000, strictly less than 177/200.

- The root-balanced component carries the same modular comparison data as its complement.
- Finite disjoint mixtures use the actual positive-density denominator weights.

<a id="refinement-five-full-low-rank"></a>

**Five full low rank.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Assume the numerical local-mass bounds of [five root balanced family](#refinement-five-root-balanced-family). In the full height-ordered minimal elliptic family, lower density(rank E≤1)≥67/80=.8375. The stronger rational mixture lower bound is .5501·7/8+.4499·19/24=100501/120000. This is a statement about Mordell–Weil ranks bounded by Selmer dimensions, without a Sha-finiteness hypothesis.

Apply the finite-height low-Selmer-rank bounds in F and its complement. Pass the exact density weights through liminf; larger F density improves the mixture. Use the Kummer rank inequality and retain the stated rounded bound.

*Needs:* [five basic bounds](#refinement-five-basic-bounds), [five balanced bounds](#refinement-five-balanced-bounds), [five root balanced family](#refinement-five-root-balanced-family).

([[32]](#ref-32), Theorem 4, p. 2; final deduction, p. 30.)

**Checks.**

- The exact mixture is 100501/120000≥67/80; lower Selmer rank bounds Mordell–Weil rank without finite Sha.

- The low-rank bound is first an inequality for Selmer dimensions.
- Deleting rational-five-torsion curves preserves the family lower densities.

<a id="refinement-five-full-rank-zero"></a>

**Five full rank zero.** Assume the [modular comparison data](#support-analytic-rank) for every curve and quadratic twist used in this target. Assume the numerical local-mass bounds of [five root balanced family](#refinement-five-root-balanced-family). In the full height-ordered minimal elliptic family, lower density(rank E=0)≥1031/5000=.2062. The unrounded lower bound .5501·3/8=16503/80000 is obtained from the balanced subfamily alone. No proportion of Sha-finite curves is assumed.

Use the balanced-family trivial 5-Selmer proportion 3/8. Multiply by the subfamily density≥.5501. Trivial 5-Selmer forces rank 0; take the full-family lower density.

*Needs:* [five balanced bounds](#refinement-five-balanced-bounds), [five root balanced family](#refinement-five-root-balanced-family).

([[32]](#ref-32), Theorem 5, p. 2; final deduction, p. 30.)

**Checks.**

- The exact unrounded product is 16503/80000≥1031/5000.

- A trivial five-Selmer group forces Mordell–Weil rank zero.
- The full-family conclusion does not assert root balance of the entire elliptic family.

### 4.28 Marked genus-one families and the second moment

<a id="refinement-jacobian-marked-average"></a>

**Jacobian marked average.** Count locally soluble curves z²=f(x,y), with f an irreducible integral binary quartic, up to the source twisted PGL₂(Q) action, ordered by invariant height of Jac(C). The limsup average#Sel₂(Jac C) is at most6. This denominator counts the quartic genus-one objects, not unweighted elliptic Jacobians or arbitrary coefficient vectors; it is a key input to the second-moment bound≤15.

transport nontrivial first Selmer elements to their locally soluble quartic coverings, using the rational-orbit weight and the invariant-height comparison. Apart from the negligible genericity exceptions controlled in the [marked quartic factorial-moment bound](#marked-quartic-factorial-moment-bound), the marked-cover denominator is `Σ_E`(N(E)−1)~2D_F(X), and its Selmer numerator is `Σ_E` N(E)(N(E)−1). The identity N(N−1)=(N−1)(N−2)+2(N−1) bounds that numerator by (8+4)`D_F(X)`+o(`D_F(X)`). Division by the positive marked denominator gives limsup at most 6. The denominator comparison here must retain the stabilizer weights until the exceptional rational stabilizers have been estimated.

*Needs:* [marked quartic factorial-moment bound](#marked-quartic-factorial-moment-bound), [binary quartic parametrization of two selmer](../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-two-selmer), [average size of the 2 selmer group is three](#average-size-of-the-2-selmer-group-is-three), [density denominator comparisons](../ArithmeticStatisticsPartI/README.md#density-denominator-comparisons).

([[33]](#ref-33), Theorem 1.2, p. 2; monicization and proof assembly, Sections 3–7, pp. 13–47.)

**Checks.**

- Two distinct quartic objects with the same Jacobian contribute separately when the orbit denominator distinguishes them; the bound is a limsup at most 6.

### Supporting local-to-global and analytic inputs

<a id="support-cubic-thue"></a>

For every integral binary cubic form `v` of nonzero discriminant, prove that `#{(a,b)∈ℤ² : v(a,b)=1}≤12`. This uniform bound, including reducible forms, is the input to the embedding-fibre estimate in §4.8; Thue finiteness alone gives no uniform constant. Source: [[1]](#ref-1), Proposition 2.16, p.17, and proof of Proposition 3.16, p.32, citing its references [22] and [25].

The p-adic orbit-integral argument requires a polynomial inverse-function/change-of-variables theorem on the nonsingular submersion locus, with the normalized Jacobian absolute value, measurable extension by monotone convergence and nullity of the critical discriminant locus. Prove that pulling back a null invariant-boundary set through this submersion gives a null set in the coefficient representation. A local specification's null boundary does not imply the same property for an arbitrary closed subset. For a positive-mass large family, CRT and the discriminant tail identify its actual local invariant closure and establish the boundary statement used by the weight. With zero local mass prove the numerator's upper estimate directly rather than divide by a vanishing main term. Source: Bhargava–Shankar two-Selmer paper, Propositions 3.7, 3.12 and the proof of Theorem 3.19, §§3.3–3.4, pp. 25–33.

For the hyperelliptic upper average import `tamagawa_SLquotient_two` (Tamagawa number two for `SL_(2g+2)/μ2`, with group-scheme rational points and the specified invariant differential) and the coefficient-family tail `codimensionTwo_congruenceTail` for a *fixed codimension-two coefficient subscheme* containing all large-prime excluded reductions, both from HeightsRationalPointsAndObstructions §3.18b. Reduction-only largeness does not imply this saturation. For the growing-genus order-k theorem, cancel the finite-place Euler factor separately at each fixed genus and condition the real coefficient law on solubility, an event of probability at least 1/2; height tends to infinity first. The number-field parity extension uses `numberFieldCoefficientCount`, `numberFieldCoefficientTail` and `numberFieldTwistHeight`, with prime-ideal admissibility and the fixed codimension-two envelope specified in those targets. Sources: BGW, §§6–7 and the real-divisor and parity arguments of §§9–11. The local actual-Div1 hypothesis is retained in every Picard/index comparison.

<a id="support-analytic-rank"></a>

**Modular comparison data and twists.** For a specified E/Q of conductor N, take as data a normalized rational weight-two newform f of level N, trivial nebentypus, an all-Euler-factor identification with E (including bad primes), and compatible p-adic Galois-representation identifications wherever p is used. Include a specified Q-isogeny from the f-quotient A_f of J₀(N) to E, with its pullback on differentials and its Galois realization compatible with those identifications; equivalently give a modular parametrisation with its f-eigenspace comparison. For each quaternionic curve used, also supply a Q-isogeny from its marked f-Jacobian factor to E, compatible with the differential and Galois markings. Equality of Euler factors alone does not provide these geometric maps. Define L(E,s) using this comparison and the newform’s analytic continuation and functional equation. For the statistics, require such data for every curve and twist in the stated family. Universal elliptic modularity, its classical quotient/parametrisation formulations and its all-Euler-factor L-series comparison belong to EllipticCurveModularity R29.6, `modularity`, `modularity_quotient` and `modularity_parametrisation`. The geometric comparison data, including the isogenies for each quaternionic realization used, are hypotheses here. The target here transports supplied data through quadratic twisting, including conductor, root sign and H(E^(−39))=39⁶H(E) on the minimal family. An identification at almost all Euler factors alone does not fix the local factors in this contract.

*Needs:* TauCetiRoadmap.ModularForms Layer 7 (Mellin transform, continuation and functional equation), TauCetiRoadmap.EllipticCurves Layer 5 (twists), ArithmeticGaloisRepresentations §§1.7–1.9 (the specified Galois comparisons).

(Source: [[112]](#ref-112), §§2–3, pp.3–8; the existence theorem for the input data is BCDT, JAMS 14 (2001), Theorem A, pp.843–939.)

**Checks.**

- The trivial twist gives the same Euler factors and analytic function. A specified isogeny transports the Heegner image and differential; an Euler-factor identification without this map does not define an E-valued point.
- At a prime dividing the twist discriminant the bad Euler factor must also be transported; equality only away from that prime is insufficient.
- The raw −39 twist scales height by 39⁶; equality with isomorphism-class height uses the minimality conclusion in rank one family properties.

<a id="ordinary-main-conjecture-divisibility"></a>

**Ordinary main-conjecture divisibility.** For E/Q equipped with the modular comparison data above, p odd, good ordinary p, irreducible E[p], and a prime q≠p with q∥N and residual ramification, `ordinary_mainConjecture_divisibility` proves that the ordinary cyclotomic dual Selmer module is torsion over Λ=Z_p[[Gal(Q_∞/Q)]] and that its characteristic ideal is contained in the ideal of the ordinary p-adic L-function after inverting p. Import ModularSymbolsPadicLFunctions §§1.1, 1.3 and 2.5 for the saturated-period ordinary p-adic L-function and its interpolation. This target proves the Skinner–Urban characteristic-ideal containment, comparing its periods, Euler factors and local conditions with that supplied construction. The period scalar is invertible after inverting p. In particular L(E,1)=0 forces positive p∞-Selmer corank. No residual-surjectivity assumption is needed for this implication; an integral ideal equality would need stronger hypotheses.

Prove the needed divisibility by the ordinary Eisenstein-congruence argument and specialization, and combine it with the ordinary control diagram. Interpolation and nonzero good-ordinary Euler factors identify vanishing at augmentation with the central-value condition. SelmerIwasawaCohomology supplies the module and control algebra, rather than the divisibility theorem.

*Needs:* ModularSymbolsPadicLFunctions §§1.1, 1.3 and 2.5 (saturated periods, interpolation and ordinary integral measures), SelmerIwasawaCohomology §§2.8–2.12a, 3.8–3.21 and 4.26, [modular comparison data](#support-analytic-rank), ArithmeticGaloisRepresentations §§1.7–1.9.

(Source: Skinner–Urban, [The Iwasawa Main Conjectures for GL₂](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorems 1 and 2(b), pp.2–3, and Theorems 3.6.4, 3.6.11; [[30]](#ref-30), Theorem 43, pp.22–23.)

**Checks.**

- p=3 is included, so this input applies to the trivial-three-Selmer criterion.
- The prime q must differ from p and carry residual ramification; a multiplicative prime alone does not meet the hypotheses.
- Vanishing Sel_p implies zero p∞ corank by Kummer, contradicting the positive-corank conclusion if L(E,1)=0.

<a id="anticyclotomic-main-conjecture-implication"></a>

**Anticyclotomic main-conjecture implication.** Let E/Q have supplied modular comparison data and squarefree conductor N. Fix p≥5 good ordinary with irreducible E[p], and imaginary quadratic K of odd discriminant D prime to N, with 2,p split, root sign w(E/K)=−1, and residual ramification at an odd prime inert in K. Construct the anticyclotomic p-adic L-function L_p^S and relaxed-at-one-p-place dual Selmer module X_∞ used in Skinner §2.7. The target `anticyclotomic_mainConjecture_implication` is the containment `char(X_∞)⊆(L_p^S)` over the unramified coefficient extension with p inverted, and hence `L_p^S(1)=0 ⇒ H¹_𝔭(K,V_pE)≠0`. Here H¹_𝔭 consists of global classes vanishing at every completion except the conjugate p-adic place, exactly as in §§2.3 and 2.7. In particular the one-dimensional Bloch–Kato group with injective restriction at both p-adic places gives L_p^S(1)≠0. Keep the finite set S of omitted Euler factors in both constructions.

Prove the needed Wan divisibility and its anticyclotomic specialization with these local conditions, then the augmentation control sequence. Residual irreducibility over K follows from irreducibility over Q and the ramified odd-prime unipotent. These are local targets here, including the p-adic L-function and divisibility, not consequences of control theory alone.

*Needs:* SelmerIwasawaCohomology §§2.8–2.12a, 3.8–3.21 and 4.26, [modular comparison data](#support-analytic-rank), ArithmeticGaloisRepresentations §§1.7–1.9.

(Source: [[114]](#ref-114), Propositions 2.7.2–2.7.3, Lemma 2.8.1 and §2.9, pp.345–348; the divisibility and its deduction from Wan are stated there with their normalization.)

**Checks.**

- Reversing the ideal containment does not force augmentation vanishing of the characteristic ideal.
- A ramified twist E^D can have nonsquarefree conductor; N here is the conductor of the untwisted E.
- An injective restriction of a Selmer line is essential; dimension one alone does not imply the strict local group vanishes.

<a id="heegner-logarithm-and-low-rank"></a>

**Heegner logarithm and low rank.** For E,f,K,p under the preceding hypotheses and one-dimensional Bloch–Kato Selmer group with injective p-adic restriction, construct the CM divisor on the supplied classical or quaternionic curve, project it to its marked f-Jacobian factor and transport it through the specified isogeny to the E-valued Heegner class P_K. Prove `heegner_logarithm_lowRank`: L_p^S(1) is a nonzero explicit factor times the square of log_𝔭(P_K); the Néron–Tate height of P_K is a nonzero factor times L′(E/K,1). Thus L_p^S(1)≠0 implies algebraic and analytic rank one over K and finite Sha(E/K). The same target supplies the low-analytic-rank implication over Q for any elliptic curve with modular comparison data: analytic rank zero or one implies the same algebraic rank and finite Sha. Use it for auxiliary twists with nonzero central value. The Heegner constructions, logarithm identity, Gross–Zagier formula and Kolyvagin implication in this scope are targets here.

Import ShimuraVarieties §§8.1–8.5 and 8.18–8.19 for the canonical curve tower, proper compactification and Hecke correspondences, GL2AutomorphicRepresentationsAndTransfer §§R17.3.1 and R17.3.10 for indefinite Jacquet–Langlands, and SmallRamificationAndAbelianVarietyBaseCases §5.0c, `weightTwo_quaternionicJacobian` and `shimuraCurve_picard_correspondences`, for the marked modular Jacobian factor. Construct the CM divisor and its Heegner image here. Use its p-adic logarithm formula, then the height formula and the Euler-system descent. Transport points, logarithms, heights and finite-Sha conclusions through the supplied isogenies, retaining the nonzero differential and height factors. Classical X₀(N) covers Skinner’s Case I; Case II uses the quaternion algebra of discriminant N⁻ and its supplied marked factor. Retain the local split/inert and ordinary conditions of the preceding target. The rank-one criterion over Q uses an auxiliary quadratic twist with nonzero central value and prescribed splitting, supplied by the quadratic-twist nonvanishing theorem in Friedberg–Hoffstein, Theorem B, as used in [[112]], proof of Theorem 3, p.7; prove that specialized auxiliary-twist existence here as part of the deduction. For the fixed-D criterion the untwisted Bloch–Kato group instead vanishes by Kummer.

*Needs:* [anticyclotomic main-conjecture implication](#anticyclotomic-main-conjecture-implication), HeightsRationalPointsAndObstructions §§1.7–1.8 (heights and regulators), TauCetiRoadmap.ModularCurves (classical Case I), ShimuraVarieties §§8.1–8.5 and 8.18–8.19, GL2AutomorphicRepresentationsAndTransfer §§R17.3.1 and R17.3.10, SmallRamificationAndAbelianVarietyBaseCases §5.0c (`weightTwo_quaternionicJacobian`, `shimuraCurve_picard_correspondences`), SelmerIwasawaCohomology §§2.10–2.12a and 4.26, [modular comparison data](#support-analytic-rank).

(Source: [[114]](#ref-114), introduction pp.330,333–334, §§2.4–2.6 pp.338–344 and §2.9 pp.348–350; [[112]](#ref-112), proofs of Theorems 3–4, pp.6–8.)

**Checks.**

- Nonzero p-adic logarithm implies P_K is nontorsion; the reverse implication is not used. A Q-isogeny preserves nontorsion and finiteness of Sha, but its differential and height factors must be carried through both formulas.
- If L(E/K,s)=L(E,s)L(E^D,s) has a simple zero and one factor is nonzero at one, the other factor has a simple zero.
- Finite Selmer dimension and Mordell–Weil rank are not identified before the local injectivity and low-rank arithmetic implications are applied.

To use the rank-zero input prove density-zero reducible residual-three action in the positive-density ordinary-three, multiplicative-five family, retaining ramification at five. To use the five-Selmer converse prove five-adic identification of both the actual local Kummer quotient and its rational-torsion image, and equidistribution of *nonidentity Selmer elements* among those labels. A bijection of sets that forgets the torsion subgroup cannot justify the exclusion of bad lines. Source: [[30]](#ref-30), Theorems 43–44, pp. 22–23, and Bhargava–Skinner's local comparison and counting lemmas.

<a id="support-real-roots"></a>

For independent identically distributed real coefficients of mean zero, variance one and finite moments of every order, prove that the probability of each fixed compatible count of real roots, all simple, is `n^(−b+o(1))`, with the positive constant b of Dembo–Poonen–Shao–Zeitouni Theorem 1.2, §1, pp. 2–3. Consequently any fixed finite union of such root counts has probability tending to zero. For the coefficient cube use √3 times independent uniforms on [−1,1]; this common scalar leaves the roots unchanged. The leading coefficient and discriminant are nonzero almost surely for this continuous law, so the simple-root count equals the full root count almost surely. This supplies the real-root input for the fixed-order-k vanishing average. Checks: √3 times the uniform law has variance one; a common nonzero coefficient scaling does not change its roots; incompatible counts have probability zero by conjugate pairing. The assertion concerns fixed counts and does not include a count equal to the endpoint `log n/log log n`.

<a id="anticyclotomic-character-nonvanishing"></a>

**Anticyclotomic character nonvanishing.** Let E/Q carry the modular comparison data, let p be any odd prime, and let M₀ be an imaginary quadratic field in which every bad prime of E splits, with E not having complex multiplication by M₀. Construct the anticyclotomic Z_p-extension M_∞/M₀ and its layers [M_n:M₀]=p^n; fix a complex embedding when taking real subfields. The target `anticyclotomic_character_nonvanishing` constructs CM divisors and their images on the supplied modular realization, and proves that for every sufficiently large n there is a primitive character χ of Gal(M_(n+1)/M₀) whose component of a traced CM point is nontorsion. Work over a characteristic-zero coefficient field containing the values of χ; trivial tame character in the ring-class tower makes χ factor through M_∞. This is the CM-point nonvanishing statement, with no ordinary, good-p, squarefree-conductor or p∤Disc(M₀) restriction.

Construct the tower by class field theory, choose the new quotient and good CM points of Cornut–Vatsal §3.7–§3.8, and apply their Theorem 4.2 with trivial tame character. Trace to M_(n+1) and transport through the supplied quotient/isogeny. Include p dividing N_E, ramified p in M₀, and nonordinary p in this construction. The condition on bad primes makes the prime-to-p conductor coprime to Disc(M₀) and gives the indefinite sign. The CM-point statement supplies the input to character-level Euler-system descent directly.

*Needs:* TauCetiRoadmap.ClassFieldTheory Layers 11–13 (ring class fields and reciprocity), [modular comparison data](#support-analytic-rank), TauCetiRoadmap.ModularCurves (classical curves and correspondences), SmallRamificationAndAbelianVarietyBaseCases §5.0c (marked geometric eigensummands), ShimuraVarieties §§8.1–8.5 and 8.18–8.19, GL2AutomorphicRepresentationsAndTransfer §§R17.3.1 and R17.3.10.

(Source: Cornut–Vatsal, [Nontriviality of Rankin–Selberg L-functions and CM points](https://webusers.imj-prg.fr/~christophe.cornut/papers/part1.pdf), §2.1, §3.7–§3.8 and Theorem 4.2, §4.1, pp.20–21,35–39; Dokchitser–Dokchitser, arXiv:math/0610290v3, proof of Theorem 4.19, pp.26–27, final alternative.)

**Checks.**

- A character of Gal(M_(n+1)/M₀) factoring through M_n is excluded; primitivity gives exact order p^(n+1).
- At p=3 with bad reduction, and at an odd p ramified in M₀ but of good reduction for E, no coprimality or ordinarity hypothesis is added. Theorem 1.5’s derivative formulation alone does not cover these cases.
- E may have complex multiplication by another imaginary quadratic field. That field is absent from a dihedral extension M_(n+1)/Q of odd p-power degree over M₀, whose unique quadratic subfield is M₀.

<a id="anticyclotomic-character-selmer-multiplicity-one"></a>

**Anticyclotomic character Selmer multiplicity one.** Under the preceding E,p,M₀ hypotheses, put F=M_(n+1) and X_p(E/F)=Hom(Sel_(p∞)(E/F),Q_p/Z_p)⊗Q_p. For a primitive χ supplied by the preceding target, `anticyclotomic_character_selmer_multiplicity_one` proves that its component in X_p(E/F), after extending coefficients to contain χ, has dimension one. Prove that the χ-component of the Mordell–Weil group is generated rationally by the CM image and that its Sha component has zero p∞ corank. The hypothesis excluding complex multiplication by a quadratic field contained in the field cut out by χ is retained in applying the character-level Euler-system theorem; it follows here from the unique quadratic subfield and E not having CM by M₀.

Apply Nekovář’s character-level CM Euler-system descent to the nontorsion component, without imposing good ordinary reduction at p. Descend its conjugate components to Q_p. The unique primitive rational representation of Gal(F/Q) has dimension (p−1)p^n and occurs once. Its restriction to Gal(F/(M_n∩R))≅D_(2p) contains the (p−1)-dimensional representation with multiplicity p^n; representations factoring through M_n contribute none. This odd multiplicity is the input used by the dihedral parity formula.

*Needs:* [anticyclotomic character nonvanishing](#anticyclotomic-character-nonvanishing), [modular comparison data](#support-analytic-rank), SelmerIwasawaCohomology §§2.10–2.12a (Selmer/Mordell–Weil/Sha comparison), TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0, SmallRamificationAndAbelianVarietyBaseCases §5.0c.

(Source: Nekovář, [The Euler system method for CM points on Shimura curves](https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem 3.2, in LMS Lecture Note Series 320 (2007), pp.471–547; Dokchitser–Dokchitser, arXiv:math/0610290v3, proof of Theorem 4.19, p.27, including the final alternative.)

**Checks.**

- A nontorsion untwisted point over M₀ gives no primitive χ-component; use the character selected by nonvanishing.
- For p=3, n=1 the primitive rational representation has dimension six, and its restriction to D₆ contains the two-dimensional representation three times, an odd multiplicity.
- Finite χ-primary Sha contributes no rational Selmer dimension. A hypothetical divisible χ-primary Sha line would increase that dimension and is ruled out by the character-level descent, rather than by the untwisted Q-only low-rank theorem.

<a id="support-p-parity"></a>

**Elliptic p-parity.** For an elliptic curve E/Q and a prime p, write `s_p(E)`=dim_(`F_p`) `Sel_p(E)`, `t_p(E)`=dim_(`F_p`) E(Q)[p] and w(E) for the global root number. The target `elliptic_pParity` proves, for E equipped with the modular comparison data above, the p-parity theorem: the p∞-Selmer corank of E/Q is even if and only if w(E)=+1 (Dokchitser–Dokchitser, *On the Birch–Swinnerton-Dyer quotients modulo squares*, Ann. of Math. 172 (2010), 567–596; arXiv:math/0610290v3, Conjecture 1.2 and Theorem 1.4, p. 2, proved as Theorem 4.19, p. 26; for p=2 prove the modular-curve case of Monsky, “Generalizing the Birch–Stephens theorem. I: Modular curves”, Math. Z. 221 (1996), 415–420). Deduce the finite form used above: `s_p(E)`−`t_p(E)` is even if and only if w(E)=+1. For odd p and E(Q)[p]=0 this follows because `Sel_p(E)`=Sel_(p∞)(E)[p] and the finite quotient of Sha by its divisible part has square order under the alternating Cassels–Tate pairing (SelmerIwasawaCohomology §4.29, elliptic alternation and reduced-primary pairing); the general statement is [[30]](#ref-30), Theorem 42, p. 21. Prove this theorem here on the supplied modular realization, using the dihedral Brauer relations, [anticyclotomic character nonvanishing](#anticyclotomic-character-nonvanishing) and [anticyclotomic character Selmer multiplicity one](#anticyclotomic-character-selmer-multiplicity-one) for odd p, and Monsky’s modular-symbol parity argument at p=2. The three- and five-Selmer applications above assume these modular comparison data throughout their families and use it on the density-one subfamilies with E(Q)[p]=0 ([rational p torsion has density zero](#rational-p-torsion-has-density-zero)).

*Needs:* [anticyclotomic character nonvanishing](#anticyclotomic-character-nonvanishing), [anticyclotomic character Selmer multiplicity one](#anticyclotomic-character-selmer-multiplicity-one), [Selmer dual self-duality](#selmer-dual-self-dual), [Selmer isogeny quotient](#selmer-isogeny-quotient), [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank), [Brauer relations and regulator constants](#support-regulator-constants), SelmerIwasawaCohomology §4.29 and [modular comparison data](#support-analytic-rank).

Choose M₀ with all bad primes split and the auxiliary twist of analytic rank at most one, using the specialized quadratic-twist nonvanishing input in [Heegner logarithm and low rank](#heegner-logarithm-and-low-rank). The low-rank theorem settles that twist. The character targets settle parity over M₀ by the odd dihedral multiplicity, including bad and ramified p; the untwisted low-rank theorem alone does not give that multiplicity.

**Checks.**

- With rank zero, trivial Sha and no rational p-torsion, the finite Selmer dimension is zero and the root sign is positive.
- With rational three-torsion and trivial 3∞-Selmer, the finite dimension equals the torsion dimension; omitting that correction changes parity.
- A divisible p-primary Sha summand contributes to corank. Identifying corank parity with Mordell–Weil rank parity requires finite p-primary Sha.

<a id="support-regulator-constants"></a>

Using the induction/restriction functors of TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0, define a Brauer relation `Θ=Σ n_H[H]` by vanishing of its rational permutation representation, and for a self-dual characteristic-zero representation with nondegenerate invariant pairing define `C(Θ,ρ)=∏ det(|H|⁻¹〈,〉|ρ^H)^(n_H)` modulo squares. Prove independence of pairing and basis, multiplicativity under direct sums, and cancellation for the induced cyclic-decomposition terms in the semistable parity argument. The API consists of `regulatorConstant_zero`, `regulatorConstant_directSum`, `regulatorConstant_pairingIndependent` and `regulatorConstant_cyclicCancellation`. Checks: the zero relation gives one; each of the four characters of C2×C2 gives square class two on `{1}−Σ_(|H|=2)[H]+2[G]`; a non-self-dual pair with its dual has square constant. The semistable regulator formula is stated for a self-dual representation. Source: Dokchitser–Dokchitser, *Regulator constants and the parity conjecture*, arXiv:0709.2852, §§2.i–2.ii, Definition 2.13, Lemmas 2.15–2.16, Theorem 2.17 and Corollary 2.18, pp. 11–16; cyclic cancellation §§2.iii–2.iv, pp. 18–22; semistable formula §3.v, pp. 39–40, with the self-duality hypothesis retained.

### Examples

For the two-descent local ratio, an additive `Z_2` open subgroup has index two under multiplication by two, while an additive `Z_p` open subgroup has index one for odd p. Over R the ratio of the two-division quotient to two-torsion is one half in both component types. Hence the extra factors `2·(1/2)` cancel. The remaining product is `2ζ(2)∏_p(1-p^-2)=2`, giving mean nonidentity two-Selmer size two and total mean three.

The average of `#Sel2-#im(Sel4→Sel2)` at least `3/5` is an aggregate element count. Dividing by the mean Sel2 size three gives at least one fifth of elements, not one fifth of curves. For the rank-one family, twisting by -39 multiplies height by `39^6`, so the count scale `X^(5/6)` loses `39^5`; this explains the density lower bound `c_F/(2c_E·39^5)`.

An empty degree-one Selmer torsor has cardinal zero; it is not the trivial group of cardinal one. If the nonzero generic Weierstrass class belongs to Sel2(J) and J(Q)[2]=0, a nonempty rational degree-one torsor forces positive rank. This is the empty-or-infinite dichotomy, without finiteness of all Sha.

The representative restrictions keep S unchanged for an empty set of places and give the empty set when one required local image is empty. Two restrictions `{0,1}` and `{1,2}` on `Fin 3` intersect in `{1}`. The odd-component bound is zero at cutoff k=0; the values at `(m,k)=(3,1),(5,3),(3,9)` are `3,15,4`. Every homogeneous cubic vanishes at the zero vector, which is excluded from the projective-solubility theorem.

### Dependencies

Layers 0–3 (Parts I, II, III and V); elliptic and Jacobian Kummer/Selmer exact sequences; A3 theta groups and dual isogenies; arithmetic global duality D7; Néron semistable reduction and component groups; SchemeAndStackFoundations §§3.6–3.7 and HeightsRationalPointsAndObstructions §3.18 divisor obstruction; AdelicAlgebraicGroups gauge-form measures; HeightsRationalPointsAndObstructions §§3.18–3.18c for the locally soluble hyperelliptic orbit count, its local masses, τ(`SL_n`/μ₂)=2 and the biquadratic two-Selmer parity; the p-Selmer parity theorem and the analytic rank inputs just stated; and the real/p-adic representation-specific Jacobians. All divisions by family counts use the explicitly positive local and real masses.

## Downstream consumers

The later arithmetic-statistics parts use the exact targets supplied here. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. AnalyticNumberTheoryPartII §§5.4–5.7 supplies the cubic interfaces and takes no input from this part.

## References

<a id="ref-1"></a>

[1] Manjul Bhargava and Arul Shankar. [Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves](https://arxiv.org/abs/1006.1002v3). arXiv:1006.1002v3 (latest version), dated 24 December 2013, 36 pp.; published in Annals of Mathematics 181 (2015), 191–242.

<a id="ref-28"></a>

[28] Bjorn Poonen, Eric Rains. [Random maximal isotropic subspaces and Selmer groups](https://arxiv.org/pdf/1009.0287v2). arXiv:1009.0287v2 (12 April 2011); published J. Amer. Math. Soc. 25 (2012), 245–269.

<a id="ref-29"></a>

[29] Manjul Bhargava, Daniel M. Kane, Hendrik W. Lenstra Jr., Bjorn Poonen, Eric Rains. [Modeling the distribution of ranks, Selmer groups, and Shafarevich–Tate groups of elliptic curves](https://arxiv.org/pdf/1304.3971v2). arXiv:1304.3971v2 (6 August 2013); published Cambridge J. Math. 3 (2015), 275–321.

<a id="ref-30"></a>

[30] Manjul Bhargava, Arul Shankar. [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2). arXiv:1007.0052v2 (24 December 2013); published Annals of Math. 181 (2015), 587–621.

<a id="ref-31"></a>

[31] Manjul Bhargava, Arul Shankar. [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1). arXiv:1312.7333v1 (27 December 2013).

<a id="ref-32"></a>

[32] Manjul Bhargava, Arul Shankar. [The average size of the 5-Selmer group of elliptic curves is 6, and the average rank is less than 1](https://arxiv.org/pdf/1312.7859v1). arXiv:1312.7859v1 (30 December 2013).

<a id="ref-33"></a>

[33] Manjul Bhargava, Arul Shankar, Ashvin A. Swaminathan. [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1). arXiv:2110.09063v1 (18 October 2021).

<a id="ref-110"></a>

[110] Manjul Bhargava, Benedict Gross, Xiaoheng Wang; appendix by Tim and Vladimir Dokchitser. [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2, 42 pages.

<a id="ref-112"></a>

[112] Manjul Bhargava, Christopher Skinner. [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233). arXiv:1401.0233v1, 19 pages.

<a id="ref-113"></a>

[113] Manjul Bhargava. [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131). arXiv:1402.1131v1.

<a id="ref-114"></a>

[114] Christopher Skinner. [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf). Annals of Mathematics 191 (2020), 329–354.
