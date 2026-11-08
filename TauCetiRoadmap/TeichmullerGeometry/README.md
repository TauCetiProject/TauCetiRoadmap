# Roadmap: Teichmüller geometry of closed surfaces

**Summary.** This roadmap builds the marked Teichmüller theory of a closed connected oriented smooth surface `Σ` of genus `g ≥ 2`: the space `Teich(Σ)` of marked complex structures, constructed from the integrable almost-complex structures on `Σ` modulo the identity component of the diffeomorphism group and compared with marked Riemann surfaces, marked hyperbolic metrics and conjugacy classes of discrete faithful representations of the surface group into `PSL₂(ℝ)` of Euler number `2 − 2g`; its complex deformation atlas of dimension `3g − 3`; the action of the extended mapping class group `Mod±(Σ) = π₀ Diff(Σ)` and the Dehn–Nielsen–Baer theorem in its smooth form, with Smale's theorems on the disc and the sphere, the smoothing of isotopies and the smooth Baer–Epstein kernel theorem as owned inputs, resting on an owned triangulation, PL and smoothing theory of compact surfaces (PL approximation, Radó's theorem, the two-dimensional Hauptvermutung, the Euler characteristic and orientations, Epstein's isotopy theorems and compatible smoothings), with the classification of compact surfaces, branched covers and the topological Riemann–Hurwitz formula, and the topological, PL and smooth mapping class groups; Fenchel–Nielsen coordinates, quasiconformal maps, Teichmüller's extremal theorem and the Teichmüller metric; measured laminations, earthquakes and Kerckhoff's proof of the Nielsen realization theorem; the dimension of fixed loci of finite subgroups and the genus-two hyperelliptic kernel; the finiteness of arithmetic lattices of fixed signature; the isometry group of the hyperbolic plane as `PGL₂(ℝ)` and the open dense locus of marked surfaces whose uniformizing group is maximal among discrete subgroups of `PGL₂(ℝ)`. The end theorems are the three open dense loci of Layers 8, 9 and 10 and their common generic locus of Layer 11: marked hyperbolic surfaces with trivial isometry group, nonarithmetic uniformizing group, and uniformizing group maximal among discrete `PGL₂(ℝ)` overgroups. It is built from the deformation theory of ComplexCurveModuli, the Dolbeault and Serre-duality foundations of ComplexKahlerGeometry, the flows and orientations of DifferentialGeometry, the diffeomorphism group, smooth triangulations and Whitehead's triangulation theorem of Tau Ceti and GeometricTopology, the simplicial complexes, PL maps, isotopies and Schoenflies theorem of Tau Ceti, the covering-space library of Tau Ceti, the fundamental-group and Euler-class suppliers AlgebraicTopology and CharacteristicClasses, the hyperbolic space forms of RiemannianGeometry, the Fuchsian quotient theory of FuchsianOrbifolds and the harmonic-analysis estimates of PDE. All statements are in the author's words with locators; sources that are not openly available are cited by their locators alone and are marked so in the references.

## Scope and ownership

This roadmap owns, on the closed genus-`g ≥ 2` locus unless a section says otherwise:

- the triangulation, PL and smoothing theory of compact surfaces on which the smooth mapping class group rests: PL approximation of planar and surface homeomorphisms, invariance of the boundary, PL structures, Radó's theorem, the two-dimensional Hauptvermutung and isotopy to PL homeomorphisms, the Euler characteristic, orientations and the orientation double cover, Epstein's isotopy theorems for curves, arcs and homeomorphisms, Whitehead compatibility of PL and smooth structures, existence and uniqueness of compatible smoothings and isotopy of homeomorphisms to diffeomorphisms; the classification of compact surfaces with or without boundary by polygon schemas, the standard models and the genus; branched covers and the topological Riemann–Hurwitz formula; the topological, relative, orientation-preserving, PL and smooth mapping class groups and their forgetful comparisons (Layer 0, §0.0a–§0.0h, with the injectivity of the smooth comparison and the mapping class groups of the sphere and the torus in Layer 5, §5.3b and §5.4a);
- the conversion between integrable almost-complex structures on the fixed smooth oriented surface and the native `ChartedSpace ℂ` curve carrier, the marked quotient `Teich(Σ)` and its comparison maps between the four carriers of Layer 1 and Layer 4 (Layers 1, 2, 4, 6);
- the marked holomorphic chart adapter on top of ComplexCurveModuli's deformation theory, the Hausdorff and second-countability proofs for the global marked quotient, and the identification of its dimension with `3g − 3` (Layer 2);
- the identity path component `Diff₀(M)` of a compact surface, the comparison between continuous paths in the weak Whitney topology and smooth isotopies (one half is Tau Ceti's `TauCeti.Diffeotopy.joined_one_final`, the parameter-smoothing converse is owned here), the one-parameter compact-ambient isotopy extension theorem for surfaces proved from DifferentialGeometry's time-dependent flows, and the local isotopy lemma for diffeomorphisms close to the identity (Layer 0);
- the mapping class groups `Mod⁺(Σ)` and `Mod±(Σ)` as `π₀` of the pinned topological group `TauCeti.Diff (𝓡 2) Σ ∞` and the isomorphism of that `π₀` with the smooth mapping class group `MappingClassGroupSmooth` of §0.0h, hence through §5.3b's forgetful isomorphism with the topological `MappingClassGroupFull` (Layer 3);
- the action of `Mod±(Σ)` on `Teich(Σ)`, its proper discontinuity, and the moduli action groupoid (Layer 3);
- the isometry group of the hyperbolic plane as `PGL₂(ℝ)` on Mathlib's `ℍ`, the geometric surface group `Π`, the polygon presentation, the Euler number of a `PSL₂(ℝ)`-representation and the lifted commutator formula, and the uniformizing holonomy (Layer 4);
- the smooth Dehn–Nielsen–Baer theorem: realization of automorphisms by diffeomorphisms through the Douady–Earle extension, Smale's theorems that `Diff(D², ∂)` is contractible and `Diff⁺(S²)` deformation retracts onto `SO(3)`, equivalently that the inclusion `O(3) → Diff(S²)` is a homotopy equivalence, the smoothing of isotopies between diffeomorphisms, and the smooth kernel theorem adapting Epstein's theorem of Layer 0.0d to diffeomorphisms; the smooth curve and arc adapters for the Alexander method; point stabilizers and the Macbeath–Singerman finiteness (Layer 5);
- the converse comparison from representations to marked surfaces (Layer 6);
- Fenchel–Nielsen coordinates with the twist sign convention witnessed below, marked filling-length compactness, the classical and weak Wirtinger derivatives (named in words until Mathlib acquires them, when the definitions here are deleted in favour of Mathlib's), quasiconformal maps on closed surfaces, the measurable Riemann mapping theorem, Teichmüller's extremal theorem, the Teichmüller metric, Wolpert's length distortion and completeness (Layer 7);
- measured laminations, earthquakes, Kerckhoff's convexity and the Nielsen realization theorem for finite subgroups of `Mod±(Σ)`, finite quotient orbifold charts, the dimension of fixed loci, the genus-two hyperelliptic kernel and the open dense locus of structures with trivial stabilizer (Layer 8);
- arithmetic Fuchsian groups over totally real fields in Takeuchi's sense, their covolume lower bound and the finiteness of conjugacy classes of torsion-free arithmetic lattices of fixed genus, by Borel's finiteness theorem; the rational case treated by QuaternionArithmetic §8.1 is a special case of the definition here and is not consumed (Layer 9);
- the two-dimensional projective model of the hyperbolic isometry group on Mathlib's `ℍ` (`GL (Fin 2) ℝ` modulo its centre, acting through conjugation for negative determinant) and the comparison isometry between `ℍ` and Tau Ceti's `UpperHalfSpace ℝ` that transports RiemannianGeometry R4 item 7's isometry group; R4 item 7 keeps the `n`-dimensional hyperbolic group `O⁺(n,1)`, the Killing–Hopf classification, isometry lifting and the quotient metric (Layer 4.1); the minimum area `π/21` of a compact orientable hyperbolic orbifold, proved from FuchsianOrbifolds Layer 4 item 5's signature formula; bounded normal cores, marked regular covers and their deck dictionary, the pullback embeddings `Φ_N`, and the open dense locus of groups maximal among discrete `PGL₂(ℝ)` overgroups (Layer 10);
- the common generic locus (Layer 11).

It leaves to named owners, which are consumed and never planned again:

- the branched-cover Euler characteristic of finite holomorphic maps and the Fuchsian Riemann–Hurwitz and orbifold Euler-characteristic formulas: FuchsianOrbifolds Layer 5 items 3 and 6; elliptic quotient charts and the coarse quotient Riemann surface: FuchsianOrbifolds Layer 1; the orbifold signature and area formula: FuchsianOrbifolds Layer 4 item 5; the restriction of Mathlib's projective action along `PSL(2,ℝ) → PGL(2,ℝ)`: FuchsianOrbifolds Layer 0 item 2;
- smooth normal forms with the orientation-preserving diffeomorphisms of closed oriented surfaces onto them, labelled discs and cut-system comparison: ComplexCurveModuli D0 item 1; the operator/divisor Riemann–Roch comparison with ModularForms Layer 10B: D0 item 2; closed-surface uniformization with the equation `Δ⁺u + K₀ + e^(2u) = 0`: D0 item 4; properness of the diffeomorphism action and finiteness of automorphism groups: D0 item 5; the deformation complex and its dimension `3g − 3 + n + dim A_C`: D3 item 3; the Kodaira–Spencer map: D3 item 4; the full Sobolev chart and the arbitrary-complement smooth-offset inverse function theorem: D3 item 5; the integrability dictionary for holomorphic total families: D3 item 6; universal unfoldings and their universal property: D4 items 1 and 4; geodesic cuts, collars and hyperbolic compactness ingredients: D6 item 2;
- the Newlander–Nirenberg theorem: ComplexKahlerGeometry K1; holomorphic tangent and canonical bundles: K4; compact elliptic regularity, Dolbeault Hodge theory and Serre duality: K5b;
- forms, orientations, integration and the Riemannian Laplacian convention: DifferentialGeometry Layers 0, 2, 5 and 12; time-dependent flows: DifferentialGeometry Layer 3.5;
- the topological-group structure of `Diff(M)` for the weak Whitney topology on a compact manifold and the smooth-families map: Tau Ceti (`TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`, `Diffeomorph.isTopologicalGroup`, `Diffeomorph.ofSmoothFamily`) and GeometricTopology Layer 3; collars, tubular neighbourhoods and the disc theorem: GeometricTopology Layer 1; Whitehead's theorem that every smooth manifold has a smooth triangulation, unique up to linear isomorphism of subdivisions: GeometricTopology's smoothing-and-triangulation comparison, item 1;
- van Kampen presentations: AlgebraicTopology Stage 1 items 4 and 5; the oriented intersection pairing: Stage 6; the Euler class, its naturality and section obstruction: CharacteristicClasses C2 item 2; the evaluation `e(TM)[M] = χ(M)`: C2 item 3;
- the based universal cover, the deck group `deck(proj) ≃* (π₁)ᵐᵒᵖ`, the normal-cover deck quotient and the Galois correspondence: Completed/UniversalCovers Stages 1 and 2, realized by Tau Ceti's `TauCeti.UniversalCover.deckFundamentalGroupEquiv`, `TauCeti.UniversalCover.loopDeck` and `deckSubgroupQuotientProjEquivOfNormal`;
- the hyperbolic models in every dimension, Killing–Hopf, isometry lifting and the quotient metric: RiemannianGeometry R4 item 7;
- the maximal inequality, Marcinkiewicz and Riesz–Thorin interpolation and Calderón–Zygmund bounds: PDE Lane B items 8, 9 and 10;
- the cohomological divisor Riemann–Roch, Serre duality by residues and the analytic-genus comparison: ModularForms Layer 10B (iii)–(v), consumed only through ComplexCurveModuli D0 item 2.

ComplexCurveModuli and FuchsianOrbifolds have no dependency on this roadmap. The Fuchsian source-specific application that consumes Layers 10 and 11 is a later Fuchsian roadmap and is named only under Downstream consumers.

## Conventions

- A **closed surface** is a compact connected boundaryless smooth surface; `Σ` is closed, oriented, of genus `g ≥ 2` except in Layers 0 and 5, whose theorems hold for every closed orientable surface and say so. The standard oriented smooth genus-`g` model is `S_g`, with a fixed orientation-preserving diffeomorphism `S_g ≃ Σ` (Layer 0.1).
- A **marking** `m : Σ → X` is an orientation-preserving diffeomorphism onto a Riemann surface. Marked Riemann surfaces `(X, m)` and `(Y, n)` are equivalent when a biholomorphism `f : X ≃ Y` makes `f ∘ m` smoothly isotopic to `n`; the isotopy is part of the relation.
- A **topological surface** is a type with `[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]`, compact when also `T2Space` and `CompactSpace`, with boundary `(𝓡∂ 2).boundary M`; a smooth surface adds `[IsManifold (𝓡∂ 2) ∞ M]`, and a closed surface charted on `𝓡 2` is read as one with empty boundary. A **PL structure** is a triangulation by a finite combinatorial surface (`PLStructure`, Layer 0.0b); distances on a realization are taken in the sup norm of barycentric coordinates.
- `Diff(M)` is Tau Ceti's `TauCeti.Diff (𝓡 2) M ∞` with the weak Whitney topology `Diffeomorph.weakWhitneyTopology`; `Diff₀(M)` is its identity path component; `Diff⁺(M)` the orientation-preserving subgroup; `Diff₀⁺ = Diff₀`. Two diffeomorphisms are **smoothly isotopic** when a `C^∞` diffeotopy (Tau Ceti's `TauCeti.Diffeotopy`) joins them; `Mod±(Σ) = π₀ Diff(Σ)` and `Mod⁺(Σ) = π₀ Diff⁺(Σ)` (Layer 3.1).
- The Laplacian is positive: `Δ⁺ = −div grad`. For `h = e^(2u) h₀` the curvature-`−1` equation is `Δ⁺_(h₀) u + K_(h₀) + e^(2u) = 0`, the convention of ComplexCurveModuli D0 item 4.
- `π₁ⁿᵃᵗ(Σ, x₀)` is Mathlib's `FundamentalGroup`, whose product is `p * q = q.trans p` (`FundamentalGroup.mul_def`). The **geometric group** is `Π := (π₁ⁿᵃᵗ(Σ, x₀))ᵐᵒᵖ`, so that `op(p) * op(q) = op(p.trans q)` follows first-traverse concatenation; `ι : Π ≃* π₁ⁿᵃᵗ`, `ι(op p) = p⁻¹`, is the inversion equivalence. Commutators are `[a, b] = a b a⁻¹ b⁻¹`.
- `PSL₂(ℝ)` acts on `ℍ` through FuchsianOrbifolds Layer 0 item 2's restriction of Mathlib's `UpperHalfPlane.glAction` along `PSL(2,ℝ) → PGL(2,ℝ)`; `PGL₂(ℝ) = GL (Fin 2) ℝ` modulo its centre acts by that same `glAction`, which conjugates when the determinant is negative. The boundary circle `∂ℍ` is oriented as the positive boundary of `ℍ`.
- The mapping class action on complex structures is `f ⋅ J = ε(f) · (f⁻¹)^* J` with `ε(f) = +1` for orientation-preserving `f` and `−1` otherwise; on marked surfaces `f ⋅ (X, m) = (X, m ∘ f⁻¹)` or `(X̄, m ∘ f⁻¹)` (Layer 3.2).
- Fenchel–Nielsen twists are arclength-valued in `ℝ`; the positive Dehn twist about the `i`-th cuff changes `t_i` by `−ℓ_i` (Layer 7.2).
- The Euler number `e(ρ)` of a representation `ρ : Π → PSL₂(ℝ)` is the Euler number of its flat oriented circle bundle with the boundary-circle fibre orientation; the uniformizing holonomy has `e(ρ) = 2 − 2g` (Layer 4.4).
- An **arithmetic Fuchsian group** is a lattice of `PSL₂(ℝ)` commensurable, up to conjugacy, with the image of the norm-one unit group of an order in a quaternion algebra over a totally real field split at exactly one real place (Layer 9.1).
- Universes and coefficients: all surfaces are types in one universe; cohomology is with `ℤ` coefficients unless written otherwise; Sobolev exponents are `p > 2` and integer `k ≥ 1` as in ComplexCurveModuli D3 item 5.

## Exact supplier contracts

### From Mathlib

`FundamentalGroup`, `FundamentalGroup.mul_def`, `FundamentalGroup.mapOfEq` (the homomorphism induced by a continuous map with `f x = y`); `Diffeomorph` and `Diffeomorph.toHomeomorph`; `ContinuousMap.Homotopic`, `ContinuousMap.HomotopicRel` and `ContinuousMap.HomotopyRel`; `OpenPartialHomeomorph`; `EuclideanHalfSpace`, the model `𝓡∂ 2` and `ModelWithCorners.boundary`; `IsManifold`; `AbstractSimplicialComplex` and `PreAbstractSimplicialComplex`; `finsum`; `IsCoveringMap` and `IsCoveringMap.liftHomotopy`; `ZerothHomotopy`; `Joined`, `PathConnectedSpace`, `ContractibleSpace`; `UpperHalfPlane`, `UpperHalfPlane.glAction` (`GL (Fin 2) ℝ` acting on `ℍ`, by complex conjugation composed with the Möbius map when the determinant is not positive), the hyperbolic metric on `ℍ` and `IsometryEquiv` with its group structure, and the instance `IsIsometricSMul SL(2, ℝ) ℍ` (`SL(2, ℝ)` acts on `ℍ` by isometries of the hyperbolic distance); `GL (Fin 2) ℝ`, `Subgroup.center`, `QuotientGroup.mk`; `QuaternionAlgebra`, `NumberField`, `NumberField.InfinitePlace`, `NumberField.IsTotallyReal`; `MeasureTheory` and Sobolev spaces as consumed through ComplexCurveModuli D3 and PDE Lane A; smooth partitions of unity (`SmoothPartitionOfUnity`); `ContMDiff`, `mfderiv`; `Complex.exp`, `Relation.EqvGen.setoid` and quotient topologies, `ConnectedComponents`, `ModelWithCorners.interior`, `IsLocalHomeomorphOn`, `IsCoveringMap.existsUnique_continuousMap_lifts`, `QuotientGroup.map`, `AddCircle`, `Matrix.GeneralLinearGroup`, `ZMod`. What is assumed: these declarations exist at the pin with the stated meaning; `glAction` conjugates exactly when the determinant is negative.

### From Tau Ceti

`TauCeti.IsClosedConnectedSurface` (compact, connected, Hausdorff, second countable, boundaryless surface), `TauCeti.Orientable`; `TauCeti.Diff I M n` (the group of `C^n` self-diffeomorphisms) with the forgetful homomorphism `Diffeomorph.toHomeomorphHom`, `Diffeomorph.weakWhitneyTopology` (scoped `TauCeti.DiffeomorphWeakWhitney`, for compact `M`), `Diffeomorph.continuousMul`, `Diffeomorph.isTopologicalGroup`, `Diffeomorph.ofSmoothFamily` and `ContMDiff.continuous_diffeomorphWeakWhitney` (a smooth family of diffeomorphisms is a continuous map into `Diff`), `Diffeomorph.continuous_eval_const`; `TauCeti.Diffeotopy J n M` (a level-preserving `C^n` diffeomorphism of `I × M` that is the identity at time zero), `TauCeti.Diffeotopy.final`, `TauCeti.Diffeotopy.joined_one_final` (a diffeotopy joins `1` to its final slice in `Diff`), `TauCeti.Diffeotopy.trans` and `symm`; `TauCeti.RelativeDiff`, `TauCeti.DiscDiff n` (`Diff(Dⁿ, ∂)` of the closed unit ball with the weak Whitney topology); `TauCeti.orthogonalToDiffSphere n m : O(n+1) →* Diff(Sⁿ)` with `continuous_orthogonalToDiffSphere`, and `TauCeti.continuousOrthogonalToDiffSphere n m`, the same inclusion as a continuous map; `TauCeti.UniversalCover x₀`, `proj`, `TauCeti.UniversalCover.deckFundamentalGroupEquiv x₀ : deck proj ≃* (FundamentalGroup X x₀)ᵐᵒᵖ`, `deckFundamentalGroupEquiv_symm_op` (its inverse sends `op g` to `loopDeck x₀ g⁻¹`), `TauCeti.UniversalCover.loopDeck`, `deckSubgroupQuotientProjEquivOfNormal` (deck group of the cover attached to a normal subgroup); `UpperHalfSpace E` (the upper half-space of `E × ℝ` over a normed space `E`; the hyperbolic plane is `UpperHalfSpace ℝ`) with its Riemannian distance and `UpperHalfSpace.isPretransitive_isom`; `TauCeti.Isotopy` and `TauCeti.Isotopic` (homotopies through embeddings), `TauCeti.AmbientIsotopy`, `Homeomorph.alexanderIsotopyClosedBall` (Alexander's trick on the closed ball); `TauCeti.IsJordanCurve`, `TauCeti.filledHull` and the Schoenflies theorem `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`; invariance of domain `IsOpen.image_of_continuousOn_of_injOn` and `Homeomorph.coe_apply_mem_interior_iff`; `TauCeti.IsPLOn`; `AbstractSimplicialComplex.Realization`, `PreAbstractSimplicialComplex.IsCombinatorialManifold` with `PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold`, `PreAbstractSimplicialComplex.PLHomeomorphic`, `TauCeti.IsTriangulable`, `TauCeti.IsCombinatoriallyTriangulable`; `TauCeti.IsSmoothTriangulation` (Whitehead's smooth triangulations) with `TauCeti.IsSmoothTriangulation.trans_diffeomorph` and `TauCeti.IsSmoothTriangulation.barycentricSubdivisionRealizationHomeomorph_trans`; `TauCeti.Manifold.Orientation` and `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`. What is assumed: the diffeotopy, topology, simplicial and smooth-triangulation declarations have the signatures displayed in their files at the pin; `TauCeti.IsSmoothTriangulation` asks a smooth immersion on every closed simplex; nothing is assumed about path-connectedness of any `Diff`.

### From TauCetiRoadmap.ComplexCurveModuli

D0 item 1 (smooth normal forms and the orientation-preserving diffeomorphisms of compact connected oriented surfaces onto them, labelled and collared discs, supported disc isotopies, cut-system comparison), item 2 (operator/divisor Riemann–Roch comparison, `deg TΣ = 2 − 2g`), item 4 (closed-surface uniformization with existence, uniqueness, regularity and parameter estimates for the conformal curvature-`−1` metric), item 5 (properness of the diffeomorphism action; finite automorphism groups); D3 item 3 (`dim Def¹ = 3g − 3 + n + dim A_C`, obstruction vanishing), item 4 (Kodaira–Spencer map), item 5 (full Sobolev chart `J^(k,p)(Σ)`, the arbitrary-complement smooth-offset inverse function theorem and local uniqueness), item 6 (the integrability dictionary `J = [[i,0],[α,j]]` on holomorphic total families); D4 item 1 (marked holomorphic unfoldings and their universal property), item 4 (openness of universality, uniqueness of the comparison with a specified central isomorphism); D6 item 2 (geodesic cuts, collar coordinates and the collar-width formula). What is assumed: D3 item 5's slice is smooth, not declared holomorphic; D4 item 4's comparison is unique once the central isomorphism is fixed.

### From TauCetiRoadmap.ComplexKahlerGeometry

K1 (smooth Newlander–Nirenberg: `N_J = 0` iff `J` is induced by a compatible complex atlas), K4 (holomorphic tangent and cotangent bundles `T_X`, `K_X`, their tensor powers), K5b (compact Dolbeault Hodge theory, elliptic regularity, Serre duality `H¹(X, T_X)^* ≃ H⁰(X, K_X^⊗2)`).

### From TauCetiRoadmap.DifferentialGeometry

Layer 0 (forms), Layer 2 (orientations), Layer 3.5 (`exists_timeDependentFlow`: the flow of a time-dependent complete vector field), Layer 5 (integration), Layer 12 (Riemannian metrics, `Δ = −div grad`).

### From TauCetiRoadmap.GeometricTopology

Layer 1 (collars, tubular neighbourhoods, the disc theorem that any two orientation-compatible ball embeddings into a connected manifold are ambient isotopic), Layer 3 (the topological group `Diff(M)` with the `C^∞` topology on a compact manifold and the smooth-families map, realized at the pin by Tau Ceti's declarations above), the smoothing-and-triangulation comparison, item 1 (Whitehead: every smooth manifold, with or without boundary, has a smooth triangulation, and any two have linearly isomorphic subdivisions; Munkres, Theorems 10.5 and 10.6). What is assumed: item 1's smooth triangulations are Tau Ceti's `TauCeti.IsSmoothTriangulation`.

### From TauCetiRoadmap.AlgebraicTopology

Stage 1 item 4 (based van Kampen for two open sets), item 5 (the fundamental group of a wedge of circles is free on the circles), Stage 6 (the oriented intersection pairing and its cap-product convention), Stage 7 (homotopy-invariant Euler characteristic).

### From TauCetiRoadmap.CharacteristicClasses

C2 item 2 (Euler class naturality, orientation reversal, the section obstruction and its sign local system), C2 item 3 (`e(TM)[M] = χ(M)` for a closed oriented manifold).

### From TauCetiRoadmap.RiemannianGeometry

R4 item 7 (hyperbolic models `(|dx|² + dy²)/y²` on `UpperHalfSpace E`, the isometry group `O⁺(n,1)`, Killing–Hopf, the quotient atlas, descended metric and covering for a free properly discontinuous group of isometries, continuation of local isometries).

### From TauCetiRoadmap.FuchsianOrbifolds

Layer 0 item 2 (`PSL(2,ℝ) → PGL(2,ℝ)` and the restricted projective action), item 3 (discrete subgroups act properly discontinuously); Layer 1 items 1–3 (elliptic quotient charts, the coarse quotient Riemann surface); Layer 4 item 5 (orbifold signature, Euler characteristic and area formula `Area = 2π(2h − 2 + Σᵢ(1 − 1/mᵢ))` for a cocompact group of signature `(h; m₁, …, m_r)`); Layer 5 items 3 and 6 (branched-cover Euler characteristic and the Fuchsian Riemann–Hurwitz formula).

### From TauCetiRoadmap.PDE

Lane B item 8 (maximal function), item 9 (Marcinkiewicz and Riesz–Thorin interpolation), item 10 (Calderón–Zygmund `Lᵖ` bounds and the Mihlin–Hörmander multiplier theorem).

### From TauCetiRoadmap.ModularForms

Layer 10B (iii)–(v): Riemann–Roch `χ(𝒪_D) = deg D + 1 − g`, Serre duality by residues, `analyticGenus_eq_topologicalGenus`; consumed only through ComplexCurveModuli D0 item 2's comparison, never directly.

## How to read the build

Layer 0 builds the triangulation, PL and smoothing theory of compact surfaces, their classification, branched covers and mapping class groups, and fixes the surface, its diffeomorphism group, isotopies and markings. Layer 1 builds the complex-structure carrier and the marked quotient `Teich(Σ)`. Layer 2 gives it the complex atlas and the dimension. Layer 3 defines the mapping class groups and their action. Layer 4 identifies `Isom(ℍ)` with `PGL₂(ℝ)` and builds the surface group, the Euler number and the uniformizing holonomy. Layer 5 proves the smooth Dehn–Nielsen–Baer theorem, with Smale's theorems, the smoothing of isotopies and the kernel theorem, and identifies stabilizers. Layer 6 proves the converse comparison from representations to marked surfaces. Layer 7 builds Fenchel–Nielsen coordinates, quasiconformal theory and the Teichmüller metric. Layer 8 proves Nielsen realization and the fixed-locus dimension formula and gives the first open dense locus. Layer 9 defines arithmetic lattices and proves fixed-signature finiteness, the second locus. Layer 10 proves the minimum-area bound and the open dense locus of maximal groups. Layer 11 intersects the three loci. Every `*Needs:*` line lists what a target's statement and route use, item by item; a target proved another way is blocked only by what its statement needs.

## Layer 0: Surface, diffeomorphism and marking carriers

### 0.0a Piecewise-linear approximation of planar and surface homeomorphisms

The plane is `EuclideanSpace ℝ (Fin 2)`, the model of `𝓡 2`; the closed half-plane `{x | 0 ≤ x 0}`, with its boundary line `{x | x 0 = 0}`, is the model `EuclideanHalfSpace 2` of `𝓡∂ 2`. A map of the plane is piecewise linear on a set when it is Tau Ceti's `TauCeti.IsPLOn` there. For finite complexes `K` and `L`, a map `|K| → |L|` of their realizations (`AbstractSimplicialComplex.Realization`) is piecewise linear when in barycentric coordinates it is the restriction of a map that is `TauCeti.IsPLOn` on the coordinate image of `|K|`, the criterion by which Tau Ceti's `PreAbstractSimplicialComplex.PLHomeomorphic` compares complexes; a PL homeomorphism is a homeomorphism that is piecewise linear in both directions. Distances on a realization are measured in the sup norm of barycentric coordinates. An error function `φ` on an open set `U` is admissible when every point of `U` has a neighbourhood in `U` on which `φ` is bounded below by a positive constant; continuity is not asked.

Prove the PL approximation theorem in four forms. **Open form**, `exists_pl_approximation_open`: a homeomorphism `f` between open subsets of the plane, given as an `OpenPartialHomeomorph`, and an admissible error `φ` on its source admit a homeomorphism `g` with the same source and target, piecewise linear in both directions, with `dist (f x) (g x) < φ x` on the source. **Half-plane form**, `exists_pl_approximation_halfPlane`: if `f` carries the half-plane part of its source onto that of its target and the boundary-line part onto the boundary-line part, `g` can be chosen with the same two properties. **Local relative form**: if `f` is already piecewise linear on a closed, locally finite polyhedral subset of its source (a locally finite union of points, segments and convex polygons), `g` can be chosen equal to `f` there, in the open and in the half-plane form. **Compact relative form**: for finite combinatorial surfaces `K` and `L` (Tau Ceti's `PreAbstractSimplicialComplex.IsCombinatorialManifold` in dimension two), a homeomorphism `f : |K| → |L|`, a subcomplex `A` of `K` on which `f` is piecewise linear, and `ε > 0`, there is a PL homeomorphism `g` within `ε` of `f` and equal to `f` on `|A|`; the empty subcomplex gives the absolute compact form.

Route (Moise, §6). First the **polygonal Schoenflies theorem in PL form**: a simple closed polygon in the plane bounds, by Tau Ceti's Jordan curve theorem (`TauCeti.IsJordanCurve`, `TauCeti.filledHull`), a compact region that is triangulated by diagonals with vertices among those of the polygon (induction on the number of vertices: a simple polygon with at least four vertices has a diagonal inside it), and a PL homeomorphism between two simple polygons extends to a PL homeomorphism of these closed regions, by coning from an interior vertex after subdividing both. Second, **general position**: finitely many polygonal arcs can be moved by arbitrarily small amounts, keeping their endpoints, so that they meet only at prescribed endpoints. For the open form, triangulate the source by a locally finite triangulation so fine that the image of every closed vertex star has diameter less than a third of the local lower bound of `φ`; move the images of the vertices slightly, replace the image of each edge by a polygonal arc between the new vertex images within the error and in general position, so that the image of each triangle boundary is a simple polygon, and fill each triangle by the polygonal Schoenflies theorem. The filled triangles tile the target, so the map is a homeomorphism onto it with PL inverse. For the local relative form, put the given polyhedral set in the 1-skeleton and leave it in place. For the half-plane form, extend `f` across the boundary line by reflection, approximate it on the line first by a PL homeomorphism of the line within the error, approximate the two closed sides relative to that common approximation, glue, and restrict to the half-plane. For the compact relative form, cover `|L|` by the open stars of its vertices, which are PL homeomorphic to open subsets of the plane or of the half-plane (the vertex charts behind Tau Ceti's `PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold`), and apply the local forms star by star with errors tending to zero at the frontier of each star, keeping in place what `|A|` and the earlier stars already made piecewise linear.

**Checks.**

- The constant `φ = ε`, the function `1 / (1 + ‖x‖)` on the whole plane, which has no positive global lower bound, and a discontinuous function taking only the values `1` and `2` are admissible.
- The function equal to `1/q` at points whose first coordinate is a reduced fraction `p/q` and to `1` elsewhere is positive but not admissible: an approximation within it would agree with `f` at every point with rational first coordinate, hence everywhere, so the homeomorphism `(x, y) ↦ (x³, y)`, which is not piecewise linear, would have no approximation. The hypothesis excludes it.
- The homeomorphism `x ↦ ‖x‖ x` of the plane is not piecewise linear near the origin and is approximated within every constant `ε > 0`, so the open form is not discharged by `g = f`.
- The homeomorphism `(x₀, x₁) ↦ (x₀, x₁ + x₀²)` preserves the half-plane and fixes its boundary line pointwise; the half-plane form keeps the line in place, which the open form applied to the reflected map does not guarantee.
- In the compact relative form, `A = K` with `f` piecewise linear allows `g = f`, and a boundary subcomplex on which `f` is piecewise linear stays fixed.

*Needs:* Tau Ceti `TauCeti.IsPLOn`; Tau Ceti `TauCeti.IsJordanCurve`; Tau Ceti `TauCeti.filledHull`; Tau Ceti `AbstractSimplicialComplex.Realization`; Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold`; Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold`; Tau Ceti `PreAbstractSimplicialComplex.PLHomeomorphic`; Mathlib `OpenPartialHomeomorph`.

### 0.0b Invariance of the boundary, PL structures, Radó's theorem and the Hauptvermutung

A topological surface is a type with `[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]`; a compact surface is in addition `T2Space` and `CompactSpace`; its boundary is `(𝓡∂ 2).boundary M`. Prove **invariance of the boundary**, `image_boundary`: a homeomorphism of surfaces carries the boundary onto the boundary; in particular whether a point is a boundary point does not depend on the chart that tests it, which for topological charts is not formal. Route: a point of the boundary line has no neighbourhood in the half-plane homeomorphic to an open subset of the plane, because by Tau Ceti's invariance of domain (`IsOpen.image_of_continuousOn_of_injOn`, `Homeomorph.coe_apply_mem_interior_iff`) such a homeomorphism would put the point in the interior of its neighbourhood, while it lies on the frontier of the half-plane.

Define a **PL structure** on a space `M`, `PLStructure`: a finite vertex type, an abstract simplicial complex on it that is a combinatorial surface (Tau Ceti's `PreAbstractSimplicialComplex.IsCombinatorialManifold` in dimension two: every vertex link is a combinatorial circle or arc), and a homeomorphism from its realization onto `M`; transport PL structures along homeomorphisms by `PLStructure.map`. The homeomorphism is data: precomposing it with a self-homeomorphism of the realization that is not piecewise linear gives a second PL structure on the same complex whose comparison with the first is not piecewise linear. Prove that the realization of a finite combinatorial surface is a compact surface whose boundary is the union of the edges lying in exactly one triangle, the boundary subcomplex, from Tau Ceti's `PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold` and invariance of the boundary.

Prove **Radó's theorem**, `PLStructure.nonempty_of_compactSurface`: every compact surface, with or without boundary, has a PL structure whose boundary subcomplex realizes `(𝓡∂ 2).boundary M`; its weak form is `isTriangulable_of_compactSurface`, Tau Ceti's `TauCeti.IsTriangulable`, and its combinatorial form is `TauCeti.IsCombinatoriallyTriangulable M 2`. Route (Moise, Theorems 8.2 and 8.3): every open subset of the plane has a locally finite triangulation; cover `M` by finitely many chart discs and half-discs and triangulate a growing compact region chart by chart. On the overlap of the triangulated region with the next chart, the local form of §0.0a, with an error tending to zero at the frontier of the overlap, replaces the coordinate change by a PL homeomorphism; the frontier of the next chart inside the region is replaced by a polygon, and the union is triangulated. Boundary charts use the half-plane form, so the boundary is a subcomplex at every stage. No Schoenflies theorem beyond the polygonal one of §0.0a enters.

Prove the **two-dimensional Hauptvermutung**: the complexes of two PL structures on homeomorphic spaces have isomorphic linear subdivisions, and in particular are PL homeomorphic, `PLStructure.plHomeomorphic`. Route (Moise, Theorem 8.5): the compact form of §0.0a approximates the comparison homeomorphism by a PL homeomorphism, which is simplicial after subdividing source and target. Prove **isotopy to a PL homeomorphism**: for PL structures `s` on `M` and `t` on `N`, every homeomorphism `f : M → N` is isotopic (Tau Ceti's `TauCeti.Isotopic`), by an isotopy moving points less than any given `ε`, to a homeomorphism `g` with `t.e⁻¹ ∘ g ∘ s.e` piecewise linear, relative to any subcomplex on which `t.e⁻¹ ∘ f ∘ s.e` is already piecewise linear; for `M = N` and `f` the identity this compares two PL structures on one space by a PL homeomorphism isotopic to their comparison map. Route: straighten `f` on the 1-skeleton of `s` first, edge by edge relative to the edges already treated, by small ambient isotopies supported near each image arc, which lies in a chart disc and is tame there by the Schoenflies theorem (Tau Ceti's `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, applied to a Jordan curve through the arc); the compact relative form of §0.0a then gives a PL homeomorphism `g` equal to `f` on the 1-skeleton; `f` and `g` carry each closed triangle onto the same disc, the one bounded by the common image of its boundary, and Alexander's trick on these discs (Tau Ceti's `Homeomorph.alexanderIsotopyClosedBall`) is an isotopy from `f` to `g` fixing the 1-skeleton.

**Checks.**

- The boundaries of the tetrahedron and of the octahedron triangulate the sphere with `4` and `6` vertices, so the complexes are not isomorphic. Projected radially to the round sphere, their edges become great-circle arcs, whose common refinement pulls back to straight cells in each flat face; triangulating that refinement gives isomorphic linear subdivisions of the two complexes, as the Hauptvermutung asserts.
- A triangulation is produced for the sphere given only by its two stereographic charts, with no combinatorial data supplied.
- The closed unit disc has the unit circle as its boundary and the sphere has empty boundary, so by `image_boundary` they are not homeomorphic; Euler characteristic is not needed for this.
- Both theorems are specific to low dimension: homeomorphic polyhedra need not be PL homeomorphic (Milnor's counterexample in dimension six) and topological manifolds of dimension at least five need not be combinatorially triangulable (the Kirby–Siebenmann obstruction), so the proofs use the plane.

*Needs:* §0.0a; Tau Ceti `IsOpen.image_of_continuousOn_of_injOn`; Tau Ceti `Homeomorph.coe_apply_mem_interior_iff`; Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold`; Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold`; Tau Ceti `PreAbstractSimplicialComplex.PLHomeomorphic`; Tau Ceti `TauCeti.IsTriangulable`; Tau Ceti `TauCeti.IsCombinatoriallyTriangulable`; Tau Ceti `TauCeti.Isotopic`; Tau Ceti `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`; Tau Ceti `Homeomorph.alexanderIsotopyClosedBall`; Mathlib `ModelWithCorners.boundary`.

### 0.0c The Euler characteristic and orientations

Define the Euler characteristic of an abstract simplicial complex, `simplicialEulerChar`, as the `finsum` over its faces of `(−1)^k` for a face with `k + 1` vertices; it is `0` for a complex with infinitely many faces, and on a finite combinatorial surface it is `V − E + F`. Prove its invariance under simplicial isomorphism and under linear subdivision of complexes of dimension at most two: a subdivision decomposes each open `k`-simplex into open simplices whose signed count is `(−1)^k`, by the Euler formula `V − E + F = 1` for a triangulated triangle (remove one boundary triangle at a time; a triangulated disc in the plane always has a triangle whose removal leaves a disc) and `V − E = 1` for a subdivided segment. Define the Euler characteristic of a compact surface, `Surface.eulerChar`, through a PL structure chosen by Radó's theorem (§0.0b), with the value `0` for a space that has none; prove that every PL structure computes it, `Surface.eulerChar_eq`, by the Hauptvermutung and the two invariances, hence its invariance under homeomorphisms, `Surface.eulerChar_congr`. Compute `Surface.eulerChar_sphere`, the value `1` for the closed disc, `0` for the annulus, the Möbius band and the torus.

Define a **coherent orientation** of a finite combinatorial surface: a cyclic order of the vertices of each triangle such that the two triangles on an interior edge induce opposite directions on it; the complex is orientable when one exists. Prove that simplicial isomorphisms and linear subdivisions induce bijections of coherent orientations. Construct the **orientation double cover**: the finite complex whose triangles are the oriented triangles, two of them glued along an edge exactly when they induce opposite directions on it. Prove that it is a combinatorial surface, that the projection is a two-sheeted covering map (Mathlib's `IsCoveringMap`) with evenly covered disc and half-disc neighbourhoods, also at boundary vertices, that reversing the orientation of every triangle is a fixed-point-free deck involution whose orbits are the fibres, that the boundary of the cover is the inverse image of the boundary, and that over a connected surface the cover has two components, the two coherent orientations, when the surface is orientable, and is connected otherwise. Define the **orientations of a compact surface** `M` as the coherently oriented PL structures on `M` modulo the relation in which a PL homeomorphism isotopic to the comparison map (§0.0b) carries one orientation to the other; transport them along homeomorphisms; and prove that **isotopic homeomorphisms act equally on orientations**: lift the isotopy, followed by the projection, through the orientation double cover of the target by Mathlib's `IsCoveringMap.liftHomotopy`, starting from the lift that the orientation determines at time zero. Hence the relation does not depend on the PL homeomorphism chosen, and a connected orientable compact surface has exactly two orientations. Orient each boundary circle so that the surface lies on its left; the boundary of the closed unit disc runs counterclockwise.

**Checks.**

- The boundary of the tetrahedron gives `4 − 6 + 4 = 2` and its barycentric subdivision `14 − 36 + 24 = 2`: the face counts change and the alternating sum does not.
- The full tetrahedron, of dimension three, gives `4 − 6 + 4 − 1 = 1`; a sum stopping at triangles would give `2`, so the definition counts faces of every dimension.
- The seven-vertex torus gives `7 − 21 + 14 = 0`; a triangulated disc gives `1`, a triangulated annulus and a triangulated Möbius band `0`.
- The orientation double cover of a triangulated disc is two disjoint discs and that of a triangulated sphere two disjoint spheres; that of a triangulated Möbius band is a connected annulus with two points over each point, so the cover is not a trivial product.
- Complex conjugation of the closed disc reverses its orientation and the direction of its boundary circle, so it is not isotopic to the identity.

*Needs:* §0.0b; Mathlib `finsum`; Mathlib `IsCoveringMap`; Mathlib `IsCoveringMap.liftHomotopy`.

### 0.0d Epstein's theorems on curves, arcs and homeomorphisms

Work on a finite combinatorial surface, with piecewise-linear embeddings of the circle and of the interval; closed curves lie in the interior, homotopy is free unless a relative condition is stated, and every conclusion is an ambient isotopy (Tau Ceti's `TauCeti.AmbientIsotopy`) whose slices are PL homeomorphisms. Prove the four **curve and arc isotopy theorems**:

- **two-sided curves**: homotopic PL embeddings of the circle whose first image is two-sided and bounds no disc are ambient isotopic by an isotopy fixed outside a compact subset of the interior, hence fixing the boundary (Epstein, Theorem 2.1);
- **one-sided curves**: homotopic PL embeddings of the circle whose first image is one-sided are ambient isotopic by an isotopy supported in a compact subset of the interior, through a Möbius-band regular neighbourhood and the orientation double cover of §0.0c (Epstein, Theorems 3.3 and 3.4);
- **proper arcs**: two PL arcs with the same ordered endpoints on the boundary, meeting it only there and homotopic with both endpoints fixed, are ambient isotopic by an isotopy fixing the whole boundary (Epstein, Theorem 3.1);
- **disc-bounding curves**: in an oriented closed disc neighbourhood, two PL curves bounding discs in its interior and inducing the same boundary orientation are ambient isotopic by an isotopy supported in it and fixed on its boundary.

Then prove **Epstein's theorem** for homeomorphisms in its two forms: `isotopic_of_homotopic_closedSurface`, homotopic homeomorphisms between closed surfaces are isotopic (Epstein, Theorem 6.4), and `isotopicRel_of_homotopicRel`, homeomorphisms between compact surfaces that are homotopic relative to the boundary are isotopic relative to the boundary (Epstein, Theorem 6.3). Prove its PL form, **PL isotopy**: two isotopic PL homeomorphisms are PL isotopic, that is, joined by a level-preserving PL homeomorphism of `[0, 1] × |K|` for the product triangulation.

Route. First the finite homotopy lemmas, by simplicial approximation relative to the prescribed PL data, by lifting to the universal cover (Tau Ceti's `TauCeti.UniversalCover`) and by the polygonal Schoenflies theorem of §0.0a: a null-homotopic simple PL loop in the interior bounds an embedded PL disc (Epstein, Theorem 1.7); two disjoint homotopic two-sided loops bounding no disc cobound an embedded PL annulus (Epstein, Lemma 2.4); two homotopic curves, or two proper arcs homotopic with fixed endpoints, in general position and meeting away from their endpoints have an innermost bigon, and the isotopy across it lowers the number of intersection points (Epstein, Lemmas 2.5 and 3.2). The curve and arc theorems follow: put the two curves in general position, remove bigons until they are disjoint, and move one onto the other across the annulus, Möbius band or disc that they cobound, by coning on discs. For homeomorphisms `f` and `g` that are homotopic, replace both by PL homeomorphisms in their isotopy classes (§0.0b); cut the surface along a finite system of curves and proper arcs read off the triangulation; move `g⁻¹ ∘ f` successively by the curve and arc theorems, with relative homotopies at each step, until it fixes the system and carries each complementary disc to itself; and finish with Alexander's trick on the discs (Tau Ceti's `Homeomorph.alexanderIsotopyClosedBall`), the annulus and Möbius-band pieces being base cases treated directly. The relative statement carries homotopies relative to the boundary throughout. The hypotheses of the curve theorems are internal to the proof and do not restrict the statements for homeomorphisms. PL isotopy is the same argument in the PL category, with coning in place of Alexander's trick.

**Checks.**

- Two parallel core circles of an annulus test the two-sided theorem, a core circle of a Möbius band and a small PL perturbation of it the one-sided theorem, and two proper arcs in a disc with the same ordered endpoints the arc theorem.
- Two proper arcs crossing an annulus whose difference winds once around it are not homotopic with fixed endpoints, and they are not ambient isotopic fixing the boundary; the relative hypothesis is used.
- The clockwise and counterclockwise parametrizations of the unit circle in the plane are homotopic but not isotopic through embeddings: they bound a disc, which the two-sided theorem excludes, and they induce opposite boundary orientations, which the disc theorem excludes (Epstein, remark following Theorem 2.1).
- On the closed disc the identity and complex conjugation are homotopic through continuous maps but not isotopic through homeomorphisms, having opposite local orientations (§0.0c); they are not homotopic relative to the boundary, and the closed theorem does not apply to the disc.
- A Dehn twist of the annulus is homotopic to the identity, but not relative to the boundary, and it is not isotopic to the identity relative to the boundary.

*Needs:* §0.0a; §0.0b; §0.0c; Tau Ceti `TauCeti.Isotopic`; Tau Ceti `TauCeti.AmbientIsotopy`; Tau Ceti `Homeomorph.alexanderIsotopyClosedBall`; Tau Ceti `TauCeti.UniversalCover`; Mathlib `ContinuousMap.HomotopicRel`; Mathlib `ContinuousMap.HomotopyRel`; Mathlib `FundamentalGroup`.

### 0.0e Compatible smoothings and isotopy to diffeomorphisms

A smooth surface is a compact surface with `[IsManifold (𝓡∂ 2) ∞ M]`. A homeomorphism from the realization of a complex onto `M` is a **smooth triangulation** when it is a smooth immersion on every closed simplex, Tau Ceti's `TauCeti.IsSmoothTriangulation` (Whitehead's condition; Munkres, Definition 8.3). Define the **compatibility** of a PL structure `s` with the smooth structure of `M`, `PLStructure.IsCompatible`: some smooth triangulation `g` of `M` differs from `s` by a PL homeomorphism, `s.e⁻¹ ∘ g` being piecewise linear in barycentric coordinates. Prove that this holds exactly when some linear subdivision of the complex of `s`, followed by `s.e`, is a smooth triangulation (a linear subdivision of a smooth triangulation is one, as Tau Ceti's `TauCeti.IsSmoothTriangulation.barycentricSubdivisionRealizationHomeomorph_trans` proves for the barycentric subdivision), and that compatibility is carried along diffeomorphisms, `PLStructure.IsCompatible.map_diffeomorph`, from Tau Ceti's `TauCeti.IsSmoothTriangulation.trans_diffeomorph`.

Prove the **existence of compatible smoothings**, `PLStructure.exists_smoothing`: every PL structure is compatible with some smooth structure on its space. Route (Whitehead's smoothing, which in dimension two meets no obstruction): give each closed triangle its affine structure; across each edge, away from its endpoints, glue the two triangles into a smooth strip by interpolating between their transverse derivatives with a cutoff, which keeps the two affine maps, agreeing on the edge and of the same orientation, immersive; around each interior vertex, an orientation-preserving diffeomorphism from the smooth circle bounding a small star neighbourhood onto the round circle is isotopic to a rotation, so its cone, reparametrized radially near the vertex to agree with that rotation, is a chart there, and around a boundary vertex the same holds for a smooth arc and a half-circle, relative to the endpoints; transitions are diffeomorphisms by construction. After one barycentric subdivision of `s` every closed triangle is a smooth immersion for this atlas; the subdivision is what lets a boundary vertex lying in a single triangle open its corner to a straight angle. Prove the **uniqueness of compatible smoothings**: two smooth structures compatible with `s` are related by a diffeomorphism isotopic to the identity. Prove **isotopy to a diffeomorphism** for compatibly triangulated surfaces: if `M` and `N` carry PL structures compatible with their smooth structures, every homeomorphism `f : M → N` is isotopic to a diffeomorphism moving points less than any given `ε` from `f`; when `M = N` and `f` fixes the boundary pointwise, isotopic relative to the boundary to a diffeomorphism fixing it pointwise. Route for both: by §0.0b, `f` is isotopic, within `ε/2` and relative to the boundary when it fixes it, to a PL homeomorphism; read through compatible smooth triangulations, this is a homeomorphism that is smooth with injective differential on each closed triangle of a subdivision. Straighten its transverse derivative along each edge by a collar isotopy, so that it is smooth across the edges away from the vertices; around each vertex, its restriction to a small circle is a homeomorphism of circles that is a diffeomorphism on finitely many closed arcs, isotopic through such maps to a diffeomorphism of the circle by the straight-line isotopy of lifts to `ℝ`, and coning that isotopy smooths the map near the vertex. Each modification is supported in a small set and moves points by little, so the result is a diffeomorphism within `ε` of `f` and isotopic to it; near the boundary the modifications are made relative to a collar. Uniqueness of smoothings is the case of the identity map between two compatible structures. With Whitehead's theorem that every compact smooth surface has a smooth triangulation (GeometricTopology's smoothing-and-triangulation comparison, item 1), compatibility is automatic, which gives `exists_isotopic_diffeomorph` and `exists_isotopicRel_diffeomorph` for all compact smooth surfaces; on the closed orientable surfaces of this roadmap the compatible PL structure of Layer 0.1 serves without that theorem.

Prove the **orientation comparison**: for a PL structure compatible with the smooth structure, transporting the cyclic order of each oriented triangle by its smooth immersion is a bijection from the coherent orientations of §0.0c onto the smooth orientations of `M` (Tau Ceti's `TauCeti.Manifold.Orientation`); in particular a compatible smoothing of an orientable PL surface is `TauCeti.Orientable`, and a connected one has exactly two smooth orientations.

**Checks.**

- The radial projection of the boundary of the tetrahedron onto the round sphere is a smooth triangulation, each flat triangle projecting by a smooth immersion, so this PL structure is compatible with the round smooth structure.
- The closed disc triangulated as one triangle is not a smooth triangulation for any smooth structure: at each corner two boundary edges leave the vertex, a half-plane chart sends both into its boundary line, and the differential of the triangle there has rank at most one. Its barycentric subdivision is one for the smoothing above, so compatibility is asked up to a PL homeomorphism, equivalently of a subdivision, and not of the given complex.
- Compatibility is not the requirement that the smooth charts be piecewise linear: a map that is both smooth and piecewise linear is locally affine, and an affine atlas on the sphere would develop into a local diffeomorphism to `ℝ²` with open compact image.
- On the torus `ℝ²/ℤ²` the homeomorphism `(x, y) ↦ (x, y + u(x))`, with `u` continuous, periodic and nowhere differentiable, is isotopic to the identity through `(x, y) ↦ (x, y + t·u(x))`, and `exists_isotopic_diffeomorph` returns a diffeomorphism in its class, the identity being one.
- The statements are two-dimensional: uniqueness of smooth structures fails on closed manifolds in dimension seven (exotic spheres) and four.

*Needs:* §0.0a; §0.0b; §0.0c; Tau Ceti `TauCeti.IsSmoothTriangulation`; Tau Ceti `TauCeti.IsSmoothTriangulation.trans_diffeomorph`; Tau Ceti `TauCeti.IsSmoothTriangulation.barycentricSubdivisionRealizationHomeomorph_trans`; Tau Ceti `TauCeti.Manifold.Orientation`; Tau Ceti `TauCeti.Orientable`; Tau Ceti `TauCeti.Isotopic`; Mathlib `IsManifold`; Mathlib `Diffeomorph`; Mathlib `SmoothPartitionOfUnity`; GeometricTopology smoothing-and-triangulation comparison item 1.

### 0.0f Polygon schemas and the classification of compact surfaces

A **polygon schema** is a finite word of sides (`SchemaSide`), each an edge letter `i` with a flag saying whether it is read against the counterclockwise direction, or a free side. Its realization `schemaRealization w` is the closed unit disc of `ℂ`, its boundary circle cut into `m` equal arcs for a word of length `m`, the `j`-th arc parametrized counterclockwise by `schemaPoint m j t = exp(2πi(j + t)/m)` for `t ∈ [0, 1]`, modulo the equivalence relation generated by `schemaGluing w`: the point at parameter `t` of a side carrying the letter `i` is identified with the point of every other side carrying `i` at parameter `t` when the two flags agree and at parameter `1 − t` when they differ, so that the arrows of the letter match; free sides are not glued. The realization is compact as a quotient of the disc. The **standard surfaces** `StandardSurface` are `StandardSurface.orientable g b`, of genus `g` with `b` boundary circles, and `StandardSurface.nonorientable k b` with `k ≥ 1` crosscaps and `b` boundary circles. Their canonical word `StandardSurface.word` is `a a⁻¹` for the sphere `orientable 0 0`, and otherwise the `g` handle blocks `aᵢ bᵢ aᵢ⁻¹ bᵢ⁻¹`, respectively the `k` crosscap blocks `aᵢ aᵢ`, followed by the `b` hole blocks `cⱼ hⱼ cⱼ⁻¹` with `hⱼ` free (`StandardSurface.holeWord`); the model `StandardSurface.model` is the realization of the canonical word. Record the invariants of a standard surface: `StandardSurface.eulerChar`, equal to `2 − 2g − b` and `2 − k − b`; `StandardSurface.genus`, equal to `g` and `k`; `StandardSurface.boundaryCount`, equal to `b`; and the predicate `StandardSurface.IsOrientable` of the orientable family.

For a topological surface `M` define `Surface.boundaryComponentCount`, the number of connected components of `(𝓡∂ 2).boundary M`, and `Surface.IsOrientable`, the existence of a coherent orientation of some PL structure on `M` (§0.0c); by the orientation comparison of §0.0e this holds exactly when some smooth structure on `M` compatible with its topology is `TauCeti.Orientable`, the condition the Lean signature states. Both are invariant under homeomorphisms: the boundary count by `image_boundary` (§0.0b), orientability because homeomorphisms transport orientations (§0.0c).

Prove `StandardSurface.isSurface_model`: every model is a compact connected Hausdorff surface with `b` boundary circles, orientable exactly in the orientable family; and `StandardSurface.eulerChar_model`: `Surface.eulerChar S.model = S.eulerChar`. Route. The relation identifies finitely many boundary arcs of the disc by explicit homeomorphisms, so the quotient map is closed and the quotient Hausdorff. Charts: at the image of an interior point of the disc, the disc itself; at an interior point of a glued side, the two half-discs at its two copies glued along their diameters; at an interior point of a free side, a half-disc; at a vertex class, the corner sectors of its members glued cyclically into a disc, or in order into a half-disc when the class meets a free side. The cone triangulation of the polygon from the centre, after two barycentric subdivisions, is compatible with the gluing and has no simplex two of whose vertices are identified, so it descends to a PL structure on the model (§0.0b). Its alternating count equals that of the cell structure with one open disc, one open edge per class of sides and one vertex per vertex class, since subdividing a cell does not change the alternating count (§0.0c). The corners of the handle and crosscap blocks and the first corners of the hole blocks form one vertex class and each hole block adds one more, which gives `(1 + b) − (2g + 2b) + 1 = 2 − 2g − b` and `(1 + b) − (k + 2b) + 1 = 2 − k − b`, and `2 − 1 + 1 = 2` for `a a⁻¹`. The free sides `hⱼ` form the `b` boundary circles. On the orientable models the counterclockwise orientation of the disc is coherent, every gluing `x … x⁻¹` reversing the direction of the side; on a nonorientable model a strip across the two sides of a crosscap block `aᵢ aᵢ` is a Möbius band, whose orientation double cover is connected (§0.0c), so there is no coherent orientation.

Prove the **classification of compact surfaces**: `exists_standard_homeomorph`, every compact connected surface, with or without boundary, is homeomorphic to a standard model; `StandardSurface.homeomorph_unique`, homeomorphic models are equal; `classification_of_surfaces`, the unique-existence form; and `homeomorph_iff_invariants`, two compact connected surfaces are homeomorphic exactly when they have the same Euler characteristic, orientability and number of boundary components. Route for existence (Massey, Chapter 1, §§5–7 and 10). Radó's theorem (§0.0b) gives a PL structure whose boundary edges triangulate the boundary. Since `M` is connected and every vertex link is connected, the triangles can be listed so that each shares an edge with an earlier one; gluing them in that order along a spanning tree of the dual graph builds one polygon, a disc at each stage. Every interior edge outside the tree occurs twice on its boundary and every boundary edge once, so `M` is the realization of the boundary word, boundary edges read as free sides. The elementary moves change a word without changing its realization up to homeomorphism: rotating the word cyclically and renaming letters (a rotation of the disc), cancelling an adjacent pair `x x⁻¹` (a fold), and cutting the polygon along a chord and regluing the two pieces along a paired side (both realizations are quotients of the same two discs). Massey's reduction applies them to collect the free sides into hole blocks `c h c⁻¹`, to bring each pair `x … x` together into a crosscap block `x x`, to make each interlocked pair `x … y … x⁻¹ … y⁻¹` a handle block `x y x⁻¹ y⁻¹`, to reduce the corners outside the hole blocks to one vertex class, and to trade a handle next to a crosscap for two crosscaps (`x y x⁻¹ y⁻¹ z z` becomes `x x y y z z`); the end word is a canonical word. Route for uniqueness: the invariants of a model are `S.eulerChar`, `S.IsOrientable` and `S.boundaryCount` (`StandardSurface.isSurface_model`, `StandardSurface.eulerChar_model`), all homeomorphism invariants (`Surface.eulerChar_congr` and the invariance above); orientability decides the family, the boundary count gives `b`, and the Euler characteristic then gives `g = (2 − χ − b)/2` or `k = 2 − χ − b`. The complete invariant follows from existence and uniqueness. Define the **genus** `Surface.genus M` as the genus of the standard model homeomorphic to `M`, and `0` for a space homeomorphic to none; `Surface.genus_model` computes it on the models, and `Surface.eulerChar_eq_two_sub_two_mul_genus` gives `Surface.eulerChar M = 2 − 2·Surface.genus M` for a compact connected orientable surface with empty boundary, whose model is `orientable g 0` by the classification.

**Checks.**

- The sphere `orientable 0 0` is the two-gon `a a⁻¹` whose lower half-circle is glued to the upper one by complex conjugation: `2 − 1 + 1 = 2`. The disc `orientable 0 1` is `c h c⁻¹`, the arc `c` folded onto `c⁻¹` and `h` left free: `2 − 2 + 1 = 1`, with one boundary circle.
- The projective plane `nonorientable 1 0` is `a a`, antipodal points of the circle identified: `1 − 1 + 1 = 1`; the Klein bottle `nonorientable 2 0` has `χ = 0`.
- Each invariant is needed: the torus and the closed genus-two surface agree on orientability and boundary count, the torus and the Klein bottle on Euler characteristic and boundary count, and the torus and the annulus `orientable 0 2` on Euler characteristic and orientability.
- Dyck's theorem: the connected sum of a torus and a projective plane, the word `x y x⁻¹ y⁻¹ z z`, is `nonorientable 3 0`, with `χ = −1`; this is why the nonorientable family carries no handle parameter, and uniqueness would fail with one.
- A genus read from the Euler characteristic alone, `(2 − χ)/2`, would give the Klein bottle genus one like the torus and the disc genus one half; `Surface.genus` reads the family and the boundary count through the classification.

*Needs:* §0.0b; §0.0c; §0.0e; Tau Ceti `TauCeti.Orientable`; Mathlib `Complex.exp`; Mathlib `Relation.EqvGen.setoid`; Mathlib `ConnectedComponents`; Mathlib `ModelWithCorners.boundary`.

### 0.0g Branched covers and the topological Riemann–Hurwitz formula

Let `X` and `Y` be topological surfaces. A map `p : X → Y` has a **power model** of exponent `n ≥ 1` at `x`, `HasPowerMapModelAt p x n`, when there are topological charts `φ` at `x` and `ψ` at `p x`, onto the open unit disc of `ℂ`, with sources in the interiors and centred at `x` and `p x`, such that `p` carries the source of `φ` into that of `ψ` and `ψ ∘ p = φⁿ` there; no analytic compatibility is asked. A **branched cover** with a finite set `B` of marked interior values and exponent function `e`, `IsBranchedCover p B e`, is a continuous surjection with finite fibres that restricts to a covering map (Mathlib's `IsCoveringMap`) over the complement of `B`, satisfies `p⁻¹(∂Y) = ∂X` and is a local homeomorphism along `∂X` (Mathlib's `IsLocalHomeomorphOn`), and has a power model of exponent `e x` at every interior point, with `e = 1` off `p⁻¹(B)` and on the boundary.

Prove the basic theory. `IsBranchedCover.finite_preimage_branch`: `p⁻¹(B)` is finite, a finite union of finite fibres. `IsBranchedCover.local_degree_unique`: for Hausdorff surfaces the exponent function is determined by `p`, independently of the charts and of regular values added to `B`; `e x` is the number of sheets of the covering that `p` restricts to over a small punctured disc around `p x`, on the punctured neighbourhood of `x` that a power model provides, and for `z ↦ zⁿ` that covering is connected with `n` sheets. `IsBranchedCover.exists_degree`: over compact connected Hausdorff surfaces the weighted fibre count `Σ_{p x = y} e x` is a positive constant `d`, the **degree**. Route: `p` is closed, as a continuous map from a compact space to a Hausdorff one, so a small enough disc around `y` has its preimage inside disjoint power-model neighbourhoods of the points of the fibre, and each of them contributes `e x` points over every nearby value off `B`; the count is therefore locally constant, hence constant on the connected `Y`, and positive by surjectivity. Prove the **Riemann–Hurwitz formula** `riemannHurwitz`: `Surface.eulerChar X = d·Surface.eulerChar Y − Σ_{x ∈ p⁻¹(B)} (e x − 1)`. Route: by Radó's theorem and subdivision (§0.0b), `Y` has a PL structure with the points of `B` among its vertices and the boundary a subcomplex. Each closed simplex with its vertices in `B` removed is contractible, locally path connected and disjoint from `B`, so the covering restricted to it is trivial with `d` sheets, the fibre cardinality off `B` (Mathlib's `IsCoveringMap.existsUnique_continuousMap_lifts`); the closures of the sheets are the lifted closed simplices. At a preimage `x` of a point of `B` the power model shows the lifts closing up around `x` in `e x` sectors for each sector downstairs, and at a boundary vertex the local homeomorphism keeps the half-disc link. After one barycentric subdivision of the triangulation of `Y` the lifted simplices form a finite combinatorial surface triangulating `X`, with `d` times as many edges and triangles and `d·V − Σ(e x − 1)` vertices, and `Surface.eulerChar_eq` (§0.0c) gives the formula. Neither the classification nor homology enters.

**Checks.**

- The identity of a surface, with all exponents `1`, has degree one and no correction; assigning it exponent `2` at a marked interior point fails the power model, since the identity is injective near the point while `z ↦ z²` is not.
- `z ↦ zⁿ` on the Riemann sphere, `n ≥ 1`, has exponent `n` at `0` and `∞`: `2 = 2n − 2(n − 1)`. On the closed unit disc it has the single branch value `0` and is an unramified `n`-fold cover along the boundary circle: `1 = n − (n − 1)`.
- The orientation double cover of the projective plane (§0.0c) is unbranched of degree two: `2 = 2·1`. An unbranched cover of degree `k` of a closed genus-`g` surface has `χ = k(2 − 2g)`, hence genus `1 + k(g − 1)` when it is connected and orientable (§0.0f), as Layer 10.2 uses.
- At a branch value of `z ↦ zⁿ` the fibre has one point while the weighted count is `n`; a degree defined by raw fibre cardinality would not be constant.

*Needs:* §0.0b; §0.0c; Mathlib `IsCoveringMap`; Mathlib `IsCoveringMap.existsUnique_continuousMap_lifts`; Mathlib `IsLocalHomeomorphOn`; Mathlib `OpenPartialHomeomorph`; Mathlib `ModelWithCorners.interior`.

### 0.0h Mapping class groups of compact surfaces

For a topological space `M`, the homeomorphisms isotopic to the identity in Tau Ceti's sense (`TauCeti.Isotopic`, homotopies through embeddings) form a normal subgroup `isotopicToIdSubgroup M` of `M ≃ₜ M`: from isotopies `F_t` from `f` to the identity and `G_t` from `g` to the identity, `F_t ∘ g` followed by `G_t` joins `f ∘ g` to the identity, `f⁻¹ ∘ F_t` joins the identity to `f⁻¹`, and `h ∘ F_t ∘ h⁻¹` joins `h f h⁻¹` to the identity, every slice remaining an embedding. The **mapping class group** `MappingClassGroupFull M` is the quotient group. For a surface, the homeomorphisms fixing the boundary pointwise form `boundaryFixingSubgroup M`, those joined to the identity by an isotopy fixing the boundary pointwise form its normal subgroup `isotopicRelToIdSubgroup M`, and the quotient is the **mapping class group relative to the boundary** `MappingClassGroupRel M`; for a closed surface the two groups coincide. For an orientation `o` of a compact surface (§0.0c), the **orientation-preserving mapping class group** `MappingClassGroupPlus M o` is the subgroup of `MappingClassGroupRel M` of classes of homeomorphisms carrying `o` to itself, well defined because isotopic homeomorphisms act equally on orientations (§0.0c). Its Lean form takes a smooth orientation (`TauCeti.Manifold.Orientation`) and the classes of diffeomorphisms preserving it at every point (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`); `exists_isotopicRel_diffeomorph` and the orientation comparison of §0.0e identify it with the topological definition.

For a PL structure `s`, a self-homeomorphism is **piecewise linear**, `PLStructure.IsPLHomeomorph`, when in the barycentric coordinates of `s` it is the restriction of a map that is piecewise linear on the realization; its inverse is then piecewise linear as well. These form the subgroup `PLStructure.plHomeomorphSubgroup s`. Two of them are **PL isotopic**, `PLStructure.IsPLIsotopic`, when an isotopy through homeomorphisms joins them whose level-preserving map of `[0, 1] × |K|` is piecewise linear in these coordinates; those PL isotopic to the identity form the normal subgroup `PLStructure.plIsotopicToIdSubgroup s`, and the quotient is the **PL mapping class group** `MappingClassGroupPL s`. For a smooth surface, the diffeomorphisms that are final slices of diffeotopies (Tau Ceti's `TauCeti.Diffeotopy`) form the normal subgroup `smoothIsotopicToIdSubgroup M` of `TauCeti.Diff (𝓡∂ 2) M ∞`, and the quotient is the **smooth mapping class group** `MappingClassGroupSmooth M`. The **forgetful homomorphisms** `MappingClassGroupPL.toTop s` and `MappingClassGroupSmooth.toTop` are induced by the inclusion of the PL homeomorphisms and by Tau Ceti's `Diffeomorph.toHomeomorphHom`; they descend because PL isotopies and diffeotopies are isotopies.

Prove `MappingClassGroupPL.toTop_bijective`: surjectivity is isotopy to a PL homeomorphism (§0.0b), and injectivity is the PL isotopy theorem (§0.0d), two PL homeomorphisms that are isotopic being PL isotopic. Prove `MappingClassGroupSmooth.toTop_surjective` for compact smooth surfaces: every homeomorphism is isotopic to a diffeomorphism (`exists_isotopic_diffeomorph`, §0.0e). The injectivity of the smooth comparison rests on the smoothing of isotopies and is §5.3b.

**Checks.**

- On the closed disc `MappingClassGroupRel` is trivial by Alexander's trick (Tau Ceti's `Homeomorph.alexanderIsotopyClosedBall`), while complex conjugation is a nontrivial element of `MappingClassGroupFull`, since it reverses the orientation (§0.0c); the map from the relative to the full group is not surjective here, and on the annulus it is not injective.
- On the annulus `ℝ/ℤ × [0, 1]` the twist `([θ], t) ↦ ([θ + t], t)` is trivial in `MappingClassGroupFull`, through `([θ], t) ↦ ([θ + s t], t)` whose slices turn the outer circle, and has infinite order in `MappingClassGroupRel`, where the boundary stays fixed.
- The subgroup laws compose on the left: `f⁻¹ ∘ F_t` joins the identity to `f⁻¹` with embedded slices, without asking `(t, x) ↦ F_t⁻¹(x)` to be continuous, which can fail off compact spaces.
- On the torus `ℝ²/ℤ²` the homeomorphism `(x, y) ↦ (x, y + u(x))`, with `u` continuous, periodic and nowhere differentiable, lies in the identity class of `MappingClassGroupFull`; the identity diffeomorphism is a preimage under `MappingClassGroupSmooth.toTop`, so surjectivity is not discharged by smoothing the given map.

*Needs:* §0.0b; §0.0c; §0.0d; §0.0e; Tau Ceti `TauCeti.Isotopic`; Tau Ceti `TauCeti.Isotopy`; Tau Ceti `TauCeti.IsPLOn`; Tau Ceti `TauCeti.Diff`; Tau Ceti `TauCeti.Diffeotopy`; Tau Ceti `Diffeomorph.toHomeomorphHom`; Tau Ceti `TauCeti.Manifold.Orientation`; Tau Ceti `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`; Tau Ceti `Homeomorph.alexanderIsotopyClosedBall`; Mathlib `QuotientGroup.map`; Mathlib `ContinuousMap.HomotopyRel`.

### 0.1 The standard model and its smoothing

Take the model of `StandardSurface.orientable g 0`, the classification and `Surface.genus` of §0.0f, with the PL structures, Euler characteristic and orientations of §0.0b and §0.0c, to fix the standard closed genus-`g` topological surface. Give its PL structure `s_g` a smooth structure compatible with it, by `PLStructure.exists_smoothing` (§0.0e), unique up to a diffeomorphism isotopic to the identity by the uniqueness of compatible smoothings (§0.0e); read as a boundaryless `𝓡 2` structure, since the standard surface has empty boundary (`image_boundary`), and given one of its two orientations, which §0.0e identifies with the smooth orientations, this smoothed standard surface is `S_g`. For a prescribed closed oriented smooth surface `Σ` of genus `g`, obtain the orientation-preserving diffeomorphism `S_g ≃ Σ` from ComplexCurveModuli D0 item 1: its oriented disc/band/cap reduction carries each of `S_g` and `Σ` by an orientation-preserving diffeomorphism onto the closed normal form `N_g` with `g` paired genus bands, the number of bands being determined by its count `χ = 2 − 2g − b` with `b = 0` and `Surface.eulerChar = 2 − 2g`, and the composite `S_g ≃ N_g ≃ Σ` of the first with the inverse of the second is the required diffeomorphism; no homeomorphism from the classification is smoothed, so no compatibility of the given structure of `Σ` with a triangulation is assumed at this step. Prove that two such choices differ by an orientation-preserving diffeomorphism of `S_g`, so every construction below made on `S_g` transports to `Σ` and changing the choice induces a canonical homeomorphism of the transported objects intertwining the mapping-class actions. Transport `s_g` along the chosen diffeomorphism to the PL structure `PLStructure.map` of `Σ` and prove that it satisfies the compatibility condition `PLStructure.IsCompatible` of §0.0e for the given smooth structure of `Σ` (read as a `𝓡∂ 2` atlas with empty boundary): compatibility asks that some smooth triangulation differ from the PL structure by a PL homeomorphism, and a diffeomorphism carries smooth triangulations to smooth triangulations, so this is `PLStructure.IsCompatible.map_diffeomorph`. This transported triangulation is the triangulation of `Σ` the roadmap uses: it is the compatible pair on which §5.3b proves `MappingClassGroupSmooth.toTop_bijective` for `Σ` and that the compatible form of `exists_isotopic_diffeomorph` (§0.0e) takes, and its smooth triangulation is the one the proof of `smoothIsotopic_of_isotopic` (§5.3a) uses for Layers 5.4 and 5.5, so on the surfaces of this roadmap Whitehead's theorem for an arbitrary smooth structure is never needed; it enters only the general forms of §0.0e and §5.3a. Record that `Σ` is compact, connected, Hausdorff, second countable, boundaryless, with `Surface.genus Σ = g` and `Surface.eulerChar Σ = 2 − 2g` (`Surface.eulerChar_eq_two_sub_two_mul_genus`, §0.0f; Tau Ceti's `IsClosedConnectedSurface` carries the first four). Use ComplexCurveModuli D0 item 1 also for labelled marks, cut systems and prescribed collar refinements on this model. Consume ComplexKahlerGeometry K4's holomorphic tangent and cotangent bundles and the native Dolbeault and divisor carriers, with ComplexCurveModuli D0 item 2 for the operator/divisor comparison, to identify on a closed curve `X` the canonical bundle `K_X`, its tensor powers, smooth sections, Beltrami differentials `A^(0,1)(X, T_X)` and holomorphic quadratic differentials `H⁰(X, K_X^⊗2)`.

The standard model and its comparison have the following API.

- `S_g` is a closed oriented smooth surface of genus `g`, with the PL structure `s_g` compatible with its smooth structure by `PLStructure.exists_smoothing`.
- For every closed oriented smooth `Σ` of genus `g` there is an orientation-preserving diffeomorphism `S_g ≃ Σ`, the composite of ComplexCurveModuli D0 item 1's normal-form diffeomorphisms of `S_g` and of `Σ`; two of them differ by an element of `Diff⁺(S_g)`.
- The transported triangulation of `Σ` is compatible with the given smooth structure of `Σ`, because compatibility is invariant under diffeomorphism.
- The genus and Euler characteristic of `Σ` are `g` and `2 − 2g`, and agree with ComplexCurveModuli D0 item 1's count `χ = 2 − 2g − b` with `b = 0`.

**Checks.**

- For `g = 2` the transported Euler characteristic is `−2`; a definition that transported the triangulation of the sphere would give `2`.
- The sphere `S²` admits the compatible smoothing of its tetrahedral triangulation after one barycentric subdivision; the condition asked of the triangulation itself fails for the one-triangle disc (§0.0e), so compatibility is asked up to a PL homeomorphism, equivalently of a subdivision.
- Compatibility is a property of a pair, not of a smooth structure: a triangulation of `Σ` produced by Radó's theorem alone, with no relation to the given smooth structure, is not known to be compatible with it, and the roadmap never applies the compatible form of `exists_isotopic_diffeomorph` to such a pair; only the triangulation transported from `S_g` is used.
- D0 item 1 reduces `S_g` and `Σ` to the same normal form only because both have `χ = 2 − 2g`; for `Σ'` of genus `g + 1` the reduction has one more genus band, no diffeomorphism `S_g ≃ Σ'` exists, and `Surface.eulerChar` already separates them.
- Two orientation-preserving diffeomorphisms `S_g ≃ Σ` composed as `φ⁻¹ ∘ ψ` lie in `Diff⁺(S_g)`; composing an orientation-preserving with an orientation-reversing one gives an element outside `Diff⁺(S_g)`, which the transport of oriented objects excludes.

*Needs:* §0.0b; §0.0c; §0.0e; §0.0f; Tau Ceti `TauCeti.IsClosedConnectedSurface`; ComplexCurveModuli D0 item 1; ComplexCurveModuli D0 item 2; ComplexKahlerGeometry K4.

### 0.2 The diffeomorphism group, paths and smooth isotopies

For a compact surface `M` (closed, or with boundary and a prescribed boundary collar) let `Diff(M)` be Tau Ceti's `TauCeti.Diff (𝓡 2) M ∞` with `Diffeomorph.weakWhitneyTopology`; it is a topological group by `Diffeomorph.isTopologicalGroup`, and GeometricTopology Layer 3 is the owner of that structure. Define `Diff₀(M)` as the path component of the identity. A smooth isotopy from `f` to `g` is a diffeotopy `Φ` with `Φ.final = f⁻¹ g`, equivalently a `C^∞` map `F : [0,1] × M → M` whose slices are diffeomorphisms with `F_0 = f` and `F_1 = g`. Tau Ceti's `TauCeti.Diffeotopy.joined_one_final` gives one half of the comparison: a smooth isotopy is a continuous path in `Diff(M)`. Prove the converse, the **parameter-smoothing theorem**: a continuous path in `Diff(M)` is homotopic relative to its endpoints to a smooth isotopy, relative to the boundary collar when the path fixes it. Route: cover the compact track of the path by finitely many chart neighbourhoods, convolve the parameter dependence chartwise with a partition of unity in the time variable while keeping the slices diffeomorphisms (a `C^∞`-small perturbation of a diffeomorphism of a compact manifold is a diffeomorphism), and keep the endpoints and the collar data by cutting off the mollification near `t = 0, 1` and near the collar. Prove the **local isotopy lemma**: there is a `C^∞` neighbourhood of the identity in `Diff(M)` every element of which is smoothly isotopic to the identity, by chartwise geodesic or linear interpolation from the identity on a compact chart cover with a partition of unity; translating by a diffeomorphism gives the same statement at every point of `Diff(M)`. Conclude that `Diff₀(M)` is exactly the set of diffeomorphisms smoothly isotopic to the identity, that it is open and closed in `Diff(M)`, and that `π₀ Diff(M)` is the set of smooth isotopy classes. For the surfaces used below take `M = Σ`, `M = S²` and `M = D²` with a boundary collar.

The identity component and the isotopy relation have the following API.

- `Diff₀(M)` is a normal subgroup of `Diff(M)`, open and closed.
- `f` and `g` are joined by a path in `Diff(M)` if and only if they are smoothly isotopic (`joined_one_final` one way, the parameter-smoothing theorem the other).
- Smooth isotopy is an equivalence relation compatible with composition on both sides (`Diffeotopy.trans`, `Diffeotopy.symm`, `transDiffeomorph`).
- In the relative case the same statements hold for the closed subgroup fixing a collar pointwise.

**Checks.**

- The rotation `z ↦ e^(iθ) z` of `S²` about an axis is in `Diff₀(S²)` through the rotation path; the antipodal map is not, since it reverses orientation and orientation is locally constant on paths in `Diff(S²)`.
- On the torus the shear `(x, y) ↦ (x, x + y)` is not in `Diff₀(T²)`: it acts on `H₁` by a nontrivial matrix, and an isotopy acts trivially on homology.
- A diffeomorphism of `D²` fixing a collar and equal to a rotation by `2π` of the inner disc, spliced by an increasing angle function, is in `Diff₀(D², rel collar)` by shrinking the angle function; its identity-near-boundary condition is what Smale's theorem in Layer 5.3 needs, not only fixing the boundary pointwise.
- A path in `Diff(M)` that is merely continuous in `t` (for example `t ↦ f_t` with `f_t` the time-`|t − 1/2|` flow of a vector field) has a smooth reparametrization through the same diffeomorphisms; a definition of isotopy that demanded the given path itself to be smooth would reject it.

*Needs:* Tau Ceti `TauCeti.Diff`; Tau Ceti `Diffeomorph.weakWhitneyTopology`; Tau Ceti `Diffeomorph.isTopologicalGroup`; Tau Ceti `TauCeti.Diffeotopy`; Tau Ceti `TauCeti.Diffeotopy.joined_one_final`; Tau Ceti `Diffeomorph.ofSmoothFamily`; Mathlib `SmoothPartitionOfUnity`; GeometricTopology Layer 3.

### 0.3 One-parameter isotopy extension on surfaces

Prove the one-parameter compact-ambient **isotopy extension theorem** in dimension two: for a compact surface `M`, a compact submanifold `K` (a disc, an arc, a circle or a finite union of them with a tubular neighbourhood) and a smooth isotopy of embeddings `e_t : K → M`, `t ∈ [0, 1]`, there is a smooth isotopy `ψ_t ∈ Diff₀(M)` with `ψ_0 = id` and `ψ_t ∘ e_0 = e_t`; when `M` has boundary and the `e_t` stay in the interior, `ψ_t` fixes a neighbourhood of the boundary. Route: the velocity `∂_t e_t` is a time-dependent vector field along the moving image; extend it to `M` by a finite cover of the track by tubular neighbourhood charts (GeometricTopology Layer 1), parameter-dependent cutoffs and a partition of unity, with the cutoffs vanishing near `∂M`; the extension is complete because `M` is compact; solve the time-dependent flow by DifferentialGeometry Layer 3.5 and read off `ψ_t`. ComplexCurveModuli D0 item 1 applies the same velocity-extension route to its supported disc isotopies; the theorem here is the general one-parameter statement that Layer 5 consumes. Prove its relative form for parameter families over a compact parameter square used in Layer 5.3, where the extended field is prescribed on two edges of the square.

**Checks.**

- For `K` a point moving along an embedded arc the extension is a point-pushing isotopy, supported in a neighbourhood of the arc; its final diffeomorphism is the point-pushing diffeomorphism along the arc.
- For `K = D²` moving by the rotation `e^(iθt)` about its centre inside a chart, the extension restricted to a larger concentric disc is a spliced rotation, and is the identity outside.
- A moving embedding that leaves a compact set of a noncompact surface has no extension with compact support; the compactness hypothesis is used.

*Needs:* GeometricTopology Layer 1; DifferentialGeometry Layer 3.5; Mathlib `SmoothPartitionOfUnity`; §0.2.

### 0.4 Markings and their equivalence

Define a marking of a Riemann surface `X` by `Σ` as an orientation-preserving diffeomorphism `m : Σ → X` of the underlying smooth surfaces, and the relation `(X, m) ∼ (Y, n)` when some biholomorphism `f : X ≃ Y` makes `f ∘ m` smoothly isotopic to `n`. Prove that `∼` is an equivalence relation (reflexive by the identity, symmetric by `f⁻¹` and `Diffeotopy.symm`, transitive by composition and `Diffeotopy.trans`). Prove that pullback of complex structures along diffeomorphisms is continuous for the `C^∞` topologies and satisfies the action laws `(f ∘ g)^* = g^* ∘ f^*` and `id^* = id`.

**Checks.**

- `(X, m) ∼ (X, m ∘ φ)` for `φ ∈ Diff₀(Σ)`, and not for the shear of the torus or any `φ` acting nontrivially on `H₁(Σ)`, since a biholomorphism isotopic to `m ∘ φ ∘ m⁻¹` would act on `H₁(X)` as `φ` does.
- `(X, m) ∼ (X, m)` with `f = id`; a definition requiring `f ∘ m = n` on the nose would separate `(X, m)` from `(X, m ∘ φ)` for `φ` a small diffeomorphism.
- For `X` with a nontrivial automorphism `σ`, `(X, m) ∼ (X, σ ∘ m)` with `f = σ`; the two markings differ by the mapping class of `m⁻¹ σ m`, which is nontrivial by Layer 0.5, so the relation identifies points that `Mod⁺` moves to each other only when an automorphism realizes the class.

*Needs:* §0.2; Tau Ceti `TauCeti.Diffeotopy.trans`; Tau Ceti `TauCeti.Diffeotopy.symm`.

### 0.5 The trivial automorphism kernel

Prove `Aut(X) ∩ Diff₀(Σ) = {id}` for a closed Riemann surface `X` of genus `g ≥ 2` marked by `Σ`: ComplexCurveModuli D0 item 4 gives the unique conformal curvature-`−1` metric, so a holomorphic automorphism is an isometry; an isometry smoothly isotopic to the identity lifts to the universal cover `ℍ` (Completed/UniversalCovers Stage 2, through `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`) as an isometry commuting with the deck group, hence centralizing the cocompact surface group in `PSL₂(ℝ)`; prove that the centralizer of a nonelementary discrete group in `PSL₂(ℝ)` is trivial, because an element commuting with two hyperbolic elements with distinct fixed-point pairs would preserve both pairs. The same argument proves that the map from the isometry group of a closed hyperbolic surface to `Mod±(Σ)` is injective; Layer 5.6 uses this form.

**Checks.**

- On the torus `ℂ/Λ` the translations are automorphisms isotopic to the identity, so the hypothesis `g ≥ 2` is used; the statement fails for `g = 1`.
- For the hyperelliptic involution of a genus-two curve the induced mapping class is nontrivial: it acts as `−1` on `H₁`.
- The centralizer argument fails for an elementary group: the cyclic group generated by one hyperbolic element has an infinite centralizer, the one-parameter group through it.

*Needs:* ComplexCurveModuli D0 item 4; Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv`; Mathlib `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`; RiemannianGeometry R4 item 7; §0.2.

### Examples

- The boundary of the tetrahedron as a PL structure on the round sphere by radial projection: its Euler characteristic `4 − 6 + 4 = 2`, its two coherent orientations and their double cover, and its compatibility with the round smooth structure.
- The genus-two surface `S_2` as the smoothed standard surface, with the transported triangulation, its hyperelliptic involution as an element of `Diff⁺(S_2)` outside `Diff₀(S_2)`, and the isotopy extension of a point push along an embedded arc.

### Dependencies

Layer 0 consumes Tau Ceti's simplicial-complex, PL, isotopy, Schoenflies, invariance-of-domain, smooth-triangulation, diffeomorphism and covering-space declarations, GeometricTopology Layers 1 and 3 and its smoothing-and-triangulation comparison item 1, DifferentialGeometry Layer 3.5, ComplexCurveModuli D0 items 1, 2 and 4, ComplexKahlerGeometry K4 and RiemannianGeometry R4 item 7. It supplies the triangulation, PL and smoothing theory of compact surfaces, their classification and genus, branched covers and the Riemann–Hurwitz formula, the mapping class groups, the carriers and the isotopy calculus to every later layer.

## Layer 1: Complex structures and the marked quotient

### 1.1 Almost-complex structures and integrability in dimension two

Use the smooth almost-complex endomorphism `J : TΣ → TΣ` with `J² = −1` as the tensor carrier, and define orientation compatibility as `(v, Jv)` being positively oriented for every nonzero `v`. Prove that the Nijenhuis tensor of `J` vanishes in real dimension two: it is tensorial, skew-symmetric and `J`-antilinear in each argument, so on a two-dimensional space spanned by `v, Jv` it is determined by `N(v, Jv)`, which the antilinearity forces to be zero. Apply ComplexKahlerGeometry K1's Newlander–Nirenberg equivalence to construct the complex atlas of `J`, and prove that the resulting native curve induces exactly the chosen smooth structure and orientation. Conversely recover `J` from a complex atlas as multiplication by `i` in holomorphic charts and prove that the two constructions are inverse under atlas equivalence. Build `𝒥(Σ)`, the space of orientation-compatible integrable almost-complex structures, as a closed subset of the sections of `End(TΣ)` with the `C^∞` topology.

**Checks.**

- On `ℝ²` with `J = [[0, −1], [1, 0]]` the induced atlas is the identity chart of `ℂ`, and `(v, Jv) = (e₁, e₂)` is positive; `−J` induces the conjugate atlas and is not orientation compatible with the standard orientation.
- The Nijenhuis tensor of the standard `J` on `ℝ⁴` with a non-integrable perturbation is nonzero, so the dimension-two argument uses `dim = 2`; the proof must not claim vanishing in general.
- `𝒥(S²)` is nonempty and a single `Diff₀`-orbit (every complex structure on the sphere is biholomorphic to `ℙ¹`, by ComplexCurveModuli D0 item 3); `𝒥(T²)` has orbit space `ℍ`, not a point.

*Needs:* ComplexKahlerGeometry K1; §0.1; §0.2.

### 1.2 The marked quotient

The group `Diff₀⁺(Σ) = Diff₀(Σ)` acts on `𝒥(Σ)` by pullback. Define `Teich(Σ)` as the quotient `𝒥(Σ)/Diff₀(Σ)` with the quotient topology, and prove that it is naturally bijective with the marked-biholomorphism classes of Layer 0.4 on the carrier of compact complex structures on the fixed smooth surface: a class `[J]` goes to `(Σ_J, id)` and a marked surface `(X, m)` to `m^* J_X`. Give the marked carrier the transported topology and prove it agrees with the marked-slice topology of Layer 2.1. The quotient relation uses isotopy through `Diff₀`; unmarked conformal structures enter only after the separate forgetful quotient of Layer 3.3.

The quotient has the following API.

- The quotient map `𝒥(Σ) → Teich(Σ)` is open and continuous.
- `[J] = [J']` if and only if `J' = φ^* J` for some `φ ∈ Diff₀(Σ)`, if and only if `(Σ_J, id) ∼ (Σ_(J'), id)`.
- The bijection with marked surfaces is natural under orientation-preserving diffeomorphisms of `Σ`.

**Checks.**

- The structures `J` and `φ^* J` for `φ` a point push give the same point; `J` and `φ^* J` for `φ` the hyperelliptic involution of a genus-two curve give the same point too, by Layer 0.4's third check, although `φ ∉ Diff₀`; the quotient by `Diff₀` does not separate them because the involution is realized by an automorphism.
- For the shear `φ` of a torus, `J` and `φ^* J` are different points of the analogous quotient for `g = 1`, since the shear is not isotopic to any automorphism of a generic torus; this distinguishes the marked quotient from the unmarked one.
- A set of structures converging in `C^∞` to `J` gives a convergent sequence in `Teich(Σ)`; a definition with the discrete topology on the quotient would not.

*Needs:* §1.1; §0.4; §0.2.

### Examples

- Genus two: the point of `Teich(S_2)` of a curve `y² = f(x)` with the identity marking and its image under the hyperelliptic involution, which is the same point.

### Dependencies

Layer 1 consumes Layer 0 and ComplexKahlerGeometry K1 and supplies the carrier `Teich(Σ)` to Layers 2 to 11.

## Layer 2: Marked deformation atlas and dimension

### 2.1 The marked holomorphic chart adapter

For a closed smooth curve `X` of genus `g ≥ 2` consume ComplexCurveModuli D3 item 3's deformation complex and obstruction calculation, D3 item 4's Kodaira–Spencer tangent map, and D3 item 5's arbitrary-complement smooth-offset subclause for a smooth finite-dimensional marked slice in the full Sobolev chart `J^(k,p)(Σ)` with its derivative-offset inverse function theorem; that subclause does not make the complement a complex slice, and no smooth slice is declared holomorphic here. Choose D4 item 1's stable smooth-curve unfolding `π : 𝒳 → U` with `U` a complex base and an identified central fibre `X`, restricted to its open universal locus by D4 item 4; in the closed smooth locus the family has no nodes and its total space and transition maps are holomorphic. Trivialize the underlying smooth family near the central fibre and transport the chosen marking to nearby fibres. Prove that changing the local smooth trivialization changes each marking by an element of `Diff₀`, by Layer 0.2's path-to-isotopy comparison; this defines `κ_X : U → Teich(Σ)`. Use D3 item 5's offset inverse function theorem and local uniqueness, D3 item 4's Kodaira–Spencer isomorphism and Layer 0.5's trivial automorphism kernel to prove that `κ_X` is a local homeomorphism onto an open marked neighbourhood and is locally one-to-one, and that its topology agrees with the `C^∞` quotient topology of Layer 1.2.

**Checks.**

- The base `U` has complex dimension `3g − 3` (Layer 2.4), so `κ_X` is not a local homeomorphism from a base of any other dimension; a chart built from an unmarked family near a curve with automorphisms would be `|Aut(X)|`-to-one, which the marking removes.
- Two trivializations differing by a loop of diffeomorphisms that is not null-homotopic in `Diff(Σ)` cannot occur over a simply connected `U`; the chart is single valued because `U` is a polydisc.
- At a curve `X` with the hyperelliptic involution the chart is still injective: the involution is in the stabilizer of the point, not an identification of distinct points.

*Needs:* ComplexCurveModuli D3 item 3; ComplexCurveModuli D3 item 4; ComplexCurveModuli D3 item 5; ComplexCurveModuli D4 item 1; ComplexCurveModuli D4 item 4; §0.2; §0.5; §1.2.

### 2.2 Transition maps and the cocycle law

For two charts `κ_X`, `κ_Y` and a common marked central point, choose the central-fibre biholomorphism preserving the marked isotopy class and apply D4 item 4's unique universal comparison to obtain a holomorphic base-germ map and a Cartesian total-family isomorphism. Prove that this base map represents `κ_Y⁻¹ ∘ κ_X`; the reverse comparison and uniqueness give its holomorphic inverse, Layer 0.5 removes the `Diff₀` ambiguity, and the finite automorphisms remain in the forgetful groupoid of Layer 3.3. On triple overlaps prove the cocycle law from uniqueness with the specified central arrow. Consume D3 item 6 on the holomorphic total families: verify that the block form `J = [[i, 0], [α, j]]` satisfies the mixed equation and the horizontal-curvature equation with D3 item 6's bracket convention; when an `α = 0` construction is used prove that sufficient case, and never infer integrability of a general total structure from a smooth slice or from one equation alone. These comparisons make the marked atlas complex and prove that marking changes by orientation-preserving diffeomorphisms are holomorphic (antiholomorphic for the orientation-reversing action of Layer 3.2). Construct the forgetful map to ComplexCurveModuli's stable smooth-curve groupoid through these families, identify its local pullback with the marked charts, and prove that its arrows are exactly the isomorphisms compatible with the marking class; the coarse forgetful map is not an unbranched covering at a point with automorphisms.

**Checks.**

- Over a one-parameter holomorphic family the transition map between the charts at two of its fibres is the identity germ in the family coordinate; a transition read with the conjugate central isomorphism would be antiholomorphic.
- The cocycle law on three charts at one central point reduces to the uniqueness of the central arrow: with the central arrow replaced by its composite with a nontrivial automorphism the three comparisons do not compose to the identity.
- The coarse forgetful map at the hyperelliptic point of genus two is two-to-one near the point on the marked side, not a covering.

*Needs:* ComplexCurveModuli D4 item 4; ComplexCurveModuli D3 item 6; §2.1; §0.5.

### 2.3 Hausdorff and second countable

Prove that `Teich(Σ)` is Hausdorff: use D0 item 5's properness of the actual diffeomorphism action, Layer 0.5's freeness and the slices of Layer 2.1 to show that the orbit relation is closed and that distinct orbits have disjoint saturated neighbourhoods. Prove second countability from the `C^∞` Fréchet topology on sections over the compact second-countable `Σ`: the integrable locus is second countable and the open quotient map carries a countable base to a countable base. These are properties of the global marked carrier, proved from its construction, not assumptions on an atlas.

**Checks.**

- The quotient of `𝒥(T²)` by `Diff₀(T²)` is `ℍ`, which is Hausdorff; the quotient by the full group `Diff(T²)` is `ℍ/GL₂(ℤ)`, Hausdorff only because that action is properly discontinuous with finite stabilizers. The proof here uses the trivial stabilizers of Layer 0.5, which the full group does not have.
- A quotient of a second-countable space by an open equivalence relation is second countable; by a closed non-open map it need not be, so openness of the quotient map (Layer 1.2) is used.
- Two structures in the same `Diff₀`-orbit have the same image under every chart `κ_X`; two in different orbits are separated by some chart.

*Needs:* ComplexCurveModuli D0 item 5; §0.5; §2.1; §1.2.

### 2.4 Dimension `3g − 3`

Consume ComplexCurveModuli D3 item 3's obstruction vanishing and dimension `dim Def¹ = 3g − 3 + n + dim A_C` and D3 item 4's identification of the tangent space with `H¹(X, T_X)`. On the closed unmarked genus-`g ≥ 2` locus `n = 0`, `A_C = H⁰(X, T_X) = 0` because `deg T_X = 2 − 2g < 0` (D0 item 2), and `Def¹ = H¹(X, T_X)`, so the dimension is `3g − 3`. ComplexKahlerGeometry K4 and K5b identify the canonical bundle and give Serre duality `H¹(X, T_X)^* ≃ H⁰(X, K_X^⊗2)`. This consumes the upstream dimension and identifies its quadratic-differential dual; the Riemann–Roch derivation through ModularForms Layer 10B is D0 item 2's and is not repeated.

**Checks.**

- `g = 2`: dimension `3`, and `H⁰(X, K_X^⊗2)` has dimension `3` by Riemann–Roch `deg K^⊗2 + 1 − g = 4 + 1 − 2 = 3`.
- `g = 3`: dimension `6 = 3·3 − 3`; a formula `3g` would give `9`.
- `g = 1`: the formula `3g − 3 + n + dim A_C` gives `0 + 0 + 1 = 1` since `A_C = H⁰(T_X) = ℂ` for the torus, matching `dim Teich(T²) = 1` and showing that the `A_C = 0` step uses `g ≥ 2`.

*Needs:* ComplexCurveModuli D3 item 3; ComplexCurveModuli D3 item 4; ComplexCurveModuli D0 item 2; ComplexKahlerGeometry K4; ComplexKahlerGeometry K5b.

### Examples

- Genus two: `Teich(S_2)` is a complex threefold; the chart at a curve `y² = x(x − 1)(x − a)(x − b)(x − c)` has base coordinates deforming `a, b, c`.

### Dependencies

Layer 2 consumes Layers 0 and 1, ComplexCurveModuli D0 items 2 and 5, D3 items 3 to 6 and D4 items 1 and 4, and ComplexKahlerGeometry K4 and K5b. It supplies the complex manifold `Teich(Σ)` of dimension `3g − 3` to Layers 3 and 7 to 11.

## Layer 3: Mapping-class actions and the moduli groupoid

### 3.1 The mapping class groups

Define `Mod±(Σ) := π₀ Diff(Σ)`, the `ZerothHomotopy` of Tau Ceti's `TauCeti.Diff (𝓡 2) Σ ∞` with the weak Whitney topology, with the group law induced by composition; it descends because `Diff(Σ)` is a topological group (`Diffeomorph.isTopologicalGroup`), and by Layer 0.2 it is the group of smooth isotopy classes of diffeomorphisms. Define `Mod⁺(Σ)` as the image of `Diff⁺(Σ)`, of index two. Prove the isomorphism of `Mod±(Σ)` with the smooth mapping class group `MappingClassGroupSmooth Σ` of §0.0h, the `𝓡 2` atlas of `Σ` read as an `𝓡∂ 2` atlas with empty boundary as in Layer 0.1: both are the diffeomorphisms modulo smooth isotopy, by Layer 0.2's identification of `π₀ Diff(Σ)` with the smooth isotopy classes, and the group laws agree because both are induced by composition. Composed with the forgetful homomorphism `MappingClassGroupSmooth.toTop`, surjective by §0.0h and injective by §5.3b, it identifies `Mod±(Σ)` with `MappingClassGroupFull Σ` and `Mod⁺(Σ)` with `MappingClassGroupPlus` for the chosen orientation; that identification is completed in §5.3b, after the smoothing of isotopies, and Layers 3 and 4 use only the smooth carrier, because the action on `Teich(Σ)` is by pullback of smooth structures.

**Checks.**

- `Mod±(S²)` has two elements and `Mod⁺(S²)` is trivial, by Layer 5.3's Smale theorem; §5.4a's `mcg_sphere_full` gives the same answer for the topological group.
- `Mod⁺(T²) ≃ SL₂(ℤ)` and `Mod±(T²) ≃ GL₂(ℤ)` through the action on `H₁`, matching §5.4a's `mcg_torus_full` and its orientation-preserving form; a definition of `Mod±` by homotopy classes of continuous self-maps would give the same group for the torus but would not be a group of diffeomorphism classes.
- The hyperelliptic involution of `S_2` is a nontrivial element of `Mod⁺(S_2)` of order two.

*Needs:* Tau Ceti `TauCeti.Diff`; Tau Ceti `Diffeomorph.isTopologicalGroup`; Mathlib `ZerothHomotopy`; §0.2; §0.1; §0.0h.

### 3.2 The action on marked structures

On the positively oriented complex-structure carrier define, for a diffeomorphism `f`, `f ⋅ J = ε(f) · (f⁻¹)^* J` with `ε(f) = +1` if `f` preserves orientation and `−1` otherwise; on marked surfaces `f ⋅ (X, m) = (X, m ∘ f⁻¹)` for orientation-preserving `f` and `f ⋅ (X, m) = (X̄, m ∘ f⁻¹)` for orientation-reversing `f`, where `X̄` is the conjugate curve. Multiplication by `−1` on the carrier is complex conjugation and restores the fixed orientation. Prove that the two formulas define the same left action of `Mod±(Σ)` on `Teich(Σ)`, that `Mod⁺(Σ)` acts holomorphically by changing markings, and that the orientation-reversing coset acts antiholomorphically in the atlas of Layer 2.

**Checks.**

- For `f` the orientation-reversing involution of `S_2` that reflects the standard embedded model in a plane, `f ⋅ J` equals the conjugate of `(f⁻¹)^* J`; without the sign `ε(f)` the pulled-back structure would induce the opposite orientation and not lie in `𝒥(Σ)`.
- Action law on a reversing pair: for two orientation-reversing diffeomorphisms `f, g`, `ε(fg) = +1` so `(fg) ⋅ J = ((fg)⁻¹)^* J`, while `f ⋅ (g ⋅ J) = (−1)(−1)(f⁻¹)^*((g⁻¹)^* J) = (g⁻¹ ∘ f⁻¹)^* J = ((fg)⁻¹)^* J`; the two agree. A convention `f ⋅ J = ε(f) f^* J` would give `f ⋅ (g ⋅ J) = (gf)^* J ≠ (fg)^* J`, a right action.
- For `f ∈ Diff₀(Σ)` the action is trivial on `Teich(Σ)`, and for `f` the hyperelliptic involution of genus two it is trivial too (Layer 8.5); a definition of the action on `𝒥(Σ)` rather than on the quotient would not have the second property.

*Needs:* §1.2; §2.2; §3.1.

### 3.3 Proper discontinuity and the moduli groupoid

Consume ComplexCurveModuli D0 item 5's properness of the diffeomorphism action on stable marked curves and D3 item 5's local-slice subclause. For convergent pairs related by mapping classes choose smoothly convergent slice representatives and intertwining diffeomorphisms; D0 item 5 gives a convergent subsequence of diffeomorphisms and inverses; Layer 0.2's local isotopy lemma shows the mapping classes eventually agree. This proves finite transporters on compact sets, first for `Mod⁺` and then for `Mod±` by its two cosets: the action is properly discontinuous. Define the oriented moduli orbifold as the proper étale action groupoid `Teich(Σ) ⋊ Mod⁺(Σ)` and its coarse quotient, and separately the quotient by the full group, which forgets orientation. Properness gives finite isotropy in quotient charts, and the isotropy at a point is its stabilizer, identified in Layer 5.6.

**Checks.**

- For the torus the action of `SL₂(ℤ)` on `ℍ` is properly discontinuous with isotropy of order `4` at `i` and `6` at `e^(2πi/3)`; a definition of properness demanding free action would fail there.
- In genus two every point has isotropy containing the hyperelliptic involution, so the coarse quotient is the quotient of the groupoid by a generically order-two isotropy.
- Finite transporters on compact sets fail for the action of `ℤ` on `ℝ` by `x ↦ 2ⁿ x`: the compact set `[−1, 1]` meets its image under every `n`, while on `ℝ ∖ {0}` the same action is properly discontinuous; properness is a statement about compact subsets of the space acted on, not about the group.

*Needs:* ComplexCurveModuli D0 item 5; ComplexCurveModuli D3 item 5; §0.2; §3.2.

### Examples

- Genus two: the image of the identity-marked curve under the Dehn twist about a nonseparating curve is a different point of `Teich(S_2)` with the same image in the coarse moduli space.

### Dependencies

Layer 3 consumes Layers 0 to 2, Tau Ceti's `Diff` and `ZerothHomotopy` and ComplexCurveModuli D0 item 5 and D3 item 5. It supplies the groups `Mod⁺(Σ)`, `Mod±(Σ)`, the action and proper discontinuity to Layers 5 and 7 to 11.

## Layer 4: Uniformization, Euler class and holonomy

### 4.1 The isometry group of the hyperbolic plane

Prove `exists_mulEquiv_isometryEquiv_glAction`: Mathlib's action `UpperHalfPlane.glAction` of `GL (Fin 2) ℝ` on `ℍ`, which applies `z ↦ (az + b)/(cz + d)` when `det > 0` and `z ↦ (a z̄ + b)/(c z̄ + d)` when `det < 0`, is by isometries of the hyperbolic distance; every isometry of `ℍ` arises; and the kernel is exactly the centre, the nonzero scalar matrices, so the action induces an isomorphism `GL(2,ℝ)/Z ≃* Isom(ℍ)` sending the class of `g` to `z ↦ g • z`. Route: the Möbius maps of positive determinant preserve the hyperbolic distance by Mathlib's instance `IsIsometricSMul SL(2, ℝ) ℍ` after scaling the matrix to determinant one, and the conjugation `z ↦ −z̄` preserves the metric `(|dx|² + dy²)/y²` directly, the only new isometry computation; an isometry is determined by its values on three points in general position, so after composing with a Möbius map it fixes `i` and a direction and is the identity or the reflection; two matrices inducing the same map are proportional. Identify `PSL₂(ℝ)` with the orientation-preserving subgroup, of index two, with `PGL₂(ℝ)/PSL₂(ℝ)` detected by the sign of the determinant. Construct the comparison isometry `ℍ ≃ᵢ UpperHalfSpace ℝ` with Tau Ceti's two-dimensional hyperbolic space, so that RiemannianGeometry R4 item 7's isometry group, Killing–Hopf theorem, isometry lifting and quotient metric apply to `ℍ`; R4 item 7 keeps the `n`-dimensional group `O⁺(n,1)` and this roadmap keeps the two-dimensional projective model. Prove the **isometry lifting** statement used below: an isometry `ℍ/Γ₁ → ℍ/Γ₂` of quotients by discrete torsion-free groups lifts to `a ∈ Isom(ℍ) = PGL₂(ℝ)` with `a Γ₁ a⁻¹ = Γ₂`, and the lift is unique up to left multiplication by `Γ₂`.

**Checks.**

- The matrix `diag(1, −1)` acts by `z ↦ −z̄`, the reflection in the imaginary axis, an isometry fixing `i` and reversing orientation; a convention applying conjugation for `det > 0` instead would make `−I` act as a reflection, contradicting that `−I` is central.
- The scalar matrix `λI` acts trivially for every `λ ≠ 0`, including `λ < 0`, where `det = λ² > 0` so no conjugation is applied; the kernel is the full centre and not only the positive scalars.
- `dist(i, 2i) = log 2` is preserved by `z ↦ 2z` (matrix `diag(2, 1)`, determinant `2`) and by `z ↦ −2 z̄` (matrix `diag(−2, 1)`, determinant `−2`), which send `i, 2i` to `2i, 4i` and `2i, 4i` respectively.
- The lifting statement fails without torsion-freeness in the uniqueness clause only: for `Γ` with elliptic elements the lift is still unique up to `Γ₂`, but the quotient is an orbifold, which is why Layer 10.1 passes through FuchsianOrbifolds Layer 1 for the orbifold case.

*Needs:* Mathlib `UpperHalfPlane.glAction`; Mathlib `IsIsometricSMul`; Mathlib `IsometryEquiv`; Mathlib `Subgroup.center`; Tau Ceti `UpperHalfSpace.isPretransitive_isom`; RiemannianGeometry R4 item 7; FuchsianOrbifolds Layer 0 item 2.

### 4.2 The geometric surface group and the deck dictionary

Define the geometric group `Π := (π₁ⁿᵃᵗ(Σ, x₀))ᵐᵒᵖ`; then `op(p) * op(q) = op(p.trans q)`, so multiplication in `Π` is first-traverse concatenation. For every native `FundamentalGroup` or outer-automorphism construction state the inversion equivalence `ι : Π ≃* π₁ⁿᵃᵗ`, `ι(op p) = p⁻¹`, and the induced maps on automorphism and inner-automorphism groups. Tau Ceti's `TauCeti.UniversalCover.deckFundamentalGroupEquiv x₀ : deck proj ≃* (FundamentalGroup Σ x₀)ᵐᵒᵖ` is, with `Π`, an isomorphism `deck(proj) ≃* Π`. Define `η : Π ≃* deck(proj)` by the endpoint of a lifted based loop; the pinned body `deckFundamentalGroupEquiv_symm_op` fixes `η(op p) = loopDeck(p⁻¹)`; prove this endpoint formula and `η(op p * op q) = η(op p) ∘ η(op q)` by path lifting. Prove that `Π` is torsion-free once a hyperbolic metric exists (Layer 4.5): a finite-order element acts on `ℍ` as a finite-order orientation-preserving isometry, hence fixes a point, contradicting freeness of the deck action.

The deck dictionary has the following API.

- `η` is a group isomorphism `Π ≃* deck(proj)`, with `η(op p)` the deck transformation sending the base lift to the endpoint of the lift of `p⁻¹`.
- Under `ι`, inner automorphisms of `Π` correspond to inner automorphisms of `π₁ⁿᵃᵗ`, and `Out(Π) ≃ Out(π₁ⁿᵃᵗ)`.
- For a normal subgroup `N ◁ Π` the deck group of the cover attached to `ι(N)` is identified with `Π/N` through `deckSubgroupQuotientProjEquivOfNormal` and the same inversion.

**Checks.**

- For two loops `p, q` at `x₀`, the lift of `p.trans q` ends at `η(op p)(η(op q)(x̃₀))` only with the stated inverse in `loopDeck(p⁻¹)`; with `loopDeck(p)` the endpoint formula would be an antihomomorphism.
- On the circle, `Π ≃ ℤ` and `η(op(generator))` is the unit translation of `ℝ` in the direction of the loop; the opposite convention gives the inverse translation.
- A free-group deck transformation is never of finite order; this check is the torsion-freeness in the case of a wedge of two circles, before any metric.

*Needs:* Mathlib `FundamentalGroup.mul_def`; Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv`; Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv_symm_op`; Tau Ceti `TauCeti.UniversalCover.loopDeck`; Tau Ceti `deckSubgroupQuotientProjEquivOfNormal`.

### 4.3 The polygon model and the attaching word

Construct the oriented `4g`-gon model from Layer 0.1's standard surface using ComplexCurveModuli D0 item 1's marked and collared cut-system refinement: cut along `2g` handle curves, identify the boundary word, and prove that the quotient of the oriented `4g`-gon by paired edges is orientation-preservingly diffeomorphic to `S_g`; the boundary word is not read off the handle-model name. Derive the attaching class by an owned two-cell van Kampen adapter: choose open `U` containing the one-skeleton and `V` the open two-cell with a collar, both containing a common basepoint; prove that `U` retracts to the one-skeleton, `V` is contractible and `U ∩ V` retracts to the attaching circle; a path from the vertex basepoint into `U ∩ V` conjugates the attaching class and leaves its normal closure unchanged. Apply AlgebraicTopology Stage 1 item 4 to this cover and Stage 1 item 5 for the free group on the edge loops. Let `Aᵢ, Bᵢ ∈ π₁ⁿᵃᵗ` be the native edge-loop classes and `aᵢ, bᵢ ∈ Π` the first-traverse geometric loops. Stage 1 item 4 gives the native presentation with attaching word `∏_(i=g)^1 [Bᵢ⁻¹, Aᵢ⁻¹]`, because native multiplication reverses first-traverse order; under `ι` the native generators correspond to the inverses of the geometric loops and the image of that word is `R⁻¹` with `R = ∏_(i=1)^g [aᵢ, bᵢ]`. State the comparison in the free group on the wedge generators before quotienting: a word and its inverse have the same normal closure, hence `Π ≃ ⟨aᵢ, bᵢ | R = 1⟩`, with `R` the first-traverse reading of the boundary of the positively oriented two-cell. Compute `ε_AT ∈ {−1, +1}`, the value of AlgebraicTopology Stage 6's oriented intersection pairing on the selected positive crossing of the pushed-off transverse core curves, from its pinned cap-product convention, and carry it through Layer 4.4's boundary-section computation.

**Checks.**

- `g = 1`: the word is `aba⁻¹b⁻¹`, `Π ≃ ℤ²`, and the native word `B⁻¹A⁻¹BA` has the same normal closure; a reading that forgot the order reversal would present `ℤ²` too, but for `g = 2` the words `[a₁,b₁][a₂,b₂]` and `[a₂,b₂][a₁,b₁]` are conjugate while `[b₁,a₁][a₂,b₂]` is not in the normal closure of the first, so the convention is detected in genus two.
- `ε_AT` for the core curves `a₁, b₁` of the first handle with the standard orientation is `+1`; reversing the orientation of `b₁` gives `−1`, and the attaching word changes to `a₁ b₁⁻¹ a₁⁻¹ b₁ …`.
- The abelianization of `⟨aᵢ, bᵢ | R⟩` is free of rank `2g`, as `H₁(Σ)` is; a wrong relator such as `∏ aᵢ² bᵢ²` would give torsion.

*Needs:* §0.1; ComplexCurveModuli D0 item 1; AlgebraicTopology Stage 1 item 4; AlgebraicTopology Stage 1 item 5; AlgebraicTopology Stage 6; §4.2.

### 4.4 The Euler number of a representation and the commutator formula

For a representation `ρ : Π → PSL₂(ℝ)` form the oriented flat circle bundle `E_ρ = (Σ̃ × ∂ℍ)/Π` under `(x, ξ) ↦ (γx, ρ(γ)ξ)`, with the fibre oriented as the positive boundary of `ℍ`; reduce the structure group to `SO(2)` by contractibility of `PSL₂(ℝ)/SO(2) ≃ ℍ`. Define the **Euler number** `e(ρ) := e(E_ρ)[Σ] ∈ ℤ` using CharacteristicClasses C2 item 2 for the Euler class and its section obstruction and C2 item 3 for the evaluation. Prove naturality: for a map `f : Σ' → Σ` of closed connected oriented surfaces, `e(f^* E_ρ) = deg(f) e(ρ)` and `f^* E_ρ = E_(ρ ∘ f_*)` up to basepoint-change conjugacy. Let `z` be the central deck transformation of the universal covering group of `PSL₂(ℝ)` corresponding to a positive `2π` rotation of `∂ℍ`. Prove the **commutator formula**: for every `ρ` and arbitrary lifts `ãᵢ, b̃ᵢ` of `ρ(aᵢ), ρ(bᵢ)`, `∏ᵢ [ãᵢ, b̃ᵢ] = z^(e(ρ))`. Route: identify the geometric opposite fundamental group `π₁(E_ρ)ᵐᵒᵖ` with the pullback central extension and prove the endpoint/deck convention of Layer 4.2 for it; the positive fibre loop is `z`; orient the polygon meridian `μ = ∂D` and the disc-section boundary `μ'` as `∂D`, not as the boundary of the punctured complement; prove in the peripheral torus group that `μ = μ' + e(ρ) λ` with `λ` the fibre, so that filling the disc kills `μ'` and gives the relation; since `z` is central, changing a lift by a power of `z` leaves the commutator product unchanged. With the chosen polygon orientation and positive fibre orientation the boundary section has fibre power `z^(2−2g)` for the uniformizing holonomy (Layer 4.5).

**Checks.**

- The trivial representation has `e = 0` and the commutator product of the identity lifts is `1 = z⁰`.
- Witness for the sign: for the uniformizing holonomy of a genus-two surface `e(ρ) = −2` under the stated conventions (`e = χ = 2 − 2g` with the fibre oriented as `∂ℍ`); the opposite fibre orientation gives `+2`, and the conjugate representation `ρ̄ = c ρ c⁻¹` by the reflection `c : z ↦ −z̄` has `e(ρ̄) = −e(ρ) = +2`, so the sign distinguishes a representation from its complex conjugate.
- Naturality on a degree-`k` unbranched cover `Σ' → Σ` of the genus-two surface: `e(ρ ∘ p_*) = k·(−2) = 2 − 2g'` with `g' = 1 + k`, consistent with the cover's own uniformizing holonomy.
- Milnor–Wood: `|e(ρ)| ≤ 2g − 2` for every representation into `Homeo⁺(S¹)`, hence for every `ρ`, with equality for the uniformizing holonomy; a representation with `|e| = 2g − 1` does not exist, and the roadmap asserts `e = 2 − 2g` only for the uniformizing holonomy and its `PSL₂(ℝ)`-conjugates.

*Needs:* CharacteristicClasses C2 item 2; CharacteristicClasses C2 item 3; §4.3; §4.2; FuchsianOrbifolds Layer 0 item 2.

### 4.5 Uniformization and the uniformizing holonomy

For every marked Riemann surface of genus `g ≥ 2` consume ComplexCurveModuli D0 item 4's existence, uniqueness, regularity and parameter estimates for the conformal curvature-`−1` metric with the convention `Δ⁺u + K₀ + e^(2u) = 0`; D0 item 4 supplies the compact-surface variational, coercivity and elliptic proof, and PDE Lane B items 8 to 10 supply the maximal-function, interpolation and Calderón–Zygmund estimates only where that argument invokes them. Prove that the canonical metric depends continuously on the marked structure in the charts of Layer 2. Consume RiemannianGeometry R4 item 7's Killing–Hopf identification of the universal cover of a complete curvature-`−1` surface with `ℍ` (through the comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` of Layer 4.1) and Tau Ceti's based universal cover and deck action; from the complete metric construct the developing map and the holonomy `ρ : Π → PSL₂(ℝ)` on the geometric group; prove that `ρ` is discrete, faithful, cocompact and orientation-compatible, unique up to conjugacy, and that its quotient surface is the marked hyperbolic surface. Identify the flat circle bundle `E_ρ` with the unit tangent circle bundle of the marked hyperbolic surface, preserving base and fibre orientations, and conclude from C2 item 3's `e(TΣ)[Σ] = χ(Σ) = 2 − 2g` that `e(ρ) = 2 − 2g`; this value is not asserted for arbitrary representations. This is the forward direction, independent of Layer 6.

The marked hyperbolic and holonomy carriers (Conventions, carriers 3 and 4) have the following API.

- Every marked Riemann surface has a unique conformal hyperbolic metric; the map to marked hyperbolic surfaces modulo isometry isotopic to the identity is a bijection.
- The holonomy class of a marked hyperbolic surface is a conjugacy class of discrete faithful cocompact representations with `e = 2 − 2g`.
- Both maps are continuous for the topologies of Layer 2 and of the representation variety, and natural under marking changes.

**Checks.**

- For `h₀` already of curvature `−1`, `u = 0` solves the equation: `0 + (−1) + 1 = 0`; with the opposite Laplacian sign the equation would read `−Δu + K₀ + e^(2u) = 0` and the uniqueness proof's monotonicity would fail.
- On a surface of genus two with a hyperbolic metric of area `4π`, Gauss–Bonnet gives `∫K = −4π = 2πχ`, consistent with `e(ρ) = −2`.
- The holonomy of the identity-marked surface and of the surface marked by a point push are conjugate; the holonomy of the surface marked by a Dehn twist is not conjugate by an element of `PSL₂(ℝ)` to the first unless the twist is realized by an isometry, which Layer 0.5 excludes for the twist.

*Needs:* ComplexCurveModuli D0 item 4; PDE Lane B item 8; PDE Lane B item 9; PDE Lane B item 10; RiemannianGeometry R4 item 7; Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv`; §4.4; §2.1; §4.1.

### Examples

- Genus two: the polygon with word `a₁b₁a₁⁻¹b₁⁻¹a₂b₂a₂⁻¹b₂⁻¹`, its regular octagon hyperbolic realization with angles `π/4`, whose side-pairing holonomy generates a cocompact group of Euler number `−2`.

### Dependencies

Layer 4 consumes Layers 0 to 2, Mathlib's `UpperHalfPlane.glAction`, Tau Ceti's hyperbolic space and covering-space declarations, AlgebraicTopology Stage 1 items 4 and 5 and Stage 6, CharacteristicClasses C2 items 2 and 3, ComplexCurveModuli D0 items 1 and 4, PDE Lane B, RiemannianGeometry R4 item 7 and FuchsianOrbifolds Layer 0 item 2. It supplies `Isom(ℍ) ≃ PGL₂(ℝ)`, isometry lifting, `Π`, the deck dictionary, the Euler number and the uniformizing holonomy to Layers 5, 6, 8, 9 and 10.

## Layer 5: Mapping classes, automorphisms and stabilizers

The theorems of 5.1 to 5.4 are stated and proved for every closed orientable surface; the genus-at-least-two case uses the hyperbolic metric, the torus and the sphere are the linear cases named at each step.

### 5.1 Asphericity and realization of isomorphisms by maps

For a closed oriented surface of genus `g ≥ 2` use the hyperbolic universal cover of Layer 4.5 to prove it is a `K(π₁, 1)`. For an isomorphism `α : Π(Σ) ≃ Π(Σ')` of geometric groups (native isomorphisms are converted by inversion) construct a based map `f : Σ → Σ'` inducing `α`: identify the one-skeleton with a wedge of circles and its fundamental group with the free group (AlgebraicTopology Stage 1 item 5), choose the map on generators, extend across the relator two-cell using the defining relation, and use `π_n(Σ') = 0` for `n ≥ 2` to prove uniqueness up to based homotopy; the inverse isomorphism gives a homotopy inverse. The same construction applies to the torus with `π₁ = ℤ²` and the sphere with trivial `π₁`, and to self-maps.

**Checks.**

- For the torus and `α` the shear matrix, the constructed map is the linear shear, a diffeomorphism; for the sphere the only isomorphism is the identity and the constructed map is homotopic to the identity.
- For an inner automorphism the constructed map is homotopic to the identity through a point push, consistent with Layer 5.2's realization.
- The map constructed for `α` and for `α` composed with an orientation-reversing isomorphism have degrees `+1` and `−1`; degree is detected by the action on `H₂`.

*Needs:* §4.5; AlgebraicTopology Stage 1 item 5; §4.3.

### 5.2 Dehn–Nielsen–Baer realization by the Douady–Earle extension

An isomorphism of cocompact surface groups `α : Π ≃ Π'` gives an equivariant quasi-isometry of their hyperbolic universal covers: extend the orbit map between the Cayley graphs by the cocompact orbit maps into each `ℍ`. Prove that its boundary extension `φ : S¹ → S¹` is a homeomorphism with `φ ∘ γ = α(γ) ∘ φ` for every `γ` in the source group. Apply the Douady–Earle barycentric extension `E(φ)`: for every homeomorphism of the circle it is a homeomorphism of the closed disc whose restriction to the open disc is a real-analytic diffeomorphism (Douady–Earle 1986, Theorem 1), and it is conformally natural, `E(g ∘ φ ∘ h) = g ∘ E(φ) ∘ h` for Möbius automorphisms `g, h` of the disc (Douady–Earle 1986, Theorem 1). Prove here, from the definition of the conformal barycentre as the unique `w` with `∫ (ζ − w)/(1 − w̄ ζ) dμ(ζ) = 0` for the harmonic measure pushed forward by `φ`, that the same naturality holds for the anticonformal involution `ζ ↦ ζ̄` and hence for the full group of conformal and anticonformal automorphisms; quasisymmetry of `φ` is not needed for any of this. Naturality gives `E(φ) ∘ γ = α(γ) ∘ E(φ)`, including for orientation-reversing `φ`, so `E(φ)` descends to a real-analytic diffeomorphism `Σ → Σ'` inducing the prescribed outer automorphism; no separate smoothing step is used. In the based form this is `exists_diffeomorph_mapOfEq_eq`: for a smooth closed connected orientable surface, every automorphism of `π₁(Σ, x₀)` is induced by a diffeomorphism fixing `x₀` (inner automorphisms by point pushing along a loop, composed with the outer realization; the torus by the linear diffeomorphism of `ℝ²/ℤ²` fixing the origin, since every automorphism of `ℤ²` is a matrix in `GL₂(ℤ)`; the sphere by the identity). This proves surjectivity of `Mod±(Σ) → Out(Π)` and of its restriction `Mod⁺(Σ) → Out⁺(Π)`; `Out(Π)` is transported from the native `Out(π₁ⁿᵃᵗ)` through `ι`, and the transport identifies the inner-automorphism subgroups.

**Checks.**

- For `α` the identity the boundary map is the identity and `E(id) = id`; for `α` conjugation by `γ`, `φ = γ` on `S¹` and `E(γ) = γ`, so the realized diffeomorphism is the identity of the quotient and the outer class is trivial.
- For the torus the automorphism `(1,0) ↦ (1,1), (0,1) ↦ (0,1)` is induced by the shear `(x, y) ↦ (x, x + y)`, which fixes the image of `0`; this is the linear case the hypothesis-free statement needs.
- The naturality check for `c(ζ) = ζ̄`: the harmonic measure of the disc at `w` pushed forward by `c` is the harmonic measure at `w̄`, and the defining integral at `w̄` for `c_* μ` is the conjugate of the integral at `w` for `μ`, so `E(c ∘ φ ∘ c) = c ∘ E(φ) ∘ c`; a naturality asserted only for Möbius transformations would not descend an orientation-reversing `φ`.

*Needs:* §5.1; §4.5; §4.2; Mathlib `FundamentalGroup.mapOfEq`.

### 5.3 Smale's theorems on the disc and the sphere

Prove Smale's theorem that the group `Diff_c(ℝ²)` of compactly supported diffeomorphisms of the plane, equivalently the group of diffeomorphisms of the closed disc that are the identity near the boundary, is contractible (Smale 1959, Theorem B, for the square, whose interior is diffeomorphic to the open disc so that conjugation identifies the two groups; the contraction is Theorem 4 there: first straighten the vertical foliation by Smale's Lemma 2, then contract fibrewise by the affine homotopy on each vertical line). Prove that the inclusion of that group into Tau Ceti's `TauCeti.DiscDiff 2`, the diffeomorphisms of the closed disc fixing the boundary pointwise, is a homotopy equivalence: a diffeomorphism fixing `∂D²` pointwise is isotopic rel `∂D²` to one that is the identity on a collar, by straightening its normal derivative along the boundary with a collar isotopy, and the straightening is canonical enough to be done in families. This gives `contractibleSpace_discDiff_two`, and in particular `π₀ Diff(D², ∂) = 0` and its rel-collar form `π₀ Diff(D², rel collar) = 0`. Prove Smale's theorem on the sphere, that `Diff⁺(S²)` deformation retracts onto `SO(3)` (Smale 1959, Theorem A and Theorem 6), by the evaluation argument: the map `Diff⁺(S²) → Fr⁺(S²)` sending `f` to the polar retraction of `df(x₀)` applied to a fixed frame at `x₀` is a fibration with fibre the diffeomorphisms fixing `x₀` and its frame, which deformation retract through the disc theorem onto diffeomorphisms that are the identity near `x₀`, contractible by the disc result; `Fr⁺(S²) ≃ SO(3)` and the rotations give a section (`TauCeti.orthogonalToDiffSphere 2 ∞` restricted to `SO(3)`). In particular `π₀ Diff⁺(S²) = 0`, and by Layer 0.2 every orientation-preserving diffeomorphism of `S²` is smoothly isotopic to the identity. Conclude the full-group form `exists_homotopyEquiv_orthogonalToDiffSphere_two`: Tau Ceti's reference inclusion `TauCeti.continuousOrthogonalToDiffSphere 2 ∞` of `O(3)` into `Diff(S²)` is a homotopy equivalence, because a reflection `r ∈ O(3) ∖ SO(3)` carries the deformation retraction of `Diff⁺(S²)` onto `SO(3)` to one of the other component `r · Diff⁺(S²)` onto `r · SO(3)`.

**Checks.**

- The rotation by angle `2π` of the disc, spliced to the identity near the boundary, is the final map of the smooth isotopy of rotations by `2πt` spliced the same way; its class in `π₀ Diff(D², rel collar)` is trivial, as the theorem says, and the loop of rotations is null in `π₁` by contractibility.
- A diffeomorphism of the disc fixing the boundary pointwise and equal to the reflection in a diameter near the centre reverses orientation on an open set while preserving it near the boundary, which is impossible for a diffeomorphism; this is why `DiscDiff 2` consists of orientation-preserving maps and no orientation hypothesis is stated.
- The antipodal map of `S²` is not in `Diff⁺(S²)`; the theorem gives `π₀ Diff(S²) = ℤ/2`, matching §5.4a's `mcg_sphere_full`; a claim `π₀ Diff(S²) = 0` for the full group would be false.
- Dimension dependence: `Diff(D⁴, ∂)` is not contractible by Watanabe's theorem, whose statement the pin records as the proposition `TauCeti.WatanabeTheorem` and from which it derives the non-contractibility, so the proof uses dimension two through the straightening of foliations.

*Needs:* Tau Ceti `TauCeti.DiscDiff`; Tau Ceti `TauCeti.orthogonalToDiffSphere`; Tau Ceti `TauCeti.continuousOrthogonalToDiffSphere`; Tau Ceti `Diffeomorph.weakWhitneyTopology`; GeometricTopology Layer 1; §0.2; §0.3.

### 5.3a Smoothing isotopies between diffeomorphisms

Prove `smoothIsotopic_of_isotopic`: two diffeomorphisms `φ, ψ : M → N` of compact smooth surfaces, with or without boundary and orientable or not, that are isotopic through homeomorphisms satisfy `ψ = φ ∘ Φ.final` for a diffeotopy `Φ` of `M` (Tau Ceti's `TauCeti.Diffeotopy` for the model `𝓡∂ 2`). By Layer 0.2 this says that `π₀ Diff(M)` injects into the isotopy classes of homeomorphisms, and with `exists_isotopic_diffeomorph` (§0.0e) the two are in bijection. Route: put `h = φ⁻¹ ∘ ψ`, a diffeomorphism of `M` isotopic to the identity through homeomorphisms `F_t`, and fix a smooth triangulation of `M` whose closed vertex stars lie in chart discs, with `δ` small against the Lebesgue number of the cover by stars; the triangulation is given by Whitehead's theorem (GeometricTopology's smoothing-and-triangulation comparison, item 1), and on the closed orientable surfaces of this roadmap by the compatible PL structure of Layer 0.1. **Reduction to small diffeomorphisms**: by uniform continuity of `F` and of its inverses choose `0 = t_0 < ⋯ < t_k = 1` with every `F_(t_(j+1)) ∘ F_(t_j)⁻¹` moving each point less than `δ`; approximate each `F_(t_j)`, `0 < j < k`, within `δ` by a diffeomorphism `d_j` (isotopy to a diffeomorphism in its uniform form, §0.0e), and put `d_0 = id`, `d_k = h`; then `h` is the product of the diffeomorphisms `d_j⁻¹ ∘ d_(j+1)`, each moving every point less than `3δ`. **The local lemma**: a diffeomorphism `g` of `M` moving every point less than `3δ` is smoothly isotopic to the identity. Move each vertex back from `g(v)` to `v` by a point-pushing isotopy along a short segment in a chart (Layer 0.3), a boundary vertex along the boundary inside a collar chart. For each edge `e`, the arcs `e` and `g(e)` then have the same endpoints and lie in one chart disc; make them transverse away from the endpoints, with distinct tangent directions at the endpoints, by a small isotopy supported near `g(e)`. While they meet at an interior point, an innermost pair of subarcs bounds a disc in the chart (Tau Ceti's Schoenflies theorem `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`), a smooth disc with two corners, and an isotopy supported near it pushes `g(e)` across it and lowers the number of intersection points; once the interiors are disjoint, `e ∪ g(e)` bounds such a disc, and an isotopy across it carries `g(e)` onto `e` relative to the endpoints. Treating the edges one at a time, with supports disjoint from the edges already treated, makes `g` the identity on the 1-skeleton (boundary edges are already carried onto themselves); a collar isotopy along the 1-skeleton makes it the identity near the 1-skeleton; on each closed triangle `g` is then a diffeomorphism of a disc equal to the identity near the boundary, smoothly isotopic to the identity relative to a collar by `contractibleSpace_discDiff_two` (Layer 5.3). Compose the isotopies, and convert the resulting paths of diffeomorphisms into diffeotopies by Layer 0.2.

**Checks.**

- On `S²` a rotation and the identity are isotopic through rotations, already a smooth isotopy; the antipodal map is a diffeomorphism that is not isotopic to the identity through homeomorphisms, since it reverses the orientation of §0.0c, so the theorem says nothing about it, in agreement with `π₀ Diff(S²) = ℤ/2` of Layer 5.3.
- The dimension is used: on `S⁶` every orientation-preserving homeomorphism is isotopic to the identity by Alexander's trick, while the orientation-preserving diffeomorphisms of `S⁶` fall into `28` smooth isotopy classes, the group `Θ₇` of Kervaire and Milnor, so the analogue fails there; the proof spends Smale's disc theorem, a two-dimensional fact.
- With `exists_isotopic_diffeomorph` the theorem identifies `Mod±(Σ)` with the isotopy classes of homeomorphisms of `Σ`, the bijection that §5.3b's `MappingClassGroupSmooth.toTop_bijective` records; surjectivity alone would leave the kernel of that comparison undetermined.

*Needs:* §0.0c; §0.0e; §0.1; §0.2; §0.3; §5.3; GeometricTopology smoothing-and-triangulation comparison item 1; Tau Ceti `TauCeti.Diffeotopy`; Tau Ceti `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`.

### 5.3b The smooth and the topological mapping class groups

Prove `MappingClassGroupSmooth.toTop_bijective`: for a compact smooth surface, with or without boundary and orientable or not, the forgetful homomorphism from the smooth to the topological mapping class group (§0.0h) is an isomorphism. Surjectivity is `MappingClassGroupSmooth.toTop_surjective` (§0.0h). Injectivity: a diffeomorphism `f` whose underlying homeomorphism is isotopic to the identity is `Φ.final` for a diffeotopy `Φ`, by `smoothIsotopic_of_isotopic` (§5.3a) applied to the identity and `f`. On a surface carrying a PL structure compatible with its smooth structure, as `Σ` does with the triangulation transported in Layer 0.1, both halves use that structure and Whitehead's theorem does not enter. Prove the relative form in the same way: the diffeomorphisms fixing the boundary pointwise, modulo diffeotopies fixing it pointwise, map bijectively onto `MappingClassGroupRel M`, surjectively by `exists_isotopicRel_diffeomorph` (§0.0e) and injectively by the route of §5.3a run relative to the boundary, whose reduction step uses the relative approximation of §0.0e and whose local lemma moves only interior vertices and edges, the boundary ones being fixed already, so that every isotopy it builds fixes the boundary pointwise. For a closed oriented surface `Σ`, composed with Layer 3.1's identification of `Mod±(Σ)` with `MappingClassGroupSmooth Σ`, this identifies `Mod±(Σ)` with `MappingClassGroupFull Σ` and `Mod⁺(Σ)` with `MappingClassGroupPlus Σ o` for the chosen orientation `o`, since a mapping class preserves `o` exactly when its diffeomorphism representatives do (§0.0c, §0.0e).

**Checks.**

- On `S²` the antipodal map is a diffeomorphism representing the nontrivial class of `π₀ Diff(S²) = ℤ/2` (Layer 5.3) and of the topological group (§5.4a); the bijection matches the two descriptions of that class.
- On the annulus the twist of §0.0h is a diffeomorphism fixing the boundary, of infinite order in the relative smooth group and in `MappingClassGroupRel`, and smoothly isotopic to the identity when the boundary may move; the relative comparison is a separate statement from the absolute one.
- Surjectivity alone would leave open that one topological class contains diffeomorphisms that are not smoothly isotopic; on `S⁶` this happens (§5.3a), and the injectivity spends Smale's disc theorem through §5.3a.

*Needs:* §0.0h; §5.3a; §0.0c; §0.0e; §0.1; §3.1.

### 5.4 The smooth Baer–Epstein kernel theorem

Prove `baer_epstein_smooth`: a diffeomorphism of a closed orientable surface homotopic to the identity through continuous maps is the final slice of a smooth diffeotopy. Route: read the `𝓡 2` atlas of the surface as a `𝓡∂ 2` atlas with empty boundary, as in Layer 0.1; Epstein's theorem `isotopic_of_homotopic_closedSurface` (§0.0d) on the underlying homeomorphism gives a topological isotopy to the identity; `smoothIsotopic_of_isotopic` (§5.3a), applied to the identity and the diffeomorphism with the transported compatible triangulation of Layer 0.1 as its smooth triangulation, gives a diffeotopy ending at the diffeomorphism, which Layer 0.2 identifies with a path in `Diff(Σ)`. This is the smooth kernel adapter to the topological theorem, not a second proof of Epstein's theorem; it is uniform in the genus, the sphere case agreeing with Layer 5.3. Verify the closedness hypothesis explicitly; for surfaces with boundary use the relative version `isotopicRel_of_homotopicRel` with its homotopy-rel-boundary hypothesis, never the false absolute statement on the disc. Conclude that `Mod±(Σ) → Out(Π)` is injective, hence by Layer 5.2 an isomorphism, with `Mod⁺(Σ) ≃ Out⁺(Π)`, the Dehn–Nielsen–Baer theorem (Farb–Margalit, Chapter 8).

**Checks.**

- A Dehn twist is not homotopic to the identity (it acts nontrivially on `H₁` for a nonseparating curve, and on `π₁` for a separating one), so the kernel theorem does not trivialize it; the theorem is used only on diffeomorphisms homotopic to the identity.
- On the disc the identity and the reflection are homotopic through continuous maps but not isotopic through homeomorphisms; the closed-surface hypothesis of the theorem excludes this, and the relative version requires the homotopy to fix the boundary.
- For the torus the kernel of `Mod±(T²) → GL₂(ℤ)` is trivial: a diffeomorphism acting trivially on `H₁` is homotopic to the identity, hence isotopic; a definition of `Mod±` by `Diff(T²)/Diff_0` with `Diff_0` the kernel of the homology action would then agree, but only because of this theorem.

*Needs:* §0.0d; §5.3a; §0.1; §0.2; §5.2.

### 5.4a The mapping class groups of the sphere and the torus

Prove `mcg_sphere_full`: the mapping class group of the round sphere `S²` has two elements, the class of a reflection being the nontrivial one, and its orientation-preserving subgroup `MappingClassGroupPlus` is trivial for either orientation. Route: by §5.3b, with the `𝓡 2` atlas of `S²` read as an `𝓡∂ 2` atlas with empty boundary, the group is `MappingClassGroupSmooth S²`, which is `π₀ Diff(S²)` by Layer 0.2; `exists_homotopyEquiv_orthogonalToDiffSphere_two` (§5.3) identifies it with `π₀ O(3) = ℤ/2`, and the identity component `SO(3)` is the orientation-preserving part. Prove `mcg_torus_full` (Farb–Margalit, §2.2): for the torus `T² = (ℝ/ℤ)²`, the action on `π₁(T², 0) = ℤ²`, in the basis of the two circle factors, is an isomorphism of the mapping class group with `GL₂(ℤ)` carrying the class of the linear diffeomorphism induced by `A` to `A`, and it restricts to an isomorphism of the orientation-preserving subgroup with `SL₂(ℤ)`. Route: by §5.3b it suffices to treat smooth isotopy classes. As `π₁(T²)` is abelian, its outer automorphism group is `Aut(ℤ²) = GL₂(ℤ)` and a change of basepoint acts trivially, so the action is well defined on classes of diffeomorphisms that move `0`. It is surjective by the torus case of `exists_diffeomorph_mapOfEq_eq` (§5.2), each `A` being induced by its linear diffeomorphism, and injective because a diffeomorphism acting trivially on `π₁` of the aspherical torus is homotopic to the identity (§5.1), hence the final slice of a diffeotopy by `baer_epstein_smooth` (§5.4). The linear diffeomorphism of `A` has degree `det A`, so the orientation-preserving classes are those of `SL₂(ℤ)`.

**Checks.**

- The antipodal map and the reflection of `S²` in a plane both represent the nontrivial class: their composite is the rotation by `π` about the normal of the plane, in `SO(3)`.
- On the torus the shear `(x, y) ↦ (x, x + y)` goes to `[[1, 0], [1, 1]]`; the involution `(x, y) ↦ (−x, −y)` goes to `−I`, of determinant `1`, a nontrivial orientation-preserving class fixing four points; the swap `(x, y) ↦ (y, x)` has determinant `−1` and lies outside the orientation-preserving subgroup.
- The orientation-preserving subgroup has index two in the full group for both surfaces, `{1} ⊂ ℤ/2` and `SL₂(ℤ) ⊂ GL₂(ℤ)`; a computation of the full group from orientation-preserving maps alone would miss the reflection classes.

*Needs:* §5.3b; §5.3; §5.2; §5.4; §5.1; §0.2; §0.0h.

### 5.5 Curve systems and the smooth adapters for the Alexander method

On the polygon model construct the admissible Alexander system: a chain of `2g + 1` essential pairwise non-isotopic simple closed curves, consecutive curves meeting once transversely, all other pairs disjoint, no triple intersections and two open discs as complement; compute that its regular neighbourhood has Euler characteristic `−2g`, genus `g` and two boundary circles. Own the three curve and arc statements that the Alexander method needs, in smooth form on `Σ`, with the piecewise-linear curve and arc theorems of §0.0d as the input and the PL-to-smooth comparison of §0.0e and §5.3a as the bridge. The **bigon criterion**: two transverse simple closed curves on `Σ` are in minimal position, their number of intersection points equal to the geometric intersection number of their isotopy classes, if and only if no component of the complement is an embedded bigon, a disc bounded by one arc of each curve (Farb–Margalit, Proposition 1.7); route: lift to the universal cover `ℍ` of Layer 4.5 and compare with the intersection count of the geodesic representatives. **Homotopy implies isotopy** for curves and arcs: two homotopic essential simple closed curves are ambient isotopic by an isotopy with compact support, and two proper arcs homotopic relative to their endpoints are ambient isotopic relative to the boundary (the two-sided curve and proper arc theorems of §0.0d, Epstein 1966, Theorems 2.1 and 3.1, stated for piecewise-linear embeddings whose image is two-sided and does not bound a disc, which on orientable `Σ` is every essential simple closed curve); pass from the piecewise-linear to the given smooth curves by the compact relative PL approximation theorem of §0.0a, `exists_isotopic_diffeomorph` of §0.0e and `smoothIsotopic_of_isotopic` of §5.3a, retaining the crossing neighbourhoods, and convert the ambient isotopy into a diffeotopy by Layer 0.2. The **alignment of admissible systems**, the Alexander method (Farb–Margalit, Proposition 2.8): two finite admissible systems with matching isotopy classes, incidences and cyclic orders at every vertex are carried one onto the other by a diffeomorphism smoothly isotopic to the identity; route: align the curves one at a time by the previous statement and Layer 0.3's isotopy extension, align the crossing neighbourhoods using the cyclic orders, extend across the complementary discs by Layer 5.3's rel-collar disc theorem, and arrange the identity on boundary collars; matching intersection counts alone are insufficient. These are the smooth marked-system adapters consumed by Layer 7; §0.0d owns the piecewise-linear curve, arc and homeomorphism statements, and this subsection their smooth forms on `Σ`.

**Checks.**

- On the torus two curves of classes `(1,0)` and `(0,1)` meet once and bound no bigon; two curves of classes `(1,0)` and `(1,0)` pushed to meet twice bound a bigon, and the minimal-intersection criterion removes it.
- The regular neighbourhood of the chain of `2g + 1` curves has `χ = (2g + 1)·0 − 2g = −2g` (one vertex per crossing counted with the four incident edge-ends); with `2g` curves the neighbourhood has one boundary circle and the complement is one disc, not two.
- Two systems with the same intersection counts but different cyclic orders at a vertex are not isotopic; the alignment statement carries the cyclic order.
- Epstein's hypothesis is used: on the orientable `Σ` a simple closed curve bounding a disc and its reversal are homotopic but not isotopic through embeddings, since the isotopy would have to reverse the boundary orientation of the disc (Epstein 1966, remark after Theorem 2.1); the statements are for essential curves, which bound no disc.

*Needs:* §0.0a; §0.0d; §0.0e; §5.3a; §0.2; §0.3; §4.3; §4.5; §5.3.

### 5.6 Stabilizers and the Macbeath–Singerman finiteness

Identify the point stabilizers of Layer 3.2's action: the `Mod⁺` stabilizer of `[(X, m)]` is the conformal automorphism group `Aut(X)` and the `Mod±` stabilizer is the group of conformal and anticonformal isometries of the unique hyperbolic metric. Injectivity of the map from isometries to mapping classes is Layer 0.5; surjectivity descends the isometry induced by a stabilizing marked representative. Thus all point stabilizers are finite (ComplexCurveModuli D0 item 5). Layer 8.5 proves that the kernel of the action is trivial for `g ≥ 3` and is the order-two subgroup generated by the hyperelliptic class for `g = 2`. For `Inn(Π) ≤ H ≤ Aut(Π)` define the action of `H` through its image in `Out(Π) ≃ Mod±(Σ)` and prove the Macbeath–Singerman implication: a nonempty fixed set implies `[H : Inn(Π)] < ∞`, not that `H` is finite; the proof is the stabilizer identification and finiteness.

**Checks.**

- The hyperelliptic involution stabilizes every point of `Teich(S_2)`; a stabilizer computed in `Diff(Σ)` rather than `Mod` would contain only the identity near a generic point, since no diffeomorphism other than an isometry fixes a marked structure on the nose.
- `H = Aut(Π)` has `[H : Inn] = |Out(Π)| = ∞`, and its fixed set is empty; `H = Inn(Π)` has index one and fixes everything.
- The stabilizer in `Mod±` of a point with a real structure (a curve defined over `ℝ`) contains an orientation-reversing class, so `Mod±` stabilizers can be strictly larger than `Mod⁺` stabilizers.

*Needs:* §3.2; §0.5; ComplexCurveModuli D0 item 5; §5.4.

### Examples

- Genus two: the Dehn–Nielsen–Baer isomorphism sends the hyperelliptic class to the outer automorphism acting as `−1` on the abelianization; the Smale disc theorem applied to the two complementary discs of the Alexander chain of five curves.

### Dependencies

Layer 5 consumes Layers 0, 3 and 4, GeometricTopology Layer 1 and its smoothing-and-triangulation comparison item 1, AlgebraicTopology Stage 1 item 5, ComplexCurveModuli D0 item 5 and Tau Ceti's `DiscDiff` and `orthogonalToDiffSphere`. It supplies realization, the kernel theorem, the disc and sphere theorems, the smoothing of isotopies, the comparison of the smooth and topological mapping class groups with the sphere and torus cases, the curve adapters and the stabilizer identification to Layers 6 to 10.

## Layer 6: The converse marked representation comparison

### 6.1 From representations to marked surfaces

After Layer 5, let `ρ : Π → PSL₂(ℝ)` be discrete, faithful and cocompact with `e(ρ) = 2 − 2g`. Its quotient `X = ℍ/ρ(Π)` is a closed oriented hyperbolic surface (FuchsianOrbifolds Layer 1 with no elliptic points, since `Π` is torsion-free). The quotient map and `ρ` give a based homotopy equivalence `f : Σ → X` by Layer 5.1; realize it by a diffeomorphism by Layer 5.2. By Layer 4.5 the holonomy of `X` has Euler number `2 − 2g`, and Layer 4.4's naturality gives `e(ρ) = deg(f)(2 − 2g)`, so `deg(f) = +1`: the marking is orientation preserving and its holonomy is conjugate to `ρ`. Prove that this construction and Layer 4.5's holonomy are inverse on marked equivalence classes, continuous in the representation and deformation topologies, and compatible with marking changes. This closes the comparison of the four carriers of Layer 1.

**Checks.**

- For `ρ` the conjugate `c ρ c⁻¹` by the reflection `c`, `e = 2g − 2`, the hypothesis fails, and the constructed `f` has degree `−1`: the conjugate representation corresponds to the conjugate marked surface `(X̄, m)`, consistent with Layer 3.2.
- Two representations differing by conjugation in `PSL₂(ℝ)` give the same marked surface; differing by conjugation in `PGL₂(ℝ)` by a reflection they give conjugate surfaces, distinct points when `X` has no anticonformal automorphism.
- The composite holonomy-of-construction is conjugate to `ρ` by an element of `PSL₂(ℝ)` and not merely of `PGL₂(ℝ)`, by the degree computation.

*Needs:* §5.1; §5.2; §4.4; §4.5; FuchsianOrbifolds Layer 1; §1.2.

### Examples

- The regular-octagon group of genus two and its marked surface; the representation obtained by conjugating by the reflection is the conjugate marked surface.

### Dependencies

Layer 6 consumes Layers 1, 4 and 5 and FuchsianOrbifolds Layer 1. It supplies the holonomy carrier as a model of `Teich(Σ)` to Layers 7, 8 and 10.

## Layer 7: Fenchel–Nielsen coordinates and the Teichmüller metric

### 7.1 Pants decompositions, filling collections and marked length compactness

For every closed oriented `Σ` of genus `g ≥ 2` choose a pants decomposition of `3g − 3` curves and an oriented seam and transversal convention, using ComplexCurveModuli D0 item 1's marked and collared cut-system refinement on Layer 0.1's standard model. Prove the simple-geodesic representative and disjointness results from Layer 5.5's bigon and homotopy-implies-isotopy adapters: every essential simple closed curve has a unique simple closed geodesic representative, disjoint curves have disjoint representatives (Farb–Margalit, §1.2 and Chapter 1). Choose a finite **strongly filling** collection `C` containing all cuffs and, for every cuff `β`, a transverse curve `γ ∈ C` with `i(β, γ) > 0`, such that the complement of `C` is a union of discs. Prove **marked filling-length compactness** in Fenchel–Nielsen coordinates: a bound `ℓ_γ ≤ B` for all `γ ∈ C` bounds the cuff lengths above; if `γ` crosses a cuff of length `ℓ` the collar lemma gives `B ≥ 2 asinh(1/sinh(ℓ/2))`, hence `ℓ ≥ 2 asinh(1/sinh(B/2))`; the right-angled hexagon identities bound seam lengths on this compact cuff interval; for each transverse curve prove the collar foot-displacement inequality, that when the cuff lengths range over the compact interval and its length is at most `B` the lifted twist displacement is bounded by constants depending only on the interval and the fixed pants arcs; the constants come from the collar metric and the hexagon bounds. This gives a compact box for all twists and proves that the sublevel set `{ℓ_γ ≤ B for all γ ∈ C}` is compact; compactness follows from the full set of bounds, not from one curve.

**Checks.**

- The collar width `w(ℓ) = asinh(1/sinh(ℓ/2))` satisfies `w(ℓ) → ∞` as `ℓ → 0`; a crossing curve of length at most `B` therefore forces `ℓ ≥ 2 asinh(1/sinh(B/2)) > 0`, and for `B = 2 asinh 1` the bound is `ℓ ≥ 2 asinh(1/sinh(asinh 1)) = 2 asinh 1`.
- The pants decomposition alone is not filling: the Dehn twist about a cuff preserves all cuff lengths, so the sublevel set of the cuff lengths alone is noncompact; the transverse curves are needed.
- In genus two a pants decomposition has three cuffs and a strongly filling collection can be taken with six curves; a collection whose complement contains an annulus is not filling.

*Needs:* ComplexCurveModuli D0 item 1; ComplexCurveModuli D6 item 2; §5.5; §4.5; §0.1.

### 7.2 The twist coordinate

Define cuff lengths `ℓ_i > 0`. Fix an oriented collar `(r, θ) ∈ [0,1] × (ℝ/ℤ)` of the `i`-th cuff with `dr ∧ dθ` positive, left seam `r = 0`, right seam `r = 1`, and the positive twist `τ_i(r, θ) = (r, θ + φ(r))` with `φ` increasing from `0` to `1`. Choose a marked transversal `β_i` crossing left to right. Define the **twist displacement** `t_i ∈ ℝ` from the homotopy class rel seams of the marked image of `β_i`, lifted to the universal cover of the cuff: right foot minus left foot measured in the positive angular direction, with the integer lift fixed by the marking. Under Layer 3.2's left action `f ⋅ (X, m) = (X, m ∘ f⁻¹)`, the transversal after applying `τ_i` is `m ∘ τ_i⁻¹ ∘ β_i`; `τ_i⁻¹` changes the left-to-right lift by `−1`, so `τ_i` changes `t_i` by `−ℓ_i`; verify this by cutting and regluing. The twist is arclength-valued in `ℝ`, neither divided by the cuff length nor reduced modulo an integer. Establish the marked-pants/twist comparison: carry the topological pants decomposition and transversals from the marked refinement to their geodesic representatives and prove that the twist read from the lifted seam-foot displacement equals the collar definition, naturally under marking changes and across each elementary pants move (ComplexCurveModuli D6 item 2 for the geodesic cuts and collars).

**Checks.**

- Witness for the sign: on a genus-two surface with cuff `β₁` of length `ℓ₁` and transversal `β` crossing it once, the positive Dehn twist `τ₁` sends the point `(ℓ₁, t₁, …)` to `(ℓ₁, t₁ − ℓ₁, …)`; a right-action convention `(X, m ∘ τ₁)` would give `t₁ + ℓ₁`.
- `τ_i²` changes `t_i` by `−2ℓ_i`, and `τ_i⁻¹` by `+ℓ_i`; a coordinate reduced modulo `ℓ_i` would not see the twists at all, and one divided by `ℓ_i` would be shifted by `−1`.
- The twist of the identity-marked surface built in Layer 7.3 with all twists zero is zero on every cuff: the seams match across each cuff.

*Needs:* §7.1; §3.2; ComplexCurveModuli D6 item 2.

### 7.3 The Fenchel–Nielsen homeomorphism

Prove that the **Fenchel–Nielsen map** `Teich(Σ) → (0,∞)^(3g−3) × ℝ^(3g−3)`, `[(X, m)] ↦ ((ℓ_i), (t_i))`, is a homeomorphism (Imayoshi–Taniguchi, §3.2; Farb–Margalit, §10.6; Hubbard 2006, Chapter 7). For the inverse, construct the hyperbolic pair of pants with three prescribed cuff lengths by the right-angled hexagon identities, glue along cuffs with the prescribed arclength twists, and recover the coordinates from the unique geodesic cuffs, seams and lifted foot displacements. Prove continuity in both directions, derive the elementary pants-move transition maps from the hexagon identities, and record that these are real-analytic transition maps, not holomorphic charts. Prove contractibility of `Teich(Σ)` by `((ℓ_i), (t_i)) ↦ (((1−s)ℓ_i + s), ((1−s)t_i))`, `s ∈ [0,1]`, which stays in the positive cone and is continuous.

**Checks.**

- The dimension count `2(3g − 3) = 6g − 6` agrees with the real dimension of the complex manifold of Layer 2.4; for `g = 2` the coordinates are three lengths and three twists.
- The hexagon with alternate sides `ℓ₁/2, ℓ₂/2, ℓ₃/2` exists and is unique for every triple of positive lengths (`cosh c = (cosh a cosh b + cosh γ)/(sinh a sinh b)` with the right-angle condition), so the inverse map is defined on all of `(0,∞)^(3g−3)`; a formula with `cos` in place of `cosh` has no solution for large lengths.
- The point with all twists `t_i = 0` and all lengths equal is fixed by the orientation-reversing involution reflecting each pair of pants across its seams; the point with one twist `t_1 ≠ 0` is not fixed, since reflection negates twists.

*Needs:* §7.2; §7.1; §2.3.

### 7.4 Wirtinger derivatives, quasiconformal maps and the Beltrami equation

Define the classical Wirtinger derivatives of a real-differentiable map `f` of an open set of `ℂ`, written in words as the z-derivative `(f_x − i f_y)/2` and the z-bar-derivative `(f_x + i f_y)/2`, and prove that `f` is complex differentiable at a point if and only if its z-bar-derivative there vanishes; these definitions are deleted in favour of Mathlib's the day Mathlib acquires them. Define the weak (Sobolev) Wirtinger derivatives of a `W^(1,2)_loc` map and prove that they agree almost everywhere with the classical ones at points of differentiability. Define an orientation-preserving **quasiconformal map** as a `W^(1,2)_loc` homeomorphism whose weak derivatives satisfy the Beltrami equation `f_z̄ = μ f_z` almost everywhere for a measurable `μ` with `‖μ‖_∞ < 1`, with dilatation `K(f) = (1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`; prove chart invariance, so that the notion makes sense on Riemann surfaces, and the composition, inverse and dilatation laws `K(f ∘ g) ≤ K(f) K(g)`, `K(f⁻¹) = K(f)` (Imayoshi–Taniguchi, Chapter 4). Prove the **measurable Riemann mapping theorem** with holomorphic parameter dependence, normalization and uniqueness (Ahlfors–Bers 1960, Theorem 1 and the parameter theorem; Imayoshi–Taniguchi, §4.4). Route: prove that the planar Beurling transform is an `L²` isometry by its Fourier multiplier of modulus one, consuming Mathlib's Plancherel; PDE Lane B item 10 gives Calderón–Zygmund `Lᵖ` bounds and item 9 gives Riesz–Thorin interpolation, hence `‖S‖_p → 1` as `p → 2`; solve for small `‖μ‖_∞` by the Neumann series and extend to `‖μ‖_∞ < 1` by finite composition. Prove the **normal-family compactness** theorem for normalized `K`-quasiconformal self-maps of the sphere, with equicontinuity of the maps and their inverses and preservation of homeomorphisms in limits, under the stated normalization.

**Checks.**

- For `f(z) = z + a z̄` with `|a| < 1`, the z-bar-derivative is `a`, the z-derivative is `1`, `μ = a` and `K = (1 + |a|)/(1 − |a|)`; for `|a| ≥ 1` the map is not a homeomorphism, so the condition `‖μ‖_∞ < 1` is used.
- For a holomorphic `f` the z-bar-derivative is zero and `K = 1`; for `f(z) = z̄`, the z-derivative is zero, the z-bar-derivative is one, and the map is orientation reversing, excluded by the definition.
- The Beurling transform `Sf(z) = −(1/π) p.v. ∫ f(ζ)/(z − ζ)² dA(ζ)` has Fourier multiplier `ξ̄/ξ` of modulus one, so `‖S‖_2 = 1` and `S(f_z̄) = f_z` for compactly supported smooth `f`; a claimed bound `‖S‖_1 < ∞` would be false, as PDE Lane B item 10 records.
- The affine map `z ↦ z + a z̄` solves the Beltrami equation with constant `μ = a` and is normalized by fixing `0` and `1` after dividing by `1 + a`; uniqueness of the normalized solution excludes `z ↦ λ(z + a z̄)` for `λ ≠ 1/(1 + a)`.

*Needs:* Mathlib `MeasureTheory` and Fourier Plancherel; PDE Lane B item 9; PDE Lane B item 10; §1.1.

### 7.5 Teichmüller's theorem and the Teichmüller metric

Prove **Teichmüller's existence and uniqueness theorem** on closed marked surfaces: every marked equivalence class contains an extremal quasiconformal representative; prove the Hamilton–Krushkal variational inequality and the Reich–Strebel fundamental inequality with their exact hypotheses; combine them with the normal-family compactness of Layer 7.4 to identify every nontrivial extremal map by a holomorphic quadratic differential `q ∈ H⁰(X, K_X^⊗2)` and a Teichmüller parameter `k ∈ [0,1)`, `μ = k q̄/|q|`, and deduce uniqueness from equality in the fundamental inequality (Imayoshi–Taniguchi, Chapter 5; Hubbard 2006, Chapter 6; Farb–Margalit, Chapter 11). Define the **Teichmüller metric** `d_T(X, Y) = ½ inf_f log K(f)` over quasiconformal maps in the marked class and prove separation, symmetry, the triangle inequality, mapping-class invariance and agreement with the topology of Layer 2. Prove **Wolpert's length distortion** `ℓ_γ(Y) ≤ K(f) ℓ_γ(X)` for `f` a `K`-quasiconformal map in the marked class (Wolpert 1979, Lemma 3.1). Prove completeness: for a `d_T`-Cauchy sequence fix a tail base point; Wolpert's inequality bounds every curve of the finite filling collection on the tail, so the sequence lies in a compact sublevel set of Layer 7.1, and a convergent subsequence of a Cauchy sequence makes the sequence converge. Prove that geodesics exist by the extremal-map theorem.

**Checks.**

- `d_T(X, X) = 0` through `f = id` with `K = 1`; `d_T(X, Y) > 0` for distinct points because a conformal map in the marked class would make them equal.
- For a Teichmüller map with parameter `k`, `K = (1 + k)/(1 − k)` and `d_T = ½ log((1 + k)/(1 − k)) = artanh k`; the factor `½` makes the Teichmüller disc `k ↦ [X_k]` isometric to the hyperbolic disc of curvature `−4`, and dropping it would give curvature `−1`.
- Wolpert's inequality with `K = 1` gives `ℓ_γ(Y) = ℓ_γ(X)` for all `γ`, consistent with `Y = X`; applied to a Dehn twist (which is not quasiconformally close to the identity) it bounds the length of the twisted curve only through `K`, which grows with the twist.
- Mapping-class invariance: `d_T(f ⋅ X, f ⋅ Y) = d_T(X, Y)` because `f` composes the marked classes on both sides by the same diffeomorphism; a metric defined with markings on one side only would not be invariant.

*Needs:* §7.4; §7.1; §2.4; ComplexKahlerGeometry K5b; §3.2.

### Examples

- Genus two with the pants decomposition by three nonseparating curves: the Fenchel–Nielsen coordinates of the regular-octagon surface, and the Teichmüller geodesic through it determined by the quadratic differential with a double zero.

### Dependencies

Layer 7 consumes Layers 0 to 5, ComplexCurveModuli D0 item 1 and D6 item 2, ComplexKahlerGeometry K5b, PDE Lane B items 9 and 10 and Mathlib's measure theory. It supplies Fenchel–Nielsen coordinates, the filling-length compactness and the Teichmüller metric to Layers 8, 10 and 11.

## Layer 8: Finite actions, fixed loci and automorphism-free structures

### 8.1 Measured laminations and earthquakes

Construct the carrier `ML(Σ)` of **measured geodesic laminations**, the intersection pairing `i(·,·)` and the left earthquake deformation `E^t_μ(X)` on marked hyperbolic structures, with its continuity and the **earthquake theorem** that any two points of `Teich(Σ)` are joined by a unique left earthquake path (Thurston; Kerckhoff 1983, §2). Prove the **first-variation formula** for the length of a closed curve along an earthquake (for a weighted curve the sum over crossings of the weights times the cosines of the crossing angles, extended to laminations by approximation) and Kerckhoff's **convexity theorem**: `t ↦ ℓ_γ(E^t_μ(X))` is convex, strictly convex when `i(γ, μ) > 0` (Kerckhoff 1983, §3). These rest on four owned inputs. (i) The topology of `ML(Σ)` is the weak topology of transverse measures, in which `μ_n → μ` when `∫ τ dμ_n → ∫ τ dμ` for every compactly supported continuous `τ` on every transverse arc, equivalently `i(μ_n, γ) → i(μ, γ)` for every simple closed curve `γ`. (ii) Marking independence: for two marked hyperbolic structures `X, Y`, straightening geodesics through the boundary map of a lifted marking (Layer 5.2) gives a homeomorphism `ML_X(Σ) ≃ ML_Y(Σ)` preserving `i(·,·)` and natural under marking changes, so `ML(Σ)` is a carrier over `Teich(Σ)` rather than over one metric. (iii) Density: positive multiples of simple closed geodesics are dense in `ML(Σ)`, and `i(·,·)` and lengths are continuous, so first variation and convexity extend from weighted curves to all of `ML(Σ)`. (iv) The filling criterion: if a finite collection `C` fills, every nonzero `μ ∈ ML(Σ)` has `i(γ, μ) > 0` for some `γ ∈ C`; for a pants decomposition with one transverse curve per cuff this holds because the support of `μ` either crosses a cuff or contains a cuff as a closed leaf, and then the transverse curve crosses it.

The lamination carrier and the earthquake have the following API.

- `ML(Σ)` is a topological space with a continuous `ℝ_(>0)`-action by scaling and a continuous symmetric pairing `i(·,·)` extending the geometric intersection number of simple closed curves.
- `E^t_μ` is a continuous map `ℝ × ML(Σ) × Teich(Σ) → Teich(Σ)` with `E^0_μ = id`, `E^(s+t)_μ = E^s_μ ∘ E^t_μ` and `E^t_(cμ) = E^(ct)_μ`.
- For a weighted simple closed curve `μ = c·γ`, `E^t_μ` is the fractional Dehn twist of displacement `ct` along `γ`, so `E^(ℓ_γ)_γ` is the Dehn twist, with the sign of Layer 7.2.

**Checks.**

- Witness for the direction: for `μ = γ` a cuff, the full earthquake `E^(ℓ_γ)_γ(X, m)` is the surface `X` with the marking sheared one full turn to the left across the collar, `(X, m ∘ τ_γ) = τ_γ⁻¹ ⋅ (X, m)`, so it changes the twist coordinate by `+ℓ_γ` and `E^t_γ` changes `t_γ` by `+t`; the positive Dehn twist `τ_γ` changes it by `−ℓ_γ` (Layer 7.2). A convention with `E^(ℓ_γ)_γ = τ_γ ⋅ (X, m)` would be a right earthquake.
- First variation at `t = 0` for `γ` crossing `μ = c·δ` once at angle `θ` is `c cos θ`; it vanishes at a right angle and is negative past it, while the second variation is a positive multiple of `c sin²θ`, so convexity is strict exactly when a crossing exists.
- The curve `γ` disjoint from `μ` has constant length along `E^t_μ`; strict convexity fails there, which is why the filling criterion (iv) is needed in Layer 8.2.
- `ML(Σ)` for the torus is `ℝ²` with `i` the absolute value of the determinant; two laminations `(1,0)` and `(2,0)` have `i = 0`, and the scaling action is not free on classes of closed curves, which the definition records.

*Needs:* §4.5; §5.2; §7.1; §7.2; §6.1.

### 8.2 Nielsen realization for finite subgroups of `Mod±(Σ)`

Use Layer 7.1's strongly filling collection `C`. For a finite subgroup `F ≤ Mod±(Σ)` form the orbit collection with multiplicity `F·C` and set `L_F(X) = Σ_(f∈F) Σ_(γ∈C) ℓ_(fγ)(X)`. It is strongly filling and `F`-invariant, including for orientation-reversing classes, which act on lengths through Layer 3.2's conjugate-linear action. Layer 7.1's compactness gives compact sublevel sets of `L_F`. Along every nonconstant earthquake path the lamination `μ` is nonzero, so some `γ ∈ C` has `i(γ, μ) > 0`; that term is strictly convex and the others convex, so `L_F` is strictly convex along earthquakes. Properness gives a minimum, strict convexity and earthquake connectivity give uniqueness, and `F`-invariance forces the unique minimum to be fixed by `F`. This is Kerckhoff's proof of the **Nielsen realization theorem** in its finite-filling-collection form (Kerckhoff 1983, Theorem 1; Farb–Margalit, Chapter 7): every finite subgroup of `Mod±(Σ)` fixes a point of `Teich(Σ)`, hence by Layer 5.6 is realized as a group of conformal and anticonformal isometries of a hyperbolic surface.

**Checks.**

- For `F` trivial the theorem says `L_C` has a minimum, which the compactness alone gives; the minimum is unique by strict convexity.
- For `F = ⟨h⟩` the hyperelliptic class in genus two, every point is fixed and the theorem is vacuous there; its content is that the fixed set is nonempty for every finite `F`, and for `F` generated by a Dehn twist (infinite order) the hypothesis fails and the twist fixes no point, since Layer 0.5 excludes an isometry isotopic to a twist.
- An orientation-reversing involution of `Mod±(S_2)` is realized by an anticonformal involution, so the fixed point is a real curve; a proof using only holomorphic convexity would not reach the `Mod±` case.

*Needs:* §8.1; §7.1; §3.2; §5.6.

### 8.3 Quotient charts for a finite isometry group

For a finite group `F` of isometries of a closed hyperbolic surface define the full quotient carrier by finite local isometry charts: at `x`, choose a metric disc invariant under the stabilizer `F_x` and disjoint from its translates by elements outside `F_x`; exponential coordinates conjugate `F_x` to a finite subgroup of `O(2)`. A rotation subgroup gives a cone chart `D/C_m`, a reflection a half-disc mirror chart, a dihedral stabilizer a sector of angle `π/m` with a corner reflector. Free orientation-reversing elements can make the quotient nonorientable without mirrors. Record each chart's stabilizer, orbit size `|F|/|F_x|` and local quotient map. The orientation-preserving subgroup `F⁺` has its separate Riemann-surface orbifold quotient, by FuchsianOrbifolds Layer 1 applied to the lift of `F⁺` to a discrete cocompact subgroup of `PSL₂(ℝ)` (Layer 5.6 realizes `F⁺` by isometries); it is used for the complex deformation dimensions.

**Checks.**

- The hyperelliptic involution of genus two has six fixed points, each with stabilizer `C_2`, so the quotient of `F⁺ = ⟨h⟩` has signature `(0; 2,2,2,2,2,2)`; a chart construction forgetting the fixed points would give a smooth genus-zero surface with `χ = 2`, contradicting Riemann–Hurwitz `−2 = 2·(2 − 6/2)`.
- A reflection of a real genus-two curve with fixed-point set three circles has quotient a sphere with three boundary mirrors and `F⁺` trivial; its full quotient is not a Riemann surface.
- A fixed-point-free orientation-reversing involution gives a nonorientable quotient of Euler characteristic `−1` for genus two; its `F⁺` is trivial and the complex quotient is the surface itself.

*Needs:* §5.6; FuchsianOrbifolds Layer 1; §4.5.

### 8.4 The dimension of fixed loci

For a finite `F⁺ ≤ Mod⁺(Σ)` fixing a point `X`, prove finite-group holomorphic linearization at `X` and identify the tangent space of the fixed locus `Fix(F⁺)` with `H¹(X, T_X)^(F⁺)`; Serre duality (ComplexKahlerGeometry K5b) identifies its dimension with that of `H⁰(X, K_X^⊗2)^(F⁺)`. Under the quotient map to the orientable quotient of genus `h` with `r` branch values, invariant quadratic differentials correspond to quadratic differentials on the quotient with at most simple poles at the branch values; prove the local branch-order computation giving exactly this pole condition. Use the divisor Riemann–Roch comparison of ComplexCurveModuli D0 item 2 to prove `dim_ℂ Fix(F⁺) = 3h − 3 + r`, including the stable low-signature cases `h = 0, r ≥ 3` and `h = 1, r ≥ 1`. For an orientation-reversing coset prove that its antiholomorphic involution on the `F⁺` fixed locus has real fixed submanifold of real dimension equal to the complex dimension of that locus, by the real-linear finite-order version of Cartan's linearization.

**Checks.**

- `F⁺ = ⟨h⟩` the hyperelliptic involution of genus two: `h = 0`, `r = 6`, `3h − 3 + r = 3 = dim Teich(S_2)`, so the fixed locus is everything, as Layer 8.5 proves.
- A `ℤ/3` action in genus three with quotient of genus one and `r = 2`: Riemann–Hurwitz `4 = 3(0 + 2·(2/3))`, dimension `3 − 3 + 2 = 2 < 6`; a formula `3h − 3 + 2r` would give `4`.
- The involution of genus `g` with quotient of genus `h` and `r = 2g + 2 − 4h` fixed points: dimension `3h − 3 + 2g + 2 − 4h = 2g − 1 − h`, with codimension `g − 2 + h`, zero exactly for `g = 2, h = 0`.
- Pole condition: a quadratic differential `q` invariant under `z ↦ −z` near a fixed point descends through `w = z²` to `q = (a + b z² + …) dz² = (a/(4w) + …) dw²`, a simple pole with residue determined by `a`; demanding holomorphy on the quotient would lose the `a` term and give dimension `3h − 3` instead of `3h − 3 + r`.

*Needs:* ComplexKahlerGeometry K5b; ComplexCurveModuli D0 item 2; FuchsianOrbifolds Layer 5 item 6; §8.3; §2.4.

### 8.5 The open dense locus of trivial stabilizers and the genus-two kernel

For `g ≥ 3` prove that every nontrivial finite subgroup `F ≤ Mod±(Σ)` has a proper fixed locus. If `F⁺` is nontrivial, FuchsianOrbifolds Layer 5 item 6's Riemann–Hurwitz formula `2g − 2 = |F⁺|(2h − 2 + Σᵢ(1 − 1/mᵢ))` with `|F⁺| ≥ 2` and `1 − 1/mᵢ ≥ 1/2` gives `r ≤ 2g + 2 − 4h`, so the fixed locus of dimension `3h − 3 + r` has complex codimension at least `g + h − 2 > 0`. If `F⁺` is trivial, `F` has order two and its antiholomorphic involution has real fixed dimension `3g − 3 < 6g − 6`. Proper discontinuity (Layer 3.3) makes the locus of points with nontrivial stabilizer a locally finite union of closed nowhere-dense fixed loci, so its complement, the set of marked surfaces with trivial conformal and anticonformal isometry group, is open and dense. For `g = 2` first prove the existence of a hyperelliptic involution: Riemann–Roch gives `dim H⁰(K) = 2` and `dim H⁰(K(−p)) = 1` for every `p`, since a genus-two curve has no degree-one map to `ℙ¹`, so the canonical system is basepoint-free and defines a degree-two map to `ℙ¹` whose deck involution `h` is hyperelliptic. Its fixed locus is closed of complex dimension three (Layer 8.4) in the connected threefold `Teich(S_2)`, hence everything, so `[h]` lies in the global kernel `K` of the action. `K` is finite, as it lies in a point stabilizer, and orientation preserving, since a nontrivial antiholomorphic action is not the identity on a positive-dimensional complex manifold; the dimension formula for the nontrivial group `K` gives `3h − 3 + r = 3`, so `r = 6 − 3h`; `h = 1, r = 3` and `h = 2, r = 0` are excluded by Riemann–Hurwitz for a nontrivial action, so `h = 0, r = 6` and `2 = |K|(−2 + Σᵢ(1 − 1/mᵢ))` with each summand at least `1/2` forces `|K| = 2` and all `mᵢ = 2`. Thus the kernel is exactly the order-two hyperelliptic subgroup, every genus-two point has nontrivial stabilizer, and the first open dense locus is defined for `g ≥ 3` only. Descend the loci to the moduli groupoid and the coarse quotient.

**Checks.**

- `g = 3`: the codimension bound `g + h − 2 ≥ 1` is attained by the hyperelliptic locus (`h = 0`, `r = 8`, dimension `5` in `Teich` of dimension `6`); a bound `g + h − 3` would allow codimension zero.
- `g = 2`: `r = 6 − 3h` with `h = 1` gives `r = 3` and Riemann–Hurwitz `2 = |K|(0 + Σ(1 − 1/mᵢ)) ≥ |K|·3/2 ≥ 3`, impossible; with `h = 2`, `r = 0` gives `2 = 2|K|`, so `|K| = 1`, excluded; the case analysis is complete.
- The locus of trivial stabilizers is empty for `g = 2` and nonempty for `g = 3`: a generic genus-three plane quartic has no automorphisms, and Layer 3.3's local finiteness makes the complement of the fixed loci open.

*Needs:* FuchsianOrbifolds Layer 5 item 6; §8.4; §3.3; §5.6; ComplexCurveModuli D0 item 2; §2.3.

### Examples

- Genus two: the hyperelliptic involution fixes all of `Teich(S_2)`; the `ℤ/5` action on `y² = x⁵ − 1` has signature `(0; 5, 5, 5)` and fixed locus a point.

### Dependencies

Layer 8 consumes Layers 2 to 7, ComplexKahlerGeometry K5b, ComplexCurveModuli D0 item 2 and FuchsianOrbifolds Layers 1 and 5. It supplies the Nielsen realization theorem, the fixed-locus dimension and the first open dense locus to Layers 10 and 11.

## Layer 9: Arithmetic exceptions

### 9.1 Arithmetic Fuchsian groups

Define, following Takeuchi, the groups `Γ(A, 𝒪)`: for a totally real number field `k` of degree `n` (Mathlib's `NumberField` with `NumberField.IsTotallyReal`), a quaternion algebra `A` over `k` (Mathlib's `QuaternionAlgebra`) split at exactly one real place and ramified at the other `n − 1` real places, and an order `𝒪 ⊂ A`, the image in `PSL₂(ℝ)` of the norm-one unit group of `𝒪` under the splitting isomorphism `A ⊗_(k, σ₁) ℝ ≃ M₂(ℝ)` (Takeuchi 1975, §1, pp. 600–601). Prove that `Γ(A, 𝒪)` is a lattice in `PSL₂(ℝ)`, cocompact exactly when `A` is a division algebra, and that for `k = ℚ` and `A = M₂(ℚ)` with the maximal order `M₂(ℤ)` it is `PSL₂(ℤ)`. Define an **arithmetic Fuchsian group** as a lattice of `PSL₂(ℝ)` commensurable up to conjugacy with some `Γ(A, 𝒪)` (Takeuchi 1975, Definition, p. 601). State Takeuchi's trace characterization (Takeuchi 1975, Theorem 1): a lattice is arithmetic if and only if its trace field is a number field whose traces are algebraic integers and every embedding of the trace field into `ℂ` whose restriction to the subfield generated by the squares of the traces is not the identity has bounded image of the set of traces (conditions (I) and (II₁) there); prove the easy direction that the trace field of `Γ(A, 𝒪)` is `k` and its traces are integral. For a torsion-free cocompact arithmetic group the algebra is division, so the definition in this roadmap's statements is the cocompact division case. The rational case of QuaternionArithmetic §8.1 is the specialization `k = ℚ`.

**Checks.**

- `PSL₂(ℤ)` is arithmetic and not cocompact; `A = M₂(ℚ)` is not division, consistent with the cocompactness criterion.
- The `(2,3,7)` triangle group is arithmetic with `k = ℚ(cos(2π/7))` of degree three and `A` ramified at the two nonidentity real places; the trace field has degree three, so a definition requiring `k = ℚ` would miss it.
- A lattice whose trace field is not a number field, for example a generic point of `Teich(S_2)` by Layer 9.3, is not arithmetic; commensurability invariance of arithmeticity is used because the definition is up to commensurability and conjugacy.

*Needs:* Mathlib `QuaternionAlgebra`; Mathlib `NumberField`; Mathlib `NumberField.IsTotallyReal`; Mathlib `NumberField.InfinitePlace`; FuchsianOrbifolds Layer 0 item 2; FuchsianOrbifolds Layer 4 item 5.

### 9.2 Finiteness of arithmetic lattices of fixed signature

Prove the **fixed-signature finiteness theorem**: for each `g ≥ 2` there are finitely many `PSL₂(ℝ)`-conjugacy classes of arithmetic cocompact lattices whose quotient is a closed surface of genus `g`. Route: such a lattice is torsion free of covolume `4π(g − 1)` by FuchsianOrbifolds Layer 4 item 5; Borel's theorem (Borel 1981, Theorem 8.2, with Lemma 8.1 for the case `a = 1, b = 0` of `PGL₂(ℝ)`) says that for every `c > 0` the arithmetic subgroups of `PGL₂(ℝ)` of covolume at most `c` fall into finitely many conjugacy classes. Own the inputs of that proof in the Fuchsian case: Borel's Lemma 8.1, that a lattice of covolume at most `c` is generated by a number of elements bounded in terms of `c` alone, read off its signature `(g; m₁, …, m_r)` and cusp number through the signature formula with `mᵢ ≥ 2`; the covolume lower bound for `Γ(A, 𝒪)` in terms of the discriminant of `k` and the ramification of `A` (Borel 1981, §7, formula 7.3 (1)), which with Hermite's theorem that only finitely many number fields have bounded discriminant and the growth of the discriminant with the degree bounds the field, the algebra and the maximal order to finitely many possibilities; and the step that a lattice commensurable with `Γ(A, 𝒪)` of bounded covolume lies in finitely many conjugacy classes of groups between a bounded-index subgroup and the normalizer of a maximal order (Borel 1981, §§4–5 and 8.2). Transfer the finite set of conjugacy classes to finitely many points of the coarse moduli space.

**Checks.**

- Genus two: the finite set is nonempty (Takeuchi's list of arithmetic genus-two surfaces, e.g. the Bolza surface, whose group is commensurable with the `(2,3,8)` triangle group); finiteness does not mean emptiness.
- The theorem is false without arithmeticity: `Teich(S_2)` is a positive-dimensional family of pairwise nonconjugate cocompact lattices of genus two.
- A torsion-free cocompact lattice of genus `g` has covolume `4π(g − 1)` and `2g` generators; the signature formula with `mᵢ ≥ 2` gives `2h − 2 + r/2 ≤ Area/2π` for any lattice of signature `(h; m₁, …, m_r)` of that covolume, so the number of possible signatures of covolume at most `c` is finite, which is the content of the generator bound.

*Needs:* §9.1; FuchsianOrbifolds Layer 4 item 5; Mathlib `NumberField.discr`; §3.3.

### 9.3 The arithmetic locus is closed and nowhere dense

Transfer the finitely many unmarked moduli points of Layer 9.2 to `Teich(Σ)`: their preimage is a finite union of `Mod±(Σ)`-orbits, not a finite set. Prove that each orbit is closed and locally finite under Layer 3.3's properly discontinuous action, so that the arithmetic locus is closed with open dense complement, the second generic locus. Nonarithmeticity of a point means that its uniformizing group is not arithmetic; this follows from Layer 9.2 and not from maximality.

**Checks.**

- An orbit of a properly discontinuous action of an infinite group is infinite and closed, and discrete; the arithmetic locus in `Teich(S_2)` is a countable closed discrete set, nowhere dense because `Teich(S_2)` has no isolated points.
- A nonarithmetic surface commensurable with an arithmetic one does not exist, since arithmeticity is a commensurability invariant; so the arithmetic locus is saturated under finite covers.
- Conjugating an arithmetic group by a reflection in `PGL₂(ℝ)` gives an arithmetic group, so the locus is `Mod±`-invariant, not only `Mod⁺`-invariant.

*Needs:* §9.2; §3.3; §6.1.

### Examples

- The Bolza surface of genus two and the Klein quartic of genus three as arithmetic points; a surface with transcendental Fenchel–Nielsen coordinates as a nonarithmetic point.

### Dependencies

Layer 9 consumes Layers 3 and 6, FuchsianOrbifolds Layers 0 and 4 and Mathlib's number fields and quaternion algebras. It supplies the nonarithmetic open dense locus to Layer 11.

## Layer 10: The open dense locus of groups maximal among discrete `PGL₂(ℝ)` overgroups

### 10.1 The minimum area and the index bound

Prove the **minimum-area theorem**: a compact orientable hyperbolic orbifold `ℍ/Λ`, `Λ ≤ PSL₂(ℝ)` cocompact of signature `(h; m₁, …, m_r)`, has area at least `π/21`, with equality exactly for the `(2,3,7)` triangle group. Route: FuchsianOrbifolds Layer 4 item 5's formula `Area = 2π(2h − 2 + Σᵢ(1 − 1/mᵢ))` and the case analysis `h ≥ 2` gives `2h − 2 + Σ ≥ 2`; `h = 1` needs `r ≥ 1` and gives `≥ 1/2`; `h = 0` with `r ≥ 5` gives `≥ 1/2`; `r = 4` gives `≥ 1/6`, at `(2,2,2,3)`; `r = 3` gives `≥ 1/42`, at `(2,3,7)`; `r ≤ 2` with `h = 0` is not hyperbolic. For a discrete `Γ ⊊ Λ ≤ PGL₂(ℝ)` with `Γ` the torsion-free uniformizing group of a closed surface of genus `g`, put `Λ⁺ = Λ ∩ PSL₂(ℝ)`; then `[Λ : Λ⁺] ≤ 2` and `Γ ≤ Λ⁺`. The inclusion gives an orbifold covering `ℍ/Γ → ℍ/Λ⁺` (FuchsianOrbifolds Layer 1), of finite degree by compactness of the source and discreteness of the fibres, so `Λ⁺` is cocompact and `Area(ℍ/Γ) = [Λ⁺ : Γ] Area(ℍ/Λ⁺)`. Hence `[Λ⁺ : Γ] ≤ 4π(g − 1)/(π/21) = 84(g − 1)` and the total index `d = [Λ : Γ]` satisfies `2 ≤ d ≤ 168(g − 1) =: D`.

**Checks.**

- `(2,3,7)`: `−2 + 1/2 + 2/3 + 6/7 = −2 + 85/42 = 1/42`, area `π/21`; `(2,3,8)`: `−2 + 1/2 + 2/3 + 7/8 = 1/24 > 1/42`; `(2,2,2,3)`: `−2 + 3/2 + 2/3 = 1/6`; `(1; 2)`: `0 + 1/2 = 1/2`.
- `(2,2,2,2)`, `(2,3,6)`, `(2,4,4)` and `(3,3,3)` give `0`, the Euclidean signatures, and `(0; 2,2,2)` gives `−1/2`; none is hyperbolic, so the minimum is over positive values only, and a case analysis that admitted them would give a wrong minimum.
- For `g = 2` the index bound is `d ≤ 168`, and the Bolza surface's uniformizing group has index `48` in its normalizer in `PSL₂(ℝ)` (the `(2,3,8)` group), with `96 = 2·48 ≤ 168`; a bound `84(g − 1)` on the total index would still hold here but is not what the argument proves.

*Needs:* FuchsianOrbifolds Layer 4 item 5; FuchsianOrbifolds Layer 1; §4.1; §4.5.

### 10.2 Bounded normal cores, marked regular covers and the deck dictionary

Fix a marking and the geometric group `Π` of Layer 4.2. If `ρ_X : Π ≃ Γ` is the uniformizing isomorphism of `X` and `Γ ⊊ Λ` is a discrete overgroup of index `d ≤ D`, put `C = core_Λ(Γ) ◁ Λ` and `N_X = ρ_X⁻¹(C) ◁ Π`; `N_X` is the kernel of the action of `Π` on the `d` cosets, so `[Π : N_X] ≤ D!` and `Π/N_X ≃ Γ/C` embeds in `Λ/C`. A finitely generated group has finitely many normal subgroups of index at most `D!`; let `𝒩_D(Π)` be this finite set. For `N ∈ 𝒩_D(Π)` construct the regular oriented smooth cover `p_N : Σ_N → Σ` attached to `ι(N)` through Tau Ceti's covering-space classification transported across `ι`, of degree `k = [Π : N]` and genus `1 + k(g − 1)`, with deck group `Q_N = Π/N` identified with the deck group through `deckSubgroupQuotientProjEquivOfNormal` and Layer 4.2's endpoint dictionary; verify that the identification is a homomorphism into deck composition, not an antihomomorphism. The genus comes from `riemannHurwitz` (§0.0g) with no marked values, which gives `Surface.eulerChar Σ_N = k(2 − 2g)`, and `Surface.eulerChar_eq_two_sub_two_mul_genus` (§0.0f) for the closed connected oriented `Σ_N`. Prove the **outer-action identity**: with the based cover group identified with `N`, the deck map represented by `γN` induces the outer automorphism of `N` represented by `n ↦ γ n γ⁻¹`, and changing `γ` within its coset changes it by an inner automorphism; prove it for the endpoint maps and transport it to the native `Out`. After uniformization it is also the identity for the left normalizer action `z ↦ ρ(γ) z` on `ℍ/ρ(N)`. The deck group embeds in `Mod⁺(Σ_N)` (an isometry isotopic to the identity is trivial by Layer 0.5, and deck maps are isometries for the pulled-back metric), with the same topological deck classes at every point of `Teich(Σ)`. Construct the smooth cover and lift isotopies using Completed/UniversalCovers and RiemannianGeometry R4 item 7, for the fixed marked cover; the construction is invariant under changing the standard model by Layer 0.1.

**Checks.**

- `D = 168(g − 1)`, so for `g = 2` the bound on `[Π : N_X]` is `168!`, finite though enormous; the set `𝒩_D(Π)` is finite because a finitely generated group has finitely many homomorphisms to each finite group of order at most `D!`.
- For `N = Π` the cover is the identity, `Q_N` trivial; for `N` of index two the cover has genus `2g − 1` (`1 + 2(g − 1)`), as §0.0g's Riemann–Hurwitz formula gives for an unbranched double cover.
- The outer-action identity on the index-two cover of the torus by `N = 2ℤ ⊕ ℤ`: the deck involution is translation by `(1, 0)`, acting trivially on `N ≃ ℤ²` by conjugation since `Π` is abelian; on a nonabelian `Π` conjugation by `γ ∉ N` is a nontrivial outer automorphism of `N` because the centralizer of `N` in `Π` is trivial (Layer 10.3).

*Needs:* §4.2; Tau Ceti `deckSubgroupQuotientProjEquivOfNormal`; Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv`; RiemannianGeometry R4 item 7; §0.5; §0.1; §0.0f; §0.0g; §10.1.

### 10.3 The pullback map and the deck fixed locus

Define the **cover-pullback map** `Φ_N : Teich(Σ) → Teich(Σ_N)` sending a marked complex structure to its pullback along `p_N`, descending through the equivalence relation by lifting isotopies with the orientation convention; its image lies in the fixed locus `Fix(Q_N)` of the deck action. Prove that `Φ_N` is a holomorphic embedding whose image is exactly `Fix(Q_N)`, for the fixed topological cover and marking. Reverse inclusion: take a point of `Fix(Q_N)` and realize its stabilizing deck classes by conformal isometries (Layer 5.6); write its uniformizing representation `σ : N → PSL₂(ℝ)` and `Ỹ = ℍ/σ(N)`. Let `E_Q` be the preimage of `Q_N ≤ Out(N)` in `Aut(N)`. Conjugation gives `Π ≃ E_Q`: injective because the centralizer of the finite-index normal subgroup `N` in `Π` is trivial, surjective by the outer-action identity and because a discrepancy in `Aut(N)` with trivial outer class is inner; it is an isomorphism of extensions restricting to the inner inclusion on `N` with quotient `Q_N`, so `E_Q` is torsion free. Let `L_Q` be the full preimage of the realized deck group in the normalizer of `σ(N)` in `PSL₂(ℝ)`; it fits in `1 → σ(N) → L_Q → Q_N → 1`, is discrete (finitely many cosets of a discrete group) and cocompact; conjugation embeds it in `Aut(N)` because the centralizer of `σ(N)` in `PSL₂(ℝ)` is trivial (two hyperbolic elements with distinct fixed-point pairs), with image exactly `E_Q`; hence `L_Q ≃ E_Q ≃ Π` and `L_Q` is torsion free. A nonidentity deck isometry with a fixed point would lift, after multiplying by an element of `σ(N)`, to a nonidentity elliptic element of `L_Q`, of finite order by discreteness, a contradiction; so the realized deck action is free and `Y = Ỹ/Q_N` is a closed oriented surface. The extension gives a homotopy equivalence of `Y` with `Σ`, realized by a diffeomorphism `f : Σ → Y` by Layer 5.2, whose lift `f̃ : Σ_N → Ỹ` has the prescribed marking up to the deck normalization; naturality of fundamental classes in `p_Y ∘ f̃ = f ∘ p_N` gives `k deg(f̃) = k deg(f)`, so `deg(f) = +1` and the marking is orientation preserving. Pullback of the quotient structure represents the original fixed point. No complex structure is assumed literally deck invariant because its class is fixed. Prove global injectivity: if two base points have equal marked pullbacks, the marked conformal map upstairs gives `a ∈ PSL₂(ℝ)` with `a ρ_X(n) a⁻¹ = ρ_Y(n)` for `n ∈ N` after the based inner adjustment; for `γ ∈ Π`, normality of `N` makes `ρ_Y(γ)⁻¹ a ρ_X(γ) a⁻¹` centralize `ρ_Y(N)`, so it is trivial and `a` conjugates the full representations: the base points coincide. Prove holomorphy and the local embedding: pullback of Beltrami differentials commutes with the parameter-dependent solutions of Layer 7.4 used in the charts, so `Φ_N` is holomorphic; its differential is injective because on quadratic-differential cotangent spaces the trace over the unbranched cover satisfies `p_* p^* = k·id` and the trace is the dual differential; the tangent space of `Fix(Q_N)` is the invariant subspace, by finite averaging exactly the pulled-back base tangent space, and the holomorphic inverse function theorem on `Fix(Q_N)` gives a local holomorphic inverse. With the global bijection this is the claimed holomorphic embedding. Finally prove, for an orientation-preserving diffeomorphism `f : Y → Y` preserving the regular-cover subgroup with a lift `f̃`, that `f` is isotopic to the identity exactly when the outer class of `f̃` on `N` lies in `Q_N`: in the reverse direction normalize the lift by a deck transformation to trivial outer class, so its automorphism of `N` is inner, and an automorphism of `Π` fixing `N` pointwise is the identity because the centralizer of `N` in `Π` is trivial; then Layer 5.4 gives the isotopy; the forward direction is that an isotopically trivial `f` induces an inner automorphism of `Π`, whose restriction to `N` has outer class in `Π/N = Q_N`.

The pullback map has the following API.

- `Φ_N` is a holomorphic embedding with closed image `Fix(Q_N)`.
- `Φ_N` is `Mod⁺(Σ)`-equivariant for the lifted action of the classes that preserve `N`, and `Φ_Π = id`.
- `d Φ_N` is injective, with image the `Q_N`-invariant tangent vectors.

**Checks.**

- For `N = Π`, `Φ_N` is the identity and `Fix` is everything.
- For the index-two cover of a genus-two surface (genus three), `dim Fix(Q_N) = 3 = dim Teich(S_2)` inside `dim Teich(S_3) = 6`, and `3h − 3 + r` for the quotient `h = 2, r = 0` gives `3`, consistent with Layer 8.4's formula.
- The trace identity `p_* p^* q = k q` for `q` a quadratic differential on the base and `k = 2`: the pullback to the double cover has the same local expression on both sheets and the trace adds the two sheets.
- Injectivity of `Φ_N` fails for the unmarked quotients: two nonisomorphic genus-two surfaces can have isomorphic unmarked double covers of genus three only if related by a deck-preserving isometry, which the marked statement excludes.

*Needs:* §10.2; §5.6; §5.2; §5.4; §7.4; §2.4; §0.5; ComplexKahlerGeometry K5b.

### 10.4 The bad loci and the open dense theorem

For `g ≥ 3` let `Max_g ⊂ Teich(Σ)` be the set of marked hyperbolic surfaces whose uniformizing group `Γ ≤ PSL₂(ℝ)` is maximal among discrete subgroups of `PGL₂(ℝ)` containing it. Define, for `N ∈ 𝒩_D(Π)`, `B_N = {X ∈ Teich(Σ) : Stab_(Mod±(Σ_N))(Φ_N(X))` strictly contains `Q_N}`. Prove `Max_g = Teich(Σ) ∖ ⋃_N B_N`: for a proper discrete overgroup `Λ`, its core `C` is normal in `Λ`, so `Λ/C` is a finite subgroup of `N_(PGL₂(ℝ))(C)/C = Isom(ℍ/C)` strictly containing `Q_N ≃ Γ/C`, and by Layer 5.6 a point stabilizer strictly containing `Q_N`; conversely a finite stabilizer `F > Q_N` is realized by conformal or anticonformal isometries of the compact surface `ℍ/C`, lifts through `N_(PGL₂(ℝ))(C)/C` to a discrete group `Λ` normalizing `C` and strictly containing `Γ`, using Layer 0.5's trivial kernel; the quotient map induced by `Q_N ≤ F⁺` has degree `[F⁺ : Q_N]` whether or not `Q_N` is normal in `F⁺`. Prove that each `B_N` is closed and locally finite: for `a ∈ Mod±(Σ_N) ∖ Q_N`, `Fix(a)` is closed and `Φ_N⁻¹(Fix(a))` is closed; for compact `K ⊂ Teich(Σ)`, `Φ_N(K)` is compact and proper discontinuity (Layer 3.3) gives finitely many `a` with `a · Φ_N(K)` meeting `Φ_N(K)`, so the family is locally finite and its union is closed; there are finitely many `N`, so `B = ⋃_N B_N` is closed. Prove that every member of the family has empty interior: at a point fixed by `Q_N` and `a ∉ Q_N`, let `F = ⟨Q_N, a⟩` in the finite stabilizer and `F⁺` its orientation-preserving part. If `F⁺ > Q_N`, `e = [F⁺ : Q_N] ≥ 2` and the quotient `Σ ≃ Σ_N/Q_N → Σ_N/F⁺` is a finite holomorphic map of degree `e` to a quotient of genus `h` with cone orders `m₁, …, m_r`; FuchsianOrbifolds Layer 5 item 6 gives `2g − 2 = e(2h − 2 + Σᵢ(1 − 1/mᵢ))`, hence `r ≤ 2g + 2 − 4h`, and Layer 8.4's dimension `3h − 3 + r` has codimension at least `g + h − 2 > 0` in `Teich(Σ) ≃ Fix(Q_N)`. If `F⁺ = Q_N`, `F/Q_N` has order two and induces an antiholomorphic involution on `Teich(Σ)` whose fixed locus has real dimension `3g − 3 < 6g − 6`. So each `B_N` is nowhere dense, `B` is closed nowhere dense, and `Max_g` is open and dense (Greenberg 1963, Theorem 2, states the dichotomy for finitely generated Fuchsian groups; the proof here is the owned marked-cover argument above).

**Checks.**

- `g = 2`: every genus-two surface is hyperelliptic (Layer 8.5), so `Γ` is never maximal in `PSL₂(ℝ)`: the extension by the involution is a discrete overgroup of index two; this is the case `Max` empty of Greenberg's Theorem 2 and the reason the theorem is stated for `g ≥ 3`.
- `g = 3`: the Klein quartic has `|Aut| = 168 = 84(g − 1)`, the maximal overgroup is the `(2,3,7)` group of index `168` in `PSL₂(ℝ)`-terms and `336` in `PGL₂(ℝ)`, which is `D = 168(g − 1) = 336` exactly, so the bound `D` is sharp at the Hurwitz surface.
- A point of `Teich(S_3)` with trivial conformal and anticonformal isometry group is in `Max_3`: a proper overgroup would give a nontrivial stabilizer of `Φ_N(X)` for some `N`, hence a nontrivial isometry of a finite cover normalizing `C`, which descends to an isometry of `X` by the core construction; so the locus of Layer 8.5 is contained in `Max_g`, and `Max_g` is strictly larger, containing surfaces with automorphisms whose group is not contained in a larger discrete group.

*Needs:* §10.3; §10.1; §5.6; §0.5; §3.3; FuchsianOrbifolds Layer 5 item 6; §8.4; §4.1.

### Examples

- Genus three: the Klein quartic lies outside `Max_3` (its group has the `(2,3,7)` overgroup), the generic plane quartic lies in `Max_3`.

### Dependencies

Layer 10 consumes Layers 0, 2, 3, 4, 5, 7 and 8, Tau Ceti's covering declarations, RiemannianGeometry R4 item 7, FuchsianOrbifolds Layers 1, 4 and 5 and ComplexKahlerGeometry K5b. It supplies the open dense locus `Max_g` to Layer 11 and to downstream consumers.

## Layer 11: The common generic locus

### 11.1 Intersection of the three loci

For each `g ≥ 3` intersect the open dense loci of Layers 8.5 and 10.4 with the complement of the closed nowhere-dense arithmetic locus of Layer 9.3. Prove that the intersection is open and dense in `Teich(Σ)` (a finite intersection of open dense sets in a Baire space) and that it descends to the moduli groupoid and the coarse quotient, being `Mod±(Σ)`-invariant. Every point of it has trivial conformal and anticonformal isometry group, is nonarithmetic, and has uniformizing group maximal among discrete `PGL₂(ℝ)` overgroups; nonarithmeticity comes from Layer 9, not from maximality.

**Checks.**

- The three conditions are independent: the Klein quartic is arithmetic with nontrivial automorphisms and nonmaximal group; a generic genus-three surface with an involution has nontrivial stabilizer, is nonarithmetic and may or may not be maximal; a surface in `Max_3` with trivial isometry group is nonarithmetic unless it is one of finitely many orbits.
- For `g = 2` the locus of Layer 8.5 is empty and the intersection is empty; the theorem is stated for `g ≥ 3`.
- The descended locus in the coarse moduli space is open dense because the coarse quotient map is open and the locus is saturated.

*Needs:* §8.5; §9.3; §10.4; §3.3.

### Examples

- Genus three: a plane quartic with transcendental coefficients in general position lies in the common generic locus.

### Dependencies

Layer 11 consumes Layers 3, 8, 9 and 10 and supplies the generic marked-lattice locus to downstream consumers.

## Downstream consumers

- A Fuchsian roadmap beyond FuchsianOrbifolds (its Part II or a successor) is the consumer of Layer 4.1's `Isom(ℍ) ≃ PGL₂(ℝ)` identification and isometry lifting, Layer 10's maximal-overgroup locus and Layer 11's generic locus, for source-specific applications such as the construction of isospectral nonisometric pairs from almost-conjugate subgroups; the finite almost-conjugate pair, the spectral transplantation and the ambient unitary induction are owned there and by their spectral suppliers, not here.
- GroupActionsOnRiemannSurfaces leaves Teichmüller space, Fenchel–Nielsen coordinates and the fixed-locus dimension theorem (Layers 0 to 8) to this roadmap and consumes them.
- ComplexCurveModuli's moduli groupoid is compared with Layer 3.3's moduli groupoid through the forgetful map of Layer 2.2; that comparison lives here, and ComplexCurveModuli does not depend on it.

## References

Sources marked *uncertified* are not openly available and are cited by their locators alone.

* Lars V. Ahlfors and Lipman Bers, "Riemann's mapping theorem for variable metrics," *Annals of Mathematics* 72 (1960), 385–404, DOI 10.2307/1970141: Theorem 1 (existence and uniqueness of normalized solutions of the Beltrami equation) and the holomorphic parameter-dependence theorem; used in Layer 7.4. *Uncertified.*
* Armand Borel, "Commensurability classes and volumes of hyperbolic 3-manifolds," *Annali della Scuola Normale Superiore di Pisa* (4) 8 (1981), 1–33: Lemma 8.1 (generator bound for lattices of bounded covolume, with the case of `PGL₂(ℝ)` treated first), Theorem 8.2 (finitely many conjugacy classes of arithmetic subgroups of covolume at most `c`), §7.3 (1) (covolume formula); used in Layer 9.2.
* Adrien Douady and Clifford J. Earle, "Conformally natural extension of homeomorphisms of the circle," *Acta Mathematica* 157 (1986), 23–48, DOI 10.1007/BF02392590: Theorem 1 (the barycentric extension of a circle homeomorphism is a homeomorphism of the closed disc, a real-analytic diffeomorphism of the open disc, and conformally natural); used in Layer 5.2. *Uncertified.*
* David B. A. Epstein, "Curves on 2-manifolds and isotopies," *Acta Mathematica* 115 (1966), 83–107, DOI 10.1007/BF02392203: Theorem 2.1 (homotopic piecewise-linear embeddings of the circle with two-sided image not bounding a disc are ambient isotopic by a compactly supported isotopy) and Theorem 3.1 (arcs homotopic relative to endpoints are ambient isotopic relative to the boundary), Theorems 3.3 and 3.4 (one-sided curves and the Möbius band, pp. 90–91), Theorem 1.7, Lemma 2.4 and Lemmas 2.5 and 3.2 (the disc, annulus and bigon lemmas, pp. 85–90), Theorems 6.3 and 6.4 (homotopic homeomorphisms of a compact surface are isotopic, relative and closed cases, pp. 99–103); used in Layer 0.0d, and through it in Layers 5.4 and 5.5.
* Benson Farb and Dan Margalit, *A Primer on Mapping Class Groups*, Princeton Mathematical Series 49, 2012: Chapter 1 (Proposition 1.7, the bigon criterion; homotopy implies isotopy for curves), §2.2 (the mapping class groups of the sphere and the torus), §2.3 (Proposition 2.8, the Alexander method), Chapter 7 (finite subgroups, Riemann–Hurwitz, Nielsen realization), Chapter 8 (Dehn–Nielsen–Baer), §10.6 (Fenchel–Nielsen coordinates), Chapter 11 (Teichmüller's theorems); used in Layers 5, 7 and 8. *Uncertified.*
* Leon Greenberg, "Maximal Fuchsian groups," *Bulletin of the American Mathematical Society* 69 (1963), 569–574, DOI 10.1090/S0002-9904-1963-11001-0: Theorem 2, p. 571 (for a finitely generated Fuchsian group `F`, the set of points of its Teichmüller space whose group is maximal is either empty or open and dense with analytic complement); Layer 10.4 proves the exact marked-cover statement with the discrete-`PGL₂(ℝ)`-overgroup meaning stated there.
* John H. Hubbard, *Teichmüller Theory and Applications to Geometry, Topology, and Dynamics*, Vol. 1, Matrix Editions, 2006: Chapter 4 (quasiconformal maps and the Beltrami equation), Chapter 6 (Teichmüller spaces, analytic structure, tangent spaces, Teichmüller's theorem), Chapter 7 (finite-dimensional Teichmüller spaces, Fenchel–Nielsen coordinates); used in Layers 2 and 7. *Uncertified.*
* Yoichi Imayoshi and Masahiko Taniguchi, *An Introduction to Teichmüller Spaces*, Springer, 1992: Chapter 2 (Fricke space), §3.2 (Fenchel–Nielsen coordinates), Chapter 4 (quasiconformal mappings, §4.4 the measurable Riemann mapping theorem), Chapter 5 (Teichmüller's theorem), Chapter 6 (complex structure of Teichmüller space); used in Layers 2, 4, 6 and 7. *Uncertified.*
* Steven P. Kerckhoff, "The Nielsen realization problem," *Annals of Mathematics* 117 (1983), 235–265, DOI 10.2307/2007076: Theorem 1 (every finite subgroup of the mapping class group fixes a point of Teichmüller space), §2 (Thurston's earthquake theorem), §3 (convexity of length functions along earthquakes); used in Layer 8. *Uncertified.*
* William S. Massey, *Algebraic Topology: An Introduction*, Graduate Texts in Mathematics 56, Springer, 1977: Chapter 1, §§5–7 (the classification of compact surfaces by the normal forms of polygon schemas), §§8, 10 and 11 (the Euler characteristic and surfaces with boundary); used in Layer 0.0f. *Uncertified.*
* Edwin E. Moise, *Geometric Topology in Dimensions 2 and 3*, Graduate Texts in Mathematics 47, Springer, 1977: §6, Theorems 6.2–6.4, pp. 46–50 (PL approximation of homeomorphisms), Theorem 8.2, pp. 58–59 (triangulation of open subsets of the plane), Theorem 8.3, pp. 60–62 (every 2-manifold is triangulable), Theorem 8.5, p. 64 (the two-dimensional Hauptvermutung); used in Layers 0.0a and 0.0b. *Uncertified.*
* James R. Munkres, *Elementary Differential Topology*, Annals of Mathematics Studies 54, Princeton University Press, revised edition 1966: Definition 8.3, pp. 80–81 (`Cʳ` triangulations), Theorems 10.5 and 10.6, pp. 103–104 (uniqueness and existence of smooth triangulations); used in Layer 0.0e and, through GeometricTopology, in Layer 5.3a. *Uncertified.*
* Stephen Smale, "Diffeomorphisms of the 2-sphere," *Proceedings of the American Mathematical Society* 10 (1959), 621–626, DOI 10.1090/S0002-9939-1959-0112149-8: Theorem A (`Diff⁺(S²)` deformation retracts onto `SO(3)`), Theorem B (the diffeomorphisms of the square that are the identity near the boundary form a contractible space), Theorem 4 (its explicit contraction), Theorem 6 (the explicit retraction onto `SO(3)`); used in Layer 5.3.
* Kisao Takeuchi, "A characterization of arithmetic Fuchsian groups," *Journal of the Mathematical Society of Japan* 27 (1975), 600–612, DOI 10.2969/jmsj/02740600: §1 (the groups `Γ(A, 𝒪)` and the definition of arithmetic Fuchsian groups, pp. 600–601), Theorem 1 (trace characterization); used in Layer 9.1.
* Scott A. Wolpert, "The length spectra as moduli for compact Riemann surfaces," *Annals of Mathematics* 109 (1979), 323–351, DOI 10.2307/1971114: Lemma 3.1 (a `K`-quasiconformal map multiplies geodesic lengths by at most `K`); used in Layer 7.5. *Uncertified.*
