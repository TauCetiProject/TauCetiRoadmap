# Connected symplectic gauge field theory and quilted sewing

Develop the connected (2+1)-dimensional symplectic field theory built from determinant-fixed coprime `U(r)` surface moduli and quilted Floer functors. The surface values are integral, uncurved, cohomologically unital, ℤ/4-graded extended Fukaya categories with a shift autoequivalence and a formal zero object. Bordisms act by quilted `A∞` functors, with the ordinary categorical target defined in GQ4. Genuine three-dimensional instanton Floer homology and four-dimensional ASD cobordism maps have the separate owner **InstantonFloerTheory**; GQ5 specifies the boundary between these constructions.

Fix `r ≥ 1` and `d ∈ ℤ` with `gcd(r,d)=1`. Define a bundle-decorated connected bordism category. An object is a closed connected oriented smooth surface `X`, a rank-`r` Hermitian bundle `P`, a degree-`d` determinant line, its unitary connection `δ`, and the selected determinant identification. A morphism is a compact connected oriented smooth three-bordism with parametrized incoming/outgoing boundary, a rank-`r` bundle `Q`, its determinant line and connection, and identifications with those exact boundary data. Equivalence, collars and gluing preserve these data. Equal boundary degrees alone do not identify the bundles or their relative boundary identifications. Construct the identity, composition and diffeomorphism laws on these decorated carriers.

## GQ1. Fixed determinant and coprime surface moduli

Consume [HamiltonianReduction R5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93ad76c0f2a89760726126e98fcdb41cee38fe93/TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md#r5-gauge-actions-over-a-surface) for generic closed-surface connections, Sobolev gauges, central curvature, smooth/rough quotient topology and holonomy. Use anti-Hermitian matrices, covariant derivative `d+A`, and the left action `g·A=gAg⁻¹−(dg)g⁻¹`. On trace-free matrices use `B(ξ,η)=−tr(ξη)/(4π²)` and the reduced form induced by `Ω(a,b)=∫_X B(a∧b)`. The determinant convention is `c₁(det P)=[iF_δ/(2π)]`, so the fixed-determinant equation is `F_A=(F_δ/r)I_r`. Construct the adapter from R5's arbitrary invariant pairing, including its moment-map sign, curvature, Chern–Weil and integral-class normalizations.

Define `M(P,δ)` as the central-curvature connections with determinant connection exactly `δ`, modulo determinant-one unitary gauge transformations. Keep the ineffective finite center, effective quotient and stabilizers distinct. Prove the comparison with the twisted `SU(r)` relation model

\[
z_{r,d}=\exp(2\pi i d/r)I_r,\qquad
\prod_{j=1}^{g}[A_j,B_j]=z_{r,d}.
\]

Choose the punctured-surface generators so that the product of commutators represents the positively oriented loop enclosing the removed disc; prove the sign dictionary with parallel transport for `d+A`. Include the determinant transport and lift choices in the comparison. Do not replace it by an ordinary flat `U(r)` character variety when `d≠0`, or assert that an action by `H¹(X;μ_r)` is free on every coarse quotient. Construct the actual finite-quotient/groupoid comparisons with their isotropy.

For `r≥2`, prove that coprimality excludes proper parallel subbundles and gives trace-free stabilizer Lie algebra zero. Use surface duality to obtain trace-free obstruction vanishing, then construct the compact smooth symplectic quotient and its representation-model comparison. Include all genera: on `S²` the moduli is empty; on `T²` it is a point; for `g≥2` prove compactness, connectedness, simple connectivity and dimension `(2g−2)(r²−1)`. Establish even Chern evaluations and

\[
c_1(M(P,\delta))=2r[\omega],\qquad
[\omega]=\tau_{\mathrm{WW}}c_1,\quad \tau_{\mathrm{WW}}=1/(2r).
\]

For `r=1`, prove directly that the fixed-determinant moduli is a point for every genus and every integer `d`, including zero and negative degrees. The point has no nonconstant disc classes; Maslov divisibility, rather than existence of a class of Maslov number four, is the uniform grading statement.

Construct naturality under determinant-preserving surface diffeomorphisms and bundle identifications. For a line bundle with connection `(L,a)` of degree `ℓ`, construct the tensoring comparison `P↦P⊗L`, `d↦d+rℓ`, `δ↦δ+r a`. Prove preservation of the trace-free connection, deformation complex, projective holonomy, central relation and symplectic form. This reduces the rank-`r≥2` surface results to a positive coprime residue `1≤d′≤r−1`. To transport an entire decorated bordism theory, construct the actual line-bundle extensions over `Q`, relative determinant identifications and gluing/Cerf coherence; choices on boundary surfaces alone do not establish that comparison.

## GQ2. Elementary connected bordism correspondences

Construct the three-dimensional boundary application by a finite-holonomy route. For a compact compression body and its decorated bundle `Q`, construct finite CW and fundamental-group presentations, the projective holonomy carrier with its central relators, and the determinant transport and lift groupoid selecting `Q`'s actual topological class. Define residual conjugation, stabilizers, end restriction and gluing on these carriers. Establish their comparison with smooth fixed-determinant central-curvature connections and smooth gauge transformations. Prove quotient-topological, smooth-locus and relative deformation/cohomology comparisons, not only a bijection of orbit sets.

Reuse [SmoothBundlesConnections B2–B5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md) for smooth bundles, parallel transport, gauge covariance and flat-holonomy groupoids. Apply flat transport to the trace-free/projective part and construct its determinant/central lift adapter here. Use [DifferentialGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f2c41bace7640366666d72c8939784696e8e3888/TauCetiRoadmap/DifferentialGeometry/README.md) for local integration/de Rham calculus and [AlgebraicTopology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/77caf227f456d6da938674a1ac50e309d47c476a/TauCetiRoadmap/AlgebraicTopology/README.md) for finite cochains and local-coefficient duality. Construct the boundary-relative de Rham/finite-cochain and restriction comparisons for this application. R5 supplies the surface ends; its two-dimensional `s>1` Sobolev estimates are not a three-dimensional boundary theorem.

For each elementary connected one- or two-handle bordism, and for cylinders, define the restriction map from this `M(Q)` to `M(P_-)⁻×M(P_+)`. State and prove the required endpoint fundamental-group surjectivity, trace-free absolute/relative `H⁰,H¹,H²` assertions and gauge-extension statements for the specified piece. Prove that its image is an embedded compact Lagrangian correspondence, with the additional simple-connectivity and spin properties for these elementary pieces. A general three-bordism is represented by its sequence of elementary correspondences; its full connection moduli need not be smooth or embedded.

Carry the same `(r,d)`, determinant transports and identifications, central relation and residual center through every restriction. Construct the induced 4-grading, orientations, background classes and relative-spin structures. Prove the ambient/product and relative monotonicity formulas with the negative incoming symplectic form. For the ordinary monotone convention in [FukayaTheory FK0/FK3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/927284a53d7ff01237ed1e11c7b087e46d24ce80/TauCetiRoadmap/FukayaTheory/README.md), the adapter is

\[
\omega(\beta)=\tau_{\mathrm{FK}}\mu(\beta),\qquad
\tau_{\mathrm{FK}}=\tau_{\mathrm{WW}}/2=1/(4r).
\]

For a simply connected Lagrangian in the chosen product ambient, lift relative disc classes through the homotopy exact sequence and prove `μ(β)=2c₁(A)` and `ω(β)=τ_WW c₁(A)`. Even Chern evaluations imply `μ∈4ℤ`. Handle point and empty boundary values separately, including the empty correspondences for the rank-`r≥2` sphere branch. Rank-one elementary correspondences are point correspondences.

## GQ3. Connected Cerf comparison

Construct connected Cerf decompositions with connected intermediate surfaces, elementary one- and two-handle pieces and cylinders. Enumerate the allowed critical-point cancellation, cylinder insertion/removal and critical-point reordering moves. Lift them to comparisons of the decorated bundles and determinant connections, preserving the boundary parametrizations and central relation. Construct the actual restriction/gauge-extension and absolute/relative cohomology calculations for every move; use them to identify the correspondence fiber products and restriction images.

Prove transverse smooth embedded composition in each geometric replacement and prove that the replacement correspondence is itself admissible: compact, simply connected, oriented, 4-graded and relatively spin, with the spin/background data induced from the factors and intermediate ambient. Transverse embeddedness alone does not supply these properties. Construct the graded/spin comparison with the replacement used by the Cerf move. Establish comparison relations, compatibility with concatenation and the coherence between successive moves. The result is a decomposition-independent connected bordism assignment. It does not introduce disconnected intermediate levels or zero-/three-handle pieces through an unstated extension of the source category.

## GQ4. Integral generalized quilt categories and sewing

### Objects, operations and coefficients

Use compact simply connected monotone symplectic intermediate manifolds with `τ_WW=1/(2r)`, even Chern evaluations, a chosen fourfold Maslov cover and compatible background classes. An admissible generalized object of `C(M)` is a finite sequence from `pt=M₀` to `M_m=M`, whose factors are compact simply connected oriented relatively-spin Lagrangian correspondences `L_(j−1,j)⊂M_(j−1)⁻×M_j`, with the chosen relative-spin structures and 4-gradings. Include the length-zero point object when `M=pt`. Pin the finite-sequence carriers, isomorphisms and a small universe/skeleton and prove invariance under those choices. Do not identify every object with an ordinary embedded endpoint Lagrangian.

Define the Hom complex between two such objects by the actual cyclic quilt construction. Define positive-arity higher operations by quilted polygon counts, with the cohomological convention `|m_k|=2−k` modulo four and differential degree one. Use integral orientation-line coefficients, with the tensor/Koszul and chord-sign dictionary of FK0 and [DGAInfinity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DGAInfinity/README.md). Construct the actual ordinary-quilt specialization to FK's carriers and signs. Own fixed-end, fixed-index and fixed-arity quilt energy bounds and finite support of the rigid counts before using unweighted integral sums. Construct scalar extension and its compatibility with operations and functors.

Establish zero curvature on this sector. The ordinary-disc calculation in GQ2 excludes positive-area Maslov-two discs; separately prove the quilt bubble/index and energy statements needed for generalized objects and seams. Establish `m₀=0`, the `A∞` equations, integral determinant-line orientations and gluing signs. Categories containing other curved branes are not silently used in this uncurved assignment.

Choose a cohomologically unital model. Construct quilt identity cycles, their cohomological units, and coherent unit natural transformations, including their closed degree-zero representatives and composition laws. Functors preserve these units. Construct the unital `H⁰` functor categories and their composition/equivalences; units of individual Hom cohomologies alone do not provide this structure. Construct the comparison with the Wehrheim–Woodward homotopy model on these actual generalized objects. No strictification or homological transfer that needs field coefficients is assumed over `ℤ`.

### Zero extensions, point values and correspondence functors

Adjoin a formal zero object to every `C(M)`, including its point value. Set all Hom complexes incident to zero to the zero complex; all operations with an incident zero entry vanish, and its identity class is zero. Extend shifts, correspondence functors, natural transformations, unit data and comparison homotopies by zero and prove their equations and compatibility. The shift fixes the chosen zero. For `M=∅`, use the category with its single formal zero object. For `M=pt`, use the generalized point-quilt category just defined, with its formal zero extension; a comparison with a coefficient or perfect-complex category is not used to define this value.

An admissible correspondence `L⊂M_-⁻×M_+` gives a functor `F_L:C(M_-)→C(M_+)` by concatenation on generalized objects. Define its higher components by the quilt counts. An empty correspondence gives the chosen zero-preserving functor sending every object to formal zero, with zero components. Prove the unit, absorbing composition and natural-transformation laws for these chosen zero maps; do not infer a unital zero functor to a category lacking a zero object. In particular prove the sphere-incident bordism formulas and their compatibility with identity and Cerf comparisons.

### Analytic construction and geometric replacement

Consume the nonlinear/elliptic, determinant-line and ordinary-strip floors of [HeegaardFloer F0–F3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e46412766ddc4c77407a94184340ec1cb7d033f2/TauCetiRoadmap/HeegaardFloer/README.md) and FK's ordinary polygon contracts under their actual hypotheses. Own the quilted Fredholm domains, seam conditions, compactifications, gluing and multiplihedron or equivalent coherence for these generalized objects and functors. Analyze disc, sphere, seam and figure-eight bubbling. Prove the bounds and exclusion/correction statements giving the stated uncurved equations; monotonicity alone does not prove transversality or compactness.

For mixed constant/nonconstant patches, constant means `∂_s u=0` and may still be a time-dependent Hamiltonian chord. Identify the constant block and prove its self-adjointness, invertibility and exact Lagrangian-domain assertions. Prove unique continuation or universal regularity separately for the nonconstant block. Establish openness, compactness, quantitative relative finite-regularity control and energy bounds before selecting finite-dimensional smooth perturbations; distinguish a residual intersection from an open dense set. Prove strip shrinking and its functor comparison for transverse smooth embedded geometric composition whose replacement satisfies all GQ3 admissibility, grading, spin and background conditions. Concatenation remains the object operation when such geometric replacement is unavailable.

### Shift target and the two functor levels

Construct a shift autoequivalence `S_C` on each surface category, including its inverse, Hom comparisons, zero extension and coherence. Each correspondence functor is shift equivariant, with coherent natural equivalences `F S_C≃S_D F`. Define an ordinary target category whose objects are these small integral ℤ/4-graded cohomologically unital `A∞` categories with shift. Morphisms are represented by cohomologically unital integral `A∞` functors equipped with the selected coherent shift-equivariance and zero-preserving extension. Construct the functor-category adapter retaining these structures; its comparison transformations are closed degree-zero natural transformations compatible with the selected shift and zero data, with the required coherence diagrams. First identify functors by invertible classes of these transformations in the resulting `H⁰` functor category; then take the congruence

\[
[F]\sim[F\circ S_C^k],\qquad k\in\mathbb Z.
\]

Prove this is an equivalence relation and that whiskering and composition descend. In particular transport target shifts across an actual shift-equivariant functor and prove that replacing `F` by `F S_C^a` and `G` by `G S_D^b` replaces `GF` by `GF S_C^(a+b)`. Include zero functors, identities and Cerf comparison transformations. Denote this precisely constructed ordinary target by `A∞(4)/S`. It is not defined as an orbit or Verdier category, and the grading does not assert `S⁴=id`.

The first functor level sends an elementary correspondence to its `A∞` functor between surface categories. The second is the ordinary field-theory functor from the decorated connected bordism category to `A∞(4)/S`, obtained by composition and the GQ3–GQ4 comparisons. Prove its identity, composition, bundle-diffeomorphism and determinant-preserving naturality laws.

## GQ5. Instanton boundary and exact conclusion

**InstantonFloerTheory** owns the separate admissible integral and framed complex three-dimensional instanton theories: their Chern–Simons critical connections, finite-energy ASD trajectories, perturbations, reducible treatment, Fredholm/compactification/gluing/orientation theory, differential, continuation, naturality and four-dimensional cobordism maps. Its admissible Atiyah–Floer comparison owns the mixed ASD/Cauchy–Riemann bridge with its actual splitting, bundle and embeddedness hypotheses. The symplectic/quilt construction here supplies the surface correspondence side of that comparison. Neither its definitions nor its connected sewing theorem identifies it with instanton Floer homology.

The theorem target of GQ1–GQ4 is a connected functor for the specified fixed-`(r,d)`, determinant-preserving bundle-decorated (2+1)-bordism category, valued in the integral uncurved `A∞(4)/S` category above. All integer coprime degrees, rank-one point values and rank-`r≥2` empty-sphere values are included. Descent between coherently tensor-related determinant decorations uses the actual GQ1 line extensions. A disconnected symmetric-monoidal extension or point-level fully extended field theory is not part of this connected theorem.

## Ownership and construction order

R5 owns the generic surface gauge construction; GQ1 owns its fixed-determinant coprime specialization and exact normalizations. SmoothBundlesConnections, DifferentialGeometry and AlgebraicTopology own the generic smooth-transport/cochain/duality floors; GQ2 owns the three-dimensional projective/determinant lift and boundary restriction application. GQ3 owns its connected Cerf comparison. DGAInfinity, HeegaardFloer and FukayaTheory own generic algebra and ordinary elliptic/polygon theory; GQ4 owns generalized quilts, their analytic/coherent applications, zero extension and the shift-target adapter. InstantonFloerTheory owns the ASD construction and its precise comparison application. No instanton construction is a prerequisite for the symplectic connected sewing theorem.

## References

- K. Wehrheim and C. Woodward, [*Floer field theory for coprime rank and degree*](https://arxiv.org/abs/1601.04924v2), §§2–4: connected Cerf decompositions, fixed-determinant moduli, elementary correspondences, generalized quilt objects and connected field theory. The scope above keeps rank-one and quotient-isotropy cases explicit.
- K. Wehrheim and C. Woodward, [*A∞ functors for Lagrangian correspondences*](https://arxiv.org/abs/1601.04919): quilted functor and composition constructions, applied with the admissibility and coefficient/unit adapters specified in GQ4.
