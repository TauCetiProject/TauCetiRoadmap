# Roadmap: heights, rational points and obstructions

**Summary.** Build heights, abelian Kummer descent and Mordell–Weil; construct adelic points, Brauer–Manin and torsor descent; prove curve finiteness, finite-rank intersections and abelian small-point results.

## Scope and ownership

This roadmap owns height classes and the extension of the Weil machine to generalized global fields, abelian canonical heights, bounded point metrics, local Weil functions, polarized function-field heights, fppf Kummer maps over arbitrary fields and function-field Kummer local conditions, the trace/Lang–Néron theorem, adelic points of varieties, arithmetic torsor descent, Parshin covers, integral-point finiteness, stabilizers/Ueno loci, finite-rank Mordell–Lang and Bogomolov. Sections 5.17a–g own the arbitrary-dimensional arithmetic divisor action, adelic cycle heights, Hilbert–Samuel, Nakai, minima and variation needed here. Section 5.7a restricts FiniteFlatGroupsAndIntegralPadicHodgeTheory's Dieudonné anti-equivalence to connected formal p-divisible groups and compares its scalar normalizations and cotangent spaces; §§5.7b–d own the decomposition by weights of a commuting isogeny. The underlying isocrystal slope classification belongs to CrystallineCohomology §CR.4.7. The codimension-one arithmetic divisor and metrized-line dictionary belongs to ArakelovGeometryAndAbelianHeights §§1.8–1.10; §5.17a extends it to higher codimensions and iterated divisor actions. Northcott for projective space over a fixed number field and the affine height of a tuple belong to HeightsAndUnits; number-field line-bundle height classes and bounded-degree ample Northcott belong to ArakelovGeometryAndAbelianHeights §§1.12–1.14; absolute, bounded-degree and subspace heights belong to DiophantineApproximationAndTranscendence; number-field abelian Kummer/Selmer/Sha theory belongs to SelmerIwasawaCohomology §2.12a; the generic number-field product Subspace theorem belongs to SubspaceTheorem §6.2, with its absolute/projective adapter here; smooth-pair purity, smooth base change and the étale fundamental groupoid belong to EtaleCohomologyFoundations; the weak Lefschetz relative-cell and relative-homotopy theorems belong to AffineMorseLefschetz.

Connected affine-group restricted-ramification finiteness is asserted over number fields (§3.3b). Over global function fields only the proper finite-étale-torsor statement of §3.3a is used; no pseudo-reductive classification is assumed. Section 4.9 covers smooth function-field curves over arbitrary constants, regular curves over finite constants, and regular curves of geometric genus≥2 over arbitrary constants. Nonsmooth geometric-genus-zero-or-one curves over arbitrary infinite constants are excluded. General Brauer/Azumaya comparison is scoped to quasi-projective schemes with an ample bundle over an infinite field. Purity is used only for smooth pairs over a field, as supplied by EtaleCohomologyFoundations; absolute purity for arbitrary regular pairs is not used.

ClassicalArithmeticCompletion on main owns stable equality and additive scalar extension on finite-projective K₀; §2.6b supplies its commutative tensor/rank refinements and Gabber stabilization. ArithmeticStatisticsPartI owns the pencil representation and invariant; Part II §1.12 owns oriented ideals, Fano torsors, orbit dictionaries and integral representatives; Part III §2.17 owns finite-congruence counts and finite-prime weighted upper bounds, with its quantitative geometric sieve supplying coefficient tails. Sections 3.18a–b supply coordinate-chart transport, the comparison of ordinary and stabilizer-weighted counts, and the particular masses and volume for the obstruction application. Section 3.18c owns the common isogeny Q invariant and Euler formula over number fields, including their prime-by-prime reduced-Sha terms.

## Conventions

Varieties are separated finite type. Integral means nonempty, irreducible and reduced. A rational Picard-scheme point, a descended bundle and a rational divisor are distinguished by their Brauer obstruction. All point morphisms are over the displayed base. Galois modules are discrete; Kummer is fppf, and its Galois form requires étale kernel.

The torsion envelope in §5.16 is a reduced geometric closed subvariety. Inputs defined over k are required to be geometrically reduced and are first extended to k̄; intersections and the containment and equality API are taken there with reduced closed structures. The full scheme-theoretic stabilizer of §5.2 retains nilpotent test schemes and is also defined for nonreduced closed subschemes.

[h] is the real quotient by uniformly bounded functions on all of X. It has neither point evaluation nor induced function multiplication: [1]=[0] but [n·1]≠[n·0]. Relative h_K scales by [L:K]; absolute number-field height is h_K/[K:ℚ]. Complex modulus is ordinary modulus with multiplicity two. Thus h_ℚ([2:1])=log2, h_ℚ(i)([2:1])=2log2, absolute height log2. Coordinate degree uses ratios of a nonzero tuple.

Symmetric canonical height scales by n², antisymmetric by n. For general L use half the sum for L⁺=L⊗[-1]\*L and L⁻=L⊗([-1]\*L)⁻¹; L⁺⊗L⁻=L². Polarization is unhalved b(P,Q)=ĥ(P+Q)−ĥ(P)−ĥ(Q), b(P,P)=2ĥ(P); the angle norm uses b/2. In §§5.10–5.12 choose `L = O(Theta + [−1]*Theta)` on the Jacobian, where Theta is the theta divisor from the degree-one curve embedding; then `b_L/2 = b_Theta` and `‖z‖² = ĥ_Theta(z) + ĥ_Theta(−z)`. Elliptic `ĥ_(O) = canonicalHeight/2`: the pinned native `canonicalHeight` averages the naive x-height itself and is the `(2O)`-height. Thus the unhalved `(O)`-pairing is native `neronTatePairing`, whose diagonal is `canonicalHeight = 2ĥ_(O)`.

Local module norm is |ϖ|=q⁻¹, ordϖ=1; logarithm radius is strictly r>e/(p−1). In the unramified quadratic extension of ℚ₂, |2|=1/4 and a full-rational-two-torsion elliptic [2]-cokernel has order 16. Brauer values are additive ℚ/ℤ; split=0, opposite=negative, real Hamilton invariant=1/2, complex invariant=0. Restriction multiplies invariants by local degree, corestriction preserves them. Sums include infinity. Twist convention is [Z^τ]=[Z]−τ: in ℤ/3, a=τ=1 gives zero; the residual functional is ε_τ=ε₀+⟨−,τ⟩, so 1/3+2/3=0.

## Exact supplier contracts

Names below abbreviate existing roadmaps, never new targets. Suggested signatures use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Library declarations retain their hypotheses at these pins.

The direct group-theoretic prerequisites are ReductiveGroupsPartII and AdelicAlgebraicGroups, in that dependency order, both preceding this roadmap. Their exact contracts below supply the point topology in §§2.1–2.6, the arithmetic lifting in §3.8f and the measures and reduction theory in §3.18b.

- **ClassicalArithmeticCompletion** on main §§7.23–7.24, 7.42 supplies stable equality with a finite-free common summand and additive scalar extension along every unital ring map on native `SplitK0` of `finiteProjectiveModules`. Section 2.6b extends this supplied additive map to a ring map for commutative rings. Source: Weibel, *K-book* II §1 Proposition 1.1/Corollary 1.3, pp.1–2, §2.8, pp.12–13.

**Checks.**

- Along `ℤ → ℤ[i]`, the supplied extension sends `[ℤ]` to `[ℤ[i]]` and preserves tensor products.
- A finite-projective stable-equality witness can be enlarged to a finite-free one by a projective complement.
- A stably free nonfree module has the free class without being free; §2.6b's cancellation still requires rank greater than dimension.

- **ArithmeticStatisticsPartI** §0.22 supplies the symmetric-pencil carrier and `ArithmeticOrbitRefinement.pencilInvariant` with signed determinant convention. **ArithmeticStatisticsPartII** §1.12 supplies oriented ideal triples, integral pencil orbits, regular-pencil Fano geometry and its doubling class, locally soluble orbit/Selmer dictionaries and integral soluble representatives, on its nonzero-leading-coefficient charts. Section 3.18a transports these supplied objects between charts. **ArithmeticStatisticsPartIII** §2.17 supplies the ordinary finite-congruence count with actual CRT residue density, the infinite-weight upper bound for independently imposed local conditions and the large coefficient-family tail; the quantitative Ekedahl geometric sieve of its §2.1 supplies the codimension-two estimate. Section 3.18b compares stabilizer weights, factors the rational-orbit weight and computes its local integrals. Sources: BGW §§4–8, 10–11, Theorems 23, 31, 36, 38 and Proposition 34; Bhargava, *The geometric sieve*, Theorem 3.3.

**Checks.**

- For `n=4`, the supplied Fano locus is the intersection of the two quadrics, a genus-one torsor.
- A coupled CRT residue set uses its actual density; independent local sets recover the product.
- The coefficient tail applies to a fixed codimension-two locus; it supplies no orbit-tail equality.

- **Native:** `Filter.boundedFilterSubmodule`, `Submodule.mkQ/mapQ/liftQ`; `Height.AdmissibleAbsValues`, `logHeight`, `logHeight₁`, `totalWeight`, `Projectivization.logHeight`, fixed-number-field scalar Northcott as `NumberField.finite_setOfPred_mulHeight₁_le` and `NumberField.finite_setOfPred_logHeight₁_le`; `Northcott`, `Filter.TendstoCofinite`, `AddCommGroup.fg_of_descent'`; `WittVector.Isocrystal/IsocrystalHom/IsocrystalEquiv` and its one-dimensional `isocrystal_classification`; one-dimensional formal group laws `FormalGroup` with `FormalGroup.IsComm`; Krasner's lemma and Hensel's lemma; `SplitK0` and its pinned commutative-ring API; restricted products, number-field adeles, discrete closed diagonal; Tau Ceti abelian varieties/native over-hom point groups, `LineBundleClass`, elliptic canonical heights; native `IsAzumaya`, field `BrauerGroup`, tensor/opposite/base-change and finite-field vanishing. Mathlib `ContinuousCohomology.tateShafarevich` supplies the fixed-coefficient localization kernel, specialized by SI §2.12a and consumed in §1.3. Tau Ceti `NumberField.AdeleRing.instLocallyCompactSpace` and completion-integer compact openness supply those topological facts; they are not reproved. Absolute bounded-degree heights are imported from **DiophantineApproximationAndTranscendence** (DA) §§0.2–3; DA §1.5 supplies Roth's index estimate and DA §2.8 the parametric Subspace estimates, not the geometric product theorem of §5.9a. **HeightsAndUnits (HU)** §0.1 supplies the affine height `Height.mulHeightAff` with the inequality `mulHeight₁ (x i) ≤ mulHeightAff x`, and §1.1 supplies the `Northcott (Projectivization.mulHeight)` and `Northcott (Projectivization.logHeight)` instances (over any field whose scalar height is Northcott, so over number fields) and the coordinate bound `mulHeight₁_div_le_mulHeight`.
- **ReductiveGroupsPartII (RG2)** §§RG2.0.1, RG2.0.3 owns evaluation topology on A→ₐ[R]B, presentation embeddings, coefficient functoriality, locally compact finite-type points, compact-open integral affine points and local-ring scheme charts with open units/continuous inversion. RG2 §RG2.1.5 owns z-extensions.
- **AdelicAlgebraicGroups (AA)** §§2.4, 3 owns gauges/reduction/finite volume; §4.1 owns local simply connected H¹=1 including E₈, twisted Hasse injectivity and real-class realization; §4.2 owns strong approximation; §4.5 owns integral and finite-adelic abelianization lifting when the derived group is simply connected. The SL_n/μ₂ volume evaluation is §3.18b, not a consequence of finite volume alone.
- **SchemeAndStackFoundations (SF)** §§0.8–9 supplies spreading; §§1.13–17, 2.3 fppf torsors/contracted products/twisting; §§2.11, 2.15, 2.22 Kummer, Hochschild–Serre, scheme Brauer pullback, affine Azumaya comparison, henselian specialization and constant-units exact sequence including Pic(X̄)^G→Br(k). Its generic injectivity is regular affine, and its cohomological comparison is regular affine dimension≤2. Sections 2.6a–d extend comparison here. SF §§3.1–7 supplies curve genus/Riemann–Roch/Pic^d/Abel fibres; a projective bundle requires a split Picard gerbe. Its normalization, Hilbert/Chow, Serre/coherent and Cartier-cycle/projection/Bézout interfaces are used with the displayed hypotheses. **AlgebraicModuliForArithmeticGeometry (AM)** supplies relative Picard/Hilbert, bounded maps, relative Picard kernel and its section splitting (§§1.6,7.2–3,7.6.1–1a), and characteristic-zero resolution (§9.4).
- **AbelianSchemesAndArithmeticModuli (AS)** A1.4–5 supplies rigidified seesaw/cube and [n]\*L; A2 supplies Poincaré/dual/Mumford map, ample presentations; A3 supplies finite-flat isogenies and finite-subgroup quotients; A5 complex uniformization/Riemann forms; A6.3–5 abelian images/subvarieties/complements. Section 1.0 adds positive-dimensional quotients. **NeronModelsAndSemistableAbelianVarieties (NM)** §§1.1, 1.8, 5.1 supplies mapping/good-model/Néron–Ogg–Shafarevich; §1.15 here adds general formal charts. **EllipticCurves (EC)** Layers 5–7 supplies elliptic heights/descent/Mordell–Weil and the finite discrete-module Selmer constructor, instantiated by SI §2.12a with number-field abelian Kummer images. **JacobianChallenge (JC)** Layer F supplies the Abel–Jacobi map of a curve with a rational base point and its Albanese universal property; JC's acceptance criteria require it to be a closed immersion for genus≥1. An embedding by a degree-one class without a rational point is reduced to this after a finite extension (§6.4).
- **SelmerIwasawaCohomology (SI)** §2.12a supplies the number-field interfaces for `AbelianVariety.Points` and `AbelianVariety.torsion`, the abelian Kummer/Selmer/Sha carriers and their comparisons, finite isogeny Selmer groups and Sha[n], `finiteCotype_primaryDecomposition`, and the all-place `KummerLocal` conditions, `KummerLocal.dual_annihilator` and `KummerLocal.globalPlusLocal`. It also supplies the real-conjugation adapter for AS A5.1: the antilinear tangent involution commutes with the exponential and preserves its kernel lattice; the lattice-torsion comparison is Galois-equivariant, and Poincaré duality respects these actions and conjugation on roots of unity. Sections 1.0a and 1.3–1.5 consume these interfaces. SI §4.29 supplies the canonical general abelian `CasselsTate`, its `CasselsTate.finiteCoefficient_formula` with global-minus-local sign and G_m correction, `CasselsTate.isogeny_adjoint`, n-torsion annihilators, divisible left/right radicals and finite perfect reduced primary pairings. Neither finite Sha nor a polarization is required for this pairing. Its elliptic specialization is the positive-`(O)` pullback, with the supplied elliptic carrier and sign comparisons. Sections 3.17a–d here own the torsor/divisor and Poincaré-biextension realizations, their identification with that pairing, and the Brauer–Manin and multiplication-cover applications. Sources: Milne ADT I, Remark 3.7 p.46, Proposition 6.9, Remarks 6.10–11, Theorem 6.13(a), pp.78–83; the cited supplier §§2.12a, 4.29.

**Checks.**

- A real elliptic curve with two components has a nonzero `[2]` Kummer image; the all-place comparison retains it.
- For the real elliptic curve with lattice `ℤ + iℤ`, the supplied conjugation fixes `1` and negates `i`; on three-torsion it sends `[i/3]` to the distinct point `[−i/3]`.
- A divisible Sha summand is in the pairing radical; finite Sha makes both radicals zero.
- The positive-`(O)` elliptic pullback is alternating. Replacing its self-duality by `P ↦ O([P] − [O])` negates it; general principal polarizations need not be alternating.

- **SubspaceTheorem** §6.2 supplies `NumberField.exists_finset_submodule_of_approxProd_le` for independent K-linear forms at finitely many places of a number field and dimension at least two. Section 4.7a transports its relative heights to absolute heights and projective points; §4.8 supplies the curve-local-height application. Source: Bombieri–Gubler Theorem 7.2.2, `F = K`; [SubspaceTheorem §6.2](https://github.com/rwst/TauCetiRoadmap/blob/74afb20a3574d9844408504c6ab573a10cda5319/TauCetiRoadmap/SubspaceTheorem/README.md#L1219).

**Checks.**

- Taking the coordinate index to be `Fin n` identifies the vector spaces.
- Raising absolute products and heights to `[K:ℚ]` preserves ε in the exponent.
- The strict inequality of §4.7a implies the supplier’s non-strict inequality.

- **ClassFieldTheory (CFT)** Layers 5, 10, 13 supplies local invariants, global Brauer reciprocity/injectivity and cyclic Hasse norm; global vanishing `numberField_h3_units_zero` is owned in §2.16. **ArithmeticGaloisDuality (AGD)** R02.3 supplies number-field restricted-ramification finite H¹/Hermite, R02.3.2 function-field ideles/S-units, R02.4 torus/finite Poitou–Tate and D7.6 nonarchimedean abelian duality; real Tate and complex-comparison adapters are explicit below. **GlobalQuadraticForms (GQF)** Layer 5 supplies ternary Hasse–Minkowski. **StableReduction (SR)** Layer 2 supplies curve ampleness/cohomology and constant genus in smooth proper families. **ComplexComparisonPartII (CC)** C1.3–4/C5.3–4 supplies Chern/Sobolev/elliptic/Green/currents and Poincaré–Lelong; the positive-bundle estimates are §5.17c. CC §C3.2d.3 supplies `relative_picard_separated` for geometrically integral fibres, and §§C6.2–C6.3 Riemann existence and the finite-level Artin comparison. **EtaleCohomologyFoundations (ECF)** §0.7 supplies supported cohomology, §0.9 Kummer cycle classes and the projective-bundle formula, §0.10 `ClassicalAlgebraic.smoothBoundaryPurity`, §F.0.2 the étale fundamental groupoid, §F.2.2 smooth base change (including separably closed field extensions), §F.2.6 finite-coefficient Künneth and §F.7 `VanishingCycles.etaleWeakLefschetz`. **AffineMorseLefschetz** §A5 supplies the weak Lefschetz theorem for a hyperplane section A of a complex projective X containing its singular points: H_j(X,A;ℤ)=0 and π_j(X,A)=0 for j below dim X. **IntegralLattices**, Layer 1 in Completed/IntegralLattices, supplies integral symmetric Gram matrices and their discriminants, without a positive-definiteness assumption. **GeometryOfNumbersAndQuadraticArithmetic** §§1.2.1–1.2.13 and 1.5.21 supplies successive minima, their integral flags and Minkowski’s second upper bound on real normed lattices; **HeightsAndUnits** §2.1 supplies a basis controlled by those minima. Section 5.4b adds the alternating Riemann-form and bounded-abelian-direction estimates; its positive real metric need not have integral Gram matrix. **InverseGaloisAndArithmeticFundamentalGroups (IG)** §2.4 supplies Hilbert irreducibility.

**Checks at boundaries.** RG2 gives ℤ[X](ℝ)=ℝ, no zero-algebra point over a nonzero field, and Laurent points with value-and-inverse topology. SF Azumaya pullback takes matrices to matrices, preserves tensor/opposite and identifies affine/scheme evaluation; on ℚ[t,1/t], (−1,t) evaluates to 0 at t=1 and Hamilton at t=−1, with no t=0 point. Over ℤ_p every Azumaya class is zero since Br(𝔽_p)=0; the standard Hamilton order at p=2 is not Azumaya, while Hamilton over ℝ[[t]] stays nonsplit. M₀ fails faithfulness. JC gives the identity for an elliptic curve based at O and a closed immersion in genus two; in genus zero the Jacobian is zero. These supplier tests are compatibility requirements, not duplicate constructions.

### Elliptic normalization at the pins

`TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic` supplies `WeierstrassCurve.Affine.Point.canonicalHeight`, `Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, `Point.canonicalHeight_nsmul`, `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`, `neronTatePairing_apply` and `neronTatePairing_self` in `WeierstrassCurve.Affine`. The field has `Height.AdmissibleAbsValues` and `DecidableEq`; the curve is elliptic, and the reverse zero-height implication retains Northcott for the canonical height. This supplier fixes `canonicalHeight(P) = lim naiveHeight(2^n P)/4^n` and `neronTatePairing(P,Q) = (canonicalHeight(P+Q) − canonicalHeight(P) − canonicalHeight(Q))/2`. Since the x-map pulls O(1) back to `O(2O)`, the `(O)`-height is half this native height and its unhalved polarization is already the native pairing. Source: Silverman, *The Arithmetic of Elliptic Curves*, VIII.9; the displayed pinned module.

**Checks.**

- The Tate limit of `naiveHeight/2` under doubling is `canonicalHeight/2`.
- The unhalved polarization of this `(O)`-height has diagonal `canonicalHeight`, and equals the native halved polarization of the `(2O)`-height.
- At the zero point both normalizations and their pairings vanish; doubling multiplies either point height by four.

### Number-field heights, arithmetic divisors and slopes

**ArakelovGeometryAndAbelianHeights** §§1.12–1.14 supplies `Height.ofMetrized`, `Height.weilClass`, its tensor/dual/pullback/projective API, `Height.weilClass_ample_lowerBound`, `Height.weilClass_northcott` and `Height.northcott_boundedChange`. For projective X over a number field K, ample L, D≥1, B∈ℝ and any representative h_L, the set `{x : [ℚ(x):ℚ] ≤ D, h_L(x) ≤ B}` is finite; the K-degree bound follows by replacing D with D·[K:ℚ]. Its absolute convention divides the relative representative by `[K:ℚ]`; multiplying by this fixed positive factor transports its theorem to the relative convention here. The projective-space instance is its O(1) case. Normalize a nonzero coordinate to one, apply HeightsAndUnits §1.1’s `mulHeight₁_div_le_mulHeight`, and DiophantineApproximationAndTranscendence §0.3 bounds the ratios. The ample comparison uses a very ample power and bounded changes. Sources: Conrad §§9–10 pp.30–37; the cited supplier §§1.12–1.14 and their Deligne/Faltings–Chai locators.

**Checks.**

- On ℙ¹(ℚ), height≤log 2 gives `[0:1]`, `[1:0]`, `[±1:1]`, `[±2:1]`, `[±1:2]`, eight points; height zero gives four.
- ℙ⁰ has one point for every field. An ample O(1) on ℙ¹ gives the same eight-point bounded-degree-one example.
- Infinitely many constant height-zero points over ℂ(t) exclude function fields from this Northcott contract; the generalized-field height machine has no such finiteness conclusion.

The same roadmap §§1.8–1.10 supplies `ArithmeticDivisor`, `ArithmeticChow1`, the metrized-line isomorphism and the arithmetic divisor/one-cycle pairing, with Green function `−log ‖s‖²`, `ddᶜ = (i/2π)∂∂̄` and the archimedean degree factor ½. Regularity, smooth generic fibre and admissibility of representative pullbacks are retained. Section 5.17a uses these in codimension one and extends the divisor action to arbitrary cycle codimension; it does not construct a second arithmetic Picard group.

**Checks.**

- A principal pair `(div f, −log |f|²)` vanishes.
- On Spec ℤ, rescaling a line norm by `e^(−t)` changes degree by `t`.
- A zero Green function on a nonzero horizontal divisor generally fails the Green-current equation.

**CrystallineCohomology** §CR.4.7, “Slope decomposition on the existing isocrystal carrier”, supplies the Dieudonné–Manin classification on native `WittVector.Isocrystal`: for prime p and perfect k there is a canonical finite isoclinic decomposition with distinct-slope Hom groups zero; over algebraically closed k the simple blocks have `F^s = p^r` for coprime r,s and s>0. Its rank-one case is Mathlib’s `WittVector.isocrystal_classification`. Standard-block construction, cyclic presentations, Newton factorization and descent of slope summands are part of that supplier, rather than separate targets here. Section 5.7b adds the weight `γ/β` for an isogeny commuting with Frobenius on a positive-slope formal summand. Sources: Manin I §4 pp.19–23, II §§1–2 pp.25–33; the cited supplier and its Lurie/Illusie locators.

**Checks.**

- `F = p^a σ` has slope a in rank one.
- The block `F² = p` has slope ½ and rank two.
- A slope-zero Jordan block over 𝔽_p need not split there; semisimplicity requires algebraically closed k.

**DiophantineApproximationAndTranscendence** §2.8 supplies `siegelKernelBasis`, `siegelRelativeKernelBasis` and `siegelCoefficientConditions`. For a rank-m linear system of m rows in q>m unknowns over a fixed number field K with row coefficient heights bounded by H≥0, their smallest-vector bound gives a nonzero solution with logarithmic height at most `C_K·m/(q−m)·(H + log q + 1) + C_K`. Restricting scalars multiplies rows and unknowns together, preserving `m/(q−m)`; the denominator is not `q−[K:ℚ]m`. Section 5.10c adds the curve-section and degree-ratio estimate. Sources: the supplier’s Bombieri–Vaaler/Bombieri–Gubler locators; Bombieri Lemma 7, §8 pp.629–632.

**Checks.**

- At q=m no nonzero solution is promised.
- A rank-zero condition matrix admits a coordinate vector of height zero.
- Over ℚ(i), both dimensions double under scalar restriction and the ratio is unchanged.

## How to read the build

Layer 0 fixes normalizations and heights; Layer 1 adds Kummer/trace/finite generation. Layer 2 supplies adelic evaluation, Layer 3 torsor descent. Layer 4's Mordell theorem uses the independent Vojta–Bombieri route of Layer 5; Parshin is a separate conditional implication. Layer 5's arithmetic positivity proves equidistribution before division-group Mordell–Lang and Bogomolov. Layer 6 assembles genus conclusions and conjectural propositions. Read §0.34 before §§0.31–33. Suggested.lean contains only light native-carrier definitions and statable end signatures; the closing comment lists the other interfaces.

## Layer 0: height classes, the Weil machine and canonical heights

One uniform error defines a height class; geometric and arithmetic normalizations then select the appropriate representatives.

### 0.1 Uniform boundedness at the top filter

For arbitrary X, `bounded_top_iff`: h∈native `Filter.boundedFilterSubmodule ℝ ⊤` iff ∃C≥0, ∀x, |h(x)|≤C. Unfold `BoundedAtFilter` using `isBigO_top`; take max(C,0), including X=∅. Source: de Jong §14 footnote 1 pp.7–9.

**Checks.**

- X=∅ permits C=0
- (−1)^n has bound 1
- n on ℕ is unbounded.

### 0.2 Heights modulo bounded functions

Define `HeightClass X` as the native real quotient (X→ℝ)/`boundedFilterSubmodule ℝ ⊤`, with projection `mk`. API: `mk_eq_mk_iff_isBounded`, `mk_eq_zero_iff`, `mk_surjective`, `mk_zero/add/smul/const/of_finite`; `linearMap_ext` tests representatives. Native `liftQ` descends exactly the linear maps annihilating bounded functions. Use `mkQ`, `Quotient.eq`, `quot_hom_ext` and `Metric.isBounded_iff_subset_closedBall`. Source: de Jong §14 footnote 1 pp.7–9.

**Checks.**

- Every function on ∅ or a finite X vanishes
- [(-1)^n]=0 although the function is nonconstant
- [n]≠0
- [n+7]=[n]
- `mk` is native `Quotient.mk`.
- There is no induced ring multiplication: [1]=[0] but [n·1]≠[n·0].
- Classes have no pointwise evaluation.

### 0.3 The bounded-error equality criterion

`mk_eq_mk_iff`: [h]=[g] iff ∃C≥0, ∀x, |h(x)−g(x)|≤C. Apply `Submodule.Quotient.eq` to h−g and §0.1. Source: de Jong §14 footnote 1 p.7. *Needs:* §0.2.

**Checks.**

- [n+(-1)^n]=[n]
- [2n]≠[n]
- equality of classes does not imply equality at a point.

### 0.4 Pullback of height classes

For f:X→Y define linear `pullback f` by [h]↦[h∘f]; uniform bounds survive precomposition. API: `pullback_mk/id/add/smul/const` and `HeightClass.pullback_comp`; composition reverses and constant maps induce zero. Use native `mapQ_apply/id/comp`. Source: de Jong §14 Steps 1–7 pp.7–9. *Needs:* §§0.1–3.

**Checks.**

- Doubling pulls [n] back to 2[n]
- the zero constant map pulls it back to zero and is not injective
- pulling [n²] along doubling after successor equals pullback along successor after pullback along doubling.

### 0.5 Surjective maps detect height classes

`HeightClass.pullback_injective_of_surjective`: surjective f:X→Y induces injective pullback. Lift by native `mkQ_surjective` and transport the bound along f. Source: de Jong §14 pp.7–9. *Needs:* §§0.3–4.

**Checks.**

- A bijection gives inverse pullbacks
- ℕ×ℕ→ℕ detects classes although its fibres are infinite and it does not preserve Northcott.
- The inclusion {0}→ℕ pulls the nonzero class [n] back to zero; surjectivity cannot be omitted.

### 0.6 Northcott transfer under a lower comparison

`HeightClass.northcott_of_le_add`: h≤g+C and native `Northcott h` imply `Northcott g`, since {g≤B}⊆{h≤B+C}. Source: de Jong §17 p.10. *Needs:* native `Northcott.finite_le`.

**Checks.**

- h(n)=n and g(n)=n+(-1)^n work with C=1.
- Reversing the comparison fails: 0≤n but the zero function on ℕ is not Northcott.
- h(n)=n and g(n)=2n satisfy the lower comparison with C=0.

### 0.7 Northcott invariance under bounded error

`northcott_congr`: [h]=[g] implies `Northcott h ↔ Northcott g`, applying §0.6 twice with §0.3's bound. Source: de Jong §§14, 17 pp.7, 10.

**Checks.**

- n and n+(-1)^n are both Northcott
- n and −n are not boundedly equal and only the first is Northcott.
- Transfer of arithmetic Northcott over an algebraic closure still requires bounded degree.

### 0.8 Northcott for a boundedly equal pullback

`HeightClass.northcott_of_pullback_eq`: if f:X→Y has finite fibres, h is Northcott and [g]=f\*[h], then g is Northcott. Apply native `Northcott.comp_of_finite_fibers` then §0.7. Finite fibres are native `Filter.TendstoCofinite`, by `tendstoCofinite_iff_finite_preimage_singleton`. Source: de Jong §14 Step 7 p.9, §17 p.10.

**Checks.**

- Pulling n back to ℕ×Fin 2 preserves Northcott
- pulling it back to ℕ×ℕ gives the infinite zero-sublevel {(0,m)}.
- For the identity map this recovers Northcott invariance under bounded error.

### 0.9 Generalized global fields

`GeneralizedGlobalField K` strengthens native `Height.AdmissibleAbsValues K` by infinitely many inequivalent nontrivial places, only finitely many archimedean places, discrete nonarchimedean valuations and excellent nonarchimedean valuation rings, recording genuine archimedean absolute values with multiplicities and normalized nonarchimedean ones. `extend` to finite K′/K uses the factors of K′⊗K_v and local degrees; excellence ensures separable completions. API: `extend_restrict`, |a|_w=|a|_v^([K′_w:K_v]e_v/e_w), with e=2 complex and 1 otherwise; `extend_trans`, `ofNumberField`, `extend_numberField`. Norms prove the product formula; local-degree multiplication proves transitivity. Source: Conrad Definition 8.1, Examples 8.3–5 pp.27–29.

**Checks.**

- At a=2 over ℚ the product is 2·1/2=1
- identity extension preserves the family
- ℚ(i) has one complex place counted twice.
- Omitting the archimedean place of ℚ breaks the formula at 2.

*Needs:* native admissible values and number-field instances.

### 0.10 Polarized function fields

Let K/k be finitely generated with k algebraically closed in K and trdeg≥1; choose normal projective V with k(V)=K and ample N. `ofPolarization` sets |a|_D=exp(−deg_N(D)ord_Da), deg_ND=(N^(dimV−1)·D), for prime divisors D. API: `ofPolarization_absVal/eq_one_iff/curve`: formula, common unit kernel k×, curve weights [k(D):k]. For normalization V′ in finite K′/K with constants k′, `extend_ofPolarization` gives the pullback family raised to [k′:k]. Principal divisors and finite projection prove the laws. Sources: Conrad Example 8.4/Lemma 8.6 pp.27–29; Xie–Yuan §1.1 pp.1–3. *Needs:* §0.9; intersection/ampleness.

**Checks.**

- On ℙ¹, t has values e⁻¹ at 0 and e at ∞
- constants have every value 1
- doubling N on a curve changes nothing.
- On ℙ², q/x² with q an irreducible conic has weighted orders 2−2=0 but unweighted sum −1.

### 0.11 Normalized projective heights

Define `normalizedHeight` h_K on projective tuples over K̄ as [L:K]⁻¹ times native `logHeight` over finite L containing the coordinates, equivalently the weighted place sum of log max_i|t_i|. Local-degree summation proves field independence; the product formula proves scaling invariance. API: `of_mem`, `algebraMap` (native relative height), `nonneg`, `galois`, `absHeight_eq_absLogHeight₁` for h_ℚ([x:1]). Sources: Conrad §9/Remark 9.1 pp.29–30. *Needs:* §0.9; native projective heights.

**Checks.**

- h_ℚ([1:2])=log 2
- coordinate points have height zero
- h_ℚ([√2:1])=½log 2.
- Native relative height over ℚ(i) of [2:1] is 2log 2.
- For base K it is h_K, while absolute number-field height is h_K/[K:ℚ].

### 0.12 Finite extension of the height base

`logHeight_baseChange`: finite K′/K with extended places gives h_K′=[K′:K]h_K over a common closure; absolute number-field height is unchanged. Sum Σ_w|v[K′_w:K_v]=[K′:K] and divide by the coordinate-field degree. Section 0.16 gives the bundle version. Source: Conrad Remark 9.2/(9.2) p.30. *Needs:* §§0.9, 0.11.

**Checks.**

- For ℚ⊂ℚ(i) and [2:1], both sides equal 2log 2.

### 0.13 Heights of algebraic tuples

For algebraic x_i∈ℂ, `absLogHeight_tuple_le`: max_i h(x_i)≤h([1:x₁:…:x_m])≤Σ_i h(x_i). The lower bound is the absolute form of HU §0.1's inequality `mulHeight₁ (x i) ≤ mulHeightAff x`; the upper bound and the coordinate adapter below are owned here. Counting height is max_i h(x_i). Also h(Re x), h(Im x)≤2h(x)+2log2 and their degrees≤[ℚ(x):ℚ]². Use placewise max≤product, conjugation, (x+x̄)/2, (x−x̄)/(2i), and native add/mul bounds divided by `totalWeight`. Conjugate pairs with the sign of i bound the imaginary orbit by d(d−1), the real orbit by d². Source: Conrad §9/(9.2) p.30 (height inequalities); this real/imaginary-coordinate adapter supplies the counting convention used by Tsimerman §6.2 p.387. *Needs:* §0.11; HU §0.1.

**Checks.**

- For 1+i the real and imaginary heights are zero while h(1+i)=½log 2.
- Im(√−2)=√2 need not lie in ℚ(x,x̄)
- (2,3) has counting and projective affine height log3, below log2+log3.

### 0.14 Linear coordinate changes

`normalizedHeight_linearChange_bounded`: T∈GL_(n+1)(K) gives |h_K(Tx)−h_K(x)|≤C_T. For injective rectangular A, h_K(Ax)≤h_K(x)+C_A. Apply native `Height.logHeight_linearMap_apply_le`, §0.12 and T⁻¹. Over a number field with the native relative height the representative signature is `logHeight_linearChange_bounded`. Source: Conrad §9 p.30. *Needs:* §§0.11–12.

**Checks.**

- `T(x,y) = (x,x+y)` changes relative ℙ¹ height by at most `[K:ℚ] log 2`.
- Over `K = ℚ(i)`, `[1:1] ↦ [1:2]` attains the bound `2 log 2`; absolute height changes by `log 2`.
- injectivity excludes A(x)=0 for a nonzero projective representative.

### 0.14a Generated presentations and uniform local comparison

For projective X/K define a **generated difference presentation** L≅M⊗N⁻¹ with finite generating K-section families of M, N. Serre generation of L⊗Aⁿ, Aⁿ for very ample A proves existence. API: `generatedDifferencePresentation.exists`, tensor/dual/base change; `generatorComparison.frame_independent/bound/finiteSupport/baseChange`.

For generating families s, t of one bundle, own c_v≥0, zero at almost every finite v, with |log(max_i|s_i(x)|_w/max_j|t_j(x)|_w)|≤c_v for every geometric local x and finite w|v, using genuine absolute values; extension weights multiply bounds. The ratio uses a common frame. In the combined projective image Y, homogeneous Nullstellensatz expresses each coordinate's D-th power as Σs_i times degree-(D−1) forms modulo I(Y), and likewise for t. With M_v=max(|s|,|t|)>0, cancel M_v^(D−1) in M_vᴰ≤B_vmax|s|M_v^(D−1). Coefficient norms/archimedean monomial counts give B_v=1 almost everywhere, uniformly over completed algebraic extensions. Tensor/dual handle differences; generalized global fields use integrable coefficient majorants instead of finite support. Sources: de Jong §14 pp.7–9; Gubler 2002 §§5.2.17–18 pp.108–109. *Needs:* §0.11; AM §1.2 `serreGeneration`; native Nullstellensatz on the affine cone and closed images of proper morphisms; SF bundle base change.

**Checks.**

- O(−1) on P¹ admits a difference presentation despite having no generating global sections.
- Replacing (X,Y) by (X,Y,X+Y) changes the archimedean maximum by at most two and no nonarchimedean maximum.
- Scaling generators by 2 adds log|2|_v locally and zero in the global weighted sum.
- The family (X²,XY) has a common zero and is excluded: its comparison can be undefined.

### 0.15 Morphisms to projective space

`normalizedHeight_comp_forms`: projective morphisms φ:X→ℙⁿ, ψ:X→ℙᵐ with K-isomorphic O(1) pullbacks have boundedly different heights. Degree-d forms without common zero on ℙⁿ give h_K(fx)=dh_K(x)+O(1). Compare generators using §0.14a; alternatively native polynomial height bounds and Nullstellensatz give both inequalities. Sources: Conrad §9 p.31; de Jong §14 Steps 1–7 pp.7–9. *Needs:* §§0.11–14a.

**Checks.**

- The Veronese [x:y]↦[x²:xy:y²] has height exactly 2h.

### 0.16 Weil's height machine

Over a generalized global field K, extend the supplied number-field height machine to projective X/K by the unique homomorphism `weilHeight`:Pic(X)→HeightClass(X(K̄)) agreeing with h_K∘ι_L for very ample L. API: `veryAmple/tensor/pullback/projectiveSpace/baseChange/le_of_ample/unique`: O(d)↦d[h_K], base extension factor [K′:K], and |h_M|≤ch_L+O(1) for ample L, c>0. For a number field K this is `[K:ℚ]` times the supplied absolute `Height.weilClass`, transported to `HeightClass`; this comparison fixes the common interface. Differences of very ample bundles define general L; Segre additivity and §0.15 give independence/functoriality. Generation of L^N⊗M^±1 proves comparison. Sources: Conrad (9.1)/properties pp.30–31; de Jong §14 pp.7–9. *Needs:* §§0.2, 0.4, 0.11–15 and ArakelovGeometryAndAbelianHeights §1.13; native `logHeight_fun_mul_eq`; bundle suppliers.

**Checks.**

- O(2) at [1:2] over ℚ has representative 2log 2
- O_X and all bundles on Spec K have zero class
- on K-projective points the representative is the native relative height.
- Both h and h+1 represent the same class.
- On a conic over K̄, O(1) restricts to O(2P), so its class is twice the point-divisor height.

### 0.17 Lower bounds off the base locus

`weilHeight_bddBelow_off_baseLocus`: each representative for L is bounded below off supp coker(H⁰(L)⊗O→L), possibly empty. An ample bundle is globally bounded below via a generated positive power. Choose very ample M, L⊗M; products of sections show h_(L⊗M)≥h_M−C off that locus. Source: Conrad §9 p.31. *Needs:* §§0.15–16.

**Checks.**

- O(1) on ℙ¹ has empty base locus and h≥0
- a bundle with no nonzero section has empty complement.

### 0.18 Tate's limit

For φ:S→S, d>1 and |f(φs)−df(s)|≤C define `tateLimit φ d f`=f+Σ_(m≥0)d^(−m−1)(f∘φ^(m+1)−df∘φ^m). API: `tendsto_tateLimit`, `abs_tateLimit_sub_le` C/(d−1), `tateLimit_comp` f̂∘φ=df̂, `tateLimit_unique` among bounded-distance scaling functions, `congr_bounded`. The tail≤Cd^(−m)/(d−1) proves convergence and uniqueness. Source: Conrad (9.3)–(9.4) p.32. *Needs:* §0.2; real series.

**Checks.**

- A constant f with φ=id has limit zero
- an exact scaling function is fixed
- `tateLimit_elliptic`: doubling with f=naiveHeight/2, d=4 gives one half of native elliptic `canonicalHeight`.
- For id, d=2, f=1 the error bound 1 is attained.
- For successor, d=1, f(n)=n, normalized iterates at zero equal m and diverge.

### 0.19 Néron–Tate heights

For abelian A/K define `neronTateHeight` by §0.18 along [2], d=4 for symmetric L, d=2 for antisymmetric L; generally ĥ_L=(ĥ_L⁺+ĥ_L⁻)/2, L⁺=L⊗[-1]\*L, L⁻=L⊗([-1]\*L)⁻¹. Cube gives L⁺⊗L⁻=L² and scaling, without bundle square roots. API: `mem_weilHeight/zero/tensor/nsmul/parallelogram/add_of_antisymm/quadraticMap/pullback/translate/baseChange/eq_of_algEquiv`: symmetric [n] scales n²; pullback under a variety morphism f gives ĥ_(f\*M)(P)=ĥ_M(fP)−ĥ_M(f0). Such f is a homomorphism plus translation. Cube and limit uniqueness prove the laws; symmetric Pic⁰ differences are 2-torsion and have zero height. Absolute number-field height divides by [K:ℚ]. Sources: Conrad (9.3)–(9.7)/Theorem 9.8 pp.31–33; GGK Lemma 2.3 pp.8–9. *Needs:* §§0.16, 0.18; cube/Poincaré.

**Checks.**

- O_A gives zero
- `O_E(O)` gives `canonicalHeight/2`, and `O_E(2O)` gives native `canonicalHeight`
- product bundles give sums.
- Symmetric heights are invariant under torsion translation.
- On y²=x³−2, P=(3,5), x(2P)=129/100, so naive x-height log129 differs from 4log3=log81.

### 0.20 Positivity and the height kernel

For symmetric ample L over a generalized global field, ĥ_L≥0 by bounded below and n²-scaling. Over number fields, `neronTateHeight_eq_zero_iff_torsion`; bounded-degree torsion is finite. A zero-height multiplication orbit has bounded ample height in a fixed number field, hence is finite by ArakelovGeometryAndAbelianHeights §1.13; scaling kills torsion. One Northcott set contains all bounded-degree torsion. Source: Conrad pp.33–35 after Lemma 9.7. *Needs:* §§0.17–19 and ArakelovGeometryAndAbelianHeights §1.13, independently of Mordell–Weil.

**Checks.**

- The elliptic specialization is native `canonicalHeight_eq_zero_iff_isOfFinAddOrder`
- constant nontorsion points over ℂ(t) show why the kernel assertion requires a number field.

### 0.21 The symmetric bilinear form

For symmetric L define `neronTateForm` b(P,Q)=ĥ(P+Q)−ĥ(P)−ĥ(Q). Parallelogram polarization gives symmetric ℤ-bilinearity. API: `self`=2ĥ, `comm`, `torsion`=0, Poincaré comparison b(P,φ_LQ), and `neronTateHeight_sum_le`: ĥ(Σ₁^mP_i)≤mΣĥ(P_i) for ample L. Positivity makes the real extension semidefinite. Sources: Conrad Theorem 9.10/Corollary 9.12 p.34; Xie–Yuan Lemma 5.3 proof. *Needs:* §§0.19–20; native `QuadraticMap.polarBilin`, Poincaré.

**Checks.**

- For elliptic `O(O)`, b equals native `neronTatePairing`, and `b(P,P) = canonicalHeight(P) = 2ĥ_(O)(P)`
- b(0,Q)=0
- torsion has zero diagonal, precluding definiteness on the point group.
- The two-point inequality is ĥ(P+Q)≤2ĥ(P)+2ĥ(Q)
- a negative polarization need not satisfy it.

### 0.22 Bounded point-metric families

Fix a generated difference presentation of L on projective X/K, with sup metrics m⁰_v. `PointHeightMetricFamily` consists of continuous positive fibre norms m_v over completed algebraic closures, genuine-|·|_v homogeneous, Galois equivariant, finite-extension compatible, with uniform geometric log-ratio bounds d_v(m_v,m⁰_v)≤c_v≥0 and Σn_vc_v<∞. Empty X has unique datum/distance zero. API: frame-independent `dist`, one-place `complete`, `tensor` (subadditive distance), `dual` (isometry), `pullback` (nonincreasing), `ofGenerators/dist_ofGenerators_le`, and `height`: weighted −log norms over a finite field of definition, changing by ≤Σn_vd_v. Identify one-place metrics with bounded continuous equivariant real functions; sup completeness proves completeness. Section 0.14a compares presentations; tensor/dual/pullback preserve summability. Source: Gubler 2002 §5.1.2 p.96, Theorem 5.1.13 pp.100–101, §§5.2.15–18 pp.108–109, Example 5.3.20 p.117. *Needs:* §§0.11–16 and §0.14a's generated presentations.

**Checks.**

- For O(1), ‖x₀‖=|x₀|/max_i|x_i| is scaling invariant and gives log 2 at [1:2]/ℚ
- the trivial norm of 1 gives zero.
- Rescaling that norm by exp(1) only at ∞ lowers every height by 1, while rescaling at every prime fails summability.
- A rational section away from its divisor has an absolutely convergent weighted sum, by comparison with the generating reference.

### 0.23 Canonical point metrics

For projective X/K, f:X→X, θ:f\*L≅L^q, q>1, define `canonicalPointMetric` as the unique bounded metric making θ isometric. Φ(m)=(θ_\*f\*m)^(1/q) contracts by 1/q; native `ContractingWith.exists_fixedPoint` applies. API: `isometry`, `error` d_v(Φ^jm⁰,m̂)≤q^(−j)c_v/(1−1/q), c_v=d_v(m⁰,Φm⁰); `change_isomorphism` θ↦αθ scales m̂ by |α|_v^(−1/(q−1)); `abelian_tensor/sum`. Summable bounds, equivariance and extension compatibility survive the limit. Rigidified abelian cube gives q=4 symmetric, q=2 antisymmetric; general L uses the positive square root on L⁺⊗L⁻=L². Uniqueness gives tensor/dual/homomorphism pullback laws; the weighted sum is the Tate/Néron–Tate height. Source: Gubler 2002 Theorems 5.1.13, 5.3.13, 5.3.24/Remark 5.3.14/Examples 5.1.14–15, 5.3.20 pp.100–101, 114, 117–119. *Needs:* §§0.18–22; the cube (AS A1.4–5).

**Checks.**

- The coordinate q-power map on ℙⁿ fixes the sup metric
- trivial rigidified abelian L has norm 1
- for q=4, θ↦αθ changes local height by +(log|α|)/3, summing to zero by the product formula.
- For id, q=1 every positive constant norm is fixed, so uniqueness fails.
- Elliptic `O(O)` sums to `canonicalHeight/2`.

### 0.24 Local Weil and Néron functions

For Cartier D and §0.22 metric define `LocalWeilFunction` λ_(D,v)=−log m_v(s_D) off |D|; if s_D=fe, λ=−log|f|−log m_v(e). API: `add`, `pullback` (exact for transported metrics, otherwise summably bounded), `neronFunction` for canonical metrics, `principal`, `neronTateHeight_eq_sum_neronFunction`. If θ([2]\*s_D)=a_Ds_D^q, then λ̂(2P)=qλ̂(P)−log|a_D(P)|. Weighted finite-definition-field sums give h_L or ĥ_L. Principal rescalings cancel by the product formula; local constants cancel only if their weighted sum is zero.

Elliptic conventions: ν_v=½λ_v^MS and λ_v^Sil=ν_v−log|Δ|_v/12. For t=−x/y, ν_v+log|t|_v→0 and ν_v(2P)=4ν_v(P)−log|ψ₂(P)|_v for P, 2P≠O; the Silverman equation adds log|Δ|_v/4. Sources: Gubler 2002 §§5.1.2, 5.2.15–18, 5.3.13–24 pp.96, 100–101, 108–109, 114, 117–119; Müller–Stoll §§2–3 Remark 3.1/Proposition 3.2 pp.2–4. *Needs:* §§0.16, 0.18–23.

**Checks.**

- A projective hyperplane gives log(max_i|x_i|/|x₀|)
- a principal divisor gives −log|f| and global sum zero
- sums represent h_D off D.
- The two elliptic normalizations above have the same global `(O)`-height `canonicalHeight/2` but different local equations.
- Approaching a smooth point of an effective divisor gives −log|t|+O(1)→∞.
- For D=0, λ_∞=1 and λ_p=0 has global sum 1, demonstrating that independent constants do not vanish.
- Both elliptic normalizations differ boundedly from ½log⁺|x(P)|_v.

### 0.25 Quartic duplication

`exists_quartic_duplication`: complete symmetric very ample, projectively normal L embeds an abelian A so [2] is given by quartics without common zero on A, and [2^l] by degree 4^l forms. Cube identifies [2]\*L=L⁴; projective normality lifts the coordinate sections. Section 0.15 gives h([2]P)=4h(P)+O(1). Sources: DGH Proposition 4.3 proof/(4.11) pp.19–20; GH §2.2(A2) p.11, §9.1 p.47. *Needs:* cube, §0.15; independent of canonical heights.

**Checks.**

- E embedded by O(4O) in ℙ³ has four quartic duplication forms.

### 0.26 Silverman–Tate in families

`AbelianScheme.silvermanTate`: for regular integral quasi-projective S/ℚ̄, S⊂S̄⊂ℙᵐ, abelian π:𝒜→S embedded in ℙⁿ×S, and generically symmetric L=O(1,1)|𝒜, |ĥ_(L_s)(P)−h(P)|≤c max(1,h_S̄(s)), c>0 uniform. Telescope §0.27 with c=c₁/3. Sources: DGH Theorem A.1 pp.36–40; GH (10.2) p.51. *Needs:* §§0.18–19, 0.27.

**Checks.**

- For a constant family with Segre height, the error is ĥ_A(P)−h_A(P)−h_S(s), so base-height dependence is necessary.

### 0.27 The family duplication bound

Under §0.26, `AbelianScheme.duplication_estimate`: |h([2]P)−4h(P)|≤c₁max(1,h_S̄(s)), c₁>0. Close the graph; [2]\*L⊗L⁻⁴ is generically trivial. Section 0.27a and characteristic-zero resolution bound its boundary extension by finitely many effective base divisors avoiding s; the base height machine bounds them. Source: DGH Proposition A.2/proof pp.37–40. *Needs:* §§0.16–17, 0.25, 0.27a; resolution.

**Checks.**

- In the constant Segre family the duplication error includes −3h_S(s)
- it cannot be uniformly bounded independently of s.

### 0.27a Generically trivial bundles on abelian schemes

`AbelianScheme.genericTrivial_pullback`: for abelian π:A→S, S normal integral locally noetherian, and L trivial generically, L≅π\*e\*L. The rigidified isomorphism is unique and commutes with base changes retaining the hypotheses. AM §7.2 supplies `universal_functions`, AM §§7.6.1–7.6.1a supply `relativePicardKernel` and `sectionPicardSplit`, and CC §C3.2d.3 supplies `relative_picard_separated` (geometrically integral fibres). The Picard section equals zero generically, hence on reduced integral S by separatedness; the kernel theorem gives L=π\*M, e* identifies M and universal functions gives uniqueness. Sources: EGA IV₄ 21.4.9–13 pp.358–361; DGH Remark 3.2 p.14/Appendix A pp.36–40.

**Checks.**

- L=π\*M recovers a possibly nontrivial M
- a nontrivial constant degree-zero generic bundle is excluded
- without rigidification scalar automorphisms prevent uniqueness.

*Needs:* precisely the Picard suppliers above and abelian rigidification.

### 0.28 Generic independence of fibre heights

`AbelianScheme.fibreNeronTate_indep`: over normal integral locally noetherian S, bundles on an abelian scheme isomorphic generically have identical fibrewise canonical heights wherever defined, including extensions of a fixed L₀^l, l≥1. Their quotient is π\*M by §0.27a. Source: DGH Remark 3.2 p.14. *Needs:* §§0.19, 0.27a.

**Checks.**

- Twisting by π\*M changes no fibre height.

### 0.29 Silverman's specialization limit

For smooth projective curve S/ℚ̄, K=ℚ̄(S), abelian π:𝒜→S° and generically symmetric ample L, `tendsto_specialization`: ĥ_(L_ρ(t))(x_t)/h_S(ρ(t))→ĥ_(K,L)(x) as the denominator→∞, where x∈A(K̄) is a section over an open of finite smooth cover ρ:S′→S and deg h_S=1. Over K′, relative height multiplies by [K′:K], while h_S∘ρ/h_S′→degρ; these cancel. Sources: GH Theorem 11.1/(11.1)–(11.2) pp.52–53; Conrad Remark 9.2 p.30. *Needs:* §§0.10, 0.12, 0.19, 0.26; degree-zero curve height o(h).

**Checks.**

- A constant point in a constant family has limit zero.

### 0.30 Generically finite maps and lower heights

`weilHeight_dominant_lower_bound`: for dominant generically finite f:X′⇢X/ℚ̄ and ample compactification heights, ∃c>0, c′ and dense open U in its domain with h(fP)≥ch′(P)−c′. Resolve the graph; a multiple of the pulled-back ample bundle minus a fixed ample bundle has a section. Apply §0.17 off its base locus. Source: GH Proposition 9.1 proof p.49 (Silverman's height bound). *Needs:* §§0.16–17; birational geometry.

**Checks.**

- [x:y]↦[x²:y²] has c=2 on all ℙ¹.
- Exceptional fibres explain the restriction to U.

### 0.31 Function-field cycle heights

Let K=k(S), k algebraically closed, S normal projective, dimS=δ≥1, M ample, A/K abelian, L symmetric ample. `IntegralModel` is projective π:𝒜→S with generic fibre A and extension ℒ. For integral d-dimensional X with closure 𝒳 define `naiveSubvarietyHeight`=(ℒ^(d+1)·π\*M^(δ−1)·𝒳)/((d+1)deg_LX), and `canonicalSubvarietyHeight`=lim_(n→∞)n⁻²h([n]X). Divide finite-field-of-definition relative-base scaling out. API: `model_indep/nonneg/point/translate_torsion`. Mixed intersections and §0.34 prove convergence/independence; ample model extensions after taking a power prove nonnegativity. Sources: Xie–Yuan (1.1)–(1.3) pp.2–3; Gubler 2007 §§3.1–6/Theorems 3.4, 3.6 pp.6–8; Gubler 2003 Theorem 11.18 pp.34–35. *Needs:* §§0.10, 0.19, 0.34; geometric mixed intersections.

**Checks.**

- Abelian subvarieties and {0} have height zero
- point height is §0.19's relative Néron–Tate height
- a positive-height translate of B can have nonzero height, so translation invariance is only asserted for torsion.
- For δ=1 the polarization M disappears.

### 0.32 Function-field height laws

`canonicalSubvarietyHeight_laws`: point heights are additive in symmetric bundles, functorial for homomorphisms and additive for product bundles; ample L, L′ are comparable by positive factors using ampleness of L′^N⊗L⁻¹, L^N⊗L′⁻¹. Mixed unnormalized H_(L₀,…,L_d)(Z) is multilinear and H_(φ\*Lᵢ)(Z)=H_(Lᵢ)(φ_\*Z); for φ generically finite on Z, its degree cancels after normalization. Ample base polarizations are similarly comparable, preserving small-point density. Sources: Gubler 2003 Theorem 11.18(a–e) pp.34–35; Gubler 2007 §§2.10, 3.1–6 pp.5–8; Xie–Yuan pp.2–3, 24, 26. *Needs:* §§0.19, 0.31; projection.

**Checks.**

- Pullback by [n] multiplies point height by n²
- unnormalized generically finite intersections retain their field-degree factor.

### 0.33 Base and constant extension for cycle heights

`canonicalSubvarietyHeight_baseChange`: for smooth projective curve S over algebraically closed k and finite K′/k(S) with normalization S′, recomputing relative heights over S′ multiplies point/normalized cycle heights by [K′:K], including inseparable degree. Algebraically closed constant extension preserves intersections and geometrically integral cycle heights. Small-point density survives both. Apply finite projection/flat base change. Sources: Conrad Lemma 8.6/Remark 9.2 pp.29–30; Xie–Yuan pp.2–3, 17–18, 22–25. *Needs:* §§0.10, 0.31.

**Checks.**

- Enlarging only a field of definition within one h_K changes nothing
- replacing the height base by S′ multiplies by its degree.

### 0.34 Model and local heights agree

`modelHeight_eq_admissibleHeight`: with §0.10's polarization, projective model intersections equal model-metric heights; on points their class is Weil's. Prove this first using local orders/projection, keeping mixed intersections unnormalized. After §0.31, uniqueness identifies the canonical limit with H_L(X)/((dimX+1)deg_LX) for canonical metrics. Sources: Gubler 2007 Theorem 3.4(e)/§§3.5–6 pp.6–8; Xie–Yuan (1.1)–(1.3) pp.2–3; GH §2.1 pp.9–10. *Needs:* §§0.11, 0.24; geometric intersections.

**Checks.**

- Standard ℙⁿ_S gives h_K on points
- on a curve over algebraically closed k the closed-point weights are 1 and points over L carry denominator [L:K].

### 0.35 Everywhere good reduction

`canonicalSubvarietyHeight_eq_of_goodReduction`: for abelian 𝒜 over smooth projective curve S/algebraically closed k and symmetric ample generic L, extend to symmetric rigidified ℒ. Then h_ℒ(X)=ℒ^(d+1)·𝒳/((d+1)deg_LX) is canonical and h_ℒ([n]X)=n²h_ℒ(X), n≥1. Extend a divisor on regular 𝒜, subtract π\*e\*ℒ, and apply §0.27a for symmetry. Relative cube gives [n]\*ℒ=ℒ^(n²); projection gives scaling. Source: Xie–Yuan §4.3 pp.21–22. *Needs:* §§0.27a, 0.31; cube.

**Checks.**

- A constant subvariety of a constant family has height zero. n=1 is identity
- n=0 is excluded from the image-dimension formula.

### Examples

On ℙ¹(ℚ), primitive coordinates (a,b) modulo simultaneous sign give `h([a:b])=log max(|a|,|b|)`. The points of height at most log 2 are `[0:1]`, `[1:0]`, `[1:1]`, `[-1:1]`, `[2:1]`, `[-2:1]`, `[1:2]`, `[-1:2]`, eight points. At height zero there are four. On ℙ⁰ there is one point, so the n=0 case is Northcott without a positivity assumption on the bound. Over ℂ(t), infinitely many constants have height zero; the number-field hypothesis in Northcott cannot be removed.

The functions n and n+7 on ℕ have the same height class. The alternating function (−1)^n also has zero class, although it is not constant. Tate's limit for the identity map, d=2 and constant function 1 is zero. For the successor map with d=1 the normalized iterates at zero are m and have no finite limit.

For an elliptic curve and its bundle `O(O)`, use half the native canonical height. For `O(2O)` use native `canonicalHeight`. Our unhalved `(O)`-pairing is native `neronTatePairing`; its diagonal is native `canonicalHeight`, twice the `O(O)`-height. For a constant abelian variety over a polarized function field, constant points have canonical height zero; this becomes the trace contribution in Layer 1.

### Dependencies

Mathlib's native bounded submodule and quotient APIs, admissible absolute values, scalar/tuple heights, Northcott and polynomial height inequalities; DiophantineApproximationAndTranscendence §§0.2–3; HeightsAndUnits §§0.1 and 1.1; AlgebraicModuliForArithmeticGeometry §§1.2, 7.2 and 7.6.1–7.6.1a; ComplexComparisonPartII §C3.2d.3; SchemeAndStackFoundations §§0.8–9, 3.4, 5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2; AbelianSchemesAndArithmeticModuli §§A1.4–A1.5 and A2.2–A2.8. The family, metric and cycle branches use their additional contracts stated above.

## Layer 1: Mordell–Weil, local division and the trace

### 1.0 Quotients by abelian subvarieties

For abelian B⊂A over a field, construct `AbelianVariety.quotient` q:A→A/B, smooth proper faithfully flat with kernel B. API: `quotient_ker/torsor/desc/baseChange`; A×B≅A×_(A/B)A gives unique descent of every B-invariant scheme map. Choose Poincaré complement C; addition B×C→A has finite-flat kernel D=B∩C. The existing C/D quotient descends (b,c)↦[c] through addition, proving identities and independence. Source: Conrad Theorem 3.7 p.6. *Needs:* AS A3.3, A6.3–5; fpqc descent.

**Checks.**

- B=0 gives A, B=A gives 0
- the diagonal in E² has quotient (P,Q)↦P−Q
- if D≠0 the target is C/D, not C.

### 1.0a Native additive points and multiplication kernels

For a native abelian variety A/K over an arbitrary field and a field extension L/K, `AbelianVariety.Points A L` denotes the `Additive` specialization of the native group of morphisms `Spec L → A` over `Spec K`; `AbelianVariety.torsion A n L` denotes `(nsmulAddMonoidHom n).ker` on these points. Over number fields use SI §2.12a’s interfaces for these same native specializations: evaluation of the identity section, addition and inverse, functoriality in L, integer multiplication, membership in the kernel of [n], inclusion for divisibility of n, base-change compatibility and functoriality under homomorphisms. The finite flat geometric kernel remains the isogeny supplier’s. At real places consume SI §2.12a’s conjugation adapter for AS A5.1, including exponential and lattice compatibility, Galois-equivariance on torsion and compatibility with Poincaré duality. Sources: Conrad §2, pp.2–4; Poonen Theorem 6.5.10(i), p.182; Milne ADT I Remark 3.7 p.46; SI §2.12a; native `TauCeti.AlgebraicGeometry.AbelianVariety.Basic` and Mathlib’s group-object over-Hom API. *Needs:* native abelian varieties, `CategoryTheory.MonObj` point operations and `nsmulAddMonoidHom`; SelmerIwasawaCohomology §2.12a for the number-field point, kernel and conjugation interfaces; AS A5.1 for complex uniformization.

**Checks.**

- Identity and inverse give `0 + P = P` and `(−P) + P = 0` on the native points, rather than componentwise coordinate addition in a projective presentation.
- Multiplication by two gives `2 • P = P + P`; on the zero abelian variety the group is a singleton.
- On an elliptic curve the operation agrees with its group law, including the point at infinity as identity.
- The one-kernel is the zero subgroup, the zero-kernel is the whole point group, and membership in the two-kernel is exactly `P + P = 0`.
- An infinite-order elliptic point is not in any positive-n torsion kernel, whereas a rational point of exact order two is in the two-kernel and not the one-kernel.
- A field extension can add torsion points; the geometric kernel is not reconstructed from the old field’s rational points alone.

### 1.1 Abelian Kummer maps

For an isogeny φ:A→B over an arbitrary field K, define the fppf map `kummer`:B(K)→H¹_fppf(K,A[φ]) by its fibre, kernel φA(K). API: quotient `injective`, `eq_torsorClass/baseChange/comp` via 0→A[φ]→A[ψφ]→B[ψ]→0, and `galois` for étale kernel. Prime-to-characteristic [n] gives A(K)/nA(K)↪H¹(G_K,A[n](K^sep)), with discrete geometric points. Over number fields identify this map with SI §2.12a’s `abelianKummer` under the fppf/Galois comparison, including field and isogeny functoriality. Sources: Poonen Theorems 6.5.10(i), 8.4.9 pp.182, 242–243. *Needs:* finite-flat isogenies/fppf cohomology.

**Checks.**

- δ(0)=0
- over a finite field and invertible n, Lang gives surjectivity and H¹(A[n])=A[n]/(Frob−1).
- Elliptic n=2 recovers the imported x−T norm-kernel description.
- Over ℚ, H¹(E[2]) is infinite but the Kummer image finite.
- On y²=x³−x, δ((0,0))≠0 because (0,0) is not twice a rational point.

### 1.2 Local Kummer images

Over number fields import SI §2.12a’s `KummerLocal` and its good-reduction/unramified comparison. Over global function fields own `localKummer_unramified`: good reduction at v with n≥1 prime to the residue characteristic makes the Kummer image H¹_nr(K_v,A[n]). Integral n-torsion is finite étale; Lang for the connected special fibre and Hensel give H¹(O_v,𝒜)=0. Apply integral Kummer exactness. Source: Poonen Theorems 8.4.6, 6.5.13 proofs pp.241–242, 183–184. *Needs:* §1.1; SI §2.12a for number fields; good reduction/unramified cohomology for function fields.

**Checks.**

- For elliptic n=2 at odd good p the image has order #E(K_v)[2].
- For n=1 both local groups are zero.
- At a good function-field place of characteristic p, n=p is excluded: the torsion kernel need not be étale.

### 1.3 Kummer Selmer structures and Sha

For an isogeny φ:A→B of abelian varieties over a number field K, use SI §2.12a’s `kummerSelmerStructure`, `abelianSelmerGroup` and `abelianSha` on the native point interfaces of §1.0a, with the supplier’s all-place `KummerLocal` conditions. Its `abelianSha` specializes the pinned `ContinuousCohomology.tateShafarevich` to discrete A(K^sep); use the supplied `mem_tateShafarevich` and `tateShafarevich_eq_ker_pi` API. Apply the supplied `abelian_localH1_comparison` for completed local fields, retaining real and complex places and SI §2.12a’s conjugation-equivariant lattice and real Tate comparisons. Use its Kummer membership, unramified-outside-finitely-many-places, finite-extension restriction and elliptic comparisons; write Sel^n and Sha[n] for its multiplication-isogeny specializations. Identify the fppf map of §1.1 with the supplied `abelianKummer`, so geometric fibres and cohomological classes agree. These Sha carriers are also those of SI §4.29’s pairing consumed in §§3.17a–d. Sources: Poonen Definition 8.4.4/Remark 8.4.5 p.241; SI §2.12a; Milne ADT I §§3, 6. *Needs:* SelmerIwasawaCohomology §2.12a; §1.0a; §1.1 for the fppf comparison.

**Checks.**

- The zero class is Selmer
- φ=id gives the zero Selmer group
- trivial local conditions differ from Kummer conditions.
- Zero coefficients give the zero native kernel
- a localization containing the identity map has zero kernel.
- All places, including real ones, occur
- Sha is locally trivial H¹, not all Weil–Châtelet classes.
- The zero abelian variety has Sha=0.
- Over ℚ, y²=−(x⁴+1) has no real point, so its nonzero class in H¹(ℚ, E) is not in Sha.
- Bhargava–Gross–Wang Theorem 10 with g=1 gives locally soluble genus-one curves whose classes are nonzero in Sha.

### 1.4 The descent exact sequence

For an isogeny φ:A→B of abelian varieties over a number field K, apply SI §2.12a’s `abelianDescent_exact` directly on the supplied carriers of §1.3. Its sequence is `0 → B(K)/φA(K) → Sel^φ(A/K) → ker(Sha(A) → Sha(B)) → 0`; identify its incoming map with the fibre map of §1.1 using the supplied Kummer comparison. Source: Poonen Remark 8.4.5 p.241; SI §2.12a. *Needs:* SelmerIwasawaCohomology §2.12a; §§1.1, 1.3.

**Checks.**

- For y²=x³−x over ℚ, Sel²=(ℤ/2)², Sha[2]=0 and all four classes are Kummer (§1.15).
- For φ=id all three terms vanish.
- For φ=[n], the right term is Sha[n], rather than all of H¹(K,A)[n].

### 1.5 Finite Selmer groups

For every isogeny φ:A→B of abelian varieties over a number field K, apply SI §2.12a’s `abelianSelmerGroup_finite` on the carriers of §1.3, and use its finite Sha[n] consequence for n≥1 through §1.4. The supplier’s restricted-ramification bound retains infinity, bad reduction of A and B, and primes dividing degφ, with its unramified comparison outside that finite set. Source: Poonen Theorem 8.4.6 pp.241–242; SI §2.12a. *Needs:* SelmerIwasawaCohomology §2.12a; §§1.3–1.4.

**Checks.**

- For E:y²=x³−x and S={2,∞}, the ambient group has 16 elements, while Sel² has 4
- finiteness does not make the upper bound an equality.
- Finite Sha[n] for each n≥1 does not imply finite full Sha.

### 1.6 Weak Mordell–Weil

`finite_quotient_nsmul`: for global K, m≥1 prime to charK, A(K)/mA(K) is finite. Use Kummer and §1.5 over number fields; over function fields apply §3.3a to the proper finite étale torsor [m]:A→A, independently of Mordell–Weil. The Lean signature states the number-field case on the native additive point group `AbelianVariety.Points A K`, with `AbelianVariety.torsion A n L` the kernel of [n] on L-points. Source: Poonen Theorem 8.4.9 pp.242–243.

**Checks.**

- Elliptic m=2 over a number field is imported
- m=1 gives the trivial quotient
- m=0 would assert finiteness of A(K), so is excluded.

### 1.7 Mordell–Weil

`fg_points`: over number-field K, A(K) is finitely generated with finite torsion, hence ℤ^r⊕torsion. A symmetric ample height is nonnegative, quadratic and Northcott. Section 1.6 and the triangle bound satisfy native `AddCommGroup.fg_of_descent'`; §0.20 also gives torsion finiteness. Sources: Conrad Theorem 7.1/Corollary 7.2 pp.23–24; Poonen §8.4.5 p.242. *Needs:* §§0.18–21 and ArakelovGeometryAndAbelianHeights §1.13, 1.6.

**Checks.**

- Elliptic points recover Tau Ceti's `fg_point_of_numberField`
- a constant positive-dimensional A over ℂ(t) contains the uncountable A(ℂ), so finite generation fails there.

### 1.8 Positive definiteness and regulators

`neronTateHeight_posDef`: symmetric ample L over a number field is positive definite on A(K)⊗ℝ; the b_L-Gram determinant on A(K)/torsion is positive. Section 1.7 gives a lattice; Minkowski's cylinder argument excludes every real null direction of a semidefinite form with finite lattice sublevels. Source: Conrad Lemma 10.1/discussion pp.35–37. *Needs:* §§0.20–21, 1.7.

**Checks.**

- In rank one the Gram matrix is (2ĥ(P))>0
- in rank zero the empty determinant is 1.

### 1.9 Chow's trace

Own `abelianHom_primaryExtension`: for primary K/k and k-abelian varieties B, C, scalar extension gives `Hom_k(B,C) ≃ Hom_K(B_K,C_K)`, naturally in B and C. Its subvariety-descent API says that every abelian subvariety of B_K descends uniquely to one of B. For homomorphisms, compare the two pullbacks over `K ⊗_k K` on prime-to-characteristic torsion; connectedness and schematic density give equality, then fpqc descent applies. Subvariety descent follows by splitting idempotents up to isogeny and taking scheme-theoretic images. Source: Conrad Theorem 3.19/Corollary 3.21, pp.10–11. *Needs:* AS A3, A6.3–5; SF fpqc descent and finite étale covers.

**Checks.**

- K=k gives the identity on Hom groups and subvarieties.
- For separably closed k, every extension K/k is primary, including purely inseparable ones.
- For `E/ℝ: y² = x³ − x`, the automorphism `(x,y) ↦ (−x,iy)` over ℂ does not descend to ℝ; the nonprimary extension ℂ/ℝ is excluded.

For primary K/k own `chowImage A`: a k-abelian variety I and a universal K-homomorphism `λ : A → I_K`, initial among homomorphisms from A to constant abelian varieties. This universal constant quotient is distinct from the scheme-theoretic image of a given map. Its API gives unique factorization, functoriality, surjectivity, constants and towers. Intersect the kernels of finite products of constant quotients; Noetherian stabilization yields the universal quotient, using descent of abelian subvarieties of constant varieties. Source: Conrad Definition 4.1/Theorem 4.3, pp.11–12, with Theorem 3.19/Corollary 3.21, pp.10–11. *Needs:* §1.0; AS A6.3–5 images, quotients and duality; `abelianHom_primaryExtension` above.

**Checks.**

- For constant A₀, its image is A₀ with identity map.
- The zero abelian variety has zero image.
- In characteristic p the universal quotient can have a nonsmooth kernel; it is not a quotient merely of geometric point groups (Conrad Example 4.4).

Own `chowImage_constantExtension`: for primary K/k and E/k, with either E/k separable or K/k regular, the canonical comparison `(chowImage A)_E → chowImage_(EK/E)(A_EK)` is an isomorphism, compatible with λ and iterated extension. Own `chowImage_summationSmooth`: if V is smooth geometrically integral over k, K=k(V), and A extends to an abelian scheme 𝒜/V, then for every m>dim A the sum of the m pulled-back λ maps is smooth and surjective over a dense open of V^m. Source: Conrad Theorems 5.4–5.5, pp.16–20. *Needs:* the universal image above; AS abelian schemes/duality and finite subgroup quotients; SF descent and spreading.

**Checks.**

- E=k gives the identity comparison.
- Regular K/k permits purely inseparable constant extension E/k; primary alone does not give that conclusion.
- For a constant abelian scheme, the sum is smooth already for m=1.
- Iterated constant extensions preserve the comparison and its compatibility with λ.
- For A=0 both assertions reduce to identity maps of the base.
- At m=0 and positive-dimensional image, the zero summation map is not surjective; the lower bound on the number of factors is essential.

For primary K/k define `trace` τ:Tr_(K/k)(A)_K→A by dualizing `chowImage(A∨)`, final among maps from k-abelian varieties. API: `universal`, `ker_finite` with connected Cartier dual (closed immersion in characteristic zero), `constant`, separable algebraic `baseChange`, arbitrary `constantExtension` for regular K/k, and primary `tower`. Its image quotient has zero trace. Source: Conrad Theorems 6.2, 6.4, 6.8, 6.12, pp.20–23. *Needs:* §1.0; the universal image and scalar-extension targets above; AS duality.

Own the strengthened `diagonal_closedImmersion`: for smooth geometrically integral V/k, A/k(V) extending to 𝒜/V, and every m>dim A, the m-fold pulled-back trace map is a closed immersion over a dense open of V^m, including nilpotents. Prove the scheme-theoretic intersection of the pulled-back trace kernels vanishes: the finite connected subgroup argument bounds the number of generic factors by the tangent dimension, and regular descent makes any remaining étale intersection constant, hence zero by trace universality. Smoothness of the dual summation map alone does not assert this vanishing. Source: Conrad Theorem 6.10/Remark 6.11, p.22, using the strengthened argument in the proof of Theorem 5.5, pp.18–20. *Needs:* the trace above; SF finite-flat descent and spreading; AS finite group schemes and duality.

**Checks.**

- On a constant family the diagonal trace map is a closed immersion for every m≥1.
- For A=0 the assertion is the identity on the base.
- The smooth isogeny [ℓ] in characteristic prime to ℓ on a positive-dimensional abelian variety has dual [ℓ], which is not a closed immersion; smoothness alone is insufficient.
- A nonzero infinitesimal kernel has only one geometric point but still prevents a closed immersion.

The trace has the following specializations.

**Checks.**

- Constant A₀ gives Tr=A₀ and τ=id
- Tr(0)=0
- nonconstant elliptic j over ℂ(t) gives trace zero.
- A nonconstant quadratic twist of a constant elliptic curve may have trace zero but become constant after a nonconstant quadratic extension (Conrad Remark 4.6).

### 1.9a Finite cohomology of curve local systems

`Curve.finite_etaleH1_primeToChar`: H¹_ét(U,F) is finite for smooth connected curve U/algebraically closed k and finite locally constant F killed by invertible m>0, including affine U. Trivialize on finite étale Galois V; cyclic factors are μ_d. Kummer theory (SF §§2.11, 2.16) and the Picard groups of curves (Stacks Lemmas 59.69.1–3, tag 03RN) give finite H¹(V,F); cover Hochschild–Serre has finite outside terms. Source application: Conrad (7.2) pp.24–25.

**Checks.**

- For constant ℤ/m, H¹(ℙ¹)=0 and H¹(G_m)=ℤ/m.
- In characteristic p, H¹(𝔸¹,ℤ/p) is infinite by Artin–Schreier, excluding m=p.

*Needs:* precisely those curve-cohomology suppliers.

### 1.9b Bounded sections modulo trace

`boundedHeight_finite_modTrace`: over K=k(C), k algebraically closed, C smooth projective connected, the h(P)≤M points of A⊂ℙⁿ_K have finite image modulo τTr(A)(k). Section graphs in ℙⁿ×C have degree≤h(P)+degC and Hilbert polynomial δt+1−g(C), δ the graph degree; fixed-polynomial Hilbert/section loci are finite type. Join parameters by integral curves D; normalize/complete D and extend D_K→A by properness. Subtract one value and factor through J_D⊗K; trace makes k-values equal modulo constants. Finitely many components suffice.

Own `Variety.integralCurve_through_finite`: finitely many closed points of positive-dimensional integral quasi-projective X/algebraically closed k lie on an integral curve. Successive high-degree hyperplanes through them, generically irreducible by Stacks 37.32.1–3/tag 0G4C, reduce dimension. Source: Conrad Lemma 7.5/proof pp.25–26. *Needs:* Hilbert/Hom, normalization, JC F and hyperplane irreducibility.

**Checks.**

- Constant sections may form positive-dimensional bounded families but one quotient class
- zero trace gives actual bounded-height finiteness.
- The graph's genus fixes its Hilbert polynomial
- degree alone is not used without a boundedness theorem.
- In dimension one the joining curve is the variety
- algebraically closed constants are essential in this joining argument.

### 1.9c Constant extension and tower reduction

`modTrace_constantExtension_injective`: for regular finitely generated K/k and k′/k, the map on point quotients by trace is injective. Use the product trace closed immersion over Frac(K^⊗m); fpqc descent and K∩k′=k descend a trace point, retaining nilpotents. `modTrace_tower_fg`: finite generation for K/E, E/k implies it for K/k by trace towers and subgroup/quotient exactness. Adjoin algebraically closed constants and induct along a separating transcendence basis. Source: Conrad Lemmas 7.3–4 pp.23–24. *Needs:* §1.9; regular extensions/abelian-group FG.

**Checks.**

- Constant points remain zero classes after larger constants
- full rational-point groups need not be invariant
- a purely inseparable nonregular extension cannot use this regular trace argument.

### 1.10 Lang–Néron

`fg_points_mod_trace`: A(K)/τTr(A)(k) is finitely generated for regular finitely generated K/k. Reduce by §1.9c to K=k(C), k algebraically closed; spread to 𝒜/U. Kummer and §1.9a give finite A(K)/m, m≥2 invertible. Trace points are divisible and have bounded height, hence canonical height zero; positivity kills cross terms. Section 1.9b gives finite quotient-height sublevels and native descent applies. Source: Conrad Theorem 7.1/Lemmas 7.3–5 pp.23–27. *Needs:* §§0.18–21, 1.9–c; precedes the kernel theorem.

**Checks.**

- Nonconstant elliptic j over ℂ(t) gives a finitely generated group
- positive trace must first be divided out.

### 1.10a Higher-dimensional bounded graphs

`boundedHeight_finite_modTrace_polarized` extends §1.9b to regular finitely generated K/k, trdeg=δ≥1, polarization(V,N). Own `genericGraph_degree_le`: with N very ample, W_P⊂ℙⁿ×V has degree≤(h(P)+d)^δ, d=deg_NV. Its coordinate map is generically birational; δ general hyperplanes meet its isomorphism locus, with pullback degree≤h(P)+d. Bézout and AM §1.6 give finitely many flat finite-type graph families. Only then extend constants (§1.9c). For a joining parameter curve D, normalize the integral incidence curve over K; its map to D_K has degree-one fibres at the graph parameters, hence is degree one and an isomorphism. Apply the Jacobian/trace argument. Source: Conrad Theorem 10.2/Lemma 10.3/proof pp.37–40. *Needs:* §§0.10, 1.9b–c; Bézout/bounded families/normalization.

**Checks.**

- δ=1 gives h(P)+d
- N↦N^m scales h by m^(δ−1)
- nilpotent thickenings of a fixed support are excluded from the geometrically integral boundedness statement.

### 1.11 The function-field height kernel

`neronTateHeight_eq_zero_iff_trace`: over polarized regular finitely generated K/k, trdeg≥1, symmetric ample height on A(K̄) has kernel geometric trace **constant points** plus torsion. On A(K), it is positive definite on the real vector space of the trace quotient. Sections 1.10–a and §1.8's cylinder argument prove this; pass to finite extensions for geometric points. Source: Conrad Lemmas 9.13, 9.16/Theorem 9.15/Corollary 9.17/§10 pp.35–41; Xie–Yuan Lemma 5.3/§5.3 pp.24, 26. *Needs:* §§0.19, 1.9–1.10a.

**Checks.**

- The kernel uses Tr(k̄), not all (Tr⊗K̄)(K̄)
- a nonconstant isotrivial twist has zero original trace but nonzero geometric trace.
- Thus zero original trace gives the torsion kernel on A(K), while the assertion on all A(K̄) needs zero geometric trace.

### 1.12 Two-coverings and W[2]

For abelian J, char k≠2 and J-torsor I, `TwoCovering I` is a J-torsor Y with π(y+a)=π(y)+2a, degree 2^(2dimJ). API: `class` forms an H¹(k,J[2])-torsor, nonempty iff [I]∈2H¹(k,J); `trivial` is [2]:J→J; isomorphisms retain the map to I. For separable degf=2g+2 and hyperelliptic C, define `W2` by Pic¹C→J, x↦2x−d, d the hyperelliptic degree-two class. Its H¹(J) image is [Pic¹]; `W2_eq_zero_iff` is §1.13. Source: BGW §1 p.2. *Needs:* §1.1; Picard torsors/twisting.

**Checks.**

- [2] has class zero
- an abelian surface covering has degree 16
- a point on C kills the H¹(J) image of W2 but need not kill W2.
- An elliptic fibre [2]⁻¹(a) has dimension zero and degree four, whereas the covering domain J has dimension one.
- When Pic¹ is everywhere locally soluble, W2 lies in Sel₂(J).
- The Kummer covering has map y↦2y−a and fibre [2]⁻¹(a).

### 1.13 Odd factorizations

`W2_eq_zero_of_odd_factor`: W2=0 iff the roots admit a Galois-stable unordered pair {S, Sᶜ} of complementary odd-cardinality root subsets, equivalently an odd factorization f=gh with g,h either both k-rational or conjugate over a quadratic extension. Odd subsets modulo complement identify its geometric torsor with degree-one Weierstrass classes e satisfying 2e=d. Source: BGW §1 p.2/Proposition 22(4) p.11. *Needs:* §1.12; J[2] Weierstrass description.

**Checks.**

- An S₆-sextic has no such pair, hence W2≠0; its Galois-stable partition into six singletons does not qualify.
- A rational linear factor gives the required pair of sizes 1 and 2g+1, so W2=0.
- Irreducibility alone does not suffice: x⁶−2 has conjugate cubic factors over ℚ(√2).

### 1.14 Two-Selmer sets with a fixed target

Define `selmerSet` Sel₂(I) as locally soluble two-coverings over fixed number-field J-torsor I; if nonempty it is a `selmerSet_torsor` under Sel₂(J). For α:Pic¹→J, composition gives a four-cover. `selmerSet_eq_preimage`: the fibre Sel₄(J)→Sel₂(J) above W2 is Sel₂(Pic¹)/δ₂(J[2](K)), δ₂ from 0→J[2]→J[4]→J[2]→0. A marked intermediate-cover identification gives Sel₂(Pic¹); forgetting it takes these orbits. For odd k>0, `selmerSetOfOrder k` retains local lifts over e_v−((k−1)/2)d for effective degree-k local e_v. Sources: BGW §§1, 8, 12 pp.2–3, 21–22, 33; Poonen Definition 8.4.4 p.241. *Needs:* §§1.3, 1.12; finite-kernel exactness.

**Checks.**

- I=J recovers Sel₂(J)
- C(K)≠∅ implies nonempty Sel₂(Pic¹), while everywhere local solubility need not (BGW Theorem 5).
- A chosen covering identifies this with its finite J[2]-torsor Selmer set
- I itself is a J-torsor.
- For E:y²=x³−x, the unmarked four-cover fibre above zero has one class but Sel₂(E) has four: δ₂(E[2](ℚ)) has order four.
- The quotient cannot be omitted.
- For that E, Sha[2]=Sha[4]=0 gives Sel₄(E)=E(ℚ)/4E(ℚ), which maps bijectively to Sel₂(E).

### 1.15 A complete elliptic descent calculation

For E:y²=x(x−1)(x+1)/ℚ order factors (x,x−1,x+1). At S={2,∞}, H¹(G_(ℚ,S),E[2]) consists of 16 triples in {±1,±2}³ with square product. Reality leaves eight: d₁, d₂ have equal signs, d₃>0. Exclude (2,2,1), (−2,−2,1), (2,1,2), (−2,−1,2) at 2: negative val(x) makes all valuations equal; for integral x consecutive x, x±1 allow only the last two valuations odd. Remaining (1,1,1), (−1,−1,1), (1,2,2), (−1,−2,2) come from O, (0,0), (1,0), (−1,0). Thus `elliptic_two_descent_example` gives Sel²=(ℤ/2)², Sha[2]=0, rank=0, E(ℚ)=E[2](ℚ). Source: EC Layers 6–7's x−T descent with these computations. *Needs:* §§1.4–7.

**Checks.**

- There are four rational points but sixteen ambient classes
- Sha[2] vanishes here.
- A locally soluble genus-one quartic with no rational point instead gives W2 outside the Kummer image (BGW Theorem 10, genus one), so the Selmer bound need not be sharp.

### 1.15a Integral commutative formal groups

For complete DVR O, g≥0, `IntegralCommutativeFormalGroup O g` bundles g native multivariate series F(X,Y)=X+Y+higher terms with identity/associativity/commutativity. Construct `inverse` degreewise. On (𝔪^r)^g, r≥1, degree-n terms have valuation≥nr, giving `eval.zero/assoc/comm/inverse_eval`; `restrictIdeal` is injective and `baseChange` respects continuous local DVR maps. For g=1 the series is native `FormalGroup` with `FormalGroup.IsComm`; the bundle here is its g-dimensional form, with the same variable convention. Source application: Katz Appendix Lemma′ pp.501–502; the multivariate convergence adapter is owned here. *Needs:* native `MvPowerSeries` and `FormalGroup`, complete-DVR convergence.

**Checks.**

- Additive laws give ordinary addition and g=0 gives one point
- T+U+TU gives 1+𝔪^r with inverse −T/(1+T)
- upper-unitriangular noncommutative laws are excluded.
- Evaluation of an arbitrary integral infinite series at units is not asserted.

### 1.15b Formal identity charts

`SmoothGroup.formalIdentityChart`: for smooth separated finite-type commutative G/O, dim=g, complete DVR O, étale identity coordinates identify ker(G(O)→G(O/𝔪^r)) with §1.15a on (𝔪^r)^g, r≥1, topologically. API: ideal restriction, base change, morphism series and coordinate transitions with invertible integral linear term. Formal étaleness gives compatible Artinian lifts; finite affine equations pass to inverse limits, and every kernel point lies in that identity neighbourhood. Congruences prove openness; finite residue field gives finite index. Use the smooth Néron model even at bad reduction, A(F)=𝒩(O); good Jacobian divisor specialization uses Abel–Jacobi base change. Sources: Stacks 29.37.21/tag 054L; Mattuck Theorem 7 §§13–14 pp.114–118. *Needs:* §1.15a; local topology/Néron.

**Checks.**

- G_a^g gives the identity chart
- G_m gives 1+𝔪^r and T+U+TU
- split multiplicative elliptic reduction still has a one-dimensional chart.
- Nonsmooth μ_p/ℤ_p is excluded
- infinite residue field does not give finite index.

### 1.16 The formal logarithm radius

`formalLogarithm_smallIdeal_equiv`: over finite F/ℚ_p, e=ord_Fp, an integral g-dimensional commutative formal group has unique log with derivative identity. For integer r>e/(p−1), log and its inverse identify (𝔪^r)^g with addition. Integrating integral invariant differentials introduces denominator dividing n; ord_pn≤(n−1)/(p−1) gives nr−e ord_pn>r for nonlinear terms. The difference estimate makes log−id contracting; native contraction solves log x=y. Sources: Katz Appendix Lemma′ p.502; Mattuck Theorem 7 §§13–14 pp.114–118. *Needs:* §§1.15a–b; DVR series.

**Checks.**

- Additive log is identity
- multiplicative log is Σ_(n≥1)(−1)^(n+1)T^n/n with inverse exp(T)−1.
- At e=p−1, ζ_p−1 is nonzero torsion in the maximal-ideal multiplicative group
- at p=2 this is −2/ℚ₂.
- The r=1 inequality must be strict.

### 1.17 Local doubling indices

`card_quotient_two_padic`: for dimA=g over finite F/ℚ_p, #(A(F)/2)=|2|_F^(−g)#A(F)[2], |a|_F=q_F^(−ord_Fa). A deep finite-index kernel U is O_F^g by §§1.15b–1.16. For C=A(F)/U the snake sequence 0→A(F)[2]→C[2]→U/2U→A(F)/2→C/2C→0 cancels equal orders #C[2]=#C/2C. Over ℝ the quotient order is #A(ℝ)[2]/2^g; over ℂ it is one, by uniformization and real components. Sources: Mattuck Theorem 7 §§13–14 pp.114–118; Katz Appendix p.502. *Needs:* formal/Néron/uniformization suppliers.

**Checks.**

- Full elliptic two-torsion over ℚ₂ gives 8
- over unramified quadratic ℚ₂ gives 16, since |2|=1/4.
- At odd p the lattice contributes 1
- g=0 gives 1.
- Real elliptic one/two-component curves give quotients 1/2 respectively
- complex quotients are trivial.

### 1.18 Torsion specialization

`reduction_injective_torsion`: at number-field good reduction, reduction injects prime-to-p torsion, and all torsion if e<p−1. Integral successive approximation makes [n] invertible on the formal kernel for p∤n; §1.16 at r=1 handles p. Jacobian divisor reduction commutes by Abel–Jacobi base change. In particular J(ℚ)_tors injects at good q≥3. Sources: Katz Appendix Lemma/Lemma′ pp.501–502. *Needs:* §§1.15b–1.16; good reduction.

**Checks.**

- E:y²=x³−x reduces at 3 to four points and its four torsion points inject
- ζ_p−1 at e=p−1 disproves the unrestricted formal claim
- dimension zero is trivial.

### 1.19 Two-isogeny Kummer coordinates

For E:y²=x(x²+cx+d)/ℚ, d(c²−4d)≠0, let φ′:E′→E be dual to its two-isogeny, E′:y²=x(x²−2cx+c²−4d). `twoIsogeny_kummer`: E(ℚ)/φ′E′(ℚ)↪ℚ×/squares sends P↦x(P), (0,0)↦d, O↦1. For integral c, d, Selmer classes are signed squarefree d₁|d with everywhere soluble smooth projective quartic v²=d₁u⁴+cu²+d/d₁; x=d₁u², y=d₁uv. Quotient by rational Kummer classes is Sha(E′)[φ′]. Sources: EC Layers 6–7; Poonen Remark 8.4.5 p.241. *Needs:* §§1.1, 1.4; local conditions at 2d/bad reduction.

**Checks.**

- For c=0, d=−1 the image is {1,−1}
- checking only an affine chart would omit covering points at infinity.

### Examples

For E:y²=x³−x over ℚ take S={2,∞}. Its rational two-torsion consists of O, (0,0), (1,0), (−1,0). The explicit x−T descent from EllipticCurves Layer 6, with the local images at 2 and infinity and unramified images elsewhere, gives `Sel₂(E)=(ℤ/2)²`. The image of `E(ℚ)/2E(ℚ)` is all of it; `Ш(E)[2]=0` and the rank is zero, so E(ℚ)=E[2](ℚ). The ambient `H¹(G_{ℚ,S},E[2])` has sixteen classes, not four. This is a numerical application of the elliptic supplier. For an everywhere locally soluble genus-one quartic with no rational point, W[2] lies in the Selmer group outside the Kummer image, so the Selmer cardinality is only an upper bound on rational-point rank (Bhargava–Gross–Wang, Theorem 10, p.3).

For the same E, a two-covering with Kummer class δ₂(0,0) has domain E and morphism `y↦2y−(0,0)`. Its fibre over zero has four geometric points and is a finite E[2]-torsor, not an elliptic curve. Composing with [2] gives a four-covering of class δ₄(2(0,0))=0. This computes the loss of an intermediate-cover marking.

Over ℚ₂ an elliptic curve with full rational two-torsion has eight classes modulo doubling. Over an unramified quadratic extension of ℚ₂ it has sixteen. At an odd prime the formal additive lattice contributes one, so the quotient order equals the local two-torsion order. For the multiplicative formal law over ℚ₂, T=−2 is a nonzero element of the maximal ideal killed by two; this disproves the logarithm assertion at the non-strict boundary r=e/(p−1)=1.

### Dependencies

Layer 0; §§1.9a–1.10a for trace-quotient boundedness and §§1.15a–1.15b for formal charts; SelmerIwasawaCohomology §2.12a for number-field native points and multiplication kernels, Kummer/Selmer/Sha, descent exactness, finiteness and the real-conjugation adapter; AbelianSchemesAndArithmeticModuli §§A3.1–A3.2, A5.1 and A6.3–A6.7; SchemeAndStackFoundations §§1.13–1.17, 2.3 and 3.6; EllipticCurves Layers 6–7; ArithmeticGaloisDuality Layers R02.3–R02.4; NeronModelsAndSemistableAbelianVarieties §§1.1, 1.8, 5.1. Lang–Néron precedes the function-field height-kernel theorem; it uses the Hom/Albanese and smooth-curve cohomology contracts, not that later theorem. The proper finite-étale-torsor adapter over global function fields is §3.3a; general connected-group finiteness here is over number fields only.

## Layer 2: Adelic spaces and Brauer evaluation

### 2.1 Affine adelic points

For finite-type K-algebra A, K a number field, define `AdelicPoints K A`=A→ₐ[K]𝔸_K using RG2.0.1's evaluation topology. API: continuous `diagonal/finiteProj/infiniteProj/map`, projection `ext`, `diagonal_injective/proj_diagonal`, finite/infinite factor homeomorphism. Sources: Poonen §2.6.3 p.49; Conrad *Adelic topology* Example 2.3 p.3. *Needs:* native adeles/`RestrictedProduct.evalRingHom`/completion algebras.

**Checks.**

- Spec K gives a singleton
- `adelicPoints_affineLine_homeomorph`: evaluation at t identifies the points for A=K[t] with the native adeles, with nonsurjective rational diagonal
- K[t,u]/(tu−1) gives ideles with the units topology.
- ℚ[t]/(t²+1) has no adelic points despite having ℚ₅-points.
- Hausdorffness and closed discrete rational diagonal are §2.6.

### 2.2 Integral models

`IntegralModel K A` is a finite-type O_K-subalgebra A₀⊂A spanning A/K. `integralPoints v` means x(A₀)⊂O_v; at infinity use all points. API: `ofGenerators/genericFibre/mem_integralPoints_iff/localize`: A₀⊗K≃A, finite-generator integrality and S-localization. Torsion-freeness/localization prove these. Sources: Poonen §2.6.3 p.49/Exercise 3.4(b) p.95. *Needs:* §2.1; native adjoin/finite type/completion integers; RG2.0.3.

**Checks.**

- ℤ[t] gives ℤ_p⊂ℚ_p
- O_K⊂K gives a singleton.
- ℤ[t/2] gives 2ℤ₂ at 2, agreeing with ℤ[t] at odd primes.
- The model ℤ[t]/(3t−1) of ℚ has no ℤ₃-point although its generic fibre has a ℚ₃-point.

### 2.3 Existence and independence of models

`eventually_integralPoints_eq`: generator models exist and any two agree after inverting N≠0, hence away from its finitely many prime divisors. Multiply denominators expressing their generators in one another. Source: Conrad *Adelic topology* Theorem 3.4(3) pp.5–6. *Needs:* §2.2; localization/Dedekind primes.

**Checks.**

- ℤ[t] and ℤ[t/2] become equal after inverting 2
- equality at every place is false.

### 2.3a Function-field models and products of local rings

For global function field K with exact finite constants k and smooth projective curve C, nonempty finite S gives affine U=C∖S and Dedekind O_(K,S)=Γ(U,O) with finite residues, by Riemann–Roch. `GlobalFunctionFieldIntegralModel` repeats §2.2 over this ring: `ofGenerators/genericFibre/localize/eventually_model_eq`. AGD R02.3.2 supplies places; native completion/residue equivalences and compact-open integers supply local fields.

`globalFieldModel_productLocalPoints`: separated finite-type 𝒳-points over (∏_T K_v)×∏_(v∉T)O_v equal the product of local/integral points. For local R_i partition indices according to a finite affine cover containing each closed-point image; the partition idempotents assemble affine maps. For injectivity use the quasi-compact diagonal: a quasi-compact locally closed subscheme of Spec∏R_i containing every factor scheme-theoretically is the whole scheme. Reduce its open to a finitely generated unit ideal, then its closed ideal to zero. Factor spectra are not an open cover.

`globalFieldModel_adelicHomeomorph`: finite presentation commutes with the filtered union of these coefficient rings. Compact-open integral charts give open stage embeddings, model independence, local compactness/Hausdorffness; properness gives the full compact local product. API: `map/id/comp/proj/proper_homeomorph_pi`. Source: Conrad *Adelic topology* Theorems 3.4, 3.6/Remark 3.5/Corollary 3.7/Proposition 4.4 pp.5–11. *Needs:* §§2.2–4, 2.11's common construction; spreading; AlgebraicCurves 3, 5; RG2.0.1–3.

**Checks.**

- For F_q(t), S={∞}, the t=0 integers are F_q[[t]]
- models F_q[t][x] and F_q[t][x/t] differ there only.
- P¹ gives the full product, with different charts needed at different places
- G_m gives ideles, whose inclusion in additive adeles need not be an embedding.
- S=∅ gives only k and cannot supply this spanning model.

### 2.4 Restricted-product description

`restrictedProductHomeomorph`: X(𝔸_K)≃ₜ∏_(w|∞)X(K_w)×Πʳ_v[X(K_v),X₀(O_v)], model-independently. Finite generators give eventual integrality; conversely evaluations of a/m are adeles. Both are the relation locus in a finite adele power. API: `eventually_mem_integralPoints/mk_of_eventually/proj_mk`, model-change homeomorphism. Sources: Poonen Exercise 3.4(c) p.95; Conrad *Adelic topology* Theorem 3.6 pp.6–8. *Needs:* §§2.1–3; RG2.0.1; restricted-product finite products.

**Checks.**

- A¹ is the native adele ring
- Spec K is a singleton
- G_m requires units at almost every finite place, so an arbitrary family in ∏K_v× is insufficient.

### 2.5 Existence of adelic points

`adelicPoints_nonempty_iff`: nonemptiness iff every X(K_v) and almost every X₀(O_v) are nonempty. Choose integral points off a finite exception, local points on it. Source: Conrad *Adelic topology* Theorem 3.6 pp.6–8. *Needs:* §2.4; choice.

**Checks.**

- ℚ[t]/(t²+1) fails at infinity
- A¹ succeeds with zero
- for proper X the integral condition follows from §2.11.
- ℚ[t]/(t²−2) has no ℚ_p-point for p≡±3 mod 8, so its adelic space is empty although it has real points.

### 2.6 The affine rational diagonal

`discrete_closed_diagonal`: for finite-type A/K, X(K)→X(𝔸_K) has discrete closed image and is a closed embedding; the Lean signature records the closed discrete image. Restrict the native K^n⊂𝔸_K^n diagonal along a finite-generator embedding. Source: Conrad *Adelic topology* Examples 2.2–2.3 p.3 and the paragraph preceding Example 4.3 p.10. *Needs:* §2.1; RG2.0.1; native adelic diagonal.

**Checks.**

- A¹ recovers K⊂𝔸_K
- a singleton is discrete
- the assertion is affine and does not apply to proper P¹'s full compact local product.

### 2.6a Twisted modules

For noetherian X and a μ_n-banded fppf gerbe 𝒢, n>0, define `TwistedModule(𝒢,i)` by the band's character ζ↦ζ^i, i∈ℤ/n. Coherence and local freeness descend from a flat presentation. API: `pullback`, `tensor` adds weights, `dual` negates them, `hom` has weight j−i, `weightZero_descent`; `endomorphismAzumaya` sends an everywhere positive-rank weight-one bundle to an Azumaya algebra representing the gerbe's G_m-class α. Conversely the splitting gerbe has its tautological bundle. Coherent modules on quasi-compact opens extend, using a coherent subsheaf of the quasi-coherent direct image containing finite generators. Finite locally free pushforward proves descent of representability along finite locally free surjections. Sources: Lieblich §§3.1.1–3.1.3, Lemmas 3.1.1.5–9, 3.1.3.1, 3.1.3.5 pp.7–10; de Jong *Gabber* §§2.3–2.15 pp.1–4. *Needs:* AM Layer 4's gerbes; scheme fppf Kummer, quasi-coherent descent and Azumaya splitting gerbes.

**Checks.**

- A weight-one line on a neutral gerbe has endomorphisms O_X
- a weight-one line on any gerbe forces α=0.
- Weight-one need not descend, whereas weight-zero does.
- Tensoring n weight-one factors has weight zero even when char divides n
- rank zero cannot represent a Brauer class.

### 2.6b Projective stabilization

`ProjectiveKZero(R)` uses native `SplitK0` of `finiteProjectiveModules R`. ClassicalArithmeticCompletion §§7.23–7.24, 7.42 supplies `[P]=[Q] ↔ ∃ m, P⊕R^m ≃ Q⊕R^m` and additive scalar extension along every unital ring map, including its object, identity, composition and free-class laws. `TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic` supplies `instCommRing/of_mul_of/one_def/mapRingHom`. For commutative R, own the symmetric-tensor adapter on this projective category and its `class/add/mul/baseChange/rank` refinements: the ring map `baseChange` has the supplied extension map as its underlying additive map. Rank is locally constant on Spec R; extension pulls it back.

For noetherian dim R=d, own `projective_freeSummand/projective_cancel` at rank>d: choose generators with increasing failure codimension, eliminate by prime avoidance, then move unimodular vectors by transvections. Own `rankKernel_nil`: filter K₀ by classes admitting, for every closed Y⊂maxSpec R, a finite projective complex whose Euler class is the given class and whose homology support meets Y in codimension≥i within Y; choose successive complexes against previous supports. Tensor adds codimensions, filtration vanishes above d, and its first term is ker rank. Arbitrary R descends finitely many idempotent matrices to finite-type ℤ; no uniform exponent.

`faithfulProjective_tensorPower_free`: positive constant-rank P, n>0 admit positive-rank Q and nonzero free F₀, F₁ with P⊗Q^⊗n⊗F₀≃F₁. Expand the inverse nth root of [P]/rankP in its nilpotent rank-zero part, clear denominators, represent large positive classes by free-summand splitting and cancel after scaling. `tensorPowerFree_directSumFree`: P^⊗n free makes a positive direct sum free; rational nilpotence kills [P]−rankP over ℚ, then clear torsion/cancel. It does not give n([P]−rankP)=0. Sources: Bass Theorems 8.2, 9.1–3 pp.23–28, Propositions 15.1–6/§§16.1–3 pp.38–43; Lieblich Lemma 3.1.4.3/Corollary 3.1.4.4 pp.12–13. *Needs:* ClassicalArithmeticCompletion §§7.23–7.24, 7.42; native projectives/idempotents; dimension, coherent supports/tensor complexes, prime avoidance.

**Checks.**

- A nonprincipal invertible Dedekind ideal has rank one without being free
- the tangent module of the real algebraic two-sphere is stably free of rank two and not free, so rank≥d is insufficient for cancellation
- a rank-zero factor has no rational inverse.

### 2.6c Affine Gabber comparison

`Brauer.affine_comparison`: Br_Az(Spec R)≃H²_ét(Spec R,G_m)_tors, for every commutative R, naturally. Lift n-torsion to a μ_n-gerbe with a positive-rank twisted bundle.

`localEtale_finiteFree_domination`: local étale B/A, A local, admits finite free C/A and B→C_m at every maximal m. A monic separable presentation's universal splitting algebra gives C; root permutations are transitive on its closed fibre. Glue local bundles on semilocal C, push forward and spread by finite presentation (Lieblich Lemmas 3.1.3.5–6 p.10).

`twistedBundle_affine_glue`: on two affine opens with affine intersection, stabilize twisted bundles P, Q to isomorphic positive direct sums on the intersection. Equalize ranks; §2.6b makes their nth powers free after ordinary tensor factors/copies. The ordinary Q∨⊗Q and P⊗Q∨ then have free nth powers, hence free positive direct sums; tensor tautologies identify the stabilizations. On an affine base the f admitting a bundle on D(f) form an ideal (this gluing gives f+g); local existence makes it the unit ideal. API: comparison/pullback, domination/gluing. Source: Lieblich Theorem 3.1.4.1/Corollary 3.1.4.2/Proposition 3.1.4.5 pp.11–13. *Needs:* §§2.6a–b; étale presentations/splitting algebras; native Azumaya injection.

**Checks.**

- Affine dimension>2 is included
- torsion is required for μ_n
- separatedness ensures an affine intersection for two affine opens.
- Rank-zero or arbitrary non-affine intersection does not supply the stabilization argument.

### 2.6d Quasi-projective Gabber comparison

`Brauer.quasiProjective_comparison`: Br_Az(X)≃H²_ét(X,G_m)_tors for quasi-projective finite-type X/infinite k, naturally. `TwistedModule.improve_free_codimension`: weight-one coherent modules, free outside codimension≥c and at finite T, produce one with bad codimension≥c+1. Choose n+1 modules F_i free at each other's codimension-c bad generic points, equalize/increase rank r, and map G₁=⊕F_i^⊕r^n to G₂=⊗F_i⊗L^N. Both have weight one. Surjectivity on their common free locus gives free kernel; at each selected bad point make its block an isomorphism, leaving a free kernel from the others. The forbidden determinantal cone has codimension nr^(n+1)+1>dimX.

`Coherent.section_avoiding_cones_with_values`: ample twists realize specified realizable Hom values at finite closed points while avoiding a fibrewise cone of codimension>dimX on the free locus. Serre vanishing lifts values; generators vanishing there give a coefficient space whose forbidden incidence has smaller dimension. Infinite k gives a point off its image closure. Other n tensor factors being ordinary free makes the bad-point identity block realizable without residue Brauer vanishing. Iterate past dimX. API: comparison/pullback, improvement, section avoidance. Source: de Jong *Gabber* §§3.9–3.22 pp.5–9; this incidence replaces arithmetic Skolem avoidance. *Needs:* §§2.6a–c; coherent extension/Serre/ample twists/determinantal dimension.

**Checks.**

- Affine X recovers §2.6c
- singular X is allowed because kernels are free only on verified loci
- finite k is excluded from this proof, although full Gabber holds there.
- General arithmetic ample schemes require de Jong's additional Skolem argument and are outside this contract.

### 2.7 Spreading Brauer classes

`exists_azumaya_model`: an Azumaya algebra descends to A₀[1/N], N≠0. Descend its finite projective presentation, multiplication and inverse A⊗Aᵒᵖ≃End A; further localization preserves positive rank. Cohomological torsion classes on general separated finite-type X spread by étale-cohomology limits. Source: Poonen Corollary 6.6.11 p.189. *Needs:* §2.2; finite-presentation/étale limits and Azumaya pullback.

**Checks.**

- A constant central simple algebra spreads outside its ramified primes
- N may need enlargement
- no claim is made that every model already carries the class.

### 2.8 Finite support of evaluation

`finite_eval_ne_zero`: each Brauer class at each affine adele evaluates to zero almost everywhere: spread its Azumaya representative and use integral evaluation in Br O_v=Br κ_v=0. Source: Poonen Proposition 8.2.1 p.229. *Needs:* §§2.4, 2.6c, 2.7; SF §2.22; finite-field Brauer vanishing.

**Checks.**

- Constant algebras have a fixed finite ramification set
- for (−1,t) on G_m, choose t_p=p at one prime p≡3 mod4 and t_v=1 elsewhere
- evaluation at p is 1/2.
- Thus the exceptional set can depend on the adelic point.

### 2.9 The affine Brauer–Manin pairing

Define `pairing α x`=Σ_vinv_vα(x_v) in AddCircle(1:ℚ), `brauerSet α` its zero fibre, `brauerManinSet` their intersection, `HasObstruction` by nonempty adeles/empty orthogonality. Section 2.6c identifies affine cohomological/Azumaya classes. API: `pairing_tensor`, `pairing_end` (End_A P with P finite projective of positive rank), `pairing_zero`, `brauerManinSet_subset/brauerSet`. Finite support defines the sum; real values are 0, 1/2, complex values zero. Source: Poonen Definitions 8.2.5, 8.2.7 p.230. *Needs:* §2.8; CFT 5; pullback.

**Checks.**

- Split and matrix algebras pair to zero
- an empty adelic space makes HasObstruction false.
- The constant Hamilton algebra over ℚ has sum 1/2 at 2 plus 1/2 at infinity, equal to zero.
- Orthogonality alone need not yield a rational point.

### 2.10 Rational orthogonality

`diagonal_mem_brauerManinSet`: rational x is orthogonal, since every evaluation restricts one α(x)∈Br K and reciprocity kills its sum. Constant classes pair to zero on all adeles. Source: Poonen Proposition 8.2.2/Corollary 8.2.6 p.230. *Needs:* §§2.1, 2.9; CFT 10.

**Checks.**

- A nonempty adelic space with empty Brauer–Manin set has no rational points
- constant classes give no obstruction even when individual local invariants are nonzero.

### 2.11 Adelic points of separated finite-type schemes

For separated finite-type X/global K, define `adelicPoints X`=⋃_(T⊇S finite)∏_T X(K_v)×∏_(v∉T)𝒳(O_v) with direct-limit topology, using §2.3a. API: `diagonal/proj/map/id/comp`, `homeomorph_pi_of_proper`, `continuous_injective_of_open/isClosedEmbedding_of_closed`, model independence/affine agreement. Spread morphisms; properness makes every local point integral off S. Sources: Conrad Proposition 3.1/Theorem 3.6/§4 pp.5–11; Poonen Exercise 3.4 p.95. *Needs:* §§2.1–4; spreading.

**Checks.**

- Spec K gives a singleton, A¹ the adeles, proper P¹ the full compact product.
- G_m gives ideles rather than ∏K_v×, which is not locally compact
- its inclusion into A¹ is continuous injective but not an embedding.
- Different local points of P¹ can require different charts, so a finite affine cover need not cover its adelic space.

### 2.11a Local étale inverses and smooth open maps

`LocalField.etale_points_localHomeomorph`: étale Y→X over any local field induces local homeomorphisms, even for singular X. In a standard étale chart expand its ambient polynomial with invertible derivative D. A sufficiently small complete ball gives higher-term Lipschitz c with ‖D⁻¹‖c<1; z↦z−D⁻¹(F(z)−b) contracts and preserves the ball for nearby b. Native fixed-point uniqueness/dependence gives the inverse; restrict by base change to X(k). Smooth local factorization through X×A^r gives `smooth_points_open`. API: open image/local section through a rational lift. Source: Poonen Proposition 3.5.73 pp.85–86. *Needs:* RG2.0.1; standard étale/smooth charts; native contraction.

**Checks.**

- Squaring on G_m is locally invertible when char≠2 without global injectivity
- Frobenius is not étale in char p
- X×A¹→X is open for singular X.
- An étale fibre with no rational point supplies no rational local section.

### 2.12 Local constancy of Brauer evaluation

`eval_locallyConstant`: each cohomological Brauer class on a finite-type local-field variety has locally constant evaluation. On an affine neighbourhood (§2.6c), subtract α(x); henselian comparison splits it. Finite presentation descends the splitting to a pointed étale neighbourhood, whose rational image is open (§2.11a). Integral evaluation is zero if the class extends and Br O=0. Source: Poonen Proposition 8.2.9/Remark 8.2.10 pp.230–231. *Needs:* henselian comparison/descent.

**Checks.**

- (t,−1) on G_m over ℝ is constant on each sign component with different values
- it does not extend across 0 or infinity.
- Nearby points lift to the étale neighborhood
- they need not factor through a single henselization.

### 2.13 The cohomological Brauer–Manin pairing

For separated finite-type X/number field, Br X=H²_ét(X,G_m)_tors. Define `brauerManinPairing`:X(𝔸)→Br X→+ℚ/ℤ, `brauerManinSet B` and obstruction as in §2.9. Spread the cohomological class (§2.7); Br O_v=0 gives finite support without global Azumaya representability. API: `diagonal/constant/antitone/affine/continuous` for each fixed class. A model neighbourhood gives uniform vanishing outside finite S, so §2.12 proves continuity; no discrete-Hom continuity for all Br simultaneously is claimed. Source: Poonen Propositions 8.2.1–2/Corollary 8.2.6 pp.229–231. *Needs:* §§2.7, 2.10–12; cohomological limits/pullback; CFT 5, 10.

**Checks.**

- Zero B gives the full adelic space
- affine comparison recovers §2.9
- a smooth conic has full Brauer–Manin set, since Br X=Br₀X.
- Constant classes pair to zero
- Skorobogatov's surface (§3.21) shows that nonemptiness does not imply a rational point.

### 2.14 Closed orthogonality sets

`isClosed_brauerManinSet`: orthogonality is closed, clopen for finitely generated B. Rational closure lies in it; for proper X a proper subset obstructs weak approximation. Intersect §2.13's clopen evaluation-zero fibres. Source: Poonen Corollary 8.2.11 p.232. *Needs:* §§2.12–13.

**Checks.**

- The Iskovskikh surface has nonempty adeles and empty orthogonality set
- infinite intersections need not be open.
- Pointwise finite support without a model neighborhood is insufficient to prove local constancy.

### 2.15 Functoriality

`brauerManinSet_map`: f(X′(𝔸)^f\*B)⊂X(𝔸)^B for a morphism f:X′→X of separated finite-type schemes over a number field and B⊂Br X; hence the full-Br inclusion. Evaluation naturality gives equality of pairings. Source: Poonen Proposition 8.1.8/Corollaries 8.1.9–10 pp.228–229. *Needs:* §2.13; pullback.

**Checks.**

- Any variety mapping to the Iskovskikh surface has empty Brauer–Manin set
- identity gives equality
- arbitrary morphisms give containment, without a claimed reverse inclusion.

### 2.16 Constant and algebraic Brauer groups

**Global third-cohomology vanishing.** Own `numberField_h3_units_zero`: for every number field k with separable closure kˢ, `H³(G_k, (kˢ)ˣ)=0`. For finite Galois L/k, the idele-class sequence gives `H²(Gal(L/k), I_L) → H²(Gal(L/k), C_L) → H³(Gal(L/k), Lˣ) → H³(Gal(L/k), I_L)`. CFT Layer 10's `exists_refinement_mem_range_ideleToClassH2` kills the connecting image after inflation to a finite Galois refinement. Shapiro and CFT Layer 6's `subsingleton_h3_unitsRep` kill the direct limit of the last term; the real term vanishes by cyclic periodicity and Hilbert 90, and the complex term is zero. Exact filtered colimits identify the remaining term with continuous Galois cohomology. Source: Milne, *Class Field Theory*, VII §2 (idele cohomology), VIII §4, pp.239–243 (idele-class sequence and refinement). *Needs:* CFT Layers 6, 10; ProfiniteCohomology Layer 10 all-degree finite-quotient colimits and Shapiro.

**Checks.**

- For k=ℚ the absolute third cohomology vanishes even though ℚ has a real place.
- For L=ℚ(√13,√17), the finite-layer third cohomology is nonzero: the idele H² image in the cyclic order-four class H² has order two. Inflation to refinements kills this obstruction.
- Over ℝ, `H³(Gal(ℂ/ℝ), ℂˣ)=0`, whereas `H²(Gal(ℂ/ℝ), ℂˣ)` has order two; vanishing in degree three does not remove the real Brauer invariant.

Define `brauerZero X`=im(Br k→Br X), `brauerOne X`=ker(Br X→Br X_(k^s)). API: `zero_le_one/pullback/quotient_equiv`, zero Br₀ pairing, and constant-map injectivity when X(k)≠∅. For smooth geometrically integral X with constant geometric units, HS gives Br k→Br₁X→H¹(k,Pic X̄)→H³(k,G_m); over number fields `numberField_h3_units_zero` kills the last term, giving Br₁/Br₀≃H¹(k,Pic). Azumaya interpretation needs §§2.6c–d. Sources: Poonen Theorem 6.7.5/Corollary 6.7.8 pp.195–196; Wittenberg *Zero-cycles* p.6. *Needs:* HS, §2.13, `numberField_h3_units_zero` above; CFT 10.

**Checks.**

- Spec k and P^n give Br₀=Br₁=Br k.
- A pointless conic's quaternion class lies in ker(Br k→Br C), so Br₀ is an image rather than an embedded copy.
- Some K3 surfaces have Br₁≠Br
- a rational point splits the constant map.
- Nonconstant units require the extended Picard complex of §3.8a.

### 2.16a Smooth-pair purity and supported vanishing

For smooth X over a field k, smooth Z⊂X of codimension c and n≥1 invertible in k, `SupportedCohomology`=fib(RΓ(X,μ_n)→RΓ(X∖Z,μ_n)) is ECF §0.7's cohomology with supports. Smooth-pair purity RΓ_Z≃RΓ(Z,ℤ/n(1−c))[−2c], whose counit is the cycle class normalized by c₁O(Z), is ECF §0.10's `ClassicalAlgebraic.smoothBoundaryPurity` with the classes of ECF §0.9; it is not reproved here. Own `supportedCohomology_vanishing`: for an arbitrary closed W⊂X of codimension≥c, H^j_W(X,μ_n)=0 for j<2c. In positive characteristic first pull back to the perfect closure k^perf. The universal homeomorphism preserves codimensions and, by SF §0.23a and ECF §F.0.4, transports the étale site, μ_n, supports and their cohomology. Over the resulting perfect field stratify the reduced support by smooth locally closed pieces and apply smooth-pair purity and localization. In characteristic zero k is already perfect. This does not identify H_W with the cohomology of W. API: `supportedCohomology_vanishing`, the localization triangle, coefficient change and étale pullback of the vanishing. Source: CT–Skorobogatov Theorem 2.3.1/§2.3.2 pp.55–58. *Needs:* ECF §§0.7, 0.9–10, F.0.4; SF §§0.23–0.24 (universal homeomorphisms, étale topological invariance, perfection), 2.11 (Kummer).

**Checks.**

- (A¹,0) starts in degree two, (A²,0) in degree four.
- Removing 0 from A² preserves H² but not generally H³.
- Over k=𝔽_p(s), W=V(t^p−s)⊂A¹ is not smooth over k; after perfect closure its reduced support is a smooth point, with supported vanishing below degree two.
- Crossing divisors require stratification
- n=1 gives zero.
- No arbitrary regular mixed-characteristic purity is asserted.

### 2.16b Brauer residues

For smooth integral X/characteristic-zero k and dense U, `smoothBrauer_residueExact` is 0→Br X→Br U→⊕_(boundary D)H¹(k(D),ℚ/ℤ), exact at Br X, Br U; codimension≥2 removal is an isomorphism. For smooth D, §2.16a/Kummer and Cartier closure extend Pic(U); the support class is c₁O(D), giving H¹(D,ℤ/n) residues. This injects generically since normality extends generically split finite étale torsors. Higher-codimension supported degrees two/three vanish. Stratify arbitrary boundaries and pass over n; finite-presentation limits give generic injection/finite support.

`brauerResidue_henselianFormula`: henselian DVR, invertible n, unramified χ gives ∂(χ,t)=χ and inv(χ,t(P))=ord(t(P))χ(Frob); the tame-inertia Kummer cochain fixes sign. Subtracting (χ,t) extends; pullback multiplicity e multiplies residues. API: `restrict_injective/residue/residueExact/removeCodimensionTwo/henselianFormula/pullbackMultiplicity`. Source: CT–Skorobogatov Theorems 3.7.1–4/Corollary 3.7.3 pp.93–96, §§2.3.3–4 pp.58–61. *Needs:* §2.16a; Cartier/limits/henselian/HS; LocalFieldsRamification Layer 4 tame quotient and tame inertia; ProfiniteCohomology Kummer; CFT 5.

**Checks.**

- A² and A²∖0 have equal Br
- (t,−1) on G_m/ℚ has nonzero residues at 0, ∞ and does not extend to P¹
- t=u² doubles those residues and kills this quaternion class.
- Exactness does not promise arbitrary residue tuples.

### 2.17 Unramified Brauer groups

For smooth geometrically integral V/characteristic-zero k, `unramifiedBrauer V` consists of classes extending to a smooth proper function-field model; `algebraicUnramifiedBrauer` intersects Br₁. Section 2.17a identifies all-DVR unramifiedness. API: `eq_range/eq_top_of_proper/birational/residue_iff`, the latter at all divisorial valuations. Sources: Wittenberg *Massey* §2 pp.6–7; CT–Skorobogatov Propositions 3.7.7–9 p.97. *Needs:* §§2.16–2.17a; compactification/resolution.

**Checks.**

- Br_nr(G_m/ℚ)=Br ℚ excludes (t,−1)
- P^n has Br_nr=Br
- P² and P¹×P¹ give the same subgroup of Br k(x,y).
- Unramified classes need not all be algebraic.
- Positive-characteristic all-valuations purity needs a separate argument.

### 2.17a All valuations and proper models

`properBrauer_intersectionValuations`: for smooth proper integral X/char0 k, F=k(X), im(Br X→Br F)=∩_RBr R over DVRs R⊂F containing k with fraction field F. Properness extends Spec F→X to every Spec R; conversely codimension-one local rings occur and §2.16b extends. This gives model independence/birational invariance without making every valuation a divisor on one model. Compactify quasi-projective U by AM §9.5; general separated smooth U by EtaleCohomologyFoundations §G.2 `nagataCompactification`, with §§G.1–G.3 supplying compactification objects and refinements, then AM §§9.1–5 resolution preserving U. API: intersection, `modelIndependent/restrictToSmoothOpen/birational`, constants/function-field compatibility. Source: CT–Skorobogatov Propositions 3.7.7–9 p.97. *Needs:* §2.16b; named suppliers; valuative criterion/native DVR Brauer injection.

**Checks.**

- P² and P¹×P¹ agree
- a valuation centered in codimension two still receives every class on X.
- A nonproper affine model can have additional ramified classes
- a non-quasi-projective U is not given an open projective embedding.

### 2.18 Unramified pairing on the full local product

`unramifiedPairing_finiteSupport`: ∏_vV(K_v) pairs with Br_nrV by a finite-support invariant sum, additive/locally constant per class, with rational diagonal orthogonal, for smooth geometrically integral V/number field. Extend to a proper model and spread; properness gives uniform vanishing off finite S. Source: Wittenberg *Massey* §2 pp.6–7. *Needs:* §§2.11, 2.13, 2.17a.

**Checks.**

- Constant classes pair to zero on the entire product
- ramified (t,−1) on G_m is excluded
- for proper V this is the ordinary pairing.

### 2.19 Almost-everywhere locally trivial algebraic classes

`brauerOmega V`⊂Br₁/Br₀ consists of almost-everywhere locally zero classes. For constant geometric units §2.16 identifies it with the analogous H¹(K,Pic V̄) subgroup. API: `mem_iff/cohomology_equiv/sha_le/pairing_finiteCoordinates`. Outside finitely many places evaluation is constant, hence the sum depends on finitely many coordinates; everywhere locally trivial classes pair constantly. Source: Wittenberg *Massey* Remark 4.5 p.13. *Needs:* §§2.13, 2.16.

**Checks.**

- Zero and constants belong
- a class nonzero locally at one place still belongs
- Sha¹(Pic V̄) lies inside B_ω and equality need not hold.

### 2.19a Finite-flat norms and curve reciprocity

For finite locally free f:Y→X, rank d, define `finiteFlatBrauerCorestriction` by determinant norm f_\*G_m→G_m. Finite étale direct image is exact: strict henselian tests decompose into strictly local components, giving finite products of geometric stalks. Leray identifies H²(Y,G_m)=H²(X,f_\*G_m). API: `pullback_comp`=d, `baseChange/fieldAgreement/specializationLengths`. On finite F-algebra ∏A_i with residues F_i, lengths e_i, it is Σe_i cor_(F_i/F). Radical filtration computes determinant norms; the nilpotent unit kernel has affine-acyclic additive successive quotients, proving Brauer invariance. Apply this at sheaf/cohomology level.

`properCurve_brauerPrincipalDivisor_zero`: normal proper integral C/char0 F satisfies Σord_P(g)cor β(P)=0. Nonconstant g gives finite flat C→P¹; fibre norms identify zero/pole evaluations of cor β. They coincide since Br P¹=Br F (geometric Kummer generator O(1), HS, rational point). Constant g is immediate. Normalize curves in proper X; `zeroCycle_brauerProjection` descends to CH₀. Source: CT–Skorobogatov Proposition 3.8.1 pp.98–99/Lemma 3.8.5 p.101/Lemma 5.3.1/Proposition 5.3.2 pp.136–137. *Needs:* finite direct image/derived cohomology/affine acyclicity; normal-curve flatness/normalization; Kummer/HS; ECF §0.9 projective-bundle formula; field corestriction.

**Checks.**

- Identity gives identity
- F[ε]/ε² gives twice the residue class, as does the fibre at 0 of t=u².
- Constants on principal divisors give degree zero
- cor(f\*α)=dα rather than α.

### 2.20 Brauer pairing on zero-cycles

For smooth proper X/number field define `ZeroCycle.brauerEval α P`=cor_(K_v(P)/K_v)α(P), extend linearly and sum invariants over local cycles of arbitrary degree. Proper spreading gives uniform vanishing off finite S, even for unbounded degrees. API: `brauerPairing/rationalEquivalence/global/point/pushforward`. Section 2.19a kills principal divisors; corestriction/invariants and reciprocity over K(P) kill global cycles. Complex norms at real places pair to zero. Source: Wittenberg *Zero-cycles* (1.1) pp.2–3/Notations p.6. *Needs:* §§2.13, 2.19a; cycles; CFT 5, 10.

**Checks.**

- Rational points recover the ordinary pairing
- complex points at real places give zero
- the zero cycle gives zero.
- A global degree-two closed point is orthogonal without being a rational point.

### 2.20a Finite Brauer quotient for rationally connected varieties

`rationallyConnected_brauerFinite`: smooth proper geometrically rationally connected X/number field has finite Br X/Br₀. For smooth projective geometrically rationally connected X in characteristic zero, `veryFree_twoPointSmooth` supplies a geometric component of Hom(ℙ¹,X) with dominant evaluation at two fixed distinct points. Generic smoothness on the smooth locus of its reduced component makes the evaluation differential surjective at a general f. Splitting f\*TX=⊕O(a_i), surjectivity at both points forces a_i≥1, hence H¹(ℙ¹,f\*TX(−2))=0. Hom deformations by tangent sections/Čech H¹ obstructions then give smooth two-point evaluation near f (Debarre Proposition 2.4/proof 2.5 pp.5–6). For proper nonprojective X first use the projective modification below.

Forms and their tensor powers restrict negatively to very-free curves, hence vanish; Hodge gives H^i(O)=0, i>0, χ=1. Étale covers lift the curves by Riemann–Hurwitz, so also have χ=1; HRR then makes their degree one. Thus geometric π₁=1 and Pic torsion-free. Exponential cohomology/GAGA identify Pic=H²(X(ℂ),ℤ); finite CW type makes it finitely generated. Kummer comparison identifies geometric Br with finite H³-torsion. Pic's action factors through finite G, so H¹(K,Pic)=H¹(G,Pic) is finitely generated and |G|-torsion. HS gives finite arithmetic Br/Br₀. For proper nonprojective X, projective Chow modification/resolution preserves rational connectedness and §2.17a preserves Br. API: very-free evaluation, `coherentVanishing/finiteEtaleTrivial/geometricBrauerFinite/brauerFinite`, constant/base-change compatibility. Source: CT–Skorobogatov *Good reduction*, Lemmas 1.1–3 pp.579–581. *Needs:* AM §§1.6, 3.4, 8, 9.1–9.5; geometric HRR; P¹ bundles; CC C2, C5.3, C6.2–C6.3; AlgebraicTopology 6, 8; §2.17a.

**Checks.**

- P¹ has Pic ℤ and quotient Br/Br₀=0
- a geometric cubic surface has Pic rank seven and Br zero, while its arithmetic quotient can be nonzero.
- Elliptic curves fail H¹(O)=0.
- The horizontal rulings of ℙ¹×ℙ¹ cover it but have f\*TX=O(2)⊕O; their two-point evaluation misses pairs with distinct second coordinates and they are not very free.
- Proper nonprojective X uses modification, not an assumed ample bundle.
- No algorithm or bound is claimed.

### 2.20b Auxiliary places detecting residues

`ramifiedBrauer_auxiliaryPlaces`: α∈Br U not extending to smooth geometrically integral X/number field K is detected by ambient-integral U(K_v)-points at infinitely many finite v, avoiding any finite set. Choose a nonzero boundary character (§2.16b), shrink its smooth divisor, remove other boundaries, spread its cyclic cover/uniformizer/chart. For divisor constants L and cover constants L′≠L, Chebotarev gives degree-one L-places with nonzero L′-Frobenius; Lang–Weil gives divisor points. If L′=L, choose large v split in the normal closure of L: base and connected cover have asymptotic q^dimD points, so not all fibres can split (that would multiply the cover count by its degree). Dimension zero uses constants.

Subtract (χ,t); residue exactness extends the difference, with zero integral evaluation after spreading. A smooth chart lifts the residue point with t=ϖ, giving inv α=χ(Frob)≠0. API: `boundaryResidue_nonzero/auxiliaryPlaces_infinite/avoidFinite/auxiliaryPoint_integralOnAmbient/residueFormula`. Sources: Harari Theorem 2.1.1/§§2.2–2.4 pp.226–233; CT–Skorobogatov Theorem 12.6.1 pp.262–264. *Needs:* §§2.16b, 2.7–8, 2.11a; spreading; CFT 5; Chebotarev 10; IG.2.5 Lang–Weil.

**Checks.**

- (t,−1) on G_m⊂A¹ at t=p, p≡3 mod4, has invariant 1/2 and is integral on A¹, not G_m.
- An extending class cannot do this outside its spreading set.
- Geometrically connected residue covers are detected even without a constants extension
- excluding finite places preserves infinitude.

### 2.20c Finite compensation

`finiteBrauer_compensate`: for X, U as above, finite B⊂Br U, an X-adele orthogonal to B∩Br X and finite prescribed neighborhoods, there is a B-orthogonal U-adele in them. Enlarge S for infinity/spreading/U-integral existence. Outside S, ambient-integral evaluations annihilate B∩Br X. Put C=B/(B∩Br X); let R⊂C∨ consist of characters recurring infinitely often. Section 2.20b detects every nonzero c infinitely often; finiteness makes some R-character detect c, hence ⟨R⟩=C∨. Approximate inside U at S using density/constancy. The residual sum descends to C; express its negative as a sum in R, replace negative coefficients modulo orders and choose distinct fresh realizing places. Elsewhere use zero-evaluating U-integral points; finitely many ambient-integral exceptions still form a U-adele.

`formalLemma_reduceToFinite`: if Br X/Br₀ and A/(A∩Br X) are finite, adjoin Br₀; torsion lifts of finite quotient generators generate finite B with A=B+(A∩Br₀). Constant pairing vanishes. API: `recurrentEvaluationCharacters/recurrentCharacters_generateDual`, compensation, finite reduction, neighborhood/S compatibility. Sources: Harari §2.6 pp.233–235; CT–Skorobogatov Theorem 12.6.3 pp.264–266. *Needs:* §§2.20a–b, 2.8, 2.10–12, 2.14; Lang–Weil; finite duality/torsion.

**Checks.**

- B⊂Br X gives C=0
- for C=ℤ/3, residual 1/3 is cancelled by two fresh places with character 1/3, without assuming one place realizes 2/3.
- Infinite constant subgroups disappear in the reduction
- without the finite quotient hypothesis it fails.

### 2.21 Harari's formal lemma

`formal_lemma`: if X/number field is smooth proper geometrically rationally connected, V⊂X dense, A⊂Br V and A/(A∩Br X) finite, then V(𝔸)^A is dense in X(𝔸)^(A∩Br X). Sections 2.20a–c preserve every finite family of neighbourhoods. Source: Wittenberg *Zero-cycles* Corollary 2.2 proof p.8/CT–Skorobogatov 2000 Proposition 1.1. *Needs:* §§2.12, 2.14, 2.17, 2.20a–c.

**Checks.**

- A⊂Br X needs no ramification compensation
- the hypothesis concerns the quotient, not finiteness of Br V
- an empty target makes density vacuous.

### 2.22 Cyclic symbols and invariant matrices

For cyclic L/K, degree r≥1, χ of exact order r, define `cyclicAlgebraClass χ a`, a∈K×. API: `eq_zero_iff` local norm from L⊗K_v, `mul` additive, `inv_mem` (1/r)ℤ/ℤ, `one`=0. `localInvariantMatrix` has entries inv_v(χ,P_i(t_v)), excluding polynomial zeros. Use the additive wrapper of native `BrauerGroup.mk`. Source: SS *Schinzel* §5.2/(5.2), (5.4)–(5.10) pp.722–724. *Needs:* CFT 5.

**Checks.**

- Quadratic χ gives the quaternion (d,a)
- a=1 gives zero
- ℚ(i) and a=−1 give real invariant 1/2.
- For K=ℚ, L=ℚ(i), the local symbol (χ, a)_p is the Hilbert symbol (−1, a)_p.
- Zero parameters are excluded.
- The biquadratic ℚ(√13,√17) norm principle can fail, so cyclicity is essential.

### 2.23 A norm principle omitting one place

`isNorm_of_local_norm_off_one_place`: cyclic L/K, a∈K× locally a norm off one place implies a global norm. Reciprocity kills that invariant; ABHN/cyclic splitting proves the norm. Source: SS Theorem 5.3 proof p.720. *Needs:* §2.22; CFT 10, 13.

**Checks.**

- For ℚ(i), local sums of two squares at all p≠3 and infinity force a rational sum of two squares
- no such claim is made for noncyclic extensions.

### 2.24 Global norms from invariant matrices

`isNorm_prod_of_invariantMatrix`: for cyclic L/K, q_i∈K×, finite S, distinct e_i∉S, suppose inv_v(χ,q_i)=0 off S∪{e_i}, and b_vi=inv_v(χ,q_i) on S has both zero column sums and zero row sums. Reciprocity kills each exceptional invariant; distinctness isolates the factor, and rows kill the product at S. Thus ∏q_i is a global norm. Source: SS (5.7)–(5.10) pp.723–724. *Needs:* §§2.22–23.

**Checks.**

- One factor recovers §2.23.
- For ℚ(i), q₁=3, q₂=7, S={2,∞}, rows vanish (two halves at 2), but columns fail and 21 is not a norm at 3 or 7.
- For q₁=−1, S={2,∞}, e₁=3, the column vanishes but rows fail and −1 is not a real norm.
- Neither condition replaces the other.

### 2.25 Brauer groups of complete intersections

`brauer_completeIntersection`: smooth complete intersection X⊂P^N, dimX≥3, char k=0, has Br k≃Br X. Section 2.25a gives geometric Pic ℤ·O(1) and H²(μ_n) generated by c₁O(1); Kummer kills geometric Br. HS, H¹(k,ℤ)=0 and descended O(1) give injectivity/surjectivity without a point or H³(k,G_m)=0. Over number fields BM is vacuous; simple connectedness and §3.8 also make descent vacuous. Sources: Poonen Theorem 8.6.12 p.252; BLS §1 p.2. *Needs:* §§2.25a, 2.13, 2.16; §3.8 only for descent.

**Checks.**

- Cubic and quartic threefolds have full Brauer–Manin sets
- no rational point is thereby asserted.
- Surfaces are excluded
- Brauer vanishing alone would not establish descent vacuity.

### 2.25a Complete-intersection Picard and finite coefficients

`smoothCompleteIntersection_lefschetz_charZero`: over algebraically closed char0 k, smooth complete intersections dim d≥3 have Pic=ℤ·O(1), H²_ét(μ_n)=ℤ/n·c₁O(1), n≥1, and π₁^ét=1. Over ℂ, Bertini gives a general smooth flag. AffineMorseLefschetz §A5, applied in a Veronese re-embedding in which each member of the flag is a hyperplane section of the preceding one, gives H_j(X,A;ℤ)=0 and π_j(X,A)=0 for 1≤j below the dimension of X, so each smaller member has the same π₁ and low-degree cohomology; a proper smooth universal family on the irreducible smooth equation locus transports topology/hyperplane class to any smooth intersection by Ehresmann, without assuming its partial intersections smooth.

`completeIntersection_intermediateStructureCohomology`: H^i(O)=0, 0<i<d. The regular-sequence Koszul resolution is exact by nonzerodivisor induction; standard affine Čech monomials on P^N contract unless all exponents are negative, which contributes only in degree N. Exponential cohomology/GAGA identify Pic with H²; finite comparison/Riemann existence give μ_n and π₁. Descend into ℂ and use separably closed invariance; H¹(O)=0 kills Pic⁰, leaving the hyperplane lattice. API: vanishing, `picard_hyperplane/muN_hyperplane/geometricPiOne_trivial`, Kummer/coefficients. Sources: Poonen Theorem 8.6.12 p.252; Halpern-Leistner Corollaries 2.7–8 pp.6–7. Čech/Koszul/family adapters owned here. The finite-coefficient statement for a smooth ample hyperplane section of a smooth projective variety is ECF §F.7's `VanishingCycles.etaleWeakLefschetz`; the Picard and π₁ conclusions and the transport across singular partial intersections are owned here. *Needs:* AffineMorseLefschetz §A5; CC C4.1, C5.2, C5.4, C6.2–C6.3; ECF §§F.2.2, F.7; coherent cohomology; AM 7.2.

**Checks.**

- A cubic threefold has Pic ℤ and geometric Br zero
- a quartic surface may have nonzero Br.
- Singular partial intersections use family transport
- O(1), not degree times O(1), is the generator.

### 2.26 Conics

`conic_hassePrinciple`: smooth number-field conics have Br=Br₀, full BM set, Hasse principle and pointed weak approximation. Geometric Pic is trivial-action ℤ, geometric Br=0; HS gives Br=Br₀. Hasse–Minkowski gives a point; projection identifies it with P¹. Source: Poonen Theorem 4.5.11 p.108. *Needs:* §§2.13, 2.16; GQF 5; field approximation.

**Checks.**

- x²+y²=3z² has no ℚ₃-point: a primitive solution modulo 3 forces x, y divisible by 3 and then z too.
- Its adelic space is empty, rather than a Brauer–Manin counterexample with local points everywhere.

### 2.27 Iskovskikh's surface

`iskovskikh_brauerManin`: the smooth proper model of y²+z²=(3−x²)(x²−2)/ℚ has adeles and empty BM set, detected by α=(3−x²,−1). The norm equation cancels residues. Hensel gives local points; invariants are zero at odd p and ∞, and 1/2 at 2, by unit/valuation calculations. Source: Poonen Propositions 8.2.14–15 pp.232–235. *Needs:* §§2.12–13, 2.16b; quaternion invariants/henselian comparison.

**Checks.**

- Every adelic point has sum 1/2
- the class is on the proper model, not merely the displayed affine chart
- constants alone could not give that sum.

### 2.28 Finite local partitions

`brauerManinSet_finite_description`: for smooth proper X/number field and finite specified B⊂Br X, ∃finite T and finite clopen partitions of X(K_v), v∈T, on which B-evaluations are constant; BM is a finite fibre constraint. Spread B uniformly; use compactness/local constancy. Source: Poonen Remark 8.2.12/§8.2.6 pp.232, 235–236. *Needs:* §§2.8, 2.12, 2.14.

**Checks.**

- Iskovskikh's example has T={2,∞}
- the invariant is constant with value 1/2 at 2 and zero at infinity.
- Empty local spaces give empty partitions
- a compact point space can still have infinitely many points in a single partition cell.

### Examples

For ℝ[T]/(T²−1), the real point space consists of evaluations at ±1, a discrete two-point subspace of ℝ. The algebra ℝ[T]/(T²+1) has no real points. The algebra ℝ[ε]/(ε²) has one real point, ε↦0, demonstrating that local point topology alone does not detect nilpotents.

For affine one-space the adelic points are the native adele ring and the rational diagonal is closed and discrete. For ℙ¹ the proper adelic space is the full local product: choose [0:1] at one place and [1:0] at another. This adelic point need not lie in the adelic points of any one chart from a fixed two-chart affine cover. An affine-chart cover of the scheme does not create a cover of its adelic points.

The conic x²+y²=3z² has no ℚ₃-point: a primitive integral solution would force all coordinates divisible by 3. Its adelic space is empty, so it does not furnish an obstruction with a nonempty adelic space. On the smooth proper Châtelet model of `y²+z²=(3−x²)(x²−2)`, local points exist everywhere. The class `(3−x²,−1)` has invariant 1/2 at 2 and zero at every other place on every local point, so the global sum is 1/2 and the Brauer–Manin set is empty (Poonen, Propositions 8.2.14–8.2.15, pp.233–235).

### Dependencies

Mathlib algebra maps, finite type, multivariate polynomials and RestrictedProduct; Tau Ceti number-field adeles, field Brauer groups and diagonal topology; Layer 0's coordinate interfaces; SchemeAndStackFoundations §§0.8–9 and 2.22; ClassFieldTheory Layers 5, 10, 13; GlobalQuadraticForms Layer 5. The unramified, zero-cycle and complete-intersection branches additionally require compactification/purity, curve Brauer reciprocity and Lefschetz, respectively. Finite evaluation partitions are mathematical existence statements.

## Layer 3: Torsor descent and obstruction comparisons

### 3.1 Evaluation and twisting

For smooth affine k-group G, torsor Z→X, define `Torsor.eval(x)` as its fibre in H¹(L,G). `twist τ` uses the inverse torsor under inner G_τ: the fibre splits iff eval(x)=τ_L. API: base change, trivial/iterated transported twist, fibre-point criterion. For commutative G, [Z^τ]=[Z]−τ (Harpaz–Wittenberg *Zero-cycles* use σ=−τ). Source: Poonen §§6.5, 8.4.1/Example 6.5.12 pp.183, 239–240. *Needs:* SF §§1.13–17, 2.3; evaluation/naturality are owned here.

**Checks.**

- τ=0 returns Z
- twisting by τ then −τ returns a commutative torsor
- [n]:A→A evaluates to Kummer when n>0 is invertible.
- In characteristic p dividing n its kernel requires §1.1's fppf interface instead.
- Numerically a local fibre class 1∈ℤ/3 becomes 0 after twisting by 1 and becomes 2 after twisting by 2.

### 3.2 The rational-point partition

`mem_image_twist_iff`: under §3.1, x∈f^τ(Z^τ(k))↔eval(x)=τ. These possibly empty images partition X(k), indexed by H¹(k,G): a fibre has a section iff its class is zero. Source: Poonen Theorem 8.4.1 p.240.

**Checks.**

- A trivial group gives the identity partition
- a point of a nontrivial fibre does not lift untwisted.
- The example y²=(x²+1)(x⁴+1) is partitioned by c w²=x⁴+1 (§3.19).

### 3.3 Selmer sets of torsors

For global k, smooth affine G, torsor Z→X, `selmerSet={τ:∀v,τ_v∈eval(X(k_v))}`. API: membership, rational-point partition, base change, `finite_of_proper`, `uniformSplittingExtension`. Finiteness/uniform finite separable splitting require proper X and number-field k (§3.3b), or finite étale G over any global field (§3.3a); no connected function-field assertion. Split the finitely many viable torsors over one extension. Source: Poonen Definition 8.4.4/Theorem 8.4.6/Corollary 8.4.8 pp.241–242. *Needs:* §§3.1–4.

**Checks.**

- [n]:A→A gives Sel^n for invertible n>0.
- A trivial torsor over an everywhere locally soluble X gives Sha¹(k,G)
- if one local X is empty the set is empty.
- Squaring on nonproper G_m/ℚ gives all ℚ×/ℚ×², an infinite set.
- Section 3.19 has exactly c=1, 2.
- For an isogeny φ:A→B viewed as an A[φ]-torsor over B, the Selmer set is Sel^φ(A/k) of §1.3.

### 3.3a Finite torsors and bounded different

`proper_finiteEtaleTorsor_selmer_finite`: global k, proper X, finite étale F, including char k dividing rank F. Spread outside S; evaluated torsors are unramified there. Compact local evaluation (§3.4) bounds their differents at S. Bounded-discriminant Hermite gives finitely many degree-d étale algebras, each with finitely many F-actions (permutations of d geometric points).

Own `functionField_hermite_boundedDifferent`: for k=𝔽_q(C) with exact constants, degree≤d and bounded different bound genus/constants by Riemann–Hurwitz. Uniform Riemann–Roch gives dim L_E(f\*D)≥[E:k]degD−c; its intersection with proper M⊂E has dimension≤[M:k]degD+c′. There are ≤a bound from d! intermediate fields. For large fixed D their union is smaller than L_E(f\*D); a primitive z remains. Its minimal-polynomial coefficients lie in finite L_k(iD), i≤d. Thus finitely many polynomials/extensions/products. API: bounded-different Hermite, unramified evaluation, local-different bound, finite actions. Source: Poonen Theorem 8.4.6 pp.241–242; this Riemann–Roch adapter. *Needs:* §2.3a, 3.4; AGD R02.3 number-field Hermite; curve Riemann–Roch/Hurwitz; finite étale descent.

**Checks.**

- Artin–Schreier classes t^(−m), p∤m, over 𝔽_q(t) have unbounded different at one fixed place: a ramification-set bound alone fails.
- Proper evaluation supplies finitely many classes there.
- Constant extensions of degree e≤d enter the genus/dimension bounds.
- F=1 gives one class exactly when X has points everywhere.

### 3.3b Number-field connected finiteness and components

For number-field k, finite S, smooth connected affine H, `connectedShaOutside_finite`: ker(H¹(k,H)→∏_(v∉S)H¹(k_v,H)) is finite, for inner twists and finite extensions; twisting gives finite localization fibres. Remove the split unipotent radical by additive H¹, H². RG2 §RG2.1.5 gives 1→P→E→H→1 with P quasi-trivial, E_der simply connected. Its construction from H_sc×Z(H)⁰ with finite kernel F bounds the central obstruction's exponent by N=expF. Outside-S triviality supports it on S; Shapiro/local Brauer invariants make this N-torsion set finite.

Twist a nonempty obstruction fibre. It lifts to H¹(E^τ), still locally trivial outside S by local Hilbert 90. Its torus images form a finite set (finite local H¹ at S and torus Sha). Each remaining fibre comes from an inner simply connected derived group; AA §4.1's separate real realization/twisted Hasse identify H¹ with the finite product of real H¹, including exceptional groups.

For arbitrary smooth affine G-torsor over proper X, §3.3a bounds component classes in F=G/G⁰. Twist a viable G-class in each nonempty fibre. Nonabelian exactness reduces to H¹((G⁰)^τ); outside enlarged S, F(k_v) is integral and its boundary zero by Lang–Hensel. Hence the connected theorem applies despite component actions. API: finite localization fibres, twisted/bounded-exponent central obstruction, torus outside-S finiteness, component reduction, proper Selmer finiteness, uniform splitting. Source: Borel–Serre Theorem 7.1/§§7.2, 7.6–10 pp.158–162; z-extension adapter above. *Needs:* §§3.1, 3.3a, 3.8b's independent integral lemma; RG2 §§RG2.1.5, RG2.3.7; AGD torus H¹/Sha; CFT; AA §4.1.

**Checks.**

- H=G_m has zero kernel.
- Finite G reduces to §3.3a and can have nontrivial unramified H¹.
- Simply connected H over a totally imaginary field has H¹=1.
- N=1 gives zero obstruction
- for P=G_m, N=2, invariants (1/2,1/2) at two finite places satisfy reciprocity.
- Wound unipotent groups invalidate the additive reduction in positive characteristic
- no function-field connected assertion is made.

### 3.4 Finite local evaluation images

`finite_range_eval_local`: local k, proper X, finite étale F-torsor; H¹(k,F) itself is finite in char0. Krasner/smooth lifting makes evaluation locally constant; compact X(k) gives finite image. Source: Poonen Proposition 8.4.2/Remark 8.4.3 pp.240–241/Theorem 5.12.24(a). *Needs:* §§3.1, 2.11a; native Krasner and Hensel lemmas.

**Checks.**

- P¹ gives finite image
- nonproper G_m can have infinite Artin–Schreier evaluation in characteristic p.
- Compactness bounds the image even when the whole H¹ is infinite.

### 3.5 Descent obstruction sets

For separated finite-type X/number field define `descentSet f={x:∃τ,∀v,eval(x_v)=τ_v}`; §3.8b identifies it with ⋃_τ f^τ(Z^τ(𝔸)), using only Selmer twists. `descentObstructionSet` intersects over smooth affine torsors; `etaleSet/connectedSet/pglSet` restrict groups. API: union, diagonal, pullback, family monotonicity, proper closedness (§§3.3b,3.8b). Definitions extend through §2.3a to function fields; comparisons/closedness here are number-field results. Source: Poonen Definition 8.4.14/(8.4.13) pp.244–245.

**Checks.**

- A trivial torsor gives all adeles
- [n]:A→A tests local Kummer classes against Sel^n
- replacing H¹ by the Selmer set preserves the union.
- Nonempty descent set need not imply a rational point (§3.21).
- For a local fibre class 1∈ℤ/3, the matching twist is 1, not −1 (§3.1).

### 3.6 PGL descent and Brauer–Manin

Number field k, PGL_n-torsor f with Azumaya class b: `descentSet f=X(𝔸)^b`. Reciprocity patches local degree-n invariants to global n-torsion; period equals index over a global field (Poonen Theorem 1.5.36(iii)–(iv), p.26: a Grunwald–Wang cyclic extension with the required local degrees splits the class), giving a degree-n representative. Conversely global invariants sum zero. For regular quasi-projective X, §§2.6c–d represent every cohomological class, yielding `descent⊆PGL=Br`. Source: Poonen Lemma 8.5.2/Proposition 8.5.3 pp.245–246. *Needs:* §§2.6, 2.13, 3.5; PGL/Azumaya; CFT Layers 5 and 10; AGD R02.4.5b Grunwald–Wang.

**Checks.**

- n=1 gives the trivial class
- PGL₂ detects an obstructing quaternion algebra.
- Without the comparison hypothesis this proves the assertion only for Azumaya classes, not automatically all of H²_et(G_m)_tors.

### 3.7 The étale–Brauer set

For smooth quasi-projective geometrically integral X/number field, define `etaleBrauerSet=⋂_(finite étale F,f)⋃_τ f^τ(Z^τ(𝔸)^Br)`; `etaleDescentSet` replaces Br by descent. API: diagonal, pullback, `etaleDescent⊆etaleBrauer⊆Br`, equality with Br if X̄ simply connected. Then geometric covers split; a constant-fibre twist gives copies of X. Source: Poonen §8.5.2 pp.246–247. *Needs:* §§3.2, 3.5–6; finite étale π₁.

**Checks.**

- P^n has the full adelic set
- an empty adelic set remains empty
- Skorobogatov's bielliptic surface has empty étale–Brauer set and nonempty Br set.
- Nice X has equality with descent by §3.8.
- A trivial geometric fundamental group does not mean all arithmetic covers are trivial before twisting.
- Smooth complete intersections of dimension≥3 are geometrically simply connected (§2.25a), so their étale–Brauer set is their Brauer–Manin set.

### 3.8 Comparison and iteration

`etaleBrauer_eq_etaleDescent_eq_descent` for smooth projective geometrically integral X/number field; `descent_descent_eq_descent` for smooth quasi-projective geometrically integral X. Proper forward inclusion uses §§3.8a–b, 3.6; reverse/general iteration use §§3.8c–f: universal covers, corrected products, compatible actions, invariant-Brauer lifting/component neutrality. Source: Poonen Theorems 8.5.4–5/Corollary 8.5.6 pp.247–248; Cao 2020 Theorems 1.1–2 pp.2152–2153, corrected by 2023 Theorem 2.1/Corollary 2.2 pp.3–5. *Needs:* §§3.5–7, 3.8a–f.

**Checks.**

- Trivial torsors preserve the set
- the bielliptic obstruction can be witnessed by one noncommutative finite torsor.
- Proper finite-cover compactness alone does not prove quasi-projective iteration.

### 3.8a Domination over a finite cover

`finiteEtaleTorsor_domination`: finite étale F-torsor Y→X, smooth affine G-torsor Z→Y. Set H=Res_(F/k)(G×F), E=H⋊F, V=Res_(Y/X)(Z)×_X Y. Over Y the finite torsor trivialization makes V the product of translates of Z; the product torsor equation descends an E-torsor. Evaluation at 1 gives H→G, V→Z; V→Y is surjective. API: group/torsor, both maps, transported twisting. Source: Skorobogatov 2009 Proposition 2.3 pp.504–505. *Needs:* RG2 §§RG2.0a.1–RG2.0a.2, AM §§3.4–5 affine restriction; effective descent.

**Checks.**

- F=1 returns Z
- F=ℤ/2 gives (G×G)⋊ℤ/2 by exchange
- the identity point defines evaluation over k without choosing a geometric splitting.
- A nonaffine G exceeds the supplier.

### 3.8b Integral lifts and compact finite-cover descent

`torsor_adelicLift_of_localLifts`: smooth affine torsors/number field lift an adele iff locally everywhere. Spread with smooth connected identity and finite étale component quotient outside S. Its generic section extends integrally by properness; Lang–Hensel splits the remaining connected torsor. Thus almost all lifts are integral even for nonproper X. Twisting a fibre and smooth local lifting show evaluation locally constant; lifting images are closed, and this integral lemma identifies the adelic image.

For proper X, §3.3b gives finitely many viable closed twist images. Own `proper_finiteCover_descent_iteration`: for finite étale f:Y→X,
`X(𝔸)^descent=⋃_τ f^τ(Y^τ(𝔸)^descent).`
Select among the finitely many twists one surviving every surjective domination; otherwise multiply one failing domination per twist. Above fixed x the finite local fibres have compact product. If no lift survives, a finite subcover by complements of closed descent images gives finitely many Y-torsors; their product and §3.8a contradict selection. Pullback gives the converse. API: integral lifts, closed/proper descent images, compatible twist, iteration. Source: Skorobogatov Lemma 2.2/Proposition 2.4/Corollaries 2.5–7/Theorem 1.1 proof pp.503–507. *Needs:* §§3.3b, 3.8a, 2.11a; RG2 §RG2.3.7 Lang/smooth torsors; components/Hensel. Integral lifting is independent of §3.3b.

**Checks.**

- Unrelated local lifts do not alone establish an adele
- the identity cover gives equality.
- An infinite union need not be closed.
- Fibre compactness uses a finite cover, not an arbitrary affine torsor.

### 3.8c Extended types and universal finite abelian covers

Smooth geometrically integral X/char0: `KDprime X=cone(G_m→τ≤1Rp_*G_m)[1]`, with H⁻¹=units/constants, H⁰=Pic X̄. For multiplicative-type S, characters M,
`H¹(k,S)→H¹(X,S)→Hom_D(M,KD′X)→H²(k,S)→H²(X,S).`
Derived Hom of the triangle proves exactness: free M reduces to G_m powers; torsion uses a two-term free resolution and sheafwise power surjectivity. API: extended type, boundary, existence, twist invariance, pullback, constant-units comparison.

For n≥2, a `UniversalNTorsor X n` means an S_X-torsor of Kummer-cone type M_X=H¹(X̄,μ_n)→KD′X and finite character group M_X (char0 spreading/CW comparison). API: unique constant twist, point-normalized uniqueness, π₁(X̄)^ab/n≅S_X(k̄), universal pushout to finite commutative n-killed groups. Kummer and torsion-free units/constants prove pushout. A k-point splits π₁ and supplies such a torsor. More generally X(𝔸)^Br₁≠∅ kills the existence obstruction by §3.9c and finite duality. No unconditional existence is asserted. Source: Harari–Skorobogatov *Open varieties* Propositions 1.1, 1.3 pp.3–6/Theorem 3.5/Corollary 3.6 pp.17–19; Cao 2020 Definition 2.1/Proposition 2.2 pp.2156–2157. *Needs:* Kummer/derived adjunction/HS; §3.9c; AGD; finite comparison/CW.

**Checks.**

- Proper X has zero units term
- G_m has Pic=0 but nontrivial t↦t^n, so dropping that term fails.
- A k-point makes the normalized fibre trivial, unlike arbitrary twists.
- P¹ over k̄ has S_X=1.

### 3.8d Corrected degree-two products

For separably closed char0 k, geometrically integral U, V, n≥2, finite ℤ/n-module S,
`H¹(U×V,S)=H¹(U,S)⊕H¹(V,S),`
`H²(U×V,S)=H²(U,S)⊕H²(V,S)⊕Hom(S_U⊗_(ℤ/n)S_V,S).`
The mixed map pushes out the universal-torsor cup; factor pullback also injects in degree three. Points split factors; Leray/base change identifies the remainder H¹(U,H¹(V,S)). Prime-field Künneth identifies the cup; induct on |S| through coefficient sequences using degree-one splitting/degree-three factor injectivity. No arbitrary ℤ/n-flatness.

For general char0 k, u∈U(k), universal n-torsors on both factors,
H²_u(U,S)⊕H²(V,S)⊕Hom_k(S_U⊗S_V,S)≅H²(U×V,S).
The cone of (p₁\*+p₂*,u\*+0) into RΓ(Ū×V̄,S)⊕S vanishes below two with mixed H². Galois hypercohomology gives exactness; universal cup splits. API: coefficients, projections, normalization, Galois action, mixed cup. Source: Cao corrigendum Theorem 2.1/Corollary 2.2 pp.3–5. *Needs:* §3.8c; ECF §§F.2.2, F.2.6; Leray/cones/coefficient sequences.

**Checks.**

- A point factor has no mixed part
- G_m×G_m has a nonzero geometric symbol.
- Composite n retains Hom, with no unjustified tensor-of-H¹ replacement.
- Constants occur once in the V term
- using unnormalized H²(U,S) duplicates them.

### 3.8e Compatible covers and invariant Brauer classes

For connected linear G acting on smooth geometrically integral X in characteristic zero, `CompatibleFiniteTorsor` means a lifted G-action on the finite étale torsor Y→X. It is unique and commutes with its finite group. On π₁ the orbit map gives θ:π₁(Ḡ)→F(k̄); compatibility is θ=0. Product π₁ and the two loop multiplications make its image abelian and central in the monodromy. Its Galois-stable kernel defines a pointed central isogeny H_Y→G; multiplication/inverse lift uniquely, descend, and act on Y. API: unique action, `minimalCompatibleIsogeny`, factorization of every compatible connected isogeny, and twist invariance. **Checks.**

- trivial action lifts
- t↦t^n on G_m needs the n-power isogeny
- a fixed cover has a finite isogeny, with no one finite isogeny asserted for all covers.

Define `invariantBrauer G X={b:ρ*b−p₂*b∈p₁*Br G}` and Br_eG=ker(e*:Br₁G→Br k). Own `groupUnitsPic_product`: units modulo constants split on Ḡ×X̄, Pic splits, and the normalized HS edge gives Br_a(G×X)=Br_aG⊕Br_aX. For units use Rosenlicht (restrict to fibres, ratios are characters, discrete characters are constant on connected X). For Pic remove the Bruhat-cell boundary of G: on its torus×affine cell use the Laurent polynomial Pic formula for regular X; boundary divisors generate Pic G, and the identity section splits Pic X. The localization relation identifies their kernel, giving the product. Descend this units/Pic complex through HS, using e for normalization. Own `invariantResidue_zero`: an invariant geometric class on a split torus has boundary residue an equivariant finite abelian cover of each coordinate divisor; translation's connected stabilizer makes it trivial. Purity extends to affine space, whose Br is zero. For reductive G restrict to its Bruhat cell (Brauer restriction injects); for general G use the split unipotent radical and affine-bundle invariance. Hence Br_G(G)=Br₁G. Orbit pullback makes the normalized G-term of an invariant b algebraic, and the product adapter makes p₁*:Br_eG→Br(G×X) injective. Define λ uniquely by ρ\*b−p₂\*b=p₁\*λ(b).

API: subgroup/pullback, normalized Sansuc exactness ker λ=p\*Br X for a G-torsor, `eval_b(gx)=eval_b(x)+eval_λ(b)(g)`, and inner-twist compatibility. Descent of units/Pic on the torsor Čech nerve proves exactness. For a universal n-torsor T_X→X, own `pullbackBrauer_invariant`: f\*Br(X)[n]⊆Br_(H_T)(T_X). Lift to μ_n, use §3.8d, and pull back the action difference: its universal mixed cup vanishes since the universal torsor becomes trivial on itself. **Checks.**

- G=1 gives all Br X
- G_m² can have nonzero geometric Brauer, so invariance is essential in the residue step
- translating t in a cyclic class (χ,t) adds (χ,g).
- One chosen n-cover controls n-torsion, not the entire Brauer group.

Sources: Cao 2018 Lemma 3.6, Propositions 3.7, 3.9, Theorem 3.10 pp.15–18; Cao 2020 Propositions 3.1–4, Theorem 3.11, Proposition 3.12 pp.2162–2168 and §4 pp.2168–2170. *Needs:* §§2.16b, 3.8c–d; ECF §F.0.2 étale fundamental groupoid; RG structure/Bruhat/central isogenies; scheme divisor localization, Laurent Pic, Kummer and HS. The units/Pic and residue adapters are owned here.

### 3.8f Arithmetic lifting and component neutrality

All fields in this subsection are number fields or their completions; all groups are linear and connected until the final component step. The following named adapters close the arithmetic inputs to §3.8.

`fundamentalTorus_H2_zero`: a nonarchimedean semisimple group has an anisotropic maximal torus; a real simply connected semisimple group has a fundamental maximal torus with H²=0. Own `ellipticWeyl_action_realizable`: for a quasi-split simply connected group, a finite Galois action in W⋊Out lifting its diagram action is realized on a maximal torus. Twist the split torus, take a rational regular point in its dense regular open, and use rational realization of its stable semisimple conjugacy class; its regular centralizer realizes the action. For quasi-split groups without even A-components, ordered simple-root coordinates give the descended section. For even A-components use Steinberg’s two strata N″ and N‴: replace the adjacent middle-root factors by their sum-root subgroup and a torus factor; the fundamental-character recursions identify their images with f=0 and f≠0. Semisimplification gives a rational representative on either stratum. No global regular section for outer even A is asserted (Steinberg Theorems 1.4,1.7 pp.282–283, §§9.4–9.19 pp.304–309). For an inner form, H² of the anisotropic torus is zero by Tate–Nakayama; its central boundary therefore lifts every central obstruction. AA.4.1's twisted local H¹=1 then transfers that torus to the inner form (Kneser II Lemmas 6.1–6.4 pp.255–256).

The finite root calculation chooses a fixed-point-free action: −1 for ²A, B, C, ¹D_even, ²D_odd, ²E₆, E₇, E₈, F₄, G₂; a Coxeter cycle of order n+1 for ¹A_n; the order-four signed cycle for ¹D_odd; and the E₆ and triality actions of Kneser (9.3), (8.3). For ²D_even take an unramified quadratic extension of its diagram quadratic field: in the cyclic case act by e₁↦e₂, e₂↦−e₁, e_i↦−e_i for i≥3; in the biquadratic case use −1 on the quadratic subgroup and a single sign change outside it. In each case invariants vanish. Kneser II §15 p.271 supplies these cases; §§8–9 pp.261–264 supply the exceptional matrices. Restriction of scalars and central isogenies give all semisimple groups.

Over ℝ transfer a fundamental torus to the quasi-split form. If T₀ is a Borel torus and w₀ the longest Weyl element, twisting its conjugation σ by w₀ gives a torus with no real roots. The operator −w₀σ permutes the simple-coroot basis. Thus its integral cocharacter module has only sign and exchanged-pair blocks; T is a product of norm-one circles and Res_(ℂ/ℝ)G_m, both with H²=0. This uses simple connectedness; it is Kottwitz 1986 Lemmas 10.2–10.4 pp.397–398, and Borovoi 1989 Proposition 5.3.2/Lemma 5.3.3 p.63. API: realized elliptic action, torus embedding, anisotropy, real block decomposition and H² vanishing.

`maximalTorus_prescribedLocal` and `centralBoundary_surjective`: prescribe finitely many local maximal tori by choosing nearby regular semisimple Lie-algebra elements, use field weak approximation and local étale stability of their centralizers. Choose fundamental tori at every support place of a class z∈H²(k,Z(G_sc)), all real places, and one additional finite place. The resulting T_sc has local H² zero on that set and Sha²(T_sc)=0: For a splitting group Γ and cocharacter lattice X, class-formation duality identifies the H² localization kernel with coker(Σ_v Ĥ^(−1)(D_v,X)→Ĥ^(−1)(Γ,X)). At the anisotropic place X^(D_v)=0, so N_(D_v)=0 and also N_Γ=0; the map X/I_(D_v)X→X/I_ΓX is onto. Hence the cokernel is zero. Thus z maps to zero in H²(k,T_sc). The sequence Z(G_sc)→T_sc→T_sc/Z gives a class in H¹(k,T_sc/Z) mapping to z and then in H¹(k,G_ad). This proves central-boundary surjectivity globally and locally, not merely an H¹ Hasse principle. Sources: Borovoi 1989 Lemmas 5.6.2–5 pp.65–67; Borovoi 1991 Lemma 5.7 pp.10–11; Kneser, Ch.3 §3.3 Theorem 7 (retyped pp.43–44), and Ch.5 §5.2 pp.63–65. API includes twisting and finite-extension compatibility.

`abelianization_realFibreProduct`: for C_G=[T_sc→T] in degrees −1, 0, identify H¹(k,G) with H¹(k,C_G)×_(∏real H¹(k_v,C_G))∏real H¹(k_v,G). Construct surjectivity using the preceding maximal torus with Sha²=0 to lift a complex class, and real H¹ realization; injectivity reduces through a z-extension to simply connected derived group, then uses torus approximation at real places and the twisted simply connected Hasse theorem. Local nonarchimedean ab¹ is bijective and real ab¹ is surjective. Consequently Sha¹(G)=Sha¹(C_G). For adjoint G this last group is zero: dual finite centre characters have trivial cyclically detected Sha¹. On each absolute Dynkin component the outer action is cyclic except D₄'s subgroup of S₃; for D₄ its centre characters are 𝔽₂², and H¹(S₃,𝔽₂²)=0 by the normal C₃ subgroup. Cyclic actions are detected on cyclic decomposition groups by Chebotarev; Shapiro handles permuted components. Finite-module duality gives Sha² of the centre zero. API: local abelianization, real fibre product and `adjointSha_trivial`. Source: Borovoi 1989 Theorems 5.4, 5.7, 5.12–13 pp.63–76. *Needs:* AA.4.1's realization and Hasse, RG2.1.5 z-extensions/root data, AGD finite modules/tori and Chebotarev.

`coflasqueEnlargement`: for a finitely generated abelian Γ-module M with finite Galois splitting group Γ, choose a permutation lattice P→M surjective on H-invariants for every subgroup H: add ℤ[Γ/H] for generators of M^H. Its kernel N is free and H¹(H,N)=0 by the invariant exact sequence and H¹(H,P)=0. Dualize to embed the multiplicative-type centre S into a quasi-trivial T₀ with coflasque quotient T. Put H=G×^S T₀. Hilbert 90 and adjointSha_trivial give Sha¹(H)=1. Arithmetic high-degree localization gives H³(k,N)=∏real H³(k_v,N)=∏real H¹(k_v,N)=0. The units/Pic exact diagram then gives Br_aH↠Br_aG (not a claim that each whole Brauer group vanishes). API: invariant-surjective lattice resolution, central enlargement, Sha vanishing, character H³ vanishing, Brauer surjection. Source: Cao 2018 Lemmas 5.4–5/Proposition 5.6 pp.24–25.

`connectedDegreeZero_PT`: P⁰(k,G)→Br_a(G)^D→Sha¹(k,G) is exact; in particular Sha¹=1 makes evaluation surjective. Identify the extended units/Pic complex with [T̂→T̂_sc] using the Bruhat-boundary divisor calculation of §3.8e. Resolve C_G by tori and apply their Poitou–Tate sequences; local ab⁰ is surjective nonarchimedean by H¹(G_sc)=1. At real places retain its actual image, whose cokernel injects into H¹(ℝ,G_sc). The real fibre-product theorem above cancels precisely these cokernels. This yields the displayed three terms with the evaluation map, by the normalized units/Pic cup diagram. No real ab⁰ surjectivity is asserted. For the enlargement also own `torusQuotient_BrauerLift`: T(𝔸)^Br₁=T(k)·φ(H(𝔸)^Br₁). The torus approximation sequence first gives closure of the rational image; φ's adelic image on Brauer kernels is closed. Prove closedness with Lang–Hensel integral lifts, the open-mapping lemma and finite Sha of the kernel (§3.3b); real identity components lift by the implicit-function theorem. Thus closure is removed. Sources: Demarche Theorem 5.1 pp.29–33, Lemmas 3.11–13 pp.14–18; Cao–Demarche–Xu v4 Proposition 3.3 pp.7–8 (the quotient torus has no semisimple factors). *Needs:* §§3.8e, 3.9b; AGD R02.4.6 torus duality and D7.5 compact support (the two-term form is the adapter of this paragraph), AA.4.1 and §3.3b.

`invariantBrauer_lifting`: for a G-torsor Y→X with X smooth geometrically integral,
`X(𝔸)^Br=⋃_τ p^τ((Y^τ)(𝔸)^Br_(Gτ)).`
If Sha¹(G)=1, the normalized Sansuc sequence and connectedDegreeZero_PT cancel the evaluation functional of an adelic lift: extend its character from the image subgroup using injectivity of ℚ/ℤ, realize it by g∈G(𝔸), then translate by g^(−1). For general reductive G induce to the preceding H-torsor; the Brauer surjection controls invariant classes on its T-fibres. torusQuotient_BrauerLift moves the coordinate to T(k), whose boundary is a Sha¹(G) twist. Twist transport and the normalized action formula preserve orthogonality. Split unipotent radicals are removed by additive H¹, H² vanishing. This is Cao 2018 Lemmas 5.1, 5.8/Theorem 5.9 pp.23–27; §3.8e supplies the exact Sansuc interface.

`nonabelianH2_neutralCriterion`: a k-link class consists of semilinear f_σ and u_(σ,τ) with f_σf_τ=Int(u_(σ,τ))f_(στ) and the associativity identity. It is neutral iff a cochain change makes u=1. Reductive abelianization lies in H²(k,[Z(G_sc)→Z(G)]) in degrees −1, 0. The pinned diagram action gives a quasi-split neutral form of the link. Comparison with it differs by a central H² class; when the abelianized difference is zero it comes from H²(Z(G_sc)), and centralBoundary_surjective neutralizes it by an adjoint torsor. The degree-two complex is determined by its torus quotient and its real restrictions: apply finite-module H³ localization to its centre kernel and real Tate complexes. Therefore vanishing toric obstruction plus local neutrality implies global neutrality. Remove a unipotent radical by its additive central filtration. API: representative/cochain equivalence, abelianization, toric map, local compatibility and neutrality criterion. Sources: Borovoi 1991 §§1–2 pp.3–6, Proposition 4.1 pp.8–9, Theorem 5.6/Lemma 5.7 pp.10–11, Proposition 6.5 pp.12–13. Apply this to the component gerbe, then compatible finite covers and invariantBrauer_lifting: Cao 2020 Proposition 5.5 pp.2173–2176, Proposition 5.7(1) pp.2176–2177 and Theorem 1.4 pp.2154–2155. Section 3.8d supplies its corrected product calculation.

**Checks.**

- For SL₂/ℝ the compact torus has H²=0, whereas split G_m has H²=ℤ/2
- fundamental cannot be dropped.
- For a centre-free group the central-boundary target is zero
- for SL₂ it includes all quaternion Brauer classes through PGL₂.
- A trivial centre module has permutation resolution N=0
- the trivial group gives zero C_G and zero Brauer functional.
- For D₄ the S₃ action must retain its two-dimensional centre module.
- Hamilton quaternion units have positive real reduced norm, so real ab⁰ is not always onto.
- For G a torus the degree-two complex reduces to its ordinary H²
- for split unipotent groups it vanishes, with no positive-characteristic wound analogue.
- A neutral class can have u≠1 before changing cochains.
- Invariant lifting retains p\*Br X, so every image is Br-orthogonal.

### 3.9 Universal torsors

Smooth geometrically integral X/k, constant geometric units, finite free Pic X̄: T̂=Pic X̄; `UniversalTorsor` is a T-torsor of identity type. Type pushes a character to its bundle, using nonzero-vector scalar convention. API: pushout/pullback, existence↔δ(id)=0, existence from a point, H¹(k,T) twists, point-normalized uniqueness. Source: Harpaz–Wittenberg *Zero-cycles* §2 p.8/§§6–7 pp.20–27; Harari–Skorobogatov 2002 §3.3 pp.253–254. *Needs:* §§3.1, 3.9a; AM Picard representability; scheme torsors.

**Checks.**

- On P^n the punctured affine-space cover with inverse scalar action has type O(1)
- ordinary scalar action has type O(−1).
- Pic=0 gives T=1 and torsor X.
- A pointless conic has a rational Picard class of degree one without a descended line bundle: its boundary is the nonzero quaternion class.
- O(2) on P¹ has type 2 and is not universal.

### 3.9a Type exactness and boundary cocycles

Under §3.9's units hypothesis, for torus T with lattice M,
`0→H¹(k,T)→H¹(X,T)→Hom_k(M,Pic X̄)→H²(k,T)→H²(X,T).`
Basis-independent/Galois-equivariant split-torus H⁰=T(k̄), H¹=Hom(M,Pic) and HS give it. Basis bundle descent maps fail cocycle by constants; evaluation on characters forms a T-valued two-cocycle. Choices change coboundaries; trivializing it descends the torsor. API: type/pushout, boundary/cocycle, exactness, same-type unique twist, point kills boundary by splitting H². Source: Harari–Skorobogatov 2002 (10)–(11)/Proposition 3.7 pp.253–254/Appendix B pp.270–271. *Needs:* torsor descent, HS, §3.1.

**Checks.**

- On P¹ type +1 uses O(1), type −1 O(−1), their sum zero.
- On a pointless conic δ(1) is quaternion and δ(2)=0.
- For G_m the units hypothesis fails
- basis change preserves δ.
- The punctured affine-space cover uses inverse scalar action for +1 (§3.9).

### 3.9b Degree-two torus duality

Number-field torus T, lattice M: own finite perfect Sha²(T)×Sha¹(M)→ℚ/ℤ and
`H¹(k,T)→P¹(k,T)→H¹(k,M)^D,`
the last map ξ↦(a↦Σinv(ξ_v∪a_v)); P¹ uses integral/unramified groups and real Tate terms. Opposite-degree duality is imported. Apply Ext(M,−) to the S-idele class sequence, S=all places. Free M identifies global H^i(T); Shapiro gives P¹(T), ⊕H²(k_v,T); class formations give H¹(M)^D, H⁰(M)^D. Cone duality identifies the two localization kernels. H¹(k,M) is finite: inflation reduces to finite splitting-group cohomology, finitely generated and killed by group order; profinite→free continuous homomorphisms vanish. API: pairing/perfectness, localization/exactness, trace, transfer. Source: Milne ADT I Lemma 4.13 pp.59–60/Theorem 4.20(a–b) pp.65–66. *Needs:* AGD R02.3–4, D7.5; CFT; Ext/Shapiro.

**Checks.**

- T=G_m has Sha²=0 and H¹(k,ℤ)=0.
- The lifting test uses all H¹(k,M), not Sha²(k,M).
- Real nonsplit tori retain their two-primary terms
- the complete complex alternates 1−c, 1+c.
- Infinite-rank modules are excluded.

### 3.9c Compact trace of the type obstruction

For §3.9a over a number field, X(𝔸)≠∅, δ(λ)∈Sha²(T). For a∈Sha¹(M), λ_\*a has Brauer representative b, locally constant modulo Br k_v, with
⟨δ(λ),a⟩=Σinv b(x_v).
Thus Br₁-orthogonality kills δ. Use G_m→τ≤1Rp_\*G_m→Pic X̄[−1]; points split local H². Spread to arithmetic U, lift a to compact support, compose δ into H³_c(U,G_m). In the localization cone a global b and its local constants have boundary their tuple modulo Br k; trace is its invariant sum. Different lifts pair with the locally zero boundary. Use real complete Tate complexes.

`extendedType_compactTrace` retains KD′/units and resolves finite multiplicative-type characters by two-term permutation/free modules. Derived Hom gives the same diagram; finite PT treats torsion, torus duality free terms. The locally trivial H²(S) obstruction is identified with its dual annihilator, so Br₁ kills it without constant units. API: local triviality, Brauer representative/constancy, trace identity, boundary vanishing, resolution independence. Source: Harari–Skorobogatov *Open varieties* Theorem 3.5/Corollary 3.6 pp.17–19; Harari–Szamuely *1-motives* Lemma 3.1/Proposition 3.3 pp.537–541. *Needs:* §§2.16, 3.9a–b; §3.8c's triangle only, not its existence conclusion; AGD D7.5/finite duality.

**Checks.**

- A rational point kills δ before duality.
- A pointless conic need not have local points everywhere.
- Split T has Sha²=0
- existence tests Sha¹(M), while lifting through an existing torsor tests all H¹(M).
- G_m's nonconstant units are retained in the extended calculation.

### 3.10 Lifting through torus torsors

Smooth geometrically integral X/number field, T-torsor Y: an adele orthogonal to a∪[Y] for all a∈H¹(k,T̂) lifts to a twist. Fibre classes lie in P¹(T); §3.9b globalizes their locally cup-orthogonal tuple; §3.8b gives integral lifts. For proper X, constant units, finite free Pic, §3.9c supplies a universal torsor whose identity type exhausts H¹(k,Pic X̄) in Br₁/Br₀. Thus `BrOneSet_eq_universalTorsorUnion`; reciprocity gives the converse. Source: Harari–Skorobogatov *Open varieties* Proposition 3.1 p.14; Harpaz–Wittenberg *Zero-cycles* Proposition 2.5 p.10. *Needs:* §§2.13, 2.16, 3.8b, 3.9a–c.

**Checks.**

- P^n gives all adeles
- T=1 gives the identity lifting statement.
- A type's H² existence obstruction is distinct from this H¹ localization obstruction.

### 3.11 Relative algebraic Brauer groups

`relativeBrauerOne f` consists of b∈Br Y with b̄∈im Br X̄. For a torus torsor between smooth geometrically integral char0 varieties,
Br X→Br₁(Y/X)→^φH²(k,T̂)→^δH³(X,G_m).
Units/Pic Leray and HS give exactness; φ kills pullbacks. Geometrically Y is birational to X×G_m^r, so proper-model/P¹ invariance gives Br_nrY⊂Br₁(Y/X). API: subgroup, pullback, edge/exactness, unramified inclusion. Source: Harpaz–Wittenberg *Zero-cycles* (2.4) p.9. *Needs:* §§2.16–17, 3.1, 3.8e; Leray/HS.

**Checks.**

- Pullbacks have φ=0
- on X×G_m, (χ,t) maps to χ∈H²(k,ℤ)=H¹(k,ℚ/ℤ).
- The final target is H³(X,G_m), which need not vanish when H³(k,G_m)=0
- membership is an image condition, not a quotient identity.

### 3.12 Twisting relative edges

Under §3.11, twisting by σ preserves δ and φ_σ(Br_nrY^σ) when H³(k,G_m)=0; the pullback preimage of Br_nr is twist-independent without it. For b∈Br₁(Y^σ/X), y∈Y^σ(L), t∈T(L), b(ty)−b(y)=φ_σ(b)∪t. A field torsor Z has Br₁Z=H²(k,k̄[Z]×), surjecting to H²(k,T̂) under that H³ hypothesis. Leray changes δ by a cup through H³(k,G_m); compare proper birational models for Br_nr. Fibre units extensions prove translation. Source: Harpaz–Wittenberg *Zero-cycles* Proposition 2.3/Lemma 2.4 pp.9–10. *Needs:* §3.11; HS, §2.17a; `numberField_h3_units_zero` (§2.16) for number fields.

**Checks.**

- For G_m, translating a symbol (χ,z) by t adds (χ,t)
- for t=1 it adds zero.
- Over a number field the H³ hypothesis holds
- over an arbitrary field it must be retained in the first two claims.

### 3.13 The residual Sha functional

Number field, A=(f*)⁻¹Br_nrY, D=Sha²(T̂)∩φ(Br_nrY), x∈X(𝔸)^A with adelic lift: define `residualShaFunctional τ a=Σinv b_τ(y_v^τ)` for τ∈Sha¹(T), φ_τ(b_τ)=a. Section 3.12 identifies D across twists. Choices differ by A-pullbacks or cups with locally zero a, hence give zero. API: domain, choice independence, additivity, variation
`ε_τ(a)=ε₀(a)+⟨a,τ⟩.`
Inverse twisting has τ=−σ in the cited convention. Source: Harpaz–Wittenberg *Zero-cycles* Proposition 2.6 pp.10–11. *Needs:* §§3.10–12; AGD R02.4 perfect Sha²(T̂)×Sha¹(T).

**Checks.**

- Split T gives D=0
- adding f\*β with β∈A changes the sum by zero
- ε is undefined outside the edge image.
- In ℚ/ℤ, ε₀=1/3 and ⟨a,τ⟩=2/3 give ε_τ=0
- using a minus sign gives 2/3.

### 3.14 Unramified torus descent

Smooth geometrically integral X/number field, T-torsor Y, A=(f*)⁻¹Br_nrY:
`X(𝔸)^A⊆⋃_τ f^τ((Y^τ)(𝔸)^Br_nr).`
For proper X, A=Br X. Torsor cups die on Y, so §3.10 lifts x. Perfect Sha duality/§3.13 cancel ε on D. Extend the remaining edge-image functional to H²(k,T̂) using injectivity of ℚ/ℤ; adelic torus duality realizes it by t. Translation by t⁻¹ cancels via §3.12. Source: Harpaz–Wittenberg *Zero-cycles* Theorem 2.1/Propositions 2.5–7 pp.8–11. *Needs:* §§3.10–13, 2.18; AGD R02.4.6 torus duality and its P⁰(T) sequence.

**Checks.**

- T=1 is identity
- no rational connectedness is required.
- The inverse translation cancels a value u by −u
- translating in the same direction would double u.

### 3.15 Torus torsors on a dense open

Smooth proper geometrically rationally connected X/number field, dense V, T-torsor W→V:
`X(𝔸)^Br⊆closure(⋃_τ f^τ((W^τ)(𝔸)^Br_nr)).`
Own `torusCompactification_boundaryFinite`: A=(f*)⁻¹Br_nrW has finite A/(A∩Br X). Use the field-general equivariant compactification constructed below. Above each boundary divisor a multiplicity-one component has finite constant extension; residue pullback is restriction. Its kernel consists of characters factoring through that finite extension, hence is finite. Finitely many divisors and purity give the bound. Section 2.20a bounds Br X/Br₀; formal lemma gives V(𝔸)^A density; apply §3.14. Source: Harpaz–Wittenberg *Zero-cycles* Corollary 2.2 p.8; CT–Skorobogatov, *Descent on fibrations over P¹ revisited* (2000), Proposition 1.1/Lemma 3.1. *Needs:* §§2.16b, 2.20a–21, 3.14; compactification/flatness; ReductiveGroups characters; AnalyticToricGeometry fan combinatorics and complex specialization; the field-general construction and descent below.

**Checks.**

- V=A^n⊂P^n with trivial torus torsor gives density of the affine open.
- G_m^n→A^n is not a torsor.
- The conclusion is a closure statement, not pointwise surjectivity from V.

Own `galoisStableSmoothProjectiveFan_exists`: for a finite group acting on a finite free lattice N, construct a finite complete regular rational fan in N⊗ℝ preserved by the group, together with an invariant strictly convex integral support function. In the dual lattice M=N∨, take the convex hull of the group orbit of a spanning set and its negatives; its normal fan lies in N⊗ℝ and is complete and projective. Own the finite equivariant regular subdivision construction: first use a projective barycentric refinement, then subdivisions along group orbits of cones with decreasing lattice multiplicities. Prove termination, preservation of the entire support, and projectivity at each step. Rational support functions are made integral by clearing denominators; summing their group translates preserves strict convexity. API: invariant normal fan, equivariant subdivision, multiplicity decrease, completeness and integral support functions. Source: Colliot-Thélène–Harari–Skorobogatov, *Compactification équivariante d'un tore*, Theorem 1/Proposition 1 pp.1–2, Propositions 2–3 and Lemma 8 pp.4–10; Corollary 1 p.3. *Needs:* AnalyticToricGeometry Layer 0 fan/subdivision vocabulary; native finite lattices and rational polyhedral cones. The equivariant subdivision and support-function existence are targets here.

**Checks.**

- In rank zero the fan consists of the zero cone, covers the zero vector space and gives a point.
- For the sign action on ℤ the two rays and zero form an invariant complete regular fan, with support function |x| under the convex convention.
- On ℤ² the order-three action e₁↦e₂, e₂↦−e₁−e₂ does not preserve the coordinate orthant fan. The six rays ±e₁, ±e₂, ±(e₁+e₂), with consecutive two-dimensional cones, give an invariant complete regular projective fan.

Own `torusCompactification_splitField` and `torusCompactification_galoisDescent`: for a torus T/K over a number field and a finite Galois splitting field L/K, use `galoisStableSmoothProjectiveFan_exists` for its cocharacter lattice. Construct the L-charts from L-valued monoid algebras and glue their face localizations. Prove the torus action, smoothness, projectivity/properness and the multiplicity-one boundary description. The lattice action and scalar Galois action induce compatible semilinear maps on charts, satisfying the descent cocycle and preserving the boundary. Choose a torus-linearized ample bundle from the strictly convex integral support function and tensor its Galois conjugates. The resulting ample bundle has coherent torus and Galois linearizations; effective polarized descent then descends the projective compactification, action and boundary. For W→V use the torus linearization to descend the associated compactification along an étale trivializing cover of the torsor. API: split charts, face maps, boundary multiplicities, semilinear cocycle, descended action and compatibility with splitting-field extension. Sources: Harpaz–Wittenberg *Zero-cycles* Corollary 2.2 proof p.8; CT–Skorobogatov, *Descent on fibrations over P¹ revisited* (2000), Proposition 1.1/Lemma 3.1; AnalyticToricGeometry Layer 0 for the monoid-algebra charts and fan gluing, extended over L here. *Needs:* `galoisStableSmoothProjectiveFan_exists`; AnalyticToricGeometry finite regular rational fans and face semigroups; SF §1.24 affine semilinear Galois descent; StableReduction Layer 2 effective descent with a relatively ample invertible sheaf; SF scheme gluing and descent of closed subschemes. The algebraic charts over L and the polarized descent adapter are targets here.

**Checks.**

- For split G_m/K the two-ray fan gives P¹_K, with reduced boundary {0,∞}, each of multiplicity one.
- For the norm-one torus of a quadratic L/K, Galois negates the cocharacter lattice and exchanges the two boundary points; their descended boundary is a degree-two closed subscheme.
- Taking L=K gives the split compactification and identity descent; extending a splitting field commutes with the chart and boundary constructions.

### 3.16 Universal torsors from Brauer points

Smooth proper geometrically rationally connected X/number field: `exists_universalTorsor_of_brauerManin`, X(𝔸)^Br≠∅⇒a universal torsor exists. Section 2.20a gives constant units/finite free Pic; §3.9c kills identity-type obstruction. More generally Br₁ kills every torus type obstruction under §3.9a's units hypothesis. Source: Harpaz–Wittenberg *Zero-cycles* Theorems 6.1, 6.6/Proposition 7.8 proofs pp.20–27. *Needs:* §§2.20a, 3.9a–c.

**Checks.**

- A rational point already suffices
- Pic=0 gives the identity torsor
- no effective construction of a rational point follows from existence of this torsor.

### 3.17 Marked genus-one torsors

`genusOne_torsor_equiv_weilChatelet`: smooth projective genus-one curves with Pic⁰≅E and E-equivariant isomorphisms correspond to EC Layer 7 H¹(k,E). Use C≅Pic¹C with its Pic⁰ action; class=0 iff C(k)≠∅. Number-field local solubility means Sha membership. Unmarked curves require Aut(E) orbits; EC 5 pointed twists use H¹(Aut(E,O)) and have points. Source: Poonen Example 5.12.12/Proposition 5.12.14 pp.153–155. *Needs:* genus-one Picard/torsors, §3.1, EC 5, 7.

**Checks.**

- 2w²=x⁴+1 has (1,1), so is the trivial torsor
- a pointless genus-one curve is nonzero H¹(E)
- forgetting its marking can identify different H¹(E) classes.

### 3.17a Abelian local conditions and Cassels–Tate

For a number-field abelian variety A use SelmerIwasawaCohomology §2.12a's abelian Sha carriers and all-place Kummer conditions, and §4.29's canonical `CasselsTate : Sha(A)×Sha(A∨)→ℚ/ℤ`. Its finite-coefficient formula, bilinearity, isogeny adjointness and real Tate terms are supplied without finite Sha or a polarization.

Realize this pairing by torsors and algebraically trivial divisors. For an A-torsor X representing a∈Sha(A), take Q=k^s(X)×/(k^s)× and algebraically trivial divisors (not numerical degree-zero divisors in higher dimension). Their two exact sequences send β∈Sha(A∨) to H²(k,Q); H³(k,G_m)=0 lifts it to H²(k,k^s(X)×). Locally β=0 makes this a constant Br k_v class, uniquely since a local point injects constants into Br k_v(X). Prove that the sum of invariants equals the supplied CasselsTate(a,β). Global lift changes add Br k, whose sum is zero; divisor changes give coboundaries; spreading gives finite support.

Own `CasselsTate.biextension_comparison`: the torsor/divisor realization and the Poincaré-biextension realization both equal the supplied cohomological pairing, with its sign. Use the two-term complexes [kernel(Z₀→Alb)→Z₀] and [k^s(X)×/(k^s)×→Div_alg⁰]. On disjoint supports, rational-function evaluation and the zero-cycle relation pairing agree on their common domain by reciprocity. Moving finite supports makes this subcomplex quasi-isomorphic to the tensor complex. The two partial products of the normalized Poincaré bundle give this chain map. Passing to the global-to-adelic cone computes the invariant sum; pulling the chain map through [n] identifies it with SI §4.29's `CasselsTate.finiteCoefficient_formula`, including the G_m correction and real Tate complex. For this comparison lift the n²-cochain to a zero-cycle cochain s and take a=ns. The geometric and Weil three-cocycles differ by −d(s∪na′); use ε_Weil=ε_geom−s∪na′. For a local lift q_v of the division point their local formulas differ by d(q_v∪na′_v), so have identical invariants. This fixes the global-minus-local sign. API: the two realization equalities, independence of geometric choices, finite support, and compatibility with the supplied finite-level and isogeny formulas. Sources: González-Avilés, Appendix equations (13)–(24), pp.411–417; Poonen–Stoll §12.2–3, Propositions 31–34, published pp.1143–1147.

**Checks.**

- A trivial torsor pairs to zero.
- Global constants may change local terms but not the sum.
- Odd n has zero real Kummer quotient, while n=2 on a two-component real elliptic curve has a nonzero term.
- The supplied corrected local cup has zero differential; omitting ε need not give a cocycle.
- For a genus-one torsor under E, the comparison with the supplied elliptic pairing uses the positive-`(O)` polarization, not its negative.
- A polarization induced by a k-rational divisor has zero diagonal; general principal polarizations need not.

Sources: Milne ADT I, Proposition 6.9/Remarks 6.10–12 pp.78–82; SI §§2.12a, 4.29. *Needs:* §§1.3, 2.13; `numberField_h3_units_zero` (§2.16); SelmerIwasawaCohomology §§2.12a, 4.29; AS A2.2–3 Poincaré bundle, A3.5 and A3.7 Weil pairings; scheme divisors/HS; CFT invariants.

### 3.17b Divisibility and the pairing kernel

For an A-torsor X over a number field, with [X]∈Sha(A), apply SelmerIwasawaCohomology §4.29's `CasselsTate.annihilator_nTorsion`: for n>0, some β∈Sha(A∨)[n] detects [X] precisely when [X]∉nSha(A). Its `CasselsTate.left_radical` and `CasselsTate.right_radical` identify the full kernels with the maximal divisible subgroups. Thus some β∈Sha(A∨) detects [X] precisely when [X] is outside the divisible subgroup. Transport these detection criteria to §3.17a's geometric realizations. In particular, finite Sha gives detection of every nonzero locally soluble torsor class; no finite-Sha hypothesis enters the n-cover criterion. The supplied `CasselsTate.reduced_primary_perfect` gives finite perfect pairings on the reduced primary quotients; the full Sha group need not be finite. Sources: Milne I, Theorem 6.13(a), Lemmas 6.15–17 and diagram pp.82, 86–89. *Needs:* §3.17a; SelmerIwasawaCohomology §2.12a (finiteness and all-place Kummer interfaces), §4.29 (annihilators and radicals).

**Checks.**

- A Prüfer summand pairs trivially, so unconditional nondegeneracy fails.
- n=1 has full annihilator and detects no torsor.
- On ℤ/p², order-p characters detect p-divisibility but not zero; order-p² characters detect zero.
- A finite Sha group has no nonzero divisible subgroup, so every nontrivial locally soluble torsor is detected.

### 3.17c Picard-zero Brauer classes

For locally soluble A-torsor X, `BrauerPic0 X` is the Br₁ preimage of im(H¹(k,A∨)→H¹(k,Pic X̄)); `BrauerPic0_n` uses H¹(k,A∨)[n], not Br(X)[n]. For β∈Sha(A∨), H³(G_m)=0 gives representative b and Σinv b(P_v)=CasselsTate([X],β) for the pairing supplied by SelmerIwasawaCohomology §§2.12a, 4.29, independent of P. Section 3.17a's lift restricts to the unique local constant; Br k and the Pic⁰→Pic kernel preserve the sum. General β has local difference given by Tate pairing, so point independence requires Sha. API: constants, divisibility monotonicity, representatives, CT equality, local difference, choices. Source: Milne I Remark 6.11 pp.80–81; Stoll pp.31–33. *Needs:* §§2.13, 2.16, 3.17a–b; `numberField_h3_units_zero` (§2.16); SelmerIwasawaCohomology §§2.12a, 4.29; HS/Pic⁰; AGD D7.6.

**Checks.**

- On X=A every Sha-derived sum is zero.
- Adding Hamilton over ℚ contributes 1/2 at both 2 and ∞ and preserves the sum.
- CT≠0 supplies a single class obstructing all adeles
- constants alone could never do this.

### 3.17d Multiplication covers and Pic⁰ obstruction

For an A-torsor X over a number field, n>0, own `nCoverSet_eq_BrauerPic0_n` on modified adeles (archimedean factors replaced by components), or its inverse image on ordinary adeles. The left set is the union of images of all n-coverings Y→X, empty if none are locally soluble. If X is locally soluble but no such Y is, [X]∉nSha; SelmerIwasawaCohomology §4.29 supplies β∈Sha(A∨)[n] with nonzero CasselsTate as applied in §3.17b, and §3.17c obstructs. Otherwise choose Q∈Y(𝔸). The fibre tuple d_Y(P_v)∈H¹(k_v,A[n]) is restricted-product by spreading. Finite-module PT, letting S increase, globalizes it iff it annihilates all global H¹(k,A∨[n]). By SelmerIwasawaCohomology §2.12a's all-place annihilators, Kummer changes of the lift of β pair to zero with local Kummer conditions; changing covering adds a global tuple. Local comparison identifies its cup with b(P_v)−b(πQ_v). The sum at πQ is zero: π* acts by [n] on Pic⁰, so π\*b is constant. Reciprocity proves both directions. Intersect over n for all multiplication covers.

For genus one, Tsen kills geometric Br and NS=ℤ has H¹=0, so Br=BrauerPic0. If Sha(E)_div=0, the radical theorem of SelmerIwasawaCohomology §4.29 detects every nonzero locally soluble curve class; hence nonempty Br set implies a rational point. Finite Sha suffices. Source: Stoll Theorem 7.2/Corollary 7.3/Lemmas 7.5–6/Theorem 7.7 pp.29–34. *Needs:* §§1.12, 2.11, 3.1, 3.17a–c; SelmerIwasawaCohomology §§2.12a, 4.29; finite PT and scheme Tsen/curve Picard.

**Checks.**

- n=1 gives all adeles and constant Brauer classes.
- A class not in 2Sha has empty two-cover set and a two-primary Pic⁰ obstruction without finite Sha.
- An arbitrary local tuple cannot be called a global twist unless PT orthogonality holds
- a finite Selmer test requires its fixed outside-S conditions.

### 3.18 Statistical Brauer–Manin failures

For integral binary forms f of degree n=2g+2, g≥1, Δ(f)≠0, order the models C_f:z²=f(x,y) by H(f)=max|f_i|. Among everywhere locally soluble models, a positive proportion have Pic¹(C_f)(ℚ)=∅ with an algebraic Brauer–Manin obstruction. For each fixed odd k>0, the proportion with Symᵏ(C_f)(𝔸)^Br=∅ tends to one as g→∞. Count coefficient models, with repetitions of isomorphism classes; no moduli-height density is asserted. These are `bgw_hasse_failures` and `bgw_symmetricPower_density`.

The estimates are constructed in §§3.18a–3.18c. Empty Sel₂(Pic¹) is detected by BrPic0₂ through §3.17d. For order-k Selmer sets, use the same finite multiplication-covering comparison restricted to local effective-divisor images: a Brauer-orthogonal adelic divisor must lift to one globally compatible two-cover. The map SymᵏC→Pic¹C sends D to D−((k−1)/2)H, with H the degree-two hyperelliptic class. Thus emptiness of this restricted Selmer set obstructs Symᵏ, even when the unrestricted Selmer set is nonempty. Local solubility of C supplies local effective degree-k divisors. No finiteness of Sha is assumed.

**Checks.**

- Genus one gives locally soluble quartics with empty Pic¹
- the large-genus limit fixes k before varying g
- even k is excluded, since multiples of H give effective even-degree divisors.

Source: Bhargava–Gross–Wang [BGW], Corollary 9 and Theorems 10–11, p.3, proofs §12, pp.33–35. *Needs:* §§1.12–1.14, 3.17a–3.17d and the following targets.

### 3.18a Pencils, oriented ideals and integral representatives

`PencilSelmerOrbit` transports ArithmeticStatisticsPartI §0.22's representation and ArithmeticStatisticsPartII §1.12's dictionaries to all regular pencils. For char F≠2 and n=2g+2≥4, use their V=Sym²(Fⁿ)², G=SL_n/μ₂ and `f = (−1)^(n(n−1)/2)det(xA−yB)`, with Δ(f)≠0. The supplied Fano variety of projective (g−1)-planes is a J-torsor F with `2[F]=[Pic¹C_f]`. Over a global field K of characteristic ≠2, assume actual degree-one divisors over every completion. The supplied locally soluble orbit dictionary then identifies the G(K)-orbits with `Sel₂(Pic¹C_f)`, retaining all places and this divisor hypothesis.

The adapters `binaryForm_orientedIdeal`, `pencilFano_doubleClass` and `pencilOrbit_integralRepresentative` compare these supplied objects under changes of the two pencil coordinates; they use the supplied ideal triples and Fano action. On a chart f₀≠0, use Part I's order R_f and lattices I_f(j), and Part II's oriented triples `(I,α,s)` with `I²⊂αI_f(n−3)`, `N(I)=sD`, `Nα=s²f₀^(n−3)`. Preserve the additional ideal-class relation for G over a general Dedekind domain. The coefficient-extraction dictionary, its inverse, the regular Fano action and its doubling identity are supplied by Part II.

For chart transport choose a nonroot in ℙ¹(F) when F is infinite and change the two forms by GL₂(F), which commutes with G. The common-quadric Fano scheme is unchanged, while the curve and its Picard torsors are transported by the same base-coordinate change. Identify the supplied chart dictionaries with this intrinsic Fano scheme and its doubling cover, retaining orientations and descent data; their transition isomorphisms satisfy the cocycle identity. Over finite F a nonroot exists after a finite separable extension; effective descent of these compatible charts gives the same F-object and orbit correspondence. No rational nonroot over the original finite field is assumed.

Over ℤ choose a primitive integer pair where f does not vanish and complete it to a GL₂(ℤ) coordinate change. Apply Part II's integral-representative theorem to `16ⁿf` on that chart and undo the coordinate change. All coefficients remain divisible by 16ⁿ, so `2^(4i) | f₀^(i−1)f_i` there. Since n is even, the scalar 16ⁿ is a square and the curve and Selmer set are unchanged up to the specified isomorphism. The resulting representative need not be unique.

**Checks.**

- Retain orientation: SL_n and SL_n^± give different orbit sets.
- For g=1 the supplied Fano variety is the intersection of the two quadrics itself.
- A local point gives an actual degree-one divisor; a rational Pic¹ point alone can retain a Brauer obstruction.
- For `f=xy(x−y)(x−2y)` over ℚ, f₀=0 but Δ≠0; a nonroot coordinate change enters a supplied chart and transports the same Fano torsor.
- Over `𝔽₃`, that same f vanishes on every rational point of ℙ¹; chart descent requires an extension, even though f is separable.

Sources: [BGW](https://arxiv.org/abs/1310.7692v2), Theorems 16–17, §§4–6, Theorems 23–28, Theorem 31, Theorem 33 and Proposition 34, pp.7–29; Wang, [*Maximal linear spaces contained in the base loci of pencils of quadrics*](https://arxiv.org/abs/1302.2385), Theorem 1.1 and §§2–3. *Needs:* ArithmeticStatisticsPartI §0.22; ArithmeticStatisticsPartII §1.12; SF §1.24 Galois descent; §§1.12–1.14.

### 3.18b Weighted orbit count and local masses

`pencilOrbit_congruenceCount` is the stabilizer-weight comparison for ArithmeticStatisticsPartIII §2.17's ordinary finite-congruence count. Fix even n≥4 and a real orbit type. For a G(ℤ)-invariant finite congruence set S modulo m, integral regular G-orbits with H<X, weighted by `1/#Stab_G(ℤ)(v)`, have count `c X^(n+1) ν(S) + o(X^(n+1))`, where ν(S) is the actual allowed-residue proportion in V(ℤ/m). For independently imposed prime-power conditions this is `∏_p density_p`; coupled conditions retain ν(S). The additional rational-orbit weight below uses the supplied weighted upper bound rather than this unweighted main term.

Own `pencilOrbit_cuspBound` as the comparison showing that orbits with nontrivial rational stabilizer contribute `o(X^(n+1))` on the full unbounded fundamental domain. Use ArithmeticStatisticsPartIII §2.17's “Pencil finite congruence count”, which counts all regular orbits, and Part II's stabilizer dictionary: a full symmetric branch Galois group has no nontrivial rational stabilizer in G. Every proper subgroup of S_n misses a conjugacy class. For each maximal proper subgroup, impose at finitely many good primes the absence of a missing splitting type. Finite-field factorization counts and orbit–stabilizer give each missing type a positive residue density bounded below independently of large primes. Thus the allowed residue proportions tend to zero as the prime set grows. For each fixed prime set the supplied full-domain count bounds the exceptional orbits; take the height limsup before enlarging that set. The finitely many maximal subgroups give the required zero limiting density, including after fixed finite congruences. Thus reciprocal stabilizer weighting preserves the supplied main term. Gauge measures and reduction theory are supplied by AA §§2.4, 3; the full-domain finite-congruence count is supplied by Part III §2.17.

Compute the Jacobian of V→(invariants,orbit) on a diagonal pencil; it is a fixed nonzero rational J₀. Its absolute values cancel globally. The only group-volume evaluation needed is `tamagawa_SLquotient_two`: τ(SL_n/μ₂)=2 for even n. For SL_n use the action on nonzero vectors, whose stabilizer is SL_(n−1)⋉G_a^(n−1). Unfold its orbit sum: ∫Σ_(x∈ℚⁿ)φ(gx)dg=τ(SL_n)φ(0)+τ(SL_(n−1))φ̂(0). Poisson summation interchanges φ(0) and φ̂(0), forcing the two coefficients equal. Induct from SL₁ and additive volume one; AA.3 reduction estimates justify unfolding/truncation. Thus τ(SL_n)=1. Igusa, *Lectures on forms of higher degree*, §5.6 pp.138–139, (143)–(144), supplies this proof. For μ₂ use E=(SL_n×G_m)/μ₂, with horizontal 1→SL_n→E→G_m→1 and vertical 1→G_m→E→SL_n/μ₂→1. Fubini and local H¹(SL_n)=1 give horizontal index one: at infinity the identity component lifts, rational torus points meet every component, and the twisted Hasse principle removes the global kernel. Vertically the character restriction has image 2ℤ⊂ℤ. Product-formula normalized torus volume is one; the square-class localization kernel is zero. Hence the vertical character index gives τ(SL_n/μ₂)=2. This is the scoped relative-volume proof of Ono, *On Tamagawa numbers*, §4 pp.129–131, Main Theorem/Corollary 3; it uses AA §§4.1, 4.5, AGD finite duality and CFT, not general Tamagawa evaluation.

For `pencilOrbit_localMass`, weight each integral orbit by the inverse of the sum `#Stab_ℚ/#Stab_ℤ` over the integral orbits in its rational orbit. This weight is in [0,1]. Part II's ideal classification and integral representatives identify it with a product of local factors, locally constant off closed null sets. Compute the change-of-variables Jacobian and these local integrals with the supplied Haar normalization. At v the soluble mass divided by its stabilizer is `a_v = #(Pic¹(ℚ_v)/2J(ℚ_v))/#J[2](ℚ_v)`. The local analytic index of [2] gives `a_∞=2^(−g)`, `a₂=2^g`, `a_p=1` otherwise, hence `∏a_v=1`. The exceptional-stabilizer comparison retains the full cusp contribution.

`pencilOrbit_sieveUpperBound` applies Part III §2.17's weighted upper bound to these factors: truncate independently imposed local conditions at finitely many primes, take the height limsup, and then the prime limit. Coupled finite CRT conditions are split into disjoint product residue sets and summed. The comparison yields an upper bound; it requires no orbit-tail equality.

For the coefficient denominator, `codimensionTwo_congruenceTail` specializes Part III §2.1's quantitative Ekedahl geometric sieve: for fixed closed S⊂𝔸^N_ℤ of codimension≥2 and M≥2, the box points reducing into S at some p>M are `O(X^N/M)+O(X^(N−1))`. For large p, failure of local solubility is contained in forms that are a scalar times a square; for n≥4 that locus has codimension≥2. Hensel and the curve point bound prove this containment. Apply the supplied large coefficient-family tail to obtain the coefficient density as real box volume times the positive Euler product. Division yields `average_SelmerPicOne_le_two`.

**Checks.**

- Dimension V=n(n+1), invariant degree n, so the exponent is n+1
- at g=1 the two exceptional local masses are 1/2 and 2
- A singleton orbit region has volume zero but can contain a lattice point; retain the constant term in the supplied Davenport error.
- For n=4 impose `(f₀ mod 5, f₀ mod 7) ∈ {(0,0),(1,1)}`. If a₀,a₁ and b₀,b₁ are the corresponding local measures, its density is `a₀b₀+a₁b₁`, while the product of marginal densities adds two positive cross terms. The regular pencils `(I₄,diag(0,1,2,3))` and `(diag(0,1,1,1),diag(−1,0,1,2))` realize f₀=1 and 0 at both primes; CRT realizes all four pairs.
- the tail requires codimension two
- With no finite-prime sieve restriction, the full-domain bound is the supplied ordinary count; the exceptional contribution becomes negligible only after the prime set grows.
- the average is an upper bound, not an asserted equality.

Sources: Bhargava, [\*Most hyperelliptic curves over ℚ have no rational points*](https://arxiv.org/abs/1308.0395), Theorems 9, 17, Propositions 10, 12–16 and proofs, pp.16–24; BGW Theorems 36, 38, 40–41, pp.30–33, Proposition 42, p.33; Bhargava, [\*The geometric sieve*](https://arxiv.org/abs/1402.0031), Theorem 3.3 and proof. The chart/stabilizer comparisons, particular local masses and SL-volume evaluation are owned here. *Needs:* ArithmeticStatisticsPartII §1.12; ArithmeticStatisticsPartIII §2.17, with the quantitative Ekedahl geometric sieve of its §2.1; AdelicAlgebraicGroups §§2.4, 3, 4.1, 4.5; ArithmeticGaloisDuality finite duality; ClassFieldTheory.

### 3.18c Parity and the real effective-divisor sieve

Own `Selmer_isogenyEulerCharacteristic` for an isogeny φ:A→B over a number field K, with its dual φ∨:B∨→A∨. Define `Q(φ) = #coker(A(K)/tors → B(K)/tors) · #ker(Sha(A)_div → Sha(B)_div)`. It is finite, multiplicative under composition and direct sums, and `Q([p]) = p^(rk_(p∞))` for every prime p. Finite duality applied to φ and φ∨ gives `∏_v z(φ_v) = (z(φ_K)/z(φ∨_K)) · #ker(Sha φ∨)/#ker(Sha φ)`, with z=#ker/#coker and all places retained. The kernels here are finite; no order of the full reduced Sha is taken.

For each p dividing deg φ, take the p-adic valuation and write `Sha′[p∞] = (Sha/Sha_div)[p∞]`, a finite group supplied by SI. Choose m so that p^m annihilates the reduced p-primary groups and the p-primary Mordell–Weil torsion of A, B and their duals, and replace φ by p^mφ. Separate the divisible kernels using this finite primary group, then use Q multiplicativity to cancel the added multiplication factors. Primes not dividing deg φ have isomorphic reduced primary groups. At p=2 this gives the scaling argument used in the parity formula. Retain the denominator in the displayed Euler quotient when expressing the global factors through Q(φ) and Q(φ∨). Sources: Dokchitser–Dokchitser, *BSD quotients*, Definition 4.1, Lemma 4.2, Theorem 4.3 and proof, pp.583–585; *Self-duality*, §3.2 pp.7–8. *Needs:* §§1.7–1.8; SelmerIwasawaCohomology §§2.12a, 4.29; ArithmeticGaloisDuality finite duality.

Own `biquadratic_SelmerParity`: under BGW Appendix A Theorem A.3's local hypotheses, the sum of the four 2-Selmer ranks of J, J^α, J^β, J^(αβ) is odd. The hypotheses are local points on all four twists at every place with full biquadratic decomposition group, split semistable toric rank one at one such place, and good reduction at the others. Apply the common Euler formula to the isogeny induced by `[1]−[C₂^a]−[C₂^b]−[C₂^c]+2[G]=0`. The four self-dual rational characters have regulator-constant valuation one, so the remaining global term is the sum of their 2∞ ranks. **Checks.**

- For `[2]` on a rank-r elliptic curve over ℚ, `z([2]_ℚ) = 2^(−r)` cancels its dual factor; the Sha[2] kernels cancel, and the local factors `2` at ∞, `1/2` at 2 and `1` elsewhere have product one. On `y² = x³ − 2`, `(3,5)` is nontorsion: its double has x-coordinate `129/100`, excluded for torsion by Lutz–Nagell.
- The abstract torsion group `⊕_p (ℤ/p)²` has finite perfectly paired primary factors but infinite total order; primary finiteness supplies no full reduced-Sha order.
- Q(id)=1
- multiplication by two on a free rank-r group with no divisible Sha contributes 2^r
- on a single ℚ₂/ℤ₂ divisible Sha summand with rank zero it contributes 2
- finite Mordell–Weil torsion alone contributes one, since Q uses its free quotient.

Use the canonical pairing and reduced primary groups supplied by SelmerIwasawaCohomology §§2.12a, 4.29. For a principal polarization retain the characteristic c∈Sha[2]: CT(a,a)=CT(a,c). On the finite reduced two-primary group define χ(a)∈𝔽₂ to be 0 or 1 according as CT(a,c) is 0 or 1/2. Here χ(a)χ(b)/2 means the rational half-class in ℚ/ℤ; it is not multiplication by 2 inside ℚ/ℤ. **Checks.**

- Twice the rational number 1/2 is 1, while twice its class in ℚ/ℤ is zero
- a c with CT(c,c)=1/2 generates a nondegenerate C₂ summand
- c=0 recovers an alternating pairing.
- If CT(c,c)=0, the pairing CT(a,b)−χ(a)χ(b)/2 is alternating and nondegenerate: a radical element equals χ(a)c, whose χ is zero.
- Its elementary divisors occur in pairs.
- If CT(c,c)=1/2, the c-summand is nondegenerate with alternating orthogonal complement.
- Thus #Sha′[2] is a square or twice a square, with parity given by the number of locally deficient Pic^(g−1) classes (Poonen–Stoll §§5–8, Theorems 5,8,Corollary 12, pp.10–14).
- Local points kill these deficiencies at full-decomposition places
- at cyclic places the permutation relation pairs them.
- Passing from 2∞ to 2-Selmer adds dim J[2](K)+dim Sha′[2]
- the four identical two-torsion representations cancel the former, and this deficiency calculation cancels the latter.

The local terms are component orders times differential factors. Cyclic decomposition groups kill the relation. At full decomposition with good reduction component orders are one. At the split semistable rank-one place monodromy is multiplication by an integer c, and extension of ramification index e changes it to ec; hence the local quotient is (2c)c²/((2c)(2c)c)=1/2, with odd valuation. Differential lattices cancel because semistable invariant forms remain minimal. This monodromy/cokernel adapter is Dokchitser–Dokchitser, *Regulator constants*, §3.v.1 pp.37–39 and Proposition 3.27 p.40; NM supplies the semistable uniformization. Thus precisely one local term is odd, proving the scoped formula. APIs: Q multiplicativity, dual-isogeny Euler formula, characteristic-class square correction, and split rank-one component index. AGD supplies finite duality, not the Euler formula itself.

Choose two auxiliary primes outside the fixed local conditions, and α, β that are locally squares at those conditions, with one ramified and the other inert at the first prime. Require a split double root and an additional simple root there, and squarefree reduction with a simple root at every other full-decomposition prime. These are nonempty open congruence conditions, give the required reduction types, and supply local points on all four twists. At the remaining large primes exclude scalar-square forms by §3.18b. Heights under these four fixed twists differ by bounded factors. Hence both Selmer parities have positive density among locally soluble models. Generically the branch-point torsor W[2] is nonzero (the full symmetric branch action has no invariant odd half-partition), so a nonempty Sel₂(Pic¹) has at least two elements; in the even-rank positive-density part it has at least four. The average ≤2 therefore forces positive density of empty sets.

For fixed odd k, define `realEffectiveFraction(m,k)=2^(1−m)Σ_(j≤k,j odd)binom(m,j)` when C(ℝ) has m>0 components; cap this expression by one. API: effective-divisor image bound in Pic¹(ℝ)/2J(ℝ), monotonicity in k, and limit zero for fixed k as m→∞. **Checks.**

- m=1, k=1 gives one
- m=4, k=1 gives 1/2
- m=4, k=3 gives one.
- Conjugate pairs contribute zero modulo 2J and two real points in the same component also contribute zero, so only an odd subset of at most k components remains.
- This proves the bound and inserts this factor into the real mass of §3.18b.

Own `uniformCoefficient_realRoots_unboundedInProbability`, only the qualitative estimate required here. For independent uniform coefficients on [−1,1], let P_n(x)=Σ_(i=0)^nξ_i x^i. Fix r and 0<a₁<⋯<a_r<1, x_j=1−n^(−a_j). Normalize each P_n(x_j) by its standard deviation. Geometric sums give variance asymptotic n^(a_j)/6 and covariance tending to zero between distinct normalized coordinates. Every normalized summand has maximum coefficient O(n^(−a₁/2)); Taylor expansion of its characteristic function, with bounded third moment, shows that the joint characteristic function tends to exp(−‖t‖²/2). Native finite-dimensional Lévy convergence then gives independent Gaussian limiting coordinates. Their signs are independent fair signs; the number of consecutive sign changes is Binomial(r−1,1/2), and each change gives a distinct real root. First n→∞, then r→∞, proves that the root count tends to infinity in probability. Each pair of consecutive real branch roots supplies a real component, so the component count also diverges. This argument asserts no decay rate. The coefficient box and finite congruences become independent by Riemann sums; §3.18b's tail extends this to local solubility. The real-solubility event has probability at least 1/2 (positive leading coefficient), so conditioning preserves this qualitative limit. The finite-place Euler factor cancels before g varies. The real effective fraction therefore has mean tending to zero, by bounded convergence and the binomial bound. The order-k Selmer average tends to zero, hence its nonemptiness proportion tends to zero by Markov, proving §3.18.

Sources: BGW Appendix A Theorems A.2–A.3, Corollary A.8 and proofs, pp.35–39; §12, pp.33–34. The elementary real-root argument replaces the stronger rate from Dembo–Poonen–Shao–Zeitouni cited there. *Needs:* §§1.12–1.14, 3.17a–3.17d, 3.18a–3.18b; SelmerIwasawaCohomology §§2.12a, 4.29; native characteristic functions, Gaussian integrals, finite products, Lévy convergence, polynomial continuity and binomial tails. No hypothesis about ranks of the individual Jacobians is inserted into the density conclusion.

### 3.19 A genus-two descent

`descent_example_genusTwo`: for X:y²=(x²+1)(x⁴+1) over ℚ, normalize the covers c w²=x⁴+1. Its divisor on X is even, so these are étale μ₂-torsors, including at branch zeros/infinity. Resultants force c∈{±1,±2}, positivity leaves precisely the viable classes 1, 2. The covers map to w²=x⁴+1 and 2w²=x⁴+1, birational to rank-zero elliptic curves Y²=X³−4X and Y²=X³−X respectively. Their two-descents give torsion (ℤ/2)². Thus X(ℚ) is (0,±1), (±1,±2), plus two points at infinity. For the first quartic use X=2(w+1)/x², Y=4(w+1)/x³ and extend over missing points by proper normal models. Source: Poonen §§8.3–8.3.1 pp.236–238. *Needs:* §§1.15, 3.2–3; EC Layer 6 two-descent for both curves.

**Checks.**

- There are eight points, not six
- x=1, y=2 belongs to c=2 and not c=1.
- The affine equations alone are not a torsor presentation at their omitted points.

### 3.20 Finite covers obstruct strong approximation

**Lang–Weil at function-field places.** Own `langWeil_functionFieldPlace`: let k be a global function field, U a nonempty open of its smooth proper constant-field curve, and `𝒱 → U` separated of finite type with geometrically integral generic fibre of dimension d. After shrinking U, all closed fibres are geometrically integral of dimension d, and there is C independent of the closed place v such that `|#𝒱(κ(v)) − (Nv)^d| ≤ C (Nv)^(d−1/2)`. In particular their smooth loci have κ(v)-points for sufficiently large Nv. Prove the uniform finite-field estimate for finite-type families by bounded-degree slicing to curves, using SF §5.11's `weil_bound`, normalization and bounds on the singular and boundary loci, then apply it over U. For a finite étale cover of degree e>1 with both generic varieties geometrically integral, apply the count to their smooth loci: `#𝒴(κ(v)) < e·#𝒳(κ(v))` for large Nv, so some smooth point has nonsplit fibre and lifts by Hensel. Source: Poonen Theorem 7.7.1(ii)–(iv) and its curve-slicing proof, pp.222–223; Theorem 8.4.10 proof, pp.243–244. *Needs:* §2.3a; SF spreading and §5.11 `weil_bound`; AlgebraicCurves normalization and smooth proper curve models; Hensel lifting.

**Checks.**

- For `𝒱=𝔸^d_U`, the count is exactly `(Nv)^d`.
- For a constant smooth proper geometrically connected genus-g curve, the error is at most `1 + 2g√Nv`.
- For `Spec 𝔽_(q²) × U` over the constant field 𝔽_q, the fibre count is zero at odd-degree places and two at even-degree places; irreducibility without geometric integrality is insufficient.

For a global field k, finite S and a nonisomorphic finite étale map Y→X of geometrically integral varieties, assuming X proper when char k>0, X(𝔸^S)≠∅ implies X(k) is not dense there. Under the same properness hypothesis in positive characteristic, a normal geometrically integral X with nontrivial geometric π₁ and nonempty away-S adeles fails strong approximation off S. Work in one compact basic adelic box. Outside finitely many places integral fibres are unramified; at the retained exceptional places the compact box and Krasner local constancy give finitely many fibre algebras. At omitted places in S, characteristic-zero local fields have only finitely many extensions of bounded degree; in positive characteristic properness makes X(k_v) compact, so Krasner local constancy again gives finitely many fibre algebras. These controls bound the different at every exceptional place, including S. Hermite (§3.3a) makes all rational fibres in this box lie in finitely many types. Choose a new Chebotarev place splitting them. The Lang–Weil counts for the smooth loci of X and Y give `#Y(κ(v)) < deg(Y/X)·#X(κ(v))` at a sufficiently large such place, hence a smooth point with nonsplit fibre; Hensel lifts it to an integral point. Its local open neighborhood avoids all those rational points. For the π₁ corollary descend a finite geometric cover after finite extension, intersect its conjugate open subgroups and use the resulting finite arithmetic cover in this same construction. Source: Poonen Theorem 8.4.10/Corollary 8.4.11 pp.243–244, with [errata p.4](https://math.mit.edu/~poonen/papers/Qpoints-errata.pdf#page=4). *Needs:* §§2.3a, 2.11a, 3.3a, 3.4; Chebotarev Layer 10; IG §2.5 Lang–Weil over number fields; `langWeil_functionFieldPlace` above over global function fields; ECF §F.0.2 for fundamental-group descent. No function-field connected-group finiteness is used.

**Checks.**

- Squaring obstructs strong approximation on G_m/ℚ off ∞
- degree one is excluded.
- Over `𝔽_p(t)`, `u ↦ u^p − u` is a nontrivial geometrically integral finite étale cover of A¹, yet strong approximation off ∞ holds for A¹. Fibres above `t^m`, with `p ∤ m`, have unbounded different at ∞; properness cannot be omitted in positive characteristic.
- A fixed ramification set in characteristic p is insufficient without the local different bound.

### 3.21 Obstructions need not suffice

Prove existence over ℚ of (a) a nice bielliptic surface with nonempty Br set, no rational point and empty étale–Brauer set, and (b) a nice quadric bundle with nonempty étale–Brauer set and no rational point. For (a) use the smooth proper model of (x²+1)y²=(x²+2)z²=3(t⁴−54t²−117t−243); its product-of-genus-one étale cover and twists give the obstruction. For (b) choose a curve C with finitely many rational points and an étale-simply-connected rational fibre over a local-solubility parameter but a Hasse-failing Châtelet fibre over every rational point. Pullback describes Br and finite covers from C, so the chosen adelic fibre survives them while no rational point can lie over C(ℚ). The exact choices and fibre computations are Poonen Theorem 8.6.5/Propositions 8.6.6–10 pp.250–252; (a) is Theorem 8.6.1/Remark 8.6.4 pp.248–250. *Needs:* §§2.23, 3.7–8, 4.6; scheme smooth proper models, Châtelet conic bundles and finite étale covers. The dependency on §4.6 only uses Layer 5's independent curve-height proof.

**Checks.**

- Both respect X(ℚ)⊆X(𝔸)^ét, Br
- (a) separates Br from étale–Br, while (b) separates étale–Br from existence.
- Section 3.8 identifies (b)'s surviving set with descent as well.

### Examples

For X:y²=(x²+1)(x⁴+1), normalize the covers specified generically by `c w²=x⁴+1`. The relevant everywhere locally soluble square classes are c=1, 2. They map to the genus-one quartics `w²=x⁴+1` and `2w²=x⁴+1`, birational to the rank-zero curves `y²=x³−4x` and `y²=x³−x`. Their rational-point calculations give the six affine points `(0,±1),(±1,±2)` and the two points at infinity on X. Each point belongs to exactly one inverse twist; naive equations at a branch zero do not give the étale torsor without normalization (Poonen, §8.3, pp.236–238).

A μ₂-fibre u²=a has evaluation class [a]; the c-twist is `c w²=a`, so a=c has the point w=1. For a torus residual pairing of order three, choosing τ with `⟨a,τ⟩=−ε₀(a)` makes the new functional zero. The parameter in the cited Harpaz–Wittenberg *Zero-cycles* proof is the opposite of this τ.

Skorobogatov's bielliptic surface has a nonempty Brauer–Manin set and no rational points; étale descent detects its failure. Poonen's quadric-bundle example has a nonempty étale–Brauer set and no rational points. These examples prevent either nonempty obstruction set from being used as an existence theorem for rational points (Poonen, §8.6, pp.250–252).

### Dependencies

Layers 1–2; SchemeAndStackFoundations §§1.15–1.17, 2.3, 2.15, 2.22, 3.6; ArithmeticGaloisDuality Layer R02.4 for torus duality; EllipticCurves Layers 5 and 7 for the pointed-twist and Weil–Châtelet comparison. SelmerIwasawaCohomology §§2.12a, 4.29 supplies the classical cohomological Cassels–Tate pairing, Kummer/Sha interfaces and radicals; §§3.17a–3.17d here identify its geometric realizations and prove the Brauer and multiplication-cover comparisons. Connected-cover comparison, the type obstruction and compensating auxiliary places are distinct requirements, stated above.

## Layer 4: Curves, covers and integral points

### 4.1 Good reduction and Shafarevich sets

Number field K, finite S⊃∞: `HasGoodReductionOutside C S` means a smooth proper O_(K,S)-model with geometrically connected fibres; `shafarevichSet K S g` consists of its genus-g K-isomorphism classes; `ShafarevichFiniteness` asserts finiteness. API: S-monotonicity, finite base change, isomorphism invariance. Source: Szpiro §2.1 pp.85–86; Milne AV IV §§1, 5 pp.132–133, 145. *Needs:* curve models, SR 2, NM elliptic comparison.

**Checks.**

- P¹ has everywhere good reduction
- y²=x³−x/ℚ is good outside {2,∞} but not outside {∞}
- elliptic good reduction agrees with the minimal Weierstrass criterion.
- Spec K is not an S-integer base for finite S.

### 4.2 Chevalley–Weil

`chevalleyWeil`: a finite étale surjective f:Z→X with X proper over a number field K admits a finite K′/K over which every point of X(K) lifts. Proper spreading makes fibre algebras étale outside S; Hermite gives finitely many bounded-degree types; take their splitting compositum. Alternatively apply §3.3a to a finite étale surjective Galois closure on each connected component. Integral points on finite étale surjective models lift over degree≤degf unramified outside S. Source: Poonen Corollary 8.4.8/Theorem 8.4.10 proof pp.242–243; Szpiro Example 1.1 p.86. *Needs:* §3.3a; AGD Hermite; spreading.

**Checks.**

- Section 3.19's covers need only ℚ(√2)
- identity needs no extension.
- A rational lift need not exist over K itself.
- The first-component inclusion Spec ℚ→Spec ℚ⊔Spec ℚ is finite étale but never lifts the second point; ∅→Spec ℚ likewise fails surjectivity.

### 4.3 De Franchis

Char0, smooth projective C′, C, g(C)≥2: `finite_nonconstant_hom`. Hurwitz bounds degrees; graphs give finite-type Hom with finitely many Hilbert polynomials. Tangent H⁰(C′,f\*T_C)=0 since degf\*T_C<0; hence finitely many geometric points. This also gives the separable char-p version for fixed target. Source: Milne AV IV Theorem 5.2 p.146; Samuel Theorem 1/corollary p.56. *Needs:* Hurwitz; AM Hom/graphs; deformation tangent.

**Checks.**

- Self-maps include a finite automorphism group
- target genus one permits infinitely many multiplications.
- Unrestricted Frobenius iterates invalidate the positive-characteristic statement.

### 4.4 Kodaira–Parshin covers

Smooth projective geometrically connected C/K, g≥1, good outside dyadic/infinite S: `KodairaParshin C S` gives one finite L/K and C_P/L→C_L branched exactly at each P∈C(K), good outside S_L. Pull [2] on Jac along Q↦[Q−P]: connected étale C₁→C, degree 2^(2g), genus g₁=1+2^(2g)(g−1), rational point over P. Its fibre D has degree 2^(2g). Halve O(D) in Pic, [2]-fibre degree 2^(2g₁); the section kills the bundle Brauer obstruction. M²=O(D) gives the double cover branched at D. Halving fields are unramified outside S; Hermite gives one compositum. Relative Picard/double covers stay smooth away from 2. Hurwitz gives 2g_P−2=2^(2g)(4g−3). API: field, curve, map, genus, good reduction, branch/base change. Source: Szpiro §5.2 pp.97–98; Milne IV pp.145–148 uses a different branch variant. *Needs:* §§4.1–2; JC F; AS A3.2; relative Picard/double covers.

**Checks.**

- g=2 gives g₁=17 and g_P=41
- the first step has degree 16 and no ramification.
- The second is branched, so distinguishes P.
- For g=1 the first step is [2] on C with P as origin.
- The halving degree is 2^(2g₁), not 2^(2g).

### 4.5 Parshin's implication

For genus≥2 C and §4.4's (L,S_L,g_P), ShafarevichFiniteness(L,S_L,g_P)⇒finite C(K). Finitely many C_P and §4.3 give finitely many auxiliary maps; their single branch values distinguish P. Source: Milne AV IV Theorems 5.1–2 deduction p.146; Szpiro §5.2 p.98. *Needs:* §§4.1, 4.3–4.

**Checks.**

- Genus one fails at de Franchis, allowing positive rank
- different P give different branched maps.
- No unconditional Shafarevich theorem is inferred here.

### 4.6 Mordell over number fields

`Curve.finite_rationalPoints`: smooth projective geometrically connected genus≥2 curves over number fields have finite rational points, by §5.12's independent Vojta–Bombieri argument. Section 4.5 remains a separate conditional implication. Source: Poonen Theorem 9.5.1/Remark 9.5.2 p.286; Szpiro Theorem 1 p.84.

**Checks.**

- Section 3.19 has exactly eight points
- an elliptic curve of positive rank is excluded.
- Finiteness supplies neither a height bound nor an algorithm.

### 4.7 Integral points

Affine curve X/K, finite-type affine O_(K,S)-model 𝒳: `IntegralPoints 𝒳=𝒳(O_(K,S))⊂X(K)`. API: S-monotonicity, eventual model equality, isomorphism/pullback, G_m=S-units. Finite presentations spread comparisons; finiteness means every S/model, not identical sets at fixed S. Source: Szpiro Siegel statement p.84. *Needs:* §§2.2–3.

**Checks.**

- A¹ gives infinite O_(K,S)
- G_m(ℤ[1/2])={±2^n:n∈ℤ}, also infinite.
- P¹∖{0,1,∞} gives u+v=1 with both S-units.

### 4.7a Normalized product Subspace theorem

Number field K, n≥2, finite S, independent K-linear L_(iv), ε>0: vectors x≠0 with
`∏_(v∈S,i≤n)(|L_(iv)x|_v/‖x‖_v)<H(x)^(−n−ε)`
lie in finitely many proper K-subspaces. Here |a|_v=|a|_genuine^([K_v:ℚ_v]/[K:ℚ]), ‖x‖_v=max_i|x_i|_v, H=∏‖x‖_v. API: homogeneous scaling/projective restriction; no effective algorithm.

This is the absolute/projective adapter to SubspaceTheorem §6.2’s `NumberField.exists_finset_submodule_of_approxProd_le`. Take `ι = Fin n` and split S into finite and infinite places. If `d = [K:ℚ]`, the supplier’s relative `approxProd` is the d-th power of the displayed absolute product, and its `mulHeight` is `H^d`. Raising the strict inequality to the positive power d gives the supplier’s non-strict hypothesis with the same ε. A proper subspace is homogeneous, so its projectivization contains the corresponding solutions. Zero evaluations are already included in the supplier’s theorem, and bounded-height solutions contribute finitely many projective points. Source: Bombieri–Gubler Theorem 7.2.2 with `F = K`; SubspaceTheorem §6.2; Corvaja–Zannier pp.268–270. *Needs:* SubspaceTheorem §6.2; §0.11; ArakelovGeometryAndAbelianHeights §1.13.

**Checks.**

- A zero L value gives a hyperplane even at unbounded H
- n=1 is excluded.
- Over ℚ(i) an ordinary complex modulus has normalized weight one
- squaring it without degree normalization changes H.
- Over ℚ(i), the relative product and height are the squares of the absolute ones, so ε is unchanged.
- Rescaling a form changes the product by a fixed positive factor; the supplier applies to that rescaled system.
- Empty S gives no solutions since H≥1.

### 4.8 Siegel finiteness

Smooth geometrically integral affine X/number field, completion genus g: every IntegralPoints 𝒳 is finite if g≥1, or g=0 with ≥3 geometric boundary points. Extend K/use Jacobian multiplication covers to obtain three rational boundary points; Chevalley–Weil controls integral lifts. Riemann–Roch pole spaces have bases with successive boundary vanishings. Choose each v's nearby boundary; resulting product estimates meet §4.7a. Its finitely many proper sections meet the curve finitely. Genus zero reduces to S-units. Source: Corvaja–Zannier Theorem 1/proof pp.267–271; Szpiro [Si] p.84. *Needs:* §§4.2, 4.7–7a; Riemann–Roch; DA S-units.

**Checks.**

- u+v=1 in ℤ[1/2]× has (2,−1), (−1,2), (1/2,1/2).
- One boundary point on P¹ gives infinite integers
- two can give infinite S-units.
- Boundary is counted geometrically
- no algorithm follows.

### 4.9 Mordell over function fields

Regular finitely generated K/k, k algebraically closed in K, trdeg>0: infinite points on smooth projective geometrically integral genus>1 X/K force K-constancy in char0, isotriviality in char p. For regular nonsmooth X this holds over one-variable finite-constant fields (§4.9c), or arbitrary constants with geometric genus≥2 (§4.9b). Infinite-constant geometric genus0/1 genus drop is excluded. Source: Poonen Theorem 9.5.10 pp.287–288, scoped here; Samuel Theorems 4–6 pp.59–62; Voloch Theorem 3 p.125. *Needs:* §§4.9a–c.

**Checks.**

- A constant genus-two curve over ℂ(t) has infinitely many constant points.
- For q an odd prime power, K=𝔽_q(t), and separable f∈𝔽_q[x] of odd degree≥5, f(t)y²=f(x) has (t^(q^n),f(t)^((q^n−1)/2)) for every n≥0 and need only be isotrivial (Poonen Example 9.5.4, p.287).
- With k=𝔽₉, q=3 and f=x⁵−a for a∉𝔽₃, the n=1 formula fails: Frobenius changes a to a³.
- In char p>3, y²=x^p−t has relative genus (p−1)/2 and geometric genus zero, requiring the finite-constants genus-drop branch.

### 4.9a Jets and nonhorizontal sections

For a smooth proper genus≥2 family C→S over algebraically closed k, S smooth integral affine, define `SectionJet` as splittings of T_C→π\*T_S, a torsor under Hom(π\*T_S,T_(C/S)). API: projection, affine coordinate changes, differential jet of a section, restriction, horizontal membership. **Checks.**

- a derivative composes to id, unlike an arbitrary tangent vector
- adding a vertical homomorphism preserves splitting
- constant product sections have the horizontal zero jet.

Own `sectionJet_contraction`: after shrinking S a proper map Φ:SectionJet→S×A^m is an isomorphism off the positive-dimensional fibre locus E, whose images are disjoint from that complement. Fibrewise E is empty or maps radicially onto the curve. Projectivize the affine bundle; its infinity divisor has fibre normal bundle Ω_C⊠O(1), ample. Exact restriction sequences and coherent higher direct images lift large powers to sections of O(lD), including 1 with divisor lD. They contract the affine complement properly to affine space; direct-image algebra generators, formal functions and Zariski main separate zero-dimensional fibres. A complete locus pulls the affine torsor back with a tautological section; the resulting negative vector bundle has only its zero complete locus, giving one point over each curve point.

Own `finite_nonhorizontal_sections`. Properness extends sections in codimension one on a fixed normal projective compactification S̄. Their derivatives extend in ambient projective jets; one fixed denominator of Φ bounds poles uniformly, so Φ(j(s)) lies in finite-dimensional V=H⁰(S̄,O(D₀))^m. Proper incidence Φ(y)=v(πy) gives an algebraic parameter locus, possibly with the one parameter Φ(E) removed. Off it invert Φ and impose the algebraic differential-jet identity. A positive-dimensional parameter locus contains a smooth affine curve Q; complete it, extend the family by properness at its generic divisors and normality across codimension two. The composed Φ is regular on S×Q̄, hence independent of Q̄. This contradicts parameter variation, proving the locus finite. Source: Grauert §§1.1–5 pp.132–137, §§2.1–3 pp.137–140, §3 Theorems 1–4 pp.140–142. *Needs:* scheme formal functions/Stein/Zariski main, coherent cohomology and projective bundles; SR dualizing bundles; §0.14a.

**Checks.**

- Product families can have infinitely many horizontal sections
- V need not be a finite set over infinite k.
- Negativity is used on curve fibres, not on an arbitrary base variety.

### 4.9b Horizontal descent and Frobenius orbits

`horizontalJet_is_section`: infinite horizontal sections make §4.9a's E→C an isomorphism. A radicial equation y_i^(p^a)+b_i=0, a>0, has db_i≠0 unless a p-th power. Differentiate on dense sections; linear splitting equations produce a section, giving degree one. Char0 radiciality already does so.

`horizontalCurve_descends`: normalize a pluricanonical embedding by N+2 horizontal frame points. Its infinitesimal projective change is zero; equations/point coordinates lie in derivation constants, k in char0, K^p in char p over algebraically closed constants. Iterate; valuations give ∩K^(p^n)=k. Finite-type Isom (AM §4.9) splits after finite extension. In char0 the normalized coefficients already lie in K∩k̄=k; char-p twists may remain. Source: Grauert §§2.3, 4.1–2 pp.138–144; Samuel Theorem 4 pp.59–60.

`separableQuotientFields_finite`: Hurwitz bounds one-variable quotient degree m/genus γ≥2. Its correspondence T=Δ+S has T∘T=mT, S²=−(2g−2)−m(m−2)(2γ−2)<0 for m≥2. A moving Chow family contradicts this: remove common fixed equivalence/pass to its quotient, then remaining moving components have nonnegative self-intersection. Bounded-degree Chow gives finitely many isolated equivalences; m=1 unique. Induct in transcendence degree via algebraically closed codimension-one subfields; finite automorphisms/disjoint constants identify descents. Hence `constantCurve_points_modFrobenius`: except constant points, finitely many maximal Frobenius orbits; repeated exponents force a finite-field moduli point. Retain Galois equivariance. Source: Samuel Theorems 1–3, 5 pp.56–61.

`infinitePoints_noGenusDrop` for regular X of geometric genus≥2: normalize after purely inseparable K′/K, split its constant model over Galois L′/K′, and let L be K's separable closure in L′. Choose q with (L′)^q⊂L; orbit descriptions put almost all normalization points in such power coordinates. A linear projection from large smooth-point divisors realizes normalization. Its composition with the constant isomorphism maps dense L-points to K-points. Expand its rational coordinate functions in an L-basis of L′; density kills nonconstant coefficients, descending the map to L. Normality of X_L makes this proper smooth birational map an isomorphism, so X is smooth. Source: Samuel Theorem 6 pp.61–62. API: splitting/descent, quotient fields, orbits/equivariance, no genus drop. *Needs:* §4.9a; AM §1.6 Chow parameters, §2.1 Hilbert families and §4.9 Isom torsors; normalization/descent; SR/intersections.

**Checks.**

- Constant curves over ℂ(t) have infinitely many horizontal points
- an isotrivial p-twist need not be K-constant.
- Over the function field of a finite-field curve, its Frobenius generic-point iterates are infinite and must not be counted as finitely many separable maps.
- Projection from the normalization is not assumed invertible projective linear when genus drops.

### 4.9c Genus stabilization and finite constants

`frobeniusTower_eventuallySmooth`: for regular geometrically integral X/K, char p, F=K(X), regular models F_n=KF^(p^n) eventually are smooth of geometric genus. Geometric normalization descends smoothly to finite purely inseparable L/K. Choose L^(p^r)⊂K; the Frobenius twist base-changed to K is smooth with field K(LF)^(p^r)=KF^(p^r). Subsequent twists preserve genus; preceding genera decrease by normalization.

`nonconservativeCurve_finitePoints` over one-variable finite-constant K: at the last genus drop use z^p=r. Final genus≥2 uses §4.9b. Final genus0 with a point is P¹: clear denominators by a p-th power; for deg r=d prime to p, leading a₀, choose md+1≡0 modp and substitute a₀^mx. Its leading coefficient becomes a p-th power; scale/translate to normalize/kill the next coefficient. For δ=d/dt, r(a)∈K^p gives r′(a)δa+r^δ(a)=0, deg r^δ≤d−2. Uniform pole bounds give finitely many δa by finite-constant Riemann–Roch. Infinitely many a force r′b+r^δ=0; leading terms give b=0, r^δ=0, contradicting genus drop. Inversion at a known point handles p|d. Final genus1: finite Frobenius/Verschiebung cokernels (§1.10) translate an infinite coset into p-power coordinates; differentiating forces domination by an elliptic curve, the same contradiction. Finite fibres propagate backwards. API: tower/maps, eventual genus, finite points, extension compatibility. Source: Voloch Theorems 1–3/Remarks 1, 3 pp.122–125; finite-presentation tower adapter above. *Needs:* §4.9b; §1.10 finite constants; geometric normalization/smooth descent; Riemann–Roch/Frobenius genus.

**Checks.**

- y²=x^p−t, p>3, has genus drop and finite points over finite constants
- a smooth constant curve is conservative and excluded.
- Infinite constants make Riemann–Roch spaces finite-dimensional, not finite, so the last argument is not asserted there. r(x)=a₀x^d+… cannot be divided by arbitrary a₀ before the p-th-power normalization.

### Examples

For genus g=2, the pullback of [2] has degree sixteen and genus seventeen. The fully branched double cover has `2g(C_P)−2=16·5=80`, hence genus forty-one. Its branch locus on the original curve is exactly the chosen point. The dyadic exclusion is required for the finite-étale halving argument and smooth double-cover model.

For `ℙ¹\{0,1,∞}`, S-integral points satisfy the S-unit equation u+(1−u)=1 and form a finite set. For `ℙ¹\{∞}` the integral points include all ordinary integers. For `ℙ¹\{0,∞}` they are S-units and can be infinite; these are the one- and two-boundary-point negative controls to Siegel's genus-zero hypothesis. A constant genus-two curve over ℂ(t) has infinitely many constant points, so number-field finiteness does not extend without the function-field constant/isotrivial distinction.

### Dependencies

Layers 0–3; JacobianChallenge Layer F; SchemeAndStackFoundations §§3.1–3.7 and 4.13; TauCetiRoadmap.StableReduction Layer 2; AbelianSchemesAndArithmeticModuli §A3.2; ArithmeticGaloisDuality Layer R02.3; SubspaceTheorem §6.2 with the normalized absolute/projective adapter of §4.7a; DiophantineApproximationAndTranscendence for S-units. Shafarevich finiteness is the explicit premise of the Parshin implication. Function-field Mordell has its separate proof inputs.

## Layer 5: Cosets, finite rank and small points

### 5.1 Cosets and torsion subvarieties

For abelian A/k, `IsCoset X` means X_k̄=x+B as a closed scheme; `IsTorsionCoset` requires x torsion modulo B; `IsTorsionSubvariety` means that X_k̄ is a finite union of torsion cosets as a reduced closed scheme, allowing Galois-conjugate components. Surjectivity of [n] on B gives a torsion lift of x. API: translate, inverse, union, extension, quotient fibres, torsion inverse images. Sources: Conrad Theorem 3.7 p.6. *Needs:* AS A6.3–5; §1.0 quotients.

**Checks.**

- Cosets include {x} for every x, A and x+B
- a genus≥2 Abel–Jacobi curve is not one.
- Torsion cosets include {0}, A, {t} for torsion t, but not an infinite-order singleton.
- Torsion subvarieties include ∅ and {0,t}
- {0,x} fails for infinite-order x.
- The diagonal and antidiagonal of E² meet in E[2]
- E[2] itself is not an abelian subvariety, being disconnected in characteristic≠2 and nonsmooth in characteristic 2.

### 5.2 Scheme-theoretic stabilizers

`stabilizer X(T)={a:X_T+a=X_T}` for closed X⊂A, including nilpotent T. The fibre at [X] of the translation map into Hilbert represents this closed subgroup. API: membership, action, base change, inverse, quotient. Over perfect k, B=Stab(X)_red⁰ is abelian; fpqc descent of the invariant ideal gives X=q⁻¹Y for q:A→A/B, and Y has finite full stabilizer, possibly nonreduced. In char0, for irreducible X embedded by a very ample L, with d=dimX and D=deg_LX, generic-translate intersection and Bézout give deg_LStabX≤D^(d+1), retaining components. API also: `add_stabilizer`, Stab(X)+X=X. This stabilizer adapter uses Hilbert representability, fpqc descent and Bézout; its translate-intersection degree argument is the one in Rémond *Décompte*, proof of Lemma 4.6, pp.535–536. *Needs:* AM Hilbert; §§1.0, 5.1; SF cycle intersections/Bézout.

**Checks.**

- Stab(A)=A
- Stab({x})=0
- Stab(x+B)=B.
- Translation stabilizers in characteristic p can be nonreduced: testing only geometric points loses their scheme structure.
- The empty subscheme has stabilizer A.
- Quotienting a coset gives a point, with trivial stabilizer.
- X=B∪(t+B) with t∈A[2]∖B has a disconnected stabilizer containing B∪(t+B).

### 5.3 The abelian variety generated by differences

Nonempty integral X⊂A over an algebraically closed field: `generatedByDifferences X` is the least abelian subvariety containing X−X. Iterated proper addition images stabilize within dimA steps; stabilization gives a subgroup. API: minimality, translation, extension, iterated addition. Symmetric ample L gives deg(Y+Y′)≤4^(dimY+dimY′)degY degY′ by cube/product degrees, hence an explicit bound in dimA, degX. This generated-differences adapter uses proper addition images from AS A6.3 and the cube/product-degree formula of §0.19. Source for the generated subgroup: Pink–Rössler 2004, Proposition 2.6 and proof, p.4; the displayed degree estimate is the adapter from the cube and ordinary intersection degrees. *Needs:* AS A6.3; §0.19; SF ordinary intersection degrees.

**Checks.**

- A point generates 0
- x+B generates B
- an Abel–Jacobi curve generates its Jacobian.
- Symmetry of L is required in the displayed addition estimate.
- A subvariety of a translate x+B of a proper abelian subvariety B generates at most B, even when x∉B.

### 5.4 The Ueno locus

In char0 over k̄, `uenoLocus X=⋃{a+B⊂X:dimB>0}`. API: membership, translation, base change, closedness (§5.4c), complement `cosetFreeOpen`, and monotonicity (X′)°⊇X°∩X′ for closed X′⊆X. Integral X is entirely Ueno iff its stabilizer has positive dimension; reducible X is tested componentwise. Sources: Rémond *Décompte* Theorem 1.2/§4 pp.529–537; Faltings–Wüstholz §3. *Needs:* §§5.1–4c.

**Checks.**

- A point has empty Ueno locus
- a positive-dimensional coset is entirely Ueno
- a genus≥2 curve in its Jacobian has empty Ueno locus.
- A union of a coset and an isolated point is not entirely Ueno.
- The Ueno locus contains non-torsion cosets x+B, so it is not a union of torsion cosets.

### 5.4a Bounding maximal coset directions

Integral X/char0, d=dimX, D=deg_LX, maximal a+B⊂X, h=dimB>0:
`deg_LB≤D^((d−h+2)²/4).`
Translate a=0. Generic translates containing B isolate e-dimensional V with B a stabilizer component, degV≤D^(d−e+1); exclude each extra component or contradict maximality. Another e−h+1 intersections give degB≤(degV)^(e−h+1). Maximize (d−e+1)(e−h+1). This bounds directions, not translates. Source: Rémond *Décompte*, Lemma 4.6 and its proof, pp.535–536. *Needs:* §5.2; Bézout/component avoidance.

**Checks.**

- X=B gives h=d and bound deg B≤D
- h=0 is excluded.
- Infinitely many translates of one bounded direction are compatible with the theorem.

### 5.4b Finitely many bounded abelian directions

`abelianSubvarieties_boundedDegree_finite`: for polarized A in characteristic zero, the h-dimensional abelian B with deg B≤δ form a finite set, bounded in terms of dim A, deg A, h, δ. Over ℂ write A=V/Λ. The Riemann form E is integral, although the associated positive real metric need not have integral Gram matrix. For greedy minima μ₁≤…≤μ_n, stretch the j-th coordinate of an adapted orthonormal flag by μ_j⁻¹. Every nonzero transformed lattice vector has norm≥1; Minkowski gives ∏μ_j≤2^n covol(Λ)/vol(B₁). Saturate each flag and round coefficients to obtain a basis ‖v_j‖≤(3/2)^(j−1)μ_j: its primitive quotient generator has projection≤μ_j, and subtracting half-integer combinations costs at most ½Σ_(i<j)‖v_i‖.

Integrality gives E(u,v)=0 if ‖u‖‖v‖<1. The nonzero Pfaffian and uncrossing a matching give μ_jμ_(2g+1−j)≥1. The product bound therefore bounds each paired product above; likewise for Λ∩W, since h!covol(Λ∩W)=deg B. Let D₀≥1 bound both sets of paired products. Split ambient indices where μ_(j+1)>D₀μ_j, pairing opposite blocks. Across a split, iv₁, …, iv_j are orthogonal to the first 2g−j flag; the corresponding projection of W is spanned by iw₁, …, iw_k, where k counts its minima in the first j flag. Paired-product bounds give ‖w_k‖≤D₀μ_j. Write w_k=Σa_(kj)v_j; the wedge/covolume formula gives |a_(kj)|≤C_g‖w_k‖/μ_j. Retain matching-block coefficients only: each is ≤C_gD₀^(2g+1). They determine W, since at the first differing minimum vector its difference lies in the earlier ambient flag whose i-image is already determined; applying i⁻¹ contradicts that first difference. There are finitely many such integral matrices. Any finite family in characteristic zero descends to a finitely generated field embeddable in ℂ; the uniform bound thus proves general finiteness. API: minima flag, rounded basis, paired-product bounds, block encoding and uniform cardinal bound. Source: Rémond §4 Propositions 4.1–4.3/Lemmas 4.1–4.5 pp.529–535. *Needs:* AS A5.1–A5.4; native real lattices/Minkowski and alternating forms, not an integral positive metric.

**Checks.**

- h=0, g give only 0, A
- E² has infinitely many directions without the cutoff.
- Minima are lengths, not squared lengths.
- Saturation is needed for a lattice basis.
- Arbitrary real subspaces do not satisfy the rational-lattice conclusion.

### 5.4c Closedness and orthogonal complements

The bounded finite directions from §§5.4a–b make the Ueno locus closed: for each B, cosets in X form the closed locus {a:a+B⊂X}, obtained by proper incidence; take its finite union. Define `orthogonalComplement B L=ker(i∨λ_L)⁰_red`. Poincaré reducibility gives an isogeny B×C→A of degree N with N≤(deg_L B/h!)², and
`binom(g,h) deg_L B deg_L C=N deg_L A.`
Restrict λ_L to B; its kernel has size (deg_L B/h!)² and controls B∩C. Orthogonality kills mixed terms in the pullback of L, proving the identity. For each quotient image Y⊂A/B, generic translates cut a carrier in X of degree≤D^(d+2); induction supplies a bound for quotient degrees. Sources: Rémond §4, Lemmas 4.6–4.7 and Corollary 4.1 with its proof, pp.535–537; Bertrand, *Duality on tori and multiplicative dependence relations*, Théorème 3, for the controlled complement. The displayed orthogonal-complement identity follows from AS polarization duality and the ordinary degree projection formula. *Needs:* §§5.2–4b; AbelianSchemesAndArithmeticModuli §A6.5; ordinary degree projection.

**Checks.**

- B=0 gives C=A, N=1
- B=A gives C=0.
- For diagonal B and antidiagonal C in product-polarized E², deg B=deg C=2, deg A=2, N=4, so 2·2·2=4·2.
- Omitting binom(g,h) fails this example.

### 5.5 Finite-rank subgroups

`HasFiniteRank Γ` means dim_ℚ(ℚ⊗ℤΓ)<∞. Equivalently (`finiteRank_iff_le_divisionHull`) Γ lies in the division hull of a finitely generated subgroup: choose tensor generators/clear individual denominators, allowing torsion. API: `HasFiniteRank.of_fg`, subgroups, images, sums, isogenies, division hull. Source: Poonen *Mordell–Lang plus Bogomolov* §2 p.2. *Needs:* native tensor/FiniteDimensional; §1.1.

**Checks.**

- ℤ^r has rank r
- ℚ has rank one but is not finitely generated
- every torsion group has rank zero, including an infinite torsion subgroup.
- The countable free abelian group ℕ→₀ℤ has infinite rational rank and fails `HasFiniteRank`: its standard basis remains linearly independent after tensoring with ℚ.
- The division hull of A(K) in A(K̄) has rank rk A(K); for dim A>0, A(K̄)_tors has rank zero and is not finitely generated.

### 5.6 Manin–Mumford in characteristic zero

Algebraically closed char0, A abelian, X closed: `torsionClosure_isTorsionSubvariety`, the reduced closure of X∩A_tors is a finite union of torsion cosets. Spread over finite-type ℚ, use §§5.6a–d, extend scalars; quotient full stabilizers/induct on dimension. Sources: Roessler *Note* Lemma 0 p.2 and §2 pp.6–10 for this route; Pink–Rössler 2002 Theorems 1.1 and 2.1 pp.539–540 for the original route through Serre's ramification theorem. *Needs:* §§5.1–6d.

**Checks.**

- Every torsion coset is torsion-dense
- a nontorsion singleton has empty torsion intersection
- a genus≥2 curve has finitely many torsion points.
- The conclusion is finite union, including the empty union.

### 5.6a Faithful local embeddings

Finitely generated char0 E embeds faithfully in finite L/ℚ_p, p odd, with specified abelian varieties good. Choose a smooth closed fibre in an integral model's good locus, algebraically independent p-adic lifts of a separating basis, then Hensel-lift the finite étale part. Algebraic independence ensures injectivity. Hilbert incidence/finite torsion levels preserve torsion density after algebraically closed extension. Source: Roessler *Note* Proposition 6 p.6. *Needs:* spreading/Hensel, §1.8.

**Checks.**

- E=ℚ(t) must send t to a transcendental p-adic element, not a rational specialization
- p=2 is avoided for Boxall.
- A finite extension of ℚ embeds after choosing a compatible place.

### 5.6b Formal torsion and displacement

`unramifiedFormalTorsion_finite`: good-reduction A/L finite p-adic has finite formal torsion over L^nr. The logarithm is injective at valuation>e/(p−1); fixed e makes one p-power enter this radius, so a finite flat kernel bounds torsion. `boxall_displacement`: p odd, A[p]⊂A(L), p-primary P∉A(L) give σP−P∈A[p]∖0. At the last rational p-level expand σ^p using (σ−1)², (σ−1)³; the cubic congruence handles p=3. Sources: Roessler *Note* Proposition 3 (Boxall) pp.4–5 and Theorem 4 p.5. *Needs:* §1.15b, flat kernels, Galois.

**Checks.**

- Fixed unramified e is essential
- deep formal points are torsion-free.
- The displacement is nonzero
- σ=id does not qualify.
- The odd-p congruence does not assert the same lemma at p=2.

### 5.6c Expanding Frobenius

Good reduction over 𝔽_q gives an integral Frobenius polynomial with roots |α|=√q>1; AS Weil/Rosati and faithful prime-to-p Tate realization transfer it. Own `expandingInvariant_isTorsionCoset`: irreducible F-periodic X for an isogeny with |α|>1 is a torsion coset. Quotient StabX; cycle pullback degree then contradicts finite-stabilizer generic finiteness (each missing expanding factor has product>1). Periodic points are torsion since F^r−1 is an isogeny. Sources: Roessler *Note* Proposition 1, Corollary 2 and Theorem 5 pp.3–5; Pink–Rössler 2002 Theorem 2.2, Theorem 2.4 and Lemmas 2.5–2.6 pp.541–543. *Needs:* §§5.2–3; SF §§5.2, 5.6 cycle pushforward and intersection products; polarizations.

**Checks.**

- q=1 is excluded
- F=id preserves arbitrary subvarieties. [m], |m|>1, is expanding
- a fixed point is killed by [m−1], not necessarily zero.

### 5.6d From local torsion to all torsion

The Frobenius polynomial kills unramified prime-to-p torsion under arithmetic Frobenius. Its companion isogeny preserves the closure of torsion tuples in A^m; §5.6c/projection gives torsion cosets. Enlarge L to contain unramified formal torsion/A[p]; §5.6b puts remaining points in X∩(X−t), 0≠t∈A[p]. First quotient full StabX, then these intersections are proper. Finite t and dimension induction finish; quotients retain good reduction after extension. Source: Roessler *Note* §2, Propositions 7–8 pp.6–10. *Needs:* §§1.0, 1.8, 5.6a–c.

**Checks.**

- A torsion coset is preserved by this argument
- infinite-order points are not asserted unramified.
- A nontrivial stabilizer must be divided out before calling every intersection proper.

### 5.7 Positive-characteristic Manin–Mumford

Algebraically closed char p, A with trivial geometric F̄_p-trace, X closed: the reduced torsion closure is a torsion subvariety. Generally a torsion-dense X combines a torsion translate, abelian direction, and an F̄_p-subvariety. Source: Pink–Rössler 2004 Theorems 3.1, 3.6 and 3.7 pp.5–7, §§8–9 pp.15–20. *Needs:* §§5.7a–d, 1.9a.

**Checks.**

- A constant higher-genus curve can be torsion-dense over F̄_p and need not be a coset
- trivial trace is essential.
- Torsion cosets satisfy the theorem
- the empty closure is allowed.
- With trivial geometric trace, a curve of genus≥2 in A meets A_tors in a finite set.

### 5.7a Connected Dieudonné theory

For perfect char-p k, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.5, R07.2.8–R07.2.11 and R07.2.28a–R07.2.29 supply `DieudonneRing`, `DieudonneModule`, `dieudonnePDivisible` and `wittCovectors`, including p=2. Define `ConnectedDieudonneModule` as the full subcategory of their finite-free W(k)-modules with topologically nilpotent F. Restrict the supplied anti-equivalence to connected p-divisible groups and their associated finite-height formal groups: connectedness means F is nilpotent modulo p, and finite freeness identifies this with topological nilpotence. Inverting p uses native `WittVector.Isocrystal` and its morphisms/equivalences.

Own the comparison with Fontaine's covector normalization M_B(G)=Hom(G,CW_k): the supplier's crystalline module is M(G)=σ\*M_B(G). The covector quotient M_B(G)/FM_B(G) identifies with the cotangent space ω_G; consequently M(G)/FM(G)=σ_k\*ω_G, with the scalar pullback retained. Transport the operators, morphisms, exactness, perfect-base change and isogeny finite-length cokernels through this comparison. Cartier duality is taken in the supplier's ambient category, since the dual of a connected group need not be connected. Sections 5.7b–d supply the additional commuting-isogeny weights. Source: Fontaine §§0.4–6 pp.3–6, III §§1, 4 pp.125–132, 143–151, especially Proposition 4.3 pp.146–147; the supplier §§R07.2.9–R07.2.11, R07.2.29 for scalar normalization. *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.5, R07.2.8–R07.2.11, R07.2.28a–R07.2.29; §§1.15a–b; native Witt.

**Checks.**

- Zero module corresponds to the trivial formal group
- a height-one connected example has FV=p (at p=2 the linearized factors 2 and 1 multiply to 2, not 1)
- arbitrary finite free modules with invertible F are excluded from the connected category.
- Interchanging covariance without interchanging F, V gives the wrong cotangent quotient.
- On μ_(p^∞), F=pσ and V=σ⁻¹ give a connected rank-one object; its Cartier dual ℚ_p/ℤ_p has invertible F and lies outside this subcategory.
- On the finite kernel α_p over k containing a∉𝔽_p, the map x↦ax acts by a on the covector cotangent quotient but by a^p after σ_k\*; omitting the scalar twist breaks naturality.

### 5.7b Slopes with a commuting isogeny

On a connected Dieudonné module over algebraically closed k of characteristic p, let φ be an injective W(k)-linear endomorphism commuting with F and invertible after inverting p. Refine the supplied isoclinic decomposition by φ-valuations: F-slope β>0 and φ-valuation γ≥0 give `formalWeight=γ/β`. For integers r≥0, s>0 with r/s=γ/β and a finite W(k)-lattice N in that summand, form `M_(β,γ) = Σ_(i,j∈ℤ, ir+js≥0) φ^i F^j N`. The scalar valuation is `iγ+jβ=(ir+js)β/s≥0`; the remaining unit-slope factors have uniformly bounded denominators, so M is finite free. It is F- and φ-stable and `φ^s M=F^r M`. Choosing N with pN⊂FN retains pM⊂FM. API: generalized summands, functoriality, bounded-denominator lattices, formal products up to isogeny. Lift through §5.7a. Source: Pink–Rössler 2004 §8, Lemma 8.2, Proposition 8.3, Theorem 8.5 and Proposition 8.6 pp.16–18. *Needs:* §5.7a; CrystallineCohomology §CR.4.7; native primary decomposition.

**Checks.**

- A Frobenius isogeny with γ=β gives weight 1.
- For `N=W(k)`, `F=pσ`, `φ=id`, take r=0, s=1. The condition j≥0 gives M=N and weight zero. Summing `F^i φ^j N` under that condition instead gives W(k)[1/p], not a lattice.
- φ=[p] gives 1/β. β=0 is excluded on the connected formal part, so no division by zero occurs.
- Supersingular slope 1/2 is retained.

### 5.7c Finite jets and algebraization

`invariant_finiteStabilizer_bijective`: for an isogeny φ and ψ=φ+a with ψ(X)=X, integral X and finite full stabilizer, ψ|X and φ|⟨X−X⟩ are geometrically bijective. The generating difference map intertwines the product ψ-action with φ on the generated abelian subvariety. Generic fibre size #(kerφ∩StabX) has bounded powers, hence equals one. Normalize, then descend through the proper finite equivalence relation/generating addition map; retain scheme lengths separately.

`finiteJet_translationRigidity`: large translated jets of X_reg give a generically immersive Grassmannian map modulo full StabX. Faithful completion identifies equal completed ideals; noetherian stabilization supplies a finite jet, including infinitesimal directions. `periodicPoints_dense`: if φ has no root-of-unity eigenvalues, spread over a regular finite-field base. Graph/diagonal intersections have dimension≥base and are quasi-finite (φ^n−1 isogeny), hence dominate; finite-fibre bijectivity makes all such points periodic. Root-of-unity unipotence has finite order on each char-p jet; rigidity handles that part. Prime-to-p torsion detects generic stabilizer constancy.

`formalInvariant_splitsWeights`: formally smooth φ-stable subschemes in ∏G_α split by weights. Lang on GL/additive jet quotients gives φ^s(x)=x^(p^r) on positive weight; first-monomial comparison kills unequal-weight maps, separating invertible weight zero. `formalFactors_algebraize`: complementary finite-neighborhood transporters form a descending chain of closed coefficient subschemes. Their defining ideals form an ascending chain in a fixed Noetherian coefficient ring and stabilize, including the scheme structure. A component completes to the formal factor modulo finite stabilizer; alternating sums generate A_α. Quotient ∏A_α→A's finite, possibly nonreduced kernel; φ^s becomes Frobenius^r followed by separable isogeny. Source: Pink–Rössler 2004 Propositions 4.5 and 5.1–5.4, §§6–7, Proposition 8.6, Lemma 8.7, Theorem 8.8 and Lemmas 9.1–9.2, pp.8–20. *Needs:* §§5.2–3, 5.7a–b; completions/Hilbert/normalization; RG2 §RG2.3.7; AS A3.3.

**Checks.**

- In `k[t]`, `(t) ⊋ (t²) ⊋ ⋯` does not stabilize; Noetherianity controls ascending ideals and descending closed subschemes.
- For X={x} with x≠0, φ=[2] and a=−x, ψ fixes X but sends 0 to −x. The difference-generated subgroup is {0}, preserved by φ rather than ψ.
- Equal tangent spaces alone do not algebraize
- formal smoothness is required for splitting
- finite nonreduced kernels are retained. φ=id has weight zero and permits arbitrary X.

### 5.7d Constant factors and specialization

`positiveWeight_descendsFiniteField`: positive pure-weight (A,X,φ) descends up to isogeny to F̄_p. The immersive jet map embeds X generically in a Grassmannian. Cyclic linear closure has bounded periodic orbits modulo its identity component; a nontrivial unipotent closure gives an impossible A¹ in A. Lang gives a semilinear fixed basis. Specializing/summing periodic translates gives an invariant ample divisor (finite stabilizer); its finitely generated section algebra and Proj descend X/⟨X−X⟩.

`allTorsion_specialization`: on a constant-p-rank stratum, p^n-kernels have fixed geometric-component number, specializing bijectively after strict henselization; prime-to-p levels are étale. Dense all-torsion yields the companion-invariant variety. Sections 5.7b–c separate constant positive factors, mapping through the trace, from weight-zero abelian directions; trace zero kills the former. Source: Pink–Rössler 2004 §§6–7, 9 pp.10–15, 19–20. *Needs:* §§1.9a, 5.7a–c; AS flat torsion/ampleness.

**Checks.**

- Constant curves survive with nonzero trace
- trace zero eliminates their images.
- Specialization on a changing p-rank stratum is not asserted injective.
- The identity eigenvalue is treated by the abelian direction, not by positive-weight descent.

### 5.8 Uniformity in families

Let A be as in §5.6 or §5.7, V an irreducible quasi-projective variety over the same algebraically closed field and Y⊆V×A an irreducible closed subvariety with fibres Y_v. `uniformTorsionClosure`: there are a finite set 𝓜 of abelian subvarieties of A and an integer D such that for every v∈V the closure of Y_v∩A_tors is a union of at most D translates of members of 𝓜 by torsion points. Sources: Scanlon, *Automatic uniformity*, Theorem 2.4 p.2, proof pp.3–6; GH Theorem 3.2 p.13 (characteristic-zero application). *Needs:* §5.8a.

**Checks.**

- Constant family inherits its one bound
- empty fibres contribute zero
- fibres equal to A have one component despite infinitely many torsion points.

### 5.8a Automatic uniformity

`automaticUniformity`: let k be algebraically closed, Y quasi-projective over k, and Ξ⊂Y(k). An irreducible subvariety of Y^m is Ξ-special when its intersection with Ξ^m is Zariski dense. Assume that, in every Cartesian power, every irreducible component of an intersection of two Ξ-special varieties which meets Ξ^m is itself Ξ-special. Then for every algebraic family Z⊂Y×B there is a constructible family whose fibres include all reduced closures of Z_b∩Ξ. Constructible input families follow by finite stratification. `denseSubsets_uniform`: finite-dimensional coefficient duals are spanned by finitely many Ξ-evaluations; Chevalley makes density constructible. Failure of finite uniform special descriptions gives, by first-order compactness with predicate Ξ, an elementary extension violating closure. Finite evaluation tests descend the contradiction. All powers/intersections then bound Hilbert data/component degrees. Compactness uses native first-order finite satisfiability, or is owned here; no stronger torsion theorem is assumed. Source: Scanlon, *Automatic uniformity*, §§2–3 pp.2–6, especially Theorem 2.4. *Needs:* logic compactness, Chevalley, §§5.6–7.

**Checks.**

- Empty Ξ gives empty closures
- a dense Ξ yields closures equal to Z_b where appropriate.
- For Ξ=ℕ²⊂A²(ℂ), x+y=b meets Ξ in b+1 points when b∈ℕ, so pointwise finiteness does not give automatic uniformity (Scanlon §4 p.6).

### 5.9 Rational points on abelian subvarieties

For an abelian variety A over a number field K and closed X⊂A, prove `rationalPointsClosure_cosets`: the reduced closure of X(K) is a finite union of translates of abelian subvarieties, each containing a K-point. In particular X outside its Ueno locus has finitely many K-points. Sections 5.9a–f supply the higher-dimensional gap argument; §1.7 supplies finite generation. Sources: Faltings, *Diophantine approximation on abelian varieties*, Theorem 1 pp.549–550; Rémond, *Inégalité de Vojta en dimension supérieure*, Theorem 1.2 pp.102–103. *Needs:* §§5.9a–f.

**Checks.**

- For X=A the closure is the algebraic subgroup generated by A(K). For E:y²=x³−x over ℚ it is the four-point subgroup E[2]; Zariski-dense A(K) gives A.
- a point gives one point or ∅
- a genus≥2 curve gives finitely many points.
- Positive-rank elliptic curves need not have finitely many points.

### 5.9a The geometric product theorem

On ∏ℙ^(n_i) in characteristic zero, for f∈H⁰(O(r₁,…,r_m)), r_i>0, define `blockIndex f x` as the least Σ|α_i|/r_i of a nonzero divided jet. Define `blockIndexLocus f t` by jets of weight<t. API: closed ideal, base change, antitonicity in t, frame independence and differential containment I_t→I_(t−b) for an operator of weight≤b. The divided chain rule glues the lower-jet ideals within each block. **Checks.**

- zero f has infinite index
- a unit has index zero
- a coordinate monomial has index Σexponent_i/r_i
- changes mixing blocks are excluded.

For fixed n_i, b>0, there are R, C such that r_i/r_(i+1)≥R and a common irreducible component Z of the loci at t and t+b imply Z=∏Z_i over its constants, deg Z_i≤C, and bounded constant-field degree. Over a number field, with integral coefficients bounded at embeddings by C_v,
`Σ r_i h_FS(Z_i)≤C(Σ_v log C_v+Σ r_i).`
Filter the generic tangent space by factors, ranks s_i. The index gap forces multiplicity≥c∏r_i^(n_i−s_i), by a rectangular box of transverse divided monomials. Multihomogeneous Bézout bounds Z·∏H_i^e_i. Projection dimensions give nonpositive powers of successive degree ratios; a negative power would make a positive integer<1. Thus the only nonzero mixed intersection is e_i=s_i, forcing a product and bounding degrees. Sum conjugates for constants. Arithmetic Bézout, positivity and derivative coefficient growth exp(cΣr_i) give the height bound. In applications a chain longer than total dimension supplies the common component; arbitrary high-index components need not be products. Source: Faltings Theorems 3.1, 3.3/Remark 3.2 pp.560–563, Propositions 2.3, 2.17 pp.551–552, 558–559. *Needs:* §§5.9b, 5.17a; scheme multidegrees/Bézout; DiophantineApproximation polynomial jets.

### 5.9b Projective heights and controlled projections

For a pure d-cycle Z define `projectiveCycleHeight(Z)=arithmeticIntersection(Ō(1),…,Ō(1);Z)/[K:ℚ]`, with d+1 factors, the Fubini–Study metric at infinity and the standard projective integral-model metrics at finite places (§5.17a). Fix the embedding and its degree convention. API: add effective cycles, projection, arithmetic Bézout and coefficient-height comparison; projective cycle heights are nonnegative in the chosen normalization. Prove these recursively by Cartier sections, coordinate averaging and Jensen, retaining the coefficient maximum and degree error; this uses the divisor action, not the later general minima inequality. **Checks.**

- A coordinate point has height zero; [1:2] over ℚ has Fubini–Study height ½ log 5 (ArakelovGeometryAndAbelianHeights §1.14).
- multiplicity two doubles degree and unnormalized height
- Rescaling every archimedean line norm by e^(−t) adds (d+1)t·deg Z, so nonnegativity is tied to the chosen metric.
- On ℙ¹_ℚ with O(1), this shift adds 2t; on a degree-one point it adds t.

Own `boundedProjectionPresentation`: a degree-D variety in ℙ^n has a finite linear projection and monic coordinate equations with degrees/heights bounded in D, n and its projective height. Choose a projection outside its Chow discriminant using a bounded integer grid (a polynomial of bounded degree cannot vanish on every grid point). The primitive-element equation has degree≤D and discriminant degree≤D(D−1); coefficient extraction from the Chow form bounds heights. Residual coordinate integrality gives the monic equations used in §5.9e. Source: Rémond, *Vojta*, §2 pp.107–110 and §5 pp.123–134; Faltings §2 pp.550–559. *Needs:* §5.17a; ArakelovGeometryAndAbelianHeights §1.14 for the point normalization; scheme Chow forms/finite projections; native polynomial interpolation.

**Checks.**

- A projection meeting the centre need not be finite
- a singular variety is allowed
- scaling a Chow form changes coefficient representatives but not normalized projective height.

### 5.9c Difference bundles outside the Ueno locus

For integral Y_i⊂A not contained in their Ueno loci, m>d=max dim Y_i, and separated positive weights a_i, define β_a(x)=(a_i x_i−a_(i+1)x_(i+1))\_i. Put N_a=⊠L^(η_i a_i²), η endpoints 1 and interiors 2, and Q_(a,D)=β_a\*(⊠L)^D⊗N_a^(−εD), after clearing denominators. API: mixed intersection, cubic-theorem expansion, section lower bound. The Poincaré cross term has sign −Da_i a_(i+1). For m=d+1, the ordinary consecutive-difference map on the Y_i is generically finite: a positive-dimensional generic fibre would have a translating direction contained in every factor, hence in its Ueno locus. Top intersections therefore have a positive coefficient times ∏a_i^(2dimY_i). Bézout bounds every term lost to εN_a; choose ε≤u⁻¹(4m)^(−u)∏deg(Y_i)⁻¹, u=Σdim Y_i. Own `nefDifference_sections`: on an integral projective u-fold, u≥1, in characteristic zero, nef rational bundles M, N with N ample satisfy liminf_(D→∞)u!h⁰(D(M−tN))/D^u≥M^u−utM^(u−1)N for rational t≥0, with divisible D. First replace M by M+ηN, η>0, and make N very ample. A fixed effective N-divisor and the exact restriction sequences bound the loss on subtracting D(t+η)N by D(t+η) times the section dimension on that divisor. Multiplication by a nonzero section of N restricted to it bounds every successive restriction by the first. Serre vanishing and geometric Riemann–Roch give its leading coefficient ((M+ηN)^(u−1)N)/(u−1)!, while the ambient leading coefficient is (M+ηN)^u/u!. Let D tend to infinity before η tends to zero; reduced divisor components and their finite filtrations give the same degree bound. Apply this inequality to β_a\*(⊠L) and N_a. The preceding mixed-intersection estimate gives h⁰(Q_(a,D))≥D^u∏a_i^(2dimY_i)/(4u!) for large divisible D, with fixed weights before D→∞. Source: Rémond, *Vojta*, §5 pp.123–134, §6 pp.134–147. *Needs:* §§5.3–4c, 5.9b; AlgebraicModuli asymptotic coherent cohomology; theorem of the cube.

**Checks.**

- At t=0 the section bound recovers the nef volume
- for a curve it is the degree bound deg M−t deg N
- a negative lower bound asserts no positive section count. m=1 does not give this positivity
- an abelian coset factor violates the Ueno assumption.
- For two points the cross term is negative, giving ĥ(aP−bQ), not ĥ(aP+bQ).

### 5.9d Large multiplication without exponential complexity

Own `multiplication_polynomialPresentation`: for n≥1 on a fixed projectively normal symmetric ample embedding of an abelian variety, multiplication by n and the weighted differences admit coordinate presentations of degree O(n²) and coefficient height O(n²), uniformly in n. Use quartic duplication and the addition-law coordinate charts, padding the degree to f(n)=⌊(n²−1)/8⌋ in the auxiliary recursion; the parallelogram/cube identity controls base loci and repeated additions. The resulting evaluation height is the canonical quadratic height plus O(n²), with constants independent of n. Source: Rémond, *Vojta*, §3 pp.110–117, §§4–5 pp.117–134. *Needs:* §§0.19, 0.25, 5.9b.

**Checks.**

- n=0 gives the constant zero map
- n=1 is the identity
- doubling has quadratic canonical-height factor 4.
- A naive iterated-addition coefficient bound exponential in n is insufficient for the next theorem.

### 5.9e Small sections and dimension descent

Own `weightedGap_smallSection` and `weightedGap_jetLowerBound` on the arbitrary-dimensional products Y=∏Y_i and difference bundles Q_(a,D) of §5.9c, over a fixed number field. Fix the Y_i, their §5.9b controlled presentations and the rational ε before choosing the separated positive weights a_i. Take large divisible D only after fixing those weights. Express sections in the monic coordinate bases and write the Koszul compatibility matrix by cross-multiplication. Prove that its kernel has a fixed proportional excess of unknowns over rank, using §5.9c's h⁰ bound, and bound row heights by C DΣa_i² using §5.9d. Apply DiophantineApproximationAndTranscendence §2.8’s `siegelRelativeKernelBasis` directly to obtain a nonzero section represented by a polynomial family F with h(F)≤C DΣa_i². The constants depend on the fixed presentations and ε, independently of a and D.

For the jet estimate, use the controlled projections to choose étale multiblock parameters on the smooth loci, with all ramification denominators nonzero at the tuple. Construct divided derivatives in each block; bound implicit-derivative denominators linearly in derivative order, retaining the heights of the fixed defining equations, and control differentiated transition coefficients uniformly in the block degrees r_i=O(Da_i²). At the first nonzero weighted jet α=(α_i), all lower jets vanish, so frame changes contribute only the leading term. The product formula gives
`h_Q(x)≥−h(F)−CΣ_i(|α_i|(h_i(x_i)+1)+r_i)−o_a(D)`,
where h_i is the fixed projective point height on Y_i and o_a(D)/D→0 for each fixed weight tuple. API: multiblock local parameters, divided jets, frame/base-change compatibility, denominator and transition bounds, compatibility-matrix rank and row heights, the small section and its nonzero-jet lower bound. Points outside these parameter charts enter dimension descent on their proper exceptional loci. At nearly parallel points with balanced a_i²ĥ(x_i), Q's height is negative enough that this lower bound excludes every low-weight nonzero jet; hence the tuple has large index. Sections 5.10a–c specialize these constructions to curves and two blocks.

A long chain of weighted index loci has a common component at two separated levels. Section 5.9a makes it a product of lower-degree factors with controlled weighted heights. Norm projection and factor-height bounds retain the selected tuple. Induct on dimension, replacing factors by those proper components, until a factor lies in the Ueno locus or a point has bounded height. All dimension/degree/height constants are chosen before the a_i; D tends to infinity only after the weights are fixed. Source: Rémond, *Vojta*, §§5–7 pp.123–150, especially Proposition 5.1, §§5.2–5.6 and Proposition 6.1/§§6.1–6.2; *Sur le théorème du produit*, §2 p.292 and §§3–5 pp.293–301; Faltings §3 pp.560–563. *Needs:* §§5.9a–d; DiophantineApproximationAndTranscendence §2.8 relative-field Siegel estimates; the product formula and local frames.

**Checks.**

- A point of bounded height is an allowed terminal case
- Ueno factors are not declared finite.
- Interchanging D→∞ with unbounded weights would invalidate the error estimate.
- Three factors of dimension two require two local parameters per block; the monomial u_(1,1)u_(2,2)²u_(3,1)³ has weighted index 1/r₁+2/r₂+3/r₃.
- A unit frame change preserves the first nonzero weighted jet when lower jets vanish; mixing parameters from different blocks need not preserve its weight.
- A projection ramification point, where an implicit-equation derivative denominator vanishes, is excluded from that jet chart and belongs to the proper-locus descent.
- A compatibility matrix of full column rank supplies no nonzero section; the proportional kernel excess is required before applying Siegel's estimate.

### 5.9f From the gap to cosets

For m=dim X+1 the preceding finite dimension descent yields constants C₁, C₂, C₃, fixed for X, L, K, forbidding m coset-free points with heights≥C₁, successive ratios≥C₂ and pairwise canonical angles sufficiently close (threshold 1−1/C₃). Cover the finite-dimensional Mordell–Weil real space by finitely many such cones. Northcott and the gap make each cone finite on X outside Ueno: any infinite unbounded set would supply the forbidden separated tuple. For each remaining direction B, choose its controlled complement C (§5.4c); B(K)+C(K) has finite index in A(K) because the isogeny cokernel is controlled by a finite Kummer group. Intersect each coset with translates of C and induct on dimension. After a finite field extension the directions descend; take Galois intersections to recover K-closures. This proves §5.9's finite union. Source: Rémond, *Vojta*, §7 pp.148–150; *Décompte*, proof of Theorem 1.2 pp.535–537. *Needs:* §§1.7, 5.4c, 5.9e.

**Checks.**

- Rank zero gives a finite group
- rank one needs only two cones.
- A finite-dimensional vector space without Northcott can contain infinitely many bounded points, so finite rank alone is insufficient here.

### 5.10 Vojta's inequality for curves

`vojta_inequality`: for a smooth projective genus-g≥2 curve over a number field, embedded in its Jacobian by a degree-one class (§5.10e), with `L = O(Theta + [−1]*Theta)` and angle pairing `b_L/2 = b_Theta`, there exist C₁, C₂ such that large points z, w with ‖w‖≥C₂‖z‖ satisfy ⟨z,w⟩≤(3/4)‖z‖‖w‖. Constants may depend on the curve and degree-one embedding with this fixed theta normalization; they are not effective unless the required auxiliary data is effective. Sections 5.10a–e give the proof. Source: Bombieri, *The Mordell conjecture revisited*, Theorem 1 and proof pp.637–638, with erratum p.473. *Needs:* §§5.10a–e.

**Checks.**

- g=1 is excluded: multiples of one point have angle zero and arbitrarily separated heights.
- Torsion and bounded-height points are excluded by the threshold
- 3/4<1 is essential for finite cone covering.
- For a symmetric principal theta bundle M, `L = M²` and `‖z‖² = 2ĥ_M(z)`; using `ĥ_M` itself would require doubling all quadratic coefficients in §5.10e.

### 5.10a Jets and derivative bounds

For a section on C×C of bidegrees (r₁,r₂)>0 define `admissibleJet` as a first nonzero divided derivative in a local frame, minimal in the weighted order i/r₁+j/r₂; the preceding rectangular jets vanish. API: local ideal, frame invariance, derivative order, base change and evaluation. Choose finite maps to ℙ¹ and implicit equations p(x,y)=0. Away from p_y=0, differentiate p=0 recursively; denominators at order ℓ divide p_y^(2ℓ−1), and the universal divided-derivative numerators have combinatorial coefficient bounds in deg p and ℓ. Specializing their coefficient variables to a chosen equation p contributes an additional H_aff(p)^(O(ℓ)), where H_aff(p) is its affine coefficient maximum, including 1. Equivalently retain an O(ℓ)(h_aff(p)+log deg p+1) coefficient-height term; after normalizing one nonzero coefficient to 1, this is controlled by the projective coefficient height. Constants in the application may depend on this fixed presentation. Discriminant and leading-coefficient divisors give one finite exceptional set. **Checks.**

- units have index zero
- t^i u^j has index i/r₁+j/r₂
- zero has no admissible jet.
- For p=y−10⁶x², p_y=1 and y′=2·10⁶x; a degree-only bound of 4⁵=1024 fails.
- The erratum's D(0,z)≠0 condition is included by removing its finite zero locus.

Source: Bombieri §6 p.625 (admissible pairs) and Lemmas 5–6, §7 pp.626–629; erratum p.473. *Needs:* DiophantineApproximation jets, scheme local frames and finite maps.

### 5.10b The lower height from a jet

At an admissible nonzero jet of order (i,j) of an auxiliary section F, product formula and §5.10a give
`h_V(z,w)≥−h(F)−c[i(h(z)+1)+j(h(w)+1)]−c₂(δ₁+δ₂)−o(δ₁+δ₂),`
where δ_i are its projective degrees and the constants depend only on the fixed curve/presentation. Expand all differentiated transition functions; rectangular vanishing kills every lower term. The derivative denominators contribute the displayed i, j height loss. The remainder is taken as the common auxiliary scale→∞ with the ratio fixed. Source: Bombieri Lemmas 3–4, §6 pp.623–626, with Lemma 6, p.628. *Needs:* §§0.16, 5.10a, product formula.

**Checks.**

- Multiplying F by a scalar changes coefficient and evaluation contributions compatibly
- ignoring p_y denominators loses a point-height term.
- No nonzero evaluation, and hence no product-formula lower bound, is asserted at the zero section.

### 5.10c Siegel's lemma and the small section

Fix positive integers d₁, d₂, d with d₁d₂>gd² and put V=d₁F₁+d₂F₂+dΔ′. After fixing their ratio, take t through all sufficiently large multiples of an integer clearing the projective-degree divisibilities. Riemann–Roch gives a fixed proportional excess η>0 in the equations for sections of O(tV). Their leading row heights are O(t(d₁+d₂)); repeated differentiation costs do not introduce a new dependence on d₁/d₂. A nonzero auxiliary section has h(F)≤ct(d₁+d₂)/η, with c depending only on the fixed curve/presentation, uniformly in the ratio; the o-term is for t→∞ after fixing that ratio. Source: Bombieri §3 p.618 (the Vojta divisor) and Lemma 7, §8 pp.629–632. *Needs:* DiophantineApproximationAndTranscendence §2.8’s `siegelKernelBasis`, `siegelRelativeKernelBasis` and `siegelCoefficientConditions`; curve Riemann–Roch; §5.10a.

**Checks.**

- For g=2 and (d₁,d₂,d)=(−2,−2,1), V²=4 but V has degree −2 on either coordinate fibre, so no positive multiple has a nonzero section. Positive self-intersection does not replace the positive-parameter hypotheses.
- q=m gives no conclusion
- rank-zero rows allow a coordinate vector.
- Over ℚ(i) both dimensions double under restriction of scalars, so the ratio m/(q−m) is unchanged.

### 5.10d Norm polynomials and Roth's bound

Project C finitely to ℙ¹, degree N. Choose from a fixed finite set a generator F_i nonzero on the entire selected fibre; finitely many forbidden hyperplanes are avoided over the number field. Its normalized field norm is a polynomial of degree≤N d_i, and the original section's index is at most its norm's index. Retain all conjugate branches and their multiplicities. Factor-height control follows from Mahler/Jensen, not from a Kronecker substitution that can cancel coefficients. Apply the imported two-variable Roth lemma to the norm polynomial, with normalized relative point heights divided by [K:ℚ]. For σ=ε² the weighted degree balance gives index≤4Nε when separation and height thresholds hold. Bombieri's printed derivative step is corrected to ind(Q)−i₁/r₁. Source: Bombieri §9, Roth's Lemma pp.632–636 and Lemma 8 pp.636–637; erratum p.473. *Needs:* §5.10a, DA §1.5 Roth's index estimate; finite norms and ArakelovGeometryAndAbelianHeights §1.13 heights.

**Checks.**

- Nonzero at one branch does not ensure a nonzero norm at the fibre
- the whole-fibre choice does.
- A double branch retains multiplicity two.
- Replacing the corrected minus by multiplication gives the wrong index drop for a first derivative of t².

### 5.10e Balancing the divisor

With the theta normalization of §5.10, prove `b_L/2 = b_Theta` by additivity of canonical heights and `ĥ_([-1]*Theta)(z) = ĥ_Theta(−z)`; the odd part has zero polar form. On C² put Δ′=Δ−F₁−F₂ and V=d₁F₁+d₂F₂+dΔ′, so V²=2d₁d₂−2gd². Choose a fixed ample B=sF₁+sF₂−Δ′; projective degrees are δ_i=(d_i+sd)/N. Canonical heights give
`h_V(z,w)=d₁‖z‖²/(2g)+d₂‖w‖²/(2g)−d⟨z,w⟩+O(d₁‖z‖+d₂‖w‖+d(‖z‖+‖w‖)).`
The linear terms are retained. Fix rational 0<a<g²−g and positive parameter ratios with d₁d₂/d²=g+a and d₁‖z‖²≈d₂‖w‖². Choose positive integers d₁, d₂, d approximating these ratios, with d₁d₂>gd², at a sufficiently large common divisible scale; rounding preserves positivity and the strict inequality. Take all sufficiently large divisible scales after fixing the ratios, as in §5.10c. Sections 5.10b–d bound the index error, then large point heights absorb the linear errors. Let a and ε be small: the cosine bound approaches √(g+a)/g<3/4 for g≥2. A degree-one base divisor is obtained after a fixed finite extension; alternatively clear degrees in deg(P)Q−P. This is the erratum's effectivity correction. Source: Bombieri §3 p.618, §5 Lemmas 1–2 pp.621–622 (theta normalization and height comparison), and Theorem 1/proof, §10 pp.637–638; erratum p.473.

**Checks.**

- (d₁,d₂,d,g)=(2,2,1,2) gives V²=4
- the diagonal cross term is negative.
- For g=1 the limiting bound is 1 and proves no gap.
- The corrected projective height has leading N‖z‖²/(2g), with O(‖z‖), not an O(1) error.

### 5.11 Mumford's gap

For a genus-g≥2 curve `mumford_gap`: for a smooth projective genus-g≥2 curve over a number field, embedded in its Jacobian, with the theta-normalized norm of §5.10, distinct P, Q satisfy (‖P‖²+‖Q‖²)/(2g)−⟨P,Q⟩≥−c(1+‖P‖+‖Q‖). Pulling back the diagonal and comparing its height with the two coordinate divisor heights gives this inequality; the degree-zero comparison contributes the linear error by Cauchy–Schwarz. In a cone with cos(angle)>3/4, if 1≤‖Q‖/‖P‖<2 the quadratic coefficient is negative, uniformly: (1+r²)/(2gr)≤5/8<3/4. Thus for sufficiently large ‖P‖, successive distinct points in that cone have norm ratio≥2, so such a cone contains O(log T) points of norm≤T. Source: Bombieri §4 p.619, §5 Lemmas 1–2 pp.621–622, §10 p.639. *Needs:* §§0.18–21 and curve divisor heights.

**Checks.**

- P=Q is excluded
- g=1 does not give the negative coefficient.
- At g=2, r=2 the coefficient 5/8 has margin 1/8 below 3/4.
- Bounded points over a fixed number field are Northcott-finite.

### 5.12 Mordell by the gap route

Let C be a smooth projective geometrically connected curve of genus≥2 over a number field K. A finite cone covering of the Mordell–Weil real vector space reduces to one narrow cone. Mumford's gap allows only finitely many points in each fixed height-ratio interval. An infinite cone would therefore have unbounded separated heights, contradicting §5.10. Northcott handles bounded height and torsion. This proves finiteness of C(K), hence §4.6, independently of §5.9 and of Shafarevich finiteness. Source: Bombieri §10 pp.637–640. *Needs:* §§1.7, 5.10–11.

**Checks.**

- Rank zero is immediate
- rank one needs two cones.
- The proof gives finiteness without a computable maximum height.

### 5.13 Finite-rank Mordell–Lang

For A over an algebraically closed characteristic-zero field, Γ≤A with finite rational rank, and closed X⊂A, the reduced closure of X∩Γ is a finite union of cosets a+B with a∈Γ. Descend generators of a division hull to a finitely generated E/ℚ; §§5.13a–c reduce to number fields without bounding degrees of division points. Sources: Poonen, *Division group*, Theorem 1 p.2; Hindry Appendix I pp.597–599 (motivation for the specialization route). *Needs:* §§5.5, 5.13a–c.

**Checks.**

- Γ=0 gives ∅ or {0}
- torsion Γ recovers Manin–Mumford
- Γ=ℚP is rank one without being finitely generated.
- Positive characteristic without a trace/Frobenius correction is excluded.
- For a genus≥2 curve in its Jacobian and Γ the division hull of J(K), X∩Γ is finite.

### 5.13a Division groups and moving supports

Let Γ=Γ₀^div⊂A(k̄), Γ₀⊂A(k) finitely generated over a number field. Conjugate differences σx−τx are torsion since some nx lies in Γ₀. For a generic x_i∈X∩Γ concatenate the Galois orbits of all n-tuples of conjugates under (z₁,…,z_n)↦(z₂−z₁,…,z_n−z₁). Their closure is a finite torsion-coset union by §5.6. Passing to subsequences, finite extensions and common multiplication decreases its connected directions; noetherian descent yields a minimal choice, and multiplication kills translations. Choose n>dim A and also minimize the two-point closure.

Own `minimalOrbitDifferenceClosure_product`: one component C of the two-point closure contains ≥1/u of pairs for infinitely many i, where u is the number of components. Galois transitivity makes this fraction exactly 1/#orbit(π_C x_i), so the quotient points have ≤u conjugates. Their torsion differences have degree≤u²; Northcott makes them a finite set. Kill it and use minimality to make the whole closure C. For an n-point component B⊂C^(n−1) containing ≥1/s of tuples, freeze the other coordinates; subtract acceptable pairs. At least 1/s² of pairs lie in each axis subgroup B(q). Apply the same argument in A/B(q), not an undefined quotient of a translate, to force B(q)=C. Kill finite component groups by one multiplication. Thus the n-point closure is C^(n−1). If C=0, x_i are rational over one finite extension and §5.9 applies.

Own `movingSupports_notHaar`: in a flat closed family Y⊂V×S with V projective and fibres of dimension e<dim V, weak limits of measures supported on fibres are supported on an e-dimensional closed subvariety. A subsequence of the Hilbert points converges in the projective Hilbert scheme; closedness of its universal family excludes every compact subset outside the limiting fibre. Generic flatness suffices for generic parameter sequences. The fixed Hilbert polynomial is essential.

Quotient Stab⁰X first. For C>0 the generic fibre of X→π_C X has dimension e<dim C, since equality would make C stabilize X. The difference image of X^n over that quotient has fibre dimension≤ne<(n−1)dim C. The quotient points are rational, so whole Galois orbits are supported on those fibres. A generic subsequence of the torsion differences equidistributes to full-support Haar measure by §5.19, contradicting the preceding lemma. Closed-subset induction recovers all cosets. APIs are the three named targets, torsion differences and division-group Mordell–Lang. Source: Poonen §§6–8 Lemmas 7(8), 10, 12–14 pp.4–8. *Needs:* §§1.0, 1.7, 5.6, 5.9f, 5.19; AlgebraicModuli projective Hilbert/universal family; native weak convergence.

**Checks.**

- Γ₀=0 gives all torsion, whose degrees are unbounded
- Mordell–Weil is used only after the zero-difference reduction.
- Moving points may converge to a point mass, but not to full-dimensional Haar measure.
- Positive stabilizers are removed before the strict dimension inequality.

### 5.13b Injective specialization

Own `finitelyGeneratedField_points_fg`: for E finitely generated over ℚ, A(E) is finitely generated. The constant field k is a number field; §1.10 makes A(E)/Tr(k) finitely generated and §1.7 handles Tr(k).

Own `kummerHilbert_specialization_injective`: finitely many C_j/E admit a dense set of closed specializations s on a common smooth k-model, κ(s) a number field, injective on all C_j(E). Choose ℓ prime to source torsion, extend generators and shrink. Preserve the finite Galois action simultaneously on ℓ-torsion and on division covers of all nonzero classes modulo ℓ. A Galois cover dominating these is made finite over affine space by Noether normalization; Hilbert irreducibility preserves its full permutation action, including the subgroup for E. Hence specialized Kummer classes stay nonzero and no new ℓ-torsion appears. If a nontorsion kernel point is ℓ^r y with y∉ℓC_j(E), target ℓ-torsion-freeness forces y to specialize to zero, contradicting its Kummer class. Prime-to-ℓ source torsion divides uniquely and specializes injectively.

Extend along a valuation of Ē centred at s (a smooth flag provides one). Properness reduces every point. Torsion reduction is injective: all integers are invertible on this equicharacteristic-zero valuation ring, so each finite étale n-kernel has only its identity section reducing to identity after henselization. Thus reduction is injective on C_j(E)^div: nx in C_j(E) reduces to zero, giving nx=0 and then x=0. APIs: the two named targets, `divisionHull_specialization_injective`, simultaneous finite-family and prescribed-open versions. Source: Billingsley Proposition 7/Theorem 10 pp.5–6; these are the abelian/closed-point adapters of its Kummer argument. *Needs:* §§1.7, 1.9–10; IG.2.4 Hilbert irreducibility; scheme finite covers/valuative properness.

**Checks.**

- E:y²=x³−t²x+t² can lose rank at t=2
- arbitrary specialization is excluded.
- Kummer injectivity alone without excluding new ℓ-torsion is insufficient.
- Closed points may have κ(s)≠k.
- The injection is on a specified division hull, not all A(Ē).

### 5.13c Keeping bounded directions under specialization

Own `boundedDirections_relativeFiniteEtale`: for polarized abelian A/S with S integral of finite type over a characteristic-zero field and degree bound δ, its connected abelian subgroups of degree≤δ are parameterized, after shrinking integral S, by a finite étale scheme with universal subgroup. Only Hilbert polynomials (deg B/h!)n^h occur. In their projective relative Hilbert schemes, identity/inverse/addition stability are closed coefficient conditions, using Serre twists of universal ideals on proper flat products. A characteristic-zero subgroup is smooth: its formal logarithm turns its Hopf ideal into a linear ideal, since directional derivatives and division by degree eliminate every higher lowest term. Translation spreads smoothness. Proper smooth component spaces make connectedness open and closed. Fibres are finite by §5.4b. An infinitesimal subgroup deformation is B→Lie(A/B), constant by properness and zero at the identity, so the parameter scheme is unramified. Proper quasi-finite is finite; generic flatness gives étale. A finite extension splits its generic sections. This subsection spreads each resulting generic subgroup and the quotient of §1.0 to abelian schemes after shrinking S to a smooth normal open. Extend the quotient morphism there, identify its scheme-theoretic kernel with the spread subgroup, and prove the fibre and base-change identifications used below. Finite presentation spreads the equations and identities; properness, smoothness and connectedness hold after shrinking. Thus every retained fibre direction lifts together with its quotient.

For `finiteRank_specialization_toNumberField`, fix a geometrically integral X of degree D densely meeting Γ₀^div over finitely generated E. Section 5.4a bounds every maximal coset direction in every retained fibre by one δ. Split the finite list above. Apply §5.13b simultaneously to A and all A/B. In a number-field fibre, §5.13a covers X_s∩Γ_(0,s)^div by finitely many maximal cosets. Each direction lifts to B. Two original points specializing into one coset have difference zero in (A/B)_s; its division-hull injection puts that difference in B already. Thus the original dense set is covered by finitely many generic B-cosets. Irreducibility puts X in one; dim B≤dim X because the special coset lies in X_s, so equality follows. Induct on components. Source: Rémond §4 pp.529–536 for the bounds; the relative Hilbert and simultaneous-quotient argument is the adapter here. *Needs:* §§1.0, 5.4a–b, 5.13a–b; scheme Hilbert/Serre/component spaces; AbelianSchemesAndArithmeticModuli §A6.25 `relativeHom` over locally Noetherian normal bases for morphism extension, and §§A6.3–A6.7 for generic-fibre subgroup theory; spreading subgroups, quotients, kernel identities and base-change comparisons is owned here.

**Checks.**

- Injectivity on A alone does not control quotient coset relations
- include all quotients.
- E² has infinitely many unbounded directions but finitely many below δ.
- A special contained coset need not lift as contained in X until the final density/dimension step.
- For a constant E²/S the diagonal subgroup and quotient (P,Q)↦Q−P spread with their kernel identity; an extra endomorphism in a CM special fibre need not extend to the generic fibre, so the base must be shrunk.

### 5.14 The difference map

Define `differenceMap M:A^(M+1)→A^M` by (x₀,…,x_M)↦(x₁−x₀,…,x_M−x₀). It is a homomorphism, with kernel the diagonal (`differenceMap_eq_zero_iff`); API: projections, translation invariance (`differenceMap_translate`), base change, fibre as common translation intersection. Source: Zhang, *Equidistribution of small points on abelian varieties*, Lemma 3.1 p.163 (consecutive differences, related by an invertible integral change of coordinates). *Needs:* native abelian-variety products and §1.1.

**Checks.**

- M=0 has point target
- M=1 gives Q−P, not P−Q
- (0,P,2P) maps to (P,2P).
- Diagonal tuples map to zero.

### 5.15 Generic injectivity of the difference map

For geometrically integral X⊂A with trivial full stabilizer there exists M₀ such that, for every M≥M₀, `differenceMap` on X^(M+1) is generically finite and birational onto its image in characteristic zero. Successively intersect X−x_i; a positive-dimensional residual intersection yields a common translation stabilizer. Once zero-dimensional, an extra generic point excludes each nonzero residual translation. In positive characteristic retain the separability hypothesis for birationality. With merely finite stabilizer first quotient the entire finite subgroup scheme. Sources: Zhang Lemma 3.1 p.163. *Needs:* §§1.0, 5.2, 5.14.

**Checks.**

- A positive-dimensional coset has positive-dimensional fibres; a singleton coset has zero-dimensional fibres and a one-point image.
- a finite nontrivial stabilizer produces several generic translates until quotiented.
- A geometric singleton has a one-point image and is birational to it.
- On `E/ℚ: y² = x³ + 2`, `X = {x = 0} ≅ Spec ℚ(√2)` is integral with trivial stabilizer, but its two geometric diagonal tuples have equal difference image for every M. Thus geometric integrality is required.
- For a genus≥2 curve C in its Jacobian, the difference map is generically finite on C³.

### 5.16 Minimal torsion subvarieties

Work over k̄ with reduced closed X⊂A_k̄. Define `torsionEnvelope X` by intersecting the supports of all torsion subvarieties containing X and giving the intersection its reduced closed structure. Noetherianity reduces this to a finite intersection. Reduced intersections of torsion cosets are finite unions of torsion cosets, so the result is the least reduced geometric torsion subvariety containing X. For X defined over k, require geometric reducedness and apply this construction to X_k̄. API: containment, minimality, monotonicity, reduced finite unions, torsion translation and `isTorsionSubvariety_iff_eq_torsionEnvelope` on these reduced geometric carriers; for geometrically integral X, `isTorsionCoset_iff_eq_torsionEnvelope`. Both equalities compare geometric closed subvarieties. Its dimension is `torsionDimension`. Source: Zhang §1 p.159 (torsion subvarieties); the intersection adapter uses §§1.0, 5.6. *Needs:* §§5.1, 5.6, 5.13.

**Checks.**

- In characteristic zero let H=E×{0} and T=Δ_E∪Γ_[−1] in E². Their scheme intersection has completed ring k[[u]]/(u²) at 0; their reduced intersection is {0}. The double point is outside the envelope's input carrier, and its reduced support has envelope {0}. This reduction imposes no restriction on §5.2's full stabilizer.
- ∅ has empty envelope
- a torsion point has itself
- an infinite-order point has positive-dimensional envelope.
- A geometrically irreducible X lies in one geometric component of its envelope.
- Two distinct torsion points equal their envelope but do not form one torsion coset; the single-coset criterion requires geometric integrality.
- The geometric base change of the integral closed point `Spec ℚ(√2)` on `y² = x³ + 2` equals its envelope: its geometric points `(0,±√2)` have order three. It is a geometric finite union of torsion cosets, rather than one coset.
- An abelian subvariety B is its own envelope, while x+B with x non-torsion modulo B has a strictly larger one.

### 5.17 Essential minimum

For geometrically integral X over a number field (or a polarized function field, §0.10, where §1.11's trace correction applies), A polarized by symmetric ample L, define `essentialMinimum X=sup_(Y⊊X) inf_(x∈X∖Y) ĥ_L(x)`. Here x and proper closed Y are taken over an algebraic closure. API on geometrically integral X: nonnegativity, torsion-translation invariance, finite-extension compatibility with the relative-height scaling of §§0.9–11 and 0.33 (hence invariance for absolute number-field heights), and equality to the infimum of ε with {ĥ≤ε} geometrically dense. Source: Ullmo Theorem 1.1 p.1; Zhang *Small points* §1 pp.3–9. *Needs:* §§0.19–20.

**Checks.**

- A singleton has its point height
- a torsion coset has minimum zero
- Under finite base extension, a geometrically integral X stays geometrically integral; absolute number-field minimum is unchanged, while relative function-field minimum scales with its point heights.
- a genus≥2 curve through zero has infimum zero but positive essential minimum by §5.18.
- Over function fields a nontorsion constant point may have height zero, so the number-field torsion criterion is not transferred there.

### 5.17a Arithmetic divisor action

For regular projective P/O_K with smooth generic fibre, define `ArithmeticRealForms(P,q)` and `ArithmeticRealCurrents(P,q)` as the real (q,q)-forms and currents on P(ℂ) satisfying `F∞*α = (−1)^q α` under ordinary conjugation pullback. The quotient of currents by ∂- and ∂̄-boundaries is taken in this real parity subspace. With `ddᶜ = (i/2π)∂∂̄`, ddᶜ raises q by one and reverses conjugation parity. API: real linear structure, boundaries, ddᶜ, wedge with real forms and proper current pushforward with the codimension shift. Source: Gillet–Soulé §3.2.1, pp.125–126; §1.2, pp.104–109. **Checks.**

- At q=0 the functions and distributions are conjugation-invariant.
- The Fubini–Study first Chern form on P¹ is anti-invariant and belongs to degree q=1.
- Applying ddᶜ to an invariant function gives an anti-invariant (1,1)-current.

For codimension p≥1, define `ArithmeticCycleClass(P,p)` from pairs (Z,g), where g belongs to `ArithmeticRealCurrents(P,p−1)` modulo boundaries and `ddᶜg + [Z]` is a smooth element of `ArithmeticRealForms(P,p)`. Thus `F∞*g = (−1)^(p−1)g`, and curvature has parity `(−1)^p`. For each integral codimension-(p−1) subvariety i:Y→P and f∈K(Y)×, quotient by `(i_*div_Y(f),−i_*[log|f|²])`. Define the logarithmic current on a normalization of Y and push it properly to P; it has the required parity after the codimension shift, includes singular Y and is independent of the normalization. At p=0 set g=0 and impose no principal-function relations. In codimension one use ArakelovGeometryAndAbelianHeights §1.8’s `ArithmeticChow1` and §1.9’s metrized-line identification. API: addition, cycle, curvature, forms and principal relations with normalization and proper current pushforward. For proper f:P→Q between equidimensional arithmetic varieties with smooth generic-fibre map, class pushforward sends codimension p to `p−r`, where `r = dim P − dim Q`; use nonnegative target codimension. The generic smoothness hypothesis ensures smooth curvature remains smooth after pushforward. Source: Gillet–Soulé §§3.3.1–3.3.4, pp.126–127; Theorem 3.6.1(ii), pp.134–135. **Checks.**

- A principal pair is zero.
- A non-exact smooth change can change its class, and 2[Z] keeps multiplicity two.
- At p=2 a rational function on an integral divisor Y gives an ambient (1,1)-current only after pushing forward its (0,0) logarithmic current.
- At p=0 the class has only its cycle component and no principal-function relation.
- For `i : Spec ℤ → P¹_ℤ`, the pair `([i],0)` has nonsmooth delta curvature at infinity; this closed embedding does not provide the stated class pushforward.
- Projective-space projections are proper with smooth generic-fibre map and satisfy the pushforward hypotheses.

`metrizedDivisorAction` sends hermitian L to Cartier intersection with Green product `g_L[Z] + c₁(L)g`. The invariant function g_L and anti-invariant c₁(L) put this product in `ArithmeticRealCurrents(P,p)`, as required for a codimension-(p+1) class. Semilocal regularity moves its section off generic points; resolve horizontal cycles over char0 to pull back locally integrable logarithms. Reciprocity/Stokes give independence, commutation and tensor additivity, with the projection formula for the class pushforward just specified. `arithmeticDegree` is `Σ length·log N𝔭 + ½Σ_σ∫g`, principal degree zero by product formula. **Checks.**

- Acting on `(0,1)` on P¹_ℤ by Fubini–Study O(1) gives `(0,c₁(O(1)))`, a codimension-two class with anti-invariant Green form.
- In codimension one invariant Green functions recover the supplied arithmetic Picard convention.
- Tensoring hermitian bundles adds their divisor actions.

For flat projective 𝒳 of relative dimension d, `arithmeticIntersection(𝒳;L₀,…,L_d)` applies divisor actions to (𝒳,g), subtracting ½∫g∏c₁(L_i). API: symmetric/multilinear, Cartier recursion with −∫log‖s‖, birational pullback, [K′:K] scaling, lattice degree. Present bundles as differences of generated bundles in products of projective spaces; graph/projection comparisons give presentation independence for singular models. No O_K-resolution. **Checks.**

- changing one metric to e^(−t)‖·‖ at all embeddings adds [K:ℚ]t times geometric mixed degree
- a vertical fibre contributes +multiplicity·log N𝔭
- a horizontal cycle without g is not itself an arithmetic Chow class.

Source: Gillet–Soulé §§1.2–1.3, 2.1–2.2 pp.100–120, §3.2.1 pp.125–126 (real parity), §§3.3.1–3.3.4 pp.126–127 (principal currents and quotient), Theorem 3.6.1(ii) pp.134–135 (class pushforward), Theorem 4.2.3(iii)/proof pp.139–140, 144–145. *Needs:* ArakelovGeometryAndAbelianHeights §§1.8–1.10; CC C5.3–4; AM char0 resolution; Cartier cycles/lengths; §§0.9, 0.14a.

### 5.17b Adelic model limits

`AdelicMetrizedLineBundle X`: continuous Galois-invariant metrics, one O_K[S⁻¹]-model outside finite S. Approximating models share S/outside metric; log ratios converge uniformly, with distance their weighted sup sum. `SemipositiveAdelic` requires rational relatively nef models/smooth ambient semipositive infinite metrics; `IntegrableAdelic` is their difference. API: tensor, integrable dual, pullback, rational powers, extension, continuity, point agreement. **Checks.**

- relatively ample Fubini–Study is semipositive
- a dual of positive degree is not
- pointwise convergence without uniformity/common good model is insufficient.
- Constant metric twists can have negative heights while remaining semipositive.

`adelicIntersection_uniformBound`: when every remaining metrized factor is semipositive, distance≤ε between two metrics on one fixed underlying bundle changes the normalized mixed intersection by at most ε times the geometric mixed degree of the remaining factors. With integrable remaining factors, fix presentations as differences of semipositive bundles, expand by multilinearity and use ε times the sum of their mixed degrees. On common normalized graphs sandwich vertical differences by ε fibres; integrate bounded ratios against positive infinite mixed measures. Telescope/take limits, then multilinearity gives presentation independence. For an integrable metric on an ample L and a nonzero effective pure d-cycle Z, define `adelicCycleHeight(L,Z)=I(L^(d+1),Z)/((d+1)deg_LZ)`, with I normalized by [K:ℚ]. For a semipositive metric on that ample bundle, define `cycleProbabilityMeasure=c₁(L_v)^d/deg_LZ`, a positive measure of mass one; the zero cycle has no such normalization. API: point agreement, degree-weighted additivity, power scaling, extension invariance, projection, Cartier restriction, Lipschitz. **Checks.**

- a point has its original height
- a double cycle has the same normalized height
- A positive tensor power changes height by m and leaves probability mass one for semipositive ample L and nonzero effective Z.
- On P¹ a trivial bundle with metric e^(−f), f smooth nonconstant and conjugation-invariant at infinity, is integrable but has signed curvature 2ddᶜf and degree zero. Changing another trivial metric by e^(−tf) changes the intersection by a nonzero multiple of t∫f ddᶜf; the unsigned degree-zero bound cannot apply.
- The zero cycle is excluded from `cycleProbabilityMeasure`; its degree is zero.

Source: Zhang *Small points* (1.1)–(1.3)/Theorems 1.4, 1.7 pp.3–8; *Positive line bundles* Lemma 6.5 pp.214–215. *Needs:* §§0.22–23, 5.17a; normalized graphs; CC C5.4.

### 5.17c Positive-bundle analytic estimates

Positive hermitian L on compact projective complex d-fold, curvature probability volume: `BergmanDensity(L,n)=Σ‖s_j‖²` for an L²-orthonormal basis. API: basis independence, integral N_n=dimH⁰, reproducing kernel, tensor indices. **Checks.**

- unitary basis changes preserve it
- volume scaling by c divides density by c
- on homogeneous projective space it is constant N_n.

`bergmanDensity_uniform`: B_n/N_n→1 uniformly. Own `positiveMagnetic_localSpectrum` (frozen-curvature oscillator count) and `positiveMagnetic_heatEstimate` (uniform frozen/local kernel comparison). Hermite/Fourier–Mehler formulas, Dirichlet cutoff/minimax and IMS error Σ|dψ|² control boxes. Choose r=n^(−5/12), so nr²→∞, nr³→0. Duhamel iteration is uniform for t≤n^ε, ε<1/6; norm differentiation/scalar maximum principle give Gaussian domination, boundary error exp(−nr²/t). Compact-resolvent expansion and Bochner–Kodaira gap cn remove nonholomorphic modes at t=n^ε.

`positiveBundle_uniformRestriction`: smooth Y∈|L^a| has an L²-linear restriction right inverse of bounded norm for large n. Apply twisted ∂̄ integration by parts to F_n=L^nK_X⁻¹, with curvature Θ(F_n)−Θ(L^a)>0. Completing squares gives correction bound 2∫⟨B⁻¹g,g⟩, B=[ηiΘ(F_n)−i∂∂̄η−iλ⁻¹∂η∧∂̄η,Λ]. Rescale s so |s|²<1/2, and take 0<δ<1/2. Then the logarithmic weights σ=log(|s|²+δ²)<0, χ(t)=t−log(1−t), η=δ−χ(σ), λ=χ′²/χ″ are defined and control cutoff errors; limits on complete X∖Y approximations give extension with ∫|F|²/(|s|²log²|s|)≤C∫_Y|f|²/|ds|². Weighted integrability forces zero correction on Y; the weight is bounded below. Minimum norm gives linearity.

`multiplication_logDet`: nonzero s with smooth reduced divisor has N_n⁻¹logdet(m_s\*m_s)→∫log‖s‖². Jensen/Bergman gives the lower bound; project disjoint-box ground modes using the gap, then minimax for log(‖s‖²+δ) gives the upper. Local log integrability permits δ→0. Scale sup‖s‖≤1 before omitting o(N_n) modes. Together with restriction this computes exact-sequence covolume discrepancy. **Checks.**

- scaling s by c adds 2log|c|
- zeros do not make the logarithmic integral infinite
- s=0 is excluded.
- Sup and L² logarithmic covolumes differ by O(N_n log n), not O(1).

Source: Bouche Theorems 1–2 pp.118–130; Demailly *Champs magnétiques* Theorem 1.6/Proposition 2.6 pp.197–214; *Ohsawa–Takegoshi–Manivel* Lemma 2.1/Proposition 3.1/§§4.1–9 pp.4–14; Abbes–Bouche Propositions 3.1–5/Theorem 3.7/Lemmas 3.8–11 pp.380–389. *Needs:* CC C1.3–4, C5.3; native spectral algebra. Oscillator/heat/extension/determinant adapters are owned here.

### 5.17d Arithmetic Hilbert–Samuel

`AdelicSectionLattice(L,n)`: H⁰(L^n) with local sup norms/integral finite-place unit balls. `arithmeticEulerCharacteristic`: −logcovolume, including torsion/Euclidean ball terms, divided by [K:ℚ]. API: norm monotonicity, ε-change≤n·rank·ε+O(ranklogrank), extension up to this error, induced-norm exact sequences. **Checks.**

- rank one agrees with arithmetic degree up to the fixed ball constant
- e^(−nt) norm scaling adds nt·rank (n=2,t=1,rank=3 gives +6)
- arbitrary quotient norms cannot be substituted in additivity.

Ample L, semipositive adelic metric, projective d-dimensional X:
`χ̂(H⁰(L^n))=I(L^(d+1),X)n^(d+1)/(d+1)!+o(n^(d+1)).`
For positive smooth generic fibre cut by a smooth hyperplane, retaining vertical/Tor terms on singular models. Serre/coherent Hilbert polynomials give finite-place torsion; §5.17c gives infinite determinants. Induct/sum n^d from d=0 lattice degree; Cartier recursion identifies I. Perturb by rational ample ε, then use §5.17b/norm comparison for nef models/limits.

For singular X resolve f:Ẋ→X over K only. Choose positive M and nonzero s₁∈M, s₂∈f\*L^n₁M⁻¹, s₃∈L^n₂Hom(f_\*O_Ẋ,O_X) by Serre/conductor. With a>n₁+n₂, n=ab+i, s₁^b bounds sections above by (f\*L^aM)^bf\*L^i; s₂^bs₃^b bounds below by (f\*L^(a−n₁−n₂)M)^bf\*L^i. These comparison bundles are positive, though s₂'s need not be. Rank loss is O(a^(d−1)b^d); lattice covolume loss≤log(r!)+(r−r′)logmax(1,λ_r)+operator terms. Bigraded finite generation gives logλ_r=O(ab). First b→∞, then a→∞ makes normalized errors O(1/a), recovering I by multilinearity.

`positiveIntersection_strictSmallSection`: I>0 gives a nonzero integral power section with all infinite sup norms<1 by Minkowski; rank/ball/discriminant error O(n^dlogn). **Checks.**

- coefficient is 1/(d+1)!, a constant shift changes I by (d+1)t deg (d=1,t=1,deg=3 gives +6), whereas normalized height shifts by +1
- I=0 alone gives no strict section.

Source: Abbes–Bouche §§2–4/Proposition 5.3 pp.378–400; Zhang *Positive line bundles* Theorem 1.4/Lemmas 1.5–7/§1.8/Corollary 1.9 pp.189–193; *Small points* Theorem 1.7 pp.7–8. *Needs:* §§5.17a–c; Minkowski; coherent Hilbert/Serre; char0 resolution.

### 5.17e Lifting and arithmetic Nakai

`semipositiveSection_powerLift`: over ℝ, ℂ or complete discretely valued fields, reduced Y⊂projective X, ample L with uniformly approximable quotient metric, fixed s_i on Y/coherent twist m: products m∏s_i^a_i lift for large n with norm≤e^(εn)‖m‖∏‖s_i‖^a_i, any ε>0. API: exact restriction, twists, fixed-S denominators, real descent. At infinity positively perturb and use §5.17c; for singular Y blow up I_Y, regularize its logarithmic curvature, cut off an extension, and solve ∂̄ with weight ρ^(−2dimX−1). Positivity of nL gives e^(εn); integrability kills correction on Y. Finitely many monomial lifts in degrees n₀…2n₀ share one neighborhood; products/coherent generators cover high degrees/twists. At finite places Serre lifts quotient lattices; Galois norms descend powers. Uniform comparison finishes. **Checks.**

- restriction equals the specified product
- a fixed finite denominator set remains
- singular Y retains e^(εn), rather than a bounded right inverse.

`arithmeticNakai_strictSmallBasis`: ample semipositive L, I(L^(dimY+1),Y)>0 for every integral Y⊂X imply strictly small integral ℤ-bases of H⁰(L^nM), all large n, each fixed M. Section 5.17d supplies a strict section on each support. Filter by its divisor ideal into lower-dimensional torsion-free coherent pieces; induct/lift finite section-module generators with small ε. Lattice rounding bounds the last minimum by rank-weighted quotient minima; repeated section multiplication gives exponential decay against polynomial rank growth. Convert small spanning vectors to a basis with a rank factor. **Checks.**

- positivity only on X is insufficient
- an O_K-lattice need not have an O_K-basis
- no effective threshold is asserted.

Source: Zhang *Positive line bundles* Theorem 2.2/Lemmas 2.4–6 pp.193–197, Theorems 3.3, 3.5/Lemma 3.4 pp.198–202, Theorem 4.2/Lemmas 4.4, 4.6–7 pp.202–207. *Needs:* §§5.17c–d; section algebras/coherent filtrations/nef-plus-ample.

### 5.17f Successive minima

For 1≤i≤d+1, `AdelicSuccessiveMinimum(L,X,i)=sup_(codimZ≥i)inf_(X∖Z)h`, allowing Z=∅. API: e₁=essential minimum, e_(d+1)=inf h, descending order, power scaling, metric Lipschitz, extension. **Checks.**

- a point has one minimum
- an isolated zero-height point can lower the last without lowering the first
- a constant shift adds t to each.

Ample semipositive L: `successiveMinima_inequality`, e₁≥h_L(X)≥Σe_i/(d+1). Shift by −h(X)+ε; §5.17d's strict section proves the first. Own `pointwiseNonnegative_cycleNonnegative` before the second: induct and add strict-small Fubini–Study H; Cartier restriction makes all mixed coefficients of I((L+tH)^(d+1)) except the constant nonnegative. A positive root and Nakai just above it give strict-small generators forcing I≥t^(d+1)I(H^(d+1)), contradicting continuity at the root. Hence constant≥0. Shift by −e_(d+1)+ε; every subvariety intersection becomes positive. Nakai/separating generators give a strict section avoiding the loci realizing e_i−ε. Restrict/induct, retain degrees/nonnegative log integrals; let ε→0. **Checks.**

- A shifted point gives equality on both sides
- nonnegative canonical point heights imply cycle heights≥0
- e₁=0 then forces cycle height zero.
- A negative constant twist is relatively nef but can have negative arithmetic intersection.

Source: Zhang *Positive line bundles* Theorem 5.2/Lemmas 5.3–4/proof 5.6 pp.208–211; *Small points* Theorems 1.10–11 pp.8–9. *Needs:* §§5.17a–e; section avoidance, continuity.

### 5.17g Canonical heights and variation

`canonicalAdelicMetric`: normalized [m]^n graph pullbacks divided by m^(2n). Abelian-model metrics agree outside fixed S; nefness persists. Average infinite curvature by translations; ddᶜ-potentials' normalized pullbacks converge uniformly. The limit is semipositive with positive invariant curvature. API: isometry uniqueness, point agreement, h([m]Z)=m²h(Z) with projection degree, products/tensors/restriction/extension. **Checks.**

- h(A)=0 by multiplication projection
- torsion points have height zero
- an infinite-order point can have positive height although h(A)=0.

`smallGeneric_variationalInequality`: integral projective X, ample semipositive adelic L, positive smooth infinite curvature, generic x_n with h(x_n)→h(X): orbit measures→μ=c₁(L_v)^d/degX. Perturb the metric by e^(−tf), including its conjugate embedding; small ±t preserve positivity. Multilinearity gives h_(L(tf))(X)=h_L(X)+tw_v∫f dμ+O(t²), while point height changes by tw_v times orbit average. Apply e₁≥h to both signs, then t→0; smooth approximation handles continuous tests, ambient smooth restrictions singular X. **Checks.**

- w_v is retained until cancellation
- On a positive-dimensional X, a repeated point is not generic; on a geometric singleton the constant sequence is generic.
- a double cycle keeps probability one.

Source: Szpiro–Ullmo–Zhang Proposition 2.1/Theorem 3.1/§4 pp.342–347; Zhang *Small points* §§2.1–4 pp.9–12. *Needs:* §§0.23, 5.17b, 5.17f; CC C5.3–4; uniformization.

### 5.18 Bogomolov over number fields

For geometrically integral X⊂A over a number field with symmetric ample L, dense arbitrarily small points imply X is a torsion coset; equivalently a non-torsion-coset X has positive essential minimum. Quotient the full stabilizer. For positive-dimensional X with trivial stabilizer use §5.15's generically birational difference map. Choose generic small tuples by successive closed-set avoidance, and equidistribute both tuples and their images by §5.19. Their limiting measures would identify the pullback of a positive top form on the image with the product measure on X^(M+1). Along the diagonal the differential of the difference map kills the diagonal tangent directions; its top form degenerates there, whereas the product form is positive on smooth diagonal points. Continuity contradicts equality. The zero-dimensional quotient is height-zero, hence torsion by §0.20. Source: Zhang *Equidistribution*, Corollary 3 p.160, Lemma 3.1 p.163 and §4 pp.164–165. *Needs:* §§5.15, 5.17, 5.19; quotient height descent, complex positive forms.

**Checks.**

- Torsion cosets have dense height-zero points
- an infinite-order singleton has positive minimum.
- On `y² = x³ + 2`, the integral degree-two closed point `x = 0` has two order-three geometric points and dense height-zero points, but is not one torsion coset. Its product with an elliptic curve gives the same failure in positive dimension without geometric integrality.
- Constant function-field curves show why the number-field hypothesis remains.
- For X=x+B the test is the order of x modulo B: x∈B of infinite order still gives the torsion coset B.
- For a genus≥2 curve in its Jacobian, the points of height<ε form a finite set for some ε>0.

### 5.19 Equidistribution on abelian varieties

For a generic sequence (every proper closed subset contains only finitely many terms) in a geometrically integral X⊂A defined over a number field K with ĥ_L(x_n)→0, with Galois orbits over K, the Galois-orbit probability measures converge at each archimedean place to the normalized canonical curvature measure on X. Canonical point heights are nonnegative; §5.17f gives h(X)≥0 and essential minimum zero gives h(X)≤0. Section 5.17g now applies. This proves the equidistribution used in §§5.13a, 5.18 without assuming either theorem. Source: Szpiro–Ullmo–Zhang Theorem 3.1 pp.342–344 (smooth case); Zhang *Equidistribution* Theorem 2.1 pp.162–163 (ambient smooth positive metric, allowing singular X). *Needs:* §§5.17f–g.

**Checks.**

- Generic torsion on A converges to Haar
- On a positive-dimensional X containing 0, repeating 0 fails genericity; on X={0} it is generic.
- On a zero-dimensional geometrically integral X, the limiting measure is the point mass of its unique geometric point.

### 5.20 Coset-free hypersurfaces

For A⊂ℙ^M over algebraically closed characteristic zero, g≥1, d≥g−1, a dense open of degree-d forms cuts no positive-dimensional coset, and its complement has codimension≥d+2−g. For fixed B>0 and d≥max(1,g−dimB), the bad forms have codimension≥d+1+dimB−g: a coset imposes at least d+1 conditions by its Hilbert function, and translates have dimension g−dimB. Bézout bounds each irreducible component X of the section by d·deg A; §5.4a then bounds its maximal coset directions in terms of this degree. Thus only finitely many directions occur; proper incidence makes their bad sets closed. Forms vanishing identically on A, including zero, are excluded. Source: Gao–Habegger Appendix C (C.1), Lemma C.2/Proposition C.1 pp.59–61. *Needs:* §§5.1, 5.4; scheme incidence/Hilbert functions.

**Checks.**

- For g=1 a nonzero restriction has finite zero set
- d=0 allows nonzero constants with empty section.
- The zero form gives A and is always bad.
- A positive-dimensional coset has Hilbert function≥d+1, including an elliptic direction.

### Examples

For a genus-at-least-two curve C in its Jacobian, `Stab⁰(C)=0` and the Ueno locus is empty. For `X=C×E⊆Jac(C)×E`, every point lies on a positive-dimensional E-coset and the Ueno locus is all X. The zero-dimensional abelian variety has no positive-dimensional coset, so its Ueno locus is empty.

The additive group ℚ has rational rank one and is not finitely generated. A torsion group has rational rank zero even if it is infinite. Thus the finite-rank Mordell–Lang hypothesis includes division points and is stronger in scope than the number-field finite-generation case.

The difference map `D₂(P₀,P₁,P₂)=(P₁−P₀,P₂−P₀)` sends `(0,P,2P)` to `(P,2P)` and a diagonal triple to zero. On a translated elliptic subgroup it has positive-dimensional fibres; the finite-stabilizer hypothesis cannot be removed. A torsion coset has dense height-zero points and essential minimum zero. A non-torsion point has a strictly positive essential minimum over a number field, but a non-torsion constant point over a function field can have height zero; the latter requires the trace correction.

### Dependencies

Layers 0–1; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5; JacobianChallenge Layer F; SchemeAndStackFoundations §§1.14, 5.1–5.6, 5.12, with the subscheme-stabilizer and positive-dimensional quotient refinements. The Vojta route needs the product/Roth estimates. Higher-dimensional arithmetic intersections, division-point control, torsion Galois bounds, Ueno structure and adelic equidistribution are the additional contracts specified above. The curve theorem does not use Shafarevich finiteness.

## Layer 6: Rational points by genus and conjectural propositions

### 6.1 Local and global solubility

For separated finite-type X over a number field define `IsLocallySoluble X:=∀v,X(K_v)≠∅`, `SatisfiesHassePrinciple X:=X(𝔸)≠∅→X(K)≠∅`, and `SatisfiesWeakApproximation X:=Dense(X(K),∏X(K_v))`. API: rational points imply local solubility; for proper X local solubility iff adelic nonemptiness; use restricted integral conditions otherwise (§2.5). Source: Poonen §§2.6.3, 8.4.7 pp.49–50, 245. *Needs:* §§2.5, 2.11.

**Checks.**

- Local solubility holds for Spec K and soluble conics, but fails for x²+y²=3z² at 3.
- Hasse holds for Spec K, conics and empty-adelic X, but fails for §2.27's surface.
- Weak approximation holds for Spec K and ℙ¹, fails for the rank-zero curve y²=x³−x, whose four rational points cannot be dense in its real curve, and is distinct from mere nonempty rational points.

### 6.2 Genus zero

A smooth projective geometrically connected genus-zero curve over a number field is a smooth conic and satisfies Hasse. A rational point identifies it with ℙ¹, hence gives infinitely many dense rational points and weak approximation. The associated quaternion's finitely many ramified places decide solubility. Anticanonical embedding and projection prove the identifications; GQF Layer 5 supplies Hasse–Minkowski. Source: Poonen Example 4.5.8/Proposition 4.5.10/Theorem 4.5.11 pp.106–108. *Needs:* §§2.26, 6.1; scheme genus-zero anticanonical embedding.

**Checks.**

- x²+y²=z² is ℙ¹
- x²+y²=3z² has no point.
- A conic is not assumed split before finding a point.

### 6.3 Genus one

For a smooth projective geometrically connected genus-one C/K, its Jacobian E acts simply transitively and C(K)≠∅ iff [C]=0 in H¹(K,E). A chosen point identifies C with E and makes its point group finitely generated, finite iff rank zero. Local solubility puts [C] in Sha, without forcing zero. If Sha(E/K)_div=0, in particular if Sha is finite, the pairing and radicals supplied by SelmerIwasawaCohomology §§2.12a, 4.29, through §§3.17b–d, make Brauer–Manin the only obstruction to a point. No unconditional finiteness of Sha is used. Sources: Poonen Example 5.12.12/Proposition 5.12.14 pp.153–155, §8.3 pp.236–238; Stoll Corollary 7.4/Lemma 7.5 pp.30–31. *Needs:* §§1.7, 3.17, 3.17a–d, 3.18; SelmerIwasawaCohomology §§2.12a, 4.29.

**Checks.**

- y²=x³−x has exactly O, (0,0), (±1,0), rank zero (§1.15)
- a positive-rank elliptic curve has infinitely many points.
- A locally soluble nonzero torsor from §3.18 has no rational point.
- A torsor has no chosen group zero before a point is selected.

### 6.4 Genus at least two

For smooth projective geometrically connected C/K over a number field with genus≥2, `mordell_finite` asserts that C(K) is finite by §5.12. Its native signature uses a smooth proper one-dimensional scheme, the equivalent curve hypotheses, with `Scheme.genus K` and its required finite-dimensional H¹(𝒪_C) instance; rational points are morphisms over Spec K. After a finite extension choose a degree-one class for its Abel–Jacobi embedding: §5.13 makes its intersection with every finite-rank subgroup finite, and §5.18 bounds its sufficiently small-height points to a finite set. Transfer rational points back through the closed immersion. The scoped non-isotrivial function-field theorem is §4.9. Source: Poonen Theorem 9.5.1/Remark 9.5.2 p.286. *Needs:* §§4.9, 5.12–13, 5.18; JC F.

**Checks.**

- y²=(x²+1)(x⁴+1) has the eight points of §3.19
- genus one is excluded.
- No terminating enumeration is inferred from finiteness.

### 6.5 Conjectural propositions

Define `BombieriLangConjecture`: over every number field, a positive-dimensional geometrically integral general-type X has nondense X(K). Define `VojtaConjecture` in its rational-point untruncated form: for smooth projective X, canonical K_X, ample A, normal-crossings D, finite S containing infinity and ε>0, there exist proper closed Z and constant C such that Σ_(v∈S)λ_(D,v)(x)+h_(K_X)(x)≤εh_A(x)+C for every x∈X(K)∖(SuppD∪Z). Define `BrauerManinOnlyObstructionConjecture`: smooth proper geometrically rationally connected X/K has X(K) dense in X(𝔸)^Br. Define `ShaFinitenessConjecture`: every abelian A/K has finite Sha. API: specialization of quantified data, implication to named conditional results, proved curve/conic/zero-abelian cases; none supplies an unconditional theorem. Sources: Poonen Conjectures 9.5.11/9.2.27 pp.288, 267; Vojta Conjecture 14.6(b) p.160; Harpaz–Wittenberg *Supersolvable* Conjecture 1.1 p.787.

**Checks.**

- Bombieri–Lang on genus≥2 curves is §6.4
- points must be excluded since a rational point is dense in itself
- positive-rank elliptic curves are outside general type.
- Vojta on ℙ¹, D=0 has h_K=−2h
- for D={0,∞}, x=2^m, S={∞,2}, proximity=2m log2 and canonical height term=−2m log2, sum zero with one uniform C
- boundary points are excluded.
- Reversing the sign of K_X fails on unbounded-height points of ℙ¹ when ε<2, and for D={0,∞} the point x=1 has zero proximity.
- Brauer sufficiency holds for a point and conics, while §3.21's bielliptic example rules out arbitrary smooth proper X.
- Sha finiteness holds for the trivial variety
- as a group predicate it holds for ℤ/2 without asserting vanishing, and fails for ⊕ℕℤ/2 despite exponent two.

*Needs:* §§0.16, 0.24, 1.3, 2.13, 6.2–4.

### Examples

The conic x²+y²=3z² fails local solubility at 3. A soluble conic is ℙ¹ and has infinitely many rational points with weak approximation. The genus-one curve `y²=x³−x` has four rational points and rank zero; a positive-rank elliptic curve has infinitely many rational points. A locally soluble nontrivial genus-one torsor has a Sha class and no rational point, despite its local points.

For `y²=(x²+1)(x⁴+1)`, the genus-two descent in Layer 3 lists eight rational points. The general genus-at-least-two theorem proves finiteness without supplying a terminating enumeration. Bombieri–Lang in dimension one is that finiteness theorem; in dimension zero a rational point is dense in itself and must be excluded. The rationally connected Brauer sufficiency conjecture does not extend to Skorobogatov's bielliptic surface.

### Dependencies

Layers 0–5; JacobianChallenge Layer F; GlobalQuadraticForms Layer 5; EllipticCurves Layer 7; SchemeAndStackFoundations §§3.2 and 3.6. Conditional genus-one Brauer sufficiency uses the pairing and radical API supplied by SelmerIwasawaCohomology §§2.12a, 4.29, the vanishing of the divisible Sha subgroup (in particular finite Sha), and the Cassels–Tate/Brauer comparison of §§3.17a–d. The conjecture propositions supply no unconditional input to the other genus conclusions.

## Downstream consumers

ArithmeticStatisticsPartVI consumes the common Q invariant and all-place isogeny Euler formula of §3.18c, together with §§3.18a–b's chart and mass adapters. Its general parity and self-duality applications retain their own hypotheses.

EffectiveDiophantineMethods uses explicit heights, Kummer local conditions, finite Brauer constraints and the genus classification for effective point bounds. Finiteness alone does not give a maximum point height. AnabelianGeometryAndNonabelianChabauty uses the abelian depth-one Kummer and Selmer interfaces and the arithmetic descent sets. GrossZagierAndArithmeticHeights uses canonical heights and the unhalved pairing, then supplies its intersection comparison. ArithmeticDynamics uses the Tate-limit and canonical-metric constructions; its dynamical intersection and equidistribution statements have their own hypotheses. Later Faltings and Lawrence–Venkatesh roadmaps consume the Parshin construction and the unique curve finiteness theorem.

## References

- Aise Johan de Jong, [Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf).
- Bjorn Poonen, [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf).
- Brian Conrad, [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf).
- B. Conrad, [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf).
- J. S. Milne, [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf).
- L. Szpiro, [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf).
- E. Bombieri, [The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf).
- W. Gubler, [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2).
- E. Ullmo, [Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017).
- Z. Gao, P. Habegger [GH], [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3).
- V. Dimitrov, Z. Gao, P. Habegger [DGH], [Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3).
- Z. Gao, T. Ge, L. Kühne [GGK], [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4).
- J. Xie, X. Yuan, [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1).
- Y. Harpaz, O. Wittenberg, [Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf).
- Y. Harpaz, O. Wittenberg, [The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf).
- M. Bhargava, B. H. Gross, X. Wang, [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2).
- T. Scanlon, [Positive characteristic Manin–Mumford theorem](https://arxiv.org/abs/math/0303340).
- T. Scanlon, [Automatic uniformity](https://math.berkeley.edu/~scanlon/papers/autouni.pdf), IMRN 2004, no.62, 3317–3326.
- K. Česnavičius, [Purity for the Brauer group](https://arxiv.org/abs/1711.06456v4).
- Tau Ceti roadmap authors, [EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves).
- Tau Ceti roadmap authors, [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves).
- Xinyi Yuan, [Arithmetic bigness and a uniform Bogomolov-type result](https://arxiv.org/abs/2108.05625v4). arXiv:2108.05625v4, 30 April 2024; manuscript dated 1 May 2024.
- J. Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/2018/187-2/p02).
- A. N. Skorobogatov, E. Sofos [SS], [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf).
- T. Browning, P. Le Boudec, W. Sawin [BLS], [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/abs/2006.02356).
- P. Corvaja, U. Zannier, [A subspace theorem approach to integral points on curves](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf).
- A. Mattuck, [Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf).
- S. Lang (article); N. Katz (Appendix), [Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf).
- Jan Steffen Müller and Michael Stoll, [Computing canonical heights on elliptic curves in quasi-linear time](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf).
- Paul Vojta, [Diophantine Approximation and Nevanlinna Theory](https://math.berkeley.edu/~vojta/cime/cime.pdf).
- Yonatan Harpaz and Olivier Wittenberg, [Supersolvable descent for rational points](https://msp.org/ant/2024/18-4/ant-v18-n4-p05-s.pdf).
- W. Gubler (2002), [Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf).
- Xinyi Yuan and Shou-Wu Zhang, [Adelic Line Bundles on Quasi-projective Varieties](https://arxiv.org/abs/2105.13587v9). arXiv v9, 14 June 2025; Theorem A.6.3, pp.248–249.
- Michael Stoll, [Finite descent obstructions and rational points on curves](https://mathe2.uni-bayreuth.de/stoll/papers/covers8.pdf). Author manuscript; Corollary 7.4 and Lemma 7.5, pp.30–31.
- J.-L. Colliot-Thélène, A. N. Skorobogatov, [The Brauer–Grothendieck group](https://www.imo.universite-paris-saclay.fr/~jean-louis.colliot-thelene/BGgroup_book.pdf), author version, 31 October 2019. Page numbers here refer to this version.
- J.-L. Colliot-Thélène, A. N. Skorobogatov, [Descent on fibrations over P¹ revisited](https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/abs/descent-on-fibrations-over-p1k-revisited/BDFE76C3E2330070272773709647948C), Math. Proc. Cambridge Philos. Soc. 128 (2000), 383–393.
- J.-L. Colliot-Thélène, D. Harari, A. N. Skorobogatov, [Compactification équivariante d'un tore (d'après Brylinski et Künnemann)](https://www.imo.universite-paris-saclay.fr/~jean-louis.colliot-thelene/cpctore160503.pdf), 16 May 2003, Theorem 1 and Corollary 1, pp.1–3; subdivision proofs pp.4–10.
- J.-L. Colliot-Thélène, A. N. Skorobogatov, *Good reduction of the Brauer–Manin obstruction*, Trans. AMS 365 (2013), 579–590.
- D. Harari, *Méthode des fibrations et obstruction de Manin*, Duke Math. J. 75 (1994), 221–260.
- D. Harari, A. N. Skorobogatov, *Non-abelian cohomology and rational points*, Compositio Math. 130 (2002), 241–273; [Descent theory for open varieties](https://arxiv.org/abs/1012.1765), author version, 8 December 2010.
- D. Harari, T. Szamuely, *Local-global principles for 1-motives*, Duke Math. J. 143 (2008), 531–557.
- A. N. Skorobogatov, [Descent obstruction is equivalent to étale Brauer–Manin obstruction](https://www.ma.imperial.ac.uk/~anskor/mathann09.pdf), Math. Ann. 344 (2009), 501–510.
- Y. Cao, [Approximation forte pour les variétés avec une action d'un groupe linéaire](https://arxiv.org/abs/1604.03386v4), arXiv v4; cited as Cao 2018. [Sous-groupe de Brauer invariant et obstruction de descente itérée](https://msp.org/ant/2020/14-8/ant-v14-n8-p05-s.pdf), Algebra Number Theory 14 (2020), 2151–2183, with [corrigendum](https://arxiv.org/abs/2201.10717v1), Theorem 2.1 and Corollary 2.2. The corrected coefficient decomposition is essential.
- Y. Cao, C. Demarche, F. Xu, [Comparing descent obstruction and Brauer–Manin obstruction for open varieties](https://arxiv.org/abs/1604.02709v4), arXiv v4.
- C. Demarche, [Le défaut d'approximation forte dans les groupes linéaires connexes](https://arxiv.org/abs/0906.3456), author version, 21 January 2010.
- M. Borovoi, [The algebraic fundamental group and abelian Galois cohomology of reductive algebraic groups](https://archive.mpim-bonn.mpg.de/1514/1/preprint_1989_90.pdf), MPI/89-90; [Abelianization of the second non-abelian Galois cohomology](https://archive.mpim-bonn.mpg.de/395/1/preprint_1991_83.pdf), MPI/91-83. Locators use the preprint pagination.
- M. Kneser, [Galois-Kohomologie halbeinfacher algebraischer Gruppen über p-adischen Körpern II](https://gdz.sub.uni-goettingen.de/download/pdf/PPN266833020_0089/LOG_0037.pdf), Math. Z. 89 (1965), 250–272; [Lectures on Galois cohomology of classical groups](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr47.pdf), TIFR 47 (1969), retyped pagination.
- R. Steinberg, [Regular elements of semisimple algebraic groups](https://www.numdam.org/item/PMIHES_1965__25__49_0.pdf), Publ. Math. IHÉS 25 (1965), 49–80; the scan also carries collected-volume pages 281–312, used here.
- R. Kottwitz, *Stable trace formula: elliptic singular terms*, Math. Ann. 275 (1986), 365–399.
- A. Borel, J.-P. Serre, *Théorèmes de finitude en cohomologie galoisienne*, Comment. Math. Helv. 39 (1964), 111–164.
- C. D. González-Avilés, [Brauer Groups and Tate-Shafarevich Groups](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms100207.pdf), J. Math. Sci. Univ. Tokyo 10 (2003), 391–419; the published Appendix pp.411–417 is used, not the shorter first arXiv version.
- J. S. Milne, [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), VII §2 and VIII §4.
- J. S. Milne, [Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf), second edition (2006), cited as ADT.
- M. Lieblich, [Moduli of twisted sheaves](https://arxiv.org/abs/math/0511244), §3.1; A. J. de Jong, [A result of Gabber](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf); H. Bass, [K-theory and stable algebra](https://www.numdam.org/item/PMIHES_1964__22__5_0.pdf), Publ. Math. IHÉS 22 (1964), 5–60.
- D. Halpern-Leistner, [Lefschetz hyperplane theorem for stacks](https://arxiv.org/abs/1008.0891v1), arXiv v1.
- H. Grauert, *Mordells Vermutung über rationale Punkte auf algebraischen Kurven und Funktionenkörper*, Publ. Math. IHÉS 25 (1965), 131–149; P. Samuel, *Compléments à un article de Hans Grauert sur la conjecture de Mordell*, Publ. Math. IHÉS 29 (1966), 55–62; J. F. Voloch, [A Diophantine problem on algebraic curves over function fields of positive characteristic](https://www.numdam.org/item/BSMF_1991__119_1_121_0.pdf), Bull. Soc. Math. France 119 (1991), 121–126.
- G. Faltings, *Diophantine approximation on abelian varieties*, Ann. of Math. 133 (1991), 549–576.
- G. Rémond, [Inégalité de Vojta en dimension supérieure](https://www.numdam.org/item/ASNSP_2000_4_29_1_101_0.pdf), Ann. Scuola Norm. Sup. Pisa 29 (2000), 101–151; [Décompte dans une conjecture de Lang](https://pazuki.perso.math.cnrs.fr/index_fichiers/Remond00.pdf), Invent. Math. 142 (2000), 513–545; [Sur le théorème du produit](https://www.numdam.org/item/JTNB_2001__13_1_287_0.pdf), J. Théor. Nombres Bordeaux 13 (2001), 287–302.
- B. Poonen, [Mordell–Lang plus Bogomolov II: The division group](https://arxiv.org/abs/math/9808127v1), cited as *Division group*; M. Hindry, *Autour d'une conjecture de Serge Lang*, Invent. Math. 94 (1988), 575–603, Appendix I; T. R. Billingsley, [An algorithm for checking injectivity of specialization maps from elliptic surfaces](https://arxiv.org/abs/2110.01151v2), arXiv v2. The general abelian/closed-point specialization adapters are stated here, beyond Billingsley's elliptic rational-base scope.
- R. Pink, D. Rössler, [On Hrushovski's proof of the Manin–Mumford conjecture](https://arxiv.org/abs/math/0212408), Proc. ICM 2002, Vol. I, 539–546, cited as Pink–Rössler 2002 with its printed pages; [On ψ-invariant subvarieties of semiabelian varieties and the Manin–Mumford conjecture](https://people.maths.ox.ac.uk/rossler/mypage/pdf-files/pr2.pdf), J. Algebraic Geom. 13 (2004), 771–798, cited as Pink–Rössler 2004 with the pages of its author version.
- D. Roessler, [A note on the Manin–Mumford conjecture](https://arxiv.org/abs/math/0409083), arXiv v1 (2004), cited as Roessler *Note*: it replaces Serre's ramification theorem in Pink–Rössler 2002 by Boxall's lemma and formal-group torsion.
- J.-M. Fontaine, [Groupes p-divisibles sur les corps locaux](https://www.numdam.org/item/AST_1977__47-48__1_0.pdf), Astérisque 47–48 (1977); Yu. I. Manin, *The theory of commutative formal groups over fields of finite characteristic*, Russian Math. Surveys 18:6 (1963), 1–83.
- H. Gillet, C. Soulé, [Arithmetic intersection theory](https://www.numdam.org/item/PMIHES_1990__72__93_0.pdf), Publ. Math. IHÉS 72 (1990), 93–174.
- S.-W. Zhang, [Positive line bundles on arithmetic varieties](https://web.math.princeton.edu/~shouwu/publications/plav.pdf), J. AMS 8 (1995), 187–221; [Small points and adelic metrics](https://web.math.princeton.edu/~shouwu/publications/smpoint.pdf), J. Algebraic Geom. 4 (1995), 281–300, cited by author-version pages; [Equidistribution of small points on abelian varieties](https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf), Ann. of Math. 147 (1998), 159–165.
- L. Szpiro, E. Ullmo, S.-W. Zhang, [Équirépartition des petits points](https://web.math.princeton.edu/~shouwu/publications/SUZ.pdf), Invent. Math. 127 (1997), 337–347; locators use printed pagination.
- A. Abbes, T. Bouche, [Théorème de Hilbert–Samuel « arithmétique »](https://www.numdam.org/item/AIF_1995__45_2_375_0.pdf), Ann. Inst. Fourier 45 (1995), 375–401; T. Bouche, [Convergence de la métrique de Fubini–Study d'un fibré linéaire positif](https://www.numdam.org/item/AIF_1990__40_1_117_0.pdf), Ann. Inst. Fourier 40 (1990), 117–130.
- J.-P. Demailly, [Champs magnétiques et inégalités de Morse pour la d″-cohomologie](https://www.numdam.org/item/AIF_1985__35_4_189_0.pdf), Ann. Inst. Fourier 35 (1985), 189–229; [On the Ohsawa–Takegoshi–Manivel L² extension theorem](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/ohsawa_tak.pdf), author-version locators.
- W. Gubler (2003), [Local and canonical heights of subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/can%2B.pdf), author version, 12 June 2003.
- A. Grothendieck, J. Dieudonné, *EGA IV₄*, Publ. Math. IHÉS 32 (1967); Stacks Project, tags cited inline.
- M. Bhargava, [Most hyperelliptic curves over ℚ have no rational points](https://arxiv.org/abs/1308.0395); [The geometric sieve](https://arxiv.org/abs/1402.0031); X. Wang, [Maximal linear spaces contained in the base loci of pencils of quadrics](https://arxiv.org/abs/1302.2385).
- T. Ono, *On Tamagawa numbers*, in [Algebraic Groups and Discontinuous Subgroups](https://www-fourier.univ-grenoble-alpes.fr/~panchish/ETE%20LAMA%202018-AP/Borel_Algebraic%20Groups%20and%20Discontinuous%20Subgroups.pdf), Proc. Sympos. Pure Math. 9 (1966), 122–132; J.-i. Igusa, [Lectures on forms of higher degree](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr59.pdf), TIFR 59, §5.6.
- T. Dokchitser, V. Dokchitser, *On the Birch–Swinnerton-Dyer quotients modulo squares*, Ann. of Math. 172 (2010), 567–596; [Self-duality of Selmer groups](https://arxiv.org/abs/0705.1899v2); [Regulator constants and the parity conjecture](https://arxiv.org/abs/0709.2852v3). B. Poonen, M. Stoll, [The Cassels–Tate pairing on polarized abelian varieties](https://math.mit.edu/~poonen/papers/sha.pdf), Ann. of Math. 150 (1999), 1109–1149; locators in §3.18c use its revised author version.
