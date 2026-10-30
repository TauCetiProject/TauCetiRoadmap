# Roadmap: algebraic moduli for arithmetic geometry, part II: numerical Picard groups and contraction descent

**Summary.** This Part II of AlgebraicModuliForArithmeticGeometry develops numerical classes of invertible sheaves on arbitrary proper schemes and uses them to descend contractions. Starting with curve degree, coherent cohomology, descent and intersection theory, it constructs relative numerical lattices and cones, the proper Picard scheme and its numerical local system. Its end theorems are the positive-power criterion for constancy, descent of geometric projective contractions, descent of surface fibre graphs and intersection labels, lifting and cone comparison over discrete valuation rings, vertical numerical descent, and independence of the complex projective Alexeev–Hacon–Kawamata rank. Neither smoothness nor projectivity is imposed on the general proper Picard and numerical theories.

## Scope and ownership

The parent AlgebraicModuliForArithmeticGeometry stops at parameter spaces, representability machinery, Picard sheafification and infinitesimal lifting. This continuation owns the arbitrary proper-field Picard representability application without universal functions, its affinization-valued obstruction, numerical local system, relative numerical quotient, and geometric descent theorems. Its proper bigness extension differs from the parent's projective geometrically integral theory by admitting integral proper schemes without a polarization.

Curve degree χ(L) − χ(O_C) on proper one-dimensional schemes over a field, with its tensor additivity, field-extension invariance, divisor comparison and nodal normalization law, is owned by JacobianChallenge Layers A–C and StableReduction Layer 2, J-A2. The first-Chern comparison on a proper curve is SchemeAndStackFoundations §5.3 `c1_degree_curve`; §0.1 applies it over the residue field κ(s) and adds the length-weighted component law for nonreduced curves. The Euler-degree invariant, tensor/dual/pullback operations, generic quotient factorization and abstract matrix inequalities are already in the library and are consumed through the exact declarations below. The construction of relative Spec belongs to AlgebraicVectorBundles L1A–L1B; Stein factorization to SchemeAndStackFoundations §4.9. Section 2.2 here identifies the constants algebra and its units, rather than constructing an affine hull theory.

SchemeAndStackFoundations §5.10 owns the numerical quotient of smooth projective surfaces over algebraically closed fields. AbundanceStatement Layers 4A–4D own characteristic-zero projective numerical spaces, cones and Kleiman's criterion, and Layer 5 owns semiampleness there. Those cases are compared with, and transported to, the arbitrary-field proper and relative versions here. AlgebraicModuliForArithmeticGeometry §1.6 owns projective bigness; its §§1.4–1.5 and 2.1 own the projective parameter constructions. The relative Picard algebraic space with universal functions and the projective flat geometrically integral torsion component are stated by ComplexComparisonPartII §§C3.2d.2–C3.2f.2; the variants here allow arbitrary proper schemes over a field. General finite étale pushforward, Kummer, field Brauer comparisons, cohomological descent, norms and formal existence remain with SchemeAndStackFoundations §§2.10–2.15, 2.22, 3.5 and 4.10. All-dimensional finite-coefficient finiteness is supplied by EtaleCohomologyFoundations §F.3.

StableReduction Layers 1 and 4 own nodal dual graphs and regular-model intersection theory. The graph here is the simple component-intersection graph of any Noetherian scheme; it forgets loops, node multiplicities and normalization genera. Its geometric Zariski-lemma application admits a regular proper flat surface model without smooth generic fibre. The doubling construction in §2.11 is an application to the Picard sheaf of the supplied quotient universal property, not a second generic quotient theory. StableReduction Layer 2 owns contraction descent for a proper surjective morphism c with O_Y ≅ c_*O_X universally, tested on geometric fibres; the rigidity theorem of §3.2 differs by testing integral curves in the fibres and by requiring O_Y ≅ f_*O_X only, not universally. StableReduction Layer 2 also owns openness of fibrewise ampleness for proper finitely presented families of schemes, which is the scheme case of §3.8(i) and the case used in §§5.3–5.4; §3.8 differs by admitting a proper algebraic space as source and by the universal open locus of (ii).

Moduli of stable surfaces; flips, dlt and plt pairs and the cone and base point free theorems of the mixed-characteristic minimal model program; Keel's nef line bundles endowed with a map (EWM) and the gluing of such maps; and the structure theory of genus-one fibred surfaces lie outside this roadmap: its results are inputs to them, and none of them is stated here. Enriques applications belong to EnriquesSurfacesAndIntegralNonexistence.

## Conventions

All schemes, sites and indexing types live in fixed universes; extensions of universes use the canonical equivalences, not changes to the objects. A proper scheme over a field may be empty, nonreduced, disconnected or of mixed dimension unless a theorem states otherwise. A surface is pure of dimension two. An integral curve is reduced, irreducible and of dimension one. A relative curve for numerical testing lies in a fibre of a proper morphism f : X → S. The definitions of relative numerical triviality and of Num(X/S) need no hypothesis on S; every theorem about them assumes S Noetherian. The degree of a relative curve is always taken over the residue field κ(s). Testing all fibres and testing only closed points are equivalent by §0.5; the definition initially uses all fibres, so this equivalence is not a prerequisite of the definition.

Write Pic(X) for invertible sheaves up to isomorphism under tensor product, and Pic^τ(X/S) for its numerical kernel. The group scheme `Pic^τ_{X/k}` is a different object. Num(X/S) is the integral quotient; N¹ with subscript ℚ or ℝ is its scalar extension, and an unsubscripted N¹ means real coefficients. N₁ has real coefficients. Picard number means dimension after finite-dimensionality is proved; the total function `Module.finrank` does not certify finiteness. Curve classes, not arbitrary divisors, generate NE; its closure uses the finite-dimensional real topology and need not be polyhedral.

The degree normalization is χ(C,L) − χ(C,O_C). Thus on P¹, degrees of O(1) and O(−1) are 1 and −1, whereas χ(O)=1 and degree O=0. Restriction of scalars multiplies degree by the finite ground-field degree; extension of the ground field preserves degree of the full base-changed scheme, including multiplicities. On P¹_ℂ viewed over ℝ, degree O(1)=2, and after extension to ℂ the two components each have degree 1. On a double line degree O(1)=2. These witnesses fix the same convention in every subsequent pairing, norm and graph label.

Positive tensor powers have integer exponent at least one. Cartier multiples and rational scaling use a positive nonzero index. Relative global generation refers to the actual evaluation map, rather than only to fibrewise generation. A contraction is proper and its canonical map O_Y → f_*O_X is an isomorphism. Every descended map and isomorphism is under its prescribed source and over its prescribed base. An algebraic closure and a separable closure carry their field embeddings; purely inseparable and separable stages are distinguished. No Frobenius, orientation, Tate-twist or analytic normalization enters these statements.

## Exact supplier contracts

### From Mathlib

Use `AlgebraicGeometry.Scheme` and `AlgebraicGeometry.Scheme.Hom.app` from `Mathlib/AlgebraicGeometry/Scheme.lean` (sections on Hom and maps on sections); `AlgebraicGeometry.IsProper` from `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`, line 41; `AlgebraicGeometry.Flat` from `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`, line 42; and `CategoryTheory.IsPullback` for the cartesian descent square. Properness includes separation, universal closedness and local finite type; the definition does not include flatness, nonemptiness or geometric connectedness. A contraction adds the sheaf isomorphism, expressed on every open by `IsIso` of the map on sections.

Use `CommRing.Pic` and the instance for rings with finite `MaximalSpectrum` in `Mathlib/RingTheory/PicardGroup.lean`, line 545, to obtain trivial Picard groups of finite semilocal algebras. Use `IsPurelyInseparable` from `Mathlib/FieldTheory/PurelyInseparable/Basic.lean`, line 107, `IsAlgClosure`, `IsSepClosure`, `separableClosure.isGalois` (with its normality hypothesis), and `separableClosure.isPurelyInseparable` for the field tower. Use `Module.finrank` from `Mathlib/LinearAlgebra/Dimension/Finrank.lean`, line 61, only on proved finite-dimensional spaces. The finite locally free norm rank uses `AlgebraicGeometry.Scheme.Hom.finrank` from `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`, line 88, with finite, flat and locally finitely presented hypotheses for local constancy; `DistribMulAction` from `Mathlib/Algebra/GroupWithZero/Action/Defs.lean`, line 346, supplies additive monoid actions on the numerical lattice. Use `AlgebraicGeometry.Scheme.Hom.fiber`, `AlgebraicGeometry.Scheme.Hom.fiberι` and `AlgebraicGeometry.Scheme.Hom.fiberToSpecResidueField` from `Mathlib/AlgebraicGeometry/Fiber.lean`, lines 37–46, for the scheme-theoretic fibre `X_s = X ×_S Spec κ(s)` as a κ(s)-scheme, with the instance making the second projection of a pullback of a proper morphism proper (`Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`, line 82); `AlgebraicGeometry.IsNoetherian` from `Mathlib/AlgebraicGeometry/Noetherian.lean`, line 277; and `Subgroup.closure`, `Additive`, `Module.Free` and `Module.Finite` for the numerical groups as ℤ-modules. A subgroup closure is generated by its set without asserting that the set is a subgroup; that the numerically trivial classes already form a subgroup is §0.4. Use `SimpleGraph` and `irreducibleComponents` as the component-graph substrate; the graph constructor here specifies its adjacency. Projective n-space over a field K is `AlgebraicGeometry.Proj` (`Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`) of `MvPolynomial.homogeneousSubmodule (Fin (n + 1)) K` with the grading `MvPolynomial.gradedAlgebra` (`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`, line 613), mapped to `Spec K` by `AlgebraicGeometry.Proj.toSpecZero` (`Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean`, line 151) followed by the degree-zero structure map; closed immersions are `AlgebraicGeometry.IsClosedImmersion`. Smoothness of a surface is `AlgebraicGeometry.Smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, line 59), the image point of a geometric point `ā : Spec Ω → Z` is the image of `IsLocalRing.closedPoint`, and the residue field enters through `AlgebraicGeometry.Scheme.fromSpecResidueField` (`Mathlib/AlgebraicGeometry/ResidueField.lean`, line 237). The quotient factorization used in §2.11 is the universal property underlying `QuotientAddGroup.lift` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean` and `CategoryTheory.Limits.cokernel.desc` for abelian sheaves.

### From Tau Ceti

Consume `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `TauCeti.AlgebraicGeometry.LineBundleClass`, its commutative group structure, `TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback`, and `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree` from `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, `Class.lean`, `Pullback.lean` and `Degree.lean`. Euler degree uses the degree-two truncated Euler characteristic; its unrestricted definition neither assumes properness nor proves finite-dimensionality of cohomology. Use it as curve degree only with proper dimension-at-most-one coherent finiteness and vanishing. The regular integral-curve comparison and tensor additivity are `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree_eq_relativeDegree` and `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree_mul` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean`, on the proper integral curve, local DVR and finite-dimensional H¹ hypotheses stated there.

Consume `Matrix.dotProduct_mulVec_nonpos_of_mulVec_eq_zero` and `Matrix.dotProduct_mulVec_eq_zero_iff_of_mulVec_eq_zero` from `TauCeti/LinearAlgebra/Matrix/NegSemidef.lean`, and `TauCeti.NumericalType.sum_sum_intersection_mul_neg` from `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/IntersectionForm.lean`. Symmetry, nonnegative off-diagonal entries, a positive kernel vector and connectedness of its support graph give semidefiniteness and its one-dimensional radical; proper principal submatrices are negative definite. The support graph of such a matrix is `TauCeti.NumericalType.intersectionGraph` from `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Topology.lean`, and `TauCeti.NumericalType.intersectionGraph_connected` turns the `connected` field of a `TauCeti.NumericalType` into connectedness of that `SimpleGraph`; the field itself is supplied, for a fibre, by Zariski connectedness (§4.6). For N=[[-2,2],[2,-2]], the quadratic value is −2(a−b)², and the radical is the line (a,a), fixing the sign.

Consume `TauCeti.biadditiveToIntBilinear`, `TauCeti.leftRadical`, `TauCeti.rightRadical`, `TauCeti.LeftNumericalQuotient`, `TauCeti.RightNumericalQuotient`, `TauCeti.numericalPairing` and `TauCeti.numericalPairing_nondegenerate` from `TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` for the two radical quotients of a pairing and the nondegenerate pairing they induce. Applied to the degree pairing of invertible sheaves with relative one-cycles (§1.4), the left radical is the numerical kernel of §0.4 and the right quotient is the cycle side N₁; the abstract API proves nondegeneracy of the descended pairing, while the identification of the left radical with Pic^τ(X/S) is §§0.4–0.5 here.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §§0.9, 0.11 and 0.23 for finite-presentation limits, field descent and universal homeomorphisms; §§1.1–1.11 for fpqc descent and algebraic spaces; §§2.1–2.2 for site morphisms and Leray; §2.6 for coherent flat base change; §§2.10–2.11 for smooth-group étale/fppf comparison, Hilbert 90, Kummer and `finite_pushforward_exact` on **small étale sites for abelian sheaves**; §§2.15 and 2.22 for field and scheme Brauer comparisons. Exactness of arbitrary finite fppf pushforward is not an input. The Leray edge has source H²(k,h_*G_m) and target H²(X,G_m); for Spec ℂ → Spec ℝ both degree-two sides are zero, and for the identity of Spec ℝ both equal ℤ/2 with identity map.

Consume §2.15 `etale_galois_comparison`, the equivalence between abelian sheaves on the small étale site of a field and discrete abelian groups with continuous absolute Galois action. Applied to the represented commutative étale group scheme in §2.6, it identifies the numerical local system with its geometric numerical lattice. The Galois group itself need not be abelian.

Consume §3.5 for the finite locally free line-bundle norm, rank formula, composition and base change; §§4.9–4.10 for Stein factorization and proper formal existence; §4.12 for generic flatness, Chow's lemma and domination; §§5.2–5.3 for proper pushforward and iterated first-Chern intersections; §5.9 for geometric and arithmetic surface intersections, retaining residue degrees; and §5.10 for the supplied smooth projective surface numerical quotient. The projective nef-and-big criterion is the exact extension of §5.3 specified below; its proper extension is §1.6 here with the parent birational comparison contract.

What SchemeAndStackFoundations must provide (gap:relative-exceptional-degree-witnesses): For a projective birational morphism from a regular variety to a normal variety over any field, provide finitely many contracted integral curves whose Cartier degrees detect every nonzero rational combination of exceptional prime divisors, with field-extension compatibility. This extends §5.9's surface input to the relative comparison of §5.9 here; it is formulated in intersection degrees, so it does not consume this roadmap's numerical quotient.

What SchemeAndStackFoundations must provide (gap:projective-nef-big-criterion): For an integral projective scheme V of dimension n over a field and an invertible sheaf L on V of nonnegative degree on every integral curve in V, prove that (L^n·V) > 0 if and only if there are c > 0 and an integer a ≥ 1 with h⁰(V, L^m) ≥ c·m^n for every sufficiently large m divisible by a. This extends §5.3; its integral case is KEE99 Definition–Lemma 0.0, line 46, where bigness is birationality of the map of a high power. It is stated in section dimensions and intersection numbers and uses no bigness predicate of a later roadmap.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume §§1.4–1.5 for projective embeddings, twists and Hilbert polynomials, §1.6 for `bigLineBundle`, `boundedSupportParameters` and the finite-family support reduction, §2.1 for Hilbert functors as Quot, Layer 3 for effective and polarized descent, §§7.3 and 7.6.1–7.6.1a for Picard stacks, sheafification and section rigidification, and §7.9 for group-space components. The projective big predicate `bigLineBundle` agrees with the section-growth bigness of §1.6 here on projective geometrically integral schemes; that comparison is a §1.6 statement here, not a supplier obligation. The parent's projective Hilbert scheme does not by itself give the proper nonprojective Hilbert algebraic space.

What AlgebraicModuliForArithmeticGeometry must provide (gap:relative-numerical-component-reduction): For every proper morphism f : X → S with S Noetherian, provide finitely many points s₁, …, s_n of S such that an invertible sheaf on X has degree zero, over the residue field, on every integral curve in every fibre of f if and only if it has degree zero on every integral curve in the fibres over s₁, …, s_n. This extends §1.6; it is stated in curve degrees and uses no numerical quotient of this roadmap. On P¹ ⊔ P¹ over a field, O(1) ⊔ O(−1) has degree 1 on a curve of the only fibre, so the criterion separates it from O, although both have the Euler polynomial 2n + 2.

What AlgebraicModuliForArithmeticGeometry must provide (gap:proper-bigness-birational-comparison): For a proper birational morphism π : V′ → V of integral proper schemes of dimension n over a field and an invertible sheaf L on V, prove h⁰(V, L^m) ≤ h⁰(V′, π*L^m) for every m ≥ 1, with difference at most C·m^(n−1) for a constant C and all m ≥ 1 when n ≥ 1. This extends §1.6; it is stated in section dimensions and uses no bigness predicate of this roadmap.

What AlgebraicModuliForArithmeticGeometry must provide (gap:proper-picard-nonflat-descent): Provide nilpotent dévissage and nonflat relative representability for pullback of Picard sheaves along surjective maps of proper schemes over a field, by quasi-affine maps of finite type, together with the representability descent used in Kleiman Corollary 4.18.3. This extends §7.3.

What AlgebraicModuliForArithmeticGeometry must provide (gap:proper-hilbert-space-tangent): Represent the Hilbert functor of proper flat finitely presented closed subschemes of a separated finitely presented scheme by an algebraic space locally of finite presentation, with geometric tangent space Hom(I_C,O_C) at C. This extends §2.1.

### From TauCetiRoadmap.ComplexComparisonPartII

Consume §C3.2d.2 `relative_picard_algebraicSpace` only for proper flat finitely presented morphisms with universal functions, §C3.2d.4 `picard_brauer_obstruction` on that domain, §C3.2e `picardTorsionComponent` for projective flat geometrically integral fibres over a locally Noetherian base, and §§C3.2f.1–C3.2f.2 for the identity-component sheaf and representability. The arbitrary proper-field theorems of Layer 2 include cases with a finite nontrivial constants algebra; their obstruction target is Br(X^aff), not automatically Br(k).

### From TauCetiRoadmap.JacobianChallenge and TauCetiRoadmap.StableReduction

Consume JacobianChallenge Layer A for degree and its divisor comparison, Layers B–C for coherent finiteness, base change and Euler characteristics, and Layer D for the Picard functor and projective geometrically integral representability. Consume StableReduction Layer 2, J-A2, for degree χ(L) − χ(O) on proper pure one-dimensional schemes over a field, its tensor additivity, field-extension invariance and nodal normalization law (the length-weighted component law is §0.1 here); StableReduction Layer 2 for relative Proj, generation, openness of fibrewise ampleness for proper finitely presented families of schemes, and contraction descent along proper surjective morphisms with O_Y ≅ c_*O_X universally; Layer 1 for nodal graph comparison; and Layer 4 for regular-model intersections. In the common two-component fibre with multiplicities (1,1), each component is orthogonal to the full fibre; with intersection 1 the matrix is [[−1,1],[1,−1]], so the value on (1,0) is −1 and on (1,1) is 0. This is the same sign as the Tau Ceti matrix input.

### From TauCetiRoadmap.AlgebraicVectorBundles

Consume L0A–L0C for tensor, dual and finite locally free operations and L1A–L1B for relative Spec and the affine universal property. The application X^aff = Spec H⁰(X,O_X) retains the nonreduced finite constants algebra. For k[ε]/ε² the units include 1+εa; their multiplication is 1+ε(a+b), so reduction would lose this additive subgroup.

### From TauCetiRoadmap.AbundanceStatement

Consume Layers 4A–4B for degree intersections, projective characteristic-zero numerical spaces and finite-dimensional duality, 4C for the cone and nef cone, 4D for the projective ample comparison, and Layer 5 for semiampleness on that domain. The comparisons in Layers 0–3 identify the actual degree pairing and quotients; they do not identify actual sheaves with their numerical classes. On P¹×P¹, (a,b) pairs with the two ruling curves as b and a; the nef cone is a≥0, b≥0, and O(1,0) defines the first projection.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §F.3, the proper constructibility, finiteness and ctf-preservation theorem: for proper finite-type schemes over a separably closed field and finite constructible coefficients with invertible annihilator, every cohomology group is finite, with bounded amplitude. Together with Kummer this gives the all-dimensional H²(X,μ_ℓ) input for §1.2, including reducible and nonreduced proper X. For P¹ over an algebraically closed field, H²(X,μ_ℓ) has dimension 1 over 𝔽_ℓ and the numerical rank is 1; for Spec k both are 0. The input requires ℓ invertible, including at ℓ=2 and 3; it does not assert the same étale Kummer bound at ℓ=char k.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Consume §7.8, the field specialization, for a projective regular resolution of every reduced finite-type scheme over a characteristic-zero field, with smooth source and the prescribed regular open preserved. Apply it to the closure of the graph of two projective resolutions to obtain a common projective smooth domination in §5.9. The positive-characteristic relative target instead quantifies over supplied projective regular resolutions and common regular dominations; it assumes no resolution-existence theorem in that characteristic.

## How to read the build

Layer 0 applies imported degree and proves the fibre-testing equivalences. Layer 1 forms numerical quotients and dual cones, proving finiteness before using a Euclidean topology or a natural-number Picard rank. Layer 2 builds proper-field Picard representability, the constants-algebra Brauer obstruction and the étale numerical local system. Layer 3 passes from semiample sheaves to contractions and descends them, treating inseparability before finite Galois averaging. Layer 4 combines negative intersections with Hilbert rigidity to descend curves and fibre graphs. Layer 5 applies these interfaces to DVR families and vertical descent and constructs the birational rank. A *Needs:* line separates statement vocabulary from the inputs to the indicated proof route; a different proof may omit route-only inputs. Every supplier extension has its exact contract above. `Suggested.lean` contains the headlines `numericalClassGroup_free_finite`, `relNumericalClassGroup_free_finite`, `constantNumericalClasses_iff_positivePowerDescent`, `numericallyTrivial_torsion_of_algebraic_finiteField`, `contraction_descends_purelyInseparable`, `contraction_descends_of_constantNumericalClasses`, `constantNumericalClasses_iff_componentGraphDescent`, `fibreComponentGraph_descends_of_constantNumericalClasses`, `residueField_eq_of_reducible_geometricFibre` and `lineBundle_lifts_completeDVR_of_h2_zero`, with the simple definitions `NumericallyTrivial`, `RelNumericallyTrivial`, `numericallyTrivialClasses`, `relNumericallyTrivialClasses`, `HasTrivialNumericalGaloisAction`, `IsContraction`, `IsProjectiveOver` and `componentGraph`; its module docstring identifies the carriers required to state the other headline results.

## Layer 0: degrees and relative numerical triviality

### 0.1 The relative curve pairing

For an integral curve C in a fibre X_s of f : X → S, define the relative numerical pairing (L·C) to be the imported degree over κ(s) of L restricted to C. Prove that this application agrees with the degree of c₁(L) intersected with the fundamental one-cycle. For a proper scheme C of dimension at most one, that cycle is the sum of its reduced one-dimensional components with generic-length multiplicities; zero-dimensional components contribute zero. (KLE05, Definition 6.1, p. 52; KLE05 line 2480; BMP23, §2.5, paragraph before Remark 2.22, p. 18; BMP23 line 819; STACKS, Lemma 33.44.6, tag 0AYW, Varieties line 4474, for the length-weighted law; STACKS, §33.45, tag 0BEL, Varieties line 4676).

The API gives the following facts.

- The relative pairing is integer-valued and depends only on the line-bundle class, with the imported curve degree as its value.
- deg_κ(L ⊗ M) = deg_κ(L) + deg_κ(M); deg_κ(O_C) = 0.
- `deg_κ(L^{-1})` = −deg_κ(L) and `deg_κ(L^{⊗n})` = n·deg_κ(L) for n ∈ ℤ.
- deg_κ(L) = Σ_i `length(O_{C,η_i})·deg_κ(L|_{(C_i)_red})` over the generic points η_i of the one-dimensional irreducible components.
- For a finite surjective κ-morphism π : C′ → C of integral proper curves, deg_κ(π*L) = [κ(C′) : κ(C)]·deg_κ(L).
- If C is proper over a finite extension κ′ ⊃ κ, then deg_κ(L) = `[κ′ : κ]·deg_{κ′}(L)`.
- For any field extension K/κ, deg_K(L_K on C_K) = deg_κ(L on C) (flat base change of cohomology).
- On an integral proper curve, deg_κ(L) = deg(c₁(L) ∩ [C]) by SchemeAndStackFoundations §5.3 `c1_degree_curve` over κ, and the degree agrees with JacobianChallenge Layer A's deg for smooth projective geometrically integral curves.

One proof route is as follows. Tensor additivity and field-extension invariance are StableReduction Layer 2, J-A2, and the inverse and power laws follow from additivity. The restriction-of-scalars law is the identity dim_κ = [κ′:κ]·dim_κ′ on each cohomology group. The length-weighted component law is proved here by dévissage of O_C along the nilpotent filtration at each generic point, as in STACKS tag 0AYW. On each integral component, `deg_κ(L|_{C_i}) = deg(c₁(L) ∩ [C_i])` is SchemeAndStackFoundations §5.3 `c1_degree_curve` over κ(s); summing with the generic lengths gives the comparison with the fundamental one-cycle. The finite-pullback law is the projection formula `proper_pushforward` of SchemeAndStackFoundations §5.3 together with π_*[C′] = [κ(C′):κ(C)]·[C] for proper pushforward of cycles (SchemeAndStackFoundations §5.2).

*Needs:* JacobianChallenge Layer A; JacobianChallenge Layer B; JacobianChallenge Layer C; StableReduction Layer 2, J-A2; SchemeAndStackFoundations §§5.2–5.3; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; Mathlib `AlgebraicGeometry.IsProper`.

**Checks.**

- On P¹_κ, deg_κ(O(m)) = m for every m ∈ ℤ.
- For C = P¹_ℂ viewed as a proper ℝ-scheme, deg_ℝ(O(1)) = 2 and deg_ℂ(O(1)) = 1: the base field is part of the data.
- deg_κ(O_C) = 0, and on a zero-dimensional proper κ-scheme every invertible sheaf has degree 0.
- For the nonreduced conic C = V(y²) ⊂ P²_κ, χ(O_C) = 1 and χ(O_C(1)) = 3, so deg_κ(O(1)|_C) = 3 − 1 = 2 = 2·deg(O(1)|_line): nilpotent multiplicities count. For the distinct thickening P¹ × Spec κ[ε]/(ε²), the Euler characteristics are 2 and 4, giving the same degree 2; these are not the same scheme.
- χ(L) is not the degree: on P¹_κ, χ(O) = 1 while deg(O) = 0.

### 0.2 Divisibility of curve degrees by the geometric index d_C

Let X be a scheme locally of finite type over a field k, C ⊂ X an integral curve proper over k, k̄ an algebraic closure and φ : `X_{k̄}` → X the projection. There is an integer d_C ≥ 1, depending only on C, such that for every invertible sheaf L on X (more generally every ℝ-Cartier divisor D) and every integral curve C′ ⊂ `X_{k̄}` with φ(C′) = C one has (L·C)_k = `d_C·(φ*L·C′)_{k̄}`. In particular d_C divides (L·C)_k for every invertible L. Explicitly d_C = m·r, where `(C_{k̄})_red` has r irreducible components, all of multiplicity m in the fundamental cycle of `C_{k̄}`. (BMP23, Lemma 2.47 and proof, p. 25; BMP23 line 1122; DW22, Lemma 4.1 and proof, pp. 12–13; Lemma 3.6 for the index; DW22 line 507).

One proof route is as follows. The group Aut(k̄/k) permutes the irreducible components of `C_{k̄}` transitively, since C is irreducible and k̄/k is normal (purely inseparable steps are homeomorphisms). Conjugate components have equal multiplicity in `[C_{k̄}]` and equal φ*L-degree, because φ*L is Aut(k̄/k)-invariant up to isomorphism. Field-extension invariance of degrees (curve-degree API) gives (L·C)_k = `deg_{k̄}(φ*L|_{C_{k̄}})` = Σ_i m·(φ*L·C′_i) = m·r·(φ*L·C′). The intrinsic factor is d_C=m r, a positive integer. In the notation of DW22 Lemma 4.1 it is the quotient [L:k]/[K(C_L):K(C)], not their product.

*Needs:* §0.1; Mathlib `IsAlgClosure`; SchemeAndStackFoundations §§0.9, 0.11, 0.23.

**Checks.**

- For C = P¹_ℂ viewed over ℝ, d_C = 2 and every invertible sheaf has even ℝ-degree on C.
- For k = F_p(t), k′ = `k(t^{1/p})` and C = `P¹_{k′}` viewed over k, `C_{k̄}` is a p-fold thickening of `P¹_{k̄}`: d_C = p.
- For a geometrically integral curve d_C=1, so O(1) on P¹ has degree 1; a factor depending only on characteristic would fail over ℝ.

Here d_C is the geometric component factor m r, not the gcd of closed-point residue degrees. For the pointless real conic it is 1, although all line-bundle degrees are even and the usual curve index is 2.

### 0.3 Numerical triviality is invariant under extension of the base field

Let X be proper over a field k, L ∈ Pic(X) and K/k any field extension. Then (L·C) = 0 for every integral curve C ⊂ X if and only if (L_K·C′) = 0 for every integral curve C′ ⊂ X_K. (KLE05, Proposition 6.12, p. 57, KLE05 line 2724, for compatibility of Pic^τ with field extension; KLE05, Theorem 6.3, pp. 52–53, KLE05 line 2498, with Remark 6.14, pp. 57–58, KLE05 line 2754, for the geometric case over an algebraically closed field. The equivalence for an arbitrary extension K/k is proved here.)

One proof route is as follows. (⇐) For C ⊂ X, the base change C_K is a proper one-dimensional K-scheme and deg_k(L|_C) = `deg_K(L_K|_{C_K})` = Σ_i m_i (L_K·C_i) = 0. (⇒), K/k finite: X_K → X is finite; a curve C′ ⊂ X_K maps finitely onto an integral curve C ⊂ X, and the projection formula gives [K:k]·(L_K·C′)_K = [κ(C′):κ(C)]·(L·C)_k = 0. (⇒), general K: C′ is defined over a finitely generated k-subalgebra A ⊂ K; spread C′ to a flat proper family of curves over an open of Spec A and specialise to a closed point a, whose residue field is finite over k (Nullstellensatz). Degrees are constant in flat proper families of curves (`χ(L^{⊗n})` is locally constant), so (L_K·C′) equals a degree on `X_{κ(a)}`, which vanishes by the finite case. The direct specialization route precedes the Picard-scheme comparison of §2.5; it does not require Picard representability.

*Needs:* §0.1; SchemeAndStackFoundations §§0.9, 0.11, 0.23; JacobianChallenge Layer C.

**Checks.**

- On P¹_ℝ, O(m) is numerically trivial iff it is so on P¹_ℂ, iff m = 0.
- A curve on X_K need not map onto a curve of X: a generic line of `P²_{k(u)}` dominates P²_k. Its O(1)-degree is 1, and specialization, rather than taking the image as a curve, detects the same nonzero degree.

### 0.4 Relative numerical triviality and the subgroup Pic^τ(X/S)

For proper f : X → S, define L ≡_f 0 by vanishing of (L·C) for every point s of S and every integral curve C in the scheme-theoretic fibre X_s, with degrees over κ(s); the definition needs no hypothesis on S, and every theorem below assumes S Noetherian. Define numerical equivalence of L and M by L tensor M inverse ≡_f 0, and let Pic^τ(X/S) be the subgroup of Pic(X) satisfying this condition. Compare the definition with testing closed fibres and geometric fibres by §§0.3 and 0.5. (BMP23, Remark 2.22, p. 19; BMP23 line 825; SCH23, §1, p. 4; SCH23 line 167).

The absolute-field predicate `NumericallyTrivial` in the acceptance test is the degree-zero condition on every integral closed curve, using native pullback and Euler degree. The relative predicate `RelNumericallyTrivial` applies `NumericallyTrivial` over κ(s) to the pullback of L to the scheme-theoretic fibre X_s (Mathlib `AlgebraicGeometry.Scheme.Hom.fiber`) of every point s.

The API gives the following facts.

- The predicate L ≡_f 0 on Pic(X) for proper f : X → S, which is `RelNumericallyTrivial`; it depends only on the class of L.
- For the structure morphism of a proper k-scheme X, `RelNumericallyTrivial` agrees with `NumericallyTrivial` through the canonical isomorphism of X with its fibre over the point of Spec k.
- Pic^τ(X/S) is a subgroup of Pic(X): closed under ⊗, inverse, containing O_X.
- f*N ≡_f 0 for N ∈ Pic(S).
- L ≡_f 0 iff (L·C) = 0 for all curves C in fibres over closed points of S; this characterization is proved in §0.5 from the all-fibres definition and is included here as part of the interface.
- L ≡_f 0 iff `L_{s̄}` is numerically trivial on `X_{s̄}` for every geometric point s̄ (§0.3).
- If L ≡_f 0 then L_T `≡_{f_T}` 0 for every morphism T → S of Noetherian schemes.
- If Z ⊂ X is closed then L ≡_f 0 implies L|_Z `≡_{f|_Z}` 0.
- For S = Spec k with k algebraically closed and X a smooth projective surface, L ≡ 0 iff L is the supplied surface numerical relation to O_X in SchemeAndStackFoundations §5.10; for projective varieties over algebraically closed fields of characteristic zero it is AbundanceStatement Layer 4B's numerical equivalence.

One proof route is as follows. Tensor additivity and inverse degree give the subgroup. Establish the independent all-fibres definition before applying the field-extension theorem of §0.3 and the closed-point theorem of §0.5. This order uses neither characterization to define the other.

*Needs:* §0.1, native line bundles and Mathlib `AlgebraicGeometry.Scheme.Hom.fiber` for the definition and subgroup; §0.3 for geometric comparison.

**Checks.**

- On P¹_k over S = Spec k, O(m) ≡ 0 iff m = 0.
- For f = id_S every L ∈ Pic(S) is f-numerically trivial, so Pic^τ(S/S) = Pic(S) even when Pic(S) ≠ 0.
- On an elliptic curve E over k̄ with distinct points p, q, O(p − q) ≡ 0 although O(p − q) ≇ O_E: numerically trivial is weaker than trivial.
- For the first projection f : P¹×P¹ → P¹, O(a,b) ≡_f 0 iff b = 0, while O(a,b) ≡ 0 over Spec k iff a = b = 0.
- On an Enriques surface over k̄ of characteristic ≠ 2, ω is numerically trivial and nontrivial.

### 0.5 Numerical triviality can be tested over closed points of the base

Let f : X → S be proper with S Noetherian and L ∈ Pic(X). If (L·D) = 0 for every closed point t ∈ S and every integral curve D ⊂ X_t, then L ≡_f 0. (BMP23, Remark 2.22, p. 19; BMP23 line 825; STACKS, Lemma 10.119.13, tag 00PH, Algebra line 13506).

One proof route is as follows. Suppose the conclusion fails at some point; by Noetherian induction choose a failing point s whose closure T is minimal. T ≠ {s}, since closed points satisfy the hypothesis. Choose a codimension-one point t′ of T and apply Stacks Lemma 10.119.13 (00PH) to `O_{T,t′}`. This gives a dominating DVR R with fraction field κ(s); its residue field extends κ(t′), and that extension need not be assumed finite. For a curve C ⊂ X_s, base change its closure to Spec R and take the flat closure Z of its generic fibre; Z is proper and flat of relative dimension one over R, and `χ(L^{⊗n})` is constant on its fibres, so the degree of L on C (with generic ground field κ(s)) equals the degree on the special fibre, a one-dimensional proper scheme over κ(R). The special fibre's one-dimensional components lie in `X_{t′}` ⊗ κ(R); L is numerically trivial on `X_{t′}` by minimality of T, hence on `X_{t′}` ⊗ κ(R) (§0.3). The cycle formula gives degree 0, a contradiction.

*Needs:* §0.1; §0.3; §0.4 for the all-fibres definition of L ≡_f 0; SchemeAndStackFoundations §§0.9, 0.11, 0.23; JacobianChallenge Layer C.

**Checks.**

- Over S = Spec ℤ_p and X = P¹_S, testing the special fibre recovers O(m) ≡_f 0 iff m = 0.
- Generic fibres alone do not suffice: let X = Bl_x(P¹_R) for a k-rational point x of the special fibre over a DVR R. The exceptional curve E is P¹_k, O(E) has degree −1 on E, and its restriction to the generic fibre is trivial.

### 0.6 Proper surjective pullback detects numerical triviality

Let g : X′ → X be a proper surjective morphism of schemes proper over a Noetherian S. For L ∈ Pic(X), L ≡_S 0 if and only if g*L ≡_S 0. (KLE05, Remark 6.14, pp. 57–58; KLE05 line 2742; STACKS, Lemma 33.45.7, tag 0BET, Varieties line 4790).

One proof route is as follows. (⇒) A curve C′ in a fibre of X′ maps onto a curve D or to a point; by the projection formula (g*L·C′) = [κ(C′):κ(D)]·(L·D), or 0. (⇐) Given a curve D ⊂ X_s, the generic fibre of g over the generic point of D is a nonempty proper scheme; the closure of one of its closed points is an integral curve C′ ⊂ X′_s mapping finitely onto D, and (g*L·C′) = [κ(C′):κ(D)]·(L·D) with a positive factor.

*Needs:* §0.4; §0.1; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10.

**Checks.**

- For the normalization ν : C̃ → C of a nodal cubic, ν*L ≡ 0 iff L ≡ 0.
- For the blow-up g : Bl_p P² → P², g*O(1) is not numerically trivial; the exceptional curve meets it in degree 0 but a line's strict transform does not.

### Examples

The trivial sheaf on a zero-dimensional proper scheme has degree 0. On a doubled line O(1) has degree 2; on P¹_ℂ considered over ℝ it also has degree 2, for a different reason: the latter splits into two geometric components of degree 1. For Bl_x(P¹_R) with x a rational closed point of the special fibre, O(E) has generic degree 0 and exceptional degree −1. These distinguish multiplicity, constants-field degree and specialization (Stacks §33.45; BMP23 Remark 2.22; §§0.1–0.5).

### Dependencies

Mathlib scheme morphisms and field extensions; Tau Ceti line bundles and degree; JacobianChallenge Layers A–C; StableReduction Layer 2, J-A2; SchemeAndStackFoundations §§0.9, 0.11, 5.2–5.3. Within the layer the order is pairing, field extension, definition of numerical triviality, closed-point detection and surjective pullback; the curve-index theorem uses the pairing independently.

## Layer 1: numerical groups, cones, nefness and bigness

### 1.1 The relative numerical group Num(X/S)

For f : X → S proper put Num(X/S) := Pic(X)/Pic^τ(X/S), N¹(X/S)_ℚ := Num(X/S) ⊗ ℚ and N¹(X/S) := N¹(X/S)_ℝ := Num(X/S) ⊗ ℝ, with the class map [−] : Pic(X) → Num(X/S). In the acceptance test Num(X/S) is the quotient of Tau Ceti's `TauCeti.AlgebraicGeometry.LineBundleClass` of X by the subgroup `relNumericallyTrivialClasses` of f, and for X proper over a field k with structure morphism x, Num(X/k) is the quotient by the subgroup `numericallyTrivialClasses` of (k, X, x). Equivalently N¹(X/S)_ℚ is (Pic(X) ⊗ ℚ) modulo the kernel of the ℚ-linear degree pairing with curves in fibres, which is Hacon–Witaszek's N¹(X) = Pic(X) ⊗ ℚ/≡ for S = Spec k. (BMP23, Remark 2.22, p. 19; BMP23 line 825; HW23, §1, after Theorem 1.3, p. 3; HW23 line 96).

The API gives the following facts.

- Num(X/S) := Pic(X)/Pic^τ(X/S), an abelian group with class map Pic(X) → Num(X/S).
- `relNumericallyTrivialClasses` and, over a field, `numericallyTrivialClasses` are the subgroups of Pic(X) generated by the classes of relatively, respectively absolutely, numerically trivial invertible sheaves; since those classes form a subgroup (§0.4), each consists exactly of them and equals Pic^τ(X/S), respectively Pic^τ(X/k).
- For the structure morphism of a proper k-scheme X, the two subgroups agree through the canonical isomorphism of X with its fibre over the point of Spec k.
- [L] = [M] in Num(X/S) iff L ⊗ `M^{-1}` ≡_f 0.
- The degree pairing Num(X/S) × {curves in fibres} → ℤ descends from Pic(X).
- Num(X/S) is torsion-free.
- N¹(X/S)_ℚ := Num ⊗ ℚ and N¹(X/S) := Num ⊗ ℝ with the injective maps Num ↪ N¹_ℚ ↪ N¹_ℝ.
- An S-morphism g : X′ → X of proper S-schemes induces g* : Num(X/S) → Num(X′/S), with id* = id and (g∘h)* = h*∘g*; injective when g is surjective.
- For a field extension K/k, Num(X/k) → Num(X_K/K) is injective (§0.3).
- For normal X and a ℚ-Cartier Weil divisor D with rD Cartier, [D] := (1/r)[O_X(rD)] ∈ N¹(X/S)_ℚ, independent of r.
- For a smooth projective surface over an algebraically closed field, Num(X/k) is SchemeAndStackFoundations §5.10's Num S; for projective varieties over algebraically closed fields of characteristic zero, N¹(X/k)_ℝ is AbundanceStatement Layer 4B's N¹(X)_ℝ.

One proof route is as follows. Num(X/S) is torsion-free: if `L^{⊗n}` ≡_f 0 with n ≠ 0, cancel n in each integer degree. Torsion-freeness makes Num → N¹_ℚ → N¹_ℝ injective, and tensoring the exact sequence 0 → Pic^τ(X/S) → Pic(X) → Num → 0 with ℚ identifies N¹_ℚ with Pic ⊗ ℚ modulo ℚ-numerical equivalence.

*Needs:* §0.4; §0.6; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; Mathlib `Subgroup.closure`.

**Checks.**

- Num(P¹_k/k) ≅ ℤ via the degree.
- Num(S/S) = 0 for the identity, whatever Pic(S) is: every fibre is a point, so every class is relatively numerically trivial.
- For the first projection P¹×P¹ → P¹, Num ≅ ℤ by the fibre degree b of O(a,b); over Spec k, Num ≅ ℤ² with intersection matrix [[0,1],[1,0]].
- For an elliptic curve E over k̄, Pic(E) ≅ E(k̄) × ℤ but Num(E/k̄) ≅ ℤ: the numerical group is not the Picard group.
- For an Enriques surface Y over k̄ (characteristic ≠ 2), the class of ω has order 2 in Pic(Y) and is zero in Num(Y/k̄).

### 1.2 Numerical Néron–Severi theorem for proper schemes over a field

For X proper over any field k, prove that Num(X/k) is free abelian of finite rank; this is `numericalClassGroup_free_finite`. It extends SchemeAndStackFoundations §5.10 `Num.free_finiteRank`, which treats smooth projective surfaces over algebraically closed fields, to arbitrary proper schemes over arbitrary fields. Its rank ρ(X) ∈ ℕ, the Picard number, equals dim_ℝ N¹(X/k) and is at most the rank after extension to an algebraic closure. If k is algebraically closed and ℓ is a prime invertible in k, prove ρ(X) ≤ dim over 𝔽_ℓ of H²_ét(X,μ_ℓ). (KLE05, Remark 6.19, pp. 59–60; KLE05 line 2840; BMP23, Remark 2.22, p. 19; BMP23 line 825).

For n=0, Num(P⁰)=0; for n≥1, Num(Pⁿ)=ℤ. In the elliptic-product Check below, End(E) has rank 1, 2 or 4, giving ρ=3, 4 or 6; the last value is the supersingular case.

One proof route is as follows. Extend the field to an algebraic closure using injectivity of numerical pullback. For any r independent numerical classes, choose r curve evaluations of nonzero determinant. The image Λ of all classes in ℤ^r is a rank-r lattice. Its intrinsic quotient Λ/ℓΛ has dimension r and is a quotient of Pic(X)/ℓ; this does not assert that its image in (ℤ/ℓ)^r has dimension r. Kummer injects Pic(X)/ℓ into H²_ét(X,μ_ℓ); EtaleCohomologyFoundations §F.3 makes that group finite. Hence independent sets have bounded size. A maximal independent set and r separating curves then embed the whole torsion-free numerical group into ℤ^r, proving finite freeness.

*Needs:* §1.1; §0.3; SchemeAndStackFoundations §§2.1–2.2, 2.11, 2.15; EtaleCohomologyFoundations §F.3; Mathlib `Module.finrank`.

**Checks.**

- For n≥1, ρ(P^n_k)=1; for n=0, ρ(P⁰_k)=0.
- For an elliptic curve E over k̄, ρ(E × E) = 2 + rank End(E) ∈ {3, 4, 6}, the value 6 occurring only for supersingular E in positive characteristic.

### 1.3 Finite rank of Num(X/S) over a Noetherian base and the relative Picard number

For every proper f : X → S with S Noetherian, prove that Num(X/S) is free abelian of finite rank; this is `relNumericalClassGroup_free_finite`. Consequently its rational and real scalar extensions are finite-dimensional, and the relative Picard number ρ(X/S) := dim_ℝ N¹(X/S) is a natural number. The proof uses the finite-point detection of the parent supplier contract, rather than testing a single Euler polynomial on a reducible fibre. (BMP23, Remark 2.22, p. 19; BMP23 line 825).

The detection is stated in curve degrees, curve by curve: for the disjoint union of two lines, a degree vector (1,−1) has zero total Euler difference but is not numerically zero.

One proof route is as follows. The parent contract gives points s₁, …, s_n of S such that L ≡_f 0 exactly when L has degree zero on every integral curve in the fibres over s₁, …, s_n. Hence `L ↦ (L|_{X_{s_j}})_j` induces an injective homomorphism `Num(X/S) → ⊕_j Num(X_{s_j}/κ(s_j))`, each summand is free of finite rank by §1.2, and a subgroup of a finitely generated free abelian group is free of finite rank. The supplier obtains the points by Noetherian induction over a projective Chow cover with geometrically integral flat component families; generic flatness alone does not give them.

*Needs:* §1.1; §1.2; AlgebraicModuliForArithmeticGeometry §1.6 with the finite-point detection contract; Mathlib `Module.finrank`.

**Checks.**

- For S = Spec k this is §1.2: P¹ has lattice ℤ and P⁰ has lattice 0. A strictly positive Picard rank would fail on P⁰.
- ρ(P¹×P¹/k) = 2 and ρ(P¹×P¹/P¹) = 1 for a projection, and ρ(S/S) = 0 for the identity.
- ρ(X/S) ≤ ρ(X/k) for X proper over a field and S proper over k.
- The Noetherian hypothesis is needed for finite generation: for `S = Spec ∏_{n∈ℕ} k`, Pic(P¹_S) = Pic(S) × H⁰(S, ℤ), and Num(P¹_S/S) is the group of locally constant ℤ-valued degree functions on the Stone–Čech compactification of ℕ, the bounded integer sequences, which is not finitely generated.
- The Euler-polynomial test cannot be used on a reducible fibre without separating its components: on P¹ ⊔ P¹ with the standard ample sheaf, L = O(1) ⊔ O(−1) satisfies χ(L^p(n)) = χ(O(n)) for all integers p,n but has nonzero component degrees.

### 1.4 Relative 1-cycles N₁(X/S) and the cone of curves NE(X/S)

For f : X → S proper with S Noetherian, a curve over S is an integral one-dimensional closed subscheme C ⊂ X with f(C) a closed point s, proper over κ(s). Let Z₁(X/S)_ℝ be the real vector space on curves over S, paired with Pic(X) by (L·Σa_iC_i) = Σ a_i `(L·C_i)_{κ(s_i)}`. Put N₁(X/S) := Z₁(X/S)_ℝ modulo the cycles pairing to zero with every invertible sheaf. NE(X/S) ⊂ N₁(X/S) is the convex cone of classes Σ a_i[C_i] with a_i ≥ 0, and NE‾(X/S) its closure in the Euclidean topology of the finite-dimensional space N₁(X/S). (BMP23, §2.5, paragraph before Remark 2.22, p. 18; BMP23 line 819; HW23, proof of Theorem 1.3(2a), p. 33; HW23 line 1513).

The API gives the following facts.

- N₁(X/S) as the quotient of real 1-cycles on curves over closed points by the numerically trivial ones.
- The bilinear pairing N¹(X/S) × N₁(X/S) → ℝ.
- The pairing identifies N₁(X/S) with the ℝ-dual of N¹(X/S).
- NE(X/S) and its closure NE‾(X/S), a closed convex cone.
- For an S-morphism g : X′ → X of proper S-schemes, g_*[C] = [κ(C):κ(g(C))]·[g(C)] or 0, with (g*L·γ) = (L·g_*γ) and g_*(NE(X′/S)) ⊂ NE(X/S).

One proof route is as follows. By §0.5, the kernel of Pic(X) → Hom(Z₁(X/S)_ℤ, ℤ) is Pic^τ(X/S). Apply the Tau Ceti numerical-quotient API to the ℝ-bilinear extension of the degree pairing (Pic(X) ⊗ ℝ) × Z₁(X/S)_ℝ → ℝ: N₁(X/S) is its `TauCeti.RightNumericalQuotient`, its left radical is Pic^τ(X/S) ⊗ ℝ because Num(X/S) is free of finite rank and embeds into ℤ^ρ through finitely many curve degrees (§1.3), so its `TauCeti.LeftNumericalQuotient` is N¹(X/S), and `TauCeti.numericalPairing_nondegenerate` makes N¹(X/S) × N₁(X/S) → ℝ nondegenerate on both sides. With N¹(X/S) finite-dimensional (§1.3), nondegeneracy makes N₁(X/S) its dual; NE‾ is a closed convex cone, not assumed polyhedral.

*Needs:* §1.1; §0.5; §1.3 for perfect duality and the finite-dimensional topology; Tau Ceti `TauCeti.numericalPairing_nondegenerate`.

**Checks.**

- For P¹×P¹ over k, N₁ ≅ ℝ² and NE‾ is the closed cone spanned by the classes of the two rulings.
- For f = id_S there are no curves over S: N₁(S/S) = 0 and NE(S/S) = {0}.
- For the first projection P¹×P¹ → P¹, N₁(X/S) = ℝ·[fibre] and NE‾ is its nonnegative ray.
- For X=E×E over ℂ with End(E)=ℤ and product polarization, identify the nef cone with positive semidefinite symmetric 2×2 matrices, and the closed curve cone with its trace dual. The matrix A=[[1,√2],[√2,2]] has determinant 0 and spans an irrational extremal ray containing no nonzero rational class. Hence A is not a finite positive combination of integral curve classes. The positive-definite matrices A+εI approach A: det(A+I)=4 and det(A+I/2)=7/4. Thus NE differs from its closure in this abelian-surface example (PS12, Proposition 1.2, p. 3, PS12 line 98; Theorem 4.3, p. 9, PS12 line 421; the boundary calculation is the argument here).

### 1.5 Relatively nef invertible sheaves and ℝ-Cartier classes

For f : X → S proper with S Noetherian, L ∈ Pic(X) (or a class in N¹(X/S)) is f-nef if (L·C) ≥ 0 for every curve C over S, equivalently if [L] lies in the nef cone Nef(X/S) := {α ∈ N¹(X/S) : α·γ ≥ 0 for γ ∈ NE‾(X/S)}. A ℚ- or ℝ-Cartier divisor is f-nef if its class is. (BMP23, §2.5, paragraph before Remark 2.22, p. 18; BMP23 line 819; WIT22, §2, p. 7; WIT22 line 319).

The API gives the following facts.

- f-nefness of L ∈ Pic(X), of α ∈ N¹(X/S) and of ℚ/ℝ-Cartier divisors.
- Nef(X/S) ⊂ N¹(X/S), the dual of NE‾(X/S); closed and convex.
- L is f-nef iff [L] ∈ Nef(X/S).
- Nef classes are closed under addition and positive scaling; numerically trivial classes are nef.
- If g : X′ → X is an S-morphism of proper S-schemes and L is f-nef then g*L is nef; the converse holds for g surjective.
- Nefness is preserved by base change T → S of Noetherian schemes and detected on geometric fibres.
- For S = Spec k, k algebraically closed of characteristic zero, X a projective variety, f-nefness is AbundanceStatement Layer 4C's nefness.

One proof route is as follows. Nonnegativity on curves extends to NE(X/S) by linearity and to NE‾ by continuity of the pairing; so the two descriptions agree. Testing over all points of S is equivalent: the specialization argument of §0.5 transports a degree on a curve over a nonclosed point to a nonnegative combination of degrees over a closed point.

*Needs:* §1.4; §0.5.

**Checks.**

- On P¹_k, O(m) is nef iff m ≥ 0.
- For f = id_S every invertible sheaf is f-nef (there are no curves over S).
- On Bl_p P² at a k-rational point p, the exceptional curve E has O(E)·E = −1, so O(E) is not nef although it is effective.
- For the first projection P¹×P¹ → P¹, O(a,b) is f-nef iff b ≥ 0, with a arbitrary.
- Numerically trivial classes have degree 0 on every curve, so they are nef; excluding the zero functional would violate this boundary case.

### 1.6 Bigness on integral proper schemes

Extend the supplied projective bigness predicate to an integral proper k-scheme V of dimension n: L is big when there are a positive real c and a positive integer a such that h⁰(V,L^m) ≥ c m^n for every sufficiently large positive m divisible by a. Prove invariance under positive powers and field extension whenever the extended scheme is integral. Prove, for nef L on integral proper V, that bigness is equivalent to positivity of the top first-Chern intersection (L^n·V); the route uses the projective criterion and the proper birational comparison in the supplier contracts. (WIT22, §2, p. 7; WIT22 line 319; KEE99, Definition–Lemma 0.0, printed p. 254 (PDF p. 2); Lemma 1.7, printed p. 262 (PDF p. 10); KEE99 line 46).

The API gives the following facts.

- Bigness of an invertible sheaf on an integral proper k-scheme.
- For integral proper V and nef L, bigness is equivalent to (L^n·V)>0; use the projective criterion and the proper birational comparison.
- L is big iff `L^{⊗m}` is big for some (every) m ≥ 1.
- For K/k with V_K integral, L is big iff L_K is big (flat base change of H⁰).
- On a projective geometrically integral V, L is big iff it is AlgebraicModuliForArithmeticGeometry §1.6 `bigLineBundle`: both are section growth of order dim V along sufficiently divisible powers.
- For a proper birational π : V′ → V of integral proper schemes, L is big iff π*L is big.

One proof route is as follows. For a projective integral scheme apply the supplied projective criterion, Keel's nef top-intersection criterion. For an arbitrary proper integral V of dimension n choose a projective birational Chow modification π : V′ → V (SchemeAndStackFoundations §4.12). The supplied section comparison bounds h⁰(V′, π*L^m) − h⁰(V, L^m) by C·m^(n−1), so L is big exactly when π*L is big; π*L is nef (§1.5), and ((π*L)^n·V′) = (L^n·V): iterate the projection formula `proper_pushforward` of SchemeAndStackFoundations §5.3 to get π_*(c₁(π*L)^n ∩ [V′]) = c₁(L)^n ∩ π_*[V′], use π_*[V′] = [V] for the birational π (residue-degree weight 1, SchemeAndStackFoundations §5.2), and take degrees, which proper pushforward preserves (§5.2). Apply the projective criterion on V′. Flat coherent base change proves the section-growth assertion after a field extension with integral source. Section-growth bigness on projective integral schemes is numerically invariant even without nefness; the proof of the criterion here only uses the nef case.

*Needs:* §1.5; SchemeAndStackFoundations §4.12; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10; JacobianChallenge Layer B; the projective nef-and-big contract of SchemeAndStackFoundations §5.3; the proper-bigness supplier extension of AlgebraicModuliForArithmeticGeometry §1.6.

**Checks.**

- O(1) on P^n_k is big; h⁰(O(m)) = binom(m+n, n).
- O_V is big iff dim V = 0.
- On P¹×P¹, the pullback O(1,0) of O(1) along a projection is nef with (O(1,0)²) = 0 and is not big.

### Examples

For P¹×P¹, numerical classes are (a,b), the intersection matrix of the two rulings is [[0,1],[1,0]], and the cone of curves is the nonnegative quadrant. Over the first projection only b remains. O(1,0) is nef with square 0 and h⁰(O(m,0))=m+1, so it is not big on the surface. On two disjoint lines, χ(O(n+p)) + χ(O(n−p))=2n+2=χ(O(n)) + χ(O(n)), although the component degrees are p and −p (KLE05 Theorem 6.3(g); §§1.1–1.6).

### Dependencies

Layer 0; SchemeAndStackFoundations §§2.1–2.2, 2.11, 2.15, 4.12 and 5.2–5.3, with the projective nef-and-big extension of §5.3; EtaleCohomologyFoundations §F.3; AbundanceStatement Layers 4A–4D; AlgebraicModuliForArithmeticGeometry §1.6 and its finite-point detection and proper-bigness extensions. Form quotients first, prove absolute and relative finiteness next, then give curve-space duality, topology and cones. The definitions of the quotient and algebraic cycle space do not require the finiteness proof.

## Layer 2: proper Picard schemes and the numerical local system

### 2.1 The Picard scheme of a proper scheme over a field (Murre–Oort)

For every proper k-scheme X, prove that the fppf sheafification of T ↦ Pic(X_T)/Pic(T), equivalently of T ↦ Pic(X_T), is represented by a separated commutative k-group scheme locally of finite type, a disjoint union of open quasi-projective subschemes. It commutes with every extension of the field. No reducedness, connectedness, equidimensionality or universal-functions hypothesis is imposed. (KLE05, Corollary 4.18.3 and the following paragraphs, pp. 34–35; Proposition 4.17, p. 33; KLE05 line 1630; SCH23, §1, p. 4; SCH23 line 167).

One proof route is as follows. Combine the supplied projective Picard functor with nilpotent dévissage and nonflat relative representability along a surjective proper projective cover, on the exact parent extension contract. Kleiman Corollary 4.18.3 supplies the theorem and Theorem 4.18.5 its relative-representability input. Intersections of components and nilpotent extensions retain gluing data, so independent representability of components does not suffice. Base change then follows from the sheaf universal property.

*Needs:* JacobianChallenge Layer D; AlgebraicModuliForArithmeticGeometry §§7.3, 7.6.1–7.6.1a; SchemeAndStackFoundations §§4.9–4.12; SchemeAndStackFoundations §§1.1–1.11; ComplexComparisonPartII §§C3.2d.2–C3.2e.

**Checks.**

- `Pic_{P¹_k/k}` ≅ `∐_{d∈ℤ}` Spec k.
- For X = P¹_ℂ viewed over ℝ, `Pic_{X/ℝ}` is the Weil restriction of ℤ_ℂ: its ℝ-points are ℤ and its ℂ-points ℤ².
- For X = Spec k[ε]/(ε²), Pic(X_T) = 0 for local T, so `Pic_{X/k}` is the trivial group scheme although H⁰(X, O_X) ≠ k.
- For a nodal rational proper curve with one node, Pic⁰ is G_m, with tangent dimension 1; discarding component gluing would give zero.

### 2.2 Constants, affinization and units

Apply supplied Stein factorization and relative Spec to h : X → Spec k, with X proper. Identify the finite constants algebra B=H⁰(X,O_X), the canonical map X → X^aff=Spec B, and h_*G_m with the units Weil restriction from B. In particular Γ(X_A,O)=B tensor_k A for every k-algebra A; the identification is natural in A. (SCH23, Lemma 1.4 and proof, pp. 7–8; SCH23 line 313).

The API gives the following facts.

- X^aff = Spec H⁰(X, O_X) with the morphism X → X^aff.
- H⁰(X, O_X) is a finite k-algebra, so X^aff is finite over k (a finite product of Artin local k-algebras).
- (X_A)^aff = (X^aff)_A for every k-algebra A, compatibly with the canonical maps.
- `h_*G_{m,X}` ≅ (X^aff → Spec k)_*G_m as fppf sheaves of groups.
- X → X^aff is a contraction (`O_{X^aff}` ≅ (X → X^aff)_*O_X) and is universal among morphisms from X to affine k-schemes.

One proof route is as follows. Finite-dimensionality of H⁰(X, O_X) (JacobianChallenge Layer C) and flat base change of coherent cohomology (SchemeAndStackFoundations §2.6) give the formula for Γ(X_A, O). Units of H⁰(X, O_X) ⊗ A define the fppf sheaf h_*G_m; the Stein factorization X → X^aff → Spec k is SchemeAndStackFoundations §4.9's stein_factorization.

*Needs:* JacobianChallenge Layer C; SchemeAndStackFoundations §§2.1–2.2, 2.6; SchemeAndStackFoundations §4.9; AlgebraicVectorBundles L1A–L1B.

**Checks.**

- For X = P¹_k, X^aff = Spec k.
- For X = P¹_ℂ viewed over ℝ, X^aff = Spec ℂ, a field extension of degree 2.
- For X = Spec B with B finite over k, X^aff = X.
- For X = P¹_k ⊔ P¹_k, X^aff = Spec(k × k); h_*G_m ≅ G_m × G_m.
- For X = P¹ × Spec k[ε]/(ε²), X^aff = Spec k[ε]/(ε²) is not reduced; replacing it by its reduction changes h_*G_m by the unipotent factor 1 + εA.

### 2.3 Cohomological Brauer groups of finite algebras over a field are torsion

Let R be a finite k-algebra and h : Spec R → Spec k. On the small étale sites, h_* is exact and R^i h_*G_m = 0 for every i > 0. Thus the Leray edge H²_et(k,h_*G_m) → H²_et(R,G_m) is an isomorphism. Comparison with fppf cohomology for the smooth units group identifies this with H²_fppf(k,h_*G_m) ≅ H²_fppf(R,G_m). Nilpotent invariance identifies the latter with ⊕_i Br(K_i), where R_red = ∏_i K_i; it is torsion. The corresponding degree-one comparison is zero because Pic(R) = 0. (SCH23, Lemma 1.4 and proof, pp. 7–8; SCH23 line 313; KLE05, Remark 2.11, p. 21; KLE05 line 980).

One proof route is as follows. Apply finite exact pushforward on small étale sites, in degrees one and two. The units Weil restriction is the open units locus in the affine space of the finite-dimensional algebra, hence smooth, so smooth-group comparison gives the fppf assertion. Filter the units congruent to one modulo the nilradical by its powers; successive quotients are additive quasi-coherent modules with zero higher cohomology on the affine scheme. Reduction gives a finite product of field Brauer groups. Semilocality gives Pic(R)=0.

*Needs:* §2.2; Mathlib `CommRing.Pic`; SchemeAndStackFoundations §§2.1–2.2, 2.10–2.11, 2.15, 2.22.

**Checks.**

- For R = ℂ over ℝ, H²(ℝ, h_*G_m) = Br(ℂ) = 0.
- For R = k[ε]/(ε²), H²(R, G_m) = Br(k).
- For R=ℝ×ℝ, H²(R,G_m)=(ℤ/2)²; keeping just one constants-field factor loses a nonzero class.

### 2.4 The Brauer obstruction to representing points of `Pic_{X/k}`

Let h : X → Spec k be proper. The fppf Leray spectral sequence for h and G_m gives an exact sequence 0 → Pic(X) → `Pic_{X/k}(k)` → H²(k, h_*G_m) ≅ Br(X^aff) → H²(X, G_m), with the first map the canonical one. Since Br(X^aff) is torsion, for every λ ∈ `Pic_{X/k}(k)` there is n ≥ 1 with n·λ the class of an invertible sheaf on X. For every field K ⊃ k the map Pic(X_K) → `Pic_{X/k}(K)` is injective. (SCH23, proof of Lemma 1.1, p. 5; SCH23 line 221; KLE05, Theorem 2.5 and Remark 2.11, pp. 17–21; KLE05 line 1019).

One proof route is as follows. R¹h_*G_m is the fppf Picard sheaf `Pic_{X/k}` (Hilbert 90, SchemeAndStackFoundations §2.11), and h_*G_m = (X^aff → Spec k)_*G_m (§2.2). The five-term sequence 0 → H¹(k, h_*G_m) → H¹(X, G_m) → H⁰(k, R¹h_*G_m) → H²(k, h_*G_m) → H²(X, G_m) has H¹(k, h_*G_m) = Pic(X^aff) = 0 (§2.3, i = 1). H²(k, h_*G_m) ≅ Br(X^aff) is torsion by §2.3. When H⁰(X, O_X) = k this is ComplexComparisonPartII §C3.2d.4 `picard_brauer_obstruction` over T = Spec k.

*Needs:* §2.1; §2.2; §2.3; AlgebraicModuliForArithmeticGeometry §§7.3, 7.6.1–7.6.1a; SchemeAndStackFoundations §§2.1–2.2, 2.11.

**Checks.**

- For the pointless real conic X, Pic(X) = 2ℤ ⊂ `Pic_{X/ℝ}(ℝ)` = ℤ, the cokernel ℤ/2 = Br(ℝ) and n = 2 works.
- For X = P¹_ℂ over ℝ, X^aff = Spec ℂ, Br(ℂ) = 0 and Pic(X) = `Pic_{X/ℝ}(ℝ)` = ℤ.

### 2.5 The torsion component `Pic^τ_{X/k}` is open, closed and of finite type

Let X be proper over k and G = `Pic_{X/k}`. Put `Pic^τ_{X/k}` := `⋃_{n≥1}` `[n]^{-1}(G⁰)`, with G⁰ the identity component. Then `Pic^τ_{X/k}` is an open and closed subgroup scheme of finite type, its formation commutes with every field extension, and for every field K ⊃ k and L ∈ Pic(X_K), the class of L lies in `Pic^τ_{X/k}(K)` iff L is numerically trivial on X_K. In particular `Pic^τ_{X/k}(k̄)` = `Pic^τ(X_{k̄}/k̄)` of §0.4 (`Pic_{X/k}(k̄)` = `Pic(X_{k̄})` over an algebraically closed field). (KLE05, Definition 6.8, Lemma 6.9, Exercise 6.11, Proposition 6.12 and Remark 6.14, pp. 56–58; KLE05 line 2701; SCH23, §1, p. 4; SCH23 line 167).

One proof route is as follows. Use the identity component of the locally finite-type commutative group scheme and take the union of its inverse images under positive multiplication maps. The subgroup is open and commutes with field extension. Over an algebraic closure numerical triviality is Kleiman Theorem 6.3 and Remark 6.14. A projective Chow cover gives a finite-type pullback map on Picard schemes, using the nonflat representability contract, so the preimage of the projective finite-type torsion component is finite type; the torsion component is then closed and finite type.

*Needs:* §2.1; §0.4; §0.3; §2.4; AlgebraicModuliForArithmeticGeometry §§7.3, 7.6.1–7.6.1a; ComplexComparisonPartII §§C3.2d.2–C3.2e.

**Checks.**

- For P¹_k, `Pic^τ_{P¹/k}` = 0: the degree of O(m) is m, so only m = 0 is numerically trivial.
- For an elliptic curve E/k, Pic^τ = Pic⁰ ≅ E: the degree-zero component has dimension 1, rather than being the zero group scheme.
- For an Enriques surface over k̄ of characteristic ≠ 2, Pic⁰ = 0 and Pic^τ ≅ ℤ/2, with the nontrivial class represented by the canonical sheaf. Keeping only Pic⁰ would lose this class (SCH23, Proposition 4.2, p. 12; SCH23 line 526).
- For a singular (ordinary) Enriques surface in characteristic 2, Pic^τ = μ₂ is connected and nonreduced, so Pic^τ = Pic⁰ with its full structure (SCH23, classification table, p. 13; SCH23 line 547).

### 2.6 The local system of numerical classes `Num_{X/k}`

For X proper over a field k put `Num_{X/k}` := `Pic_{X/k}/Pic^τ_{X/k}` (fppf quotient). It is an étale group scheme over k, determined by the Galois module `Num_{X/k}(k^sep)` = `Num_{X/k}(k̄)` = `Num(X_{k̄}/k̄)` ≅ `ℤ^{ρ}` with ρ = `ρ(X_{k̄})` ≥ 0, on which Gal(k^sep/k) acts continuously through a finite quotient. The class map Pic(X) → Num(X/k) → `Num_{X/k}(k)` is injective on Num(X/k). (SCH23, §1, pp. 4–5; SCH23 line 174).

The API gives the following facts.

- `Num_{X/k}` := `Pic_{X/k}/Pic^τ_{X/k}`, an étale commutative group scheme over k.
- Under the supplied equivalence between commutative étale group schemes over k and discrete abelian groups with continuous Gal(k^sep/k)-action, `Num_{X/k}` corresponds to `Num(X_{k̄}/k̄)` with its Galois action (SchemeAndStackFoundations §2.15 `etale_galois_comparison`).
- `Num_{X/k}(k^sep)` is free abelian of rank `ρ(X_{k̄})`, and equals `Num_{X/k}(k̄)`.
- Num(X/k) → `Num_{X/k}(k)` is injective.
- `Num_{X_K/K}` = `(Num_{X/k})_K` for every field extension K/k.
- A k-morphism g : X′ → X of proper k-schemes induces g* : `Num_{X/k}` → `Num_{X′/k}`, functorially; injective on stalks when g is surjective.

One proof route is as follows. `Pic^τ_{X/k}` is open, so the quotient of the locally finite type group `Pic_{X/k}` by it is étale (its geometric fibre is the discrete group of components modulo those of Pic^τ). Over k̄: `Num_{X/k}(k̄)` = `Pic(X_{k̄})/Pic^τ(X_{k̄}/k̄)` = `Num(X_{k̄}/k̄)` by §2.5; this is free of finite rank by §1.2. Purely inseparable extensions do not change points of an étale scheme, so the k^sep- and k̄-points agree. A finitely generated free ℤ-module with continuous action of a profinite group has open stabiliser, so the action factors through a finite quotient. Injectivity of Num(X/k) → `Num_{X/k}(k)`: if [L] ∈ `Pic^τ_{X/k}(k)` then `L_{k̄}` is numerically trivial, hence L is (§0.3).

*Needs:* §2.5; §1.2; §1.1; SchemeAndStackFoundations §2.15 `etale_galois_comparison`; Mathlib `IsSepClosure`; Mathlib `separableClosure.isPurelyInseparable`.

**Checks.**

- `Num_{P¹_k/k}` ≅ ℤ_k, the constant group scheme, generated by the class of O(1).
- For X = P¹_ℂ viewed over ℝ, Num(X_ℂ) = ℤ² with complex conjugation exchanging the two factors: `Num_{X/ℝ}` is not constant.
- For X = Spec K with K/k finite, `Num_{X/k}` = 0 and ρ = 0. The constants extension does not create a curve class.
- For X = P¹_ℝ ⊔ Spec ℂ over ℝ, `Num_{X/ℝ}` ≅ ℤ_ℝ is constant: zero-dimensional components contribute nothing.
- For the pointless real conic, `Num_{X/ℝ}(ℝ)` = ℤ but the image of Pic(X) is 2ℤ: rational points of Num need not come from invertible sheaves.
- The constant cyclic group scheme C₃ over k corresponds to ℤ/3 with trivial Galois action, including in characteristic 3. The constant finite étale S₃ scheme is outside this abelian equivalence: (12)(23) = (123), whereas (23)(12) = (132).

### 2.7 Constant numerical local system

`Num_{X/k}` is constant if Gal(k^sep/k) acts trivially on `Num_{X/k}(k^sep)`; equivalently `Num_{X/k}` ≅ `(ℤ^{⊕ρ})_k` = `∐_{l∈ℤ^ρ}` Spec k as group schemes. (SCH23, §1, p. 5; SCH23 line 185).

For a specified algebraic closure K/k and proper structure morphism x : X → Spec k, define `HasTrivialNumericalGaloisAction` on the actual quotient Num(X_K/K) of §1.1. Write π_X : X_K → X and π_K : X_K → Spec K for the two projections. For every σ ∈ Aut(K/k) and g : X_K → X_K satisfying g followed by π_X = π_X and g followed by π_K = π_K followed by Spec(σ), require [g*L] = [L] in Num(X_K/K) for every invertible L on X_K. Such g exists uniquely by the pullback universal property: σ fixes k, and the two equations specify both projections. Thus the quantification is over the actual semilinear maps. Automorphisms of k^sep extend uniquely across K/k^sep, so this predicate agrees with the Galois constancy above (SCH23 lines 175–188).

The finite-index characterization is §2.10; it is a theorem about the actual integral image and a uniform positive exponent, not a definition by rational rank alone.

The API gives the following facts.

- `HasTrivialNumericalGaloisAction` fixes every geometric numerical class under the specified semilinear pullbacks; through §2.6 it is triviality of the action of Gal(k^sep/k) on `Num_{X/k}(k^sep)`.
- constancy of the numerical local system of X ↔ `Num_{X/k}` ≅ (ℤ^ρ)_k.
- constancy of the numerical local system of X ↔ the image of Num(X/k) in `Num(X_{k̄})` has finite index (§2.10).
- Constancy is preserved by every field extension K/k.
- If k is separably closed, `Num_{X/k}` is constant.

One proof route is as follows. The equivalence is the étale–Galois dictionary of §2.6: a trivial Galois module corresponds to a constant étale group scheme.

*Needs:* §1.1 and native scheme and invertible-sheaf pullbacks for the predicate; §2.6 for comparison with the represented numerical local system.

**Checks.**

- `Num_{P¹_k/k}` is constant with ρ = 1.
- `Num_{P¹_ℂ/ℝ}` (P¹_ℂ as an ℝ-scheme) is not constant: conjugation swaps the two generators of ℤ².
- If `ρ(X_{k̄})` = 0 (for instance X finite over k), `Num_{X/k}` is constant.
- For a smooth quadric surface Q ⊂ P³_k whose two rulings are defined over a quadratic extension and swapped by Galois, `Num_{Q/k}` is not constant though `ρ(Q_{k̄})` = 2; for the split quadric P¹×P¹ it is constant.

### 2.8 Norms of Picard classes along a finite field extension

Let E/k be a finite field extension of degree n, X proper over k, pr : X_E → X and q : Spec E → Spec k. For every k-algebra A, pr_A : `X_{E⊗A}` → X_A is finite locally free of rank n, and the norm of invertible sheaves `Nm_{pr_A}` : `Pic(X_{E⊗A})` → Pic(X_A) (SchemeAndStackFoundations §3.5) is natural in A. It induces a homomorphism of fppf sheaves Nm : `q_*Pic_{X_E/E}` → `Pic_{X/k}` with Nm ∘ pr* = [n], mapping `q_*Pic^τ_{X_E/E}` into `Pic^τ_{X/k}`. (SCH23, proof of Lemma 1.1, p. 5; SCH23 line 204).

The API gives the following facts.

- Nm : `q_*Pic_{X_E/E}` → `Pic_{X/k}`, a homomorphism of fppf sheaves of abelian groups.
- Nm ∘ pr* = multiplication by n = [E : k] on `Pic_{X/k}`.
- Nm maps `q_*Pic^τ_{X_E/E}` into `Pic^τ_{X/k}`.
- On classes of invertible sheaves Nm is SchemeAndStackFoundations §3.5's lineBundleNorm along X_E → X.
- For k ⊂ E ⊂ F, `Nm_{F/k}` = `Nm_{E/k}` ∘ `q_*Nm_{F/E}`.

One proof route is as follows. The norm along a finite locally free morphism of constant rank n is a homomorphism with Nm(pr*L) ≅ `L^{⊗n}` and commutes with base change (SchemeAndStackFoundations §3.5); naturality in A passes to fppf sheafifications. Nm preserves numerical triviality: on a curve C ⊂ `X_{K}`, deg(Nm L|_C) is a sum of degrees of L on the curves of `X_{E⊗K}` over C (projection formula), so Nm maps Pic^τ into Pic^τ.

*Needs:* §2.5; SchemeAndStackFoundations §§3.4–3.5; Mathlib `AlgebraicGeometry.Scheme.Hom.finrank`.

**Checks.**

- For X = P¹_k, `Nm(O_{P¹_E}(d))` = O(n·d) and the induced map on Num is multiplication by n.
- For E = k, Nm is the identity.
- For n ≥ 2, Nm is not inverse to pr*: Nm ∘ pr* = [n] ≠ id on `Pic_{P¹/k}` ≅ ℤ.

### 2.9 Pic^τ-torsors split by a field extension of degree n are killed by n

Let X be proper over k, P = `Pic^τ_{X/k}` and l ∈ `Num_{X/k}(k)`. The fibre T_l ⊂ `Pic_{X/k}` over l is a P-torsor, with class [T_l] ∈ H¹_fppf(k, P). If T_l has a point over a finite extension E/k of degree n, then n·[T_l] = 0; consequently n·l lifts to a k-point of `Pic_{X/k}`. (SCH23, proof of Lemma 1.1, p. 5; SCH23 line 198).

One proof route is as follows. T_l is a P-torsor because Pic → Num is a P-torsor over each point of the étale Num; a closed point of T_l with residue field E splits it over E. With P_E = P ⊗_k E = `Pic^τ_{X_E/E}` and q : Spec E → Spec k, the five-term sequence for q gives an injection H¹(k, q_*P_E) → H¹(E, P_E); the class pr*[T_l] maps to the split class, hence is zero. Apply Nm : q_*P_E → P (§2.8): n·[T_l] = Nm(pr*[T_l]) = 0. A trivial torsor has a rational point, which lifts n·l.

*Needs:* §2.6; §2.8; SchemeAndStackFoundations §§2.1–2.3.

**Checks.**

- For the pointless real conic and l the generator, T_l is split by ℂ and 2l lifts (indeed l itself lifts to `Pic_{X/ℝ}(ℝ)`).
- For P¹ the τ-group is zero, so every τ-torsor class is 0; for a splitting extension of degree 1, n[T]=[T]=0.

### 2.10 Positive-power descent criterion for constancy of Num

For every proper X over k, prove that `Num_{X/k}` is constant if and only if a single integer d≥1 has the following property: for every invertible L on X over an algebraic closure, some numerically trivial N makes L^d tensor N isomorphic to the pullback of an invertible sheaf on X. Equivalently the integral image of Num(X/k) has finite index in the geometric numerical lattice. The integer is uniform over all L. This is `constantNumericalClasses_iff_positivePowerDescent`: for any specified algebraic closure K/k, its left side is `HasTrivialNumericalGaloisAction`, and its right side is equality of the classes of L^d and π_X*M in the actual quotient by `numericallyTrivialClasses`. By §0.4 the subgroup generated by numerically trivial classes is exactly the numerical kernel, so quotient equality is equivalent to allowing the stated numerically trivial twist. (SCH23, Lemma 1.1 and proof, pp. 5–6; SCH23 line 191).

One proof route is as follows. (⇐) The condition says the image of Num(X/k) in `Num(X_{k̄})` ≅ ℤ^ρ contains d·ℤ^ρ, which is Galois-fixed; a group acting by automorphisms of a torsion-free ℤ^ρ and fixing d·ℤ^ρ fixes ℤ^ρ. (⇒) For each l in a basis of `Num_{X/k}(k)` = ℤ^ρ, §2.9 gives n ≥ 1 with n·l ∈ image of `Pic_{X/k}(k)`, and §2.4 gives n′ ≥ 1 with n′n·l ∈ image of Pic(X). Take d the product over a basis; then Pic(X) → `Num_{X/k}(k̄)` has image containing d·ℤ^ρ.

*Needs:* §2.9; §2.4; §2.7; Mathlib `DistribMulAction`.

**Checks.**

- For X = P¹_k the geometric lattice and the image are both ℤ; d = 1 works for every O(m), including m = −1 and m = 0.
- For X = P¹_ℂ over ℝ, conjugation swaps ℤ² and the image is the diagonal. The vector (d,0) is not diagonal for any d ≥ 1; both sides fail. With d = 0 every class maps to (0,0), which explains the positive-exponent hypothesis.
- For the pointless real conic the action on ℤ is trivial and the image is 2ℤ: d = 2 works, whereas the geometric class 1 prevents d = 1.
- For an empty scheme or a finite k-scheme, the geometric numerical quotient is 0; both sides hold with d = 1, including for Spec k[ε]/(ε²).

### 2.11 The canonical doubled Picard lift

Apply the supplied abelian quotient universal property to the Picard exact sequence 0 → P → Q → N → 0, where P=Pic^τ, Q=Pic and N=Num are abelian fppf sheaves and 2P=0. Construct the canonical homomorphism d : N → Q with dπ=[2]_Q and πd=[2]_N. It is natural in maps of such Picard exact sequences and under base change. The same quotient calculation on abelian groups is the comparison test; pointwise surjectivity on sections is not assumed for a sheaf epimorphism. (Mathlib quotient/cokernel universal property in the supplier contract; SCH23, Proposition 5.5, line 703, for the Picard-sequence setting. The doubling factorization is the direct quotient argument given here.).

The API gives the following facts.

- d : N → Q with d ∘ π = [2]_Q.
- π ∘ d = [2]_N.
- d is the unique homomorphism with d ∘ π = [2]_Q.
- d commutes with maps of short exact sequences with 2-torsion kernels and with base change of sheaves.

One proof route is as follows. Multiplication by 2 kills the kernel P. Factor it through the sheaf quotient Q/P using its cokernel property; compose with π and use its epimorphism property to get πd=[2]. Uniqueness gives naturality. This uses local lifts in the fppf topology, not a claim that Q(U) → N(U) is surjective for every U.

*Needs:* §2.6.

**Checks.**

- For 0 → 2ℤ/4 → ℤ/4 → ℤ/2 → 0, d(1) = 2 ∈ ℤ/4.
- For P = 0, d = [2]_N.
- For 0 → 2ℤ/8 → ℤ/8 → ℤ/2 → 0 the kernel 2ℤ/8 ≅ ℤ/4 is not killed by 2, and [2] does not factor through ℤ/2, since 2·2 = 4 ≠ 0 in ℤ/8.

### 2.12 Finiteness of rational τ-classes over finite fields and torsion over locally finite fields

(a) For X proper over a finite field F_q, `Pic^τ_{X/F_q}(F_{q^r})` is finite for every r ≥ 1. (b) If k is an algebraic extension of a finite field and X is proper over k, every numerically trivial invertible sheaf on X has finite order in Pic(X). The headline `numericallyTrivial_torsion_of_algebraic_finiteField` states (b), with an explicit prime p, an algebraic field extension of ZMod p, proper structure morphism and positive exponent. (WIT22, proof of Proposition 5.3, p. 34, using Keel 1999 Lemma 2.16; WIT22 line 1513; KEE99, Lemma 2.16, printed p. 270, KEE99 line 677).

One proof route is as follows. (a) Pic^τ is of finite type over F_q (§2.5), so it has finitely many points over each finite field. (b) X and L are defined over a finite subfield F ⊂ k (spreading out, EGA IV 8.8.2); L₀ on X₀ is numerically trivial (§0.3), so [L₀] ∈ `Pic^τ_{X₀/F}(F)`, a finite group by (a). Pic(X₀) → `Pic_{X₀/F}(F)` is injective (§2.4), so L₀ has finite order, hence so does L.

*Needs:* §2.5; §2.4; §0.3; SchemeAndStackFoundations §§0.9, 0.11, 0.23.

**Checks.**

- On an elliptic curve E over F̄_p every degree-zero invertible sheaf is torsion, since E(F̄_p) is torsion.
- Over ℚ̄ the analogue of (b) fails: E(ℚ̄) has points of infinite order.
- For X finite over a finite field, the numerical and τ Picard groups on field points are zero; finiteness does not mean a positive Picard rank.
- In characteristic 2, the smooth elliptic curve y²+y=x³ over 𝔽₂ has 2 affine points and infinity, so its degree-zero rational Picard group has order 3. In characteristic 3, y²=x³−x over 𝔽₃ has 3 affine points and infinity, so that group has order 4. Both satisfy the torsion theorem; no exclusion of 2 or 3 is permitted.

### Examples

The pointless real conic has Pic image 2ℤ inside the rational points ℤ of its Picard scheme; its numerical local system is constant, but only the uniform exponent 2 descends every geometric numerical class. P¹_ℂ viewed over ℝ has geometric numerical lattice ℤ² with the swap action, and no positive exponent makes that action trivial. For the doubled-lift comparison ℤ/4 → ℤ/2, the generator maps back to 2, and projecting again gives 0=2·1 in ℤ/2 (SCH23 Lemma 1.1; §2.11 quotient argument).

### Dependencies

Layer 0 and the absolute finiteness theorem of §1.2; AlgebraicVectorBundles L0A–L0C and L1A–L1B; JacobianChallenge Layer D; AlgebraicModuliForArithmeticGeometry §§7.3, 7.6 and its proper Picard supplier extension; ComplexComparisonPartII §§C3.2d–C3.2f; SchemeAndStackFoundations §§2.1–2.2, 2.10–2.11, 2.15, 2.22, 3.5 and 4.9. Norms and the Brauer obstruction precede the uniform exponent criterion.

## Layer 3: contractions, semiampleness and descent

### 3.1 Contractions

Define `IsContraction` for a scheme morphism f : X → Y by properness and the canonical structure-sheaf isomorphism O_Y → f_*O_X. On the native scheme carrier, require the map on sections over every open of Y to be an isomorphism. For locally Noetherian Y, prove surjectivity and geometric connectedness of fibres; composites and flat base changes are contractions. (SCH23, §1, p. 6; SCH23 line 260).

The API gives the following facts.

- The predicate `IsContraction` uses the canonical maps O_Y(U) → O_X(f⁻¹U) for every open U, together with properness.
- A contraction is surjective.
- Every fibre of a contraction to a locally Noetherian Y is geometrically connected (SchemeAndStackFoundations §4.9, stated for Noetherian schemes and applied over an affine open cover of Y, since f_*O_X and the Stein factorization are local on Y and the preimage of a Noetherian affine open is proper over it, hence Noetherian).
- Composites of contractions are contractions; isomorphisms are contractions.
- For a flat Y′ → Y, the base change of a contraction is a contraction; in particular contractions of proper k-schemes are stable under field extension.
- Every proper f : X → Y with Y locally Noetherian factors uniquely as a contraction X → Spec_Y f_*O_X followed by a finite morphism (the Noetherian Stein factorization of SchemeAndStackFoundations §4.9 over each affine open of Y, glued by uniqueness).
- For X proper over k, X → Spec k is a contraction iff H⁰(X, O_X) = k.

One proof route is as follows. Surjectivity: if y ∉ f(X), then (f_*O_X)_y = 0 ≠ `O_{Y,y}`. Geometric connectedness of the fibres is Zariski's connectedness theorem, SchemeAndStackFoundations §4.9 (stein_factorization), which is stated for a proper morphism of Noetherian schemes; for locally Noetherian Y apply it to f over each affine open V ⊂ Y, whose preimage is proper over the Noetherian V, since both f_*O_X and the fibres are local on Y. Flat base change of f_*O_X (SchemeAndStackFoundations §2.6) shows that contractions are stable under flat base change, in particular under field extension.

*Needs:* Mathlib `AlgebraicGeometry.IsProper`; SchemeAndStackFoundations §§2.6, 4.9.

**Checks.**

- The blow-up Bl_x S → S of a regular surface at a closed point is a contraction with fibre `P¹_{κ(x)}` over x.
- The projection P¹_k × P¹_k → P¹_k is a contraction.
- Every isomorphism is a contraction; Spec k → Spec k is the contraction of a point.
- The normalization 𝔸¹ → Spec k[t², t³] is finite and birational but not a contraction: f_*O is k[t] ≠ k[t², t³].
- P¹_ℂ → Spec ℝ is proper with connected fibre but not a contraction, since H⁰ = ℂ ≠ ℝ.

### 3.2 Rigidity: maps contracting the curves of a contraction factor through it

Let S be a Noetherian scheme, f : X → Y a contraction of proper S-schemes and g : X → Z an S-morphism to a scheme Z proper over S. If g maps every integral curve contained in a fibre of f to a point, then there is a unique S-morphism h : Y → Z with g = h ∘ f. This differs from StableReduction Layer 2's contraction descent, which assumes O_Y ≅ f_*O_X universally and tests geometric fibres, by testing integral curves in the fibres and assuming O_Y ≅ f_*O_X only. (SCH23, proof of Theorem 1.3, pp. 6–7; SCH23 line 265).

One proof route is as follows. Each fibre F = `f^{-1}(y)` is connected (§3.1). If g(F) had positive dimension, some integral curve of F would map onto a curve (lift curves as in §0.6); so g(F) is finite and connected, a single point. Let Γ ⊂ Y ×_S Z be the scheme-theoretic image of (f, g). The projection π : Γ → Y is proper with finite fibres, hence finite, and O_Y → π_*O_Γ → f_*O_X = O_Y with the second map injective (Γ is a scheme-theoretic image) forces π_*O_Γ = O_Y, so π is an isomorphism. h is the second projection composed with `π^{-1}`; uniqueness holds because f is surjective and O_Y = f_*O_X makes f an epimorphism of schemes.

*Needs:* §3.1; §0.6; SchemeAndStackFoundations §§4.9–4.12.

**Checks.**

- Two contractions X → Y₁, X → Y₂ contracting exactly the same curves are isomorphic under X.
- The hypothesis cannot be weakened to a numerical one without the curves: a map contracting fewer curves need not factor.
- For f=Bl_p(P²) → P² and g=id, g sends the exceptional P¹ onto itself, so it does not factor through f; ignoring the contracted-curve condition would give a false factorization.

### 3.3 Semiample invertible sheaves and the section ring

Let f : X → S be proper with S Noetherian. An invertible sheaf L on X is f-semiample if some `L^{⊗m}`, m ≥ 1, is f-globally generated: `f*f_*L^{⊗m}` → `L^{⊗m}` is surjective. Over S = Spec k this is semiampleness (some positive power globally generated). The section ring is R(X/S, L) := `⊕_{t≥0}` `f_*L^{⊗t}`, a quasi-coherent graded O_S-algebra; over a field R(X, L) = ⊕_t H⁰(X, `L^{⊗t}`) and P(X, L) := Proj R(X, L). (SCH23, proof of Theorem 1.3, p. 6; SCH23 line 265; WIT22, §2, p. 7; WIT22 line 319).

The API gives the following facts.

- f-semiampleness: ∃ m ≥ 1 with `f*f_*L^{⊗m}` → `L^{⊗m}` surjective.
- R(X/S, L) := `⊕_{t≥0}` `f_*L^{⊗t}`, a graded quasi-coherent O_S-algebra; over a field, R(X, L) and P(X, L) = Proj R(X, L).
- L is semiample iff `L^{⊗n}` is semiample for some (every) n ≥ 1.
- Semiample implies nef (§1.5).
- Pullbacks of semiample sheaves along S-morphisms of proper S-schemes are semiample.
- Over a field, L is semiample iff L_K is semiample for some (every) extension K/k.
- If `L^{⊗m}` ≅ f*M for some m ≥ 1 and M invertible on S, then L is f-semiample.
- For S = Spec k, k algebraically closed of characteristic zero and X a projective variety, semiampleness is AbundanceStatement Layer 5's semiampleness.

One proof route is as follows. Over a field, global generation descends along every field extension by flat base change of H⁰ and faithful flatness of the evaluation map. Over a general base, fibrewise global generation alone does not imply surjectivity of f*f_*L → L without the appropriate cohomology/base-change hypotheses; no such equivalence is claimed. A globally generated invertible sheaf has nonnegative degree on every curve (restrict a nonvanishing section at a point of the curve), so semiample sheaves are nef.

*Needs:* §1.5; JacobianChallenge Layer C; StableReduction Layer 2.

**Checks.**

- O(1) on P^n_k is semiample, with R(P^n, O(1)) = k[x₀, …, x_n] and P = P^n.
- Every torsion invertible sheaf (in particular O_X) is semiample, with P(X, L) = X^aff.
- On an elliptic curve over ℂ, O(p − q) of infinite order is nef but not semiample: no positive power has a nonzero section.
- On Bl_p P², O(E) is effective but not semiample (it is not nef).

### 3.4 Semiample sheaves and projective contractions

Let X be proper over a field k and L a semiample invertible sheaf. (i) R(X, L) is a finitely generated k-algebra, P(X, L) is projective over k and the canonical morphism φ_L : X → P(X, L) is a contraction; an integral curve C ⊂ X is contracted by φ_L iff (L·C) = 0. (ii) Every contraction f : X → Z with Z projective over k is isomorphic under X to φ_L for L = f*O_Z(1). (iii) R(X, L) and P(X, L) commute with field extension. (iv) If L, L′ are semiample and numerically equivalent, φ_L and `φ_{L′}` are isomorphic under X. (SCH23, proof of Theorem 1.3, pp. 6–7; SCH23 line 265).

One proof route is as follows. (i) Choose m with `L^{⊗m}` globally generated, giving ψ : X → P^N; its Stein factorisation X → Y := `Spec_{P^N}(ψ_*O_X)` → P^N is a contraction onto a projective Y carrying an ample sheaf whose pullback is `L^{⊗m}`; the Veronese subring R(X, `L^{⊗m}`) is the section ring of that ample sheaf, hence finitely generated with Proj equal to Y, and R(X, L) is finite over it, so P(X, L) = Y. For this finiteness, each residue class j modulo m gives the section module of the coherent pushforward of L^j on Y twisted by powers of that ample sheaf; Serre finiteness makes each such module finite over the Veronese ring, and their finite direct sum is R(X,L). Curves with (L·C) = 0 are exactly those mapping to points. (ii) H⁰(X, f*O_Z(t)) = H⁰(Z, O_Z(t)) by the projection formula and O_Z = f_*O_X, so R(X, f*O(1)) is the section ring of an ample sheaf on Z and Proj of it is Z. (iii) Flat base change of H⁰ and of Proj. (iv) φ_L and `φ_{L′}` contract exactly the curves of degree zero, which are the same curves; by §3.2 each factors through the other.

*Needs:* §3.3; §3.1; §3.2; AlgebraicModuliForArithmeticGeometry §§1.4–1.5; StableReduction Layer 2; SchemeAndStackFoundations §2.6 for coherent section-module finiteness.

**Checks.**

- For L = `O_{P¹×P¹}(1, 0)`, φ_L is the first projection.
- For L = O_X, φ_L is X → X^aff.

### 3.5 Spreading out a geometric contraction to a finite extension

Let X be proper over k and f̄ : `X_{k̄}` → Ȳ a contraction with Ȳ projective over k̄. There are a finite subextension k ⊂ k′ ⊂ k̄ and a contraction f′ : `X_{k′}` → Y′ with Y′ projective over k′, whose base change to k̄ is isomorphic under `X_{k̄}` to f̄. (EGA-IV3, Théorème (8.8.2), Numdam PDF p. 27, and (8.10.5); EGA-IV3 line 986; SCH23, proof of Theorem 1.3, p. 7; SCH23 line 276).

One proof route is as follows. Descend the finitely presented target, morphism and projective embedding along the filtered union of finite subextensions. The structure-sheaf map becomes an isomorphism after the faithfully flat extension to the algebraic closure; flat coherent base change detects that it was an isomorphism.

*Needs:* §3.1; SchemeAndStackFoundations §§0.9, 0.11, 0.23, 2.6.

**Checks.**

- If f̄ is already defined over k, k′ = k works.
- The identity contraction has its original finite field of definition; a target identification is retained, not merely an unmarked target scheme.

### 3.6 Contractions descend along purely inseparable extensions

Let k′/k be any purely inseparable field extension, X proper over k, and f′ : `X_{k′}` → Y′ a contraction with Y′ proper over k′. Prove that f′ is the base change of a contraction f : X → Y with Y proper over k, by an isomorphism under the specified base-changed source. This is `contraction_descends_purelyInseparable`: its cartesian target square and commuting source square encode precisely that isomorphism. Projectivity and constancy of the numerical local system are not hypotheses. (SCH23, proof of Theorem 1.3 and the remark after it, p. 7; SCH23 line 289).

One proof route is as follows. pr : `X_{k′}` → X is a universal homeomorphism (SchemeAndStackFoundations §0.23); put |Y| := |Y′|, f := f′ on spaces and O_Y := f_*O_X, giving a ringed space Y with a morphism X → Y. Locally: for an affine open V′ ⊂ Y′ with preimage U′ = `f′^{-1}(V′)` and corresponding U ⊂ X, f′_*O = O makes U′ → V′ = Spec Γ(U′, O) the affine hull; Γ(U′, O) = Γ(U, O) ⊗_k k′ shows U′ → V′ is the base change of U → V = Spec Γ(U, O), and V′ → V is a homeomorphism, so (|V|, `O_Y|_{|V|}`) ≅ V. Hence Y is a scheme, Y′ = `Y_{k′}`, f′ = `f_{k′}`; Y is proper by fpqc descent of properness along Spec k′ → Spec k (SchemeAndStackFoundations §0.11).

*Needs:* §3.1; SchemeAndStackFoundations §§0.9, 0.11, 0.23.

**Checks.**

- The statement fails for separable extensions without further hypotheses: contracting one of the two components of (P¹_ℂ)_ℂ = P¹_ℂ ⊔ P¹_ℂ does not descend to ℝ.
- For the identity purely inseparable extension both cartesian squares are identity squares, and f=f′; allowing an arbitrary unrelated f would violate the source equation.

### 3.7 Descent of geometric contractions under constant Num (Schröer, Theorem 1.3)

Let X be proper over a field k with `Num_{X/k}` constant. Every contraction f̄ : `X_{k̄}` → Ȳ with Ȳ projective over k̄ is isomorphic under `X_{k̄}` to the base change of a contraction f : X → Y over k; Y is then projective over k. (SCH23, Theorem 1.3 and proof, pp. 6–7; SCH23 line 262; STACKS, Lemma 33.15.5, tag 0BDG, Varieties line 1320).

This is `contraction_descends_of_constantNumericalClasses`: for a specified algebraic closure K/k, under `HasTrivialNumericalGaloisAction`, every `IsContraction` f′ from the base change X_K onto a K-scheme Y′ that is `IsProjectiveOver` K, compatible with the structure maps, yields a k-scheme Y that is `IsProjectiveOver` k, a contraction f : X → Y over k and a map v : Y′ → Y making the target square cartesian over Spec K → Spec k, with f′ followed by v equal to the projection X_K → X followed by f. The two squares are the same encoding as in `contraction_descends_purelyInseparable`.

Define `IsProjectiveOver` for a scheme Y with structure morphism y : Y → Spec K over a field K: for some n ≥ 0 there is a closed immersion i : Y → P^n_K with i followed by the structure map of P^n_K equal to y, where P^n_K is the homogeneous spectrum of K[T₀, …, Tₙ] graded by total degree (Mathlib `Proj` of `MvPolynomial.homogeneousSubmodule`). Over a field this is projectivity in the sense of Stacks tag 0BDG's statement.

The API gives the following facts.

- `IsProjectiveOver` holds for P^n_K itself (the identity immersion) and for every closed subscheme of a K-scheme satisfying it, with the restricted structure map.
- A K-scheme satisfying `IsProjectiveOver` is proper over K, so the target of a contraction in §3.4(ii) is proper.
- If L ⊗_K Y satisfies it over an extension field L/K, then Y satisfies it over K (STACKS, Lemma 33.15.5, tag 0BDG, Varieties line 1320).
- It is stable under base change along every field extension K → L, with the base-changed immersion into P^n_L.

**Checks.**

- Spec K satisfies it with n = 0, since `Proj K[T₀]` is Spec K; the empty scheme satisfies it through the empty closed immersion.
- The affine line over K does not satisfy it: a closed subscheme of P^n_K is proper over K, and the affine line is not. A definition dropping the closed-immersion condition (any morphism to P^n_K) would accept it.
- The structure map is part of the data. Let K = ℚ(t₁, t₂, …) and σ : K → K the shift t_i ↦ t_(i+1). Then Spec K with structure map Spec σ is not of finite type over K, so it does not satisfy the predicate, although Spec K admits the identity closed immersion into P⁰_K for its identity structure map; a definition that drops the equation with y would accept it. The degree n is not fixed: Spec ℂ over K = ℝ satisfies the predicate as the closed point V(T₀² + T₁²) of P¹_ℝ, while Spec ℂ → P⁰_ℝ = Spec ℝ is not a closed immersion.

One proof route is as follows. Choose a finite normal field of definition and let k₁ be its separable part over k; k₁/k is finite Galois, and the remaining extension is purely inseparable. Descend that purely inseparable stage first by §3.6. Projectivity of the target descends along field extensions by Stacks tag 0BDG. Choose a semiample defining sheaf over k₁ and tensor all its Galois conjugates. Constancy makes its numerical class the positive [k₁:k]-multiple of the original, so it gives the same contraction. Its invariant Picard-sheaf point descends to k; kill its Brauer obstruction by a positive power to obtain an actual sheaf on X. Faithful flatness detects semiampleness and the semiample dictionary identifies its geometric contraction with the prescribed one.

*Needs:* Mathlib `AlgebraicGeometry.Proj`, `MvPolynomial.homogeneousSubmodule` and `AlgebraicGeometry.IsClosedImmersion` for the statement; §3.5; §3.4; §3.6; §2.7; §2.4; Mathlib `separableClosure.isGalois`; Mathlib `separableClosure.isPurelyInseparable`; SchemeAndStackFoundations §§3.4–3.5.

**Checks.**

- For X = P¹_ℂ viewed over ℝ, `Num_{X/ℝ}` is not constant and the contraction of X_ℂ = P¹_ℂ ⊔ P¹_ℂ collapsing only the first component does not descend.
- For X geometrically integral over a finite field with Num constant, every geometric fibration onto a projective curve descends (the Enriques application described under Downstream consumers).

### 3.8 Openness of ampleness for proper algebraic spaces

Let Y be a Noetherian scheme, f : X → Y a proper morphism from an algebraic space and L an invertible O_X-module. (i) If y ∈ Y is such that the fibre X_y is a scheme and L_y is ample on X_y, there is an open neighbourhood V ∋ y such that `L|_{f^{-1}V}` is ample on `f^{-1}(V)/V`; in particular `f^{-1}(V)` is a scheme, projective over V. (ii) For an arbitrary proper morphism of algebraic spaces f : X → Y there is an open V ⊂ Y such that a morphism Y′ → Y factors through V iff the pullback of L to X ×_Y Y′ is ample over Y′. When X is a scheme, (i) is StableReduction Layer 2's openness of fibrewise ampleness. (STACKS, Lemma 71.15.3, tag 0D3A, Divisors on Algebraic Spaces line 1392; Lemma 74.13.2, tag 0D3D, Descent on Spaces line 1008).

One proof route is as follows. Lift a sufficiently very ample power and its finite set of sections over a neighbourhood of the fibre, using coherent cohomology and base change. The induced map to projective space is finite after shrinking; its source is therefore a scheme and the power is relatively ample. Descend these open loci over an étale scheme cover of the target, using relative ampleness descent.

*Needs:* StableReduction Layer 2; AlgebraicModuliForArithmeticGeometry Layer 3; SchemeAndStackFoundations §§1.1–1.11.

**Checks.**

- For a family of smooth projective curves every fibrewise ample L is relatively ample over the whole base.
- Ampleness on one fibre is essential: for the trivial sheaf on X = P¹ × Y, no neighbourhood works.

### Examples

For O(1,0) on P¹×P¹ the contraction is the first projection and exactly the ruling curves of degree zero are contracted. For O_X on proper X the target is Spec H⁰(X,O_X), including its nilpotent constants. Over ℝ the geometric two-component curve obtained from P¹_ℂ admits a contraction collapsing only one component; conjugation exchanges that contraction with a different one, so it cannot descend (SCH23 Theorem 1.3 and §§3.4–3.7).

### Dependencies

Layers 0–2; SchemeAndStackFoundations §§0.9, 0.11, 0.23 and 4.9; AlgebraicModuliForArithmeticGeometry §§1.4–1.5 and Layer 3; StableReduction Layer 2. Purely inseparable contraction descent uses properness and coherent base change, independently of numerical constancy and semiampleness; the Galois part of projective contraction descent uses those additional inputs.

## Layer 4: component graphs and contractions of smooth surfaces

### 4.1 The component dual graph of a Noetherian scheme

For a scheme Z, define `componentGraph` as Γ(Z), the simple graph on its irreducible components; distinct components are adjacent when their intersection is nonempty. It is finite when Z is Noetherian. A morphism inducing a vertex map must send the closure of the image of each source component onto a target component (or be supplied with such component-dominance data). It sends an edge to an edge or a vertex. Injectivity on vertices gives edge preservation, but even vertex bijectivity does not imply reflection of adjacency for arbitrary morphisms. For field base change, a bijection on vertices does reflect adjacency and gives a graph isomorphism. (SCH23, §1, p. 6; SCH23 line 232).

The API gives the following facts.

- `componentGraph` is Γ(Z) as a SimpleGraph on irreducibleComponents Z, with adjacency Z_i ≠ Z_j ∧ (Z_i ∩ Z_j).Nonempty.
- Adjacency unfolds to distinctness and nonempty intersection.
- A morphism with closure-of-image equal to a target component for every source component induces the canonical vertex map; identities and composites are respected.
- Adjacent vertices map to adjacent or equal vertices.
- A bijection of vertices preserving and reflecting adjacency, equivalently a SimpleGraph isomorphism. Edge preservation alone is insufficient.
- For a field extension K/κ and Z of finite type over κ, the projection Z_K → Z induces Γ(Z_K) → Γ(Z).
- For a field extension K/k, bijectivity of Γ(Z_K) → Γ(Z) on vertices implies a graph isomorphism, by faithful flatness of intersections.

One proof route is as follows. Adjacency is symmetric and irreflexive; finiteness of the vertex set is Noetherianity. If Z′_i ∩ Z′_j ≠ ∅ then their images meet, so adjacent vertices go to adjacent or equal vertices; when the vertex map is injective, equal images cannot occur. For a field extension K/k, every geometric component dominates a component of Z. If the vertex map is bijective, the support of the pullback of each target component is its unique source component. Faithful flatness preserves nonempty intersections, giving reflection of adjacency.

*Needs:* Mathlib `irreducibleComponents`; Mathlib `SimpleGraph`; StableReduction Layer 1.

**Checks.**

- Γ(P¹ ⊔ P¹) has two vertices and no edge.
- An irreducible Z has one vertex and no edges; Γ(∅) is empty.
- For Z = V(xy) ⊂ 𝔸², Γ(Z) is a single edge.
- For Z = V(x² + y²) ⊂ 𝔸²_ℝ, Γ(Z_ℂ) is an edge and Γ(Z) a single vertex: the induced map sends the edge to a vertex, not to an edge.
- The normalization P¹ ⊔ P¹ → V(xy) ⊂ P² (a pair of meeting lines) is bijective on components and sends each component onto a component, but the source graph has no edge and the target has one.

### 4.2 Constancy of Num for curves is graph descent

Let X be a proper scheme over k all of whose irreducible components are one-dimensional. Then `Num_{X/k}` is constant iff `Γ(X_{k̄})` → Γ(X) is a graph isomorphism. This is `constantNumericalClasses_iff_componentGraphDescent`: for a specified algebraic closure K/k, `HasTrivialNumericalGaloisAction` holds iff there is a `componentGraph` isomorphism e from X_K to X with e(C) equal to the closure of π_X(C) for every geometric component C. The closure equation ties the isomorphism to the actual base-change projection, rather than to an arbitrary bijection of unmarked graphs. The purity hypothesis means dimension one for every component, permits X empty, and imposes no reducedness or perfection. (SCH23, Proposition 1.2 and proof, p. 6; SCH23 line 239).

One proof route is as follows. An invertible sheaf is numerically trivial iff its degrees on the reduced components C_1, …, C_r vanish, so `Num(X_{k̄})` ⊗ ℚ has the components of `X_{k̄}` as a dual basis. (⇐) If the vertex map is bijective, choose closed points a_i in C_i outside the other components and outside the embedded points, and effective Cartier divisors D_i supported at a_i; the classes of O(D_i) span a finite-index subgroup of `Num_{X/k}(k̄)` defined over k, so Galois acts trivially (§2.10). (⇒) For a component E of `X_{k̄}`, take an effective Cartier divisor on `X_{k̄}` supported on E away from the others; §2.10 gives L on X with `(L_{k̄}·E′)` ≥ 0, positive exactly for E′ = E, so exactly one component of X lies under E: the vertex map is bijective.

*Needs:* §4.1; §2.10; §0.4.

**Checks.**

- For X = P¹_ℂ viewed over ℝ, Γ(X_ℂ) has two vertices over one: Num is not constant.
- For X = P¹_ℝ ⊔ Spec ℂ the statement is outside the hypothesis: `Num_{X/ℝ}` = ℤ is constant but Γ(X_ℂ) has three vertices over two.
- For two k-lines meeting at a k-point, both geometric and schematic component graphs have two vertices and one edge; their geometric multidegree lattice is ℤ² with trivial action, and e is the projection-induced identity.
- For X empty the purity condition is vacuous, both graphs have zero vertices and the numerical quotient is 0, so both sides hold.
- For X = P¹_k ⊔ P¹_k, the projection fixes the two component labels. The graph automorphism interchanging them is an unmarked isomorphism but fails the closure-of-image equation: the image closure of the first component is the first, not the second.
- For X = P¹ over k[ε]/(ε²), viewed as a proper k-scheme, each graph has one vertex and no edges, and geometric Num is ℤ with trivial action. O(1) has degree 1 on the reduced test curve, although its Euler degree on the full double curve is 2; the criterion uses the reduced components.
- In characteristic p, let a ∉ k^p and X = `P^1_{k(a^{1/p})}` over k. Its geometric support is one P¹, with nilpotent multiplicity p; both graphs have one vertex and Num(X_K/K)=ℤ with trivial action. Pure inseparability does not create p vertices.

### 4.3 Intersection matrices and intersection-labelled graphs of curves on a surface

Let S be a smooth proper surface over k with H⁰(S, O_S) = k and C ⊂ S a curve with irreducible components C_1, …, C_r and multiplicities m_i ≥ 1. Its intersection matrix is N(C) := `((C_i·C_j))_{i,j}` ∈ Mat_r(ℤ), intersection numbers on S over k (SchemeAndStackFoundations §5.9). C is negative definite (resp. negative semidefinite) if N(C) is. The labelled graph of C is Γ(C) with each edge {C_i, C_j}, i ≠ j, labelled by (C_i·C_j) > 0. (SCH23, §2, p. 8; SCH23 line 332).

For this labelled graph the ambient surface is smooth and proper over k with H⁰(O)=k; all intersection numbers are over k. Component multiplicities belong to the curve cycle, while the matrix entries pair reduced component divisors. In the regular-surface applications of §§4.5–4.6, use the supplied relative intersection pairing of SchemeAndStackFoundations §5.9: on a regular surface proper over k, (D·C) = `deg_k(O(D)|_C)`; for vertical components over a closed point z of a regular curve, (D·C) = `deg_{κ(z)}(O(D)|_C)`. Properness of C over that ground field makes this degree defined, and regularity makes each component divisor Cartier. This relative pairing does not require the total surface to be smooth or proper over a field (STACKS, tag 0C66, Semistable Reduction line 2982; LIP69 §13, p. 223, LIP69 line 1167).

The API gives the following facts.

- N(C) ∈ Mat_r(ℤ), symmetric.
- C is negative definite iff −N(C) is positive definite; IsNegSemidef likewise.
- Γ(C) with edge labels (C_i·C_j) > 0.
- For i ≠ j, (C_i·C_j) > 0 iff C_i and C_j are adjacent in Γ(C).
- For an extension K/k, intersection numbers of Cartier divisors on proper S are unchanged after pulling back the entire divisors to S_K, with all multiplicities retained. Separately, for a proper surface S₀ over a finite extension κ/k viewed by restriction of scalars, its divisor intersections over k equal [κ:k] times those over κ. A fibre over a κ-point inside a k-surface is not an instance of this second statement.

One proof route is as follows. Distinct components meet iff (C_i·C_j) > 0 (local intersection multiplicities are positive at common points), so labels are positive exactly on edges. N(C) is symmetric by symmetry of the intersection pairing.

*Needs:* §4.1; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10.

**Checks.**

- Two lines L, L′ in P²_k: N = [[1,1],[1,1]], one edge labelled 1; positive semidefinite, not negative.
- The exceptional curve E of a blow-up at a k-point: N = [−1], negative definite.
- A single smooth fibre F of a fibration S → P¹: N = [0], negative semidefinite and not definite.
- For S₀ = P²_κ viewed as a k-scheme, κ/k finite of degree 2, two κ-lines meet with k-intersection 2 and κ-intersection 1. This is a change of the ground field of the whole surface, not a rule for reduced fibre components in a k-surface.
- Let k have characteristic p and a∉k^p. On the affine chart A²_k of P²_k take D₁ = V(x^p−a) and D₂ = V(y^p−a). Their local k-intersection is p², whereas their reduced geometric supports meet with multiplicity 1; after field extension the Cartier divisors are pC₁ and pC₂. Replacing pullbacks by reduced supports loses both factors.

### 4.4 Contractions of smooth proper surfaces

Let S be a smooth proper surface over k with H⁰(S, O_S) = k and f : S → Z a contraction. Exactly one of the following holds: (a) Z is k-isomorphic to Spec k and f is its structure morphism under that isomorphism; (b) Z is a geometrically normal proper surface and f is birational; (c) Z is a smooth proper geometrically connected curve over k, and f is flat with geometrically connected fibres (f is of fibre type). (SCH23, §2, p. 8; SCH23 line 343).

One proof route is as follows. Z is normal and, after the flat base change to k̄, geometrically normal: O_Z = f_*O_S with S normal, and contractions commute with field extension (§3.1). dim Z = 0: Z = Spec H⁰(Z, O_Z) = Spec H⁰(S, O_S) = Spec k. dim Z = 2: f is generically finite, and O_Z = f_*O_S forces the generic fibre to have degree one, so f is birational. dim Z = 1: a geometrically normal curve is smooth; S is integral and dominates the Dedekind scheme Z, so f is flat; H⁰(Z, O_Z) = k with Z geometrically reduced gives geometric connectedness; fibres are geometrically connected by Zariski connectedness.

*Needs:* §3.1; SchemeAndStackFoundations §§0.9, 0.11, 0.23; SchemeAndStackFoundations §§4.9–4.12.

**Checks.**

- The blow-up of P²_k at a k-point is of type (b); P¹×P¹ → P¹ is of type (c); S → Spec k is of type (a).

### 4.5 Negative definiteness of exceptional curves (Du Val, Mumford, Grauert)

Let S be a regular two-dimensional scheme, proper over a field k, f : S → Z a proper birational morphism onto a normal surface and z ∈ Z a closed point with dim `f^{-1}(z)` = 1. The irreducible components E_1, …, E_r of `f^{-1}(z)` have negative definite intersection matrix ((E_i·E_j)). For the base-change application assume additionally that S is smooth over k and Z is geometrically normal; then after any algebraically closed extension Ω/k the theorem applies to the closed fibre points of f_Ω. Regularity alone need not survive a field extension. (LIP69, §13, p. 223, and Lemma (14.1), p. 224; LIP69 line 1167; AHK07, proof of Lemma 1.6, p. 4; AHK07 line 135).

One proof route is as follows. Localise at z: X = S ×_Z Spec `O_{Z,z}` → Spec `O_{Z,z}` is a desingularisation of a two-dimensional normal local ring. Choose a nonzero nonunit r ∈ `O_{Z,z}`; its pullback divisor C = Σ c_iE_i + (strict part) satisfies (C·E_i) = 0 for all i, with c_i > 0 by connectedness of the fibre (Zariski) and the strict part meeting some E_i; the standard criterion then gives definiteness. For the geometric application use smoothness of S and geometric normality of Z, so S_Ω is regular and Z_Ω is normal. Flat base change preserves the contraction, and birationality persists for these geometrically integral surfaces. Do not base change a merely regular surface without this additional hypothesis.

*Needs:* §4.3; §4.4; StableReduction Layer 4; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10.

**Checks.**

- For the blow-up at a closed point x of a regular proper k-surface, E is P¹ over κ(x) and O(E)|_E = O(−1). Thus E² = χ_k(O_E(−1)) − χ_k(O_E) = 0 − [κ(x):k] = −[κ(x):k]; at a k-rational point this is −1. A residue-field-independent value −1 would discard the restriction-of-scalars factor of §0.1.
- On Bl_x P²_ℝ for x = V(u²+1,v) in the affine chart, κ(x) = ℂ and E² = 0 − 2 = −2. After extension to ℂ, the full exceptional divisor is E₁ + E₂, with E₁² = E₂² = −1 and E₁·E₂ = 0, giving (E₁+E₂)² = −2. Taking just one geometric component would incorrectly give −1 for the full pullback.
- For the minimal resolution of an A_n singularity over an algebraically closed field, n ≥ 1, the diagonal entries are −2 and adjacent entries are 1, giving the negative of the A_n Cartan matrix. For n = 1 the matrix is [−2]; for n = 2 it is [[−2,1],[1,−2]], whose quadratic value on (1,1) is −2.

### 4.6 Zariski's lemma for fibres of fibrations of regular surfaces

Let S be a regular two-dimensional scheme, f : S → Z a proper flat morphism onto a regular one-dimensional scheme with O_Z = f_*O_S, z ∈ Z a closed point and f^*(z) = `Σ_{i=1}^r` m_iC_i its fibre. Then (C_i·C_j) ≥ 0 for i ≠ j, with equality iff C_i ∩ C_j = ∅; (f^*(z)·C_j) = 0 for all j; the intersection form on ⊕ℚC_i is negative semidefinite with radical ℚ·Σm_iC_i; every proper subset of {C_1, …, C_r} spans a negative definite sublattice; in particular C_i² < 0 for every i when r ≥ 2. (STACKS, Lemma 55.9.7, tag 0C66, Semistable Reduction line 2982).

One proof route is as follows. Localize the base at z. Off-diagonal entries are nonnegative local intersection degrees; the full fibre is locally principal, so N m=0 for the positive multiplicity vector m. The contraction condition makes the fibre, hence the support graph of its intersection matrix, connected; as a `SimpleGraph` this is `TauCeti.NumericalType.intersectionGraph`, connected by `TauCeti.NumericalType.intersectionGraph_connected` once the fibre data form a `TauCeti.NumericalType`, the packaging already required by `TauCeti.NumericalType.sum_sum_intersection_mul_neg`. Apply the supplied matrix inequalities and proper-principal-submatrix theorem to obtain the radical and negativity statements. The proof of Stacks tag 0C66 uses exactly these three inputs; it uses no smooth-generic-fibre assertion in this step.

*Needs:* §4.3; StableReduction Layer 4; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10.

**Checks.**

- For a fibre of type I₂ (two rational curves meeting in two points), N = [[−2, 2], [2, −2]].
- For an irreducible fibre, N = [0].
- For two components meeting transversally at one κ(z)-rational point, the relative off-diagonal entry is 1. If κ(z)/k has degree 2 and the surface also lies over k, the absolute degree of that intersection over k is 2; the vertical pairing here uses 1, not 2.

### 4.7 Descent of curves with negative self-intersection

Let S be a smooth proper surface over k and Ω/k an algebraically closed extension. A reduced integral curve C ⊂ S_Ω with C² < 0 is defined over a finite separable extension of k. If `Num_{S/k}` is constant, C = D_Ω for a geometrically integral curve D ⊂ S defined over k. (STACKS, Proposition 99.9.4, tag 0D01, Quot and Hilbert Spaces line 1177; Remark 99.7.10, tag 0CZV, the same chapter line 969).

For two distinct integral effective curves on a smooth surface, their mutual intersection is nonnegative. Thus a negative curve cannot be replaced by a different numerically equivalent effective integral curve. This pins down the descended closed subscheme, including its marking as a subscheme of S.

One proof route is as follows. Use the Hilbert algebraic space of proper subschemes of S (Stacks Proposition 99.9.4). At [C] its tangent space is Hom(I_C,O_C) = H⁰(C,O_C(C)), by the quotient-deformation formula of Remark 99.7.10; C is Cartier because S_Ω is regular. The normal line bundle has degree C² < 0 on an integral proper curve, hence has no nonzero global section. The Hilbert space is locally of finite presentation and has zero geometric tangent space here, so it is unramified at [C]. Over a field it is flat, hence étale there. Such a point has a finite separable field of definition, even if Ω/k is transcendental. Choose a finite Galois extension defining C. Constancy of Num makes its conjugates numerically equal: after an algebraically closed extension the lattice is unchanged, and its Galois action is trivial. Two distinct effective integral curves have nonnegative mutual intersection, whereas numerical equality would make their mutual intersection equal to C² < 0. Thus every conjugate equals C. The descended closed subscheme is geometrically integral because its extension to Ω is integral. The argument applies also when Ω/k is transcendental; it supplies the field-of-definition theorem required for the fibre applications.

*Needs:* §4.3; §2.7; AlgebraicModuliForArithmeticGeometry §2.1, proper-Hilbert supplier extension; SchemeAndStackFoundations §§0.9, 0.11, 0.23; SchemeAndStackFoundations §§3.4–3.5.

**Checks.**

- An exceptional (−1)-curve on a smooth surface with constant Num is defined over k.
- On a real quadric whose two rulings are conjugate, a ruling has square zero; the negative hypothesis cannot be dropped.
- On the blow-up of P²_ℝ at a nonreal closed point, the two geometric exceptional curves are conjugate and Num is not constant.
- On a conjugate pair of geometric exceptional curves over a nonreal point, each has square −1 and mutual intersection 0. They are distinct numerical classes because their difference pairs with the first as −1.

### 4.8 Descent of fibre dual graphs under constant Num (Schröer, Theorem 2.1(i))

Let S be a smooth proper surface over k with H⁰(S, O_S) = k and `Num_{S/k}` constant, f : S → Z a contraction, ā : Spec Ω → Z a geometric point with image a, S_ā = S ×_Z Spec Ω and S_a = `f^{-1}(a)`. If S_ā is one-dimensional, then Γ(S_ā) → Γ(S_a) is a graph isomorphism. (SCH23, Theorem 2.1(i) and proof, pp. 8–9; SCH23 line 349).

This is `fibreComponentGraph_descends_of_constantNumericalClasses`. The surface is a smooth proper k-scheme all of whose irreducible components have dimension two, H⁰(S, O_S) = k is the statement that the map of global sections of the structure morphism is an isomorphism, constancy is `HasTrivialNumericalGaloisAction` for a specified algebraic closure, Z is proper over k with f over k, and Ω is any algebraically closed field. The conclusion is a `componentGraph` isomorphism e from the geometric fibre S ×_Z Spec Ω to the scheme-theoretic fibre over a = ā(closed point), with each geometric component C and its image e(C) having the same closure in S. Closures are taken in S on both sides because the fibre over a nonclosed point is not closed in S; since a closed subset T of a subspace satisfies T = closure_S(T) ∩ subspace, the equation determines e. Over the generic point of a fibre-type target the geometric fibre is irreducible (the generic fibre is normal with H⁰ = κ(a), so κ(a) is algebraically closed in its function field), and both graphs have one vertex.

One proof route is as follows. After extending the ground field to Ω, regard the geometric fibre as a closed curve on the smooth Ω-surface. In the birational case exceptional negativity applies; in fibre type, Zariski’s lemma makes every component of a reducible fibre negative. Descend each such component over k by §4.7. Their images give distinct schematic components; field-base-change vertex bijectivity reflects adjacency by faithful flatness. A one-component geometric fibre has a one-component schematic fibre, so both graphs have one vertex.

*Needs:* Mathlib `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Scheme.Hom.fiber` and `IsAlgClosed` for the statement; §4.4; §4.5; §4.6; §4.1; §2.7; §1.1; §4.7.

**Checks.**

- Over a finite field, every geometrically reducible fibre of a genus-one fibration of an Enriques surface with constant Num has its geometric components defined over its residue field (the Enriques application described under Downstream consumers).
- Without constant Num the statement fails: for a conic bundle S → P¹_ℝ with a fibre x² + y² = 0 over a real point a, Γ(S_ā) has two vertices (the conjugate lines) over one vertex of Γ(S_a), and complex conjugation swaps their classes in Num(S_ℂ).
- On the blow-up of a k-point of a smooth fibre, the two fibre components have matrix [[−1,1],[1,−1]]. They descend separately and the edge is preserved.

### 4.9 Rationality of reducible-fibre image points

Under §4.8, if the one-dimensional geometric fibre is reducible, prove that its image a is a closed k-rational point, so κ(a)=k. The statement includes geometric points over nonclosed points of Z: reducibility forces their image to be closed. This strengthens the purely inseparable conclusion of SCH23 Theorem 2.1(iii), using negative-curve descent and the proper Hilbert-space contract. (SCH23, Theorem 2.1(iii) and proof, pp. 8–9; SCH23 line 349).

This is `residueField_eq_of_reducible_geometricFibre`, on the hypotheses of `fibreComponentGraph_descends_of_constantNumericalClasses` together with reducibility of the geometric fibre. Its conclusion is that the composite Spec κ(a) → Z → Spec k is an isomorphism; since Z is of finite type over k, κ(a) = k forces a to be closed.

One proof route is as follows. Choose a negative component in the reducible geometric fibre and descend it to a geometrically integral proper k-curve D. The scheme-theoretic image W of D → Z is proper; after extension to Ω it is the reduced Ω-point specified by the fibre. Faithfully flat descent gives W=Spec k. Thus a is closed and κ(a)=k; equivalently its residue field embeds in H⁰(D,O_D)=k.

*Needs:* §4.8; §4.6; §4.5; §4.7.

**Checks.**

- Over a finite field every purely inseparable extension is trivial, so reducible geometric fibres lie over rational points.
- A smooth irreducible fibre over a closed separable point of degree 2 has one geometric component in the chosen fibre and is outside the reducibility hypothesis; its residue degree can be 2.

### 4.10 Descent of intersection labels

In the situation of §4.8, suppose S_ā is reducible and (S_a)_red is geometrically reduced over κ(a). Then κ(a) = k, and the graph isomorphism Γ(S_ā) → Γ(S_a) preserves edge labels: (C_i·C_j) on S_Ω equals (D_i·D_j) on S for the components C_i, C_j of S_ā over the components D_i, D_j of S_a. When the geometric fibre has only one component, label preservation is vacuous; the residue-field assertion here is only for reducible fibres. (SCH23, Theorem 2.1(ii), p. 8; SCH23 line 349).

The label statement retains the geometric-reducedness hypothesis of SCH23 Theorem 2.1(ii). The Hilbert-rigidity route proves the stronger geometric-integrality assertion for its descended component divisors.

One proof route is as follows. If there is one component there are no edge labels. In the reducible case §4.9 gives κ(a)=k. Section 4.7 descends each geometric component to a geometrically integral Cartier divisor D_i on the smooth surface. Its full Cartier pullback is the component C_i with multiplicity one. Ordinary proper intersection base change gives (D_i·D_j)_k=(C_i·C_j)_Ω. This also proves the required geometric reducedness of the component supports; no separate residue-degree rescaling inside the ambient k-surface is used.

*Needs:* §4.8; §4.9; §4.3; §4.7.

**Checks.**

- Over a finite field the residue extension is trivial by (iii) and the labels agree directly.
- For the two components obtained by blowing up a k-point on a smooth fibre, the edge label is 1 before and after every field extension. For an irreducible fibre there are zero edges and no label equality to test.

### Examples

In an I₂ fibre the matrix [[−2,2],[2,−2]] has quadratic value −2(a−b)² and radical (a,a); each singleton submatrix is [−2]. For a reducible fibre obtained by blowing up a smooth rational point the matrix [[−1,1],[1,−1]] has value −(a−b)² and label 1. In both, (C₁−C₂)·C₁ is negative (−4 and −2 respectively), so an exchange of distinct components cannot fix numerical classes. A node on an irreducible curve produces no loop in the simple component graph (Stacks tag 0C66; SCH23 §2; §§4.1–4.10).

### Dependencies

Layers 0–3; StableReduction Layers 1 and 4; SchemeAndStackFoundations §§5.3 and 5.9; Tau Ceti matrix inequalities; AlgebraicModuliForArithmeticGeometry §2.1 with the exact proper-Hilbert tangent extension. Component graphs are independent of intersection labels; negative-curve rigidity precedes graph, residue-field and label descent.

## Layer 5: numerical theory in families and descent along contractions

### 5.1 Restriction of numerical classes to the special fibre over a DVR

Let R be a discrete valuation ring with residue field k, S = Spec R, and 𝒳 → S proper with special fibre X = 𝒳 ⊗_R k. The curves over S are exactly the integral curves of X, so N₁(𝒳/S) is a quotient of N₁(X/k), and restriction of invertible sheaves induces res : N¹(𝒳/S) → N¹(X/k), [𝓛] ↦ [𝓛|_X], which is injective. 𝒳/S is called numerically surjective when res is surjective (equivalently its ℚ-form is). (HW23, Theorem 1.3(2), p. 2, and the remark after Theorem 1.4, p. 3; HW23 lines 90 and 111; HW23, proof of Theorem 1.3(2a), p. 33; HW23 line 1513).

The API gives the following facts.

- res : N¹(𝒳/S) → N¹(X/k) and its ℚ-form.
- res is injective.
- The predicate that res is surjective.
- N₁(𝒳/S) ≅ N₁(X/k)/(im res)^⊥, compatibly with the pairings.
- For an extension of DVRs R → R′ with 𝒳′ = 𝒳 ⊗ R′, res commutes with the base change maps.

One proof route is as follows. The only closed point of S is the closed point, so by §0.5 𝓛 ≡_S 0 iff 𝓛|_X ≡ 0: res is well defined and injective. A 1-cycle on X pairs with Pic(𝒳) through restriction; it is numerically trivial on 𝒳/S iff it annihilates the image of res, so N₁(𝒳/S) = N₁(X)/(image of res)^⊥.

*Needs:* §1.1; §1.4; §0.5.

**Checks.**

- For n≥1 and 𝒳 = P^n_R, res is the identity of ℝ ≅ N¹ and 𝒳 is numerically surjective.
- For 𝒳 = S, both N¹ groups are zero; the restriction map is 0 → 0 and remains injective and surjective.
- For the smooth quadric 𝒳 = {x² + y² = zw} over the non-complete DVR ℤ_(5), the rulings of the generic fibre are defined over ℚ(i) and exchanged by Galois, so Pic(𝒳) = Pic(𝒳_ℚ) has rank 1, while the special fibre over 𝔽₅ (where −1 is a square) is split with N¹ of rank 2: res is injective and not surjective. Over a henselian DVR this cannot happen, since the ruling cover is étale.

### 5.2 Numerical representatives and exact restrictions

In the situation of §5.1, assume 𝒳/S is numerically surjective. Then for every L ∈ Pic(X) there are m ≥ 1 and 𝓛 ∈ Pic(𝒳) with 𝓛|_X ≡ `L^{⊗m}` (numerical equivalence on X); equivalently every ℚ-line bundle on X is numerically the restriction of a ℚ-Cartier class on 𝒳. Numerical surjectivity does not imply that L itself, is isomorphic to the restriction of an invertible sheaf on 𝒳. This assertion does not claim that every positive power also fails to lift. (HW23, proof of Theorem 1.3(2), pp. 33–34; HW23 line 1528; LMFDB11, 11.a2 (Cremona 11a1), minimal equation, Mordell–Weil group and bad-prime data; LMFDB11 line 88).

One proof route is as follows. The relative and special-fibre numerical groups are finite free lattices. Surjectivity after tensoring with ℚ means that the injective integral image has finite index; clearing this index gives a numerical representative after a positive power. It says nothing about the degree-zero Picard kernel. On the regular elliptic model over ℤ_(7) described below, every generic line bundle extends, and a vertical divisor is a multiple of the principal special fibre, so Pic of the model equals Pic of the generic elliptic curve. A special degree-zero point outside the rational specialization image therefore has no exact lift. Its numerical class is zero, and some positive power does lift.

*Needs:* §5.1; §1.2; §1.3.

**Checks.**

- When 𝒳 → Spec R is also flat, H²(X, O_X) = 0 and R is complete, every invertible sheaf on X has an actual lift (§5.3).
- Flatness is necessary even with numerical surjectivity. Over an algebraically closed field k of characteristic 3, let i : D → P³_k be the smooth Fermat quartic and I = i_*O_D. The restricted Euler sequence gives H¹(P³,T_P³ ⊗ I) ≅ H²(D,O_D) = k, since H¹(D,O_D(1)) = H²(D,O_D(1)) = 0. Glue split square-zero extensions by a derivation cocycle mapping to 1; the line-bundle obstruction then satisfies δ(O(n)) = n·1, so the restriction image in Pic(P³) = ℤ is exactly 3ℤ (the square-zero units sequence of KLE05, proof of Proposition 5.19, p. 47; KLE05 lines 2234–2238). The ideal section 1_D defines t, with t² = 0 and tO_𝒳 = I, giving a proper k[[t]]-scheme 𝒳 with special fibre P³. Thus H²(P³,O) = 0 and res on N¹ is surjective, but O(1) does not lift; t² annihilates O_𝒳, so the family is not flat.
- For the elliptic equation y²+y=x³−x²−10x−20 over 𝔽₇, the affine y-solution counts for x=0,…,6 are (0, 1, 2, 0, 2, 2, 2); they sum to 9 and the point at infinity gives 10. This excludes an incorrect rational-specialization cardinality.

### 5.3 Line bundles lift over a complete DVR when H²(X, O_X) = 0

Let R be a complete discrete valuation ring, 𝒳 → Spec R proper flat with special fibre X, and H²(X, O_X) = 0. Every invertible sheaf L on X is isomorphic to 𝓛|_X for some invertible 𝓛 on 𝒳; in particular 𝒳/R is numerically surjective. If L is ample, every such 𝓛 is ample over R. The existence of an actual lift is `lineBundle_lifts_completeDVR_of_h2_zero`; its vanishing assumption is that the native degree-two structure-sheaf cohomology of the residue-field pullback is the zero group, expressed by Subsingleton. (HW23, Lemma 6.3 and proof, p. 31; HW23 line 1406; KLE05, Proposition 5.19 and proof, p. 47; KLE05 line 2219).

One proof route is as follows. Lift L successively to X_n = 𝒳 ⊗ `R/m^{n+1}`: the obstruction lies in H²(X, O_X) ⊗ `m^n/m^{n+1}` = 0 (AlgebraicModuliForArithmeticGeometry §7.3 `picard_infinitesimal_lifting`, framed lifts along the flat thickenings). Grothendieck's existence theorem (SchemeAndStackFoundations §4.10) algebraises the compatible system (L_n) to an invertible 𝓛 on 𝒳 with 𝓛|_X ≅ L. Ampleness: the closed fibre is the only fibre over a closed point, so openness of fibrewise ampleness for schemes (StableReduction Layer 2, the scheme case of §3.8(i)) makes 𝓛 ample over a neighbourhood of the closed point, which is all of Spec R.

*Needs:* §5.1; StableReduction Layer 2; AlgebraicModuliForArithmeticGeometry §7.3; SchemeAndStackFoundations §§4.9–4.12.

**Checks.**

- For a proper flat family of curves over a complete DVR (H² = 0 automatically), every special-fibre line bundle lifts; for a proper flat lift of an abelian or K3 surface the vanishing hypothesis fails and the Picard rank can drop.
- For P¹_R the special and total line bundles O(d) restrict with degree d, including d=−1,0,1. This tests existence of actual lifts, rather than only rational numerical classes.

### 5.4 Numerical surjectivity identifies relative and special-fibre cones

In the situation of §5.1, if 𝒳/S is numerically surjective then res : N¹(𝒳/S) → N¹(X) is an isomorphism, the identity on cycles induces N₁(X) ≅ N₁(𝒳/S), and under these identifications NE‾(𝒳/S) = NE‾(X), Nef(𝒳/S) = Nef(X), and extremal rays and faces of the two cones correspond. A class on 𝒳 is relatively ample over S iff its restriction to X is ample. (HW23, proof of Theorem 1.3(2a), p. 33; HW23 line 1513).

One proof route is as follows. res is injective (§5.1) and surjective by hypothesis; dualising gives N₁(X) ≅ N₁(𝒳/S) because the curves are the same and the annihilator of im res is zero. Effective cycles correspond under the identity, so the cones and their closures agree; nef cones are their duals; faces correspond. Ampleness over S is tested on the special fibre by openness of fibrewise ampleness for schemes (StableReduction Layer 2).

*Needs:* §5.1; §1.5; StableReduction Layer 2.

**Checks.**

- For n≥1 and 𝒳 = P^n_R both cones are the ray of a line; for n=0, the identity family Spec R, both cycle spaces are 0 and both cones are {0}.

### 5.5 Nef and big classes on the special fibre are nef and big on the generic fibre

Let R be a DVR and T → Spec R flat and projective with integral special fibre T_s and integral generic fibre T_η of dimension n ≥ 1, and let H be a ℚ-Cartier divisor on T. If `H|_{T_s}` is nef and big then `H|_{T_η}` is nef and big. The conclusion depends only on the numerical class of `H|_{T_s}`. (HW23, proof of Theorem 1.3(1), p. 32; HW23 line 1490).

The integrality of both fibres and projectivity are hypotheses of this transfer theorem. No smoothness of the family, perfection of the residue field, characteristic restriction or completeness of the DVR is required.

One proof route is as follows. Top self-intersections are constant in flat proper families: χ(T_t, `mH|_{T_t}`) is independent of t, and (H_t^n) is n! times its leading coefficient in m; so (H_η^n) = (H_s^n) > 0. Nefness: for an integral curve C_η ⊂ T_η, its closure 𝒞 ⊂ T is flat over R and its special fibre is an effective 1-cycle Σ a_iC_i on T_s; constancy of χ on 𝒞 gives (H·C_η) = Σ a_i (H·C_i) ≥ 0. Apply the projective nef-and-big criterion imported by §1.6 from the projective nef-and-big supplier contract: both fibres here are projective, the arbitrary proper extension is not needed. Nefness and the top self-intersection depend only on numerical classes.

*Needs:* §1.5; §1.6; §0.5; SchemeAndStackFoundations §§5.2–5.3, 5.9–5.10.

**Checks.**

- For T = P^n_R and H = O(1), both restrictions are ample.
- The converse fails even with smooth integral fibres. Over k[[t]], blow up P² along the three disjoint sections [1:0:0], [0:1:0], [1:1:t]. For H=2h−e₁−e₂−e₃, the generic three points are noncollinear, so H is nef and H²=1. On the special fibre their common line has strict transform ℓ=h−e₁−e₂−e₃ and H·ℓ=−1. The family and both fibres are smooth; the counterexample is not a blow-up confined to a special point.

### 5.6 Relatively semiample, relatively numerically trivial sheaves descend

Let f : X → Z be a contraction of schemes proper over a Noetherian scheme S, and L an invertible sheaf on X that is f-semiample and f-numerically trivial. Then there are m ≥ 1 and an invertible sheaf M on Z with `L^{⊗m}` ≅ f*M. For ℚ-Cartier divisors: an f-semiample, f-numerically trivial ℚ-Cartier D on X is ℚ-linearly equivalent to f* of a ℚ-Cartier divisor on Z. The lemma is proved here from the rigidity theorem §3.2. Its three-dimensional dlt counterparts, which assume no semiampleness of the descended divisor and do not state this lemma, are BMP23, Proposition 2.51, second assertion, pp. 26–27, BMP23 line 1177, and Proposition 9.16(a), p. 106, BMP23 line 4789.

The ℚ-divisor conclusion concerns ℚ-Cartier divisor classes (equivalently rational line-bundle classes) on the target. For literal rational sections and Cartier divisors choose the corresponding Cartier representatives; neither numerical equivalence nor pullback is asserted for an unmarked Weil divisor.

One proof route is as follows. Choose m with `f*f_*L^{⊗m}` → `L^{⊗m}` surjective; it defines a Z-morphism φ : X → P = `P_Z(f_*L^{⊗m})` with `L^{⊗m}` ≅ φ*O_P(1). Since L ≡_f 0, φ maps every curve in a fibre of f to a point (O_P(1) is ample on the fibres of P → Z); by §3.2 φ = h ∘ f for a unique Z-morphism h : Z → P. Then `L^{⊗m}` ≅ f*(h*O_P(1)); put M := h*O_P(1).

*Needs:* §3.2; §3.3; §0.4; §3.1.

**Checks.**

- For f the structure map X → X^aff of a proper k-scheme and L torsion, the conclusion holds with M trivial on the finite X^aff.
- Semiampleness cannot be dropped: on an elliptic curve E → Spec k, O(p − q) of infinite order is numerically trivial and no power is pulled back from the point.
- For the first projection P¹×P¹ → P¹ and L=O(a,0), m=1 and M=O(a) work. For L=O(0,1) the fibre degree is 1, so the numerical-triviality hypothesis fails.

### 5.7 Vertical numerical descent (Cascini–Tanaka, Lemma 2.17)

Let f : X → S be proper between integral normal excellent schemes, with f_*O_X=O_S. Suppose S is ℚ-factorial, L is an f-nef ℚ-Cartier ℚ-divisor, its generic-fibre restriction is ℚ-linearly trivial, and every prime divisor of X dominates S or maps onto a prime divisor of S. Prove that there is a ℚ-Cartier ℚ-divisor M on S with L ℚ-linearly equivalent to f*M. The divisor M is on the target S. (CT20, Lemma 2.17 and proof, pp. 16–18; CT20 line 630; BMP23, proofs of Lemmas 2.54 and 9.25, pp. 27 and 111; BMP23 line 1230; WIT22, proof of Proposition 6.6; WIT22 line 1813).

Prove the following curve-detection input over every field: on an integral proper variety V, every nonzero effective Cartier divisor D has (O(D)·C) > 0 for some integral proper curve C ⊂ V meeting D but not contained in it (CT20, proof of Lemma 2.17, CT20 lines 667–702). Apply this on the zero-coefficient component to the restricted nonzero section. A curve on a nonclosed fibre is allowed by the all-fibres version of nefness.

One proof route is as follows. Replace L by a positive Cartier multiple and a rationally equivalent divisor supported over a proper closed subset of S. Over the generic point of a prime divisor P of S, subtract a rational multiple of f*P so that all vertical coefficients are nonpositive and at least one is zero. If a coefficient were negative, connectedness of the fibre provides an intersection between a zero-coefficient component and a negative-coefficient component. A section defining the effective opposite divisor is nonzero on the first and vanishes on that intersection. A proper integral curve in the first component meeting the zero locus has strictly positive degree for −L, contrary to f-nefness. Such a curve is obtained on a projective Chow cover and mapped down; all field and multiplicity factors are positive. This is the argument in CT20 lines 667–702. Repeating over the finite support gives M on S. A surface-slicing or regular-model extension is not needed for this route.

*Needs:* §1.5; §3.1; SchemeAndStackFoundations §§0.9, 4.9, 4.12; JacobianChallenge Layer A for positive degree of a nonzero section divisor on a proper curve.

**Checks.**

- For f a projective bundle over a regular S, every f-nef L trivial on the generic fibre is a pullback.
- The last hypothesis is needed: for the blow-up f : X = Bl_p S → S of a closed point on a regular surface, L = O(−E) is f-nef ((−E)·E = 1), trivial on the generic fibre, and not ℚ-linearly a pullback since pullbacks have degree 0 on E; here E maps to a point.
- For the identity X=S the generic-fibre condition is vacuous and M=L works; the base need not be a field.

### 5.8 Extremal curves of minimal normalised degree on a ray

Let f : X → T be projective with T Noetherian, R ⊂ NE‾(X/T) a ray containing the class of some curve over T, and H an f-ample Cartier divisor. For curves C over T with [C] ∈ R, the numbers (H·C)/d_C are positive integers, where d_C is the curve index of C over the residue field of its image point (§0.2). Hence the minimum μ_H(R) = min{(H·C)/d_C : [C] ∈ R} is attained; a curve attaining it is called extremal. Extremality does not depend on H, and for every ℚ-Cartier D with D·R < 0, an extremal Γ maximises (D·C)/d_C among curves in R. (BMP23, Definition 9.30 and the following paragraph, p. 116; BMP23 line 5252).

One proof route is as follows. d_C divides (H·C) (§0.2), and (H·C) > 0 for f-ample H, so (H·C)/d_C ∈ `ℤ_{>0}`; a nonempty set of positive integers has a minimum. All curves in R have classes λ_C·ξ for a fixed generator ξ with λ_C > 0; for another ample H′, (H·C)/(H′·C) = (H·ξ)/(H′·ξ) is constant on R, so the minimisers coincide. For D·R < 0, (D·C)/d_C = λ_C(D·ξ)/d_C with D·ξ < 0 is maximal exactly where λ_C/d_C, equivalently (H·C)/d_C, is minimal.

*Needs:* §0.2; §1.4.

**Checks.**

- On P^n_k over k with n≥1 the lines are extremal, with (O(1)·line)/d = 1.
- For X = P¹_ℂ viewed over T = Spec ℝ, d_X = 2 and (O(1)·X)_ℝ/d_X = 1.
- For H′=3H the minimum is multiplied by 3 but the minimizing curves are unchanged. On a ray with normalized H-values 1 and 2 and D=−2H, the D-values are −2 and −4; the minimum H-value gives the maximum D-value.

### 5.9 The Alexeev–Hacon–Kawamata birational Picard rank

For a normal projective complex variety Y and a projective smooth resolution π : X → Y, define ρ_AHK(Y)=ρ(X)−e(π), with e(π) the number of exceptional prime divisors and subtraction in ℤ. Prove independence of resolution, invariance under birational maps that are isomorphisms in codimension one, and equality with the Cartier Picard number when Y is ℚ-factorial. For a projective birational map Y → Y′ contracting r prime divisors, prove ρ_AHK(Y′)=ρ_AHK(Y)−r. These statements concern the projective complex setting, not the naive Cartier rank of an arbitrary singular variety. (AHK07, §1, working convention over ℂ, p. 2; AHK07 line 63; Lemma 1.6 and proof, pp. 3–4; AHK07 line 135; HW23, §3, p. 12; HW23 line 542).

The relative extension is a target under the exact degree-witness supplier contract: for normal finite-type k-schemes Y equipped with a projective morphism to a Noetherian k-scheme T, with projective regular resolutions and common projective regular dominations, prove that ρ(X/T)−e(π) is independent of such a resolution. Prove the same small-modification and r-divisor rank-change laws, and equality with ρ(Y/T) for ℚ-factorial Y. Existence of regular resolutions in positive characteristic is not asserted. The supplied degree witnesses, rather than existence of resolutions alone, provide the exceptional independence needed for this statement. For positive-dimensional projective complex Y, prove ρ_AHK(Y)≥1; a point has value 0.

The API gives the following facts.

- For normal projective complex Y, ρ_AHK(Y) ∈ ℤ is computed on a projective smooth resolution; independence is part of the target.
- For every projective smooth resolution π : X → Y of a normal projective complex variety, ρ_AHK(Y)=ρ(X)−#Exc(π).
- If Y is smooth, ρ_AHK(Y) = ρ(Y).
- ρ_AHK is invariant under birational maps over ℂ that are isomorphisms in codimension one.
- For a projective birational morphism Y → Y′ of normal projective complex varieties contracting exactly one prime divisor, ρ_AHK(Y′)=ρ_AHK(Y)−1; with r exceptional prime divisors the difference is r.

One proof route is as follows. Exceptional-divisor independence is obtained by slicing in the projective complex setting and applying exceptional surface negativity. If e cuts come from the target and n=dim X, the additional number of cuts on X is n−e−2, leaving dimension 2. Normality of Y makes each exceptional-divisor image have codimension at least two, so e≤n−2 and this number of cuts is nonnegative. A common projective smooth resolution compares two resolutions; pullback and pushforward on a smooth intermediate variety split off the independent exceptional classes. Small modifications have the same exceptional divisors on a common resolution. When Y is ℚ-factorial, pushed-forward Weil divisors have Cartier multiples, giving the comparison with N¹(Y).

*Needs:* §1.1; §1.2; §1.3; §4.5; SchemeAndStackFoundations §§4.9–4.12; the exceptional-degree supplier extension of SchemeAndStackFoundations §5.9; ResolutionOfSingularitiesCharacteristicZero §7.8 for the complex proof route.

**Checks.**

- ρ_AHK(P²/ℂ) = 1, computed on P² or on any blow-up `Bl_{p}P²` (2 − 1).
- For Y=Spec ℂ, the identity resolution gives ρ_AHK(Y)=0; no positivity assertion is made in dimension zero.
- For the projective cone Y over a smooth conic, the minimal resolution is the Hirzebruch surface F₂ with ρ = 2 and one exceptional curve, so ρ_AHK(Y) = 1.
- Take the projective quadric threefold cone Y=V(xy−zw)⊂P⁴_ℂ. An incidence small resolution X→Y is a P²-bundle over P¹, hence projective with ρ(X)=2 and no exceptional prime divisors. Thus ρ_AHK(Y)=2, while the Cartier Picard rank of Y is 1. An affine local ordinary double point would not test the projective theorem.

### Examples

For the smooth elliptic model over ℤ_(7), E(ℚ) has order 5 and E(𝔽₇) has order 10, while both numerical groups are ℤ detected by degree. Thus numerical lifting holds but some degree-zero special sheaves have no exact lift. The three-point blow-up in §5.5 has H²=1 on both fibres but special intersection H·ℓ=−1, distinguishing the direction of nef specialization. The projective quadric threefold cone has a projective small resolution of Picard rank 2 and zero exceptional divisors: its AHK rank is 2 although its Cartier Picard rank is 1 (LMFDB11 lines 88–104; AHK07 Lemma 1.6; §§5.2, 5.5 and 5.9).

### Dependencies

Layers 0–4; AlgebraicModuliForArithmeticGeometry §7.3 infinitesimal lifting and its §1.6 bigness inputs; SchemeAndStackFoundations §§4.10, 4.12, 5.3, 5.9 and its exceptional-degree extension. The vertical-descent route uses connectedness, nefness and a proper curve through a section zero; it does not require the surface Zariski lemma. The complex AHK comparison uses ResolutionOfSingularitiesCharacteristicZero §7.8 for common smooth dominations. The relative AHK extension uses degree witnesses and specified regular common resolutions, independently of DVR lifting.

## Downstream consumers

EnriquesSurfacesAndIntegralNonexistence asks, under its supplier contract named numerical-contraction-descent, addressed to a SchemeAndStackFoundations Part II, for the arbitrary-field numerical quotient with base change, descent of projective contractions under constant Num, fibre-graph descent, label preservation and the residue-field assertion of SCH23 Theorems 1.3 and 2.1; these are §§0.3, 1.1, 1.3, 3.7 and 4.8–4.10 here. The family version of that contract (proper flat families with flat Pic^τ and locally constant geometric rank) and its supplier contract named picard-flatness-betti (relative Picard flatness when b₁ = 2(h¹(O) − h²(O)) over a local Noetherian W(k)-algebra) are not targets here. K3SurfacesAndSymplecticBoundedness asks, under its supplier contract named surface-arithmetic-quotient, for the arbitrary-field surface numerical quotient with base-field comparison, which is §§0.3 and 1.1 here. WeilConjectures's numerical Picard local system with its finite rank and positive-multiple base-divisor descent is the finite-field case of §§1.2 and 2.6–2.10, and NeronModelsAndSemistableAbelianVarietiesPartII §2.9's fibre graphs, labels and rational base points of genus-one fibrations over finite fields are the finite-field case of §§4.7–4.10.

## Worked examples

For E : y²+y=x³−x²−10x−20, good reduction at 7 follows from conductor 11. Its rational Mordell–Weil group has rank 0 and torsion ℤ/5 (LMFDB11 lines 88–104 and 164). Direct substitution in 𝔽₇ gives the affine point counts listed in §5.2 and total order 10. The specialization image has order 5: prime-to-7 torsion injects under good reduction. Choose any degree-zero special class outside that image. It has numerical class 0, so O numerically lifts it, but it has no exact restriction from the model over ℤ_(7). Its tenth power is trivial and does lift. Neither this example nor HW23 pp. 33–34 asserts failure of all positive-power lifts.

Over k[[t]], blow up P² in the three disjoint sections [1:0:0], [0:1:0], [1:1:t]. The generic points are noncollinear; H=2h−e₁−e₂−e₃ has square 4−1−1−1=1 and is nef. In the special fibre the three points lie on one line, whose strict transform has class ℓ=h−e₁−e₂−e₃; H·ℓ=2−1−1−1=−1. Both fibres are smooth integral surfaces. This tests precisely the failure of the converse to §5.5 while retaining constant top intersection (HW23 proof of Theorem 1.3(1); the intersection calculation is §5.5's specialization example).

For the projective quadric threefold cone xy−zw=0 in P⁴_ℂ, record the kernel line of the rank-one 2×2 matrix [[x,z],[w,y]]. The resulting incidence variety is a projective P²-bundle over P¹, of Picard rank 2, and maps isomorphically off the vertex. Its exceptional fibre is P¹, of codimension two, so it has no exceptional prime divisors. Therefore ρ_AHK=2−0=2, whereas the Cartier rank of the cone is 1. For the quadric surface cone the resolution is F₂, with one exceptional section, giving 2−1=1. These two examples distinguish a small resolution from a divisorial resolution (AHK07 Lemma 1.6; §5.9).

## References

All statements above use the versions and locators below. A source id followed by a line number refers to its line-numbered legal extraction; STACKS line numbers also name the chapter, since the work consists of several chapter files. The references specify the versions used; theorem numbers, printed pages and stable Stacks tags also locate the statements independently of the extractions.

- **SCH23.** Stefan Schröer, [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3). arXiv:2004.07025v3, dated 19 July 2022; published Annals of Mathematics 197 (2023), 1–63. Locators here refer to this arXiv version, whose extracted PDF has 52 pages.
- **KLE05.** Steven L. Kleiman, [The Picard scheme](https://arxiv.org/pdf/math/0504020v1). arXiv:math/0504020v1 (PDF page = printed page); published in Fundamental Algebraic Geometry, Math. Surveys Monogr. 123, AMS 2005 (numbering 9.x).
- **BMP23.** Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron, Jakub Witaszek, [Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic](https://arxiv.org/pdf/2012.15801v3). arXiv:2012.15801v3 (pages are PDF pages of v3); published Publ. Math. IHÉS 138 (2023).
- **HW23.** Christopher Hacon, Jakub Witaszek, [On the relative minimal model program for fourfolds in positive and mixed characteristic](https://arxiv.org/pdf/2009.02631v2). arXiv:2009.02631v2 (PDF pages; the published Forum Math. Pi 11 (2023) renumbers Theorem 1.3 of §6 as Theorem 6.1).
- **WIT22.** Jakub Witaszek, [Keel's base point free theorem and quotients in mixed characteristic](https://arxiv.org/pdf/2002.11915v2). arXiv:2002.11915v2; published Annals of Mathematics 195 (2022), 655–705.
- **DW22.** Omprokash Das, Joe Waldron, [On the log minimal model program for threefolds over imperfect fields of characteristic p > 5](https://arxiv.org/pdf/1911.04394v3). arXiv:1911.04394v3; published J. London Math. Soc. (2022).
- **CT20.** Paolo Cascini, Hiromu Tanaka, [Relative semi-ampleness in positive characteristic](https://arxiv.org/pdf/1706.04845v3). arXiv:1706.04845v3; published Proc. London Math. Soc. 121 (2020).
- **AHK07.** Valery Alexeev, Christopher Hacon, Yujiro Kawamata, [Termination of (many) 4-dimensional log flips](https://arxiv.org/pdf/math/0605137v2). arXiv:math/0605137v2; published Invent. Math. 168 (2007).
- **LIP69.** Joseph Lipman, [Rational singularities, with applications to algebraic surfaces and unique factorization](https://www.numdam.org/item/PMIHES_1969__36__195_0.pdf). Publ. Math. IHÉS 36 (1969), 195–279 (Numdam).
- **EGA-IV3.** Alexander Grothendieck (with Jean Dieudonné), [Éléments de géométrie algébrique IV, troisième partie](https://www.numdam.org/item/PMIHES_1966__28__5_0/). Publ. Math. IHÉS 28 (1966), Numdam open archive scan.
- **STACKS.** The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). online, tags read 19 October 2026 (stable tags are the locators).
- **KEE99.** Seán Keel, [Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149v1). Annals of Mathematics 149 (1999), 253–286; arXiv:math/9901149v1; printed page = PDF page + 252.
- **LMFDB11.** The LMFDB collaboration, [Elliptic curve 11.a2 (Cremona 11a1)](https://www.lmfdb.org/EllipticCurve/Q/11/a/2). Database entry 11.a2, also labelled Cremona 11a1; minimal equation, conductor and rational group.
- **PS12.** Artie Prendergast-Smith, [The cone conjecture for abelian varieties](https://arxiv.org/abs/1008.4509v1), arXiv:1008.4509v1 (2010), Proposition 1.2, p. 3, and Theorem 4.3, p. 9.
