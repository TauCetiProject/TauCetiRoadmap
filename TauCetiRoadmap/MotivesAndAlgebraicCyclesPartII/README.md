# Roadmap: algebraic cycles, pure and mixed motives, Part II: Berkovich motives

**Summary.** This roadmap builds integral étale motivic sheaves on Banach rings, archimedean and nonarchimedean alike, and on small arc-stacks. Its inputs are the Berkovich spectrum and the Banach-ring toolkit of TropicalAndBerkovichArithmetic, the enhanced sheaf theory and higher algebra of EnhancedDerivedSheaves, algebraic K-theory from GeneralAlgebraicKTheory and its successors, and the diamond formalism. It constructs the arc-topology on Banach rings, finitary derived arc-sheaves, the ball-invariant subcategory of effective motives, the Tate object, transfers and the stable category `Dmot(X)` obtained by inverting the Tate twist. The end theorems are: the cancellation theorem over every small arc-stack; finitarity of motivic K-theory and its canonical rational Adams decomposition `Kmot ⊗ ℚ ≃ ⊕_{n≥0} ℚ(n)[2n]`; the explicit description of motivic K-theory on nonarchimedean strictly totally disconnected rings, after inverting their residue characteristics, by the cofibre of the K-theory of the ideal of topologically nilpotent elements; the torsion and tilting comparisons; the six-functor formalism with proper base change; rigidity of `Dmot` over analytic bases of finite cohomological dimension; the equivalence of `Dmot(k)` with integral étale motives over an algebraically closed discrete field; and, over the completed algebraic closure `C` of `k((T))` with `k = 𝔽̄_p`, the nearby-cycle equivalence of `Dmot(C)` with motives over `k` carrying a locally nilpotent monodromy operator. A final layer compares prime-to-`p` torsion motives in characteristic `p` with overconvergent étale sheaves on v-stacks.

The base roadmap MotivesAndAlgebraicCycles builds pure motives, their realizations, Nori motives and Tannakian reconstruction, and its mixed motives stop at Voevodsky's Nisnevich motives over a field: finite correspondences, Nisnevich sheaves with transfers, effective and geometric motives, cancellation over perfect fields, the higher-Chow comparison and stable duality (its Layer 4, §§4.1–4.20). It contains no étale motives, no analytic geometry and no arc-topology. This Part II continues it in two directions: it constructs the presentable category of integral étale motives over a field (Layer 10), and it builds the whole Berkovich theory (Layers 0–9, 11, 12) over Banach rings.

## Scope and ownership

This roadmap owns: the arc-topology on Banach rings, small arc-stacks and their strictly totally disconnected basis, and the arc-stacks of affine and projective spaces, of schemes locally of finite presentation over Banach rings and of nonarchimedean analytic spaces (Layer 0); finitary derived arc-sheaves, finitary maps, open immersions, cohomological dimension, finitary proper base change and the étale finitary sheaves `Det(X, Λ)` (Layer 1); effective motivic sheaves, the ball localization, free motivic sheaves of open subsets of affine space and of general arc-stacks, their left adjoints, and maps smooth without boundary (Layer 2); one-units, the reduced multiplicative group, the Tate object and its compactness (Layer 3); Banach presheaves with transfers, the curve and line-domain lemmas, the explicit free motive, the torsion and tilting comparisons and the integral homotopy t-structure (Layer 4); cancellation and projective cells (Layer 5); motivic K-theory and its Adams decomposition (Layer 6); the one-unit K-cofibre and its identifications (Layer 7); stable motives, projective-line duality and six operations (Layer 8); rigidity, quasi-pro-étale monadicity, weak Künneth and pointwise Artin–Tate motives (Layer 9); integral étale motives over a field, their rigidity with and without transfers, and their comparison with Berkovich motives over algebraically closed discrete fields (Layer 10); nearby cycles, the motivic Galois stacks over `𝔽̄_p` and the monodromy equivalence (Layer 11); and the comparison of arc-stacks with the v-stacks whose values do not depend on the ring of integral elements (called partially proper in §12.1; the partially proper v-stacks of DiamondEtaleCohomology are its separated members) and of torsion motives with overconvergent étale sheaves (Layer 12).

It leaves to named roadmaps:

- The Berkovich spectrum of a seminormed ring, its compactness and nonemptiness, completed residue fields, contractive colimits and completed tensor products, uniform Gelfand representations, idempotents and clopen subsets, archimedean Banach fields, affinoid algebras and analytic spaces, the Berkovich line, its types of points, hyperbolic metric and integral slopes, and triangulations of separated analytic curves, belong to **TropicalAndBerkovichArithmetic**, Layers 0–1 and §§2.16, 3.7; that roadmap imports the complete spectrum of a Banach ring, its compactness, nonemptiness and spectral-seminorm formula from **AdicSpacesPartIII**, §R3.9. The arc-topology on schemes and its excision theory belong to **ArcTopologyAndDescent**; the arc-topology of this roadmap is a different site, on Banach rings.
- Enhanced sheaves of spaces and of complexes, hypercompleteness, Postnikov towers and the inverse-limit theory of replete topoi belong to **EnhancedDerivedSheaves**, Layers E1–E3; stable, symmetric monoidal and presentable ∞-categories, formal inversion of an object, Barr–Beck–Lurie, descendable algebras, compact morphisms, compactly assembled, dualizable and rigid stable categories, spectra and animation belong to its Layers E0, E5:abstract, E5:presentability, E5:descent, E5:spectra-comparison and E5:animation. §0.1 keeps a variant of compact assembly that differs in one clause: the presentable ∞-category is not assumed stable, as the category of seminormed rings is not.
- The abstract six-functor construction principle, its extension to sheaves, cohomologically smooth, étale and proper maps, and derived quasi-coherent categories of algebraic stacks with the comodule description of classifying stacks belong to **AnalyticStacks**, §§0.4–0.6, 0.9–0.10 and 1.1–1.5. That roadmap assigns to this one the identification of representations of the stacks `MG_k` and `MG_C` with monodromy operators (§11.6 here).
- Connective, nonconnective and nonunital K-theory of rings, additivity, Suslin's excision criterion, filtered continuity and Quillen's finite-field computation belong to **GeneralAlgebraicKTheory**, §§3.2, 4.3, 8.3, 8.10, 10.10, 13.4–13.5 and 13.8c; the E∞ group-completion model of connective K-theory belongs to **GeneralAlgebraicKTheoryPartII**, §1.2; the vanishing of negative K-groups of regular noetherian schemes, homotopy invariance of the K-theory of regular noetherian schemes, continuity of supported K-theory, K-theory with supports, dévissage, Thomason–Trobaugh excision, Adams operations and their weight shifts belong to **SchemeKTheoryOperations**, §§2.6–2.7 and 5.2 and Layers 3 and 6; henselian rigidity and the K-theory of perfect fields belong to **KTheoryFiniteLocalFields**, §§1.5–1.6 and 2.1; the E∞-ring structure on the K-theory of an E∞-ring and the continuous K-theory of almost modules belong to **RefinedTraceMethods**, §§4.10 and 4.20.
- The ordinary Picard scheme, Jacobian and abelian-variety multiplication belong to **JacobianChallenge**, Layers A, B, D and E. The generalized Jacobian of a reduced boundary in characteristic zero is **AnabelianGeometryAndNonabelianChabauty**, target "Generalized Jacobian of a reduced boundary"; §4.3 here keeps a variant that differs in one clause: the ground field is algebraically closed of arbitrary characteristic and only divisibility on points is asserted.
- Perfectoid rings, tilting and almost acyclicity of `O⁺` belong to **PerfectoidSpaces**, Layers P1–P3; sheaves on profinite sets, strictly totally disconnected perfectoid spaces, v-descent of functions, small v-stacks, cutoff cardinals and analytic diamondification belong to **DiamondsAndVStacks**, Layers D0, D1, D2, D4 and D6; the étale derived category of v-stacks, partially proper maps and canonical compactification, and compact generation belong to **DiamondEtaleCohomology**, Layers C0, C2, C4 and C9; the exceptional direct image of eligible maps and cohomological smoothness belong to **DiamondSixOperations**, Layers S2 and S4.
- Alterations with normal-crossing boundary belong to **AdicCoefficientsAndComparisons**, Layer L5. Continuous cohomology of profinite groups, the Kummer isomorphism and the cohomological dimension of profinite groups belong to **ProfiniteCohomology**, §9.6 and Layers 10–11; the carrier `continuousCohomology` is already in Mathlib, and the Kummer isomorphism used in §2.4 and the closed-subgroup and strict-dimension bounds used in §2.1 are already in Tau Ceti. The open-unit-ball ideal of an ultrametric normed ring with its Neumann estimates, and the principal-ideal property of the one-variable Tate algebra over a complete nonarchimedean field, are already in Tau Ceti, and the principal unit group of a valuation ring, which for a nonarchimedean normed field is its group of one-units, is already in Mathlib (`ValuationSubring.principalUnitGroup`); §3.1 builds the arc-sheaf of one-units on them. The covering dimension of a topological space (`HasCoveringDimensionLE`) belongs to **AlgebraicKTheory**, §4.3, and the identification of the slopes of the Newton polygon of a split polynomial with the valuations of its roots belongs to **NewtonPolygons**, §3.3. Noetherianity of Tate algebras in finitely many variables, used in §7.5, is also already in Tau Ceti. Vector bundles on sheafy Tate affinoid adic spaces, their Kiehl gluing and their identification with finite projective modules belong to **AdicSpacesPartIII**, §R3.5. Tsen's theorem belongs to **SchemeAndStackFoundations**, §2.16. Proper base change, local acyclicity of smooth maps and the dimension bound for the étale cohomology of schemes over a separably closed field belong to **EtaleCohomologyFoundations**, §§F.2.1, F.2.3 and F.3.0. Finite correspondences, Nisnevich motives, cancellation over perfect fields and the higher-Chow comparison belong to **MotivesAndAlgebraicCycles**, §§4.1–4.18; the identification of rational higher Chow groups with Adams-weight pieces of K-theory belongs to **MotivicEtaleKTheory**, §2.2.
- The cohomology of the complex flag manifold uses **RepresentationTheory** (LieGroups, Layer 8: Bruhat cells and the diffeomorphism `K/T ≅ 𝐆(ℂ)/𝐁(ℂ)`), **ComplexComparisonPartII**, §C5.1 (`nonempty_sheafSingularComparison`: on a locally contractible space, sheaf cohomology of a constant sheaf is singular cohomology, naturally in the space and the coefficients), **CharacteristicClasses**, §C5 (the Euler characteristic of `G/T`) and **MorseNovikov**, §6.5 (`lefschetz_fixed_point_formula`: for a smooth self-map of a compact boundaryless manifold with nondegenerate fixed points, the sum of their signs is the alternating trace on rational homology; a fixed-point-free map has no fixed point to be degenerate, so its alternating trace is `0`).

The comparison of `Dmot(X)` with Ayoub's rigid-analytic motives is not a statement of this roadmap; Scholze's paper does not prove it.

## Conventions

All rings are commutative and unital. A seminormed ring is a ring with a submultiplicative seminorm satisfying the triangle inequality, `|0| = 0` and `|−1| ≤ 1`; maps are contractive ring maps; a Banach ring is a complete one (Scholze, Definitions 2.1–2.2, pp. 7–8). Completed tensor products are the pushouts and completed filtered colimits the filtered colimits in the category of Banach rings, as in TropicalAndBerkovichArithmetic §0.16. `M(A)` is the Berkovich spectrum (TropicalAndBerkovichArithmetic §0.1) and `K(x)` the completed residue field at `x ∈ M(A)` (TropicalAndBerkovichArithmetic §0.15). A Banach field is a Banach ring whose underlying ring is a field and whose norm is multiplicative; it is discrete when its norm takes only the values 0 and 1. A geometric Banach point is a nondiscrete algebraically closed Banach field. A Banach ring `A` is *analytic* when finitely many topologically nilpotent elements (those `t` with `|tⁿ| → 0`) generate the unit ideal; equivalently, every completed residue field `K(x)`, `x ∈ M(A)`, is nondiscrete, which is the form of Scholze, Definition 2.17, p. 11. For nonzero `A` the equivalence is TropicalAndBerkovichArithmetic §0.27, where a ring all of whose completed residue fields are nondiscrete is called free of trivial spectrum; the zero ring satisfies both conditions, its spectrum being empty and `1 = 0` being topologically nilpotent. A Banach ring is *uniform* when its Gelfand transform is an isometric embedding (Scholze, Definition 2.20, p. 12). The covering dimension of a topological space is the Lebesgue covering dimension of AlgebraicKTheory §4.3 (`HasCoveringDimensionLE`): every open cover has an open refinement in which each point lies in at most `d + 1` members; the closed disc has covering dimension `2` and the Hilbert cube has no finite bound.

For a Banach ring `A` and elements `f₁, …, f_n, g ∈ A` generating the unit ideal, the *rational localization* `A⟨f/g⟩` is the uniform completion of the quotient of `A ⊗̂ ℤ⟨T₁, …, T_n⟩₁` (§0.8) by the closure of the ideal generated by the elements `gT_i − f_i`. A contractive map from it to a uniform Banach ring `B` is a contractive map `A → B` under which `g` becomes a unit with `|f_i g⁻¹| ≤ 1` for all `i`: the images `t_i` of the `T_i` satisfy `g t_i = f_i`, and `1 = Σ_i a_i f_i + b g` gives `g (Σ_i a_i t_i + b) = 1`. Its spectrum maps homeomorphically onto the closed subset `{x : |f_i|_x ≤ |g|_x for all i}` of `M(A)`, with the same completed residue fields, since `g` does not vanish at such `x` and `t_i = f_i/g` there; for an affinoid algebra `A` this closed subset is the rational domain of TropicalAndBerkovichArithmetic §0.19 with radii `1`. An *analytic cover* of `A` is a finite family of rational localizations of `A` whose spectra cover `M(A)`; it is an arc-cover (§0.2). For a class of uniform Banach rings stable under rational localization and under uniformly completed tensor products, a functor `F` from it to spectra is a *sheaf for the analytic topology* when `F(0) = 0` and, for every analytic cover `{A → A_i}`, `F(A)` is the limit of `F` over the Čech nerve, whose terms are the uniform completions of the completed tensor products `A_{i₀} ⊗̂_A ⋯ ⊗̂_A A_{i_k}`. As `A⟨f/g⟩ ⊗̂_A A⟨f/g⟩` has uniform completion `A⟨f/g⟩`, for a cover by two members this says `F(A) = F(A₁) ×_{F(A₁₂)} F(A₂)`, with `A₁₂` the uniform completion of `A₁ ⊗̂_A A₂`. For `A = C × C′` with two geometric Banach points and `e = (1, 0)`, the localizations `A⟨(1 − e)/e⟩` and `A⟨e/(1 − e)⟩` are the factors `C` and `C′`, with `A₁₂ = 0`, so the condition gives `F(C × C′) = F(C) × F(C′)`; for the unit family `f = g = 1` the localization is `A^u`. This is the analytic topology of Scholze, Theorems 8.11 and 8.13 (pp. 48–49), whose proofs test the sheaf property on covers of `M(A)` by closed subsets; the spectra of rational localizations are such subsets.

Fix a universe and, for every construction on large sites, an uncountable cutoff cardinal κ in the sense of DiamondsAndVStacks §D0.23; constructions are compatible with enlarging κ, and "small" means κ-small for some κ. `Marc(A)` is the arc-sheafification of the representable functor of `A`; the arc-site of all Banach rings is not subcanonical, so `Marc(A)(B)` is not the set of maps `A → B`. "Strict" abbreviates "strictly totally disconnected" (§0.4). Affine spaces `Aⁿ_X`, the multiplicative group `G_m`, projective spaces and the arc-stacks `Y^arc` of schemes and of nonarchimedean analytic spaces are those of §0.8; an analytic curve or scheme `U` is regarded as the arc-sheaf `U^arc` wherever arc-sheaves are formed from it (`ℕ[U]`, `ℤmot[U]`), and free motives `ℤmot[Y]` of arc-stacks are those of §2.7.

Categories of sheaves and of complexes are ∞-categories in the sense of EnhancedDerivedSheaves: `D(ℤ)` is the stable ∞-category of complexes of abelian groups and `D(X_arc, ℤ)` the enhanced derived category of abelian arc-sheaves on `X`. Every equivalence, adjunction and tensor product in this roadmap is one of ∞-categories; a homotopy category appears only where a statement says so. Shifts are cohomological: an abelian group `M` placed in degree zero gives `M[−1]` in degree one, and for a mapping spectrum `π_i Map(A, B) = Hom(A[i], B)`.

The first Tate twist is `ℤ(1) = cofib(ℤmot[∗] → ℤmot[G_m])[−1]`, using the unit section. It is `ℤ` at the complex point, the sign representation of complex conjugation at the real point, and `Ḡ_m[−1]` on the nonarchimedean locus, where `Ḡ_m = G_m/(1 + O_{<1})` (§3.2). Negative twists exist only after stabilization (Layer 8). `Kmot` is a sheaf of spectra; its rational Tate decomposition lives in the rational category. The residue-characteristic exponent at a nonarchimedean point is the characteristic `p` of the residue field when that is positive, and `p = 1` when the residue field has characteristic zero; inverting `p` and completing away from `p` always refer to this exponent. A prime `ℓ` satisfies `|ℓ| ≥ 1` at a point exactly when the point is archimedean or `ℓ` is invertible in its residue field.

Coefficients. For a commutative ring `Λ` and a small arc-stack `X`, `Dfin(X, Λ)` is the category of §1.2, `Det(X, Λ) ⊂ Dfin(X, Λ)` the étale subcategory of §1.8, `Deff_mot(X, Λ)` the full subcategory of ball-invariant objects of `Dfin(X, Λ)` (the condition of §2.1), `Λ(n) = ℤ(n) ⊗ Λ`, `Λmot[Y] = ℤmot[Y] ⊗ Λ`, and `Dmot(X, Λ)` is obtained from `Deff_mot(X, Λ)` by inverting `Λ(1)` as in §8.1. Without a coefficient ring, `Λ = ℤ`. For a small v-stack `X`, `D_ét(X, Λ)` is the étale derived ∞-category of DiamondEtaleCohomology §§C2.2, C2.12, a category on the v-site, distinct from `Det` of an arc-stack. An object `M` is `p`-power torsion when `M ⊗ ℤ[1/p] = 0`.

The rational mapping formula over a discrete algebraically closed field is normalized by `Map(ℤmot[X](−j), ℤ)_ℚ ≃ K(X)_ℚ^{(j)}[−2j]`, that is `π_i = K_{i+2j}(X)_ℚ^{(j)}`, where `K(X)_ℚ^{(j)}` is the Adams-weight-`j` summand (§10.5; witness `X = ℙ¹`, `j = 1`).

## Exact supplier contracts

### From Mathlib

Mathlib at the pin supplies the categorical sites used as carriers of topologies: `CategoryTheory.GrothendieckTopology` (Mathlib/CategoryTheory/Sites/Grothendieck.lean), with its top, pullback and transitivity axioms, is the structure of the arc-topology on the opposite category of Banach rings (§0.2); its sheaf categories are ordinary, and every ∞-categorical sheaf category comes from EnhancedDerivedSheaves. `NormedField` (Mathlib/Analysis/Normed/Field/Basic.lean) and `IsUltrametricDist` (Mathlib/Topology/MetricSpace/Ultra/Basic.lean) are the carriers for valued fields in the one-unit calculations of §3.1. For such a field `K`, `NormedField.valuation` (Mathlib/Topology/Algebra/Valued/NormedValued.lean) is the valuation `x ↦ ‖x‖₊`, and `ValuationSubring.principalUnitGroup` (Mathlib/RingTheory/Valuation/ValuationSubring.lean) of its valuation subring `{‖x‖ ≤ 1}` is the subgroup of `Kˣ` of the `u` with `‖u − 1‖ < 1`: membership is stated through the canonical valuation of the valuation subring, which is equivalent to `NormedField.valuation` and not equal to it, and `ValuationSubring.principal_units_le_units` places the group inside the units of the valuation ring, so its members have norm one. Mathlib states nothing about this group under ring maps between different fields. `SSet.Quasicategory` (Mathlib/AlgebraicTopology/Quasicategory/Basic.lean) is the model of ∞-categories through EnhancedDerivedSheaves. `continuousCohomology` (Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) is the continuous cohomology of a topological group with coefficients in a topological representation, used for the Galois descent of §1.3. `PowerSeries.IsRestricted.subring c` (Mathlib/RingTheory/PowerSeries/Restricted.lean) is the ring of one-variable power series over an ultrametric normed ring whose coefficients satisfy `‖a_n‖ cⁿ → 0`; for `c = 1` over a complete nonarchimedean field `K` it is the Tate algebra `K⟨T⟩` of the closed unit disc. `AlgebraicGeometry.Scheme` (Mathlib/AlgebraicGeometry/Scheme.lean), with the morphism classes `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.QuasiCompact` and `AlgebraicGeometry.Smooth` (Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean, Etale.lean, QuasiCompact.lean, Smooth.lean) and the affine space `AlgebraicGeometry.AffineSpace` (Mathlib/AlgebraicGeometry/AffineSpace.lean), are the schemes whose arc-stacks §0.8 constructs, and the morphisms whose arc-stacks §2.7 shows étale. The scheme `ℙⁿ_ℤ` of §0.8 is the projective spectrum `AlgebraicGeometry.Proj` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean) of the symmetric algebra of `ℤ^{n+1}` with the grading Tau Ceti gives it (below). Mathlib at the pin has no Berkovich spectrum, no Banach-ring site, no stable or presentable ∞-category of sheaves and no algebraic K-theory spectrum.

### From Tau Ceti

Tau Ceti at the pin has no Banach-ring site, no motivic category and no K-theory spectrum. Its low-degree K-theoretic carriers, the exact Grothendieck group `TauCeti.ExactK0` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean), through which GeneralAlgebraicKTheory identifies `π₀` of the K-theory spectrum, and the stable general linear group `TauCeti.StableGeneralLinearGroup` with algebraic `K₁` as its abelianization `TauCeti.AlgebraicK1` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean), are not consumed directly: the K-groups used here are the homotopy groups of the spectra of GeneralAlgebraicKTheory. Its comodule categories and Hopf-algebra modules enter only through AnalyticStacks §1.5. It supplies the following, assumed with exactly the hypotheses stated:

- `TauCeti.unitBallIdeal R` and `TauCeti.mem_unitBallIdeal` (TauCeti/Analysis/Normed/Ring/UnitBall.lean): for a seminormed ring `R` with `IsUltrametricDist R` and `NormOneClass R`, the ideal of the closed unit ball `Subring.unitClosedBall R` (TauCeti/Analysis/Normed/Ring/Ultra.lean, a subring under the same hypotheses) consisting of the elements of norm less than one. It is the ideal `A_{<1}` of §3.1.
- `TauCeti.norm_inverse_one_sub`, `TauCeti.norm_inverse_one_sub_sub_one` and `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt` (same file): for a normed ring with `NormOneClass`, `HasSummableGeomSeries` (for instance a complete one) and an ultrametric norm, `‖x‖ < 1` gives `‖(1 − x)⁻¹‖ = 1` and `‖(1 − x)⁻¹ − 1‖ = ‖x‖`, and an element of the closed unit ball within distance less than one of `1` is a unit of the closed unit ball. These are the group laws of one-units in §3.1.
- `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring` (TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean): for a normed field `K` with `IsUltrametricDist K` and `CompleteSpace K` and every radius `c > 0`, `PowerSeries.IsRestricted.subring c` is a principal ideal ring; being a subring of `K⟦T⟧` it is a domain. At `c = 1` this is the principal-ideal property of `K⟨T⟩` used in §3.3, with no condition on the valuation of `K`.
- `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring` (TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Groebner.lean): for a normed division ring `K` with `IsUltrametricDist K` and `CompleteSpace K`, a finite index type `σ` and radii `c : σ → ℝ` with every `c i > 0`, Mathlib's `MvPowerSeries.IsRestricted.subring c` (Mathlib/RingTheory/MvPowerSeries/Restricted.lean) is a noetherian ring. At `c = 1` over a complete nonarchimedean field this is the noetherianity of the Tate algebra `K⟨T₁, …, T_m⟩`, which §7.5 uses for the affinoid algebra `A`, a quotient of such a Tate algebra.
- `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt` (TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean), `TauCeti.cohomologicalDimensionAt_le_of_isClosed` (TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClosedSubgroup.lean: `cd_p U ≤ cd_p G` for a closed subgroup `U` of a compact totally disconnected group `G`) and `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one` (TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean: `scd_p G ≤ cd_p G + 1` in `ℕ∞` for a compact group `G`). These are the dimension bounds of §§1.5 and 2.1; their theory is ProfiniteCohomology, Layer 11.
- `TauCeti.kummerIso K n hn` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): for a field `K`, a natural number `n` and `hn : IsUnit (n : K)`, the Kummer isomorphism `K^×/(K^×)ⁿ ≃ H¹(G_K, μ_n)` of the power classes with the first continuous cohomology of the absolute Galois group in the `n`-th roots of unity of the separable closure; its theory is ProfiniteCohomology §9.6. It gives the Kummer classes on the completed residue fields of the disc in §2.4, where `|n| ≥ 1` makes `n` a unit in every residue field.
- `TauCeti.IsReplete C` (TauCeti/CategoryTheory/Limits/Replete.lean): for a category `C`, the projection from the limit of every tower `⋯ → F(1) → F(0)` of epimorphisms onto `F(0)` is an epimorphism; every projection onto `F(n)` is then one (`TauCeti.IsReplete.epi_π_app`). §0.7 proves it for the arc-topos.
- `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean): for a smooth morphism of schemes `f : X → S` (Mathlib `AlgebraicGeometry.Smooth`), every point of `X` has an affine open neighbourhood `V` with an étale morphism `V → 𝔸(ULift (Fin n); S)` over `S` for some `n`, affine space on `n` coordinates indexed by `ULift (Fin n)`. These are the étale coordinates through which §2.7 shows that arc-stacks of smooth schemes are smooth without boundary.
- `TauCeti.SymmetricAlgebra.projToSpec R M` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/SymmetricAlgebra.lean): for a commutative ring `R` and an `R`-module `M` in the same universe, the structure morphism `Proj(Sym M) → Spec R`, where `Sym M` carries the grading by its homogeneous submodules `TauCeti.SymmetricAlgebra.homogeneousSubmodule R M` (TauCeti/LinearAlgebra/SymmetricAlgebra/Homogeneous.lean) and `M` is the module of homogeneous linear coordinates; it is proper when `M` is a finite `R`-module (`TauCeti.SymmetricAlgebra.instIsProperProjToSpec`). For `R = ℤ` and `M = ℤ^{n+1}` it is `ℙⁿ_ℤ → Spec ℤ`.
- `TauCeti.AlgebraicGeometry.projectiveLine R` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveLine.lean): the case `M = R²`, with its two charts `TauCeti.AlgebraicGeometry.projectiveLine.polynomialChartι R i : Spec R[X] → ℙ¹_R`, `i = 0, 1`, open immersions whose images cover `ℙ¹_R` (`TauCeti.AlgebraicGeometry.projectiveLine.range_polynomialChartι_union_range_polynomialChartι`).
- `TauCeti.puncturedAffineSpace R ι` (TauCeti/AlgebraicGeometry/PuncturedAffineSpace.lean): the open subscheme of `𝔸^ι_R` on which the coordinates do not all vanish, as a scheme over `Spec R`, whose points with values in an `R`-algebra `B` are the vectors of `B^ι` whose entries generate the unit ideal (`TauCeti.PuncturedAffineSpace.homEquiv`).

These three are the schemes `ℙⁿ`, `ℙ¹` and `A² ∖ {0}` over `ℤ` whose arc-stacks §0.8 forms.

### From TauCetiRoadmap.TropicalAndBerkovichArithmetic

Layer 0: §0.1 (Berkovich spectrum `Spectrum`), §0.7 (compactness), §0.8 (Hausdorffness), §0.12 (seminormed Banach rings and separated completion), §0.13 (nonemptiness for `|1| = 1`), §0.14 (units, spectral radius and spectral uniformization), §0.15 (completed residue fields), §0.16 (contractive colimits and completed tensor products, with the spectrum of a pushout surjecting onto the fibre product and the spectrum of a filtered colimit the inverse limit), §0.17 (affinoid algebras), §0.19 (rational and affinoid domains and their universal property), §0.20 (affinoid structure sheaf and acyclicity for finite modules), §0.21–0.22 (analytic spaces and analytification), §0.24 (uniform Gelfand representation), §0.25 (idempotents and clopen subsets of `M(A)`), §0.26 (archimedean Banach fields are `ℝ` or `ℂ` with a power of the absolute value), §0.27 (uniform units, and for a nonzero Banach ring the equivalence of nondiscreteness of every completed residue field with generation of the unit ideal by topologically nilpotent elements), §0.28 and §0.30 (rank-one points of `Spa(A, A°)` and the strict Berkovich–adic comparison), §0.32 (surjectivity detected by residue fields). Layer 1: §1.1 (Gauss points, discs and the Berkovich projective line), §1.2 (the four types of points), §1.3 (paths and hyperbolic metric), §1.6 (integral slopes of analytic units on annuli); §2.16 (triangulations of separated quasi-smooth analytic curves: closed discrete sets of type-II and type-III points, of type II only for strict curves over a nontrivially valued field, containing any prescribed closed discrete set of such points and cutting the curve into relatively compact virtual discs and virtual annuli, which over an algebraically closed field are open discs and open annuli); §3.7 (slope formula and harmonicity). These are assumed with the hypotheses stated there.

### From TauCetiRoadmap.AlgebraicKTheory and NewtonPolygons

AlgebraicKTheory §4.3 (`HasCoveringDimensionLE X d`: every open cover of the topological space `X` has an open refinement in which every point lies in at most `d + 1` distinct members; monotone in `d`, invariant under homeomorphism, inherited by closed subspaces of compact Hausdorff spaces and by finite closed covers; the Hilbert cube satisfies it for no `d`). It is the covering dimension in the Conventions and in §§1.5, 2.1, 7.3 and 9.6. NewtonPolygons §3.3 (over a normed extension in which a nonzero polynomial splits and the valuation extends the given one, the finite slope multiset of its Newton polygon is the image of its nonzero root multiset under `x ↦ −w(x)`, with root counts in open and closed balls read off the endpoints of the faces). It gives the largest and smallest root norms of the monic polynomials in §3.5 and the root localizations of §4.4.

### From TauCetiRoadmap.AdicSpacesPartIII

§R3.5, target *sheafy-tate-acyclicity-and-kiehl-gluing*: for a complete sheafy Tate Huber pair `(A, A⁺)` and a rational subset `U = Spa(B, B⁺)` of `Spa(A, A⁺)`, the functor `P ↦ P̃` is an equivalence from finite projective `B`-modules to vector bundles on `U`, with quasi-inverse the global sections; in particular, for an affinoid algebra `A` over a complete field with a nontrivial rank-one nonarchimedean absolute value (the base field of that roadmap), the vector bundles on `Spa(A, A°)` are the finite projective `A`-modules. It is used in §3.3 together with TropicalAndBerkovichArithmetic §0.30, which identifies the strict affinoid domains of `M(A)`, their intersections and their structure sheaves with those of `Spa(A, A°)`, so that a cocycle of units on a finite cover of `M(A)` by strict rational domains defines a line bundle on `Spa(A, A°)`. With the principal-ideal property of `K⟨T⟩` at the pin (Tau Ceti `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`), analytic line bundles on the closed unit disc over such a field are trivial.

### From TauCetiRoadmap.EnhancedDerivedSheaves

§E0.4 (stable ∞-categories), §E1.3 (the enhanced derived category of module sheaves on a site), §E2.1–E2.3 (replete topoi, derived limits, Postnikov completion and left completeness), §E2.4 (`postnikov_converges_of_finiteDimension`), §E2.6 (hypercovers and descent), §E2.7 (`spaceSheaves`, `hypercompleteSpaceSheaves`, `spacePostnikovTower`), §E3.2 (representability, adjoints and accessible localizations), §E3.4 (`cutoffRightAdjoint_compat`, `ringedDiagramDerived`, `coherentMate`), §E5:abstract.1–5 (symmetric monoidal ∞-categories, algebras and modules, monoidal localizations, stable monoidal structures and the small Verdier quotient, `barrBeckLurie`), §E5:presentability.2 (`presentableTensor`, `categoricalModuleBaseChange`, `tensorInversion`, `spectra`), §E5:presentability.3 (`indVerdierLocalization`), §E5:presentability.4 (`IsCompactMorphism`, `IsDualizablePresentable`, `dualizable_filteredColimit`, `IsTraceClass`, `IsRigid`), Layer E5:descent (`IsDescendable`, `moduleDescent`), §E5:animation.1 (`nonabelianDerived`, `animationExtension`).

What EnhancedDerivedSheaves must provide (gap:replete-postnikov): for a replete topos (one satisfying Tau Ceti's `TauCeti.IsReplete`), the hypercomplete ∞-topos of sheaves of spaces on it is Postnikov complete (§E2.7).

What EnhancedDerivedSheaves must provide (gap:compact-hausdorff-dimension): for a compact Hausdorff space of covering dimension at most `d` (AlgebraicKTheory §4.3), the sheaf cohomology of every abelian sheaf vanishes above degree `d` and the ∞-topos of sheaves of spaces is Postnikov complete (§E2.4).

What EnhancedDerivedSheaves must provide (gap:animated-group-completion): free animated commutative monoids and their group completions (§E5:animation).

What EnhancedDerivedSheaves must provide (gap:breen-deligne-resolution): the Breen–Deligne resolution of the group completion of a sheaf of animated commutative monoids by classifying spaces of products of its terms (§E5:animation).

What EnhancedDerivedSheaves must provide (gap:augmentation-ideal-filtration): the augmentation-ideal filtration of the group algebra of a 1-connective animated abelian group, with graded pieces of increasing connectivity and convergence to the group algebra (§E5:animation).

What EnhancedDerivedSheaves must provide (gap:einfty-fracture-square): the arithmetic fracture square for E∞-algebras over an E∞-ring `R`: for a prime `p`, every E∞-`R`-algebra `A` is the pullback of `A[1/p] → A^∧_p[1/p] ← A^∧_p` in E∞-`R`-algebras (§E5:spectra-comparison).

### From TauCetiRoadmap.AnalyticStacks

§0.4–0.6 (six-functor formalisms, the construction principle from a suitable decomposition `E = P ∘ I` with base change and projection formulas, and the extension theorem to sheaves and hypersheaves on a subcanonical site), §0.9–0.10 (cohomologically smooth, étale and proper maps), §1.1–1.5 (derived quasi-coherent categories of algebraic stacks in the !-topology, tensor descent along !-covers, and the identification of `D(BG)` with comodules for a flat affine group `G = Spec R` over a static ring whose counit has finite Tor amplitude).

### From TauCetiRoadmap.GeneralAlgebraicKTheory, GeneralAlgebraicKTheoryPartII and SchemeKTheoryOperations

GeneralAlgebraicKTheory §3.2 (functorial connective K-theory of unital rings), §4.3 (additivity: an exact functor with a finite filtration by exact subfunctors induces on K-theory the sum of the maps of its graded pieces), §8.3 (nonunital K-theory through the unitisation), §8.10 (absolute excision in all degrees is equivalent to Tor-unitality), §10.10 (the nonconnective Bass K-theory spectrum), §13.4–13.5 (filtered continuity of the Bass spectrum and of its nonunital version), §13.8c (Quillen's computation of the K-groups of finite fields). GeneralAlgebraicKTheoryPartII §1.2 (connective K-theory of a ring as the group completion of the E∞ space of finite projective modules under direct sum). SchemeKTheoryOperations §2.6 (the negative K-groups of a regular noetherian scheme vanish), §2.7 (K-theory with supports descended from a finite stage commutes with limits of qcqs schemes along affine transition maps), §3.1 (K-theory with supports through supported perfect complexes), §3.3 (localization sequences), §3.5 (dévissage: for a regular noetherian scheme and a regular closed subscheme `Z`, pushforward identifies `K(Z)` with K-theory supported on `Z`), §3.4 and §3.8 (invariance of supported K-theory under maps inducing an equivalence on derived closed fibres, including completion), §5.2 (for a regular noetherian scheme `X`, `NK_n(X) = 0` in every degree, so `K(X) → K(X × A¹)` is an equivalence; as `X × A¹` is again regular noetherian, `K(X) → K(X × Aⁿ)` is an equivalence for every `n`), §6.4 (Adams operations `ψ^k` on `K_m(A)` for every commutative ring `A`, through the universal lifting property), §6.8 (Adams operations on regular schemes with `ψ^k[L] = [L^k]`), §6.11 (the weight shift `ψ^k j_* = k^c j_* ψ^k` for a regular closed immersion of pure codimension `c` with trivial conormal bundle).

What SchemeKTheoryOperations must provide (gap:kh-simplicial-model): homotopy K-theory `KH(X) = |K(X × Δ^•_ℤ)|` of qcqs schemes, `Δ^r_ℤ = Spec ℤ[x₀, …, x_r]/(Σ_i x_i − 1)`, which for `X = Spec R` is `|K(R[Δ^•])|` (§5.2).

What SchemeKTheoryOperations must provide (gap:kh-excision): for a commutative ring `R`, an ideal `I ⊂ R` and a ring map `R → S` carrying `I` isomorphically onto an ideal of `S`, the map `fib(KH(R) → KH(R/I)) → fib(KH(S) → KH(S/I))` is an equivalence (Layer 5).

What SchemeKTheoryOperations must provide (gap:kh-cdh-descent): `KH` carries every abstract blowup square of noetherian schemes of finite Krull dimension to a pullback square of spectra (Layer 5).

What SchemeKTheoryOperations must provide (gap:valuation-ring-k-regularity): for a valuation ring `V`, `K(V) → K(V[T₁, …, T_n])` is an equivalence and `K_{−i}(V) = 0` for `i > 0`, so `K(V) ≃ KH(V)`; and `K(R) ≃ KH(R)` for every smooth algebra `R` over a valuation ring (Layer 5).

### From TauCetiRoadmap.KTheoryFiniteLocalFields and RefinedTraceMethods

KTheoryFiniteLocalFields §1.5 (for every perfect commutative `𝔽_p`-algebra `A` and `n ≥ 1`, multiplication by `p` on `K_n(A)` is an automorphism; `K₀` is excluded), §1.6 (the K-groups of `𝔽̄_p` are zero in positive even degrees and torsion in odd degrees), §2.1 (rigidity for henselian pairs with finite coefficients prime to the residue characteristic). RefinedTraceMethods §4.10 (connective K-theory is the tensor unit of the finitary additive invariants of small stable ∞-categories and its inclusion into all functors is lax symmetric monoidal, so `K(Perf(R))` is an E∞-ring for every E∞-ring `R`, naturally in `R`) and §4.20 (for a flat idempotent ideal `I` of a unitization `B`, the kernel of `D(B) → D(B/I)` is the dualizable category of almost modules, its continuous K-theory is `fib(K(B) → K(B/I))`, and both depend only on `I`).

What KTheoryFiniteLocalFields must provide (gap:suslin-rigidity): for an extension `F ⊂ E` of algebraically closed fields and `n` invertible in `F`, the map `K(F; ℤ/n) → K(E; ℤ/n)` is an equivalence (§2.1).

What KTheoryFiniteLocalFields must provide (gap:padic-k-integers-oc): for a complete algebraically closed nonarchimedean field `C` of residue characteristic `p`, the map `K(O_C)^∧_p → K(C)^∧_p` is an equivalence, including `p = 2` (§6.5).

### From TauCetiRoadmap.JacobianChallenge and AnabelianGeometryAndNonabelianChabauty

JacobianChallenge Layer A (Weil and Cartier divisors, rational sections, `classGroupAddEquivLineBundleClass`), Layer B (coherent cohomology, genus, Riemann–Roch), Layer D (§D.2 `picardScheme`; §D.5 `isRepresentable_picZeroSets`: the degree-zero Picard sheaf of a smooth proper geometrically connected curve over any field is representable by an open and closed subgroup scheme `Pic⁰` of `picardScheme`; §D.8 `jacobianScheme`, its representing object), Layer E (§E.7 `multiplication_isogeny`: for `n ≠ 0`, multiplication by `n` on an abelian variety is finite locally free and surjective). AnabelianGeometryAndNonabelianChabauty, target "Generalized Jacobian of a reduced boundary", is the characteristic-zero construction compared in §4.3.

### From TauCetiRoadmap.PerfectoidSpaces, DiamondsAndVStacks, DiamondEtaleCohomology and DiamondSixOperations

PerfectoidSpaces §P1.4 (the tilt), §§P1.19–P1.22 (untilts and marked untilts), §P1.27 (the tilting equivalence), §P2.3 (rational localization of perfectoid affinoids), §P2.7 (almost acyclicity of `O⁺` on rational coverings), §P2.12 (tilting equivalence of perfectoid spaces), §P2.13 (for morphisms of complete Huber pairs `(A, A⁺) → (B, B⁺)` and `(A, A⁺) → (C, C⁺)` with `A`, `B`, `C` perfectoid Tate rings of any characteristic, the completed tensor product `B ⊗̂_A C` is a perfectoid Tate ring, is uniform, is the pushout in complete perfectoid Tate pairs and commutes with tilting; used in §0.5 with the power-bounded elements as rings of integral elements, so that the identity instance `B = C = A` gives `A`), §P3.20 (tilting identifies étale sites). DiamondsAndVStacks §D0.22 (ordinary sheaves on a profinite set as functors on its clopen subsets, with stalk isomorphisms detecting isomorphisms), §D0.23 (`IsCutoffCardinal`), §D1.4 (strictly totally disconnected perfectoid spaces: qcqs with every étale cover split, equivalently every connected component is `Spa(C, C⁺)` with `C` algebraically closed), §D2.7 (v-descent of `O` and `O⁺`, `vTopology_subcanonical`), §D4.7 (small v-sheaves and v-stacks), §D4.9 (isomorphism criteria on geometric points), §§D6.1, D6.3 (`Perf.Spd`, diamonds of Tate Huber pairs). DiamondEtaleCohomology §C0.19 (the étale topos of a strictly totally disconnected space is sheaves on `|X|`), §C0.24 (unbounded comparison), §C2.2 and §C2.12 (the étale derived category `D_ét(Y, Λ)` of a small v-stack and its presentable stable enhancement), §C4.5 (partially proper maps of v-stacks), §§C4.13–C4.14 (the canonical compactification of a separated map and its universal property), §C9.8 (compact generation of `D_ét(Y, Λ)` for spatial `Y` of bounded cohomological dimension). DiamondSixOperations §S2.4 (the exceptional direct image `Rf_!` with its base change and projection formula), §§S4.2–S4.3 (cohomologically smooth maps and the dualizing complex).

### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and further roadmaps

MotivesAndAlgebraicCycles §4.1 (`FiniteCor`), §4.2 (`PST`), §4.3 (`ShNisTr`), §§4.4–4.6 (Suslin complexes, strict homotopy invariance, the effective category `DM_eff`), §4.9 (integral cancellation), §4.11 (geometric motives and stabilization), §§4.15–4.18 (motivic cohomology of smooth schemes over perfect fields as higher Chow groups). MotivicEtaleKTheory §2.2 (rational higher Chow groups as Adams-weight summands of K-theory). AdicCoefficientsAndComparisons Layer L5 (`smoothAlterationPair`). ProfiniteCohomology §9.6 (the Kummer sequence and isomorphism, used in §2.4), §10.2 (filtered colimits of coefficients in continuous cohomology) and Layer 11 (the theory of the cohomological dimensions whose bounds are pinned in Tau Ceti). SchemeAndStackFoundations §2.16 (Tsen's theorem). EtaleCohomologyFoundations §F.2.1 (proper base change for torsion coefficients, with no invertibility hypothesis), §F.2.3 (universal local acyclicity of smooth maps for finite invertible coefficients) and §F.3.0 (vanishing of `H^q(X, F)` for `q > 2 dim X`, `X` of finite type over a separably closed field and `F` torsion of order invertible in it), for the transfer-free rigidity of §10.2. RepresentationTheory (LieGroups) Layer 8 (Bruhat cells of the flag manifold and the diffeomorphism `K/T ≅ 𝐆(ℂ)/𝐁(ℂ)` for a compact connected Lie group `K` with complexification `𝐆`, maximal torus `T` and Borel subgroup `𝐁`), ComplexComparisonPartII §C5.1 (`nonempty_sheafSingularComparison`: for a locally contractible space `T` and an abelian group `A`, the canonical map from the sheaf cohomology of the constant sheaf `A` to singular cohomology with coefficients in `A` is an isomorphism in every degree, natural in `T` and `A`), CharacteristicClasses §C5 and MorseNovikov §6.5 (`lefschetz_fixed_point_formula`: for a smooth self-map of a compact boundaryless manifold all of whose fixed points are nondegenerate, the sum of the fixed-point signs equals the alternating trace on rational homology) for §6.2.

## How to read the build

Layer 0 constructs the arc-site, its strict basis and the arc-stacks of affine spaces, schemes and analytic spaces, Layer 1 the finitary sheaves, their proper base change and the étale finitary sheaves, Layer 2 the effective motivic category with its ball localization and free motives, and Layer 3 the reduced multiplicative group and the Tate object. Layer 4 develops transfers and uses them to compute free motives explicitly; it gives the torsion and tilting comparisons. Layer 5 proves cancellation and computes projective cells, and Layer 6 builds motivic K-theory and its rational Adams decomposition. From there two branches run in parallel: Layer 7 identifies motivic K-theory through the one-unit cofibre, and Layer 8 inverts the Tate twist and constructs the six operations. Layer 9 proves rigidity at geometric points and over analytic bases. Layer 10 combines rigidity with Layer 7 to compare with algebraic étale motives over discrete algebraically closed fields; Layer 11 builds nearby cycles and the monodromy equivalence on top of Layer 10; Layer 12 branches from Layers 4, 8 and 9 to the v-stack comparison. Each target's *Needs:* line lists what its statement and proof route use, item by item.

## Layer 0: The Banach arc-site

This layer constructs the arc-topology on Banach rings, small arc-stacks, the strictly totally disconnected basis and quasi-pro-étale maps, and proves repleteness of the arc-topos together with the compact assembly of seminormed rings that the finitary theory uses; it ends with the arc-stacks of affine spaces, schemes and nonarchimedean analytic spaces on which the later layers evaluate.

### 0.1 Compact assembly of seminormed rings

Call a map `f : X → Y` in a presentable ∞-category *weakly compact* when every map from `Y` to a filtered colimit `colim_i Z_i`, composed with `f`, factors through some `Z_i`; this is the weakly compact map of EnhancedDerivedSheaves §E5:presentability.4 (`IsCompactMorphism`), defined there in every quasicategory with filtered colimits. Call a presentable ∞-category *compactly assembled* when filtered colimits commute with finite limits in it and it is generated under colimits by sequential colimits `colim(X₀ → X₁ → ⋯)` whose transition maps are weakly compact (Scholze, Definition 2.7 and Remark 2.8, p. 9). EnhancedDerivedSheaves §E5:presentability.4 imposes the same condition on presentable stable ∞-categories; here stability is not assumed, since the category of seminormed rings is not stable. The lifting condition is imposed on the composite from `X`, not on `Y`, and generation is under colimits: an individual object need not have such a presentation.

Prove the following API.

- If `f` is weakly compact, so are `g ∘ f` and `f ∘ h` for all composable `g`, `h`.
- In a compactly assembled ∞-category, weakly compact, compact and strongly compact maps agree (EnhancedDerivedSheaves §E5:presentability.4).
- A compactly generated presentable ∞-category in which filtered colimits commute with finite limits is compactly assembled: the identity of a compact object is weakly compact, so a compact object is the colimit of the constant sequence along its identity.

Prove that the category of seminormed rings with contractive maps is compactly assembled (Scholze, Proposition 2.9, pp. 9–10). Route: for `r > 0` let `ℤ[T]_r` be the free seminormed ring on an element of norm at most `r`; for `r′ > r` the map `ℤ[T]_{r′} → ℤ[T]_r` is weakly compact because the norm of an element of a filtered colimit is the infimum of its norms at the stages, so `ℤ[T]_r = colim_{r′ > r} ℤ[T]_{r′}` is a sequential presentation along weakly compact maps; these free rings generate under colimits, and filtered colimits commute with finite limits in seminormed rings. The assertion is not made for Banach rings: completion does not transport it.

*Needs:* TropicalAndBerkovichArithmetic §0.12 (seminormed rings) and §0.16 (contractive colimits); EnhancedDerivedSheaves §E5:presentability.4 (weakly compact maps).

**Checks.**

- The map `ℤ[T]_{r′} → ℤ[T]_r` with `r′ > r` is weakly compact, but the identity of `ℤ[T]_r` is not: in the filtered colimit of the rings `ℤ[T]_{r+1/n}`, the element `T` has norm `r` in the colimit but norm `r + 1/n > r` at every stage, so no stage receives a map from `ℤ[T]_r` lifting it.
- A presentation along identity maps does not witness compact assembly: `ℤ[T]_r` is the colimit of the constant sequence on itself, but the identity is not weakly compact (previous check), so the presentation must shrink radii `r_n ↓ r`.
- In Banach rings the radius-shrinking maps are no longer weakly compact, so the route does not transfer. Write `ℤ⟨T⟩_r` for the completion of `ℤ[T]_r`, and let `Z_n = ℚ_p⟨x₁, …, x_n⟩` with the Gauss norm, a Banach ring through the contractive map `ℤ → ℚ_p` (`|m|_p ≤ 1 ≤ |m|` for `m ≠ 0`). The completed filtered colimit of the isometric inclusions `Z_n ⊂ Z_{n+1}` is `Z = ℚ_p⟨x₁, x₂, …⟩`, the series whose coefficients tend to zero, and `z = Σ_{n≥1} pⁿ x_n` lies in `Z` with `|z| = 1/p ≤ 1`, so `T ↦ z` is a contractive map `ℤ⟨T⟩₁ → Z`. For every `r′ > 1` its composite with `ℤ⟨T⟩_{r′} → ℤ⟨T⟩₁` factors through no `Z_n`: a factorization would send `T` to an element of `Z_n` equal to `z`, while `z` has the nonzero coefficient `p^{n+1}` at `x_{n+1}`. The same tower in seminormed rings has the uncompleted union as colimit, which does not contain `z`: there every element of a filtered colimit comes from a stage and only its norm is approximated (first Check), whereas in Banach rings an element may exist only after completion. This is the failure behind Scholze's warning after Proposition 2.9.

### 0.2 The arc-topology

Define the *arc-topology* on the opposite of the category of Banach rings: a family `{A → B_i}_{i∈I}` with common source covers when some finite subfamily induces a surjection `⨿_i M(B_i) → M(A)` (Scholze, Definition 3.1, p. 14). Put this structure on Mathlib's `CategoryTheory.GrothendieckTopology` through the sieves generated by covering families. For a Banach ring `A` let `Marc(A)` be the arc-sheafification of its representable presheaf. A *small arc-stack* is a sheaf of spaces on the arc-site with cutoff κ that is a small colimit of objects `Marc(A)`; the sheaf categories for different κ are identified along the fully faithful enlargement functors (Scholze, Propositions 3.2–3.3, pp. 14–15).

Prove the following API.

- Covers are stable under every base change `A → A′` (the completed pushout), and composites of covers are covers; this uses that the spectrum of a completed pushout surjects onto the fibre product of spectra.
- A family covers if and only if some finite subfamily has the following lifting property: every map from `A` to a geometric Banach point `C` lifts, after replacing `C` by a geometric Banach point extending it, to some `B_i`.
- `Marc` sends completed pushouts to fibre products of sheaves and has the universal property of arc-sheafification; enlarging κ does not change `Marc(A)` on κ-small objects.

**Checks.**

- The zero ring has empty spectrum, so the empty family covers it; for a nonzero `A` the spectrum is nonempty (TropicalAndBerkovichArithmetic §0.13), so maps `A → 0` never cover.
- An infinite family that is jointly surjective on spectra but has no finite jointly surjective subfamily is not a cover; a definition by joint surjectivity alone admits it.
- The uniform completion `A → A^u` induces an isomorphism `Marc(A) ≃ Marc(A^u)` even when `A → A^u` is not an isomorphism of rings (§0.3); so `Marc(A)(B)` is not the set of contractive maps `A → B`.

*Needs:* TropicalAndBerkovichArithmetic §§0.1, 0.13, 0.15, 0.16; Mathlib `CategoryTheory.GrothendieckTopology`; EnhancedDerivedSheaves §E2.7 (sheaves of spaces on a small site) and §E3.4 (`cutoffRightAdjoint_compat`); DiamondsAndVStacks §D0.23 (cutoff cardinals).

### 0.3 Uniformization and geometric arc-covers

For a Banach ring `A` let `A((T))_{1/2}` be the completion of the Laurent polynomial ring `A[T, T⁻¹]` for the norm `|Σ_n a_n Tⁿ| = Σ_n |a_n| 2^{−n}`; it is the free Banach `A`-algebra on a unit `T` with `|T| ≤ 1/2` and `|T⁻¹| ≤ 2` (Scholze, Example 3.4, p. 15), and for nonzero `A` one has `|T| = 1/2` and `|T⁻¹| = 2` in it. Prove that `A → A((T))_{1/2}` is an arc-cover and that `A((T))_{1/2}` is analytic, `T` being a topologically nilpotent unit; that uniform completion induces `Marc(A) ≃ Marc(A^u)`; that for a Banach ring `A` the map to the bounded product of the completed residue fields `K(x)`, `x ∈ M(A)`, is an arc-cover; that in characteristic `p` the uniform perfection with its rescaled norm is arc-equivalent to `A`; and that for a complex Banach algebra the Gelfand transform identifies `Marc(A)` with the compact Hausdorff space `M(A)` regarded as a condensed set, while for a real Banach algebra the same holds after base change to `ℂ` together with complex conjugation (Scholze, Examples 3.4–3.8 and Proposition 3.9, pp. 15–16). The zero ring is excluded from the first statement: its spectrum is empty and the empty family covers it (§0.2). The perfection uses the norm `|x^{1/p}| = |x|^{1/p}` after uniformization; an algebraic perfection with an arbitrary norm is not meant. The bounded product of the residue fields of `A` itself is in general neither analytic nor strict, because a residue field may be discrete; it becomes strict only after the arc-cover `A → A((T))_{1/2}` by an analytic ring, which makes every completed residue field nondiscrete, followed by completed algebraic closures of those residue fields (§0.5).

Prove the following API.

- The structure map `A → A((T))_{1/2}`, `a ↦ a T⁰`, is an isometric ring map, `T` is a unit, and every monomial has norm `|a Tⁿ| = |a| 2^{−n}`; for nonzero `A`, where `|1| = 1`, this gives `|T| = 1/2` and `|T⁻¹| = 2`.
- Universal property: for every Banach ring `B`, contractive map `g : A → B` and unit `u ∈ B` with `|u| ≤ 1/2` and `|u⁻¹| ≤ 2`, there is exactly one contractive ring map `A((T))_{1/2} → B` that restricts to `g` on `A` and sends `T` to `u`, namely `Σ_n a_n Tⁿ ↦ Σ_n g(a_n) uⁿ`; the series converges absolutely since `|g(a_n) uⁿ| ≤ |a_n| 2^{−n}` for every integer `n`, and uniqueness holds because Laurent polynomials are dense. Conversely, every contractive map out of `A((T))_{1/2}` sends `T` to a unit `u` with these two bounds.
- Functoriality: a contractive map `g : A → B` of Banach rings induces the contractive map `A((T))_{1/2} → B((T))_{1/2}`, `Σ_n a_n Tⁿ ↦ Σ_n g(a_n) Tⁿ`, which fixes `T` and is the map of the universal property for `u = T`; the identity of `A` induces the identity, and for a further contractive `h : B → B′` the map induced by `h ∘ g` is the composite of the maps induced by `g` and by `h`.
- Base change: for every contractive `A → B`, the map `A((T))_{1/2} ⊗̂_A B → B((T))_{1/2}` given by the functoriality map and the structure map of `B((T))_{1/2}` is an isometric isomorphism, because both sides corepresent pairs consisting of a contractive map out of `B` and a unit `u` with `|u| ≤ 1/2` and `|u⁻¹| ≤ 2`.

Route: check the geometric lifting criterion of §0.2 for each map, using that the spectral radius is unchanged by uniformization (TropicalAndBerkovichArithmetic §0.14), Gelfand–Mazur for archimedean Banach fields (TropicalAndBerkovichArithmetic §0.26) and the uniform Gelfand representation (TropicalAndBerkovichArithmetic §0.24). For `A → A((T))_{1/2}`, every point `x ∈ M(A)` extends: at a nonarchimedean `x` by the Gauss norm `max_n |a_n|_x 2^{−n}` of the circle `|T| = 1/2` over `K(x)`, at an archimedean `x`, where `K(x)` is `ℝ` or `ℂ` with `|·|^α`, `0 < α ≤ 1`, by evaluation at a complex `z` with `|z|^α = 1/2`; both are bounded by the sum norm, the second because `|·|^α` is subadditive. In a completed residue field of `A((T))_{1/2}` the norm is multiplicative, so `|T| ≤ 1/2` and `|T⁻¹| ≤ 2` force `|T| = 1/2`.

**Checks.**

- Let `k` be algebraically closed with the trivial norm. Its only completed residue field is `k`, so the bounded product of residue fields is `k`, which has no element of norm strictly between `0` and `1` and is not strict (§0.4). The cover `k((T))_{1/2}` has a single point, the `T`-adic norm with `|T| = 1/2`, since every bounded multiplicative norm is trivial on `k^×` and has `|T| = 1/2`; its completed algebraic closure is algebraically closed, nondiscrete and one-point, hence strict.
- The sum norm, not the supremum `max_n |a_n| 2^{−n}`, is needed over archimedean `A`: over `ℂ`, `f = 1 + 2T` has supremum norm `max(1, 1) = 1`, while `f² = 1 + 4T + 4T²` has supremum norm `max(1, 2, 1) = 2 > 1`, so the supremum is not submultiplicative; the sum norm gives `|f| = 2` and `|f²| = 1 + 2 + 1 = 4 ≤ |f|²`.
- For the zero ring the construction gives the zero ring, in which `|T| = 0`; this ring is covered by the empty family and is itself strict (§0.5), so nothing is lost by excluding it.
- Both bounds in the universal property are needed. Over `A = B = ℂ`, the unit `u = 1/2` gives evaluation at `1/2`, which sends `1 + 2T` to `2`, equal to its sum norm `2`, and `T^{−n}` to `2ⁿ`, equal to its sum norm. The unit `u = 1/3` satisfies `|u| ≤ 1/2` but has `|u⁻¹| = 3 > 2`, and it would send `T^{−n}`, of sum norm `2ⁿ`, to `3ⁿ`; so no contractive map sends `T` to `1/3`.

*Needs:* §0.2; TropicalAndBerkovichArithmetic §§0.14, 0.15, 0.16 (completed pushouts), 0.24, 0.26, 0.27.

### 0.4 Strictly totally disconnected Banach rings

Define a Banach ring `A` to be *totally disconnected* when it is analytic, uniform and `M(A)` is a profinite set, and *strictly totally disconnected* when moreover every completed residue field `K(x)` is algebraically closed (Scholze, Definition 3.10, p. 16). Every residue field of a strict ring is then a geometric Banach point: `ℂ` with a power `|·|^α`, `0 < α ≤ 1`, of its absolute value (TropicalAndBerkovichArithmetic §0.26), or an algebraically closed nondiscrete nonarchimedean field.

Prove the following API.

- If `A` is strictly totally disconnected and `U ⊂ M(A)` is clopen, the corresponding factor `A_U` of `A = A_U × A_{M(A)∖U}` (TropicalAndBerkovichArithmetic §0.25) is strictly totally disconnected, and the decomposition is isometric.
- For a strict `A` and `x ∈ M(A)`, the map `A → K(x)` is surjective and `K(x)` is algebraically closed and nondiscrete.
- Finite products of strict rings, and bounded products of nondiscrete algebraically closed Banach fields, are strictly totally disconnected.

**Checks.**

- A nondiscrete complete algebraically closed field, nonarchimedean or `ℂ` with `|·|^α`, `0 < α ≤ 1`, is strictly totally disconnected: its spectrum is one point and its residue field is itself. For `α = 1/2`, `|1/2|^{1/2} = 2^{−1/2} < 1`, so `1/2` is a topologically nilpotent unit and the field is analytic; a definition admitting only the standard absolute value would miss it.
- `ℝ` with its absolute value has one-point spectrum and is analytic and uniform, but its residue field is not algebraically closed; it is totally disconnected and not strict. A definition testing only the topology of `M(A)` accepts it.
- For an infinite index set `I` and nondiscrete algebraically closed fields `C_i`, the bounded product has spectrum the Stone–Čech compactification `βI`, including the nonprincipal ultrafilter points, whose residue fields are ultraproducts; it is not the discrete set `I`.
- A discrete algebraically closed field `k` with the trivial norm is not analytic (no element has norm strictly between 0 and 1), hence not strict.

*Needs:* §0.2; TropicalAndBerkovichArithmetic §§0.15, 0.24, 0.25, 0.26.

### 0.5 The strict basis and restricted subcanonicity

Prove: every Banach ring admits an arc-cover by a strictly totally disconnected ring; the arc-topology on strictly totally disconnected Banach rings is subcanonical; and on perfectoid Banach rings with `|p| < 1` it is subcanonical (Scholze, Proposition 3.11, Corollary 3.12, Theorems 3.13–3.14, pp. 17–18). Subcanonicity of the whole Banach arc-site is not asserted and is false.

Route: the zero ring has empty spectrum and is itself strict (it is analytic, uniform and `M(0) = ∅` is profinite). For a nonzero `A`, first pass to the arc-cover `A → A((T))_{1/2}` of §0.3 by an analytic ring, whose completed residue fields all contain `T` with `|T| = 1/2` and are therefore nondiscrete; choose completed algebraic closures of these residue fields, which are nondiscrete and algebraically closed, and take their bounded product. Its spectrum is the Stone–Čech compactification of the index set with Banach ultraproducts as residue fields, all algebraically closed (Scholze, Proposition 3.11), so it is strict; the map from the bounded product of the residue fields of `A((T))_{1/2}` induces a homeomorphism of these Stone–Čech compactifications, hence is an arc-cover, and composing with the covers of §0.3 gives the strict cover of `A`. For strict rings, reduce by uniformity and profiniteness of spectra to a cover `K → L` of geometric Banach points and check that the uniform completion of `L ⊗̂_K L` has equalizer `K` (types 2–4 of points of the closed disc). For perfectoid rings, use that completed pushouts of perfectoid rings are perfectoid and v-descent of the structure sheaf after choosing rings of integral elements.

*Needs:* §§0.3–0.4; TropicalAndBerkovichArithmetic §§0.24, 1.2; PerfectoidSpaces §P2.13 (completed tensor products of perfectoid pairs are perfectoid, uniform and pushouts); DiamondsAndVStacks §D2.7 (`vTopology_subcanonical`, v-descent of `O` and `O⁺`).

### 0.6 Quasi-pro-étale maps

Define a map of Banach rings `A → B` to be *quasi-pro-étale* when for every map `A → C` to an algebraically closed Banach field `C`, discrete or not, the uniform completion of `B ⊗̂_A C` is isomorphic to `Cont(S, C)` for a profinite set `S`, with the supremum norm (Scholze, Definition 4.3, p. 19). The base change includes uniform completion. For analytic `A`, hence for every strict `A`, only nondiscrete `C` occur, so the condition may be tested on geometric Banach points: a topologically nilpotent element of `A` has image of norm zero in a discrete field, while finitely many of them generate the unit ideal, so an analytic ring admits no map to a discrete Banach field.

Prove the following API.

- Quasi-pro-étale maps are stable under base change and composition, and clopen restrictions `A → A_U` are quasi-pro-étale.
- For `A` strictly totally disconnected, the category of quasi-pro-étale `A`-algebras that are themselves strictly totally disconnected is equivalent to the category of profinite sets over `M(A)` (Scholze, Lemmas 4.4–4.6, pp. 19–20); both rings must be strict for this description.
- For a strict `A` and a closed subset `Z ⊂ M(A)`, the completed filtered colimit `A_Z` of the factors `A_U` over the clopen `U ⊃ Z` is strict with `M(A_Z) = Z`, and `A → A_Z` is quasi-pro-étale: for a point `A → C` over `x ∈ M(A)`, the uniform completion of `A_Z ⊗̂_A C` is `C` if `x ∈ Z` and `0` otherwise, that is `Cont(S, C)` with `S` a point or empty. So a finite cover of `M(A)` by closed subsets gives a quasi-pro-étale arc-cover.

**Checks.**

- The identity of a geometric point `C` corresponds to the one-point profinite set.
- The test class contains the discrete algebraically closed fields: the identity of such a field is quasi-pro-étale with `S` a point, and for a non-analytic `A` a definition tested on geometric Banach points alone would impose fewer conditions than Definition 4.3.
- For an infinite profinite set `S`, `Cont(S, C)` is strictly totally disconnected and quasi-pro-étale over `C` without being finite étale; a definition by finite étaleness rejects it.
- The closed unit ball `C⟨T⟩₁` over a nonarchimedean geometric point is not quasi-pro-étale: its spectrum, the Berkovich disc, is connected and not profinite.
- An arc-cover of strict rings with one-point spectra need not be quasi-pro-étale. For a nonarchimedean geometric point `C` let `C′` be the completed algebraic closure of the completed residue field at the Gauss point of `C⟨T⟩₁`. Then `C → C′` is an arc-cover of strict rings, but its base change along the identity of `C` would give `C′ ≅ Cont(S, C)` with `S` a point, that is `C′ = C`, whereas `T ∈ C′` has distance `|T − c| = max(1, |c|) ≥ 1` from every `c ∈ C`. A definition of quasi-pro-étale covers as arc-covers between strict rings accepts it.

*Needs:* §§0.4, 0.5; TropicalAndBerkovichArithmetic §§0.16 (the spectrum of a completed filtered colimit), 0.24, 0.25, 1.1 (the Gauss point).

### 0.7 Repleteness of the arc-topos

Prove that the arc-topos, the category of sheaves of sets on the arc-site, satisfies Tau Ceti's `TauCeti.IsReplete`: the projection from the limit of a countable tower of epimorphisms of arc-sheaves onto its first term is an epimorphism. Consequently its hypercomplete ∞-topos of sheaves of spaces is Postnikov complete (Scholze, proof of Theorem 4.20, p. 24; geometric-point criterion, §3, pp. 14–15), by the theorem that the hypercomplete ∞-topos of every replete topos is Postnikov complete (Mondal–Reinecke, Theorem A, p. 1, with Postnikov completeness in the sense of their Definition 3.5, p. 8). Countable repleteness is not a claim that all limits preserve epimorphisms.

Route: by the finite-subfamily criterion of §0.2, an epimorphism is detected after passing to geometric Banach points; lift a countable tower of covers successively along field extensions and complete the union of the resulting tower of fields, which gives a simultaneous lift. The Postnikov consequence is the theorem that a replete topos has a Postnikov complete hypercomplete ∞-topos; left completeness of the derived category of abelian sheaves (EnhancedDerivedSheaves §E2.3) does not give the space-valued statement.

*Needs:* §§0.2, 0.5; Tau Ceti `TauCeti.IsReplete`; EnhancedDerivedSheaves §§E2.1, E2.3, E2.7 and the replete Postnikov theorem (gap:replete-postnikov).

### 0.8 Affine spaces, schemes and analytic spaces as arc-stacks

For `n ≥ 0` and an integer `r ≥ 1` let `ℤ⟨T₁, …, T_n⟩_r` be the completion of `ℤ[T₁, …, T_n]` for the norm `|Σ_ν a_ν T^ν| = Σ_ν |a_ν| r^{|ν|}`, where `|a_ν|` is the archimedean absolute value. It is the free Banach ring on `n` elements of norm at most `r`: a contractive map from it to a Banach ring `B` is the same as an `n`-tuple of elements of `B` of norm at most `r`, because `|m · 1_B| ≤ |m|` for every integer `m` (TropicalAndBerkovichArithmetic §0.16, where `ℤ` with its absolute value is the initial Banach ring, so that `Marc(ℤ)` is the terminal arc-sheaf). For a small arc-stack `X` define the *affine space* `Aⁿ_X = X × colim_r Marc(ℤ⟨T₁, …, T_n⟩_r)`, the increasing union over `r` of the closed polydiscs of radius `r` over `X`.

Let `A` be a Banach ring and `Y` a scheme locally of finite presentation over the underlying ring of `A` (Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation`). For affine `Y = Spec A[T₁, …, T_n]/(f₁, …, f_m)` let `Y^arc → Marc(A)` be the union over `r` of the `Marc(B_r)`, where `B_r` is the quotient of `A ⊗̂ ℤ⟨T₁, …, T_n⟩_r` by the closure of the ideal `(f₁, …, f_m)`, with the quotient norm; it is the closed arc-subsheaf `{f₁ = ⋯ = f_m = 0}` of `Aⁿ_{Marc(A)}`. For general `Y`, let `Y^arc` be the colimit, in arc-sheaves of sets, of `V ↦ V^arc` over the affine opens `V ⊂ Y` and their inclusions. The *multiplicative group* `G_m ⊂ A¹_X` is `X × (Spec ℤ[T, T⁻¹])^arc`, the union of the closed annuli `{|T| ≤ r, |T⁻¹| ≤ r}`. The *projective space* `ℙⁿ_X`, `A²_X ∖ {0}`, `GL_{n,X}` and `GL_n/G_m^n` over `X` are the products with `X` of the arc-stacks of the corresponding schemes over `ℤ`: `ℙⁿ_ℤ = Proj(Sym ℤ^{n+1})` and the punctured plane of the Tau Ceti contract, `GL_{n,ℤ}` the spectrum of `ℤ[x_{ij}, det⁻¹]`, and `GL_n/G_m^n` the affine scheme of ordered decompositions of the trivial rank-`n` bundle into `n` line bundles. For a group arc-sheaf `G` over `X`, `∗/G` is the geometric realization of the bar construction `[k] ↦ G^k` in arc-stacks over `X`, and `BG_m = ∗/G_m`.

For a complete nonarchimedean field `K`, trivially valued or not, and a `K`-analytic space `U` (TropicalAndBerkovichArithmetic §0.21), let `U^arc → Marc(K)` be the colimit, in arc-sheaves of sets, of `V ↦ Marc(A_V)` over the affinoid domains `V ⊂ U` and their inclusions (TropicalAndBerkovichArithmetic §0.19). The affinoid algebra `A_V` may carry any of its equivalent Banach norms: `Marc(A_V) ≃ Marc(A_V^u)` (§0.3), and bounded maps of affinoid algebras are contractive for the spectral seminorms. Scholze's statements about affine spaces, projective lines and analytic spaces concern these arc-stacks (Scholze, §1, p. 4; Example 4.26, p. 26; Lemma 5.11, p. 30; Corollary 9.6, p. 52).

Prove the following API.

- On strict rings: for a strictly totally disconnected Banach `A`-algebra `B`, `Y^arc(B)` is the set of `A`-morphisms `Spec B → Y`. In particular, for every Banach ring `A′`, `Marc(A′)(B)` is the set of contractive maps `A′ → B`; `Aⁿ_X(B) = X(B) × Bⁿ`, `G_m(B) = X(B) × B^×` and `ℙⁿ_X(B) = X(B) × ℙⁿ(B)`; and `Y^arc` does not depend on the chosen presentations.
- `Y ↦ Y^arc` is a functor to arc-stacks over `Marc(A)` that preserves finite limits, commutes with base change along every contractive map `A → A′`, `(Y ×_{Spec A} Spec A′)^arc = Y^arc ×_{Marc(A)} Marc(A′)`, and sees only the reduced scheme, `Y^arc = (Y_red)^arc`.
- An open immersion `V ⊂ Y` gives an arc-subsheaf `V^arc ⊂ Y^arc` whose pullback along every map `Marc(B) → Y^arc` is given by an open subset of `M(B)`; an open cover of `Y` gives a cover of `Y^arc`, so that `Y^arc` is the colimit of the Čech nerve formed by the arc-stacks of the members of the cover and of their finite intersections.
- `ℙⁿ_X` is covered by the `n + 1` closed unit polydiscs `{|x_j/x_i| ≤ 1 for all j}`, `0 ≤ i ≤ n`, which are affine over `X`; the arc-stack of a closed subscheme of `ℙⁿ` over `A` is covered by the `n + 1` closed affine pieces in which it meets them, and their finite intersections are again affine.
- For `K` and `U` as above: `M(A)^arc = Marc(A)` for an affinoid space `M(A)`; an affinoid domain `V ⊂ U` gives a monomorphism `Marc(A_V) → U^arc`, and an open subset of `U` an arc-subsheaf as in the third bullet; for a geometric Banach point `C` over `K`, `U^arc(C)` is the set of pairs of a point `x ∈ U` and an isometric `K`-embedding of its completed residue field `H(x) → C`; and for `Y` locally of finite type over `K`, `(Y^an)^arc ≃ Y^arc` with `Y^an` the analytification of TropicalAndBerkovichArithmetic §0.22, compatibly with open immersions.

Route: arc-covers of strict rings are isometric, because the norms are spectral and the covers are surjective on spectra, and a strict ring is the equalizer of its two maps to the uniform completed tensor square of a strict cover (§0.5); so contractive maps into strict rings form an arc-sheaf on the strict basis, and arc-sheaves are determined by their restriction to it, every Banach ring having a strict cover (§0.5). A morphism `Spec B → Y` from a strict `B` factors through affine opens on the pieces of a finite clopen partition of `M(B)`: the kernel of each `x ∈ M(B)` is a maximal ideal, `B → K(x)` being surjective (§0.4), the locus where a function does not vanish is open, `M(B)` is profinite, and an element vanishing nowhere on a clopen piece is a unit of the corresponding factor (TropicalAndBerkovichArithmetic §§0.14, 0.25). The same nonvanishing loci show that open immersions give open subsets of spectra, every maximal ideal of a Banach ring being the kernel of a point (TropicalAndBerkovichArithmetic §§0.13–0.14). Reducedness holds because a strict ring is uniform, so that `b² = 0` gives `|b|² = |b²| = 0`. On `ℙⁿ`, at each point of `M(B)` some homogeneous coordinate has maximal absolute value, and the resulting closed loci give finitely many rational localizations of `B` that together cover `M(B)`, hence an arc-cover. For analytic spaces, a finite cover of an affinoid domain by affinoid domains is an arc-cover, being a finite family surjective on spectra, and the universal property of affinoid domains on affinoid test spaces (TropicalAndBerkovichArithmetic §0.19) extends to strict rings through their spectral norms; for `Y^an` use its bounded-radius affinoid charts `{|T_i| ≤ r}`, whose contractive maps into strict rings are those of the `B_r`.

**Checks.**

- `(Spec A)^arc = Marc(A)`, `A⁰_X = X`, and the empty scheme gives the empty arc-sheaf. For strict `B`, `A¹_{Marc(ℤ)}(B) = B`: an element `b` lies in the stage `r` exactly when `|b| ≤ r`, and every element has finite norm.
- Let `k` be algebraically closed with the trivial norm. `A¹_{Marc(k)}` contains the closed disc `{|T| ≤ ρ}` of every radius `ρ > 0`, for `ρ < 1` the arc-stack `Marc(k[[T]])` with the norm `ρ^{ord_T}`, although `|k^×| = {1}`; its value at a geometric Banach point `C` over `k` is `C`, not `k`. A carrier built from `k`-points, or from discs whose radii lie in `|k^×|`, sees only `k` and the unit disc.
- Nonreduced structure is invisible: `(Spec K[ε]/(ε²))^arc = Marc(K)` for every Banach field `K`, since on a strict ring `ε² = 0` forces `ε = 0`. So `Y ↦ Y^arc` is not faithful on nonreduced schemes: the endomorphisms `ε ↦ 0` and `ε ↦ ε` of `K[ε]/(ε²)` give the same map.
- At the complex point `Marc(ℂ ⊗̂ ℤ⟨T⟩_r)` is the compact disc `{|z| ≤ r}` regarded as a condensed set (§0.3), so `A¹_{Marc(ℂ)}`, `G_m` and `ℙ¹_{Marc(ℂ)}` are the plane, the punctured plane and the Riemann sphere. The sum norm cannot be replaced by the supremum `max_ν |a_ν| r^{|ν|}`, which is not submultiplicative over `ℤ` with its absolute value: for `r = 1`, `1 + T` has supremum `1` and `(1 + T)² = 1 + 2T + T²` has supremum `2`.
- Separation is not built in. For the line with doubled origin over a nonarchimedean geometric point `C`, glued from two copies of `A¹_C` along `G_m`, the fibre product of the two charts in its arc-stack is `G_m`, embedded in `A¹_C × A¹_C` as `{T₁ = T₂ ≠ 0}`; this locus is not closed in the spectrum of the closed bidisc, since it contains the points `T₁ = T₂ = ϖⁿ`, `0 < |ϖ| < 1`, and not their limit `T₁ = T₂ = 0`. The separation hypotheses of §§4.2 and 4.5 are conditions on the curve, not consequences of the construction.

*Needs:* §§0.2–0.5; TropicalAndBerkovichArithmetic §§0.13, 0.14, 0.16, 0.19, 0.21, 0.22, 0.25; Mathlib `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.Proj`; Tau Ceti `TauCeti.SymmetricAlgebra.projToSpec`, `TauCeti.AlgebraicGeometry.projectiveLine`, `TauCeti.puncturedAffineSpace`.

### Examples

Let `A = ℂ × ℂ` with the maximum norm. Its spectrum consists of two points, and the two projections `A → ℂ` together form an arc-cover; either projection alone misses a point and does not cover. Both factors are strictly totally disconnected and so is the product. Replacing the finite product by a bounded product over an infinite set `I` introduces the ultrafilter points of `βI`; checking only the principal points then fails to describe the spectrum. The zero ring is covered by the empty family because its spectrum is empty.

### Dependencies

TropicalAndBerkovichArithmetic Layers 0–1; EnhancedDerivedSheaves §§E2.1–E2.7, E3.4, E5:presentability.4; PerfectoidSpaces §P2.13; DiamondsAndVStacks §§D0.23, D2.7; Mathlib `CategoryTheory.GrothendieckTopology`, `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.Proj`; Tau Ceti `TauCeti.SymmetricAlgebra.projToSpec`, `TauCeti.AlgebraicGeometry.projectiveLine`, `TauCeti.puncturedAffineSpace`, `TauCeti.IsReplete`; gap replete-postnikov.

## Layer 1: Finitary sheaves and proper base change

This layer constructs finitary derived arc-sheaves and proves the hyperdescent criterion on the strict basis, the comparisons at complex and geometric points, finitary adjoints, excision and proper base change for maps of finite cohomological dimension; it ends with the étale finitary sheaves, those invariant under extensions of geometric Banach points.

### 1.1 The finitary hypersheaf criterion on the strict basis

Prove: every functor from strictly totally disconnected Banach rings to spaces that preserves finite products and filtered colimits (completed filtered colimits of rings) extends uniquely to a hypercomplete arc-sheaf; for such a functor with values in abelian groups, the positive arc-cohomology of a strict ring vanishes; the same holds for functors with values in a compactly assembled ∞-category in which filtered colimits commute with finite limits (Scholze, Theorem 4.1 and Remark 4.2, pp. 19–20; Lemmas 4.7–4.9, pp. 20–22).

Route: extend `n`-truncated functors along quasi-pro-étale maps, which are filtered colimits of finite clopen decompositions (Lemma 4.7). Prove the splitting lemma: an arc-cover of a strict ring is a completed filtered colimit of split maps; by the compact assembly of seminormed rings (§0.1) reduce to finitely many approximate relations, and split a surjective open subset of affine space over a strict ring by algebraic closedness of residue fields and clopen patching. For each `n`, commute the finite descent limits of `n`-truncated functors through the filtered colimit of split maps, then pass to the Postnikov limit; infinite totalizations are exchanged with filtered colimits only after truncation.

*Needs:* §§0.1, 0.5, 0.6, 0.8 (affine space over a strict ring, for the splitting lemma); EnhancedDerivedSheaves §§E2.6–E2.7 (hypercovers, sheaves of spaces) and §E3.2 (Kan extension along the basis).

### 1.2 Finitary derived arc-sheaves

For a small arc-stack `X` define `Dfin(X, ℤ)` as the full subcategory of the enhanced derived category of hypercomplete abelian arc-sheaves on `X` consisting of those `M` whose restriction to strict rings over `X` commutes with completed filtered colimits; equivalently, by §1.1, the ∞-category of functors from strict rings over `X` to `D(ℤ)` preserving finite products and filtered colimits (Scholze, Definition 4.10 and Remark 4.11, p. 22; Propositions 4.12–4.13, pp. 22–23). The same definition with coefficients in a ring `Λ` gives `Dfin(X, Λ)`.

Prove the following API.

- Restriction to the strict basis is an equivalence onto the functors preserving finite products and filtered colimits.
- Pullback along maps of small arc-stacks preserves finitary sheaves, is symmetric monoidal for the derived tensor product, and is coherently functorial.
- `Dfin(X, ℤ)` is closed under all colimits and truncations in the derived category of arc-sheaves, is stable, and is left complete.
- A bounded-below finitary sheaf commutes with completed filtered colimits of all Banach rings over `X`, not only strict ones; for unbounded objects this extension needs a uniform bound on cohomological dimension.

**Checks.**

- On a strict ring, a finitary abelian sheaf in degree zero has vanishing positive cohomology (§1.1). For the non-strict ring of the closed annulus `{r₁ ≤ |T| ≤ r₂}` over a nonarchimedean geometric point, with `ℓ` prime to the residue characteristic, `H¹` of the constant sheaf `ℤ/ℓ` is `ℤ/ℓ`, generated by the Kummer class of `T` (§3.5); so the vanishing is a property of the strict basis.
- At the complex point `Marc(ℂ)` the homotopy category of `Dfin` is the unbounded derived category of abelian groups: the cohomology of `ℤ[0]` is `ℤ` in degree zero and zero elsewhere.
- For `A = Cont(S, C)` with `S` infinite profinite, `A` is the completed filtered colimit of the rings `C^{S_j}` over the finite quotients `S → S_j`. The constant sheaf `ℤ` takes the value `colim_j ℤ^{S_j}` = locally constant functions `S → ℤ` on both sides and is finitary; the presheaf of all functions `M(A) → ℤ` takes the value `ℤ^S` at `A` but `colim_j ℤ^{S_j} ≠ ℤ^S`, so it is not finitary.

*Needs:* §1.1; EnhancedDerivedSheaves §E1.3 (enhanced derived categories of sheaves), §E0.4 (stable ∞-categories), §E5:abstract.1 and §E5:abstract.4 (symmetric monoidal stable structures), §E2.3 (left completeness).

### 1.3 Complex and geometric-point comparisons

Prove: for a complex Banach algebra `A`, `Dfin(Marc(A), ℤ)` is the left completion of the derived category of abelian sheaves on the compact Hausdorff space `M(A)`; for every finitary `M`, every nondiscrete Banach field `K` and a completed algebraic closure `C` of `K`, `M(K) ≃ M(C)^{hG_K}`, the homotopy fixed points for the continuous action of the absolute Galois group, computed by continuous cohomology; and for `A` a Banach ring and `M` bounded below, the stalk at `x ∈ M(A)` of the pushforward of `M` along `ν : Marc(A)_arc → M(A)` to the site of open subsets of `M(A)` is `M(K(x))` (Scholze, Theorem 4.14, Propositions 4.15–4.16, pp. 23–24).

Route: on strict complex rings identify the arc-site with profinite sets over `M(A)` (§0.3), where finitary sheaves are ordinary sheaves, and descend; at a Banach field use the site of profinite `G_K`-sets; for the stalk formula extend bounded-below finitary sheaves to all Banach algebras over `A` and identify neighbourhood germs with the completed residue field.

*Needs:* §§0.3, 0.6, 1.2; EnhancedDerivedSheaves §E2.3 (left completion); Mathlib `continuousCohomology`; ProfiniteCohomology §10.2 (filtered colimits of coefficients); DiamondsAndVStacks §D0.22 (ordinary sheaves on profinite sets).

### 1.4 Finitary maps and open immersions

Define a map of small arc-stacks `f : Y → X` to be *finitary* when, for every completed filtered colimit `A = colim A_i` of strict rings, the square with corners `colim Y(A_i)`, `Y(A)`, `colim X(A_i)`, `X(A)` is cartesian; and an *open immersion* to be a map whose pullback to every `Marc(A)` is induced by an open subset of `M(A)` (Scholze, Definitions 4.21–4.22 and Lemma 4.23, pp. 24–25). The condition is relative: it is not filtered continuity of `Y` itself.

Prove the following API.

- Finitary maps are stable under composition, pullback and colimits in the slice over `X`; if `g` and `g ∘ f` are finitary then so is `f`.
- A monomorphism is finitary if and only if it is an open immersion.
- For `a ∈ A` and `r > 0`, the locus `{|a| < r}` in `Marc(A)` is an open immersion; the locus `{|a| ≤ r}` is not open in general.

**Checks.**

- Every identity is finitary, even when `X` has no absolute continuity property.
- The locus `{|a| < r}` is finitary because the norm of an element of a filtered colimit is the infimum of its norms at the stages. For `a = 0`, or for `r` larger than the spectral radius of `a`, it is the whole space; for `a = 1` and `r ≤ 1` it is empty; both degenerate cases are open immersions (the identity and the empty substack).
- For `A = Cont([0,1], ℂ)`, the inclusion of the point `{0}` is a monomorphism that is not an open immersion, hence not finitary; a definition requiring only injectivity accepts it.

*Needs:* §1.2; TropicalAndBerkovichArithmetic §§0.16, 0.25.

### 1.5 Proper maps and cohomological dimension

For a small arc-stack `X` define its *cohomological dimension* `d(X)` as the cohomological dimension of `M ↦ M(X)` on `Dfin(X, ℤ)`, measured on objects in degree zero. A 0-truncated map `f : Y → X` is *proper* when it is quasi-compact and quasi-separated; its cohomological dimension `d(f)` is the supremum of `d(Y_x)` over geometric points `x` of `X`, and `f` has locally finite cohomological dimension when its pullback to every quasi-compact substack of `X` has finite cohomological dimension (Scholze, Definitions 4.17 and 4.19, Corollary 4.18, pp. 23–24). Dimensions may be infinite; a finite bound is a hypothesis of each theorem that uses it.

Prove the following API.

- For an analytic Banach ring `A`, `d(Marc(A))` is at most the cohomological dimension of the compact Hausdorff space `M(A)` plus the supremum over `x ∈ M(A)` of the cohomological dimension of `G_{K(x)}` on discrete `ℤ`-modules.
- Properness and the bound `d(f) ≤ n` are preserved by base change.
- Local finiteness of dimension can be checked on quasi-compact charts of the target.

**Checks.**

- A strict affine `Marc(A)` has `d = 0`, by §1.1.
- A profinite set over a geometric point has `d = 0`.
- The map `B(ℤ/2) → ∗` from the classifying stack of the constant group of order two is not 0-truncated, hence not proper in this sense; a definition by quasi-compactness alone accepts it.

*Needs:* §§1.2–1.3; Tau Ceti `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`; AlgebraicKTheory §4.3 (covering dimension); EnhancedDerivedSheaves §E2.4 and the compact Hausdorff dimension statement (gap:compact-hausdorff-dimension).

### 1.6 Finitary left adjoints and excision

Prove: for finitary `f : Y → X`, the pullback `f^* : Dfin(X, ℤ) → Dfin(Y, ℤ)` has a left adjoint `f_♯` satisfying the projection formula; for an open immersion `j : U → X` with closed complement `i : Z → X`, `j_! = j_♯` and `j_! j^* M → M → i_* i^* M` is a cofibre sequence for every `M ∈ Dfin(X, ℤ)`; the loci `{|2| > 1}` and `{|2| ≤ 1}` decompose every small arc-stack into its archimedean open part and its nonarchimedean closed part (Scholze, Propositions 4.24–4.25, pp. 25–26). The threshold `|2|` separates archimedean from nonarchimedean points; it is not a choice of residue characteristic.

Route: construct the left adjoint in the enhanced slice sheaf category, with finitarity preserved by composition of finitary maps; check the projection formula on free generators; identify the open–closed sequence on strict rings, where it is the sequence for an open subset of a profinite set, and descend.

*Needs:* §§1.2, 1.4; EnhancedDerivedSheaves §E3.2 (adjoints of colimit-preserving functors) and §E3.4 (`coherentMate`).

### 1.7 Proper base change for finitary sheaves

Prove: for a 0-truncated proper map `f : Y → X` of small arc-sheaves with `d(f)` finite, `f_*` preserves finitary sheaves, `f_*` of a sheaf in degree zero is concentrated in degrees `[0, d(f)]`, and `f_*` commutes with every base change along maps of small arc-stacks; if `f` is moreover *quasi-pro-étale*, meaning that for every geometric Banach point `Marc(C) → X` the fibre `Y ×_X Marc(C)` is `Marc(Cont(S, C))` for a profinite set `S`, then `f_*` satisfies the projection formula (Scholze, Theorem 4.20 and Example 4.26, pp. 24, 26, where the condition is that all geometric fibres are profinite sets). For `Marc(B) → Marc(A)` with `A → B` quasi-pro-étale in the sense of §0.6 the condition holds: `Marc(A)(C)` is the set of contractive maps `A → C` (§0.8), and `Marc(B) ×_{Marc(A)} Marc(C) = Marc(B ⊗̂_A C) = Marc(Cont(S, C))`, by §0.2 and uniform completion (§0.3). A projection formula for general proper `f` is not part of this statement: it fails before stabilization (§3.3) and holds after it (§§8.4, 9.4). Bounded-below preservation does not use finiteness of `d(f)`; the unbounded statement does.

Route: resolve the qcqs source by affine charts and prove bounded-below finitary preservation using continuity for all Banach algebras (§1.2); pass to unbounded objects using repleteness (§0.7) and finite `d(f)`; compute base change by slices and geometric fibres; for quasi-pro-étale `f` write each fibre as an inverse limit of finite sets and use the finite-set projection formula.

**Checks.**

- The fold map `X ⨿ X → X` is quasi-pro-étale: its fibre over every geometric Banach point is `Marc(C) ⨿ Marc(C) = Marc(C × C) = Marc(Cont(S, C))` with `S` the two-point set.
- Over a geometric Banach point `C`, the projection `ℙ¹_C → Marc(C)` is proper of finite cohomological dimension (§2.7(c)) and not quasi-pro-étale: its fibre over the identity of `C` is `ℙ¹_C` itself, whose underlying space, the Riemann sphere for `C = ℂ` and the Berkovich projective line otherwise, is connected and infinite, hence not a profinite set `S`. For nonarchimedean `C` the effective projection formula fails for this map (§3.3; Scholze, Example 4.26, p. 26), so the quasi-pro-étale hypothesis is not idle. At `C = ℂ` it holds: there `f_*` is `RΓ(S², −)` on sheaves on the sphere (§§0.8, 1.3), of cohomological dimension `2`, so both sides of the projection formula are exact and colimit-preserving in `M ∈ D(ℤ)` and agree at `M = ℤ`, which generates `D(ℤ)`.
- For `A = Cont([0,1], ℂ)`, the inclusion `{0} → Marc(A)` is proper and quasi-pro-étale, its geometric fibres being a point or empty, although it is not finitary (§1.4, Checks); the projection formula of this statement holds for it.

*Needs:* §§0.2, 0.3, 0.6, 0.7, 0.8, 1.2, 1.5; EnhancedDerivedSheaves §§E2.2–E2.4.

### 1.8 Étale finitary sheaves

For a small arc-stack `X` and a commutative ring `Λ`, call `M ∈ Dfin(X, Λ)` *étale* when, for every extension `C ⊂ C′` of geometric Banach points over `X` (a contractive map of geometric Banach points compatible with their points of `X`; it is isometric, both norms being multiplicative), the restriction `M(C) → M(C′)` is an equivalence. Let `Det(X, Λ)` be the full subcategory of `Dfin(X, Λ)` of étale objects. The condition compares values of `M` on pairs of geometric Banach points and is stated inside the arc-topos; this roadmap constructs no étale topology on Banach rings, and none is needed (the same condition is taken as the definition in Scholze, Remark 1.4, pp. 3–4, and in the paragraph before Proposition 5.9, p. 28). For small v-stacks the étale derived category is the one of DiamondEtaleCohomology §C2.2, which lives on another site; the two are compared at geometric points in the Checks below and, for torsion prime to `p`, in §12.3.

Prove, for every commutative ring `Λ`:

- `Det(X, Λ)` is a stable full subcategory of `Dfin(X, Λ)` closed under all colimits, and an object is étale if and only if all its cohomology sheaves are; so `Det(X, Λ)` inherits a t-structure whose heart consists of the étale abelian sheaves of `Λ`-modules.
- Pullback along every map `g : Y → X` of small arc-stacks carries `Det(X, Λ)` into `Det(Y, Λ)`; and `M ∈ Dfin(X, Λ)` is étale if and only if its pullback to `Marc(A)` is étale for every strict `A` over `X`.
- For a strict `A` and `ν : Marc(A)_arc → M(A)` as in §1.3, the stalk of `ν_* M` at `x ∈ M(A)` is `M(K(x))` for every `M ∈ Dfin(Marc(A), Λ)`, and `ν_*` restricts to an equivalence from `Det(Marc(A), Λ)` to the derived ∞-category `D(M(A), Λ)` of sheaves of `Λ`-modules on the profinite set `M(A)`, with inverse `F ↦ (B ↦ RΓ(M(B), π_B^* F))` on strict Banach `A`-algebras `B`, where `π_B : M(B) → M(A)`. For a geometric Banach point `C` this is `Det(Marc(C), Λ) ≃ D(Λ)`, `M ↦ M(C)`.

Route: restriction to the strict basis identifies `Dfin` with the functors preserving finite products and filtered colimits (§1.2), a class closed under pointwise colimits and finite limits, so evaluation at a geometric Banach point, which is strict (§0.4), preserves colimits and finite limits; positive arc-cohomology of finitary abelian sheaves vanishes on strict rings (§1.1), so evaluation there commutes with the truncations. A geometric point over `Y` is one over `X`, and every geometric point is itself strict. For strict `A`, `K(x)` is the completed filtered colimit of the strict factors `A_U` over the clopen neighbourhoods `U` of `x` (§0.4; TropicalAndBerkovichArithmetic §§0.16, 0.25), so finitarity gives the stalk formula with no boundedness hypothesis. For strict `B` over `A` and `y ∈ M(B)` over `x`, the comparison `π_B^* ν_* M → ν_{B*} M` is `M(K(x)) → M(K(y))` on stalks, an equivalence for étale `M`; stalks detect equivalences on a profinite set, so `M(B) = RΓ(M(B), π_B^* ν_* M)`. The inverse functor preserves finite products and filtered colimits, because the spectrum of a completed filtered colimit is the inverse limit of the spectra (TropicalAndBerkovichArithmetic §0.16) and sections over profinite sets commute with such limits; its value at a geometric point is a stalk of `F`, so it lands in étale objects, and §1.1 extends it to finitary sheaves.

**Checks.**

- At a geometric Banach point `C` an étale `M` takes the value `RΓ(M(B), M(C))` on a strict `B` over `C`: `M(C) ⊕ M(C)` for `B = C × C`, and `C(S, ℤ) ⊗ M(C)`, with `C(S, ℤ)` the locally constant integer-valued functions, for `B = Cont(S, C)` and `S` profinite. The constant sheaf `Λ` is étale. When `C` has characteristic `p`, `Spa(C, O_C)` is a one-point strictly totally disconnected perfectoid space whose étale derived category is also `D(Λ)` (DiamondEtaleCohomology §§C0.19, C2.2), so at geometric points of characteristic `p` the two étale categories agree.
- Integrally, `Det(X, ℤ)` and `Deff_mot(X)` are in general not contained in one another. Over a nonarchimedean geometric point `C` with residue field `k`, `Ḡ_m` is effective (§3.3) but not étale: for `C′` the completed algebraic closure of the completed residue field at the Gauss point of `C⟨T⟩₁`, the class of `T` in `Ḡ_m(C′) = C′^×/(1 + C′_{<1})` is not in the image of `Ḡ_m(C)`, since `|T| = 1` and the residue of `T` is transcendental over `k`, whereas a class from `C` of norm one has its residue in `k^×`. Conversely, over a geometric point of characteristic `ℓ` the constant sheaf `ℤ/ℓ` is étale but not ball-invariant, by the Artin–Schreier class of `T` on the closed disc (§4.6, Checks).
- With torsion coefficients invertible in the residue field the reduction of `Ḡ_m` is both effective and étale, as §4.8 predicts: for `n` prime to the residue characteristic of `C`, `|n| = 1`, so `1 + C_{<1}` is uniquely `n`-divisible (the binomial series of `(1 + a)^{1/n}` has coefficients in `ℤ[1/n]`, and a nontrivial root of unity of order prime to the residue characteristic has distance `1` from `1`), and `C` is algebraically closed; hence multiplication by `n` on `C^×/(1 + C_{<1})` is surjective with kernel `μ_n(C)`, `Ḡ_m ⊗^L ℤ/n ≃ μ_n[1]` and `ℤ/n(1) ≃ μ_n`, and `μ_n(C) → μ_n(C′)` is a bijection for every extension, so these objects are étale.
- Over a complex Banach algebra `A` every geometric Banach point over `Marc(A)` is `ℂ` with its absolute value: the composite `ℂ → A → C` is contractive, which excludes a nonarchimedean `C` (`|1/2|_C ≥ 1 > 1/2`) and `ℂ` with `|·|^α`, `α < 1` (`(1/2)^α > 1/2`). An extension of such points is the identity or complex conjugation, an isomorphism, so `Det(Marc(A), Λ) = Dfin(Marc(A), Λ)`, in accordance with `Deff_mot = Dfin` there (§2.1 and §2.7, Checks).

*Needs:* §§0.4, 1.1–1.3; TropicalAndBerkovichArithmetic §§0.16, 0.25; DiamondsAndVStacks §D0.22 (sheaves on profinite sets and their stalks).

### Examples

Let `A = Cont([0,1], ℂ)` with the supremum norm. By §1.3, `Dfin(Marc(A), ℤ)` is the left-completed derived category of sheaves on `[0,1]`. For `U = (0,1]` and `Z = {0}`, the excision sequence `j_! ℤ_U → ℤ → i_* ℤ_Z` has stalks `0 → ℤ → ℤ` at `0` and `ℤ → ℤ → 0` at a positive point, which pins the extension-by-zero convention. The inclusion of `{0}` is not open and not a finitary monomorphism, while the identity of `[0,1]` is finitary because its relative continuity square is trivially cartesian.

### Dependencies

Layer 0; EnhancedDerivedSheaves §§E0.4, E1.3, E2.2–E2.7, E3.2, E3.4, E5:abstract.1, E5:abstract.4; Mathlib `continuousCohomology`; Tau Ceti `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`; ProfiniteCohomology Layers 10–11; DiamondsAndVStacks §D0.22; TropicalAndBerkovichArithmetic §§0.16, 0.25; AlgebraicKTheory §4.3; gap compact-hausdorff-dimension.

## Layer 2: Effective motives and ball localization

This layer constructs integral effective motivic sheaves, the ball localization, free motivic sheaves of open subsets of affine space and their left adjoints, and proves rational truncation stability and the forward torsion criterion; it ends with free motives of general arc-stacks and the maps smooth without boundary for which they exist.

### 2.1 Effective motivic sheaves

Let `A⟨T⟩₁` be the free uniform Banach `A`-algebra on an element `T` with `|T| ≤ 1`. For a small arc-stack `X` define `Deff_mot(X)` as the full subcategory of `Dfin(X, ℤ)` of *ball-invariant* objects: those `M` for which `M(A) → M(A⟨T⟩₁)` is an equivalence for every Banach ring `A` over `X` (Scholze, Definitions 5.1–5.2, p. 26). Its tensor product `⊗_mot` is the ball localization (§2.2) of the derived tensor product.

Prove first the dimension bound: for every geometric Banach point `C`, `d(C⟨T⟩₁) ≤ 3` (Scholze, Lemma 5.3, p. 26). For `C = ℂ` the spectrum is the closed unit disc, of covering dimension 2, with trivial residue Galois groups. For nonarchimedean `C` the spectrum is the Berkovich disc, a cofiltered limit of finite trees, of covering dimension 1; the residue field at a `C`-point is `C`, and at a point of type 2, 3 or 4 its absolute Galois group is a closed subgroup of `G_{C(T)}`, which has cohomological dimension at most 1 by Tsen's theorem, hence strict cohomological dimension at most 2 on `ℤ`-modules.

Prove the following API.

- Ball invariance can be tested at geometric Banach points: a finitary `M` is effective as soon as `M(C) → M(C⟨T⟩₁)` is an equivalence for every geometric Banach point `C` over `X` (Scholze, Corollary 5.4, pp. 26–27).
- Pullback along maps of small arc-stacks preserves effective motives and the localized tensor product.
- `Deff_mot(X)` is closed under all colimits in `Dfin(X, ℤ)` (Scholze, Corollary 5.5, p. 27).

**Checks.**

- At the complex point, `Deff_mot(Marc(ℂ)) = D(ℤ)`: the closed disc is contractible, so every finitary sheaf is ball-invariant (Scholze, Proposition 1.5(i), p. 4).
- On the nonarchimedean locus the reduced multiplicative group `Ḡ_m` of §3.2 is effective (§3.3), whereas `G_m` is not: for `0 < |a| < 1` the element `1 + aT` of `C⟨T⟩₁` is a unit (its Gauss norm distance to 1 is `|a| < 1`) that does not lie in `C^×`, so `G_m(C) → G_m(C⟨T⟩₁)` is not surjective; its class in `Ḡ_m` is trivial because it is a one-unit.
- Torsion prime to the residue characteristic survives and `p`-torsion does not. Let `C` be a nonarchimedean geometric point of residue characteristic `p > 0` and `ℓ ≠ p` a prime. The constant sheaf `ℤ/ℓ` is étale (§1.8) and `|ℓ| = 1`, so it is ball-invariant (§2.4), and by the adjunction of §2.2 the maps from the unit `L_B ℤ` to it in `Deff_mot(Marc(C))` are `Hom_{Dfin}(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0`, although `ℤ/ℓ ⊗ ℚ = 0`; so `Deff_mot` is not its rationalization. For `ℓ = p`, `|p| < 1` and multiplication by `p` is invertible in `Deff_mot(Marc(C))` (§4.8), so `L_B(ℤ/p) = cofib(p : L_B ℤ → L_B ℤ) = 0`.

*Needs:* §§1.2, 1.5, 1.7; TropicalAndBerkovichArithmetic §§0.17, 1.1–1.3; SchemeAndStackFoundations §2.16 (Tsen); Tau Ceti `TauCeti.cohomologicalDimensionAt_le_of_isClosed` (closed subgroups of profinite groups) and `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one` (compact groups); AlgebraicKTheory §4.3 (covering dimension of the closed disc and of the Berkovich disc); the compact Hausdorff dimension statement (gap:compact-hausdorff-dimension).

### 2.2 The ball localization

Construct a symmetric monoidal left adjoint `L_B` of the inclusion `Deff_mot(X) ⊂ Dfin(X, ℤ)`. On a strict ring `A`, and more generally on an analytic `A` of finite cohomological dimension, `(L_B M)(A)` is the geometric realization of `[n] ↦ M(A⟨Δⁿ⟩)`, where `Δⁿ` is the `n`-dimensional closed ball with the cosimplicial structure given by ordered coordinates `1 ≥ t₁ ≥ ⋯ ≥ t_n ≥ 0`. The localization is a monoidal Verdier quotient whose kernel is the localizing tensor ideal generated by ball-contractible objects, an object `N` being ball-contractible when the identity and the zero endomorphism of `N` are joined by a homotopy parametrized by the ball (Scholze, Proposition 5.6, Remark 5.7 and Proposition 5.8, pp. 27–28). The ordered-coordinate simplex is used because barycentric coordinates need not be contractive over archimedean rings. The same construction on presheaves gives `L_B^pre`, and on sheaves of spectra the spectral ball localization used in Layer 6.

Prove the following API.

- Maps `L_B M → N` into a ball-invariant `N` correspond to maps `M → N`.
- On strict rings and on analytic rings of finite cohomological dimension, `L_B` has the realization formula above.
- `L_B(M ⊗ N) ≃ L_B M ⊗_mot L_B N`.

**Checks.**

- For ball-invariant `M` the unit `M → L_B M` is an equivalence, and `L_B L_B ≃ L_B`.
- A ball-contractible object localizes to zero.
- `Δ⁰` is the base and `Δ¹` the unit ball; the two endpoint maps `Δ⁰ → Δ¹` differ before localization and become homotopic after it.

*Needs:* §§1.7, 2.1; EnhancedDerivedSheaves §E3.2 (accessible localizations), §E5:abstract.3 (monoidal localizations) and §E5:abstract.4 (Verdier quotients by tensor ideals).

### 2.3 Rational homotopy t-structure

Prove that `Deff_mot(X, ℚ)` is closed under truncations in `Dfin(X, ℚ)`, so that it inherits the rational homotopy t-structure (Scholze, Proposition 5.10, p. 30). Route: at a nonarchimedean geometric point the rational cohomology of the Berkovich ball has amplitude `[0, 1]`, and the resulting two-column spectral sequence forces each cohomology sheaf of a ball-invariant object to be ball-invariant; at the complex point all finitary sheaves are effective. The integral statement uses the transfer results of Layer 4 and is §4.10.

*Needs:* §§1.3, 2.1; TropicalAndBerkovichArithmetic §1.3 (the disc as a tree).

### 2.4 Étale torsion is ball-invariant

Prove: if `n ≥ 1`, `|n| ≥ 1` everywhere on `X`, and `M ∈ Dfin(X, ℤ/n)` is étale (§1.8), that is invariant under every extension of geometric Banach points over `X`, then `M` is ball-invariant; so `Det(X, ℤ/n) ⊂ Deff_mot(X, ℤ/n)` (Scholze, Proposition 5.9, pp. 28–30). Route: reduce to a geometric point and the constant sheaf `ℤ/n`; on the complex locus use the contractible disc; on the nonarchimedean disc compute the first direct image by Kummer classes on finite subtrees, with outgoing branch labels summing to zero at each vertex and vanishing on rays that end at the boundary, peel off terminal intervals, and kill higher terms with the bound of §2.1. The condition `|n| ≥ 1` makes one-units `n`-divisible. The converse is §4.8.

*Needs:* §§1.3, 1.8, 2.1; TropicalAndBerkovichArithmetic §§1.1–1.3; ProfiniteCohomology §9.6 (the Kummer isomorphism `K^×/(K^×)ⁿ ≃ H¹(G_K, μ_n)` for `n` invertible in `K`, Tau Ceti `TauCeti.kummerIso`), applied to the completed residue fields of the disc.

### 2.5 Free motivic sheaves of open subsets of affine space

For `U ⊂ Aⁿ_X` open, with `n` finite, define `ℤmot[U]` as the ball localization of the free derived abelian arc-sheaf on `U`. Prove that it is finitary, that `Map(ℤmot[U], M) ≃ M(U)` naturally in effective `M`, that it commutes with base change, that `ℤmot[U ×_X V] ≃ ℤmot[U] ⊗_mot ℤmot[V]`, and that for `X` analytic affine of finite cohomological dimension these objects generate `Deff_mot(X)` under colimits (Scholze, Lemma 5.11, Propositions 5.12–5.13, pp. 30–32). Finitarity of `L_B^pre ℤ[U]` is a theorem, not an assumption on `U`. Here `Aⁿ_X` is the affine space of §0.8; free motives of more general arc-stacks are §2.7.

Prove the following API.

- Maps out of `ℤmot[U]` into an effective `M` are the sections `M(U)`.
- Pullback of `ℤmot[U]` along `X′ → X` is `ℤmot[U ×_X X′]`.
- Fibre products of open subsets of affine spaces go to tensor products.

**Checks.**

- `ℤmot[X]`, for `X = A⁰_X`, is the unit.
- `ℤmot[∅] = 0`, not a copy of `ℤ`: the free sheaf on the empty sheaf has no generators.
- The projection from the closed unit ball over `X` induces an equivalence of free motives, although the free sheaves before localization differ.

Route: in the nonarchimedean case exhaust `U` by subsets invariant under small additive balls; in general use uniform approximation to prove finitarity of the singular construction; generation uses bounded closed subsets and continuity at fields of finite topological transcendence degree, then at all geometric fields, with dimensions uniformly bounded before passing to limits.

*Needs:* §§0.8, 1.3, 1.4, 2.2; TropicalAndBerkovichArithmetic §§0.21–0.22.

### 2.6 Effective left adjoints

Prove: if `f : Y → X` factors as a finitary map `Y → Aⁿ_X` followed by the projection `Aⁿ_X → X`, then `f^* : Deff_mot(X) → Deff_mot(Y)` has a left adjoint `f_♯` that commutes with base change and satisfies the projection formula (Scholze, Theorem 5.14, p. 32). The factorization is a hypothesis; arbitrary maps are not included. Route: by hyperdescent reduce to strict bases and to the projection; on generators put `f_♯ ℤmot[V/Y] = ℤmot[V/X]`, and deduce projection and base change from the product formula of §2.5. For `n = 0` this is the finitary left adjoint of §1.6 followed by `L_B`.

*Needs:* §§1.6, 2.1, 2.5; EnhancedDerivedSheaves §E3.2.

### 2.7 Free motives of arc-stacks and maps smooth without boundary

For a map `f : Y → X` of small arc-stacks, the *free motive* `ℤmot[Y/X]`, written `ℤmot[Y]` when `X` is clear, is an object of `Deff_mot(X)` corepresenting the functor `M ↦ Γ(Y, f^* M)` on `Deff_mot(X)`, when one exists; it is then unique up to a contractible space of choices. Prove that it exists in the following cases (Scholze, §1, p. 4, and Theorem 5.14, p. 32):

1. `Y ⊂ Aⁿ_X` open, where it is the object of §2.5;
2. `f` the composite of a finitary map `Y → Aⁿ_X` and the projection, where it is `f_♯ ℤ` of §2.6; for `n = 0`, that is for finitary `f`, it is `L_B f_♯ ℤ` with the finitary left adjoint of §1.6;
3. `Y = colim_i Y_i` a small colimit of arc-stacks over `X` for which every `ℤmot[Y_i/X]` exists, where it is `colim_i ℤmot[Y_i/X]`.

Call a map `g : Y → X` of small arc-stacks *étale* when it is finitary (§1.4) and its pullback to every geometric Banach point `Marc(C) → X` is a finite disjoint union of copies of `Marc(C)`, and *smooth without boundary* when `Y` is covered by open substacks `Y_i` such that each `Y_i → X` is an étale map `Y_i → A^{n_i}_X` followed by the projection (Scholze, Proposition 9.5 and proof of Corollary 9.6, p. 52). Prove:

- (a) for a Banach ring `A` and a smooth `A`-scheme `Y` (Mathlib `AlgebraicGeometry.Smooth`), `Y^arc → Marc(A)` is smooth without boundary, and a quasi-compact étale morphism `g : Z′ → Z` of schemes locally of finite presentation over `A` (Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.QuasiCompact`) induces an étale map `Z′^arc → Z^arc`; without quasi-compactness the induced map is still finitary, but its geometric fibres are disjoint unions of possibly infinitely many copies of `Marc(C)`;
- (b) for a complete nonarchimedean field `K` and a `K`-analytic space `U` that is smooth in Berkovich's sense, every point having an open neighbourhood with an étale morphism to an affine space over `K`, where an étale morphism is, locally on the source, finite étale onto an open subset of the target, `U^arc → Marc(K)` is smooth without boundary;
- (c) for a Banach field `K` and a projective `K`-scheme `Y`, `Y^arc → Marc(K)` is proper of finite cohomological dimension (§1.5).

Consequently `ℤmot[Y/X]` exists whenever `Y → X` is smooth without boundary, by cases 2 and 3 applied to the Čech nerve of the cover `{Y_i}`, whose terms are disjoint unions of finite intersections `Y_{i₀} ∩ ⋯ ∩ Y_{i_k}`, each open in `Y_{i₀}` and so finitary over `A^{n_{i₀}}_X`; and it exists for `∗/G` whenever the group arc-sheaf `G` is smooth without boundary over `X`, through the bar construction. This covers `ℙⁿ_X`, `GL_n/G_m^n`, `∗/GL_n`, `BG_m`, the arc-stacks of smooth schemes over Banach rings and those of smooth analytic spaces.

Prove the following API.

- `Map(ℤmot[Y/X], M) ≃ Γ(Y, f^* M)` naturally in effective `M`, and a map `Y → Y′` over `X` induces `ℤmot[Y/X] → ℤmot[Y′/X]` when both exist.
- In cases 1–3, pullback along `X′ → X` carries `ℤmot[Y/X]` to `ℤmot[Y ×_X X′/X′]`.
- If `Y` and `Y′` are smooth without boundary over `X`, then so is `Y ×_X Y′`, and `ℤmot[Y ×_X Y′] ≃ ℤmot[Y] ⊗_mot ℤmot[Y′]`.

Route: in case 3, `Γ(−, f^* M)` turns colimits of arc-stacks into limits, being the mapping space out of the free sheaf, which preserves colimits. For (a), on strict rings an étale morphism is standard étale on the pieces of a finite clopen partition of the spectrum (§0.8), and over a geometric point `C` the fibre `Z′ ×_Z Spec C` is a quasi-compact étale `C`-scheme, hence a finite disjoint union of copies of `Spec C`, whose arc-stack is the corresponding finite disjoint union of copies of `Marc(C)` (§0.8); for finitarity, given a completed filtered colimit `B = colim B_i` of strict rings and a root `b ∈ B` of a standard étale presentation `h` with `h′(b)` a unit, approximate `b` from a stage, observe that `h′` of the approximation is a unit with bounded inverse at a later stage, because `M(B) = lim M(B_i)` (TropicalAndBerkovichArithmetic §0.16) and the spectra are compact, and apply Newton's iteration in that stage; roots at which `h′` is a unit are isolated, which gives uniqueness. Étale coordinates on smooth schemes are Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace`; its charts `V → 𝔸ⁿ_A` are morphisms of affine schemes, hence quasi-compact, so the étale clause applies to them. For (b), refine the cover so that each member maps finite étale onto an open subset of `A^n_K`, as the definition of étale morphism allows; open immersions give open arc-subsheaves (§0.8), and finite étale maps of affinoid algebras give étale maps as in (a) (Scholze, proof of Corollary 9.6, p. 52). For (c), `Y^arc` is a sheaf of sets; for `Y ⊂ ℙ^N` it is quasi-compact and quasi-separated, being covered by finitely many closed pieces of the polydisc charts of `ℙ^N` whose intersections are affine (§0.8). At a geometric point `C`, the projection of the closed unit polydisc `D^N_C` to `D^{N−1}_C` is proper with closed unit discs as geometric fibres, of cohomological dimension at most `3` (§2.1), so §1.7 gives `d(D^N_C) ≤ d(D^{N−1}_C) + 3` and hence `d(D^N_C) ≤ 3N`; a closed immersion has geometric fibres a point or empty, hence `d = 0`, so each closed piece and each of their intersections has `d ≤ 3N`, and the finite Čech complex of the cover by `N + 1` closed pieces gives `d(Y_C^arc) ≤ 4N`. The product formula is §2.5 for opens of affine space and the projection formula with base change of §2.6, extended through colimits.

**Checks.**

- `ℤmot[ℙ¹_X] = ℤ ⊕ ℤ(1)[2]`. `ℙ¹_X` is the pushout of two copies of `A¹_X` along `G_m`, the second inclusion being `T ↦ T⁻¹`, so case 3 gives `cofib(ℤmot[G_m] → ℤmot[A¹_X] ⊕ ℤmot[A¹_X])`. Here `ℤmot[A¹_X] = ℤ`, because `(x, t) ↦ tx` is a homotopy parametrized by the unit ball from the zero map to the identity, and `ℤmot[G_m] = ℤ ⊕ ℤ(1)[1]`, split by the unit section (§3.4); the map is `(1, −1)` on `ℤ` and zero on the reduced summand `ℤ(1)[1]`, whose image lies in the vanishing reduced part of `ℤmot[A¹_X]`. The cofibre is `ℤ ⊕ ℤ(1)[2]`, as in §§5.4 and 10.6. Case 1 alone does not reach `ℙ¹_X`: at the complex point it is the compact Riemann sphere (§0.8), which is no open subset of any `ℂⁿ`.
- Degenerate cases: `ℤmot[∅/X] = 0`, `ℤmot[X/X] = ℤ` and `ℤmot[X ⨿ X/X] = ℤ ⊕ ℤ`. At the complex point `ℤmot[G_m]` is the chain complex `ℤ ⊕ ℤ[1]` of the circle, and the bar construction gives `ℤmot[BG_m] = ⊕_{n≥0} ℤ[2n]`, the chains of `ℂℙ^∞`, in accordance with §5.4.
- Existence can fail. Let `X = Marc(Cont([0,1], ℂ))` and `Y = {0}`. Every finitary sheaf over `X` is ball-invariant, since ball invariance is tested at geometric points (§2.1), which are all complex here, and the complex closed disc is contractible; so `Deff_mot(X)` is the left-completed derived category of sheaves on `[0,1]` (§1.3), and `Γ(Y, M)` is the stalk at `0`. For the skyscraper sheaves `F_n` with value `ℤ` at `1/n`, the stalk at `0` of `∏_n F_n` is the group of germs `∏_n ℤ / ⊕_n ℤ ≠ 0`, while `∏_n (F_n)_0 = 0`. The stalk does not preserve products, so it is not corepresentable and `ℤmot[Y/X]` does not exist; consistently, `{0} → X` is a monomorphism that is not open, hence not finitary (§1.4, Checks).
- The open unit disc over a nonarchimedean geometric point `C` is smooth without boundary, being open in `A¹_C`; the closed unit disc `Marc(C⟨T⟩₁)` is not, since a cover as in the definition would make it cohomologically smooth by §8.5, which the Check there excludes, and its inclusion into `A¹_C` is a monomorphism that is not open, hence not étale. Conversely `(Spec K[ε]/(ε²))^arc = Marc(K)` is smooth without boundary although the scheme is not smooth over `K` (§0.8), so (a) has no converse.
- Quasi-compactness is needed in (a). For a nonzero Banach ring `A`, `⨿_{n∈ℕ} Spec A → Spec A` is étale but not quasi-compact, the preimage of `Spec A` being an infinite disjoint union. Its arc-stack `⨿_{n∈ℕ} Marc(A) → Marc(A)` is finitary, as a colimit of identities in the slice (§1.4), but its pullback to a geometric Banach point `Marc(C)` is `⨿_{n∈ℕ} Marc(C)`, with countably many copies, so it is not étale in the sense above; its free motive `⊕_{n∈ℕ} ℤ` still exists by case 3. For `A = 0` both sides are empty and the map is étale. The analytic counterpart is `log(1 + T)` on the open unit disc over `ℂ_p`: its derivative `(1 + T)⁻¹` is a unit, so it is étale in Berkovich's sense, but its fibre over `0` is the infinite set `{ζ − 1 : ζ ∈ μ_{p^∞}}`; this is why (b) refines its cover.
- The bound of (c) is not sharp but finite: for `Y = ℙ¹_ℂ`, `N = 1`, the arc-stack is the Riemann sphere, of cohomological dimension `2 ≤ 4`.

*Needs:* §§0.8, 1.4–1.7, 2.1, 2.5, 2.6; TropicalAndBerkovichArithmetic §§0.16, 0.19, 0.21; Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace`; Mathlib `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.QuasiCompact`.

### Examples

Over the complex point the closed unit ball `B` contracts to a point through `(s, t) ↦ st`; hence for every effective `M` the restriction `M(∗) → M(B)` is an equivalence, and `ℤmot[B] ≃ ℤmot[∗] = ℤ`. In the explicit localization the two maps `Δ⁰ → Δ¹ = B` become equal after realization. The empty subset gives the zero object. These computations distinguish ball localization from replacing every free sheaf by a copy of the unit.

### Dependencies

Layers 0–1; EnhancedDerivedSheaves §§E3.2, E5:abstract.3, E5:abstract.4; TropicalAndBerkovichArithmetic §§0.16, 0.17, 0.19, 0.21–0.22, 1.1–1.3; SchemeAndStackFoundations §2.16; Tau Ceti `TauCeti.cohomologicalDimensionAt_le_of_isClosed`, `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, `AlgebraicGeometry.Smooth.exists_etale_affineSpace`; Mathlib `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.QuasiCompact`; ProfiniteCohomology §9.6 and Layer 11; Tau Ceti `TauCeti.kummerIso`; AlgebraicKTheory §4.3; gap compact-hausdorff-dimension.

## Layer 3: Reduced units and the Tate object

This layer constructs one-units, the reduced multiplicative group and the Tate object, and proves ball invariance of the reduced group, the identification of the reduced free motive of `G_m`, annulus invariance and compactness of the Tate object on strict bases.

### 3.1 One-units

For a nonarchimedean uniform Banach ring `A`, the norm is power-multiplicative with `|2| ≤ 1`, hence ultrametric, and the power-bounded elements form the closed unit ball `A_{≤1}`. Let `A_{<1} = {a : |a| < 1}` be the ideal of `A_{≤1}` given at the pin by Tau Ceti `TauCeti.unitBallIdeal A` (for `A ≠ 0`, where `|1| = 1`; the zero ring has `A_{<1} = A = 0`), and let `U¹(A) = 1 + A_{<1}`, a subgroup of the units of `A_{≤1}` by the Neumann estimates of the Tau Ceti contract. This roadmap constructs the associated arc-sheaf `U¹` of abelian groups on the nonarchimedean locus and its functoriality (Scholze, §2.3, p. 12, and discussion before Definition 5.15, p. 32); the ideal and its unit estimates are not constructed again. For a nonarchimedean valued field `K` (Mathlib `NormedField K` with `IsUltrametricDist K`) the group `U¹(K)` is Mathlib's principal unit group `ValuationSubring.principalUnitGroup` of the valuation subring `{‖x‖ ≤ 1}` of `NormedField.valuation`, whose members are the `u` with `‖u − 1‖ < 1`; that it is a subgroup of `Kˣ` and that its members are units of the valuation ring, hence of norm one (`ValuationSubring.principal_units_le_units`), are Mathlib's and are not proved again.

Prove the following API.

- For a nonzero nonarchimedean uniform Banach ring `A`, `U¹(A) = 1 + A_{<1}` is a subgroup of the units of `A_{≤1}`: it contains `1`; it is closed under products, since `(1 + a)(1 + b) − 1 = a + b + ab` has norm at most `max(|a|, |b|)` when `|a|, |b| < 1`; and it is closed under inverses, since `‖(1 − x)⁻¹ − 1‖ = ‖x‖` for `‖x‖ < 1` (Tau Ceti `TauCeti.norm_inverse_one_sub_sub_one`).
- A contractive ring map `A → B` of such rings carries `U¹(A)` into `U¹(B)`, compatibly with identities and composites, so `A ↦ U¹(A)` is a presheaf of abelian groups on the nonarchimedean uniform Banach rings, whose arc-sheafification is `U¹`.
- An isometric map of nonarchimedean valued fields preserves and reflects one-units.

**Checks.**

- `1` is a one-unit since `‖1 − 1‖ = 0`.
- A unit `u` with `‖u‖ ≠ 1` is not a one-unit: by the ultrametric inequality `‖u − 1‖ = max(‖u‖, 1) ≥ 1`.
- `−1` is a one-unit exactly when `‖2‖ < 1`: in `ℚ₂`, `A_{<1} = 2ℤ₂` and `‖−1 − 1‖ = ‖2‖ = 1/2`, so it is; in `ℚ₃`, `A_{<1} = 3ℤ₃` and `‖2‖ = 1`, so it is not, although `‖−1‖ = 1` in both. This separates the strict threshold `< 1` from the condition `‖u‖ = 1`.
- For the zero ring, `U¹ = {1} = {0}` is the trivial group; the pinned ideal is not used there, since `|1| = 0`.

*Needs:* §0.2; TropicalAndBerkovichArithmetic §§0.24, 0.27; Mathlib `NormedField`, `IsUltrametricDist`, `NormedField.valuation`, `ValuationSubring.principalUnitGroup`, `ValuationSubring.principal_units_le_units`; Tau Ceti `Subring.unitClosedBall`, `TauCeti.unitBallIdeal`, `TauCeti.mem_unitBallIdeal`, `TauCeti.norm_inverse_one_sub_sub_one`, `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt`.

### 3.2 The reduced multiplicative group

On the nonarchimedean locus `{|2| ≤ 1}` of a small arc-stack define `Ḡ_m = G_m/U¹`, the quotient in arc-sheaves of abelian groups (not the presheaf quotient), with its canonical epimorphism from `G_m` (Scholze, Definition 5.15, p. 32).

Prove the following API.

- Maps out of `Ḡ_m` into an arc-sheaf of abelian groups are the maps out of `G_m` that kill `U¹`.
- `Ḡ_m` commutes with base change of small arc-stacks.
- At a nonarchimedean geometric point `C`, `Ḡ_m(C) = C^×/(1 + C_{<1})`, and `Ḡ_m` is finitary.

**Checks.**

- Every `1 + a` with `|a| < 1` maps to the identity.
- A pseudouniformizer `π`, `0 < |π| < 1`, has nontrivial class: one-units have norm 1, and `|π| ≠ 1`.
- A unit of norm 1 whose residue class is not 1 has nontrivial class; so `Ḡ_m(C)` is an extension of the value group `|C^×|` by the residue units `k^×`, and retains more than the value group.

*Needs:* §§0.8 (`G_m`), 1.2, 3.1; EnhancedDerivedSheaves §E1.3.

### 3.3 Ball invariance and the reduced free motive of `G_m`

Prove that `Ḡ_m` is finitary and ball-invariant, and that the tautological section of `G_m` over `G_m` induces `ℤmot[G_m]/ℤmot[∗] ≃ Ḡ_m` on the nonarchimedean locus, the quotient being taken along the unit section (Scholze, Theorem 5.16 and Proposition 5.17, pp. 32–34; Proposition 1.6, p. 5).

Route: modulo a prime `ℓ`, raising to the `ℓ`-th power is surjective on `Ḡ_m` with kernel the image of `μ_ℓ`, which is trivial when `ℓ` is the residue characteristic and `ℤ/ℓ` otherwise, so §2.4 applies. Rationally, compute the cohomology of `Ḡ_m ⊗ ℚ` on the tree `M(C⟨T⟩₁)`: `H¹` vanishes because analytic line bundles on the disc are trivial; a global section has constant norm because its logarithm is piecewise linear, harmonic at every branch point except possibly the Gauss point, and constant near the ends of rays, and the product formula on `ℙ¹` controls the Gauss point. For the free motive, group-complete the free commutative monoid and use `Symⁿ(G_m) ≃ A^{n−1} × G_m` through characteristic polynomials for the unreduced group, then pass to the reduced quotient through the one-unit homotopies; no such isomorphism is asserted for `Symⁿ(Ḡ_m)`.

The unstabilized projection formula for `ℙ¹ → ∗` fails: the reduced free motive above gives a nonzero obstruction in the effective category (Scholze, Example 4.26, p. 26), which is why §1.7 asserts projection only for quasi-pro-étale maps.

*Needs:* §§2.4, 2.5, 3.2; TropicalAndBerkovichArithmetic §§1.1–1.3, 1.6, 3.7 (slope formula and harmonicity); the triviality of analytic line bundles on the disc, from Tau Ceti `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring` at radius `1`, AdicSpacesPartIII §R3.5 (vector bundles on an affinoid adic space are finite projective modules) and TropicalAndBerkovichArithmetic §0.30 (strict affinoid domains of `M(A)` and of `Spa(A, A°)`); the animated group completion (gap:animated-group-completion).

### 3.4 The first Tate twist

For every small arc-stack `X` define `ℤ(1) = cofib(ℤmot[∗] → ℤmot[G_m])[−1]`, using the unit section, and `ℤ(n) = ℤ(1)^{⊗n}` for `n ≥ 0` in `Deff_mot(X)` (Scholze, Definition 5.18, pp. 34–35). Negative twists exist only in the stable category (Layer 8).

Prove the following API.

- Pullback carries `ℤ(1)` on `X` to `ℤ(1)` on `X′`, coherently.
- On the nonarchimedean locus `ℤ(1)[1] ≃ Ḡ_m`.
- For `m, n ≥ 0`, `ℤ(m) ⊗_mot ℤ(n) ≃ ℤ(m + n)`.

**Checks.**

- Over `ℂ`, `ℤmot[G_m]` is the chain complex of the circle, `ℤ ⊕ ℤ[1]`, so `ℤ(1) = (ℤ[1])[−1] = ℤ` in degree zero, not zero.
- Over `ℝ`, complex conjugation acts on the circle `{|z| = 1}` by reflection, which acts by `−1` on its first homology; so `ℤ(1)` is the sign representation.
- Over a nonarchimedean point `ℤ(1) = Ḡ_m[−1]`, an abelian group in cohomological degree one; the formula without the shift fails the defining cofibre identity.

*Needs:* §§1.3, 2.5, 3.3.

### 3.5 Annulus invariance and compactness of the Tate object

Prove: for an open annulus `T(r₁, r₂) = {r₁ < |T| < r₂} ⊂ G_m` with `0 < r₁ < r₂ < ∞`, the map `ℤmot[T(r₁, r₂)] → ℤmot[G_m]` is an equivalence; and if `X` is strictly totally disconnected, `ℤ(1)` is a compact object of `Deff_mot(X)` (Scholze, Proposition 5.19, pp. 34–35). Compactness is asserted on strict bases; relative rigidity (§9.6) does not give compact generation.

Route: at an archimedean geometric point compare homology of a nonempty complex annulus with that of `ℂ^×`. At a nonarchimedean geometric point rescale so that `r₁ < 1 < r₂`. For `n ≥ 1`, a monic polynomial `Tⁿ + Σ_{i<n} a_i T^i` with `a₀ ∈ T(r₁ⁿ, r₂ⁿ)` has all its roots in `T(r₁, r₂)` if and only if `|a_i| < min(r₂^{n−i}, |a₀| r₁^{−i})` for `1 ≤ i < n` (Newton polygon, NewtonPolygons §3.3, with `a_n = 1`: the largest root norm is `max_{0 ≤ i < n} |a_i|^{1/(n−i)}`, and, as `a₀ ≠ 0`, the smallest root norm is `min (|a₀|/|a_i|)^{1/i}` over the indices `1 ≤ i ≤ n` with `a_i ≠ 0`, a nonempty set since it contains `i = n`; a coefficient `a_i = 0` imposes no condition). Hence `Symⁿ(T(r₁, r₂)) → T(r₁ⁿ, r₂ⁿ)`, the constant coefficient, has open-polydisc fibres; ball invariance identifies the motives, and the target annuli exhaust `G_m` as `n` grows. For compactness, evaluation on a closed annulus, which is quasi-compact of finite cohomological dimension, commutes with colimits by §1.7, and finitarity compares open and closed annuli.

**Checks.**

- For `T² − 1` over `ℂ₂` (`n = 2`, `a₀ = −1`, `a₁ = 0`) both roots `±1` have norm `1`. The largest-root formula gives `max(|a₀|^{1/2}, |a₁|) = max(1, 0) = 1`, and the smallest-root formula runs over `i = 2` alone and gives `(1/1)^{1/2} = 1`. Letting `i = 1` enter with `|a₁| = 0` would divide by zero, and under the total-division convention `1/0 = 0` it would contribute `0` and return the false minimum `0`.
- For `n = 1` the polynomial `T + a₀` has the single root `−a₀`; both formulas give `|a₀|`, there is no condition for `1 ≤ i < 1`, and the criterion reduces to `a₀ ∈ T(r₁, r₂)`, the fibres of `Sym¹(T(r₁, r₂)) → T(r₁, r₂)` being points.
- The criterion uses the minimum of the two bounds: over `ℂ₂` with `r₁ = 1/4`, `r₂ = 4`, the polynomial `T² + T/2 + 4` has roots of norms `1/8` and `2` (Examples below); the minimum bound `1` excludes it, the maximum bound `4` would not.

*Needs:* §§1.7, 2.5, 3.4; TropicalAndBerkovichArithmetic §§1.1, 1.6; NewtonPolygons §3.3 (root norms from the slopes of the Newton polygon).

### Examples

Over `ℚ₂`, `u = −1` satisfies `‖u − 1‖ = ‖−2‖ = 1/2 < 1` and is a one-unit; over `ℚ₃` the same norm is 1 and it is not. In both cases `‖−1‖ = 1`, so norm one alone does not characterize one-units. Over an algebraically closed nonarchimedean `C`, a pseudouniformizer has nontrivial class in `Ḡ_m` since one-units have norm one, and a unit of norm one with nontrivial residue also survives; `Ḡ_m` remembers both valuation and residue information.

For the annulus criterion take `C = ℂ₂`, `r₁ = 1/4`, `r₂ = 4`, `n = 2` and the polynomial `T² + T/2 + 4`. Its constant coefficient has norm `1/4 ∈ (r₁², r₂²) = (1/16, 16)`, and `|a₁| = |1/2| = 2`. The Newton polygon of the points `(0, 2), (1, −1), (2, 0)` (valuations) has slopes `−3` and `1`, so the roots have norms `1/8` and `2`; the root of norm `1/8 < r₁` lies outside the annulus. The criterion with the minimum gives the bound `min(4, (1/4)·4) = 1 < 2` and correctly excludes this polynomial; a bound by the maximum, `max(4, 1) = 4 > 2`, would wrongly admit it (Corrections to the source, E5).

### Dependencies

Layers 0–2; TropicalAndBerkovichArithmetic §§0.24, 0.27, 0.30, 1.1–1.3, 1.6, 3.7; AdicSpacesPartIII §R3.5; NewtonPolygons §3.3; EnhancedDerivedSheaves §E1.3; Mathlib `NormedField`, `IsUltrametricDist`, `NormedField.valuation`, `ValuationSubring.principalUnitGroup`, `ValuationSubring.principal_units_le_units`; Tau Ceti `Subring.unitClosedBall`, `TauCeti.unitBallIdeal`, `TauCeti.mem_unitBallIdeal`, `TauCeti.norm_inverse_one_sub_sub_one`, `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt`, `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`; gap animated-group-completion.

## Layer 4: Transfers and geometric-point comparisons

This layer constructs Banach presheaves with transfers, the marked generalized Jacobian and the curve homotopies, computes free motives explicitly, and deduces the torsion comparison, invertibility of residue characteristics, effective tilting and the integral homotopy t-structure.

### 4.1 Banach presheaves with transfers

For a strictly totally disconnected `X`, form the category whose objects are uniform Banach algebras `A` over `X` and whose maps from `A` to `B` are maps of arc-sheaves of commutative monoids `ℕ[Marc(A)/X] → ℕ[Marc(B)/X]`, composed as maps of monoid sheaves. A *presheaf with transfers* is an additive functor from the opposite of this category to abelian groups; it is *finitary* when it commutes with completed filtered colimits of all Banach algebras over `X` (Scholze, Definition 6.2, pp. 35–36). Composition is not defined through scheme-theoretic finite correspondences. A map `A → B` of Banach algebras gives the monoid map induced by `Marc(B) → Marc(A)` in the opposite direction, so a presheaf with transfers restricts to an ordinary presheaf contravariantly in `Marc`.

Prove the following API.

- Restriction along actual Banach maps recovers the underlying presheaf.
- A multiset of maps acts by the sum of the corresponding pullbacks, with multiplicities.
- Composition of multivalued maps corresponds to composition of the induced transfer maps.

**Checks.**

- The singleton multiset of the identity acts as the identity.
- The multiset consisting of `d` copies of the identity acts by multiplication by `d`; for `d = 0` it acts by zero.
- For a finite étale `A → B` of degree `d`, the trace multiset followed by pullback acts by multiplication by `d` on the value at `A`, without choosing an ordering of the fibres.

*Needs:* §§0.2, 1.1; EnhancedDerivedSheaves §E5:animation.1 and the animated group completion (gap:animated-group-completion).

### 4.2 Shrinking and compactifying analytic curves

Prove: for a separated smooth connected analytic curve `U` over a nondiscrete algebraically closed nonarchimedean field `C` (separated: its diagonal is a closed immersion, so its underlying space is Hausdorff) and two points `x, x′ ∈ U(C)`, there is a connected open `U′ ⊂ U` containing `x` and `x′` and an open embedding of `U′` into the analytification of a smooth projective `C`-curve `X̄` whose complement `X̄ ∖ U′` is a finite nonempty disjoint union of closed discs, each containing a chosen `C`-point (Scholze, proof of Lemma 6.4, p. 37). An arbitrary affinoid need not have such a complement without shrinking. Separation cannot be dropped: `X̄` is Hausdorff (TropicalAndBerkovichArithmetic §0.22), so `U′` must be (Checks).

Route: using a triangulation of `U` (TropicalAndBerkovichArithmetic §2.16, stated for separated curves, refined at prescribed type-II points), choose a connected affinoid neighbourhood `W` of a path from `x` to `x′` such that each of its finitely many boundary points `e` lies on an open annulus contained in `U` and exactly one branch at `e`, running along that annulus, leaves `W`, and such that the path meets no residue disc of `W` at a boundary point. By van der Put's theorem a normal connected one-dimensional affinoid is an affinoid domain of a smooth complete curve `X̄` whose complement is the union of the open residue discs of finitely many nonsingular points of the reduction (van der Put, Theorem 1.1, p. 156, proof pp. 156–159, and Corollary 1.3, p. 159); here these are the leaving branches at the boundary points of `W`. A boundary point `e` lies on an annulus, so it has genus zero, and the complementary disc at `e`, the point `e` and the residue discs of `W` at `e` together form a closed disc, the complement in `X̄` of the branch of `W` along the annulus; it does not contain `x` or `x′`. Removing these finitely many pairwise disjoint closed discs from `X̄` leaves a connected open `U′ ⊂ W` containing `x` and `x′`. A boundary point of positive genus lies in no closed disc, which is why the boundary is placed on annuli; and an affinoid domain is Hausdorff, so without separation `W` need not exist.

**Checks.**

- Separation is needed. Let `U` be the affine line with doubled origin over `C`, two copies of `A¹_C` glued along `A¹_C ∖ {0}`; it is smooth and connected but not separated. For `x = 0₁`, `x′ = 0₂` and `ϖ ∈ C` with `0 < |ϖ| < 1`, the `C`-points `ϖⁿ` of the common punctured line converge to both origins, since `|ϖⁿ| → 0` in either chart, so every open `U′` containing `x` and `x′` contains a sequence with two distinct limits and is not Hausdorff. It therefore has no open embedding into the Hausdorff analytification of a projective curve, and the conclusion fails.
- For the open unit disc `U = {|T| < 1} ⊂ A¹_C` and any `x, x′ ∈ U(C)`, one may take `U′ = U` and `X̄ = ℙ¹_C`: the complement `{|T| ≥ 1} ∪ {∞}` is the single closed disc `{|1/T| ≤ 1}`, containing the `C`-point `∞`. The route with `W = {|T| ≤ ρ}`, `max(|x|, |x′|) < ρ < 1` and `ρ ∈ |C^×|`, gives `U′ = {|T| < ρ}` and the closed disc `{|1/T| ≤ 1/ρ}`.
- The choice of `W` matters. Let `U = E` be the analytification of an elliptic curve over `C` with good reduction, whose Gauss point `ζ` has genus one, and let `x, x′` lie in one residue disc `B₀` at `ζ`, with coordinate `R`. The affinoid `W = E ∖ B₁`, for another residue disc `B₁` at `ζ`, is a connected neighbourhood of the path, but its boundary point `ζ` has genus one and lies on no annulus, and no closed disc contains `B₁` together with `ζ`, so this `W` yields no `U′`. The route takes `W = {|R| ≤ σ}` with `max(|R(x)|, |R(x′)|) < σ < 1`; then `X̄ = ℙ¹_C`, not `E`, `U′ = {|R| < σ}`, and the complement is the single closed disc `{|1/R| ≤ 1/σ}`. If instead `x, x′` lie in distinct residue discs at `ζ`, every path between them passes through `ζ`, and `W = E ∖ {|S| < ρ}`, `0 < ρ < 1`, for a coordinate `S` on a third residue disc, gives `X̄ = E` and `U′ = E ∖ {|S| ≤ ρ}`, with one complementary closed disc.

*Needs:* TropicalAndBerkovichArithmetic §§0.17, 0.21–0.22, 1.1, 2.16.

### 4.3 The generalized Jacobian with marked trivializations

For a smooth projective geometrically connected curve `X̄` over an algebraically closed field `C` and a set `Z = {z₁, …, z_r}` of `r ≥ 1` distinct `C`-points, construct the semiabelian variety `J_Z` whose `C`-points are isomorphism classes of degree-zero line bundles with a trivialization at each `z_i`, modulo simultaneous scaling of all trivializations, with the tensor-product group law. Prove the exact sequence `1 → G_m^{r−1} → J_Z → Jac(X̄) → 0` and that multiplication by every prime `ℓ`, including `ℓ = char C`, is surjective on `J_Z(C)` (Scholze, proof of Lemma 6.4, p. 37; compare BLR, §9.2, Proposition 3, p. 244, Example 8, pp. 246–247, and Proposition 10, p. 249). In characteristic zero this is the generalized Jacobian of the reduced boundary `Z` of AnabelianGeometryAndNonabelianChabauty; here the field has arbitrary characteristic and only surjectivity on points is used, not étaleness of `[ℓ]`.

Prove the following API.

- The `C`-points of `J_Z` are the stated isomorphism classes, with the tensor-product group law.
- Forgetting the trivializations is a surjection onto `Pic⁰ = Jac(X̄)` with kernel `G_m^r/G_m ≅ G_m^{r−1}`.
- Every class in `J_Z(C)` has an `ℓ`-th root for every prime `ℓ`.

**Checks.**

- For `r = 1` the torus is trivial and `J_Z = Jac(X̄)`.
- For `X̄ = ℙ¹` and `Z = {0, ∞}`, `J_Z ≅ G_m`: every degree-zero line bundle is trivial, two trivializations give `(a, b) ∈ (C^×)²` up to simultaneous scaling, and the coordinate is `a/b`.
- Multiplying all trivializations by one scalar leaves the class unchanged; without marks the Picard stack retains `G_m` automorphisms and is not this moduli problem.

Route: over the Picard scheme of JacobianChallenge Layer D form the torsor of trivializations along `Z`, of fibre `G_m^r`, and divide by the diagonal `G_m`; divisibility follows from the torus case and from surjectivity of multiplication by `n` on an abelian variety (JacobianChallenge Layer E, `multiplication_isogeny`), which on `C`-points holds for `C` algebraically closed also when `n` is divisible by the characteristic.

*Needs:* JacobianChallenge Layers A, D, E.

### 4.4 Rational motives of line domains with disc complements

Prove: let `C` be a nondiscrete algebraically closed nonarchimedean field and `U, V ⊂ A¹_C` open with complements in `ℙ¹_C` finite disjoint unions of closed discs (including a disc around `∞`). Then `ℚmot[U](V)` is concentrated in degree zero and is the cokernel of `ℕ[U](V × B) ⊗ ℚ → ℕ[U](V) ⊗ ℚ`, the difference of the two endpoint restrictions; and if the complement of `U` has `d + 1` discs, `ℚmot[U] ≃ ℚ ⊕ (Ḡ_m ⊗ ℚ)^d` (Scholze, Lemma 6.5 and proof, pp. 37–39).

Route: excision and annulus invariance split the motive into the unit and one reduced-unit summand per finite boundary disc. Let the finite boundary discs of `U` be `{|T − a_i| ≤ ρ_i}`, `1 ≤ i ≤ d`, and the disc around `∞` be `{|T − b| ≥ R}` together with `∞`; disjointness gives `|a_i − a_j| > max(ρ_i, ρ_j)` for `i ≠ j`, `|a_i − b| < R` and `ρ_i < R`. A section of `ℕ[U]` of degree `m` over `V` is a map `V → Symᵐ(U)`, and `Symᵐ(U)` is open in `Aᵐ_C` through the characteristic polynomial, so it is a monic polynomial of degree `m` with coefficients analytic on `V` whose roots `T_r` lie in `U` at every point of `V`. Its *product coordinates* are the `d` units `∏_r (T_r − a_j)`, `1 ≤ j ≤ d`, on `V`, the product running over the `m` roots; the comparison sends the section to `m` and to its product coordinates read in `Ḡ_m(V) ⊗ ℚ`. For surjectivity one may take `V` to be an open annulus `{s₁ < |t| < s₂}`, `t` a coordinate centred in its finite complementary disc: a `V` with `e + 1` complementary discs is the intersection of the `e` annuli `V_k` bounded by one of its finite complementary discs and the disc around `∞`, and the sum of the restrictions from the `V_k` maps their targets onto that of `V`. On an annulus the *degree vector* of a section is the vector of slopes (TropicalAndBerkovichArithmetic §1.6) of its `d` product coordinates. For each `i` let `δ_i` be the minimum of `R` and of the distances `|a_i − a_j|`, `j ≠ i`, so `ρ_i < δ_i`; choose `m ≥ 1` with `ρ_i^m s₂ < δ_i^m s₁` and `c ∈ C` with `ρ_i^m < |c| s₁` and `|c| s₂ < δ_i^m`, possible because the value group of `C` is dense. The roots of `Q_{i,t}(T) = (T − a_i)^m − ct` satisfy `ρ_i < |T − a_i| = |ct|^{1/m} < δ_i`: they avoid the `i`-th disc, their distance to `a_j` is `|a_i − a_j| > ρ_j` for `j ≠ i`, and `|T − b| < R` because `|T − a_i| < R` and `|a_i − b| < R`, so they lie in `U`. The `i`-th product coordinate of this section is `(−1)^m Q_{i,t}(a_i) = (−1)^{m+1} ct`, of slope `1`; for `j ≠ i` it is `(−1)^m ((a_j − a_i)^m − ct)`, a constant times a one-unit because `|ct| < δ_i^m ≤ |a_j − a_i|^m`, of slope `0`. So `Q_{i,t}` has the `i`-th basis vector as degree vector, and these span `ℚ^d`. The constant sections, the points of `U`, give the rank and the `Ḡ_m(C) ⊗ ℚ` coordinates: for two points `T₁, T₂` with `ρ_i < |T_k − a_i| < δ_i` and `j ≠ i`, the ratio `1 + (T₁ − T₂)/(T₂ − a_j)` of their `j`-th product coordinates is a one-unit, as `|T₁ − T₂| < δ_i ≤ |T₂ − a_j|`, so `[T₁] − [T₂]` has only the `i`-th coordinate `(T₁ − a_i)/(T₂ − a_i)`, which takes every value of norm in `(ρ_i/δ_i, δ_i/ρ_i)`, and these values generate `Ḡ_m(C) ⊗ ℚ` (Corrections to the source, E2–E3). The polynomials `∏_i (T − a_i)^{k_i} − t` do not serve: each of their product coordinates is `±t`, so all their degree vectors are `(1, …, 1)` (Corrections to the source, E10). For injectivity interpolate coefficients; the Newton-polygon inequalities keep roots in the domain when the two sections have the same product coordinates up to one-units.

**Checks.**

- An open disc has `d = 0` and `ℚmot = ℚ`; an open annulus has `d = 1` and `ℚmot = ℚ ⊕ Ḡ_m ⊗ ℚ`, in agreement with §3.5; for `V` with `e + 1` complementary discs, `V = V₁ ∩ ⋯ ∩ V_e` with `V_k` the open annulus between the `k`-th finite complementary disc of `V` and the disc around `∞`, and each of the `d` product coordinates has one slope on each `V_k`, so the degree coordinates of `(Ḡ_m ⊗ ℚ)^d` at `V` form `ℚ^{de}`, not `ℚ^{e²}` (Corrections to the source, E4).

*Needs:* §§1.6, 3.3, 3.5, 4.1; TropicalAndBerkovichArithmetic §1.6; NewtonPolygons §3.3 (root norms, for the interpolation in the injectivity step).

### 4.5 Curve homotopies after adding prime multiples

Prove: for a separated smooth connected analytic curve `U` over a nondiscrete algebraically closed nonarchimedean field `C`, points `x, x′ ∈ U(C)` and a prime `ℓ`, there are `n ≥ 0` and points `x_i, x′_i ∈ U(C)` such that `[x] + ℓ Σ_i [x_i]` and `[x′] + ℓ Σ_i [x′_i]` are ball-homotopic in `ℕ[U]` (Scholze, Lemma 6.4 and proof, pp. 36–37). The prime `ℓ` may equal the residue characteristic. Separation is the hypothesis of §4.2, whose compactification the proof uses; the curves to which §4.6 applies this statement are separated.

Route: shrink and compactify by §4.2, choose a `C`-point in each boundary disc, and divide `O(x − x′)` by `ℓ` in the marked Jacobian of §4.3. Choose a divisor of the root line bundle supported away from the boundary discs, with a rational section equal to 1 at each mark and with no zero or pole on any boundary disc (Riemann–Roch on `X̄`, then approximation on the discs); write its positive and negative parts as sums of `C`-points. Interpolate the two tautological sections by `t s₁ + (1 − t) s₂`; their ratio is a one-unit on each boundary disc, so the section never vanishes there and the interpolating effective divisors stay in `U`.

*Needs:* §§0.8 (the arc-sheaf `U^arc` underlying `ℕ[U]`), 3.1, 4.1–4.3; JacobianChallenge Layers A–B (divisors, rational sections, Riemann–Roch); TropicalAndBerkovichArithmetic §§0.21–0.22.

### 4.6 Ball-invariant sheafification of presheaves with transfers

Prove: let `F` be a finitary ball-invariant abelian presheaf with transfers on a strict nonarchimedean base. After inverting every prime `ℓ` with `|ℓ| < 1` somewhere on the base, its derived arc-sheafification is ball-invariant; its reduction modulo `n` is étale (§1.8), that is invariant under extensions of geometric Banach points; and, for every strict `A` over the base, `F ⊗ ℚ` is already a sheaf on the site of open subsets of `A¹_A`, and its value on every affine subset of `A¹_A`, that is on every arc-subsheaf `Marc(B) ⊂ A¹_A` with `B` a Banach `A`-algebra, is unchanged by derived arc-sheafification (Scholze, Theorem 6.3, pp. 35–36). Open subsets whose complements in `ℙ¹_A` are finite disjoint unions of closed discs are the proof input of §4.4, not the range of the conclusion.

Route: compute sheafification through the strict basis and quasi-pro-étale sheafification. With torsion coefficients reduce a field extension `C′/C` to topological transcendence degree one, where `Marc(C′)` is a cofiltered limit of connected open neighbourhoods of the point defined by `C′` in analytifications of smooth projective `C`-curves; these curve models are separated, as opens of a separated analytification (TropicalAndBerkovichArithmetic §0.22). A `C`-point of such a model gives injectivity, and the homotopy of §4.5 on it gives surjectivity. Rationally, transfers give finite étale descent, so one may take the base to be a geometric point `C`; the Berkovich line over `C` is a tree, so the sheaf property reduces to covers of a connected open by two connected opens meeting in an open annulus, and by finitarity to opens whose complements in `ℙ¹_C` are finite disjoint unions of closed discs, where §4.4 splits the Čech sequence. Finitarity then gives the values on affine subsets.

**Checks.**

- The closed unit disc `Marc(C⟨T⟩₁) ⊂ A¹_C` is an affine subset and not an open one, so it is covered by the conclusion but by no statement about open domains; for the free ball-invariant presheaf with transfers on the point, its rational value there is `ℚ` before arc-sheafification and `ℚmot(C⟨T⟩₁) = ℚmot(C) = ℚ` after it.
- The primes with `|ℓ| < 1` must be inverted. Over a geometric point `C` of characteristic `ℓ`, let `F(B) = Hom(ℤ[Marc(B)], ℤ/ℓ)`, the sections over `Marc(B)` of the constant abelian arc-sheaf `ℤ/ℓ`, that is the locally constant functions `M(B) → ℤ/ℓ`; a map of monoid sheaves `ℕ[Marc(A)] → ℕ[Marc(B)]` acts by precomposition with the induced map of free abelian sheaves `ℤ[Marc(A)] → ℤ[Marc(B)]`. This is additive, so `F(0) = 0`, `F(C) = ℤ/ℓ` and `F(C × C) = (ℤ/ℓ)²`, and a multiset whose degree varies over the components of `M(B)` acts componentwise by that degree. The constant presheaf with value `ℤ/ℓ` on every algebra is not a presheaf with transfers: in §4.1 `ℕ[Marc(0)] = 0`, so the identity of the zero ring equals the zero map and an additive functor vanishes there, and it would give `ℤ/ℓ` instead of `(ℤ/ℓ)²` on `C × C`. `F` is finitary, because the spectrum of a completed filtered colimit is the inverse limit of the spectra (TropicalAndBerkovichArithmetic §0.16) and every clopen subset of a cofiltered limit of compact Hausdorff spaces comes from a finite stage; it is ball-invariant in degree zero, because `M(B⟨T⟩₁) → M(B)` has the section `T ↦ 0` and connected fibres, closed discs over the residue fields, so every locally constant function on the ball is pulled back from `M(B)`. Its derived arc-sheafification, the constant sheaf `ℤ/ℓ` as a complex, is not ball-invariant. The Artin–Schreier sequence `0 → ℤ/ℓ → O → O → 0`, `x ↦ x^ℓ − x`, is exact arc-locally, so `H¹` of the sheafification on `Marc(B)` contains the cokernel of `x ↦ x^ℓ − x` on the uniform perfection of `B`. That cokernel is `0` for `B = C`, which is algebraically closed, and contains the class of `T` for `B = C⟨T⟩₁`: a solution `x` has Gauss norm at most `1` and would reduce modulo the elements of norm less than one to `x̄ ∈ k[T^{1/ℓ^∞}]` with `x̄^ℓ − x̄ = T`. Write `x̄ = Σ_α c_α T^α` over `α ∈ ℤ[1/ℓ]`, `α ≥ 0`; as `ℓ` is the characteristic, the coefficient of `T^α` in `x̄^ℓ − x̄` is `c_{α/ℓ}^ℓ − c_α`, so `c_{1/ℓ}^ℓ = 1 + c_1`, `c_{ℓ^m} = c_1^{ℓ^m}` for `m ≥ 1` and `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}` for `m ≥ 1`. If `c_1 ≠ 0`, every `c_{ℓ^m}` is nonzero; if `c_1 = 0`, then `c_{1/ℓ} = 1` and every `c_{1/ℓ^m}` equals `1`. Either way infinitely many coefficients are nonzero, which is impossible in `k[T^{1/ℓ^∞}]`. The formal solution `−Σ_{m≥0} T^{ℓ^m}` falls in the first case.

*Needs:* §§0.8 (arc-stacks of the curve models and their open subsets), 1.1, 1.8, 4.1, 4.4, 4.5; TropicalAndBerkovichArithmetic §0.22 (separation of the curve models).

### 4.7 Explicit free motivic sheaves

Prove: for a finitary arc-sheaf of sets `U` over a nonarchimedean small arc-stack `X` and a strict `A` over `X`, the value `ℤmot[U](A)`, after inverting all primes `ℓ` with `|ℓ| < 1` somewhere on `M(A)`, is the group completion of `L_B^pre ℕ[U](A)`; after rationalization the same formula computes the value on every affine subset of `A¹_A`, that is on every arc-subsheaf `Marc(B) ⊂ A¹_A` with `B` a Banach `A`-algebra, closed discs and closed annuli included; and for `n` with `|n| ≥ 1` everywhere on `X`, `ℤmot[U]/n` is étale (§1.8), that is invariant under extensions of geometric Banach points (Scholze, Theorem 6.1 and proof, p. 35). The group completion is the animated one, not only on `π₀`, and the integral formula is not asserted without inverting these primes.

Route: the homotopy presheaves of the group-completed singular monoid are finitary presheaves with transfers; §4.6 makes the sheafification ball-invariant, and the universal property identifies it with the free effective motive.

*Needs:* §§1.8, 2.2, 2.5, 4.6; the animated group completion (gap:animated-group-completion).

### 4.8 Torsion motives and invertibility of residue characteristics

Prove: for `M ∈ Dfin(X, ℤ/n)` with `|n| ≥ 1` everywhere on `X`, `M` is ball-invariant if and only if it is étale (§1.8), so `Deff_mot(X, ℤ/n) = Det(X, ℤ/n)`; for a Banach ring `A` and a prime `p` with `|p|_A < 1`, multiplication by `p` is invertible in `Deff_mot(Marc(A))`; and if `|p| ≥ 1` everywhere on `M(A)`, the `p`-power torsion objects of `Deff_mot(Marc(A))` are exactly the `p`-power torsion objects of `Det(Marc(A), ℤ)`, which for strict `A` form, through §1.8, the derived ∞-category of `p`-power torsion sheaves on the profinite set `M(A)` (Scholze, Corollary 6.6 and Theorem 6.7, p. 39; Proposition 1.5, p. 4). The étale category of the third clause is that of the arc-stack `Marc(A)` (§1.8). The condition `|p|_A < 1` is on the norm of `A`. It implies `|p| < 1` at every point of `M(A)`, since points are bounded by the norm; the pointwise condition is equivalent to spectral radius `lim_n |pⁿ|_A^{1/n} < 1`, since for `A ≠ 0` the spectral radius is the maximum of `|p|` over the compact nonempty `M(A)` (both conditions hold trivially for `A = 0`), and agrees with `|p|_A < 1` when `A` is uniform, but not in general (Checks). The second clause also holds under the pointwise condition: uniform completion gives `Marc(A) ≃ Marc(A^u)` (§0.3), and the norm of `A^u` is the spectral norm, so `|p|_{A^u} < 1`. The third clause has the pointwise condition `|p| ≥ 1`.

Route: one direction is §2.4; for the other, generation by free motives (§2.5) reduces to `ℤmot[U]/n`, handled by §4.7. For `|p| < 1`, pass to `A^u` by §0.3 when only the pointwise condition is given; then reduce to a geometric point, which is perfectoid; its arc-site is invariant under tilting and ball invariance passes to the perfectoid ball, so one may assume characteristic `p`, where the Artin–Schreier sequence `0 → 𝔽_p → B → B → 0`, `x ↦ x^p − x`, and the contractibility of the additive ball give `𝔽_p = 0`. For `|p| ≥ 1`, a `p`-power torsion `M` is the colimit of the objects `(M ⊗^L ℤ/p^m)[−1]`, because `M = M ⊗ fib(ℤ → ℤ[1/p])` and `fib(ℤ → ℤ[1/p]) = colim_m (ℤ/p^m)[−1]`; each `M ⊗^L ℤ/p^m = cofib(p^m : M → M)` is a `ℤ/p^m`-module object, and `|p^m| ≥ 1` everywhere, so the first clause applies to it; both `Deff_mot(Marc(A))` and `Det(Marc(A), ℤ)` are closed under colimits and cofibres (§§1.8, 2.1), which gives the equality of the two torsion subcategories; for strict `A`, §1.8 identifies `Det(Marc(A), ℤ)` with `D(M(A), ℤ)`.

**Checks.**

- Over a geometric point of residue characteristic `p`, effective motives are `ℤ[1/p]`-linear and the prime-to-`p` torsion subcategory with `ℤ/n` coefficients is `D(ℤ/n)`.
- At the complex point the integral category is `D(ℤ)`, not its rationalization.
- For `A = ℂ` and `p = 2`, `|2| = 2 ≥ 1`, and the third clause compares the `2`-power torsion objects of `Deff_mot(Marc(ℂ)) = D(ℤ)` (§2.1) with those of `Det(Marc(ℂ), ℤ) = D(ℤ)` (§1.8): both are the complexes `M` with `M ⊗ ℤ[1/2] = 0`. `Marc(ℂ)` is no v-stack, so only the étale category of §1.8 is defined here.
- On `Marc(ℤ_p)` with the `p`-adic norm every point of the spectrum is bounded by the norm, so `|p| ≤ 1/p < 1` everywhere and `p` is invertible in `Deff_mot`.
- On `Marc(ℤ)` with the archimedean absolute value the spectrum contains the archimedean points, the trivial norm and the points `|·|_q^s` for primes `q`; `|p| < 1` holds at the points `|·|_p^s` and fails elsewhere, so neither clause applies to `Marc(ℤ)` itself, and excision (§1.6) separates the loci.
- Norm-smallness is stronger than pointwise smallness. On `ℤ₂` put `‖x‖ = 2^{−⌊v₂(x)/2⌋}` and `‖0‖ = 0`: it is ultrametric, submultiplicative because `⌊(a + b)/2⌋ ≥ ⌊a/2⌋ + ⌊b/2⌋`, and complete, inducing the `2`-adic topology. Here `‖2‖ = 1`, but `‖2ⁿ‖^{1/n} = 2^{−⌊n/2⌋/n} → 2^{−1/2}`, and the points of the spectrum are the seminorms `c^{v₂(·)}` with `0 ≤ c ≤ 2^{−1/2}`, so `|2| ≤ 2^{−1/2} < 1` everywhere. The literal hypothesis `|2|_A < 1` fails, an equivalence of the two conditions would be false, and `2` is still invertible through `A^u = ℤ₂` with norm `2^{−v₂(·)/2}`.

*Needs:* §§0.3, 1.8 (étale finitary sheaves and their strict description), 2.1, 2.4, 2.5, 4.7; PerfectoidSpaces §§P1.27, P3.20 (tilting of the arc- and étale sites of geometric points).

### 4.9 Effective motivic tilting

For a small arc-stack `X` with `|p| < 1` everywhere, let `X♭` be its tilt: the arc-stack on perfectoid Banach `𝔽_p`-algebras `R` whose sections are pairs of an untilt `R♯` with `|p| < 1` and a section of `X` over `Marc(R♯)`, sheafified. Prove that tilting induces `Deff_mot(X) ≃ Deff_mot(X♭)` and that both are `ℤ[1/p]`-linear (Scholze, Proposition 6.8 and proof, pp. 39–40).

Prove the following API.

- A map `φ : Y → X` of small arc-stacks with `|p| < 1` induces `φ♭ : Y♭ → X♭`, sending a pair `(R♯, s)` to `(R♯, φ(s))`; the identity goes to the identity and `(φ ∘ ψ)♭ = φ♭ ∘ ψ♭`.
- Tilting commutes with fibre products and with base change: `(Y ×_X Z)♭ ≃ Y♭ ×_{X♭} Z♭`, since the presheaf of pairs is formed sectionwise and sheafification preserves finite limits; as the arc-sites over `X` and over `X♭` are equivalent through the perfectoid basis, it also commutes with colimits of small arc-stacks over `X`.
- For a perfectoid Banach ring `A` with `|p|_A < 1`, `Marc(A)♭ ≃ Marc(A♭)`: by the tilting equivalence over `A` (PerfectoidSpaces §P1.27), an untilt `R♯` of `R` with a map `A → R♯` is the same as a map `A♭ → R`, the untilt being the perfectoid `A`-algebra that corresponds to the perfectoid `A♭`-algebra `R` under that equivalence, with its marking (PerfectoidSpaces §§P1.19–P1.22).

**Checks.**

- The initial arc-stack has the initial arc-stack as tilt: no untilt carries a section of it.
- A perfectoid field `K` of characteristic `p` is its own tilt: a map `K → R♯` forces `p = 0` in `R♯`, and the only untilt of `R` of characteristic `p` is `R` itself, so `Marc(K)♭ ≃ Marc(K)`.
- For `ℂ_p`, `Marc(ℂ_p)♭ ≃ Marc(ℂ_p♭)` although the fields have different characteristics. The naive restriction of `Marc(ℂ_p)` to characteristic-`p` algebras is empty, since `ℂ_p` maps to no `𝔽_p`-algebra, so it is not the tilt. Both sides keep the same prime-to-`p` Tate fibres: for `C = ℂ_p` and `n` prime to `p`, `1 + C_{<1}` is uniquely `n`-divisible, so `μ_n(C)` is the `n`-torsion of `C^×/(1 + C_{<1}) ≅ (C♭)^×/(1 + C♭_{<1})`, which is `μ_n(C♭)`; and both have vanishing `p`-torsion motives, `p` being invertible by §4.8 (`|p| = 1/p` on `ℂ_p`, `|p| = 0` on `ℂ_p♭`).

Route: tilting of perfectoid rings matches the perfectoid bases (§0.5) of the arc-sites over `X` and over `X♭`, so `Dfin(X, ℤ) ≃ Dfin(X♭, ℤ)`, and the two effective subcategories differ only in the ball against which invariance is tested. Over `X♭` the ring of the ball and its completed perfection have the same contractive maps to perfectoid rings, and the untilt of that perfection over a perfectoid `A` is the perfectoid ball `A⟨T^{1/p^∞}⟩₁`, the completed union of the balls `B_m = A⟨T^{1/p^m}⟩₁`; so finitarity makes every ball-invariant object over `X` invariant under the perfectoid ball. For the converse let `M` be invariant under the perfectoid ball, that is ball-invariant over `X♭`, so that `p` is invertible on `M` by §4.8 applied over `X♭`. Each inclusion `B_m → B_{m+1}` is the `p`-th power map `f` of a ball, finite of degree `p`; the transfers of §4.1 give a trace `f_* ℤ → ℤ` whose composite with the unit `ℤ → f_* ℤ` is multiplication by `p`, so `M(B_m) → M(B_{m+1})` has the retraction `p⁻¹ · trace`. Composing these retractions gives compatible maps `M(B_m) → M(B_0)`, hence a retraction of `M(B_0) → colim_m M(B_m) = M(A⟨T^{1/p^∞}⟩₁)`. That map is thus split injective, and it is also split surjective, because its composite with `M(A) → M(B_0)` is an equivalence by hypothesis; so it is an equivalence, and then so is `M(A) → M(B_0)`, which is ball invariance.

*Needs:* §§0.5, 4.1, 4.8; PerfectoidSpaces §§P1.4, P1.19–P1.22, P1.27, P2.12.

### 4.10 The integral homotopy t-structure

Prove: for every small arc-stack `X`, `Deff_mot(X)` is closed under the truncations of `Dfin(X, ℤ)`, so it inherits the integral homotopy t-structure (Scholze, Corollary 6.9, p. 40). Route: use the sequence `M → M ⊗ ℚ → M ⊗ ℚ/ℤ` and §§2.3, 4.8; the remaining point is that the image of a map from a rational effective sheaf in degree zero to a torsion one is effective. A class in that image over a field extension descends by finitarity to a topologically finitely generated algebra over the smaller algebraically closed field, which has a section; so the image is invariant under field extension and §4.8 applies. Separately rationalizing and reducing modulo primes does not control this image.

*Needs:* §§2.3, 2.5, 4.8.

### Examples

Let `X̄ = ℙ¹_C` with marks `0` and `∞`. Every degree-zero line bundle is trivial; two nonzero trivializations give `(a, b) ∈ (C^×)²`, and dividing by simultaneous scaling leaves the coordinate `a/b`, so `J_Z = G_m`, of torus rank `r − 1 = 1`. For `x, y` away from the marks, the rational section `(t − x)/(t − y)` has marked values `1` at `∞` and `x/y` at `0`, so its class has coordinate `x/y`. Every nonzero element of the algebraically closed `C` has an `n`-th root, so multiplication by `n` is surjective on `J_Z(C)`; for `char C = p = n` this still holds although multiplication by `p` is inseparable. The marked Jacobian supplies divisibility of classes, not an étale cover.

### Dependencies

Layers 0–3; EnhancedDerivedSheaves §E5:animation.1; JacobianChallenge Layers A, B, D, E; PerfectoidSpaces §§P1.4, P1.19–P1.22, P1.27, P2.12, P3.20; TropicalAndBerkovichArithmetic §§0.17, 0.21–0.22, 1.1, 1.6, 2.16; NewtonPolygons §3.3; gap animated-group-completion.

## Layer 5: Cancellation over every small arc-stack

This layer proves Tate cancellation over arbitrary small arc-stacks and computes symmetric powers, projective cells and the rational motive of `BG_m`.

### 5.1 Permutations of Tate powers

Prove that every permutation acts trivially on `ℤ(1)^{⊗n}` in the homotopy category of `Deff_mot(X)`, for every `n ≥ 0` and every small arc-stack `X` (Scholze, Lemma 7.3 and the discussion before its proof, p. 43). The coherent statement follows after cancellation (§5.3). Over every base, `ℤ(1)[1] = cofib(ℤmot[∗] → ℤmot[G_m])` is the reduced free motive of `G_m` (§3.4), so the swap on `ℤ(1) ⊗ ℤ(1)` and the swap on `ℤ(1)[1] ⊗ ℤ(1)[1]` differ by the Koszul sign `−1`. At the complex point the reduced free motive is `ℤ[1]`, whose swap on `ℤ[1] ⊗ ℤ[1] = ℤ[2]` is `−1`, while the swap on `ℤ(1) ⊗ ℤ(1) = ℤ ⊗ ℤ` is `+1`; on the nonarchimedean locus the reduced free motive is `Ḡ_m` (§3.3), and there the comparison is with the swap on `Ḡ_m ⊗ Ḡ_m`.

Route: identify the reduced motive of `A² ∖ {0}` with `ℤ(2)[3]` using the two standard charts; elementary unipotent matrices act through ball homotopies and generate `SL₂`, which reduces the coordinate interchange to `diag(−1, 1)`; multiplication by `−1` acts trivially on the reduced free motive of `G_m` since total multiplicity is zero; general permutations are products of adjacent transpositions. Cancellation is not used.

*Needs:* §§1.6, 2.5, 3.3, 3.4.

### 5.2 The rational cancellation inverse

Prove: over a nondiscrete algebraically closed nonarchimedean field `C`, for each finitary arc-sheaf of sets `U` and `i ≥ 0`, there is a natural operation from `π_i Hom(ℚmot[(G_m, 1)], ℚmot[U × (G_m, 1)])` to eventually defined sequences in `π_i ℚmot[U]`, whose composite with the Tate unit is the constant sequence, which kills the base-point summand, and whose other composite becomes the identity by Tate interchange (Scholze, proof of Theorem 7.1, pp. 41–43). Sequences are identified when they agree for all sufficiently large `N`. Here `(G_m, 1)` is `G_m` pointed by the unit section, so that `ℚmot[(G_m, 1)] = cofib(ℚmot[∗] → ℚmot[G_m]) = ℚ(1)[1]` and `ℚmot[U × (G_m, 1)] = ℚmot[U] ⊗ ℚ(1)[1]`; the *Tate unit* is the map `π_i ℚmot[U] → π_i Hom(ℚmot[(G_m, 1)], ℚmot[U × (G_m, 1)])` induced by `− ⊗ ℚmot[(G_m, 1)]`, the unit of the adjunction whose invertibility §5.3 asserts; and *Tate interchange* is the swap of the two factors of `ℚmot[(G_m, 1)] ⊗ ℚmot[(G_m, 1)] = ℚ(1)[1] ⊗ ℚ(1)[1]`, which acts by `−1`, the swap of `ℚ(1) ⊗ ℚ(1)` being trivial (§5.1) and the two shifts contributing the Koszul sign. The other composite equals the identity after this swap is inserted on two of its terms, and the two signs cancel.

Route: represent a class on a closed annulus times a subdivided simplicial sphere through §4.7. Form `Y₁` from the discs around the `N`-th roots of unity and `Y₂` from the equation `p₁^N = p₂` in the multivalued graph; for large `N` both fibre over étale spaces with finite geometric fibres and open-ball fibres, and these étale spaces may be nonseparated where points collide. Sum the induced maps to `ℕ[U]` with multiplicities and take the difference. Check independence of representing homotopies and refinements, and use §5.1 twice for the other composite. No single `N` works for all homotopy classes; this is why sequences are eventual.

*Needs:* §§3.5, 4.1, 4.7, 5.1; TropicalAndBerkovichArithmetic §1.1.

### 5.3 Cancellation

Prove: for every small arc-stack `X`, tensoring with `ℤ(1)` is fully faithful on `Deff_mot(X)`; equivalently `M → Hom(ℤ(1), M ⊗_mot ℤ(1))` is an equivalence for every effective `M` (Scholze, Theorem 7.1 and Remark 7.2, pp. 40–43; Theorem 1.9, p. 6). There is no field or smoothness hypothesis on `X`. After cancellation, the symmetric-group actions on Tate powers are homotopy-coherently trivial, because the endomorphism space of the unit is discrete.

Route: by the annulus model and proper base change, compare internal Homs with ambient derived sheaves and reduce to strict bases, where compactness of `ℤ(1)` (§3.5) reduces to geometric points. At the complex point `ℤ(1)` is the unit. With torsion coefficients apply §4.8. In the rational nonarchimedean case apply §5.2 on free generators. Combine rational and torsion statements integrally and descend. The statement is that the unit of the adjunction is an equivalence, not only injectivity on `π₀`.

*Needs:* §§1.7, 2.5, 3.5, 4.8, 5.1, 5.2.

### 5.4 Symmetric powers and projective cells

Prove: for `n ≥ 0`, `Symⁿ(ℚ(1)) ≃ ℚ(n)`; for `n ≥ 1` the cofibre of `ℤmot[ℙ^{n−1}] → ℤmot[ℙⁿ]` is `ℤ(n)[2n]`; and there is a canonical decomposition `ℚmot[BG_m] ≃ ⊕_{n≥0} ℚ(n)[2n]`, with `ℙⁿ` mapping onto the summands `0 ≤ i ≤ n` through the class of `O(1)` (Scholze, Corollaries 8.1–8.2 and proof, p. 44). The cell cofibre is integral; the splitting is rational. The free motives of `ℙⁿ` and of `BG_m = ∗/G_m` are those of §2.7, computed through the affine charts and the bar construction.

Route: coherent Tate symmetry after cancellation identifies rational symmetric powers. The cell cofibres come from the affine chart and the `A¹`-bundle over `ℙ^{n−1}`. Animate the augmentation-ideal filtration on the group algebra of the 1-connective `BG_m`; its graded pieces have increasing connectivity, and the projective cells split the filtration and give convergence to the direct sum.

**Checks.**

- `ℙ⁰` maps onto the `n = 0` unit summand.
- `ℤmot[ℙ¹] = ℤ ⊕ ℤ(1)[2]`.
- No finite stage suffices: at the complex point `ℚmot[BG_m]` is the rational homology of `ℂℙ^∞`, one `ℚ` in each degree `−2n`, `n ≥ 0`, while the image of `ℚmot[ℙ¹]` is the summands `n = 0, 1` (degrees `0` and `−2`); in degree `−4` the stage `ℙ¹` gives `0` and `BG_m` gives `ℚ`, supplied by `ℙ²`. At the complex point this family does not separate the sum from the product: each degree contains exactly one nonzero `ℚ[2n]`, so `⊕_n ℚ[2n] → ∏_n ℚ[2n]` is an equivalence in `D(ℚ)`.

*Needs:* §§0.8, 2.5, 2.7, 3.4, 5.1, 5.3; the augmentation-ideal filtration (gap:augmentation-ideal-filtration).

### Examples

Apply the rational inverse of §5.2 to an element represented on a closed annulus. For large `N`, the two multivalued counting constructions applied to the image of the Tate unit have total multiplicities `N` and `N − 1`, and their difference `N − (N − 1) = 1` recovers the class. A component of multiplicity `p` in residue characteristic `p` contributes `p` to the count; counting distinct roots instead changes the answer. On the base-point summand the two counts agree, and the difference is zero.

### Dependencies

Layers 0–4; TropicalAndBerkovichArithmetic §1.1; gap augmentation-ideal-filtration.

## Layer 6: Motivic K-theory and Adams weights

This layer constructs motivic K-theory as the universal ball-invariant arc-sheaf of spectra under connective algebraic K-theory, proves it finitary, and identifies its rationalization with `⊕_{n≥0} ℚ(n)[2n]`, canonically split by Adams eigenvalues.

### 6.1 Motivic K-theory

For a Banach ring `A` let `Kcn(A)` be the connective K-theory spectrum of the underlying abstract ring, the group completion of the E∞ space of finite projective `A`-modules under direct sum, an E∞-ring under tensor product. Define `Kmot` as the universal ball-invariant arc-sheaf of spectra under `A ↦ Kcn(A)`: the spectral ball localization (§2.2) of the arc-sheafification. Prove that `Kmot` is finitary and inherits an E∞-ring structure (Scholze, Definition 8.3 and Proposition 8.4, pp. 44–45; Theorem 1.7(i), p. 5). `Kmot` is a sheaf of spectra, not an object of `D(ℤ)`.

Prove the following API.

- Maps from `Kmot` to a ball-invariant arc-sheaf of spectra correspond to maps from `Kcn`.
- The map `Kcn → Kmot` is a map of E∞-ring presheaves, and `Kmot` is an E∞-ring sheaf.
- On the strict basis, `Kmot` commutes with completed filtered colimits.

**Checks.**

- A free module of rank one maps to the unit and the zero module to zero. At a geometric point `C` of residue-characteristic exponent `p` the unit induces `ℤ[1/p] ≅ π₀ Kmot(C)`, with `p = 1` and `π₀ = ℤ` at the complex point and in residue characteristic zero (§7.6, where `π₀ E_K(C) = K₀(C) = ℤ` because `K₀(C_{<1}) = K₋₁(C_{<1}) = 0`). For `C = ℂ₂` or `ℂ₃` this is `ℤ[1/2]` or `ℤ[1/3]`, and no additive map `ℤ[1/p] → ℤ` sends `1` to `1` (it would give `p · rank(1/p) = 1` in `ℤ`), so `Kmot(C)` carries no integral rank retraction of the unit; the integral rank lives on `E_K(C)` (§7.7).
- `Kmot(A) → Kmot(A⟨T⟩₁)` is an equivalence, whereas for a nonarchimedean geometric point `C`, `K₁(C) = C^× → K₁(C⟨T⟩₁) ⊇ C⟨T⟩₁^×` is not surjective (the one-unit `1 + aT`, `0 < |a| < 1`), so `Kcn` is not ball-invariant.
- At the complex point `Kmot ⊗ ℚ = ⊕_{n≥0} ℚ[2n]` (rational topological K-theory of a point, by §6.3 and `ℚ(n) = ℚ`), not the rank sheaf `ℚ[0]` alone.

Route: take the group-completion model of connective K-theory of GeneralAlgebraicKTheoryPartII §1.2 with the E∞-ring structure of RefinedTraceMethods §4.10; resolve the sheafified group completion of `⨿_n ∗/GL_n` by classifying spaces of products of `GL_n` through a Breen–Deligne resolution, and these by `GL_n`-charts, whose free ball-invariant sheaves are finitary by §2.5; apply symmetric monoidal spectral localization.

*Needs:* §§0.8 (`GL_n` and `∗/GL_n`), 2.2, 2.5, 2.7; GeneralAlgebraicKTheoryPartII §1.2 and RefinedTraceMethods §4.10; GeneralAlgebraicKTheory §3.2; EnhancedDerivedSheaves §E5:presentability.2 (`spectra`, stabilization) and §E5:abstract.3; the sheafified group completion (gap:animated-group-completion) and its Breen–Deligne resolution (gap:breen-deligne-resolution).

### 6.2 Rational flag invariants

Prove: for `n ≥ 1`, the `Σ_n`-invariants of `ℚmot[GL_n/G_m^n]`, for the action of the normalizer of the diagonal torus, are `ℚ[0]` (Scholze, proof of Proposition 8.5, pp. 45–46).

Route: induct on `n`; the `Σ_{n−1}`-invariants identify with `ℚmot[ℙ^{n−1}]` through the projection to the first column and the flag fibration, so by §5.4 they are `⊕_{0≤i<n} ℚ(i)[2i]`, and the averaging idempotent `e` of `Σ_n` acts on this sum. By cancellation (§5.3) `Hom(ℚ(i)[2i], ℚ(j)[2j]) = Hom(ℚ(i−j)[2(i−j)], ℚ)` vanishes for `i > j`, because `ℚ(i−j)[2(i−j)]` is `(i−j)`-connective (it sits in homological degrees `≥ i−j`; Scholze, proof of Corollary 8.2, p. 44) while `ℚ` sits in degree zero, and `End(ℚ(i)[2i]) = H⁰(X, ℚ)`, so `e` is triangular with diagonal entries idempotent locally constant rationals. The objects and the action are pulled back from the terminal arc-sheaf `Marc(ℤ)`, whose spectrum is connected, so the diagonal entries are rational numbers and may be computed at the complex point. There, by §1.3 applied to the compact pieces of §0.8, whose interiors exhaust the manifold `GL_n(ℂ)/T(ℂ)`, the realization is the sheaf cohomology of the constant sheaf `ℚ` on `GL_n(ℂ)/T(ℂ)`. A manifold is locally contractible, so this is its singular cohomology, compatibly with the homeomorphisms by which `Σ_n` acts (ComplexComparisonPartII §C5.1, `nonempty_sheafSingularComparison`, natural in the space). The inclusion `U(n)/T → GL_n(ℂ)/T(ℂ)` commutes with right multiplication by the permutation matrices, which are unitary, and is a homotopy equivalence. Indeed, the diffeomorphism `U(n)/T ≅ GL_n(ℂ)/B(ℂ)` of RepresentationTheory (LieGroups) Layer 8, with `B(ℂ) = N(ℂ) ⋊ T(ℂ)` the upper triangular matrices and `N(ℂ)` the unipotent ones, writes every coset as `k u T(ℂ)` with `k ∈ U(n)` and `u ∈ N(ℂ)`, the pair being unique up to `(k, u) ↦ (k t, t⁻¹ u t)` with `t ∈ T`; then `k u T(ℂ) ↦ k exp((1 − s) log u) T(ℂ)`, `0 ≤ s ≤ 1`, is well defined, because conjugation by `t` commutes with `exp` and `log` on unipotent matrices, and deforms `GL_n(ℂ)/T(ℂ)` onto `U(n)/T`. The deformation need not commute with `Σ_n`, which does not normalize `N(ℂ)`; the inclusion does, which suffices. So the realization is the rational cohomology of `U(n)/T`, with its `Σ_n`-action. It is concentrated in even degrees (Bruhat cells) and has total dimension `χ(U(n)/T) = n!`; each `w ≠ 1` in `Σ_n` acts on `U(n)/T` without fixed points, so its Lefschetz number, which is its trace on cohomology, vanishes. Hence the cohomology is the regular representation of `Σ_n`, its invariants are one-dimensional, and they are `H⁰`. So the diagonal of `e` is `(1, 0, …, 0)` and its image is `ℚ[0]`.

**Checks.**

- For `n = 1` the group is trivial and `ℚmot[G_m/G_m] = ℚ[0]`.
- For `n = 2`, `ℚmot[ℙ¹] = ℚ ⊕ ℚ(1)[2]` and the transposition acts on the complex realization `H*(ℙ¹; ℚ)` by `+1` on `H⁰` and `−1` on `H²` (it is the antipodal map of the sphere `U(2)/T ≅ S²`, of degree `−1`), so the invariants are `ℚ[0]`.
- A claim that arbitrary realizations are conservative is not used: only the computation of rational diagonal entries.

*Needs:* §§0.8, 1.3, 2.3 (the rational homotopy t-structure, for the vanishing of maps from `(i−j)`-connective objects to `ℚ`), 2.6, 2.7 (the free motive of `GL_n/G_m^n`), 5.3, 5.4; RepresentationTheory (LieGroups) Layer 8 (Bruhat decomposition, the cohomology of the flag manifold and the diffeomorphism `U(n)/T ≅ GL_n(ℂ)/B(ℂ)`); ComplexComparisonPartII §C5.1 (`nonempty_sheafSingularComparison`, sheaf cohomology of the constant sheaf `ℚ` on the locally contractible `GL_n(ℂ)/T(ℂ)` as singular cohomology, naturally in the space); CharacteristicClasses §C5 (the Euler characteristic of `G/T` equals `|W|`); MorseNovikov §6.5 (`lefschetz_fixed_point_formula`, applied to the smooth free action of each `w ≠ 1` on the compact boundaryless manifold `U(n)/T`, whose fixed-point set is empty, so that its alternating trace on rational homology, equal to that on rational cohomology, is `0`).

### 6.3 The canonical rational splitting of motivic K-theory

Prove: the map `ℚmot[BG_m] → Kmot ⊗ ℚ` induced by line bundles is an equivalence; the descending motivic filtration on `Kmot ⊗ ℚ` is separated with graded pieces `ℚ(n)[2n]` for `n ≥ 0`; and the endomorphism of `ℚmot[BG_m]` induced by the squaring map of `G_m` acts by `2ⁿ` on the `n`-th graded piece, which splits the filtration canonically and gives `Kmot ⊗ ℚ ≃ ⊕_{n≥0} ℚ(n)[2n]` (Scholze, Proposition 8.5 and Corollary 8.6, pp. 45–46; Theorem 1.7(ii), p. 5). On classes of line bundles the squaring map is the second Adams operation `ψ²[L] = [L²]` of SchemeKTheoryOperations §§6.4 and 6.8, so the summands are the Adams eigenspaces. Multiplication sends weights `(m, n)` to `m + n`.

Route: `Kcn` is the group completion of `⨿_n ∗/GL_n` and the source is the group completion of `⨿_n ∗/(G_m^n ⋊ Σ_n)`; by Breen–Deligne resolutions it suffices that `ℚmot[∗/(G_m^n ⋊ Σ_n)] → ℚmot[∗/GL_n]` is an equivalence, which is §6.2. Transfer the convergent augmentation filtration of §5.4; the distinct eigenvalues `2ⁿ` give canonical projectors on finite stages, and increasing connectivity identifies the colimit with the direct sum.

*Needs:* §§5.4, 6.1, 6.2; SchemeKTheoryOperations §§6.4, 6.8 (`ψ^k[L] = [L^k]`); the animated group completion (gap:animated-group-completion) and the Breen–Deligne resolution (gap:breen-deligne-resolution).

### Examples

The rational motive of `ℙ²` is `ℚ ⊕ ℚ(1)[2] ⊕ ℚ(2)[4]`, and the corresponding three-step piece of the filtration has `ψ²`-eigenvalues `1, 2, 4`. Writing `ψ = ψ²`, the projectors on this piece are `(ψ − 2)(ψ − 4)/3`, `−(ψ − 1)(ψ − 4)/2` and `(ψ − 1)(ψ − 2)/6`; evaluated at the eigenvalues `1, 2, 4` they give `(1, 0, 0)`, `(0, 1, 0)` and `(0, 0, 1)`. The denominators `3 = (1−2)(1−4)`, `−2 = (2−1)(2−4)` and `6 = (4−1)(4−2)` are nonzero because the eigenvalues are distinct.

### Dependencies

Layers 0–5; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheoryPartII §1.2; RefinedTraceMethods §4.10; SchemeKTheoryOperations §§6.4, 6.8; EnhancedDerivedSheaves §§E5:abstract.3, E5:presentability.2; RepresentationTheory (LieGroups) Layer 8; ComplexComparisonPartII §C5.1; CharacteristicClasses §C5; MorseNovikov §6.5; gaps animated-group-completion and breen-deligne-resolution.

## Layer 7: The K-theory of one-units

This layer identifies motivic K-theory explicitly through the cofibre of the K-theory of the ideal `A_{<1}`, first under a root hypothesis, then on perfectoid rings and for the root-free homotopy K-theory variant, and on strict bases after inverting the necessary primes; it also equips the integral cofibre over a geometric point with an E∞-structure.

### 7.1 The one-unit K-cofibre

Let `A` be a nonarchimedean uniform Banach ring with a topologically nilpotent unit `T` admitting `n_i`-th roots for a strictly increasing sequence of integers `n_i`. Then `I = A_{<1}` is the colimit of a unitization `B ⊃ I` along multiplication by `T^{1/n_i − 1/n_{i+1}}`, hence flat and idempotent over `B` and Tor-unital. Let `K(I)` be its nonunital K-theory, `fib(K(B) → K(B/I))`, which is independent of `B`, and define `E_K(A) = cofib(K(I) → K(A))`, and `E_Kcn(A)` with connective covers (Scholze, discussion before Proposition 8.7, pp. 46–47). Prove that `E_K` and `E_Kcn` commute with completed filtered colimits of Banach rings in this class and agree on totally disconnected rings (Scholze, Proposition 8.8, p. 47). `K(I)` is the nonunital K-theory, not the K-theory of the group `1 + I`.

Prove the following API.

- A contractive map of rings in this class, compatible with chosen roots, induces a map of cofibre sequences.
- Replacing the unitization `B` by any other unital ring containing `I` as an ideal leaves `K(I)` and `E_K` canonically unchanged.
- `E_K` commutes with completed filtered colimits in the class.

**Checks.**

- For `I = 0` the nonunital term vanishes and `E_K(A) = K(A)`; this is the case of a discrete field, which is excluded from the class because it has no topologically nilpotent unit.
- For a valued field `C` in the class, `K(C_{<1}) = fib(K(O_C) → K(k))` with `k` the residue field, and `E_K(C)` sits in a cofibre sequence `K(O_C) → K(C) ⊕ K(k) → E_K(C)`.
- For `A = ℚ_p`, `I = pℤ_p` has `I/I² ≅ 𝔽_p ≠ 0`, so `Tor₁` of the augmentation over `ℤ ⊕ I` is nonzero and `I` is not Tor-unital; `ℚ_p` has no compatible roots of a pseudouniformizer and lies outside the class.

Route: identify `K(I)` with the continuous K-theory of the dualizable category of almost modules (RefinedTraceMethods §4.20), or with Suslin's nonunital K-theory under Tor-unitality (GeneralAlgebraicKTheory §8.10). Commutation with uncompleted filtered colimits is that of K-theory (GeneralAlgebraicKTheory §§13.4–13.5); what remains is invariance under completion. Put `B = ℤ ⊕ A_{<1}`. As `|T| < 1` and `|Tⁿ a| → 0` for every `a ∈ A`, inverting `T` in `B` gives `A`, and the localization theorem (SchemeKTheoryOperations §3.3) gives the fibre sequence `K(B on T) → K(B) → K(A)`, the first term being K-theory with supports in `T = 0`. Since `K(A_{<1}) = fib(K(B) → K(ℤ))`, the octahedral axiom identifies `E_K(A)` with the cofibre of the composite `K(B on T) → K(B) → K(ℤ)`. Its target does not involve `A`, and its source depends only on the derived fibre of `B` at `T = 0` (SchemeKTheoryOperations §3.8), which completing `A` leaves unchanged; so `E_K` is invariant under completion. For totally disconnected rings, finitarity reduces the agreement of `E_K` and `E_Kcn` to a Banach field `F` with valuation ring `O_F` and residue field `κ`. These three rings are valuation rings, so their K-theory has no negative homotopy (gap:valuation-ring-k-regularity), and `K₀(O_F) → K₀(κ)` is the identity of `ℤ`, so `K(F_{<1}) = fib(K(O_F) → K(κ))` is connective as well. Hence both terms of `K(F_{<1}) → K(F)` are connective, and passing to connective covers does not change the cofibre.

*Needs:* §3.1; RefinedTraceMethods §4.20; GeneralAlgebraicKTheory §§8.3, 8.10, 10.10, 13.4–13.5; SchemeKTheoryOperations §§3.1, 3.3, 3.8; the K-theory of valuation rings (gap:valuation-ring-k-regularity).

### 7.2 Connective K-theory of one-units vanishes motivically

Prove: the universal ball-invariant arc-sheaf under `A ↦ Kcn(A_{<1})` on the class of §7.1 is zero (Scholze, Proposition 8.7, p. 47). Route: with `B = ℤ ⊕ A_{<1}`, `Kcn(B)` is the group completion of `⨿_n ∗/GL_n(B)`, and `GL_n(B) → GL_n(ℤ)` has ball-contractible fibres by scaling the infinitesimal part of a matrix by `t` in the unit ball, which preserves invertibility since `|ta| < 1` for `|t| ≤ 1`, `|a| < 1`; group-complete and ball-localize.

*Needs:* §§2.2, 6.1, 7.1.

### 7.3 Analytic descent of the K-cofibre on perfectoid rings

Prove: on perfectoid Banach rings `A` with `|p|_A < 1`, a class stable under rational localization and uniformly completed tensor products, `A ↦ E_K(A)` is a sheaf for the analytic topology (Conventions); if moreover all sheaves on `M(A)` are Postnikov complete, then `E_K(A) ⊗ ℚ` is the value at `A` of a finitary ball-invariant hypercomplete arc-sheaf and `Kmot(A) ⊗ ℚ ≃ E_K(A) ⊗ ℚ` (Scholze, Theorem 8.11 and Corollary 8.12, pp. 48–49). The Postnikov hypothesis holds when `M(A)` has finite covering dimension. Analytic descent alone does not give arc-hyperdescent of unbounded objects.

Route: `fib(K(A_{<1}) → K(A))` is the continuous K-theory of torsion almost `A_{≤1}`-modules, by the two Verdier sequences `D_tor(A_{≤1})^a → D(A_{≤1})^a → D(A)` and `D(A_{≤1})^a → D(A_{≤1}) → D(A_{≤1}/A_{<1})`. For a closed `Z ⊂ M(A)` the almost algebra `O⁺(Z)^a` is an idempotent complete `A^a_{≤1}`-algebra, by almost acyclicity of `O⁺` on rational coverings; this gives Verdier sequences localizing on `M(A)`, and continuous K-theory turns a cover by two closed subsets into a pullback. Rationally, traces give profinite étale descent; Postnikov completeness on `M(A)` compares with arc-hypersheafification. Perfectoid-ball invariance reduces by excision to `K(O_C[T^{1/p^∞}]) → K(k[T^{1/p^∞}])` and `A¹`-invariance of K-theory over valuation rings; it implies ball invariance by §4.9.

*Needs:* §§1.1, 4.9, 7.1; the rational localizations and the analytic topology of the Conventions, with TropicalAndBerkovichArithmetic §0.16 (the completed pushout defining `A⟨f/g⟩`); RefinedTraceMethods §4.20; PerfectoidSpaces §§P2.3, P2.7, P2.13 (stability of perfectoid rings under the uniformly completed tensor products of the Čech nerve); TropicalAndBerkovichArithmetic §§0.28, 0.30 (rank-one points of `Spa(A, A°)` and `M(A)`); AlgebraicKTheory §4.3 (covering dimension); EnhancedDerivedSheaves §E2.4 and gap:compact-hausdorff-dimension (Postnikov completeness from finite covering dimension); gap:valuation-ring-k-regularity.

### 7.4 The root-free analytic KH-cofibre

Prove: on uniform analytic nonarchimedean Banach rings `A`, for which `A_{<1}` is an ideal of `A_{≤1}` (§3.1), the functor `A ↦ E_KH(A) = cofib(KH(A_{<1}) → KH(A))` is a sheaf for the analytic topology (Conventions); if all sheaves on `M(A)` are Postnikov complete, `E_KH ⊗ ℚ` is a finitary ball-invariant arc-hypersheaf there and `Kmot(A) ⊗ ℚ ≃ E_KH(A) ⊗ ℚ`; and if `A` is moreover totally disconnected and in the class of §7.1, so that `E_K(A)` is defined, this equals `E_K(A) ⊗ ℚ` (Scholze, Theorem 8.13 and proof, pp. 49–50). Here `KH(A_{<1})` is the homotopy K-theory of the nonunital ring, defined through any unitization because `KH` satisfies excision; no root hypothesis is needed. On a uniform ring with `|2| ≤ 1` the norm is ultrametric (§3.1), which makes `A_{<1}` an ideal (Scholze, §5.2, p. 32, introduces the subgroups `A_{<r}` on uniform rings of the nonarchimedean locus); the restriction loses nothing for `Kmot`, since `Marc(A) ≃ Marc(A^u)` (§0.3).

Prove the following API.

- A contractive map `A → A′` of uniform analytic nonarchimedean Banach rings carries `A_{<1}` into `A′_{<1}` and induces a map of cofibre sequences `KH(A_{<1}) → KH(A) → E_KH(A)` to `KH(A′_{<1}) → KH(A′) → E_KH(A′)`, compatibly with identities and composites.
- For every unital ring `B` containing `A_{<1}` as an ideal, for instance `A_{≤1}` or `ℤ ⊕ A_{<1}`, `KH(A_{<1}) ≃ fib(KH(B) → KH(B/A_{<1}))`, and the identifications for two such `B` agree canonically, by excision for `KH` (gap:kh-excision), applied to the ring maps `ℤ ⊕ A_{<1} → B`, `(n, a) ↦ n · 1_B + a`, which carry `A_{<1}` isomorphically onto the ideal `A_{<1}` of `B` and need not be injective (for `A = ℚ_p` and `B = ℤ_p`, `(p, −p) ↦ 0`); so `E_KH` does not depend on the unitization.
- On rings of the class of §7.1 the map `K → KH` induces a natural map `E_K(A) → E_KH(A)`; on totally disconnected rings of that class it is an equivalence: finitarity reduces this to a Banach field `F`, and on `F`, on its valuation ring `O_F` and on its residue field, three valuation rings, the map `K → KH` is an equivalence (gap:valuation-ring-k-regularity) (Scholze, discussion before Theorem 8.13, p. 49).

**Checks.**

- `ℚ_p` lies outside the class of §7.1 (`pℤ_p/(pℤ_p)² = 𝔽_p ≠ 0`), so `E_K(ℚ_p)` is not defined there, but `E_KH(ℚ_p)` is. As `ℤ_p`, `𝔽_p` and `ℚ_p` are regular noetherian, `KH = K` on them (SchemeKTheoryOperations §5.2), `KH(pℤ_p) = fib(K(ℤ_p) → K(𝔽_p))` has `π₀ = π₋₁ = 0` (`K₀(ℤ_p) → K₀(𝔽_p)` is an isomorphism and `ℤ_p^× → 𝔽_p^×` is onto), and `π₀ E_KH(ℚ_p) = K₀(ℚ_p) = ℤ`. The fibre instead of the cofibre would give `π₀ = ℚ_p^×/(1 + pℤ_p) ≅ ℤ × 𝔽_p^×`.
- For a nondiscrete algebraically closed nonarchimedean field `C`, totally disconnected and in the class of §7.1, `π₀ E_KH(C) = K₀(C) = ℤ`, so the rational rank is `ℚ`, in agreement with `E_K(C)` and with §7.6.
- For the product `C × C′` of two such fields with the maximum norm, `(C × C′)_{<1} = C_{<1} × C′_{<1}` and `KH` preserves finite products, so `E_KH(C × C′) ≃ E_KH(C) × E_KH(C′)` with rational rank `ℚ²`, one rank for each point of the spectrum; the zero ring gives `E_KH(0) = 0`. This is the sheaf condition for the analytic cover of `C × C′` by its two factors (Conventions).
- Uniformity is needed for the definition. Let `A` be the completion of `ℚ₂[T]` for the norm `|Σ_n a_n Tⁿ| = Σ_n |a_n|₂`. It is analytic (`2` is a topologically nilpotent unit) and every point of `M(A)` is nonarchimedean (`|2| = 1/2`), but `|2| = |2T| = 1/2` while `|2 + 2T| = 1`, so the elements of norm less than one are not closed under addition and `A_{<1}` is no ideal. Its uniform completion is the Tate algebra `ℚ₂⟨T⟩` with the Gauss norm, where `|2 + 2T| = 1/2` and `A_{<1} = 2ℤ₂⟨T⟩` is an ideal of `A_{≤1} = ℤ₂⟨T⟩`.
- An analytic cover that no clopen decomposition gives (Conventions). Let `C` be a nondiscrete algebraically closed nonarchimedean field, `ϖ ∈ C` with `0 < |ϖ| < 1` and `A = C⟨T⟩₁`. As `ϖ` is a unit, `(T, ϖ)` and `(ϖ, T)` generate the unit ideal; `A₁ = A⟨T/ϖ⟩` is the disc `{|T| ≤ |ϖ|}`, `A₂ = A⟨ϖ/T⟩` the annulus `{|ϖ| ≤ |T| ≤ 1}` and `A₁₂` the circle `{|T| = |ϖ|}`. The two closed subsets cover the connected space `M(A)` and neither is open. Test the two-member condition in degree zero on the arc-sheaf `Ḡ_m ⊗ ℚ` (§3.2), which satisfies it because analytic covers are arc-covers, writing `G = Ḡ_m(C) ⊗ ℚ`: the units of the two discs are constants times one-units and those of the annulus and of the circle are `c Tᵐ` times one-units, `m ∈ ℤ`, so the degree-zero values are `G` on `A` (a section on the disc has constant norm, §3.3) and on `A₁`, and `G ⊕ ℚ` on `A₂` and on `A₁₂`, the summand `ℚ` recording `m`. The difference map `G ⊕ (G ⊕ ℚ) → G ⊕ ℚ`, `(u, (v, m)) ↦ (v − u, m)`, has kernel `{(u, (u, 0))} ≅ G`, the value on `A`, and is onto, as the vanishing of `H¹(M(A), Ḡ_m ⊗ ℚ)` for the disc requires (§3.3).
- The unit ideal is needed. For `f = T` and `g = 0` on `A = C⟨T⟩₁`, `(T, 0)` is not the unit ideal; the locus `{|T| ≤ |0|}` is the single point `T = 0`, but the relation `g T₁ = f` becomes `T = 0` with `T₁` free, so the quotient is `C⟨T₁⟩` and its spectrum is a closed disc, not that point.
- The members must cover `M(A)`. `A⟨ϖ/T⟩` alone misses the point `T = 0` of `M(C⟨T⟩₁)`; as the uniform completion of `A⟨ϖ/T⟩ ⊗̂_A A⟨ϖ/T⟩` is `A⟨ϖ/T⟩`, the condition for this one-member family would be `F(A) = F(A⟨ϖ/T⟩)`, which fails for `F = Ḡ_m ⊗ ℚ` in degree zero (`G` against `G ⊕ ℚ`, the class of `T` being a unit only on the annulus). Likewise `A⟨T/ϖ⟩` alone misses the Gauss point, where `|T| = 1 > |ϖ|`.

Route: by finitarity and noetherian approximation assume `A_{≤1}` noetherian; relate analytic descent to descent along admissible blowups of formal models, which is descent for `KH` along abstract blowup squares (gap:kh-cdh-descent). Rationally use trace descent and Postnikov completeness as in §7.3; ball invariance and the replacement of `KH` by `K` on totally disconnected rings use `K`-regularity of valuation rings. An alternative route through pro-cdh descent of `K` followed by ball localization uses the same supplier sections.

*Needs:* §§1.1, 3.1 (`A_{<1}` on uniform rings), 6.1, 7.1 (for the comparison with `E_K`); the rational localizations and the analytic topology of the Conventions, with TropicalAndBerkovichArithmetic §0.16; GeneralAlgebraicKTheory §§10.10, 13.4; EnhancedDerivedSheaves §E2.4 and gap:compact-hausdorff-dimension; gap:kh-simplicial-model; gap:kh-excision; gap:kh-cdh-descent; gap:valuation-ring-k-regularity.

### 7.5 Motivic K-theory of smooth formal models

Prove: if `C` is a nondiscrete algebraically closed nonarchimedean field and `A` is a uniform Banach `C`-algebra such that `A_{≤1}` is the `π`-adic completion of a smooth `O_C`-algebra, then `Kmot(A) ⊗ ℚ ≃ cofib(K(A_{<1}) → K(A)) ⊗ ℚ`, naturally in `A`, through the map from `K(A)` (Scholze, Theorem 1.7(iv), p. 5; Proposition 8.8 and Theorem 8.13, pp. 47, 49–50). The hypothesis is on the ring of power-bounded elements itself; uniformity is the hypothesis under which §7.4 defines `E_KH(A)`. The roots required in §7.1 come from the algebraically closed field `C`.

Route: `M(A)` is a finite-dimensional compact space, so §7.4 applies; replace `KH` by `K` in each of `A_{≤1}`, `A_{≤1}/A_{<1}` (a smooth algebra over the residue field) and `A` (a regular noetherian ring, noetherian as a quotient of a Tate algebra `C⟨T₁, …, T_m⟩`, Tau Ceti `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`: by SchemeKTheoryOperations §5.2 applied to the regular noetherian rings `A[T₁, …, T_n]`, each map `K(A[T₁, …, T_n]) → K(A[T₁, …, T_{n+1}])` is an equivalence, so every structure map of the simplicial spectrum `K(A ⊗ ℤ[Δ^•])` defining `KH(A)` is an equivalence and `K(A) ≃ KH(A)`), and use Thomason–Trobaugh to compare the supported terms through completion.

**Checks.**

- For `A = C`, `A_{≤1} = O_C` is the completion of the smooth `O_C`-algebra `O_C`, and the formula is `Kmot(C) ⊗ ℚ = E_K(C) ⊗ ℚ`, the rational case of §7.6.
- For the closed unit ball `A = C⟨T⟩₁`, `A_{≤1} = O_C⟨T⟩`, and ball invariance gives `Kmot(C⟨T⟩₁) ⊗ ℚ = Kmot(C) ⊗ ℚ`.
- Taking the fibre instead of the cofibre of `K(A_{<1}) → K(A)` fails already for `A = C` on `π₀`: the cofibre has `π₀ = ℤ` (the rank), while the fibre has `π₀ = coker(K₁(C_{<1}) → K₁(C)) = C^×/(1 + C_{<1})`.

*Needs:* §§1.5, 7.4; SchemeKTheoryOperations §§3.8, 5.2; TropicalAndBerkovichArithmetic §0.17; Tau Ceti `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`; gaps kh-simplicial-model, kh-excision, kh-cdh-descent and valuation-ring-k-regularity.

### 7.6 Motivic K-theory on strict bases

Prove: fix a set `S` of primes. On nonarchimedean strictly totally disconnected Banach rings `A` with `|ℓ| ≥ 1` everywhere on `M(A)` for every prime `ℓ ∉ S`, the functor `A ↦ E_K(A)[1/S]` is a finitary ball-invariant arc-sheaf of spectra, hence equals `Kmot[1/S]`. In particular, for a nondiscrete algebraically closed nonarchimedean field `C` of residue-characteristic exponent `p`, `Kmot(C) ≃ E_K(C)[1/p]` (Scholze, Theorem 8.9 and proof, pp. 47–49; Theorem 1.7(iii), p. 5). In residue characteristic zero, `p = 1` and nothing is inverted.

Route: by §7.2 and continuity compare `E_Kcn` with the universal localized object. With torsion coefficients prime to the residue characteristics, `K(C_{<1}; ℤ/n) = 0` by henselian rigidity for `(O_C, C_{<1})`, so `E_K(C)/n = K(C; ℤ/n)`, which is invariant under extensions of algebraically closed fields; hence ball invariance by §2.4. Rationally use §7.3 where `|p| < 1` and §7.4 in equal characteristic zero. Combine rational and torsion statements and apply §1.1.

*Needs:* §§1.1, 4.8, 7.2, 7.3, 7.4; KTheoryFiniteLocalFields §2.1; gap:suslin-rigidity.

### 7.7 The integral E∞-structure on the field cofibre

Prove: for a nondiscrete algebraically closed nonarchimedean field `C`, `E_K(C)`, without inverting the residue characteristic, carries a natural E∞-`K(C)`-algebra structure (Scholze, Corollary 8.10 and proof, pp. 47–48; Remark 1.8, p. 5). The structure is not a formal consequence of `E_K(C)` being a cofibre.

Route: if the residue characteristic is zero, `E_K(C) = Kmot(C)` by §7.6. Otherwise, after inverting `p` use `Kmot(C)` again; after `p`-completion `K(O_C)^∧_p ≃ K(C)^∧_p`, so `E_K(C)^∧_p ≃ K(k)^∧_p`, which is `ℤ_p` because the positive K-groups of the perfect field `k` are uniquely `p`-divisible; `ℤ_p` has a unique E∞-`K(C)`-algebra structure. The overlap map `E_K(C)[1/p] → E_K(C)^∧_p[1/p] = ℚ_p` is the rank `K(C) → ℤ`, trivial on `K(C_{<1})`, followed by `ℤ → ℚ_p`, which is a map of E∞-algebras; glue by the arithmetic fracture square.

**Checks.**

- `π₀ E_K(C)` contains `ℤ` through the rank, and the gluing on `π₀` is `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p`.
- For `p = 2` the same argument applies; no odd-prime restriction is made.
- A ring structure given only on homotopy groups does not determine the gluing map as a map of E∞-algebras.

*Needs:* §7.6; KTheoryFiniteLocalFields §1.5 (unique `p`-divisibility of the positive K-groups of perfect `𝔽_p`-algebras); gap:padic-k-integers-oc; gap:einfty-fracture-square.

### Examples

For an algebraically closed nonarchimedean `C` with valuation ring `O_C` and residue field `k`, nonunital excision identifies `K(C_{<1})` with `fib(K(O_C) → K(k))`, so `E_K(C)` sits in the cofibre sequence `K(O_C) → K(C) ⊕ K(k) → E_K(C)`. If `k` has characteristic `p`, the `p`-completed equivalence `K(O_C)^∧_p ≃ K(C)^∧_p` cancels the first two terms after completion and leaves `E_K(C)^∧_p ≃ K(k)^∧_p ≃ ℤ_p`; away from `p`, `E_K(C)` is `Kmot(C)`. The arithmetic fracture square glues the two pieces along the rank map.

### Dependencies

Layers 1–6; RefinedTraceMethods §4.20; GeneralAlgebraicKTheory §§8.3, 8.10, 10.10, 13.4–13.5; SchemeKTheoryOperations §§3.1, 3.3, 3.8, 5.2; Tau Ceti `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`; KTheoryFiniteLocalFields §§1.5, 2.1; EnhancedDerivedSheaves §E2.4; PerfectoidSpaces §§P2.3, P2.7, P2.13; TropicalAndBerkovichArithmetic §§0.16, 0.17, 0.28, 0.30; AlgebraicKTheory §4.3; gaps valuation-ring-k-regularity, kh-simplicial-model, kh-excision, kh-cdh-descent, suslin-rigidity, padic-k-integers-oc, einfty-fracture-square, compact-hausdorff-dimension.

## Layer 8: Stable motives and six operations

This layer inverts the Tate twist, proves projective-line duality and the stable affine pushforward, and constructs the six-functor formalism on small arc-stacks, including stable tilting.

### 8.1 Stable motivic sheaves

For a small arc-stack `X` define `Dmot(X) = Deff_mot(X)[ℤ(1)^{⊗−1}]`, the presentably symmetric monoidal stable ∞-category obtained by universally inverting `ℤ(1)` (Scholze, Definition 9.1, p. 50; Definition 1.11, p. 6). Prove that it is the colimit of `− ⊗ ℤ(1)` in presentable ∞-categories and the limit of `Hom(ℤ(1), −)` in ∞-categories, so that an object is a sequence `(M_n)_{n≥0}` with `M_n ≃ Hom(ℤ(1), M_{n+1})`, and that `Deff_mot(X) → Dmot(X)`, `M ↦ (M(n))_n`, is fully faithful.

Prove the following API.

- For every presentably symmetric monoidal ∞-category `𝒟`, precomposition with `Deff_mot(X) → Dmot(X)` identifies the colimit-preserving symmetric monoidal functors `Dmot(X) → 𝒟` with the colimit-preserving symmetric monoidal functors `Deff_mot(X) → 𝒟` that send `ℤ(1)` to an invertible object (EnhancedDerivedSheaves §E5:presentability.2, `tensorInversion`).
- For all integers `m, n`, `ℤ(m) ⊗ ℤ(n) ≃ ℤ(m + n)`.
- The functor from effective motives is fully faithful and compatible with pullback.

**Checks.**

- At the complex point `ℤ(1)` is the unit, so stabilization does not change `D(ℤ)`.
- `ℤ(1) ⊗ ℤ(−1) ≃ ℤ`: in the sequence model `ℤ(−1)` has terms `M_n = ℤ(n − 1)` for `n ≥ 1` and `M₀ = Hom(ℤ(1), ℤ)`, and tensoring with `ℤ(1)` shifts the index, giving `(ℤ(n))_n`, the image of the unit.
- An effective `M` has `n`-th term `M(n)`, with bonding maps the cancellation equivalences `M(n) ≃ Hom(ℤ(1), M(n+1))`; bonding by `− ⊗ ℤ(1)` instead of `Hom(ℤ(1), −)` gives the wrong limit.

Route: coherent triviality of the cyclic permutation on `ℤ(1)^{⊗3}` (§5.3) makes the telescope formula of formal inversion apply; cancellation identifies effective `M` with `(M(n))_n`.

*Needs:* §§2.1, 3.4, 5.1, 5.3; EnhancedDerivedSheaves §E5:presentability.2 (`tensorInversion`, `presentableTensor`).

### 8.2 Projective-line duality

Prove: for `f : ℙ¹_X → X`, `f_♯ ≃ f_* ⊗ ℤ(1)[2]` as functors `Dmot(ℙ¹_X) → Dmot(X)`; consequently `f_*` satisfies the projection formula on `Dmot` (Scholze, Proposition 9.3 and proof, pp. 51–52). Before stabilization the projection formula for `f_*` fails (§3.3); the twist becomes invertible only in `Dmot`.

Route: construct the unit from the `G_m`-torsor of `O(Δ)` on `ℙ¹_X ×_X ℙ¹_X`, trivialized off the diagonal, which gives `Δ_* ℤ → ℤ(1)[2]`. Construct the counit from the reduced cohomology of `ℙ¹`. By ball invariance, applied to the two affine charts of `ℙ¹_X`, which meet in `G_m` (§5.4), the reduced free motive `cofib(ℤmot[∗] → ℤmot[ℙ¹]) = ℤ(1)[2]` is the reduced free motive `cofib(ℤmot[∗] → ℤmot[G_m]) = ℤ(1)[1]` of §3.4 shifted by `[1]`. So over every base the reduced cohomology of `ℙ¹` with coefficients `M` is that of `G_m` shifted by `[−1]`, namely `Hom(ℤ(1)[1], M)[−1] = Hom(ℤ(1)[2], M)`, and tensoring it with the invertible object `ℤ(1)[2]` returns `M`. The cofibre `ℤ(1)[1]` is `Ḡ_m` only on the nonarchimedean locus (§3.3); at the complex point it is `ℤ[1]`, and the reduced cohomologies of `ℙ¹` and of `G_m` with coefficients `ℤ` are `ℤ[−2]` and `ℤ[−1]`. Check the triangle identities on objects `j_! M` for the affine chart `j : A¹_X → ℙ¹_X` and on geometric fibres, reducing to the unit.

*Needs:* §§0.8 (`ℙ¹_X` and its charts), 1.6, 2.6, 2.7, 3.4, 5.4, 8.1.

### 8.3 Stable motivic tilting

Prove: if `|p| < 1` everywhere on `X`, tilting induces a symmetric monoidal equivalence `Dmot(X) ≃ Dmot(X♭)`, functorial in `X`, compatible with effective motives and carrying `ℤ(n)` to `ℤ(n)` for all integers `n` (Scholze, Proposition 9.7, pp. 52–53). Route: transport the description `ℤ(1) = Ḡ_m[−1]` through tilting, `C^×/(1 + C_{<1}) ≅ (C♭)^×/(1 + C♭_{<1})` at geometric points, and apply the universal property of tensor inversion to the equivalence of §4.9 and its inverse.

*Needs:* §§3.4, 4.9, 8.1.

### 8.4 The stable affine pushforward

Prove: for a map `f : Marc(B) → Marc(A)` of finite cohomological dimension such that `Marc(B)` embeds into a finite-dimensional closed ball over `Marc(A)`, the functor `f_*` on stable motives preserves all colimits, commutes with every base change and satisfies the projection formula; the same holds for maps that are arc-locally on the target of this form (Scholze, Theorem 9.2 and proof, pp. 50–51). The general proper case is §9.4.

Route: apply §1.7 levelwise in the sequence model of §8.1; reduce the projection formula to geometric points, then to a one-dimensional ball embedded in `ℙ¹`, and apply §8.2 and excision.

*Needs:* §§1.6, 1.7, 8.1, 8.2.

### 8.5 Six operations on small arc-stacks

Prove: the assignment `X ↦ Dmot(X)` extends to a six-functor formalism on small arc-stacks for the class of `!`-able maps produced by the extension theorem from the class `P_B` of maps of affine arc-sheaves generated under composition and base change by the maps `f : Marc(B) → Marc(A)` of finite cohomological dimension that, arc-locally on the target, embed `Marc(B)` into a finite-dimensional closed ball over the target (with `f_! = f_*` on `P_B`); §9.4 enlarges the class to all proper 0-truncated maps of locally finite cohomological dimension; open immersions are `!`-able with `j_!` left adjoint to `j^*`; étale maps, meaning finitary maps with finite geometric fibres (§2.7), are `!`-able and cohomologically étale; and every map of small arc-stacks that is smooth without boundary in the sense of §2.7 is cohomologically smooth, in particular, for a Banach field `K`, the arc-stack of a smooth `K`-scheme and, for nonarchimedean `K`, the arc-stack of a `K`-analytic space smooth in Berkovich's sense (§§0.8, 2.7) (Scholze, Propositions 9.4–9.5 and Corollary 9.6, p. 52, and the construction before them; §1, p. 6). Not every map is `!`-able, and smoothness requires the absence of boundary: the closed disc `f : Marc(C⟨T⟩₁) → Marc(C)` over a nonarchimedean geometric point is proper with `f_* ℤ = ℤ` by ball invariance, whereas a proper cohomologically smooth map of dimension one would have `f_* f^! ℤ = f_* ℤ(1)[2] = ℤ(1)[2]` equal to the dual `(f_* ℤ)^∨ = ℤ`, which fails since `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ`.

Route: apply the construction principle of AnalyticStacks §0.5 on the category of affine arc-sheaves `Marc(A)` with `I` the open immersions and `P = P_B`. The class `P_B` contains the identities and is stable under composition and base change by construction; it is right cancellative because for `g ∘ f ∈ P_B` with `g` in `P_B`, `f` is the graph `Y → Y ×_X Z`, a closed immersion into a ball of dimension zero, followed by the base change of `g ∘ f` along `g`; and `I ∩ P_B` consists of monomorphisms. Base change and projection formulas for `P_B` are those of §8.4 (with §1.6 for `I`), and both pass to composites. The construction cannot start from all affine maps of finite cohomological dimension, because §8.4 does not give their projection formula and the general proper projection formula of §9.4 is proved through §9.1, which uses this section (Corrections to the source, E7). Extend to small arc-stacks by §0.6 there, on the subcanonical site of small arc-stacks with the arc-topology. Compute `j_!` for `{|a| < 1}` as the colimit over the affine pieces `{|a| ≤ c}`, `c < 1`; reduce étale maps to finite fibres and open immersions, and smooth maps to affine space and `ℙ¹`-duality on charts.

**Checks.**

- The closed disc `Marc(C⟨T⟩₁) → Marc(C)` is the one-dimensional ball itself, of cohomological dimension at most `3` (§2.1), so it lies in `P_B`.
- For the profinite set `βℕ`, `Marc(Cont(βℕ, ℂ)) → Marc(ℂ)` has cohomological dimension `0`, but after any arc-cover of the target its geometric fibres are copies of `βℕ`, which is not metrizable and so embeds into no finite-dimensional closed complex ball. It is outside `P_B`; it becomes `!`-able in §9.4.
- The graph of a map of affine arc-sheaves over `X` lies in `P_B` with ball dimension `0` and cohomological dimension `0`; this is the input of right cancellation.

*Needs:* §§0.8, 1.4, 1.6, 2.7 (étale maps and maps smooth without boundary), 8.2, 8.4; AnalyticStacks §§0.4–0.6, 0.9–0.10; TropicalAndBerkovichArithmetic §§0.21–0.22.

### Examples

At the complex point `ℤ(1) = ℤ`, so `ℤmot[ℙ¹] = ℤ ⊕ ℤ[2]`, and `f_* ℤ = RΓ(ℙ¹, ℤ) = ℤ ⊕ ℤ[−2]`. Projective-line duality predicts `f_♯ ℤ ≃ f_* ℤ ⊗ ℤ(1)[2] = ℤ[2] ⊕ ℤ`, which agrees with the free motive of `ℙ¹` after reordering; the shift `[2]` and the twist are both fixed by this identity. In a nonarchimedean fibre `ℤ(1) = Ḡ_m[−1]`, so omitting the twist would fail the same computation after base change.

### Dependencies

Layers 0–5; EnhancedDerivedSheaves §E5:presentability.2; AnalyticStacks §§0.4–0.6, 0.9–0.10; TropicalAndBerkovichArithmetic §§0.21–0.22.

## Layer 9: Rigidity and mixed Tate sheaves

This layer proves compact generation at geometric points, the general proper projection formula, quasi-pro-étale monadicity, rigidity over analytic bases and weak categorical Künneth, and constructs the pointwise Artin–Tate subcategory with its descent and rigidity.

### 9.1 Compact generators at geometric points

Prove: for a nondiscrete algebraically closed Banach field `C`, `Dmot(C)` is compactly generated, its unit is compact, and its compact objects are exactly its dualizable objects; if `C` has equal characteristic and `k → C` splits its residue field `k`, the objects `ℤmot[X_C](−j)`, for `X` smooth projective over `k` and `j ≥ 0`, form a family of compact generators (Scholze, Proposition 10.1 and proof, p. 53; Theorem 1.12, p. 6). In particular `Dmot(C)` is rigid. The discrete algebraically closed case is §10.3. The description of generators needs equal characteristic and the splitting.

Route: by §8.3 reduce to equal characteristic. Pushforward along smooth proper maps preserves dualizables, and the unit is compact, so the displayed objects are compact. To show they generate, detect a vanishing object by induction on the topological transcendence degree of geometric field extensions: type 4 points reduce to balls, type 3 points to annuli and Tate twists, and the residually transcendental case to smooth finite-type models, compactified with normal-crossing boundary after an alteration, with trace descent and localization reducing the dimension. Torsion objects are detected by the unit (§4.8) before the rational induction. Alterations, not resolution of singularities, are used.

*Needs:* §§0.8, 2.5, 2.7 (free motives of `X_C`, smooth without boundary and proper of finite cohomological dimension), 3.5, 4.8, 8.3, 8.5; AdicCoefficientsAndComparisons Layer L5 (`smoothAlterationPair`); EnhancedDerivedSheaves §E5:presentability.4 (`IsRigid`); TropicalAndBerkovichArithmetic §§1.1–1.2.

### 9.2 Compact morphisms between free motives

Prove: if `X` is analytic affine of finite cohomological dimension, or satisfies the hypotheses of §9.6, and `U ⊂ V ⊂ Aⁿ_X` are open with `U → V` factoring through a quasi-compact subset, then `ℤmot[U] → ℤmot[V]` is a compact morphism in `Dmot(X)`; such maps and their negative Tate twists exhaust generators by compact morphisms, and tensor products of such compact morphisms are compact (Scholze, proof of Proposition 10.3, pp. 54–55). Compact morphism is the notion of EnhancedDerivedSheaves §E5:presentability.4, not compactness of source and target.

Route: the induced map of mapping functors factors through evaluation on the quasi-compact subset, which preserves filtered colimits by §1.7; exhaust each `V` by relatively compact `U`; when `|X|` is a point, `X = Marc(C)/G` for a profinite group `G` acting continuously on a geometric Banach point `C` (Scholze, proof of Proposition 10.3, p. 54), and one works with `G`-invariant open subsets of `Aⁿ_C`.

**Checks.**

- For `X = Marc(C)` and `U = {|T| < 1} ⊂ V = {|T| < 2}`, the inclusion factors through the closed disc `{|T| ≤ 1}` and is compact, although `ℤmot[U]` need not be compact over a general base.
- The identity of `ℤmot[{|T| < 1}]` does not factor through a quasi-compact subset of the open disc and is not of this form.
- Over two complex points the unit `(ℤ, ℤ)` is compact and its identity is a compact morphism.

*Needs:* §§1.7, 2.5; EnhancedDerivedSheaves §E5:presentability.4 (`IsCompactMorphism`, `dualizable_filteredColimit`).

### 9.3 Quasi-pro-étale monadicity

Prove: for a proper quasi-pro-étale map `f : Y → X` of small arc-stacks (§1.7), `f_*` induces `Dmot(Y) ≃ Mod_{f_* ℤ}(Dmot(X))`; and if `Y = lim_i Y_i` is a cofiltered limit of such maps, then `Dmot(Y) ≃ colim_i Dmot(Y_i)` in presentable stable ∞-categories (Scholze, Lemma 10.4, p. 55). No surjectivity is assumed; the conservative functor is `f_*`.

Route: the fibres are profinite sets, so `f` has cohomological dimension zero, `f_*` preserves colimits and satisfies the projection formula (§1.7), and global sections on profinite fibres detect objects of `Dmot(Y)`, so `f_*` is conservative; apply Barr–Beck–Lurie and identify the monad by projection; finitarity gives `f_* ℤ = colim_i f_{i*} ℤ`, and module base change gives the categorical colimit.

**Checks.**

- For `Y = ∅` the algebra `f_* ℤ` is zero and its module category is zero.
- For `Y = X ⨿ X` the algebra is `ℤ × ℤ` and `Mod_{ℤ×ℤ}(Dmot(X)) = Dmot(X) × Dmot(X)`.
- A statement with `f^*` as the conservative functor would require surjectivity of `f`.

*Needs:* §§0.6, 1.7, 8.1; EnhancedDerivedSheaves §E5:abstract.5 (`barrBeckLurie`) and §E5:presentability.2 (`categoricalModuleBaseChange`).

### 9.4 Proper pushforward after geometric rigidity

Prove: for every proper 0-truncated map `f` of small arc-stacks of locally finite cohomological dimension, `f_*` on `Dmot` preserves colimits, commutes with arbitrary base change and satisfies the projection formula; reapplying the extension theorem with this class of proper maps enlarges the class of `!`-able maps of §8.5 (Scholze, Corollary 10.2 and the following discussion, pp. 53–54).

Route: colimits and base change come from §1.7 in the sequence model; the projection formula is checked at geometric points, where by §9.1 the category is generated by dualizables, for which linearity is automatic.

*Needs:* §§1.7, 8.1, 8.5, 9.1; AnalyticStacks §§0.5–0.6.

### 9.5 Pointwise Artin–Tate motives

Define `DMT(X)` as the full subcategory of `Dmot(X)` of objects whose pullback to every geometric Banach point `Marc(C) → X` lies in the localizing subcategory generated by the `ℤ(n)`, `n ∈ ℤ` (closed under colimits, shifts and retracts) (Scholze, Definition 10.7, p. 56). At a general base this is not the localizing subcategory generated by Tate objects.

Prove the following API.

- Membership is tested at geometric points.
- Pullback preserves `DMT`.
- The unit, all `ℤ(n)` and tensor products of objects of `DMT(X)` lie in `DMT(X)`.

**Checks.**

- Every `ℤ(n)` lies in `DMT(X)`, for `n` positive, zero and negative.
- An object that becomes a sum of Tate objects after a finite étale cover lies in `DMT(X)` even if it is not globally a sum of Tate objects (an Artin motive).
- Pointwise and global Tate generation differ. At the complex point every `ℤ(n)` is the unit and `Dmot(ℂ) = D(ℤ)` (§8.1, Checks), generated by `ℤ`, so `DMT(ℂ) = Dmot(ℂ)`. Let `X = Marc(Cont([0,1], ℂ))`, whose geometric Banach points are all `ℂ` (§1.8, Checks), and `j : (0,1] → [0,1]`. The object `j_! ℤ` of `Deff_mot(X) ⊂ Dmot(X)` (§§1.6, 2.7 Checks, 8.1) has stalks `ℤ` and `0`, so it lies in `DMT(X)` and is nonzero. Every `ℤ(n)` over `X` is pulled back from the complex point, hence is the unit, and `Hom(ℤ, j_! ℤ[m]) = H^m([0,1], j_! ℤ) = H^m_c((0,1], ℤ) = 0` for every `m` (§1.3). The objects with no nonzero map to any shift of `j_! ℤ` form a localizing subcategory that contains every `ℤ(n)` but not `j_! ℤ`; so `j_! ℤ` is not in the localizing subcategory generated by the Tate objects, which a definition by global generation would take for `DMT(X)`.

*Needs:* §§2.7, 8.1, 9.1; EnhancedDerivedSheaves §E5:presentability.2.

### 9.6 Rigidity over analytic bases

Prove: if `A` is an analytic Banach ring and `Marc(A)` has finite cohomological dimension, then `Dmot(Marc(A))` is rigid in the sense of EnhancedDerivedSheaves §E5:presentability.4 (`IsRigid`: dualizable, compact unit, multiplication an internal left adjoint); more generally the same holds for a qcqs arc-sheaf `X` of finite cohomological dimension such that every point of `|X|` is the image of a quasi-pro-étale map `Marc(C(x)) → X` (§1.7) from a geometric Banach point (Scholze, Proposition 10.3 and proof, pp. 54–55; Theorem 1.12, p. 6). Compact generation is not asserted.

Route: compact-morphism exhaustions of generators (§9.2) give dualizability; finite cohomological dimension makes the unit compact. At a point `X = Marc(C)/G`, descend compact objects with their duals along finite-level profinite quotients by §9.3 and EnhancedDerivedSheaves §E5:presentability.4 (`dualizable_filteredColimit`: a filtered colimit of dualizable presentable stable categories along left adjoints whose right adjoints preserve colimits is dualizable, with compact objects the colimit of the compact objects); spread fibrewise dualizables to closed neighbourhoods and extend by zero from countable unions of closed neighbourhoods to obtain trace-class exhaustions; apply the rigidity criterion.

**Checks.**

- For `A = ℂ × ℂ` the category is `D(ℤ) × D(ℤ)`, rigid and compactly generated.
- For `A = Cont([0,1], ℂ)` the category is the left-completed derived category of sheaves on `[0,1]`: rigid, with compact unit `ℤ` (global sections on a compact space commute with filtered colimits), but not compactly generated, since its compact objects are its dualizable objects, the constant perfect complexes, and for `j : (0,1] → [0,1]` the nonzero object `j_! ℤ` has `RΓ([0,1], j_! ℤ) = RΓ_c((0,1], ℤ) = 0`, so it is orthogonal to all of them.
- Finite cohomological dimension is a hypothesis, not a consequence of compactness. For `A = Cont([0,1]^ℕ, ℂ)` the spectrum `M(A)` is the Hilbert cube and `Dfin(Marc(A), ℤ)` is the left-completed derived category of sheaves on it (§1.3). For each `n ≥ 1` let `i_n` be the inclusion of the closed subcube `[0,1]^n × {0}` and `j_n` that of the open cube `(0,1)^n` into this subcube; then `H^n([0,1]^ℕ, i_{n*} j_{n!} ℤ) = H^n_c((0,1)^n, ℤ) = ℤ ≠ 0`, so `d(Marc(A)) = ∞` and the statement does not apply. Repeating one finite-dimensional factor does not give such a base: the bounded product of countably many copies of `Cont(D, ℂ)`, `D` the closed unit disc, is `Cont(β(ℕ × D), ℂ)`, whose spectrum has covering dimension `dim(ℕ × D) = 2`.

*Needs:* §§1.6, 9.1, 9.2, 9.3; EnhancedDerivedSheaves §E5:presentability.4 (`dualizable_filteredColimit`, `IsTraceClass`, `IsRigid`); AlgebraicKTheory §4.3 (covering dimension, for the Checks).

### 9.7 Weak categorical Künneth

Prove: for `X → S ← Y` with `X`, `Y`, `S` qcqs and satisfying the hypotheses of §9.6, the exterior tensor product is a fully faithful functor `Dmot(X) ⊗_{Dmot(S)} Dmot(Y) → Dmot(X ×_S Y)` (Scholze, Corollary 10.6 and proof, pp. 55–56). Only full faithfulness is concluded.

Route: relative tensor products of rigid categories are rigid; full faithfulness reduces to the unit of the adjunction on tensor generators, pushed to `S`, which is the Künneth identity `f_* M ⊗ g_* N ≃ (f ×_S g)_*(M ⊠ N)` given by proper base change and projection (§9.4).

**Checks.**

- For `X = Y = S` the functor is the identity.
- For `X = Y = ℙ¹_S` both sides contain `ℤ ⊠ ℤ(1)[2]` and the map on the four Tate summands is an isomorphism.
- For `X = ∅` both sides are zero.

*Needs:* §§8.5, 9.4, 9.6; EnhancedDerivedSheaves §E5:presentability.2 (`presentableTensor`) and §E5:presentability.4.

### 9.8 Arc-descent and rigidity of Artin–Tate motives

Prove: `X ↦ DMT(X)` is an arc-sheaf of presentably symmetric monoidal stable ∞-categories; on strictly totally disconnected `X`, `DMT(X)` is generated under colimits by the `ℤ(n)`, `n ∈ ℤ`; and for `X` satisfying the hypotheses of §9.6, `DMT(X)` is rigid (Scholze, Propositions 10.8–10.10, pp. 56–57). Global Tate generation is asserted only on strict bases.

Route: for an extension `C′/C` of geometric points, a compact transition that factors through a mixed Tate object over `C′` descends to a finitely generated algebra of finite topological transcendence degree over `C`, which has a section, so the factorization exists over `C`. On strict bases the right adjoint of the Tate-generated inclusion preserves colimits and its counit is an equivalence on stalks. Repeat the compact and trace-class exhaustions inside `DMT`.

*Needs:* §§9.2, 9.5, 9.6; EnhancedDerivedSheaves §E5:presentability.4.

### Examples

Let `X` be the disjoint union of two complex points. Then `Dmot(X) = D(ℤ) × D(ℤ)`, with unit `(ℤ, ℤ)` and componentwise tensor product. The objects `(ℤ, 0)` and `(0, ℤ)`, extensions by zero from the clopen points, are compact dualizable generators, and each is a retract of the unit; so the pointwise mixed Tate condition gives `DMT(X) = Dmot(X)`. This checks Tate generation on a strict base and compactness of the unit for a finite product; relative rigidity over a general analytic base (§9.6) uses trace-class exhaustions and makes no compact-generation claim.

### Dependencies

Layers 0–8; AdicCoefficientsAndComparisons Layer L5; AnalyticStacks §§0.5–0.6; EnhancedDerivedSheaves §§E5:abstract.5, E5:presentability.2, E5:presentability.4; TropicalAndBerkovichArithmetic §§1.1–1.2; AlgebraicKTheory §4.3.

## Layer 10: Integral étale motives over a field

This layer constructs the presentable stable ∞-category of integral étale motives over a field, compares it with the étale motives with transfers, and, for an algebraically closed discrete field `k` with the trivial norm, proves compact generation of `Dmot(k)`, the rational and prime-to-`p` mapping formulas on both sides, and the equivalence of the two categories.

### 10.1 Integral étale motives over a field

For a field `k` define `DM_et(k, ℤ)` as the presentably symmetric monoidal `ℤ`-linear stable ∞-category generated by the motives `M(X)` of smooth finite-type `k`-schemes, with tensor product induced by products of schemes, obtained by imposing étale hyperdescent, that is by localizing at the étale hypercovers of smooth `k`-schemes (their terms are coproducts of representable presheaves, so the empty covering of the empty scheme and the covering of `X ⊔ Y` by `X` and `Y` make `M(∅) = 0` and `M(X ⊔ Y) = M(X) ⊕ M(Y)`), then `A¹`-invariance (`M(X × A¹) → M(X)` an equivalence), then inverting the reduced motive of `G_m` shifted by `[−1]`, the Tate object `ℤ(1)` (Scholze, Remark 11.2, p. 57). The presentation is transfer-free; it is not the triangulated category of geometric Nisnevich motives of MotivesAndAlgebraicCycles §4.11. Scholze's remark speaks of étale descent without naming the class of covers; the hypercover localization is the one underlying the étale motivic categories on which §10.2 rests: complexes of étale sheaves with transfers, whose locality for the étale topology is descent along étale hypercovers (Cisinski–Déglise, Definition 2.2.2 and Proposition 2.2.3, p. 25), and étale motivic spectra, built from étale hypersheaves of spectra on smooth schemes (Bachmann, §5, p. 13). No comparison with the localization at Čech nerves of étale covers alone is asserted.

Prove the following API.

- For every presentably symmetric monoidal `ℤ`-linear stable ∞-category `𝒟`, restriction along `X ↦ M(X)` identifies the colimit-preserving symmetric monoidal `ℤ`-linear functors `DM_et(k, ℤ) → 𝒟` with the symmetric monoidal functors `F` from smooth finite-type `k`-schemes, with the product, to `𝒟` that send finite disjoint unions to direct sums (the empty scheme to `0`), send every étale hypercover `U_• → X` by smooth finite-type `k`-schemes to a colimit diagram, send every projection `X × A¹ → X` to an equivalence, and send `cofib(F(Spec k) → F(G_m))`, formed along the unit section, to an invertible object.
- `ℤ(1)` is invertible, and `ℤ(1)[1]` is the reduced motive of `G_m`, as in §3.4.
- An extension of fields `k → k′` induces a symmetric monoidal pullback, coherently.

**Checks.**

- `M(A¹_k)` is the unit.
- `M(ℙ¹_k) = ℤ ⊕ ℤ(1)[2]`.
- In characteristic `p > 0`, the Artin–Schreier sequence `0 → ℤ/p → G_a → G_a → 0` is étale exact and `G_a = A¹` is contractible, so `ℤ/p = 0` and `p` is invertible in `DM_et(k, ℤ)`; prime-to-`p` torsion is retained. A Nisnevich category has nonzero `p`-torsion (for example `Hom(ℤ, ℤ/p(1)[1]) = k^×/p ≠ 0` for imperfect `k`), so it cannot replace this category.

Route: start from enhanced presheaves of complexes on smooth `k`-schemes, localize at étale hypercovers and `A¹`-projections (an accessible symmetric monoidal localization), then invert `ℤ(1)`.

*Needs:* EnhancedDerivedSheaves §E1.3, §E2.6 (étale hypercovers), §E3.2, §E5:abstract.3 and §E5:presentability.2 (`tensorInversion`); MotivesAndAlgebraicCycles §4.1 (smooth schemes and finite correspondences, for the comparison in §10.2).

### 10.2 Étale motives with and without transfers

Let `DM_et^tr(k, ℤ)` be the category obtained by the same construction from étale sheaves with transfers on smooth `k`-schemes, built on the finite correspondences and transfer presheaves of MotivesAndAlgebraicCycles §§4.1–4.2 with the étale topology in place of the Nisnevich topology. Prove, for an algebraically closed field `k` of exponent `p`:

- the functor `DM_et(k, ℤ) → DM_et^tr(k, ℤ)` adding transfers is an equivalence;
- for `n` invertible in `k`, `DM_et^tr(k, ℤ/n) ≃ D(ℤ/n)`, with `ℤ/n(1) ≃ μ_n` (rigidity with transfers);
- for `n` invertible in `k`, the functor `D(ℤ/n) ≃ D(k_et, ℤ/n) → DM_et(k, ℤ/n)` sending an étale sheaf of `ℤ/n`-modules to the transfer-free motive it defines is a symmetric monoidal equivalence, and `ℤ/n(1) ≃ μ_n` already in `DM_et(k, ℤ/n)` (transfer-free rigidity); this includes even `n` when `p` is odd;
- `DM_et(k, ℤ)` is `ℤ[1/p]`-linear;
- rationally `DM_et^tr(k, ℚ)` agrees with the Nisnevich category `DM(k, ℚ)` of MotivesAndAlgebraicCycles §§4.6, 4.11, so that for smooth `X` the rational maps `Hom(M(X), ℚ(j)[m])` are the motivic cohomology groups `H^m(X, ℚ(j)) = CH^j(X, 2j − m)_ℚ`.

(Cisinski–Déglise, Proposition 2.2.10, p. 27 (rational Nisnevich–étale comparison with transfers), Theorem 4.5.2, p. 41 (rigidity with transfers), Corollary 4.5.3, p. 41 (`p`-torsion), Corollary 5.5.5, p. 55 (étale with transfers versus h-motives), Corollary 5.5.7, p. 56 (transfer-free versus h-motives, in characteristic zero or with 2 invertible in the coefficients), Remark 5.5.8, p. 57 (why that hypothesis is imposed), Theorem 5.2.2, p. 44 (rational comparison with Beilinson motives); Bachmann, Theorems 6.5 and 6.6, pp. 16–17, and Theorem 7.1, p. 17 (transfer-free rigidity for `ℓ`-completed étale motivic spectra over a locally `ℓ`-étale finite base on which `ℓ` is invertible, for every prime `ℓ`, `ℓ = 2` included), with Lemma 3.10, p. 10 (`Ẑ_ℓ(1) ∧ Hℤ/ℓ^a ≃ μ_{ℓ^a}`).)

Prove the following API.

- Adding transfers is a colimit-preserving symmetric monoidal functor `DM_et(k, ℤ) → DM_et^tr(k, ℤ)` sending `M(X)` to the motive with transfers of `X` and `ℤ(1)` to `ℤ(1)`.
- For `n` invertible in `k`, étale sheaves of `ℤ/n`-modules carry canonical transfers, giving a symmetric monoidal functor `D(k_et, ℤ/n) → DM_et^tr(k, ℤ/n)`.
- Rationalization commutes with adding transfers and with the comparison to Nisnevich motives.

Route: for the first item, both `DM_et(k, ℤ/n)` and `DM_et^tr(k, ℤ/n)`, `n` invertible in `k`, are `D(ℤ/n)` through the constant étale sheaves, by transfer-free rigidity and rigidity with transfers, compatibly with adding transfers; with `ℤ/p` coefficients both sides vanish (§10.1 and Cisinski–Déglise Corollary 4.5.3); rationally the first item is Cisinski–Déglise Corollary 5.5.7 with coefficients `ℚ`, in which `2` is invertible, combined with Corollary 5.5.5. Both categories are compactly generated by the motives of smooth `k`-schemes and adding transfers preserves these generators, so a functor that is an equivalence rationally and modulo every prime is an equivalence. Neither rigidity statement uses §§10.3–10.6.

Transfer-free rigidity with `2 | n` in odd characteristic is outside Cisinski–Déglise Corollary 5.5.7, whose proof uses Ayoub's separation property, accepted there only in characteristic zero or with `2` invertible in the coefficients (Cisinski–Déglise, Remark 5.5.8, p. 57). It is proved through étale motivic spectra, uniformly in the prime. The construction of §10.1 localizes at étale hypercovers and `A¹`-projections and then inverts `ℤ(1)`, so `DM_et(k, ℤ)` is the `ℤ`-linearization of the étale motivic stable homotopy category `SH_et(k)`, and for `n = ℓ^a` the category `DM_et(k, ℤ/n)` is the category of `Hℤ/n`-modules in the `ℓ`-completion `SH_et(k)^∧_ℓ`, all of whose objects are `ℓ`-complete. Bachmann's theorem gives a symmetric monoidal equivalence `SH((Spec k)^∧_et)^∧_ℓ ≃ SH_et(k)^∧_ℓ`, since `ℓ` is invertible in `k` and `Spec k` is `ℓ`-étale finite (EtaleCohomologyFoundations §F.3.0 bounds the cohomological dimension of finite-type `k`-schemes with coefficients invertible in `k` by twice their dimension). For algebraically closed `k` the left side is the category of `ℓ`-complete spectra, whose `Hℤ/n`-modules form `D(ℤ/n)`, and the reduced motive `ℤ/n(1)[1]` of `G_m` corresponds to `Ẑ_ℓ(1)[1] ∧ Hℤ/n ≃ μ_n[1]`. The proof has three inputs, all part of this target: an invertible Tate spectrum `Ẑ_ℓ(1)` built on the pro-étale site with `G_m ≃ Ẑ_ℓ(1)[1]`, whose proof over a separably closed field uses that `−1` is a square, which holds for `ℓ = 2`, and rigidity with transfers modulo `ℓ` (Bachmann, Lemmas 6.3–6.4 and Theorem 6.5, pp. 16–17); full faithfulness, from homotopy invariance and proper base change of étale hypersheaves with coefficients invertible on the base (Bachmann, Corollaries 4.3, 4.4 and 6.2, pp. 11–15; EtaleCohomologyFoundations §§F.2.1, F.2.3); and essential surjectivity, from the generation of `SH_et(k)` by the objects `q_* 1_T ∧ G_m^{∧m}` for projective `q : T → Spec k` and `m ∈ ℤ`, together with commutation of the comparison with `q_*`, because both sides satisfy proper base change, the motivic side by the localization property of the étale motivic categories of finite-type `k`-schemes (Bachmann, Theorem 5.1, p. 13, and proof of Theorem 6.6, p. 17).

The rational comparison with Nisnevich motives uses that rational étale and Nisnevich sheaves with transfers agree, so that they have the same `A¹`-local objects (Cisinski–Déglise, Proposition 2.2.10, p. 27: for a `ℚ`-algebra of coefficients the comparison functors from Nisnevich to étale sheaves and motives with transfers, effective and stable, are equivalences), and the higher-Chow identification of MotivesAndAlgebraicCycles §§4.15–4.18.

**Checks.**

- For `X = Spec k` and `j = 1`, `Hom(ℤ, ℚ(1)[1]) = k^× ⊗ ℚ = CH¹(k, 1)_ℚ`, which is `0` for `k = 𝔽̄_p` (all units are roots of unity) and nonzero for `k = ℂ`.
- With `ℤ/ℓ` coefficients, `Hom(ℤ, ℤ/ℓ(1)) = μ_ℓ(k) ≅ ℤ/ℓ` for `ℓ ≠ p`.
- With `ℤ/p` coefficients in characteristic `p` every Hom group is zero.
- For `k = 𝔽̄₃` and `n = 2` neither hypothesis of Cisinski–Déglise Corollary 5.5.7 holds (characteristic `3`; `2` is not invertible in `ℤ/2`), while `1/2 ∈ k` and `−1 = i²` with `i ∈ 𝔽₉`. Transfer-free rigidity gives `Hom(ℤ/2, ℤ/2(1)) = μ₂(k) = {±1} ≅ ℤ/2` and `Hom(ℤ/2, ℤ/2(1)[1]) = k^×/k^{×2} = 0` in `DM_et(k, ℤ/2)`.
- For `X = G_{m,k}`, `p` odd and `n = 2`, `M(G_m) = ℤ ⊕ ℤ(1)[1]` and `ℤ/2(1) ≃ μ₂` give `Map(M(G_m), ℤ/2) = ℤ/2 ⊕ ℤ/2[−1]`, which is `RΓ_et(G_{m,k}, ℤ/2)`: `H⁰ = ℤ/2` and `H¹ = ℤ/2`, generated by the Kummer torsor of a square root of the coordinate.
- Transfer-free rigidity needs `n` invertible in `k`: for `k = 𝔽̄₃` and `n = 3`, `DM_et(k, ℤ/3) = 0` (§10.1) while `D(ℤ/3) ≠ 0`, and already homotopy invariance fails on the étale side, since `H¹_et(A¹_k, ℤ/3) = coker(x ↦ x³ − x on k[t])` contains the class of `t` (a polynomial `x` with `x³ − x = t` would have degree `1/3`), whereas `H¹_et(Spec k, ℤ/3) = 0`.

*Needs:* §10.1; MotivesAndAlgebraicCycles §§4.1–4.6, 4.9, 4.11, 4.15–4.18; EnhancedDerivedSheaves §§E3.2, E5:abstract.3; EtaleCohomologyFoundations §F.2.1 (proper base change), §F.2.3 (local acyclicity of smooth maps, for homotopy invariance) and §F.3.0 (the étale cohomological dimension bound).

### 10.3 Generators over a discrete algebraically closed field

Prove: for an algebraically closed field `k` with the trivial norm, `Dmot(k)` is generated by the compact dualizable objects `ℤmot[X](−j)`, `X` smooth projective over `k`, `j ∈ ℤ`; the unit is compact, so compact and dualizable objects agree (Scholze, Theorem 11.1 and proof, pp. 57–58). The trivial norm makes `k` non-analytic, so §9.1 does not apply directly. The twists range over all integers.

Route: let `K = k((T))` with `|T| = 1/2` and `f : Marc(K) → Marc(k)`. Annulus continuity (§3.5) identifies `f_* ℤ` with `g_* ℤ` for `g : G_{m,k} → Marc(k)`, through the pullback `g_* ℤ → f_* ℤ` along the map `Marc(K) → G_{m,k}` given by `T`, and `f_* ℤ ≃ ℤ ⊕ ℤ(−1)[−1]`, which is dualizable. Its dual represents `M ↦ Hom(1_K, f^* M)` on `M ∈ Dmot(k)`: `Hom((f_* 1_K)^∨, M) ≃ Hom(1_k, M ⊗ f_* 1_K) ≃ Hom(1_k, f_* f^* M) ≃ Hom(1_K, f^* M)`, by dualizability, the projection formula of §8.4 (`Marc(K)` is the closed subset `{|T| = 1/2}` of the closed unit ball over `Marc(k)`, and `f` has finite cohomological dimension) and the adjunction `f^* ⊣ f_*`. So `f_♯` exists on the unit with `f_♯ ℤ = (f_* ℤ)^∨ ≃ ℤ ⊕ ℤ(1)[1]` compact, and `ℤ` is a compact retract of it. The functor `M ↦ Hom(1, f_* M)` has domain `Dmot(K)` and is not represented by an object of `Dmot(k)`. By §9.1 over the completed algebraic closure of `K`, descended through finite extensions of `K` (again Laurent-series fields over `k`) together with Artin motives, `f_♯` exists in general; as `f^*` is conservative, the objects `f_♯ f^* ℤmot[X](−j) = ℤmot[X](−j) ⊗ f_♯ ℤ` generate, and the splitting of `f_♯ ℤ` gives the claim.

*Needs:* §§2.6, 2.7, 3.5, 8.1, 8.4, 9.1, 9.4.

### 10.4 Mapping formulas for algebraic étale motives

Prove: for an algebraically closed field `k` of exponent `p`, a smooth projective `X/k` and `j ∈ ℤ`, `Map_{DM_et(k,ℤ)}(M(X)(−j), ℤ)_ℚ ≃ K(X)_ℚ^{(j)}[−2j]`, that is `π_i = K_{i+2j}(X)_ℚ^{(j)}`; and after completion away from `p`, the mapping spectrum is `RΓ_proet(X, ℤ̂_{p′}(j))`, the pro-étale cohomology with coefficients in the prime-to-`p` Tate module twisted `j` times (Cisinski–Déglise, Theorem 5.2.2, p. 44, formula `Hom(ℚ_X, ℚ_X(j)[q]) = Gr^j_γ K_{2j−q}(X)_ℚ`; Theorem 4.5.2, p. 41; Scholze, Remark 11.2, p. 57). The objects `M(X)(−j)` are compact dualizable generators of `DM_et(k, ℤ)`.

Route: the rational formula is §10.2 combined with MotivicEtaleKTheory §2.2, which identifies `CH^j(X, n)_ℚ` with the Adams-weight-`j` summand of `K_n(X)_ℚ`; the completed formula is §10.2 rigidity and passage to the limit over `n` prime to `p`. Generation uses étale hyperdescent, rigidity and rational alteration traces; the degrees of alterations are inverted only rationally.

**Checks.**

- For `X = ℙ¹_k` and `j = 1`, `π_{−2} = K₀(ℙ¹_k)_ℚ^{(1)} = ℚ` (the class of `O(1) − O`), while `π₀ = K₂(ℙ¹_k)_ℚ^{(1)} = H⁰(ℙ¹_k, ℚ(1)) = 0`; an unshifted K-theory spectrum would put the Picard class in `π₀`.
- For `X = Spec k`, `j = 0`, `π₀ = K₀(k)_ℚ = ℚ`.

*Needs:* §§10.1–10.2; MotivicEtaleKTheory §2.2; SchemeKTheoryOperations §6.8 (Adams weights on regular schemes); AdicCoefficientsAndComparisons Layer L5; EnhancedDerivedSheaves §§E2.2–E2.3 (derived completion and limits).

### 10.5 Motivic mapping formulas over a discrete field

Prove: for an algebraically closed field `k` with the trivial norm, smooth projective `X/k` and `j ∈ ℤ`, `Map_{Dmot(k)}(ℤmot[X](−j), ℤ)_ℚ ≃ K(X)_ℚ^{(j)}[−2j]`, so `π_i = K_{i+2j}(X)_ℚ^{(j)}`; and after profinite completion away from `p`, the mapping spectrum is `RΓ_proet(X, ℤ̂_{p′}(j))` (Scholze, Theorem 11.1 and proof, pp. 57–58). Scholze states the rational formula without the shift `[−2j]`; the shift is forced by §6.3 and by Cisinski–Déglise Theorem 5.2.2 (Corrections to the source, E6).

Route: let `C` be the completed algebraic closure of `k((T))`. By §7.5, `Kmot(X_C)_ℚ = cofib(K(X^m_C) → K(X_C))_ℚ`, with `K(X^m_C) = fib(K(X_{O_C}) → K(X))`, which is the cofibre of `K(X_{O_C} on X)_ℚ → K(X)_ℚ`. The supported term is computed at finite level. A finite extension `K′ ⊂ C` of `k((T))` has residue field `k`, because `k` is algebraically closed, so it is totally ramified; its valuation ring `O′` is a complete discrete valuation ring with coefficient field `k`, hence `O′ = k[[u]]` for a uniformizer `u`. The scheme `X_{O′} = X ×_k Spec O′` is smooth over `O′`, hence regular, and its special fibre `i′ : X ↪ X_{O′}` is the principal divisor `{u = 0}`, whose conormal bundle `(u)/(u²)` is trivial. So `i′_*` is an equivalence `K(X) ≃ K(X_{O′} on X)` (SchemeKTheoryOperations §3.5: dévissage on a regular noetherian scheme with regular support), and it raises Adams weights by one (SchemeKTheoryOperations §6.11 in codimension one). For finite extensions `K′ ⊂ K″` of degree `e`, write `O″ = k[[v]]`; then `O″/(u) = k[[v]]/(v^e)`, the powers of `v` filter the pullback of `i′_* F` with `e` graded pieces each isomorphic to `i″_* F`, and so flat pullback `K(X_{O′} on X) → K(X_{O″} on X)` becomes multiplication by `e` on `K(X)` (GeneralAlgebraicKTheory §4.3, additivity), an isomorphism after `⊗ ℚ`. Let `O^∪` be the union of the rings `O′`, the valuation ring of the algebraic closure of `k((T))` in `C`. Supported K-theory commutes with the filtered colimit `O^∪ = colim O′` (SchemeKTheoryOperations §2.7) and is unchanged by the `T`-adic completion `O^∪ → O_C`, which is flat and an isomorphism modulo `T` (SchemeKTheoryOperations §§3.4, 3.8). Hence `K(X_{O_C} on X)_ℚ ≃ K(X)_ℚ`, where the weight-`j` summand of `K(X)_ℚ` lands in weight `j + 1`. Compare this shifted copy with the summand `ℤ(1)[1]` of `f_♯ ℤ = ℤ ⊕ ℤ(1)[1]` (§10.3) one weight at a time, starting from weight zero. The torsion formula follows from §4.8 and inverse limits over finite coefficients.

**Checks.**

- For `X = Spec k`, `i′_*` sends `[k] ∈ K₀(k) = ℤ` to the class of `O′/(u)` in `K₀(O′ on (u)) = ℤ`, and this class has Adams weight one; so `π₀ K(X_{O_C} on X)_ℚ = ℚ` sits in weight one, the weight of the summand `ℤ(1)[1]`. A comparison without the weight shift would put it in weight zero, beside the unit.
- For `e = 2`, `O″/(u) = k[[v]]/(v²)` has length `2`, so the transition map is multiplication by `2` on `K₀(k) = ℤ`: injective but not surjective, an isomorphism only after `⊗ ℚ`. This is why the supported term is identified only rationally.
- For `X = Spec k` the map `K(O′ on (u)) → K(O′) → K(k)` is zero on homotopy groups: the class of `O′/(u)` restricts to `[k] − [k] = 0` through the resolution of `O′/(u)` by multiplication by `u`, and the same holds after multiplying by `K_*(k)`. So the rational cofibre is `K(k)_ℚ ⊕ K(k)_ℚ[1]`, the second copy reweighted, and its weight-one part has `π₁ = K₁(k)_ℚ ⊕ K₀(k)_ℚ = (k^× ⊗ ℚ) ⊕ ℚ`. This is `Ḡ_m(C) ⊗ ℚ`, the `π₁` of `ℚ(1)[2]` at `C` (§3.2: the residue units `k^×` and the value group `|C^×| ≅ ℚ`).

*Needs:* §§2.7, 3.2, 4.8, 6.3, 7.5, 10.3; SchemeKTheoryOperations §§2.7, 3.4, 3.5, 3.8, 6.8, 6.11; GeneralAlgebraicKTheory §4.3; EnhancedDerivedSheaves §§E2.2–E2.3.

### 10.6 Berkovich and algebraic étale motives

Prove: for an algebraically closed field `k` with the trivial norm, the symmetric monoidal functor `DM_et(k, ℤ) → Dmot(k)` sending the motive `M(X)` of a smooth `k`-scheme `X` to the free motive `ℤmot[X^arc]` of its arc-stack (§§0.8, 2.7) is an equivalence, carrying `ℤ(1)` to `ℤ(1)` (Scholze, Remark 11.2 and Theorem 11.1, pp. 57–58; Proposition 1.13, p. 7). A comparison over non-closed fields is not asserted.

Route: the Berkovich functor `X ↦ ℤmot[X^arc]` satisfies étale hyperdescent. The functor `Y ↦ Y^arc` preserves finite limits (§0.8), so it carries the matching objects of an étale hypercover to those of its image, and it carries a surjective étale morphism `Z′ → Z` to an epimorphism of arc-sheaves: given a strict ring `B` and `Spec B → Z`, every residue field `K(x)`, `x ∈ M(B)`, is algebraically closed (§0.4), so the nonempty étale fibre over `Spec K(x)` has a `K(x)`-point; `K(x)` is the completed filtered colimit of the strict factors `B_U` over the clopen neighbourhoods `U` of `x`, so finitarity of `Z′^arc → Z^arc` (§2.7(a)) lifts the point over some `B_U`, and compactness of `M(B)` gives a lift over the factors of a finite clopen partition. So an étale hypercover goes to a hypercover of arc-sheaves, which becomes an equivalence after hypercompletion; the objects of `Deff_mot(k)` are hypercomplete arc-sheaves (§§1.2, 2.1), so for every `N ∈ Deff_mot(k)` the sections `Γ(X^arc, N)` are the limit of the sections over the terms of the hypercover, and by corepresentability (§2.7) `ℤmot[X^arc]` is the colimit of the free motives of those terms. Together with `A¹`-invariance and `G_m`-stability, the functor factors through `DM_et(k, ℤ)` by §10.1. Both sides are generated by the compact dualizable objects attached to smooth projective `X` and `j ∈ ℤ` (§§10.3, 10.4); on these the maps agree rationally (§§10.4, 10.5) and after completion away from `p`, and `p` is invertible on both sides (§§4.8, 10.2); a map of spectra that is an equivalence rationally and modulo every prime is an equivalence, which gives full faithfulness, and generation gives essential surjectivity.

**Checks.**

- `ℤmot[ℙ¹_k] = ℤ ⊕ ℤ(1)[2]` on both sides.
- For `k = 𝔽̄_p`, `Map(ℤ(−j), ℤ)_ℚ` is `ℚ[0]` for `j = 0` and `0` otherwise on both sides, because `K(𝔽̄_p)_ℚ = ℚ[0]`.
- With coefficients `ℤ/ℓ`, `ℓ ≠ p`, both sides are `D(ℤ/ℓ)`.

*Needs:* §§0.4 (residue fields of strict rings), 0.8, 1.2 (hypercompleteness), 2.1, 2.7, 4.8, 10.1–10.5; EnhancedDerivedSheaves §§E2.6–E2.7 (hypercovers and hypercomplete sheaves of spaces).

### Examples

Put `k = 𝔽̄_p` with the trivial norm and `X = Spec k`. Filtered continuity from finite fields gives `K(k)_ℚ = ℚ[0]` (GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §1.6). The rational mapping formula gives `Map(ℤ(−j), ℤ)_ℚ = ℚ[0]` for `j = 0` and `0` for `j ≠ 0`. After completion away from `p`, the same mapping spectra are `ℤ̂_{p′}(j)`, with the Tate twist retained. The rational and finite-coefficient sectors behave differently, and the integral comparison uses both. The projective line, `ℤ ⊕ ℤ(1)[2]` on both sides, fixes the common Tate normalization.

### Dependencies

Layers 0–9; MotivesAndAlgebraicCycles §§4.1–4.6, 4.9, 4.11, 4.15–4.18; MotivicEtaleKTheory §2.2; SchemeKTheoryOperations §§2.7, 3.4, 3.5, 3.8, 6.8, 6.11; GeneralAlgebraicKTheory §§4.3, 13.8c; KTheoryFiniteLocalFields §1.6; AdicCoefficientsAndComparisons Layer L5; EtaleCohomologyFoundations §§F.2.1, F.2.3, F.3.0; EnhancedDerivedSheaves §§E1.3, E2.2–E2.3, E2.6–E2.7, E3.2, E5:abstract.3, E5:presentability.2.

## Layer 11: Nearby cycles and motivic monodromy

This layer constructs the motivic nearby-cycle functor, proves it descendable, and over `k = 𝔽̄_p` constructs the motivic Galois stacks `MG_k` and `MG_C`, identifies their quasi-coherent categories with mixed Tate motives, and proves the monodromy description of `Dmot(C)`.

### 11.1 Motivic nearby cycles

Let `k` be algebraically closed with the trivial norm, `C` the completed algebraic closure of `k((T))` with `|T| = 1/2`, and `f : Marc(C) → Marc(k)`. Choose a topologically nilpotent unit `π ∈ C` and compatible roots `π^{1/n}` for all `n` prime to the residue-characteristic exponent `p`; they give a map `h : Marc(C) → G̃_{m,k} = lim_{x ↦ x^n} G_{m,k}`. With `g : G̃_{m,k} → Marc(k)`, so that `f = g ∘ h`, the unit `ℤ → h_* ℤ` induces the pullback map `g_* ℤ → g_* h_* ℤ = f_* ℤ` of E∞-algebras in `Dmot(k)`; prove that it is an equivalence. By §§9.1, 10.3 and Barr–Beck–Lurie, `Dmot(C) ≃ Mod_{f_* ℤ}(Dmot(k))`. Define the augmentation `f_* ℤ → ℤ` as the inverse of the equivalence `g_* ℤ → f_* ℤ` followed by `g_* ℤ → ℤ`, evaluation at the point `1 ∈ G̃_{m,k}` (pullback along the unit section `e : Marc(k) → G̃_{m,k}`, `g ∘ e = id`), and the *motivic nearby-cycle functor* `Ψ : Dmot(C) → Dmot(k)` as extension of scalars along it (Scholze, Definition 11.3 and the construction before it, pp. 58–59; Theorem 1.14, p. 7; Corrections to the source, E8). `Ψ` depends on the chosen roots; in characteristic zero `p = 1` and all roots are used.

Prove the following API.

- Under `Dmot(C) ≃ Mod_{f_* ℤ}(Dmot(k))`, `Ψ` is `− ⊗_{f_* ℤ} ℤ`, symmetric monoidal and colimit-preserving.
- `Ψ` preserves the unit and all Tate twists.
- For `X` smooth projective over `k`, `Ψ(ℤmot[X_C]) ≃ ℤmot[X]`.

**Checks.**

- `Ψ(ℤ) = ℤ`.
- `Ψ(ℤ(n)) = ℤ(n)` for all integers `n`.
- For the good-reduction projective line, `Ψ(ℤmot[ℙ¹_C]) ≃ ℤ ⊕ ℤ(1)[2]`, the summands induced by the unit section and the reduced class of `ℙ¹`.
- The comparison map runs from `g_* ℤ` to `f_* ℤ`. For `h` the inclusion of the first of two points over `k`, `g_* ℤ = ℤ²`, `f_* ℤ = ℤ`, and the map induced by the unit is `(a, b) ↦ a`; no map `ℤ → ℤ²` is induced. So the augmentation of `f_* ℤ` exists only through the inverse of the proved equivalence, not as a map induced by `h`.

Route: both `f_* ℤ` and `g_* ℤ` receive the unit with cofibre `ℚ(−1)[−1]` (finite levels and annulus limits), and the pullback `g_* ℤ → f_* ℤ` is compatible with these units, so it induces an endomorphism of `ℚ(−1)[−1]`. Such an endomorphism is multiplication by a rational number, as `End(ℚ(−1)) = K₀(k)_ℚ^{(0)} = ℚ` (§10.5); comparison with a finite level, the map `Marc(C) → G_{m,k}` given by the unit `π^{1/n}`, shows that it is nonzero, hence an isomorphism.

*Needs:* §§0.8 (the pro-torus `G̃_{m,k}` as a limit of arc-stacks of tori), 2.7, 3.5, 8.1, 9.4, 10.3, 10.5; EnhancedDerivedSheaves §E5:abstract.5 (`barrBeckLurie`) and §E5:presentability.2 (`categoricalModuleBaseChange`).

### 11.2 Descendability of nearby cycles

Prove: the augmentation `f_* ℤ → ℤ` defining `Ψ` is descendable; hence `Ψ` is conservative (Scholze, Proposition 11.4 and proof, p. 59). Route: the fibre of `g_* ℤ → ℤ` is `ℚ(−1)[−1]`, and its `g_* ℤ`-module structure factors through `ℤ` (rationally, compare with the free E∞-algebra on `ℚ(−1)[−1]`); the two-step filtration by modules inflated from `ℤ` puts `g_* ℤ` in the thick tensor ideal generated by `ℤ`. The module factorization, not only the cofibre computation, is needed.

*Needs:* §§6.3, 11.1; EnhancedDerivedSheaves Layer E5:descent (`IsDescendable`).

### 11.3 The residue-field motivic Galois stack

Let `k = 𝔽̄_p`. Define `MG_k` over `ℤ[1/p]` as the stack whose points over a `ℤ[1/p]`-algebra `S` are the lines `L` over `S` together with compatible equivalences `L ⊗^L ℤ/n ≃ μ_n(k) ⊗_ℤ S` for all `n` prime to `p`. Prove that `MG_k ≃ B G_m^rat`, where `G_m^rat = Spec H` with `H = ℚ[t, t⁻¹] ×_ℚ ℤ[1/p]`, the fibre product of `ℚ[t, t⁻¹] → ℚ`, `t ↦ 1`, and `ℤ[1/p] → ℚ`; and that `Dqc(MG_k)` is compactly generated by the powers `L^n`, `n ∈ ℤ` (Scholze, construction before Proposition 11.6, pp. 59–60). The ring is a fibre product, not a product; compatibility includes the transition maps between different `n`.

Prove the following API.

- The tautological line `L` carries the coherent reductions modulo every `n` prime to `p`.
- The rational fibre of `MG_k` is `BG_m` over `ℚ`, every fibre over `𝔽_ℓ`, `ℓ ≠ p`, is a point, and the fibre over `𝔽_p` is empty.
- All `L^n`, `n ∈ ℤ`, are compact dualizable generators of `Dqc(MG_k)`.

**Checks.**

- Rationally the `L^n` are the distinct characters `t^n` of `G_m`.
- Modulo `ℓ ≠ p` the coordinate ring is `𝔽_ℓ`: the augmentation ideal `(t − 1)ℚ[t^{±1}]` is a `ℚ`-vector space, killed by `− ⊗ 𝔽_ℓ`; so the stack is a point and the category is `D(𝔽_ℓ)`, with `L` the line `μ_ℓ(k)`.
- The stack lies over `ℤ[1/p]`; it has no `p`-torsion Tate sector, in accordance with §4.8.
- The coordinate ring `H = ℚ[t^{±1}] ×_ℚ ℤ[1/p]` is torsion-free, hence flat over `ℤ[1/p]`, and its augmentation ideal `(t − 1)ℚ[t^{±1}]` is isomorphic, through division by `t − 1`, to `H ⊗_{ℤ[1/p]} ℚ = ℚ[t^{±1}]`, flat over `H`; so the counit `H → ℤ[1/p]` has Tor amplitude in `[−1, 0]`, as AnalyticStacks §1.5 requires.

Route: construct the moduli functor in derived quasi-coherent stacks and identify it with the classifying stack; check fibres over `ℚ` and `𝔽_ℓ`; compact generation by the line powers is checked on these fibres, with pushforward preserving colimits.

*Needs:* §9.5; AnalyticStacks §§1.1–1.5.

### 11.4 Mixed Tate motives over `𝔽̄_p` and over `C`

Prove: for `k = 𝔽̄_p` and `C` as in §11.1, `Dqc(MG_k) ≃ DMT(k)`, sending `L` to `ℤ(1)`; `DMT(C) ⊗_{DMT(k)} Dmot(k) ≃ Dmot(C)`; and the t-structures on `DMT(k)` and `DMT(C)` generated by the Tate twists in degree zero make `Ψ` conservative and t-exact (Scholze, Propositions 11.5–11.8, pp. 59–60). The t-structure is on the mixed Tate subcategories only; no motivic t-structure on `Dmot(k)` is asserted.

Route: `K(𝔽̄_p)_ℚ = ℚ[0]` (Proposition 11.5) gives the rational maps between Tate twists, and §10.5 with finite coefficients the torsion maps; compare with maps between powers of `L` rationally and modulo `n`. The algebra `f_* ℤ` lies in `DMT(k)`, and module base change gives the tensor identity. Cover `MG_k` by `Spec ℤ[1/p]`; the augmentation of the free E∞-algebra on `ℚ[−1]` is coconnectively faithfully flat, that is, base change along it carries coconnective modules to coconnective modules and detects whether a coconnective module is zero (Scholze, proof of Proposition 11.8, p. 60); together with §11.2 this gives t-exactness.

**Checks.**

- Maps between different rational Tate weights vanish: `Hom(ℚ(i), ℚ(j)[m]) = K_{2(j−i)−m}(𝔽̄_p)_ℚ^{(j−i)} = 0` unless `i = j` and `m = 0`.
- With `ℤ/ℓ` coefficients, `Hom(ℤ/ℓ, ℤ/ℓ(1)) = μ_ℓ ≠ 0`, matching the trivialization of `L` modulo `ℓ`.
- The statement concerns `DMT`, and is not a description of all motives over `𝔽̄_p`.
- At a geometric point `DMT(C)` is the localizing Tate subcategory, not all of `Dmot(C)`; a definition of `DMT` (§9.5) as all of `Dmot` is wrong. Let `C` be the completed algebraic closure of `𝔽̄_p((T))` and `E` an elliptic curve over `𝔽̄_p`. If `ℤmot[E_C]` were in `DMT(C)`, then `Ψ(ℤmot[E_C]) = ℤmot[E]` would lie in `DMT(𝔽̄_p)` (§11.1), so `ℚmot[E] ≅ ⊕ ℚ(i)[m]^{n_{i,m}}` with `n_{i,m} = dim Hom(ℚ(i)[m], ℚmot[E]) = dim Hom(ℚmot[E], ℚ(i)[m])`, since rational Tate objects over `𝔽̄_p` are mutually orthogonal (first Check). The dual of `ℚmot[E]` is `ℚmot[E](−1)[−2]` (§§2.7, 8.2, 8.5: `E^arc` is smooth without boundary and proper of finite cohomological dimension over the Banach field `𝔽̄_p`, so `ℤmot[E] = f_* ℤ(1)[2]` is the dual of `f_* ℤ`), so `Hom(ℚ(i)[m], ℚmot[E]) = Hom(ℚmot[E], ℚ(1−i)[2−m])`, and §10.5 identifies the two dimensions with those of `K_{m−2i}(E)^{(1−i)}_ℚ` and of `K_{2i−m}(E)^{(i)}_ℚ`. The negative K-groups of the regular scheme `E` vanish (SchemeKTheoryOperations §2.6), so `n_{i,m} = 0` unless `m = 2i`, and `n_{i,2i} = dim CH^i(E)_ℚ` (MotivicEtaleKTheory §2.2) is `1` for `i = 0`, `1` for `i = 1` (`Pic⁰(E)(𝔽̄_p) = E(𝔽̄_p)` is torsion) and `0` otherwise. Hence `ℚmot[E] ≅ ℚ ⊕ ℚ(1)[2]` and `End(ℚmot[E]) = ℚ × ℚ` has dimension `2`. But `End(ℚmot[E]) = Hom(ℚmot[E] ⊗ ℚmot[E](−1)[−2], ℚ) = Hom(ℚmot[E × E], ℚ(1)[2]) = CH¹(E × E)_ℚ` (`ℚmot[E × E] = ℚmot[E] ⊗ ℚmot[E]` by §§10.1, 10.6, then §10.5 and MotivicEtaleKTheory §2.2), and the classes of `E × {0}`, `{0} × E` and the diagonal are linearly independent there: each has self-intersection `0` by the adjunction formula, as `K_{E × E} = 0` and each curve has genus one, and any two meet transversally in the single point `(0, 0)`, so their intersection matrix has rows `(0, 1, 1)`, `(1, 0, 1)`, `(1, 1, 0)` and determinant `2` (Vakil, Exercise 20.2.A, the bilinear intersection form (20.2.4.1) and Exercise 20.2.B(a), pp. 580–582). So `dim End(ℚmot[E]) ≥ 3`, a contradiction; thus `ℤmot[E_C] ∉ DMT(C)`.

*Needs:* §§9.8, 10.5, 11.2, 11.3; GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §1.6; AnalyticStacks §§1.1–1.5; EnhancedDerivedSheaves §E5:presentability.2; for the Checks, §§2.7, 8.2, 8.5, 10.1, 10.6, 11.1, SchemeKTheoryOperations §2.6 and MotivicEtaleKTheory §2.2.

### 11.5 The valued-field motivic Galois gerbe

For `k = 𝔽̄_p` and `C` as above define `MG_C` over `MG_k` by adjoining a map `(C^×/(1 + C_{<1}))[−1] → L` whose reductions modulo every `n` prime to `p` are the given Kummer identifications; equivalently, over a `ℤ[1/p]`-algebra `S`, `MG_C` classifies extensions `L → L̃ → (C^×/(1 + C_{<1})) ⊗ S` with prescribed restriction to the reduced integral units (Scholze, definition of `MG_C` and computation, pp. 60–61). Prove that `h : MG_C → MG_k` is a gerbe banded by `Hom(ℚ, L)`, with `h_* O` having `O` in degree 0 and `L^∨ ⊗ ℚ` in degree 1. The value group `C^×/O_C^×` is identified with `ℚ` through the normalization `|T| = 1/2`, and the restriction to `O_C^×/(1 + C_{<1}) = k^×` is the sequence `L → L ⊗ ℚ → L ⊗ ℚ/ℤ[1/p]`.

Prove the following API.

- `S`-points of `MG_C` are the displayed extensions with compatible restriction to the integral units.
- The band of `h` is `Hom(ℚ, L)`.
- Compatible roots of `π` give a section of `h`, by splitting the reduced units into value group and integral units.

**Checks.**

- The quotient of reduced units by reduced integral units is `C^×/O_C^× ≅ ℚ` (the value group of an algebraically closed field), not `ℤ`.
- Modulo `n` prime to `p` the gerbe retains the Kummer identifications; a gerbe defined only rationally loses them.
- A compatible system of roots neutralizes the gerbe; the section depends on the roots, the gerbe does not.

Route: construct the extension moduli with all finite-coefficient compatibilities; the quotient by integral reduced units gives the value group `ℚ` and the band; compute quasi-coherent cohomology through the coordinate ring of the unipotent band, keeping the extension class. After trivializing `L` this ring is the subring `ℤ[1/p] ⊕ tℚ[t]` of `ℚ[t]` generated over `ℤ[1/p]` by all `t/n`, with integral constant term and rational augmentation ideal; its cobar complex is `ℤ[1/p]` in degree `0` and agrees with the cobar complex of the rational additive group in positive degrees, so the cohomology is `O` in degree `0` and the rational primitives `L^∨ ⊗ ℚ` in degree `1`, not a rationalization of `O`.

*Needs:* §§3.1, 3.2, 11.3; AnalyticStacks §§1.1–1.5.

### 11.6 Locally nilpotent monodromy pairs

Over `Dmot(k)`, `k = 𝔽̄_p`, write `R = ℤ[1/p]` for the base of the stacks of §§11.3–11.5 and define the category of *monodromy pairs* as the category of representations of the unipotent band `Hom(ℚ, ℤ(1))`, the band of the gerbe of §11.5 neutralized by a section, in the comodule model of AnalyticStacks §1.5. Prove that it is equivalent to the category of pairs `(A, N)` with `A ∈ Dmot(k)` and `N : A → A ⊗ ℚ(−1)` locally nilpotent: `A` is the filtered union of subobjects on which a finite iterate of `N` vanishes, with the coherent structure carried by the comodule (Scholze, discussion after Theorem 11.9, pp. 61–62). This identification of representations of the band with operators is owned here (AnalyticStacks assigns it to this roadmap).

Prove the following API.

- The forgetful functor sends a representation to its underlying object, and the coaction to the twisted operator `N`.
- Morphisms are equivariant maps, with their higher coherences, and commute with `N`.
- On tensor products `N_{A⊗B} = N_A ⊗ 1 + 1 ⊗ N_B`.

**Checks.**

- Every `A` with trivial action gives `(A, 0)`.
- The standard two-step unipotent representation has `N ≠ 0` and `N² = 0`; the category is not the category of objects with zero operator.
- After a rational trivialization of the twist, a nonzero scalar operator on a one-dimensional object has every iterate nonzero and is excluded.
- Underlying objects stay integral. For `k = 𝔽̄₃`, so `R = ℤ[1/3]`, the object `A = ℤ/2` with trivial action has `A ⊗ ℚ = 0`: every positive-degree term of its coaction lands in `A ⊗ ℚ t^d = 0`, the coaction is the identity into the constant term, and the pair is `(ℤ/2, 0)`, not `0`. A model that rationalizes the underlying objects sends it to `0` and contradicts the integral equivalence of §11.8.
- The coordinate ring `R ⊕ tℚ[t]` of the band is torsion-free, hence flat over `R`, and its augmentation ideal `tℚ[t]`, isomorphic through multiplication by `t` to `ℚ[t] = (R ⊕ tℚ[t]) ⊗ ℚ`, is flat over it; so the counit has Tor amplitude in `[−1, 0]`, as the comodule model of AnalyticStacks §1.5 requires.

Route: neutralize the gerbe with compatible roots; identify its quasi-coherent category with comodules over the Hopf algebra of the band (AnalyticStacks §1.5). After trivializing the line, the band `Hom(ℚ, L) = lim_n L`, the limit along multiplication by the positive integers, has coordinate ring the colimit of the rings `R[x_n]` along `x_n ↦ m x_{nm}`, that is the subring `R ⊕ tℚ[t]` of `ℚ[t]` generated over `R = ℤ[1/p]` by all `t/n`: its constant term is integral and its augmentation ideal `tℚ[t]` is rational, with `t` primitive. A comodule keeps its integral underlying object `A`: the counit law makes the constant term of the coaction the identity of `A`; its degree-one term is the operator `N : A → A ⊗ ℚ(−1)`; coassociativity makes the degree-`d` term `N^d/d!`, which lives in the rational positive-degree terms only; and the condition that the coaction lands in the tensor product with `R ⊕ tℚ[t]`, whose elements are finite sums, is local nilpotence. The identification keeps the comodule's higher coherences, is made finite stage by finite stage, and includes unbounded derived objects.

*Needs:* §§8.1, 11.5; AnalyticStacks §§1.1–1.5; EnhancedDerivedSheaves §E5:presentability.2.

### 11.7 The Galois-stack description of motives over `C`

Prove: for `k = 𝔽̄_p` and `C` as above, `Dqc(MG_C) ≃ DMT(C)` and `Dmot(C) ≃ Dmot(k) ⊗_{Dqc(MG_k)} Dqc(MG_C)`, as `Dqc(MG_k)`-linear symmetric monoidal equivalences (Scholze, Theorem 11.9 and proof, p. 61). Route: the reduced-unit Tate class gives a map of augmented E∞-algebras `h_* O → f_* ℤ`; both have the unit and a rational degree-one summand, and the induced degree-one map is the identity of the value group `ℚ`, not merely a nonzero scalar; the module descriptions and §11.4 give the first equivalence and module base change the second. An isomorphism of underlying two-term complexes without algebra compatibility does not suffice.

*Needs:* §§11.1, 11.4, 11.5; EnhancedDerivedSheaves §E5:presentability.2.

### 11.8 Nearby cycles and the monodromy equivalence

Prove: for `k = 𝔽̄_p` and `C` the completed algebraic closure of `k((T))`, a pseudouniformizer `π` with compatible roots `π^{1/n}`, `n` prime to `p`, gives a symmetric monoidal equivalence `Dmot(C) ≃ {(A, N) : A ∈ Dmot(k), N : A → A ⊗ ℚ(−1) locally nilpotent}` under which `Ψ` is the forgetful functor; with rational coefficients the choice of `π` alone suffices (Scholze, Corollary 11.10 and proof, pp. 61–62; Theorem 1.14, p. 7). The statement is relative over `Dmot(k)`; it is stated over `𝔽̄_p`, and other residue fields need the base-change argument following Proposition 11.4.

Route: the roots give a section of the gerbe of §11.5; combine the neutral representation description (§11.6) with §11.7, and identify extension of scalars along the section with the forgetful functor, which is `Ψ`. Rationally the ordinary `G_m`-tower already has the needed cohomology and `π` alone defines the augmentation.

**Checks.**

- The Tate objects have zero monodromy.
- The good-reduction projective line has zero monodromy and `Ψ(ℤmot[ℙ¹_C]) = ℤ ⊕ ℤ(1)[2]`.
- A nonzero locally nilpotent `N` occurs: the two-step object of §11.6 corresponds to a motive over `C` that is not pulled back from `k`.

*Needs:* §§11.2, 11.4, 11.6, 11.7.

### Examples

Over `k = 𝔽̄_p` take the rational object `A = ℚ ⊕ ℚ(1)` and let `N : A → A ⊗ ℚ(−1) = ℚ(−1) ⊕ ℚ` send the first summand by the identity to `ℚ(1) ⊗ ℚ(−1) = ℚ` and kill the second. Then `N ≠ 0` and `N² = 0`, since the image of `N` lies in the twist of the second summand, which `N` kills. The associated two-step unipotent coaction is `1 + tN`, with the parameter carrying the dual twist; under §11.8 it is a motive over `C` whose nearby cycles are `A`. By contrast a nonzero scalar on a one-dimensional rational object, after trivializing the twist, has all iterates nonzero and is excluded.

### Dependencies

Layers 0–10; AnalyticStacks §§1.1–1.5; EnhancedDerivedSheaves §§E5:abstract.5, E5:presentability.2, E5:descent; GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §1.6; SchemeKTheoryOperations §2.6 and MotivicEtaleKTheory §2.2 (the negative control of §11.4).

## Layer 12: The v-stack and overconvergent comparison

This layer compares perfect characteristic-`p` Banach arc-stacks with partially proper v-stacks, describes canonical compactification, identifies prime-to-`p` torsion motives with overconvergent étale sheaves, and exhibits the torsion motivic category of a finite-dimensional spatial diamond as a retract of a compactly generated category.

### 12.1 Normed arc-stacks and partially proper v-stacks

On perfect analytic Banach `𝔽_p`-algebras with a chosen norm, construct `a^* : vStack/N → arcStack` and its fully faithful right adjoint `b^* : arcStack → vStack/N`, where `N` is the v-stack torsor of positive real rescalings of norms: explicitly `(b^* Y)(R, R⁺) = Y(R)`, and `a^* X` is the sheafification of `R ↦ X(R, R°)` (Scholze, Proposition 12.1 and Corollary 12.2, pp. 62–63). In this layer a v-stack `X` over `N` is called *partially proper* when restriction `X(R, R⁺) → X(R, R°)` is an equivalence for every perfectoid Huber pair `(R, R⁺)` over `N`, that is with a chosen norm on `R`; this is the class of Scholze, Corollary 12.2, p. 63. Prove that the essential image of `b^*` consists of the partially proper v-stacks over `N`, and that for `X` separated over `N`, `b^* a^* X` is the canonical compactification of `X → N` (DiamondEtaleCohomology §C4.13). The supplier's notion is narrower. Because `N(R, R⁺) = N(R, R°)`, a lifting square for `X → N` in the sense of DiamondEtaleCohomology §C4.5 is the same as a point of `X(R, R°)`, and separatedness of `X → N` makes `X(R, R⁺) → X(R, R°)` injective; so for `X` separated over `N`, `X` is partially proper here exactly when `X → N` is partially proper in the sense of §C4.5. That notion contains separatedness, and the Checks exhibit a member of the essential image that is not separated.

Prove the following API.

- `a^*` is left adjoint to `b^*`, and `b^*` is fully faithful.
- The essential image of `b^*` is the class of v-stacks over `N` whose values do not depend on `R⁺`; its members `X` with `X → N` separated are exactly those for which `X → N` is partially proper in the sense of DiamondEtaleCohomology §C4.5.
- For `X` separated over `N`, the unit `X → b^* a^* X` is the canonical compactification of `X → N`.

**Checks.**

- `b^* Y` takes the same value on `(R, R⁺)` and `(R, R°)`.
- With a chosen norm the target is `vStack/N`; without changing the test category it is not all v-stacks.
- For the classifying stack `B(ℤ/2)` of the constant group of order two (§1.5, Checks), `(b^* B(ℤ/2))(R, R⁺)` is the groupoid of `ℤ/2`-torsors on `Marc(R)` whatever `R⁺` is, so `b^* B(ℤ/2)` lies in the essential image. It is not `0`-truncated: for `R ≠ 0` the trivial torsor has the automorphism given by the nonzero element of `ℤ/2`. Hence it is not separated over `N` and not partially proper in the sense of DiamondEtaleCohomology §C4.5, and a description of the essential image by that notion alone would exclude it.
- Partial properness involves the base field. A v-stack `X` over the point is tested through `X × N`, which is partially proper exactly when `X(R, R⁺) → X(R, R°)` is an equivalence for all perfectoid Huber pairs. Let `C` be the completed algebraic closure of `𝔽_p((t))`; its residue field is `𝔽̄_p`, so every element of `O_C` is a root of unity or zero plus an element of `C_{<1}`. An open integrally closed `R⁺ ⊂ R°` contains `R°°` and every element of `R` integral over `𝔽_p`, hence the image of `O_C` under every continuous map `C → R`. So `Spa(C, O_C)` and the open unit disc `{|T| < 1}` over it (a union of closed discs of radius `< 1`, whose `(R, R⁺)`-points have `T ∈ R°° ⊂ R⁺`) are partially proper in both senses and unchanged by `b^* a^*`. The perfectoid closed unit disc `Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)` is separated and not partially proper: `b^* a^*` replaces `O_C⟨T^{1/p^∞}⟩` by `O_C + C⟨T^{1/p^∞}⟩°°`, which is the integral closure of `𝔽_p + C⟨T^{1/p^∞}⟩°°`. Only at the Gauss point does the image of the ring of integral elements in the residue field `𝔽̄_p(T^{1/p^∞})` shrink, from `𝔽̄_p[T^{1/p^∞}]` to `𝔽̄_p`, so exactly one point is added: the rank-two specialization of the Gauss point at which `|T|` exceeds `1` infinitesimally, the point at infinity of the projective line over `𝔽̄_p`.
- Over a perfectoid field `K` whose residue field is not algebraic over `𝔽_p`, already `Spa(K, O_K)` is not partially proper. Take for `K` the completed perfection of `𝔽_p(x)((t))`, with residue field `k` the perfection of `𝔽_p(x)`, and let `K⁺ ⊊ O_K` be the preimage of the valuation ring of the `x`-adic valuation of `k`. The identity of `K` is a `(K, O_K)`-point of `Spa(K, O_K)` with no extension to a `(K, K⁺)`-point, since `O_K ⊄ K⁺`; and `b^* a^*` replaces `Spa(K, O_K)` by `Spa(K, 𝔽_p + K°°)`, where `𝔽_p + K°°` is its own integral closure because `𝔽_p` is algebraically closed in `k`. The open unit disc over `Spa(K, O_K)` is partially proper over `Spa(K, O_K)` in the sense of DiamondEtaleCohomology §C4.5 (a lifting square already supplies `K → R` with `O_K` landing in `R⁺`, and the condition `T ∈ R°°` does not involve `R⁺`) but not over `N`: its point over `(K, O_K)` given by the identity and `T = 0` does not extend over `(K, K⁺)`.

Route: on rings use the forgetful functor from Huber pairs and its adjoints `R ↦ (R, R°)` and `R ↦ (R, R⁺_min)`, where `R⁺_min` is the integral closure of `𝔽_p + R°°`; check compatibility with finite limits and covers, then compute unit and counit.

*Needs:* §0.2; DiamondsAndVStacks §§D0.23, D2.7, D4.7, D4.9, D6.1, D6.3; DiamondEtaleCohomology §C4.5 (partially proper maps) and §§C4.13–C4.14 (the canonical compactification).

### 12.2 Norm-free Tate arc-stacks

Define `arcStack′` on perfectoid Tate `𝔽_p`-algebras without a chosen norm, with covers given by surjectivity on rank-one points, and functors `a′^* : vStack → arcStack′` and `b′^* : arcStack′ → vStack` as in §12.1; equivalently use Huber pairs with the topology generated by surjectivity on rank-one points, in which `Spa(R, R°) → Spa(R, R⁺)` is a cover, so the choice of `R⁺` disappears after sheafification (Scholze, discussion after Corollary 12.2, p. 63). After choosing a norm on a base, the relative category agrees with §12.1. Consequently the categories `Dfin(Y, Λ)`, `Det(Y, Λ)`, `Deff_mot(Y, Λ)` and `Dmot(Y, Λ)` (Conventions; §§1.2, 1.8, 2.1, 8.1) are defined for every `Y ∈ arcStack′`: over a base `R` with a chosen norm they are those of the slice of §12.1, two norms on `R` give equivalent slices because both agree with the norm-free slice, and for general `Y` they are the limits of these categories over the bases mapping to `Y`, by arc-descent (Scholze, discussion after Corollary 12.2, p. 63).

Prove the following API.

- Covers are tested by surjectivity on rank-one points.
- `Spa(R, R°) → Spa(R, R⁺)` is a cover for every ring of integral elements `R⁺`.
- Over a base with a chosen norm, the relative construction agrees with §12.1.

**Checks.**

- For `R⁺ = R°` the cover `Spa(R, R°) → Spa(R, R⁺)` is the identity.
- Replacing `R⁺` by a smaller ring of integral elements changes the adic spectrum but not its sheafification.
- Higher-rank points are ignored for covering purposes, so this is not the v-topology: `Spa(C, O_C) → Spa(C, C⁺)` for a higher-rank `C⁺` is a cover here but not a v-cover.

*Needs:* §§0.2, 1.2, 1.8, 2.1, 8.1, 12.1; DiamondsAndVStacks §§D2.7, D6.1, D6.3.

### 12.3 Torsion motives as overconvergent étale sheaves

Prove: for a small v-stack `X` of characteristic `p`, `Y = a′^* X` and `n` prime to `p`, there is a fully faithful functor `Dmot(Y, ℤ/n) ≃ Det(Y, ℤ/n) → D_ét(X, ℤ/n)` whose essential image consists of the overconvergent objects, those whose stalk at every geometric point `Spa(C, C⁺)` maps isomorphically, by the specialization map, to the stalk at its rank-one generization `Spa(C, O_C)`; it is compatible with pullback, tensor product and pushforward along proper maps of finite cohomological dimension (Scholze, Proposition 12.3 and proof, p. 63). Here `Dmot(Y, ℤ/n)` and `Det(Y, ℤ/n)` are the categories of the arc-stack `Y` (Conventions; §§1.8, 12.2), and `D_ét(X, ℤ/n)` is the étale derived ∞-category of the small v-stack `X`, with its presentable enhancement (DiamondEtaleCohomology §§C2.2, C2.12). All statements use `n` prime to `p`.

Route: reduce by descent to strictly totally disconnected `X`; there the étale topos is sheaves on `|X|`, each connected component is `Spa(C, C⁺)`, and overconvergent sheaves are those pulled back from the profinite set of connected components, which is `Y`; pass from bounded-below to unbounded objects by the strict-base comparison; check the functor compatibilities on the basis and descend. The equivalence `Dmot(Y, ℤ/n) ≃ Det(Y, ℤ/n)` comes from §4.8: `n` is prime to `p`, so `|n| = 1` everywhere on `Y` and `Deff_mot(Y, ℤ/n) = Det(Y, ℤ/n)`; there `ℤ/n(1) = Ḡ_m[−1] ⊗^L ℤ/n ≃ μ_n` (§§1.8, 3.4), which is arc-locally isomorphic to `ℤ/n` and hence already invertible, so the stabilization of §8.1 changes nothing.

**Checks.**

- The constant sheaf `ℤ/n` is overconvergent: its specialization maps are identities.
- The extension by zero from the rank-one point `Spa(C, O_C)` into `Spa(C, C⁺)` of higher rank has stalk `0` at the closed point and `ℤ/n` at the generization; its specialization map `0 → ℤ/n` is not an isomorphism for `n > 1`, so it is not overconvergent.
- For `n = 1` every object is zero and the statement is empty.

*Needs:* §§1.8, 3.4, 4.8, 8.1, 9.4, 12.2; DiamondsAndVStacks §D1.4 (connected components of strictly totally disconnected perfectoid spaces); DiamondEtaleCohomology §§C0.19, C0.24, C2.2, C2.12.

### 12.4 The spatial-diamond retract

Prove: if `X` is a spatial diamond of finite cohomological dimension and `n` is prime to `p`, the fully faithful functor `Det(Y, ℤ/n) → D_ét(X, ℤ/n)` of §12.3 has a colimit-preserving right adjoint, and `D_ét(X, ℤ/n)` is compactly generated; hence `Det(Y, ℤ/n)` is a retract, in presentable categories, of a compactly generated category (Scholze, Proposition 12.4 and proof, pp. 63–64). Compact generation of `Det(Y, ℤ/n)` itself is not asserted.

Route: a generating compact morphism `ℤmot[U] → ℤmot[V]` attached to a strict inclusion of domains (§9.2) becomes a map that factors through `f_! f^! ℤ/n` for a quasi-compact smooth diamond `f : W → X`, which is compact in `D_ét(X, ℤ/n)`; so the inclusion preserves compact morphisms, and its right adjoint preserves colimits; compact generation of the ambient category gives the retract.

**Checks.**

- For the full inclusion `I` and its right adjoint `R`, `R ∘ I ≃ id` exhibits the retract.
- If `X` is a point `Spa(C, O_C)`, `Y = X` and the retract is the identity of `D(ℤ/n)`.
- A retract of a compactly generated category is dualizable, and the statement stops there.

*Needs:* §§9.2, 12.3; DiamondEtaleCohomology §C9.8 (compact generation); DiamondSixOperations §S2.4 (`Rf_!`, base change, projection) and §§S4.2–S4.3 (cohomologically smooth maps and the dualizing complex); EnhancedDerivedSheaves §E5:presentability.4 (`IsCompactMorphism`, `IsDualizablePresentable`).

### Examples

Fix `n` prime to `p` and a geometric Huber pair `(C, C⁺)` with generic rank-one point `(C, O_C)`. The constant complex `ℤ/n` has the identity as specialization map and is overconvergent; a complex whose specialization map is `0 → ℤ/n` is not, since `n > 1`. Replacing `C⁺` by `O_C` changes the test pair but not the value of an object coming from the arc side. For a finite-dimensional spatial diamond the full inclusion and its right adjoint compose to the identity on the arc side, which gives the categorical retract; nothing further about compact generation of the retract follows.

### Dependencies

Layers 0–4, 8 and 9; DiamondsAndVStacks §§D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3; DiamondEtaleCohomology §§C0.19, C0.24, C2.2, C2.12, C4.5, C4.13–C4.14, C9.8; DiamondSixOperations §§S2.4, S4.2–S4.3; EnhancedDerivedSheaves §E5:presentability.4.

## Downstream consumers

RationalAnalyticPrismatization consumes Layer 0: the Banach arc-site, `Marc(A) = Marc(A^u)`, the strictly totally disconnected Banach rings of §0.4 and the quasi-pro-étale maps of §0.6, which it compares with light arc-stacks over `𝔽_p`. Its further exports, to roadmaps later in the merge order, are the categories `Dmot(X)` and `Deff_mot(X)` with their six operations (§§8.1, 8.5, 9.4), rigidity (§§9.1, 9.6), the torsion and tilting comparisons (§§4.8, 4.9, 8.3), motivic K-theory and its Adams decomposition (§§6.1, 6.3, 7.6), the comparison with algebraic étale motives over algebraically closed fields (§10.6), the nearby-cycle functor and monodromy equivalence (§§11.1, 11.8), and the overconvergent comparison (§12.3).

## Corrections to the source

The following calculations in Scholze's *Berkovich motives* (arXiv v3) are corrected where this roadmap uses them.

**E1 (proof of Lemma 6.5, p. 38, root containment).** With `r₂ > 1 > r₁` and `n = Σ k_i`, the outer estimate is stated using `|T| ≥ r₁ > 1`, and the estimate inside the `i`-th deleted disc bounds the product by `r₁ⁿ` using `|T − a_j| = |a_i|`. Corrected: for `|T| ≥ r₂` the product has norm `|T|ⁿ ≥ r₂ⁿ`; for `|T − a_i| ≤ r₁` the other centres satisfy `|T − a_j| = |a_i − a_j| = 1`, so the product has norm at most `r₁^{k_i}`. Choose each `k_i` with `r₁^{k_i} < s₁` and `n` with `r₂ⁿ > s₂`. The printed outer threshold contradicts `r₁ < 1`, and in the inner disc only the `i`-th factor is small. Recorded for the root containment of these polynomials, which §4.4 cites as the non-example of E10; §4.4 uses the sections of E10.

**E2 (proof of Lemma 6.5, p. 38, ratio of nearby coordinates).** The difference `(T₁ − a_j)/(T₂ − a_j) − 1` is `(T₁ − T₂)/(T₂ − a_j)`, not `(T₂ − T₁)/(T₂ − a_j)`. The sign does not affect the one-unit estimate. Used in §4.4.

**E3 (proof of Lemma 6.5, p. 38, final containment).** The intended statement is that `0 ⊕ (C^×/(1 + C_{<1}))^d ⊗ ℚ` is contained in the image of `ℕ[U](∗) ⊗ ℚ → ℚ ⊕ (C^×/(1 + C_{<1}))^d ⊗ ℚ`; differences of two point classes have zero rank coordinate. Used in §4.4.

**E4 (proof of Lemma 6.5, p. 38, domain decomposition).** Each annular domain `V_i` contributes a degree-coordinate factor `ℚ^d`, one slope for each of the `d` product coordinates `∏_r (T_r − a_j)` of §4.4, so `e` domains give `ℚ^{de}`; the printed factor `ℚ^e` per domain would give `ℚ^{e²}`. Used in §4.4.

**E5 (proof of Proposition 5.19, p. 35, annulus fibre).** For a monic polynomial of degree `n` with constant coefficient `a₀` to have all roots in `T(r₁, r₂)`, the coefficients must satisfy `|a_i| < min(r₂^{n−i}, |a₀| r₁^{−i})`, not the bound with `max`. Witness over `ℂ₂` with `r₁ = 1/4`, `r₂ = 4`: `T² + T/2 + 4` has `|a₀| = 1/4 ∈ (1/16, 16)` and `|a₁| = 2 < max(4, 1) = 4`, but its roots have norms `2` and `1/8`, and `1/8 < r₁`. The bound with `min` equals 1 and excludes it; with it the fibre over fixed `a₀` is still an open polydisc. Used in §3.5.

**E6 (Theorem 11.1, p. 57, rational mapping spectrum).** The rational mapping object from `ℤmot[X](−j)` to `ℤ` is `K(X)_ℚ^{(j)}[−2j]`, with `π_i = K_{i+2j}(X)_ℚ^{(j)}`, not the weight-`j` piece without shift. This follows from `Kmot ⊗ ℚ = ⊕ ℚ(n)[2n]` (Proposition 8.5) and agrees with Cisinski–Déglise, Theorem 5.2.2, p. 44. Witness: for `X = ℙ¹` and `j = 1`, the Picard class lies in `π_{−2}`, while `π₀ = H⁰(ℙ¹, ℚ(1)) = 0`. Used in §§10.4–10.5.

**E7 (construction of the six operations after Proposition 9.3, p. 52).** The construction is stated starting from all affine maps of finite cohomological dimension as proper maps, but Theorem 9.2 gives the projection formula only for maps that, arc-locally on the target, embed into a finite-dimensional ball, and Corollary 10.2, which removes this restriction, is proved through Proposition 10.1 and so after the construction. The construction is started from the class generated by the maps of Theorem 9.2 and rerun after Corollary 10.2, as the discussion following that corollary does. Witness: `Marc(Cont(βℕ, ℂ)) → Marc(ℂ)` has cohomological dimension `0` and no such embedding. Used in §§8.5, 9.4.

**E8 (construction before Definition 11.3, p. 58, direction of the comparison map).** The map of `Marc(C)` to the pro-torus `G̃_{m,k}` given by the roots of `π` induces, by adjunction, the pullback `g_* ℤ → f_* ℤ`, not a map `f_* ℤ → g_* ℤ`: for the inclusion of one point into two points it is `(a, b) ↦ a`. It is this pullback that is an equivalence, and the augmentation of `f_* ℤ` is its inverse followed by evaluation at `1`; the resulting functor `Ψ` is as stated. Used in §11.1.

**E9 (Example 3.6, p. 16, the bounded product of residue fields).** The bounded product of the completed residue fields of a Banach ring `A` is called totally disconnected, but it need not be analytic: for an algebraically closed `k` with the trivial norm it is `k` itself. It is totally disconnected once `A` is first replaced by the analytic ring `A((T))_{1/2}` of Example 3.4, an arc-cover of `A`, whose residue fields are nondiscrete, and strictly totally disconnected after completed algebraic closures of those residue fields (Proposition 3.11). Used in §§0.3, 0.5.

**E10 (proof of Lemma 6.5, p. 38, degrees of the test sections).** Over the annulus `{s₁ < |t| < s₂}`, the section `t ↦ ∏_i (T − a_i)^{k_i} − t` of `ℕ[U]`, of degree `n = Σ_i k_i`, is said to have degree vector `(k₁, …, k_d)`. Its `j`-th product coordinate `∏_r (T_r − a_j)` is `(−1)ⁿ` times the value of the polynomial at `a_j`, which is `−t` because every `k_j ≥ 1`; so every coordinate is `(−1)^{n+1} t`, of slope `1`, the degree vector is `(1, …, 1)` whatever the `k_i`, and for `d ≥ 2` these sections do not span `ℚ^d`. Witness: `d = 2`, `a = (0, 1)`, `k = (1, 1)`: the roots `T₊, T₋` of `T² − T − t` satisfy `T₊T₋ = −t` and `(T₊ − 1)(T₋ − 1) = T₊T₋ − (T₊ + T₋) + 1 = −t`. Corrected: the sections `(T − a_i)^m − ct` of §4.4 have the basis vectors as degree vectors. Used in §4.4.

One further convention is respected: the line-domain computation of Lemma 6.5 takes place in `ℙ¹_C`.

## References

- **[Scholze]** Peter Scholze, *Berkovich motives*, arXiv:2412.03382v3 (22 January 2026); J. Amer. Math. Soc. 39 (2026), 697–764. Locators use the internal pagination of arXiv v3: Definitions 2.1–2.2, 2.7, 2.17, 2.20, Proposition 2.9 (pp. 7–12); Definitions 3.1, 3.10, Propositions 3.2–3.3, 3.9, 3.11, Examples 3.4–3.8, Corollary 3.12, Theorems 3.13–3.14 (pp. 14–18); Theorems 4.1, 4.14, 4.20, Definitions 4.3, 4.10, 4.17, 4.19, 4.21–4.22, Lemmas 4.4–4.9, 4.23, Propositions 4.12–4.13, 4.15–4.16, 4.24–4.25, Corollary 4.18, Example 4.26 (pp. 19–26); Definitions 5.1–5.2, 5.15, 5.18, Lemmas 5.3, 5.11, Corollaries 5.4–5.5, Propositions 5.6, 5.8–5.10, 5.12–5.13, 5.17, 5.19, Theorems 5.14, 5.16 (pp. 26–35); Theorems 6.1, 6.3, 6.7, Definition 6.2, Lemmas 6.4–6.5, Corollaries 6.6, 6.9, Proposition 6.8 (pp. 35–40); Theorem 7.1, Lemma 7.3 (pp. 40–43); Corollaries 8.1–8.2, 8.6, 8.10, 8.12, Definition 8.3, Propositions 8.4–8.5, 8.7–8.8, Theorems 8.9, 8.11, 8.13 (pp. 44–50); Definition 9.1, Theorem 9.2, Propositions 9.3–9.5, 9.7, Corollary 9.6 (pp. 50–53); Propositions 10.1, 10.3, 10.8–10.10, Corollaries 10.2, 10.6, Lemma 10.4, Definition 10.7 (pp. 53–57); Theorem 11.1, Remark 11.2, Definition 11.3, Propositions 11.4–11.8, Theorem 11.9, Corollary 11.10 (pp. 57–62); Propositions 12.1, 12.3–12.4, Corollary 12.2 (pp. 62–64); §1, Remarks 1.4, 1.8, Propositions 1.5–1.6, 1.13, Theorems 1.7, 1.9, 1.12, 1.14, Definition 1.11 (pp. 3–7); Remarks 2.8, 4.2, 4.11, 5.7 and 7.2 (pp. 9, 19, 22, 28, 40); §2.3 (p. 12), §3 (pp. 14–15) and §5.2 (p. 32).
- **[vdP]** Marius van der Put, *The class group of a one-dimensional affinoid space*, Ann. Inst. Fourier 30 (1980), no. 4, 155–164: Theorem 1.1 (p. 156, proof pp. 156–159), Corollary 1.3 (p. 159).
- **[BLR]** Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer, 1990: §9.2, Proposition 3 (p. 244), Example 8 (pp. 246–247), Proposition 10 (p. 249). Cited by locator as background for the torus–abelian extension pattern of §4.3.
- **[Vakil]** Ravi Vakil, *The Rising Sea: Foundations of Algebraic Geometry*, draft of 21 February 2024 (author's page); Princeton University Press, 2025. Locators use the draft: §20.2, Exercise/Definition 20.2.A (intersection numbers of curves on a regular projective surface, pp. 580–581), the bilinear intersection form (20.2.4.1) on `Pic` (p. 581), Exercise 20.2.B(a) (the adjunction formula, pp. 581–582). Cited for the negative control among the Checks of §11.4.
- **[CD]** Denis-Charles Cisinski and Frédéric Déglise, *Étale motives*, arXiv:1305.5361v4 (5 December 2014); Compositio Math. 152 (2016), 556–666. Locators use arXiv v4 pagination: Definition 2.2.2 and Proposition 2.2.3 (p. 25), Proposition 2.2.10 (p. 27), Theorem 4.5.2 and Corollary 4.5.3 (p. 41), Theorem 5.2.2 (p. 44), Corollaries 5.5.5 and 5.5.7 (pp. 55–56), Remark 5.5.8 (p. 57).
- **[Bachmann]** Tom Bachmann, *Rigidity in étale motivic stable homotopy theory*, arXiv:1810.08028v4 (11 January 2022); Algebr. Geom. Topol. 21 (2021), 173–209. Locators use arXiv v4, the version read: Lemma 3.10 (p. 10), Corollaries 4.3–4.4 (pp. 11–12), §5, the construction of étale motivic spectra from étale hypersheaves of spectra on smooth schemes, and Theorem 5.1 (p. 13), Corollary 6.2 (p. 15), Lemmas 6.3–6.4 and Theorem 6.5 (pp. 16–17), Theorem 6.6 and its proof, Theorem 7.1 (p. 17). Cited for the hypercover localization of §10.1 and the transfer-free rigidity of §10.2.
- **[MR]** Shubhodip Mondal and Emanuel Reinecke, *On Postnikov completeness for replete topoi*, arXiv:2210.14146v2 (27 May 2024); Homology Homotopy Appl. 27 (2025), no. 1, 179–196. Locators use arXiv v2, the version read: Theorem A (p. 1; proof, p. 11) and Definition 3.5 (p. 8). Cited for the Postnikov completeness of §0.7.
