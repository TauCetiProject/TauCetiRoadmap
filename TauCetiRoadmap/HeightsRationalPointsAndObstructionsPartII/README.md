# Roadmap: heights, rational points and obstructions, part II — uniform Bogomolov and Mordell–Lang

**Summary.** Uniformity for small points and for Mordell–Lang on subvarieties of abelian varieties, extending HeightsRationalPointsAndObstructions where its Layer 5 stops (qualitative Mordell–Lang, Bogomolov over number fields, equidistribution). The construction follows Dimitrov–Gao–Habegger’s height inequality for non-degenerate subvarieties, Kühne’s equidistribution in families, Gao–Ge–Kühne’s gap principle, uniform Bogomolov and uniform Mordell–Lang via Rémond’s quantitative Vojta method, the geometric Bogomolov conjecture over function fields (Gao–Habegger in characteristic 0 over curves, Xie–Yuan in general), Yuan’s uniform Bogomolov-type theorem for curves over all global fields with the relative Bogomolov theorem for curve families, and DeMarco–Krieger–Ye’s bielliptic family as a worked case. Betti maps come from AbelianSchemesAndArithmeticModuliPartII, adelic line bundles, bigness and Moriwaki heights from ArakelovGeometryAndAbelianHeightsPartII, moduli from PELModuli, StableReductionPartII and JacobianChallengePartII.

## Scope and ownership

HeightsRationalPointsAndObstructions ends Layer 5 with qualitative finite-rank Mordell–Lang, number-field Bogomolov and equidistribution on a fixed abelian variety; §§0.31–0.35 and 1.9–1.11 supply polarized function-field heights and the trace. This Part II owns constants uniform in the abelian variety and field, the geometric level-case intersection estimates, bounded Hilbert-family uniformity, quantitative Vojta–Mumford counting, the geometric Bogomolov theorem in all characteristics, and Yuan's relative and global-field curve bounds. No bound restricts the set of residue characteristics.

The following objects are supplied by earlier owners. HeightsRationalPointsAndObstructions §§5.9b, 5.17a–g owns cycle heights, the Chow coefficient comparison, arithmetic Bézout and minima; §§0.10–0.12, 0.31–0.35 owns the function-field projective height and its extension laws. JacobianChallengePartII §§3.2–3.13 owns the canonical twice-theta bundle. AbelianSchemesAndArithmeticModuliPartII §§B2.13, B2.21–B2.23 owns the generically special locus over a curve, its finite maximal members and its Betti-rank criterion. ClassicalArithmeticCompletion §3.19 owns existence and uniqueness of reduced row echelon forms. These constructions have no second definition here. Their interface facts and discriminating Checks are recorded in the contracts below. The total degree in §0.1 differs from the degree of a pure cycle by summing reduced components in every dimension.

Betti maps and forms, degeneracy loci and geometric fibre-power criteria belong to AbelianSchemesAndArithmeticModuliPartII B0–B4. General adelic heights, invariant extensions, non-degenerate dynamical height inequalities, generic equidistribution, Moriwaki heights and potential bigness belong to ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7. Section 3.1 compares the supplied measure with Kühne's graph-degree normalization; §3.2 derives its uniform test-function form. Section 2.8 compares the general adelic export with this roadmap's geometric level case. Hilbert and Chow parameter spaces belong to AlgebraicModuliForArithmeticGeometry §§1.5–1.6, 2.1; §1.1 restricts them to fixed-degree geometrically integral subvarieties of an abelian variety. Relative Jacobians and all five Abel/difference/shift maps belong to JacobianChallengePartII Layers 0–7; Layer 10 proves their small-point consequences. Fine level moduli belongs to PELModuli M5–M6 and StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15. Néron models and semistable reduction belong to NeronModelsAndSemistableAbelianVarieties Layers 1–5. ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112 supplies the elliptic quotient dynamics used in Layer 12.

Section 8.1 extends the curve-field bounded-degree torsion input of AbelianSchemesAndArithmeticModuliPartII §B2.3 to a smooth base of arbitrary dimension. Section 8.2 extends its §B2.21 product statement to those bases. Layer 9 owns descent through intersecting constant fields and the geometric Bogomolov proof; the linear-algebra argument is a supporting result. Hasse principles for random hypersurfaces or fibrations, homogeneous spaces, Massey products and zero-cycles are separate directions of the parent.

## Conventions

All varieties are separated and of finite type over the displayed field. An integral variety is nonempty, irreducible and reduced; a subvariety is closed integral unless a locally closed or reducible subset is specified. General closed subsets carry reduced structure for total degree. Family generic fibres used to infer irreducibility are geometrically integral. A constant family with an irreducible multisection need not have irreducible self fibre product: the multisection 2x=s of E×E over E has four components in its square, indexed by E[2].

Fix algebraic closures and embeddings of constants. In geometric Bogomolov, K/k is finitely generated of positive transcendence degree, k algebraically closed, and a polarization means a normal projective model with an ample line bundle. Geometric trace always means the K̄/k-trace after passing to K̄. In the global-field curve theorem, K may be a number field or a one-variable function field over an arbitrary constant field k. All characteristic-p arguments retain p=2 and p=3; a full level is chosen prime to p, and prime-to-p torsion is used only for the smooth multisection argument of §9.17.

Write X° for the complement of the union of positive-dimensional abelian cosets contained in X. Write X* for the complement of the maximal generically special subvarieties over a curve, using the supplier's dominant convention; for a vertical integral X the generically special union is empty and X*=X. A subgroup has rank ρ if Γ⊗ℚ has ℚ-dimension ρ, without a finite-generation assumption. The associated real norm satisfies |P|²=ĥ_L(P), and ⟨P,Q⟩=(ĥ_L(P+Q)−ĥ_L(P)−ĥ_L(Q))/2. For a vector of height 1, ⟨P,P⟩=1 and ĥ(2P)=4; using the parent's unhalved pairing directly would instead give diagonal 2.

Number-field heights are absolute: [2:1] has height log 2 over both ℚ and ℚ(i), although its relative ℚ(i)-height is 2 log 2. In Layers 0–6 the projective point height is the coefficient maximum height; cycle heights use the supplied Fubini–Study intersection normalization and its bounded coefficient comparison. Thus the coefficient height of the Chow form of [2:1] is log 2, whereas its supplied projective cycle height is (log 5)/2. Over function fields, keep k fixed, weight v by [k(v):k], and divide heights over K′ by [K′:K]. For [1:1/(t²+1)] over ℝ(t), the height is 2 and remains 2 over ℂ(t), since the two poles over ℂ each have residue degree two over the fixed ℝ, giving total 4 divided by [ℂ(t):ℝ(t)]=2.

For a polarized (A,L), uniformity uses the symmetric bundle L⁺=L⊗[−1]*L. The principal curve height is ĥ=ĥ_Θ₂/2 for the canonical twice-theta bundle Θ₂. Thus ĥ_Θ₂(P)=2ĥ(P) and ĥ(2P)=4ĥ(P). On the level-four universal family c₁(𝔏_g)=2c₁(L), hence deg_(𝔏_g⁴)(X)=8^r deg_L(X) and ĥ_(𝔏_g⁴)=4ĥ_(L⁺). For a genus-two Abel curve these degrees are 2 and 16. The stable Faltings height uses Faltings' metric normalization, as in ArakelovGeometryAndAbelianHeights §§2.7, 3.4; constants absorbing its genus-dependent lower bound use that same normalization.

All fields in the Lean signature lie in a single arbitrary universe, matching native abelian-variety base change. Isogenies mean finite surjective homomorphisms, including inseparable ones. Source numbering follows the editions in References: GGK uses published pages 189–235, DKY published pages 949–1001, and the remaining manuscripts their recorded version.

## Exact supplier contracts

### From Mathlib

Use `Metric.coveringNumber`, `Metric.coveringNumber_le_packingNumber` and `Metric.maximalSeparatedSet` from Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74,351,288, together with `Metric.IsSeparated` from Mathlib/Topology/MetricSpace/MetricSeparated.lean:43. The covering number counts closed balls with centres in the set and has values in ℕ∞; these definitions impose no compactness or finiteness. The finite-dimensional volume estimate in §0.4 is the additional target. Use `EuclideanSpace` from Mathlib/Analysis/InnerProductSpace/PiL2.lean:111, `Metric.closedBall` from Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:418 and `MeasureTheory.Measure.addHaar_closedBall` from Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500 for the packing argument. The last theorem assumes a finite-dimensional real normed space, the measurable/Borel structures and additive Haar measure, and a nonnegative radius. A closed ball is defined by dist≤radius, without a separation hypothesis in the pseudometric definition: radius zero is the distance-zero class, a singleton in the Euclidean spaces used here, while negative radius gives the empty set. Our packing theorem assumes strictly positive small radius before division. Use `Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean:61), `IntermediateField` (Mathlib/FieldTheory/IntermediateField/Basic.lean:52), `Algebra.trdeg` (Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45), `Submodule.span` (Mathlib/LinearAlgebra/Span/Defs.lean:46) and `Matrix.IsReducedRowEchelon` (Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:87) for finite-rank linear algebra and intersection-field descent. The reduced-row-echelon predicate supplies leading-entry conditions, not a field-of-definition theorem.

Use `Projectivization.logHeight` from Mathlib/NumberTheory/Height/Projectivization.lean:51 with its admissible absolute-value family. It is the logarithm of the corresponding multiplicative height, not intrinsically the absolute number-field normalization; the factor [K:ℚ] is supplied by the parent.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.AbelianVariety` and `TauCeti.AlgebraicGeometry.AbelianVariety.baseChange` from TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,281 and `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` from TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61. The carrier bundles a group scheme, properness and geometric integrality; it does not bundle a polarization or any height. The isogeny predicate is finite surjectivity of the underlying scheme homomorphism, so it includes [p] in characteristic p. Native elliptic canonical heights use the full x-height and are twice the degree-one O(0) height; Layer 12 uses the geometric degree-one height and the dynamical projection identity specified below (the native normalization is read in TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean and Limit.lean).


Use `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese` from TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84. It requires the chosen point to map to the identity and uniquely factors pointed morphisms through homomorphisms; it does not itself assert that X is a curve or that its map is an immersion. The headline signatures explicitly impose smoothness, properness, geometric integrality, dimension one and J.dim=g≥2. The point group is `CategoryTheory.MonObj.Hom.group` (Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58), in the `CategoryTheory.MonObj` scope. Its multiplication writes the abelian-variety addition used in §§3.6, 6.8 and 6.12.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 5.1–5.6 supply Chow groups, degree on proper zero-cycles, first Chern operations, projection formulas, external products and refined intersections; §5.12 supplies refined Bézout, including improper intersections. Its equidimensional inequality extends to total reduced degree by summing componentwise and discarding contained components. Sections 0.3 and 4.14 supply projective constructions and Hilbert families; §§4.11, 4.13 supply blow-ups of pencil base loci and Bertini. Generic pencil members are normalized before they are used as polarization models.

What SchemeAndStackFoundations must provide (the flat non-proper intersection contract): For a flat morphism g:B→Y of smooth projective varieties over an algebraically closed field, an integral closed X⊆B with f=g|X surjective, e=dim X−dim Y, and an integral closed V⊆Y not contained in Y_(e+1)={y:dim f⁻¹(y)≥e+1}, with V∩Y_(e+1) finite and contained in V^sm, prove Σ_i m_i[Z_i]≤g*[V]·[X] in CH_(dim V+e)(B)_ℚ, where Z_i are the components of f⁻¹(V) dominating V and m_i their scheme-theoretic multiplicities (xy-2022, Proposition 2.1, pp. 7–8).

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

Sections 0.16–0.30 supply the Weil machine, canonical abelian heights and pairings, quartic duplication, Silverman–Tate, independence of the fibrewise model and specialization. Sections 0.31–0.35 supply canonical cycle heights over polarized function fields, their nonnegative intersection formula, base/constant extension and good-reduction comparison. Sections 1.7–1.11 supply Mordell–Weil, the geometric trace, Lang–Néron and the kernel of the function-field height. Sections 5.1–5.5 supply cosets, stabilizers, the abelian variety generated by X−X with its degree bound, Ueno complements and finite rank. Sections 5.6–5.8 supply Manin–Mumford, including the trace-free positive-characteristic form and uniformity in fixed algebraic families. Sections 5.9a–f, 5.10–5.13c supply the qualitative Vojta method, difference bundles, nef-difference sections, dimension descent and specialization. Sections 5.17–5.19 supply minima, number-field Bogomolov and fixed-variety equidistribution.

The supplied function-field projective height is nonnegative, independent of common homogeneous-coordinate scaling and the finite coordinate field K′, and vanishes exactly when every coordinate ratio is algebraic over the fixed k. Over algebraically closed constants it agrees with the parent’s polarized height for the one-dimensional model.

Section 5.9b supplies its projective cycle height: for a pure r-cycle Z in Pⁿ over a number field K, take the arithmetic intersection of r+1 copies of O(1), with the Fubini–Study metric at infinity and standard integral-model metrics at finite places, divided by [K:ℚ]. Its API is additivity on effective cycles, projection, arithmetic Bézout, coefficient-height comparison and nonnegativity in this fixed metric normalization. The zero cycle has intersection height zero. The coefficient maximum height of the Chow form is the comparison quantity, rather than the definition of this cycle height. The arithmetic intersection height is unnormalized in degree; the canonical subvariety height of Layer 7 divides by (dim X+1)deg_L X. These two normalizations are kept distinct in interpolation (dgh-2021 §6.1; dmy-2026 §5).

**Checks.**

- The point [2:1] has supplied projective cycle height (log 5)/2. Its Chow form 2u₀+u₁ has coefficient height log 2 under the supplied comparison; equating these heights would give the wrong value.
- The coordinate point [1:0] has projective cycle height 0. Multiplying its homogeneous coordinates by 7 leaves that height 0; an unnormalized coordinate norm would instead add log 7.
- For the function-field projective height, [1:t] over k(t) has value 1, [1:c] for algebraic constant c has value 0, and [1:1/(t²+1)] over ℝ(t) has value 2. Omitting residue degrees gives the false value 1 in the last example.
- A double cycle has twice its unnormalized intersection height, whereas the normalized height of a subvariety does not acquire that multiplicity. This distinguishes the two notions used in Layers 5 and 7.

What HeightsRationalPointsAndObstructions must provide (the arithmetic interpolation contract): For a projectively normal complete abelian embedding by L on a g-dimensional A, irreducible X of dimension r≥1 and finite nonempty S⊆X not contained in a codimension-one equidimensional subset of degree at most deg_L(A)(deg_L X)²/g!, prove h(X)≤(deg_L(A)/g!+1)^(r+1)deg_L(X)(max_(x∈S)h(x)+3log(deg_L(A)/g!)) in the projective cycle-height normalization of HeightsRationalPointsAndObstructions §5.9b.



### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Sections 1.5–1.6 supply finiteness of Hilbert polynomials of geometrically integral subvarieties of fixed dimension and degree in a fixed projective ambient family, Chow forms with their projective coefficient embedding and base change. Section 2.1 supplies the relative Hilbert scheme, universal proper flat family and the geometrically integral fibre locus. The family in Layer 1 is this supplied family restricted to the reduced integral locus, rather than another representing scheme.

### From TauCetiRoadmap.PELModuli

Sections M5.1–M5.3 supply fine Siegel moduli with prime-to-characteristic full symplectic level, particularly level four over Q̄; M6.9–M6.10 supply the universal abelian scheme and Hodge line. The symmetric universal bundle in Layer 1 represents twice the principal polarization, so its fourth tensor power has class eight times that polarization. A principal genus-two Abel curve therefore has degree 16 in that embedding, not 8. The integral fixed-pairing level component uses Spec Z[1/N,ζ_N], not an unmarked component over Z[1/N].

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

A1 supplies rigidification, the theorem of the cube and torsion restriction; A2 supplies polarizations, projectively normal powers, relative ampleness and polarized isogenies; A3 supplies multiplication, quotient isogenies and torsion density; A6 supplies homomorphisms, normal-base extension, Poincaré reducibility and quotients. A2.7 supplies ample intersection positivity for §9.8 and the ample-limit argument of §9.17; A2.9 supplies the nef normalized bundles and nef differences over a smooth projective curve used in §§9.11 and 9.17. No projective-coordinate change is allowed to alter a controlled height bound without tracking its coefficient height.


### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

B0.1–B0.2 supply period-coordinate Betti maps and generic-rank invariance; B1.1–B1.5 supply the descended semipositive form, pointwise kernel identity, non-degeneracy and its positive top-power witness. B3.7–B3.9 and B4.2–B4.6 supply degeneracy loci, quotient criteria, fibre powers and difference products. B2.13 and B2.21–B2.23 supply generically special subvarieties over a smooth curve, their finite maximal members, openness of X* and full-rank points outside the special locus. B2.3 supplies the bounded-degree torsion assertion over a curve field. Section 8.1's higher-dimensional-base extension retains geometric trace zero.

The supplied X* API is openness, emptiness exactly for a generically special dominant X, finite maximal special members and X*∩Z⊆Z* for integral closed Z⊆X. These statements use the GH dominant convention; vertical components are treated by the convention above (gh-2019 Definition 1.2, Proposition 1.3, §3.1 and equation (10.4)).

**Checks.**

- A torsion section has X*=∅, as does the full abelian scheme.
- A non-torsion section in a geometrically trace-free elliptic family has X*=X; permitting arbitrary translates as special would give the wrong empty set.
- For a constant curve C₀ in a constant Jacobian, C₀×S is generically special even when C₀ has genus two; special does not mean only a torsion coset.
- On E×S with multisection 2x=s, its self fibre product has four components. Product-rank arguments apply to geometric generic integral fibres or to the separate components.

### From TauCetiRoadmap.ComplexComparisonPartII

C5 supplies integration over analytic cycles, extension across singular sets, the comparison of Chern integrals with algebraic intersections, and inequalities for wedges of semipositive forms. The cut-off form in §2.2 is semipositive but usually not closed: d(θω)=dθ∧ω. The intersection comparison uses the closed projective curvature representative above it.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

Sections 2.7 and 3.4 supply the Faltings metric and stable height; §§4.2–4.4 supply isogeny-height changes; §§5.5–5.8 supply modular heights, theta heights, their comparison and bounded-degree Northcott. Section 6.3 bounds the field degree needed for level structures. These comparisons are used with fixed embeddings, including their bounded and logarithmic errors.

What ArakelovGeometryAndAbelianHeights must provide (the controlled polarization embeddings contract): For every dimension and polarization degree, choose a symmetric very ample projectively normal abelian embedding and addition/difference polynomials whose c_NT and joint coefficient height are bounded by C(g,deg_L A)max{1,h_Fal(A)}, retaining the tensor-power and isogeny rescalings needed to pass back to every original ample polarization.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII

Section 0.3 supplies the geometric two-nef Siu inequality: on an integral projective d-fold with d≥1 over a field, nef line bundles F,M satisfy vol(F−M)≥Fᵈ−d(Fᵈ⁻¹·M); applied to qF and qtM with q clearing the denominators of a rational t≥0, a positive right side makes qF−qtM big. Sections 3.1–3.3 supply adelic intersections, Deligne pairings and projection formulas. Sections 4.6–4.8 supply algebraic-point heights, the big-bundle height inequality and the fundamental inequality between the essential minimum and the height of a subvariety. Sections 5.1–5.4 supply invariant extensions, adelic non-degeneracy, the general dynamical height inequality with generic equidistribution, and the Hodge bundle computing stable Faltings heights. Sections 6.1–6.4 supply Moriwaki heights and specialization; §6.4(1), the Silverman–Tate comparison, holds for every nef polarization, and §6.4(2), the specialization limit, keeps bigness. The height machine §6.2 holds for every polarization except Northcott, which needs bigness. Sections 8.4, 9.1–9.2 supply canonical theta and shift identities. Sections 12.1–12.6 supply potential bigness, its relative-power criterion, the product-grid degree bound, theta potential bigness after restriction to every integral parameter subvariety and cross-characteristic restriction. Section 13.1 supplies function-field Faltings heights, and §13.7 supplies the positive comparison height on the relative Jacobian obtained from Bost's lower bound (ArakelovGeometryAndAbelianHeights §6.5), both in Faltings' normalization.

For the function-field branches of Layer 10, bigness is over the field of constants. A constant genus-two curve over K with S=Spec K has a quasi-finite K-moduli map but does not meet this absolute bigness hypothesis. Its difference image C−C=J contains all constant torsion, so the stronger relative-K-only hypothesis would give a false theorem.

### From TauCetiRoadmap.StableReductionPartII

Sections 4.2 (full symplectic level on smooth curves), 4.4 (rigidity of full curve level) and 4.8 (the fine smooth full-level curve scheme) supply the fine scheme over the fixed-pairing cyclotomic base. Sections 6.3 (the smooth full-level Torelli morphism), 6.6 (finite Torelli fibres) and 6.7 (Hodge pullback along smooth full-level Torelli) supply Torelli with finite fibres and the pulled-back Hodge line. Sections 7.13 (fine-level and Picard export for DGH) and 7.15 (stable, level and Picard export for Yuan) supply the universal curve, the relative Picard parameter scheme and its universal classes. The level N is at least three and invertible on the base.

### From TauCetiRoadmap.JacobianChallengePartII

Sections 0.2–0.4 and 1.1–1.4 supply relative Picard degree components, Jacobians and principal polarizations. Sections 2.1–2.7 supply section-free Abel maps, the degree-one immersion and curve differences. Sections 3.2–3.13 supply degree-one theta and canonical twice-theta, its geometric class, symmetry, zero rigidification and ampleness. Layer 5 supplies the canonical Abel, universal shift and Faltings–Zhang maps; Layer 7 specializes them over full-level curve moduli. Layer 10 here proves non-degeneracy and small-point results for those actual maps.

**Checks.**

- On a genus-two curve with Weierstrass base point, theta is symmetric and Θ₂=O(2θ); the principal height is exactly half its height.
- At the origin both heights are zero; at a point of principal height a the twice-theta height is 2a and the height of twice the point is 4a.
- Replacing the principal height by the full twice-theta height doubles every threshold. These two normalizations must not share a numerical threshold constant.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Sections 1.1–1.10 supply Néron models and the abelian-scheme case; §3.10 supplies semistable reduction after finite extension over curve fields; §§5.1–5.2 supply good reduction under isogeny; §§3.13–3.14 supply Raynaud extensions and polarized uniformization. Potential good reduction at every geometric divisorial place is used in the nowhere-degenerate construction, and is not identified with a good model over the original field before finite extension.

### From TauCetiRoadmap.TropicalAndBerkovichArithmetic

Sections 6.2–6.4 supply Chambert-Loir model measures, semipositive and integrable metrics and local intersection heights, and §7.0 supplies Raynaud uniformization over rank-one fields; the four gaps below extend them to subvarieties of abelian varieties, and together they supply the measure inputs to Yamaki's Theorem E (yamaki-strict-support Corollary 7.22, p. 41).

What TropicalAndBerkovichArithmetic must provide (the abelian valuation map contract): At every geometric divisorial place v of K=k(B), with k algebraically closed and B normal projective of positive dimension, construct for every abelian variety A/K̄ with Raynaud uniformization over the completed algebraic closure at v the valuation map val_A:A_v^an→ℝ^n/Λ, with n the torus rank and Λ the valuation image of the period lattice, functorial for homomorphisms and compatible with products (yamaki-strict-support §§3.1–3.2, (3.0.13)–(3.0.14), pp. 12–15).

What TropicalAndBerkovichArithmetic must provide (the abelian canonical measure contract): At every geometric divisorial place v of K=k(B), with k algebraically closed and B normal projective of positive dimension, for an integral closed X of dimension d in an abelian variety A/K̄ with a symmetric ample canonically metrized L, prove that for every semistable alteration f:X′→X the normalized measure μ_(X′,f*L) is a positive sum of Lebesgue measures on non-degenerate canonical simplices with f_*μ_(X′,f*L)=μ_X=c₁(L|X)^d/deg_L X, so that supp μ_X is the union of the f-images of those simplices (yamaki-strict-support §5.3, pp. 25–27).

What TropicalAndBerkovichArithmetic must provide (the strict support dimension contract): At every geometric divisorial place v of K=k(B), with k algebraically closed and B normal projective of positive dimension, for X⊆A as in the abelian canonical measure contract, a semistable alteration f:X′→X, a rational polytope σ of a compatible subdivision of supp μ_X that is a strict support (μ_X−εδ_σ positive for some ε>0, δ_σ Lebesgue measure on σ), and a canonical simplex Δ with a rational u∈relint Δ and f(u)∈relint σ, prove dim f_aff(Δ)=dim Δ (yamaki-strict-support, Proposition 5.12, p. 29).

What TropicalAndBerkovichArithmetic must provide (the nonarchimedean small-point equidistribution contract): At every geometric divisorial place v of K=k(B), with k algebraically closed and B normal projective of positive dimension, for X⊆A as in the abelian canonical measure contract and a generic net of algebraic points of X whose canonical heights tend to zero, prove that the normalized Galois-orbit measures converge weakly to μ_X on A_v^an, and that α_*μ_Z=μ_Y for a generically finite surjective α:Z→Y between such subvarieties carrying a small generic net and its image (yamaki-strict-support, proof of Theorem 6.2, p. 31).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

Section 3.19 supplies existence and uniqueness of the reduced row echelon form over an arbitrary field: every matrix is left-multiplied by an invertible matrix to a reduced row echelon matrix, and two reduced row echelon matrices related by an invertible left factor are equal. Section 9.3 uses it over K for basis matrices of a subspace descended to a subfield; the reduced form does not depend on the field over which it is computed.

### From the remaining earlier roadmaps

InverseGaloisAndArithmeticFundamentalGroups IG.2 supplies Hilbert irreducibility for finitely generated characteristic-zero models used in simultaneous specialization; §IG.3.1, “Finitely many covers of bounded degree”, supplies finiteness up to isomorphism of connected finite étale covers of bounded degree of a connected smooth quasi-projective variety over an algebraically closed field of characteristic zero, used in §8.1. AlgebraicCurves Layers 10–11 supplies hyperelliptic involutions, Weierstrass points and the characteristic-zero Hurwitz bound 84(g−1). JacobianChallenge Layer F supplies the pointed Abel–Jacobi universal property. ArithmeticDynamics §§6.57–6.64 supplies standard elliptic projections and translation by two-torsion, with §6.64 supplying the identity h_E=ĥ_Lattès/2 for the degree-one O(0) height; §6.93 supplies unbounded common torsion orders, §6.110 the joint small-point bound, and §§6.111–6.112 the three-common-branch-values bound. For a point of projection height 2a, h_E=a. Two elliptic factors therefore give h_(L_X)=(ĥ₁+ĥ₂)/2, which is the normalization in §12.3.

## How to read the build

Layers 0–2 develop degree bookkeeping, bounded Hilbert families and the geometric level-case height inequality. Layer 3 proves uniform Bogomolov; Layers 4–6 combine the gap principle with quantitative Vojta–Mumford estimates and specialization to prove uniform Mordell–Lang. Layers 7–9 establish geometric Bogomolov over polarized function fields in all characteristics. Layers 10–11 use adelic potential bigness to prove the relative theorem and the uniform curve bound over every global field. Layer 12 identifies the bielliptic genus-two case through its elliptic quotients. Each Needs line names both statement carriers and inputs to the displayed proof route.

## Layer 0: Degrees and heights of subvarieties, product sets and packing

### 0.1 Degree of a subvariety with respect to a line bundle

Let X be a projective scheme over a field k, L a line bundle on X and Z ⊆ X a closed subscheme with irreducible components Z_i of dimension d_i. For an integral Z of dimension d put deg_L Z = (c₁(L)^d ∩ [Z]) ∈ ℤ, the degree of the zero-cycle c₁(L)^d ∩ [Z]; for an arbitrary closed Z put deg_L Z = Σ_i deg_L Z_i over all irreducible components (of possibly different dimensions), each counted once with its reduced structure. Thus the total degree of a closed subscheme is the total degree of its reduced support; multiplicities of a nonreduced structure never enter. For L ample, deg_L Z ≥ 1 when Z ≠ ∅. On a product X^M the degree is taken for `L^{⊠M}` = Σ p_i^*L, and for a closed immersion X ⊆ ℙⁿ it is taken for O(1). (ggk-2026, §2, (2.5)–(2.6) and Lemma 2.4, pp. 195–197; dgh-2021, §6.1, p. 25 (arXiv v3)).

Throughout this subsection, X projective over a field k; L a line bundle on X, ample for the positivity statements.

One proof route is the following. Define the degree of an integral Z through the intersection of `c₁(L)^{dim Z}` with the fundamental class [Z] in the Chow group of SchemeAndStackFoundations §§5.1–5.4 and take the degree of the resulting zero-cycle. Extend to closed subsets by summing over irreducible components with reduced structure; this is the convention of GGK §2 (the total degree), not the degree of the top-dimensional part only. Positivity for ample L: some multiple of L is very ample, and the degree of Z for the very ample multiple is the projective degree, which is positive; divide by the power of the multiple.

The defining object has the following API.

- deg_L Z ∈ ℕ for closed Z of a projective X and ample L; sum over irreducible components.
- deg_L (Z ∪ Z′) ≤ deg_L Z + deg_L Z′. Equality holds if no component of either subset is contained in a component of the other.
- For integral Z of dimension d and n ≥ 1, `deg_{L^{⊗n}}` Z = n^d deg_L Z.
- For geometrically integral Z ⊆ X and Z′ ⊆ X′, `deg_{L⊠L′}(Z × Z′)` = binom(dim Z + dim Z′, dim Z) deg_L Z `deg_{L′}` Z′. Over an algebraically closed field, irreducibility suffices (GGK (2.6)).
- For a coordinate projection q : X^M → X, L ample and closed Z ⊆ X^M, deg_L q(Z) ≤ `deg_{L^{⊠M}}` Z. For integral Z of dimension d with e = dim q(Z), write `L^{⊠M}` = q^*L ⊗ N with N the tensor product of the other M − 1 pullbacks; both are nef, so every term of the binomial expansion of `c₁(q^*L ⊗ N)^d ∩ [Z]` is nonnegative, and the term binom(d, e)·`(q^*L)^e N^{d−e} ∩ [Z]` is at least deg_L q(Z): after replacing L by a very ample power L^n (the term scales by n^d, deg q(Z) by n^e and fibre N-degrees by `n^(d−e)`), it counts the deg q(Z) fibres of Z over a general linear section of q(Z), each of N-degree at least 1 because N is ample on the fibres of q. For reducible Z, sum over components and use subadditivity. GGK uses this inequality in the proof of its Lemma 2.4 (ggk-2026, proof of Lemma 2.4, p. 197).
- For closed Z, Z′ of ℙⁿ, `Σ_{W component of Z ∩ Z′}` deg W ≤ deg Z · deg Z′ (refined Bézout; SchemeAndStackFoundations §5.12).
- For L ample and Z ≠ ∅, deg_L Z ≥ 1.

**Checks.**

- A closed point with residue field k has degree 1 for every line bundle; a closed point of residue degree 2 has degree 2.
- A line in ℙⁿ has O(1)-degree 1 and a smooth conic has degree 2.
- For a curve C of genus g ≥ 1 embedded in its Jacobian by an Abel–Jacobi map, deg_Θ C = g for a theta divisor Θ.
- The union of a line and a point off it in ℙ² has total degree 2, although its top-dimensional part has degree 1: the total degree is not the degree of the top-dimensional cycle.
- The empty subscheme has degree 0.
- The doubled rational point Spec k[ε]/(ε²) in ℙ¹ has total degree 1, the degree of its reduced point, whereas its fundamental cycle 2[P] has degree 2; reading the irreducible case with multiplicities would give the two clauses of the definition different values.
- For a line Z and a point P on Z in ℙ², deg(Z ∪ {P}) = 1 < deg Z + deg{P} = 2, although they have no identical irreducible component.

*Needs:* SchemeAndStackFoundations §§5.1–5.4, 5.12.

### 0.2 Products of point sets in a proper subvariety (Gao–Ge–Kühne Lemma 4.3)

Let X be an irreducible projective variety over a field k with a very ample line bundle L, let M ≥ 1 and let Z ⊊ X^M be a proper closed subset. There is c = c(M, dim X, deg_L X, `deg_{L^{⊠M}}` Z) > 0 such that every subset Σ ⊆ X(k) with Σ^M ⊆ Z(k) lies in X′(k) for a proper closed X′ ⊊ X with deg_L X′ < c. (ggk-2026, Lemma 4.3 and proof, pp. 207–208; dmy-2026, pp. 26–27 (arXiv v3)).

Throughout this subsection, X irreducible projective over k, L very ample on X; M ≥ 1; Z ⊊ X^M closed; Σ ⊆ X(k) with Σ^M ⊆ Z(k).

One proof route is the following. Induct on M; for M = 1 take X′ = Z. Split Z into the union Z′ of components dominating the first factor of X × `X^{M−1}` and the rest Z″; let q be the first projection. If the points of Σ outside q(Z″) give a fibre that is a proper subset of `X^{M−1}`, apply the induction hypothesis to that fibre, whose degree is bounded by Bézout and GGK (2.6). Otherwise Σ minus q(Z″) lies in a proper fibre X″ × {x}; take X′ = X″ ∪ q(Z″), bounding deg q(Z″) ≤ deg Z″ ≤ deg Z by the image estimate, and enlarge k to an algebraically closed field where needed.

**Checks.**

- The bound depends only on M, dim X, deg_L X and deg Z, not on Σ (GGK Lemma 4.3; DMY §5).
- For X = ℙ¹, M = 2 and Z the diagonal, any Σ with Σ² ⊆ Δ has at most one point, and X′ may be taken to be that point.
- The lemma is stated for all subsets Σ, finite or not: an infinite Σ is forced into X′.

*Needs:* §0.1; SchemeAndStackFoundations §§5.1–5.4, 5.12.

### 0.3 Many points of a curve escape a proper subvariety of its power (DGH Lemma 6.3)

Let C ⊆ ℙⁿ_k be an irreducible curve over an algebraically closed field and Z ⊆ (ℙⁿ_k)^M a closed subset with C^M ⊄ Z. There is B depending only on M, deg C and deg Z such that every Σ ⊆ C(k) with #Σ ≥ B satisfies Σ^M ⊄ Z(k). (dgh-2021, Lemma 6.3 and proof, p. 28 (arXiv v3)).

Throughout this subsection, C irreducible curve in ℙⁿ_k, k algebraically closed; Z closed in (ℙⁿ)^M with C^M ⊄ Z; the power M is a positive integer; cardinality comparisons for infinite Σ mean that every sufficiently large finite subset is allowed.

One proof route is the following. Apply the product-set lemma to X = C and Z ∩ C^M ⊊ C^M: a Σ with Σ^M ⊆ Z lies in a proper closed subset of C of bounded degree. A proper closed subset of an irreducible curve is finite with at most its degree many points, so B = c + 1 works with c from the product-set lemma.

**Checks.**

- For M = 1 the statement says a curve not contained in Z meets it in at most deg C · deg Z points (Bézout).
- B does not depend on the field of definition of C or on the height of C.

*Needs:* §0.2; §0.1.

### 0.4 Ball packing in Euclidean space (Rémond)

Let E be a real Euclidean space of dimension ρ and 0 < r ≤ R. For S ⊆ Metric.closedBall x₀ R, the internal covering number `Metric.coveringNumber` at radius r is finite and its real value is at most (1 + 2R/r)^ρ; equivalently S is covered by that many closed r-balls centred in S. (ggk-2026, §7.1, proof of Theorem 7.1, p. 221; dgh-2021, Proof of Proposition 8.1, p. 34 (arXiv v3)).

Throughout this subsection, E Euclidean of dimension ρ; 0 < r ≤ R; S ⊆ a closed ball B(x₀, R).

One proof route is the following. For every finite r-separated S₀⊆S, the open balls of radius r/2 about its points are disjoint and lie in B(x₀,R+r/2). Haar scaling gives #S₀(r/2)^ρ≤(R+r/2)^ρ, hence #S₀≤(1+2R/r)^ρ because r>0. An infinite separated set would have finite subsets exceeding this bound, so the packing number is finite with the same bound. Apply `Metric.coveringNumber_le_packingNumber`; equivalently `Metric.maximalSeparatedSet` is now a finite set of centres whose closed r-balls cover S. No compactness assumption on S is needed.

**Checks.**

- ρ = 0: one ball suffices, matching (1 + 2R/r)⁰ = 1.
- For S=[−r,r] in real dimension one and R=r>0, its internal covering number is 1, since the r-ball centred at 0 covers it; 1≤(1+2)¹=3. The estimate is an upper bound, not an equality.
- For S=∅ the internal covering number is 0, while a singleton has covering number 1. At r=0 a positive-length interval needs infinitely many zero-radius balls, so division by r is excluded.
- Centres must lie in the subset: covering by balls with arbitrary centres is the weaker statement, and the counting arguments need centres that are themselves points of the subgroup.

*Needs:* Mathlib `EuclideanSpace`, `Metric.closedBall`, `Metric.coveringNumber`, `Metric.coveringNumber_le_packingNumber`, `Metric.IsSeparated`, `Metric.maximalSeparatedSet` and `MeasureTheory.Measure.addHaar_closedBall`.

### Examples

Total degree distinguishes a line together with an exterior point (degree 2) from that line alone (degree 1); adding an interior point still gives degree 1. For a curve C of degree d, the product polarization on C² has degree 2d². On P¹ the diagonal test forces a set Σ with Σ²⊆Δ to have at most one point. In real dimension zero the packing bound is 1; in dimension one with R=r it is 3.

### Dependencies

SchemeAndStackFoundations §§5.1–5.6,5.12; AlgebraicModuliForArithmeticGeometry §§1.5–1.6; HeightsRationalPointsAndObstructions §§0.16,5.9b; Mathlib finite-dimensional Euclidean geometry and Haar measure.

## Layer 1: Restricted Hilbert schemes and non-degenerate fibred powers

### 1.1 Restricted Hilbert schemes of a polarized abelian variety

Let A be an abelian variety over ℚ̄ with a very ample line bundle L and r, d ≥ 1. Among the finitely many Hilbert polynomials of irreducible r-dimensional subvarieties of L-degree d, the Hilbert schemes of A form a projective scheme `H_{r,d}(A)` with universal family `X_{r,d}(A)` ⊆ A × `H_{r,d}(A)`. The locus of points whose fibre is geometrically integral is open; `H_{r,d}(A)°` is its maximal reduced subscheme. It is a quasi-projective variety whose ℚ̄-points are exactly the irreducible X ⊆ A with dim X = r and deg_L X = d, and for every irreducible component V of `H_{r,d}(A)` the intersection V ∩ `H_{r,d}(A)°` is empty or dense open in V. (ggk-2026, §3.1, (3.1)–(3.2), pp. 198–199).

Throughout this subsection, A abelian over ℚ̄; L very ample; r, d ≥ 1 integers.

One proof route is the following. Bound the Hilbert polynomials of irreducible subvarieties of fixed dimension and degree (finitely many; AlgebraicModuliForArithmeticGeometry §§1.5–1.6). Take the disjoint union of the corresponding Hilbert schemes (AlgebraicModuliForArithmeticGeometry §2.1) with its universal closed family. Geometric integrality of fibres of a proper flat family is an open condition; give the open locus its reduced structure.

The defining object has the following API.

- `H_{r,d}(A)°` as a reduced quasi-projective ℚ̄-scheme with universal family `X_{r,d}(A)°` → `H_{r,d}(A)°`.
- ℚ̄-points correspond bijectively to irreducible X ⊆ A with dim X = r and deg_L X = d.
- The universal family is flat and proper with geometrically integral fibres.
- For each component V of `H_{r,d}(A)`, V ∩ `H_{r,d}(A)°` is empty or dense open in V.
- Translation by a ∈ A(ℚ̄) acts on `H_{r,d}(A)°` compatibly with the universal family when L is replaced by t_a^*L.

**Checks.**

- For A=E with L=O_E(3[0]), r=1 and d=3, the member E has Hilbert polynomial 3n. A degree-one point has polynomial 1 and dimension zero, so is excluded by r≥1.
- For r = dim A and d = deg_L A the restricted Hilbert scheme is a single reduced point, the class of A.
- In an elliptic surface E × E, the union of two distinct fibres {P} × E and {Q} × E has dimension 1 and degree twice that of a fibre but is not a point of H°: reducible members are excluded.
- For E elliptic and A = E × E, use the very ample bundle (O_E(3·0)) ⊠ (O_E(3·0)). The diagonal has degree 6 and its translates form a one-dimensional family in `H_{1,6}(A)°`.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.5–1.6, 2.1; §0.1.

### 1.2 The restricted Hilbert scheme over the moduli of principally polarized abelian varieties

Let π_univ : 𝔄_g → 𝔸_g be the universal principally polarized abelian scheme over the fine moduli space of principally polarized abelian varieties of dimension g with level-4 structure over ℚ̄, and 𝔏_g a symmetric relatively ample line bundle on 𝔄_g/𝔸_g with `c₁(𝔏_g|_{A_b})` = 2c₁(L_b) for the principal polarization L_b, so that `𝔏_g^{⊗4}` is relatively very ample. For r ≥ 1 and d ≥ 1, H = `⊔_{P∈Ξ}` Hilb_P(𝔄_g/𝔸_g) over the finite set Ξ of Hilbert polynomials of r-dimensional subvarieties of `𝔏_g^{⊗4}`-degree d is projective over 𝔸_g; the locus with geometrically integral fibre is open, and H° = `H_{r,d}(𝔄_g/𝔸_g)°` is its maximal reduced subscheme, a quasi-projective ℚ̄-variety with universal family `X_{H°}` ⊆ `A_{H°}` = 𝔄_g `×_{𝔸_g}` H° → H°. Its ℚ̄-points classify isomorphism classes of triples ((A, λ, η), X) with (A, λ) principally polarized of dimension g, η a full symplectic level-4 structure on A[4] and X ⊆ A irreducible of dimension r and `𝔏_g^{⊗4}`-degree d; forgetting η is finite-to-one onto the unmarked pairs ((A, λ), X); the fibre of H° → 𝔸_g over b is `H_{r,d}(A_b)°`. (ggk-2026, §3.2, (3.4)–(3.7), pp. 200–201).

Throughout this subsection, g ≥ 1, r ≥ 1, d ≥ 1; level-4 structure so that 𝔸_g is a fine moduli scheme.

One proof route is the following. Import 𝔸_g with its universal abelian scheme from PELModuli M5–M6 (Siegel case, principal polarization, level 4). Choose 𝔏_g as the symmetric rigidified bundle whose fibres are twice the principal polarization (existence from the polarization theory of AbelianSchemesAndArithmeticModuli A2); `𝔏_g^{⊗4}` is relatively very ample. Form the relative Hilbert scheme for the finitely many Hilbert polynomials, restrict to the open locus of geometrically integral fibres and reduce.

The defining object has the following API.

- `H°_{r,d}` with `ι_{H°}` : H° → 𝔸_g and universal `X_{H°}` ⊆ `A_{H°}`.
- `ι_{H°}^{-1}(b)` = `H_{r,d}(A_b)°` for every b ∈ 𝔸_g(ℚ̄).
- For every morphism S → H° from a reduced variety, X_S ⊆ A_S is a flat proper closed family with geometrically integral fibres; it is irreducible when S is irreducible, and every component dominates a component of S.
- For (A, L) principally polarized and X ⊆ A irreducible of dimension r, `deg_{𝔏_g^{⊗4}|A}` X = 8^r deg_L X (GGK (4.10)).
- `ĥ_{𝔏_g^{⊗4}|A}` = 4 `ĥ_{L⊗[−1]^*L}` on A(ℚ̄) (GGK (4.12)).

**Checks.**

- For an elliptic curve E (g = 1) and X = E (r = 1), deg_L E = 1 for the principal polarization L = O(0) and `deg_{𝔏_1^{⊗4}}` E = 8.
- For g = 2 and the Abel–Jacobi curve C ⊆ Jac(C) (r = 1), deg_Θ C = 2, so C is a point of `H°_{1,16}`.
- Without level structure the moduli space is only coarse and carries no universal abelian scheme; the construction requires the fine level-4 moduli space.
- For a generic elliptic curve E (g = r = 1) and X = E, the symplectic bases of E[4] with a fixed Weil-pairing value number |SL₂(ℤ/4)| = 48; Aut(E) = {±1} and −1 acts on E[4] as −I ≠ I, so they give 24 distinct points of H°, all over the single unmarked pair ((E, O(0)), E). A description of the points by unmarked pairs would merge them.

*Needs:* §1.1; PELModuli M5–M6; AlgebraicModuliForArithmeticGeometry §§1.5–1.6, 2.1; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 1.3 Fibred powers of the universal subvariety and their moduli maps

For m ≥ 1 and a morphism S → H° (or S → `H_{r,d}(A)°`), `X_S^{[m]}` = X_S ×_S ⋯ ×_S X_S ⊆ `A_S^{[m]}` = A_S ×_S ⋯ ×_S A_S is the m-fold fibred power, with projection `π^{[m]}` : `X_S^{[m]}` → S and moduli map `ι^{[m]}` : `A_S^{[m]}` → `𝔄_g^{[m]}` to the m-fold fibred power of the universal abelian scheme over 𝔸_g (for a fixed A, the map `ι_A^{[m]}` to A^m). The fibre over s ∈ S is X_s^m ⊆ A_s^m. (ggk-2026, (3.3), p. 199 and (3.7), p. 201).

Throughout this subsection, S a variety mapping to H°; m ≥ 1.

One proof route is the following. Form the fibre products over S of the flat proper universal family; they are flat and proper over S. The moduli map is the base change of `ι_{H°}` to the fibred powers.

The defining object has the following API.

- `X_S^{[m]}` ⊆ `A_S^{[m]}` over S, with `π^{[m]}` and `ι^{[m]}`.
- (`X_S^{[m]}`)_s = (X_s)^m inside (A_s)^m.
- `π^{[m]}` is flat and proper; if fibres of X_S → S are geometrically integral then `X_S^{[m]}` is irreducible when S is (every component dominates S by openness of flat maps).
- `X_S^{[m+1]}` = `X_S^{[m]}` ×_S X_S compatibly with `ι^{[m+1]}` = `ι^{[m]}` × ι.

**Checks.**

- `X_S^{[1]}` = X_S and `ι^{[1]}` = ι.
- For S a point s, `X_S^{[m]}` = X_s^m ⊆ A_s^m.
- `X_S^{[2]}` is the fibre product over S, not the absolute product X_S × X_S: for dim S > 0 they have different dimensions (2 dim X_S − dim S versus 2 dim X_S).
- For the constant family X_S = E × S over a curve S, `X_S^{[2]}` = E² × S has dimension 3, whereas X_S × X_S has dimension 4.
- Negative control for the irreducibility clause: over S = E in characteristic zero, the multisection X = {(x, s) : 2x = s} ⊆ E × E is irreducible (isomorphic to E by x ↦ (x, 2x)) with four-point fibres, and its fibred square {2x₁ = 2x₂} is the union of the four components x₂ = x₁ + τ, τ ∈ E[2]. Likewise a family whose fibres are two points has four-point fibred-square fibres. Geometric integrality of the fibres, which these families lack, is what the clause uses.

*Needs:* §1.2; §1.1.

### 1.4 Finitely many points cut a family of subvarieties to a finite set (GGK Lemmas 3.1–3.2)

Let V ⊆ `H_{r,d}(A)°` be a nonempty, possibly reducible subvariety. (1) There are m₀ = m₀(V) points P₁, …, `P_{m₀}` ∈ A(ℚ̄) such that {[X] ∈ V(ℚ̄) : P₁, …, `P_{m₀}` ∈ X} is non-empty and finite. (2) Consequently, for every m ≥ m₀ there is P ∈ A^m(ℚ̄) whose fibre under `ι_A^{[m]}` restricted to `X_{r,d}(A)^{[m]}` `×_{H}` V is non-empty and finite. (ggk-2026, Lemma 3.1 and proof, p. 199; Lemma 3.2 and proof, pp. 199–200).

Throughout this subsection, A abelian over ℚ̄ with ample L; V ⊆ `H_{r,d}(A)°` a nonempty subvariety.

One proof route is the following. Fix X₀ ∈ V. Induct on the dimension of the family of members through the chosen points: in each positive-dimensional component W of the current family choose a point of X₀ not lying on some X_W ≠ X₀; two distinct irreducible subvarieties of the same dimension and degree do not contain one another, so the dimension drops. At each stage choose one such point for every positive-dimensional component of the current parameter locus, keeping X₀ throughout. Each stage lowers its maximal positive dimension, so finitely many stages and finitely many chosen points leave a finite nonempty locus. If it is finite initially, choose one point of X₀ so that m₀ ≥ 1. For m ≥ m₀ set P = (P₁, …, `P_{m₀}`, `P_{m₀}`, …, `P_{m₀}`); the fibre of `ι_A^{[m]}` over P projects isomorphically onto the finite set of part (1).

**Checks.**

- For V a single point the statement holds with m₀ = 1 and any point of X₀.
- For V the family of translates of an elliptic curve E × {0} in E × E, one point P₁ = (0, b) cuts V down to the single member E × {b}.

*Needs:* §1.1; §1.3.

### 1.5 Generic finiteness of the moduli map on fibred powers (GGK Lemma 3.3)

For an irreducible subvariety S ⊆ H° there is m₀ = m₀(S) ≥ 1 such that `ι^{[m]}` restricted to `X_S^{[m]}` is generically finite onto its image for every m ≥ m₀. (ggk-2026, Lemma 3.3 and proof, p. 202).

Throughout this subsection, S ⊆ H° irreducible.

One proof route is the following. Pick b ∈ `ι_{H°}(S)(ℚ̄)` and V = `(ι_{H°}|_S)^{-1}(b)` ⊆ `H_{r,d}(A_b)°`. The fibre of `ι^{[m]}|_{X_S^{[m]}}` over P ∈ A_b^m equals the fibre computed in GGK (3.8) for V, so by the preceding lemma some fibre is finite and non-empty. `X_S^{[m]}` is irreducible (every component dominates S by flatness, and the generic fibre is geometrically irreducible), so upper semicontinuity of fibre dimension gives generic finiteness.

**Checks.**

- If S is a point then `X_S^{[m]}` = X^m maps isomorphically and m₀ = 1.
- For S the family of all distinct translates of a fixed X, S is the image of A/Stab(X) and dim S = g − dim Stab(X); m₀ grows with the number of points needed to pin a translate. For X = E × {0} in E² the family has dimension one and the single point (0, b) determines the translate E × {b}, so m₀ = 1; for X with finite stabilizer the family has dimension g; for X = A it is one point.

*Needs:* §1.4; §1.3; §1.2.

### 1.6 Non-degenerate fibred powers over the restricted Hilbert scheme (GGK Proposition 3.4)

Let S ⊆ H° be irreducible with geometric generic point η, and assume (i) X_η is an irreducible subvariety of A_η, (ii) X_s generates A_s for every s ∈ S(ℂ), (iii) X_η has finite stabilizer. Then there is m₀ = m₀(S) ≥ 1 such that `X_S^{[m]}` is a non-degenerate subvariety of `A_S^{[m]}` → S for every m ≥ m₀. (ggk-2026, Proposition 3.4 and proof, pp. 202–203).

Throughout this subsection, S ⊆ H° irreducible satisfying (i)–(iii).

One proof route is the following. By the generic finiteness lemma, `ι^{[m]}|_{X_S^{[m]}}` is generically finite for m ≥ m₀(S). Gao’s non-degeneracy criterion for fibred powers (AbelianSchemesAndArithmeticModuliPartII B4) applies under (i)–(iii) once m ≥ max(m₀, dim S).

**Checks.**

- Hypothesis (iii) cannot be dropped: for X_s = A_s (r = g, stabilizer A_s) and dim S > 0, `X_S^{[m]}` = `A_S^{[m]}` has complex dimension mg + dim S while its Betti map takes values in a real torus of dimension 2mg, so it is degenerate for every m.
- The proposition is applied only to the components of the closure of S_gen (GGK Lemma 3.5), where (i)–(iii) hold.

*Needs:* §1.5; §1.3; AbelianSchemesAndArithmeticModuliPartII B0–B4.

### 1.7 The locus of finite stabilizer and generation

For a subvariety S ⊆ H°, S_gen ⊆ S(ℚ̄) is the set of s such that `Stab_{A_s}(X_s)` is finite and X_s generates A_s (no proper abelian subvariety contains a translate of X_s, equivalently the abelian subvariety generated by X_s − X_s is A_s). (ggk-2026, Lemma 3.5, (3.9), p. 203).

Throughout this subsection, S ⊆ H° a subvariety.

One proof route is the following. Use the parent’s stabilizers and the abelian subvariety generated by differences.

The defining object has the following API.

- S_gen as a subset of S(ℚ̄).
- s ∈ S_gen iff Stab(X_s) is finite and ⟨X_s − X_s⟩ = A_s.
- For S′ ⊆ S, S′_gen = S_gen ∩ S′(ℚ̄).
- If s ∉ S_gen because Stab(X_s) has positive dimension, then X_s° = ∅.

**Checks.**

- For an Abel–Jacobi curve C ⊆ Jac(C) of genus g ≥ 2, the point of H° it defines lies in H°_gen.
- For X = B a proper abelian subvariety, Stab(X) = B is infinite and X does not generate A, so [B] ∉ H°_gen.
- For X = A, the stabilizer is A, so [A] ∉ H°_gen although A generates A.

*Needs:* §1.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 1.8 Components of the closure of the generic locus satisfy the non-degeneracy hypotheses (GGK Lemma 3.5)

For a subvariety S ⊆ H°, each irreducible component S′ of the Zariski closure of S_gen, with its reduced structure, satisfies hypotheses (i)–(iii) of the non-degenerate fibred powers theorem for `X_{S′}` ⊆ `A_{S′}` → S′. (ggk-2026, Lemma 3.5 and proof, p. 203).

Throughout this subsection, S ⊆ H° a subvariety; S′ an irreducible component of the closure of S_gen.

One proof route is the following. (i): every fibre over H° is geometrically integral. (ii): use the proper difference-sum map `X^{[2g]}` → A, (x₁,…,x_g,y₁,…,y_g) ↦ Σ(x_i−y_i). Its fibre image equals the abelian subvariety generated by X_s−X_s. Surjectivity holds precisely on the generation locus. The complement of this image in A has open image in S under the smooth structure map, so generation is closed and extends from the dense generic locus. (iii): if Stab(X_η)⁰ were positive-dimensional, spread it out over a quasi-finite dominant S″ → S′; then every fibre over a dense open has positive-dimensional stabilizer, contradicting density of S_gen.

**Checks.**

- If S_gen is empty there are no components and the statement is vacuous.
- The closure is necessary: S_gen itself need not be constructible-open, but its closure’s components carry the hypotheses generically.

*Needs:* §1.7; §1.6; §1.2.

### Examples

On E×E with O_E(3·0) on each factor the diagonal has degree 6, and its translates give a one-dimensional restricted Hilbert family. In the level-four genus-two family an Abel curve has degree 16. If the base has dimension one and the fibres are curves, the second fibre power has dimension 3, whereas the absolute square has dimension 4.

### Dependencies

Layer 0; AlgebraicModuliForArithmeticGeometry §§1.5–1.6,2.1; PELModuli M5–M6; AbelianSchemesAndArithmeticModuli A2; AbelianSchemesAndArithmeticModuliPartII §§B4.2–B4.6.

## Layer 2: The height inequality for non-degenerate subvarieties

### 2.1 The principal polarization and level hypothesis (Hyp)

An abelian scheme π : A → S over a variety satisfies (Hyp) if it carries a principal polarization and a symplectic level-ℓ structure for some ℓ ≥ 3, compatible with the polarization. Then S → `𝔸_{g,ℓ}` classifies it, A is the pullback of the universal abelian scheme, and after shrinking S, A admits a closed immersion A → ℙⁿ × S whose generic fibre is projectively normal, obtained from `L^{⊗l}`, l ≥ 4, for a symmetric ample L on the generic fibre. Extending the embedding over the base may require a twist by a bundle from S. (dgh-2021, §1.2, p. 5, and Remark 3.1, p. 13 (arXiv v3)).

Throughout this subsection, π : A → S an abelian scheme over an irreducible quasi-projective variety over ℚ̄; for the embedding, S regular, irreducible, quasi-projective and Zariski open in a projective S̄ ⊆ ℙ^m (DGH §1.2 and Remark 3.1).

One proof route is the following. A principal polarization and a level-ℓ structure with ℓ ≥ 3 give a classifying map to the fine moduli space (PELModuli M5). Choose a projectively normal power of a symmetric ample bundle on the generic fibre (A2), choose a basis there, and spread the resulting immersion and equations to a dense open of S. A base twist extends the projective embedding when required; it does not alter fibrewise Néron–Tate heights (DGH Remark 3.1).

The defining object has the following API.

- A structure on π : A → S: a principal polarization λ and a symplectic level-ℓ structure, ℓ ≥ 3.
- Under (Hyp) there is a unique S → `𝔸_{g,ℓ}` with A ≅ the pullback of the universal family.
- (Hyp) is preserved by base change S′ → S.
- Every principally polarized abelian scheme acquires (Hyp) after a finite étale base change (adjoin the level-ℓ structure).
- After shrinking S, a basis on the generic fibre of `L^{⊗l}`, l ≥ 4, spreads to A → ℙⁿ × S with projectively normal generic fibre. A base twist may be necessary; no global trivialization of `π_*L^{⊗l}` is asserted.

**Checks.**

- The Legendre family y² = x(x − 1)(x − λ) over ℙ¹ ∖ {0, 1, ∞} has full level-2 structure but not level ℓ ≥ 3; adjoining 3-torsion gives a finite étale cover satisfying (Hyp) for g = 1.
- A principally polarized abelian variety with level-ℓ structure, ℓ ≥ 3, has no non-trivial automorphism preserving both (Serre’s lemma), which is why the moduli space is fine.
- Level 2 does not suffice: [−1] preserves every level-2 structure, so the moduli problem is not rigid.

*Needs:* PELModuli M5–M6; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 2.2 The compactly supported cut-off of the Betti form

Let π : A → S satisfy (Hyp) over ℚ̄ ⊆ ℂ, ω the Betti form on A^an (a closed semipositive (1,1)-form, AbelianSchemesAndArithmeticModuliPartII B1), s₀ ∈ S^an, Δ a relatively compact contractible neighbourhood of s₀ and ϑ : S^an → [0, 1] smooth with compact support K ⊆ Δ and ϑ(s₀) = 1. Put θ = ϑ ∘ π. Then θω is a smooth semipositive (1,1)-form on A^an with compact support in `π^{-1}(K)`, not closed in general; it extends by zero to the compactification. For a non-degenerate X one takes s₀ = π(P₀) for a smooth point P₀ of X with `(ω|_X)^{∧ dim X}_{P₀}` > 0. (dgh-2021, §3.2 and Remark 3.3, pp. 14–15 (arXiv v3)).

Throughout this subsection, (Hyp) holds; S^an is the analytification of the smooth locus used to define ω.

One proof route is the following. On `π^{-1}(Δ)` the Betti map trivializes A^an as Δ × `(ℝ/ℤ)^{2g}`, and ω is the pullback of the standard translation-invariant form (B0–B1). Multiply by θ; semipositivity is pointwise and preserved by multiplication by a nonnegative function; compact support follows from that of ϑ. Extend by zero across the complement of Δ; compact support inside Δ makes that extension smooth, including on the projective compactification.

The defining object has the following API.

- θω as a smooth (1,1)-form with compact support on A^an.
- θω is semipositive at every point.
- supp(θω) ⊆ `π^{-1}(K)`, compact.
- [N]^*(θω) = N² θω for N ≥ 1, since [N]^*ω = N²ω and θ is constant along fibres.
- If `(ω|_X)^{∧d}_{P₀}` > 0 and ϑ(π(P₀)) = 1, then `∫_{X}` `(θω)^{∧d}` > 0.

**Checks.**

- For a constant family A = A₀ × S, ω is the pullback of the flat Kähler form of A₀ (the Betti map is the projection), and θω = ϑ·ω.
- θω is not closed when dϑ ≠ 0 on the support of ω: d(θω) = dθ ∧ ω; the proof uses only semipositivity, never closedness of θω.
- Pulling back by [2] multiplies θω by 4, matching ĥ([2]P) = 4ĥ(P).

*Needs:* AbelianSchemesAndArithmeticModuliPartII B0–B4; §2.1.

### 2.3 The graph construction X_N with the line bundles F and M

Under (Hyp) with A ⊆ ℙⁿ × S ⊆ ℙⁿ × ℙ^m, let X ⊆ A be closed irreducible dominating S and N ≥ 1. Let X_N = {(P, [N]P) : P ∈ X} ⊆ A ×_S A, viewed in ℙⁿ × ℙⁿ × ℙ^m, and X̄_N its Zariski closure, so dim X̄_N = dim X. Put F = `O(0, 1, 1)|_{X̄_N}` and M = `O(0, 0, 1)|_{X̄_N}`. For P_N = (P, [N]P) one has `h_{X̄_N, F}(P_N)` = h([N]P) + O(1) and `h_{X̄_N, M}(P_N)` = h(π(P)) + O(1), with O(1) depending on N. (dgh-2021, §3.3, (3.3)–(3.5), p. 15 (arXiv v3)).

Throughout this subsection, (Hyp); X ⊆ A closed irreducible dominating S; N ≥ 1.

One proof route is the following. The graph of [N] is closed in A ×_S A; restrict to X and close up in the projective triple product. Heights for O(0,1,1) and O(0,0,1) restricted to X̄_N are, by the height machine (HeightsRationalPointsAndObstructions §0.16), the Weil heights of the projections up to bounded functions.

The defining object has the following API.

- X̄_N ⊆ ℙⁿ × ℙⁿ × ℙ^m with F and M.
- dim X̄_N = dim X.
- h_F(P_N) = h([N]P) + O_N(1) on X_N(ℚ̄).
- h_M(P_N) = h(π(P)) + O_N(1).
- F and M are nef on X̄_N (restrictions of globally generated bundles).

**Checks.**

- For N = 1, X̄_1 is the closure of the diagonal copy of X and F restricts to O(1, 1) on X.
- For a constant family and X a constant section {P₀} × S with P₀ torsion of order dividing N, X_N lies in {P₀} × {0} × S.
- X_N itself is not projective when S is not; intersection numbers are taken on the closure X̄_N.

*Needs:* §2.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1.

### 2.4 Lower bound for the top self-intersection (DGH Proposition 4.2)

Under (Hyp), let X ⊆ A be closed irreducible of dimension d dominating S, with a smooth point of X^an at which `(ω|_X)^{∧d}` > 0. There is κ > 0, independent of N, such that (`F^{·d}`) ≥ κ `N^{2d}` on X̄_N for every N ≥ 1. (dgh-2021, Proposition 4.2 and proof, pp. 17–19 (arXiv v3)).

Throughout this subsection, (Hyp); X closed irreducible, dim X = d, dominant over S, with a smooth point where the top power of ω|_X is positive.

One proof route is the following. Choose a Fubini–Study representative α of O(1,1) on A and C > 0 with C·θα − θω ≥ 0 on A_Δ (compactness of K). Pull back by [N]: C·[N]^*(θα) − N²θω is semipositive, so by the semipositive wedge inequality `(C·[N]^*(θα))^{∧d}` ≥ `N^{2d}(θω)^{∧d}` on X ∩ A_Δ. Integrate over X; the left side is bounded by C^d times the intersection number of F on X̄_N (ComplexComparisonPartII C5, the DGH integration contract), the right side is `N^{2d}` times a positive constant by the choice of P₀.

**Checks.**

- For a degenerate X, for instance a constant section of a constant family (d = dim S), the integral of (θω)^d vanishes and no such κ exists.
- The exponent is 2d, the total dimension count: the height of [N]P grows like N², and F has d factors.

*Needs:* §2.3; §2.2; ComplexComparisonPartII C5.

### 2.5 Upper bound for the mixed intersection (DGH Proposition 4.3)

With A presented by the projectively normal symmetric embedding of (Hyp) (l ≥ 4) and X ⊆ A closed irreducible of dimension d ≥ 1 dominating S, there is c > 0 depending on the data such that (M·`F^{·(d−1)}`) ≤ c `N^{2(d−1)}` on X̄_N for every N a power of 2. (dgh-2021, Proposition 4.3 and proof, pp. 19–21 (arXiv v3)).

Throughout this subsection, Projectively normal symmetric embedding with l ≥ 4; X dominant over S, dim X = d ≥ 1; N = 2^k.

One proof route is the following. Write [2^k] by iterating the bihomogeneous quartic formulas for duplication (HeightsRationalPointsAndObstructions §0.25); the coordinates of [N]P are forms of degree 4^k = N² in P with base-dependent coefficients of bounded degree D′. X̄_N lies in the intersection of hypersurfaces of these degrees; the supplied refined Bézout and positivity bound the mixed degree (M·`F^{d−1}`) by a constant times `(4^k max{1, D′})^{d−1}`. Use max{1, D′} in place of D′ in the displayed estimate (4.13).

**Checks.**

- The exponent 2(d − 1) is two less than 2d in the lower bound (one fewer power of N²), which is what allows Siu’s criterion to produce sections of `F^{⊗q}` ⊗ `M^{⊗ −qcN²}`.
- For d = 1 the bound says (M) on the curve X̄_N is bounded independently of N, as M is pulled back from the base and X̄_N → π(X) has degree independent of N.

*Needs:* §2.3; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1; SchemeAndStackFoundations §§5.1–5.4, 5.12.

### 2.6 Height inequality on the total space (DGH Proposition 4.1)

Under (Hyp), let X ⊆ A be closed irreducible of dimension d dominating S, with a smooth point of X^an at which `(ω|_X)^{∧d}` > 0. There is c₁ > 0 such that for every N a power of 2 there are a Zariski open dense U_N ⊆ X and c₂(N) with h([N]P) ≥ c₁N²h(π(P)) − c₂(N) for all P ∈ U_N(ℚ̄). (dgh-2021, Proposition 4.1, p. 16; proof §4.3, pp. 21–22 (arXiv v3)).

Throughout this subsection, (Hyp); X closed irreducible, dimension d, dominant over S; a smooth point with positive top Betti form.

One proof route is the following. For d ≥ 1 choose a rational c₁ > 0 with c₁ c d < κ, and a positive integer q divisible by its denominator. The case d = 0 is immediate. Both graph bundles F and M are nef, as restrictions of pullbacks of projective O(1). The lower and upper intersection bounds imply F^d > d·c₁N²·(M·`F^{d−1}`). The geometric two-nef Siu inequality (ArakelovGeometryAndAbelianHeightsPartII §0.3) gives vol(F−c₁N²M) ≥ F^d−d·c₁N²·(M·`F^{d−1}`) > 0, so it makes `F^{⊗q}` ⊗ `M^{⊗(−qc₁N²)}` big. Replacing q by a multiple gives a nonzero section, with all tensor exponents integral. Heights are bounded below off the base locus of that section (HeightsRationalPointsAndObstructions §0.17); translate through the graph heights h_F and h_M to get h([N]P) ≥ c₁N²h(π(P)) − c₂(N) on the complement U_N.

**Checks.**

- c₁ does not depend on N; only U_N and c₂ do.
- For a fixed elliptic curve with embedding degree four, S a point and N=2, the graph has deg F=4·2²=16 and deg M=0. Here M is trivial and is not ample, but vol(F−tM)=16 for every rational t≥0; the two-nef bound gives 16≥16>0.
- The inequality fails on torsion sections of a non-constant elliptic family over a curve: ĥ = 0 while h(π(P)) is unbounded; such a section is a degenerate subvariety and is excluded by the Betti-form hypothesis.

*Needs:* §2.4; §2.5; §2.3; ArakelovGeometryAndAbelianHeightsPartII §0.3; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 2.7 The height inequality under (Hyp) (DGH Theorem 1.6)

Let S be a regular irreducible quasi-projective variety over ℚ̄, Zariski open in S̄ ⊆ ℙ^m, and π : A → S an abelian scheme satisfying (Hyp), presented by A → ℙⁿ × S from `L^{⊗l}`, l ≥ 4, with L symmetric ample on the generic fibre. If X ⊆ A is closed irreducible over ℚ̄, dominates S and is non-degenerate, there are c₁ > 0, c₂ ≥ 0 and a Zariski open dense U ⊆ X with ĥ_A(P) ≥ c₁h(π(P)) − c₂ for all P ∈ U(ℚ̄), where ĥ_A is the fibrewise Néron–Tate height of the embedding bundle. (dgh-2021, Theorem 1.6, pp. 4–5; proof §5, pp. 22–23 (arXiv v3)).

Throughout this subsection, S regular irreducible quasi-projective over ℚ̄; (Hyp); X closed irreducible, dominant, non-degenerate.

One proof route is the following. Non-degenerate means full Betti rank somewhere, equivalently `(ω|_X)^{∧d}` ≠ 0 at a smooth point over S^sm (AbelianSchemesAndArithmeticModuliPartII B1). Silverman–Tate (HeightsRationalPointsAndObstructions §0.26): |ĥ(Q) − h(Q)| ≤ c₀ max{1, h(π(Q))}. Apply the total-space inequality and Silverman–Tate to [N]P, using ĥ([N]P)=N²ĥ(P), and divide the entire inequality by the positive integer N². Replace the base height by max{1,h} where needed and absorb its bounded change. Then ĥ(P) ≥ (c₁−c₀/N²)h(π(P))−(c₂(N)+c₀)/N². Fix N a power of two with N²≥2c₀/c₁; this includes ĥ(P)=0 without division by ĥ(P).

**Checks.**

- For S a point the statement is trivial (h(π(P)) is constant).
- A torsion section of a non-isotrivial elliptic scheme over a curve is degenerate, and on it ĥ = 0 while h(π(P)) is unbounded, so non-degeneracy cannot be dropped.

*Needs:* §2.6; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuliPartII B0–B4.

### 2.8 DGH height inequality in Weil-height form: comparison with the adelic export

Let π : A → S be an abelian scheme over an irreducible quasi-projective variety S over ℚ̄, L a symmetric relatively ample line bundle on A/S and M an ample line bundle on a projective compactification S̄ of S. If X ⊆ A is an irreducible (not necessarily closed) non-degenerate subvariety over ℚ̄, there are c₁ > 0, c₂ ≥ 0 and a Zariski open dense U ⊆ X with `ĥ_{A,L}(P)` ≥ c₁ `h_{S̄,M}(π(P))` − c₂ for all P ∈ U(ℚ̄). This is the abelian-scheme Weil-height specialization of ArakelovGeometryAndAbelianHeightsPartII §5.3, compared here with the geometric level-case construction of §2.7; it is not a second owner of the general dynamical inequality. (dgh-2021, Theorem B.1 and proof, pp. 40–47 (arXiv v3); ggk-2026, (4.6), p. 206).

Throughout this subsection, S irreducible quasi-projective over ℚ̄; L symmetric relatively ample; M ample on a compactification; X irreducible non-degenerate.

One proof route is the following. Import the general dynamical theorem from ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3 with f=[2] and its invariant adelic extension. Spread the finitely many data over a number field, identify its fibrewise canonical height with the Néron–Tate height (HeightsRationalPointsAndObstructions §§0.19, 0.28), and identify Betti non-degeneracy with adelic non-degeneracy (ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3). The remaining steps give the geometric comparison route from the level case, not another ownership claim for the general theorem. Replace X by its closure and S by the closure of π(X) (dévissages 1–2), keeping non-degeneracy by birational invariance of the generic Betti rank (B0); choose a positive Betti-rank witness over the regular locus of the base. Restrict to the regular locus of S (dévissage 3). Over the function field A is isogenous to a principally polarized abelian variety (AbelianSchemesAndArithmeticModuli A2); spread the isogeny over a dense open and compare Néron–Tate heights (dévissages 4–5). Adjoin a level-ℓ structure, ℓ ≥ 3, after a finite étale base change, using quasi-sections (SchemeAndStackFoundations §0.8) and that heights and non-degeneracy are preserved (dévissage 6). Apply the (Hyp) case with `ĥ_{A,L}` comparable to ĥ_A for the embedding bundle (generic independence of fibre heights, HeightsRationalPointsAndObstructions §§0.19, 0.28), and compare `h_{S̄,M}` with the restriction of the Weil height (dévissage 7). The resulting family satisfies (Hyp) of §2.1.

**Checks.**

- Theorem B.1 restricted to a curve S and a non-generically-special X recovers Gao–Habegger’s Theorem 1.4 on X* (see the geometric Bogomolov layer).
- The Yuan–Zhang height inequality for non-degenerate subvarieties of polarized dynamical systems (ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3) specializes to this statement for A → S with f = [2]; the geometric intersection route through §2.7 and the supplied adelic theorem have the same specialization; the comparison route above uses that supplied theorem.
- X need not be closed: a non-degenerate open subset of a closed X gives the same inequality on a smaller U.

*Needs:* §2.7; §2.1; SchemeAndStackFoundations §0.8; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuliPartII B0–B4; AbelianSchemesAndArithmeticModuli A1–A3, A6; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### Examples

For the cut-off form, [2]* multiplies the form by 4 and its d-fold wedge by 4^d. For a curve graph d=1 the mixed intersection is the degree of the base map, independent of N; the top intersection grows at least as N² when the Betti rank is two. A constant torsion section has Betti rank zero and cannot satisfy the lower bound.

### Dependencies

Layer 1; HeightsRationalPointsAndObstructions §§0.16–0.30; AbelianSchemesAndArithmeticModuliPartII B0–B1; ComplexComparisonPartII §C5.4; SchemeAndStackFoundations Layer 5; ArakelovGeometryAndAbelianHeightsPartII §0.3 for geometric two-nef Siu and §5.4 for the final comparison.

## Layer 3: Equidistribution in families and uniform Bogomolov

### 3.1 Graph-degree normalization of the supplied Betti measure

Let π : A → S be a polarized abelian scheme over a smooth irreducible quasi-projective variety over a number field K ⊆ ℂ, and X ⊆ A a non-degenerate irreducible subvariety of dimension d dominating S. The top power `(β|_{X^{sm}})^{∧d}`, extended by zero, is a nonzero positive Radon measure, where β is Kühne’s semipositive closed form, proportional to the Betti form. The invariant adelic extension supplies its canonical normalization (ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3). When X admits a generic sequence of height tending to zero, Kühne Theorem 1 and Lemma 25 identify the equidistribution measure as μ_X = `κ_X^{-1}(β|_X)^{∧d}`, with κ_X the positive finite normalized graph-degree limit. Convergence is against compactly supported tests; this formulation asserts no total mass at the boundary. (kuhne-2021, Theorem 1, p. 3; Lemmas 7–8, pp. 17–21; Lemma 25, p. 38 (arXiv v4); ggk-2026, §5.1, Step 2, p. 213).

Throughout this subsection, A → S abelian scheme over a smooth irreducible base; X ⊆ A irreducible, non-degenerate, dominant.

One proof route is the following. Restrict the semipositive closed Betti form to the smooth locus of X and take its top power; it is a positive smooth measure on `X^{sm}(ℂ)`, non-zero by non-degeneracy (B1). Extend by zero across the singular locus (Lelong integration over analytic cycles, ComplexComparisonPartII C5). Import the canonical measure from ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3 and its Betti-form comparison. Under the generic-small-sequence hypothesis of Kühne Theorem 1, use Lemma 25 to identify its scalar with `κ_X^{-1}`; β is proportional to the Betti form by Lemmas 7–8.

The defining object has the following API.

- μ_X as a positive Radon measure on X(ℂ).
- μ_X ≠ 0 for non-degenerate X.
- On `X^{sm}(ℂ)` over `S^{sm}`, μ_X = `κ_X^{-1}(β|_X)^{∧d}`, a positive constant multiple of `(ω|_X)^{∧d}`.
- The smooth density of μ_X is zero at a point where the Betti map restricted to X is not of full rank (kernel identity of B1).
- For the product polarization on A₁ ×_S A₂ the Betti form is pr₁^*β₁ + pr₂^*β₂. On a non-degenerate product subvariety of dimension e, its equilibrium measure is the e-th power of this restricted form with the canonical scalar. This does not assert an unspecified product measure on S.
- At an archimedean place, μ_X is proportional to the canonical measure `c₁(L̄_{[2]}|_X)^{∧d}` of the invariant adelic extension (ArakelovGeometryAndAbelianHeightsPartII §5.1).

**Checks.**

- For S a point and X = A, μ_A is a positive multiple of Haar measure on A(ℂ), and the equidistribution theorem specializes to Szpiro–Ullmo–Zhang (whose limit is the normalized Haar measure).
- For a torsion section X of an elliptic scheme over a curve, (ω|_X) vanishes identically, X is degenerate and no equilibrium measure is defined.
- For a non-torsion section of a non-isotrivial elliptic scheme over a curve (DeMarco–Mavraki), the measure is the pullback of the flat form by the section, a positive measure on the base curve.

*Needs:* AbelianSchemesAndArithmeticModuliPartII B0–B4; ComplexComparisonPartII C5; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 3.2 Equidistribution in families of abelian varieties (Kühne)

Let π : A → S be an abelian scheme over a smooth irreducible quasi-projective variety over a number field, L a symmetric relatively ample line bundle and X ⊆ A a non-degenerate irreducible subvariety dominating S, with equilibrium measure μ_X at an archimedean place. For every continuous compactly supported f on X(ℂ) and every ε > 0 there are δ > 0 and a proper Zariski closed Z ⊊ X such that |∫ f dμ_X − (1/#O(x)) `Σ_{y ∈ O(x)}` f(y)| < ε for every x ∈ (X ∖ Z)(ℚ̄) with ĥ_L(x) < δ, where O(x) is the Galois orbit of x. Equivalently, the Galois orbits of every X-generic sequence (x_i) with ĥ_L(x_i) → 0 converge weakly to μ_X on compactly supported test functions. (kuhne-2021, Theorem 1, p. 3; proof §3, pp. 28–38 (arXiv v4); ggk-2026, §5.1, Steps 2 and 4, pp. 213–215).

Throughout this subsection, S smooth irreducible quasi-projective over a number field; X non-degenerate irreducible dominant; test functions continuous with compact support.

One proof route is the following. Generic-sequence form: by the Yuan–Zhang theorem for non-degenerate subvarieties of the polarized dynamical system (A, [2], L) (ArakelovGeometryAndAbelianHeightsPartII §5.3, part (2)), Galois orbits of a generic sequence with ĥ_L → 0 equidistribute for the canonical measure of `L̄_{[2]}|_X`. Identify the canonical measure with μ_X at archimedean places (the Betti-to-canonical measure comparison of §3.1): the curvature form of the invariant metric on L is the Betti form (Kühne Lemma 25; Yuan–Zhang §6.2.2). Uniform form: if no (δ, Z) existed for some f, ε, choose x_i with ĥ(x_i) < 1/i avoiding the first i members of an enumeration of proper closed subsets defined over the number field and violating the estimate; this sequence is generic, contradicting the generic form. Kühne’s own proof (DGH height inequality, arithmetic intersection on compactified models, a family version of Zhang’s variational argument) is an alternative route that avoids adelic line bundles on quasi-projective varieties.

**Checks.**

- For S a point and X=A, this is Szpiro–Ullmo–Zhang equidistribution with Haar probability measure (HeightsRationalPointsAndObstructions §5.19). For a general X the canonical measure is the normalized restricted curvature power, not ambient Haar measure.
- Compact support of f is necessary: mass of Galois orbits may escape to the boundary of S, so test functions on the non-compact X(ℂ) must have compact support.
- Non-degeneracy is necessary: a torsion section of an elliptic scheme over a curve has ĥ = 0 at every point and Galois orbits of its points accumulate according to the base, not to a Betti measure.

*Needs:* §3.1; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; §2.8.

### 3.3 Uniform Bogomolov over the restricted Hilbert scheme (GGK Proposition 5.2)

Let S ⊆ H° = `H°_{r,d}(𝔄_g/𝔸_g)` be a subvariety over ℚ̄ and 𝓛 = `ι^*𝔏_g^{⊗4}`. There are c″₂, c″₃ > 0 depending on r, d and S such that for every s ∈ S_gen the set {x ∈ X_s°(ℚ̄) : ĥ_𝓛(x) ≤ c″₃} lies in a proper Zariski closed X′ ⊊ X_s with `deg_{𝓛_s}` X′ < c″₂. (ggk-2026, Proposition 5.2 and proof, Steps 1–5, pp. 211–217).

Throughout this subsection, S ⊆ H° a subvariety over ℚ̄; s ranges over S_gen.

One proof route is the following. Induct on dim S; decompose into irreducible components and pass to the components S′ of the closure of S_gen, which satisfy the non-degeneracy hypotheses. Step 1: choose m with `X_{S′}^{[m]}` non-degenerate and M with the generic fibre of the difference map D₀ on `X^{m(M+1)}` an orbit of the finite stabilizer (Zhang’s difference lemma, HeightsRationalPointsAndObstructions §5.15); `X^{[m(M+2)]}` and its image under D = (id, D₀) are non-degenerate (B4 difference product). Step 2: with μ₁ the equilibrium measure of `X^{[m(M+2)]}` and μ₂ that of its D-image, D^*μ₂ vanishes at a diagonal point (z, Δ_z) where μ₁ does not (the differential of D has a kernel there), so μ₁ and ν = (1/d_D) D^*μ₂ are not proportional on the finite étale locus of D. Step 3: choose f₁ compactly supported in the étale locus separating μ₁ from ν; average over the stabilizer group so that f₁ = f₂ ∘ D. Step 4: by family equidistribution applied to both subvarieties, every point x of `X^{[m(M+2)]}` outside a proper closed subset has ĥ(x) ≥ δ or ĥ(D(x)) ≥ δ; use small-height hypotheses in both orbit estimates and keep the ≥ alternative. Step 5: if many small points of X_s° existed, their m(M+2)-fold products would land in the exceptional closed subset; the product-set lemma bounds the resulting proper X′ ⊊ X_s in degree, and the induction hypothesis handles the lower-dimensional strata of S. The block indices and degree normalizations follow.

**Checks.**

- For dim S = 0 the first three steps are the Ullmo–Zhang proof of the Bogomolov conjecture for one abelian variety (HeightsRationalPointsAndObstructions §5.18).
- The stabilizer is only assumed finite, not trivial: the averaging of Step 3 over the stabilizer is what handles it.
- The constants depend on S, r and d, not on s.

*Needs:* §3.2; §3.1; §1.6; §1.8; §1.7; §1.3; §0.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuliPartII B0–B4.

### 3.4 Uniform Bogomolov with an exceptional set (GGK Proposition 5.1)

For positive integers g, l, r, d there are c″₂, c″₃ > 0 depending on g, l, r, d such that for every polarized abelian variety (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(x)` ≤ c″₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c″₂. (ggk-2026, Proposition 5.1, p. 211; proof sketch §5.2, pp. 217–218).

Throughout this subsection, (A, L) polarized over ℚ̄, dim A = g, deg_L A = l; X irreducible generating A, dim X = r, deg_L X = d.

One proof route is the following. Principal case: apply the family version with S = `H°_{r, 8^r d}`, the degree normalization `deg_{𝔏_g^{⊗4}|A}` X = 8^r d and `ĥ_{𝔏_g^{⊗4}|A}` = `4ĥ_{L⊗[−1]^*L}` (GGK (4.10), (4.12)); if Stab(X) is positive-dimensional then X° = ∅. General polarizations: pass to a principally polarized isogenous (A₀, L₀) through the isogeny u₀ and its quasi-inverse u, rescaling c″₃ by (l/g!)² and the degree bound c″₂ by `(l/g!)^{2(r−1)}`, exactly as in the deduction of the gap principle for all polarizations.

**Checks.**

- The constants do not depend on A, only on g, l, r, d.
- If X does not generate A the statement is applied to X − P inside the abelian subvariety it generates; generation is a hypothesis here and is dropped in the uniform Bogomolov theorem.

*Needs:* §3.3; §1.2; §0.1.

### 3.5 The uniform Bogomolov theorem (Gao–Ge–Kühne Theorem 1.3)

For positive integers g and d there are c₃ = c₃(g, d) > 0 and c₄ = c₄(g, d) > 0 such that for every polarized abelian variety (A, L) over ℚ̄ of dimension at most g and every irreducible closed X ⊆ A with deg_L X ≤ d (generating A or not), #{P ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(P)` ≤ c₃} < c₄. The degree-bounded form here includes non-generating X by the translation and induction argument below. (ggk-2026, Theorem 1.3 and (1.4), p. 192; proof §8, pp. 225–226; kuhne-2021, Theorem 3, pp. 6–7 (arXiv v4)).

Throughout this subsection, (A, L) polarized over ℚ̄ with dim A ≤ g; X ⊆ A irreducible closed with deg_L X ≤ d.

One proof route is the following. Induct on dim X, with the zero-dimensional case bounded by one point. If the small-point set in X° is empty there is nothing to count; otherwise choose P₀ in that set and set B = ⟨X−X⟩, Y = X−P₀ ⊆ B. Then Y generates B and `deg_{L|B}` B is bounded in terms of g,d by the parent’s generated-subvariety bound. Apply the exceptional-set theorem to Y ⊆ B. For the symmetric height, ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀); choosing the final threshold at most one quarter of the exceptional threshold places every original small point into P₀+Y′. Take minima and maxima over the finitely many bounded dimensions and integral degrees involved. The components of P₀+Y′ have smaller dimension and bounded total degree. Apply induction in the original ambient polarized A to each component. A point of X° in a component lies in that component’s Ueno complement, because every positive-dimensional coset in the component also lies in X. Sum the bounds and enlarge c₄ to make the final inequality strict. This induction treats arbitrary irreducible exceptional components and implies the generating case of GGK Theorem 1.3.

**Checks.**

- For X a curve of genus ≥ 2 in its Jacobian (X° = X), the theorem bounds the number of points of height ≤ c₃ uniformly in the curve: this is Kühne’s uniform Bogomolov for curves.
- X° cannot be replaced by X: a positive-dimensional torsion coset contains infinitely many torsion points.
- The bound c₃ is absolute (not scaled by h_Fal(A)); the gap principle is the companion statement with a threshold proportional to max{1, h_Fal(A)}.

*Needs:* §3.4; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1.

### 3.6 Uniform Manin–Mumford for curves (Kühne Theorem 2)

For each g ≥ 2 there is c(g) ≥ 1 such that for every smooth projective curve C of genus g over ℂ (Kühne Theorem 2), and more generally over any algebraically closed field F of characteristic 0, and every divisor D of degree 1 on C, #(ι_D(C) ∩ Jac(C)_tors) ≤ c(g), where ι_D(q) = [q] − D. This implies Dimitrov–Gao–Habegger Theorem 1.4 — #((C(ℚ̄) − P₀) ∩ Jac(C)_tors) ≤ c(g, d) for curves over number fields of degree ≤ d and P₀ ∈ C(ℚ̄) — with a constant independent of d. (kuhne-2021, Theorem 2, p. 6 (arXiv v4); yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024); dgh-2021, Theorem 1.4, p. 3 and its proof p. 36 (arXiv v3)).

Throughout this subsection, g ≥ 2; C smooth projective of genus g over an algebraically closed field of characteristic 0; D of degree 1.

- `Suggested.lean` states `uniform_maninMumford_curves`, which uses a smooth proper geometrically integral one-dimensional scheme X over F, a rational base point x₀, an Albanese morphism a to an abelian variety J of dimension g, and an arbitrary translating point c. In the native multiplicative point group, (x ≫ a) * c represents [x]−D: c=[x₀]−D. Its bound B is a natural number with B≥1, independent of F and c.

One proof route is the following. Over ℚ̄: X = ι_D(C) ⊆ J = Jac(C) is a curve of degree g for the theta polarization, generating J, with X° = X since a curve of genus ≥ 2 contains no positive-dimensional coset. Torsion points have Néron–Tate height 0 ≤ c₃, so the uniform Bogomolov theorem with (g, d) = (g, g) bounds their number by c₄(g, g). Over an arbitrary algebraically closed F of characteristic 0: any finite collection of torsion points of ι_D(C) is defined with the curve over a finitely generated field; specialize to ℚ̄ along a model keeping the curve smooth and these torsion points distinct (torsion injects under specialization in characteristic 0), as in the specialization step of the uniform Mordell–Lang layer. This also proves DGH Theorem 1.4 with a constant independent of d (DGH’s own constant depends on d), and gives a bound uniform in P₀ for the small-height step. Kühne states Theorem 2 over ℂ; the step over arbitrary F is the specialization argument above (Kühne Theorem 4 with Γ the torsion subgroup gives the same). For extension from ℚ̄ to an arbitrary algebraically closed characteristic-zero field, spread any finite configuration of torsion points with the curve and preserve distinctness and their finite orders on a suitable fibre. A putative violation of the uniform bound has such a finite witness; it is unnecessary to define all torsion points over one finitely generated field.

**Checks.**

- For D=[Q], c=[x₀]−[Q]=−a(Q), so a(Q)+c=0 and Q is counted as torsion. Using +a(Q) instead gives 2a(Q), which has infinite order when a(Q) does. For D=[x₀], c=0 and a(x₀)=0.
- Stoll’s bielliptic genus-two example with a Weierstrass base point has 34 torsion points on its image, so c(2) ≥ 34 (DeMarco–Krieger–Ye Remark 1.2).
- No uniform bound on the order of these torsion points exists (DeMarco–Krieger–Ye Proposition 9.2 of the published version).
- For g = 1 the statement is false: every point of an elliptic curve is the image of a degree-one divisor class, and torsion is infinite.

*Needs:* §3.5; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### Examples

On a single abelian variety, torsion Galois orbits give the usual normalized Haar limit. For a degree-two finite map the unnormalized pullback of a probability measure has mass 2; dividing by 2 restores mass 1. A genus-two Abel curve has Ueno complement equal to itself, whereas a positive-dimensional abelian coset has empty complement.

### Dependencies

Layers 0–2; ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3; AbelianSchemesAndArithmeticModuliPartII B1,B4; HeightsRationalPointsAndObstructions §§5.2–5.4,5.18–5.19; native generic-sequence and Galois-orbit operations.

## Layer 4: The new gap principle

### 4.1 Uniform degree and height of Abel–Jacobi curves (DGH Lemma 6.1)

Fix g ≥ 2, a level ℓ ≥ 3, the fine moduli space M_g of smooth genus-g curves with level-ℓ structure over ℚ̄ with universal curve C_g, the Torelli map τ : M_g → A_g to the fine Siegel moduli space with universal abelian scheme 𝔄_g ⊆ ℙⁿ × A_g, and an ample M on a compactification of A_g. There is c such that for all s ∈ M_g(ℚ̄): (i) deg(C_s − P) ≤ c for every P ∈ `𝔄_{g,τ(s)}(ℚ̄)`; (ii) some P_s ∈ C_s(ℚ̄) satisfies h(C_s − P_s) ≤ c·max{1, `h_{A_g,M}(τ(s))`}, where h is the height of a subvariety of ℙⁿ. (dgh-2021, Lemma 6.1 and proof, pp. 25–26 (arXiv v3)).

Throughout this subsection, g ≥ 2; level ℓ ≥ 3; fine moduli; projective immersion of the universal abelian scheme; M ample on a compactification.

One proof route is the following. The curves C_s − P, s ∈ M_g, P ∈ `𝔄_{g,τ(s)}`, form one algebraic family over 𝔄_g `×_{A_g}` M_g; degrees of fibres of a family are bounded (constructibility and Bézout), giving (i). Choose an étale quasi-section of C_g → M_g (SchemeAndStackFoundations §0.8); over each piece of a finite stratification the point P_s is given by a morphism, so its height is ≤ c max{1, h(τ(s))} by the height machine. C_s − P_s is a component of an intersection of the universal family with fixed hypersurfaces through the moduli point; arithmetic Bézout (HeightsRationalPointsAndObstructions §5.9b) bounds its height linearly in the height of the point.

**Checks.**

- The constant does not depend on s; only (ii) depends on the moduli height.
- For P arbitrary the height of C_s − P can be arbitrarily large (translate by points of large height), so (ii) chooses P_s.

*Needs:* StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; SchemeAndStackFoundations §§0.3, 0.8, 5.1–5.4; HeightsRationalPointsAndObstructions §5.9b; §0.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 4.2 Few base points force a proper subvariety (DGH Lemma 6.4)

Let A be an abelian variety over ℚ̄, C ⊆ A a smooth curve of genus g ≥ 2, M ≥ 1, D_M : `C^{M+1}` → A^M the Faltings–Zhang map (P₀, …, P_M) ↦ (P₁ − P₀, …, P_M − P₀) and Z ⊊ `D_M(C^{M+1})` an irreducible proper closed subset. Then #{P ∈ C(ℚ̄) : (C − P)^M ⊆ Z} ≤ 84(g − 1). (dgh-2021, Lemma 6.4 and proof, pp. 28–29 (arXiv v3)).

Throughout this subsection, C ⊆ A smooth curve of genus g ≥ 2; Z ⊊ `D_M(C^{M+1})` irreducible proper closed.

One proof route is the following. The proper image `D_M(C^{M+1})` is irreducible of dimension at most M+1. Thus its proper irreducible subset Z has dimension at most M. If any (C−P)^M lies in Z, both have dimension M and are equal. There is no case dim Z > M. Then C − P₀ = C − P₁, so P₁ − P₀ stabilizes C − P₀, and translation by it is an automorphism of the curve. The stabilizer of a genus-≥ 2 curve is finite and embeds in Aut(C), of order at most 84(g − 1) (Hurwitz).

**Checks.**

- The bound is independent of A, M and Z.
- For C=E₀+P₀ with E₀ an elliptic subgroup (g=1), D_M(C^(M+1))=(C−P)^M=E₀^M for every P∈C. No proper Z in that image contains (C−P)^M, so the counted set is empty: 0≤84(g−1)=0. Genus at least two makes the difference image (M+1)-dimensional and the stabilizer finite; genus ≥ 2 is used through finiteness of the stabilizer.

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AlgebraicCurves Layers 10–11.

### 4.3 Néron–Tate distance between points on curves (DGH Proposition 7.1)

With M_g, τ, 𝔄_g and M as in the Abel–Jacobi bounds, for each irreducible closed S ⊆ M_g over ℚ̄ there are c₁, c₂, c₃, c₄ > 0 such that for every s ∈ S(ℚ̄) with `h_{A_g,M}(τ(s))` ≥ c₁ there is a set Ξ_s ⊆ C_s(ℚ̄) with #Ξ_s ≤ c₂ such that every P ∈ C_s(ℚ̄) satisfies either P ∈ Ξ_s or #{Q ∈ C_s(ℚ̄) : ĥ(Q − P) ≤ `h_{A_g,M}(τ(s))`/c₃} < c₄. (dgh-2021, Proposition 7.1 and proof, pp. 29–31 (arXiv v3)).

Throughout this subsection, S ⊆ M_g irreducible closed; s with large modular height.

One proof route is the following. Induct on dim S. Gao’s theorem (AbelianSchemesAndArithmeticModuliPartII B4, DGH Theorem 6.2) makes `D_M(C_S^{[M+1]})` non-degenerate for M = 3g − 2; the height inequality gives c > 0 and a proper closed exceptional set Z_S with Σ ĥ(P_i − P₀) ≥ c h(τ(s)) − c′ off Z_S. If (C_s − P)^M ⊄ Z_s, at least one of M points close to P escapes Z_s once there are c₄ such points (the escape lemma); the inequality then forces ĥ(Q − P) > h(τ(s))/c₃ with c₃ = 2M/c for one of them. The base points P with (C_s − P)^M ⊆ Z_s number at most 84(g − 1) per component (the base-point bound): they form Ξ_s, of bounded size; the lower-dimensional part of Z_S over a proper closed subset of S is handled by induction.

**Checks.**

- The threshold h/c₃ grows with the modular height, unlike the uniform Bogomolov threshold, which is absolute.
- Below the modular height bound c₁ the proposition says nothing; the uniform Bogomolov theorem covers that range.

*Needs:* §2.8; AbelianSchemesAndArithmeticModuliPartII B0–B4; §4.2; §0.3; §4.1; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2.

### 4.4 Height gap on the restricted Hilbert scheme (GGK Proposition 4.2)

Let S ⊆ H° be a subvariety over ℚ̄, 𝓛 = `ι^*𝔏_g^{⊗4}` and M the pullback to H° of an ample line bundle on a compactification of 𝔸_g. There are c′₁, c′₂, c′₃ > 0 depending on r, d and S such that for each s ∈ S_gen the set {x ∈ X_s°(ℚ̄) : ĥ_𝓛(x) ≤ c′₁ max{1, `h_{H°,M}(s)`} − c′₃} lies in a proper Zariski closed X′ ⊊ X_s with `deg_{𝓛_s}` X′ < c′₂. (ggk-2026, Proposition 4.2 and proof, pp. 204–207).

Throughout this subsection, S ⊆ H° a subvariety; M pulled back from an ample moduli bundle; s ∈ S_gen.

One proof route is the following. Reduce to S irreducible and to the components S′ of the closure of S_gen; take m with `X_{S′}^{[m]}` non-degenerate. Apply §2.8 with an ample height on a compactification of S′. The height of its moduli image is bounded above by a positive multiple of this height plus a constant (height machine for the moduli morphism). Hence Σ ĥ_𝓛(x_i) ≥ c·h_M(s)−c′ off a proper closed Z; no ampleness of the pulled-back M on H° is used. Case (i): the points s over which Z contains the whole fibre form a proper closed subset of S′; its components are handled by the induction hypothesis. Case (ii): otherwise Z_s ⊊ X_s^m, and points of height ≤ (c/m)h_M(s) − c′/m have m-th power in Z_s; the product-set lemma gives X′ of bounded degree, the bound depending on deg Z_s, which is uniform over the family.

**Checks.**

- The base case dim S = 0 is trivial: h_M(s) is constant, and the set of points of height below a constant minus c′₃ can be made empty.
- The degree bound of X′ depends on S only through the family, not on s.

*Needs:* §2.8; §1.6; §1.8; §1.7; §1.3; §0.2; §1.2.

### 4.5 Height gap for principally polarized abelian varieties (GGK Proposition 4.4)

For positive integers g, r, d there are c′₁, c′₂, c′₃ > 0 depending on g, r, d such that for every principally polarized (A, L) over ℚ̄ of dimension g and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(x)` ≤ c′₁ max{1, h_Fal(A)} − c′₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c′₂. (ggk-2026, Proposition 4.4 and proof, pp. 208–210).

Throughout this subsection, (A, L) principally polarized over ℚ̄ of dimension g; X irreducible generating A with dim r, degree d.

One proof route is the following. If Stab(X) is positive-dimensional, X° = ∅; otherwise [X] ∈ H°_gen for H° = `H°_{r, 8^r d}`. Apply the family gap with S = H°: `deg_{𝔏_g^{⊗4}|A}` X = 8^r d and `ĥ_{𝔏_g^{⊗4}|A}` = `4ĥ_{L⊗[−1]^*L}`. Faltings’ comparison of the moduli height with the stable Faltings height (ArakelovGeometryAndAbelianHeights §§5.5–5.8, GGK (4.11)): max{1, h_Fal(A)} ≤ c(g)h_M(b) + c′(g) log(h_M(b) + 2); rescale c′₁ and c′₃. deg_L X′ ≤ `deg_{𝔏_g^{⊗4}|A}` X′ < c′₂.

**Checks.**

- The constants depend only on g, r, d; the exceptional set X′ depends on A and X but has bounded degree.
- h_Fal is the stable Faltings height in the normalization of ArakelovGeometryAndAbelianHeights §3.4.

*Needs:* §4.4; §1.2; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; §0.1.

### 4.6 Height gap for all polarizations (GGK Proposition 4.1)

For positive integers g, l, r ≤ g and d there are c′₁, c′₂, c′₃ > 0 depending on g, l, r, d such that for every polarized (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(x)` ≤ c′₁ max{1, h_Fal(A)} − c′₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c′₂. (ggk-2026, Proposition 4.1, p. 203; proof §4.3, pp. 210–211).

Throughout this subsection, (A, L) polarized over ℚ̄, dim g, deg_L A = l; X irreducible generating A.

One proof route is the following. Put n = l/g!. Choose a principally polarized (A₀,L₀) and isogenies u₀ : A → A₀ and u : A₀ → A with u∘u₀ = [n], u₀∘u = [n], u₀^*L₀ algebraically equivalent to L, and u^*L algebraically equivalent to [n]^*L₀ (GGK Lemma 2.2(iv)). Apply the principal case to X₀ = `u^{-1}(X)`-component; h_Fal(A₀) and h_Fal(A) differ by O(log l) (isogeny estimate, ArakelovGeometryAndAbelianHeights §§4.2–4.4). Transport X′₀ to X′ = u(X′₀); by the projection formula deg_L X′ ≤ `deg_{u^*L}` X′₀ ≤ `(l/g!)^{2(r−1)}` c′₂, so c′₂ must be rescaled by `(l/g!)^{2(r−1)}` as well as c′₁ by (l/g!)².

**Checks.**

- For l = g! (principal polarization) the statement is the principal case.
- The degree constant changes under the reduction: for n=l/g!=2 and a one-dimensional exceptional component the factor is n²=4.

*Needs:* §4.5; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; AbelianSchemesAndArithmeticModuli A1–A3, A6; §0.1.

### 4.7 The gap principle for fixed polarization degree and dimension (GGK Proposition 6.1)

For positive integers g, l, r, d there are c₁, c₂ > 0 depending on g, l, r, d such that for every polarized (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {P ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(P)` ≤ c₁ max{1, h_Fal(A)}} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c₂. (ggk-2026, Proposition 6.1 and proof, pp. 219–220).

Throughout this subsection, (A, L), X as in the polarized height gap.

One proof route is the following. Let c′₁, c′₂, c′₃ be the height-gap constants and c″₂, c″₃ the uniform Bogomolov constants; put H = max{1, h_Fal(A)} and B = max{1, 2c′₃/c′₁}. If H > B, then c′₁H − c′₃ ≥ (c′₁/2)H, so with c₁ ≤ c′₁/2 the height-gap exceptional set works. If H ≤ B, then c₁H ≤ c₁B ≤ c″₃ for c₁ ≤ c″₃/B, so the uniform Bogomolov exceptional set works. For fixed A only one of the two cases occurs, so a single exceptional set suffices and c₂ = max{c′₂, c″₂} as published because only one height range applies to a fixed A.

**Checks.**

- The threshold is now c₁ max{1, h_Fal(A)} with no subtracted constant.
- c₂ is max{c′₂, c″₂}, not their sum.

*Needs:* §4.6; §3.4.

### 4.8 The new gap principle (Gao–Ge–Kühne Theorem 1.2)

Given positive integers g and d there are c₁ = c₁(g, d) > 0 and c₂ = c₂(g, d) > 0 such that for every polarized abelian variety (A, L) over ℚ̄ of dimension g and every irreducible closed X ⊆ A generating A with deg_L X ≤ d, the set {P ∈ X°(ℚ̄) : `ĥ_{L⊗[−1]^*L}(P)` ≤ c₁ max{1, h_Fal(A)}} is contained in X′(ℚ̄) for a proper Zariski closed X′ ⊊ X with deg_L X′ < c₂. (ggk-2026, Theorem 1.2 and (1.3), p. 192; proof §6, p. 220).

Throughout this subsection, (A, L) polarized over ℚ̄, dim A = g; X irreducible closed generating A, deg_L X ≤ d.

One proof route is the following. Since X generates A, deg_L A is bounded in terms of g and deg_L X (GGK Lemma 2.5, via the generated abelian subvariety of the parent and the sum-of-translates degree bound). Apply the fixed-degree gap principle for each of the finitely many (l, r, d′) with l bounded, r ≤ g, d′ ≤ d; take the minimum of the c₁ and the maximum of the c₂.

**Checks.**

- The generation hypothesis cannot be dropped, and the exceptional set is not finite in general (examples in Gao’s survey §10.2 cited by GGK p. 192).
- For a curve of genus g ≥ 2 embedded in its Jacobian, X′ is a finite set of bounded cardinality: this is the gap principle for curves.

*Needs:* §4.7; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; §0.1.

### 4.9 The new gap principle for curves

For each g ≥ 2 there are c₁(g), c₂(g) > 0 such that for every smooth projective curve C of genus g over ℚ̄ and every y ∈ C(ℚ̄), #{x ∈ C(ℚ̄) : ĥ(x − y) ≤ c₁ max{h_Fal(C), 1}} ≤ c₂, where h_Fal(C) = h_Fal(Jac(C)) is the stable Faltings height and ĥ is half the canonical height of the symmetric twice-theta bundle (the Néron–Tate height for the principal polarization). (yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024); ggk-2026, Theorem 1.2, p. 192).

Throughout this subsection, g ≥ 2; C smooth projective genus g over ℚ̄; y ∈ C(ℚ̄).

One proof route is the following. X = C − y ⊆ J = Jac(C) is a curve of θ-degree g generating J with X° = X. Apply the new gap principle with (g, d) = (g, g): the small points lie in a proper closed subset of X of degree < c₂, i.e. a finite set of fewer than c₂ points. With L the symmetric principal polarization, `ĥ_{L⊗[−1]^*L}` = 2ĥ_L, and 2ĥ_L is the canonical height of the twice-theta bundle; absorb the factor into c₁.

**Checks.**

- Taking the threshold 0 recovers uniform Manin–Mumford for curves.
- Yuan’s uniform Bogomolov for curves (the last layer) strengthens this by adding ĥ((2g − 2)α − ω) to the threshold and allowing α ∈ Pic¹ and all global fields.

*Needs:* §4.8; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; §4.3.

### Examples

For a k-dimensional exceptional component and n=l/g!, the quasi-inverse isogeny changes its degree by n^(2k); n=2,k=1 gives factor 4. If c′₁=c′₃=c″₃=1, the two height ranges meet at H=2 and c₁=1/2 works in both; c₂ is a maximum because only one range applies to a fixed fibre.

### Dependencies

Layers 0–3; StableReductionPartII §§4.2,4.4,4.8,6.3,6.6–6.7,7.13,7.15; JacobianChallengePartII Layers 2–5; AlgebraicCurves Layer 11; ArakelovGeometryAndAbelianHeights §§4.2–4.4,5.5–5.8; HeightsRationalPointsAndObstructions §5.3.

## Layer 5: Rémond’s quantitative Vojta method

### 5.1 The Néron–Tate Euclidean space of a finite-rank subgroup

Let A be an abelian variety over ℚ̄ with a symmetric ample line bundle L and Γ ⊆ A(ℚ̄) a subgroup of finite rank ρ. On Γ_ℝ = (Γ/Γ_tors) ⊗ ℝ the Néron–Tate height extends to a positive definite quadratic form; write |P| = `ĥ_L(P)^{1/2}` and ⟨P, Q⟩ = (ĥ_L(P + Q) − ĥ_L(P) − ĥ_L(Q))/2. Then (Γ_ℝ, ⟨·,·⟩) is a Euclidean space of dimension ρ, the image of Γ in it is a subgroup whose rational span has dimension ρ (dense when Γ is a division group), and points of Γ with equal image differ by torsion. (ggk-2026, Appendix A.5, Step 1, p. 230; dgh-2021, Proof of Proposition 8.1, p. 34 (arXiv v3)).

Throughout this subsection, A abelian over ℚ̄; L symmetric ample; Γ ⊆ A(ℚ̄) of finite rank ρ.

One proof route is the following. The Néron–Tate pairing (HeightsRationalPointsAndObstructions §0.21), divided by two, is symmetric bilinear on A(ℚ̄) and vanishes exactly on torsion when paired with itself (Néron–Tate kernel over number fields). Choose a finitely generated Γ₀ ⊆ Γ of rank ρ defined over a number field; ĥ is positive definite on Γ₀ ⊗ ℝ (finitely generated Mordell–Weil lattice), and Γ ⊆ division hull of Γ₀ (HeightsRationalPointsAndObstructions §5.5), so Γ_ℝ = Γ₀ ⊗ ℝ.

The defining object has the following API.

- Γ_ℝ with inner product ⟨·,·⟩_L and the map Γ → Γ_ℝ.
- |P|² = ĥ_L(P) for P ∈ Γ.
- dim_ℝ Γ_ℝ = rk Γ.
- P ∈ Γ maps to 0 iff P is torsion.
- Γ′ ⊆ Γ induces an isometric embedding Γ′_ℝ → Γ_ℝ.
- For Q ∈ A(ℚ̄), ⟨Γ, Q⟩ has rank ≤ rk Γ + 1, and the space for it contains Γ_ℝ isometrically.

**Checks.**

- For Γ = A_tors, Γ_ℝ = 0.
- For E: y² = x³ − 2 over ℚ and Γ = E(ℚ) = ℤ·(3, 5), Γ_ℝ ≅ ℝ with |(3,5)|² = ĥ((3,5)) (native Tau Ceti canonical height divided by 2 for L = O(O)).
- Γ = the division hull of ℤP has rank 1 but is not finitely generated; Γ_ℝ is still one-dimensional: finite rank, not finite generation, is the hypothesis.

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; Mathlib `Module.finrank`; Mathlib `EuclideanSpace`.

### 5.2 The constants c_NT and h₁ of an embedded abelian variety

Let A ⊆ ℙⁿ be an abelian variety over ℚ̄ embedded projectively normally by a basis ξ₀, …, ξ_n of H⁰(A, L) for a symmetric very ample L. Then c_NT(A) ≥ 0 is the least constant with |ĥ_L − h| ≤ c_NT on A(ℚ̄), and h₁(A) is the height of the coefficient vector for a chosen family of bihomogeneous polynomials `P_{ij}` of bidegree (2, 2) with f^*(p₁^*ξ_i ⊗ p₂^*ξ_j) = `P_{ij}(p₁^*ξ, p₂^*ξ)` for f(P, Q) = (P + Q, P − Q). (dgh-2021, §8, (8.1)–(8.2), pp. 31–32 (arXiv v3); ggk-2026, §7.1, definitions of c_NT and h₁ before (7.3), p. 221).

Throughout this subsection, A ⊆ ℙⁿ projectively normal by a symmetric very ample L.

One proof route is the following. c_NT exists by the height machine (Tate’s limit, HeightsRationalPointsAndObstructions §0.18). The polynomials `P_{ij}` exist since f^*(L ⊠ L) ≅ L² ⊠ L² (theorem of the cube) and projective normality makes the multiplication maps on sections surjective (Rémond, Proposition 5.2, cited by DGH).

The defining object has the following API.

- c_NT(A) for the embedding.
- h₁(A; (`P_{ij}`)) is the absolute logarithmic height of the projective coefficient vector of a chosen addition/difference polynomial family.
- |ĥ_L(P) − h(P)| ≤ c_NT(A) for all P ∈ A(ℚ̄).
- c_NT and h₁ are unchanged by simultaneously conjugating A, its embedding, and the chosen polynomial family.

**Checks.**

- For an elliptic curve in ℙ² by the Weierstrass embedding (L = O(3·O)), c_NT is bounded by an explicit multiple of max{1, h(j)} plus the height of the Weierstrass coefficients (Silverman’s difference bounds).
- c_NT ≥ 0 and h₁ ≥ 0.
- Multiplying every coefficient of the chosen family `P_{ij}` by 7 leaves h₁ unchanged, by the product formula for the projective coefficient vector; an affine coefficient norm would add log 7.
- c_NT depends on the embedding and not only on A: composing the embedding with a projective coordinate change that sends the image of the origin to [1 : T : 0 : ⋯ : 0], T ≥ 2 an integer, gives h(0) = log T while ĥ_L(0) = 0, so c_NT ≥ log T, although A and h_Fal(A) are unchanged.
- On an elliptic curve E, O_E(2·0)=`O_E(0)^{⊗2}` is symmetric and ample, but h⁰=2 and its complete linear system gives a degree-two map to ℙ¹, so it is not very ample. O_E(3·0)=`O_E(0)^{⊗3}` has h⁰=3 and embeds E as a projectively normal plane cubic; the exponent two does not suffice (AbelianSchemesAndArithmeticModuli A2.8).

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; Mathlib `Projectivization.logHeight`; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 5.3 Bounds for c_NT and h₁ by the Faltings height (DGH (8.4), (8.7))

Fix g, a projective embedding of the level-ℓ universal principally polarized family as in DGH §6.1, and the power l used there. For its fibre embeddings there is c′ depending on these fixed choices such that c_NT(A) ≤ c′ max{1,`h_{A_g,M}([A])`}, and one can choose addition/difference polynomials with h₁(A) ≤ c′ max{1,`h_{A_g,M}([A])`}. Thus both are bounded by c″ max{1,h_Fal(A)}. The embedding and polynomial family are controlled choices; arbitrary changes of projective coordinates are excluded. The general-polarization extension is supplied by the controlled polarization embeddings contract. (dgh-2021, Proof of Proposition 8.1, (8.4), p. 32, and (8.6)–(8.7), pp. 32–33 (arXiv v3); ggk-2026, §7.1, the comparison before (7.3), p. 221).

Throughout this subsection, A principally polarized of dimension g with the fixed universal-family embedding and chosen controlled polynomial family of DGH §6.1 and §8.

One proof route is the following. c_NT: Silverman–Tate in the universal family (HeightsRationalPointsAndObstructions §0.26): |ĥ(P) − h(P)| ≤ c max{1, h(π(P))}. h₁: the coefficients of the `P_{ij}` solve a linear system whose equations are evaluations at finitely many torsion points (Zariski dense, of height zero); Cramer’s rule bounds their height linearly in the height of the moduli point. Convert the moduli height into max{1, h_Fal(A)} by the comparison of ArakelovGeometryAndAbelianHeights §§5.5–5.8.

**Checks.**

- Both bounds are linear in max{1, h_Fal(A)}, which is what makes the threshold of the gap principle the right scale for Rémond’s large points.

*Needs:* §5.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; PELModuli M5–M6.

### 5.4 Rémond’s generalized Vojta inequality

Let A be an abelian variety over ℚ̄ with L symmetric, very ample and projectively normal, n = deg_L A/g! − 1, and X ⊆ A irreducible. There are c₄, c₅ > 0 depending on g, deg_L X and deg_L A such that if P₀, …, `P_{dim X}` ∈ X°(ℚ̄) satisfy ⟨P_i, `P_{i+1}`⟩ ≥ `(1 − 1/c₄)|P_i||P_{i+1}|` and `|P_{i+1}|` ≥ c₄|P_i| for all i, then |P₀|² ≤ c₅ max{1, h(X), h_Fal(A)}. The Faltings-height form assumes the controlled-embedding bound in the hypotheses; for an arbitrary embedding its right side instead uses max{1,h(X),c_NT,h₁}. (ggk-2026, Theorem A.1, p. 227 (citing Rémond, Inégalité de Vojta en dimension supérieure, Theorem 1.1); remond-2000-vojta, Théorème 1.1, p. 105, and, Théorème 1.2, p. 106; setting §1, p. 104).

Throughout this subsection, L symmetric very ample projectively normal; X irreducible; P_i ∈ X° in a narrow cone with rapidly increasing norms; for the displayed Faltings-height form, require a controlled embedding and a polynomial family with max{c_NT,h₁} ≤ C(g,deg_L A) max{1,h_Fal(A)}. Without that input, retain max{1,h(X),c_NT,h₁} in the bound.

One proof route is the following. Rémond’s explicit values (Théorème 1.1): with m = dim X + 1, c₁ = c₂ = `max(deg X, (6m)^{2m})^{m^{3m²}}` and c₃ = `c₁(n + 1)^{(dim X)³}` max(h(X), h₁, c_NT, n log(n + 1)); Here Z_X=X∖X° is the Ueno locus; under the narrow-angle and successive norm-growth hypotheses of Théorème 1.1 with constants c₁,c₂, the additional inequality |x₁|²≥c₃ forces at least one x_i into Z_X. This is Rémond’s quantitative form of the Faltings–Vojta inequality: the parent supplies the qualitative higher-dimensional Vojta method (HeightsRationalPointsAndObstructions §§5.9a–5.9f); Rémond’s version tracks every constant through the same construction in terms of n, deg X, h(X), c_NT and h₁. First retain the bound in max{1,h(X),c_NT,h₁} for the chosen embedding. Only under the additional controlled-embedding hypothesis replace c_NT,h₁ by C(g,deg_L A) max{1,h_Fal(A)}. DGH proves this input for its fixed principally polarized family; use the controlled polarization embeddings contract for arbitrary polarization types.

**Checks.**

- The constants do not depend on A, X or the points beyond the listed degrees and heights.
- For X a curve of genus ≥ 2 in its Jacobian this is Bombieri’s explicit Vojta inequality with an explicit dependence on the height of the curve.
- The cone condition is essential: without small angles there is no inequality (two orthogonal points can have arbitrary norms).

*Needs:* §5.1; §5.3; HeightsRationalPointsAndObstructions §5.9b; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.5 Rémond’s generalized Mumford inequality

With A, L, n and X as in Rémond’s Vojta inequality, let `D_{dim X}` : `X^{dim X+1}` → `A^{dim X}`, (x₀, …, `x_{dim X}`) ↦ (x₁ − x₀, …, `x_{dim X}` − x₀). There are c₄, c₅ > 0 depending on g, deg_L X and deg_L A such that if P₀, …, `P_{dim X}` ∈ X(ℚ̄) with (P₀, …, `P_{dim X}`) isolated in its fibre of `D_{dim X}`, ⟨P₀, P_i⟩ ≥ (1 − 1/c₄)|P₀||P_i| and ||P₀| − |P_i|| ≤ |P₀|/c₄ for all i, then |P₀|² ≤ c₅ max{1, h(X), h_Fal(A)}. The Faltings-height form assumes the controlled-embedding bound in the hypotheses; for an arbitrary embedding its right side instead uses max{1,h(X),c_NT,h₁}. (ggk-2026, Proposition A.2, p. 228 (citing Rémond, Décompte dans une conjecture de Lang, Proposition 3.4)).

Throughout this subsection, as in Rémond’s Vojta inequality; the tuple isolated in its `D_{dim X}`-fibre; for the displayed Faltings-height form, require a controlled embedding and a polynomial family with max{c_NT,h₁} ≤ C(g,deg_L A) max{1,h_Fal(A)}. Without that input, retain max{1,h(X),c_NT,h₁} in the bound.

One proof route is the following. Generalizes Mumford’s gap principle for curves (HeightsRationalPointsAndObstructions §5.11), using the arithmetic Bézout interface of its §5.9b: an estimate for the height of an isolated point of the fibre of `D_{dim X}` against the heights of the coordinates, with the quadratic terms controlled by the angle and norm conditions. First retain the bound in max{1,h(X),c_NT,h₁} for the chosen embedding. Only under the additional controlled-embedding hypothesis replace c_NT,h₁ by C(g,deg_L A) max{1,h_Fal(A)}. DGH proves this input for its fixed principally polarized family; use the controlled polarization embeddings contract for arbitrary polarization types.

**Checks.**

- For dim X = 1 this is Mumford’s gap principle for curves with explicit constants.
- Isolation is necessary: if the fibre is positive-dimensional the tuple can be moved along a coset and no bound holds.

*Needs:* §5.1; §5.3; HeightsRationalPointsAndObstructions §5.9b; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.6 Isolated fibres or a small exceptional set (GGK Proposition A.3)

With X ⊆ A irreducible and `D_{dim X}` as in Rémond’s Mumford inequality, every Ξ ⊆ X°(ℚ̄) satisfies one of: (i) for every x ∈ X(ℚ̄) there are pairwise distinct x₁, …, `x_{dim X}` ∈ Ξ with (x, x₁, …, `x_{dim X}`) isolated in its fibre of `D_{dim X}`; (ii) Ξ ⊆ X′ for a proper Zariski closed X′ ⊊ X with deg X′ ≤ `(deg_L X)^{2 dim X}`. (ggk-2026, Proposition A.3 and proof, pp. 228–229 (citing Rémond, Décompte, Proposition 3.3)).

Throughout this subsection, X ⊆ A irreducible; Ξ ⊆ X°(ℚ̄).

Prove the containment-degree alternative here (remond-2000-decompte, Proposition 3.3; ggk-2026, Proposition A.3, pp. 228–229). Put r=dim X and D=deg_L X. For r=0 the empty tuple is isolated. If X° is empty, take X′ empty. Otherwise Stab(X) is finite: its positive-dimensional identity component would place every point of X on an abelian coset in X. If #Ξ<r, choose a hyperplane through Ξ not containing X; its section has degree D≤D^(2r). Such a hyperplane exists because the span of fewer than r points has dimension less than r.

For #Ξ≥r and failure of (i), fix a witnessing x. Starting with W₀=X−x, successively intersect with X−y, y∈Ξ, whenever this strictly decreases the local dimension at 0. A chosen y is new, since an already imposed translate cannot decrease it. Reaching local dimension zero after at most r choices would give the required isolated tuple at x, padding with distinct points of Ξ if necessary, contrary to the choice of x. Thus the process stops after i≤r−1 choices at a positive local dimension k, unchanged by every further X−y. Let C₁,…,C_s be the k-dimensional components through 0. For each y∈Ξ at least one C_j is contained in X−y, so Ξ⊆⋃_j E_j, where E_j=⋂_(c∈C_j)(X−c). Translation preserves the numerical class of L (AbelianSchemesAndArithmeticModuli §§A2.3, A2.10), and total-degree Bézout gives s≤D^(i+1).

For each j choose c_j∈C_j outside the finite Stab(X). Since 0∈C_j, E_j⊆Z_j:=X∩(X−c_j). Each Z_j is proper in X and has total reduced degree at most D² by refined Bézout. Take X′=⋃_j Z_j; irreducibility of X makes this finite union proper. For r≥2 its degree is at most sD²≤D^(i+3)≤D^(r+2)≤D^(2r). For r=1, i=0 and W₀ is irreducible, so s=1 and the same endpoint is D². The degree estimate concerns X′; no degree bound on E_j is used.

**Checks.**

- For a genus-two theta curve X through 0, Ξ={0} and x=0 give C₁=X and E₁=Stab(X)={0}. A single translate has dimension 1, whereas E₁ has dimension 0. With L=3Θ one has D=6; for general c₁ outside the stabilizer, X∩(X−c₁) consists of Θ²=2 points, within the bound D²=36.
- On a principally polarized genus-two Jacobian J with smooth symmetric theta curve Θ through 0, take X=[3]⁻¹Θ and L=3Θ. The étale pullback is smooth; it is an ample divisor, hence connected and integral. Its stabilizer is J[3], of order 3⁴=81, while D=(3Θ·9Θ)=54 since Θ²=2. Thus deg E₁=81>54, whereas the containing intersection has degree at most 54²=2916 and 81≤2916. The endpoint permits this example.
- For r=2, i=0 gives s=1 and degree at most D²; i=1 gives s≤D² and degree at most D⁴=D^(2r). For r≥2 the exponent comparison i+3≤r+2≤2r includes equality at r=2.
- For r=0 the fibre is a point, so alternative (i) holds with no chosen points. For Ξ empty and r≥1 the empty exceptional set has degree 0≤D^(2r); for fewer than r points the hyperplane section has degree D≤D^(2r).

*Needs:* §0.1; SchemeAndStackFoundations §§0.3, 5.12; AbelianSchemesAndArithmeticModuli §§A2.3, A2.10; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.7 Removing the height of X (GGK Lemma A.4)

Let A ⊆ ℙⁿ be embedded by L as in Rémond’s inequalities and X ⊆ A irreducible of positive dimension. If S ⊆ X(ℚ̄) is finite and nonempty and every equidimensional subvariety Y ⊇ S of X of dimension dim X − 1 has deg_L Y > deg_L A·(deg_L X)²/g!, then h(X) ≤ `(deg_L A/g! + 1)^{dim X+1}` deg_L X (`max_{x∈S}` h(x) + 3 log(deg_L A/g!)). (ggk-2026, Lemma A.4, p. 229 (citing Rémond, Décompte, Lemma 3.1)).

Throughout this subsection, S ⊆ X(ℚ̄) finite, not contained in any equidimensional codimension-one Y of degree ≤ deg_L A (deg_L X)²/g!; dim X ≥ 1 and S is nonempty. Zero-dimensional X is handled separately in counting arguments.

One proof route is the following. The needed input is Rémond’s arithmetic interpolation lemma, restated as GGK Lemma A.4. Its low-degree containment hypothesis turns heights of a sufficiently spread finite set into the displayed bound for h(X). Arithmetic Bézout alone does not prove this interpolation estimate, and hypersurfaces containing X cannot cut X down. The arithmetic interpolation supplier contract supplies this estimate; apply it with the nonempty set S and positive dimension stated here.

**Checks.**

- A zero-dimensional irreducible X over ℚ̄ is a singleton, so its intersection count is at most one; the positive-dimensional interpolation theorem is not applied to codimension −1. Its Fubini–Study cycle height need not equal its coefficient maximum point height.
- On the smooth cubic y²z=x³−2z³, P=[3:5:1] satisfies 25=27−2. Its coefficient height is log 5 and its singleton Fubini–Study cycle height is ½log 35. The difference ½log(7/5) is positive and less than ½log 3, in agreement with h_coeff(P)≤h_FS({P})≤h_coeff(P)+½log(n+1) on ℙⁿ. These are projective heights; the canonical normalized point identity of §7.1 uses a different metric.
- The hypothesis on S cannot be dropped: if S lies in a low-degree hypersurface section, its points carry no information on the height of X.

*Needs:* HeightsRationalPointsAndObstructions §5.9b; §0.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.8 Rémond’s bound for points of large height

Let A, L be as in Rémond’s inequalities, X ⊆ A irreducible and Γ ⊆ A(ℚ̄) of finite rank. Assuming the counting theorem below for all subvarieties of dimension < dim X, there are c₅,c₆>0 depending only on g, deg_L X and deg_L A, with c₅ chosen strictly larger than the threshold constants in §§5.4–5.5, such that #{P ∈ X°(ℚ̄) ∩ Γ : ĥ_L(P) ≥ c₅ max{1, h(X), h_Fal(A)}} ≤ `c₆^{rk Γ + 1}`. For curves (Dimitrov–Gao–Habegger Lemma 8.2): for C ⊆ A ⊆ ℙⁿ an irreducible curve that is not a translate of an algebraic subgroup, #{P ∈ C(ℚ̄) ∩ Γ : ĥ_L(P) > c·max{1, h(C), c_NT, h₁}} ≤ `c^{rk Γ}` with c = c(n, deg C). (ggk-2026, Appendix A.5, Step 1, (A.5)–(A.8) and proof, pp. 229–231; dgh-2021, Lemma 8.2, p. 32 (arXiv v3); yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024)).

Throughout this subsection, L symmetric very ample projectively normal; X irreducible; Γ of finite rank; use the controlled embedding and chosen addition polynomials of §5.3 for the Faltings-height form; otherwise the threshold retains max{1,h(X),c_NT,h₁}. Enlarge the threshold constant strictly beyond the Vojta–Mumford contradiction constant before imposing a non-strict counting cutoff.

One proof route is the following. Cover Γ_ℝ by at most ⌊`(1 + (8c₄)^{1/2})^{rk Γ}`⌋ cones on which ⟨P, Q⟩ ≥ (1 − 1/c₄)|P||Q|. In one cone order the large points by norm P₀, P₁, …; for each j the block {`P_{j+1}`, …, `P_{j+N′}`} with N′ = `(deg_L X)^{2g}` `c(g, (deg_L X)^{2g}, deg_L A)^{rk Γ+1}` + 1 is not contained in a proper X′ of degree ≤ `(deg_L X)^{2 dim X}` (else the induction hypothesis on X′ contradicts the choice of N′). The isolated-fibre alternative gives an isolated tuple with P_j; Rémond’s Mumford inequality then fails, so some P_k in the block has |P_k| > (1 + 1/c₄)|P_j|. Choose M with (1 + 1/c₄)^M ≥ c₄; every M N′ steps the norm grows by c₄, so dim X + 1 such points satisfy Rémond’s Vojta hypotheses, contradicting the lower bound on |P₀|². Hence each cone holds fewer than (dim X)·M·N′ large points. When the counting statement uses a non-strict large-height threshold, enlarge it beyond the upper bounds in the Vojta and Mumford alternatives (for example double their common positive constant). This avoids equality at the original threshold.

**Checks.**

- For rk Γ = 0 there are no points of positive height, so the bound is trivial.
- The bound is exponential in rk Γ with base depending only on g and the degrees, not on the heights of A or X.

*Needs:* §5.4; §5.5; §5.6; §5.1; §0.4.

### 5.9 The packing hypothesis (Hyp pack)

For (A, L) with L symmetric ample, X ⊆ A irreducible and Γ ⊆ A(ℚ̄) of finite rank, (Hyp pack) holds with constant c₀ = c₀(g, deg_L X) > 0 if for every P₀ ∈ X(ℚ̄): #{P − P₀ ∈ (X°(ℚ̄) − P₀) ∩ Γ : ĥ_L(P − P₀) ≤ `c₀^{-1}` max{1, h_Fal(A)}} ≤ `c₀^{rk Γ + 1}`. (ggk-2026, §7.1, (7.1), p. 220; restated Appendix A, p. 227).

Throughout this subsection, (A, L), X, Γ as stated.

One proof route is the following. A predicate on the data; it is the input Rémond’s counting needs for the small points and the output of the gap principle.

The defining object has the following API.

- The proposition (Hyp pack) for (A, L, X, Γ, c₀).
- If it holds with c₀ then it holds with every c₀′ ≥ c₀.
- If it holds for Γ with constant c₀, it holds with the same c₀ for every subgroup Γ′ ⊆ Γ of the same rank.
- Translation X ↦ X − Q preserves this condition for the same subgroup Γ and the same constant: the differences from the translated centre are identical. Enlarging Γ requires the packing hypothesis for that larger subgroup; its rank grows by at most one for ⟨Γ,Q⟩.

**Checks.**

- For Γ = A_tors (rank 0) the hypothesis says #((X° − P₀) ∩ A_tors) ≤ c₀ for every P₀: a uniform Manin–Mumford statement.
- If X° = ∅ the hypothesis holds trivially.
- On a genus-two Weierstrass Abel curve, c₀=1 works for Γ={0}: every translated intersection has at most the zero difference. Enlarging to the group generated by one nonzero Weierstrass two-torsion difference gives two zero-height differences at that base point, so 2>1. Translation with fixed Γ is valid; this enlargement is not.
- With X° replaced by X, the hypothesis fails for X containing a positive-dimensional abelian subvariety B and Γ ⊇ B_tors: infinitely many torsion points of B are at distance 0.

*Needs:* §5.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8.

### 5.10 Rémond’s counting theorem under (Hyp pack) (GGK Theorem 7.1)

Assume (Hyp pack) holds for every (A, L), X, Γ with X generating A (in all dimensions up to that of the variety counted). Then for every polarized (A, L) over ℚ̄ with L symmetric and very ample, every irreducible X ⊆ A and every finite-rank Γ ⊆ A(ℚ̄): #(X°(ℚ̄) ∩ Γ) ≤ `c(g, deg_L X, deg_L A)^{rk Γ + 1}`, with c increasing in each argument. (ggk-2026, Theorem 7.1, p. 220; proof sketch pp. 220–221; full proof Appendix A.5, Steps 1–4, pp. 229–232).

Throughout this subsection, (Hyp pack) for all generating subvarieties in dimensions ≤ dim X; L symmetric very ample.

One proof route is the following. The parent’s qualitative finite-rank Mordell–Lang theorem makes X°∩Γ finite: in its finite coset decomposition, every positive-dimensional coset lies in the Ueno locus and is excluded. Thus the minima over point configurations in the subsequent packing alternative are attained. This qualitative input does not use the uniform count being proved. Reduce to X generating A: X ⊆ A′ + Q with A′ = ⟨X − X⟩, replace Γ by ⟨Γ, Q⟩ (rank + 1) and use (X − Q)° = X° − Q; deg_L A′ is bounded in g and deg_L X (GGK Lemma 2.5); then square the constant. Induct on dim X. Step 1: the large-points bound. Step 2 (removing h(X)): with c₇ = deg_L A (deg_L X)²/g! · c(g, deg_L A (deg_L X)²/g!, deg_L A) and N″ = `c₇^{rk Γ+1}` + 1, for pairwise distinct P₀, …, `P_{N″}` ∈ X° ∩ Γ, Lemma A.4 applied to X − P₀ bounds the number of P with ĥ(P − P₀) ≥ c₈² max_i ĥ(P_i − P₀) + c₉ max{1, h_Fal(A)} by `c₁₀^{rk Γ+1}`. Step 3 (packing alternative): either #X° ∩ Γ ≤ `N″(8c₈ + 1)^{rk Γ}` + `c₁₀^{rk Γ+1}` (with factor 8c₈+1), or some Q ∈ X° ∩ Γ has at most `c₁₀^{rk Γ+1}` points P with ĥ(P − Q) ≥ 2c₉ max{1, h_Fal(A)}. Step 4: in the second case cover the ball of radius `(2c₉ max{1, h_Fal})^{1/2}` around Q by `(1 + 2(2c₉c₀)^{1/2})^{rk Γ}` balls of radius `(c₀^{-1} max{1, h_Fal})^{1/2}` (ball packing); each contains at most `c₀^{rk Γ+1}` points by (Hyp pack).

**Checks.**

- For rk Γ = 0 and Γ = A_tors this is a uniform Manin–Mumford count given (Hyp pack) at rank 0.
- Without (Hyp pack) the method bounds only the large points; the small points are exactly what the gap principle controls.

*Needs:* §5.8; §5.9; §5.7; §0.4; §5.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.11 (Hyp pack) holds for L ⊗ [−1]^*L (GGK Proposition 7.2)

For an abelian variety A of dimension g over ℚ̄ with ample L, (Hyp pack) holds, with L replaced by L ⊗ [−1]^*L and a constant c₀ = c₀(g, deg_L X), for every irreducible X ⊆ A generating A and every finite-rank Γ ⊆ A(ℚ̄). (ggk-2026, Proposition 7.2 and proof, pp. 222–223).

Throughout this subsection, A abelian over ℚ̄, L ample; X irreducible generating A; Γ of finite rank.

One proof route is the following. Fix P₀ ∈ X(ℚ̄); apply the new gap principle to X − P₀ (which generates A): the points P − P₀ ∈ (X° − P₀) ∩ Γ with ĥ ≤ c₁ max{1, h_Fal(A)} lie in a proper X′ of degree < c₂. Each component X† of X′ lies in a translate A† + Q of the abelian subvariety it generates; with Γ† = ⟨Γ, Q⟩ ∩ A†, Rémond’s counting (applicable by induction on dimension) bounds #((X† − Q)° ∩ Γ†) by `c^{rk Γ+2}`. Use (X′)° ⊇ X° ∩ X′ and sum over the boundedly many components; set c₀ = max{`c₁^{-1}`, c₃}.

**Checks.**

- The polarization L ⊗ [−1]^*L is symmetric; the gap principle is stated for it.
- The constant depends only on g and deg_L X.

*Needs:* §5.9; §4.8; §5.10; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 5.12 Rémond’s bound for one subvariety (David–Philippon form)

For a subvariety X of a principally polarized abelian variety (A,M) over a number field k, of positive dimension g, using the Mumford embedding by L=M¹⁶, and a subgroup Γ ⊆ A(ℚ̄) of finite rank r, X(ℚ̄) ∩ Γ is a union of at most `(2^{34} h₀(A) deg_L X)^{(r+1) g^(5(dim X + 1)²)}` sets (x_i + B_i)(ℚ̄) ∩ Γ with x_i + B_i ⊆ X and B_i abelian subvarieties, where A is principally polarized by M over a number field k, L=M¹⁶, h(A) is the height of the origin in its Mumford theta embedding and h₀(A)=[k:Q]max{1,h(A)}. For arbitrary ample polarizations, the general counting theorem is §5.10; the displayed explicit numerical formula retains this principal theta setting. (dgh-2021, Proof of Theorem 1.1, p. 35, and Remark 8.3, p. 36 (arXiv v3), citing David–Philippon, Comment. Math. Helv. 77 (2002), p. 643; david-philippon-2002, p. 643; ggk-2026, §7.1, (7.3)–(7.6), pp. 220–222 (citing david-philippon-2007, Theorem 6.8 and (6.41))).

The small-point input is the following quantitative count, owned here. In the same setting, with D = deg_L X, X° the complement of the Ueno locus and ĥ the Néron–Tate height for L in David–Philippon’s normalization, put `Q = (2^(16g) h₀(A)^(2/g) D)^((4g²)^(dim X))`. (a) At most Q points of X°(ℚ̄) have ĥ < 1/Q. (b) For every real a > 1 and every Γ ⊆ A(ℚ̄) of finite rank r, at most `Q (5aQ)^(r/2)` points of Γ ∩ X°(ℚ̄) have ĥ ≤ a. (david-philippon-2002, Théorèmes 1.2–1.4, p. 641; proof of Théorème 1.3, pp. 689–690.) The source states (a) and (b) with its quantity q(X) and proves q(X) ≤ Q in Théorème 1.4; both counts are monotone in the constant, so they hold with Q. The source deduces (b) from the non-strict form of (a) for its smaller constant (its Théorème 5.3): it covers the ellipsoid ĥ ≤ a in Γ_ℝ by translates, centred at points x′ of Γ ∩ X°, of a small ellipsoid whose quarter-size copies are pairwise disjoint, and counts each translate on X − x′, which has the same degree and Ueno complement X° − x′.

Throughout this subsection, A,M and the chosen theta coordinates descend to k, L=M¹⁶ and h₀(A) includes [k:Q]; Γ has finite rank and X is defined over Q̄.

One proof route is the following. Large points: the large-points bound (Rémond’s Vojta and Mumford inequalities), with c_NT and h₁ bounded by h₀(A). Small points: take a > 1 at least the large-point threshold of §5.8 and apply the quantitative small-point count stated above; the at most Q exceptional points of height below 1/Q, among them all torsion points of X°, are kept inside that count rather than excluded by a lower bound, and the points of height above a are the large points. Induction on dim X handles the exceptional subvarieties; David–Philippon p. 643 records the resulting explicit constant. The exponent is (r+1)g^(5(dim X+1)²), with the whole 5(dim X+1)² in the exponent of g (david-philippon-2002, p. 643).

**Checks.**

- The bound depends on the height of A, unlike the uniform theorems; it is the input for the finitely many curves of small modular height in DGH Theorem 1.1.
- For r = 0 it is a bound, uniform in the base point, on torsion cosets: this supplies the small-height step of DGH Theorem 1.4.
- Negative control for the small-point count: for a genus-two curve C with Weierstrass point w and X = C − w in its Jacobian, L = M¹⁶ gives D = 16·(Θ·C) = 32, dim X = 1, (4g²)^(dim X) = 16 and Q = (2³²·h₀(A)·32)¹⁶ = 2⁵⁹² h₀(A)¹⁶. X° = X contains the six 2-torsion points w_i − w of height 0, and 6 ≤ Q as (a) allows; a positive lower bound for ĥ on all of X° would be false.
- In (b) with r = 0 and a = 2 the count is at most Q, independent of a, matching the rank-zero torsion count; with r = 2 the factor 5aQ enters to the first power, so replacing the exponent r/2 by r would square it and lose the square-root packing gain.

*Needs:* §5.8; §0.4; §5.1; §5.3; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### Examples

For rank zero the Néron–Tate space is zero. For a rank-one division group it is R although the subgroup is not finitely generated. Covering 3 balls with c₀=2 and rank one yields at most 3·2²=12 points, not 6. Taking c₁=1/4 and c₃=2 requires c₀≥4 in the reciprocal threshold. A coordinate swap on E² sends (P,0) to (0,P); it cannot preserve an arbitrary rank-one group.

### Dependencies

Layers 0,3–4; SchemeAndStackFoundations §§0.3, 5.12; HeightsRationalPointsAndObstructions §§1.7–1.8,5.9–5.13; AbelianSchemesAndArithmeticModuli A1–A3,A6; the controlled polarization embeddings contract of ArakelovGeometryAndAbelianHeights; the arithmetic interpolation contract of HeightsRationalPointsAndObstructions. Use simultaneous strong induction on subvariety dimension: the rank-bounded packing assertion for dimension r uses the conditional counting theorem only on exceptional components of dimension below r, and the dimension-r counting theorem then uses that packing assertion. No same-dimension counting result is assumed in its own proof.

## Layer 6: Uniform Mordell–Lang

### 6.1 The uniform count off the Ueno locus over ℚ̄

For all g, d ≥ 0 there is c(g, d) > 0 such that for every abelian variety A over ℚ̄ of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every finite-rank Γ ⊆ A(ℚ̄): #(X°(ℚ̄) ∩ Γ) ≤ `c(g, d)^{1 + rk Γ}`. (ggk-2026, §7.2, pp. 222–223).

Throughout this subsection, A abelian over ℚ̄, L ample; X irreducible closed; Γ of finite rank.

One proof route is the following. Replace L by `(L ⊗ [−1]^*L)^{⊗4}`, symmetric, very ample and projectively normal; degrees change by a factor depending only on g and dim X. Reduce to X generating A: X ⊆ A′ + Q with A′ = ⟨X − X⟩ of degree bounded in g, d (GGK Lemma 2.5); pass to X − Q ⊆ A′ and ⟨Γ, Q⟩ ∩ A′, raising the rank by at most one. For generating X, (Hyp pack) holds (GGK Proposition 7.2), so Rémond’s counting theorem gives the bound with deg_L A bounded in terms of g and d.

**Checks.**

- For Γ = A_tors (rank 0) this is uniform Manin–Mumford: #(X° ∩ A_tors) ≤ c(g, d).
- For X = A, X° = ∅ (for g ≥ 1) and the bound is vacuous.

*Needs:* §5.10; §5.11; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1.

### 6.2 Masser’s specialization of subgroups and endomorphisms

Let 𝒜 → V be an abelian scheme over an irreducible variety V over ℚ̄ with generic fibre A over the function field, and Γ ⊆ A a finitely generated subgroup of sections. The set of v ∈ V(ℚ̄) at which the specialization Γ → Γ_v is injective and `End(A_{K̄})` → End(𝒜_v) is an isomorphism is Zariski dense in V. (ggk-2026, Proof of Lemma 7.3, p. 224 (citing Masser, Trans. Amer. Math. Soc. 311 (1989), Main Theorem and Scholium 1; Masser, Bull. Soc. Math. France 124 (1996), Main Theorem); masser-1996, Theorem, p. 459, and abstract, p. 457).

Throughout this subsection, V irreducible over ℚ̄; 𝒜 → V abelian scheme; Γ finitely generated; K is the generic function field. All data descend to a finitely generated model over a number field; after a finite cover, generators of the geometric generic endomorphism ring extend, so the displayed specialization map is defined.

One proof route is the following. Use the common polynomial-vanishing degree w on a fixed affine number-field model: Masser 1989 gives w(E_Γ(d,h))≤C₁hᵃ at fixed d, and Masser 1996 gives w(E_End(d,h))≤C₂max{d,h}ᵇ. Multiplying vanishing polynomials bounds w of their union by the sum. At the fixed degree d=deg V, Masser 1989 Scholium 1 gives w(V(d,h))≥exp(ch). For h large the exponential exceeds the sum of both polynomial bounds, so a good specialization exists in every prescribed dense open; apply the argument after shrinking to that open. This proves simultaneous density without intersecting separate dense sets (masser-1989, Main Theorem and Scholium 1, pp. 413–414; masser-1996, Theorem, p. 459).

**Checks.**

- For a constant family with Γ generated by constant sections, the geometric endomorphism ring and Γ specialize identically at every point. Constancy of the abelian scheme alone does not make arbitrary sections constant.
- Base change the Legendre family to V: μ²=2(2−λ), with λ≠0,1,∞, and take P=(2,μ). The equation gives 2·1·(2−λ)=μ². At μ=0 (λ=2), P=(2,0) has exact order 2, whereas generically μ≠0 so P is not 2-torsion. A torsion section over connected V would have constant order, since all torsion group schemes are finite étale in characteristic zero; hence P is non-torsion generically. Specialization of Γ=⟨P⟩ at μ=0 kills 2P, so it is not injective.

*Needs:* AbelianSchemesAndArithmeticModuli A1–A3, A6; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; InverseGaloisAndArithmeticFundamentalGroups IG.2.

### 6.3 Good models: the Ueno locus specializes

Let X be a closed subvariety of an abelian variety A over the function field of an irreducible variety V over ℚ̄, spread out to a flat family 𝔛 ⊆ 𝒜 → V. After replacing V by a dense open, 𝔛 can be chosen so that for every v ∈ V(ℚ̄) the Ueno locus of 𝔛_v is the specialization of the Ueno locus of X; hence 𝔛_v° is the specialization of X°, and deg_L X = `deg_{L_v}` 𝔛_v. (ggk-2026, Proof of Lemma 7.3, p. 224 with the bounded-direction and relative-Hilbert route of the stated parent supplier contract).

Throughout this subsection, V irreducible over ℚ̄; X ⊆ A over ℚ̄(V).

One proof route is the following. The maximal cosets in X have finitely many directions B of bounded degree (HeightsRationalPointsAndObstructions §§5.4a–5.4b); spread each B and the loci X_B with Z(X) = ⋃ (X_B + B) over a dense open. A coset in a fibre 𝔛_v of dimension > 0 has a direction of bounded degree; the bounded-degree abelian subschemes of 𝒜 are finite étale over a dense open (HeightsRationalPointsAndObstructions §5.13c), so after shrinking V every such direction is the specialization of a generic one, and the coset lies in the specialization of Z(X). Degrees are constant in flat families.

**Checks.**

- For X a curve of genus ≥ 2 the Ueno locus is empty generically and in every fibre of a good model.
- A good model must control specialization of the given X and its Ueno locus after shrinking. Extra endomorphisms alone need not create cosets in X; avoiding all CM fibres by one Zariski-open restriction is not asserted.

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 6.4 From ℚ̄ to arbitrary fields for finitely generated subgroups (GGK Lemma 7.3)

If the uniform count off the Ueno locus holds over ℚ̄, then for every algebraically closed field F of characteristic 0, every abelian variety A over F with ample L, every irreducible X ⊆ A and every finitely generated Γ ⊆ A(F) of rank ρ, #(X°(F) ∩ Γ) ≤ `c(g, deg_L X)^{1+ρ}` with the same function c. (ggk-2026, Lemma 7.3 and proof, pp. 223–224).

Throughout this subsection, F algebraically closed of characteristic 0; Γ finitely generated.

One proof route is the following. Choose a finitely generated ℚ̄-algebra over which A, L, X, the generators γ₁, …, γ_r of Γ and End(A) are defined; spread out over a regular irreducible variety V with A → V abelian, L relatively ample, endomorphisms extending, X flat, and γ_i sections. Shrink V to make the model good for the Ueno locus. For v in Masser’s dense set Θ, Γ → Γ_v is injective, so #(X°(F) ∩ Γ) ≤ #(𝔛_v°(ℚ̄) ∩ Γ_v) ≤ `c(g, deg X)^{1 + rk Γ_v}` ≤ `c(g, deg X)^{1+ρ}`.

**Checks.**

- For F = ℚ̄ the lemma is the identity.
- Only finitely generated Γ are treated here; finite rank is reached by a filtered union.

*Needs:* §6.1; §6.2; §6.3; §0.1.

### 6.5 The uniform count off the Ueno locus (GGK Theorem 1.1′)

For all g, d ≥ 0 there is c(g, d) > 0 such that for every algebraically closed field F of characteristic 0, every abelian variety A over F of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every subgroup Γ ⊆ A(F) of finite rank: #(X°(F) ∩ Γ) ≤ `c(g, d)^{1 + rk Γ}`. (ggk-2026, Theorem 1.1′ and (1.2), p. 191; proof §7.3, pp. 224–225).

Throughout this subsection, F algebraically closed of characteristic 0; Γ of finite rank ρ.

One proof route is the following. Choose a finitely generated Γ₀ ⊆ A(F) of rank ρ with Γ contained in its division hull {x : [N]x ∈ Γ₀ for some N} (HeightsRationalPointsAndObstructions §5.5). For n ≥ 1, (1/n)Γ₀ = {x : [n]x ∈ Γ₀} is finitely generated of rank ρ; the specialization lemma gives #(X°(F) ∩ (1/n)Γ₀) ≤ `c^{1+ρ}` independently of n. The (1/n!)Γ₀ form a filtered system exhausting the division hull, so #(X°(F) ∩ Γ) ≤ `c^{1+ρ}`. The subgroup Γ₀ need not be End(A)-stable; replacing it by End(A)·Γ₀ can increase its rank.

**Checks.**

- For Γ = 0, X°(F) ∩ Γ is empty or the origin, and the bound holds trivially.
- The bound is independent of F and of A.

*Needs:* §6.4; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 6.6 From the count off the Ueno locus to Mordell–Lang (GGK Lemma 7.4)

If the uniform count off the Ueno locus holds for all (A, L), X and Γ, then the uniform Mordell–Lang theorem holds: for X generating A, X(F) ∩ Γ is covered by at most `c₄c₆^{1+rk Γ}` + #(X°(F) ∩ Γ) cosets x + B ⊆ X, with c₄, c₆ depending only on dim A and deg_L X. (ggk-2026, Lemma 7.4 and proof, pp. 225–226).

Throughout this subsection, the uniform count off the Ueno locus for all data.

One proof route is the following. Reduce to X generating A as for the count over ℚ̄. The maximal positive-dimensional directions B with x + B ⊆ X form a set Σ(X; A) of bounded size and degree (HeightsRationalPointsAndObstructions §§5.4a–5.4b), and Z(X) = ⋃_B (X_B + B) with X_B = `⋂_{b∈B}(X − b)` ∩ B^⊥ for a complement B^⊥ of bounded degree (HeightsRationalPointsAndObstructions §5.4c; GGK cites Masser–Wüstholz for the complement). Each coset of X ∩ Γ in direction B can be represented by a point of X_B° up to the addition isogeny f : B × B^⊥ → A: use the projected group Γ_B = `pr₂(f^{-1}Γ)` ⊆ B^⊥(F), of rank ≤ rk Γ. Apply the count off the Ueno locus to each component of X_B with Γ_B, and once more to X° ∩ Γ for the zero-dimensional cosets.

**Checks.**

- If X° = X (no positive-dimensional cosets), the cosets are points and the statement is the count itself.
- Γ_B is not Γ ∩ B^⊥: intersecting with Γ can lose the coset representatives.

*Needs:* §6.5; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §0.1.

### 6.7 The uniform Mordell–Lang theorem (Gao–Ge–Kühne Theorem 1.1)

For all integers g, d ≥ 0 there is c(g, d) > 0 such that for every algebraically closed field F of characteristic 0, every abelian variety A over F of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every subgroup Γ ⊆ A(F) of finite rank, there are cosets x_i + B_i ⊆ X, 1 ≤ i ≤ N ≤ `c(g, d)^{1 + rk Γ}`, with X(F) ∩ Γ = ⋃_i (x_i + B_i)(F) ∩ Γ. (ggk-2026, Theorem 1.1 and (1.1), p. 190; deduced from Theorem 1.1′ by Lemma 7.4, pp. 225–226).

Throughout this subsection, F algebraically closed of characteristic 0; L ample; X irreducible closed; Γ of finite rank.

One proof route is the following. Apply the Ueno reduction to the uniform count off the Ueno locus; reduce a non-generating X to the abelian subvariety it generates after translation, which increases the rank by at most one and changes the constant only in terms of g and d.

**Checks.**

- For a curve C of genus ≥ 2 in its Jacobian this recovers the Dimitrov–Gao–Habegger–Kühne bound #(C(F) ∩ Γ) ≤ `c(g)^{1 + rk Γ}`.
- For Γ = A_tors it gives uniform Manin–Mumford: the torsion points of X lie on at most c(g, d) torsion cosets in X.
- The qualitative Mordell–Lang theorem of the parent (HeightsRationalPointsAndObstructions §5.13) is the statement without the bound on N; the uniform proof uses from it only the structure of the Ueno locus.

*Needs:* §6.6; §6.5; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 6.8 Uniform Mordell–Lang for curves (Kühne Theorem 4)

For each g ≥ 2 there is c(g) > 0 such that for every smooth projective curve C of genus g over an algebraically closed field F of characteristic 0, every divisor D of degree 1 on C and every subgroup Γ ⊆ Jac(C)(F) of finite rank ρ, #(ι_D(C) ∩ Γ) ≤ `c(g)^{1+ρ}`. In particular a curve C of genus g over a number field K satisfies #C(K) ≤ `c(g)^{1 + rk Jac(C)(K)}`. (kuhne-2021, Theorem 4, p. 8 (arXiv v4); yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024)).

Throughout this subsection, g ≥ 2; C smooth projective over F algebraically closed of characteristic 0; D of degree 1; Γ of finite rank.

- `Suggested.lean` states `uniform_mordellLang_curves`, which uses the same Albanese curve and translating point as §3.6. The rank bound is expressed by a finite set s with at most ρ elements and containment of Γ in its division hull: every p∈Γ has p^n in the subgroup generated by s for some integer n>0. This is equivalent to rank at most ρ for the abelian point group and does not require Γ to be finitely generated; B≥1 is an integer and the bound is B^(1+ρ).
- `Suggested.lean` states `uniform_rationalPoints_curves`, which bounds the full F-point set for every number field F, using a smooth proper geometrically integral one-dimensional X, a chosen rational base point, an Albanese J of dimension g, and the full group J(F) in the division hull of at most ρ points. Its integer B≥1 depends only on g; there is no field-degree hypothesis (kuhne-2021, remark after Theorem 4, p. 8). Without a rational base point, X(F)=∅ and 0≤B^(1+ρ).

One proof route is the following. ι_D(C) ⊆ Jac(C) is an irreducible curve of degree g for the theta polarization with ι_D(C)° = ι_D(C). Apply the uniform count with (g, d) = (g, g). For rational points over K, choose D = a rational point if one exists (otherwise C(K) = ∅) and Γ = Jac(C)(K), of rank rk Jac(C)(K) (Mordell–Weil, HeightsRationalPointsAndObstructions §1.7).

**Checks.**

- If ρ=0 then s=∅, its generated subgroup is {1}, and the positive-power condition is p^n=1 for some n>0. It therefore allows all torsion, rather than forcing Γ={1}; the bound is B^(1+0)=B. The requirement n>0 excludes the vacuous choice p^0=1 for every p.
- Γ = Jac(C)_tors recovers uniform Manin–Mumford for curves.
- The bound for #C(K) does not depend on [K : ℚ], unlike Dimitrov–Gao–Habegger Theorem 1.1.

*Needs:* §6.7; §6.5; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2.

### 6.9 Counting on curves of large modular height (DGH Proposition 8.1)

With M_g, τ, 𝔄_g and M as in the Abel–Jacobi bounds, there are c₁ ≥ 0 and c₂ ≥ 1 such that for every s ∈ M_g(ℚ̄) with `h_{A_g,M}(τ(s))` ≥ c₁, every finite-rank Γ ⊆ `𝔄_{g,τ(s)}(ℚ̄)` of rank ρ and every P₀ ∈ C_s(ℚ̄): #((C_s(ℚ̄) − P₀) ∩ Γ) ≤ `c₂^{1+ρ}`. (dgh-2021, Proposition 8.1 and proof, pp. 31–34 (arXiv v3)).

Throughout this subsection, s with large modular height; Γ of finite rank; P₀ ∈ C_s.

One proof route is the following. Choose P_s as in the Abel–Jacobi bounds, so h(C_s − P_s) ≤ c max{1, h(τ(s))}; replace Γ by Γ′ = ⟨Γ, P₀ − P_s⟩, of rank ≤ ρ + 1. Large points: Rémond’s bound (curve case of the large-points bound) with c_NT, h₁ ≤ c max{1, h(τ(s))}: at most `c^{ρ+1}` points have ĥ > c₀ max{1, h(τ(s))}. Small points: they lie in a ball of radius `(c₀ max{1, h})^{1/2}`; cover it by `(1 + 2(c₀c₃)^{1/2})^{ρ+1}` balls of radius `(max{1, h}/c₃)^{1/2}` centred at points of the set (ball packing); each ball holds fewer than c₄ points or its centre lies in the bounded exceptional set Ξ_s (the Néron–Tate distance proposition).

**Checks.**

- The bound does not depend on the height of the curve once that height is large.
- Below the threshold c₁ the proposition gives nothing; the small-height curves are handled by Northcott and Rémond’s single bound.

*Needs:* §4.3; §5.8; §5.3; §4.1; §0.4; §5.1.

### 6.10 Uniform Mordell–Lang for curves of large modular height (DGH Theorem 1.2 and Corollary 1.3)

For g ≥ 2 and an immersion ι of the coarse moduli space `A_{g,1}` into ℙ^m over ℚ̄ there are c₁ = c₁(g, ι) ≥ 0 and c₂ = c₂(g, ι) ≥ 1 such that for every smooth curve C of genus g over ℚ̄, P₀ ∈ C(ℚ̄) and finite-rank Γ ⊆ Jac(C)(ℚ̄) of rank ρ with h(ι([Jac(C)])) ≥ c₁: #((C(ℚ̄) − P₀) ∩ Γ) ≤ `c₂^{1+ρ}`. In particular (Γ = Jac(C)_tors) #((C(ℚ̄) − P₀) ∩ Jac(C)_tors) ≤ c₂. (dgh-2021, Theorem 1.2 and Corollary 1.3, p. 3; proof §8, pp. 35–36 (arXiv v3)).

Throughout this subsection, g ≥ 2; ι an immersion of the coarse moduli space; Jacobians of large height.

One proof route is the following. Choose a level-ℓ structure on C over ℚ̄, giving s ∈ M_g with τ(s) ↦ [Jac(C)] under the finite forgetful map ρ : `A_{g,ℓ}` → `A_{g,1}`. Compare heights along ρ: h(ι(ρ(t))) ≤ `c′h_{A_g,M}(t)` + c″ (height machine), so a large height of ι([Jac(C)]) forces large modular height. Apply the count for curves of large modular height; Γ = Jac(C)_tors has rank 0.

**Checks.**

- Corollary 1.3 is the case ρ = 0.
- The constants depend on the immersion ι, which the uniform Mordell–Lang theorem for curves removes together with the large-height hypothesis.

*Needs:* §6.9; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 6.11 Finitely many curves of small modular height and bounded degree

Fix g ≥ 2, d ≥ 1 and c₁. The smooth genus-g curves C defined over a number field F with [F : ℚ] ≤ d and `h_{A_g,M}(τ(s))` < c₁ (for a level structure s over F′ ⊇ F) lie in finitely many ℚ̄-isomorphism classes, and the degree [F′ : F] of the field over which a level structure is defined is bounded in terms of g and the level. (dgh-2021, Proof of Theorem 1.1, pp. 34–35 (arXiv v3)).

Throughout this subsection, [F : ℚ] ≤ d; modular height < c₁.

One proof route is the following. A level-ℓ structure is defined over an extension F′ of degree at most #`GL_{2g}(ℤ/ℓ)`; so τ(s) has bounded degree and bounded height. Northcott on the moduli space (ArakelovGeometryAndAbelianHeights §§5.5–5.8) leaves finitely many τ(s); Torelli has finite fibres (StableReductionPartII §6.6), so finitely many s. Each s determines C over ℚ̄ up to isomorphism.

**Checks.**

- The field-degree bound is essential for Northcott: algebraic points of unbounded degree can have height zero (roots of unity in ℙ¹). Twists do not give distinct ℚ̄-isomorphism classes, so they are not a counterexample to this geometric finiteness statement.
- The finite set depends on (g, d, c₁, ℓ).

*Needs:* ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### 6.12 Uniform bound for rational points (Dimitrov–Gao–Habegger Theorem 1.1)

For integers g ≥ 2 and d ≥ 1 there is c = c(g, d) ≥ 1 such that every smooth geometrically irreducible projective curve C of genus g over a number field F with [F : ℚ] ≤ d satisfies #C(F) ≤ `c^{1+ρ}`, ρ = rk Jac(C)(F). The constant can be chosen to grow at most polynomially in d. (dgh-2021, Theorem 1.1 and (1.1), pp. 1–2; proof §8 and the remark after it, pp. 34–35 (arXiv v3)).

Throughout this subsection, g ≥ 2; [F : ℚ] ≤ d.

- `Suggested.lean` states the degree-free bound of §6.8 as `uniform_rationalPoints_curves`. The degree-dependent DGH bound with polynomial growth in d is the prose target here.

One proof route is the following. If C(F) = ∅ there is nothing to prove; otherwise take P₀ ∈ C(F) and Γ = Jac(C)(F), of rank ρ (Mordell–Weil, HeightsRationalPointsAndObstructions §1.7). Large modular height: the count for curves of large modular height. Small modular height: finitely many curves over ℚ̄; for each, Rémond’s single bound (David–Philippon form) gives a bound uniform in P₀ and exponential in ρ. Polynomial growth in d: in the small-height case h_Fal and the David–Philippon height are bounded (ArakelovGeometryAndAbelianHeights §§5.5–5.8), and Rémond’s bound is polynomial in D·max{1, h_DP} with D ≤ [F′ : F]d.

**Checks.**

- The uniform Mordell–Lang theorem for curves removes the dependence on d.
- For ρ = 0, #C(F) is bounded in terms of g and d only (torsion constructions are bounded).

*Needs:* §6.9; §6.11; §5.12; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### Examples

When Γ={0}, an intersection off the Ueno locus has cardinality 0 or 1. An elliptic coset contributes one coset but no isolated points. Over a genus-two curve the theta degree is 2, so the general degree-and-dimension theorem gives a genus-only constant. Lifting Γ through an isogeny and projecting its lift preserves the required rank bound even when chosen complementary representatives are not in Γ.

### Dependencies

Layers 0,4–5; HeightsRationalPointsAndObstructions §§1.7,5.4,5.13b–c; InverseGaloisAndArithmeticFundamentalGroups IG.2; ArakelovGeometryAndAbelianHeights §§5.5–5.8; StableReductionPartII §6.6.

## Layer 7: Small points over function fields

### 7.1 Canonical heights as heights of the invariant adelic extension

Let k be a field and K a function field of one variable over k (or k = ℤ and K a number field), A an abelian variety over K, L a symmetric ample line bundle and L̄ its invariant adelic extension with [2]^*L̄ = 4L̄. For x ∈ A(K̄), `h_{L̄}(x)` = ĥ_L(x), the Néron–Tate height in the normalization of adelic heights (over K, residue degrees over k), and for a closed subvariety X ⊆ `A_{K̄}` of dimension d, `h_{L̄}(X)` = `(L̄|_X)^{d+1}`/(a_K (d+1) deg_L X), with a_K = [K:ℚ] for a number field and a_K = 1 for a function field, equals the canonical height ĥ_L(X) of X (the limit `n^{-2}h([n]X)`, equivalently the model intersection under everywhere good reduction). (xy-2022, §1.1, (1.1)–(1.3), pp. 2–3 (arXiv v1); yuan-2026, §2.2, Proposition 2.6, p. 31; §4.1.2, pp. 63–64; §4.3.1, p. 71 (author manuscript 21 August 2024)).

Throughout this subsection, K a number field or a function field of one variable over k; L symmetric ample on A.

One proof route is the following. Both sides are invariant under [2] up to the factor 4 (L̄ by construction, ArakelovGeometryAndAbelianHeightsPartII §5.1; the canonical heights by the HeightsRationalPointsAndObstructions §§0.18–0.19, 0.31, 0.34), and both differ from a model height by a bounded amount; Tate’s uniqueness gives equality on points. For subvarieties, `h_{L̄}(X)` is the limit of model intersections along the Tate sequence `4^{-n}[2^n]^*L̄₀`, which is the parent’s definition of ĥ_L(X) (model intersections agree with model metrics, HeightsRationalPointsAndObstructions §§0.18–0.19, 0.31, 0.34); under everywhere good reduction it is the intersection of the rigidified symmetric model.

**Checks.**

- For X a point the subvariety height is the point height.
- For X = A (or an abelian subvariety, or a torsion translate of one) both sides vanish.
- The normalization over function fields keeps k fixed: enlarging the coordinate field of x or X while keeping K as reference field changes neither side (degrees are divided by the extension degree), whereas taking a finite extension E of K as the new reference field multiplies both sides by [E : K]; for example the projective point [1:1/(t²+1)] has height 2 with reference field ℝ(t) and height 4 with reference field ℂ(t).

*Needs:* ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 7.2 Essential minimum and canonical height over function fields (Zhang, Gubler)

Let K be a function field of one variable over an algebraically closed field k, A/K an abelian variety, L symmetric ample and X ⊆ `A_{K̄}` closed and irreducible of dimension d. With e₁(X) = `sup_{U ⊆ X open dense}` `inf_{x ∈ U(K̄)}` ĥ_L(x): e₁(X) ≥ ĥ_L(X) ≥ e₁(X)/(d + 1). In particular ĥ_L(X) = 0 if and only if X contains a dense set of small points (X(ε) Zariski dense for every ε > 0). (xy-2022, Proof of Lemma 5.2, p. 23 (arXiv v1); gh-2019, §A.3, p. 57 (arXiv v3)).

Throughout this subsection, K/k of transcendence degree 1 with k algebraically closed; X irreducible.

One proof route is the following. Apply the fundamental inequality of ArakelovGeometryAndAbelianHeightsPartII §4.8 to L̄|_X, which is nef with ample (hence big) geometric part, and identify `h_{L̄}(X)` with ĥ_L(X) and point heights with Néron–Tate heights (the adelic comparison). Both inequalities are the Yuan–Zhang fundamental inequality (Theorem 5.3.3 and Lemma 5.3.4) in the supplier’s §4.8; Xie–Yuan quote only the upper one (Zhang, Gubler Lemma 4.1) and Gao–Habegger only the equivalence (Gubler Corollary 4.4). If X(ε) is dense for all ε then e₁(X) = 0, so ĥ_L(X) = 0; conversely ĥ_L(X) = 0 gives e₁(X) ≤ (d + 1)·0 = 0, i.e. dense small points. The converse direction is the one Xie–Yuan’s induction needs.

**Checks.**

- For X a point, e₁ = ĥ(x) = ĥ(X).
- For X special (a torsion translate of the image of a constant subvariety), ĥ(X) = 0 and small points are dense.
- Over a number field the same inequalities hold (HeightsRationalPointsAndObstructions §§5.17, 5.17f); the statement here is the function-field version needed for the geometric Bogomolov conjecture.

*Needs:* §7.1; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 7.3 Dense sets of small points over a function field

Let k be algebraically closed, K/k finitely generated of transcendence degree ≥ 1 with a polarization (S, M) (S a normal projective model of K over k, M ample), A/K an abelian variety, L symmetric ample and ĥ the canonical height defined by L and (S, M). For a closed subvariety X ⊆ `A_{K̄}` and ε > 0 put X(ε) = {x ∈ X(K̄) : ĥ(x) < ε}. X contains a dense set of small points of A/K/k if X(ε) is Zariski dense in X for every ε > 0. (xy-2022, §1.1, (1.4), p. 3 (arXiv v1)).

Throughout this subsection, K/k finitely generated, trdeg ≥ 1, k algebraically closed; polarization (S, M).

One proof route is the following. Use the parent’s canonical heights over polarized function fields (HeightsRationalPointsAndObstructions §§0.31–0.32). Independence: two choices of (L, S, M) give heights with `n^{-1}ĥ` ≤ ĥ′ ≤ nĥ (comparison of ample bundles, HeightsRationalPointsAndObstructions §0.32), so density of X(ε) for all ε is unchanged.

The defining object has the following API.

- X(ε) ⊆ X(K̄) for ε > 0.
- The predicate: X(ε) Zariski dense in X for all ε > 0.
- Independent of L and of the polarization (S, M).
- If X has dense small points and f : A → B is a homomorphism, then the closure of f(X) has dense small points.
- Preserved under finite extension of K and extension of the algebraically closed constant field (HeightsRationalPointsAndObstructions §0.33).
- For trdeg(K/k) = 1 and X irreducible: X has dense small points iff ĥ(X) = 0 (Zhang–Gubler).

**Checks.**

- A torsion point x has ĥ(x) = 0, so {x} has dense small points.
- If A has trivial geometric K̄/k̄-trace, a non-torsion point has ĥ > 0 and {x} has no dense small points.
- For a constant elliptic curve E₀ ⊗_k K and a point of E₀(k) of infinite order, ĥ = 0, so a non-torsion point can have dense small points over a function field (the trace).
- X = A has dense small points (torsion is dense).
- In characteristic zero, a nontrivial quadratic twist over k(t) of a constant elliptic curve with generic j can have zero k(t)/k-trace but becomes constant after a quadratic extension. Non-torsion constant points then have geometric height zero. Ordinary trace zero cannot replace geometric trace zero.

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 7.4 Special subvarieties of an abelian variety over a function field

Fix algebraic closures k̄ ⊆ K̄ for a function-field extension K/k, and let A/K be abelian. Let (T,tr) be the K̄/k̄-trace of `A_{K̄}`, with tr : `T_{K̄}` → `A_{K̄}`. An irreducible closed X ⊆ `A_{K̄}` is special for A/K/k if X = `tr(Y_{K̄})` + (a+B), where Y ⊆ T is an irreducible closed subvariety over k̄, B ⊆ `A_{K̄}` is an abelian subvariety, and a is torsion. Here a torsion subvariety means one torsion translate, as in XY (1.5); a reducible closed set is treated componentwise. (xy-2022, §1.1, (1.5), p. 3; §3.2, (3.3), p. 15 (arXiv v1)).

Throughout this subsection, K/k a function-field extension, fixed algebraic closures k̄ ⊆ K̄; A/K abelian; X geometrically irreducible over K̄.

One proof route is the following. Apply the parent’s Chow trace to the regular extension K̄/k̄. The trace map has finite kernel (a closed immersion in characteristic zero; possibly inseparable kernel in positive characteristic). Its image and the torsion translate are summed by the proper addition map. A torsion subvariety is a torsion translate a + C of an abelian subvariety C (XY’s convention for (1.5)); the sum is the image of the addition map.

The defining object has the following API.

- The predicate X special for A/K/k.
- Every torsion subvariety is special (Y = {0}).
- tr(Y ⊗ K̄) is special for every Y ⊆ T.
- If T = 0, X is special iff X is a torsion subvariety.
- The image of a special subvariety under a homomorphism is special.
- For K = k(S) with S a curve over k = ℚ̄ (or algebraically closed of characteristic 0), an irreducible 𝒳 ⊆ 𝒜 dominating S is generically special (AbelianSchemesAndArithmeticModuliPartII B2) iff its geometric generic fibre is special.
- Special subvarieties contain dense sets of small points, for each positive threshold.

**Checks.**

- A point x ∈ A(K̄) is special iff x ∈ tr(T(k̄)) + A_tors.
- For a constant abelian variety A = A₀ ⊗_k K and a smooth curve C₀ ⊆ A₀ of genus at least two, C₀ ⊗ K̄ is special though it is not a torsion subvariety, since a one-dimensional torsion coset is an elliptic curve. By contrast C₀ = E×{0} ⊆ E² is an abelian subvariety, so it satisfies both predicates.
- A genus-≥ 2 curve in its Jacobian over K with J of trivial trace (a non-isotrivial curve with simple non-isotrivial Jacobian) is not special.
- A translate x + C of an abelian subvariety by a point x that is non-torsion modulo C + tr(T) is not special.

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuliPartII B0–B4.

### 7.5 Special subvarieties have dense small points

If X ⊆ `A_{K̄}` is special for A/K/k, then X(ε) is Zariski dense in X for every ε > 0. (xy-2022, §1.1, p. 3 (arXiv v1)).

Throughout this subsection, X special.

One proof route is the following. Points of tr(Y ⊗ K̄)(k̄-rational, i.e. images of Y(k̄)) have height 0 (constant points are in the kernel of the Néron–Tate height over function fields, HeightsRationalPointsAndObstructions §1.11) and are dense in tr(Y ⊗ K̄). Torsion points of an abelian subvariety C are dense in C (prime-to-p torsion is dense, AbelianSchemesAndArithmeticModuli A3) and have height 0. Sums of height-zero points have height zero (ĥ is a quadratic form whose zero set is a subgroup); a dense subset of a product maps onto a dense subset of the sum.

**Checks.**

- A torsion point has dense small points trivially.
- Over number fields the trace part is absent, and special means torsion subvariety.

*Needs:* §7.4; §7.3; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### Examples

A non-torsion constant point has height zero and is special through the geometric trace. A non-torsion point on a geometrically trace-free variety has positive height. On a dimension-one subvariety the minima inequalities read e₁≥ĥ(X)≥e₁/2; zero canonical cycle height forces e₁=0 in both directions.

### Dependencies

HeightsRationalPointsAndObstructions §§0.31–0.35,1.9–1.11; ArakelovGeometryAndAbelianHeightsPartII §§4.6–4.8,5.1; native algebraic closure and Zariski topology.

## Layer 8: Geometric Bogomolov over function fields of curves in characteristic zero

### 8.1 Torsion of bounded degree has bounded order (GH Proposition B.1)

Let S be a smooth irreducible quasi-projective variety over an algebraically closed field k of characteristic 0, K = k(S), and A an abelian variety over K with `(A_{K̄})^{K̄/k}` = 0. For every D ≥ 1 the orders of the points of {P ∈ A(K̄)_tors : [K(P) : K] ≤ D} are bounded in terms of A and D. (gh-2019, Proposition B.1 and proof, p. 58; the case dim S = 1 is the claim (3.2), p. 14 (arXiv v3)).

Throughout this subsection, S smooth irreducible quasi-projective over algebraically closed k of characteristic zero; A is defined over K=k(S) and has trivial geometric K̄/k-trace.

One proof route is the following. Spread A to an abelian scheme over a dense open S° ⊆ S; the closure of a torsion point of order N is a component of 𝒜[N], finite étale over S°. Connected finite étale covers of S° of degree ≤ D are finitely many up to isomorphism (InverseGaloisAndArithmeticFundamentalGroups §IG.3.1, “Finitely many covers of bounded degree”, with locator gh-2019 Lemma B.2, p. 58), so the compositum of their function fields is a finite extension K_D of K. For S° = 𝔾_m the classes of degree ≤ D are z ↦ zⁿ, 1 ≤ n ≤ D, and K_D = k(z^(1/lcm(1,…,D))). All such torsion points lie in A(K_D)_tors, which is finite by Lang–Néron since the trace is zero (HeightsRationalPointsAndObstructions §1.10). The geometric trace hypothesis ensures the trace remains zero over the finite extension K_D.

**Checks.**

- For a constant abelian variety (non-zero trace) the statement fails: all torsion of A₀(k) is K-rational.
- D = 1 gives finiteness of A(K)_tors for trace-free A.
- An isotrivial twist with zero ordinary K/k-trace can acquire all constant torsion over a fixed finite extension, giving bounded-degree torsion of unbounded order. The geometric trace hypothesis excludes it.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 8.2 Special points of V₀(k) × A_tors (GH Propositions 3.1 and B.3)

Let k be algebraically closed of characteristic 0, S a smooth irreducible quasi-projective variety over k, K = k(S)‾, A an abelian variety over K with `A^{K/k}` = 0, V₀ an irreducible variety over k, V = V₀ ⊗_k K and Σ = V₀(k) × A_tors. (i) If Y ⊆ V × A is irreducible closed with Y(K) ∩ Σ Zariski dense in Y, then Y = (W₀ ⊗_k K) × (P + B) with W₀ ⊆ V₀ irreducible closed, P ∈ A_tors and B an abelian subvariety. (ii) A given Y contains only finitely many maximal subvarieties of this form. (gh-2019, Proposition 3.1 and proof, pp. 12–15 (curve base); Proposition B.3, p. 59 (any base) (arXiv v3)).

Throughout this subsection, k algebraically closed, char 0; A over k(S)‾ of trivial trace; V₀ irreducible over k.

One proof route is the following. Choose a finitely generated function field of definition F/k and a smooth model over which the geometric abelian variety, Y, and the finite set of subgroup types are defined. Apply the bounded-degree torsion theorem to that field F and its finite extensions; degrees over the already algebraically closed K̄ would carry no information. View Y as a family over V₀: for v ∈ V₀(k) the fibre Y_v ⊆ A meets A_tors densely only along torsion cosets; uniform Manin–Mumford in families (HeightsRationalPointsAndObstructions §5.8) gives finitely many directions B and a uniform bound on the number of cosets. The torsion points involved have bounded degree over K by a Galois-orbit count (k-points of V₀ are Galois-fixed), hence bounded order by the bounded-order proposition; apply [N] ∘ (A → A/B) to reduce to B = 0 and a finite set of torsion points. Fibre dimension then forces Y = (W₀ ⊗ K) × (P + B); finiteness of maximal ones follows from the finiteness of directions and of torsion orders. The argument uses degrees over the finitely generated field of definition, not over its algebraic closure.

**Checks.**

- For V₀ a point, (i) is Manin–Mumford over K for trace-free A.
- Trivial trace is necessary: for constant A = A₀ ⊗ K, the diagonal of A₀ × A₀ meets V₀(k) × A_tors (V₀ = A₀) in a dense set without being a product.

*Needs:* §8.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 8.3 Height inequality over a curve (Gao–Habegger Theorem 1.4)

Let π : 𝒜 → S be an abelian scheme over a smooth irreducible curve S over ℚ̄, L a symmetric relatively ample line bundle and M ample on a compactification S̄. For every closed irreducible X ⊆ 𝒜 there is c > 0 with `h_{S̄,M}(π(P))` ≤ c(1 + `ĥ_{𝒜,L}(P)`) for all P ∈ X*(ℚ̄). With L′ = L ⊗ π^*M and a closed immersion ι : 𝒜 → ℙ^m × S over S arising from `(L′)^{⊗n}` (after removing finitely many points of S if needed), write ι(P) = (P′, π(P)) and define the naive height `h_ι(P)` = n⁻¹h(P′) + `h_{S̄,M}(π(P))`, with h the absolute logarithmic Weil height on ℙ^m and `h_{S̄,M}` ≥ 0. Then `h_{S̄,M}(π(P))` ≤ `h_ι(P)` ≤ c(1 + `ĥ_{𝒜,L}(P)`) on X*(ℚ̄) (Theorem 1.4′). The naive height is a function attached to ι; it is not the Weil height of L′ (Checks). (gh-2019, Theorem 1.4 and (1.1), p. 4; naive height and Theorem 1.4′, pp. 4–5; proof §10.2, p. 52 (arXiv v3); dgh-2021, Theorem B.1, p. 40 (arXiv v3)).

Throughout this subsection, S smooth irreducible curve over ℚ̄; L symmetric relatively ample; M ample on S̄; X ⊆ 𝒜 closed irreducible.

One proof route is the following. If X is generically special, X* = ∅. Otherwise X is non-degenerate: over a curve, degenerate implies generically special (Gao–Habegger Theorem 5.1, AbelianSchemesAndArithmeticModuliPartII B2). The height inequality for non-degenerate subvarieties gives a dense open U ⊆ X with ĥ(P) ≥ `c₁h_{S̄,M}(π(P))` − c₂ on U, i.e. h(π(P)) ≤ c(1 + ĥ(P)). Induct on dim X: the components Z_i of X ∖ U satisfy X* ⊆ U ∪ ⋃ Z_i* (GH (10.4)), and the induction hypothesis applies to each Z_i. Theorem 1.4′: the lower bound `h_{S̄,M}(π(P))` ≤ `h_ι(P)` is the definition of the naive height together with h(P′) ≥ 0 and needs no (1.1); for the upper bound, Silverman–Tate bounds n⁻¹h(P′) by ĥ(P) + c(1 + `h_{S̄,M}(π(P))`) on all of 𝒜(ℚ̄) (GH (10.2)), and (1.1) bounds the base height on X* by c(1 + ĥ(P)). No identity between `h_ι` and a Weil height of L′ is used. Gao–Habegger’s own proof of the inequality on a dense open (their §§6–10: auxiliary subvarieties, lattice points in Betti coordinates, many isolated division points, Habegger’s degree lemmas) is an alternative route, not used here. If X is vertical over S, π(X) is one point, its base height is bounded, and the inequality follows from ĥ ≥ 0 after enlarging c. The generic-fibre argument is only needed for X dominating S.

**Checks.**

- The inequality fails on torsion multisections: ĥ = 0 while h(π(P)) is unbounded, so X* cannot be enlarged to X.
- For X = 𝒜 (generically special) the statement is empty.
- The naive height is not the Weil height of L′: for the constant family 𝒜 = E × ℙ¹ → S = S̄ = ℙ¹ with L = pr₁^*O_E(3·0), M = O(1) and ι the Segre embedding ℙ² × ℙ¹ → ℙ⁵ in the first coordinate (n = 1, ι^*O(1) = L′), the point (0, [T:1]) with T a positive integer has h(P′) = h(0) + h([T:1]) = log T, hence `h_ι` = 2 log T, whereas the Weil height of L′ = O_E(3·0) ⊠ O(1) at that point is log T + O(1). The naive height counts the base height twice; only the two displayed inequalities hold, not an identity.

*Needs:* §2.8; AbelianSchemesAndArithmeticModuliPartII §§B2.13, B2.21–B2.23; AbelianSchemesAndArithmeticModuliPartII B0–B4; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 8.4 Geometric Bogomolov over function fields of curves over ℚ̄ (Gao–Habegger Theorem 1.1)

Let K be the function field of a smooth projective curve S over ℚ̄, A an abelian variety over K with symmetric ample L, and X ⊆ A irreducible closed with X ⊗_K K̄ irreducible and not special (not of the form B + (Z ⊗_ℚ̄ K̄) with Z ⊆ `A^{K̄/ℚ̄}` closed irreducible and B a torsion coset of A ⊗_K K̄). Then there is ε > 0 such that {x ∈ X(K̄) : `ĥ_{K,A,L}(x)` ≤ ε} is not Zariski dense in X. (gh-2019, Theorem 1.1, p. 2; proof §11, pp. 52–54 (arXiv v3)).

Throughout this subsection, K = ℚ̄(S), S smooth projective curve; X ⊗ K̄ irreducible and not special.

One proof route is the following. Spread A, L to π : 𝒜 → S° over a dense open and let 𝒳 be the closure of X; X ⊗ K̄ not special means 𝒳 is not generically special, so 𝒳* is open dense. For x ∈ X(K̄) with σ_x(S′) meeting 𝒳*, the height inequality gives h_S(ρ(t)) ≤ c(1 + ĥ(σ_x(t))) for t ∈ S′ with σ_x(t) ∈ 𝒳*. Silverman’s height limit (HeightsRationalPointsAndObstructions §0.29): ĥ(σ_x(t))/h_S(ρ(t)) → `ĥ_{K,A}(x)` as h_S(ρ(t)) → ∞; hence `ĥ_{K,A}(x)` ≥ 1/c, i.e. ≥ deg(S)/c in GH’s normalization. Small points therefore lie in the closed complement of 𝒳* restricted to the generic fibre, a proper closed subset of X.

**Checks.**

- A special X has dense small points (special-has-small-points), so the hypothesis is necessary.
- Agrees with Xie–Yuan Theorem 1.1 for characteristic 0 and transcendence degree 1.

*Needs:* §8.3; AbelianSchemesAndArithmeticModuliPartII §§B2.13, B2.21–B2.23; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §7.4; §7.3.

### 8.5 The height inequality with Moriwaki heights (GH Theorem A.3)

Let k₀ be finitely generated over ℚ with a polarization B, 𝒜 → S an abelian scheme over a smooth irreducible quasi-projective curve over k₀, L symmetric relatively ample and M ample on S̄ (both over k₀), and X ⊆ 𝒜 closed irreducible over k₀ with X* as in the generically special locus for k = k̄₀. There is c > 0 depending on B, 𝒜/S, X, L, M with `h^B_{S̄,M}(π(P))` ≤ c(1 + `ĥ^B_{𝒜,L}(P)`) for all P ∈ X*(k̄₀). (gh-2019, Theorem A.3 and sketch, p. 56 (arXiv v3)).

Throughout this subsection, k₀ finitely generated over ℚ with polarization B; S smooth irreducible curve over k₀.

One proof route is the following. Reduce to k₀ ⊆ ℂ by a field isomorphism (Moriwaki heights transport, ArakelovGeometryAndAbelianHeightsPartII §§6.1–6.4). Rerun the proof of the height inequality: the Betti-form and intersection arguments are geometric over ℂ; only the height machine, Néron–Tate heights and Silverman–Tate are replaced by their Moriwaki versions: the height machine without Northcott (ArakelovGeometryAndAbelianHeightsPartII §§6.1–6.3, valid for every polarization) and the Silverman–Tate comparison for the given, possibly non-big, polarization B (ArakelovGeometryAndAbelianHeightsPartII §6.4(1), stated for every nef polarization). Bigness of B is not used here; it enters only through the specialization limit in §8.6. The left-hand side is the base height `h^B_{S̄,M}(π(P))`.

**Checks.**

- For k₀ a number field, Moriwaki heights are Weil heights and the statement is the height inequality over a curve.
- For k₀ = ℚ(t) with B given by the trivially metrized trivial bundle on ℙ¹_ℤ (nef, volume 0, not big), every Moriwaki height vanishes, so the statement reads 0 ≤ c and holds; this polarization is covered by ArakelovGeometryAndAbelianHeightsPartII §6.4(1), stated for every nef polarization, and excluded from §6.4(2), whose Silverman limit keeps bigness.

*Needs:* §8.3; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 8.6 Geometric Bogomolov over function fields of curves in characteristic zero

Gao–Habegger’s Theorem 1.1 holds with ℚ̄ replaced by any algebraically closed field k of characteristic 0: for K the function field of a smooth projective curve over k, A/K abelian with symmetric ample L and X ⊆ A irreducible with X ⊗ K̄ irreducible and not special, the points of X(K̄) of small canonical height are not Zariski dense. (gh-2019, Appendix A, §A.3, pp. 56–57 (arXiv v3)).

Throughout this subsection, k algebraically closed of characteristic 0; S smooth projective curve over k.

One proof route is the following. Descend S, A, L, X to a finitely generated k₀ ⊆ k; with Moriwaki heights the height inequality and Silverman’s limit (ArakelovGeometryAndAbelianHeightsPartII §§6.1–6.4) give, as over ℚ̄, that X has no dense small points over k̄₀(S), i.e. `e₁(X_{k̄₀})` > 0. Choose a big Moriwaki polarization on k₀ so that the ample base height has the unboundedness needed in the specialization-limit argument; arbitrary degenerate polarizations need not supply it. By the Zhang–Gubler inequalities, e₁ > 0 iff ĥ(X) > 0; the canonical height of a subvariety is unchanged by extending the algebraically closed constant field from k̄₀ to k (HeightsRationalPointsAndObstructions §0.33). Hence ĥ(X_k) > 0 and e₁(X_k) ≥ ĥ(X_k) > 0. The two inputs are supplied by the cited height and extension contracts.

**Checks.**

- Contained in Xie–Yuan Theorem 1.1, which also covers positive characteristic and higher transcendence degree.
- The constant field extension does not create new special structure: the trace does not grow under algebraically closed constant extension in characteristic 0.

*Needs:* §8.4; §8.5; §7.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### Examples

For a geometrically trace-free curve-field variety, D=1 bounds rational torsion. A constant elliptic curve has rational torsion of every order over algebraically closed constants and violates that assertion. A non-torsion section outside the generically special locus is non-degenerate; a vertical integral curve has constant base height and satisfies the base-height bound after enlarging c.

### Dependencies

Layers 2,7; AbelianSchemesAndArithmeticModuliPartII §§B2.3,B2.13,B2.21–B2.23; ArakelovGeometryAndAbelianHeightsPartII §§6.1–6.4; InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; HeightsRationalPointsAndObstructions §§0.29,1.10,5.8. The curve-base geometric theorem does not use Layer 9.

## Layer 9: The geometric Bogomolov conjecture in all characteristics

### 9.1 Abelian varieties defined over a subfield up to isogeny

Let K be a field, k ⊆ K a subfield and A an abelian variety over K. A is defined over k up to isogeny if there is an abelian variety A′ over k with A isogenous to A′ ⊗_k K. (xy-2022, §3.1, p. 13 (arXiv v1)).

Throughout this subsection, k ⊆ K fields; A/K abelian.

One proof route is the following. A predicate on intermediate fields, using isogenies of abelian varieties over K (AbelianSchemesAndArithmeticModuli A6).

The defining object has the following API.

- The predicate for A/K and k ⊆ K.
- If k ⊆ k′ ⊆ K and A is defined over k up to isogeny, then over k′.
- The predicate depends only on the isogeny class of A.
- For a regular extension K/k (in particular for algebraically closed k), A is defined over k up to isogeny iff the K/k-trace map is an isogeny. No trace existence or base-change claim is made for arbitrary inseparable extensions.

**Checks.**

- Every A is defined over K up to isogeny.
- A₀ ⊗_k K is defined over k.
- The zero abelian variety is defined over every subfield up to isogeny.
- The Legendre elliptic curve y² = x(x − 1)(x − t) over k(t) (k algebraically closed of characteristic different from two) has non-constant j-invariant and is not defined over k up to isogeny; its K̄/k̄-trace is zero as well, since a curve isogenous to a constant curve over a finite extension of k(t) has good reduction at every place there and a constant j-invariant.
- Descent up to isogeny over K is finer than geometric isotriviality: for k algebraically closed of characteristic different from two, K = k(t) and E₀ an elliptic curve over k, let E be the quadratic twist of E₀ ⊗_k K by t, so that E ⊗_K k(√t) ≅ E₀ ⊗_k k(√t) and the K̄/k̄-trace of E has dimension one. Every homomorphism B ⊗_k K → E from a constant abelian variety is zero: over k(√t) it becomes a homomorphism between constant abelian varieties, hence is defined over k and fixed by the nontrivial automorphism σ of k(√t)/K, whereas the twisting datum makes σ act on it by −1. So the K/k-trace of E is zero and E is not defined over k up to isogeny, although E ⊗_K k(√t) is.

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli A1–A3, A6; Mathlib `IntermediateField`.

### 9.2 Isogeny descends to an algebraically closed base (XY Lemma 3.3)

Let A₁, A₂ be abelian varieties over an algebraically closed field k and K/k any field extension. If A₁ ⊗_k K is isogenous to A₂ ⊗_k K, then A₁ is isogenous to A₂. (xy-2022, Lemma 3.3 and proof, p. 13 (arXiv v1)).

Throughout this subsection, k algebraically closed.

One proof route is the following. The isogeny is defined over a finitely generated k-algebra R ⊆ K; it extends to a homomorphism of constant abelian schemes over a dense open of Spec R with finite kernel (relative Hom, AbelianSchemesAndArithmeticModuli A6). Specialize at a k-point (k algebraically closed): the specialization is a homomorphism A₁ → A₂ with finite kernel and equal dimensions, hence an isogeny.

**Checks.**

- For k not algebraically closed the lemma can fail without a rational specialization point; for k algebraically closed every non-empty finite-type k-scheme has a k-point.
- For constant A₁ and A₂ over algebraically closed k the same spreading argument also descends an isomorphism and its inverse. For a nonconstant twist over a nonclosed k this is not a claim about k-isomorphisms.

*Needs:* §9.1; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 9.3 Fields of definition of subvarieties (XY Lemma 3.4)

Let k₁, k₂ be intermediate fields of K/k with k₁ ∩ k₂ = k, Y a variety over k and X ⊆ Y_K a closed subvariety defined over k₁ and over k₂. Then X is defined over k. The linear-algebra core: a K-subspace of V₀ ⊗_k K that descends to k₁ and to k₂ descends to k. (xy-2022, Lemma 3.4 and proof, pp. 14–15 (arXiv v1)).

Throughout this subsection, k₁, k₂ intermediate fields of K/k with k₁ ∩ k₂ = k.

One proof route is the following. Linear core: a finite-dimensional K-subspace W ⊆ V₀ ⊗ K has a unique reduced row echelon basis with respect to a fixed k-basis of V₀; if W descends to k₁ its RREF has entries in k₁, likewise in k₂, so the entries lie in k₁ ∩ k₂ = k. Apply to the homogeneous ideal of X in each degree after embedding Y in projective space (or on an affine cover), passing to the limit over finite-dimensional pieces. Existence and uniqueness of reduced row echelon forms over an arbitrary field are ClassicalArithmeticCompletion §3.19: a reduced row echelon basis matrix of a k₁-form of W is still reduced over K and row-equivalent over K to every other basis matrix of W, so it is the reduced form of W. This section owns only the application to descent through intersecting fields.

**Checks.**

- For k₁ = k₂ = K the hypothesis k₁ ∩ k₂ = k forces K = k.
- A line {y = ax} in the plane over K with a ∈ k₁ ∩ k₂ descends; with a ∉ k it is not defined over both.
- Over K = ℚ(a) with a transcendental, the line spanned by (2, 2a) has reduced row (1, a), not (2, 2a); its entries lie in a subfield exactly when a does, so the line is defined over k₁ and over k₂ only when a ∈ k₁ ∩ k₂. The zero and the full subspace have reduced forms 0 and the identity, defined over k.

*Needs:* ClassicalArithmeticCompletion §3.19; Mathlib `Matrix.IsReducedRowEchelon`; Mathlib `IntermediateField`; Mathlib `Submodule.span`.

### 9.4 Isogeny classes defined over two subfields (XY Proposition 3.2)

Let k be algebraically closed, K/k an extension of finite transcendence degree, and k₁, k₂ algebraically closed intermediate fields with k₁ ∩ k₂ = k. If A₁/k₁ and A₂/k₂ are abelian varieties with A₁ `⊗_{k₁}` K isogenous to A₂ `⊗_{k₂}` K, then there is an abelian variety A over k, unique up to isogeny, with A₁ isogenous to A ⊗_k k₁ and A₂ isogenous to A ⊗_k k₂. (xy-2022, Proposition 3.2 and proof, pp. 13–14 (arXiv v1)).

Throughout this subsection, k algebraically closed; trdeg(K/k) < ∞; k₁, k₂ algebraically closed, k₁ ∩ k₂ = k.

One proof route is the following. Reduce to K = acl(k₁k₂) by the descent lemma. Independent case (transcendence defect δ = trdeg k₁ + trdeg k₂ − trdeg k₁k₂ = 0): view A₁ as a family over a k-variety with function field k₁ and A₂ over one with function field k₂; their isogeny over the product forces both families to be isotrivial up to isogeny over k. For dependent fields, choose finite tuples c,b with k₁=acl(k(c)), k₂=acl(k(b)); let d_i=trdeg(k_i/k), e=trdeg(k₁k₂/k), δ=d₁+d₂−e>0. In an algebraically closed overfield choose a k₁-copy τK independent of K over k₁. The transported isogeny makes A₂ isogenous to τA₂, and k₂∩τk₂=k. Put a=trdeg(c/k(b,τb)). Independence gives trdeg(b,τb,c/k)=2e−d₁, hence the new defect is δ′=2δ−d₁+a. Since a≤d₁−δ, δ′≤δ. Equality would identify the loci of c over k₂ and τk₂ after their compositum extension; subvariety-field-descent then defines that locus over k, contradicting its dimension d₁−δ<d₁. Thus δ′<δ. Apply induction and then the isogeny descent lemma. This defect induction applies in arbitrary characteristic and includes dependent intermediate fields.

**Checks.**

- If k₁ = k the statement is the descent lemma.
- The hypothesis k₁ ∩ k₂ = k cannot be dropped: for k₁ = k₂ ⊋ k, any non-constant A₁ over k₁ is a counterexample.

*Needs:* §9.3; §9.2; §9.1; Mathlib `Algebra.trdeg`; Mathlib `IntermediateField`.

### 9.5 Minimal fields of definition (XY Corollary 3.5)

(i) Let K/k be an extension of algebraically closed fields and A an abelian variety over K. There is an algebraically closed intermediate field k_A of finite transcendence degree over k such that, for every algebraically closed intermediate k′, A is defined over k′ up to isogeny iff k_A ⊆ k′. (ii) For a variety Y over k and a closed subvariety X ⊆ Y_K there is an algebraically closed intermediate field `k_{X⊆Y_K}` of finite transcendence degree over k such that, for every algebraically closed intermediate k′, X is defined over k′ iff `k_{X⊆Y_K}` ⊆ k′. (xy-2022, Corollary 3.5 and proof, p. 15 (arXiv v1)).

Throughout this subsection, K/k algebraically closed fields.

One proof route is the following. Choose k_A algebraically closed of minimal transcendence degree with A defined over it up to isogeny (A is defined over the algebraic closure of a finitely generated field). For k′ with A defined over k′, apply the two-subfield proposition to k′ and k_A over k′ ∩ k_A (algebraically closed) to see A is defined over k′ ∩ k_A, so minimality forces k_A ⊆ k′; use the defect induction for dependent fields. (ii) is identical with the subvariety descent lemma in place of the two-subfield proposition. If the ambient algebraically closed K has infinite transcendence degree, choose finite tuples of coefficients defining each variety and isogeny under comparison. The algebraic closure of their compositum has finite transcendence degree, so the preceding intersection theorem applies there before extending back to K.

**Checks.**

- For A constant, k_A = k.
- For the Legendre curve over the algebraic closure of k(t), k_A is the algebraic closure of k(j) = the algebraic closure of k(t).
- Part (ii) on lines: for Y = 𝔸²_k and K the algebraic closure of k(t, u) with t, u algebraically independent over k, the line y = tx has `k_{X⊆Y_K}` = the algebraic closure of k(t) in K, since the algebraically closed intermediate fields contained in that closure are k and itself and the reduced generator y − tx has the coefficient t ∉ k; the line y = ux has the algebraic closure of k(u). These two fields intersect in k and neither line is defined over k: minimal fields of different subvarieties are not intersected. The coordinate line y = 0 has minimal field k.

*Needs:* §9.3; §9.4; §9.1.

### 9.6 The field over which X becomes special (XY Proposition 3.6)

Let K/k be a field extension with k algebraically closed in K, I(K/k) the set of intermediate fields algebraically closed in K, A an abelian variety over K and X ⊆ `A_{K̄}` a closed subvariety. There is `k_{A,X}` ∈ I(K/k) such that for every k′ ∈ I(K/k), X is special for A/K/k′ iff `k_{A,X}` ⊆ k′. (xy-2022, Proposition 3.6 and proof, pp. 15–16 (arXiv v1)).

Throughout this subsection, k algebraically closed in K; A/K abelian; X ⊆ `A_{K̄}` closed.

One proof route is the following. Over K̄/k̄ (the general case is reduced to it below): if X is special for k′, then X = `tr(Y_{K̄})` + (a + C) with Y ⊆ `A^{K/k′}`, so X ⊆ `tr(A^{K/k′})` + a + C. Quotient by the reduced identity component of the stabilizer: X is special for k′ iff its image in the quotient is, so Stab(X) may be assumed finite. Then let T_X be the smallest torsion coset containing X (the component through X of the intersection of two torsion cosets containing X is again a torsion coset, so it exists), choose a torsion point a ∈ T_X and replace (A, X) by (T_X − a, X − a): an abelian subvariety with a subvariety whose smallest containing torsion coset is the whole ambient variety. Specialness for every k′ is preserved by both replacements: in an expression X = `tr(Y_{K̄})` + (a′ + C′) the abelian part C′ lies in the finite stabilizer, so C′ = 0, and `tr(Y_{K̄})` lies in a torsion translate of T_X − a, where after moving a torsion point it is the image of a k′-subvariety under the trace of T_X − a. Only for the reduced pair does specialness force descent of the ambient variety: if `tr(A^{K/k})` ≠ A and X is special for k′, then X − a′ ⊆ `tr(A^{K/k′})`, an abelian subvariety one of whose torsion translates contains X, hence contains T_X = A; so `tr(A^{K/k′})` = A and k_A ⊆ k′. Only this implication "special for k′ ⇒ k_A ⊆ k′" holds in that case; for k′ ⊇ k_A run the second case over k_A through an isogeny A → A₀ `⊗_{k_A}` K by the minimal-field comparison: with finite stabilizer the torsion part of a special expression is a single torsion point, defined over the algebraically closed k′, so X is special for k′ iff the image of X in A₀ ⊗ K̄ is defined over k′, and `k_{A,X}` is the minimal field of definition of that image. When `tr(A^{K/k})` = A the second case applies at once with k_A = k. Define `k_{A,X}` over K̄/k̄ in this way from the minimal fields of A and of the constant part of X (minimal fields). In the algebraically closed case let F be the minimal specialness field obtained in the first two steps. For general K, let F″ be the algebraic closure inside K̄ of the compositum of every σF, σ∈Aut(K̄/K), and set `k_{A,X}=F″∩K`. This is an arbitrary compositum, with no assumed finite orbit. For x∈F″, all roots of its minimal polynomial over K, including inseparable multiplicities, lie in F″; the coefficients therefore lie in F″∩K. Hence F″ is algebraic over that intersection. For relatively algebraically closed k′⊆K its algebraic closure in K̄ is conjugation-stable, and F⊆k̄′ iff F″⊆k̄′ iff `k_{A,X}⊆k′`. This proves the claimed equivalence.

**Checks.**

- If X is a torsion subvariety, `k_{A,X}` = k.
- The reduction to T_X is necessary: for X = {0} in a non-constant elliptic curve A over K = the algebraic closure of k(t), Stab(X) is trivial and T_X = {0}, so the reduced pair is the zero abelian variety with its single point and `k_{A,X}` = k, although k_A = K. Without the reduction X is special for k while k_A ⊄ k, so the implication "special for k′ ⇒ k_A ⊆ k′" would fail at k′ = k.
- For A constant and X = C₀ ⊗ K̄ for a curve C₀ over k, `k_{A,X}` = k. A translation need not move the field: for A = E² constant, K = k(E), η ∈ E(K) the generic point and C₀ = E×{0}, translation by (η, 0) lies in the stabilizer and leaves X and `k_{A,X}` = k unchanged, whereas translation by (0, η) gives E×{η}, which is special for k′ only if η ∈ E(k′) up to torsion, so its field is `k_{A,X}` = K.

*Needs:* §9.5; §7.4; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 9.7 Generic pencil members as polarizations over a subfield (XY Lemma 3.7(1)–(2))

Let k be algebraically closed, K/k finitely generated with trdeg(K/k) > 1 and (S, M) a polarization with M very ample. There are infinitely many intermediate fields k′ of K/k, algebraically closed in K with trdeg(k′/k) = 1, each with a geometrically integral divisor H ⊆ `S_{k′}` linearly equivalent to `M_{k′}` such that H → `S_{k′}` → S is an isomorphism on generic points; after extending k′ to its algebraic closure k̄′ in K̄ and normalizing ν : H̃ → `H_{k̄′}`, the pair (H̃, `ν^*(M_{k̄′}|_{H_{k̄′}})`) is a polarization of Kk̄′/k̄′. Two such fields k₁ ≠ k₂ can be chosen with k₁ ∩ k₂ = k. (xy-2022, Lemma 3.7 and proof, pp. 16–18 (arXiv v1)).

Throughout this subsection, k algebraically closed; trdeg(K/k) ≥ 2; M very ample on S.

One proof route is the following. For s₀, s₁ ∈ Γ(S, M) with s₁/s₀ non-constant, the blow-up of the base locus fibres S over ℙ¹; k′ = k(s₁/s₀) after algebraic closure in K, and H is the generic member, geometrically integral by Bertini. Two distinct fields: fix s₀ with geometrically integral divisor and choose s₁, s₂ with s₁/s₀, s₂/s₀ algebraically independent (a general projection of S to ℙ² is dominant); the pencils give k₁ ≠ k₂ with k₁ ∩ k₂ = k. Normalize the geometric generic member and pull M back; ampleness is preserved by finite pullback.

**Checks.**

- For trdeg(K/k) = 2 and S = ℙ², the pencils of lines through a point give k′ = k(y/x) and H the generic line.
- Without normalization the member `H_{k̄′}` may be non-normal and is not a polarization in the sense of §7.3 and the Conventions.

*Needs:* §7.3; SchemeAndStackFoundations §§0.3, 4.11, 4.13.

### 9.8 Heights decrease on generic pencil members (XY Lemma 3.7, height inequality)

For (k′, H) as in the pencil lemma, every abelian variety A over K with symmetric ample L and every subvariety X ⊆ `A_{K̄}`: ĥ^M_L(X) ≥ `ĥ^{M_{k′}|_H}_L(X)`, the left side computed for K/k with (S, M) and the right side for Kk̄′/k̄′ with the normalized pencil member. (xy-2022, Lemma 3.7, height inequality, p. 17; proof p. 18 (arXiv v1)).

Throughout this subsection, (k′, H) from the pencil lemma; A/K abelian; X ⊆ `A_{K̄}`.

One proof route is the following. First prove the naïve height inequality on an integral projective model with ample ℒ extending a positive power of L. After base change to k′, replace one π^*M factor by π⁻¹(H); the resulting cycle contains 𝒳*_H plus an effective cycle. Cut the latter by general members of the base-point-free system |π^*M| for its remaining dim S−2 factors (SchemeAndStackFoundations §§4.13, 5.3). The remaining intersection with ample ℒ is nonnegative by AbelianSchemesAndArithmeticModuli A2.7; an empty residual cycle contributes zero (xy-2022, proof of Lemma 3.7, p. 18). Apply this inequality to the multiplication images [n]X for n≥1, divide by the positive height-scaling factors, and pass to the canonical limit (HeightsRationalPointsAndObstructions §0.31). The surviving term is the height over the normalized pencil member.

**Checks.**

- The inequality can be strict even when a point descends to k′: for a constant elliptic curve E/k, the generic point over k(E) has positive O(0)-height over k, but height 0 when k(E) is made part of the constants. Thus descent to k′ alone does not imply equality.
- On ℙ¹×ℙ¹ let F be a fibre of the first projection and H=O(1,1). Then (pr₁^*O(1)·F)=0 but (H·F)=1. The pulled-back base bundle is not ample; cutting by its generated system gives a nonnegative residual term, including zero.
- Only the inequality is used: small points for K/k remain small for Kk̄′/k̄′.

*Needs:* §9.7; §7.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; SchemeAndStackFoundations §§4.11, 4.13, 5.1–5.4; AbelianSchemesAndArithmeticModuli A2.7.

### 9.9 Lowering the transcendence degree (XY Proposition 3.1)

Let k be algebraically closed, K/k finitely generated with trdeg(K/k) ≥ 2 and A an abelian variety over K. There are intermediate fields k₁, k₂ of K/k, algebraically closed in K with trdeg(k_i/k) = 1, such that for every closed subvariety X ⊆ `A_{K̄}`, the geometric Bogomolov statement holds for (A/K/k, X) if it holds for (`A_{Kk̄₁}`/Kk̄₁/k̄₁, X) and (`A_{Kk̄₂}`/Kk̄₂/k̄₂, X). (xy-2022, Proposition 3.1, p. 12; proof pp. 18–19 (arXiv v1)).

Throughout this subsection, k algebraically closed; trdeg(K/k) ≥ 2.

One proof route is the following. Take k₁ ≠ k₂ from two pencils with k₁ ∩ k₂ = k. If X has dense small points for A/K/k, then by the pencil height inequality it has dense small points over Kk̄_i/k̄_i; by hypothesis X is special for A/K/k_i, i = 1, 2. By the special-field proposition `k_{A,X}` ⊆ k₁ ∩ k₂ = k, so X is special for A/K/k. The two independent pencil fields supply the required intersection.

**Checks.**

- Induction on the transcendence degree reduces the geometric Bogomolov conjecture to trdeg(K/k) = 1.
- The two fields must meet in k; one pencil is not enough.

*Needs:* §9.7; §9.8; §9.6; §7.3; §7.4.

### 9.10 Multi-sections and torsion multi-sections

Let π : 𝒜 → S be an abelian scheme over a smooth projective curve S over a field k (more generally a smooth curve). A multi-section of π is a closed integral subscheme 𝒯 ⊆ 𝒜 finite and flat over S. It is torsion of order m if the tautological point of 𝒜_𝒯(𝒯) it defines is torsion of exact order m. A torsion multi-section is the Zariski closure of a torsion point of the generic fibre A(K̄), and one of order m lies in 𝒜[m]. (xy-2022, §4.1, p. 19 (arXiv v1)).

Throughout this subsection, π : 𝒜 → S abelian scheme over a smooth projective curve S over a field.

One proof route is the following. The closure of a torsion point of order m lies in the closed subgroup scheme 𝒜[m], which is finite over S; an integral closed subscheme finite and dominant over a smooth curve is flat. Over higher-dimensional normal bases flatness can fail, which is why the definition is made over curves.

The defining object has the following API.

- A closed integral 𝒯 ⊆ 𝒜 finite flat over S.
- deg(𝒯/S), the degree of the finite flat map.
- The predicate torsion of order m.
- Torsion multi-sections are exactly the closures of torsion points of A(K̄).
- A torsion multi-section of order m lies in 𝒜[m].

**Checks.**

- The zero section is a torsion multi-section of order 1 and degree 1.
- For the Legendre family in characteristic different from 2 over ℙ¹ ∖ {0, 1, ∞}, the closure of the 2-torsion point (0, 0) is a torsion multi-section of order 2 and degree 1.
- The closure of a non-torsion section is a multi-section that is not torsion.

*Needs:* AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 9.11 Numerical class of a torsion multi-section (XY Proposition 4.2)

Let S be a smooth projective curve over a field k, π : 𝒜 → S an abelian scheme of relative dimension g ≥ 1, ℒ a symmetric rigidified line bundle on 𝒜 and 𝒯 a torsion multi-section. Then [ℒ]^g ≡ (deg(ℒ_η)/deg(𝒯/S))·[𝒯] numerically as 1-cycles on 𝒜, where deg(ℒ_η) is the degree of ℒ on the generic fibre. (xy-2022, Proposition 4.2 and proof, pp. 20–21 (arXiv v1)).

Throughout this subsection, S smooth projective curve over k; π abelian scheme of relative dimension g ≥ 1; ℒ symmetric rigidified.

One proof route is the following. Numerical classes of line bundles on 𝒜 are generated by rigidified ones and pullbacks π^*N (rigidification along the zero section). For rigidified ℳ, split 2ℳ into symmetric and antisymmetric parts so that [m]^*ℳ ≅ m^iℳ, i = 2 or 1; [m]^*[ℒ]^g pushes forward with factor `m^{2g}` while ℳ · [ℒ]^g scales by `m^{2g+i}`, forcing ℳ · [ℒ]^g = 0; likewise ℳ · [𝒯] = 0 since a torsion multi-section restricts ℳ to a torsion bundle (A1). For ℳ = π^*N compare degrees: π^*N · [ℒ]^g = deg N · deg ℒ_η and π^*N · [𝒯] = deg N · deg(𝒯/S).

**Checks.**

- For an elliptic scheme over a smooth projective curve, take the rigidified normalization of O(2·0), twisting by a base bundle if necessary. Its numerical class is 2[0], consistent with generic degree 2 and degree-one zero section.
- Any two torsion multi-sections of degree 1 are numerically equivalent.
- Grushevsky–Zakharov prove the rational-equivalence version over higher-dimensional bases; only the numerical version over a curve is needed.

*Needs:* §9.10; AbelianSchemesAndArithmeticModuli A1–A3, A6; SchemeAndStackFoundations §§5.1–5.4, 5.6.

### 9.12 Yamaki’s reduction to the nowhere degenerate trace-free part

Let k be algebraically closed, B normal projective of positive dimension, K=k(B), and A an abelian variety over K̄. Let 𝔪⊆A be its maximal nowhere-degenerate abelian subvariety, meaning potential good reduction at every geometric divisorial valuation in Yamaki’s setting, and let t be the image of the geometric K̄/k-trace. Then geometric Bogomolov holds for A iff it holds for 𝔪 iff it holds for 𝔪/t. These are geometric objects; they may require a finite extension of a chosen field of definition. In transcendence degree one the nowhere-degenerate quotient acquires an abelian-scheme model after a finite extension. (xy-2022, §5, condition (d), p. 22 (arXiv v1), citing Yamaki, J. reine angew. Math. 2018, Theorem 1.5; yamaki-2018, Theorem 1.5 (= Theorem 5.5), p. 5; setting §1.2, p. 5 (arXiv 1405.0896v5)).

Throughout this subsection, k algebraically closed; K = k(B) for a normal projective B of dimension ≥ 1.

One proof route is the following. Construct the maximal nowhere-degenerate part using TropicalAndBerkovichArithmetic §§6.2–6.4, 7.0 with the abelian valuation map contract and the abelian canonical measure contract; semistable torus ranks detect the good-reduction directions. Yamaki’s Theorem E (Corollary 7.22) gives the reduction from A to that part (yamaki-strict-support, Theorem E, p. 3, and Corollary 7.22, p. 41). Prove the constant-factor product assertion for dense-small-point subvarieties using Yamaki §§4–5: the height-zero projection to the constant factor is constant-defined, and the other projection lies in the trace-free quotient. Poincaré reducibility identifies the nowhere-degenerate part up to isogeny with its trace factor times the trace quotient. The product assertion gives both implications of the reduction (Yamaki Theorem 5.3 and Theorem 5.5).

**Checks.**

- If A has good reduction everywhere and trivial trace, 𝔪 = A and t = 0, and the statement is trivial.
- For A totally degenerate at some place, A has trivial trace and the conclusion for A is Gubler’s theorem.

*Needs:* TropicalAndBerkovichArithmetic §§6.2–6.4, 7.0 (the abelian valuation map contract, the abelian canonical measure contract, the strict support dimension contract, the nonarchimedean small-point equidistribution contract); HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; NeronModelsAndSemistableAbelianVarieties §§1.1–1.10, 3.10–3.14, 5.1–5.2; §7.4; §7.3; §7.2.

### 9.13 Reduction of the geometric Bogomolov conjecture to conditions (a)–(d)

To prove that every closed X ⊆ `A_{K̄}` with dense small points is special, it suffices to treat the case where (a) trdeg(K/k) = 1, (b) the model S is a smooth projective curve, (c) A has semistable reduction over S, (d) A has trivial geometric K̄/k-trace and good reduction over S; and X may moreover be assumed defined over K after a finite extension of K. (xy-2022, §5, pp. 22–23 (arXiv v1)).

Throughout this subsection, k algebraically closed; K/k finitely generated with trdeg ≥ 1.

One proof route is the following. (a) by induction with the transcendence reduction; (b) the regular projective model of a function field of one variable is unique. (c) semistable reduction holds after a finite extension of K (NeronModelsAndSemistableAbelianVarieties §3.10), which preserves small points and speciality (HeightsRationalPointsAndObstructions §0.33). (d) Yamaki’s reduction passes to 𝔪/t, which has good reduction and trivial trace; X is defined over a finite extension of K.

**Checks.**

- Every step preserves both the hypothesis (dense small points) and the conclusion (special).
- After (d), special means torsion subvariety.

*Needs:* §9.9; §9.12; NeronModelsAndSemistableAbelianVarieties §§1.1–1.10, 3.10–3.14, 5.1–5.2; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; §7.3.

### 9.14 Iterated sums X_m of a subvariety

For a nonempty closed subvariety X of an abelian variety A and m ≥ 1, X_m is the image of the addition morphism f_m : X^m → A, (x₁, …, x_m) ↦ x₁ + ⋯ + x_m, and X₀ = {0}. Then dim `X_{m−1}` ≤ dim X_m ≤ dim `X_{m−1}` + dim X. (xy-2022, §5.1, p. 23 (arXiv v1)).

Throughout this subsection, X ⊆ A nonempty and closed.

One proof route is the following. The addition map is proper, so X_m is closed; X_m = `X_{m−1}` + X gives the dimension bounds.

The defining object has the following API.

- X_m ⊆ A closed for m ≥ 0.
- `X_{m+1}` = X_m + X.
- dim `X_{m−1}` ≤ dim X_m ≤ dim `X_{m−1}` + dim X.
- For 0 ∈ X irreducible, the X_m increase and stabilize at the abelian subvariety generated by X, within dim A steps.
- (X − x₀)_m = X_m − m x₀.

**Checks.**

- X₀ = {0} and X₁ = X.
- For an Abel–Jacobi curve C ⊆ J of genus g through 0, C_m is the image of the m-th symmetric power, of dimension min(m, g), and C_g = J.
- For X={x} with x non-torsion, X_m={mx} has dimension zero and need not be a subgroup. The hypothesis 0∈X in the stabilization API is essential; X={0} itself stabilizes immediately.
- For a translate X = t + B of an elliptic curve B ⊆ A, X_m = mt + B for every m ≥ 1, so dim X_m = 1 throughout, while X₂ = 2t + B equals X₁ = t + B exactly when t ∈ B. Stabilization of the dimension is therefore weaker than equality of the sets X_m.

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 9.15 The sums become a torsion subvariety (XY Lemma 5.3)

Assume (a)–(d), dim X ≥ 1, X irreducible and X with dense small points. There is a unique integer r ≥ 1 with dim `X_{r−1}` < dim X_r and X_r a torsion subvariety of A. After a torsion translation and a finite extension of K one may assume (e): A′ := X_r is an abelian subvariety of A and dim `X_{r−1}` < dim X_r. (xy-2022, Lemma 5.3, pp. 23–24, and condition (e), pp. 24–25 (arXiv v1)).

Throughout this subsection, (a)–(d); X irreducible with dim X ≥ 1 and dense small points.

One proof route is the following. Choose any x₀∈X; the sums X_m−mx₀ increase and eventually stabilize at the abelian subvariety B generated by X−x₀. Let r be the first stabilization index. No assertion that one chosen point has height zero is needed. Products of dense arbitrarily small sets map to dense arbitrarily small sets in X_r. Since X_r is a translate B+t, its image in A/B has height zero. Trivial geometric trace makes that image torsion; choose a torsion lift, so X_r is a torsion translate of B. Its height is 0, and trivial trace makes height-0 points torsion (HeightsRationalPointsAndObstructions §1.11), so t is torsion mod B and X_r is a torsion subvariety; uniqueness of r because dim X ≥ 1 forces the first jump.

**Checks.**

- For X a point the conclusion fails: X_m = {mx} never jumps.
- For a positive-dimensional abelian subvariety X through zero, r=1. For a genus-two ample curve C through zero in its abelian surface Jacobian, C+C=J and r=2. A smooth elliptic curve through zero in an abelian variety is a subgroup and has stabilization index 1.

*Needs:* §9.14; §7.2; §7.3; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19.

### 9.16 Relative dimension of the summation map and its jump locus

Under (e), the summation morphism f : `X_{r−1}` × X → A′ has relative dimension e = dim `X_{r−1}` + dim X − dim A′ < dim X, and `A′_{e+1}` = {y ∈ A′ : dim `f^{-1}(y)` ≥ e + 1} is closed of codimension ≥ 2 in A′. (xy-2022, §5.2, p. 25 (arXiv v1)).

Throughout this subsection, (a)–(e).

One proof route is the following. f is surjective onto A′ = X_r, so its generic fibre dimension is e = dim `X_{r−1}` + dim X − dim A′, which is < dim X since dim `X_{r−1}` < dim A′. Upper semicontinuity of fibre dimension makes `A′_{e+1}` closed; the dimension count dim `f^{-1}(A′_{e+1})` ≤ `dim(X_{r−1} × X)` gives codimension ≥ 2 when combined with irreducibility of `X_{r−1}` × X.

**Checks.**

- If X = A′ is already an abelian subvariety (r = 1), `X_{0}` × X = X and e = 0.
- Torsion points off `A′_{e+1}` are dense in A′ (codimension ≥ 2 complement; prime-to-p torsion is dense).

*Needs:* §9.15; §9.14.

### 9.17 Torsion fibres have height zero (XY Proposition 5.4)

Under (a)–(e), for every torsion point t ∈ A′(K̄) ∖ `A′_{e+1}(K̄)` of order prime to char k, every irreducible component of the fibre `f^{-1}(t)` ⊆ `(X_{r−1} × X)_{K̄}` has canonical height 0 in `(A × A)_{K̄}`. (xy-2022, Proposition 5.4 and proof, pp. 25–26 (arXiv v1)).

Throughout this subsection, (a)–(e); t torsion of order prime to char k, off the jump locus.

One proof route is the following. Work on Néron models: 𝒜′_N for A′ and ℬ_N = 𝒜 ×_S 𝒜′_N for B ⊆ A × A, with the generic isomorphism A × A′ → B, (x, t) ↦ (x, t − x); the summation h is the flat second projection and 𝒴 the closure there, never a possibly nonsmooth embedded closure. Xie–Yuan’s non-proper intersection inequality (their Proposition 2.1, owned by SchemeAndStackFoundations §§5.2, 5.5–5.6 (the flat non-proper intersection contract)) bounds Σ m_i[𝒵_i] · `[ℒ_ℬ]^{e+1}` ≤ h^*[𝒯] · [𝒴] · `[ℒ_ℬ]^{e+1}` for the torsion multi-section 𝒯 of t. Replace [𝒯] by `a[ℒ_{𝒜′}]^{dim A′}` with a>0 (numerical class of torsion multi-sections). For the symmetric rigidified relatively ample ℒ_ℬ, some integer b>0 makes `bℒ_ℬ−h^*ℒ_{𝒜′}` nef (AbelianSchemesAndArithmeticModuli A2.9). Approximate ℒ_ℬ and `bℒ_ℬ−h^*ℒ_{𝒜′}` by ample rational classes as in A2.9. For `h^*ℒ_{𝒜′}`, first add εℒ_ℬ for rational ε>0: this normalized symmetric bundle is relatively ample by the graph immersion into 𝒜′×_Sℬ, so A2.9 applies; then let ε tend to zero. Ample intersection positivity (A2.7) and multilinearity give `(h^*ℒ_{𝒜′})^{dim A′}·ℒ_ℬ^{e+1}·[𝒴] ≤ b^{dim A′}ℒ_ℬ^{dim 𝒴}·[𝒴]` (xy-2022, proof of Proposition 5.4, p. 26). Dense small points and Zhang–Gubler give ĥ(Y)=0 for Y=`X_{r−1}`×X, so the right side is zero. Each component intersection is nonnegative by the same ample-limit argument; the positive multiplicities therefore force each [𝒵_i]·`[ℒ_ℬ]^{e+1}`=0, hence ĥ(Z_i)=0. Only t of order prime to the characteristic is treated: the multi-section must be étale.

**Checks.**

- For a subgroup X=B through zero, r=1 and f:{0}×B→B is an isomorphism; e=0, the jump locus is empty, and f⁻¹(0)={(0,0)} has height 0. For a general X the assertion at t=0 requires 0 outside the jump locus.
- On E×E put H₁=pr₁^*O_E(0), H₂=pr₂^*O_E(0), L=H₁+H₂ and M=H₂. Then H₁²=H₂²=0, H₁·H₂=1, L−M=H₁ is nef and M·L=1≤L²=2. For ε=½ the relatively ample M+εL has square 3/2>0, whereas M²=0. This tests the direction of the nef-difference inequality and the allowed equality in the limit.
- In characteristic p, p-power torsion is excluded; prime-to-p torsion off `A′_{e+1}` is still dense, which is all §9.18 uses.

*Needs:* §9.16; §9.11; §9.10; §7.2; §7.1; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; NeronModelsAndSemistableAbelianVarieties §§1.1–1.10, 3.10–3.14, 5.1–5.2; SchemeAndStackFoundations §§5.1–5.6, 5.12; AbelianSchemesAndArithmeticModuli A2.7, A2.9.

### 9.18 The geometric Bogomolov conjecture under (a)–(d), by induction on dim X

Assume (a)–(d). Every closed irreducible X ⊆ `A_{K̄}` with a dense set of small points is a torsion subvariety. (xy-2022, §5.3, pp. 26–27 (arXiv v1)).

Throughout this subsection, (a)–(d); X irreducible closed with dense small points.

One proof route is the following. dim X = 0: dense small points mean ĥ(x) = 0, and over a function field the kernel of the Néron–Tate height is torsion plus trace points (HeightsRationalPointsAndObstructions §1.11), so with trivial trace x is torsion. dim X ≥ 1: arrange (e). For prime-to-p torsion t ∈ A′ off `A′_{e+1}`, the components of `f^{-1}(t)` have height 0, hence dense small points (using both minima inequalities), and dimension e < dim X; by induction (applied in A × A, which again satisfies (a)–(d)) they are torsion subvarieties. These t are dense in A′, so `X_{r−1}` × X contains a dense set of torsion points; Manin–Mumford for abelian varieties with trivial trace in every characteristic (HeightsRationalPointsAndObstructions §5.7) makes `X_{r−1}` × X, hence X, a torsion subvariety. Torsion inside the translated components may have p-primary part.

**Checks.**

- For X a torsion coset the hypothesis holds and the conclusion is immediate.
- The induction runs on A × A, not on A: the hypotheses (a)–(d) are stable under products.

*Needs:* §9.17; §9.15; §9.16; §7.2; §7.5; HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 9.19 The geometric Bogomolov conjecture (Xie–Yuan Theorem 1.1)

Let k be algebraically closed, K/k finitely generated of transcendence degree ≥ 1, A an abelian variety over K and X a nonempty closed irreducible subvariety of `A_{K̄}`. If X contains a dense set of small points of A/K/k, then X is special. (xy-2022, Theorem 1.1, p. 3; proof §5, pp. 22–27 (arXiv v1)).

Throughout this subsection, k algebraically closed; K/k finitely generated of transcendence degree ≥ 1; X ⊆ `A_{K̄}` closed.

One proof route is the following. Reduce to (a)–(d) and to X irreducible and defined over K. Apply the good-reduction case: X is a torsion subvariety of the trace-free quotient; lifting through Yamaki’s reduction makes X special for A/K/k. The converse (special ⇒ dense small points) is the easy direction.

**Checks.**

- A special subvariety tr(Y ⊗ K̄) + T has dense small points, so the theorem is an equivalence.
- In characteristic 0 over a curve it agrees with Gao–Habegger’s Theorem 1.1.
- For constant A = A₀ ⊗ K every subvariety of the form Y ⊗ K̄ is special, so the trace term cannot be omitted from the conclusion.

*Needs:* §9.13; §9.18; §9.9; §9.12; §7.3; §7.4.

### Examples

For the normalized pencil S=P², independent ratios y/x and z/x give different one-variable fields with intersection k. An elliptic subgroup X through zero has r=1 and e=0; a genus-two Abel curve generating its abelian surface has dim X₁=1, dim X₂=2 and r=2. Prime-to-p torsion remains dense for p=2 or p=3, while [p] may be inseparable and is not used to make an étale torsion multisection.

### Dependencies

Layer 7; SchemeAndStackFoundations §§4.11,4.13,5.1–5.6,5.12 (the flat non-proper intersection contract); AbelianSchemesAndArithmeticModuli A1–A3,A6, specifically A2.7 and A2.9; NeronModelsAndSemistableAbelianVarieties §§1.1–1.10,3.10–3.14,5.1–5.2; TropicalAndBerkovichArithmetic §§6.2–6.4,7.0 (the abelian valuation map contract, the abelian canonical measure contract, the strict support dimension contract, the nonarchimedean small-point equidistribution contract); ClassicalArithmeticCompletion §3.19; HeightsRationalPointsAndObstructions §§1.9–1.11,5.7. The all-characteristic proof is independent of Betti maps and Layer 8.

## Layer 10: Adelic non-degeneracy and small points in curve families

### 10.1 Small-points bound for potentially big families (Yuan Theorem 4.2)

(1) Let S be a quasi-projective variety over a number field K, π : X → S a smooth relative curve, L̄ a nef adelic line bundle on X/ℤ and M̄ an adelic line bundle on S/ℤ. If L̄ is potentially big over S, there are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every y ∈ U(K̄), #{x ∈ X(K̄) : π(x) = y, `h_{L̄}(x)` ≤ `c₁h_{M̄}(y)`} ≤ c₂. (2) Let S be a positive-dimensional quasi-projective variety over a field k, π : X → S a smooth relative curve, L̄ nef adelic on X/k potentially big over S and M̄ adelic on S/k. There are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every point y ∈ U of dimension one (with function field k(y) of transcendence degree 1 over k), #{x ∈ X_y(k(y)‾) : `h_{L̄|X_y}(x)` ≤ c₁·deĝ(M̄|_y)} ≤ c₂, heights normalized over k(y)/k. (yuan-2026, Theorem 4.2(1)–(2), p. 64; proof pp. 65–67 (author manuscript 21 August 2024)).

Throughout this subsection, π : X → S smooth relative curve; L̄ nef and potentially big over S.

One proof route is the following. Potential bigness gives m with m⊠L̄ big on `X^m_{/S}` (ArakelovGeometryAndAbelianHeightsPartII §§12.1–12.5). The Yuan–Zhang height inequality (ArakelovGeometryAndAbelianHeightsPartII §4.7, part (1)) gives ε > 0 and an effective divisor Z of a multiple of m⊠L̄ − επ^*M̄ such that points of `X^m_{/S}` off Z satisfy `h_{m⊠L̄}` ≥ `εh_{M̄}∘π`; for a strict inequality defining a closed exceptional set, add to M̄ an ample model bundle of positive degree on every point. Over a dense open U of S the fibres Z_y are proper in X_y^m with bounded degree; write d_y=codim_(X_y^m) Z_y>0 and measure degree for m⊠N_y with deg N_y=1; a set Σ of small points with Σ^m ⊆ Z_y has |Σ| ≤ `(deg Z_y)^{1/d_y}` by the product-grid bound (yuan-2026, Lemma 4.3, pp. 66–67), applied to each finite subset of Σ so that Σ itself is finite.

**Checks.**

- In C² let Z be the union of the three fibres {a,b,c}×C for distinct points a,b,c. Then codim Z=1, deg_(N⊠N) Z=3 and Σ={a,b,c} satisfies Σ²⊆Z with |Σ|=3. The codimension exponent gives 3≤3; the fibre-power exponent would falsely give 3≤√3.
- The constants depend on the family and the bundles, not on y ∈ U.
- Potential bigness is necessary: for a constant family X = C × S over a positive-dimensional base with L̄ pulled back from C, the number of x with `h_{L̄}(x)` ≤ `c₁h_{M̄}(y)` tends to infinity with `h_{M̄}(y)`, so no uniform c₂ exists; such an L̄ is not potentially big.

*Needs:* ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 10.2 Non-isotrivial function-field points

Let U be a scheme over ℤ, K a function field of one variable over a field k and k′ the algebraic closure of k in K. A morphism y : Spec K → U is non-isotrivial if it does not factor through Spec K → Spec k′. When U is a finite-type k-scheme and y is a k-morphism, this says that the closure of the image of y is a curve (a point of dimension one). (yuan-2026, Explanation of Theorem 4.10, p. 82 (author manuscript 21 August 2024)).

Throughout this subsection, K/k of transcendence degree 1.

One proof route is the following. Use the factoring predicate as stated. Finite extension of K preserves it. For finite-type k-schemes, the image has dimension at most one; quasi-finite k-morphisms preserve this dimension, giving the composition API.

The defining object has the following API.

- The predicate on y : Spec K → U.
- For a quasi-finite morphism U→V of finite-type k-schemes and a K-point y of U, y is non-isotrivial iff its image in V is non-isotrivial. All morphisms here are k-morphisms.
- Preserved under finite extension K′/K.
- For U of finite type over k, y is isotrivial iff its image is a closed point.

**Checks.**

- For U = 𝔸¹_k and K = k(t), the point t is non-isotrivial and every constant c ∈ k is isotrivial.
- For k = ℝ and K = ℂ(t) (constant field k′ = ℂ), the point i ∈ 𝔸¹(K) is not in k but factors through Spec k′, so it is isotrivial: the criterion is factoring through the algebraic closure of k in K, not through k.
- If U = Spec k, no point is non-isotrivial.

*Needs:* ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; Mathlib `Algebra.trdeg`.

### 10.3 Integral small-points bound across characteristics (Yuan Theorem 4.10)

Let S be a quasi-projective flat integral scheme over ℤ, π : X → S a smooth relative curve, L̄ a nef adelic line bundle on X/ℤ and M̄ adelic on S/ℤ. If L̄ is potentially big on X/S, there are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every function field K of one variable over any field k and every non-isotrivial y : Spec K → U, #{x ∈ X_y(K̄) : `h_{L̄|X_y}(x)` ≤ c₁·deĝ(M̄|_y)} ≤ c₂, where the restrictions pass through S_ℚ/ℚ or `S_{𝔽_p}`/𝔽_p and then S_k/k, and heights are normalized over K/k. (yuan-2026, Theorem 4.10 and proof, pp. 81–83 (author manuscript 21 August 2024)).

Throughout this subsection, S quasi-projective flat integral over ℤ; L̄ nef, potentially big over S.

One proof route is the following. Choose m with m⊠L̄ big on `X^m_{/S}` over ℤ and ε > 0 with m⊠L̄ − επ^*M̄ big; a multiple has a non-zero effective section s over ℤ, Z = div(s). Restriction across characteristics (ArakelovGeometryAndAbelianHeightsPartII §12.6) preserves effectivity: for every non-isotrivial y, small points of (X^m)_y lie in Z_y, with a strict margin below the height lower bound. The fibres Z_y over a dense open U are proper with degree bounded by the degree over ℤ; the product-grid bound concludes as in Theorem 4.2.

**Checks.**

- The constants are independent of k and of the characteristic.
- Isotrivial points must be excluded: for y factoring through k′, heights of constant points are 0 and deĝ(M̄|_y) = 0.

*Needs:* §10.1; §10.2; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 10.4 Potential bigness implies non-degeneracy of fibre powers (Yuan Proposition 4.16)

Let k be a field, S a quasi-projective normal k-variety, ψ : A → S an abelian scheme of relative dimension r, ι : Y → A a generically finite morphism from a quasi-projective k-variety, L a symmetric ψ-ample line bundle rigidified along zero and L̄ its invariant adelic extension over k. If Y → S is projective flat with geometrically integral generic fibre of dimension e, L|_Y has positive top degree on the generic fibre, and the relative Deligne pairing ⟨`(ι^*L̄)^{e+1}`⟩ is big on S/k, then ι^m : `Y^m_{/S}` → `A^m_{/S}` is non-degenerate for every m ≥ dim S. (yuan-2026, Proposition 4.16, p. 97 (author manuscript 21 August 2024)).

Throughout this subsection, as stated; non-degeneracy in the adelic sense (bigness of ι^*L̄ on Y/k); the fibre-power exponent m is a positive integer, including when dim S=0.

One proof route is the following. By the potential-bigness criterion, m⊠ι^*L̄ is big on `Y^m_{/S}` for every m ≥ dim S. Non-degeneracy of ι^m means bigness of (ι^m)^*(m⊠L̄) = m⊠ι^*L̄, i.e. exactly this (ArakelovGeometryAndAbelianHeightsPartII §§5.1–5.3 non-degeneracy).

**Checks.**

- For S=Spec k, invariant adelic non-degeneracy is geometric bigness: a closed positive-dimensional subvariety with an ample restricted bundle satisfies it, including an abelian subvariety itself. No abelian-subvariety-free condition is required.
- Over ℂ the conclusion is full Betti rank of `Y^m_{/S}`, matching Gao’s criterion for fibred powers.

*Needs:* ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 10.5 Non-degeneracy of Abel, difference and Faltings–Zhang powers (Yuan Theorem 4.17)

Let k be any field, S a quasi-projective integral k-variety, π : X → S a smooth relative curve of genus g > 1 with maximal variation, J = `Pic⁰_{X/S}`, and α a line bundle of positive relative degree defining i_α : X → J. Then the following are non-degenerate: (1) i_α^m : `X^m_{/S}` → `J^m_{/S}` for m ≥ dim S; (2) i_Δ^m : `(X_X)^m_{/X}` → `(J_X)^m_{/X}` for m ≥ dim S + 1, with i_Δ(x, y) = (x, y − x); (3) `i_{ω−Q}^m` : `(X_J)^m_{/J}` → `(J_J)^m_{/J}` for m ≥ dim S + g, with the universal shift τ; (4) the Faltings–Zhang map `X^{m+1}_{/S}` → `J^m_{/S}` for m ≥ dim S + 1; (5) τ_m : `X^m_{/S}` ×_S J → `J^m_{/S}` for m ≥ dim S + g. S may be non-normal (restrict to a normal dense open). Here τ_m(x₁,…,x_m,y)=((2g−2)x₁−ω+y,x₂−x₁,…,x_m−x₁), with all divisor classes taken in the relative Jacobian, and m≥1 throughout. (yuan-2026, Theorem 4.17, pp. 98–99 (author manuscript 21 August 2024)).

Throughout this subsection, g > 1; π smooth with maximal variation; α of positive relative degree; the fibre-power exponent m is a positive integer, including when dim S=0.

One proof route is the following. Potential bigness of i_α^*Θ̄, i_Δ^*Θ̄_X and τ^*Θ̄_J (ArakelovGeometryAndAbelianHeightsPartII §§12.1–12.5 theta potential bigness), with the Deligne pairings computed by the theta identities (ArakelovGeometryAndAbelianHeightsPartII §§9.1–9.2). Apply the fibre-power proposition to each map; the thresholds on m are dim of the respective base (S, X or J), i.e. dim S, dim S + 1 and dim S + g. The Faltings–Zhang and shifted Faltings–Zhang maps are the difference and shift maps composed with fibre products (JacobianChallengePartII §§2.6–2.7, 5.3–5.6).

**Checks.**

- In characteristic 0 over ℂ, part (4) recovers Gao’s non-degeneracy of `D_M(C_S^{[M+1]})` (AbelianSchemesAndArithmeticModuliPartII B4) with a different threshold.
- Maximal variation cannot be dropped: for an isotrivial family the moduli map is constant and the Deligne pairing is not big.

*Needs:* §10.4; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### 10.6 The relative Bogomolov small-points property

Let K be a number field (base k = ℤ) or a function field of one variable over k, S a normal quasi-projective K-variety, A → S an abelian scheme, ι : Y → A generically finite and L a symmetric relatively ample line bundle rigidified along zero, with fibrewise Néron–Tate height ĥ_L. For ε > 0 put Y(L, ε) = {y ∈ Y(K̄) : ĥ_L(ι(y)) ≤ ε}. ι has the small-points property if Y(L, ε) is not Zariski dense in Y for some ε > 0. The property does not depend on L: for two such L, L′ there is n > 0 with `n^{-1}ĥ_L` ≤ `ĥ_{L′}` ≤ nĥ_L on A(K̄). (yuan-2026, §4.6.3, p. 100 (author manuscript 21 August 2024)).

Throughout this subsection, as stated.

One proof route is the following. Fibrewise Néron–Tate heights of L are the heights of its invariant adelic extension (ArakelovGeometryAndAbelianHeightsPartII §5.1). Two symmetric relatively ample rigidified bundles dominate positive multiples of each other on the generic fibre, and canonical heights are monotone and linear in the bundle.

The defining object has the following API.

- The predicate on ι.
- Independent of L.
- If Y′ → Y is dominant generically finite and ι∘(Y′ → Y) has the property, so does ι.
- For S a point and ι a closed immersion, the property is the conclusion of the Bogomolov theorem for ι(Y) (HeightsRationalPointsAndObstructions §5.18).

**Checks.**

- A torsion section of an elliptic scheme over a curve has ĥ = 0 at every point and does not have the property.
- The zero section never has the property (all heights vanish).
- For S a point and ι a genus-two curve embedded in its Jacobian over a number field, the property holds (Bogomolov).

*Needs:* HeightsRationalPointsAndObstructions §§0.16–0.35, 1.7–1.11, 5.1–5.19; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; AbelianSchemesAndArithmeticModuli A1–A3, A6.

### 10.7 Arithmetic potential bigness gives the small-points property (Yuan Proposition 4.18)

Let K be a number field or a function field of one variable over k, S a normal quasi-projective K-variety, A → S an abelian scheme, ι : Y → A generically finite and L symmetric relatively ample rigidified with canonical adelic extension L̄ over k (ℤ in the arithmetic case). If Y → S is projective flat with geometrically integral generic fibre of dimension e, L|_Y is big on that fibre, and the relative Deligne pairing `⟨(ι^*L̄)^{e+1}⟩_{Y/S}` is big on S/k, then ι^m : `Y^m_{/S}` → `A^m_{/S}` has the small-points property for every m ≥ dim_K S + 1. Bigness over k is an explicit hypothesis; relative variation over K alone does not replace it. (yuan-2026, Proposition 4.18, p. 100 (author manuscript 21 August 2024)).

Throughout this subsection, as stated, with bigness on S/k.

One proof route is the following. By the criterion, m⊠ι^*L̄ is big on `Y^m_{/S}` over k for m ≥ dim_K S + 1 (one more than the geometric threshold, since the base now has absolute dimension dim_K S + 1). The height inequality (ArakelovGeometryAndAbelianHeightsPartII §4.7, part (1)) applied to m⊠ι^*L̄ and an auxiliary adelic Ā of height ≥ 1 at every point gives ε > 0 and a dense open U ⊆ `Y^m_{/S}` with `h_{m⊠L̄}` ≥ ε on U(K̄); points of Y^m all of whose coordinates have height ≤ ε/(2m) lie in the proper closed complement, so small points are not dense.

**Checks.**

- In the function-field case the hypothesis is bigness over the constant field k; a constant family fails it.
- For m=2, if each coordinate has height at most ε/4, their product height is at most ε/2<ε, so the product lies in the proper exceptional locus. Using ε instead of ε/(2m) would give 2ε and would not imply this containment.
- At dim_K S=0 the threshold is m≥1; m=0 gives an empty sum of heights, equal to 0, and cannot satisfy a strictly positive height bound.

*Needs:* §10.6; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 10.8 Relative Bogomolov for curve families (Yuan Theorem 4.19)

Let K be a number field, or a function field of one variable over k with k its field of constants, S a quasi-projective K-variety and π : X → S a smooth relative curve of genus g > 1 with maximal variation — in the function-field case, maximal variation over k (the moduli morphism generically finite on a projective model of S over k). Let α have positive relative degree. Then the small-points property holds for: (1) i_α^m for m ≥ dim S + 1; (2) i_Δ^m for m ≥ dim S + 2; (3) `i_{ω−Q}^m` for m ≥ dim S + g + 1; (4) the Faltings–Zhang map `X^{m+1}_{/S}` → `J^m_{/S}` for m ≥ dim S + 2; (5) τ_m for m ≥ dim S + g + 1. (yuan-2026, Theorem 4.19, p. 101 (author manuscript 21 August 2024)).

Throughout this subsection, g > 1; maximal variation (over k in the function-field case); α of positive relative degree.

One proof route is the following. Theta potential bigness over k (ArakelovGeometryAndAbelianHeightsPartII §§12.1–12.5) gives bigness of the Deligne pairings over k; the thresholds rise by one from those of Theorem 4.17 because the base is now absolute. Apply the arithmetic potential-bigness proposition. Function fields: a constant family over K has K-relative variation in dimension zero while its Jacobian has dense constant torsion; the hypothesis here is maximal variation over the constants.

**Checks.**

- For S a point over a number field, part (1) applies to the Abel image of C with m=1. Part (4) first applies at m=2, to the difference image of C³ in J². For genus two C−C=J, so claiming non-dense small points on that m=1 image would be false.
- The function-field branches hold only with maximal variation over the constants.

*Needs:* §10.7; §10.5; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### Examples

For S a point, the Abel map first has the small-points property at m=1, while the Faltings–Zhang conclusion starts at m=2. At genus two the m=1 difference image is J itself and has dense torsion. On a one-dimensional base the fibre-power non-degeneracy bound requires m≥1; the arithmetic small-point bound requires one extra factor.

### Dependencies

ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3,4.6–4.8,5.1–5.3,9.1–9.2,12.1–12.6; JacobianChallengePartII Layers 2–5,7; StableReductionPartII §§6.3,6.6–6.7,7.13,7.15; Layer 7 for normalization.

## Layer 11: Uniform Bogomolov for curves over global fields

### 11.1 Isotrivial curve–line-bundle pairs

Fix a function field K of one variable over k and an embedding k̄ → K̄. A pair (C, α) over K̄, with C a smooth projective curve of genus g > 1 and α a line bundle of degree d on C, is isotrivial (over k) if it is isomorphic to the scalar extension of a pair (C₀, α₀) over k̄; otherwise it is non-isotrivial. Triples (C, η, α) with a full level-N structure η (N ≥ 3 prime to char k) are defined isotrivial in the same way. (yuan-2026, §4.3.2, pp. 73–74 (author manuscript 21 August 2024)).

Throughout this subsection, K/k of transcendence degree one; g > 1.

One proof route is the following. A predicate on isomorphism classes of pairs over K̄ relative to the fixed embedding of k̄.

The defining object has the following API.

- The predicate on (C, α) over K̄.
- If (C, α) is isotrivial then C is isotrivial; the converse fails.
- (C, η, α) isotrivial iff (C, α) isotrivial (Lemma 4.8(a)⇔(b)).
- (C, η, α) isotrivial iff (C, η, (2g − 2)α − d·ω_C) isotrivial (Lemma 4.8(b)⇔(c)).
- Isotrivial iff the moduli point in `Pic^d_{𝒞/M}` comes from k̄, equivalently its image in the k-scheme is closed.

**Checks.**

- Let C₀/k be smooth projective of genus >1 and K=k(C₀). On the constant curve C=C₀×_k K̄ take α=O(x) for its generic K-point x. Then C is isotrivial and the pair (C,α) is non-isotrivial.
- C₀ ⊗ K̄ with α = α₀ ⊗ K̄ is isotrivial.
- In characteristic two, on the constant curve C = C₀ ⊗ K̄ of genus two, every class α of degree one with 2α = `ω_C` is defined over k̄: such classes form a torsor under J[2](K̄), and the K̄-points of the finite k̄-group scheme J₀[2], reduced or not, are its k̄-points. So (C, α) is isotrivial for every such α; the inseparability of [2] does not create a non-constant class in the fibre of the canonical shift over `ω_C`.
- The notion is only for function fields: over a number field there is no constant field to compare with, and Yuan’s theorem needs no such hypothesis there.

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### 11.2 Isotriviality via level structure, canonical shift and the moduli point (Yuan Lemma 4.8)

Let K/k be a function field of one variable, k̄ ⊆ K̄ fixed, and (C, η, α) over K̄ of genus g > 1, full level N ≥ 3 prime to char k, deg α = d. (a) (C, η, α) is isotrivial iff (C, α) is isotrivial. (b) (C, η, α) descends to k̄ iff (C, η, (2g − 2)α − d·ω_C) does. (c) The triple corresponding to a point of `Pic^d_{𝒞/M_{g,N}}(K̄)` is isotrivial iff that point comes from `Pic^d_{𝒞/M_{g,N}}(k̄)`, equivalently its image in the k-scheme `Pic^d_{𝒞/M_{g,N}}` is a closed point. Geometric torsion points, including p-primary ones, are unchanged under algebraically closed constant extension. (yuan-2026, Lemma 4.8, p. 74, and §4.3.2, p. 75 (author manuscript 21 August 2024)).

Throughout this subsection, N ≥ 3 prime to char k; g > 1.

One proof route is the following. (a) Rigidity of level structures (StableReductionPartII §4.4): a level-N structure on an isotrivial curve is defined over k̄ after the identification, since the level-N torsion of a constant Jacobian is constant. (b) α ↦ (2g − 2)α − dω_C is a finite map on Pic^d with finite fibres (translates by (2g − 2)-torsion), and torsion of a constant Jacobian is constant, including p-primary torsion over algebraically closed k̄. (c) The fine moduli space `M_{g,N}` and its relative Picard scheme represent triples (StableReductionPartII §7.15); a K̄-point comes from k̄ iff it factors through the closed points of the k-scheme.

**Checks.**

- The full level structure supplies a fine moduli space with a universal curve and relative Picard scheme representing triples. Without it that representability argument is unavailable; this alone does not disprove the corresponding criterion on geometric isomorphism classes.
- For g=2 and deg α=1, the shift is 2α−ω_C. For constant C and constant α its moduli point is closed and the shifted pair is constant; for α=O(x) with x the generic point of C₀ over k(C₀), the map x↦2[x]−[ω_C] is nonconstant (the Abel map followed by finite [2]), so neither pair is isotrivial. In characteristic two [2] may be inseparable, but is still finite; geometric points of a finite fibre over k̄ are constant.

*Needs:* §11.1; §10.2; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### 11.3 Small points over the universal shift by noetherian induction (Yuan §4.4.1)

Work over a field with a chosen primitive N-th root of unity and N invertible, or over B=Spec ℤ[1/N,ζ_N], N ≥ 3. Let S = `M_{g,N}` be the fine symplectic-level moduli scheme over this base of smooth genus-g > 1 curves with full level-N structure and π : X → S its universal curve (more generally, S quasi-finite over M_g, so that every closed subvariety of S has generically finite moduli map). With J = `Pic⁰_{X/S}`, Θ̄ its canonical nef symmetric twice-theta adelic bundle, X_J = J ×_S X, J_J = J ×_S J, q₁ : X_J → J, τ(y, x) = (y, y + (2g − 2)x − ω) and L̄ = τ^*p₂^*Θ̄: for every adelic M̄ on J (over ℤ in the arithmetic case) there are c₁, c₂ > 0 with #{z ∈ X_J(K̄) : q₁(z) = y, `h_{L̄}(z)` ≤ `c₁h_{M̄}(y)`} ≤ c₂ for all y ∈ J(K̄) over number fields, and the analogous bound with deĝ(M̄|_y) for non-isotrivial function-field points. (yuan-2026, §4.4.1, pp. 76–77; §4.4.2, pp. 79–81 (author manuscript 21 August 2024)).

Throughout this subsection, S = `M_{g,N}` with its universal curve, or S quasi-finite over M_g; g > 1.

One proof route is the following. L̄ is potentially big on X_J/J (ArakelovGeometryAndAbelianHeightsPartII §§12.1–12.5, theta potential bigness part (3)); the small-points bound gives the claim on a dense open U ⊆ J. For every irreducible closed Y ⊆ J ∖ U, the restriction of L̄ to X_Y is potentially big over Y (part (4), whose hypothesis is that the image T of Y in S has generically finite moduli map — automatic for S quasi-finite over M_g, which is why S is the fine moduli space — using maximal variation of T to make the base pairing big, with dim T replacing dim S in that positivity argument); apply the bound on a dense open of Y. Noetherian induction on closed subsets of J terminates after finitely many steps; normalize subvarieties where the bound needs normal bases. Over B=Spec ℤ[1/N,ζ_N], Theorem 4.10 applies to the horizontal integral strata after normalization. Vertical strata are varieties over finite fields and require the geometric small-points theorem 4.2(2); a vertical component is not flat over ℤ. The all-characteristic bookkeeping is in §11.6.

**Checks.**

- The constants depend on the family X → S and on M̄ only.
- Without part (4) of theta potential bigness the induction cannot leave the generic open set.

*Needs:* §10.1; §10.3; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.

### 11.4 Heights on the universal shift and the moduli height (Yuan §4.4.1)

In the setting of the noetherian induction bound over a number field, for z = (y, x) ∈ X_J(K̄) above s ∈ S(K̄): `h_{L̄}(z)` = 2ĥ((2g − 2)x − (`ω_{X_s}` − y)). For M̄ = Θ̄ + π_J^*λ̄_S + O(c), with λ̄_S the adelic Hodge bundle of X → S, `h_{M̄}(y)` = 2ĥ(y) + h_Fal(X_s) + c. With c = (g/2)log(2π²) + 1, Bost’s lower bound h_Fal ≥ −(g/2)log(2π²) in Faltings’ normalization gives `h_{M̄}(y)` ≥ 2ĥ(y) + max{h_Fal(X_s), 1} ≥ ĥ(y) + max{h_Fal(X_s), 1}; this M̄ and its lower bound are the positive comparison height of ArakelovGeometryAndAbelianHeightsPartII §13.7. (yuan-2026, §4.4.1, pp. 77–78 (author manuscript 21 August 2024)).

Throughout this subsection, number-field normalization; s ∈ S(K̄).

One proof route is the following. Projection formula for τ₁ = p₂ ∘ τ : X_J → J, with τ₁(y, x) the class of y + (2g − 2)x − ω on X_s: `h_{L̄}(z)` = h_Θ(τ₁(z)) = 2ĥ(τ₁(z)), and [−1] symmetry of ĥ. `h_{Θ̄}(y)` = 2ĥ(y), `h_{λ̄_S}(s)` = h_Fal(X_s) (ArakelovGeometryAndAbelianHeightsPartII §5.4, adelic Hodge bundle computes the Faltings height), and O(c) has height c. Bost’s bound h_Fal ≥ −(g/2)log(2π²) (ArakelovGeometryAndAbelianHeights §6.5, in Faltings’ normalization) with c = (g/2)log(2π²) + 1 gives h_Fal(X_s) + c ≥ 1 and h_Fal(X_s) + c ≥ h_Fal(X_s), hence `h_{M̄}(y)` ≥ 2ĥ(y) + max{h_Fal(X_s), 1}; ArakelovGeometryAndAbelianHeightsPartII §13.7 records exactly this comparison height, and this section only combines it with the universal-shift identity.

**Checks.**

- For y = ω − (2g − 2)α with α of degree 1, (2g − 2)x − (ω − y) = (2g − 2)(x − α), so the identity converts the claim into a bound for ĥ(x − α).
- The shift y ↦ ω − (2g − 2)α is surjective on degree-0 classes after extending K, which is why α may be any class in `Pic¹(C_{K̄})`.

*Needs:* JacobianChallengePartII §§3.2–3.13; HeightsRationalPointsAndObstructions §§0.18–0.21; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.

### 11.5 Moduli height domination over function fields (Yuan §4.4.2)

Over a field k, in the setting of the noetherian induction bound, take M̄ = Θ̄ + `π_J^*λ̄_{S̄}` + N with N ample on a projective compactification of J. For every point y ∈ J of dimension one with image s ∈ S, deĝ(M̄|_y) ≥ 2ĥ(y) + `h_Fal(X_{s, k(y)})` + 1, all terms normalized with reference field k(y) and residue degrees over k, the last term coming from the positive integral degree of N on the closure of y. (yuan-2026, §4.4.2, pp. 79–80 (author manuscript 21 August 2024)).

Throughout this subsection, k a field; y a dimension-one point of J.

One proof route is the following. Degrees are additive: deĝ(Θ̄|_y) = 2ĥ(y) in the normalization over k(y)/k, deĝ(λ̄|_y) = h_Fal(X_s) for the function-field Faltings height (ArakelovGeometryAndAbelianHeightsPartII §13.1) with the Hodge bundle on the stable compactification. N is ample on a projective model, so its degree on the closure of y is a positive integer, at least 1.

**Checks.**

- The constant 1 replaces Bost’s bound: over function fields h_Fal ≥ 0 (ArakelovGeometryAndAbelianHeightsPartII §13.1).
- For isotrivial points the degree of N on the (zero-dimensional) closure is not defined; only dimension-one points are considered.

*Needs:* JacobianChallengePartII §§3.2–3.13; HeightsRationalPointsAndObstructions §§0.18–0.21; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; HeightsRationalPointsAndObstructions §§0.10–0.12, 0.31–0.35.

### 11.6 Uniformity of the constants across all global fields (Yuan §4.4.3)

For each g > 1 the constants of the uniform small-points bound for genus-g curves can be chosen depending only on g, simultaneously for all number fields and all function fields of one variable over all fields k of all characteristics. (yuan-2026, §4.4.3, pp. 81–84 (author manuscript 21 August 2024)).

Throughout this subsection, g > 1.

One proof route is the following. Over `S=M_{g,N}` over B=Spec ℤ[1/N,ζ_N], apply the integral small-points bound to q₁:X_J→J, with L̄=τ^*Θ̄_J and M̄=Θ̄+π_J^*λ̄_S+N̄. Its initial exceptional locus is a proper closed subset of J, the actual parameter space for y; it is not automatically a subset of S. Apply the integral bound successively to horizontal components of the exceptional locus in J, using theta potential bigness after restriction and normalization. Dimension drops over ℚ, leaving a vertical closed subset of J with image in finitely many characteristics. This needs the restricted-family input; projecting one initial exceptional locus to S would not suffice. For each remaining prime p (including primes dividing N), choose N″≥3 prime to p and run the geometric small-points theorem 4.2(2) on the universal shift over a fixed symplectic component of `M_{g,N″}` after adjoining `ζ_{N″}` to 𝔽_p, with noetherian induction on its Jacobian. The required uniform statement across constant-field extensions must be justified in this geometric setting; the geometric extension lemma below supplies the constants. It is not an application of Theorem 4.10 to a base flat over ℤ. Number fields are covered by the arithmetic case; take the extrema of the finitely many constants. The cyclotomic base is finite flat over ℤ[1/N]. With the reference field K fixed, the geometric height of a point does not change when its coordinate field is enlarged, whereas changing the reference field from K to a finite extension E multiplies geometric heights by [E : K]; arithmetic heights are absolute. Adjoining level roots and level structures enlarges coordinate fields only, and the resulting conversion factor is bounded below in terms of g and d_α as in §11.7, so no constant depends on the input field.

**Checks.**

- The level N is fixed; changing it only changes finitely many characteristics.
- Uniformity over k is genuine: the constants do not depend on the constant field, which may be non-algebraically closed.

*Needs:* §10.3; §11.3; §11.5; §11.2; StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15; JacobianChallengePartII §§0.2–0.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2.

The geometric extension lemma used here has the following quantifiers. Fix a finite field F_q, an integral parameter subvariety T of the universal Jacobian over a fine prime-to-p level component, its pulled-back smooth curve family and its potentially big nef shift bundle. There are a dense open U⊆T and constants ε>0,D≥1, depending on these F_q-data, such that the small-point fibre bound holds over U_k for every field extension k/F_q and every non-isotrivial K/k-point, with the same ε,D. Choose a relative power and a big-bundle section over a finite extension of F_q. After adding a positive auxiliary ample height and shrinking U, its zero divisor has proper fibres of degree at most D. Flat extension of the constants preserves the nonzero section, effectivity and these degrees. A tuple of points all below ε/(2m) times the auxiliary height lies in that divisor; applying the product-grid estimate to each finite subset bounds the whole set. Descend along the finite constant extension using extension-invariance of normalized heights. This proves the extension lemma from Yuan Theorem 4.2(2), its proof and the restriction contracts (yuan-2026, Theorem 4.2 and its proof, pp. 64–67, and §4.4.3, pp. 81–84).

Apply this lemma to every geometric component in noetherian induction on T. The initial schemes and their finitely many components are defined over finite extensions of F_q, so the finite collection of strata and degree bounds is chosen before k. Dimension-zero strata contain no non-isotrivial K/k-points. On horizontal integral strata use the integral theorem; on each of the finitely many remaining vertical characteristics choose a prime-to-p full level and use this geometric lemma. Taking the minimum of positive thresholds and the maximum of the finite counting constants gives constants depending only on g. A vertical stratum is never treated as flat over Z.

### 11.7 The uniform Bogomolov-type theorem for curves (Yuan Theorem 1.1)

For each integer g > 1 there are c₁(g), c₂(g) > 0, valid simultaneously for all number fields and all function fields of one variable over any field k, in every characteristic, such that: for every smooth projective geometrically integral curve C of genus g over K and every α ∈ `Pic(C_{K̄})` of degree 1, assuming in the function-field case that (`C_{K̄}`, α) is non-isotrivial over k, #{x ∈ C(K̄) : ĥ(x − α) ≤ c₁(max{h_Fal(C), ε_α} + ĥ((2g − 2)α − `ω_{C/K}`))} ≤ c₂, where ε_α = 1 for number fields and ε_α = 1/d_α for function fields, d_α = [K(α) : K] being the degree over K of the residue field of the point of `Pic¹_{C/K}` defined by α. Here ĥ is half the canonical height of the symmetric twice-theta bundle, normalized absolutely over ℚ for number fields and, for function fields, with K as reference field and k fixed: a point with coordinates in a finite extension E of K has its E-degree divided by [E:K]. For α defined over K, d_α = 1 and this is Yuan's printed statement; the printed constant 1 for every α in the function-field case is false, as the last Check shows. (yuan-2026, Theorem 1.1, p. 5, and Theorem 4.7, p. 70; proof §4.4, pp. 76–84 (author manuscript 21 August 2024)).

Throughout this subsection, g > 1; K a number field or a function field of one variable over k; (`C_{K̄}`, α) non-isotrivial in the function-field case.

One proof route is the following. Choose a full level N ∈ {3, 4} prime to the characteristic and let F = K(J[N], α) be the field generated over K by the N-torsion of J = Jac(C) and by the point α, so [F : K] ≤ M·d_α with M = max over N ∈ {3, 4} of `|GL_2g(ℤ/N)|`; enlarging the coordinate field to F does not change heights with reference field K. Number fields: the noetherian induction bound for the universal family with M̄ = Θ̄ + π_J^*λ̄_S + O(c), the shifted height identity, and y = ω − (2g − 2)α give #{x : (2g − 2)²ĥ(x − α) ≤ c₁c₃(max{h_Fal, 1} + ĥ(ω − (2g − 2)α))} ≤ c₂. Function fields: the same with the geometric moduli domination and Lemma 4.8 to translate non-isotriviality of the moduli point. That bound is normalized with reference field k(y) for the moduli point y of the shifted triple, and k(y) ⊆ F; converting to reference field K multiplies every height by [F : k(y)]/[F : K] and turns its constant term 1 into [F : k(y)]/[F : K] ≥ 1/[F : K] ≥ 1/(M d_α). Since h_Fal ≥ 0, h_Fal + 1/(M d_α) ≥ max{h_Fal, 1/d_α}/M, so c₁/M is a valid threshold constant. The counted set is the same for every finite extension of F, since the ratio [F′ : k(y)]/[F′ : K] does not depend on F′ ⊇ F. Uniformity in K across characteristics: the characteristic-uniformity theorem.

**Checks.**

- For α = y ∈ C(K̄) over a number field, dropping the non-negative term ĥ((2g − 2)α − ω) recovers the new gap principle for curves.
- The non-isotriviality hypothesis is on the pair: for a constant curve and a constant α there are infinitely many points of height 0.
- Restricting to points x with x−α torsion makes ĥ(x−α)=0 and gives uniform Manin–Mumford for curves over global fields of every characteristic (for non-isotrivial pairs).
- The constant ε_α = 1/d_α cannot be replaced by 1. Let C₀ be a constant genus-two curve over algebraically closed k, K = k(C₀), w a Weierstrass point, Q = η − w for the generic point η, Q_N ∈ J(K̄) with N·Q_N = Q, and α_N = w + Q_N. The pair is non-isotrivial, since Q_N is not constant and constant automorphisms preserve constant classes. Every constant x ∈ C₀(k) has ĥ(x − α_N) = ĥ(Q_N) = 2/N², while h_Fal(C) = 0 and ĥ(2α_N − ω) = ĥ(2Q_N) = 8/N²; with the constant 1, all infinitely many constant points satisfy 2/N² ≤ c₁(1 + 8/N²) once N² ≥ 2/c₁. With ε_α: d_α·ĥ(Q_N) is the theta-degree of the nonconstant map from the curve of K(α_N) to J, a positive integer, so d_α ≥ N²/2 and the right side is at most c₁(2/N² + 8/N²) < 2/N² for c₁ < 1/5.

*Needs:* §11.6; §11.3; §11.4; §11.5; §11.2; §11.1; JacobianChallengePartII §§3.2–3.13; HeightsRationalPointsAndObstructions §§0.18–0.21; HeightsRationalPointsAndObstructions §§0.10–0.12, 0.31–0.35; ArakelovGeometryAndAbelianHeightsPartII §§3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7; ArakelovGeometryAndAbelianHeights §§3.4, 4.2–4.4, 5.5–5.8.

### Examples

Over R(t), the projective height of [1:1/(t²+1)] is 2. For a genus-two curve the shift uses 2g−2=2; substituting y=ω−2α gives h_L(y,x)=2ĥ(2(x−α))=8ĥ(x−α). If h_Fal≥−C, choose c=C+1: then 2ĥ(y)+h_Fal+c≥ĥ(y)+max{h_Fal,1}. In characteristics 2 and 3 choose respectively levels 3 and 4 for the exceptional vertical argument.

### Dependencies

Layer 10; StableReductionPartII §§4.2,4.4,4.8,6.3,6.6–6.7,7.13,7.15; JacobianChallengePartII Layers 0–3,5,7; ArakelovGeometryAndAbelianHeightsPartII §§5.4,12.5–12.6,13.1,13.7; HeightsRationalPointsAndObstructions §§0.10–0.12,0.31–0.35. The geometric extension argument in §11.6 covers every exceptional positive characteristic.

## Layer 12: A bielliptic family: uniform Manin–Mumford by dynamics

### 12.1 Bielliptic genus-two curves as lifts of the diagonal (DKY Proposition 9.1)

Every smooth genus-2 curve X over ℂ admitting a degree-2 map to an elliptic curve has a model y² = x⁶ − s₁x⁴ + s₂x² − 1 and is the normalization of the lift of the diagonal D ⊆ ℙ¹ × ℙ¹ under π₁ × π₂, for elliptic curves E₁, E₂ with standard projections π_i satisfying |π₁(E₁[2]) ∩ π₂(E₂[2])| = 3, the group laws taken with origins O_i over a common branch value r. There are a Weierstrass point Q of X and an isogeny Φ : J(X) → E₁ × E₂ of degree 4 with Φ(j_Q(X)) = `(π₁ × π₂)^{-1}(D)`; the non-zero elements of ker Φ are the differences of the two Weierstrass points over each common branch value. (dky-2020, Proposition 9.1, §§9.1–9.2, pp. 994–996).

Throughout this subsection, X smooth genus 2 over ℂ with a degree-2 map to an elliptic curve.

One proof route is the following. Construct the Jacobi model directly: the bielliptic involution descends through the hyperelliptic quotient to an involution of P¹. In characteristic zero diagonalize it to x↦−x; the invariant six-point branch divisor has three pairs {±a_i}, with every a_i nonzero and a_i² pairwise distinct. Rescale x and y over the algebraically closed field to write the separable even sextic as x⁶−s₁x⁴+s₂x²−1. The two lifts (x,y)↦(−x,±y) yield the two elliptic quotients. This supplies the model used in DKY §9.1. The quotient maps combine to J(X) → E₁ × E₂ with kernel the 2-torsion classes listed; the image of the Abel–Jacobi curve based at a Weierstrass point Q over the common branch value r is the preimage of the diagonal (the quotient calculation in DKY Proposition 9.1).

**Checks.**

- The bielliptic locus in M₂ is a surface (Jacobians with real multiplication by the order of discriminant 4).
- Exactly three common branch values occur; two would not give a degree-4 isogeny of this shape.

*Needs:* AlgebraicCurves Layers 10–11; JacobianChallenge Layer F; ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112.

### 12.2 Uniform Manin–Mumford for bielliptic genus-two curves (DKY Theorem 1.1)

There is a uniform B such that |j_P(X) ∩ J(X)_tors| ≤ B for every smooth bielliptic genus-2 curve X over ℂ and every Weierstrass point P of X, where j_P is the Abel–Jacobi embedding based at P. (dky-2020, Theorem 1.1, p. 950; §9.3, p. 996).

Throughout this subsection, X bielliptic of genus 2 over ℂ; P a Weierstrass point.

One proof route is the following. A common x-coordinate has at most four lifts to E₁×E₂, and each point has at most four preimages under the degree-four isogeny Φ. Thus at most sixteen points of j_Q(X) lie above each common coordinate. The common torsion images are uniformly bounded (ArithmeticDynamics §§6.111–6.112, the three-common-branch-values bound). Any other Weierstrass point P differs from Q by a 2-torsion class, so j_P(X) is a 2-torsion translate of j_Q(X) and has the same number of torsion points. Consistency: the uniform Manin–Mumford theorem for curves gives the same conclusion with B = c(2); DKY’s proof is the independent dynamical one.

**Checks.**

- Stoll’s bielliptic genus-two curve (dky-2020, Remark 1.2, p. 950) has 34 torsion points on its Weierstrass Abel–Jacobi image, so B ≥ 34.
- The bound is not explicit in DKY (Remark 1.2).

*Needs:* §12.1; ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112; §3.6.

### 12.3 Uniform Bogomolov for bielliptic genus-two curves (DKY Theorem 1.10)

There are B and b > 0 such that |{x ∈ j_P(X)(ℚ̄) : `ĥ_{L_X}(x)` ≤ b}| ≤ B for every smooth genus-2 curve X over ℚ̄ with a degree-2 map to an elliptic curve and every Weierstrass point P, where L_X = Φ^*L_D for the isogeny Φ : J(X) → E₁ × E₂ of the diagonal-lift proposition and D = {O₁} × E₂ + E₁ × {O₂}. (dky-2020, Theorem 1.10, p. 953; §9.4, p. 997).

Throughout this subsection, X bielliptic of genus 2 over ℚ̄; P Weierstrass.

One proof route is the following. Functoriality: `ĥ_{L_X}` = `½(ĥ_{t₁} ∘ π ∘ Φ₁ + ĥ_{t₂} ∘ π ∘ Φ₂)`, with Lattès heights of the two elliptic quotients (ArithmeticDynamics §§6.64, 6.110). A point of j_Q(X) of small `ĥ_{L_X}` maps to a point x of ℙ¹ with `ĥ_{t₁}(x)` + `ĥ_{t₂}(x)` small; the uniform joint small-points bound (DKY Theorem 8.1, ArithmeticDynamics §§6.64, 6.110) bounds such x, each with at most 16 preimages. For any Weierstrass P, the class P−Q is 2-torsion. Translation by torsion leaves the quadratic canonical height for the same symmetric L_X exactly unchanged. The bijection j_Q(X)→j_P(X) therefore preserves the small-point count and proves the bound for every Weierstrass base point.

**Checks.**

- A special case of the uniform Bogomolov theorem (Gao–Ge–Kühne Theorem 1.3) for X = j_P(X) in J(X) with the polarization L_X.
- The threshold b is absolute, not scaled by the Faltings height.

*Needs:* §12.1; ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112; §3.5.

### 12.4 No uniform bound on torsion orders (DKY Proposition 9.2 of the published version)

For every N > 0 there are a bielliptic genus-2 curve X over ℚ̄ and a Weierstrass point P ∈ X such that j_P(X) ∩ J(X)_tors contains a point of order ≥ N. (dky-2020, Proposition 9.2, §9.5, p. 997).

Throughout this subsection, N > 0.

One proof route is the following. Choose Legendre parameters t₁ ≠ t₂ with a common x-coordinate whose points have order ≥ N on both curves (ArithmeticDynamics §6.93, unbounded orders of common torsion images). By the diagonal-lift proposition this pair lies under a point w of j_Q(X) for the bielliptic curve with these quotients; the finite kernel of Φ makes w torsion of order at least the order of its image, so ≥ N.

**Checks.**

- Contrast with uniform Manin–Mumford: the number of torsion points is bounded, their orders are not.
- Kühne makes the same remark for general curves (Theorem 2 and the comment after it).

*Needs:* §12.1; ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112.

### Examples

Each common projected elliptic point has at most four lifts to E₁×E₂ and at most four further lifts under the degree-four isogeny, giving 16. Thus a common-image bound B₀ gives a curve bound 16B₀; the 34-point curve requires a curve bound at least 34 but only 16B₀≥34. Translation by the two-torsion difference of Weierstrass base points preserves every canonical height for the same symmetric L_X.

### Dependencies

Layer 3 for comparison with the general uniform theorems; ArithmeticDynamics §§6.57–6.64,6.93,6.110–6.112 for the independent dynamical proof; AlgebraicCurves Layer 10 and JacobianChallenge Layer F; AbelianSchemesAndArithmeticModuli A3 for quotient isogenies.

## Downstream consumers

The uniform theorems supply height-independent finite-rank intersection bounds and bounded small-point sets for subvarieties of abelian varieties. Applications to a fixed curve use §6.8 and §11.7; the geometric theorem over arbitrary constants is §9.19.

## References

- Xinyi Yuan and Shou-Wu Zhang, *Adelic line bundles on quasi-projective varieties*, arXiv:2105.13587v9. [yuan-zhang-adelic](https://arxiv.org/abs/2105.13587v9), Theorem 5.3.3, p. 158, and Lemma 5.3.4, p. 159.

- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*. [yuan-2026](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). Ann. of Math. 203 (2026), no. 1; read: author manuscript of 21 August 2024 (126 pp., printed page = PDF page), arXiv 2108.05625
- Vesselin Dimitrov, Ziyang Gao, Philipp Habegger, *Uniformity in Mordell–Lang for curves*. [dgh-2021](https://arxiv.org/pdf/2001.10276v3). Ann. of Math. 194 (2021), no. 1; read: arXiv 2001.10276v3 (31 March 2021)
- Ziyang Gao, Philipp Habegger, *Heights in families of abelian varieties and the geometric Bogomolov conjecture*. [gh-2019](https://arxiv.org/pdf/1801.05762v3). Ann. of Math. 189 (2019), no. 2; read: arXiv 1801.05762v3 (28 January 2019)
- Junyi Xie, Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*. [xy-2022](https://arxiv.org/pdf/2108.09722v1). Invent. Math. (2022); read: arXiv 2108.09722v1
- Ziyang Gao, Tangli Ge, Lars Kühne, *The uniform Mordell–Lang conjecture*. [ggk-2026](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf). Publ. Math. IHÉS 143 (2026); published PDF (printed page = PDF page + 187)
- Lars Kühne, *Equidistribution in families of abelian varieties and uniformity*. [kuhne-2021](https://arxiv.org/pdf/2101.10272v4). arXiv 2101.10272v4 (23 December 2024)
- Laura DeMarco, Holly Krieger, Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. [dky-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf). Published numbering, Annals 191 (2020), pp. 949–1001.
- Gaël Rémond, *Inégalité de Vojta en dimension supérieure*. [remond-2000-vojta](https://www.numdam.org/item/ASNSP_2000_4_29_1_101_0.pdf). Ann. Scuola Norm. Sup. Pisa Cl. Sci. (4) 29 (2000), 101–151 (Numdam; printed page = PDF page + 99)
- Kazuhiko Yamaki, *Trace of abelian varieties over function fields and the geometric Bogomolov conjecture*. [yamaki-2018](https://arxiv.org/pdf/1405.0896v5). J. reine angew. Math. (2018); read: arXiv 1405.0896v5
- David W. Masser, *Specializations of endomorphism rings of abelian varieties*. [masser-1996](https://www.numdam.org/item/BSMF_1996__124_3_457_0.pdf). Bull. Soc. Math. France 124 (1996), 457–476 (Numdam)
- Laura DeMarco, Niki Myrto Mavraki, Hexi Ye, *Bounded geometry for PCF-special subvarieties*. [dmy-2026](https://arxiv.org/pdf/2405.17343v3). Forum Math. Pi 14 (2026) e4; read: arXiv 2405.17343v3
- Gaël Rémond, *Décompte dans une conjecture de Lang*, Inventiones Mathematicae 142 (2000), 513–545. [remond-2000-decompte](https://doi.org/10.1007/s002220000095), Lemma 3.1, Propositions 3.3–3.4 and Lemma 6.1; cited by published locators, with GGK Appendix A providing the restated statements.
- Sinnou David and Patrice Philippon, *Minorations des hauteurs normalisées des sous-variétés de variétés abéliennes II*, Commentarii Mathematici Helvetici 77 (2002), 639–700. [david-philippon-2002](https://ems.press/content/serial-article-files/42941), Théorèmes 1.2–1.4, p. 641; Rémond’s theorem, p. 643; proof of Théorème 1.3, pp. 689–690.
- Sinnou David and Patrice Philippon, *Minorations des hauteurs normalisées des sous-variétés des puissances des courbes elliptiques*, International Mathematics Research Papers 2007, rpm006. [david-philippon-2007](https://doi.org/10.1093/imrp/rpm006), Theorem 6.8 and equation (6.41), cited by published locators.
- David W. Masser, *Specializations of finitely generated subgroups of abelian varieties*, Transactions of the American Mathematical Society 311 (1989), 413–424. [masser-1989](https://www.ams.org/journals/tran/1989-311-01/S0002-9947-1989-0974783-6/S0002-9947-1989-0974783-6.pdf), Main Theorem and Scholium 1, p. 414.
- Kazuhiko Yamaki, *Strict supports of canonical measures and applications to the geometric Bogomolov conjecture*. [yamaki-strict-support](https://arxiv.org/abs/1211.0406v6). Compos. Math. 152 (2016), 997–1040; read: arXiv v6, Theorem E (= Corollary 7.22), pp. 3, 41; §§3.1–3.2, 5.3, Proposition 5.12, proof of Theorem 6.2, pp. 12–15, 25–31.
