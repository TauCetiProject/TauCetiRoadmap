# Roadmap: geometric Frey–Mazur and bounded-gonality rigidity

**Summary.** Build the geometry of the diagonal projective-level modular surface, its Heegner and bicusp strata, compact hyperbolic metric estimates, signed arithmetic repulsion, and uniform multiplicity and ramification bounds. The geometric endpoint says that, for every gonality bound N, sufficiently large prime level forces every nonconstant curve of gonality less than N on this surface to be a cyclic Hecke curve. An actual isomorphism of p-torsion then gives an isogeny of nonisotrivial elliptic families over their original base, uniformly over all algebraically closed characteristic-zero fields. Separate endpoints prove full linear torsion monodromy and classify the rational curves that support smooth minimal-model contractions.

## Scope and ownership

This roadmap owns the diagonal quotient surface and its Hecke images, the signed special strata, the modular systole and height comparisons, repulsion and overlap estimates, the four multiplicity estimates, the pencil/wreath construction, and their rigidity, descent and surface applications. It supplies the characteristic-zero geometric theorem for every prime above a bound depending only on gonality; no exceptional family of otherwise large primes is discarded.

ModularCurves §§0D–0E, 2C and 5B–5C own ordinary elliptic torsion, descent and twists. ModularCurvesPartII §§1.2–1.3, 2.3, 3.9, 3.14, 4.1, 4.6–4.10, 5.7, 5.13, 5.16, 6.1, 8.4–8.5 and 9.10, 9.13 own the elliptic uniformizations, projective scalar-level curve, its polygon compactification, components, conjugation and cyclic boundary Hecke correspondence with projection degree ψ(m). Those constructions are imported. The retained frame comparison fixes the left action, and the retained Hecke construction adds only the finite images H_m and restrictions on this surface.

SchemeAndStackFoundations §1.17 owns projective finite quotients and norm polarization; §§4.11–4.13 own modifications, strict transforms, finite normalization of integral curves and Bertini smoothness; §§5.1–5.3 and 5.9–5.10 own cycles, weighted pushforward, flat pullback and intersection theory. The symmetric-power subsection specializes that quotient to a surface and applies its relative cycle contract; it does not construct a second general quotient. AlgebraicCurves Layers 3–7 and 12 own divisors, Riemann–Roch, Hurwitz and the proper-model dictionary. CanonicalModelsAndGonality §§1.1–1.7 and 9.1 own gonality, pencils, finite-map functoriality, constant-field invariance and their proper-model interpretation; §§8.1–8.7 own analytic gonality, Li–Yau and Abramovich’s bound. These general results are consumed here, including the 7/800 numerical bound; there is no second gonality theory or Abramovich target. Section 8.1 is now CanonicalModelsAndGonality §8.6. FuchsianOrbifolds Layers 0–5 own effective projective actions, quotient charts, polygons, cusps, compactification and analytic degree theory. ComplexKahlerGeometry K3 and K6.1 own analytic sets, compact integration and their local volume interfaces; ComplexComparisonPartII C5.4 owns general complex currents, weighted analytic-cycle integration and Poincaré–Lelong, while its C−1.3 is the owner requested for finite-group-quotient analytification. The local application-specific signed estimates remain here.

AbelianSchemesAndArithmeticModuli A1.6 owns the relative elliptic/abelian equivalence. Its A1.8, A3.1–A3.5 and A6.25 and NeronModelsAndSemistableAbelianVarieties §§1.3 and 1.8 supply extension of generic homomorphisms over a Dedekind base and the finite-kernel criterion. There is no separate general extension theorem here. The geometric rank-one Hom application adds nonisotriviality and the scalar-compatible descent argument to A6.7. CongruenceSpectralGap §5.3 supplies the all-level spectral bound used by CanonicalModelsAndGonality §8.6. Full monodromy is an independent endpoint; the auxiliary self-twist argument and full monodromy are not inputs to scalar-compatible isogeny descent.

The pinned library supplies the actual matrix/projective groups, the entrywise matrix norm, symmetric multisets, transvection generation and SL₂ perfectness listed below. Their generic theories are not targets. The subgroup-index and self-twist arguments are auxiliary README targets. The acceptance signatures state full torsion monodromy and function-field geometric Frey–Mazur on native function-field, elliptic-point and isogeny carriers.

## Conventions

Unless a subsection says otherwise, p is a prime greater than 5, k is algebraically closed of characteristic zero, and a curve is a nonempty smooth geometrically connected quasiprojective k-curve. Its genus and gonality are those of its smooth proper model. The projective-frame comparisons and algebraic special strata require only p>3; the subgroup-index argument allows every prime, and the self-twist argument assumes p>3. Integral image curves are reduced and irreducible. An effective one-cycle has positive integral component weights; the zero cycle is allowed and every linear estimate is zero on it. A projected constant map contributes zero as a one-cycle.

For fields k⊂K, `gonality` is the definition of CanonicalModelsAndGonality §1.1: the infimum in ℕ of the degrees [K:k(f)] over transcendental f∈K, where k(f) is `IntermediateField.adjoin k {f}`. `Suggested.lean` repeats that one-line body unchanged, only so that the two headlines elaborate; its API and Checks are CanonicalModelsAndGonality §§1.1, 1.4 and 1.5 (attained positive minimum, the genus-zero and genus-one values, gonality two for hyperelliptic fields), and §§1.1–1.7 and 9.1 there own the comparison with the gonality of the smooth proper model (BT16 §1, p. 710, BT16 lines 55–56). Every headline restricts to `FunctionField k K`, a finite extension of `RatFunc k` with the compatible k-algebra structure. By the Tau Ceti contracts below this is the function-field hypothesis of CanonicalModelsAndGonality's theorems (their exact-constants hypothesis holds because k is algebraically closed), and K/k(f) is finite for every transcendental f, so the degrees in the defining set are the positive field degrees. Outside one-variable function fields the total value is 0.

Write X(p) for the two-component scalar-framed coarse curve, Y(p) for its elliptic open, G=PGL₂(𝔽_p), S=X(p)×X(p), and Z(p)=S/G. A fixed-pairing component has stabilizer G₀=PSL₂(𝔽_p). A frame is a map 𝔽_p²→E[p], with left action g·φ=φ∘g̃⁻¹. Two frames differ projectively by a scalar. The determinant square class labels components; a nonsquare transports a component and conjugates the selected G₀ presentation. The elliptic automorphism [−1] is still inertia on the projective-frame stack. Coarse points do not carry a universal elliptic family. Actual finite étale module isomorphisms and their inverses are retained separately from their projective classes.

After complex realization, all hyperbolic metrics have curvature −1. Finite distances are taken on specified connected components. A tube in a disconnected product is the union of its compatible componentwise tubes; incompatible component labels do not satisfy a finite-distance inequality. Component transport is an isometry, and no finite distance is assigned between different components. Product distance is the maximum of coordinate distances; curve area is the sum of pulled-back coordinate area forms. A disc has a(r)=4π sinh²(r/2); injectivity radius is half a shortest nontrivial closed-geodesic length. The cusped radius uses loops nontrivial after filling. Canonical degree and volume satisfy vol(C)=2π Deg(C). With dᶜ=i(∂̄−∂)/(4π), ddᶜ log|z|² is the unit point current and ω_𝔻=4π ddᶜ(−log(1−|z|²)). For a meromorphic f vanishing identically on no component, the ComplexComparisonPartII C5.4 convention is (i/π)∂∂̄log|f|=[div f]; since log|f|²=2log|f|, it equals our ddᶜlog|f|² with ddᶜ=(i/2π)∂∂̄. Ordinary graph tubes have matched-coordinate threshold 2r, and conjugate tubes use conjugation on the second factor. If c₂ is this real involution and T_m is the imported cyclic correspondence of §0.6, write T̄_m=c₂(T_m); §3.4 develops its API and tangent properties. Conjugate Hecke loci are real analytic and have no divisor intersection operation in the original complex structure.

In formulas such as 2g−2, subtraction is in ℤ; analytic exponents and division are in ℝ, with positive radii and nonzero denominators stated at their use. Every asymptotic is along all primes p tending to infinity. Constants are uniform in curves, parametrization degrees, selected components and k, unless their indicated fixed parameters vary. Small positive parameters and all enlargement constants are chosen before p. The common elliptic type is 2 or 3; the cusp type is p. Every Hecke index m is a positive integer prime to p. Its cyclic degree is ψ(m)=m∏_(ℓ|m)(1+1/ℓ); σ₁(m) refers to all subgroups instead. All maps and cycles lie in one fixed ambient universe at a time; a larger algebraically closed field is handled by finite-presentation descent and base change, with no cardinality bound on k.

**Checks.**

- At p=7, 3 is nonsquare while 2²=4 is square; (e₁,3e₂) changes component and (2e₁,2e₂) does not. The inverse in the left action gives g·(h·φ)=φ∘h⁻¹∘g⁻¹=(gh)·φ.
- In the disc, |z|=tanh(1/2) has distance 1 and area a(1)=4π sinh²(1/2); near zero a(r)/r² tends to π. The current ddᶜ log|z|² has mass 1, fixing the sign and 4π factor; for f=z², both our ddᶜlog|f|² and the supplier’s (i/π)∂∂̄log|f| have mass 2. For f=1 both vanish. A cycle 2[L] integrates a test form with ∫_Lη=1 to 2 in either convention, rather than the reduced value 1.
- A matched pair of coordinates at distance 3r/2 lies in the radius-r graph tube by taking their midpoints, each at distance 3r/4. Using threshold r would reject it.
- The diagonal X→X² has degree 2(2g_X−2) and area 4π(2g_X−2); a q-fold parametrization multiplies both by q. A constant cusp coordinate contributes zero.
- At m=4, ψ(4)=6 and σ₁(4)=7; at m=1 the cyclic correspondence is the diagonal. At m=p multiplication by p is zero on p-torsion and gives no torsion isomorphism.

These normalizations use BT16 §1.3, p. 713 (BT16 lines 169–193), §§2.1–2.5, pp. 713–717 (BT16 lines 195, 322), and BTE §3, p. 2 (BTE line 55).

## Exact supplier contracts

### From Mathlib

- `Matrix.ProjGenLinGroup` and `Matrix.ProjGenLinGroup.mk_eq_mk_iff`, in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean`, define GL modulo its centre and identify equal classes with multiplication by an invertible scalar. `Matrix.ProjectiveSpecialLinearGroup`, in `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean`, is SL modulo its centre. `Matrix.ProjectiveSpecialLinearGroup.toPGL` and `Matrix.ProjectiveSpecialLinearGroup.toPGL_injective`, in the former module, compare these over a field; they do not identify PSL and PGL over 𝔽_p.
- `Matrix.norm_eq_sup_sup_nnnorm` and `Matrix.norm_apply_le_norm`, in `Mathlib/Analysis/Matrix/Normed.lean`, use the entrywise supremum norm. Install that scoped norm locally when using height; the operator norm is a different instance.
- `Subgroup.index`, in `Mathlib/GroupTheory/Index.lean`, is the natural cardinality of the coset space. Its infinite-index value is zero; all groups in the subgroup-index argument are finite, so that value cannot occur.
- `Sym`, `Sym.map` and `Sym.map_map`, in `Mathlib/Data/Sym/Basic.lean`, supply cardinality-indexed multisets and functorial mapping. They supply the geometric-point comparison, not a scheme symmetric power.
- `FunctionField`, in `Mathlib/NumberTheory/FunctionField.lean:59`, means finite dimensionality over the chosen rational subfield; the headlines also retain the compatible k-algebra tower. `IntermediateField.adjoin` and `Module.finrank` give the rational-subfield degree used by `gonality`.
- `AddSubgroup.torsionBy` and `AddSubgroup.torsionBy.zmodModule`, in `Mathlib/Algebra/Module/Torsion/Basic.lean:972` and line 1009, give the subgroup killed by p and its ℤ/pℤ-module structure. `AddMonoidHom.toZModLinearMap`, in `Mathlib/Algebra/Module/ZMod.lean:81`, makes every additive torsion homomorphism linear. `WeierstrassCurve.Affine.Point.map`, in `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:822`, gives the coordinatewise Galois action on geometric points. `LinearMap.det`, in `Mathlib/LinearAlgebra/Determinant.lean:164`, is basis-independent; it returns 1 without a finite basis, so its use here relies on geometric p-torsion being a rank-two vector space in characteristic zero.
- `Matrix.SL2.commutator_eq_top`, in `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`, assumes a field and an element a with a≠0 and a²≠1. Such an a exists in 𝔽_p for p>3. This is the perfectness input in the self-twist route.

### From Tau Ceti

`Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`, in `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean`, generates SL by elementary transvections over every field. `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree` and `TauCeti.RiemannSurface.degree_comp`, in `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean`, supply finite nonconstant holomorphic maps and their degree; the bundled map retains two distinct values and finite fibres. `TauCeti.RiemannSurface.ramificationDivisor`, in `TauCeti/Analysis/Complex/RiemannSurface/Ramification.lean`, carries coefficients e−1. The total degree on arbitrary maps is not used without its finiteness and nonconstancy hypotheses. `TauCeti.Isogeny`, in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`, supplies the nonzero pointed coordinate pullback used for the function-field conclusion. `TauCeti.Isogeny.existsUnique_map_eq_iff_galoisFixed`, in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean:117`, descends an isogeny uniquely over a Galois extension, including an infinite one, when all coefficient conjugations fix it. `TauCeti.Isogeny.Hom.degree_zsmul`, in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.lean:63`, gives degree scaling by the square of the absolute value of an integer, including zero. `TauCeti.IsFunctionField`, in `TauCeti/FieldTheory/FunctionField/Basic.lean:51`, says that K is finite over the subfield generated by some transcendental element, with no chosen embedding of `RatFunc k`. `TauCeti.isFunctionField_iff_functionField`, at line 133 there, identifies it with `FunctionField k K` under the compatible scalar tower, and `TauCeti.IsFunctionField.finiteDimensional_adjoin`, at line 64, makes K finite over k(f) for every transcendental f.

`TauCeti.TriangleGroup` and `TauCeti.TriangleGroup.lift`, in `TauCeti/GroupTheory/TriangleGroup/Basic.lean:80` and line 174, are the presented triangle group Δ(a,b,c)=⟨x,y,z | x^a, y^b, z^c, zyx⟩, in which c=0 imposes no relation on z, and its universal property: elements of a group satisfying the four relations define a homomorphism sending x, y, z to them. `TauCeti.ModularGroup.triangleGroupEquiv`, in `TauCeti/Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.lean:315`, is the presentation `TauCeti.TriangleGroup 3 2 0 ≃* PSL(2, ℤ)`, sending x, y, z to ST, S and T⁻¹. For a typed triple of `TauCeti.TriangleOrder` (an elliptic order m≥2 or a cusp) whose reciprocals sum to less than 1, `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`, in `TauCeti/Analysis/Complex/Fuchsian/TriangleOrder/Group.lean:469`, gives a hyperbolic triangle with the corresponding angles whose triangle group in PSL(2,ℝ) is cofinite and isomorphic to the abstract triangle group. `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv`, at line 367 there, is that isomorphism for a given counterclockwise triangle: it sends x, y, z to the vertex transformations at the vertices 0, 1, 2, each the product of the reflections in the two sides meeting there. `WeierstrassCurve.GeometricEnd` and `WeierstrassCurve.HasGeometricCM`, in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:94` and line 100, are the endomorphism ring of the base change to `SeparableClosure`, which is the algebraic closure in characteristic zero, and the predicate that some geometric endomorphism is not an integer. The pin does not prove that a nonconstant j-invariant excludes geometric complex multiplication; that is §9.2.

### From TauCetiRoadmap.ModularCurves and TauCetiRoadmap.ModularCurvesPartII

ModularCurves §§0D–0E supply the field finite-étale/Galois dictionary and effective descent; §2C supplies the two dual-isogeny identities; §§5B–5C supply ordered full bases, the Weil-pairing convention and twists. ModularCurvesPartII §§1.2–1.3 supply pointed complex elliptic uniformization and lattice/isogeny compatibility; §2.3 supplies polygon automorphisms; §§3.9, 3.14 supply frame torsors, level-H data and open uniformization; §4.1 supplies formal cusp charts; §4.6, `stabilizersAndSmallLevels`, supplies the pointed automorphism groups μ₄ and μ₆ at j=1728 and j=0 and the finite local coarse chart; §§4.7–4.10 supply the prime-level application, q-parameter agreement and fixed-pairing connectedness; §§5.7, 5.13, 5.16 and 6.1 supply the scalar coarse quotient, fixed-pairing compactification, subgroup quotients and compact complex comparison. Section 8.4, `complexConjugationComparison`, supplies conjugation and pairing inversion; §8.5, `genericBaseChangeAndLevelCompatibility`, supplies compatibility of the generic-fibre comparisons with characteristic-zero field extension and the permitted level and Hecke maps. Section 9.10 supplies cyclic correspondence composition, including its repeated-prime and scalar components. Section 9.13 supplies the cyclic projective-level boundary correspondence, the domains ℤ/(pd) and ℤ/p of its polygon maps, and the weighted canonical-degree multiplier ψ(m). This includes the cyclic-kernel filter; no degree σ₁(m) is substituted.

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §§0.8–0.9 for finite-presentation models and spreading, §0.11 for finite-Galois descent of morphisms, §1.17 for projective finite group quotients with their norm polarization and flat base change, §§4.11–4.12 for modifications, strict transforms along them (blow-ups included) and domination of a modification by an admissible blow-up, §§5.1–5.3 for Chow cycles, proper pushforward with generic degree, flat pullback and the Chern projection formula, and §§5.9–5.10 for surface intersection. Section 4.13 supplies regularity and birationality of the finite normalization of an integral curve; its finite-type-over-a-field case applies to the image curves here, and characteristic zero makes those regular curves smooth. The base is Noetherian in the quotient theorem; the fields and finite-type models used here satisfy it. The degree-zero invariant algebra need not equal the base ring. The general quotient is not replaced by its reduced orbit set.

What SchemeAndStackFoundations must provide (gap:free-locus-and-relative-cycle): For a finite group acting on a projective characteristic-zero scheme, prove that its finite quotient is étale over the image of the free locus, and construct the base-change-compatible norm cycle morphism of a finite flat degree-n family to the permutation quotient SymⁿZ with every fibre length retained.

What SchemeAndStackFoundations must provide (gap:cyclic-surface-resolution-and-contraction): Over algebraically closed characteristic-zero fields: for a normal projective surface whose singular points are isolated cyclic quotient charts 1/n(1,a) with n≥2, 1≤a<n and gcd(a,n)=1, provide the Hirzebruch–Jung resolution with exceptional chains of smooth rational curves; for a smooth connected projective surface, extend §4.13 `bertini_smoothness` so that a general member of the complete linear system of a sufficiently ample line bundle is a smooth connected curve meeting each of finitely many given reduced curves only at their smooth points and transversely, and avoiding a given finite set; for a smooth projective surface, provide Castelnuovo contraction of a smooth rational curve of self-intersection −1 with smooth projective target, and termination of successive contractions by strict decrease of the Picard number.

What SchemeAndStackFoundations must provide (gap:surface-contraction-intersections): Provide the negative continued-fraction intersection matrix for a cyclic-quotient resolution and the intersection update C_new²=C_old²+(C_old·E)² when a smooth rational (−1)-curve E on a smooth projective characteristic-zero surface is contracted.

### From TauCetiRoadmap.AlgebraicCurves

Use Layers 3–5 for divisors, Riemann–Roch and pencils; Layer 7 for the different and the function-field Hurwitz formula; and Layer 12, especially 12B–12E, for finite normalization, smooth proper models, extension of finite field embeddings and comparison with scheme genus and Hurwitz. SchemeAndStackFoundations §3.2 gives the scheme formula, with ramification degree equal to Σ(e−1) in the characteristic-zero setting here. Its §3.5 supplies sectionNorm and lineBundleNorm_divisor for finite locally free maps; these give the norm/principal-divisor compatibility used in §6.2. A nonconstant finite map between smooth proper curves is finite locally free.

What AlgebraicCurves must provide (gap:curve-extension-and-normalization): For a smooth connected curve over an algebraically closed characteristic-zero field and a proper separated finite-type target, extend a morphism uniquely to its smooth proper model, factor the resulting nonconstant map through the finite normalization of its reduced integral image supplied by SchemeAndStackFoundations §4.13, and prove that birational integral curves have equal normalization genus.

### From TauCetiRoadmap.FuchsianOrbifolds

Layers 0–1 supply the effective PSL/PGL action and cyclic elliptic quotient charts; Layer 2 supplies triangle-group presentations and orbifold area; Layers 3–4 supply cusp widths, q-charts, compactification and finite-index cusp ramification; Layer 5 supplies analytic degree, faithful tangent characters at fixed curve points and branched-cover Euler characteristic. A generic quotient surface is not a Riemann surface; the local-inertia application is on its normalized curve pullback.

What FuchsianOrbifolds must provide (gap:hyperbolic-trigonometry): Provide the marked curvature −1 disc/half-plane comparisons, the hyperbolic second cosine law, translation length 2 arcosh(|tr|/2) for |tr|>2, the rotation identity sinh(D/2)=sinh(d)|sin(θ/2)|, and the midpoint lens bound B(a,D+R)∩B(b,D+R)⊆B(midpoint,R+C) when d(a,b)=2D and R≥1.

### From TauCetiRoadmap.ComplexKahlerGeometry

Use K3 for analytic subvarieties and normalization interfaces and K6.1 for positive analytic integration and Stokes, on the same smooth-form carrier. General current calculus, weighted analytic-cycle integration and Poincaré–Lelong are imported from ComplexComparisonPartII C5.4. The following transport and hyperbolic-volume extensions retain every branch and weight on K6.1’s integration carrier, identified with that cycle current by the imported compact comparison. They use the dᶜ convention stated above and have no smoothness assumption on the analytic cycle.

What ComplexKahlerGeometry must provide (gap:analytic-cycle-current-transport): For locally finite effective analytic one-cycles in finite-dimensional Hausdorff second-countable complex manifolds, provide proper normalization with branch weights, integration of pulled-back forms and weighted pushforward under finite holomorphic maps of curves, local-multiplicity transport, Green and Stokes identities on relatively compact sublevels, and the zero-atom integrable extension of cusp densities, compatible with K6.1’s compact analytic integration.

What ComplexKahlerGeometry must provide (gap:hyperbolic-cycle-volume-comparisons): For curvature −1 disc products with maximum distance and sum area, provide the point bound V(r)≥4π sinh²(r/2) mult, the ordinary-diagonal bound V(r)≥8π sinh²(r/2)(C·Δ), the analogous double-diagonal point-multiplicity bound, and monotonicity of ordinary tube volume divided by cosh r and conjugate-diagonal tube volume divided by sinh r for 0<r<ρ/2, with no ordinary diagonal component and with all effective cycle weights retained.

What ComplexKahlerGeometry must provide (gap:relative-point-ball-volume): For every n≥1 and every closed effective analytic one-cycle in the unit polydisc, prove V(r)≤C_n(1+r)exp(r−R)V(R) for maximum-product balls centred at zero and 1≤r≤R−2, with sum curvature −1 area, C_n depending only on n, no incidence assumption on the centre, and transport to compact quotients for R<ρ.

### From TauCetiRoadmap.CanonicalModelsAndGonality

Consume §§1.1–1.2 for the positive attained minimum and pencil description; §§1.3–1.5 for gon≤g+1 and the genus-zero, genus-one and hyperelliptic cases; §1.6 for gon(D)≤gon(B) under a finite nonconstant B→D; §1.7 for invariance under algebraically closed constant-field extension; and §9.1 for morphisms on the regular proper model. Constants are exact, automatically so over the algebraically closed fields used here. The `gonality` of Conventions is §1.1's definition with the same body. Its theorems are stated under Tau Ceti's `TauCeti.IsFunctionField`, which `TauCeti.isFunctionField_iff_functionField` identifies with the headlines' `FunctionField` hypothesis.

Consume §§8.1–8.2 and 8.7 for analytic/function-field gonality comparison, and §8.6 for gon(X_Γ)≥7[PSL₂(ℤ):Γ]/800 on every compactified congruence curve. Its §§8.3–8.5 identify the variational Friedrichs bottom, apply the singular finite-area Li–Yau inequality and use CongruenceSpectralGap §5.3; no least discrete eigenfunction is presumed. The curvature is −1 and the effective projective index is used.

**Checks.**

- For k(t), the field and curve minima are 1; for a genus-one function field over algebraically closed k they are 2, excluding degree-one maps.
- Under x=t², Norm(t−a)=a²−x for a≠0. Both the principal divisor downstairs and the pushforward of [a]−[∞] are [a²]−[∞]; pullback instead gives [a]+[−a] over a².
- For effective index D=1, (21/100)(π/3)/(8π)=7/800. Replacing the finite-area modular metric by a round sphere of area 4π gives 21/200, so the area normalization matters.

### From TauCetiRoadmap.ComplexComparisonPartII

Use §§C−1.1–C−1.3 for analytic spaces, analytification, maps and étale-presentation quotients; §C2.2 for projective ideal/closed-subspace comparisons; §C1.9 for the identification of the rational functions of a smooth proper complex curve with the meromorphic functions of its Riemann surface; §§C4.1–C4.5 for proper-map algebraicity and the curve connectedness comparisons; §C5.4 for `CurrentCalculus`, `AnalyticCycleIntegration`, `lelongPoincareSection` and Chern/intersection normalization, including weighted positive cycle currents on noncompact manifolds; and §C6.2 for finite-type Riemann existence. The identities of algebraic closed Hecke loci descend by faithful flatness, rather than by a claim that an arbitrary analytic isogeny descends.

What ComplexComparisonPartII must provide (gap:finite-group-quotient-analytification): For a finite group G acting on a projective complex scheme X with finite scheme quotient q:X→Y supplied by SchemeAndStackFoundations §1.17, identify q^an with the finite categorical analytic quotient, with O_(Y^an)=((q^an)_*O_(X^an))^G, orbit fibres and local stabilizer-invariant rings, retaining nilpotents and compatibly with equivariant morphisms.

A proof route uses §C1.9’s proper coherent pushforward comparison and the characteristic-zero averaging idempotent on q_*O_X. The algebraic quotient is the one from SchemeAndStackFoundations §1.17; this contract compares its analytification, including ramified points.

**Checks.**

- For the sign action on P¹, a coordinate at zero gives w=z² and invariant analytic germs ℂ{z²}. The local degree is 2 and the derivative is 0 at zero; the quotient is not an étale presentation there.
- For the trivial action on the projective dual-number point, the invariant analytic local ring is ℂ[ε]/(ε²), with ε≠0. Replacing the quotient by its reduced orbit set would give ℂ and lose this element.
- The sign-equivariant map z↦z³ on P¹ induces w↦w³ on the quotient: both composites pull w back to z⁶. The comparison must respect this equivariant map as well as the identity.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

Section IG.0.3 supplies actual finite étale local systems and based fundamental-group actions. Section IG.1.3, the characteristic-zero base-extension theorem, supplies equivalence of finite étale covers for a finite-type scheme over algebraically closed k⊂k′ of characteristic zero; it includes nonproper curves. Section IG.3.1 supplies the punctured-curve covering comparison, through ComplexComparisonPartII §C6.2. Every based curve is connected and nonempty. No characteristic-p nonproper invariance is used.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli and TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

AbelianSchemesAndArithmeticModuli A1.6, `relativeEllipticEquivalence`, identifies elliptic schemes with relative dimension-one abelian schemes; A1.8 extends generic morphisms over a connected Dedekind base; A3.1–A3.5 supply isogenies, finite locally free torsion, quotients and dual identities; A3.7–A3.8 supply the polarized pairing and frame torsor; A6.1, A6.6–A6.7 give degree scaling and the finite free geometric Hom lattice; A6.20 supplies full-level Hom descent; A6.25 gives normal-base Hom extension; A6.34 supplies geometric quadratic twists. NeronModelsAndSemistableAbelianVarieties §§1.3 and 1.8 identify good abelian schemes as marked Néron models and extend generic maps uniquely. Applying extension to an isogeny and its dual, with degree n, gives both compositions [n]; in characteristic zero the kernel is contained in finite étale n-torsion and the isogeny criterion gives a finite locally free surjection over the original open curve. A rational map between arbitrary proper models does not supply the group-scheme extension hypothesis. On restricting that curve further, uniqueness gives the restriction of the same extension (BLR90 §1.2 Proposition 8, p. 15; §1.4 Proposition 2, p. 19, cited by locator alone).

### From TauCetiRoadmap.CongruenceSpectralGap

Section 5.3 supplies λ′₁≥21/100 for every congruence subgroup, in curvature −1 and with λ′₁ the clipped Friedrichs gap, equal to 1/4 when the small discrete spectrum is empty. The effective group is its image in PSL₂(ℤ). It is consumed only by the separate monodromy branch.

## How to read the build

Layer 0 fixes the imported modular conventions and defines the quotient and its special loci. Layers 1–2 supply compact/cusped geometry and arithmetic lifts; Layers 3–4 turn small lifts into signed repulsion and overlap control. Layer 5 integrates those facts against weighted curve cycles. Layers 6–7 turn a gonality pencil into a normalized wreath cover and force a Hurwitz contradiction. Layer 8 combines the imported spectral-gonality bound with the subgroup-index argument to prove full monodromy independently of isogeny descent. Layer 9 uses the geometric conclusion and actual torsion, with the Hom lattice and descent, to obtain the isogeny over the original base. Layer 10 applies the same bound to genus and surface contractions. Each subsection lists the objects needed to state its result and the inputs of its displayed proof route; none of the analytic estimates restricts the eventual algebraically closed field.

## Layer 0: Projective frames, quotient surface and special loci

### 0.1 Projective p-frames: conventions on the imported projective level curve

Use the projective level curve X(p) of ModularCurvesPartII §5.7 over an algebraically closed characteristic-zero field: for a prime p>3, the coarse quotient of honest full level p by scalar change of frame, compactified by p-gons, with two geometric components labelled by the Weil-pairing value of a frame modulo squares and [−1] still an automorphism of every point. This construction fixes the conventions used here: G=PGL₂(F_p) acts on the left by g·(E,[φ])=(E,[φ∘g̃⁻¹]) for any lift g̃, its component stabilizer is PSL₂(F_p), and one component is selected and identified with the fixed-pairing curve, the other being its transport by an element of nonsquare determinant. This fixes the action and component conventions for the quotient. (BT16 §§2.1–2.2, pp. 713–715; BT16 line 195.)

One proof route proceeds as follows. Read the two components, the effective PSL₂(F_p) action, the [−1] inertia and the p-gon compactification from the supplier contract; the component count is also §4.7. Descend the right GL₂ action on frames to a left G-action through the inverse, and compare the selected component with the fixed-pairing Γ(p) quotient, accounting for the central ±I. Complex conjugation sends the pairing value ζ to ζ⁻¹ (§8.4 (`complexConjugationComparison`)), which changes the square class by −1; characteristic-zero base change commutes with the scalar quotient by flat base change of invariants.

**Checks.**

- For p=7 the frames (e₁,e₂) and (e₁,3e₂) lie on different components, since 3 is not a square modulo 7, while (e₁,e₂) and (2e₁,2e₂) are the same projective frame.

- PGL₂(F_p) permutes the two components transitively, PSL₂(F_p) is the stabilizer of each, and the scalar −I acts trivially.

- [−1] preserves every projective frame, so the curve is not a fine moduli space.

- At p=5, −1=4=2², so conjugation preserves each component; at p=7, −1=6 is nonsquare, so it exchanges them. These compute the p≡1 and p≡3 mod 4 alternatives.

*Needs:* ModularCurves §5B; `Matrix.ProjGenLinGroup`; `Matrix.ProjGenLinGroup.mk_eq_mk_iff`; ModularCurvesPartII §5.7; ModularCurvesPartII §4.7; ModularCurvesPartII §4.10; ModularCurvesPartII §8.4 (`complexConjugationComparison`); ModularCurvesPartII §§5.7, 5.13, 6.1, 8.5; ModularCurvesPartII §2.3.

### 0.2 The diagonal quotient surface

Let S=X(p)×X(p) and Z(p)=S/G for the diagonal projective-frame action. This is a normal projective coarse surface with finite quotient map S→Z(p). Its smooth-level geometric points classify (E₁,E₂,[ψ]) with ψ:E₁[p]≃E₂[p] up to common scalar. The square class of det ψ labels its two components. For each determinant square class choose a fixed-pairing component presentation by a diagonal, possibly conjugated, PSL₂ action; changing the auxiliary nonsquare gives an equivariantly isomorphic presentation. (BT16 §2.3, p. 715; erratum §1, p. 1; BT16 line 276; BTE §§1–4, pp. 1–4; BTE lines 11, 104, 139.)

The defining construction has the following API.

- The finite map S→Z sends two frames to their composed projective torsion isomorphism.

- An invariant morphism out of S factors uniquely through Z, with the stated finite quotient hypotheses.

- Geometric fibres are exactly diagonal G-orbits.

- Each determinant component is the appropriate PSL₂ quotient of two selected components; a nonsquare changes the second action by conjugation.

- Swapping factors inverts [ψ]; simultaneous conjugation transports the quotient and its determinant component.

- The finite quotient and its classifying map commute with characteristic-zero algebraically closed base change.

One proof route proceeds as follows. Apply the finite quotient universal property to S, using a norm of an ample line bundle to supply an invariant projective embedding. Composition φ₂φ₁⁻¹ is invariant under simultaneous framing change. Conversely two framed presentations of the same triple differ by a diagonal element of G. Reduce each G-orbit to a selected first component. Its stabilizer is PSL₂, while the second component records the determinant square class; a chosen nonsquare identifies that component with the first and conjugates its action. Prove independence before using the erratum’s fixed-pairing notation. Over ℂ, use ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification, to identify this finite scheme quotient with the analytic quotient and its stabilizer-invariant local rings.

**Checks.**

- A generic fibre of X_ε×X_ε′→Z(p) has exactly |PSL₂(F_p)|=p(p²−1)/2 points; for p=7 this is 168.

- Every diagonal point (x,x) maps to the triple (E,E,[id]), and swapping the factors sends the class of ψ to the class of ψ⁻¹.

- The two determinant square classes are not identified in Z(p).

- Replacing both φ_i by φ_i∘g⁻¹ leaves φ₂φ₁⁻¹ unchanged.

- For a nonsquare determinant ψ, restricting both factors to the same fixed-pairing component without twisting loses that component.

*Needs:* §0.1; SchemeAndStackFoundations §1.17 and gap:free-locus-and-relative-cycle; ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification; ModularCurvesPartII §5.7; ModularCurvesPartII §§5.7, 5.13, 6.1, 8.5.

### 0.3 Heegner and anti-Heegner CM strata

A smooth-level pair (x,y) belongs to CM only when its two projective point stabilizers share a nonidentity element. Choose automorphisms h_x,h_y different from ±1 and one matrix g̃∈GL₂(𝔽_p) lifting that common projective stabilizer, with h_x∘φ_x=φ_x∘g̃⁻¹ and h_y∘φ_y=φ_y∘g̃⁻¹. Thus the frame matrices are equal, and their characteristic polynomials agree. Compare the eigenvalues of h_x on Lie(E_x)=T₀E_x and h_y on Lie(E_y)=T₀E_y: equality defines CM⁺ and unequal roots of their common quadratic polynomial define CM⁻. Over ℂ those unequal roots are complex conjugates. This definition is independent of the common generator, compatible lifts and projective frame representatives. Equal j-invariants alone do not define CM. (BT16 §2.4, pp. 715–716; BT16 lines 295–305.)

The defining construction has the following API.

- CM is the smooth-level common nonidentity stabilizer locus.

- The actions of the equal-frame lifts on Lie(E_x) and Lie(E_y) distinguish the plus and minus strata; the tangent lines of X(p) do not supply this distinction.

- CM⁺ and CM⁻ are disjoint, and their union is CM.

- Changing scalar frames, compatible lifts, or the common generator leaves the stratum unchanged.

- Conjugating only the second factor exchanges the strata and is a metric isometry.

- The Lie-character definition is preserved by algebraically closed characteristic-zero base change, with embeddings transporting the complex convention.

One proof route proceeds as follows. Use the faithful action of Aut(E) on Lie(E), retaining equality of the two GL₂ frame matrices. Changing the common generator or simultaneously changing the lift signs applies the same operation to both Lie eigenvalues and preserves equality versus inequality. Over j=1728 the effective stabilizer acts on T_xX(p)×T_yX(p) by (−1,−1) in both strata, so this product derivative does not distinguish the signs. Check the order-3 lifts using t²+t+I=0, and the order-4 lift using t²=−I. These are different polynomials. Conjugating the second complex structure interchanges CM⁺ and CM⁻; simultaneous G action preserves each. Over another characteristic-zero algebraically closed field formulate the same distinction by the algebraic action on Lie(E), transporting through an embedding only for the metric.

**Checks.**

- For x over j=1728 the pair (x,x) is CM⁺ and (x,x̄) is CM⁻; no pair lies in both strata.

- A pair with x over j=1728 and y over j=0 is in neither stratum: the stabilizer orders 2 and 3 are coprime.

- For (x,x) over j=1728 take h_x=[i]. Choosing h_y=−h_x gives the same polynomial t²+1 but frame matrix g_y=−g_x≠g_x for p>3, so this choice is excluded. The admissible equal lifts have Lie eigenvalues (i,i), while conjugating the second factor gives (i,−i).

- With s=[[0,1],[-1,0]] and g=[[1,1],[0,1]], gsg⁻¹ is not projectively s for p>3: the corresponding equal-j pair need not share a stabilizer.

- For the order-3 lift [[0,1],[-1,-1]], the other eigenvalue is −1−t, rather than −t.

*Needs:* §0.1; FuchsianOrbifolds Layer 1; ModularCurvesPartII §1.3; ModularCurvesPartII §4.6; ModularCurvesPartII §4.7; ModularCurvesPartII §8.4 (`complexConjugationComparison`).

### 0.4 Singular bicusps

SBC⊂S consists of pairs of cusps with a common nonidentity projective stabilizer. Each individual cusp stabilizer is cyclic of order p, so their nontrivial intersection means the same order-p subgroup. A pair of arbitrary cusps is not automatically singular. The notion is G-invariant and descends to Z. (BT16 §2.4, p. 716; BT16 line 319.)

The defining construction has the following API.

- Membership is cusp membership in both coordinates and equality of their order-p stabilizers.

- The diagonal pair stabilizer has order p at an SBC point.

- Every diagonal pair (c,c) of cusps lies in SBC.

- G sends SBC to itself, including component-switching elements.

- Conjugation sends cusp inertia to conjugate cusp inertia.

- Boundary and inertia descriptions agree under characteristic-zero algebraically closed extension.

One proof route proceeds as follows. Use the imported cusp charts and effective order-p inertia. Equality of order-p subgroups is a group fact. Compare with the p-gon boundary moduli, retaining μ_p rather than an unchosen constant-group identification before passing to an algebraically closed field. Check independence of scalars and components in the full G action; conjugation and characteristic-zero base change transport the boundary and inertia.

**Checks.**

- On one component a fixed cusp c forms a singular bicusp with exactly (p−1)/2 cusps of that component, namely those whose label spans the same line of F_p² as c's, c itself included; for p=7 there are 3.

- A cusp paired with any point of Y(p) is never singular, since no nonidentity element fixes both.

- (c,c) is singular.

- Two cusps whose stabilizers are distinct unipotent subgroups give a nonsingular pair.

- For p=7 a singular bicusp has inertia order 7; a cusp/elliptic pair has no common nonidentity inertia.

*Needs:* §0.1; FuchsianOrbifolds Layer 1; ModularCurvesPartII §2.3; ModularCurvesPartII §4.1; ModularCurvesPartII §5.7.

### 0.5 Exhaustive quotient branch locus

For p>3, the nonfree locus of S→Z(p) is exactly CM⁺∪CM⁻∪SBC. The effective stabilizer of a point of this locus is cyclic: of order 2 at CM points (of either sign) over j=1728, of order 3 at CM points over j=0, and of order p at singular bicusps. There is no mixed elliptic/cusp branch stratum. (BT16 §2.1, p. 714; §2.4, pp. 715–716; BT16 line 229.)

One proof route proceeds as follows. A nonidentity element fixing a pair fixes both coordinates. On X(p) its stabilizers occur only over j=1728, j=0 and the cusp, with orders 2,3,p. Since these orders are pairwise coprime, a common element forces the same type. Split the two CM tangent characters, or identify the cusp subgroups.

**Checks.**

- The four types have orders 1, 2, 3 and p. The common inertia orders for all 16 ordered pairs are the following; an equal nonordinary type has its indicated order only when the stabilizer subgroups coincide, and otherwise has order 1.

  | First \ second | Ordinary | j=1728 | j=0 | Cusp |
  |---|---:|---:|---:|---:|
  | Ordinary | 1 | 1 | 1 | 1 |
  | j=1728 | 1 | 2 or 1 | 1 | 1 |
  | j=0 | 1 | 1 | 3 or 1 | 1 |
  | Cusp | 1 | 1 | 1 | p or 1 |

  In particular gcd(2,3)=gcd(2,p)=gcd(3,p)=1 for p>3: mixed elliptic types and cusp/elliptic pairs have no nonidentity common inertia.

*Needs:* §0.3; §0.4; FuchsianOrbifolds Layer 1; ModularCurvesPartII §4.7; ModularCurvesPartII §5.7.

### 0.6 Cyclic Hecke loci and weighted pull-push

For m≥1 with p∤m let T_m⊂S be the cyclic degree-m correspondence of ModularCurvesPartII §9.13 (projective cyclic boundary correspondence) on the projective level curve, [φ₂]=[f[p]φ₁] for a cyclic isogeny f of degree m, with its p-gon boundary maps. Let H_m be its finite image in Z(p); a Hecke curve is an irreducible component of H_m. The supplied weighted pull-push T_m*C=(id×a)_*(id×b)^*C of an effective one-cycle satisfies Deg(T_m*C)=ψ(m)Deg(C) with ψ(m)=m∏_(ℓ|m)(1+1/ℓ)≪m², by the supplier contract. This specializes the supplied correspondence and defines its finite images H_m and their irreducible components. (BT16 §2.5, pp. 716–717; BT16 line 322.)

The defining construction has the following API.

- A smooth-level point lies on T_m exactly when such a cyclic framed isogeny exists.

- T₁ is the diagonal, while H₁ also contains geometric isomorphism twists at the coarse level.

- Changing both actual frames by a common g or rescaling either representative gives the descended correspondence with its determinant component.

- Pull-push of a non-Hecke effective curve cycle has no Hecke component: composition of the corresponding prime-to-p isogenies, followed by removal of an integer scalar factor, would otherwise make the original component Hecke. Use ModularCurvesPartII §9.10 for the correspondence composition.

- The prime-to-p construction and its boundary extension commute with permitted base change and conjugation.

One proof route proceeds as follows. Take T_m, its projections, boundary extension and degree identity from §9.13 (projective cyclic boundary correspondence), which uses the cyclic count ψ(m) and records σ₁(m) only for the full-subgroup convention. Define H_m as the image of T_m under the finite map S→Z(p) and check its independence of the scalar representatives and its determinant component, which is multiplied by the class of m. Apply flat pullback and proper pushforward with the projection formula for weighted cycles; transport under conjugation and characteristic-zero base change through ModularCurvesPartII §§8.4–8.5.

**Checks.**

- ψ(m) is the number of cyclic subgroups of order m in (Z/mZ)²: ψ(4)=6, ψ(6)=12 and ψ(9)=12, checked by direct enumeration.

- T_m is invariant under the diagonal PGL₂(F_p) action and under swapping the factors, because the dual of a cyclic isogeny of degree m is cyclic of degree m.

- For m=4 the cyclic degree is 6, whereas the full order-4 correspondence has degree σ₁(4)=7.

- For m=1 the normalized correspondence is the diagonal and pull-push is the identity.

- m divisible by p is outside this torsion-isomorphism correspondence; multiplication by p gives zero on p-torsion.

*Needs:* §0.2; ComplexKahlerGeometry K3 and K6.1, gap:analytic-cycle-current-transport; ComplexComparisonPartII §C5.4; FuchsianOrbifolds Layers 2 and 5; ModularCurvesPartII §§9.10, 9.13 (composition and projective cyclic boundary correspondence); ModularCurvesPartII §§5.7, 5.13, 6.1, 8.5; SchemeAndStackFoundations §5.2; ModularCurvesPartII §8.4 (`complexConjugationComparison`).

### Examples

At p=7 one fixed-pairing quotient fibre has 168 points; the diagonal represents (E,E,[id]), and inversion exchanges the two elliptic factors. The degrees ψ(4)=6 and ψ(9)=12 distinguish cyclic kernels from all finite kernels.

### Dependencies

The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 1: Compact modular metrics and systoles

### 1.1 Compact triangle uniformization

For prime p>5 the typed triple of elliptic orders (3,2,p) is hyperbolic, since 1/3+1/2+1/p<1 exactly when p>6. The pinned `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup` then supplies the orientation-preserving hyperbolic triangle group Δ(2,3,p)⊂PSL(2,ℝ) of a counterclockwise triangle with angles π/3, π/2, π/p, cofinite and isomorphic to `TauCeti.TriangleGroup 3 2 p` by the pinned `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv` of that triangle. It is unique up to conjugation in PSL(2,ℝ), because such a triangle is determined by its angles up to orientation-preserving isometry; §1.2 chooses a normalized conjugate. Define γ_p:PSL₂(Z)→Δ(2,3,p) as the inverse of `TauCeti.ModularGroup.triangleGroupEquiv`, followed by `TauCeti.TriangleGroup.lift` from `TauCeti.TriangleGroup 3 2 0` to `TauCeti.TriangleGroup 3 2 p` of the generators x, y, z (they satisfy the relations, the cusp relation being empty), followed by that isomorphism. It is surjective, because x and y generate `TauCeti.TriangleGroup 3 2 p`, and since `TauCeti.ModularGroup.triangleGroupEquiv` sends z to T⁻¹, γ_p sends the standard cusp translation U=T to the image of z⁻¹, an order-p rotation. This subsection adds the identification of the quotients: Δ(2,3,p)\H is the orbifold with underlying X(1) and cone orders (2,3,p), and for Ξ(p)=γ_p(Γ(p)) the compact quotient Ξ(p)\H is torsion-free and is a selected component of X(p). Its deck group is PSL₂(F_p); obtain the other component by the projective-frame transport. The cusped quotient Γ(p)\H and compact quotient Ξ(p)\H have distinct universal covers/maps. (BT16 Opening of §3, before §3.1, pp. 717–718; BT16 line 360.)

One proof route proceeds as follows. Use Fuchsian polygon and orbifold-covering theory for angles π/2,π/3,π/p, whose sum is <π exactly when p>6. Identify the compactification map on orbifold fundamental groups: kill the pth power of a peripheral generator. Its normal closure is contained in Γ(p), yielding the finite deck quotient. Use ModularCurvesPartII §6.1 for the algebraic compactification and ComplexComparisonPartII for comparison; prove torsion-freeness of Ξ from the actual level cover and its local ramification.

**Checks.**

- p=7 is hyperbolic; p=2,3,5 has spherical signature and cannot enter this metric argument. In reciprocals, 1/3+1/2+1/7=41/42<1, while 1/3+1/2+1/5=31/30>1, so the pinned realization theorem does not apply at p=5.
- The pinned presentation sends z to T⁻¹, so γ_7(T) is the image of z⁻¹, the rotation at the order-7 vertex inverse to its vertex transformation: T⁷ lies in the kernel of γ_7 and T does not, since that rotation has order exactly 7. Reading the presentation as sending z to T would make γ_p(T) the vertex transformation itself, the inverse rotation.

*Needs:* §0.1; `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`; `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv`; `TauCeti.TriangleGroup.lift`; `TauCeti.ModularGroup.triangleGroupEquiv`; FuchsianOrbifolds Layer 0; FuchsianOrbifolds Layer 1; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 4; ComplexComparisonPartII §§C2.2, C4.1–C4.5; InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; ComplexComparisonPartII §C6.2; ModularCurvesPartII §6.1; ModularCurvesPartII §4.7.

### 1.2 Triangle coordinates and deformation matrices

Normalize the order-2, p and 3 vertices to i, i y_p and e^(iθ_p). Then y_p=p/π+O(p⁻¹), θ_p=π/3+O(p⁻¹). Equivalently choose θ=π/p, c=cos θ, b=(1+√(1−4sin²θ))/2 and U_p=[[c,b],[b−1,c]], S=[[0,−1],[1,0]], L_p=S U_p⁻¹ S⁻¹. Their projective classes satisfy S²=U_p^p=(S U_p)³=1. The classes of SU_p, S and U_p⁻¹ are the vertex transformations of the counterclockwise triangle with vertices e^(i(π−θ_p)), i and i y_p, the fixed points of SU_p, S and U_p. That triangle is the reflection of the one above in the imaginary axis; the two share the side from i to i y_p, so they have the same triangle group. The pinned `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv` of that triangle, at the typed triple (3,2,p), therefore sends x, y, z to the classes of SU_p, S and U_p⁻¹. It is the normalized faithful triangle representation of Δ(2,3,p), conjugate in PSL(2,ℝ) to every realization of §1.1; with it, γ_p(U) is the class of U_p and γ_p(S) that of S. As p→∞, U_p→[[1,1],[0,1]] and L_p→[[1,0],[1,1]]. Here y_p=√(b/(1−b)). (BT16 §3.2, p. 719; BT16 line 427.)

The defining construction has the following API.

- The displayed U_p and L_p have determinant one.

- S²=−I, U_p^p=−I and (SU_p)³=−I for the chosen real lifts.

- U_p fixes i√(b/(1−b)) and S fixes i.

- U_p^a=cos(aθ)I+(sin(aθ)/sin θ)(U_p−cos θ I) for every integer a.

- An orientation-preserving change of marked triangle conjugates the matrices and preserves distances and traces.

- Complex conjugation reverses the marking and transports the corresponding component; the algebraic model base changes before complex uniformization.

One proof route proceeds as follows. Use the hyperbolic cosine rule for the triangle, or compute fixed points of these matrices. det U_p=c²−b(b−1)=1 and tr(SU_p)=1 verify the three orders. Choose the branch b>1/2 for p>6, so the cusp vertex lies above i. Compare with the canonical triangle by the uniqueness of its angles and marked orientation. Taylor expansion gives 1−b=π²/p²+O(p⁻⁴); derive y_p and the third vertex. Conjugate the normalization for another component rather than choosing a second metric.

**Checks.**

- At p=7, y_p=√(b/(1−b))≈1.7251 agrees with the root of y+1/y=1/sin(π/7) given by the cosine law; at p=101, (1−b)p²/π²≈1.0006.

- S²=U_p^p=(SU_p)³=−I hold for the displayed real matrices (checked numerically at p=7).

- At p=7 the square root is real and y_p>1.

- At p=5, 1−4sin²(π/5)<0, excluding this hyperbolic normalization.

- As p→∞, U_p tends to the ordinary cusp translation; U_p itself is elliptic of finite projective order p.

- Direction of the vertex transformations at p=7: the order-3 vertex is e^(i(π−θ_7)) with (π−θ_7)/π≈0.5889. The reflection in the side from i to i y_7 followed by the reflection in the side from i y_7 to that vertex agrees with U_7⁻¹ at the points 0.3+2i, −1+i/2 and 2+3i to within 10⁻¹⁵, and differs from U_7 there by up to 4.06. The transformation at e^(i(π−θ_7)) agrees with SU_7 to the same precision and differs from (SU_7)⁻¹ by up to 2.14. So the pinned isomorphism sends z to U_p⁻¹, not to U_p.

*Needs:* §1.1; `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv`; FuchsianOrbifolds Layer 2; `Matrix.ProjGenLinGroup`; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 1.3 A systolic witness surviving cusp filling

For sufficiently large prime p write p=3r+x with x∈{1,2}. The integral matrix M_p=[[1+xp,3p],[p(2−x²+2px)/3,1+2p²−xp]] belongs to Γ(p), has trace 2p²+2, and its image under the compact triangle representation has absolute trace (27/(4π²))p²+O(p). Thus its image in Ξ(p) is hyperbolic and nonidentity. Its cusped and compact geodesic lengths are both 4 log p+O(1), giving the required upper bounds for geodesics nontrivial after cusp filling. (BT16 Lemma 5, p. 718; BT16 line 392.)

One proof route proceeds as follows. Verify integrality, determinant one and reduction to I. With U(t)=[[1,t],[0,1]] and L(t)=[[1,0],[t,1]], factor M_p=−L(2r)U(3)L(−r−1)U(3) if x=1; if x=2 use L(2r+1)U(−3)L(−r−1)U(1)L(1)U(1). These are exact integer identities. Substitute U_p,L_p into each word. The two large lower powers divided by p converge to ±(√3/(2π))N with N=[[0,0],[1,0]], and have bounded remainder. The fixed-power words converge to U(±3), or U(1)L(1)U(1). The leading traces in both cases are 27/(4π²). The triangle length formula 2 arcosh(|tr|/2) proves nontriviality in the compact group and the length asymptotics. This replaces the published witness U(p)L(−p), which is killed by cusp filling.

**Checks.**

- At p=7, r=2 and x=1, the word −L(4)U(3)L(−3)U(3) equals [[8,21],[35,92]]. Its determinant is 8·92−21·35=1, its trace is 100=2·7²+2, and its reduction modulo 7 is I.

- At p=11, r=3 and x=2, the word L(7)U(−3)L(−4)U(1)L(1)U(1) equals [[23,33],[154,221]]. Its determinant is 23·221−33·154=1, its trace is 244=2·11²+2, and its reduction modulo 11 is I.

- In the two deformed words the leading traces are respectively 9α² and −α²(−9), with α=√3/(2π); both equal 27/(4π²)≈0.683918>0. The integer examples do not give a universal threshold for hyperbolicity after filling.

*Needs:* §1.2; §1.1; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 1.4 Cusped systole with the filling condition

Let ρ_Y be half the infimum of cusped lengths of closed geodesics whose loops remain nontrivial in X(p). Then ρ_Y=2 log p+O(1). The ordinary nonperipheral cusped systole also has length 4 log p+O(1). The factor one-half is part of the radius convention. (BT16 §3.1 and Lemma 5, p. 718; BT16 line 392.)

One proof route proceeds as follows. If M=I+pA has determinant one then tr M=2−p²det A, hence tr M≡2 mod p². Every hyperbolic M∈Γ(p) has |tr M|≥p²−2 and length at least 4 log p−O(1). Use the preceding surviving witness for the matching upper bound in the smaller class of loops remaining nontrivial after filling.

**Checks.**

- Every γ∈Γ(p) has tr γ≡2 mod p²; the values 2−p² (for U(p)L(−p)) and 2+2p² (for M_p) both occur.

- At p=7 the minimal hyperbolic |trace| in Γ(7) is 47, of translation length 2arcosh(47/2)≈7.70, against 4 log 7≈7.78.

*Needs:* §1.3; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 1.5 Embedded cusp balls and cusp separation

In the compact metric, distinct cusps have distance at least 2 log p−C. A ball of radius log p−C around a cusp is an embedded hyperbolic disc built from its incident triangle tiles. C is independent of p and the selected component. (BT16 Lemma 6, p. 720 (tiling set up on p. 719); BT16 line 450.)

One proof route proceeds as follows. Use the triangle coordinates to bound the distance from the p-vertex to its opposite side by log p−O(1). The cusp has p fundamental domains Δ₂,₃,ₚ around it, that is 2p incident triangles of Σ, each of angle π/p at the cusp, so their angles fill 2p·π/p=2π and give the full local disc in X(p). Disjoint interiors of the cusp-star tiles imply separation. Transport between components with the G-action. This estimate precedes the global injectivity-radius lower bound.

**Checks.**

- d(i,iy_p)=log y_p=log(p/π)+o(1), so the cusp star has radius log p−O(1); the two cusps iy_p and i/y_p exchanged by the order-2 rotation about i are 2 log y_p apart.

- At p=7 each triangle of Σ has angle π/7 at the cusp vertex: seven incident triangles fill only an angle π, while the fourteen triangles of the seven incident fundamental domains fill 2π. A cusp star counted with p triangles would leave a half-disc uncovered.

*Needs:* §1.2; §1.1; FuchsianOrbifolds Layer 2.

### 1.6 Compact and cusped metric comparison

On Y(p), with r(x)=distance in h_X to the nearest cusp, tanh²(r(x)/2) h_Y(x)≤h_X(x)≤h_Y(x). For every R>0, on the part r≥R the length distortion is at most coth(R/2)=1+O(e^(−R)), and the pulled-back area distortion obeys the squared bound. (BT16 Proposition 7, p. 720; BT16 line 457.)

One proof route proceeds as follows. Holomorphic inclusion Y→X decreases the Kobayashi metric, giving the upper inequality h_X≤h_Y. Lift the maximal cusp-free compact disc around x, compare the disc’s complete metric at its centre, and apply Schwarz–Pick. Separate quadratic-form comparison from length comparison.

**Checks.**

- Near a cusp the lower comparison degenerates; no uniform compact isometry is asserted for Hecke maps.

*Needs:* §1.1; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 1.7 Compact injectivity radius with repeated cusp visits

For each component of X(p), ρ_X=2 log p+O(1), where ρ_X is half the shortest noncontractible closed-geodesic length. In particular the shortest length is 4 log p+O(1), rather than 2 log p+O(1). (BT16 Corollary 8, p. 720; BT16 line 469.)

One proof route proceeds as follows. The surviving witness gives the upper bound. For a shortest compact geodesic γ of length L≤4 log p+C, use disjoint embedded cusp discs of radii R_b=(1/2)log p and inner radii R_s=(1/4)log p. Every connected visit to an outer disc reaching its inner disc costs at least 2(R_b−R_s), so there are O(1) deep visits, counting repeated visits to the same cusp. Outside the inner discs, the metric comparison costs O(e^(−R_s)L)=o(1). For each deep arc lift to its embedded hyperbolic disc, use cosh r(s)=cosh r_min cosh(s−s₀), and integrate coth(r(s)/2)−1 on r≥1 to obtain a uniform O(1) error. Replace any r<1 part by a unit-circle arc; its cusped length is O(1) by the metric comparison. The resulting loop in Y is homotopic to γ in X and has cusped length ≤L+O(1). It is neither contractible nor peripheral in Y because its filled class is nontrivial. Apply the cusped lower bound. The argument counts visits and does not use the source’s unsupported at-most-one-cusp assertion.

**Checks.**

- At p=101 the leading terms are ρ_X=2 log(101)+O(1)=9.23024+O(1) and L=4 log(101)+O(1)=18.46048+O(1); using L=ρ_X halves the leading geodesic length.

- A shortest geodesic making two deep visits is handled by two bounded errors, not ruled out by assertion.

*Needs:* §1.3; §1.4; §1.5; §1.6; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry; FuchsianOrbifolds Layers 2 and 4.

### 1.8 Cusp coordinates and Hecke enlargement

For a width-p cusp use q=exp(2πiz/p). The horoball Im z>y, y>1/p, gives an embedded disc D_y of Euclidean radius exp(−2πy/p), contained in B_X(c,2 artanh(exp(−2πy/p))). For log p+C<R<2 log p−C one has B_X(c,R)⊂D_(O(pe^(−R))). For p∤m and log p+C<R with R+log m<2 log p−C, the inverse cyclic Hecke image of B_X(c,R) lies in the union of balls B_X(c_i,R+log m+C) at the corresponding cusps. (BT16 §3.2, display (2)–(3) and Lemma 9, p. 721; BT16 lines 494–527.)

One proof route proceeds as follows. Compare the punctured q-disc and its filling by Schwarz–Pick and the compact metric inequality; use the hyperbolic radial distance to invert the radius estimate. At a prime-to-p isogeny branch the imaginary part changes by a factor between m⁻¹ and m. Apply the q-coordinate estimate at every inverse cusp, including the boundary component map.

**Checks.**

- At p=101 and y=1/2, |q|<exp(−π/101)≈0.969374 and 2 artanh(exp(−π/101))≈4.163618, so the corresponding compact-ball radius is approximately 4.163618. For the degree-two branches z↦2z and z↦z/2, y changes to 1 and 1/4, giving q-radii approximately 0.939686 and 0.984568 respectively; the smaller height gives the larger disc, in the direction of the +log 2 enlargement within its stated range.

*Needs:* §1.5; §1.6; §1.7; §0.6; FuchsianOrbifolds Layer 3; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry; ModularCurvesPartII §4.8.

### Examples

The matrices M₇=[[8,21],[35,92]] and M₁₁=[[23,33],[154,221]] have determinants 1 and traces 100 and 244. The limiting compact trace coefficient is 27/(4π²); the detailed witness calculation below treats the two residue classes separately.

### Dependencies

Statement prerequisites from other layers: §0.1, §0.6. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 2: Small-height lifts and cusp repulsion

### 2.1 Integral height uses the existing entrywise norm

For an integral or real 2×2 matrix the paper’s height is max_(i,j)|M_ij|, exactly Mathlib’s entrywise supremum norm after the standard scalar embedding. It is not the operator or Frobenius norm. Use this existing norm with h(MN)≤2h(M)h(N), h(M⁻¹)=h(M) in SL₂, and entrywise bounds for integral minors. (BT16 §3.3, p. 721; BT16 lines 533–534.)

One proof route proceeds as follows. Read Matrix.norm_eq_sup_sup_nnnorm at the pin, fix its local entrywise instance, and specialize to Fin 2. Use the two-term multiplication formula and the adjugate inverse. These comparisons provide the arithmetic convention; no competing general matrix-height theory is defined.

**Checks.**

- The all-ones 2×2 matrix J has entrywise height 1, while its Frobenius norm and its ℓ² operator norm both equal 2; a height defined by either of those norms would double this value.

- For M=[[2,1],[1,1]]∈SL₂(Z) the inverse is the adjugate [[1,−1],[−1,2]], so h(M⁻¹)=h(M)=2; outside SL₂ the identity fails, since diag(2,1) has height 2 and inverse of height 1.

- J²=2J has height 2=2·h(J)·h(J), so the product bound h(MN)≤2h(M)h(N) is attained and its factor 2 cannot be dropped; for M=N=I it reads 1≤2.

*Needs:* `Matrix.norm_eq_sup_sup_nnnorm`; `Matrix.norm_apply_le_norm`.

### 2.2 Short elliptic displacement has a small integral lift

Fix the image ι of i, or the image ϖ of the order-3 triangle vertex, in one component. For fixed 0<δ<1/2 and large p, a component-preserving g with d(ι,gι)<δρ_X (respectively d(ϖ,gϖ)<δρ_X) has a representative γ_p(M) modulo Ξ with M∈SL₂(Z) and h(M)≤C_δp^(4δ). No nonsquare component-switching element is represented by an SL₂(Z) reduction on this component. (BT16 Lemma 10 and the remark after it, p. 722; BT16 line 539.)

One proof route proceeds as follows. Compare the triangle chart to the cusped chart over the relevant small ball and use the compact-radius estimate. For M=[[a,b],[c,d]], Im(Mi)=1/(c²+d²) and Re(Mi)=(ac+bd)/(c²+d²); the hyperbolic distance formula and ad−bc=1 bound all four entries by O(e^(2R)). Take R=δρ_X. Repeat in the fixed order-3 chart.

**Checks.**

- For M=[[a,b],[c,d]]∈SL₂(Z), cosh d_H(i,Mi)=(a²+b²+c²+d²)/2, so h(M)≤(2cosh R)^(1/2), well within the O(e^(2R)) bound used; for M=[[2,1],[1,1]] the displacement is arcosh(7/2).

- The bound concerns component-preserving deck elements only; a component-switching element of PGL₂(F_p) is not γ_p(M) for any M∈SL₂(Z).

*Needs:* §1.2; §1.6; §1.7; §2.1; ModularCurvesPartII §3.14.

### 2.3 A nearby lifted cusp has a small-height description

Fix the lift i y_p of a cusp c₀ and its order-p triangle stabilizer H. For fixed 0<δ<1/2 and large p, any lift z of a cusp c with d(i y_p,z)≤(1+δ)ρ_X can be written z=σ γ_p(M)i y_p for σ∈H and M∈SL₂(Z), h(M)=O_δ(p^(4δ)). (BT16 Lemma 11(a), p. 722; proof p. 723; BT16 line 578.)

One proof route proceeds as follows. Cusp separation puts the lens between the two large cusp discs near the relevant triangle-star edges. Choose an adjacent order-2 vertex, move it by σ, and apply the elliptic small-height lift. The marked adjacent cusp is recovered by the triangle combinatorics.

**Checks.**

- The representation z=σγ_p(M)·iy_p is not unique: M may be replaced by MU^k for any integer k, since γ_p(U) fixes iy_p; the statement asserts that some representative has small height.

*Needs:* §1.5; §1.2; §2.2; §1.7; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 2.4 Cusp displacement controls a stabilizer double coset

Under the same hypotheses, if d(c₀,gc₀)≤(1+δ)ρ_X for a component-preserving deck element g, then modulo Ξ, g∈H γ_p(M) H for some integral SL₂ matrix of height O_δ(p^(4δ)). The two H factors cannot be omitted. (BT16 Lemma 11(b), p. 722; proof p. 723; BT16 line 578.)

One proof route proceeds as follows. Lift a shortest path from c₀ to gc₀ beginning at i y_p. Apply the lifted-cusp theorem to its endpoint. The ambiguity in each marked lift is exactly its cusp stabilizer, producing the left and right H factors.

**Checks.**

- Both stabilizer factors are needed: for nontrivial σ,σ′∈H, the element σγ_p(M)σ′ need not lie in γ_p(M)H or in Hγ_p(M).

- For γ∈H itself, d(c₀,γc₀)=0 and M=I works.

*Needs:* §2.3; §1.1.

### 2.5 Counting close lifts of a different cusp

For fixed 0<δ<1/8 and sufficiently large p, distinct cusps c₀,c in one component and a fixed lift z₀ of c₀ admit at most C_δp^(16δ) lifts z of c with d(z₀,z)≤(1+δ)ρ_X. Within any ball of radius strictly less than ρ_X there is at most one lift of a fixed point. The larger radius requires the counting assertion. (BT16 Lemma 11(a), pp. 722–723, and Proposition 12(a), pp. 723–724; the count follows from the small-height description with both stabilizer factors retained.)

One proof route proceeds as follows. Move z₀ to i y_p. By §2.3 each candidate has form σ^aγ_p(M)i y_p with h(M)≤C_δp^(4δ). Cusps have labels v∈𝔽_p²∖{0} modulo ±1. If M has first column (m₁₁,m₂₁), the label is (m₁₁+a m₂₁,m₂₁). The height bound and 4δ<1 imply that m₂₁=0 modulo p forces m₂₁=0 as an integer; determinant one then forces m₁₁=±1 and the cusp is c₀. Thus for c≠c₀, m₂₁ is nonzero modulo p. Its value fixes the possible sign of the prescribed label and then fixes a modulo p uniquely. There are O(p^(16δ)) four-entry integral matrices of the stated height, which suffices without counting their determinant equation. For radius <ρ_X two distinct lifts would have distance <2ρ_X, contradicting the systolic displacement bound for the torsion-free compact covering group.

**Checks.**

- At p=101 put b=3, c=68 (so 3c=2 mod101), a=10 and σ=γ_p(U). The two vertices σ^aSσ³S·iy_p and σ^(a−c)Sσ^(−3)S·iy_p have cusp labels (29,3) and −(29,3), and are distinct lifts of the same cusp. Each is at distance approximately 9.1321 from iy_p. A uniqueness assertion at radius (1+δ)ρ_X would exclude this family incorrectly.
- For a fixed M with m₂₁≠0, equality of the two labels forces (a−a′)m₂₁=0, hence a=a′ mod p. If m₂₁=0, this inference fails and the label is that of c₀, which the statement excludes.
- The identity deck transformation has displacement 0; every nonidentity compact covering transformation has displacement at least 2ρ_X. Thus two lifts in a ball of radius r<ρ_X would give 2ρ_X≤distance<2r<2ρ_X.

*Needs:* §2.3; §2.1; §1.1; §1.7; ModularCurvesPartII §4.7.

### 2.6 Cusp-ball intersections are unions of small lenses

For sufficiently small fixed δ>0 and large p, distinct cusps c₀,c satisfy B(c₀,(1/2+δ)ρ_X)∩B(c,(1/2+δ)ρ_X)⊂⋃_i B(u_i,δρ_X+C), with at most C_δp^(32δ) balls. Each u_i is the image of the midpoint from a fixed lift z₀ of c₀ to a lift z_i of c with d(z₀,z_i)≤(1+2δ)ρ_X. Each such midpoint is within O(δρ_X)+O(1) of an order-two triangle vertex adjacent to z₀. Constants are uniform in the cusps. (Corrected form of BT16 Proposition 12(b), p. 723, BT16 line 621, which puts the intersection in a single ball of radius δρ_X+O(1); here it is a union of at most C_δp^(32δ) lens balls, and the first Check below is the witness against a single ball. Ingredients: BT16 Lemma 11(a) and its tiling argument, pp. 722–723; Lemma 13, pp. 724–725. The quotient intersection retains every lifted lens.)

One proof route proceeds as follows. Lift a point of the intersection to x̃ at distance less than (1/2+δ)ρ_X from z₀ and choose z_i at that distance from x̃. Apply §2.5 at parameter 2δ to count the possibilities. For each possibility use the hyperbolic midpoint-lens bound and d(z₀,z_i)≥ρ_X−O(1). The cusp-star tiling puts the midpoint within O(δρ_X)+O(1) of an adjacent order-two vertex; it does not identify all these vertices in the quotient.

**Checks.**

- The two lifts in §2.5 at p=101 give midpoints approximately 8.8444 apart in the hyperbolic plane. For this family their separation is 2log p−O(1); a nonidentity deck displacement cannot bring the midpoints into a single ball of radius δρ_X+C for sufficiently small δ and large p.
- With s=tanh(R/2), the midpoint lens is contained in the hyperbolic ball of radius 2artanh√s. At R=1 this radius is approximately 1.657454, allowing a fixed additive constant; for large R its excess over R tends to log 2.
- An empty intersection has zero lens components. A point lying in one lifted lens needs one ball; the formula permits several distinct components and does not identify their centres.

*Needs:* §2.5; §1.5; §1.7; §1.2; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### 2.7 A cusp-ball overlap count

There are absolute A,δ₀>0 such that for fixed 0<δ<δ₀ and large p, every x∈X(p) lies within (1/2+δ)ρ_X of at most C_δp^(Aδ) cusps in its component. (BT16 Proposition 12(c), p. 724, and its short-height argument, p. 725; the exponent records all lifted lens choices.)

One proof route proceeds as follows. If two distinct cusps occur, select one lifted lens containing a lift of x. Its midpoint is near a marked order-two vertex by §2.6. For each additional cusp select the lens with the first cusp through the same point; this supplies an adjacent order-two vertex within O(δρ_X)+O(1) of x. All these vertices are close to the first selected vertex. Apply §2.2 and count the four integral entries of its small representatives. Each adjacent triangle vertex has a bounded number of incident cusp vertices. Absorb the fixed parameter enlargements into the absolute exponent A. Multiple possible lifts add a polynomial factor in p^δ, without requiring a single quotient lens.

**Checks.**

- A cusp itself is within (1/2+δ)ρ_X of exactly one cusp for sufficiently small δ and large p, by cusp separation. A point outside every such ball has count zero.
- For a height bound H=p^(A₀δ), there are at most (2⌊H⌋+1)⁴ four-entry matrices, hence O(p^(4A₀δ)); multiplying by p^(32δ) still has exponent proportional to δ. A fixed numerical exponent cannot be inferred without retaining these enlargements.

*Needs:* §2.6; §2.2; §2.3; §2.1; §1.5.

### Examples

The two lifts at p=101 have the same cusp label but different lens midpoints. For a fixed small matrix, its nonzero lower-left entry determines the rotation index; retaining all small matrices gives a polynomial count in p^δ.

### Dependencies

Statement prerequisites from other layers: §1.2, §1.6, §1.7, §1.5, §1.1. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 3: Heegner and bicusp arithmetic repulsion

### 3.1 Small equations reconstruct a signed Hecke locus

Fix A. A unique invertible projective 2×2 solution over F_p of integral linear equations with coefficients bounded by p^(Aδ) has a primitive integral representative Q of height p^(O_A(δ)), for sufficiently small δ and large p. Put m=|det Q|; then p∤m. If det Q>0 its Smith form gives a cyclic degree-m holomorphic isogeny; if det Q<0, composition with the fixed real reflection gives the corresponding conjugate Hecke locus after complex realization. On cusp data the two cases give the respective ordinary or conjugate Hecke boundary incidence. Uniqueness does not determine the sign, and multiplication by −1 cannot change it. (BT16 Proofs of Lemma 15 (pp. 726–727), Proposition 17 case (2) (p. 728) and Proposition 18 case 2(2) (p. 731); BT16 line 718.)

One proof route proceeds as follows. Uniqueness of an invertible projective solution forces a one-dimensional kernel for p>3: in a projective line of matrices the determinant is a quadratic, so an invertible point would give at least p−1 invertible projective points. Thus the modular rank is three. A nonzero rank-three minor and its cofactors give the kernel vector. All relevant rank-four minors are bounded by p^(O_A(δ))<p, so their vanishing modulo p implies vanishing over Z; the same rational kernel is one-dimensional. The cofactor vector is nonzero modulo p and has the required height. Divide out the gcd; reduction is still the same invertible projective matrix, so p∤det Q. Keep the sign. Positive determinant is automatic only in the definite CM centralizer application. For negative determinant factor Q as a positive-determinant matrix times the integral reflection diag(1,−1). Use Smith normal form for the primitive positive lattice map. For a negative map use the conjugate complex structure and ModularCurvesPartII §8.4, `complexConjugationComparison`, then the same positive Smith form. Check the p-gon toric and component factors separately at the boundary; the sign is the ordinary versus conjugate Hecke distinction.

**Checks.**

- A negative determinant lift gives an antiholomorphic correspondence and is not silently called a Hecke isogeny.

*Needs:* §2.1; ModularCurvesPartII §1.3; ModularCurvesPartII §9.13 (projective cyclic boundary correspondence); ModularCurvesPartII §8.4 (`complexConjugationComparison`).

### 3.2 The distinct-Heegner centralizer equations have rank three

Fix one marked elliptic vertex v, with integral lift t₀=[[0,1],[−1,0]] or [[0,1],[−1,−1]] of its stabilizer. Fix C>0 and sufficiently small δ>0, then take p sufficiently large. Let a be an invertible projective matrix commuting with the reduction of t₀, and let M_x,M_y∈SL₂(ℤ) satisfy h(M_x),h(M_y)≤C p^(8δ). Assume the points (v,a⁻¹v) and (γ_p(M_x)v,a⁻¹γ_p(M_y)v) are distinct Heegner points of the same elliptic type in the component presentations, at distance less than 2δρ_X; choose compatible lifts of their common automorphisms. For these matrices, the simultaneous linear equations in Q∈M₂(𝔽_p), t₀Q=Qt₀ and t₀M_y⁻¹QM_x=M_y⁻¹QM_x t₀, have solution space of dimension at most one over F_p for sufficiently small δ. For the second t₀ use t₀²+t₀+I=0 and det(aI+bt₀)=a²−ab+b²; for the first use a²+b². (BT16 Lemma 15 and its proof, pp. 726–727; BT16 line 718.)

One proof route proceeds as follows. The first centralizer is the two-dimensional span of I,t₀. If the second relation is redundant, M_x,M_y normalize that quadratic algebra. Small-height congruences lift the trace/determinant polynomial to Q. The positive-determinant rational normalizer of the imaginary quadratic algebra is its centralizer; the conjugating coset has negative determinant. Integral determinant-one centralizer elements are the finite Gaussian or Eisenstein units, hence stabilize the corresponding elliptic vertex. This contradicts distinctness of the two Heegner points.

**Checks.**

- For t₀=[[0,1],[−1,0]] the centralizer is {aI+bt₀} with determinant a²+b², whose determinant-one integral elements are the four units ±I, ±t₀; for t₀=[[0,1],[−1,−1]] the determinant is a²−ab+b² and there are six units ±I, ±t₀, ±t₀².

- The rational normalizer of the centralizer contains elements of negative determinant, such as diag(1,−1) for the order-4 case; only positive-determinant normalizing elements are forced into the centralizer. With M_x=M_y=I the two equations coincide and their kernel has dimension 2; the two Heegner points then coincide, so the required distinctness excludes this negative control.

*Needs:* §2.2; §3.1; §0.3; §2.1.

### 3.3 Heegner-only repulsion

There are absolute δ₀,A>0 such that for fixed 0<δ<δ₀ and sufficiently large p, two distinct points of CM⁺ with the same image in X(1)² and intersecting radius-δρ_X max-product balls both lie on one T_m with m≤C_δp^(Aδ), p∤m. There is no corresponding conclusion with T_m for CM⁻. (BTE Erratum Proposition 2.1, p. 2 (§2 begins p. 1); BTE line 47.)

One proof route proceeds as follows. Move the first pair to a marked elliptic vertex and its commuting projective element. For CM⁺ the normalizer representative is h₀=1; no integral lift of the nonidentity normalizer coset is used. Lift both short displacements, apply the centralizer rank bound, and reconstruct a small positive determinant representative in the definite quadratic algebra. Apply cyclic-isogeny reconstruction to both framed pairs. Transport the statement under the full component action.

**Checks.**

- Two distinct Heegner points over the same pair of CM points that both lie on the diagonal T₁ satisfy the conclusion with m=1.

- Conjugating the second coordinate carries the close CM⁺ pair into CM⁻ and its ordinary locus into a conjugate locus; these anti-Heegner points lie on no ordinary prime-to-p Hecke locus, although the two kinds of loci can meet elsewhere.

*Needs:* §3.2; §3.1; §2.2; §0.3; §0.6.

### 3.4 Conjugate Hecke loci are real analytic

In the same smooth real product, let c₂ be complex conjugation on the second factor and put T̄_m=c₂(T_m). This is a real analytic locus whose graph branches on the elliptic open are antiholomorphic local biholomorphisms and hence totally real for the original product complex structure. At a ramified boundary branch a complex tangent is possible. No positive-dimensional complex analytic curve is contained in this locus: every branch meets the elliptic open and the boundary is finite. It is not an algebraic or complex analytic divisor. Conjugation transports CM⁺ to CM⁻ and Heegner repulsion to these loci. No intersection number C·T̄_m is defined here. (BTE Erratum §1, p. 1, and §4.1, p. 3; BTE line 11.)

The defining construction has the following API.

- (x,y)∈T̄_m iff (x,conj y)∈T_m with the corresponding component labels.

- Applying c₂ twice recovers T_m. Canonical conjugation of projectively framed moduli commutes with G; in a fixed analytic marking include the deck correction to the bare reflection. Thus T̄_m is invariant under the diagonal G action, with the specified component transport.

- c₂ transports every max-metric tube isometrically. As a map to X×conj(X) it is holomorphic and preserves the positive area form of that conjugate product; the image of a complex curve is not treated as complex in the original product.

- Nearby CM⁻ pairs lie on one T̄_m, by conjugating the CM⁺ result.

- Degree costs come from the original holomorphic Hecke pull-push, not from an intersection with T̄_m.

- Transport under a complex embedding uses the algebraic Hecke base-change comparison, followed by conjugation.

- A primitive negative-determinant rational matrix, factored through the fixed integral reflection, represents the conjugate cyclic Hecke locus of index |det|, including its p-gon boundary data and determinant component.

One proof route proceeds as follows. Take the set image under the antiholomorphic isometry in one factor. Keep the conjugate complex structure explicit when applying the imported conjugate-diagonal volume estimate. Define neighborhoods by the transported max metric; retain complex curves and their original complex orientation for area integration. Use ModularCurvesPartII §8.4, `complexConjugationComparison`, to make the component and conjugation comparisons; §8.5, `genericBaseChangeAndLevelCompatibility`, transports the algebraic Hecke data. The underlying algebraic Hecke correspondences base change, while this real analytic construction is made only after complex realization.

**Checks.**

- T̄₁ is the graph of complex conjugation on X(p); its tangent planes contain no complex line, and it meets the complex curve T₁ along the points fixed by conjugation.

- For a degree-two cusp branch q₂=q₁², the conjugate graph is q₂=conj(q₁)². At q₁=0 its tangent is the complex line ℂ×{0}; away from zero, the derivative v↦2conj(q₁)conj(v) is nonzero and the graph is totally real.

- On the lift to H×H, the branch of T̄₁ through the fixed reflection R(z)=−z̄ is {(z,−z̄)}: the pair (1+i,−1+i) lies on it and (1+i,1+i) does not, whereas (1+i,1+i) lies on the diagonal branch of T₁. A definition that forgot c₂ would accept the second pair.

- Applying c₂ to (1+i,1+i) gives (1+i,−1+i), and applying it again returns (1+i,1+i). Conjugating both factors instead sends (1+i,1+i) to (−1+i,−1+i), again on the diagonal: two-factor conjugation preserves T₁ and does not produce T̄₁.

*Needs:* §0.6; §0.3; §3.3; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons; §3.1; ModularCurvesPartII §8.4 (`complexConjugationComparison`); ModularCurvesPartII §8.5 (`genericBaseChangeAndLevelCompatibility`).

### 3.5 Hecke curves avoid anti-Heegner CM points

For p∤m one has T_m∩CM⁻=∅. The genuine cyclic isogeny intertwines the compatible automorphism on tangent spaces, so the CM signs agree. This does not imply that distinct anti-Heegner points repel in the ordinary Hecke sense. (BT16 Remark 16, p. 727; erratum §1, p. 1; BT16 line 747; BTE §§1–4, pp. 1–4; BTE lines 11, 104, 139.)

One proof route proceeds as follows. An ordinary Hecke point in CM must have both elliptic curves of the same CM type: different imaginary-quadratic endomorphism algebras cannot be isogenous. Over C identify the two j=1728 curves, or the two j=0 curves, by an isomorphism. The isogeny becomes an element of the commutative CM endomorphism ring, hence intertwines the automorphisms with equal tangent eigenvalue. The opposite automorphism cannot induce the same torsion intertwining when p>3 and the isogeny is prime to p. A nonzero complex-linear derivative preserves the chosen CM tangent eigenvalue, excluding the opposite character.

**Checks.**

- On E=ℂ/ℤ[i], an ordinary CM endomorphism [a+bi] commutes with [i], so equal-frame lifts have Lie eigenvalues (i,i). Replacing the second by [−i] changes its frame matrix by −1; equality would require [2i]=0 on E[p], impossible because [2i] has degree 4 and is invertible on E[p] for p>3. This proves the sign exclusion without any distance claim.

*Needs:* §0.3; §0.6; ModularCurvesPartII §1.2; ModularCurvesPartII §1.3.

### 3.6 Three-bicusp repulsion with both determinant signs

There are δ₀,A>0 such that for fixed 0<δ<δ₀ and large p, if a point of S is within (1/2+δ)ρ_X of at least three distinct singular bicusps, every SBC point in that ball lies on one ordinary or conjugate Hecke locus of index m≤C_δp^(Aδ), p∤m. Two bicusps do not force the reconstruction. The positive-Hecke-only formulation is not used: its proof has an uncontrolled determinant sign, and the worked examples give a negative-reflection cusp example. Moreover the original point is within Aδρ_X+C_δ of that signed locus and each of its coordinates has distance at least (1/2−Aδ)ρ_X−C_δ from every cusp. These strengthened outputs use the same height reconstruction, not a new repulsion premise. (BT16 Proposition 17 and its proof, pp. 727–728; BT16 line 751.)

One proof route proceeds as follows. Use cusp double cosets, retaining their two stabilizer factors, to encode each nearby bicusp as a prescribed image of a point of P¹(F_p). If only at most two distinct source points are specified, the small integral upper-triangular lift argument leaves at most two bicusps. Three distinct prescribed projective-line images determine Q up to scalar. Cofactors give the small primitive integral representative, retaining both determinant signs. Its invertible reduction makes p∤|det Q|. For positive determinant use the ordinary cyclic isogeny boundary; for negative determinant compose with the fixed reflection and use the conjugate boundary. The same reconstructed Q satisfies every nearby bicusp condition, so all lie on the same signed locus. No unproved orientation assumption is inserted. With at least three bicusps, the cusp-normalizer argument forces at least two distinct cusp coordinates in each factor. Separation then bounds the distance from every cusp below by (1/2−O(δ))ρ_X. Choose a lifted lens in each factor from §2.6. It puts that factor within O(δρ_X)+O(1) of an order-two vertex; distinct choices are retained in the reconstruction count. Move those vertices to (ι,gι); the same small signed matrix representing g gives a point of the signed Hecke correspondence within O(log h(Q))=O(δρ_X), using h_X≤h_Y and the positive Smith form or its reflected version. This places the original point in the thin signed tube on the cusp complement.

**Checks.**

- Over 𝔽₇, fixing the prescribed images 0↦0 and ∞↦∞ leaves the six maps t↦a t with a∈𝔽₇×. Adding 1↦1 forces a=1 and leaves one map. Two prescribed images therefore leave freedom that a third distinct image removes.

- For p≡1 mod4 and a²=−1, the nearby cusp pairs (v,av) have negative-reflection type; they do not lie on T_m with m<p−1.

*Needs:* §0.4; §2.4; §2.5; §2.6; §3.1; §0.6; §3.4; §1.5; §1.6; FuchsianOrbifolds Layer 2.

### Examples

For the Gaussian elliptic lift, det(aI+bt)=a²+b²; for the Eisenstein lift it is a²−ab+b². A negative reflection has determinant −1, so the three-cusp reconstruction retains the conjugate branch.

### Dependencies

Statement prerequisites from other layers: §2.1, §2.2, §0.3, §0.6, §0.4, §2.4, §2.5, §2.6, §1.5, §1.6. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 4: Big diagonal overlap and reconstruction

### 4.1 Big diagonals and small Hecke curves

For g∈G define Δ_g={(gx,gy,x,y):(x,y)∈S}⊂S². For p∤m define τ_(g,m)=Δ_g restricted to (x,y)∈T_m. In the max-product distance, B(Δ_g,R) is exactly the locus d(x₁,gx₂)<2R and d(y₁,gy₂)<2R. Here Δ_g has complex codimension two in S²; multiplicity along it means the sum of local curve-point multiplicities at its finite intersection, not a Cartier divisor intersection. Also define the real analytic signed companion τ̄_(g,m) by restricting Δ_g to T̄_m. Only τ_(g,m) is a holomorphic small Hecke curve. (BT16 §4.4, p. 728; BT16 line 804.)

The defining construction has the following API.

- Membership is x₁=gx₂ and y₁=gy₂ simultaneously.

- A radius-R tube is described by the two strict inequalities with threshold 2R.

- Swapping slots sends Δ_g to Δ_(g⁻¹) and transports the restricted Hecke locus.

- τ_(g,m) is the graph of g on the actual holomorphic T_m.

- Independent changes a,b of slot frames relabel g as a g b⁻¹; simultaneous changes conjugate g.

- Graphs and their Hecke restrictions commute with base change and conjugation.

- τ̄_(g,m) consists of the points of Δ_g whose last pair lies in T̄_m; its metric tube is defined although it is not a complex curve.

One proof route proceeds as follows. Use the graph of the diagonal action on both coordinates. Midpoints of the two coordinate geodesics prove the factor-two tube formula; the triangle inequality proves the converse. Restrict the same graph to the imported T_m. Check group relabeling on both slots, inversion on slot swap, and the component restrictions explicitly. Algebraic loci commute with characteristic-zero base change; after complex realization conjugation transports graph, Hecke index and max distance.

**Checks.**

- For g≠h, Δ_g∩Δ_h consists of points over pairs (x,y) fixed by h⁻¹g, so distinct big diagonals meet only over the finite branch locus CM⁺∪CM⁻∪SBC.

- Δ_g is a surface in the fourfold S², so a curve meets it in finitely many points unless it lies in it.

- Δ₁ imposes both equalities; imposing x₁=x₂ alone gives the wrong codimension.

- τ_(g,1) is a curve inside Δ_g, rather than the whole surface Δ_g.

- If each matched coordinate has distance 3R/2, the point is in the radius-R graph tube despite not satisfying a threshold R test.

- The conjugate m=1 restriction is real analytic and is not assigned a Cartier divisor class.

*Needs:* §0.2; §0.6; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry; ComplexKahlerGeometry K3 and K6.1, gap:analytic-cycle-current-transport; ComplexComparisonPartII §C5.4; §3.4.

### 4.2 Quadratic centralizers give only logarithmically many small elements

For a nonscalar rational 2×2 matrix N whose algebra Q[N] is reduced, the determinant-one integral elements in its centralizer with entrywise height ≤p^A have O_A(log p) possibilities, uniformly in N and its embedding. A nonreduced quadratic algebra is the unipotent case and must be returned to the cusp branch. Scalar common centralizers impose no rigidity and must be eliminated by additional intertwining equations. (BT16 Proposition 18 proof, Case 2 part (1), pp. 730–731; BT16 line 884.)

One proof route proceeds as follows. In the imaginary quadratic case integral norm-one eigenvalues are roots of unity, leaving an absolute bound. In the split rational case they are rational algebraic integer units, hence ±1. In the real quadratic case log of the absolute first eigenvalue embeds the norm-one unit group modulo a finite kernel into R. The trace of a nontrivial positive unit is an integer ≥3, giving a uniform positive separation for the logarithms. An eigenvalue has absolute value ≤2h(M), so only O_A(log p) separated values occur. If the minimal polynomial has a repeated root, isolate its nilpotent part and its rational fixed line; this is the cusp/unipotent configuration, where the logarithmic count is not claimed.

**Checks.**

- Upper unipotent matrices of height p^A have polynomially many parameters and are excluded from this logarithmic conclusion.

*Needs:* §2.1; §3.1.

### 4.3 Diagonal-overlap dichotomy

There exist absolute constants A,C,δ₀>0 such that for fixed 0<δ<δ₀, all sufficiently large p and ξ∈S², membership in more than C log p distinct tubes B(Δ_g,δρ_X) forces one of: (a) ξ is within (1/2+Aδ)ρ_X+C of a point of SBC×SBC; (b) ξ is within Aδρ_X+C of an ordinary small Hecke curve τ_(g,m) or its real analytic conjugate companion τ̄_(g,m) with m≤C_δp^(Aδ). All constants are independent of the curve integrated through ξ. (BT16 Proposition 18 and its proof, pp. 728–731; BT16 line 814.)

One proof route proceeds as follows. Near a cusp in one coordinate, cusp separation forces all relevant deck transformations into one cusp-stabilizer coset. Cusp height and normalizer arguments put the other coordinate near a cusp with the same stabilizer, giving (a). Away from all deep cusp neighborhoods, move to nearby marked elliptic vertices and lift each short displacement. Distinct lifts give pairs of small integral conjugacy equations. If the common quadratic algebra is reduced and nonscalar, the uniform unit count gives O(log p). A nilpotent relation returns to the cusp branch. In the scalar-centralizer case reconstruct the unique small integral projective intertwiner from at most three relations. Its determinant is nonzero but can have either sign: use the positive lattice map for τ_(g,m), or factor the reflection and use τ̄_(g,m). The displacement bounds use h_X≤h_Y and the corresponding conjugate isometry.

**Checks.**

- At p=101 let a=(c,c) be a singular bicusp and ξ=(a,a). Each of the 101 elements of its cusp stabilizer gives a distinct Δ_g through ξ, hence 101 tubes contain ξ for every positive radius. The distance to SBC×SBC is 0, realizing alternative (a); the threshold comparison is 101>C log(101), where C log(101)≈4.615121 C.

*Needs:* §4.1; §2.2; §2.4; §1.5; §2.7; §3.1; §4.2; §3.6; §3.4.

### 4.4 Quantitative cusp-rotation overlap

In the cusp branch of the overlap proof the relevant g lie in a single order-p stabilizer coset. At distance d>0 from its fixed cusp, the number moving a coordinate less than 2R is at most C min(p,1+p sinh(R)/sinh(d)). For a fixed pair of projected bicusp centres a₁,a₂ in the cusp-branch decomposition, the transformations carrying a₂ to a₁ form one order-p stabilizer coset. The short-displacement comparison can be made in either slot separately, by taking inverses; use the farther of that slot’s two cusp coordinates, so d=d_S(z_i,a_i). With R=O(δρ_X), this gives O(1+p^(1+Aδ)e^(−d)) for d≥1 and O(p) for d<1. At d=0 use p directly. The weaker shell bound with an exponential O(δρ_X) loss is sufficient for diagonal multiplicity. (BT16 Proposition 18(a), p. 729; end of Case 1, pp. 729–730; BT16 line 827.)

One proof route proceeds as follows. Attach the two projected bicusp centres from the cusp-branch lift. The deck transformation sends the source centre to the target centre. Fixing a pair leaves a coset of the source stabilizer, of order p. Two short transformations in this coset differ by a rotation with O(δρ_X) displacement. Apply this to the source slot and, by inversion, to the target slot. The radius R₀+O(δρ_X)<ρ_X ensures the short lifts agree. For a rotation through 2πk/p in an embedded hyperbolic disc, compute sinh(distance(z,g^kz)/2)=sinh(d)|sin(πk/p)|. Count the equally spaced angles satisfying this inequality and include the identity by the additive 1. The two coordinate inequalities only reduce the count. For R growing like δlog p, retain sinh(R); replacing it by R is unjustified. Absorb exp(O(δρ_X)) in p^(Aδ) after all constants are fixed.

**Checks.**

- At R=10, sinh R≈11013.232875, whereas R=10; replacing sinh R by R loses a factor of about 1101.323. As R tends to zero, sinh R/R tends to 1, so only that limit permits the linear approximation.

- At p=7, d=1 and R=1/2, the displacements for k=0,1,2,3,4,5,6 are approximately 0, 0.980099, 1.645565, 1.961531, 1.961531, 1.645565, 0.980099. Exactly k=0,1,6 move by less than 2R=1; omitting the identity would count 2 instead of 3.

- At d=0 every rotation fixes the centre, so the count is p (7 at p=7); division by sinh d is not used there.

*Needs:* §4.3; §1.2; §1.5; §1.7; FuchsianOrbifolds Layer 2, gap:hyperbolic-trigonometry.

### Examples

The tube of the identity graph contains a pair with both coordinate distances 3r/2. At distance d=1 from an order-7 rotation centre and angular displacement 2π/7, sinh(D/2)=sinh(1)sin(π/7), fixing the angular normalization.

### Dependencies

Statement prerequisites from other layers: §0.2, §0.6, §3.4, §2.1, §3.1, §2.2, §2.4, §1.5, §2.7, §3.6, §1.2, §1.7. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 5: Four multiplicity bounds and cusped measures

### 5.1 Canonical degree and weighted multiplicity adapters

Use the imported effective curve cycles on X(p)^r. For a normalized map ν:D→X(p)^r, put Deg(ν_*[D])=deg_D ν* K_(X(p)^r)=Σ_j deg(pr_jν)(2g_X−2), with degree zero for a constant coordinate. Equivalently vol=2πDeg. Local multiplicities of a pushforward include the map degree over its image. Point-sums along a big diagonal and divisor intersection along a small diagonal remain different operations. (BT16 §1.3, p. 713; §6, p. 736; proof of Theorem 29, pp. 741–742; BT16 line 190.)

One proof route proceeds as follows. Apply the imported cycle normalization and weighted pushforward, then the canonical-area theorem coordinate by coordinate. Use the projection formula to identify algebraic and analytic degrees under ComplexComparisonPartII §§C2.2, C5.4. No area factor remains inside the algebraic largest-projection inequality.

**Checks.**

- The diagonal map D=X→X² has degree 2(2g_X−2).

- A q-fold cover of a curve image multiplies volume, degree and local pushforward multiplicity by q.

- A constant cusp coordinate contributes zero to the degree.

*Needs:* ComplexKahlerGeometry K3 and K6.1, gap:analytic-cycle-current-transport; ComplexComparisonPartII §C5.4; FuchsianOrbifolds Layers 2 and 5; ComplexComparisonPartII §C2.2; AlgebraicCurves Layer 12; SchemeAndStackFoundations §5.2; SchemeAndStackFoundations §§5.2–5.3.

### 5.2 Heegner multiplicity decay

Fix δ₁>0 small and then δ₂>0 sufficiently small in terms of δ₁. For all sufficiently large p and every effective one-cycle C⊂S with no Hecke component, mult_CM⁺(C)≤C_(δ₁,δ₂)(p^(−2δ₂)+p^(3δ₁−1))Deg(C). Thus for some η>0, uniformly in C, mult_CM⁺(C)=O(p^(−η)Deg(C)). (BT16 Proposition 25 and its proof, pp. 736–737; erratum §4.1, p. 3; BT16 line 1182; BTE §§1–4, pp. 1–4; BTE lines 11, 104, 139.)

One proof route proceeds as follows. Put d=p^(δ₁). Off the union of T_m with m<d, corrected Heegner repulsion makes the δ₂ρ_X balls disjoint after splitting the two elliptic types. Point-volume bounds cost a(δ₂ρ_X)⁻¹=O(p^(−2δ₂)). On the small Hecke union, use weighted Hecke pull-push and the ordinary diagonal volume bound, or its intersection corollary. The fixed-radius CM balls on the diagonal are disjoint, and a radius almost ρ_X/2 yields a p⁻¹ factor. Sum ψ(m)≪m² for m<d, giving d³. Choose 3δ₁<1 and η<min(2δ₂,1−3δ₁) before choosing p.

**Checks.**

- For d=4, ψ(1)+ψ(2)+ψ(3)=8≤1²+2²+3²=14<4³; only the upper bound Σ_(m<d)ψ(m)≪d³ is used, not cubic asymptotic growth.

- The order of choices matters: if δ₂ is not small relative to δ₁, two close CM⁺ points off the small Hecke union may lie on some T_m with m≥d, and the balls are no longer disjoint.

*Needs:* §5.1; §3.3; §0.6; §1.7; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons.

### 5.3 Anti-Heegner multiplicity decay

With independent small δ₁,δ₂ chosen as above, every effective non-Hecke one-cycle C⊂S satisfies mult_CM⁻(C)≤C_(δ₁,δ₂)(p^(−2δ₂)+p^(3δ₁−1))Deg(C) for all sufficiently large p. In particular it is O(p^(−η)Deg(C)) for a fixed η>0. This estimate does not use an intersection product with a conjugate Hecke locus. (BTE Erratum Proposition 4.1 and its proof, p. 3; BTE line 106.)

One proof route proceeds as follows. Split CM⁻ into points off and on the small T̄_m union. Isometric transport of the corrected repulsion gives the disjoint-ball estimate off that union. For points on T̄_m, apply the holomorphic Hecke pull-push to C and use fixed ε-balls at the CM⁻ points on the conjugate diagonal. Their volumes are bounded by the ε-tube volume. The imported conjugate-diagonal ratio gives V(ε)≤(sinh ε/sinh R)V(R), taking R approaching ρ_X/2 from below. This is O(p⁻¹) times the total cycle volume. The ratio is the reciprocal of the erratum’s misprinted line. Sum the O(d³) Hecke degree costs.

**Checks.**

- For fixed ε the volume factor sinh ε/sinh R is ≍p⁻¹ as R increases to ρ_X/2=log p+O(1); with the erratum's printed reciprocal it would grow like p.

*Needs:* §5.1; §3.4; §0.6; §1.7; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons.

### 5.4 The stronger singular-bicusp multiplicity bound

Choose δ₃>0 small first, independently of δ₁,δ₂. Then choose δ₁>0 so small that 3δ₁<2δ₃, and δ₂>0 a sufficiently small positive multiple of δ₁ as required by bicusp repulsion. For d=p^(δ₁), T=SBC∩⋃_(m<d)(T_m∪T̄_m) and S₀=SBC−T, every effective non-Hecke C⊂S satisfies mult_(S₀)(C)≪p^(−1−2δ₂)Deg(C) and mult_T(C)≪p^(−1−2δ₃+3δ₁)Deg(C). Consequently p mult_SBC(C)=O(p^(−η)Deg(C)) for any fixed 0<η<min(2δ₂,2δ₃−3δ₁). (BTE Erratum Proposition 4.2 and its proof, p. 4; BTE line 139.)

The analytic target includes the following global weighted cusp-ball estimate. For sufficiently small fixed ε>0 and all sufficiently large p, for every effective non-Hecke one-cycle D⊂S, and for Λ equal to the ordinary or conjugate diagonal, prove

    Σ_(ξ∈SBC∩Λ) vol(D∩B(ξ,(1/2+ε)ρ_X)) ≤ C_ε vol(D).

The constant is uniform in D and in its component weights. This is the global summation step used inside BTE Proposition 4.2, p. 4, rather than a consequence of the local lens bound alone. For the ordinary diagonal the non-Hecke hypothesis excludes its curve components; for the conjugate diagonal §3.4 excludes complex curve containment, including at the boundary. Retain all independent lens choices in both coordinates from §2.6. Off-diagonal pairs of midpoint centres need point-ball volume estimates as well as the ordinary or conjugate diagonal tube estimates; their enlarged volumes must be summed with their full overlap weights. This global estimate is a target of this subsection on the actual modular surface, with the local integration theory supplied by the stated contracts.

Given that estimate, signed three-bicusp repulsion makes the balls centred off the small-locus union overlap at most twice, giving p^(−1−2δ₂). For a point on a signed small Hecke locus, the holomorphic cyclic pull-push reduces to one of the two diagonal cusp sums above. The point-volume lower bound at radius (1/2+δ₃)ρ_X gives p^(−1−2δ₃)ψ(m)Deg(C). Summing ψ(m) for m<d gives p^(−1−2δ₃+3δ₁)Deg(C). Choose 3δ₁<2δ₃ and then δ₂ sufficiently small. Neither step identifies the two coordinate lens centres.

**Checks.**

- The output is p·mult_SBC=o(Deg), which absorbs order-p inertia.

- A bound mult≤p^(−9/10)Deg gives only p·mult≤p^(1/10)Deg, with a growing coefficient. A bound mult≤p^(−101/100)Deg instead gives p·mult≤p^(−1/100)Deg, with a decaying coefficient.

*Needs:* §5.1; §3.6; §2.6; §0.6; §1.7; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons; §3.4; §2.7; ComplexKahlerGeometry K6.1, gap:relative-point-ball-volume; §§5.2–5.3 (the two CM sign estimates); §3.3 (signed transport through §3.4).

### 5.5 Projectionwise cusped-volume measure

For a normalized effective curve cycle ν:D→X(p)^r define its cusped area measure as the weighted sum of the extensions of (pr_jν)*ω_Y over each nonconstant coordinate. A constant coordinate contributes zero, including a coordinate constantly equal to a cusp. At a nonconstant cusp preimage use the integrable punctured-disc density, with no point atom. The compact area measure is defined by the analogous sum with ω_X. Their difference is a positive finite measure. (BT16 Lemma 28, p. 738; BT16 line 1235.)

The defining construction has the following API.

- A nonconstant coordinate contributes the extension of the pulled-back punctured hyperbolic measure with zero point mass.

- Every constant coordinate contributes zero, including a constant cusp.

- Weighted effective cycles and coordinate sums add their measures.

- The total is Σ_j d_j Area(Y(p)).

- The cusped measure dominates the compact one.

- Normalization reparametrization, component transport and complex conjugation preserve the measure; algebraic base change precedes complex realization.

One proof route proceeds as follows. Use the imported cusp-pullback integration theorem. Locally q(t)=t^e u(t), e>0, gives an integrable density proportional to 1/(|t|² log²|t|); it is not evaluation of a singular two-form at a constant cusp map. Apply the compact-versus-cusped metric comparison to nonconstant coordinates. Linearity handles effective cycles and weighted maps. For each nonconstant projection of degree d_j the total areas are d_j times the total base-curve areas, by the finite-map integration formula; constant coordinates have d_j=0. All constructions are independent of normalization parameters.

**Checks.**

- For the diagonal curve t↦(t,t) in X(p)² the cusped and compact measures are twice the pulled-back areas of Y(p) and X(p), with total masses in ratio Area(Y)/Area(X)=1+s/(2g_X−2).

- The curve t↦(t,cusp) has exactly the first coordinate’s cusped measure, not an undefined infinite term.

- For q(t)=t² the radial cusp density pulls back to dr dθ/(r log²r); its mass on 0<r<ε is 2π/(−log ε), tending to 0 as ε tends to 0. It has no point atom. The boundary value |q|=1 is outside the cusp disc.

- A degree-q parametrization multiplies the pushforward measure by q.

*Needs:* §5.1; §1.6; ComplexKahlerGeometry K3 and K6.1, gap:analytic-cycle-current-transport; ComplexComparisonPartII §C5.4.

### 5.6 Uniform cusped-volume error

For every effective curve cycle C⊂X(p)^r and measurable A on its normalization, 0≤vol′(C∩A)−vol(C∩A)≤C₀p⁻¹ vol(C). On one component the index is p(p²−1)/2, the cusp count is s=(p²−1)/2, and g_X=1+(p²−1)(p−6)/24; thus Area(Y)/Area(X)=1+s/(2g_X−2)=1+O(p⁻¹). The estimate remains valid with constant cusp coordinates. (BT16 Lemma 28 and its proof, p. 738; §2.1, p. 714; BT16 line 1235.)

One proof route proceeds as follows. Use the projectionwise total-measure formula, since all component area ratios are equal. Orbifold area and local ramification give the index, cusp count and genus formulas. The total positive difference is O(p⁻¹) times compact volume. Its mass on any measurable subset is bounded by its total mass.

**Checks.**

- For p=7 the genus is 3, s=24 and the area ratio is 7, consistent with an asymptotic O(1/p) bound with a sufficiently large absolute constant.

*Needs:* §5.5; §1.7; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 4; ModularCurvesPartII §4.7; FuchsianOrbifolds Layer 5.

### 5.7 Hecke tubes away from cusps

Prime-to-p Hecke branches are local isometries for h_Y. Outside compact cusp balls of radius (1/2−Aδ)ρ_X, compact and cusped metrics have a uniform comparison sufficient to carry an O(δρ_X) compact Hecke tube to an O(δρ_X) cusped tube. Apply the Hecke pull-push and then replace cusped by compact volumes with the uniform O(p⁻¹) error. The resulting ordinary diagonal tube estimate requires that the projected curve have no Hecke component, so its pull-push has no diagonal component. For a conjugate Hecke tube use the same holomorphic pull-push followed by the imported relative conjugate-diagonal bound. It needs no false divisor intersection with the real analytic locus; the large-radius sinh denominator gives the same p^(−1) gain. (BT16 Proof of Proposition 27, pp. 738–739; BT16 line 1283.)

One proof route proceeds as follows. Uniformize a branch of the isogeny correspondence by a positive real Möbius transformation; it is an isometry of the cusped metric. Use the compact comparison and cusp-ball enlargement to ensure that each compared path stays in the allowed complement. Enlarge the constant A before fixing δ. Apply the finite correspondence integration formula and the relative-diagonal estimate to the weighted pull-push. Check the no-diagonal-component condition by tracing it back to the original Hecke locus.

**Checks.**

- Hecke maps are not asserted to be isometries of h_X.

- A projected Hecke component fails the no-diagonal-component hypothesis and cannot be fed into this estimate.

*Needs:* §0.6; §1.8; §1.6; §5.6; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons; §3.4; ModularCurvesPartII §1.3.

### 5.8 Big-diagonal multiplicity in the required non-Hecke setting

There exist η>0,C,p₀ such that for every prime p>p₀ and effective curve cycle C⊂S², if C has no component in any Δ_g and both projected cycles pr_i*C are nonconstant and have no Hecke component, then Σ_g mult_(Δ_g)(C)≤Cp^(−η)Deg(C). For the gonality pullback both projected cycles are nonconstant and non-Hecke. The non-Hecke projection hypothesis is distinguished by the T₁×T₁ example below, whose ratio tends to 3. (BT16 Proposition 27 and its proof, pp. 737–740; BT16 line 1224.)

One proof route proceeds as follows. Apply the imported double-diagonal point-volume estimate at radius δρ_X/2 and integrate the overlap dichotomy. The ordinary region contributes O(log p·p^(−δ))Deg(C). For the ordinary and conjugate small-Hecke regions apply the signed Hecke-tube comparison to weighted projected cycles. Use cosh and sinh normalization respectively. Only the ordinary case needs the projected non-Hecke hypothesis; both give p^(−1) with p^(Aδ) losses. For the bicusp region use the corrected rotation shell bound, signed three-bicusp repulsion, cusp-ball enlargement and the cusp count. Use gap:relative-point-ball-volume: V(r)≤C_n(1+r)exp(r−R)V(R) for 1≤r≤R−2 and R<ρ_X. Its Green-identity proof is in the worked examples; absorb its O(log p) factor by a smaller fixed positive decay exponent. Split the area form into its two surface projections before estimating cusp overlap. For each projection and each original-radius bicusp centre, the other projected centres number p^(O(δ)); a fixed pair gives one order-p stabilizer coset, bounded by the rotation estimate. Apply the point-ball comparison to the weighted projected curve. The sum of enlarged projected ball volumes is bounded by 2vol plus p^(−1+O(Bδ))vol: when at least three projected centres occur, strengthened signed reconstruction places the point in one thin signed Hecke tube on the cusp complement. The cusp count and cosh/sinh tube comparison give the bound. The strengthened reconstruction conclusion includes both proximity to the signed locus and separation from all cusps. Choose the enlargement constant B to dominate original-radius losses, then δ so small that O(Bδ)<1/2. This avoids an unjustified product-ball overlap inference from three-bicusp repulsion. All polynomial logarithmic factors are absorbed by a smaller decay exponent. The worked examples give the inequalities and their order of choices. Before p grows choose δ>0 small enough for every previous lemma and Aδ<1/4. The sum of log p·p^(−δ), p^(Aδ−1), p^(−δ/2) and p^(Aδ−1/2) is O(p^(−η)) for η<min(δ/4,1/4). The worked examples record a counterexample to the published unrestricted formulation.

**Checks.**

- For C inside T₁×T₁ with generic ample underlying curve, the unrestricted ratio tends to 3 and does not decay.

- For n=2 in the non-Hecke pencil construction, a generic fibre consists of two distinct points b₁,b₂. The birational map f:B→Z has f(b₁)≠f(b₂), so no Δ_g contains that tuple; each one-slot projection still dominates the non-Hecke image. Replacing the pair by (b₁,b₁) would put it on Δ₁.

*Needs:* §5.1; §4.1; §4.3; §4.4; §3.6; §2.7; §1.8; §5.7; §5.6; §0.6; ComplexKahlerGeometry K6.1, gap:hyperbolic-cycle-volume-comparisons; §3.4; ComplexKahlerGeometry K6.1, gap:relative-point-ball-volume.

### Examples

At p=7 the cusped-to-compact area ratio is 7, and its excess is 6=6/(p−6). The non-Hecke big-diagonal hypothesis is distinguished by the explicit T₁×T₁ ratio 3p/(p−6), equal to 21 at p=7.

### Dependencies

Statement prerequisites from other layers: §3.3, §0.6, §1.7, §3.4, §3.6, §2.6, §2.7, §1.6, §1.8, §4.1, §4.3, §4.4. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 6: Gonality pencils and normalized pullbacks

### 6.1 Symmetric powers of the quotient surface

For n≥1 specialize the projective finite quotient to SymⁿZ(p)=Z(p)^n/S_n, with its geometric-point cycle interpretation and characteristic-zero base-change compatibility. This uses a surface finite quotient, distinct from the curve symmetric powers of JacobianChallenge. At the point-set level it agrees with Mathlib Sym; its scheme structure and the cycle morphism are supplied by the finite-quotient contract. (BT16 Proof of Theorem 29, p. 741; outline in §1, p. 711; BT16 line 1395.)

The defining construction has the following API.

- An ordered n-tuple defines its unordered effective zero-cycle.

- Two geometric tuples have the same image exactly when related by a permutation, including repeated points.

- Invariant morphisms descend uniquely through the finite quotient.

- A finite flat degree-n family in Z yields its relative cycle morphism, with fibre multiplicities.

- On geometric points the quotient agrees with Mathlib Sym and its functorial map.

- Finite quotient, norm polarization and relative cycle morphism commute with characteristic-zero base change and conjugation.

One proof route proceeds as follows. Take the permutation action on the n-fold product and descend the norm of an ample bundle. Apply the supplied finite quotient with an invariant projective embedding. Apply gap:free-locus-and-relative-cycle to a finite flat degree-n family; its fibre lengths give the cycle morphism to the permutation quotient. Check characteristic-zero base change, product permutations and both determinant components; complex conjugation commutes with the algebraic quotient. Over ℂ its analytic quotient interpretation uses ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification.

**Checks.**

- Sym²Z is singular along the image of the diagonal of Z×Z, where the transposition fixes a codimension-two locus; it is still normal and projective.

- Over a cycle [z₁]+…+[z_n] with distinct points the fibre of Zⁿ→SymⁿZ has n! points; over n[z] it has one.

- Sym¹Z=Z; the permutation group is trivial.

- In Sym²Z the cycle 2[z] is retained and is fixed by the transposition.

- [z₁]+[z₂]=[z₂]+[z₁], but equals 2[z₁] only when z₁=z₂.

*Needs:* §0.2; SchemeAndStackFoundations §1.17 and gap:free-locus-and-relative-cycle; ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification; `Sym`; `Sym.map`; `Sym.map_map`; SchemeAndStackFoundations §1.17.

### 6.2 Reduction to the normalization of the image

A nonconstant map from a smooth connected curve B of gonality n to projective Z extends from its smooth completion and factors through the smooth projective normalization D of its integral image. One has gon(D)≤n, so it suffices to prove rigidity for a map birational onto its image. This includes nonproper B and maps of generic degree greater than one. (BT16 Proof of Theorem 29, first paragraph, p. 741; BT16 line 1393.)

One proof route proceeds as follows. Use properness to extend across the finitely many omitted points, and the normalization universal property to factor through D. For the generic finite map B̄→D push a degree-n pencil divisor to D. Its fibres are linearly equivalent by the norm of ratios of pencil functions. They vary, since a fixed finite support cannot contain the images of every fibre of a surjective finite map. The varying degree-n linear system contains a pencil, which after removing base points has degree ≤n. SchemeAndStackFoundations §3.5 supplies the section-norm identity on this finite locally free map; CanonicalModelsAndGonality §1.6 supplies the finite-map gonality inequality.

**Checks.**

- A degree-q map onto a rational image still reduces to gonality 1; do not assume the original map has degree one.

*Needs:* §0.2; AlgebraicCurves Layer 12; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization; SchemeAndStackFoundations §4.13 (finite normalization of integral curves); SchemeAndStackFoundations §3.5 (section norms and divisors).

### 6.3 The gonality-pencil cycle map

Let B be smooth projective connected, f:B→Z birational onto its image, and h:B→P¹ a finite degree-n gonality pencil, n≥1. The fibre cycles f_*h⁻¹(t), with scheme multiplicities, define φ:P¹→SymⁿZ. It is nonconstant and generically degree one onto its image. (BT16 Proof of Theorem 29, p. 741; BT16 line 1395.)

The defining construction has the following API.

- At t, φ(t) is the sum of f(b) with multiplicity e_b(h).

- The disjoint generic fibres of h have distinct cycles under a birational f.

- The map to its integral image has function-field degree one.

- Changing the pencil basis acts by the corresponding inverse automorphism on the parameter P¹.

- Finite-flat fibres and their cycle multiplicities commute with base change and conjugation.

- On an étale fibre the value is the ordinary unordered n-tuple in Mathlib Sym.

One proof route proceeds as follows. Apply the relative cycle map to the finite flat h and the graph of f. Finite maps of smooth curves are flat; ramified fibres carry their full local multiplicity. On a dense open where f is injective and h is étale, two distinct fibres have disjoint images, so their cycles cannot coincide. Thus φ is generically injective, and in characteristic zero it is birational onto its image. A change of basis in the pencil postcomposes h by PGL₂ and precomposes φ by its inverse, leaving the pulled-back covering construction isomorphic.

**Checks.**

- For a hyperelliptic B with its double cover h, φ(t) is the sum of the images of the two points over t, and over each of the 2g+2 branch points φ(t)=2[f(b)].

- For n=1, φ is the original rational curve map.

- Take B=P¹, n=1, h=id, and f the squaring map t↦t² followed by the normalization P¹→Z(p) of the diagonal component of H₁ (the j-line). Then φ=f has generic degree two onto its image and φ(1)=φ(−1), so the degree-one conclusion fails without birationality of f; the image reduction of §6.2 is applied first.

*Needs:* §6.1; §6.2; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; AlgebraicCurves Layer 12; SchemeAndStackFoundations §1.17 and gap:free-locus-and-relative-cycle.

### 6.4 A normalized pullback and its wreath stabilizer

Let W=G^n⋊S_n act on S^n and let q:S^n→SymⁿZ be its finite quotient. For φ as above normalize an irreducible component of P¹×_(SymⁿZ)S^n dominating P¹, obtaining a smooth projective connected curve C with ψ:C→S^n and finite α:C→P¹. If H≤W stabilizes the chosen component, the induced action on its normalization has C/H≅P¹. Remove its action kernel when discussing effective local inertia. The component and H are choices; degree-weighted conclusions are independent of them. (BT16 Proof of Theorem 29 and its diagram, p. 741; BT16 line 1397.)

The defining construction has the following API.

- α and ψ form the commuting square with φ and the actual finite quotient q.

- H is the component stabilizer inside G^n⋊S_n, with its induced normalization action.

- The effective quotient of C by H is P¹ and its quotient map is α.

- Another dominating component is a W-translate and has conjugate stabilizer.

- α is finite and C is smooth projective connected in characteristic zero.

- Under algebraically closed extension normalization and component choices transport after choosing a compatible geometric component; W-conjugate choices give the same estimates.

One proof route proceeds as follows. Use finite base change, existence and finiteness of curve normalization. The map ψ is generically birational to its image because φ is birational onto its image. Over the generic unramified locus, the finite quotient fibre is a single W-orbit and W permutes its irreducible components transitively. The stabilizer H acts transitively on the generic fibre in the chosen component, so its invariant function field is k(P¹). Normalize the quotient and identify it with P¹ by the smooth proper curve/function-field dictionary. For complex local inertia, identify q^an with the finite analytic quotient through ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification. Do not assume an unramified pullback at branch points.

**Checks.**

- Over the points of P¹ whose image avoids the branch locus of q the pullback is étale, so α:C→P¹ ramifies only over the finitely many remaining points.

- For n=1, H is the stabilizer in PGL₂(F_p) of a component of the preimage of the rational curve in X(p)×X(p).

- For n=1 the permutation factor disappears but G-inertia remains.

- For n=2 a transposition can fix a tuple with the two quotient points equal.

- A pullback meeting a branch point is normalized; it is not declared étale by the fibre-product notation.

*Needs:* §6.3; §0.2; §6.1; ComplexComparisonPartII C−1.3, gap:finite-group-quotient-analytification; AlgebraicCurves Layer 12; SchemeAndStackFoundations §1.17 and gap:free-locus-and-relative-cycle; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization; SchemeAndStackFoundations §4.13 (finite normalization of integral curves).

### 6.5 Weighted projection cycles and nondegeneracy

Assume the image of B is not Hecke. Define C_i=(pr_iψ)_*[C] and C_ij=(pr_ijψ)_*[C] as weighted effective one-cycles, with multiplicity equal to generic map degree times image multiplicity. Every C_i is nonconstant and has no Hecke component, and every C_ij is contained in no Δ_g. One has Deg(C)=Σ_i Deg(C_i) and Σ_(i<j)Deg(C_ij)=(n−1)Deg(C). These facts hold for the actual chosen component and its stabilizer. (BT16 Proof of Theorem 29, pp. 741–742; BT16 line 1407.)

One proof route proceeds as follows. Connectedness of B and the monodromy of its degree-n pencil make the component stabilizer transitive on the n slots. Each slot maps dominantly to B’s image in Z, so cannot be constant or Hecke if that image is non-Hecke. If C_ij lay in Δ_g then the corresponding quotient points in the generic fibre cycle would coincide. Generic h-fibres contain n distinct points and f is generically injective, excluding this. Apply the canonical-degree projection formula. Each slot occurs once in the first sum and n−1 times among unordered pairs. All multiplicity bounds use these pushforward cycles rather than reduced images.

**Checks.**

- For n=1 the pair sum is zero.

- For n=2 its sole pair cycle has Deg(C_12)=Deg(C).

- In the excluded two-slot configuration C=T₁×{a}, with a=(x,y) off T₁ and p=7, the first slot is Hecke and the second is constant. Its canonical degree is Deg(C)=2(2g_X−2)=8, while the second pushforward one-cycle is 0. The pair degree is still 8, but the nonconstant non-Hecke slot hypotheses fail, so the big-diagonal estimate does not apply.

*Needs:* §6.4; §5.1; §4.1; §0.6.

### Examples

A hyperelliptic pencil contributes a fibre 2[b] at each branch point, not a singleton of degree 1. At n=1 the permutation factor and all pair sums vanish; at n=2 the sole pair cycle has the total canonical degree.

### Dependencies

Statement prerequisites from other layers: §0.2, §5.1, §4.1, §0.6. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 7: Ramification decay and geometric rigidity

### 7.1 Exhaustive wreath ramification support

In the normalized pullback, every ramification point of α lies over either a CM⁺, CM⁻ or SBC point in some slot, or Δ_g^(ij) in two distinct slots for some g∈G. Here Δ_g^(ij) means simultaneous equality of both matched X coordinates. The list exhausts the finite wreath quotient inertia. (BT16 Proof of Theorem 29, p. 741; BT16 line 1412.)

One proof route proceeds as follows. A nonidentity stabilizer element with trivial permutation has a nonidentity G element in a slot, so the quotient branch-locus theorem gives a special point there. If the permutation is nontrivial, one of its moved slots is matched to another through a G transformation, producing Δ_g^(ij). A point with free ambient W action has étale quotient neighborhood and cannot acquire ramification merely by pullback and normalization. If the ambient stabilizer acts on several normalization branches, pass to the branch stabilizer; its effective action on the smooth curve gives the local ramification group.

**Checks.**

- For n=1 the list reduces to CM⁺, CM⁻ and SBC; for n=2 the transposition composed with (g,g⁻¹) fixes ξ exactly when (x₁,y₁)=g(x₂,y₂), that is ξ∈Δ_g^(12).

*Needs:* §6.4; §6.5; §0.5; §4.1; FuchsianOrbifolds Layer 1; InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; ComplexComparisonPartII §C6.2.

### 7.2 Cyclic local indices with only one p factor

For fixed n and prime p>max(5,n), effective local inertia of α is cyclic and has order ≤6n!p. If no slot is an SBC point its order is ≤6n!. The bound is linear in p, rather than p^n, even when several slots are bicusps. (BT16 Proof of Theorem 29, p. 741; BT16 line 1417.)

One proof route proceeds as follows. An effective finite automorphism group of a smooth complex curve fixing a point acts faithfully on its tangent line, so local inertia is cyclic. For an element of H, its n!th power has trivial permutation. Each remaining coordinate lies in a cyclic stabilizer of order dividing 2,3 or p. Their least common multiple divides 6p; without SBC it divides 6. The order of the element therefore divides 6pn! or 6n!, respectively. Normalization only replaces ambient inertia by a subgroup/quotient and does not enlarge this exponent.

**Checks.**

- Two order-p slot stabilizers contribute lcm(p,p)=p to a cyclic group, not p².

*Needs:* §7.1; §0.5; §6.4; FuchsianOrbifolds Layer 1.

### 7.3 Ramification is negligible against canonical degree

For fixed n and non-Hecke B as above, there are η_n>0,C_n,p_n such that Ram(α)≤C_np^(−η_n)Deg(C) for p>p_n. More precisely Ram(α)≪_n pΣ_i mult_SBC(C_i)+Σ_i(mult_CM⁺(C_i)+mult_CM⁻(C_i))+Σ_(i<j,g)mult_(Δ_g)(C_ij). (BT16 Proof of Theorem 29, items (1)–(3), pp. 741–742; BT16 line 1420.)

One proof route proceeds as follows. Use exhaustive support and the local-index bound, charging each ramified point at most a fixed n-dependent number of times. Each fibre cardinality is bounded by the corresponding branch multiplicity of the weighted projection cycle. Apply the two CM estimates, the stronger p-weighted bicusp estimate and the corrected big-diagonal estimate; the nondegeneracy theorem supplies all projected non-Hecke hypotheses. Use the degree sums and take the minimum of the finitely many positive exponents. Constants depend on n but not the particular curve or its map degree.

**Checks.**

- Replacing p mult_SBC=o(Deg) by mult_SBC=o(Deg) fails to absorb cusp inertia.

*Needs:* §7.1; §7.2; §6.5; §5.2; §5.3; §5.4; §5.8.

### 7.4 The two Hurwitz inequalities contradict each other

With D=Deg(C)>0, Riemann–Hurwitz for α is the exact equality 2g(C)−2=−2deg α+Ram(α)≤C_np^(−η_n)D. If d is the largest degree of the 2n coordinate maps C→X(p), then D≤2nd(2g_X−2), while Riemann–Hurwitz for that nonconstant projection gives 2g(C)−2≥d(2g_X−2)≥D/(2n). Choosing p so C_np^(−η_n)<1/(2n) is impossible. (BT16 Proof of Theorem 29, last paragraph, p. 742; BT16 line 1448.)

One proof route proceeds as follows. The canonical-degree adapter gives the sum of the 2n projection degrees. At least one is positive, and g_X≥2 for p>5. Apply the imported Riemann–Hurwitz theorem to α and independently to the largest nonconstant projection. Retain the negative −2deg α term in the equality and discard it only in the upper inequality. Choose a single threshold dominating every previously fixed exponent and constant; divide by D>0. The lower and upper bounds are incompatible.

**Checks.**

- For a degree-q unramified map to P¹ the formula gives 2g−2=−2q, not zero.

- No factor 4π appears in the algebraic degree comparison D≤2nd(2g_X−2).

*Needs:* §7.3; §6.5; §5.1; §1.7; FuchsianOrbifolds Layer 5; AlgebraicCurves Layer 7.

### 7.5 Bounded-gonality rigidity over C

For every positive integer N there is M_N^geom such that for every prime p>M_N^geom, every smooth connected complex curve B with gon(B)<N and every nonconstant morphism B→Z(p) factors through an irreducible component of H_m for some m≥1 prime to p. Gonality means that of the smooth proper model. The statement covers both determinant components. (BT16 Theorem 3, p. 710; Theorem 29, p. 740, proof pp. 741–742; BT16 line 1388.)

One proof route proceeds as follows. Reduce to the normalization of the image, with gonality still <N. If the image were non-Hecke, choose its degree-n pencil and the normalized pullback. Apply the Hurwitz contradiction for each 1≤n<N and take the maximum of the finitely many thresholds. For N≤1 no positive gonality occurs, so the statement is vacuous. Transport between the component presentations by the full projective group and the determinant-square-class comparison.

**Checks.**

- For N=1 no curve has gonality <1 and the statement is vacuous.

- The normalization of a component of H_m maps nonconstantly to Z(p) with Hecke image, consistent with the conclusion; the theorem says nothing about constant maps.

*Needs:* §6.2; §6.3; §6.4; §7.4; §0.2; §0.6.

### Examples

For the squaring map on the projective line, −2=2(−2)+2. For a degree-q unramified map to the projective line, Hurwitz would give −2q, so only q=1 is possible for a connected source. The negative term in the cover formula is retained.

### Dependencies

Statement prerequisites from other layers: §6.4, §6.5, §0.5, §4.1, §5.2, §5.3, §5.4, §5.8, §5.1, §1.7, §6.2, §6.3, §0.2, §0.6. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 8: Modular gonality and full linear monodromy

### 8.2 Proper subgroup indices grow at least like p

For every prime p and every proper subgroup H<SL₂(F_p), [SL₂(F_p):H]≥p. The same conclusion holds for proper subgroups of PSL₂(F_p). In particular the minimum proper-subgroup index tends to infinity. The proof uses the pinned transvection-generation theorem in `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600` and the elementary coset-action argument below.

One proof route proceeds as follows. If the coset index d were <p, the action SL₂(F_p)→S_d kills every nonidentity elementary transvection, because it has order p and S_d has no element of order p; the identity transvection acts trivially as well. The pinned Tau Ceti transvection-generation theorem then makes the coset action trivial. A transitive trivial coset action has one coset, contradicting properness. For PSL pull back a proper subgroup along the surjection from SL; its index is unchanged. This proof avoids a classification of finite simple groups or of maximal subgroups.

**Checks.**

- A Borel has index p+1, consistent with the bound. At p=2, SL₂(𝔽₂)=PSL₂(𝔽₂)≅S₃ and A₃ has index 2. At p=3 the inverse image of the normal four subgroup of PSL₂(𝔽₃)≅A₄ has index 3 in SL₂(𝔽₃), and that four subgroup has index 3 in PSL₂ itself. Thus the lower bound is attained at both small primes.

- The proof requires p>d; divisibility by p in d! is the exact obstruction. For H=SL₂(𝔽₅), the index is 1<5, so properness is essential. In the trivial rank-zero or rank-one special linear group the subgroup set has no proper member, which does not test the rank-two theorem. The field hypotheses exclude the zero ring and composite-modulus rings.

*Needs:* `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`; `Subgroup.index`; `Matrix.ProjectiveSpecialLinearGroup`.

### 8.3 Full SL₂ torsion monodromy on a bounded-gonality base

For each N>0, every nonisotrivial elliptic scheme E/U over C with gon(U)<N has actual p-torsion image SL₂(F_p) whenever p>max(5,800N/7). The determinant is exactly one after choosing a Weil-pairing basis, because all pth roots of unity are constant. Changing the basis conjugates the image and does not change this conclusion. (BT16 Remark after Theorem 2 and footnote 3, p. 710, BT16 lines 71–74 and 81–82; ABR96 Theorem 0.1, p. 1; the explicit constant follows from CanonicalModelsAndGonality §8.6 and §8.2 of this roadmap.)

One proof route proceeds as follows. Let H be the actual image. The level-frame torsor and moduli interpretation give a nonconstant classifying map U→Y_H, extending to the smooth proper modular quotient X_H. Its gonality is at most gon(U) by the generic finite-map gonality lemma. The effective image H̄≤PSL₂ gives a congruence quotient of index D. ModularCurvesPartII §6.1 identifies the analytification of the component of X_H containing the image with the compactified quotient X(Γ_H), and ComplexComparisonPartII §C1.9 identifies the rational functions of that component with the meromorphic functions of its compact Riemann surface; this is the isomorphism M(X(Γ_H))≅ℂ(X_H) that CanonicalModelsAndGonality §8.7 takes as a hypothesis. Through CanonicalModelsAndGonality §8.2 the gonality of that component is the analytic gonality of X(Γ_H), which CanonicalModelsAndGonality §8.6 bounds below by 7D/800. If H̄ is proper, D≥p and the imported 7/800 bound contradicts gon(U)<N. If H̄ is full but H is proper, the index of H in SL is at most two, contradicting the proper-index bound for p>3. Thus H is full. Do not replace actual image by projective or semisimplified image at the conclusion.

**Checks.**

- The constant-j case is excluded because its moduli map need not be nonconstant.

- An index-two lift of full projective image is explicitly ruled out.

*Needs:* CanonicalModelsAndGonality §§8.2 and 8.6–8.7; ModularCurvesPartII §6.1 (compact analytic–algebraic comparison); ComplexComparisonPartII §C1.9 (rational and meromorphic functions of a smooth proper complex curve); §8.2; §0.1; ModularCurves §5B; ModularCurves §5C; InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; AbelianSchemesAndArithmeticModuli A3.2; AbelianSchemesAndArithmeticModuli A3.5; AbelianSchemesAndArithmeticModuli A3.7; ModularCurvesPartII §3.9; ModularCurvesPartII §5.16.

### 8.4 An actual full-image representation has no quadratic self-twist

Let p>3 and ρ:Π→SL₂(F_p) be surjective. If a homomorphism χ:Π→𝔽_p× and an invertible linear A satisfy Aρ(γ)=χ(γ)ρ(γ)A for all γ, then χ is trivial. This is a statement about an actual intertwiner, not equality of projectivizations. (Perfectness input: `Matrix.SL2.commutator_eq_top`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`; the kernel and character argument is given below.)

No quadratic hypothesis on χ is needed: factoring through SL₂ and perfectness kill every scalar character satisfying this intertwining relation.

One proof route proceeds as follows. For γ in ker ρ the equation forces χ(γ)=1, since A is invertible. Hence χ factors through SL₂(F_p). Apply perfectness to the factored character. Scalar ambiguity in the choice of A is harmless; changing the basis conjugates the equation.

**Checks.**

- Projectivizing the equation erases χ and cannot prove its triviality. Over 𝔽₅, a generator of C₄ can act by diag(2,3), with χ(generator)=−1 and A=[[0,1],[1,0]]: both intertwining sides are [[0,3],[2,0]], so the nonsurjective case really has a self-twist. For Γ=SL₂(𝔽₅)×C₂ and ρ the projection, the sign on C₂ would force A=−A, impossible for invertible A at odd p. The zero matrix would satisfy the intertwining equations for every character and is excluded by A∈GL₂.

*Needs:* `Matrix.SL2.commutator_eq_top`; §8.3; `Matrix.ProjGenLinGroup.mk_eq_mk_iff`.

### Examples

The exact fraction (21/100)/24 is 7/800. A Borel in SL₂(𝔽₅) has index 6≥5. In SL₂(𝔽₅), a=2 has a²=4≠1 and supplies the perfectness witness; in 𝔽₃ every nonzero square is 1.

### Dependencies

Statement prerequisites from other layers: §0.1. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 9: Actual torsion, descent and characteristic-zero fields

### 9.1 The classifying map from actual torsion data

Let k be algebraically closed of characteristic zero, U/k a smooth connected curve, E,E′/U elliptic schemes and Ψ:E[p]≃E′[p] an isomorphism of finite étale F_p-module schemes. The triple gives a morphism f_Ψ:U→Z(p), with component determined by the Weil multiplier of Ψ modulo squares. Its projective class is used only to construct this map: the original Ψ remains part of the input. If E is nonisotrivial, f_Ψ is nonconstant. It extends uniquely from U to its smooth proper model because Z(p) is proper. (BT16 §1, pp. 709–711 (Theorems 1–3); §2.3, p. 715; BT16 line 278.)

The defining construction has the following API.

- An actual finite étale module isomorphism defines the descended coarse map.

- On a geometric fibre its value is (E_u,E′_u,[Ψ_u]).

- A simultaneous change of actual basis leaves the quotient map fixed.

- The determinant square class is the Weil-pairing multiplier modulo squares.

- Nonconstant j(E) forces a nonconstant classifying map.

- Restriction, algebraically closed extension and finite-type spreading commute with the classifying map and its compact extension.

One proof route proceeds as follows. Étale-locally choose a full level basis of E[p], transport it through Ψ and take the diagonal quotient. Independence of the basis makes these local maps descend. Projective rescaling of Ψ does not change f_Ψ, but may erase information needed for descent; retain Ψ separately. The first j-coordinate is the original j(E), so nonconstancy follows. Use the valuative criterion of properness on the missing points of the smooth proper base. This is a map to the compact coarse surface, not an assertion of good reduction at those points.

**Checks.**

- For E′=E and Ψ=[a] with a∈F_p^×, the map f_Ψ lands on H₁ for every a, since the projective class forgets scalars.

- At a geometric fibre with symplectic bases, p=7 and Ψ=diag(1,3) give Weil multiplier 3. The nonzero squares are {1,2,4}, so this fibre lies on the other determinant component; a simultaneous basis change cannot turn it into the identity component.

- For the Legendre family y²=x(x−1)(x−t) over P¹∖{0,1,∞}, the identity torsion isomorphism has first j-coordinate 256(1−t+t²)³/(t²(1−t)²). It has a pole at t=0, with j(2)=1728 and j(3)=21952/9, so its classifying map is nonconstant even though its image lies on H₁.

- A nontrivial quadratic twist gives a projective torsion identification but need not supply the Ψ required by this constructor.

*Needs:* §0.1; §0.2; ModularCurves §0D; ModularCurves §0E; InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; AbelianSchemesAndArithmeticModuli A1.6; AbelianSchemesAndArithmeticModuli A3.2; AbelianSchemesAndArithmeticModuli A3.7; ModularCurvesPartII §5.7; ModularCurvesPartII §3.9; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization.

### 9.2 The rank-one geometric Hom lattice

Let K=k(U) with k algebraically closed of characteristic zero. For a nonisotrivial elliptic curve E/K, End(E over an algebraic closure of K)=Z; in the pinned vocabulary, a Weierstrass model of E does not satisfy `WeierstrassCurve.HasGeometricCM`. If E′ is geometrically isogenous to E, then Hom(E,E′ over that algebraic closure) is a free rank-one Z-module. A primitive generator f has Galois conjugates σ(f)=χ(σ)f for a continuous character χ:G_K→{±1}. If some geometric isogeny has degree prime to p, then p∤deg f. (In characteristic zero the geometric endomorphism ring is Z or an order in an imaginary quadratic field: Sil09 Corollary III.9.4. Excluding the second case for nonconstant j, the rank-one Hom lattice and its sign character are this roadmap's steps toward BT16 Theorem 1, p. 710, BT16 line 58; BT16 line 75, p. 710, deduces Theorems 1 and 2 from Theorem 3 without giving them.)

One proof route proceeds as follows. Import finite generation and torsion-freeness of Hom and degree scaling. Once geometric End(E)=Z, choose any geometric isogeny h:E→E′. Composition g↦h∨∘g injects Hom(E,E′) into End(E): a homomorphism into the finite kernel of h∨ is zero because its source is connected. Its image contains the nonzero h∨h=[deg h], so this free Hom module has rank exactly one. No unproved rational-Hom-dimension assertion is imported. Spread any extra endomorphism and its defining equations to a finite cover of a finite-type model. Over C its locally constant action on the lattice, together with the period description, forces a fixed imaginary-quadratic period and hence constant j. Nonconstancy survives the faithfully flat spread, giving the contradiction. Galois acts on a free rank-one lattice by its two units. A generator and its negative are defined over a finite extension, so the character is continuous. If h=a f then deg h=a²deg f, which gives the prime-to-p assertion.

**Checks.**

- Constant-j CM curves are excluded: their geometric endomorphism ring need not be Z. Over K=k(t), the constant curve y²=x³+x has j=1728 and the geometric endomorphism (x,y)↦(−x,iy), whose square is [−1], so it is not an integer; only the nonisotriviality hypothesis excludes it.

- A primitive generator is determined up to sign. If h=af is an isogeny then deg h=a²deg f; if h is cyclic, |a|>1 would put E[|a|]≅(ℤ/|a|)² in its kernel and is impossible, so h=±f.

*Needs:* `WeierstrassCurve.HasGeometricCM`; AbelianSchemesAndArithmeticModuli A6.7; AbelianSchemesAndArithmeticModuli A6.1 and A6.6; AbelianSchemesAndArithmeticModuli A6.25; ModularCurves §0E; ComplexComparisonPartII §§C2.2, C4.1–C4.5; AbelianSchemesAndArithmeticModuli A3.1; AbelianSchemesAndArithmeticModuli A3.5; ModularCurvesPartII §1.2; ModularCurves §2C; SchemeAndStackFoundations §§0.8–0.9; `TauCeti.Isogeny.Hom.degree_zsmul`.

### 9.3 Hecke containment gives a geometric prime-to-p isogeny

Assume E is nonisotrivial. If its classifying map f_Ψ is contained in H_m with p∤m, then over an algebraic closure of K=k(U) there is a cyclic isogeny f:E→E′ of degree m whose restriction to p-torsion is a scalar multiple of the given isomorphism: f[p]=λΨ for some λ∈F_p^×. Consequently the primitive generator of the geometric Hom lattice has degree prime to p. (BT16 §2.5, p. 716; Theorem 1, p. 710; BT16 line 322.)

One proof route proceeds as follows. The finite normalized cyclic correspondence surjects onto H_m. Lift the geometric generic point of the image of U to it: this gives framed curves (E₁,φ₁),(E₂,φ₂) and a cyclic isogeny f₀:E₁→E₂ of degree m with f₀[p]φ₁ proportional to φ₂, together with isomorphisms a:E→E₁ and b:E′→E₂ identifying the triple (E,E′,[Ψ]) with (E₁,E₂,[φ₂φ₁⁻¹]). Put f=b⁻¹f₀a. It is cyclic of degree m and f[p]=λΨ for a scalar λ, because both sides induce the same projective map E[p]→E′[p]. Automorphisms of the nonisotrivial curves are ±1 and only change λ. The lift is defined over a finite extension of K; its descent to K is §9.4. Degree scaling in the rank-one Hom lattice gives the statement about the primitive generator.

**Checks.**

- For E′=E and Ψ=id the containment is in H₁ and f=id, λ=1.

- For E′=E/K with K a cyclic subgroup of order m prime to p and Ψ=π_K[p], the containment is in H_m and f=π_K, λ=1.

*Needs:* §9.1; §0.6; §9.2; AbelianSchemesAndArithmeticModuli A3.1; ModularCurvesPartII §9.13 (projective cyclic boundary correspondence).

### 9.4 Actual p-torsion removes the isogeny twist

Let K=k(U) with k algebraically closed of characteristic zero, p an odd prime, E/K nonisotrivial, and Ψ:E[p]≃E′[p] an actual G_K-equivariant F_p-linear isomorphism. If an isogeny f:E→E′ defined over an algebraic closure of K satisfies f[p]=λΨ for some λ∈F_p^× (as Hecke containment provides), then f is defined over K, so E and E′ are K-isogenous. No hypothesis on the image of the p-torsion representation is needed. (This descent is this roadmap's step toward BT16 Theorem 1, p. 710, BT16 line 58; BT16 line 75, p. 710, deduces Theorems 1 and 2 from Theorem 3 without giving it.)

One proof route proceeds as follows. For σ∈G_K the conjugate isogeny satisfies σ(f)[p]=σ∘(λΨ)∘σ⁻¹=λΨ=f[p], because Ψ is G_K-equivariant and λ is a scalar. By the rank-one geometric Hom lattice, σ(f)=χ(σ)f with χ(σ)=±1. Since f[p] is invertible and p is odd, χ(σ)f[p]=f[p] forces χ(σ)=1. Galois descent of morphisms descends f to K. The projective class of Ψ alone would not suffice: for a nontrivial quadratic twist E′=E^χ the geometric isomorphism f satisfies σ(f)=χ(σ)f, so f[p] is not a scalar multiple of any G_K-equivariant isomorphism, and the full-image argument of §8.4 is not needed on this route.

**Checks.**

- For a generic nonisotrivial E over C(t), a nontrivial quadratic twist has the same projective p-torsion for odd p and is not C(t)-isogenous to E.

- With E′=E, Ψ=[−1] and f=id one has f[p]=−Ψ, a scalar multiple, and f descends, as it must.

*Needs:* §9.2; §9.3; ModularCurves §0E; AbelianSchemesAndArithmeticModuli A6.7; AbelianSchemesAndArithmeticModuli A6.1 and A6.6; AbelianSchemesAndArithmeticModuli A6.34; SchemeAndStackFoundations §0.11; AbelianSchemesAndArithmeticModuli A6.20; `TauCeti.Isogeny.existsUnique_map_eq_iff_galoisFixed`; `TauCeti.Isogeny.Hom.degree_zsmul`.

### 9.5 Uniform rigidity over any characteristic-zero k

The geometric-rigidity threshold M_N^geom works unchanged for every algebraically closed characteristic-zero field k: for p>M_N^geom, every nonconstant map to Z(p) from a smooth connected k-curve of gonality <N has image in an irreducible component of some H_m with p∤m, and for the classifying map of an actual torsion isomorphism the cyclic isogeny with f[p]=λΨ of §9.3 exists over an algebraic closure of k(U). The quantifiers are uniform in k, the curves and the maps; no embedding of all of k into C is required. (BT16 Theorem 1, p. 710, BT16 line 58, fixes k before choosing M_N, and BT16 §2.1, p. 714, works over C only, BT16 line 206; the uniformity in k is the descent argument below.)

One proof route proceeds as follows. Descend the proper base, the open subset, the map to Z(p), a degree-n pencil with n<N, and any finite étale torsion data to one finitely generated subfield k₀⊂k. Preserve smoothness, nonconstant j and nonconstancy of the map after enlarging k₀. Embed k₀ in C and apply the complex theorem after algebraic closure. Containment in a particular closed Hecke locus H_m is equality of a pulled-back ideal with zero, hence descends by faithful flatness to the model over an algebraic closure of k₀ and then extends to k. Only the model field, rather than k itself, is embedded. After the closed Hecke containment descends, lift its geometric generic point through the finite cyclic correspondence over k itself. This supplies the cyclic isogeny with f[p]=λΨ without asserting that arbitrary analytic homomorphisms descend.

**Checks.**

- A field k of cardinality greater than that of C is permitted; only a finitely generated field is embedded.

- For the pulled-back ideal I of a fixed H_m, extension to k′ sends I=0 to 0 and I=(1) to (1). Faithful flatness detects vanishing in both directions, so a nonzero ideal cannot become zero after extension; the fixed Hecke containment descends.

*Needs:* §7.5; §9.1; ModularCurves §0E; ComplexComparisonPartII §§C2.2, C4.1–C4.5; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; ModularCurvesPartII §9.13 (projective cyclic boundary correspondence); ModularCurvesPartII §§5.7, 5.13, 6.1, 8.5; SchemeAndStackFoundations §§0.8–0.9.

### 9.6 Full linear monodromy over any characteristic-zero k

For every algebraically closed characteristic-zero field k, every integer N>0, every smooth connected k-curve U with gon(U)<N and every nonisotrivial elliptic scheme E/U, the actual p-torsion monodromy image is SL₂(F_p) for every prime p>max(5,800N/7), after a choice of basis with fixed Weil pairing. (BT16 Remark after Theorem 2 and footnote 3, p. 710, BT16 lines 71–74 and 81–82, over complex curves; the passage to every k is the descent argument below.)

The native function-field signature is `full_monodromy`. For a finite extension K of `RatFunc k` with compatible k-algebra tower, `gonality k K < N`, an elliptic Weierstrass curve W/K whose j-invariant is outside k, and a prime p with 5<p and 800N<7p, every additive automorphism of W[p](K̄) of determinant 1 is induced by some K-automorphism of K̄. Additive maps here are automatically ℤ/pℤ-linear. The Weil pairing makes every Galois action determinant one, so this surjectivity states equality with SL₂. The rank-two finite basis comes from elliptic p-torsion in characteristic zero; the total determinant's fallback value on modules without a finite basis is never used. For a good-reduction open U the generic torsion action factors through π₁(U) with the same image, identifying this signature with the family theorem. N=0 or N=1 has no function-field input of gonality <N.

One proof route proceeds as follows. Descend U, a degree-n pencil with n<N, E and a geometric base point to a finitely generated subfield k₀⊂k, preserving smoothness, connectedness and nonconstant j; embed k₀ in C. Apply §8.3 over C. Invariance of the geometric finite étale fundamental group under algebraically closed characteristic-zero extension identifies the actual monodromy images; equivalently the connected finite covers that detect the image stay connected. The descended pencil gives gonality at most n; the exact minimum need not be preserved.

**Checks.**

- The constant-j case is excluded, as over C.

- At N=2 the prime p=229 satisfies 800N=1600<7p=1603, while p=227 gives 7p=1589 and fails that threshold. The determinant-one identity is induced by the identity field automorphism. For a constant elliptic curve over ℂ(t), the Galois image on p-torsion is {I}, which misses the determinant-one matrix [[1,1],[0,1]]; this is excluded by nonconstant j.

*Needs:* §8.3; InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 (characteristic-zero base extension); InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; ModularCurves §0E; SchemeAndStackFoundations §§0.8–0.9; CanonicalModelsAndGonality §§1.1–1.7 and 9.1.

### 9.7 Geometric Frey–Mazur over the original base

For every integer N>0 there exists M_N such that, for every algebraically closed characteristic-zero field k, prime p>M_N, smooth connected quasiprojective k-curve U with gon(U)<N, and nonisotrivial elliptic schemes E,E′/U, an actual isomorphism E[p]≃E′[p] of finite étale F_p-module schemes implies an isogeny E→E′ over U. One may take any M_N≥max(M_N^geom,5); no bound on the image of the torsion representation is used. There is no claimed explicit numerical threshold. (BT16 Theorem 1, p. 710, BT16 line 58, for a fixed k; the threshold is independent of k by §9.5.)

One proof route proceeds as follows. Form the nonconstant classifying map, extend it to the smooth proper base and apply uniform geometric rigidity. The image lies on H_m for some p∤m, and the Hecke lift gives a geometric cyclic isogeny f with f[p]=λΨ. Apply actual-linear descent to f to obtain an isogeny over K=k(U). Extend it uniquely over the original U using the good-reduction Néron models. All thresholds depend only on N.

**Checks.**

- The output is defined over U, without a finite étale replacement of the base.

- The theorem assumes actual F_p-local systems and both families are nonisotrivial; it makes no assertion in positive characteristic or over Q at p>17.

*Needs:* §9.1; §9.5; §9.3; §9.4; AbelianSchemesAndArithmeticModuli A1.8, A3.1–A3.5; NeronModelsAndSemistableAbelianVarieties §§1.3, 1.8.

### 9.8 Equivalent geometric function-field formulation

Equivalently, for every N>0 there is M_N such that for K=k(B), k algebraically closed of characteristic zero, B a smooth proper connected curve of gonality <N, and nonisotrivial elliptic curves E,E′/K, an actual G_K-equivariant F_p-linear isomorphism E[p]≃E′[p] for prime p>M_N implies a K-isogeny. Restricting to a common good-reduction open and extending its finite étale torsion data gives the family statement; taking generic fibres gives the converse. (BT16 Theorem 2, p. 710, BT16 line 67, for a fixed k; the threshold is independent of k by §9.5.)

The acceptance signature is `geometric_frey_mazur`, using `gonality` from Conventions. It quantifies over N∈ℕ, with M chosen before k and K, then over every compatible one-variable function-field tower k⊂k(t)⊂K and elliptic Weierstrass curves W,W′/K with both j-invariants outside k. For prime p>M an additive isomorphism of the subgroups of geometric points killed by p, equivariant for every K-automorphism of K̄, yields `Nonempty (TauCeti.Isogeny W.toAffine W'.toAffine)`. This is an actual K-isogeny with no prime-to-p degree condition on the conclusion. The equivariance implication in the signature uses a torsion point Q equal to σ(P); such Q always exists because the additive Galois map preserves p-torsion. N=0 and N=1 are vacuous because function-field gonality is positive.

One proof route proceeds as follows. An elliptic curve and a morphism of finite étale torsion group schemes spread over a common nonempty good-reduction open. Shrink finitely many points to make the two inverse torsion morphisms defined. The smooth proper model and hence gonality do not change under restriction to this open. Apply the family theorem and pass to the generic fibre. Conversely the function-field theorem followed by the extension theorem yields the original-base assertion.

**Checks.**

- Ramification at the finitely many omitted bad-reduction points is allowed in the G_K representation.

- No equality of semisimplified Galois representations is substituted for the actual isomorphism.

- For K=ℂ(t), N=2 and the Legendre curve y²=x(x−1)(x−t), j=256(1−t+t²)³/(t²(1−t)²) is nonconstant and gonality is 1<2. Taking E′=E and the identity torsion isomorphism gives the identity K-isogeny of degree 1; at the zero torsion point both equivariance sides are 0.

*Needs:* §9.7; AbelianSchemesAndArithmeticModuli A1.8, A3.1–A3.5; NeronModelsAndSemistableAbelianVarieties §§1.3, 1.8; ModularCurves §0D; ModularCurves §0E; AlgebraicCurves Layer 12; InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; AbelianSchemesAndArithmeticModuli A1.6; AbelianSchemesAndArithmeticModuli A3.1; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization.

### Examples

For Ψ=−id and f=id the relation is f[p]=−Ψ, so scalar compatibility allows descent. A nontrivial quadratic twist has the same projective torsion data but no scalar-compatible actual intertwiner; the sign test at odd p distinguishes it.

### Dependencies

Statement prerequisites from other layers: §0.1, §0.2, §0.6, §7.5, §8.3. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Layer 10: Bounded-genus and minimal-model consequences

### 10.1 Bounded-genus rigidity with an enlarged threshold

For each integer N>0 there exists P_N such that every map from a smooth connected curve whose proper model has genus g<N to Z(p), for prime p>P_N, has image either a point or a Hecke curve. One may choose P_N=M_(N+1)^geom, using gon(B)≤g+1≤N<N+1. The same enlargement gives the actual-torsion isogeny theorem for nonisotrivial families on those bases. (BT16 Corollary 30, p. 742; gon(B)≤g(B)+1, p. 740; BT16 line 1458.)

One proof route proceeds as follows. Import CanonicalModelsAndGonality §1.3’s Riemann–Roch gonality bound; no new Riemann–Roch theory is planned here. Handle constant maps separately and apply geometric rigidity to a nonconstant map. Apply the family theorem to the torsion consequence.

**Checks.**

- The strict gonality inequality is met by N+1, even when gon(B)=N.

*Needs:* §9.5; §7.5; §9.7; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; AlgebraicCurves Layer 7.

### 10.2 Rational and elliptic curves are Hecke

For every sufficiently large prime p, every integral curve on Z(p) whose normalization has genus zero or one is a Hecke curve. A common threshold is M_3^geom: a rational normalization has gonality 1 and a genus-one normalization over an algebraically closed field has gonality 2. (BT16 Corollary 31, p. 742; BT16 line 1463.)

One proof route proceeds as follows. Apply the imported genus-zero and genus-one pencil bounds to the normalization of the curve. The normalization map is nonconstant, so geometric rigidity places its image in an irreducible component of a Hecke locus. Equal dimensions give equality of integral curves.

**Checks.**

- A singular rational curve is tested by its normalization, not its arithmetic genus.

- A constant map from an elliptic curve does not produce an integral elliptic image curve.

*Needs:* §9.5; §7.5; CanonicalModelsAndGonality §§1.1–1.7 and 9.1; AlgebraicCurves Layer 12; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization; SchemeAndStackFoundations §4.13 (finite normalization of integral curves).

### 10.3 The resolution and its known curve set

Resolve the isolated cyclic quotient singularities of a determinant component of Z(p). At a CM or singular-bicusp point the local action is 1/n(1,a), n∈{2,3,p}, gcd(a,n)=1, with a determined by the tangent characters; import its Hirzebruch–Jung resolution. On the resulting smooth projective surface Z̃(p), define the known curves to be all exceptional components and all strict transforms of Hecke curves. The resolution is an application of the surface interface of SchemeAndStackFoundations §§4.11–4.13, not a new general resolution theory. (BT16 §7, paragraph after Corollary 31, p. 742; BT16 line 1467.)

The defining construction has the following API.

- A projective birational morphism Z̃→Z is an isomorphism off the finite singular set.

- Local characters give exactly 1/n(1,a) with n=2,3,p and gcd(a,n)=1.

- The exceptional fibre has the supplied rational chain and continued-fraction intersection matrix.

- Known means an exceptional component or the strict transform of a Hecke component.

- A nonexceptional known curve maps to its Hecke curve with the same normalization function field.

- The chosen algebraic resolution, strict transforms and their intersection data transport along the permitted characteristic-zero algebraically closed extensions.

One proof route proceeds as follows. Read the stabilizer characters from the exact branch-locus theorem. Nonidentity inertia fixes neither individual tangent direction, so both weights are units modulo n. Apply the supplied cyclic-quotient resolution and intersection formulas. Its exceptional chains are rational curves; take strict transforms of each Hecke curve using proper birational transforms. The construction is algebraic in characteristic zero and commutes with the supplied base changes; the metric is not part of the surface carrier.

**Checks.**

- A 1/n(1,a) point resolves to a chain with self-intersections −b_i from the continued fraction n/a=b₁−1/(b₂−…): 1/3(1,1) gives one (−3)-curve, 1/3(1,2) two (−2)-curves, and 1/p(1,p−1) a chain of p−1 (−2)-curves.

- A 1/2(1,1) point resolves to one rational curve of self-intersection −2, rather than −1.

- An exceptional component maps to a point, so it is not a strict transform of a Hecke curve.

- The strict transform of a singular Hecke curve has the same normalization genus even when its arithmetic genus changes.

*Needs:* §0.5; §0.6; SchemeAndStackFoundations §§4.11–4.13 and gap:cyclic-surface-resolution-and-contraction; SchemeAndStackFoundations §§5.9–5.10 and gap:surface-contraction-intersections; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization.

### 10.4 Every rational curve on the resolution is known

For prime p>M_3^geom, every integral rational curve on Z̃(p) is either an exceptional component or the strict transform of a Hecke curve. In particular every initial (−1)-curve belongs to the known set. (BT16 Proof of Corollary 32, p. 742; BT16 line 1474.)

One proof route proceeds as follows. If the curve is not exceptional, its image in Z(p) is an integral curve with the same normalization function field. Its normalization is rational. Apply the rational-curve consequence and take the unique strict transform. Exceptional fibres contain exactly the listed irreducible components.

**Checks.**

- An exceptional component maps to a point of Z(p) and a strict transform maps birationally onto its Hecke curve; for p>M₃^geom no rational curve of a third kind exists.

*Needs:* §10.3; §10.2; AlgebraicCurves Layer 12; SchemeAndStackFoundations §§4.11–4.13 and gap:cyclic-surface-resolution-and-contraction; AlgebraicCurves Layer 12, gap:curve-extension-and-normalization; SchemeAndStackFoundations §4.13 (finite normalization of integral curves).

### 10.5 A minimal model obtained by contracting known curves

For every sufficiently large prime p, a smooth minimal model of each component of Z(p) can be obtained from Z̃(p) by finitely many contractions of smooth rational (−1)-curves. At every step, the contracted curve is the image of a known rational curve on the original resolution. Thus the required contractions are supported on the known Hecke and exceptional curves. The assertion does not identify every Hecke curve as contractible and does not say each subsequent centre was a (−1)-curve on the original surface. (BT16 Corollary 32, p. 742; BT16 line 1471.)

One proof route proceeds as follows. Import Castelnuovo contraction and termination by strict decrease of the Picard number, from SchemeAndStackFoundations §§4.11–4.13, gap:cyclic-surface-resolution-and-contraction. If no (−1)-curve remains, this is the surface-minimality conclusion. Under the inverse sequence of blowups, the strict transform of each subsequent contracted smooth rational curve is still an integral rational curve on the original resolution. Apply the classification of known rational curves there. Record intersection numbers after each contraction using the supplied formula. Existence of some smooth minimal model is enough; no general-type classification or uniqueness theorem is used.

**Checks.**

- A curve of self-intersection −2 is not contractible to a smooth point by the (−1)-curve theorem.

- If C²=−2 and C·E=1 for the preceding smooth rational (−1)-curve E, contraction gives C_new²=−2+1²=−1. If C·E=2 it instead gives −2+2²=2. The first case explains how a later contraction centre can start below −1 on Z̃.

*Needs:* §10.4; §10.3; SchemeAndStackFoundations §§4.11–4.13 and gap:cyclic-surface-resolution-and-contraction; SchemeAndStackFoundations §§5.9–5.10 and gap:surface-contraction-intersections.

### Examples

The singularities 1/3(1,1) and 1/3(1,2) resolve to chains [−3] and [−2,−2]. After contracting a (−1)-curve meeting C once, C² increases by 1; a curve with initial square −2 can therefore become a later contraction centre.

### Dependencies

Statement prerequisites from other layers: §7.5, §9.5, §9.7, §0.5, §0.6. The subsection Needs lines identify each external statement input and each additional proof-route input; the exact supplier contracts above include their hypotheses.

## Downstream consumers

Geometric function-field applications consume Layer 9's isogeny theorem with its original-base conclusion. Arithmetic moduli applications consume the two determinant components and signed special-stratum interfaces. Surface applications consume Layer 10's classification of rational curves on the resolution and its known-curve contraction support. Monodromy applications consume Layer 8 and §9.6 independently of the isogeny-descent route. None of these applications supplies an input back to this roadmap.

## Worked examples

### A compact-nontrivial upper systolic witness

The trace congruence alone gives a lower bound. It does not show that a chosen congruence-group word survives filling the cusps. In fact U(p)L(−p), the matrix used in the published Lemma 5 proof (page 718), is a product of peripheral elements and is killed by filling. The following replacement supplies the upper bound that is also used in the compact lower-bound argument.

Put U(t)=[[1,t],[0,1]], L(t)=[[1,0],[t,1]], and write p=3r+x, x∈{1,2}. Define

M_p=[[1+xp,3p],[p(2−x²+2px)/3,1+2p²−xp]].

The lower-left entry is integral: for x=1 its parenthesis is 1+2p, and for x=2 it is −2+4p, both divisible by 3 in their respective residue classes. Direct multiplication gives det M_p=1, M_p≡I mod p, and tr M_p=2p²+2. The exact factorizations are

* x=1: M_p=−L(2r)U(3)L(−r−1)U(3);
* x=2: M_p=L(2r+1)U(−3)L(−r−1)U(1)L(1)U(1).

For p>6 set θ=π/p, c=cos θ, b=(1+√(1−4sin²θ))/2,

U_p=[[c,b],[b−1,c]], L_p=[[c,b−1],[b,c]], S=[[0,−1],[1,0]].

Both deformation matrices have determinant one. The identities S²=−I, tr(SU_p)=1 and tr U_p=2cos θ give the marked projective orders 2,3,p. Their fixed vertices form the hyperbolic triangle with those angles; its faithful marked representation identifies the deformation with the compact triangle quotient. Moreover L_p=S U_p⁻¹S⁻¹. The elliptic power identity gives

L_p^a=cos(aθ)I+[sin(aθ)/sin θ](L_p−cI).

For a=2r or 2r+1, and a′=−r−1, division by p gives respectively +αN and −αN, with bounded remainder before division, where N=[[0,0],[1,0]] and α=√3/(2π). Fixed powers of U_p,L_p tend to the corresponding integer unipotent powers. In the first word the leading trace is α²tr(NU(3)NU(3))=9α². In the second it is −α²tr(NU(−3)N U(1)L(1)U(1))=9α²: the last fixed word is [[2,3],[1,2]]. Thus in both classes

tr γ_p(M_p)=(27/(4π²))p²+O(p).

The coefficient is positive. For all sufficiently large p this is hyperbolic and nonidentity after filling. The formula ℓ=2arcosh(|tr|/2) gives compact length 4log p+O(1); the ordinary integral trace gives the same cusped length. For example the integer matrices at p=7 and 11 are [[8,21],[35,92]] and [[23,33],[154,221]], with determinants one and traces 100 and 244. These are arithmetic checks, not explicit universal thresholds for the asymptotic assertion.

(BT16 Lemma 5, p. 718, BT16 line 392; §3.2, p. 719, BT16 line 420.)

### Compact lower bound without a one-cusp assumption

Take a shortest compact geodesic of length L≤4log p+C. Lemma 6's embedded cusp stars give disjoint outer discs of radius R_b=(log p)/2 for large p; use inner radius R_s=(log p)/4. A connected visit to an outer disc reaching its inner disc has length at least 2(R_b−R_s). Consequently there are a bounded number of deep **visits**, including repeated visits to the same cusp. The geodesic cannot be wholly inside one of these embedded discs.

On all other portions the distance to every cusp is at least R_s, and the length error from the compact/cusped comparison is O(e^(−R_s)L)=o(1). Inside a deep visit, the embedded-disc lift is an ordinary hyperbolic geodesic. With arclength s measured from its closest point to the centre,

cosh r(s)=cosh(r_min)cosh s, hence r(s)≥|s|.

On r≥1 the extra length density coth(r/2)−1 has a uniform integrable bound: it is bounded near |s|≤1 and decays exponentially for |s|>1. If r_min<1, replace the portion in the unit disc by a unit-circle arc of bounded length; the cusped comparison on that circle gives a bounded cusped length as well. This replacement is homotopic in the filled disc. The bounded number of visits therefore produces a loop in Y(p) with cusped length ≤L+O(1), whose filled class remains the original nontrivial class. It is neither contractible nor peripheral in Y(p). For M≡I mod p, determinant one gives tr M≡2 mod p², so any hyperbolic representative has length at least 4log p−O(1). Apply this to the new loop and divide by two to obtain ρ_X=2log p+O(1).

(BT16 Corollary 8, p. 720; BT16 line 469.)

### Reconstruction keeps the determinant sign

For p>3, uniqueness of an invertible projective solution forces rank three: on any projective line of matrices a nonzero determinant quadratic has at most two zeros, and so at least p−1 invertible points. Use three independent equations in four matrix entries. A cofactor vector for a nonzero rank-three minor has integral entries bounded by a fixed power of the coefficient bound. Choose δ so that every relevant fixed-degree minor is o(p); a minor nonzero modulo p then gives the same rational rank. The cofactor reduction is the unique invertible projective solution. Removing the integer gcd preserves its projective reduction, so its determinant is nonzero and prime to p. It does **not** give a sign. In the CM⁺ application the centralizer is a definite quadratic algebra and its determinant norm is positive. There is no such reason in the general cusp or overlap application.

For positive determinant, a primitive integral two-by-two matrix has Smith invariants (1,m) and gives a cyclic lattice isogeny of degree m. For negative determinant, factor through R=diag(1,−1); the remaining matrix has positive determinant |m| and gives a cyclic map to the conjugate complex structure. The boundary version must retain the p-gon toric and component maps, not just the induced map on the projective line of inertia groups. Those are supplied by ModularCurvesPartII §§4.1 and 9.13. This yields ordinary or conjugate Hecke incidence with the same polynomial height cost.

Here is a concrete check on the sign in Proposition 17 (pages 727–728). Let p≡1 mod4, choose a∈F_p with a²=−1 and write c for the standard cusp. Cusps on a selected Γ(p) component are nonzero vectors v∈F_p² modulo ±1. Their inertia depends only on the line F_pv. Let γ be the deck transformation represented by aR∈SL₂(F_p), and let r(z)=−conj(z) be the marked reflection fixing i. For any of three fixed matrices M_j∈SL₂(Z) whose first columns give the distinct lines ∞,0,1, the pair

(r(M_jc), γ(M_jc))

has cusp labels (v_j,av_j), v_j=R M_j e₁. Its two inertia groups coincide, so it belongs to SBC. The first cusp has distance log p+O(1) from i, since it is (R M_j R)c; the second has the same estimate from γi. Thus the three distinct pairs are within (1/2+δ)ρ_X of (i,γi) for every fixed δ>0 and large p. Scalar normalization of the conjugated full frame makes these pairs lie on the conjugate index-one locus.

To test ordinary Hecke incidence, write the positive toric and component factors of a cyclic boundary isogeny as u,v with uv=m. After normalizing its Weil multiplier to the fixed pairing, the square of the scalar ratio of the two cusp labels is v/u (or its inverse under the opposite framing convention). This follows directly by normalizing the toric factor u by a scalar λ with λ²m=1. For our ratio a, either convention forces u+v≡0 mod p. As u,v are positive and prime to p, u+v≥p, and uv≥u+v−1≥p−1. These pairs lie on no ordinary T_m with m<p−1. A bound m=O(p^(Aδ)) for arbitrarily small fixed δ cannot hold in the ordinary-only conclusion. The signed conclusion passes the test with |det R|=1.

(BT16 Proposition 17, pp. 727–728; BT16 line 751.)

### Multiplicity estimates with independent scales

Put d=p^δ₁. Heegner-only repulsion and its conjugate transport give disjoint balls off the corresponding small-locus union, costing p^(−2δ₂). On each ordinary small locus, Hecke pull-push converts multiplicity to a diagonal problem and the diagonal volume estimate gives p^(−1). On the conjugate locus, keep the curve complex, apply holomorphic Hecke pull-push and use the conjugate-diagonal relative estimate. Its direction is

V(ε)≤[sinh ε/sinh R] V(R), 0<ε<R<ρ_X/2.

Take R arbitrarily close to ρ_X/2. The factor for fixed ε is O(p^(−1)); the numerator and denominator are reversed in the erratum's page-3 displayed line. The Hecke degree sum is O(d³). Hence each CM sign is bounded by a constant times (p^(−2δ₂)+p^(3δ₁−1))Deg(C). Choose 3δ₁<1 and then the smaller repulsion scale δ₂.

For SBC, fix δ₃ independently and first. Off the union of ordinary **and conjugate** loci of index m<d, signed three-bicusp repulsion bounds the overlap of radius (1/2+δ₂)ρ_X balls by two. Point-volume gives p^(−1−2δ₂)Deg(C).

For a fixed signed small locus, holomorphic Hecke pull-push reduces to centres on the ordinary or conjugate diagonal. Write R₃=(1/2+δ₃)ρ_X and D=T_m*C. The global weighted cusp-ball target of §5.4 is

    Σ_(ξ∈SBC∩Λ) vol(D∩B(ξ,R₃)) ≤ C_(δ₃) vol(D).

The union-of-lenses statement of §2.6 gives several midpoint choices in each coordinate. Even for Λ equal to the ordinary diagonal, a point can lie near (u_i,u_j) with i≠j; such a point need not lie near Λ. The local point-ball theorem compares the volume of each small lens ball with that of its enlarged ball, and the diagonal-tube theorem handles the matching-centre part. Neither local estimate by itself bounds the globally weighted sum of the enlarged off-diagonal balls. That summation is included explicitly in §5.4’s analytic target, not inferred by identifying the centres.

With this global target and the point-volume lower bound, the small-locus multiplicity is at most p^(−1−2δ₃)ψ(m)Deg(C). Summation over m<d gives p^(−1−2δ₃+3δ₁)Deg(C). Choosing 3δ₁<2δ₃ and then a sufficiently small positive δ₂ gives p-weighted decay. For example δ₃=1/1000, δ₁=1/10000 and δ₂=1/100000 give the two exponents −2δ₂=−1/50000 and −2δ₃+3δ₁=−17/10000 after multiplication by p, subject also to the geometric small-parameter conditions. No intersection with a conjugate locus occurs.

(BTE Propositions 4.1–4.2, pp. 3–4; BTE lines 106, 139.)

### The big-diagonal bound: the needed hypothesis and the shell estimate

There is a direct obstruction to the unrestricted Proposition 27 (pages 737–740). On a selected component X let K=2g_X−2=(p²−1)(p−6)/12 and choose a very ample line bundle L of degree d. A general member D of |L⊠L| is smooth and connected, meets all the finitely many graphs Γ_g, g∈G₀, transversely, and avoids their pairwise intersections. Indeed distinct graphs meet in a finite set, and transversality and avoidance are open conditions on this sufficiently ample linear system. Each graph has intersection 2d with D. Embed

C={(x,x,y,y):(x,y)∈D}⊂T₁×T₁⊂S².

No Δ_g contains C. At each intersection its curve-point multiplicity along Δ_g is one, even though the two defining equalities restrict to the same equation on C. Therefore

Σ_g mult_(Δ_g)(C)=2d|G₀|, Deg(C)=4dK,

and their ratio is |G₀|/(2K)=3p/(p−6), which tends to three. Elements outside G₀ give no intersection on these chosen components. Both projected cycles of C are Hecke. The theorem in §5.8 excludes exactly this failure: both projected cycles are nonconstant and non-Hecke.

For that theorem integrate the signed overlap dichotomy against C after the double-diagonal volume bound. Outside its two exceptional regions, overlap is O(log p), giving O(log p·p^(−δ))Deg(C). In the signed small-Hecke region the short-height count costs p^(Aδ). On the cusp complement the **cusped** metric makes a Hecke branch a local isometry; the compact metric comparison controls the paths, with the cusp balls enlarged first. Pull-push turns the signed tube into an ordinary or conjugate diagonal tube. The normalized volume ratio gives p^(−1+O(δ)); the projectionwise measure error is O(p^(−1)). Non-Hecke projected cycles rule out a diagonal component in the ordinary branch. No complex curve can be contained in the conjugate locus, by §3.4’s elliptic-open argument, including its finite boundary. Weighted pushforward degrees, rather than degrees of reduced images, make all these estimates uniform in the parametrization.

For the bicusp region split the area form before counting: ω_C=π₁*ω_S+π₂*ω_S, and write C_i=(π_i)_*C with its full generic map degree. Let R₀=(1/2+A₀δ)ρ_X+O(1) be the radius given by the overlap dichotomy. The exponent constants in the next count depend on A₀ and the original tube radius, but not on the later enlargement constant B.

A fixed pair of projected bicusp centres (a₁,a₂), one in each slot, determines either no deck transformations or one coset of their common order-p stabilizer. To see this, fix one transformation carrying a₂ to a₁; the others differ by the stabilizer of a₂. That stabilizer has order p, since either cusp coordinate has exactly this inertia. In either projection the short-displacement conditions, after comparison with the fixed representative, give the exact rotation inequality

sinh(distance(z,σ^kz)/2)=sinh d·|sin(πk/p)|.

Choose the farther of the two coordinates in that projected surface, so d=d_S(z_i,a_i). The count is O(min(p,1+p sinh(O(δρ_X))/sinh d)). For d≤R₀ this is bounded by Cp^(1+A₁δ)exp(−d), including d<1 and the additive one. The source and target versions follow by taking inverses. The ball lifts uniquely for these comparisons: R₀+O(δρ_X)<ρ_X for small δ, and a second short lift would violate the compact injectivity-radius bound.

For fixed i and a_i, the other projected centres lie in a radius-R₀ ball and number at most p^(A₂δ), by the cusp-ball count applied to both coordinates. Sum over them, deliberately discarding their remaining conditions. If M_cusp(z₁,z₂) counts only transformations in the cusp branch, then, for each i=1,2,

M_cusp(z₁,z₂) ≤ Cp^(1+Aδ) Σ_(a∈SBC, d(z_i,a)<R₀) exp(−d(z_i,a)).

The bound is valid separately for each i, so integrating its i-th version against π_i*ω_S and then adding gives the following estimate for the entire cusp-overlap integral E:

E ≤ Cp^(1+Aδ) Σ_i Σ_(a∈SBC) Σ_(0≤ℓ≤R₀+1) exp(−ℓ) vol(C_i∩B(a,ℓ+1)).

This step is why weighted projected cycles are needed. It never compares the area coming from the second projection with a volume measured only in the first projection.

Now choose B once so that 2B>A+1 and R_*=(1/2+Bδ)ρ_X exceeds R₀+3 for large p. The relative point-ball theorem proved next yields

E ≤ Cp^(1+Aδ) exp(−R_*) (log p)² Σ_i Σ_a vol(C_i∩B(a,R_*)).

Here the linear factor in the point-ball estimate and the number of unit shells account for the square of the logarithm. The ℓ=0 term uses the radius-one case.

It remains to control this sum on each **single surface** S. Let N(z) count its radius-R_* bicusp balls. On N≤2, charge at most 2vol(C_i) once globally. On N≥3, the strengthened signed reconstruction places z in the O(Bδρ_X) tube of one ordinary or conjugate T_m, m≤p^(A₃Bδ), and on the complement of all cusp balls of radius (1/2−A₃Bδ)ρ_X. Here are the two additional outputs of the reconstruction that justify this use.

First, each factor has at least two distinct nearby cusps. Otherwise two different bicusps would have a repeated first cusp and two nearby second cusps with the same inertia; the small-height cusp-normalizer argument would make those second cusps equal. Interchanging factors gives the other case. For any cusp c, choose a nearby cusp different from c. Cusp separation and the triangle inequality give d(z_j,c)≥ρ_X−R_*−O(1). Thus both factors are on the required cusp complement.

Second, choose a lifted lens in each factor from the union in §2.6. Each choice puts the factor within O(Bδρ_X)+O(1) of a marked order-two vertex; the at most p^(O(Bδ)) choices contribute that factor to the subsequent count. Move these vertices to (ι,gι). The three independent cusp equations already give a primitive matrix Q representing g projectively, with height p^(O(Bδ)). For positive determinant, its Smith form and the hyperbolic height-distance bound place (ι,gι) within O(log h(Q)) of the corresponding holomorphic T_m. Equivalently compare i and the rational Möbius image Q·i in the cusped half-plane and use h_X≤h_Y. For negative determinant compose with the fixed reflection, which fixes i; the same argument gives the conjugate locus. This is the same signed small-matrix distance calculation used in the overlap dichotomy. Adding back the displacement to the two marked vertices gives the asserted thin tube.

The cusp count bounds N(z) by p^(O(Bδ)). Apply the Hecke-tube comparison only on that cusp complement. Holomorphic pull-push followed by cosh or sinh relative-volume normalization gives p^(−1+O(Bδ)), including its cusped-volume error. Sum ψ(m) over m≤p^(A₃Bδ). With a fixed A₄ incorporating these costs, the metric enlargement and cusp count,

Σ_a vol(C_i∩B(a,R_*)) ≤ [2+Cp^(−1+A₄Bδ)]vol(C_i).

Only the region N≥3 is counted separately for each m. Charging the region N≤2 for every m would lose this bound. The ordinary branch requires that C_i have no Hecke component; the conjugate locus contains no complex curve by §3.4. This argument neither lifts different centres through unrelated Hecke branches nor treats product-ball overlaps as single-surface overlaps. Three distinct centres in SBC×SBC need not have three distinct first or second projections.

Finally fix δ>0 so small that A₄Bδ<1/2 and all lift, height and repulsion lemmas apply. The bound ρ_X=2log p+O(1) gives

E ≤ Cp^((A−2B)δ)(log p)² vol(C) = O(p^(−cδ)Deg(C))

for a fixed c>0, reduced if necessary to absorb the logarithm. B was chosen before δ and p, and A came only from R₀, so this is a consistent order of choices. Combining this with the ordinary overlap and signed small-Hecke terms, and dividing by the double-diagonal volume factor, proves the required positive decay exponent. This projectionwise argument supplies the missing overlap bridge in Proposition 27, page 740, without an assertion that two enlarged product balls are disjoint.

(BT16 Proposition 27 proof, pp. 737–740; BT16 line 1224; the projected overlap estimate is the displayed argument above.)

### Relative volumes of point balls: a separate analytic input

The shell argument uses gap:relative-point-ball-volume from ComplexKahlerGeometry K6.1. Let C be a closed effective analytic one-cycle in Dⁿ, with the sum curvature −1 area form ω and the maximum product distance. Write V(t)=vol(C∩B∞(0,t)). There is a constant C_n, depending only on n, such that

V(r) ≤ C_n(1+r) exp(r−R) V(R),  1≤r≤R−2.

For a compact product quotient use the theorem after lifting a ball with R<ρ_X. No assumption that the centre belongs to C is needed. This is an argument for the point-ball step of Bakker–Tsimerman Proposition 27, page 739. Their Proposition 23, page 735, is a diagonal-tube statement; it does not directly state this theorem.

Here is the derivation in the normalized-curve current convention dᶜ=i(∂̄−∂)/(4π). On the normalization, with every branch and cycle weight retained, put

u=log max_i|z_i|²,  s_t=log tanh²(t/2),  Ω_s={u<s},

h(s)=−log(1−exp(s)),  v=Σ_i −log(1−|z_i|²),  N(s)=∫_(Ω_s)ddᶜu.

The function u is subharmonic and has only logarithmic poles at the preimages of zero. The function v is smooth and nonnegative, ω=4πddᶜv, and 0≤v≤nh(s) on Ω_s. The positive measure ddᶜu makes N nondecreasing. Choose regular levels away from the critical values and the corners of the max decomposition; integrate over its piecewise smooth boundary. For a regular b<0, Green's identity gives

∫_(Ω_b)(b−u)ddᶜv + ∫_(Ω_b)v ddᶜu = ∫_(u=b)v dᶜu ≤ n h(b) N(b).

The pole boundary terms vanish because v tends to zero there; u has a logarithmic pole and v vanishes at least quadratically in a local parameter. The interior max interfaces are included in the positive measure ddᶜu, so discarding the second integral has the stated direction. For a<b this proves

V(t_a)/(4π) ≤ n h(b)N(b)/(b−a),  where s_(t_a)=a.

Take a=s_r and b=s_(r+1), using limits if necessary. The bounds h(s_(r+1))=2log cosh((r+1)/2)≤r+1 and s_(r+1)−s_r≥c exp(−r) give

V(r)/(4π) ≤ C n(1+r) exp(r) N(s_(r+1)).

For the reverse comparison at R, partition into the regions where one coordinate realizes the maximum. There u=log|z_j|² is harmonic off zero, and its coordinate area is exactly 4πh″(u)du∧dᶜu. All other coordinate areas are nonnegative. The interfaces have area zero unless two active coordinate functions agree identically, in which case choose either and their differentials agree. Coarea and the boundary-flux identity therefore give

V(R)/(4π) ≥ ∫_(-∞)^(s_R) h″(s)N(s) ds

≥ [h′(s_R)−h′(s_(R−1))] N(s_(R−1)) ≥ c exp(R)N(s_(R−1)).

The last inequality uses R≥3 and h′(s_t)=sinh²(t/2). Since r+1≤R−1 and N is nondecreasing, the two estimates prove the claimed bound. Piecewise smooth exhaustion, or smooth approximations of the maximum followed by monotone sublevel limits, proves the formulas at singular levels. Always take limits from below for open balls; a component with a constant active coordinate can give a plateau level. Properness of normalization over compact subsets justifies every exhaustion. Sum over branches and cycle coefficients to obtain the stated cycle version.

Checks for this theorem matter. A coordinate fibre through zero has V(t)=4πsinh²(t/2). Zero cycles and positive integer weights respect the estimate. A stronger assertion that V(t)/a(t) is increasing would be false: on the line (z,az), 0<a<1 real, the max ball is |z|<tanh(t/2) and, writing q=tanh²(t/2),

V(t)/a(t)=1+a²(1−q)/(1−a²q),

which decreases. Thus the theorem deliberately keeps its fixed constant and linear factor in r. The proof uses gap:analytic-cycle-current-transport for normalization and sublevel Green/Stokes transport, and the imported current calculus and weighted analytic-cycle integration of ComplexComparisonPartII C5.4, together with the explicit Green/coarea bridge in gap:relative-point-ball-volume. It also gives the point-multiplicity lower bound: N(s) is at least the multiplicity at zero, and integrating h″ from −∞ gives V(R)≥4πsinh²(R/2)mult₀C.

(BT16 Proposition 27 proof, p. 739, BT16 line 1330; the Green/coarea estimate is proved above rather than attributed to Proposition 23.)

### From the pencil to the Hurwitz contradiction

Normalize the image of the original curve first. For a finite map B→D between smooth proper curves, the images of a gonality pencil's fibre divisors are effective divisors of the same degree on D. Ratios are norms of rational functions, hence linearly equivalent. They vary: otherwise the fixed finite support would contain the images of every fibre of the surjective pencil. A nonconstant pencil in this linear system, after removing its fixed part, proves gon(D)≤gon(B). This is CanonicalModelsAndGonality §1.6, used here and in §8.3.

For a birational map f:B→Z and a degree-n pencil h:B→P¹, finite flatness gives the cycle map P¹→SymⁿZ with ramified fibres carrying their full multiplicities. Distinct generic fibres give disjoint image points, so that map is generically injective. Normalize a dominating component of its pullback to Sⁿ. The wreath group W=Gⁿ⋊S_n permutes the components; the component stabilizer H has invariant function field k(P¹). Quotient after normalization gives α:C→P¹. The stabilizer action is made effective before local indices are computed.

Every coordinate projection of C maps to the original image curve in Z; since the generic pencil points are distinct and f is birational, none of its pair projections lies in a big diagonal. A non-Hecke image forces all single projections to be nonconstant non-Hecke cycles. For weighted projection cycles C_i and C_ij, canonical pullback gives Σ_iDeg(C_i)=Deg(C) and Σ_(i<j)Deg(C_ij)=(n−1)Deg(C).

The ambient wreath stabilizer exhausts ramification support. A nontrivial element with no permutation fixes a CM or SBC point in a slot. A moved slot produces equality with another slot through some g, hence a big diagonal. Normalization introduces no ramification over the free quotient locus. Effective local inertia on a smooth curve is cyclic, by the faithful tangent character. Raising its generator to n! kills the permutation, and each remaining coordinate order divides 2,3 or p. Thus the order divides 6n!p, with the factor p absent outside SBC. There is only one factor p, regardless of the number of cusp slots.

Charge local ramification to the corresponding weighted multiplicities. The four estimates give Ram(α)=o(Deg(C)) for fixed n. On the one hand,

2g(C)−2=−2deg α+Ram(α)≤o(Deg(C)).

On the other, if d is the largest of its 2n coordinate degrees and K=2g_X−2>0, then Deg(C)≤2ndK and the independent projection to X gives 2g(C)−2≥dK≥Deg(C)/(2n). These are incompatible for large p. The exact negative term in the first equality is retained; discarding it produces an inequality.

(BT16 Theorem 29 proof, pp. 741–742; BT16 line 1395.)

### Actual linear monodromy and isogeny descent

Li–Yau with the finite-area modular metric, the effective orbifold area πD/3 and the imported λ′₁≥21/100 give gon(X_Γ)≥(21/100)D/24=7D/800. Here λ′₁=min(λ₁,1/4) includes the continuous-spectrum convention. This is an application of the imported results, not a new spectral theory.

For a proper H<SL₂(F_p), an index d<p would give an action on d letters killing every order-p transvection. Existing transvection generation makes the action trivial; its transitivity then forces H to be the whole group. Thus the index is at least p. Pulling subgroups back from PSL gives the same effective bound. If a nonisotrivial E/U has actual torsion image H, its frame torsor yields a nonconstant map to the subgroup modular curve, whose gonality is at most gon(U). That algebraic gonality equals the analytic gonality of the corresponding X_Γ by ModularCurvesPartII §6.1, ComplexComparisonPartII §C1.9 and CanonicalModelsAndGonality §8.2. The 7/800 estimate and the proper-index bound imply full effective image for p>800N/7. A proper lift of full PSL image would have index at most two in SL, also impossible. Weil pairing has constant determinant over the algebraically closed base. The actual image is therefore SL₂(F_p).

For the descent step let K=k(U). Nonisotriviality implies geometric End(E)=Z, so that no Weierstrass model of E satisfies `WeierstrassCurve.HasGeometricCM` (§9.2): an extra geometric endomorphism spreads to a finite-type model and a finite cover, and over C its locally constant lattice action forces the period to be a fixed imaginary-quadratic value. Then j is constant, contrary to the original nonconstancy, which survives faithfully flat base change. For a geometric isogeny h:E→E′, composition with h∨ injects Hom(E,E′) into End(E)=Z: its kernel would map the connected E into a finite group. The image contains h∨h=[deg h], so the imported free finite Hom module has rank one. Its primitive generator f satisfies σf=χ(σ)f for a continuous quadratic character χ. A prime-to-p isogeny from Hecke containment implies p∤deg f by degree scaling.

Let Ψ be the original actual torsion isomorphism and f the geometric cyclic isogeny supplied by containment in H_m. Its restriction is f[p]=λΨ for a fixed λ∈𝔽_p×. Every Galois conjugate σf has the same torsion restriction, since Ψ is equivariant and scalars are fixed. The rank-one geometric Hom lattice gives σf=±f. The negative choice would say f[p]=−f[p], impossible because f[p] is invertible and p is odd. Hence f is invariant and descends over k(U). This argument uses neither full monodromy nor the auxiliary self-twist argument. A nontrivial quadratic twist has the same projective representation; its geometric isomorphism is not scalar-compatible with an actual equivariant torsion isomorphism.

Since E and E′ are abelian schemes over the regular smooth curve U, the Néron mapping property extends f uniquely over U (BLR §1.2 Proposition 8, page 15; §1.4 Proposition 2, page 19). Extend its dual as well; their compositions remain multiplication by deg f because equality holds generically and the targets are separated. The kernel lies in the finite étale torsion scheme, the image contains multiplication-by-degree, and the resulting homomorphism is a finite surjective isogeny over U. The mapping property is applied on U, where both schemes have good reduction.

### Uniform passage to characteristic-zero fields and surface consequences

Spread the curve, its smooth proper model, pencil, families, the actual torsion isomorphism and its inverse to a finitely generated subfield k₀ of k. Embed k₀ into C; no embedding of all of k is assumed. The chosen pencil preserves the required gonality upper bound. Nonconstant j remains nonconstant. Over C the classifying map has image in one fixed H_m, p∤m. Vanishing of the pullback of that closed locus's ideal descends by faithful flatness, and is preserved on extension to k. The closed Hecke locus and its framed correspondence have their supplied characteristic-zero base-change structures. Geometric finite étale base change identifies the actual monodromy image; apply scalar-compatible Hom-lattice descent over k(U), then extend the isogeny on U. This avoids assuming arbitrary analytic isogenies descend without proof.

For genus g<N, Riemann–Roch gives gon≤g+1≤N, so use the gonality theorem at N+1. Rational curves have gonality one, and smooth genus-one curves over an algebraically closed field have gonality two; M₃ suffices for both. Resolve the quotient using its cyclic local charts of orders 2,3,p. The exceptional components are rational. Any rational curve on the resolution either is exceptional or maps to a rational curve of Z, hence to a Hecke curve. Castelnuovo contraction and decreasing Picard number give some smooth minimal model. Every contracted centre has a rational strict transform on the original resolution, so the exceptional/Hecke classification identifies its source. The strict transform may acquire self-intersection −1 only after earlier contractions; it is not assumed to have had self-intersection −1 initially. General type and uniqueness of the minimal model are not premises of this argument.

(BT16 Theorems 1–3, p. 710, BT16 line 58, each for a fixed k, with uniformity in k from §9.5; BT16 line 75 deduces Theorems 1 and 2 from Theorem 3 without the steps above, which are §§9.2–9.4; Corollaries 30–32, p. 742, BT16 line 1458; ABR96 Theorem 0.1 and §§1.4–1.7, ABR96 lines 14, 68.)

## References

- **BT16.** Benjamin Bakker and Jacob Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields*, Annals of Mathematics 184 (2016), 709–744, [publisher open text](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), DOI 10.4007/annals.2016.184.3.2. Locators use this published version; its statements are read with the signed, multiplicity and proof corrections specified in the layers and worked examples.
- **BTE.** Benjamin Bakker and Jacob Tsimerman, *Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields*, undated five-page [author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), §§1–4, Propositions 2.1, 3.1, 4.1, 4.2. Page numbers refer to the five-page document. The small-to-large tube ratio is sinh(ε)/sinh(R).
- **ABR96.** Dan Abramovich, *A linear lower bound on the gonality of modular curves*, [arXiv:alg-geom/9609012v1](https://arxiv.org/abs/alg-geom/9609012v1), five-page preprint, Theorem 0.1 and §§1.1, 1.4–1.7. The published version is IMRN (1996), 1005–1011, DOI 10.1155/S1073792896000621; all page locators here are to the preprint actually read.
- **BLR90.** Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*, Springer, 1990, [DOI 10.1007/978-3-642-51438-8](https://doi.org/10.1007/978-3-642-51438-8), §1.2 Proposition 8, p. 15; §1.4 Proposition 2, p. 19. Cited by locator alone, with uncertified text access.
- **Sil09.** Joseph H. Silverman, *The Arithmetic of Elliptic Curves*, second edition, Graduate Texts in Mathematics 106, Springer, 2009, [DOI 10.1007/978-0-387-09494-6](https://doi.org/10.1007/978-0-387-09494-6), Corollary III.9.4. Cited by locator alone, with uncertified text access.
