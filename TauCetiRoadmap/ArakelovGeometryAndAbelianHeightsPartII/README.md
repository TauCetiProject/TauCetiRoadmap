# Roadmap: arakelov geometry and abelian heights, part II

**Summary.** Starting from hermitian degrees, arithmetic divisor classes and the Faltings metric, build the arbitrary-base adelic theory needed for admissible line bundles on families of curves. The end theorems are nefness and bigness of the admissible canonical bundle and its Deligne self-pairing under maximal variation, the potential-bigness criterion and its theta applications, and a comparison between admissible self-intersection and the stable Faltings height, uniform over all curves of a fixed genus g > 1 over all number fields and one-variable function fields, with constants depending only on g. Projective intersection theory, local measures and equidistribution enter through the supplier contracts; their extensions here retain all places, arbitrary residue characteristics and the boundary topology. (yuan-2026, Theorems 1.3–1.4, pp. 11–15; Theorems 4.1 and 4.5, pp. 60–70.)

## Scope and ownership

ArakelovGeometryAndAbelianHeights §§1.1–1.15, 2.1–2.8, 3.4 and 5.0–5.4 builds hermitian degrees, arithmetic divisors with smooth Green functions, heights of points, the Faltings metric and stable height, and the metrized Hodge line on Siegel compactifications. This Part II begins at continuous integrable metrics, the model Deligne pairing, adelic limits on arbitrary flat quasi-projective bases, and the relative admissible theory. Higher arithmetic Chow rings and arithmetic Riemann–Roch are not its end theorems.

HeightsRationalPointsAndObstructions §§5.17a–5.17b owns the projective arithmetic intersection pairing, including singular models, Cartier recursion and uniform metric limits. Its §§5.17d–5.17f supplies projective Hilbert–Samuel, arithmetic Nakai and successive minima. Those constructions are imported here. ArithmeticDynamics §§4.1a, 4.3, 4.3a and 4.4 owns local top-power measures, arithmetic Siu, quasi-projective adelic bundles/intersections/heights over global fields, and quasi-projective equidistribution. The signed mixed local measures here add boundary-limit compatibility; the adelic Picard and intersection targets here extend the global-field slice to fixed arbitrary integral bases and finitely generated fields, and §4.9 identifies the two carriers over global fields. Neither the projective intersection construction nor the global equidistribution theorem is a second target here.

SchemeAndStackFoundations Layer 5 owns ordinary cycles, degree, Cartier intersection and geometric intersection theory. ComplexComparisonPartII §C5.4 owns currents, cycle integration and Poincaré–Lelong on complex manifolds; its singular pluripotential extension is an exact supplier contract below. TropicalAndBerkovichArithmetic §§0.1, 0.12, 0.15, 0.22–0.23, 2.7, 2.13, 3.1, 3.3 and 6.1–6.8 owns Banach spectra and completed residue fields, analytification over complete nonarchimedean fields (trivially valued ones included), hybrid analytic spaces, skeleton retraction and valued extension, metric graphs and their Laplacian, local model metrics, Chambert-Loir measures and their limits, graph Green functions, the admissible graph measure and the metric–Laplacian comparison; the scheme analytification over the archimedean Banach ring ℤ is §2.1 here. GrossZagierAndArithmeticHeights §§2.2–2.4, 2.8, 2.10, 2.12 and 2.13 owns the Arakelov probability form, the arithmetic normalization of the skeleton measure, archimedean admissible metrics, the normalized Arakelov Green function, the Arakelov dualizing metric, the Faltings–Hriljac comparison and descent at real places. This roadmap owns the curve metrics characterized through Jacobians at non-archimedean places, their family extensions, and Zhang's graph invariants; it does not introduce another graph Laplacian or an archimedean Green kernel.

JacobianChallengePartII Layers 1–6 owns relative Jacobians, Abel and difference maps, the algebraic Poincaré and canonical twice-theta bundles, actual Picard pullback comparisons and the curve–Jacobian Hodge-line isomorphism. Layer 9 here adds the relative arbitrary-degree *metrized* theta identities. StableReductionPartII §§4.8, 5.1–5.2, 5.9, 5.19, 5.21, 6.1–6.2, 6.8–6.10 and 6.21–6.22 is the designated supplier, through the curve-moduli and Noether-positivity contract, for curve moduli, stable compactifications, the boundary and its thickness, algebraic Noether isomorphisms and maximal-variation Hodge positivity. NeronModelsAndSemistableAbelianVarieties §§3.3, 3.9–3.12 owns semistable identity-model base change and its differential lattices. MotivesAndAlgebraicCycles §§2.2–2.3 owns the Weil-cohomology and homological-triviality vocabulary. The numerically trivial extension of the modified diagonal on the regular triple-product model (§10.9a) and the special Gross–Schoen self-height and its variation (§10.10) belong here; the theorem of the cube for products of complete varieties is JacobianChallenge Layer E through the cube-for-products contract. Bertini irreducibility of generic linear sections is LefschetzPencilsAndVanishingCycles §5.1, and normality of general hyperplane sections of a geometrically normal variety is SchemeAndStackFoundations §4.13 through the Bertini normal-sections contract.

The ordinary degree of a curve line bundle and the canonical degree 2g−2 are already in the library: Tau Ceti supplies `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree`, `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree` and `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree_canonicalBundle`. Those are algebraic degrees, rather than the metrized intersections constructed here.

The uniform Bogomolov theorem and small-point cardinality bounds belong to HeightsRationalPointsAndObstructionsPartII. ArithmeticDynamics retains the projective-line theory and its bifurcation applications. The end theorems concern genus greater than one, while the local canonical admissible metrics, their global bundles and the admissible family theory of Layers 7–8 and §9.1 are stated for every positive genus. Sharp boundary asymptotic expansions are not among the statements of this roadmap.

## Conventions

Fix a universe for schemes, their invertible sheaves and residue fields; enlarge it once for analytic points, measures and categories. Algebraic line bundles use the native invertible-sheaf carrier and its isomorphisms. A metric is extra analytic data, and an isometry is an algebraic isomorphism preserving every fibre norm. Picard groups mean isomorphism classes; the corresponding categories retain all isometries. Integral coefficients on the open scheme and rational coefficients on projective models are distinct. Rationalization is explicit, especially in theta identities.

The base k is ℤ or a field; fields carry the trivial norm except for the explicitly valued complex-base construction. Schemes called arithmetic varieties are integral, flat and quasi-projective over ℤ. A relative curve is smooth projective with geometrically connected fibres. The admissible metrics and measure, the canonical admissible pair, its global bundles and the family targets of Layers 7–8 and §9.1 have genus g ≥ 1; the canonical, difference and shift identities of §9.2 onward, the graph and Noether divisors and every bigness and Faltings-height statement have genus g > 1, where the canonical degree 2g − 2 is positive. Maximal variation means that the coarse-moduli map is generically finite onto its image. For a function field this condition is over the fixed constant base, not over the function field itself. All dimensions used for adelic degrees are dimensions of quasi-projective models over k, including the extra arithmetic dimension. (yuan-2026, §1.6, pp. 16–17; §3.1, p. 40.)

In the geometric theory over a trivially valued field k, a zero-dimensional integral model is Spec F with F/k finite; its empty intersection is the degree [F:k] of its fundamental zero-cycle, and every line bundle has volume [F:k]. The one-arbitrary-entry intersection and Siu mixed term are used only in dimension at least one. (SchemeAndStackFoundations §5.2; yuan-zhang-2025, §4.1.1, p. 103; §5.2.2, p. 140.)

Green functions are −log‖s‖: a local equation f satisfies g + log|f| continuous, the principal pair is (div f, −log|f|), and the associated section has norm exp(−g). Thus c₁(L̄) = (1/πi)∂∂̄log‖s‖ + δ_div(s). The parent roadmap's squared-norm Green function is twice this one. For ‖1‖ = e⁻¹ on Spec ℤ the degree is +1; the tensor square has norm e⁻² and degree +2. For f = 2 the archimedean term −log 2 cancels the finite term +log 2. These witnesses fix both the sign and the factor of two. (yuan-zhang-2025, §§2.1.1–2.1.5, pp. 23–28.)

Arithmetic point heights divide raw degree by [K(x):ℚ]; Yuan–Zhang's relative height divides by [K(x):K], so it is [K:ℚ] times ours. At infinity count real embeddings once and complex places twice, equivalently sum over all complex embeddings. In the geometric case use residue degrees over a fixed k, with |f|ᵥ = exp(−[k(v):k]ordᵥ f), and divide the point degree by [K(x):K]. Changing the field representing x leaves its height unchanged with K fixed; changing K to a degree-r extension multiplies the geometric height by r. Thus [1:t] over k(t) has height 1, and after t = u² over k(u) it has height 2. On Spec K, a constant metric e⁻¹ has raw arithmetic degree [K:ℚ] and absolute height 1. (yuan-2026, §4.1.2, pp. 63–64; §4.3.1, pp. 71–73.)

The Faltings squared norm is (i^(g²)/2^g)∫α∧ᾱ. The Deligne squared norm is (2π)^(−g)|∫α∧ᾱ|; hence h_Del = h_Fal + (g/2)log π. For g = 1 a squared-norm ratio π⁻¹ raises degree by (log π)/2; for g = 2 it raises degree by log π. Stable Faltings height always refers to these normalizations. (gaudron-remond-2014, Definition 2.1 and normalization comparison, pp. 6–7.)

Write w = ω̄₍X/S,a₎, D = Ō(Δ)ₐ, P = π_*⟨w,w⟩ and ⟨A,B⟩ = π_*⟨A,B⟩. Write Θ = Δ_J^*(Poincaré∨), the symmetric rigidified twice-theta bundle on J = Pic⁰₍X/S₎, and Θ̄ for its invariant extension. The theta height is h_Θ̄ = 2ĥ, where ĥ is the Néron–Tate height for the symmetric principal theta class. An elliptic fibre gives deg Θ = 2; [2] multiplies its canonical height by 4. The dual in Θ fixes the positive sign. (yuan-2026, Definition 2.4, p. 30; §4.3.1, p. 71.)

Graph edges have length one on the split semistable minimal regular model with |ϖ| = e⁻¹. Keeping an extended absolute value preserves local invariants; renormalizing the new uniformizer multiplies lengths, Green values, ε and φ by the ramification index. An unramified quadratic extension leaves a unit loop of length 1; a ramified quadratic extension gives length 2, not a factor of the residue degree. Period matrices used for θ have positive-definite imaginary part; Laplacian spectral sums exclude the zero eigenvalue. Haar measure on a complex Jacobian has mass 1. (yuan-2026, §A.5, pp. 115–118; wilms-2017, §§2.1–2.2, pp. 5–10.)

## Exact supplier contracts

### From Mathlib

Use `NumberField.prod_abs_eq_one` in `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98`, with its explicit nonzero-element hypothesis, and `Projectivization.logHeight` in `Mathlib/NumberTheory/Height/Projectivization.lean:51`, under its field, finite-index and admissible-absolute-value assumptions. The former includes infinite-place multiplicities; the latter is a relative logarithmic height. The comparison on [1:2] over ℚ is log 2; over a quadratic number field its native value is 2 log 2 before absolute normalization. Use native schemes, invertible-sheaf morphisms, seminorms, continuous functions and Radon measures rather than replacement carriers.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.InvertibleSheaf` in `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112`, the full subcategory of sheaves of modules satisfying the rank-one locally free predicate; its morphisms are module maps, not automatically isometries or even isomorphisms. Use `TauCeti.AlgebraicGeometry.AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, a group object over Spec K with properness and geometric integrality. Neither carrier includes a metric. The trivial invertible sheaf has rank 1, whereas the zero sheaf on a nonempty scheme fails that rank condition; the zero-dimensional abelian variety is permitted.

Use `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree` and `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree` in `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` and line 126 for algebraic curve degree, and `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree_canonicalBundle` in `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168` under its explicit integral Noetherian separated scheme, DVR codimension-one stalks, valuative-existence, coheight-at-most-one, function-field, relatively algebraically closed constants and properness hypotheses. The degree definition is the difference of Euler characteristics through H¹; without the curve and finite-dimensionality hypotheses it is not an arithmetic degree. A genus-two canonical line has degree 2 and a genus-one canonical line has degree 0.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

Consume §§1.1–1.3 and 1.7 for hermitian degree and compactified Picard groups, §§1.8–1.10 and 1.15 for arithmetic divisors, metrized-line comparison, degrees and rational lines, and §§1.12–1.14 for point heights. The Green-function comparison is (D,g) ↦ (D,2g); on Spec ℤ the degrees of norms e⁻¹ and e⁻² are 1 and 2. Sections 2.1, 2.7–2.8 and 3.4 provide the Faltings metric, its normalization and stable extension invariance. Sections 5.0b, 5.3–5.4 provide the integral minimal compactification, an ample power of the Hodge line and logarithmic metric growth. Section 6.5 supplies Bost's lower bound in both normalizations; §13.7 applies that bound rather than proving it again.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

Consume §0.11 for the relative projective height h_K: for max-metrized O(1) over a number field K, §4.6 here gives h_L̄ = h_K/[K:ℚ]; over a one-variable function field it gives h_K with the same fixed constant field. Consume §§0.16, 0.18–0.20, 0.26–0.29 for Weil heights, the Tate limit, the canonical quadratic height and specialization. Sections 5.17a–5.17b supply symmetric multilinear projective arithmetic intersections on singular models, Cartier recursion, projection and uniform continuity; use the −log‖s‖ recursion and its raw degree before dividing by [K:ℚ]. Sections 5.17d–5.17f supply projective Hilbert–Samuel, Nakai and minima as inputs to the volume results here. For a point of residue field 𝔽_q, the raw degree is log q; Fubini–Study O(1) on ℙ¹_ℤ has square 1/2; a constant metric shift e^(−c) changes an arithmetic d-fold intersection by c times generic-fibre mixed degree. These are supplier normalization checks, not new constructions.

The consumed arithmetic pairing has source P̂ic(X)_int^d and target ℝ, is determined by symmetric multilinearity, Cartier recursion and uniform metric continuity, and satisfies the projection formula for proper generically finite maps. Every nef mixed intersection is nonnegative. Vertical d-cycles over p contribute their geometric intersection times log p; a zero-dimensional point of cardinality q contributes log q. On Spec O_K it is the hermitian degree. (yuan-zhang-2025, §2.1.5, pp. 27–28; §4.4.2, pp. 123–124; Theorem A.4.1 and Corollary A.4.3, pp. 233–234.)

**Checks.**

- O(c) on Spec ℤ has intersection c, so c=1 and c=−1 detect the sign.
- Spec 𝔽₂ and Spec 𝔽₃ have degrees log 2 and log 3.
- Replacing the last norm by e^(−c) times itself adds c times the generic-fibre mixed degree; a horizontal intersection therefore depends on the metric.
- On Spec O_K the formula is log #(L/sO_K) − Σσ log‖s‖σ, with the sum over all embeddings.
- Fubini–Study O(1) on ℙ¹_ℤ has square 1/2.

### From TauCetiRoadmap.ArithmeticDynamics

Consume §4.1a's local positive top-power measures and their uniform metric continuity, §4.3's arithmetic Siu estimate, §4.3a's global-field quasi-projective adelic Picard group, metric realization, intersection and normalized heights, §4.4's equidistribution theorem, and §4.40's canonical adelic metric of a rational map of ℙ¹, which is the projective-line case of the invariant extensions of §5.1. The hypotheses for equidistribution are a nef bundle, positive geometric top degree, a generic sequence and convergence to the normalized variety height. The limiting probability measure divides curvature by that positive degree. The arithmetic normalization adapter is the degree factor in the conventions. A repeated point of a positive-dimensional variety is not generic; on Spec K the probability has mass 1; on ℙ¹, O(2) has curvature mass 2 and probability mass 1. The power map z ↦ z² has max metric and usual Weil height.

The arbitrary-base completion in Layer 1 restricts to this global-field construction; the comparison is the target §4.9, which preserves model representatives, boundary estimates, tensor products, pullbacks, the nef and integrable classes, analytic metrics by scalar pullback, local measures by scalar pushforward, intersection numbers and normalized heights. Agreement only on underlying algebraic bundles would be insufficient. Layer 2's mixed signed measures extend §4.1a by polarization and boundary limits; §4.9 identifies them with the measures of §4.4 in the nef single-bundle case.

The local measure contract from §4.1a is the positive projective top power c₁(L̄)ⁿ for one semipositive continuously metrized L, with mass Lⁿ and weak continuity under uniform semipositive approximation. Section 2.6 here constructs the mixed integrable extension by polarization and proves independence of signed decompositions, using TropicalAndBerkovichArithmetic §§6.2–6.4 at finite places and the ComplexComparisonPartII §C5.4 contract, including the singular pluripotential-products contract, at infinity. The complex integrable construction is described in yuan-zhang-2025, §2.1.1, p. 25.

**Checks.**

- Fubini–Study O(1) on ℙⁿ has top-power mass 1, and on ℙ¹ its first Chern measure is normalized area.
- At dimension zero the empty Chern product is the unit point mass.
- Rescaling a metric by a positive constant changes curvature by 0.
- The supplied positive construction gives mass 2 for standard O(2) on ℙ¹. O(−1) is outside that construction; §2.6's signed extension gives mass −1, so integrability does not imply positivity.
- An admissible curve metric has c₁(L̄) = deg(L)μₐ; this imports the normalization from GrossZagierAndArithmeticHeights §2.4 at archimedean places and TropicalAndBerkovichArithmetic §6.6 with GrossZagierAndArithmeticHeights §2.3 at nonarchimedean places.

The general equidistribution contract is the nef quasi-projective theorem at every place: a generic sequence with point heights tending to the normalized variety height converges in Galois-orbit probability to the canonical curvature probability. Its projective model case and the canonical metric of a polarized endomorphism of ℙ¹ are the corresponding imported projective and dynamical cases. (yuan-zhang-2025, Theorem 5.4.3, p. 168; demarco-mavraki-ye-2026, proof of Theorem 1.8, §4, p. 21.)

**Checks.**

- For z ↦ z² the measure and height are the supplied dynamical canonical measure and Weil height.
- On Spec K a Galois orbit is a unit point mass.
- Repeating a point on ℙ¹ is not generic, while a generic small sequence has limiting probability mass 1.

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §§0.3 and 4.11–4.12 for projective models, common domination and flattening; §§0.20–0.21 for Nagata and excellent rings, which make the normalization in §4.1 finite; §3.5 for norms of invertible sheaves along finite locally free morphisms; and §§5.1–5.3, 5.5–5.6 and 5.12 for Chow groups, degrees, first Chern classes, proper/flat operations, exterior products, intersection products and Bézout. Geometric nefness is defined in §0.1 here and geometric volume and bigness in §§0.3 and 4.2 here; the supplier states neither. In relative dimension zero the Deligne pairing is the norm of §3.5; pulling back a line by a finite flat degree-r map and taking its norm gives its r-th tensor power. The degree of the fundamental zero-cycle in §5.2 supplies the nullary geometric intersection: Spec F has degree [F:k] for every finite extension F/k, separable or inseparable. No arithmetic Green-function product is part of this algebraic contract.

What SchemeAndStackFoundations must provide (the Bertini normal-sections contract): For a geometrically normal and geometrically irreducible projective variety X of dimension at least two over an infinite field F and a very ample line bundle L on X, a dense open subset of the complete linear system of L, defined over F, consists of members whose zero locus is geometrically normal, in every characteristic (Seidenberg's hyperplane-section theorem: seidenberg-1950, Theorem 7, p. 368, applied over the algebraic closure, with the separability restriction removed in §4, and the dense open set descended to F).

This is the normality input of the induction in §8.8, and §4.13 is its home beside Serre's criterion and `bertini_smoothness`. The supplied `bertini_smoothness` assumes X smooth and asserts smoothness of the section only; it says nothing about irreducibility and nothing about a singular normal X such as the quadric cone of the §8.8 Checks.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Consume §5.1's Bertini irreducibility theorem (Jouanolou): for X geometrically irreducible of finite type over a field and a morphism g : X → ℙʳ with dim g(X) > s, the inverse image of the generic linear subspace of codimension s is geometrically irreducible. It is used in §8.8 with s = 1 and g the closed immersion given by a very ample multiple of Lₙ₋₁, for which dim g(X) = dim X ≥ 2. The passage from the generic hyperplane to a dense open set of hyperplanes is the constructibility of geometric irreducibility of fibres (stacks-irreducible-fibres, Lemma 37.27.5, Tag 0559), applied to the universal hyperplane section over the dual projective space, whose generic fibre is that generic section. For X = ℙ² and g the identity, dim g(X) = 2 > 1 and a generic line is geometrically irreducible; for a conic X ⊂ ℙ², dim g(X) = 1 is not > 1 and a generic line meets X in two geometric points, which is not irreducible: the dimension hypothesis is where the theorem stops.

### From TauCetiRoadmap.ComplexComparisonPartII

Consume §C5.4's current calculus, integration over analytic cycles, Poincaré–Lelong and closed-current extension, including its complex-orientation and Chern normalization. On ℙ¹, Fubini–Study O(1) has mass 1 and O(2) has mass 2; a constant norm change has curvature change 0.

What ComplexComparisonPartII must provide (the singular pluripotential-products contract): On possibly singular complex projective varieties, provide Bedford–Taylor products for locally bounded plurisubharmonic potentials, uniform or monotone continuity, and semipositive ample-metric regularization compatible with Chern currents and cycle integration.

This is the singular pluripotential input for Layer 0 and the mixed-measure limits; the smooth current carrier and smooth Poincaré–Lelong are included in the consumed §C5.4 contract.

### From TauCetiRoadmap.TropicalAndBerkovichArithmetic

Consume §0.1 (the Berkovich spectrum of a normed ring, points being dominated multiplicative seminorms), §0.12 (seminormed Banach rings and completion), §0.15 (completed residue fields H(x) of general Banach spectra, archimedean ones included), §0.22 (analytification of finite-type schemes over a complete nonarchimedean field, trivially valued fields included), §0.23 (hybrid analytic spaces of degenerating families), §2.7 (retraction onto the skeleton), §2.13 (refinement and valued extension: lengths are preserved under isometric extension and multiplied by the ramification index when the new uniformizer is renormalized), §3.1 (compact metric graphs with vertex genera), §3.3 (the graph Laplacian Δf = −f″ds − Σ outgoing slopes, of total mass zero, with ddᶜf = −Δf), §6.1 (formal model metrics), §6.2 (Chambert-Loir model measures and scalar-extension pushforward without an extension-degree factor), §6.3 (semipositive and integrable metrics), §6.4 (weak limits of model measures and local heights), §6.6 (the mean-zero graph Green kernel and the admissible measure μ_a = (1/g)(Σ_v g(v)δ_v + Σ_e ds/(ℓ_e + r_e))) and §§6.7–6.8 (model potentials, the curvature identity c₁(O(f)) = −i_*Δf and the admissible correction of the dualizing metric). The scheme analytification over the archimedean Banach ring (ℤ, |·|∞) is §2.1 here, glued from the §0.1 charts. For a three-unit-edge genus-two banana, resistance after deleting one edge is 1/2 and μₐ has density 1/3 on each edge. A unit loop has τ = 1/12; after ramified quadratic normalization it has τ = 1/6.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

Consume §2.2 (the Arakelov probability form μ_Ar), §2.3 (the arithmetic normalization i_*μ_ad of the admissible skeleton measure), §2.4 (archimedean admissible metrics, c₁(L̄) = deg(L)μ_Ar), §2.8 (the normalized symmetric Arakelov Green function), §2.10 (the Arakelov dualizing metric, for which every residue map is an isometry), §2.12 (the Faltings–Hriljac comparison of degree-zero admissible pairings with the Néron–Tate pairing) and §2.13 (descent of the canonical metrics at real places). These use the unsquared convention ‖1‖ = exp(−g) of the conventions above. The Green kernel has zero μₐ-mean; the residue adjunction map has norm 1. On a genus-two fibre, c₁(ωₐ) has mass 2. At a good non-archimedean place μₐ is a Dirac mass; on the unit banana it has edge density 1/3, so replacing it by the atomic model curvature is detectable.

### From TauCetiRoadmap.JacobianChallengePartII

Use §§1.2–1.4 for the relative Jacobian and principal polarization, §§2.2, 2.4–2.7 for arbitrary-degree Abel maps, the degree-one immersion and section-free difference, §§3.1, 3.3–3.13 for Poincaré, twice-theta, symmetry, relative ampleness and zero rigidification, §§4.5–4.9 for actual and axis-normalized Picard pullback torsion cokernels, §§5.1–5.2 for the canonical Abel and universal shift, and §6.3 for the Hodge-line isomorphism. Actual line bundles, their isomorphisms and their Brauer obstruction must be retained in the Picard comparisons. On an elliptic fibre Θ has degree 2, whereas Δ_J^*Poincaré has degree −2. The canonical maps are x ↦ (2g−2)x−ω and (y,x) ↦ (y,y+(2g−2)x−ω); their targets are J and J×_S J respectively. The field-valued degree-one algebraic theta formula is an input, not the relative metrized arbitrary-degree formula of Layer 9.

### From TauCetiRoadmap.JacobianChallenge

What JacobianChallenge must provide (the cube-for-products contract): The theorem of the cube for complete varieties: for complete geometrically irreducible varieties U, V, W over a field k with rational points u₀, v₀, w₀, an invertible sheaf on U × V × W whose restrictions to {u₀} × V × W, U × {v₀} × W and U × V × {w₀} are trivial is trivial (milne-av, Theorem I.5.1, p. 21). Layer E states the case of the triple product of an abelian variety, which is a special case.

The form used in §10.9a is the consequence that every invertible sheaf L on a product A × B × C of three smooth projective geometrically irreducible curves with rational points a, b, c is a tensor product of pullbacks of invertible sheaves along the three pairwise projections: twisting L by the inverses of the pullbacks of its restrictions to the three faces through (a, b, c) and by the pullbacks of its restrictions to the three coordinate curves gives a sheaf trivial on each face, hence trivial. For three curves of genus zero every invertible sheaf is O(d₁, d₂, d₃), a product of pullbacks from the factors; on E × E × E for an elliptic curve E, the pullback of O(Δ) from the first two factors restricts to O({e} × E) on {e} × E × E, and the twist by the inverse of the pullback of that restriction is what makes the face trivial.

### From TauCetiRoadmap.StableReductionPartII

What StableReductionPartII must provide (the curve-moduli and Noether-positivity contract): Provide fine smooth-curve level moduli and stable compactifications with boundary thickness, the Hodge determinant and integral and semi-canonical Noether isomorphisms, and maximal-variation Hodge positivity with descent through finite covers, including arbitrary constant fields and finite inseparable covers. The sections consumed are §4.8 (the fine smooth full-level curve scheme M₍g,N₎ over ℤ[1/N, ζ_N] with its universal curve); §5.1 (the Hodge bundle E = π_*ω of the universal stable family, whose determinant is the Hodge line λ), §5.2 (the universal boundary Cartier divisor Δ and its pullback Δ_S to a generically smooth family), §5.9 (boundary multiplicity equals node thickness), §5.19 (the integral universal Noether isomorphism 12λ ≅ ⟨ω,ω⟩ + Δ) and §5.21 (semi-canonical Noether isomorphisms, unique up to sign); and §6.1 (maximal variation), §6.2 (stable compactifications of a smooth family), §6.8 (existence of a stable compactification after a finite surjective base change with normal integral source), §6.10 (a stable compactification for the fine level family after a finite dominant cover) and §6.9 (nefness and bigness of the Hodge line of a stable family with maximal variation over a field). A node xy = t^m contributes m to Δ; an unramified extension leaves m unchanged, while a ramified degree-e extension gives em. Finite level is taken invertible on the base; varying the level covers residue characteristics 2 and 3. The universal family lives on the specified finite cover, rather than on a coarse moduli space without that data.

The same contract requires §6.22 (Hodge positivity over an arbitrary field, without perfectness or geometric integrality of the base) and §6.21 (descent of Hodge nefness and bigness through a finite surjective cover of normal integral projective schemes) for the arbitrary-field conclusion and finite inseparable covers. A relative Frobenius map of degree p multiplies curve degree by p; reduction and normalization with generic multiplicities handle nonreduced geometric base change.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Use §§3.3, 3.9–3.12: semistable identity-component base change over arbitrary DVRs, the Picard/Néron identity comparison, finite separable semistable extensions over excellent DVRs and prime-to-characteristic full-level semistability. Pullback of invariant differentials and determinant degree then scales by the extension degree. On a split Tate curve with ord(q)=n, ramification e changes the component group from ℤ/n to ℤ/en while the identity fibre remains 𝔾ₘ; full-model base change is not assumed.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Use §§2.2–2.3's chosen Weil cohomology, cycle-class maps and kernel defining homological triviality, with geometric base change over a nonclosed field. This is only the predicate on the modified diagonal; §10.10 constructs its special height without assuming a general unconditional Beilinson–Bloch height pairing.

## How to read the build

Layer 0 equips the projective model inputs with continuous metrics, Deligne pairings and volumes, using the supplied intersections and local measures. Layers 1–4 extend the adelic language from the global-field slice to arbitrary bases, then build the relative pairing, volumes and height inequalities, and identify the result with the global-field carrier in §4.9. Layers 5–6 give invariant extensions, non-degenerate height statements and Moriwaki heights. Layers 7–9 pass from local curve metrics, with local Calabi uniqueness, to canonical family bundles, the arithmetic Hodge index inequality and their theta identities. Layer 10 supplies graph bounds and their ε, φ and Noether globalizations; Layer 11 turns them into bigness. Layer 12 proves the potential-bigness criterion and transports bigness through theta maps. Layer 13 combines the local corrections and boundary coercivity into the uniform Faltings-height comparison. Each target lists the inputs needed for its statement and one proof route; a different proof may use fewer inputs. The headline statements require the adelic and curve-metric carriers developed by the roadmap, as recorded in Suggested.lean.

## Layer 0: Projective arithmetic intersection theory: the model case

ArithmeticDynamics §4.1a (local measures), §4.3 (Siu); HeightsRationalPointsAndObstructions §§5.17a–5.17f (model intersections and projective analytic inputs).

### 0.1 Continuous hermitian line bundles on projective arithmetic varieties

A projective arithmetic variety is an integral scheme X, projective and flat over Spec ℤ. A hermitian line bundle on X is a pair L̄ = (L, ‖·‖) of a line bundle L on X and a continuous metric ‖·‖ on L(ℂ) over the complex analytic space X(ℂ), invariant under complex conjugation. Its Chern current is c₁(L̄) = (1/πi)∂∂̄ log‖s‖ + δ_div(s) for any meromorphic section s. The metric is semipositive if c₁(L̄) is a positive current, and integrable if L̄ is isometric to a quotient of two semipositive hermitian line bundles. L̄ is nef if the metric is semipositive and the arithmetic degree of L̄ restricted to every closed integral curve of X (horizontal or vertical) is ≥ 0. Isometry classes form the group P̂ic(X) (tensor product), with subgroups P̂ic(X)_sm ⊂ P̂ic(X)_int; an arithmetic divisor is (D, g_D) with g_D a continuous Green function of D(ℂ) in the normalization g_D + log|f| continuous for a local equation f, and D̂iv(X) → P̂ic(X), (D, g) ↦ (O(D), ‖s_D‖ = e⁻ᵍ) induces an isomorphism from arithmetic divisor classes. Over a field k the geometric analogue is a projective k-variety with ordinary line bundles, nef meaning nonnegative degree on curves. (yuan-zhang-2025, §2.1.1–2.1.4, pp. 23–27).

*Route.* Pass from smooth to continuous metrics: the regularity condition is local on X(ℂ) through local embeddings into complex manifolds (Yuan–Zhang §2.1.1). Smooth metrics are integrable: twist by a high power of an ample bundle with a positive (pulled back Fubini–Study) metric. Semipositivity on an ample bundle agrees with Zhang's notion of uniform limits of smooth semipositive metrics, by the regularization theorem of Coman–Guedj–Zeriahi cited in Yuan–Zhang §2.1.1 (1)–(3). For X regular with smooth generic fibre and smooth metrics, (D, g) ↦ (D, 2g) identifies the arithmetic divisors here with those of ArakelovGeometryAndAbelianHeights Layer 1 §§1.8–1.9.

The basic API comprises these facts.

- A line bundle with a continuous conjugation-invariant metric on L(ℂ).
- Tensor product multiplies metrics: ‖s ⊗ t‖ = ‖s‖‖t‖; duals invert them; P̂ic(X) is an abelian group.
- Pullback along morphisms of projective arithmetic varieties, with the identity pullback law and the composition pullback law.
- c₁(L̄) = (1/πi)∂∂̄ log‖s‖ + δ_div(s), independent of s.
- The Chern current is positive, equivalently local metric weights are plurisubharmonic; positivity is tested locally, not solely by degrees on compact curves.
- Isometric to L̄₁ ⊗ L̄₂^∨ with L̄₁, L̄₂ semipositive.
- Semipositive with nonnegative arithmetic degree on every closed integral curve.
- D̂iv(X)/P̂r(X) ≅ P̂ic(X), (D, g) ↦ (O(D), e⁻ᵍ).
- On regular X with smooth generic fibre and smooth Green functions, (D, g) ↦ (D, 2g) is the inclusion into the parent Layer 1 §1.8 arithmetic divisors.
- An algebraic isomorphism is an isometry exactly when it preserves the norm of local frames at every complex point; two isometries with the same underlying map agree.

**Checks.**

- Every smooth metric on a line bundle over a projective arithmetic variety is integrable.
- On Spec ℤ, (O, e⁻ᶜ|·|) has arithmetic degree c; with Green function convention −log‖1‖ = c.
- For the principal divisor of f, the Green function here is −log|f| while the parent Layer 1 §1.8 uses −log|f|²: the comparison map doubles Green functions.
- On Spec ℤ the trivial bundle with metric ‖1‖ = eᶜ, c > 0, is semipositive but not nef: its degree is −c < 0.
- On Spec O_K a hermitian line bundle is the hermitian line bundle of the parent Layer 1 §1.1 and the arithmetic divisor class group is the compactified Picard group of §1.7 (with g_v halved).
- On Spec ℤ take norms e⁻¹ and e⁻²: tensor norm e⁻³, degrees 1+2=3; norm e gives degree −1 and is not nef.

*Needs:* ArakelovGeometryAndAbelianHeights §§1.1–1.15; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; HeightsRationalPointsAndObstructions §§5.17a–5.17f; ArithmeticDynamics §§4.1a and 4.3.

### 0.2 The metrized Deligne pairing along projective flat morphisms

Let f : X → Y be a projective flat morphism of relative dimension n between integral schemes (projective arithmetic varieties, or projective varieties over a field), and L₁, …, Lₙ₊₁ line bundles on X. The Deligne pairing ⟨L₁, …, Lₙ₊₁⟩₍X/Y₎ is a line bundle on Y, symmetric and multilinear, compatible with base change, with ⟨…, f^*M⟩ ≅ Mᵈᵉᵍ (degree of L₁···Lₙ on fibres) and with deg⟨L₁, …, Lₙ₊₁⟩ = L₁···Lₙ₊₁ when dim Y = 1. If the Lᵢ carry integrable continuous metrics then ⟨L₁, …, Lₙ₊₁⟩ carries a continuous integrable metric, equal to the fibrewise integral metric over the flat locus, with Chern current f_*(c₁(L̄₁)···c₁(L̄ₙ₊₁)), semipositive when all metrics are; the pairing of nef (resp. ample) bundles is nef (resp. ample) in the geometric case, and of nef hermitian line bundles is nef. Over a non-archimedean place the analogous model metric is defined. (yuan-zhang-2025, Theorem 4.2.3, pp. 112–113; Theorem 4.3.1, p. 113; Lemmas 4.4.1–4.4.4, pp. 121–125).

*Route.* Algebraic pairing: Deligne's construction via norms of rational sections, as recalled in Yuan–Zhang §4.2 following Muñoz García. Metric: Yuan–Zhang Theorem 4.2.3, with continuity of fibre integrals from Theorem 4.3.1 (flat case, or normal base with unique continuous extension). Positivity: Yuan–Zhang Lemmas 4.4.1–4.4.4 (degree on a curve base, nef and ample in the geometric case, arithmetic nefness).

The basic API comprises these facts.

- ⟨L₁, …, Lₙ₊₁⟩₍X/Y₎ ∈ Pic(Y), symmetric multilinear.
- In the flat case, the algebraic pairing and its metric commute with base change. For the additional normal-base finite-Tor metric extension, require the image of Y′ to meet the flat locus V and X ×_Y Y′ → Y′ to have finite Tor-dimension (Theorem 4.2.3(2)).
- ⟨L₁, …, Lₙ, f^*M⟩ ≅ M^(⊗(L₁···Lₙ)_fibre).
- The continuous integrable metric of Yuan–Zhang Theorem 4.2.3.
- c₁ of the metrized pairing is f_*(c₁(L̄₁)···c₁(L̄ₙ₊₁)).
- Pairing of nef bundles is nef; of ample bundles is ample (geometric case).
- Local rational frames with properly intersecting divisors give Deligne symbols; changing one frame by a rational function multiplies the symbol by its norm on the intersection of the remaining divisors. The inductive integral formula determines its metric.

**Checks.**

- For a finite flat f of degree r and L = O_X, ⟨L⟩ = O_Y; for L = f^*M, ⟨L⟩ = M^r.
- Over a smooth projective curve Y, deg⟨L₁, L₂⟩₍X/Y₎ = L₁·L₂ on the surface X.
- Scaling the metric of L₁ by e⁻ᶜ scales the pairing metric by e^(−c·(L₂···Lₙ₊₁)_fibre).
- For a nonflat finite-Tor morphism with normal base, the continuous metric is the extension from the flat locus, and need not equal the fibrewise integral at exceptional fibres. The flat case has no such qualification.
- For n = 0 and f finite flat, ⟨L⟩ is the norm N₍X/Y₎(L).
- For a degree-two finite flat map the norm of f*O(c) is O(2c); at c=1 its degree is 2, while the identity map gives 1.

*Needs:* §0.1; HeightsRationalPointsAndObstructions §§5.17a–5.17f; SchemeAndStackFoundations §5.3 (first Chern classes) and §3.5 (norms of invertible sheaves); ArithmeticDynamics §§4.1a and 4.3.

### 0.3 Arithmetic volume, Hilbert–Samuel formula and the Siu inequality on projective models

Use the supplied projective intersection, Hilbert–Samuel input and arithmetic Siu estimate to establish the section-count volume and its nef formulas. Let X be a projective arithmetic variety of dimension d and L̄ a hermitian line bundle. The set Ĥ⁰(X, L̄) of sections with sup-norm ≤ 1 is finite; put ĥ⁰ = log #Ĥ⁰. The limit vol^(L̄) = lim d!·ĥ⁰(mL̄)/m^d exists; L̄ is big if vol^(L̄) > 0. (1) If L̄ is nef then vol^(L̄) = L̄^d (arithmetic Hilbert–Samuel). (2) If L̄, M̄ are nef then vol^(L̄ − M̄) ≥ L̄^d − d·L̄ᵈ⁻¹·M̄ (arithmetic Siu inequality). (3) vol^ is continuous and homogeneous of degree d. (yuan-2008, Definition 2.1, p. 10; Theorem 2.2, p. 10; Theorem 2.3 and Corollary 2.4, p. 11; yuan-zhang-2025, Theorem 5.2.2 and the paragraph after it, p. 141; homogeneity and continuity, pp. 139–140 and Theorem 5.2.9, p. 148.) Over a field k, for a projective k-variety X of dimension d and a line bundle L, put h⁰(mL) = dim_k H⁰(X, mL), vol(L) = lim d!·h⁰(mL)/m^d, and call L big if vol(L) > 0. (1′) If L is nef then vol(L) = L^d (the geometric Hilbert–Samuel formula). (2′) For d ≥ 1, if L, M are nef then vol(L − M) ≥ L^d − d·Lᵈ⁻¹·M (Siu's inequality). For d = 0, X = Spec F with F/k finite, every line bundle is trivial and vol(L − M) = vol(L) = L⁰ = [F:k]; there is no mixed term. (yuan-zhang-2025, §5.2.1, p. 140; yuan-2008, §1.3, p. 6.)

*Route.* Finiteness of Ĥ⁰: a lattice intersected with a compact ball. Existence of the limit and continuity: Chen and Yuan for smooth metrics, extended to continuous metrics by uniform approximation; recalled in Yuan–Zhang §5.2 (Theorem 5.2.1 proof). Hilbert–Samuel: Gillet–Soulé arithmetic Riemann–Roch and Zhang's extension to nef, recalled in Yuan–Zhang Theorem 5.2.2 discussion. Siu inequality: Yuan 2008 Theorem 2.2 proves, for ample L̄, M̄ and any Ē, χ_sup(Ē + N(L̄ − M̄)) ≥ (L̄^d − d L̄ᵈ⁻¹M̄)N^d/d! + o(N^d); since ĥ⁰ ≥ χ_sup asymptotically (Yuan 2008 §2, with h⁰ counting ‖s‖_sup < 1, which has the same volume), vol^(L̄ − M̄) ≥ L̄^d − d L̄ᵈ⁻¹M̄ for ample L̄, M̄, and for nef ones by approximation and continuity of the volume (Moriwaki, cited in Yuan 2008 p. 8; Yuan–Zhang Theorems 5.2.2 and 5.2.9). Geometric case in dimension zero follows from dim_k H⁰(Spec F, O) = [F:k]. For d ≥ 1, (1′) is asymptotic Riemann–Roch for a nef bundle, whose higher cohomology grows like O(m^(d−1)); (2′) is Siu's theorem for ample L, M (yuan-2008, p. 6) applied to L + εA and M + εA with A ample, letting ε → 0 (yuan-zhang-2025, §5.2.1, p. 140). Dimensions of cohomology and intersection numbers are invariant under extension of k, so k need not be algebraically closed.

**Checks.**

- For L̄ = (O, e⁻ᶜ) on Spec ℤ (d = 1), ĥ⁰(mL̄) = log(2⌊eᵐᶜ⌋ + 1), so vol^ = c = L̄ when c > 0.
- For d ≥ 1, nef big A and nef B with Aᵈ⁻¹B > 0, Siu gives positive volume when 0 < ε < A^d/(d Aᵈ⁻¹B). If that mixed degree is 0, the same bound gives vol^(A − εB) ≥ A^d > 0 for every positive rational ε; no division by 0 is used.
- On Spec ℤ, c=1 gives log(2⌊e^m⌋+1)/m → 1; c=0 gives log 3/m → 0; c=−1 gives 0. With A-degree 2, B-degree 1 and ε=1 the Siu lower bound is 1.
- Over 𝔽₂, Spec 𝔽₂ and Spec 𝔽₄ have h⁰(mL)=1 and 2 for every m and every L; 0!=m⁰=1 gives volumes and empty intersections 1 and 2. Every difference L−M has the same respective volume. A unary additive pairing on Pic=0 would instead give 0 in both cases.
- Geometric case on ℙ¹ over a field (d = 1): h⁰(mO(a)) = am + 1 for a ≥ 0, so vol(O(a)) = a = deg O(a); Siu for L = O(2), M = O(1) gives vol(O(1)) ≥ 2 − 1 = 1, an equality. For the non-nef O(−1) the volume is 0, not the degree −1, so (1′) needs nefness.

*Needs:* §0.1; HeightsRationalPointsAndObstructions §§5.17a–5.17f; ArithmeticDynamics §§4.1a and 4.3; SchemeAndStackFoundations §§5.2–5.3 (degrees of products of first Chern classes, for the geometric case).

### Examples

On Spec ℤ take norms e⁻¹ and e⁻²: tensor norm e⁻³, degrees 1+2=3; norm e gives degree −1 and is not nef. On Spec ℤ, c=1 gives log(2⌊e^m⌋+1)/m → 1; c=0 gives log 3/m → 0; c=−1 gives 0. With A-degree 2, B-degree 1 and ε=1 the Siu lower bound is 1.

### Dependencies

ArakelovGeometryAndAbelianHeights §§1.1–1.15; HeightsRationalPointsAndObstructions §§5.17a–5.17f; ArithmeticDynamics §§4.1a and 4.3; SchemeAndStackFoundations §§3.5 and 5.2–5.3; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`. The internal prerequisites are the individual subsection references above.

## Layer 1: Adelic divisors and adelic line bundles

The global-field slice is ArithmeticDynamics §4.3a; the extension here keeps the fixed model/base, arbitrary k and the complex valued base.

### 1.1 Model adelic divisors of mixed coefficients

Let k be ℤ or a field and U a flat quasi-projective integral k-scheme. A projective model of U is a projective integral k-scheme X (flat over k when k = ℤ) with an open immersion U → X. Put D̂iv(X, U) = D̂iv(X)_ℚ ×₍Div(U)_ℚ₎ Div(U): pairs of an arithmetic ℚ-divisor on X (arithmetic divisors with continuous Green functions when k = ℤ; Cartier ℚ-divisors when k is a field) and an integral Cartier divisor on U with the same restriction. The group of model adelic divisors is D̂iv(U/k)_mod = colim_X D̂iv(X, U) over projective models, along pullback. It is partially ordered by effectivity (D ≥ 0 if on some model both the rational arithmetic divisor and the integral Cartier divisor on U are effective). The principal model divisors d̂iv(f), f ∈ k(U)^×, form a subgroup P̂r(U/k)_mod. (yuan-zhang-2025, §2.2 and §2.4.1, pp. 28–37; yuan-2026, §2.1, p. 18).

*Route.* Pullback along a morphism of models dominating each other is injective on D̂iv(X, U) for models integrally closed in U (Yuan–Zhang Lemma 2.3.6–2.3.7). The colimit is filtered because any two projective models are dominated by a third (closure of the diagonal).

The basic API comprises these facts.

- The image of D̂iv(X, U) for a projective model X.
- Two representatives agree iff they agree after pullback to a common dominating model.
- D ≤ D′ iff on a common model the rational arithmetic part of D′ − D and its integral restriction to U are both effective.
- The underlying integral Cartier divisor on U.
- d̂iv(f) for f ∈ k(U)^×.

**Checks.**

- For U = Spec ℤ every model divisor with zero underlying divisor is (0, c) with c ∈ ℝ (constant Green function).
- A ℚ-divisor on U with non-integral coefficient (e.g. ½[p] on Spec ℤ) is not in D̂iv(U/k)_mod.
- For U projective, D̂iv(U/k)_mod = D̂iv(U)_ℚ ×₍Div(U)_ℚ₎ Div(U) = D̂iv(U) when Div(U) is torsion free.
- Effectivity is checked on one model dominating both representatives.
- On Spec ℤ, the integral divisor [2] is allowed and ½[2] is not; (0,1)+(0,2)=(0,3).

*Needs:* §0.1.

### 1.2 The boundary norm and adelic divisors

A boundary divisor of U is a pair (X₀, E₀) of a projective model X₀ and an effective Cartier divisor E₀ supported exactly on X₀ ∖ U when k is a field, or a strictly effective arithmetic divisor E₀ whose finite part has that support when k = ℤ. For D ∈ D̂iv(U/k)_mod put ‖D‖₍E₀₎ = inf{ε ∈ ℚ₍>0₎ : −εE₀ ≤ D ≤ εE₀} (∞ if no such ε). This is a norm in the sense ‖D‖ = 0 iff D = 0, ‖D₁ + D₂‖ ≤ ‖D₁‖ + ‖D₂‖, ‖aD‖ ≤ |a|‖D‖ for nonzero integers a, and two boundary divisors give equivalent norms. The group D̂iv(U/k) of adelic divisors is the completion of D̂iv(U/k)_mod for the boundary topology; a representative Cauchy sequence (Dᵢ) satisfies −εᵢE₀ ≤ D_j − Dᵢ ≤ εᵢE₀ for j ≥ i with εᵢ → 0, and its underlying divisor on U is eventually constant (and constant after discarding an initial segment). (yuan-zhang-2025, §2.4.1 and Lemma 2.4.1, pp. 36–38; Remark 2.4.2, p. 38; yuan-2026, §2.1, pp. 18–19).

*Route.* Norm axioms and equivalence of norms: Yuan–Zhang Lemma 2.4.1, comparing E₀ and E′₀ on a common model. Underlying divisors of a Cauchy sequence are eventually constant since ‖D‖ < 1 forces the integral part on U to vanish.

The basic API comprises these facts.

- ‖D‖₍E₀₎ ∈ [0, ∞].
- ‖D‖ = 0 iff D = 0.
- Triangle inequality.
- For two boundary divisors there is r > 1 with r⁻¹‖·‖₍E₀₎ ≤ ‖·‖₍E′₀₎ ≤ r‖·‖₍E₀₎.
- The completion D̂iv(U/k), with its partial order (closure of the effective cone).
- The underlying integral Cartier divisor on U.
- The model map has dense image; every uniformly continuous homomorphism from the model group to a complete Hausdorff uniform abelian group extends uniquely to its completion. Equality in the completion means that the difference of representative Cauchy sequences tends to zero.

**Checks.**

- ‖2D‖ = 2‖D‖ when 2D ≠ 0 in Div(U) or D has zero underlying divisor.
- The scaling inequality ‖aD‖ ≤ |a|‖D‖ is strict only when the underlying divisor D̄ is nonzero (so ‖D‖ = ∞) but aD̄ = 0 in Div(U); for normal U, Div(U) is torsion free and ‖aD‖ = |a|‖D‖ for every nonzero integer a.
- On Spec ℤ with E₀ = (0, 1), ‖(0, c)‖₍E₀₎ = |c| for every real c; constants tending to zero give a nonconstant convergent sequence.
- For a nonzero boundary E₀, ‖E₀‖ = ‖−E₀‖ = 1; a divisor with nonzero integral restriction to U has norm ∞. For E₀ = 0 the norm at 0 is 0.
- If U is projective over a field, take E₀ = 0: the topology is discrete. For projective arithmetic U, take E₀ = (0, 1): the norm of (0, g) is sup|g|, while nonzero underlying divisors have infinite norm. The model divisor group is complete in both cases, for different reasons.

*Needs:* §1.1.

### 1.3 The groupoid of adelic line bundles

A rational hermitian line bundle on a projective model X is a pair (a, L̄) with a ∈ ℚ and L̄ hermitian (ordinary when k is a field); morphisms aL̄ → a′L̄′ are colim_m Isom(amL̄, a′mL̄′). An adelic line bundle on U/k is an integral line bundle L on U together with projective models Xᵢ, rational hermitian bundles L̄ᵢ on Xᵢ and isomorphisms ℓᵢ : L → L̄ᵢ|_U in Pic(U)_ℚ such that the model adelic divisors d̂iv(ℓᵢℓ₁⁻¹) form a boundary-Cauchy sequence. A morphism is an isomorphism ι : L → L′ with d̂iv(ℓ′ᵢ ι ℓᵢ⁻¹) → 0. This gives a groupoid P̂ic(U/k) with a forgetful functor to line bundles on U; isomorphism classes form the group P̂ic(U/k). Pullback along morphisms U′ → U of flat quasi-projective integral k-schemes and tensor products are defined termwise. (yuan-zhang-2025, §2.5.1–2.5.2, pp. 40–43; yuan-2026, §2.1, pp. 19–20).

*Route.* Convergence and well-definedness: Yuan–Zhang §2.5.1 and Proposition 2.5.1. Pullback: choose models of U′ over models of U; boundary divisors pull back to effective divisors bounded by a boundary divisor of U′.

The basic API comprises these facts.

- From (L, (Xᵢ, L̄ᵢ, ℓᵢ)) with boundary-Cauchy divisors.
- The underlying line bundle on U.
- Tensor product; P̂ic(U/k) is an abelian group.
- Pullback along morphisms of flat quasi-projective integral k-schemes; the identity pullback law, the composition pullback law.
- A hermitian line bundle on a projective model gives an adelic line bundle.
- Two objects are isomorphic iff some ι makes d̂iv(ℓ′ᵢιℓᵢ⁻¹) → 0.

**Checks.**

- For U projective over k, P̂ic(U/k) ≅ P̂ic(U) of Layer 0.
- On Spec ℤ, P̂ic(ℤ/ℤ) ≅ ℝ by arithmetic degree.
- The kernel of P̂ic(U/k) → Pic(U) contains O(c) for every constant c (k = ℤ).
- On U = Spec ℤ[1/p], choose an irrational real a. Rational multiples aᵢ[p] on Spec ℤ with aᵢ → a define a boundary-Cauchy adelic divisor with zero restriction to U. Its adelic line bundle cannot be represented by a rational model divisor: its p-coordinate is irrational modulo integral principal divisors. This follows from the arithmetic-curve calculation in §1.8.
- The forgetful functor is surjective on objects when U has a projective model on which L extends.
- On Spec ℤ, O(1)⊗O(2)=O(3); on Spec ℤ[1/2], coefficient √2 at [2] has irrational 2-coordinate, whereas every rational model has rational coordinate modulo ℤ.

*Needs:* §1.2; §0.1.

### 1.4 Divisor presentation of the adelic Picard group

The map D̂iv(U/k) → P̂ic(U/k), D ↦ O(D), is surjective, and its kernel is the image of the principal model divisors P̂r(U/k)_mod; thus D̂iv(U/k)/P̂r(U/k)_mod ≅ P̂ic(U/k). (yuan-zhang-2025, Proposition 2.5.1, pp. 41–42; Lemma 2.4.3, p. 39; yuan-2026, §2.1, p. 20).

*Route.* Send a Cauchy sequence (Dᵢ) to (O(D₁|_U), (Xᵢ, O(Dᵢ), ℓᵢ)). Surjectivity: choose a rational section of L and its divisors on the models. Kernel: an isomorphism O(D) ≅ O is given by a rational function f; the limit of d̂iv is then d̂iv(f) (P̂r is discrete in D̂iv: Yuan–Zhang Lemma 2.4.3).

**Checks.**

- On Spec O_K the presentation is the arithmetic-curve sequence of §1.8.
- On Spec ℤ, div(2) has finite term log 2 and Green term −log 2, giving class/degree 0; O(1) has degree 1 and is not principal.

*Needs:* §1.3.

### 1.5 Effective, strongly nef, nef and integrable adelic line bundles

An adelic divisor is effective if it is a boundary limit of effective model divisors; an adelic line bundle class is effective if it is O(D) for an effective D. An adelic line bundle is strongly nef if it is isomorphic to an object (L, (Xᵢ, L̄ᵢ, ℓᵢ)) with every L̄ᵢ nef; nef if there is a strongly nef M̄ with aL̄ + M̄ strongly nef for all integers a ≥ 1; integrable if it is a difference of two strongly nef ones. P̂ic(U/k)_snef ⊂ P̂ic(U/k)_nef are semigroups and P̂ic(U/k)_int is a group; the same words apply to adelic divisors through O(·). For divisors, strongly nef means a limit of nef arithmetic divisors on projective models. (yuan-zhang-2025, Definition 2.5.2, pp. 42–43; Definition 5.1.1, p. 133; yuan-2026, §2.1, pp. 20–21).

*Route.* Semigroup properties from the model case. Strongly nef ⇒ nef ⇒ integrable: take M̄ = L̄, resp. aL̄ + M̄ − M̄.

The basic API comprises these facts.

- Limit of effective model divisors.
- Represented by nef model bundles.
- ∃ strongly nef M̄, ∀ a ≥ 1, aL̄ + M̄ strongly nef.
- Difference of two strongly nef bundles.
- In the integral group, nef bundles are closed under addition and multiplication by nonnegative integers.
- In P̂ic(U/k)_ℚ = P̂ic(U/k) ⊗_ℤ ℚ, define the rationalized nef cone as the classes L̄/m with L̄ integral nef and m a positive integer. This cone is closed under addition and nonnegative rational scaling; rational scaling is an operation in this rationalized carrier.
- Strongly nef ⇒ nef ⇒ integrable.

**Checks.**

- For U projective, nef in this sense equals nef in Layer 0.
- On Spec ℤ, O(c) is nef iff c ≥ 0.
- The trivial adelic line bundle is strongly nef.
- O(−1) on Spec ℤ (c = −1) is integrable but not nef.
- On Spec ℤ, O(0) and O(1) are nef with degrees 0 and 1; O(−1) is integrable with degree −1 and is not nef.
- On ℙ¹ over a trivially valued field, O(1) is integral nef of degree 1. The rationalized nef class ½O(1) has degree 1/2 and has no integral preimage, since Pic(ℙ¹) = ℤ has only integer degrees. Its double is O(1); integer scaling of O(1) gives degree 2, not 1/2.

*Needs:* §1.3; §0.1.

### 1.6 Adelic line bundles over global fields and finitely generated fields

For a flat essentially quasi-projective integral k-scheme X (a filtered limit of open subschemes of quasi-projective models), put P̂ic(X/k) = colim_U P̂ic(U/k) over quasi-projective models U of X, and likewise for divisors and for the strongly nef, nef, integrable and effective parts. In particular, for K a number field (k = ℤ, B = Spec O_K) or the function field of a regular projective k-curve B, and X a quasi-projective K-variety, P̂ic(X/k) is the limit over flat quasi-projective integral B-models U with X open in U_K; an isomorphism over X represents an adelic isomorphism if it extends with its metric on a common open model. For a finitely generated field F over k the same applies to Spec F and to F-varieties. (yuan-zhang-2025, §2.3 and §2.5.3, pp. 32–36 and 43; yuan-2026, §2.1, pp. 23–25).

*Route.* Transition maps are pullbacks along open immersions of models (Yuan–Zhang §2.3, Lemmas 2.3.2–2.3.7). Positivity notions are preserved by the transition maps, so they pass to the colimit.

The basic API comprises these facts.

- P̂ic(F/k) for a finitely generated field F.
- P̂ic(U/k) → P̂ic(X/k) for a model U of X.
- P̂ic(X/k) → P̂ic(X/K) (forget the vertical/archimedean data over the base), written L ↦ L̃.
- Nef, integrable and effective classes form the colimits of the corresponding model classes.
- Two presentations give the same adelic isomorphism class precisely when their restrictions are isometrically isomorphic on a common quasi-projective model; transition maps commute with tensor product and pullback.

**Checks.**

- For X = Spec K, P̂ic(K/ℤ) ⊗ ℝ has the arithmetic degree map onto ℝ.
- If X is itself quasi-projective over k, P̂ic(X/k) is the group of §1.3.
- P̂ic(X/k) → P̂ic(X/K) is not injective: O(c) pulled back from Spec ℤ maps to 0.
- P̂ic(K/ℤ) for a number field K is the limit of P̂ic(U/ℤ) for open U ⊂ Spec O_K (§1.8).
- For Spec ℚ, O(1) has arithmetic degree 1 but geometric restriction 0; for the identity model the class O(1) remains degree 1.

*Needs:* §1.3; §1.5.

### 1.7 Adelic divisors over the archimedean base (ℂ, |·|)

For the base (ℂ, |·|) and a quasi-projective complex variety M with projective models X, take B = (Spec ℂ, {id}) and form colim_X D̂iv(X, M), where D̂iv(X, M) = D̂iv(X)_ℚ ×₍Div(M)_ℚ₎ Div(M); a representative consists of a rational model divisor with continuous Green function and a compatible integral Cartier divisor on M and complete it in the topology of a strictly positive metrized boundary (E₀, g₀). Arithmetic adelic divisors on a flat quasi-projective ℤ-scheme specialize to this group by restricting to the complex fibre, retaining both the geometric divisor and the archimedean Green function. (yuan-zhang-2025, §2.7, pp. 54–62; yuan-2026, Proof of Theorem 3.10, p. 58).

*Route.* Use the valued base scheme B = (Spec ℂ, {id}) of Yuan–Zhang §2.7.2, with mixed coefficients and boundary completion as in §§2.7.3–2.7.4. Specialization: pull back models along Spec ℂ → Spec ℤ; boundary divisors restrict to boundary divisors.

The basic API comprises these facts.

- D̂iv(M/(ℂ,|·|)).
- D̂iv(U/ℤ) → D̂iv(U_ℂ/(ℂ,|·|)).
- The Green function on M(ℂ).
- Representatives define the same complex-base adelic divisor exactly when their difference tends to zero in a common boundary topology; specialization preserves principal divisors and tensor products.

**Checks.**

- For M projective, this is the group of arithmetic divisors on M with integral Cartier divisor and continuous Green function. Its tensor product with ℚ is the rational version.
- For M a point, the group is ℝ (constant Green functions).
- A continuous function on ℂ^× growing like |log|z||² at 0 is not the Green function of a zero-underlying adelic divisor on ℂ^× ⊂ ℙ¹: the boundary norm bounds growth by a multiple of log|z|.
- A zero-underlying adelic divisor has a continuous Green function on M(ℂ), obtained by boundary-norm limits; its growth is bounded by a multiple of the boundary Green function. The growth bound alone is not asserted to characterize the image. Rationalizing the entire group is a separate operation.
- For the complex point the zero-divisor Green values 1 and 2 add to 3; on ℂ×, (log|z|)²/|log|z|| → ∞ at 0, so no fixed boundary multiple bounds it.

*Needs:* §1.2.

### 1.8 Adelic line bundles on an arithmetic curve

Let K be a number field, X = Spec O_K and U ⊂ X open. With P̂ic⁰ the kernel of the arithmetic degree, there is a canonical exact sequence 0 → (O(U)^×/μ_K) ⊗_ℤ (ℝ/ℤ) → P̂ic⁰(U) → Pic(U) → 0 and a canonical isomorphism (K^×/μ_K) ⊗_ℤ (ℝ/ℤ) ≅ P̂ic⁰(K) for P̂ic(K) = P̂ic(Spec K/ℤ). In particular P̂ic(Spec O_K/ℤ) is the compactified Picard group of ArakelovGeometryAndAbelianHeights Layer 1 §1.7. (yuan-zhang-2025, Lemma 2.6.1, p. 49).

*Route.* Write adelic divisors on U as limits of Arakelov divisors whose finite parts at primes outside U have real coefficients obtained as limits; compute the kernel of degree (Yuan–Zhang Lemma 2.6.1).

**Checks.**

- For K = ℚ: P̂ic⁰(ℚ) ≅ ⊕_p ℝ/ℤ (one copy for each prime), since ℚ^×/{±1} is free on the primes.
- For U = Spec O_K, the sequence reduces to the unit-lattice description of the compactified class group.
- For K=ℚ, O_ℚ×/{±1}=0 gives compact degree-zero Picard group 0; removing 2 gives one ℝ/ℤ coordinate; adjoining all primes gives ⊕ₚℝ/ℤ.

*Needs:* §1.6; ArakelovGeometryAndAbelianHeights §§1.1–1.15.

### 1.9 Domination by nef effective model divisors

Let X be flat essentially quasi-projective integral over k and D an adelic divisor on X. There is, on a common quasi-projective model U, a model adelic divisor D′ induced by an effective nef arithmetic divisor on a projective model of U such that −D′ ≤ D ≤ D′. In particular every adelic line bundle is dominated by a nef effective model bundle. (yuan-zhang-2025, Lemma 5.1.7(1), p. 138; yuan-2026, Remark 4.4, p. 67).

*Route.* Choose a model on which a representative of D lives; bound it above and below by multiples of an ample effective arithmetic divisor plus the boundary, then use that ample plus boundary is dominated by nef effective (Yuan–Zhang Lemma 5.1.7(1)).

**Checks.**

- For U projective, D′ must dominate D in the finite part as well as in the Green function. On Spec ℤ, D = ([2], 0) is bounded by D′ = ([2], c) for every c ≥ 0: D′ − D = (0, c) and D′ + D = (2[2], c) are effective, and deg D′ = log 2 + c ≥ 0 makes D′ nef. The ample divisor (0, c), c > 0, is not an upper bound, since (0, c) − D = (−[2], c) has a negative finite part.
- On Spec ℤ, D = (0, −1) is bounded by D′ = (0, 1), since −1 ≤ −1 ≤ 1; the candidate (0, 1/2) fails because −1/2 > −1.

*Needs:* §1.5; §1.2; §1.6.

### Examples

On Spec ℤ, the integral divisor [2] is allowed and ½[2] is not; (0,1)+(0,2)=(0,3). For K=ℚ, O_ℚ×/{±1}=0 gives compact degree-zero Picard group 0; removing 2 gives one ℝ/ℤ coordinate; adjoining all primes gives ⊕ₚℝ/ℤ.

### Dependencies

ArakelovGeometryAndAbelianHeights §§1.1–1.15. The internal prerequisites are the individual subsection references above.

## Layer 2: Berkovich analytification and metrized line bundles

The top-power projective case is ArithmeticDynamics §4.1a; the new mixed signed measure is a boundary-limit construction.

### 2.1 Global Berkovich analytification

Let k be ℤ (with the archimedean absolute value, a Banach ring) or a field with the trivial absolute value, and U a flat quasi-projective integral k-scheme. U^an = (U/k)^an is the scheme analytification over the Banach base, obtained by gluing multiplicative-seminorm charts on affine coordinate rings, bounded on the base. For a trivially valued field the restriction is trivial on nonzero base elements; the scheme construction allows arbitrary radii for the coordinate functions, rather than a single bounded affinoid spectrum. Each v has a completed residue field H_v; there is a structure map U^an → M(k). U^an is Hausdorff, path-connected and locally compact, and the fibre over a point of M(ℤ) (a place, or a power of one) is the Berkovich analytification over that complete field. (yuan-zhang-2025, §3.1, pp. 63–70; yuan-2026, §2.1, p. 21).

*Route.* On an affine chart with coordinate ring A, take the multiplicative seminorms on A bounded on k, as the union over radii of the spectra of TropicalAndBerkovichArithmetic §0.1 (with §0.12 for completion), and glue along principal opens. Completed residue fields are those of §0.15; the fibres over nonarchimedean points of M(k) are the analytifications of §0.22, and the neighbourhoods of the trivial norm are modelled on the hybrid spaces of §0.23. Topological properties: Yuan–Zhang §3.1, recalled in Yuan p. 21.

The basic API comprises these facts.

- U ↦ (U/k)^an with its map to M(k).
- H_v for v ∈ U^an.
- The fibre over v ∈ M(k) is the analytification of U ⊗ H_v.
- Morphisms of k-schemes induce continuous maps.
- Hausdorff, locally compact, path-connected.
- On an affine chart, points are equal precisely when their multiplicative seminorms agree on every regular function; pullback of an analytic point composes its seminorm with the map of coordinate rings.

**Checks.**

- (Spec ℤ/ℤ)^an is M(ℤ): the trivial norm, |·|_∞^t (0 < t ≤ 1) and |·|_p^t (0 < t ≤ ∞).
- For k a field, (Spec k/k)^an is one point.
- The fibre of (U/ℤ)^an over |·|_∞ is U(ℂ)/complex conjugation.
- U^an is not the set of closed points: for U = 𝔸¹_ℤ it contains Gauss points over every |·|_p.
- Spec k has one analytic point; the ℤ archimedean ray has |2|=2^t, giving 2 at t=1 and √2 at t=1/2, while the 2-adic point has |2|=1/2.

*Needs:* TropicalAndBerkovichArithmetic §§0.1, 0.12, 0.15, 0.22 and 0.23.

### 2.2 Analytic arithmetic divisors and continuous metrized line bundles

An arithmetic divisor on U^an is (D, g_D) with D a Cartier divisor on U and g_D continuous on U^an ∖ |D|^an such that g_D + log|f| extends continuously over V^an whenever D|_V = div(f) (the log|f| convention, not 2log|f|). A metrized line bundle on U^an is a line bundle L on U with a continuously varying norm on the one-dimensional H_v-space L ⊗ H_v at every v ∈ U^an; morphisms are isomorphisms of line bundles preserving all norms. Write D̂iv(U^an) and P̂ic(U^an). A Green function (or metric) is norm-equivariant if g(x) = t·g(x₁) whenever |·|_x = |·|₍x₁₎^t locally (0 ≤ t < ∞); Yuan–Zhang mark these with the subscript eqv. Principal arithmetic divisors are norm-equivariant, and analytifications of adelic divisors land in the norm-equivariant groups. The metric of O(D) attached to (D, g) is ‖s_D‖ = e⁻ᵍ (Yuan–Zhang §3.2, p. 72, prints e^(−g/2); the Green-function convention of §3.2 and the inverse map (div s, −log‖s‖) require e^(−g)). (yuan-zhang-2025, §3.2, pp. 71–73; yuan-2026, §2.1, p. 21).

*Route.* Definitions as in Yuan–Zhang §3.2 for metrized line bundles on Berkovich spaces.

The basic API comprises these facts.

- (D, g_D) with continuous Green function.
- L with continuous norms on L ⊗ H_v.
- Tensor product multiplies norms; inverse inverts.
- (D, g) ↦ (O(D), ‖s_D‖ = e⁻ᵍ).
- Restriction to the fibre over v ∈ M(k) gives a continuous metric on U₍H_v₎^an.
- g(x) = t·g(x₁) whenever |·|_x = |·|₍x₁₎^t.
- A line-bundle isomorphism is an isometry precisely when the norm of every local frame agrees at every analytic point; tensor and pullback preserve these comparisons.

**Checks.**

- For U = Spec ℤ and L = O, a metric is a continuous positive function on M(ℤ).
- The zero divisor with a Green function g is a continuous function on U^an.
- d̂iv(f) = (div f, −log|f|): with −log|f|² the extension condition fails at the archimedean fibre.
- For D=div(2), g∞=−log 2 and exp(−g∞)=2; using exp(−g∞/2) would give √2. A constant metric O(1) has Green value 1 at t=1 and 1/2 at t=1/2.

*Needs:* §2.1.

### 2.3 Analytification of adelic divisors and line bundles is injective and fully faithful

For k = ℤ or a field and X flat essentially quasi-projective integral over k, there are canonical injective maps D̂iv(X/k) → D̂iv(X^an), D ↦ (D, g̃_D) (g̃_D the total Green function), and from adelic divisor classes to analytic divisor classes; the functor P̂ic(X/k) → P̂ic(X^an) is fully faithful and injective on isomorphism classes. (yuan-zhang-2025, Proposition 3.3.1, p. 73; Proposition 3.4.1, p. 78; yuan-2026, §2.1, pp. 21–22).

*Route.* Projective case: model metrics are determined by their values at divisorial points (Yuan–Zhang Lemma 3.3.4). Quasi-projective case: limits of Green functions converge uniformly on compact subsets because of the boundary norm. Full faithfulness: an isomorphism of underlying bundles preserving all norms is a morphism of adelic bundles.

**Checks.**

- On Spec ℤ the Green function of O(c) equals tc at |·|_∞^t and zero on the non-archimedean rays; it is not the constant function c on all of M(ℤ).
- O(1) and O(2) on Spec ℤ have Green values 1 and 2 at the ordinary archimedean point and 0 on each p-adic ray, so the analytic realization separates them.

*Needs:* §2.2; §1.4; §1.6.

### 2.4 Density of divisorial points

Let X be flat essentially quasi-projective integral over k and U a quasi-projective model. The map X^an → U^an is continuous and injective with dense image. If k = ℤ, or k is a field and dim U > 0, the points v ∈ X^an whose absolute value on the function field F is discrete or archimedean are dense in U^an. If k is a field and dim U = 0, then U = X = Spec F with F/k finite, U^an is the single point given by the trivial absolute value of F, F has no nontrivial discrete valuation, and that trivial point is the test set used in place of the discrete points. Here a discrete point is exp(−t·ord) for a discrete valuation ord of F and any t > 0; an archimedean point (only for k = ℤ) is |σ(·)|_∞^t for an embedding σ : F → ℂ, up to complex conjugation, with 0 < t ≤ 1, the exponents for which this is still an absolute value, so that it lies over the archimedean ray of M(ℤ) (§2.1; yuan-zhang-2025, proof of Lemma 3.1.1, p. 68). For S a positive-dimensional quasi-projective variety over a trivially valued field, points given by nontrivial discrete divisorial valuations of k(S)/k are dense in S^an; in dimension zero only the trivial valuation occurs. (yuan-zhang-2025, Lemma 3.1.1(1), pp. 67–68; yuan-2026, §3.2, p. 47).

*Route.* Reduce to the generic point (Spec F)^an ⊂ U^an and prove density fibrewise over M(k) (Yuan–Zhang Lemma 3.1.1(1)).

**Checks.**

- For S = 𝔸¹ over a trivially valued field, rescaled valuations ord₍(f)₎ for irreducible f and ord_∞ give the divisorial test points; the corresponding generic-function-field valuations are dense in the Berkovich line.
- For k(t), ord₀ gives |t|=e⁻¹ and ord∞ gives |t|=e; rescaling ord₀ by a→0 gives |t|→1; Spec k has only the value 1 on k×.
- Over k = 𝔽₂, X = U = Spec 𝔽₂ has one analytic point, with |1| = 1, and no nontrivial discrete or archimedean absolute value: the set of discrete or archimedean points is empty, with empty closure, whereas U^an has one point. The test set of the dimension-zero case is that one trivial point, and both it and U^an have cardinality 1.
- On Spec ℤ the archimedean test points are |·|_∞^t with 0 < t ≤ 1: at t = 1/2, |1 + 1| = √2 ≤ 2 = |1| + |1|, while t = 2 would give |1 + 1| = 4 > 2 and is not a point of M(ℤ). The 2-adic points |·|_2^s are allowed for every s > 0, and s = 2 gives |2| = 1/4, still ultrametric.

*Needs:* §2.1.

### 2.5 Effectivity is detected by Green functions

An adelic divisor D ∈ D̂iv(X/k) is effective iff its analytification is effective. If X is normal, D is effective iff its total Green function g̃_D is ≥ 0 on X^an ∖ |D|^an. In particular, for an adelic divisor with zero underlying divisor, effectivity can be checked on the test set of §2.4: at the dense set of discrete or archimedean points when k = ℤ, or k is a field and dim U > 0, and at the single trivial point when k is a field and dim U = 0. (yuan-zhang-2025, Lemma 5.1.2, p. 134; yuan-2026, Proof of Lemma 3.5, p. 47).

*Route.* Projective case: an arithmetic divisor on a normal model with nonnegative Green function is effective. Pass to limits using the boundary norm; for zero underlying divisor apply continuity of g̃_D and density (Yuan–Zhang Lemma 5.1.2).

**Checks.**

- For S = Spec ℤ, O(c) has total Green function tc at |·|_∞^t and zero on the non-archimedean rays; it is effective iff c ≥ 0.
- For O(c) on Spec ℤ take c=−1,0,1: archimedean Green values −1,0,1 give effectivity false,true,true; all finite-place Green values are 0.

*Needs:* §2.3; §2.4; §1.5.

### 2.6 Canonical measures of integrable adelic line bundles

Extend the supplied projective positive top-power measure to signed mixed measures and to boundary-controlled quasi-projective metrics. Let K be a number field or a one-variable function field over k, X a quasi-projective K-variety of dimension n, v a place of K and L̄₁, …, L̄ₙ integrable adelic line bundles on X/k. There is a signed Radon measure dμ₍L̄₁,…,L̄ₙ, v₎ = c₁(L̄₁)···c₁(L̄ₙ) on X_v^an = X_Kv^an (the global analytic fibre over v), the limit of the Monge–Ampère (archimedean) or Chambert-Loir (non-archimedean) measures of the model metrics, positive for nef bundles. If X is projective, its total mass is the ordinary intersection number L₁···Lₙ; for projective X and nef L̄ of positive degree put dμ₍L̄,v₎ = c₁(L̄)ⁿ/(Lⁿ). On nonproper X the total mass is the geometric adelic intersection over K of §3.1, not an ordinary degree of the uncompactified algebraic bundle; that identity is the target §3.5, which is built on this subsection and on §3.1. (yuan-zhang-2025, §3.4 (end) and §3.6, pp. 78–102; Theorem 5.4.3, p. 168).

*Route.* For semipositive projective inputs, polarize the positive top powers of ArithmeticDynamics §4.1a: n! times the mixed product is the alternating sum, over subsets I of {1,…,n}, of the top powers of Σᵢ∈I L̄ᵢ, with sign (−1)^(n−|I|). At finite places use the mixed model products and semipositive limits of TropicalAndBerkovichArithmetic §§6.2–6.4; at infinity use ComplexComparisonPartII §C5.4 and the singular pluripotential-products contract for the Bedford–Taylor products on singular projective varieties (yuan-zhang-2025, §2.1.1, p. 25). Expand each integrable bundle as a difference of strongly nef bundles and prove decomposition independence by the multilinearity of these local products. Boundary estimates give convergence on compact subsets (yuan-zhang-2025, §3.6). This constructs the signed extension here; it is not an input from ArithmeticDynamics §4.1a.

The basic API comprises these facts.

- c₁(L̄₁)···c₁(L̄ₙ) on X_v^an.
- Symmetric and multilinear; expressing each integrable input as a difference of strongly nef bundles gives a signed expansion independent of every chosen decomposition.
- For projective X, total mass equals the ordinary degree L₁···Lₙ. For quasi-projective X the total mass is the target §3.5.
- Positive for nef bundles.
- For model bundles it is the Monge–Ampère or Chambert-Loir measure.
- For nef bundles the measure is the weak limit of the model measures in the boundary approximation construction; mixed integrable measures are determined by multilinearity.

**Checks.**

- For a model bundle on a smooth projective model with irreducible special fibre at a finite place v, the measure c₁(L̄)ⁿ at v is (Lⁿ)·δ_ζ, ζ the point of X_v^an given by the generic point of the special fibre.
- For X = Spec K (n = 0), the measure at each place is the Dirac measure of mass one on its unique analytic point.
- Adding O(c) pulled back from the base does not change the measure.
- For integrable but not nef bundles the measure need not be positive.
- For the canonical metric of a polarized dynamical system on ℙ¹ the measure is the canonical (equilibrium) measure of ArithmeticDynamics Layer 4.
- On ℙ¹, standard O(1) has mass 1, O(2) mass 2 and O(−1) mass −1; at good reduction these are δζ, 2δζ and −δζ. On Spec K the empty Chern product has mass 1.
- On ℙ¹×ℙ¹ with standard product metrics, O(1,0)² and O(0,1)² have mass 0, while O(1,1)² has mass 2. Polarization gives mixed mass (2−0−0)/2 = 1. For O(−1,0) against O(0,1), the decompositions O−O(1,0) and O(1,0)−O(2,0) give 0−1 = 1−2 = −1, testing both the sign and decomposition independence.

*Needs:* ArithmeticDynamics §4.1a; TropicalAndBerkovichArithmetic §§6.2–6.4; ComplexComparisonPartII §C5.4 and the singular pluripotential-products contract; §1.5; §1.6.

### 2.7 Canonical metrics over a trivially valued field

For a projective variety X over a field K with the trivial absolute value, every line bundle L has a canonical metric on X^an, the model metric of L on X itself regarded as its own model over K. This prescribed model metric is called admissible in Yuan §A.6; for the curve bundles in Layer 7 it is the specified trivial-valuation case (uniqueness refers to this model normalization, not to all continuous metrics with equal curvature), and it is used for ω_C and O(Δ) of a curve C over a trivially valued field. (yuan-2026, §A.6, p. 119; yuan-zhang-2025, §3.4.1, pp. 78–80).

*Route.* For a point x ∈ X^an, properness gives Spec O₍H_x₎ → X. A generator of L near its reduction has norm one; this is independent of the generator, since transition units have absolute value one there (Yuan–Zhang §3.4.1). Tensor product and pullback preserve this prescription. A constant rescaling violates the normalization; no general curvature uniqueness assertion is needed.

The basic API comprises these facts.

- The model metric of L on X over trivially valued K.
- Multiplicative in L.
- Compatible with pullback.
- A frame extending as a unit over a model open has norm one at analytic points whose centre lies in that open; this determines the prescribed proper-model metric and gives its tensor and pullback comparisons.

**Checks.**

- For L = O_X, ‖1‖ ≡ 1.
- On X = Spec K the metric is the trivial absolute value on the fibre.
- Multiplying by a constant c ≠ 1 does not give the canonical metric: the normalization is fixed.
- The trivial model has ‖1‖=1 and ‖2‖=1 over a trivially valued characteristic-zero field; rescaling by e changes ‖1‖ to e and violates normalization.
- A nontrivial bundle: on ℙ¹ over a trivially valued field K with coordinate t = X₁/X₀, the point given by |f| = 2^(deg f) on K[t] has |t| = 2 and centre ∞, where X₁ generates O(1), so ‖X₁‖ = 1 and ‖X₀‖ = |X₀/X₁| = 1/2; at the point with |t| = 1/2 (|f| = 2^(−ord₀ f)) the centre is 0, where X₀ generates, and ‖X₀‖ = 1. A constant metric on O(1) would give the same value at both points.
- Tensor and pullback: at |t| = 2 the section X₀² of O(2) has norm 1/4 = (1/2)²; the map φ(t) = t², with φ^*O(1) = O(2) and φ^*X₀ = X₀², sends that point to the point with |t| = 4, where ‖X₀‖ = 1/4, so ‖φ^*X₀‖ = 1/4 = ‖X₀²‖. In characteristic 2 φ is purely inseparable and the same values hold.

*Needs:* §2.2.

### Examples

Spec k has one analytic point; the ℤ archimedean ray has |2|=2^t, giving 2 at t=1 and √2 at t=1/2, while the 2-adic point has |2|=1/2. The trivial model has ‖1‖=1 and ‖2‖=1 over a trivially valued characteristic-zero field; rescaling by e changes ‖1‖ to e and violates normalization.

### Dependencies

TropicalAndBerkovichArithmetic §§0.1, 0.12, 0.15, 0.22, 0.23 and 6.2–6.4; ArithmeticDynamics §4.1a; ComplexComparisonPartII §C5.4 and the singular pluripotential-products contract. The internal prerequisites are the individual subsection references above.

## Layer 3: Intersection numbers and the adelic Deligne pairing

The global-field absolute intersection is ArithmeticDynamics §4.3a; relative Deligne pairings and the arbitrary-base extension are targets here.

### 3.1 The absolute intersection pairing of adelic line bundles

Extend the supplied model intersection and global-field pairing to fixed arbitrary bases, including finitely generated fields. Let X be flat essentially quasi-projective integral over k and d the absolute dimension of a quasi-projective model of X over k. The intersection numbers of HeightsRationalPointsAndObstructions §§5.17a–5.17b (resp. geometric ones over a field) on projective models extend, for d ≥ 1, by boundary limits to a canonical multilinear map P̂ic(X/k) × P̂ic(X/k)_intᵈ⁻¹ → ℝ, symmetric in the last d − 1 variables and in all d variables when the first is integrable. If L̄₁, …, L̄_d are nef then L̄₁···L̄_d ≥ 0. For integrable L̄₁, …, L̄_d and a morphism f : X′ → X with the same absolute dimension, f^*L̄₁···f^*L̄_d = deg(f)·L̄₁···L̄_d (deg f = 0 if f is not dominant). (yuan-zhang-2025, Proposition 4.1.1, pp. 103–104; Proposition 4.1.2, p. 105; yuan-2026, §2.1, p. 22).

For d = 0, necessarily k is a field and X = Spec F with F/k finite. Retain the zero-fold integrable intersection as deg_k[X] = [F:k], using SchemeAndStackFoundations §5.2. It has no line-bundle argument. The projection formula becomes [F′:k] = [F′:F][F:k] for a morphism Spec F′ → Spec F over k, including inseparable extensions. (yuan-zhang-2025, §4.1.1, p. 103; SchemeAndStackFoundations §5.2.)

*Route.* In dimension zero use the supplied degree of the fundamental zero-cycle. For d ≥ 1 and strongly nef L̄ᵢ represented by nef model sequences, the model intersection numbers form a Cauchy sequence: bound the change by the boundary norm times intersection numbers with E₀ (Yuan–Zhang Proposition 4.1.1). Extend by multilinearity to integrable bundles, and to one non-integrable entry by the effective-boundary estimate. Projection formula is the limit of the model projection formula (Proposition 4.1.2).

The basic API comprises these facts.

- The d-fold integrable intersection lies in ℝ for every d ≥ 0; for d = 0 it is deg_k[X]. For d ≥ 1 there is also the extension allowing one arbitrary adelic entry.
- Symmetric and multilinear on integrable bundles.
- Nonnegative on nef bundles.
- For integrable entries and a morphism of the same absolute dimension, f^*L̄₁···f^*L̄_d = deg(f)·L̄₁···L̄_d.
- Equals the model intersection number for model bundles.
- Recover the projective model intersection on model bundles; along boundary-convergent nef approximations the intersection numbers converge, and extend by multilinearity in integrable entries.

**Checks.**

- Over 𝔽₂, Spec 𝔽₂ and Spec 𝔽₄ have empty intersections 1 and 2. All their line bundles are trivial; a distinguished additive entry would incorrectly force both values to 0.
- For Spec 𝔽₄ → Spec 𝔽₂ over 𝔽₂, the empty projection formula is 2 = 2·1. The identity of Spec 𝔽₄ instead gives 2 = 1·2.
- For k=𝔽₂(t), F=k(u) with u²=t and F′=k(v) with v⁴=t and u=v², both steps in k⊂F⊂F′ are purely inseparable of degree 2. The empty projection formula is 4=2·2, rather than 1=1·1 from separable degrees.
- For X = Spec ℤ, O(c) has intersection number c.
- For f not dominant, f^*L̄₁···f^*L̄_d = 0.
- Adding O(c) from Spec ℤ to an entry adds c times the geometric adelic intersection of the other entries over ℚ. When the generic fibre is projective this is its ordinary degree.
- The pairing is not defined for arbitrary continuous metrics on U^an without boundary control: the limit uses boundary-Cauchy representatives.
- For X = Spec O_K (d = 1) the pairing is the arithmetic degree on P̂ic(K/ℤ).
- In the geometric case with X projective over k the pairing is the classical intersection number.
- On Spec ℤ the one-entry intersection O(1)=1; pulling to Spec O_K for [K:ℚ]=2 gives 2. A non-dominant equal-dimensional pullback has degree 0 and intersection 0.

*Needs:* HeightsRationalPointsAndObstructions §§5.17a–5.17b; SchemeAndStackFoundations §5.2 (degree of the fundamental zero-cycle); §1.5; §1.6.

### 3.2 The adelic Deligne pairing

Let Y be flat essentially quasi-projective integral over k and f : X → Y projective and flat of relative dimension n with X integral and Y normal. The metrized Deligne pairing of §0.2 extends to a symmetric multilinear functor f_*⟨·, …, ·⟩ : P̂ic(X/k)_intⁿ⁺¹ → P̂ic(Y/k)_int, sending strongly nef (resp. nef) bundles to strongly nef (resp. nef) bundles, and compatible with base change Y′ → Y by normal integral flat essentially quasi-projective Y′ with X ×_Y Y′ integral. For n = 0 and f finite flat it is the norm. (yuan-zhang-2025, Theorem 4.1.3, p. 106; §4.5, pp. 125–128; yuan-2026, §2.1, p. 22).

*Route.* Choose models f_i : Xᵢ → Yᵢ extending f; the model pairings of a Cauchy sequence form a Cauchy sequence for the boundary topology on Y because the pairing of a boundary-bounded divisor is boundary-bounded (Yuan–Zhang §4.5). Nefness: limit of the model statement (Lemmas 4.4.x). Base change: model base change plus Theorem 4.2.3(2).

The basic API comprises these facts.

- f_*⟨L̄₁, …, L̄ₙ₊₁⟩ ∈ P̂ic(Y/k)_int.
- Symmetric and multilinear.
- Preserves strong nefness and nefness.
- Compatible with normal base change.
- The underlying line bundle is the algebraic Deligne pairing.
- For n = 0 along a section x : Y → X (graph), ⟨L̄|₍Γ₎⟩ = x^*L̄.
- On model bundles recover the model Deligne pairing and its symbol norm; boundary limits of nef models determine the adelic pairing independently of approximations, and multilinearity gives the integrable case.

**Checks.**

- For f finite flat of degree r and L̄ = f^*M̄, ⟨L̄⟩ = rM̄.
- For Y = Spec ℤ and X projective arithmetic of dimension n + 1, deĝ f_*⟨L̄₁, …, L̄ₙ₊₁⟩ = L̄₁···L̄ₙ₊₁.
- f_*⟨L̄₁ + f^*O(c), L̄₂, …⟩ = f_*⟨L̄₁, …⟩ + (L₂···Lₙ₊₁)_fibre·O(c).
- For Y = Spec F a finitely generated field, f_*⟨L̄₁, …, L̄ₙ₊₁⟩ ∈ P̂ic(F/k) is the vector-valued height of the generic fibre (Yuan–Zhang §5.3).
- For dim Y = 1 projective over a field, the degree of the pairing is the intersection number on X.
- For a finite flat degree-two map, ⟨f*O(1)⟩=O(2); on a curve family of degree-three L, twisting the other entry by O(1) adds O(3).

*Needs:* §0.2; §3.1.

### 3.3 Composition and projection formulas for the Deligne pairing

Let ψ : X → Y and π : Y → S be projective of relative dimensions r and m between flat quasi-projective integral k-schemes, with π and π∘ψ flat and S normal; let L̄₁, …, L̄ᵣ₊₁ on X, M̄₁, …, M̄ₘ₊₁ on Y and N̄ on S be integrable. (1) If ψ is flat and Y normal, (π∘ψ)_*⟨L̄₁, …, L̄ᵣ₊₁, ψ^*M̄₁, …, ψ^*M̄_m⟩ ≅ π_*⟨ψ_*⟨L̄₁, …, L̄ᵣ₊₁⟩, M̄₁, …, M̄_m⟩. (2) π_*⟨M̄₁, …, M̄_m, π^*N̄⟩ ≅ e·N̄ with e the degree of M₁···M_m on the generic fibre. (3) For d = deg₍X_η₎(L₁···L_r) when ψ is dominant (and d = 0 otherwise): if ψ is flat and Y normal then ψ_*⟨L̄₁, …, L̄_r, ψ^*M̄₁⟩ ≅ d·M̄₁; without those extra conditions the always-defined composite pairing satisfies (π∘ψ)_*⟨L̄₁, …, L̄_r, ψ^*M̄₁, …, ψ^*M̄ₘ₊₁⟩ ≅ d·π_*⟨M̄₁, …, M̄ₘ₊₁⟩. (yuan-zhang-2025, Lemma 4.6.1, pp. 128–129; yuan-2026, Lemma 2.1–2.2 proofs, pp. 26–27).

*Route.* (1)–(3) are the limits of the model identities of Deligne pairings (Yuan–Zhang Lemma 4.6.1).

**Checks.**

- With r = 0 and ψ finite of degree d, (3) says ψ_*⟨ψ^*M̄₁⟩ = dM̄₁.
- For finite flat degrees 2 then 3, iterated norm of O(1) is O(6), equal to degree-six composite norm; for a degree-three fibre bundle ⟨L,π*O(2)⟩=O(6).

*Needs:* §3.2; §3.1.

### 3.4 Injective pullback and descent of fibrewise constant metrics

Let π : X → S be projective flat with geometrically reduced and geometrically connected fibres between flat quasi-projective integral k-schemes. (1) π^* : P̂ic(S/k) → P̂ic(X/k) is injective. (2) Assume S normal or π has a section. If L̄ is integrable on X with L ≅ π^*M and on each fibre X₍H_v₎, v ∈ S^an, the metric of L̄ is a constant multiple of the trivial metric induced by M, then M has an integrable adelic extension M̄ with π^*M̄ ≅ L̄. (yuan-2026, Lemma 2.1, pp. 25–26; stacks-pullback, Tag 0E0L, Lemma 36.32.6 (unpaginated)).

*Route.* (1) Proper flat finite presentation with geometrically reduced connected fibres gives π_*O_X = O_S universally (Stacks Tag 0E0L). The algebraic projection formula then makes Pic(S) → Pic(X) injective. Surjectivity of π^an detects equality of metrics, and full faithfulness of analytification gives the adelic assertion. Geometric connectedness alone is insufficient. (2) Define the metric of M at v by the constant; continuity and adelic convergence from the Deligne pairing ψ_*⟨A, …, A, L̄⟩ with A relatively ample, using (3) of §3.3 (Yuan Lemma 2.1).

**Checks.**

- If L̄ = π^*M̄ then the hypothesis of (2) holds with constant 1.
- Connectedness alone fails: on E : y² = x³ + 3x + 2 over 𝔽₅, Frobenius is finite flat with geometrically connected nonreduced fibres, and kills the nontrivial order-five line bundle O((1,1) − O).
- On E:y²=x³+3x+2 over 𝔽₅, the rational points are O,(1,±1),(2,±1), hence #E(𝔽₅)=5. Nonzero P=(1,1) has order 5; F*O(P−O)=O(5P−5O)=O, so geometrically nonreduced Frobenius fibres defeat integral injectivity.

*Needs:* §3.3; §2.3.

### 3.5 Total mass of the canonical measures over a global field

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k. Let X be a quasi-projective K-variety of dimension n ≥ 1, L̄₁, …, L̄ₙ integrable adelic line bundles on X/k and L̃₁, …, L̃ₙ their images in P̂ic(X/K). For every place v of K, the measure c₁(L̄₁)_v···c₁(L̄ₙ)_v of §2.6 on X_v^an has total mass L̃₁···L̃ₙ, the geometric adelic intersection number over the field K of §3.1. (yuan-zhang-2025, Lemma 5.4.4, p. 170.)

*Route.* By multilinearity reduce to n equal strongly nef entries L̄, represented by a boundary-Cauchy sequence of nef models on projective models dominating a boundary divisor. Weak convergence of the model measures (§2.6) gives the lower bound for the mass on compact subsets, and the global intersection theory bounds the mass near the boundary, so no mass escapes; the limit of the model degrees is L̃ⁿ by §3.1 (Yuan–Zhang Lemma 5.4.4).

**Checks.**

- Projective case: on ℙ¹_K, O(2) with the max metric has mass 2 at every place, equal to its degree, and on ℙ¹ × ℙ¹ the mixed product of O(1,0) and O(0,1) has mass 1 = O(1,0)·O(0,1).
- Nonproper case: on 𝔾_m ⊂ ℙ¹_ℚ the restriction of max-metrized O(1) has mass 1 at every place (the Dirac mass at the Gauss point at finite places, the uniform probability on the unit circle at infinity), both lying in 𝔾_m^an. Its underlying algebraic bundle is trivial on 𝔾_m, and O with the trivial metric has mass 0; the mass is the geometric adelic intersection, not a function of the algebraic bundle on the open variety.
- On X = Spec K the statement is excluded (n = 0); for n ≥ 1, adding a base bundle O(c) from Spec ℤ to an entry changes neither the measure nor L̃₁···L̃ₙ, since its image over K is trivial.

*Needs:* §2.6; §3.1.

### Examples

On Spec ℤ the one-entry intersection O(1)=1; pulling to Spec O_K for [K:ℚ]=2 gives 2. A non-dominant equal-dimensional pullback has degree 0 and intersection 0. On E:y²=x³+3x+2 over 𝔽₅, the rational points are O,(1,±1),(2,±1), hence #E(𝔽₅)=5. Nonzero P=(1,1) has order 5; F*O(P−O)=O(5P−5O)=O, so geometrically nonreduced Frobenius fibres defeat integral injectivity.

### Dependencies

HeightsRationalPointsAndObstructions §§5.17a–5.17b; SchemeAndStackFoundations §5.2. The internal prerequisites are the individual subsection references above.

## Layer 4: Effective sections, volumes and heights

Projective Hilbert–Samuel and arithmetic Siu are inputs; the new volume and height statements keep boundary control and arbitrary-base normalization.

### 4.1 Effective sections of adelic line bundles

For an adelic line bundle L̄ on a flat quasi-projective integral k-scheme U, Ĥ⁰(U, L̄) = {s ∈ H⁰(U, L) : ‖s(x)‖ ≤ 1 for all x ∈ U^an}. If k = ℤ this set is finite and ĥ⁰(U, L̄) = log #Ĥ⁰; if k is a field it is a finite-dimensional k-vector space and ĥ⁰ = dim_k. Effective sections correspond to effective adelic divisors: s ∈ Ĥ⁰ ∖ {0} iff d̂iv(s) ≥ 0. (yuan-zhang-2025, Definition 5.1.1 and §5.1, pp. 133–138; yuan-2026, §2.1, pp. 22–23).

*Route.* Finiteness: normalize a projective compactification and pull back sections first; for nonnormal U its normalization need not contain U as the same open subscheme, but pullback of sections is injective by dominance. By §1.9 choose an upper model divisor D̄′ on that normal model; bounded sections on U extend across the omitted prime divisors by their valuation inequalities. Hence Ĥ⁰(U,L̄) injects into the finite set (or finite-dimensional space) Ĥ⁰(X,O(D̄′)) (Yuan–Zhang Lemma 5.1.5). Normality is needed for this extension argument. Identification with effective divisors by §2.5.

The basic API comprises these facts.

- Ĥ⁰(U, L̄) ⊂ H⁰(U, L).
- Finite for k = ℤ; finite-dimensional over k a field.
- ĥ⁰ = log # (k = ℤ) or dim_k.
- Ĥ⁰(L̄)·Ĥ⁰(M̄) ⊂ Ĥ⁰(L̄ + M̄).
- If M̄ − L̄ is effective then ĥ⁰(L̄) ≤ ĥ⁰(M̄).
- A section belongs exactly when its norm is at most one at every analytic point; zero belongs, and for a nonzero section membership is equivalent to effectivity of its adelic divisor.

**Checks.**

- For O(c) with c < 0 on Spec ℤ, Ĥ⁰ = {0} and ĥ⁰ = 0.
- For k a field and a model bundle with trivial metrics on projective U, ĥ⁰ = dim H⁰(U, L).
- A section s of L with ‖s‖ > 1 at one archimedean point is not effective.
- For U = Spec ℤ and L̄ = O(c), Ĥ⁰ = {n ∈ ℤ : |n| ≤ e^c}, ĥ⁰ = log(2⌊e^c⌋ + 1).
- On Spec ℤ, c=0 gives three small sections −1,0,1 and ĥ⁰=log 3; c=1 gives five sections and log 5; c=−1 gives only 0 and log 1=0.

*Needs:* §1.3; §2.5; §1.9; §0.3; SchemeAndStackFoundations §§0.20–0.21 (finite normalization).

### 4.2 Adelic volume and bigness

For an adelic line bundle L̄ on X (flat essentially quasi-projective integral over k, absolute dimension d of a quasi-projective model) put vol^(X, L̄) = lim₍m→∞₎ d!·ĥ⁰(X, mL̄)/m^d; the limit exists and is finite, equals the limit of the model volumes for any representing sequence, and L̄ is big if vol^ > 0. Over a global field K and a quasi-projective K-variety X (with d = dim X + 1) the same holds with effective sections defined on (X/k)^an. (yuan-zhang-2025, Theorem 5.2.1, p. 141; yuan-2026, §2.1, pp. 23 and 25).

*Route.* Existence: model volumes of a boundary-Cauchy representing sequence converge, using ĥ⁰(L̄ ± εE₀) estimates and continuity of the projective volume (Yuan–Zhang Theorem 5.2.1). Global-field version: limit over models (Yuan §2.1, p. 25).

The basic API comprises these facts.

- vol^(X, L̄) ∈ ℝ₍≥0₎.
- vol^(mL̄) = m^d vol^(L̄) for m ≥ 1.
- Monotone under adding effective bundles.
- Limit of model volumes.
- vol^ > 0.
- For nef L̄ and finite surjective S′ → S, big iff the pullback is big (§4.5).

**Checks.**

- Over 𝔽₂, every line bundle on Spec 𝔽₂ or Spec 𝔽₄ has volume 1 or 2 respectively: h⁰(mL)=[F:𝔽₂], with 0!=m⁰=1. Thus the trivial bundle has positive volume in dimension zero.
- vol^(Spec ℤ, O(c)) = max(c, 0).
- vol^(O) = 0 for the trivial adelic line bundle when the absolute model dimension is positive.
- For X projective, vol^ is the arithmetic volume of §0.3.
- On Spec ℤ, O(c) with c < 0 has an algebraically big generic fibre (a point), but arithmetic volume zero. Algebraic generic bigness does not imply adelic bigness.
- On Spec ℤ, vol(O(−1))=0, vol(O(0))=0 and vol(O(2))=2; generic-fibre triviality is the same in all three cases and does not determine bigness.

*Needs:* §4.1; §0.3; §1.6.

### 4.3 Adelic Hilbert–Samuel formula and Siu inequality

Let X be flat essentially quasi-projective integral over k with absolute dimension d. (1) If L̄ is nef then vol^(X, L̄) = L̄^d; hence a nef L̄ is big iff L̄^d > 0. (2) For d ≥ 1, if L̄, M̄ are nef then vol^(X, L̄ − M̄) ≥ L̄^d − d·L̄ᵈ⁻¹·M̄. For d = 0, X = Spec F over a field k and vol^(X, L̄ − M̄) = [F:k] = L̄⁰, without a mixed term. In every dimension, if A is nef and big and B nef then A − εB is big for all sufficiently small rational ε > 0; in dimension zero this holds for every positive rational ε. The same holds over a global field with d = dim X + 1. (3) (Continuity.) For adelic ℚ-line bundles L̄, M̄₁, …, M̄_r on X, vol^(X, L̄ + t₁M̄₁ + ⋯ + t_rM̄_r) → vol^(X, L̄) as the rational numbers t₁, …, t_r tend to 0; no positivity is assumed. In particular, if L̄ is big then L̄ − εM̄ is big for every adelic M̄ and every sufficiently small rational ε > 0. (4) (Bigness from the geometric part.) Let k = ℤ and K a number field, or k a field and K a one-variable function field over k, X a quasi-projective K-variety, N̄ ∈ P̂ic(K/k) with deĝ(N̄) > 0 pulled back to X, and L̄ ∈ P̂ic(X/k) whose image L̃ in P̂ic(X/K) is big. Then L̄ + cN̄ is big on X/k for every sufficiently large rational c. (yuan-zhang-2025, Theorem 5.2.2, p. 141; Theorem 5.2.9, p. 148; Lemma 5.2.10, p. 149; yuan-2026, §1.2, p. 8; §2.1, p. 23; proof of Lemma 2.2, p. 27).

*Route.* For d = 0, dim_k H⁰(Spec F, O) = [F:k] proves the first two conclusions directly, and the volume is the constant [F:k], so (3) is trivial there. For d ≥ 1, strongly nef case of (1)–(2): limit of §0.3 along representing sequences, by §4.2. (3): bound each M̄ᵢ above and below by nef effective model bundles (§1.9) and apply the strongly nef case of (2) to the resulting differences of nef bundles (Yuan–Zhang Theorem 5.2.9). Nef case of (1)–(2): (3) applied to aL̄ + M̄₀ with M̄₀ strongly nef, a → ∞. (4): represent L̄ by an increasing boundary-Cauchy sequence of model divisors; one term already has big generic fibre, and on its projective model the sections of the big generic fibre have norms at most e^(Cm) in degree m, so twisting by cN̄ with c > C produces ≫ m^d effective sections; monotonicity of ĥ⁰ along the increasing sequence passes this to L̄ (Yuan–Zhang Lemma 5.2.10).

**Checks.**

- On Spec ℤ, vol^(O(c)) = c = O(c)^1 for c ≥ 0.
- For d ≥ 1, if A^d > 0 and Aᵈ⁻¹B > 0, then A − εB is big for 0 < ε < A^d/(d Aᵈ⁻¹B). If Aᵈ⁻¹B = 0, the Siu lower bound remains A^d for every ε > 0.
- For Spec 𝔽₂ and Spec 𝔽₄ over 𝔽₂, vol(A−B)=A⁰=1 and 2 respectively, for all A,B. Writing a mixed term with exponent d−1 at d=0 would be undefined; truncating that exponent cannot replace the empty intersection.
- For d=1 on Spec ℤ, A=O(2), B=O(1), vol(A−B)=1=2−1. For B=O(0), the mixed denominator is 0 and vol(A−εB)=2 for every ε>0.
- Continuity without positivity: on Spec ℤ, vol^(O(c)) = max(c, 0) is continuous in c, including at c = 0 where O(c) changes from big to not big; a volume that jumped to a positive value at c = 0 would contradict (3).
- (4) needs a large twist, not a small one: on ℙ¹_ℚ let L̄ be max-metrized O(1) tensored with the base bundle O(−1) of degree −1, and N̄ = O(1) on Spec ℚ over ℤ. L̃ = O(1) is ample, hence big. For 0 < c < 1 every nonzero section of m(L̄ + cN̄) with integral coefficients has sup norm at least e^(m(1−c)) > 1 at the archimedean place, so the volume is 0; for c > 1, L̄ + cN̄ is the nef max-metrized O(1) twisted by a base bundle of degree c − 1 > 0, with top self-intersection 2(c − 1) > 0, hence big.

*Needs:* §4.2; §3.1; §0.3; §1.9.

### 4.4 Positivity of Deligne pairings

Let f : X → Y be projective flat of relative dimension n between flat quasi-projective integral k-schemes, Y normal of dimension d ≥ 1. (1) If L̄₁, …, L̄ₙ₊₁ are nef and big on X then f_*⟨L̄₁, …, L̄ₙ₊₁⟩ is nef and big on Y. (2) If L̄₁ is effective integrable and L̄₂, …, L̄ₙ₊₁ and M̄₁, …, M̄₍d−1₎ (on Y) are nef, then f_*⟨L̄₁, …, L̄ₙ₊₁⟩·M̄₁···M̄₍d−1₎ ≥ 0. (yuan-2026, Lemma 2.2, pp. 26–27).

*Route.* (1) Put P = f_*⟨L̄₁, …, L̄ₙ₊₁⟩, which is nef. Choose a nef big model bundle M̄ on Y. Siu gives L̄₁ − εf^*M̄ big for small ε > 0, hence a positive multiple is effective. Pair it with the remaining nef entries to obtain a pseudo-effective Q. The projection formula gives P = Q + cM̄ with c > 0, since the remaining big bundles have positive mixed degree on the generic fibre. Compare successively P^d ≥ cM̄·Pᵈ⁻¹ ≥ ⋯ ≥ c^dM̄^d > 0; each difference pairs Q with nef entries. This avoids multiplying several merely pseudo-effective bundles (Yuan Lemma 2.2). (2) Composition formula §3.3(1) reduces to an intersection number on X of an effective bundle with nef ones, ≥ 0.

**Checks.**

- For n = 0 and f finite flat, (1) says the norm of a nef big bundle is nef big.
- For π = id, ⟨L⟩ = L. For π : ℙ¹ × S → S and L = O(1) + π^*M, bilinearity, ⟨O(1), π^*M⟩ = M (fibre degree 1, §3.3(2)) and ⟨π^*M, π^*M⟩ = 0 (fibre degree 0) give ⟨L, L⟩ = ⟨O(1), O(1)⟩ + 2M. Over a field k, ⟨O(1), O(1)⟩ is pulled back from Spec k and is trivial, so ⟨L, L⟩ = 2M; M of degree 1 gives pairing degree 2. Over S = Spec ℤ with M = O(1) of degree 1, ⟨O(1), O(1)⟩ has degree O(1)² on ℙ¹_ℤ: 0 for the max metric and 1/2 for the Fubini–Study metric, so the pairing degrees are 2 and 5/2; dropping the first summand would give 2 in both cases.

*Needs:* §3.2; §3.3; §4.3.

### 4.5 Bigness of nef bundles under finite covers

Let S′ → S be a finite surjective morphism of flat quasi-projective integral k-schemes of the same dimension. A nef adelic line bundle M̄ on S is big iff its pullback to S′ is big. (yuan-zhang-2025, Proposition 4.1.2, p. 105; yuan-2026, Proof after Remark 3.9, p. 55).

*Route.* By §4.3, bigness of a nef bundle is positivity of its top self-intersection; by the projection formula of §3.1 the top self-intersection is multiplied by deg(S′/S) > 0 under pullback.

**Checks.**

- For S′ → S of degree 2 and M̄ nef with M̄^d = 1, the pullback has (pullback)^d = 2.
- For a finite degree-two cover, a nef top intersection 3 pulls back to 6; positivity is equivalent in both directions, whereas 0 pulls back to 0.

*Needs:* §4.3; §3.1.

### 4.6 Heights of algebraic points for adelic line bundles

Give vector-valued heights over finitely generated fields and the following normalization comparison with the supplied global-field point heights. Let k = ℤ and K a number field, or k a field and K a one-variable function field over k, and X a quasi-projective K-variety. For L̄ ∈ P̂ic(X/k) and x ∈ X(K̄) with closure x̃ (Spec of the residue field K(x)) put h_L̄(x) = deĝ(L̄|_x̃)/[K(x) : ℚ] (k = ℤ) or deĝ(L̄|_x̃)/[K(x) : K] (k a field), where deĝ is the adelic intersection number on Spec K(x) over k (residue degrees over the fixed k in the geometric case). This is Yuan's normalization: in the arithmetic case Yuan–Zhang §5.3 divide by the degree over K instead, so h_YZ = [K : ℚ]·h_L̄ (Yuan p. 64 records the difference); in the geometric case the two agree. More generally, for a finitely generated field F over k and X a quasi-projective F-variety, for integrable L̄ the vector-valued height h(x) = π_*⟨L̄|_x̃⟩/deg(x) ∈ P̂ic(F/k)_ℚ, and, writing d for the dimension of a quasi-projective model of Spec F over k, for d ≥ 1 and H̄ ∈ P̂ic(F/k) satisfying the Moriwaki condition the real height h^H̄_L̄(x) = h(x)·H̄ᵈ⁻¹. h_L̄ is additive in L̄, functorial under pullback, invariant under Galois conjugation and independent of the field used to represent a point with K fixed. Under a finite extension K′/K, absolute arithmetic heights are invariant; geometric heights with degrees over the fixed k scale by [K′ : K], and for a model hermitian line bundle it is the metrized height of ArakelovGeometryAndAbelianHeights Layer 1 §1.12; for a bundle pulled back from P̂ic(K/k), h is constant: deĝ/[K:ℚ] arithmetically and deĝ geometrically. (yuan-2026, §4.1.2, pp. 63–64; yuan-zhang-2025, §5.3.1–5.3.5, pp. 152–157).

*Route.* Restriction of adelic line bundles to the closed point x̃ (pullback along Spec K(x) → X) and the degree map on P̂ic(K(x)/k). Independence of the field of definition: projection formula for Spec K′ → Spec K(x). Vector-valued heights and the Moriwaki condition: Yuan–Zhang §5.3.

For d ≥ 1 the Moriwaki condition on H̄ is automatic when d = 1. When d > 1 it means that H̄ is nef, H̄^d = 0 and its geometric restriction has positive (d−1)-st self-intersection. Over ℤ the restriction is to F/ℚ; over a field k choose and retain an intermediate field K of transcendence degree one over k and restrict to F/K. This choice is part of the geometric condition. It is used for fundamental inequalities; pairing the vector-valued height with a tuple of integrable polarization lines is defined whenever the indicated intersections exist. (yuan-zhang-2025, §5.3.5, p. 157.)

The basic API comprises these facts.

- h_L̄ : X(K̄) → ℝ.
- h₍L̄+M̄₎ = h_L̄ + h_M̄.
- h₍f^*L̄₎ = h_L̄ ∘ f.
- Galois invariant; independent of the field representing a point with K fixed. Finite base extension preserves absolute arithmetic heights and multiplies geometric heights over fixed k by its degree.
- Agrees with the metrized height of the parent Layer 1 §1.12 for model bundles.
- For max-metrized O(1) on ℙⁿ over a number field K, h_L̄ = h_K/[K:ℚ], where h_K is HeightsRationalPointsAndObstructions §0.11's relative height. Over a one-variable function field the heights agree with that supplier's fixed constant field.
- Over a number field K, the height of Yuan–Zhang §5.3 is [K : ℚ]·h_L̄.
- h(x) ∈ P̂ic(F/k)_ℚ over a finitely generated field; its scalarization h^H̄ = h·H̄ᵈ⁻¹ uses d ≥ 1 and the stated Moriwaki condition.

**Checks.**

- For F=𝔽₄ over k=𝔽₂, P̂ic(F/k)_ℚ=0, so the vector-valued height is 0. The empty intersection on Spec F is instead 2; it is not a scalarization of that vector with a negative number of polarization entries.
- For ℙ¹_ℚ, O(1) with max metrics, h([1:2]) = log 2.
- For L̄ the pullback of O(c) ∈ P̂ic(ℤ/ℤ), h_L̄(x) = c for every x: the degree on Spec O₍K(x)₎ is [K(x) : ℚ]·c.
- Over number fields, h_L̄(x) does not change after finite extension of K. Over function fields with the same constant base k, h₍L̄₍K′₎₎(x) = [K′ : K]·h_L̄(x); independence of the field representing x keeps K fixed.
- Dividing by [K(x) : K] instead of [K(x) : ℚ] over a number field gives a height that is not invariant under extension of K.
- For X = ℙⁿ_K and L̄ = O(1) with the standard metrics (max at finite places, max or Fubini–Study at infinity), h_L̄ is the absolute logarithmic Weil height up to a bounded function (equal for max metrics).
- Function-field normalization: ‖·‖_v = e^(−[k(v):k] ord_v) at places of K′.
- On ℙ¹_ℚ, [1:2] has height log 2; over a quadratic number field the relative height is 2log 2 and absolute height log 2. Over k(t), [1:t] has height 1 and over k(u), t=u², height 2.

*Needs:* §3.1; §3.2; §1.6; ArakelovGeometryAndAbelianHeights §§1.1–1.15; HeightsRationalPointsAndObstructions §0.11; Mathlib `NumberField.prod_abs_eq_one`; Mathlib `Projectivization.logHeight`.

### 4.7 The Yuan–Zhang height inequality

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k. Let π : X → S be a morphism of quasi-projective K-varieties, L̄ ∈ P̂ic(X/k), M̄ ∈ P̂ic(S/k), and L̃ the image of L̄ in P̂ic(X/K). (1) If L̄ is big on X/k, there are ε > 0 and a dense open U ⊂ X with h_L̄(x) ≥ ε·h_M̄(π(x)) for all x ∈ U(K̄). (2) If L̄ is nef on X/k and L̃ is big on X/K, then for every c > 0 there are ε > 0 and dense open U with h_L̄(x) ≥ ε h_M̄(π(x)) − c. (3) If L̃ is big, there are c, ε > 0 and U with h_L̄ ≥ ε h_M̄∘π − c. For a strict inequality outside a divisor (as needed for closed ≤ small-point sets), apply (1) to M̄ + Ā with Ā of strictly positive height. (yuan-zhang-2025, Theorem 5.3.7, p. 163; yuan-2026, Proof of Theorem 4.2, p. 65; §1.2, pp. 8–9; demarco-mavraki-ye-2026, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3)).

*Route.* (1) Continuity of the volume (§4.3(3)) gives a rational ε > 0 with vol^(L̄ − επ^*M̄) > 0, hence a nonzero effective section s of m(L̄ − επ^*M̄) for some m ≥ 1, and h₍L̄−επ^*M̄₎ ≥ 0 off div(s) (Yuan–Zhang Theorem 5.3.7). The Siu inequality of §4.3(2) gives such an ε directly only when L̄ and π^*M̄ are both nef. (2) Let N̄ ∈ P̂ic(K/k) have deĝ(N̄) = 1. For nef L̄ with L̃ big and every rational c > 0, (L̄ + cN̄)^d = L̄^d + d·c·L̃^(d−1) > 0 (d = dim X + 1, L̄^d ≥ 0 by nefness), so L̄ + cN̄ is big by Hilbert–Samuel (§4.3(1)); apply (1) and subtract c, since h₍L̄+cN̄₎ = h_L̄ + c/a_K in the normalization of §4.6 (a_K = [K : ℚ] or 1), which is absorbed by choosing c small. (3) Without nefness a small twist does not suffice: choose c sufficiently large with L̄ + cN̄ big (§4.3(4)) and apply (1). Strict version: replace M̄ by M̄ + Ā where Ā has positive height everywhere.

**Checks.**

- For X = S and π = id, (1) says a big L̄ has heights bounded below by a positive multiple of any height off a divisor.
- For X=S=ℙ¹ with standard O(1) and π=id, h([1:2])=log 2 and ε=1 gives equality; for the trivial bundle the height is 0, so it cannot dominate an unbounded base height.
- In (3) the constant c cannot be taken small in general: for L̄ = (max-metrized O(1)) ⊗ O(−1) on ℙ¹_ℚ, h_L̄ = h − 1 with h the Weil height, so h_L̄([1:1]) = −1 and every inequality h_L̄ ≥ ε h − c on a dense open set forces c ≥ 1 at the points [1:ζ] with ζ a root of unity, which are dense and have h = 0. This L̄ is not nef, so (2) does not apply to it.

*Needs:* §4.6; §4.3; §4.1.

### 4.8 The fundamental inequality over global fields

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k; X a quasi-projective K-variety of dimension n; L̄ a nef element of P̂ic(X/k)_ℚ whose image L̃ in P̂ic(X/K)_ℚ is big. Put a_K = [K : ℚ] in the arithmetic case and a_K = 1 in the geometric case. With the absolute arithmetic normalization of §4.6, h_L̄(X) = L̄ⁿ⁺¹/(a_K·(n+1)·deg L̃) and the essential minimum e₁(X, L̄) = sup_U inf₍x∈U(K̄)₎ h_L̄(x), one has e₁(X, L̄) ≥ h_L̄(X) ≥ e₁(X, L̄)/(n + 1). (yuan-zhang-2025, Theorem 5.3.3 and Lemma 5.3.4, pp. 158–159; demarco-mavraki-ye-2026, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3)).

*Route.* First inequality: Hilbert–Samuel (§4.3) gives sections of m(L̄ − t) for t < h_L̄(X), whose divisors contain all points of small height (Yuan–Zhang Lemma 5.3.4). Second inequality: successive minima argument of Zhang on a projective model, passed to the limit (Yuan–Zhang Theorem 5.3.3).

**Checks.**

- For a point (n = 0), h_L̄(X) = e₁ = h_L̄(x).
- Over a number field K and X = Spec K with O(c) pulled back from Spec ℤ, L̄¹ = [K : ℚ]c, deg L̃ = 1 and both h_L̄(X) and e₁ equal c. Omitting a_K would contradict the point case whenever [K : ℚ] > 1 and c ≠ 0.
- For X=Spec K, [K:ℚ]=2 and O(1), raw intersection 2 divided by 2·1·1 gives h(X)=1=e₁; omitting the factor gives 2≤1, false.

*Needs:* §4.6; §4.3.

### 4.9 Comparison with the global-field adelic carrier

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k, and let X be a quasi-projective K-variety of dimension n. Write P̂ic_AD(X) for the quasi-projective adelic Picard group of ArithmeticDynamics §4.3a. The identity on projective model data (a projective model over O_K, or over the regular projective k-curve with function field K, a rational hermitian or model line bundle on it, and the boundary topology of a boundary divisor) induces a group isomorphism ι_X : P̂ic_AD(X) → P̂ic(X/k) onto the group of §1.6, with the following properties. (1) ι_X preserves underlying line bundles, commutes with tensor product and with pullback along morphisms of quasi-projective K-varieties, and maps the nef and the integrable classes of ArithmeticDynamics §4.3a onto those of §§1.5–1.6. (2) At every place v write K_v for the completion and C_v for its completed algebraic closure, and let p_v : X_Cv^an → X_Kv^an be the scalar-restriction projection. Identify X_Kv^an with the fibre of (X/k)^an → (Spec K/k)^an over the specified normalized place v. At a real place X_Kv^an = X(ℂ)/conjugation and p_v is the quotient map; at a complex place it is the identity. The local metric attached to L̄ by ArithmeticDynamics §4.3a, on X_Cv^an, equals the pullback by p_v of the fibre metric of ι_X L̄. For a projective X and a semipositive local metric, the pushforward by p_v of the positive top power supplied by ArithmeticDynamics §4.1a equals the top power of §2.6. Polarizing and taking signed differences as in §2.6 gives the same pushforward identity for mixed integrable products, independently of the decompositions. These metric and measure comparisons persist through boundary-controlled quasi-projective limits. For a nef bundle with positive geometric top degree, divide both measures by that degree; the pushforward then identifies the probability of ArithmeticDynamics §4.4 with §2.6's probability. (3) For integrable L̄₀, …, L̄ₙ, the intersection number of ArithmeticDynamics §4.3a is (ι_X L̄₀ ··· ι_X L̄ₙ)/a_K, the intersection number of §3.1 divided by a_K = [K : ℚ] in the arithmetic case (the normalization of its supplier HeightsRationalPointsAndObstructions §5.17b) and by a_K = 1, with residue degrees over k, in the geometric case. (4) The normalized point heights and subvariety heights of ArithmeticDynamics §4.3a are those of §§4.6 and 4.8 for ι_X L̄. (yuan-zhang-2025, §2.3 and §2.5.3, pp. 32–36 and 43–44; §5.3.1, p. 152; yuan-2026, §4.1.2, pp. 63–64.)

*Route.* Both groups are colimits over the same projective models of model groups completed in a boundary topology given by −εD ≤ E ≤ εD for a boundary divisor D on a common dominating model, and both topologies are independent of the boundary divisor (ArithmeticDynamics §4.3a; §1.2). The identity on model data is therefore a uniformly continuous isomorphism of model groups in both directions and extends to the completions (§1.2). On model data the metric comparison is pullback along p_v; finite-place measures compare by TropicalAndBerkovichArithmetic §6.2's scalar-extension pushforward, with no extension-degree factor. At real places invariant norms descend along the conjugation quotient, as in GrossZagierAndArithmeticHeights §2.13, and the measure downstairs is the pushforward of the complex measure. Uniform semipositive limits preserve the top-power comparison; §2.6's polarization and decomposition independence give the mixed integrable comparison. Boundary approximation, with the convergence of §2.6 and the mass control of §3.5, gives the quasi-projective comparison. On model data the two intersection numbers are the projective intersection of HeightsRationalPointsAndObstructions §§5.17a–5.17b up to a_K; boundary continuity and the height formulas give (3)–(4).

**Checks.**

- On ℙ¹ over ℚ, standard O(1) with max metrics at every place has the same metric after pullback along p_v, self-intersection 0 on both sides and h([1:2]) = log 2 on both sides. Agreement of underlying algebraic bundles alone would not separate it from O(1) with the Fubini–Study metric at infinity, whose self-intersection on ℙ¹_ℤ is 1/2.
- Over a quadratic number field K and X = Spec K, O(1) pulled back from Spec ℤ has §3.1 degree 2 and normalized degree 2/a_K = 1 on the side of ArithmeticDynamics §4.3a; both sides give point height 1. Omitting a_K would make the two variety heights differ by the factor 2.
- Over k(t), with model O(1) on ℙ¹, the moving point t has height 1 and a constant point has height 0 on both sides.
- For ℙ¹/ℚ at the real place, i and −i are distinct in ℙ¹(ℂ) but have one image q under p_v. The pushforward of (δ_i + δ_−i)/2 is δ_q, of mass 1; multiplying the upstairs measure by 2 gives mass 2 downstairs, so projection does not supply probability normalization. For the constant metric O(1), the norm of its frame is e⁻¹ upstairs and after pullback from downstairs.
- Standard O(2) has positive curvature mass 2 on both sides of p_v and probability mass 1 after division by 2. O(−1) has signed mass −1 under the owned §2.6 extension, and has no semipositive input in ArithmeticDynamics §4.1a. On ℙ¹×ℙ¹, polarizing O(1,0) and O(0,1) gives (2−0−0)/2 = 1; replacing the first input by O(−1,0) gives −1, testing the mixed signed comparison.

*Needs:* ArithmeticDynamics §§4.1a, 4.3a and 4.4; TropicalAndBerkovichArithmetic §§6.2–6.4; GrossZagierAndArithmeticHeights §2.13; HeightsRationalPointsAndObstructions §§5.17a–5.17b; §1.2; §1.5; §1.6; §2.3; §2.6; §3.1; §3.5; §4.6; §4.8.

### Examples

On Spec ℤ, c=0 gives three small sections −1,0,1 and ĥ⁰=log 3; c=1 gives five sections and log 5; c=−1 gives only 0 and log 1=0. For X=Spec K, [K:ℚ]=2 and O(1), raw intersection 2 divided by 2·1·1 gives h(X)=1=e₁; omitting the factor gives 2≤1, false.

### Dependencies

ArakelovGeometryAndAbelianHeights §§1.1–1.15; HeightsRationalPointsAndObstructions §§0.11 and 5.17a–5.17b; ArithmeticDynamics §§4.1a, 4.3a and 4.4; TropicalAndBerkovichArithmetic §§6.2–6.4; GrossZagierAndArithmeticHeights §2.13; SchemeAndStackFoundations §§0.20–0.21; Mathlib `NumberField.prod_abs_eq_one`; Mathlib `Projectivization.logHeight`. The internal prerequisites are the individual subsection references above.

## Layer 5: Equidistribution, invariant extensions and the adelic Hodge bundle

Quasi-projective equidistribution is ArithmeticDynamics §4.4; through the comparison of §4.9 it is used for the non-degenerate and invariant-family statements.

### 5.1 Invariant adelic extensions of polarized dynamical systems

Let S and X be flat essentially quasi-projective integral schemes over k, π : X → S projective flat with geometrically connected fibres, f : X → X an S-morphism and L ∈ Pic(X)_ℚ with f^*L = qL for a rational q > 1; integrality of X is part of the hypothesis, since P̂ic(X/k) of §§1.3 and 1.6 is defined for integral X only. A polarized dynamical system over S is such a triple (X, f, L) with L relatively ample over S. (1) There is a unique L̄_f ∈ P̂ic(X/k)_ℚ with underlying L and f^*L̄_f = qL̄_f, and f′^*L̄_f = q′L̄_f for every f′ commuting with f with f′^*L = q′L and q′ ≠ 0 (Yuan–Zhang Theorem 6.1.2). (2) If L is relatively ample over S, so that (X, f, L) is a polarized dynamical system, L̄_f is the boundary limit of the Tate sequence q⁻ⁿ(f^n)^*L̄₀ for any model L̄₀; it is nef, strongly nef when S has an affine model, and lies in P̂ic(X/k) when L ∈ Pic(X), q ∈ ℤ₍>1₎ and f^*L ≅ qL integrally (Theorem 6.1.1). (3) For an abelian scheme A → S and a line bundle L rigidified along the zero section with [−1]^*L ≅ εL, ε = ±1, there is a unique adelic extension with [2]^*L̄ = 4L̄ (ε = 1) or 2L̄ (ε = −1); it is integrable and [m]^*L̄ = m²L̄ (resp. mL̄) for all m (Theorem 6.1.3); for symmetric relatively ample L it is the nef extension of (2) with f = [2]. (yuan-zhang-2025, Theorems 6.1.1–6.1.3, pp. 180–184; the hypotheses of Theorem 6.1.2; yuan-2026, §2.3, p. 33; Theorem 2.10(3) proof, pp. 38–39; demarco-mavraki-ye-2026, §4, pp. 19–20 (arXiv v3)).

*Route.* Choose a boundary divisor; the divisor of the isomorphism ℓ : L → q⁻¹f^*L is bounded by rπ^*E₀, so the Tate sequence is boundary-Cauchy with geometric rate q⁻ⁿ (Yuan–Zhang Theorem 6.1.1). Uniqueness: two invariant extensions differ by a vertical bundle V with f^*V = qV and boundary-bounded, forcing V = 0 by injectivity of analytification (Theorem 6.1.2). Nefness: limit of nef model bundles after twisting by the pullback of an ample bundle on a model of S.

The basic API comprises these facts.

- L̄_f with underlying L and f^*L̄_f = qL̄_f.
- Unique with these properties.
- Nef when L is relatively ample; strongly nef over an affine base.
- For a rigidified L on an abelian scheme with [−1]^*L ≅ ±L, the integrable extension with [2]^*L̄ = 4L̄ or 2L̄.
- If f′f = ff′ and f′^*L = q′L with q′ ≠ 0, then f′^*L̄_f = q′L̄_f.
- Compatible with base change of S.
- h₍L̄_f₎ is the Call–Silverman canonical height fibrewise.

**Checks.**

- For f(z) = z² on ℙ¹_K, L̄_f is O(1) with the max metric and h₍L̄_f₎ is the Weil height.
- For L = O_X the invariant extension is the trivial adelic bundle.
- For an abelian scheme with symmetric L and [n], [n]^*L̄ = n²L̄.
- For an elliptic scheme, rigidify O(e) by tensoring with π*(e*O(e))∨; its canonical extension computes the fibrewise Néron–Tate height. The unnormalized O(e) need not have trivial zero pullback.
- For z↦z², max(1,|z²|)=max(1,|z|)² and the canonical height of 2 is log 2. For f=id,q=1, O(1) and O(2) are both invariant, so uniqueness fails.
- Integrality of X is needed for the carrier, not only for the conclusion: X = ℙ¹ over ℚ[ε]/(ε²) with π the structure map to S = Spec ℚ and f induced by z ↦ z² is projective and flat over S with geometrically connected fibres and has f^*O(1) = 2·O(1), but ε ≠ 0 with ε² = 0, so X is not integral and P̂ic(X/k) is not defined for it. The integral ℙ¹_ℚ with the same f and L is admitted and gives canonical height log 2 at z = 2.

*Needs:* §1.3; §1.5; §1.6; §2.3; ArithmeticDynamics §4.40.

### 5.2 Non-degenerate subvarieties and non-degenerate adelic line bundles

Let K be a number field, S a quasi-projective K-variety, (X, f, L) a polarized dynamical system over S, Y ⊂ X a closed subvariety, M = L̄_f|_Y ∈ P̂ic(Y/ℤ)₍ℚ,nef₎ and M̃ its image in P̂ic(Y/K)₍ℚ,nef₎ (the geometric part over K). Y is non-degenerate if deg M̃(Y) = M̃^(dim Y) > 0, equivalently M̃ is big on Y/K, equivalently the local curvature measure c₁(L̄_f)^(dim Y) on the analytification of Y is nonzero for one (every) embedding σ : K → ℂ (Yuan–Zhang Lemma 5.4.4), and the same at non-archimedean places. For an abelian scheme over a smooth complex base this is the full-rank condition for the local real-analytic Betti map, defined by expressing points in a locally flat symplectic basis of the period local system: its real rank is 2 dim Y at some point. More generally a nef adelic M̄ on Y is non-degenerate if M̃ is big on Y/K. Non-degeneracy is not bigness of M on Y/ℤ: a non-degenerate Y can carry a generic sequence of small points, and then M^(dim Y + 1) = 0. For an abelian scheme A → S and a generically finite ι : Y → A, non-degeneracy of ι does not depend on the symmetric relatively ample rigidified L. (yuan-zhang-2025, §6.2.2, p. 188; Lemma 5.4.4, p. 170; demarco-mavraki-ye-2026, §4, p. 20 (arXiv v3; citing Yuan–Zhang Lemma 5.4 and §6.2.2)).

*Route.* M̃ is nef, so deg M̃(Y) > 0 iff M̃ is big (geometric Hilbert–Samuel, §4.3 over K). deg M̃(Y) equals the total mass of c₁(L̄_f)^(dim Y) on Y_σ(ℂ) (§3.5, Yuan–Zhang Lemma 5.4.4); for abelian schemes this form is the Betti form, whose top power is nonzero iff the Betti map has full rank (the Betti-form comparison in Yuan–Zhang §6.2.2, p. 188). Independence of L: Betti forms of two relatively ample bundles bound each other by positive constants.

The basic API comprises these facts.

- deg M̃(Y) > 0 for the geometric part M̃ of L̄_f|_Y.
- Iff M̃ is big on Y/K.
- Iff c₁(L̄_f)^(dim Y) restricted to Y_σ(ℂ) is nonzero.
- Independent of the symmetric relatively ample L.
- Preserved under generically finite dominant maps of the source.

**Checks.**

- Over S = Spec K every closed subvariety Y is non-degenerate: deg M̃(Y) = deg_L(Y) > 0. In particular X = A itself is non-degenerate although h₍L̄₎(A) = 0, so M^(dim Y+1) = 0 and M is not big on Y/ℤ.
- A torsion section of an abelian scheme over a curve is degenerate: the Betti map is constant on it, so deg M̃(Y) = 0.
- For a constant family A₀ × S → S over a positive-dimensional S and Y = Z₀ × S with Z₀ ⊂ A₀ of positive dimension, Y is degenerate: the Betti map factors through Z₀, so its rank is at most 2 dim Z₀ < 2 dim Y.
- In A₀×S with dim A₀=1,dim S=1, the Betti rank of A₀×S is 2<4, so its degree in dimension 2 is 0; a torsion section over a curve has rank 0<2 and degree 0.

*Needs:* §5.1; §4.2; §4.3; §2.6; §3.5.

### 5.3 Height inequality and equidistribution on non-degenerate subvarieties

Let S be a quasi-projective variety over a number field K, (X, f, L) a polarized dynamical system over S, Y ⊂ X a non-degenerate closed subvariety and B̄ ∈ P̂ic(S)_ℚ. (1) For every c > 0 there are ε > 0 and a dense open U ⊂ Y with h₍L̄_f₎(y) ≥ ε·h_B̄(π(y)) − c on U(K̄). (2) If {y_m} is a generic sequence in Y(K̄) with h₍L̄_f₎(y_m) → 0, then for every place v the Galois orbits equidistribute for dμ₍L̄_f|_Y, v₎. (yuan-zhang-2025, Theorems 6.2.2 and 6.2.3, pp. 188–189; demarco-mavraki-ye-2026, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3)).

*Route.* (1) is §4.7(2) for Y → S and L̄_f|_Y (Yuan–Zhang Theorem 6.2.2). (2) The existence of the sequence forces h(Y) = 0 by the fundamental inequality §4.8 (heights of the nef L̄_f|_Y are ≥ 0, so e₁ = 0). Transport L̄_f|_Y to the carrier of ArithmeticDynamics §4.3a by §4.9, apply ArithmeticDynamics §4.4 (Yuan–Zhang Theorem 6.2.3), and push the orbit probabilities and their limit forward along p_v of §4.9(2) to obtain the measure of §2.6 on the global analytic fibre.

**Checks.**

- For an abelian scheme this is Kühne's relative equidistribution conjecture (Yuan–Zhang p. 189).
- For a constant abelian variety over a point, generic torsion has height 0 and limiting Haar mass 1; repeating 0 on a positive-dimensional variety has height 0 but is not generic.

*Needs:* §5.2; §4.7; §4.8; §4.9; ArithmeticDynamics §4.4.

### 5.4 The adelic Hodge bundle of a family of curves

Let S be quasi-projective, flat and integral over ℚ or ℤ and π : X → S a smooth relative curve of genus g > 1. The Hodge line λ_S = det(π_*ω₍X/S₎) with the determinant L² metric (‖β‖²_nat = (i/2)∫₍X_s₎ β ∧ β̄ on π_*ω) extends to an adelic line bundle λ̄_S on S/ℤ. Through the canonical isomorphism λ_S ≅ det(e^*Ω¹₍J/S₎) (JacobianChallengePartII §6.3) the determinant L² metric equals the Faltings metric ‖α‖²_Fal = (i^(g²)/2^g)∫₍J_s₎ α ∧ ᾱ (Szpiro), so h₍λ̄_S₎(s) = h_Fal(X_s), the stable Faltings height of the Jacobian in Faltings' normalization, for s ∈ S(ℚ̄). (yuan-zhang-2025, Theorem 5.5.1, p. 175; yuan-2026, Lemma 3.4, pp. 43–44).

*Route.* Comparison of metrics: Szpiro Lemme 3.2.1 as cited in Yuan Lemma 3.4, on the canonical isomorphism of JacobianChallengePartII §6.3. Adelic extension: Yuan–Zhang Theorem 5.5.1 constructs ω(S) with Faltings metric on an abelian scheme from the minimal compactification of the Siegel moduli (pullback of the ample Hodge bundle with its logarithmically singular metric, the parent Layer 5 §§5.0b, 5.3–5.4). Height identity: Yuan–Zhang Theorem 5.5.1 (h = h_Fal), with Faltings normalization from the parent Layer 2 §2.7.

The basic API comprises these facts.

- λ̄_S ∈ P̂ic(S/ℤ) with underlying det π_*ω.
- Archimedean metric = determinant L² metric = Faltings metric.
- h₍λ̄_S₎(s) = h_Fal(X_s) (Faltings normalization).
- Compatible with base change of S.
- Its algebraic line is det e^*Ω¹ of the abelian scheme, identified with the relative curve Hodge determinant through JacobianChallengePartII §6.3; its analytic metric and model extensions are those of Yuan–Zhang Theorem 5.5.1, adjusted to the stated Faltings normalization.

**Checks.**

- With the Deligne metric (2π)⁻ᵍ|∫α∧ᾱ| the height is h_Fal + (g/2) log π.
- For S = Spec O_K[1/N] and a single curve, the adelic degree of λ̄_S at Spec K is [K : ℚ]h_Fal; its absolute point height is h_Fal.
- λ̄_S is in general not a model hermitian bundle on any projective model of S: the metric has logarithmic singularities along the boundary of moduli.
- For g = 0 nothing is defined; for an elliptic family (g = 1, outside the hypothesis) the analogous statement is the parent Layer 5 §5.9.
- For [K:ℚ]=2 and stable height h, degree λ̄=2h and absolute height h; changing to Deligne raises h by (g/2)log π, not g log π.

*Needs:* JacobianChallengePartII §6.3; StableReductionPartII §5.1; ArakelovGeometryAndAbelianHeights §§2.1, 2.7–2.8; ArakelovGeometryAndAbelianHeights §3.4; ArakelovGeometryAndAbelianHeights §§5.0b, 5.3–5.4; §1.3; §4.6.

### Examples

For z↦z², max(1,|z²|)=max(1,|z|)² and the canonical height of 2 is log 2. For f=id,q=1, O(1) and O(2) are both invariant, so uniqueness fails. For [K:ℚ]=2 and stable height h, degree λ̄=2h and absolute height h; changing to Deligne raises h by (g/2)log π, not g log π.

### Dependencies

ArithmeticDynamics §§4.4 and 4.40; JacobianChallengePartII §6.3; StableReductionPartII §5.1; ArakelovGeometryAndAbelianHeights §§2.1, 2.7–2.8; ArakelovGeometryAndAbelianHeights §3.4; ArakelovGeometryAndAbelianHeights §§5.0b, 5.3–5.4. The internal prerequisites are the individual subsection references above.

## Layer 6: Moriwaki heights over finitely generated fields

### 6.1 Moriwaki polarizations and Moriwaki heights

Let k₀ be a finitely generated field over ℚ of transcendence degree d. A polarization B = (B; H̄₁, …, H̄_d; τ) consists of a normal projective flat integral ℤ-scheme B, nef smooth hermitian line bundles H̄ᵢ on B and an isomorphism τ : ℚ(B) ≅ k₀. For a projective k₀-variety X and a line bundle L on X, the Moriwaki height h^B₍k₀,X,L₎ : X(k̄₀) → ℝ is defined modulo bounded functions by h(P) = deĝ(ĉ₁(L̄)·ĉ₁(f^*H̄₁)···ĉ₁(f^*H̄_d)·[Δ_P])/[k₀(P) : k₀] for a model (X → B, L̄) and the closure Δ_P of P; it equals the Yuan–Zhang vector-valued height of §4.6 paired with H̄₁···H̄_d. B is big if every H̄ᵢ is nef and big. For a field isomorphism ι : k₀ → k′₀ and B′ = (B; H̄; ι∘τ), h^(B′)₍k′₀₎ ∘ ι = h^B₍k₀₎. For d = 0 (k₀ a number field, B = Spec O₍k₀₎) it is [k₀ : ℚ] times the absolute Weil height class. The displayed denominator is relative to k₀, as in Moriwaki and Yuan–Zhang; division by [k₀ : ℚ] is needed to compare with §4.6. (moriwaki-2000, §3.1–3.3, §3.3.6, pp. 10–14; gao-habegger-2019, §A.1, (A.1), pp. 54–55; yuan-zhang-2025, §5.3.3, p. 155; §5.3.5, pp. 156–157).

*Route.* Independence of the model up to O(1): Moriwaki Corollary 3.3.5. Identification with the Yuan–Zhang height h^(H̄)_L̄ over F = k₀ (Yuan–Zhang §5.3.5, Moriwaki condition).

The basic API comprises these facts.

- (B; H̄₁, …, H̄_d; τ).
- All H̄ᵢ are nef; the polarization is big precisely when every H̄ᵢ is also big.
- h^B_L as a class in HeightClass(X(k̄₀)) (HeightsRationalPointsAndObstructions Layer 0).
- Equals the Yuan–Zhang height h^(H̄)₍L̄₎ for a model L̄.
- h^(B′)₍k′₀₎ ∘ ι = h^B₍k₀₎ for ι : k₀ ≅ k′₀.
- For d = 0 it is [k₀ : ℚ] times the absolute logarithmic Weil height class, with the denominator in this node.

**Checks.**

- h^B₍O_X₎ = O(1).
- For k₀ = ℚ(t) and the automorphism t ↦ t + 1, transporting B gives the same height function after composing with ι.
- If H̄₁ is the trivial bundle with trivial metric (not big), then h^B_L ≡ 0 up to O(1) for every L, so Northcott fails for ℙ¹ over k₀ = ℚ(t).
- For k₀ = ℚ (d = 0) and X = ℙⁿ, L = O(1): h^B_L = h + O(1), the Weil height (Moriwaki Proposition 3.3.7(1) with Proposition 3.3.2).
- The arithmetic model is projective and normal, as in Moriwaki §3.1; a quasi-projective presentation as in Gao–Habegger §A.1 needs projective extension data before the displayed arithmetic intersection is defined.
- For ℚ(t) with H̄=O and trivial metric, every intersection defining the polarized height is 0; over ℚ the polarization tuple is empty and [1:2] has height log 2.

*Needs:* §4.6; HeightsRationalPointsAndObstructions §§5.17a–5.17b; HeightsRationalPointsAndObstructions §0.16.

### 6.2 The height machine for Moriwaki heights

With k₀, B, X as in §6.1: (1) h^B₍L⊗M₎ = h^B_L + h^B_M; (2) for a quasi-finite morphism q : X → Y of projective k₀-varieties and M on Y, h^B₍q^*M₎ = h^B_M ∘ q; (3) h^B_L is bounded below off the stable base locus of L, and bounded when L = O_X; (4) (Northcott) if L is ample and B is big, {P ∈ X(k̄₀) : h^B_L(P) ≤ C, [k₀(P) : k₀] ≤ D} is finite for all C, D; (5) if L and M are algebraically equivalent and L is ample, then h^B_M(P)/h^B_L(P) → 1 as h^B_L(P) → ∞. (moriwaki-2000, Proposition 3.3.7, p. 15; Theorem 4.3, p. 20; gao-habegger-2019, Proposition A.1, p. 55).

*Route.* (1), (3), (4): Moriwaki Proposition 3.3.7(2)–(4), (4) proved in Moriwaki §4 (Theorem 4.3). (2): Wazir Proposition 2(iv) as cited by Gao–Habegger (the smoothness assumption there is unnecessary; q generically finite suffices in Moriwaki Proposition 1.3(2)). (5): Gao–Habegger Proposition A.1(5) and its proof remark (gao-habegger-2019, p. 55), which run the classical algebraic-equivalence argument for Weil heights with Moriwaki heights in their place.

**Checks.**

- For d = 0 it reduces to Weil's height machine of HeightsRationalPointsAndObstructions Layer 0.
- On ℙ¹_ℚ, for n≥1, h_O(1)([1:n])=log n and h_O(2)=2log n, h_O=0; for a nonbig zero polarization all n have height 0 and degree 1, giving an infinite bounded set.

*Needs:* §6.1; HeightsRationalPointsAndObstructions §0.16.

### 6.3 The Moriwaki Néron–Tate height

Let A be an abelian variety over k₀ and L a symmetric ample line bundle. The limit ĥ^B_L(P) = lim 4⁻ⁿ h^B_L([2ⁿ]P) exists for P ∈ A(k̄₀), is independent of the representative of h^B_L, is quadratic (ĥ^B_L([N]P) = N²ĥ^B_L(P)), ≥ 0, and vanishes on torsion; if B is big then ĥ^B_L(P) = 0 iff P is torsion. For k₀ a number field it is [k₀ : ℚ] times the usual absolute Néron–Tate height, with the relative Moriwaki normalization of §6.1. It equals the height of the invariant extension L̄₍[2]₎ of §5.1 paired with H̄₁···H̄_d. (moriwaki-2000, Propositions 3.4.1–3.4.2, p. 16; gao-habegger-2019, (A.2) and Proposition A.2, pp. 55–56).

The basic API comprises these facts.

- The displayed limit defines ĥ^B_L : A(k̄₀) → ℝ; changing the initial height by a bounded function leaves the limit unchanged.
- For all integers N, ĥ^B_L([N]P) = N²ĥ^B_L(P); the height is nonnegative and vanishes on torsion.
- If B is big, its zero set is exactly the torsion subgroup.
- For a number field k₀, ĥ^B_L = [k₀:ℚ] times the absolute canonical height; in general it is the vector-valued invariant height of §5.1 paired with the polarization tuple.

*Route.* Tate's limit for the bounded-error class (HeightsRationalPointsAndObstructions §0.18 Tate limit). Nonnegativity from boundedness below of the ample height; kernel by Northcott (§6.2(4)) applied to the subgroup generated by P (Moriwaki Proposition 3.4.1).

**Checks.**

- For k₀ = ℚ it is the Néron–Tate height of HeightsRationalPointsAndObstructions Layer 0.
- For a torsion point P of order 2, [2ⁿ]P=0 for n≥1 and the normalized limit is 0; for a point of canonical height a, heights at [0],[1],[2] are 0,a,4a. This distinguishes quadratic from linear scaling.
- Over a quadratic number field, a point of absolute canonical height a has relative Moriwaki height 2a; dividing by [k₀:ℚ] = 2 recovers a, not 2a.
- Over ℚ(t), a polarization with one H̄ᵢ = O with trivial metric gives every polarized height and every canonical limit the value 0. A constant nontorsion point of an elliptic curve over ℚ remains nontorsion over ℚ(t) and has height 0 for this polarization; the torsion converse therefore requires bigness.

*Needs:* §6.2; HeightsRationalPointsAndObstructions §§0.18–0.20; §5.1.

### 6.4 Silverman–Tate and specialization with Moriwaki heights

Let k₀ be finitely generated over ℚ with a polarization B = (B; H̄₁, …, H̄_d; τ) whose H̄ᵢ are nef (§6.1); bigness of B is assumed only where it is stated. (1) For an abelian scheme 𝒜 → S over a regular quasi-projective k₀-variety, with a projective compactification S̄ of S, an embedding of 𝒜 into ℙⁿ × S̄ as in HeightsRationalPointsAndObstructions §§0.26–0.28 and the symmetric relatively ample L = O(1,1)|_𝒜 it induces, there is c > 0 with |ĥ^B₍𝒜₍π(P)₎₎(P) − h^B(P)| ≤ c·max{1, h^B₍S̄₎(π(P))} for every P ∈ 𝒜(k̄₀), for every such polarization B, big or not. (2) Assume now that B is big (the H̄ᵢ nef and big). For S a smooth projective k₀-curve and a section σ_x over a generically finite S′ → S, ĥ^B(σ_x(t))/h^B_S(ρ(t)) → ĥ₍K,A₎(x) as h^B_S(ρ(t)) → ∞ (Silverman's limit with Moriwaki heights). Here h^B_S has degree-one normalization, and ĥ₍K,A₎(x), K = k₀(S), is the geometric generic-fibre height normalized over K: if x is represented over K′ = k₀(S′), divide its K′-height by [K′ : K]. The comparison height on S̄ is attached to an ample bundle. (gao-habegger-2019, §A.2, p. 56; §A.3, pp. 56–57; wazir-2006, Theorems 0.2–0.3, pp. 4–5 (arXiv v2)).

*Route.* Apply the Moriwaki height machine and the duplication estimate exactly as in the imported HeightsRationalPointsAndObstructions Layer 0 proofs. (1) uses only additivity, functoriality under quasi-finite maps and boundedness below off the stable base locus, §6.2(1)–(3), which hold for every polarization with nef H̄ᵢ (moriwaki-2000, Proposition 3.3.7(2)–(3); gao-habegger-2019, Proposition A.1(1)–(3)); bigness enters the Moriwaki theory only through Northcott, §6.2(4), and through the unboundedness of the base height, which is why the torsion criterion of §6.3 and the specialization limit (2) keep it. Wazir’s preprint Theorems 0.2–0.3 (pp. 4–5) explicitly give comparison and the specialization limit over a finitely generated characteristic-zero field; Gao–Habegger §§A.2–A.3 supply the ample comparison and the big-polarization scope of (2). For a section only after a finite cover, apply the section theorem upstairs and divide the geometric height by the cover degree, using h_S∘ρ/h₍S′₎ → deg ρ.

**Checks.**

- For k₀ a number field (d = 0) these are HeightsRationalPointsAndObstructions §§0.26–0.28 and HeightsRationalPointsAndObstructions §0.29.
- For a degree-two base cover, a section of geometric generic height 3 has upstairs height 6 and base-height ratio 2; 6/2=3 gives the original specialization slope.
- The zero polarization over k₀ = ℚ(t) (one H̄ = O with the trivial metric, §6.1) is nef and not big: every h^B and every ĥ^B is 0, so (1) holds with both sides 0 and uses no bigness, whereas h^B₍S̄₎ is bounded, so the limit in (2) is vacuous; (2) therefore keeps the big hypothesis and (1) does not.

*Needs:* §6.2; §6.3; HeightsRationalPointsAndObstructions §§0.26–0.28; HeightsRationalPointsAndObstructions §0.29.

### Examples

For ℚ(t) with H̄=O and trivial metric, every intersection defining the polarized height is 0; over ℚ the polarization tuple is empty and [1:2] has height log 2. For a degree-two base cover, a section of geometric generic height 3 has upstairs height 6 and base-height ratio 2; 6/2=3 gives the original specialization slope.

### Dependencies

HeightsRationalPointsAndObstructions §0.16; HeightsRationalPointsAndObstructions §§0.18–0.20; HeightsRationalPointsAndObstructions §§0.26–0.28; HeightsRationalPointsAndObstructions §0.29; HeightsRationalPointsAndObstructions §§5.17a–5.17b. The internal prerequisites are the individual subsection references above.

## Layer 7: Local admissible metrics on curves

### 7.1 Admissible metrics on abelian varieties

Let A be an abelian variety over a complete field K with a nontrivial non-archimedean absolute value and M a line bundle on A. If M is even ([−1]^*M ≅ M), a continuous metric on M is admissible if the isomorphism [2]^*M ⊗ M⁻⁴ ≅ O_A identifies it with a constant metric; if M is odd ([−1]^*M ≅ M⁻¹) replace 4 by 2; in general require admissibility of the induced metrics on M ⊗ [−1]^*M (even) and M ⊗ ([−1]^*M)⁻¹ (odd). Every M has an admissible metric on A^an, unique up to a positive constant (Tate's limit); it is integrable, and semipositive when M is ample. (yuan-2026, §A.3, pp. 107–108).

*Route.* Existence: Tate's limit of [2^n]^* of a model metric, uniformly convergent by contraction (Zhang 1995, Yuan §A.3). Uniqueness: two admissible metrics differ by a continuous function φ with φ∘[2] = 4φ + c (resp. 2φ + c), forcing φ constant. Semipositivity: limit of semipositive model metrics when M is ample.

The basic API comprises these facts.

- The admissible metric, unique up to a constant.
- For even M, [2]^*M̄ = 4M̄ up to a constant isometry.
- For odd M, [2]^*M̄ = 2M̄ up to a constant isometry.
- Tensor products and pullbacks by homomorphisms of admissible metrics are admissible.
- Semipositive for ample M.
- Two admissible metrics differ by one positive scalar; fixing the norm of a rigidifying frame at the origin makes the metric unique. Tensor products and homomorphism pullbacks respect these rigidifications.

**Checks.**

- With good reduction, the admissible metric is the model metric from the abelian scheme over O_K, up to a constant.
- For M = O_A the admissible metrics are the constant metrics.
- Two admissible metrics on M have constant ratio.
- For a Tate elliptic curve the model metric of O(e) on the minimal regular model has atomic curvature on the skeleton, while the canonical metric has the non-atomic Haar curvature there; it is not admissible.
- On good reduction O(e) the canonical measure is δζ of mass 1; on a Tate elliptic curve it is Haar measure on a circle of mass 1, whereas the model measure is atomic.

*Needs:* TropicalAndBerkovichArithmetic §§6.1 and 6.3; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; §5.1.

### 7.2 Admissible metrics on a curve and on its square

Let C/K be smooth projective geometrically integral of genus g ≥ 1 over a complete nontrivially valued non-archimedean field. Choose α ∈ Pic¹(C) (after a finite extension if Pic¹(C)(K) is empty), the Abel–Jacobi map i_α : C → J and the theta divisor θ_α. A continuous metric on a line bundle L on C is admissible if for some m ≥ 1 there is a line bundle M on J algebraically equivalent to an integer multiple of θ_α with an admissible metric and an isometry L^m ≅ i_α^*M. A metric on a line bundle on C² is admissible if its pullbacks along (x, id) and (id, x) are admissible for every x ∈ C(K′), K′/K finite. Every line bundle on C (resp. C²) has an admissible metric, unique up to a positive constant; the notion is independent of α and of the finite extension, and compatible with base change. For a symmetric metric on O(Δ) (Green function invariant under transposition) the pullback along (x, id) is a metric on O(x). (yuan-2026, §A.2, pp. 103–104; §A.3, pp. 108–109).

*Route.* Existence and uniqueness on C from §7.1 via i_α, using that every degree-d bundle is algebraically equivalent to (d/g)·i_α^*θ_α in Pic ⊗ ℚ (JacobianChallengePartII §§3.4–3.5 theta pullbacks). Independence of α: two Abel maps differ by a translation, and translates of admissible metrics are admissible. On C²: use the biextension Picard comparison (JacobianChallengePartII §§4.5–4.9 axis-normalized Picard and pointed-square comparison) and admissibility of the Poincaré bundle.

The basic API comprises these facts.

- L^m ≅ i_α^*M isometrically for an admissible M on J.
- Existence, unique up to a positive constant.
- Independent of α and of finite extensions; compatible with base change.
- Admissible on all horizontal and vertical fibres.
- Existence and uniqueness up to constants on C².
- Green function of O(Δ) invariant under transposition.

**Checks.**

- With good reduction, the model metrics on ω_C and O(Δ) from the smooth model are admissible.
- On O_C the admissible metrics are the constant ones.
- Tensor products and inverses of admissible metrics are admissible.
- For a totally degenerate genus-two curve with two rational components joined at three nodes (unit-edge banana skeleton), the model metric of ω has atomic curvature δ_v₁ + δ_v₂, whereas an admissible metric has curvature 2μ_a = (2/3)Σ_e δ_e. Thus this model metric is not admissible.
- For the unit genus-two banana the model canonical curvature is δv₁+δv₂, but the admissible curvature is (2/3)Σₑdxₑ; both have mass 2 and are unequal measures.

*Needs:* §7.1; JacobianChallengePartII §3.4–3.5; JacobianChallengePartII §4.9; JacobianChallengePartII §2.4.

### 7.2a Local Calabi uniqueness on curves

Let C/K be smooth projective geometrically integral over a complete nontrivially valued non-archimedean field. For an integrable metrized line bundle M̄ on C with underlying bundle O_C, put f = −log‖1‖ (a continuous function on C^an) and M̄² = ∫₍C^an₎ f c₁(M̄), the local intersection number. Then M̄² ≤ 0, with equality if and only if f is constant. Consequently, two integrable metrics on the same line bundle L on C with equal curvature measures differ by a positive constant factor. (yuan-zhang-2025, Theorem A.6.1, p. 246, the case of dimension one, where no auxiliary bundles occur; Corollary A.6.2, p. 247, for the ample semipositive case in every dimension.)

*Route.* For a model function f, choose a skeleton Γ ⊂ C^an through whose retraction f factors; then c₁(M̄) = −i_*(Δ(f|_Γ)) with the graph Laplacian of TropicalAndBerkovichArithmetic §3.3, and the energy identity ∫_Γ f·Δf = ∫_Γ (f′)² ds gives M̄² = −∫_Γ (f′)² ds ≤ 0, with equality iff f is constant on Γ. The integrable case is the limit argument of Yuan–Zhang for Theorem A.6.1. For the consequence, apply the inequality to L̄₁ − L̄₂: equal curvatures give c₁(M̄) = 0, hence M̄² = 0, hence f is constant.

**Checks.**

- O_C with norms 1 and e⁻¹: f ≡ 1, both curvatures are 0, M̄² = 0, and the ratio of the two metrics is the allowed constant e⁻¹.
- On ℙ¹ over ℚ_p, the two metrics max(|x₀|, |x₁|) and max(|x₀|, |p x₁|) on O(1) have ratio f = log max(1, |t|) − log max(1, |t|/p), the clamp of log|t| to [0, log p], and curvatures δ at the Gauss points of radii 1 and p. Then M̄² = f(ζ₁) − f(ζ_p) = −log p < 0, which is minus the energy of slope 1 along a segment of length log p; the curvatures differ and the ratio is not constant, as the equality clause requires.
- The sign is fixed by the energy: with the opposite sign convention M̄² = +∫(f′)² ds, the second Check would give +log p and the inequality would read M̄² ≥ 0.

*Needs:* §2.6; TropicalAndBerkovichArithmetic §§2.7, 3.3 and 6.7.

### 7.3 The canonical admissible measure on a curve

Let C/K be smooth projective geometrically integral of genus g ≥ 1 over a complete nontrivially valued non-archimedean field. There is a unique probability measure μ_a on C^an such that a metrized line bundle L̄ on C is admissible iff its metric is integrable and c₁(L̄) = deg(L)·μ_a. It is the normalized curvature c₁(i_α^*O(θ_α))/g of an admissible theta metric. If M on J is algebraically equivalent to zero with an admissible metric then c₁(i_α^*M̄) = 0. At split semistable reduction, μ_a = (1/g)·i_*(Σ_v g_v δ_v + Σ_e (1/(r_e + 1))δ_e) on the skeleton (TropicalAndBerkovichArithmetic §6.6; GrossZagierAndArithmeticHeights §2.3). (yuan-2026, Proposition A.2, pp. 108–109; Proposition A.5, pp. 117–118).

*Route.* First prove the flat-curvature statement: an admissible metric on M algebraically equivalent to zero on J pulls back to a metric of zero curvature on C (Yuan–Zhang arithmetic Hodge index for abelian varieties, cited as [YZ1] Theorem 5.16 in Yuan). Then define μ_a from θ_α; two choices of α differ by a translation, which changes i_α^*O(θ_α) by the pullback of an algebraically trivial admissible bundle, so by the flat-curvature statement μ_a is independent of α. Characterization: an integrable metric with c₁ = deg·μ_a differs from an admissible one by a metric with zero curvature, hence by a constant (local Calabi uniqueness, §7.2a).

The basic API comprises these facts.

- μ_a, a probability measure on C^an.
- Admissible iff integrable with c₁ = deg·μ_a.
- Compatible with finite extensions of K.
- At split semistable reduction, equals the admissible graph measure of TropicalAndBerkovichArithmetic §6.6 pushed forward by the skeleton inclusion, as in GrossZagierAndArithmeticHeights §2.3.
- The degree-one curvature condition determines the probability measure: for any admissible positive-degree L̄ it equals c₁(L̄)/deg L.

**Checks.**

- Good reduction: μ_a = δ_ζ, ζ the Gauss point.
- μ_a(C^an) = 1.
- For a genus-2 curve whose skeleton is two vertices of genus 0 joined by three unit edges, μ_a = (1/2)Σ_e (1/(1 + 1/2))δ_e = (1/3)Σ_e δ_e (each r_e = 1/2).
- μ_a is not the Baker–Rumely canonical measure μ_can, which may be signed.
- The unit banana has rₑ=1/2 and μₐ=(1/2)(2/3)Σₑdxₑ=(1/3)Σₑdxₑ, total mass 1; a single genus-two vertex has μₐ=δv and c₁(ω)=2δv.

*Needs:* §7.2; §7.2a; §2.6; TropicalAndBerkovichArithmetic §6.6; GrossZagierAndArithmeticHeights §2.3.

### 7.4 Zhang's canonical admissible metrics on ω_C and O(Δ)

Let C/K be smooth projective geometrically integral of genus g ≥ 1 over a complete nontrivially valued non-archimedean field. There is a unique pair of metrics, on ω_C and on O(Δ) over (C²)^an, both integrable and the diagonal metric symmetric, such that for every finite extension K′/K and x, y ∈ C(K′): (a) c₁(O(x)) = c₁(O(y)); (b) c₁(ω) = (2g − 2)c₁(O(x)); (c) ∫ g_Δ(x, ·)c₁(O(x)) = 0; (d) the residue map (ω ⊗ O(x))|_x → K′ is an isometry. Here O(x) carries the pullback of the diagonal metric along (x, id). These are Zhang's admissible metrics; both are admissible; their pairing on divisors with disjoint support is Zhang's admissible pairing (D, E)_a; the canonical isomorphism ω_C ≅ Δ^*O(−Δ) and p₁_*⟨O(Δ), p₂^*L̄⟩ ≅ L̄ (L̄ admissible) are isometries up to constants that the normalization (c)–(d) fixes; and Q = (id_J, i_α)^*P with admissible L gives q₁_*⟨Q, q₂^*L⟩ odd with an admissible metric. The pair descends from a finite Galois extension, which reduces existence to the pointed case. (yuan-2026, Theorem A.1, pp. 104–105; proofs pp. 106–114; §A.4, p. 110).

*Route.* Uniqueness: local Calabi uniqueness on curves (§7.2a) — two integrable metrics with the same Chambert-Loir curvature differ by a constant — and (c)–(d) fix the constants (Yuan p. 106). Existence: take admissible metrics (§7.2); restriction of an admissible O(Δ) metric to the diagonal is admissible (Heinz Proposition 4.3 as cited, Yuan p. 112); the pairing with the diagonal is an isometry up to constant for every admissible L̄ (pp. 113–114), and for an admissible L̄ of positive degree d this makes ∫ g_Δ(x, ·)c₁(L̄) = d∫ g_Δ(x, ·)dμ_a independent of x, which is (c) up to a constant; the Poincaré Deligne pairing is odd (p. 114); then normalize. Yuan p. 113 takes L̄ = ω_C, whose curvature vanishes when g = 1, so the positive-degree choice is needed in genus one. Descent: uniqueness gives Galois invariance (Yuan §A.4). Comparison with Zhang's graph construction: Yuan p. 106–107 (Zhang 1993 Theorem 4.6).

The basic API comprises these facts.

- Zhang's admissible metric on ω_C.
- Zhang's symmetric admissible metric on O(Δ).
- c₁(O(x)) = μ_a and c₁(ω) = (2g − 2)μ_a.
- ∫ g_Δ(x, ·)dμ_a = 0 and the residue map is an isometry.
- ω_C ≅ Δ^*O(−Δ) is an isometry.
- The pairing (D, E)_a from g_Δ is Zhang's admissible pairing.
- Compatible with finite extensions; Galois invariant.
- Any symmetric integrable diagonal metric and dualizing metric satisfying the curvature, zero-mean and residue-isometry conditions agree with the canonical pair; no scalar ambiguity remains.

**Checks.**

- With good reduction, the pair is the model pair from the smooth model (§7.6).
- K is nonarchimedean here, so |·|^a is an absolute value for every a > 0, and replacing |·| by |·|^a replaces the metrics by their a-th powers (§7.6(1)); with |ϖ| = e⁻¹ and a = 2, a Green value 1 becomes 2.
- For g = 2, c₁(ω) = 2μ_a has total mass 2.
- On the genus-two, three-unit-edge banana reduction of §7.2, the model metric of ω has atomic curvature δ_v₁ + δ_v₂ and fails (b), whose right side is (2/3)Σ_e δ_e. Bad reduction alone is insufficient for this test: for two elliptic components meeting in one node the model curvature already equals 2μ_a.
- At g = 1, (b) says c₁(ω) = 0 and does not involve μ_a, so (c) is tested against c₁(O(x)) = μ_a alone. With good reduction the canonical metric on ω_C ≅ O_C gives an invariant differential of the smooth model norm 1; multiplying that metric by e^c, c ≠ 0, keeps (a)–(c) and violates (d).
- For g=2 the canonical curvature mass is 2, Green mean 0 and residue-adjunction norm 1; a constant diagonal shift c changes mean to c, excluded unless c=0.

*Needs:* §7.2; §7.2a; §7.3; §0.2; JacobianChallengePartII §3.1; JacobianChallengePartII §3.7.

### 7.5 Explicit graph formulas for the canonical metrics

Let K be complete discretely valued with e_K = |ϖ|⁻¹, C/K of genus g ≥ 1 with a K-point and split semistable reduction, Γ the dual graph of the minimal regular model with unit edge lengths, i : Γ → C^an and r : C^an → Γ the skeleton inclusion and retraction, K_C the canonical divisor of Γ, μ the admissible graph measure and g_μ its normalized Green function (TropicalAndBerkovichArithmetic §6.6; GrossZagierAndArithmeticHeights §2.3). (1) ‖·‖_a(x) = ‖·‖_model(x)·e_K^(g_μ(r(x), r(x))) on ω_C, where ‖·‖_model comes from the relative dualizing sheaf of the minimal regular model. (2) For distinct geometric points x, y defined over K′/K, g₍Δ,a₎(x, y) = (i(x, y) + g_μ(r(x), r(y)))·log e_K, where i(x, y) is the intersection of the two sections on the minimal regular model over O₍K′₎ measured as length and divided by the ramification index e(K′/K) — equivalently, measured with residue degrees and divided by [K′ : K], which is how Yuan p. 116 prints the normalization. Plain length divided by [K′ : K] is wrong when K′/K has residue degree > 1. (yuan-2026, §A.5, p. 116; Proposition A.4, p. 117).

*Route.* Compare curvatures: c₁(O_C(f)) = −i_*(Δf) for model potentials (Yuan Proposition A.4; the metric–Laplacian comparison of TropicalAndBerkovichArithmetic §§6.7–6.8), so the corrected metrics have curvature deg·μ_a; check (c)–(d) of §7.4. For (2), the finite-extension normalization uses the ramification index.

**Checks.**

- Good reduction: Γ is one vertex of genus g, g_μ = 0, and the formulas reduce to the model metrics.
- For good reduction gμ=0 and the metric ratio is e^0=1. An intersection length 1 after an unramified quadratic extension stays 1/e=1, whereas division by degree would give 1/2.

*Needs:* §7.4; TropicalAndBerkovichArithmetic §§2.7, 2.13, 6.6 and 6.7–6.8; GrossZagierAndArithmeticHeights §2.3.

### 7.6 Rescaling, good reduction and trivially valued fields

Let C/K be smooth projective geometrically integral of genus g ≥ 1 over a complete valued field K. If K is archimedean, it is ℝ or ℂ and |·| = |·|_∞^b for a unique b with 0 < b ≤ 1, the exponents for which |·|_∞^b still satisfies the triangle inequality (Ostrowski); this is the archimedean ray of M(ℤ) in §2.1 (yuan-zhang-2025, p. 68). (1) Let a > 0 be such that |·|^a is again an absolute value on K: every a > 0 when K is nonarchimedean (the trivial absolute value is fixed), and exactly the a with ab ≤ 1 when K is archimedean. Raising every seminorm to the a-th power is a homeomorphism from C^an over (K, |·|) to C^an over (K, |·|^a), and likewise on (C²)^an; along it the canonical admissible metrics over (K, |·|^a) are the a-th powers of those over (K, |·|), and their Green functions are a times the old values. Curvature measures are transported unchanged along this homeomorphism, so that the measure of a metrized line bundle over (K, |·|^a) is the image of its measure over (K, |·|) and keeps the total mass deg L; at a point |·|_∞^t of the archimedean ray of M(ℤ) (0 < t ≤ 1, §2.1) the curvature measure of a metrized line bundle is therefore the transport of its measure at the usual absolute value, equivalently (1/(tπi))∂∂̄ log‖s‖_t + δ_div(s) in terms of the t-th-power metric ‖·‖_t, whereas the formula of §0.1 applied literally to ‖·‖_t would give t times that measure. This is the measure that §§10.3, 10.6 and 13.8 use at non-normalized points of S^an. (2) If K is nontrivially valued nonarchimedean and C extends to a smooth projective model over the valuation ring O_K, the canonical admissible metrics of §7.4 on ω_C and O(Δ) are the model metrics of ω_model and O(Δ_model) on the smooth model and its square. (3) *Definition.* If K is trivially valued, a metric on a line bundle on C or on C² is admissible if it is the canonical metric of §2.7; every line bundle then has exactly one admissible metric, not one up to constants, and the canonical admissible metrics on ω_C and O(Δ) are their canonical metrics of §2.7. These are the model metrics of the trivial model C over O_K = K, so the description in (2) holds for them by definition. (4) *Definition.* If K is archimedean with |·| = |·|_∞^b, a metric on a line bundle on C or on C² is admissible if it is the b-th power of an archimedean admissible metric of GrossZagierAndArithmeticHeights §2.4, and the canonical admissible metrics are the b-th powers of the Arakelov metrics of GrossZagierAndArithmeticHeights §§2.8 and 2.10 (for b = 1, the Arakelov metrics themselves), descended through complex conjugation when K = ℝ (§2.13 there). They satisfy (a)–(d) of §7.4 over (K, |·|) with the Arakelov probability measure in place of μ_a, and they are the only pair that does. (yuan-2026, §A.5, p. 117, stated there for a nonarchimedean field; §A.6, pp. 118–119).

*Route.* (1) Nonarchimedean K: conditions (a)–(d) of §7.4 are homogeneous under |·| ↦ |·|^a, and uniqueness in §7.4 gives the a-th powers (Yuan p. 117); the trivial absolute value is fixed by every a, and its trivial-model metrics are norm-equivariant (§2.2), so they are the a-th powers along the homeomorphism. Archimedean K: by (4), since (|·|_∞^b)^a = |·|_∞^(ab) with ab ≤ 1 and the (ab)-th power of the Arakelov metrics is the a-th power of their b-th power. (2) Model metrics on a smooth model have curvature the Dirac mass at the Gauss point, satisfy (c)–(d) by adjunction on the smooth model, and uniqueness applies. (3) is a definition (Yuan §A.6, which sets these metrics to be the canonical ones and notes that the admissible metric is then unique); no curvature uniqueness is used, and the route of (2), which rests on §7.4 over a nontrivially valued field, is not applied to it. (4) For b = 1 this is the prescription of Yuan §A.6. For b < 1, the b-th powers of the Arakelov metrics are metrics over (K, |·|_∞^b), since a scalar λ multiplies their norms by |λ|_∞^b; they keep the curvature and the zero-mean condition, and make the residue map an isometry onto (K, |·|_∞^b); taking 1/b-th powers reduces their uniqueness to that of GrossZagierAndArithmeticHeights §§2.8 and 2.10. This is the norm-equivariance of §2.2 along the archimedean ray of M(ℤ).

**Checks.**

- Good reduction everywhere outside finitely many places is what makes the global bundles of §7.7 adelic.
- Nonarchimedean, K = ℚ₂: the exponent a = 2 is allowed, |2| changes from 1/2 to 1/4, Green value 1 becomes 2 and norm e⁻¹ becomes e⁻²; a = 1 fixes both. The ultrametric inequality survives every power.
- Archimedean, negative control: the usual absolute value on ℝ with a = 2 is not an absolute value, since |1 + 1|² = 4 > 2 = |1|² + |1|²; (1) does not apply, and an unrestricted rescaling rule would assign metrics over a non-normed field.
- Archimedean, positive controls: the usual absolute value on ℝ with a = 1/2 gives |1 + 1|^(1/2) = √2 ≤ 2; Green value 1 becomes 1/2 and norm e⁻¹ becomes e^(−1/2). Starting from the square-root absolute value (b = 1/2), a = 2 is allowed (ab = 1) and returns the usual absolute value and the Arakelov metrics themselves.
- Over a trivially valued field every a > 0 is allowed and fixes the absolute value of K; the canonical norm of a model generator is 1 before and after, since 1^a = 1.
- The transported measure, not the literal current: Fubini–Study O(1) on ℙ¹ at |·|_∞^(1/2) has Green function half the usual one; the transported curvature measure has mass 1 = deg O(1), while the literal formula of §0.1 applied to the half-power metric has mass 1/2. For a curve C at a real place with a = 1/2, φ(C) of §10.3 is halved with the transported measure (Green function halved, measure unchanged), whereas the literal current would divide it by 8.
- (2) is a statement about nonarchimedean K: the closed unit ball of the usual absolute value on ℝ is not a ring, since 1 + 1 = 2 lies outside it, so there is no valuation ring and no smooth model at an archimedean place.
- The two definitions are norm-equivariant, as §2.2 requires of points of S^an: for H_v = k(S) with the trivial valuation, (3) gives the canonical metric, in which a model generator has norm 1 and λ ∈ k(S)^× scales norms by |λ| = 1; for H_v = ℂ with |·|_∞^(1/2), (4) gives the square roots of the Arakelov metrics, and multiplying a section by λ multiplies its norm by |λ|_∞^(1/2), whereas the unmodified Arakelov metric would scale by |λ|_∞ and is not a metric over (ℂ, |·|_∞^(1/2)).

*Needs:* §7.4; §2.7; §2.1; §2.2; GrossZagierAndArithmeticHeights §§2.8, 2.10 and 2.13.

### 7.7 The admissible bundles ω₍C/K,a₎ and O(Δ)_a over a global field

Let K be a number field or a one-variable function field over k and C/K smooth projective geometrically integral of genus g ≥ 1. Assembling the canonical admissible metrics at all places (§7.4; GrossZagierAndArithmeticHeights §§2.8 and 2.10 at archimedean places) gives adelic line bundles ω₍C/K,a₎ ∈ P̂ic(C/k) and O(Δ)_a ∈ P̂ic(C²/k), because outside finitely many places they are model metrics of a smooth model (§7.6(2)). Their self-intersections are Zhang's ω_a² and the admissible pairing; the normalized self-intersection is [ω²₍C/K,a₎] = ω_a²/[K : ℚ] (number field) or ω_a² with residue degrees over k (function field). (yuan-2026, §A.6, p. 119; §1.3, p. 11).

*Route.* Adelic: model metrics of a smooth model over an open U ⊂ Spec O_K (or of the regular projective curve) plus finitely many local corrections give a boundary-Cauchy system (§1.6).

The basic API comprises these facts.

- ω₍C/K,a₎ ∈ P̂ic(C/k).
- O(Δ)_a ∈ P̂ic(C²/k).
- The bundles commute with finite base extension. The normalized self-intersection [ω²] is invariant over number fields; with geometric residue degrees over a fixed k it scales by [K′ : K].
- [ω²₍C/K,a₎] with the stated normalization.
- The underlying bundle and its prescribed metric at every place determine its adelic isometry class, by injectivity of adelic analytification; at a place of good reduction recover the model metric.

**Checks.**

- Over a function field with everywhere good reduction, ω₍C/K,a₎ is the model ω and [ω²] = ω²₍model₎.
- For number fields, [ω²₍C₍K′₎/K′,a₎] = [ω²₍C/K,a₎]. Over one-variable function fields with fixed k, ω²₍C₍K′₎/K′,a₎ = [K′ : K]·ω²₍C/K,a₎.
- The underlying bundle has degree 2g − 2.
- At bad places ω_a² differs from the Arakelov self-intersection of the minimal regular model by the ε-invariant (§13.3).
- For g=2 the underlying canonical degree is 2; a degree-two field extension multiplies raw square W by 2, leaving number-field W/[K:ℚ] invariant and doubling geometric W.
- For g = 1 the canonical metric of ω_C ≅ O_C is constant at every place, so ω₍C/K,a₎ is pulled back from an adelic line bundle on Spec K and ω_a² = 0; a nonzero value would contradict the projection formula ⟨π^*N̄, π^*N̄⟩ = 0 for fibre degree 0.

*Needs:* §7.4; §7.6; GrossZagierAndArithmeticHeights §§2.8 and 2.10; §1.6.

### Examples

On good reduction O(e) the canonical measure is δζ of mass 1; on a Tate elliptic curve it is Haar measure on a circle of mass 1, whereas the model measure is atomic. For g=2 the underlying canonical degree is 2; a degree-two field extension multiplies raw square W by 2, leaving number-field W/[K:ℚ] invariant and doubling geometric W.

### Dependencies

TropicalAndBerkovichArithmetic §§2.7, 2.13, 3.3, 6.1, 6.3, 6.6 and 6.7–6.8; GrossZagierAndArithmeticHeights §§2.3, 2.8, 2.10 and 2.13; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; JacobianChallengePartII §§2.4, 3.1, 3.4–3.5, 3.7 and 4.9. The internal prerequisites are the individual subsection references above.

## Layer 8: Admissible adelic bundles on curve families

### 8.1 Admissible adelic extensions over a curve family

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth projective with geometrically connected fibres of genus g ≥ 1, and W one of X, X ×_S X, or an abelian scheme over S. An integrable adelic extension L̄ ∈ P̂ic(W/k)_int of a line bundle L on W is admissible if for every v ∈ S^an its metric on W₍H_v₎ is admissible in the sense of Layer 7: on curves and their squares, §7.2 at nontrivially valued non-archimedean v, the canonical metric of §2.7 at trivially valued v (§7.6(3)), and at an archimedean v = |σ(·)|_∞^t the t-th power of an archimedean admissible metric of GrossZagierAndArithmeticHeights §2.4 (§7.6(4)); on abelian schemes, the condition of §7.1 read over the complete field H_v. (yuan-2026, Definition 2.5, p. 30).

*Route.* Fibrewise condition through restriction of adelic line bundles to the fibres over points v of S^an (§2.3).

The basic API comprises these facts.

- Fibrewise admissible at every v ∈ S^an.
- Closed under tensor products and inverses.
- π_W^*N̄ is admissible for N̄ ∈ P̂ic(S/k)_int.
- Preserved by base change S′ → S.

**Checks.**

- π^*N̄ is admissible for every integrable N̄ on S.
- For S = Spec K (K a global field), admissible = fibrewise admissible at the places of K.
- For a family whose stable compactification has a totally degenerate genus-two fibre with three-unit-edge banana graph, the model ω extension is not admissible at the corresponding valuation: its atomic curvature differs from 2μ_a, which has an edge density.
- A pulled-back base metric e⁻¹ is constant on every curve fibre and admissible; the unit-banana model ω has atomic mass 1+1=2 versus admissible edge mass 3·2/3=2 and fails equality of measures.
- An archimedean negative and positive control: over S = Spec ℤ[1/2] take the genus-one curve y² = x³ − x, good outside 2, whose complex fibre is ℂ/(ℤ + iℤ) up to homothety (j = 1728). An integrable extension of O_X whose metric on that complex fibre is ‖1‖ = exp(−cos 2πx), x the real coordinate, is not admissible: −log‖1‖ = cos 2πx has flat Laplacian −4π² cos 2πx ≠ 0, so the curvature is nonzero although deg O_X = 0. An extension of O(e) whose complex metric has curvature the Haar probability measure is admissible there, with curvature mass 1 = deg O(e).
- At a trivially valued v ∈ S^an admissibility allows no constant: the fibre metric on O_X must be the canonical one, ‖1‖ = 1, whereas at a nontrivially valued point every constant metric e^(−c) on O_X is admissible. A pulled-back base metric π^*N̄ meets this requirement, since norm-equivariance (§2.2) gives g(v) = t·g(v) for every t > 0 at a trivially valued v, so its Green function vanishes there; for N̄ = O(1) on Spec ℤ the Green value is t at |·|_∞^t and 0 at the trivial norm.

*Needs:* §7.2; §7.1; §7.6; §2.7; §1.3; §2.3; GrossZagierAndArithmeticHeights §2.4.

### 8.2 Existence and uniqueness of admissible extensions

In the setting of §8.1, every line bundle L on W has an admissible integrable adelic extension, and two admissible extensions of the same L differ by π_W^*N̄ for a unique N̄ ∈ ker(P̂ic(S/k)_int → Pic(S)). The admissible extensions of L form a torsor under this kernel. (yuan-2026, Proposition 2.6 and proof, pp. 31–32).

*Route.* Abelian scheme: decompose L into even and odd parts up to torsion and take invariant extensions (§5.1, q = 4 or 2). Curves: choose α of positive relative degree d with Abel map i_α : X → J; the pullback Pic⁰(J) → Pic⁰(X) and Pic⁰⁰(J ×_S J) → Pic⁰⁰(X ×_S X) have torsion cokernel (JacobianChallengePartII §§4.5–4.9), so a power of L is i_α^* of an admissible bundle on J plus a bundle algebraically equivalent to a multiple of θ, and its pullback is admissible. Uniqueness: the ratio of two admissible extensions is fibrewise constant, so it descends to S by §3.4(2), and the descended bundle has trivial underlying line bundle after the identification.

**Checks.**

- For W = X and L = π^*M the admissible extensions are π^*M̄ for integrable extensions M̄ of M.
- Over Spec ℚ, adding base metric O(c) gives the same underlying L and fibrewise ratio e^(−c); c=1 and c=2 give distinct extensions with difference O(1).

*Needs:* §8.1; §5.1; §3.4; JacobianChallengePartII §4.5; JacobianChallengePartII §4.7; JacobianChallengePartII §2.2; JacobianChallengePartII §1.2–1.3.

### 8.3 The canonical admissible bundles ω₍X/S,a₎ and O(Δ)_a

Let k be ℤ or a field, S flat quasi-projective normal integral over k and π : X → S smooth projective with geometrically connected fibres of genus g ≥ 1. (a) ω₍X/S₎ has a unique isomorphism class of adelic extension w = ω̄₍X/S,a₎ whose metric on every X₍H_v₎, v ∈ S^an, is the canonical admissible metric of §7.4 at nontrivially valued non-archimedean v and of §7.6(3)–(4) at trivially valued and archimedean v. (b) O(Δ) on X ×_S X has a unique isomorphism class of integrable adelic extension D = Ō(Δ)_a inducing on every (X²₍H_v₎)^an the canonical admissible metric of §7.4 at nontrivially valued non-archimedean v and of §7.6(3)–(4) at trivially valued and archimedean v. Writing ⟨A, B⟩ = π_*⟨A, B⟩: (1) the canonical isomorphism ω₍X/S₎ → Δ^*O(−Δ) is an isometry w → Δ^*(−D); (2) the canonical identification p₁_*⟨O(Δ), p₂^*ω⟩ → ω is an isometry p₁_*⟨D, p₂^*w⟩ → w. For a point s of S whose residue field is a global field, w|₍X_s₎ and D|₍X²_s₎ are Zhang's ω₍X_s,a₎ and O(Δ_s)_a. (yuan-2026, Theorem 2.3, p. 28; §2.2.3, pp. 32–33).

*Route.* Take admissible extensions (§8.2); the defects in (1) and (2) are fibrewise constants, hence by §3.4 are pullbacks β̄₁, β̄₂ of base bundles with trivial underlying bundle; twist ω′_a and O(Δ)′_a to cancel them (Yuan §2.2.3, p. 32, where the base class added to p₁_*⟨O(Δ)′_a, p₂^*ω′_a⟩ is (2g − 2)π^*β̄₂, the pullback to X of the class β̄₂ on S, as the projection formula of §3.3(2) along p₁ gives). When g = 1 that coefficient 2g − 2 vanishes, so (2) holds for every twist and does not fix β̄₂: fix it instead by the isometry p₁_*⟨D, p₂^*L̄⟩ ≅ L̄ of §7.4 for an admissible extension L̄ of a relatively ample L of relative degree e > 0, whose defect changes by e·π^*β̄₂; then (1) fixes β̄₁ as before. Uniqueness: two extensions inducing the canonical metric on every fibre differ by the pullback of a base class with trivial underlying bundle and trivial metric at every v ∈ S^an, which vanishes by §2.3.

The basic API comprises these facts.

- w = ω̄₍X/S,a₎.
- D = Ō(Δ)_a on X ×_S X.
- w ≅ Δ^*(−D).
- p₁_*⟨D, p₂^*w⟩ ≅ w.
- Compatible with base change S′ → S of normal integral schemes.
- Restricts to ω₍X_s,a₎ at points with global residue field.
- Two extensions with the prescribed normalized metrics at every analytic fibre are isometrically isomorphic; the canonical pair is preserved by normal integral base change.

**Checks.**

- The underlying bundle has relative degree 2g − 2.
- The transposition of X ×_S X fixes D.
- For g > 1, if X → S has a stable compactification with singular fibres, w is not the model bundle ω₍X̄/S̄₎: their Deligne self-pairings differ by O(E_S) (§10.4). For g = 1 both self-pairings vanish, yet at a valuation whose reduction graph is a circle of n unit edges the canonical metric is the model metric times e_v^(n/12), since g_μ(x, x) = n/12 there (§7.5); so w is again not the model bundle when n > 0.
- For S = Spec K a global field, w = ω₍C/K,a₎ and D = O(Δ)_a of §7.7.
- At g=2, deg w=2 and the adjunction identity gives Δ*D=−w of degree −2; swapping the two factors preserves D. A simultaneous constant twist changes the normalized pairing unless its fixed constants vanish.

*Needs:* §8.2; §7.4; §7.6; §7.7; §3.2; §3.4.

### 8.4 The canonical twice-theta bundle and Poincaré bundle over the relative Jacobian

With π : X → S as in §8.3, let J = Pic⁰₍X/S₎ (JacobianChallengePartII §1.2) and Θ = Δ_J^*(P^∨) the canonical symmetric rigidified twice-theta bundle (JacobianChallengePartII §3.3). Θ̄ ∈ P̂ic(J/k) is its invariant extension with [2]^*Θ̄ = 4Θ̄ (§5.1); it is nef and admissible. If x : S → X is a section, Q = (id_J, i_x)^*P on J ×_S X has a canonical integrable adelic extension Q̄ with ([2]_J × id_X)^*Q̄ = 2Q̄ ([2] acting on the J factor), whose fibre at β ∈ J is the admissible extension of the degree-zero class β on X. (yuan-2026, §2.3, p. 33; Theorem 2.10(3) proof, pp. 38–39; yuan-zhang-2025, Theorems 6.1.1 and 6.1.3, pp. 180–184; §§6.5.2–6.5.4, pp. 203–207).

*Route.* Θ is symmetric and relatively ample with e^*Θ ≅ O_S (JacobianChallengePartII §§3.3 and 3.11–3.13), so Yuan–Zhang Theorem 6.1.1 applies with q = 4. Q is odd in the J variable, so the invariant extension with q = 2 exists (Yuan–Zhang Theorem 6.1.2 and §6.5.2).

The basic API comprises these facts.

- Θ̄ with [2]^*Θ̄ = 4Θ̄.
- Θ̄ is nef.
- [−1]^*Θ̄ = Θ̄ and e^*Θ̄ = 0 in P̂ic(S/k).
- [n]^*Θ̄ = n²Θ̄.
- Q̄ on J ×_S X with [2]^*Q̄ = 2Q̄.
- h_Θ̄ = 2ĥ, ĥ the Néron–Tate height of the symmetric theta class (half of ĥ_Θ).
- The invariant extension of the rigidified Θ is unique; pullback along any normal integral base change agrees with the extension of the pulled-back rigidified bundle.

**Checks.**

- e^*Θ̄ is the trivial adelic bundle on S.
- [3]^*Θ̄ = 9Θ̄.
- Over S = Spec K, h_Θ̄ on J(K̄) is the Néron–Tate height for Θ (= 2θ up to algebraic equivalence).
- Over S = Spec ℚ, start with Θ̄ and tensor by the constant metric bundle O(c), c ≠ 0. Then [2]^*(Θ̄+O(c)) = 4Θ̄+O(c), whereas 4(Θ̄+O(c)) = 4Θ̄+O(4c); the twisted extension is not invariant. Good-reduction model extensions can be invariant.
- For Θ̄+O(1), [2]* gives 4Θ̄+O(1) while multiplication by 4 gives 4Θ̄+O(4); difference O(−3)≠0. The normalized Θ̄ gives [3]*Θ̄=9Θ̄ and e*Θ̄=0.

*Needs:* §5.1; JacobianChallengePartII §3.3; JacobianChallengePartII §3.11; JacobianChallengePartII §3.13; JacobianChallengePartII §3.1; JacobianChallengePartII §1.2–1.3.

### 8.5 Admissible section divisors and evaluation

With π : X → S as above and a section x : S → X, put O(x)_a = (x∘π, id_X)^*D, an admissible adelic extension of O(x(S)). For every admissible adelic line bundle L̄ on X: (1) the evaluation isomorphism π_*⟨O(x), L⟩ → x^*L is an isometry π_*⟨O(x)_a, L̄⟩ ≅ x^*L̄; (2) there is a canonical isometry π_*⟨O(x)_a, O(x)_a⟩ ≅ −π_*⟨O(x)_a, w⟩ = −x^*w. (yuan-2026, §2.3, p. 33; Proposition 2.7, pp. 33–34).

*Route.* (1) The algebraic evaluation isomorphism exists. At v ∈ S^an its log norm is the integral of log ‖1‖₍O(x)_a₎ against c₁(L̄_v) (Yuan Proposition 2.7, pp. 33–34). Admissibility gives c₁(L̄_v) = deg(L_v)μ_a and the canonical Green normalization makes this integral zero. Full faithfulness then gives the isometry; pulling back only the ω pairing does not prove this for arbitrary L̄. (2) Apply (1) to L̄ = O(x)_a: π_*⟨O(x)_a, O(x)_a⟩ ≅ x^*(x∘π, id_X)^*D = x^*Δ^*D, and Δ^*D ≅ −w by the adjunction isometry (1) of §8.3; while π_*⟨O(x)_a, w⟩ ≅ x^*w by (1).

The basic API comprises these facts.

- Pullback of the canonical diagonal bundle along (x∘π, id_X) : X → X ×_S X defines O(x)_a with underlying line O(x(S)) and fibre degree 1.
- For every admissible integrable L̄, the evaluation map from the Deligne pairing π_*⟨O(x)_a,L̄⟩ to x^*L̄ is the canonical algebraic evaluation map and is an isometry.
- Admissible adjunction identifies π_*⟨O(x)_a,O(x)_a⟩ with −x^*w, and pairing with w gives x^*w.

**Checks.**

- On a geometric curve fibre O(x)_a has degree 1, whereas the trivial bundle has degree 0; replacing the diagonal pullback by a trivial line fails this test.
- For L̄ = π^*O(c), evaluation gives O(c) on both sides, since deg O(x) = 1. At c = 1 the metric shift is 1 on both sides, whereas the trivial-line substitute gives shift 0 on the pairing side.
- If x^*w has degree 1, adjunction gives self-pairing degree −1 and pairing with w degree +1; reversing the dual sign would give +1 in the first equality.

*Needs:* §8.3; §3.3.

### 8.6 The vertical adelic Picard group

For π : X → S as above, P̂ic(X/k)_vert = ker(P̂ic(X/k)_int → Pic(X)): integrable adelic line bundles with trivial underlying algebraic bundle (equivalently O(E) for integrable adelic divisors E with zero underlying divisor). This is not the group of divisors supported in singular fibres of a compactification. (yuan-2026, Theorem 2.8(1), p. 34; yuan-zhang-2025, Theorem 6.5.1, p. 203).

*Route.* Definition; it is a group since P̂ic_int is.

The basic API comprises these facts.

- ker(P̂ic(X/k)_int → Pic(X)).
- Contains π^* of the base kernel.
- Equals {O(E) : E an integrable adelic divisor with underlying divisor 0}.
- An integrable class belongs precisely when its underlying class in Pic(X) is zero; the kernel is closed under tensor, dual and pullback. A choice of algebraic trivialization identifies it with O(E) for integrable E of underlying divisor zero, modulo principal trivializations.

**Checks.**

- O(c) pulled back from Spec ℤ lies in P̂ic(X/ℤ)_vert.
- The trivial bundle is vertical.
- O(x)_a for a section x is not vertical: its underlying bundle O(x(S)) is nontrivial.
- π^*(ker(P̂ic(S/k)_int → Pic(S))) ⊂ P̂ic(X/k)_vert.
- O(1) pulled from Spec ℤ has underlying fibre degree 0, curvature 0 and is integrable vertical; O(x)ₐ has underlying curve degree 1 and is not vertical; the identity class has degree and metric shift 0.
- On the square complex torus E(ℂ) = ℂ/(ℤ+iℤ), realized by an elliptic curve over ℚ with j = 1728, write z = x+iy and set f(z) = Σₙ≥₁ 2⁻ⁿ cos(2π4ⁿx). The bound Σ2⁻ⁿ = 1 gives a continuous conjugation-invariant metric ‖1‖ = exp(−f), with trivial model metrics at finite places, hence an ambient adelic divisor (0,f) with zero underlying divisor. For the flat Laplacian ∂²_x+∂²_y its Fourier coefficient at (4ⁿ,0) is −2π²8ⁿ, unbounded. Integrable curvature on a compact curve is a finite signed measure, whose Fourier coefficients are bounded by its total variation. Thus this continuous adelic metric is not integrable and belongs to neither side of the integrable kernel description; continuity alone does not suffice.

*Needs:* §1.5.

### 8.7 Vertical orthogonality and the relative arithmetic Hodge index identity

Let M be a line bundle on X of relative degree zero with an admissible extension M̄, and ι : S → J the section of the relative Jacobian it defines. (1) π_*⟨M̄, V⟩ = 0 in P̂ic(S/k) for every V ∈ P̂ic(X/k)_vert. (2) π_*⟨M̄, M̄⟩ = −ι^*Θ̄ in P̂ic(S/k)_ℚ. (yuan-2026, Theorem 2.8, p. 34; yuan-zhang-2025, Theorem 6.5.1, p. 203; Theorem 6.5.4 and Corollary 6.5.5, p. 207).

*Route.* (1) The Yuan–Zhang arithmetic Hodge index theorem for curves over finitely generated fields gives a unique-up-to-base extension M̄₀ orthogonal to all vertical bundles; fibrewise it is the admissible (flat) metric, so M̄₀ = M̄ up to base twist, which does not affect orthogonality to vertical bundles of fibre degree 0 (Yuan–Zhang Theorem 6.5.1, 6.5.4). (2) On the universal Jacobian, the self-pairing of the normalized Poincaré bundle is the negative canonical twice-theta bundle (Yuan–Zhang Corollary 6.5.5, p. 207). Pull this identity back by ι and use the compatibility of Deligne pairings with base change. A possible base twist of M̄ does not change its self-pairing because its relative degree is zero. No multiplication-by-two map on S is assumed.

**Checks.**

- For S = Spec K with K a number field: deĝ(π_*⟨M̄, M̄⟩)/[K : ℚ] = −2ĥ_θ(M), with ĥ_θ the absolute Néron–Tate height of the principal theta class (§4.6 normalization). The Faltings–Hriljac comparison of GrossZagierAndArithmeticHeights §2.12 is stated with the height relative to K, which is [K : ℚ]ĥ_θ, so it reads deĝ(π_*⟨M̄, M̄⟩) = −2[K : ℚ]ĥ_θ(M) after converting heights as in the Conventions (a height relative to K is [K : ℚ] times the absolute one). Over a one-variable function field with fixed constant field k, deĝ(π_*⟨M̄, M̄⟩) = −2ĥ_θ(M) with heights over k.
- Over a quadratic number field, at a point of absolute principal theta height a, the absolute Θ̄-height is 2a, deĝ(ι^*Θ̄) = [K : ℚ]·2a = 4a and deĝ(π_*⟨M̄, M̄⟩) = −4a, which is −2a after division by [K : ℚ]; omitting the factor [K : ℚ] would give the raw value −2a. For torsion a = 0 both sides vanish. Pairing a degree-zero admissible M with a base constant c gives deg(M)c = 0.

*Needs:* §8.6; §8.4; §8.2; GrossZagierAndArithmeticHeights §2.12.

### 8.8 The arithmetic Hodge index inequality

Let k be ℤ or a field and F a finitely generated field over k; if k is a field, assume that F has transcendence degree at least one over k and that k is algebraically closed in F. Let π : X → Spec F be a geometrically integral, geometrically normal projective variety of dimension n ≥ 1, M̄ an integrable adelic ℚ-line bundle on X/k, and L̄₁, …, L̄ₙ₋₁ nef adelic ℚ-line bundles on X/k whose underlying line bundles Lᵢ are big on X. If the geometric intersection number M·L₁···Lₙ₋₁ on X vanishes, then −π_*⟨M̄, M̄, L̄₁, …, L̄ₙ₋₁⟩ is pseudo-effective in P̂ic(F/k)_int,ℚ: adding it to any big class gives a big class. For n = 1 no Lᵢ occurs and the hypothesis is deg M = 0. When F is a number field (k = ℤ) or a one-variable function field over k, a class on Spec F is pseudo-effective exactly when its degree deĝ is ≥ 0 (its volume is max(deĝ, 0) up to the positive factor of §4.2), so the conclusion reads deĝ(π_*⟨M̄, M̄, L̄₁, …, L̄ₙ₋₁⟩) ≤ 0. (yuan-zhang-2025, Theorem 6.5.8, p. 209, inequality part; the case of curve squares over number fields is used in wilms-2022, proof of Theorem 1.2, and over function fields in looper-silverman-wilms-2021, §6, p. 14.)

*Route.* Case n = 1 (X a curve of genus g; for g = 0 every degree-zero M̄ is vertical up to a base class): write M̄ = M̄_a + V + π^*N̄ with M̄_a an admissible extension of M on a model family (§8.2), V vertical (§8.6) and N̄ a base class; π^*N̄ pairs to zero with every class of fibre degree zero, §8.7(1) makes M̄_a orthogonal to V, §8.7(2) gives −π_*⟨M̄_a, M̄_a⟩ = ι^*Θ̄, which is nef because Θ̄ is (§8.4), and −π_*⟨V, V⟩ is pseudo-effective because each local term is −∫ f c₁(V) ≥ 0 by the local Calabi inequality (§7.2a at non-archimedean points; at archimedean points ∫ f ddᶜf = −∫ df ∧ dᶜf ≤ 0 on the Riemann surface). Case n ≥ 2: perturb the L̄ᵢ by small nef ample model bundles, which keeps M·L₁···Lₙ₋₁ = 0 after the matching correction of M̄ by a multiple of a nef class and is allowed by continuity of the Deligne pairing (§3.2) and of the volume (§4.3(3)); then induct on n through a general member of the complete linear system of a very ample multiple of Lₙ₋₁: for the generic hyperplane the zero locus is geometrically irreducible (LefschetzPencilsAndVanishingCycles §5.1, with s = 1 and dim X ≥ 2), hence so is it for every hyperplane in a dense open subset of the dual projective space (constructibility of geometric irreducibility of fibres, stacks-irreducible-fibres, Lemma 37.27.5, Tag 0559), which has F-points because F is infinite (F ⊇ ℚ when k = ℤ, and F has positive transcendence degree over k when k is a field); for a general member the zero locus Y is also geometrically normal (the Bertini normal-sections contract), hence geometrically integral, and the geometric intersection number M·L₁···Lₙ₋₂ on Y is a positive multiple of M·L₁···Lₙ₋₁ = 0 on X. Bertini smoothness is not used, since X need not be smooth. The pairing on X is expressed through the pairing on Y and the integral of −log‖s‖ against c₁(M̄)²c₁(L̄₁)···c₁(L̄ₙ₋₂) by the Deligne-pairing recursion along the section s (§§0.2 and 3.2; HeightsRationalPointsAndObstructions §5.17a), and the archimedean inequality of the case n = 1 is the current calculus of ComplexComparisonPartII §C5.4. This is Moriwaki's induction for arithmetic varieties as extended to adelic line bundles by Yuan–Zhang and Carney (the works cited for Theorem 6.5.8); for k a field and model bundles the inequality is the classical Hodge index theorem on a projective model (SchemeAndStackFoundations §5.10 in the surface case).

**Checks.**

- Sharpness: for n = 1 and M̄ = π^*N̄ with N̄ ∈ P̂ic(F/k), the pairing is ⟨π^*N̄, π^*N̄⟩ = 0 (fibre degree 0, §3.3), so equality holds and the inequality cannot be strict in general.
- The hypothesis M·L₁···Lₙ₋₁ = 0 is needed: on ℙ¹_ℚ with Fubini–Study O(1), M̄ = O(1) has deg M = 1 and deĝ⟨M̄, M̄⟩ = 1/2 > 0, so −⟨M̄, M̄⟩ is not pseudo-effective.
- A vertical example with strict inequality: on ℙ¹_ℚ, M̄ = (O, f) with f the clamp of log|t|_p to [0, log p] at one prime p and 0 elsewhere has deg M = 0 and deĝ⟨M̄, M̄⟩ = −log p < 0 (§7.2a).
- On C² for a curve C of genus 3 over a one-variable function field, the classes N and M of §13.4 have N² = 8g(g − 1)³ = 192 > 0 with N nef, and M·N = 0; the theorem applies with n = 2 and L̄₁ = N̄ and gives deĝ(M̄²·N̄) ≤ 0, which the curve identity of §8.7 alone does not provide.
- The Bertini input of the induction is irreducibility and normality, not smoothness: the quadric cone xy = z² in ℙ³_ℚ is geometrically normal (a hypersurface satisfies S₂, and its singular locus is the vertex, of codimension 2, so Serre's criterion applies) but singular at the vertex, where the tangent space has dimension 3 while dim X = 2. The smooth-input theorem `bertini_smoothness` of SchemeAndStackFoundations §4.13 does not apply to it, whereas a general plane misses the vertex and cuts a smooth integral conic, as LefschetzPencilsAndVanishingCycles §5.1 and the Bertini normal-sections contract assert.
- Normality of X is needed for normality of the section: the cone in ℙ³_ℚ over a nodal plane cubic is geometrically irreducible but not normal, being singular along the line through the vertex and the node, a locus of codimension one; a general plane misses the vertex and cuts a nodal cubic, irreducible and not normal. The hypothesis of the Bertini normal-sections contract excludes it.

*Needs:* §8.2; §8.4; §8.6; §8.7; §7.2a; §0.2; §3.2; §3.3; §4.2; §4.3; LefschetzPencilsAndVanishingCycles §5.1; the Bertini normal-sections contract (SchemeAndStackFoundations §4.13); SchemeAndStackFoundations §5.10; ComplexComparisonPartII §C5.4; HeightsRationalPointsAndObstructions §5.17a.

### Examples

A pulled-back base metric e⁻¹ is constant on every curve fibre and admissible; the unit-banana model ω has atomic mass 1+1=2 versus admissible edge mass 3·2/3=2 and fails equality of measures. Over a quadratic number field, at a point of absolute principal theta height a, deĝ(π_*⟨M̄, M̄⟩) = −4a and the normalized value is −2a; for torsion a = 0 both sides vanish. Pairing a degree-zero admissible M with a base constant c gives deg(M)c = 0.

### Dependencies

GrossZagierAndArithmeticHeights §§2.4 and 2.12; JacobianChallengePartII §§1.2–1.3, 2.2, 3.1, 3.3, 3.11, 3.13, 4.5 and 4.7; SchemeAndStackFoundations §§4.13 (the Bertini normal-sections contract) and 5.10; LefschetzPencilsAndVanishingCycles §5.1; ComplexComparisonPartII §C5.4; HeightsRationalPointsAndObstructions §5.17a. The internal prerequisites are the individual subsection references above.

## Layer 9: Theta identities and nefness of the admissible canonical bundle

### 9.1 Admissible theta pullback formulas

Let π : X → S be as in Layer 8 (genus g ≥ 1), α a line bundle on X of relative degree d with an admissible extension ᾱ, i_α : X → J the Abel map x ↦ dx − α (JacobianChallengePartII §2.2), w = ω̄₍X/S,a₎ and ⟨A, B⟩ = π_*⟨A, B⟩. In P̂ic(·/k)_ℚ: (1) i_α^*Θ̄ = d²w + 2dᾱ − π^*⟨ᾱ, ᾱ⟩. (2) ⟨i_α^*Θ̄, i_α^*Θ̄⟩ = d⁴⟨w, w⟩ + 4d³⟨w, ᾱ⟩ − (4g − 4)d²⟨ᾱ, ᾱ⟩, and (g − 1)⟨i_α^*Θ̄, i_α^*Θ̄⟩ = g d⁴⟨w, w⟩ + d²ι_α^*Θ̄, where ι_α : S → J corresponds to (2g − 2)α − dω₍X/S₎. (3) For a section x and α = O(x) (d = 1, ᾱ = O(x)_a): i_α^*Θ̄ = w + 2O(x)_a + π^*x^*w and ⟨i_α^*Θ̄, i_α^*Θ̄⟩ = ⟨w, w⟩ + 4g·x^*w. (yuan-2026, Theorem 2.9 and proof, pp. 35–36).

*Route.* (1) Put N̄ = i_α^*Θ̄ − d²w − 2dᾱ + π^*⟨ᾱ,ᾱ⟩. For any section x, §8.7 gives x^*i_α^*Θ̄ = −⟨dO(x)_a − ᾱ,dO(x)_a − ᾱ⟩. §8.5 and bilinearity give x^*N̄ = 0. This argument is compatible with every normal flat base change. Apply it to S′ = X, where the base-changed family has the diagonal section: its evaluation is N̄ itself, so N̄ = 0. This proves the relative arbitrary-degree formula here, rather than assuming that the narrower degree-one, field-valued theta identity of JacobianChallengePartII §§3.4–3.5 supplies it. (2) Expand with ⟨A, π^*N⟩ = deg(A)N and ⟨π^*N, π^*N⟩ = 0 (§3.3); the fibre degree of d²w + 2dᾱ is 2gd². For the second identity insert ⟨M̄, M̄⟩ = −ι_α^*Θ̄ for M̄ = (2g−2)ᾱ − dw (§8.7). (3) Specialize (1)–(2) with §8.5: ⟨O(x)_a, O(x)_a⟩ = −x^*w and ⟨w, O(x)_a⟩ = x^*w.

**Checks.**

- Substituting ι_α^*Θ̄ = −⟨M̄, M̄⟩ into g d⁴⟨w, w⟩ + d²ι_α^*Θ̄ gives (g − 1) times the first expansion in (2).
- (3) is (1)–(2) at d = 1 with ⟨ᾱ, ᾱ⟩ = −x^*w and ⟨w, ᾱ⟩ = x^*w.
- At g=2,d=1, write A=⟨w,w⟩ and b=x*w: the self-pairing is A+8b on both formulas. At d=0 the Abel pullback is a base theta class; both displayed degree-zero self-pairings are 0.
- At g = 1 the second identity of (2) has left side 0. On the right, w is pulled back from S (its fibrewise metric is constant), so ⟨w, w⟩ = 0, and (2g − 2)α − dω = −dω has zero fibre class, so ι_α is the zero section and ι_α^*Θ̄ = e^*Θ̄ = 0 (§8.4); both sides vanish. At g = 1, d = 1, (3) gives ⟨i_α^*Θ̄, i_α^*Θ̄⟩ = 4x^*w, matching the first identity of (2), whose last term carries the factor 4g − 4 = 0.

*Needs:* §8.4; §8.5; §8.7; §3.3; JacobianChallengePartII §3.4–3.5; JacobianChallengePartII §3.7; JacobianChallengePartII §2.2.

### 9.2 Theta identities for the canonical, difference and universal shift maps

With π : X → S of genus g > 1, w, D and ⟨·,·⟩ as above, in P̂ic(·/k)_ℚ: (1) for i_ω(x) = (2g − 2)x − ω₍X/S₎, i_ω^*Θ̄ = 4g(g − 1)w − π^*⟨w, w⟩ and ⟨i_ω^*Θ̄, i_ω^*Θ̄⟩ = 16g(g − 1)³⟨w, w⟩; (2) for j : X ×_S X → J, j(x, y) = y − x, j^*Θ̄ = 2D + p₁^*w + p₂^*w and p₁_*⟨j^*Θ̄, j^*Θ̄⟩ = 4g·w + π^*⟨w, w⟩; (3) for the universal shift τ : J ×_S X → J ×_S J, τ(y, x) = (y, y + (2g − 2)x − ω), with Θ̄_J = p₂^*Θ̄ and q₁ : J ×_S X → J, π_J : J → S: q₁_*⟨τ^*Θ̄_J, τ^*Θ̄_J⟩ = 16(g − 1)³Θ̄ + 16g(g − 1)³π_J^*⟨w, w⟩. (yuan-2026, Theorem 2.10, p. 37; proof pp. 37–39).

*Route.* (1) §9.1 with α = ω, ᾱ = w, d = 2g − 2: d² + 2d = 4g(g − 1) and d²(d² + 4d − 4g + 4) = 16g(g − 1)³. (2) Over the base X (first projection) the curve X ×_S X → X has the diagonal section and canonical bundle p₂^*w; apply (3) of §9.1: x^*w becomes w and ⟨p₂^*w, p₂^*w⟩ = π^*⟨w, w⟩. (3) Over the base J the Abel map with α ↔ ω − y has d = 2g − 2 and (2g − 2)α − dω = −(2g − 2)y, so ι_α^*Θ̄ = (2g − 2)²Θ̄; the second identity of §9.1 (2) gives the formula.

**Checks.**

- At g=2 the canonical coefficients are 8 and 32; difference pairing is 8w+π*P; universal-shift pairing is 16Θ̄+32π*P. At g=3 they are 24,384,12w+π*P and 128Θ̄+384π*P.

*Needs:* §9.1; JacobianChallengePartII §5.1; JacobianChallengePartII §2.6–2.7; JacobianChallengePartII §5.2.

### 9.3 Nefness of ω₍X/S,a₎ and of ⟨ω_a, ω_a⟩

For π : X → S smooth projective of genus g > 1 over S flat quasi-projective normal integral over k: w = i_ω^*Θ̄/(4g(g − 1)) + π^*⟨i_ω^*Θ̄, i_ω^*Θ̄⟩/(64g²(g − 1)⁴) in P̂ic(X/k)_ℚ. Since Θ̄ is nef, so are i_ω^*Θ̄ and its Deligne self-pairing; hence w is nef on X and ⟨w, w⟩ is nef on S. (yuan-2026, Theorem 2.10(1) and proof, pp. 37–38; §1.3, p. 11).

*Route.* Substitute §9.2 (1): the right side equals w − π^*⟨w,w⟩/(4g(g − 1)) + 16g(g − 1)³π^*⟨w,w⟩/(64g²(g − 1)⁴) = w. Pullbacks of nef adelic bundles are nef; Deligne pairings of nef bundles are nef (§3.2); positive combinations of nef bundles are nef. ⟨w, w⟩ = ⟨i_ω^*Θ̄, i_ω^*Θ̄⟩/(16g(g − 1)³) is nef.

**Checks.**

- The coefficient of π^*⟨w, w⟩ on the right side is −1/(4g(g − 1)) + 16g(g − 1)³/(64g²(g − 1)⁴) = 0.
- For S = Spec K this recovers Zhang's theorem that ω₍C/K,a₎ is nef.
- At g=2 the P coefficient is −1/8+32/256=0; at g=3 it is −1/24+384/9216=0. At g=1 both denominators vanish, excluded by g>1.

*Needs:* §9.2; §8.4; §3.2; §1.5.

### Examples

At g=2,d=1, write A=⟨w,w⟩ and b=x*w: the self-pairing is A+8b on both formulas. At d=0 the Abel pullback is a base theta class; both displayed degree-zero self-pairings are 0. At g=2 the P coefficient is −1/8+32/256=0; at g=3 it is −1/24+384/9216=0. At g=1 both denominators vanish, excluded by g>1.

### Dependencies

JacobianChallengePartII §3.4–3.5; JacobianChallengePartII §3.7; JacobianChallengePartII §2.2; JacobianChallengePartII §5.1; JacobianChallengePartII §2.6–2.7; JacobianChallengePartII §5.2. The internal prerequisites are the individual subsection references above.

## Layer 10: Graph invariants and the global ε, φ and Noether divisors

### 10.1 Zhang's invariants of a polarized metrized graph

A polarized metrized graph (pm-graph) of genus g ≥ 1 is a compact connected metric graph Γ (TropicalAndBerkovichArithmetic §3.1) with a vertex genus function q ≥ 0 such that b₁(Γ) + Σ q(x) = g and whose canonical divisor K = Σ_x (v(x) − 2 + 2q(x))x (v the valence) is effective (no genus-zero point of valence one); K has degree 2g − 2; μ = μ_ad is Zhang's admissible measure, g_μ its normalized Green function (TropicalAndBerkovichArithmetic §6.6) and r the effective resistance. Define: δ(Γ) = ℓ(Γ) the total length, δᵢ(Γ) the total length of edges of type i (type 0: non-separating; type i ≥ 1: separating into parts of genus i and g − i); ε(Γ) = ∫∫ r(x, y)δ_K(x)μ(y); φ(Γ) = −ℓ(Γ)/4 + (1/4)∫ g_μ(x, x)((10g + 2)μ − δ_K); τ(Γ) the Baker–Rumely constant, g₍μ_can₎(x, y) = −r(x, y)/2 + τ(Γ) for the canonical (possibly signed) measure μ_can of total mass one. (zhang-2010, §4.1, (4.1.4), pp. 64–66; Lemma 3.5.4, p. 62; baker-rumely-2007, Theorem 14.1, p. 36; Lemma 14.4, p. 37; yuan-2026, §3.2, p. 47; §3.3.1, p. 49; §4.5.1, p. 86).

*Route.* μ_ad, g_μ and the Green-function identities are imported from TropicalAndBerkovichArithmetic §6.6; the formulas for ε and φ are Zhang 2010 §4.1 and (4.1.4), τ is Baker–Rumely §14.

The basic API comprises these facts.

- A metric graph with vertex genus function; genus b₁ + Σq.
- K = Σ(v(x) − 2 + 2q(x))x, degree 2g − 2.
- Effective resistance r(x, y).
- ε(Γ) = ∫∫ r δ_K μ.
- φ(Γ) = −ℓ/4 + ¼∫ g_μ(x, x)((10g + 2)μ − δ_K).
- τ(Γ) from μ_can.
- δᵢ(Γ), total length of edges of type i; ℓ = Σᵢ δᵢ.
- Scaling all lengths by t scales ℓ, δᵢ, ε, φ, τ by t.
- Isometries preserving vertex genera and subdivision by valence-two weight-zero vertices preserve ε, φ, τ and δᵢ; edge-length scaling multiplies each invariant by the same positive factor.

**Checks.**

- For a single vertex of genus g (ℓ = 0), all invariants vanish.
- Doubling every edge length doubles ε, φ, τ and ℓ.
- τ is defined with Baker–Rumely's μ_can, not with μ_ad; using μ_ad in its defining identity gives a non-constant diagonal in general.
- One-loop graph (one vertex of genus g − 1 with a loop of length ℓ): μ = ((g − 1)δ_v + dx/ℓ)/g, K = (2g − 2)v, r(v, t) = t(ℓ − t)/ℓ, so ε = (2g − 2)·(1/g)·(ℓ/6) = (g − 1)ℓ/(3g); τ = ℓ/12; and by the de Jong identity φ = (g − 1)ℓ/(6g).
- For g=2 and unit loop, ε=1/6, φ=1/12, τ=1/12,δ=1; doubling length gives 1/3,1/6,1/6,2. The edgeless genus-two vertex gives all 0.

*Needs:* TropicalAndBerkovichArithmetic §§3.1, 3.3 and 6.6.

### 10.2 Inequalities between graph invariants

For a pm-graph Γ of genus g ≥ 2: (1) r(x, y) is at most the length of any path from x to y, hence ≤ ℓ(Γ); (2) ε(Γ) ≤ (2g − 2)ℓ(Γ); (3) (Cinkir) φ(Γ) ≥ t(g)δ₀(Γ) + Σ₍i≥1₎ (2i(g − i)/g)δᵢ(Γ) with t(2) = 1/27, t(3) = (892 − 11√79)/14580 ≈ 0.0545, t(g) = (g − 1)²/(2g(7g + 5)) for g ≥ 4 (≥ 3/88), so φ(Γ) ≥ ℓ(Γ)/39; more precisely φ ≥ c(g)δ with c(2) = 1/27, c(4) = 3/88, c(g) ≥ 1/25 for g ≥ 5 and c(g) → 1/14; (4) τ(Γ) = ¼∫(∂_x r(x, y))²dx ≥ 0; (5) δ + ε − 2φ = (3/2)δ − 6τ, hence ε ≤ δ/2 + 2φ. (cinkir-2011, Theorem 2.9, p. 5 (arXiv v2); baker-rumely-2007, Lemma 14.4, p. 37; de-jong-2018, Proposition 9.2, p. 31; yuan-2026, Lemma 3.5 proof, pp. 47–48; Theorem 3.7 proof, p. 53; §4.5.1, pp. 86–88).

*Route.* (1) Rayleigh monotonicity: r(x, w) ≤ r(x, z) + r(z, w) and r ≤ edge length on an edge (Baker–Faber §6, Klein–Randić Theorem D as cited by Yuan). (2) ε = ∫∫ r δ_K μ ≤ (deg K)·max r ≤ (2g − 2)ℓ, since K is effective (part of the definition of a pm-graph) and μ is a probability measure (Yuan p. 48). (3) Cinkir arXiv v2 Theorem 2.9 (Yuan cites it as [Cin1, Thm. 2.11]); min_g t(g) = t(4) = 3/88 > 1/39 and 2i(g − i)/g ≥ 1. (4) Baker–Rumely Lemma 14.4. (5) de Jong Proposition 9.2.

**Checks.**

- One-loop graph: ε = (g − 1)ℓ/(3g) ≤ (2g − 2)ℓ; φ = (g − 1)ℓ/(6g) ≥ ℓ/12 ≥ ℓ/39; δ + ε − 2φ = ℓ and (3/2)δ − 6τ = ℓ.
- For the genus-two unit loop, δ+ε−2φ=1+1/6−1/6=1=(3/2)−6/12, φ=1/12≥1/39, ε=1/6≤2. At g=4, t=9/(8·33)=3/88>1/39.

*Needs:* §10.1.

### 10.3 The local φ-invariant of a curve over a complete field

For C smooth projective geometrically connected of genus g > 1 over a complete valued field K (archimedean via C_ℂ), with the canonical admissible metrics of §7.4 at nontrivially valued non-archimedean K and of §7.6(3)–(4) at trivially valued and archimedean K, φ(C) = −∫₍(C×C)^an₎ g₍Δ,a₎ c₁(O(Δ)_a)². (1) Non-archimedean, split semistable reduction, |ϖ| = e⁻¹, unit-edge reduction graph Γ: φ(C) = φ(Γ) of §10.1. (2) Archimedean with the usual absolute value: let Δf = (∂∂̄f)/(πi·μ_Ar) be the Arakelov Laplacian, φ_λ a real eigenbasis orthonormal in L²(μ_Ar) for its positive eigenvalues λ (the zero eigenvalue omitted), and ω₁, …, ω_g a basis of H⁰(C, ω) orthonormal for (i/2)∫α∧β̄; then φ(C) = Σ₍λ>0₎ Σ₍j,k₎ (1/(2λ))|∫_C φ_λ ω_j ∧ ω̄_k|², equivalently Σ (2/λ)|∫_C φ_λ β_j ∧ β̄_k|² for the basis β_j = ω_j/√2 orthonormal for i∫α∧β̄, so φ(C) > 0; for |·| = |·|_∞^b (0 < b ≤ 1) φ(C) is b times this sum, by §7.6(4), and is again > 0. (3) φ(C) ≥ 0 when K is non-archimedean and either trivially valued (then φ(C) = 0) or discretely valued. (4) For a > 0 such that |·|^a is again an absolute value on K (every a > 0 when K is nonarchimedean; ab ≤ 1 when |·| = |·|_∞^b), replacing |·| by |·|^a multiplies φ(C) by a. Under a finite extension K′/K with the extended absolute value, φ is unchanged; with |ϖ| = e⁻¹ renormalized on K′, φ is multiplied by e(K′/K). (yuan-2026, §3.3.1, pp. 48–49; zhang-2010, Theorem 1.3.1, pp. 6–7; Proposition 2.5.3, p. 38; wilms-2017, (2.11), p. 10).

*Route.* (1) Integrate the explicit graph formulas of §7.5 (Zhang 2010 Theorem 1.3.1 and Lemma 3.5.4; finite-extension normalization by ramification index). (2) Spectral expansion g₍Δ,a₎(x, y) = Σ_λ φ_λ(x)φ_λ(y)/λ of the Arakelov Green function and the curvature μ(x) + μ(y) − i Σ_j (β_j(x) ∧ β̄_j(y) + β_j(y) ∧ β̄_j(x)) of O(Δ)_a (Zhang 2010 Proposition 2.5.3, with the second term read as β_j(y) ∧ β̄_j(x)): the terms containing μ integrate to zero against g₍Δ,a₎, and the square of the cross term gives 2Σ(1/λ)|∫φ_λ β_j ∧ β̄_k|². Positivity since each term is ≥ 0 and not all vanish. (3) Trivially valued: the second Check. Discretely valued: choose a finite extension K′/K over which C has split semistable reduction; with the extended absolute value φ(C₍K′₎) = φ(C) by (4), with |ϖ′| renormalized to e⁻¹ the value is multiplied by e(K′/K) and equals φ(Γ′) by (1), and φ(Γ′) ≥ 0 by §10.2(3); so φ(C) = φ(Γ′)/e(K′/K) ≥ 0. (4) By §7.6(1) the Green function g₍Δ,a₎ is multiplied by a, while c₁(O(Δ)_a)², a measure on (C×C)^an, is unchanged along the homeomorphism of §7.6(1).

The basic API comprises these facts.

- φ(C) ∈ ℝ.
- Equals φ(Γ) at split semistable reduction (unit edges, |ϖ| = e⁻¹).
- Spectral formula at archimedean places.
- φ > 0 at archimedean places.
- φ ≥ 0 at trivially valued and at discretely valued non-archimedean K.
- Replacing |·| by |·|^a multiplies φ by a, for every a > 0 at a nonarchimedean K and for ab ≤ 1 at an archimedean K with |·| = |·|_∞^b.
- An isomorphism of curves transports the normalized admissible metric and leaves φ unchanged; extending the absolute value preserves φ, while renormalizing a uniformizer introduces precisely the ramification factor.

**Checks.**

- Good reduction gives φ = 0.
- Over a trivially valued K the canonical metrics are the trivial-model metrics, c₁(O(Δ)_a)² is (Δ²)·δ_ζ = (2 − 2g)δ_ζ with ζ the trivial valuation of the function field of C × C, whose centre is not on Δ, so g₍Δ,a₎(ζ) = 0 and φ(C) = 0.
- A type-0 node of thickness m on an otherwise smooth genus-g special fibre gives φ = (g − 1)m/(6g).
- For a totally ramified extension K′/K of degree e with the normalization |ϖ₍K′₎| = e⁻¹ on K′, φ(C₍K′₎) = e·φ(C): the unit-edge reduction graph over K′ has every edge subdivided e times.
- Dividing the node count by [K′ : K] instead of the ramification index gives the wrong value after an unramified extension.
- A type-zero node at g=2 of thickness 1 gives φ=1/12; an unramified quadratic extension still gives 1/12 and a ramified quadratic renormalization gives 1/6; good reduction gives 0.
- Scaling: the nonarchimedean unit loop at g=2 has φ=1/12, and a=2 gives 1/6. At a real place the usual absolute value admits a=1/2, halving φ while keeping it positive; a=2 is not admissible there, since |1+1|² = 4 > 2.
- Normalization of the spectral formula: writing ω_j = √2β_j with i∫β_j ∧ β̄_k = δ_jk, each |∫φ_λ ω_j ∧ ω̄_k|² is 4|∫φ_λ β_j ∧ β̄_k|². If S = Σ(1/λ)|∫φ_λ β_j ∧ β̄_k|² > 0 (genus two, say), the formula gives (1/2)·4S = 2S in the ω basis and 2S in the β basis, whereas the coefficient 2/λ with the ω basis would give 8S, four times the defining integral.
- Statement (3) is made for trivial and discrete valuations only: the genus-two unit type-0 node gives 1/12 ≥ 0 before and after an unramified quadratic extension, good reduction gives 0 and the trivial valuation gives 0. For the completed residue field of a point of S^an with dense value group no graph expression is asserted, and no consumer evaluates (3) there: §10.6 and §11.3 use discrete and archimedean points, and §§13.2 and 13.9 sum over the places of a global field.

*Needs:* §7.4; §7.5; §7.6; §10.1; §10.2; GrossZagierAndArithmeticHeights §§2.8 and 2.10.

### 10.4 The global ε divisor E_S

Let k be a field, S quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with a stable compactification π̄ : X̄ → S̄ (StableReductionPartII §6.2). With P = π_*⟨w, w⟩, the canonical trivialization over S of π̄_*⟨ω̄, ω̄⟩ − P (both have underlying bundle π_*⟨ω, ω⟩ on S) defines an adelic divisor E_S ∈ D̂iv(S/k) with zero underlying divisor and O(E_S) = π̄_*⟨ω̄, ω̄⟩ − P. At a point v ∈ S^an given by a discrete valuation of k(S)/k with e_v = |ϖ_v|⁻¹ and polarized reduction graph Γ_v, its Green function is g₍E_S₎(v) = ε(Γ_v) log e_v. (yuan-2026, §3.2, pp. 46–47).

*Route.* Both bundles are adelic extensions of π_*⟨ω, ω⟩; their difference has a canonical section 1 over S. Green function at discrete v: Zhang's formula ω_a² = ω²_model − ε (Zhang 1993 Theorem 4.4, recalled in Yuan p. 47) applied to X₍H_v₎.

The basic API comprises these facts.

- E_S ∈ D̂iv(S/k), underlying divisor 0.
- O(E_S) = π̄_*⟨ω̄, ω̄⟩ − π_*⟨w, w⟩.
- g₍E_S₎(v) = ε(Γ_v) log e_v at discrete v.
- Compatible with finite base change.
- Use the canonical algebraic identification of the two pairing lines to fix the rational section, so E_S is a divisor rather than merely a Picard class. Its Green values and zero underlying divisor determine it by adelic analytification.

**Checks.**

- For a smooth projective family over a projective S, E_S = 0.
- Near a generic point of a type-0 boundary divisor of multiplicity m, g₍E_S₎ = (g − 1)m/(3g)·log e_v.
- This construction is over a trivially valued constant field and has no archimedean component. There is no universal arithmetic construction with the same non-archimedean ε values and identically zero archimedean values for degenerating curve families (§10.14); a good-reduction family can have E_S = 0.
- For a type-zero unit node at g=2, g_E/log e=1/6; good reduction gives 0. Replacing the correction by 0 at that node loses 1/6 in the canonical-square comparison.

*Needs:* §8.3; §10.1; StableReductionPartII §6.2; §3.2.

### 10.5 The boundary bound for the ε divisor

In the setting of §10.4, (2g − 2)Δ_S − E_S is an effective adelic divisor with zero underlying divisor on S, where Δ_S is the boundary divisor of the stable compactification restricted as an adelic divisor on S (its Green function at discrete v is ℓ(Γ_v) log e_v). (yuan-2026, Lemma 3.5, pp. 47–48).

*Route.* By §2.5 and §2.4 it suffices to compare Green functions at discrete valuations: g₍Δ_S₎(v)/log e_v = ℓ(Γ_v) (boundary multiplicity = node thickness, StableReductionPartII §5.9), and ε(Γ_v) ≤ (2g − 2)ℓ(Γ_v) (§10.2(2)).

**Checks.**

- Consistency: for a one-node degeneration (g − 1)m/(3g) ≤ (2g − 2)m.
- At g=2 and a type-zero unit node, (2g−2)δ−ε=2−1/6=11/6≥0; at good reduction both terms are 0.

*Needs:* §10.4; §10.2; §2.5; §2.4; StableReductionPartII §§5.2 and 5.9.

### 10.6 The global φ divisor Φ_S

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1, P = π_*⟨w, w⟩ and D = Ō(Δ)_a. Using the canonical algebraic identification (π, π)_*⟨O(Δ), O(Δ), O(Δ)⟩ ≅ π_*⟨ω, ω⟩, define Φ_S ∈ D̂iv(S/k) as the adelic divisor of the corresponding trivializing section of P − (π, π)_*⟨D, D, D⟩; its underlying divisor is 0. At a discrete or archimedean v ∈ S^an its Green function is ∫₍((X×_S X)_v)^an₎ log‖1‖₍Δ,a₎ c₁(O(Δ)_a)² = φ(X₍H_v₎), the φ-invariant of §10.3 for the absolute value of H_v itself, computed with the canonical admissible metrics of §7.4 at nontrivially valued v and of §7.6(3)–(4) at trivially valued and archimedean v (at a trivially valued v the value is 0, §10.3): at a discrete point exp(−t·ord_v) it is t times its value at e_v = e, and at an archimedean point |σ(·)|_∞^t (0 < t ≤ 1, §2.4) it is t times the value of §10.3(2) at the usual absolute value (§10.3(4)). (yuan-2026, §3.3.2, pp. 49–50).

*Route.* Algebraic identification of the triple self-pairing of the diagonal with π_*⟨ω, ω⟩ by adjunction twice. Green function: the metric of P − (π,π)_*⟨D,D,D⟩ at v is computed fibrewise by the Deligne pairing metric (§0.2) and equals the local φ integral (Yuan §3.3.2).

The basic API comprises these facts.

- Φ_S ∈ D̂iv(S/k), underlying divisor 0.
- O(Φ_S) = P − (π,π)_*⟨D, D, D⟩.
- g₍Φ_S₎(v) = φ(X₍H_v₎).
- Compatible with base change.
- The canonical algebraic triple-pairing identification fixes its trivializing section. With zero underlying divisor its Green function determines Φ_S by injectivity of analytification; it is compatible with normal integral base change.

**Checks.**

- At a discrete v over which X has good reduction, g₍Φ_S₎(v) = 0.
- At an archimedean v, g₍Φ_S₎(v) = φ(X_v) > 0; on the archimedean ray over the same complex point the value at |·|_∞^(1/2) is half the value at |·|_∞, and no point with exponent above 1 occurs.
- Integrating over X_v^an (the printed domain) instead of (X ×_S X)_v^an is not defined: the integrand lives on the square.
- For S = Spec O_K[1/N] and a curve with good reduction outside N, the Green function at an archimedean place is φ(C_σ).
- For the genus-two unit loop, g_Φ=1/12 at log e=1, and at good reduction 0; the archimedean value is φ>0. Its integral is on the two-dimensional curve square, where c₁(D)² is top degree.

*Needs:* §8.3; §10.3; §3.2; §0.2; §2.4.

### 10.7 The triple self-pairing of the difference map

With j : X ×_S X → J, j(x, y) = y − x, and Θ̄ canonical: (π, π)_*⟨j^*Θ̄, j^*Θ̄, j^*Θ̄⟩ = (12g − 4)P − 8O(Φ_S) in P̂ic(S/k)_ℚ. Writing wᵢ = pᵢ^*w and B(A, B, C) = (π, π)_*⟨A, B, C⟩, the expansion uses B(wᵢ, wᵢ, wᵢ) = 0, B(w₁, w₁, w₂) = B(w₂, w₂, w₁) = (2g − 2)P, B(D, wᵢ, w_j) = P, B(D, D, wᵢ) = −P and B(D, D, D) = P − O(Φ_S). (yuan-2026, Theorem 3.6 and proof, pp. 51–52; de-jong-2018, Theorem 8.1, p. 28).

*Route.* Expand (2D + w₁ + w₂)³ by multilinearity: 8B(D,D,D) + 12B(D,D,w₁ + w₂) + 6B(D, w₁ + w₂, w₁ + w₂) + B((w₁ + w₂)³). Each auxiliary identity follows from §3.3 and the isometries of §8.3 (B(D, D, wᵢ) = −P by adjunction; B(D, wᵢ, w_j) = P by the pairing isometry). Sum: (8P − 8Φ) − 24P + 24P + 12(g − 1)P = (12g − 4)P − 8Φ.

**Checks.**

- Coefficient check: 8 − 24 + 24 + 12(g − 1) = 12g − 4.
- At g=2, the P coefficient is 8−24+24+12=20=12g−4, and the Φ coefficient is −8; at g=3 it is 32. Diagonal adjunction contributes −P, not +P.

*Needs:* §10.6; §9.2; §3.3; §8.3.

### 10.8 The boundary bound for the φ divisor

In the geometric setting of §10.4 (k a field, stable compactification), Φ_S − Δ_S/39 is an effective adelic divisor on S. (yuan-2026, Theorem 3.7, p. 53).

*Route.* Compare Green functions at discrete valuations: g₍Φ_S₎(v)/log e_v = φ(Γ_v) ≥ ℓ(Γ_v)/39 = g₍Δ_S₎(v)/(39 log e_v) by §10.2(3); conclude by §2.5 and §2.4.

**Checks.**

- One-node degeneration: (g − 1)m/(6g) ≥ m/39.
- For g=2 unit loop, φ−δ/39=1/12−1/39=3/52>0; for the edgeless graph it is 0.

*Needs:* §10.6; §10.2; §10.5; §2.5.

### 10.9 Hodge lower decomposition of ⟨ω_a, ω_a⟩

Let k be a field, S quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with a stable compactification. In P̂ic(S)_ℚ, P = π_*⟨w, w⟩ = (3/(5(2g − 1)(3g − 1)))λ_S̄ + A + O(B) with A nef and B effective with zero underlying divisor, where λ_S̄ is the Hodge line of the compactification. (yuan-2026, Theorem 3.8 and proof, pp. 54–55).

*Route.* P = π̄_*⟨ω̄, ω̄⟩ − O(E_S) = 12λ − O(E_S + Δ_S) (universal Noether formula pulled back, StableReductionPartII §5.19) = 12λ − (2g − 1)O(Δ_S) + eff (§10.5). P = (2/(3g − 1))O(Φ_S) + nef (§10.7 with j^*Θ̄ nef: (12g − 4)P − 8O(Φ_S) is nef) = (2/(39(3g − 1)))O(Δ_S) + nef + eff (§10.8). Cancel Δ_S: (1 + 39(3g − 1)(2g − 1)/2)P = 12λ + nef + eff; replace the coefficient by 20(3g − 1)(2g − 1) ≥ it (allowed since P is nef, §9.3), giving 3/(5(2g − 1)(3g − 1)).

**Checks.**

- Coefficient check: 1 + 19.5(3g − 1)(2g − 1) ≤ 20(3g − 1)(2g − 1) for g ≥ 2, and 12/20 = 3/5.
- At g=2, (2g−1)(3g−1)=15 and 1+(39/2)·15=587/2≤300; the final Hodge coefficient is 3/75=1/25>0. At g=1 this argument is outside its genus hypothesis.

*Needs:* §10.5; §10.8; §10.7; §9.3; StableReductionPartII §§5.1 and 5.19.

### 10.9a The numerically trivial extension of the modified diagonal on the triple-product model

Let R be a discrete valuation ring with fraction field K, uniformizer ϖ and residue field k₀, on which nothing is assumed, and let C/K be smooth projective geometrically connected of genus g ≥ 1 with a point e ∈ C(K) and a split good semistable model 𝒳 over R: 𝒳 is regular, projective and flat over R with generic fibre C, its special fibre 𝒳₀ is reduced and connected, every irreducible component of 𝒳₀ is smooth and geometrically irreducible over k₀, and every singular point of 𝒳₀ is a node of thickness one with k₀-rational branches (étale-locally xy = ϖ). (1) Regular model of the triple product: in 𝒳³ = 𝒳 ×_R 𝒳 ×_R 𝒳 blow up successively, in a fixed order, the strict transforms of the components of the special fibre (the products of three components of 𝒳₀); the result σ : 𝒴 → 𝒳³ is regular, projective and flat over R, an isomorphism over the locus where at most one coordinate is a node, and its special fibre is reduced with smooth components, each the strict transform of a product A × B × C′ of components of 𝒳₀, obtained from it by blowing up curves of the form A × {p} × {q}, {p} × B × {q}, {p} × {q} × C′ (p, q nodes) and their strict transforms (Gross–Schoen's good model). (2) The admissible correspondence: let δ = Δ − p₁^*e on C × C, so that δ_*(x) = x − e, and let δ̂ be the adelic extension of δ carrying the admissible metric of §7.4 on O(Δ − p₁^*e − p₂^*e) and a model metric on p₂^*O(e), scaled so that δ̂ is trivial on C × {e}. For every point y of C^an the restriction of δ̂ to the fibre C × {y} of the second projection has underlying divisor of degree 0 and curvature 0, hence intersection 0 with every vertical divisor of a model of C over the completed residue field of y. (3) Let Δ̄₁₂₃ be the closure in 𝒴 of the small diagonal of C³ and Δ̂_e = (δ̂³)_*Δ̄₁₂₃ its image under the correspondence δ̂ ⊗ δ̂ ⊗ δ̂, a codimension-two cycle with real coefficients on 𝒴 formed by the limits of model intersections of §3.3. Then Δ̂_e restricts to Δ_e = (δ³)_*Δ₁₂₃ on C³ and has intersection number 0 with every vertical 2-cycle of 𝒴: it is numerically trivial on the special fibre. (4) Two extensions of Δ_e on 𝒴 that are numerically trivial on the special fibre differ by a vertical cycle whose intersection with either is 0, so their mutual intersection numbers, and the local terms of the self-height of §10.10, depend neither on the ordering in (1) nor on the choices in (2). For a rational degree-one divisor ξ = Σ aᵢpᵢ with pᵢ ∈ C(K), use δ̂_ξ = Σ aᵢδ̂₍pᵢ₎; the three statements hold with the same proof, term by term. (zhang-2010, §2.3, (2.3.2); Lemma 2.3.3 and its proof, pp. 32–33; §1.1, pp. 4–5; gross-schoen-1995, Definition 6.1, Example 6.2, Proposition 6.3 and Proposition 6.11, pp. 660–664.)

*Route.* (1) is Gross–Schoen Proposition 6.11, proved as Proposition 6.3: étale-locally 𝒳³ is R[x₁, …, x₆]/(x₁x₂ − ϖ, x₃x₄ − ϖ, x₅x₆ − ϖ) at a point with three nodal coordinates, and the ordered blow-ups along the strict transforms of the components replace the non-principal ideals such as (x₁, x₃), chart by chart, by principal ones without introducing new fibre components or multiplicities; only the valuation ring R enters, and the components stay geometrically irreducible because they are in bijection with those of the special fibre of 𝒳³. (2) is the curvature identity c₁(L̄) = deg(L)μ_a of §7.2 for the restricted admissible metric, together with the vanishing of the pairing of a curvature-zero adelic divisor with a vertical one (§3.3; §8.7(1) in the family form). (3) is Zhang's argument. The number Δ̂_e·V for an irreducible vertical 2-cycle V is the degree of a zero-cycle on the special fibre and may be computed after base change to the algebraic closure of k₀, where the components have rational points; V lies in one component, the blow-up of A × B × C′, and is a linear combination of exceptional divisors and of strict transforms of divisors of A × B × C′. By the projection formula Δ̂_e·V is the intersection on 𝒳³ × 𝒳³ of σ_*V × σ_*Δ̄₁₂₃ with the correspondence δ̂³, pulled back from C³ × C³. For an exceptional divisor E the image σ(E) is a curve, so σ_*E = 0 and the term vanishes. For a divisor of A × B × C′, the cube-for-products contract makes it linearly equivalent to a sum of pullbacks of divisors V₁₂, V₂₃, V₃₁ along the pairwise projections, and for V = V₁₂ × C′ the correspondence acts factorwise: the factor acting on the vertical divisor C′ of the first-coordinate model is p₂_*(p₁^*C′·δ̂), which over every point y of the second factor is the intersection of C′ with the restriction of δ̂ to C × {y}, zero by (2). The other two pullback types are the same computation in another coordinate. (4) is the definition of numerical triviality on vertical cycles. This is Zhang's construction of the extension; it does not use Gross–Schoen Proposition 7.2, whose hypothesis that k₀ be finitely generated over its prime field fails, for instance, for the residue field ℂ of every place of ℂ(t).

The basic API comprises these facts.

- 𝒴 is regular, projective and flat over R, with reduced special fibre and smooth geometrically irreducible fibre components.
- σ : 𝒴 → 𝒳³ is an isomorphism where at most one coordinate is a node.
- δ̂ is integrable, trivial on C × {e}, and its restriction to each fibre of the second projection has degree 0 and curvature 0.
- Δ̂_e extends Δ_e and has intersection 0 with every vertical 2-cycle of 𝒴.
- The mutual intersection numbers of numerically trivial extensions are independent of the ordering and of the choices in δ̂.
- Compatibility with finite extension of K: for a split good semistable model over the integral closure of R in K′, the model and the extension are those of the base-changed data, and the local intersection numbers scale as in §7.5(2).

**Checks.**

- Good reduction: if 𝒳 is smooth over R then 𝒳³ is regular, 𝒴 = 𝒳³, δ̂ is the closure of δ with its model metric, and the restriction of Δ̂_e to the special fibre is the modified diagonal of (𝒳₀, e₀), which is homologically trivial (zhang-2010, Lemma 2.3.1); its intersection numbers with vertical 2-cycles are cup products on the smooth proper threefold 𝒳₀³ and vanish. Directly, for a smooth point x ≠ e₀ of 𝒳₀ and W = {x} × 𝒳₀ × 𝒳₀, the seven closures meet W transversally in one point or not at all, with signs 1 − 1 − 0 − 1 + 1 + 0 + 0 = 0.
- The naive closure is wrong when the fibre is reducible: for two components A and B meeting in one node, a smooth point x of A off B, and e reducing to a point of B off A, the sum of the strict transforms of the seven cycles Δ_T meets the vertical surface {x} × A × A only at the point (x, x, x) of Δ̄₁₂₃, which lies where σ is an isomorphism and where the intersection is transversal of multiplicity 1 (the ideals (u₁ − u₂, u₁ − u₃) and (ϖ, u₁ − c) together generate the maximal ideal of a regular local ring of dimension 4); the six other closures miss {x} × A × A because each of their points has a coordinate equal to e₀ ∉ A. So the closure has intersection number [k(x) : k₀] ≠ 0 with a vertical 2-cycle, equal to 1 for a rational point x, and the correction carried by δ̂ is necessary.
- The correction on a fibre C × {p}: with components A ∋ p̄ and B ∋ ē meeting in one node of thickness one, the closures satisfy (p̄ − ē)·A = 1 and (p̄ − ē)·B = −1; adding the vertical divisor A (equivalently −B, since A + B is a fibre) gives (p̄ − ē + A)·A = 1 − 1 = 0 and (p̄ − ē + A)·B = −1 + 1 = 0, using A² = −1 and A·B = 1. This is the correction the admissible metric of §7.5 supplies through the Green function of the one-edge graph, whereas the model metric alone leaves intersection 1 with A.

*Needs:* §7.2; §7.4; §7.5; §3.3; §8.7; the cube-for-products contract (JacobianChallenge Layer E); SchemeAndStackFoundations §§4.11, 4.13 and 5.1–5.3.

### 10.10 The Gross–Schoen height and its adelic variation

Let K be a number field or one-variable function field and C/K smooth projective geometrically connected of genus g > 1; choose a rational degree-one divisor ξ = Σ aᵢpᵢ with (2g − 2)ξ = ω_C. The modified diagonal Δ_ξ = Δ₁₂₃ − Δ₁₂ − Δ₂₃ − Δ₃₁ + Δ₁ + Δ₂ + Δ₃ ∈ CH²(C³)_ℚ (Δ₁₂ = Σ aᵢ{(x, x, pᵢ)}, Δ₁ = Σ aᵢa_j{(x, pᵢ, p_j)}, and permutations) is homologically trivial, and its Gross–Schoen self-height satisfies ⟨Δ_ξ, Δ_ξ⟩ = ((2g + 1)/(2g − 2))ω_a² − Σ_v φ_v(C)deg(v) (Zhang), the sum being the global φ(C) of §13.2. At a finite place v, φ_v(C) is the local invariant of §10.3 for the absolute value normalized by |ϖ_v| = e⁻¹, that is the reduction-graph invariant of §10.3(1) after a finite extension with split semistable reduction, divided by its ramification index, and deg(v) = [k(v) : k] for function fields and log Nv for number fields; at an archimedean place φ_v(C) is the invariant of §10.3(2) for the usual absolute value and deg(v) is 1 for a real and 2 for a complex place. For the absolute value |ϖ_v|_v = e^(−deg v) of the conventions, the local invariant of §10.3 is deg(v)·φ_v(C) by §10.3(4), so the sum is also Σ_v φ(C_v) over those normalized local invariants with no further weight; weighting the normalized invariant by deg(v) once more would count a place of degree two twice. For a smooth family π : X → S over a quasi-projective normal K-variety, L = ((2g + 1)/(2g − 2))π_*⟨w, w⟩ − O(Φ_S) ∈ P̂ic(S/k)_ℚ satisfies h_L(y) = ⟨Δ_ξ(X_y), Δ_ξ(X_y)⟩/a_y for y ∈ S(K̄), where the pairing in the numerator uses the raw local sums over K(y), and a_y = [K(y) : ℚ] for number fields or [K(y) : K] for function fields. This is the normalized fibrewise Gross–Schoen height; the displayed single-curve identity uses raw intersections and raw local sums on both sides. No nefness or bigness of L is asserted. (zhang-2010, §1.1, pp. 3–4; Theorem 1.3.1, pp. 6–7, whose local term at a nonarchimedean place is the graph integral with the lengths of the reduction graph; Theorem 2.3.5 and Theorem 2.5.1, pp. 34–36; yuan-2026, §3.3.5, pp. 53–54, and the global φ).

*Route.* Use the modified-diagonal projector to prove homological triviality. Over a finite extension K′/K at every finite place of which C has a split good semistable model (semistable reduction, then adjoin a square root of a uniformizer and blow up to separate the self-nodes of components and give thickness one, then extend residue fields to split the components and nodes; gross-schoen-1995, Example 6.2), take at each finite place the regular model of the triple product and the extension Δ̂_ξ of §10.9a, which has intersection 0 with every vertical 2-cycle, and at archimedean places the Green current of curvature 0 carried by the admissible metrics of degree 0 (GrossZagierAndArithmeticHeights §2.4). The height is the self-intersection ⟨Δ_ξ, Δ_ξ⟩ = Δ̂_ξ·Δ̂_ξ, independent of the choices by §10.9a(4), and equals the triple self-intersection of the admissible correspondence t̂_ξ = D − p₁^*ξ̂ − p₂^*ξ̂, corrected by a multiple of a fibre so as to vanish on C × {ξ} and {ξ} × C, over K′ (zhang-2010, Theorem 2.3.5; Theorem 2.5.1); descend by [K′ : K]. The residue fields of the places of K′ are arbitrary: no finite-generation hypothesis on them enters, since §10.9a does not use Gross–Schoen Proposition 7.2. Extend in the rational degree-one class by multilinearity and use Zhang’s canonical-class formula. Zhang 2010 Theorem 1.3.1 with x_ξ = 0 (the extra term 6(g − 1)⟨x_ξ, x_ξ⟩ vanishes since (2g − 2)ξ = ω). Family version: restrict L to y and use §4.6 with §10.6 (Yuan §3.3.5).

The basic API comprises these facts.

- Δ_ξ ∈ CH²(C³)_ℚ.
- Homologically trivial.
- ⟨Δ_ξ, Δ_ξ⟩ = Δ̂_ξ·Δ̂_ξ through the extension of §10.9a, unconditional for these cycles over every number field and every one-variable function field, whatever the constant field.
- ⟨Δ_ξ, Δ_ξ⟩ = ((2g + 1)/(2g − 2))ω_a² − Σ_v φ_v(C)deg(v) = ((2g + 1)/(2g − 2))ω_a² − φ(C).
- L = ((2g+1)/(2g−2))π_*⟨w,w⟩ − O(Φ_S); its point height is the raw fibrewise Gross–Schoen self-height divided by a_y as in the statement.
- Formation of the rational modified diagonal commutes with field extension; its raw self-height scales by the extension degree, and dividing by a_y gives the stated fibrewise normalized height.

**Checks.**

- For hyperelliptic C, Δ_ξ = 0 in CH²(C³)_ℚ for ξ a Weierstrass point, so ⟨Δ_ξ, Δ_ξ⟩ = 0.
- Δ_ξ has degree 0 against every product class (homological triviality).
- The raw self-height multiplies by [K′ : K] under finite extension. Division by [K : ℚ] makes it invariant for number fields; for function fields with fixed k it scales by [K′ : K]. The field used to represent y in the family formula does not affect its normalized point height.
- L is not claimed nef: its nefness is the open question of Yuan p. 54.
- If C is hyperelliptic then ⟨Δ_ξ, Δ_ξ⟩ = 0, giving ω_a² = ((2g − 2)/(2g + 1))Σφ (§13.4).
- For a hyperelliptic genus-two curve, Δξ=0 gives height 0 and (5/2)W−φ=0, hence W=2φ/5; at φ=5 this gives W=2 and height 0. A degree-two raw base extension gives W=4,φ=10, again 0.
- Place weights: over K = ℚ(t) let v be the place of the irreducible polynomial t² + 1, of residue field ℚ(i) and degree 2, and C the genus-two curve y² = (x² − t² − 1)(x − 1)(x − 2)(x + 1/2). Modulo v the right side is x²(x − 1)(x − 2)(x + 1/2) with the unit factor equal to 1 at x = 0, so the reduction has one node y² = x² with rational branches, of thickness one since x² − (t² + 1) is a uniformizer times a unit there; its partial normalization is the connected genus-one curve y² = x(x − 1)(x − 2)(x + 1/2), so the node is of type 0 and the reduction graph is a unit loop with φ_v(C) = (g − 1)/(6g) = 1/12. The contribution to φ(C) is φ_v(C)deg(v) = 1/6. The local invariant of §10.3 for the absolute value |ϖ_v| = e⁻² of the conventions is itself 1/6 by §10.3(4), so weighting it by deg(v) once more would give 1/3, twice the correct contribution. Over a number field the same node at a place of residue field 𝔽₄ contributes (1/12) log 4.
- Residue fields: for K = ℂ(t) every residue field is ℂ, not finitely generated over ℚ, and the construction of §10.9a applies unchanged; a genus-two curve over ℂ(t) with one unit type-0 node at t = 0 and good reduction elsewhere has φ(C) = 1/12 and ⟨Δ_ξ, Δ_ξ⟩ = (5/2)ω_a² − 1/12.

*Needs:* §10.9a; §10.6; §10.7; §7.7; §4.6; SchemeAndStackFoundations §5.1 (Chow groups); MotivesAndAlgebraicCycles §§2.2–2.3; GrossZagierAndArithmeticHeights §2.4.

### 10.11 Faltings' δ-invariant

For a compact connected Riemann surface X of genus g ≥ 1, Faltings' δ(X) ∈ ℝ is the constant in Faltings' comparison of the Arakelov metric on det H⁰(X, ω) with ‖θ‖ and Arakelov Green functions (Faltings 1984, p. 401–402). Fix a period matrix Ω with Y = Im Ω, θ(z,Ω) = Σ₍n∈ℤ^g₎ exp(πi nᵗΩn + 2πi nᵗz), ‖θ‖(z) = (det Y)^(1/4) exp(−π(Im z)ᵗY⁻¹(Im z))|θ(z,Ω)|, and ν = (i/2)Σ₍j,k₎(Y⁻¹)ⱼₖdz_j ∧ d z̄_k, transported to Picᵍ⁻¹(X) through its theta divisor; ∫ν^g/g! = 1. Equivalently (Wilms Theorem 1.1) δ(X) = −24∫₍Picᵍ⁻¹(X)₎ log‖θ‖ ν^g/g! + 2φ(X) − 8g log 2π. For a semistable curve over a number field, the global δ(C) = Σ₍v finite₎ δ_v log Nv + Σ_σ δ(C_σ), with δ_v the number of singular points of the geometric special fibre of the minimal regular model at v. (wilms-2017, Theorem 1.1, p. 1; §2.2, p. 8; yuan-2026, §4.5.2, p. 89; wilms-2017, §2.1, pp. 5–7).

*Route.* Definition by Faltings; Wilms' formula as a characterisation (Wilms Theorem 1.1).

The basic API comprises these facts.

- δ(X) ∈ ℝ for a compact Riemann surface.
- Wilms' formula in terms of ∫log‖θ‖ and φ.
- Global δ(C) = Σ δ_v log Nv + Σ_σ δ(C_σ).
- Depends only on the isomorphism class of X.
- The normalized theta norm and Haar volume descend under changes of period coordinates, so the Wilms expression determines the same δ on isomorphic Riemann surfaces; global archimedean sums count complex embeddings twice.

**Checks.**

- For g = 1, δ > −9.
- For g = 1 the φ term in Wilms' formula vanishes.
- At a finite place with semistable minimal regular model, δ_v is the number of nodes of the geometric special fibre.
- δ is not a multiple of φ: the theta integral term is independent.
- At g=1, φ=0 gives δ=−24I−8log(2π); rescaling theta norm by e shifts I by 1 and this expression by −24, so the specified Fourier norm is necessary.

*Needs:* §10.3; GrossZagierAndArithmeticHeights §2.8.

### 10.12 The arithmetic Noether formula

For C/K smooth projective geometrically connected of genus g > 1 over a number field with semistable minimal regular model 𝒞 over O_K, 12 deĝ(λ̄) = ω²₍𝒞,Ar₎ + δ(C) − 4g[K : ℚ]log(2π), where λ̄ = det π_*ω with the determinant L² metric (§5.4), ω₍𝒞,Ar₎ the relative dualizing sheaf with the Arakelov metric (GrossZagierAndArithmeticHeights §2.10) and δ(C) the global δ-invariant. (yuan-2026, §4.5.2, p. 89).

*Route.* Faltings, Calculus on arithmetic surfaces, Theorem 6, with the constant compared in Moret-Bailly, La formule de Noether pour les surfaces arithmétiques, Théorème 2.5 (as cited by Yuan p. 89). A route is the determinant-of-cohomology/Deligne-pairing comparison with its Quillen metric, followed by comparison to the L² Hodge metric and the δ term. The primary Noether locator is Moret-Bailly, Théorème 2.5; its text is uncertified, and the normalization is also given explicitly by Yuan at p. 89.

**Checks.**

- With δ ≥ −2g log(2π⁴) at each archimedean place (Wilms), the formula gives [ω²_Ar] ≤ 12h_Fal + 6g log(2π²) (§13.9).
- At g=2 and [K:ℚ]=1, the Noether constant is −8log(2π); solving gives W_Ar=12h−δ+8log(2π). A degree-two extension doubles all raw terms including the constant.

*Needs:* §10.11; §5.4; GrossZagierAndArithmeticHeights §2.10; ArakelovGeometryAndAbelianHeights §3.4.

### 10.13 The admissible Noether divisor Ξ_S

Let k be ℤ or ℚ, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1. The semi-canonical Noether isomorphism 12λ_S ≅ π_*⟨ω, ω⟩ (on S, where Δ_S is empty; StableReductionPartII §5.21), unique up to sign, defines Ξ_S ∈ D̂iv(S/ℤ) with zero underlying divisor and O(Ξ_S) = 12λ̄_S − π_*⟨w, w⟩, using the arithmetic λ̄_S and w over ℤ even when S is over ℚ (§1.6); it is independent of the sign. Its Green function is δ_v + ε_v at a normalized discrete v and δ(X_v) − 4g log(2π) at a normalized archimedean v. The forgetful/base-change homomorphism D̂iv(S/ℤ) → D̂iv(S_ℚ/ℚ) restricts projective models to ℚ and forgets their archimedean metrics. If the rational-base family has a stable compactification, it sends Ξ_S to E₍S_ℚ₎ + Δ₍S_ℚ₎. (yuan-2026, §4.5.2, pp. 90–91; yuan-zhang-2025, §2.5.5.)

*Route.* The inverse Noether isomorphism gives a nowhere-vanishing algebraic section of 12λ_S − π_*⟨ω,ω⟩. Give this line the arithmetic metric 12λ̄_S − π_*⟨w,w⟩ and take the section's adelic divisor Ξ_S; the sign ambiguity does not change it (|−s| = |s|). Local Green functions: at discrete v, compare with Zhang's ω_a² = ω²_model − ε and the local Noether formula (δ_v nodes); at archimedean v, the arithmetic Noether formula §10.12 fibrewise. Geometric part: compare with §10.4 and the universal Noether formula.

The basic API comprises these facts.

- Ξ_S ∈ D̂iv(S/ℤ), underlying divisor 0, for S over either ℤ or ℚ.
- O(Ξ_S) = 12λ̄_S − π_*⟨w, w⟩.
- Green function δ_v + ε_v at discrete v.
- Green function δ(X_v) − 4g log 2π at archimedean v.
- The homomorphism D̂iv(S/ℤ) → D̂iv(S_ℚ/ℚ) sends Ξ_S to E₍S_ℚ₎ + Δ₍S_ℚ₎ when the rational-base family has the stated stable compactification; the arithmetic metrics are forgotten before this geometric equality.
- Changing the semi-canonical Noether isomorphism by its allowed sign leaves the Green function unchanged; the zero underlying divisor and stated local Green functions determine Ξ_S.

**Checks.**

- Replacing the semi-canonical isomorphism by its negative gives the same Ξ_S.
- At a discrete v of good reduction the Green function is 0.
- At an archimedean point v the Green function is δ(X_v) − 4g log 2π, which by Wilms is > −2g log(2π⁴) − 4g log 2π.
- Changing the Noether section s to −s has |−s|=|s|, hence Green difference 0; at a g=2 unit node, g_Ξ=δ+ε=7/6 and at good reduction 0.
- For S = Spec ℚ, D̂iv(S/ℚ) = 0 and its analytification over trivially valued ℚ is a single point. The arithmetic Ξ_S can have value 7/6 at a genus-two normalized unit type-zero reduction and an archimedean value δ(X_∞)−8log(2π); its image in D̂iv(S/ℚ) is nevertheless 0. Thus the arithmetic carrier cannot be replaced by the geometric one.

*Needs:* §1.6; §5.4; §8.3; §10.12; §10.4; StableReductionPartII §§5.19 and 5.21.

### 10.14 What can and cannot be globalized

Let g > 1, N ≥ 3 and S = M₍g,N₎ the fine moduli scheme of smooth genus-g curves with full level-N structure over ℤ[1/N], with its universal curve π : X → S (StableReductionPartII §4.8). (1) There is no E ∈ D̂iv(S/ℤ) with zero underlying divisor whose Green function is ε(Γ_v) log e_v at every discrete v ∈ S^an (notation of §10.4: Γ_v the polarized reduction graph of X₍H_v₎ and e_v = |ϖ_v|⁻¹) and 0 at every archimedean v ∈ S^an. (2) Consequently there is no E′ ∈ D̂iv(S/ℤ) with zero underlying divisor whose Green function is δ(Γ_v) log e_v (the total length of Γ_v times log e_v) at every discrete v and t·δ(X_v) at every archimedean v = |σ(·)|_∞^t, δ(X_v) Faltings' δ of §10.11: otherwise Ξ_S − E′ (§10.13), plus the pullback of the arithmetic divisor on Spec ℤ with zero underlying divisor and Green value t·4g log(2π) at |·|_∞^t, would be an E as in (1). Special families with zero correction are not excluded. The targets here are the hybrid obstruction and the existence of Φ and Ξ; their coercive boundary consequences are proved in §§11.1 and 13.8. (yuan-2026, Remark 3.11, p. 59; Remark 4.13, p. 91).

*Route.* Use a one-parameter complex smoothing with a nonseparating node and parameter t. For t_i → 0 with |t_i| ≤ e⁻¹, rescale the complex absolute value by a_i = 1/log(1/|t_i|); then 0 < a_i ≤ 1, so |·|^(a_i) is again an absolute value and the rescaled point lies on the archimedean ray of M(ℤ) (§2.1), |t_i|^(a_i) = e⁻¹, and a_i → 0 makes the norm on constants trivial. In the hybrid space these points approach a nontrivial divisorial valuation with ε(Γ) > 0. The proposed archimedean-zero Green function stays zero along the sequence but would be positive at the limit. The obstruction is at this valuation, not at the trivial valuation on the function field. This explains the general obstruction of Yuan Remark 4.13(1). Use only continuity on the hybrid space for this obstruction; the coercivity targets below do not assume a sharp asymptotic expansion.

**Checks.**

- Φ_S and Ξ_S exist arithmetically; the E_S construction here is geometric. The obstruction concerns a universal rule for degenerating families, and does not exclude E_S = 0 on a special good-reduction family.
- In a unit type-zero g=2 smoothing, |t_i|^(1/log(1/|t_i|))=e⁻¹; at |t_i| = e⁻ⁿ the exponent is 1/n ≤ 1, whereas |t_i| = e^(−1/2) would need the inadmissible exponent 2. Proposed archimedean ε-values remain 0, while the limiting divisorial value is 1/6, contradicting continuity.

*Needs:* §10.4; §10.13; §10.6; §10.11; §2.1; TropicalAndBerkovichArithmetic §0.23; StableReductionPartII §§4.8 and 6.10.

### Examples

For g=2 and unit loop, ε=1/6, φ=1/12, τ=1/12,δ=1; doubling length gives 1/3,1/6,1/6,2. The edgeless genus-two vertex gives all 0. In a unit type-zero g=2 smoothing, |t_i|^(1/log(1/|t_i|))=e⁻¹. Proposed archimedean ε-values remain 0, while the limiting divisorial value is 1/6, contradicting continuity.

### Dependencies

TropicalAndBerkovichArithmetic §§0.23, 3.1, 3.3 and 6.6; GrossZagierAndArithmeticHeights §§2.4, 2.8 and 2.10; StableReductionPartII §§5.1–5.2, 5.9, 5.19, 5.21 and 6.2; SchemeAndStackFoundations §§4.11, 4.13 and 5.1–5.3; MotivesAndAlgebraicCycles §§2.2–2.3; JacobianChallenge Layer E (the cube-for-products contract); ArakelovGeometryAndAbelianHeights §3.4. The internal prerequisites are the individual subsection references above.

## Layer 11: Bigness of the admissible canonical bundle

### 11.1 Uniform positivity of φ on compact Riemann surfaces

For each g > 1 there is c₀(g) > 0 with φ(C) ≥ c₀(g) for every compact Riemann surface C of genus g. On the complex points of a fine full-level moduli space M₍g,N₎ (N ≥ 3), φ is continuous, positive and tends to +∞ at the boundary of the stable compactification. (yuan-2026, Theorem 3.10 and proof, pp. 56–58).

*Route.* Positivity at each point: §10.3(2). Continuity on M₍g,N₎(ℂ): φ is the Green function of Φ̃ over (ℂ, |·|) (§1.7), continuous on M^an. Boundary growth requires the complex-base completion, rather than a direct comparison of geometric and archimedean Green functions. Over B = (ℂ,|·|), approximate (Φ̃,φ) by model divisors (D_i,g_i), with boundary error a_i(E₀,g₀), a_i → 0. Then φ ≥ g_i − a_i g₀ and D_i − a_iE₀ ≥ Φ̃ − 2a_iE₀ ≥ (1/39 − 2a_i)E₀. Choose a_i < 1/78. The function g_i − a_i g₀ is a Green function of a positive multiple of the full boundary, so it tends to +∞ there. This proves the required growth (Yuan p. 58). Compactness of the stable compactification then gives a positive minimum (Yuan Theorem 3.10 proof, pp. 57–58).

**Checks.**

- For g = 2 the bound gives φ ≥ c₀(2) > 0; a one-node complex smoothing has φ → +∞, so its limit cannot be a zero minimum.
- Choose boundary approximation error a=1/156: 1/39−2a=1/78>0. Along |t|=e^(−n), the lower-bound Green term has slope at least n/78 plus a bounded term and tends to +∞.

*Needs:* §10.3; §10.8; §1.7; StableReductionPartII §§4.8 and 6.10.

### 11.2 Bigness of ⟨ω_a, ω_a⟩ in the geometric case

Let k be a field, S quasi-projective normal integral over k and π : X → S smooth of genus g > 1 with maximal variation (StableReductionPartII §6.1). Then P = π_*⟨w, w⟩ is nef and big on S/k. When dim S = 0, S = Spec F with F/k finite; every adelic line bundle is nef and has P⁰ = vol^(S,P) = [F:k] > 0, so is big (§§3.1 and 4.2). (yuan-2026, Theorem 3.2, p. 40; proof after Remark 3.9, pp. 55–56).

*Route.* For dim S = 0 use deg_k[S]>0 and Hilbert–Samuel. For dim S ≥ 1, nefness: §9.3. Pass to a finite cover with a stable compactification (StableReductionPartII §6.8) and normalize; bigness of nef bundles is invariant under finite covers (§4.5). By §10.9, P = cλ_S̄ + A + O(B) with c > 0; λ_S̄ is nef and big under maximal variation (StableReductionPartII §6.9, via the Torelli map to the minimal compactification), so cλ_S̄ + A is nef and big, and adding O(B) effective keeps bigness.

**Checks.**

- For S=Spec 𝔽₂ and S=Spec 𝔽₄ over 𝔽₂, P is the trivial line and its empty self-intersection and volume are respectively 1 and 2, both positive. A zero-dimensional moduli image still has maximal variation over this zero-dimensional base.
- For S a curve with a non-isotrivial family, P has positive degree.
- For a maximal-variation base curve with Hodge degree λ=1, the g=2 decomposition gives deg P≥1/25>0; a constant family instead has geometric deg P=0 and is outside maximal variation in dimension 1.

*Needs:* §10.9; §9.3; §4.5; StableReductionPartII §§6.1, 6.8 and 6.9; §4.2; StableReductionPartII §§6.21–6.22.

### 11.3 Bigness of ⟨ω_a, ω_a⟩ in the arithmetic case

Let S be flat quasi-projective normal integral over ℤ, π : X → S smooth of genus g > 1 with maximal variation, d = dim S and P = π_*⟨w, w⟩. Then P = (2/(3g − 1))O(c₀) + nef + effective with c₀ = c₀(g) of §11.1, where O(c₀) is the trivial bundle on Spec ℤ with ‖1‖ = e^(−c₀); hence P^d ≥ (2c₀/(3g − 1))·(P|₍S_ℚ/ℚ₎)ᵈ⁻¹ > 0, and P is nef and big on S/ℤ. (yuan-2026, Proof of the arithmetic case of Theorem 3.2, p. 57; §1.4, p. 14).

*Route.* By §10.7, P = (2/(3g − 1))O(Φ_S) + nef. Φ_S − c₀ is effective: its Green function is φ at the usual archimedean points (≥ c₀ by §11.1), both terms are multiplied by t at |·|_∞^t (0 < t ≤ 1; §10.3(4) and §2.3), and it is φ ≥ 0 at the discrete points of the test set (§10.3(3)). Expand P^d = Pᵈ⁻¹·((2/(3g−1))O(c₀) + nef + eff) ≥ (2c₀/(3g − 1))(P|₍S_ℚ₎)ᵈ⁻¹, and (P|₍S_ℚ₎)ᵈ⁻¹ > 0 by §11.2 over ℚ; conclude by §4.3.

**Checks.**

- For d = 1 and S open in Spec O_K, the normalized degree is deĝ(P)/[K : ℚ] ≥ 2c₀/(3g − 1) > 0; the unnormalized degree has the additional factor [K : ℚ].
- For d=1 and generic field K, the empty geometric intersection on S_ℚ=Spec K is [K:ℚ]. At g=2 and [K:ℚ]=2, the displayed expansion gives (2c₀/5)·2=4c₀/5, while replacing the empty degree by 1 would give only 2c₀/5.
- At g=2,d=1, the normalized lower bound is 2c₀/5; over [K:ℚ]=2 raw degree is at least 4c₀/5, so omission of the field degree halves the raw bound.

*Needs:* §10.7; §11.1; §10.3; §11.2; §4.3; §3.1; §2.3.

### 11.4 Bigness of the admissible canonical bundle

Let k be ℤ or a field, S flat quasi-projective normal integral over k and π : X → S smooth of genus g > 1 with maximal variation. Then ω₍X/S,a₎ is nef and big on X/k, and π_*⟨ω_a, ω_a⟩ is nef and big on S/k. (yuan-2026, Theorem 1.3, pp. 11–12; Theorem 3.1 and §3.1, p. 40).

*Route.* Nefness: §9.3. Bigness of P = π_*⟨w, w⟩: §11.2 or §11.3. Bigness of w: 4g(g − 1)w = i_ω^*Θ̄ + π^*P (§9.2(1)). With d = dim S, expand (i_ω^*Θ̄ + π^*P)ᵈ⁺¹: all terms are ≥ 0 by nefness, and the term (d + 1)·i_ω^*Θ̄·(π^*P)^d equals (d + 1)·a·P^d > 0, where a = 4g(g − 1)(2g − 2) is the generic fibre degree of i_ω^*Θ̄ (§3.3); conclude by §4.3 (Yuan p. 40).

**Checks.**

- For S = Spec K a global field this is Zhang's ω_a² > 0 for non-isotrivial curves (the function-field case needs non-isotriviality, which is maximal variation over the constant field).
- For d=0 and S=Spec F over k with [F:k]=2, g=2 gives P⁰=2 and the positive Abel term 1·16·2=32; dividing by 4g(g−1)=8 gives deg_k ω=4=2·[F:k].
- At g=2 the Abel degree is 4·2·1·2=16. For dim S=1, the positive expansion term is 2·16·P¹=32P¹>0; for S a field over itself, deg ω=2>0.

*Needs:* §11.2; §11.3; §9.3; §9.2; §4.3; §3.3.

### Examples

Choose boundary approximation error a=1/156: 1/39−2a=1/78>0. Along |t|=e^(−n), the lower-bound Green term has slope at least n/78 plus a bounded term and tends to +∞. At g=2 the Abel degree is 4·2·1·2=16. For dim S=1, the positive expansion term is 2·16·P¹=32P¹>0; for S a field over itself, deg ω=2>0.

### Dependencies

StableReductionPartII §§4.8, 6.1, 6.8–6.10 and 6.21–6.22. The internal prerequisites are the individual subsection references above.

## Layer 12: Potential bigness

### 12.1 Potential bigness and relative powers

Let k be ℤ or a field, S flat quasi-projective normal integral over k, Y integral and π : Y → S projective flat with geometrically integral generic fibre of relative dimension e. For m ≥ 1 let Y^m₍/S₎ = Y ×_S ··· ×_S Y (Y⁰ = S); it is integral. For L̄ ∈ P̂ic(Y/k) put m⊠L̄ = Σᵢ pᵢ^*L̄ on Y^m₍/S₎. L̄ is potentially big over S if m⊠L̄ is big on Y^m₍/S₎ for some m ≥ 1. (yuan-2026, §4.1, pp. 59–60).

*Route.* Integrality of Y^m₍/S₎: flatness and geometric integrality of the generic fibre exclude extra components and embedded points (Yuan p. 60).

The basic API comprises these facts.

- Y^m₍/S₎, integral for m ≥ 1.
- m⊠L̄ = Σ pᵢ^*L̄.
- ∃ m ≥ 1, m⊠L̄ big on Y^m₍/S₎.
- m⊠L̄ is nef if L̄ is nef.
- dim Y^m₍/S₎ = dim S + em.
- The m-fold fibre product represents m-tuples over S; normal integral base change commutes with the relative power and its exterior sum. Each projection pulls back L̄, so the exterior sum is invariant under permuting the factors and is additive in L̄.

**Checks.**

- If Y = S, potentially big ⟺ big.
- For an elliptic surface Y → ℙ¹ with integral generic fibre, Y ×₍ℙ¹₎ Y is integral.
- L̄ = π^*M̄ is never potentially big when e ≥ 1: m⊠π^*M̄ = m·π_m^*M̄ is pulled back from S.
- For Y=S, e=0 and m⊠L=mL, so vol scales by m^dimS; for a constant curve family with L=π*M and e=1, every top degree on a positive-dimensional fibre is 0.

*Needs:* §4.2; §1.3.

### 12.2 Intersections and Deligne pairings on relative powers

In the setting of §12.1, let L̄ be nef integrable with a = deg(L_η^e) > 0 and d = dim S. (1) For nonnegative r₁, …, r_m with Σrᵢ = em + 1, (π_m)_*⟨(p₁^*L̄)^(r₁), …, (p_m^*L̄)^(r_m)⟩ vanishes unless (r₁, …, r_m) is a permutation of (e + 1, e, …, e), in which case it is aᵐ⁻¹π_*⟨L̄ᵉ⁺¹⟩; hence (π_m)_*⟨(m⊠L̄)ᵉᵐ⁺¹⟩ is a positive multiple of π_*⟨L̄ᵉ⁺¹⟩. (2) For m ≥ max{1,d}, the top intersection (p₁^*L̄)ᵉ⁺¹···(p_d^*L̄)ᵉ⁺¹(p₍d+1₎^*L̄)^e···(p_m^*L̄)^e on Y^m₍/S₎ equals aᵐ⁻ᵈ(π_*⟨L̄ᵉ⁺¹⟩)^d (for d = 0 the right-hand side is a^m deg_k[S], since (π_*⟨L̄ᵉ⁺¹⟩)⁰ on S is the empty intersection deg_k[S]). (yuan-2026, Theorem 4.1 proof, pp. 60–63).

*Route.* Factor π_m through its projections and use §3.3. If any rᵢ < e, that factor has too few entries for its fibre dimension and kills the pairing. For a potentially nonzero term all rᵢ ≥ e, and Σrᵢ = em + 1 then forces precisely one rᵢ = e + 1 and all others e. The latter factors each contribute a, leaving aᵐ⁻¹π_*⟨L̄ᵉ⁺¹⟩. The exponent sum alone does not exclude multiple exponents above e before the vanishing terms are removed. (2) for d = 0 is the fibre product degree a^m deg_k[S]; for d ≥ 1 use induction and the composition formula, ending with that degree convention.

**Checks.**

- For m = 1, (1) is tautological. If e = 0 then the smooth projective geometrically connected family is Y = S; m⊠L̄ = mL̄, its relative pairing is mL̄, and its top intersection is m^dL̄^d.
- For d=0, S=Spec F over k with [F:k]=2, Y=ℙ¹_F, L=O(2), e=1 and m=1,2, the selected top terms have degrees 2·2=4 and 2²·2=8, equal to a^m deg_k[S] with a=2. For e=0,Y=S, the empty top intersection is 2 for every m, equal to 1^m·2.
- For e=1,m=2, exponents (2,1),(1,2) give aM, while (3,0),(0,3) give 0. If d=2,a=2,M²=3,m=3, the selected top term is 2^(3−2)·3=6.

*Needs:* §12.1; §3.3; §3.1.

### 12.3 The criterion for potential bigness

In the setting of §12.1, let L̄ be nef with positive fibre degree a = deg(L_η^e) > 0 and M̄ = π_*⟨L̄ᵉ⁺¹⟩. The following are equivalent: (1) M̄ is big on S; (2) m⊠L̄ is big on Y^m₍/S₎ for every integer m ≥ max{1, dim S}; (3) L̄ is potentially big over S. (yuan-2026, Theorem 4.1, pp. 60–63).

*Route.* (1) ⇒ (2): m⊠L̄ is nef, so bigness is positivity of (m⊠L̄)ᵈ⁺ᵉᵐ; expand and keep the term b_m of §12.2(2), which is aᵐ⁻ᵈM̄^d > 0 by Hilbert–Samuel, all other terms being ≥ 0 by nefness. (2) ⇒ (3) is trivial. (3) ⇒ (1): if d=0, M̄ is big because its volume is deg_k[S]>0. For d≥1, (π_m)_*⟨(m⊠L̄)ᵉᵐ⁺¹⟩ is a positive multiple of M̄ (§12.2(1)); Deligne pairings of nef big bundles are nef big (§4.4(1)) after adding a small relatively ample perturbation, and finite covers preserve bigness.

**Checks.**

- For dim S = 0, S=Spec F finite over k, M̄ has volume [F:k]>0. For every m≥1 the selected top term is a^m[F:k]>0, so every L̄ with a>0 is potentially big; no positive base dimension is required.
- For e=0,Y=S, the criterion is bigness of mL iff bigness of L. With S=Spec F, e=1, m≥1 and fibre degree a=2, the fibre power has top degree m!·2^m[F:k]>0; for [F:k]=2, m=1,2 give 4 and 16 (the selected term at m=2 is 8, with binomial coefficient 2); m=0 is not part of potential bigness.

*Needs:* §12.1; §12.2; §4.4; §4.3.

### 12.4 The product-grid degree bound

Let m ≥ 1, C be a smooth projective geometrically connected curve over an algebraically closed field F, and Z ⊊ C^m a nonempty reduced closed subscheme, with d := m − dim Z > 0, where dim Z is the largest dimension of an irreducible component of Z; let N be a degree-one line bundle and Σ ⊂ C(F) with Σ^m ⊂ Z(F). Then Σ is finite and |Σ| ≤ (deg₍m⊠N₎ Z)^(1/d), the degree summing over all irreducible components (of possibly different dimensions). (yuan-2026, Lemma 4.3, pp. 66–67).

*Route.* Induction on m by intersecting with fibres of the projections; Bézout-type bound for products of points (Yuan Lemma 4.3). Apply first to finite subsets of Σ, then conclude finiteness of Σ from the uniform bound.

**Checks.**

- m = 1, Z a finite set of n points: |Σ| ≤ n.
- For m=1,Z a set of 3 points, |Σ|≤3. For m=2,Z=Σ² with |Σ|=3, codimension 2 and degree 9, the bound is √9=3. Empty Σ has cardinality 0.
- Mixed dimensions: for m = 2, p ≠ q and Z = ({p} × C) ∪ (C × {p}) ∪ {(q, q)}, Σ = {p, q} satisfies Σ² ⊂ Z, deg₍2⊠N₎ Z = 1 + 1 + 1 = 3 and d = 2 − 1 = 1, so the bound reads 2 ≤ 3; reading d as the codimension 2 of the point component would give 2 ≤ √3, which is false.

*Needs:* SchemeAndStackFoundations §5.2 (degrees of cycles) and §5.5 (exterior products of cycles).

### 12.5 Potential bigness of theta pullbacks

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with maximal variation, J, Θ̄, X_J = J ×_S X, J_J = J ×_S J, q₁ : X_J → J and τ(y, x) = (y, y + (2g − 2)x − ω) as in Layer 9. (1) For α of positive relative degree, π_*⟨i_α^*Θ̄, i_α^*Θ̄⟩ is nef and big on S, so i_α^*Θ̄ is potentially big on X/S. (2) With X_X = X ×_S X, J_X = X ×_S J, i_Δ(x, y) = (x, y − x) and Θ̄_X = p₂^*Θ̄, p₁_*⟨i_Δ^*Θ̄_X, i_Δ^*Θ̄_X⟩ is nef and big on X, so i_Δ^*Θ̄_X is potentially big on X_X/X. (3) q₁_*⟨τ^*Θ̄_J, τ^*Θ̄_J⟩ is nef and big on J, so τ^*Θ̄_J is potentially big on X_J/J. (4) If Y is a quasi-projective k-variety with a generically finite Y → J whose image T in S has T → M₍g,k₎ generically finite, then q₁_*⟨τ^*Θ̄_J, τ^*Θ̄_J⟩|_Y is nef and big on Y; if moreover Y is normal, τ^*Θ̄_J|₍Y ×_S X₎ is potentially big over Y, and in general it is potentially big over the normalization of Y after pullback. (yuan-2026, Theorem 4.5 and proof, pp. 68–70).

*Route.* By §12.3 it suffices to prove bigness of the pairings. (1) (g − 1)π_*⟨i_α^*Θ̄, i_α^*Θ̄⟩ = g d⁴P + d²ι_α^*Θ̄ (§9.1) with P nef big (§11.4) and ι_α^*Θ̄ nef. (2) p₁_*⟨…⟩ = 4g·w + π^*P (§9.2(2)) with w nef big. (3) q₁_*⟨…⟩ = 16(g − 1)³Θ̄ + 16g(g − 1)³π_J^*P; Θ̄ is relatively ample and P is big on the base, so the sum is big on J. (4) Let Z be the closure of the image of Y in J, so Y → Z is generically finite and dominant. For nef bundles bigness is positivity of the top self-intersection (§4.3(1)), and f^*L̄₁···f^*L̄_d = deg(f)·L̄₁···L̄_d with deg f > 0 for a generically finite dominant f of the same absolute dimension (§3.1); so nef bigness passes from Z to Y. On Z, Θ̄|_Z is nef and Θ|_Z is ample on the generic fibre of Z → T, of dimension r, and P|_T is nef and big by maximal variation of T. Expanding (16(g − 1)³Θ̄|_Z + 16g(g − 1)³P|_Z)^(r + t), t the absolute dimension of T, all terms are ≥ 0 by nefness and the term with Θ̄^r·P^t equals `deg(Θ^r on Z_η)·(P|_T)^t > 0`, Z_η the generic fibre of Z → T, by the projection formula (§3.3). Ampleness on the generic fibre of Y → T itself is not claimed: for a blow-up Y of J at a point (S a point, g = 2), Θ pulls back to degree 0 on the exceptional curve, while its square stays Θ² = 2 > 0 for the principal polarization and 8 for the twice-theta bundle. Potential bigness then follows from §12.3 over the normal base Y, or over the normalization Ỹ of Y; the latter is the bigness of the nef m⊠ bundle on Ỹ ×_S X^m₍/S₎, which maps finitely and birationally to Y ×_S X^m₍/S₎.

**Checks.**

- For S a field over itself the statements reduce to geometric bigness on the fibre; for a global K over k, the relevant adelic model dimension is one.
- At g=2,d_α=1, the Abel pairing is 2P+ι*Θ̄; the difference pairing is 8w+π*P; the universal pairing is 16Θ̄+32π*P, all with positive coefficients.
- Generically finite is not finite: for the blow-up Y → J of a genus-two Jacobian at a point, over S a point, the pullback of the twice-theta bundle has degree 0 on the exceptional curve, so it is not ample, but its self-intersection is 8 = deg(Y → J)·Θ² > 0, so it is nef and big; the argument of (4) uses only this.

*Needs:* §12.3; §9.1; §9.2; §11.4; §8.4; §3.1; §3.3; §4.3; StableReductionPartII §6.1.

### 12.6 Restriction of adelic line bundles across characteristics

Let S be flat quasi-projective integral over ℤ, L̄ ∈ P̂ic(S/ℤ) and y : Spec K → S with K/k a one-variable function field. For each integral locally closed test scheme T of S_k, restrict model representatives along T → S, then pass to the geometric adelic group on T/k and pull back to Spec K over k; this includes the characteristic-zero and characteristic-p fibres whenever the fibre itself is integral. For a reducible or nonreduced fibre the statement is on integral test schemes, with the reduced structure, rather than on an undefined adelic Picard group of the whole fibre; the degree weights are [k(v) : k]. The same process applies to L̄ on X and its fibre X_y. (yuan-2026, Theorem 4.10 explanation, p. 82).

*Route.* For each integral locally closed T → S_k, the model pullback gives a map P̂ic(S/ℤ) → P̂ic(T/k), compatible with refinement and boundary limits. Use the characteristic-zero or characteristic-p algebraic fibre, extend constants and pull back on that integral test. This forgets the arithmetic metric data and retains algebraic line bundles (Yuan–Zhang §§2.5.5 and 2.7).

The basic API comprises these facts.

- For every integral characteristic-zero test T → S_k, restriction has source P̂ic(S/ℤ) and target P̂ic(T/k).
- For every integral characteristic-p test T → S_k, restriction has source P̂ic(S/ℤ) and target P̂ic(T/k).
- Pullback to Spec K over k with degree weights [k(v) : k].
- Restriction preserves nefness and integrability.
- Restriction to a characteristic fibre, extension of constants and pullback to a point commute whenever the resulting schemes are integral; tensor product and dual commute with each restriction. The final degree is relative to the chosen constant field k.

**Checks.**

- For a model bundle its restriction to an integral characteristic-p test scheme is its algebraic reduction/pullback.
- O(c) from Spec ℤ restricts to the trivial metrized bundle on each integral characteristic-p test.
- On ℙ¹_ℤ, the model bundle O(1) restricts to O(1) on ℙ¹_𝔽_p with degree one. Restriction forgets arithmetic metric data, but does not collapse every algebraic line bundle to O.
- On ℙ¹_ℤ, O(1) restricts at p=2 and p=3 to degree-one O(1), while O(c) restricts to metric shift 0. For Spec ℤ[x]/(x²−2), the fibre at 2 is 𝔽₂[x]/(x²), so its integral test is Spec 𝔽₂ and the whole fibre is not integral.

*Needs:* §1.6; §1.3; §4.6.

### Examples

For Y=S, e=0 and m⊠L=mL, so vol scales by m^dimS; for a constant curve family with L=π*M and e=1, every top degree on a positive-dimensional fibre is 0. On ℙ¹_ℤ, O(1) restricts at p=2 and p=3 to degree-one O(1), while O(c) restricts to metric shift 0. For Spec ℤ[x]/(x²−2), the fibre at 2 is 𝔽₂[x]/(x²), so its integral test is Spec 𝔽₂ and the whole fibre is not integral.

### Dependencies

SchemeAndStackFoundations §§5.2 and 5.5; StableReductionPartII §6.1. The internal prerequisites are the individual subsection references above.

## Layer 13: Admissible self-intersection and the Faltings height

### 13.1 The stable Faltings height over a function field

Let K/k be a one-variable function field and C/K smooth projective geometrically integral of genus g > 1. Choose a finite K′/K over which C (equivalently J) has semistable reduction everywhere, B′ the regular projective k-curve with function field K′, J′ the Néron model of J₍K′₎ and e its zero section; put ω₍B′₎ = e^*Ω^g₍J′/B′₎ and h_Fal(C) = deg₍B′/k₎(ω₍B′₎)/[K′ : K], with deg₍B′/k₎(v) = [k(v) : k] on Div(B′). It is independent of K′, equals deg(λ₍B′₎)/[K′ : K] for the Hodge line of the stable model (Pic⁰ of the stable model is the identity component of the Néron model), is ≥ 0, and is > 0 when C₍K̄₎ is non-isotrivial over k̄, with h_Fal(C) > 3^(−4g²) (char ≠ 3) or > 4^(−4g²) (char 3). (yuan-2026, §4.3.1, pp. 72–73; Lemma 4.9, pp. 75–76).

*Route.* Independence of the auxiliary extension K′ follows from base change of the semistable identity component, hence of its invariant differential determinant, and scaling of degrees. The full Néron model need not commute with base change (NeronModelsAndSemistableAbelianVarieties §3.3). Hodge comparison: JacobianChallengePartII §6.3 with BLR §7.4 Prop. 4 (Yuan pp. 72–73). Positivity and the explicit lower bound: semistable reduction over the field of N-torsion, N ∈ {3, 4} prime to the characteristic, of degree < N^(4g²), and integrality of the degree on that field (Yuan Lemma 4.9).

The basic API comprises these facts.

- h_Fal(C) ∈ ℚ₍≥0₎.
- Independent of the semistable extension K′.
- Equals deg λ₍B′₎/[K′ : K].
- Positive for non-isotrivial C, with the explicit lower bound.
- For a finite K₁/K over the same fixed constant field k, h_Fal(C₍K₁₎) = [K₁:K]h_Fal(C); independence of the auxiliary semistable extension keeps K and k fixed.

**Checks.**

- For C = C₀ ⊗_k K, h_Fal(C) = 0.
- The choice of semistable extension K′ does not change h_Fal(C) for a fixed base field K. Changing the base to K″ over the same k gives h_Fal(C₍K″₎) = [K″ : K]h_Fal(C); it is not invariant in this geometric normalization.
- For g = 2, char ≠ 3 and non-isotrivial C, h_Fal(C) > 3⁻¹⁶.
- Using the Néron model over B without passing to K′ gives a non-stable height that can change under extension.
- For C with everywhere good reduction over k(t) and constant (isotrivial) J, h_Fal = 0.
- A constant curve has Hodge degree 0 and height 0; degree 3 on a semistable extension of degree 2 gives stable height 3/2. At g=2 the uniform bounds are 3⁻¹⁶ or 4⁻¹⁶ according to characteristic.

*Needs:* JacobianChallengePartII §6.3; StableReductionPartII §5.1; ArakelovGeometryAndAbelianHeights §3.4; NeronModelsAndSemistableAbelianVarieties §§3.10–3.12; NeronModelsAndSemistableAbelianVarieties §§3.3 and 3.9.

### 13.2 Global φ, ε and δ of a curve over a global field

For C semistable over a one-variable function field K/k, φ(C) = Σ_v φ_v(C)deg(v), ε(C) = Σ_v ε_v(C)deg(v), δ(C) = Σ_v δ_v(C)deg(v), with deg(v) = [k(v) : k] and the local invariants of the reduction graphs (Layer 10). Over a number field replace deg(v) by log Nv at finite places; at archimedean places φ_v is the archimedean φ (weight 1 or 2), ε_v = 0 and δ_v is Faltings' δ. (yuan-2026, §4.5.1, pp. 85–86; §4.5.2, p. 89).

*Route.* Only finitely many finite places have bad reduction. Under finite base extension, with residue degrees over a fixed k in the function-field case, each raw global sum multiplies by the extension degree, by ramification scaling and the residue-degree formula. Over number fields dividing by [K : ℚ] makes the sums invariant.

The basic API comprises these facts.

- φ(C) = Σ φ_v deg(v).
- ε(C).
- δ(C).
- φ, ε, δ ≥ 0 over function fields.
- Under a finite extension of the global field, raw global invariants multiply by its degree; number-field quotients by [K:ℚ] remain unchanged. The geometric statement keeps the constant field fixed.

**Checks.**

- Everywhere good reduction over a function field: all three vanish.
- One type-0 node of thickness 1 at one place of degree 1: δ = 1, ε = (g − 1)/(3g), φ = (g − 1)/(6g).
- All three raw sums multiply by [K′ : K] under finite extension. Their quotients by [K : ℚ] are invariant over number fields; the function-field sums with degrees over a fixed k scale by [K′ : K].
- Over a number field there is no archimedean ε term (ε_v = 0 at infinity).
- At one degree-one unit type-zero node with g=2, (δ,ε,φ)=(1,1/6,1/12). A degree-two extension gives raw sums (2,1/3,1/6); number-field normalization divides the degree by the same 2.

*Needs:* §10.3; §10.1; §10.11.

### 13.3 Zhang's correction of the canonical self-intersection

For C with semistable minimal regular model 𝒞: ω_a² = ω²_𝒞 − ε(C), where over number fields ω_𝒞 carries the Arakelov metric. Over a function field, combined with the Noether formula ω²_𝒞 = 12 deg λ − δ(C) = 12h_Fal(C) − δ(C): ω_a² = 12h_Fal(C) − δ(C) − ε(C). (yuan-2026, §4.5.1, p. 86; §4.5.2, p. 89).

*Route.* Local comparison of Zhang's admissible metric with the model metric (§7.5): at each bad place the difference of self-intersections is ε_v (Zhang 1993 Theorem 4.4 as recalled by Yuan). Noether formula for the semistable fibration over B′ (StableReductionPartII §5.19 pulled back) and §13.1.

**Checks.**

- Good reduction everywhere over a function field: ω_a² = ω²_𝒞 = 12h_Fal.
- For g=2, the normalized coefficient test h=1/10,δ=1,ε=1/6 gives W_model=1/5 and Wₐ=1/30; 12/10−1−1/6=1/30, also equal to (2/5)φ for φ=1/12. At everywhere good reduction δ=ε=0 and Wₐ=12h.

*Needs:* §7.5; §7.7; §13.2; §13.1; StableReductionPartII §5.19.

### 13.4 Lower bounds of ω_a² by φ

For C/K smooth projective geometrically integral of genus g > 1 over a global field, after a finite extension making C semistable (both raw sides scale by the extension degree; their number-field quotients by [K : ℚ] are invariant): (1) ω_a² ≥ ((g − 1)/(2g + 1))φ(C) (Looper–Silverman–Wilms over function fields, with max(2, g − 1) in place of g − 1 and 2(g − 1) in characteristic 0 or for hyperelliptic C; Wilms over number fields). (2) If C is hyperelliptic (in particular g = 2), ω_a² = (2(g − 1)/(2g + 1))φ(C). (3) With A(g) = 1 + (3/(2c(g)) + 2)(2g + 1)/(g − 1) built from the Cinkir constants, A(g) ≤ 139 < 144 for g > 2; for g = 2 the hyperelliptic identity gives the coefficient 1 + (3/(2c(2)) + 2)·(5/2) = 107.25; and 12/A(g) → 12/47. (wilms-2022, Theorem 1.2, p. 3; looper-silverman-wilms-2021, Proposition 6.1, p. 14; zhang-2010, Corollary 1.3.3, p. 7; yuan-2026, §4.5.1, pp. 87–88; Remark 4.12(1), p. 88; cinkir-2015, Introduction, item (iii), p. 1; concluding summary, p. 18 (arXiv v1)).

*Route.* (1) The argument of Wilms 2022 Theorem 1.2 (number fields) and Looper–Silverman–Wilms Proposition 6.1 (function fields), on C² over S = Spec K, writing a = g − 1, wᵢ = pᵢ^*w, W = w₁ + w₂ and D = Ō(Δ)_a. The map f(x, y) = a(x + y) − ω is the Abel map of §9.1 for the family C × C → C (first factor as base, diagonal section) with d = a and α = ω − a·x, ᾱ = w₂ − aD; §9.1(1), §8.5 (p₁_*⟨D, w₂⟩ = w and p₁_*⟨D, D⟩ = −w on the base C) and P = ⟨w, w⟩ on Spec K, of degree ω_a², give f^*Θ̄ = a(g + 1)W − 2a²D − π^*P, which is nef since Θ̄ is (§8.4). Put N̄ = f^*Θ̄/a and M̄ = aD − W. On C², N² = 8g(g − 1)³ > 0 (so N is nef and big) and M·N = 0, so §8.8 with n = 2 gives deĝ(M̄²N̄) ≤ 0 (over a function field, after replacing k by its algebraic closure in K, which multiplies every degree by the same positive factor). Expanding with the degrees of §10.7 over S = Spec K (W³ = 12aω_a², W²D = 4ω_a², WD² = −2ω_a², D³ = ω_a² − φ(C)) and M·M = −2a³ gives deĝ(M̄²N̄) = 2a³φ(C) − 2a²(2g + 1)ω_a² ≤ 0, which is (1). (2) Zhang 2010 Corollary 1.3.3: the Gross–Schoen cycle of a hyperelliptic curve vanishes (§10.10). (3) Arithmetic: c(3) = 17/288 gives A(3) ≈ 96.9, c(4) = 3/88 gives A(4) = 139, c(g) ≥ 1/25 gives A(g) ≤ 1 + 39.5·(2g + 1)/(g − 1) ≤ 109.625 for g ≥ 5; c(g) → 1/14 gives A(g) → 1 + 23·2 = 47.

**Checks.**

- At g=4, A=1+(44+2)·3=139; at g=2 the strengthened coefficient is 1+(81/2+2)·5/2=429/4=107.25; at g≥5 the displayed upper estimate is 109.625. The limiting coefficient is 47.

*Needs:* §13.2; §10.10; §10.2; §10.7; §9.1; §8.4; §8.5; §8.8; §7.7.

### 13.5 Comparison of ω_a² with the Faltings height over function fields

Let K/k be a one-variable function field and C/K smooth projective geometrically integral of genus g > 1, K′/K finite with a semistable minimal regular model C′ over the regular projective k-curve S′ of K′. Then (1/12)h_Fal(C) ≤ ω²₍C/K,a₎ ≤ ω²₍C′/S′₎/[K′ : K] ≤ 12h_Fal(C). If moreover C₍K̄₎ is non-isotrivial over k̄, then (1/12)max{h_Fal(C), 4^(−4g²)} ≤ ω²₍C/K,a₎ ≤ 12max{h_Fal(C), 1}. (yuan-2026, Theorem 4.11 and proof, pp. 85–88; Remark 4.12, p. 88).

*Route.* Base change to K′ and write ω_a² = 12h_Fal − δ − ε (§13.3); upper bounds from δ, ε ≥ 0. Lower bound: ε ≤ δ/2 + 2φ (§10.2(5)) and δ ≤ φ/c(g) give δ + ε ≤ (3/(2c(g)) + 2)φ ≤ (3/(2c(g)) + 2)((2g + 1)/(g − 1))ω_a² = (A(g) − 1)ω_a² by §13.4(1); hence 12h_Fal = ω_a² + δ + ε ≤ A(g)ω_a² ≤ 139ω_a² for g > 2, and ≤ 107.25ω_a² for g = 2 by the hyperelliptic identity, so ω_a² ≥ h_Fal/12 (Yuan pp. 86–88). Non-isotrivial case: §13.1 lower bound 3^(−4g²) or 4^(−4g²) ≥ 4^(−4g²). The route uses the graph inequalities and the Hodge-index bound at their stated characteristics; a separate slope-inequality theorem is not an input.

**Checks.**

- Everywhere good reduction: ω_a² = 12h_Fal, consistent with both inequalities.
- If h=1 and δ=ε=0, Wₐ=12 and h/12=1/12≤12≤12h. With A=139 the derived lower bound is 12/139>1/12, since 144>139.

*Needs:* §13.3; §13.4; §10.2; §13.1.

### 13.6 Wilms' lower bound for Faltings' δ

For every compact connected Riemann surface X of genus g ≥ 1, δ(X) > −2g log(2π⁴). (wilms-2017, Corollary 1.2, p. 1; yuan-2026, Theorem 4.14 proof, p. 93).

*Route.* From Wilms' formula (§10.11) using ∫₍Picᵍ⁻¹₎ log‖θ‖ ν^g/g! < −(g/4)log 2 (Jensen) and φ(X) ≥ 0 (Wilms Corollary 1.2).

**Checks.**

- At g=1, −2log(2π⁴)≈−10.5441<−9; at g=2 the bound doubles to approximately −21.0883. The inequality is strict.

*Needs:* §10.11; §10.3.

### 13.7 A positive comparison height on the relative Jacobian

Apply the supplied Bost inequality h_Fal ≥ −(g/2)log(2π²), with h_Del = h_Fal + (g/2)log π. For M̄ = Θ̄ + π_J^*λ̄_S + O(c) with c = (g/2)log(2π²) + 1, h_M̄(y) = 2ĥ(y) + h_Fal(X_s) + c ≥ 2ĥ(y) + max{h_Fal(X_s), 1}, since h_Fal + c ≥ 1 always and h_Fal + c ≥ h_Fal. (yuan-2026, §4.4.1, p. 78; §4.3.1, p. 73; Lemma 3.4, pp. 43–44; gaudron-remond-2014, §2.3, Definition 2.1, pp. 6–7; Corollary 8.4, p. 37 (arXiv v1)).

*Route.* Import ArakelovGeometryAndAbelianHeights Layer 6 §6.5 (Bost's theorem, Gaudron–Rémond Corollary 8.4) and the normalization shift h_Fal = h_Del − (g/2) log π of the parent Layer 2 §2.7. The normalization shift gives the constant c = (g/2)log(2π²) + 1, so h_Fal + c ≥ 1 and h_Fal + c ≥ h_Fal.

**Checks.**

- g = 1: the minimum of h_Del is ≈ −0.749 at j = 0 (Deligne), so min h_Fal ≈ −0.749 − (1/2)log π ≈ −1.321, below −(1/2)log(2π) ≈ −0.919 but above −(1/2)log(2π²) ≈ −1.491.
- At g=1, (log π)/2≈0.572365 and the Faltings lower constant is −log(2π²)/2≈−1.49130; adding c=(log(2π²))/2+1 gives h+c≥1. At h=1, h+c≥h as well.

*Needs:* ArakelovGeometryAndAbelianHeights §6.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7–2.8; §5.4; §8.4.

### 13.8 The boundary-coercive divisor for the lower height estimate

Fix a Cinkir constant c(g) > 0. In the arithmetic curve-moduli setting (fine level moduli over ℤ[1/N] with a stable compactification of its generic fibre) put D_S = (3/(2c(g)) + 3)Φ_S − Ξ_S ∈ D̂iv(S/ℤ)_ℚ. Its geometric part D̃ satisfies D̃ − c(g)Δ ≥ 0 over S_ℚ/ℚ, and its archimedean Green function tends to +∞ at the boundary of moduli, hence is bounded below by a constant c₅′(g). (yuan-2026, Theorem 4.14 proof, pp. 94–95; cinkir-2015, §6, type XIV (tetrahedral graph), pp. 13–14 (arXiv v1); attainment of the bound by the regular tetrahedron, p. 2).

*Route.* Geometric part: Φ̃ has Green function φ(Γ_v), Ξ̃ has δ(Γ_v) + ε(Γ_v) (§10.13); ε ≤ δ/2 + 2φ and φ ≥ c(g)δ give (3/(2c) + 3)φ − δ − ε ≥ c(g)δ . Archimedean coercivity: as in §11.1, effectivity of the geometric part over (ℂ, |·|) forces the Green function to grow at the boundary; with Wilms' δ bound it is bounded below.

The basic API comprises these facts.

- D_S = (3/(2c) + 3)Φ_S − Ξ_S.
- D̃ − c(g)Δ ≥ 0 over S_ℚ.
- Archimedean Green function bounded below by c₅′(g).
- Its underlying divisor is zero; at a normalized non-archimedean point its Green value is (3/(2c)+3)φ−δ−ε, and at a normalized archimedean point (the usual absolute value) it is (3/(2c)+3)φ−δ+4g log(2π), multiplied by t at |·|_∞^t. These follow from Φ_S and Ξ_S and determine the divisor.

**Checks.**

- For c(g) = 1/25, 3/(2c) + 3 = 40.5.
- At a discrete v of good reduction the Green function is 0.
- For the regular tetrahedral graph K₄ with all six edge lengths 1 and vertex weights 0, g = 3, δ = 6, φ = 17/48 and ε = 11/6. At c(3) = 17/288 the divisor value is (483/17)(17/48) − 6 − 11/6 = 107/48 < 6. Thus D̃ − Δ has value −181/48 and fails effectivity; D̃ − c(3)Δ has value 15/8 > 0.
- The regular-tetrahedron test computes the failure of the stronger printed boundary coefficient, rather than inferring its failure merely from a weaker proved estimate.

*Needs:* §10.6; §10.13; §10.2; §13.6; §11.1; StableReductionPartII §6.10.

### 13.9 Comparison of ω_a² with the Faltings height over number fields

For g > 1 there is c₅(g) ∈ ℝ such that for every smooth projective geometrically connected C/K of genus g over a number field, with K′/K any finite extension over which C has a semistable minimal regular model C′: max{h_Fal(C)/12 + c₅, ((g − 1)/(2g + 1))c₀} ≤ [ω²₍C/K,a₎] ≤ [ω²₍C′/O₍K′₎,Ar₎] ≤ 12h_Fal(C) + 6g log(2π²), where [·] divides by the degree over ℚ and c₀ = c₀(g) is the constant of §11.1. The constant c₅ is not claimed positive or effective. (yuan-2026, Theorem 4.14 and proof, pp. 92–95; wilms-2022, Theorem 1.2, p. 3).

*Route.* (a) Wilms: ω_a² ≥ ((g − 1)/(2g + 1))φ(C); φ_v ≥ 0 at finite places and φ_σ ≥ c₀ at archimedean places. (b) Combine 12 deĝ λ̄_K = ω_a² + δ(C) + ε(C) − 4g[K:ℚ]log(2π) (§§10.12, 13.3) with (a) to get (1 + (3/(2c(g)) + 3)(2g + 1)/(g − 1))ω_a² ≥ 12 deĝ λ̄_K + d(C), where d(C) = (3/(2c(g)) + 3)φ(C) − δ(C) − ε(C) + 4g[K:ℚ]log(2π) is the value at the moduli point of C of the coercive divisor D_S of §13.8. Its finite components are ≥ φ_v ≥ 0 and each archimedean component is ≥ c₅′(g) (§13.8). The left coefficient is at most 139 + 7/2 < 144 for g > 2, and the hyperelliptic identity of §13.4(2) gives a coefficient below 144 for g = 2; since ω_a² ≥ 0 this yields [ω_a²] ≥ h_Fal/12 + c₅ (Yuan pp. 93–95, where λ_K is the Faltings-metrized Hodge line of the semistable model over O_K, of degree [K : ℚ]h_Fal(C)). (c) ω_a² ≤ ω²_Ar since ε ≥ 0; arithmetic Noether with Wilms' δ > −2g log(2π⁴): ω²_Ar = 12 deĝλ̄ − δ + 4g[K:ℚ]log 2π ≤ 12h_Fal[K:ℚ] + 2g log(2π⁴)[K:ℚ] + 4g log(2π)[K:ℚ] = [K:ℚ](12h_Fal + 6g log(2π²)).

**Checks.**

- Constant check: 2g log(2π⁴) + 4g log(2π) = 2g log(8π⁶) = 6g log(2π²).
- At g=1 the log identity gives 2log(2π⁴)+4log(2π)=6log(2π²)≈17.8956; at g=2 both sides double. The genus-one substitution checks the constant only, not the theorem.

*Needs:* §13.4; §11.1; §13.8; §10.12; §13.6; §13.3; §5.4; §13.7.

### 13.10 Uniform comparison of [ω_a²] with max{h_Fal, 1}

For each g > 1 there are c₃(g), c₄(g) > 0 such that for every number field or one-variable function field K/k and every smooth projective geometrically connected curve C/K of genus g, non-isotrivial over k̄ in the function-field case, c₃·max{h_Fal(C), 1} ≤ [ω²₍C/K,a₎] ≤ c₄·max{h_Fal(C), 1}, with [·] dividing by [K : ℚ] in the number-field case only. (yuan-2026, Theorem 1.4, pp. 14–15; Theorems 4.11 and 4.14).

*Route.* Function fields: §13.5 with c₃ = 4^(−4g²)/12, c₄ = 12. Number fields: from §13.9, [ω_a²] ≥ max{h/12 + c₅, c′} ≥ c₃ max{h, 1} by a convex combination (if h ≤ 1 use c′ = ((g − 1)/(2g + 1))c₀ > 0; if h large use h/12 + c₅), and [ω_a²] ≤ 12h + 6g log(2π²) ≤ c₄ max{h, 1} using h_Fal bounded below (§13.7).

**Checks.**

- For fixed g, a curve with h_Fal ≤ 1 satisfies c₃(g) ≤ [ω_a²] ≤ c₄(g). The constants are not uniform in g: the function-field route gives c₃ = 4^(−4g²)/12, which is 4⁻¹⁶/12 at g = 2 and tends to 0 as g grows.
- Let h≤1: the denominator max(h,1)=1 and the positive lower constant c′ is retained. If h≥max(1,24|c₅|), then h/12+c₅≥h/24. In the geometric case c₃=4^(−4g²)/12 and c₄=12.

*Needs:* §13.5; §13.9; §13.7.

### Examples

A constant curve has Hodge degree 0 and height 0; degree 3 on a semistable extension of degree 2 gives stable height 3/2. At g=2 the uniform bounds are 3⁻¹⁶ or 4⁻¹⁶ according to characteristic. Let h≤1: the denominator max(h,1)=1 and the positive lower constant c′ is retained. If h≥max(1,24|c₅|), then h/12+c₅≥h/24. In the geometric case c₃=4^(−4g²)/12 and c₄=12.

### Dependencies

JacobianChallengePartII §6.3; StableReductionPartII §5.1; ArakelovGeometryAndAbelianHeights §3.4; NeronModelsAndSemistableAbelianVarieties §§3.10–3.12; NeronModelsAndSemistableAbelianVarieties §§3.3 and 3.9; StableReductionPartII §5.19; ArakelovGeometryAndAbelianHeights §6.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7–2.8; StableReductionPartII §6.10. The internal prerequisites are the individual subsection references above.

## Downstream consumers

HeightsRationalPointsAndObstructionsPartII consumes §§4.7–4.8, 5.1–5.4, Layer 6, §§8.3–8.4, 12.3–12.6 and 13.7–13.10 for uniform small-points and Bogomolov statements. Its curve point-count theorem is downstream of the potential-bigness criterion and the Faltings-height comparison.

## Worked examples

For the genus-two unit loop, δ=1, ε=1/6, φ=1/12 and τ=1/12, so δ+ε−2φ=1=(3/2)δ−6τ. For the genus-two unit banana, μₐ has density 1/3 on each of the three edges, while the uncorrected dualizing model metric has curvature δᵥ₁+δᵥ₂. Equal total mass 2 does not imply equal curvature measures. These examples test both the local metric and graph-invariant interfaces of Layers 7–10.

For a genus-two curve family the theta formulas read i_ω*Θ̄=8w−π*P and ⟨i_ω*Θ̄,i_ω*Θ̄⟩=32P. Substitution into the positive formula for w cancels the base term because −1/8+32/256=0. The difference-family pairing is 8w+π*P and the universal-shift pairing is 16Θ̄+32π_J*P. Thus one bigness input P feeds all three potential-bigness statements; it is not a separate bigness assumption on each map.

For a number field of degree two, a constant metric O(1) has raw degree 2 and absolute height 1. The fundamental inequality for the point Spec K is equality 1=1. Under a further extension of degree three the raw degree becomes 6 and division by 6 still gives 1. Over k(t), instead, [1:t] has geometric height 1 and the cover t=u² changes it to 2. This distinguishes a change of the point's representing field from a change of the geometric ground field.

## References

The locators use the editions named here; no source text is reproduced. The PDF and printed paginations of the Yuan–Zhang preprint differ, and its section and theorem numbers with printed pages are the locators used.

- **yuan-2026.** Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*. Annals of Mathematics 203 (2026), no. 1, 15–119. [Author manuscript](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). The author manuscript dated 21 August 2024 supplies the theorem and page numbers.

- **yuan-zhang-2025.** Xinyi Yuan and Shou-Wu Zhang, *Adelic line bundles on quasi-projective varieties*. arXiv:2105.13587v9 (14 June 2025), printed pagination as cited. [Legal source](https://arxiv.org/pdf/2105.13587v9). Use the cited preprint version and its printed numbering.

- **yuan-2008.** Xinyi Yuan, *Big line bundles over arithmetic varieties*. Inventiones mathematicae 173 (2008), 603–649. [Legal source](https://arxiv.org/pdf/math/0612424v2). Use the cited preprint version and its printed numbering.

- **moriwaki-2000.** Atsushi Moriwaki, *Arithmetic height functions over finitely generated fields*. Inventiones mathematicae 140 (2000), 101–142. [Legal source](https://arxiv.org/pdf/math/9809016v2). Use the cited preprint version and its printed numbering.

- **gao-habegger-2019.** Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*. Annals of Mathematics 189 (2019), no. 2, 527–604. [Legal source](https://arxiv.org/pdf/1801.05762v3). Use the cited preprint version and its printed numbering.

- **demarco-mavraki-ye-2026.** Laura DeMarco, Niki Myrto Mavraki and Hexi Ye, *Bounded geometry for PCF-special subvarieties*. Forum of Mathematics, Pi (2026). [Legal source](https://arxiv.org/pdf/2405.17343v3). Use the cited preprint version and its printed numbering.

- **zhang-2010.** Shou-Wu Zhang, *Gross–Schoen cycles and dualising sheaves*. Inventiones mathematicae 179 (2010), 1–73. [Legal source](https://arxiv.org/pdf/0812.0371v1). Use the cited preprint version and its printed numbering.

- **cinkir-2011.** Zubeyir Cinkir, *Zhang's conjecture and the effective Bogomolov conjecture over function fields*. Inventiones mathematicae 183 (2011), no. 3, 517–562. [Legal source](https://arxiv.org/pdf/0901.3945v2). Use the cited preprint version and its printed numbering.

- **baker-rumely-2007.** Matthew Baker and Robert Rumely, *Harmonic analysis on metrized graphs*. Canadian Journal of Mathematics 59 (2007), 225–275. [Legal source](https://arxiv.org/pdf/math/0407427v2). Use the cited preprint version and its printed numbering.

- **de-jong-2018.** Robin de Jong, *Néron–Tate heights of cycles on Jacobians*. Journal of Algebraic Geometry 27 (2018), 339–381. [Legal source](https://arxiv.org/pdf/1610.01932v2). Use the cited preprint version and its printed numbering.

- **wilms-2017.** Robert Wilms, *New explicit formulas for Faltings' delta-invariant*. Inventiones mathematicae 209 (2017), 481–539. [Legal source](https://arxiv.org/pdf/1605.00847v3). Use the cited preprint version and its printed numbering.

- **wilms-2022.** Robert Wilms, *On arithmetic intersection numbers on self-products of curves*. Journal of Algebraic Geometry 31 (2022), 397–424. [Legal source](https://arxiv.org/pdf/1903.12159v2). Use the cited preprint version and its printed numbering.

- **looper-silverman-wilms-2021.** Nicole Looper, Joseph Silverman and Robert Wilms, *A uniform quantitative Manin–Mumford theorem for curves over function fields*. arXiv:2101.11593v3. [Legal source](https://arxiv.org/pdf/2101.11593v3). Use the cited preprint version and its printed numbering.

- **stacks-pullback.** The Stacks Project Authors, *The Stacks Project: universally trivial structure-sheaf pushforward*. Online version read 19 October 2026. [Legal source](https://stacks.math.columbia.edu/tag/0E0L). Use the cited preprint version and its printed numbering.

- **stacks-irreducible-fibres.** The Stacks Project Authors, *The Stacks Project: geometrically irreducible fibres over a dense open of the base*, Tag 0559, Lemma 37.27.5. [Legal source](https://stacks.math.columbia.edu/tag/0559). The cached chapter prints the lemma as Lemma 27.5.

- **seidenberg-1950.** Abraham Seidenberg, *The hyperplane sections of normal varieties*, Trans. Amer. Math. Soc. 69 (1950), 357–386, Theorem 7 and §4. [Legal source](https://www.ams.org/journals/tran/1950-069-00/S0002-9947-1950-0037548-0/S0002-9947-1950-0037548-0.pdf). The printed page numbers are used.

- **milne-av.** James S. Milne, *Abelian Varieties*, course notes v2.00 (2008), Theorem I.5.1 (the theorem of the cube). [Author page](https://www.jmilne.org/math/CourseNotes/AV.pdf). The notes' section and theorem numbering is used.

- **wazir-2006.** Rania Wazir, *On the specialization theorem for abelian varieties*. arXiv:math/0306438v2 (9 February 2004), 5 pp.. [Legal source](https://arxiv.org/pdf/math/0306438v2). Use the cited preprint version and its printed numbering.

- **cinkir-2015.** Zubeyir Cinkir, *Admissible invariants of genus 3 curves*. arXiv:1405.7413v1 (28 May 2014), 19 pp.. [Legal source](https://arxiv.org/pdf/1405.7413v1). Use the cited preprint version and its printed numbering.

- **gaudron-remond-2014.** Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d’isogénies*. arXiv:1105.1230v1 (6 May 2011), 38 pp.. [Legal source](https://arxiv.org/pdf/1105.1230v1). Use the cited preprint version and its printed numbering.

- **gross-schoen-1995.** Benedict Gross and Chad Schoen, *The modified diagonal cycle on the triple product of a pointed curve*, Ann. Inst. Fourier 45 (1995), 649–679, §§6–8 for the regular-model height construction. [Numdam](https://www.numdam.org/item/AIF_1995__45_3_649_0/).

- **moret-bailly-1989.** Laurent Moret-Bailly, *La formule de Noether pour les surfaces arithmétiques*, Invent. Math. 98 (1989), 491–498, Théorème 2.5. [Publisher locator](https://doi.org/10.1007/BF01393833). The primary text is uncertified; the displayed normalization is also in yuan-2026, p. 89.

- **faltings-1984.** Gerd Faltings, *Calculus on arithmetic surfaces*, Ann. of Math. 119 (1984), 387–424, Theorem 6 and pp. 401–402 for δ. [Publisher locator](https://doi.org/10.2307/2007043). The original text is uncertified; Wilms Theorem 1.1 supplies the theta-integral characterization used here.
