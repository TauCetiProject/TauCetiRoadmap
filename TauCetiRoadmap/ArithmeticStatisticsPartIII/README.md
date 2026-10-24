# Roadmap: arithmetic statistics, Part III: uniform orbit counts and sieves

**Summary.** Count the integral representations with finite congruences and prove the cuspidal and large-prime estimates needed for infinitely many local conditions. The even-degree binary sieve and the number-field three-isogeny count retain their explicit quantitative supplier hypotheses. The headline signatures include `Counting.hypersurface_local_density`.

## Scope and ownership

This is Part III of the eight-part arithmetic-statistics roadmap. It owns Layer 2: uniform integral orbit counts, cusp estimates, finite-congruence asymptotics, discriminant tails and their infinite sieves. ArithmeticStatisticsPartI Layer 0 supplies the family, height, invariant and local-condition interfaces; ArithmeticStatisticsPartII Layer 1 supplies the integral orbit dictionaries and discriminant-preserving lifts. Parts IV–VIII use these counts as downstream inputs.

The boundaries fix the carriers and prevent parallel versions of existing mathematics.

- PolynomialGaloisGroups Layers 0, 2 and 4 supply the root-permutation action and static integral resolvents. InverseGaloisAndArithmeticFundamentalGroups §§IG.0–IG.2 supply specialization and quantitative Hilbert irreducibility. The anisotropic weighted-box exclusion and its uniform rectangular curve estimate are targets here.
- GlobalNumberFields Layers 0–3 and 11 supply places, ideal classes, units, ideal lattices, order classes and discriminant/index-square identities. GeometryOfNumbersAndQuadraticArithmetic Layers 0–4 supply primitive-vector saturation, successive minima and bounded semialgebraic lattice counts. The new estimates use skew, truncated and averaged arithmetic regions, with the cusp and divisor-multiplicity errors retained.
- For number fields, AdelicAlgebraicGroups Layers 0–4 supply adelic Haar measures, quotient integration, arithmetic reduction and fundamental multisets. The function-field lattice and reduction branch is owned in §2.10. The representation-specific Jacobians, cusp estimates and the `SL₂` Tamagawa value in the local [mass and assembly target](#cubic-mass-and-assembly) are targets here.
- SchemeAndStackFoundations Layers 0–3,5 supply scheme dimension, finite presentation, spreading and projective intersection theory. DeligneWeightsAndPurity §1.6 supplies the curve Weil bound. The degree-uniform smooth-hypersurface estimate and its statistical local-density application are targets here.
- AbelianSchemesAndArithmeticModuli §§`A3`.1–`A3`.6 supply isogenies, finite-flat kernels and duality; SelmerIwasawaCohomology §2.12a supplies local Kummer maps. The three-isogeny count keeps the actual Kummer images, integral multiplicities and the explicit windowed counting hypothesis in every abelian dimension.
- AnalyticNumberTheoryPartI Layers 0–3 and AnalyticNumberTheoryPartII Layer 5 supply the analytic estimates identified below. Their cubic representation, projective algebra equivalence and weighted coefficients are reused with the stated sign and lattice adapters.

## Conventions

All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in `x`-degree, and changes of variables use row vectors. Cubics use the determinant-twisted `GL2` action; quartics use either the ordinary `GL2` action for integral orbit enumeration or the determinant-to-the-minus-two action of `PGL2` for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=-12`, `J=0`, `Δ=-256`; this fixes the sign. With `E:y²=x³+Ax+B`, `(I,J)=(-3A,-27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The `p`-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Every arithmetic conjecture is a proposition, not an axiom or an unconditional distribution theorem. Distribution convergence does not imply convergence of unbounded moments. Fixed-`q` degree limits, fixed-degree large-`q` limits and iterated `liminf/limsup` limits are kept distinct. Selmer dimension, `p`-`infinity` Selmer corank and Mordell–Weil rank are distinguished; passing from corank to rank requires the stated condition on the divisible part of Sha. A degree-one Picard-scheme point, an actual degree-one divisor, and a point over an odd-degree extension are compared only under the explicit Brauer/local-solubility hypotheses.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib's `Northcott` and `Northcott.comp_of_finite_fibers` for finite height fibres; finite sets and quotient/orbit types; `Polynomial.discr`, resultants, separability and `Squarefree`; `ClassGroup` and `NumberField.discr`; `p`-adic fields and integers; Haar measures, integrals, filters, infinite sums and products; matrices, ranks, subspaces and Smith normal form. `Polynomial.resultant_eq_zero_iff` is used over a field, and `Polynomial.card_roots'` bounds roots by natural degree. The finite-field hypersurface estimate is `MvPolynomial.schwartz_zippel_totalDegree` for a nonzero polynomial. `hensels_lemma` in `Mathlib.NumberTheory.Padics.Hensel` supplies the simple-root `p`-adic lifting step.

`Chebyshev.eventually_primeCounting_le` in `Mathlib.NumberTheory.Chebyshev` states that, for every `ε>0`, eventually `π(⌊x⌋)≤(log 4+ε)x/log x`. The all-range bound here uses `Chebyshev.theta_le_log4_mul_x` and `Chebyshev.theta_eq_sum_primesLE`; weighted prime tails follow by partial summation.

`ModularGroup.fd`, `ModularGroup.fdo`, `ModularGroup.exists_smul_mem_fd` and `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` are in `Mathlib.NumberTheory.Modular`. Tau Ceti's `ModularGroup.isFundamentalDomain_fdo` and `ModularGroup.volume_fd_lt_top`, in `TauCeti.NumberTheory.Modular`, give the effective `PSL₂` fundamental-domain statement and finite area. The exact area and its `GL₂/PGL₂` Haar-coordinate comparisons are the targets below. Use Mathlib's `UpperHalfPlane.volume_eq_lintegral` for its density, `Real.hasDerivAt_arcsin` and `intervalIntegral.integral_deriv_eq_sub` for the area integral, and `riemannZeta_two` for the `zeta` normalization. `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` is applied on measurable charts with the injectivity and differentiability hypotheses of its change-of-variables theorem; orbit multiplicities are retained when the charts are assembled.

### From GlobalNumberFields and GeometryOfNumbersAndQuadraticArithmetic

GlobalNumberFields Layer 0 fixes the normalized places and product formula; Layers 2–3 supply finite ideal-class charts, units and the Minkowski ideal-lattice/coset dictionary, including its fixed norm and covolume conventions; Layer 11 supplies orders, Picard groups, trace duals, ideal norms and discriminant/index-square identities. GeometryOfNumbersAndQuadraticArithmetic Layers 0–3 supply saturation, primitive minors and successive-minimum/covolume bounds. Its §4.1, Davenport semialgebraic count, supplies a bounded region of bounded complexity with translates, projections and multiset multiplicity. Neither supplies the moving arithmetic cusp bounds asserted here.

OperatorTheory, PolarDecomposition Part `C`, targets PD-`C09`–PD-`C18` supply right and left singular vectors and reconstruction. Its invertible real two-dimensional specialization gives `g=k diag(u,u⁻¹)l`, `u≥1`, for `|det g|=1`, with orthogonal `k,l`. This is the compact-transporter input; the real embedding-metric and restricted-basis Gram estimates here retain their own arithmetic hypotheses.

### From AdelicAlgebraicGroups

For number fields, Layers 0–4 supply the restricted-product Haar measure, adelic points, quotient integration, invariant differential/Tamagawa normalization, arithmetic reduction and central-isogeny measure comparison. Only AA.0 is used unchanged for function fields; their reduction and lattice estimates are targets in §2.10. In particular §§2.2–2.4 and §3.4 supply the quotient and fundamental-multiset integrals used in the windowed cubic count. Finite volume does not assert volume one: [Local mass and assembly](#cubic-mass-and-assembly) includes the separate `SL₂` volume theorem with its full number-field and differential normalization.

### From SchemeAndStackFoundations and AlgebraicCurves

SchemeAndStackFoundations Layers 0–3,5 supply dimension and projection closures, finite irreducible decomposition, finite-presentation spreading after clearing denominators, and projective intersection/degree and hyperplane-family interfaces. AlgebraicCurves Layers 2 and 12 supply finite normalization and the regular-projective-model/scheme comparison. SchemeAndStackFoundations §5.12, `bezout_inequality`, supplies Bézout. The plane-curve genus and singular-point comparison are local targets in §2.13. At a rational place `P` with uniformizer `t`, Tau Ceti’s `TauCeti.Place.powerSeriesExpansion`, `TauCeti.Place.mem_filtration_iff_coeff_powerSeriesExpansion_eq_zero` and `TauCeti.Place.completionIntegersEquivPowerSeries` supply local expansions, with hypotheses `P.degree=1` and `P.ord t=1` (modules `TauCeti.FieldTheory.FunctionField.Place.Expansion.PowerSeries` and `.Completion`). DeligneWeightsAndPurity §1.6 supplies `|#C(F_(q^m))−(q^m+1)|≤2gq^(m/2)` for smooth proper geometrically connected curves. These inputs support the local degree-uniform Lang–Weil induction; no smoothness of the whole hypersurface is assumed.

### From abelian-isogeny and specialization roadmaps

AbelianSchemesAndArithmeticModuli §§`A3`.1–`A3`.6 supply isogenies, finite-flat quotients, Cartier-dual kernels and `theta` groups. SelmerIwasawaCohomology §2.12a supplies the local Kummer maps. Both are used with the degree-three isogeny of arbitrary-dimensional abelian varieties and its actual local images. InverseGaloisAndArithmeticFundamentalGroups §§IG.0–IG.2 supply finite embedding problems and specialization; PolynomialGaloisGroups Layers 0, 2 and 4 supply root actions, integral orbit resolvents and generic separation. The weighted anisotropic exclusion is proved here, rather than inferred from qualitative specialization.

### From the analytic-number-theory parts

AnalyticNumberTheoryPartI §3.26 supplies `τ(n)≪_ε n^ε` for every positive integer `n`, with the constant retained at small inputs; §3.22 supplies `Σ_(n≤Y)τ(n)=O(Y log Y)`. Its §§3.3–3.4 and §3.27 supply ideal-coefficient and fixed-degree ideal-count bounds; Layer 0 supplies prime selection, and Layer 3 supplies multiplicative sums and partial summation for the weighted sieve. Completed ArithmeticDirichletSeries Layer 3 supplies `EulerProductData`; Layer 6 supplies `perronFormula` and `continuedLFunctionOfWeight`; Layer 9 supplies `wienerIkehara` with its `LSeriesHasSum`, nonnegative coefficient/residue and continuous boundary remainder hypotheses. The arithmetic residue and boundary verification are application targets here or in the cited denominator owner. AutomorphicLFunctionsAndLocalFactors §AL.0, **Vector-space Poisson comparison and compact-uniform estimates**, supplies the additive adelic Fourier/Poisson interface used in the `SL₂` volume argument, with the required absolute sums and integrability.

AnalyticNumberTheoryPartII supplies the [binary-cubic action and discriminant][AN-II-1] (§5.4), [projective cubic-algebra equivalence][AN-II-2] (§5.5), [finite weighted cubic coefficients][AN-II-3] (§5.6), [uniform small-degree field bound][AN-II-4] (§5.7), [cubic continuation and residues][AN-II-5] (§5.21), [pole-aware cubic convexity][AN-II-6] (§5.28), and [quadratic large sieve and real-character moment][AN-II-7] (§5.29). The projective equivalence includes nonprincipal rank-two modules, stabilizers and determinant-line discriminants; the free-lattice counting adapters retain these inputs. The source-specific local selectors, secondary densities, sieve estimates and statistical applications are targets here.

### From earlier arithmetic-statistics parts

ArithmeticStatisticsPartI, **Strong weak discriminant**, supplies `Coefficients.StrongSquareDivides` and `Coefficients.WeakSquareDivides`, their partition and coefficient-residue invariance; §2.1 here extends the exponent and proves derivative and binary splitting-type criteria. ArithmeticStatisticsPartII, **Supporting descent and integral realization**, supplies `Cubic.normalizedDisc`, its homogeneity and ordinary-discriminant comparison, and **Three-isogeny mirror dictionary** with the actual Kummer images, local integral representatives and rational/integral stabilizer mass identity. The counting charts and adelic multiplicity assembly here specialize those objects.

From ArithmeticStatisticsPartI require [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2], [ArithmeticStatisticsPartI, refinement binary discriminant][AS-I-3], [ArithmeticStatisticsPartI, refinement symmetric pencil][AS-I-4], [ArithmeticStatisticsPartI, family defined by local conditions][AS-I-5], [ArithmeticStatisticsPartI, stabilizer weighted orbit count][AS-I-6], [ArithmeticStatisticsPartI, twist denominator frontier][AS-I-7], [ArithmeticStatisticsPartI, binary cubic forms and the twisted action][AS-I-8]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartII require [ArithmeticStatisticsPartII, stabilizer of a binary quartic is two torsion][AS-II-1], [ArithmeticStatisticsPartII, embedding into pairs of ternary quadratic forms][AS-II-2], [ArithmeticStatisticsPartII, fibres of the embedding are uniformly bounded][AS-II-3], [ArithmeticStatisticsPartII, binary quartic parametrization of e mod 2e][AS-II-4], [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5], [ArithmeticStatisticsPartII, pairs of ternary quadratic forms][AS-II-6], [ArithmeticStatisticsPartII, bhargava parametrization of quartic rings][AS-II-7], [ArithmeticStatisticsPartII, quartic ring and cubic resolvent][AS-II-8], [ArithmeticStatisticsPartII, existence and number of cubic resolvents][AS-II-9], [ArithmeticStatisticsPartII, maximality of quartic rings at p][AS-II-10], [ArithmeticStatisticsPartII, quadruples of quinary alternating forms][AS-II-11], [ArithmeticStatisticsPartII, bhargava parametrization of quintic rings][AS-II-12], [ArithmeticStatisticsPartII, maximality of quintic rings at p][AS-II-13], [ArithmeticStatisticsPartII, refinement one matrix slice][AS-II-14], [ArithmeticStatisticsPartII, refinement marked q][AS-II-15], [ArithmeticStatisticsPartII, refinement q discriminant divisibility][AS-II-16], [ArithmeticStatisticsPartII, refinement weak lift odd][AS-II-17], [ArithmeticStatisticsPartII, refinement even weak lift][AS-II-18], [ArithmeticStatisticsPartII, refinement q hyperdeterminant][AS-II-19], [ArithmeticStatisticsPartII, refinement integral pencil orbits][AS-II-20], [ArithmeticStatisticsPartII, ternary cubic forms and their invariants][AS-II-21], [ArithmeticStatisticsPartII, invariance of ternary cubic invariants][AS-II-22], [ArithmeticStatisticsPartII, refinement genus one stabilizer schemes][AS-II-23]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

## How to read the build

The mathematical specification is this README; `Suggested.lean` states headline counting, tail and sieve theorems on the pinned carriers, with the simple definitions needed to express them. The sections below state every target with its hypotheses, source locator, API and Checks. Definitions requiring new arithmetic or geometric carriers are README targets. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

The quartic dependency order starts with maximal-order suborders and items 2–4 of the class-group/conductor inputs (quadratic characters, quadratic genus and reducible étale algebras). These supply the fixed-resolvent bound and the reducible-resolvent discard in Lemma 12, then the §2.8 finite congruence count and maximal-field upper counts. The noncyclic cubic mass sum (item 1) follows that finite count and supplies the overramified tail. The §2.8 nonmaximal tail and the separate non-`S4` field estimate supply quartic-field transport before §2.5 weak transport and its sieve. The fixed-resolvent bound precedes its large-stabilizer consumer in §2.3. The function-field constructions at the start of §2.10 precede all three global-field counts. The degree-two monic weak tail precedes the summed monic tail; the row-spanning and paired-fibre contracts precede every conditional even-degree estimate.

## Layer 2: Uniform orbit counts and sieves

Start with compact semialgebraic counts and then average arithmetic fundamental domains, preserving multiplicities and stabilizers. A finite-congruence asymptotic and a uniform large-prime tail are separate assertions. Only after both are proved may finite truncations converge to an infinite Euler product. Summed square-divisor tails count a divisor multiplicity and require more than an estimate for the union of bad loci.

### 2.1 Geometric sieves and prime tails

<a id="chebyshev-bounds-for-prime-sums"></a>

**Chebyshev bounds for prime sums.** (a) There is an absolute constant `C` such that `π(x) ≤ C·x/log x` for every real `x ≥ 2`, where `π(x)` is the number of primes `p ≤ x`. (b) For every real `s > 1` there is a constant `C_s` such that `Σ_{p prime, p > N} p^{−s} ≤ C_s·N^{1−s}/log N` for every real `N ≥ 2`. (c) Consequently, for every integer `k ≥ 2` there is `C_k` with `Σ_{p prime, M < p ≤ r} r^n/p^k ≤ C_k·r^n/(M^{k−1} log M)` for all reals `2 ≤ M ≤ r` and every `n ≥ 0`.

`x, N, M ≥ 2` so that the logarithms are positive; the sums run over rational primes The constants are absolute `(C)` or depend only on `s (C_s)` or `k (C_k)`; in particular they are independent of `N, M, r` and `n`

For the proof, (a) Split the primes `p ≤ x` at `√x`. Every prime in `(√x, x]` has `log p > (1/2) log x`, so `π(x) − π(√x) ≤ 2θ(x)/log x ≤ 2 log 4 · x/log x` by Chebyshev's bound `θ(x) ≤ (log 4)x` (`Chebyshev.theta_le_log4_mul_x`, with `θ` written as a sum over primes by `Chebyshev.theta_eq_sum_primesLE`); and `π(√x) ≤ √x ≤ 2x/log x` for `x ≥ 2`. (b) Decompose `(N, ∞)` into dyadic blocks `(2^j N, 2^{j+1} N], j ≥ 0`. By (a) the block contains at most `C·2^{j+1}N/log(2^{j+1}N) ≤ 2C·2^j N/log N` primes, each contributing at most `(2^j N)^{−s}`. Summing the geometric series `Σ_j 2^{j(1−s)} = (1 − 2^{1−s})^{−1}` gives `C_s = 2C/(1 − 2^{1−s})`. (c) is (b) with `s = k`, multiplied by `r^n`, after dropping the upper limit `r`.

*Needs:* `Chebyshev.theta_le_log4_mul_x` (Mathlib), `Chebyshev.theta_eq_sum_primesLE` (Mathlib), `Nat.Prime` (Mathlib).

([[1]](#ref-1), Proof of Theorem 2.20, printed p. 18; [[19]](#ref-19), Proof of Theorem 3.3, display (16), p. 12.)

**Checks.**

- Order check: the bounds are exactly what the proofs of Bhargava-Shankar Theorem 2.20 (`O(X^{1/6}/log X)` primes below `X^{1/6}` and `Σ_{p > X^{1/6}} p^{−2} = O(1/(X^{1/6} log X))`) and of the geometric sieve (16) use; the trivial bound `Σ_{p > N} p^{−2} ≤ 1/(N − 1)` would lose the logarithm and make the error term in Theorem 2.20 of the same order `X^{5/6}` as the main term.

- At `s=1` the prime reciprocal series diverges, so the strict hypothesis `s>1` is essential; at `k=2` the weighted tail is `O(r^n/(M log M))`.

- Numerical sanity check: `π(10^6) = 78498 ≤ 2 log 4 · 10^6/log 10^6 + 10^3` `≈ 201,700`.

<a id="lattice-points-on-a-subvariety-in-a-dilated-region"></a>

**Lattice points on a subvariety in a dilated region.** Let `B ⊂ ℝ^n` be a compact set and let `Y ⊆ 𝔸^n_ℚ` be a Zariski-closed subset of codimension `≥ k ≥ 1`, i.e. `Y = V(𝔞)` for an ideal `𝔞 ⊆ ℚ[x_1, …, x_n]` with Krull dimension of `ℚ[x_1, …, x_n]/𝔞` at most `n − k`. Then there is a constant `C = C(B, Y)` such that `#{a ∈ rB ∩ ℤ^n : a ∈ Y(ℚ)} ≤ C·r^{n−k}` for every real `r ≥ 1`.

`B` compact (the source says 'compact region having finite measure'; only boundedness is used) `r ≥ 1`: for `0 < r < 1` the left side can be 1 (the origin) while `r^{n−k} → 0` The constant depends on `B` and `Y` only, not on `r`

For the proof, Work with reduced closed subsets and sum over finitely many irreducible components. For an integral `Y` of dimension `d ≤ n−k`, prove the `O(r^d)` bound by lexicographic induction on `(d,n)`; the empty variety contributes zero and a zero-dimensional variety has finitely many rational points. Let `pi` forget the last coordinate and `Z` be the Zariski closure of `pi(Y)`. Since its coordinate ring is generated over that of `Z` by one element, `dim Z` is `d` or `d−1`. If `dim Z=d−1`, the closed inclusion `Y ⊂ Z×A¹` of integral varieties of equal dimension is equality. Apply induction to `Z` and multiply by the `O(r)` choices of the last coordinate. If `dim Z=d`, the last coordinate is algebraic over `Frac(Q[Z])`. Clearing denominators gives `f` in `I(Y)`, viewed as a polynomial in `x_n`, whose leading coefficient `h` is nonzero on `Z`. For `b` with `h(b)≠0`, there are at most `deg_{x_n} f` rational roots above `b`. Induction on the smaller ambient dimension bounds the number of `b` in `pi(rB)∩Z(Q)∩Z^{n−1}` by `O(r^d)`. The exceptional closed subset `Y∩V(h)` has dimension at most `d−1`. Apply the induction hypothesis in the same ambient space but smaller dimension to obtain `O(r^{d−1})` points, hence `O(r^d)` for `r≥1`. The projection/dimension and finite-decomposition interfaces are requested from SchemeAndStackFoundations Layer 0; no unsupported resultant replacement is used.

*Needs:* SchemeAndStackFoundations Layer 0, `Polynomial.card_roots'` (Mathlib), `MvPolynomial` (Mathlib).

([[19]](#ref-19), Section 3.1, Lemma 3.1, p. 10; [[19]](#ref-19), Proof of Lemma 3.1, pp. 10-11.)

**Checks.**

- Degree-one case: for `Y` the coordinate subspace `x_1 = ⋯ = x_k = 0` and `B = [−1, 1]^n` the count is `(2⌊r⌋ + 1)^{n−k}`, so the exponent `n − k` cannot be lowered in general (the source's Remark 3.2).

- The count for `Y = {x_1^2 + ⋯ + x_n^2 = 0}` (codimension 1 over `ℚ`, but with the single rational point 0) is `1 = O(r^{n−1})`, consistent with the lemma.

- `k = n`: a zero-dimensional `Y` has `O(1)` points in `rB` for every `r ≥ 1`.

- Regression for the printed elimination step: in coordinates `(x,y,w,z)`, take `f1=xz−y, f2=xz−w, f3=xz−y−w`. The `z`-axis `Y` is a codimension-three component of `V(f1,f2,f3)`. The replacements `Res_z(f1,f3)=−xw` and `Res_z(f2,f3)=−xy` yield a zero set containing the plane `x=0,y=−w`, so `Y` is no longer a component. Nonzero Bezout coefficients need not be nonzero on `Y`.

<a id="uniform-bound-for-points-of-a-subscheme-modulo-p"></a>

**Uniform bound for points of a subscheme modulo p.** Let `Y = Spec ℤ[x_1, …, x_n]/𝔞` be a closed subscheme of `𝔸^n_ℤ` of codimension `≥ k`, i.e. the Krull dimension of `ℤ[x_1, …, x_n]/𝔞` is at most `n + 1 − k`. Then there are constants `M_0 = M_0(Y)` and `C = C(Y)` such that `#Y(𝔽_p) = #{a ∈ 𝔽_p^n : g(a) = 0 for all g ∈ 𝔞} ≤ C·p^{n−k}` for every prime `p > M_0`.

The codimension is taken in `𝔸^n_ℤ`, which has dimension `n + 1`; a vertical fibre `𝔸^n_{𝔽_{p_0}}` has codimension 1, so it is excluded for `k ≥ 2` Only primes `p > M_0` are covered; for the finitely many `p ≤ M_0` the trivial bound `#Y(𝔽_p) ≤ p^n` is used by the consumers

For the proof, The generic fibre has dimension `d≤n−k`; if it is empty, a nonzero integer lies in the defining ideal and all sufficiently large-prime fibres are empty. Remove nilpotents and decompose the generic fibre into finitely many integral components. Use the projection-closure induction of lattice-points-on-a-subvariety-in-a-dilated-region. Spread the finitely many component inclusions, polynomial relations, cylinder equalities and exceptional closed subsets to `Z[1/N]` by clearing denominators. Covering the reduced generic fibre by these finitely many components gives a covering on fibres outside finitely many primes after clearing the corresponding radical-ideal containments. This needs the explicitly requested finite-presentation spreading interface, not merely nonvanishing of each polynomial modulo `p`. Induct lexicographically on (generic dimension, ambient dimension). In the cylinder case `Y=Z×A¹` multiply the bound for `Z(F_p)` by `p`. In the generically finite case, outside the nonvanishing leading coefficient `h` each fibre of the coordinate projection has at most `deg_{x_n} f` points by `Polynomial.card_roots'`. Apply induction to the projection closure `Z` and to the exceptional `Y∩V(h)`, whose generic dimension is smaller. Choose `M_0` larger than the finitely many excluded primes and all induction thresholds. There are finitely many strata and fixed polynomial degrees, so summing gives one constant `C` independent of `p`. For a hypersurface this reduces to `MvPolynomial.schwartz_zippel_totalDegree`.

*Needs:* [lattice points on a subvariety in a dilated region](#lattice-points-on-a-subvariety-in-a-dilated-region), SchemeAndStackFoundations Layer 0, `Polynomial.card_roots'` (Mathlib), `MvPolynomial.schwartz_zippel_totalDegree` (Mathlib).

([[19]](#ref-19), Proof of Theorem 3.3, pp. 11-12; [[19]](#ref-19), Proof of Theorem 3.3, p. 12.)

**Checks.**

- `Y = V(x_1, …, x_k)`: `#Y(𝔽_p) = p^{n−k}` exactly, for every `p`.

- `Y = V(p_0)` for a fixed prime `p_0` has codimension 1 in `𝔸^n_ℤ`, and `#Y(𝔽_{p_0}) = p_0^n`: this is why only `p > M_0` is claimed and why the codimension is taken in `𝔸^n_ℤ`.

- For `Y = V(Δ, ∂Δ/∂e)` on binary quartic forms (codimension 2 by [discriminant loci of codimension two](#discriminant-loci-of-codimension-two)) the lemma gives `#Y(𝔽_p) = O(p^3)`, consistent with the splitting-type description of strongly divisible forms, in which the types `(1^3 1), (1^2 1^2)` and `(2^2)` each contribute a constant times `p^3` residue classes.

<a id="geometric-sieve-small-primes"></a>

**Geometric sieve small primes.** Let `B ⊂ ℝ^n` be compact and `Y ⊆ 𝔸^n_ℤ` a closed subscheme of codimension `k ≥ 2`. There is `C = C(B, Y)` such that for all reals `r ≥ 1` and `M ≥ 2, #{(a, p) : a ∈ rB ∩ ℤ^n, p prime, M < p ≤ r, a mod p ∈ Y(𝔽_p)} ≤ C·r^n/(M^{k−1} log M)`.

`k ≥ 2` (for `k = 1` the prime sum `Σ 1/p` diverges) Pairs `(a, p)` are counted, so a point reducing into `Y` modulo several primes counts several times

For the proof, Fix a prime `p ≤ r`. Cover `rB` by `O((r/p)^n)` cubes of side `p` (possible because `p ≤ r` and `B` is bounded). Each cube contains at most `#Y(𝔽_p)` integral points reducing into `Y(𝔽_p)`, and `#Y(𝔽_p) ≤ C p^{n−k}` for `p > M_0` by [uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p); for the finitely many `p ≤ M_0` use `#Y(𝔽_p) ≤ p^n` and absorb them into the constant (they occur only when `M < M_0`, and then `1 ≤ M_0^{k−1} log M_0/(M^{k−1} log M)`). So each prime contributes `O(r^n/p^k)`, and `Σ_{M < p ≤ r} r^n/p^k = O(r^n/(M^{k−1} log M))` by part (c) of [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums).

*Needs:* [uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p), [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums).

([[19]](#ref-19), Proof of Theorem 3.3, display (16), p. 12.)

**Checks.**

- For `Y=V(x_1,x_2)` and `B=[0,1]²` the pair count is `Σ_{M<p≤r}(floor(r/p)+1)² ≤ 4r² Σ_{p>M}p^{−2}`. There is no uniform two-sided comparison with the full tail: at `M=r` the pair count is zero while that tail is positive.

- Removing the logarithm from Chebyshev's bound would give only `O(r^n/M^{k−1})`, which is still enough for Bhargava-Shankar Theorem 2.13 but not for the stated (13).

<a id="geometric-sieve-large-primes"></a>

**Geometric sieve large primes.** Let `B ⊂ ℝ^n` be compact and let `Y ⊆ 𝔸^n_ℤ` be a closed subscheme of codimension `k ≥ 1` (Krull dimension of its coordinate ring `≤ n + 1 − k`). There is `C = C(B, Y)` such that for every real `r ≥ 1, #{(a, p) : a ∈ rB ∩ ℤ^n, p prime, p > r, a ∉ Y(ℤ), a mod p ∈ Y(𝔽_p)} ≤ C·r^{n−k+1}`.

Points of `Y(ℤ)` are excluded here and counted separately by [lattice points on a subvariety in a dilated region](#lattice-points-on-a-subvariety-in-a-dilated-region) The primes are larger than the linear size `r` of the region

For the proof, After discarding finitely many primes, the reduction of `Y` is covered by the reductions of closures of its finitely many integral generic-fibre components. Each has dimension `d≤n−k`. An integral point outside `Y` lies outside every such closure. The finitely many discarded primes with `p>r` contribute a bounded quantity: `r` is then bounded and `B` is bounded. Prove `O(r^{d+1})` for each integral component by induction on ambient dimension. Use the actual projection closure `Z` in `A^{n−1}`. If `dim Z=d−1, Y=Z×A¹`; after spreading this equality away from finitely many primes, outside-`Y` pairs are outside-`Z` pairs in the first coordinates, times `O(r)` last coordinates. Induction gives `O(r^d)·O(r)`. If `dim Z=d`, select `f` in `I(Y)` of positive `x_n`-degree with leading coefficient `h` nonzero on `Z`. The exceptional projection locus `Z∩V(h)` has dimension at most `d−1`. Use fixed finite integral generators of `I(Y)`; for any a outside `Y` some generator has a nonzero value bounded in absolute value by `C r^D`. Such a value has `O(1)` distinct prime divisors `>r`, with the constant depending on `C,D`; treat `1≤r≤2` separately. It need not have at most `D` such primes. Split pairs in the generically finite case. First, `b=pi(a)∈Z(Z)`: the lattice-point bound gives `O(r^d)` possibilities for `b`, then `O(r)` last coordinates and `O(1)` primes from a nonzero generator. Second, `b∉Z(Z)` but `h(b)=0 mod p`: induction for `Z∩V(h)` gives `O(r^d)` pairs `(b,p)`, times `O(r)` last coordinates. Third, `b∉Z(Z)` and `h(b)≠0 mod p`: induction for `Z` gives `O(r^{d+1})` pairs `(b,p)`, and `f(b,x_n)` has at most `deg f` roots `mod p`. Each residue class has `O(1)` representatives in the last-coordinate interval of length `O(r)`, since `p>r`. Sum the three contributions and the finitely many exceptional primes. Since `r≥1` and `d≤n−k`, this is `O(r^{n−k+1})`.

*Needs:* [lattice points on a subvariety in a dilated region](#lattice-points-on-a-subvariety-in-a-dilated-region), [uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p), `Polynomial.card_roots'` (Mathlib), SchemeAndStackFoundations Layer 0.

([[19]](#ref-19), Proof of Theorem 3.3, display (17) and the decomposition (18)-(21), p. 12; [[19]](#ref-19), Proof of Theorem 3.3, bound for the set (21), p. 13.)

**Checks.**

- For `Y′ = V(x_1, x_2) ⊂ 𝔸^2` and `B = [−1, 1]^2` the set counted is empty: a prime `p > r` dividing `a_1` and `a_2` with `|a_i| ≤ r` forces `a = 0 ∈ Y′(ℤ)`.

- For `Y′ = V(x_1, x_2^2 − 2x_3^2) ⊂ 𝔸^3 (n = 3, k = 2)` the set (19) consists of the pairs `(a, p)` with `a_1 = 0, a_2^2 − 2a_3^2 ≠ 0` and `p > r` a prime divisor of `a_2^2 − 2a_3^2`; each nonzero value is `O(r^2)`, so it has `O(1)` such primes (the `O(r²)` constant does not imply at most one), and the set has at most `O(r^2) = O(r^{n−k+1})` elements, the order of the lemma.

<a id="quantitative-ekedahl-geometric-sieve"></a>

**Quantitative ekedahl geometric sieve.** Let `B ⊂ ℝ^n` be a compact set and let `Y ⊆ 𝔸^n_ℤ` be a closed subscheme of codimension `k ≥ 1` (Krull dimension of its coordinate ring `≤ n + 1 − k`). Then there is a constant `C = C(B, Y)` such that for all reals `r ≥ 1` and `M ≥ 2, #{a ∈ rB ∩ ℤ^n : a mod p ∈ Y(𝔽_p) for some prime p > M} ≤ C·(r^n/(M^{k−1} log M) + r^{n−k+1})`.

`Counting.quantitative_ekedahl_sieve` states this estimate on Mathlib’s coordinate ideals and Krull dimension, retaining the arbitrary compact coefficient region.

`r ≥ 1` and `M ≥ 2` The content is for `k ≥ 2`; for `k = 1` the right side is of order `r^n` and the statement is trivial The region is a fixed compact set dilated by `r`; Bhargava's Theorem 3.5 (diagonal `SL_n`-transforms of `rB`) is a variant not needed by the consumers here

For the proof, For `k=1` use the trivial `O(r^n)` bound. For `k≥2`, apply the following three bounds directly to `Y`; the two sieve lemmas already handle its components and finitely many exceptional primes. Points of `Y(ℤ)` in `rB`: `O(r^{n−k})` by [lattice points on a subvariety in a dilated region](#lattice-points-on-a-subvariety-in-a-dilated-region). Points `a ∉ Y(ℤ)` reducing into `Y(𝔽_p)` for some `p` with `M < p ≤ r`: `O(r^n/(M^{k−1} log M))` by [geometric sieve small primes](#geometric-sieve-small-primes). Points `a ∉ Y(ℤ)` reducing into `Y(𝔽_p)` for some `p > max(M, r)`: `O(r^{n−k+1})` by [geometric sieve large primes](#geometric-sieve-large-primes) (a point is counted at most once per prime, and the count of pairs bounds the count of points). Sum the three bounds.

*Needs:* [lattice points on a subvariety in a dilated region](#lattice-points-on-a-subvariety-in-a-dilated-region), [geometric sieve small primes](#geometric-sieve-small-primes), [geometric sieve large primes](#geometric-sieve-large-primes).

([[19]](#ref-19), Section 3.2, Theorem 3.3, p. 11; [[1]](#ref-1), Section 2.6, Theorem 2.17, printed p. 17.)

**Checks.**

- Bhargava-Shankar apply it with `n = 5, k = 2, r = X^{1/6}` to `Y = V(Δ, ∂Δ/∂e)` on binary quartic forms and obtain `O(X^{5/6}/(M log M) + X^{2/3})` (their Theorem 2.18); the cubic analogue has `n = 4, k = 2, r = X^{1/4}`, giving `O(X/(M log M) + X^{3/4})`.

- Ekedahl's qualitative statement is the limit form: `lim_{M→∞} lim sup_{r→∞} r^{−n}·#{…} = 0` for `k ≥ 2`.

- For `k = 2` and `Y = V(x_1, x_2)`, the left side counts points with a prime `p > M` dividing `gcd(a_1, a_2)`; its density is `1 − ∏_{p > M}(1 − p^{−2}) ≍ 1/(M log M)`, so the first term is sharp.

<a id="strongly-and-weakly-divisible-values"></a>

**Strongly and weakly divisible values.** Extend ArithmeticStatisticsPartI’s [Strong weak discriminant][AS-I-9] from exponent two to every `j≥1`. Let `f ∈ ℤ[x_1, …, x_n]`, `a ∈ ℤ^n`, `p` a prime and `j ≥ 1`. For this extension, `f` is strongly a multiple of `p^j` at a if `f(a′) ≡ 0 (mod p^j)` for every `a′ ∈ ℤ^n` with `a′ ≡ a (mod p)`; it is weakly a multiple of `p^j` at a if `p^j | f(a)` but `f` is not strongly a multiple of `p^j` at a. For binary quartic forms `V_ℤ ≅ ℤ^5` (coefficients `(a, b, c, d, e)` of `ax^4 + bx^3y + cx^2y^2 + dxy^3 + ey^4`) with the discriminant `Δ = (4I^3 − J^2)/27` of [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], put `W_p(V) := {f ∈ V_ℤ : p^2 | Δ(f)}, W_p^(1)(V) := {f : Δ is strongly a multiple of p^2 at f}` (equivalently `p^2 | Δ(f + pg)` for every `g ∈ V_ℤ`) and `W_p^(2)(V) := W_p(V) \ W_p^(1)(V)`. For binary cubic forms `U_ℤ ≅ ℤ^4` (coefficients `(a, b, c, d)` of `ax^3 + bx^2y + cxy^2 + dy^3`) with `Disc = b^2c^2 − 4ac^3 − 4b^3d − 27a^2d^2 + 18abcd`, put `W_p(U), W_p^(1)(U), W_p^(2)(U)` in the same way.

`p` is a rational prime; the definitions make sense for every `p`, but the splitting-type descriptions below hold only for `p ≥ 3` Strong divisibility depends only on a `mod p`; weak divisibility of `p^2` depends on a `mod p^2` For `j = 1` there are no weak multiples: `f(a′) ≡ f(a) (mod p)` for `a′ ≡ a (mod p)`

The required API is:

- `StronglyDvdAt`: At `j=2` reuse ArithmeticStatisticsPartI’s `Coefficients.StrongSquareDivides`; at general `j` the predicate '`f` is strongly a multiple of `p^j` at a': `∀ a′ ≡ a (mod p), p^j | f(a′)`.

- `WeaklyDvdAt`: At `j=2` reuse ArithmeticStatisticsPartI’s `Coefficients.WeakSquareDivides`; at general `j` the predicate '`p^j | f(a)` and not StronglyDvdAt'.

- `stronglyDvdAt_two_iff`: StronglyDvdAt `f p 2 a ↔` `p^2 | f(a)` `∧ ∀ i, p | ∂f/∂x_i(a)`.

- `stronglyDvdAt_congr`: `a ≡ a′ (mod p) →` (StronglyDvdAt `f p j a ↔` StronglyDvdAt `f p j a′`).

- `weaklyDvdAt_of_not_dvd_pderiv`: `p^2 | f(a)` and `p ∤ ∂f/∂x_i(a)` for some `i` imply WeaklyDvdAt `f p 2` a.

- `stronglyDvdAt_one_iff`: StronglyDvdAt `f p 1 a ↔ p | f(a)` (no weak multiples of `p`).

- `quarticW_smul`: `γ ∈ GL_2(ℤ)`: `γ·f ∈ W_p(V) ↔ f ∈ W_p(V)`, and likewise for `W_p^(1)(V), W_p^(2)(V), W_p(U), W_p^(1)(U), W_p^(2)(U)`.

- `quarticW1_iff_splittingType`: For `p ≥ 3`: `f ∈ W_p^(1)(V)` iff `f ∈ pV_ℤ` or `f mod p` has splitting type `(1^3 1), (1^2 1^2), (2^2)` or `(1^4)`.

- `cubicW1_iff_tripleRoot`: For `p ≥ 3`: `f ∈ W_p^(1)(U)` iff `f ∈ pU_ℤ` or `f mod p` has a triple root in `ℙ^1(𝔽_p)`.

For the proof, The predicates are decidable conditions on residue classes: strong divisibility quantifies over the finitely many `a′ mod p^j` with `a′ ≡ a (mod p)`. For `j = 2`, Taylor expansion `f(a + pb) ≡ f(a) + p Σ_i b_i ∂f/∂x_i(a) (mod p^2)` (MvPolynomial.pderiv) shows: `f` is strongly a multiple of `p^2` at a iff `p^2 | f(a)` and `p | ∂f/∂x_i(a)` for every `i`. `GL_2(ℤ)`-invariance of `W_p, W_p^(1), W_p^(2)` on `V_ℤ` and `U_ℤ`: `Δ(γ·f) = Δ(f)` (resp. `Disc(γ·f) = Disc(f)`) for `γ ∈ GL_2(ℤ)` because `det γ = ±1` and the weights are even, and `γ·(f + pg) = γ·f + p(γ·g)` with `γ·g` integral.

*Needs:* [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], `MvPolynomial` (Mathlib), `MvPolynomial.pderiv` (Mathlib), `Nat.Prime` (Mathlib).

([[19]](#ref-19), Section 3.3, (23)-(24), p. 13; [[1]](#ref-1), Section 2.6, the sets W_p^(1)(V) and W_p^(2)(V), printed p. 17.)

**Checks.**

- For `p = 5` and `f = 25x^4 + x^2y^2 + y^4 ∈ V_ℤ`: `Δ(f) = 3920400 = 25·156816, ∂Δ/∂a(f) ≢ 0 (mod 5)` so `f ∈ W_5^(2)(V)`, and yet `5 | ∂Δ/∂e(f)`. A definition of `W_p^(2)(V)` as `{p^2 | Δ, p ∤ ∂Δ/∂e}` would wrongly exclude `f`.

- `f = x^3y + 5y^4` has `Δ(f) = −675 = −27·25`, and `f ∈ W_5^(1)(V)`: `f mod 5 = x^3y` has splitting type `(1^3 1)`.

- For `j = 1` every a with `p | f(a)` is a strong multiple: StronglyDvdAt `f p 1 a ↔ p ∣ f(a)`.

- For `p = 5` the cubic form `f = 25x^3 + xy^2 + y^3` has `Disc(f) = −25·679` and `∂Disc/∂a(f) = −4 − 54·25 ≢ 0 (mod 5)`, so `f ∈ W_5^(2)(U)`.

- The splitting-type description fails at `p = 2`: the form `x^2y^2 + xy^3 = xy^2(x + y)` lies in `W_2^(1)(V)` (`4 | Δ(f + 2g)` for every `g`), although its reduction `mod 2` has splitting type `(1^2 1 1)`.

- Every `f ∈ pV_ℤ` lies in `W_p^(1)(V)`, since `Δ` is homogeneous of degree 6 and `Δ(pg) = p^6 Δ(g)`.

- The source's example: the characteristic function of the forms with squarefree discriminant is the complement of the union of the `W_p`.

- The splitting-type description of `W_p^(1)(V)` (for `p ≥ 3`) and of `W_p^(1)(U)` (for `p ≥ 3`) was checked by enumerating all residue classes for `p = 3, 5, 7`; for `p = 2` it fails (six classes each).

<a id="strong-divisibility-lies-on-a-codimension-two-locus"></a>

**Strong divisibility lies on a codimension two locus.** Let `f ∈ ℤ[x_1, …, x_n]` and let `Y_f ⊆ 𝔸^n_ℤ` be the closed subscheme `V(f, ∂f/∂x_n)`. (a) For every prime `p` and every `a ∈ ℤ^n` at which `f` is strongly a multiple of `p^2`, a `mod p ∈ Y_f(𝔽_p)`. (b) If `f` is primitive (the `gcd` of its coefficients is 1) and `f` and `∂f/∂x_n` have no common factor of positive degree in `ℚ[x_1, …, x_n]`, then `Y_f` has codimension at least 2 (possibly empty) in `𝔸^n_ℤ`.

In (b) the hypothesis is coprimality of `f` and `∂f/∂x_n` over `ℚ`; the source assumes `f` irreducible and nonconstant in `x_n`, which implies it Primitivity excludes vertical components: if every coefficient of `f` were divisible by `p_0`, the whole fibre over `p_0` would lie in `Y_f`

For the proof, (a) Taylor: `f(a + p t e_n) ≡ f(a) + p t ∂f/∂x_n(a) (mod p^2)` for `t ∈ ℤ`. Strong divisibility gives `p^2 | f(a + p t e_n)` for all `t`, hence `p | f(a)` and `p | ∂f/∂x_n(a)`. (b) Horizontal part: coprimality in `ℚ[x]` makes `V(f, ∂f/∂x_n) ⊆ 𝔸^n_ℚ` of dimension `≤ n − 2`, so the closure in `𝔸^n_ℤ` has dimension `≤ n − 1`. Vertical part: over a prime `p_0, f mod p_0` is a nonzero polynomial by primitivity, so the fibre of `Y_f` over `p_0` lies in the hypersurface `V(f mod p_0)` of dimension `n − 1`. Hence `dim Y_f ≤ n − 1 = (n + 1) − 2`.

*Needs:* [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), `MvPolynomial.pderiv` (Mathlib), `MvPolynomial` (Mathlib).

([[19]](#ref-19), Section 3.3, Lemma 3.6 and the paragraph before it, p. 14; [[1]](#ref-1), Section 2.6, after Theorem 2.18, printed p. 18.)

**Checks.**

- Bhargava-Shankar's `Y`: for `f = Δ` on binary quartic forms and `x_n = e, Y_Δ = V(Δ, ∂Δ/∂e) ⊆ 𝔸^5_ℤ` has codimension 2 ([discriminant loci of codimension two](#discriminant-loci-of-codimension-two)).

- The converse of (a) fails: the weakly divisible form `25x^4 + x^2y^2 + y^4` at `p = 5` reduces into `Y_Δ(𝔽_5)`. Consumers therefore bound the larger set `{a : a mod p ∈ Y_f(𝔽_p)}`, which is what the geometric sieve counts.

- Without primitivity (b) fails: `f = 3x_1 x_2` has `Y_f ⊇ V(3)`, a component of codimension 1 in `𝔸^2_ℤ`.

- The conclusion is codimension at least two: `f=x_n` has derivative 1 and `Y_f` is empty. Exact codimension two would be false without an additional nonemptiness hypothesis.

<a id="discriminant-loci-of-codimension-two"></a>

**Discriminant loci of codimension two.** (a) The binary quartic discriminant `Δ(a, b, c, d, e) = (4I^3 − J^2)/27 ∈ ℤ[a, b, c, d, e]` is primitive, has degree 3 in `e` with leading coefficient `256a^3`, and `Δ` and `∂Δ/∂e` have no common factor of positive degree in `ℚ[a, b, c, d, e]`. (b) The binary cubic discriminant `Disc(a, b, c, d) = b^2c^2 − 4ac^3 − 4b^3d − 27a^2d^2 + 18abcd ∈ ℤ[a, b, c, d]` is primitive, has degree 2 in `d` with leading coefficient `−27a^2`, and `Disc` and `∂Disc/∂d` have no common factor of positive degree in `ℚ[a, b, c, d]`. (c) Consequently `Y_4 := V(Δ, ∂Δ/∂e) ⊆ 𝔸^5_ℤ` and `Y_3 := V(Disc, ∂Disc/∂d) ⊆ 𝔸^4_ℤ` have codimension 2.

The polynomials are those of [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1] `(Δ)` and of the Delone-Faddeev normalisation `(Disc)`

For the proof, Primitivity: `Δ` contains `256a^3e^3` and `−27a^2d^4`, and `gcd(256, 27) = 1`; `Disc` contains `b^2c^2` with coefficient 1. No common factor free of `e`: the `e`-coefficients of `Δ` have `gcd 1` in `ℚ[a, b, c, d]`, since the leading one is `256a^3` and the constant term is `Δ(a, b, c, d, 0) = d^2·Disc(a, b, c, d)`, which is not divisible by a (it contains `b^2c^2d^2`). Likewise the `d`-coefficients of `Disc, −27a^2` and `b^2c^2 − 4ac^3`, are coprime. No common factor involving `e`: the resultant `Res_e(Δ, ∂Δ/∂e) ∈ ℚ[a, b, c, d]` is nonzero because its specialisation at `(a, b, c, d) = (1, 0, 0, 1)` is `Res_e(256e^3 − 27, 768e^2) ≠ 0` (`e = 0` is not a root of `256e^3 − 27`); by `Polynomial.resultant_eq_zero_iff` over the field `ℚ(a, b, c, d)` and Gauss's lemma, `Δ` and `∂Δ/∂e` are coprime. For `Disc` specialise `(a, b, c) = (1, 0, 1)`: `Res_d(−4 − 27d^2, −54d) ≠ 0`. (c) follows from (a), (b) and part (b) of [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus).

*Needs:* [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus), `Polynomial.resultant` (Mathlib), `Polynomial.resultant_eq_zero_iff` (Mathlib).

([[1]](#ref-1), Section 2.6, after Theorem 2.18, printed p. 18; [[19]](#ref-19), Proof of Lemma 3.6, p. 14.)

**Checks.**

- Independent check: a computer-algebra `gcd` gives `gcd(Δ, ∂Δ/∂e) = 1` and `gcd(Disc, ∂Disc/∂d) = 1` over `ℚ`; both discriminants are moreover irreducible over `ℚ`, which is not needed.

- `deg_e Δ = 3`, so `∂Δ/∂e` has degree 2 in `e`.

<a id="local-density-of-values-divisible-by-p-squared"></a>

**Local density of values divisible by p squared.** Let `f ∈ ℤ[x_1, …, x_n]` be primitive and coprime to `∂f/∂x_n` in `ℚ[x_1, …, x_n]`. There is `C = C(f)` such that for every prime `p, #{v ∈ (ℤ/p^2ℤ)^n : f(v) ≡ 0 (mod p^2)} ≤ C·p^{2n−2}`; equivalently, the Haar measure (total mass 1) of `{v ∈ ℤ_p^n : p^2 | f(v)}` is at most `C·p^{−2}`.

Applies to `f = Δ` on `V (n = 5)` and `f = Disc` on `U (n = 4)` by [discriminant loci of codimension two](#discriminant-loci-of-codimension-two) The bound is uniform in `p`; the constant depends only on `f`

For the proof, Group the classes `v mod p^2` by `a = v mod p` with `p | f(a)`. Classes with `a ∈ Y_f(𝔽_p)` (`p | ∂f/∂x_n(a)` as well): there are at most `C p^{n−2}` such a for `p > M_0` ([uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p), `Y_f` of codimension 2 by [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus)), each with `p^n` lifts, giving at most `C p^{2n−2}`; the primes `p ≤ M_0` are absorbed into `C`. Classes with `p ∤ ∂f/∂x_n(a)`: there are at most `deg(f)·p^{n−1}` such a, since `f mod p` is a nonzero polynomial by primitivity `(MvPolynomial.schwartz_zippel_totalDegree)`. For each, `f(a + pb) ≡ f(a) + p Σ_i b_i ∂f/∂x_i(a) (mod p^2)` is an affine condition on `b mod p` whose `b_n`-coefficient is a unit, so exactly `p^{n−1}` of the `p^n` lifts satisfy `p^2 | f`; this gives at most `deg(f)·p^{2n−2}`. Divide by `p^{2n}` for the measure statement (the set is a union of classes `mod p^2` in `ℤ_p^n`).

*Needs:* [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus), [uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p), `MvPolynomial.schwartz_zippel_totalDegree` (Mathlib), `PadicInt` (Mathlib).

([[1]](#ref-1), Proof of Theorem 2.21, display (43), printed p. 19.)

**Checks.**

- For `n = 1` and `f = x` the density is exactly `p^{−2}`.

- For `f = Δ` this is the bound (43) of Bhargava-Shankar, `1 − ∫φ_p ≤ ∫_{p^2 | Δ} df ≪ p^{−2}`, which the source takes from Poonen's paper; the proof here needs only the codimension-two locus and Schwartz-Zippel.

- The bound implies the convergence of `∏_p (1 − μ_p(p^2 | f))` and hence of the Euler products in the sieve theorems.

### 2.2 Real quartic orbits and fundamental sets

<a id="real-root-types-of-binary-quartic-forms"></a>

**Real root types of binary quartic forms.** Let `V_ℝ` be the space of real binary quartic forms `f = ax^4 + bx^3y + cx^2y^2 + dxy^3 + ey^4` with the discriminant `Δ` of [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1]. For `f` with `Δ(f) ≠ 0` the roots of `f` in `ℙ^1(ℂ)` are four distinct points permuted by complex conjugation; let `r(f) ∈ {0, 2, 4}` be the number of real ones (a root at `[1 : 0]` when `a = 0` included). For `i = 0, 1, 2` put `V_ℝ^(i) := {f : Δ(f) ≠ 0, r(f) = 4 − 2i}`; `V_ℝ^(2+)` (resp. `V_ℝ^(2−)`) is the set of positive (resp. negative) definite forms, `f(x, y) > 0` (resp. `< 0`) for all `(x, y) ≠ (0, 0)`, so `V_ℝ^(2) = V_ℝ^(2+) ⊔ V_ℝ^(2−)`. The index set is `T := {0, 1, 2+, 2−}`. For `i ∈ T` put `V_ℤ^(i) := V_ℝ^(i) ∩ V_ℤ`.

Only forms with `Δ ≠ 0` lie in any locus The loci are defined for the standard action `f ↦ f((x, y)γ)` of `GL_2(ℝ)`, which preserves them

The required API is:

- `QuarticRealType`: The four-element index type `T = {0, 1, 2+, 2−}`.

- `quarticLocus`: quarticLocus `i ⊆ V_ℝ`, the locus `V_ℝ^(i)`.

- `mem_quarticLocus_iff_realRoots`: For `i ∈ {0, 1}`: `f ∈ V_ℝ^(i) ↔ Δ(f) ≠ 0 ∧ r(f) = 4 − 2i`; `f ∈ V_ℝ^(2±) ↔ Δ(f) ≠ 0 ∧ ±f > 0` on `ℝ^2 \ {0}`.

- `disc_pos_of_mem_quarticLocus`: `Δ > 0` on `V_ℝ^(0), V_ℝ^(2+), V_ℝ^(2−)` and `Δ < 0` on `V_ℝ^(1)`.

- `iUnion_quarticLocus`: The loci are pairwise disjoint with union {`f` : `Δ(f) ≠ 0`}.

- `isOpen_quarticLocus`: Each `V_ℝ^(i)` is open in `V_ℝ ≅ ℝ^5`.

- `smul_mem_quarticLocus_iff`: For `γ ∈ GL_2(ℝ)`: `γ·f ∈ V_ℝ^(i) ↔ f ∈ V_ℝ^(i)` (standard action).

- `neg_mem_quarticLocus_twoPos_iff`: `−f ∈ V_ℝ^(2−) ↔ f ∈ V_ℝ^(2+)`.

- `intQuarticLocus`: `V_ℤ^(i) := {f ∈ V_ℤ : (f : V_ℝ) ∈ V_ℝ^(i)}`.

For the proof, The real roots are counted on `ℙ^1(ℝ)`: the number of real roots of `f(x, 1)` (Polynomial.roots over `ℝ`) plus 1 when `a = 0`. Definiteness: a real binary quartic with `Δ ≠ 0` and no real root takes one sign on `ℝ^2 \ {0}` (connectedness), so `V_ℝ^(2)` splits into the two definite loci.

*Needs:* [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], `MvPolynomial.IsHomogeneous` (Mathlib).

([[1]](#ref-1), Section 2.1, printed p. 8.)

**Checks.**

- `x^3y − xy^3 ∈ V_ℝ^(0)` and `Δ(x^3y − xy^3) = 4`.

- `x^3y + xy^3 ∈ V_ℝ^(1)` and `Δ(x^3y + xy^3) = −4`.

- `x^4 + y^4 ∈ V_ℝ^(2+), −x^4 − y^4 ∈ V_ℝ^(2−)`, and `Δ(x^4 + y^4) = 256`.

- `x^3y − xy^3` and `x^4 + y^4` both have `Δ > 0` but lie in different loci, so the loci are not determined by the sign of `Δ`.

- `x^2y^2 (Δ = 0)` lies in no `V_ℝ^(i)`.

- `x^3y − xy^3 = xy(x − y)(x + y) ∈ V_ℝ^(0)` with `Δ = 4`; `x^3y + xy^3 = xy(x^2 + y^2) ∈ V_ℝ^(1)` with `Δ = −4`; `x^4 + y^4 ∈ V_ℝ^(2+)` with `Δ = 256`.

- The sign of `Δ` does not separate `V_ℝ^(0)` from `V_ℝ^(2)`: both have `Δ > 0`.

<a id="real-orbits-of-binary-quartic-forms-with-fixed-invariants"></a>

**Real orbits of binary quartic forms with fixed invariants.** Let `(I_0, J_0) ∈ ℝ^2` with `4I_0^3 − J_0^2 ≠ 0`. (a) If `4I_0^3 − J_0^2 < 0`, the forms `f ∈ V_ℝ` with `(I(f), J(f)) = (I_0, J_0)` form exactly one `SL_2^±(ℝ)`-orbit, and it lies in `V_ℝ^(1)`. (b) If `4I_0^3 − J_0^2 > 0`, they form exactly three `SL_2^±(ℝ)`-orbits, one contained in each of `V_ℝ^(0), V_ℝ^(2+)` and `V_ℝ^(2−)`. (c) Consequently, for `i ∈ T`, two forms `f_1, f_2 ∈ V_ℝ^(i)` are `GL_2(ℝ)`-equivalent iff there is `λ > 0` with `I(f_1) = λ^2 I(f_2)` and `J(f_1) = λ^3 J(f_2)`.

`SL_2^±(ℝ) = {γ : det γ = ±1}` acts by the standard action `f ↦ f((x, y)γ)`, which preserves `I` and `J` (weights `(det γ)^4` and `(det γ)^6`) `4I^3 − J^2 = 27Δ`, so the two cases are `Δ < 0` and `Δ > 0`

For the proof, `SL_2^±(ℝ)/{±1} = PGL_2(ℝ)` acts on `ℙ^1(ℝ)` simply 3-transitively and on the upper half-plane transitively with stabiliser `SO_2(ℝ)/{±1}` at `i`; `−1` acts trivially on quartic forms. Four real roots: move three roots to `∞, 0, 1`, so `f = c·xy(x − y)(x − μy)` with `c ≠ 0, μ ∈ ℝ \ {0, 1}`; then `I = c^2(μ^2 − μ + 1), J = c^3(μ + 1)(2μ − 1)(μ − 2)` and `4I^3 − J^2 = 27c^6μ^2(μ − 1)^2 > 0`. The ratio `J^2/I^3` is a degree`-6` function of `μ` invariant under the anharmonic group generated by `μ ↦ 1/μ` and `μ ↦ 1 − μ` (the relabellings of the roots), takes every value in `[0, 4)` on `ℝ \ {0, 1}`, and each fibre is one orbit; so `(I_0, J_0)` determines `μ` up to relabelling and then `c` (`c^2 = I_0/(μ^2 − μ + 1)`, the sign from `J_0`; for `J_0 = 0` the forms `±xy(x − y)(x + y)` are exchanged by `(x, y) ↦ (y, x)`). Two real roots: move them to 0 and `∞` and the conjugate pair onto the unit circle (the diagonal torus fixes `0, ∞` and rescales), so `f = c·xy(x^2 + pxy + y^2)` with `|p| < 2`; `I = c^2(p^2 − 3), J = c^3 p(9 − 2p^2), 4I^3 − J^2 = 27c^6(p^2 − 4) < 0`; the symmetry `(x, y) ↦ (−x, y)` identifies `(c, p)` with `(−c, −p)`, and for `c > 0` the map `p ↦ (I, J)` up to the weighted scaling is a bijection from `(−2, 2)` onto the ratios with `4I^3 < J^2`. No real roots: move one conjugate pair to `±i` and rotate by the stabiliser of `i` so that the other is `±iρ` with `0 < ρ < 1`, so `f = c(x^2 + y^2)(x^2 + ρ^2y^2)`; `I = c^2(ρ^4 + 14ρ^2 + 1), J = −2c^3(1 + ρ^2)(ρ^2 − 6ρ + 1)(ρ^2 + 6ρ + 1), 4I^3 − J^2 = 432c^6ρ^2(1 − ρ^2)^4 > 0`; the sign of `c` is the definiteness, and for fixed sign `ρ ↦ (I, J)` up to scaling is a bijection from `(0, 1)` onto the ratios with `4I^3 > J^2`. Assemble: in each root type the normal form is determined by `(I, J)`, which gives (a) and (b) and shows that the invariants map each type onto the stated sign of `Δ`. (c): `I(γf) = (det γ)^4 I(f), J(γf) = (det γ)^6 J(f)`, so `GL_2(ℝ)`-equivalent forms have `(I, J)` related by `λ = (det γ)^2 > 0`; conversely scale by `λ^{1/4}·1 ∈ Λ` to equalise the invariants and apply `(a)/(b)` within the fixed locus.

*Needs:* [real root types of binary quartic forms](#real-root-types-of-binary-quartic-forms), [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1].

([[1]](#ref-1), Section 2.1, facts 1-2 and the following paragraph, printed p. 8; [[1]](#ref-1), Section 2.1, fact 2, printed p. 8.)

**Checks.**

- For the four-real-root normal form at `c=1, μ=−1`, the invariant formulas give `(I,J)=(3,0)` and `27Δ=108`. The two-real-root normal form at `c=1, p=0` gives `(I,J)=(−3,0)` and `27Δ=−108`. These distinguish the two signs and test the normalization factor 27.

- `x^4 + y^4` and `−(x^4 + y^4)` have invariants `(12, 0)` and `(12, 0)`: same `(I, J)`, different orbits (positive versus negative definite), as (b) predicts.

- `x^3y − (1/3)xy^3` (in `V_ℝ^(0)`) and `(1/16)x^4 − (√2/(3√3))x^3y + (1/2)x^2y^2 + y^4` (in `V_ℝ^(2+)`) both have invariants `(1, 0)` and are not `GL_2(ℝ)`-equivalent.

<a id="stabilizers-of-real-binary-quartic-forms"></a>

**Stabilizers of real binary quartic forms.** Let `f ∈ V_ℝ^(i)` (so `Δ(f) ≠ 0`). Then the stabiliser of `f` in `GL_2(ℝ)` for the standard action has order 8 if `i ∈ {0, 2+, 2−}` and order 4 if `i = 1`; it contains `±1` and consists of elements of determinant `±1`. Define `n_i := #Stab_{GL_2(ℝ)}(f)/2`, so `n_0 = n_{2+} = n_{2−} = 4` and `n_1 = 2`.

Standard (untwisted) action `f ↦ f((x, y)γ) Δ(f) ≠ 0` is essential: `x^2y^2` has an infinite stabiliser

For the proof, If `γ·f = f` then `I(f) = (det γ)^4 I(f)` and `J(f) = (det γ)^6 J(f)`; as `(I, J) ≠ (0, 0) (Δ ≠ 0), det γ = ±1`. On matrices of determinant `±1` the standard action agrees with the twisted action `γ·f = (det γ)^{−2} f((x, y)γ)`, which factors through `PGL_2(ℝ)`; every class in `PGL_2(ℝ)` has a representative of determinant `±1`, unique up to `±1`. Hence `#Stab_{GL_2(ℝ)}(f) = 2·#Stab_{PGL_2(ℝ)}(f)`. By [ArithmeticStatisticsPartII, stabilizer of a binary quartic is two torsion][AS-II-1] (second paragraph of Bhargava-Shankar Theorem 3.2, with `K = ℝ`), `Stab_{PGL_2(ℝ)}(f) ≅ E(ℝ)[2]` for `E` : `y^2 = x^3 − (I/3)x − J/27`. `#E(ℝ)[2] = 1 + (number of real roots of x^3 − (I/3)x − J/27)`. The discriminant of this cubic is `4(I/3)^3 − 27(J/27)^2 = Δ(f)`; by `Cubic.discr_eq_prod_three_roots` it is a positive multiple of `((x − y)(x − z)(y − z))^2`, which is positive for three real roots and negative for one real root and a conjugate pair. So `#E(ℝ)[2] = 4` if `Δ > 0` and 2 if `Δ < 0`. Combine with the sign of `Δ` on the loci ([real root types of binary quartic forms](#real-root-types-of-binary-quartic-forms)): orders 8, 4, 8, 8.

*Needs:* [real root types of binary quartic forms](#real-root-types-of-binary-quartic-forms), [ArithmeticStatisticsPartII, stabilizer of a binary quartic is two torsion][AS-II-1], `Cubic.discr_eq_prod_three_roots` (Mathlib).

([[1]](#ref-1), Section 2.1, Lemma 2.2, printed p. 8; [[1]](#ref-1), Section 2.1, printed p. 9; [[1]](#ref-1), Section 2.8, proof of Lemma 2.2, printed pp. 20-21.)

**Checks.**

- `x^4 + y^4 ∈ V_ℝ^(2+)`: the stabiliser is the group of the eight signed permutation matrices `(x, y) ↦ (±x, ±y), (±y, ±x)`, of order 8.

- `x^3y + xy^3 ∈ V_ℝ^(1)`: the stabiliser is `{±1, ±[[0, 1], [1, 0]]}`, of order 4 (`diag(1, −1)` sends the form to its negative).

- Bhargava-Shankar's Theorem 1.8 uses `n_2 = 2` for the definite forms lumped together; this is consistent: `V_ℝ^(2)` contains two orbits for each `(I, J)`, each with `n_{2±} = 4`.

<a id="fundamental-sets-for-real-binary-quartic-orbits"></a>

**Fundamental sets for real binary quartic orbits.** Define bounded sets of real binary quartic forms: `L^(0) := {x^3y − (1/3)xy^3 − (J/27)y^4 : −2 < J < 2}`; `L^(1) := {x^3y − (I/3)xy^3 ± (2/27)y^4 : −1 ≤ I < 1} ∪ {x^3y + (1/3)xy^3 − (J/27)y^4 : −2 < J < 2}`; `L^(2+) := {(1/16)x^4 − (√(2 − J)/(3√3))x^3y + (1/2)x^2y^2 + y^4 : −2 < J < 2}`; `L^(2−) := {−f : f ∈ L^(2+)}`. Then for each `i ∈ T`: (a) `L^(i) ⊆ V_ℝ^(i)` and every `f ∈ L^(i)` has `H(f) = max(|I(f)|^3, J(f)^2/4) = 1`; (b) `f ↦ (I(f), J(f))` is a bijection from `L^(i)` onto `{(I, J) : H(I, J) = 1, 4I^3 − J^2 > 0} (i ∈ {0, 2±})` or onto `{(I, J) : H(I, J) = 1, 4I^3 − J^2 < 0} (i = 1)`; (c) every `GL_2(ℝ)`-orbit in `V_ℝ^(i)` meets `L^(i)` in exactly one point, and the same holds for `h·L^(i)` for every `h ∈ GL_2(ℝ)`; (d) all coefficients of all forms in `L^(i)` have absolute value at most 1. Put `R^(i) := Λ·L^(i) = {λ·f : λ > 0, f ∈ L^(i)} (λ·f = f((x, y)λ) = λ^4 f)`; then `f ↦ (I(f), J(f))` is a bijection from `R^(i)` onto `{(I, J) : 4I^3 − J^2 > 0}` (resp. `< 0`), with inverse `(I, J) ↦ p^(i)_{I,J}`.

The `±` in the first family of `L^(1)` gives `J = ∓2` Scaling by `λ ∈ Λ` multiplies `(I, J)` by `(λ^8, λ^12)`, i.e. by `(μ^2, μ^3)` with `μ = λ^4`

The required API is:

- `quarticFundSet`: quarticFundSet `i = L^(i) ⊆ V_ℝ`, given by the explicit parametrisations of Table 1.

- `quarticFundSet_subset_locus`: `L^(i) ⊆ V_ℝ^(i)`.

- `height_eq_one_of_mem_quarticFundSet`: `f ∈ L^(i) → H(f) = 1`.

- `invariants_bijOn_quarticFundSet`: `(I, J)` is a bijection from `L^(i)` onto the height-one pairs with the sign condition of `i`.

- `existsUnique_smul_mem_quarticFundSet`: For `f ∈ V_ℝ^(i)` and `h ∈ GL_2(ℝ)` there is a unique `f′ ∈ h·L^(i)` that is `GL_2(ℝ)`-equivalent to `f`.

- `abs_coeff_le_one_of_mem_quarticFundSet`: Every coefficient of every `f ∈ L^(i)` has absolute value `≤ 1` (boundedness).

- `quarticSection`: The section `p^(i)` : {`(I, J)` : sign condition} `→ R^(i) = Λ·L^(i)` with invariants `(I, J)`.

- `invariants_quarticSection`: `(I, J)(p^(i)_{I,J}) = (I, J)`.

For the proof, Compute invariants: for `x^3y − (1/3)xy^3 − (J/27)y^4, I = −3·1·(−1/3) = 1` and `J(f) = −27·(−J/27) = J`; for `x^3y − (I/3)xy^3 ± (2/27)y^4, (I(f), J(f)) = (I, ∓2)`; for `x^3y + (1/3)xy^3 − (J/27)y^4, (I(f), J(f)) = (−1, J)`; for the `L^(2+)` forms, `I = 12/16 + 1/4 = 1` and `J = 9/4 − 27·(2 − J)/27 − 1/4 = J`. Hence `H = 1` and the sign of `4I^3 − J^2` is as stated, and the pieces of the curve `H = 1` are covered bijectively: for `Δ < 0` the curve `H(I, J) = 1` is `{I = −1, |J| ≤ 2} ∪ {|J| = 2, −1 ≤ I < 1}`, matching the two families with the overlap `(−1, ±2)` assigned to the first. The root types: `x^3 − x/3 − J/27` has discriminant `(4 − J^2)/27 > 0` for `|J| < 2`, so the `L^(0)` forms (with the root `[1 : 0]`) have four real roots; the `L^(1)` forms have `4I^3 − J^2 < 0` and hence two real roots by [real orbits of binary quartic forms with fixed invariants](#real-orbits-of-binary-quartic-forms-with-fixed-invariants); the `L^(2+)` forms are positive definite (positive at `J` near 2 and `Δ ≠ 0` on the connected parameter interval). (c) from `(b), H(λ^2 I, λ^3 J) = λ^6 H(I, J)` (a unique `λ > 0` normalises the height to 1) and part (c) of [real orbits of binary quartic forms with fixed invariants](#real-orbits-of-binary-quartic-forms-with-fixed-invariants); `h·L^(i)` inherits the property since `h` permutes the `GL_2(ℝ)`-orbits trivially. (d): `|J| < 2` and `−1 ≤ I < 1` bound the listed coefficients by 1 (the largest is `|√(2 − J)/(3√3)| < 2/(3√3) < 1`).

*Needs:* [real root types of binary quartic forms](#real-root-types-of-binary-quartic-forms), [real orbits of binary quartic forms with fixed invariants](#real-orbits-of-binary-quartic-forms-with-fixed-invariants), [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1].

([[1]](#ref-1), Section 2.1, Table 1, printed p. 8; [[1]](#ref-1), Section 2.1, after Table 1, printed p. 8; [[1]](#ref-1), Section 2.4, printed p. 13.)

**Checks.**

- `x^3y − (1/3)xy^3 ∈ L^(0)`, with `(I, J) = (1, 0)`.

- `x^3y + (1/3)xy^3 − (2/27)y^4 ∈ L^(1)` with `(I, J) = (−1, 2)`; it lies in the first family (`I = −1`, sign `−`) and not in the second (which has `|J| < 2`).

- No form in `L^(0) ∪ L^(1) ∪ L^(2±)` has invariants `(1, 2)`: that pair has `Δ = 0`.

- `L^(2−) = −L^(2+)`, and `f ↦ −f` sends `(I, J)` to `(I, −J)`.

- `x^3y − (1/3)xy^3 ∈ L^(0)` has invariants `(1, 0)`; `x^3y + (1/3)xy^3 − (2/27)y^4 ∈ L^(1)` has invariants `(−1, 2)`; the point `(I, J) = (1, 2)` with `Δ = 0` is not attained.

- Coefficient bound constant: `C^4` with `C = 1` works for `L^(i)` itself; for `G_0·L` the constant `C` of Proposition 2.7 depends on `G_0`.

<a id="gauss-fundamental-domain-in-iwasawa-coordinates"></a>

**Gauss fundamental domain in iwasawa coordinates.** Every `g ∈ GL_2(ℝ)` with `det g > 0` has a unique Iwasawa decomposition `g = n(u)a(t)k(θ)λ` with `n(u) = [[1, 0], [u, 1]]` `(u ∈ ℝ)`, `a(t) = diag(t^{−1}, t)` `(t > 0)`, `k(θ) = [[cos θ, sin θ], [−sin θ, cos θ]]` `(θ ∈ ℝ/2πℤ)` and `λ = λ·1 (λ > 0)`. The measure `dg = t^{−2} du d^×t dk d^×λ` (`d^×t = dt/t`, `d^×λ = dλ/λ`, `dk = dθ/2π` of total mass 1 on `SO_2(ℝ)`) is a Haar measure on `GL_2^+(ℝ)`. Let `ν(t) := {u ∈ [−1/2, 1/2] : u^2 + t^4 ≥ 1}`, `N′(t) := {n(u) : u ∈ ν(t)}`, `A′ := {a(t) : t ≥ 3^{1/4}/√2}`, `K_+ := {k(θ) : 0 ≤ θ < π}` and `Λ := {λ·1 : λ > 0}`. Then `F := N′(t)A′K_+Λ` is a fundamental domain for the left action of `GL_2(ℤ)` on `GL_2(ℝ)` (`GL_2(ℝ) = ⋃_{γ ∈ GL_2(ℤ)} γF` up to a null set, the translates pairwise almost disjoint), and its image `F_PGL2` in `PGL_2(ℝ)` is a fundamental domain for `PGL_2(ℤ)`. Moreover `g ↦ z(g) := −u + it^2` identifies `N′(t)A′` with the standard domain `fd` of the upper half-plane, and `t^{−2} du d^×t = (1/2)·dx dy/y^2` under `z = x + iy`.

`K_+` is a set of representatives of `SO_2(ℝ)/{±1}`; with the full `SO_2(ℝ)`, as printed in the source, `F` would contain both `g` and `−g ∈ GL_2(ℤ)g` and would be a union of two fundamental domains `GL_2(ℤ)` acts on the left; `F ⊆ GL_2^+(ℝ)`, which suffices because `GL_2(ℤ)` contains matrices of determinant `−1 ν(t)` is a union of one or two intervals depending only on `t`, and `ν(t) = [−1/2, 1/2]` for `t ≥ 1` The circular and vertical edges of the upper-half-plane region are included, so `K_+` only removes the central `±1` ambiguity: this remains a measure-theoretic fundamental domain, not an exact transversal on its boundary. Exact pointwise orbit-multiplicity claims require a boundary selector, or the almost-everywhere-in-`h` formulation used below.

The required API is:

- `iwasawaN`: `n(u) = [[1, 0], [u, 1]]`.

- `iwasawaA`: `a(t) = diag(t^{−1}, t)` for `t > 0`.

- `iwasawaK`: `k(θ) = [[cos θ, sin θ], [−sin θ, cos θ]]`.

- `iwasawa_existsUnique`: `det g > 0 → ∃! (u, t, θ mod 2π, λ)` with `t, λ > 0` and `g = n(u)a(t)k(θ)λ`.

- `gaussDomain`: `F = {n(u)a(t)k(θ)λ : u ∈ ν(t), t ≥ 3^{1/4}/√2, 0 ≤ θ < π, λ > 0}`.

- `mem_gaussDomain_iff`: For `t,lambda>0` and the canonical representative `0≤theta<2pi, n(u)a(t)k(theta)lambda` lies in `F` iff `−u+it²` lies in `fd` and `theta<pi`. The angular restriction is essential because `k` is periodic.

- `isFundamentalDomain_gaussDomain`: `F` is a measure-theoretic fundamental domain for `GL_2(ℤ)` acting on `GL_2(ℝ)` by left multiplication, for the Haar measure dg.

- `gaussDomain_haar`: The Haar measure `dg = t^{−2} du d^×t dk d^×λ` in Iwasawa coordinates, as a measure on `GL_2^+(ℝ)`.

- `neg_mem_gaussDomain_iff`: `g ∈ F → −g ∉ F` (the half circle `K_+` removes the `±1` ambiguity).

For the proof, Iwasawa: Gram-Schmidt on the rows of `g` gives `g =` (lower unitriangular)(positive diagonal)(orthogonal); `det g > 0` forces the orthogonal factor into `SO_2(ℝ)`, and the diagonal factor is `a(t)λ`. Uniqueness from `N ∩ AΛ ∩ SO_2 = {1}`. Haar density: the left-invariant form `g^{−1}dg` in these coordinates has density proportional to `t^{−3}λ^{−1}` (a direct computation), i.e. `t^{−2} du d^×t dθ d^×λ`. Upper half-plane: the positive definite binary quadratic form `(x, y)gg^T(x, y)^T` equals `λ^2 t^{−2}((x + uy)^2 + t^4y^2)`, whose root in the upper half-plane is `z(g) = −u + it^2`; left multiplication by `γ ∈ SL_2(ℤ)` acts on `z(g)` by the Möbius action of `γ` (up to the transpose-inverse convention), and `k(θ), λ` do not change `z(g)`. The conditions `u ∈ ν(t), t ≥ 3^{1/4}/√2` say exactly `|Re z| ≤ 1/2` and `|z| ≥ 1`, i.e. `z(g) ∈ fd` (ModularGroup.fd). Covering and disjointness: a `GL_2(ℤ)`-coset meets `GL_2^+(ℝ)` in one `SL_2(ℤ)`-coset. By `ModularGroup.exists_smul_mem_fd` every `z` is moved into `fd`, and by `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` (or the measure form `ModularGroup.isFundamentalDomain_fdo` of Tau Ceti, a MeasureTheory.IsFundamentalDomain for `PSL_2(ℤ)`) two points of the open domain in one orbit coincide; the kernel `{±1}` of `SL_2(ℤ) → PSL_2(ℤ)` acts on the `K`-coordinate by `θ ↦ θ + π`, which `K_+` resolves. Measure: with `y = t^2, dy = 2t dt`, so `dx dy/y^2 = 2t^{−3} du dt = 2t^{−2} du d^×t`.

*Needs:* `ModularGroup.fd` (Mathlib), `ModularGroup.fdo` (Mathlib), `ModularGroup.exists_smul_mem_fd` (Mathlib), `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` (Mathlib), `ModularGroup.isFundamentalDomain_fdo` (Tau Ceti), `MeasureTheory.IsFundamentalDomain` (Mathlib), `Matrix.GeneralLinearGroup` (Mathlib).

([[1]](#ref-1), Section 2.1, (7), printed p. 8; [[1]](#ref-1), Section 2.3, the Haar measure after (10), printed pp. 10-11; [[5]](#ref-5), Section 5.1, (15), p. 10.)

**Checks.**

- `1 ∈ F`: its coordinates are `u = 0, t = 1, θ = 0, λ = 1`.

- `−1 ∉ F (θ = π)`, although `−1 = (−1)·1` with `−1 ∈ GL_2(ℤ)`: with the full `SO_2(ℝ)` both would lie in `F`.

- Every `g ∈ F` has `det g = λ^2 > 0`; `diag(1, −1) ∉ F`.

- For `t ≥ 1, n(u)a(t)k(0) ∈ F ↔ |u| ≤ 1/2`.

- The identity `1 = n(0)a(1)k(0)·1` lies in `F` (`z = i`, on the boundary `|z| = 1`), and `−1 = n(0)a(1)k(π)·1` does not, although `−1 ∈ GL_2(ℤ)·1`.

- For `t ≥ 1` the slice `N′(t)` is the whole interval `[−1/2, 1/2]`.

- `F` contains no matrix of negative determinant.

<a id="hyperbolic-area-of-the-modular-fundamental-domain"></a>

**Hyperbolic area of the modular fundamental domain.** For the invariant measure on the upper half-plane (Mathlib's volume on `ℍ`, density `1/(Im z)^2` with respect to Lebesgue measure), `volume(ModularGroup.fd) = π/3`.

For the proof, By `UpperHalfPlane.volume_eq_lintegral, volume(fd) = ∫∫ y^{−2} dy dx` over `{|x| ≤ 1/2, y ≥ √(1 − x^2)}`. The inner integral is `∫_{√(1−x^2)}^∞ y^{−2} dy = (1 − x^2)^{−1/2}`. `∫_{−1/2}^{1/2} (1 − x^2)^{−1/2} dx = arcsin(1/2) − arcsin(−1/2) = π/3` by the fundamental theorem of calculus (`intervalIntegral.integral_deriv_eq_sub` with `Real.hasDerivAt_arcsin`; the integrand is continuous on `[−1/2, 1/2]`).

*Needs:* `ModularGroup.fd` (Mathlib), `UpperHalfPlane.volume_eq_lintegral` (Mathlib), `ModularGroup.volume_fd_lt_top` (Tau Ceti), `Real.hasDerivAt_arcsin` (Mathlib), `intervalIntegral.integral_deriv_eq_sub` (Mathlib).

([[5]](#ref-5), Section 5.4, p. 14.)

**Checks.**

- The value refines Tau Ceti's `ModularGroup.volume_fd_lt_top` (finiteness only).

- `π/3 = 2ζ(2)/π`, the form in which the value enters the volume computations.

- The open and closed modular domains have the same volume: their difference lies in the two vertical sides and circular boundary arc, which have invariant measure zero.

<a id="covolume-of-pgl2-z"></a>

**Covolume of pgl2 z.** (a) Let `ω` be the left-invariant top form on `PGL_2(ℝ)` whose value at the identity is the dual of the `ℤ`-basis `E_11, E_12, E_21` of `pgl_2(ℤ) = gl_2(ℤ)/ℤ·1` (well defined up to sign; `|ω|` is the associated Haar measure). In the coordinates `[n(u)a(t)k(θ)]` of `PGL_2^+(ℝ), |ω| = 2t^{−3} du dt dθ`, and `Vol_ω(F_PGL2) = Vol_ω(PGL_2(ℤ)\PGL_2(ℝ)) =` `2ζ(2) = π^2/3`. (b) For the Haar measure `dg = t^{−2} du d^×t dk d^×λ` of [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), the domain `N′(t)A′K_+` (`λ` omitted) has measure `π/12 = ζ(2)/(2π)`; equivalently `Vol(GL_2(ℤ)\GL_2^{±1}(ℝ)) = ζ(2)/(2π)`. (c) On `PGL_2^+(ℝ), |ω| = 4π·t^{−2} du d^×t dk`.

`F` is the strict domain with `K_+ (θ ∈ [0, π))`; with the full circle both volumes double `ω` is determined by the `ℤ`-structure of `PGL_2` up to sign, as in the source

For the proof, (a) Compute `g^{−1}dg` for `g = n(u)a(t)k(θ)` and express it modulo scalars in the basis `E_11, E_12, E_21` (the `E_11`-coordinate of `X ∈ gl_2` modulo scalars is `X_11 − X_22`): the determinant of the resulting `3 × 3` matrix of one-forms is `−2t^{−3} du dt dθ` (a direct computation). Integrate over `F_PGL2`: `θ` ranges over `[0, π)` and `(u, t)` over `N′(t)A′`; with `y = t^2, 2t^{−3} du dt = du dy/y^2`, so `Vol_ω = π·volume(fd) = π·π/3 = π^2/3` by [hyperbolic area of the modular fundamental domain](#hyperbolic-area-of-the-modular-fundamental-domain); and `2ζ(2) = π^2/3` by `riemannZeta_two`. (b) `∫ t^{−2} du d^×t` over `N′(t)A′` equals `(1/2)·volume(fd) = π/6`, and `K_+` has dk-mass `1/2`; the product is `π/12 = ζ(2)/(2π)`. (c) Compare the densities: `2t^{−3} du dt dθ = 4π·t^{−2} du d^×t (dθ/2π)`.

*Needs:* [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [hyperbolic area of the modular fundamental domain](#hyperbolic-area-of-the-modular-fundamental-domain), `riemannZeta_two` (Mathlib).

([[1]](#ref-1), Section 2.4, (23), printed p. 13; [[1]](#ref-1), Section 2.4, printed p. 13; [[5]](#ref-5), Section 5.4, p. 14.)

**Checks.**

- Tamagawa check: `2ζ(2)·∏_p (1 − p^{−2}) = 2`, the Tamagawa number of `PGL_2` used by Bhargava-Shankar at the end of Section 3.6.

- Bhargava-Shankar-Tsimerman state `Vol(GL_2^{±1}(ℤ)\GL_2^{±1}(ℝ)) = ζ(2)/π`; the value here is `ζ(2)/(2π)`, and the factor 2 is compensated by the Jacobian constant of their Proposition 23.

- The Maurer–Cartan determinant in the ordered tangent basis is `−2t^(−3)`; its absolute value gives `ω`-volume `π²/3`. Reversing two basis vectors changes the determinant sign and preserves the volume.

<a id="orbit-multiplicities-in-fundamental-multisets"></a>

**Orbit multiplicities in fundamental multisets.** Let `i∈T` and let `F` be the Gauss region with `K_+`, retaining the boundary of the modular domain. For each fixed `x∈V_R^(i)`, for Haar-almost every `h∈GL2^+(R)`, the sum of multiplicities in `Fh·L^(i)` over the `GL2(Z)`-orbit of `x` equals `m(x)=#Stab_GL2(R)(x)/#Stab_GL2(Z)(x)`, an integer between 1 and `n_i`. This ratio equals `n_i` whenever the integral stabilizer is `{±1}`, and for almost every real `x`. For the countable set of integral `x`, choose one common conull set of `h`. On that set the irreducible count of height`<X`, with multiplicity, is the sum over classes of `n_i·2/#Stab_GL2(Z)(x)`. Consequently the averaged count has these class weights. The assertion for every `h` would require an exact boundary selector, which `F` as defined does not supply.

`F` must be the strict domain `(K_+)`; with the full `SO_2(ℝ)` every multiplicity doubles `N(S; X)` is the number of `GL_2(ℤ)`-classes of irreducible elements of `S` of height `< X`

For the proof, For fixed `x` choose the unique point `x_L` of `L^(i)` in its real orbit. The set of `g` taking `x_L` to `x` is a finite coset of its real stabilizer. For each `gamma∈GL2(Z)`, the condition that one of the corresponding points of `gamma g Stab(x_L) h^{-1}` lies on the boundary of `F` defines a Haar-null set of `h`, by translation and inversion invariance of Haar measure. The countable union over `gamma` and the finite stabilizer remains null. Outside this null set each relevant `GL2(Z)`-coset meets `F` exactly once. The double-coset calculation then gives `#Stab_GL2(R)(x)/#Stab_GL2(Z)(x)`. Both stabilizers contain `±1`, giving the bounds and the claimed class weight. For each `gamma` outside `{±1}`, its fixed locus on binary quartics is a proper linear subspace. Countability of `GL2(Z)` makes their union null, so the generic ratio is `n_i`. For integral `x` use the countable union of the exceptional `h`-sets to obtain the common conull set needed to sum the counts. Integrate over a compact averaging set of positive Haar measure. Boundary changes have no effect on this integral; a null set in the real coefficient space alone would not justify discarding integral points.

*Needs:* [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms), [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[1]](#ref-1), Section 2.1, the claim (8) and its proof, printed p. 9; [[1]](#ref-1), Section 2.1, printed p. 9.)

**Checks.**

- For `x=x⁴+y⁴, m(x)=1`. If `h` sends the chosen `L^(2+)` representative to `x`, both `g=1` and `g=k(pi/2)` lie in `F` and fix `x`, so the point has multiplicity at least two for this exceptional `h`. Thus a multiplicity assertion for every `h` fails, testing the boundary qualification.

- For `x=x³y−xy³`, the integral stabilizer contains the quarter-turn and has order at least four, so `m(x)≤2<n_0`. The ratio, rather than a pointwise boundary count, is what controls the averaged formula.

### 2.3 Averaging quartic orbits and cutting the cusp

<a id="averaged-count-of-binary-quartic-orbits"></a>

**Averaged count of binary quartic orbits.** Fix a compact semialgebraic set `G_0 ⊂ GL_2(ℝ)` that is left `SO_2(ℝ)`-invariant, is the closure of a nonempty open set, and has `det h ≥ 1` for `h ∈ G_0`; let dh be the Haar measure of [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates) and `F` the strict Gauss domain. For `i ∈ T, S ⊆ V_ℤ^(i)` (not necessarily `GL_2(ℤ)`-invariant) and `X > 0` define `N(S; X) := (1/C_{G_0}^(i)) ∫_{h ∈ G_0} #{x ∈ F h·L^(i) ∩ S^irr : H(x) < X} dh`, where `C_{G_0}^(i) := n_i ∫_{G_0} dh, S^irr` is the set of elements of `S` irreducible over `ℚ`, and the count is taken with the multiplicities of the multiset `F h·L^(i)`. For a weight `φ` : `V_ℤ → ℝ, N_φ(S; X)` is defined in the same way with each `x` counted with weight `φ(x)`. For `n = n(u), t > 0, λ > 0` put `B(n, t, λ, X) := n a(t) λ G_0·L^(i) ∩ {x ∈ V_ℝ^(i) : H(x) < X}`, a bounded semialgebraic multiset.

`G_0, i` and the fundamental set `L^(i)` are fixed; for `GL_2(ℤ)`-invariant `S` the value does not depend on `G_0` Only irreducible elements are counted; `H` is the height `max(|I|^3, J^2/4)` of [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1] `G_0` is a set of matrices with Haar measure. An arbitrary subset of Iwasawa coordinate space can cover the same matrix different numbers of times; invariance of its image alone does not give the invariant averaging measure. The average therefore integrates on the matrix carrier. The general semialgebraic predicate and multiset Davenport interface remain GeometryOfNumbersAndQuadraticArithmetic §4.1 supplier work.

The required API is:

- `quarticAveragedCount`: `N(S; X)` for `S ⊆ V_ℤ`, with `G_0` and `i` as parameters, by the formula (11).

- `quarticAveragedCount_weighted`: `N_φ(S; X)`, the same average with weights `φ(x)`.

- `quarticRegionB`: `B(n, t, λ, X) = n a(t) λ G_0·L^(i) ∩ {H < X}` as a multiset in `V_ℝ`.

- `quarticAveragedCount_eq_sum_classes`: For `GL_2(ℤ)`-invariant `S`: `N(S; X) = Σ` over irreducible classes `[x] ⊆ S` with `H(x) < X` of `2/#Stab_{GL_2(ℤ)}(x)`.

- `quarticAveragedCount_union`: `N(S_1 ∪ S_2; X) = N(S_1; X) + N(S_2; X)` for disjoint `S_1, S_2`.

- `quarticAveragedCount_mono`: `S_1 ⊆ S_2 → N(S_1; X) ≤ N(S_2; X)`, and `X ↦ N(S; X)` is monotone.

- `quarticAveragedCount_indep`: For `GL_2(ℤ)`-invariant `S, N(S; X)` does not depend on `G_0` or on the choice of the fundamental set `L^(i)`.

- `quarticAveragedCount_reducible`: `N(S; X) = 0` when every element of `S` is reducible over `ℚ` (for example when every element has `a = 0`).

For the proof, On a compact averaging set the height bound and `a≠0` for irreducible forms bound `lambda` and then the cusp parameter `t` by the leading-coefficient estimate. Thus the union of contributing integral irreducible points is bounded and finite. Their finite multiplicity functions are measurable (using the semialgebraic descriptions), so the count and each fixed weighted count are integrable. For `GL_2(ℤ)`-invariant `S`, [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets) gives, for Haar-almost every `h` (one common conull set for the countable integral lattice), `#{x ∈ F h·L^(i) ∩ S^irr : H(x) < X} = Σ` over irreducible `GL_2(ℤ)`-classes `[x] ⊆ S` of height `< X` of `n_i·2/#Stab_{GL_2(ℤ)}(x)`; averaging over `h` gives `N(S; X) = Σ_{[x]} 2/#Stab_{GL_2(ℤ)}(x)`, which is the number of classes counted with weight 1 except for the classes with a stabiliser larger than `{±1}`.

*Needs:* [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets), [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms), [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1].

([[1]](#ref-1), Section 2.3, (10), printed p. 10; [[1]](#ref-1), Section 2.3, (11) and the sentence after it, printed p. 11; [[1]](#ref-1), Theorem 2.5, (17), printed p. 11.)

**Checks.**

- `N(∅; X) = 0` for every `X`, and `N(S; X) = 0` for every `S` when `X ≤ 1`: by Theorem 1.7 every integral binary quartic form with `Δ ≠ 0` has height at least `49/4`, attained at the eligible pairs `(I, J) = (−2, ±7)`.

- For `S = {f ∈ V_ℤ^(i) : a(f) = 0}, N(S; X) = 0`: every such form has the linear factor `y`.

- For a single point `S = {f}` with `f` irreducible and `Stab_GL2(Z)(f)={±1}, N(S; X) = (1/C) ∫_{G_0} 1_{H(f)<X} mult_{F h·L}(f) dh` and `0≤N(S; X)≤1`. If `X≤H(f)`, its value is zero. The central matrix `−1` fixes every quartic, so a trivial `GL2` stabilizer is impossible; the effective stabilizer in `GL2/{±1}` is the trivial one in this test. For a non-invariant singleton the integral depends on how its representatives meet the averaging region, rather than merely on the number of orbits.

- For `S = V_ℤ^(i), N(S; X) = Σ_{[x]} 2/#Stab_{GL_2(ℤ)}(x)` over the irreducible classes of height `< X`, independently of `G_0`.

- For `S = V_ℤ^(i), N(S; X)` differs from the number of irreducible `GL_2(ℤ)`-classes in `V_ℤ^(i)` of height `< X` by at most the number of classes with stabiliser larger than `{±1}`, which is `O(X^{3/4+ε})` ([orbits with large stabilizer are negligible](#orbits-with-large-stabilizer-are-negligible)).

- `N(S_1 ⊔ S_2; X) = N(S_1; X) + N(S_2; X)` for disjoint `S_1, S_2`, invariant or not: the definition (11) of the source extends `N` to all subsets.

<a id="averaging-formula-for-binary-quartic-forms"></a>

**Averaging formula for binary quartic forms.** For every `i ∈ T`, every `S ⊆ V_ℤ^(i)` and every `X > 0, N(S; X) = (1/(2C_{G_0}^(i))) ∫_{n(u)a(t)λ ∈ N′(t)A′Λ} #{x ∈ S^irr ∩ B(n, t, λ, X)} t^{−2} du d^×t d^×λ`, where the count in `B` is with multiplicity, dk has total mass 1 on `SO_2(ℝ)`, and `F` is the strict domain `N′(t)A′K_+Λ`. (If, as printed in the source, the `K`-factor of `F` is all of `SO_2(ℝ)`, the same computation gives the identity without the factor `1/2`, but then the average (11) with `C_{G_0}^(i) = n_i∫_{G_0} dh` is twice the orbit count; normalising by `2n_i∫_{G_0} dh` instead gives exactly the statement here.)

`S` arbitrary; the proof uses only the definition of `N(S; X)`, Fubini and the invariance of Haar measure The factor `1/2` is `∫_{K_+} dk`

For the proof, Write the integrand of the definition as a sum over `x ∈ S^irr` with `H(x) < X` of `#{g ∈ F : x = gh·x_L}`, where `x_L` is the point of `L^(i)` in the `GL_2(ℝ)`-orbit of `x` ([fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits)). For fixed `x` with `x = g_j·x_L` (finitely many `g_j`, one for each element of the stabiliser), `∫_{G_0} #{g ∈ F : gh = g_j} dh = Σ_j vol(G_0 ∩ F^{−1}g_j) = Σ_j vol(G_0 g_j^{−1} ∩ F^{−1})` by invariance of dh (`GL_2(ℝ)` is unimodular), which equals `∫_{g ∈ F} #{h ∈ G_0 : x = gh·x_L} dg`. Exchange sum and integral: `N(S; X) = (1/C) ∫_{g ∈ F} #{x ∈ S^irr ∩ gG_0·L : H(x) < X} dg`. Write `g = n(u)a(t)kλ` with `k ∈ K_+`: since `kG_0 = G_0` (left `SO_2(ℝ)`-invariance) the integrand does not depend on `k`, and `∫_{K_+} dk = 1/2`, which gives the formula with `B(n, t, λ, X)` ([averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits)). The Gauss region is only a transversal away from its boundary; use the almost-everywhere-in-`h` multiplicity statement. The Fubini change of variables is on `GL2^+(R)` with genuine Haar measure and `G_0` as a matrix set, not a coordinate set with uncontrolled angular multiplicity.

*Needs:* [averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets).

([[1]](#ref-1), Section 2.3, (12)-(15) and Theorem 2.5 with (16), printed p. 11.)

**Checks.**

- Sanity check of the constant: inserting `Vol(B(n, t, λ, X))` for the count and unfolding the integral over the full `SO_2(ℝ)` gives `∫ Vol(B) t^{−2} du d^×t d^×λ = 2∫_{G_0} Vol(F h·L ∩ {H < X}) dh`, hence the main term `Vol(R_X(L^(i)))/n_i` of (20).

- For `S` invariant under `GL_2(ℤ)` the right side is independent of `G_0`, as is the left side.

<a id="reducible-binary-quartic-forms-in-the-main-body"></a>

**Reducible binary quartic forms in the main body.** Let `G_0 ⊂ GL_2(ℝ)` be compact and `h ∈ G_0`. For every `ε > 0` the number of integral binary quartic forms `f = ax^4 + bx^3y + cx^2y^2 + dxy^3 + ey^4` in the multiset `R_X(h·L^(i)) := {w ∈ F h·L^(i) : H(w) < X}` (counted with multiplicity) that are reducible over `ℚ` and have `a ≠ 0` is `O_ε(X^{2/3+ε})`, the implied constant depending only on `G_0` and `ε`.

Only forms with `a ≠ 0` are included: `a = 0` forces the factor `y`. A fixed vector has at most `#Stab_GL2(R)(f)=2n_i≤8` preimages under the orbit map, which bounds its multiset multiplicity even on the retained boundary. The sharper orbit-total multiplicity `n_i` is used only for almost every averaging matrix `h`, as in the multiplicity theorem. When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, Coefficient bounds: `R_X(h·L) ⊆ N′A′KΛh·L` with `h·L` in a fixed compact set and `0 < λ ≪_{G_0} X^{1/24}` (`H` scales by `λ^24` and `det(h)^12`, with `|det(h)|` bounded away from zero on the compact subset `G_0` of `GL2(R)`). Hence a, `b, c = O(X^{1/6})` and `ad, bd, ae = O(X^{1/3})`; in particular the forms with `a ≠ 0` and `e = 0` number `O(X^{4/6+ε})`. Linear factor, a, `e ≠ 0`: the quadruple `(a, b, d, e)` has `O(X^{4/6+ε})` possibilities; a linear factor `px + qy` (`p, q` coprime) has `p | a` and `q | e`, so `O(X^ε)` choices by the divisor bound `d(n) = O_ε(n^ε)` (requested from AnalyticNumberTheoryPartI §§3.22,3.26); then `f(−q, p) = 0` determines `c`. Product of two irreducible quadratics `(px^2 + qxy + ry^2)((a/p)x^2 + sxy + (e/r)y^2)`: `O(X^{2/6+ε})` pairs `(a, e) (ae = O(X^{1/3})), O(X^ε)` pairs `(p, r)` by the divisor bound; if the linear system `(a/p)q + ps = b, (e/r)q + rs = d` is nonsingular, `(b, d)` determine `(q, s)` and then `c`, giving `O(X^{4/6+ε})`; if singular, `d = (r/p)b` is determined by `b` and there are `O(X^{1/6})` choices each for `b` and `c`, again `O(X^{4/6+ε})`. Multiply by the bounded multiplicity.

*Needs:* [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets), AnalyticNumberTheoryPartI §§3.22,3.26.

([[1]](#ref-1), Section 2.2, Lemma 2.3, printed p. 9; [[1]](#ref-1), Proof of Lemma 2.3, printed p. 10.)

**Checks.**

- Order check: `X^{2/3+ε}` is smaller than the main term `X^{5/6}` and than the error `X^{3/4+ε}` of Theorem 2.1.

- The analogous cubic statement is [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body), with `X^{3/4+ε}`.

<a id="reducible-monic-binary-cubic-forms"></a>

**Reducible monic binary cubic forms.** For a monic integral binary cubic form `g = x^3 + rx^2y + sxy^2 + ty^3` put `I(g) := r^2 − 3s`, `J(g) := −2r^3 + 9rs − 27t` and `H(g) := max(|I(g)|^3, J(g)^2/4)`; these are invariant under the group `F_{ℤ,1}` of lower unitriangular integer matrices acting by `g ↦ g((x, y)γ)`. For every `ε > 0` the number of `F_{ℤ,1}`-orbits of monic integral binary cubic forms that are reducible over `ℚ` and have `H(g) < X` is `O_ε(X^{1/2+ε})`.

Monic means `g(1, 0) = 1` The invariants agree with those of the binary quartic whose monic cubic resolvent is `g` ([ArithmeticStatisticsPartII, embedding into pairs of ternary quadratic forms][AS-II-2])

For the proof, The substitution `x ↦ x + ky` changes `r` by `3k`, so every `F_{ℤ,1}`-orbit has a representative with `r ∈ {−1, 0, 1}`. Then `|r^2 − 3s|^3 < X` gives `s = O(X^{1/3})` and `J^2/4 < X` gives `t = O(X^{1/2})`. `t = 0` (the factor `x`): `O(X^{1/3})` forms. `t ≠ 0`: a linear factor `x − my` has `m | t`, so `O(X^ε)` choices of `m` for each `t` (divisor bound, requested from AnalyticNumberTheoryPartI §§3.22,3.26); `r, t, m` then determine `s` through `g(m, 1) = 0`. Total `O(X^{1/2+ε})`.

*Needs:* AnalyticNumberTheoryPartI §§3.22,3.26.

([[1]](#ref-1), Section 2.8, Lemma 2.22 and its proof, printed p. 21.)

**Checks.**

- The count of all monic forms with `r ∈ {−1, 0, 1}` and `H < X` is of order `X^{1/3}·X^{1/2} = X^{5/6}`, so reducibility saves `X^{1/3}`.

- `g=x³` has `(I,J,H)=(0,0,0)` and is singular.

- `g=x³−xy²` has `(I,J,H)=(3,0,27)` and is reducible.

- `g=x³−2y³` is irreducible over `Q` and has `(I,J,H)=(0,54,729)`, fixing the sign in `J`.

- For a monic degree-three polynomial, composition with `X+k` preserves `I,J,H`; this is the `F_{ℤ,1}` invariance law.

<a id="orbits-with-large-stabilizer-are-negligible"></a>

**Orbits with large stabilizer are negligible.** For every `ε > 0` the number of `GL_2(ℤ)`-orbits of integral binary quartic forms `f` with `Δ(f) ≠ 0, H(f) < X` and `#Stab_{GL_2(ℚ)}(f) > 2` is `O_ε(X^{3/4+ε})`. In particular the same bound holds for the orbits whose stabiliser in `GL_2(ℤ)` is larger than `{±1}`.

The stabiliser is for the standard action; its image in `PGL_2(ℚ)` is nontrivial exactly when `#Stab_{GL_2(ℚ)}(f) > 2` When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, A nontrivial `PGL₂(Q)` stabilizer is a nonzero rational two-torsion point on the invariant elliptic curve, hence gives a reducible cubic resolvent. Count reducible monic resolvents by `O_epsilon(X^(1/2+epsilon/2))`. For each such resolvent of discriminant `O(X)`, use the uniform bound `O_epsilon(X^(1/4+epsilon/2))` from the fixed-resolvent theorem and the finite embedding fibre bound. Their product is `O_epsilon(X^(3/4+epsilon))`. The same conclusion for `GL₂(Z)` follows by quotienting its central subgroup `{±1}`.

*Needs:* [ArithmeticStatisticsPartII, stabilizer of a binary quartic is two torsion][AS-II-1], [ArithmeticStatisticsPartII, embedding into pairs of ternary quadratic forms][AS-II-2], [reducible monic binary cubic forms](#reducible-monic-binary-cubic-forms), [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], [ArithmeticStatisticsPartII, fibres of the embedding are uniformly bounded][AS-II-3], [quartic fixed reducible resolvent](#refinement-quartic-fixed-reducible-resolvent).

([[1]](#ref-1), Section 2.2, Lemma 2.4, printed p. 10; [[1]](#ref-1), Section 2.8, proof of Lemma 2.4, printed p. 21.)

**Checks.**

- The form `x^3y − xy^3` has stabiliser containing the rotation `(x, y) ↦ (−y, x)`, and its resolvent has the rational root corresponding to the 2-torsion point of `y^2 = x^3 − x`.

- Order check: `X^{3/4+ε}` is below the main term `X^{5/6}`.

- At `epsilon=1/24`, the exponent is `19/24<5/6`; at `epsilon=1/12` it equals `5/6`, so the lower-order consequence uses the strict smaller range.

<a id="binary-quartic-lattice-points-in-the-cusp"></a>

**Binary quartic lattice points in the cusp.** Let `C > 0` be such that `C^4` bounds the absolute values of all coefficients of all forms in `G_0·L^(i)`. Let `m ≥ 1` be an integer and `L′ = v_0 + mV_ℤ` a translate of the lattice `mV_ℤ`. For `u ∈ [−1/2, 1/2], t ≥ 3^{1/4}/√2, λ > 0` and `X > 0`, the number of points `(a, b, c, d, e) ∈ L′ ∩ B(n(u), t, λ, X)` with `a ≠ 0` (counted with multiplicity) is 0 if `Cλ < t`, and is `m^{−5}·Vol(B(n(u), t, λ, X)) + O(t^4λ^16)` if `Cλ ≥ t`, where the implied constant depends only on `G_0` and `L^(i)` (not on `m, v_0, u, t, λ, X`).

`C` exists by the boundedness of `L^(i)` ([fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits)) and the compactness of `G_0 m = 1, v_0 = 0` is Proposition 2.7 itself; the translate version is the one used in Section 2.5

For the proof, Coefficient ranges: `a(t)` multiplies the coefficient of `x^{4−k}y^k` by `t^{2k−4}, n(u)` with `|u| ≤ 1/2` adds to each coefficient a bounded linear combination of the preceding ones (whose ranges are smaller), and `λ` multiplies all by `λ^4`; so in `B(n, t, λ, X), |a|, |b|, |c|, |d|, |e|` are respectively `O(λ^4/t^4), O(λ^4/t²), O(λ^4), O(λ^4t²), O(λ^4t^4)`, with constants depending on `G_0`. The first coefficient is unchanged by `n(u)`, so the precise bound `|a|≤C^4λ^4/t^4` still holds; the later coefficients need enlarged constants. If `Cλ < t` then `|a| < 1`, so `a = 0` for every integral point. If `Cλ ≥ t` then all five ranges are bounded below by a positive constant and the range of a is the smallest up to a constant; every projection of `B` onto a coordinate subspace has volume at most a constant times the product of the four largest ranges, `O(λ^4/t^2·λ^4·λ^4t^2·λ^4t^4) = O(t^4λ^16)`, and scaling by `1/m` (to pass to the lattice L′) only decreases the projection volumes. `B(n, t, λ, X)` is a bounded semialgebraic multiset whose number of defining inequalities, their degrees and its maximum multiplicity are bounded in terms of `G_0` and `L^(i)` (it is a linear image of `G_0·L^(i) cut` by `H < X`); apply Davenport's lemma (requested from GeometryOfNumbersAndQuadraticArithmetic §4.1) to the image of `B` under `v ↦ (v − v_0)/m`, whose volume is `m^{−5}Vol(B)`. Davenport first counts all lattice points with the multiset multiplicity. Subtract those on `a=0`: their number is bounded by the product of one plus the four remaining coefficient ranges, hence `O(t^4 lambda^16)` when `t≤C lambda` and `t` has its fixed positive lower bound. The same argument is uniform for translated sublattices `mZ^5`. The volume must also use the same multiset multiplicity, not the volume of its support.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.1, [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits).

([[1]](#ref-1), Section 2.3, Proposition 2.7, printed p. 12; [[1]](#ref-1), Section 2.5, printed p. 14.)

**Checks.**

- Cusp mechanism: the region `t > Cλ` contains no integral point with `a ≠ 0`, so every integral point there has the factor `y` and is reducible.

- The projection bound drops the smallest range (that of a); for `a = 0` slices there is no such saving, which is why the `a = 0` points are removed as reducible.

<a id="averaging-over-the-fundamental-domain-and-cutting-the-cusp"></a>

**Averaging over the fundamental domain and cutting the cusp.** (a) For `i ∈ T` and every `ε > 0, N(V_ℤ^(i); X) = Vol(R_X(L^(i)))/n_i + O_ε(X^{3/4+ε})`, where `N(V_ℤ^(i); X)` is the number of `GL_2(ℤ)`-classes of irreducible integral binary quartic forms in `V_ℤ^(i)` of height `< X` and `R_X(L^(i)) := {w ∈ F·L^(i) : H(w) < X}` is the multiset over the strict domain `F`. (b) Cusp tail: there is `c = c(G_0)` such that for every `S ⊆ V_ℤ^(i)`, every `T ≥ 3^{1/4}/√2` and every `X ≥ 1, (1/(2C_{G_0}^(i))) ∫_{t > T} #{x ∈ S^irr ∩ B(n, t, λ, X)} t^{−2} du d^×t d^×λ ≤ c·X^{5/6}/T^2 + O(X^{3/4})`.

The error term `X^{3/4+ε}` is smaller than the main term `X^{5/6}` In (b) the bound is uniform in `S`; it is the form in which the cusp enters the uniformity estimate When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, By [averaging formula for binary quartic forms](#averaging-formula-for-binary-quartic-forms) with `S = V_ℤ^(i)`, and since `L^(i)` has height 1 and `G_0` has determinant `≥ 1`, the integrand vanishes unless `t ≤ Cλ` and `λ < X^{1/24}` ([binary quartic lattice points in the cusp](#binary-quartic-lattice-points-in-the-cusp); points with `a = 0` are reducible). Irreducible points `=` points with `a ≠ 0` minus reducible points with `a ≠ 0`: the latter contribute `O(X^{2/3+ε})` after integration ([reducible binary quartic forms in the main body](#reducible-binary-quartic-forms-in-the-main-body), uniform in `h ∈ G_0`). The averaged count differs from the number of classes by the classes with stabiliser larger than `{±1}` ([averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits)), `O(X^{3/4+ε})` of them ([orbits with large stabilizer are negligible](#orbits-with-large-stabilizer-are-negligible)). Replace the count of points with `a ≠ 0` by `Vol(B) + O(t^4λ^16)`: the error integrates to `∫^{X^{1/24}}∫^{Cλ} t^4λ^16 t^{−2} d^×t d^×λ = O(X^{3/4})`. Main term: `∫ Vol(B(n, t, λ, X)) t^{−2} du d^×t d^×λ` over all of `N′A′Λ` equals `2∫_{G_0} Vol(R_X(h·L)) dh` (unfold the integral over the full `SO_2(ℝ)` and use `∫_{K_+} dk = 1/2`), and `Vol(R_X(h·L)) = Vol(R_X(L))` for every `h`, because `F h·L` is `n_i` fundamental domains for every `h` ([orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets)). Dividing by `2C_{G_0}^(i) = 2n_i∫_{G_0} dh` gives `Vol(R_X(L))/n_i`. Remove the cuspidal part `t > Cλ` from the main term: `Vol(B) = O(λ^20)`, so `∫_{λ < X^{1/24}} ∫_{t > Cλ} λ^20 t^{−2} d^×t d^×λ = O(X^{3/4})`. (b) For `t > T`: the count is at most the number of points with `a ≠ 0`, i.e. `Vol(B) + O(t^4λ^16)` with `Vol(B) = O(λ^20)`; `∫_{t > T} t^{−2} d^×t ≤ T^{−2}/2` and `∫^{X^{1/24}} λ^20 d^×λ = X^{5/6}/20`, and the error term integrates to `O(X^{3/4})`.

*Needs:* [averaging formula for binary quartic forms](#averaging-formula-for-binary-quartic-forms), [reducible binary quartic forms in the main body](#reducible-binary-quartic-forms-in-the-main-body), [orbits with large stabilizer are negligible](#orbits-with-large-stabilizer-are-negligible), [binary quartic lattice points in the cusp](#binary-quartic-lattice-points-in-the-cusp), [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets), [averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits).

([[1]](#ref-1), Section 2.3, (18)-(20), printed p. 12; [[1]](#ref-1), Section 2.3, (20), printed p. 12.)

**Checks.**

- Cusp check: in the region `t > Cλ` the leading coefficient vanishes, so the cusp contributes only reducible points.

- Error-term check: `3/4 < 5/6`, so (a) is a genuine asymptotic once `Vol(R_X(L^(i))) ≍ X^{5/6}` is computed ([volume of the fundamental region for binary quartic forms](#volume-of-the-fundamental-region-for-binary-quartic-forms)).

- Multiplicity check: the division by `n_i` reflects that `F·L^(i)` is `n_i` fundamental domains; with the source's `F` (full `SO_2(ℝ)`) both the count and the volume double.

### 2.4 Quartic invariant volumes and main terms

<a id="jacobian-change-of-measure-for-binary-quartic-forms"></a>

**Jacobian change of measure for binary quartic forms.** Let `PGL_2(ℝ)` act on `V_ℝ` by the twisted action `γ·f := (det γ)^{−2} f((x, y)γ)`, let `ω` be the `ℤ`-normalised invariant form of [covolume of pgl2 z](#covolume-of-pgl2-z), `dv = da db dc dd de`, and for `i ∈ T` let `p^(i)` : `(I, J) ↦ p^(i)_{I,J} ∈ R^(i)` be the section of [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits). Then for every measurable `U ⊆ PGL_2(ℝ)` and every measurable `φ` : `V_ℝ → [0, ∞], ∫_{U·R^(i)} φ(v) dv = (1/27) ∫_{(I,J)} ∫_{g ∈ U} φ(g·p^(i)_{I,J}) ω(g) dI dJ`, the left side over the multiset `U·R^(i)` (multiplicity `#{(g, r) ∈ U × R^(i) : g·r = v}`) and the outer integral over `{4I^3 − J^2 > 0} (i ∈ {0, 2±})` or `{4I^3 − J^2 < 0} (i = 1)`. In particular this holds for `U = F_PGL2`.

The constant `1/27` is for the `ℤ`-basis `E_11, E_12, E_21` of `pgl_2(ℤ)`; a different normalisation of `ω` changes it Only the real case is planned here; the `p`-adic analogue (Proposition 3.7, with `|1/27|_p`) belongs to Layer 4

For the proof, Jacobian at the identity: for the polynomial section `s_{I,J} = x^3y − (I/3)xy^3 − (J/27)y^4` (which has invariants `(I, J)`, [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1]), the `5 × 5` determinant of the vectors `E_11·s, E_12·s, E_21·s, ∂s/∂I, ∂s/∂J` (infinitesimal twisted action; `E_11` acts by `f ↦ x∂_x f − 2f`) is `−1/27` identically in `(I, J)` (a direct computation, rechecked by computer algebra). Independence of the section and of the point: for `f` with `Δ(f) ≠ 0`, the orbit tangent vectors `E·f` span the kernel of `(dI, dJ)` at `f`, so `det[E_11·f, E_12·f, E_21·f, w_1, w_2]` with `(dI, dJ)(w_j) = e_j` depends only on `f`; it is invariant under `PGL_2(ℂ)` (the twisted action has determinant of absolute value 1 on `V`, and `Λ^3` of the adjoint action is trivial). Forms with equal invariants and `Δ ≠ 0` are `PGL_2(ℂ)`-equivalent ([ArithmeticStatisticsPartII, binary quartic parametrization of e mod 2e][AS-II-4] over `ℂ`, where every form is soluble and `E(ℂ)/2E(ℂ) = 0` (multiplication by 2 on a complex elliptic curve is surjective)), and `s_{I,J}` meets every such level set, so the determinant is `−1/27` at every `f` with `Δ(f) ≠ 0` and for every smooth section. Left translation by `g ∈ PGL_2(ℝ)` preserves `ω` and changes dv by `|det`(`g` acting on `V`)`| = 1`, so the Jacobian of `ψ(g, I, J) = g·p^(i)_{I,J}` has absolute value `1/27` everywhere. The explicit sections are smooth on finitely many pieces of the invariant region; along their joins a piecewise change of coordinates is required. On each smooth piece, the invertible Jacobian gives a local diffeomorphism. Cover by countably many open sets on which the map is injective, make them disjoint measurably, and apply `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`, then pass to nonnegative measurable functions by monotone approximation. The joins are lower-dimensional, hence null, and the finite fibres supply the stated multiplicity.

*Needs:* [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], [ArithmeticStatisticsPartII, binary quartic parametrization of e mod 2e][AS-II-4], [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [covolume of pgl2 z](#covolume-of-pgl2-z), [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms), `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` (Mathlib).

([[1]](#ref-1), Section 2.4, Proposition 2.8, printed p. 13; [[1]](#ref-1), Section 2.4, after Proposition 2.8, printed p. 13.)

**Checks.**

- Checks of the constant: over each `ℤ_p` the analogous computation gives `|1/27|_p` (the source's Section 3.4), and the product formula `∏_v |1/27|_v = 1` is what makes the global Tamagawa computation of Layer 4 consistent.

- The section of `L^(i)` differs from `s_{I,J}` by a `PGL_2(ℂ)`-valued function of `(I, J)`; the determinant does not see the difference.

<a id="volume-of-the-fundamental-region-for-binary-quartic-forms"></a>

**Volume of the fundamental region for binary quartic forms.** For `i ∈ T` let `R^(i)(X) := {r ∈ R^(i) : H(r) < X}`. Then `R_X(L^(i)) = F_PGL2·R^(i)(X)` as multisets, `Vol(R_X(L^(i))) = (2ζ(2)/27)·∫_{R^(i)(X)} dI dJ`, and `∫_{R^(i)(X)} dI dJ = (8/5)X^{5/6}` for `i ∈ {0, 2+, 2−}` and `(32/5)X^{5/6}` for `i = 1`. Hence `Vol(R_X(L^(i))) = (16/135)ζ(2)X^{5/6}` for `i ∈ {0, 2+, 2−}` and `(64/135)ζ(2)X^{5/6}` for `i = 1`.

`F` is the strict domain, whose image in `PGL_2(ℝ)` is `F_PGL2`; the `Λ`-coordinate of `F` is absorbed into `R^(i) = Λ·L^(i)`

For the proof, `F·L^(i) = N′A′K_+Λ·L^(i) = F_PGL2·(Λ·L^(i))` as multisets, since scalar matrices act on `V_ℝ` through `Λ` and the map `F → F_PGL2 × Λ` is a bijection for the strict domain. Apply [jacobian change of measure for binary quartic forms](#jacobian-change-of-measure-for-binary-quartic-forms) with `U = F_PGL2` and `φ` the indicator of `H < X`, and `Vol_ω(F_PGL2) = 2ζ(2)` ([covolume of pgl2 z](#covolume-of-pgl2-z)). Areas: `{(I, J) : H(I, J) < X, 4I^3 − J^2 > 0} = {0 < I < X^{1/3}, |J| < 2I^{3/2}}`, of area `∫_0^{X^{1/3}} 4I^{3/2} dI = (8/5)X^{5/6}`; the box `{|I| < X^{1/3}, |J| < 2X^{1/2}}` has area `8X^{5/6}`, so the part with `4I^3 − J^2 < 0` has area `8X^{5/6} − (8/5)X^{5/6} = (32/5)X^{5/6}`. Multiply: `(2ζ(2)/27)(8/5) = 16ζ(2)/135` and `(2ζ(2)/27)(32/5) = 64ζ(2)/135`.

*Needs:* [jacobian change of measure for binary quartic forms](#jacobian-change-of-measure-for-binary-quartic-forms), [covolume of pgl2 z](#covolume-of-pgl2-z), [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[1]](#ref-1), Section 2.4, (23)-(26), printed p. 13; [[1]](#ref-1), Section 2.4, (26), printed p. 13.)

**Checks.**

- Combined with (20): `(16/135)ζ(2)/4 = (4/135)ζ(2) (i = 0), (64/135)ζ(2)/2 = (32/135)ζ(2) (i = 1)`, and `(16/135)ζ(2)/4 = (4/135)ζ(2)` for each of `2±`, total `(8/135)ζ(2)` for `i = 2`.

- `H(I, J) < X` means `|I| < X^{1/3}` and `|J| < 2X^{1/2}`.

<a id="count-of-binary-quartic-forms-of-bounded-height"></a>

**Count of binary quartic forms of bounded height.** For every `ε > 0`: `N(V_ℤ^(0); X) = (4/135)ζ(2)X^{5/6} + O_ε(X^{3/4+ε})`; `N(V_ℤ^(1); X) = (32/135)ζ(2)X^{5/6} + O_ε(X^{3/4+ε})`; `N(V_ℤ^(2); X) = (8/135)ζ(2)X^{5/6} + O_ε(X^{3/4+ε})`, where `V_ℤ^(2) = V_ℤ^(2+) ⊔ V_ℤ^(2−)` and each of the two definite parts contributes `(4/135)ζ(2)X^{5/6}`. Equivalently, with `h^(i)(I, J)` the number of `GL_2(ℤ)`-classes of irreducible integral binary quartic forms with `4 − 2i` real roots and invariants `(I, J), Σ_{H(I,J) < X} h^(i)(I, J)` has the same asymptotics.

`Counting.quartic_count` states the unweighted class asymptotics for real root counts `4,2,0`, using the integral substitution quotient and the displayed invariant height.

Irreducible over `ℚ`; classes under `GL_2(ℤ)` (equivalently `PGL_2(ℤ)`, as `−1` acts trivially) Height `H(f) = max(|I(f)|^3, J(f)^2/4)` When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, Combine [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp) (a) with [volume of the fundamental region for binary quartic forms](#volume-of-the-fundamental-region-for-binary-quartic-forms) and `n_0 = n_{2±} = 4`, `n_1 = 2` ([stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms)). The reformulation: `Σ_{H(I,J) < X} h^(i)(I, J)` is `N(V_ℤ^(i); X)` by definition (every form of height `< X` has invariants of height `< X`).

*Needs:* [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [volume of the fundamental region for binary quartic forms](#volume-of-the-fundamental-region-for-binary-quartic-forms), [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms).

([[1]](#ref-1), Section 2, Theorem 2.1, printed p. 7; [[1]](#ref-1), Section 1.2, Theorem 1.6, printed p. 4.)

**Checks.**

- Main-term constants: `(4/135)ζ(2) ≈ 0.04874, (32/135)ζ(2) ≈ 0.38990, (8/135)ζ(2) ≈ 0.09748`.

- The error term `O(X^{3/4+ε})` is smaller than the main term `X^{5/6}`.

- Consistency with Theorem 1.8: dividing by the number of eligible invariant pairs gives `ζ(2)/2, ζ(2), ζ(2)` ([average number of classes per eligible invariant pair](#average-number-of-classes-per-eligible-invariant-pair)).

<a id="eligible-invariant-pairs-of-bounded-height"></a>

**Eligible invariant pairs of bounded height.** (a) The set of eligible pairs `(I, J) ∈ ℤ^2` (those occurring as the invariants of an integral binary quartic form) is the union of 9 distinct translates of the lattice `9ℤ × 27ℤ`. (b) Let `N^±_{I,J}(X)` be the number of eligible `(I, J)` with `H(I, J) < X` and `±(4I^3 − J^2) > 0`. Then `N^+_{I,J}(X) = (8/135)X^{5/6} + O(X^{1/2})` and `N^−_{I,J}(X) = (32/135)X^{5/6} + O(X^{1/2})`.

Eligibility is characterised by the congruences of Theorem 1.7, owned by [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1]

For the proof, (a) By Theorem 1.7, `(I, J)` is eligible iff `I ≡ 0 (mod 3)` and `J ≡ 0 (mod 27)`, or `I ≡ 1, 4, 7 (mod 9)` with `J ≡ ±2, ±16, ±7 (mod 27)` respectively. The first condition is 3 classes of `I mod 9` times 1 class of `J mod 27`; the others are `3·2 = 6` classes; 9 classes of `(I mod 9, J mod 27)` in all. (b) The region `R^±_{I,J}(X) = {(i, j) : |i| < X^{1/3}, |j| < 2X^{1/2}, ±(4i^3 − j^2) > 0}` is semialgebraic with bounded complexity and its coordinate projections have length `O(X^{1/2})`; Davenport's lemma (requested from GeometryOfNumbersAndQuadraticArithmetic §4.1) applied to each of the 9 translates of `9ℤ × 27ℤ` (index 243) gives `N^± = (9/243)Vol(R^±_{I,J}(X)) + O(X^{1/2})`. `Vol(R^+_{I,J}(X)) = (8/5)X^{5/6}` and `Vol(R^−_{I,J}(X)) = (32/5)X^{5/6}` (the areas of [volume of the fundamental region for binary quartic forms](#volume-of-the-fundamental-region-for-binary-quartic-forms), computed there by elementary integration); `(1/27)(8/5) = 8/135` and `(1/27)(32/5) = 32/135`.

*Needs:* [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[1]](#ref-1), Section 2.4, Lemma 2.9 and Proposition 2.10 with proof, printed p. 14; [[1]](#ref-1), Proof of Proposition 2.10, printed p. 14.)

**Checks.**

- `(I, J) = (−2, ±7)` are eligible `(I ≡ 7 mod 9, J ≡ ±7 mod 27)` with `Δ = −3`, and they are the eligible pairs with `Δ ≠ 0` of smallest height, `49/4`; `(1, 2)` is eligible (realised by `x^3y − x^2y^2`) but has `Δ = 0` and is excluded from both counts; `(1, 1)` is not eligible.

- The density of eligible pairs is `9/243 = 1/27`, the factor that turns the areas `8/5` and `32/5` into `8/135` and `32/135`.

<a id="average-number-of-classes-per-eligible-invariant-pair"></a>

**Average number of classes per eligible invariant pair.** For `i = 0, 1, 2, lim_{X→∞} (Σ_{H(I,J) < X} h^(i)(I, J)) / #{eligible (I, J) : (−1)^i(4I^3 − J^2) > 0, H(I, J) < X} = 2ζ(2)/n_i`, with `n_0 = 4`, `n_1 = 2` and `n_2 = 2` (the definite forms of both signs counted together).

`h^(i)(I, J)` counts classes of irreducible integral forms with `4 − 2i` real roots; for `i = 2` both definite loci are included, so the effective `n_2` is 2, not `n_{2±} = 4`

For the proof, Divide the counts of [count of binary quartic forms of bounded height](#count-of-binary-quartic-forms-of-bounded-height) by those of [eligible invariant pairs of bounded height](#eligible-invariant-pairs-of-bounded-height): `(4/135)ζ(2)/(8/135) = ζ(2)/2, (32/135)ζ(2)/(32/135) = ζ(2)` and `(8/135)ζ(2)/(8/135) = ζ(2)`.

*Needs:* [count of binary quartic forms of bounded height](#count-of-binary-quartic-forms-of-bounded-height), [eligible invariant pairs of bounded height](#eligible-invariant-pairs-of-bounded-height).

([[1]](#ref-1), Section 1.2, Theorem 1.8, printed p. 5.)

**Checks.**

- The averages are `ζ(2)/2 ≈ 0.822` (four real roots) and `ζ(2) ≈ 1.645` (fewer than four).

- `n_2 = 2` here is consistent with `n_{2±} = 4`: each eligible `(I, J)` with `Δ > 0` carries one orbit of each definiteness.

### 2.5 Quartic congruence counts and the infinite sieve

<a id="binary-quartic-counts-with-finitely-many-congruence-conditions"></a>

**Binary quartic counts with finitely many congruence conditions.** (a) Let `m ≥ 1` and let `L_j = v_j + mV_ℤ` be a translate of `mV_ℤ`. Then `N(L_j ∩ V_ℤ^(i); X) = Vol(R_X(L^(i)))/(n_i m^5) + O_ε(X^{3/4+ε})`, the implied constant independent of `m` and `v_j` (`N` the averaged count). (b) If `S ⊆ V_ℤ` is defined by congruence conditions modulo `m`, i.e. a union of `k` translates of `mV_ℤ`, then `N(S ∩ V_ℤ^(i); X) = k·Vol(R_X(L^(i)))/(n_i m^5) + O_{S,ε}(X^{3/4+ε})`. (c) If the allowed residues of `S` form the CRT product of local allowed sets at finitely many distinct prime powers, then `N(S ∩ V_ℤ^(i); X) = N(V_ℤ^(i); X)·∏_p μ_p(S) + O_{S,ε}(X^{3/4+ε})`, where `μ_p(S)` is the `p`-adic density of [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

In (c) the implied constant depends on `S` (through `k`) For `GL_2(ℤ)`-invariant `S` the averaged count is the class count up to `O(X^{3/4+ε})`

For the proof, (a) Repeat the proof of [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp) with `S = L_j`: by the translate version of [binary quartic lattice points in the cusp](#binary-quartic-lattice-points-in-the-cusp) the points with `a ≠ 0` number 0 for `Cλ < t` and `m^{−5}Vol(B) + O(t^4λ^16)` otherwise, with the constant independent of `m`; the reducible points and the large-stabiliser classes contribute `O(X^{3/4+ε})` as before (they are a subset of those of `V_ℤ`). (b) Sum over the `k` translates. (c) By the Chinese remainder theorem `k·m^{−5} = ∏_p μ_p(S)` because the allowed residue set is a Cartesian product under CRT, with `m` the product of the distinct prime powers involved; combine with [count of binary quartic forms of bounded height](#count-of-binary-quartic-forms-of-bounded-height).

*Needs:* [averaged count of binary quartic orbits](#averaged-count-of-binary-quartic-orbits), [averaging formula for binary quartic forms](#averaging-formula-for-binary-quartic-forms), [binary quartic lattice points in the cusp](#binary-quartic-lattice-points-in-the-cusp), [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [count of binary quartic forms of bounded height](#count-of-binary-quartic-forms-of-bounded-height), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[1]](#ref-1), Section 2.5, (27), printed p. 14; [[1]](#ref-1), Section 2.5, Theorem 2.11, printed p. 14.)

**Checks.**

- `S = V_ℤ (m = 1, k = 1)` recovers Theorem 2.1.

- For `S =` {`f` : `p | a(f)`} `(m = p, k = p^4), μ_p(S) = 1/p` and the count is `N(V_ℤ^(i); X)/p + O(X^{3/4+ε})` for fixed `p`.

- For `S` defined by `a(f) mod6` in `{0,1,5}`, the global density is `1/2` whereas its projections `mod2` and `mod3` are both full. Part (b) applies, but the product-of-local-closures formula does not. This tests the added product hypothesis in (c).

<a id="weighted-binary-quartic-counts-with-finitely-many-congruence-conditions"></a>

**Weighted binary quartic counts with finitely many congruence conditions.** Let `p_1, …, p_k` be distinct primes and, for each `j`, let `φ_{p_j}` : `V_ℤ → ℝ` be `GL_2(ℤ)`-invariant and depend only on `f mod p_j^{a_j}`. Put `φ := ∏_j φ_{p_j}` and let `N_φ(V_ℤ^(i); X)` be the number of irreducible `GL_2(ℤ)`-orbits in `V_ℤ^(i)` of height `< X`, each orbit `GL_2(ℤ)·f` counted with weight `φ(f)`. Then `N_φ(V_ℤ^(i); X) = N(V_ℤ^(i); X)·∏_{j=1}^k ∫_{V_{ℤ_{p_j}}} φ̃_{p_j}(f) df + O(X^{3/4+ε})`, where `φ̃_{p_j}` is the locally constant extension of `φ_{p_j}` to `V_{ℤ_{p_j}}`, `df` is the Haar probability measure, and the implied constant depends only on the `φ_{p_j}` and `ε`.

Finitely many primes and finitely many residue conditions The weights are `GL_2(ℤ)`-invariant so that `N_φ` counts orbits

For the proof, `φ` is a finite linear combination `Σ_c φ(c)·1_{c}` of indicator functions of residue classes `c` modulo `m = ∏ p_j^{a_j}`; each class is a translate of `mV_ℤ`. Apply part (a) of [binary quartic counts with finitely many congruence conditions](#binary-quartic-counts-with-finitely-many-congruence-conditions) to each class and sum; `Σ_c φ(c) m^{−5} = ∏_j ∫ φ̃_{p_j} df` by the Chinese remainder theorem. The averaged count of an invariant weighted set equals the weighted class count up to the `O(X^{3/4+ε})` large-stabiliser classes.

*Needs:* [binary quartic counts with finitely many congruence conditions](#binary-quartic-counts-with-finitely-many-congruence-conditions), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[1]](#ref-1), Section 2.5, Theorem 2.12, printed p. 15.)

**Checks.**

- `φ ≡ 1` recovers Theorem 2.1; `φ = 1_S` recovers Theorem 2.11.

<a id="uniformity-for-strongly-divisible-quartic-discriminants"></a>

**Uniformity for strongly divisible quartic discriminants.** Let `B_0 ⊂ V_ℝ` be compact and let `Y_4 = V(Δ, ∂Δ/∂e) ⊆ 𝔸^5_ℤ`. There is `C = C(B_0)` such that for all `X ≥ 1` and `M ≥ 2, #{f ∈ X^{1/6}B_0 ∩ V_ℤ : f mod p ∈ Y_4(𝔽_p) for some prime p > M} ≤ C·(X^{5/6}/(M log M) + X^{2/3})`. In particular `#(X^{1/6}B_0 ∩ ⋃_{p>M} W_p^(1)(V)) ≤ C·(X^{5/6}/(M log M) + X^{2/3})`. The source uses the bounded, generally nonclosed set `B_src = F^(ε)_PGL2·R^(i)(1)`, where `F^(ε)_PGL2 ⊂ F_PGL2` is cut off at a height `t ≤ T_ε` chosen so that `Vol(F^(ε)_PGL2) = (1 − ε)Vol(F_PGL2)`; then `X^{1/6}B_src = F^(ε)_PGL2·R^(i)(X)`. Apply the compact-set bound to the closure of `B_src`; `B_src` itself need not be compact.

`B_0` compact; the constant depends on `B_0` (for the source's region, on `ε`) `W_p^(1)(V) ⊆ {f : f mod p ∈ Y_4(𝔽_p)}` is the inclusion of [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus); the larger set is what is bounded

For the proof, `Y_4` has codimension 2 in `𝔸^5_ℤ` ([discriminant loci of codimension two](#discriminant-loci-of-codimension-two)). Apply [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve) with `n = 5, k = 2, B = B_0, r = X^{1/6}`: `r^n/(M^{k−1} log M) = X^{5/6}/(M log M)` and `r^{n−k+1} = X^{4/6} = X^{2/3}`. The second statement by part (a) of [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus). `F^(ε)_PGL2·R^(i)(X) = X^{1/6}·(F^(ε)_PGL2·R^(i)(1))` because `H(c·f) = c^6 H(f)` for scalars `c > 0`, and `F^(ε)_PGL2·R^(i)(1)` is bounded (`t` is bounded above on `F^(ε)` and the coefficients of `R^(i)(1)` are bounded).

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus), [discriminant loci of codimension two](#discriminant-loci-of-codimension-two), [fundamental sets for real binary quartic orbits](#fundamental-sets-for-real-binary-quartic-orbits), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[1]](#ref-1), Section 2.6, Theorem 2.18, printed p. 17; [[1]](#ref-1), Section 2.6, after Theorem 2.18, printed p. 18.)

**Checks.**

- The forms with `f mod p` of splitting type `(1^3 1), (1^2 1^2), (2^2), (1^4)` or `f ∈ pV_ℤ` (for `p ≥ 3`) are the strongly divisible ones; the larger set counted also contains weakly divisible forms whose double root `mod p` is at `[1 : 0]`, such as `25x^4 + x^2y^2 + y^4` for `p = 5`.

- The bound is used with `M` fixed and `X → ∞`: the term `X^{2/3}` is then negligible against `X^{5/6}`.

<a id="quartic-field-weak-transport"></a>

**Quartic-field weak transport.** Uniformly for primes `p` and `X≥1`, the number of ternary-pair orbits whose quartic algebra is a field, with `0<|Disc|<X` and weak `p²`-divisibility, is `O(X/p²)`. A smooth discriminant reduction has one double geometric point and two simple points. At an odd prime a maximal order with this reduction is simply tamely ramified and has discriminant valuation one; weak square divisibility therefore forces nonmaximality. At 2 the discriminant polynomial is a square modulo 2, so weak divisibility is empty. Apply the `S4` nonmaximal tail and the separate non-`S4` maximal-field/suborder estimate. This proves the field assertion with cubic-resolvent multiplicity, including reducible resolvents.

*Needs:* [quartic nonmaximal overramified tail](#refinement-quartic-nonmaximal-overramified-tail), [non-S4 quartic maximal fields](#non-s4-quartic-maximal-fields), [quartic maximal-order suborders](#quartic-maximal-order-suborders), ArithmeticStatisticsPartII's quartic ring dictionary and maximality criterion. Sources: [[1]](#ref-1), Theorem 2.19 and (37), p.18; [[77]](#ref-77), Proposition 23 pp.1056–1058 for `S4` only, with the preceding separate field estimates.

**Checks.**

- An irreducible binary quartic maps to a field algebra because the conic intersection and its four roots are isomorphic Galois sets; a reducible quartic has no such transitivity implication.
- For coprime positive fundamental discriminants `D_K,D_L≡1 mod20`, the ring `(Z+5O_K)×O_L` has discriminant `25D_KD_L` and reduction `F_5[epsilon]/epsilon²×F_5²`. These product algebras are excluded: varying the two discriminants gives order `X log X` pairs below `X` at this fixed prime. The local pencil `A=xy,B=z²−x²−c y²` has discriminant `16c`, whose `c` derivative is a unit at 5, so the weak condition does not remove this boundary example.
- If `p²≥X`, the counted set is empty, since its nonzero integral discriminant has absolute value at least `p²`.

<a id="weakly-divisible-quartic-discriminants-via-ternary-pairs"></a>

**Weakly divisible quartic discriminants via ternary pairs.** There is an absolute constant `C` such that for every prime `p` and every `X ≥ 1`, the number of `GL_2(ℤ)`-classes of irreducible integral binary quartic forms `f ∈ W_p^(2)(V)` with `H(f) < X` is at most `C·X/p^2`.

Use the [quartic-field weak transport estimate](#quartic-field-weak-transport). The quartic algebra of the embedded irreducible binary quartic is a field: the four intersection points on the fixed smooth conic are the Veronese images of its four roots, equivariantly for the Galois action. Transitivity therefore gives a degree-four field algebra. Non-`S4` fields are included; products of quadratic algebras are excluded. The estimate is uniform in both `p` and `X`; the integral quartic-to-pair embedding has the stated fibre bound at most 24.

For the proof, The map `φ` of (30) sends `f` to `(A_1, B_f) ∈ W_ℤ`, preserves the discriminant, and induces `ψ` : `PGL_2(ℤ)\V_ℤ → (GL_2(ℤ) × SL_3(ℤ))\W_ℤ` with fibres of size at most 24 over elements of nonzero discriminant (Theorem 2.14 and Proposition 2.16, [ArithmeticStatisticsPartII, fibres of the embedding are uniformly bounded][AS-II-3]). `φ` is affine-linear in `f` with `φ(f + pg) − φ(f) = (0, p·B_g)`, so if `Δ(f + pg)` is not divisible by `p^2` for some `g`, the same perturbation shows `Δ_W(φ(f))` is not strongly divisible: `φ` maps `W_p^(2)(V)` into `W_p^(2)(W)` (definitions of [strongly and weakly divisible values](#strongly-and-weakly-divisible-values)). `H(f) < X` implies `|Δ(f)| = |4I^3 − J^2|/27 ≤ (4|I|^3 + J^2)/27 ≤ 8H(f)/27 < X`. Theorem 2.19: the number of `GL_2(ℤ) × SL_3(ℤ)`-orbits on `W_p^(2)(W)` whose quartic algebra is a field and with `0<|Δ| < X` is `O(X/p^2)` with the constant independent of `p` (the quartic-field weak transport estimate); multiply by 24.

*Needs:* [ArithmeticStatisticsPartII, embedding into pairs of ternary quadratic forms][AS-II-2], [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [ArithmeticStatisticsPartI, invariants height and eligible pairs][AS-I-1], [ArithmeticStatisticsPartII, fibres of the embedding are uniformly bounded][AS-II-3], [quartic-field weak transport](#quartic-field-weak-transport).

([[1]](#ref-1), Section 2.6, Theorem 2.19 and (37), printed p. 18.)

**Checks.**

- For `p>X^{1/2}` the set is empty: irreducibility implies `Δ(f)≠0`, while `p²|Δ(f)` gives `p²≤|Δ(f)|<X`. This follows from the discriminant inequality, not by dropping the unspecified constant in `O(X/p²)`.

- The transport uses only that `φ` preserves the discriminant and is affine in `f`; no information about the strongly divisible part of `W_ℤ` is needed, because `W_p^(1)(V)` is handled by the geometric sieve.

- `x⁴−2y⁴` is irreducible and its conic intersection gives the same quartic field `Q(2^(1/4))`, whose closure has group `D4`; the field comparison is not confined to `S4`.

- `(x²−5y²)(x²−13y²)` is reducible and its étale root algebra is a product of quadratic fields, outside this irreducible-form count.

<a id="uniformity-for-weakly-divisible-quartic-discriminants"></a>

**Uniformity for weakly divisible quartic discriminants.** Let `W′_p := {f ∈ V_ℤ : p^2 | Δ(f), p ∤ ∂Δ/∂e(f)}`, a subset of `W_p^(2)(V)`. Let `B_0 ⊂ V_ℝ` be compact. (a) There is `C = C(B_0)` with `#(X^{1/6}B_0 ∩ W′_p) ≤ C·(X^{5/6}/p^2 + X^{2/3})` for every prime `p` and `X ≥ 1`. (b) If moreover every irreducible `GL_2(ℤ)`-orbit meets `X^{1/6}B_0` in at most `c_0` points (counted with multiplicity), then `#(X^{1/6}B_0 ∩ V_ℤ^irr ∩ ⋃_{p>M} W′_p) ≤ C′·(X^{5/6}/(M log M) + X^{5/6}/log X)` for all `X ≥ 2` and `M ≥ 2`, with C′ depending on `B_0` and `c_0` only. Together with [uniformity for strongly divisible quartic discriminants](#uniformity-for-strongly-divisible-quartic-discriminants) this bounds the whole irreducible part `X^{1/6}B_0 ∩ V_ℤ^irr ∩ ⋃_{p>M} W_p(V)`, since `W_p(V) ⊆ W′_p ∪ {f : f mod p ∈ Y_4(𝔽_p)}`.

The source states the bound for `W_p^(2)(V)` and asserts `p ∤ ∂Δ/∂e` on it; that assertion is false, and the forms of `W_p^(2)(V)` with `p | ∂Δ/∂e` are covered by the geometric sieve instead The orbit-multiplicity hypothesis in (b) holds for the source's region `F^(ε)·R^(i)(X)` and for the truncated regions used in the proof of Theorem 2.13

For the proof, `W′_p ⊆ W_p^(2)(V)`: `p ∤ ∂Δ/∂e(f)` excludes strong divisibility ([strongly and weakly divisible values](#strongly-and-weakly-divisible-values), gradient characterisation). (a) `X^{1/6}B_0` has sides of length `O(X^{1/6})`, so there are `O(X^{4/6})` quadruples `(a_0, b_0, c_0, d_0)`. For fixed ones, `Δ(a_0, b_0, c_0, d_0, e) mod p` is a polynomial in `e` of degree `≤ 3` ([discriminant loci of codimension two](#discriminant-loci-of-codimension-two)); the residues `e mod p` with `p | Δ` and `p ∤ ∂Δ/∂e` are simple roots of a nonzero polynomial, at most 3 of them, and each lifts to exactly one class `e mod p^2` with `p^2 | Δ` (Hensel's lemma for a simple root). An interval of length `O(X^{1/6})` contains at most `O(X^{1/6}/p^2 + 1)` integers in a class `mod p^2`. (b) For `M < p < X^{1/6}` use (a): `Σ_{p>M} X^{5/6}/p^2 = O(X^{5/6}/(M log M))` and `Σ_{p<X^{1/6}} X^{2/3} = O(X^{5/6}/log X)` by [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums). For `p ≥ X^{1/6}` use [weakly divisible quartic discriminants via ternary pairs](#weakly-divisible-quartic-discriminants-via-ternary-pairs): the irreducible points of `W′_p ⊆ W_p^(2)(V)` in the region lie in at most `C X/p^2` classes (the region has height `≤ c·X`), each contributing at most `c_0` points, and `Σ_{p ≥ X^{1/6}} X/p^2 = O(X^{5/6}/log X)`.

*Needs:* [weakly divisible quartic discriminants via ternary pairs](#weakly-divisible-quartic-discriminants-via-ternary-pairs), [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [discriminant loci of codimension two](#discriminant-loci-of-codimension-two).

([[1]](#ref-1), Section 2.6, Theorem 2.20, printed p. 18; [[1]](#ref-1), Proof of Theorem 2.20, printed p. 18.)

**Checks.**

- The source's bound `O(X^{5/6}/log M)` follows from (b) when `M ≤ X^{1/6}`, because then `1/log X ≤ 1/(6 log M)`; for `M > X^{1/6}` only the second step applies and gives `O(X/(M log M))`, which is `O(X^{5/6}/log M)`.

- The form `25x^4 + x^2y^2 + y^4` lies in `W_5^(2)(V)` but not in `W′_5`; it lies in `Y_4(𝔽_5)` modulo 5.

<a id="uniformity-estimate-for-infinitely-many-congruence-conditions"></a>

**Uniformity estimate for infinitely many congruence conditions.** For a prime `p` let `W_p(V) := {f ∈ V_ℤ : p^2 | Δ(f)}`. There are constants `c` (absolute, given `G_0`) and `C_T` (for each `T ≥ 3^{1/4}/√2`, independent of `M`) such that for every `M ≥ 2` and every `T, lim sup_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} ≤ C_T/(M log M) + c/T^2`. Consequently `lim_{M→∞} lim sup_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} = 0`: for every `δ > 0` there is `M_δ` with `lim sup_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} < δ` for all `M ≥ M_δ`. Here `N` is the number of `GL_2(ℤ)`-classes of irreducible forms of height `< X` (equivalently the averaged count, up to `O(X^{3/4+ε})`), summed over `i ∈ T`.

The source states `lim_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} = O(1/log M)` with an implied constant independent of `M`; its proof does not track how the constants of Theorems 2.18 and 2.20 depend on the cut-off `ε`, which the rate needs, while the sieve (Theorem 2.21) uses only the limit statement proved here The statement is about orbit counts, not lattice-point counts; the limits are in `X` first, then `M`

For the proof, Apply [averaging formula for binary quartic forms](#averaging-formula-for-binary-quartic-forms) to `S := V_ℤ^(i) ∩ ⋃_{p>M} W_p(V)` and split the integral at `t = T`. `t > T`: at most `c·X^{5/6}/T^2 + O(X^{3/4})` by part (b) of [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp). `t ≤ T`: every `B(n, t, λ, X)` with `t ≤ T` lies in `Ω_T(X) := X^{1/6}·Ω_T`, where `Ω_T := ⋃_{|u| ≤ 1/2, t_0 ≤ t ≤ T, λ ≤ 1} n(u)a(t)λG_0·L^(i)` is bounded (take its compact closure for the lattice-point estimates) `(H(λ·f) = λ^24 H(f))`. For each `x` the set `{(u, t, λ) : x ∈ B(n(u), t, λ, X)}` has measure at most a constant depending on `G_0` (it is contained in finitely many translates `g_x Stab(x_L)G_0^{−1}` of `G_0^{−1}`, [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms)), so the `t ≤ T` part is at most `c′·#(S^irr ∩ Ω_T(X))`; every `GL_2(ℤ)`-orbit meets `Ω_T(X)` in boundedly many points ([orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets)). To justify the orbit bound, project the truncated matrix set `N_{|u|≤1/2} A_{t_0≤t≤T} G_0` to `PGL2(R)`; it is compact. The modular tessellation is locally finite, so it is covered by finitely many `GL2(Z)`-translates of the Gauss region, with a uniform finite boundary multiplicity. Absorb positive scalar factors into `R^(i)`. Each orbit therefore contributes at most a constant depending on `T,G_0`, including on the boundary. One cannot infer this merely by taking an uncountable union of the fixed-`h` multiplicity assertions. Split `S ⊆ {f mod p ∈ Y_4(𝔽_p) for some p > M} ∪ ⋃_{p>M} W′_p` (for `f ∈ W_p(V)` either `p | ∂Δ/∂e(f)`, and then `f mod p ∈ Y_4(𝔽_p)`, or `f ∈ W′_p`). The first part is `O_T(X^{5/6}/(M log M) + X^{2/3})` by [uniformity for strongly divisible quartic discriminants](#uniformity-for-strongly-divisible-quartic-discriminants) with `B_0 = Ω_T`; the second is `O_T(X^{5/6}/(M log M) + X^{5/6}/log X)` by [uniformity for weakly divisible quartic discriminants](#uniformity-for-weakly-divisible-quartic-discriminants). Divide by `X^{5/6}`, let `X → ∞`, sum over the four values of `i`; then let `T → ∞` after `M → ∞` (choose `T` with `c/T^2 < δ/2`, then `M` with `C_T/(M log M) < δ/2`).

*Needs:* [averaging formula for binary quartic forms](#averaging-formula-for-binary-quartic-forms), [averaging over the fundamental domain and cutting the cusp](#averaging-over-the-fundamental-domain-and-cutting-the-cusp), [uniformity for strongly divisible quartic discriminants](#uniformity-for-strongly-divisible-quartic-discriminants), [uniformity for weakly divisible quartic discriminants](#uniformity-for-weakly-divisible-quartic-discriminants), [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus), [stabilizers of real binary quartic forms](#stabilizers-of-real-binary-quartic-forms), [orbit multiplicities in fundamental multisets](#orbit-multiplicities-in-fundamental-multisets).

([[1]](#ref-1), Section 2.6, Theorem 2.13, printed p. 15; [[1]](#ref-1), Section 2.6, proof of Theorem 2.13, printed p. 18.)

**Checks.**

- Interchange check: the uniformity needed to interchange the sieve and height limits is supplied by this statement: the bound on `lim sup_X` is uniform in the set of congruence conditions imposed at primes `≤ M`.

- Order check: the tail is `o(1)·X^{5/6}` as `M → ∞`; for fixed `M` it is of the same order `X^{5/6}` as the main term, so it cannot be dropped.

- Squarefree-discriminant application: excluding `⋃_p W_p(V)` leaves the forms of squarefree discriminant, counted by [squarefree sieve for binary quartic forms](#squarefree-sieve-for-binary-quartic-forms).

<a id="squarefree-sieve-for-binary-quartic-forms"></a>

**Squarefree sieve for binary quartic forms.** Let `φ` : `V_ℤ → [0, 1]` be acceptable (for `Δ`) and defined by congruence conditions via local functions `φ_p` : `V_{ℤ_p} → [0, 1]` ([ArithmeticStatisticsPartI, acceptable weight function][AS-I-2]), with each `φ_p` invariant under `GL_2(ℤ)`. For `i ∈ T` let `N_φ(V_ℤ^(i); X)` be the number of irreducible `GL_2(ℤ)`-orbits in `V_ℤ^(i)` of height `< X`, each orbit `GL_2(ℤ)·f` counted with weight `φ(f)`. Then `N_φ(V_ℤ^(i); X) = N(V_ℤ^(i); X)·∏_p ∫_{V_{ℤ_p}} φ_p(f) df + o(X^{5/6})`, and the Euler product converges.

`Counting.quartic_acceptable_sieve` states the weighted infinite sieve. `Counting.AcceptableBinaryWeight` expresses the local range, substitution invariance, constancy off a closed null set and eventual good-discriminant condition on the native coefficient lattices.

Acceptability: `φ_p = 1` on `{p^2 ∤ Δ}` for all large `p GL_2(ℤ)`-invariance of the `φ_p` makes `N_φ` an orbit count; the source uses it implicitly ('with notation as in Theorem 2.12')

For the proof, For `n≥1`, define `psi_{p,n}` and `psiPrime_{p,n}` as the infimum and supremum of `phi_p` on each residue cylinder modulo `p^n`. These are actual pointwise lower and upper bounds, including on the exceptional null set, and they converge to `phi_p` at every point where `phi_p` is locally constant. They inherit `GL2(Z)`-invariance because that action permutes the cylinders. Bounded convergence gives convergence of their integrals. Do not assert a lower bound `psi_{p,0}=1≤phi_p`. For sufficiently large `p` and `n≥2`, a residue cylinder not meeting `{p²|Δ}` lies entirely in the region `phi_p=1`, so both approximants equal one there. Level `n=1` is insufficient for a condition modulo `p²`. In particular acceptability and the local `O(p^{-2})` density bound imply convergence of `product_p integral(phi_p)`. Fix `M` above the acceptability threshold. For the finitely many primes `p≤M`, take cylinder approximants of level `n` and use the weighted finite-congruence count. The global product `phi` is at most the product of the upper approximants. The product of the lower approximants is at most `phi` outside the tail `union_{p>M} W_p`, so subtract that tail count for the lower bound. First take `limsup` or `liminf` as `X→∞`, next `n→∞` with `M` fixed. This gives upper and lower bounds involving the finite product of the actual local masses and an error bounded by the uniform tail `delta(M)`. Finally let `M→∞`: the finite products converge and `delta(M)→0`. This order of limits avoids the false assertion that level `floor(Y/p)` always resolves a `p²` condition. The unweighted leading constant exists by count-of-binary-quartic-forms-of-bounded-height. The stabilizer correction is negligible since the weights lie in `[0,1]`.

*Needs:* [weighted binary quartic counts with finitely many congruence conditions](#weighted-binary-quartic-counts-with-finitely-many-congruence-conditions), [uniformity estimate for infinitely many congruence conditions](#uniformity-estimate-for-infinitely-many-congruence-conditions), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2], [local density of values divisible by p squared](#local-density-of-values-divisible-by-p-squared), [discriminant loci of codimension two](#discriminant-loci-of-codimension-two), [count of binary quartic forms of bounded height](#count-of-binary-quartic-forms-of-bounded-height).

([[1]](#ref-1), Section 2.7, Theorem 2.21, printed p. 19; [[1]](#ref-1), Proof of Theorem 2.21, (44)-(45), printed pp. 19-20.)

**Checks.**

- Squarefree discriminants: `φ = 1_{Δ squarefree}, φ_p = 1_{p^2 ∤ Δ}`; the proportion of irreducible classes with squarefree discriminant is `∏_p μ_p{p^2 ∤ Δ}`.

- For `φ` defined by finitely many congruence conditions the theorem reduces to Theorem 2.12 with error `O(X^{3/4+ε})`; for infinitely many conditions only `o(X^{5/6})` is claimed.

- Layer 4 applies it with the weight `1/m(f)` times local solubility, which is acceptable by Bhargava-Shankar Proposition 3.18.

- At a null exceptional point the cylinder infimum/supremum still bound the actual value, even if convergence there fails. At `p∈(Y/2,Y], floor(Y/p)=1` does not resolve `p²` divisibility; the proof uses fixed finite primes followed by `n→∞` instead.

### 2.6 Cubic fundamental regions and finite congruences

<a id="real-orbits-and-stabilizers-of-binary-cubic-forms"></a>

**Real orbits and stabilizers of binary cubic forms.** Let `U_ℝ` be the space of real binary cubic forms `f = ax^3 + bx^2y + cxy^2 + dy^3` with the twisted action `γ·f := (det γ)^{−1} f((x, y)γ)` of `GL_2(ℝ)` (the action (9) of [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5]), and `Disc(f) = b^2c^2 − 4ac^3 − 4b^3d − 27a^2d^2 + 18abcd`. (a) `Disc(γ·f) = (det γ)^2 Disc(f)`, and the scalar matrix `λ·1` acts by `f ↦ λf`. (b) `U_ℝ^(0) := {Disc > 0}`, the forms with three distinct real roots in `ℙ^1(ℝ)`, and `U_ℝ^(1) := {Disc < 0}`, the forms with one real root and a pair of complex conjugate roots, are each a single `GL_2(ℝ)`-orbit. (c) The stabiliser in `GL_2(ℝ)` of `f ∈ U_ℝ^(0)` has order `n_0 := 6` and acts on the three roots as the full symmetric group; the stabiliser of `f ∈ U_ℝ^(1)` has order `n_1 := 2`. Put `U_ℤ^(i) := U_ℝ^(i) ∩ U_ℤ`.

**Supplier ownership.** [AnalyticNumberTheoryPartII][AN-II-2] §5.5 supplies the real local types and stabilizer orders; the real sign-region notation below is the counting adapter. The detailed contract and Checks are retained below for the specialization.

The twisted action `(det gamma)^{-1}` is the Delone–Faddeev action; the untwisted scalar action would be `lambda³` instead of `lambda`, although over `R` the stabilizer orders are still 6 and 2 because every nonzero real scalar has a unique real cube root. Only forms with `Disc ≠ 0` are in `U_ℝ^(0) ∪ U_ℝ^(1)`

For the proof, (a) `Disc` is homogeneous of degree 4 and relatively invariant of weight 6 under substitution, `Disc(f((x, y)γ)) = (det γ)^6 Disc(f)`; the factor `(det γ)^{−1}` multiplies `Disc` by `(det γ)^{−4}`. For `λ·1`: `f((x, y)λ)/λ^2 = λf`. (b) Roots: by `Cubic.discr_eq_prod_three_roots` (after moving a root away from `[1 : 0]` if `a = 0`), `Disc > 0` iff the three roots are real and distinct, and `Disc < 0` iff one is real and two are complex conjugate. `PGL_2(ℝ)` is simply 3-transitive on `ℙ^1(ℝ)`, and transitive on pairs (real point, conjugate pair) (move the pair to `±i`, then rotate by the stabiliser `SO_2(ℝ)` of `i`, which is transitive on `ℙ^1(ℝ)`). A form is determined by its roots up to a nonzero scalar, and the scalars `λ·1` realise every scalar factor by (a). (c) An element of the stabiliser permutes the roots; the map to permutations is injective (an element fixing three points of `ℙ^1` is a scalar `λ·1`, which fixes `f` only for `λ = 1`). Every permutation of three real roots is induced by a unique class in `PGL_2(ℝ)`, and exactly one scalar multiple of a representative fixes `f`; for one real root and a conjugate pair, only the identity and the swap of the pair preserve the real structure, and the swap is realised by a reflection.

*Needs:* [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5], `Cubic.discr_eq_prod_three_roots` (Mathlib).

([[5]](#ref-5), Section 5, opening, p. 9; [[5]](#ref-5), Section 5.1, p. 10.)

**Checks.**

- `x^3 − 3xy^2 ∈ U_ℝ^(0)` with `Disc = 108` and `x^3 + xy^2 ∈ U_ℝ^(1)` with `Disc = −4`; the stabiliser of `x^3 + xy^2` is `{1, diag(−1, 1)}` (`diag(1, −1)` sends it to its negative).

- The scalar `−1 ∈ GL_2(ℤ)` sends `f` to `−f`: unlike binary quartic forms, the centre does not act trivially, which is why `n_i` is the full stabiliser order here and half of it for quartics.

- The singular cubic `x³` has `Disc=0` and belongs to neither real sign region; its repeated root does not have either finite stabilizer described above. This separates the sign-region adapter from the whole cubic coefficient space.

<a id="stabilizers-of-irreducible-integral-binary-cubic-forms"></a>

**Stabilizers of irreducible integral binary cubic forms.** Let `f ∈ U_ℤ` be irreducible over `ℚ`. Then `Stab_{GL_2(ℤ)}(f)` (twisted action) is trivial or cyclic of order 3, and if it has order 3 then `Disc(f)` is a positive square.

Irreducibility over `ℚ` is essential: `xy(x − y)` has a stabiliser of order 6 in `GL_2(ℤ)`

For the proof, As in part (c) of [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), `Stab_{GL_2(ℚ)}(f)` embeds into the permutations of the three roots of `f` in `ℙ^1(ℚ̄)`, and the image commutes with the action of `Gal(ℚ̄/ℚ)` because the elements are rational. `f` irreducible: `Gal(ℚ̄/ℚ)` acts transitively on the roots, through `A_3` or `S_3`. The centraliser of `A_3` in `S_3` is `A_3` and that of `S_3` is trivial. If the stabiliser is `A_3 ≅ C_3`, the Galois image is `A_3`, so `√Disc(f) = a^2(r_1 − r_2)(r_1 − r_3)(r_2 − r_3) (Cubic.discr_eq_prod_three_roots)` is fixed by Galois and rational; a cyclic cubic splits over `ℝ` as soon as one root is real, so `Disc(f) > 0`.

*Needs:* [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5], `Cubic.discr_eq_prod_three_roots` (Mathlib).

([[5]](#ref-5), Section 5.1, p. 10; [[5]](#ref-5), Section 5.2, before Lemma 22, p. 11.)

**Checks.**

- `f = x^3 + x^2y − 2xy^2 − y^3` (the cyclic cubic of conductor `7, Disc = 49`) is fixed by the order`-3` element `γ = [[0, −1], [1, −1]]` of `SL_2(ℤ)`, i.e. `(x, y) ↦ (y, −x − y)`; its stabiliser in `GL_2(ℤ)` is exactly `{1, γ, γ^2}` (checked by enumeration).

- An irreducible integral binary cubic form with `Disc<0` has trivial stabilizer in `GL₂(Z)`; `x³−2y³`, with discriminant `−108`, is an example.

- The reducible form `x³+xy²` has discriminant `−4` and stabilizer `{1,diag(−1,1)}` for the twisted action, so the negative-discriminant assertion needs irreducibility.

<a id="reducible-binary-cubic-forms-in-the-main-body"></a>

**Reducible binary cubic forms in the main body.** Let `B ⊂ U_ℝ` be compact with `|Disc(v)| ≥ 1` for `v ∈ B`. For `v ∈ B` with `Disc(v) ≠ 0` let `R_X(v) := {w ∈ F·v : |Disc(w)| < X}` (multiset over the strict Gauss domain `F`). For every `ε > 0` the number of integral forms `ax^3 + bx^2y + cxy^2 + dy^3` in `R_X(v)` that are reducible over `ℚ` with `a ≠ 0` is `O_ε(X^{3/4+ε})`, the implied constant depending only on `B` and `ε`.

Only `a ≠ 0`; the forms with `a = 0` have the factor `y` When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, Coefficient bounds: `f ∈ N′A′KΛv` with `λ < X^{1/4} (Disc(λ·v) = λ^4 Disc(v))`; the twisted action of `a(t)` multiplies the coefficients by `t^{−3}, t^{−1}, t, t^3`, so `a = O(λ/t^3) = O(X^{1/4}), ab = O(λ^2/t^4), ac, ad = O(λ^2) = O(X^{1/2}), abc = O(λ^3/t^3)` and `abd = O(λ^3/t) = O(X^{3/4})`. `d = 0` with `a ≠ 0`: `O(X^{3/4+ε})` forms from the bounds on `(a, b, c)`. a, `d ≠ 0`: `O(X^{3/4+ε})` triples `(a, b, d)`; a linear factor `rx + sy` has `r | a` and `s | d, O(X^ε)` choices by the divisor bound (requested from AnalyticNumberTheoryPartI §§3.22,3.26), and then `f(−s, r) = 0` determines `c`.

*Needs:* [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), AnalyticNumberTheoryPartI §§3.22,3.26.

([[5]](#ref-5), Section 5.2, Lemma 21 and proof, pp. 10-11.)

**Checks.**

- Order check: `X^{3/4+ε}` is below the error term `X^{5/6}` of Theorem 20.

- Quartic analogue: [reducible binary quartic forms in the main body](#reducible-binary-quartic-forms-in-the-main-body) `(O(X^{2/3+ε}))`.

<a id="binary-cubic-forms-with-cyclic-stabilizer"></a>

**Binary cubic forms with cyclic stabilizer.** The number of `GL_2(ℤ)`-classes of integral binary cubic forms with `0 < Disc < X` whose stabiliser in `GL_2(ℤ)` is cyclic of order 3 is `O_ε(X^{3/4+ε})`. Consequently, for every `v ∈ U_ℝ^(0)`, the number of points of `U_ℤ ∩ R_X(v)` (with multiplicity) with stabiliser `C_3` is `O_ε(X^{3/4+ε})`, with the implied constant independent of `v`.

Positive discriminant: by [stabilizers of irreducible integral binary cubic forms](#stabilizers-of-irreducible-integral-binary-cubic-forms) no irreducible form of negative discriminant has stabiliser `C_3` When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, The orbit-multiplicity ratio is `6/3=2` away from the modular boundary. On the closed boundary the count can be larger, but local finiteness of the tessellation gives a universal finite bound on the overlap. Thus the point count for every `v` is bounded by a universal constant times the class count; equality to twice the count is not needed. Take `v = x^3 − 3xy^2`, whose Hessian covariant `H_f = (b^2 − 3ac)x^2 + (bc − 9ad)xy + (c^2 − 3bd)y^2` is `9(x^2 + y^2)`. The Hessian is `SL_2`-equivariant, so for `g ∈ F` the Hessian of `g·v` is 9 times the positive definite quadratic form attached to `g`, which is reduced ([gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates)): `F·v` consists of forms with `|bc − 9ad| ≤ b^2 − 3ac ≤ c^2 − 3bd`. An order-three stabilizer has determinant one and preserves the Hessian. A reduced positive definite binary quadratic form with such an automorphism has coefficients `A=C=|B|`: both `x²+xy+y²` and `x²−xy+y²` occur on the two boundary edges. Treat these two signs separately; `A=C=±B` determines at most `O(1)` choices of `c` from each triple `(a,b,d)`. The triples `(a, b, d)` of forms in `R_X(v)` number `O(X^{3/4+ε})` by the coefficient bounds of [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body) (the case `a = 0` forces `f = b·xy(x + y)` up to the constraint and contributes `O(X^{1/4})`).

*Needs:* [stabilizers of irreducible integral binary cubic forms](#stabilizers-of-irreducible-integral-binary-cubic-forms), [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[5]](#ref-5), Section 5.2, Lemma 22 and proof, p. 11.)

**Checks.**

- The source notes that the count is asymptotic to `(π√3/18)X^{1/2}`; only the upper bound `X^{3/4+ε}` is needed.

- `C_3`-points are absorbed into the error term `O(X^{5/6})` of Theorem 20.

<a id="invariant-measure-on-binary-cubic-forms"></a>

**Invariant measure on binary cubic forms.** Let `dg = t^{−2} du d^×t dk d^×λ` be the Haar measure on `GL_2(ℝ)`, with dk the invariant probability measure on `SO_2(ℝ)` extended to the other coset of `O_2(ℝ)`, and `dv = da db dc dd` on `U_ℝ`. For `i ∈ {0, 1}, v_i ∈ U_ℝ^(i)` and every `f ∈ C_c(U_ℝ^(i))`: `∫_{GL_2(ℝ)} f(g·v_i) dg = (1/4π) ∫_{GL_2(ℝ)·v_i} f(v) |Disc(v)|^{−1} dv = (n_i/4π) ∫_{U_ℝ^(i)} f(v) |Disc(v)|^{−1} dv`, where `GL_2(ℝ)·v_i` is the multiset image (each point covered `n_i` times). Equivalently, on `GL_2^+(ℝ)` the map `g ↦ g·v_i` satisfies `dv = 4π|Disc(g·v_i)| dg`.

The constant depends on the normalisation of dk; the source's `1/(2π)` is off by a factor 2 for its stated normalisation

For the proof, At `g = n(u)a(t)k(θ)λ` the Jacobian determinant of `(u, t, θ, λ) ↦ g·v` with respect to da db dc dd equals `±2|Disc(g·v)|·t^{−3}λ^{−1}` (checked symbolically at the forms `xy(x − y), x^3 + xy^2, x^3 − 3xy^2` and `2x^3 + x^2y − 5xy^2 + 7y^3`); since `t^{−3}λ^{−1} du dt dθ dλ = 2π·dg, dv = 4π|Disc(g·v)| dg` on `GL_2^+(ℝ)`. `|Disc|^{−1}dv` is then `GL_2(ℝ)`-invariant (`Disc(γ·v) = (det γ)^2 Disc(v)` and the twisted action has determinant `(det γ)^2` on `U_ℝ`). The orbit map is `n_i`-to-one onto `U_ℝ^(i)` ([real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms)); decompose into injective pieces and apply the change-of-variables formula `(MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul)`. The component of determinant `−1` contributes the same as `GL_2^+(ℝ)` by right translation.

*Needs:* [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates), `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` (Mathlib).

([[5]](#ref-5), Section 5.3, Proposition 23, p. 12.)

**Checks.**

- Check against Davenport: with this constant and the strict Gauss domain (covolume `π/12`), `Vol(R_X(v))/n_0 = 4π·(X/4)·(π/12)/6 = π^2X/72`, Davenport's constant.

- In the source's normalisation the product of the Jacobian constant `2π` with the stated covolume `ζ(2)/π` is `2ζ(2)`, equal to the product `4π·ζ(2)/(2π)` here, so Theorem 20 is unaffected.

- For `f=x³−xy², disc(f)=4`. In the scalar, `diag(−1,1), E12` and rotation Lie directions, the absolute coefficient Jacobian is `8=2|disc(f)|`. Since `dk=dθ/(2π)`, the corresponding probability-Haar coefficient is `4π`, fixing the displayed normalization.

<a id="averaged-count-of-binary-cubic-orbits"></a>

**Averaged count of binary cubic orbits.** Fix `C ≥ 2` and the compact `SO_2(ℝ)`-invariant set `B = B(C) := {w ∈ U_ℝ : 3a^2 + b^2 + c^2 + 3d^2 ≤ C, |Disc(w)| ≥ 1}`. For `i ∈ {0, 1}, S ⊆ U_ℤ^(i)` and `X > 0` define `N(S; X) := ∫_{v ∈ B ∩ U_ℝ^(i)} #{x ∈ F·v ∩ S^irr : |Disc(x)| < X} |Disc(v)|^{−1} dv / (n_i ∫_{B ∩ U_ℝ^(i)} |Disc(v)|^{−1} dv)`, where `F` is the strict Gauss domain, `F·v` is a multiset and `S^irr` is the set of elements of `S` irreducible over `ℚ`. For `n = n(u), t > 0, λ > 0` put `B(n, t, λ, X) := n a(t) λ (B ∩ U_ℝ^(i)) ∩ {|Disc| < X}`, and `M_i := (n_i/4π) ∫_{B ∩ U_ℝ^(i)} |Disc(v)|^{−1} dv`.

`3a^2 + b^2 + c^2 + 3d^2` is three times the Bombieri norm, invariant under `SO_2(ℝ)` for the twisted action Only irreducible elements are counted

The required API is:

- `cubicAveragedCount`: `N(S; X)` by the formula (17), with `C` and `i` as parameters.

- `cubicRegionB`: `B(n, t, λ, X) = n a(t) λ (B ∩ U_ℝ^(i)) ∩ {|Disc| < X}`.

- `cubicAveragingConstant`: `M_i = (n_i/4π) ∫_{B ∩ U_ℝ^(i)} |Disc(v)|^{−1} dv`.

- `cubicAveragedCount_eq_sum_classes`: For `GL_2(ℤ)`-invariant `S`: `N(S; X) = Σ` over irreducible classes `[x] ⊆ S` with `|Disc(x)| < X` of `1/#Stab_{GL_2(ℤ)}(x)`.

- `cubicAveragedCount_union`: Additivity over disjoint subsets.

- `cubicAveragedCount_mono`: Monotone in `S` and in `X`.

- `cubicAveragedCount_indep`: For invariant `S` the value does not depend on `C` in the range `C≥2`.

- `bombieri_smul_rotation`: `3a^2 + b^2 + c^2 + 3d^2` is invariant under the twisted action of `SO_2(ℝ)`, so `B` is `SO_2(ℝ)`-invariant.

For the proof, The denominator is positive and finite for `C≥2`: the positive-discriminant form `(a,b,c,d)=(1/3,0,−1,0)` has Bombieri expression `4/3<2` and discriminant `4/3>1`; the negative form `(1/2,0,0,1/2)` has expression `3/2<2` and `|Disc|=27/16>1`. Thus both loci contain an open subset of `B(C)`; compactness and `|Disc|≥1` give finiteness. For `GL_2(ℤ)`-invariant `S` the integrand is, for almost every `v`, with respect to `|Disc(v)|^{-1}dv` (the boundary exceptions are null under the orbit-map change of variables), `Σ` over irreducible classes `[x] ⊆ S` with `|Disc(x)| < X` of `n_i/#Stab_{GL_2(ℤ)}(x)` (`F·v` is `n_i` fundamental domains), so `N(S; X) = Σ_{[x]} 1/#Stab_{GL_2(ℤ)}(x)`: classes are counted with weight 1, and the classes with stabiliser `C_3` with weight `1/3`.

*Needs:* [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), [stabilizers of irreducible integral binary cubic forms](#stabilizers-of-irreducible-integral-binary-cubic-forms), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[5]](#ref-5), Section 5.3, (17), p. 12; [[5]](#ref-5), Section 5.3, p. 12.)

**Checks.**

- `N(∅; X) = 0` for every `X`, and `N(S; X) = 0` for `X ≤ 1` (a nonzero integral discriminant has absolute value `≥ 1`).

- For `S = {f ∈ U_ℤ^(i) : a(f) = 0}, N(S; X) = 0`: every such form has the factor `y`.

- The class of the cyclic form `x^3 + x^2y − 2xy^2 − y^3` contributes `1/3`, not 1, to `N(U_ℤ^(0); X)` for `X > 49`.

- For `S = U_ℤ^(i), N(S; X) = Σ_{[x]} 1/#Stab_{GL_2(ℤ)}(x)`, independent of `C`.

- At `C=2, (1/3,0,−1,0)` has norm expression `4/3` and discriminant `4/3`; `(1/2,0,0,1/2)` has expression `3/2` and discriminant `−27/16`. Both strict inequalities persist on open neighborhoods, so both averaging denominators are positive.

- For `S = U_ℤ^(i)` the averaged count differs from the number of classes by at most the `O(X^{3/4+ε})` classes with stabiliser `C_3`.

- `N` is additive over disjoint subsets, invariant or not.

<a id="averaging-formula-for-binary-cubic-forms"></a>

**Averaging formula for binary cubic forms.** For `i ∈ {0, 1}, S ⊆ U_ℤ^(i)` and `X > 0`: `N(S; X) = (1/M_i) ∫_{g ∈ F} #{x ∈ S^irr ∩ g(B ∩ U_ℝ^(i)) : |Disc(x)| < X} dg = (1/(2M_i)) ∫_{n(u)a(t)λ ∈ N′(t)A′Λ} #{x ∈ S^irr ∩ B(n, t, λ, X)} t^{−2} du d^×t d^×λ`, with `M_i = (n_i/4π) ∫_{B ∩ U_ℝ^(i)} |Disc(v)|^{−1} dv`.

The factor `1/2` is `∫_{K_+} dk`; the constant `4π` is that of [invariant measure on binary cubic forms](#invariant-measure-on-binary-cubic-forms)

For the proof, Choose `H^(i) ⊆ GL_2(ℝ)` maximal with `H^(i)·v_i = B ∩ U_ℝ^(i)` as an `n_i`-fold multiset. By [invariant measure on binary cubic forms](#invariant-measure-on-binary-cubic-forms), `∫_{B ∩ U^(i)} Φ(v)|Disc(v)|^{−1} dv = (4π/n_i) ∫_{H^(i)} Φ(h·v_i) dh`. Apply this to `Φ(v) = #{g ∈ F : x = g·v}`, sum over `x`, exchange the order (unimodularity of `GL_2(ℝ)`) as in (18)-(19), and use that the multiset `H^(i)·v_i` covers `B ∩ U^(i) n_i` times: the numerator of `N(S; X)` equals `4π ∫_F #{x ∈ S^irr ∩ gB : |Disc(x)| < X} dg`. Divide by `n_i ∫ |Disc|^{−1}`: this is the first formula. For the second, write `g = n(u)a(t)kλ` with `k ∈ K_+`, use `kB = B` and `∫_{K_+} dk = 1/2` ([averaged count of binary cubic orbits](#averaged-count-of-binary-cubic-orbits)).

*Needs:* [averaged count of binary cubic orbits](#averaged-count-of-binary-cubic-orbits), [invariant measure on binary cubic forms](#invariant-measure-on-binary-cubic-forms), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[5]](#ref-5), Section 5.3, (18)-(23), pp. 12-13.)

**Checks.**

- Inserting `Vol(B(n, t, λ, X))` for the count gives `Vol(R_X(v))/n_i`, independent of `v` (the computation in the proof of [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms)).

- For invariant `S` both sides are independent of `C`.

<a id="binary-cubic-lattice-points-in-the-cusp"></a>

**Binary cubic lattice points in the cusp.** Let `C` bound the absolute values of all coefficients of all forms in `B`. Let `m ≥ 1` and let `L′ = v_0 + mU_ℤ`, and let `a′ ≥ 1` be the smallest nonzero `|a|`-coordinate of a point of L′. For `u ∈ [−1/2, 1/2], t ≥ 3^{1/4}/√2, λ > 0` and `X > 0`, the number of points `(a, b, c, d) ∈ L′ ∩ B(n(u), t, λ, X)` with `a ≠ 0` is 0 if `Cλ/t^3 < a′`, and otherwise `m^{−4}Vol(B(n(u), t, λ, X)) + O(C^3t^3λ^3/m^3 + C^2t^4λ^2/m^2 + Ct^3λ/m + 1)`, the implied constant absolute. For `m = 1` the error is `O(max(C^3t^3λ^3, 1))`.

The `x^3`-coefficient of a form in `B(n, t, λ, X)` is at most `Cλ/t^3` in absolute value Davenport's lemma is the input (a request)

For the proof, Under the twisted action, `n(u)` with `|u| ≤ 1/2` adds to each coefficient a bounded combination of the preceding ones, `a(t)` multiplies them by `t^{−3}, t^{−1}, t, t^3` and `λ·1` by `λ`; so the ranges of `(a, b, c, d)` are `O(Cλ/t^3, Cλ/t, Cλt, Cλt^3)`. If `Cλ/t^3 < a′` no point of L′ with `a ≠ 0` fits. Otherwise apply Davenport's lemma (requested from GeometryOfNumbersAndQuadraticArithmetic §4.1) to the image of `B(n, t, λ, X)` under `v ↦ (v − v_0)/m`: the projection onto `a = 0` has volume `O(C^3t^3λ^3/m^3)`, the 2-dimensional projections `O(C^2t^4λ^2/m^2)` (the two largest ranges), the 1-dimensional ones `O(Ct^3λ/m)`. Remove the `a=0` slice after Davenport: its count is bounded by the product of one plus the three remaining coefficient ranges divided by `m`. Expanding that product gives exactly terms of the same orders as the displayed error; the slice has zero four-dimensional volume.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.1, [averaged count of binary cubic orbits](#averaged-count-of-binary-cubic-orbits).

([[5]](#ref-5), Section 5.3, Lemma 25 and proof, p. 13; [[5]](#ref-5), Section 5.5, (28), p. 14.)

**Checks.**

- Unlike the quartic cusp, the cubic cusp `t^3 > Cλ` still contains integral points with `a = 0` only, but in the range `t^3 ≤ Cλ` the error `C^3t^3λ^3` integrates to `X^{5/6}`, the size of the error term (and of the second main term of Shintani, which this fragment does not plan).

- For `m = 1` the terms `t^4λ^2` and `t^3λ` are dominated by `t^3λ^3` in the range `t^3 ≤ Cλ, t ≥ 3^{1/4}/√2`.

<a id="davenport-count-of-binary-cubic-forms"></a>

**Davenport count of binary cubic forms.** (a) `N(U_ℤ^(0); X) = (π^2/72)X + O(X^{5/6})` and `N(U_ℤ^(1); X) = (π^2/24)X + O(X^{5/6})`, where `N(U_ℤ^(i); X)` is the number of `GL_2(ℤ)`-classes of irreducible integral binary cubic forms `f` with `0 < (−1)^i Disc(f) < X`. (b) For every `v ∈ U_ℝ^(i), Vol(R_X(v)) = π^2X/12`, where `R_X(v) = {w ∈ F·v : |Disc(w)| < X}` is the multiset over the strict Gauss domain; so `Vol(R_X(v))/n_i = π^2X/(12n_i)`. (c) Cusp tail: there is `c = c(C)` such that for every `S ⊆ U_ℤ^(i), T ≥ 3^{1/4}/√2` and `X ≥ 1, (1/(2M_i)) ∫_{t > T} #{x ∈ S^irr ∩ B(n, t, λ, X)} t^{−2} du d^×t d^×λ ≤ c·X/T^2 + O(X^{5/6})`.

`Counting.cubic_count` states the unweighted class asymptotics for both discriminant signs, with the determinant-twisted integral substitution quotient.

Classes under `GL_2(ℤ)` with the twisted action; the classes with stabiliser `C_3` are counted with weight 1 (their number is `O(X^{3/4+ε})`) Davenport's original error was `O(X^{15/16})` When concluding that `O(X^{3/4+epsilon})` is lower order than `X^{5/6}`, choose `0<epsilon<1/12`; the bound itself is stated for every positive `epsilon`.

For the proof, By [averaging formula for binary cubic forms](#averaging-formula-for-binary-cubic-forms) with `S = U_ℤ^(i)`, the integrand vanishes unless `t^3 ≤ Cλ` and `λ ≤ X^{1/4}` ([binary cubic lattice points in the cusp](#binary-cubic-lattice-points-in-the-cusp); `B` has `|Disc| ≥ 1` and points with `a = 0` are reducible). Irreducible points `=` points with `a ≠ 0` minus reducible ones: `O(X^{3/4+ε})` by [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body); the `C_3`-classes change the count by `O(X^{3/4+ε})` ([binary cubic forms with cyclic stabilizer](#binary-cubic-forms-with-cyclic-stabilizer)). The error `O(max(C^3t^3λ^3, 1))` integrates over `t^3 ≤ Cλ, λ ≤ X^{1/4}` to `O(X^{5/6})`; the part of the main term with `t^3 > Cλ` is `O(X^{5/6})` since `Vol(B(n, t, λ, X)) ≪ λ^4`. Main term: `∫ Vol(B(n, t, λ, X))` over all of `N′A′Λ` is `2∫_F Vol(gB ∩ {|Disc| < X}) dg`; writing `Vol(gB ∩ …) = ∫_{w ∈ B} 1[|Disc(gw)| < X]·|Disc(gw)|/|Disc(w)| dw` and applying [invariant measure on binary cubic forms](#invariant-measure-on-binary-cubic-forms) gives `(1/4π) Vol(R_X(v)) ∫_B |Disc|^{−1}`, so the main term is `Vol(R_X(v))/n_i` (`Vol(R_X(w))` does not depend on `w ∈ U_ℝ^(i)`, as `F·w` is `n_i` fundamental domains). (b) For `|Disc(v)| = 1, Vol(R_X(v)) = ∫_{g ∈ F} 1[λ^4 < X]·4π|Disc(g·v)| dg = 4π ∫_0^{X^{1/4}} λ^4 d^×λ · ∫_{N′A′K_+} t^{−2} du d^×t dk = 4π·(X/4)·(π/12) = π^2X/12` by [covolume of pgl2 z](#covolume-of-pgl2-z) (b); for general `v` rescale by `λ·1`. (a) follows with `n_0 = 6`, `n_1 = 2`. (c) `Vol(B(n, t, λ, X)) ≪ λ^4, ∫_{t > T} t^{−2} d^×t ≤ T^{−2}/2` and `∫^{X^{1/4}} λ^4 d^×λ = X/4`; the error terms integrate to `O(X^{5/6})`.

*Needs:* [averaging formula for binary cubic forms](#averaging-formula-for-binary-cubic-forms), [binary cubic lattice points in the cusp](#binary-cubic-lattice-points-in-the-cusp), [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body), [binary cubic forms with cyclic stabilizer](#binary-cubic-forms-with-cyclic-stabilizer), [invariant measure on binary cubic forms](#invariant-measure-on-binary-cubic-forms), [covolume of pgl2 z](#covolume-of-pgl2-z), [gauss fundamental domain in iwasawa coordinates](#gauss-fundamental-domain-in-iwasawa-coordinates).

([[5]](#ref-5), Section 5, Theorem 20, p. 9; [[5]](#ref-5), Section 5.4, p. 14; [[1]](#ref-1), Section 1.2, Theorem 1.5, printed p. 3.)

**Checks.**

- Davenport's constants: `π^2/72 ≈ 0.1371` and `π^2/24 ≈ 0.4112`.

- Delone-Faddeev reading (Layer 3): these count isomorphism classes of orders in cubic fields of bounded discriminant.

- The error `O(X^{5/6})` is of the same order as Shintani's second main term, which requires the slicing argument of BST Section 6.

<a id="binary-cubic-counts-with-congruence-conditions"></a>

**Binary cubic counts with congruence conditions.** (a) Let `1 ≤ m ≤ X^{1/6}` and `L = v_0 + mU_ℤ`. Then `N(L ∩ U_ℤ^(i); X) = m^{−4}·(π^2/(12n_i))X + O(m^{−3}X^{5/6}) − R_L(X)`, where the implied constant is independent of `m, v_0` and `X`, and `R_L(X) ≥ 0` is the averaged contribution of reducible points with nonzero leading coefficient in `L`, so that `Σ_L R_L(X) = O_ε(X^{3/4+ε})` over any finite family of disjoint translates. (b) If `S ⊆ U_ℤ` is a union of `k` translates of `mU_ℤ` with `m ≤ X^{1/6}`, then `N(S ∩ U_ℤ^(i); X) = (k/m^4)(π^2/(12n_i))X + O(k m^{−3}X^{5/6}) + O_ε(X^{3/4+ε})`. (c) If `S ⊆ U_ℤ^(i)` is defined by a product of finitely many independently imposed local congruence conditions modulo prime powers, then `lim_{X→∞} N(S ∩ U_ℤ^(i); X)/X = (π^2/(12n_i))·∏_p μ_p(S)`.

`N` is the averaged count. For invariant `S` its class weight is `1/#Stab_GL2(Z)(f)`, not exactly one: cyclic cubic classes have weight `1/3`. Their `O(X^{1/2})` contribution can be absorbed when converting to the unweighted asymptotic. `m ≤ X^{1/6}` makes the lower-dimensional projection terms of (29) smaller than `m^{−3}X^{5/6}` Use the positive averaging denominators with `C≥2`. For (c), the allowed residue set modulo `m` must be the CRT product of its local projections; an arbitrary coupled residue set does not satisfy the displayed product formula.

For the proof, (a) Repeat the proof of [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms) with [binary cubic lattice points in the cusp](#binary-cubic-lattice-points-in-the-cusp) for `L`: integrating its error terms gives `(29), O(C^{10/3}X^{5/6}/(a′^{1/3}m^3) + C^{8/3}X^{2/3}/(a′^{2/3}m^2) + C^{4/3}X^{1/3}/(a′^{1/3}m) + log X)`, which is `O(m^{−3}X^{5/6})` for `a′ ≥ 1` and `m ≤ X^{1/6}`. The reducible remainder is nonnegative and additive over finite disjoint sets before averaging, so its total is `O_ε(X^{3/4+ε})` by the reducible bound. Cyclic-stabilizer corrections are needed only when converting the weighted class count to the unweighted count; they are not part of this remainder. (b) Sum (a) over the `k` translates. (c) Fix `S`, let `X → ∞` in (b), and use `k m^{−4} = ∏_p μ_p(S)` (under the CRT-product hypothesis; Chinese remainder theorem; [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2]).

*Needs:* [averaging formula for binary cubic forms](#averaging-formula-for-binary-cubic-forms), [binary cubic lattice points in the cusp](#binary-cubic-lattice-points-in-the-cusp), [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms), [reducible binary cubic forms in the main body](#reducible-binary-cubic-forms-in-the-main-body), [binary cubic forms with cyclic stabilizer](#binary-cubic-forms-with-cyclic-stabilizer), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[5]](#ref-5), Section 5.5, Theorem 26, p. 14; [[5]](#ref-5), Section 5.5, (30)-(31), p. 15.)

**Checks.**

- `S = U_ℤ` recovers Theorem 20 `(m = 1)`.

- Uniformity check: for `S_p =` {`f` : `p | a(f)`} `(m = p, k = p^3)` the error is `O(X^{5/6}) + O(X^{3/4+ε})` uniformly for `p ≤ X^{1/6}`.

### 2.7 Cubic switching and infinite local conditions

<a id="index-p-switching-for-binary-cubic-forms"></a>

**Index p switching for binary cubic forms.** Let `p` be a prime and use the twisted action on `U_ℚ`. (a) If `f = (a, b, c, d) ∈ U_ℤ` has `p^2 | a` and `p | b`, then `f′ := diag(p^{−1}, 1)·f = (a/p^2, b/p, c, pd) ∈ U_ℤ, Disc(f′) = p^{−2}Disc(f), f′(0, 1) ≡ 0 (mod p)`, and `f = diag(p, 1)·f′`. (b) Conversely, if `g ∈ U_ℤ` and `α ∈ ℙ^1(𝔽_p)` is a root of `g mod p`, choose `γ_α ∈ GL_2(ℤ)` whose bottom row reduces to a representative of `α`; then `f_{g,α} := diag(p, 1)·(γ_α·g) ∈ U_ℤ` has `p^2 | a` and `p | b`, and its `GL_2(ℤ)`-class depends only on the `GL_2(ℤ)`-class of `g` and on `α` modulo the action of `Stab_{GL_2(ℤ)}(g)`. (c) Consequently every `GL_2(ℤ)`-class of forms `f` with `Disc(f) ≠ 0` having a translate with `p^2 | a` and `p | b` is the class of some `f_{g,α}` with `|Disc(g)| = |Disc(f)|/p^2`, and the number of such classes attached to one class `[g]` is at most the number of roots of `g mod p` in `ℙ^1(𝔽_p)`: at most 3 if `g ≢ 0 (mod p)`, at most `p + 1` otherwise.

This is the form-theoretic content of BST Lemma 13 and Propositions `15-16` (index-`p` overrings and subrings of cubic rings); no ring theory is used The twisted action is the one of [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5]

For the proof, (a) `diag(p^{−1}, 1)·f = f(x/p, y)/det(diag(p^{−1}, 1)) = p·f(x/p, y) = (a/p^2)x^3 + (b/p)x^2y + cxy^2 + pdy^3`, and `Disc(γ·f) = (det γ)^2 Disc(f)` with `det γ = 1/p` ([real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms) (a)). (b) `γ_α·g` vanishes at `[0 : 1]` `mod p`, i.e. its `y^3`-coefficient d′ is divisible by `p`; then `diag(p, 1)·(γ_α·g) = (p^2a′, pb′, c′, d′/p)` is integral. Two choices `γ_α, γ′_α` differ by `δ ∈ GL_2(ℤ)` with `p | δ_21`, and `diag(p, 1)δ diag(p, 1)^{−1} = [[δ_11, pδ_12], [δ_21/p, δ_22]] ∈ GL_2(ℤ)`; replacing `g` by `ε·g (ε ∈ GL_2(ℤ))` moves `α` accordingly. (c) Given `f`, move it so that `p^2 | a` and `p | b`, and take `g = f′` from `(a), α =` `[0 : 1]`; then `f = f_{g,α}`. A nonzero binary cubic form over `𝔽_p` has at most 3 roots in `ℙ^1(𝔽_p)` (`Polynomial.card_roots'` for its dehomogenisation, plus possibly `[1 : 0]`); the zero form has `p + 1`.

*Needs:* [ArithmeticStatisticsPartII, delone faddeev parametrization of cubic rings][AS-II-5], [real orbits and stabilizers of binary cubic forms](#real-orbits-and-stabilizers-of-binary-cubic-forms), `Polynomial.card_roots'` (Mathlib).

([[5]](#ref-5), Section 3, Lemma 13 and the sentence after it, pp. 6-7; [[5]](#ref-5), Proof of Propositions 15 and 16, pp. 7-8.)

**Checks.**

- For `p = 5` and `g = x^3 + xy^2` (which vanishes at `[0 : 1]`), `f_{g,[0:1]} = diag(5, 1)·g = g(5x, y)/5 = 25x^3 + xy^2`, and `Disc(f) = −100 = 25·Disc(g)`.

- The bound 3 (not `p + 1`) for `g ≢ 0 mod p` is what makes the switching estimate `O(X/p^2)` rather than `O(X/p)`.

<a id="uniformity-estimate-for-nonmaximal-binary-cubic-forms"></a>

**Uniformity estimate for nonmaximal binary cubic forms.** For a prime `p` let `W_p^DH := {f ∈ U_ℤ : f ∈ pU_ℤ, or some γ ∈ GL_2(ℤ) has γ·f = (a, b, c, d) with p^2 | a and p | b}`. There is an absolute constant `C` such that for every prime `p` and every `X ≥ 1` the number of `GL_2(ℤ)`-classes of irreducible `f ∈ W_p^DH` with `0 < |Disc(f)| < X` is at most `C·X/p^2`.

`W_p^DH` is the complement of the Davenport-Heilbronn set `U_p`; by BST Theorem 14 (owned with the Delone-Faddeev correspondence) it is the set of forms whose cubic ring is not maximal at `p`, but only the form definition is used here

For the proof, Let `N(Y)` be the number of classes of irreducible integral binary cubic forms with `0 < |Disc| < Y`; by [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms), `N(Y) ≤ C_0·Y` for `Y ≥ 1`, and `N(Y) = 0` for `Y ≤ 1`. `f ∈ pU_ℤ`: `f = pf_0` with `f_0` irreducible and `Disc(f) = p^4 Disc(f_0)`, at most `N(X/p^4)` classes. Otherwise, by [index p switching for binary cubic forms](#index-p-switching-for-binary-cubic-forms), the classes are among the `f_{g,α}` with `|Disc(g)| < X/p^2` and `g` irreducible (`g` is `GL_2(ℚ)`-equivalent to `f`): at most `3N(X/p^2)` from `g ≢ 0 (mod p)`, and at most `(p + 1)N(X/p^6)` from `g = pg_0`. Total `≤ C_0(X/p^4 + 3X/p^2 + (p + 1)X/p^6) ≤ 5C_0·X/p^2`.

*Needs:* [index p switching for binary cubic forms](#index-p-switching-for-binary-cubic-forms), [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms).

([[5]](#ref-5), Section 8.2, Proposition 29 and proof, pp. 23-24; [[5]](#ref-5), Proof of Proposition 29, case (i), p. 23.)

**Checks.**

- The bound is uniform in `p`; for `p^2 > X` the set is empty.

- The totally ramified maximal forms (`Y_p` of BST) are not in `W_p^DH`; BST bound them by class field theory, while here they are covered by the geometric sieve in [uniformity estimate for binary cubic discriminants](#uniformity-estimate-for-binary-cubic-discriminants).

<a id="uniformity-estimate-for-binary-cubic-discriminants"></a>

**Uniformity estimate for binary cubic discriminants.** For a prime `p` let `W_p(U) := {f ∈ U_ℤ : p^2 | Disc(f)}`. There are constants `c` and `C_T` (for each `T ≥ 3^{1/4}/√2`, independent of `M`) such that for every `M ≥ 3, lim sup_{X→∞} N(⋃_{p>M} W_p(U); X)/X ≤ C_T/(M log M) + c/T^2`, where `N` counts `GL_2(ℤ)`-classes of irreducible forms with `0 < |Disc| < X`. Consequently `lim_{M→∞} lim sup_{X→∞} N(⋃_{p>M} W_p(U); X)/X = 0`.

Both signs of the discriminant are included The strongly divisible part (triple root modulo `p`, which contains the maximal totally ramified forms) is handled by the geometric sieve; BST use class field theory for the totally ramified part

For the proof, Decomposition for `p ≥ 3`: if `f ∈ W_p(U)` and `f mod p ∉ Y_3(𝔽_p)`, where `Y_3 = V(Disc, ∂Disc/∂d)`, then `f ∈ W_p^DH`. Indeed `p ∤ ∂Disc/∂d(f)` makes `f` weakly divisible (gradient characterisation in [strongly and weakly divisible values](#strongly-and-weakly-divisible-values)), so `f ≢ 0 (mod p)` and `f mod p` has no triple root (a triple root moved to `[1 : 0]` gives `p | a, b, c`, hence `p^2 | Disc(f + pg)` for all `g`); as `p | Disc(f), f mod p` has a double root `α ∈ ℙ^1(𝔽_p)` (a repeated root of a cubic is rational). Move `α` to `[1 : 0]` by `γ ∈ GL_2(ℤ)`: `γ·f = (a, b, c, d)` with `p | a, p | b` and `p ∤ c`, and `Disc(γ·f) ≡ −4ac^3 (mod p^2)`, so `p^2 | Disc` forces `p^2 | a` (`p` odd). The `W_p^DH` part: `Σ_{p>M} N(W_p^DH; X) ≤ C X Σ_{p>M} p^{−2} = O(X/(M log M))` by [uniformity estimate for nonmaximal binary cubic forms](#uniformity-estimate-for-nonmaximal-binary-cubic-forms) and [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums). The `Y_3` part: by [averaging formula for binary cubic forms](#averaging-formula-for-binary-cubic-forms) split the integral at `t = T`. For `t > T` use part (c) of [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms): `≤ cX/T^2 + O(X^{5/6})`. For `t ≤ T` all regions lie in `X^{1/4}·Ω_T` using the compact closure of the bounded region `Ω_T`. The multiplicity bound is uniform: the truncated compact matrix set is covered by finitely many translates of a fixed Gauss region (local finiteness of the modular tessellation), and each such region has uniformly bounded multiplicity, including its boundary. Thus each integral point is counted with bounded weight, and [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve) with `n = 4, k = 2, r = X^{1/4}` (`Y_3` of codimension 2 by [discriminant loci of codimension two](#discriminant-loci-of-codimension-two); strongly divisible forms reduce into `Y_3` by [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus)) gives `O_T(X/(M log M) + X^{3/4})`. Divide by `X`, let `X → ∞`, then choose `T` and `M` as in the quartic case.

*Needs:* [uniformity estimate for nonmaximal binary cubic forms](#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strong divisibility lies on a codimension two locus](#strong-divisibility-lies-on-a-codimension-two-locus), [discriminant loci of codimension two](#discriminant-loci-of-codimension-two), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [chebyshev bounds for prime sums](#chebyshev-bounds-for-prime-sums), [averaging formula for binary cubic forms](#averaging-formula-for-binary-cubic-forms), [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms).

([[5]](#ref-5), Section 8.2, p. 23; [[5]](#ref-5), Proof of Proposition 29, last paragraph, p. 24.)

**Checks.**

- For Layer 3: every acceptable collection of local specifications in the sense of BST (`Σ_p` contains the maximal, not totally ramified cubic rings over `ℤ_p` for large `p`) corresponds to an acceptable set of forms for `Disc`, and this theorem is the tail estimate the sieve needs, for Theorems 1, 2 and 8 of BST alike.

- The rate `C_T/(M log M) + c/T^2` is uniform in the congruence conditions imposed at primes `≤ M`.

<a id="sieve-to-acceptable-functions-for-binary-cubic-forms"></a>

**Sieve to acceptable functions for binary cubic forms.** Let `φ` : `U_ℤ → [0, 1]` be acceptable for `Disc` and defined by congruence conditions via `GL_2(ℤ)`-invariant local functions `φ_p` : `U_{ℤ_p} → [0, 1]` ([ArithmeticStatisticsPartI, acceptable weight function][AS-I-2]). For `i ∈ {0, 1}` let `N_φ(U_ℤ^(i); X)` be the number of irreducible `GL_2(ℤ)`-classes in `U_ℤ^(i)` with `|Disc| < X`, each class counted with weight `φ`. Then `N_φ(U_ℤ^(i); X) = (π^2/(12n_i))·∏_p ∫_{U_{ℤ_p}} φ_p(f) df · X + o(X)`, and the Euler product converges. In particular, for an acceptable set `S = ⋂_p S_p, lim_{X→∞} N(S ∩ U_ℤ^(i); X)/X = (π^2/(12n_i))∏_p μ_p(S_p)`.

`Counting.cubic_acceptable_sieve` states this asymptotic with the actual local Haar integrals and the global product weight on cubic classes.

Acceptability: `φ_p = 1` on `{p^2 ∤ Disc}` for large `p` The cubic-ring translation (maximality, splitting types, local masses `Σ 1/(Disc_p(R)|Aut(R)|)`) belongs to Layer 3 and Layer 1

For the proof, Approximate `φ_p` from above and below by functions defined modulo `p^n`, as in [squarefree sieve for binary quartic forms](#squarefree-sieve-for-binary-quartic-forms); convergence of the Euler product from `1 − ∫φ_p ≤ μ_p{p^2 | Disc} ≤ Cp^{−2}` ([local density of values divisible by p squared](#local-density-of-values-divisible-by-p-squared), `Disc` being primitive and coprime to `∂Disc/∂d` by [discriminant loci of codimension two](#discriminant-loci-of-codimension-two)). Upper bound: a weight defined modulo finitely many prime powers is a finite linear combination of indicators of translates of `mU_ℤ`; [binary cubic counts with congruence conditions](#binary-cubic-counts-with-congruence-conditions) gives its limit; let the truncation grow. Lower bound: fix `M` above the acceptability threshold and approximate each of the finitely many factors `p≤M` by its actual infimum on residue cylinders modulo `p^n`, with `n≥2`. The finite approximation has the required lattice-count limit as `X→∞`. Its difference from the full weight has two contributions: the finite-prime approximation error, whose integral tends to zero as `n→∞`, and the tail union over `p>M`, bounded by the uniformity estimate. Take `X→∞`, then `n→∞` at fixed `M`, then `M→∞`. The finite approximation error is not supported only on the tail union.

*Needs:* [binary cubic counts with congruence conditions](#binary-cubic-counts-with-congruence-conditions), [uniformity estimate for binary cubic discriminants](#uniformity-estimate-for-binary-cubic-discriminants), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2], [local density of values divisible by p squared](#local-density-of-values-divisible-by-p-squared), [discriminant loci of codimension two](#discriminant-loci-of-codimension-two).

([[5]](#ref-5), Section 8.3, proof of Theorem 1, p. 24; [[5]](#ref-5), Section 8.4, p. 25.)

**Checks.**

- `φ ≡ 1` recovers Theorem 20; `φ = 1_{U_p}` for all `p` gives Davenport-Heilbronn's count of maximal cubic orders through the Delone–Faddeev correspondence, with maximal irreducible rings identified with cubic rings of integers, with `∏_p μ_p(U_p) = ∏_p (1 − p^{−2})(1 − p^{−3})` and limit `1/(2n_iζ(3))`.

- With `φ_p` the indicator of forms maximal and not totally ramified at `p`, the local densities are `(1 − p^{−2})^2` (BST Lemma 19), the input for BST Theorem 2.

### 2.8 Quartic-pair orbit counts

<a id="refinement-quartic-finite-congruence-count"></a>

**Quartic finite congruence count.** For integral pairs of ternary quadratic forms in a `G_Z`-invariant union `S` of finitely many residue classes, count absolutely irreducible orbits with `0<|Disc|<X` in real signature `i=0,1,2`. Then `N_i(S;X)=C_i X nu(S)+o_S(X)`, with normalized coefficient Haar measures, `C_i=zeta(2)^2 zeta(3)/(2 n_i)` and `(n_0,n_1,n_2)=(24,4,8)`. Absolutely irreducible means the quartic field has `S4` closure. This is not an all-etale-orbit count. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`.

For the proof, Average the finite-cover fundamental domain with its stabilizer multiplicities. Use GeometryOfNumbersAndQuadraticArithmetic §4.1 on each congruence translate in the main body. Use the source cusp/reducibility estimate, including Lemma 12; integrate the explicitly normalized discriminant volume. Finite congruence conditions do not change the discarded error.

*Needs:* [ArithmeticStatisticsPartII, pairs of ternary quadratic forms][AS-II-6], [ArithmeticStatisticsPartII, bhargava parametrization of quartic rings][AS-II-7], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[77]](#ref-77), Theorem 22 and (32), pp.1054–1055.)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

<a id="quartic-maximal-order-suborders"></a>

**Quartic maximal-order suborders.** For a quartic étale `Q`-algebra `L`, let `s_L(k)` count the unital suborders of positive index `k` in the maximal order `O_L`, as embedded subrings. Here `O_L` is the product of the maximal orders of the field factors; suborders may couple those factors. Prove finiteness and multiplicativity in `k`. Establish these estimates with constants independent of `L` and the prime `p`:

1. `s_L(1)=1`, `s_L(p)≤C_0` for an absolute constant `C_0`, and, for every `epsilon>0`, `s_L(p^e)≤C_epsilon p^((1/2+epsilon)e)` for `e≥2`.
2. The weighted local series satisfies `sum_(e≥1) s_L(p^e)/p^(2e)≤C/p²`, with an absolute constant. Consequently the global index series is uniformly bounded and its subseries over `p|k` is `O(p⁻²)`.
3. For every `epsilon>0`, `s_L(k)≤C_epsilon k^(1/2+epsilon)`. This fixed-index estimate is used for fixed reducible resolvents, separately from the uniform weighted tail.

A nonmaximal ambient order is outside these assertions. For a quartic order of content `c`, the number of resolvent structures over that fixed order is `sigma(c)`; forgetting its automorphisms gives at most this many pair orbits. Write the order uniquely as `Z+cQ'` with `Q'` primitive. If `Q'` has index `j` in `O_L`, the resulting index is `c³j` and discriminant is `c⁶j² Disc(L)`.

Prove the local estimates by enumerating multiplicatively closed index lattices in the maximal étale order. For the weighted series use the first-index bound and the higher-index bound with, for example, `epsilon=1/4`; the higher-index contribution is `O(p^(-5/2))`. Multiply the Euler factors `1+O(p⁻²)`. For the fixed-index estimate absorb each local constant into the prescribed `k^epsilon` loss. Sum content independently: `sum_c sigma(c)/c⁶` converges and its subseries over `p|c` is `O(p⁻⁵)`. Nonmaximality at `p` means `p|j` or `p|c`, so both subseries enter the pair-orbit tail. At fixed index retain `sum_(c³j=k) sigma(c)s_L(j)≪_epsilon k^(1/2+epsilon)`; the content weight is absorbed using `sigma(c)≪_epsilon c^(1+epsilon)` and the divisor bound.

*Needs:* GlobalNumberFields Layer 11; ArithmeticStatisticsPartII **Existence and number of cubic resolvents**; AnalyticNumberTheoryPartI §3.26. Sources: [[77]](#ref-77), Lemma 12 pp.1044–1046 and proof of Proposition 23 pp.1056–1057, for the suborder/content reduction; [Shankar–Tsimerman, *Secondary terms in the counting functions of quartic fields*](https://arxiv.org/pdf/2503.02381v1), §11, Proposition 11.2, (45), and Corollary 11.3, p.41, for the local index dependence and content-weighted fixed-index bound deduced from Nakagawa’s enumeration.

**Checks.**

- At `k=1` the unique suborder is `O_L`.
- For `O_L=Z⁴` there are six index-`p` suborders, one for each pair of equal residue coordinates, and exactly `6^omega(k)` index-`k` suborders for squarefree `k`. The global `k^epsilon` loss absorbs these factors; a constant bound at all squarefree indices would fail.
- For every prime `p` and `[a:b]∈P¹(F_p)`, the subring `R_[a:b]={(x,y,z,w)∈Z⁴: x≡y≡z mod p, a(x−z)+b(y−z)≡0 mod p²}` has index `p³`. The last condition is independent of the integer lifts of `a,b`. These are `p+1` distinct suborders, so `s_(Q⁴)(p³)≥p+1`; they contribute at least `(p+1)/p⁶` to the weighted local series.
- For `L=Q⁴`, the order `Z+pO_L` has index `p³` and content `p`, hence `p+1` resolvent structures over the fixed order. Its content-series weight is `(p+1)/p⁶`, even when the primitive index `j=1`; the suborder count alone does not count pair orbits.

<a id="quartic-class-group-and-conductor-inputs"></a>

**Quartic class-group and conductor inputs.** For an étale `Q`-algebra `K`, define `h_2^*(K)=#Cl(O_K)[2]`, the size of the subgroup killed by two in the ordinary ideal class group, componentwise on products. It includes the identity. Items 2–4 supply the fixed-resolvent count and the finite-congruence reducible-resolvent discard; item 1 follows the finite count and supplies the overramified tail:

1. For `X≥1`, `sum_(K noncyclic cubic field, 0<|Disc K|<X) h_2^*(K) ≤ C X`.
2. For a noncyclic cubic field `K`, count degree-two field extensions `E/K` up to `K`-isomorphism whose normal closure over `Q` has group `S4` in its cubic-resolvent realization. Call these acceptable. With conductor ideal `f(E/K)` (equal to the relative discriminant ideal), let `g_K(N)` count those with `Norm f=N`. Then `g_K(N)=0` for nonsquare positive `N`, and `g_K(m²)≤C h_2^*(K) 3^omega(m)` for every `m≥1`, with `C` independent of `K,m`. In a Kummer presentation `E=K(sqrt(alpha))`, acceptability uses the square norm class of `alpha`, together with the nontrivial extension condition; a square norm of the finite conductor is used as a necessary condition.
3. For every quadratic field `F` and `epsilon>0`, `h_2^*(F)≤C_epsilon |Disc F|^epsilon`; set `h_2^*(Q×Q)=1`.
4. If `K=Q×F` is a reducible cubic étale algebra, and `d≠0` is an integer with `d/Disc(K)` a positive square, the number of quartic étale algebras `L` with cubic resolvent algebra `K` and `|Disc(L)|` dividing `|d|` is at most `C_epsilon h_2^*(K)|d|^epsilon`, uniformly in `K,d`. Here the discriminant of an étale algebra means that of its maximal order.

Use ClassFieldTheory Layer 12 `globalClassFieldCorrespondence`, `globalAbelianGaloisEquiv` and its conductor/ray-class compatibility for quadratic characters, retaining the bounded factors at 2 and infinity. Prove (1) by the unramified quadratic-extension/quartic-field correspondence and the finite-congruence quartic count, including the cyclic cubic contribution if using the source's all-cubic version. Genus theory gives (3). The norm-square character condition and local quadratic characters give (2),(4). *Needs:* ClassFieldTheory Layers 12–13; GlobalNumberFields Layer 11; AnalyticNumberTheoryPartI §3.26; the quartic finite congruence count for item 1 only. Items 2–4 do not use that count. Sources: [[77]](#ref-77), Lemma 12 pp.1044–1045, Lemmas 24–26 and (33)–(34) pp.1056–1057; genus-theory step in the proof of Lemma 12.

**Checks.**

- `Cl(Z)=0`, so the split cubic algebra has `h_2^*=1`, rather than zero.
- `Q(sqrt(−5))` has `h_2^*=2`; the genus bound retains an `epsilon`-dependent constant.
- `g_K(3)=0`, while the bound at conductor norm one is `C h_2^*(K)` and counts only nontrivial quadratic extensions, not the split algebra `K×K`. For the noncyclic cubic field of discriminant `−23`, `K(i)/K` has conductor norm `64`, but its normal closure has group `S3×C2`, so a square conductor norm alone does not imply acceptability.
- For `K=Q³,d=1`, the split quartic algebra is allowed by (4); `d=0` and a nonsquare `d/Disc(K)` do not enter its stated domain.

<a id="non-s4-quartic-maximal-fields"></a>

**Non-S4 quartic maximal fields.** For `X≥1` the number of maximal quartic fields with group `D4,C4,V4` or `A4` and `0<|Disc|<X` is `O(X)`. Count maximal orders without cubic-resolvent multiplicity. For `D4` use the quadratic-tower Dirichlet series and its linear bound; cyclic and biquadratic fields have `O(X^(1/2)(log(2X))²)` count. For `A4`, whose cubic resolvent is a cyclic field, use the quartic fundamental-multiset main-body and irreducible-resolvent cusp upper estimates, which give `O(X)` without a full-`S4` sieve. Apply the weighted local series of [quartic maximal-order suborders](#quartic-maximal-order-suborders), and sum the independent content/resolvent factors, separating `p|j` from `p|c`, to obtain `O(X/p²)` for nonmaximal pair orbits in these field algebras, uniformly in `p`.

*Needs:* the quartic finite congruence geometry and cusp upper estimates; the two preceding arithmetic inputs; ClassFieldTheory Layer 12. Sources: [[77]](#ref-77), Lemma 11 and proof of Theorem 7, pp.1043–1054, for the irreducible-resolvent upper count; [Cohen–Diaz y Diaz–Olivier, *Enumerating quartic dihedral extensions*](https://doi.org/10.1023/A:1016310902973), §1.1 p.65 and Proposition 6.2, for the quadratic-tower counts. The `S4`-only Proposition 23 is not an input for this non-`S4` assertion.

**Checks.**

- `Q(zeta_5)` is a `C4` field of discriminant `125`; it is included.
- `Q(sqrt(2),sqrt(3))` is a `V4` field of discriminant `2304`; it is included once as a field, despite its three quadratic subfields.
- `Q(sqrt(5))×Q(sqrt(13))` is not a field and is excluded, even though its discriminant is nonzero.

<a id="refinement-quartic-fixed-reducible-resolvent"></a>

**Quartic fixed reducible resolvent.** For every `epsilon>0` and every reducible cubic ring `R` with nonzero discriminant `d`, the number of quartic-pair orbits with resolvent `R` is `O_epsilon(|d|^(1/4+epsilon))`. The constant is independent of `R`. This is the corrected loss-bearing input for the large-stabilizer estimate, not an `O(|d|^1/4)` assertion.

For the proof, The fixed-resolvent field count uses the squareclass/quadratic genus bound with an `epsilon` loss. Use `s_L(k)≪_epsilon k^(1/2+epsilon)` and its content-weighted fixed-index version from [quartic maximal-order suborders](#quartic-maximal-order-suborders). Since `k²|d`, the index contributes at most `|d|^(1/4+epsilon)` after dividing the epsilon budget among the algebra, divisor and content factors. Prove the preceding quartic maximal-order suborder and class-group/conductor inputs.

*Needs:* [ArithmeticStatisticsPartII, quartic ring and cubic resolvent][AS-II-8], [ArithmeticStatisticsPartII, existence and number of cubic resolvents][AS-II-9], GlobalNumberFields Layer 11; AnalyticNumberTheoryPartI §3.26; [quartic maximal-order suborders](#quartic-maximal-order-suborders) and [quartic class-group and conductor inputs](#quartic-class-group-and-conductor-inputs).

([[77]](#ref-77), Lemma 12 and proof, pp.1044–1046.)

**Checks.**

- The split resolvent `R=Z³` has discriminant one; its split quartic maximal order contributes one pair orbit.

- At squarefree nonzero `d`, the suborder index satisfies `k²|d`, hence `k=1`.

- `R=Z[T]/(T³)` has discriminant zero and is outside the target; `epsilon=1/24` gives the induced exponent `19/24<5/6`.

<a id="refinement-quartic-nonmaximal-overramified-tail"></a>

**Quartic nonmaximal overramified tail.** Let `W_p` be quartic pairs whose quartic ring is nonmaximal at `p`, or maximal with one of the overramified splitting types `P^4, P^2, P1^2 P2^2` of §3.2. For absolutely irreducible `S4` orbits, `N_i(W_p;X)<=C X/p^2` uniformly in primes `p` and `X>=1`. Restricting to nonmaximal pairs also satisfies this bound.

For the proof, For nonmaximal orders use the uniform weighted local series from [quartic maximal-order suborders](#quartic-maximal-order-suborders), and sum the content factor `sigma(c)/c⁶` independently. Separate the cases `p|j` and `p|c`; their weighted tails are `O(p⁻²)` and `O(p⁻⁵)`, respectively. For overramification use acceptable quadratic extensions of noncyclic cubic fields, square conductor norms, and the `O(X)` sum of their 2-class-group masses. The absolute convergence of sum `3^omega(m)/m^2` gives a `p`-independent constant.

*Needs:* [quartic finite congruence count](#refinement-quartic-finite-congruence-count), [ArithmeticStatisticsPartII, maximality of quartic rings at p][AS-II-10], [ArithmeticStatisticsPartII, existence and number of cubic resolvents][AS-II-9], [quartic maximal-order suborders](#quartic-maximal-order-suborders), [quartic class-group and conductor inputs](#quartic-class-group-and-conductor-inputs).

([[77]](#ref-77), Proposition 23, pp.1056–1058.)

**Checks.**

- The `S4` field defined by `T⁴−T−1` has maximal order of discriminant `−283`; at 5 that maximal order lies outside `W_5`.

- Its order `Z+5O_K` has index `5³`, discriminant `−283·5⁶`, and belongs to `W_5`.

- A maximal order of type `P⁴` belongs to `W_p`; tame type `(1²11)` does not. Products of quadratic fields are outside the `S4` domain.

### 2.9 Quintic-ring orbit counts

<a id="refinement-quintic-finite-congruence-count"></a>

**Quintic finite congruence count.** For `G_Z`-invariant finite congruence conditions `S` on integral quadruples of quinary alternating forms, count irreducible quintic-field orbits of signature `i=0,1,2` and `0<|Disc|<X`. Then `N_i(S;X)=C_i X nu(S)+o_S(X)`, where `C_i=zeta(2)^2 zeta(3)^2 zeta(4)^2 zeta(5)/(2 n_i), (n_i)=(120,12,8)`. The same main term holds for `S5` orbits. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`.

For the proof, Use the 40-dimensional finite-cover domain and lattice-translate volume `m^-40`. Integrate its 39-dimensional projection error. Bound the reducible cusp by the coordinate-zero cases. Lemma 14 discards non-`S5` orbits by finitely many splitting-type exclusions; do not identify `Q`-reducibility with non-`S5`.

*Needs:* [ArithmeticStatisticsPartII, quadruples of quinary alternating forms][AS-II-11], [ArithmeticStatisticsPartII, bhargava parametrization of quintic rings][AS-II-12], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[78]](#ref-78), Theorems 17–18, §2.7, pp.1585–1586; Lemma 14, p.1583; proof §3.2, pp.1587–1588.)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

- For the full residue set `nu(S)=1`; a single residue class modulo `m` has density `m⁻⁴⁰` before imposing invariance.

- A product algebra `Q×K_4` has nonzero discriminant when `K_4` is étale but is excluded from this quintic-field count.

<a id="refinement-quintic-nonmaximal-tail"></a>

**Quintic nonmaximal tail.** Let `W_p` be quadruples whose quintic ring is nonmaximal at `p`. For irreducible quintic-field orbits `N_i(W_p;X)<=C X/p^2`, with `C` independent of `p` and `X>=1`.

For the proof, For index `p^k` use the local suborder bound `O(p^min(2k−2,20k/11))`, with its uniformity obligation. A content-`n` ring has discriminant multiplied by `n^8` and `O(n^6)` resolvents. Sum `n^-2` and the local `k`-series uniformly in `p`. Prove the uniform local suborder bound before summing these series.

*Needs:* [quintic finite congruence count](#refinement-quintic-finite-congruence-count), [ArithmeticStatisticsPartII, maximality of quintic rings at p][AS-II-13].

([[78]](#ref-78), Proposition 19, §3.1, pp.1586–1588.)

### 2.10 Global-field orbit counts

<a id="function-field-lattices-and-shells"></a>

**Function-field lattices and shells.** Fix a global function field `F` with exact finite constants `F_q` and a nonempty finite place set `S`. Construct `O_S={a∈F:ord_v(a)≥0 for v∉S}`, `F_S=product_(v∈S) F_v`, and the discrete cocompact additive lattices obtained from fractional `O_S`-ideals, their translates and coefficientwise finite-index variants. Fix local additive measures by `vol(O_v)=1`, record the lattice covolumes, and use their reciprocal to normalize coefficient volume. Construct finite ideal-class charts and the corresponding representation lattices for the native `G_n,V_n`, including the affine quadratic model. The multiplicative height `|Delta|_S=product_(v∈S) q^(−deg(v)ord_v(Delta))` is counted on shells `|Delta|_S=X`, through the possible norm values; the shell measure is the restriction of coefficient Haar measure, not a real radial derivative.

Consume ArithmeticGaloisDuality §R02.3.2 `GlobalFunctionField.ideles`, `sUnits`, `sClassGroup`, `ideleDegree_principal`, `sUnits_exact` and `finite_sClassGroup`, with their finite/nonempty-`S` hypotheses. AlgebraicCurves Layers 3–5 supply `riemannRochSpace`, `Divisor.dim`, the Riemann–Roch theorem and the `deg D≥2g−1` dimension formula. Use these to construct ideal-lattice fundamental sets and count divisor-bounded sections. The completion-valued charts, their covolumes and their representation action are targets here. Sources: [[80]](#ref-80), §§3–4.1 pp.9–12 and §9 pp.25–28; AlgebraicCurves Layer 4, Stichtenoth Theorem 1.5.15.

**Checks.**

- For `F=F_2(t),S={infinity}`, `O_S=F_2[t]`, with units `F_2^×`, and the additive fundamental set at infinity is `t⁻¹F_2[[t⁻¹]]`. With `vol(O_infinity)=1`, its volume is `1/2`.
- There are exactly `q^(k+1)` polynomials of degree at most `k≥0` in `F_q[t]`, and `(q−1)q^k` of degree exactly `k`. A shell is not a cumulative sublevel.
- For `S=empty`, the diagonal constants are not a cocompact lattice in a product of completions yielding this count, and the divisor class group has infinite degree quotient; the nonempty hypothesis is required.

<a id="function-field-reduction-and-compact-count"></a>

**Function-field reduction and compact count.** For the preceding `F,S` and native `G_n`, construct a finite union of `S`-arithmetic Siegel domains covering a measurable fundamental multiset for every subgroup commensurable with `G_n(O_S)`. For `n=3,4,5`, use `N'T(c,c')K'` with the roots, balanced torus and compact factors of [[80]](#ref-80), (16)–(17); retain the finite central translate classes and their stabilizers. For `n=2` use the semidirect `G_a,G_m` coordinates of §9.2: its norm-one fundamental set is bounded. For any fixed compact boundary-null coefficient region `B⊂F_S^r`, lattice translate `L+b`, and central scalars `a_k` with `|a_(k,v)|_v→infinity` at every `v∈S`, prove `#((L+b)∩a_k B)=vol(a_k B)/covol(L)+o(vol(a_k B))`. The estimate is uniform for a fixed finite set of lattice cosets and a compact family of translates. Apply it to compact truncations and to differences defining admissible discriminant shells. Every class chart retains its covolume.

Use the `S`-unit and ideal-class statements in the preceding target, Riemann–Roch lattice counts on local boxes, and the explicit root-group elimination/reduction argument for these split groups. The root-group and torus reduction, bounded-overlap multiset and compact approximation are owned here. Sources: [[80]](#ref-80), §4.3, (16)–(17), Theorem 4.1 pp.12–14, §§4.4–4.6 pp.14–19, and §9.2 pp.26–27. *Needs:* the preceding target and AdelicAlgebraicGroups AA.0 restricted-product measures only.

**Checks.**

- On the rational-function-field polynomial lattice, the compact-count formula for the infinity ball of degree `k` is exactly `q^(k+1)` with the preceding covolume `1/q`.
- Passing to a fixed coefficient residue class modulo a degree-`d` polynomial divides this count by `q^d` once `k≥d−1`.
- At characteristic two, `(x,y)↦(x+t y,lambda y)` preserves the leading coefficient one; the upper triangular substitution can change it. A shell with no possible discriminant norm has empty fundamental slice and volume zero.

<a id="function-field-geometric-sieve"></a>

**Function-field geometric sieve.** Fix the preceding `F,S`, a closed finite-presentation subscheme `Z⊂A^r_(O_S)` of codimension `c≥2`, and a compact coefficient box `B`, a finite union of products of local balls. Choose `v_0∈S`, expand this box by a scalar `a_k` at `v_0` only, and put `T=|a_k|_(v_0)→infinity`. Outside a fixed finite bad-place set, bound the number of `u∈O_S^r∩a_k B` reducing into `Z(k(p))` at some `p∉S` with `N(p)>M≥2` by `O_(F,S,Z,B)(T^r/(M^(c−1) log M)+T^(r−c+1))`. The constants are independent of `M,k`. Include fixed lattice translates, fractional-ideal charts and the compact-truncation boxes of the preceding reduction target via finite denominator comparison. For moving cusp boxes retain their torus-dependent projection errors until integration; the compact-box estimate does not itself count a cusp.

Spread finite coordinate projections, use finite-field degree bounds, Riemann–Roch for residue-lattice boxes, and polynomial elimination for primes larger than the box. The prime-ideal sum uses the finite-field curve Weil estimate and partial summation. Prove the representation-specific cusp and local maximalization comparisons of §5 before the generic orbit tail. Sources: [[80]](#ref-80), Theorems 5.2–5.3 and proof pp.19–21; [[19]](#ref-19), §3 geometric-sieve argument, in the divisor-box formulation. *Needs:* the preceding two targets; DeligneWeightsAndPurity §1.6 and AlgebraicCurves Layers 3–5.

**Checks.**

- Over `F_q[t]`, the coordinate locus `u_1=u_2=0` has exactly `q^((r−2)(k+1))` points in degree-at-most-`k` boxes, compatible with the error term.
- A prime polynomial of degree greater than `k` divides a coordinate of degree at most `k` only if that coordinate is zero; the large-prime elimination term retains these points.
- Codimension one is excluded: the condition `u_1=0 mod p` at large primes has no reciprocal-square prime tail. Primes at the finitely many bad reductions are absorbed before `M` tends to infinity.

<a id="refinement-global-field-generic-finite-count"></a>

**Global field generic finite count.** Fix a global field `F`, a nonempty finite `S` containing the archimedean places, and `n` in `{2,3,4,5}`. For `n=3,4,5` use the representation `G_n,V_n` in Global Fields `I` Table 1. For `n=2` use §9’s affine representation `V={x^2+a xy+b y^2}`, with `G={[[1,0],[t,lambda]]:lambda invertible}`, acting by `(x,y)↦(x+t y,lambda y)` and `(a,b)↦(lambda a+2t,lambda²b+lambda t a+t²)`; this model works also in characteristic two and at places above 2. Fix an `S`-local type `sigma`. Let `Gamma` be commensurable with `G(O_S)`, let `L` be commensurable with `V(O_S)`, and require `Gamma` to preserve `L`. Let `F_G` be a fundamental domain for `Gamma` in `G(F_S)`. The generic `Gamma`-orbit count, weighted by `1/|Stab_Gamma(v)|`, is `vol_L(F_G(X)v_sigma)/|Aut(sigma)|+o(X)`. Number-field height regions have `0<|Delta|_S<X`; function-field regions have `|Delta|_S=X`, with `X` tending to `infinity` through admissible norm values. Additive volume is normalized by the coefficient lattice. An invariant finite congruence subset of `L` multiplies this main term by its actual finite residue density; independently imposed prime-power conditions factor that density. Generic means the `S_n`-field condition, not just nonzero `Delta`.

For the proof, Choose the `S`-arithmetic Siegel set and invariant bounded-height slice. Generic means the field/Galois-group condition in this representation, not merely nonzero discriminant. Use the lattice estimate on a compact truncation, the coordinate cusp estimate and finite splitting-type sieve to discard nongeneric points. For number fields use the AdelicAlgebraicGroups contracts; for function fields use the three preceding function-field targets. Retain the commensurable-lattice comparison below. Keep weighted counts and the source function-field norm shells. For `n=2` the bounded fundamental region and nonreductive Haar/Jacobian computation are §9.2 and §9.4 inputs; Table 1’s `G_m` model cannot parametrize characteristic-two quadratic extensions.

*Needs:* [ArithmeticStatisticsPartII, bhargava parametrization of quartic rings][AS-II-7], [ArithmeticStatisticsPartII, bhargava parametrization of quintic rings][AS-II-12], GeometryOfNumbersAndQuadraticArithmetic §4.1 in the number-field branch; [function-field lattices and shells](#function-field-lattices-and-shells), [function-field reduction and compact count](#function-field-reduction-and-compact-count), [function-field geometric sieve](#function-field-geometric-sieve).

([[80]](#ref-80), Theorem 4.7, §4.6, p.19; count convention §4.1; quadratic replacement §§9.1–9.4, pp.25–28.)

**Checks.**

- Over `Q`, the lower unipotent element with `t=1` sends `x²+y²` to `x²+2xy+2y²`; the upper unipotent sends it to `2x²+2xy+y²` and fails to preserve the carrier.

- Over `F_2(t)`, `x²+xy+t y²` is separable, with discriminant one; translating by `y` preserves the leading coefficient and separability.

- A function-field norm value outside the possible discriminant shells gives an empty slice and zero volume; the asymptotic uses only the admissible values.

<a id="refinement-global-field-large-prime-tail"></a>

**Global field large prime tail.** For the fixed global field, `S` and native representation of the preceding count, first take the standard arithmetic lattice `V(O_S)` and group `G(O_S)`. At each prime `p` outside `S` let `W_p` be the union of rings nonmaximal at `p` and rings with extra ramification there, in the intrinsic ring-theoretic sense of Global Fields `I` §5. Then `sum_{N(p)>M} N(W_p;X)=O(X/(M log M))+o(X)`, for `M>=2`, using stabilizer-weighted generic orbit counts and the same number-field regions or function-field norm shells. The `O` constant is independent of `M` and the negligible term is uniform for the sieve limit. Extension to a fixed `Gamma`-stable commensurable lattice requires a finite-index/denominator comparison; it is recorded in the supporting estimates below. For quadratic rings use the §9 model; there is no extra-ramification locus in that case. In characteristic two this is a maximality sieve, not an ordinary-discriminant squarefree sieve.

For the proof, The extra-ramification locus `W_p^(2)` reduces into a fixed codimension-two scheme; apply the `S`-arithmetic geometric sieve outside finitely many exceptional primes. The nonmaximal but not extra-ramified locus `W_p^(1)` admits local maximalization, a discriminant decrease by `N(p)^2`, and at most 10 orbit preimages. Use the finite ideal-class lattices and sum prime-ideal reciprocal squares. These intrinsic loci are not the polynomial strong/weak partition in characteristic two. For `n=2` use the change-of-generator argument of §9.3: nonmaximality yields a in `p` and `b` in `p^2` after a local group move. Record the separate group and fixed-lattice comparison adapters in the supporting estimates below.

*Needs:* [global field generic finite count](#refinement-global-field-generic-finite-count), [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[80]](#ref-80), Theorems 5.2–5.3 and proof, pp.19–21; quadratic maximal sieve §9.3, p.27.)

**Checks.**

- Over `F_2(t)`, `x²+t²xy+t²y²` defines a nonmaximal order at `(t)`: adjoining `w=alpha/t` gives `w²+t w+1=0`. Its discriminant is `t⁴`.

- The Artin–Schreier polynomial `x²+xy+t y²` defines a maximal order at every finite prime because its discriminant is a unit; it contributes no finite maximality tail.

- At `n=2` the extra-ramification locus is empty; at a fixed commensurable lattice only finitely many denominator primes alter the standard comparison.

<a id="refinement-global-field-large-local-count"></a>

**Global field large local count.** In the `Gamma`-stable commensurable lattice setting above, write `L_p` for each local coefficient-lattice closure and normalize `vol(L_p)=1`. Let `Z=L` intersection `intersection_{p outside S} Z_p`, where the local compact `Z_p` are invariant under the local closure of `Gamma`, have null boundary, and contain every maximal minimally ramified ring for all sufficiently large `p`. With stabilizer-weighted generic orbits and the same function-field norm-shell convention, `N(Z;X)=vol_L(F_G(X)v_sigma)/|Aut(sigma)|` times `product_{p outside S} vol(Z_p)+o(X)`. The factors are imposed independently; an arbitrary subset with these marginal closures is insufficient. The commensurable-lattice tail comparison and §9 quadratic model are explicit targets in the supporting estimates below.

For the proof, First fix finitely many local conditions and apply the finite count. The difference from all local conditions is bounded by the uniform tail; take `X` to `infinity` before `M`. Deduce convergence and the stated normalization, with zero products allowed.

*Needs:* [global field generic finite count](#refinement-global-field-generic-finite-count), [global field large prime tail](#refinement-global-field-large-prime-tail), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[80]](#ref-80), Theorem 5.1, pp.18–19; tail proof pp.19–21; quadratic specialization §§9.2–9.4, pp.27–28.)

**Checks.**

- With all `Z_p=L_p`, the density product is one and the finite generic count is recovered.

- If a single `Z_p` is empty, the global set and its main coefficient are zero; acceptability at the other primes does not restore nonemptiness.

- The two coupled residue classes `0,1 mod15` have density `2/15`; replacing them by the two marginal closures would give `4/15` and violates the intersection hypothesis.

### 2.11 Secondary cubic densities

<a id="refinement-cubic-secondary-congruence-count"></a>

**Cubic secondary congruence count.** For a sublattice `L` of integral binary cubic forms of index `T`, containing `m V_Z`, write `T=T1 T2` where the first coefficient projection has image `T1 Z` and `T2` is the index in each remaining-coordinate fibre. If `m^4<=X`, then `N_i(L;X/2,X)=c1_i X/(2T)+(1−2^(−5/6))c2_i X^(5/6)/(T1^(1/3) T2)+O(m X^(3/4)/T)`. Here `c1=(pi^2/72,pi^2/24)`; `c2` is the signed secondary coefficient of BST Theorem 6. The translated-lattice result has a separately computed `c2(L+a)`, not this same coefficient.

For the proof, Slice the averaged cusp by first coefficient, then smooth the arithmetic progression before summing its projection errors. The secondary first-coordinate term scales by `T1^(−1/3)`; the other coordinates scale by `T2^-1`. Keep the restriction `m^4<=X` and the error `m/T`. The full smoothing derivation is included in the supporting estimates below.

*Needs:* [davenport count of binary cubic forms](#davenport-count-of-binary-cubic-forms), [binary cubic counts with congruence conditions](#binary-cubic-counts-with-congruence-conditions), GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[79]](#ref-79), Theorem 27 and Remark 3, p.20; smoothing derivation pp.19–20.)

<a id="refinement-cubic-secondary-sieve-error"></a>

**Cubic secondary sieve error.** For strongly acceptable cubic local specifications (eventually all orders, maximal orders, or maximal non-totally-ramified orders), the finite-lattice secondary terms and their sieve remainders combine into `C1 X+C2 X^(5/6)+O_epsilon(X^(5/6−1/48+epsilon))`. `C1,C2` are the local mass and primitive index integral products of BST Theorem 7. This Layer 2 input retains the convergent local coefficients; the Roberts field/class-group consequences remain the Layer 3 targets.

For the proof, Replace squarefree-index nonmaximal conditions by simple-root/double-root lattice counts at heights divided by `k^2 l^4 m^4`. Split the modulus range, apply the secondary lattice estimate in the small range and the uniformity/switching estimates in the others. The complete optimization and local secondary coefficient calculation are included in the supporting estimates below.

*Needs:* [cubic secondary congruence count](#refinement-cubic-secondary-congruence-count), [uniformity estimate for nonmaximal binary cubic forms](#uniformity-estimate-for-nonmaximal-binary-cubic-forms), [uniformity estimate for binary cubic discriminants](#uniformity-estimate-for-binary-cubic-discriminants), AnalyticNumberTheoryPartI Layer 3 and AnalyticNumberTheoryPartII §5.21.

([[79]](#ref-79), Theorem 7, p.3; §9.1 switching identities (63)–(71), pp.27–28; §9.7 proof, pp.35–36.)

### 2.12 Summed square-divisor tails

<a id="refinement-square-divisor-tail"></a>

**Square divisor tail.** Given an integer-valued invariant `Delta` and real height `H` on a type `A, T(Delta,H;M,X)` consists of a with `H(a)<X, Delta(a)` nonzero, and an integer `m>M, m>=1`, squarefree, with `m^2` dividing `Delta(a)`. The multiplicity `w_M(a)` counts these `m` by filtering the natural divisors of `|Delta(a)|`. At `Delta=0` define `w_M=0`. This finite multiplicity is the one used in summed tails; a union-tail bound alone does not bound it.

The tail has exactly the stated membership condition. On the nonsingular height box, membership is equivalent to positivity of `Counting.squareDivisorMultiplicity`. Both the tail set and its multiplicity decrease with the modulus cutoff. The multiplicity is the finite filtered-divisor count, with value zero at zero discriminant.

For the proof, Use the finite positive divisor set of the nonzero invariant. Restrict its squarefree members by `m>M` and `m^2` divisibility. The zero convention agrees with removal of the singular locus, not with the infinitely many actual square divisors of 0.

*Needs:* `Set.ncard` (Mathlib), `Set.ncard_eq_toFinset_card` (Mathlib), `Nat.divisors` (Mathlib), `Squarefree` (Mathlib).

([[74]](#ref-74), Theorem 4.4 and (39), p.22; corrected nonzero domain.)

**Checks.**

- For a singleton input with `Delta=36, H=0, M=5,X=1`, the tail is inhabited by `m=6`. Its multiplicity is exactly 1, since 6 is the only allowed modulus.

- `Delta=1` has empty tail for `M>=1`.

- `Delta=0` has empty tail and multiplicity 0, although every positive square divides 0.

<a id="refinement-kappa-acceptable"></a>

**Weighted kappa acceptability.** Extend ArithmeticStatisticsPartI’s **Kappa acceptable specifications** with factors valued in `[0,1]`. For coordinate rank `r`, invariant `Delta:Z^r→Z` and `kappa≥0`, each factor must descend modulo `p^kappa`, and one threshold `P` must give `phi_p(a)=1` whenever `p>P` and `p²∤Delta(a)`. This adds weights and the cases `kappa=0,1` to the existing specification interface. Infinite products and real signatures use the congruence-function interface. For monic degree-`n` coefficients and `kappa≥2`, indicator factors are acceptable exactly when their residue subsets satisfy Part I’s predicate; the intersection of their one-loci is exactly `ArithmeticStatisticsPartI.localSpecificationFamily`.

The weight predicate records residue dependence, range `[0,1]`, and one eventual good-discriminant threshold. Its basic theory exposes that threshold and proves that a finite product over distinct primes factors through the coefficient residue modulo their product to the `kappa` power. At `kappa≥2`, indicator factors recover both ArithmeticStatisticsPartI’s acceptability predicate and its `localSpecificationFamily`.

For the proof, Compare coordinates modulo `p^kappa`. Keep a single threshold valid for every coefficient vector. The modulus dependence is what controls the total small-modulus error.

*Needs:* [ArithmeticStatisticsPartI, Kappa acceptable specifications](../ArithmeticStatisticsPartI/README.md#kappa-acceptable-specifications), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2], [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[74]](#ref-74), Definition of kappa-acceptability preceding Theorem 4.1, pp.20–21.)

**Checks.**

- The all-one factor family is acceptable with `kappa=0`.

- The factor testing evenness of the only coordinate at `p=2`, and 1 otherwise, is acceptable with `kappa=1` and `Delta=1`.

- The same nonconstant parity factor is not acceptable with `kappa=0`, since modulus 1 identifies every coefficient vector.

- For indicator factors and `kappa=2` on monic coefficients, full residue sets recover Part I’s unconstrained family; an empty residue set only at 2 is still acceptable and gives its empty `localSpecificationFamily`.

### 2.13 Monic weighted sieves

<a id="refinement-monic-rational-root-bound"></a>

**Monic rational root bound.** For monic degree `n>=2` integer polynomials with `|a_i|<X^i` and `X>=2`, the number with a rational root is `O_n(X^(D−n+1) log X), D=n(n+1)/2`.

For the proof, A rational root is integral and divides the constant term. Handle constant `term0` separately. Sum divisor multiplicities over all nonzero constant terms: the needed fact is the average `sum_{k<=Y} d(k)=O(Y log Y)`, not the false pointwise bound `d(k)=O(log Y)`. Solve the penultimate coefficient once the other coefficients and root are fixed.

*Needs:* [ArithmeticStatisticsPartII, one matrix slice][AS-II-14], AnalyticNumberTheoryPartI §§3.22,3.26.

([[74]](#ref-74), Lemma 4.2, p.21.)

<a id="plane-curve-normalization-bounds"></a>

**Plane-curve normalization bounds.** For an integral projective plane curve `C` of degree `d≥1` over a perfect field, construct its finite smooth projective normalization `nu:Ctilde→C` and prove `dim_k H¹(Ctilde,O)≤(d−1)(d−2)/2`; in the geometrically integral case this is the usual genus bound. The finite map is an isomorphism over the smooth locus. If `C` is geometrically integral over `F_q`, bound its geometric singular points by `d(d−1)` and each normalization fibre by `d`, giving `|#C(F_q)−#Ctilde(F_q)|≤(d+1)d(d−1)`. These bounds, including the finitely many points at infinity in an affine chart, supply the curve base case of Lang–Weil. At a rational smooth place choose a uniformizer and identify vanishing order with the first nonzero power-series coefficient via `TauCeti.Place.powerSeriesExpansion` and `TauCeti.Place.mem_filtration_iff_coeff_powerSeriesExpansion_eq_zero`; over `Q_p` the residue-class determinant argument also uses `hensels_lemma` at a coordinate derivative that is a unit.

Use AlgebraicCurves Layers 2 and 12 for normalization and scheme comparison. The finite-normalization exact sequence makes the normalization's `H¹` a quotient of the plane curve's `H¹`; the plane hypersurface sequence computes the latter dimension. Bound the singular locus using a nonzero partial derivative and `bezout_inequality` of SchemeAndStackFoundations §5.12. Sources: [Stacks 0BYD](https://stacks.math.columbia.edu/tag/0BYD), Lemma 53.9.3; [Stacks 0CE3](https://stacks.math.columbia.edu/tag/0CE3), Lemma 53.18.3; [[83]](#ref-83), proof of Theorem 3.6 p.3. *Needs:* those normalization, coherent-cohomology and intersection suppliers, and the pinned place expansion declarations with `P.degree=1,P.ord t=1`.

**Checks.**

- A line has normalization `P¹`, genus zero and no singular-point discrepancy.
- The cuspidal cubic `y²z=x³` in characteristic zero normalizes to `P¹`: its normalization genus is zero, while its plane arithmetic genus is one.
- A split nodal integral cubic over a finite field of odd characteristic has two rational normalization points above its rational node, so `#Ctilde(F_q)−#C(F_q)=1`. For a nonsplit node that difference is `−1`; normalization does not preserve rational point counts at singularities.

<a id="rectangular-plane-curve-count"></a>

**Rectangular plane-curve count.** Fix `d≥1` and `ε>0`. For an irreducible nonconstant `F∈Z[u,v]` of total degree `d` and real `P_1,P_2≥2`, let `T=max{P_1^i P_2^j : u^i v^j occurs in F}`. Then `T≥2` and
`#{(u,v)∈Z²:F(u,v)=0, |u|≤P_1, |v|≤P_2} ≪_(d,ε) max(P_1,P_2)^ε exp(log(P_1)log(P_2)/log(T))`.
The constant is independent of the coefficients of `F`. In particular, the occurrence of a pure monomial `u^m` with `m≥1` gives the upper bound `max(P_1,P_2)^ε P_2^(1/m)`.

For an absolutely irreducible curve homogenize with the extra coordinate fixed to one. In the determinant method order the auxiliary monomials by their rectangular weights and exclude multiples of a leading monomial of `F`. On each good-prime residue class compare the real determinant bound from those weights with the `p`-adic divisibility obtained by expanding in a smooth local parameter. Choose the auxiliary degree and prime ranges with `ε` slack so that the determinant vanishes. The resulting auxiliary polynomial is not divisible by `F`; Bézout bounds its intersections with `F`. Singular classes and exceptional primes are handled by the uniform coefficient-height alternative in this argument, so the final bound does not acquire a coefficient-dependent constant. If `F` is irreducible over `Q` but not absolutely irreducible, its rational points lie on intersections of distinct conjugate components; Bézout gives `O_d(1)` instead. Sources: [Dietmann](https://arxiv.org/pdf/1010.5341v1), Lemma 6 and its proof, p.4; [Browning–Heath-Brown, *Plane curves in boxes and equal sums of two powers*](https://arxiv.org/pdf/math/0506497v1), Theorem 1 and (3), p.2, §2 pp.4–11 for the determinant argument, with the integral-point specialization (3) on p.2. *Needs:* AlgebraicCurves Layers 2,12 (normalization and scheme comparison); SchemeAndStackFoundations §5.12 `bezout_inequality`; Tau Ceti’s `TauCeti.Place.powerSeriesExpansion` and `TauCeti.Place.mem_filtration_iff_coeff_powerSeriesExpansion_eq_zero` at rational smooth places with a uniformizer; Mathlib matrices, determinants, integer divisibility and `p`-adic valuations; AnalyticNumberTheoryPartI Layer 0 and §§3.1,3.26 (prime selection and elementary size estimates). The rectangular determinant estimate is proved here; ordinary lattice-point counting does not supply it.

**Checks.**

- `F=u` has exactly `2⌊P_2⌋+1` points; the formula gives `O(P_2 max(P_1,P_2)^ε)`.
- `F=u^m−v`, `P_1=Y`, `P_2=Y^m`, has `2⌊Y⌋+1` points, while `T=Y^m` gives the exponent `Y`, up to `ε`.
- `F=u²−2v²` is `Q`-irreducible but not geometrically irreducible and has only `(0,0)` as an integer zero. The conjugate-component branch covers it. Requiring `P_i≥2` also prevents the undefined `log T=0` case.

<a id="weighted-monic-galois-exclusion"></a>

**Weighted monic Galois exclusion.** Fix `n≥2`, `G≤S_n`, `m=[S_n:G]` and `ε>0`, and put `D=n(n+1)/2`. Among the separable monic integer polynomials with `|a_i|<X^i`, `X≥2`, those whose root-permutation group is conjugate to `G` number
`O_(n,ε)(X^(D−n+1)+X^(D−n+n/m+ε))`. Constants are uniform in the coefficients being specialized; `n` is fixed. This is an anisotropic-box estimate, not a consequence of qualitative Hilbert irreducibility.

To prove it, fix `a_1,…,a_(n−2)` and vary `a_(n−1)`. The generic polynomial over `Q(t)` fails to have group `S_n` for at most `n²+n` values; these fibres contribute `O(X^(D−n+1))`. On each other fibre use PolynomialGaloisGroups Layer 4'`s` integral orbit-resolvent construction and write `H=G` and choose a primitive `H`-invariant with distinct generic coset values. To make that choice uniform, span the splitting field by monomials in its `n` roots with each exponent less than `n!`, then take `H`-orbit sums. For each pair of cosets equality of values is one proper linear condition on the coefficients of their linear combination. A grid with more than `binomial(m,2)` integer values in each coefficient avoids the union of those hyperplanes. Thus the degrees and chosen coefficients are bounded in terms of `n` alone. The resulting generic resolvent is irreducible and monic of degree `m`; every specialization with group conjugate to `H` still supplies an integral root, without a specialized separation hypothesis. Its root bound is `X^C` with `C` depending only on `n`. The uniform two-variable integral-point estimate, with side lengths `X^C,X^n` and the pure root monomial of degree `m`, gives `O_(n,ε)(X^(n/m+ε))` specializations. Sum the `O(X^(D−n))` other fibres. The resolvent construction must retain the generic irreducibility and integral-root implication; an arbitrary resolvent with repeated values does not suffice. Sources: [Dietmann, *On the distribution of Galois groups*](https://arxiv.org/pdf/1010.5341v1), Lemmas 1,2,5,6 and the proof of Theorem 1, pp.3–5, with the side lengths changed as above; [[74]](#ref-74), proof of Proposition 4.3 pp.21–22. *Needs:* TauCetiRoadmap.PolynomialGaloisGroups Layers 0,2,4 (root actions, static integral resolvents and separation evidence); InverseGaloisAndArithmeticFundamentalGroups:IG.0–IG.2 (specialization); [rectangular plane-curve count](#rectangular-plane-curve-count).

**Checks.**

- For `G=S_n`, `m=1`, the exponent is `D`, so this statement supplies no false saving on the full group.
- In degree four the conjugate-quadratic wreath group has index three, giving `10−4+4/3=22/3`; using index six would give an unjustified stronger bound.
- For a proper group of index two the second exponent is `D−n/2+ε`. Exceptional generic fibres still contribute the first term and cannot be discarded.

<a id="refinement-monic-extra-reducible-bound"></a>

**Monic extra reducible bound.** Let `V_n^red` be the union of monic polynomials reducible over `Q` and, for even `n>=4`, products of two conjugate factors over a quadratic extension. In the weighted box, its size is `O_n(X^(D−n+1) log X)` for `n>=2,n!=4`; for `n=4` the source argument supplies `O_epsilon(X^(22/3+epsilon))`.

For the proof, Separate the rational-root case and other proper Galois-group subgroups. Use the weighted monic Galois exclusion above with its subgroup index retained. For conjugate quadratic factors at `n=4` the subgroup index can `be3, giving22/3`, which still suffices for the tail. The weighted-box estimate is separate from qualitative Hilbert irreducibility. For even degree the conjugate-factor splitting group is contained in a wreath product of order `2((n/2)!)^2`. Its index is 3 in degree 4 and 10 in degree 6; the latter already exceeds `n` and supplies the claimed non-quartic saving. Retain the subgroup index in the quantitative weighted-box estimate.

*Needs:* [monic rational root bound](#refinement-monic-rational-root-bound), [weighted monic Galois exclusion](#weighted-monic-galois-exclusion).

([[74]](#ref-74), Proposition 4.3, pp.21–22.)

**Checks.**

- At degree 2 the exceptional locus contains only `Q`-reducible polynomials; quadratic conjugate factors are included only for even degrees at `least4`.

<a id="weighted-distinguished-selberg-sieve"></a>

**Weighted distinguished Selberg sieve.** Let a finite nonnegative weighted multiset of integer vectors have total comparison mass `V`. Outside a fixed finite prime set, let forbidden residue sets have proportions `g(p)` with `c≤g(p)≤1−c` for one fixed `c>0`. For squarefree `d` put `g(d)=∏_(p|d)g(p)`. Suppose the mass satisfying all forbidden conditions at `p|d` is `V g(d)+r_d`, with `|r_d|≤C_ε E d^(1+ε)` uniformly. Then for `L≥2` the mass avoiding every forbidden set at primes `p≤√L` is `O_ε(V L^(−1/2+ε)+E L^(2+ε))`. Constants depend on `c`, the finite exceptional set and the displayed remainder constants. This applies to an averaged torus count only after the same remainder bound has been integrated against its positive Haar weight.

Use Selberg's square majorant with coefficients supported on squarefree integers at most `√L`. Minimizing its main quadratic form gives the reciprocal of `Σ_(d≤√L) μ²(d)∏_(p|d)g(p)/(1−g(p))`, whose lower bound is `L^(1/2−ε)`; fixed exceptional primes do not alter that exponent. Bound the minimizing coefficients by `d^ε`. Group pairs of divisors by their least common multiple, at most `L`, to bound the remainder by `E Σ_(d≤L) d^(1+ε)3^ω(d)=O_ε(E L^(2+ε))`, after shrinking the auxiliary `ε`. Sources: [[74]](#ref-74), Proposition 2.6 p.13 and Proposition 3.5 p.19, whose Selberg step is expanded here. *Needs:* AnalyticNumberTheoryPartI Layer 3 (multiplicative sums and partial summation); the finite quadratic-form minimization and divisor grouping in this proof. For the distinguished representation, the additional geometric input is the uniform good-prime exclusion proportion and integrated remainder `E=X^(D−1)` on the `b_11≠0` region, obtained from its residue-class lattice count; neither follows from an unweighted pointwise torus error.

**Checks.**

- With `V=X^D`, `E=X^(D−1)` and `L=X^(2/5)`, both terms have exponent `D−1/5+ε`.
- If `g(p)=0` at every good prime, the conclusion would falsely save a power on an unrestricted multiset; the positive lower bound is essential.
- Counting each least common multiple once without its divisor-pair multiplicity would miss `3^ω(d)`; retaining it changes only the `ε` loss.

<a id="refinement-monic-distinguished-off-block"></a>

**Monic distinguished off block.** For the odd/even split orthogonal slices of Layer `1, n>=3`, an averaged torus count over a fixed bounded fundamental slice of distinguished nonzero-discriminant matrices outside `W00` is `O_epsilon(X^(D−1/5+epsilon))`. `W00` has entries `b_ij=0` for `i+j<n`. Use the source integral lattices (half-integral odd and quarter-integral even), not an all-integral symmetric-matrix substitute.

For the proof, Separate `b11=0 (O_epsilon X^(D−1+epsilon))` from `b11` nonzero. The latter distinguished locus avoids a uniformly positive fraction of good-prime classes. Establish remainder `r_d=O_epsilon(X^(D−1)d^(1+epsilon))` and apply the weighted distinguished Selberg sieve; balance `X^D L^(−1/2+epsilon)+X^(D−1)L^(2+epsilon)` at `L=X^(2/5)`.

*Needs:* [ArithmeticStatisticsPartII, one matrix slice][AS-II-14], GeometryOfNumbersAndQuadraticArithmetic §4.1, [weighted distinguished Selberg sieve](#weighted-distinguished-selberg-sieve).

([[74]](#ref-74), Propositions 2.5–2.6, p.13; Propositions 3.4–3.5, p.19.)

<a id="refinement-monic-q-cusp-tail"></a>

**Monic q cusp tail.** In the deepest block `W00` of the same orthogonal-slice averaged count, nonzero-discriminant matrices with `|Q|>M` contribute `O_n(X^D log X/M)` for odd `n` and `O_n(X^D(log X)^2/M)` for even `n, X>=2,M>=1`. The `Q` character is `product_{i=1}^g s_i^(−i)` in both cases.

For the proof, A nonzero determinant forces a lattice point only when each necessary coordinate interval has length at least its lattice spacing. Insert a largest-index coordinate factor and the correct `Q` torus weight; integrate the restricted torus ranges. The even torus density has final exponent `−g(g+1)/2` and two possible logarithmic ranges. Use `s_i=t_i/t_(i+1)` for `1<=i<=g` and `s_(g+1)=t_g t_(g+1)` in the even case. The identity `(t_1...t_g)^(-1)t_(g+1)^g=product_{i=1}^g s_i^(-i)` fixes (36), and the following integral uses this negative exponent.

*Needs:* [ArithmeticStatisticsPartII, marked q][AS-II-15], [ArithmeticStatisticsPartII, q discriminant divisibility][AS-II-16], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[74]](#ref-74), Proposition 2.7, p.14; Proposition 3.6 and (36)–(37), pp.19–20; even torus coordinates p.18.)

<a id="refinement-monic-strong-tail"></a>

**Monic strong tail.** For `n>=2, D=n(n+1)/2, X>=2,M>=1`, the union of monic weighted-box polynomials strongly `p^2`-divisible for every `p` dividing some squarefree `m>M` has size `O_{n,epsilon}(X^(D+epsilon)/M+X^(D−1))`.

For the proof, The strong locus lies on a fixed codimension-two reduction scheme. Adapt the geometric sieve to sides `X,X^2,...,X^n` by slicing; control the shorter faces separately. The isotropic BSW geometric-sieve theorem alone does not establish this anisotropic estimate.

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[74]](#ref-74), Theorem 1.5(a), pp.3–4; §4 weighted geometric sieve.)

<a id="refinement-monic-weak-tail"></a>

**Monic weak tail.** For `n>=3` the corresponding weak-every-prime union has size `O_{n,epsilon}(X^(D+epsilon)/M+X^(D−1/5+epsilon))`. Only odd squarefree `m` have a nonempty weak locus. The zero-discriminant locus can appear in the union convention; the summed tail removes it.

For the proof, Lift weak forms to marked distinguished slices with preserved invariant and marked `|Q|=m`. Use the off-block and `Q`-cusp bounds. Include the corrected non-generic quartic contribution, and do not discard even lift flag/ruling obligations from Layer 1.

*Needs:* [ArithmeticStatisticsPartII, weak lift odd][AS-II-17], [ArithmeticStatisticsPartII, even weak lift][AS-II-18], [monic distinguished off block](#refinement-monic-distinguished-off-block), [monic q cusp tail](#refinement-monic-q-cusp-tail), [monic extra reducible bound](#refinement-monic-extra-reducible-bound).

([[74]](#ref-74), Theorem 1.5(b), p.4; §§2–4.)

<a id="degree-two-monic-weak-tail"></a>

**Degree-two monic weak tail.** For `X≥2,M≥1,epsilon>0`, count `x²+a x+b` with `|a|<X,|b|<X²,Delta=a²−4b≠0` and some squarefree `m>M` for which divisibility is weak at every `p|m`. Their number is `O_epsilon(X^(3+epsilon)/M+X^(14/5+epsilon))`. In fact the stronger `O(X³/M+X²)` bound holds. Weak moduli are odd. Nonzero discriminant implies `m≤sqrt(5)X`; for fixed `a` and odd `m`, `m²|a²−4b` restricts `b` to one residue modulo `m²`, giving `O(X²/m²+1)` possibilities. Sum over `a,m`; this also bounds the union by a finite sum.

*Needs:* the square-divisor tail, elementary congruences and AnalyticNumberTheoryPartI §3.26 for subsequent multiplicity losses. Source: [[74]](#ref-74), Theorem 1.5(b) p.4 and the degree-two boundary of Theorem 4.4 p.22; the displayed elementary quadratic argument supplies this case independently of the higher-dimensional lift.

**Checks.**

- `x²−25` has `Delta=100` weakly divisible by `5²`, and enters the tail for `M<5,X>5`.
- `x²+x` has `Delta=1` and no allowed modulus for `M≥1`.
- `x²` has zero discriminant and is excluded; at `M≥sqrt(5)X` the whole nonzero-discriminant tail is empty.

<a id="refinement-monic-summed-tail"></a>

**Monic summed tail.** For every `n>=2` and `epsilon>0`, the sum over squarefree `m>M` of `# {monic weighted-box f : Delta(f) nonzero, m^2 divides Delta(f)}` is `O_{n,epsilon}(X^(D+epsilon)/sqrt(M)+X^(D−1/5+epsilon))`, for `X>=2,M>=1`.

`Counting.monicWeightedBox` with parameters `n,X` is the same strict coefficient box on `ℤ[X]`: monic degree `n` polynomials whose descending coefficient `a_i` satisfies `|a_i|<X^i`. This box is finite. `Counting.monic_summed_tail` states the bound as the sum of `Counting.squareDivisorMultiplicity` over this box, using Mathlib’s `Polynomial.discr`. For a real cutoff `M≥1`, the natural cutoff is `floor(M)`; these select exactly the same integral moduli. Finiteness of the box and the nonzero-discriminant divisor sets makes this sum equal to the displayed sum over moduli.

For the proof, Factor the squarefree `m` into strong and weak parts; one exceeds `sqrt(M)`. Sum nonzero-invariant divisor multiplicities with an `epsilon` loss. Use dyadic ranges and uniform strong/weak estimates, with the preceding degree-two monic weak tail when `n=2`. Nonzero `Delta` bounds `m` and makes the exchange of sums finite. The degree-two input is the preceding named target.

*Needs:* [square divisor tail](#refinement-square-divisor-tail), [monic strong tail](#refinement-monic-strong-tail), [monic weak tail](#refinement-monic-weak-tail), [degree-two monic weak tail](#degree-two-monic-weak-tail), AnalyticNumberTheoryPartI §§3.22,3.26.

([[74]](#ref-74), Theorem 4.4, (39), p.22.)

**Checks.**

- `x²−9` has `Delta=36`; at `M=5` its multiplicity is one (`m=6`), and at `M=6` it is zero.

- `x²+x` has `Delta=1` and contributes zero for every `M≥1`.

- `x²` has `Delta=0` and is excluded, preventing an infinite modulus sum from a single polynomial.

<a id="refinement-monic-fixed-modulus-sieve"></a>

**Monic fixed modulus sieve.** Let `n>=2,kappa>=1, Sigma_p` residue conditions modulo `p^kappa` be acceptable, and `Sigma_infinity` a nonempty collection of permitted real root types. Then the count in the weighted box equals `vol(Sigma_infinity∩{H<1}) product_p vol(Sigma_p) X^D + O_{n,Sigma,kappa,epsilon}(X^(D−min(1/5,1/(2kappa))+epsilon))`. Here `Sigma=(Sigma_infinity,(Sigma_p)_p)` is fixed before `X` tends to `infinity`; the implied constant may depend on its exceptional primes and residue conditions. The infinite product and singular-locus removal are included in the assertion.

`Counting.monic_fixed_modulus_sieve` states this estimate with the residue specifications themselves, the permitted real root counts and the convergent product of finite residue probabilities.

For the proof, Use Mobius truncation only on `Delta` nonzero and CRT for the small squarefree moduli. Bound `Delta=0` by `O(X^(D−1))`. For fixed `Sigma` the excluded residue density satisfies `theta_bar(m)≪_{Sigma,epsilon}m^(−2+epsilon)` on squarefree `m`, after absorbing its finitely many exceptional primes. Truncate at `Y=X^(1/kappa)`. The congruence remainder is `X^(D−1)` times the sum of `theta_bar(m)m^kappa` for `m≤Y`, hence `O_{Sigma,kappa,epsilon}(X^(D−1/kappa+epsilon))`, with the logarithm absorbed when `kappa=1`. The Euler-product remainder is `O_{Sigma,epsilon}(X^D/Y^(1−epsilon))`; combine both with the summed tail at `Y`. The displayed source middle exponent `D−n` is not used.

*Needs:* [weighted kappa acceptability](#refinement-kappa-acceptable), [monic summed tail](#refinement-monic-summed-tail), [local density of values divisible by p squared](#local-density-of-values-divisible-by-p-squared), GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[74]](#ref-74), Theorem 4.1, p.21; proof (41), p.23.)

**Checks.**

- With every finite local condition equal to the full coefficient lattice, the finite density product is one; the real root-type restriction still determines the archimedean volume.
- If one local allowed set is empty, both the actual count and the density product vanish.
- Dependence on `Sigma` is necessary: fix a large `X` and choose a prime `q` much larger than the weighted box. At `q` exclude exactly the reductions of all integral vectors in that box; impose no other finite restriction. This is an acceptable family with `q` as an exceptional prime, its actual count at `X` is zero, and its local density tends to one as `q` grows. Thus no error constant uniform in all `Sigma` can give a power saving. The theorem fixes this family before taking its asymptotic limit.

### 2.14 Invariant geometric-sieve criterion

<a id="refinement-invariant-geometric-sieve-criterion"></a>

**Invariant geometric sieve criterion.** Let `G` act integrally on `V` of positive rank `r` and let `f` be a primitive geometrically squarefree relative invariant of positive degree `d`. Put `G^1=ker(det(rho))`, for the representation `rho:G→GL(V)`. Require a `G(Z)`-invariant density-one generic coefficient locus with uniformly bounded finite geometric stabilizers, a continuous homogeneous degree-`d G^1`-invariant height, finite-volume fundamental domains `F_X=X^(1/d)F_1`, and finite-congruence main terms at scale `X^(r/d)`, with actual CRT residue densities. For every weakly `p^2`-divisible generic `v` require a rational group element `g` such that `g v` is again integral and generic, `H(g v)=H(v)/p^a`, and `g v` modulo `p` lies in a closed `G`-invariant subscheme `Y_k` of codimension at least `k`. Here `Y_k` depends only on `k, k` is uniformly bounded, `a>=0, (r/d)a+k−1>=eta>0`, and for fixed `k` each resulting `G(Z)`-orbit has uniformly boundedly many original `G(Z)`-orbits. Then coefficient boxes have squarefree density `product_p(1−c_p/p^(2r))`, where `c_p` counts the `f`-zero residues modulo `p^2`. The compact-domain approximation and boundary regularity used to pass from fundamental regions to boxes are included in the supporting estimates below; all six representation-specific conditions are required.

For the proof, Strong divisibility is handled by the codimension-two sieve; split the weak cases by `k` and apply the height-lowering map. The positive `eta` makes the large-prime tail negligible after compact truncation. Take the height limit before prime truncation; do not assert this for arbitrary multivariate polynomials. Verify all six hypotheses for every representation to which the criterion is applied. For the coefficient-box conclusion approximate the box by finitely many translated height domains, then take the prime threshold, compact truncation and cover-size limits in that order. Use `c_p/p^(2r)`, correcting (40)–(44).

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[81]](#ref-81), Conditions (1)–(6), p.8; Theorem 2.1, p.9; proof §3.4, pp.14–18; corrected (40)–(44), pp.17–18.)

### 2.15 Odd-degree binary-form sieves

<a id="refinement-binary-strong-tail"></a>

**Binary strong tail.** For degree `n>=3` integral binary forms with coefficient `sup` norm`<X`, the strong-every-prime union over squarefree `m>M` is `O_{n,epsilon}(X^(n+1+epsilon)/M+X^n)`. Use the universal fixed-degree binary discriminant even when the leading coefficient vanishes.

For the proof, Apply the geometric sieve on the coefficient cube to the codimension-two strong locus; control boundary faces. The discriminant specializes as a homogeneous degree `2n−2` polynomial on `n+1` coefficients, not the lowered-degree univariate discriminant.

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [ArithmeticStatisticsPartI, binary discriminant][AS-I-3].

([[82]](#ref-82), Theorem 5(a), pp.3–4.)

<a id="refinement-odd-binary-cusp-count"></a>

**Odd binary cusp count.** Let `n=2g+1>=3,Y=X^(1/n)`, the Layer 1 marked symmetric-pencil lift and fixed bounded slice be used, with torus `s_i=(t_i/t_(i+1))^(1/n)` and density `product_i s_i^(−n i(n−i))`. The averaged main body is `O_epsilon(X^(n+1−1/(2n)+epsilon))`, the shallow cusp `O(X^(n+1−1/n))`, and the deep cusp with `|Q|>M` is `O_epsilon(X^(n+1+epsilon)/M)`. Main, shallow and deep mean respectively `a11` interval length`>=1, a11` shorter with some entry of the upper `g`-block nonzero, and the whole upper `g`-block zero.

For the proof, Use weights `t_i^-1 t_j^-1` for both symmetric matrices, and `Q` character `product_{i<=g} t_i^-1`. Count the main-body projections, separate the shallow coordinate-zero cases, and integrate deep-cusp lattices with `Q>M`. These estimates concern the selected generic lift locus and its averaging integral.

*Needs:* [ArithmeticStatisticsPartII, weak lift odd][AS-II-17], [ArithmeticStatisticsPartII, q hyperdeterminant][AS-II-19], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[82]](#ref-82), §4 (14)–(17), Propositions 4.4,4.5,4.8, pp.16–23.)

<a id="refinement-odd-binary-weak-tail"></a>

**Odd binary weak tail.** For odd `n>=3`, the weak-every-prime coefficient-box union over squarefree `m>M` has size `O_{n,epsilon}(X^(n+1+epsilon)/M+X^(n+1−1/(2n)+epsilon))`. Its nonempty weak moduli are odd.

For the proof, Transfer weak forms into marked pencils with `Q=m` and bounded orbit fibres using the Layer 1 lift. Use all three cusp estimates and an explicit quantitative nongeneric exclusion. Keep the ambient `SL_n` pencil representation separate from the orthogonal monic slice.

*Needs:* [odd binary cusp count](#refinement-odd-binary-cusp-count), [ArithmeticStatisticsPartII, weak lift odd][AS-II-17], [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[82]](#ref-82), Theorem 5(b), pp.3–4; Proposition 4.2 and §4.)

<a id="row-spanning-count"></a>

**Row-spanning count.** For `m≥2,1≤r<m`, a primitive lattice `Λ⊂Z^m` of rank `r`, `s∈SL_m(R)` and `Y≥1`, let `S_span(Λ)` be the integral symmetric matrices whose rows are contained in `Λ` and span `Λ⊗R`. They need not generate `Λ` integrally. Fix a bounded coefficient ball `D` in the symmetric matrices. Put `gamma=s⁻¹`, let `mu_1≤…≤mu_r` be the minima of `gamma Λ`, and set `d_gamma=covol(gamma Λ)`. There are constants depending only on `m,D` such that

`# {B∈S_span(Λ): gamma B gamma^t∈YD} ≤ C Y^(r(r+1)/2) d_gamma^(−r−1) product_(1≤i<j≤r, i+j≤r+1)(mu_j/mu_i)`.

The set is empty unless `mu_i mu_(r+1−i)≤C Y` for all `1≤i≤r`. In dyadic ranges `L_i≤mu_i<2L_i`, replace the minima by `L_i` and `d_gamma` by `product_i L_i`, up to constants depending only on `m`. The lower-rank matrices in the row-contained lattice do not satisfy this spanning assertion. The transformed covolume is essential when `s` stretches the row space.

Use the symmetric-square lattice of a reduced basis, the full-rank determinant condition and successive-minimum counting; the lattice basis products have lengths comparable to `mu_i mu_j`. *Needs:* GeometryOfNumbersAndQuadraticArithmetic Layers 0–3 and §4.1. Source: [[82]](#ref-82), §5 Propositions 5.4–5.5 and proof of (25)–(27), pp.22–23, with row containment and full rank explicit and covolume taken after `gamma`.

**Checks.**

- For `r=1,Λ=Z e_1,s=1`, the matrices are `b e_1 e_1^t` with nonzero `b`, and their count in the unit sup-norm ball dilated by `Y` is `2 floor(Y)`. The bound is `O(Y)`.
- For `Λ=Z e_1` and `gamma=diag(T,T⁻¹,1,…)`, this count is `2 floor(Y/T²)`; it vanishes for `T²>Y`. The transformed covolume factor is `T⁻²`.
- The zero matrix belongs to every row-contained lattice but never to `S_span(Λ)` when `r>0`. For `r=2`, `diag(1,0,0)` is excluded from the spanning set on `Z e_1+Z e_2`.

<a id="paired-fibre-counting-hypothesis"></a>

**Paired-fibre counting hypothesis.** Fix even `n=2g+2≥4`, put `m=n+1`, and fix the bounded symmetric coefficient ball `D`, a compact averaging set and positive constants `Theta_1,Theta_2` supplying the torus and minimum-range coverage below. Write `s=diag(t_1⁻¹,…,t_m⁻¹)` in the source's positive Siegel torus, `product t_i=1`, with simple-root coordinates and Haar character `delta(s)` as in [[82]](#ref-82), §6.1. Restrict to `Y^(−Theta_1)≤t_i≤Y^Theta_2`. For each `0<kappa<1`, let `L_good(M)` be the union, over odd squarefree `d>M`, of `SL_(n+1)(Z)`-translates of the even lifts `sigma_d(f)` with `f∈W_d^(2)`, `gcd(d,f(0,1))=1`, full `S_n` group and the retained `kappa` discriminant/constant-term inequalities below; carry their integral flags and rulings through the action. For every primitive rank-`n` lattice `Λ⊂Z^m`, dyadic `L_1≤…≤L_n` with `Y^(−Theta_1)≤L_i≤Y^Theta_2`, and exact coordinate zero patterns `Z=(Z_A,Z_B,Z_ell)` for the two matrices and chosen basis, define the finite fibre `P_kappa(Λ,Z;Y,s,M,G)` to consist of integral symmetric pairs satisfying all of:

- `s⁻¹As⁻t,s⁻¹Bs⁻t∈YD`, `B∈S_span(Λ)`, and the minima of `s⁻¹Λ` lie in `[L_i,2L_i)`; `A_ij=0` for `Z_A`, `B_ij=0` for `Z_B`, with the entries designated nonzero in the pattern actually nonzero.
- The pair belongs to this marked weak-lift union `L_good(M)`: it has invariant form `x f`, where `f` has degree `n`, nonzero discriminant, full `S_n` group, retained small-discriminant/constant-term inequalities, and the marked `|q|>M`. The integral flag and ruling are those of ArithmeticStatisticsPartII's even weak lift. In particular `rank B=n` and its kernel is not `A`-isotropic.
- In a deep fibre both actual upper `(g+1)`-square blocks vanish. In a shallow fibre the `a_11` coordinate interval is shorter than one and some entry of these blocks is nonzero. In a main fibre that interval has length at least one. Impose every additional zero forced by `|A_ij|,|B_ij|≤C_D Y/(t_i t_j)<1`.
- Choose one almost reduced basis `ell_1,…,ell_n` of the actual saturated row lattice, with `|s⁻¹ell_i|` comparable to `L_i`. Its required coordinate zeros hold on these vectors themselves: a coordinate bound `C_n L_i/t_j<1` forces `ell_(i,j)=0`. Any further basis zeros are explicit restrictions of this fibre. In the restricted deep fibre require `ell_(i,j)=0` for `i,j≤g+1`, and `Gram=det(B_top B_top^t)≥G>0`, where `B_top` is the actual top-right `(g+1)×(g+2)` block of `s⁻¹Bs⁻t`. A condition on the abstract row space does not impose these zeros on `B`.

Here `M≥1`; in main/shallow fibres take `G=0` and omit the Gram restriction. Define `a_Z(Y,s)=product_(i≤j,(i,j)∉Z_A)(1+C_D Y/(t_i t_j))`. Let `K_(Λ,Z_B)` be the lattice of row-contained symmetric matrices with those `B` zeros, transformed by `s⁻¹(−)s⁻t`; if it has rank `h`, let `nu_1,…,nu_h` be its successive minima in its real span. Let `E(Y,s,Λ)` be the row-spanning right side in the preceding target, assigned zero when its necessary existence inequalities fail. The local counting clause is

`#P_kappa(Λ,Z;Y,s,M,G) ≤ C a_Z(Y,s) min(E(Y,s,Λ), product_(j=1)^h(1+C Y/nu_j))`.

It is zero if any required nonzero coordinate interval is shorter than the integer spacing, or the rank, minimum-range or actual basis-zero conditions fail. In a restricted deep fibre it is also zero when

`M > C Y^((g+1)(g+2)) product_(i=1)^(g+1) L_i / sqrt(G)`.

The paired hypothesis includes the following precise dyadic summation clauses, beyond the local upper bound. Put `X=Y^(n+1)≥2`. For `R=main,shallow,deep`, define

`I_R = sum_(dyadic L) sum_(exact patterns Z) integral_(T_R(L,Z)) sum_(Λ with minima in [L,2L)) #P_kappa(Λ,Z;Y,s,M,G) delta(s) d^×s`.

The torus cells use the interval inequalities above, and each lattice, pair and zero pattern is counted once; a fixed finite chart multiplicity can be absorbed in `C`. Require, for every `epsilon>0,eta>0,0<kappa<1`, with constants depending only on `n,D,Theta_1,Theta_2,epsilon,eta,kappa` and the fixed averaging charts:

`I_main ≤ C_epsilon X^(n+1−theta_n+epsilon)` for all `M≥1`;

`I_shallow ≤ C_eta X^(n+1−min(eta,1)/(22n⁶))` for all `M>X^eta`;

`I_deep ≤ C_kappa X^(n+1+kappa_double)(log X)^(2n)/M` for all `M≥1` and `G=c Y^(2g+2)X^(−2kappa_double)`, with fixed `c>0` and `kappa_double=kappa n/(n−1)`.

Here `theta_n=min(1/(4n),(n−2)/(2n²+2n+2))`. The hypothesis includes coverage of every retained main/shallow/deep pair by its stated torus, minimum and zero-pattern cells. In particular every retained deep pair lies in the actual basis-zero fibres; coverage is a separate assertion from the local count. All constants are independent of `Y,s,L,Λ,M`. These clauses are named hypotheses of the even implications below. The generic symmetric-lattice count proves neither their paired summations nor their coverage. Their target proofs retain actual block equations while summing lattices, and use the `q` inequality and restricted Gram bound only on the stated fibres. *Needs:* the preceding row-spanning target; ArithmeticStatisticsPartII's even lift, marked `q` and invariant pencil; GeometryOfNumbersAndQuadraticArithmetic §4.1. Sources: [[82]](#ref-82), §§5–6, Propositions 5.4–5.5 pp.22–23, §6.1 (38)–(40) pp.26–28, Theorems 6.6,6.11,6.24 and Proposition 6.26 pp.29–47, with the paired and spanning restrictions retained.

**Checks.**

- For `n=4`, take `B=[[0,0,1,0,0],[0,0,0,1,0],[1,0,0,0,0],[0,1,0,0,0],[0,0,0,0,0]]` and `A=[[0,0,0,2,1],[0,0,1,1,−1],[0,1,0,2,1],[2,1,2,−1,1],[1,−1,1,1,2]]`. Both upper two-square blocks vanish, `rank B=4`, `B_top B_top^t=I_2`, and `det(xA−yB)=x(3x⁴+30x³y−15x²y²−4xy³+2y⁴)` has discriminant `2529792`. These are concrete block/rank tests; membership in the marked lift additionally requires its flag and modulus conditions.
- With this same `B` and `A=B`, the determinant polynomial is zero, so the pair is excluded despite the unchanged row lattice and Gram determinant.
- With `B=0`, every positive-rank spanning fibre is empty. In a deep fibre an actual top-block entry `B_11=1` is forbidden even when all rows lie in a prescribed lattice. If the displayed `q` upper bound is at most `M`, the strict `|q|>M` fibre is empty.

### 2.16 Even-degree binary-form tails and finite truncation

<a id="even-tail-parameters"></a>

**Even-tail parameters.** The real cutoff `τ=max(η,(η+ξ)/δ)` uses total field division at `δ=0`. The parameter conditions require `n≥4, n` even, `δ>0, η>0, ξ≥0` and both strict inequalities `τ<1` and `(2n+1)τ<n+1`. Together they give the positive slack

`min(η,1−τ,n+1−(2n+1)τ)>0`.

These are parameter arithmetic, over real `δ,η,ξ` and natural `n`, rather than a proof of a tail estimate. When an actual tail with these parameters is supplied, choosing `ε` smaller than this slack makes every fixed-modulus error below subleading. Division by `δ` is used for this implication only when `δ>0`.

**Checks.**

- For `n=4, δ=1/2, η=1/100, ξ=0, τ=1/50` and both inequalities hold.
- For `n=4, δ=1/2, η=9/10, ξ=0, τ=9/5` fails the first inequality.
- For `n=4, δ=1, η=3/5, ξ=0, τ=3/5<1` but `9τ=27/5>5` fails the second inequality. The same small positive parameters in the first Check do not meet the degree conditions at `n=2` or `n=3`. At `δ=0`, Lean's total division gives `τ=η`, but the parameter condition `δ>0` still fails.

*Needs:* Mathlib ordered-field arithmetic; this predicate supplies no analytic estimate. The sieve use is the generalized truncation of [[82]](#ref-82), Theorem 7.1 pp.51–52.

<a id="refinement-even-binary-small-discriminant"></a>

**Even binary small discriminant.** For even `n>=4` and `0<kappa<1`, degree-`n` coefficient-box forms with `|Delta(f)|<=H(f)^(2n−2−kappa)` have size `O_n(X^(n+1−kappa/(2n−2)))`. In the weak-lift argument also discard forms with `|f(0,1)|<H(f)^(1−kappa/(2n−2))`; their elementary coefficient-box count is `O_n(X^(n+1−kappa/(2n−2)))`.

For the proof, Control small discriminant by its polynomial sublevel estimate and coordinate slices. For the added small constant-term exclusion count that coordinate directly. Work in dyadic height intervals so the two lower bounds yield a normalized lifted discriminant at scale `X`.

*Needs:* [ArithmeticStatisticsPartI, binary discriminant][AS-I-3], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[82]](#ref-82), Lemma 6.1, p.25; correction to Lemma 6.25, p.44.)

**Checks.**

- For `f=x⁴`, `H=1, Delta=0` and constant term zero, both discarded conditions hold for every `0<kappa<1`.

- For `f=x⁴−y⁴`, `H=1, |Delta|=256` and `|f(0,1)|=1`, neither discarded condition holds.

- `kappa=0` and `kappa=1` are outside the stated open parameter range; the constant-term inequality is strict, so equality belongs to the retained set.

<a id="refinement-even-binary-constant-term-tail"></a>

**Even binary constant term tail.** For even `n>=4, X>=2,M>=1`, let `W_m^(1#)` be coefficient vectors whose binary discriminant is weakly `p^2`-divisible at every `p` dividing an odd squarefree `m`, and for which `m` divides `f(0,1)`. Then `#union_{m>sqrt(M)}{f in W_m^(1#):H(f)<X}=O_n(X^(n+1)/sqrt(M)+X^n)`. In reducing a weak modulus `m>M`, factor `m` into the primes dividing `f(0,1)` and the primes coprime to it; one factor exceeds `sqrt(M)`. Merely sharing one small prime with `f(0,1)` is not the `W_m^(1#)` hypothesis.

For the proof, For each prime dividing `m`, weak discriminant divisibility together with `p|f(0,1)` forces the extra coefficient reduction into a fixed codimension-two locus. Apply the quantitative geometric sieve to the modulus factor all of whose primes divide the constant term. Factor the original weak squarefree modulus into its constant-term and coprime parts before taking the `sqrt(M)` threshold. Do not apply this tail to all moduli with a nontrivial `gcd`.

*Needs:* [strongly and weakly divisible values](#strongly-and-weakly-divisible-values), [binary strong tail](#refinement-binary-strong-tail), [ArithmeticStatisticsPartII, even weak lift][AS-II-18].

([[82]](#ref-82), Lemma 6.2, pp.25–26.)

<a id="refinement-even-binary-main-shallow"></a>

**Even binary main shallow.** Assume the [row-spanning count](#row-spanning-count) and [paired-fibre counting hypothesis](#paired-fibre-counting-hypothesis), including its main/shallow dyadic summation clauses. For even `n≥4` in the `(n+1)`-dimensional symmetric-pencil lift, the main-body estimate is `O_ε(X^(n+1−θ_n+ε))`, where `θ_n=min(1/(4n),(n−2)/(2n²+2n+2))`. In the shallow cusp, the selected `L(M)` with `M>X^η` contributes `O(X^(n+1−min(η,1)/(22n⁶)))` for `η>0`. In particular `θ_4=1/21`, while `θ_n=1/(4n)` for even `n≥6`. These are conditional estimates for the specified paired lattice.

For the proof, The two main-body alternatives yield two savings, whose minimum must be retained; the smaller `n=4` value is `not1/16`. In the shallow cusp count actual nondegenerate matrices by their saturated row lattices and retain the paired upper-block constraints. Generic symmetric-rank estimates and lattice height comparisons are supplier inputs, not new generic lattice nodes.

*Needs:* [ArithmeticStatisticsPartII, even weak lift][AS-II-18], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[82]](#ref-82), Theorem 6.6, p.29, proof pp.29–33; Theorem 6.11, p.33, proof pp.33–38; corrected minimum of the main-body savings.)

**Checks.**

- At `n=4`, the two main-body savings are `1/16` and `2/42`, so `theta_4=1/21`.

- At `n=6`, they are `1/24` and `4/86`, so `theta_6=1/24`.

- At `eta=1` the shallow saving is `1/(22n⁶)`; `eta=0` is excluded. A zero matrix cannot enter a row-spanning fibre of positive rank.

<a id="refinement-even-binary-restricted-gram"></a>

**Even binary restricted gram.** For `n=2g+2≥4`, put `0<κ<1, κ″=κn/(n−1)`, and `Y=X^(1/(n+1))`. In a dyadic box retain generic weak-lift forms with `|Δ(f)|>H(f)^(2n−2−κ)` and `|f(0,1)|≥H(f)^(1−κ/(2n−2))`. Define the restricted Gram hypothesis to say that the Gram determinant `det(B_top B_top^t)` of the actual paired matrix `s⁻¹Bs⁻t` in its bounded `YD` box in the deep-cusp locus `L_good(M)` is at least `cY^(2g+2)X^(−2κ″)`, with a positive constant uniform in that box and the sieve parameters. Proving this restricted hypothesis is a supporting target. All estimates that use it take it as an explicit assumption; an unrestricted Gram bound is not asserted.

For the proof, Use `Delta(x f)=Delta(f) f(0,1)^2`, degree `2n(n+1)` in pencil entries, and `Y` scaling to obtain `|Delta(Y^-1 A,Y^-1 B)|>=c X^(−kappa_double)`. Prove discriminant membership in the maximal-minor determinantal ideal and a bounded-real Cauchy–Binet estimate `|Delta|<=C sqrt(Gram)`. The printed product-divisibility inference is not valid. Retain block constraints only for the actual `B` paired with A.

*Needs:* [ArithmeticStatisticsPartII, even weak lift][AS-II-18], [even binary small discriminant](#refinement-even-binary-small-discriminant), SchemeAndStackFoundations Layer 0.

([[82]](#ref-82), Lemma 6.25, p.44; normalization and determinantal-ideal hypothesis.)

**Checks.**

- The row matrices `[[1,0,0],[0,1,0]]`, `[[1,0,0],[0,t,0]]` and `[[1,0,0],[2,0,0]]` have Gram determinants `1,t²,0`, respectively. In particular scaling one row by `t` scales the Gram determinant by `t²`.

- At `n=4`, the explicit paired-block example in the paired-fibre contract has `B_top=[[1,0,0],[0,1,0]]` and Gram determinant one.

- Replacing its `A` by `B` makes `det(xA−yB)` identically zero, so the positive discriminant hypothesis fails even though this Gram determinant stays one. The dependent-row example has Gram zero and cannot satisfy a positive restricted lower bound.

<a id="refinement-even-binary-restricted-deep-tail"></a>

**Even binary restricted deep tail.** Conditional on the restricted Gram lower bound, the [row-spanning count](#row-spanning-count) and the deep summation clause of the [paired-fibre counting hypothesis](#paired-fibre-counting-hypothesis), the even-degree `L_good(M)` deep-cusp contribution is `O_n(X^(n+1+kappa_double)(log X)^(2n)/M)`. On the stated deep block and actual basis-zero fibres the height inequality, independent of the restricted Gram lower bound, is `|q|<=C Y^((g+1)(g+2)) product_(i=1)^(g+1) L_i/sqrt(Gram)`; inserting the lower bound gives `C Y^((g+1)^2) X^kappa_double product_(i=1)^(g+1) L_i`. Here `L_1≤…≤L_n` are dyadic successive-minimum parameters of `s⁻¹Λ`, where `Λ` is the actual saturated rank-`n` row lattice of `B`; the chosen almost reduced basis obeys the explicit deep-box zero conditions in the paired-fibre contract. No bound on the original unrestricted `L(M)` is asserted.

For the proof, Enumerate saturated row lattices and successive-minimum ranges while keeping the top-block-zero conditions on actual paired matrices. Sum the `q`-height bound over the restricted fibres and dyadic ranges. A final `epsilon` or strictly smaller saving is needed to absorb `log^(2n)X`; endpoint absorption is invalid.

*Needs:* [even binary restricted gram](#refinement-even-binary-restricted-gram), [ArithmeticStatisticsPartII, marked q][AS-II-15], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[82]](#ref-82), Theorem 6.24, p.44; Proposition 6.26, pp.45–47; (74)–(78), pp.47–49; conditional restricted estimate.)

**Checks.**

- At `g=1`, the product is `L_1 L_2` in a rank-four row lattice, not `L_1 L_2 L_3 L_4`.

- For `n=4,kappa=1/10`, `kappa_double=2/15`, and taking the square root of the Gram lower bound loses `X^(2/15)` in the height inequality.

- When the height upper bound is at most `M`, no pair with strict `|q|>M` survives; Gram zero is outside the restricted fibre.

<a id="refinement-binary-summed-tail"></a>

**Binary summed tail.** For odd `n>=3` and `epsilon>0`, the sum over squarefree `m>M` of the coefficient-box counts with nonzero `Delta` and `m^2` dividing `Delta` is `O_{n,epsilon}(X^(n+1+epsilon)/sqrt(M)+X^(n+1−1/(2n)+epsilon))`. For even `n>=4` the target is existence of positive `delta,eta` and `xi>=0` with `tau=max(eta,(eta+xi)/delta)<1` and `(2n+1)tau<n+1`, and a bound `O_{n,epsilon}(X^(n+1+xi+epsilon)/M^delta+X^(n+1−eta+epsilon))`. The even clause assumes the row-spanning count, the paired-fibre counting hypothesis with all three summation clauses, the restricted Gram hypothesis and a quantitative non-Sn coefficient-box exclusion; no published numerical endpoint is certified.

`Counting.odd_binary_summed_tail` states the odd-degree clause. `Counting.binaryDiscriminantPolynomial` is the universal fixed-degree discriminant; specializing it by `Counting.binaryDiscriminant` retains the binary invariant when the leading coefficient vanishes.

For the proof, Split a squarefree modulus into its strong and weak factors; control the total divisor multiplicity on the nonzero locus. Use a union bound by the sum of the strong-large and weak-large counts; neither count separately bounds the original union. Use the odd tail directly. In the even case balance restricted deep, shallow, small-discriminant, small-constant-term and non-Sn terms with slack. The inequalities in `tau` make the general finite-modulus sieve errors subleading. Recover the source truncation `3(eta+xi)` only with a tail exponent `delta>=1/3`.

*Needs:* [square divisor tail](#refinement-square-divisor-tail), [binary strong tail](#refinement-binary-strong-tail), [odd binary weak tail](#refinement-odd-binary-weak-tail), [even binary constant term tail](#refinement-even-binary-constant-term-tail), [even binary main shallow](#refinement-even-binary-main-shallow), [even binary restricted deep tail](#refinement-even-binary-restricted-deep-tail), [coefficient sieves](#support-sieves), [even binary small discriminant](#refinement-even-binary-small-discriminant).

([[82]](#ref-82), Corollary 6.27, p.51; corrected nonzero domain and union bound; even clause conditional on the restricted hypothesis.)

**Checks.**

- At odd `n=3`, the second exponent is `4−1/6=23/6`.

- For even `n=4`, the parameter tuple `delta=1/2,eta=1/100,xi=0` meets both cutoff inequalities; it supplies a sieve conclusion only if the stated counting hypotheses hold.

- A coefficient vector of discriminant zero contributes no modulus multiplicity; a nonzero vector with `|Delta|≤M²` also has no squarefree modulus exceeding `M`.

<a id="refinement-quadratic-binary-summed-tail"></a>

**Quadratic binary summed tail.** For `n=2, Delta(a0,a1,a2)=a1^2−4a0 a2` in a coefficient box of side `X>=2`, the summed squarefree-modulus tail over `m>M` on `Delta` nonzero is `O_epsilon(X^(3+epsilon)/M)`; the `Delta=0` count is `O(X^2)`. This is independent of the `n>=3` pencil argument.

For the proof, For each fixed nonzero `Delta=N`, fix `a1` and count divisors of `(a1^2−N)/4`, obtaining `O_epsilon(X^(1+epsilon))`; handle at most two `a1` with `a1^2=N`. Write `N=m^2 k` with `0<|k|<=C X^2/m^2` and sum `m>M`. Count the zero locus separately by solving for `a2` when `a0` nonzero and treating `a0=0`.

*Needs:* [square divisor tail](#refinement-square-divisor-tail), AnalyticNumberTheoryPartI §§3.22,3.26.

([[82]](#ref-82), Degree-two boundary of Theorem 7.1, pp.51–52.)

<a id="refinement-binary-fixed-modulus-sieve"></a>

**Binary fixed modulus sieve.** Let `n>=2`, impose a fixed finite initial modulus `N^2` and require `p^2` not dividing `Delta` at every prime, including `p|N`. If the normalized finite residue count is `nu_N` and the other prime good densities are `alpha_n(p)`, the nonzero-discriminant count has main coefficient `nu_N product_{p not dividing N} alpha_n(p)` times the real-box volume `X^(n+1)`. For `n>=3` a tail with parameters `delta>0,eta>0,xi>=0` yields, for `tau=max(eta,(eta+xi)/delta)`, error `O_epsilon(X^(n+1−eta+epsilon)+N^2 X^(n+tau+epsilon)+N^(2n+2) X^((2n+1)tau+epsilon))`. Require `tau<1` and `(2n+1)tau<n+1` for a subleading error at fixed `N`. If `delta>=1/3`, the larger source truncation `tau_source=3(eta+xi)` gives the displayed source exponents `n+3(eta+xi)` and `(6n+3)(eta+xi)`. Odd `n` uses `delta=1/2,eta=1/(2n),xi=0`, so the sharper `tau` is `1/n`. The even conclusion assumes the row-spanning count, paired-fibre counting hypothesis, restricted Gram hypothesis and quantitative non-Sn exclusion used in the binary summed tail; `n=2` requires the separate finite-modulus truncation.

`Counting.binary_fixed_modulus_sieve` states the implication from the explicit summed-tail inequality, with its cutoff conditions and all three error terms. Its initial residue density includes the squarefree restrictions at primes dividing `N`.

For the proof, Build the initial residue set so it already contains the squarefree restrictions at `p|N`, then use Mobius sums only for `m` coprime to `N`. Compare finite-modulus lattice errors and nonzero summed tails. Products and main coefficients are Layer 0 local-data inputs; Appendix local-density formulas are not reproved here. For truncation `M=X^tau` retain the Euler-product remainder `X^(n+1)/M` and the tail `X^(n+1+xi)/M^delta`. The chosen `tau` makes both `O(X^(n+1−eta))`; an arbitrary positive `delta` does not justify the source exponent `3(eta+xi)`.

*Needs:* [binary summed tail](#refinement-binary-summed-tail), [quadratic binary summed tail](#refinement-quadratic-binary-summed-tail), GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[82]](#ref-82), Theorem 7.1 and its proof, pp.51–52; generalized truncation from the proved tail exponent; degree 2 remains separate.)

**Checks.**

- With `N=1` the finite residue factor is one, so the main coefficient is `product_p alpha_n(p)`.

- If the finite residue condition is empty, `nu_N=0` and the count vanishes.

- At odd `n=3,delta=1/2,eta=1/6,xi=0`, `tau=1/3` and the last error exponent is `7/3<4`; at `n=4,tau=3/5`, the last exponent `27/5>5` fails the required inequality.

### 2.17 Symmetric-pencil orbit counts

<a id="refinement-pencil-finite-congruence-count"></a>

**Pencil finite congruence count.** Let even `n>=4, G=SL_n/mu_2` and `V` pairs of symmetric bilinear forms, with BGW invariant height `H(f)=max` absolute coefficient. For a real component `V^(m,r)` and a `G_Z`-invariant set `S` defined by finitely many congruence conditions, `N(S∩V^(m,r);X)=c_(m,r) X^(n+1) nu(S)+o_S(X^(n+1))`. `N` counts `G_Z`-orbits with `Delta` nonzero; BGW calls that irreducible, without requiring `f Q`-irreducible. `c_(m,r)=vol(F_(m,r)∩{H<1})` uses coefficient Euclidean measure. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`.

For the proof, Choose the real component section and finite-cover domain with the central quotient scheme; a quotient of rational point groups alone is insufficient. Discard the source nongeneric cusp contribution, apply the lattice estimate to finite congruence translates, and scale by `X^(1/n)` in the pencil entries. The needed native group/domain interfaces remain explicit.

*Needs:* [ArithmeticStatisticsPartI, symmetric pencil][AS-I-4], [ArithmeticStatisticsPartII, integral pencil orbits][AS-II-20], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[73]](#ref-73), Theorem 36, §§10–11, pp.29–30; real components pp.28–29.)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

<a id="refinement-pencil-infinite-weight-upper-bound"></a>

**Pencil infinite weight upper bound.** Let `phi` be a `G_Z`-invariant BGW congruence-defined weight with factors in `[0,1]`, locally constant off closed null sets, convergent product, and each local integral nonzero. For a `G_Z`-invariant finite-congruence `S` in `V^(m,r)` imposed independently by local sets `S_p, limsup_{X→infinity} N_phi(S;X)/X^(n+1)<=c_(m,r) product_p integral_{S_p} phi_p`. Equivalently use an upper estimate by that main term plus `o(X^(n+1))`. This is an upper bound, and contains no equality assertion.

For the proof, For a fixed finite prime set the full weight is at most its truncated product. Apply the finite weighted count. Take the height `limsup` first and then the decreasing finite-prime integrals. No tail equality is used; every local integral is nonzero but the infinite product can still vanish. Absorb the local indicators `1_(S_p)` into the corresponding truncated factors. For a coupled finite CRT condition first split into disjoint product residue conditions and sum their upper bounds, rather than multiplying its marginal closures.

*Needs:* [pencil finite congruence count](#refinement-pencil-finite-congruence-count), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[73]](#ref-73), Definition 37 and Theorem 38, pp.30–31.)

**Checks.**

- With all weights one, every local integral and their product are one, giving the finite-count upper constant.

- With the factor at 2 constantly `1/2` and all others one, the weighted count and the upper constant are halved.

- With constant factor `1/2` at every prime, each normalized local integral is positive but the product and the full weight are zero. The upper bound is zero after taking the height limit and then the prime limit.

<a id="refinement-large-coefficient-family-tail"></a>

**Large coefficient family tail.** Let a coefficient family `F⊂Z^(n+1)` have local complements, outside finitely many primes, contained in the reduction of a fixed closed subscheme `S0⊂A_Z^(n+1)` of codimension at least2. For `M` beyond those exceptional primes, the number of vectors with `H(f)<X` failing `F_p` at some `p>M` is `O_F(X^(n+1)/M+X^n)`. This is a coefficient-vector tail, not a symmetric-pencil orbit tail.

For the proof, Embed every bad reduction into the fixed codimension-two envelope and apply the geometric sieve to the coefficient cube. Enlarge the constant for the finitely many exceptional primes if a statement for every `M>=1` is needed. Do not substitute this coefficient count for the required orbit-tail bound.

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [ArithmeticStatisticsPartI, family defined by local conditions][AS-I-5].

([[73]](#ref-73), Definition 39, pp.31–32; Proposition 42, pp.32–33.)

### 2.18 Ternary cubic orbit counts

<a id="refinement-ternary-cubic-finite-count"></a>

**Ternary cubic finite count.** For `SL3(Z)`-orbits of strongly irreducible integral ternary cubics, `H=max(|I|^3,J^2/4), Delta=(4I^3−J^2)/27` and `S` an `SL3(Z)`-invariant finite congruence subset, `N_+(S;X)=(32/45)zeta(2)zeta(3) X^(5/6) nu(S)+o(X^(5/6))`, and `N_−` has `coefficient128/45`. Strong irreducibility excludes a rational flex; it is stronger than polynomial irreducibility. Normalize `I=c4/16` and `J=c6/32`; these rational invariants can have denominators 16 and 32 in integral coefficient coordinates. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`.

For the proof, Use the `SL3` finite-cover domain, normalized Jacobian and strongly irreducible cusp estimate. Count finite congruence translates and retain the rational invariant lattice instead of rounding to integral `I,J`. Integral Selmer minimization is a separate Layer 1 obligation.

*Needs:* [ArithmeticStatisticsPartII, ternary cubic forms and their invariants][AS-II-21], [ArithmeticStatisticsPartII, invariance of ternary cubic invariants][AS-II-22], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[85]](#ref-85), Theorem 8, pp.2–3; finite congruence Theorems 17–18, p.11; c4,c6 normalization, p.12.)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

<a id="refinement-ternary-cubic-prime-tail"></a>

**Ternary cubic prime tail.** For `W_p={f:p^2 divides Delta(f)}`, every truncation `epsilon>0` admits constants `C_epsilon,C` such that `N_±(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(3/4))+C epsilon X^(5/6)`, for `X,M>=2`, on strongly irreducible orbits. The final `epsilon` is a compact-domain truncation error, not a loss in an exponent.

For the proof, On a compact fundamental-domain truncation apply the geometric sieve to the strong locus; the cusp contributes `C epsilon X^(5/6)`. Use the discriminant-preserving weak-to-strong map with at `most3` orbit preimages. Treat the finite bad primes separately.

*Needs:* [ternary cubic finite count](#refinement-ternary-cubic-finite-count), [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[85]](#ref-85), Proposition 25 and Lemma 26, §2.7, pp.13–14.)

<a id="refinement-ternary-cubic-acceptable-count"></a>

**Ternary cubic acceptable count.** For an acceptable invariant congruence-defined weight `phi` in `[0,1], N_phi(V_Z^±;X)=N(V_Z^±;X) product_p` integral `phi_p+o(X^(5/6))`. The local Haar measures give the full coefficient lattice mass 1, and the counted orbits are strongly irreducible.

For the proof, Prove the finite-weight identity, approximating locally constant-off-null-set factors by residue steps. The uniform prime tail bounds the full-versus-finite weights; take `X` first, then `M`, then the compact truncation `epsilon` to 0.

*Needs:* [ternary cubic finite count](#refinement-ternary-cubic-finite-count), [ternary cubic prime tail](#refinement-ternary-cubic-prime-tail), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[85]](#ref-85), Theorem 24, §2.7, p.13.)

### 2.19 Quaternary two-covering orbit counts

<a id="refinement-quaternary-finite-count"></a>

**Quaternary finite count.** For the BS4 group `G={(g2,g4) in GL2×GL4:det(g2)det(g4)=1}/{(lambda^(-2)I2,lambda I4)}` on pairs of integral quaternary quadratic forms and a real type `i` in `{0#,1,2}`, strongly irreducible finite-congruence counts satisfy `N_i(S;X)=|J| vol(G_Z\G_R) N_inv^(sign i)(X) nu(S)/n_i+o(X^(5/6))`, with `n_1=4,n_0#=n_2=8, N_inv^+(X)=(8/5)X^(5/6)+O(X^(1/2)), N_inv^−(X)=(32/5)X^(5/6)+O(X^(1/2))`. Strong irreducibility means the binary-quartic resolvent has no rational root. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`. Use the quotient group scheme, the half-integral Gram matrices of integral quadratic forms, the binary-quartic resolvent `16 det(Ax+By)`, and a `G_Z`-invariant `S`.

For the proof, Use the integral half-Gram convention and the correct determinant character/central quotient, distinct from BGW `SL4/mu2`. Integrate the Jacobian and real stabilizer multiplicity, discard strongly irreducible cusp exceptions and insert finite residue densities.

*Needs:* [ArithmeticStatisticsPartII, genus one stabilizer schemes][AS-II-23], [ArithmeticStatisticsPartI, symmetric pencil][AS-I-4], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[86]](#ref-86), Group (3), p.4; Theorem 10, pp.5–6; §3.3 (17), pp.13–14; Theorems 19–20, p.14.)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

<a id="refinement-quaternary-prime-tail"></a>

**Quaternary prime tail.** For `W_p={v:p^2 divides Delta(v)}`, strongly irreducible real-type-`i` orbit counts satisfy `N_i(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(19/24))+C epsilon X^(5/6)`, for each `epsilon>0` and `X,M>=2`.

For the proof, Compact truncation of the 20-dimensional height slice gives the strong term and projection exponent `19/24`. For `p>2` move weakly divisible pairs to strongly divisible pairs without changing discriminant, with at `most2` orbit preimages. Include `p=2` in the finite initial conditions.

*Needs:* [quaternary finite count](#refinement-quaternary-finite-count), [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[86]](#ref-86), Theorem 23, §3.5, pp.16–17.)

<a id="refinement-quaternary-acceptable-count"></a>

**Quaternary acceptable count.** For an acceptable invariant congruence-defined `phi` in `[0,1]`, the strongly irreducible BS4 count `N_phi(V_Z^(i);X)=N(V_Z^(i);X) product_p` integral `phi_p+o(X^(5/6))`.

For the proof, Apply finite-weight counts with their actual `G` and half-Gram coefficient lattice. Use the tail with the limits `X`, then `M`, then `epsilon`. The exact-order-four Selmer interpretation belongs to Layer 1/Layer 5, not this coefficient theorem.

*Needs:* [quaternary finite count](#refinement-quaternary-finite-count), [quaternary prime tail](#refinement-quaternary-prime-tail), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[86]](#ref-86), Theorem 22, §3.5, p.16.)

### 2.20 Quinary five-covering orbit counts

<a id="refinement-quinary-finite-count"></a>

**Quinary finite count.** For the BS5 representation `5 tensor exterior^2(5)`, of dimension 50, and `G={(g1,g2) in GL5×GL5:(det(g1))^2 det(g2)=1}/{(lambda I5,lambda^(-2)I5)}`, strongly irreducible orbit counts of sign `±` with finite congruence `S` equal `(|J|/5) vol(G_Z\G_R) N_inv^±(X) nu(S)+o(X^(5/6))`; `N_inv^+=(8/5)X^(5/6)+O(X^(1/2)), N_inv^−=(32/5)X^(5/6)+O(X^(1/2))`. Strong irreducibility excludes the trivial degree-five covering. This is not the 40-dimensional quintic-ring representation. Here `nu(S)` is the actual proportion of allowed coefficient residues modulo a defining modulus `m`, with denominator `m^dim(V)`. It equals the product of normalized prime-power densities only when the conditions are imposed independently at those primes; coupled CRT conditions use `nu(S)`. The first `GL5` changes the alternating matrices and the second mixes the quintuple. `S` is `G_Z`-invariant; `J` is the pullback Jacobian of Proposition 24. The factor `1/5` is the order of the real stabilizer in (18), not an additional local density.

For the proof, Use the 50-dimensional height slice, Jacobian `J` and real stabilizers. Proposition 18 controls the `a12=0` strongly irreducible cusp by `O(X^(499/600))`. Proposition 22 discards non-strongly-irreducible main-body points using prime local exclusions; these have size proportional to `1/p`, so prime harmonic divergence rather than a constant-density sieve is needed. Use Proposition 24 and (18), p.17, rather than the normalization of introductory Theorem 12, p.7, which omits `1/5` in this preprint. The real stabilizer size is 5 on both signs.

*Needs:* [ArithmeticStatisticsPartII, genus one stabilizer schemes][AS-II-23], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[87]](#ref-87), Group (2), p.5; real stabilizer §3.1; Proposition 24 and (18), p.17; Theorems 25–26, pp.17–18; introductory Theorem 12, p.7, corrected by (18).)

**Checks.**

- Test coupled CRT conditions: the two residues `(0 mod 3,0 mod 5)` and `(1 mod 3,1 mod 5)` have density `2/15`, whereas the product of their marginal densities is `4/15`. Finite disjoint residue sums must retain this coupling.

- The leading coefficient must agree with dividing the finite-cover volume by a real stabilizer of size 5. Changing Haar normalization rescales `J` inversely and does not erase this divisor.

<a id="refinement-quinary-prime-tail"></a>

**Quinary prime tail.** The BS5 strongly irreducible counts have `N_±(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(49/60))+C epsilon X^(5/6)`, for `W_p={v:p^2 divides Delta(v)}, epsilon>0` and `X,M>=2`.

For the proof, Apply the strong geometric sieve on the compact 50-dimensional slice, giving projection exponent `49/60`. Use the discriminant-preserving weak-to-strong transformation with at `most2` orbit preimages. Retain the strongly irreducible restriction in both counts.

*Needs:* [quinary finite count](#refinement-quinary-finite-count), [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [strongly and weakly divisible values](#strongly-and-weakly-divisible-values).

([[87]](#ref-87), Theorem 27 and Lemma 28, pp.18–20.)

<a id="refinement-quinary-acceptable-count"></a>

**Quinary acceptable count.** For acceptable invariant congruence-defined `phi` in `[0,1]`, the BS5 strongly irreducible count satisfies `N_phi(V_Z^±;X)=N(V_Z^±;X) product_p` integral `phi_p+o(X^(5/6))`.

For the proof, Approximate the finite local factors by residue step functions. Apply the uniform prime tail and take the three limits in the established order. Do not import a quintic maximality tail for this different representation.

*Needs:* [quinary finite count](#refinement-quinary-finite-count), [quinary prime tail](#refinement-quinary-prime-tail), [ArithmeticStatisticsPartI, acceptable weight function][AS-I-2].

([[87]](#ref-87), Theorem 29, p.20; finite main term corrected by (18), p.17.)

### 2.21 Smooth unfolding and sparse quaternary counts

<a id="refinement-section-kernel"></a>

**Section kernel.** For a group action `G` on `U`, maps `inv:U→I` and `kappa:I→U`, and real functions `Theta` on `G` and `phi` on `I`, define `K(u)` by the native real sum over all `g`, with summand `Theta(g)phi(inv(u))` when `g kappa(inv(u))=u` and 0 otherwise. Any formula replacing this totalized sum by an ordinary transporter sum requires a finite fibre or a summability hypothesis. In the source application `inv` is invariant, `kappa` is a smooth section over a regular invariant region, the real stabilizers are finite, and `Theta,phi` are smooth compactly supported; on the represented real component each transporter fibre has the full stabilizer multiplicity.

The transporter sum retains every stabilizer element. Its basic theory gives zero when `phi` is identically zero, gives `Theta(g)phi(inv(u))` when the transporter consists of exactly one element `g`, and identifies it with the finite transporter sum whenever that fibre is finite.

For the proof, Use the native action and equality of vectors in the transporter fibre; attach `inv` and section rather than replacing them by an arbitrary weight. For a genuine invariant section the summand restricts to a coset of the stabilizer. Finite stabilizers and compact support justify finite summation. Use invariant differential-form integration with the specified Haar normalization.

*Needs:* `MulAction.orbitRel` (Mathlib).

([[88]](#ref-88), §5 transporter-sum definition (38) and Theorem 5.1, p.24; proof pp.24–25.)

**Checks.**

- For the trivial group and singleton invariant/vector types with `Theta=2,phi=3`, the kernel is 6.

- For the trivial action on Bool and constant section false, the value at true is 0.

- For any action, identically zero `phi` gives identically zero kernel.

- Let the two-element permutation group of Fin 2 act trivially on a singleton, with its unique `inv` and section, `Theta=2` and `phi=3`. The kernel value is 12. Dropping or averaging the stabilizer would give 6.

<a id="refinement-smoothed-orbit-unfolding"></a>

**Smoothed orbit unfolding.** In BSS Theorem 5.1 let `G` be the semisimple real Lie group of the integral coregular representation `U, Gamma=G(Z), F` its arithmetic fundamental domain, `I` a regular open invariant region admitting a smooth section `kappa`, and `sigma` the constant finite real stabilizer size on `kappa(I)`. Let `L` be a discrete `Gamma`-invariant subset of `G(R) kappa(I), phi` smooth compactly supported on `I` and extended by zero, `Theta` smooth compactly supported on `G` with `vol(Theta)>0`, and `T` a nonnegative `Gamma`-invariant weight on `L`. For nonnegative `phi,Theta` and integrable sums, `sum_{u in L/Gamma} T(u)phi(inv(u))/|Stab_Gamma(u)| = (sigma vol(Theta))^(-1) integral_F sum_{u in L} T(u)(g K)(u) dg`, with `(g K)(u)=K(g^(-1)u)`. The lattice subset must belong to the real component represented by `kappa`; nonzero discriminant and matching invariant alone do not ensure that. Use the unimodular Haar measure of this semisimple group and retain arithmetic stabilizer weights.

For the proof, Unfold the arithmetic group fundamental domain and the transporter coset. The real stabilizer multiplies the smoothing integral by `sigma`; integrate `Theta` and divide by its nonzero total mass. Preserve arithmetic stabilizer weights rather than replacing them by 1.

*Needs:* [section kernel](#refinement-section-kernel), [ArithmeticStatisticsPartI, stabilizer weighted orbit count][AS-I-6].

([[88]](#ref-88), Theorem 5.1 and full unfolding proof, pp.24–25; hypotheses §5, pp.23–24.)

<a id="refinement-smoothed-quaternary-count"></a>

**Smoothed quaternary count.** In the fixed split antidiagonal quaternary slice `W_A` of BSS, with its `PSO_A` arithmetic group and smooth invariant-region test `psi`, a `PSO_A(Z)`-invariant acceptable weight uniformly bounded by a fixed `C0`, of modulus `b<=X^theta`, squarefree `q<=X^(1/2), gcd(b,q)=1`, and local factors exactly the characteristic functions of rank`<=1` reductions for `p|q`, has `N_gen(psi,T;X,Y)=|J_A| vol(F_A) nu(T) vol`(`psi` restricted at `Y^2/X`) `X^4 Y^2/sigma_A(i) + O_epsilon(X^(5+10theta+60delta−lambda+epsilon)/q^6)`, for `c X^(1/2−delta)<=Y<=C X^(1/2), theta,delta>0`, with an absolute `lambda>0` independent of `theta,delta`. For a subleading error choose `10theta+62delta<lambda` and sufficiently small `epsilon`. Keep all source weight support and smoothness hypotheses, and the dependence of constants on `A,psi`.

Fixed split A and source smooth invariant-region support for `psi`. Uniformly bounded `T`, rank-one characteristic local factors at every `p` dividing squarefree `q`, coprimality of `b,q`. The simultaneous `X,Y,theta,delta` and `epsilon` restrictions in the statement; normalized local mass and real stabilizer convention.

For the proof, Separate the special rank-one congruences at primes dividing `q` and use the normalized local mass `nu(T)`. Apply the smoothed main-body estimate and its cusp bound with the joint `theta,delta` restrictions. The native `PSO_A` mass interface and the proof’s parameter range are `G`-smoothed, not inferred from the general BGW pencil count.

*Needs:* [smoothed orbit unfolding](#refinement-smoothed-orbit-unfolding), [ArithmeticStatisticsPartI, symmetric pencil][AS-I-4], GeometryOfNumbersAndQuadraticArithmetic §4.1.

([[88]](#ref-88), Theorem 6.3 and acceptability definition, p.30; proof pp.38–39; fixed section and support §§5–6.)

### 2.22 Number-field three-isogeny orbit counts

<a id="refinement-number-field-twist-orbit-count"></a>

**Number-field twist orbit count.** Let `F` be a number field, `φ:A→A′` a degree-three isogeny of abelian varieties, and `Σ` a nonempty squareclass family specified by finitely many local squareclass conditions. Assume the windowed cubic counting hypothesis `C(F,φ,Σ)` specified in [coregular counting contract](#support-coregular-count). With `H(s)=∏_(v finite, v(s) odd)Nv`, let `N_irr,loc(X)` count irreducible locally `φ`-soluble `SL₂(F)`-orbits with normalized `Disc=κs`, one chosen representative `s` for each class in `Σ`, and `H(s)<X`. Then

`N_irr,loc(X)=c_Σ R_Σ X+o(X),   #Σ(X)=c_Σ X+o(X),   c_Σ>0`,

where `R_Σ` is the mean of `∏_v c_v(φ_s)` in the same representative measure and `c_v=#coker(φ_s:A_s(F_v)→A′_s(F_v))/#ker(φ_s)`. For a single local rectangle it is `R_∞∏_(v finite)R_v`, with `R_v=(∫_(Σ_v)c_v(φ_s)ds)/vol(Σ_v)`. `R_∞` is the corresponding ratio on the finite archimedean window `Ω(1)` below. Almost every finite `R_v` is one. A finite union of rectangles uses its disjoint, denominator-weighted sum of these ratios, not a product of marginal projections.

For the proof, use the general-abelian dictionary and uniform local integrality in BKLOS Theorems 7.1–7.2, pp.10–11. The kernel determines the mirror representation; local solubility still depends on the actual Kummer images of `φ` and cannot be inferred from the kernel alone. Use the exact rational-to-integral weights, finite-congruence main term and two uniform tails below. Apply the local mass calculation and `τ(SL₂)=1`, and divide only after the positive squareclass denominator is established. This is the nonidentity count; the unique reducible identity orbit is added only in the Selmer mean.

*Needs:* [coregular counting contract](#support-coregular-count), [ArithmeticStatisticsPartI, positive squareclass denominator][AS-I-7], [ArithmeticStatisticsPartI, binary cubic forms and the twisted action][AS-I-8], AbelianSchemesAndArithmeticModuli:`A3`, SelmerIwasawaCohomology §2.12a.

([[89]](#ref-89), Theorems 4.2,5.3,6.2,7.1–7.2 and §8 pp.6–13; [[131]](#ref-131), Theorems 3.3,3.8 pp.13–16, with the windowed specialization stated below.)

**Checks.**

- For constant global ratio one, the irreducible-orbit mean is one and the Selmer mean is two. The identity is not an `o(X)` error.
- The section `3x²y+(s/4)y³` has normalized `Disc=s` and ordinary discriminant `−27s`. Scaling cubic coefficients by `u` multiplies `Disc` by `u⁴`, whereas the twisted `GL₂` action multiplies it by `det(g)²`.
- Over `Q` both signs give denominator `(12/π²)X+o(X)`; positive classes alone give `(6/π²)X+o(X)`. Neither counts all integer representatives of a squareclass.
- Dimension zero admits no degree-three isogeny. No claim is made in characteristic three or for inseparable kernels.

### 2.23 Hypersurface local densities

<a id="degree-uniform-hypersurface-smooth-points"></a>

**Degree-uniform hypersurface smooth points.** For `n,d≥2` there is `C(n,d)>0` such that every geometrically integral degree-`d` hypersurface `H⊂P^n_(F_q)` has
`#H_smooth(F_q) ≥ q^(n−1)−C(n,d)(q^(n−3/2)+q^(n−2))`.
Consequently `q>Q(n,d)` guarantees a smooth rational point, uniformly in the defining coefficients and characteristic. This uniform-in-the-model statement is stronger than the fixed-model estimate imported from InverseGaloisAndArithmeticFundamentalGroups §IG.2.

`Counting.degree_uniform_hypersurface_smooth_points` states the bound for homogeneous polynomials irreducible over the algebraic closure, counting their smooth points on Mathlib’s projectivization.

Prove degree-uniform Lang–Weil by induction on dimension: the curve case uses the genus bound and the curve Weil estimate; average hyperplane sections and bound their bad locus by equations of bounded degree. For the smooth-locus version, at least one partial derivative is nonzero for an absolutely irreducible polynomial over the perfect field `F_q`. Intersect with that derivative, obtaining dimension at most `n−2` and degree at most `d(d−1)`, and subtract its `O_(n,d)(q^(n−2))` points. Sources: [Lang–Weil, *Number of points of varieties in finite fields*](https://doi.org/10.2307/2372655), Theorem 1 and Lemmas 1–2, pp.819–823; [[83]](#ref-83), proof of Theorem 3.6 p.3, for this smooth-point consequence. *Needs:* DeligneWeightsAndPurity §1.6 (curve point bound); the [plane-curve normalization bounds](#plane-curve-normalization-bounds); AlgebraicCurves Layers 2,12 (normalization and scheme comparison); SchemeAndStackFoundations Layers 0–3,5 (projective intersections, dimension, degree and hyperplane families); [uniform subscheme point bound](#uniform-bound-for-points-of-a-subscheme-modulo-p). The hyperplane bad-locus degree bound is part of the local induction, not an assumption of smoothness of `H`.

**Checks.**

- The absolutely irreducible singular cubic `y²z=x³` over `F_5` has six projective points and one singular point, hence five smooth points. Smoothness of the whole hypersurface is unnecessary.
- A repeated line `x²=0` is geometrically nonreduced and has no smooth points; geometric integrality cannot be replaced by irreducibility of the underlying topological space.
- The reducible degree-`d` coefficient locus is the union of multiplication images `P^(N_r−1)×P^(N_(d−r)−1)`, `1≤r<d`. Its affine codimension is at least `N_d−N_r−N_(d−r)+1`, where `N_j=binomial(n+j,n)`: for `(n,d,r)=(2,2,1)` this is one, whereas `(2,3,1)` gives two. This supplies exactly the conic exception in the next target.

<a id="refinement-hypersurface-local-tail"></a>

**Hypersurface local tail.** For degree `d>=2` hypersurfaces in `P^n, n>=2,(n,d)!=(2,2)`, with `N=binomial(n+d,d)` coefficients, local insolubility at some `p>M` is confined, for `M` beyond a finite threshold, to reduction in a fixed codimension-two geometrically reducible locus. In the coefficient ball of radius A the count is `O_{n,d}(A^N/(M log M)+A^(N−1)), A,M>=2`. The same upper bound holds after restriction to primitive vectors.

For the proof, Uniform Lang–Weil gives an `F_p`-point on geometrically integral hypersurfaces at all sufficiently large `p`; choose a smooth point, lift in a univariate transverse chart by Hensel. Except plane conics, the geometrically reducible coefficient locus has codimension at least2. Apply the geometric sieve to the Euclidean unit ball; primitive restriction decreases the numerator. Use the degree-uniform smooth-point estimate and the multiplication-image codimension calculation above.

*Needs:* [quantitative ekedahl geometric sieve](#quantitative-ekedahl-geometric-sieve), [degree-uniform hypersurface smooth points](#degree-uniform-hypersurface-smooth-points), `hensels_lemma` (Mathlib), SchemeAndStackFoundations Layer 0, [uniform bound for points of a subscheme modulo p](#uniform-bound-for-points-of-a-subscheme-modulo-p).

([[83]](#ref-83), PV Theorem 3.6, p.3, with proof; coefficient conventions §2 pp.1–2; Fano range Conjecture 2.2(ii), p.2.)

**Checks.**

- Plane cubics have `N=10` and reducible-locus codimension two. Plane conics have `N=6` and codimension one, and are excluded.
- `x_0^d−x_1 x_2^(d−1)` has the smooth point `[0:0:1:0:…:0]` over every `F_p`, since its `x_1` derivative is `−1` there; Hensel gives a local point at every prime.
- The primitive polynomial `x_0^d` is geometrically nonreduced but locally soluble everywhere. The reducible locus contains the possible large-prime failures; it is not equal to the insoluble locus.

<a id="refinement-hypersurface-finite-local-count"></a>

**Hypersurface finite local count.** For the same `n,d` and coefficient rank `N`, primitive coefficient vectors modulo sign with Euclidean norm`<=A` have total count `vol(B_N) A^N/(2 zeta(N))+o(A^N)`. Requiring local solubility at finitely many places multiplies this by `c_infinity,ball` `product_{p in finite set} c_p`, where `c_p` is normalized Haar probability on `Z_p^N` and the real factor is relative unit-ball volume. Scalar-invariant local solubility has the same conditional probability among primitive `p`-adic vectors.

For the proof, Use Mobius inversion for the common coefficient `gcd`, CRT and bounded-region lattice counts. Prove nullity of the real and `p`-adic solubility boundaries using the discriminant singular locus. Pair a with `−a` only after excluding the zero vector. Scalar invariance cancels the radial `p`-adic valuation sum, giving equality of full and primitive-conditional `c_p`. Real density uses the ball rather than the PV cube.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.1, [ArithmeticStatisticsPartI, family defined by local conditions][AS-I-5], AnalyticNumberTheoryPartI §§3.22,3.26.

([[83]](#ref-83), PV Theorem 3.6 and proof, p.3; primitive restriction Remark 2.1(2), p.1; Euclidean-ball adaptation not in PV.)

**Checks.**

- With no place restrictions and `(n,d)=(3,3)`, `N=20` and the main term is `vol(B_20)A²⁰/(2 zeta(20))`; the sign quotient contributes the factor two.
- Every real cubic in at least three variables has a nontrivial zero, by oddness on the connected unit sphere. Thus the real factor for cubic surfaces is one. In contrast, `x_0²+x_1²+x_2²+x_3²` has no nontrivial real zero.
- Multiplying `x_0^d−x_1 x_2^(d−1)` by `p^r`, `r≥1`, preserves its local zero set but makes its coefficient vector nonprimitive at `p`. This is the radial contribution removed by primitive conditioning.

<a id="refinement-hypersurface-local-density"></a>

**Hypersurface local density.** For `d>=2,n>=d,(n,d)!=(2,2)`, the ratio of locally soluble projective hypersurfaces with primitive Euclidean coefficient height`<=A` has limit `c_infinity,ball` `product_p c_p>0`. The unit-ball real factor and normalized `p`-adic factors are those of the finite count; the product is not silently assigned PV’s coefficient-cube real factor. This asserts local solubility only; the global Hasse-principle comparison is owned by Layer 5.

`Counting.hypersurface_local_density` states convergence to the positive product, using the primitive integral coefficient quotient by sign, the Euclidean unit-ball real factor and normalized local Haar probabilities.

For the proof, For each finite place set use the primitive ball count. The uniform tail controls the difference, so take A first and `M` second. Local smooth soluble examples give each factor positivity and the real factor positivity; uniform codimension-two finite-field counting yields `1−c_p=O(p^-2)`, hence positive product. Explicit boundary-null and chart adapters are `G`-local.

*Needs:* [hypersurface local tail](#refinement-hypersurface-local-tail), [hypersurface finite local count](#refinement-hypersurface-finite-local-count).

([[83]](#ref-83), PV Theorem 3.6 and proof, p.3; Conjecture 2.2(ii), p.2, for the Fano range; the local-density theorem is Theorem 3.6, p.3; with the Euclidean unit-ball real factor.)

**Checks.**

- Cubic surfaces have `(n,d)=(3,3)`, `N=20`, real factor one and a positive product of finite local factors.
- For quadrics in `P³`, `N=10` and `0<c_infinity,ball<1`: indefinite forms with a smooth real zero and positive definite forms each occupy an open coefficient set.
- Plane conics `(n,d)=(2,2)` lie outside the theorem; the codimension-one reducible locus does not supply its required summable prime tail.

### Supporting uniform estimates

<a id="support-sieves"></a>

The geometric sieve needs a projection/spreading adapter, not just a codimension slogan. For a fixed closed subscheme of affine `r`-space of codimension `k`, choose integral coordinate projections and a finite exceptional-prime set so that finite fibres have a uniform degree bound after reduction. For a bounded semialgebraic region `B` and dilation `t≥1`, prove the required finite-field point bound, the small-prime lattice estimate and the large-prime elimination estimate. The result is `O_B(t^r/(M^(k-1) log M)+t^(r-k+1))` for primes greater than `M≥2`, with the stated dimension restrictions and the customary harmless weakening at the boundary. Codimension one does not give a vanishing tail. Source: Bhargava, geometric sieve, Theorem 3.3 and its proof in §3. The strongly divisible discriminant locus is checked representation by representation; it is not assumed smooth at `p=2`.

For weakly square-divisible quartics use the quartic-field weak transport target, excluding product algebras. Its non-`S4` contribution and its maximal-order suborder estimates are separate targets in §2.8. Fixed reducible resolvents retain `O_ε(|d|^(1/4+ε))`; the genus and acceptable-extension bounds there are summed with the cubic-resolvent multiplicities. Proposition 23 alone covers only `S4` fields. For quintic rings supply the corresponding uniform suborder bound before invoking its nonmaximal tail. The references are Bhargava's quartic paper, Lemma 12 and Proposition 23, pp. 1044–1046 and 1056–1058, and the quintic paper, Proposition 19, pp. 1586–1588. Retain `ε` in the fixed-resolvent estimate.

For the monic sieve prove an average divisor-sum estimate for the rational-root and reducible loci; a pointwise assertion that every nonzero integer has boundedly many divisors is false. Degree four's extra quadratic-factor locus has the weaker exponent `22/3+ε`. A commensurable `S`-arithmetic lattice requires a finite-index denominator comparison of both generic orbit counts and bad-prime tails; it does not inherit a standard-lattice estimate without that comparison. The source is BSW `I`, Lemma 4.2, Proposition 4.3 and Theorems 4.1, 4.4, pp. 20–23, and Global Fields `I`, Theorems 4.7, 5.1–5.3, pp. 18–21.

For the even-degree binary sieve isolate the following implication. Assume a paired-fibre lattice count on actual full-rank `(A,B)` rows and the restricted Gram lower bound on `L_good(M)`, after deleting small discriminants and small constant terms. Then combine main, shallow and deep estimates and the non-Sn exclusion to obtain positive `δ,η` and `ξ≥0` with `τ=max(η,(η+ξ)/δ)<1` and `(2n+1)τ<n+1`. These assumptions give the summed tail and fixed-modulus sieve with those parameters. No numerical even-degree endpoint is inferred without those assumptions. The named row-spanning and paired-fibre contracts before §2.16 specify the counting sets, inequalities and uniform summations. The additional targets are the Cauchy–Binet/determinantal-ideal lower bound and the quantitative excluded-locus bound with logarithmic slack. A row-space condition is not a proof that a small coordinate block vanishes; use the deep-box inequalities themselves. Degree two has its own quadratic discriminant sieve. Source: BSW II, §§5–6, especially the restricted replacement for Lemma 6.25. The numerical exponent `1/(88n⁶)` is a proposed endpoint of this implication, rather than an unconditional consequence of the odd-degree argument.

<a id="support-coregular-count"></a>

**Windowed cubic counting contract.** The notation `C(F,φ,Σ)` means the conjunction of the precise windowed main term and uniform estimates in items 4–6 below, with the representation, weights and local mass normalization in items 1–3 and 7, including the explicitly requested `SL₂` volume-one input. It is an explicit analytic hypothesis in the orbit count and every three-isogeny mean or rank application that uses it. The following targets state these estimates; the hypothesis is not silently removed by the existence of a general counting theorem. BKLOS's six source axioms match representation (1), local weights (2), local spreading `(3), infinity I (4), infinity` II (5) and `V`-uniformity (6). The denominator additionally requires the `S`-uniformity in (6). Use Global Fields II [[131]](#ref-131), Theorem 3.8 pp.15–16 for the general counting input cited by BKLOS as Theorem 13. Its formulas are weighted until global stabilizers are handled.

<a id="cubic-representation-and-descent"></a>

1. **Cubic counting normalization.** Specialize ArithmeticStatisticsPartII’s **Supporting descent and integral realization**, **Divided-coefficient cubic discriminant** and **Three-isogeny mirror dictionary**, to the counting lattice. Use `G=SL₂` and `V` with coordinates `(a,b,c,d)` representing `ax³+3bx²y+3cxy²+dy³`. Its integral lattice is this divided-coefficient lattice; over `F` it is Sym`³(F²)`. Use its normalized `Disc`; the coefficient lattice and local finite-index changes are retained in the count.

The imported invariant algebra is `F[Disc]`, with `deg Disc=4=dim V` and generic geometric stabilizer order three. Compare this lattice with ordinary coefficients by `(a,b,c,d)↦(a,3b,3c,d)`, retaining the finite-index change at places above three. The ordinary binary discriminant is `−27Disc`. For `φ` of any abelian dimension choose the mirror parameter D̂ and `κ=4D̂` as in BKLOS Theorem 7.2, after a fixed square rescaling. For every `s≠0`, locally `φ`-soluble rational orbits of `Disc=κs` identify with `Sel_(φ_s)(A_s)`, with exactly one reducible orbit, corresponding to zero. This is the actual local Kummer subgroup, not all `H¹(F_v,A[φ])`.

Reuse the [ArithmeticStatisticsPartII, normalized cubic discriminant][AS-II-24] `TauCetiRoadmap.ArithmeticStatisticsPartII.Cubic.normalizedDisc`, the displayed polynomial over any commutative ring. Its imported API includes coefficient homogeneity `Disc(u·v)=u⁴Disc(v)` and the universal fixed-degree binary identity `Δ=−27Disc`, also in characteristics two and three. The affine-polynomial version `ordinaryDisc_eq` is stated over any field with `a≠0`; when `a=0` its degree can drop and its affine discriminant is a different invariant. Only the orbit and counting assertions require the number-field hypothesis.

For the counting adapter, use the norm-one cohomology and mirror dictionary from ArithmeticStatisticsPartII, **Supporting descent and integral realization**, **Three-isogeny mirror dictionary**, and BKLOS Theorems 4.2,5.3,7.1 pp.6–10; verify the polynomial normalization and the invariant generator directly. The source representation is over `O_F` with possible denominators only at a fixed finite set, handled by commensurable lattices. **Needs:** ArithmeticStatisticsPartII, **Three-isogeny mirror dictionary**; AbelianSchemesAndArithmeticModuli §`A3`; SelmerIwasawaCohomology §2.12a; Mathlib polynomial invariants.

**Checks.**

- `(a,b,c,d)=(0,1,0,s/4)` gives `Disc=s`. Over `Z` the form `(1,0,0,1)` gives `Disc=1` and ordinary `Δ=−27`.
- For `(0,1,0,1), Disc=4` and the fixed-degree cubic `Δ=−108`, whereas the affine quadratic `3X²+1` has discriminant `−12`. This tests the leading-coefficient hypothesis of `ordinaryDisc_eq`.
- In characteristic three the divided-coefficient vector `(1,0,0,1)` has `Disc=1` but its affine polynomial `X³+1` has discriminant zero. The polynomial identity survives; the characteristic-zero orbit dictionary is not inferred from `Disc≠0` there. In characteristic two the same vector has both discriminants one, which tests the sign after reduction.
- `Disc=0` is excluded throughout; `x³` has infinite stabilizer and no étale orbit dictionary.
- For real places `#coker φ_s=1` and `#ker` is one or three; over `C` the ratio is `1/3` in every abelian dimension, as in BKLOS Proposition 10.1 p.14.

<a id="cubic-integral-multiplicity"></a>

2. **Integral representatives and exact multiplicity.** At every finite `v` and local representative with `v(s)∈{0,1}`, each soluble `G(F_v)`-orbit of `Disc=κs` meets `V(O_v)`, for one fixed `κ` independent of `s` and of the orbit. For shifted ideal-class charts use a fixed local square rescaling and the resulting commensurable lattice. Let `β` run through the finite adelic class set, `L_β=V(F)∩β⁻¹V(O_f)` and `Γ_β=G(F)∩β⁻¹G(O_f)β`. For a rational regular orbit `O` meeting these soluble integral charts, let `m₀(O)∈[0,1]` be its prescribed orbit selector: in the counting application it is the indicator of the chosen local-solubility and finite local-family conditions, with the archimedean window treated separately. Put

`D(O)=Σ_β Σ_(Γ_β u⊂O∩L_β) 1/#Stab_(Γ_β)(u)`,

`w(u)=m₀(O)/(#Stab_(G(F))(u)·D(O))`.

The denominator sum `D(O)` is finite and strictly positive on these orbits, even when the selector `m₀(O)` is zero. Their exact identity is `Σ_β Σ_(Γ_β u⊂O∩L_β) w(u)/#Stab_(Γ_β)(u)=m₀(O)/#Stab_(G(F))(u)`. Locally use the identical formula with `G(F_v),G(O_v)` and the finite sum over integral local orbits. For the application assume `m₀` is the product of the stated local selectors; with the matching adelic charts and mass normalization, `w` then factors into these local weights. This factorization is not asserted for an arbitrary rational-orbit function `m₀`. No uniform bound on the number of integral representatives is assumed. Outside the finite primes dividing `6κ` or bad reduction, `w_v=1` whenever `v(Disc)<2`. The local functions are invariant and locally constant off the discriminant-zero null set, with convergent products. The density of the nontrivial-local-stabilizer locus is `≤1−c` for some `c>0` at all sufficiently large primes; the separable `(1,2)` splitting type gives a uniform open set with trivial stabilizer.

To prove this target, use BKLOS Theorems 6.2,7.2 pp.9–11 for integral representatives, finite local orbit dictionaries for finiteness, and [[131]](#ref-131), Lemma 3.1, equations (9)–(13) pp.11–12 for factorization. Read the factors as reciprocal stabilizer sizes: multiplication by the stabilizer size would give the wrong total. Use finite-field cubic splitting counts for the density bound. General `F` requires the adelic integral lattices, even when a single principal integral representative is unavailable. **Needs:** GlobalNumberFields Layer 11 order/ideal and AdelicAlgebraicGroups §3.4 adelic class-set interfaces, local cubic dictionary and finite étale descent.

**Checks.**

- One integral orbit with the same stabilizer as the rational orbit has `w=m₀`, giving contribution `m₀/#Stab`, not `m₀·#Stab`.
- With two integral orbits of stabilizer one and rational stabilizer one, `w=m₀/2` on each; the sum is `m₀`. If the selector is zero, every representative has weight zero while `D(O)` remains positive; an orbit with no integral representative is outside the domain of this quotient.
- A rational nontrivial stabilizer can occur for only the single squareclass making `A[φ_s]` rational. Its fixed finite Selmer count is `O(1)`; this removes the rational `1/#Stab` weight asymptotically. It does not remove the reducible identity family, which has one orbit per twist.

<a id="cubic-local-spreading"></a>

3. **Local spreading.** For each place `v` and each regular `u∈V(F_v)`, there is an open neighborhood `U` of `Disc(u)` and a continuous section `σ:U→V(F_v)`, with `Disc∘σ=`id and `σ(Disc(u))=u`. Local solubility and fixed finite squareclass conditions are constant on a sufficiently small regular neighborhood. A global section is `s↦(0,1,0,s/4)`, over `O_F[1/2]`, but a section through `u` is needed in each orbit chart.

To prove this target, check smoothness of `Disc` on `Disc≠0` and apply the real/complex or nonarchimedean implicit-function theorem; transport the étale orbit/cohomology data on this neighborhood. This supplies the local spreading axiom without assuming every orbit equals the distinguished reducible section. **Needs:** Mathlib analysis and local implicit functions, Layer 1 local descent. Sources: [[131]](#ref-131), Proposition 3.4, local spreading axiom and Remark 3.6 p.14; BKLOS §8 p.13.

**Checks.**

- The displayed section passes through the reducible orbit, not every irreducible local orbit.
- At primes two and three work over `F_v` and shrink the neighborhood; no integral smoothness assertion at those primes is needed.
- At `Disc=0` a section-through-every-point assertion can fail, and no such point is counted.

<a id="cubic-squareclass-window"></a>

4. **Squareclass charts and infinity I.** Use the weight-two action `u:s↦u²s`. For each ideal-class representative `γ` in the finite idele class group of `G_m` take `S_γ=F×∩γ⁻¹∏_v{v(s)=0 or 1}`, where `γ` acts with weight two, so `v(s)+2v(γ_v)∈{0,1}`. Choose `γ` with nonpositive finite valuations to make `S_γ` integral. Put `I_γ=∏_v p_v^(v(γ_v))`; for `s∈S_γ, I(s)=I_γ` and `H(s)=NI_γ²∏_(v|∞)|s_v|_v`. The squareclass carrier is the disjoint union of `S_γ/O_F×²`. Include all charts; squarefree ideals need not be principal.

Choose a half-open parallelotope `P` for the lattice `2log|O_F×|` in `Σ_v x_v=0`, and an angular sector with null boundary for the finite effective action of torsion-unit squares. For `x_v=log|s_v|_v` and `d_v=[F_v:R]`, require `(x_v−(d_v/[F:Q])Σ_w x_w)_v∈P` and the chosen sector. Together with `H(s)<X` and the allowed signs this defines `Ω_γ(X)`. Its boundary is null, `0<vol Ω_γ(1)<∞` for nonempty allowed signs, and `Ω_γ(X)=X^(1/[F:Q])Ω_γ(1)` up to boundaries. Product additive measure is used, with `covolume(O_F)=1` at `infinity` and `vol(O_v)=1` finitely. Thus `vol Ω_γ(X)=X vol Ω_γ(1)`. Choose finitely many regular orbit sections above the height-one angular window; their coefficient representatives form a bounded set `R_(γ,1)`, and `R_γ(X)=X^(1/(4[F:Q]))R_(γ,1)` with the radial interval filled in.

To prove this target, use Dirichlet's unit lattice and finite class group, then compactness after balancing local absolute values and local spreading. The torsion sector and half-open boundary choices ensure one squareclass representative, not a stack weight. Source: [[131]](#ref-131), §2.2 Proposition 2.1 and Lemma 2.2 pp.6–9, specialized to one coordinate of weight two; square their height to obtain this `H`. Retain the chart-dependent factor `NI_γ²` when comparing heights. **Needs:** GlobalNumberFields Layers 2–3 units/class groups and lattice dictionary, AdelicAlgebraicGroups §3.4 fundamental domains, the preceding spreading target.

The window couples the infinite places. Its indicator need not satisfy the separate local scalar-invariance condition of Global Fields II's local-weights axiom. Apply that axiom to the solubility/sign weight before cutting the window, and prove the windowed `infinity`-II estimate in item 5 directly. A raw sign cone for a field with several infinite places has infinite product-height volume; it cannot replace `Ω_γ`.

**Checks.**

- Over `Q` there is one ideal chart, `Ω(1)=(−1,1)` with zero deleted for both signs; positive signs give `(0,1)`. The respective volumes are two and one.
- For a real quadratic field set `x₁+x₂` fixed; `P` bounds `x₁−x₂`, removing the infinite-volume hyperbola. The scalar `X^(1/2)` multiplies area by `X`.
- Over `C` the normalized absolute value is `|z|²`; the height-one `disc` has finite planar area, and scaling by `X^(1/2)` multiplies that area by `X`. Torsion-unit squares may require an additional angular sector.

<a id="cubic-windowed-main-term"></a>

5. **Windowed infinity II and finite congruences.** For every fixed chart `γ`, commensurable `Γ₀`-invariant lattice `L₀` and subgroup `Γ₀` commensurable with `SL₂(O_F)`, and every fixed bounded `Γ₀`-invariant finite-congruence weight `a_f`, let `N_(a_f)(X)` sum `a_f(u)/#Stab_(Γ₀)(u)` over irreducible `Γ₀`-orbits in `L₀` with `Disc` in `κΩ_γ(X)`. Let `F₀` be an arithmetic fundamental multiset and `ν_(∞,L₀)` the coefficient measure of covolume `L₀` equal to one. Then the required estimate is

`N_(a_f)(X)= [∫_(F₀R_γ(X)) a_∞(u)/#Stab_(G(F_∞))(u) dν_(∞,L₀)(u)]·∏_(v finite) avg_(L₀,v) a_v + o_(γ,L₀,Γ₀,a_f)(X)`.

The product uses the actual finite residue integral (or a finite disjoint CRT sum for coupled conditions). `a_∞` is the solubility/sign weight; `Ω_γ` already restricts invariants. The bracket is linear in `X`. The statement includes the corresponding fixed-modulus denominator count on `Ω_γ(X)`, with rank-one coefficient lattice and the same normalization. It is not required uniformly as the modulus varies. Singular or reducible points are excluded from this irreducible count; their entire orbit count is not claimed `o(X)`.

To prove this target, use the windowed variant of [[131]](#ref-131), `infinity`-II equations (14)–(15) pp.12–13 and the proof of Theorem 4.1 pp.16–20. For the diagonal torus the four weights are `−3α/2,−α/2,α/2,3α/2`; a rational cubic with its least-weight coordinate zero is reducible. Every nonempty saturated subset contains that coordinate, hence its irreducible cusp is empty. For the empty subset take `π=0` (degree `−∞`), with `δ=−α` and total coordinate weight zero. The remaining root inequality uses `α=−2(−α/2)`. Irreducible cubics modulo large primes have density bounded below, so the main-body nongeneric lattice contribution is negligible by the finite-prime sieve. Apply Davenport counting in the averaged bounded main body and sum the commensurable-lattice cosets. Approximate the compact angular window from inside and outside by finitely many regular bounded regions; its null boundary makes the volume discrepancy arbitrarily small. The cusp domination uses their fixed compact envelope, so the same `o(X)` conclusion survives the coupled archimedean cutoff. This explicit window adaptation, rather than an invocation with an infinite sign cone, is the supplier target. **Needs:** GeometryOfNumbersAndQuadraticArithmetic §4.1, AdelicAlgebraicGroups §§3.1–3.4 reduction/fundamental-multiset integration, items 1–4.

**Checks.**

- Uniform real coefficient scaling is `X^(1/(4[F:Q]))`; `dim_R V(F_∞)=4[F:Q]`, giving main exponent one.
- Replacing `Γ₀` or `L₀` by a fixed finite-index variant changes its covolume and finite residue integral; it does not preserve the old constant automatically.
- Reducible identity orbits have order `X` in this ordering. Only nongeneric lattice contributions in the averaged main body are discarded.

<a id="cubic-two-uniform-tails"></a>

6. **Uniformity for V and S.** Enlarge the fixed exceptional prime set `B` to contain primes above `6κ`, bad reduction and the chart/lattice denominators. There exist functions `f(M),g(M)→∞` such that for every fixed chart and arithmetic lattice, for all `M` beyond `B`,

`limsup_(X→∞) X⁻¹ N_irr(∪_(Nv>M){u:w_v(u)≠1};X) ≤ C/f(M)`,

`limsup_(X→∞) X⁻¹ #{s in the chart window of height<X: ∃Nv>M, v(s)+2v(γ_v)≥2} ≤ C/g(M)`.

The second count is on the unsieved integral chart lattice, before imposing valuation zero or one. The first counts irreducible integral orbits with reciprocal arithmetic stabilizers and no additional local weight. Weights in `[0,1]` decrease it; any fixed uniformly bounded nonnegative weight costs its bound. Constants may depend on `F,φ` and the fixed charts/lattices, but not `X,M`. These are the `V` and `S` estimates (17),(24) of [[131]](#ref-131), pp.13,15. Their iterated limits, together with item 5, justify the infinite product.

To prove the `V` target, outside `B` the exceptional locus is contained in `v(Disc)≥2` by item 2. Use the cubic discriminant large-prime tail of Global Fields `I` Theorem 5.2, §5 pp.19–21 in arXiv:`1512.03035v2` (the [global field large prime tail](#refinement-global-field-large-prime-tail)), after comparing its determinant-twisted `GL₂` orbits with the present `SL₂` orbits in the fixed weight-two representative charts. `A GL₂(O_F)`-orbit can contribute only finitely many such `SL₂`-orbits once the discriminant representative is fixed: determinants preserving it have square one. Retain the fixed ideal-class charts and finite-index lattice factors in this comparison. For `S` use squarefree-ideal Möbius inversion, or the rank-one large-prime square-divisor lattice estimate in the balanced window: the sum of local probabilities is `O(Σ_(Nv>M)Nv⁻²)`. Bound the remaining large ideals using the containing compact scaled region and ideal counting, before taking `M→∞`. **Needs:** items 2,4–5, the Layer 2 global-field tail, AnalyticNumberTheoryPartI §§3.3–3.4,3.27 ideal counts and GlobalNumberFields Layer 3 ideal lattices. No even-degree binary-pencil Gram estimate enters this cubic tail.

**Checks.**

- Fixed-prime `o(X)` errors alone do not imply either displayed uniform inequality.
- At a prime dividing 3 or `κ, v(Disc)<2` is not used to assert `w_v=1`; these primes remain in `B`.
- Taking the union on `S` only after imposing squarefreeness would make the tail identically empty and would not prove the denominator sieve.

<a id="cubic-mass-and-assembly"></a>

7. **Local mass and assembly.** At each `v`, for `t=κs≠0`,

`Σ_(G(F_v)u soluble, Disc(u)=t) 1/#Stab_(G(F_v))(u)=c_v(φ_s)`.

Choose invariant top differentials `ν` on `V, μ=dt` on `A¹` and `τ` on `SL₂` once. There is a single `J∈F×` with the local orbit change-of-variables factor `|J|_v`, as in [[131]](#ref-131), Proposition 3.4 and Lemma 3.7 pp.14–15. The rational-to-integral weights of item 2 give the coefficient integral `|J|_v·vol_τ(SL₂(O_v))·∫_(κΣ_(γ,v))c_v(φ_(t/κ))dt`. The infinite-place integral has the same orbit-stabilizer divisor and the actual `κΩ_γ(X)`. The product formulas `∏_v|J|_v=∏_v|κ|_v=1` and `τ_(SL₂,F)=1` cancel these global factors.

The supporting target `sl2-tamagawa-one` states that, for every number field `F` and nonzero `F`-rational invariant top form `τ`, the quotient `SL₂(F)\SL₂(A_F)` has volume one for `D_F^(-3/2)∏_v|τ|_v`, with `dx` at real places, 2dxdy at complex places and `vol(O_v)=1` finitely. AdelicAlgebraicGroups Layers 2–4 provide the measure, finite volume and strong approximation, rather than this value. `C` includes this additional volume theorem; it is not inferred from finite volume. BKLOS §8 p.13 uses this value over general `F`. For a proof route, unfold the nonzero-vector `theta` sum on `SL₂(F)\SL₂(A_F)` along the stabilizer `U≃G_a`. The local quotient Jacobian identifies `SL₂/U` with the nonzero-vector locus in `A_F²`, whose adelic image has full measure: locally the zero vector is null, and almost all integral pairs are primitive almost everywhere since `∑_v Nv⁻²` converges. The quotient `U(F)\U(A_F)` has volume one. This gives the integral of the nonzero-vector sum as `∫f`. Add the zero term and apply additive Poisson summation to `f` and its Fourier transform. Invariance under `g↦g^(-transpose)` gives `T f(0)+∫f=T∫f+f(0)`, where `T` is the finite quotient volume. Choosing a Schwartz–Bruhat `f` with `f(0)≠∫f` forces `T=1`. The required adapters are the quotient integration/Jacobian and integrability of these sums, using AdelicAlgebraicGroups Layers 2–3 and AutomorphicLFunctionsAndLocalFactors §AL.0 additive Fourier/Poisson interface. Over `Q`, Platonov–Rapinchuk–Rapinchuk (2023), §5.3 Example 5.23 p.316, independently computes `ζ(2)·∏_p(1−p⁻²)=1`; its discussion p.317 describes the general Poisson method. This request concerns the volume theorem only; it does not duplicate AdelicAlgebraicGroups’ existing adelic or Haar constructions.

Keep the discriminant normalization when passing from the differential measures to the covolume-one measures in items 4–5. If `D_F` is the absolute field discriminant, `ν_(∞,O_F⁴)=D_F^(-2)ν_∞` and `μ_∞*=D_F^(-1/2)μ_∞`. The remaining factor `D_F^(-3/2)` belongs to the adelic `SL₂` Tamagawa measure, since `dim SL₂=3`. Thus `D_F^(-2)=D_F^(-3/2)D_F^(-1/2)` is precisely the dimension identity used to obtain the invariant mass with `μ_∞*`, as in [[131]](#ref-131), equation (22) p.15. Fixed lattice indices are retained before this cancellation. Normalizing the separate local group volumes to one would destroy it.

Thus put `D_γ(X)=vol(Ω_γ(X))∏_(v finite)vol(Σ_(γ,v))`, using the normalized measures of item 4, and put `C_γ(X)` equal to the same expression with `c_v` inserted in each integral. Items 5–6 give `#Σ_γ(X)=D_γ(X)+o(X)` and `N_(irr,γ)(X)=C_γ(X)+o(X)`. Sum over `γ` before dividing. Local square rescaling of a chart preserves `c_v` and changes numerator and denominator by the same Haar factor; `c_∞` depends only on signs. Consequently `C_γ/D_γ` is the displayed local-ratio product for one rectangle. Compatibility and the positive denominator target give `Σ_γ D_γ(1)>0`. The only rational-stabilizer correction is `O(1)` by item 2. Add one identity per class for the Selmer mean.

To prove this target, the local Kummer bijection identifies the number of soluble local orbits with `#coker φ_s` and their stabilizer with `A_s[φ_s](F_v)`. Apply the differential formula to each orbit chart and the exact integral weights. Use one global differential and the adelic Tamagawa normalization from AdelicAlgebraicGroups §§2.3–2.4 and the volume target here; do not independently set every group Haar volume to one. **Needs:** items 1–6, local descent, AdelicAlgebraicGroups §§2.2–2.4 Haar/Tamagawa, the local `sl2-tamagawa-one` target and product formula, the positive denominator target. Sources: BKLOS Theorems 4.2,5.3 and §8 pp.6–13; [[131]](#ref-131), equations (19)–(26) pp.14–16.

**Checks.**

- A local `coker` of order three and kernel of order three gives mass one, while `coker` one and kernel three gives mass `1/3`.
- If a representative coordinate is changed by `t=κs`, both local numerator and denominator acquire `|κ|_v`; dropping it only at a bad finite prime is incorrect.
- In a two-orbit integral fibre with trivial stabilizers the weights `1/2,1/2` give total one. A constant local/global-ratio-one family gives mean `1+1=2` after the identity is added.
- Writing `d=√D_F`, the normalization check is `d⁻⁴=d⁻³d⁻¹`; at `d=2` both sides are `1/16`. Omitting the group factor would instead leave `1/2`.

For the marked-genus-one second moment, sum the sparse quaternary estimates over leading-coefficient/monicization ranges with their actual a-dependent support. Preserve the relation between `X,Y,θ,δ` and the absolute positive saving `λ`: choose `10θ+62δ<λ` before absorbing logarithms. The fixed-slice smoothed count is an input to this sum, not the whole second-moment argument. Source: BSS Theorem 5.1 and the counting and monicization assembly in §§5–7, pp. 24–47.

### Examples

For the invariant `Δ(a)=a`, one residue out of `p²` is divisible by `p²`. For `Δ(a)=a²`, the bad locus has codimension one and one residue out of `p` is bad; its prime tail cannot be treated by a codimension-two estimate. If `Δ=0`, infinitely many squarefree moduli divide it, which is why the finite divisor-multiplicity statistic assigns that case zero and the singular locus is counted separately.

For quartic invariant height, the positive and negative real regions have respective areas `8/5` and `32/5` at height one. Combining them as equal sign masses loses a factor four. The ordered `PGL2` tangent basis `(E11,E12,E21)` gives the orbit-Jacobian determinant `-1/27`; the measure uses its absolute value. At `p=3` that factor is 27, whereas it is one at every other prime. A coupled CRT condition such as equal residues modulo two and three must use its actual proportion modulo six, rather than multiplying its full marginal projections.

For the light tail interfaces, `Δ=36` and `M=5` has exactly one contributing squarefree square divisor, `m=6`. With `M=6` the same tail is empty and its multiplicity is zero; at `Δ=0` both are zero by the separate singular convention. Under the trivial action of the two-element permutation group, transporter weights two and section weight three give kernel twelve. Setting either weight to zero gives zero, so the stabilizer multiplicity cannot be removed. The rational-root estimate uses the strict weighted coefficient box and descending monic polynomial from Part `I`, with `n≥2` and `X≥2`.

### Dependencies

ArithmeticStatisticsPartI Layer 0 and ArithmeticStatisticsPartII Layer 1; the Mathlib Chebyshev estimate and partial summation; GeometryOfNumbersAndQuadraticArithmetic Layers 0–4 and GlobalNumberFields Layer 3 lattice/coset bounds; real and `p`-adic integration; AdelicAlgebraicGroups Layers 0–4 reduction and Haar contracts; AnalyticNumberTheoryPartI Layer 3 arithmetic sums and AnalyticNumberTheoryPartII §5.21 cubic continuation; and InverseGaloisAndArithmeticFundamentalGroups §IG.2 for specialization in quantitative Galois exclusion. The moving-lattice, all-orbit transport, paired even-degree and specialized coregular assertions above are local supporting targets.

## Downstream consumers

ArithmeticStatisticsPartIV–PartVIII and ModularityAndLanglandsExtensions are downstream consumers of the exact targets supplied here; none supplies an input to this part. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. AnalyticNumberTheoryPartI Layers 0–3 and AnalyticNumberTheoryPartII Layer 5 supply the analytic inputs specified above.

## References

<a id="ref-1"></a>

[1] Manjul Bhargava and Arul Shankar. [Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves](https://arxiv.org/abs/1006.1002v3). arXiv:1006.1002v3 (latest version), dated 24 December 2013, 36 pp.; published in Annals of Mathematics 181 (2015), 191–242.

<a id="ref-5"></a>

[5] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012), 38 pp.; published in Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-19"></a>

[19] Manjul Bhargava. [The geometric sieve and the density of squarefree values of invariant polynomials](https://arxiv.org/abs/1402.0031). arXiv:1402.0031v1 (31 January 2014; title date 4 February 2014), 31 pp.

<a id="ref-73"></a>

[73] Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang. [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2, 24 February 2017, 42 pages.

<a id="ref-74"></a>

[74] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3). arXiv:1611.09806v3, 31 December 2021, 29 pages.

<a id="ref-77"></a>

[77] Manjul Bhargava. [The density of discriminants of quartic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v162-n2-p10.pdf). Annals of Mathematics 162 (2005), 1031–1063.

<a id="ref-78"></a>

[78] Manjul Bhargava. [The density of discriminants of quintic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf). Annals of Mathematics 172 (2010), 1559–1591.

<a id="ref-79"></a>

[79] Manjul Bhargava, Arul Shankar, Jacob Tsimerman. [On the Davenport–Heilbronn theorems and second order terms](https://arxiv.org/pdf/1005.0672v3). arXiv:1005.0672v3, 20 June 2012, 38 pages.

<a id="ref-80"></a>

[80] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/pdf/1512.03035v2). arXiv:1512.03035v2.

<a id="ref-81"></a>

[81] Manjul Bhargava. [The geometric sieve and the density of squarefree values of invariant polynomials](https://arxiv.org/pdf/1402.0031). arXiv:1402.0031, arXiv preprint, Theorem 2.1 and §3.

<a id="ref-82"></a>

[82] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf). Forum of Mathematics Pi 13 (2025), e17, 57 pages.

<a id="ref-83"></a>

[83] Bjorn Poonen, José Felipe Voloch. [Random Diophantine equations](https://math.mit.edu/~poonen/papers/random.pdf). Author PDF dated 19 June 2003, 8 pages; published pp.175–184 (2004).

<a id="ref-85"></a>

[85] Manjul Bhargava, Arul Shankar. [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2). arXiv:1007.0052v2.

<a id="ref-86"></a>

[86] Manjul Bhargava, Arul Shankar. [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1). arXiv:1312.7333v1.

<a id="ref-87"></a>

[87] Manjul Bhargava, Arul Shankar. [The average size of the 5-Selmer group of elliptic curves is 6](https://arxiv.org/pdf/1312.7859v1). arXiv:1312.7859v1.

<a id="ref-88"></a>

[88] Manjul Bhargava, Arul Shankar, Ashvin Swaminathan. [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1). arXiv:2110.09063v1.

<a id="ref-89"></a>

[89] Manjul Bhargava, Zev Klagsbrun, Robert Lemke Oliver, Ari Shnidman. [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf). Author PDF 19-3IsogenySelmer, Theorems 4.2, 5.3 and §§7–8.

<a id="ref-131"></a>

[131] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Geometry-of-numbers methods over global fields II: Coregular representations](https://arxiv.org/pdf/2604.16978v1). arXiv:2604.16978v1, 18 April 2026. Locators use the printed preprint pages; §2.2 pp.6–9, §3 pp.10–16 and §4.1 pp.16–20.

[AN-II-1]: ../AnalyticNumberTheoryPartII/README.md#s5-4
[AN-II-2]: ../AnalyticNumberTheoryPartII/README.md#s5-5
[AN-II-3]: ../AnalyticNumberTheoryPartII/README.md#s5-6
[AN-II-4]: ../AnalyticNumberTheoryPartII/README.md#s5-7
[AN-II-5]: ../AnalyticNumberTheoryPartII/README.md#s5-21
[AN-II-6]: ../AnalyticNumberTheoryPartII/README.md#s5-28
[AN-II-7]: ../AnalyticNumberTheoryPartII/README.md#s5-29
[AS-I-1]: ../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs
[AS-I-2]: ../ArithmeticStatisticsPartI/README.md#acceptable-weight-function
[AS-I-3]: ../ArithmeticStatisticsPartI/README.md#refinement-binary-discriminant
[AS-I-4]: ../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil
[AS-I-5]: ../ArithmeticStatisticsPartI/README.md#family-defined-by-local-conditions
[AS-I-6]: ../ArithmeticStatisticsPartI/README.md#stabilizer-weighted-orbit-count
[AS-I-7]: ../ArithmeticStatisticsPartI/README.md#twist-denominator-frontier
[AS-I-8]: ../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action
[AS-II-1]: ../ArithmeticStatisticsPartII/README.md#stabilizer-of-a-binary-quartic-is-two-torsion
[AS-II-2]: ../ArithmeticStatisticsPartII/README.md#embedding-into-pairs-of-ternary-quadratic-forms
[AS-II-3]: ../ArithmeticStatisticsPartII/README.md#fibres-of-the-embedding-are-uniformly-bounded
[AS-II-4]: ../ArithmeticStatisticsPartII/README.md#binary-quartic-parametrization-of-e-mod-2e
[AS-II-5]: ../ArithmeticStatisticsPartII/README.md#delone-faddeev-parametrization-of-cubic-rings
[AS-II-6]: ../ArithmeticStatisticsPartII/README.md#pairs-of-ternary-quadratic-forms
[AS-II-7]: ../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quartic-rings
[AS-II-8]: ../ArithmeticStatisticsPartII/README.md#quartic-ring-and-cubic-resolvent
[AS-II-9]: ../ArithmeticStatisticsPartII/README.md#existence-and-number-of-cubic-resolvents
[AS-II-10]: ../ArithmeticStatisticsPartII/README.md#maximality-of-quartic-rings-at-p
[AS-II-11]: ../ArithmeticStatisticsPartII/README.md#quadruples-of-quinary-alternating-forms
[AS-II-12]: ../ArithmeticStatisticsPartII/README.md#bhargava-parametrization-of-quintic-rings
[AS-II-13]: ../ArithmeticStatisticsPartII/README.md#maximality-of-quintic-rings-at-p
[AS-II-14]: ../ArithmeticStatisticsPartII/README.md#refinement-one-matrix-slice
[AS-II-15]: ../ArithmeticStatisticsPartII/README.md#refinement-marked-q
[AS-II-16]: ../ArithmeticStatisticsPartII/README.md#refinement-q-discriminant-divisibility
[AS-II-17]: ../ArithmeticStatisticsPartII/README.md#refinement-weak-lift-odd
[AS-II-18]: ../ArithmeticStatisticsPartII/README.md#refinement-even-weak-lift
[AS-II-19]: ../ArithmeticStatisticsPartII/README.md#refinement-q-hyperdeterminant
[AS-II-20]: ../ArithmeticStatisticsPartII/README.md#refinement-integral-pencil-orbits
[AS-II-21]: ../ArithmeticStatisticsPartII/README.md#ternary-cubic-forms-and-their-invariants
[AS-II-22]: ../ArithmeticStatisticsPartII/README.md#invariance-of-ternary-cubic-invariants
[AS-II-23]: ../ArithmeticStatisticsPartII/README.md#refinement-genus-one-stabilizer-schemes
[AS-I-9]: ../ArithmeticStatisticsPartI/README.md#strong-weak-discriminant
[AS-II-24]: ../ArithmeticStatisticsPartII/README.md#supporting-descent-and-integral-realization
