# Roadmap: arithmetic statistics, Part V: fields and class-group statistics

**Summary.** Deduce discriminant-ordered field counts, class-group averages and rank moments from the orbit and sieve theorems. Separate isomorphism classes, embedded fields and rigid fields, and retain the full-dimensional regular-region, generator-multiplicity and ramification comparisons in polynomial-to-field transfers.

## Scope and ownership

This is Part V of the eight-part arithmetic-statistics roadmap. It owns the Layer 3 field and class-group applications. ArithmeticStatisticsPartI–PartIV supply families, orbit dictionaries, coefficient counts and finite statistical tools at the linked targets below. Parts VI–VIII consume these results.

The following boundaries fix the carriers and prevent parallel versions of existing mathematics.

- Tau Ceti's `TauCeti.NumberField.IntegralPrimitiveElement.index_eq_one_of_squarefree_discr` in `NumberTheory.NumberField.Index.Discriminant` gives index one from squarefree minimal-polynomial discriminant. `TauCeti.GlobalNumberFields.NumberFieldOrder.eq_maximal_of_squarefree_discr` in `NumberTheory.NumberField.Global.Orders.Discriminant` gives maximality for an arbitrary number-field order. The polynomial and binary-form transfers consume these results after identifying their order discriminants; maximality is not a new theorem here. The field property `TauCeti.NumberField.IsMonogenic` and its index characterization are already in `NumberTheory.NumberField.Monogenic`; this part counts that existing property.
- [AnalyticNumberTheoryPartII §5.7](../AnalyticNumberTheoryPartII/README.md#s5-7) owns the pointwise and cumulative degree-two-or-three field bounds, including the bounded conversion between embedded and isomorphism-class counts. The new quadratic-only estimate below has the sharper cumulative bound `h₂(F)D_F^εX`.
- `TauCetiRoadmap.PolynomialGaloisGroups` Layers 0, 2 and 6 own permutation actions on roots, conjugacy of their images, and the transitive-group predicates. The field-counting predicate here specializes that interface to embeddings of an extension; it does not define another permutation Galois group.
- NumberFieldArithmetic Layer 4 supplies discriminants; GlobalNumberFields Layers 3 and 11 supply lattice/coset counts, orders and Picard groups. GeometryOfNumbersAndQuadraticArithmetic §4.1 supplies the bounded semialgebraic count. The field applications retain the skew-region and cusp errors from those suppliers. `TauCetiRoadmap.IntegralLattices` §2G supplies Minkowski reduction and bounded Gram entries for integral symmetric lattices. The polynomial-order Gram target here uses a real embedding metric, with one embedding per complex pair, which need not be integral; only that metric adapter and its restricted change-of-basis groups are new.
- `TauCetiRoadmap.NumberFieldArithmetic` Layers 1, 4 and 6 and `TauCetiRoadmap.LocalFieldsRamification` Layer 3 supply splitting, relative discriminants, towers and local ramification. `TauCetiRoadmap.ClassFieldTheory` supplies Artin reciprocity, unramified class fields and conductor characters. Generic norm and ideal-extension maps are reused; the added narrow-class-group and base-character filters keep total positivity and the relative statistical numerator explicit.
- Scalar finite-measure moment determinacy with an exponential moment is already `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` in `TauCeti.Probability.Moments.Determinacy`, together with `TauCeti.Measure.ext_of_mgf`. Here surjection moments on finite group classes and exponential rank-grid moments have different growth assumptions and need the discrete separator and tightness arguments below.
- InverseGaloisAndArithmeticFundamentalGroups IG.3.4 owns `ReducedSchur.reducedMultiplier` and `ReducedSchur.ReducedCover`; IG.4.6 owns the global arithmetic lifting invariant. InductionRestrictionPartII RS.1 supplies the power laws and reduced-cover homology image, RS.3 the restricted kernel action, and RS.6 the centralizer-quotient and parity comparisons. This part adds embedded quadratic-wreath types, infinity rigidifications and their statistical normalization.
- GenericDoublePointInterpolation §4.8 owns the double-point (Alexander–Hirschowitz) rank theorem in every degree and §1.4 its homogeneous-partial form. The mixed-trace target here consumes it with projective dimension `r−1` and does not restate it; the mixed-trace Jacobian, minor selection, arithmetic exclusion of the exceptions and the finite-fibre bound are owned here.

AnalyticNumberTheoryPartI §§0–3 and AnalyticNumberTheoryPartII §5 supply the analytic inputs. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 1.2–1.5 and 4.1, AdelicAlgebraicGroups AA.0–AA.4, DiophantineApproximationAndTranscendence §2.4, InductionRestrictionPartII RS.1–RS.6 and InverseGaloisAndArithmeticFundamentalGroups IG.2–IG.4 supply the geometric, group-theoretic and arithmetic inputs specified below.

## Conventions

Statistical groups are finite unless profinite groups are specified. Arithmetic fields have characteristic zero; asymptotics are for the stated fixed family as `X` tends to infinity unless another limit is specified. All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in `x`-degree, and changes of variables use row vectors. Cubics use the determinant-twisted `GL₂` action; quartics use either the ordinary `GL₂` action for integral orbit enumeration or the determinant-to-the-minus-two action of `PGL₂` for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=-12`, `J=0`, `Δ=-256`; this fixes the sign. With `E:y²=x³+Ax+B`, `(I,J)=(-3A,-27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The `p`-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Every arithmetic conjecture is a proposition, not an axiom or an unconditional distribution theorem. Distribution convergence does not imply convergence of unbounded moments. Fixed-`q` degree limits, fixed-degree large-`q` limits and iterated `liminf/limsup` limits are kept distinct.

## Exact supplier contracts

From Mathlib use `Northcott`, `Northcott.comp_of_finite_fibers`, finite sets and quotient/orbit types; `Polynomial.discr`, resultants, separability and `Squarefree`; `ClassGroup`, `NumberField.discr` and `NumberField.dedekindZeta_residue`; `p`-adic fields and integers; Haar measures, real and extended nonnegative integrals, filters, infinite sums and products; `QuadraticForm`, bilinear forms, matrices, ranks, finite-dimensional subspaces, finite abelian-group structure and Smith normal form. The prime-counting estimate is `Chebyshev.eventually_primeCounting_le` in `Mathlib.NumberTheory.Chebyshev`: for every `ε>0` and eventually `x`, `π(⌊x⌋)≤(log 4+ε)x/log x`. The new weighted prime-tail statements use partial summation from that estimate.

From Tau Ceti use `TauCeti.normLE`, `TauCeti.coe_normLE` and `TauCeti.summatory` to compare natural-valued heights with Northcott counts. The scalar-determinacy import is specified in Scope and ownership; it does not assert a rank-grid or group-valued moment theorem.

The alternating-extension transfer consumes `TauCeti.NumberField.discr_emod_four_eq_zero_or_one` from `TauCeti.NumberTheory.NumberField.Discriminant.Stickelberger` and `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one` from `TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers`. The latter requires a generator of minimal polynomial `X²−d`, generation over `ℚ`, squarefree `d` and `d≡1` modulo four. Mathlib's `NumberField.abs_discr_gt_two` rules out a nontrivial number field of absolute discriminant one. These are existing arithmetic inputs, not new targets.

From `TauCetiRoadmap.ClassFieldTheory` Layer 13 require the unramified reciprocity quotient, including split real places for ordinary classes and allowed real ramification for narrow classes, the conductor–discriminant formula, and equivariance under field automorphisms. From NumberFieldArithmetic Layers 4 and 6 require norm/extension compatibility and discriminant transitivity. From GlobalNumberFields Layers 3 and 11 require the finite order-class and overorder interfaces, trace duals, ideal norms, and discriminant/index-square identities.

From GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 require primitive-vector saturation, integral minor/gcd and covolume comparisons; §§1.2–1.5 supply successive-minimum bounds; §4.1 supplies the Davenport estimate for a bounded semialgebraic region with bounded complexity, including translates, projections and multiplicity. From AdelicAlgebraicGroups:AA.0–AA.4 require Haar integration on the specified adelic group, arithmetic reduction and fundamental sets, and central-isogeny measure comparison. The targets below supply the representation-specific Jacobians, cusps and Tamagawa values.

The finite-dimensional singular system is already owned by [TauCetiRoadmap.OperatorTheory, PolarDecomposition Part C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md): PD-C09–PD-C18 supply right and left singular vectors and reconstruction. Its real invertible two-dimensional specialization gives `g=k diag(u,u⁻¹)l, u≥1`, for `|det g|=1`, with `k,l` orthogonal. This is the supplier used in compact binary transporters. Mathlib's `LinearMap.IsSymmetric.eigenvectorBasis` in `Analysis.InnerProductSpace.Spectrum` already supplies the underlying spectral theorem; no general singular-decomposition theory is planned here.

From InverseGaloisAndArithmeticFundamentalGroups IG.3.4–IG.3.5 use `ReducedSchur.reducedMultiplier`, `ReducedSchur.ReducedCover` and the cyclotomic unit action, with the chosen central cover and marking; IG.4.6 supplies the `Hom`-valued global arithmetic invariant. [InductionRestrictionPartII RS.1](../InductionRestrictionPartII/README.md#layer-rs1-power-laws-local-normalization-and-the-reduced-cover-homology-image) supplies power laws and the reduced-cover homology image; RS.3 supplies the restricted kernel action; RS.6.4–RS.6.5 supply `centralizer_generator_quotient` and `finite_parity_comparison`; RS.6.6 supplies the marked `order96Type`. The mixed-trace application additionally needs the finite-fibre contract stated at its target; an arithmetic Hilbert-irreducibility label alone does not supply it.

From TauCetiRoadmap.GenericDoublePointInterpolation §4.8 use the double-point theorem in every degree: over an algebraically closed field of characteristic zero, for projective dimension `r≥1` and `d,q≥0`, a nonempty open set of distinct `q`-tuples in `P^r` has degree-`d` first-jet rank `min(binomial(r+d,d),q(r+1))`, except for quadrics with `2≤q≤r` and `(r,d,q)=(2,4,5),(3,4,9),(4,3,7),(4,4,14)`. Its §1.4 homogeneous-partial adapter transfers this rank to the matrix of homogeneous partial derivatives for `d≥1`. The mixed-trace target (§3.28) applies both with projective dimension `r−1`; the Jacobian, minor selection, exclusion of the exceptions and the finite-fibre bound are built here.

From AnalyticNumberTheoryPartII require the [AnalyticNumberTheoryPartII: binary-cubic action and discriminant](../AnalyticNumberTheoryPartII/README.md#s5-4) (§5.4), [AnalyticNumberTheoryPartII: projective cubic-algebra equivalence](../AnalyticNumberTheoryPartII/README.md#s5-5) (§5.5), [AnalyticNumberTheoryPartII: finite weighted cubic coefficients](../AnalyticNumberTheoryPartII/README.md#s5-6) (§5.6), [AnalyticNumberTheoryPartII: uniform small-degree field bound](../AnalyticNumberTheoryPartII/README.md#s5-7) (§5.7), [AnalyticNumberTheoryPartII: cubic continuation and residues](../AnalyticNumberTheoryPartII/README.md#s5-21) (§5.21), [AnalyticNumberTheoryPartII: pole-aware cubic convexity](../AnalyticNumberTheoryPartII/README.md#s5-28) (§5.28), and [AnalyticNumberTheoryPartII: quadratic large sieve and real-character moment](../AnalyticNumberTheoryPartII/README.md#s5-29) (§5.29). The projective equivalence includes nonprincipal rank-two modules, stabilizers and determinant-line discriminants; restricting to the free coefficient lattice does not discard those general inputs. The cubic descriptions below are import and compatibility contracts for those objects, with the displayed basis/sign adapters, rather than a second construction of them. The source-specific local selectors, sieve estimates and statistical applications remain the targets here. AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32 supply Dedekind continuation, degree-uniform Hecke convexity and bounded-degree Brauer–Siegel. Completed ArithmeticDirichletSeries Layers 3, 6 and 9 supply convergent Euler products, Abel/Perron summation and Wiener–Ikehara with their convergence and coefficient hypotheses. DiophantineApproximationAndTranscendence §2.4 supplies the finite-`rank` unit-equation bound for the invariant-order fibre theorem; the order/cross-ratio application is new here.

### From earlier arithmetic-statistics parts

From ArithmeticStatisticsPartI require [ArithmeticStatisticsPartI: binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [ArithmeticStatisticsPartI: acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function), [ArithmeticStatisticsPartI: cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [ArithmeticStatisticsPartI: support squareclasses](../ArithmeticStatisticsPartI/README.md#support-squareclasses), [ArithmeticStatisticsPartI: number fields ordered by discriminant](../ArithmeticStatisticsPartI/README.md#number-fields-ordered-by-discriminant), [ArithmeticStatisticsPartI: refinement binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), [ArithmeticStatisticsPartI: family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions), [ArithmeticStatisticsPartI: relative density](../ArithmeticStatisticsPartI/README.md#relative-density). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartII require [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [ArithmeticStatisticsPartII: davenport heilbronn sets](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-sets), [ArithmeticStatisticsPartII: davenport heilbronn maximality criterion](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-maximality-criterion), [ArithmeticStatisticsPartII: reducible forms and zero divisors](../ArithmeticStatisticsPartII/README.md#reducible-forms-and-zero-divisors), [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), [ArithmeticStatisticsPartII: existence and number of cubic resolvents](../ArithmeticStatisticsPartII/README.md#existence-and-number-of-cubic-resolvents), [ArithmeticStatisticsPartII: maximality of quartic rings at p](../ArithmeticStatisticsPartII/README.md#maximality-of-quartic-rings-at-p), [ArithmeticStatisticsPartII: bhargava parametrization of quintic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quintic-rings), [ArithmeticStatisticsPartII: maximality of quintic rings at p](../ArithmeticStatisticsPartII/README.md#maximality-of-quintic-rings-at-p). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartIII require [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [ArithmeticStatisticsPartIII: real orbits and stabilizers of binary cubic forms](../ArithmeticStatisticsPartIII/README.md#real-orbits-and-stabilizers-of-binary-cubic-forms), [ArithmeticStatisticsPartIII: davenport count of binary cubic forms](../ArithmeticStatisticsPartIII/README.md#davenport-count-of-binary-cubic-forms), [ArithmeticStatisticsPartIII: uniformity estimate for binary cubic discriminants](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-binary-cubic-discriminants), [ArithmeticStatisticsPartIII: refinement cubic secondary congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count), [ArithmeticStatisticsPartIII: refinement cubic secondary sieve error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error), [ArithmeticStatisticsPartIII: refinement quartic finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-finite-congruence-count), [ArithmeticStatisticsPartIII: refinement quartic nonmaximal overramified tail](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-nonmaximal-overramified-tail), [ArithmeticStatisticsPartIII: refinement quintic finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-quintic-finite-congruence-count), [ArithmeticStatisticsPartIII: refinement quintic nonmaximal tail](../ArithmeticStatisticsPartIII/README.md#refinement-quintic-nonmaximal-tail), [ArithmeticStatisticsPartIII: refinement quartic fixed reducible resolvent](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-fixed-reducible-resolvent), [ArithmeticStatisticsPartIII: refinement global field large prime tail](../ArithmeticStatisticsPartIII/README.md#refinement-global-field-large-prime-tail), [ArithmeticStatisticsPartIII: refinement global field generic finite count](../ArithmeticStatisticsPartIII/README.md#refinement-global-field-generic-finite-count), [ArithmeticStatisticsPartIII: support sieves](../ArithmeticStatisticsPartIII/README.md#support-sieves), [ArithmeticStatisticsPartIII: refinement monic fixed modulus sieve](../ArithmeticStatisticsPartIII/README.md#refinement-monic-fixed-modulus-sieve), [ArithmeticStatisticsPartIII: refinement monic summed tail](../ArithmeticStatisticsPartIII/README.md#refinement-monic-summed-tail), [ArithmeticStatisticsPartIII: refinement monic weak tail](../ArithmeticStatisticsPartIII/README.md#refinement-monic-weak-tail), [ArithmeticStatisticsPartIII: refinement binary fixed modulus sieve](../ArithmeticStatisticsPartIII/README.md#refinement-binary-fixed-modulus-sieve), [ArithmeticStatisticsPartIII: refinement binary summed tail](../ArithmeticStatisticsPartIII/README.md#refinement-binary-summed-tail). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartIV require [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [ArithmeticStatisticsPartIV: prime power class group rank](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank), [ArithmeticStatisticsPartIV: fk linking phase](../ArithmeticStatisticsPartIV/README.md#fk-linking-phase), [ArithmeticStatisticsPartIV: fk good subspace bijection](../ArithmeticStatisticsPartIV/README.md#fk-good-subspace-bijection), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient), [ArithmeticStatisticsPartIV: symmetric matrix kernel law](../ArithmeticStatisticsPartIV/README.md#symmetric-matrix-kernel-law), [ArithmeticStatisticsPartIV: matrix kernel law over a finite field](../ArithmeticStatisticsPartIV/README.md#matrix-kernel-law-over-a-finite-field). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

## How to read the build

This README specifies every target with hypotheses, source locator, API and Checks. `Suggested.lean` states headline theorems on the pinned carriers. The mathematical interfaces specified below belong to the full development; only the explicitly identified headline statements and their supporting definitions are declarations of that file. Source counts retain their strict or inclusive cutoffs and denominators. The field-count signatures use finite-support sums on Mathlib's carrier `{K : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F K}`. Hermite finiteness makes their discriminant sublevels finite. Weight `#Aut(K/F)/n` on embedded degree-`n` fields gives one per isomorphism class; weight `1/n` gives `1/#Aut(K/F)` per class. Quadratic fields each have a single embedded representative. Normal-closure degree `n!` is equivalent to full `S_n` on the `n` embeddings. These are expressions on the supplier carriers, with the counting interface owned by Part IV.

The thematic section numbers are stable locators. The supporting targets occur before their consumers in the following build order.

| Supporting targets, in order | First consumers |
| --- | --- |
| PartIII secondary congruence and strongly acceptable sieve contracts | Roberts and three-torsion secondary specializations (§3.5) |
| `quadraticCharacter_intervalBound` | Quadratic all-order L-value mean and Siegel count (§3.6); prime-factor patterns (§3.31) |
| Rigid fields → relative torsion splitting | Relative character fibres and tower torsion |
| S-integral parametrization → imported global tail → Jacobian masses → quartic character fibre → class-group mass ratios | Number-field counts and cubic two-torsion means (§3.7) |
| Conic formula → six-family Jacobi expansion → maximal unlinked support → main coefficient → narrow/ordinary comparison; independent rank-moment uniqueness | Arithmetic four-rank moments and rank laws (§3.8) |
| `abelianDiscriminantSeries` | First cyclotomic counterexample (§3.9); cyclic-prime and Galois counts (§3.29) |
| Relative small-split-prime bound → uniform quadratic/order bounds → torsion propagation → five-range bound → tower tail | Thin two-groups and wreath means (§§3.25–3.26) |
| Integer-lattice largest minimum → small square-ideal generators → square-norm count → general two-torsion saving; elliptic point/rank bounds → cubic two-torsion bound | General wreath means, mixed-trace count (§3.28) and quartic torsion applications (§3.29) |
| Principality transfer → sixteen-rank spin criterion; `jointSpin_primeBound` from Type I → Type II → prime extraction | Conditional absence of a sixteen-rank governing field (§3.30) |

## Layer 3: Fields and class-group statistics

Integral orbit counts become field and class-group statistics only after maximality, resolvent multiplicity, real-place conditions and base-field characters are matched. Secondary terms need a second local density and a stronger sieve, not an application of the first-order density theorem. The finite-group moment tools are built before their use in quadratic four-`rank` laws; their probability conclusions are distinct from the arithmetic moment hypotheses.

### 3.2 Cubic splitting densities and field counts

<a id="splitting-symbol-and-local-sets-of-binary-cubic-forms"></a>

**Splitting symbol and local sets of binary cubic forms.** Let `V_Z` be the space of integral binary cubic forms `f(x, y) = a x³ + b x² y + c x y² + d y³` (coefficients `(a, b, c, d) ∈ ℤ⁴`, the carrier of [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings)) and `p` a prime. If `f ≢ 0 (mod p), f mod p` has exactly three zeros in `P¹(𝔽̄_p)` counted with multiplicity; the splitting symbol `(f, p) = (f₁^{e₁} f₂^{e₂} …)` lists the degrees `f_i` over `𝔽_p` of the fields of definition of the distinct zeros and their multiplicities `e_i`, and takes one of the five values `(111), (12), (3), (1²1), (1³)`. For each symbol `σ, T_p(σ) := {f ∈ V_Z : f ≢ 0 (mod p), (f, p) = σ}`. With `U_p ⊆ V_Z` the set of forms `f` such that the cubic ring `R(f)` is maximal at `p` (the Davenport-Heilbronn set of Layer 1: `f ∉ U_p` iff `f ≡ 0 (mod p)`, or some `GL₂(ℤ)`-translate of `f` has `a ≡ 0 (mod p²)` and `b ≡ 0 (mod p)`), put `U_p(σ) := U_p ∩ T_p(σ), V_p := U_p \ T_p(1³)` (maximal at `p` and not totally ramified at `p`), `Y_p := U_p ∩ T_p(1³)` (maximal and totally ramified at `p`), `W_p := V_Z \ U_p` and `Z_p := V_Z \ V_p = W_p ⊔ Y_p`. Over `ℤ_p` use the corresponding coefficient conditions in `ℤ_p⁴`. Only the splitting-symbol sets `T_p` descend to `𝔽_p⁴; U_p` and the maximality-dependent sets require coefficients modulo `p²` and cannot be defined from a residue in `𝔽_p⁴` alone.

`p` is prime; the symbol is undefined for `f ≡ 0 (mod p)`, and such `f` lie in `W_p` All the sets depend only on `f mod p²` (`T_p(σ)` only on `f mod p`), so they are finite unions of translates of `p²V_Z` and have well-defined `p`-adic densities The symbol is invariant under the twisted `GL₂(ℤ)`-action `(γf)(x, y) = det(γ)^{-1} f((x, y)γ)` of Layer 1, since `GL₂` permutes the zeros in `P¹` preserving degrees and multiplicities `Z_p` is BST's set of forms 'whose discriminants are not fundamental'; `W_p` and `Y_p` are its two parts

The development requires:

- `cubicSplittingSymbol`: `(f, p)` as a multiset of pairs (degree, multiplicity), defined for `f ≢ 0 (mod p)`.

- `splittingTypeSet`: `T_p(σ) = {f ∈ V_Z : f ≢ 0 mod p, (f, p) = σ}`.

- `maximalNotTotallyRamifiedSet`: `V_p = U_p \ T_p(1³)`.

- `maximalTotallyRamifiedSet`: `Y_p = U_p ∩ T_p(1³)`.

- `notFundamentalSet`: `Z_p = V_Z \ V_p`.

- `cubicSplittingSymbol_mem_five`: For `f ≢ 0 (mod p), (f, p) ∈ {(111), (12), (3), (1²1), (1³)}`.

- `cubicSplittingSymbol_smul`: `(γf, p) = (f, p)` for `γ ∈ GL₂(ℤ)` (twisted action of Layer 1).

- `splittingTypeSet_mod`: Membership in `T_p(σ)` depends only on `f mod p`; membership in `U_p, V_p, Y_p, Z_p` only on `f mod p²`.

- `notFundamentalSet_eq_union`: `Z_p = W_p ⊔ Y_p`, a disjoint union.

Proof: Factor `f mod p` over `𝔽_p` into irreducible binary forms (homogeneous factorisation in `𝔽_p[x, y]`); the pairs (degree, multiplicity) of the distinct irreducible factors, as a multiset, is the symbol; the five values are the multisets with `Σ f_i e_i = 3`. `GL₂(𝔽_p)` acts on binary forms over `𝔽_p` by linear substitution and scaling by `det^{-1}`, which maps irreducible factors to irreducible factors of the same degree with the same multiplicities; reduction `mod p` commutes with the action, so `T_p(σ), U_p` and hence `V_p, Y_p, W_p, Z_p` are `GL₂(ℤ)`-invariant. `U_p` is imported from Layer 1 (Davenport-Heilbronn's maximality criterion, BST Theorem 14); the remaining sets are Boolean combinations.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [ArithmeticStatisticsPartI: binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [ArithmeticStatisticsPartII: davenport heilbronn sets](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-sets), [ArithmeticStatisticsPartII: davenport heilbronn maximality criterion](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-maximality-criterion).

([[5]](#ref-5), Section 4, p. 8; [[5]](#ref-5), Section 4, p. 9 and Section 8.2, p. 23.)

**Checks.**

- `(x y (x − y), p) = (111)` for every prime `p`.

- `(y³ + 2x³, 2) = (1³)`, and `y³ + 2x³ ∈ Y₂`.

- The zero form lies in no `T_p(σ)` and in `W_p` for every `p`.

- `y³ + 4x³` has symbol `(1³)` at 2 but is not in `Y₂` (it lies in `W₂`, since `a ≡ 0 mod 4` and `b ≡ 0 mod 2`): the symbol alone does not decide maximality.

- For `γ = [[0, 1], [1, 0]], γ(x²y) = −xy²` and both have symbol `(1²1)`.

- `x y (x − y)` has symbol (111) at every `p, x (x² + y²)` has symbol `(12)` at `p = 3`, and `x²y` has symbol `(1²1)` at every `p`.

- `y³ + p x³` has symbol `(1³)`, lies in `U_p (a ≢ 0 mod p²)` and hence in `Y_p; y³ + p² x³` has symbol `(1³)` but lies in `W_p`.

- `V_Z = W_p ⊔ V_p ⊔ Y_p` as a disjoint union.

<a id="splitting-symbol-determines-the-reduction-mod-p"></a>

**Splitting symbol determines the reduction mod p.** For an integral binary cubic form `f` with `f ≢ 0 (mod p)` and cubic ring `R(f)` ([ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings)): `(f, p) = (f₁^{e₁} f₂^{e₂} …)` iff `R(f)/pR(f) ≅ 𝔽_{p^{f₁}}[t₁]/(t₁^{e₁}) ⊕ 𝔽_{p^{f₂}}[t₂]/(t₂^{e₂}) ⊕ …`. Consequently, if `f ∈ U_p` (`R(f)` maximal at `p`) and `f` is irreducible with `R(f) ⊗ ℚ = K` a cubic field, then `(f, p)` is the splitting type of `p` in `K: (111)` split, (12) one degree-1 and one degree-2 prime, (3) inert, `(1²1)` partially ramified, `(1³)` totally ramified.

`f ≢ 0 (mod p)` The comparison with the splitting of `p` in `K` needs `R(f) ⊗ ℤ_p` maximal, i.e. `f ∈ U_p`

Proof: `R(f)/pR(f) = R(f mod p)`, the cubic `𝔽_p`-algebra of the reduction (the Delone-Faddeev construction commutes with base change `ℤ → 𝔽_p`, BST Section 2, last paragraph). Both sides depend only on the `GL₂(𝔽_p)`-orbit of `f mod p`; check the five orbits on representatives: `xy(x − y)` gives `𝔽_p³, x·q(x, y)` with `q` irreducible gives `𝔽_p ⊕ 𝔽_{p²}`, an irreducible cubic gives `𝔽_{p³}, x²y` gives `𝔽_p[t]/(t²) ⊕ 𝔽_p, x³` gives `𝔽_p[t]/(t³)`; these are pairwise non-isomorphic algebras. If `R(f) ⊗ ℤ_p` is the maximal order of `K ⊗ Q_p`, then `R(f)/pR(f) = O_K/pO_K ≅ ⊕_{𝔭 | p} O_K/𝔭^{e(𝔭)}`, and `O_K/𝔭^{e} ≅ 𝔽_{p^{f(𝔭)}}[t]/(t^e)` (Dedekind–Kummer; NumberFieldArithmetic Layer 1 splitting dictionary), so the symbol records `(f(𝔭), e(𝔭))`.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms).

([[5]](#ref-5), Section 4, p. 8.)

**Checks.**

- `x²y: R/pR ≅ 𝔽_p[t]/(t²) ⊕ 𝔽_p`, symbol `(1²1)`.

- For `f = x³ − x y² − y³` (the form of the discriminant `−23` field) and `p = 23, (f, 23) = (1²1): 23` is partially ramified, consistent with `23 ∥ Disc`.

- The comparison with the maximal order needs `f∈U_p`. For `g=x³+x²y+xy²+2y³, Disc(g)=−83` is squarefree and `g` is irreducible, so `R(g)=O_K`. At `p=2, g` has symbol `(12)`. Its index-2 subring corresponds to `f=4x³+2x²y+xy²+y³`, of discriminant `−332` and symbol `(1²1)`. Thus `R(f)/2R(f)≅𝔽₂[t]/(t²)×𝔽₂` whereas `O_K/2O_K≅𝔽₂×𝔽₄`. For comparison, `y³+4x³` is non-maximal at2, but its reduction and its maximal order both have abstract reduction `𝔽₂[t]/(t³)`; non-maximality alone does not force non-isomorphic reductions.

<a id="densities-of-splitting-types"></a>

**Densities of splitting types.** Let `μ_p` be the `p`-adic density on `V_Z` (the Haar measure of the `p`-adic closure in `V_{ℤ_p} = ℤ_p⁴`, total mass 1; for a set defined modulo `p` it is `(number of residue classes mod p)/p⁴`). Then `μ_p(T_p(111)) = (1/6)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(12)) = (1/2)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(3)) = (1/3)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(1²1)) = (p − 1) p (p + 1)/p⁴` and `μ_p(T_p(1³)) = (p − 1)(p + 1)/p⁴`.

`p` prime `μ_p` is the normalised additive Haar measure on `ℤ_p⁴` (the density used in BST Theorem 26, supplied with that theorem by Layer 2)

Proof: Membership in `T_p(σ)` depends only on `f mod p`, so `μ_p(T_p(σ)) = #{f ∈ 𝔽_p⁴ : (f, p) = σ}/p⁴`. A nonzero binary cubic form over `𝔽_p` is determined up to the `p − 1` nonzero scalars by its zero divisor in `P¹(𝔽̄_p)`, a Frobenius-stable effective divisor of degree 3. Count the divisors of each shape: unordered triples of distinct points of `P¹(𝔽_p): (p + 1)p(p − 1)/6`; a point of `P¹(𝔽_p)` plus a conjugate pair from `P¹(𝔽_{p²}) \ P¹(𝔽_p): (p + 1)(p² − p)/2`; a conjugate triple from `P¹(𝔽_{p³}) \ P¹(𝔽_p): (p³ − p)/3`; a double point and a different single point, both rational: `(p + 1)p`; a rational triple point: `p + 1`. Multiply each count by `p − 1` and divide by `p⁴`.

*Needs:* [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms), `Matrix.card_GL_field` (Mathlib), [ArithmeticStatisticsPartI: acceptable weight function](../ArithmeticStatisticsPartI/README.md#acceptable-weight-function).

([[5]](#ref-5), Lemma 17 and its proof, pp. 8-9.)

**Checks.**

- The five densities sum to `(p⁴ − 1)/p⁴`, the density of forms not `≡ 0 mod p: (p − 1)(p + 1)[(p − 1)p + p + 1] = (p² − 1)(p² + 1)`.

- At `p = 2` the counts of forms are 1, 3, 2, 6, 3 (sum `15 = 2⁴ − 1`).

- At `p=3`, multiplying the five densities by `3⁴` gives counts `8,24,16,24,8`, totaling80; the zero form is excluded.

<a id="densities-of-splitting-types-of-maximal-forms"></a>

**Densities of splitting types of maximal forms.** `U_p(111) = T_p(111), U_p(12) = T_p(12), U_p(3) = T_p(3)`; and `μ_p(U_p(1²1)) = (p − 1)²(p + 1)/p⁴, μ_p(U_p(1³)) = (p − 1)²(p + 1)/p⁵`. Equivalently, a proportion `(p − 1)/p` of the forms in `T_p(1²1)` and in `T_p(1³)` lie in `U_p`.

`p` prime; `U_p` is the Davenport-Heilbronn set of Layer 1 (`R(f)` maximal at `p` iff `f ∈ U_p`)

Proof: for `σ ∈ {(111), (12), (3)}` the discriminant is prime to `p` (`f mod p` is squarefree), so `R(f)` is maximal at `p` (an overring of index divisible by `p` would force `p² | Disc`); hence `U_p(σ) = T_p(σ)`. For `σ ∈ {(1²1), (1³)}` move the unique multiple zero of `f mod p` to (1 : 0) by an element of `GL₂(ℤ)`; then `a ≡ b ≡ 0 (mod p)`, and by the criterion of Layer 1 the form fails to be maximal exactly when additionally `a ≡ 0 (mod p²)`. Among the forms of `T_p(σ)` put in this position, the condition `a ≡ 0 (mod p²)` cuts out a proportion `1/p` (`a mod p²` is uniformly distributed among the `p` residues `≡ 0 mod p`), and the normalisation is `GL₂(ℤ)`-equivariant, so `μ_p(U_p(σ)) = ((p − 1)/p) μ_p(T_p(σ))`; insert Lemma 17.

*Needs:* [densities of splitting types](#densities-of-splitting-types), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms), [ArithmeticStatisticsPartII: davenport heilbronn sets](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-sets), [ArithmeticStatisticsPartII: davenport heilbronn maximality criterion](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-maximality-criterion).

([[5]](#ref-5), Lemma 18 and the paragraph before it, p. 9.)

**Checks.**

- `μ_p(U_p(1²1)) = ((p − 1)/p) · (p − 1)p(p + 1)/p⁴ = (p − 1)²(p + 1)/p⁴`.

- `μ_p(U_p(1³)) = ((p − 1)/p) · (p − 1)(p + 1)/p⁴`.

- At two the ramified maximal densities are `3/16` and `3/32`; maximality removes half of each corresponding ramified splitting locus.

<a id="densities-of-maximal-and-nowhere-totally-ramified-forms"></a>

**Densities of maximal and nowhere totally ramified forms.** `μ_p(U_p) = (p³ − 1)(p² − 1)/p⁵ = (1 − p^{−2})(1 − p^{−3})` and `μ_p(V_p) = (p² − 1)²/p⁴ = (1 − p^{−2})²`.

`p` prime

Proof: `U_p` is the disjoint union of the `U_p(σ)` over the five symbols (a form `≡ 0 mod p` is not in `U_p`) and `V_p` is the union over `σ ≠ (1³)`. Sum the densities of Lemma 18: `(p − 1)²(p + 1)[p² + p + 1]/p⁵ = (p² − 1)(p³ − 1)/p⁵`, and without the `(1³)` term `(p − 1)²(p + 1)(p² + p)/p⁵ = (p² − 1)²/p⁴`.

*Needs:* [densities of splitting types of maximal forms](#densities-of-splitting-types-of-maximal-forms), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms).

([[5]](#ref-5), Lemma 19, p. 9.)

**Checks.**

- `∏_p μ_p(U_p) = ∏_p (1 − p^{−2})(1 − p^{−3}) = 1/(ζ(2)ζ(3))` and `∏_p μ_p(V_p) = 1/ζ(2)² = 36/π⁴` (Euler products).

- At `p = 2: μ₂(U₂) = 21/32` and `μ₂(V₂) = 9/16`.

- Their difference is `3/32`, exactly the maximal totally ramified density at two.

<a id="maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields"></a>

**Maximal irreducible cubic rings are rings of integers of cubic fields.** Let `f` be an irreducible integral binary cubic form, so that `R(f)` is an order in the cubic field `K = R(f) ⊗ ℚ` ([ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings)). `(a) R(f)` is maximal (contained in no strictly larger cubic ring inside `K`) iff `R(f) = O_K`, iff `R(f)` is maximal at every prime `p`, iff `f ∈ U := ∩_p U_p`. `(b)` The map `f ↦ R(f) ⊗ ℚ` induces a bijection between `GL₂(ℤ)`-orbits of irreducible forms in `U` and `ℚ`-isomorphism classes of cubic fields, with `Disc(f) = Disc(R(f)) = Disc(K)`; hence for every interval, `N(U ∩ V_Z^{(i)}; X)` (the number of irreducible `GL₂(ℤ)`-orbits in `U` with `0 < (−1)^i Disc < X`) equals `N₃(⊤; 0, X)` for `i = 0` and `N₃(⊤; −X, 0)` for `i = 1`. `(c)` For `f ∈ U, p` is totally ramified in `K` iff `f ∈ T_p(1³)`; hence the irreducible orbits in `V := ∩_p V_p` correspond to the cubic fields in which no prime is totally ramified.

`f` irreducible over `ℚ` (equivalently `R(f)` is a domain, Layer 1) `V_Z^{(0)}` and `V_Z^{(1)}` are the forms of positive and negative discriminant

Proof: Every element of an order `R ⊆ K` is integral over `ℤ` (`R` is a finitely generated `ℤ`-module), so `R ⊆ O_K; O_K` is itself a cubic ring (free of rank 3), so a maximal order equals `O_K`, and conversely `O_K` is contained in no larger order. `R ⊆ O_K` has finite index, and `R = O_K` iff no prime `p` divides `[O_K : R]`, iff `R ⊗ ℤ_p = O_K ⊗ ℤ_p` for all `p`, i.e. `R` is maximal at every `p`; by the Davenport-Heilbronn criterion of Layer 1 this holds iff `f ∈ U_p` for all `p`. By Delone-Faddeev (Layer 1), `GL₂(ℤ)`-orbits of forms correspond to isomorphism classes of cubic rings with `Disc(f) = Disc(R(f))`; restricting to orbits with `R(f) ≅ O_K` for a cubic field `K` gives a bijection with isomorphism classes of cubic fields (`K ≅ K'` iff `O_K ≅ O_{K'}`), and `Disc(O_K) = NumberField.discr K`. Part `(c)` is [splitting symbol determines the reduction mod p](#splitting-symbol-determines-the-reduction-mod-p) applied to `f ∈ U_p`.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [ArithmeticStatisticsPartI: cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [ArithmeticStatisticsPartII: reducible forms and zero divisors](../ArithmeticStatisticsPartII/README.md#reducible-forms-and-zero-divisors), [ArithmeticStatisticsPartII: davenport heilbronn maximality criterion](../ArithmeticStatisticsPartII/README.md#davenport-heilbronn-maximality-criterion), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms), [splitting symbol determines the reduction mod p](#splitting-symbol-determines-the-reduction-mod-p), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), `NumberField.RingOfIntegers` (Mathlib), `NumberField.discr` (Mathlib).

([[5]](#ref-5), Section 3, first paragraph, p. 6; [[5]](#ref-5), Section 8.3, p. 24.)

**Checks.**

- The form `x³ − x y² − y³` lies in `U` (its discriminant `−23` is squarefree) and corresponds to the cubic field of discriminant `−23`.

- The form `4x³ + y³` lies in `W₂ (a ≡ 0 mod 4, b ≡ 0 mod 2): R(f) = ℤ[∛4]`, of index 2 in `O_{ℚ(∛2)} = ℤ[∛2]`, with `Disc −432 = 2²·(−108)`; its orbit is not counted by `N(U; X)`.

- The irreducible orbits in `U` with `|Disc| < 50` are exactly four, of discriminants `−23`, `−31`, `−44` and 49, matching the four cubic fields with `|Disc| < 50`.

<a id="davenport-heilbronn-count-of-cubic-fields"></a>

**Davenport heilbronn count of cubic fields.** `FieldStatistics.davenportHeilbronn_cubicFields` states both signed asymptotics with the isomorphism-class normalization. Let `N₃(ξ, η) = N₃(⊤; ξ, η)` be the number of cubic fields `K` up to isomorphism with `ξ < Disc(K) < η` ([ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), `n = 3`, no Galois-group restriction: cyclic cubic fields are included). Then `N₃(0, X) = X/(12ζ(3)) + o(X)` and `N₃(−X, 0) = X/(4ζ(3)) + o(X)` as `X → ∞`. More precisely, for `i ∈ {0, 1}` with `n₀ = 6 = #Aut_ℝ(ℝ³)` and `n₁ = 2 = #Aut_ℝ(ℝ ⊕ ℂ), lim_{X→∞} N(U ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_p (1 − p^{−2})(1 − p^{−3}) = 1/(2 n_i ζ(3))`. The same method gives, for any finite set of primes and prescribed splitting types at them, the count multiplied by the product of the corresponding relative local densities (the finite-condition case of [density of cubic orders with local specifications](#density-of-cubic-orders-with-local-specifications)).

The count is by isomorphism classes of fields, ordered by the signed discriminant; the total is `N₃(X) ~ X/(3ζ(3))` Cyclic cubic fields are included but number `O(X^{1/2})` (every ramified prime is totally ramified, so `Disc = f²` with `f` the conductor), so the same asymptotic holds for `S₃`-cubic fields The error term is only `o(X)`; power savings are in the second-order node [roberts second order term for cubic fields](#roberts-second-order-term-for-cubic-fields)

Proof: by [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), `N₃(0, X) = N(U ∩ V_Z^{(0)}; X)` and `N₃(−X, 0) = N(U ∩ V_Z^{(1)}; X)`, where `N(S; X)` counts irreducible `GL₂(ℤ)`-orbits in `S` with `|Disc| < X` and `U = ∩_p U_p`. Upper bound: for every `Y, ∩_{p<Y} U_p` is defined by congruence conditions modulo `∏_{p<Y} p²`, so the congruence-condition count of binary cubic forms (BST Theorem 26, supplied by Layer 2) gives `lim_{X} N(∩_{p<Y} U_p ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_{p<Y} μ_p(U_p)`; since `U ⊆ ∩_{p<Y} U_p, limsup_X N(U ∩ V_Z^{(i)}; X)/X ≤ (π²/(12 n_i)) ∏_{p<Y} (1 − p^{−2})(1 − p^{−3})` ([densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms)); let `Y → ∞`. Lower bound: `∩_{p<Y} U_p ⊆ U ∪ ∪_{p≥Y} W_p` with `W_p = V_Z \ U_p`, so `N(U ∩ V_Z^{(i)}; X) ≥ N(∩_{p<Y} U_p ∩ V_Z^{(i)}; X) − Σ_{p≥Y} N(W_p; X)`; the uniformity estimate `N(W_p; X) = O(X/p²)` with a constant independent of `p` (BST Proposition 29, nonmaximal part, supplied by Layer 2) bounds the tail by `O(X Σ_{p≥Y} p^{−2}) = O(X/Y)`. Hence `liminf ≥ (π²/(12 n_i)) ∏_{p<Y} (1 − p^{−2})(1 − p^{−3}) − O(1/Y)`; let `Y → ∞`. Evaluate the constant: `∏_p (1 − p^{−2}) = 1/ζ(2) = 6/π²` and `∏_p (1 − p^{−3}) = 1/ζ(3)` (Euler product, `riemannZeta_eulerProduct_tprod; ζ(2) = π²/6, riemannZeta_two`), so `(π²/(12 n_i)) · (6/π²)/ζ(3) = 1/(2 n_i ζ(3))`; with `n₀ = 6, n₁ = 2` this is `1/(12ζ(3))` and `1/(4ζ(3))`. The values `n₀, n₁` are the orders of the `GL₂(ℝ)`-stabilizers of forms of positive and negative discriminant (`Aut_ℝ(ℝ³) = S₃` and `Aut_ℝ(ℝ ⊕ ℂ) = ℤ/2`), supplied with the count of Layer 2.

*Needs:* [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), [densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [ArithmeticStatisticsPartIII: real orbits and stabilizers of binary cubic forms](../ArithmeticStatisticsPartIII/README.md#real-orbits-and-stabilizers-of-binary-cubic-forms), `riemannZeta_two` (Mathlib), `riemannZeta_eulerProduct_tprod` (Mathlib).

([[5]](#ref-5), Theorem 1, p. 1; [[5]](#ref-5), Section 8.3, proof of Theorem 1, p. 24; [[5]](#ref-5), Section 8.3, last paragraph, p. 24.)

**Checks.**

- Total: `N₃(X) = N₃(0, X) + N₃(−X, 0) ~ (1/(12ζ(3)) + 1/(4ζ(3))) X = X/(3ζ(3)) ≈ 0.2773 X`.

- Ratio: asymptotically three times as many complex cubic fields as totally real ones `(n₀/n₁ = 3)`.

- The count is by fields, not orders: the order count of BST Theorem 6 has the larger constants `π²/72` and `π²/24`; the ratio `(π²/(12 n_i))/(1/(2n_i ζ(3))) = ζ(2)ζ(3) = ∏_p μ_p(U_p)^{−1}`.

### 3.3 Quadratic resolvents and mean three-torsion

<a id="nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent"></a>

**Nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent.** Let `K₃` be a cubic field. `(a)` If `K₃` is nowhere totally ramified (no prime `p` has `p O_{K₃} = 𝔭³`), then `K₃` is not Galois (an `S₃`-cubic field). `(b)` For an `S₃`-cubic field `K₃` with Galois closure `K₆` and quadratic resolvent `K₂ ⊆ K₆` (the fixed field of `A₃ = Gal(K₆/K₂); K₂ = ℚ(√Disc(K₃))`), the extension `K₆/K₂` is unramified at all finite primes iff `K₃` is nowhere totally ramified, and in that case `Disc(K₃) = Disc(K₂)`. `(c)` Conversely, if `K₂` is a quadratic field and `L/K₂` is an unramified cyclic cubic extension that is Galois over `ℚ` with `Gal(L/ℚ) ≅ S₃`, then each of the three conjugate cubic subfields of `L` is nowhere totally ramified and has discriminant `Disc(K₂)`. (The archimedean places impose no condition: a Galois extension of odd degree is unramified at infinity.)

'Unramified' is at finite primes; `K₆/K₂` is Galois of odd degree, so its real-place inertia groups, of order at most two, are trivial. Odd degree alone would not suffice for an arbitrary non-Galois extension. `K₂` is `ℚ(√Disc(K₃)): √Disc(K₃)` generates the fixed field of `A₃` in `K₆ Disc(K₃) ∈ Disc(K₂)·(ℚ^×)²` always; equality needs the nowhere-totally-ramified hypothesis

Proof: `(a)` A cyclic cubic field has `Disc = f²` with `f` its conductor and every ramified prime totally ramified (inertia groups are subgroups of `ℤ/3ℤ`); a field with no ramified prime would be an unramified extension of `ℚ`, which does not exist (Minkowski, `|Disc| > 1`: `NumberField.abs_discr_gt_two`); so a nowhere totally ramified cubic field is `S₃`. `(b)` For a prime `𝔓` of `K₆` over `p` with inertia group `I ≤ S₃` acting on the three embeddings of `K₃`: the ramification indices of the primes of `K₃` above `p` are the orbit lengths of `I` on `{1, 2, 3}` (Galois correspondence for inertia groups; NumberFieldArithmetic Layer 6 and LocalFieldsRamification Layer 3). `p` is totally ramified in `K₃` iff `I` acts transitively iff 3 divides `#I` iff `I ∩ A₃ ≠ 1` iff `𝔓 ∩ K₂` ramifies in `K₆/K₂` (the inertia group of `K₆/K₂` at `𝔓` is `I ∩ A₃`). Discriminant equality: at a prime `p` not totally ramified in `K₃, K₃ ⊗ Q_p` is either unramified (both discriminants prime to `p`; in the case `(12) p` is inert in `K₂` but unramified) or `Q_p × F` with `F/Q_p` a ramified quadratic extension, and then `K₂ ⊗ Q_p ≅ F` (the discriminant algebra of `Q_p × F` is `F`), so `v_p(Disc K₃) = v_p(disc F) = v_p(Disc K₂)`; the signs agree because `Disc(K₃)/Disc(K₂)` is a square. Hence `Disc(K₃) = Disc(K₂)`. `(c)` The three cubic subfields of `L` are the fixed fields of the three transpositions; they are conjugate, and by `(b)` applied to `L = K₆` they are nowhere totally ramified with discriminant `Disc(K₂)`.

*Needs:* [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), `NumberField.discr` (Mathlib), `NumberField.abs_discr_gt_two` (Mathlib), `Ideal.inertia` (Mathlib), `Ideal.ramificationIdx` (Mathlib).

([[5]](#ref-5), Section 8.1, p. 23; [[5]](#ref-5), Section 8.5, p. 26.)

**Checks.**

- For `K₃` the field of `x³ − x − 1 (Disc −23): K₂ = ℚ(√−23)`, and `K₆` is the Hilbert class field of `ℚ(√−23)` (class number 3); 23 is partially ramified in `K₃`.

- The cyclic cubic field of discriminant 49 is totally ramified at 7 and is excluded, consistent with `(a)`.

- `ℚ(∛2) (Disc −108 = −2²·3³)` is totally ramified at 2 and `3, K₂ = ℚ(√−3)` with `Disc −3 ≠ −108`.

<a id="three-torsion-of-quadratic-class-groups-counts-cubic-fields"></a>

**Three torsion of quadratic class groups counts cubic fields.** For every quadratic field `K₂`, the number of isomorphism classes of cubic fields `K₃` that are nowhere totally ramified and whose quadratic resolvent is `K₂` (equivalently, by [nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent), with `Disc(K₃) = Disc(K₂)`) equals `(h₃(K₂) − 1)/2`, where `h₃(K₂) = #Cl(K₂)[3]`. Consequently, for `i ∈ {0, 1}, Σ_{0<(−1)^i Disc(K₂)<X} (h₃(K₂) − 1)/2 = N(V ∩ V_Z^{(i)}; X)`, the number of irreducible `GL₂(ℤ)`-orbits in `V = ∩_p V_p` with `0 < (−1)^i Disc < X`.

The count is of fields up to isomorphism; each such field has three conjugate embeddings, all with the same resolvent `h₃` is the wide class group's 3-torsion (Mathlib ClassGroup); for `p = 3` wide and narrow class groups have the same 3-part The sign condition matches: `Disc(K₃) = Disc(K₂)`, so real quadratic resolvents correspond to totally real cubic fields (positive discriminant)

Proof: Class field theory (ClassFieldTheory Layer 13, `gal_hilbertClassField_equiv_classGroup`): unramified abelian extensions of `K₂` inside a fixed algebraic closure correspond to subgroups of `Cl(K₂)`, and unramified cyclic cubic extensions `L/K₂` to subgroups of index 3; a finite abelian group `A` has `(#A[3] − 1)/2` subgroups of index 3 (they correspond to the lines of the `𝔽₃`-vector space `Hom(A, ℤ/3ℤ)`, which has #A[3] elements). Each such `L` is Galois over `ℚ` (its norm subgroup is stable under `Gal(K₂/ℚ)`, whose generator `σ` acts on `Cl(K₂)` by `c ↦ c^{−1}`, because `c·σ(c)` is the class of the ideal norm to `ℚ`, which is principal), and `Gal(L/ℚ) ≅ ℤ/3ℤ ⋊ ℤ/2ℤ` with `σ` acting by inversion, i.e. `S₃`. By the resolvent lemma, the three cubic subfields of such an `L` form one isomorphism class of nowhere totally ramified cubic fields with resolvent `K₂`, and conversely the Galois closure of such `a K₃` is such an `L`; distinct `L` give non-isomorphic cubic fields (`L` is the Galois closure). Hence the count is `(h₃(K₂) − 1)/2`. Summing over `K₂` with `0 < (−1)^i Disc(K₂) < X` and using [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields) `(c)` (irreducible orbits in `V ↔` nowhere totally ramified cubic fields, `Disc` preserved) gives the displayed identity (BST (59)).

*Needs:* [nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent), [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), `ClassGroup` (Mathlib).

([[5]](#ref-5), Section 8.5, (59), p. 26; [[21]](#ref-21), Section 3, p. 7.)

**Checks.**

- `K₂ = ℚ(√−23): h₃ = 3`, so exactly one nowhere totally ramified cubic field has discriminant `−23` (the field of `x³ − x − 1`).

- `K₂ = ℚ(√−3), ℚ(i): h₃ = 1`, so no cubic field has discriminant `−3` or `−4`.

- `K₂ = ℚ(√229)` (class number 3): exactly one cubic field of discriminant 229, the totally real field of `x³ − 4x + 1`.

<a id="cubic-fields-totally-ramified-at-large-primes-are-sparse"></a>

**Cubic fields totally ramified at large primes are sparse.** There is an absolute constant `C` such that for every prime `p` and every `X ≥ 1`, the number of cubic fields `K` (up to isomorphism) with `|Disc(K)| < X` in which `p` is totally ramified is at most `C X/p²`. Equivalently `N(Y_p ∩ U; X) ≤ C X/p²`, where `U = ∩_q U_q`. This is the part of BST Proposition 29 `(N(Z_p; X) = O(X/p²))` concerning totally ramified primes, restricted to maximal forms, which is all the sieve for the mean of 3-torsion uses: `∩_{p<Y} V_p ⊆ V ∪ ∪_{q≥Y} W_q ∪ ∪_{p≥Y} (Y_p ∩ U)`.

The constant is uniform in `p`; this is what licenses the sieve over infinitely many primes in the proof of the mean of 3-torsion Only the maximal (field) part of `Y_p` is bounded here; a form in `Y_p` that is not maximal at another prime `q` lies in `W_q` and is covered by the nonmaximal estimate of Layer 2

Proof: Cyclic cubic fields have `Disc=f²`, and total ramification at `p` forces `p|f`. There are at most `C·2^{ω(f)}` fields of conductor `f`, with an absolute constant (including the exceptional conductor factor at 3). Bound each indicator `f²<X` by `X/f²`. The count is at most `C X Σ_{p|f}2^{ω(f)}/f² ≤ 2C X/p² · Σ_{g≥1}2^{ω(g)}/g² = O(X/p²)`, since the last Euler product converges. This directly gives uniformity; the bound `O(X^{1/2+ε}/p)` does not imply `O(X/p²)` uniformly for `p≤√X`. `S₃`-cubic fields: for `K` with quadratic resolvent `K₂` of discriminant `D₂`, the Galois closure `K₆` is a cyclic cubic extension of `K₂` on whose group `Gal(K₂/ℚ)` acts by inversion, hence `K₆` lies in the ring class field of an order `O_f` of `K₂` (ClassFieldTheory Layer 13, ringClassField and `gal_ringClassField_equiv_pic`), and `Disc(K) = D₂ f²` with `f` the conductor; by the inertia argument of the resolvent lemma a prime `p ≥ 5` is totally ramified in `K` iff `p | f`. For fixed `K₂` and `f`, the cubic fields with resolvent `K₂` and conductor `f` correspond to some of the index-3 subgroups of `Pic(O_f)` (quadratic orders and their Picard groups: GlobalNumberFields Layer 11), so there are at most `#Pic(O_f)[3]`; from the exact sequence `1 → (O_{K₂}/fO_{K₂})^×/((ℤ/fZ)^×·image(O_{K₂}^×)) → Pic(O_f) → Cl(K₂) → 1`, whose kernel has `3-rank` at most `ω(f) + 2, #Pic(O_f)[3] ≤ 3^{ω(f)+2} h₃(K₂)`. `Σ_{0<|D₂|<Y} h₃(K₂) = O(Y)`: by [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), `Σ (h₃(K₂) − 1)/2` counts nowhere totally ramified cubic fields with `|Disc| < Y`, which is at most the number `M₃(Y) = O(Y)` of orders in cubic fields (BST Theorem 6, from Layer 2), and the number of `K₂` is `O(Y)`. Summing over `f` divisible by `p` and `K₂` with `|D₂| < X/f²`: the count is `O(X Σ_{p|f} 3^{ω(f)} f^{−2}) ≤ O(3X p^{−2} Σ_{g≥1} 3^{ω(g)} g^{−2}) = O(X/p²)`, the series converging. The primes `p = 2, 3` are covered by the trivial bound `N₃(X) = O(X)` with a fixed constant.

*Needs:* [nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent), [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms), [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), [ArithmeticStatisticsPartIII: davenport count of binary cubic forms](../ArithmeticStatisticsPartIII/README.md#davenport-count-of-binary-cubic-forms).

([[5]](#ref-5), Section 8.2, Proposition 29 and the last sentence of its proof, pp. 23-24.)

**Checks.**

- Summed over `p ≥ Y` the bound is `O(X/Y)`, the tail estimate used in the sieve for `V = ∩_p V_p`.

- For `p = 5` the fields counted include `ℚ(∛5) (Disc −675 = −3³·5², O = ℤ[∛5])` in which 5 is totally ramified.

- The bound is sharp in order: by the congruence count of Layer 2 and Lemma 18, a proportion `μ_p(U_p(1³))/μ_p(U_p) ≍ p^{−2}` of cubic fields is totally ramified at `p`.

<a id="squarefree-integers-in-residue-classes-modulo-four"></a>

**Squarefree integers in residue classes modulo four.** For `a ∈ {1, 2, 3}` and `x ≥ 1, #{1 ≤ n ≤ x : n squarefree, n ≡ a (mod 4)} = (2/π²) x + O(√x)`, with an absolute implied constant.

The residue class `a = 0` contains no squarefree integers The error `O(√x)` is not optimised

Proof: Squarefree detection: for `n ≥ 1`, write `n = b² m` with `m` squarefree (`Nat.sq_mul_squarefree_of_pos`); then `d² | n` iff `d | b`, so `Σ_{d² | n} μ(d) = Σ_{d | b} μ(d) = [b = 1] =` `[n squarefree]` (`ArithmeticFunction.coe_zeta_mul_coe_moebius`). For odd `a`: an `n ≡ a (mod 4)` is odd, so only odd `d` contribute, and `#{n ≤ x : n ≡ a (4), d² | n} = x/(4d²) + O(1)` for odd `d` (CRT, `d²` and 4 coprime). Summing over odd `d ≤ √x: (x/4) Σ_{d odd} μ(d)/d² + O(√x) + O(x Σ_{d>√x} d^{−2}) = (x/4) ∏_{p>2} (1 − p^{−2}) + O(√x)`. `∏_{p>2} (1 − p^{−2}) = (1/ζ(2))/(1 − 1/4) = (6/π²)(4/3) = 8/π²` (`ArithmeticFunction.LSeries_zeta_mul_Lseries_moebius` and `ArithmeticFunction.LSeries_zeta_eq_riemannZeta` at `s = 2, riemannZeta_two`, and the Euler factor at 2), so the count is `(2/π²) x + O(√x)`. For `a = 2: n = 2m` with `m ≤ x/2` odd squarefree; the odd squarefree `m ≤ y` number `(4/π²) y + O(√y)` (sum of the two odd classes), giving `(2/π²) x + O(√x)`.

*Needs:* `Nat.sq_mul_squarefree_of_pos` (Mathlib), `ArithmeticFunction.moebius` (Mathlib), `ArithmeticFunction.coe_zeta_mul_coe_moebius` (Mathlib), `ArithmeticFunction.LSeries_zeta_mul_Lseries_moebius` (Mathlib), `ArithmeticFunction.LSeries_zeta_eq_riemannZeta` (Mathlib), `riemannZeta_two` (Mathlib).

([[5]](#ref-5), Section 8.5, (60), p. 26; [[21]](#ref-21), Section 8, p. 13.)

**Checks.**

- Sum over `a = 1, 2, 3: (6/π²) x + O(√x)`, the classical density of squarefree integers.

- Class zero contains no squarefree integers: divisibility by four forces a square factor.

- Numerical check: there are 608 squarefree `n ≤ 1000` (200, 204 and 204 in the classes 1, 2 and `3 mod 4`), and `6000/π² ≈ 607.9, 2000/π² ≈ 202.6`.

<a id="count-of-quadratic-fields"></a>

**Count of quadratic fields.** `FieldStatistics.quadratic_discriminant_count` states the signed fundamental-discriminant count with the strict cutoff and exclusion of one. `N₂(⊤; 0, X) = (3/π²) X + O(√X)` and `N₂(⊤; −X, 0) = (3/π²) X + O(√X)`. Equivalently, the number of fundamental discriminants `D ≠ 1` (`Int.IsFundamentalDiscr`) with `0 < D < X`, respectively `−X < D < 0`, is `(3/π²) X + O(√X)`.

Quadratic fields are counted up to isomorphism (each has one subfield of `ℚ̄` and `#Aut = 2`); the weighted count of BSW is half of this `D = 1` (the discriminant of `ℚ`) is excluded

Proof: Quadratic fields up to isomorphism correspond bijectively to fundamental discriminants `D ≠ 1` via `K ↦ Disc(K)`: every quadratic field is `ℚ(√d)` with `d ≠ 1` squarefree, `Disc(ℚ(√d)) = d` if `d ≡ 1 (mod 4)` and `4d` otherwise (Tau Ceti `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one` and `NumberField.discr_eq_four_mul_of_mod_four_ne_one`), these values are exactly the fundamental discriminants `≠ 1` (`Int.isFundamentalDiscr_iff_squarefree`), and `ℚ(√d) ≅ ℚ(√d')` iff `d = d'` for squarefree `d, d'`. Count positive fundamental discriminants: `D = n ≡ 1 (mod 4)` squarefree, `n < X (n ≠ 1): (2/π²) X + O(√X); D = 4m` with `m ≡ 2, 3 (mod 4)` squarefree, `m < X/4: (4/π²)(X/4) + O(√X)`. Total `(3/π²) X + O(√X)` ([squarefree integers in residue classes modulo four](#squarefree-integers-in-residue-classes-modulo-four)). Negative: `D = −n` with `n ≡ 3 (mod 4)` squarefree, `n < X: (2/π²) X; D = −4m` with `m ≡ 1, 2 (mod 4)` squarefree (so `−m ≡ 3, 2`), `m < X/4: (4/π²)(X/4)`. Total `(3/π²) X + O(√X)`.

*Needs:* [squarefree integers in residue classes modulo four](#squarefree-integers-in-residue-classes-modulo-four), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), `Int.IsFundamentalDiscr` (Mathlib), `Int.isFundamentalDiscr_iff_squarefree` (Mathlib), `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one` (Tau Ceti), `NumberField.discr_eq_four_mul_of_mod_four_ne_one` (Tau Ceti).

([[5]](#ref-5), Section 8.5, (60), p. 26; [[21]](#ref-21), Section 8, p. 13.)

**Checks.**

- At `X=1` both strict sublevels are empty; the error bound remains meaningful.

- Discriminant one satisfies `Int.IsFundamentalDiscr` but is excluded, since it represents `ℚ`.

- Small values: the negative fundamental discriminants in `(−25, 0)` are `−3`, `−4`, `−7`, `−8`, `−11`, `−15`, `−19`, `−20`, `−23`, `−24`, i.e. `N₂(⊤; −25, 0) = 10`, against `3·25/π² ≈ 7.6`.

- Both signs together: `(6/π²) X`, agreeing with Wood's Tauberian count `N_{S₂}(X) ~ (6/π²) X`.

- This is the denominator of the Davenport-Heilbronn mean of 3-torsion; it is `3/π²`, not `6/π²`, per sign.

<a id="davenport-heilbronn-mean-of-three-torsion"></a>

**Davenport heilbronn mean of three torsion.** `FieldStatistics.davenportHeilbronn_threeTorsion` states both ordinary three-torsion means on quadratic intermediate fields. `Σ_{0<Disc(K)<X} h₃(K) = (4/3) Σ_{0<Disc(K)<X} 1 + o(X)` and `Σ_{−X<Disc(K)<0} h₃(K) = 2 Σ_{−X<Disc(K)<0} 1 + o(X)`, the sums over quadratic fields `K` up to isomorphism ordered by discriminant, `h₃(K) = #Cl(K)[3]`. Equivalently `lim_{X→∞} (Σ_{0<±Disc(K)<X} h₃(K)) / N₂(⊤; 0 < ±Disc < X) = 4/3` (real) and 2 (imaginary).

Quadratic fields are ordered by `|Disc|` and weighted equally; the averages are over all quadratic fields of the given sign The proof sieves to `V = ∩_p V_p`, defined by infinitely many congruence conditions, and needs the uniform tail bound for `Z_p = W_p ⊔ Y_p` No Cohen-Lenstra hypothesis is used; the theorem is the case `p = 3, α = 1` of the moment prediction [cohen lenstra moment prediction](#cohen-lenstra-moment-prediction), which it confirms

Proof: by [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), `Σ_{0<(−1)^i Disc(K)<X} (h₃(K) − 1)/2 = N(V ∩ V_Z^{(i)}; X)`. The sieve of the proof of [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields) with `V_p` in place of `U_p`: the upper bound from the congruence count over `∩_{p<Y} V_p` (Layer 2) and `μ_p(V_p) = (1 − p^{−2})²` ([densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms)); the lower bound from `∩_{p<Y} V_p ⊆ V ∪ ∪_{p≥Y} (W_p ∪ Y_p)`, the nonmaximal bound `N(W_p; X) = O(X/p²)` (Layer 2) and [cubic fields totally ramified at large primes are sparse](#cubic-fields-totally-ramified-at-large-primes-are-sparse). Hence `lim N(V ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_p (1 − p^{−2})² = (π²/(12 n_i))(36/π⁴) = 3/(n_i π²)`. By [count of quadratic fields](#count-of-quadratic-fields), `Σ_{0<±Disc<X} 1 ~ 3X/π²`. Therefore the mean of `h₃` is `1 + 2 · (3/(n_i π²))/(3/π²) = 1 + 2/n_i: 1 + 2/6 = 4/3` for `i = 0` (positive discriminant, real quadratic) and `1 + 2/2 = 2` for `i = 1` (imaginary).

*Needs:* [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields), [densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms), [cubic fields totally ramified at large primes are sparse](#cubic-fields-totally-ramified-at-large-primes-are-sparse), [count of quadratic fields](#count-of-quadratic-fields), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), `riemannZeta_two` (Mathlib), `riemannZeta_eulerProduct_tprod` (Mathlib).

([[5]](#ref-5), Theorem 2, p. 1; [[5]](#ref-5), Section 8.5, proof of Theorem 2, p. 26.)

**Checks.**

- Imaginary: mean `h₃ = 2`, i.e. the mean number of surjections `Cl(K) → ℤ/3ℤ` (which is `h₃ − 1`) is 1; real: mean `4/3`, i.e. `1/3` surjections on average — the Cohen-Lenstra predictions `|A|^0` and `|A|^{−1}` for `A = ℤ/3ℤ`.

- Small-range sanity check (not a test of the limit): among the 10 imaginary quadratic fields with `|Disc| < 25` only `ℚ(√−23)` has `h₃ = 3`, giving an average `6/5`.

- The sieve cannot be run with a pointwise density at each prime alone: without the uniform bound for `Y_p` (totally ramified primes, via class field theory) only the upper bound follows.

### 3.4 Cubic local mass specifications

<a id="acceptable-local-specifications-for-cubic-orders"></a>

**Acceptable local specifications for cubic orders.** A local specification for cubic orders is a collection `Σ = (Σ_p)_p ∪ Σ_∞` where, for each prime `p, Σ_p` is a set of isomorphism classes of nondegenerate cubic rings over `ℤ_p` (orders in étale cubic `Q_p`-algebras; by Delone-Faddeev over `ℤ_p`, equivalently a `GL₂(ℤ_p)`-invariant set of binary cubic forms over `ℤ_p` of nonzero discriminant), and `Σ_∞ ⊆ {ℝ³, ℝ ⊕ ℂ}`. An order `R` in a cubic field is a `Σ`-order if `R ⊗ ℤ_p ∈ Σ_p` for all `p` and `R ⊗ ℝ ∈ Σ_∞`. `Σ` is acceptable if for all sufficiently large `p, Σ_p` contains every maximal cubic `ℤ_p`-order that is not totally ramified; it is strongly acceptable if for all sufficiently large `p, Σ_p` is one of: all nondegenerate cubic `ℤ_p`-orders, all maximal ones, or all maximal ones not totally ramified. The local mass of `Σ_p` is `m_p(Σ_p) := Σ_{R ∈ Σ_p} 1/(Disc_p(R) · #Aut(R))`, where `Disc_p(R) = p^{v_p(Disc R)}`; the archimedean mass is `m_∞(Σ_∞) := Σ_{R ∈ Σ_∞} 1/#Aut(R)` with `#Aut(ℝ³) = 6` and `#Aut(ℝ ⊕ ℂ) = 2`.

Isomorphism classes over `ℤ_p`, not over `Q_p`: several orders can lie in the same étale algebra Nondegenerate means nonzero discriminant; degenerate rings never occur as `R ⊗ ℤ_p` for an order `R` in a cubic field The infinite sum `m_p` over all nondegenerate orders converges (BST (57))

The development requires:

- `CubicLocalSpecification`: A family `Σ_p` (`p` prime) of `GL₂(ℤ_p)`-invariant sets of binary cubic forms over `ℤ_p` of nonzero discriminant, and a subset `Σ_∞` of `{ℝ³, ℝ ⊕ ℂ}`.

- `CubicLocalSpecification.IsAcceptable`: For all sufficiently large `p`, the forms of `V_p ⊗ ℤ_p` (maximal, not totally ramified) lie in `Σ_p`.

- `CubicLocalSpecification.IsStronglyAcceptable`: For all sufficiently large `p, Σ_p` is all nondegenerate forms, the maximal ones, or the maximal not totally ramified ones.

- `CubicLocalSpecification.IsStronglyAcceptable.isAcceptable`: Strongly acceptable implies acceptable.

- `CubicLocalSpecification.maximal`: The specification of maximal orders (all real types at `∞`).

- `CubicLocalSpecification.nowhereTotallyRamified`: The specification of maximal orders not totally ramified at any `p`.

- `CubicLocalSpecification.localMass`: `m_p(Σ_p) = Σ_{R ∈ Σ_p} 1/(Disc_p(R) #Aut(R))`, as an element of `[0, ∞]`.

- `CubicLocalSpecification.archimedeanMass`: `m_∞(Σ_∞) = Σ_{R ∈ Σ_∞} 1/#Aut(R) ∈ {0, 1/6, 1/2, 2/3}`.

Proof: Represent `Σ_p` as a `GL₂(ℤ_p)`-invariant subset of `V_{ℤ_p}` of forms of nonzero discriminant (Delone-Faddeev over `ℤ_p`, Layer 1) and `Σ_∞` as a subset of the two real orbits; the predicates are statements about all but finitely many `p`. The three standard specifications: 'all orders' (`Σ_p =` everything, `Σ_∞ =` both), 'maximal' (`Σ_p =` the `p`-adic closure of `U_p`, equivalently its residue preimage modulo `p²`) and 'maximal and not totally ramified' (`Σ_p =` the `p`-adic closure of `V_p`, equivalently its residue preimage modulo `p²`); each is strongly acceptable, and strongly acceptable implies acceptable. The prototype must use the full residue preimage modulo `p²`. Requiring one integral `g` congruent to a `p`-adic `f` modulo `p^k` for every `k` would restrict `f` to the countable integral image and would not even be `GL₂(ℤ_p)`-invariant. Equivalently one may use `∀k∃g`, not `∃g∀k`.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [splitting symbol and local sets of binary cubic forms](#splitting-symbol-and-local-sets-of-binary-cubic-forms).

([[5]](#ref-5), Section 1, before Theorem 7, p. 3; [[5]](#ref-5), Remark 4, (57)-(58), p. 25.)

**Checks.**

- The maximal specification is strongly acceptable, hence acceptable.

- `m_p(all maximal cubic ℤ_p-orders) = 1 + 1/p + 1/p²`.

- `m_∞({ℝ³, ℝ ⊕ ℂ}) = 1/6 + 1/2 = 2/3`.

- `m_∞(∅) = 0`, and then there are no `Σ`-orders.

- The specification with `Σ_p = {maximal totally ramified orders}` for every `p` is not acceptable.

- For every prime `p` and `γ∈GL₂(ℤ_p), γ·xy(x−y)` lies in `localMaximal p`. This includes nonintegral `p`-adic coefficients and detects replacing the full `p`-adic set by the image of integral forms.

- The maximal specification recovers Theorem 1 and the nowhere-totally-ramified one Theorem 2 in the density theorem.

- `m_p(all maximal) = 1 + 1/p + 1/p²` (BST (58)) and `m_p(all nondegenerate) = (1 − 1/p)^{−1}(1 − 1/p²)^{−1}` (BST (57)).

- A specification with `Σ_p = {totally ramified maximal orders}` for infinitely many `p` is not acceptable.

<a id="p-adic-density-of-a-local-specification"></a>

**P adic density of a local specification.** For a prime `p` and a set `Σ_p` of isomorphism classes of nondegenerate cubic rings over `ℤ_p`, the set `S_p(Σ_p) := {x ∈ V_{ℤ_p} : R(x) ∈ Σ_p}` has Haar measure `μ_p(S_p(Σ_p)) = (#GL₂(𝔽_p)/p⁴) Σ_{R ∈ Σ_p} 1/(Disc_p(R) · #Aut_{ℤ_p}(R)) = (1 − p^{−2})(1 − p^{−1}) m_p(Σ_p)`, with `μ_p` normalised to give `V_{ℤ_p}` measure 1.

`p` prime; `Σ_p` consists of nondegenerate rings (each `GL₂(ℤ_p)`-orbit then has positive measure) `Aut` is the automorphism group of `R` as `a ℤ_p`-algebra, equal to the `GL₂(ℤ_p)`-stabilizer of a corresponding form (Delone-Faddeev over `ℤ_p`, Layer 1)

Proof: by Delone-Faddeev over `ℤ_p, S_p(Σ_p)` is the disjoint union over `R ∈ Σ_p` of the `GL₂(ℤ_p)`-orbits `GL₂(ℤ_p)·v_R`, with `Stab(v_R) ≅ Aut(R)`. Every nondegenerate `GL₂(ℤ_p)`-orbit is open by the invertible derivative over `Q_p`. In the second-countable coefficient space there are at most countably many disjoint open orbits. Thus the sum over any `Σ_p` is a countable sum of measurable disjoint sets; apply countable additivity and `#GL₂(𝔽_p)=(p²−1)(p²−p)`. This also proves local mass convergence by the total coefficient mass bound.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [acceptable local specifications for cubic orders](#acceptable-local-specifications-for-cubic-orders), [densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms), `Matrix.card_GL_field` (Mathlib), AnalyticNumberTheoryPartII §§5.8, 5.21 and 5.28.

([[5]](#ref-5), Lemma 32 and its proof, p. 25.)

**Checks.**

- `Σ_p =` all maximal orders: `(p² − 1)(p² − p)p^{−4}(1 + 1/p + 1/p²) = (p³ − 1)(p² − 1)/p⁵ = μ_p(U_p)`, agreeing with Lemma 19.

- `Σ_p =` all nondegenerate orders: the density is 1, which gives BST (57).

- `Σ_p = {ℤ_p³}: #Aut = 6, Disc_p = 1`, density `(p² − 1)(p² − p)/(6p⁴) = μ_p(T_p(111))` (Lemma 17).

<a id="density-of-cubic-orders-with-local-specifications"></a>

**Density of cubic orders with local specifications.** Let `Σ = (Σ_p) ∪ Σ_∞` be an acceptable collection of local specifications ([acceptable local specifications for cubic orders](#acceptable-local-specifications-for-cubic-orders)) and `N₃(Σ; X)` the number of isomorphism classes of orders `R` in cubic fields with `R ⊗ ℤ_p ∈ Σ_p` for all `p, R ⊗ ℝ ∈ Σ_∞` and `|Disc(R)| < X`. Then `N₃(Σ; X) = (1/2)(Σ_{R∈Σ_∞} 1/#Aut(R)) · ∏_p ((p − 1)/p · Σ_{R∈Σ_p} 1/(Disc_p(R) #Aut(R))) · X + o(X)`. Equivalently (BST Theorem 31), for `S(Σ, i)` the irreducible forms of `V_Z^{(i)}` whose ring is a `Σ`-order, `lim_X N(S(Σ, i); X)/X = (1/(2 n_i)) ∏_p (p − 1)/p · m_p(Σ_p)`.

`Σ` must be acceptable; the condition at `p` is on `R ⊗ ℤ_p` The count is of orders, not fields; fields are the case `Σ_p =` maximal for all `p` The Euler product converges because `Σ` is acceptable (the `p`-factor is `1 + O(p^{−2})` for large `p`)

Proof: Each nondegenerate `GL₂(ℤ_p)`-orbit is open, and the complement of a union of such orbits is open within `Disc≠0`. Hence the indicator of any local specification is locally constant off the Haar-null hypersurface `Disc=0`. It need not be determined by one fixed modulus `p^n`. Approximate at each of the finitely many small primes by cylinder infima and suprema; their integrals converge. Use the corrected weighted sieve of Layer 2 with `X→∞`, then `n→∞` for the finite local approximations, then the prime cutoff `→∞`. For all large `p`, violation of `Σ_p` implies nonmaximality or total ramification, hence `p²|Disc`. The Layer 2 uniform tail estimate for binary cubic discriminants therefore controls the entire tail of orders directly. This avoids asserting a per-prime `O(X/p²)` bound for nonmaximal-at-other-primes forms from the field-only lemma. Cyclic cubic stabilizers contribute `o(X)`, so the weighted and unweighted main terms agree. Insert Lemma 32: `π²/(12 n_i) ∏_p μ_p(S_p(Σ_p)) = π²/(12 n_i) ∏_p (1 − p^{−2})((p − 1)/p) m_p(Σ_p) = (1/(2 n_i)) ∏_p ((p − 1)/p) m_p(Σ_p)`, using `∏_p (1 − p^{−2}) = 6/π²`. Sum over `i ∈ Σ_∞` with `1/n_i = 1/#Aut(R)` for `R = ℝ³ (i = 0)` or `ℝ ⊕ ℂ (i = 1)`.

*Needs:* [acceptable local specifications for cubic orders](#acceptable-local-specifications-for-cubic-orders), [p adic density of a local specification](#p-adic-density-of-a-local-specification), [densities of maximal and nowhere totally ramified forms](#densities-of-maximal-and-nowhere-totally-ramified-forms), [cubic fields totally ramified at large primes are sparse](#cubic-fields-totally-ramified-at-large-primes-are-sparse), [maximal irreducible cubic rings are rings of integers of cubic fields](#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [ArithmeticStatisticsPartIII: uniformity estimate for binary cubic discriminants](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-binary-cubic-discriminants), `riemannZeta_two` (Mathlib), `riemannZeta_eulerProduct_tprod` (Mathlib).

([[5]](#ref-5), Theorem 8, p. 3; [[5]](#ref-5), Theorem 31 and the paragraph after it, p. 25.)

**Checks.**

- `Σ_p =` all maximal, `Σ_∞ = {ℝ³}: (1/12) ∏_p (1 − 1/p)(1 + 1/p + 1/p²) = 1/(12ζ(3))`, Theorem 1.

- `Σ_p =` all nondegenerate orders: `(1/(2n_i)) ∏_p (1 − p^{−2})^{−1} = ζ(2)/(2 n_i) = π²/(12 n_i)`, i.e. `π²/72` and `π²/24` (BST Theorem 6 main term).

- `Σ_p =` maximal not totally ramified: `(1/(2n_i)) ∏_p (1 − 1/p)(1 + 1/p) = 3/(n_i π²)`, the count used for Theorem 2.

### 3.5 Secondary terms for cubic fields and torsion

<a id="roberts-second-order-term-for-cubic-fields"></a>

**Roberts second order term for cubic fields.** `FieldStatistics.roberts_cubicFieldsSecondary` states both signed secondary terms with the displayed error exponent. `N₃(0, X) = X/(12ζ(3)) + (4ζ(1/3)/(5Γ(2/3)³ζ(5/3))) X^{5/6} + O_ε(X^{5/6−1/48+ε})` and `N₃(−X, 0) = X/(4ζ(3)) + (√3 · 4ζ(1/3)/(5Γ(2/3)³ζ(5/3))) X^{5/6} + O_ε(X^{5/6−1/48+ε})`, for every `ε > 0`.

The second main term has order `X^{5/6}`; the error `O_ε(X^{5/6−1/48+ε})` is a power saving over it when `ε<1/48` Use cusp slicing and smoothing, the secondary `p`-adic index integrals and the three-range sieve in Layer 2.

Proof: Count forms in dyadic ranges of the discriminant with the second-order count of binary cubic forms satisfying finitely many congruence conditions (BST Theorem 27, the congruence version of the Davenport-Shintani count; uniform lattice counts of Layer 2). Compute the second-order `p`-adic densities `μ₂(σ, p), μ₂(p), μ₂'(p)` (BST Section 7) and the second-order local masses (BST Lemma 37). Sieve with the Möbius identities (61)-(62) over squarefree `n`, splitting `n` into three ranges: Theorem 27 with the identities of BST Proposition 33 for small `n`, the uniformity estimates of Belabas-Bhargava-Pomerance for large `n`, and an equidistribution argument (BST Section 9.4) for `n` near `X^{1/6}`.

*Needs:* [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: cubic secondary congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count), [ArithmeticStatisticsPartIII: cubic secondary sieve error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error).

([[5]](#ref-5), Theorem 3, (3), p. 2.)

**Checks.**

- The second-term constant is negative `(ζ(1/3) < 0)`, explaining the poor early numerical agreement with Theorem 1 noted in BST Section 1.

- The ratio of the `X^{5/6}` coefficients (negative : positive discriminant) is `√3`, while the ratio of main terms is 3.

- The imported sieve requires strong acceptability; an arbitrary infinite collection of cubic local conditions cannot be substituted in the secondary specialization.


<a id="second-order-term-for-the-mean-of-three-torsion"></a>

**Second order term for the mean of three torsion.** `FieldStatistics.davenportHeilbronn_threeTorsionSecondary` states the signed three-torsion sums with their secondary Euler-product constant and error. `Σ_{0<D<X} #Cl₃(D) = (4/3) Σ_{0<D<X} 1 + (8ζ(1/3)/(5Γ(2/3)³)) ∏_p (1 − (p^{1/3} + 1)/(p(p + 1))) X^{5/6} + O_ε(X^{5/6−1/48+ε})` and `Σ_{−X<D<0} #Cl₃(D) = 2 Σ_{−X<D<0} 1 + (√3 · 8ζ(1/3)/(5Γ(2/3)³)) ∏_p (1 − (p^{1/3} + 1)/(p(p + 1))) X^{5/6} + O_ε(X^{5/6−1/48+ε})`, the sums over fundamental discriminants `D` of quadratic fields.

The second main term has order `X^{5/6}`; the error `O_ε(X^{5/6−1/48+ε})` is a power saving over it when `ε<1/48` Use cusp slicing and smoothing, the secondary `p`-adic index integrals and the three-range sieve in Layer 2.

Proof: Count forms in dyadic ranges of the discriminant with the second-order count of binary cubic forms satisfying finitely many congruence conditions (BST Theorem 27, the congruence version of the Davenport-Shintani count; uniform lattice counts of Layer 2). Compute the second-order `p`-adic densities `μ₂(σ, p), μ₂(p), μ₂'(p)` (BST Section 7) and the second-order local masses (BST Lemma 37). Sieve with the Möbius identities (61)-(62) over squarefree `n`, splitting `n` into three ranges: Theorem 27 with the identities of BST Proposition 33 for small `n`, the uniformity estimates of Belabas-Bhargava-Pomerance for large `n`, and an equidistribution argument (BST Section 9.4) for `n` near `X^{1/6}`.

*Needs:* [davenport heilbronn mean of three torsion](#davenport-heilbronn-mean-of-three-torsion), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [count of quadratic fields](#count-of-quadratic-fields), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions), [ArithmeticStatisticsPartIII: cubic secondary congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count), [ArithmeticStatisticsPartIII: cubic secondary sieve error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error).

([[5]](#ref-5), Theorem 4, (4), p. 2.)

**Checks.**

- The Euler product `∏_p (1 − (p^{1/3} + 1)/(p(p + 1)))` converges absolutely (the `p`-term is `1 + O(p^{−5/3})`).

- The main terms are Theorem 2's constants `4/3` and 2 times the quadratic-field counts.

- The numerator ranges over fundamental discriminants. Counting all quadratic orders instead would change both the family and the secondary Euler product.


<a id="second-order-term-for-cubic-orders-with-local-specifications"></a>

**Second order term for cubic orders with local specifications.** Let `Σ = (Σ_p) ∪ Σ_∞` be strongly acceptable. For a free `Z_p`-module `M` put `M^{Prim} := M \ pM`. Then `N₃(Σ; X) = (1/2)(Σ_{R∈Σ_∞} 1/#Aut(R)) ∏_p ((p − 1)/p · Σ_{R∈Σ_p} 1/(Disc_p(R) #Aut(R))) X + (1/ζ(2))(Σ_{R∈Σ_∞} c₂(R)) ∏_p ((1 − p^{−1/3}) Σ_{R∈Σ_p} (1/(Disc_p(R) #Aut(R))) ∫_{(R/Z_p)^{Prim}} i(x)^{2/3} dx) X^{5/6} + O_ε(X^{5/6−1/48+ε})`, where `i(x)` is the index of `Z_p[x]` in `R, dx` gives `(R/Z_p)^{Prim}` measure 1, and `c₂(ℝ³) = √3 ζ(2/3)Γ(1/3)(2π)^{1/3}/(30Γ(2/3)), c₂(ℝ ⊕ ℂ) = ζ(2/3)Γ(1/3)(2π)^{1/3}/(10Γ(2/3))`.

This is the import contract of [ArithmeticStatisticsPartIII §2.11, refinement-cubic-secondary-sieve-error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error), using its [refinement-cubic-secondary-congruence-count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count). Retain strong acceptability, the primitive quotient measure and the null-set convention for infinite index. The supplier owns the local integrals, switching and optimization. This part specializes the result to maximal cubic fields and quadratic class-group torsion.

*Needs:* [ArithmeticStatisticsPartIII: cubic secondary sieve error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error), [ArithmeticStatisticsPartIII: cubic secondary congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count), [acceptable local specifications for cubic orders](#acceptable-local-specifications-for-cubic-orders).

([[5]](#ref-5), Theorem 7, (7), p. 3.)

**Checks.**

- All orders: the second term is `c₂^{(i)} X^{5/6}`, BST Theorem 6 (Shintani's second term).

- All maximal orders: Theorem 3's second term; maximal not totally ramified: Theorem 4's.

- A primitive quotient element need not generate the cubic algebra. Its index is infinite on a null set; the imported integral uses the locally integrable singularity `|t|_p^(−2/3)`, not a uniform bound at the roots.

### 3.6 Classical quadratic and cubic orbit counts

<a id="mertens-count-of-positive-definite-binary-quadratic-forms"></a>

**Mertens count of positive definite binary quadratic forms.** `FieldStatistics.mertens_positiveDefiniteForms` states the unweighted count on Tau Ceti’s native positive definite `SL₂(ℤ)`-orbit classes. For `D < 0` let `h⁺(D)` be the number of `SL₂(ℤ)`-equivalence classes of positive definite integral binary quadratic forms `a x² + b x y + c y² (a > 0)` of discriminant `b² − 4ac = D`, all forms counted (primitive or not). Then `Σ_{−X<D<0} h⁺(D) = (π/18) X^{3/2} + O(X log X)`.

Positive definite forms only: counting the negative definite classes as well doubles the sum Non-primitive forms are included (they are irreducible over `ℚ`); the primitive count has constant `(π/18)/ζ(3)` Classes, not weighted classes: the forms `x² + y²` and `x² + xy + y²` and their multiples are counted with weight 1 (Hurwitz's weights `1/2, 1/3` change only lower-order terms)

Proof: Reduction: every positive definite form is `SL₂(ℤ)`-equivalent to exactly one reduced form (`|b| ≤ a ≤ c`, with `b ≥ 0` if `|b| = a` or `a = c`). Write `f = a(x − τy)(x − τ̄y)` with `τ` in the upper half plane; `SL₂(ℤ)` acts on `τ` by Möbius transformations, and `f` is reduced iff `τ` lies in the closed fundamental domain `ModularGroup.fd` with the boundary identified (`ModularGroup.exists_smul_mem_fd`, `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo`). The canonical representatives are those pinned in ModularForms Layer 11. Counting: `h⁺` summed over `−X < D < 0` is the number of integer triples `(a, b, c)` with `|b| ≤ a ≤ c, 4ac − b² < X` and the boundary convention. Slice by `a: a ≤ √(X/3)`, and for each `(a, b)` the number of `c` is `max(0, (X + b²)/(4a) − a) + O(1)`; summing over `|b| ≤ a` and `a ≤ √(X/3)` gives the integral `V(X)` over the actual nonempty slices plus `O(X log X)` (the `O(1)` terms contribute `O(X)`, the Riemann-sum error in `b` and `a` contributes `O(X log X)`). Volume: in coordinates `(a, τ = x + iy), b = −2ax, c = a|τ|²`, the Jacobian is `4a²y` and the discriminant condition is `4a²y² < X`, so `V(X) = ∫_{fd} ∫_0^{√X/(2y)} 4a²y da dx dy = (X^{3/2}/6) ∫_{fd} dx dy / y² = (X^{3/2}/6)(π/3) = (π/18) X^{3/2}`, using the hyperbolic area `∫_{−1/2}^{1/2} ∫_{√(1−x²)}^∞ dy dx / y² = 2 arcsin(1/2) = π/3`.

*Needs:* `ModularGroup.fd` (Mathlib), `ModularGroup.exists_smul_mem_fd` (Mathlib), `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` (Mathlib).

([[1]](#ref-1), Theorem 1.4(a) and footnote 1, p. 3.)

**Checks.**

- Numerical check: the number of reduced positive definite forms with `4ac − b² < X` is 172131, 5494441, 44054144 for `X = 10⁴, 10⁵, 4·10⁵`, i.e. 0.17213, 0.17375, 0.17414 times `X^{3/2}`, against `π/18 ≈ 0.17453`.

- Small values: `h⁺(−3) = h⁺(−4) = 1, h⁺(−12) = 2` (`x² + 3y²` and `2x² + 2xy + 2y²`), `h⁺(−16) = 2` (`x² + 4y²` and `2x² + 2y²`).

- The constant is `(1/6) ×` area `(SL₂(ℤ)\H) = (1/6)(π/3)`.

<a id="quadratic-character-interval-bound"></a>

**Quadratic-character interval bound.** There is an absolute `C>0` such that every primitive nonprincipal quadratic character of conductor `Q>1` has every interval sum at most `C√Q log(2Q)`. Expand the character by its primitive Gauss sum and sum each additive phase over the interval. The primitive transform identity is already `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` and inversion is `ZMod.invDFT_apply`. For the norm `√Q`, factor the quadratic conductor into distinct odd primes and a factor1,4 or8. Chinese remaindering factors the Gauss sum; `star_gaussSum_eq` and `gaussSum_mul_gaussSum_eq_card` give norm `√p` at each odd prime, and the finite four/eight-term sums give the dyadic norm. This proves the composite-conductor norm used here without treating a finite-field theorem as a theorem over every ZMod `Q`. For nonzero frequency `a` the geometric sum is at most `min(H,(2‖a/Q‖)⁻¹)`. Pair `a` and `Q−a` and sum the harmonic bound. Full periods vanish. The same bound holds on a progression of step coprime to `Q` by changing the additive frequencies. This is also the character-sum input used by the quadratic-order means above; it is not a prime-distribution assertion. Quadratic reciprocity and the finite character interfaces are reused; the interval bound is the additional target proved here.

Source: the primitive transform and inversion in `Mathlib.Analysis.Fourier.ZMod`, `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` and `ZMod.invDFT_apply`; the Gauss identities `star_gaussSum_eq` and `gaussSum_mul_gaussSum_eq_card` in `Mathlib.NumberTheory.GaussSum`. The argument above supplies the conductor factorization and interval estimate from these identities.

**Checks.**

- The nonprincipal character modulo three sums to zero on a complete period and to one on the singleton `{1}`.
- A principal character has unbounded interval sums and is excluded.
- A progression with step coprime to the conductor preserves the bound; a progression of step divisible by the conductor need not cancel.

<a id="siegel-count-of-indefinite-binary-quadratic-forms"></a>

**Siegel count of indefinite binary quadratic forms.** `FieldStatistics.siegel_indefiniteForms` states the weighted primitive-class mean. `FieldStatistics.primitiveQuadraticClassNumber` uses the native binary-form orbit classes, and `FieldStatistics.quadraticOrderNormOneRegulator` is the positive norm-one period from the displayed Pell equation. For positive nonsquare discriminants `D≡0` or `1 (mod4)`, let `h_D^prim` be the number of `SL₂(ℤ)`-classes of primitive integral binary quadratic forms of discriminant `D`, and `ε_D=(t+u√D)/2` for the least positive solution of `t²− Du ²=4`. Then `Σ_{0<D<X} h_D^prim log ε_D = π² X^{3/2}/(18ζ(3)) + O(X log X)`. Equivalently, counting all forms with each class weighted by the regulator of its primitive part gives `Σ_{g≥1,D>0,g²D<X} h_D^prim log ε_D ~ (π²/18)X^{3/2}`. The all-form class number at `D` multiplied by a single `log ε_D` is not this stabilizer-weighted count.

Primitive means `gcd(a,b,c)=1`. The regulator attached to an imprimitive form of content `g` is `log ε_{D/g²}`, not `log ε_D`. The class number is the strict class number of the quadratic order of discriminant `D`. The positive norm-one unit convention is fixed. Use the primitive order-class theorem and its norm-one regulator, rather than a uniform regulator on imprimitive forms.

Proof: first compare a primitive form with the strict ideal class of its quadratic order. Its positive stabilizer modulo `{±I}` has eigenvalue `ε_D`. If `D=D₀f²`, the order-class exact sequence and the index of its totally positive units give

`h_D^prim log ε_D = f h_(D₀)^prim log ε_(D₀) ∏_(p|f)(1−χ_(D₀)(p)/p) = √D L(1,χ_D)`.

Here `χ_D` is the possibly imprimitive Kronecker character, and the last equality uses the existing field class-number formula. The unit index cancels between the order class number and regulator. This comparison is required for nonfundamental `D`; using the maximal-order regulator for every `f` fails.

The analytic all-order quadratic L-value target is

`Σ_(0<D≤T, D≡0,1 mod4, D nonsquare) L(1,χ_D) = (ζ(2)/(2ζ(3)))T + O(√T log(2T))`.

It has the following direct character-sum proof, so the displayed Siegel mean does not depend on obtaining Siegel's original article. Truncate each nonprincipal `L`-series at `N=⌊T⌋`. Pólya–Vinogradov, including the imprimitive character obtained by deleting Euler factors, bounds the total truncation error by `O(T^(3/2)log(2T)/N)`. To see uniformity, write `D=D₀f²` and expand the deleted factors; the character partial-sum bound is `O(τ(f)√D₀ log(2D₀))=O(√D log(2D))`. For integer `n≤N`, sum `χ_D(n)` over the two classes `D≡0,1 mod4`, initially allowing square `D`. If `n=m²`, its mean is `ρ(n)=φ(m)/(2m)` with error `O(τ(m))`; for even `m` only `D≡1 mod4` contributes, which gives this same formula. If `n=bc²` with `b>1` squarefree, use the nonprincipal quadratic character of the odd part of `b`, splitting into classes modulo eight when `b` is even. The progression step is invertible modulo that odd part. When `b=2`, the remaining sequence on `D≡1 mod4` is alternating, with partial sums bounded by one; it is not treated as a nonexistent nonprincipal character modulo two. Delete the coprimality factors from `c` by inclusion–exclusion. These cases give the common bound `O(τ(c)√b log(2b))`. Consequently the nonsquare-`n` contribution, after division by `n`, is

`O(Σ_(c≤√N) τ(c)c⁻² Σ_(b≤N/c²) b⁻¹/² log(2b)) = O(√N log(2N))`,

since `Στ(c)c⁻³` converges. Removing the `O(√T)` square values of `D` costs `O(√T log(2N))`; this step occurs in the truncated sum, never in a divergent principal `L`-series. The diagonal coefficient is

`Σ_(m≥1) ρ(m²)/m² = (1/2)Σ φ(m)/m³ = ζ(2)/(2ζ(3))`.

Truncating this convergent sum at `√N` costs `O(T/√N)`. Take `N=⌊T⌋` for `T≥2`, and absorb smaller `T` into the constant. Abel summation with the weight `√D` now gives `(2/3)(ζ(2)/(2ζ(3)))X^(3/2)` and error `O(X log(2X))`, the required constant and error. No limiting interchange at `s=1` is needed. For the all-form corollary write each form uniquely as `g` times a primitive form. Its stabilizer is unchanged and its discriminant is `g²D`. Sum at `X/g²; Σg⁻³=ζ(3)` changes the leading constant to `π²/18`, and dominated convergence controls the tail. Source [137], pp.185–186, fixes the order-class convention and conductor comparison; the analytic argument above supplies the all-order mean directly from quadratic character sums and partial summation.

*Needs:* `NumberField.dedekindZeta_residue` (Mathlib), `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (Mathlib), `NumberField.Units.regulator` (Mathlib), [quadratic-character interval bound](#quadratic-character-interval-bound).

([[1]](#ref-1), Theorem 1.4(b), p. 3; [[54]](#ref-54), Section1.1, printed578–579, Theorem1.2(2).)

**Checks.**

- For fundamental `D > 0` and primitive forms: `h⁺(D) log ε⁺_D = 2 h(D) R(D) = √D · dedekindZeta_residue(ℚ(√D))`, since the residue is `2² h R/(2√D)`.

- `D = 5`: one class `(x² + xy − y²), ε₅ = (3 + √5)/2, log ε₅ ≈ 0.9624`.

- For `q=x²+xy−y²` and `2q`, the matrix [[1,1],[1,2]] stabilizes both. Their discriminants are5 and20, but `ε20=9+4√5=ε5³`. Thus assigning `log ε20` to the class of `2q` overstates its actual primitive stabilizer period by3.

<a id="quoted-classical-counts-for-binary-quadratic-and-cubic-forms"></a>

**Quoted classical counts for binary quadratic and cubic forms.** (Theorem 1.4, Mertens 1874 / Siegel 1944, corrected) With `h⁺(D)` the number of `SL₂(ℤ)`-classes of positive definite integral binary quadratic forms of discriminant `D < 0` and `h_D^prim` the number of `SL₂(ℤ)`-classes of primitive integral binary quadratic forms of non-square discriminant `D > 0: Σ_{−X<D<0} h⁺(D) ~ (π/18) X^{3/2}`, and `Σ_{0<D<X} h_D^prim log ε_D ~ (π²/(18ζ(3))) X^{3/2}`, where `ε_D = (t + u√D)/2` with `t, u` the smallest positive integral solutions of `t² − D u² = 4`. (Theorem 1.5, Davenport 1951) With `h(D)` the number of `GL₂(ℤ)`-classes of irreducible integral binary cubic forms of discriminant `D: Σ_{−X<D<0} h(D) ~ (π²/24) X` and `Σ_{0<D<X} h(D) ~ (π²/72) X`. Via Delone-Faddeev, classes of irreducible integral binary cubic forms correspond to orders in cubic fields, so Theorem 1.5 counts cubic orders by discriminant.

`h⁺(D)` counts positive definite classes only: the printed `h_D` ('irreducible forms of discriminant `D'`) would include the negative definite classes and give `(π/9) X^{3/2}` The indefinite count uses primitive forms and their norm-one regulators; the all-form version instead weights each class by the regulator of its primitive part and has constant `π²/18`. These two valid conventions must not be mixed. The cubic statement is about `GL₂(ℤ)`-classes, and irreducibility is required; reducible forms are excluded The Delone-Faddeev correspondence is with ORDERS in cubic fields (including non-maximal ones), not with cubic fields

Proof: Imaginary quadratic part: [mertens count of positive definite binary quadratic forms](#mertens-count-of-positive-definite-binary-quadratic-forms), with error `O(X log X)`. Real quadratic part: [siegel count of indefinite binary quadratic forms](#siegel-count-of-indefinite-binary-quadratic-forms) (using the primitive order-class and regulator convention). Cubic part: Davenport's theorem is the main term of BST Theorem 20 / Theorem 5, `N(V_Z^{(0)}; X) = (π²/72) X + O(X^{5/6})` and `N(V_Z^{(1)}; X) = (π²/24) X + O(X^{5/6})`, proved by the averaging method of BST Section 5 and supplied by Layer 2 (uniform arithmetic lattice/orbit counts); the order interpretation is Delone-Faddeev ([ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings)) with irreducible forms `↔` domains (BST Proposition 11). These are the exact low-degree cases with which Layer 3's field counts must agree: sieving Davenport's order count to maximal orders gives the Davenport-Heilbronn theorem, and the ratio of the constants is `ζ(2)ζ(3)`.

*Needs:* [mertens count of positive definite binary quadratic forms](#mertens-count-of-positive-definite-binary-quadratic-forms), [siegel count of indefinite binary quadratic forms](#siegel-count-of-indefinite-binary-quadratic-forms), [ArithmeticStatisticsPartIII: davenport count of binary cubic forms](../ArithmeticStatisticsPartIII/README.md#davenport-count-of-binary-cubic-forms), [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings).

([[1]](#ref-1), Theorem 1.4 and Theorem 1.5 with the surrounding interpretation, printed pp. 3-4; [[5]](#ref-5), Theorem 20, p. 9.)

**Checks.**

- Consistency check: Theorem 1.6 (quartic) has main term of order `X^{5/6}` in the height, while Theorems 1.4 and 1.5 have `X^{3/2}` and `X` in the discriminant; the orderings are by different invariants and must not be compared directly.

- Weight check: the quadratic count is by `SL₂(ℤ)`-classes, the cubic and quartic counts by `GL₂(ℤ)`-classes; the group must be recorded.

- Regulator check: in the real quadratic case the sum is weighted by `log ε_D`, and no unweighted asymptotic for `h_D` alone is asserted.

- Sign check: numerically, the reduced positive definite forms with `4ac − b² < 4·10⁵` number `0.17414 X^{3/2}`, against `π/18 ≈ 0.17453`; including the negative definite classes would double this.

### 3.23 Rigid fields and relative torsion

<a id="rigid-embedded-field-family"></a>

**Rigid embedded field family.** Fix a number field `k`, its algebraic closure, `n≥1` and a transitive subgroup `G≤S_n`. A rigid `G`-field consists of a finite degree-`n` intermediate field `K/k` in that algebraic closure and a bijection `e:Hom_k(K,kbar)→ Fin n` for which the transported Galois-action image is exactly `G`. Count these pairs by absolute discriminant. The underlying fields are embedded fields; conjugate fields and different labelings are retained. `Aut_perm(G)` is the normalizer `N_{S_n}(G)`, not the abstract automorphism group of `G`. Group-signature restrictions use conjugacy classes of complex conjugation at the real base places.

`k` is a number field; `n≥1; G≤S_n` is transitive; all fields use the fixed algebraic closure.

The development requires:

- The embedded degree-`n` field and its compatible numbering of embeddings.

- Forget the numbering to an actual intermediate field of `kbar /k`.

- The normalizer of `G` acts on labels by postcomposition; identity and composition laws hold.

- Cardinality of the absolute-discriminant-bounded rigid pairs, with isomorphism-invariant local conditions supplied by a selection predicate.

- The rigid count is `|N_{S_n}(G)|` times the embedded-field count.

- It is the sum over field isomorphism classes of `|N_{S_n}(G)| n/|Aut_k K|`.

- Increasing the discriminant bound or enlarging the local condition increases the count.

Proof: Use the embedding-action predicate, keeping its numbering rather than existentially discarding it. Prove the labels over a fixed admissible embedded field form a normalizer torsor. Use Hermite finiteness for the underlying fields and finiteness of labels to obtain the height count.

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartI: number fields ordered by discriminant](../ArithmeticStatisticsPartI/README.md#number-fields-ordered-by-discriminant), `NumberField.discr` (Mathlib), `NumberField.finite_of_discr_bdd` (Mathlib).

([[95]](#ref-95), §1 notation, p.2; Definition6.7 and Lemma6.8, pp.33–34.)

**Checks.**

- For `n=1,G=1` the only field is `k`; the count is1 above its absolute discriminant and0 below.

- Each quadratic field contributes two rigid pairs: it has one embedded copy and two compatible labels.

- A non-Galois `S₃` cubic isomorphism class contributes18 rigid pairs: three embedded copies, each with six labels. Counting only abstract automorphisms would give a wrong multiplicity.

- A singleton field with absolute discriminant `D` contributes zero for `X<D` and its full label multiplicity at `X=D`.

<a id="relative-torsion-splitting"></a>

**Relative torsion splitting.** For a finite extension `L/K` of number fields and a prime `ℓ` not dividing `d=[L:K]`, the norm and extension maps split `Cl_L[ℓ]` as `Cl_{L/K}[ℓ]×Cl_K[ℓ]`. Hence `h_ℓ(L)=h_ℓ(L/K)h_ℓ(K)`. In a tower of quadratic extensions `h₃` therefore factors over all steps. `Cl_{L/K}` is the kernel of the native relative class-group norm, not a second class-group carrier. The same splitting and cardinal factorization hold for `Cl⁺` using ideal norm and extension on the native narrow class groups: total positivity makes both maps descend, and their composite is the dth power. Define the relative narrow group as this norm kernel.

`L/K` is finite; `ℓ` is prime and `ℓ∤[L:K]`.

The relative narrow class group is the kernel of the narrow norm, with its norm-one membership criterion and the degree-power identity for norm after extension. Require product isomorphisms on ordinary and narrow `ℓ`-torsion and their cardinality consequences. The ordinary cardinality statement applies to module-finite torsion-free extensions of Dedekind domains with finite class groups, with degree `Module.finrank R S`; integer rings give the number-field specialization. The section is extension followed by exponentiation by the inverse of `d` modulo `ℓ`, so its composite with norm is the identity on `ℓ`-torsion; extension by itself is generally not that section.

Proof: Use `norm∘extension=power d` on the native class group. Invert `d` on its `ℓ`-torsion by Bézout and construct a section of norm. Split the finite abelian group by kernel and section, and take cardinalities. For the narrow version first descend norm and extension through totally positive principal ideals. At a real base place, norms of totally positive elements are positive, including the positive contributions of complex conjugate pairs. Then repeat the same finite-group splitting.

*Needs:* [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), `ClassGroup.extendedHom` (Mathlib), `ClassGroup.relNorm` (Tau Ceti), `ClassGroup.relNorm_comp_extendedHom` (Tau Ceti).

([[95]](#ref-95), §2, p.7, norm/extension exact sequence; [[92]](#ref-92), Theorem6(b), pp.4–5; §10.1, pp.29–30.)

**Checks.**

- For a quadratic tower step and `ℓ=3`, degree2 is invertible on torsion. The assertion deliberately excludes `ℓ=2`.
- For `L=K`, the norm is the identity, both relative kernels are trivial, and the product formula is `h_ℓ(K)=1·h_ℓ(K)`.
- For `K=ℚ`, ordinary and narrow base class groups are trivial, so relative torsion equals absolute torsion in each convention. This does not identify the ordinary and narrow groups of `L`.
- On the abstract torsion group `C₃` with `d=2`, take norm to be the identity and extension to be inversion; their composite is squaring. Raising the extension value to 2 gives the identity section, whereas extension alone is not a section. For `ℓ|d` the degree-power map on `C_ℓ` is trivial and cannot give a section.


### 3.21 S-integral orbits and relative mass ratios

<a id="low-degree-s-integral-parametrization"></a>

**Low degree s integral parametrization.** For a number field `F, n∈{2,3,4,5}` and finite `S` containing the infinite places and the places above 2 when `n=2`, separable degree-`n` extensions correspond to the disjoint union of `Γ_β`-orbits of `S`-maximal elements of `L_β`, over the finite double-coset set `G_n(O^S)\G_n(A^S)/G_n(F)`. Here `L_β=V_n(F)∩β^{-1}(∏_{v∉S}V_n(O_v)×∏_{v∈S}V_n(F_v))` and `Γ_β` is the analogous conjugated integral subgroup. The stabilizer is `Aut_F(L)`, and `Disc_S(L)=(χ(β)²Δ_n(v))` as fractional `O_S` ideals, with the idele character interpreted componentwise.

Proof: Import the cubic, quartic-resolvent and quintic orbit parametrizations from Layer 1, including maximal-order stabilizers. For `n=2` use `G_m` acting on `G_a` by `g·v=g²v`, the squareclass algebra `F[t]/(t²−v/4)`, and maximal quadratic orders with2 inverted. Patch the local maximal elements using the finite adelic double-coset decomposition. Maximal local orders force a rational conjugating element to be integral in the same adelic lattice; the determinant character identifies the discriminant and Steinitz class.

*Needs:* [ArithmeticStatisticsPartII: delone faddeev parametrization of cubic rings](../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings), [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), [ArithmeticStatisticsPartII: bhargava parametrization of quintic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quintic-rings), AdelicAlgebraicGroups:AA.0.

([[92]](#ref-92), §3, Theorems3.1–3.4, pp.9–12.)

**Checks.**

- For `n=2, S` contains all primes over `2; v` and `g²v` give the same quadratic algebra and `Δ₂(v)=v` gives its localized discriminant ideal. For `n>2` use the respective Layer 1 parametrizations.

<a id="low-degree-maximal-sieve"></a>

Use [ArithmeticStatisticsPartIII §2.10, refinement-global-field-large-prime-tail](../ArithmeticStatisticsPartIII/README.md#refinement-global-field-large-prime-tail), specialized to the number-field representations and adelic lattices above. Retain stabilizer weights, `M≥2`, the uniform `o(X)`, the empty quadratic extra-ramification locus and the fixed commensurable-lattice comparison. The at-most-ten local fibres and the tail proof belong to that supplier. Source: [[92]](#ref-92), §5, Theorems5.1–5.3 and (29), pp.18–20; quadratic case §9.3 p.27.

<a id="low-degree-jacobian-mass"></a>

**Low degree jacobian mass.** For the BSW degree-`n` representation with `n∈{2,3,4,5}`, the orbit map has pullback `π_v^*ω_V=JΔ_n(v)χ²ω_G`, with `J=2` for `n=2` and `J=±1` for `n≥3`. Thus each maximal local orbit contributes `|J|_v/(Disc_v(R)|Aut R|)` times Vol `(G_n(O_v))`; the product of `|J|_v` is one. The final weighted field constant is `κ_F/2` times the product of finite masses `(1−q_v^{-1})Σ_R(Disc_v(R)|Aut R|)^{-1}` and infinite masses `Σ_R|Aut R|^{-1}`.

Proof: Evaluate the Jacobian on the split étale orbit, using its `n!` stabilizer and its reduction modulo every prime. Use change of variables on each local orbit, including the stabilizer divisor. Sum over the adelic double cosets; the Tamagawa number of `G_n` is one, and integration over the positive determinant character gives the factor `1/2`. Restore the places in `S` and cancel `J` by the product formula.

*Needs:* [low degree s integral parametrization](#low-degree-s-integral-parametrization), [ArithmeticStatisticsPartIII: global field large prime tail](../ArithmeticStatisticsPartIII/README.md#refinement-global-field-large-prime-tail), AdelicAlgebraicGroups:AA.2.

([[92]](#ref-92), §7, Propositions7.1–7.3 and §8, pp.21–25.)

**Checks.**

- In degree two, `J=2` has `|J|∞=2` and `|J|₂=1/2`; omitting the dyadic place destroys the product formula. A quadratic field has automorphism weight `1/2`, while a non-Galois `S₃` cubic has weight 1.

<a id="quartic-quintic-density-constants"></a>

**Quartic quintic density constants.** For `S₄` fields over `ℚ` of signature `(r₁,r₂)` with `r₁+2r₂=4`, the coefficient of `X` is `[2r₁!2^{r₂}r₂!]^{-1}∏_p(1+p^{-2}−p^{-3}−p^{-4})`; for `S₅` it is the same archimedean prefactor with `r₁+2r₂=5` and product `∏_p(1+p^{-2}−p^{-4}−p^{-5})`. These are unweighted isomorphism-class counts because these fields have trivial `ℚ`-automorphism groups.

Proof: Evaluate the finite étale local mass using `q(k,n−k)`, the number of partitions of `k` into at most `n−k` parts, as in the explicit formula below. Evaluate the real automorphism group as `S_{r₁}×(C₂≀S_{r₂})`. Apply the low-degree mass theorem and remove non-`S_n` fields using the nongeneric orbit estimate.

*Needs:* [low degree jacobian mass](#low-degree-jacobian-mass).

([[92]](#ref-92), §2.2, (9)–(11), pp.7–8; Theorem1, pp.1–2.)

**Checks.**

- Quartic archimedean prefactors are `1/48,1/8,1/16`.

- Quintic archimedean prefactors are `1/240,1/24,1/16`.

- At `k=0`, `q(0,n)=1` supplies the constant term; partitions of `n>0` into zero parts would give zero.


### 3.24 S-integral orbits and relative mass ratios

<a id="quartic-class-group-two-torsion-fibre"></a>

**Quartic class group two torsion fibre.** For a non-Galois cubic extension `L/F`, the nontrivial order-two characters of `Cl(L)` that annihilate the image of `Cl(F)` under ideal extension correspond to quadratic extensions `L₂/L` unramified at all places whose normal closure over `F` has group `S₄`. Their number is `h₂(L/F)−1`, with `Cl(L/F)=ker(N_{L/F})`; the prime-to-degree splitting identifies the relevant dual quotient. The quartic-resolvent correspondence gives nowhere overramified quartic fields `L₄` with resolvent `L` and `Disc(L₄/F)=Disc(L/F)`. For finite-place unramified extensions replace both class groups by their narrow versions and use `h₂⁺(L/F)−1`.

`L/F` is a separable non-Galois cubic number-field extension. Ordinary class fields split at real places; narrow class fields allow real ramification.

Proof: Use the Hilbert or narrow Hilbert class field to identify order-two characters. Retain precisely the characters trivial on extended base classes; the degree-three norm/extension split gives their count `h₂(L/F)−1` or `h₂⁺(L/F)−1`. Use the `S₄` resolvent correspondence, tracking the normal closure and every real place. The local discriminant equality is equivalent to the stated ramification restriction; the trivial character is excluded.

*Needs:* [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), `TauCetiRoadmap.ClassFieldTheory` Layer 13, [relative torsion splitting](#relative-torsion-splitting).

([[92]](#ref-92), §10.1, proof of Theorem6(b), pp.29–30.)

**Checks.**

- Over `F=ℚ` the base class groups are trivial and the familiar absolute fibre statement is recovered.

- A nontrivial unramified quadratic extension `E/F` pulled back to `L` produces a base character. Its closure over `F` has group `S₃×C₂`, so it is excluded by the condition of annihilating extended base classes.

<a id="low-degree-class-group-mass-ratios"></a>

**Low degree class group mass ratios.** For a positive-density acceptable family over a fixed number field `F` with fixed pure infinite specifications, let `α₂` count real base places with quadratic algebra `ℝ²`, and `α₃` those with cubic algebra `ℝ³`. The means of relative torsion are `h₃(L/F): 1+3^{−r₂(F)−α₂}`; ordinary cubic `h₂(L/F): 1+2^{−r₁(F)−2r₂(F)−α₃}`; and narrow cubic `h₂⁺(L/F): 1+2^{−r₁(F)−2r₂(F)+α₃}`. At finite places the compatible fibre numerator/denominator mass ratio is one. The absolute `h₃(L), h₂(L), h₂⁺(L)` means are these expressions multiplied respectively by `h₃(F), h₂(F), h₂⁺(F)`, using the prime-to-degree norm/extension splitting. Finite specifications must be the matching resolvent-lift specifications, not independent numerator restrictions.

Proof: Apply the relative cyclic-cubic and quartic-resolvent character fibres. Base characters are excluded before applying the `S₃/S₄` count. Use the low-degree mass theorem for numerator and denominator with compatible finite specifications. At complex places the quartic/cubic ratio is `1/4`; at a real `ℝ×ℂ` place it is `1/2`; at `ℝ³` it is `1/4` in the ordinary case and 1 in the narrow case. Account for the quadratic automorphism weight `1/2` separately.

*Needs:* [quartic class group two torsion fibre](#quartic-class-group-two-torsion-fibre), [low degree jacobian mass](#low-degree-jacobian-mass), [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), [relative torsion splitting](#relative-torsion-splitting).

([[92]](#ref-92), Theorem6 and §10.1, (43)–(44), pp.4 and28–30.)

**Checks.**

- Over `ℚ`: real/imaginary quadratic `h₃` means `4/3` and2; totally real/complex cubic ordinary `h₂` means `5/4` and `3/2`, and narrow means2 and `3/2`.

- For a base with `h₃(F)>1` or `h₂(F)>1`, the absolute mean carries the base factor; the relative mean does not.


### 3.7 Low-degree field and relative class-group means

<a id="bhargava-count-of-quartic-fields"></a>

**Bhargava count of quartic fields.** `FieldStatistics.bhargava_quarticQuinticFields` states the signature-specific rational counts in degrees four and five. For `r₂ ∈ {0, 1, 2}` let `N₄^{(r₂)}(X)` be the number of isomorphism classes of quartic fields `K` with Galois group `S₄` (the Galois group of the normal closure, as a permutation group on the four embeddings, is `S₄`), with `r₂` pairs of complex embeddings and `|Disc(K)| < X`, i.e. `N₄(S₄ ∧ (r₂(K) = r₂); −X, X)` in the notation of [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function). Then `N₄^{(0)}(X) ~ (1/48) c₄ X, N₄^{(1)}(X) ~ (1/8) c₄ X` and `N₄^{(2)}(X) ~ (1/16) c₄ X`, where `c₄ = ∏_p (1 + p^{−2} − p^{−3} − p^{−4})`; in total `N₄(S₄; X) ~ (5/24) c₄ X`.

The Galois group restriction is essential: `D₄`-quartic fields also number `≍ X` (Cohen-Diaz y Diaz-Olivier) and are not included The archimedean constants are `1/(2 #Aut_ℝ(K ⊗ ℝ)): #Aut(ℝ⁴) = 24, #Aut(ℝ² ⊕ ℂ) = 4, #Aut(ℂ²) = 8` Use the quartic ring/resolvent dictionary, cusp count and maximal-order sieve of Layers 1–2.

Proof: Source route: BSW Theorem 2 with `F = ℚ, n = 4` and `Σ_∞` one real algebra (the archimedean mass `m_∞ = 1/#Aut`), `Σ_p` all étale quartic `Q_p`-algebras; the local factor `(1 − 1/p) m_p = Σ_{k=0}^{4} (q(k, 4 − k) − q(k − 1, 5 − k)) p^{−k} = 1 + p^{−2} − p^{−3} − p^{−4}` (BSW Theorem 1 with `q(k, m)` the number of partitions of `k` into at most `m` parts; mass formula of Bhargava).

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), [ArithmeticStatisticsPartII: existence and number of cubic resolvents](../ArithmeticStatisticsPartII/README.md#existence-and-number-of-cubic-resolvents), [ArithmeticStatisticsPartII: maximality of quartic rings at p](../ArithmeticStatisticsPartII/README.md#maximality-of-quartic-rings-at-p), [ArithmeticStatisticsPartIII: quartic finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-finite-congruence-count), [ArithmeticStatisticsPartIII: quartic nonmaximal overramified tail](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-nonmaximal-overramified-tail).

([[20]](#ref-20), Theorem 1, p. 2; [[20]](#ref-20), Theorem 2, pp. 2-3; [[20]](#ref-20), Section 1, after Theorem 1, p. 1.)

**Checks.**

- Sum of the signature constants: `1/48 + 1/8 + 1/16 = 10/48 = 5/24 = (1/2)(#S₄[2]/4!)` with `#S₄[2] = 10` (BSW Theorem 1 `(a)` for `F = ℚ`).

- `c₄` is an absolutely convergent Euler product (each factor is `1+O(p^{-2})`). The partial product through `p<10000` is about1.21668.

- Totally real `S₄`-fields are the rarest: ratio 1 : 6 : 3 for `r₂ = 0 : 1 : 2`.

<a id="bhargava-count-of-quintic-fields"></a>

**Bhargava count of quintic fields.** `FieldStatistics.bhargava_quarticQuinticFields` includes all three quintic signatures. For `r₂ ∈ {0, 1, 2}` let `N₅^{(r₂)}(X)` be the number of isomorphism classes of quintic fields `K` with Galois group `S₅, r₂` pairs of complex embeddings and `|Disc(K)| < X`. Then `N₅^{(0)}(X) ~ (1/240) c₅ X, N₅^{(1)}(X) ~ (1/24) c₅ X` and `N₅^{(2)}(X) ~ (1/16) c₅ X`, where `c₅ = ∏_p (1 + p^{−2} − p^{−4} − p^{−5})`; in total `N₅(S₅; X) ~ (13/120) c₅ X`.

The archimedean constants are `1/(2 #Aut_ℝ(K ⊗ ℝ)): #Aut(ℝ⁵) = 120, #Aut(ℝ³ ⊕ ℂ) = 12, #Aut(ℝ ⊕ ℂ²) = 8` Use the quintic ring/sextic-resolvent dictionary and the 40-dimensional counts of Layers 1–2.

Proof: Source route: BSW Theorem 2 with `F = ℚ, n = 5`, as for the quartic count; the local factor is `Σ_{k=0}^{5} (q(k, 5 − k) − q(k − 1, 6 − k)) p^{−k} = 1 + p^{−2} − p^{−4} − p^{−5}`.

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [ArithmeticStatisticsPartII: bhargava parametrization of quintic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quintic-rings), [ArithmeticStatisticsPartII: maximality of quintic rings at p](../ArithmeticStatisticsPartII/README.md#maximality-of-quintic-rings-at-p), [ArithmeticStatisticsPartIII: quintic finite congruence count](../ArithmeticStatisticsPartIII/README.md#refinement-quintic-finite-congruence-count), [ArithmeticStatisticsPartIII: quintic nonmaximal tail](../ArithmeticStatisticsPartIII/README.md#refinement-quintic-nonmaximal-tail).

([[20]](#ref-20), Theorem 1, p. 2; [[20]](#ref-20), Theorem 2, pp. 2-3.)

**Checks.**

- Sum of the constants: `1/240 + 1/24 + 1/16 = (2 + 20 + 30)/480 = 13/120 = (1/2)(#S₅[2]/5!)` with `#S₅[2] = 1 + 10 + 15 = 26`.

- Local factor at `p = 2: 1 + 1/4 − 1/16 − 1/32 = 37/32`.

- A cyclic quintic field has normal-closure degree 5 rather than 120 and is excluded from the `S₅` count; a positive discriminant alone does not impose the Galois-group condition.

<a id="bhargava-shankar-wang-counts-over-number-fields"></a>

**Bhargava shankar wang counts over number fields.** `FieldStatistics.bhargavaShankarWang_numberFieldCount` states the number-field formula in all four degrees, with inclusive relative-discriminant norm cutoff and inverse automorphism weights. Let `F` be a number field with `r₁` real and `r₂` complex places, and `n ∈ {2, 3, 4, 5}`. Let `N_n(F, X)` be the number of isomorphism classes of degree-`n` extensions `L/F` whose normal closure has Galois group `S_n`, weighted by `1/#Aut(L/F)`, with `N_{F/ℚ}(Disc(L/F)) ≤ X`, where `N_{F/ℚ}(Disc(L/F)) = |Disc(L)|/|Disc(F)|^n`. Then `lim_{X→∞} N_n(F, X)/X = (1/2) Res_{s=1} ζ_F(s) · (#S_n[2]/n!)^{r₁} (1/n!)^{r₂} ∏_{𝔭} Σ_{k=0}^{n} (q(k, n − k) − q(k − 1, n − k + 1)) N𝔭^{−k}`, where `Res_{s=1} ζ_F(s) = 2^{r₁}(2π)^{r₂} h_F R_F/(w_F √|Disc F|)` is Mathlib's `NumberField.dedekindZeta_residue` `F, #S_n[2]` is the number of elements of order dividing 2 in `S_n`, and `q(k, m)` is the number of partitions of `k` into at most `m` parts.

The weight `1/#Aut(L/F)` is 1 for `n ≥ 3` and `1/2` for `n = 2` The residue is used only through its value; Mathlib states it as the real right limit of `(s − 1)ζ_F(s)`, which is all this statement needs Use the global-field orbit count and independent local mass specifications of Layers 1–2.

Proof: for `F = ℚ: Res = 1, r₁ = 1, r₂ = 0`, and the formula gives `(1/2)(#S_n[2]/n!) ∏_p (…): 3/π²` for `n = 2` (weighted; `6/π²` unweighted quadratic fields), `1/(3ζ(3))` for `n = 3` (Davenport-Heilbronn), `(5/24) c₄` and `(13/120) c₅` for `n = 4, 5`. The discriminant-norm identity `N(Disc(L/F)) = |Disc(L)|/|Disc(F)|^n` is the tower formula for discriminants (NumberFieldArithmetic Layer 4, relative discriminant).

*Needs:* [low degree jacobian mass](#low-degree-jacobian-mass), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [count of quadratic fields](#count-of-quadratic-fields), [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields), `NumberField.dedekindZeta_residue` (Mathlib), `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (Mathlib), `NumberField.InfinitePlace.nrRealPlaces` (Mathlib), `NumberField.InfinitePlace.nrComplexPlaces` (Mathlib).

([[20]](#ref-20), Theorem 1(a), p. 2.)

**Checks.**

- `F = ℚ, n = 2: (1/2)(2/2) ∏_p (1 − p^{−2}) = 3/π²`, the weighted count of quadratic fields, consistent with [count of quadratic fields](#count-of-quadratic-fields) (both signs, weight `1/2`).

- `F = ℚ, n = 3: (1/2)(4/6)(1/ζ(3)) = 1/(3ζ(3))`, the Davenport-Heilbronn total (the local factor is `1 − p^{−3}`).

- `F = ℚ(i)`: the residue is `2^0 (2π)^1 R h/(w √4) = 2π/(4·2) = π/4 (h = 1, w = 4, R = 1)`, the factor by which the `n = 2` count over `ℚ(i)` is scaled relative to the Euler product.

<a id="bhargava-mean-of-two-torsion-in-cubic-class-groups"></a>

**Bhargava mean of two torsion in cubic class groups.** `FieldStatistics.bhargava_cubicTwoTorsionMean` states the ordinary and narrow means over rational `S₃`-cubic fields of each signature. `FieldStatistics.cubicTwoTorsion_relativeMean` states the ordinary relative mean over every number-field base with the real-place parameter retained. Over `S₃`-cubic fields `K` ordered by `|Disc(K)|`: the average of `h₂(K) = #Cl(K)[2]` is `5/4` over totally real fields and `3/2` over complex cubic fields; the average of `#Cl⁺(K)[2]` (narrow class group) is 2 over totally real fields and `3/2` over complex ones. More generally (BSW Theorem 6 `(b)` over a number field `F` with an acceptable, archimedean-pure `Σ`): the mean of `h₂(L/F)` is `1 + 2^{−r₁−2r₂−α₃(Σ)}` and of `h₂⁺(L/F)` is `1 + 2^{−r₁−2r₂+α₃(Σ)}, α₃(Σ)` being the number of real places of `F` at which `Σ` prescribes `ℝ³`; for `F = ℚ, r₁ = 1, r₂ = 0` and `α₃ = 1` (totally real) or 0 (complex).

The family is `S₃`-cubic fields (cyclic cubic fields have density zero); the averages are archimedean-pure (fixed signature) Use the quartic-pair count together with the relative class-field correspondence.

Proof: Proved in Bhargava's quartic paper ([8] of BSW) by relating 2-torsion in class groups of cubic fields to quartic fields with a given cubic resolvent (class field theory) and counting through the parametrization of quartic rings; reproved over global fields as BSW Theorem 6 `(b)`.

*Needs:* [quartic class group two torsion fibre](#quartic-class-group-two-torsion-fibre), [low degree class group mass ratios](#low-degree-class-group-mass-ratios), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields), [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), [ArithmeticStatisticsPartII: existence and number of cubic resolvents](../ArithmeticStatisticsPartII/README.md#existence-and-number-of-cubic-resolvents), [ArithmeticStatisticsPartIII: quartic fixed reducible resolvent](../ArithmeticStatisticsPartIII/README.md#refinement-quartic-fixed-reducible-resolvent).

([[20]](#ref-20), Theorem 6(b), p. 5, and the paragraph after it.)

**Checks.**

- Totally real: `1 + 2^{−1−0−1} = 5/4`; complex: `1 + 2^{−1} = 3/2`; narrow totally real: `1 + 2^{−1+1} = 2`.

- It is the `(G, p) = (S₃, 2)` case of the Cohen-Lenstra-Martinet prediction, as Davenport-Heilbronn is `(S₂, 3)`.

- Over a base with nontrivial two-torsion the absolute mean includes `h₂(F)` (or `h₂⁺(F)`); the relative mean does not, by the preceding norm/extension splitting.


### 3.22 Four-rank expansions and limiting laws

<a id="quadratic-four-rank-conic-formula"></a>

**Quadratic four rank conic formula.** For a fundamental quadratic discriminant `D`, let `C_D` be the narrow class group. Then `2^{rk₄ C_D}` is one half the number of positive squarefree divisors `b` of `D` for which `b′` is the signed squarefree part of `D/b` and the conic `b x²−b′ y²=z²` has a nonzero rational point. All signs and the prime2 conditions are retained; replacing this by residue conditions only at the odd primes is insufficient.

`D` is a fundamental discriminant, `D≠1`; for positive `D` the class group is narrow.

Proof: Represent the two-torsion classes by ramified ideals and apply the quadratic genus-character test for being a square. Translate the square condition to the conic; use its local-to-global principle and quadratic reciprocity. Count the two complementary factorizations for each class.

*Needs:* [ArithmeticStatisticsPartIV: prime power class group rank](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank), `TauCetiRoadmap.GlobalQuadraticForms` Layer 5.

([[90]](#ref-90), §3, Theorem5 and Lemmas4–10, pp.9–12.)

**Checks.**

- For `D=5` the positive divisors1,5 give two soluble conics and `rk₄ Cl⁺(ℚ(√5))=0`. Allowing `−1`,`−5` would double the count incorrectly. The complementary factor `b′`, rather than the summation divisor `b`, retains the sign of `D`.

<a id="quadratic-four-rank-jacobi-expansion"></a>

**Quadratic four rank jacobi expansion.** If `D<0` is odd and fundamental, then `2^{rk₄ C_D}=2^{-1−ω(|D|)} Σ_{|D|=D₀D₁D₂D₃}(D₂/D₀)(D₁/D₃)(D₃/D₀)(D₀/D₃)`, over positive pairwise coprime squarefree factors. Raising this to `k` gives the `(𝔽₂²)^k`-indexed sum with weight `2^{-kω(∏D_u)}`, phase `Φ_k(u,v)` and prefactor `2^{-k}`. For the other five sign/congruence families the same phase persists with the precise characters at `−1` and2 supplied by Lemmas28,34,39,41,43. Explicitly write `u=(a_j,b_j)_{j=1}^k, λ_k(u)=Σ_j a_jb_j, ξ_j(u)=(a_j+1)(b_j+1), Q_Γ(u)=Σ_{j∈Γ}a_jb_j+Σ_{j∉Γ}ξ_j(u)`, and `V_Γ(u)=Σ_{j∉Γ}(a_j+b_j)`, all in `𝔽₂`. In each moment sum let `W(D_u)=∏_u2^{−kω(D_u)}∏_{u,v}(D_u/D_v)^{Φ_k(u,v)}`, with positive odd pairwise coprime squarefree `D_u`. For negative odd discriminants sum `2^{−k}W` with `∏D_u≤X` and `∏D_u≡−1 mod4`; for positive odd ones sum `2^{−k}W∏_u(−1/D_u)^{λ_k(u)}`, with product `≡1 mod4`. For negative discriminants divisible by8 sum `W∏_u(2/D_u)^{λ_k(u)}`, with product `≤X/8` and either odd residue `mod4`. For the positive8 family sum `2^{−k}` over `Γ` of `W∏_u(2/D_u)^{λ_k(u)}(−1/D_u)^{Q_Γ(u)}`, in the same product domain. For the negative `4 mod8` family sum `2^{−k}` over `Γ` of `W∏_u(2/D_u)^{V_Γ(u)+k−|Γ|}`, with product `≤X/4` and product `≡1 mod4`; for the positive `4 mod8` family multiply each such summand by `∏_u(−1/D_u)^{λ_k(u)}` and require product `≡−1 mod4`.

`k≥1`; the six families are `D` of either sign with `D` odd, `D≡0 mod8`, or `D≡4 mod8`.

Proof: Expand the quadratic-residue indicator as a product over the ramified primes. Distribute each prime among the four factors, then among the `4^k` factors for kth moments. For the even and positive cases carry the `−1` and2 character factors through the expansion.

*Needs:* [quadratic four rank conic formula](#quadratic-four-rank-conic-formula), [ArithmeticStatisticsPartIV: fk linking phase](../ArithmeticStatisticsPartIV/README.md#fk-linking-phase).

([[90]](#ref-90), §5.1, (20), p.15, and Lemma17, (26)–(27), p.17; Lemmas28,34,39,41,43, pp.35,42,45,48,51.)

**Checks.**

- All six sign/parity domains carry the indicated prefactor, product cutoff and character twists; in particular the negative8 family has no `2^(−k)` prefactor, and the sign at `4 mod8` switches the product residue.

<a id="fk-maximal-unlinked-support"></a>

**Fk maximal unlinked support.** An unlinked subset `U` of `(𝔽₂²)^k` has at most `2^k` members. Equality holds exactly for the affine translates of `k`-dimensional totally singular subspaces for `P_k`. In the kth Jacobi moment only maximal unlinked supports give a main term: boxes with two linked large variables, with an intermediate linked variable, or with fewer than `2^k` large variables contribute `O_{k,ε}(X(log X)^{-2^{-k}+ε})`.

`k≥1` and `ε>0` are fixed; `X≥2`.

Proof: Translate an unlinked support to contain zero and use its polar orthogonality; the maximal dimension is `k`. Dissect each factor into multiplicative boxes with mesh `1+(log X)^{-2^k}` and remove the boundary and excessive prime-factor boxes. Apply the two quadratic bilinear estimates to linked pairs and Siegel–Walfisz to the remaining small characters. Estimate the supports with fewer than `2^k` large variables by the multiplicative mean-value bound.

*Needs:* [quadratic four rank jacobi expansion](#quadratic-four-rank-jacobi-expansion), [ArithmeticStatisticsPartIII: coefficient sieves](../ArithmeticStatisticsPartIII/README.md#support-sieves) and [quadratic character-sum bounds](#support-character-sums), AnalyticNumberTheoryPartII §5.29, AnalyticNumberTheoryPartI §3.26.

([[90]](#ref-90), §§5.3–5.5, pp.17–23; Lemma 18, pp.22–23, and Proposition 3, p.23.)

**Checks.**

- For `k=1` the space has four points and a maximal unlinked support has two, not four. A singleton is unlinked but is not maximal-cardinality and supplies no leading support.

<a id="fk-main-coefficient"></a>

**Fk main coefficient.** Write `N(k,2)` for the number of all subspaces of `𝔽₂^k`. Summing the reciprocity signs over maximal unlinked supports gives imaginary coefficient `N(k,2)`, and real coefficient `2^{-k}(N(k+1,2)−N(k,2))`. The same coefficients hold separately in each of the three fundamental-discriminant congruence families; the `−1` and2 twists restrict the affine translates but do not change these normalized coefficients.

`k≥1`.

Proof: Evaluate the character sum on the group of subsets under symmetric difference; its square vanishes unless the full bilinear form `L` is zero on the underlying `k`-plane. Use the good-subspace bijection; for real discriminants sum the sizes of the projected subspaces. For the even families impose the linear constraints from the2-character; the constrained count is `N(k−1,2)`. Sum over the subsets of coordinates carrying that character.

*Needs:* [fk maximal unlinked support](#fk-maximal-unlinked-support), [ArithmeticStatisticsPartIV: fk good subspace bijection](../ArithmeticStatisticsPartIV/README.md#fk-good-subspace-bijection).

([[90]](#ref-90), §5.5–5.7, Propositions4–5 and Lemmas20–26, pp.24–34; (105), pp.40–41; §§7–10, pp.41–52.)

**Checks.**

- `N(1,2)=2` and `N(2,2)=5` give first-moment coefficients2 (imaginary) and `3/2` (real).

<a id="fk-narrow-wide-moment-comparison"></a>

**Fk narrow wide moment comparison.** For every fixed `k≥1` and `ε>0`, the sum over positive fundamental `D<X` of `|2^{k rk₄ Cl⁺(D)}−2^{k rk₄ Cl(D)}|` is `O_{k,ε}(X(log X)^{-1/2+ε})`. The ranks agree off the thin family whose odd prime divisors are all `1 mod4`; this is an averaged comparison and does not assert equality for every real quadratic field.

`D` is positive and fundamental; `k≥1, ε>0, X≥2`.

Proof: Use the narrow-to-ordinary exact sequence and the genus criterion to locate the exceptional family. Count that family by the prime-factor sieve and apply Hölder using higher four-`rank` moments. Combine the high-moment bound with the exceptional-family count and let the Hölder exponent grow.

*Needs:* [fk main coefficient](#fk-main-coefficient), [ArithmeticStatisticsPartI: squarefree denominators](../ArithmeticStatisticsPartI/README.md#support-squareclasses), `NumberField.NarrowClassGroup.toClassGroup` (Tau Ceti).

([[90]](#ref-90), §3.2, Lemma10, Corollary1 and proof, pp.11–12.)

**Checks.**

- For a positive discriminant with a prime divisor `3 mod4` the exceptional-family criterion is false, so the two four-ranks agree. A discriminant with every odd prime divisor `1 mod4` is only a candidate for the exceptional family; the criterion does not assert that its ranks differ.

<a id="rank-moments-determine-rank-law"></a>

**Rank moments determine rank law.** `FieldStatistics.rank_moments_determine_rank_law` states the implication for real-indexed probability mass functions, with nonnegativity, total mass one and summability of every exponential moment. Let `p` be prime, `u≥0` an integer and `μ_X` a probability measure on `N`. Suppose every moment `Σ_r p^{kr} μ_X(r)` tends to `Σ_{j=0}^k #{j-dimensional subspaces of 𝔽_p^k} p^{-uj}`. Then for every `r≥0, μ_X(r)` tends to `p^{-r(r+u)} η_∞(p)/(η_r(p)η_{r+u}(p))`, with `η_t=∏_{i=1}^t(1−p^{-i})`. The conclusion applies to the empirical `4-rank` by putting `p=2` and `u=0` or1; it does not deduce an arithmetic moment hypothesis from the heuristic.

`p` is prime; `u∈ℕ`; all displayed moments exist; the probability measures may be empirical measures of a height-ordered family.

Proof: Higher moments give tightness and uniform integrability for each lower moment, so every subsequential limit has the prescribed moments. Finite Gaussian-`binomial` inversion gives the elementary-abelian surjection moments `E #Sur(𝔽_p^r,𝔽_p^j)=p^(−uj)`. The subspace-count formula bounds the moment coefficients by `O_p((k+1)p^(k²/4))`, which supplies a Gaussian bound on limiting masses. Apply `RankGrid.geometricZero` below, with these growth bounds; Delaunay–Jouhet Theorem 5 at length one gives the same argument. This uses elementary-abelian test groups and does not invoke uniqueness from all finite-`p`-group tests. Evaluate the unique law by the `q-binomial` identities and remove the subsequence.

The supporting theorem `RankGrid.geometricZero` has the following exact scope. Fix a real `a>1, α∈R` and `C>0`. If an entire `g(z)=Σ_r w_r z^r` has `|w_r|≤C a^{−r²/2+αr}`, vanishes at `a^m` for every `m≥0`, and has vanishing order `ω>α−1/2` at0, then `g=0`. If `g≠0`, apply Mathlib's `MeromorphicOn.circleAverage_log_norm` in `Analysis.Complex.JensenFormula` on radius `a^k`. Its zeros `a^0,…,a^{k−1}` and its zero of order `ω` at0 give

```text
`log M(a^k) ≥ log|w_ω| + (ωk + k(k+1)/2) log` a.
```

The coefficient bound and completion of the square give `M(a^k)≤C' a^{(k+α)²/2}`; the Gaussian sum defining `C'` is finite and independent of the integer `k`. Comparison as `k→∞` forces `ω≤α−1/2`, a contradiction. For two limiting rank laws, the moment estimate with `k=2r` bounds each mass by `O_p((2r+1)p^{−r²})`, hence their coefficient difference satisfies the separator with `α=0`. Thus `ω≥0` suffices, and rank-marginal uniqueness follows without a full finite-`p`-group moment hypothesis. This proves the analytic step directly from the pinned Jensen formula; it does not assume the quoted FK06 lemma.

*Needs:* [ArithmeticStatisticsPartIV: prime power class group rank](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank), [ArithmeticStatisticsPartIV: gaussian binomial coefficient](../ArithmeticStatisticsPartIV/README.md#gaussian-binomial-coefficient), `MeromorphicOn.circleAverage_log_norm` (Mathlib).

([[94]](#ref-94), §2, Lemma3 and Corollary4, pp.5–6; §3, Theorem5 and its proof, pp.6–8, specialized to ℓ=1.)

**Checks.**

- At `k=0` the prescribed moment is 1. At `k=1` it is `1+p^(−u)`; for `p=2` this gives 2 at `u=0` and `3/2` at `u=1`. For `r=0` the predicted probability is `η∞/η_u`, retaining `η₀=1`.
- For the separator, `g=0` satisfies all bounds, while a nonzero constant fails the zero conditions. The nonzero entire product `∏_{m≥0}(1−z/a^m)` has `ω=0` and coefficient growth `O_a(a^{−r²/2+r/2})`; it shows that the strict inequality `ω>α−1/2` cannot be weakened at `α=1/2`.
- A rank-zero point mass has first moment1, so it cannot satisfy the required first moment `1+p^{−u}`. Matching normalization alone does not determine the law.


### 3.8 Quadratic four-rank moments

<a id="fouvry-kluners-moments-of-four-ranks"></a>

**Fouvry kluners moments of four ranks.** `FieldStatistics.fouvryKluners_fourRankMoments` states the logarithmic error bound for both signs and all six congruence families, expressing `2^{rk₄}` as the cardinality of the two-torsion in the square subgroup of `NumberField.NarrowClassGroup`; `FieldStatistics.fouvryKluners_fourRankLaw` states the resulting arithmetic rank probabilities in the same families. Let `C_D` be the narrow class group of the quadratic field of fundamental discriminant `D` and `rk₄(C_D) = rk₂(C_D²)` its `4-rank`. For every integer `k ≥ 0` and `ε > 0`, with `N(k, 2)` the number of `𝔽₂`-subspaces of `𝔽₂^k` and `R(X, ε, k) = X(log X)^{−2^{−k}+ε}: Σ_{0<−D<X} 2^{k·rk₄(C_D)} = N(k, 2) Σ_{0<−D<X} 1 + O_{ε,k}(R(X, ε, k))` and `Σ_{0<D<X} 2^{k·rk₄(C_D)} = 2^{−k}(N(k + 1, 2) − N(k, 2)) Σ_{0<D<X} 1 + O_{ε,k}(R(X, ε, k))` (and the same within each of the classes `D ≡ 1 (mod 4), 0 (mod 8), 4 (mod 8)`). Equivalently (FK Theorem 1) the moment prediction `Conj^±(2, α)` holds for every `α ≥ 0`, and (FK Theorem 3) for every `r ≥ 0` the density of negative fundamental discriminants with `rk₄(C_D) = r` is `2^{−r²} η_∞(2) η_r(2)^{−2}` and of positive ones `2^{−r(r+1)} η_∞(2) η_r(2)^{−1} η_{r+1}(2)^{−1}`, where `η_k(t) = ∏_{j=1}^{k} (1 − t^{−j})`.

The narrow class group is used; for `D < 0` it equals the class group, and FK's Corollary 1 transfers the statements to the ordinary class group `Cl_D` The error term saves only a power of `log X`; the theorem is an unconditional limit, not a heuristic Use the Rédei-matrix, linked character-sum and good-subspace targets of this layer.

Proof: Rédei: `rk₄(C_D)` is the corank of an explicit `𝔽₂`-matrix (the Rédei matrix) built from Legendre symbols between the prime factors of `D`. Expand `2^{k·rk₄}` as a sum of products of Jacobi symbols over factorizations of `D`, and show that only the 'diagonal' terms contribute to the main term (Siegel-Walfisz and large-sieve estimates for the others); FK Theorems 6-11 treat the six families (3). Proposition 1 turns the moments into `Conj^±(2, α)`; FK Theorem 2 (from [5]) turns all moments into the distribution (Theorem 3).

*Needs:* [quadratic four rank conic formula](#quadratic-four-rank-conic-formula), [quadratic four rank jacobi expansion](#quadratic-four-rank-jacobi-expansion), [fk maximal unlinked support](#fk-maximal-unlinked-support), [fk main coefficient](#fk-main-coefficient), [rank moments determine rank law](#rank-moments-determine-rank-law), [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [count of quadratic fields](#count-of-quadratic-fields).

([[22]](#ref-22), Theorem 1 and Conjecture 2, p. 3; [[22]](#ref-22), (4)-(9), pp. 3-4; [[22]](#ref-22), Conjecture 3 and Theorem 3, p. 4.)

**Checks.**

- `k = 1: M^−(2^{rk₄}) = N(1, 2) = 2` and `M^+(2^{rk₄}) = (N(2, 2) − N(1, 2))/2 = (5 − 2)/2 = 3/2` (FK (1)-(2)).

- `k = 2: M^−(4^{rk₄}) = N(2, 2) = 5`.

- Density of `rk₄ = 0` among negative `D: η_∞(2) ≈ 0.2888`.

<a id="cohen-lenstra-moment-prediction"></a>

**Cohen lenstra moment prediction.** For a prime `p` and an integer `α ≥ 0`, the propositions `Conj^−(p, α)` and `Conj^+(p, α)` are: `M^−(∏_{0≤i<α} (p^{rk_p(C_D²)} − p^i)) = 1` and `M^+(∏_{0≤i<α} (p^{rk_p(C_D²)} − p^i)) = p^{−α}`, where `C_D` is the narrow class group of the quadratic field of discriminant `D, C_D²` its subgroup of squares, and `M^±(f) := lim_{X→∞} (Σ_{0<±D<X} f(D))/(Σ_{0<±D<X} 1)` over fundamental discriminants `D` (the limit is asserted to exist). For odd `p, rk_p(C_D²) = rk_p(Cl_D)` and `p^{rk_p} = h_p` ([ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups)), so the moment is the average of `∏_{i<α}(h_p(K) − p^i)`, i.e. of the number of injections `(ℤ/pZ)^α → Cl(K)[p]`. These are conjectural propositions: every theorem of this construction that uses one takes it as an explicit hypothesis, and none is assumed.

For odd `p` this is Cohen-Lenstra's conjecture `(C₆), (C10)`; for `p = 2` Gerth's modification replaces `C_D` by `C_D²` (genus theory fixes `rk₂(C_D) = ω(D) − 1`) The mean over fundamental discriminants of one sign ordered by `|D|` A proposition with content (a limit statement), never a hypothesis-free axiom

The development requires:

- `cohenLenstraMomentPrediction`: `Conj^±(p, α)` as a proposition about the limit of the mean of `∏_{i<α}(h_p(K) − p^i)` over quadratic fields of one sign (odd `p; p = 2` uses `C_D²`).

- `cohenLenstraMomentPrediction_zero`: `Conj^±(p, 0)` holds (the mean of 1 is 1).

- `cohenLenstraMomentPrediction_three_one`: The Davenport-Heilbronn theorem is equivalent to `Conj^−(3, 1) ∧ Conj^+(3, 1)`.

- `cohenLenstraMomentPrediction_iff_mean_torsion`: For odd prime `p, Conj^±(p,1)` iff the mean of `h_p(K)` is2 (imaginary) or `1+p^{-1}` (real). For `p=2` replace `h_p(K)` by `2^{rk₄(C_D)}`.

- `cohenLenstraMomentPrediction_target`: The predicted value is 1 for imaginary and `p^{−α}` for real fields: the Cohen-Lenstra prediction `|A|^{−u}` for `A = (ℤ/pZ)^α` with `u = 0, 1`.

Proof: Define `M^±` as the limit of ratios of finite sums over the finite sets of fundamental discriminants with `0 < ±D < X` ([count of quadratic fields](#count-of-quadratic-fields) gives the denominators `~ 3X/π²`). Define the proposition as the statement that this limit equals 1, resp. `p^{−α}`.

*Needs:* [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups), [count of quadratic fields](#count-of-quadratic-fields).

([[22]](#ref-22), Conjecture 1 and the paragraph after it, p. 2; [[21]](#ref-21), Section 5, Conjecture 5.4, p. 9.)

**Checks.**

- For every odd prime `p` and both signs, the proposition with `α = 0` holds.

- The imaginary half of the Davenport-Heilbronn theorem (mean of `h₃` equals 2) implies `Conj^−(3, 1)`.

- The predicted real moment for `p = 5, α = 2` is `5^{−2} = 1/25`.

- `Conj^−(3, 1)` is not the statement that the mean of the class number is 2: the mean class number of imaginary quadratic fields is unbounded (Siegel), while the prediction concerns `h₃`.

- `Conj^±(p, 0)` holds trivially (the empty product is 1).

- `Conj^±(3, 1)` is the Davenport-Heilbronn theorem (means 2 and `4/3` of `h₃`); `Conj^±(2, α)` for all `α` is Fouvry-Kluners.

- For odd `p, Conj^−(p,1)` says the mean of `h_p` over imaginary quadratic fields is2, equivalently the mean number of surjections `Cl→ℤ/pZ` is1. At `p=2` it concerns the squares of the class group.

### 3.9 Malle predictions and their cyclotomic obstruction

<a id="malle-invariants-of-a-permutation-group"></a>

**Malle invariants of a permutation group.** Let `1 ≠ G ≤ S_n` be transitive on `Ω = {1, …, n}`. For `g ∈ G, ind(g) := n −` (number of orbits of `⟨g⟩` on `Ω`) `= Σ` over the cycles of `g` of (`length − 1`). `ind(G) := min{ind(g) : 1 ≠ g ∈ G}` and `a(G) := ind(G)^{−1}`. For a number field `k`, the absolute Galois group of `k` acts on the set of conjugacy classes of `G` through the cyclotomic character: `σ` sends the class `C` of `g` to the class of `g^{χ(σ)}, χ(σ) ∈ (ℤ/eZ)^×` the action on `e`-th roots of unity, `e` the exponent of `G`; the orbits are the `k`-conjugacy classes, and `b(k, G) :=` the number of `k`-conjugacy classes `C` with `ind(C) = ind(G)`. Equivalently, with `H_k ≤ (ℤ/eZ)^×` the image of `Gal(k(ζ_e)/k), b(k, G)` is the number of orbits of `H_k` acting by powering on the conjugacy classes of minimal index.

`G ≠ 1` and transitive `ind` is a class function, so `ind(C)` is well defined `b` depends on `k` only through `H_k; H_ℚ = (ℤ/eZ)^×` and `H_k = 1` when `ζ_e ∈ k`

The development requires:

- `malleIndex`: `ind(g) = #` support `(g) − #` cycles `(g)` for `g ∈ S_n`.

- `malleIndexGroup`: `ind(G) = min` over `g ∈ G, g ≠ 1`, of `ind(g)`.

- `malleA`: `a(G) = 1/ind(G) ∈ ℚ`.

- `malleB`: `b(H, G)`: the number of orbits of `H ≤ (ℤ/eZ)^×` acting by powering on the conjugacy classes of `G` of minimal index (`b(k, G)` with `H = H_k`).

- `malleIndex_conj`: `ind(h g h^{−1}) = ind(g)`.

- `malleIndex_pow_of_isUnit`: `ind(g^u) = ind(g)` for `u` prime to the order of `g`.

- `malleB_pos`: `1 ≤ b(H, G)` for `G ≠ 1`.

- `malleB_anti`: `H ≤ H'` implies `b(H', G) ≤ b(H, G)`: enlarging `k` (shrinking `H_k`) can only increase `b`.

Proof: `ind(g) = #` support `(g) − #` cycles `(g)` (cycle type of the permutation). The powering action of `(ℤ/eZ)^×` on conjugacy classes is well defined because `g^e = 1`, preserves `ind` (`⟨g^u⟩ = ⟨g⟩` for `u` a unit), and `b` counts orbits of `H_k` on the minimal-index classes.

*Needs:* `Equiv.Perm` (Mathlib), `Fintype.card` (Mathlib).

([[23]](#ref-23), Definitions 1.1 and 1.2, p. 1; [[23]](#ref-23), Definition 1.2, p. 1.)

**Checks.**

- For `n ≥ 2, a(S_n) = 1` and `b(ℚ, S_n) = 1`.

- For a prime `ℓ` and `G = C_ℓ` in its regular representation, `ind(G) = ℓ − 1`, so `a(G) = 1/(ℓ − 1)`, and `b(ℚ, G) = 1`.

- For `G = C₃ ≤ S₃` and `H = 1 (k ∋ ζ₃), b = 2`.

- For `G = S₂ = C₂: ind(G) = 1, a(G) = 1, b(ℚ, G) = 1`.

- Counting ordinary conjugacy classes of minimal index `(H = 1)` for `G = C₃ ≤ S₃` over `ℚ` gives 2, not `b(ℚ, C₃) = 1`: the cyclotomic action must be included.

- `S_n (n ≥ 2)`: transpositions have index 1, so `a(S_n) = 1` and `b(ℚ, S_n) = 1`.

- `C₃ ≀ C₂ ≤ S₆: a = 1/2, b(ℚ, G) = 1` and `b(ℚ(ζ₃), G) = 2` (Kluners).

- `S₃ ≤ S₆` (regular): `a = 1/3, b(ℚ) = 1`.

<a id="malle-conjecture"></a>

**Malle conjecture.** For a number field `k` and a transitive `1 ≠ G ≤ S_n`, let `Z(k, G; x)` be the number of extensions `K/k` inside a fixed algebraic closure `k̄` of degree `n` whose Galois group (the normal closure's group acting on the `n` embeddings over `k`) is permutation-isomorphic to `G`, with `N_{k/ℚ}(d_{K/k}) ≤ x`. The strong Malle conjecture `MalleStrong(k, G)` is the proposition: there is `c(k, G) > 0` with `Z(k, G; x) ~ c(k, G) x^{a(G)} (log x)^{b(k,G)−1}` as `x → ∞`. The weak Malle conjecture `MalleWeak(k, G)` is: there is `c₁ > 0` with `Z(k, G; x) ≥ c₁ x^{a(G)}` for `x` large, and for every `ε > 0` there is `c₂(ε)` with `Z(k, G; x) ≤ c₂(ε) x^{a(G)+ε}`. For `k = ℚ`, counting isomorphism classes instead of subfields of `ℚ̄` changes `ℤ` by the constant factor `n/#Aut(K/ℚ)` (which depends only on `G`), so the statements are unchanged when `Z(ℚ, G; x)` is replaced by `N_n(Gal = G; −x, x)` of [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function). These are conjectural propositions: `MalleStrong` is false in general (Kluners), and theorems using either form take it as an explicit hypothesis.

The invariants `a(G)` and `b(k, G)` are those of [malle invariants of a permutation group](#malle-invariants-of-a-permutation-group) `ℤ` counts subfields of `k̄`, not isomorphism classes; the conversion factor is constant for fixed `G MalleStrong(ℚ,G)` is refuted for `G=C₃≀C₂≤S₆`. The cited2016 survey reports no counterexample to its weak form; this statement concerns only that source.

The development requires:

- `malleStrong`: `MalleStrong(ℚ, G): ∃ c > 0, N_n(Gal = G; −X, X) ~ c X^{a(G)} (log X)^{b(ℚ,G)−1}`.

- `malleWeak`: `MalleWeak(ℚ, G)`: a lower bound `≫ X^{a(G)}` and upper bounds `≪_ε X^{a(G)+ε}`.

- `malleStrong_imp_malleWeak`: `MalleStrong(k, G)` implies `MalleWeak(k, G)`.

- `malleStrong_iff_subfield_count`: For `k = ℚ, MalleStrong` stated with the subfield count `Z(ℚ, G; x)` is equivalent to the statement with isomorphism classes.

- `malleStrong_symmetric_two`: `MalleStrong(ℚ, S₂)` (from the count of quadratic fields).

Proof: Define `Z(k, G; x)` as a finite count (Hermite's theorem over `k`) and the two propositions by the displayed asymptotic statements. Record the known cases as tests: abelian `G` (Wright), `S₃ ≤ S₃` (Davenport-Heilbronn), `S₄, S₅` (Bhargava), and the failure for `C₃ ≀ C₂`.

*Needs:* [malle invariants of a permutation group](#malle-invariants-of-a-permutation-group), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function).

([[23]](#ref-23), Conjecture 1.3, pp. 1-2; [[21]](#ref-21), Section 10.2, p. 22.)

**Checks.**

- `MalleStrong(ℚ, S₂)` holds, with `c = 6/π²` for isomorphism classes.

- The Davenport-Heilbronn theorem implies `MalleStrong(ℚ, S₃)`, with `c = 1/(3ζ(3))` up to the contribution of cyclic cubic fields `(o(X))`.

- For `G = C₃ ≤ S₃`, the predicted exponent is `a(G) = 1/2` and `b(ℚ, G) = 1` (Cohn: `N(C₃; X) ~ c X^{1/2}`).

- `MalleStrong(ℚ, C₃ ≀ C₂)` is false.

- `MalleWeak(ℚ, S₃)` holds (from `MalleStrong(ℚ, S₃)`).

- `MalleStrong(ℚ, S₂)` holds: `N₂(X) ~ (6/π²) X` with `a(S₂) = 1, b = 1` ([count of quadratic fields](#count-of-quadratic-fields)).

- `MalleStrong(ℚ, S₃)` holds by Davenport-Heilbronn (`a = 1, b = 1`, constant `1/(3ζ(3))` for isomorphism classes).

- `MalleStrong(ℚ, C₃ ≀ C₂)` fails ([kluners counterexample to malle conjecture](#kluners-counterexample-to-malle-conjecture)).

<a id="abelian-discriminant-series"></a>

**Abelian discriminant series.** Prove the following regular-action counting theorem. For a nontrivial finite abelian A over a fixed number field `k`, put `ℓ=min{p prime:p|card(A)}`, `a=1/(|A|(1−1/ℓ))` and `b=#{g∈A:ord(g)=ℓ}/[k(ζ_ℓ):k]`. Count surjective continuous characters of the idèle class group into A by the **regular** extension discriminant, and denote the series by `D_A(s)`. It continues meromorphically to Re `(s)>a−δ` for some `δ>0`, has its only pole in this strip at `a`, of exact order `b`, and `c=lim_(s→a)(s−a)^bD_A(s)>0`. Its coefficient sum is asymptotic to `c/(aΓ(b)) X^a(log X)^(b−1)`. For field isomorphism classes divide by `|Aut(A)|`; for `A=C_p` this is `p−1`. The trivial group is handled separately by its single base field, not by this undefined minimum prime.

A complete alternate original proof supplier for Wright's theorem is Frei–Loughran–Newton [141], Theorem1.7, p.5 and §§2–4, pp.9–30, specialized to unrestricted local conditions. These conditions satisfy (1.4). For positivity fix one realized `A`-extension; unrestricted abelian realizability follows from class-field theory, or by restricting to `k` a `ℚ`-abelian extension linearly disjoint from `k`. The latter can be constructed as a compositum of cyclic prime-power subfields of cyclotomic fields at distinct primes unramified in `k` and congruent to one modulo the required prime power. Fixed-progression PNT supplies these primes. Every nontrivial subextension of their compositum ramifies at one of them, whereas `k` is unramified there, proving disjointness. Thus there is no unproved prescription of arbitrary local data, which could fail by Wang's obstruction.

The source-to-proof chain to implement is as follows. For each subgroup `H≤A` sum all idèle characters into `H` with the product of their conductor characters, and perform finite subgroup-lattice Möbius inversion to impose surjectivity. The discriminant exponent is scaled by `|A|/|H|` ([141], Lemma2.2, pp.9–10; (4.1), p.20). Poisson summation on the idèle class characters, with unit quotient normalization, rewrites each conductor series as a sum of local Fourier Euler products (Proposition3.8, pp.16–18; (4.2), p.20). Outside a finite `S` containing primes dividing `|A|`, the leading local terms come exactly from inertia of order `ℓ`. Factoring their Frobenius averages by zeta functions of `k(ζ_ℓ)` gives pole order at most `#{h∈H:ord(h)=ℓ}/[k(ζ_ℓ):k]`; higher-inertia terms converge to the left of a. Lemmas4.1–4.7, pp.21–26 prove the uniform convergence of the Fourier sum and the vertical growth needed for the Tauberian step. Subgroups of order prime to `ℓ` are holomorphic there. This gives the claimed meromorphic continuation and upper pole order, but does not yet prove noncancellation.

For the exact pole and its sign use §4.7, pp.27–30. Reverse Poisson and subgroup inversion after restricting to finitely many places `T`. The resulting approximants are sums of nonnegative surjective-character terms; Lemma4.8 justifies their limit. Fix a realized extension and a finite `T₀` containing its ramified places and enough local images to generate A. Twist it by characters trivial at `T₀` and with inertia order dividing `ℓ` outside `T₀`. They stay surjective. Their normalized Fourier factors are nonnegative; at a good prime they are `1+(ℓ^β−1)/q`, `1−1/q` or 1 according to the local `ℓ`-power test (Lemma4.9, p.30), where `ℓ^β=|` A `[ℓ]|`. The trivial dual character contributes, after the zeta normalization, an absolutely convergent product of positive factors `1+O(q⁻²)`, times positive factors at `T₀`. It has positive limit, so the original leading coefficient cannot cancel. This proves `c>0`, not just existence of a possible pole. The Tauberian normalization `c/(aΓ(b))` follows by integrating the coefficient measure against `x^(−s)`; it agrees with a simple pole giving residue/a. The 2023 corrigendum to [141] concerns its Theorems1.1 and1.5(2), not this counting theorem or its proof.

For `C_p/ℚ` the `ℓ`-order elements form one cyclotomic orbit, hence `b=1`. For `C₃/ℚ(ζ₃), a=1/2` and `b=2`, so its count is `C X^(1/2)log X` with `C>0`. That exact positive logarithmic term supplies the cyclotomic subfamily in the counterexample below; a `ℚ`-only cyclic bound is insufficient. For `V₄/ℚ, a=1/2` and `b=3`, giving `C X^(1/2)(log X)²`. Local conditions can also be retained in this theorem precisely under [141], (1.4), and existence of a realized global extension; positivity is never asserted for incompatible local conditions.

*Needs:* `ClassFieldTheory` Layer13, AnalyticNumberTheoryPartI §§2.5 and2.21, Completed ArithmeticDirichletSeries Layers3,6 and9.

Source: [[141]](#ref-141), Theorem1.7 p.5 and §§2–4 pp.9–30.

**Checks.**

- For `C₃/ℚ(ζ₃)`, `a=1/2,b=2` gives a positive `X^(1/2)log X` term, whereas `C₃/ℚ` has `b=1`.
- For `V₄/ℚ`, `a=1/2,b=3`; its two logarithmic factors cannot be discarded from a pure square-root bound.
- For a simple pole the cumulative coefficient is residue divided by `a`; the trivial group has a singleton family and is excluded from the minimum-prime formula.

<a id="kluners-counterexample-to-malle-conjecture"></a>

**Kluners counterexample to malle conjecture.** For `G = C₃ ≀ C₂ = C₃² ⋊ C₂ ≤ S₆` (order 18), `a(G) = 1/2` and `b(ℚ, G) = 1`, but `Z(ℚ, G; x) ≫ x^{1/2} log x`; hence `MalleStrong(ℚ, C₃ ≀ C₂)` is false. More precisely `Z̃(ℚ, G; x) ≥ Z(ℚ(ζ₃), C₃; x/27) ~ (c(ℚ(ζ₃), C₃)/√27) x^{1/2} log x`, where `Z̃` counts towers `L/K/ℚ` with `Gal(L/K) = C₃, [K : ℚ] = 2, |d_L| ≤ x`, and the `C₆` and `S₃(6)` contributions are `O(x^{1/3})` and `O(x^{1/2})`, respectively, which suffice for the contradiction (the source quotes a stronger `S₃(6)` bound).

The failure is caused by the cyclotomic intermediate field `K = ℚ(ζ₃)`: excluding it restores the predicted order `x^{1/2}` The lower bound uses the abelian case of Malle's conjecture (Wright) over `K = ℚ(ζ₃)`, where `b(K, C₃) = 2`

Proof: Compute `a(G) = 1/2` (the elements of order 3 with three fixed points have index 2) and `b(ℚ, G) = 1` (the two classes of such elements are fused by the cyclotomic action over `ℚ`), but `b(ℚ(ζ₃), C₃) = 2`. Lower bound: every cyclic cubic extension `L/K` of `K = ℚ(ζ₃)` with Galois group of `L/ℚ` equal to `G` gives a sextic field with `|d_L| = d_K³ N(d_{L/K}) = 27 N(d_{L/K})`; by Wright's theorem `Z(K, C₃; y) ~ c y^{1/2} log y`; at `y=x/27` the leading constant is `c/√27 (b(K, C₃) = 2)`. The `C₆` contribution is `O(x^{1/3})` by the abelian case. For `S₃` Galois sextic fields `L`, choose a conjugate cubic subfield `K`. The tower discriminant identity gives `|Disc L|≥|Disc K|²`, and the Galois closure determines `L` from the isomorphism class of `K`; Davenport–Heilbronn thus gives `O(x^{1/2})`. Both are `o(x^{1/2} logx)`, sufficient for the claimed counterexample. The stronger `O(x^{1/3})` bound quoted without proof by Klüners is not needed here.

*Needs:* [abelian discriminant series](#abelian-discriminant-series), [malle conjecture](#malle-conjecture), [malle invariants of a permutation group](#malle-invariants-of-a-permutation-group), [davenport heilbronn mean of three torsion](#davenport-heilbronn-mean-of-three-torsion), [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields).

([[23]](#ref-23), Section 2, pp. 2-3; [[23]](#ref-23), Section 2, p. 2.)

**Checks.**

- Kluners also shows `Ẑ` (towers avoiding `ℚ(ζ₃)`) `~ c x^{1/2}`, as Malle predicts, using the Davenport-Heilbronn `3-rank` averages.

- The same mechanism gives counterexamples `C_ℓ ≀ C_m` for primes `ℓ > 2` with `gcd(m, ℓ − 1) > 1`.

### 3.19 Conductors and total ramification

<a id="cubic-conductor-discriminant"></a>

**Cubic conductor discriminant.** For a non-Galois cubic field `L/ℚ` with quadratic resolvent `K` and normal closure `M, disc(L)=disc(K) f²` for a positive integer `f`, and the conductor of the cyclic extension `M/K` is `f O_K`. The cyclic cubic characters cutting out `M` are inverse and anti-invariant under `Gal(K/ℚ)`. This is a correspondence with conductor and infinity conditions, not a count of arbitrary cubic extensions of `K`.

Proof: Use the standard representation of `S₃` and induction of either nontrivial `C₃` character. The Artin conductor identity gives the discriminant factorization. Use reciprocity for ring class groups to identify anti-invariant characters; inverse characters give the same extension and the conjugate cubic fields give one `ℚ`-isomorphism class.

*Needs:* [nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent), `TauCetiRoadmap.ClassFieldTheory` Layer 13.

([[93]](#ref-93), §3, Remark3.2 and Lemma3.3, p.12.)

**Checks.**

- For `x³−3, D_L=−243, D_K=−3` and `f=9`. Wild conductors must survive the formula.

<a id="quadratic-order-three-torsion-bound"></a>

**Quadratic order three torsion bound.** For the order `O_f=ℤ+f O_K` of conductor `f≥1` in a quadratic field `K, h₃(Pic(O_f)) ≤ 3^{ω(f)+1} h₃(Cl(K))`. If `3∤f` the sharper factor `3^{ω(f)}` holds. Equivalently the `3-rank` increases by at most `ω(f)+1`, and by at most `ω(f)` away from3. At `f=1` the groups agree. The extra dimension at the wild prime3 cannot be discarded.

`K/ℚ` is quadratic; `f` is a positive integer; `Pic` means invertible proper ideal classes.

Proof: Use the conductor exact sequence for the existing Picard group of `O_f`, ending in `Cl(K)`. By CRT the residue-unit kernel is a quotient of `∏_{p^a∥f}(O_K/p^a O_K)ˣ/(ℤ/p^a ℤ)ˣ`. For `p≠3` its `3-rank` is at most1: the principal-unit part is a `p`-group, and the residue quotient is cyclic or a `p`-group. For `p=3` its 3-primary quotient has at most two generators, including the ramified principal-unit case. Quotienting by global units does not increase the number of 3-primary generators. In a finite abelian exact sequence the 3-torsion cardinal of the middle group is at most the product of those of kernel and quotient.

*Needs:* `TauCetiRoadmap.GlobalNumberFields` Layer 11, [ArithmeticStatisticsPartIV: torsion count of class groups](../ArithmeticStatisticsPartIV/README.md#torsion-count-of-class-groups).

([[93]](#ref-93), §3, Lemma3.3 proof, p.12.)

**Checks.**

- At `f=1, Pic(O_f)=Cl(K)`; use this equality rather than the nonsharp uniform bound.

- At `K=ℚ(√−39), f=9, Cl(K)` has order4 and the residue-unit kernel is `C₃²`. Thus `h₃(Pic(O_9))=9` whereas `3^{ω(9)}h₃(Cl(K))=3`. The corrected uniform bound permits9.

<a id="cubic-large-total-ramification-bound"></a>

**Cubic large total ramification bound.** For either discriminant sign and `X≥1`, the number of cubic fields of `|disc|<X` totally ramified at a fixed prime `p` is `O(X/p²)`, with an absolute implied constant. Therefore the union over `p>M` is `O(X/M)`. This field assertion supplies the `Y_p` part; nonmaximal cubic rings `W_p` are a separate Layer 2 estimate.

Proof: Apply the conductor–discriminant adapter and the quadratic-order torsion bound to the ring-class characters forced by total ramification. Sum the conductor contributions with the first-moment quadratic three-torsion bound; the condition `p|f` contributes `p^{-2}`. Sum `p^{-2}` over `p>M`; invoke the Layer 2 nonmaximal estimate only when passing from fields to forms.

*Needs:* [cubic conductor discriminant](#cubic-conductor-discriminant), [quadratic order three torsion bound](#quadratic-order-three-torsion-bound), [three torsion of quadratic class groups counts cubic fields](#three-torsion-of-quadratic-class-groups-counts-cubic-fields), [ArithmeticStatisticsPartIII: binary cubic counts with congruence conditions](../ArithmeticStatisticsPartIII/README.md#binary-cubic-counts-with-congruence-conditions).

([[91]](#ref-91), §8, Proposition29, pp.23–26.)

**Checks.**

- At `p=3` the count includes `X³−3` for `X>243`: its field discriminant is `−243` and its conductor is wild. The assertion is for prime `p`; substituting `p=1` would not describe a ramification condition. Summing `p^(−2)` over `p>M` is bounded by the integer tail `O(1/M)`, so the stated union bound needs no prime-number asymptotic.

### 3.20 Imported secondary cubic estimates

<a id="secondary-cubic-lattice-coefficient"></a>
<a id="cubic-secondary-local-factor-evaluation"></a>
<a id="cubic-root-weighted-sieve-identity"></a>
<a id="refined-cubic-sieve"></a>
<a id="cubic-secondary-orbit-integral"></a>

Use [ArithmeticStatisticsPartIII §2.11, refinement-cubic-secondary-congruence-count](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-congruence-count) for the dyadic averaged lattice count, including `m⁴≤X`, the `m/T` error and the separate translated coefficient. Use [refinement-cubic-secondary-sieve-error](../ArithmeticStatisticsPartIII/README.md#refinement-cubic-secondary-sieve-error) for strongly acceptable specifications, the primitive-index local integrals, projective-root switching and the optimized error. Their source is [[91]](#ref-91), Theorem27 and Remark3 pp.19–20, §7 pp.21–22 and §9 pp.27–36. The cumulative field and class-group specializations are §3.5; no cumulative estimate for a noninvariant lattice is required here.

### Arithmetic lattice and torsion inputs

<a id="relative-small-split-prime-torsion-bound"></a>

**Relative small-split-prime torsion bound.** For a number-field extension `L/K` with `d=[L:K]≥2`, put `N=[L:ℚ]` and `D=Nm(disc(L/K))`. Let `ℓ≥1`, `ε>0` and `0<θ<1/(4ℓ(N−1))`. If `M≥1` distinct primes of `K` of norm strictly less than `D^θ` split completely in `L`, then `|Cl(L/K)[ℓ]|≪_(N,θ,ε) D^(1/2+ε)|disc K|^((d−1)/2+ε)/M`. Here `Cl(L/K)` is the norm kernel. No coprimality of `ℓ` and `d` is required.

Construct the relative Arakelov norm-kernel lattice, compare its covolume with the regulator ratio, and pack the prime-ratio classes. Use pairs of distinct primes over each completely split base prime; their valuation pattern prevents descent to a proper intermediate field. A packing collision gives height `O_N(D^(2θℓ))`, contradicting the discriminant-height inequality for a relative primitive element in this range. Norms of the principal generators are base units, not necessarily one. Pigeonhole them modulo `(O_Kˣ)^d`, whose index is at most `d^[K:ℚ]`, divide the generators by suitable base units, and take ratios inside one class. Their relative norms are then one and every weighted archimedean block sum vanishes. Include this finite cost in the packing constant. The regulator/class-number comparison is part of this target, using the relative regulator lower bound and bounded-degree Brauer–Siegel as in [[95]](#ref-95), Lemma2.4, p.8; elementary ideal counts alone do not give it.

*Needs:* [relative torsion splitting](#relative-torsion-splitting), `ClassFieldTheory` Layer13, GeometryOfNumbersAndQuadraticArithmetic §1, AnalyticNumberTheoryPartI §2.32.

Source: [[95]](#ref-95), Lemma2.1 and Remark2.2, pp.7–9; the base-discriminant exponent is the relative-degree exponent of Lemma2.4, p.8.

**Checks.**

- For `K=ℚ`, the base-discriminant factor is one and the result is the absolute small-split-prime bound.
- At `M=0` division is unavailable; at `M=1` the target gives the relative trivial scale. A prime of norm exactly `D^θ` is outside the strict hypothesis.
- For `d=2,ℓ=3`, the allowed range is `0<θ<1/(12(N−1))`. Generator norms in different unit-square classes must be separated before taking norm-one ratios.

<a id="integer-lattice-largest-minimum"></a>

**Largest minimum of the integer lattice.** `FieldStatistics.integerLattice_largestMinimum` asserts that for a degree-`n≥2` number field `K`, the last successive minimum of `O_K` in its canonical real embedding is `≪_n |disc K|^(1/n)`. The Euclidean norm counts each complex pair once. Together with the basis-from-minima theorem this gives a `ℤ`-basis of the whole integer ring with the same bound, up to a degree-dependent constant.

Use successive-minimum witnesses with first vector one, and an adapted integral basis to express multiplication. If the coefficient-of-the-last-vector pairing on the middle `n−2` vectors were degenerate, multiplication by a nonscalar element would preserve a codimension-one rational subspace. That subspace would be a vector space over a proper extension of `ℚ`, contradicting divisibility of dimensions. A nonzero determinant term pairs the middle vectors so that their length products dominate the last minimum. Multiply these inequalities and apply Minkowski's second theorem. Convert independent short witnesses into a full integral basis using the named supplier; independence alone does not give index one.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §§1.2–1.5 (successive minima and Minkowski's second theorem), [HeightsAndUnits Layer2.1, a basis from the minima](../HeightsAndUnits/README.md#layer-2-a-basis-from-the-minima-and-bombierivaaler-in-the-sup-norm).

Source: [[99]](#ref-99), Theorem1.6 p.3 and §3, Theorem3.1 p.5.

**Checks.**

- In degree two the middle multiplication matrix is empty; Minkowski's product bound with the first minimum bounded gives the required square-root scale directly.
- For `ℚ(i)` the basis `(1,i)` has both lengths one. The result controls the last minimum as well as the first.
- The lattice with Gram matrix `diag(1,T²)` has last minimum `T` and covolume `T`. Generic lattice bounds cannot replace the arithmetic exponent `1/n`; the ring multiplication is essential.

<a id="small-square-ideal-generators"></a>

**Small square-ideal generators.** For every `c∈Cl(O_K)[2]` in a degree-`n` number field, choose a nonzero integral ideal `I` representing `c` and `β∈O_K` with `I²=(β)` and `|σ(β)|≤C_n|disc K|^(1/n)` at every archimedean embedding. Distinct ideal classes can be assigned distinct such generators. Apply Minkowski to `I⁻¹` with the box scaled by the archimedean absolute values of an initial generator of `I²`; replacing `I` by `κI` makes it integral and balances the generator. Retain the complex-place volume factors.

*Needs:* GlobalNumberFields Layers3 and11 (fractional ideals and their lattices), GeometryOfNumbersAndQuadraticArithmetic §1.

Source: [[99]](#ref-99), Theorem1.5 p.3 and Theorem2.1/§2 p.4, specialized to `m=2`.

**Checks.**

- The identity class permits `I=O_K,β=1`; the absolute norm is a nonzero square.
- In `ℚ(√−5)`, `I=(2,1+√−5)` has `I²=(2)` and represents the nontrivial two-torsion class.
- An arbitrary generator multiplied by a large unit need not satisfy the archimedean bound; the conclusion chooses a representative and generator together.

<a id="square-norm-counting"></a>

**Square-norm counting and quadratic-subfield comparison.** For degree `n≥3` fields with no index-two subfield, the square-norm estimate bounds the number of `β∈O_K` with all conjugates `≤C_nD_K^(1/n)` and square absolute rational norm by `O_(n,ε)(D_K^(1/2−1/(2n)+ε))`. Primitive translation lines have `O_n(D_K^(1/2−1/n))` representatives. On each, use both signs in `y²=±Nm(β−x)`, each an absolutely irreducible degree-`n` curve in a box of side `O_n(D_K^(1/2))`. Prove the uniform Bombieri–Pila determinant-method bound `O_(n,ε)(B^(1/n+ε))` for its integral points. This curve estimate, with degree fixed and coefficient-independent constant, is an owned supporting result here. Nonprimitive elements lie in proper subfields of index at least three; the preceding lattice bound counts them by `O_n(D_K^(1/3))`, which is within the target exponent.

For a quadratic `K/F`, also prove the genus-theoretic comparison `h₂(K)≪_(n,ε)D_K^ε h₂(F)²`, including dyadic and real ramification. The ambiguous-class exact sequence and the norm/extension maps give this bound. Induction on degree, with the quadratic genus bound as base, handles the index-two case in the torsion target below; no assertion of the square-norm element count is made for that case.

*Needs:* [largest minimum of the integer lattice](#integer-lattice-largest-minimum), `ClassFieldTheory` Layer13, [ArithmeticStatisticsPartIV: class group ranks](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank).

Source: [[99]](#ref-99), §4 pp.6–7, including Lemma4.1 and the application of Bombieri–Pila, *The number of integral points on arcs and ovals*, Theorem5 (its reference [4]).

**Checks.**

- In odd degree no index-two subfield exists; the square-norm count applies directly.
- If `[K:F]` is even, `Nm_(K/ℚ)(β−x)` can be a polynomial square for `β∈F`; the primitive-line estimate cannot be applied to it.
- At `n=3` the product of translation-line and curve exponents is `1/6+1/6=1/3`. The nonprimitive contribution has this same exponent.

<a id="class-group-two-torsion-power-saving"></a>

**Two-torsion power saving.** `FieldStatistics.classGroupTwoTorsion_powerSaving` proves `h₂(K)≪_(n,ε)D_K^(1/2−1/(2n)+ε)` for every degree-`n≥3` number field and every `ε>0`. Count the chosen small square-ideal generators by the square-norm estimate. In the index-two case apply the genus comparison and the result in smaller degree; the degree-two genus bound is subpolynomial. This gives a uniform field-dependent discriminant bound, not an average over fields.

*Needs:* [small square-ideal generators](#small-square-ideal-generators), [square-norm counting](#square-norm-counting).

Source: [[99]](#ref-99), Theorem1.1 p.1 and §4 pp.6–7; its stronger cubic/quartic bounds imply the displayed weaker estimate in those degrees too.

**Checks.**

- At `n=3` the exponent is `1/3`, and at `n=4` it is `3/8`.
- Degree two uses genus theory and is outside this statement; the bound does not claim a uniform positive saving independent of degree.
- For `ε<1/(2n)` the exponent is strictly below `1/2`; choosing `ε=1/(4n)` retains saving `1/(4n)`.

<a id="elliptic-point-rank-bounds"></a>

**Elliptic integral-point and rank bounds.** For an integral Weierstrass equation of an elliptic curve `E/ℚ` with nonzero equation discriminant `Δ`, `FieldStatistics.elliptic_integralPoints_rankBound` proves `#E(ℤ)≪_ε|Δ|^ε exp((β+ε)rank E(ℚ))`, where `α=√3/2` and `β=((1+α)/(2α))log((1+α)/(2α))−((1−α)/(2α))log((1−α)/(2α))`. For a monic separable cubic `f∈ℤ[X]`, the same supporting target supplies `rank E(ℚ)≤dim_𝔽₂ Cl(ℚ[X]/(f))[2]+2ω(|Δ|)+2` for `E:y²=f(x)`. For an étale product the class-group dimension is the sum over its factors. Keep the equation discriminant and the field discriminant distinct.

Prove the point bound by the height decomposition, local repulsion and spherical-code estimate used in the `t=0` case of Helfgott–Venkatesh, Corollary3.11 (reference [11] of [99]). Prove the rank bound by the cubic-algebra two-descent map into squareclasses, its norm-square condition, the unramified ideal-class quotient and local contributions at primes dividing `2Δ` and infinity; use the exact Brumer–Kramer bound recorded in [99], Theorem5.2. Both quantitative estimates are targets here, with their local and height arguments, rather than consequences of mere finiteness of integral points.

*Needs:* `TauCetiRoadmap.EllipticCurves` Layers6–7 (Mordell–Weil, descent and Selmer groups), `ClassFieldTheory` Layer13 and GlobalNumberFields Layer11.

Source: [[99]](#ref-99), §5.1, Theorems5.1–5.2 and (1)–(3), pp.7–8, with the original results identified there.

**Checks.**

- Rank zero leaves the bound `O_ε(|Δ|^ε)`; it does not force the integral-point set to be empty.
- A repeated root gives `Δ=0` and a singular cubic, excluded from both estimates.
- For `y²=x³−x` the cubic algebra is `ℚ³`, so its class-group contribution is zero; the ramified-prime and constant terms remain.

<a id="cubic-class-group-two-torsion-bound"></a>

**Cubic two-torsion bound.** With `β` as above and `a=1/(6(1−β/log2))`, `FieldStatistics.cubicClassGroupTwoTorsion_bound` proves `h₂(K)≪_εD_K^(a+ε)` for all cubic fields, cyclic or noncyclic. Translate the small generators to `O(D_K^(1/6))` elliptic curves with cubic algebra `K`, equation discriminant `O(D_K²)` and the coordinate bounds of [[99]](#ref-99), §5.1. The preceding point/rank estimates give `h₂(K)≪_εD_K^(1/6+ε)h₂(K)^(β/log2+ε)`. Prove `β<log2`, solve this inequality and rename `ε`.

*Needs:* [small square-ideal generators](#small-square-ideal-generators), [largest minimum of the integer lattice](#integer-lattice-largest-minimum), [elliptic integral-point and rank bounds](#elliptic-point-rank-bounds).

Source: [[99]](#ref-99), §5.1, (1)–(4), pp.7–8.

**Checks.**

- Numerically `β≈0.2782` and `a≈0.2784`; they are different constants and `a<1/3`.
- Solving the feedback inequality gives denominator `1−β/log2`, not `1−β`.
- The bound applies to cyclic cubic resolvents as well as `S₃` fields; the quartic applications need both families.

### 3.25 Uniform torsion estimates in quadratic towers

<a id="uniform-small-degree-field-bound"></a>

**Uniform quadratic field bound.** `FieldStatistics.quadraticFieldCount_uniform` states the degree-uniform cumulative estimate. For a number field `F` and `ε>0`, quadratic extensions satisfy `N_F(C₂,X)≪_{[F:ℚ],ε}h₂(F)D_F^εX` for `X≥1`. This improves the discriminant exponent in the cumulative degree-two-or-three supplier bound.

Proof: count quadratic idèle characters by their local conductors, bound the number of choices at each conductor by the base two-torsion factor and the local multiplicity, and count the resulting ideals through smoothed Perron and the Dedekind-zeta convexity bound. Embedded quadratic extensions and isomorphism classes coincide.

*Needs:* [rigid embedded field family](#rigid-embedded-field-family), `TauCetiRoadmap.ClassFieldTheory` Layer 13, Completed EffectiveBounds Layer 1, AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[95]](#ref-95), §5, Lemma5.8, p.25.)

**Checks.**

- For `F=ℚ, D_F=h₂(F)=1` and the bound is `Oε(X)`, in agreement with the quadratic-field asymptotic. For `0<X<1` there are no positive integral relative discriminant norms in the count; the asserted uniform estimate is stated for `X≥1`.

<a id="shintani-cubic-order-uniform-bound"></a>

**Shintani cubic order uniform bound.** Let `κ_F=Res_{s=1}ζ_F` and `h=h₂(F)`. Cubic `O_F`-orders with nonzero discriminant norm `≤X` satisfy `N_{O_F,3}(X)≪_{[F:ℚ],ε}κ_F X+X^{-1/2−ε}hD_F^{9/2+ε}`. In particular `N_{O_F,3}(X)≪_{[F:ℚ],ε}D_F^εX` once `X≥D_F³h^{2/3}`. The `F=ℚ` case uses the separate cubic lattice count; the assertion `ξ_F(0)=0` used in the contour shift requires `[F:ℚ]≥2`.

Proof: Use the Shintani order series with isomorphism weights `|Aut R|^{-1}`; unweighted counts differ by a bounded factor in degree3. Apply smoothed Perron, moving past the poles1 and `5/6` to Re `(s)=−1/2−ε`. Use the functional equation and the absolute-convergence bound for its dual to control the remainder. For `F=ℚ` apply the congruence orbit count.

*Needs:* [rigid embedded field family](#rigid-embedded-field-family), [ArithmeticStatisticsPartIII: uniformity estimate for nonmaximal binary cubic forms](../ArithmeticStatisticsPartIII/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms), AnalyticNumberTheoryPartII §§5.8, 5.21 and 5.28, AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[95]](#ref-95), §3.2, Proposition3.6 and Lemmas3.7–3.10, pp.12–16.)

**Checks.**

- At `X=D_F³h^(2/3)`, the displayed error is at most `D_F^εX` after renaming `ε`. For `F=ℚ` use its cubic lattice estimate; the degree-at-least-two assertion `ξ_F(0)=0` must not be applied to `ζ_ℚ(0)=−1/2`.

<a id="relative-three-torsion-propagation"></a>

**Relative three torsion propagation.** For every number field `F`, both `Σ_{[K:F]=2,Disc(K/F)≤X}h₃(K/F)` and `N_F(S₃,X)` are `≪_{[F:ℚ],ε}D_F^{1/2+ε}κ_F^{-2}X^{1/2}(D_Fh₂(F)^{1/3}+X^{1/2})`. This follows from an order-series lower bound over each quadratic resolvent, with weight `|Aut R|^{-1}`, and ideal-count lower bounds beyond `T≥C D_F^{1/2+δ}κ_F^{-1}`. For the `S₃` count the conductor sum includes wild nonsquarefree conductors.

The supporting cubic-order resolvent mass identity uses the following precise family. Fix a quadratic `K/F`, put `d=Nm(disc(K/F))`, and let `A` run over `F×K` and the non-Galois cubic `F`-fields with quadratic resolvent `K` and relative discriminant ideal `disc(K/F)`. For each such `A` include **all** `O_F`-orders `R` in `A`, up to isomorphism. With `C=Cl(K)/extended(Cl(F))`, the identity is

`Σ_A Σ_[R⊂A] (|Aut_(O_F)(R)| Nm(disc(R/F))^s)⁻¹ = h₃(K/F)/(2d^s) · ζ_F(2s)ζ_F(6s−1) · Σ_(a⊂O_K squarefree, [a]∈3C) Nm(a)^(−2s)`

for Re `(s)>1`, and also coefficientwise. The squarefree ideals a on the right are an Euler expansion; they are not conductors of arbitrary cubic fields. The maximal generic algebras on the left have conductor one. Nonmaximal orders in them are unrestricted, including at three.

Here is the weight correction and proof. Let `e_A(j)` count embedded suborders of `O_A` with squared index norm `j`. The Datskovsky–Wright local order calculation, [144], Theorems3.1 and6.1, pp.42–45 and68 (also [95], Lemma3.9, pp.13–14), gives

`Σ_j e_A(j)j^(−s) = ζ_F(4s)ζ_F(6s−1)ζ_A(2s)/ζ_A(4s)`.

For clarity, the local calculation has the following complete numerical contract. At a finite prime of residue size `q` put `u=q^(−2s)`. For local splitting types `(111),(12),(3),(1²1),(1³)`, respectively, the factor is

`η(u)/((1−u)(1−qu³))`, with `η(u)=(1+u)², 1+u², 1−u+u², 1+u, 1`.

These formulas include ramified quadratic and cubic algebras at residue characteristics two and three. In [144], Theorem3.1, pp.42–45, compact invariance and Iwasawa decomposition reduce the local orbital integral to valuation shells; removing the common dilation shell contributes `(1−qu ³)`, and the remaining trace/norm integrality conditions give exactly these five numerators. The ramified cases use a uniformizer of the extension, so they do not require a tame discriminant formula. At each prime the same list equals `(1−u²)⁻¹(1−qu³)⁻¹∏_(P|p)(1+u^f(P/p))`. Multiplication over primes is Theorem6.1, p.68. The order dictionary identifies `GL₂(O)`-cosets with based orders; the finite generic stabilizer converts their local orbital masses into embedded-suborder counts, normalized by the maximal order's constant term one. Thus this use of Theorem6.1 counts orders, not just field discriminants.

`Aut_F(A)` acts on these embedded orders, and its stabilizer at `R` is exactly `Aut_(O_F)(R)`: every order automorphism extends uniquely to A. Thus each orbit contributes `|orbit|/|Aut_F(A)|=1/|Aut(R)|`. Divide the **embedded** series by `|Aut_F(A)|` before passing to isomorphism classes. This repairs the printed isomorphism-class/generic-automorphism mismatch in [95], Lemma3.13; an inequality between the two automorphism orders does not by itself justify that equality. The reducible algebra has automorphism order two; every non-Galois cubic algebra has order one.

Unramified class-field theory pairs each nontrivial `χ∈Ĉ[3]` with `χ⁻¹`, while the trivial character supplies `F×K`. The Artin factorization cancels `ζ_F(4s)` and gives `ζ_F(2s)ζ_F(6s−1)L_K(2s,χ)/L_K(4s,χ²)`. At each prime ideal this last quotient has factor `1+χ(P)Nm(P)^(−2s)`, since `χ³=1`. Expanding and summing `χ` gives `h₃(K/F)` precisely on the squarefree ideals whose class lies in `3C`. This proves the displayed corrected identity, including every local order factor. This is the argument of [95], Lemma3.13, pp.16–17, with orbit–stabilizer inserted at the missing weight conversion.

For propagation retain only `a=O_K` and the constant coefficient of `ζ_F(6s−1)`. Coefficient positivity gives at least `(h₃(K/F)/2) A_F(√(Y/d))` orders in mass, where `A_F(T)` counts integral ideals of norm `≤T`. Lemma3.14, p.17 gives `A_F(T)≫κ_F T` once `T≥C D_F^(1/2+δ)κ_F⁻¹`. Set

`Y=max(D_F³h₂(F)^(2/3), C²κ_F⁻² X D_F^(1+2δ))`.

Different quadratic resolvents have disjoint generic algebras. Summing their lower bounds over `X/2≤d≤X` and using the Shintani order upper bound yields `Σh₃(K/F)≪D_F^ε X^(1/2)Y^(1/2)/κ_F`. Expand the maximum, use `κ_F≪_(n,ε)D_F^ε`, rename `ε` and sum dyadically. This is exactly the asserted torsion estimate; it needs no all-conductor *field* identity.

For the `S₃` count the additional cubic-conductor choice estimate is an upper bound from ray characters, rather than a false squarefree-conductor assertion. Write `disc(L/F)=disc(K/F)q²`. Away from three, order-three characters are tame, so the prime-to-three part `q₀` is squarefree. The part `q₃` is supported above three with exponents bounded in terms of `n=[F:ℚ]`. Indeed in `K_P` at three, the logarithm on `U^(e+1)`, with `e=v_P(3)`, shows `U^(2e+1)` consists of cubes; an order-three character is trivial there. Anti-invariance under `Gal(K/F)` and the discriminant identity translate this to a degree-dependent bound on `q₃`. One may use the loose bound `q₃|(3)^(6n+6)`, hence `Nm(q₃)≤3^(n(6n+6))`. For fixed `q` the character exact sequence has unramified kernel `Ĉ[3]`; each tame prime contributes at most `C_n` choices, and all wild choices contribute a bounded factor depending only on `n`. Unit and anti-invariance constraints only reduce this number. Thus the number of fields is at most `C_n C_n^ω(q₀) h₃(K/F)`. This proves the required all-conductor upper bound, including wild three, directly from ClassFieldTheory and the local unit filtration.

Sum the torsion bound at `X/Nm(q)²`. The series with coefficients `C_n^ω(q₀)` is coefficientwise bounded by a fixed power of `ζ_F`. Its sum with weight `Nm(q₀)⁻²` converges uniformly at fixed degree; its weight-`Nm(q₀)⁻¹` partial sums are `O_(n,ε)(X^ε)`. The bounded wild part changes only `C_n`. If the resulting `X^ε√X` term dominates `X`, then `X` is bounded by a fixed power of `D_Fh₂(F)^(1/3)`, as in [95], Proposition3.12, pp.18–19, and `X^ε` is absorbed into `D_F^ε` after the elementary class-number bound. This gives the displayed `S₃` estimate. No conductor is dropped to obtain its five-range consequences.

*Needs:* [shintani cubic order uniform bound](#shintani-cubic-order-uniform-bound), [relative torsion splitting](#relative-torsion-splitting), `TauCetiRoadmap.ClassFieldTheory` Layer 13, AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[95]](#ref-95), §3.3, Lemmas3.13–3.14 and Proposition3.15, pp.16–18; Proposition3.12 and its proof, pp.16,18.)

**Checks.**

- For `F=ℚ, D_F=h₂(F)=κ_F=1`, the bound becomes `Oε(√X+X)`. Wild conductor 9 from `X³−3` remains among the `S₃` choices: `−243=(−3)·9²`.
- An `Aut(A)=C₂` orbit of two embedded orders, each with trivial stabilizer, contributes `2/2=1` to mass, rather than `1/2`. An invariant order contributes `1/2`. These are the two weight-conversion cases; replacing `Aut(R)` by `Aut(A)` on isomorphism classes fails the first.
- Concretely, for `A=ℚ×ℚ(√5)`, eleven splits in the quadratic factor. The three index-eleven embedded suborders identify two of the three residue coordinates. The quadratic involution exchanges two of them and fixes the third: their isomorphism-class mass is `1+1/2=3/2`, whereas weighting each class by `1/|Aut(A)|` gives only1. The local (111) coefficient is three before division by `|Aut(A)|=2`.
- The unit ideal `a=O_K` supplies the constant term one on the right. At a prime with `χ(P)` a cube root of unity, `(1−χ(P)²u²)/(1−χ(P)u)=1+χ(P)u`; no assumption that `P` avoids three is used in this order identity.
- At residue size `q=3` and `s=1`, the totally ramified local order factor is `2187/1936` and the split factor is `675/484`. Both retain the denominator `1−3u³` with `u=1/9`; replacing `q` by one changes them.
- At `X=1` all conductor sums include the unit ideal. The bounded wild factors cannot be replaced by a squarefree condition, even over `ℚ`.

<a id="relative-three-torsion-piecewise-bound"></a>

**Relative three torsion piecewise bound.** Put `D=D_F` and `h=h₂(F)`. The sum of `h₃(K/F)` over quadratic `K/F` with relative discriminant norm `≤X`, and also `N_F(S₃,X)`, are bounded by `D^ε` times: `hX^{3/2}D^{1/2}` for `X≤Dh ^{-2/3}; h^{1/3}X^{1/2}D^{3/2}` for `Dh ^{-2/3}≤X≤D²h^{2/3}`; `XD ^{1/2}` for `D²h^{2/3}≤X≤D^{5/2}h^{2/3}; h^{2/3}D³` for `D^{5/2}h^{2/3}≤X≤D³h^{2/3}`; and `X` above `D³h^{2/3}`. Constants depend on `[F:ℚ],ε` and are ineffective. Thus both are `≪D^{1+ε}h^{2/3}X`.

Proof: Use the fixed-discriminant estimate in the first range. Use propagation, the relative trivial class-group bound, and the large-range order count in the remaining ranges. Compare at the four boundary values and take the least valid bound in every range.

*Needs:* [AnalyticNumberTheoryPartII §5.7](../AnalyticNumberTheoryPartII/README.md#s5-7), [relative three torsion propagation](#relative-three-torsion-propagation), [shintani cubic order uniform bound](#shintani-cubic-order-uniform-bound), Completed EffectiveBounds Layer 1.

([[95]](#ref-95), Theorem3.1, Corollary3.2 and Remark3.3, pp.10–12.)

**Checks.**

- At the first threshold `X=Dh ^(−2/3)`, both adjacent expressions equal `D²` before `D^ε`. At `X=D²h^(2/3)`, both equal `D^(5/2)h^(2/3)`; the remaining thresholds similarly agree. Putting `D=h=1` leaves the large-range `Oε(X)` bound for `X≥1`.

<a id="quadratic-tower-torsion-tail"></a>

**Quadratic tower torsion tail.** For each `m≥2` there are `δ_m>0` and `α_m`, depending only on `m` and `[k:ℚ]`, such that the sum of `h₃(F_m/k)` over quadratic towers `F_m/F_{m−1}/…/k` with `D_{F_{m−1}}≥Y` and `X/2≤D_{F_m}≤X` is `O_{m,[k:ℚ],ε}(D_k^{α_m}(X/Y^{1−ε}+X^{1−δ_m}))`. This counts towers, so it is an upper bound when intermediate fields are forgotten.

`m≥2; X,Y>0; ε>0`; discriminants here are absolute discriminants.

Proof: In the base case split `D_{F₁}` at `X^{1/3±δ₀}`; the noncritical ranges use the five-range estimate and partial summation. Before applying the relative small-prime lemma, pigeonhole generator norms in `O_K^*/(O_K^*)^d`, a set of size at most `d^[K:ℚ]`. Rescale generators in one class by base units; their ratios then have relative element norm1, so each archimedean block sum vanishes. This gives the needed unit normalization at bounded degree-dependent cost. In the critical range use the relative small-split-prime torsion bound and two applications of the quadratic zero-density estimate. Treat each exceptional field set by its cardinal bound and the uniform class-group bounds. Induct on `m`, splitting the preceding discriminant at `X^b` and choosing `b` and `δ₀` so every exponent stays below1.

For the critical base range `X^(1/3−δ₀)≤D_F₁≤X^(1/3+δ₀)`, fix `0<δ₀<1/100` and a positive `δ₁<1/(12(4[k:ℚ]−1))`. Set `B₀=X^(1/3+δ₀)`, `B₁=X/D_F₁²` and `x=(X/(2D_F₁²))^δ₁`. Use the single exceptional set `E(k,B₀,ε₁)` simultaneously for all prime cutoffs `4≤t≤B₀`, and for each surviving `F₁` the single set `E(F₁,B₁,ε₁)` for all `4≤t≤B₁`. In particular take `t=x/2` in the first and `t=x` in the second. For sufficiently large `X` these lie in the required ranges; the bounded remaining range is absorbed in the constant. Each set has cardinal `O_(degree,ε₁)(D_base^ε₁ B_i^ε₁)` and is fixed before varying `t`. The induction reuses this two-step contract at the corresponding penultimate base.

*Needs:* [relative small-split-prime torsion bound](#relative-small-split-prime-torsion-bound), [relative three torsion piecewise bound](#relative-three-torsion-piecewise-bound), [relative torsion splitting](#relative-torsion-splitting), [uniform quadratic field bound](#uniform-small-degree-field-bound), Completed EffectiveBounds Layer 1, [AnalyticNumberTheoryPartI §2.48: many split primes outside a small quadratic exception set](../AnalyticNumberTheoryPartI/README.md#s2-48), [§2.38: ray-class zero density](../AnalyticNumberTheoryPartI/README.md#s2-38), §2.32 (Brauer–Siegel) and §3.27 (ideal counting); Completed ArithmeticDirichletSeries Layer 6.

([[95]](#ref-95), §5, Theorem5.1, Lemmas5.7–5.9 and induction, pp.22–29.)

**Checks.**

- Every quadratic tower obeys `D_Fm=D_F(m−1)² Norm(d_Fm/F(m−1))`. Thus `Y>√X` makes the specified tail empty. The base case is `m=2; m=1` would have no varying penultimate field.

- At a prime cutoff `t=4`, the split-prime supplier still uses the same exceptional set as at larger `t`; its error may dominate the main term at this endpoint.

- For `D_F₁≈X^(1/3)`, the second family bound is `B₁≈X^(1/3)` and the chosen prime cutoff is `≈X^(δ₁/3)`, within both applications for large `X`.


### 3.26 Wreath-type field counts and torsion means

<a id="wreath-transposition-fibre"></a>

**Wreath transposition fibre.** A transitive permutation2-group `G≤S_{2d}` contains a transposition exactly when `G=C₂≀H`, after conjugacy, for a unique transitive `H≤S_d`. Every such `G`-field `K/k` has a unique subfield `F` with `[K:F]=2`. Over a labeled `H`-field each quadratic `K/F` with a transposition has `2^d` compatible labelings. The permutation normalizers satisfy `|Aut_perm(G)|=2^d|Aut_perm(H)|`. For an arbitrary transitive `H` the same unique index-two subfield statement holds for `G=C₂≀H`.

`d≥1; G,H` are permutation groups, not merely abstract groups.

Proof: The transpositions identify the2-element blocks; transitivity supplies all independent block flips. Use the subgroup lattice above a point stabilizer to prove uniqueness of the index-two intermediate field. Count the independent embedding labels in every block and calculate the kernel of the normalizer map.

*Needs:* [rigid embedded field family](#rigid-embedded-field-family).

([[95]](#ref-95), Lemmas6.6–6.8, pp.33–34; proof of Theorem6.1, p.37; Theorem8.1, pp.40–41.)

**Checks.**

- For `d=1, H=1` and `G=C₂`, the unique quadratic-step base is `k` and the normalizer factor is 2. In degree four, `D₄=C₂≀C₂` has transpositions whereas the regular `V₄` does not.

<a id="thin-two-group-torsion"></a>

**Thin two group torsion.** For degree `2^m` extensions with2-group normal closure, the number at a fixed relative discriminant norm `D` is `O_{m,[k:ℚ],ε}(D^εD_k^{α_m})`. If the transitive group `G` has no transposition, its discriminant ideal is powerful, the cumulative count is `O(X^{1/2+ε}D_k^α)`, and its total relative three-torsion is `O(X^{1−δ}D_k^α)` for some `δ>0`.

Proof: Before applying the relative small-prime lemma, pigeonhole generator norms in `O_K^*/(O_K^*)^d`, a set of size at most `d^[K:ℚ]`. Rescale generators in one class by base units; their ratios then have relative element norm1, so each archimedean block sum vanishes. This gives the needed unit normalization at bounded degree-dependent cost. A finite `p`-group subgroup chain expresses the field as a tower of quadratic extensions. Use the fixed-discriminant quadratic character estimate and the2-torsion bound in quadratic towers. A nontrivial inertia group without a transposition has permutation index `≥2`; count powerful discriminants. Combine the tower tail with the relative small-split-prime bound in the remaining short-base range.

In the short-base range put `Y=X^b` with a fixed sufficiently small `0<b<1/2`, `B_F=X/D_F²` and `x=(X/(2Y²))^δ₁`, where `0<δ₁<1/(12([K:ℚ]−1))`. For each `D_F≤Y` fix `E(F,B_F,ε₁)` once, uniformly for `4≤t≤B_F`; use it at `t=x`. For sufficiently large `X`, `4≤x≤B_F` for every such base. The cardinal is `O_(degree,ε₁)(D_F^ε₁B_F^ε₁)`; neither the exception set nor its constant depends on the chosen prime cutoff. Treat bounded `X` with the uniform class-group bounds.

*Needs:* [relative small-split-prime torsion bound](#relative-small-split-prime-torsion-bound), [AnalyticNumberTheoryPartII §5.7](../AnalyticNumberTheoryPartII/README.md#s5-7) (pointwise quadratic bound), [uniform quadratic field bound](#uniform-small-degree-field-bound), [quadratic tower torsion tail](#quadratic-tower-torsion-tail), Completed EffectiveBounds Layer 1, [AnalyticNumberTheoryPartI §2.48: many split primes outside a small quadratic exception set](../AnalyticNumberTheoryPartI/README.md#s2-48), [§2.38: ray-class zero density](../AnalyticNumberTheoryPartI/README.md#s2-38), §2.32 (Brauer–Siegel) and §3.27 (ideal counting); Completed ArithmeticDirichletSeries Layer 6, `TauCetiRoadmap.ClassFieldTheory` Layer 13.

([[95]](#ref-95), Lemma6.3 and Theorems6.4–6.5, pp.31–33.)

**Checks.**

- A regular `V₄` quartic has no transposition; its nontrivial inertia indices are at least two. `A D₄` quartic has transpositions and is excluded from this thin-family conclusion. The unit ideal is powerful, so unramified finite discriminant is retained.

- For `D_F≤Y=X^b`, `B_F≥X^(1−2b)`; the common prime cutoff `(X/(2Y²))^δ₁` is smaller when `δ₁<1`.

- An exceptional set chosen separately at every prime cutoff would not give the simultaneous split-prime contract used in this tail; fix `E(F,B_F,ε₁)` first.


<a id="quadratic-tower-counting-constants"></a>

**Quadratic tower counting constants.** `FieldStatistics.twoExtension_fieldCount` states the embedded two-extension asymptotic and convergence and positivity of its base-field constant. Embedded degree `2^m` fields with2-group closure satisfy `#E_k(m,X)~D_mX`, where `D_m=Σ_F κ_F/(2^{r₂(F)}ζ_F(2)D_F²)>0` over embedded degree `2^{m−1}` two-extensions. For rigid `G=C₂≀H` fields the constant is `D_G=Σ_{F rigid H}2^{d−r₂(F)}κ_F/(ζ_F(2)D_F²), d=2^{m−1}`. A fixed realized group signature has the corresponding positive constant with its infinite-place proportion. Convert to isomorphism counts using the rigid-family API.

`m≥1; k` is a fixed number field; all asymptotics are for the fixed family as `X` tends to infinity. The degree-one family `m=0` is a single base field and has no positive linear asymptotic.

Proof: Apply the number-field quadratic mass theorem to the finitely many bases with `D_F≤Y`. Use the tower tail with weight1 and the thin-family estimate to control the omitted bases and smaller groups. Use the wreath fibre multiplicity, then let `X` tend to infinity followed by `Y`. For all two-groups divide rigid counts by normalizers; the ratio `2^{-d}` cancels the fibre multiplicity.

*Needs:* [wreath transposition fibre](#wreath-transposition-fibre), [thin two group torsion](#thin-two-group-torsion), [quadratic tower torsion tail](#quadratic-tower-torsion-tail), [low degree jacobian mass](#low-degree-jacobian-mass).

([[95]](#ref-95), Theorem6.2 and proof, pp.30–31; end of Theorem6.1 proof, p.37.)

**Checks.**

- At `m=1` over `ℚ` the sole base is `ℚ` and `D₁=1/ζ(2)=6/π²`, the all-quadratic isomorphism constant. At `m=0` the count is eventually 1, so no positive linear constant is possible.

<a id="two-extension-three-torsion-means"></a>

**Two extension three torsion means.** `FieldStatistics.twoExtension_threeTorsionMean` states the unrestricted embedded mean, including convergence of both base-field sums and positivity of its denominator. For embedded degree `2^m` two-extensions the mean `h₃(K)` tends to `C_m=[Σ_F w_F h₃(F)(1+2^{r₁(F)}/3^{r₁(F)+r₂(F)})]/Σ_F w_F`, where `w_F=κ_F/(2^{r₂(F)}ζ_F(2)D_F²)`. For fixed `G=C₂≀H` the unrestricted mean uses the same weights over rigid `H`-fields. At a fixed realized group signature `Σ` it is `(1+3^{-u(Σ)})` times `[Σ_{F∈RigidH(Σbar)}h₃(F)κ_F/(ζ_F(2)D_F²)]/[Σ_{F∈RigidH(Σbar)} κ_F/(ζ_F(2)D_F²)]`. Both fixed-signature sums range over the same rigid `H`-fields with induced signature `Σbar`. Every displayed sum converges and every denominator is positive.

`m≥1; k` is a fixed number field; the fixed-signature family is realized. For `m=0` the sole field is `k` and its mean is `h₃(k)`, outside the displayed quadratic-step formula.

Proof: Split `h₃(K)` by the relative torsion identity. For a fixed base apply the quadratic local-mass mean and sum its infinite signatures. Remove the thin smaller-group contribution and apply the tower tail for the remaining bases. Take the two limits in order and divide by the positive field-counting constant.

*Needs:* [relative torsion splitting](#relative-torsion-splitting), [quadratic tower counting constants](#quadratic-tower-counting-constants), [quadratic tower torsion tail](#quadratic-tower-torsion-tail), [thin two group torsion](#thin-two-group-torsion), [low degree class group mass ratios](#low-degree-class-group-mass-ratios).

([[95]](#ref-95), Theorem6.1 and proof, pp.29–30 and35–37.)

**Checks.**

- At `m=1` over `ℚ`, the weighted formula gives `1+2/3=5/3`. Separating real and imaginary quadratic signatures gives `4/3` and 2. The `m=0` mean is 1 over `ℚ` and is not `5/3`.
- For `H=C₂` over `ℚ`, an induced real quadratic base signature restricts both sums to real quadratic fields; an induced imaginary signature restricts both to imaginary quadratic fields. An unrestricted denominator mixes two different base families.
- A signature with no rigid base fields has zero denominator and is excluded by realizedness.

<a id="relative-wreath-three-torsion-mean"></a>

**Relative wreath three torsion mean.** `FieldStatistics.relativeWreath_threeTorsionMean` states the relative mean for two-groups and for the general counting hypothesis. `FieldStatistics.quadraticWreathType` gives the permutation group generated by the independent block flips and the base action. For a transitive2-group `G=C₂≀H` and a realized relative unit rank `u`, the discriminant-ordered mean of `h₃(K/F_K)` is `1+3^{-u}`. More generally this holds for arbitrary transitive `H` if its embedded count is `O_{k,H,ε}(X^{2/3+ε})` for every `ε>0`. If instead `Σ_{F of H-type,D_F≤X}h₃(F/k)=O_{k,H,ε}(X^{2/3+ε})`, the ordinary `h₃(K)` mean exists with the convergent base-field weighted constant.

The fixed-`u` family is nonempty; the general-`H` counting or weighted-counting hypothesis is quantified for every `ε>0`.

Proof: For2-groups use the tower tail and the thin-group torsion estimate. For general `H` replace the tower tail by the five-range bound and the nontrivial2-torsion estimate of BSTTTZ. At finitely many completely split base primes impose one inert block and all other split blocks; any such prime forces the full wreath group. The local exclusion product tends to zero, so the smaller-group contribution is `o(X)`. Apply the quadratic mean and cancel the denominator.

*Needs:* [two extension three torsion means](#two-extension-three-torsion-means), [relative three torsion piecewise bound](#relative-three-torsion-piecewise-bound), [wreath transposition fibre](#wreath-transposition-fibre), [low degree class group mass ratios](#low-degree-class-group-mass-ratios), [two-torsion power saving](#class-group-two-torsion-power-saving).

([[95]](#ref-95), Theorem6.11, pp.37–38; Theorem8.1 and proof, pp.40–41.)

**Checks.**

- For `H=1` over `ℚ, u=0` and `u=1` recover the imaginary and real quadratic means 2 and `4/3`. An unrealized signature gives no positive denominator and is excluded.

- The general-`H` extension requires a counting bound for every positive `ε`, not merely one exponent with a fixed large loss.

- The absolute mean additionally weights the base fields by `h₃(F/k)`; the relative-mean hypothesis alone does not control that unbounded numerator.


### 3.27 Nonabelian quadratic moments

<a id="embedded-quadratic-wreath-type"></a>

**Embedded quadratic wreath type.** For a finite group `G` use the native regular wreath product `W=G≀C₂=(C₂→G)⋊C₂`. An embedded type is a subgroup `F≤W`. Write `c(F)` for its order-two elements outside the kernel of `W→C₂`. Admissibility means the canonical swap lies in `F`, the kernel projects onto `G` in one coordinate, and `c(F)` generates `F`. Goodness means `c(F)` is one `F`-conjugacy class. Types are equivalent under the diagonal action of `Aut(G)`; abstract group isomorphism alone is insufficient. `Aut_F(G)` is the stabilizer of `F` under that diagonal action.

The development requires:

- Elements `w∈F` with `w²=1` and nontrivial `C₂` projection.

- Swap membership, surjective coordinate projection of the kernel, and generation by outside involutions.

- Admissibility and conjugacy of any two outside involutions inside `F`.

- The subgroup of MulAut `G` preserving `F` under the diagonal action.

- Diagonal automorphisms transport `F`; identity/composition and admissibility/goodness laws hold.

- The number of `F`-conjugacy classes in the outside-involution set. Its native finite-group interface takes a homomorphism `π:F→Multiplicative(ZMod 2)`; for an embedded type use the restriction of the wreath projection.

- For admissible `F`, goodness is equivalent to outsideClassCount `=1`.

- For an abelian `G` the inverse-graph type has full stabilizer MulAut `G`.

Proof: Use RegularWreathProduct with `C₂=Multiplicative(ZMod2)`. Define the outside-involution set and its generated subgroup using native subgroup closure. Transport a subgroup by the diagonal automorphism and calculate its stabilizer.

*Needs:* `RegularWreathProduct` (Mathlib), `RegularWreathProduct.rightHom` (Mathlib), `RegularWreathProduct.inl` (Mathlib), `RegularWreathProduct.congr` (Mathlib).

([[96]](#ref-96), §1,p.378; §2.1–2.2,pp.383–387.)

**Checks.**

- The inverse-graph type for `G=C₂` is `C₂²`; its two outside involutions are distinct conjugacy classes, so it is admissible and bad.

- For `G=C₃` its inverse-graph type is `S₃`, with one outside class of size3 and stabilizer of order2.

- For `G=1` the sole admissible type is `C₂`, good with one outside involution.

- The base subgroup `G×G` is never admissible because it has trivial `C₂` projection.

<a id="nonabelian-quadratic-moment-interface"></a>

**Nonabelian quadratic moment interface.** Fix a separable closure of `ℚ` and its infinite inertia. For each quadratic `K` let `Γ_K` be the Galois group of the maximal extension unramified at every finite prime and split at infinity. Imaginary rigid objects are continuous surjections `Γ_K↠G` whose induced normal-closure embedding in `G≀C₂` has type `F`; real rigid objects also retain an outside involution (a twist). Divide their discriminant-bounded totals by the number of quadratic fields of the selected sign. Unrigid counts forget the isomorphism to `G`. For a good `F` they differ by `|Aut_F(G)|` in the imaginary case and `|c(F)||Aut_F(G)|` in the real case. Wood’s good-type prediction is rigid mean `|H₂(F,c)[2]|`; bad-type prediction is divergence, and inadmissible types have zero counts. These predictions are named propositions, not asserted arithmetic theorems. The refined good-type prediction restricts to tame quadratic fields and gives mean1 for each lifting-invariant value, evaluated at a generator of `μ_L` for `L=ℚ(μ_{4|F̃_c|})`, or equivalently for each `Hom`-valued invariant `μ_L→H₂(F,c)[2]`. Changing generators permutes the strata by a power automorphism. An arbitrary root of unity, in particular1, cannot index these strata.

The development requires:

- Discriminant-bounded average of continuous surjections, with real twists retained.

- The corresponding average of extension subfields with embedded type modulo diagonal `Aut(G)`.

- For admissible `F` the imaginary rigid count is `|Aut_F(G)|` times the unrigid count.

- For good `F` the real factor is `|c(F)||Aut_F(G)|`.

- The two rigid averages tend to `|H₂(F,c)[2]|`.

- Both averages tend to positive infinity.

- Inadmissible types have no arithmetic objects.

- Each tame signed rigid invariant stratum has mean1, with generator evaluation or `Hom`-valued invariant.

- Replacing `u` by `u^a` with `gcd(a,|μ_L|)=1` permutes the invariant values by `h↦h^a`.

Proof: Use the Galois correspondence and unramified-at-all-places predicate of ClassFieldTheory. An imaginary infinite inertia generator gives the wreath embedding; in the real case retain the chosen involution. Count the fibres of rigidification; conjugacy of twists proves the good real factor. State conjectural limits as predicates and retain the reduced-multiplier correction. Use `ReducedSchur.reducedMultiplier` and `ReducedSchur.ReducedCover` from InverseGaloisAndArithmeticFundamentalGroups IG.3.4, the power laws of InductionRestrictionPartII RS.1, and the finite-place `Hom`-valued arithmetic invariant from InverseGaloisAndArithmeticFundamentalGroups IG.4.6; neither object is constructed again here.

*Needs:* [embedded quadratic wreath type](#embedded-quadratic-wreath-type), [count of quadratic fields](#count-of-quadratic-fields), `TauCetiRoadmap.ClassFieldTheory` Layer 13, InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (`ReducedSchur.reducedMultiplier`, `ReducedSchur.ReducedCover`), InductionRestrictionPartII RS.1, InverseGaloisAndArithmeticFundamentalGroups IG.4.6.

([[96]](#ref-96), §2.1,pp.383–386,Lemma2.1; Conjecture1.1,p.378; [[96]](#ref-96), Definition3.1,pp.388–389; Conjecture5.1,p.411, corrected generator form.)

**Checks.**

- For `C₃,S₃` the unrigid imaginary/real means are `1/2` and `1/6`, and rigid means are1 in both cases.

- `C₂,C₂²` is bad; the good finite-limit formula does not apply.

- For the order `96 A₄` type with reduced multiplier `C₂`, the predicted rigid mean is2, not1.

- For a type with `H₂(F,c)[2]=C₂`, evaluation at1 sees only the identity value, so it cannot give two strata each of mean1.

<a id="nonabelian-admissibility-and-abelianization"></a>

**Nonabelian admissibility and abelianization.** Every arithmetic normal-closure type is admissible. For admissible good `F` its abelianization is `C₂`, so every cyclotomic intermediate field of an `F`-extension of `ℚ` is contained in its distinguished quadratic subfield. For abelian `G` the unique admissible type is the inverse-graph generalized dihedral group. For odd `|G|` this type is good and the reduced multiplier has trivial2-torsion. The last multiplier assertion is a homological assertion below.

Proof: finite inertia in the normal closure intersects the kernel over the distinguished quadratic field trivially, because that extension is unramified; its nontrivial images are therefore outside involutions. The quotient by their normal closure is unramified at every finite prime over `ℚ` and hence trivial by the Minkowski discriminant bound, regardless of its real places. In the imaginary quadratic case infinite inertia is also an outside involution. Decomposition groups need not have order at most two and are not used as generators in this argument. Conjugate generators have the same image in the abelianization. The swap generates it and the quotient to `C₂` prevents collapse. For abelian `G` use inertia generation to force the inverse graph; for odd order use Schur–Zassenhaus and the reduced multiplier computation.

*Needs:* [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), [embedded quadratic wreath type](#embedded-quadratic-wreath-type), `Abelianization` (Mathlib), [embedded types and signature representations](#support-embedded-types), InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (`ReducedSchur.reducedMultiplier`, `ReducedSchur.ReducedCover`), InductionRestrictionPartII RS.1.

([[50]](#ref-50), arXiv:1702.04644v2, Proposition 2.2, §2, p.8; Lemma 6.2, §6, pp.28–29; conjectural predictions in §1, pp.2–3.)

**Checks.**

- The splitting field of `X³−X−1` has quadratic subfield `ℚ(√−23)`, and is unramified over that subfield. At 2 the reduction `X³+X+1` has no root in `𝔽₂` and is irreducible. Inertia is trivial but the decomposition group is `C₃`, contained in the kernel. Thus decomposition images cannot replace inertia images.
- For `G=1` the type is `C₂`, its nontrivial finite inertia generates it, and its abelianization is `C₂`.
- The inverse-graph type for `G=C₂` is `C₂²`. Its two outside involutions are not conjugate, so the good-type hypothesis excludes it from the `C₂` abelianization assertion.

<a id="embedded-type-catalogue"></a>

**Embedded type catalogue.** Classify admissible types by pairs `(N,α)`, where `N◁G` and `α` is an involutive automorphism of `G/N`. Form `H(N,α)={(a,b):α(aN)=bN}` and `F(N,α)=H(N,α)⋊` swap. Its outside involutions are `((a,a⁻¹),swap)` with `α(aN)=a⁻¹N`. Admissibility holds exactly when their outside involutions generate a subgroup of cardinal `2|G||N|`. Diagonal `Aut(G)`-orbits classify the resulting embedded types by Goursat. Outside-class count, center and reduced multiplier are invariants of this marked subgroup. Any use of the finite rows in Wood Tables1–2 assumes the specified marked groups and invariant values; no completeness claim extends beyond those listed `G`.

The development requires:

- The embedded type for a normal subgroup `N` and involutive quotient automorphism `α`.

- Its cardinal is `2|G||N|`.

- The exact outside-involution formula in the statement.

- Every admissible embedded type arises from the quotient-graph construction.

- Diagonal `Aut(G)` transports `N` and `α` by the induced quotient equivalence.

- A mathematical record of `G,N,α`, the embedded subgroup orbit, class count, center and reduced multiplier, with the asserted invariant values as explicit hypotheses.

Proof: Apply Goursat to the subdirect base kernel and use swap invariance to identify the two kernels and force `α²=1`. Calculate the outside involutions directly from the wreath multiplication. The cardinal generation test is exact, and diagonal transport changes `N` and the quotient map compatibly. Prove the bijection with diagonal orbits and the outside-conjugacy criterion, retaining the actual embedding. Use InductionRestrictionPartII RS.6.4–RS.6.6 for the centralizer-quotient and parity comparisons and its order96 embedding. The new result is the quadratic-wreath classification and diagonal-orbit adapter.

*Needs:* [embedded quadratic wreath type](#embedded-quadratic-wreath-type), `Subgroup.goursat_surjective` (Mathlib), `alternatingGroup.kleinFour` (Mathlib), `alternatingGroup.normal_kleinFour` (Mathlib), `alternatingGroup.kleinFour_card_of_card_eq_four` (Mathlib), [marked embedded-type comparisons](#support-marked-type-comparisons).

([[96]](#ref-96), §8.1–8.2,pp.417–420; derived Goursat enumeration adapter.)

**Checks.**

- `G=C₂` has one admissible diagonal orbit, `C₂²`, with two outside classes.

- `G=C₃` has one admissible orbit, `S₃`, with one outside class.

- `G=A₄` has the `S₄` type and the order96 inverse-`C₃`-quotient type; they must not be collapsed.

- The coordinate-swap subgroup `C₂` and the trivial-projection subgroup of the base of `C₂≀C₂` are abstractly isomorphic, but diagonal automorphisms preserve their different `C₂` projections. They are distinct embedded-type orbits.

<a id="elementary-two-moment-euler-products"></a>

**Elementary two moment euler products.** For `k≥1` put `m=2^k`. The real twisted homomorphism series is `F₊=(T+U+(2m−2)V)/(2m)`, where `T=(1+m2^{-2s}+2m2^{-3s})∏_{p odd}(1+mp^{-s}), U=(1−m2^{-2s})∏_{p≡1(4)}(1+mp^{-s})∏_{p≡3(4)}(1−mp^{-s})`, and `V=(1+m2^{-3s})∏_{p≡1(4)}(1+mp^{-s})`. The imaginary fixed-swap series is `F₋=(T−U)/(2m)`; counting all outside involutions instead multiplies it by `m`. `T=ζ(s)^mG_T(s), U=L(s,χ₄)^mG_U(s)`, and `V=ζ(s)^{m/2}L(s,χ₄)^{m/2}G_V(s)`, with the remaining products holomorphic for Re `(s)>1/2`.

`k≥1`; the initial products converge absolutely for Re `(s)>1`.

Proof: Use `ℚ` idèle class reciprocity and classify the local characters whose inertia intersects the base `C₂^k` trivially. Average all `2m` sign characters to impose total reality; use the fixed-swap archimedean selector for imaginary fields. Calculate the prime2 factors separately; cancel the first-order Euler terms by `ζ` and `L`.

*Needs:* [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), `TauCetiRoadmap.ClassFieldTheory` Layer 13, AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[50]](#ref-50), arXiv:1702.04644v2, §7,pp.29–31; prime2 and imaginary selectors supplied explicitly here.)

**Checks.**

- For `k=1,m=2` the `T`-factor at 2 is `1+2·2^(−2s)+4·2^(−3s)`; replacing it by an odd-prime factor changes the series. `T` has pole order 2 and `V` order 1, so `V` cannot change the leading double pole.

<a id="elementary-two-moment-divergence"></a>

**Elementary two moment divergence.** For `k≥1,m=2^k`, both the real twisted and imaginary fixed-swap surjection totals are asymptotic to `C_k X(log X)^{m−1}`, where `C_k=G_T(1)/(2m(m−1)!)>0` and `G_T(1)=(1+m/2)2^{-m}∏_{p odd}(1+m/p)(1−1/p)^m`. Proper-`image` homomorphisms have smaller logarithmic order. Dividing by quadratic-field counts proves both rigid and unrigid moments diverge for the embedded type `C₂^{k+1}`; it does not prove the general bad-type conjecture.

Proof: Apply the higher-pole Delange theorem to the nonnegative coefficients, retaining the lower-order `U,V` terms. Bound proper-`image` maps by the finite collection of smaller elementary-two groups; their largest pole has order at most `m/2`. Use the quadratic field asymptotic and the finite rigidification constants.

*Needs:* [elementary two moment euler products](#elementary-two-moment-euler-products), [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), [count of quadratic fields](#count-of-quadratic-fields), Completed ArithmeticDirichletSeries Layer 9.

([[50]](#ref-50), arXiv:1702.04644v2, §7,end,p.31; derived explicit leading constant.)

**Checks.**

- For `k=1,m=2` the leading scale is `X log X`, and proper-`image` maps have pole order at most 1. The excluded `k=0` case would have no logarithmic divergence.

<a id="nonabelian-low-degree-known-moments"></a>

**Nonabelian low degree known moments.** `FieldStatistics.lowDegree_alternatingMoment` states the alternating/symmetric mean in all three degrees over every number-field base, retaining the infinite-place parameter. For `n=3,4,5`, BSW’s mass ratios imply `E_k(A_n,S_n)=½(2/n!)^{r₂(k)+α₂}(1/(n−2)!)^{r₁(k)−α₂}`, where `α₂` counts real base places splitting as `ℝ²` in the quadratic extension. In particular over `ℚ` the imaginary means for `(A₃,S₃),(A₄,S₄),(A₅,S₅)` are `1/2,1/4,1/12` and the real means are `1/6,1/24,1/120`. For `(S_n,S_n×C₂),n=3,4,5`, both means diverge. For the normal-over-`ℚ` `Q₈` closure type of order16 and the `D₈×C₂` type, Alberts proves both signed means diverge; these claims concern those embedded types and do not exclude other wreath types.

Proof: Use the low-degree field-to-unramified-extension correspondence and the exact local mass ratios. For product types sum the quadratic twists over a fixed unramified field and use the divergent harmonic subfamily. For `Q₈` and `D₈` use the discriminant-factorization classification, extract residues with two fixed factors, and sum a nonnegative lower bound over those factors.

The original factorization inputs are Lemmermeyer [138], Proposition4, p.56, Theorem1 and Proposition6, p.63, and Theorem2, pp.65–66. Keep pairwise-coprime quadratic discriminants, the permitted negative factor and the conditions at2; the converse for `D₈` is stated unramified outside infinity. For `Q₈` the following residue and restricted-mean targets close the analytic transfer; the `D₈` harmonic prime-progression argument in [97], Theorem4.11, pp.656–657 remains separate.

**Fixed-factor residue.** Fix pairwise coprime odd squarefree `d₁,d₂>1` with `εd₁≡d₂≡1 mod4, ε∈{±1}`; put `n=d₁d₂` and `χ=(εn/·)`. Let `D_ε(s;d₁,d₂)` count the admissible third discriminant factors with the Lemmermeyer signs and the bounded permutation divisor `B, 1≤B≤6`. Alberts [97], Lemma4.2 and Definition4.3, pp.648–650 reduce it to character-twisted products. Only the trivial character and `χ` have a pole; quadratic reciprocity makes their coefficients both `+1` (Corollary4.8, pp.653–655). For `M₊(s)=∏_(p odd,χ(p)=1)(1+2p^(−s))`, define

`A_p=(1+2/p)(1−1/p)²`, `B_p=(1+2χ(p)/p)(1−χ(p)/p)²`.

Squaring `M₊` and separating the cases `χ(p)=1,−1,0` gives its residue exactly as

`Res₁M₊ = ((2−χ(2))/4)L(1,χ) · [∏_(p odd) A_pB_p · ∏_(q|n)(1+2/q)⁻¹ · ∏_(q odd,χ(q)=−1)(1−4/q²)⁻¹]^(1/2)`.

This identity follows by factoring `ζ(s)²L(s,χ)²` before taking the positive square root; the omitted Euler factors at two give `(1−1/2)(1−χ(2)/2)`. Thus the fixed-factor residue is `(8Bn)⁻¹ Res₁M₊`. For odd `p`, `B_p=1−3/p²+2χ(p)/p³≥1−3/p²−2/p³>0`, while `A_p>0`. Their product converges absolutely to a positive number bounded below independently of `χ`. The last product is at least one, each ramified `q` gives `√(q/(q+2))≥√(3/5)`, and `(2−χ(2))/4` is either `1/4` or `3/4`. Consequently

`Res₁D_ε(s;d₁,d₂) ≥ c (√(3/5))^ω(n) L(1,χ)/n`,

with an absolute `c>0`, exactly the required uniform lower bound in Lemma4.9, p.655. All products in this calculation run over odd primes. Including `p=2` would make the alleged universal lower product zero; its separate factor is indispensable. Positivity of `L(1,χ)` follows from the real/imaginary quadratic class-number formula, and the nonnegative counting coefficients fix the square-root sign.

**Restricted first moment.** Prove, separately for `ε=+1` and `−1`,

`Σ_(n≤T odd squarefree, εn≡1 mod4, εn≠1) L(1,χ_(εn)) = C T+O(T^(3/4)log(2T))`,

where `C=Σ_(m≥1) δ_m/m²>0` and `δ_m=(2/π²)∏_(p|m,p odd)p/(p+1)`. This is a direct restricted version of the first-moment input, not a deduction from an unrestricted positive mean. Truncate the nonprincipal `L`-series at `N=⌊T⌋` using Pólya–Vinogradov; the total tail is `O(T^(3/2)log(2T)/N)`. For an index `j=bc²` with `b>1` squarefree, expand squarefreeness of `n` as `Σ_(d²|n)μ(d)`. Quadratic reciprocity and the fixed progression modulo four bound each inner character sum by `O(τ(c)√b log(2b))`, while its length bounds it by `O(T/d²)`. As in the all-order mean, split modulo eight for an even `b` with nontrivial odd part, and use the alternating progression directly when `b=2`; no nonprincipal Dirichlet character modulo two is assumed. Splitting `d` where these bounds meet gives `O(τ(c)√T b^(1/4)log(2b))`. After division by `j` and summation to `N` this is `O(√T N^(1/4)log(2N))`, since `Στ(c)c^(−5/2)` converges. At `j=m²`, the squarefree progression count with `(n,m)=1` is `δ_mT+O(τ(m)√T)`, by the same Möbius expansion; for even `m, n` is already odd. The diagonal tail is `O(T/√N)`. Taking `N=⌊T⌋` proves the mean and its positive constant. The finitely many `T<2` and the excluded principal character `εn=1` are handled in the truncated sum. Character two is averaged over the two admissible classes modulo eight, not fixed silently.

The same proof permits a fixed squarefree odd `R|n`: require `(m,R)=1` on the diagonal and impose the finite congruences modulo `4R`. Its constant `C_(ε,R)` is positive, since the diagonal `m=1` has positive density, and its error constant may depend on `R`. Choose `R=5·13·17` to ensure `ω(n)≥3`. There are at least `2^(ω(n)−1)−2≥2^(ω(n)−2)` ordered coprime factorizations `n=d₁d₂` with `εd₁≡d₂≡1 mod4` and `d₁,d₂>1`. Indeed the map from squarefree divisors to their sign modulo four has either a trivial image or two equal fibres; remove the two unit possibilities. The residues therefore sum to at least a fixed positive multiple of `Σ_(R|n, εn≡1 mod4) L(1,χ_(εn))/n`, since `2√(3/5)>1`. Partial summation of the restricted mean gives `C_(ε,R)log T+O(1)`, hence divergence for both signs. First take the field-height limit for each **finite** collection of factor pairs, then enlarge that collection; coefficient positivity justifies this lower-bound order of limits. Dividing by the positive linear quadratic-field count preserves divergence. This proves the claimed `Q₈` means without assuming that Goldfeld–Hoffstein's unrestricted mean has positive mass in every residue subfamily. [137], Theorems1–2, pp.187–188 is compatible context; [97], Corollary4.10, p.656 supplies the factor-summing application, with the residue restrictions and divisor count made explicit above.

*Needs:* [low degree class group mass ratios](#low-degree-class-group-mass-ratios), [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[92]](#ref-92), Theorem8, p.5; §10.2, pp.30–31; [[97]](#ref-97), Theorem4.1,pp.646–648; Lemma4.9,pp.655–656; Corollary4.10/Theorem4.11,pp.656–657.)

**Checks.**

- At `n=3` over `ℚ` the formula gives `1/2` for imaginary and `1/6` for real quadratic bases; multiplying by the respective rigidification factors recovers the rigid mean 1. The unrigid means are not themselves 1.
- At the smallest odd prime `p=3`, the lower factors are `A₃=20/27` and `1−3/9−2/27=16/27`, both positive. At `p=2` the latter expression is zero: two must stay outside the product.
- `χ(2)=+1` and `−1` give dyadic factors `1/4` and `3/4`. A uniform positive lower bound is `1/4`; a common value for both signs is false.
- For `ε=−1, n=15` has only two divisors congruent to one modulo four, rather than all four divisors. The factorization lower bound uses a half-fibre and removes units; it does not identify the count with `σ₀(n)`.
- For `R=5·13·17` and either sign, the admissible squarefree progression has positive density and `ω(n)≥3`. The positive restricted mean proves the needed harmonic divergence; a mean on all quadratic discriminants would not.

<a id="a4-appendix-kernel-enumerator"></a>

**A4 kernel and field correspondence.** Let `M/ℚ` be the `S₃` closure of a nowhere-totally-ramified cubic field of negative fundamental discriminant `D`, and `K` its quadratic subfield. Consider the index4 subgroups `N` of `Cl(M)`, stable under `C₃=Gal(M/K)`, with quotient `C₂²`, but not stable under all `S₃`. Class-field equivariance identifies them with unramified `A₄`-extensions `L/K` having the order96 closure type. Every kernel gives24 rigid surjections. The two kernels in its `S₃`-orbit together give48. For a finite discriminant interval, an exact total assumes as input the exhaustive cubic-field list and the exact class groups with their `S₃` actions; sampled inputs determine an unbiased estimator for that supplied list. For a general finite `S₃`-module, also require a nontrivial induced `C₃` action on the quotient. Arithmetic class-field conjugation makes this automatic for the intended `Cl(M)` input; it must not be assumed for an arbitrary supplied action.

The development requires:

- An index4 subgroup of a finite abelian `S₃`-module, with elementary-two quotient, `C₃` stability, nontrivial induced `C₃` action, and failure of `S₃` stability. For the native `Cl(M)` action this is the arithmetic eligible kernel.

- The finite set of eligible kernels for a supplied `S₃` action on `Cl(M)`.

- The kernel-to-unramified-extension bijection, including the closure type.

- The total rigid count is24 times the number of eligible kernels.

- Equivalently it is48 times the number of eligible `S₃` orbits.

- The average over all `N^m` ordered samples equals the list total when `N,m>0`.

- For a nonempty supplied exact list of `N` rigid counts and `m≥1` independent uniform draws with replacement, the estimator is `(N/m)` times the sum of the sampled counts. Its expectation is the total of that list. On the finite rational interface, the list is `counts : Fin N → ℚ` and the ordered sample is `draws : Fin m → Fin N`.

Proof: Use the cubic/unramified-`C₃` correspondence and characterize the native class-group subgroups by index, quotient type and the `C₃/S₃` actions. Schur–Zassenhaus gives `a C₂²⋊C₃` group; the trivial action would make the extension abelian over `K` and stable over `ℚ`, so the retained action is `A₄`. Use `|Aut(A₄)|=24` and a stabilizer of index2 in `S₃` to prove both equivalent rigidification weights.

*Needs:* [nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent), [embedded type catalogue](#embedded-type-catalogue), [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), `TauCetiRoadmap.ClassFieldTheory` Layer 13, [marked embedded-type comparisons](#support-marked-type-comparisons).

([[50]](#ref-50), arXiv:1702.04644v2, Appendix A.1, pp.35–36; A.2, p.36; A.3, p.37.)

**Checks.**

- An odd-cardinality finite abelian group has no quotient `C₂²`, so its eligible kernel set is empty. An input with no elementary-two quotient of dimension2 likewise has empty eligible kernel set.

- `A C₃`-trivial quotient is rejected; it gives `C₂²×C₃` of order12, not `A₄`.

- For the `S₃`-module consisting of two swapped copies of the irreducible `C₃`-module `𝔽₂²`, the two coordinate kernels are eligible, giving48 rigid surjections together.

- For the singleton list `[48]`, every sample of positive size estimates48.

- For `[0,48]` and `m=1`, the two estimates are0 and96, with mean48, the list’s total.

- For `[0,48]` and `m=2`, the four ordered samples give estimates0,48,48,96, again with mean48. Repeated draws are retained; these values distinguish the factor `N/m` from `1/m`.

### 3.28 Small generators and mixed-trace field bounds

<a id="small-trace-zero-element"></a>

**Small trace zero element.** Every degree-`n` number field `K/ℚ,n≥2`, has an integral nonzero nonrational element `α` of trace zero with archimedean `L²` norm `O_n(D_K^{1/(2n−2)})`. If `K` has no proper intermediate field, `α` generates `K`; its monic minimal polynomial then has `a₁=0` and `|a_i|≪_nD_K^{i/(2n−2)}`. Without primitivity it may lie in a proper subfield, so the coefficient box alone does not count every field.

`n≥2`; fields are counted up to `ℚ`-isomorphism.

Proof: Use the trace-zero integral lattice and its covolume, then Minkowski’s first theorem. The only rational algebraic integer of trace zero is0. Under the no-intermediate-field hypothesis the nonrational element generates `K`; bound elementary symmetric polynomials of its conjugates.

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), Completed EffectiveBounds Layer 1.

([[98]](#ref-98), §2,p.2; Schmidt proof,pp.190–191; [[101]](#ref-101), (1.1)–(1.2) and proof, pp.189–195.)

**Checks.**

- At `n=2, α=√d` is nonrational and trace zero, and its conjugate size is of order `√|d|`. In a biquadratic field, a nonrational trace-zero element can lie in a quadratic subfield, so the generator conclusion requires primitivity.

<a id="schmidt-field-count-bound"></a>

**Schmidt field count bound.** `FieldStatistics.schmidt_fieldCount_uniform` states the absolute-discriminant bound with its constant chosen before the base field. For `n≥2` the number of degree-`n ℚ`-isomorphism classes with absolute discriminant `≤X` is `O_n(X^{(n+2)/4})`. For a fixed number-field base `k` the same exponent holds for relative degree `n` and relative discriminant norm `≤X`, with constant depending on `k,n`. The uniform absolute-discriminant form has the following quantifiers: for fixed integers `m≥1,n≥2`, there is `C(m,n)` such that for every degree-`m` number field `M` and every `T≥1`, the number of `M`-isomorphism classes `E/M` with `[E:M]=n` and `|Disc E|≤T` is at most `C(m,n)T^((n+2)/4)`. The constant is chosen before `M`; the cutoff is the absolute discriminant of the top field.

Proof: for primitive fields count the trace-zero coefficient boxes. For imprimitive fields choose a maximal chain of intermediate fields and apply the relative primitive estimate at each step. Use the discriminant tower identity and sum dyadic base-discriminant intervals; retain the base-discriminant saving that makes the sum converge. For the uniform form use Schmidt [101], (1.2), p.189 and §3, pp.192–195: the lattice and coefficient estimates depend only on the degrees, with explicit saving in the base discriminant. There are only finitely many relative degree chains of product `n`; their largest step degree is at most `n`. Dropping their discriminant-saving factors gives the stated `C(m,n)`, uniformly over the degree-`m` bases. Converting an absolute cutoff to a relative-norm cutoff for fixed `k` introduces the permitted dependence on `|Disc k|`.

*Needs:* [small trace zero element](#small-trace-zero-element), [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), Completed EffectiveBounds Layer 1.

([[98]](#ref-98), §1,p.1; §2,p.2; Schmidt (1.1)–(1.2) and proof,pp.189–195; [[101]](#ref-101), (1.1)–(1.2) and proof, pp.189–195.)

**Checks.**

- For `m=1,n=2`, the absolute-discriminant bound is linear.

- For `m=1,n=4`, its exponent is `3/2`.

- If `T<|Disc M|^n`, the family is empty by discriminant transitivity. A relative-norm cutoff would instead correspond to the absolute cutoff `|Disc M|^n T`, so it cannot be substituted while keeping the same constant uniform in `M`.

<a id="mixed-trace-finite-fibres"></a>

**Mixed trace finite fibres.** For `n≥6` and `3≤r≤n`, if `binomial(d+r−1,r−1)>` rn, there is a set of rn degree-`d` multi-indices whose mixed-trace map on `r` ordered `n`-tuples has nonzero Jacobian and, outside a fixed hypersurface, at most the product of its coordinate degrees many points per fibre. For `r=2` the first `2n` nonzero pairs ordered by total degree then second coordinate also have nonzero Jacobian. The hypersurface and bound depend only on `n,r,d`.

Proof: for `r=2` expand the Jacobian determinant and isolate its last two columns; induction prevents cancellation. For `r≥3` the Jacobian of the mixed-trace map at `r`-vectors `x₁,…,x_n` is the transpose of the matrix of the `r` partial derivatives of the degree-`d` monomials in `r` variables at those points. Consume [GenericDoublePointInterpolation §4.8, double-point theorem in every degree](../GenericDoublePointInterpolation/README.md#48-the-projective-endpoint) with its projective dimension set to `r−1`, so that its `r+1` homogeneous variables are the `r` variables here, and pass from its affine first jets to homogeneous partials by the [GenericDoublePointInterpolation §1.4 homogeneous-partial adapter](../GenericDoublePointInterpolation/README.md#14-matrix-rank-and-projective-restriction), valid because `d≥1` in characteristic zero. This gives a nonempty open set of `n`-tuples in `P^(r−1)` where the homogeneous-partial matrix has rank `min(binomial(d+r−1,r−1),rn)` outside the transported exceptions. Rescaling a point multiplies its `r` rows by a nonzero scalar, so the open set lifts to a nonempty open set of `n`-tuples of nonzero vectors. Exclude the exceptions arithmetically: `n≥6` and `r≤n` rule out the quadratic range `2≤n≤r−1` and `(d,r,n)=(4,3,5)`; for `(3,5,7)` and `(4,5,14)` one has `binomial=rn`, and for `(4,4,9)` one has `35<36`, so the strict inequality excludes them. Then the rank is rn: choose rn monomial columns with a nonzero rn-by-rn minor at a point of the open set; these are the selected multi-indices. A nonzero Jacobian makes the map generically finite; use a nonzero polynomial cutting out the bad fibres and affine Bézout for the uniform bound.

**Finite-fibre target.** The polynomial finite-fibre bound is valid for a characteristic-zero field `k` and `N≥1`: if `F=(f₁,…,f_N)` has nonzero Jacobian determinant, there is a nonzero `Q∈k[y₁,…,y_N]` such that for every algebraically closed extension `Ω/k` and `Q(y)≠0`, the geometric fibre `F⁻¹(y)` is finite and has at most `∏deg(f_i)` distinct points. Its source version has the nonzero polynomial `P=Q∘F`. Prove algebraic independence of the `f_i` by differentiating a relation of least degree: invertibility of the Jacobian over `k(x₁,…,x_N)` makes all derivatives of the relation vanish, impossible in characteristic zero. Then `k(x)/k(f)` is a finite field extension. Clear the coefficients of monic equations for each `x_i` to obtain a finite integral algebra after inverting one nonzero `Q`; its geometric fibres are zero-dimensional. For the numerical bound, homogenize `f_i−y_i`. The affine isolated-intersection Bézout inequality bounds their isolated points, with multiplicities, by `∏deg(f_i)`, even if the homogenized intersection also has components at infinity. This inequality follows by successive hypersurface intersection and addition of degrees of the isolated components; components at infinity cannot increase the degree left for the affine isolated points. This gives the exact route used in [98], Lemma2.1, p.3, without assuming that every fibre is finite. It also supplies a nonzero exceptional hypersurface of bounded degree depending on `F`; in the fixed mixed-trace problem `F` itself depends only on `n,r,d`.

**Checks.** The map `(x,y)↦(x,xy)` has determinant `x`: its fibre over `(0,0)` is a line, while all fibres with first coordinate nonzero are singletons. For `N=1` and `f=x²` the Jacobian `2x` is nonzero and every geometric fibre has at most `2=deg f` points, with one point over `0`. In characteristic `p` the map `x↦x^p` has zero Jacobian; the characteristic-zero algebraic-independence argument must not be used there.

*Needs:* `MvPolynomial` (Mathlib), `Matrix.det` (Mathlib), [GenericDoublePointInterpolation §4.8: double-point theorem in every degree](../GenericDoublePointInterpolation/README.md#48-the-projective-endpoint), [GenericDoublePointInterpolation §1.4: homogeneous partials and affine first jets](../GenericDoublePointInterpolation/README.md#14-matrix-rank-and-projective-restriction), [the polynomial finite-fibre target](#mixed-trace-finite-fibres).

([[98]](#ref-98), Lemma2.1,pp.2–3; Lemmas3.1 and3.3/Theorem3.2,pp.3–5.)

**Checks.**

- For `n=6,r=3, d=4` gives `binomial(6,2)=15≤18` and fails the hypothesis, whereas `d=5` gives `21>18`. A zero Jacobian cannot be inferred nonzero merely from having rn coordinates.
- Consumption of GenericDoublePointInterpolation §4.8: its exceptions, quadrics with `2≤q≤r` and `(r,d,q)=(2,4,5),(3,4,9),(4,3,7),(4,4,14)`, become under `r ↦ r+1` the quadrics with `2≤n≤r−1` here and `(d,r,n)=(4,3,5),(4,4,9),(3,5,7),(4,5,14)`, the list of [[140]](#ref-140), Theorem1.1, p.1, in `r` homogeneous variables. For ternary quadrics with two points the square of their joining line is singular at both, so the rank is5 rather than6; the hypothesis `r≤n` keeps the mixed-trace application out of this range.
- For `(n,r,d)=(6,3,5)` the consumed rank is `18=min(21,18)`, so a nonzero minor of size18 exists. For `(n,r,d)=(9,4,4)` the inequality `binomial(7,3)=35>36` fails, so this transported exception never reaches the minor selection.

<a id="lemke-oliver-thorne-field-bound"></a>

**Lemke oliver thorne field bound.** `FieldStatistics.lemkeOliverThorne_fieldCount` states the explicit, asymptotic, mixed-trace and least-degree two-generator exponents on the isomorphism-class count. For every `n≥6` the degree-`n` field count is `O_n(X^{1.564(log n)²})`; for every `c>1/(4(log2)²)` there is `n₀(c)` such that exponent `c(log n)²` works for `n≥n₀`. More precisely the mixed-trace bound gives exponent dr when `3≤r≤n` and `binomial(d+r−1,r−1)>` rn. The two-generator version gives `2d−d(d−1)(d+4)/(6n)`, where `d` is least with `binomial(d+2,2)≥2n+1`. The explicit comparison with Schmidt starts at `n=95`.

Proof: Use the ring-of-integers largest-minimum bound to choose a basis of size `O_n(D_K^{1/n})`. Avoid the finite-fibre hypersurface and the first-element discriminant hypersurface by bounded integer combinations of that basis. The first element generates `K`; count the integer mixed traces and bound their fibre multiplicity. Optimize `d,r` using Stirling and prove the inequalities giving the constant1.564 and threshold95.

*Needs:* [mixed trace finite fibres](#mixed-trace-finite-fibres), [schmidt field count bound](#schmidt-field-count-bound), [largest minimum of the integer lattice](#integer-lattice-largest-minimum).

([[98]](#ref-98), Theorems1.1–1.2,pp.1–2; Lemmas4.1–4.2 and proofs,pp.5–6.)

**Checks.**

- The first strict improvement over Schmidt in the numerical comparison is at `n=95; n=94` fails the strict inequality.

- A short independent integral family may have nontrivial index in `O_K`; the chosen basis must generate the full integer lattice before counting its integral combinations.

- A mixed trace of total degree `e` of elements bounded by `C_nD_K^(1/n)` has size `O_(n,e)(D_K^(e/n))`; this exponent uses the arithmetic largest minimum.


### 3.29 Special Galois types and weighted quartic bounds

<a id="cyclic-prime-field-count"></a>

**Cyclic prime field count.** `FieldStatistics.cyclicPrime_fieldCount` states the prime-degree upper bound. For every prime `p`, the cyclic degree-`p ℚ`-field count is `O_p(X^{1/(p−1)})`. In particular cyclic cubic fields satisfy `N₃(C₃,X)~C₃X^{1/2}` for an explicit positive Euler-product constant. These are field counts; distinct characters defining one field are divided by `p−1`. General abelian groups may carry logarithmic factors, so the cyclic-prime assertion does not imply a pure-power bound for `C₂²`.

Proof: Use conductor–discriminant for Dirichlet characters and divide the primitive order-`p` characters by `p−1`. At good primes the number of possible nontrivial characters is `p−1` only when the prime is `1 mod p`; analyze the bad prime separately. Factor the conductor series by the appropriate `ζ`/ Dirichlet-`L` products and apply a Tauberian theorem.

Use the [abelian discriminant series](#abelian-discriminant-series) for the base-field pole and its positive coefficient.

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function), `TauCetiRoadmap.ClassFieldTheory` Layer 13, AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9, Completed ArithmeticDirichletSeries Layer 9.

([[100]](#ref-100), Cyclic-prime input,p.4; BSTTTZ §6,p.10; quoted Mäki/Wright/Cohn originals; [[99]](#ref-99), §6, p.10, quoting the cyclic cubic theorem; [[109]](#ref-109), Corollary7.2,p.15; Corollary6.2,pp.13–14.)

**Checks.**

- `p=2` gives a linear bound and `p=3` a square-root bound. Over `ℚ, C₃` has two elements of order three divided by cyclotomic degree two, giving `b=1`; over `ℚ(ζ₃)` the same numerator is divided by one, giving `b=2`.
- For `V₄/ℚ` there are three elements of order two and cyclotomic degree one: the pole order is three, not one. For `A=1` the theorem is inapplicable and the family is a singleton.
- A series `c/(s−a)` has cumulative leading coefficient `c/a`. For a double pole it is `c/a` times `X^a log X`; omitting that factor or logarithm fails these two controls.
- Each cyclic degree-`p` field has `p−1` surjective character labels. The regular `V₄` action has degree four, so its exponent is `1/2`, rather than the degree-two quadratic exponent one.

<a id="galois-field-three-eighths-bound"></a>

**Galois field three eighths bound.** The conditional arithmetic target `FieldStatistics.galois_count_threeEighths_of_largeSubgroups` assumes that every finite nonabelian simple `S` has a proper subgroup `H` with `|H|²>|S|`. Under that hypothesis, for a fixed number field `k` and finite `G` with `|G|>4`, Galois `G`-extensions `L/k` of relative discriminant norm `≤X` have count `O_{k,G,ε}(X^{3/8+ε})` for every `ε>0`. The unconditional endpoint `FieldStatistics.galois_count_threeEighths` is the same conclusion without that hypothesis; its finite-group requirement is specified below. No pure `O(X^{1/2})` assertion for all groups of order `≤4` is inferred; `C₂²` has a logarithmic factor.

Proof: induct on `|G|` using a minimal normal subgroup `H=S^r`, and put `h=|H|, Q=G/H, q=|Q|` and `M=L^H`. Discriminant transitivity gives `N(d(M/k))≤X^(1/h)`. If `S` is nonabelian, the displayed subgroup hypothesis gives a proper core-free `H₀≤H` of order `a>√h`. The extension `L` is the normal closure over `M` of `L^(H₀)`. The [uniform absolute-discriminant Schmidt bound](#schmidt-field-count-bound), with `[M:ℚ]=[k:ℚ]q`, relative degree `h/a` and cutoff `|Disc L^(H₀)|≤|Disc k|^(|G|/a)X^(1/a)`, bounds the possibilities for this intermediate field by `O_(k,G)(X^((h/a+2)/(4a)))`, uniformly in `M`. This is the uniform form used in [102], p.735; a fixed-`M` constant cannot be summed here. Combining it with the coarse quotient bound `O(X^(1/h+ε))` gives exponent at most `1/4+1/(2√h)+1/h<3/8` for `h≥60`.

If `H=(C_p)^r`, first remove abelian `G` using the preceding abelian theorem; the remaining quotient has `q≥2`. Restriction of class-field characters to inertia has kernel bounded by `h(M)^r` and image bounded by `C^ω(Y)`, where `Y=N(d(L/M))`. Hence the number with this `Y` is `O(D_M^(r/2+ε)Y^ε)`. Away from the primes dividing `|G|d(M/k)`, tame inertia forces discriminant valuations to be multiples of `m=(p−1)|G|/p`. The possible `Y` lie in `O(N(d(M/k))^ε)` fixed `m`-power classes. Put `N₁=N(d(M/k))`; for each `M` their contribution is at most `X^(1/m+ε)N₁^(r/2−h/m+ε)`. Maximizing this last power over `1≤N₁≤X^(1/h)`, rather than bounding its two factors separately, gives

`N_G(X)≪N_ℚ(X^(1/h)) X^(max(r/(2h), p/((p−1)|G|))+ε)`.

For `q≥5` use the inductive quotient exponent `β=3/8`; for `q=3,4` use `β=1/2`, and for `q=2` use `β=1`. The abelian pole theorem above supplies these last cases, with its logarithms absorbed into `X^ε`. Both resulting exponents `(r/2+β)/h` and `(p/((p−1)q)+β)/h` are `≤3/8` except `h=2` and `(q,h)=(2,3),(2,4)`. Abelian groups are already covered. The order-eight exception is nilpotent: Klüners–Malle [136], Theorem6.3, p.13 gives regular-action exponent `1/4+ε`. Its upper-bound induction uses Theorem5.1, pp.10–12, independently of Shafarevich existence.

For `S₃` the cubic conductor identity and the quadratic three-torsion mean supply a direct bound. If the quadratic resolvent has relative discriminant `d` and the cubic conductor is `f`, the cubic discriminant is `df ²` and the Galois discriminant is `d³f⁴`. The conductor-character bound, summed using `Σ_(Nd ≤T)h₃(d)≪_k T`, gives `O_(k,ε)(X^(1/3+ε))`; the sum over conductors converges with weight `(Nf)^(-4/3)`, including the finitely many wild factors. For `h=2`, use inflation–restriction `Hom(G_S(k),C₂)→Hom(G_S(M),C₂)^Q→H²(Q,C₂)`. The last group has bounded size and the first character count is controlled over the fixed base `k`. This replaces `D_M^(1/2+ε)` by `D_M^ε`. The resulting bound is `N_Q(X^(1/2))X^(2/|G|+ε)`. After the nilpotent cases, `q≥6`, so its exponent is at most `3/16+1/6=17/48<3/8`. These steps complete the arithmetic induction under the stated simple-group hypothesis.

**Finite-group boundary.** The nonabelian step needs the large-proper-subgroup inequality: for every finite nonabelian simple group `S` there is a proper subgroup `H` with `|H|²>|S|`. Ellenberg–Venkatesh, Remark 2.10, p.734, invokes classification for this input. For `S^r` take the product of these subgroups; simplicity makes its normal core trivial. The conditional arithmetic theorem assumes this precise inequality. `TauCetiRoadmap.CFSGStatement` defines the classification proposition only, and Tau Ceti's `TauCeti.ClassificationStatement` in `GroupTheory.SpecificGroups.CFSG.Classification` also has no proof of it. The conditional target includes this lemma as a hypothesis; the unconditional endpoint is not asserted as proved. The unconditional endpoint requires a proof of the stated finite-group inequality; the classification proposition alone cannot discharge it. The special `S₃` application used below uses the separate cubic theorem and does not require this nonabelian-simple input.

*Needs:* [cyclic prime field count](#cyclic-prime-field-count), [Schmidt field count bound, uniform absolute-discriminant form](#schmidt-field-count-bound), Completed EffectiveBounds Layer 1.

([[102]](#ref-102), Proposition1.3,p.725; proof Proposition2.8,§2.2,pp.734–737.)

**Checks.**

- The regular `S₃` action has degree6 and group order `6>4`; its `3/8+ε` bound makes its contribution smaller than `X^(1/2)`.
- For `S=A₅, H=A₄` has `|H|²=144>60=|S|`. This checks the required inequality in the smallest case, not its universal quantifier. For the abelian simple group `C₂` its only proper subgroup has order1 and the inequality fails; nonabelian is essential.
- `ClassificationStatement` is a proposition naming a classification, not evidence for that proposition. Its universe-transport implication cannot discharge the missing hypothesis.
- At `h=60` the nonabelian exponent is less than `3/8`; at `h=2` the unrefined abelian exponent fails. The refined exponent `17/48` is strictly smaller than `18/48=3/8`. For `Q=V₄`, the `X^(1/2)(log X)²` term must be absorbed into `X^(1/2+ε)`, rather than replaced by `O(X^(1/2))`.

<a id="fixed-resolvent-cubic-count"></a>

**Fixed resolvent cubic count.** `FieldStatistics.fixedResolvent_cubicFields` states both positive asymptotics and the exceptional Euler-product constant. For a fixed quadratic field `F=ℚ(√d)`, with `d` its fundamental discriminant and `d≠−3`, the number `N₃(S₃,F,X)` of cubic fields with quadratic resolvent `F` and `|D_K|<X` satisfies `N₃(S₃,F,X)~C_F X^{1/2}, C_F>0`. For `F=ℚ(√−3)`, instead `N₃(S₃,F,X)~C_{−3} X^{1/2}log X`, with `C_{−3}=7/(60√3)·∏_p(1−3/p²+2/p³)>0`. Consequently every fixed `F` satisfies `N₃(S₃,F,X)≪_F X^{1/2}(1+log X)`. All constants and error terms may depend on `F`; these pointwise statements do not give uniformity in `F`.

`F` is a fixed quadratic extension of `ℚ`; fields are counted up to `ℚ`-isomorphism by absolute field discriminant. Separate the fundamental discriminant `d=−3` from `d≠−3`.

Proof: Use the anti-invariant ray-class/Kummer conductor series of Cohen–Morra Theorem6.1, retaining its finite character sum and wild prime3 factors; this is the requested ClassFieldTheory export. For `d≠−3` the trivial-character part has a simple conductor pole; for `d=−3` it has a double pole. Apply Corollary6.2/§7.2–7.3, retaining positivity and the lower-order pole. Translate conductor height `Y` to discriminant height `X` by `Y=(X/|d|)^{1/2}`. The double-pole term contributes `(1/2)log X` and yields the stated pure-cubic coefficient. Compare Bhargava–Shnidman Theorems7–8 and their shape/hyperbola proofs.

*Needs:* [cubic conductor discriminant](#cubic-conductor-discriminant), `TauCetiRoadmap.ClassFieldTheory` Layer 13, Completed ArithmeticDirichletSeries Layer 9.

([[109]](#ref-109), Theorem1.1(1)–(2),pp.2–3; Corollary6.2,pp.13–14; Corollaries7.4 and7.6,pp.15–17; [[108]](#ref-108), Theorems7–8 and(1),pp.57–58; §5,pp.79–80; §6,pp.80–86; [[99]](#ref-99), §6,Remark6.1,(10),p.10.)

**Checks.**

- For `d≠−3`, the normalized count `N₃(S₃,F,X)/√X` tends to a finite positive `C_F`.

- For `d=−3`, that quotient diverges like `C_{−3}log X`; dividing by `√X log X` gives the stated positive Euler product.

- The extra logarithm is absorbed by `X^η` for any `η>0`, without making the constants uniform in `F`.

<a id="baily-weighted-quartic-count"></a>

**Baily weighted quartic count.** Let `C` be any specified set of `ℚ`-isomorphism classes of cubic fields, cyclic or noncyclic. For `X≥1`, the number of quartic `A₄/S₄` fields of absolute discriminant `≤X` whose cubic resolvents lie in `C` satisfies

`N₄(C,X) ≪ Σ_(K∈C,D_K≤X) h₂(K)(log(2D_K))² √(X/D_K)`.

The constant is absolute, independent of `C, K` and `X`. Since cubic `D_K>1, log(2D_K)` may equivalently be replaced by `log D_K`. The supporting fixed-resolvent quartic estimate proves this inequality for each `K` before summing, so it remains valid for every subfamily without a uniformity assumption on its selection.

Use the original parametrization with proof in Cohen–Thorne [143], Theorem2.2, pp.5–6: quartic fields with resolvent `K` correspond to quadratic `K(√α)/K` with `N_(K/ℚ)(α)` a rational square. The correspondence is one-to-one for `S₄` and three-to-one for `A₄`, so counting these quadratic extensions gives an upper bound in both cases. The discriminant identity is `D_L=D_K Nm(d_(K(√α)/K))`. Write `(α)=a b²` with a squarefree integral ideal. Proposition3.3, p.8 gives `d_(K(√α)/K)=4a/c²` with `c|2O_K`, whence `Nm(a)≤Nm(d_(K(√α)/K))≤X/D_K`. Proposition3.7, p.9 parametrizes the possibilities by a of square norm and square class, and a square-norm virtual unit. Dropping the class and sign constraints only increases the upper bound. The virtual-unit group has size at most `2^(r₁+r₂)h₂(K)≤8h₂(K)`, from the unit theorem and the square-class exact sequence. This keeps all dyadic conductors and both signatures.

If `Nm(a)=m²` for squarefree a in a cubic field, `m` is squarefree. At a rational prime `p` there are at most three prime ideals over `p` and their residue degrees have sum at most three. A nonempty subset has even total residue degree only when that degree is two. The number of such subsets is at most the number of degree-one primes above `p`: in the unramified types (111),(12),(3) the two numbers are respectively `(3,3)`,`(1,1)`,`(0,0)`; in each ramified type the inequality is immediate. Consequently the number of such a of norm `m²` is at most the coefficient `a_K(m)` of `ζ_K`. Summing `m≤√(X/D_K)` gives at most `A_K(√(X/D_K))` ideals.

The auxiliary uniform cubic ideal count is `A_K(T)≪T(log(2D_K))²` for every cubic `K` and `T≥1`, with an absolute constant. Its proof uses only the analytic zeta suppliers already required here, and avoids an unproved uniformity claim in Baily. Coefficientwise `ζ_K≤ζ³` gives `A_K(T)≪T(log(2T))²`. For a fixed integer `m≥12` let `S_K(T)=Σ_(Na≤T)(1−Na/T)^m`. Smoothed Perron and the degree-three convexity bound, shifted to Re `(s)=1/4`, give

`S_K(T)=κ_K T/(m+1)+O(D_K^(1/2)T^(1/4))`.

The factor `m!/[s(s+1)⋯(s+m)]` makes the shifted integral absolutely convergent; a small fixed `ε` in convexity is absorbed by the exponent `1/2` on `D_K`. This is the same contour calculation as [95], Lemma3.14 and (3.6), p.17, now used in both directions. Evaluate at `T=D_K²` and use `S_K≤A_K` to deduce `κ_K≪(log(2D_K))²` from the elementary divisor bound. If `T≥D_K²`, the inequalities `A_K(T)≤2^m S_K(2T)` and the displayed error give the claimed bound. If `1≤T<D_K²`, use the elementary divisor bound directly. This supplies the uniform `K` dependence for all `T`; neither a fixed-`K` asymptotic nor an `X`-dependent logarithm is substituted. Combining the parametrization, the virtual-unit bound and this ideal count proves the fixed-resolvent estimate and then the arbitrary-`C` assertion. The historical secondary formula [99], (5), is a consistency check, rather than the proof supplier.

*Needs:* [ArithmeticStatisticsPartII: bhargava parametrization of quartic rings](../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings), Completed EffectiveBounds Layer 1, `TauCetiRoadmap.ClassFieldTheory` Layer 13.

([[143]](#ref-143), Theorem2.2, pp.5–6; Proposition3.3, p.8; Proposition3.7, p.9. [95], Lemma3.14 and (3.6), p.17 supply the analytic contour estimate. [99], §6,(5), pp.9–10 records the Baily bound.)

**Checks.**

- For an empty resolvent subfamily both sides vanish. For a singleton `K` the bound keeps `h₂(K)(log D_K)²/√D_K` as a `K`-dependent factor; replacing it by a uniform constant loses the stated multiplicity control.
- In local types (111),(12),(3), the numbers of squarefree ideal subsets of residue-degree sum two are3,1,0, and the numbers of degree-one primes are3,1,0. For ramified types `(1²1),(1³)` the corresponding pairs are`(1,2)`,`(0,1)`. Counting all subsets would fail this comparison.
- At a dyadic prime, `v(d)=2v(2)+v(a)−2v(c)≥v(a)`, since `c|2O_K`. Thus dropping the dyadic condition preserves `Nm(a)≤Nm(d)`; imposing an odd-only conductor condition would omit valid quartics.
- At `T=D_K²`, the contour error `D_K^(1/2)T^(1/4)=D_K` is smaller than `T`. Below that threshold `log(2T)≤2log(2D_K)`, so both parts of the ideal bound have the same absolute constant convention.

<a id="weighted-cubic-partial-summation"></a>

**Weighted cubic partial summation.** Fix `b≥0` and `a>0`. If a cubic field family `C` satisfies `N_C(T)≪_F T^{1/2}(1+log T)^b` for `T≥2`, and `h₂(K)≪_ηD_K^{a+η}` for each `η>0`, then `Σ_{K∈C,D_K<X}h₂(K)(log D_K)²√(X/D_K)≪_{F,ε,b}X^{1/2+a+ε}` for each `ε>0`. Dyadic summation precedes absorption of logarithms. The choice `b=0` covers cyclic cubics and nonexceptional fixed resolvents; `b=1` covers `F=ℚ(√−3)`.

`C` is an isomorphism-class family of cubic number fields ordered by absolute field discriminant; `a>0` and `b≥0` are fixed. The implied count constant may depend on the fixed resolvent `F`.

Proof: A shell `T≤D_K<2T` contributes `O_{F,b,η}(X^{1/2}T^{a+η}(1+log T)^{b+2})`. Sum the geometric sequence using `a>0`, choose `η<ε` and absorb the fixed logarithmic power into `X^{ε−η}`.

*Needs:* Completed ArithmeticDirichletSeries Layer 6.

([[99]](#ref-99), §6,proof of(8)–(9),p.10.)

**Checks.**

- `b=0` and `b=1` give the same exponent `1/2+a+ε` after logarithm absorption.

- Without `ε`, the extra pure-cubic logarithm cannot be discarded.

<a id="quartic-torsion-counting-applications"></a>

**Quartic torsion counting applications.** `FieldStatistics.quarticTorsion_fieldCounts` states the `A₄` bound and the `S₄` bound for every fixed quadratic resolvent, including the exceptional one. Set `α=√3/2, β=((1+α)/(2α))log((1+α)/(2α))−((1−α)/(2α))log((1−α)/(2α))`, and `a=1/(6(1−β/log2))`; thus `a≈0.2784`. The [cubic two-torsion bound](#cubic-class-group-two-torsion-bound) gives `h₂(K)≪_ηD_K^{a+η}` for every `η>0`. Consequently `N₄(A₄,X)≪_εX^{1/2+a+ε}`, and for each fixed quadratic resolvent `F, N₄(S₄,F,X)≪_{F,ε}X^{1/2+a+ε}`. Keep `F`-dependence in the second estimate; the pure-cubic resolvent is handled with its logarithmic factor.

Proof: Apply the weighted quartic estimate to cyclic cubic resolvents for `A₄`, and to fixed-quadratic-resolvent cubic fields for `S₄`. Use the cyclic cubic `√T` count and the fixed-resolvent bound `√T(1+log T)`, including `F=ℚ(√−3)`, together with the nontrivial cubic two-torsion bound. Apply weighted partial summation with arbitrary `ε>0`.

*Needs:* [baily weighted quartic count](#baily-weighted-quartic-count), [cyclic prime field count](#cyclic-prime-field-count), [fixed resolvent cubic count](#fixed-resolvent-cubic-count), [weighted cubic partial summation](#weighted-cubic-partial-summation), [cubic two-torsion bound](#cubic-class-group-two-torsion-bound).

([[99]](#ref-99), Theorem1.4,p.2; §6,(8)–(9),Remark6.1,p.10.)

**Checks.**

- With `a≈0.2784`, the exponent is about0.7784; fixed-resolvent constants may depend on `F`.

- For cyclic cubic resolvents the pointwise cubic bound is still required; an `S₃`-only two-torsion theorem would not supply the `A₄` application.

- The exceptional resolvent `ℚ(√−3)` contributes one logarithm to its cubic count. It is absorbed into `X^ε` only after the weighted partial summation.


### 3.30 Governing fields and spin criteria

<a id="governing-field-interface"></a>

**Governing field interface.** Fix `k≥1` and `d∈ℤ` with `d≢2 mod4`. A governing field for `rk_{2^k}` in the family of quadratic fields of fundamental discriminant dp consists of a finite normal `M/ℚ` and a conjugacy-invariant map `φ:Gal(M/ℚ)→ℕ`. For every unramified rational prime `p` with dp fundamental, `φ(Frob_p)=rk_{2^k}Cl⁺`(`ℚ`(`√` dp)). All primes over `p` give the same value; finitely many ramified primes are excluded explicitly. This notion keeps `d` and `k` fixed, unlike relative governing fields which vary with other prime factors.

`k≥1; d≢2 mod4; M/ℚ` is finite Galois.

The development requires:

- The conjugacy-invariant Frobenius formula at every admissible unramified prime.

- Changing the prime over `p` or the Frobenius representative preserves the value.

- Transport `M` and its class function along a `ℚ`-algebra isomorphism.

- A finite normal extension of `M` governs by composing `φ` with restriction.

- `φ(τστ⁻¹)=φ(σ)`.

Proof: Use the native arithmetic-Frobenius relation on primes of the ring of integers. Use conjugacy invariance to eliminate the prime and Frobenius representative. Identify the quadratic field by an element with square dp and degree2, and use the already-defined prime-power rank of its native narrow class group.

*Needs:* [ArithmeticStatisticsPartIV: prime power class group rank](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank), `TauCetiRoadmap.ClassFieldTheory` Layer 13, `NumberField.exists_isArithFrobAt_int_of_liesOver` (Tau Ceti), `NumberField.isArithFrobAt_eq_of_isUnramifiedAt` (Tau Ceti), `NumberField.NarrowClassGroup` (Tau Ceti).

([[103]](#ref-103), §1,(1.2),p.3.)

**Checks.**

- For `d=−4,p≡1 mod4` the genus-theory two-`rank` is1; the constant class function1 is compatible with every admissible prime.

- A rational prime ramified in `M` creates no Frobenius obligation.

- For `d=−4,p=3`, `dp =−12` is not fundamental; that prime is not in the family.

- Values differing on conjugate Frobenius elements cannot define a governing class function.

<a id="eight-rank-governing-field"></a>

**Eight rank governing field.** For odd `p≡1 mod4`, put `E=ℚ(ζ₈,√(1+i))`. It is a Galois field of degree8 with dihedral group of order8. Then8 divides `h(−4p)` exactly when `p` splits completely in `E`. The parameter restriction makes `−4p` the fundamental field discriminant; the source’s notation `D₄` means the order8 dihedral group.

Proof: use the quadratic genus description to identify the relevant two-primary cyclic factor. The quartic-residue criterion is Bruin–Hemenway [134], `(1.1c)`, pp.63–64 and pp.74–75: `p≡1 mod8` and `(1+i/p)=1`. Passing to the normal closure `E` gives complete splitting. The degree-eight dihedral description in [135], §3.1, p.7 has the following algebraic description and explicit arithmetic input for the spin criterion.

**Arithmetic data hypotheses.** The spin criterion below assumes the displayed integral basis, discriminant and class number one for `E`. These fixed-field data are hypotheses of that application. Polynomial irreducibility and the displayed identities are small worked Checks of its field presentation. Put `f(T)=T⁸+6T⁴+1` and let `t` be its residue class. In `ℚ[T]/(f)` set

`z=(t⁶−t⁴+7t²−3)/4`, `β=(3t⁷−t⁵+17t³−3t)/4`.

Polynomial reduction gives `z⁴=−1` and `β²=1+z²`. The element `1+i` is not a square in `ℚ(i,√2)`: writing a possible square root as `a+b√2` with `a,b∈ℚ(i)` forces `ab=0`, and either case contradicts the rationality of the Gaussian norm of `a` or `b`. Thus adjoining `β` to `ℚ(z)` has degree two. It embeds into the eight-dimensional quotient above, making that quotient a field and identifying it with `E`. This proves `f` irreducible without relying on a numerical root computation. The polynomial `β⁴−2β²+2` has roots `±β` and `±β′`, where `β′=√2/β` and `(β′)²=1−i`. They all lie in `E`. Conversely `β²−1=i` and `ββ′=√2` recover `ℚ(ζ₈)`, so `E` is its splitting field. Its group is a transitive subgroup of `S₄` of order8, hence `D₄`. This rules out both a cyclic group and the quaternion group.

Use the ordered basis

`b=(1, t, t², (1+t+t²+t³)/2, (1+t⁴)/2, (t+t⁵)/2, (3+3t²+t⁴+t⁶)/4, (2+t+2t²+t³+t⁵+t⁷)/4)`.

Assume the basis determinant is `1/128`, its trace-pairing determinant is `2²²` and the power-basis discriminant is `2³⁶`. Assume each `b_i` has integral characteristic polynomial, whereas for every nonzero `e∈{0,1}⁸` the characteristic polynomial of `(Σ e_i b_i)/2` has a nonintegral coefficient. A nontrivial index in `O_E` would then be even and force an integral half-coset. Therefore `b` is an integral basis. The integral span need not first be shown to be a ring: the absence of integral half-cosets rules out a larger integral lattice. For principality take `g=(1+t)/β`. Its `b`-coordinates are `(−1,−2,−2,2,0,−1,−1,1)`, and its polynomial is

`T⁸−4T⁷+4T⁶+2T⁴−8T³+12T²−8T+2`.

It is Eisenstein at two, so two is totally ramified and the unique prime above two is `(g)`, of norm2. The signature is `(0,4)`, since `f` has no real zeros. Minkowski's ideal-class bound is `(4/π)⁴(8!/8⁸)2¹¹<13` (numerically12.93514). Every prime ideal of norm at most12 lies over2,3,5,7 or11. At3 and `11, f` factors into two irreducible quartics; at5 and7 into four irreducible quadratics. Dedekind's theorem applies there since the power-basis index is128. The factorizations are

- `mod3`: `(T⁴+T²+2)(T⁴+2T²+2)`;
- `mod5`: `(T²+T+1)(T²+2T+4)(T²+3T+4)(T²+4T+1)`;
- `mod7`: `(T²+T+4)(T²+2T+2)(T²+5T+2)(T²+6T+4)`;
- `mod11`: `(T⁴+5T²+10)(T⁴+6T²+10)`.

The arithmetic input includes irreducibility of each displayed factor over its residue field. The least prime-ideal norms at3,5,7,11 are81,25,49,14641, respectively. Thus only the principal prime over two can occur, every class has a principal ideal representative, and the class number is1. The bound uses primes of norm `≤12`, rather than primes whose rational residue characteristic is `≤13`. Thus the supplied basis, integrality and factorization data imply principality by Minkowski’s theorem.

*Needs:* [governing field interface](#governing-field-interface), `TauCetiRoadmap.ClassFieldTheory` Layer 13.

([[134]](#ref-134), (1.1c),pp.63–64; alternative proof,pp.74–75; [[135]](#ref-135), §3.1,(P1)–(P3),p.7; [[103]](#ref-103), §5,p.22.)

**Checks.**

- `p=3` is outside `p≡1 mod4: −4p=−12` is not its fundamental quadratic field discriminant. The governing group has order 8; reading the source label `D₄` as order 4 changes the splitting density.
- At `p=5`, the field discriminant is `−20` and its class number is `2`; the congruence `p≡1 mod8` fails, so `p` cannot split completely in `E`.
- At `p=17, h(−68)=4`: reduced primitive forms are `(1,0,17), (2,2,9), (3,±2,6)`. Thus `p≡1 mod8` alone is insufficient for the eight-divisibility criterion.
- The basis index128 gives `2³⁶/128²=2²²`, and the255 nonzero half-cosets all fail integrality. The norm-two element `g` has an Eisenstein polynomial with constant term2, rather than4; the latter would not certify a norm-two prime.
- At3 and11 the first possible prime-ideal norms are `3⁴` and `11⁴`; at5 and7 they are `5²` and `7²`. All exceed12, so the rational primes below13 are not automatically small-norm ideals.

For every intermediate field `L⊆E`, the unique prime over two is totally ramified in `E/L`. Every intermediate extension of degree greater than one is therefore ramified there, so `H_L∩E=L` for the ordinary Hilbert class field `H_L`. Unramified reciprocity and norm functoriality give `coker(Cl(E)→Cl(L))≃Gal(H_L∩E/L)=1`. Since `Cl(E)=1`, also `Cl(L)=1`. This supplies principality for every involution-fixed field in [[135]](#ref-135), Proposition6.1, pp.20–21, under the existing arithmetic data. The norm/reciprocity input is `ClassFieldTheory` Layer13 (also [[95]](#ref-95), Lemma2.3, pp.7–8).

<a id="sixteen-rank-spin-criterion"></a>

**Sixteen rank spin criterion.** Assume the integral-basis, discriminant, local-factorization and class-number-one data for `E` in §3.30 above. Fix `r` of order4 in `Gal(E/ℚ)`. There are `F>0` and `ψ₀:(O_E/F O_E)ˣ→C` invariant under multiplication by unit squares, such that for odd `p∤F` splitting completely in `E` and any generator `π` of a prime over `p,16|h(−4p)` iff `ψ₀(π modF)(r(π)/π)_{E,2}=1`. Generator independence, the2-adic residue correction and the fixed `r` convention are part of the assertion.

Proof: Import the corrected quadratic residue-symbol and joint-spin convention. Use the preceding principality transfer for all subfields, then Bruin–Hemenway [134], TheoremA, p.64, proved on pp.75–76. Its finite-residue conversion is [135], Proposition6.1, pp.20–21, (6.6)–(6.7), p.21, and Proposition6.2, p.22. Define `ψ₀` by its three involution-spin corrections and the quadratic character of `√(1+i)`; quadratic reciprocity makes each correction depend only on the residue modulo `F`. Formula (6.7) verifies unit-square invariance, while Proposition6.2 applies to every generator. The modulus in (3.1), p.7, includes the discriminant and the selected auxiliary prime norms.

*Needs:* [eight rank governing field](#eight-rank-governing-field), [prime character-sum estimates](#support-character-sums), `TauCetiRoadmap.ClassFieldTheory` Layer 13.

([[134]](#ref-134), TheoremA,p.64, proof pp.75–76; [[135]](#ref-135), Proposition6.1 and (6.6)–(6.7),pp.20–21; Proposition6.2,p.22; [[103]](#ref-103), §5,(5.1),p.22.)

**Checks.**

- The congruence factor is defined only on units modulo `F`, so `p|F` is excluded. Changing `π` by a unit square preserves `ψ₀`, while arbitrary unit changes require compatibility of the product with the residue symbol; `ψ₀` alone need not be invariant under every unit.
- For a unit `β`, replacing `π` by `πβ²` leaves each quadratic-symbol correction unchanged because `σ(β)²` is a square; this fixes the direction `r(π)/π`.
- For `p=3` the complete-splitting condition fails already in `ℚ(ζ₈)`. Even a chosen residue class modulo `F` cannot bring that prime into the criterion.

<a id="joint-spin-prime-bound"></a>

**Conditional joint-spin prime bound.** Use a fixed finite Galois `M/ℚ` of degree `n`, and a nonempty `S⊂Gal(M/ℚ)` with `S∩S⁻¹=∅`. If `M` is totally real, assume that every totally positive unit is a square; no such unit hypothesis is imposed in the totally complex case. Fix the ideal-class representatives and modulus `F` of [[103]](#ref-103), §2.2, and a finite residue function `ψ:(O_M/F)ˣ→ℂ` invariant under unit squares. Fix a decomposition `O_Mˣ=T_M×V_M`. For an odd principal ideal `a=(α)` prime to `F`, define

`s_a=Σ_(t∈T_M)Σ_(v∈V_M/V_M²) 1_(tvα totally positive) ψ(tvα modF) ∏_(σ∈S) (tvα/σ(tvα))_(M,2)`.

Set `s_a=0` for nonprincipal ideals and those not prime to `F`. Prove generator independence. Assume `C_(|S|n)` with saving `δ>0`. For `X≥2` and every `ε>0`, prove

`|Σ_(p prime,Np≤X) s_p|≪_(M,ψ,S,ε) X^(1−δ/(54|S|²n(12n+1))+ε)`.

All auxiliary choices are fixed; the implied constant may depend on those choices. The required analytic chain is owned here: Type I (2.5), uniformly in a nonzero ideal `m`, bounds `Σ_(Na≤X,m|a)s_a` by `O_ε(X^(1−δ/(54n|S|²)+ε))`; Type II (2.6) bounds `Σ_(Na≤x,Nb≤y)v_a w_b s_ab` by `O_ε((x^(−1/(6n))+y^(−1/(6n)))(xy)^(1+ε))` for `|v_a|,|w_b|≤1`. Prove Type I by the unit-domain lattice decomposition, quadratic reciprocity, and short progression sums from `C_(|S|n)`, retaining the common-divisor exceptional locus. Prove Type II by reciprocity, Cauchy–Schwarz and the nonsquare ideal-pair estimate. Implement the prime-extraction sieve of §2.6 from these two bounds, including higher prime powers, to obtain exactly the displayed saving. A rational character-sum hypothesis alone does not assert cancellation over number-field primes.

*Needs:* the conjecture `C_n` and quadratic residue corrections in [prime character-sum estimates](#support-character-sums), GlobalNumberFields Layers3 and11, `ClassFieldTheory` Layer13.

Source: [[103]](#ref-103), Theorem1 p.2, §2.3 (2.4) pp.5–6, §2.6 (2.5)–(2.6) p.7 and §§3–4 pp.8–21.

**Checks.**

- For a singleton containing an order-four automorphism, `S∩S⁻¹=∅`; a singleton involution fails the hypothesis.
- The empty `S` gives no asserted cancellation and is excluded; the disjointness condition implies `n≥3` for every allowed `S`.
- In a totally complex field the positivity indicator is identically one. Replacing `α` by a unit multiple permutes `T_M×V_M/V_M²` and preserves `s_a`.

<a id="no-sixteen-rank-governing-field"></a>

**No sixteen rank governing field.** Assume the `E` arithmetic data of the spin criterion and the short real-character-sum conjecture `C_n` of KM §2.5 for every `n≥3`. Then no finite normal `M/ℚ` with a class function governs the `16-rank` of `Cl⁺(ℚ(√−4p))` as odd `p≡1 mod4` varies. The conclusion remains conditional; it is not a Chebotarev theorem or a proved unconditional counterexample.

Proof: Enlarge a hypothetical governing field to contain `E`. Take `S` to be the inverse image of the fixed order4 element `r; S` is disjoint from `S⁻¹`. Use the norm identity for the joint spin and the finite residue selector to express it on degree-one principal primes as `2|T_M||V_M/V_M²|(1_{16|h(−4p)}−1/2)`. The governing class function makes the sign constant on degree-one primes. The conditional joint-spin estimate gives a power saving, while prime-ideal Chebotarev gives a positive main term, a contradiction.

*Needs:* [conditional joint-spin prime bound](#joint-spin-prime-bound), [governing field interface](#governing-field-interface), [sixteen rank spin criterion](#sixteen-rank-spin-criterion), [prime character-sum estimates](#support-character-sums), [mixed-trace and character-sum estimates](#support-character-sums), AnalyticNumberTheoryPartI §2.49.

([[103]](#ref-103), Theorem3,p.3; proof §5,pp.22–23.)

**Checks.**

- One fixed conjecture `C₃` is insufficient: the extension degree after enlarging a hypothetical governing field is unbounded. The proof therefore quantifies `C_n` over every `n≥3`.

- The compositum with `E` is totally complex, so the totally-real unit hypothesis in the joint-spin theorem is unnecessary for this application.

- A putative governing field for eight-divisibility exists by the complete-splitting criterion above; the contradiction uses the sixteen-rank spin sign and does not exclude that field.


### 3.31 Restricted radicands and historical Pell bounds

<a id="restricted-real-quadratic-family"></a>

**Restricted real quadratic family.** `D={d∈ℕ:d>0, squarefree, and every prime divisor is2 or1 mod4}; D(X)` uses `d<X`. `D⁻` imposes an integer solution `x²−dy²=−1`. The unit radicand1 belongs to both sets but gives `ℚ` rather than a quadratic field, and is removed when assigning a class group. For `r≥0, D_{2,r}` is the `d>1` subfamily with `rk₄Cl⁺(ℚ(√d))=r`. Ordering is by radicand; the discriminant is `d` when `d≡1 mod4` and `4d` otherwise. The symmetric-matrix law `P_Sym` and the rectangular law `P(m,n,j)` are the earlier Layer 3 matrix-`rank` laws.

For the field/rank API `d>1`; all set definitions retain `d=1`.

The development requires:

- `FieldStatistics.pellRadicands`: The positive squarefree radicands with no prime divisor `3 mod4`.

- `FieldStatistics.negativePellRadicands`: The soluble negative-Pell subfamily.

- Strict radicand truncation and its finite cardinal.

- For `d>1` squarefree, membership is equivalent to rational solubility of `x²−dy²=−1`.

- The `d>1` subfamily with native narrow four-`rank r`.

- `d` if `d≡1 mod4`, otherwise `4d`; comparison of orderings is made residue class by residue class.

Proof: Define `D` directly on integers; no arithmetic-field carrier is needed for its local and Pell tests. Use the existing quadratic-field construction for `d>1` and its narrow class group. Use the exact discriminant conversion on each residue subfamily before comparing radicand and discriminant proportions.

*Needs:* [ArithmeticStatisticsPartIV: prime power class group rank](../ArithmeticStatisticsPartIV/README.md#prime-power-class-group-rank), [ArithmeticStatisticsPartIV: symmetric matrix kernel law](../ArithmeticStatisticsPartIV/README.md#symmetric-matrix-kernel-law), [ArithmeticStatisticsPartIV: matrix kernel law over a finite field](../ArithmeticStatisticsPartIV/README.md#matrix-kernel-law-over-a-finite-field).

([[104]](#ref-104), §1,pp.1–2; §7.3,p.74.)

**Checks.**

- 1 is in `D` and `D⁻`, but excluded from every four-`rank` slice.

- `5∈D⁻`, witnessed by `(x,y)=(2,1)`; its field discriminant is5.

- `3∉D` because `3 mod4` is forbidden.

- `2∈D⁻` via`(1,1)`, but its field discriminant is8, not2.

<a id="negative-pell-historical-bounds"></a>

**Negative pell historical bounds.** `FieldStatistics.negativePell_historicalBounds` states the unrestricted inequalities with strict radicand ordering, using `FieldStatistics.pellRadicands`, `FieldStatistics.negativePellRadicands` and `FieldStatistics.negativePellProportion`. Put `α=∏_{j≥1,j odd}(1−2^{-j})`. The historical Fouvry–Klüners bounds are `α≤liminf #D⁻(X)/#D(X)≤limsup #D⁻(X)/#D(X)≤2/3`. The historical account [104], §1, p.2 attributes `#D⁻(X)≫X/(log X)^0.62` to Blomer and, for each fixed positive number `t` of prime factors, `liminf≥λ_t≥α` to Cremona–Odoni. The targets below prove these numerical lower bounds independently. These are earlier theorems, not the `1−α` limiting density; a proof of the limiting-density theorem needs separate reflection/expansion machinery.

Proof: Import the earlier Pell/genus moment comparisons with their exact radicand ordering. Use their finite-prime-factor and unrestricted-family lower/upper estimates separately. Compare `α` with `2/3` numerically only as a regression, not as a proof of the `1−α` limiting density.

The unrestricted and odd/even Fouvry–Klüners inequalities are [139], Theorem1 and Corollary1, pp.2037–2038. Their separate residue-subfamily statements justify transferring those inequalities between radicand and discriminant height. They also imply the stated weak `X/(log X)^0.62` lower bound: [AnalyticNumberTheoryPartI §3.32](../AnalyticNumberTheoryPartI/README.md#s3-32) gives `#D(X)∼cX/(log X)^(1/2), c>0`, for precisely the squarefree radicands whose odd prime factors are `1 mod4`, allowing the factor two once, and the positive `liminf α` gives `#D⁻(X)≫X/(log X)^(1/2)`. For `X≥e` this is at least a constant times `X/(log X)^0.62`. This is an alternate proof of the mathematical inequality attributed to Blomer, not a verification of his shorter independent argument.

**Fixed-prime-factor lower bound.** Put `D_t(X)={d∈D(X):ω(d)=t}, D_t⁻(X)=D_t(X)∩D⁻` and

`q_t=∏_(1≤j≤⌊t/2⌋)(1−2^(1−2j))`.

For every fixed `t≥1`, `FieldStatistics.pell_fixedPrimeFactor_lower` states `liminf_(X→∞) #D_t⁻(X)/#D_t(X)≥q_t≥α`. This gives the numerical lower bound attributed to Cremona–Odoni by [104], §1, p.2, through the following independent proof; it makes no identification with the original paper's notation `λ_t`. All limits fix `t` before `X` tends to infinity.

Use the [quadratic-character interval bound](#quadratic-character-interval-bound) for the character sums below.

Next prove equidistribution of the Legendre-symbol patterns: for every fixed `t≥1`, among increasing primes `p₁<⋯<p_t`, all congruent to1 modulo4 and with product `≤X`, each prescribed list `(p_i/p_j)=ε_ij∈{−1,1}`, `i<j`, has asymptotic proportion `2^(−binom(t,2))`. Here is a direct induction using only the interval estimate, fixed-modulus PNT and its reciprocal-prime consequence, with no uniform PNT for growing moduli. Write `L=log log X`. The unsigned count is asymptotic `X L^(t−1)/(2^t (t−1)! log X)`. For `t≥2` and any fixed `0<η<1/4`, discard tuples whose product `m` of the `t−1` smaller primes exceeds `X^η`. Such a tuple has at least two primes above `X^(η/(t−1))`. Fixing the other `t−2` primes with product `r`, the elementary bound `π(X/(rq))≪X/(rq log X)` and the bounded reciprocal-prime sum over `X^(η/(t−1))<q≤√X` give total `O_(t,η)(X L^(t−2)/log X)`. Tuples with a prime `≤(log X)^A` contribute `O_(t,A)(X L^(t−2)log log log X/log X)`, also negligible. These estimates follow by induction from fixed-modulus PNT and partial summation; repeated prime factors can be omitted in the upper bounds.

Expand each pattern indicator as a finite product of `(1+ε_ij(p_i/p_j))/2`. For a nonempty edge monomial incident to the largest prime `p`, select an incident smaller prime `q` in a dyadic interval [`Q,2Q`), and fix the remaining product `r`. Every other symbol is absorbed in coefficients `a_q,b_p` of absolute value `≤1`. Cauchy–Schwarz in `p`, followed by enlargement of its prime support to integers, bounds the sum over `pq≤X/r`, with the ordering constraints retained, by

`O(P√Q + √P Q^(3/2)√log(2Q)),  P=X/(rQ)`.

Indeed, after expansion the `q₁=q₂` diagonal is `O(PQ)`; for `q₁≠q₂` the remaining character is primitive of conductor `q₁q₂`, and the interval estimate gives `O(Q log(2Q))` for each pair. The product cutoff and ordering leave a single interval in `p` for each pair: its upper end is `min(X/(rq₁),X/(rq₂))`, and its lower end is `max(q₁,q₂,the fixed primes)`. Thus this argument does not replace a hyperbola by an unsupported rectangular estimate. Summing dyadic `Q≥(log X)^A` and `r` gives

`O_t(X L^(t−2)/(log X)^(A/2) + X^(1/2+η)√log X)`;

the first term uses `Σ_r1/r≪L^(t−2)`, the second `Σ_r r^(−3/2)<∞` and `Q≤X^η/r`. Take `A>4`. Monomials not incident to `p` reduce to the induction hypothesis on the smaller primes by partial summation of their signed harmonic sum. Fixed-modulus PNT gives `π(X/m;4,1)=(1+O(η)+o(1))X/(2m log X)`, uniformly for `m≤X^η`; the induction makes each nonempty smaller-prime monomial `o(L^(t−1))` after harmonic weighting. The `O(η)` term is bounded by the unsigned harmonic sum; let `X→∞` and then `η↓0`. In replacing the count of possible largest primes by `π(X/m;4,1)`, subtract primes at most the largest factor of `m`. Their total is `O(X^(2η))`, since there are at most `X^η` possible `m` and each subtracted cutoff is at most `X^η`; this is negligible. For the empty monomial, the harmonic sum of the `t−1` smaller prime products is asymptotic to `L^(t−1)/(2^(t−1)(t−1)!)`, by the reciprocal-prime sum and expansion into distinct products. Imposing `m≤X^η` changes that harmonic sum by `O_(t,η)(L^(t−2))`, since an excluded product has a prime above `X^(η/(t−1))`. This gives the unsigned count displayed above. The induction begins at `t=1` with the prime number theorem modulo four. This proves the full pattern assertion in the same product ordering.

For an odd `d=p₁⋯p_t` in this family, let `L_d` be the symmetric `𝔽₂` graph Laplacian with off-diagonal entry1 exactly when `(p_i/p_j)=−1` and diagonal equal to the row sum of its off-diagonal entries. The narrow Rédei criterion gives `rk₄ Cl⁺(ℚ(√d))=t−1−rank L_d`: a subset of the prime factors gives a permissible norm factorization exactly when its indicator is in `ker L_d`, and complementary subsets give the same factorization. This is [139], Proposition2 and its local-square expansion, pp.2052–2053. Thus rank `t−1` forces negative-Pell solubility by [139], Lemma2, p.2039. The `t(t−1)/2` independent edges identify these Laplacians with all symmetric `(t−1)×(t−1)` matrices by deleting the last row and column; the remaining diagonal entries recover the edges to the last vertex. The full Laplacian is congruent to this block plus a zero block, since its rows sum to zero. The existing MacWilliams symmetric-`rank` count then gives nonsingular probability `q_t` ([145], Theorem2.7, p.7 gives the same finite graph probability). Every omitted factor lies in `(0,1)`, so `q_t≥α`.

For `t≥2` the even radicands have only `t−1` odd prime factors, hence count `O_t(X L^(t−2)/log X)` and do not change this fixed-`t` proportion. At `t=1` the single even radicand2 is negligible, and every prime `≡1 mod4` passes the rank-zero criterion. This handles the factor two under fixed-prime-factor radicand ordering; it does not replace the separate odd/even conversion needed for unrestricted or discriminant-ordered densities.

**Checks.** The empty `0×0` symmetric matrix gives `q₁=1; q₂=q₃=1/2` and `q₄=7/16`. The nonprincipal character modulo3 sums to0 on {1,2} and to1 on {1}; a principal character has interval sums growing with the interval length and is excluded. The two-vertex Laplacians are the zero matrix of rank0 and the all-one matrix of rank1, each with probability `1/2`. For `(p₁,p₂)=(5,13), (5/13)=−1` and `8²−65·1²=−1`. For `(5,41), (5/41)=1` and the rank-zero graph supplies no negative-Pell conclusion. At `t=2` the even subfamily consists of `2p` and is smaller by one factor `log log X` than the odd semiprime family. The interval-pair calculation includes both the positive diagonal and the cancelling off-diagonal; replacing the prime cutoff by a fixed-modulus asymptotic without this calculation would leave a gap.

*Needs:* [restricted real quadratic family](#restricted-real-quadratic-family), [fk main coefficient](#fk-main-coefficient), [AnalyticNumberTheoryPartI: restricted Pell denominator](../AnalyticNumberTheoryPartI/README.md#s3-32), [ArithmeticStatisticsPartIV: MacWilliams symmetric rank count](../ArithmeticStatisticsPartIV/README.md#macwilliams-symmetric-rank-count), [AnalyticNumberTheoryPartI: fixed-modulus prime distribution](../AnalyticNumberTheoryPartI/README.md#s0-32).

([[104]](#ref-104), §1,p.2, citing FK1/Blomer/Cremona–Odoni.)

**Checks.**

- The upper bound `2/3` and lower product `α` leave room for the `1−α` theorem; the historical inequalities are not its proof.
- For `t=1` the graph product `q₁=1`; for `t=2` and3 it is `1/2`; for `t=4` it is `7/16`. The full infinite product is smaller. These test the finite graph law [145], Theorem2.7, p.7; the criterion and equidistribution argument above identify it with the arithmetic lower bound. The `t` and `X` limits are not exchanged.
- For `X≥e, (log X)^(1/2)≤(log X)^(31/50)`. Thus the positive-proportion FK lower bound implies the weaker exponent0.62 without claiming to reproduce Blomer's independent proof.

### 3.32 Polynomial-order reduction and coefficient sieves

<a id="polynomial-order-lattice-reduction"></a>

**Polynomial order lattice reduction.** For monic real `g` of degree `n` with nonzero discriminant, form `A_g=ℝ[X]/(g)`, its basis `1,θ,…,θ^{n−1}`, and the `ℤ`-span of that basis. For a real binary `n`-ic `f` with `a₀≠0` and nonzero discriminant, put `θ=X` in `ℝ[X]/(f(X,1))` and `ζ_k=Σ_{j=0}^{k−1}a_jθ^{k−j}`; use `1,ζ₁,…,ζ_{n−1}`. The norm is the sum of the squares at real embeddings and `|z|²` for one embedding from each complex pair. A basis is Minkowski-reduced when at each step it minimizes norm among vectors extending the preceding vectors to a `ℤ`-basis. Monic quasi-reduction permits upper unitriangular integral basis changes; binary quasi-reduction permits an `SL₂(ℤ)` representative. Strong quasi-reduction requires uniqueness of the reduced basis modulo independent signs in addition to quasi-reduction. For a displayed Gram basis, strong reducedness also requires that displayed basis to be reduced. This Euclidean metric must not be replaced by the all-embeddings weighted metric.

`n≥2`; real coefficients; nonzero discriminant; binary leading coefficient nonzero.

The development requires:

- The embedding Gram matrix of the power basis with one complex representative.

- The embedding Gram matrix of `1,ζ₁,…,ζ_{n−1}`.

- Successive norm minimization among integral vectors extending the fixed prefix to a unimodular basis.

- Every positive-definite real Gram matrix admits a unimodular integral basis satisfying the preceding prefix-minimum predicate.

- Some upper unitriangular integral change gives a reduced power basis.

- Some `SL₂(ℤ)` representative has reduced displayed basis.

- The displayed basis is reduced and every unimodular change giving a reduced basis is diagonal with entries `±1`.

- The Gram-matrix adapter for monic quasi-reduction: an upper unitriangular integral change gives a reduced basis. For `monicOrderGram g` it is equivalent to `IsMonicQuasiReduced g`.

- For integral monic `g` it is the Gram matrix on the native quotient ring `ℤ[X]/(g)`.

- For integral `f` it is the Gram matrix on the associated binary-form order.

- The monic root dilation multiplies the jth basis vector by `ρ^j`; uniform binary coefficient dilation fixes1 and multiplies every `ζ_k` by `ρ`.

Proof: construct the quotient-algebra basis and its embedding Gram matrix, counting each complex pair once. Define reducedness directly on a positive-definite real Gram matrix `A`: for every `j` and every integral vector `v` extending the preceding basis prefix to a unimodular basis, require `A(e_j,e_j)≤A(v,v)`. A positive-definite Gram ball contains finitely many integer coordinate vectors. At each prefix there is an admissible extension vector, so norm minimization in that finite sublevel constructs a reduced basis. This is the required real-metric extension, rather than applying the integral-Gram supplier to a nonintegral matrix. Record the two allowed change groups separately. For integral polynomials compare the lattice with the image of `ℤ[X]/(g)`; for binary forms compare with the existing binary-form order of Layer 1, requesting its general-degree extension.

*Needs:* `AdjoinRoot` (Mathlib), [ArithmeticStatisticsPartI: binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), `Matrix.SpecialLinearGroup` (Mathlib).

([[105]](#ref-105), §5,pp.24–25; BSW II §7,pp.52–53; [[106]](#ref-106), §7,Lemma7.2,pp.52–53.)

**Checks.**

- For `g=X²+1` the unweighted Gram matrix is `diag(1,1)`, not `diag(2,2)`.

- For `g=X²−2` the Gram matrix is `diag(2,4)`.

- An independent sign change always preserves reducedness; literal unique ordered basis is impossible in positive rank.

- Scaling `f` by `ρ` leaves the root `θ` fixed, fixes basis vector1 and scales every other `ζ_k` by `ρ`, so it is not a homothety of the whole lattice.

- For `IsMinkowskiReducedGram`, `diag(1,2)` is reduced; `diag(2,1)` fails the first minimum because the second vector is shorter; `[[1,−1],[−1,3]]` fails the second minimum because adding the first vector shortens the second. The boundary `diag(1,1)` is reduced.

- At the tied-minima boundary `diag(1,1)`, the displayed basis is reduced but not strong. For `IsStrongReducedGram`, `diag(1,2)` is strong; `diag(1,1)` is not strong because the swap is another reduced basis outside independent signs; `diag(2,1)` is not strong because its displayed basis is not reduced. This tests both requirements separately.

- The matrices `diag(1,1/4)` and its reduced swapped matrix exhibit the fixed-first-vector obstruction. For `IsMonicQuasiReduced` and its Gram adapter, `X²+2` is quasi-reduced with strong Gram matrix `diag(1,2)`; `X²+1` is quasi-reduced but not strong; `X²+1/4` is not quasi-reduced because `θ` has norm `1/2`, shorter than the fixed first vector1. Its Gram matrix `diag(1,1/4)` becomes reduced after swapping columns, but that swap is not upper unitriangular. An arbitrary unimodular reduction cannot establish monic quasi-reduction.

- For `IsBinaryQuasiReduced`, `x²+2y²` is quasi-reduced with strong displayed Gram matrix. The nonreduced displayed basis for `x²+2xy+3y²` has Gram matrix `[[1,−1],[−1,3]]`, but the allowed substitution `(x,y)↦(x−y,y)` has determinant one and gives `x²+2y²`. The form `x²+(1/4)y²` is not quasi-reduced: every induced order isomorphism fixes1, while its lattice contains an element of norm `1/2`. A lattice swap reduces `diag(1,1/4)` but cannot be induced by a permitted binary substitution. Finally `x²+y²` is quasi-reduced but its Gram basis is not strong.


<a id="squarefree-field-discriminant-sn"></a>

**Squarefree field discriminant sn.** `FieldStatistics.squarefree_discriminant_fullSymmetric` states the normal-closure degree `n!`, equivalent to the full permutation group in degree `n`. If `K/ℚ` has degree `n≥2` and squarefree absolute field discriminant, its normal-closure permutation group is `S_n`. Unlike the supplied order-maximality criterion, this target identifies the normal-closure group. Its polynomial and binary-form applications require the corresponding order and discriminant identity.

Proof: the tame discriminant exponent1 at each ramified prime means inertia acts by a transposition. The normal subgroup generated by all finite inertia has fixed field unramified at every finite prime over `ℚ`, hence trivial by the Minkowski discriminant bound (even if real places ramify). A transitive subgroup generated by transpositions is the full symmetric group. The order-to-field discriminant comparison is the supplied boundary stated above.

*Needs:* Mathlib `NumberField.abs_discr_gt_two`, PolynomialGaloisGroups Layers 0,2,6, LocalFieldsRamification Layer 3, [ArithmeticStatisticsPartI: binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order) and GlobalNumberFields' discriminant/index-square comparison. No counting sieve or nonabelian class-field theorem is needed for this criterion.

([[105]](#ref-105), §1,p.2; §5,p.26, citing the classical originals.)

**Checks.**

- `X³−X−1` has discriminant `−23` and yields `S₃`; `X³−4X+1` has discriminant 229 and gives the totally real `S₃` case.
- `X³−2` has discriminant `−108` and is outside the squarefree hypothesis, despite also having group `S₃`.
- The cyclic cubic field of discriminant 49 has normal-closure degree 3 rather than 6. Its nonsquarefree field discriminant prevents it from satisfying the criterion.

<a id="monic-polynomial-sieve-counts"></a>

**Monic polynomial sieve counts.** For `n≥2`, put `H(g)=max_{1≤i≤n}|a_i|^{1/i}` and `N=n(n+1)/2`. The squarefree-discriminant count with `H<X` is `λ_n2^nX^N+O_{n,ε}(X^{N−1/5+ε}), λ_n=∏_pλ_n(p)>0`. The maximal-order count is `ζ(2)^{-1}2^nX^N` with the same error. Irreducibility may be imposed with a smaller error. In a fixed signature/regular weighted-homogeneous real region and a `κ`-acceptable local family, replace the coefficient by the real volume times the local product, and the error by `O(X^{N−min(1/(2κ),1/5)+ε}); κ≥2`.

Proof: Count each congruence class in the weighted coefficient box and truncate Möbius inversion at `X^{1/κ}`. Use the Layer 2 weak/strong divisibility tail to control the omitted moduli. Sum the convergent local factors and use the quantitative reducibility bound; include the region-boundary estimate for each signature.

*Needs:* [ArithmeticStatisticsPartIII: monic fixed modulus sieve](../ArithmeticStatisticsPartIII/README.md#refinement-monic-fixed-modulus-sieve), [ArithmeticStatisticsPartIII: monic summed tail](../ArithmeticStatisticsPartIII/README.md#refinement-monic-summed-tail), [ArithmeticStatisticsPartI: family defined by local conditions](../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions).

([[105]](#ref-105), Theorems1.1–1.2,(4),pp.1–3; Theorem4.1 and §4.2,pp.20–23.)

**Checks.**

- For `n=2` the full coefficient box has positive density, but imposing `a₁=0` forces `Δ=−4a₂` and zero squarefree density. A fixed region or local family still needs its own actual local positivity, rather than inheriting it from the full box.

<a id="monic-weak-quasi-reduction"></a>

**Monic weak quasi reduction.** For a separable monic real `g`, define `g_ρ(X)=ρ^n g(X/ρ),ρ>0`. For all sufficiently large `ρ, g_ρ` is quasi-reduced. Uniformly on compact regular subsets away from zero discriminant this implies density-one quasi-reduction of monic integer polynomials ordered by `H`. It does not imply density-one strong quasi-reduction; the latter assertion in Lemma5.3 is false already in degree2.

Proof: Root expansion sends `θ^j` to `ρ^jθ^j` and separates successive Gram–Schmidt lengths. Use the general reduced-basis criterion for well-separated bases; make the bound uniform on a compact set with positive continuous lengths. Exhaust the coefficient unit box by compact regular subsets and apply lattice-point counting. Do not infer uniqueness of shortest-vector choices.

*Needs:* [polynomial order lattice reduction](#polynomial-order-lattice-reduction), [ArithmeticStatisticsPartIII: monic weak tail](../ArithmeticStatisticsPartIII/README.md#refinement-monic-weak-tail).

([[105]](#ref-105), Lemmas5.2–5.3,pp.24–25, corrected weak conclusion.)

**Checks.**

- For `g=X²+1, g_ρ=X²+ρ²` has Gram matrix `diag(1,ρ²)` in the once-per-complex-pair metric; for `ρ>1` the displayed basis is reduced.
- For `g=X²−1` the real Gram matrix is `diag(2,2ρ²)`. The opposite dilation `ρ^(−n)g(ρX)` would shrink the nonconstant vector and reverses this argument.
- At `ρ=0` the formula loses separability and the hypothesis fails. Weak reduction allows ties in reduced-basis choices and supplies no strong uniqueness conclusion.

<a id="strong-reduction-ring-fibres"></a>

**Strong reduction ring fibres.** For irreducible integral monic `g,g*` of degree `n≥2` with trace zero, nonzero discriminant and strong quasi-reduction, an isomorphism `ℤ[X]/(g)≃ℤ[X]/(g*)` forces `g*(X)=g(X)` or `(−1)^n g(−X)`. For binary `n`-ic forms, `n≥3`, after choosing strongly reduced `SL₂(ℤ)` representatives, an isomorphism of their associated orders forces `f*(x,y)=εs^n f(sx,y)`, `ε,s∈{±1}`. There are at most four such reduced sign alternatives; the overall sign for even `n` need not be an ordinary `GL₂(ℤ)` substitution.

Proof: A ring isomorphism preserves the unweighted embedding metric and sends the unique sign-orbit of reduced bases to itself. The first nonconstant monic basis vector gives `θ↦±θ*+c`. Trace zero forces `c=0`. In the binary case compare `ζ₁` and `ζ₂`, using the independence of `θ*,θ*²`, then recover the remaining coefficients and the two possible signs.

*Needs:* [polynomial order lattice reduction](#polynomial-order-lattice-reduction).

([[105]](#ref-105), Lemma5.1,p.24, corrected; BSW II Lemma7.2,pp.52–53; [[106]](#ref-106), Lemma7.2,pp.52–53.)

**Checks.**

- Odd degree has the monic reflected representative `−g(−x)`; binary representatives also require the independent overall sign.

<a id="trace-restricted-polynomial-sieve"></a>

**Trace restricted polynomial sieve.** For fixed `n≥2` the source’s trace-zero slice has squarefree density `κ_n=∏_pκ_n(p)`, with each factor the probability of `p²∤Δ` on `a₁=0`. The product is not universally positive: `κ₂(2)=κ₂=0` since `Δ(X²+a₂)=−4a₂`. The band `0≤a₁<n` requires its own restricted tail estimate and local-factor comparison; integral translation alone does not prove that its density is `λ_n`. For `n=1` the trace-zero slice consists ofX with discriminant1.

Proof: Request the codimension-one sieve with its exact height and boundary constants. Compute the `p`-adic local factors on the actual affine slice and check positivity independently. For the trace band retain each residue of `a₁` and use a uniform restricted tail; compare the resulting constants rather than using unrestricted density.

*Needs:* [monic polynomial sieve counts](#monic-polynomial-sieve-counts), [ArithmeticStatisticsPartIII: monic fixed modulus sieve](../ArithmeticStatisticsPartIII/README.md#refinement-monic-fixed-modulus-sieve).

([[105]](#ref-105), Theorem5.4,p.26 (with the stated correction).)

**Checks.**

- For `n=2, a₁=0` gives `Δ=−4a₂`, so `κ₂=0`. Universal positivity fails.

<a id="short-generator-field-upper-bound"></a>

**Short generator field upper bound.** For degree `n≥2`, the number of `ℚ`-isomorphism classes having an integral generator `α` with maximum archimedean absolute value `≤Y` is `O_n(Y^{(n−1)(n+2)/2}),Y≥1`. Translate `α` by an integer so `0≤a₁<n`, and then `|a_i|≪_nY^i` for `2≤i≤n`. This supplies an upper bound only; a polynomial count requires bounded field multiplicity for a lower bound.

Proof: Use the conjugate bound to control the elementary symmetric coefficients. Remove the trace coefficient by bounded integral translation; root norms remain `O_n(Y)`. Count the remaining coefficient box, with exponent `2+…+n`.

*Needs:* [ArithmeticStatisticsPartIV: number field counting function](../ArithmeticStatisticsPartIV/README.md#number-field-counting-function).

([[105]](#ref-105), §5,proof of Corollary1.4,pp.26–27; Ellenberg–Venkatesh Remark3.3.)

**Checks.**

- At `n=2` the exponent is2; at `n=3` it is5. These are generator-height counts, not discriminant counts.

### 3.33 Monogenic field predictions

<a id="regular-monic-region"></a>

**Regular monic region.** Fix `n≥2` and a signature `(r₁,r₂), r₁+2r₂=n`. Choose a bounded open coefficient ball `B⊂Rⁿ` with Jordan-measurable boundary and compact closure inside the locus of monic separable polynomials of this signature. For example, take a sufficiently small ball about the polynomial with roots `1,…,r₁` and `r₁+2j±i` for `1≤j≤r₂`. There are `c>0` and `C≥1` such that every root of every polynomial in the closure has norm `≤C` and every pair has distance `≥c`. Set `D_Y(b)_i=Y^i b_i, 1≤i≤n, Y≥1`; these are weighted coefficient dilations, with roots multiplied by `Y`. No trace slice is imposed.

The light interfaces are `weightedDilation`, defined for all real `Y` and every natural `n`, with `weightedDilation_mul`: `D_U D_Y=D_(UY)`, and `D_1= id`; root separation `separatedRoots(c,C,z)`, defined for all real `c,C` and `z:Fin n→ℂ` by all `|z_i|≤C` and `|z_i−z_j|≥c` for `i≠j`. Its API includes invariance under permutations, weakening `c` or enlarging `C`, and nonvanishing of the Vandermonde determinant when `c>0`. The inverse-Vandermonde estimate below needs `n≥2, c>0, C≥0` and `Y≥1`; the region construction chooses the stronger `C≥1`. It uses continuity on the simple-root locus, rather than choosing a continuous ordering globally.

Proof: the signature is locally constant at a simple-root polynomial. Shrink a ball around the displayed example until its closure is contained in that signature locus. The monic root bound gives a uniform upper bound on root norms there. A sequence of pairs whose separation tends to zero would, by compactness and continuity of polynomial evaluation, yield a repeated root of a polynomial in the closure, a contradiction. This supplies uniform `c,C` without a global root labeling. The dilation and separation predicates are elementary local interfaces; the regular-region argument replaces the uniqueness step in [[105]](#ref-105), §5, pp.24–27.

*Needs:* Mathlib real/complex compactness, polynomial evaluation and `Polynomial.discr`, and `Matrix.det_vandermonde_ne_zero_iff` in `Mathlib.LinearAlgebra.Vandermonde`; the signature/root convention in [polynomial order lattice reduction](#polynomial-order-lattice-reduction).

**Checks.**

- For `n=2`, roots `(−1,1)` have `C=1,c=2; D_Y(X²−1)=X²−Y²`. This is a real region, not a claim that this particular reducible polynomial supplies fields.
- Roots `(−i,i)` give the imaginary quadratic region with the same bounds. Repeated roots `(0,0)` fail every `c>0`.
- `D_2` followed by `D_3` sends coefficients `(1,2)` to `(6,72)`, as does `D_6`. `D_0` collapses the region and is excluded from the counting theorem. For `n=0` the coefficient tuple is empty and separatedRoots is vacuous; for `n=1`, the zero root satisfies `separatedRoots(1,0)`, but fails `separatedRoots(1,−1)`. Neither instance supplies a field-count region of degree at least two.

<a id="regular-monic-sieve"></a>

**Regular monic sieve.** For the preceding `B`, and a fixed union `U` of residue classes modulo a fixed positive integer `q`, impose squarefree discriminant at every prime, with the restrictions at `p|q` included in `U` (enlarge `q` to include `p²` where needed). Assume the actual resulting local good sets have positive Haar measure at every prime. Then the number of irreducible monic integral polynomials in `D_Y B∩U` with squarefree discriminant is

`vol(B)·ρ_U·Y^(n(n+1)/2)+o_(B,U)(Y^(n(n+1)/2))`, with `ρ_U>0`.

Here `ρ_U` is the actual CRT density at the fixed primes times the product of the remaining monic squarefree-discriminant factors. The local conditions must permit squarefree discriminant; arbitrary ramification or local monogeneity prescriptions need not do so. Every resulting field has Galois group `S_n` by the squarefree-discriminant criterion.

Proof: first count each fixed-modulus coset in the anisotropically expanding `D_Y B` by the lattice estimate, with determinant `Y^(1+⋯+n)`. Approximate `B` from inside and outside by a finite grid of boxes. The large-prime error is bounded by the monic full-box tail because `D_Y B` lies in a fixed multiple of the weighted coefficient box. Take `Y→∞`, then the sieve cutoff `→∞`, then the grid mesh `→0`. Remove the reducible locus using the monic reducibility estimate. These operations require no positive density on a trace-zero slice. Sources: [[105]](#ref-105), Theorems 1.1–1.2 pp.1–3 and Theorems 4.1,4.4 pp.20–23; the region transfer is the lattice-and-tail argument just specified.

*Needs:* [regular monic region](#regular-monic-region), [ArithmeticStatisticsPartIII: monic rational root and reducible count](../ArithmeticStatisticsPartIII/README.md#support-sieves), GeometryOfNumbersAndQuadraticArithmetic §4.1, [squarefree field discriminant sn](#squarefree-field-discriminant-sn).

**Checks.**

- At `n=2` the full weighted box has positive squarefree density, whereas the trace-zero slice `X²+a₂` has discriminant `−4a₂` and density zero.
- A residue condition forcing `p²|Δ` has `ρ_U=0` and is excluded by the positivity hypothesis.
- The dilation determinant is `Y³` in degree two and `Y⁶` in degree three; root separation scales as `cY`, not as `c`.

<a id="separated-generator-multiplicity"></a>

**Separated generator multiplicity.** With `n,c,C` fixed as above, there are `K>0` and `Y₀≥1`, independent of the number field, such that the following holds. If `Y≥Y₀, α` is an integral degree-`n` generator with `O_K=ℤ[α]`, its `n` conjugates divided by `Y` have norms `≤C` and mutual distances `≥c`, and `β∈O_K` has all conjugates of norm `≤CY`, write uniquely `β=Σ_(i=0)^(n−1)m_i α^i, m_i∈ℤ`. Then `|m_i|Y^i≤KY` for every `i`. In particular `m_i=0` for `i≥2` once `Y>K, |m₁|≤K` and `|m₀|≤KY`. Consequently at most `C_B Y` polynomials in `D_Y B` can define any one field, for a constant depending only on `B,n`.

Proof: form the Vandermonde matrix `(z_j^i)` for `z_j=σ_j(α)/Y`. Its determinant has norm at least `c^(n(n−1)/2)`; its cofactors are uniformly bounded in terms of `n,C`. Apply the inverse to the vector `(σ_j(β))` to bound `m_iY^i`. Integer coefficients then kill every `i≥2` for large `Y`. Counting the remaining integer pairs gives `O_B(Y)`, and passing from generators to minimal polynomials can only decrease the count. If one model for the field exists, transport all other generators through a fixed field isomorphism to that model. Squarefree polynomial discriminant supplies `O_K=ℤ[α]` by the index-square identity. This proof uses no uniqueness of reduced bases and no trace normalization; its bound is `O(Y)`, not `O(1)`.

The determinant identity used here is `Matrix.det_vandermonde` and its injectivity criterion `Matrix.det_vandermonde_ne_zero_iff` in `Mathlib.LinearAlgebra.Vandermonde`. The uniform estimate `separated_generator_coefficients` and integral deduction `separated_generator_high_coefficients` follow from the argument above, supplying a replacement for the field-fibre step of [[105]](#ref-105), §5, pp.24–27; they are not attributed to that source's strong-reduction assertion.

*Needs:* [regular monic region](#regular-monic-region), Mathlib `Matrix.det_vandermonde`, `Matrix.det_vandermonde_ne_zero_iff` and matrix inverse, GlobalNumberFields Layer 11 (orders and discriminant/index).

**Checks.**

- For `n=2` there are no coefficients `i≥2`; translations `β=α+m₀` can supply order `Y` generators, so a uniform constant would be false on this full region.
- At `n=3` the polynomial count `Y⁶` divided by `O(Y)` gives `Y⁵`. The claim `m₂=0` requires `Y>K`, not merely `Y≥1`.
- Without root separation the inverse Vandermonde can diverge. Without `O_K=ℤ[α]`, the `m_i` need not be integers and the vanishing deduction fails.

<a id="monogenic-field-lower-bound-target"></a>

**Monogenic field lower bound.** `FieldStatistics.monogenicField_lowerBound` states the discriminant lower bound in every degree and signature, using the pinned `TauCeti.NumberField.IsMonogenic` predicate. `FieldStatistics.monogenicField_shortGenerator_lowerBound` states the short-generator lower bound with monogenicity and squarefree discriminant retained. For every fixed `n≥2`, the number of monogenic `S_n` number fields with squarefree discriminant of absolute value `<X` is `≫_n X^(1/2+1/n)`. Separately, the number having an integral degree-`n` generator with all conjugates of norm `≤Y` is `≫_n Y^((n−1)(n+2)/2)`. Both bounds hold for each fixed signature and each fixed congruence specification satisfying the positivity hypothesis of the regular monic sieve. The constants may depend on those choices.

Proof: count `D_Y B` by the regular monic sieve and divide by the separated-generator multiplicity `C_B Y`. Since `|Δ(f)|≤C'_B Y^(n(n−1))`, choose `Y=(X/(2C'_B))^(1/(n(n−1)))`. The field exponent is `(n(n+1)/2−1)/(n(n−1))=1/2+1/n`. For the generator bound replace `Y` by `Y/C`. These are two consequences of the same full-dimensional regular region, with no use of the trace-restricted sieve or strong-reduction ring-fibre theorem.

*Needs:* [regular monic sieve](#regular-monic-sieve), [separated generator multiplicity](#separated-generator-multiplicity).

([[105]](#ref-105), Corollaries 1.3–1.4 pp.2–3, §5 pp.24–27, endpoint only; the separated-root multiplicity argument above replaces its strong-uniqueness step.)

**Checks.**

- At `n=2` the exponents are 1 and 2; at `n=3` they are `5/6` and 5.
- A local condition forcing a nonsquarefree discriminant does not meet the hypothesis, even if it admits monogenic local orders.
- The stronger discriminant asymptotic below remains a conjecture: an `O(Y)` fibre bound proves a lower bound, not an asymptotic constant.

<a id="monogenic-field-asymptotic-prediction"></a>

**Monogenic field asymptotic prediction.** Formulate the following conjectural proposition. For `n≥3`, BSW Remark5.6 predicts that the monogenic degree-`n` field count is asymptotic to `nC_n/(2ζ(2))X^{1/2+1/n}`, where `C_n` is the `(n−1)`-dimensional volume of the trace-zero coefficient region `|Δ|<1`. It also predicts a positive proportion of trace-band polynomial models have `H=O(X^{1/(n(n−1))})`. These are conjectural predicates: finite volume, cusp control and asymptotic uniqueness modulo `±translation` are proof obligations, not consequences of the lower bound.

Proof: Specify the exact height, monogenic-field family and normalized trace-zero Lebesgue measure. State the two predictions separately and retain the factor `1/2` from generator sign. Import no assertion of the prediction without a proof of cusp control and generator multiplicity.

*Needs:* [monogenic field lower bound target](#monogenic-field-lower-bound-target), [ArithmeticStatisticsPartI: relative density](../ArithmeticStatisticsPartI/README.md#relative-density).

([[105]](#ref-105), Remark5.6,(42),p.26.)

**Checks.**

- The trace-zero quadratic region `|−4a₂|<1` has volume `C₂=1/2`. Substituting `n=2` in the displayed coefficient would give `1/(2ζ(2))`, half the true all-quadratic constant `1/ζ(2)`. Quadratic generator reflection has a stabilizer, so this prediction is restricted to `n≥3`.
- Replacing the specified trace-zero Lebesgue measure by twice that measure doubles `C_n` and the predicted coefficient; the normalization is part of the predicate.
- A lower bound with exponent `1/2+1/n` permits an extra factor `log X`. Such a count would satisfy the lower bound and fail the asserted finite asymptotic ratio, so the lower bound cannot discharge this conjectural predicate.

### 3.34 Binary-form sieves and field multiplicities

<a id="binary-discriminant-local-factors"></a>

**Imported binary local factors.** Use [ArithmeticStatisticsPartII §1.9, binary-density-formulas](../ArithmeticStatisticsPartII/README.md#binary-density-formulas) for `α_n(p)` and `β_n(p)`, including the corrected degree-four factor and the dyadic cases. This part forms their convergent global products and applies them to field counts. The local coefficient enumeration and maximality calculation belong to that supplier.

Source: [[106]](#ref-106), AppendixA, PropositionsA.1–A.2, pp.53–55, with the degree-four correction specified by the supplier.

**Checks.**

- Degree two uses the supplier's separate quadratic-order maximality criterion, including the dyadic case.
- The degree-four odd-prime squarefree factor is the corrected degree-`≥4` factor; no separate quartic local formula is constructed here.
- For `n≥3`, the imported maximality factors have global product `ζ(2)⁻¹ζ(3)⁻¹`; these are the factors used by the field sieve.

<a id="binary-form-sieve-counts"></a>

**Binary form sieve counts.** For degree `n≥2` binary forms in the coefficient box `H(f)<X`, seek squarefree-discriminant density `α_n=∏_p α_n(p)` and maximal-order density `β_n=∏_p β_n(p)`; for `n≥3, β_n=ζ(2)⁻¹ζ(3)⁻¹`. For odd `n≥3` the counts have main terms `α_n(2X)^(n+1)` and `β_n(2X)^(n+1)`, with error `O_(n,ε)(X^(n+1−1/(2n)+ε))`. Degree two uses its separate quadratic tail and finite-modulus sieve. For even `n≥4`, assume the restricted paired-fibre lattice and Gram estimates, a quantitative non-Sn exclusion, and a resulting summed tail with `δ,η>0, ξ≥0, τ=max(η,(η+ξ)/δ)<1` and `(2n+1)τ<n+1`. The fixed-modulus sieve then supplies the corresponding power-saving count with these parameters. The numerical `η_n=1/(88n⁶)` is an additional proposed endpoint, conditional on proving these assumptions with sufficient strength. Finite congruences alter the actual residue factors, and a regular real region alters the real volume.

Proof: Truncate Möbius inversion using the corrected Layer 2 weak/strong tail contract. Count translates of `m²N²ℤ^{n+1}` and sum every boundary error before choosing the cutoff. Apply the corrected local-factor formulas; remove reducible forms by a quantitative estimate. For a region/specific signature prove its Jordan regularity and uniform tail separately.

*Needs:* [ArithmeticStatisticsPartII: binary density formulas](../ArithmeticStatisticsPartII/README.md#binary-density-formulas), [ArithmeticStatisticsPartIII: binary fixed modulus sieve](../ArithmeticStatisticsPartIII/README.md#refinement-binary-fixed-modulus-sieve), [ArithmeticStatisticsPartIII: binary summed tail](../ArithmeticStatisticsPartIII/README.md#refinement-binary-summed-tail).

([[106]](#ref-106), Theorems1–2 and6,pp.2–4; §7,Theorem7.1,pp.51–52.)

**Checks.**

- For odd `n≥3`, recover the exponent `1/(2n)` from the odd summed tail and fixed-modulus sieve.

- At `n=2` use the separate quadratic discriminant rather than an odd-dimensional pencil.

- At even `n≥4` retain `δ,η,ξ` and both inequalities on `τ` in every derived error estimate; the proposed exponent `1/(88n⁶)` is conditional.

- For `n≥3` verify `β_n=ζ(2)⁻¹ζ(3)⁻¹`, and replace local factors by actual CRT residue proportions for coupled finite conditions.

<a id="binary-form-arithmetic-bertini"></a>

**Binary form arithmetic Bertini.** Fix `n≥3`. For odd `n` the density of regular effective degree-`n` hyperplane sections of `P¹_Z` in the binary coefficient-box ordering is `ζ(2)⁻¹ζ(3)⁻¹`. For even `n≥4` the same conclusion assumes the even binary summed-tail hypothesis: there exist `δ,η>0, ξ≥0` with `τ=max(η,(η+ξ)/δ)<1` and `(2n+1)τ<n+1`, and the uniform nonzero-discriminant bound in [ArithmeticStatisticsPartIII: binary summed tail](../ArithmeticStatisticsPartIII/README.md#refinement-binary-summed-tail). The paired-row and restricted Gram estimates are one proposed way to establish that hypothesis; they are not discharged here. No numerical even-degree error exponent is asserted.

Proof: remove the zero-density reducible/singular locus and identify a primitive horizontal section with the finite flat binary-form order. Its regularity is equivalent to the order being maximal. Nonprimitive sections contain a vertical component meeting the horizontal part and are not regular. Apply the maximal-order sieve with exactly the same tail hypotheses as the squarefree sieve; §7 of the source does not give an independent maximality tail. Finally `ζ_(P¹_Z)(s)=ζ(s)ζ(s−1)`, evaluated at `s=3`. Degree two has its separate density and is excluded.

*Needs:* [binary form sieve counts](#binary-form-sieve-counts), [ArithmeticStatisticsPartI: binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), SchemeAndStackFoundations:SF.0.

([[106]](#ref-106), §1 p.3 and Theorem 7.1 pp.51–52.)

**Checks.**

- At `n=3` use the odd tail, with no restricted Gram hypothesis.
- At `n=4` the assertion retains `δ,η,ξ` and both strict inequalities; positivity of `η` alone gives no numerical `1/(88n⁶)` saving.
- The zeta argument is 3 because `P¹_Z` has dimension 2; substituting `s=2` would introduce `ζ(1)` and cannot give this positive density.

<a id="regular-binary-region-sieve"></a>

**Regular binary region sieve.** Fix `n≥3`, a signature, and a bounded open ball `B` in `ℝ^(n+1)` whose closure has nonzero degree-`n` binary discriminant of that signature. Such balls exist by taking a form with distinct real roots and distinct conjugate pairs and then shrinking. Fix a finite congruence specification `U` whose squarefree-discriminant local good sets have positive measure. For odd `n`, the number of irreducible integral `f∈tB∩U` with squarefree discriminant is `vol(B)ρ_U t^(n+1)+o_(B,U)(t^(n+1)), ρ_U>0`. For even `n` this conclusion assumes the same summed-tail hypothesis, with the same `δ,η,ξ,τ` inequalities, as the Bertini target. These constants are fixed independently of `t` and of the auxiliary sieve cutoff `M`.

Proof: finite-modulus counts on `tB` follow from the lattice estimate. Sandwich `B` by finite grids; the nonzero square-divisor multiplicity tail on `tB` is bounded above by that on the containing full box of side `C_B t`. Thus the supplied uniform tail, not openness alone, permits the infinite sieve. Remove reducibles by the coefficient-box exclusion. Discriminant separation fixes the signature and gives `|Δ(f)|≤D_B t^(2n−2)`. Source: [[106]](#ref-106), Theorems 1,6 pp.2–4 and Theorem 7.1 pp.51–52; the region transfer uses the stated domination argument.

*Needs:* [binary form sieve counts](#binary-form-sieve-counts), GeometryOfNumbersAndQuadraticArithmetic §4.1, InverseGaloisAndArithmeticFundamentalGroups:IG.2.

**Checks.**

- `t` scales the discriminant by `t^(2n−2)`, whereas the coefficient volume scales by `t^(n+1)`.
- A ball meeting `Δ=0` lacks the compact regularity required below; a ball about a repeated-root form does not supply this construction.
- A finite congruence forcing `p²|Δ` has zero density and is excluded. Real and imaginary signatures can both have positive real volume.

<a id="binary-invariant-order-fibres"></a>

**Binary invariant-order fibres.** For every `n≥3` and `s≥1` there is a finite `C(n,s)`, independent of the number field and of the order, with the following property. Let `k` be a number field, `S` a finite set containing all infinite places with `s=|S|`, and `O` an `O_S`-order of degree `n` in a field. The irreducible degree-`n` binary forms over `O_S` whose invariant order is `O` up to `O_S`-isomorphism lie in at most `C(n,s) GL₂(O_S)`-equivalence classes when `n` is odd, and at most `C(n,s)h₂(O_S)` when `n` is even. Here `h₂` counts ideal classes of order dividing two. Over `ℤ` put `C_n=C(n,1)`, since `h₂(ℤ)=1`. The action is ordinary change of variables, without identifying arbitrary scalar multiples. This is the uniform-finiteness consequence of [[132]](#ref-132), Theorem 2.1 and Corollary 2.1, pp.5–6. The source's sharper constant `2^(24n³s)` is not needed by any endpoint here.

Proof: use the invariant-order basis already specified in Layer 1. The order fixes the difference ideals of pairs of conjugates. After taking powers to principalize them, cross-ratio pairs `(x,y)` lie in a fixed radical multiplicative subgroup and satisfy `x+y=1`. For `n≥4` its rank is at most `6·binomial(n,2)s−5; n−3` cross ratios determine the projective configuration. The two-variable specialization of the finite-`rank` ESS bound in DiophantineApproximationAndTranscendence §2.4 gives finitely many configurations uniformly in `O`. Galois descent turns equality of configurations into `GL₂(k)` projectivity. The fixed-order integral comparison splits each weak `k`-class into at most `n^s` classes, with the extra `h₂(O_S)` factor in even degree. At `n=3` use the unique projectivity between two ordered root triples directly. These are [[132]](#ref-132), Proposition 5.3 p.31, Lemmas 6.3–6.4 pp.33–37 and Proposition 6.1 pp.32,37. Replacing its sharper two-variable estimate by the already owned ESS bound enlarges `C(n,s)` but preserves the uniformity needed here. No new generic unit-equation theorem or sharper numerical supplier is required.

*Needs:* [ArithmeticStatisticsPartI: binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), GlobalNumberFields (orders, ideals, units), DiophantineApproximationAndTranscendence §2.4 (finite-`rank` two-variable unit bound).

**Checks.**

- Over `ℤ` the even-degree correction is one, but it cannot be omitted for a general `O_S` with `h₂>1`.
- At `n=3` there are no cross ratios to enumerate; the projectivity and integral-class step still applies.
- This bounds `GL₂`-classes, not coefficient vectors in a box; it does not by itself justify dividing a coefficient count by `C_n`.

<a id="compact-binary-transporters"></a>

**Compact binary transporters.** For `n≥3` and a compact `B₀⊂ℝ^(n+1)` with `Δ` nonzero throughout `B₀`, the set of real matrices `g` with `|det g|=1` and `g·B₀∩B₀` nonempty is compact. Therefore there is a constant `T_B` such that every ordinary `GL₂(ℤ)`-orbit meets `tB₀` in at most `T_B` coefficient vectors, uniformly for `t>0`. Combined with binary invariant-order fibres, each squarefree-discriminant field occurs at most `C_n T_B` times in the regular binary region, independently of `t`.

Proof: suppose transporters are unbounded and write `g=k diag(u,u⁻¹)l` with `k,l` orthogonal and `u→∞`. Pass to limits of the orthogonal matrices and the two compact coefficient sequences. Boundedness of `g·f` forces every positive-weight coefficient of `l·f` to vanish at the limit. Thus the limit has a root of multiplicity at least `ceil (n/2)`, which for `n≥3` is at least two; its discriminant vanishes, a contradiction. The transporter is closed by compactness of `B₀` and continuity. Intersect its compact matrix-entry bounds with `GL₂(ℤ)` to get a finite `T_B`. The scalar dilation cancels from `g·(tf)=t(g·f)`. Finally squarefree discriminant makes the invariant order maximal, so the fixed-order theorem applies to `O_K`. This replaces the proposed strong quasi-reduction argument on dilated slices.

*Needs:* [regular binary region sieve](#regular-binary-region-sieve), [binary invariant order fibres](#binary-invariant-order-fibres), `TauCetiRoadmap.OperatorTheory`/PolarDecomposition Part `C`'s existing singular system (real invertible dimension two), GlobalNumberFields (discriminant/index-square identity). This compactness argument is a local supporting target, not an assertion from BSW II Lemma 7.2.

**Checks.**

- For `n=3` the positive weights are 3,1; their vanishing leaves a form divisible by the square of one variable.
- For `n=4` they are 4,2; the remaining middle-weight term is divisible by that variable squared as well.
- At `n=2, xy` has discriminant one and is fixed by `diag(u,u⁻¹)` for every `u>0`. Thus the assertion excludes `n=2`. If `Δ=0, x^n` likewise has a noncompact transporter.

<a id="binary-form-field-lower-bound-target"></a>

**Binary form field lower bound.** `FieldStatistics.binaryFormField_lowerBound` states the odd-degree bound in each signature. For odd `n≥3` there are `≫_n X^((n+1)/(2n−2)) S_n` fields with squarefree discriminant of absolute value `<X`. The same bound holds for even `n≥4` under the even summed-tail hypothesis with `δ,η>0, ξ≥0` and both inequalities on `τ=max(η,(η+ξ)/δ)` from the binary sieve. Each fixed signature and squarefree-compatible positive-measure finite congruence specification has the same exponent.

Proof: count the regular region `tB` by the regular binary sieve and divide by `C_nT_B`, using compact binary transporters and invariant-order fibres. Choose `t=(X/(2D_B))^(1/(2n−2))`; this gives the exponent `(n+1)/(2n−2)`. The squarefree-discriminant criterion supplies `S_n`. No strong reduction, uniqueness of a Minkowski basis, or uniform assertion on a lower-dimensional binary slice is needed.

*Needs:* [regular binary region sieve](#regular-binary-region-sieve), [compact binary transporters](#compact-binary-transporters), [squarefree field discriminant sn](#squarefree-field-discriminant-sn).

([[106]](#ref-106), Theorem 3 p.3, endpoint; [[132]](#ref-132), Corollary 2.1 pp.5–6 supplies the replacement multiplicity route.)

**Checks.**

- At `n=3` the exponent is one; at `n=4` it is `5/6` and the tail hypothesis remains present.
- A bound on integral `GL₂`-classes alone is insufficient: the uniform transporter bound controls representatives inside `tB`.
- The constants may depend on the signature and fixed local data; no uniformity as those conditions vary is claimed.

<a id="squarefree-alternating-extension-transfer"></a>

**Squarefree alternating-extension transfer.** Let `K/ℚ` have degree `n≥3`, group `S_n` and squarefree signed discriminant `d`. The Minkowski bound excludes `d=1`. Its normal closure `L` has a unique quadratic subfield `k=ℚ(√d)`, and `Gal(L/k)=A_n`. Moreover `disc(k)=d` and `L/k` is unramified at every finite prime. If `K` is totally real, `k` and `L` are real and all real places split completely in `L/k`. If `K` has exactly one complex pair, `d<0`, so `k` is imaginary and has no infinite unramifiedness condition. Count pairs `(k,L)` up to `ℚ`-isomorphism, with an `A_n` Galois group but without a chosen labelling of it. At most `2^(n!)` isomorphism classes of `K` map to any one pair.

Proof: use the sign character on the root permutation action to identify `k`. The discriminant of an integral trace pairing is 0 or 1 modulo four; squarefree `d` is therefore odd and 1 modulo four, hence a fundamental quadratic discriminant. At odd ramified primes, discriminant exponent one implies tame inertia generated by one transposition: tame follows since a wild inertia orbit would contribute at least two to the discriminant, and the tame discriminant exponent is the index of its generator. Its intersection with `A_n` is trivial, so relative inertia is trivial. At two, `d` is odd and inertia is trivial already. Complex conjugation is the product of `r₂` disjoint transpositions; `r₂=0` supplies complete splitting over real `k`, while `r₂=1` supplies imaginary `k`. Finally `K` is an index-`n` fixed field in `L`; the number of subgroups of `S_n` is at most the number of subsets, `2^(n!)`, without assuming uniqueness of index-`n` subgroups (including `n=6`). These use the root-action and local-ramification suppliers, not an abelian class-field parametrization for `A_n` when `n≥4`.

*Needs:* PolynomialGaloisGroups Layers 0,2,6 (sign character, fixed fields), LocalFieldsRamification Layer 3 (inertia and discriminant exponents), the pinned Tau Ceti Stickelberger and quadratic-discriminant declarations in Exact supplier contracts, GlobalNumberFields (index-square formula), Mathlib `NumberField.abs_discr_gt_two`. The statistical transfer is local to this package.

The supporting argument is the discriminant, inertia and permutation-group proof just given; [[106]](#ref-106), §1, Theorem4, p.3, records the counting endpoint. The exact arithmetic suppliers and the bound `2^(n!)` are specified above, so the transfer follows from the stated discriminant and inertia arguments.

**Checks.**

- `X³−X−1` is irreducible with `d=−23` and gives an unramified `C₃` extension over `ℚ(√−23)`.
- `X³−4X+1` is irreducible with `d=229` and three real roots; its closure gives an everywhere unramified `C₃` extension over `ℚ(√229)`.
- `X³−2` has discriminant `−108`: its order-three inertia can survive in `A₃`, so squarefreeness cannot be omitted. With two complex pairs, `d>0` but complex conjugation lies nontrivially in `A_n`; the real-place conclusion requires total reality.

<a id="unramified-alternating-extension-lower-bound-target"></a>

**Unramified alternating extension lower bound.** `FieldStatistics.unramifiedAlternatingExtension_lowerBound` states both signed odd-degree bounds on pairs. For odd `n≥3` there are `≫_n X^((n+1)/(2n−2))` pairs `(k,L)` as above with `k` real quadratic and `|disc(k)|<X`, and separately as many with `k` imaginary quadratic. For even `n≥4` both bounds assume the same even binary summed-tail hypothesis, including `δ,η,ξ` and the two `τ` inequalities, as the binary field lower bound. Extensions over real `k` are unramified at finite and infinite places. This counts extensions as the base varies, not distinct base fields.

Proof: apply the signature-specific binary field lower bound with `r₂=0` for the real case and `r₂=1` for the imaginary case. The transfer preserves `|disc(k)|=|disc(K)|`, and dividing by `2^(n!)` preserves the exponent.  Source endpoint: [[106]](#ref-106), Theorem 4 p.3. The explicit normal-closure/inertia argument above supplies the correspondence and the uniform multiplicity and infinity comparison.

*Needs:* [binary form field lower bound](#binary-form-field-lower-bound-target), [squarefree alternating extension transfer](#squarefree-alternating-extension-transfer).

**Checks.**

- At `n=3, A₃=C₃` and the exponent is one in each sign family.
- At `n=4` the exponent `5/6` retains the even tail assumption; the monogenic construction independently gives the weaker unconditional exponent `3/4`.
- Several extensions can have the same quadratic base. The argument gives a lower bound on pairs, not the same lower bound on the number of bases.

### 3.35 All fields of degree at most five

<a id="all-fields-degree-at-most-five"></a>

**All fields degree at most five.** `FieldStatistics.allFields_degree_le_five` states the positive linear asymptotic for the full isomorphism-class count in each of these degrees. For every fixed `n∈{2,3,4,5}` the total degree-`n ℚ`-field count is asymptotic to `c_nX` with `c_n>0`. For degree4 the `D₄` contribution is linear and must be included alongside the imported `S₄` constant; `C₄` and `V₄` contributions are smaller. For degree5 the nonsymmetric transitive groups are lower order. Thus summing `S₄/S₅` asymptotics alone is not a proof of the all-field statement.

Proof: use the imported quadratic/cubic counts and their cyclic remainder bounds. For degree4 add the Cohen–Diaz `y` Diaz–Olivier `D₄` contribution with its tower normalization, then bound the abelian groups. For degree5 use the stronger common nonsymmetric-quintic remainder target: the number of all nonsymmetric quintic fields, including `A₅`, is `o(X)`. Its direct supplier is Bhargava [142], Lemma14 and §3.2, pp.1587–1588; Theorems1 and4, pp.1559–1561, use the same absolute discriminant and `ℚ`-isomorphism convention.

Here is the argument needed from that supplier. A transitive subgroup of `S₅` containing a transposition is `S₅`: the graph of its conjugate transpositions is invariant, its connected components are blocks, and primitivity in prime degree forces this graph to be connected. Thus a nonsymmetric quintic field has no unramified prime of splitting type (1112). In the quadruple-of-alternating-forms parametrization, the coefficient-Haar mass of this type tends to `1/12`. For a fixed finite set of primes, the congruence orbit count [142], Theorem17, p.1585, bounds the count avoiding that type by `C X ∏(1−μ_p(1112))+o(X)`, with `C` independent of the chosen set. The exceptional cusp `a₁₂=0` is `o(X)` by the irreducible cusp estimates, Lemmas8–11, pp.1570–1581. Every maximal quintic order has a sextic resolvent. The finite stabilizer injects into the real isotropy group, whose order is at most120 ([142], Proposition15, pp.1583–1584; weight convention p.1568). Thus counting pairs bounds the unweighted field count by a fixed multiple, without needing a uniform upper bound on the number of resolvents. Take `X→∞` with the finite prime set fixed, and only then enlarge the set: its product tends to zero. This proves the remainder uniformly for every specified collection of proper transitive groups. In particular `D₅` and `C₅⋊C₄` each contribute `o(X)`; no separate numerical exponent for them is needed. Retain the independent cyclic bound as a compatibility check. The earlier-part parametrization and cusp/lattice contracts supply the representation and fixed-congruence counts; this target supplies their nonsymmetric-field sieve application.

*Needs:* [count of quadratic fields](#count-of-quadratic-fields), [davenport heilbronn count of cubic fields](#davenport-heilbronn-count-of-cubic-fields), [bhargava count of quartic fields](#bhargava-count-of-quartic-fields), [bhargava count of quintic fields](#bhargava-count-of-quintic-fields), [cyclic prime field count](#cyclic-prime-field-count), [quadratic tower counting constants](#quadratic-tower-counting-constants).

([[142]](#ref-142), Theorems1,4, pp.1559–1561; Lemma14 and its proof, §3.2, pp.1587–1588; Theorem17, p.1585. [[100]](#ref-100), §7,p.24 gives a later comparison.)

**Checks.**

- For `n=4` include the linear `D₄` contribution alongside `S₄`; an `S₄`-only constant fails the total-field test.
- `D₅` contains a 5-cycle but no transposition; `C₅⋊C₄` also has no cycle type (1112). The local sieve excludes both. `A₅` is also a proper transitive subgroup and is covered by the same bound.
- The finite prime set stays fixed while `X` tends to infinity. A bound whose constant grows with that set cannot replace the displayed fixed-congruence limit.

### 3.36 Cyclotomic towers in degree six

<a id="kluners-cyclotomic-subfamily"></a>

**Kluners cyclotomic subfamily.** `FieldStatistics.kluners_cyclotomic_lowerBound` states the logarithmic lower bound using `FieldStatistics.HasGaloisType`, the transported action on the native embeddings into an algebraic closure. Let `G=C₃≀C₂` in degree6. Its minimum permutation index is2, so `a(G)=1/2` and `b_ℚ(G)=1`. Over `K=ℚ(ζ₃)`, cyclic cubic extensions have count `~c_KY^{1/2}` logY with `c_K>0`. Since `|D_L|=27N_K(D_{L/K})`, these towers contribute `≫X^{1/2}` logX. The cyclic `C₆` and regular `S₃` degree6 families contribute `O_ε(X^{3/8+ε})` for `ε<1/8`, so removing them leaves the same lower order of growth for `G`-fields. This contradicts the original logarithmic exponent, while it does not contradict the weak `X^{1/2+ε}` upper prediction.

Proof: Compute the index and `ℚ`-cyclotomic conjugacy orbit of the two minimum-index classes. Apply Wright’s abelian count over `ℚ(ζ₃)`, where the two classes are no longer joined by cyclotomic action. Use the tower discriminant formula and the finite normalization between embeddings and isomorphism classes. Remove `C₆` and regular `S₃` using the historical Galois bound; retain the logarithmic lower bound.

*Needs:* [malle invariants of a permutation group](#malle-invariants-of-a-permutation-group), [malle conjecture](#malle-conjecture), [galois field three eighths bound](#galois-field-three-eighths-bound), `TauCetiRoadmap.ClassFieldTheory` Layer 13, Completed ArithmeticDirichletSeries Layer 9.

([[107]](#ref-107), §§1–2,pp.1–3.)

**Checks.**

- For `C₃≀C₂, a_ℚ=1/2` and `b_ℚ=1`, but the `ℚ(ζ₃)` subfamily grows as `X^(1/2)log X`. This refutes the strong logarithmic prediction while respecting an `ε`-loss upper bound.

### 3.37 Tame local nonabelian mass

<a id="nonabelian-tame-local-model"></a>

**Nonabelian tame local model.** For a finite embedded type `F` and an odd prime `p∤|F|`, the unramified/tame local mass is `|F|⁻¹` times the sum over `x,y∈F` with xyx `⁻¹=y^p` and `y=1` or `y∈c(F)`, weighted by1 when `y=1` and `p^{-s}` otherwise. It equals `1+N_Fp^{-s}`, where `N_F` is the number of `F`-conjugacy classes in `c(F)`. The finite local-mass identities hold for every embedded type. For the global exponent and prediction require `F` admissible: then `c(F)` is nonempty and `N_F≥1`, and the exponent is the natural number `N_F−1`. The full Malle–Bhargava local model includes separate bad-prime and infinite factors. Its prediction asserts positive constants `c±` for signed arithmetic means asymptotic to `c±(log X)^{N_F−1}`. Inadmissible types have zero arithmetic counts and are outside this prediction; the finite local calculation does not imply the global prediction.

The development requires:

- The normalized finite sum with tame relation and the quadratic discriminant weight, on a finite group with the distinguished homomorphism `π:F→Multiplicative(ZMod 2)`. The finite identities require only odd `p`; primality and `p∤|F|` enter the local-field interpretation.

- For odd `p`, the finite mass is `1+ outsideClassCount(F)p^{-s}`.

- At `s=0` the mass is `1+ outsideClassCount(F)`.

- For admissible `F`, the natural exponent `N_F−1`, with `N_F≥1`.

- An admissible good type has exponent0.

- For admissible `F`, positive signed constants give asymptotics `c±(log X)^{N_F−1}`; this is a predicate, not a proved limit.

Proof: Count `x` for each allowed `y` by its centralizer; since `y²=1` and `p` is odd, the tame relation is commutation. Sum one centralizer contribution per conjugacy class; `y=1` gives1. Factor the good-prime Euler product by `ζ(s)^{N_F}`; local/global compatibility and bad-prime constants remain heuristic except in the explicitly proved elementary-two case.

*Needs:* [embedded quadratic wreath type](#embedded-quadratic-wreath-type), [nonabelian quadratic moment interface](#nonabelian-quadratic-moment-interface), AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32; Completed ArithmeticDirichletSeries Layers 3, 6 and 9.

([[50]](#ref-50), arXiv:1702.04644v2, §6, pp.26–28; Question 6.1, p.28.)

**Checks.**

- For the `C₃` inverse-graph type, the factor is `1+p^{-s}`, with exponent0.

- For the `C₂` inverse-graph type, the factor is `1+2p^{-s}`, with exponent1.

- For `G=1,F=C₂`, the factor is `1+p^{-s}`, not1.

- For `G=1,F=1`, the outside-involution set is empty and the local factor is1. This type is inadmissible and its arithmetic counts vanish; natural subtraction `0−1=0` does not give a positive-constant prediction for it.

### Supporting arithmetic and moment arguments

<a id="support-character-sums"></a>

For quadratic four-ranks prove the Jacobi expansion in each of the six fundamental-discriminant sign/congruence families, including the characters at minus one and two, and the linked-variable estimates with constants depending on the fixed moment `k`. The small/intermediate/large-variable decomposition gives `O_(k,ε)(X(log X)^(-2^(-k)+ε))`; maximal unlinked affine supports give the stated main coefficient. The rank-marginal uniqueness argument uses exponential moments of `p^r`, Gaussian subspace coefficients and a tightness/uniform-tail estimate. It is not an application of a full finite-group law to a sequence for which only rank moments are known. Sources: Fouvry–Klüners, Theorems 1–3 and the Jacobi expansions and linked-variable lemmas cited above; Delaunay–Jouhet, Theorem 5 and proof, pp. 6–8. The limiting rank weights are `p^(-r(r+u))η∞/(η_rη_(r+u))`, including `p=2` and `u=0,1`.

For mixed traces prove that the chosen rn monomials have a nonzero Jacobian on `r` ordered `n`-tuples and that outside its discriminant hypersurface the fibre has degree at most the product of coordinate degrees. Quantitative exclusion and lattice counting then use the small trace-zero generator bound and successive minima. The nonzero Jacobian is a polynomial identity and must be witnessed, not assumed from the number of coordinates. Sources: Lemke Oliver–Thorne, mixed-trace lemmas and the proof of their field-count theorem; the exact numerical ranges are those in the targets above.

For the spin/governing-field application the short real-character-sum conjecture is an explicit hypothesis `C_n` for every `n≥3`, with Koymans–Milović [103], §2.5, pp.6–7, Conjecture C_n and Corollary2.2 p.7, giving its ranges and constants. The corrected finite residue factor comes from [135], Proposition6.1, (6.6)–(6.7), pp.20–21, and Proposition6.2, p.22.

<a id="support-embedded-types"></a>

The embedded type calculation is relative to the fixed permutation representation and distinguished quotient to `C₂`. Prove the outside-involution generation criterion, the diagonal `Aut(G)` orbit relation and its stabilizer multiplicities, and identify the signature character representation used by Cohen–Martinet. Generic Goursat and reduced-multiplier constructions are imported; only this marked wreath and signature specialization is built here. For a good admissible type, its abelianization is `C₂`; for an odd abelian kernel the reduced multiplier has no two-torsion, but its `(q-1)`-torsion need not be trivial. Wood's table includes `C3²` with reduced multiplier `C₃`. Sources: Wood, §§2–3 and Tables 1–2, arXiv:`1702.04644v2`, pp. 4–16 and 33–34; Liu–Wood–Zureick-Brown, §§10–12 for the arithmetic lifting comparison.

<a id="support-marked-type-comparisons"></a>

A marked embedded-type comparison retains the normal subgroup, quotient map, induced automorphism, outside involutions and their generated subgroup, diagonal automorphism orbits and stabilizers. Reduced multipliers retain the chosen central cover and commuting-lift quotient. InductionRestrictionPartII RS.6.4–RS.6.6 supplies the quotient comparison, parity statistics and order `96 A₄` embedding. Finite rows or field totals assume the exact groups, invariant values and complete arithmetic input lists they use; the targets here prove the classification and the 24- and 48-fold rigidification identities, not the lists. Source: Wood [50], arXiv:`1702.04644v2`, Tables 1–2, pp.33–34, Appendix A.1–A.3, pp.35–37.

For the classical and low-degree arithmetic counts use the proof contracts at their targets: primitive indefinite quadratic classes weighted by the positive norm-one regulator; cyclic prime-degree class-field characters divided by `p-1`; fixed-resolvent cubic series with the exceptional `ℚ(√-3)` logarithm; and Baily's weighted quartic multiplicity bound for an arbitrary *specified* resolvent subfamily. The direct character mean supplies the Siegel endpoint, Frei–Loughran–Newton supplies the abelian poles, Cohen–Morra supplies the fixed-resolvent poles, and the quadratic-extension parametrization plus uniform cubic ideal bound supplies the quartic estimate. The fixed-resolvent cubic asymptotic is pointwise in its resolvent; the quartic upper bound is uniform in the cubic field. The unconditional Galois endpoint retains the explicit finite-simple-group requirement above; the fixed-prime-factor Pell lower bound has the direct pattern proof in §3.31. Deduce each partial-summation application before absorbing logarithms into `ε`. A numerical `D₄` specialization assumes the stated inequalities for its convergent Euler products and weighted sums; decimal values are worked illustrations.

The polynomial-to-field lower bounds use the quantified replacements in [regular monic region](#regular-monic-region) through [monogenic field lower bound](#monogenic-field-lower-bound-target), and [regular binary region sieve](#regular-binary-region-sieve) through [binary form field lower bound](#binary-form-field-lower-bound-target). The full monic region has `O(Y)` field fibres; the binary region has uniformly bounded fibres by the invariant-order theorem and compact transporters. Neither route uses the trace-zero quadratic sieve or asymptotic uniqueness of strongly reduced bases. The binary bounds in even degree retain the stated uniform tail hypothesis. The [squarefree alternating extension transfer](#squarefree-alternating-extension-transfer) supplies the normal-closure, finite inertia, infinity and bounded-multiplicity comparisons directly. The monogenic asymptotic remains conjectural and needs its separate volume, cusp and uniqueness inputs. Sources: BSW `I` §5 pp.24–27; BSW II Theorems 3–4 p.3; Bérczes–Evertse–Győry Theorem 2.1 and Corollary 2.1 pp.5–6.
### Examples

The imported PartII quartic residue values give finite Checks: among coefficient tuples modulo9, `42768/59049=176/243` have discriminant nonzero modulo9; modulo4, `384/1024=3/8` have discriminant nonzero modulo4. These test the fixed-degree binary discriminant, including zero leading coefficient.

For a real quadratic field, ordinary and narrow four-ranks need not agree individually; the comparison above is averaged. The fundamental discriminant one is excluded from quadratic fields. At the prime three the order-conductor rank bound includes one possible wild extra dimension, so `3∤f` is essential to the sharper factor.

For `G=C₃≀C₂≤S₆`, an element rotating one block has index two. The quadratic intermediate field `ℚ(ζ₃)` admits two rational cyclotomic conjugacy classes of nontrivial `C₃` elements, producing the extra logarithm. Removing the cyclic `C₆` and regular `S₃` subfamilies preserves the lower bound and refutes the original strong logarithmic prediction, while a factor `log X` is compatible with every `X^ε` upper allowance.

### Dependencies

Layers 0–2 and the finite statistical tools constructed earlier in this layer; ClassFieldTheory, GlobalNumberFields, NumberFieldArithmetic and PolynomialGaloisGroups; GeometryOfNumbersAndQuadraticArithmetic §§0–1, 4.1; GenericDoublePointInterpolation §§1.4, 4.8; IG.2–IG.5; the companion analytic Dirichlet-series and character-sum interfaces; and the marked embedded-type comparisons above. Scalar moment determinacy remains an imported boundary; the discrete group/rank moment estimates are local work.

## Downstream consumers

The later arithmetic-statistics parts use the exact targets supplied here. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. ArithmeticStatisticsPartVI–PartVIII are downstream consumers; AnalyticNumberTheoryPartI §§0–3 and AnalyticNumberTheoryPartII §5 are suppliers.

## References

<a id="ref-1"></a>

[1] Manjul Bhargava and Arul Shankar. [Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves](https://arxiv.org/abs/1006.1002v3). arXiv:1006.1002v3 (latest version), dated 24 December 2013, 36 pp.; published in Annals of Mathematics 181 (2015), 191–242.

<a id="ref-5"></a>

[5] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012), 38 pp.; published in Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-20"></a>

[20] Manjul Bhargava, Arul Shankar and Xiaoheng Wang. [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/abs/1512.03035). arXiv:1512.03035v2 (11 March 2026), 38 pp.

<a id="ref-21"></a>

[21] Melanie Matchett Wood. [Asymptotics for number fields and class groups](https://people.math.harvard.edu/~mmwood/Publications/ArithStats.pdf). In: Directions in Number Theory (Proceedings of the 2014 WIN3 Workshop), Association for Women in Mathematics Series 3, Springer, 2016, 291-339.

<a id="ref-22"></a>

[22] Etienne Fouvry and Juergen Kluners. [On the 4-rank of class groups of quadratic number fields](https://math.uni-paderborn.de/fileadmin-eim/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf). Inventiones Mathematicae 167 (2007), 455-513.

<a id="ref-23"></a>

[23] Juergen Kluners. [A counter example to Malle's conjecture on the asymptotics of discriminants](https://arxiv.org/abs/math/0411486). Comptes Rendus Mathematique 340 (2005), 411-414.

<a id="ref-50"></a>

[50] Melanie Matchett Wood (appendix with Philip Matchett Wood). [Nonabelian Cohen–Lenstra moments](https://arxiv.org/pdf/1702.04644v2). arXiv 1702.04644v2 (13 July 2018).

<a id="ref-54"></a>

[54] Julio C. Andrade and Hwanyup Jung. [Mean value of the class number in function fields revisited](https://link.springer.com/content/pdf/10.1007/s00605-018-1162-2.pdf). Monatshefte für Mathematik187 (2018),577–602, published PDF; DOI10.1007/s00605-018-1162-2. Retrieved2026-10-05..

<a id="ref-90"></a>

[90] Étienne Fouvry and Jürgen Klüners. [On the 4-rank of class groups of quadratic number fields](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf). Author manuscript corresponding to Inventiones Mathematicae 167 (2007), 455–513; manuscript page numbers.

<a id="ref-91"></a>

[91] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport–Heilbronn theorems and second order terms](https://arxiv.org/pdf/1005.0672v3). arXiv:1005.0672v3; manuscript pagination.

<a id="ref-92"></a>

[92] Manjul Bhargava, Arul Shankar and Xiaoheng Wang. [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/pdf/1512.03035v2). arXiv:1512.03035v2 (11 March 2026); manuscript pagination.

<a id="ref-93"></a>

[93] Karim Belabas, Manjul Bhargava and Carl Pomerance. [Error terms for the Davenport–Heilbronn theorems](https://math.dartmouth.edu/~carlp/BBPnew23.pdf). Author manuscript corresponding to Duke Mathematical Journal 153 (2010), 173–210; manuscript pagination.

<a id="ref-94"></a>

[94] Christophe Delaunay and Frédéric Jouhet. [The Cohen–Lenstra heuristics, moments and pʲ-ranks of some groups](https://arxiv.org/pdf/1303.7337). arXiv:1303.7337v1; manuscript pagination.

<a id="ref-95"></a>

[95] Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood. [The average size of 3-torsion in class groups of 2-extensions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf). Forum of Mathematics, Pi 13 (2025), e19; publisher PDF pagination.

<a id="ref-96"></a>

[96] Melanie Matchett Wood; appendix with Philip Matchett Wood. [Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050). Duke Mathematical Journal168 (2019),377–427; published pagination.

<a id="ref-97"></a>

[97] Brandon Alberts. [Cohen–Lenstra moments for some nonabelian groups](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf). Journal de Théorie des Nombres de Bordeaux32(2020),631–664; published pagination.

<a id="ref-98"></a>

[98] Robert J. Lemke Oliver and Frank Thorne. [Upper bounds on number fields of given degree and bounded discriminant](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf). Author manuscript corresponding to Duke Mathematical Journal171(2022),3077–3087; manuscript pagination.

<a id="ref-99"></a>

[99] Manjul Bhargava, Arul Shankar, Takashi Taniguchi, Frank Thorne, Jacob Tsimerman and Yongqiang Zhao. [Bounds on2-torsion in class groups of number fields and integral points on elliptic curves](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf). Author manuscript dated18February2017; manuscript pagination.

<a id="ref-100"></a>

[100] Manjul Bhargava. [Galois groups of random integer polynomials and van der Waerden’s conjecture](https://arxiv.org/pdf/2111.06507v3). arXiv:2111.06507v3; manuscript pagination.

<a id="ref-101"></a>

[101] Wolfgang M. Schmidt. [Number fields of given degree and bounded discriminant](https://www.numdam.org/article/AST_1995__228__189_0.pdf). Astérisque228(1995),189–195.

<a id="ref-102"></a>

[102] Jordan S. Ellenberg and Akshay Venkatesh. [The number of extensions of a number field with fixed degree and bounded discriminant](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf). Annals of Mathematics163(2006),723–741.

<a id="ref-103"></a>

[103] Peter Koymans and Djordjo Milovic. [Joint distribution of spins](https://arxiv.org/pdf/1809.09597v1). arXiv:1809.09597v1, 2018; manuscript pagination.

<a id="ref-104"></a>

[104] Peter Koymans and Carlo Pagano. [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424). arXiv:2201.13424v1, 2022; manuscript pagination.

<a id="ref-105"></a>

[105] Manjul Bhargava, Arul Shankar and Xiaoheng Wang. [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3). arXiv:1611.09806v3, corresponding to Inventiones228(2022),1037–1073; manuscript pagination.

<a id="ref-106"></a>

[106] Manjul Bhargava, Arul Shankar and Xiaoheng Wang. [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf). Forum of Mathematics,Pi13(2025),e17; publisher PDF pagination.

<a id="ref-107"></a>

[107] Jürgen Klüners. [A counter example to Malle’s conjecture on the asymptotics of discriminants](https://arxiv.org/pdf/math/0411486v1). arXiv:math/0411486v1, 2004; manuscript pagination.

<a id="ref-108"></a>

[108] Manjul Bhargava and Ariel Shnidman. [On the number of cubic orders of bounded discriminant having automorphism group C₃, and related problems](https://msp.org/ant/2014/8-1/ant-v8-n1-p03-s.pdf). Published Algebra & Number Theory 8 (2014), 53–88; journal page numbers.

<a id="ref-109"></a>

[109] Henri Cohen and Anna Morra. [Counting cubic extensions with given quadratic resolvent](https://arxiv.org/pdf/1003.1869v1). arXiv:1003.1869v1, submitted 9 March 2010 (PDF title-page date 12 November 2018); manuscript page numbers.

<a id="ref-132"></a>

[132] Attila Bérczes, Jan-Hendrik Evertse, Kálmán Győry. [On the number of equivalence classes of binary forms of given degree and given discriminant](https://arxiv.org/pdf/math/0312234v1). arXiv:math/0312234v1, 11 December 2003. Locators use the printed preprint pages: Theorem 2.1 and Corollary 2.1 pp.5–6; Proposition 5.3 p.31 and §6 pp.32–37.

<a id="ref-134"></a>

[134] Nils Bruin and Brett Hemenway. [On congruent primes and class numbers of imaginary quadratic fields](https://www.impan.pl/shop/publication/transaction/download/product/83557). Acta Arithmetica159(2013),63–87.

<a id="ref-135"></a>

[135] Peter Koymans and Djordjo Milović. [Spins of prime ideals and the negative Pell equation x²−2py²=−1](https://arxiv.org/pdf/1611.10337v3). arXiv:1611.10337v3,30 April2018; manuscript pagination.

<a id="ref-136"></a>

[136] Jürgen Klüners and Gunter Malle. [Counting nilpotent Galois extensions](https://arxiv.org/pdf/math/0112318). arXiv:math/0112318; manuscript pagination.

<a id="ref-137"></a>

[137] Dorian Goldfeld and Jeffrey Hoffstein. [Eisenstein series of 1/2-integral weight and the mean value of real Dirichlet L-series](https://www.math.columbia.edu/~goldfeld/Goldfeld-Hoffstein1985.pdf). Inventiones Mathematicae80(1985),185–208.

<a id="ref-138"></a>

[138] Franz Lemmermeyer. [Unramified quaternion extensions of quadratic number fields](https://www.numdam.org/item/JTNB_1997__9_1_51_0.pdf). Journal de Théorie des Nombres de Bordeaux9(1997),51–68.

<a id="ref-139"></a>

[139] Étienne Fouvry and Jürgen Klüners. [On the negative Pell equation](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p13-p.pdf). Annals of Mathematics172(2010),2035–2104.

<a id="ref-140"></a>

[140] Maria Chiara Brambilla and Giorgio Ottaviani. [On the Alexander–Hirschowitz theorem](https://arxiv.org/pdf/math/0701409v2). arXiv:math/0701409v2, 10 September 2007; manuscript pages.

<a id="ref-141"></a>

[141] Christopher Frei, Daniel Loughran and Rachel Newton. [The Hasse norm principle for abelian extensions](https://centaur.reading.ac.uk/60488/1/HNP_final.pdf). Accepted manuscript, 46 pages; manuscript pagination. Only the counting theorem1.7 and its proof in §§2–4 are used here.

<a id="ref-142"></a>

[142] Manjul Bhargava. [The density of discriminants of quintic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf). Annals of Mathematics172(2010),1559–1591; journal pagination.

<a id="ref-143"></a>

[143] Henri Cohen and Frank Thorne. [Dirichlet series associated to quartic fields with given cubic resolvent](https://people.math.sc.edu/thornef/papers/CT-quartic.pdf). Author manuscript, arXiv:1302.5728; manuscript pagination. The parametrization and square-norm ideal calculation, not its later explicit Dirichlet-series formulas, are used here.

<a id="ref-144"></a>

[144] Boris Datskovsky and David J. Wright. [The adelic zeta function associated to the space of binary cubic forms. II: Local theory](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0367?tify=%7B%22pages%22:%5B33%5D%7D). Journal für die reine und angewandte Mathematik 367 (1986), 27–75. Theorem3.1 and its proof, pp.42–45; global Euler identity Theorem6.1, p.68.

<a id="ref-145"></a>

[145] Robert C. Rhoades. [2-Selmer groups and the Birch–Swinnerton-Dyer conjecture for the congruent number curve](https://arxiv.org/abs/0706.4344v1). arXiv:0706.4344v1 (2007). Theorem2.7, p.7, finite odd-graph probabilities; Theorem4.1, p.11, prime-pattern distribution. The direct pattern proof in §3.31 supplies the latter independently of its cited Cremona–Odoni proof.
