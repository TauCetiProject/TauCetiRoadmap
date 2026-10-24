# Roadmap: locally analytic distributions, growth and character spaces

**Summary.** This roadmap builds the analysis of locally analytic functions and distributions on
`ℤ_p`, on finite products of rings of integers of `p`-adic fields and on compact `p`-adic analytic
manifolds, and the operator theory of `p`-adic families, as the common input of non-ordinary
`p`-adic L-functions, `p`-adic regulators and eigenvarieties. Layer 0 gives the space `LA` of
locally analytic functions its compact-type topology and the dual `D` of distributions its
projective-limit topology over the Banach stages `LA_h` of PadicFunctionalAnalysis, with the
nonarchimedean locally convex calculus (strict sequences, left hearts, completed tensors,
compact-type duality) that passing between them needs. It also constructs the Hyodo–Kato cohomology
of semistable Stein curves and curve towers, with their completed de Rham comparisons, from the
log rigid complexes of CrystallineCohomology and the dagger spaces of AdicSpacesPartIV (§0.CR.6.6).
Layer 1 builds the full operator dictionary and the non-splitting of differentiation on the unbounded Amice theorem
`D(ℤ_p, L) ≅ R⁺` (Colmez Theorem II.2.2) of PadicFunctionalAnalysis.
Layer 2 develops functions of class `C^r` and distributions of order `r`, proves the
Amice–Vélu–Vishik extension and uniqueness theorem with its sharp degree bound, and its vector-order
form on `ℤ_p^g`. Layer 3 identifies the distribution spaces with the compact abelian Mellin interfaces of
PhiGammaModulesAndIwasawaCohomology §4.0 and develops their growth, weight and geometric comparisons. Layer 4 takes complete
continuity, Fredholm determinants, the resolvent,
Riesz decompositions at a root and Coleman's spectral mapping theorem from CompactOperators,
with generic entire algebra from RestrictedPowerSeries §7.2, and
develops over a Noetherian Banach algebra the further Fredholm theory of Serre, Coleman and
Buzzard that families need: the fixed-rank spectral transform and truncation limits, finite-slope
decompositions, finite-slope perfect complexes and the torus order on slopes. It starts from
Mathlib's bounded measures and Amice transform, `c₀` spaces, restricted power series and Gauss
norms, resultants and characteristic polynomials, from Tau Ceti's resultant–norm and Gauss-norm
libraries, from the bounded measures of PadicMeasuresIwasawaAlgebras and the affinoid lattice
comparison and quasi-Stein spaces of AdicSpacesPartIII, and from the Banach modules, analytic stages
and compact operators of PadicFunctionalAnalysis and CompactOperators.

Everything is stated over a complete nonarchimedean field K (a finite extension of ℚ_p in the arithmetic applications) and, for families, over a commutative Noetherian K-Banach algebra A; general locally convex or distribution spaces are never silently treated as Banach spaces.

The targets below are specifications for formalisation. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source and the earlier targets or library declarations it rests on. The companion [Suggested.lean](Suggested.lean) states the closed-disc maximum principle, nonarchimedean Hahn–Banach and Fréchet open mapping, fixed-rank spectral convergence, the entire spectral limit and compactness of Tate-algebra maps with topologically nilpotent coordinate images, with four definitions needed for the spectral statements. It is not exhaustive, and this document is definitive. The compact-type and strong-duality comparisons, Hyodo–Kato comparisons, Amice and Mellin equivalences, sharp extension and uniqueness theorems, and finite-slope complexes require carriers absent from the pins and are specified here. API names elsewhere in this document specify declarations to build; they do not assert that those declarations appear in the companion file. Implementations import the named supplier APIs and retain one owner for each object; the supplier contracts list the interfaces.

## Scope and ownership

This roadmap owns the following material.

- Pointwise realization of native restricted series on translated closed discs and finite polydisc charts, with the maximum-principle comparison, the compact-type topology of locally analytic functions and the topology of their dual of distributions, in one variable, on finite products of local integer rings (distinguishing ℚ_p-analytic from F-analytic functions) and on compact p-adic analytic manifolds through charts.
- The nonproper finite-piece dagger Hyodo–Kato comparison and the Hyodo–Kato cohomology of semistable Stein curves as Fréchet projective limits, the completed Hyodo–Kato comparison, and semistable curve towers as ind-Fréchet spaces, with continuous Frobenius, monodromy and group actions (§0.CR.6.6).
- The strict-sequence and three-space results for nonarchimedean Banach, Fréchet and compact-type spaces that are used to pass between stages, limits and duals, including the nonarchimedean Hahn–Banach theorem over a spherically complete field, which is stated here as a target rather than taken from another roadmap.
- The Fréchet topology of the unbounded Amice transform (distributions ↔ power series convergent on the open disc), and the operator dictionary: point masses, convolution, multiplication by the coordinate, character twists, clopen restriction, the transpose derivative and the logarithm, dilation, φ and ψ, division by the coordinate on the units, local primitives, and the non-splitting of differentiation and of the logarithm sequence.
- Functions of class C^r, distributions of order r, the identification of order zero with bounded measures, the Amice–Vélu–Vishik theorem with the strict degree bound, vector order on ℤ_p^g through completed tensors of one-variable spaces, rectangular growth bounds, the critical counterexample, the small-order isotropic function spaces and equal-radius extension theorem, and the ray-class growth adapters.
- Component Mellin series of bounded measures, arithmetic branches ω(x)^i⟨x⟩^s, clearing factors for pseudo-measures, identification of the manifold distribution spaces with the supplied compact abelian Mellin algebra, and its boundedness, evaluation, multiplicativity, generator-change, weight-derivative, twist, functoriality and coefficient-extension comparisons, together with the comparison of its rigid and adic realizations.
- The linear-tail realization over complete normed rings and quantitative bounds and carrier comparisons for the supplied monic quotient, analytic reduction modulo a monic polynomial, the Hasse-derivative, resolvent and root-projector lemmas at a root, the fixed-rank normalization and carrier adapters for the supplied finite spectral transform, with reciprocal truncation limits, Gauss convergence of entire series, affinoid-valued stages and their duals, the universal-character coefficient action, compactness of contracting operators, Banach cochain complexes with compact homotopy endomorphisms, the fibre and normalization comparisons for the supplied numerical slope decompositions, finite-slope perfect complexes, Fréchet presentations, Stein exhaustions and the torus order on slopes.

It leaves the following to the roadmaps and libraries named, and does not restate them.

- **Bounded measures and their calculus** belong to PadicMeasuresIwasawaAlgebras: the carrier D(X, R) (Mathlib's `AbstractMeasure`), clopen restriction and extension, and the weak and strong topologies (its Layer 0, §0.1–§0.2); the Mahler derivation and the Amice transform of multiplication by x (§2.1), Frobenius φ, its left inverse ψ and their Amice formulas (§2.2), the unique unit-supported division by x (§2.3), the Dirac naturality A(δ_a) = (1 + T)^a (§2.4), the bounded-coefficient inverse Amice transform and the bounded Amice isometry (§2.5), dilation pushforward (§2.11) and restriction to residue classes (§2.12) for bounded measures (its Layer 2); pseudo-measures, the cleared numerator with its cross-multiplication identity, admissible evaluation and the independence of the clearing factor (its §3.1); the pointwise character space W of ℤ_pˣ with its odd-p and p = 2 decompositions, the identification of characters of the principal units with the open unit disc, measures as bounded functions on W, pseudo-measures as functions with at most a simple pole at the trivial character, and the universal character with its extension to G = H × ℤ_p^d (its Layer 3a, §3a.1). Layers 1–3 here extend each of these from bounded measures to distributions; where a target of this roadmap specialises to a bounded measure it must agree with the PadicMeasuresIwasawaAlgebras statement, and that agreement is part of the target.
- **Rigid and adic carriers** belong to AdicSpaces (restricted power series over Tate rings and strong noetherianness in its §0.5; open subspaces and gluing in its §5.1 and §5.3), AdicSpacesPartII (rigid spaces, affinoid sections and the rigid–adic comparison in §R1.1 and §R1.7) and AdicSpacesPartIII (quasi-Stein adic spaces, the density of their restriction maps and Kiehl's Theorems A and B in its §R3.4, targets *quasi-stein-space* and *quasi-stein-theorem-a*; completely continuous maps of Banach modules over an affinoid algebra, `Huber.IsCompletelyContinuous`, with its finite-rank, composition, submodule and closure API in its §R3.6, target *completely-continuous-map*). Layer 3 consumes the compact abelian rigid character spaces of PhiGammaModulesAndIwasawaCohomology §4.0 and compares their Mellin sections with their adic realizations. The generic finite-image approximation predicate and ideal calculus belong to CompactOperators §0.1, which compares them with the lattice-normed predicate; the affinoid lattice model and strict complete continuity belong to AdicSpacesPartIII §R3.6. Diamonds are never required.
- **Compact abelian character geometry and scalar Mellin** belong to PhiGammaModulesAndIwasawaCohomology §4.0: the rigid character space, universal character, finite-component descent, group pullbacks, finite coefficient extension and strong-dual Mellin algebra isomorphism. Its §4.1 supplies the relative analytic Γ rings. Layer 3 identifies these with the distribution carriers of Layer 0 and applies them to boundedness, arithmetic weights and rigid–adic comparison.
- **Banach modules, the analytic stages on ℤ_p and compact operators** belong to PadicFunctionalAnalysis and CompactOperators, the roadmaps of W. Coram: finitely generated Banach modules over Noetherian rings, the coefficient action, universal property, matrices and coordinate truncations of c₀, and orthonormalizable and (Pr) modules (PadicFunctionalAnalysis §1.4, §2.1–§2.2, §2.6); the Banach stages LA_h(ℤ_p, E), Amice's theorem, locally analytic distributions and their Amice transform with its point masses and convolution (its §4.3–§4.4 and §4.7); complete continuity, the Fredholm determinant with its invariance, product and base-change laws, the Fredholm resolvent, Riesz projectors with finite projective root kernels, Coleman's spectral transform with entire functional input and the Riesz–Coleman decomposition (CompactOperators Layers 0–3); generic entire series, evaluation, Hasse calculus, division and monic resultants (RestrictedPowerSeries §§2.1, 2.3 and 7.2). The supplier contracts name each target used and the local restatements of their definitions.
- **Already in the Tau Ceti library** (`a91d3aa`) and used, not restated: `TauCeti.Algebra.eval_charpolyRev_leftMulMatrix` (`RingTheory/Norm/CharpolyRev.lean`) supplies the characteristic-series norm identity for a chosen finite basis; Mathlib's restricted series `PowerSeries.IsRestricted` with Tau Ceti's `TauCeti.PowerSeries.isRestricted_of_abs_le`, `TauCeti.PowerSeries.isRestricted_polynomial` (so "polynomials are entire" is a consequence, not a target of Layer 4), `TauCeti.PowerSeries.polynomialToRestricted`, the Gauss valuation `TauCeti.PowerSeries.gaussValuation` and `TauCeti.PowerSeries.IsDistinguished` on restricted series, `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, and the normed-ring structure `TauCeti.PowerSeries.norm_eq_gaussNorm` on the restricted subring at a radius (`TauCeti/RingTheory/PowerSeries/{Restricted,GaussNorm,TateAlgebra}.lean`); `TauCeti.PowerSeries.IsDistinguished.existsUnique_mul_add_eq` (`RingTheory/PowerSeries/Weierstrass/Division.lean`) supplies division at a single radius under a multiplicative coefficient norm, whereas §4.3 needs an all-radius monic quotient over a possibly nonreduced ring with only a submultiplicative norm; `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv` identifying the Huber restricted series with the Gauss-normed ones; `IsTopologicallyNilpotent.isUnit_one_sub` (`Topology/Algebra/Nonarchimedean/GeometricSeries.lean`); the integer-coefficient evaluation `TauCeti.evalIntSeries` (`Topology/Algebra/InfiniteSum/IntegralCoefficients.lean`), used only for series with integer coefficients; the logarithm has coefficients (−1)^(n+1)/n and requires the open-disc summability and evaluation of §1.2; the completed group algebra `TauCeti.completedGroupAlgebra` and its coordinate `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, consumed through PadicMeasuresIwasawaAlgebras. Tau Ceti's `Analysis/Fredholm/*` (the index theory of `ContinuousLinearMap.IsFredholm`) and `Analysis/Normed/Operator/Compact/RieszTheory.lean` (Riesz theory for Mathlib's `IsCompactOperator`) concern operators between Banach spaces over a field, with hypotheses varying by theorem; some results, including finite-dimensional kernel statements, apply over nonarchimedean fields; the Fredholm theory of Layer 4 is over a Banach algebra A with complete continuity defined by finitely generated A-images, and no comparison with `IsCompactOperator` is asserted anywhere in this roadmap: a target that needs one must state it with its own hypotheses.
- **Reductive-group input** belongs to ReductiveGroups (tori with their character and cocharacter lattices in its Layer 4; Borel subgroups, maximal tori and the root datum in its Layer 7) and to ReductiveGroupsPartII (the valuation homomorphism of the minimal Levi with its bounded kernel, translation lattice and quotient, §RG2.1.2, target *torus-valuation-map*). The slope valuation uses the opposite sign from that translation; its geometric-character comparison and the positive torus monoids are the additional targets of §4.17; no root datum is built here.
- **Not in this roadmap at all**: no p-adic L-function (no Bernoulli, Eisenstein, modular-symbol or Rankin–Selberg arithmetic), no Coleman map or Coleman integration, no eigenvariety or overconvergent cohomology, no (φ, Γ)-modules, no Galois cohomology, no diamonds, and no solid or condensed functional analysis: the finite-window statement of §4.17 is a classical statement about Fréchet presentations and makes no solid-localisation claim.

## Conventions

1. **Fields and algebras.** K is a field complete for a nontrivial nonarchimedean absolute value; in the arithmetic layers K is a finite extension of ℚ_p with v_p(p) = 1, and L ⊆ ℂ_p denotes a closed subfield containing the relevant coefficients. A is a nonzero commutative Noetherian K-Banach algebra with a submultiplicative ultrametric norm satisfying ‖1_A‖=1; A is not assumed to be a field, reduced or affinoid, and the zero algebra is treated as a separate degenerate case. Banach A-modules are complete Hausdorff ultrametric normed K-spaces with a bounded A-action; operator norms of continuous A-linear maps are computed after restriction of scalars to K. The native c₀ norm identities use ‖1_A‖=1. The exact-norm universal property of c₀ additionally requires a contractive A-action, ‖ax‖≤‖a‖‖x‖ (`IsBoundedSMul A M`); mere boundedness does not supply that hypothesis.
2. **Charts and coefficients.** A normalised analytic chart on a residue ball has coordinate `(x − a)/p^h`. The coefficient space of a Banach stage is Mathlib's c₀, `ZeroAtInftyContinuousMap` on a discrete index type I (`C₀(I, A)`), used directly with no alias and no countability assumption; its finitely supported element with value a at i is `c0Single` i a, and `e_i` = `c0Single` i 1; in several variables the coefficients tend to zero along the cofinite filter on the multi-index set. For an operator u on c₀ write `u(e_i) = Σ_j a_{ij} e_j`, so that i is the input index and j the output index (`a_{ij}` is `matrixCoeff u j i` of PadicFunctionalAnalysis §2.6, whose matrices index rows by outputs), and `r_j(u) = sup_i ‖a_{ij}‖` (the output-row norm at j of CompactOperators §0.2); finite coordinate projections `π_S` retain a finite set of output coordinates.
3. **Topologies.** The locally analytic functions carry the inductive-limit topology of the Banach stages. Distributions carry the projective limit of the Banach dual topologies. Over finite K/Q_p, §0.3 compares this with the strong dual topology of the compact-type function space; over general closed L⊆ℂ_p only the projective-limit distribution topology is claimed here. On Z_p the locally analytic topology is strictly finer than the uniform topology (§0.1). On a finite zero-dimensional compact manifold the two topologies agree, including the empty manifold; equality of function carriers alone does not settle the topology. These nonarchimedean locally convex objects are not instances of Mathlib's ordered-field `LocallyConvexSpace`. The dual of a Banach stage has bounded coefficient values and is not asserted to be a c₀ space.
4. **Series.** A series on the open disc satisfies ‖a_n‖R^n → 0 for every 0 < R < 1; an entire series satisfies it for every real R > 0. Both carry the Fréchet topology of all Gauss norms, which governs evaluation and limits; neither is given a single radius-one norm. Mathlib's `PowerSeries` and `MvPowerSeries` are the carriers; restricted series at one radius are Mathlib's `PowerSeries.IsRestricted`, so an open-disc series (`OnOpenDisc`) is one restricted at every radius below one and an entire series (`IsEntire`) one restricted at every positive radius; the Gauss norm at radius R is Mathlib's `PowerSeries.gaussNorm` applied to the coefficient norm, and evaluation at a is the total coefficient sum `entireEval`, a convergent sum only for entire series.
5. **Amice and Mellin normalisations.** The Amice transform of a distribution μ on ℤ_p is Σ_n μ(binom(x, n)) T^n, and Y = 1 + T, so δ_a ↦ Y^a. The transpose derivative is (dμ)(f) = μ(f′), with multiplier log(1 + T); multiplication by x is (1 + T)d/dT. Mellin branches use ω(x)^i⟨x⟩^s with no shift s ↦ 1 − s. At odd p the topological generator of the principal units is 1 + p; at p = 2 the units are {±1} × (1 + 4ℤ_2) with generator 5. Full ℚ_p-analytic Mellin transforms live on the full character space; F-analytic distributions satisfy the closed differential relations of §0.3 and use the F-analytic character subspace.
6. **Operators.** `P_u(T) = det(1 − Tu)` with `c_0 = 1` and `c_n = (−1)^n` times the sum of the principal `n × n` minors. "Finite rank" means image contained in a finitely generated A-submodule (not finite K-dimension, not necessarily free), "completely continuous" means approximable in operator norm by such maps, and neither is identified with Mathlib's `IsCompactOperator`. `Q*(X) = X^{deg Q} Q(1/X)`. Root multiplicity is read from Hasse derivatives, the first nonzero one being a unit. In the Riesz theory, `v = 1 − au`, `z_s = Δ_s F_u(a)`, `c = Δ_h P_u(a)` is a unit, `b = c⁻¹ z_h`, `p = (vb)^h` and `E = 1 − p`; E projects onto `N = ker(v^h)` and p onto its regular complement; at `h = 0`, `E = 0` and `N = 0`.
7. **Entire division.** The entire-division targets state weaker hypotheses than the standing ones: A complete, commutative, normed with ‖1‖ = 1, ultrametric only where stated; the parameter a is arbitrary; the native `PowerSeries`, `IsEntire`, `entireEval` and `Polynomial.divByMonic` are reused; a total `tsum` outside the entire subring is never treated as a convergent evaluation. For monic Q, ρ_Q is entire division followed by `AdjoinRoot`, and Res(Q, F) is `Algebra.norm (ρ_Q F)`; the degree-zero quotient is the zero ring, so Res(1, F) = 1. No domain, reducedness or root-splitting hypothesis is used.
8. **Vector order.** Anisotropic `C^{r_i}` on `ℤ_p^g` means the completed projective tensor product of the one-variable `C^{r_i}` spaces; rectangular coset bounds are separate in each conductor exponent. The literal simultaneous first-difference condition is not used (see the source corrections in the references).
9. **Complexes and slopes.** Banach complexes are Mathlib `CochainComplex`es in `ModuleCat` with complete degree norms, continuous differentials and (Pr) terms, possibly of infinite rank; a compact homotopy class has a degreewise completely continuous representative; its auxiliary characteristic series is the non-alternating product of the degree Fredholm series and depends on the representative, while finite-slope cohomology is the invariant. Slope ≤ h includes equality, both in the finite-summand annihilation and in the complementary polynomial-invertibility test; in det(1 − TU) coordinates, eigenvalues of valuation ≤ h correspond to reciprocal roots of valuation ≥ −h. The two exact-h local-constancy targets in §4.16 require h∈Q; broader real parameters in numerical fibre decompositions do not extend those targets.
10. **Families.** Analytic c₀ stages commute with completed projective coefficient tensors; their infinite Banach duals have only a canonical scalar-extension map, and no unqualified isomorphism or automatic (Pr) property is asserted for them. For an affinoid A with a chosen Banach model, the norm unit ball is the integral lattice; it is not identified with the power-bounded elements of a non-reduced affinoid without proof.
11. **Roots of unity.** A formula summing over `μ_{p^n}` (the clopen-restriction formula of §1.1 and §1.4, the finite Fourier inversions of §2.2) is stated after extending the coefficient field to contain `μ_{p^n}`; the result descends to the original field because the left-hand side is defined there.
12. **Generality of the Lean signatures.** Each statement records its norm, scalar-action and ultrametric hypotheses explicitly. Algebraic matrix identities may be stated over a commutative ring, and elementary series identities over a complete normed ring, when their target says so. The component and branch Mellin targets of §3.1–§3.2 use a complete ultrametric field with a bounded ℤ_p-algebra structure; they do not use inversion of p. Arithmetic formulas with p⁻ⁿ, logarithms and roots of unity require the characteristic-zero coefficient fields specified at those targets. An abstract continuous transpose on fixed normed spaces does not by itself provide the global locally analytic map or its strong-topology comparison.
13. **Witnesses for the conventions.** Each normalisation is pinned by one computed instance. Amice: `δ_a ↦ (1 + T)^a`, so `x·δ_1 = δ_1 ↦ 1 + T = (1 + T)·d/dT(1 + T)`, which fixes `∂ = (1 + T)d/dT` rather than `d/dT` (whose value would be 1). Transpose derivative: for `μ = dδ_a` (`f ↦ f′(a)`) the coefficients `μ(binom(x, n))` are 1 for `n = 1` and `a − 1/2` for `n = 2`, which are the first two coefficients of `log(1 + T)·(1 + T)^a = T + (a − 1/2)T² + …`; the opposite sign convention `(dμ)(f) = −μ(f′)` would give `−log(1 + T)`. Clopen restriction: for `δ_a` and the class `b + pℤ_p` the formula `p⁻¹Σ_{η ∈ μ_p} η^{−b}(1 + T)^a η^a` equals `(1 + T)^a` when `a ≡ b` and 0 otherwise. Fredholm series: for `u = a·id` on A, `P_u = 1 − aT`, so `c_1 = −tr u` and the zero operator has `P = 1`; the `2 × 2` nilpotent Jordan block also has `P = 1`. Riesz: for `u = id` on A, `a = 1` and `h = 1`, `c = Δ_1 P_u(1) = −1` is a unit, `v = 0`, `N = A` and `E = 1`. Slope endpoint: for `u = a·id` with `v_p(a) = h` the eigenvalue a lies in the `≤ h` summand, and its reciprocal root `a⁻¹` has valuation `−h ≥ −h`. Reciprocal polynomial: `(X − a)* = 1 − aX`. Resultant: `Res(1, F) = 1` and `Res(X − a, F) = F(a)` with no sign. Hasse derivative (`hasse_characteristic_two`): `Δ_2(T²) = 1` in every characteristic, while the second ordinary derivative of `T²` is 0 in characteristic 2. Mellin: for `δ_u` on `ℤ_pˣ` with `u = γ^m` in the principal-unit component, the component series is `(1 + T)^m`, its value at the trivial character (`t = 0`) is 1, the total mass, and at `p = 2` the two components are indexed by `ω(x) = ±1` with `⟨−1⟩ = 1`. Clearing: the expression `F(t)/(κ_t(a) − 1)` is defined only where `κ_t(a) ≠ 1`, which excludes the trivial character; a pole-order bound additionally requires a denominator that is not identically zero, and is bounded by its vanishing multiplicity; no value is asserted at a zero denominator.
14. **Names.** All new declarations live under `TauCeti.`; the namespaces named in each layer are proposals. Names follow Mathlib's conventions (`foo_bar` for theorems, `fooBar` for data, `IsFoo` for predicates).


## Exact supplier contracts

Each library declaration is used with its statement at the pinned commit. Each roadmap dependency is the named supplier target with the mathematical contract specified below.

### From Mathlib

At `6b7abb3`. `AbstractMeasure` with `AbstractMeasure.amiceTransform`, `AbstractMeasure.coeff_amiceTransform`, `AbstractMeasure.injective_amiceTransform`, `AbstractMeasure.amiceTransformEquiv`, `AbstractMeasure.dirac` and `AbstractMeasure.toCLMEquiv` (the bounded transform of integral measures and the operator norm of a measure); `mahler`, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`, `PadicInt.norm_mahler_eq` and `PadicInt.addChar_of_value_at_one` (the Mahler basis as an isometry C(ℤ_p, E) ≃ c₀(ℕ, E), and the additive character with prescribed value at one); `ZeroAtInftyContinuousMap` (`C₀(I, A)`) with `ZeroAtInftyContinuousMap.ext`, its completeness and supremum norm (`ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `BoundedContinuousFunction.norm_le`); Mathlib has no bounded or continuous `A`-action instance on `C₀(I, A)` for a normed ring `A`, and PadicFunctionalAnalysis §2.1 supplies it; `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean` (unconditional sums over arbitrary index sets); `FormalMultilinearSeries.ofScalars` and `FormalMultilinearSeries.ofScalarsSum`; `PowerSeries` with `coeff`, `trunc`, `map`, `derivative`, `subst`, `invOfUnit`, `PowerSeries.IsRestricted`, `PowerSeries.HasGaussNorm`, `PowerSeries.gaussNorm`, `PowerSeries.gaussNorm_eq` and `PowerSeries.gaussNorm_add_le_max`; the polynomial inclusion `Polynomial.coeToPowerSeries.ringHom`; `Polynomial` with `hasseDeriv`, `divByMonic`, `modByMonic`, `reverse`, `reflect`, `ofFn`, `sylvester` and `resultant`; `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Matrix.adjugate`, `Matrix.IsUpperTriangular`; `AdjoinRoot` with `Algebra.norm`; `IsCompactOperator`; `ModuleCat`, `CochainComplex`, `Homotopy`; `LocallyConstant`; `ContinuousLinearMap` with `restrictScalars`; `Topology.IsStrictMap`. `LaurentSeries.hasseDeriv` exists on Hahn series; the Hasse derivative of §4.5 is defined on `PowerSeries` directly, and no comparison with the Hahn-series one is asserted.

### From Tau Ceti

At `a91d3aa`. `TauCeti.PowerSeries.isRestricted_of_abs_le`, `TauCeti.PowerSeries.isRestricted_polynomial`, `TauCeti.PowerSeries.polynomialToRestricted`, `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`, `TauCeti.PowerSeries.gaussValuation`, `TauCeti.PowerSeries.IsDistinguished`, `TauCeti.PowerSeries.norm_eq_gaussNorm`, `TauCeti.PowerSeries.norm_le_iff` (restricted series, Gauss norm and Tate algebra); `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv`; `IsTopologicallyNilpotent.isUnit_one_sub`; `TauCeti.evalIntSeries` with `TauCeti.norm_evalIntSeries_le_one`; `AdjoinRoot.norm_mk_eq_resultant`, `Polynomial.Monic.resultant_of_le` (`TauCeti/RingTheory/Polynomial/Resultant/`); `TauCeti.Algebra.eval_charpolyRev_leftMulMatrix`; `TauCeti.completedGroupAlgebra` and `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`.

### Supplier replacements

The following notions are the library's and are used directly, with no restatement here: the analytic coefficient stage `C₀(S × ℕ^d, K)` and its affinoid-valued version `C₀(I, A)` are Mathlib's `ZeroAtInftyContinuousMap`, with coefficientwise equality `ZeroAtInftyContinuousMap.ext` and the coefficientwise norm bound from `ZeroAtInftyContinuousMap.norm_toBCF_eq_norm` and `BoundedContinuousFunction.norm_le`; a stage distribution is a Mathlib continuous linear map `C₀(I, A) →L[A] A`, whose `A`-linearity is `map_smul`; the Gauss norm of a power series at radius R is Mathlib's `PowerSeries.gaussNorm` (applied to the coefficient norm), not a separately defined supremum; entireness is Mathlib's `PowerSeries.IsRestricted` at every positive radius; the inclusion of polynomials in power series is Mathlib's coercion `Polynomial.coeToPowerSeries`; the transpose of a continuous linear map on fixed normed spaces is Mathlib's composition `ContinuousLinearMap.comp`, which is not the locally analytic pushforward, multiplication or coefficient action of §1.3 and §4.15 (those are targets here).

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Layer 0: bounded measures `D(X, L) = C⁰(X, L)′` on `ℤ_p` and `ℤ_pˣ` with their norm, clopen restriction and extension (§0.1), and the weak and strong topologies (§0.2). Layer 2: the Amice transform of multiplication by x (§2.1), Frobenius on bounded measures, the left inverse ψ of Frobenius and their Amice formulas (§2.2), the unique unit-supported division by x (§2.3), the Dirac naturality `A(δ_a) = (1 + T)^a` (§2.4), the bounded-coefficient inverse Amice transform and the bounded Amice isometry (§2.5), dilation pushforward (§2.11) and restriction to a residue class (§2.12). Layer 3: pseudo-measures λ with `([g] − 1)λ` a measure, the cleared numerator with its cross-multiplication identity, admissible evaluation after clearing a denominator whose character value is a unit, and the independence of the clearing factor (§3.1). Layer 3a (§3a.1): the character space `W(A) = Hom_cts(ℤ_pˣ, Aˣ)` with its torsion/principal decomposition at odd p and at `p = 2` (Continuous characters of the units), the identification of characters of the principal units with the open disc (Characters of the principal units and the open unit disc), measures as bounded functions on W with `μ ↦ F_μ` injective (Measures as bounded functions on the character space), pseudo-measures as functions with at most a simple pole at the trivial character, and the universal character with its extension to `G = H × ℤ_p^d` (The universal character and the generic fibre). The analytic chart `H : G ≅ Δ × ℤ_p^d` of a compact abelian group with an open `ℤ_p^d` subgroup is a datum of the Layer 3 statements here (for `G = ℤ_pˣ` it is the decomposition of §3a.1), and the component points `κ_{ν,t}(g) = ν(H_Δ g)(1 + t)^{H_ℤ g}` are defined in §3.1 here.

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

§4.0, *Compact character spaces and scalar Mellin coordinates*, supplies `compactCharacterSpace`, its universal character, generator changes and finite coefficient extension, and the exported `rigidCharacterSpace` with its component, section, universal, pullback and base-change API. It also supplies the strong-dual carrier `abelianAnalyticDistributions`, the topological algebra isomorphism `scalarAbelianMellin`, and its exported moment form `distributionMellin` with coefficients and extensionality. The one-variable stages and algebraic Amice map in this construction come from PadicFunctionalAnalysis §§4.3–4.4 and 4.7. For finite `K/ℚ_p`, §3.3 identifies this carrier with `D(G,K)` by `i_G(μ)(f)=μ(f)` and uses `rigidCharacterSpace(G,K)=(compactCharacterSpace G)_K`; in these identifications `distributionMellin(μ)=scalarAbelianMellin(i_G(μ))`. The identification includes the strong/projective-limit topology and every finite-character component. §4.1, *Relative analytic Γ rings*, supplies `analyticGammaRing` and `relativeMellin` for affinoid Γ coefficients; the finite coefficient-extension comparison in §3.3 uses the scalar §4.0 interface.

### From TauCetiRoadmap.AdicSpacesPartIII

§R3.6, target *completely-continuous-map*: the predicate `Huber.IsCompletelyContinuous` for continuous linear maps between Banach modules over an affinoid algebra, with its finite-rank, composition, submodule and closure API. Layer 4 uses the approximation predicate of CompactOperators §0.1 (§4.1 here), which agrees with it on affinoid algebras with a chosen Banach model by CompactOperators §0.1, **Banach modules normed by a lattice**; the lattice and strict variants belong to this supplier. §R3.4, targets *quasi-stein-space* and *quasi-stein-theorem-a* and Kiehl's Theorem B: quasi-Stein adic spaces, the density of their restriction maps and Theorems A and B, used by §4.17 for Stein exhaustions.

### From TauCetiRoadmap.AdicSpacesPartII

§R1.1, target *rigid-analytic-space*, supplies rigid spaces, admissible opens, affinoid charts and their structure sheaves and section algebras. §R1.7, targets *rigid-adic-comparison-functor* and *rigid-adic-quasi-separated-equivalence*, supplies the comparison for quasi-separated rigid spaces and its identification of affinoid sections. §3.3 uses the character spaces supplied by PhiGammaModulesAndIwasawaCohomology §4.0 on these carriers; §3.4 transports their Mellin sections.

### From TauCetiRoadmap.AdicSpacesPartIV and TauCetiRoadmap.CrystallineCohomology

| Target here | Supplied by | Named supplier targets |
|---|---|---|
| §0.CR.6.6 Hyodo–Kato cohomology of Stein curves | AdicSpacesPartIV F1.5, F1.7 and F1.11 | The Monsky–Washnitzer weak completion; Dagger spaces; Finiteness of de Rham cohomology of tubes in a quasi-compact strictly semistable formal scheme |
| §0.CR.6.6 Hyodo–Kato cohomology of Stein curves | CrystallineCohomology §CR.6.5 | Log rigid Hyodo–Kato cohomology; Proper log rigid and crystalline Hyodo–Kato cohomology |
| §0.CR.6.6 Nonproper finite-piece Hyodo–Kato comparison, proper compatibility | CrystallineCohomology §§CR.6.2 and CR.6.5 | Uniformizer-dependent Hyodo–Kato maps (proper models); Proper log rigid and crystalline Hyodo–Kato cohomology |

CrystallineCohomology §§CR.6.1–CR.6.5 own the log crystalline and log rigid Hyodo–Kato complexes,
Frobenius, monodromy and the proper uniformizer-dependent maps. The nonproper finite-piece
dagger comparison, the Stein limits, their completed comparison and the ind-Fréchet curve towers
belong to §0.CR.6.6 here.

### From TauCetiRoadmap.AdicSpaces and TauCetiRoadmap.ReductiveGroups

AdicSpaces §0.5 supplies restricted series over Tate rings and strong noetherianness, and §5.1 and §5.3 open subspaces and gluing, for §3.3–§3.4. ReductiveGroups Layer 4 supplies tori with their character and cocharacter lattices and their pairing, and Layer 7 Borel subgroups, maximal tori and the root datum with its positive roots, for §4.17.

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.1.2, target *torus-valuation-map* (The valuation homomorphism of the minimal Levi): `torusValuationMap` on the minimal Levi Z, normalized by ⟨χ, v(z)⟩ = −ω(χ(z)) on rational characters; its kernel `boundedPart`, the maximal bounded subgroup, with `boundedPart_isCompact` over local fields; and `translationLattice`, the full image lattice with Z(K)/`boundedPart` ≃ Λ. For a quasi-split Borel the minimal Levi is T itself. §4.17 consumes these kernel, lattice and quotient results, constructs the positive normalized adapter on geometric characters, and proves the positive-monoid spanning comparison; it does not restate the imported kernel or lattice theorems (Bruhat–Tits II §§4.2.5–4.2.7, pp. 90–91).

### From the student roadmaps

PadicFunctionalAnalysis §4.7 supplies the algebraic Amice bijection and the quantitative stage norms. For moments b_n=μ(binom(x,n)),

D_h(μ)=sup_n |b_n|·|⌊n/p^h⌋!|.

A compatible moment family defines a distribution exactly when D_h is finite for every h. With u_h=1/((p−1)p^h) and S_h the Gauss norm at p^(−u_h), its estimates are S_h≤D_h≤p S_(h+1). The normalized function basis e_(n,h)=⌊n/p^h⌋!·binom(x,n) is supplied by §4.4. This roadmap equips the supplied algebraic carrier with the projective-limit topology and deduces the Fréchet Amice equivalence from those inequalities. Source: Colmez, Théorème I.4.7, p. 15, and Théorème II.2.2, p. 30.

The controls in §0.1 and §1.1 include δ_(−1), with D_h=1 for every h, and b_n=1/n!, with D_0=1 but unbounded D_1. PadicFunctionalAnalysis §4.6 supplies the strict character-level criterion. For x↦(1+√p)^x the least level is 0 for p≥5, 1 for p=3, and 2 for p=2. At p=3, ‖√3‖=3^(−1/2) is the excluded level-zero boundary; at p=2 the character fails at level 1. This roadmap's §4.15 supplies the uniform affinoid-radius comparison. Source: Colmez, Théorème I.4.7 and Corollaire I.4.8, p. 15; Legendre's formula supplies the boundary computation.

[PadicFunctionalAnalysis](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PadicFunctionalAnalysis/README.md),
[CompactOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/CompactOperators/README.md),
[RestrictedPowerSeries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RestrictedPowerSeries/README.md)
and [RigidAnalyticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RigidAnalyticGeometry/README.md)
are the supplier roadmaps of W. Coram. Supplier references below use their section headings; a descriptive label identifies the corresponding paragraph within that section. PadicFunctionalAnalysis §0.4 gives the Banach–Tate structure of the algebra A in Convention 1. Its §2.6 uses output-first matrices, so a_ij here is its matrix coefficient with indices j,i. CompactOperators §0.2 names uniform output-row decay `IsRowCompact`; this is distinct from its field-facing compactoid-image predicate in §0.5. Over the Noetherian A of Convention 1, PadicFunctionalAnalysis §2.6 supplies closed finite submodules and bounded lifting, and CompactOperators §0.2 identifies row compactness with complete continuity. On a (Pr) module one uses its retract extension as in CompactOperators §§0.4 and 1.5. The bounded-equivalent contractive norm of §4.1 transports topological imports; exact norm formulas retain their displayed norm hypotheses.

RestrictedPowerSeries §§1.1, 2.1, 2.3 and 7.2 own generic Gauss completeness, entire evaluation, Hasse calculus, division and monic entire resultants. CompactOperators §2.4 supplies the resolvent and §§3.1–3.4 the projectors and spectral applications. RigidAnalyticGeometry §§2.1–2.2 supply the supremum/spectral comparison and §7.2 the numerical module-slope interface.

| Target here | Supplied by | Named interface where specified |
|---|---|---|
| §0.1 Locally analytic functions of fixed radius | PadicFunctionalAnalysis §4.3 | `LA_h`, its evaluation and stage transitions |
| §0.1 Amice's theorem on Mahler coefficients | PadicFunctionalAnalysis §4.4 | the Amice coefficient isometry and its Mahler comparison |
| §0.1 Locally analytic distributions | PadicFunctionalAnalysis §4.7, including its measure comparison | — |
| §1.1 The Amice transform of distributions | PadicFunctionalAnalysis §4.7 | `amiceDualNorm`, `amiceDiscNorm`, `amiceDiscNorm_le_amiceDualNorm`, `amiceDualNorm_le_amiceDiscNorm` |
| §1.4 Amice transform of a point mass | PadicFunctionalAnalysis §4.7 | — |
| §1.4 Unbounded Amice convolution identity | PadicFunctionalAnalysis §4.7 | — |
| §4.1 Complete continuity in the Banach algebra convention | CompactOperators §0.1 and **Finite image and approximation** | `IsFiniteRank`, `IsCompletelyContinuous`, `IsFiniteRank.isCompletelyContinuous` |
| §4.1 Finite coordinate truncation | PadicFunctionalAnalysis §2.6, with the coordinate vectors `single` of its §2.1 | `single` |
| §4.1 Bounded-family extension from c0, exact norm for contractive action | PadicFunctionalAnalysis §2.1 | `IsBoundedSMul` hypothesis |
| §4.1 Operator bound from the coordinate vectors | PadicFunctionalAnalysis §2.6 | output-first matrix coefficients |
| §4.1 Orthonormalizable and potentially orthonormalizable modules | PadicFunctionalAnalysis §2.2 | `IsONable`, `IsPotentiallyONable` |
| §4.1 Canonical topology on finite Banach modules | PadicFunctionalAnalysis §1.4 | — |
| §4.1 Finite coordinate topology on a finite submodule | PadicFunctionalAnalysis §2.6 | `exists_finset_norm_le` |
| §4.1 Uniform coordinate truncation on finite submodules | PadicFunctionalAnalysis §2.6 | — |
| §4.1 Completely continuous matrix criterion | CompactOperators §0.2 | `IsRowCompact`, `IsRowCompact.isCompletelyContinuous` |
| §4.1 Finite ambient image versus finitely generated range | CompactOperators §0.1, **Finite image and approximation** | `isFiniteRank_iff_range_fg` |
| §4.1 Bounded coefficient action on c0 | PadicFunctionalAnalysis §2.1 | — |
| §4.1 Finite coordinates detect a finite submodule | PadicFunctionalAnalysis §2.6 | — |
| §4.1 Complete continuity of the identity detects finite generation | CompactOperators §0.1 | — |
| §4.2 Fredholm determinant in an orthonormal chart | CompactOperators §1.2 | `minor`, `charCoeff`, `charPowerSeries` |
| §4.2 Entire power series over A | RestrictedPowerSeries §§2.1 and 7.2 | `IsEntire`, `eval₂` with the identity coefficient map |
| §4.2 Uniform entire tail bound from column majorants | CompactOperators §1.2 and §1.3, and **Uniform tails under a common majorant** | `norm_charCoeff_mul_pow_le_of_rowNorm_le` |
| §4.2 Continuity in each determinant degree | CompactOperators §1.3 | — |
| §4.2 Gauss convergence under a common column majorant | CompactOperators §1.3 | — |
| §4.2 Determinant of a finite-coordinate operator | CompactOperators §1.2 | — |
| §4.2 Independence of chart and equivalent norm | CompactOperators §1.5 and §1.7 | — |
| §4.2 Cyclic Fredholm determinant identity | CompactOperators §1.4 | — |
| §4.2 Completed scalar extension of ON modules and determinants, pure tensor comparison | AdicSpacesPartII §R0.5, *completed-tensor-banach-module*; CompactOperators §1.7, **Pure tensor comparison** | `c0_completedBaseChange` |
| §4.2 Completed scalar extension of ON modules and determinants, coefficientwise determinant identity and transport to retracts | CompactOperators §1.7, **Coefficientwise Fredholm base change** and **Abstract module transport** | `charPowerSeries_map` |
| §4.2 Property (Pr) | PadicFunctionalAnalysis §2.2 | — |
| §4.2 Continuous lifting characterization of (Pr) | PadicFunctionalAnalysis §2.2 | — |
| §4.2 Finite (Pr) modules are algebraically projective | PadicFunctionalAnalysis §2.2 | — |
| §4.2 Fredholm determinant on a (Pr) module | CompactOperators §1.5 | — |
| §4.2 Fredholm determinant of a direct sum | CompactOperators §1.6 | — |
| §4.2 Evaluated Fredholm product identity on c0 | CompactOperators §2.4 | `fredholmDet` |
| §4.2 Evaluated Fredholm product identity for (Pr) | CompactOperators §2.4 | — |
| §4.2 Determinant bound by distinct output columns | CompactOperators §1.1 | — |
| §4.2 Cofinite decay of fixed-degree principal minors | CompactOperators §1.2 | `minor` |
| §4.3 Division identity with evaluation as remainder | RestrictedPowerSeries §7.2 (explicit monic division and linear evaluation) | — |
| §4.3 Roots and linear factors in the entire-series ring | RestrictedPowerSeries §7.2 (linear division and evaluation) | — |
| §4.3 Reciprocal-tail quotient by a monic polynomial | RestrictedPowerSeries §7.2, **Explicit monic division** | — |
| §4.3 Division of entire series by a monic polynomial | RestrictedPowerSeries §7.2, **Explicit monic division** | — |
| §4.4 Resultant of a monic polynomial and an entire series | RestrictedPowerSeries §7.2, **Monic entire resultant** | `entireResultant` |
| §4.4 Entire resultant agrees with the native polynomial resultant | RestrictedPowerSeries §7.2, **Monic entire resultant** | — |
| §4.4 Bounded polynomial coefficient in the resultant Bezout identity | RestrictedPowerSeries §7.2, **Monic entire resultant** | — |
| §4.4 Resultant detects analytic coprimality | RestrictedPowerSeries §7.2, **Monic entire resultant** | — |
| §4.5 Fredholm resolvent series | CompactOperators §2.4 | — |
| §4.5 Hasse derivatives of formal power series | RestrictedPowerSeries §2.3 (semiring Hasse calculus) | — |
| §4.6 Adjugate bound for the Fredholm resolvent | CompactOperators §2.4 | — |
| §4.6 Entireness of the recurrence on a projective Banach module | CompactOperators §2.4 | — |
| §4.7 Analytic Fredholm resolvent | CompactOperators §2.4 | — |
| §4.7 Evaluated Hasse derivatives of the resolvent | CompactOperators §2.4 | — |
| §4.7 Roots of an entire series with unit constant are units | RestrictedPowerSeries §7.2 (normalized-root unit criterion) | the `isUnit_of_evalAt_eq_zero` method of `IsEntire` |
| §4.7 Explicit Hasse Riesz projector | CompactOperators §3.1 (the good-zero projector) | — |
| §4.7 Topological Riesz decomposition | CompactOperators §3.1 | — |
| §4.7 Stability under commuting operators | CompactOperators §3.5 | — |
| §4.9 The finite polynomial spectral transform | CompactOperators §3.3 and **Prescribed finite rank** | `colemanD`, `colemanDBounded`, `colemanD_eq_colemanDBounded` |
| §4.9 Independence of the auxiliary degree bound | CompactOperators §3.3, **Prescribed finite rank** | `colemanDBounded_of_natDegree_le` |
| §4.9 The exact zero-root padding factor | CompactOperators §3.3, **Prescribed finite rank** | `colemanDBounded_succ` |
| §4.9 Stability when the operator series vanishes at zero | CompactOperators §3.3, **Prescribed finite rank** | `colemanDBounded_add_of_coeff_zero` |
| §4.10 Similarity invariance of the characteristic series | CompactOperators §1.1 and §1.4, with its §1.1 | — |
| §4.10 Finite characteristic spectral mapping | CompactOperators §1.1 and §3.3 | — |
| §4.11 The normalized scalar limit in Coleman A3.8 | CompactOperators §3.3 | `colemanDSeries` |
| §4.12 Entire truncations converge at every radius | RestrictedPowerSeries §§1.1 and 7.2 | — |
| §4.12 Unique entire limit of Gauss-Cauchy sequences | RestrictedPowerSeries §§1.1 and 7.2 | — |
| §4.12 Uniform evaluation of a Gauss limit, evaluation bound | RestrictedPowerSeries §2.1 | `eval₂` with the identity coefficient map |
| §4.13 Newton majorants without eigenvalues | CompactOperators §3.3, **Majorants** | `colemanMajorant`, `exists_newtonMajorant`, `tendsto_colemanMajorant`, `norm_coeff_colemanDBounded_le` |
| §4.13 Full entire spectral transform | CompactOperators §3.3, **Convergence and topology** | `colemanDEntire`, `tendsto_gaussNorm_colemanDBounded`, `colemanDEntire_isEntire`, `colemanDEntire_coe`, `colemanDEntire_mul` |
| §4.13 Entire operator evaluation | CompactOperators §3.3, **Operator evaluation and spectral mapping** | `exists_tendsto_opNorm_sum_pow`, `IsRowCompact.of_tendsto_opNorm_sum_pow` |
| §4.13 Infinite Coleman spectral mapping | CompactOperators §3.3 and **Operator evaluation and spectral mapping** | `charPowerSeries_eq_colemanDEntire` |
| §4.14 Polynomial Fredholm invertibility criterion | CompactOperators §3.4 (distinct coprimality criterion) | — |
| §4.14 Riesz projectors at a Fredholm root | CompactOperators §3.1 | `IsRieszProjection`, `exists_rieszProjection` |
| §4.14 Finite projective slope summands | CompactOperators §3.4 | `IsRieszColemanProjection`, `exists_rieszColemanProjection` |
| §4.15 Complete continuity from analytic contraction | CompactOperators §0.3, with the row-decay criteria of its §0.2 | — |
| §4.16 Numerical h-slope decomposition and projection | RigidAnalyticGeometry §7.2, with the local fibre and normalization comparisons | `IsSlopeLE`, `IsSlopeDecomposition`, `IsSlopeDecomposition.exists_projection` |

The Stein exhaustion targets of §0.CR.6.6 apply `naProjectiveLimit_cohomology_finiteDimensionalML` (§0.2). They require a common finite degree window, closed differential images, degreewise strict Roos surjectivity and finite-dimensional Mittag–Leffler cohomology; limit carriers and three-space results alone do not imply this comparison.

### Canonical supplier interfaces

| Canonical supplier result | Local adapter | Further local target |
|---|---|---|
| RestrictedPowerSeries §7.2, explicit unique monic division | `entireMonicQuotient`, the monic-quotient coefficient formula, compatibility with native polynomial division, compatibility with the linear tail quotient | §4.3 weighted quotient bound; §4.4 analytic reduction into native `AdjoinRoot` |
| CompactOperators §1.1, Res(charpoly M,g)=det(g(M)) | §4.10 fixed-rank reflection and the fixed-rank resultant comparison for matrices, using `Polynomial.Monic.resultant_of_le` | §4.11 reciprocal truncation limits; §4.13 Gauss estimates |
| RigidAnalyticGeometry §7.2, `IsSlopeDecomposition.exists_projection` | §4.16 classical/geometric fibre comparison and r=|p|^h normalization | §4.16 local windows, finite-slope complexes and exact-slope Euler characteristics |

### Definitions for the headline statements

The four definitions in [Suggested.lean](Suggested.lean) use native Mathlib carriers and have real bodies. `IsEntire` is restrictedness at every positive radius, and `polynomialSpectralResultant` is the bounded polynomial resultant at a prescribed rank, matching RestrictedPowerSeries §7.2 and CompactOperators §3.3. `entireMonicQuotient` is the reciprocal-tail formula of RestrictedPowerSeries §7.2, and `entirePolynomialSpectral` reduces the functional input by that quotient before taking the fixed-rank resultant (§4.13). These formulas make the spectral convergence statements statable without a Fredholm determinant. Implementations import the supplier APIs and retain one owner for each object.

## How to read the build

Layer 0 builds the function spaces and the functional-analytic tools, with their Hyodo–Kato applications to Stein curves and towers in §0.CR.6.6; Layer 1 the Amice transform and the operator toolbox on ℤ_p; Layer 2 admissibility and uniqueness in one and several variables; Layer 3 the Mellin transform and character spaces; Layer 4 the operator theory of families and the finite-slope complexes. Each layer is divided into numbered subsections; a subsection opens with the hypotheses that all its targets share, then states its targets in dependency order as bold-titled paragraphs. A paragraph gives the statement, any further hypotheses, the API of a definition or construction as a list of named lemmas, the source with its locator, and *Needs*, the earlier targets (by subsection number and title, or by a declaration name specified in this document), library declarations and supplier targets it rests on. The checks of a definition or construction are the `**Checks.**` bullets under it, one per unit test. They are mathematical tests of the specified constructions. Each layer ends with worked examples and its dependencies. Nothing is optional.

## Layer 0: analytic Banach stages, locally analytic functions and their strong duals

This layer builds the function spaces. Analytic functions on a closed disc with their Gauss valuation are the local building blocks; functions analytic on every residue ball of a fixed radius form the Banach stages `LA_h`, whose union is the space of locally analytic functions with its compact-type inductive-limit topology; the projective-limit dual is the space of locally analytic distributions, with bounded measures inside it. Over finite coefficient extensions these duals have the strong topology. The layer then records the strict-sequence and three-space results that are used to pass between Banach, Fréchet and compact-type spaces, and the chart-based construction on finite products of polydiscs and compact p-adic manifolds, with the completed tensor and strong-duality statements that the later layers use. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` (one variable) and `TauCeti/NumberTheory/Padics/AnalyticDistributions` (charts and polydiscs).

### 0.0 Nonarchimedean topology, exact categories and completed tensors

Here K is a complete nontrivially valued ultrametric field. The categorical lattice constructions work under these hypotheses; compact-type regularity and strong duality below are restricted to finite K/Q_p. Write O_K={a:|a|≤1}. The constructions allow arbitrary index sets, not just sequences. This subsection supplies the topology before the analytic spaces use it. Sources: Schneider, *Nonarchimedean Functional Analysis*, author notes §4, Propositions 4.3–4.4, pp. 17–18, and §5, pp. 21–30, §17, pp. 109–114; Colmez–Dospinescu–Nizioł, *Cohomology of p-adic Stein spaces*, arXiv:1801.06686v2, §2.1.1–§2.1.3, pp. 7–10. The categorical distinctions below are derived using the lattice constructions in those passages.

**Locally convex spaces and separation** (construction). `NACvx K` has topological K-vector spaces (jointly continuous addition and scalar multiplication) with a zero-neighbourhood basis of open O_K-submodules, and continuous K-linear maps. Equivalently its topology is defined by a family of ultrametric K-seminorms; no ordered-field `LocallyConvexSpace` instance is used. `HANACvx K` is the full subcategory of Hausdorff objects. `separate E` is E divided by the intersection of its zero-neighbourhoods, with quotient topology, and is left adjoint to the inclusion of the Hausdorff category. Kernels in either category have the subspace topology. In NACvx the cokernel of f is the algebraic quotient F/f(E); in HANACvx it is F/closure(f(E)). The latter distinction is necessary even for dense Banach injections. API: `naLocallyConvex_iff_seminorms`, `naKernel`, `naCokernel`, `haCokernel`, `separate_lift` (factorization of every continuous map to a Hausdorff object), `separate_idempotent` and `separate_eq_self_iff`. Build with native modules, submodules and quotient topologies.

**Checks.**

- `naTopology_line`: On K the balls |x|<r form open O_K-lattices and define the given norm topology. The zero space is Hausdorff.
- `naTopology_product`: On K^N the product topology is generated by finitely many coordinate bounds. The vectors e_n tend to zero there; their sup norms remain one. A single sup-norm topology would fail this check.
- `naCokernel_dense`: The inclusion of finitely supported sequences into c₀(N,K), with the inherited norm, has a nonzero algebraic quotient whose separated quotient is zero. Taking an algebraic quotient and declaring it Hausdorff gives the wrong cokernel.

**Locally convex limits** (construction). `naInductiveLimit E` is the algebraic direct limit with the finest locally convex topology making all structure maps continuous. Its open lattices are precisely those with open inverse image at every stage. `naProjectiveLimit E` is the compatible submodule of the product with the initial topology for its projections. Apply `separate` if a Hausdorff colimit is required. For countable Banach systems with injective compact transitions over finite K/Q_p, the inductive limit is Hausdorff, complete and regular: every bounded subset is contained and bounded in one stage. This is the compact-type theorem, not a property of every inductive system. API: `naInductiveLimit_lift`, `naInductiveLimit_continuous_iff` for linear maps out, `naProjectiveLimit_lift`, `naProjectiveLimit_topology`, `compactType_bounded_stage`, `compactType_complete`. Sources for the last two: Schneider–Teitelbaum, arXiv:math/9912073v1, §1, Theorem 1.1, pp. 3–4; Schneider notes §16, pp. 103–108.

**Checks.**

- `naLimit_constant`: Constant identity systems on K have both limits K with its norm topology; the constant zero system has zero limit.
- `naLimit_product`: The inverse limit of K^n under coordinate deletion is K^N with product topology, not c₀ or the bounded-sequence space. The family (1,1,...) is in this limit.
- `naLimit_radius`: For analytic stages on Z_p, p^n binom(x,p^(2n)) tends to zero uniformly, but lies in no bounded set of one fixed analytic stage. By regularity it cannot converge in LA. This distinguishes the locally convex inductive topology from the uniform topology.

**Strict maps and the quasi-abelian categories** (construction). In NACvx a morphism is strict when the quotient topology on E/ker f agrees with the subspace topology on f(E); equivalently it is relatively open onto its image. In HANACvx strictness additionally requires f(E) closed, because its categorical image is closure(f(E)). Use the native topological `IsStrictMap` for the quotient-to-image comparison and record the closed-image condition separately. Both categories are quasi-abelian by the following lattice calculation: pullbacks of strict quotient epimorphisms remain quotient epimorphisms, and pushouts of strict embeddings remain strict embeddings (closed embeddings in the Hausdorff category). Construct the pullback as a subspace of a product, and the pushout as (F⊕G)/{(f(e),−g(e))}; given an open lattice L_G in G, choose an open lattice L_F in F with f^(−1)(L_F)⊂g^(−1)(L_G), using the induced topology on the embedded E. The image of L_F⊕L_G in the pushout intersects G in L_G, proving its induced topology. In the Hausdorff case the relation graph and the preimage of G are closed, proving that the embedding remains closed. These stability lemmas, together with the kernel/cokernel constructions, supply the quasi-abelian structure. API: `naStrict_iff_relativelyOpen`, `haStrict_iff_closed_and_naStrict`, `naStrict_pullback`, `naStrict_pushout`, `haStrict_pullback`, `haStrict_pushout`, `naQuasiAbelian`, `haQuasiAbelian`. A Hausdorff strictly exact sequence therefore has a closed kernel embedding and a surjective quotient map. No normed open-mapping theorem constructs the categories.

**Checks.**

- `strict_split_line`: K→K², x↦(x,0), followed by (x,y)↦y is strictly exact; its pullback along 0→K is K and its pushout along K→0 is K.
- `strict_dense_inclusion`: The finitely supported inclusion in c₀ is strict in NACvx, but fails Hausdorff categorical strictness because the image is dense and proper.
- `strict_diagonal_failure`: On c₀(N,Q_p), T(x)_n=p^n x_n is continuous, injective and has dense proper range, but is not relatively open. The unit vectors have norm one while |T(e_n)|=p^(−n) tends to zero. Even its quotient-to-algebraic-image inverse is discontinuous.

**Left hearts and strict exactness** (construction). Construct `naLeftHeart` and `haLeftHeart` from the strict derived category of the corresponding quasi-abelian category. Use native bounded cochain complexes and their homotopy category. Define `naStrictDerivedCategory` as its Verdier localization by the thick subcategory of strictly acyclic complexes; define `haStrictDerivedCategory` in the same way. Stability of strict exactness under cones and translations follows from the lattice kernel/cokernel calculus. The left truncation through degree n ends in ker(d_n) at degree n; the complementary truncation starts with coim(d_(n−1))→E_n in degrees n−1,n. Consequently left cohomology is the monomorphism [coim(d_(n−1))→ker(d_n)] in degrees −1,0. Orthogonality and the truncation triangles give `naLeftTStructure` and `haLeftTStructure`. Their hearts are the promised abelian categories. An object is represented by a monomorphism E→F in degrees −1,0; invert squares whose mapping cones are strictly exact. The fully faithful embedding `naHeartEmbedding` (respectively `haHeartEmbedding`) sends V to [0→V]. Its essential image is extension closed, and an embedded complex is exact in the heart if and only if the original complex is strictly exact. An embedded short extension is thus represented by a strict short exact sequence, with no need to assume beforehand that its middle term is classical. An object [E→F] is classical exactly when the injection is strict, in which case it is the categorical cokernel. In NACvx a non-Hausdorff cokernel remains classical; it must not silently be replaced by its separated quotient. The three-space results below use the NACvx heart with Hausdorff outer terms; their strict middle space is Hausdorff as well. API: `naLeftHeart_monoPresentation`, `naHeartEmbedding_fullyFaithful`, `naHeartEmbedding_extensionClosed`, `naHeartEmbedding_exact_iff_strictExact`, `naHeart_classical_iff_strict`; the same five statements with `ha` prefix. API for the derived construction: `naStrictDerivedCategory_localization`, `naStrictDerivedCategory_acyclic_iff_zero`, `naLeftTStructure_truncation`, `naLeftCohomology_monoModel` and the corresponding `ha` statements. Proof input: native `CochainComplex`, `HomotopyCategory` and categorical localization, strict-kernel/cokernel calculus above and the left-heart construction in Colmez–Dospinescu–Nizioł §2.1.1, pp. 7–9 (compare Schneiders, Proposition 1.2.27, Corollary 1.2.28 and Proposition 1.2.29, pp. 26–29).

**Checks.**

- `heart_split_line`: The preceding split sequence gives the extension of [0→K] by [0→K] with middle [0→K²], in either heart.
- `heart_identity`: [K→K] with identity is zero in the strict derived category and the heart; [0→K] is the embedded line, not zero.
- `derived_split`: The three-term split complex K→K²→K is strictly acyclic and becomes zero; its two-term truncation [K→K²] is the embedded quotient K.
- `heart_dense_diagonal`: [c₀→c₀] with T(x)_n=p^n x_n is nonclassical in either heart. Its Hausdorff cokernel is zero, so replacing every monomorphism complex by its separated cokernel loses this object. The finitely supported inherited-norm inclusion, in contrast, is classical in the NACvx heart with its non-Hausdorff quotient.

**Projective tensor and separated completion** (construction). On Mathlib's algebraic E⊗_K F put the projective locally convex topology with open lattices generated by L⊗_(O_K) M for open lattices L⊂E and M⊂F. For defining seminorms p,q, the tensor seminorm at u is inf over finite expressions u=Σ x_i⊗y_i of max_i p(x_i)q(y_i). `naProjectiveTensor E F` represents jointly continuous bilinear maps. `naCompletedProjectiveTensor E F` is its separated uniform completion; it represents these maps into complete Hausdorff locally convex spaces H via continuous linear maps to H. The algebraic tensor map has dense range. API: `projectiveTensor_tmul`, `projectiveTensor_lift`, `projectiveTensor_lift_unique`, `completedProjectiveTensor_lift`, `completedProjectiveTensor_dense`, `projectiveTensor_pureNorm` for Banach factors. Source: Schneider §17, Lemma 17.2, Proposition 17.4 and Corollary 17.5, pp. 110–113. Proof uses the lattice topology, the seminorm infimum, separation and the universal property of native uniform completion, rather than a new algebraic tensor carrier.

**Checks.**

- `projectiveTensor_pure`: For normed factors, ‖x⊗y‖_π=‖x‖‖y‖. For complete Hausdorff E, K⊗̂_π E≃E via a⊗x↦ax; for arbitrary Hausdorff normed E it identifies with the completion of E. In particular finitely supported sequences with the sup norm complete to c₀.
- `projectiveTensor_two_summands`: In K²⊗K² with sup-norm orthonormal bases, ‖e₁⊗e₁+e₂⊗e₂‖_π=1, whereas the infimum-of-sums norm gives 2. The finite coefficient maximum must agree with the constructed tensor seminorm on this tensor. The finite coefficient norm is one; the tensor-seminorm identity uses the construction above.
- `projectiveTensor_zero`: Zero⊗̂_π E=0, including E=0; the unique bilinear map factors uniquely.
- `projectiveTensor_completion`: Σ_(n≥0) p^n e_n⊗e_n gives the diagonal coefficient array in c₀(N²,K). Its infinite-rank matrix is not in the algebraic tensor (whose matrices have finite rank). An uncompleted algebraic model fails this check.

**Inductive tensor and Fréchet comparison** (construction). `naInductiveTensor E F` gives E⊗F the finest locally convex topology for which its canonical bilinear map is separately continuous; it represents separately continuous bilinear maps. `naCompletedInductiveTensor` is the separated completion and has that universal property for complete Hausdorff targets. The identity induces E⊗_ι F→E⊗_π F, since joint continuity implies separate continuity. For Fréchet factors the two topologies and completions agree. API: `inductiveTensor_lift`, `completedInductiveTensor_lift`, `inductiveTensor_to_projective`, `frechetTensor_pi_eq_iota`. Source: Schneider §17, Proposition 17.6, p. 114.

**Checks.**

- `inductiveTensor_line`: For E=F=K the multiplication map identifies both completions with K.
- `inductiveTensor_zero`: A zero factor gives zero in either tensor topology and completion.
- `inductiveTensor_frechet`: For c₀(N,K) factors the π and ι completions agree and include the infinite diagonal with coefficients a^n for any a∈K with 0<|a|<1; this diagonal is absent from the algebraic tensor.

**Orthonormal bases and coefficient extension** (supplier). AdicSpacesPartII §R0.5, *completed-tensor-banach-module* (f), supplies E⊗̂_K c₀(I,K)≃c₀(I,E) for arbitrary discrete I and a complete ultrametric normed K-space E with isometric scalar action. Taking E=c₀(J,K), applying tensor symmetry and flattening the coefficient indices gives `c0CompletedTensor_equiv`: c₀(I,K)⊗̂_K c₀(J,K)≃c₀(I×J,K). Taking E=A gives `c0CompletedScalar_equiv`: c₀(I,K)⊗̂_K A≃c₀(I,A). These names label the supplied equivalences; they are isometries for the stated norms, and continuous equivalences with the corresponding constants for equivalent norms. Source: that supplier, clause (f), CHJ §2, Lemma 2.23(2), pp. 19–20.

**Checks.**

- `c0Supplier_point`: For I a singleton the supplied coefficient comparison is K⊗̂_K E≃E, sending 1⊗x to x.
- `c0Supplier_empty`: An empty orthonormal basis gives the zero tensor and the zero coefficient space.
- `c0Supplier_decay`: For E=K and I=N the supplied completion contains (a^n) when 0<|a|<1 and excludes the constant family one; it gives c₀ rather than bounded families.

**Banach and locally convex tensor comparison** (comparison). On ultrametric Banach K-spaces with isometric scalar action the product seminorm of AdicSpacesPartII §R0.5, *completed-tensor-banach-module*, and the projective seminorm above are the same infimum of finite maxima. Thus the identity on the native algebraic tensor extends uniquely to `banachTensor_locallyConvexComparison`, a continuous linear isometry between the supplied Banach completion and `naCompletedProjectiveTensor`. This transports the supplied orthonormal comparisons to locally convex tensors. The local chart adapters `c0CompletedTensor_basis`, `c0CompletedScalar_basis` and `c0CompletedScalar_naturality` record their action on basis coefficients and compatibility with bounded coefficient maps; they give LA_h(L)=LA_h(Q_p)⊗̂_π L for complete closed L⊆C_p. Needs: the preceding tensor construction, the supplied Banach completion and its dense tensor map. Source: Schneider §17, Lemma 17.2, Proposition 17.4 and Corollary 17.5, pp. 110–113; the comparison follows from uniqueness of separated completion.

**Checks.**

- `c0Tensor_basis`: e_2⊗e_3 has coefficient one at (2,3) and zero at (3,2), with norm one; e_2⊗a has norm ‖a‖.
- `c0Tensor_empty`: I=∅ gives zero after any scalar extension; I=singleton gives A.
- `c0Tensor_infinite`: The array p^n on (n,n), zero elsewhere, is included; the array constantly one on N² is excluded. Both completions give the same result.

**Completed scalar extension of finite-dimensional inverse limits** (comparison). Let F be a
complete nontrivially valued ultrametric field, C a complete valued extension with isometric
F-action, and (V_i) a countable inverse system of finite-dimensional Hausdorff F-spaces with
continuous linear transitions satisfying Mittag–Leffler (the images in each V_i eventually
stabilize). With projective-limit topologies and the separated completed projective tensor,
the natural map is a topological C-linear isomorphism
C⊗̂_F lim_i V_i ≃ lim_i (C⊗_F V_i). The finite-dimensional factors on the right are already
complete. API: `finiteDimensionalML_completedScalar`, sending c⊗(v_i) to (c⊗v_i), natural in
maps of systems and invariant under cofinal subsequences.

*Proof sketch.* Replace each V_i by its stable image W_i. This gives the same inverse limit
with surjective transitions, and the scalar-extended stable images are C⊗_F W_i because scalar
extension is exact on finite-dimensional spaces. Choose continuous linear splittings of those
surjections. The limit becomes W_0×∏_i ker(W_(i+1)→W_i), a product of finite-dimensional spaces.
Every continuous seminorm on this product is controlled by finitely many coordinates. Finite
coordinate tensor comparisons and density of finite-support tensors therefore identify its
completed scalar extension with the product of the scalar-extended factors. The resulting map
is the natural one, hence independent of the splittings. Source: derived from Schneider §17,
Lemma 17.2, Proposition 17.4 and Corollary 17.5, pp.110–113; Colmez–Dospinescu–Nizioł,
*Cohomology of p-adic Stein spaces*, §2.1.3, pp.9–10, and the finite-rank limit argument preceding
Lemma 3.26, p.22. *Needs:* §0.0 (*Locally convex limits*, *Projective tensor and separated
completion*); finite-dimensional topology over complete valued fields.

**Checks.**

- `scalarLimit_constant`: An identity system on F^d gives C⊗_F F^d≃C^d, including d=0.
- `scalarLimit_product`: For V_i=F^i with coordinate deletion, C⊗̂_F F^ℕ≃C^ℕ with product
  topologies. The constant sequence one is included, and e_n tends to zero; a c₀ topology fails.
- `scalarLimit_stableImages`: For the constant space F² with transition (x,y)↦(x,0), the stable
  image is F×0. Both limits and the completed scalar extension give one line, although the
  original transitions are not surjective.

### 0.1 Discs, locally analytic functions and their distributions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Pointwise realization on a translated closed disc** (comparison). For a ∈ L and r ∈ ℝ, let B(a,r)={x∈ℂ_p:v_p(x−a)≥r}. Use the native restricted power-series carrier at radius p^(−r) for `discAnalytic`; the new comparison realizes its coefficient family as the function φ(x)=Σ_k a_k(x−a)^k on B(a,r). This realization is injective and its Gauss valuation equals inf_(x∈B(a,r))v_p(φ(x)), with the supremum computed on ℂ_p-points rather than only L-points. Its Banach basis is (x−a)^k/p^floor(kr), orthonormal when r is integral. Under (a). The API consists of `discAnalytic_eval` (the convergent pointwise sum), `discAnalytic_eval_injective` (coefficients are determined by that function) and `gaussVal_eq_inf` (the maximum principle on the stated disc, stated in Suggested.lean). (Source: Colmez, §I.4.1, Propositions I.4.2–I.4.3, printed pp. 13–14.)

*Needs:* the native restricted-series and Gauss-norm inputs listed in the supplier contracts; Mathlib nonarchimedean infinite sums.

**Checks.**

- `gaussVal_X`: `v_{B(0,0)}(x) = 0`.
- `gaussVal_restrict_le`: Restriction to B(a, r + 1) does not decrease the valuation.
- `geometric_not_closed_disc` (non-example): Σ x^k is not analytic on the closed unit disc.
- `maximum_not_L_points` (non-example): X³−X has Gauss norm 1 on the unit disc, but for every x∈ℤ₃ its norm is at most 1/3. The maximum-principle comparison therefore uses ℂ_p-points, not only the coefficient field.

**Locally analytic functions of fixed radius** (supplier). The Banach stages `LA_h(ℤ_p, L)` of functions analytic on every residue ball `a + p^hℤ_p`, in the disc model of Taylor coefficients in `(x − a)/p^h` with the maximum coefficient norm, their norm-decreasing inclusions `LA_h ⊂ LA_{h+1}`, and `LA(ℤ_p, L)` as their union. Supplied by PadicFunctionalAnalysis §4.3 (`LA_h`, its evaluation and stage transitions) (the roadmap of W. Coram). There the coefficients lie in any Banach module E and LA carries no topology; this roadmap takes `E = L`, gives `LA(ℤ_p, L)` the locally convex inductive-limit topology of the stages (§0.0 `naInductiveLimit`), and obtains `LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p, ℚ_p)` from §0.0 (Orthonormal bases and coefficient extension).

**Checks.**

- `analyticStage_radius_zero`: At h=0, the residue ball is all Z_p and its indicator is 1 in LA_0; stage exclusion is asserted only for h≥1.
- `analyticStage_trivial_character`: The character one lies in LA_0 and every higher stage.
- `analyticStage_sqrt_odd`: For odd p, the Mahler coefficients a_n=(√p)^n have normalized valuations n/2−v_p(⌊n/p⌋!) tending to infinity, so the character lies in LA_1. For p≥5, already n/2−v_p(n!)→∞, giving LA_0. At p=3 and n=3^k these level-zero valuations equal 1/2, so the character is outside LA_0.
- `analyticStage_sqrt_two` (strict boundary): For p=2 and n=2^k, k≥1, v_2((√2)^n/⌊n/2⌋!)=1, so these coefficient norms stay 1/2 and the character is not in LA_1. At level 2 the valuations are at least n/2−⌊n/4⌋→∞, so it lies in LA_2. The coefficient-convergence criterion is PadicFunctionalAnalysis §4.4, from Colmez Théorème I.4.7, p. 15.

**Amice's theorem on Mahler coefficients** (supplier). For every h the functions ⌊n/p^h⌋!·C(x, n) form an orthonormal basis of LA_h(ℤ_p, L), the Mahler coefficients of φ ∈ LA_h are ⌊n/p^h⌋! times its coordinates in that basis, and a continuous φ is locally analytic if and only if lim inf_n v_p(a_n(φ))/n > 0, Legendre's formula for v_p(⌊n/p^h⌋!) bounding this lim inf below by 1/((p − 1)p^h) on LA_h. Supplied by PadicFunctionalAnalysis §4.4 (the Amice coefficient isometry and its Mahler comparison) (the roadmap of W. Coram). There the coefficients lie in a Banach module E; this roadmap uses the case E = L.

**Checks.**

- At level zero, 1 and x have finite Amice expansions.
- The coefficients of x² in the Mahler basis are 0, 1, 2.
- At p=2 the coefficients of the character (1+√2)^x fail the level-one convergence criterion.

**The locally analytic topology is finer** (lemma). The inclusion LA(ℤ_p, L) ⊂ C⁰(ℤ_p, L) is continuous with dense image (locally constant functions are dense in C⁰), but the inductive-limit topology on LA(ℤ_p, L) is strictly finer than the topology induced from C⁰. Equality of the underlying functions is not equality of their topologies: a sequence of locally analytic functions converging uniformly need not converge in LA(ℤ_p, L). Under (a). (Source: RJW, Remark 3.41, p. 24.)

*Needs:* PadicFunctionalAnalysis §4.3 (`LA_h`), with the topology of §0.1 (Locally analytic functions of fixed radius); PadicFunctionalAnalysis §4.4.

**Checks.**

- `analyticTopology_Zp`: The sequence p^n binom(x,p^(2n)) tends to zero uniformly and does not tend to zero in LA(Z_p,L).
- `analyticTopology_point`: On a one-point manifold, LA and C⁰ both have the given topology of L.
- `analyticTopology_empty`: On the empty manifold both spaces are zero with the same topology.

**Locally analytic distributions** (supplier). `D(ℤ_p, L)`, the linear forms on `LA(ℤ_p, L)` bounded on every stage `LA_h`, equivalently the inverse limit of the Banach duals `D_h = LA_h(ℤ_p, L)′`. In Mahler coordinates this means `D_h(μ)=sup_n |μ(binom(x,n))|·|⌊n/p^h⌋!|<∞` for every h; the bounded measures are the distributions bounded on `C⁰(ℤ_p, L)`. Supplied by PadicFunctionalAnalysis §4.7, including its measure comparison (the roadmap of W. Coram). There D carries no topology; this roadmap gives it the projective-limit topology of the `D_h` (§0.0 `naProjectiveLimit`), the Fréchet topology of the valuations `v_{LA_h}(μ) = inf_{φ≠0}(v_p(μ(φ)) − v_{LA_h}(φ))` used for the Amice theorem, and compares it with the strong dual topology for finite `L/ℚ_p` in §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `amice_stage_dirac_minus_one`: `δ_{−1}` has moments `(−1)^n` and `D_h=1` for every h. The inverse-factorial weight is unbounded at each fixed h and excludes this evaluation functional.
- `amice_stage_zero`: The zero distribution has D_h=0 at every stage.
- `amice_stage_every_level`: A continuous form on a single LA_h supplies only a stage dual element; compatibility and continuity on every LA_h are required for a distribution on their inductive limit.
- `amice_stage_single_level` (non-example): The moments b_n=1/n! give basis values one on LA_0, hence stage norm one. Their LA_1 basis values are unbounded; the corresponding exp(T) has radius p^(−1/(p−1))<1. Thus the union of bounded-stage conditions is not the distribution space.
### 0.2 Strict sequences and three-space properties

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

**Strict sequences and left-heart extensions** (comparison). Use the NACvx category and its left heart from §0.0. For Hausdorff outer spaces, an extension of their embedded objects is represented by a Hausdorff space and a strict short exact sequence: a closed kernel embedding followed by a surjective quotient map. Conversely each such strict sequence is exact after embedding. The same strict-sequence comparison holds in the Hausdorff category's own left heart. These two constructions are distinguished; no equivalence of their entire hearts is asserted. Under (a). (Source: Colmez–Dospinescu–Nizioł §2.1.1, pp. 7–9; Colmez–Nizioł Appendix A, pp. 58–59.)

*Needs:* §0.0 `naHeartEmbedding_exact_iff_strictExact`, `naHeartEmbedding_extensionClosed`, `haHeartEmbedding_exact_iff_strictExact`; quotient topology constructions of §0.0.

**Extensions of Banach spaces** (theorem). An exact extension in the NACvx left heart with Hausdorff outer spaces with Banach outer terms is represented by a Banach middle term. K is a complete nonarchimedean field. No splitting hypothesis is required. Under (a). (Source: Colmez–Nizioł, Appendix A, Proposition A.1, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions).

**The nonarchimedean Hahn–Banach theorem** (theorem; `naHahnBanach` in Suggested.lean). Let K be spherically complete (every nested family of closed balls has nonempty intersection), V an ultrametric normed K-vector space, U ⊆ V a subspace and ℓ : U → K a continuous linear functional. Then ℓ extends to a continuous linear functional on V of the same operator norm; consequently for every v ∉ closure(U) there is a continuous functional vanishing on U with ℓ(v) = 1, and the continuous dual separates points of V. Over a field that is not spherically complete the norm-preserving extension fails in general. A space with a chosen countable orthogonal Schauder basis still has a point-separating dual, by its coordinate functionals; this narrower observation makes no assertion about extending a functional from an arbitrary subspace. In addition: K is a field complete for a nontrivial nonarchimedean absolute value; spherical completeness is a hypothesis of the first statement and is not implied by completeness (ℂ_p is not spherically complete). (Source: Schneider, author lecture notes §9, Proposition 9.2, printed pp. 57–58, and Corollaries 9.3–9.4, printed p. 58; the coordinate-functional observation follows directly from the chosen Schauder basis. Ingleton is the historical attribution.)

*Needs:* Mathlib `ContinuousLinearMap`, `IsUltrametricDist`.

**Continuous functional extension in countable type** (theorem; `naFunctionalExtension_countableType`). Let K be complete, nontrivially valued and ultrametric, and V locally convex. Suppose every separated completion of V for a continuous ultrametric K-seminorm has a dense countable-dimensional K-subspace. Every continuous K-linear functional on an induced-topology subspace U extends continuously to V. Choose a continuous seminorm controlling the functional, descend to the separated normed image of U, and extend to its closure in the seminorm completion. PadicFunctionalAnalysis §2.4 complements that closed subspace; composing with its continuous projection and V's completion map gives the extension. No preservation of the original operator norm is asserted. Source: Schneider–Teitelbaum §1, pp. 4–5, citing Schikhof [Sh] §§4.2,4.4; the complementation argument uses the named supplier below.

*Needs:* §0.0 (Locally convex spaces and separation); PadicFunctionalAnalysis §2.4, `exists_continuousLinearEquiv_prod_of_countableType`; native uniform completion and `ContinuousLinearMap`.

**Checks.**

- `functionalExtension_zero`: The zero functional extends by zero, also on V=0.
- `functionalExtension_line`: A coordinate functional on K×0 extends to K².
- `functionalExtension_Cp`: A closed subspace of c₀(N,C_p) admits continuous functional extension; spherical norm preservation is not a conclusion.

**Fréchet open mapping** (theorem; `naFrechet_openMapping` in Suggested.lean). A continuous surjective K-linear map between Fréchet spaces over a complete nontrivially valued ultrametric field is open, hence a strict quotient map. The Baire argument uses completeness and a scalar of norm strictly between zero and one. Source: Schneider, author notes §8, Proposition 8.6 and Corollary 8.7, pp. 54–55; Schneider–Teitelbaum §1, p. 5, for the dual quotient application.

*Needs:* §0.0 (Locally convex spaces and separation); native Baire theorem and quotient topologies.

**Checks.**

- `frechetOpen_identity`: Identity on a Fréchet space is open.
- `frechetOpen_zero`: The surjection onto zero is a quotient map.
- `frechetOpen_dense_failure`: The diagonal x_n↦p^n x_n on c₀ is not surjective and is not relatively open.

**Splitting under spherical completeness or separability** (theorem). In the preceding Banach extension a continuous K-linear section of V→V₂ exists if K is spherically complete or if both outer Banach spaces have a dense subspace of countable K-dimension. The disjunction is essential to the source statement. Under (a). (Source: Colmez–Nizioł, Appendix A, Remark A.2, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Extensions of Banach spaces); §0.2 (The nonarchimedean Hahn–Banach theorem).

**Extensions of Fréchet spaces** (theorem). An exact left-heart extension with Fréchet outer terms is represented by a Fréchet middle term over a complete nonarchimedean K. This result makes no assertion of a continuous splitting. Under (a). (Source: Colmez–Nizioł, Appendix A, Proposition A.3, printed p. 58; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions); §0.2 (Extensions of Banach spaces).

**Strict countable inverse limits and cohomology** (theorem; `naProjectiveLimit_cohomology_finiteDimensionalML`). Let K be complete, nontrivially valued and ultrametric, and (C_n) a countable inverse system of Fréchet cochain complexes in a common finite degree window, with continuous differentials having closed images. Suppose each degreewise Roos map 1−shift:∏_n C_n^j→∏_n C_n^j is a strict surjection, and each system of finite-dimensional Hausdorff cohomology spaces H^j(C_n) is Mittag–Leffler. Then the canonical H^j(lim C_n)→lim H^j(C_n) is a topological K-linear isomorphism for quotient and projective-limit topologies. As the strict inverse-limit input, the Roos sequence 0→lim C_n^j→∏C_n^j→∏C_n^j→0 is strictly exact under the stated surjectivity. Its cohomology sequence and vanishing lim¹ of the Mittag–Leffler cohomology systems give the algebraic comparison. The surjection from the Fréchet space of limit cycles onto lim H^j(C_n) is open, so limit boundaries are closed and the comparison is topological. Source: Schneiders §§1.4.2–1.4.3, pp. 65–71; Colmez–Dospinescu–Nizioł §§2.1.1,3.1.1–3.1.3, with this Roos comparison derived here.

*Needs:* §0.0 `naProjectiveLimit` and strict exactness; §0.2 (Fréchet open mapping); algebraic countable Mittag–Leffler vanishing of lim¹ via the Roos sequence, proved as part of this target.

**Checks.**

- `limitCohomology_constant`: A constant identity system of finite-dimensional complexes gives its original cohomology and topology.
- `limitCohomology_zero`: Zero complexes have zero limit cohomology.
- `limitCohomology_truncations`: K^n in degree zero with coordinate deletion has limit K^N with product topology, containing (1,1,…); it is not c₀.

**Extensions of spaces of compact type** (theorem). An exact left-heart extension with compact-type outer terms has compact-type middle term if K is spherically complete or both outer terms are separable. Compact type means a countable inductive limit of Banach spaces with injective compact transition maps, with its locally convex limit topology. Under (a). (Source: Colmez–Nizioł, Appendix A, Proposition A.4, printed pp. 58–59; derived from the cited passage, not printed there.)

*Needs:* §0.2 (Strict sequences and left-heart extensions); §0.2 (Extensions of Fréchet spaces); §0.2 (Splitting under spherical completeness or separability).

### 0.CR.6.6 Stein curves and curve towers

Here O_K is a complete discrete valuation ring of mixed characteristic (0,p) with perfect residue
field k, K is its fraction field, K₀=W(k)[1/p], and C the completion of an algebraic closure K̄.
The log rigid Hyodo–Kato complexes, Frobenius and monodromy are those of CrystallineCohomology
§§CR.6.1–CR.6.5, with σ the Witt Frobenius. The completed geometric coefficient field K̆₀ is
specified in the completed comparison below.

**Nonproper finite-piece Hyodo–Kato comparison.** Let 𝔘 be a quasi-compact separated strictly
semistable weak formal O_K-scheme with only vertical semistable log structure, a chosen
uniformizer π, special log fibre Y, and smooth dagger generic fibre U^†. Strict semistability
means that locally 𝔘 admits étale maps to
Spwf(O_K⟨x_1,…,x_n⟩^†/(x_1⋯x_r−π)), 1≤r≤n. Construct the uniformizer-dependent comparison
of complexes
`ρ^†_π:RΓ_rig(Y/S₀)⊗_{K₀}K ≃ RΓ_dR(U^†/K)`,
where S₀=(Spf W(k),1↦0) and the log rigid complex is that of CrystallineCohomology §CR.6.5.
In particular it induces the finite-dimensional degree-one isomorphism
`K⊗_{K₀}H¹_rig(Y/S₀)≃H¹_dR(U^†/K)`, with the usual Hausdorff finite-dimensional topologies.
No properness assumption is made on Y or 𝔘.

The API is `LogCrystalline.daggerHK.comparison` for the complex-level comparison,
`LogCrystalline.daggerHK.restriction` for its naturality under morphisms of such models,
including restrictions to weak formal opens, and `LogCrystalline.daggerHK.refinement` for
compatibility with common admissible embedding and covering refinements. These maps are
compatible with finite coefficient-field extension and its semistable base-change
identifications. `LogCrystalline.daggerHK.proper` identifies the comparison on a proper
semistable model with CrystallineCohomology §CR.6.2 after the proper log rigid–crystalline
comparison of §CR.6.5 and proper dagger–rigid de Rham comparison. The dagger generic fibre and
its overconvergent de Rham complex are part of the hypotheses.

*Proof sketch.* Use the log boundary embeddings and the two parameter specializations t=0 and
t=π to form Grosse-Klönne's zigzag. Its arrows are quasi-isomorphisms on the simplicial dagger
tubes; the t=π term is the dagger de Rham complex. Common refinements and restriction of the
same zigzag supply naturality. The proper compatibility follows by comparing those parameter
specializations with the proper crystalline ones. Source: [Grosse-Klönne, *Frobenius and
monodromy operators in rigid analysis, and Drinfel’d’s symmetric space*](https://arxiv.org/abs/1408.3346),
Theorem 3.4, §3.6 and Corollary 3.7, pp.16–17; §3.11, pp.18–19 for proper compatibility.
*Needs:* CrystallineCohomology §CR.6.5 (*Log rigid Hyodo–Kato cohomology*, *Proper log rigid and
crystalline Hyodo–Kato cohomology*) and §CR.6.2 (*Uniformizer-dependent Hyodo–Kato maps*, only
for the proper compatibility); AdicSpacesPartIV F1.5 (*The Monsky–Washnitzer weak completion*),
F1.7 (*Dagger spaces*) and F1.11 (*Finiteness of de Rham cohomology of tubes in a quasi-compact
strictly semistable formal scheme*).

**Checks.**

- `daggerHK_disc`: The good-reduction dagger affine line has H¹=0 on both sides. Ordinary
  closed rigid-disc de Rham cohomology cannot replace dagger cohomology in this statement.
- `daggerHK_annulus`: For the weak formal chart xy=π the comparison sends the log rigid
  class dlog x to the dagger annulus class dlog x, a one-dimensional K-space after extension.
- `daggerHK_restriction`: Restriction from a good-reduction dagger affine line to the weak
  formal open with x invertible gives 0→K·dlog x in degree one on both sides. The restriction
  square commutes, although the restriction on H¹ is not surjective.
- `daggerHK_proper`: On a proper good-reduction curve the map agrees with the proper
  crystalline–de Rham comparison and is independent of π because N=0.

**Hyodo–Kato cohomology of Stein curves.** For a smooth Stein curve over K with a semistable weak
formal model and a Stein exhaustion by relatively compact semistable dagger pieces U_i
(AdicSpacesPartIV Layer F1), define its overconvergent Hyodo–Kato cohomology as the projective limit
of the log rigid Hyodo–Kato cohomology H¹_HK(U_i) of CrystallineCohomology §CR.6.5
(*Log rigid Hyodo–Kato cohomology*). H¹_HK is a projective limit of finite-dimensional K₀-spaces, with the projective-limit (Fréchet) topology and
continuous φ, N. This is not ordinary nonproper crystalline cohomology.

*Hypotheses.* Choose compatible Fréchet cochain models C_i for the exhaustion HK complexes in
one common finite degree window. Require continuous differentials with closed images, strict
surjectivity of every degreewise Roos map 1−shift:∏_i C_i^q→∏_i C_i^q, and finite-dimensional
Hausdorff Mittag–Leffler cohomology systems in every degree. The comparison of cohomology with
that of the inverse-limit complex and independence between exhaustions are asserted for models
and common cofinal refinements satisfying these hypotheses.

The API:

- `LogCrystalline.steinHK.limit`: The topology is the projective-limit topology on the
  finite-dimensional exhaustion groups.
- `LogCrystalline.steinHK.operators`: φ and N act continuously and satisfy Nφ=pφN.
- `LogCrystalline.steinHK.exhaustion_independence`: Cofinal admissible Stein exhaustions whose
  models and common refinements satisfy the stated strict-limit hypotheses give canonically
  isomorphic spaces.

*Proof sketch.* Take the semistable weak formal model and its dagger exhaustion (AdicSpacesPartIV
Layer F1) with the restriction maps between the pieces. Take log rigid cohomology of each piece; the
transition maps on cohomology are continuous maps of finite-dimensional spaces. Apply
§0.2 `naProjectiveLimit_cohomology_finiteDimensionalML` to the
chosen models with the stated window, closed images, strict Roos surjectivity and cohomological
Mittag–Leffler hypotheses. It identifies cohomology of the limit complex with the limit of the
groups, including their topologies. Colmez–Dospinescu–Nizioł Lemma 3.4 gives closed images for
smooth Stein and affinoid dagger de Rham models; it does not by itself supply all the hypotheses
on HK models. Use common admissible refinements to compare exhaustions and retain the limit
topology and continuous operators. ([Colmez–Dospinescu–Nizioł,
*Cohomology of p-adic Stein spaces*](https://arxiv.org/abs/1801.06686v2), §3.1.1–3.1.3,
Proposition 3.2 and Lemma 3.4, pp.13–18; [Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la
tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §0.6, nonproper
curve Hyodo–Kato cohomology, pp.10–12.)

*Needs:* CrystallineCohomology §CR.6.5 (*Proper log rigid and crystalline Hyodo–Kato cohomology* and
*Log rigid Hyodo–Kato cohomology*); AdicSpacesPartIV F1.5 (*The Monsky–Washnitzer weak completion*),
F1.7 (*Dagger spaces*) and F1.11 (*Finiteness of de Rham cohomology of tubes in a quasi-compact
strictly semistable formal scheme*); §0.0 (*Locally convex limits* and *Projective tensor and
separated completion*); §0.2 (`naProjectiveLimit_cohomology_finiteDimensionalML` and
*Strict sequences and three-space properties*); Mathlib `ModuleCat`.

**Checks.**

- `affine_line`: Rigid analytic `A¹_K` is exhausted by the good-reduction dagger discs
  `U_m = {|T| ≤ |π|^(−m)}`, `m ≥ 0`, with coordinate `z_m = π^m T` and model
  `Spwf(O_K⟨z_m⟩^†)`. Their inclusions satisfy `z_(m+1) = π z_m` and are relatively compact.
  The HK complexes are compatibly represented by `K₀` in degree zero; this constant system
  satisfies the strict-limit hypotheses and gives `H¹_HK(A¹_K) = 0`.
  Source: Colmez–Dospinescu–Nizioł, *Cohomology of p-adic Stein spaces*, Example 1.9, p.4,
  and §3.1.1, pp.13–14.
- `open_annulus`: An open annulus has H¹_HK=K₀·dlog t, φ=pσ and N=0.
- `countable_lines`: A countable disjoint union of analytic multiplicative lines has
  H¹_HK=∏_ℕK₀ with the product Fréchet topology, using finite unions and annular exhaustions.
- `open_disc_radius` (boundary): Over fixed discretely valued `K`, a good-reduction unit
  dagger disc mapping relatively compactly into `|T| < 1` pulls `T` back to a series of Gauss
  norm at most `|π|`. Such images miss every geometric point `T = π^(1/n)` with `n > 1`.
  Discs of radii `|π|^(1/n)` approach the open-disc boundary and acquire good reduction after
  finite ramified extension; the unit-disc models over `O_K` alone do not give that exhaustion.

**Completed Hyodo–Kato comparison for Stein curves.** For the smooth semistable Stein curve and
strict-limit hypotheses above, the uniformizer-dependent HK map extends to a topological isomorphism
`C⊗̂_{K̆₀}H¹_HK(X_C)≅H¹_dR(X_C)`. Over K before geometric descent use `K⊗_{K₀}H¹_HK(X_k)`. The geometric
C-map uses completed tensor products, continuous projective limits and the source Gal(K̄/K) action;
it is not obtained from the proper theorem by dropping properness. Here K̆₀ = W(k̄)[1/p] for an
algebraic closure k̄ of k, the completion of the maximal unramified extension of K₀ (Q̆_p in
Colmez–Dospinescu–Nizioł), with Gal(K̄/K) acting through Gal(k̄/k) on Witt coordinates (Mathlib
`WittVector.map`), and C is the completion of K̄.

*Hypotheses.* The HK, de Rham and scalar-extended exhaustion models satisfy the common finite
window, closed differential images, degreewise strict Roos surjectivity and finite-dimensional
Hausdorff Mittag–Leffler hypotheses of the preceding target. Each finite piece is the dagger
generic fibre of a quasi-compact separated strictly semistable weak formal model as in
*Nonproper finite-piece Hyodo–Kato comparison*, with compatible restriction maps and common
refinements; retain these hypotheses after coefficient extension.

*Proof sketch.* Apply §0.CR.6.6 (*Nonproper finite-piece Hyodo–Kato comparison*) to each
strictly semistable weak formal exhaustion model, using its restriction and common-refinement
compatibilities. Apply §0.2 `naProjectiveLimit_cohomology_finiteDimensionalML` to the chosen
models and §0.0 `finiteDimensionalML_completedScalar` to their finite-dimensional cohomology
systems, over K₀ and over the completed geometric coefficient field K̆₀ respectively. Compare
with the classical formal Hyodo–Kato map by the compatible p^N-inverse and section construction of Colmez–Dospinescu–Nizioł,
Appendix A, then pass to C and geometric descent. ([Colmez–Dospinescu–Nizioł, *Cohomology of p-adic
Stein spaces*](https://arxiv.org/abs/1801.06686v2), §3.1.3 and Proposition 3.12, pp.16–18; Appendix
A.1–A.5, pp.60–61; [Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas
de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §0.3, pp.6–7; §0.6,
pp.10–12, geometric completed comparison.)

*Needs:* §0.CR.6.6 (*Hyodo–Kato cohomology of Stein curves*);
§0.CR.6.6 (*Nonproper finite-piece Hyodo–Kato comparison*);
§0.0 (`finiteDimensionalML_completedScalar`, *Locally convex limits*
and *Projective tensor and separated completion*); §0.2
(`naProjectiveLimit_cohomology_finiteDimensionalML` and *Strict sequences and three-space
properties*); Mathlib `WittVector.map`.

**Checks.**

- For the open unit disc both degree-one spaces vanish.
- On an open annulus the comparison sends the HK generator dlog t to the de Rham generator
  dlog t; both sides after extension to C are C·dlog t.
- For the countable disjoint union of analytic multiplicative lines the comparison identifies
  `C⊗̂_{K̆₀}(∏_ℕK̆₀)` with `∏_ℕC`, carrying the product topology and each coordinate `dlog t`.

**Hyodo–Kato cohomology of semistable curve towers.** For a Drinfeld-type tower of finite-level
semistable curves, with the hypotheses of Colmez–Dospinescu–Nizioł, (M_n), define H¹_HK(M_∞)=colim_n
H¹_HK(M_n) in the category of ind-Fréchet K̆₀-spaces with continuous commuting tower/group and Gal_F
actions and (φ,N). Levelwise HK-to-de Rham maps induce C⊗̂H¹_HK(M_∞)≅H¹_dR(M_∞) in that category
under the analytic continuity hypotheses. Here K̆₀ is the field of §0.CR.6.6 (*Completed Hyodo–Kato
comparison for Stein curves*), and Gal_F is the absolute Galois group of the local base field F
of the tower.

*Hypotheses.* Each finite level and its scalar-extended exhaustion models satisfy the strict-limit
hypotheses of §0.CR.6.6 (*Hyodo–Kato cohomology of Stein curves* and *Completed Hyodo–Kato comparison
for Stein curves*); the geometric transitions and level comparisons are continuous and compatible.

The API:

- `LogCrystalline.towerHK.level_maps`: Every level maps continuously into the ind-object with the
  given transitions; a discontinuous linear map is not a morphism.
- `LogCrystalline.towerHK.cofinal`: Restriction to a cofinal subsequence gives the same ind-object.
- `LogCrystalline.towerHK.actions`: Geometric tower symmetries act by continuous linear maps; the
  separate Gal_F action is semilinear for its action on K̆₀. Both commute with the continuous φ,N
  and respect transitions before forming the ind-object.
- `LogCrystalline.towerHK.comparison`: The level comparisons induce the completed C⊗̂ comparison in
  ind-Fréchet spaces.

*Proof sketch.* Apply the nonproper curve Hyodo–Kato construction at each finite level with the
semistable models of the source. Use the transition maps and form the ind-Fréchet colimit retaining
its actions. Pass the completed tensor comparison through the ind-category using the continuity
results of §§0.0 and 0.2. ([Colmez–Dospinescu–Nizioł, *Cohomologie p-adique
de la tour de Drinfeld: le cas de la dimension
1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §0.3, pp.6–7; §0.6, pp.10–12.)

*Needs:* §0.CR.6.6 (*Hyodo–Kato cohomology of Stein curves* and
*Completed Hyodo–Kato comparison for Stein curves*);
§0.0 (*Locally convex limits* and *Projective tensor and
separated completion*); §0.2 (*Strict sequences and three-space properties*); Mathlib
`CategoryTheory.Ind`; Mathlib `CategoryTheory.Ind.lim`.

**Checks.**

- `constant_tower`: A constant tower gives the original Fréchet HK space.
- `growing_coordinates`: In the underlying ind-Fréchet adapter, K̆₀^n→K̆₀^(n+1) by appending
  zero gives ⊕_ℕK̆₀; each element has finite support and new coordinates appear at later stages.
- `zero_transitions`: The same adapter sends the tower K̆₀→K̆₀ with every transition zero to
  the zero ind-object, although every level is nonzero.

### 0.3 Polydiscs, charts and compact manifolds

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.

**Analytic functions on finitely many polydiscs** (construction). For a finite clopen chart set S and coordinates z∈Z_p^d, the radius-h analytic stage is the finite product over S of restricted power series in normalized coordinates (z−a)/p^h. Coefficients tend to zero outside finite subsets of N^d; the norm is the maximum coefficient norm. Its coefficient model is Mathlib's `C₀(S × ℕ^d, K)`, used directly with no alias. The chart realization, rather than a second power-series carrier, identifies this with actual functions; the realization map and its injectivity are the content of this target. Under (a), with the stage construction and realization also valid for any complete closed K⊆C_p containing the chart coefficients. Its API consists of the realization map, Mathlib's `ZeroAtInftyContinuousMap.ext` (Equality is coefficientwise equality) and the requirement that a monomial on one chart have its specified single coefficient.

*Needs:* §0.1 `discAnalytic`; Mathlib `ZeroAtInftyContinuousMap`.

**Checks.**

- `AnalyticDistributionTests.analyticStage_point` (compatibility): For S and N^0 both singleton, evaluation at the unique index is a continuous linear isometry to K.
- `AnalyticDistributionTests.analyticStage_empty` (degenerate): The empty chart set gives the zero space.
- `AnalyticDistributionTests.analyticStage_geometric_excluded` (non-example): The coefficient family constantly 1 in positive dimension is not a radius-h analytic stage element.

**Countable type of analytic function spaces** (theorem). For F/Q_p finite, G₀=𝒪_F with restriction-of-scalars charts, and complete K⊆C_p containing F, form LA(G₀,K) as the locally convex union of the finite-polydisc stages. Every separated completion of LA(G₀,K) for a continuous ultrametric seminorm has a dense countable-dimensional K-subspace. Indeed each finite-polydisc stage has a countable coefficient basis; the span of the images of all these bases is dense in that completion, since the seminorm is continuous on every stage. This statement supplies the hypothesis for functional extension and does not require spherical completeness. Source: Schneider–Teitelbaum, §1, pp. 4–5, with the coefficient-basis proof given here.

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); §0.0 `naInductiveLimit`; PadicFunctionalAnalysis §2.1 (finite-support density).

**Checks.**

- `analyticCountable_point`: A point gives the one-dimensional space K.
- `analyticCountable_empty`: Empty charts give the zero completion.
- `analyticCountable_Cp`: For K=C_p the same countable coefficient span works, although K is not spherically complete.

**F-analytic against ℚ_p-analytic functions** (lemma). Let F/ℚ_p be finite, 𝒪 = 𝒪_F viewed both as a locally F-analytic group G and, by restriction of scalars, as a locally ℚ_p-analytic group G₀ of dimension [F : ℚ_p], and K ⊆ ℂ_p complete containing F. The inclusion C^an(G, K) ⊂ C^an(G₀, K) identifies the F-analytic functions with the closed subspace of ℚ_p-analytic f satisfying the Cauchy–Riemann equations (tx)f = t·(xf) for x in the Lie algebra and t ∈ F, and is a homeomorphism onto this image. Dually D(G₀, K) → D(G, K) is a surjective quotient map of Fréchet algebras. A locally ℚ_p-analytic character χ of G₀ is F-analytic exactly when dχ is F-linear. In addition: Schneider–Teitelbaum work with a commutative locally F-analytic group; only G = 𝒪_F is used here. (Source: Schneider–Teitelbaum, Introduction, p. 1, and Lemmas 1.1–1.3, pp. 3–5.)

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); §0.3 (Countable type of analytic function spaces); §0.2 `naFunctionalExtension_countableType`; §0.2 (Fréchet open mapping); §0.0 `naInductiveLimit` and `naProjectiveLimit`.

**Checks.**

- `Fanalytic_Qp`: For F=Q_p the function inclusion and dual quotient are identities.
- `Fanalytic_Cp`: For K=C_p the dual quotient is surjective by countable-type continuous extension, without spherical completeness.
- `Fanalytic_trace_character`: For [F:Q_p]>1 and sufficiently small nonzero c, χ(x)=exp(c Tr_(F/Q_p)(x)) is Q_p-analytic on 𝒪_F but not F-analytic: its derivative is not F-linear.

**Compact restriction to a smaller radius** (chart comparison). For finite p-adic charts, restriction from analytic radius h to radius h+1 is a continuous injective K-linear map and is completely continuous. After splitting into the finitely many smaller residue charts, identify this restriction with the finite-chart radius improvement of CompactOperators §0.3. Its omitted destination Taylor coefficients of total degree≥N contribute at most C|p|^N; C depends only on the fixed normalization. Under (a). Source: CompactOperators §0.3; Colmez, Théorème I.4.7, p. 15.

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); CompactOperators §0.1 (`IsFiniteRank`, `IsCompletelyContinuous`) and its finite-range approximation criterion, specialized to K.

**Checks.**

- The scalar constant function is preserved under refinement.
- Zero-dimensional finite charts give a finite-dimensional restriction map.
- Positive-dimensional equal-radius identity is not completely continuous.

**A common analytic radius on a compact manifold** (lemma). Every locally Q_p-analytic function on a compact finite-dimensional p-adic analytic manifold belongs to a finite-chart analytic stage at one common radius. Every finite family of such functions belongs to a common stage. Under (a).

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); PadicFunctionalAnalysis §4.3 (`LA_h`).

**Analytic stage pullback and multiplication** (construction). For analytic f:X→Y and target stage h, choose a source refinement k(f,h) on which every normalized component of f lands in the relevant closed target polydisc and has restricted coefficients of norm at most one. Finite chart substitution defines `analyticStagePullback f h : A_h(Y,K)→A_k(X,K)`, bounded by the finite chart normalization constant. Its evaluation is g(f(x)); refinements commute because both sides are the same analytic functions and restricted-series realization is injective. A fixed a∈LA(X,K) belongs to a stage h_a. On a common refinement k≥h,h_a, coefficient Cauchy product gives `analyticStageMultiplier a h : A_h(X,K)→A_k(X,K)`, with bound ‖a‖_k times the radius-transition bound. API: `analyticStagePullback_eval`, `analyticStagePullback_refine`, `analyticStagePullback_comp`, `analyticStageMultiplier_eval`, `analyticStageMultiplier_bound`, `analyticStageMultiplier_refine`. Needs: restricted multivariate substitution/Cauchy product, §0.0 limits, §0.3 common radius. Source: Schneider–Teitelbaum arXiv:math/9912073v1, §2, definition of C^an and integration, pp. 5–7; Colmez §II.4, pp. 34–37.

**Checks.**

- `stagePullback_affine`: On Z_3, f(x)=1+3x pulls y² back to 1+6x+9x², with the constant and both nonconstant coefficients retained.
- `stagePullback_point_empty`: A constant map pulls g back to g(y)·1; a map from an empty chart has zero pullback codomain. There is no map from a nonempty manifold to the empty manifold.
- `stagePullback_radius`: For the indicator of 1+3Z_3, pullback by x↦3x is zero, not the original indicator. A definition acting only on unrefined global polynomial coefficients fails.
- `stageMultiplier_polynomial`: Multiplying x by 1+x gives x+x².
- `stageMultiplier_zero_one`: Multiplying by zero gives zero and by one gives the radius inclusion.
- `stageMultiplier_clopen`: Multiplying by 1_(1+3Z_3) projects to that chart and is idempotent, whereas multiplying by x is not idempotent. This distinguishes multiplication from a scalar determined by a single chart value.

**Global analytic pullback and multiplication** (construction). `analyticPullback f` and `analyticMultiplier a` are the continuous linear maps on the locally convex inductive limits induced by the compatible stage maps. Continuity follows from `naInductiveLimit_continuous_iff`; the target radius can vary with the input stage. API: `analyticPullback_apply`, `analyticPullback_stage`, `analyticPullback_comp`, `analyticMultiplier_apply`, `analyticMultiplier_stage`, `analyticMultiplier_comp`. These are actual maps of functions, separate from a transpose of an arbitrary supplied map. Every bounded set is mapped into a bounded set, so transpose maps on strong duals are continuous over finite K/Q_p; the stage formulas also directly give projective-limit continuity without a strong-topology claim for general L.

**Checks.**

- `analyticPullback_affine`: The preceding y² computation holds in LA and commutes with each radius inclusion; identity pullback fixes every locally analytic function.
- `analyticPullback_constant`: Constant f returns g(y)·1, including the nonpolynomial locally constant g=1_(1+3Z_3).
- `analyticMultiplier_refined`: The clopen projector remains idempotent globally, while x multiplication sends x to x². An arbitrary supplied endomorphism need not satisfy either formula.

**Independence of the analytic atlas** (lemma). Two finite analytic chart systems on the same compact p-adic manifold give canonically isomorphic locally analytic spaces with the same locally convex topology. The identity on functions gives a continuous K-linear equivalence. Under (a).

*Needs:* §0.3 (Global analytic pullback and multiplication); §0.3 (A common analytic radius on a compact manifold).

**Analytic compact-type tensor comparison** (comparison). For the finite-polydisc stages E_h=A_h(X,K), F_k=A_k(Y,K) over finite K/Q_p, the inductive tensor of their locally convex limits is obtained from lim_(h,k)(E_h⊗_π F_k). The completed Banach tensor stages identify with the product-chart coefficient spaces through §0.0's supplied orthonormal comparison. Their transitions are compact: restrict both radii and approximate by finite coefficient truncations, with geometrically vanishing tails. The diagonal is cofinal, so this completed-stage system is compact type and its limit is complete. Regularity and the lattice universal property identify it with LA(X,K)⊗̂_ι LA(Y,K). API: `analyticCompactTensor_stageLimit`, `analyticCompactTensor_product`. Needs: compact radius restriction and atlas independence above; §0.0 inductive tensors, compact-type completeness and Banach/locally convex tensor comparison. Source: Schneider §17, Proposition 17.6, p. 114; Schneider–Teitelbaum §1, Theorem 1.1, pp. 3–4; the analytic stage-limit comparison is derived here.

**Checks.**

- `inductiveTensor_pure`: Two polynomial test functions x^i and y^j map to x^i y^j on the product manifold, preserving coordinate order.
- `inductiveTensor_point_empty`: A point factor gives LA(X,K); an empty manifold factor gives zero.
- `inductiveTensor_radius`: An analytic tensor may require a larger radius index than either displayed presentation, with inclusion induced by both transitions. The infinite diagonal coefficient array belongs to the completed stage. In §2.2 the tensor 1⊗1_(pZ_p) distinguishes the projective C^r product from the simultaneous-difference condition.

**Products and completed analytic tensors** (comparison). For compact analytic X,Y and finite K/Q_p, external product gives LA(X,K)⊗̂_ι LA(Y,K)≃LA(X×Y,K). At finite-chart stages use the isometric c₀(I,K)⊗̂_π c₀(J,K)≃c₀(I×J,K) of §0.0. Rectangular stages are cofinal in product charts; compact radius transitions make their double system compact type, and the diagonal indices are cofinal. The preceding stage-limit comparison then supplies precisely the inductive completed tensor in the displayed formula. API: `analyticTensor_externalProduct`, `analyticTensor_basis`, `analyticTensor_radius`, `analyticTensor_equiv`. Under (a).

*Needs:* §0.0 `c0CompletedTensor_equiv`; §0.3 `analyticCompactTensor_stageLimit`; §0.3 (Analytic functions on finitely many polydiscs), compact radius restriction and atlas independence.

**Checks.**

- `analyticTensor_monomial`: x²⊗y³ maps to x²y³, with coefficient one at (2,3).
- `analyticTensor_point_empty`: A point factor is the identity and an empty chart factor gives zero.
- `analyticTensor_infinite`: Σ p^n x^n y^n is present at the closed unit polydisc stage but is not a finite algebraic tensor. The geometric coefficients all one are excluded at that stage.

**Strong duality for analytic compact-type spaces** (comparison). Over finite K/Q_p, LA(X,K) for compact analytic X is of compact type; its strong continuous dual is a nuclear Fréchet space identified with the projective limit of the Banach-stage duals, and the canonical strong bidual map is an isomorphism. A finite extension of Q_p is discretely valued and spherically complete, so the field hypothesis of the cited compact-type duality applies. Under (a). (Source: Schneider–Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL₂*, §1, Theorems 1.1 and 1.3 and Corollary 1.4, arXiv:math/9912073v1, printed pp. 3–4.)

*Needs:* §0.3 (Compact restriction to a smaller radius); §0.3 (Independence of the analytic atlas); PadicFunctionalAnalysis §4.7, with the topology of §0.1 (Locally analytic distributions).

### Examples

The function x on the closed unit disc has Gauss valuation 0; `Σ xᵏ` converges on the open disc but is not analytic on the closed one; for `h≥1` the indicator of `a + pʰℤ_p` lies in `LA_h` and not in `LA_{h−1}`; at `h=0` it is the constant function 1 in `LA_0`; the sequence `pⁿ·binom(x, p^{2n})` tends to zero uniformly but not in the locally analytic topology; the derivative at zero is a locally analytic distribution that is not a bounded measure.

### Dependencies

Mathlib (`PadicInt.mahlerEquiv`, `ZeroAtInftyContinuousMap`, `ContinuousLinearMap`, `LocallyConstant`, nonarchimedean infinite sums); PadicMeasuresIwasawaAlgebras Layer 0 (bounded measures and their topologies) and Layer 2 (the bounded Amice transform); PadicFunctionalAnalysis §4.3–§4.4 and §4.7 (the stages LA_h, Amice's theorem and the distributions); AdicSpacesPartIV F1.5, F1.7 and F1.11 (weak completions, dagger spaces and tube finiteness); CrystallineCohomology §CR.6.2 (proper uniformizer-dependent maps, for compatibility) and §CR.6.5 (log rigid Hyodo–Kato cohomology and its proper crystalline comparison); Mathlib `WittVector.map`, `CategoryTheory.Ind` and `CategoryTheory.Ind.lim`. No earlier layer.

## Layer 1: the unbounded Amice transform and operations on distributions

This layer extends the bounded Amice transform of PadicMeasuresIwasawaAlgebras to all locally analytic distributions on ℤ_p and develops the toolbox that the p-adic L-function constructions use: evaluation of series on the open disc, pushforward, convolution and multiplication of distributions, the Amice dictionary for point masses, convolution, multiplication by x, character twists, clopen restriction, the transpose derivative, dilation and ψ, division by the coordinate on the units, local primitives, and the two non-splitting theorems that explain why a locally analytic primitive is only determined up to a locally constant function. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` and `TauCeti/NumberTheory/Padics/Mellin` (open-disc series).

### 1.1 The Amice transform of distributions and its toolbox

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**The Amice transform of distributions** (topological comparison). The Amice transform `μ ↦ A_μ = Σ_n μ(C(x, n))T^n` is a bijection of `D(ℤ_p, L)` onto `R⁺`, the power series converging on the open unit disc `v_p(T) > 0`, extending the bounded Amice transform of measures, with `v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1` for `u_h = 1/((p − 1)p^h)`, and `∫(1 + z)^x μ = A_μ(z)` for `v_p(z) > 0`. Supplied by PadicFunctionalAnalysis §4.7 (the roadmap of W. Coram). The supplier contract uses `D_h(μ)=sup_n |μ(C(x,n))|·|⌊n/p^h⌋!|<∞` for every h, and `S_h(A_μ)≤D_h(μ)≤p S_{h+1}(A_μ)`, where `S_h` is the Gauss norm at radius `p^(−u_h)`; with the topology of §0.1 (Locally analytic distributions) on D and the Gauss valuations `v_{B(0,u_h)}` on `R⁺`, the two inequalities make it the isomorphism of Fréchet spaces `D(ℤ_p, L) ≅ R⁺` used in this roadmap.

**Checks.**

- `amice_transform_dirac_minus_one`: `δ_{−1}` transforms to `(1+T)^(−1)=Σ_n(−1)^nT^n`, with `S_h=D_h=1` at every h.
- `amice_transform_zero`: Zero transforms to zero and all its stage and disc norms vanish.
- `amice_transform_derivative`: The derivative evaluation at zero transforms to log(1+T). Its unbounded coefficients satisfy the stage/disc comparisons for every h.
- `amice_stage_single_level` (non-example): The series exp(T) from the norm-one LA_0 functional does not converge on the whole open unit disc, so the every-stage hypothesis cannot be weakened.

**Operations on distributions** (theorem). The bounded toolbox extends continuously to `D(ℤ_p, L)`, with the following Amice transforms (`∂ = (1 + T)d/dT`). Dirac masses: `A_{δ_a} = (1 + T)^a`, and the span of Dirac masses at natural numbers is dense. Multiplication by a locally analytic function; in particular `A_{xμ} = ∂A_μ` and `A_{z^xμ}(T) = A_μ((1 + T)z − 1)` for `v_p(z − 1) > 0`. Restriction to `b + p^nℤ_p`: `A_{Res μ}(T) = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}A_μ((1 + T)η − 1)`. Derivative (`∫φ dμ = ∫φ′μ`): `A_{dμ} = log(1 + T)·A_μ`. `σ_a` (`a ∈ ℤ_p^×`), φ and ψ: `A_{σ_aμ} = A_μ((1 + T)^a − 1)`, `A_{φμ} = A_μ((1 + T)^p − 1)`, `A_{ψμ} = ψ(A_μ)`, with `ψφ = id`, `σ_a` commuting with φ and ψ, `ψ(μ) = 0` iff μ is supported on `ℤ_p^×`, and `Res_{ℤ_p^×} = 1 − φψ`. Convolution: `A_{λ∗μ} = A_λA_μ`. Under (a). In addition: The bounded versions of these operations are PadicMeasuresIwasawaAlgebras Layer 2 (§2.1 weights, §2.2 φ and ψ, §2.12 restriction to residue classes); here they are extended by continuity along the Amice isomorphism. (Source: Colmez, §II.4.1–II.4.6, pp. 34–37.)

*Needs:* PadicFunctionalAnalysis §4.7, with the Fréchet topology of §1.1 (The Amice transform of distributions); PadicMeasuresIwasawaAlgebras §2.2 (Frobenius on bounded measures); PadicMeasuresIwasawaAlgebras §2.2 (The left inverse of Frobenius; Psi and the Amice transform); PadicMeasuresIwasawaAlgebras §2.1 (Amice transform of multiplication by x); PadicMeasuresIwasawaAlgebras §2.2 (Frobenius and the Amice transform).

**Division by x, primitives and logarithmic factors** (lemma). (1) Division by x on `D(ℤ_p, L)` is defined only up to adding a multiple of `δ₀`: `A_{x^{−1}μ}` is a primitive of `(1 + T)^{−1}A_μ`. For μ supported on `ℤ_p^×` there is a unique `x^{−1}μ` supported on `ℤ_p^×`, without using any global function `x^{−1}` on `ℤ_p`. (2) For `n ∈ ℕ`, `b ∈ ℤ_p` and `k ∈ ℤ`, `∫_{b+p^nℤ_p} x^k μ = p^{−n}Σ_{η∈μ_{p^n}} η^{−b}(∂^kA_μ)(η − 1)` whenever `k ≥ 0`, or `k ≤ −1` and `b ∉ p^nℤ_p`. For `k ≤ −1`, `∂^kA_μ = ∂^{−|k|}A_μ` is determined only up to a polynomial of degree `≤ |k| − 1` in `log(1 + T)`, and the right side does not depend on this choice because `log η = 0` for `η ∈ μ_{p^n}` and `Σ_η η^{−b} = 0` for `b ∉ p^nℤ_p`. Under (a). In addition: The integral (bounded) unit-support division is PadicMeasuresIwasawaAlgebras §2.3 (Unique unit-supported division by x). (Source: Colmez, §II.4.2 (division par x), Proposition II.4.1, pp. 34–35.)

*Needs:* §1.1 (Operations on distributions); PadicMeasuresIwasawaAlgebras §2.3 (Unique unit-supported division by x).

### 1.2 Series on the open disc

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F (`OnOpenDisc F`) means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1, that is, Mathlib-restricted at every radius below one. Write E(F,t) (`evalOpen`) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1. Its API: E(F,t) = Σ_n a_n t^n as a total sum (`evalOpen_def`), E(F,0) = a_0 (`evalOpen_zero`), E(c,t) = c for a constant series and E(T,t) = t, and additivity and scalar linearity in F for open-disc series and ||t||<1 (`evalOpen_add`).

Source for this subsection unless a target says otherwise: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `PowerSeries.isRestricted_iff'`.

**Open-disc series and the native analytic radius** (comparison; `openDisc_native_radius`). For an open-disc series F, the native scalar formal multilinear series ofScalars(K,coeff(F)) has radius at least 1. E(F,t) is therefore the sum of this native analytic series on ||t||<1. This is an adapter between two existing library encodings, not a second definition of summation or of analyticity. Under (a) and (b).

*Needs:* PadicFunctionalAnalysis §4.7; Mathlib `FormalMultilinearSeries.ofScalars`, `FormalMultilinearSeries.ofScalars_norm`, `FormalMultilinearSeries.le_radius_of_bound`, `FormalMultilinearSeries.ofScalars_sum_eq`.

**Checks.**

- `openDisc_geometric`: ΣT^n satisfies `OnOpenDisc` but is not restricted at radius one.
- `openDisc_polynomial`: T² satisfies `OnOpenDisc`.
- `openDisc_small_radius_failure`: Σ3^(−n)T^n over Q₃ fails `OnOpenDisc`: at radius 1/2 its weighted coefficient norms are (3/2)^n and do not tend to zero.
- `MellinEvalTests.zero_series` (degenerate): E(0, t) = 0 for every t, and E(F, 0) is the constant coefficient (`evalOpen_zero`).
- `MellinEvalTests.geometric`: the series with every coefficient one evaluates to (1 − t)⁻¹ for ‖t‖ < 1.
- `MellinEvalTests.boundary` (non-example): that series is not summable at t = 1, so no evaluation is claimed on the boundary.

**Summability inside the open disc** (lemma; `openDisc_summable`). For every open-disc series F and t∈K with ||t||<1, the series Σ_n a_n t^n is summable in K. Under (a) and (b).

*Needs:* PadicFunctionalAnalysis §4.7; Mathlib `NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`.

**Uniform geometric tails on a smaller disc** (lemma; `evalOpen_tail_bound`). Let `0<R<S<1`, `M≥0`, and `||a_n||S^n≤M` for every n. For `||t||≤R` and `N≥0`, `||E(F,t)−Σ_{n<N}a_n t^n||≤M(R/S)^N`. Thus truncations converge uniformly on the closed radius-R disc; this is a coefficient estimate, with no compactness assumption on that disc. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc).

**Analytic evaluation of an open-disc series** (theorem; `analyticOnNhd_evalOpen`). For every open-disc series F, the function E(F,−):K→K is analytic at every t with ||t||<1, using Mathlib’s AnalyticOnNhd. This does not identify an arbitrary function on C_p-valued points with a rigid analytic function. Under (a) and (b).

*Needs:* §1.2 (Open-disc series and the native analytic radius); Mathlib `FormalMultilinearSeries.analyticOnNhd`.

**Evaluation preserves products inside the disc** (lemma; `evalOpen_mul`). For open-disc series F,H and ||t||<1, E(FH,t)=E(F,t)E(H,t). The corresponding additivity and scalar-linearity follow from summability. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc); Mathlib `HasSum.mul_of_nonarchimedean`.

**Evaluation commutes with an isometric coefficient extension** (lemma; `evalOpen_map`). For an isometric field homomorphism φ:K→K′ into a complete ultrametric field, an open-disc series F and ||t||<1, E(map(φ,F),φ(t))=φ(E(F,t)). The coefficient map is the native PowerSeries.map; no arbitrary C_p-point function or completed distribution-family object is introduced. Under (a) and (b).

*Needs:* §1.2 (Summability inside the open disc); Mathlib `PowerSeries.map`, `PowerSeries.coeff_map`.

### 1.3 Pushforward, convolution and multiplication

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.

**Pushforward of analytic distributions** (construction). For an analytic map f:X→Y of compact p-adic manifolds, define f_*μ as the transpose of the constructed `analyticPullback f`, so (f_*μ)(g)=μ(g∘f). On a target stage h its restriction is μ_(k(f,h)) composed with analyticStagePullback(f,h); compatibility of refinements makes this a projective-limit element. This is a continuous K-linear map D(X,K)→D(Y,K) for the strong dual topologies. Under (a). Its API consists of `distributionPushforward` (Transpose a continuous analytic pullback), `distributionPushforward_apply` (Evaluation is μ applied to pullback) and `distributionPushforward_comp` ((g∘f)_*=g_*∘f_*).

*Needs:* §0.3 (Global analytic pullback and multiplication); §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.pushforward_identity` (compatibility): Transposing the identity returns μ.
- `AnalyticDistributionTests.pushforward_zero` (degenerate): The zero distribution pushes forward to zero.
- `AnalyticDistributionTests.pushforward_constant`: For constant f with value y, f_*μ=μ(1)δ_y.
- `AnalyticDistributionTests.pushforward_derivative`: For f(x)=1+3x on Z_3, f_*(dδ_0)=3dδ_1. Its value on y² is 6; a value-only pushforward model loses this derivative.

**External product of distributions** (construction). `distributionExternalProduct λ μ` is the compatible product-stage functional with coefficients λ(e_i)μ(e_j), transported through the completed analytic tensor equivalence. Its API is `distributionExternalProduct_pure`, `distributionExternalProduct_radius`, `distributionExternalProduct_eval` and `distributionExternalProduct_assoc`; the last follows on dense pure tensors, then by continuous extension. The bounded product-family estimate ensures extension to each complete c₀ stage. Source: Schneider–Teitelbaum §2, Theorem 2.2, pp. 6–7; Colmez §II.4, pp. 34–37. Needs: §0.3 analytic tensors and §0.0 projective limits.

**Checks.**

- `distributionExternalProduct_atoms`: δ_x⊠δ_y=δ_(x,y).
- `distributionExternalProduct_zero`: A zero functional in either factor gives zero, including an empty-manifold factor.
- `distributionExternalProduct_derivatives`: dδ_0⊠dδ_0 takes x y to one and x² to zero. The joint-first-difference or total-mass models give the wrong functional.

**Convolution by iterated analytic evaluation** (construction). For a compact analytic group G, first construct λ⊠μ on LA(G×G) through the completed inductive tensor of §0.3: on a stage pair its coefficient values are λ_h(e_i)μ_k(e_j), a bounded family that extends to the completed projective stage tensor. The compatible stage functionals define the global product distribution. Then push it along group multiplication. Thus (λ*μ)(f)=μ(y↦λ(x↦f(xy))). This defines a distribution; it is associative with unit δ_1. For abelian G it is commutative. For additive Z_p write f(x+y). Under (a). Its API consists of `distributionConvolution` (Push forward the tensor distribution along group multiplication), `distributionConvolution_apply` (Its value is the specified iterated integral) and `distributionConvolution_assoc` (Convolution is associative).

*Needs:* §0.3 (Products and completed analytic tensors); §1.3 `distributionPushforward`.

**Checks.**

- `AnalyticDistributionTests.convolution_atoms`: δ_a*δ_b=δ_ab.
- `AnalyticDistributionTests.convolution_unit` (degenerate): δ_1*μ=μ.
- `AnalyticDistributionTests.convolution_bounded` (compatibility): On imported bounded measures it agrees with their convolution.
- `AnalyticDistributionTests.convolution_derivative`: On additive Z_3, dδ_0*dδ_0=d²δ_0 and takes x² to 2. Restricting convolution to atoms or measures misses this test.

**Multiplication by an analytic function** (construction). For g∈LA(X,K), transpose the constructed analyticMultiplier(g): on a stage h, use μ at a common refinement k≥h,h_g and the coefficient-product map. Hence (gμ)(f)=μ(gf). Multiplication is K-linear in μ, continuous for each fixed g, and satisfies (g₁g₂)μ=g₁(g₂μ). Under (a). Its API consists of `distributionMultiply` (Transpose multiplication on analytic test functions), `distributionMultiply_apply` ((gμ)(f)=μ(gf)) and `distributionMultiply_assoc` (Successive multiplications multiply their analytic factors).

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.multiply_one` (degenerate): 1μ=μ.
- `AnalyticDistributionTests.multiply_atom`: gδ_x=g(x)δ_x.
- `AnalyticDistributionTests.multiply_derivative`: x·dδ_0=δ_0 (the positive derivative convention). Multiplication by the scalar x(0)=0 would give the wrong answer.
- `AnalyticDistributionTests.multiply_bounded` (compatibility): For bounded μ and continuous g this agrees with imported bounded-measure multiplication.

### 1.4 The Amice dictionary for the standard operators

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.

**Amice transform of a point mass** (supplier). For a ∈ ℤ_p, A(δ_a) = (1 + T)^a, with nth coefficient binom(a, n). Supplied by PadicFunctionalAnalysis §4.7 (the roadmap of W. Coram).

**Checks.**

- δ_0 has transform 1.
- δ_1 has transform 1+T.
- δ_(−1) has coefficients (−1)^n, which are bounded at every stage.

**Unbounded Amice convolution identity** (supplier). For λ, μ ∈ D(ℤ_p, K), A(λ ∗ μ) = A(λ)A(μ) in the algebra of series on the open unit disc, without boundedness of coefficients. Supplied by PadicFunctionalAnalysis §4.7 (the roadmap of W. Coram). There the convolution is the additive convolution on ℤ_p; this roadmap's §1.3 `distributionConvolution` for G = ℤ_p is the same iterated integral (λ ∗ μ)(f) = μ(y ↦ λ(x ↦ f(x + y))), so the identity applies to it.

**Checks.**

- δ_0 is the convolution identity.
- δ_a*δ_b transforms to (1+T)^(a+b).
- Convolution with the zero distribution gives zero.

**Coordinate multiplication under Amice** (lemma). A(xμ)=(1+T)·dA(μ)/dT for any locally analytic distribution μ, with the native formal-series derivative interpreted analytically on the open disc. Under (a).

*Needs:* §1.3 `distributionMultiply`; PadicFunctionalAnalysis §4.7.

**Additive character twist under Amice** (lemma). If |z−1|<1, then A(z^x μ)(T)=A(μ)(z(1+T)−1). The substitution maps the open unit disc to itself; z^x is locally analytic after a sufficiently small radius choice. Under (a).

*Needs:* §1.3 `distributionMultiply`; PadicFunctionalAnalysis §4.7; §0.3 (A common analytic radius on a compact manifold).

**Fourier formula for clopen restriction** (lemma). After extending K to contain μ_(p^n), A(1_(b+p^nZ_p)μ)(T)=p^(−n)Σ_(η^(p^n)=1)η^(−b)A(μ)(η(1+T)−1). The finite character average descends to K and is independent of the integer representative b. Under (a). (Source: Colmez, §II.4.3 and Proposition II.4.1, printed p. 35; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionMultiply`; §1.4 (Additive character twist under Amice).

**The transpose derivative and logarithm** (lemma). With the convention (dμ)(f)=μ(f′), A(dμ)=log(1+T)A(μ). No integration-by-parts minus sign is used. Under (a).

*Needs:* PadicFunctionalAnalysis §4.7; PadicFunctionalAnalysis §4.3 (`LA_h`).

**Dilation and the φ operator** (lemma). For a∈Z_p, pushforward along x↦ax sends A(μ)(T) to A(μ)((1+T)^a−1). For a=p this is φ; for a=0 it is the constant series μ(1). Under (a). (Source: Colmez, §II.4.5, printed pp. 35–36; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionPushforward`; PadicFunctionalAnalysis §4.7.

**The ψ operator and support on units** (lemma). Define ψμ by first restricting μ to pZ_p, then pushing forward under x↦x/p. Then ψφ=1, φψ is restriction to pZ_p, and μ−φψμ is restriction to Z_p^×. Thus ψμ=0 exactly when μ is supported on Z_p^×. Under (a). (Source: Colmez, §II.4.5, printed p. 36; derived from the cited passage, not printed there.)

*Needs:* §1.4 (Dilation and the φ operator); §1.3 `distributionMultiply`; §1.3 `distributionPushforward`.

**Canonical coordinate division away from zero** (lemma). If μ is supported on Z_p^×, multiplication by x is continuously invertible on that support, with inverse μ↦x^(−1)μ. In the full space D(Z_p,K), coordinate division has ambiguity Kδ_0, as already specified by the primitive construction. Under (a).

*Needs:* §1.3 `distributionMultiply`; §1.1 (Division by x, primitives and logarithmic factors); §1.4 (The ψ operator and support on units).

### 1.5 Primitives, non-splitting and logarithmic factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

**Local primitives with a radius loss** (lemma). Every analytic function on a closed p-adic disc admits a primitive on each strictly smaller closed disc; every locally analytic function on compact Z_p admits a locally analytic primitive. The kernel of d/dx on LA(Z_p,K) is the locally constant functions. Under (a). (Source: Colmez, §I.5, Proposition I.5.16, printed pp. 24–25; Kohlhaase Corollary 4.3, printed p. 21; derived from the cited passage, not printed there.)

*Needs:* §0.1 `discAnalytic`; §0.3 (A common analytic radius on a compact manifold).

**No continuous section of analytic differentiation** (theorem). For finite K/Q_p, the continuous surjection d/dx:LA(Z_p,K)→LA(Z_p,K), with kernel LC(Z_p,K), has no continuous K-linear right inverse. Under (a). (Source: Kohlhaase, §4, Proposition 4.2 and Corollary 4.3, printed pp. 20–21; derived from the cited passage, not printed there.)

*Needs:* §1.5 (Local primitives with a radius loss); §0.3 (Strong duality for analytic compact-type spaces).

**The nonsplit logarithm sequence** (theorem). Under unbounded Amice duality, the transpose of differentiation is multiplication by t=log(1+T). The sequence 0→tR⁺→R⁺→R⁺/tR⁺→0 is strict exact and has no continuous K-linear splitting, where R⁺=O(D(0,1)^−) has its Fréchet topology. Under (a). (Source: Colmez–Nizioł, Appendix A, Remark A.6, printed p. 59; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §1.5 (No continuous section of analytic differentiation); §0.3 (Strong duality for analytic compact-type spaces).

**Cancellation in logarithmic derivative quotients** (lemma). If ν=dμ, then A(ν)/log(1+T) extends analytically to A(μ), including every p-power torsion zero of the logarithm. General ν need not be divisible by log(1+T), so a distribution primitive is not automatic. Under (a). (Source: Colmez, §II.4, printed pp. 34–37; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §1.2 (Evaluation preserves products inside the disc).

### Examples

The Amice transform of `δ_a` is `(1+T)^a`; the derivative transposes to multiplication by `log(1+T)` and multiplication by x to `(1+T)·d/dT`; `ψ ∘ φ` is the identity while `φ ∘ ψ` restricts to `pℤ_p`; the series `log(1+T)` has every radius below one but is not restricted at radius one; `δ₀` is a bounded measure supported outside the units and `x·δ₀=0`, so coordinate multiplication on all distributions is not injective. The putative series `Σ_{n≥0} p^{−n}δ_{p^n}` does not define a distribution: its evaluation on the constant function 1 would be a divergent p-adic series.

### Dependencies

Layer 0 (stages, distributions, charts); Mathlib `PowerSeries`, `AbstractMeasure.amiceTransform`; PadicMeasuresIwasawaAlgebras Layer 2 (bounded Amice transform, φ, ψ, dilation, residue restriction) and §3.1 (pseudo-measures); PadicFunctionalAnalysis §4.7 (the unbounded Amice transform, point masses and convolution).

## Layer 2: admissible growth, vector order and uniqueness

This layer defines admissibility. Colmez's spaces of functions of class `C^r` and the distributions of order `r` are defined on `ℤ_p` by explicit norm estimates; order zero is identified with bounded measures; the Amice–Vélu–Vishik theorem extends a distribution from locally polynomial test functions of degree below the order and proves the strict degree bound is sharp. In several variables the vector order is defined by the completed tensor of one-variable `C^{r_i}` spaces, with rectangular growth bounds, extension and uniqueness theorems, the critical counterexample, and the adapters that turn conductor-indexed growth bounds into analytic ray-class distributions. Proposed home: `TauCeti/NumberTheory/Padics/LocallyAnalytic` and `TauCeti/NumberTheory/Padics/AnalyticDistributions`.

### 2.1 Functions of class C^r and distributions of order r

Hypotheses shared by several targets of this subsection, cited by letter below: (a) L ⊆ ℂ_p is a closed subfield (a finite extension of ℚ_p in applications), v_p the valuation with v_p(p) = 1, and ℓ(n) the number of base-p digits of n (ℓ(0) = 0).

**Functions of class `C^r`** (definition). For `r ≥ 0`, `φ : ℤ_p → L` is of class `C^r` if there are `φ^{(j)}` (`0 ≤ j ≤ [r]`) with `ε(x, y) = φ(x + y) − Σ_{j≤[r]} φ^{(j)}(x)y^j/j!` satisfying `inf_{x∈ℤ_p, y∈p^hℤ_p}(v_p(ε(x, y))) − rh → +∞`. `C^r(ℤ_p, L)` is an L-Banach space (valuation `v′_{C^r}`), equivalently normed by `v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n))` on Mahler coefficients, with Banach bases `p^{[rℓ(n)]}C(x, n)` and the wavelet basis `e_{i,k,r}` (`i ∈ ℕ`, `0 ≤ k ≤ [r]`) of locally polynomial functions of degree `≤ [r]`. In particular locally polynomial functions of degree `≤ [r]` are dense in `C^r`, `LA_h ⊂ C^r` with `v_{C^r}(φ) ≥ v_{LA_h}(φ) − rh − C₁(r)`, and `C⁰` is the space of continuous functions. Under (a). Its API consists of `Cr` (`C^r(ℤ_p, L)` with `v_{C^r}`), `Cr_mahler` (`φ ∈ C^r` iff `v_p(a_n(φ)) − rℓ(n) → +∞`) and `locallyPolynomial_dense_Cr` (`LP^{[0,[r]]}` is dense in `C^r`). (Source: Colmez, §I.5.1, Theorem I.5.14, Propositions I.5.13 and I.5.19, Theorem I.5.17, pp. 18–25.)

*Needs:* PadicFunctionalAnalysis §4.4; Mathlib `PadicInt.mahlerEquiv`.

**Checks.**

- `Cr_zero_eq_continuous`: C⁰ = continuous functions.
- `Cr_mahler_iff`: At p=3 and r=1, the continuous function with Mahler coefficients a_(3^k)=3^k and all other coefficients zero fails the C¹ criterion: ℓ(3^k)=k+1 and v_3(a_(3^k))−ℓ(3^k)=−1 for every k. At r=0 these coefficients do tend to zero, so the same function is continuous.
- `digit_doubling_not_C2` (non-example): For x=Σ a_n p^n, 0≤a_n<p, set d(x)=Σ a_n p^(2n). Differences have valuation at least twice the input difference valuation, so d is C¹ with derivative zero. It is not C²: at p=3, d(3^h)/(3^h)^2=1 whereas d(2·3^h)/(2·3^h)^2=1/2. A C² Taylor coefficient at zero would have to be both limits. At p=2 the corresponding ratios for 2^h and 3·2^h are 1 and 5/9. This checks the specified digit function rather than just its name.

**Differentiation and primitives in `C^r`** (theorem). For `r≥1`, `d/dx:C^r(ℤ_p,L)→C^{r−1}(ℤ_p,L)` is continuous and surjective. Its kernel is the closure, in `C^r`, of locally constant functions; primitives are therefore unique up to this closure. Under (a). (Source: Colmez, Proposition I.5.16, printed p. 24.)

*Needs:* §2.1 `Cr` and its Mahler basis.

**Distributions of order r (admissible distributions)** (definition). For `r ≥ 0`, a distribution `μ ∈ D(ℤ_p, L)` has order r (is `r-admissible`, or `h-admissible` with `h = r`) if it extends continuously to `C^r(ℤ_p, L)`; `D_r(ℤ_p, L) = C^r(ℤ_p, L)′`. The following are equivalent: (a) `μ ∈ D_r`; (b) the Amice transform `A_μ = Σ b_nT^n` has `v_p(b_n) + rℓ(n)` bounded below (`A_μ ∈ R⁺_r`); (c) `inf_h(v_{B(0,u_h)}(A_μ) + rh) > −∞`; (d) `v_{D_r}(μ) = inf_n(v_{LA_n}(μ) + rn) > −∞`, i.e. `‖μ‖_{LA_n} = O(p^{rn})` (on the ball of radius `p^{−n}`); (e) there is C with `v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn` for all a ∈ ℤ_p, k, n. The valuations of (b)–(e) are equivalent to `v′_{D_r}`, and `μ ↦ A_μ` is an isometry `(D_r, v′_{D_r}) ≅ (R⁺_r, v_r)`. Orders add under products of transforms and under convolution. Under (a). In addition: Pollack–Stevens' '`h-admissible`' (`‖μ‖_s = O(s^{−h})` as `s → 0⁺`, their Definition 6.1) is (d) with `r = h`, `s = p^{−n}`; this is the form in which the p-adic L-functions of modular symbols use it. `log(1 + T)` has order 1; its powers `log(1 + T)^j` have order j. Its API consists of `DistOrder` (`D_r(ℤ_p, L) = C^r(ℤ_p, L)′` inside `D(ℤ_p, L)`), `mem_distOrder_iff_amice` (`μ ∈ D_r` iff `v_p(b_n) + rℓ(n)` is bounded below), `mem_distOrder_iff_growth` (`μ ∈ D_r` iff `inf_n(v_{LA_n}(μ) + rn) > −∞` (Pollack–Stevens' h-admissibility)) and `mem_distOrder_iff_riemann` (`μ ∈ D_r` iff the Riemann-sum bound holds). (Source: Colmez, §II.1, Lemma II.1.1, §II.3.1, Proposition II.3.1, Theorem II.3.2(i), Proposition II.3.3, pp. 29–34.)

*Needs:* §2.1 `Cr`; PadicFunctionalAnalysis §4.7; PadicFunctionalAnalysis §4.7.

**Checks.**

- `dirac_order_zero`: δ_a has order 0.
- `log_order_one`: log(1 + T) has order exactly 1.
- `infinite_order_example` (non-example): `b_{p^k} = p^{−k²}` gives a distribution of no finite order.

**Order zero is bounded measures** (theorem). `D₀(ℤ_p, L) = C⁰(ℤ_p, L)′` is the space of bounded measures, and its Amice transforms are exactly the bounded power series `𝒪_L⟦T⟧ ⊗ L`. A measure is determined by the values `μ(a + p^nℤ_p)`, and conversely any family `μ(a + p^nℤ_p)` that depends only on `a mod p^n`, is additive (`μ(a + p^nℤ_p) = Σ_{j<p} μ(a + jp^n + p^{n+1}ℤ_p)`) and bounded below in valuation defines a unique measure, with `∫φ μ = lim_n Σ_{a<p^n} φ(a)μ(a + p^nℤ_p)`. Under (a). In addition: Bounded measures and their integral/bounded Amice transform are PadicMeasuresIwasawaAlgebras'; this target identifies them with the order-0 part of D. (Source: Colmez, §II.3.2, pp. 31–32.)

*Needs:* §2.1 `DistOrder`; PadicMeasuresIwasawaAlgebras §2.5 (The bounded-coefficient inverse Amice transform); PadicMeasuresIwasawaAlgebras Layer 0.

**Check.** The normalized locally constant Haar functional has masses p^(−n), satisfying subdivision additivity. At p=3 their norms are 3^n and unbounded, so additivity alone does not make it a bounded measure.

**The Amice–Vélu–Vishik extension and uniqueness theorem** (theorem). Let `r ≥ 0` and `N ∈ ℕ ∪ {∞}` with `N ≥ [r]`. Let μ be a linear form on the locally polynomial functions of degree `≤ N` (equivalently, compatible values `∫_{a+p^nℤ_p} x^i μ` for `i ≤ N`) such that for some C, `v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn` for all `a ∈ ℤ_p`, `k ≤ N`, `n ∈ ℕ`. Then μ extends uniquely to a distribution of order r. In particular two distributions of order r that agree on locally polynomial functions of degree `≤ N` coincide when `N ≥ [r]`, i.e. when `r < N + 1`. For `r = N + 1` uniqueness fails: `d^{N+1}δ₀` (`φ ↦ φ^{(N+1)}(0)`) is a nonzero distribution of order `N + 1` vanishing on all locally polynomial functions of degree `≤ N`. Under (a). In addition: The strict threshold `r < N + 1` is the small-slope condition `h < k + 1` for overconvergent modular symbols with coefficients in `Sym^k` (`N = k`, `r = h`; Pollack–Stevens); at critical slope `h = k + 1` this theorem does not apply. The anisotropic extension uses the separate conductor bounds of §2.2. (Source: Colmez, Theorem II.3.2 and its proof, pp. 32–33; RJW, Theorem B.1 and the remarks after it, pp. 79–80.)

*Needs:* §2.1 `DistOrder`; §2.1 `Cr`.

### 2.2 Vector order: tensor wavelets and rectangular growth

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Loeffler, §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5; derived from the cited passage, not printed there.

**Tensor wavelets and vector order** (construction). For `G=Z_p^g` and `r_i≥0`, the vector-order function space is `⊗̂_π,i C^{r_i}(Z_p,K)`, using the Colmez `C^r` spaces. Tensor products of Colmez wavelets form a Banach basis; for `0≤r_i<1` their indicator wavelets have scaling `p^(Σ_i floor(r_iℓ(n_i)))`. The coefficient norm is the c₀ sup norm in this scaled basis. This contract uses the intended tensor construction, not Loeffler Definition 2.12’s literal cofinite oscillation formula. Under (a). Its API consists of `anisotropicFunctionSpace` (The completed projective tensor of the one-variable `C^{r_i}` spaces), `anisotropicFunctionSpace_pure` (Finite pure tensors map to products of their actual one-variable functions) and `anisotropicFunctionSpace_basis` (Its tensor-wavelet coefficient map is a Banach equivalence with native c₀).

*Needs:* §2.1 `Cr`; §0.3 (Products and completed analytic tensors).

**Checks.**

- `AnalyticDistributionTests.anisotropic_order_zero` (compatibility): For r=(0,0), the tensor function space is C⁰(Z_p²,K).
- `AnalyticDistributionTests.anisotropic_empty` (degenerate): The empty tensor product is K.
- `AnalyticDistributionTests.anisotropic_one_coordinate`: With r=(1/2,0), the function 1_(pZ_p)(x₂) belongs as 1⊗1_(pZ_p).

**Rectangular locally constant wavelets** (lemma). When every 0≤r_i<1, the tensor wavelets of the preceding comparison are scaled characteristic functions of rectangular p-power cosets and form a Banach basis. Locally constant functions are dense in the vector-order function space. Under (a).

*Needs:* §2.2 `anisotropicFunctionSpace`.

**Rectangular growth for a locally constant functional** (definition). For a K-linear functional μ on `LC(Z_p^g,K)`, rectangular growth `≤r` means there is `C≥0` such that `|μ(1_(a+∏_i p^{m_i}Z_p))|≤C·p^(Σ_i r_i m_i)` for every a and every tuple `m_i≥0`, where the box `a+∏_i p^{m_i}Z_p` is `padicBox` a m (clopen by `padicBox_isClopen`) and its indicator is `boxIndicator` a m. This is a bound on actual clopen indicators and includes finite additivity earlier from linearity. Under (a). Its API consists of `RectangularGrowth` (The displayed uniform bound on all rectangular cosets), `rectangularGrowth_mono` (Increasing each component `r_i` preserves the bound) and `rectangularGrowth_add` (A sum of two bounded-growth functionals has the same growth order with a larger constant).

*Needs:* §2.2 `anisotropicFunctionSpace`.

**Checks.**

- Indicator at the centre: boxIndicator a m a=1, including dimension zero.
- Depth zero: padicBox a (fun _ => 0)=Set.univ, including dimension zero.
- Outside the box: At depth one in every coordinate, replacing a_i by a_i+1 gives indicator zero for every chosen i.
- `AnalyticDistributionTests.rectangularGrowth_dirac`: A point mass has growth r for every r_i≥0, with C=1.
- `AnalyticDistributionTests.rectangularGrowth_zero` (degenerate): The zero functional has C=0.
- `AnalyticDistributionTests.rectangularGrowth_refinement` (compatibility): A box mass equals the sum of its p children in a chosen coordinate.

**Normalized locally constant Haar functional on Z₃** (construction). `exists_locallyConstantHaar` supplies a Q₃-linear functional on LC(Z₃,Q₃), using the one-coordinate model Fin 1→Z₃, whose mass on every depth-m residue ball is 3^(−m). For each locally constant f choose a residue level n through which f factors, and average its 3^n values with the factor 3^(−n); refinement leaves this average unchanged. These averages define `locallyConstantHaar`; indicators span LC, so the ball masses determine it uniquely. The API `locallyConstantHaar_ball` gives the mass formula and `locallyConstantHaar_unique` gives its uniqueness. This is a locally constant functional, with no bounded-measure or continuous C⁰-dual assertion. Needs: Mathlib `PadicInt.toZModPow`, `LocallyConstant.range_finite`, compactness of Z₃ and its p-power ball basis, and `boxIndicator`; compactness gives one finite residue level for each locally constant function. Source: Loeffler §2.2, Definition 2.8, p. 4, for the growth test; the compatible finite-quotient average and its formula are derived here.

**Checks.**

- `haar_constant`: The constant function one has value one.
- `haar_ball`: A depth-m ball has mass 3^(−m) and norm 3^m; in particular a depth-one ball has norm 3, not 1/3.
- `haar_refinement`: Each ball is the union of three children of mass 3^(−m−1), whose sum is 3^(−m).
- Rectangular Haar growth one: The constructed Haar functional has rectangular growth one.
- Rectangular Haar growth zero: It has no rectangular growth zero.
- Subcritical rectangular Haar growth (`haar_subcritical`): For every 0≤r<1 it has no rectangular growth r, since 3^m cannot be bounded by C3^(rm).

**Extension of rectangular distributions** (theorem). For 0≤r_i<1, every locally constant functional with rectangular growth ≤r extends uniquely to a continuous functional on the tensor vector-order function space. Its norm is bounded in terms of the growth constant and the fixed wavelet normalization. Under (a).

*Needs:* §2.2 `RectangularGrowth`; §2.2 (Rectangular locally constant wavelets).

**Growth forced by the tensor dual norm** (lemma). A continuous functional on the tensor `C^{r_i}` space with every `r_i<1` restricts to a locally constant functional with rectangular growth `≤r`. Together with the extension theorem this characterizes the tensor dual by its box values and refinement relations. Under (a).

*Needs:* §2.2 (Rectangular locally constant wavelets); §2.2 `RectangularGrowth`.

**Compatible quasi-factor chart invariance** (lemma). For a compact abelian p-adic Lie group whose Lie algebra has a chosen direct-sum decomposition, vector growth and tensor function spaces are independent of the compatible closed subgroups with open product and of compatible analytic coordinates, up to equivalent norms. Chart changes must preserve the chosen summands. Under (a).

*Needs:* §2.2 `anisotropicFunctionSpace`; §2.2 `RectangularGrowth`; §0.3 (Independence of the analytic atlas).

**Multidegree admissibility and uniqueness** (theorem). Let `N_i≥0` and `0≤r_i<N_i+1`. A functional on locally polynomial functions of separate degree `≤N_i` extends uniquely to the tensor `C^{r_i}` dual if there is a uniform `C≥0` such that, for each rectangular box `a+∏_i p^{m_i}Z_p`, with independently varying `m_i≥0`, and multi-index `0≤j_i≤N_i`, its unnormalized local moment obeys `|μ(1_box·∏(x_i−a_i)^{j_i})|≤C·p^(Σ_i(r_i−j_i)m_i)`. Extra degrees above `floor(r_i)` satisfy this bound but are not needed for density. Under (a). (Source: Loeffler, Remark 2.13 and Theorem 2.15, printed p. 5; tensor deduction from Colmez Theorem II.3.2, printed pp. 32–33; derived from the cited passage, not printed there.)

*Needs:* §2.1 (The Amice–Vélu–Vishik extension and uniqueness theorem); §2.2 `anisotropicFunctionSpace`.

**Checks.**

- For g=1 the rectangular condition is the one-variable moment bound of §2.1.
- With every N_i=0 and r_i<1 it is exactly `RectangularGrowth`, including unequal depths such as (m₁,m₂)=(n,0).
- At r=(1/4,1/4), prescribe value p^(−2k) on one unscaled tensor wavelet of depth (4k,0) for each k≥1, and zero on the others. This defines an isotropic order-1/2 functional, hence has equal-depth growth 1/2, but its tensor-weighted values have norms p^k and are unbounded. Equal-depth moments therefore do not suffice, as in `growth_equal_radius_only`.

### 2.3 Uniqueness, the critical case and ray-class adapters

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

**Determination by finite characters and polynomial moments** (lemma). A tensor distribution of order r with `r_i<N_i+1` is determined by all moments `χ(x)∏x_i^{j_i}` with finite-order χ of `Z_p^g` and `0≤j_i≤N_i`, after a finite splitting-field coefficient extension. These functions span the locally polynomial test spaces at each finite residue level. Under (a). (Source: Loeffler, §2.3, Definitions 2.11–2.14, Remark 2.13 and Theorem 2.15, printed pp. 4–5; derived from the cited passage, not printed there.)

*Needs:* §2.2 (Multidegree admissibility and uniqueness).

**Failure at a critical coordinate order** (lemma). If `r_i=N_i+1` in one coordinate, the tensor functional `d_i^{N_i+1}δ_0` is nonzero, continuous of that order, and annihilates all separately locally polynomial tests of degree `≤N_i` in that coordinate. Thus uniqueness from that test class fails at the endpoint. Under (a). (Source: Loeffler, §2.2, Remark 2.10, printed p. 4; roadmap tensor counterexample using Colmez §II.4.4; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §2.1 `DistOrder`; §2.2 `anisotropicFunctionSpace`.

**Small-order isotropic functions** (construction; `isotropicFunctionSpace`). Let `g≥0` and `0≤r<1`. On continuous K-valued functions on `Z_p^g` set `osc_m(f)=sup_{x∈Z_p^g,y∈p^mZ_p^g} ‖f(x+y)−f(x)‖`. Require `p^(rm)osc_m(f)→0` and use the norm `max(‖f‖∞, sup_m p^(rm)osc_m(f))`. This is a Banach space. The tensor products of the one-variable van der Put indicators, scaled by `p^(floor(r·max_i ℓ(n_i)))`, give a Banach basis with an equivalent coefficient sup norm and c₀ coefficients; the empty maximum is zero. Locally constant functions are dense. For a compact abelian p-adic analytic group with a chosen open `Z_p^g` subgroup, take the finite product over its cosets. API: `isotropicFunctionSpace_basis` (the scaled indicator coefficient equivalence), `isotropicFunctionSpace_locallyConstant_dense` and `isotropicFunctionSpace_one_variable` (agreement with §2.1 `C^r` up to equivalent norms). Under (a). Source: Loeffler, Definition 2.5, Remarks 2.6–2.7, printed p. 3, and proof of Theorem 2.9, printed p. 4.

*Needs:* §2.1 `Cr` and its small-order wavelets; Mathlib `LocallyConstant` and native c₀ completeness.

**Checks.**

- `isotropic_one_variable`: For g=1 the weight is p^(floor(rℓ(n))), agreeing with the small-order C^r basis.
- `isotropic_zero`: At r=0 the space is C⁰(Z_p^g,K); for g=0 it is K.
- `isotropic_weight_diagonal`: At g=2, r=1/2 and ℓ(n_1)=ℓ(n_2)=2k, the scaling exponent is k, while tensor order (1/2,1/2) has exponent 2k.

**Equal-radius growth and unique isotropic extension** (theorem). For 0≤r<1, a K-linear functional μ on LC(Z_p^g,K) has `IsotropicGrowth μ r` when some C≥0 satisfies ‖μ(1_(a+p^mZ_p^g))‖≤C p^(rm) for every a and m≥0. This is equivalent to the existence of a unique continuous K-linear extension to `isotropicFunctionSpace` of order r. Its norm is bounded by a constant depending only on the wavelet normalization times C. Equal-depth refinement expresses each tensor indicator box as a finite union of balls at depth max_i ℓ(n_i); the ultrametric triangle inequality bounds its mass, so the scaled basis values are bounded. API: `isotropicGrowth_mono`, `isotropicGrowth_add` and `isotropicExtension`. For a compact abelian group use all cosets of the chosen open subgroup. Under (a). Source: Loeffler, Definition 2.8, Theorem 2.9 and proof, printed p. 4; the restriction in its conclusion is to LC(G,K).

*Needs:* §2.3 `isotropicFunctionSpace`; §2.2 `boxIndicator`; density and the bounded coefficient dual of native c₀.

**Checks.**

- Isotropic Haar growth one: `locallyConstantHaar` has isotropic growth one.
- Isotropic Haar growth zero: It has no isotropic growth zero.
- Subcritical isotropic Haar growth (`haar_subcritical`): For every 0≤r<1 it has no isotropic growth r, by the same depth-m ball masses.
- Zero functional: The bound has C=0 at every equal-radius order.
- Isotropic point mass: A point mass has growth r≥0 with C=1 and extends to point evaluation.
- `isotropic_zero_order`: At r=0 the extension is exactly the imported bounded measure, with its original locally constant values.
- `isotropic_endpoint` (non-example): At r=1 on Z_p, dδ_0 vanishes on all locally constant functions but takes x to 1. Uniqueness among order-one distributions cannot follow from those values.

**Isotropic coordinates and locally analytic distributions** (comparison). For 0≤r<1, analytic changes of coordinates between compact charts induce continuous pullbacks with continuous inverse on the isotropic spaces; compatible choices of open subgroup and finite coset atlas on a compact abelian group therefore give equivalent norms. Compact analytic coordinate changes are uniformly locally Lipschitz in both directions, so conductor depths change by bounded constants. Each locally analytic Banach stage maps continuously into `isotropicFunctionSpace`, and LA is dense there by locally constant density. Restriction of its continuous dual is consequently an injective map to D(G,K), compatible with coordinate changes and with the equal-radius extension. API: `isotropicFunctionSpace_chart_equiv`, `locallyAnalytic_to_isotropic` and `isotropicDual_to_distribution`. Under (a). Source: Loeffler, §2.2, Definition 2.5 and the paragraph and footnote before Remark 2.7, printed p. 3; stage comparison derived from the small-order oscillation estimate.

*Needs:* §2.3 `isotropicFunctionSpace`; §0.3 (Independence of the analytic atlas); §0.3 (A common analytic radius on a compact manifold).

**Checks.**

- `isotropic_chart_scale`: Pullback along Z_p→pZ_p changes conductor depth by one and gives equivalent norms, rather than an isometry for r>0.
- `isotropic_chart_mix`: The automorphism (x,y)↦(x+y,y) preserves the equal-radius filtration; no quasi-factor decomposition is needed.
- `isotropic_distribution_dirac`: The dual injection sends point evaluation to δ_a, and for a one-point group both spaces and the map are K.

**Isotropic and vector growth bounds differ** (comparison). For 0≤r<1 and 0≤r_i<1, the isotropic order-r norm on Z_p^g weights a multivariate locally constant wavelet by p^(floor(r·max_iℓ(n_i))); tensor vector order weights by p^(Σ_i floor(r_iℓ(n_i))). Their extension criteria use, respectively, equal-radius cosets and all rectangular cosets. They must not be identified merely by r=Σ_i r_i. Under (a). (Source: Loeffler, §2.2, Definition 2.5 and Theorem 2.9, printed pp. 3–4; §2.3, p. 5; derived from the cited passage, not printed there.)

*Needs:* §2.3 `isotropicFunctionSpace`; §2.3 (Equal-radius growth and unique isotropic extension); §2.2 `anisotropicFunctionSpace`; §2.2 `RectangularGrowth`.

**Checks.**

- `growth_norms_one_dimension`: In dimension one the two spaces agree when r=r_1.
- `growth_norms_equal_sum`: At r=1/2 and vector order (1/4,1/4), depths (4k,0) give isotropic scaling exponent 2k and tensor exponent k, despite equal total order.
- `growth_equal_radius_only`: The equal-radius hypothesis supplies no separate bound C p^(Σ_i r_i m_i) for arbitrary rectangular exponents and a prescribed vector r.

**Rectangular growth from a subgroup filtration** (adapter; `filtration_rectangularGrowth`). Let G be a compact abelian p-adic Lie group with a specified group chart Z_p^g≃L onto an open subgroup, a finite index set P, and decreasing cofinal open subgroups H_n indexed by n∈N^P. Let μ be a K-linear locally constant functional on G with ‖μ(1_(a+H_n))‖≤C p^(Σ_𝔭 s_𝔭 n_𝔭), uniformly in a,n, where C≥0 and s_𝔭≥0. Assume specified c∈N^P and b∈N^(P×g) satisfy H_(c+Bm)⊆chart(∏_i p^(m_i)Z_p) for every m∈N^g. Finite subdivision into H_(c+Bm)-cosets and the ultrametric inequality give rectangular orders r_i=Σ_𝔭 s_𝔭 b_𝔭i, with the fixed c absorbed in the constant. The chart and uniform containments are hypotheses. Arithmetic applications supply G, the filtration and these containments. Source: Loeffler §3.4, Example 3.12, p. 10; the abstract filtration adapter is derived here.

*Needs:* §2.2 `RectangularGrowth`, compatible quasi-factor chart invariance and locally constant finite additivity.

**Checks.**

- `filtration_chart_split_quadratic`: For a supplied split imaginary-quadratic chart and identity depth matrix, the orders are (s₁,s₂).
- `filtration_chart_cubic`: For the supplied chart and containments of Loeffler Example 3.12, the matrix rows (1,0),(0,1),(1,1) give (s₁+s₃,s₂+s₃).
- `filtration_chart_zero`: If every s_𝔭=0, the rectangular orders are zero, independent of the depth matrix.

**Analytic extension from a subgroup filtration** (comparison; `filtration_analyticExtension`). With G, μ, H_n and their uniform growth bound as above, assume specified c,e∈N^P satisfy H_(c+em)⊆chart(p^mZ_p^g) for all m≥0. Then μ has equal-radius order r=Σ_𝔭 e_𝔭s_𝔭. For 0≤r<1, `isotropicExtension` and `isotropicDual_to_distribution` give a locally analytic distribution. Alternatively the rectangular adapter gives extension when each r_i∈[0,1). A ray-class application must supply its Lie quotient, conductor filtration, chart and these containments; prime-ideal growth v_p(μ(class modulo ∏𝔭^(n_𝔭)))≥C′−Σ_𝔭 v_p(α_𝔭)n_𝔭 then uses s_𝔭=v_p(α_𝔭). The logarithmic comparison, when supplied, has e_𝔭 the ramification index and counts ramification once. Under (a). Source: Loeffler Definitions 3.1–3.2 and proof of Theorem 3.3, pp. 6–7; Example 3.12 for the rectangular distinction.

*Needs:* §2.3 `filtration_rectangularGrowth`; §2.2 (Extension of rectangular distributions); §2.3 (Equal-radius growth and unique isotropic extension), (Isotropic coordinates and locally analytic distributions), and (Isotropic and vector growth bounds differ); PadicMeasuresIwasawaAlgebras Layer 0.

**Checks.**

- `filtration_growth_dimension_one`: A one-dimensional supplied filtration with r<1 agrees with the one-variable extension.
- `filtration_growth_ramification`: With the supplied containment at conductor depth c+2m and prime order s, the isotropic order is 2s, not 4s.
- `filtration_growth_zero`: A bounded input extends to its original bounded measure along either applicable route.
- `filtration_growth_endpoint`: Equal-radius order r=1 cannot use unique isotropic extension; dδ_0 gives the one-dimensional boundary obstruction.

**A positive-order distribution that is not a measure** (lemma). dδ_0 on Z_p is an order-one locally analytic distribution and is not a bounded measure. In particular positive-order family tests cannot be satisfied by a construction containing bounded measures alone. Under (a). (Source: Colmez, §II.3, Proposition II.3.1, printed p. 31; §II.4.4, printed p. 35; derived from the cited passage, not printed there.)

*Needs:* §1.4 (The transpose derivative and logarithm); §2.1 `DistOrder`; §2.1 (Order zero is bounded measures).

### Examples

`δ_0` has order 0; the distribution `f ↦ f′(0)` has order 1 and is not a measure; the digit-doubling function is `C¹` but not `C²`; for `r = (1/2, 0)` on `ℤ_p²` the locally constant tensor `1 ⊗ 1_{pℤ_p}` has finite rectangular growth although the naive joint first-difference condition fails; at a critical coordinate order the functional `d_i^{N_i+1}δ_0` annihilates the prescribed polynomial class.

### Dependencies

Layers 0 and 1; Mathlib `LocallyConstant`, `PadicInt.mahlerEquiv`; PadicMeasuresIwasawaAlgebras Layers 0 and 2.

## Layer 3: character spaces and Mellin transforms

This layer applies the compact abelian character geometry and scalar Mellin isomorphism supplied by PhiGammaModulesAndIwasawaCohomology §4.0 to the manifold distribution spaces of Layer 0. On each finite-character component the Mellin transform of a bounded measure is a power series bounded on the open disc; arithmetic branches ω^i⟨x⟩^s and clearing factors make the meromorphic functions of pseudo-measures explicit. The distribution applications include the strong/projective-limit topology comparison, boundedness, evaluation, multiplicativity, generator change, weight analyticity and differentiation, twists, functoriality, finite coefficient extension and the comparison through AdicSpacesPartII’s rigid–adic functor. Proposed home: `TauCeti/NumberTheory/Padics/Mellin` and `TauCeti/NumberTheory/Padics/AnalyticDistributions`.

### 3.1 Component Mellin series of bounded measures

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F (`OnOpenDisc F`) means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1, that is, Mathlib-restricted at every radius below one. Write E(F,t) (`evalOpen F t`) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

Source for this subsection unless a target says otherwise: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).

**Mellin series on a finite-character component** (construction). Let G be compact and let `H:G≃Δ×Z_p` be an imported character chart, Δ a finite discrete set. Let `ν:Δ→K` be the finite-character value function (the formula also makes sense for any ν). For a native bounded measure μ on G define `F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n`. Multiplication uses K, with the native algebra map `Z_p→K` on binomial values. This is the Mellin series adapter on the imported component; it does not construct Δ, H, the character functor or its representing space. Under (a) and (b). Its API consists of `componentMellin` (the construction itself), `componentMellin_coeff` (The nth coefficient is `μ(ν∘H_Δ times binom(H_Z,n))`), `componentMellin_add` (`F_{μ+η,ν,H}=F_{μ,ν,H}+F_{η,ν,H}`), `componentMellin_smul` (`F_{aμ,ν,H}=aF_{μ,ν,H}`), `componentMellin_dirac` (`F_{δ_g,ν,H}=ν(H_Δg)Σ_n binom(H_Zg,n)T^n`) and `componentMellin_mass` (`coeff_0 F=μ(ν∘H_Δ)`).

*Needs:* PadicMeasuresIwasawaAlgebras §3a.1; Mathlib `AbstractMeasure`, `AbstractMeasure.dirac`, `mahler`, `AbstractMeasure.amiceTransform`, `AbstractMeasure.coeff_amiceTransform`.

**Checks.**

- `ComponentMellinTests.zero` (degenerate): `F_{0,ν,H}=0`.
- `ComponentMellinTests.finite_atom`: `F_{δ_(δ,0),ν,H}=ν(δ)` as a constant series.
- `ComponentMellinTests.generator_atom`: `F_{δ_(δ,1),ν,H}=ν(δ)(1+T)`.
- `ComponentMellinTests.native_amice` (compatibility): For G=Z_p, Δ a singleton, its canonical product chart and ν=1, componentMellin μ equals the native AbstractMeasure.amiceTransform μ.

**Bounded component Mellin coefficients** (lemma; `componentMellin_coeff_bound`). Under the component-Mellin hypotheses, if `C≥0` and `||ν(δ)||≤C` for every δ, then `||coeff_n F_{μ,ν,H}||≤||μ||C` for every n, where `||μ||` is the native continuous-linear-functional operator norm. For finite characters in a splitting field one may take `C=1`. Under (a) and (b).

*Needs:* §3.1 `componentMellin`; Mathlib `PadicInt.norm_mahler_eq`.

**Bounded component series are analytic on the disc** (theorem; `componentMellin_onOpenDisc`). For every μ,ν,H as above, the component series is open-disc analytic and has uniformly bounded coefficients. It is therefore a bounded rigid function when transported to the imported component. This forward comparison does not by itself prove that every bounded rigid function comes from a measure. Under (a) and (b).

*Needs:* §3.1 (Bounded component Mellin coefficients); §1.2 (Analytic evaluation of an open-disc series); Mathlib `PowerSeries.isRestricted_iff'`.

**Character evaluation equals the component Mellin value** (theorem; `componentMellin_eval`). For `||t||<1` let `κ_t:Z_p→K` be the native additive character with `κ_t(1)=1+t`. Then `E(F_{μ,ν,H},t)=μ(g↦ν(H_Δg)κ_t(H_Zg))`. If H is a group chart and ν a finite character, its right side is the scalar character integral on the imported component. The statement uses continuous maps and genuine coefficient-field points. Under (a) and (b). (Source: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22); Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.)

*Needs:* §3.1 `componentMellin`; §3.1 (Bounded component series are analytic on the disc); §1.2 (Summability inside the open disc); Mathlib `PadicInt.addChar_of_value_at_one`, `PadicInt.coe_addChar_of_value_at_one`, `PadicInt.hasSum_mahlerSeries`, `ContinuousLinearMap.map_tsum`.

### 3.2 Arithmetic branches and clearing factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a finite extension of Q_p with its normalized nonarchimedean absolute value; the elementary series lemmas also hold over any complete nontrivially normed ultrametric field. (b) An open-disc series F (`OnOpenDisc F`) means a native power series with ||a_n|| R^n tending to zero for every real 0<R<1, that is, Mathlib-restricted at every radius below one. Write E(F,t) (`evalOpen F t`) for the native FormalMultilinearSeries.ofScalarsSum of its coefficients; analytic uses require ||t||<1. No convergence claim is made at ||t||=1.

Source for this subsection unless a target says otherwise: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).

Library inputs of this subsection, used by several of its targets: Mathlib `PadicInt.addChar_of_value_at_one`.

**Arithmetic branches stay inside the character disc** (lemma; `branchCoordinate_norm_le`). For q∈K with ||q||<1 and s∈Z_p, ||κ_q(s)−1||≤||q||<1. Under (a) and (b). (Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30; derived from the cited passage, not printed there.)

*Needs:* Mathlib `PadicInt.coe_addChar_of_value_at_one`, `PadicInt.hasSum_mahlerSeries`, `PadicInt.norm_mahler_eq`.

**Mellin branches in an arithmetic parameter** (construction). For an open-disc series F, `q∈K` with `||q||<1`, and `s∈Z_p`, put `B_{F,q}(s)=E(F,κ_q(s)−1)`, using the native `κ_q(1)=1+q`. In the standard odd-prime unit chart, `γ=1+p`, `q=γ−1`, and `ν=ω^i`, this is `Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ`. At `p=2` the imported chart is `{±1}×(1+4Z_2)`, with `γ=5`; the odd-prime chart is not used there. Under (a) and (b). Its API consists of `branchMellin` (the construction itself), `branchMellin_def` (`B_{F,q}(s)=E(F,κ_q(s)−1)`), `branchMellin_zero` (`B_{F,q}(0)=coeff_0 F`), `branchMellin_one` (`B_{F,q}(1)=E(F,q)`) and `branchMellin_add` (`B_{F+H,q}(s)=B_{F,q}(s)+B_{H,q}(s)` for two open-disc series).

*Needs:* §3.2 (Arithmetic branches stay inside the character disc); §3.1 (Character evaluation equals the component Mellin value); PadicMeasuresIwasawaAlgebras §3a.1.

**Checks.**

- `BranchMellinTests.zero` (degenerate): `B_{0,q}(s)=0`.
- `BranchMellinTests.constant`: `B_{a,q}(s)=a` for a constant series.
- `BranchMellinTests.linear_at_one`: `B_{T,q}(1)=q`.
- `BranchMellinTests.generator_at_zero`: `B_{1+T,q}(0)=1`.
- `BranchMellinTests.torsion_point`: for the Dirac measure at a torsion point H⁻¹(δ, 0), the branch value of its component series is ν(δ) for every weight s, independently of q.

**Mellin evaluation at integral weights** (lemma; `branchMellin_nat`). For `n≥0`, `B_{F,q}(n)=E(F,(1+q)^n−1)`. This pins integral specialization of a branch independently of arithmetic L-value interpolation. In the canonical unit chart, recovering `x^k` for `k≥0` additionally requires the finite character `ν=ω^i` with `k≡i` modulo `p−1` for odd p, and the corresponding parity branch at `p=2`; the coordinate comparison (the power-character identity of the canonical unit chart) is that the imported unit decomposition gives `ω(x)^i〈x〉^k=x^k` for such k, including the parity condition at `p=2`; composing with §3.1 character evaluation proves that this branch value is the `x^k` moment. No finite-character factor is omitted. Under (a) and (b).

*Needs:* §3.2 `branchMellin`; Mathlib `PadicInt.addChar_of_value_at_one_def`.

**Mellin evaluation on a clearing-factor domain** (construction). For open-disc numerator F and denominator D define `Q_{F,D}(t)=E(F,t)/E(D,t)` only as a meromorphic chart expression. All evaluation theorems require `||t||<1` and `E(D,t)≠0`. For a pseudomeasure λ imported from PadicMeasuresIwasawaAlgebras §3.1 and a genuine clearing numerator `μ=([a]−[1])λ`, F is the component Mellin series of μ and D represents `κ_t(a)−1`. A quotient’s total value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value is asserted there. Under (a) and (b). Its API consists of `quotientMellin` (the construction itself), `quotientMellin_def` (`Q_{F,D}(t)=E(F,t)/E(D,t)`; meaningful use is guarded by the nonvanishing condition), `quotientMellin_clear` (`E(D,t)Q_{F,D}(t)=E(F,t)` when `E(D,t)≠0`), `quotientMellin_one` (`Q_{F,1}(t)=E(F,t)`) and `quotientMellin_zero` (A zero numerator yields zero on every admissible domain).

*Needs:* §3.1 (Character evaluation equals the component Mellin value); §1.2 (Evaluation preserves products inside the disc); PadicMeasuresIwasawaAlgebras §3.1.

**Checks.**

- `QuotientMellinTests.no_denominator` (compatibility): `Q_{F,1}(t)=E(F,t)`.
- `QuotientMellinTests.simple_pole`: `Q_{1,T}(t)=t inverse` for `t≠0`.
- `QuotientMellinTests.removable_on_punctured_disc`: `Q_{T,T}(t)=1` for `t≠0`.
- `QuotientMellinTests.trivial_character_excluded` (non-example): E(T,0)=0, so the chart domain for denominator T excludes the trivial character.

**Agreement of Mellin clearing expressions** (lemma; `quotientMellin_independent`). If `F,D,F′,D′` are open-disc series with `FD′=F′D`, then `Q_{F,D}(t)=Q_{F′,D′}(t)` at every `||t||<1` for which both denominator values are nonzero. Applied to the algebraic clearing compatibility imported from PadicMeasuresIwasawaAlgebras §3.1 this proves independence on chart overlaps; it does not construct a total-fraction-ring character homomorphism. Under (a) and (b).

*Needs:* §3.2 `quotientMellin`; §1.2 (Evaluation preserves products inside the disc); PadicMeasuresIwasawaAlgebras §3.1.

### 3.3 The Mellin transform of distributions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: RJW, Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35; derived from the cited passage, not printed there.

**Geometric character space and its sections** (supplier adapter; `rigidCharacterSpace`). Let `K/ℚ_p` be finite and let `G` be compact abelian with a chosen analytic group isomorphism `G≃Δ×ℤ_p^d`, `Δ` finite abelian. Use the exported geometric interface of PhiGammaModulesAndIwasawaCohomology §4.0, with the identification `rigidCharacterSpace(G,K)=(compactCharacterSpace G)_K`. In this chart it is `Sp(K[Δ])` times the rigid open unit polydisc. The finite étale algebra `K[Δ]` retains all torsion, including p-power torsion. The supplied closed-polydisc exhaustion uses rational p-power radii tending to one and weighted restricted algebras. After a finite Galois splitting extension `E/K`, components are indexed by `Δ̂(E)`; descent is through `K[Δ]`, equivalently the Galois-invariant component algebras and their restrictions. The adapter `rigidCharacterSpace_components` identifies these components, and `rigidCharacterSpace_sections` identifies their sections topologically with `K[Δ]`-valued multivariate series convergent on every smaller closed polydisc. Under `rigidCharacterSpace_universal` the imported universal section is `χ(δ,z)=[δ]∏_i(1+T_i)^{z_i}`. The imported `rigidCharacterSpace_pullback` for `f:G→H` is `κ↦κ∘f`, with identity and composition laws; `rigidCharacterSpace_baseChange` gives `W_(G,L)≃W_(G,K)×_K L` and `O(W_(G,K))⊗_K L≃O(W_(G,L))` for finite `L/K`, using the finite-product topology on scalar extension. Each adapter is the corresponding supplier map on the same characters and sections, so is independent of the chart. Under (a). Source: PhiGammaModulesAndIwasawaCohomology §4.0, `compactCharacterSpace` and exported `rigidCharacterSpace`; Schneider–Teitelbaum, *p-adic Fourier theory*, §2, printed pp. 7–8; finite-component descent uses finite étale coefficient algebras as in the supplier.

*Needs:* PhiGammaModulesAndIwasawaCohomology §4.0 (geometric character-space interface, universal character, pullbacks and finite coefficient extension).

**Checks.**

- `characterGeometry_Zp`: For G=Z_p, W is the open unit disc. The series with coefficient p^(−k) at n=p^k and zero elsewhere is a global section with unbounded coefficients; a bounded-series algebra misses it.
- `characterGeometry_Z2_units`: For G=Z_2^×≃{±1}×Z_2, W has two sign components; the universal section at −1 is respectively 1 and −1.
- `characterGeometry_descent`: For Δ=C_3 over Q_2, the trivial character component descends over Q_2 and the two nontrivial components form a conjugate pair over Q_2(ζ_3); descent does not label them separately over Q_2.
- `characterGeometry_generator_baseChange`: Replacing γ by γ^u, u∈Z_p^×, gives T′=(1+T)^u−1; this change and finite L/K commute with the geometric/series section equivalence.
- `characterGeometry_groupMap`: For f:Z_p→Z_p, z↦pz, pullback of the source weight coordinate is (1+T)^p−1; f=0 pulls it back to zero.

**Distribution Mellin components** (supplier adapter). Let `G≃Δ×ℤ_p^d` be an imported analytic group chart, `Δ` finite abelian, and let `K` contain the values of its finite characters. Identify the Layer 0 carrier with the supplier's strong dual by `i_G:D(G,K)≃abelianAnalyticDistributions G K`, characterized by `i_G(μ)(f)=μ(f)` on every locally ℚ_p-analytic test function; the topology comparison is stated below. Use the supplied transform in component coordinates: `distributionMellin(μ)_ν=chart_ν^*(scalarAbelianMellin(i_G(μ)))`, where `chart_ν(t)` is the character `(δ,z)↦ν(δ)∏_i(1+t_i)^{z_i}`. Thus `distributionMellin_coeff` is `coeff_α distributionMellin(μ)_ν=μ((δ,z)↦ν(δ)∏_i binom(z_i,α_i))`, and `distributionMellin_ext` transports the supplier's extensionality. These series converge on every strictly smaller closed polydisc; their restriction to bounded measures is the component adapter of §3.1 when `d=1`. Under (a). Source: PhiGammaModulesAndIwasawaCohomology §4.0, `scalarAbelianMellin`, `scalarAbelianMellin_coefficients` and exported `distributionMellin`; Kohlhaase, proof of Theorem 4.4, printed pp. 21–22, multivariate coefficient model.

*Needs:* PhiGammaModulesAndIwasawaCohomology §4.0 (strong-dual carrier and scalar Mellin); §0.3 (Products and completed analytic tensors); §3.3 (Geometric character space and its sections); Mathlib `MvPowerSeries.coeff`.

**Checks.**

- `AnalyticDistributionTests.distributionMellin_point`: At δ_(δ,0) the ν component is the constant ν(δ).
- `AnalyticDistributionTests.distributionMellin_trivial_group` (degenerate): For Δ trivial and d=0 the transform is the mass in K.
- `AnalyticDistributionTests.distributionMellin_bounded` (compatibility): For d=1 and a bounded measure this is the componentMellin series.

**Mellin as a Fréchet algebra isomorphism** (comparison). For compact abelian `G` with an open `ℤ_p^d` subgroup, the identity-on-test-functions map `i_G` identifies the projective-limit topology on `D(G,K)` with the supplied strong-dual topology on `abelianAnalyticDistributions G K`. Under the supplied character-space identification, `distributionMellin=scalarAbelianMellin∘i_G` as topological K-algebra maps, with convolution on distributions and the closed-polydisc Fréchet topology on sections. In particular, the supplied Mellin isomorphism transports to `D(G,K)≃O(W_(G,K))`. This equality retains every finite-character component and commutes with finite splitting extension and descent. Under (a); finite `K/ℚ_p` is used in the strong/projective-limit comparison. Source: PhiGammaModulesAndIwasawaCohomology §4.0, strong-dual `scalarAbelianMellin` isomorphism; Schneider–Teitelbaum, *p-adic Fourier theory*, Theorem 2.2, printed p. 8; Kohlhaase, proof of Theorem 4.4, printed pp. 21–22.

*Needs:* PhiGammaModulesAndIwasawaCohomology §4.0 (scalar Mellin topological algebra isomorphism); §3.3 `distributionMellin`; §0.3 (Strong duality for analytic compact-type spaces); §0.3 (Products and completed analytic tensors); PadicFunctionalAnalysis §4.7 (one-variable quantitative norms).

**Checks.**

- `mellinGeometry_Zp`: For `G=ℤ_p`, `i_G(μ)` has the same binomial moments as μ, so the transported supplier Mellin map is the unbounded Amice transform on the open unit disc.
- `mellinGeometry_finite`: For d=0, Fourier decomposition identifies K[Δ] with the finite-character functions after splitting and descends over K.
- `mellinGeometry_unbounded`: The unbounded-coefficient section in `characterGeometry_Zp` has a distribution preimage, while it has no bounded-measure preimage.

**Bounded Mellin functions and measures** (comparison). Inside the unbounded Mellin algebra, the imported bounded measures are exactly the components with uniformly bounded coefficients, equivalently uniformly bounded Gauss norms as the polyradii approach 1. Boundedness refers to all rigid points after finite coefficient extension, not just K-rational points. Under (a).

*Needs:* §3.3 (Mellin as a Fréchet algebra isomorphism); PadicMeasuresIwasawaAlgebras §2.5 (Bounded Amice isometry); §3.1 (Bounded component Mellin coefficients).

**Evaluation of distributions at analytic characters** (lemma). For every locally analytic character κ:G→L^× over a finite extension L/K, evaluation of the coefficient-extended Mellin function at κ equals μ_L(κ). The character is an analytic test function on a common radius. Under (a).

*Needs:* §3.3 `distributionMellin`; §0.3 (A common analytic radius on a compact manifold).

**Multiplicativity of distribution Mellin** (lemma). For compact abelian G, M(λ*μ)(κ)=M(λ)(κ)M(μ)(κ), hence the Mellin transform sends convolution to analytic multiplication. Under (a). (Source: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.)

*Needs:* §1.3 `distributionConvolution`; §3.3 (Evaluation of distributions at analytic characters).

**Mellin compatibility with a different generator** (lemma). In a rank-one chart with `γ′=γ^u` for `u∈Z_p^×`, the coordinate relation is `t′=(1+t)^u−1` and the new component function is `F′(t′)=F((1+t′)^{u^(−1)}−1)`. This is an adapter for the coordinate transition imported from PadicMeasuresIwasawaAlgebras §3a.1. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); PadicMeasuresIwasawaAlgebras §3a.1.

**Local analyticity in an arithmetic weight parameter** (lemma). For a unit-character branch κ_(i,s)(x)=ω(x)^i〈x〉^s at odd p, or the imported {±1}×(1+4Z_2) branch at p=2, s↦μ(κ_(i,s)) is locally Q_p-analytic on Z_p for any locally analytic distribution μ. On sufficiently small s-discs it is the composition of its Mellin component with t(s)=γ^s−1. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); §3.3 (Mellin as a Fréchet algebra isomorphism); §3.2 `branchMellin`; PadicMeasuresIwasawaAlgebras §3a.1.

**Weight differentiation and logarithmic moments** (lemma). For the preceding branch, d/ds M_(μ,i)(s)=μ(log〈x〉·ω(x)^i〈x〉^s). If F is its component series, the same derivative is log(γ)(1+t(s))F′(t(s)). Repeated derivatives insert powers of log〈x〉. Under (a).

*Needs:* §3.3 (Local analyticity in an arithmetic weight parameter); §1.3 `distributionMultiply`.

**Twists of the distribution Mellin transform** (lemma). For a locally analytic character θ of compact abelian G, M(θμ)(κ)=M(μ)(θκ). A finite character twist permutes Δ components; an analytic principal-unit twist gives the imported translated coordinate substitution. Under (a).

*Needs:* §1.3 `distributionMultiply`; §3.3 (Evaluation of distributions at analytic characters).

**Mellin functoriality for group maps** (theorem). For an analytic homomorphism f:G→H of compact abelian p-adic groups, M(f_*μ)(κ)=M(μ)(κ∘f). The supplied morphism W_H→W_G identified by `rigidCharacterSpace_pullback` gives the corresponding pullback on analytic functions. Under (a).

*Needs:* §1.3 `distributionPushforward`; §3.3 (Evaluation of distributions at analytic characters); §3.3 `rigidCharacterSpace_pullback`.

**Checks.**

- `mellinGroupMap_dirac`: f_*δ_g has Mellin value κ(f(g)).
- `mellinGroupMap_zero`: The zero homomorphism sends a distribution to its mass times δ_0.
- `mellinGroupMap_comp`: Successive pushforwards and the contravariant geometric maps agree for a composite.

**Finite coefficient extension of Mellin** (comparison). For finite L/K, D(G,K)⊗_K L with its finite-product topology identifies with D(G,L), and Mellin commutes with O(W_G)⊗_K L≃O(W_(G,L)). Finite-dimensionality is required; this statement makes no claim for an arbitrary completed tensor with an infinite-dimensional affinoid. Under (a). (Source: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6; derived from the cited passage, not printed there.)

*Needs:* §3.3 (Mellin as a Fréchet algebra isomorphism); §3.3 `rigidCharacterSpace_baseChange`; §0.3 (Analytic functions on finitely many polydiscs).

**Checks.**

- `mellinFiniteExtension_identity`: L=K gives the identity comparison.
- `mellinFiniteExtension_split`: A splitting extension of Δ produces the finite-character component Mellin series.
- `mellinFiniteExtension_generator`: Finite coefficient extension commutes with T′=(1+T)^u−1 and the section comparison.

### 3.4 Geometric comparison and pseudo-measures

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: RJW, Theorem 3.43 and Remark 3.47, printed pp. 24–26; §5.3, printed pp. 34–35; derived from the cited passage, not printed there.

**Rigid and adic Mellin comparison** (comparison). On the supplied rigid character space identified in §3.3, the rigid Mellin function corresponds under the imported rigid/adic equivalence to an adic analytic section. Its restrictions on affinoid character charts agree with the radius-wise Mellin seminorms and with character evaluation at rank-one points. Under (a). (Source: BCGP II, Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* §3.3 (Geometric character space and its sections); §3.3 (Mellin as a Fréchet algebra isomorphism); AdicSpacesPartII §R1.7, *rigid-adic-comparison-functor* and *rigid-adic-quasi-separated-equivalence*; AdicSpaces §§5.1, 5.3 (opens and gluing).

**Checks.**

- `mellinRigidAdic_disc`: On each smaller closed disc the section is the same restricted series on Sp and Spa.
- `mellinRigidAdic_sign`: At p=2 the sign of δ_(−1) differs on the two components in both realizations.
- `mellinRigidAdic_restriction`: Restriction to a smaller rational polydisc and finite coefficient extension commute with the comparison.

**Gluing genuine pseudomeasure Mellin numerators** (lemma). For an imported pseudomeasure λ and an actual clearing element c_g=[g]−[1], write n_g=c_gλ in the measure algebra. On the character open where κ(g)−1 is invertible, define M(λ)=M(n_g)/(κ(g)−1). The actual numerator cross-products make these local analytic quotients agree on overlaps; no evaluation homomorphism from the full total quotient ring is constructed. Under (a).

*Needs:* §3.3 (Evaluation of distributions at analytic characters); §3.2 (Agreement of Mellin clearing expressions); PadicMeasuresIwasawaAlgebras §3.1 (Cleared numerator); PadicMeasuresIwasawaAlgebras §3.1 (the cross-multiplication identity of the cleared numerator); PadicMeasuresIwasawaAlgebras §3.1 (Independence of clearing factor).

**Local pole order of a clearing presentation** (lemma). On a smooth rank-one character disc, if a genuine denominator κ(g)−1 has a zero of multiplicity m and is not identically zero, the corresponding pseudomeasure Mellin section has pole order at most m. Vanishing of the numerator can lower or remove that order. No universal simple-pole or trivial-character-only assertion is made. Under (a).

*Needs:* §3.4 (Gluing genuine pseudomeasure Mellin numerators).

### Examples

For the trivial finite character and `μ = δ_u` the component Mellin series is the power series of `u^{s}` in the disc coordinate; at the integral weight k the branch value is `∫ ω(x)^i⟨x⟩^k dμ`, which is `∫x^k dμ` only on the matching torsion branch (`i≡k mod p−1` for odd p, and matching parity for `p=2`). On the trivial torsion branch at `p=2`, `δ_{−1}` has value 1 at `k=1` while `∫x dδ_{−1}=−1`. A genuine clearing denominator with a simple zero permits at most a simple pole, which can be removable; a clearing denominator identically zero on a component permits no quotient there; the coordinate change between the generators `1 + p` and `(1 + p)^u` is the substitution `(1 + T) ↦ (1 + T)^u`.

### Dependencies

Layers 1 and 2; PhiGammaModulesAndIwasawaCohomology §4.0 (compact abelian character space, strong-dual Mellin and finite-component descent), with its §4.1 relative Γ-ring interface; PadicMeasuresIwasawaAlgebras §3a.1 (pointwise characters, algebraic universal character, the decompositions at odd p and p = 2) and §3.1 (pseudo-measures and clearing); AdicSpaces §0.5 and §§5.1, 5.3 (weighted series, opens and gluing); AdicSpacesPartII §§R1.1, R1.7 (rigid carriers, sections and rigid–adic comparison) for §3.3–§3.4.

## Layer 4: analytic families, Fredholm theory and finite-slope complexes

This layer supplies the operator theory. It takes complete continuity in the Banach-algebra convention, orthonormalizable and (Pr) modules, the Fredholm determinant det(1 − Tu) of a completely continuous operator with its invariance, product and base-change properties, entire series with their division and resultants, Hasse derivatives, the Fredholm resolvent, the Riesz projectors at a root with their finite projective kernels and Coleman's spectral transform from PadicFunctionalAnalysis, CompactOperators and RestrictedPowerSeries, and develops the further algebra that the Riesz theory and the families use: the tail quotients of entire series by linear and monic factors, analytic reduction modulo a monic polynomial, the resolvent and projector lemmas at a root, the fixed-rank normalization and carrier adapters for the supplied finite spectral transform, with reciprocal truncation limits, and Gauss convergence of entire series. The second half applies this to families: affinoid-valued analytic stages and their duals, the universal-character coefficient action, compactness of contracting operators, Banach cochain complexes with compact homotopy endomorphisms, numerical slope decompositions and finite-slope perfect complexes, Fréchet presentations and the torus order on slopes. Proposed home: `TauCeti/Analysis/NonarchimedeanFredholm/*` for the operator theory and `TauCeti/NumberTheory/Padics/AnalyticDistributions` for the families and complexes.

### 4.1 Banach modules, complete continuity and orthonormalizable modules

Hypotheses shared by several targets of this subsection, cited by letter below: (a) The hypotheses in the statement are explicit; the index set need not be countable.

Library inputs of this subsection, used by several of its targets: Mathlib `ZeroAtInftyContinuousMap`.

**Complete continuity in the Banach algebra convention** (supplier). A continuous A-linear map is completely continuous when it is an operator-norm limit of continuous A-linear maps whose range lies in a finitely generated A-submodule (finite A-rank, neither finite K-rank nor Mathlib's `IsCompactOperator`); these form a two-sided ideal closed under sums, scalar multiples and operator-norm limits and containing the finite-rank maps. Supplied by CompactOperators §0.1 and **Finite image and approximation** (`IsFiniteRank`, `IsCompletelyContinuous`, `IsFiniteRank.isCompletelyContinuous`) (the roadmap of W. Coram). Approximants of finitely generated range give the same predicate over the Noetherian A of Convention 1 by CompactOperators §0.1, **Finite image and approximation**, and CompactOperators §0.1, **Banach modules normed by a lattice** gives its agreement with AdicSpacesPartIII's `Huber.IsCompletelyContinuous` (§R3.6, *completely-continuous-map*) on an affinoid algebra with a chosen Banach model.

**Checks.**

- Zero maps have finite image.
- Identity on A is completely continuous.
- Identity on c₀(ℕ,A) is not completely continuous.

**Finite coordinate truncation** (supplier). For finite T ⊆ I the coordinate truncation π_T of c_A(I), with (π_T x)_j=x_j for j∈T and zero otherwise, satisfies ‖π_T x‖≤‖x‖, has norm at most one and range the finite free module on T, and π_T x → x along the finite subsets T, with e_j = `c0Single j 1`. Supplied by PadicFunctionalAnalysis §2.6, with the coordinate vectors `single` of its §2.1 (the roadmap of W. Coram).

**Checks.**

- The empty coordinate set gives zero.
- A coordinate line is detected and retained by its own coordinate.
- A module supported on a finite coordinate set is retained exactly by that truncation.

**Bounded-family extension from c0** (supplier). For ‖1_A‖=1 and a Banach A-module M with contractive A-action, a bounded family (m_i) is the family of basis images of a unique continuous A-linear map c_A(I) → M, x ↦ Σ_i x_i m_i, of K-operator norm sup_i ‖m_i‖ (zero for empty I). Supplied by PadicFunctionalAnalysis §2.1 under its `IsBoundedSMul A M` convention. For a merely bounded action ‖ax‖≤C‖a‖‖x‖, the same extension instead satisfies sup_i ‖m_i‖≤‖u‖_K≤C sup_i ‖m_i‖. These estimates follow from ‖e_i‖=1 and the ultrametric sum bound; no equality in the original norm is inferred. Source: Buzzard, §2, operator norm and orthonormal bases, pp. 8–10.

**Checks.**

- `c0_extension_contractive`: For M=A with its submultiplicative norm, the singleton family m gives multiplication by m with norm ‖m‖; the matrix-norm equality for c₀→c₀ uses this contractive action.
- `c0_extension_bounded_action` (non-example): For K=Q₃, A=K×K with its maximum norm, give M=A the norm max(|x+y/3|₃,|y|₃). The A-action has bound 3. The singleton basis image m=(1,−3) has norm 1/3, but u(a,b)=(a,−3b) has K-operator norm 1, witnessed at (1,0).
- `c0_extension_empty`: With empty I the unique map and both bounds are zero.

Transport of the other Banach-module imports uses bounded-equivalent norms only for topological assertions. For `‖1_A‖=1` and an action bound `C≥1`, the norm `‖x‖′=sup_{a≠0}‖ax‖/‖a‖` satisfies `‖x‖≤‖x‖′≤C‖x‖` and makes the action contractive. Completeness, closedness, strictness, potential ONability, (Pr) and finite-image approximation are invariant under this transport. Coordinate-truncation and matrix-norm equalities are used only in the native sup-norm c₀ models; bounds involving retractions retain their actual K-operator norms.

**Operator bound from the coordinate vectors** (supplier). For a continuous A-linear f : c_A(I) → c_A(I) and C ≥ 0, ‖f‖_K ≤ C if and only if ‖f(e_i)‖ ≤ C for every i ∈ I, the operator norm being the supremum of the matrix entries. Supplied by PadicFunctionalAnalysis §2.6 (output-first matrix coefficients) (the roadmap of W. Coram).

**Checks.**

- A bounded diagonal f(e_i)=a_i e_i has ‖f‖=sup_i|a_i|. Over ℂ_p, choose v_p(a_i)=1/(i+1): the norm is one although every basis image has norm less than one.
- The shift e_i↦e_(i+1) on c₀(ℕ,ℚ_p) has norm one and every basis image has norm one.
- The diagonal f(e_0)=p e_0, f(e_i)=e_i for i>0 has norm one, although ‖f(e_0)‖=p^(−1); one basis image alone gives no operator bound.

**Orthonormalizable and potentially orthonormalizable modules** (supplier). An orthonormalization of a Banach A-module M is an A-linear isometry M ≃ c_A(I), a potential one a continuous A-linear equivalence, equivalently an isometry for a bounded-equivalent norm, with coordinates reconstructing each element by unconditional summation. Supplied by PadicFunctionalAnalysis §2.2 (`IsONable`, `IsPotentiallyONable`) (the roadmap of W. Coram).

**Checks.**

- The zero module has an empty model presentation.
- A scalar line with a rescaled norm is potentially orthonormalizable.
- A norm rescaling outside the scalar value group need not be isometrically orthonormalizable.

**Canonical topology on finite Banach modules** (supplier). A finitely generated module over a Noetherian Banach algebra carries a unique complete topology making it a topological module, any two of its Banach norms are bounded-equivalent, and linear maps between such modules are continuous and strict. Supplied by PadicFunctionalAnalysis §1.4 (the roadmap of W. Coram).

**Checks.**

- The zero module has its unique complete topology.
- Finite free modules have the product topology.
- For A=K×K, the finite projective module (1,0)A need not have constant rank.

**Finite coordinate topology on a finite submodule** (supplier). For a finitely generated submodule Q of `c_A(I)` over a Noetherian A there are a finite `S ⊆ I` on which the coordinate restriction is injective on Q and `C > 0` with `‖q‖ ≤ C·max_{i∈S}‖q_i‖` for every `q ∈ Q`, with Q not assumed free. Supplied by PadicFunctionalAnalysis §2.6 (the roadmap of W. Coram).

**Checks.**

- Over A=ℚ_p, Q=A·(1,p,p²,…) is controlled by S={0} with C=1; S={1} instead requires C≥p.
- For Q=A e_1, S={1} works with C=1, while restriction to {0} is zero and not injective.
- For Q=A·(e_0+e_1), either S={0} or S={1} works with C=1 although neither truncation retains Q pointwise.

**Uniform coordinate truncation on finite submodules** (supplier). For a finitely generated closed submodule Q of c_A(I) and ε > 0 there is a finite T with ‖q − π_T q‖ ≤ ε‖q‖ for every q ∈ Q. Supplied by PadicFunctionalAnalysis §2.6 (the roadmap of W. Coram). There Q is assumed closed; over the Noetherian A of Convention 1 every finitely generated submodule of c_A(I) is closed by its §2.6, which is how it is applied here.

**Checks.**

- For Q=A e_3, T={3} gives zero error; a truncation omitting 3 cannot give relative error less than one.
- Over A=ℚ_p, Q=A·(p^i)_i and T={0,…,N} give relative error exactly p^(−N−1). Thus choose N with p^(−N−1)≤ε.
- The zero submodule permits T=∅ for every positive ε.

**Completely continuous matrix criterion** (supplier). A continuous A-linear u : c_A(I) → c_A(J) is completely continuous exactly when r_j(u) = sup_i ‖a_ij‖ tends to zero along the cofinite filter on J, and then π_T u → u in operator norm. Supplied by CompactOperators §0.2 (output-row norms, `IsRowCompact`, the truncation equivalence, `IsRowCompact.isCompletelyContinuous`, the complete-continuity equivalence) (the roadmap of W. Coram). There the decay is that of the output-row norm at j, the column norm r_j(u) here, and the direction from complete continuity assumes that finitely generated submodules of c_A(J) are closed, which over the Noetherian A of Convention 1 is PadicFunctionalAnalysis §2.6.

**Checks.**

- Zero maps have finite image.
- Identity on A is completely continuous.
- Identity on c₀(ℕ,A) is not completely continuous.

**Finite ambient image versus finitely generated range** (supplier). Over a Noetherian ring, the range of a continuous linear map lies in a finitely generated submodule if and only if it is finitely generated; over a non-Noetherian ring only the implication from a finitely generated range holds. Supplied by CompactOperators §0.1, **Finite image and approximation** (`isFiniteRank_iff_range_fg`) (the roadmap of W. Coram).

**Checks.**

- Zero maps have finite image.
- Identity on A is completely continuous.
- Identity on c₀(ℕ,A) is not completely continuous.

**Strict norm approximation by finite-image maps** (lemma; `isCompletelyContinuous_iff_norm_approximation`). For Banach modules M,N over the stated Noetherian K-Banach algebra A and a continuous A-linear f, imported complete continuity is equivalent to: for every epsilon>0 there is a continuous A-linear g whose range is contained in a finite A-submodule and whose difference from f, restricted to K, has operator norm strictly less than epsilon. Under (a). (Source: Buzzard, Section 2, pp. 8-10, operator norm and closure definition.)

*Needs:* CompactOperators §0.1, **Finite image and approximation** (`IsFiniteRank.isCompletelyContinuous`); CompactOperators §0.1, **Finite image and approximation** (`isFiniteRank_iff_range_fg`); Mathlib `ContinuousLinearMap.opNorm_le_bound`, `ContinuousLinearMap.le_opNorm`, `Metric.mem_closure_iff`.

**Checks.**

- On the scalar line A, every multiplication operator f has the finite-image approximant g=f, with zero error for every ε>0.
- Over ℚ_p, truncating the diagonal e_i↦p^i e_i to {0,…,N} gives error p^(−N−1); strict approximation requires choosing N with p^(−N−1)<ε.
- `approximation_identity_c0` (non-example): For f=identity on c₀(ℕ,A) over the nonzero Noetherian K-Banach algebra of Convention 1, every finite-A-image g has ‖f−g‖_K≥1. Indeed g has a nonzero kernel vector x, since an injection into a finite Noetherian module would make c₀ finite; then ‖x−gx‖=‖x‖. Hence no approximation with ε<1 exists.

**Bounded coefficient action on c0** (supplier). For a normed commutative ring A, the pointwise A-action on C₀(I, A) satisfies ‖a x‖ ≤ ‖a‖‖x‖ and is jointly continuous for the sup norm, the instances Mathlib lacks at the pin. Supplied by PadicFunctionalAnalysis §2.1 (the roadmap of W. Coram).

**Checks.**

- For ‖1_A‖=1, ‖a e_0‖=‖a‖, so the coefficient-action bound is sharp on a basis vector.
- If a_n→a in A and f_n→f in c₀(I,A), then a_n f_n→af in the sup norm; pointwise convergence of f_n alone does not suffice.
- Over the normed dual numbers K[ε]/(ε²), ε·(ε e_0)=0 while ‖ε‖‖ε e_0‖>0; the general bound need not be an equality.

**Finite coordinates detect a finite submodule** (supplier). Over a Noetherian ring, some finite coordinate restriction is injective on any finitely generated submodule of the model space, with no field, domain or freeness hypothesis. Supplied by PadicFunctionalAnalysis §2.6 (the roadmap of W. Coram). There it is stated for submodules of C₀(I, R) over a Noetherian Banach–Tate ring rather than of the algebraic product B^I, and only that case is used here.

**Checks.**

- Over A=ℚ_p, A·(1,p,p²,…) is detected on {0}; the inverse coordinate map reconstructs an infinite tail.
- The line A e_1 is detected on {1}, and restriction to {0} loses that entire line.
- For A=K×K and e=(1,0), Q=eA·e_0 is detected on {0}, although Q has different ranks on the two components; Q=0 is detected on ∅.

**Complete continuity of the identity detects finite generation** (supplier). The identity of a Banach A-module is completely continuous if and only if the module is finitely generated, with no ONability, (Pr), freeness or constant-rank hypothesis. Supplied by CompactOperators §0.1 (the roadmap of W. Coram).

**Checks.**

- Zero maps have finite image.
- Identity on A is completely continuous.
- Identity on c₀(ℕ,A) is not completely continuous.

### 4.2 Fredholm determinants on orthonormalizable and (Pr) modules

Hypotheses shared by several targets of this subsection, cited by letter below: (a) the standing Banach hypotheses of Convention 1.

Source for this subsection unless a target says otherwise: Serre, Proposition 8 proof, printed p. 77 (PDF p. 10).

Library inputs of this subsection, used by several of its targets: Mathlib `IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `norm_units_zsmul`, `IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `Finset.mem_powersetCard`, `Finset.norm_prod_le`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `Matrix.det_apply`.

**Fredholm determinant in an orthonormal chart** (supplier). For u on c_A(I), P_u(T) = det(1 − Tu) is the power series with c_0 = 1 and c_n = (−1)^n times the sum of the principal n × n minors of the matrix of u, a convergent sum for completely continuous u. Supplied by CompactOperators §1.2 (`minor`, `charCoeff`, `charPowerSeries`) (the roadmap of W. Coram). Its minors are those of output-first matrix coefficients, the transpose of (a_ij), which leaves every principal minor unchanged, and its convergence is stated for row-compact u, which over the Noetherian A of Convention 1 are the completely continuous ones.

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Entire power series over A** (supplier). A power series is entire when it is Mathlib's `PowerSeries.IsRestricted` at every positive radius; the entire series form a subring A{{T}} with the Gauss seminorms, and evaluation at a ∈ A is the convergent coefficient sum, a ring homomorphism on A{{T}} with ‖F(a)‖ ≤ G_R(F) for R > 0 with R ≥ ‖a‖. Supplied by RestrictedPowerSeries §§2.1 and 7.2 (`IsEntire` and `eval₂` with the identity coefficient map), with the scalar evaluation named `evalAt` in CompactOperators §3.3 (the roadmaps of W. Coram). There A is a complete ultrametric normed ring with ‖1‖ = 1; the predicate `IsEntire` in Suggested.lean uses this formula over any normed commutative ring. The evaluation `entireEval` specified here is the total coefficient sum, equal to `eval₂ (RingHom.id A) F a`, or CompactOperators’ `evalAt a F`, on entire input.

**Checks.**

- Polynomials are entire.
- The series Σ p^(n²)T^n over ℚ_p is entire.
- Σ p^nT^n is restricted at radius one but is not entire.

**Uniform entire tail bound from column majorants** (supplier). For a family of completely continuous matrices whose output-column norms are bounded by one bounded cofinite-null family b_j ≥ 0, and R > 0, 0 < q < 1, finite T with R b_j ≤ q off T, m = card T and B = max(1, R sup_j b_j), the Fredholm coefficients satisfy ‖c_n‖R^n ≤ B^m q^max(n−m, 0) uniformly throughout the family. Supplied by CompactOperators §1.2 and §1.3, and **Uniform tails under a common majorant** (`norm_charCoeff_mul_pow_le_of_rowNorm_le`) (the roadmap of W. Coram). There the majorant bounds output-row norms, the output-column norms here.

**Checks.**

- The zero operator has no positive-degree Fredholm coefficients.
- A finitely supported diagonal has a polynomial Fredholm series.
- For diag(p^i) over ℚ_p, v_p(c_n)=n(n−1)/2, giving decay at every radius.

**Lipschitz bound in each determinant degree** (quantitative specialization). For completely continuous u, v in one ON chart with ‖u‖, ‖v‖ ≤ C, C ≥ 1 and n ≥ 1, ‖c_n(u) − c_n(v)‖ ≤ ‖u − v‖C^(n−1). CompactOperators §1.3 supplies continuity on bounded operator sets. The explicit constant follows from §4.2 (Uniform finite determinant perturbation), the principal-minor formula and its summability. Source: Serre, Proposition 8 proof, p. 77.

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Gauss convergence under a common column majorant** (supplier). If `u_s → u` in operator norm and the matrices of all u_s and u share a bounded cofinite-null column majorant, then `sup_n ‖c_n(u_s) − c_n(u)‖R^n → 0` for every `R > 0`, and in particular `P_{u_s}(1) → P_u(1)`. Supplied by CompactOperators §1.3 (the roadmap of W. Coram). There the common majorant bounds output-row norms, the output-column norms here.

**Checks.**

- The zero operator has no positive-degree Fredholm coefficients.
- A finitely supported diagonal has a polynomial Fredholm series.
- For diag(p^i) over ℚ_p, v_p(c_n)=n(n−1)/2, giving decay at every radius.

**Determinant of a finite-coordinate operator** (supplier). If u(c_A(I)) lies in the coordinate submodule A^S for a finite S, then P_u is the characteristic polynomial det(1 − T u|A^S). Supplied by CompactOperators §1.2 (the roadmap of W. Coram). Its hypothesis that the rows of `matrixCoeff u` outside S vanish is this one.

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Independence of chart and equivalent norm** (supplier). The Fredholm series of a completely continuous operator on a potentially ONable module does not depend on the ON chart or on the chosen equivalent ON norm. Supplied by CompactOperators §1.5 and §1.7 (the roadmap of W. Coram).

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Cyclic Fredholm determinant identity** (supplier). `P_{uv} = P_{vu}` for completely continuous `u : M → N` and bounded `v : N → M` between potentially ONable Banach A-modules. Supplied by CompactOperators §1.4 (the roadmap of W. Coram). There it is stated between model spaces and transported to potentially orthonormalisable modules by its §1.5.

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Completed scalar extension of ON modules and determinants** (comparison). Let η:A→B be a continuous K-algebra homomorphism between commutative Noetherian K-Banach algebras with the norms of Convention 1. Its K-linear bound gives L≥1 with ‖η(a)‖≤L‖a‖; a topologically nilpotent nonzero scalar in K supplies common Banach–Tate data. The comparison has two clauses.

1. On AdicSpacesPartII §R0.5's *completed-tensor-banach-module* carrier, import CompactOperators §1.7's **Pure tensor comparison** (`c0_completedBaseChange`): the continuous B-linear equivalence Θ:c_A(I)⊗̂_A B≃c_B(I) satisfies Θ(x⊗b)_i=η(x_i)b, ‖Θ(z)‖≤L‖z‖_π and ‖Θ⁻¹(y)‖_π≤‖y‖, where ‖·‖_π is the supplied product seminorm extended to the Hausdorff completion. This specializes the ring-scalar comparison independently of any operator or determinant. For contractive η it is an isometry; the general bound gives a continuous linear equivalence.
2. Import CompactOperators §1.7's **Coefficientwise Fredholm base change** (`charPowerSeries_map`) for the mapped matrix of PadicFunctionalAnalysis §2.6: complete continuity is preserved and P_(u_B)=PowerSeries.map η P_u. Identify this coefficientwise operator with the tensor extension through Θ, then transport the identity to (Pr) modules using the supplied tensor functoriality and split exactness on their continuous inclusions and retractions, as in §1.7's **Abstract module transport**. The resulting determinant is independent of the chosen retract by CompactOperators §1.5.

Source: Buzzard, Lemma 2.8 and Corollaries 2.9–2.10, pp. 16–18; AdicSpacesPartII §R0.5, clauses (a), (b), (d) and (g); CompactOperators §1.7.

*Needs:* AdicSpacesPartII §R0.5, *completed-tensor-banach-module* (a), (b), (d), (g); PadicFunctionalAnalysis §2.2 and §2.6; CompactOperators §§0.2, 1.5 and 1.7, **Pure tensor comparison** (`c0_completedBaseChange`), **Coefficientwise Fredholm base change** (`charPowerSeries_map`) and **Abstract module transport**.

**Checks.**

- `onScalar_identity`: η=id_A gives the identity coefficient equivalence and unchanged Fredholm series.
- `onScalar_empty`: I=∅ gives zero and determinant one; a singleton gives B and maps each scalar endomorphism through η.
- `onScalar_product`: For A=K×K and either projection to K, e_i⊗b maps to b e_i in the chosen fibre, and a rank-one diagonal entry (a₁,a₂) gives 1−a_jT in fibre j.
- For K=ℚ_p, give K[ε]/(ε²) the two norms ‖a+bε‖_A=max(|a|,|b|) and ‖a+bε‖_B=max(|a|,p|b|). The identity η:A→B has bound L=p and is not contractive. For singleton I, Θ(ε⊗1)=ε, with ‖ε⊗1‖_π≤1<p=‖ε‖_B, so an isometric comparison would be false.

**Property (Pr)** (supplier). A Banach A-module has (Pr) when it is a continuous direct summand of a potentially ONable module, equivalently a continuous retract of some c_A(I); potentially ONable modules have (Pr). Supplied by PadicFunctionalAnalysis §2.2 (the roadmap of W. Coram).

**Checks.**

- The zero module has (Pr).
- Every c₀ model has (Pr).
- For A=K×K, the retract (1,0)A is finite projective and has varying rank.

**Continuous lifting characterization of (Pr)** (supplier). A Banach A-module has (Pr) exactly when every continuous A-linear map from it lifts through every continuous A-linear surjection of Banach A-modules. Supplied by PadicFunctionalAnalysis §2.2 (the roadmap of W. Coram).

**Checks.**

- The zero module has (Pr).
- Every c₀ model has (Pr).
- For A=K×K, the retract (1,0)A is finite projective and has varying rank.

**Finite (Pr) modules are algebraically projective** (supplier). A finitely generated Banach A-module with (Pr) is a finitely generated projective A-module. Supplied by PadicFunctionalAnalysis §2.2 (the roadmap of W. Coram).

**Checks.**

- The zero module has (Pr).
- Every c₀ model has (Pr).
- For A=K×K, the retract (1,0)A is finite projective and has varying rank.

**Fredholm determinant on a (Pr) module** (supplier). For completely continuous u on a (Pr) module M with M ⊕ M′ potentially ONable, P_u is the Fredholm series of u ⊕ 0, independent of the complement and agreeing with the ON determinant on ONable modules. Supplied by CompactOperators §1.5 (the roadmap of W. Coram).

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Fredholm determinant of a direct sum** (supplier). `P_{u⊕v}(T) = P_u(T)P_v(T)` for completely continuous u and v on (Pr) modules. Supplied by CompactOperators §1.6 (the roadmap of W. Coram). There it is stated on `c₀(I ⊕ J, R)` and hence on direct sums of modules with (Pr).

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Evaluated Fredholm product identity on c0** (supplier). For completely continuous u, v on `c_A(I)`, `P_{u+v−uv}(1) = P_u(1)P_v(1)`, with no commutativity hypothesis, whereas the whole series need not be multiplicative. Supplied by CompactOperators §2.4 (`fredholmDet`) (the roadmap of W. Coram).

**Checks.**

- With one operator zero, the evaluated product formula is the identity.
- On a scalar line it is 1−a−b+ab=(1−a)(1−b).
- For u=v=1 on a line, the evaluated determinants vanish; the whole series 1−T differs from (1−T)².

**Evaluated Fredholm product identity for (Pr)** (supplier). For completely continuous u, v on one (Pr) module, `P_{u+v−uv}(1) = P_u(1)P_v(1)`, without requiring `uv = vu`. Supplied by CompactOperators §2.4  (the roadmap of W. Coram). There it is stated on `c₀(I, R)`; this roadmap applies it to the zero extensions `u ⊕ 0` and `v ⊕ 0` on `M ⊕ M′ ≅ c_A(I)`, whose determinants are those of u and v by CompactOperators §1.5.

**Checks.**

- With one operator zero, the evaluated product formula is the identity.
- On a scalar line it is 1−a−b+ab=(1−a)(1−b).
- For u=v=1 on a line, the evaluated determinants vanish; the whole series 1−T differs from (1−T)².

**Ultrametric perturbation of a finite product** (lemma). Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ C^max(card S−1,0). In addition: A is any normed commutative ring with norm(1)=1 and an ultrametric norm; completeness, a coefficient field and Noetherianity are unnecessary.

**Checks.**

- `product_empty_difference` (degenerate): For empty S, the difference of the two empty products has norm zero, hence is at most every δ≥0.

**Determinant bound by distinct output columns** (supplier). For a square matrix D over a normed commutative ring with ultrametric norm and ‖1‖ = 1, ‖det D‖ ≤ ∏_j b_j whenever ‖D_ij‖ ≤ b_j for all i, j, including the empty matrix. Supplied by CompactOperators §1.1 (the roadmap of W. Coram). There the bound is by rows, ‖A i j‖ ≤ r_i, the transposed form, with the same determinant.

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Uniform finite determinant perturbation** (lemma). Let D,E be square matrices on a finite type J, C≥1 and δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at most δ, then norm(det D−det E)≤δ C^max(card J−1,0). In addition: A is a normed commutative ring with norm(1)=1 and an ultrametric norm. The empty-index case is allowed.

*Needs:* §4.2 (Ultrametric perturbation of a finite product).

**Cofinite decay of fixed-degree principal minors** (supplier). If `‖a_ij‖ ≤ b_j` with `b ≥ 0` bounded and cofinite-null, then for every n the principal `n × n` minors `det(a_ij)_{i,j∈S}` tend to zero along the cofinite filter on the n-element subsets S, for any index type. Supplied by CompactOperators §1.2 (`minor`) (the roadmap of W. Coram). There the bound is on the rows of output-first matrix coefficients, the output columns here.

**Checks.**

- The zero operator has no positive-degree Fredholm coefficients.
- A finitely supported diagonal has a polynomial Fredholm series.
- For diag(p^i) over ℚ_p, v_p(c_n)=n(n−1)/2, giving decay at every radius.

**Finite exceptional-set product estimate** (lemma). Let `S,T` be finite subsets of an arbitrary set I. Let `b:I→R` satisfy `0≤b_j≤B` with `B≥1`, and suppose `b_j≤q` outside T where `0≤q≤1`. Then `product_{j in S} b_j≤B^card(T) q^max(card(S)−card(T),0)`. In addition: The coefficient family in this lemma is real and nonnegative. It need not tend to zero; this is a finite product statement, valid also at `q=0` and `q=1`. (Source: Serre, Proposition 7(b), printed p. 76 (PDF p. 9).)

*Needs:* Mathlib `Finset.card_sdiff_add_card_inter`.

### 4.3 Entire division by linear and monic factors

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed. (b) A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient 1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. (c) C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient 1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434: quotient-algebra interpretation and proof of Lemma A3.5; published p. 432–435; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Filter.Tendsto.bddAbove_range`, `summable_geometric_of_lt_one`, `norm_pow_le`, `Summable.of_norm_bounded_eventually_nat`, `PowerSeries.coeff_mk`, `PowerSeries.mk`, `Summable.tsum_mul_left`, `Multipliable.tprod_eq_zero_mul`, `IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `tendsto_pow_atTop_nhds_zero_of_lt_one`, `PowerSeries.coeff_C_mul`, `PowerSeries.coeff_succ_X_mul`, `PowerSeries.ext`, `Polynomial.modByMonic_add_div`, `PowerSeries.invOfUnit`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `Polynomial.reverse`, `Polynomial.coeff_zero_reverse`, `PowerSeries.coeff_mul`, `Polynomial.coeff_coe`; Tau Ceti `TauCeti.PowerSeries.isRestricted_polynomial`.

**Summability of every evaluated coefficient tail** (theorem; `entire_tail_summable`). If F=sum c_n T^n is entire and a is any element of A, then for every m>=0 the series sum_(k>=0) c_(m+k) a^k is summable. The case m=0 is evaluation at a. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* RestrictedPowerSeries §7.2.

**Tail quotient for division by a linear factor** (normed-ring realization). For a in A and a native formal series F=sum c_n T^n, define Q_a(F) by coefficient q_n=sum_(k>=0) c_(n+1+k)a^k, using the total native infinite sum. Its analytic quotient interpretation and additive/scalar laws below are asserted for entire F, where every tail converges. No new carrier for entire series is introduced. Under (a). Its API consists of `entireLinearQuotient_coeff` (The coefficient q_n is the convergent tail sum_(k>=0)c_(n+1+k)a^k for entire F; the total coefficient equality holds for every F), `entireLinearQuotient_zero` (Q_a(0)=0), `entireLinearQuotient_add` (For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G)), `entireLinearQuotient_C_mul` (For entire F and any b in A, Q_a(bF)=b Q_a(F)), `entireLinearQuotient_C` (Q_a(b)=0 for any constant b), `entireLinearQuotient_at_zero` (Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F), `entireLinearQuotient_polynomial` (For a polynomial P, Q_a(P) is the native monic polynomial quotient P divided by T-a, included in the native power-series ring). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* RestrictedPowerSeries §7.2; §4.3 (Summability of every evaluated coefficient tail).

**Checks.**

- `linear_quotient_constant` (degenerate): For any a,b in A, Q_a(b)=0.
- `linear_quotient_quadratic`: For any a in A, Q_a(T^2)=T+a.
- `linear_quotient_zero_shift` (compatibility): For every formal F, Q_0(F)=PowerSeries.mk of the shifted coefficients c_(n+1).
- `linear_quotient_native_polynomial` (compatibility): For ultrametric A, any a and polynomial P, Q_a(P)=the native polynomial quotient P divByMonic (T-a) included in A[[T]].
- `linear_quotient_zero_divisor`: For e in A with e^2=0, Q_e(eT^2)=eT. Nonzero nilpotents need not be discarded.

**Coefficient formula for the tail quotient** (lemma). For every formal F, a and n, coeff_n(Q_a(F))=sum_(k>=0)c_(n+1+k)a^k as an equality of total native sums; for entire F the sum converges. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient`.

**Recurrence for linear-quotient coefficients** (lemma). For entire F, q_n=c_(n+1)+a q_(n+1) for every n>=0. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_coeff`; §4.3 (Summability of every evaluated coefficient tail).

**Ultrametric bound for each quotient coefficient** (lemma). Suppose A is ultrametric, S>0, norm(a)<=S and M>=0 satisfies norm(c_m) S^m<=M for all m. Then norm(coeff_n(Q_a(F)))<=M/S^(n+1) for every n. This bound is valid for the total construction even without an entireness assumption; it does not by itself assert tail convergence. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entireLinearQuotient_coeff`; Mathlib `IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Division identity with evaluation as remainder** (supplier; `entireLinearQuotient_division`). Over complete ultrametric A, for entire F and any a ∈ A, F = (T − a)Q_a(F) + F(a) in A⟦T⟧, with the constant remainder F(a) = Σ_n c_n a^n. Supplied by RestrictedPowerSeries §7.2 (explicit monic division and linear evaluation) (the roadmap of W. Coram). The supplied quotient by T − a has coefficients Σ_k c_(n+1+k)a^k, equal to those of Q_a(F) because the inverse of 1 − aT is Σ_k a^k T^k, and the remainder is `eval₂ (RingHom.id A) F a`; it is used here under the displayed ultrametric hypothesis.

**Checks.**

- Division by 1 has quotient F and remainder zero.
- Division of T² by T−a has quotient T+a and remainder a².
- The formal inverse of 1−pT over ℚ_p is not entire.

**An entire linear product cannot be a nonzero constant** (lemma; `entire_linear_product_constant`). If H is entire and (T-a)H=b is a constant series, then H=0 and b=0. This holds over a complete commutative normed ring without a domain assumption. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; Coleman, Lemma A3.1, printed p. 432; corrected linear entire case; derived from the cited passage, not printed there.)

*Needs:* RestrictedPowerSeries §7.2; Mathlib `le_of_tendsto`.

**Checks.**

- `linear_entire_uniqueness_boundary` (non-example): For any a in A, the native formal geometric series H=sum a^n T^n satisfies (1-aT)H=1. At a=p in Q_p it is restricted but not entire, disproving the unrestricted replacement in Coleman A3.1.

**Uniqueness of the entire quotient and constant remainder** (theorem; `entire_linear_division_unique`). If F=(T-a)G+b=(T-a)H+c with entire G,H and b,c in A, then G=H and b=c. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* §4.3 `entire_linear_product_constant`; RestrictedPowerSeries §7.2.

**Agreement with native monic polynomial division** (comparison; `entireLinearQuotient_polynomial`). For ultrametric A, arbitrary a and polynomial P, Q_a(P) equals P divByMonic (T-a), both included in A[[T]] by Mathlib's polynomial coercion. Under (a). (Source: Coleman, Section A3, printed p.434, proof of Lemma A3.5; linear-factor specialization; derived from the cited passage, not printed there.)

*Needs:* RestrictedPowerSeries §7.2 (entireness of the supplied quotient); RestrictedPowerSeries §7.2 with linear division and evaluation; §4.3 `entire_linear_division_unique`; Mathlib `Polynomial.divByMonic`, `Polynomial.modByMonic_X_sub_C_eq_C_eval`.

**Roots and linear factors in the entire-series ring** (supplier). Over complete ultrametric A, for entire F and a ∈ A, F(a) = 0 if and only if F = (T − a)G with G entire. Supplied by RestrictedPowerSeries §7.2 (linear division and evaluation) (the roadmap of W. Coram).

**Checks.**

- Division by 1 has quotient F and remainder zero.
- Division of T² by T−a has quotient T+a and remainder a².
- The formal inverse of 1−pT over ℚ_p is not entire.

**Exponential bound for the reciprocal reversal** (lemma). For every k≥0, norm(b_k)≤C^k. Under (b) and (c).

*Needs:* Mathlib `PowerSeries.coeff_invOfUnit`.

**Reciprocal-tail quotient by a monic polynomial** (supplier). For monic Q of degree d and Σ_k b_k T^k the inverse of Q.reverse, the series S_Q(F) with coefficients s_n = Σ_k coeff_(n+d+k)(F)b_k, entire for entire F, with F = Q S_Q(F) + R and deg R < d. Supplied by RestrictedPowerSeries §7.2, **Explicit monic division** (the roadmap of W. Coram). Its explicit quotient by Q is the local restatement `entireMonicQuotient Q F` here, which supplies the coefficient formula and all-radius division. Entireness, the division identity and uniqueness are supplier-owned; local targets below give the weighted bound and native carrier comparisons. Source: Coleman, Appendix A3, p. 434.

**Checks.**

- `monic_supplier_one`: Q=1 gives quotient F and zero remainder.
- `monic_supplier_quadratic`: For Q=T²+aT+b and F=T³, the quotient is T−a and the remainder is (a²−b)T+ab, also over nonreduced A.
- `monic_supplier_formal_boundary` (non-example): The inverse of 1−pT in Q_p[[T]] is not entire; formal invertibility does not replace the supplier's entireness hypothesis.

**Coefficients of the monic tail quotient** (lemma). For every formal F, coeff_n(S_Q(F))=Σ_(k≥0)coeff_(n+d+k)(F)b_k. For entire F and monic Q this sum converges. Under (b).

*Needs:* §4.3 `entireMonicQuotient`; RestrictedPowerSeries §7.2, **Explicit monic division** (summability for entire F).

**Checks.**

- `monic_coeff_one`: For Q=1 the quotient coefficient is F_n.
- `monic_coeff_X`: For Q=T it is F_(n+1).
- `monic_coeff_constant`: For a constant F and monic Q of positive degree every quotient coefficient is zero.

**Weighted bound for the monic quotient** (lemma). If S≥C, M≥0 and norm(coeff_j(F))S^j≤M for every j, then norm(coeff_n(S_Q(F)))≤M/S^(n+d). Under (b) and (c).

*Needs:* §4.3 (Coefficients of the monic tail quotient); §4.3 (Exponential bound for the reciprocal reversal).

**Compatibility with native polynomial division** (comparison). For every polynomial P, S_Q(P)=P divByMonic Q under native polynomial inclusion, and the constructed native truncation remainder equals P modByMonic Q. Under (b).

*Needs:* RestrictedPowerSeries §7.2 (unique entire division) and **Explicit monic division**; Mathlib `Polynomial.degree_modByMonic_lt`.

**Checks.**

- `monic_polynomial_one`: Q=1 agrees with P divByMonic 1=P and P modByMonic 1=0.
- `monic_polynomial_nilpotent`: Over K[ε]/(ε²), dividing T² by T−ε gives quotient T+ε and remainder zero.
- `monic_polynomial_low_degree`: For degree(P)<degree(Q), the quotient is zero and the native remainder is P.

**Compatibility with the linear tail quotient** (comparison). For every a∈A and entire F, S_(T-a)(F) equals entireLinearQuotient(a,F) of §4.3. Under (b).

*Needs:* RestrictedPowerSeries §7.2 (unique entire division) and **Explicit monic division**; RestrictedPowerSeries §7.2 with linear division and evaluation; RestrictedPowerSeries §7.2 (entireness of the supplied quotient).

**Checks.**

- `monic_linear_zero`: Q=T gives the coefficient shift F_(n+1).
- `monic_linear_square`: For F=T², Q=T−a gives quotient T+a and remainder a².
- `monic_linear_arbitrary_root`: For a=p^(−1) in Q_p and F=T² the same comparison holds; no small-norm hypothesis on a is used.

**Division of entire series by a monic polynomial** (supplier). For monic Q ∈ A[T] of degree d and P ∈ A{{T}} there are unique S ∈ A{{T}} and R ∈ A[T] with deg R < d and P = QS + R; for Q = 1, R = 0. Supplied by RestrictedPowerSeries §7.2, **Explicit monic division** (the roadmap of W. Coram). The supplier allows any unit leading coefficient; monic division is its specialization at leading coefficient one.

**Checks.**

- Division by 1 has quotient F and remainder zero.
- Division of T² by T−a has quotient T+a and remainder a².
- The formal inverse of 1−pT over ℚ_p is not entire.

### 4.4 Resultants of monic polynomials and entire series

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the entire-series subring of §4.2, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–435: quotient-norm interpretation and Lemmas A3.5,A3.7; derived from the cited passage, not printed there.

**Polynomial inclusion in the entire-series ring** (construction). Corestrict Mathlib's polynomial coercion `Polynomial.coeToPowerSeries.ringHom` to A{{T}} (polynomials are entire by Tau Ceti's `TauCeti.PowerSeries.isRestricted_polynomial`) as the ring homomorphism i = `entirePolynomial` : A[T] → A{{T}}. Its underlying formal series is the polynomial coercion; it introduces no new entire or formal-series carrier. Under (a). Its API consists of `entirePolynomial_coe` (The underlying formal series of i(P) is the polynomial coercion of P), `entirePolynomial_injective` (The ring homomorphism i is injective) and `entirePolynomial_C` (The underlying formal series of i(C(a)) is PowerSeries.C(a)).

*Needs:* Mathlib `Polynomial.coeToPowerSeries.ringHom`, `Polynomial.coe_injective`, `Polynomial.eval₂_C_X_eq_coe`; Tau Ceti `TauCeti.PowerSeries.isRestricted_polynomial`.

**Checks.**

- `entire_polynomial_zero` (degenerate): i(0)=0.
- `entire_polynomial_square`: The underlying formal series of i(T^2) is T^2.
- `entire_polynomial_native_injective` (compatibility): For native polynomials P,S, i(P)=i(S) if and only if P=S.

**Polynomial divisibility detected inside entire series** (lemma). For monic Q and any native polynomial P, i(Q) divides i(P) in A{{T}} if and only if Q divides P in A[T]. Under (a).

*Needs:* §4.4 `entirePolynomial`; RestrictedPowerSeries §7.2; Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`, `Polynomial.modByMonic_eq_zero_iff_dvd`.

**Entire series in the native monic quotient** (construction). For monic Q, define the ring homomorphism rho_Q = `entireAdjoinRoot Q` : A{{T}} → Mathlib's AdjoinRoot Q = A[T]/(Q) by entire division F=i(Q)S+i(R) and rho_Q(F)=AdjoinRoot.mk Q R. The value is independent of every such polynomial representative, even if its degree is not normalized. Under (a). Its API consists of `entireAdjoinRoot_polynomial` (rho_Q(i(P))=AdjoinRoot.mk Q P for every native polynomial P), `entireAdjoinRoot_of_decomposition` (If F=i(Q)G+i(R) with G entire and R any polynomial, rho_Q(F)=AdjoinRoot.mk Q R; no degree bound on R is required), `entireAdjoinRoot_eq_zero_iff` (rho_Q(F)=0 if and only if i(Q) divides F in the entire ring), `entireAdjoinRoot_surjective` (rho_Q is surjective) and `entireAdjoinRoot_linear` (For Q=T-a, rho_Q(F)=AdjoinRoot.of Q (F(a))).

*Needs:* RestrictedPowerSeries §7.2; §4.4 `entirePolynomial`; §4.4 (Polynomial divisibility detected inside entire series); Mathlib `AdjoinRoot.mk_eq_mk`.

**Checks.**

- `quotient_constant_divisor` (degenerate): For Q=1, rho_1(F)=0 for every entire F; 0=1 in the target.
- `quotient_nilpotent_square`: rho_(T^2)(i(T^2))=0.
- `quotient_nilpotent_generator_nonzero` (nonexample): For nontrivial A, rho_(T^2)(i(T)) is nonzero, although its square is zero.
- `quotient_native_remainder` (compatibility): For every native polynomial P, rho_Q(i(P))=AdjoinRoot.mk Q (P modByMonic Q).

**Kernel of analytic reduction modulo a monic polynomial** (lemma). For F in A{{T}}, rho_Q(F)=0 if and only if i(Q) divides F in A{{T}}. Equivalently the kernel ideal is the principal ideal generated by i(Q). Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; Mathlib `AdjoinRoot.mk_eq_zero`.

**Polynomial representatives lift every quotient class** (lemma). The map rho_Q:A{{T}} to native AdjoinRoot Q is surjective. Together with the kernel theorem, native RingHom.quotientKerEquivOfSurjective identifies A{{T}}/(i(Q)) with the native polynomial quotient. No second quotient-equivalence construction is planned. Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; §4.4 `entireAdjoinRoot_eq_zero_iff`; Mathlib `AdjoinRoot.mk_surjective`, `RingHom.quotientKerEquivOfSurjective`.

**Linear analytic reduction is convergent evaluation** (comparison). For arbitrary a in A and entire F, rho_(T-a)(F)=AdjoinRoot.of (T-a) (F(a)), where F(a) is the convergent entire evaluation `entireEval`. Under (a).

*Needs:* §4.4 `entireAdjoinRoot`; RestrictedPowerSeries §7.2 with linear division and evaluation; RestrictedPowerSeries §7.2 (entireness of the supplied quotient).

**Resultant of a monic polynomial and an entire series** (supplier). For monic Q of degree d and entire F, Res(Q, F) ∈ A is the norm, in the free rank-d algebra AdjoinRoot Q, of the class of the remainder of F on division by Q; it depends only on F modulo Q, is multiplicative in F, equals F(a) for Q = T − a and Mathlib's `Polynomial.resultant` with the bounds d and deg F for polynomial F, and Res(1, F) = 1. Supplied by RestrictedPowerSeries §7.2, **Monic entire resultant** (`entireResultant`) (the roadmap of W. Coram). Since §4.4 `entireAdjoinRoot` sends F to the class of that remainder (`entireAdjoinRoot_of_decomposition`), Res(Q, F) = Algebra.norm A (ρ_Q(F)), which is how Convention 7 and the statements below read it.

**Checks.**

- Res(1,F)=1, even for F=0.
- Res(T−a,F)=F(a) for every a.
- Res(T²,b+cT)=b², including over rings with nilpotents.

**Entire resultant agrees with the native polynomial resultant** (supplier). For monic Q and every polynomial P, Res(Q, P) = Polynomial.resultant Q P Q.natDegree P.natDegree, with exactly this argument order and these degree bounds. Supplied by RestrictedPowerSeries §7.2, **Monic entire resultant** (the roadmap of W. Coram).

**Checks.**

- Res(1,F)=1, even for F=0.
- Res(T−a,F)=F(a) for every a.
- Res(T²,b+cT)=b², including over rings with nilpotents.

**Bounded polynomial coefficient in the resultant Bezout identity** (supplier). For monic Q of degree d and entire F there are entire G and a polynomial H of degree less than d with Res(Q, F) = QG + HF in A{{T}}; at d = 0 one may take G = 1, H = 0. Supplied by RestrictedPowerSeries §7.2, **Monic entire resultant** (the roadmap of W. Coram).

**Checks.**

- Res(1,F)=1, even for F=0.
- Res(T−a,F)=F(a) for every a.
- Res(T²,b+cT)=b², including over rings with nilpotents.

**Resultant detects analytic coprimality** (supplier). For monic Q and entire P, Res(Q, P) is a unit of A exactly when Q and P generate the unit ideal of A{{T}}. Supplied by RestrictedPowerSeries §7.2, **Monic entire resultant** (the roadmap of W. Coram). The supplier gives the coprimality equivalence. In the native quotient comparison, applying ρ_Q (§4.4 `entireAdjoinRoot`) to a relation QG + HP = 1 makes ρ_Q(P) a unit of AdjoinRoot Q and hence its norm Res(Q, P) a unit.

**Checks.**

- Res(1,F)=1, even for F=0.
- Res(T−a,F)=F(a) for every a.
- Res(T²,b+cT)=b², including over rings with nilpotents.

### 4.5 Formal resolvent recurrence and Hasse derivatives

Hypotheses shared by several targets of this subsection, cited by letter below: (a) the standing Banach hypotheses of Convention 1; M has (Pr) and u is completely continuous. (b) Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one. (c) the standing Banach hypotheses of Convention 1; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. (d) The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Source for this subsection unless a target says otherwise: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Proposition 3.2, manuscript p. 23, first proof paragraph.

Library inputs of this subsection, used by several of its targets: Mathlib `summable_geometric_of_lt_one`, `Summable.of_norm_bounded_eventually_nat`, `HasSum.mul_left`, `Commute.mul_pow`.

**Fredholm resolvent series** (supplier). For completely continuous u with Fredholm coefficients c_n, the coefficients v_0 = 1, v_n = c_n·1 + u v_(n−1) of F_u(T) = Σ_n v_n T^n satisfy (1 − Tu)F_u = F_u(1 − Tu) = P_u(T)·1 coefficientwise, a formal identity with no evaluation or convergence claim. Supplied by CompactOperators §2.4 (the resolvent coefficients) (the roadmap of W. Coram). There u is an operator on c₀(I, R); the recurrence and its formal identity hold verbatim on a (Pr) module with the coefficients of CompactOperators §1.5.

**Checks.**

- For zero u the recurrence series is the constant identity.
- For u=diag(a,b), the resolvent is diag(1−bT,1−aT).
- For a nonzero two-dimensional N with N²=0, the resolvent is 1+TN.

**Hasse derivatives of formal power series** (supplier). For any possibly noncommutative semiring B and s ∈ ℕ, the additive operation Δ_s on B⟦T⟧ with coeff_n(Δ_s f) = binom(n + s, s)·coeff_(n+s)(f), a natural-number multiple with no inverse factorial, Δ_0 = id and Δ_s(bf) = bΔ_s f. Supplied by RestrictedPowerSeries §2.3 (semiring Hasse calculus) (the roadmap of W. Coram). Write `hasseSeries` for the operation with these coefficients. Its ordered product rule and polynomial comparison are imported from that section; the normed-ring radius bounds below use this supplied operation.

**Checks.**

- Δ_0 is the identity.
- Δ²(T²)=1 in characteristic two while its second ordinary derivative is zero.
- For matrix coefficients A,B, Δ_1((AT)(BT))=2ABT with the order A before B.

**Hasse coefficient radius bound** (theorem). For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s). In addition: B need not be commutative, complete, ultrametric or norm-one. R is strictly positive. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 22–24.)

*Needs:* RestrictedPowerSeries §2.3 (semiring Hasse calculus); Mathlib `norm_pow_le_mul_norm`, `Nat.choose_le_two_pow`.

**Checks.**

- For s=0 the bound is the elementary comparison R^n≤(2R)^n.
- For f=T and s=1, the derivative is 1.
- For f=T² and s=2, the Hasse derivative is 1 even in characteristic two.

**Hasse derivatives preserve entireness** (theorem; `hasseSeries_entire`). If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring. In addition: B is a normed ring; no completeness is needed for this coefficient limit statement. (Source: Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 22–24.)

*Needs:* §4.5 (Hasse coefficient radius bound); RestrictedPowerSeries §7.2.

**Checks.**

- Δ_0 preserves every restricted radius.
- A polynomial stays polynomial after every Hasse derivative.
- Over ℝ, which is not ultrametric, Σ T^n/(n!)² and all its Hasse derivatives are entire.

### 4.6 Finite coordinates, adjugate bounds and entireness of the resolvent

Hypotheses shared by several targets of this subsection, cited by letter below: (a) K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. (b) I is an arbitrary discrete set and c_A(I) is Mathlib's C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. (c) V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

Source for this subsection unless a target says otherwise: Serre, §6, Proposition10 and Lemma3(a)–(c), printed p. 78–79.

Library inputs of this subsection, used by several of its targets: Mathlib `BoundedContinuousFunction.norm_le`, `ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `BoundedContinuousFunction.norm_coe_le_norm`, `ContinuousLinearMap.opNorm_le_bound`, `Polynomial.coeff_mul`, `tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Coefficients of the finite adjugate** (lemma). For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H), and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with the input-first operator convention. Under (a) and (b).

*Needs:* Mathlib `Matrix.adjugate`, `Matrix.adjugate_mul`, `Matrix.adjugate_one`.

**Checks.**

- `adjugate_rank_one`: For the one-by-one matrix (a), adj(I−TD)=I.
- `adjugate_diagonal_two`: For diag(a,b), the adjugate is diag(1−bT,1−aT).
- `adjugate_nilpotent_two`: For the nonzero two-by-two nilpotent Jordan matrix N, adj(I−TN)=I+TN.

**Distinct-column bound for adjugate coefficients** (lemma). Let D be a `d×d` matrix, `b_j≥0` with `‖D_ij‖≤b_j`, `n≥0` and `C≥0`. Assume `∏_{j∈S}b_j≤C` for every n-element subset S of its column index set. Every coefficient of degree n of every entry of `adj(I−TD)` then has norm at most C. Under (a) and (b).

*Needs:* Mathlib `Matrix.adjugate_fin_succ_eq_det_submatrix`, `Matrix.det_apply`, `IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Resolvent recurrence on finite coordinates** (comparison). Let u:c_A(I)→c_A(I) be completely continuous, with output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L). Under (a) and (b).

*Needs:* CompactOperators §1.2 ; §4.6 (Coefficients of the finite adjugate).

**Checks.**

- `finite_output_support_is_not_enough_for_input` (non-example): For diag(a,0), coefficient one of the (1,1) entry of adj(I−TD) is −a, whereas that of the (0,0) entry is zero, using indices0,1.

**Resolvent bound for finite output support** (lemma). Suppose u has output support in finite J. Let b_j≥0 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at most C. Then ‖V_n‖_K≤C. Under (a), (b) and (c).

*Needs:* §4.6 (Resolvent recurrence on finite coordinates); §4.6 (Distinct-column bound for adjugate coefficients); PadicFunctionalAnalysis §2.6.

**Continuity of the finite recurrence** (lemma). Let α carry any filter l. Suppose u_α→u in K-operator norm on c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n, V_(α,n)→V_n in K-operator norm. Under (a) and (b).

*Needs:* PadicFunctionalAnalysis §2.1; Mathlib `ContinuousLinearMap.toNormedRing`.

**Adjugate bound for the Fredholm resolvent** (supplier). For completely continuous u on c_A(I) whose output-column norms are bounded by b_j ≥ 0, the resolvent coefficients satisfy ‖V_n‖_K ≤ C whenever every product of n distinct b_j is at most C. Supplied by CompactOperators §2.4 (the roadmap of W. Coram). There it is the entireness of the resolvent, proved by bounding the entries of v_n, bordered principal minors, by the Hadamard bound of its §1.2 in the row norms, which is this bound in the output-column norms here.

**Checks.**

- For zero u the recurrence series is the constant identity.
- For u=diag(a,b), the resolvent is diag(1−bT,1−aT).
- For a nonzero two-dimensional N with N²=0, the resolvent is 1+TN.

**Entire tail estimate for resolvent coefficients** (lemma). Let b_j≥0 bound the output-column norms of completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0. Under (a), (b) and (c).

*Needs:* CompactOperators §2.4.

**Compression of the coefficient recurrence** (lemma). Let i:M→c_A(I) and r:c_A(I)→M be native continuous A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M, W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n. Under (a) and (b). In addition: M is a Banach A-module with compatible K-action. The stated continuous retraction is actual data; no claim that every finite module has such a retraction is made.

*Needs:* PadicFunctionalAnalysis §2.2.

**Entireness of the recurrence on a projective Banach module** (supplier). For completely continuous u on a (Pr) module with its Fredholm coefficients c_n, every recurrence V_0 = 1, V_(n+1) = c_(n+1)·1 + uV_n has ‖V_n‖_K R^n → 0 for every R > 0. Supplied by CompactOperators §2.4 (the roadmap of W. Coram). There it is stated on c₀(I, R); on a (Pr) module this roadmap compresses the recurrence of u ⊕ 0 by §4.6 (Compression of the coefficient recurrence).

**Checks.**

- For zero u the recurrence series is the constant identity.
- For u=diag(a,b), the resolvent is diag(1−bT,1−aT).
- For a nonzero two-dimensional N with N²=0, the resolvent is 1+TN.

### 4.7 Analytic resolvents and topological root projectors

Hypotheses: (a) Convention 1's Banach hypotheses, M has (Pr), u is completely continuous, and P_u and F_u are the actual Fredholm and recurrence series. (b) Norms mean K-operator norms and the compatible A-action satisfies ‖bx‖≤C‖b‖‖x‖ for an explicit C>0. (c) Hypotheses (a) and the evaluated Hasse resolvent below. (d) Hypothesis (b); a∈A, h≥0, Δ_s P_u(a)=0 for s<h, and c=Δ_h P_u(a) is a unit. Put v=1−au, z_s=Δ_s F_u(a), b=c^(−1)z_h, p=(vb)^h and E=1−p. No reducedness or coefficient-field hypothesis on A. Finite projectivity follows after §4.8.

Source: Serre §6 Proposition 10 and Lemma 3, pp. 78–79; §7 Proposition 12, pp. 80–81; Buzzard Proposition 3.2, pp. 22–24.

**Analytic Fredholm resolvent** (supplier). The resolvent series is entire, its value F_u(a) = Σ_n a^n v_n converges in operator norm for every a ∈ A, and (1 − au)F_u(a) = F_u(a)(1 − au) = P_u(a)·1. Supplied by CompactOperators §2.4 (the roadmap of W. Coram). There u is an operator on c₀(I, R); on a (Pr) module this roadmap obtains it from the zero extension by §4.6 (Compression of the coefficient recurrence).

**Checks.**

- For zero u the recurrence series is the constant identity.
- For u=diag(a,b), the resolvent is diag(1−bT,1−aT).
- For a nonzero two-dimensional N with N²=0, the resolvent is 1+TN.

**Evaluated Hasse derivatives of the resolvent** (supplier). For a ∈ A and s ∈ ℕ, the operators z_s(a) = Σ_n binom(n + s, s)a^n v_(n+s), convergent in operator norm, with z_0(a) = F_u(a) and z_s(0) = v_s. Supplied by CompactOperators §2.4 (the roadmap of W. Coram). There these are the divided evaluations Pₛ(a, u) on c₀(I, R); on a (Pr) module this roadmap compresses them as in §4.6 (Compression of the coefficient recurrence).

**Checks.**

- For zero u the recurrence series is the constant identity.
- For u=diag(a,b), the resolvent is diag(1−bT,1−aT).
- For a nonzero two-dimensional N with N²=0, the resolvent is 1+TN.

**Evaluated Hasse resolvent recurrence** (lemma). For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the two-sided resolvent identity, using z_0(a)=F_u(a). Under (a) and (b). (Source: Serre, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 22–24.)

*Needs:* RestrictedPowerSeries §2.3 (ordered Hasse product rule); CompactOperators §2.4; RestrictedPowerSeries §2.3 (polynomial Hasse comparison); CompactOperators §2.4 (the resolvent coefficients); RestrictedPowerSeries §7.2; Mathlib `HasSum.mul_right`.

**Roots of an entire series with unit constant are units** (supplier). If F is entire with F(0) = 1 and F(a) = 0, then a is a unit with inverse −Σ_n f_(n+1)a^n; in particular a positive-order Hasse root of a Fredholm determinant is a unit. Supplied by RestrictedPowerSeries §7.2 (normalized-root unit criterion) (the `isUnit_of_evalAt_eq_zero` method of `IsEntire`) (the roadmap of W. Coram).

**Checks.**

- The entire series 1 has no zeros.
- For a unit b, the root b⁻¹ of 1−bT is a unit.
- T has the nonunit root zero and fails the constant-coefficient-one hypothesis.

**Lower Hasse resolvent annihilation** (lemma). For every s<h, v^(s+1) z_s=0. Under (c) and (d).

*Needs:* §4.7 (Evaluated Hasse resolvent recurrence); CompactOperators §§2.4 and 3.5 (commuting polynomial evaluations); CompactOperators §2.4 (the resolvent coefficients).

**Explicit Hasse Riesz projector** (supplier). When Δ_s P_u(a) = 0 for s < h and c = Δ_h P_u(a) is a unit, with b = c⁻¹z_h and p = ((1 − au)b)^h, the supplied interface `rieszRootProjector` denotes E = 1 − ((1 − au)c⁻¹z_h)^h, the projector onto ker((1 − au)^h); b inverts 1 − au on the range of p; at h = 0 the formula gives E = 0. Supplied by CompactOperators §3.1 (the good-zero projector) (the roadmap of W. Coram). The supplier includes h=0, with E=0 and the inverse from its §2.5; on a (Pr) module this roadmap applies it to u ⊕ 0, whose projector is a limit of polynomials in u ⊕ 0 and so preserves M.

**Checks.**

- For u=1 on a line, a=1 has order one and E=1.
- For zero u, every a has Hasse order zero and E=0.
- For u=1+N with N²=0 on A², a=1 has order two and E=1.

**Canonical kernel and image summands** (native submodule comparison). The supplied projector, expressed through the native range and kernel submodules, has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically. Under (c) and (d). Source: CompactOperators §3.1; Serre §7, Proposition 12, pp. 80–81.

*Needs:* CompactOperators §3.1 (idempotence of the good-zero projector); CompactOperators §3.1 (the differentiated resolvent identity); Mathlib `LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `LinearMap.IsIdempotentElem.mem_range_iff`.

**Checks.**

- For h=0, E=0, ker(v^0)=0 and image(v^0)=M.
- For u=1, a=1 and h=1 on a line, image(E)=M and image(v)=0.
- For u=0, image(E)=0 and image(v^h)=M.

**Topological Riesz decomposition** (supplier). N = ker(v^h) and F = image(v^h) are closed topological complements, and E is the continuous projection onto N along F. Supplied by CompactOperators §3.1 (the roadmap of W. Coram). There it is stated on c₀(I, R); on a (Pr) module this roadmap applies it to u ⊕ 0, as for the projector.

**Checks.**

- For u=1 on a line, a=1 has order one and E=1.
- For zero u, every a has Hasse order zero and E=0.
- For u=1+N with N²=0 on A², a=1 has order two and E=1.

**Stability under commuting operators** (supplier). Every continuous A-linear endomorphism commuting with u commutes with E and p and preserves N = ker(v^h) and F = image(v^h). Supplied by CompactOperators §3.5 (the roadmap of W. Coram).

**Checks.**

- For u=1 on a line, a=1 has order one and E=1.
- For zero u, every a has Hasse order zero and E=0.
- For u=1+N with N²=0 on A², a=1 has order two and E=1.

### 4.8 Finite generation and projectivity of root kernels

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps. (b) Write `v=1−a u`, `N=ker(v^h)`, `B=a Σ_{0≤j<h}v^j`, and `i:N→M` for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed. (c) F is an A-submodule with the native topological-complement relation between N and F. Let `π:M→N` be `Submodule.projectionOntoL` along F, and put `l=πB`. (d) K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.

Source for this subsection unless a target says otherwise: Buzzard, Proposition 3.2, statement and proof on manuscript pp. 22–24.

Library inputs of this subsection, used by several of its targets: Mathlib `Submodule.projectionOntoL`, `Submodule.projectionOntoL_apply_left`, `ContinuousLinearMap.completeSpace_ker`.

**Finite geometric factor for the root operator** (lemma). For every continuous A-linear u, `a∈A` and `h≥0`, the single finite sum `B=a Σ_{0≤j<h}(1−au)^j` satisfies `uB=Bu=1−(1−au)^h`. Under (a) and (b). (Source: Buzzard, Proposition 3.2, statement and proof on manuscript pp. 22–24; derived from the cited passage, not printed there.)

*Needs:* Mathlib `geom_sum_mul_neg`, `mul_geom_sum`.

**Continuous inverse on the root kernel** (construction). Define `rieszKernelOperatorEquiv u a h` to be the native continuous A-linear automorphism of N whose forward map is the restriction of u and whose inverse is the restriction of `B=a Σ_{j<h}(1−au)^j`. Under (a) and (b). Its API consists of `rieszKernelOperatorEquiv_apply` (For `x∈N` the image under the equivalence, viewed in M, is `u(x)`), `rieszKernelOperatorEquiv_symm_apply` (For `x∈N` the inverse image, viewed in M, is `B(x)`) and `rieszKernelOperatorEquiv_subtype` (Composing the equivalence with the native inclusion i equals u composed with i, as continuous A-linear maps `N→M`).

*Needs:* §4.8 (Finite geometric factor for the root operator); Mathlib `ContinuousLinearMap.restrict`, `ContinuousLinearEquiv.equivOfInverse`, `Commute.smul_right`.

**Checks.**

- `riesz_inverse_order_zero` (degenerate): At h=0 every x∈ker(v^0) is zero, and its image under the equivalence is zero.
- `riesz_inverse_zero_parameter` (degenerate): At a=0, for every h, every x∈N is zero and its inverse image is zero.
- `riesz_inverse_identity` (compatibility): For u=identity and a=1, both the equivalence and its inverse fix every element of N, for every h.
- `riesz_inverse_jordan`: If j²=0, u=1+j, a=1 and h=2, the inverse on N acts by 1−j, including in characteristic two.

**Property (Pr) under continuous retractions** (theorem; `hasPr_of_retract`). For any normed commutative ring A and normed A-modules, if P has `HasPr` and continuous A-linear maps i:M→P and r:P→M satisfy ri=identity, then M has `HasPr`. Composing i and r with the model retraction for P proves the result. No completeness, Banach–Tate, finite-generation or norm-one hypothesis is needed. Source: Buzzard, direct-summand definition of (Pr), p. 17, and lifting characterization, pp. 17–18; this broader statement follows directly from the retract definition in §4.1.

**Checks.**

- A zero module is a retract of every model space.
- A coordinate subspace of c₀ is a continuous retract via coordinate inclusion and projection.
- Over ℤ with its usual norm, which is not Banach–Tate, the same retraction composition works.

**Property (Pr) of the complemented root kernel** (theorem; `riesz_kernel_hasPr`). If M has (Pr) and N=ker((1−au)^h) has a native topological complement F, then N has (Pr). Under (a), (b) and (c). No field, completeness or Noetherian hypothesis is needed. Source: the retract formulation of (Pr) in §4.1 and Buzzard, p. 17; compose the inclusion with the continuous complementary projection.

*Needs:* §4.8 (Property (Pr) under continuous retractions).

**Checks.**

- `rootPr_order_zero`: At h=0 the kernel is zero, a retract of every c₀ model.
- `rootPr_integer_line`: Over ℤ with its usual norm, u=1, a=1 and h=1 give N=M=ℤ with F=0; the ring need not be a K-algebra.
- `rootPr_nonNoetherian`: Over the discretely normed ring F₂[X₀,X₁,…], take M=A², u=diag(1,0), a=1 and h=1. The kernel A e_0 has complement A e_1 and (Pr), although A is not Noetherian.

**Finite-image approximation of the root identity** (lemma). For any α:M→M with finite A-image, define β=lαi:N→N using l=πB. Then β has finite A-image and ‖identity_N−β‖_K≤D‖u−α‖_K, where D=‖l‖_K‖i‖_K. The map α need not preserve N. Under (d), (b) and (c).

*Needs:* §4.8 (Finite geometric factor for the root operator); CompactOperators §0.1, **Finite image and approximation**; Mathlib `Submodule.FG.map`, `ContinuousLinearMap.opNorm_comp_le`.

**Complete continuity of the root identity** (lemma). If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then identity_N is completely continuous in the imported ordinary complete-continuity sense. Under (d), (b) and (c).

*Needs:* §4.8 (Finite-image approximation of the root identity); §4.1 (Strict norm approximation by finite-image maps).

**Finite generation of the root kernel** (theorem; `riesz_kernel_finite`). Under (d), (b) and (c), if u is completely continuous then N=ker((1−au)^h) is finitely generated over A. The preceding complete-continuity theorem for identity_N and CompactOperators §0.1, **The identity criterion**, give the result. No Fredholm good-zero or unit Hasse-derivative hypothesis is needed. Source: Buzzard, Proposition 3.2, pp. 22–24, the complemented-kernel finiteness argument.

**Checks.**

- `rootFinite_order_zero`: h=0 gives N=0.
- `rootFinite_zero_parameter`: a=0 gives N=0 for every h.
- `rootFinite_jordan`: u=1+j, j²=0 on A², a=1 and h=2 give N=A², without requiring that 2 be invertible.

**Projectivity of the finite root kernel** (specialization; `riesz_kernel_projective`). Under (d), (b) and (c), if u is completely continuous and M has (Pr), then N is finite projective. Use the local finiteness theorem and `riesz_kernel_hasPr`, then PadicFunctionalAnalysis §2.2 (finite (Pr) modules are algebraically projective). Source: Buzzard, Proposition 3.2, pp. 22–24.

**Checks.**

- `rootProjective_zero`: h=0 gives the zero projective module.
- `rootProjective_line`: u=1 on A and a=1 give N=A when h≥1.
- `rootProjective_nonfree`: For A=K×K and e=(1,0), u=1 on M=eA gives N=eA at a=1, a projective module whose rank varies between components.

### 4.9 The finite spectral transform

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–436: finite definition of D(B,P), Lemma A3.8 and Theorem A3.9; complete published argument on pp. 432–436; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.coeff_reflect`, `Polynomial.resultant_zero_left_deg`, `Polynomial.map_map`, `Polynomial.resultant_map_map`, `Polynomial.Monic.map`, `Polynomial.Monic.natDegree_map`.

**Monic reversal of a normalized polynomial** (lemma; `spectralReversal_monic`). If A is nontrivial, Q_n is monic of degree exactly n, even when degree(P)<n. Under (a). In addition: The degree equality requires A nontrivial; the other spectral laws below include the zero ring by its unique-element case.

*Needs:* Mathlib `Polynomial.natDegree_reflect_le`.

**The finite polynomial spectral transform** (supplier). D_(n,m)(B, P) is the bounded resultant over A[T], with the bounds n and m, of the rank-n reversal Q_n(Y) = reflect_n(P), its coefficients included as constants, and 1 − T B(Y); it is a polynomial in T, defined for all B and P, whose spectral meaning uses P(0) = 1 and the degree bounds. Supplied by CompactOperators §3.3 and **Prescribed finite rank** (`colemanD`, `colemanDBounded`, `colemanD_eq_colemanDBounded`) (the roadmap of W. Coram). Its `colemanDBounded n m B P` is the local restatement `polynomialSpectralResultant n m B P` here, on which the evaluation, normalization, eigenvalue, product, coefficient-map, norm and root-product lemmas of this subsection are stated at the prescribed rank.

**Checks.**

- At rank zero with P=1 the output is one.
- For B=T and normalized P of degree at most n, the output is P.
- For B=c and P=1 at rank n, the output is (1−cT)^n.

**Specializing the spectral parameter** (lemma). For every t∈A, D_(n,m)(B,P)(t)=Res_A(Q_n,1−tB;n,m). This formula requires no degree or constant-coefficient hypotheses. Under (a).

*Needs:* §4.9 `polynomialSpectralResultant`.

**Normalization of the finite transform** (lemma). If P(0)=1, the constant coefficient of D_(n,m)(B,P) is1 for every B,n,m, without degree hypotheses. Under (a).

*Needs:* §4.9 (Specializing the spectral parameter); Mathlib `Polynomial.resultant_one_right`, `Polynomial.coeff_zero_eq_eval_zero`.

**Independence of the auxiliary degree bound** (supplier). For P(0) = 1, deg P ≤ n and m ≥ deg B, D_(n,m)(B, P) = D_(n,deg B)(B, P). Supplied by CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_of_natDegree_le`) (the roadmap of W. Coram).

**Checks.**

- At rank zero with P=1 the output is one.
- For B=T and normalized P of degree at most n, the output is P.
- For B=c and P=1 at rank n, the output is (1−cT)^n.

**A single polynomial eigenvalue** (lemma). For a∈A and m≥degree(B), D_(1,m)(B,1−aY)=1−B(a)T, including a=0. Under (a).

*Needs:* §4.9 `polynomialSpectralResultant`; Mathlib `Polynomial.resultant_X_sub_C_left`, `Polynomial.eval_map_apply`.

**The exact zero-root padding factor** (supplier). For P(0) = 1, deg P ≤ n and deg B ≤ m, D_(n+1,m)(B, P) = D_(n,m)(B, P)(1 − B(0)T). Supplied by CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_succ`) (the roadmap of W. Coram).

**Checks.**

- At rank zero with P=1 the output is one.
- For B=T and normalized P of degree at most n, the output is P.
- For B=c and P=1 at rank n, the output is (1−cT)^n.

**Stability when the operator series vanishes at zero** (supplier). If moreover B(0) = 0, then D_(n+k,m)(B, P) = D_(n,m)(B, P) for every k ≥ 0, so any two valid bounds on deg P give the same transform. Supplied by CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_add_of_coeff_zero`) (the roadmap of W. Coram).

**Checks.**

- At rank zero with P=1 the output is one.
- For B=T and normalized P of degree at most n, the output is P.
- For B=c and P=1 at rank n, the output is (1−cT)^n.

**Coefficient maps preserve the finite transform** (formal coefficient-map adapter). For every homomorphism f:A→S of arbitrary commutative rings, mapping the coefficients of D_(n,m)(B,P) gives D_(n,m)(f(B),f(P)). The explicit bounds n,m remain fixed; no normalization or degree hypotheses, topology or boundedness of f are required. This gives the native formal-series comparison underlying the bounded-map interface of CompactOperators §3.3. Source: Mathlib `Polynomial.resultant_map_map` and `Polynomial.reflect_map`; Coleman, Appendix A3, pp. 434–435, the polynomial resultant construction.

**Checks.**

- The identity ring map leaves the transform unchanged.
- Reduction ℤ→ℤ/2ℤ preserves the transform of every fixed-bound input.
- For P=1 and B=c at rank two, both sides are (1−f(c)T)², retaining padded zero roots.

**Finite spectral transform as a native algebra norm** (comparison). D_(n,m)(B,P) is Algebra.norm over A[T] of the class of 1−T B(Y) in native AdjoinRoot(Q_n mapped into A[T][Y]). This identifies the fixed-bound spectral resultant with the native norm after polynomial coefficient extension. Under (a).

*Needs:* §4.9 `polynomialSpectralResultant`; §4.9 `spectralReversal_monic`; CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_of_natDegree_le`); Tau Ceti `AdjoinRoot.norm_mk_eq_resultant` and `TauCeti.Algebra.eval_charpolyRev_leftMulMatrix`.

**The finite root-product formula** (lemma). For a finite index set I, arbitrary elements a_i∈A and m≥degree(B), D_(|I|,m)(B,∏_i(1−a_iY))=∏_i(1−B(a_i)T). Repetitions and zero a_i are allowed. Under (a).

*Needs:* CompactOperators §3.3 (multiplication at prescribed ranks); §4.9 (A single polynomial eigenvalue); §4.9 `polynomialSpectralResultant`; Mathlib `Polynomial.natDegree_prod_le`, `Polynomial.coeff_zero_prod`.

### 4.10 Characteristic series of matrices and the finite spectral mapping theorem

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the bounded spectral resultant of §4.9.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem A3.9; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.reflect_reflect`, `Polynomial.reverse`, `Matrix.charpoly_natDegree_eq_dim`, `Matrix.reverse_charpoly`, `Matrix.charpolyRev`, `Matrix.charpoly_map`, `Matrix.IsUpperTriangular`, `Matrix.charpoly_monic`, `Matrix.charpoly_reindex`, `Matrix.reindexAlgEquiv`, `Polynomial.aeval_algHom_apply`; Tau Ceti `Polynomial.Monic.resultant_of_le`.

**Fixed-rank reflection of the characteristic series** (lemma). Reflecting P_M at N gives χ_M, even when the actual degree of P_M is smaller than N. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

**Degree bound for the characteristic series** (lemma). The degree of P_M is at most N. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* Mathlib `Polynomial.natDegree_reflect_le`.

**Scalar extension of the characteristic series** (lemma). For every ring homomorphism f:A→S, P_(f(M)) is the coefficient image f(P_M). No injectivity or nontriviality hypothesis is required. Under (a). (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.10 (Fixed-rank reflection of the characteristic series); Mathlib `Polynomial.reflect_map`.

**Similarity invariance of the characteristic series** (supplier). For a matrix unit U, P_(UMU⁻¹) = P_M, where P_M = det(1 − TM) is Mathlib's `Matrix.charpolyRev`. Supplied by CompactOperators §1.1 and §1.4, with the conjugation of matrices in its §1.1 (the roadmap of W. Coram).

**Checks.**

- Empty matrices have determinant one.
- A nilpotent two-dimensional Jordan block has characteristic series one.
- A scalar a on a line has characteristic series 1−aT.

**Finite characteristic spectral mapping** (supplier). For a finite square matrix M over any commutative ring and B of natural degree at most m, D_(|I|,m)(B, P_M) = P_(B(M)), with no order on the index set and B(0) arbitrary. Supplied by CompactOperators §1.1 and §3.3 (the roadmap of W. Coram). There it is Res(charpoly M, g) = det(g(M)) for every polynomial g; this roadmap takes g = 1 − T B over A[T], turns the rank-|I| reversal of P_M into charpoly M by §4.10 (Fixed-rank reflection of the characteristic series) and passes to the bound m by Tau Ceti `Polynomial.Monic.resultant_of_le`.

**Checks.**

- `finite_mapping_empty`: The empty characteristic polynomial is 1 and its resultant and determinant are 1.
- `finite_mapping_nilpotent`: For a nilpotent rank-two matrix and B=1, the characteristic series of B(M) is (1−T)² although P_M=1.
- `finite_mapping_nonreduced`: For the Jordan matrix with diagonal 2 and upper-right entry 1 over ZMod8, B=Y+Y² gives characteristic series 1+4T+4T².

**Fixed-rank resultant comparison for matrices** (comparison). The local bounded resultant D_(|I|,m)(B,P_M) equals the supplied finite characteristic spectral transform P_(B(M)) for every finite I and degree(B)≤m, over any commutative ring. Reflect P_M at the matrix rank |I|, substitute g=1−TB in CompactOperators §1.1 over A[T], and use the monic-left bounded-resultant identity. This is a normalization and coefficient-ring adapter to that theorem. Source: Coleman, Theorem A3.9, finite-operator step, pp. 435–436.

*Needs:* CompactOperators §1.1 (resultant of the characteristic polynomial); §4.10 (Fixed-rank reflection of the characteristic series); §4.9 `polynomialSpectralResultant`; Tau Ceti `Polynomial.Monic.resultant_of_le`.

**Checks.**

- `fixed_rank_adapter_empty`: The empty integer matrix gives D_(0,m)(B,1)=1.
- `fixed_rank_adapter_zero`: The zero 2×2 matrix with B=1 gives (1−T)²; using the actual degree of P_M would lose both zero eigenvalues.
- `fixed_rank_adapter_nilpotents`: The adapter gives the same 1+4T+4T² for the ZMod8 Jordan example as the supplier's matrix functional calculus.

**Finite spectral mapping for triangular matrices** (comparison). If M is upper triangular and degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)). Under (a). In addition: I has a linear order, M is upper triangular, and m bounds the degree of B. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete; derived from the cited passage, not printed there.)

*Needs:* §4.10 (Fixed-rank resultant comparison for matrices). This is its triangular specialization and introduces no generic matrix proof prerequisites.

**Checks.**

- `CharacteristicTests.empty_matrix` (degenerate): Over the integers, the empty matrix with B=1 gives D_(0,0)(1,P_M)=1.
- `CharacteristicTests.constant_operator` (non-example): Over the integers, for the zero matrix of size two and B=1, D_(2,0)(1,P_M)=(1−T)^2. Replacing the rank bound by degree(P_M)=0 would incorrectly give one.
- `CharacteristicTests.jordan_transform`: Over ZMod8, let J have rows (2,1) and (0,2), and let B(Y)=Y+Y^2. Then D_(2,2)(B,P_J)=1+4T+4T^2.
- `CharacteristicTests.jordan_aeval`: For the same J and B over ZMod8, B(J) has rows (6,5) and (0,6). Its nonzero off-diagonal entry is retained by the native polynomial calculus.

**Reindexing a characteristic series** (lemma). For a bijection e:I→J between finite index types, P_(reindex_e M)=P_M. In addition: R is a commutative ring; I and J are finite types with decidable equality; e is a bijection.

*Needs:* Mathlib `Matrix.charpoly_reindex`.

**Reindexing polynomial matrix calculus** (lemma). Reindexing B(M) along e:I→J equals B(reindex_e M). In addition: R is a commutative ring; I and J are finite types with decidable equality; e is a bijection; B is any polynomial.

*Needs:* Mathlib `Matrix.reindexAlgEquiv`, `Polynomial.aeval_algHom_apply`.

### 4.11 Reciprocal resultants and truncation limits

Hypotheses shared by several targets of this subsection, cited by letter below: (a) R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. (b) A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. (c) Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its polynomial remainder. Write Res(Q,F) for RestrictedPowerSeries §7.2's `entireResultant`, as used in §4.4 and defined by the native finite-algebra norm.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, printed p. 434–435: resultant norm interpretation, reciprocity(9), and the full proof of Lemma A3.8(11). Complete; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.sylvester`, `Polynomial.resultant`, `Polynomial.reverse`, `Polynomial.ofFn_coeff_eq_zero_of_ge`, `Polynomial.ofFn_coeff_eq_val_of_lt`, `PowerSeries.coeff_trunc`, `PowerSeries.natDegree_trunc_lt`; Tau Ceti `Polynomial.Monic.resultant_of_le`, `AdjoinRoot.norm_mk_eq_resultant`.

**Simultaneous reflection of the Sylvester matrix** (lemma). Reindex both axes of Sylvester(f,g;m,n) by the global reversal of Fin(m+n), followed by the canonical cast to Fin(n+m). The result is Sylvester(reflect_n(g),reflect_m(f);n,m). Under (a).

*Needs:* Mathlib `Polynomial.coeff_reflect`, `Fin.revPerm`.

**Reciprocal resultant with swapped factors** (lemma; `resultant_reflect_swap`). Res(reflect_m(f),reflect_n(g);m,n)=Res(g,f;n,m). Under (a).

*Needs:* §4.11 (Simultaneous reflection of the Sylvester matrix); Mathlib `Matrix.det_reindex_self`, `Polynomial.reflect_reflect`.

**Finite reciprocal spectral evaluation** (comparison). For monic Q of degree d and P.natDegree≤n, D_(n,d)(1−Q.reverse,P)(1)=Res(Q,P;d,P.natDegree). Under (a). In addition: Q is monic; d=Q.natDegree; P.natDegree≤n. The finite statement itself does not require P(0)=1.

*Needs:* §4.9 (Specializing the spectral parameter); §4.11 `resultant_reflect_swap`.

**Checks.**

- `ReciprocalLimitTests.unit_divisor` (degenerate): For every n and P over ℤ, D_(n,0)(0,P)(1)=1, agreeing with the empty resultant for Q=1.
- `ReciprocalLimitTests.linear_sign`: Over ℤ, D_(1,1)(3T,1−2T)(1)=−5, the value of1−2T at3.
- `ReciprocalLimitTests.padding` (compatibility): Over ZMod8, D_(5,1)(2T,1+T²)(1)=5; the supplied rank5 may exceed the actual degree2.
- `ReciprocalLimitTests.unnormalized` (nonexample): Over ℤ, D_(0,2)(0,2)(1)=4 but D_(0,0)(0,2)(1)=1. The absence of P(0)=1 prevents auxiliary-bound independence.

**A fixed-size resultant of the monic remainder** (lemma). For monic Q of degree d and every polynomial P, Res(Q,P;d,P.natDegree)=Res(Q,P modByMonic Q;d,d). Under (a). In addition: Q is monic of degree d.

*Needs:* Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`.

**Checks.**

- `ReciprocalLimitTests.zero_polynomial` (degenerate): Over ℤ, Res(T,0;1,0)=0; only the degree-zero divisor has resultant1 against zero.

**Continuity of a fixed coefficient resultant** (lemma). For fixed Q and m,n, the function v↦Res(Q,Polynomial.ofFn(n+1,v);m,n) from the native finite product R^(n+1) to R is continuous. In addition: R is any topological commutative ring with continuous addition and multiplication. Q is a fixed native polynomial and m,n are fixed natural numbers. The domain has the native finite product topology.

*Needs:* Mathlib `Continuous.matrix_det`.

**Truncation limit of each monic quotient coefficient** (lemma). For every k≥0, coeff_k(S_Q(F_n)) converges to coeff_k(S_Q(F)) as n tends to infinity. Under (b) and (c).

*Needs:* §4.3 (Coefficients of the monic tail quotient); RestrictedPowerSeries §7.2, **Explicit monic division** (summability of its coefficient tails); Mathlib `HasProd.tendsto_prod_nat`.

**Checks.**

- `ReciprocalLimitTests.quotient_one` (compatibility): For Q=1, coeff_k(S_1(F_n)) converges to coeff_k(F), for every entire F and k.

**Truncation limit of each monic remainder coefficient** (lemma). For every k≥0, coeff_k(F_n modByMonic Q) converges to coeff_k(R_Q(F)). Under (b) and (c).

*Needs:* §4.3 (Compatibility with native polynomial division); §4.11 (Truncation limit of each monic quotient coefficient); RestrictedPowerSeries §7.2, **Explicit monic division**; Mathlib `PowerSeries.coeff_mul`.

**Entire resultant as a limit of polynomial resultants** (theorem). For monic Q of degree d and arbitrary entire F, with F_n=trunc_(n+1)(F), Res(Q,F_n;d,deg F_n)→Res(Q,F). Under (b) and (c); no F(0)=1 hypothesis is required. The native remainder coefficients converge by the preceding targets, and the fixed-size resultant of that remainder is continuous. Source: Coleman, Appendix A3, p. 434, resultant truncation limit and quotient-norm interpretation.

*Needs:* §4.11 (A fixed-size resultant of the monic remainder), (Truncation limit of each monic remainder coefficient) and (Continuity of a fixed coefficient resultant); RestrictedPowerSeries §7.2 (monic entire resultant).

**Checks.**

- `resultantLimit_one`: Q=1 gives the constant sequence one, even when F=0.
- `resultantLimit_linear`: Q=T−a gives convergence of F_n(a) to F(a) for arbitrary a.
- `resultantLimit_unnormalized`: For Q=T² and F=b+cT, every sufficiently large truncation has resultant b², including b=0 and nonreduced A.

**Scalar spectral limit with a fixed reciprocal polynomial** (lemma). D_(n,d)(1−Q.reverse,F_n)(1) converges to Res(Q,F). Under (b) and (c).

*Needs:* §4.11 finite reciprocal spectral evaluation; §4.11 (Entire resultant as a limit of polynomial resultants), using the native reciprocal comparison of this subsection.

**Checks.**

- `ReciprocalLimitTests.linear_limit` (compatibility): For Q=T−a, D_(n,1)(aT,F_n)(1) converges to the existing convergent evaluation F(a).

**The normalized scalar limit in Coleman A3.8** (reciprocal comparison). For F(0) = 1, B = 1 − Q.reverse and B_n = trunc_(n+1)(B), D_(n,n)(B_n, F_n)(1) converges to Res(Q, F). Supplied by CompactOperators §3.3 (the roadmap of W. Coram). There B is a fixed polynomial; here B_n = B once n ≥ deg B, B(0) = 0 because Q is monic, and by CompactOperators §3.3, **Prescribed finite rank** the sequence is eventually that of §4.11 (Scalar spectral limit with a fixed reciprocal polynomial).

**Checks.**

- Res(1,F)=1, even for F=0.
- Res(T−a,F)=F(a) for every a.
- Res(T²,b+cT)=b², including over rings with nilpotents.

### 4.12 Gauss convergence of entire series

Hypotheses shared by several targets of this subsection, cited by letter below: (a) A is a normed commutative ring. Write G_R(F) for Mathlib's PowerSeries.gaussNorm applied to the coefficient norm and real radius R. IsEntire is restrictedness at every positive radius by definition, and the Gauss norm is Mathlib's, so no comparison with a separately defined supremum is needed. PowerSeries.trunc N retains precisely the coefficients of degrees less than N. Additional completeness, ultrametricity and norm-one assumptions are stated individually; no field, reducedness or Noetherian assumption is implicit. (b) The norm is ultrametric: ‖x+y‖≤max(‖x‖,‖y‖). (c) A is complete.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, complete published; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `PowerSeries.gaussNorm_eq`, `csSup_le`, `PowerSeries.gaussNorm_nonneg`, `PowerSeries.coeff_trunc`, `PowerSeries.le_gaussNorm`, `tendsto_pow_atTop_nhds_zero_of_lt_one`, `squeeze_zero`, `le_of_tendsto`, `PowerSeries.gaussNorm_add_le_max`; Tau Ceti `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`.

**Entire series and native restrictedness** (comparison). F is entire if and only if it is Mathlib's IsRestricted at every positive real radius; this holds by definition. Under (a).

*Needs:* RestrictedPowerSeries §7.2; Mathlib `PowerSeries.isRestricted_iff'`.

**Gauss norms are Mathlib's** (supplier). For every real R and every power series F, G_R(F) is Mathlib's `PowerSeries.gaussNorm` of the coefficient norm, the supremum of ‖coeff_n F‖R^n (`PowerSeries.gaussNorm_eq`); no separate supremum is defined in this roadmap. Under (a).

*Needs:* RestrictedPowerSeries §§1.1 and 7.2; Mathlib `PowerSeries.gaussNorm_eq`.

**Checks.**

- `EntireGaussTests.native_polynomial` (compatibility): For every polynomial P and real R ≥ 0, G_R of the polynomial coercion of P is the maximum of ‖coeff_n P‖R^n over n ≤ deg P.
- The zero series has G_R(0)=0 for every R.
- For a constant series and R>0, G_R(C(a))=‖a‖; no norm-one hypothesis is needed.

**Two-radius truncation estimate** (lemma). If 0<R≤S and F has native HasGaussNorm at S, then G_R(F−trunc_N(F))≤G_S(F)(R/S)^N for every N≥0. Under (a).

**Checks.**

- `EntireGaussTests.tail_boundary`: For F=aT^N and R>0 the truncation at N is zero and G_R(F−trunc_N(F))=‖a‖R^N.
- `EntireGaussTests.zero_truncation` (degenerate): The truncation at zero is zero, so its tail has the same Gauss norm as F.

**Entire truncations converge at every radius** (supplier). For entire F and R > 0, G_R(F − trunc_N(F)) → 0 as N → ∞, so polynomials are dense in A{{T}}. Supplied by RestrictedPowerSeries §§1.1 and 7.2 (the roadmap of W. Coram): §1.1 gives truncation convergence at a fixed radius and §7.2 polynomial density in the entire topology.

**Checks.**

- Polynomials are entire.
- The series Σ p^(n²)T^n over ℚ_p is entire.
- Σ p^nT^n is restricted at radius one but is not entire.

**Entire coefficient limits under radius bounds** (theorem). Let F_i be a sequence of entire series and f a formal power series. Assume every coefficient of F_i converges to that of f, and for every S>0 there is C_S≥0 with G_S(F_i)≤C_S for all i. Then f is entire. Under (a).

*Needs:* §4.12 (Entire series and native restrictedness).

**Checks.**

- `EntireGaussTests.radius_loss`: For the moving monomial T^N in a norm-one ring, its Gauss norms at radii 1/2 and 2 are exactly (1/2)^N and 2^N. Small-radius decay supplies no large-radius bound.

**Bounded coefficient limits converge in Gauss norms** (theorem; `tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded`). Under the preceding coefficient-limit and every-radius uniform-bound hypotheses, if A is ultrametric, then G_R(F_i−f) tends to zero for each R>0. Under (a) and (b).

*Needs:* §4.12 (Entire coefficient limits under radius bounds); §4.12 (Two-radius truncation estimate); Mathlib `MvPowerSeries.gaussNorm_neg`.

**Checks.**

- `EntireGaussTests.moving_monomials` (non-example): In a norm-one ring the coefficients of T^N converge individually to zero, but G_1(T^N)=1 and its evaluation at 1 is 1 for every N.

**Radius bounds for a Gauss-Cauchy sequence** (lemma). Let F_i be entire and R>0. If for every epsilon>0 there is N with G_R(F_i−F_j)<epsilon for all i,j≥N, then G_R(F_i) has a common nonnegative upper bound. Under (a) and (b).

*Needs:* §4.12 (Entire series and native restrictedness).

**Unique entire limit of Gauss-Cauchy sequences** (supplier). Over a complete ultrametric A, a sequence of entire series that is Cauchy in every Gauss norm has a unique entire limit in every Gauss norm, A{{T}} being complete for the family of Gauss norms. Supplied by RestrictedPowerSeries §§1.1 and 7.2 (the roadmap of W. Coram): §1.1 supplies completeness at each fixed radius and §7.2 completeness for all Gauss norms together.

**Checks.**

- Polynomials are entire.
- The series Σ p^(n²)T^n over ℚ_p is entire.
- Σ p^nT^n is restricted at radius one but is not entire.

**Uniform evaluation of a Gauss limit** (theorem; `tendstoUniformlyOn_entireEval_of_gauss`). Assume A is complete and ultrametric. For any filter l and family F_i of entire series, any entire f and R>0, G_R(F_i−f)→0 along l implies uniform convergence of entireEval(F_i,a) to entireEval(f,a) on the native closed ball ‖a‖≤R. Under (a), (b) and (c).

*Needs:* RestrictedPowerSeries §2.1 (the bound ‖F(a)−f(a)‖≤G_R(F−f) for ‖a‖≤R) and §7.2 (entire evaluation); Mathlib `PowerSeries.gaussNorm_eq`; Mathlib `Metric.tendstoUniformlyOn_iff`.

**Checks.**

- `EntireGaussTests.uniform_truncation_evaluation` (compatibility): For entire F, its native truncations evaluate uniformly to F on every closed ball of positive radius.
- Constant series C(a_i) with a_i→a evaluate uniformly to C(a) on each such ball.
- In a norm-one ring, T^N tends coefficientwise to zero but evaluates to 1 at 1 for every N; coefficient convergence alone does not imply uniform evaluation on the unit ball.

**Multiplication of Gauss limits** (lemma; `tendsto_gaussNorm_mul`). In an ultrametric A, if entire F_i→f and H_i→h in the native Gauss norm at a fixed R>0, then F_iH_i→fh in that same Gauss norm. Under (a) and (b).

*Needs:* §4.12 (Entire series and native restrictedness); Mathlib `PowerSeries.HasGaussNorm.hasMvGaussNorm`, `MvPowerSeries.gaussNorm_mul_le`.

**Checks.**

- `EntireGaussTests.nilpotent_product` (non-example): For e≠0 with e²=0 and R>0, f=eT has G_R(f²)=0 but G_R(f)²>0. A multiplicative Gauss-norm claim would fail.

**A radius bound for entire monic division** (lemma). Let Q be monic of degree d. If 1≤C≤S, 0<R≤S and ‖coeff_i(Q.reverse)‖≤C^i for every i, then every entire F satisfies G_R(S_Q(F))≤G_S(F)/S^d, where S_Q is the entireMonicQuotient of §4.3. Under (a) and (b). In addition: A is nontrivial, complete and norm-one, as required by the preceding monic-division construction.

*Needs:* §4.12 (Entire series and native restrictedness); §4.3 (Weighted bound for the monic quotient).

**Checks.**

- `EntireGaussTests.quotient_identity` (degenerate): Division by the monic polynomial 1 gives S_1(F)=F for every entire F.

**Continuity of entire monic division in Gauss radii** (theorem; `tendsto_gaussNorm_entireMonicQuotient`). For fixed monic Q, if entire F_i→f in every Gauss radius, then S_Q(F_i)→S_Q(f) in every Gauss radius. Under (a) and (b). In addition: A is nontrivial, complete and norm-one.

*Needs:* §4.12 (A radius bound for entire monic division); §4.3 `entireMonicQuotient`; RestrictedPowerSeries §7.2 (entireness of the quotient).

### 4.13 The spectral transform with entire functional input

Hypotheses shared by several targets of this subsection, cited by letter below: (a) R is an arbitrary commutative ring. D_(n,m)(B,P) is the polynomialSpectralResultant of §4.9 with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly. (b) A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated.

Source for this subsection unless a target says otherwise: Coleman, Appendix A3, published p. 435: definition of D and Lemma A3.8; published argument on pp. 432–436; derived from the cited passage, not printed there.

Library inputs of this subsection, used by several of its targets: Mathlib `Polynomial.resultant`, `Matrix.det_apply`, `Polynomial.sylvester`, `Polynomial.ofFn_coeff_eq_zero_of_ge`, `Polynomial.ofFn_coeff_eq_val_of_lt`, `PowerSeries.coeff_trunc`.

**Reduction of the functional polynomial at fixed characteristic rank** (lemma). If P(0)=1, natDegree(P)≤n and natDegree(B)≤m, then D_(n,m)(B,P)=D_(n,n)(B modByMonic reflect_n(P),P). Under (a).

*Needs:* §4.9 `spectralReversal_monic`; §4.9 (Finite spectral transform as a native algebra norm); Mathlib `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`.

**The finite spectral output has degree at most its rank** (lemma). For any B,P and any n,m, natDegree(D_(n,m)(B,P))≤n. Under (a).

*Needs:* §4.9 `polynomialSpectralResultant`.

**Continuity of finite spectral coefficients** (lemma). Over a topological commutative ring R, fix n,m,k and P. The kth coefficient of D_(n,m)(ofFn_(m+1)(b),P) is continuous as a function of b∈R^(m+1). In addition: R is an arbitrary commutative ring. D_(n,m)(B,P) is the polynomialSpectralResultant of §4.9 with its explicit two natural bounds, and reflect_n is native bounded reflection. Additional normalization and bounds are stated explicitly. R additionally has its given topological-ring structure; no norm or completeness is required.

*Needs:* §4.9 `polynomialSpectralResultant`; Mathlib `Polynomial.ofFn`.

**Gauss convergence of bounded-degree coefficient limits** (lemma). For any filter l, polynomials F_i and f over a normed commutative ring with all natural degrees≤d, and coefficientwise F_i→f along l, one has G_R(F_i−f)→0 for every R>0. In addition: A is a normed commutative ring. F is a polynomial-valued family on an arbitrary filter; f and every F_i have a common natural-degree bound d. G_R is Mathlib's power-series Gauss norm after the native polynomial inclusion.

*Needs:* Mathlib `PowerSeries.gaussNorm_eq`, `PowerSeries.gaussNorm_nonneg`, `Polynomial.coeff_coe`.

**Spectral transform with entire functional input and fixed polynomial input** (construction). Define E_n(B,P)=D_(n,n)(R_(Q_n)(B),P), a native polynomial, using the entire monic remainder of §4.3 and Q_n=reflect_n(P). Under (b). Its API records this defining formula, the output constant coefficient 1 for P(0)=1, and E_n(0,P)=1 for normalized P of degree at most n. The definition `entirePolynomialSpectral` in Suggested.lean uses this formula.

*Needs:* §4.3 `entireMonicQuotient`; RestrictedPowerSeries §7.2, **Explicit monic division**; §4.9 `polynomialSpectralResultant`; §4.13 (The finite spectral output has degree at most its rank); §4.9 (Normalization of the finite transform); CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_of_natDegree_le`); Mathlib `PowerSeries.trunc`.

**Checks.**

- `FixedSpectralTests.empty_rank` (degenerate): E_0(B,1)=1 for every B.
- `FixedSpectralTests.zero_function` (degenerate): The zero functional input gives1.
- `constant_padding` (non-example): For B=c constant and P=1, E_2(B,1)=(1−cT)^2, retaining both padded zero roots.
- `FixedSpectralTests.linear_value` (compatibility): E_1(B,1−aT)=1−B(a)T for entire B.
- `FixedSpectralTests.nilpotent_coefficients`: If e²=0, E_2(T,1−eT²)=1−eT²; nilpotent coefficients remain visible.
- `FixedSpectralTests.unit_input_zero_constant` (compatibility): For entire B with B(0)=0, E_n(B,1)=1 at every rank.

**Agreement with the polynomial spectral construction** (comparison). For polynomial B with natDegree(B)≤m, E_n(B,P)=D_(n,m)(B,P). Under (b).

*Needs:* §4.13 `entirePolynomialSpectral`; §4.3 (Compatibility with native polynomial division); RestrictedPowerSeries §7.2, **Explicit monic division**; §4.13 (Reduction of the functional polynomial at fixed characteristic rank).

**Coefficient limits at fixed characteristic rank** (lemma). For every k, coeff_k D_(n,N)(trunc_(N+1)(B),P) tends to coeff_k E_n(B,P) as N→∞. Under (b).

*Needs:* §4.13 (Reduction of the functional polynomial at fixed characteristic rank); §4.9 `spectralReversal_monic`; §4.11 (Truncation limit of each monic remainder coefficient); §4.13 `entirePolynomialSpectral`; §4.13 (Continuity of finite spectral coefficients).

**All-radius Gauss convergence at fixed characteristic rank** (theorem; `tendsto_spectral_fixed_polynomial_gauss` in Suggested.lean). For every R>0, G_R(D_(n,N)(trunc_(N+1)(B),P)−E_n(B,P)) tends to0. Under (b).

*Needs:* §4.13 (Coefficient limits at fixed characteristic rank); §4.13 (The finite spectral output has degree at most its rank); §4.13 (Gauss convergence of bounded-degree coefficient limits).

**Simultaneous truncation convergence for polynomial characteristic input** (theorem; `tendsto_spectral_simultaneous_fixed_polynomial_gauss`). If also B(0)=0, the simultaneous D_(N,N)(trunc_(N+1)(B),trunc_(N+1)(P)) converges in every G_R to E_(natDegree(P))(B,P). In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n is chosen as natDegree(P), and B(0)=0.

*Needs:* §4.13 `tendsto_spectral_fixed_polynomial_gauss`; CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_add_of_coeff_zero`).

**The exact zero-root padding law for entire functional input** (lemma). E_(n+1)(B,P)=E_n(B,P)(1−B(0)T). Under (b).

*Needs:* §4.13 (Coefficient limits at fixed characteristic rank); CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_succ`).

**Factor products for polynomial characteristic inputs** (theorem). If Q is also normalized with natDegree(Q)≤k, then E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q). In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Q is a normalized polynomial of natural degree at most k.

*Needs:* §4.13 (Coefficient limits at fixed characteristic rank); CompactOperators §3.3 (multiplication at prescribed ranks).

**Linear characteristic input evaluates the entire function** (theorem). For a∈A, E_1(B,1−aT)=1−B(a)T, with the preceding actual entire evaluation. In addition: A is a nontrivial complete normed commutative ring with norm(1)=1 and ultrametric norm. B is an entire native power series. P is a native polynomial with constant coefficient 1 and natDegree(P)≤n. The chosen rank n is explicit. Set Q_n=reflect_n(P), monic of degree n, and R_Q(B)=trunc_n(B−Q_n S_Q(B)), using the preceding entireMonicQuotient S_Q. No reducedness, field, Noetherianity, splitting, quotient topology or B(0)=0 hypothesis is imposed unless stated. Here n=1 and P=1−aT, including a=0.

*Needs:* §4.13 (Coefficient limits at fixed characteristic rank); §4.9 (A single polynomial eigenvalue); RestrictedPowerSeries §7.2; §4.12 `tendstoUniformlyOn_entireEval_of_gauss`.

**Newton majorants without eigenvalues** (supplier). For entire normalized P = 1 + Σ_(j≥1) c_j T^j there are real ρ_1 ≥ ρ_2 ≥ … > 0 tending to zero with ‖c_j‖ ≤ ρ_1⋯ρ_j, serving all truncations of P; for entire B with b_0 = 0 the functional majorants β_i = sup_(m≥1)‖b_m‖ρ_i^m are finite, decreasing and nonnegative and tend to zero, and ‖coeff_k D_(N,M)(trunc_(M+1)B, trunc_(N+1)P)‖ ≤ ∏_(1≤i≤k) β_i for all N, M and k, over nonreduced A with a submultiplicative norm. Supplied by CompactOperators §3.3, **Majorants** (`colemanMajorant`, `exists_newtonMajorant`, `tendsto_colemanMajorant`, `norm_coeff_colemanDBounded_le`) (the roadmap of W. Coram). There the indices start at 0, ρ₀ ≥ ρ₁ ≥ ⋯ with the bound ∏_(i<k), and β_i is `colemanMajorant B ρ_i`; the statements here use the indices shifted by one.

**Checks.**

- For B=T, β_B(ρ)=ρ.
- For B=0, all functional majorants vanish.
- For B=T², β_B(ρ)=ρ².

**Uniform all-radius tails** (majorant specialization). Fix R>0 and 0<q<1. Choose H with Rβ_i≤q for i>H and L≥β_1. Uniformly in N,M,k,

‖coeff_k D_(N,M)(B_M,P_N)‖R^k ≤ max(1,RL)^H q^(max(k−H,0)).

The right side tends to zero independently of the unbounded characteristic rank N. In particular all these outputs have uniformly small tails in G_R. API: `spectralTruncation_uniform_tail`. This estimate, rather than bounded-degree convergence, is the necessary input at the entire-characteristic endpoint.

*Needs:* CompactOperators §3.3, **Majorants** (`norm_coeff_colemanDBounded_le`); the elementary product bound separating the first H factors from the tail.

**Checks.**

- For B=T, β_B(ρ)=ρ.
- For B=0, all functional majorants vanish.
- For B=T², β_B(ρ)=ρ².

**Coefficient stabilization and functional tails** (quantitative specialization). With b_0=0 and polynomial B_M of degree at most M, coeff_k D_(N,M)(B_M,P_N) depends only on c_1,...,c_(kM) once N≥kM (and on b_1,...,b_M). This follows from its universal symmetric expression of total root-degree at most kM. For fixed k, replacing B by B_M produces a coefficient error tending to zero uniformly in N: apply the same weighted expression bound with at least one functional tail factor, bounded by η_M=sup_(m>M)‖b_m‖ρ_1^m→0, and the remaining k−1 factors bounded by max(1,β_1)^(k−1). The finite integer straightening coefficients introduce no larger norm. The coefficient-Cauchy theorem is supplied by CompactOperators §3.3, **Convergence and topology**. The local finite-coefficient and quantitative adapters are `spectralTruncation_characteristic_stable` and `spectralTruncation_functional_tail`. For k=0 the error is zero. The hypotheses b_0=0 and N≥kM must appear on the stabilization theorem.

*Needs:* CompactOperators §3.3 (polynomiality of finite spectral coefficients in the characteristic coefficients); CompactOperators §3.3, **Majorants** (the integer symmetric-polynomial straightening and its weighted bound); CompactOperators §3.3, **Prescribed finite rank** (`colemanDBounded_add_of_coeff_zero`); §4.9 (Finite spectral transform as a native algebra norm), identifying the bounded resultant with that supplied transform. For stabilization, specialize the supplied symmetric expression to the kth coefficient of ∏_i(1−T B_M(λ_i)): its root-degree is at most kM, so its elementary symmetric variables have indices at most kM; b_0=0 makes it invariant under padding by zero roots. This is the coefficient specialization of the imported identity, not a separate generic spectral-mapping theorem.

**Checks.**

- `spectralStabilization_constant_coefficient`: For k=0 the spectral output coefficient is one and the functional-tail error is zero, including rank N=0.
- `spectralStabilization_quadratic`: For B=T² and P_N=1+c_1T+c_2T²+⋯, N≥2, the coefficient of T in the output is 2c_2−c_1². It is independent of every c_j with j>2, including over nonreduced rings.
- `spectralStabilization_nonzero_constant` (non-example): For B=1 and P_N=1 at prescribed rank N, the output is (1−T)^N. Its linear coefficient is −N over Z, so b_0=0 is necessary for rank stabilization.

**Full entire spectral transform** (supplier; `exists_entire_spectral_transform` in Suggested.lean states its unique entire limit). For entire B, P with B(0) = 0 and P(0) = 1, D(B, P) is the entire series that the double truncations D_(N,M)(trunc_(M+1)B, trunc_(N+1)P) approach in every Gauss norm as N and M tend to infinity independently; it has constant coefficient 1, is multiplicative in P, and is Coleman's transform with polynomial functional input when B is a polynomial. Supplied by CompactOperators §3.3, **Convergence and topology** (`colemanDEntire`, `tendsto_gaussNorm_colemanDBounded`, `colemanDEntire_isEntire`, `colemanDEntire_coe`, `colemanDEntire_mul`) (the roadmap of W. Coram). The supplied interface label `entireSpectralTransform` denotes its `colemanDEntire B P`, which is D(B, P) here, and for polynomial P it is the fixed-rank E_(deg P)(B, P) of §4.13, the diagonal truncations converging to both by §4.13 (Simultaneous truncation convergence for polynomial characteristic input).

**Checks.**

- D(T,P)=P.
- D(0,P)=D(B,1)=1 when B(0)=0.
- For B=1 and P=1, rank-N padding gives (1−T)^N, whose linear coefficients fail to be Cauchy over ℚ_p.

**Entire operator evaluation** (supplier; `entireOperatorEval_exists`). For entire B and a continuous operator u, the supplied interface label `entireOperatorEval` denotes B(u) = Σ_m b_m u^m, which converges in operator norm, and B(u) is completely continuous when u is and b_0 = 0. Supplied by CompactOperators §3.3, **Operator evaluation and spectral mapping** (`exists_tendsto_opNorm_sum_pow`, `IsRowCompact.of_tendsto_opNorm_sum_pow`) (the roadmap of W. Coram). There u is an operator on c₀(I, R) and the conclusion has row decay, which over the Noetherian A of Convention 1 is complete continuity; on a (Pr) module this roadmap evaluates B at u ⊕ 0, b_0 = 0 giving B(u ⊕ 0) = B(u) ⊕ 0.

**Checks.**

- B=0 evaluates to zero.
- B=T evaluates to u.
- B=1 evaluates to identity, which is not completely continuous on infinite c₀.

**Infinite Coleman spectral mapping** (supplier). For completely continuous u on an ONable or (Pr) A-Banach module and entire B with B(0) = 0, P_(B(u)) = D(B, P_u) as entire series in every Gauss norm. Supplied by CompactOperators §3.3 and **Operator evaluation and spectral mapping** (`charPowerSeries_eq_colemanDEntire`) (the roadmap of W. Coram). There u is row-compact on c₀(I, R); on a (Pr) module this roadmap extends u by zero as in CompactOperators §1.5, B(0) = 0 giving B(u ⊕ 0) = B(u) ⊕ 0.

**Checks.**

- B=0 evaluates to zero.
- B=T evaluates to u.
- B=1 evaluates to identity, which is not completely continuous on infinite c₀.

### 4.14 Polynomial invertibility and finite projective spectral summands

Use Convention 1's Banach/(Pr) hypotheses, monic polynomials and degree-correct reciprocals. The targets of this subsection are supplied by CompactOperators §3.1 and §3.4.

**Polynomial Fredholm invertibility criterion** (supplier). For completely continuous u on a (Pr) module and a monic polynomial Q whose constant coefficient is a unit, Q and P_u are coprime in A{{T}} exactly when Q*(u) is invertible in the algebra of continuous A-linear endomorphisms, Q* being the degree-correct reciprocal. Supplied by CompactOperators §3.4 (the coprimality/invertibility criterion) (the roadmap of W. Coram). There the polynomial has constant coefficient 1 and unit leading coefficient and u is row-compact on c₀(I, R); this roadmap applies it to Q divided by its constant coefficient, the case that the slope decompositions of §4.16 use, and on a (Pr) module to u ⊕ 0.

**Checks.**

- Q=1 gives an invertible identity operator and is coprime to every Fredholm series.
- For u=1 and Q=1−T on a line, Q*(u)=0 and Q is not coprime to P_u.
- For zero u and a monic Q with unit constant coefficient, Q*(u)=1 and P_u=1.

**Riesz projectors at a Fredholm root** (supplier). If a ∈ A is a root of P_u of Hasse order h ≥ 1 with unit h-th Hasse derivative, then a is a unit and M = N ⊕ F into closed u-stable summands with (1 − au)^h = 0 on N and 1 − au invertible on F, N finite projective of constant rank h with P_(u|N) = (1 − a⁻¹T)^h, and the projectors in the operator-norm closure of A[u]; for h = 0, N = 0 and F = M. Supplied by CompactOperators §3.1 (`IsRieszProjection`, `exists_rieszProjection`) (the roadmap of W. Coram). There u is row-compact on c₀(I, R); on a (Pr) module this roadmap applies it to u ⊕ 0 on M ⊕ M′ ≅ c_A(I), whose projectors lie in the closure of A[u ⊕ 0] and so preserve M.

**Checks.**

- For u=1 on a line, a=1 has order one and E=1.
- For zero u, every a has Hasse order zero and E=0.
- For u=1+N with N²=0 on A², a=1 has order two and E=1.

**Finite projective slope summands** (supplier). If P_u = QS with Q a polynomial with constant coefficient one and unit leading coefficient, S entire with S(0) = 1 and Q, S coprime in A{{T}}, then M = N ⊕ F into closed u-stable summands with N finite projective of rank deg Q, Q*(u) zero on N and invertible on F, P_(u|N) = Q and the projector in the closure of A[u]; the degree-zero factor gives N = 0. Supplied by CompactOperators §3.4 (`IsRieszColemanProjection`, `exists_rieszColemanProjection`) (the roadmap of W. Coram). There u is row-compact on c₀(I, R); on a (Pr) module this roadmap applies it to u ⊕ 0, as for the Riesz projectors.

**Checks.**

- For u=1 on a line, a=1 has order one and E=1.
- For zero u, every a has Hasse order zero and E=0.
- For u=1+N with N²=0 on A², a=1 has order two and E=1.

### 4.15 Affinoid families, coefficient actions and compactness

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Urban, Lemmas 3.4.6–3.4.7, Corollary 3.4.10, and the following definition of `D_{n,U}` and `D_U`, author pp. 43–45; derived from the cited passage, not printed there.

**Affinoid-valued analytic stages** (construction). For a complete affinoid K-algebra A with a chosen submultiplicative Banach norm, define the normalized finite-chart analytic stage A_h(X,A) as Mathlib's `C₀(S × ℕ^d, A)`, used directly, realized as restricted analytic functions in the chart coordinates. This is an orthonormalizable Banach A-module; its natural integral lattice consists of coefficient families in the norm unit ball A₀. Under (a). Its API consists of the realization map, Mathlib's `ZeroAtInftyContinuousMap.ext` (Coefficient equality determines a section) and the integral-lattice description (the norm unit ball is exactly the coefficient families of norm ≤ 1, from Mathlib's `ZeroAtInftyContinuousMap.norm_toBCF_eq_norm` and `BoundedContinuousFunction.norm_le`).

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); PadicFunctionalAnalysis §2.2.

**Checks.**

- `AnalyticDistributionTests.affinoidStage_scalar` (compatibility): A=K recovers the scalar coefficient stage.
- `AnalyticDistributionTests.affinoidStage_point`: The singleton coefficient index gives A.
- `AnalyticDistributionTests.affinoidStage_empty` (degenerate): An empty chart set gives zero.

**Affinoid-valued Banach-stage distributions** (definition). Define D_h(X,A)=Hom_(A,cts)(A_h(X,A),A), Mathlib's continuous linear maps `C₀(I, A) →L[A] A`, with its operator norm. Restriction of function stages induces maps D_(h+1)→D_h; their projective limit is the A-valued locally analytic distribution space. For the c₀ basis a stage dual is a bounded coefficient family, not a c₀ family (`stageDual_exists_iff_bounded`). Under (a). Its API consists of the projective-limit maps D_(h+1)→D_h, A-linearity of evaluation (Mathlib's `map_smul`) and `stageDual_ext` (Equality on every basis coefficient determines the functional).

*Needs:* §4.15 (Affinoid-valued analytic stages); §0.3 (Strong duality for analytic compact-type spaces).

**Checks.**

- `AnalyticDistributionTests.distributionStage_point` (compatibility): For a point, evaluation at 1 identifies the dual with A.
- `AnalyticDistributionTests.distributionStage_zero` (degenerate): The zero functional has norm zero.
- `AnalyticDistributionTests.distributionStage_bounded_not_c0` (non-example): The functional summing all coefficients has basis values constantly 1, so lies in the dual while its basis family is not c₀ on an infinite index set. The summation assertion requires an ultrametric coefficient field; over ℝ no continuous functional on c₀(ℕ,ℝ) has value 1 on every basis vector, since finite vectors of norm 1 would have arbitrarily large images.

**Integral distribution lattices** (construction). In a chosen normalized analytic stage, the integral distribution lattice is {μ∈D_h(X,A):‖μ‖≤1}; equivalently μ takes the analytic coefficient unit ball to A₀={a:‖a‖≤1}. This lattice is tied to the chosen Banach model. It is not asserted to equal all power-bounded elements of a nonreduced affinoid. Under (a). Its API consists of `familyIntegralLattice` (The stage-dual norm unit ball), `familyIntegralLattice_mem` (Membership is the norm bound ≤1) and `familyIntegralLattice_smul` (A₀ scalar multiplication preserves the lattice).

*Needs:* §4.15 (Affinoid-valued Banach-stage distributions).

**Checks.**

- `AnalyticDistributionTests.integralLattice_zero` (degenerate): Zero belongs to the lattice.
- `AnalyticDistributionTests.integralLattice_point`: At a point, multiplication by a lies in the lattice iff ‖a‖≤1.
- `integralLattice_boundary` (non-example): Multiplication by p^(−1) is outside the lattice for the normalized p-adic norm; p=3 on the singleton stage is one instance.

**Scalar tensors of analytic stages** (comparison). For affinoid A/K and scalar c₀ stage E, the canonical map E⊗̂_(K,π)A→A_h(X,A) is an isomorphism of Banach A-modules, under the standard completed projective nonarchimedean tensor norm. This compares Mathlib's algebraic TensorProduct plus its separated completion; it does not replace that carrier. Under (a).

*Needs:* §0.3 (Analytic functions on finitely many polydiscs); §4.15 (Affinoid-valued analytic stages); §4.2 (Completed scalar extension of ON modules and determinants).

**The canonical distribution scalar-extension map** (construction). The bilinear map D_h(X,K)×A→D_h(X,A) sends (μ,a) to the A-linear extension of μ on the scalar analytic stage, multiplied by a. It induces a continuous map D_h(X,K)⊗̂_K A→D_h(X,A). Isomorphism for infinite-dimensional A is not asserted. Under (a). Its API consists of `distributionScalarExtension` (The continuous map from the completed scalar tensor induced by the specified bilinear coefficient extension), `distributionScalarExtension_pure` (On μ⊗a its coefficient at e_α is μ(e_α)a) and `distributionScalarExtension_finite` (For finite-dimensional A/K this is an isomorphism; for arbitrary affinoids it is only a map).

*Needs:* §4.15 (Scalar tensors of analytic stages); §4.15 (Affinoid-valued Banach-stage distributions).

**Checks.**

- `AnalyticDistributionTests.dualExtension_scalar` (degenerate): For A=K it is the identity.
- `AnalyticDistributionTests.dualExtension_point` (compatibility): At a point K⊗̂_K A→Hom_A(A,A) is multiplication.
- `AnalyticDistributionTests.dualExtension_derivative`: dδ_0⊗a has Amice coefficients a times those of log(1+T).

**One-disc coefficient action models** (construction). Let `A` be a normed commutative ring.
On `c₀(ℕ,A)`, `analyticStageDilate a` for `‖a‖ ≤ 1` has nth coefficient `a^n f_n`, the
pullback along `z ↦ az`. For complete ultrametric `A`, `analyticStageEvaluate x` for `‖x‖ ≤ 1`
is `Σ_n f_n x^n`, a continuous `A`-linear functional, including points on the boundary.
The constant-multiplier transpose `analyticStageConstantTranspose a j μ` is `(j·μ)` composed
with dilation and is defined over any normed commutative `A`. API: `analyticStageDilate_coeff`,
`analyticStageDilate_comp`, `analyticStageEvaluate_hasSum`, `analyticStageEvaluate_basis`,
`analyticStageEvaluate_dilate`. These specialize the chart constructions by explicit coefficient
formulas. *Needs:* §0.3 stage substitution, affinoid stages here and ultrametric coefficient
summation. Source: Urban Lemmas 3.4.6–3.4.7, pp.43–44; Colmez §II.4, pp.34–37.

**Checks.**

- `stageDilate_unit`: a=1 is identity.
- `stageDilate_zero`: a=0 retains precisely the constant coefficient, not the zero function.
- `stageDilate_quadratic`: The basis e_2 maps to a²e_2, distinguishing coordinate dilation from scalar multiplication by a.
- `stageConstantTranspose_dirac`: For ‖a‖,‖x‖≤1, `analyticStageConstantTranspose a j (analyticStageEvaluate x)` equals `j·analyticStageEvaluate (a*x)`. With a=j=1 it fixes point evaluation, while a=0 gives j times evaluation at zero.
- `stageEvaluate_zero`: Evaluation at zero is f_0.
- `stageEvaluate_quadratic`: Evaluation of e_2 at x is x², including x=1 on the boundary.
- `stageEvaluate_realBoundary` (non-example): Over `ℝ`, let `f_N(n) = 1/N` for `n < N` and
  zero otherwise, with `N ≥ 1`. Then `‖f_N‖ = 1/N → 0`, whereas `Σ_n f_N(n)·1^n = 1`.
  Thus the coefficient formula at `x = 1` cannot define a continuous real functional.
- `stageEvaluate_zeroFunction`: The zero analytic function evaluates to zero at every allowed point; constant coefficients one are not an analytic input on an infinite index set.

**Specialization of distribution families** (construction). For a bounded K-affinoid map η:A→B, construct the completed analytic-stage coefficient map S_η:c₀(I,A)→c₀(I,B), S_η(f)_i=η(f_i), using ‖η(a)‖≤C_η‖a‖; via §0.0 this is the canonical map of completed scalar tensors. A stage functional has basis values λ_i=μ(e_i). In the affinoid setting their uniform bound follows by restricting μ to the common nontrivially valued ground field K. For normed commutative rings `A` and `B` with `B` complete and ultrametric, the ring-general adapter requires explicit data `M ≥ 0` and `∀ i, ‖λ_i‖ ≤ M`; continuity over an arbitrary complete ultrametric source ring does not imply this bound. The coefficient map `S_η` itself is defined for any normed commutative `A` and `B`, using the displayed bound on `η`. For these data, prove summability of Σ_i f_i η(λ_i) and the estimate ‖Σ_i f_i η(λ_i)‖≤(C_η M)‖f‖ using PadicFunctionalAnalysis §2.1, then construct sp_η(μ). The dual family need not be c₀. This constructs D_h(X,A)→D_h(X,B), then its B-bilinear scalar extension D_h(X,A)×B→D_h(X,B). On coefficients it sends μ(e_α)⊗b to image(μ(e_α))b. Successive specializations carry M to C_η M and then C_θ C_η M. For every radius h retain a bound M_h for the corresponding dual coefficients; no uniform bound in h is assumed. It is compatible with radius transitions because the substitution matrices specialize coefficientwise and the bounded sums commute with η. Thus sp_η(μ)(S_η f)=η(μ(f)) on every stage, and the same formula holds on the global projective limit. This compatibility is a theorem of the constructed maps, not a supplied equality. For a finite residue-field specialization it gives the character-fibre distribution; an isomorphism after completed tensor is a separate hypothesis. Under (a). Its API consists of `familySpecialization_summable` and `familySpecialization_sum_norm_le` (Summability and the C_η M bound before constructing the map), `familySpecialization` (Specialize dual coefficients into complete ultrametric `B`, with explicit `M ≥ 0` and the bound on every basis value), `familySpecialization_coeff_bound` (The transported bound C_η M), `familySpecialization_coeff` (Basis coefficient values map by the specified algebra homomorphism) and `familySpecialization_comp` (Successive bounded coefficient maps compose on every coefficient), `analyticStageSpecialization` (The completed coefficient map S_η for any discrete index set I), `familySpecialization_eval` (The displayed evaluation comparison) and `familySpecialization_radius` (The projective-limit comparison).

*Needs:* §4.15 (Affinoid-valued Banach-stage distributions); §4.15 `distributionScalarExtension`; PadicFunctionalAnalysis §2.1 (bounded-family extension from c₀). Source: Urban, Lemmas 3.4.6–3.4.7 and Corollary 3.4.10, pp.43–45; the bounded-coefficient specialization adapter is derived here from that supplied extension.

**Checks.**

- `AnalyticDistributionTests.specialization_identity` (degenerate): Specialization along A→A is the identity on functions and on bounded dual families.
- `AnalyticDistributionTests.specialization_single`: The completed stage map sends e_i⊗a to e_i⊗η(a), preserving its index and specializing its scalar.
- `AnalyticDistributionTests.specialization_empty`: The empty analytic chart remains zero after any bounded coefficient map.
- `AnalyticDistributionTests.specialization_atom`: A-valued aδ_x specializes to image(a)δ_x. In the one-disc model both x and η(x) have norm at most one, and the specialized evaluation point is η(x).
- `specialization_discreteRing` (non-example): Give A=F₃[t] the norm ‖a‖=3^(deg a) for a≠0. It is complete, discrete and Noetherian, and c₀(ℕ,A) consists of finite-support vectors. The continuous A-linear μ((a_n))=Σ_n a_n t^n has unbounded basis values. The isometric map η:A→B=F₃((s)), η(t)=s⁻¹, with ‖s‖=1/3 is contractive. On s^n e_n→0 any coefficient-preserving specialization would have value one, and on the c₀ vector (s^n) its defining summands are all one. Thus no continuous specialization exists without the dual bound, even for a Noetherian A and contractive η.
- `specialization_realTarget` (non-example): With the usual norms, `c₀(ℕ,ℤ)` is discrete and consists of finite-support vectors. Its coefficient-sum functional has every basis value equal to one, with uniform bound `M = 1`. The inclusion `ℤ → ℝ` is contractive, but the prescribed real dual coefficients are again all one. The vectors of `stageEvaluate_realBoundary` exclude a continuous specialization, so the dual bound does not replace ultrametricity of `B`.
- `AnalyticDistributionTests.specialization_logarithm` (compatibility): For finite field specialization the unbounded Amice series specializes coefficientwise, including log(1+T).
- `AnalyticDistributionTests.specialization_two_factors`: For A=K×K and η the second projection, μ(e_0)=(1,2), μ(e_1)=(3,4), all others zero. On f=e_0+5e_1 the specialization gives 22, whereas the first projection gives 16. With μ(e_n)=(1,2) for every n, specialization is still the coefficient-sum functional multiplied by 2; on the decaying Q₃ vector f_n=3^n it gives −1 (the first projection gives −1/2). Requiring a c₀ dual incorrectly excludes it.

**Universal-character analyticity at a common radius** (comparison). Let U be an affinoid character-space chart with A=O(U), and choose coordinates on its principal Z_p^d subgroup. The universal-character section of §3.3 restricts to values χ_U(γ_i)=1+t_i. On a chart with ‖t_i‖≤r_i<1 choose h so that ‖(1+t_i)^(p^h)−1‖<p^(−1/(p−1)) for all i. Then χ_U(γ_i^(p^h z_i))=exp(z_i log((1+t_i)^(p^h))) is a restricted analytic A-valued series in z_i. Its coefficient bounds are uniform in U. Split finite torsion components separately; a general affinoid admits a finite chart cover with one common maximum h. API: `universalCharacter_stage`, `universalCharacter_stage_eval`, `universalCharacter_stage_specialize`, `universalCharacter_commonRadius`. This proves analyticity from the universal continuous character, not from continuity alone. Source: Urban Lemmas 3.4.6–3.4.7, pp. 43–44; Schneider–Teitelbaum arXiv:math/9912073v1, §2, pp. 5–7. Needs: §0.0 completed coefficient tensors, §4.15 affinoid stages, and §3.3 `rigidCharacterSpace_universal` with its affinoid charts.

**Checks.**

- `universalCharacter_trivial`: t_i=0 gives the constant character one at every radius.
- `universalCharacter_firstCoefficient`: On one principal coordinate the normalized z coefficient is log((1+t)^(p^h)); replacing χ by the scalar 1+t would lose its z-dependence.
- `universalCharacter_radius` (non-example): A continuous character with a parameter outside the exp convergence bound cannot use the unshrunk logarithmic chart; h must be allowed to grow with U. The stage formula specializes to each weight at the same chosen h.
- `analyticStage_sqrt_two` (strict boundary): On the additive principal-coordinate parameter t=√2 over Q_2(√2), h=1 fails: |(1+√2)^2−1|=1/2 is the exponential boundary. At h=2, |(1+√2)^4−1|≤1/4<1/2, so the common-radius construction applies. This agrees with the normalized Mahler coefficient check of §0.1.

**Universal-character coefficient action** (construction). Let a semigroup Σ act by analytic maps φ_σ on charts and analytic A-valued multipliers j_σ obtained by evaluating the imported universal character. Suppose φ_(στ)=φ_σ∘φ_τ and j_(στ)=j_τ·(j_σ∘φ_τ), with unit identities. Use the common-radius character theorem and the completed A-valued versions of analyticStagePullback and analyticStageMultiplier to construct bounded stage maps R_(σ,h):A_h→A_k with evaluation j_σ(x)f(φ_σ(x)). Their refinement compatibility gives actual global maps. The right function action is R_σf=j_σ(f∘φ_σ); the left distribution action is U_σμ=μ∘R_σ. The actual universal character and the automorphic semigroup are supplier inputs. Under (a). Its API consists of `universalCharacterAction` (The projective-limit transpose of these constructed universal-character stage maps), `universalCharacterAction_stage`, `universalCharacterAction_specialize`, `coefficientAction` (Its fixed-stage version when σ preserves a stage), `coefficientAction_apply` ((U_σμ)(f)=μ(j_σ(f∘φ_σ))) and `coefficientAction_comp` (U_σU_τ=U_(στ) from R_τR_σ=R_(στ)).

*Needs:* §4.15 (Affinoid-valued analytic stages); §4.15 (Affinoid-valued Banach-stage distributions); §1.3 `distributionMultiply`; §1.3 `distributionPushforward`; PadicMeasuresIwasawaAlgebras §3a.1.

**Checks.**

- `AnalyticDistributionTests.coefficientAction_identity` (degenerate): Identity pullback and multiplier return μ.
- `AnalyticDistributionTests.coefficientAction_dirac`: U_σδ_x=j_σ(x)δ_(φ_σ(x)).
- `AnalyticDistributionTests.coefficientAction_specialization` (compatibility): On a principal coordinate over A=K〈W/r〉 with r<1 and φ(z)=pz, let j(z)=(1+W)^(p^h z). Then U_σδ_1=(1+W)^(p^h)δ_p. At W=w its value on z² is (1+w)^(p^h)p². Taking w=0 gives p². Using j(p) instead of j(1) gives (1+w)^(p^(h+1))p², a wrong-action test at any w for which the two units differ.
- `AnalyticDistributionTests.coefficientAction_wrongScalar`: Over A=K×K with constant multiplier (2,3), φ(z)=pz and μ=(5,7)δ_1, the second-projection fiber has value 21p² on z². The first projection gives 10p². At p=3 these are 189 and 90. The check is computed from the constructed stage dilation `analyticStageDilate`, the constant multiplier and the stage evaluation `analyticStageEvaluate`, followed by the constructed specialization; it does not assume their evaluation comparison.

**Cocycle law and handedness** (lemma). Under the preceding cocycle identities, R_τ∘R_σ=R_(στ) and U_σ∘U_τ=U_(στ). Thus the function action is right and the dual action is left; reversing the composition of pullbacks reverses the semigroup law. Under (a).

*Needs:* §4.15 `universalCharacterAction`, the actual stage maps and their cocycle evaluation; restricted-series injectivity.


**Complete continuity from analytic contraction** (supplier; `analyticStageDilate_isCompletelyContinuous` for the one-disc dilation model). An operator on restricted series that factors through the series restricted at a radius c > 1, such as a coordinate pullback mapping a finite-chart analytic stage strictly inside its polydiscs with a multiplier bounded at the destination radius, has geometrically decaying rows and is A-completely continuous. Supplied by CompactOperators §0.3, with the row-decay criteria of its §0.2 (the roadmap of W. Coram). The supplier includes the finite-variable and finite-chart versions, with output row bound C c^(−|k|). The transposed action between dual stages is the limit of the transposed finite-image approximants; Fredholm theory on a dual stage requires its (Pr) property separately.

**Checks.**

- Strict radius improvement has decaying output rows.
- Equal-radius identity on infinitely many monomials has row norms one.
- A finite set of zero-dimensional charts gives a finite module.

**Compact algebra maps with nilpotent coordinate images** (theorem; `tateAlgebra_isCompactOperator` in Suggested.lean). Let K be Q_p or a finite extension, B a K-Banach algebra, and f:K〈T₁,…,T_d〉→B a continuous K-algebra homomorphism. If every f(T_i) is topologically nilpotent then f is compact as a K-linear map. In particular K〈T〉→K〈T/p〉 is compact. Under (a). (Source: Pan, §2.2.1 and Example 2.2.2, arXiv p. 13; derived from the cited passage, not printed there.)

*Needs:* §0.3 (Compact restriction to a smaller radius).

**Compactness for bounded formal-series inputs** (theorem). Let A=Z_p〈T₁,…,T_d〉[[x]][1/p] with the coefficient-sup Banach norm on bounded formal x-series. A continuous Q_p-algebra homomorphism f:A→B is compact when f(T_i) and f(x) are all topologically nilpotent. This A is larger than the restricted Tate algebra in x. Under (a). (Source: Pan, §2.2.1 and Example 2.2.2, arXiv p. 13; derived from the cited passage, not printed there.)

*Needs:* §4.15 (Compact algebra maps with nilpotent coordinate images).

### 4.16 Banach complexes and finite-slope decompositions

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

Source for this subsection unless a target says otherwise: Pilloni, §§13.1.1–13.1.3, author pp. 84–85; derived from the cited passage, not printed there.

**Bounded complexes of projective Banach modules** (definition). A Banach complex over affinoid A is a native cochain complex of A-modules with degreewise compatible complete Banach norms, continuous differentials, and only finitely many nonzero degrees. In the projective Banach complex category every degree has the property (Pr); this does not mean it is a finite-projective A-module. Morphisms and homotopies have continuous degreewise components. Each chosen norm is K-homogeneous and the A-action satisfies a uniform bound ‖ax‖≤c‖a‖‖x‖ for some c≥0 on each term. Normed models are explicitly identified with the native ModuleCat terms; no replacement cochain category is introduced. Under (a). Its API consists of `IsProjectiveBanachComplex` (Degreewise Banach/(Pr), continuous differentials and finite support), `projectiveBanachComplex_zero` (The zero complex satisfies these conditions) and `projectiveBanachComplex_shift` (Degree shifts transport the norms, differentials and finite support).

*Needs:* PadicFunctionalAnalysis §2.2; Mathlib `CochainComplex`, `ModuleCat`.

**Checks.**

- `AnalyticDistributionTests.banachComplex_one_degree` (compatibility): A Banach (Pr) module in degree zero is a projective Banach complex.
- `banachComplex_infinite_rank` (non-example): c_A(N) in degree zero is allowed although it is not a finite-projective algebraic A-module.
- `AnalyticDistributionTests.banachComplex_differential`: A→A with identity differential in consecutive degrees is an acyclic projective Banach complex.

**Degreewise completely continuous representatives** (definition). A continuous cochain endomorphism U of a bounded projective Banach complex is degreewise completely continuous if each degree map U^i (`degreeCLM`, transported to the identified Banach module) satisfies the single earlier A-complete-continuity predicate. The chain condition dU=Ud is required; independent operators in the degrees do not define a complex endomorphism. Under (a). Its API consists of `DegreewiseCompletelyContinuous` (Every continuous degree map has finite A-image approximants), `degreewiseCompletelyContinuous_zero` (The zero cochain endomorphism is compact in every degree) and `degreewiseCompletelyContinuous_add` (Over Noetherian A, sums of two such representatives have the same property). The addition theorem carries `[IsNoetherianRing A]` explicitly, even when the underlying normed complex is stated without (Pr). Source: Buzzard, §2, pp. 9–10, approximation definition; Pilloni §13.1.2, author p. 84, degreewise compact representatives.

*Needs:* §4.16 `IsProjectiveBanachComplex`; CompactOperators §0.1 and **Finite image and approximation** (`IsFiniteRank.isCompletelyContinuous`), with CompactOperators §0.1, **Finite image and approximation** for the sums of range-based approximants over Noetherian A.

**Checks.**

- `degreeCLM_identity` and `degreeCLM_zero`: With the continuity witnesses hc and hc₀, `degreeCLM C E e (𝟙 C) i hc = id` and `degreeCLM C E e 0 i hc₀ = 0`; transporting through e does not change these maps.
- `AnalyticDistributionTests.complexCompact_one_degree` (compatibility): A concentrated complex gives module-level complete continuity.
- `AnalyticDistributionTests.complexCompact_finite_free`: Every bounded endomorphism of a finite free complex is degreewise compact.
- `AnalyticDistributionTests.complexCompact_missing_degree` (non-example): Identity on c_K(N) in one nonzero degree is not degreewise compact.
- `complexCompact_nonNoetherian_sum` (non-example): For discretely normed A=F_2[X_0,X_1,…], I=(X_0,X_1,…) and M=A⊕I in degree zero, f(a,i)=(a,0) and g(a,i)=(−a+i,0) have finite range A⊕0. Their sum has non-finite range I⊕0; an error bound ε<1 forces exact approximation. Noetherianity is therefore essential for the range-based addition theorem.
- `complexCompact_sum_affinoid`: On a complex over a Noetherian affinoid A, the sum of two degreewise finite-image representatives satisfies the addition theorem.

**Compactness of a homotopy endomorphism** (definition). An endomorphism class in the continuous homotopy category of bounded projective Banach complexes is compact if it has a degreewise completely continuous representative. This is an existential property of the class, not a claim that every representative is compact. Under (a). Its API consists of `CompactHomotopyEndomorphism` (There exists a continuous homotopic degreewise compact representative), `compactHomotopyEndomorphism_of_rep` (A degreewise compact representative determines a compact class) and `compactHomotopyEndomorphism_homotopy` (Continuous homotopic endomorphisms have the same compactness property).

*Needs:* §4.16 `DegreewiseCompletelyContinuous`; Mathlib `Homotopy`.

**Checks.**

- `AnalyticDistributionTests.homotopyCompact_zero` (degenerate): The zero class is compact.
- `AnalyticDistributionTests.homotopyCompact_one_degree` (compatibility): A one-degree complex has no nontrivial homotopies, so this agrees with module compactness.
- `AnalyticDistributionTests.homotopyCompact_contractible`: The identity of A→A with identity differential is homotopic to zero and hence compact.

**Characteristic series of a compact complex representative** (construction). For a chosen degreewise compact representative Ũ on a bounded projective Banach complex C, put P_(C,Ũ)(T)=∏_(i:C^i≠0)det(1−TŨ^i). This is a finite nonalternating product. It is an auxiliary entire series attached to the representative and is not an invariant of the homotopy class. Under (a). Its API consists of `complexFredholmProduct` (Finite product of the chosen degree determinants), `complexFredholmProduct_coeff_zero` (Its constant coefficient is 1) and `complexFredholmProduct_enlarge` (Adding zero degrees leaves the product unchanged).

*Needs:* §4.16 `DegreewiseCompletelyContinuous`; CompactOperators §1.5.

**Checks.**

- `AnalyticDistributionTests.complexProduct_empty` (degenerate): The empty product is 1.
- `AnalyticDistributionTests.complexProduct_single` (compatibility): One degree gives det(1−TU).
- `AnalyticDistributionTests.complexProduct_acyclic` (non-example): For A→A with differential 1 and Ũ=a in both degrees, the product is (1−aT)^2, whereas the zero complex has product 1.

**Entirety of the representative product** (lemma). The chosen representative product is entire over A and has constant coefficient 1. Finite multiplication of its degree Fredholm series is legitimate in the entire Gauss topology. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.16 `complexFredholmProduct`; §4.12 `tendsto_gaussNorm_mul`.

**A contractible-complex test for characteristic products** (lemma). The acyclic complex A→A with differential 1 and scalar endomorphism a has raw characteristic product (1−aT)^2; its zero homotopy model has product 1. Consequently this raw product cannot define an invariant spectral support of derived cohomology. Under (a).

*Needs:* §4.16 `complexFredholmProduct`; §4.16 `CompactHomotopyEndomorphism`.

**Classical and geometric slope criteria** (comparison; `slopeCriterion_classical_iff_geometric`). Let A be a nonzero K-affinoid algebra, Q=Σ_(j=0)^d a_j X^j monic with a₀ a unit, and r>0. RigidAnalyticGeometry's `IsSlopeLE K r Q`, tested on algebraic-valued coefficient maps, is equivalent to every root on every geometric rank-one fibre having norm ≥r. Both are equivalent to |a_j/a₀|_sup r^j≤1 for 0≤j≤d. Indeed Q.reverse/a₀ is monic with roots λ^(−1); its roots have norm ≤r^(−1) exactly when these coefficient inequalities hold. The affinoid supremum seminorm equals both the supremum over classical points and the spectral radius; every bounded rank-one evaluation is bounded by that radius. Nilpotents do not require reducedness. Under (a). Source: BGR 3.8.2/2 and 6.2.3/3; Urban, §2.3, Definitions 2.3.1 and 2.3.6, pp. 23–25.

*Needs:* RigidAnalyticGeometry Layer 2 (supremum seminorm, BGR 6.2.3/3 comparison with spectral radius) and §7.2 (`IsSlopeLE`); AdicSpacesPartIII §R3.9, target *gelfand-spectrum-banach-ring*; AdicSpacesPartII §R1.7 (rigid–adic affinoid comparison). The field root/coefficient calculation is part of this adapter.

**Checks.**

- `slope_fibres_gauss`: On the rational annulus |S|=|p| in Q_p⟨S⟩, Q=X−S has unit constant term. Its root has norm |p| at the nonclassical rank-one Gauss point of radius |p|, as well as at every classical point of the annulus.
- `slope_fibres_nilpotent`: Over K[ε]/(ε²), Q=X−(p+ε) has the same fibre criterion as X−p; the nilpotent is invisible to both kinds of points.
- `slope_fibres_zero` (non-example): Q=X has zero constant term and zero root. It fails the positive-radius root condition and is excluded from this unit-constant comparison.

**Numerical normalization of slopes** (comparison; `numericalSlope_norm_iff`). Put q=|p|<1, r=q^h>0. For λ≠0, v_p(λ)=log|λ|/log q satisfies v_p(λ)≤h if and only if |λ|≥r, including equality. For a reciprocal Fredholm root t=λ^(−1), this is v_p(t)≥−h, or |t|≤r^(−1). Zero eigenvalues have valuation +∞ and are outside every finite h-window. Under (a). Source: Urban, §2.3, pp. 23–25; Pilloni §13.1.1, p. 84.

*Needs:* Mathlib `Real.log`, `Real.rpow` and normalized local-field valuations.

**Checks.**

- `AnalyticDistributionTests.slope_endpoint`: U=p at h=1 has |p|=r and is included in the ≤h summand.
- `AnalyticDistributionTests.slope_zero_operator`: U=0 contributes no finite slope.
- `AnalyticDistributionTests.slope_reciprocal_sign`: For U=p the eigenvalue valuation is 1 and the Fredholm-root valuation is −1.

**Numerical h-slope decomposition** (supplier). Use RigidAnalyticGeometry §7.2, `IsSlopeDecomposition K U r M₁ M₂`, with r=|p|^h: continuously complementary U-stable summands, M₁ finite projective and killed by a monic unit-constant polynomial of slope ≤r, and every such polynomial acting bijectively on M₂. The preceding fibre comparison gives exactly the geometric rank-one condition, and the normalization gives inclusive valuation ≤h. Its `IsSlopeDecomposition.exists_projection` supplies the continuous idempotent commuting with U, of image M₁ and kernel M₂. Closed summands are Banach; a bijective polynomial operator on M₂ has continuous inverse by the open mapping theorem. This is the common module-level carrier used by all finite-slope complexes below. Under (a). Source: Urban, §2.3, Definitions 2.3.1 and 2.3.6, Lemma 2.3.2 and Corollaries 2.3.3–2.3.4, pp. 23–25.

*Needs:* RigidAnalyticGeometry §7.2 (`IsSlopeDecomposition`, `IsSlopeDecomposition.exists_projection`); §4.16 (Classical and geometric slope criteria); §4.16 `numericalSlope_norm_iff`; PadicFunctionalAnalysis §1.2 (open mapping theorem), with the equivalent-norm transport of §4.1.

**Checks.**

- `slope_decomposition_endpoint`: U=p on K at h=1 gives M₁=K and M₂=0 with projector 1.
- `slope_decomposition_reciprocal`: U=p² at h=1 has M₁=0 and M₂=K. For Q=X−p^(−2), the reciprocal Q⋆(U) is zero although the root of Q has valuation −2≤h. The reciprocal-root condition is valuation ≥−h.
- `slope_decomposition_zero`: U=0 at any finite h gives M₁=0 and M₂=K with projector 0.
- `slope_decomposition_gauss`: For U=S on the rational annulus |S|=|p|, h=1 gives M₁=A and projector 1; its specialization at the rank-one Gauss point has the same endpoint eigenvalue.

**Fredholm factorization and numerical summands** (comparison; `numericalSlope_module_comparison`). A supplied coprime factorization P_U=Q R with Q(0)=R(0)=1, Q polynomial with unit leading coefficient, and every geometric fibre root of Q of norm ≤r^(−1), while R has no roots of norm ≤r^(−1), gives the supplier's `IsSlopeDecomposition` at r. The finite-projective Riesz summand is killed by the monic reversal Q*, whose constant term is a unit. Its complementary polynomial-invertibility test includes the endpoint. Under (a), with M Banach (Pr) and U completely continuous. Source: Urban, §2.3, pp. 23–25; CompactOperators §3.4.

*Needs:* CompactOperators §3.4 (`exists_rieszColemanProjection`); §4.16 (Classical and geometric slope criteria); §4.16 `numericalSlope_norm_iff`; RigidAnalyticGeometry §7.2.

**Checks.**

- `slope_factorization_endpoint`: P_U=1−pT, Q=P_U and R=1 give the whole rank-one module at h=1.
- `slope_factorization_empty`: Q=1 for U=0 gives the zero finite summand.
- `slope_factorization_separation` (non-example): With U=diag(p,p²) at h=2, selecting only Q=1−pT leaves an endpoint root in R and does not give the ≤2 decomposition.

**Functoriality of slope projectors** (lemma). A continuous A-linear map intertwining two operators with h-slope decompositions preserves their ≤h and >h summands, and commutes with the projectors. Under (a). (Source: Urban, Lemma 2.3.2, author pp. 23–24; derived from the cited passage, not printed there.)

*Needs:* RigidAnalyticGeometry §7.2 (`IsSlopeDecomposition`), with §4.16 (Classical and geometric slope criteria) and `numericalSlope_norm_iff`; CompactOperators §3.1 (polynomial closure of both projectors).

**Uniqueness of the h-slope decomposition** (lemma). An h-slope decomposition with the inclusive complement condition is unique as a continuous pair of summands. The projectors agree for any two such decompositions. Under (a). (Source: Urban, Corollary 2.3.3, author p. 24; derived from the cited passage, not printed there.)

*Needs:* §4.16 (Functoriality of slope projectors).

**The finite-slope subcomplex** (lemma). If a degreewise compact cochain representative admits a common h-slope decomposition in every degree, the ≤h summands form a bounded subcomplex, the >h summands form its complementary subcomplex, and the cochain projections are continuous. Under (a).

*Needs:* §4.16 `DegreewiseCompletelyContinuous`; §4.16 (Functoriality of slope projectors).

**Local Fredholm windows at rank-one points** (theorem; `exists_localFredholmWindow`). Let A be a K-affinoid algebra, M a Banach (Pr) A-module, U completely continuous and x a rank-one point of `Spa(A,A⁺)`, with its valuation normalized by `v_x(p)=1`. For a rational cutoff c with no eigenvalue of `U_x` of valuation c, there is a rational affinoid neighborhood V of x on which `P_U=Q_c R_c` is a coprime entire factorization, `Q_c` polynomial with `Q_c(0)=R_c(0)=1` and unit leading coefficient. At every geometric rank-one fibre of V, `Q_c` selects exactly the eigenvalues of valuation `≤c`, while `R_c` has none there. The Riesz summand `M_V^{≤c}` is finite projective; its complementary summand, factorization and projector commute with further affinoid localization. CompactOperators supplies the Riesz construction from these factors; the point-local construction of the factors is a target here. Under (a). Source: Buzzard, §4, Lemma 4.5 and Theorem 4.6, pp. 28–31; Pilloni §13.1.2–§13.1.3, pp. 84–85, with the rank-one extension and band refinement specified here.

For exact rational h=a/b, b>0, choose rational c₋<h<c₊ avoiding fibre slopes and with no fibre slopes in (c₋,c₊] except h. Such choices exist because a compact fibre operator has only finitely many slopes below any fixed finite bound. On a further rational neighborhood the selected finite band is kept at exact h: if its monic eigenvalue polynomial is E=X^d+Σ_(j<d)e_j X^j and r=|p|^h, impose |e_j|≤r^(d−j) for j<d and |e₀|≥r^d. At x these hold; after taking bth powers they are rational inequalities with powers of p as constants. The root/coefficient calculation bounds every root above by r, and the constant term bounds their product below by r^d, so every root has norm r. The empty band uses E=1. All other fibre slopes stay outside this band.

For a finite collection of degree operators of a bounded complex, choose cutoffs avoiding the union of their fibre slopes, intersect their finitely many neighborhoods and refine to a rational affinoid containing x. Restrict all factors and projectors there, and impose the finitely many exact-band inequalities together when h is fixed. This supplies common degreewise windows; the product of the selected degree factors is the selected factor of the representative product. This statement concerns neighborhoods of rank-one points and makes no covering assertion for higher-rank points.

*Needs:* CompactOperators §1.5 and §1.7 (Fredholm determinant and coefficient base change), §4.1–§4.3 (finite fibre slope bands and field factorization), §3.4 (Riesz decomposition from coprime factors); §4.16 `numericalSlope_module_comparison`; AdicSpacesPartII §R1.7 (affinoid rigid–adic comparison); AdicSpaces rational localization and gluing (§§3.1, 5.1); RigidAnalyticGeometry Layer 2 (spectral/supremum comparison). The localization and band-separation construction is part of this target, rather than an application of the norm-level dominant-index hypothesis of CompactOperators §4.3.

**Checks.**

- `slope_window_gauss`: For A=Q_p⟨S⟩, U=S and the rank-one Gauss point of rational radius |p|^(a/b), a≥0, b>0, choose c₋<a/b<c₊. The selected degree-one band has Q=1−ST; the rational refinement |S|^b=|p|^a keeps its eigenvalue at exact slope a/b, including the endpoint. S is a unit on this refinement.
- `slope_window_common_complex`: On A→A with differential S and U=S in both degrees, the same refinement |S|^b=|p|^a gives both terms the factor 1−ST and the representative product the factor (1−ST)². The differential commutes with both projectors; the selected two-degree complex has Euler characteristic zero.
- `slope_window_zero`: U=0 has P_U=1, Q_c=1 and zero finite-slope module for every finite cutoff. Zero degrees do not change the common neighborhood.
- `slope_window_cutoff_gap` (non-example): At U=p and c=1 the no-boundary-root hypothesis fails. Endpoint selection uses c₋<1<c₊ and the exact-band refinement; it is not deduced by applying the gap theorem at c=1.

**A finite perfect model on a slope window** (theorem). On an affinoid where the chosen representative product has a slope-adapted coprime factorization selecting the same finite h-window in each degree, the preceding ≤h subcomplex is a bounded complex of finite-projective A-modules, hence a perfect complex. Only the selected finite window has this algebraic finiteness assertion. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.16 (Entirety of the representative product); §4.16 (Local Fredholm windows at rank-one points), including the common neighborhood for the finitely many degrees; §4.16 (The finite-slope subcomplex); CompactOperators §3.4.

**Checks.**

- `perfect_window_one_degree`: One degree with its selected finite-projective summand gives a perfect module in degree zero.
- `perfect_window_common`: The two-degree Gauss-point window above gives a bounded finite-projective complex on one rational affinoid.
- `perfect_window_infinite_complement` (non-example): For U=0 on c_A(N), the selected complex is zero; the infinite-rank complementary Banach module is not asserted perfect.

**Algebraic slope parts** (construction; `algebraicSlopePartLE`). For an arbitrary A-module H, A-linear endomorphism U and cutoff h, define algebraicSlopePartLE H U h as the sum of ker(P(U)) over monic polynomials P with unit constant coefficient and `IsSlopeLE K |p|^h P`. Products of admissible polynomials are admissible, so an element belongs exactly when one such P annihilates it. Intertwining A-linear maps preserve this submodule. For a split slope complex it equals the image of the induced cohomology projector: one common annihilating polynomial kills the finite-window complex, while every admissible P acts invertibly on its complement as a cochain map, hence on its cohomology. No projectivity, separatedness or norm is required on H. Source: Urban §§2.3.1,2.3.6–2.3.10, pp. 23–27; this affinoid-module generalization is derived here.

*Needs:* RigidAnalyticGeometry `IsSlopeLE` and §4.16 (Classical and geometric slope criteria); native polynomial evaluation in module endomorphisms, sums of submodules; §4.16 (The finite-slope subcomplex) for the projector comparison.

**Checks.**

- `algebraicSlope_torsion`: For A=Q₃⟨S⟩ and U=1 at h=0 on A/(S), P=X−1 gives the whole nonprojective module.
- `algebraicSlope_zero_operator`: U=0 gives zero at every finite cutoff, since P(0) is a unit.
- `algebraicSlope_contractible`: A contractible complex has zero cohomology and zero algebraic slope part.

**Cohomology and finite slopes** (comparison). For such a split cochain representative, `H^j(C^{≤h})` identifies algebraically with `algebraicSlopePartLE` `H^j(C) U h`, the image of its induced cohomology projector. Cohomology is formed as `ker d/im d` even when `im d` is not closed; no Hausdorff Banach norm on arbitrary `H^j(C)` is assumed. Under (a). (Source: Urban, Proposition 2.3.9 and §2.3.10, author pp. 26–27; derived from the cited passage, not printed there.)

*Needs:* §4.16 `algebraicSlopePartLE`; §4.16 (The finite-slope subcomplex); §4.16 (A finite perfect model on a slope window).

**Homotopy invariance on a finite slope window** (lemma). Continuous U-equivariant cochain homotopy equivalences induce homotopy equivalences between their finite h-slope complexes on common slope-adapted affinoids. Their finite-slope cohomology and coherent support agree, even though their raw representative products may differ. Under (a).

*Needs:* §4.16 (Functoriality of slope projectors); §4.16 (A finite perfect model on a slope window); §4.16 (Cohomology and finite slopes).

**Derived base change of a finite slope complex** (comparison). On compatible slope-adapted affinoids `A→B`, the finite perfect slope complex base changes to `C^{≤h}⊗_A B` and represents its derived tensor product. It agrees with the finite slope complex over B once the imported operator/factorization base-change hypotheses hold. Cohomology commutes with underived base change only under additional flatness or vanishing-Tor hypotheses. Under (a). (Source: BCGP I, §6.1.1, arXiv p. 139; Theorem 6.3.16 and proof, arXiv pp. 152–153; derived from the cited passage, not printed there.)

*Needs:* §4.16 (A finite perfect model on a slope window); §4.2 (Completed scalar extension of ON modules and determinants).

**Local constancy of exact-slope module rank** (theorem). For a compact operator on a projective Banach affinoid module and fixed rational h∈Q, the dimension of its exact-h fibre summand is locally constant near each rank-one point in the rank-one locus. Use the local Fredholm windows and rational exact-band refinement of the preceding existence theorem; the exact-h term is a difference of nested finite-projective summands on that neighborhood. This assertion is not a cover of all higher-rank points of Spa(A). Under (a). (Source: Pilloni, §13.1.1 and Proposition 13.1.3.1 with proof, author pp. 84–85; Coleman Proposition A5.5 and Corollary A5.5.1, printed pp. 441–442; derived from the cited passage, not printed there.)

*Needs:* §4.16 (Local Fredholm windows at rank-one points); RigidAnalyticGeometry §7.2 (`IsSlopeDecomposition`), with §4.16 (Classical and geometric slope criteria) and `numericalSlope_norm_iff`.

**Checks.**

- `exactSlope_rational_endpoint`: For h=a/b∈Q, b>0, the rank-one equality |λ|^b=|p|^a is cut out by both rational inequalities near a nonzero eigenvalue. An eigenvalue of valuation exactly h is included.
- `exactSlope_irrational_radius` (non-example): On Q_p⟨S⟩ with U=S, the exact-h rank is one at the Gauss point of radius p^(−h) and zero at nearby different radii. For irrational h>0 no rational neighborhood isolates that radius; this parameter is excluded.
- `exactSlope_zero_eigenvalue`: U=0 has no exact finite-h eigenvalue, so the exact-h rank is constantly zero.

**Local constancy of the finite-slope Euler characteristic** (theorem). For fixed rational h∈Q and a bounded finite-projective slope complex in a rank-one weight neighborhood, the alternating sum of exact-h fibre cohomology dimensions is locally constant, equal to the alternating sum of the locally constant ranks of its exact-h terms. Individual cohomology dimensions may jump. Under (a). (Source: Pilloni, Proposition 13.1.3.1 and proof, author pp. 84–85; BCGP I, §6.1.1, arXiv p. 139, Theorem 6.3.16 and proof, arXiv pp. 152–153.)

*Needs:* §4.16 (A finite perfect model on a slope window); §4.16 (Local constancy of exact-slope module rank).

**Checks.**

- `exactSlopeEuler_one_degree`: A complex in degree zero recovers rational exact-slope module rank.
- `exactSlopeEuler_jumping_cohomology`: For A→A with differential S and U=1 in both degrees, h=0 selects both terms; the fibre cohomology dimensions jump at S=0 but their alternating sum stays zero.
- `exactSlopeEuler_irrational` (non-example): Q_p⟨S⟩ in degree zero with U=S gives the irrational-radius failure above. Zero eigenvalues contribute nothing at any finite rational h.

**Extension through a factorized operator** (lemma). Suppose r:D→C and a:C→D are continuous intertwining maps with U_C=r a and U_D=a r. If a cohomology class f in C satisfies f=P(U_C)f with P(0)=0, write P=XQ and define its extension to D by a(Q(U_C)f). Then restricting it by r gives f. This is the type-correct finite-slope extension formula. Under (a). (Source: Pilloni, Corollary 13.2.4.2 and proof, author pp. 87–88; derived from the cited passage, not printed there.)

*Needs:* §4.16 (Cohomology and finite slopes).

**Independence of the finite-slope extension polynomial** (lemma). Under the factorized-map hypotheses and finite h-slope decompositions, restriction `r:D^{≤h}→C^{≤h}` is an isomorphism with inverse `a·U_C^(−1)`. Therefore the finite-slope extension does not depend on the choice of `P=XQ` satisfying `f=P(U_C)f`. Under (a). (Source: Urban, Corollary 2.3.4, author p. 24; Pilloni Corollary 13.2.4.2, author pp. 87–88; derived from the cited passage, not printed there.)

*Needs:* §4.16 (Extension through a factorized operator); §4.16 (Functoriality of slope projectors); RigidAnalyticGeometry §7.2 (`IsSlopeDecomposition`), with §4.16 (Classical and geometric slope criteria) and `numericalSlope_norm_iff`.

### 4.17 Fréchet presentations, Stein exhaustions and the torus order

Hypotheses shared by several targets of this subsection, cited by letter below: (a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm satisfying ‖1_A‖=1. Numerical slopes are tested on geometric rank-one fibres.

**Compact factorization on Fréchet presentations** (definition). Let `V=lim_n V_n` be a projective system of Banach modules with compact transition `t_n:V_(n+1)→V_n`. A compatible operator has compact-stage factorization when there are bounded `a_n:V_n→V_(n+1)` with `U_n=t_n a_n` and `U_(n+1)=a_n t_n`. This is additional data, not a consequence of Fréchet completeness. Under (a). Its API consists of `CompactStageFactorization` (Compact transitions `t_n` and bounded `a_n` with `U_n=t_na_n` and `U_{n+1}=a_nt_n`), `compactStageFactorization_zero` (Compact transitions with zero stage operators admit `a_n=0`) and `compactStageFactorization_compatible` (The factorization implies `U_n t_n=t_n U_{n+1}`). (Source: Urban, §2.3.12 and Lemma 2.3.13, author pp. 27–28; derived from the cited passage, not printed there.)

*Needs:* CompactOperators §0.1, **Finite image and approximation** (`IsFiniteRank.isCompletelyContinuous`); §4.16 `IsProjectiveBanachComplex`.

**Checks.**

- `AnalyticDistributionTests.frechetFactor_zero` (degenerate): Zero stage operators factor through any compact transition system.
- `AnalyticDistributionTests.frechetFactor_finite`: The constant system A with identity transitions and scalar U=a factors with a_n=a.
- `frechetFactor_noncompact` (non-example): The constant system c_K(N) with identity transitions fails the compact-transition condition, even if U=0.

**Finite slopes of a compact Fréchet factorization** (theorem). If the stage operators in the preceding factorization have h-slope decompositions with finite-projective ≤h summands, the transitions identify all stage ≤h summands; the induced Fréchet operator has this common finite-slope module. Its characteristic finite-window factor is independent of the chosen stage. Under (a). (Source: Urban, Lemma 2.3.13, author pp. 27–28; derived from the cited passage, not printed there.)

*Needs:* §4.17 `CompactStageFactorization`; §4.16 (Independence of the finite-slope extension polynomial); §4.16 (Uniqueness of the h-slope decomposition).

**Stein exhaustions for finite-slope operators** (comparison). Import quasi-Stein/Stein spaces, their nested affinoid exhaustions, dense restriction maps and coherent Theorems A and B from AdicSpacesPartIII §R3.4. For a chosen coherent analytic coefficient sheaf, its section module is the Fréchet limit of affinoid section Banach modules. To use compact-stage factorization, the Stein exhaustion must give inner/compact restrictions in the actual coefficient norms; BCGP25’s relatively compact closure-proper criterion must be compared with the supplier’s Kiehl criterion. Under (a). (Source: BCGP II, Definition 2.2.17, printed p. 21; §§4.6.46–4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* AdicSpacesPartIII §R3.4 (*quasi-stein-space* with its dense restriction maps, *quasi-stein-theorem-a* and Kiehl's Theorem B on quasi-Stein spaces); §4.17 `CompactStageFactorization`.

**Character-valuation adapter** (comparison). For a Q_p-torus T, let Tᵈ be its maximal split subtorus and choose a finite Galois splitting field E. Define `torusCharacterValuation` as the negative of the imported `torusValuationMap` of ReductiveGroupsPartII §RG2.1.2, under X_*(Tᵈ)⊗Q≃the rational invariant cocharacter space. The additional statement is its pairing with **geometric** χ∈X*(T_E): 〈χ,w(t)〉=v_p(χ(t)), with v_p(p)=1 on E. To prove it, average χ over Gal(E/Q_p); invariance of t and the extended valuation gives the rational-character formula after multiplying by the Galois degree, then divide in Q. Thus no assumption that every geometric character is rational is needed. Negation transports the supplier's lattice Λ_RG to Λ=−Λ_RG and its compact kernel to T_c; it also transports the supplier's quotient isomorphism. In particular the quotient is Λ, not the whole rational vector space. API: `torusCharacterValuation_pairing` (the geometric formula), `torusCharacterValuation_apartment` (w=−v_RG on all T(Q_p)), `torusCharacterValuation_splitCocharacter` (w(λ(p))=λ), `torusCharacterValuation_kernel_comparison` and `torusCharacterValuation_lattice_comparison` (transport of the named supplier objects under negation). These are sign and character comparisons, not a second kernel/lattice development. Source: BCGP II §1.8.5 and (1.8.6), p. 9; §4.6.46, pp. 93–94. Needs: ReductiveGroupsPartII §RG2.1.2, target *torus-valuation-map* as in the supplier contracts, torus character/cocharacter duality from ReductiveGroups Layer 4, finite splitting and the root datum from ReductiveGroups Layer 7, and normalized local-field valuations.

**Checks.**

- `torusValuation_split_line`: For G_m and t=p, w(t)=1 in Z⊂Q; for t=p^(−2) it is −2; a unit has value zero. The image is Z, so 1/2 is not in the image.
- `torusValuation_anisotropic`: For the norm-one torus of an unramified quadratic extension, every Q_p-point is a unit (the norm valuation is twice its valuation); Tᵈ=0, Λ=0 and T_c=T(Q_p).
- `torusValuation_product`: For G_m times that norm-one torus, valuation ignores the anisotropic coordinate and has compact kernel Z_p^× times the whole norm-one group. Taking only rational characters must agree with, not replace without proof, the geometric-character construction.

**Positive torus monoids and spanning** (construction). Now T is a maximal torus in a Q_p-Borel of a quasi-split reductive group, with its chosen positive restricted roots. `positiveTorusMonoid` consists of t with 〈α,w(t)〉≥0 for all positive roots; `strictPositiveTorusSet` uses >0. The latter is a semigroup and need not contain identity. Its valuation image is Λ intersected with the open chamber; for the non-strict monoid it is Λ intersected with the closed chamber. Choose a strictly dominant rational cocharacter from the imported root datum and clear denominators to obtain λ_0∈Λ. For λ∈Λ choose N large so that λ+Nλ_0 is dominant. Then λ=(λ+Nλ_0)−Nλ_0 is a difference of two positive valuations. Therefore the group completion of w(T⁺) is Λ and its real span is Λ⊗R. If the root set is empty take λ_0=0 and T⁺=T, with the same conclusion; central directions occur with both signs. API: `positiveTorusMonoid_mem`, `strictPositiveTorusSet_mem`, `positiveTorusMonoid_valuation`, `positiveTorusMonoid_difference`, `positiveTorusMonoid_spans`. This uses the dominant-cocharacter supplier; it does not re-plan root data or assert that every chamber lattice monoid is a free N^r. Source: BCGP II §4.6.46, pp. 93–94, with the explicit spanning proof derived here. Needs: previous valuation construction and the root datum and positive roots of ReductiveGroups Layer 7, with its dominant chamber.

**Checks.**

- `torusPositive_SL2`: On diag(t,t^(−1)) in SL₂, the positive root is t↦t². Thus t=p has root valuation 2 and belongs to T⁺⁺; t=p^(−1) does not belong to T⁺. The valuations are N and the strict valuations are positive integers.
- `torusPositive_rootless`: For G_m alone there are no roots; T⁺=T and w(T⁺)=Z with both signs. Identity belongs even to the vacuously strict set. An N-only convention would be wrong here.
- `torusPositive_anisotropic`: The preceding anisotropic torus has zero lattice; its rootless positive set is all points and spans the zero vector space. In a product with a central split line the chamber imposes no bound on the central integer.

**Slope order and opposite apartment sign** (comparison). On Hom_R(Λ⊗R,R), define `torusSlopeLE λ′ λ` by (λ−λ′)(w(t))≥0 for all t∈T⁺. The spanning theorem gives antisymmetry. A continuous Cp-valued character has valuation zero on the compact subgroup (a compact additive subgroup of R is zero), hence factors through Λ and defines `torusCharacterSlope`. API: `torusSlopeLE_refl`, `torusSlopeLE_trans`, `torusSlopeLE_antisymm`, `torusCharacterSlope_pairing`, `torusCharacterSlope_mul`, `torusSlopeLE_center_eq`. The last says comparable slopes agree on the central split subspace since both directions are positive. For t∈Tᵈ(Q_p), ReductiveGroupsPartII's apartment translation (§RG2.1.2, *torus-valuation-map*) ν_RG(t) has pairing −v_p(χ(t)); under the cocharacter identification, `torusCharacterValuation_apartment` states w(t)=−ν_RG(t), as proved by the adapter above. This sign comparison is explicit before numerical finite-slope adapters use it. Source: BCGP II §1.8.5, p. 9 and Remarks 4.6.47–4.6.48, pp. 94–95; ReductiveGroupsPartII §RG2.1.2. Needs: the preceding monoid spanning theorem, imported apartment translation and lattice duality.

**Checks.**

- `torusSlope_SL2`: In the SL₂ one-dimensional chamber, λ_s(n)=sn satisfies λ_s≥λ_t iff s≥t. At t=p, the character t↦t^k has slope k, while apartment translation is −1.
- `torusSlope_wrong_sign` (non-example): At p, declaring w=ν_RG would assign slope −1 to the identity character of G_m. It contradicts v_p(p)=1 and reverses the SL₂ comparison between slopes 0 and 1.
- `torusSlope_rootless`: For G_m alone comparability is equality, since n and −n both test the inequality. On the anisotropic zero lattice there is exactly one slope; in a central split product comparable slopes have equal central component.

**Classical finite windows** (comparison). For a completely continuous single operator on a Banach (Pr) module, a slope-adapted finite window gives the finite-projective Riesz summand of §4.14. Over an affinoid coefficient algebra this summand defines a coherent module on that affinoid; over a field it is finite dimensional. Compact-stage factorizations identify these windows across the Fréchet presentation. This is the classical input to the analytic solid constructions in the cited source; solid localization and its reconstruction theorem are outside the scope of this roadmap. Under (a). (Source: BCGP II, §4.6.46 and Remark 4.6.49, printed pp. 93–95; derived from the cited passage, not printed there.)

*Needs:* §4.16 (A finite perfect model on a slope window); §4.17 (Stein exhaustions for finite-slope operators); §4.17 (Slope order and opposite apartment sign).

### Examples

The identity on c₀(ℕ, A) is not completely continuous, while the identity on A is; a rank-one operator has Fredholm determinant 1 − T·tr; the determinant of a diagonal operator with entries a_i tending to zero is the product ∏(1 − a_i T); over A = K × K and over the dual numbers the finite spectral transform retains the chosen rank; the characteristic series of a nilpotent 2 × 2 matrix is 1 although the operator is not the identity; a contractible complex has trivial finite-slope cohomology for every slope bound; a one-dimensional eigenvalue of valuation h belongs to the ≤ h summand.

### Dependencies

Layers 0–3 for the families and complexes; Mathlib `ZeroAtInftyContinuousMap`, `PowerSeries` with `IsRestricted` and `gaussNorm`, `Polynomial` with `resultant`, `hasseDeriv`, `charpolyRev`, `AdjoinRoot`, `ModuleCat`, `CochainComplex`, `Homotopy`; Tau Ceti `AdjoinRoot.norm_mk_eq_resultant`, `Polynomial.Monic.resultant_of_le`, `TauCeti.PowerSeries` (restricted series, Gauss norm); PadicFunctionalAnalysis §1.4, §2.1–§2.2 and §2.6 (Banach modules, c₀, orthonormalizable and (Pr) modules); CompactOperators Layers 0–3 (complete continuity, Fredholm determinants, resolvents, Riesz projectors and Coleman's transform); RestrictedPowerSeries §§1.1, 2.1, 2.3 and 7.2 (Gauss completeness and generic entire algebra); RigidAnalyticGeometry §7.2 (the common module-level slope decomposition), with the fibre comparison and local Fredholm-window existence of §4.16; AdicSpacesPartIII §R3.6 (complete continuity over affinoids) and §R3.4 (quasi-Stein spaces); ReductiveGroups Layers 4 and 7 and ReductiveGroupsPartII §RG2.1.2 (torus, roots and apartment translation), with the additional slope comparisons specified in §4.17.

## Downstream consumers

The constructions of p-adic L-functions on ray-class groups (ray-class character spaces, growth adapters and evaluation, Layers 2 and 3), the p-adic L-functions of modular symbols (the strict slope threshold of §2.1 and the operator theorems of Layer 4), p-adic families and eigenvarieties (the Banach stages of Layer 0 and slope decompositions compatible with specialisation on slope-adapted affinoids, Layer 4), Coleman integration (local primitives and the open-disc series of Layer 1), Dirichlet p-adic L-functions (branches, logarithms and poles, Layers 1 and 3), p-adic regulators (the Amice toolbox of Layer 1), the Iwasawa cohomology of (φ, Γ)-modules (finite-slope complexes, §4.16) and the removal of auxiliary geometric hypotheses by finite-slope base change for automorphic Galois representations (§4.16) consume this roadmap through the targets named in each layer. None of them is a prerequisite of anything here.

## Source corrections

The following readings differ from the printed sources and are used in the statements above.

- Coleman, Lemma A3.1 (p. 432): the hypothesis on H must be that H is entire, not merely a restricted series on the closed unit disc; with the printed hypothesis the conclusion that G is constant fails. §4.3 states the entire form.
- Coleman, proof of Lemma A3.4 (p. 433): the polynomial `K(T)` is missing its leading term; it is `T^n + Σ_{i=1}^n (−1)^i c_i T^{n−i}`, as the monic Q of the construction requires. §4.10 uses the corrected form.
- Loeffler, Definition 2.12 and Remark 2.13 (pp. 4–5): the simultaneous first-difference condition with the cofinite filter on `ℕ^g` does not describe the completed tensor of the one-variable `C^{r_i}` spaces. For `G = ℤ_p²`, `r = (1/2, 0)` and `f = 1 ⊗ 1_{pℤ_p}`, the first-difference valuation at `(m_1, 0)` is 0 while the condition requires it to exceed `m_1/2` along infinitely many tuples, although f is a locally constant tensor. §2.2 uses the completed tensor and its wavelet norm instead.
- Pilloni, §13.1.1 (p. 84), condition 4 puts the roots of Q above h and applies the reciprocal Q⋆(U). In the eigenvalue formulation of §4.16 the complementary summand instead inverts every monic Q(U) whose roots have valuation ≤h. Equivalently, in reciprocal notation with Q(0)≠0, the roots of Q must have valuation ≥−h. BCGP I, §6.1.1 (p. 139), uses Q(U) but excludes the endpoint h. Equality is required: an eigenvalue of valuation h belongs to the ≤h summand. In Pilloni’s proof of Corollary 13.2.4.2 (p. 87), for P=XQ with U_C=r a the extension is f↦a(Q(U_C)f), followed by restriction by r; the raising map is not an endomorphism of the source. §4.16 uses this factorised extension.

## References

- CHJ: P. Chojecki, D. Hansen and C. Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, Doc. Math. 22 (2017), 191–262, [arXiv:1507.04875v2](https://arxiv.org/abs/1507.04875v2), §2.6, Lemma 2.23(2), pp. 19–20 of that version.
- Colmez–Dospinescu–Nizioł, *Cohomology of p-adic Stein spaces*, [arXiv:1801.06686v2](https://arxiv.org/abs/1801.06686v2), §2.1.1–§2.1.3, pp. 7–10: locally convex categories, strictness, left hearts and tensor comparisons; §3.1.1–§3.1.3, Proposition 3.2, Lemma 3.4 and Proposition 3.12, pp. 13–18, and Appendix A.1–A.5, pp. 60–61: Stein cohomology and completed comparison.
- Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*, [author text](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §0.3, pp. 6–7, and §0.6, pp. 10–12: nonproper curve Hyodo–Kato cohomology, completed geometric comparison and curve towers.
- J.-P. Schneiders, *Quasi-abelian categories and sheaves*, Mém. Soc. Math. France 76 (1999), §1.2, especially Proposition 1.2.27, Corollary 1.2.28 and Proposition 1.2.29, pp. 26–29: categorical heart and strict-exact embedding. [Public text](https://www.numdam.org/item/10.24033/msmf.389.pdf).
- Buzzard: K. Buzzard, *Eigenvarieties*, author manuscript (2006), §2, Propositions and Lemmas 2.1–2.13, pp. 6–21. (https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf)
- Serre: J.-P. Serre, *Endomorphismes complètement continus des espaces de Banach p-adiques*, Publ. Math. IHÉS 12 (1962), 69–85. (https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf)
- Coleman: R. F. Coleman, *p-adic Banach spaces and families of modular forms*, Invent. Math. 127 (1997), 417–479; page numbers are those of the published version, Appendix A (pp. 432–436) unless an author-manuscript locator is given. [author manuscript](https://math.uchicago.edu/~fcale/Files/Cole2.pdf).
- Colmez: P. Colmez, *Fonctions d'une variable p-adique*, Astérisque 330 (2010); page numbers are those of the author's PDF (47 pages). (https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf)
- RJW: J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2. (https://arxiv.org/pdf/2309.15692v2)
- Schneider–Teitelbaum compact-type duality: P. Schneider and J. Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL₂*, §1, Theorems 1.1 and 1.3, Corollary 1.4, pp. 3–4. (https://arxiv.org/abs/math/9912073v1)
- Schneider–Teitelbaum: P. Schneider and J. Teitelbaum, *p-adic Fourier theory*, Doc. Math. 6 (2001), arXiv:math/0102012v1. (https://arxiv.org/pdf/math/0102012v1)
- Colmez–Nizioł: P. Colmez and W. Nizioł, *On the cohomology of p-adic analytic spaces, II: the C_st-conjecture*, Duke Math. J. (2025), Appendix A. (https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf)
- Loeffler: D. Loeffler, *p-adic integration on ray class groups and non-ordinary p-adic L-functions*, arXiv:1304.4042v3. (https://arxiv.org/pdf/1304.4042)
- Kohlhaase: J. Kohlhaase, *The cohomology of locally analytic representations*, J. reine angew. Math. 651 (2011). (https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf)
- Pilloni: V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, author manuscript. (https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf)
- Urban: E. Urban, *Eigenvarieties for reductive groups*, Ann. of Math. 174 (2011). (https://www.math.columbia.edu/~urban/eurp/eigen.pdf)
- BCGP I: G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3. (https://arxiv.org/pdf/1812.09269)
- BCGP II: G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1. (https://arxiv.org/pdf/2502.20645)
- Pan: L. Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, arXiv:2209.06366v1. (https://arxiv.org/pdf/2209.06366v1)
- Ingleton: A. W. Ingleton, *The Hahn–Banach theorem for non-Archimedean valued fields*, Proc. Cambridge Philos. Soc. 48 (1952), 41–45.
- Schneider: P. Schneider, *Nonarchimedean Functional Analysis*, [author lecture notes](https://www.uni-muenster.de/IVV5WS/WebHop/user/pschnei/lectnotes/nfa.pdf), §§1–4 (locally convex spaces) and §9, Proposition 9.2, printed pp. 57–58, and Corollaries 9.3–9.4, printed p. 58 (Hahn–Banach).
- BGR: S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261 (1984), §§2.7, 3.7 (finite modules over Banach algebras) and 5.1–5.2 (Tate algebras).
