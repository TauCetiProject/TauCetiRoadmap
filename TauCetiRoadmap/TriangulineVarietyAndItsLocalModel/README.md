# Roadmap: the trianguline variety and its local model

**Summary.** From Artinian-coefficient (φ,Γ)-modules over the Robba ring, B-pairs and their almost de Rham period modules, the framed trianguline variety X_tri(r̄) of a residual representation r̄:G_K→GLₙ(k_E), and the double incidence scheme X=g̃×_g g̃ of the Grothendieck simultaneous resolution for `Res_(K/Q_p) GL_n`, build the Breuil–Hellmann–Schraen local model: at a point x=(r,δ) of X_tri with locally algebraic generic parameter and distinct Sen weights, the completed local ring of X_tri is, up to formal power-series variables, the completed local ring of one irreducible component X_w at the point x_pdR defined by the two flags and the nilpotent period operator of r. The end theorems are that local-model identification and its consequences: X_tri is normal and Cohen–Macaulay near x, the character and weight projections are flat there, points with algebraic unit restriction have the crystalline accumulation property, a companion point x_w=(r,z^(w(h))χ) of a generic crystabelline representation r lies on X_tri exactly when the relative position w_x of its Hodge and refinement flags satisfies w_x≤w, the weight-fibre cycles satisfy the Kazhdan–Lusztig identity, and generic crystalline representations satisfy the local multiplicity formula. A second branch, following Ding, constructs the simultaneous-refinement, paraboline and partial de Rham tangent spaces of a generic crystabelline (φ,Γ)-module whose refinements are all noncritical, and proves that higher intertwining recovers its Hodge parameters through two short exact sequences of tangent quotients. A third, shorter branch proves Newton–Thorne's local strictness theorem for ordered-regular triangulations and their Weil–Deligne criterion for noncritical triangulations.

## Scope and ownership

This roadmap owns the deformation adapters, the lattice-to-Hodge-flag adapter, their double-flag comparison, component detection, analytic local identification, and the resulting local geometry and cycle transfers. It also owns the simultaneous-refinement derivatives, partial tangent modification, injection rigidity and higher-intertwining recovery sequences. The general local multiplicity problem is formulated as a conjecture; its existence theorem here is the generic crystalline case.

The following objects and results are stated by their owners and are consumed by section:

- CompletedCohomologyAndLocalGlobalCompatibility §5.2a owns the framed trianguline variety as a reduced closure, its saturated regular locus, and the smoothness and dimension of that locus. That section states them inside its global patching setting; the unrestricted local form used here (every finite K, every n≥1, every residual representation, with smooth full-character projection on the regular locus) is the contract gap:unrestricted-trianguline-variety below. This roadmap begins with its completion at a generic point, and no global patching hypothesis enters any target here.
- ModularityAndLanglandsExtensions §4.3 owns the NT-ordered regular condition, which §4.1 consumes, together with ordered-regular saturated deformation functors, relative representability and injectivity, the absolutely irreducible unframed quotient ring, fixed-unit-weight tangent inclusion in H¹_g, the local closure tangent constraint and the admissible-cover density repair, which no target here uses. Layer 4 below adds the ordinary-flag dictionary, strictness theorem and numerical WD criterion as further local statements.
- PadicHodgeTheory §§4.3–4.5 and 5.2–5.3 own period representations, connections, B-pairs, their field Robba comparison, the full-rank torsion-quotient invariant theorem, filtered-module modifications and the Weil–Deligne representation of a potentially semistable representation with its inertial type. The embedding-selective carrier D_σ belongs there through the exact contract below. Layer 10 constructs its labelled endpoint diagrams and recovery, rather than its period carrier.
- PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 2.7, 3.1–3.9 and 7.1–7.8 own the Robba categories, Herr complexes, the rigid character spaces of O_K× and K× with their universal characters, rank-one characters and their classification, weights, integral triangulations, global triangulation and specialization. LocallyAnalyticDistributions §3.3 adapts the same character spaces to distributions and is not a second carrier; PadicMeasuresIwasawaAlgebras §3a.1 supplies points and functions on the ℤₚ× space and constructs no rigid structure. Layer 3's localized deformation adapter fixes a residual parameter and retains infinitesimal coefficients.
- LocalGaloisDeformationRings §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23 and 3.4–3.10 own lifting rings, their completions and constrained de Rham and trianguline deformation rings. In particular the three individual crystabelline tangent dimensions come from §1.23; §11.3 proves their simultaneous derivative and Weyl-transport statements.
- SpringerResolutionAndCharacteristicCycles Layers 1–7 and 11–14 own flag schemes, the simultaneous resolution, incidence components, their normality, Cartan flatness, Steinberg cycles, KL identities and their completion. The targets here transfer those statements to Galois deformation spaces.
- RigidAnalyticGeometry §§7.3, 8.1–8.3 and AdicSpacesPartII R1 own rigid spaces, local rings, completions, analytic excellence and rigid–adic comparison. SchemeAndStackFoundations §§0.16–0.21 and 4.3–4.5 own the general local algebra and Schlessinger theory. DeformationAndDerivedPatchingAlgebra §§1.6–1.14, 2.1–2.7 and 3.1–3.2 supply their labelled coefficient, framing, completion and depth interfaces.
- LocallyAnalyticRepresentationsOfLocalGroups LR.4–LR.5 own actual locally analytic inductions and Orlik–Strauch constituents; no formal labels replace those representations here. Completed cohomology, patched eigenvarieties and their socles belong to CompletedCohomologyAndLocalGlobalCompatibility; global eigenvarieties and automorphy statements are not stated here.
- PadicLocalLanglandsForGL2QpPartII §1.2 owns the rank-two nontrianguline connection statements over ℚₚ: for an absolutely irreducible two-dimensional V over ℚₚ that is not trianguline, every nonzero P(∇) is injective on D_rig(V), and, when V is moreover de Rham, ∂=t⁻¹∇ is bijective on N_rig(V), the latter through PadicDifferentialEquationsAndRigidCohomology §RD.2.43 as that roadmap records. No target here uses them.

Generic product maps, ranges, kernels, submodule quotients, dimension identities, adic completions, algebraic cycles and module lengths are already in Mathlib, and the linear-algebra steps of Layers 11–13 use them as listed in the Mathlib contract; this roadmap states no separate theory of matched ranges or of slope arithmetic.

## Conventions

Let p be any prime, K/ℚₚ a finite extension of degree d, K₀ its maximal unramified subfield, e=[K:K₀], f=[K₀:ℚₚ], and E/ℚₚ a finite extension containing the image of every embedding of K, so that Σ=Hom_(ℚₚ)(K,E) has d elements. Set n≥1, with n≥2 in Layers 10–13. All modules and indexing sets live in fixed universes; coefficient algebras, flags and deformation groupoids use the same coefficient universe. Art_E consists of local Artinian E-algebras with residue E and local E-algebra maps inducing the identity on E. These are nonzero characteristic-zero rings; residue characteristic p and the cases p=2,3 are included. Equal-characteristic coefficient fields, n=0 and the zero coefficient ring are outside these hypotheses. Zero modules and zero morphisms remain legitimate auxiliary objects. Every tensor product names its scalar ring; A⊗K means `A tensor_(Q_p) K ~= prod_tau A`. Continuity, invertible Frobenius linearization and the stated freeness or projectivity are part of each category.

Write R_A for the coefficient Robba ring over K. An integral saturated flag has finite-projective successive quotients. A localized flag is a flag on D[1/t] and need not descend to a saturated integral flag of the same parameter. All Artinian deformations carry an identified special fibre. Keep groupoids until a frame or a representability statement removes automorphisms.

In the BHS convention wt is the logarithmic derivative, with wt(ε)=+1. Here `eps=N_(K/Q_p)|N_(K/Q_p)|` is the character of K×, whereas ε in E[ε]/ε² denotes the dual-number variable when a coefficient algebra is specified. For increasing local-model weights `h_(tau,1)<...<h_(tau,n)`, the Hodge flag is evaluated at decreasing-filtration indices `-h_(tau,i)`. Ordered dominant parameter weights decrease. Newton–Thorne's weight is the negative derivative, so cyclotomic weight is −1 and its ordered noncritical k increases. Layers 10–13 use Ding's decreasing h. A two-term witness is the character x|x| over ℚₚ: its Robba Frobenius on the standard basis is 1, its Gamma character is cyclotomic, its BHS weight is +1, its NT weight is −1, and its invariant de Rham generator has filtration jump −1. The character x has Frobenius p instead. This is the character and Tate-line normalization of PhiGammaModulesAndIwasawaCohomology §§7.1–7.3 and PadicHodgeTheory §4.5.

Normalize vₚ(p)=1. Large-gap saturation uses the local uniformizer ϖ_K and includes e; NT numerical noncriticality uses the rational prime p as an element of K×. For e=2, an unramified parameter with vₚ(δ(ϖ_K))=1 has vₚ(δ(p))=2; replacing one evaluation by the other changes a bound. Art_K:K×→W_K^ab is the cohomological normalization of NT, sending uniformizers to geometric Frobenius elements (NT21, Notation, p. 7; NT21 line 261). If rec_arith sends uniformizers to arithmetic Frobenius, then Art_K(x)=rec_arith(x)⁻¹. Thus an unramified Galois character η with η(Frob_arith)=a has parameter δ=η∘Art_K with δ(ϖ_K)=a⁻¹; over ℚ₃, η(Frob_arith)=2 gives δ(3)=1/2, its crystalline Frobenius is 1/2, and δ∘Art_K⁻¹ takes the value 2 on arithmetic Frobenius. The same normalization makes the cyclotomic character correspond to x|x| as in the witness above (Art_K(u) acts on p-power roots of unity through u for u∈ℤₚ×). Other reciprocity interfaces are transported through this dictionary.

A period frame is a basis of D_pdR over A⊗K and has dn² parameters; a representation frame is over A and has n²; independent graded rank-one rigidifications have n parameters. For d=2,n=2 these counts are 8,4,2. Set `g=Res_(K/Q_p) gl_n,E`, g̃ its simultaneous resolution and X=g̃×_g g̃. Its components are X_w; Z_v denotes a Steinberg zero-fibre component. The ordered Cartan graph is (z,w⁻¹z), with permutation action `(wz)_i=z_(w^(-1)(i))`. For w=(123) and z=(ε,2ε,3ε), the second coordinate is (2ε,3ε,ε). The equation is imposed on all Artinian algebras, rather than only residue points.

The crystabelline branch has smooth characters φ₁,…,φ_n with φ_i/φ_j∉{1,|·|_K} for ordered i≠j, strictly decreasing labelled h, and every refinement noncritical. D need not be étale. Its refinement permutation is one w∈Sₙ common to all embeddings, giving labels `phi_(w^(-1)(i))`; the local-model weight permutation lies in (Sₙ)^Σ. At w=(123) the refinement labels are (φ₃,φ₁,φ₂). The modification D_σ is generally nonregular off σ: for off-σ weights (3,1,0), its weights and both rank-two endpoint weight lists become (0,0,0) and (0,0). All modifications use the ambient minimum `h_(tau,n)`.

Ext¹_σ means de Rham at every τ≠σ. A bar over Ext denotes the quotient by the explicitly specified zero-parameter space. For original regular D that space is the full refinement derivative kernel; for D_σ it is the derivative kernel inside de Rham self-Ext. They agree when d=1 and differ in general. The signed relation is the image of M↦(ι⁻M,−ι⁺M); for identity maps on E it is the anti-diagonal containing (1,−1) and excluding (1,1). Cycles have integer generic-length multiplicities in a free abelian group, with no rational-equivalence quotient. Conjectural cycles may be signed; crystalline cycles are effective.

## Exact supplier contracts

### From Mathlib

Use `LinearMap.prod` (Mathlib/LinearAlgebra/Prod.lean, line 95), `LinearMap.range` (Mathlib/Algebra/Module/Submodule/Range.lean, line 57), and `LinearMap.ker` (Mathlib/Algebra/Module/Submodule/Ker.lean, line 59). Their bodies respectively pair maps on one source, take elements admitting a preimage, and take elements mapping to zero. They contain no period, topology or saturation condition. Use `LinearMap.finrank_range_add_finrank_ker` and `Submodule.finrank_sup_add_finrank_inf_eq` (Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean, lines 173 and 53) with their finite-dimensional hypotheses. Use `AdicCompletion` (Mathlib/RingTheory/AdicCompletion/Basic.lean, line 171) as the compatible inverse system of module quotients, `Module.length` (Mathlib/RingTheory/Length.lean, line 30) with finiteness before integer conversion, and `AlgebraicGeometry.AlgebraicCycle` (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean, line 44) for integer cycles on Spec of the completed rings; its body is a locally finitely supported function on the scheme, so the codimension of the support is imposed separately. None of these declarations constructs an incidence scheme or a trianguline moduli space. Mathlib's `BDeRhamPlus` and `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean, lines 75 and 88) are Fontaine's period rings as bare commutative rings, the completion of W(R♭)[1/p] along ker θ and a localization of it, with no Galois action, no topology and no chosen generator t of ker θ; the coefficient B_dR-representations, B_pdR and D_pdR of Layers 1–3 are PadicHodgeTheory's, through the contracts below.

### From Tau Ceti

No individual Tau Ceti declaration is required by the target-signature file. Shared adic, algebraic and representation foundations enter through the following roadmap contracts. The pinned library revisions are Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a.

### From TauCetiRoadmap.PadicHodgeTheory

Use §§4.3–4.5 for the coefficient period and Sen realizations, Robba connection, B-pairs, their field equivalence and the derived B-pair/Herr comparison. Section 4.5's full-rank quotient invariant identifies H⁰(M/N) for an equal-rank inclusion with the invariants of the quotient of positive period lattices; for de Rham M this is the quotient of positive de Rham realizations (Ding25 Lemma 2.1, pp. 10–11; Ding25 line 421). Section 5.2 supplies filtered modules with finite descent, their Robba modification, saturated subobjects, and the criterion weakly admissible iff every Robba slope is zero. Degree zero alone is insufficient. Section 5.3 supplies D_pst and the Weil–Deligne representation of a potentially semistable representation with its inertial type, in the arithmetic-Frobenius convention in which a crystalline Frobenius eigenvalue λ over ℚₚ gives arithmetic Weil eigenvalue λ⁻¹; with the geometric Art_K of the Conventions, the smooth character unr(λ)∘Art_K⁻¹ is that Weil character. Sections 3.2 and 4.5 fix the Tate filtration sign; the two-term line witness above is retained.

What PadicHodgeTheory must provide (gap:artinian-almost-de-rham): For every local Artinian E-algebra with residue E, provide the exact tensor Fontaine equivalence between almost de Rham coefficient B_dR representations and finite free A⊗K modules with nilpotent operator, including H⁰=ker ν, H¹=coker ν, finite-coefficient tensor compatibility and stable free positive lattices. (§4.5; BHS19 Proposition 3.1.1 and Lemma 3.1.4, pp. 330–332; BHS19 line 1257).

What PadicHodgeTheory must provide (gap:artinian-b-pairs): Extend the coefficient B-pair/Robba equivalence to local Artinian E-algebras, preserving exact sequences, ranks and finite coefficient tensors and proving freeness from a free localized realization and a free positive period lattice. (§4.5; BHS19 Lemma 3.3.5 and Proposition 3.5.1, pp. 344–345, 355–356; BHS19 line 1840).

What PadicHodgeTheory must provide (gap:partial-de-rham-cohomology): Provide the J-de Rham B-pair dimension formula dim H¹_g,J=d rk W+dim H⁰(W)+dim H²_J(W)−dim H⁰(W_dR,J⁺), with H²_J defined by a positive J-algebraic twist killing positive invariants, its specialization when H²_J=H², and the six-term exact sequence for J-de Rham short exact sequences with H²_J(W₁)=0. (§4.5; Ding19 Propositions A.3, A.5 and Corollary A.4, preprint pp. 45–46; Ding19 line 2083).

What PadicHodgeTheory must provide (gap:dominant-trianguline-semistability): For every finite K/ℚₚ and every continuous r:G_K→GLₙ(E) whose Robba module has a saturated triangulation with parameters δ₁,…,δₙ such that δ_i(u)=∏_τ τ(u)^(k_(τ,i)) for every u∈O_K× with integers k_(τ,1)>⋯>k_(τ,n) at every τ, prove that r is semistable and δ_i=z^(k_i)unr(φ_i) with φ₁,…,φₙ the eigenvalues of the linearized Frobenius φ^f on D_st(r) in triangulation order, and that if moreover δ∈T_regⁿ then the monodromy vanishes, r is crystalline and this refinement is noncritical. (§§5.2, 6.3; BHSsmooth17 Lemma 2.10 and proof, pp. 15–16; BHSsmooth17 lines 617–656).

What PadicHodgeTheory must provide (gap:selective-modification): Construct the unique embedding-selective period modification D⊂D_σ of a generic all-refinement noncritical crystabelline module, retaining its localization and σ-filtration, replacing every off-σ weight by the ambient minimum and identifying the potentially semistable period modules. (§5.2; Ding25 Proposition 2.5, p. 13; Ding25 line 560).

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

Use §§1.0c, 1.1–1.2 for period-sheaf comparison, relative coefficient rings and finite-projective module categories; §§3.1, 3.4a, 3.8–3.9 for Herr complexes, Ext, duality, cups and the localized Artinian category with its Herr complex and comparison; §§7.1–7.4 for character lines, exceptional cohomology, weights and rank-one classification; §§7.5–7.8 for saturated/strict flags, global triangulation and specialization. Cohomology-group coefficient change carries its Tor-vanishing hypothesis. Take full finite Gamma-torsion invariants also at p=2. Over ℚₚ use d⁰x=((φ−1)x,(γ−1)x), d¹(a,b)=(γ−1)a−(φ−1)b: scalar operators φ=2,γ=3 give d⁰(1)=(1,2), d¹(1,2)=0 and d¹(1,0)=2. The adapter to the swapped degree-one convention has degree-two sign −1. Arithmetic unramified-first Kummer trace is 1 and its reverse is −1. The Tate line is R(ε); R(x) has Frobenius p while R(ε) has Frobenius 1.

Use §2.7 for the rigid character spaces: W the compact character space of O_K× and T the character space of K×, constructed there as W×G_m through K×≃ϖ_K^ℤ×O_K×, base-changed to E, with their universal characters, generator and uniformizer changes, evaluation and finite coefficient extension. On a principal subgroup (for K=ℚₚ, 1+pℤₚ when p is odd and 1+4ℤ₂ when p=2) W has d open-disc coordinates and keeps every finite-torsion component, and T is W×G_m through K×≃ϖ_K^ℤ×O_K×. Hence dim W=d, dim T=d+1, and restriction of characters T→W is the projection, smooth of relative dimension one. For K=ℚ₂, W has two sign components, each a one-dimensional open disc on which the universal character takes the value +1, respectively −1, at −1; T adds one invertible uniformizer coordinate. Weights of Artinian-valued characters are §7.3's weight function wt(δ).

What PhiGammaModulesAndIwasawaCohomology must provide (gap:general-character-spaces): For every finite K/ℚₚ, (a) prove that the weight morphism wt=(wt_τ)_τ:W_E→(𝔸¹)^Σ, the logarithmic derivative on a sufficiently small unit subgroup extending §7.3's weights from Artinian to affinoid points, is étale, with fibre over 0 the finite-order characters and over an integral k the characters z^k·χ with χ of finite order; (b) prove that for every n≥1, every integral k∈(ℤ^Σ)ⁿ and every C>0, the point δ_k has a basis of affinoid neighbourhoods in Wⁿ_E on each of which the algebraic points δ_(k′) with k′_(τ,i)−k′_(τ,i+1)>C for every τ and 1≤i<n are Zariski dense. (§§2.7, 7.3; BHS19 Lemma 3.5.5 and proof, pp. 357–358; BHS19 line 2362; BHSsmooth17 proof of Proposition 2.12, p. 17; BHSsmooth17 line 727).

### From TauCetiRoadmap.LocalGaloisDeformationRings

Use §0.4 for the finite-local coefficient Robba realization and tangent/Ext comparison, §§1.1, 1.4, 1.12, 1.18 for framed lifting, obstruction theory, residue extension and point completion, and §1.23 for individual noncritical crystabelline deformation rings. With rank n and degree d, their unrestricted, de Rham and refinement tangent dimensions are 1+n²d, 1+dn(n−1)/2 and 1+dn(n+1)/2. This contract requires its generic, all-refinement noncritical and scalar-endomorphism hypotheses; it is not used to prove general regular-locus geometry. Sections 3.4, 3.5, 3.6 and 3.10 provide potentially semistable rings of fixed weight and inertia type, the finite-projective filtered period modules with descent data of potentially semistable families with their specialization comparisons (used with an abelian inertia type τ and L=K′ an abelian extension killing it, and with trivial type and L=K in the crystalline case), filtered (φ,N)-deformations with descent data together with the formal smoothness of framed lifts over that groupoid, and regular potentially crystalline generic fibres of fixed type. Their monodromy relation is Nφ=pφN. For φ=diag(1,p) and N(e₂)=e₁, both sides on e₂ are p e₁.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

Use §1.1 (the flag scheme), §1.2 (dimension and geometric integrality of the smooth projective flag variety) and §1.3 (relative-position orbits); §2.1 (the Grothendieck simultaneous resolution g̃); §3.1 (the double incidence scheme X=g̃×_g g̃), §3.5 (its components X_w) and §3.6 (Bruhat support of X_w); §4.3 (Cohen–Macaulayness of the X_w) and §4.4 (flatness of the Cartan projections); §5.1 (the Weyl relation between the two Cartan maps) and §5.4 (normality of the X_w); §6.6 (the Steinberg components Z_v); §7.1 (top-cycle groups), §7.2 (generic-length module cycles) and §7.3 (the Cartan zero fibres); §11.3 (the Kazhdan–Lusztig multiplicities) and §11.4 (the three integral cycle bases); §12.2 (partial-flag saturation of simple cycles: each component of a simple cycle is a union of fibres of the parabolic quotient F→G/P_w in the first flag, which is not the same as invariance under left translation of the first flag by P_w); §13.3 (detection of components after completion), §13.4 (the tangent-space upper bound) and §13.5 (the smoothness criterion); §14.1 (completion of top cycles), §14.2 (generic-length cycles under completion) and §14.4 (the completed Kazhdan–Lusztig cycle identity). Work in characteristic zero. Preserve the graph (z,w⁻¹z), the simple-cycle support `P_(w_0 w,w_0 v)(1)=0` unless v≤w, and generic-length multiplicities. In S₂, `P_(s,e)=0` and the nonzero KL values are 1. The flatness input uses the pointwise local dimension equality over a regular base with Cohen–Macaulay source, not global fibre dimensions alone. A disjoint point and affine line mapping to the affine line by the zero point and identity have zero-dimensional fibres but are not flat at the isolated point.

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §§0.16–0.17 for catenarity, depth and Cohen–Macaulayness, §0.21 for excellence and formal fibres, and §§4.3–4.5 for Schlessinger conditions, hulls and obstruction theories. The representability statements retain the exact coefficient category and tangent finiteness. A hull is not silently promoted to a representing ring when automorphisms remain.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Use §§1.6–1.8 for labelled Artinian coefficients and small extensions, §§1.9 and 1.11 for formal presentations and framed smoothness, §§1.13–1.14 for finite completion and quotients, and §§2.1–2.7 for minimal equations, hulls, obstructions and fixed-basis representations. The period-frame and Galois-frame torsors have different dimensions. For n=2,d=2 they contribute 8 and 4 respectively.

### From TauCetiRoadmap.RigidAnalyticGeometry

Use §§1.2, 7.3, 8.1–8.3 for affinoid local dimension, coherent identity principles, completed stalks, normality comparisons, analytic excellence, classical points and rigid–adic transport. Normality is an integrally closed local domain property. All completed-ring arguments specify the analytic point and its residue field.

What RigidAnalyticGeometry must provide (gap:completed-normalization-injectivity): For a reduced rigid space Z over E, a classical point z, the normalization Z̃→Z with its finitely many points z̃₁,…,z̃_m above z, and a composite Z′=Z_s→⋯→Z₁=Z̃ of proper birational morphisms of normal rigid spaces, each locally on the target the relative analytification of a projective birational morphism of schemes over an affinoid algebra, prove that Ô_(Z,z)→∏_j Ô_(Z̃,z̃_j) is the normalization of Ô_(Z,z) and that Ô_(Z,z)→∏_j Ô_(Z′,z′_j) is injective for any closed points z′_j∈Z′ above the z̃_j. (§§1.2, 8.1; NT21 proof of Proposition 2.15, pp. 37–38; NT21 line 1473; BHS19 proof of Proposition 3.7.2, p. 367; BHS19 line 2691).

What RigidAnalyticGeometry must provide (gap:rigid-normal-cm-openness): For a rigid space X locally of finite type over E, prove that the points x at which O_(X,x) is normal, respectively Cohen–Macaulay, form Zariski-open subsets of X; on an affinoid Sp A they are the traces on Max A of the corresponding open loci of the excellent ring A. (§§1.2, 8.1; BHS19 proof of Proposition 4.1.4, p. 373; BHS19 line 2948).

What RigidAnalyticGeometry must provide (gap:rigid-flat-openness): For a morphism f:X→Y of rigid spaces locally of finite type over E and a point x at which O_(Y,f(x))→O_(X,x) is flat, prove that f is flat at every point of some affinoid neighbourhood U of x and that f(U) is an admissible open subset of Y. (§§7.3, 8.1; BHS19 proofs of Propositions 4.1.1 and 4.1.4, pp. 372–373; BHS19 lines 2923, 2948; BHSsmooth17 proof of Lemma 2.4, p. 11; BHSsmooth17 line 464).

The coherent Herr complexes, their derived coefficient change and Tor-vanishing conditions, Fitting blowups and the global coherent triangulation used beside these contracts are PhiGammaModulesAndIwasawaCohomology §§3.4a and 7.6–7.8, imported as stated there.

### From TauCetiRoadmap.AdicSpacesPartII

Use R1.1's rigid-local-ring-completion, R1.5's local-ring and constructible comparisons, R1.7's rigid–adic functor and R1.9's dimension and identity-principle comparisons. These supply the adic interpretation of the same rigid objects, not a second trianguline variety.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

Section 5.2a constructs X_tri(r̄) as the reduced closure of the regular triangulation locus in the framed lifting space times Tⁿ, proves representability of the regular triangulation space on PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1 and 7.5's carriers, and proves the smoothness and dimension statements on that locus. It does so inside §5.1's global setting, retaining its globalisation, adequacy, local-type, projectivity and coefficient-field hypotheses, and it does not state smoothness of the full-character projection. The unrestricted local statement used here is the following contract.

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:unrestricted-trianguline-variety): For every finite K/ℚₚ, every n≥1 and every continuous r̄:G_K→GLₙ(k_E), with none of §5.1's global hypotheses, provide X_tri(r̄) as the reduced Zariski closure in X_r̄^□×Tⁿ of the locus U_tri(r̄) of points (r,δ) with δ∈T_regⁿ the parameter of a saturated triangulation of the Robba module of r, equidimensional of dimension n²+dn(n+1)/2, with U_tri(r̄) Zariski open and dense in X_tri(r̄), smooth over E, and with the full-character projection smooth on U_tri(r̄) of relative dimension n²+dn(n−1)/2−n. (§5.2a; BHS17 Definition 2.4 and Théorème 2.6, pp. 8–9; BHS17 line 298).

Write ω′ for the full-character projection and ω for its composite with restriction to unit characters. A closure point need not retain an integral saturated flag of the displayed parameter. For n=2,d=1, dim X_tri=7, dim T²=4 and dim W²=2, giving regular fibre dimensions 3 and 5; the inputs are K, n and r̄ alone, with no globalisation datum. For n=1, X_tri(r̄) has dimension 1+d=dim T and the relative dimension is 0. Distinct unramified characters have the same unit restriction. The intended proof (BHS17 diagram (2.1)) uses the smooth rigidified triangulation moduli over T_regⁿ, representation frames, the smooth quotient by the n graded rescalings and the strict local deformation comparison.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Section 4.3 supplies the NT-ordered regular condition consumed by §4.1: a parameter δ=(δ₁,…,δ_n) is NT-regular when, for every i<j, δ_i/δ_j is not a nonnegative algebraic embedding monomial ∏_τ τ^(a_τ) with all a_τ≥0. That section imposes it on saturated ordered triangulations over Art_E built on LocalGaloisDeformationRings §0.4's Robba objects. The condition is ordered: for n=2 and one embedding τ, δ₁/δ₂=τ is excluded while δ₂/δ₁=τ, that is δ₁/δ₂=τ⁻¹, is allowed. The exponent a=0 gives the ratio 1, so repeated parameters are never NT-regular.

### From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups

Use LR.4/principal-series and LR.5/orlik-strauch-functor, orlik-strauch-exactness, orlik-strauch-irreducibility, orlik-strauch-jordan-holder and orlik-strauch-products for the actual principal series and its irreducibles, including restriction of scalars and product embeddings. The exact lower-Borel, twist, parabolic-isomorphism and all-family triangularity contracts follow below. A signed-cycle zero sum cannot establish constituentwise vanishing.

What LocallyAnalyticRepresentationsOfLocalGroups must provide (gap:all-constituent-triangularity): Provide a separating unitriangular system of Jordan–Hölder multiplicity equations for all locally analytic principal-series constituent families, including non-locally-algebraic and nongeneric inducing data, sufficient to recover signed constituent cycles from all parameter-fibre cycles. (LR.4/principal-series; LR.5/orlik-strauch-jordan-holder; BHS19 Proposition 4.3.6, p. 382; BHS19 line 3288).

What LocallyAnalyticRepresentationsOfLocalGroups must provide (gap:constituent-conventions): Identify the lower-Borel induction I_δ with twists δ_i ε^(i−1), its genuine Orlik–Strauch constituents, their finite Jordan–Hölder multiplicities and the dominant-parabolic criterion for isomorphic presentations in the BHS weight convention. (LR.4/principal-series; LR.5/orlik-strauch-irreducibility; LR.5/orlik-strauch-jordan-holder; BHS19 §4.3, pp. 380–385; BHS19 line 3255).

## How to read the build

Layers 1–3 construct period, lattice and localized-character adapters. Layer 4 develops the independent ordered-regular and rank-two local statements; its strictness theorem precedes any use in the analytic comparison. Layers 5–6 compare extensions, glue the two flags and descend incidence components to Galois deformation rings. Layer 7 identifies the analytic completion; Layers 8–9 transfer geometry and cycles. Layers 10–13 construct the crystabelline endpoints, simultaneous-refinement derivatives, partial modifications and higher-intertwining recovery sequences. Every subsection gives its statement, proof inputs, reusable facts and discriminating examples; dependencies refer to the particular subsection needed. README.md is the roadmap. Suggested.lean states no declaration: none of the headline theorems is statable on the pinned Mathlib and Tau Ceti, and its docstring names, for each headline, the carrier that is missing.

## Layer 1: Framed almost de Rham deformation adapters

The first frame belongs to D_pdR, a rank-n module over the product A⊗K. The coefficient Fontaine equivalence is an input. This layer builds its deformation-groupoid adapter and the comparison with the full matrix space. Nilpotence over an Artinian ring is weaker than lying in the scheme-theoretic nilpotent cone; confusing these would delete genuine first-order character directions.

### 1.1 Almost de Rham deformation groupoids

For an almost de Rham E⊗B_dR representation W of rank n, X_W(A) is the groupoid of pairs (W_A,ι:W_A⊗_A E≅W), with equivariant isomorphisms compatible with ι. X_W^pdR adds an A⊗K-linear frame α_A:(A⊗K)^n≅D_pdR(W_A) lifting a fixed α. Pullback along A→B is tensor product, retaining the special-fibre identification.

W is finite free over E⊗B_dR. Almost de Rham, B_pdR, D_pdR and its nilpotent ν are imported from the Artinian period supplier contract.

(BHS19 §3.1: Proposition 3.1.1, Corollary 3.1.2 and Lemma 3.1.4, pp. 330–332; definitions of X_W and X_W^□ with Remark 3.1.5, pp. 332–333; BHS19 line 1257.)

One proof proceeds as follows. Use the coefficient Fontaine equivalence to show every Artinian deformation is almost de Rham. Transport tensor pullback through that equivalence, with the canonical associativity isomorphisms; retain groupoids before removing automorphisms.

*Needs:* PadicHodgeTheory §§4.4–4.5, 5.2; DeformationAndDerivedPatchingAlgebra §§1.6–1.8; PadicHodgeTheory §4.5; gap:artinian-almost-de-rham.

The reusable interface has the following properties.

- Bundle a lift and its special-fibre isomorphism.

- Pullback is equivariant tensor extension and composes canonically.

- Forget α_A, retaining W_A and ι.

- An isomorphism is exactly an equivariant module isomorphism reducing to the prescribed identity.

**Checks.**

- X_W(E) has one isomorphism class, with automorphisms respecting ι necessarily trivial.

- For W trivial of rank one, a ν=ε deformation over E[ε]/ε² is permitted and differs from the ν=0 deformation.

- Over dual numbers, changing α by 1+εB changes the framed object unless it is induced by a compatible equivariant isomorphism.

- At A=E the reduction marking forces an automorphism to be 1, whereas over E[ε]/ε² the rank-one operators 0 and ε are distinct.

- With N=0 over E[ε]/ε², the frame change α′=α(1+εB) is transported by the period automorphism f=α′α⁻¹=α(1+εB)α⁻¹, which commutes with ν=0 and reduces to the identity; the two framed objects are isomorphic and both have matrix 0, as §1.2 requires. In general the transported matrix is N+ε[N,B]=N+ε[N̄,B̄], where N̄ and B̄ are the reductions modulo ε, so the two framed objects have different matrices, and are not isomorphic, exactly when [N̄,B̄]≠0: for N=E₁₂ and B=diag(1,0) the commutator is −E₁₂ and no compatible isomorphism exists, whereas for N=εE₁₂ and B=diag(1,0) the commutator [N,B]=−εE₁₂ is nonzero but ε[N,B]=0, the two matrices coincide and 1+εB is a compatible isomorphism. In rank one the distinct matrices 0 and ε give non-isomorphic framed objects.

### 1.2 The framed matrix deformation model

X_W^pdR is equivalent to the discrete deformation functor represented by the completion of `g=Res_(K/Q_p) gl_(n,E)` at N=α⁻¹ν_Wα. The forgetful map X_W^pdR→X_W is formally smooth of relative dimension dn². The target is the full Lie algebra completion, including infinitesimal matrices whose characteristic polynomial is not X^n.

§1.1 conventions; α fixed.

(BHS19 Corollary 3.1.6 and Remark 3.1.7, p. 334; BHS19 line 1425.)

One proof proceeds as follows. Apply the fully faithful coefficient Fontaine equivalence, reading ν in the chosen basis. A matrix reducing to a nilpotent matrix is nilpotent over an Artinian ring, so it defines an almost de Rham object. Lift bases over nilpotent ideals; their differences form gl_n(A⊗K), while a framed automorphism commuting with ν and fixing its frame is the identity.

*Needs:* §1.1; SpringerResolutionAndCharacteristicCycles §2.1; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7; `AdicCompletion`.

**Checks.**

- For n=1,A=E[ε]/ε², ν=ε is admitted although its characteristic polynomial is X−ε.

- For n=1 and A=E[ε]/ε², ν²=0 but charpoly(ν)=X−ε, whereas the scheme-theoretic nilpotent cone would require charpoly X.

- For d=2,n=2 the period-frame relative dimension is 8; a representation frame contributes 4.

### 1.3 Filtered period deformations and their weights

For a full G_K-stable B_dR flag F_• of W with rank-one graded pieces, define `X_(W,F)(A)` using a lifted full flag in W_A and its reduction to F_•; add α_A for `X^pdR_(W,F)`. Let κ_F be the ordered scalars by which ν acts on the graded A⊗K lines. Thus κ_F lies in m_A⊗_ℚₚ K^n and is independent of α_A.

F_• is exhaustive, increasing and saturated in W.

(BHS19 Definition 3.1.8 and formulas (3.3)–(3.4), pp. 334–336; BHS19 line 1414.)

One proof proceeds as follows. Exactness of D_pdR sends the flag to a full ν-stable flag over A⊗K. On each graded line ν is multiplication by a unique scalar; reduction is zero, and tensor base change preserves these scalars.

*Needs:* §1.1; PadicHodgeTheory §§4.4–4.5, 5.2; SpringerResolutionAndCharacteristicCycles §1.1.

The reusable interface has the following properties.

- Lift the full flag as finite free direct summands with rank-one successive quotients.

- Return the ordered diagonal ν-scalars, componentwise in τ.

- κ_F tensors along A→B.

- Simultaneous change of basis and flag leaves the scalar tuple unchanged.

**Checks.**

- For n=1, κ_F is the scalar ν.

- For ν=[[ε,a],[0,2ε]] preserving the standard flag, κ=(ε,2ε), independent of a.

- Swapping the ordered graded lines swaps κ-coordinates; it is not an unordered spectrum.

- Over E[ε]/ε², the upper triangular matrix with diagonal (ε,2ε) gives κ=(ε,2ε); its off-diagonal entry changes neither coordinate.

### 1.4 The first simultaneous-resolution model

The frame and D_pdR identify `X^pdR_(W,F)` with the completion of g̃ at (α⁻¹D_pdR(F_•),N); under this identification κ_F is the Cartan projection of the simultaneous resolution. This framed functor is formally smooth of dimension dn².

(BHS19 Corollary 3.1.9, pp. 334–335; BHS19 line 1465.)

One proof proceeds as follows. Use §1.2 and the full ν-stable flag correspondence. Identify the functor of matrix–flag pairs with the supplier’s incidence definition of g̃; use its smoothness and dimension.

*Needs:* §1.3; §1.2; SpringerResolutionAndCharacteristicCycles §2.1; SpringerResolutionAndCharacteristicCycles §1.2.

**Checks.**

- For n=2,d=1, a line in E² contributes 1 coordinate and its preserving upper triangular matrix 3, giving 4=dn².

- For n=1,d=2 there is no flag coordinate and the two scalar matrix coordinates give dimension 2.

### Examples

For n=1 and A=E[ε]/ε², multiplication by ε is nilpotent and represents a valid lift of N=0. Its characteristic polynomial is X−ε, so the completion of the nilpotent cone would incorrectly remove it. For two embeddings, a period frame has 2n² infinitesimal coordinates, while a Galois frame still has n².

### Dependencies

PadicHodgeTheory §§4.4–4.5, 5.2; DeformationAndDerivedPatchingAlgebra §§1.6–1.8; PadicHodgeTheory §4.5; SpringerResolutionAndCharacteristicCycles §2.1; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7; `AdicCompletion`; SpringerResolutionAndCharacteristicCycles §1.1; SpringerResolutionAndCharacteristicCycles §1.2.

## Layer 2: Regular period lattices and Hodge flags

A lattice supplies the second flag. Keep the decreasing filtration and its ν-operator until regularity turns it into a full flag; the jumps depend on the embedding. The coefficient filtration theorem is also the engine for the explicit first-order modification in Layer 12.

### 2.1 The period-lattice filtration adapter

For an almost de Rham lattice W⁺⊂W, send it to the decreasing filtration `Fil^i D_pdR(W)=(t^i B_pdR^(+) tensor_(B_dR^(+)) W^(+))^(G_K)`. This is exhaustive, separated and ν-stable. Conversely recover W⁺ as the ν=0 horizontal part of Σ_i t^(−i) B_pdR⁺⊗_K Fil^i. These constructions are inverse and compatible with morphisms.

W⁺ is a finite free B_dR⁺ lattice and has integral Sen weights. Use D_pdR rather than D_dR.

(BHS19 Proposition 3.2.1, pp. 336–337; BHS19 line 1512.)

One proof proceeds as follows. Apply the almost de Rham period equivalence to the t-adic filtration. Use nilpotence of ν and finite exhaustive filtration to identify the horizontal sum with a B_dR⁺ lattice. Check both compositions after extension to B_pdR, where the connection gives the explicit inverse.

*Needs:* §1.1; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-almost-de-rham.

The reusable interface has the following properties.

- Fil^i is the specified invariant submodule, with inclusion Fil^(i+1)⊂Fil^i.

- Recover the lattice by ν-horizontal elements in the finite filtered sum.

- The two functors are quasi-inverse on morphisms as well as objects.

- Replacing W⁺ by t^aW⁺ shifts Fil^i to Fil^(i+a).

**Checks.**

- For W⁺=B_dR⁺, Fil^i K is K for i≤0 and zero for i>0.

- For W⁺=t^aB_dR⁺ the unique jump is −a.

- A ν-stable filtration on a nontrivial nilpotent two-dimensional object reconstructs that ν; forgetting ν cannot define an inverse.

- For the unit line, (Fil⁰,Fil¹)=(K,0); replacing its lattice by t gives (Fil⁻¹,Fil⁰)=(K,0).

### 2.2 Artinian lattice and filtration equivalence

The preceding equivalence extends over A∈Art_E to finite free A⊗B_dR⁺ representations and finite free A⊗K modules with nilpotent ν and exhaustive separated ν-stable filtrations whose graded pieces are finite projective over A⊗K. Filtration, graded pieces and the equivalence commute with tensoring any finite A-module. At each τ every graded piece is A-free, but ranks may be zero and need not be parallel in τ.

(BHS19 Lemma 3.2.2, pp. 337–340; BHS19 line 1568.)

One proof proceeds as follows. Induct on the length of A using the small-extension exact sequence and the field equivalence. Use flatness of graded pieces to preserve the filtration sequence under arbitrary finite A-module tensor products. Split A⊗K as ∏_τ A; projectivity gives free τ-components, not a globally rank-one assertion.

*Needs:* §2.1; DeformationAndDerivedPatchingAlgebra §§1.6–1.8.

**Checks.**

- Over A=E[ε]/ε², a graded piece A has E-dimension 2 and reduces to dimension 1; reduction is tensor product, not an assertion of equal E-dimensions.

- With two embeddings a graded piece (A,0) is projective over A×A but has ranks (1,0), excluding a global constant-rank-one requirement.

- The submodule εA⊂A is not a permitted graded direct summand: tensoring its inclusion with E gives the zero map E→E.

### 2.3 Regular lattices and the Hodge flag

Define the following object. A lattice is regular when its Sen weights are distinct at every τ. For their increasing ordering `h_(tau,i)`, form the increasing full flag Fil_i=⊕_τ `Fil^(-h_(tau,i))_tau` D_pdR(W). In every Artinian deformation the ranks of all graded τ-pieces equal the residual ranks, so the same indexed jumps define a lifted full flag.

(BHS19 Corollary 3.2.3, Definition 3.2.4 and (3.9), pp. 340–341; BHS19 line 1662.)

One proof proceeds as follows. Apply tensor compatibility with E to identify each residual graded piece. Finite freeness and Nakayama fix its rank; distinct residual weights then yield a full flag at the displayed indices.

*Needs:* §2.2; SpringerResolutionAndCharacteristicCycles §1.1; PadicHodgeTheory §4.4.

The reusable interface has the following properties.

- Evaluate the decreasing filtration at `-h_(tau,i)` separately at each embedding.

- Regularity means each nonzero residual τ-graded piece has rank one.

- The Hodge flag and its graded ranks commute with Artinian pullback.

**Checks.**

- Weights (0,2) give Fil_1=Fil^0 of rank one and Fil_2=Fil^(−2) of rank two.

- For two embeddings, weights (0,2) and (1,4) are regular despite different jumps; a global fixed-jump rank-one rule fails.

- Weights (0,0) fail regularity and do not give the specified full flag.

- For h=(0,2), ranks of (Fil⁰,Fil⁻²) are (1,2); for h=(0,0) they cannot furnish two distinct jumps.

### 2.4 The second simultaneous-resolution model

For a regular W⁺, its D_pdR-framed lattice deformation groupoid is equivalent to the completion of g̃ at (α⁻¹HodgeFlag(W⁺),N). It is formally smooth of dimension dn². The Cartan coordinates are the ν-scalars on the Hodge graded lines.

(BHS19 Theorem 3.2.5, p. 341; BHS19 line 1720.)

One proof proceeds as follows. Use §2.2 and fixed graded ranks to replace lifted filtrations by lifted full flags. Apply the same matrix–flag representing property as §1.4, keeping this Hodge flag distinct from F_•.

*Needs:* §2.3; §1.4.

**Checks.**

- For h=(0,2), a rank-two flag has dimension 1 and its preserving matrix dimension 3, giving 4; for a line over two embeddings the dimension is 2.

- The zero nilpotent operator preserves every Hodge flag; the full matrix completion still admits ε on a rank-one graded line.

### Examples

A trivial line has Fil^i=K for i≤0. Replacing its lattice by t^aB_dR⁺ moves the jump to −a. With two labelled weights (0,2), the full Hodge flag uses Fil^0 and Fil^(−2); a second embedding with weights (1,4) has different jumps but the same flag ranks.

### Dependencies

§1.1; PadicHodgeTheory §§4.4–4.5, 5.2; DeformationAndDerivedPatchingAlgebra §§1.6–1.8; SpringerResolutionAndCharacteristicCycles §1.1; PadicHodgeTheory §4.4; §1.4.

## Layer 3: Localized triangulations and character weights

An integral triangulation and a localized triangulation have different specialization behaviour. Fix the residual parameter before asserting uniqueness of a lifted character tuple. The Cartan map records the difference of character derivatives from the residual weights, so its origin is zero even at a nonzero integral weight.

### 3.1 Generic ordered parameter tuples

Let T be the rigid space of continuous characters K×→E×. Define T₀ⁿ by requiring, for every ordered i≠j, both δ_i/δ_j and εδ_j/δ_i to be nonalgebraic, where `eps=N_(K/Q_p)|N_(K/Q_p)|`. Define T_regⁿ by excluding δ_i/δ_j=∏ττ^(−aτ) and δ_i/δ_j=ε∏ττ^aτ for all aτ≥0 and every i≠j. The first condition is stronger than the regular rank-one cohomology condition; these loci must not be confused with NT regularity.

(BHS19 §3.4, definition of T₀ and T₀ⁿ before Theorem 3.4.4, p. 352; §3.7, definition of T_reg and T_regⁿ, p. 365; BHS19 line 2143; BHS17 §2.2, author PDF pp. 7–8, regular character locus; BHS17 line 247.)

A proof route uses the character space and algebraic characters; form the indicated complements of exceptional characters. Use the rank-one H⁰/H² formula to identify the cohomological meaning of each exclusion.

*Needs:* PhiGammaModulesAndIwasawaCohomology §2.7; PhiGammaModulesAndIwasawaCohomology §7.2.

The reusable interface has the following properties.

- Test both ordered exceptional algebraic ratios.

- Test precisely the nonnegative algebraic and cyclotomic-algebraic exceptional sets.

- T₀ⁿ is contained in T_regⁿ.

- Genericity is invariant under permutation of all n coordinates.

**Checks.**

- For n=1 both conditions are vacuous.

- If δ₂/δ₁ is algebraic, the pair fails T₀ even when one orientation is omitted.

- A pair with δ₁/δ₂=ε fails genericity and regularity.

- For n=1 there are 0 ordered pairs; for n=2 the ratio 1 makes genericity false, and the ratio ε makes both genericity and regularity false.

### 3.2 Localized triangulations and deformation parameters

For M=D[1/t], a localized triangulation F_• is an exhaustive full flag by finite projective (φ,Γ)-submodules with graded pieces R_E[1/t](δ_i). Define `X_(M,F)` by lifting this flag and M over Art_E. Its parameter map ω sends a lift to the unique tuple δ_A reducing to the specified residual tuple δ whose localized rank-one modules identify with its graded pieces. Without fixing δ, the tuple is only determined up to algebraic twists.

(BHS19 Lemma 3.3.4, pp. 343–344; Definition 3.3.8 and the definition of ω_δ, p. 347; (3.15)–(3.16), p. 348; BHS19 line 1805.)

One proof proceeds as follows. Use the supplier’s relative localized category and rank-one classification. A localized rank-one isomorphism differs by an algebraic character, which has no nontrivial infinitesimal variation with fixed residue. Trivialize graded line bundles over local Artinian coefficients; show independence of those trivializations.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§1.1–1.2; PhiGammaModulesAndIwasawaCohomology §7.4; §3.1.

The reusable interface has the following properties.

- Require the localized rank-one graded identifications, not an integral saturated flag.

- Return the unique lift of the fixed residual tuple.

- Tensor extension preserves the flag and its parameter.

- Changing δ by a fixed algebraic tuple changes the parameter convention by that tuple.

**Checks.**

- R[1/t](δ)≅R[1/t](δ∏ττ^aτ); unbased uniqueness of δ would be false.

- δ(1+εψ) and δ have the same based parameter only when ψ=0.

- An integral flag that loses saturation on specialization can still determine a localized flag; integral saturation is not built into this definition.

- The modules R(δ) and R(δx) become isomorphic after inverting t; the based lifts δ and δ(1+εlog) have weights differing by ε and cannot be identified.

### 3.3 Rank-one torsion and localized isomorphisms

For k=(kτ)≥0 and a continuous δ:K×→E×, H⁰ and H¹ of R_E(δ)/(∏τtτ^kτ) vanish if every wtτ(δ) avoids {1−kτ,…,0}; by dévissage on A the same vanishing holds for R_A(δ)/(∏τtτ^kτ), A∈Art_E, when the residual character of δ satisfies this condition. If every labelled weight of a field-valued δ belongs to its indicated interval, both have E-dimension d. An isomorphism R_A[1/t](δ)≅R_A[1/t](δ′) exists exactly when δ/δ′ is an algebraic character with fixed integral exponents; this includes nilpotent coefficient information.

In the dimension clause kτ>0 and all weights satisfy the displayed membership condition; no mixed-embedding dimension formula is asserted.

(BHS19 Lemmas 3.3.3–3.3.4, pp. 343–344; BHS19 line 1798.)

One proof proceeds as follows. Compute successive tτ-quotients using the Γ-eigenspaces of the coefficient Sen module. Pass through the finite filtration for torsion cohomology. Apply H⁰ after sufficiently large t-shifts to characterize an invertible localized rank-one morphism. For the converse direction of the isomorphism criterion use R_E(x_σ)≅(t_σ), so twisting by an algebraic character changes a rank-one module by a power of t and leaves its localization unchanged.

*Needs:* PhiGammaModulesAndIwasawaCohomology §7.2; PhiGammaModulesAndIwasawaCohomology §7.3; PadicHodgeTheory §4.4; PhiGammaModulesAndIwasawaCohomology §7.1.

**Checks.**

- For K=ℚₚ,k=1, the torsion interval is {0}: weight 0 gives (dim H⁰,dim H¹)=(1,1), and weight 1 gives (0,0).

- For k=0 the quotient is zero and the interval is empty, so both cohomology groups are zero.

- The infinitesimal ratio 1+εlog has weight ε, hence is not a constant integral algebraic ratio, although its reduction is 1.

### 3.4 Localized period realization over Artinian coefficients

Define the following object. On PhiGammaModulesAndIwasawaCohomology §3.9's localized Artinian category, whose objects are (φ,Γ)-modules M finite free over `R_(A,K)[1/t]` with a stable finite-projective R_K-lattice, and through the coefficient B-pair category of the supplier contract, localized period realization gives an exact, coefficient-base-change-compatible W_dR from such M to finite free A⊗B_dR representations of rank rk M. The stable R_K-lattice need not be free over `R_(A,K)`; W_dR(M) is independent of that lattice. For a (φ,Γ)-module D over `R_(A,K)`, W_dR⁺(D) is finite free of rank rk D and commutes with tensoring finite A-modules. On localized triangulations W_dR sends the full flag to a G_K-stable full flag.

(BHS19 Lemma 3.3.5 and §3.3.3, pp. 344–345; BHS19 line 1840.)

A proof route uses the coefficient B-pair equivalence rather than rebuilding period rings. Use the Artinian flatness criterion and Nakayama on each period realization; the freeness of W_dR(M) is proved directly from a stable R_K-lattice, without assuming an `R_(A,K)`-free lattice (BHS19 Lemma 3.3.5(ii)). Compare two lattices after bounding one between t-powers of the other; inverting t removes the choice.

*Needs:* PhiGammaModulesAndIwasawaCohomology §3.9; PadicHodgeTheory §4.5; PhiGammaModulesAndIwasawaCohomology §1.0c; §3.2; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-b-pairs.

The reusable interface has the following properties.

- Associate the finite free W_dR representation.

- Preserve short exact sequences in the indicated exact category.

- Identify realizations from different stable lattices canonically.

- Commute with finite coefficient-module tensor products.

**Checks.**

- The realization of R_A[1/t](δ) has rank one over A⊗B_dR.

- D and tD give canonically the same W_dR but different W_dR⁺.

- Exact realization carries the actual extension sequence and is compatible with pushout; a nonzero Herr extension can become split after period realization.

- For D and tD, W_dR(D)=W_dR(tD) but the positive lattices differ by t; exact realization need not reflect nonsplitting.

### 3.5 Character weights equal period Cartan coordinates

For a residual field-valued rank-one character δ, W_dR(R_E[1/t](δ)) is almost de Rham if and only if δ is locally algebraic. For an Artinian deformation δ_A of such a δ, ν on D_pdR(W_dR(R_A[1/t](δ_A))) is multiplication by wt(δ_A)−wt(δ). Hence for a localized flag κ_F=wt(ω)−wt(δ), embedding by embedding. The rank-one period representation is trivial precisely when δ_A is locally algebraic, including the absence of infinitesimal weight variation.

(BHS19 Lemmas 3.3.6–3.3.7, pp. 345–346; Corollary 3.3.9, pp. 348–349; BHS19 line 1880.)

One proof proceeds as follows. Use the rank-one Sen classification to identify integral residual weights with locally algebraic characters, then twist away their algebraic part. Compute the logarithmic Γ-action in rank one; the nilpotent coefficient is its derivative. Apply the rank-one calculation to every graded line and use exactness.

*Needs:* §3.3; §3.4; §1.3; PhiGammaModulesAndIwasawaCohomology §7.3; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-almost-de-rham.

**Checks.**

- For δ=x² and δ_A=δ(1+εlog), wt(δ_A)−wt(δ)=ε, while at δ_A=δ the difference is 0.

- For a finite-order smooth character all derivative weights and the rank-one period operator are 0; nontrivial finite order does not obstruct local algebraicity.

### Examples

In rank one no pairwise genericity test is imposed. In rank two a ratio equal to ε fails the regular condition, whereas a nontrivial smooth factor can make a locally algebraic ratio nonalgebraic and admissible for T₀. After inverting t an algebraic twist of a graded character gives the same rank-one module; fixing the residual tuple removes this discrete ambiguity in deformations.

### Dependencies

PhiGammaModulesAndIwasawaCohomology §2.7; PhiGammaModulesAndIwasawaCohomology §7.2; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2; PhiGammaModulesAndIwasawaCohomology §7.4; PhiGammaModulesAndIwasawaCohomology §7.3; PadicHodgeTheory §4.4; PhiGammaModulesAndIwasawaCohomology §7.1; PadicHodgeTheory §4.5; PhiGammaModulesAndIwasawaCohomology §1.0c; PadicHodgeTheory §§4.4–4.5, 5.2; §1.3.

## Layer 4: Ordered-regular local deformation applications

This branch uses Newton–Thorne’s weaker, ordered regularity condition and their opposite sign for weights. It gives the local strictness and noncriticality inputs to eigenvariety arguments.

### 4.1 Ordered-regular parameters and ordinary flags

Use NT-regularity of δ=(δ₁,…,δ_n), namely δ_i/δ_j≠∏ττ^aτ for every i<j and every aτ≥0. A parameter is ordinary when each δ_i(ϖ_K) is a p-adic unit. For an ordinary tuple, a Galois representation is trianguline of that parameter exactly when it has a G_K-stable flag whose graded characters are δ_i∘Art_K⁻¹. These conditions are ordered and use NT's geometric normalization of Art_K fixed in the Conventions.

(NT21 §2.3.1 before Lemma 2.4, p. 28; NT21 line 1098.)

A proof route uses PhiGammaModulesAndIwasawaCohomology §§7.2 and 7.5's rank-one Robba modules and integral triangulations. Apply rank-one étaleness and the exact étale Robba/Galois equivalence to ordinary graded pieces. Use the ordered rank-one H⁰ vanishing for the NT-regular condition.

*Needs:* ModularityAndLanglandsExtensions §4.3; PhiGammaModulesAndIwasawaCohomology §7.5; PhiGammaModulesAndIwasawaCohomology §7.2; PadicHodgeTheory §4.3; PhiGammaModulesAndIwasawaCohomology §2.7.

The reusable interface has the following properties.

- Exclude only the displayed nonnegative algebraic ratios for i<j.

- Each δ_i evaluated at a uniformizer has valuation zero.

- Identify ordinary triangulations with ordered Galois flags.

- The negative derivative weights agree with NT Definition 2.5.

**Checks.**

- Regularity is vacuous for n=1.

- For n=2,δ₁/δ₂=∏ττ^aτ with aτ≥0 fails regularity even when the reversed ratio would not.

- An ordinary parameter has zero individual uniformizer valuations, not just zero valuation of their product.

- For n=2, uniformizer valuations (1,−1) sum to 0 but fail ordinarity; valuations (0,0) meet the ordinary requirement.

- Over ℚ₃ and n=1, the unramified Galois character η with η(Frob_arith)=2 is ordinary of parameter δ with δ(3)=1/2, and δ∘Art_K⁻¹ evaluated at arithmetic Frobenius is 2 again; the arithmetic normalization would give δ(3)=2, a parameter whose crystalline Frobenius 2 disagrees with that of η.

### 4.2 Strictness and uniqueness for ordered-regular parameters

If ρ has an integral triangulation of NT-regular parameter δ, it is unique and strict: for 0≤i≤n−1 the H⁰ of `(D_rig(rho)/Fil_i)(delta_(i+1)^(-1))` is one-dimensional. There is no `delta_(n+1)` condition. This theorem needs no cyclotomic exceptional-ratio exclusion.

(NT21 Lemma 2.4, pp. 28–29; NT21 line 1098.)

One proof proceeds as follows. Compute H⁰ on the graded rank-one pieces: the matched index gives E and later indices give zero by NT regularity. Induct through the quotient filtration to prove the one-dimensional assertion. A normalized generator determines the first line, then repeat on the quotient.

*Needs:* §4.1; PhiGammaModulesAndIwasawaCohomology §7.2; PhiGammaModulesAndIwasawaCohomology §7.5.

**Checks.**

- At n=1 only i=0 occurs and H⁰(R(δ₁)δ₁⁻¹)=E has dimension 1; the nonexistent i=1 test would instead have zero quotient.

- For R⊕R with repeated parameter, H⁰ has dimension 2 and many lines, violating ordered regularity and strictness.

### 4.3 Numerically noncritical character tuples

Let `k_(tau,i)=wt_NT,tau delta_i` be strictly increasing integers. Call δ numerically noncritical if, for every τ and 1≤i<n, `v_p((delta_1...delta_i)(p))<k_(tau,i+1)-k_(tau,i)`, with v_p(p)=1 and p the rational prime viewed in K×.

(NT21 Definition 2.9, p. 32; NT21 line 1232.)

A proof route uses continuous characters and their weights and evaluations. Specify the prefix-product valuations and every embedding inequality. Use finite ordered indices and the actual character valuations; a bound on independent scalars is not this character condition.

*Needs:* §4.1; PhiGammaModulesAndIwasawaCohomology §§2.7, 7.3.

The reusable interface has the following properties.

- Return the strictly increasing integral labelled weights.

- Impose the strict prefix-slope inequality at each adjacent pair and each embedding.

- At n=1 the slope inequalities are vacuous.

- Substitute the actual prefix valuations, evaluated at p, into every strict inequality.

**Checks.**

- For one embedding, weights (0,3) and prefix slope 2 satisfy the inequalities.

- The same weights with prefix slope 3 fail because the inequality is strict.

- With gaps 3 and 1 at two embeddings, prefix slope 2 fails the condition despite passing at the first embedding.

- A one-entry integral weight tuple has no prefix bound to check.

- For weights (0,3), slope 2 gives 2<3, whereas slope 3 gives the false 3<3; for gaps (3,1) the same slope fails at the second embedding.

### 4.4 A Weil–Deligne valuation criterion for noncritical triangulations

Let ρ be de Rham with distinct ascending labelled weights k and a full WD(ρ)-stable flag with rank-one graded characters χ₁,…,χ_n. When n≥2, for every τ require `v_p(chi_1(p))<k_(tau,2)+sum_(tau'!=tau) k_(tau',1)`; for 2≤i<n require `v_p((chi_1...chi_i)(p))<k_(tau,i+1)+sum_(tau'!=tau) k_(tau',i)+sum_(tau') sum_(j<i) k_(tau',j)`. Then ρ has the noncritical triangulation `delta_i=(chi_i o Art_K)prod_tau tau^(-k_(tau,i))`. Equivalently the numerical noncriticality of this δ suffices. A WD flag and de Rhamness are hypotheses, not conclusions of numerical inequalities alone.

(NT21 Lemma 2.8 and reformulation after Definition 2.9, pp. 31–32; NT21 line 1189.)

One proof proceeds as follows. Transport the WD flag to the potentially semistable (φ,N,G_K)-module and then to Robba modules using Berger’s filtered equivalence. Induct on the flag rank: weak admissibility bounds the sum of the induced jumps by the Newton slope, and the strict inequality excludes every jump other than the smallest remaining labelled one. Identify the rank-one character with the displayed reciprocity and algebraic normalization.

*Needs:* §4.3; PadicHodgeTheory §5.2.

**Checks.**

- For K=ℚₚ,n=2,k=(0,3), the WD slope 2 gives 2<3 and the parameter prefix slope 2−0=2<3.

- For d=2, k=(0,3) at both embeddings and χ₁(p) of valuation 2, both labelled WD bounds are 2<3+0, and δ₁(p) has valuation 2.

- For n=1 all adjacent inequalities are empty; a rank-one de Rham character already gives its single triangulation.

### 4.5 Three rank-two de Rham triangulation cases

For K=ℚₚ, a rank-two de Rham ρ with k₁<k₂ and distinct WD semisimple characters χ₁,χ₂ has: if N≠0, exactly one triangulation, noncritical, after ordering χ₁=χ₂|·|; if potentially crystalline and irreducible or reducible indecomposable, exactly two, both noncritical, with the two χ-orderings and the same k-ordering; if split ψ₁⊕ψ₂ with wtψ_i=k_i, exactly two, one with ordered k and one critical with reversed graded weights. No two-refinement assertion is made when χ₁=χ₂.

(NT21 Example 2.10, pp. 32–33; NT21 line 1297; Colmez08 Definition 4.1 and Proposition 4.3, pp. 237–238; Colmez08 line 944.)

One proof proceeds as follows. Classify the WD-stable rank-one lines in the three cases. Use the filtered-module/Robba equivalence to inspect saturation and induced jumps. Track parameter characters explicitly as χ∘Art times x^(−k), including the reversal in the split critical case.

*Needs:* §4.4; PhiGammaModulesAndIwasawaCohomology §7.5; PadicHodgeTheory §5.2.

**Checks.**

- With distinct WD characters, the three cases have respectively 1, 2 and 2 triangulations; the split case has noncritical counts 1 and critical counts 1.

- For a Tate extension N has rank 1, so the other WD line is not N-stable; one cannot count two N-stable refinements.

- For a scalar WD character χ₁=χ₂, the distinctness hypothesis fails and the two-permutation count is inapplicable.

### Examples

With one embedding and weights (0,3), prefix slope 2 passes the numerical criterion and slope 3 fails. With a second embedding of gap 1, slope 2 fails the all-embedding test. A fixed-unit-weight unramified infinitesimal twist is allowed and is de Rham.

### Dependencies

ModularityAndLanglandsExtensions §4.3; PhiGammaModulesAndIwasawaCohomology §7.5; PhiGammaModulesAndIwasawaCohomology §7.2; PadicHodgeTheory §4.3; PhiGammaModulesAndIwasawaCohomology §§2.7, 7.3; PadicHodgeTheory §5.2.

## Layer 5: Extension comparison and formal lifting

Formal lifting is an extension problem with two prescribed outputs: a character and a period extension. The rank-one H¹ comparison supplies their compatibility; the vanishing of H² removes the obstruction. Genericity and local algebraicity enter different parts of this argument and must remain separate hypotheses.

### 5.1 The localized Herr-to-period extension map

Exact period realization induces a natural map `H^1_(phi,Gamma)(M) -> H^1(G_K,W_dR(M))` by sending an extension of R_A[1/t] by M to its period extension. Use the supplier identifications H⁰=ker ν and H¹=coker ν for almost de Rham periods; the resulting H¹ functor is right exact, and exact on sequences whose operators all vanish.

(BHS19 §3.3, (3.11)–(3.13), p. 343; §3.4, (3.18)–(3.19) and the identifications H⁰=ker ν, H¹=coker ν, p. 349; BHS19 line 1775.)

One proof proceeds as follows. Use Yoneda extensions in the localized exact category, not a nonexistent isomorphism of arbitrary complexes. Apply the coefficient almost de Rham cohomology calculation; a short exact sequence induces the kernel–cokernel sequence for ν.

*Needs:* §3.4; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §3.9; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-almost-de-rham.

The reusable interface has the following properties.

- Map each Herr extension to its realized Galois extension.

- Commute with module maps and coefficient extension.

- Identify H¹ with coker ν in the almost de Rham category.

- Transport right exactness of cokernels to period H¹.

**Checks.**

- If ν=0, H⁰ and H¹ both identify with D_pdR(W).

- For a nonzero nilpotent 2×2 Jordan block, H⁰ and H¹ have dimension one, not two.

- Pushing out an extension before period realization equals pushing out its realized extension.

- For ν=0 on E², (dim ker ν,dim coker ν)=(2,2); for ν=[[0,1],[0,0]] they are (1,1).

- For the zero Herr extension, exact realization yields the zero period extension; neither comparison nor exactness claims injectivity in every rank.

### 5.2 Rank-one localization and period comparison

Let δ:K×→E× be continuous with δ and εδ⁻¹ nonalgebraic, and let k=(kτ)_τ be a tuple of nonnegative integers. Then H⁰(t^(−k)R_E(δ))=H²(R_E(δ))=0, and both H¹(R_E(δ)) and H¹(t^(−k)R_E(δ)) have dimension d. The map `H^1(R_E(delta)) -> H^1(t^(-k)R_E(delta))` induced by the inclusion is an isomorphism when wtτδ∉{1,…,kτ} for every τ, and is zero when wtτδ∈{1,…,kτ} for every τ. These are statements about the finite shift t^(−k); the full localization R_E(δ)[1/t] is the union of all shifts. If δ is additionally locally algebraic, H¹(R_E[1/t](δ))→H¹(G_K,W_dR(R_E[1/t](δ))) is an isomorphism. Over A with generic residual δ, localized H⁰ and H² vanish; the H¹ map is surjective if residual δ is locally algebraic and an isomorphism if δ_A itself is locally algebraic.

(BHS19 Lemmas 3.4.1–3.4.3, pp. 349–352; BHS19 line 2061.)

One proof proceeds as follows. Use rank-one Herr cohomology and the torsion exact sequence to compute the localization map. Compare the B-pair Bloch–Kato local condition with Herr duality for sufficiently large t-shifts. Induct on the length of A; right exactness of period H¹ gives surjectivity, and ν=0 supplies the stronger isomorphism.

*Needs:* §5.1; §3.3; PhiGammaModulesAndIwasawaCohomology §3.4a; PadicHodgeTheory §4.5.

**Checks.**

- For K=ℚₚ and k=1, a generic locally algebraic character of weight 1 gives the zero map H¹(R_E(δ))→H¹(t⁻¹R_E(δ)); weight 2 lies outside {1} and gives an isomorphism onto H¹(t⁻¹R_E(δ)).

- For K=ℚ₃ and δ=unr(2)x², δ and εδ⁻¹=unr(1/6)x⁻¹ are nonalgebraic and wt δ=2, so H¹(R_E(δ)) is a line. Its map to H¹(t⁻¹R_E(δ)) has rank 1 (2∉{1}), its map to H¹(t⁻²R_E(δ)) has rank 0 (2∈{1,2}), and hence its map to H¹(R_E(δ)[1/t]), which factors through the second, is zero. A finite-shift isomorphism therefore says nothing about the full localization.

- For δ=1, H⁰=E; this excluded algebraic character disproves vanishing without the generic-ratio hypotheses.

- For δ_A=δ(1+εlog), the residual period operator is 0 but the lifted operator is ε; only surjectivity, rather than an isomorphism, is asserted in that case.

### 5.3 Formal smoothness of the filtered period comparison

For M with a localized triangulation of locally algebraic generic residual parameter δ, the map `X_(M,F) -> T_hat_delta^n x_(t_hat_0) X_(W_dR(M),F)` is formally smooth. Its points retain both the lifted character tuple and the lifted period flag with matching κ. This assertion holds for groupoids and all small extensions in Art_E.

(BHS19 Theorem 3.4.4 and Lemma 3.4.5, pp. 352–354; BHS19 line 2150.)

One proof proceeds as follows. Lift the triangulation inductively by its rank. Localized H²=0 removes the obstruction to lifting each extension. The rank-one H¹-to-period surjection adjusts the lift to the prescribed period extension; the elementary surjective fibre-product module lemma ensures compatible choices. Check graded parameters and special-fibre identifications at every step.

*Needs:* §5.2; §3.5; DeformationAndDerivedPatchingAlgebra §§2.2–2.5.

**Checks.**

- For a rank-one generic residual parameter, a character lift with derivative ε must be paired with ν=ε; pairing it with ν=0 fails the fibre-product equality.

- Across E[ε]/ε²→E, every matching rank-one character/period datum lifts; across the identity extension the datum maps to itself.

### 5.4 Closed triangulation condition and split de Rham lifts

For a generic residual localized triangulation, `X_(M,F) -> X_M` is relatively representable by a closed immersion. If the residual δ is locally algebraic generic and an Artinian deformation M_A has `nu_(W_dR(M_A))=0`, then M_A splits as ⊕_i `R_A[1/t](delta_(A,i))` with locally algebraic lifted parameters. The splitting assertion is not asserted without ν=0.

(BHS19 Proposition 3.4.6 and Lemma 3.4.7, pp. 354–355; BHS19 line 2219.)

One proof proceeds as follows. Use localized H⁰ vanishing between successive rank-one characters for uniqueness of a lifted flag. Apply relative Schlessinger representability to the subfunctor and its tangent injection. For ν=0, period H¹ is exact and the rank-one comparison kills the extension classes in the inductive flag construction.

*Needs:* §5.2; §5.3; DeformationAndDerivedPatchingAlgebra §§2.1–2.5; SchemeAndStackFoundations §§4.3–4.5.

**Checks.**

- For two generic localized lines and ν=0, the required lift splits into two lines; a nonzero Jordan operator has (dim ker,dim coker)=(1,1) and lies outside the splitting clause.

- For repeated parameter 1, the localized module R[1/t]² has at least the distinct flags generated by e₁ and e₂; genericity excludes this failure of uniqueness.

### Examples

For a locally algebraic generic rank-one parameter with an infinitesimal nonsmooth twist, the period comparison is only asserted surjective. When the entire Artinian character is locally algebraic it is an isomorphism. A zero residual weight derivative does not by itself eliminate an infinitesimal derivative.

### Dependencies

§3.4; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §3.9; PadicHodgeTheory §§4.4–4.5, 5.2; §3.3; PadicHodgeTheory §4.5; §3.5; DeformationAndDerivedPatchingAlgebra §§2.2–2.5; DeformationAndDerivedPatchingAlgebra §§2.1–2.5; SchemeAndStackFoundations §§4.3–4.5.

## Layer 6: The double-flag model and Galois components

Glue the localized module to its period lattice. The two flags then meet in X=g̃×_g g̃, whose components and Cartan maps come from the Springer roadmap. Pass from the D_pdR frame to the Galois frame only after the smooth relative dimensions have been recorded. Component detection must see infinitesimal character directions, rather than only closed points.

### 6.1 Robba deformation gluing through the period lattice

For D such that W⁺=W_dR⁺(D) is almost de Rham, with M=D[1/t] and W=W_dR(M) (hence almost de Rham), deformation groupoids satisfy `X_D ~= X_M x_(X_W) X_(W^(+))`. With a fixed localized flag, `X_(D,F) ~= X_(M,F) x_(X_W) X_(W^(+))`; the same identities hold with compatible D_pdR frames, which exist because W is almost de Rham. The flag on D is required only after inverting t, not integrally.

(BHS19 Proposition 3.5.1 and Remark 3.5.2, pp. 355–356; BHS19 line 2256.)

One proof proceeds as follows. Apply coefficient Berger equivalence to reconstruct D from M and a compatible B_dR⁺ lattice. Check finite freeness of the reconstructed module by Artinian reduction and the coefficient equivalence. Form the 2-fibre product including its period identification, then verify essential surjectivity and full faithfulness. For a localized module with almost de Rham period realization, choose the A-free stable period lattice from gap:artinian-almost-de-rham and reconstruct its free Robba lattice using gap:artinian-b-pairs; this is the free-lattice consequence used in subsequent relative representability arguments.

*Needs:* §3.4; §3.2; §2.2; PadicHodgeTheory §4.5; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-b-pairs.

**Checks.**

- Rank one glues one localization and one positive lattice with their common realization; replacing the lattice by t times itself changes D but leaves its localization fixed.

- Over E[ε]/ε² a lattice identification 1+ε differs from 1; the fibre product retains that gluing isomorphism.

- Negative control: over ℚ₃ with n=1, a rank-one D=R_E(δ) whose parameter has Sen weight 1/2 (δ(u)=exp((1/2)log u) on a small open subgroup of units) has D_pdR(W_dR(D))=0, so it is outside the domain and cannot carry a rank-one D_pdR frame; δ=x² has W_dR⁺(D) almost de Rham with period rank one and admits the frame.

### 6.2 Representability of the comparison morphisms

Assume W_dR⁺(D) is almost de Rham as in §6.1 and the localized triangulation admits a locally algebraic parameter δ∈T₀ⁿ. The morphisms X_M→X_W, `X_(M,F) -> X_(W,F)`, `X_D -> X_(W^(+))`, and `X_(D,F) -> X_(W^(+),F)` are relatively prorepresentable; the last two are base changes of the first two. They satisfy the relative Schlessinger fibre-product criterion and have finite-dimensional relative tangent spaces. The character-weight map T̂_δⁿ→t̂₀ is formally smooth of relative dimension n.

The localized triangulation of M admits a locally algebraic parameter (BHS19 line 2305), which makes W and W⁺ almost de Rham, and that parameter lies in T₀ⁿ, the standing assumption of BHS19 from Lemma 3.5.3 on (BHS19 line 2321); finiteness of the relative tangent spaces uses dim H¹(R_E(δ)[1/t])=d for δ∈T₀.

(BHS19 Lemma 3.5.3, Corollary 3.5.4 and Lemma 3.5.5, pp. 356–358; BHS19 line 2322.)

One proof proceeds as follows. Identify relative fibres with deformations equipped with a period isomorphism. Use finite Herr H¹ and compatibility with Artinian fibre products for the relative Schlessinger conditions. Compute character derivatives: the unit-character directions give dn coordinates and the unramified directions give n.

*Needs:* §6.1; §5.1; DeformationAndDerivedPatchingAlgebra §§2.1–2.5; SchemeAndStackFoundations §§4.3–4.5; PhiGammaModulesAndIwasawaCohomology §2.7; §3.1; §5.2.

**Checks.**

- For n=2,d=2, full character dimension 6 minus weight dimension 4 is 2=n.

- For δ=1 the localized H⁰ has dimension 1; the parameter lies outside T₀ and cannot be inserted into the generic finite-relative-tangent argument.

- For n=1 the condition T₀¹ is vacuous, so the weight-1/2 rank-one character of §6.1 satisfies it; it is excluded only by the locally algebraic requirement, since its W_dR has D_pdR=0. The parameter x² satisfies both.

### 6.3 Framed localized deformation dimension

For locally algebraic generic δ, `X^pdR_(M,F)` is prorepresented by a formally smooth complete local E-algebra of dimension d(n²+n(n+1)/2). Adding fixed rank-one graded bases instead gives a smooth rigidified functor of dimension n+dn(n+1)/2; forgetting those bases has relative dimension n. The n graded rescalings must not be counted as dn.

(BHS19 Corollary 3.5.6 and Proposition 3.5.7, pp. 358–359; BHS19 line 2369.)

One proof proceeds as follows. Combine §5.3 with §1.4 and relative representability. Compute the tangent dimension using graded rigidification: compare its n rescalings with the dn²-dimensional period framing torsor. Use generic H⁰ vanishing to remove automorphisms of the rigidified object.

*Needs:* §6.2; §5.3; §1.4.

**Checks.**

- For n=2,d=2, the period-framed dimension is 2(4+3)=14; graded-rigidified dimension is 2+2·3=8, and 8+8−2=14.

- For n=1,d=1, the dimensions are 2 and 2, and adding a period frame then forgetting a graded frame contributes 1−1=0.

### 6.4 The double-flag formal local model

Assume δ locally algebraic generic and W⁺ regular. Set x_pdR=(α⁻¹D_pdR(F_•),α⁻¹HodgeFlag(W⁺),N) in X=g̃×_g g̃. The functor `X^pdR_(W^(+),F)` is represented by `X_hat_(x_pdR)`; `X^pdR_(D,F) -> X_hat_(x_pdR)` is formally smooth of relative dimension dn(n+1)/2. Its completed local ring is a formal power-series algebra of that relative dimension over the completed incidence local ring.

(BHS19 Corollary 3.5.8, pp. 359–360; BHS19 line 2421.)

One proof proceeds as follows. Take the fibre product of the two framed simultaneous-resolution models over the framed matrix model. Apply §6.1 and §5.3 to obtain formal smoothness. Use the dimension computation of the framed localized functor and the complete local smooth structure theorem.

*Needs:* §1.4; §2.4; §6.1; §6.3; SpringerResolutionAndCharacteristicCycles §3.1; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7.

**Checks.**

- For n=2,d=2 the incidence component dimension is 8 and the relative smooth dimension is 6, yielding 14.

- For n=1,d=2, incidence dimension 2 plus relative dimension 2 gives 4; replacing the incidence completion by its zero fibre would lose two weight coordinates.

### 6.5 Component deformation conditions

For w∈(S_n)^Σ define `X^(pdR,w)_(D,F)=X^pdR_(D,F) x_(X_hat) X_hat_w` and similarly for the lattice–flag functor. Let S(x_pdR)={w:x_pdR∈X_w}. Descend the condition after forgetting α; G-equivariance of X_w makes the unframed condition independent of α. Empty components are retained as empty functors, not zero rings declared to be domains.

(BHS19 Corollary 3.5.9, (3.25)–(3.26), Proposition 3.5.10, pp. 360–361; BHS19 line 2449.)

One proof proceeds as follows. Use the imported reduced irreducible components X_w of X. Pull their completed closed immersions back along the local-model map. Descend by the change-of-frame action and check the resulting 2-cartesian square.

*Needs:* §6.4; SpringerResolutionAndCharacteristicCycles §3.5.

The reusable interface has the following properties.

- Impose membership in the specified completed X_w.

- Nonemptiness is equivalent to w∈S(x_pdR).

- Changing α transports the same unframed subfunctor.

- Each component condition is a relatively representable closed immersion.

**Checks.**

- If x_pdR∉X_w, its pullback has no residual object.

- For n=1 there is one permutation and the component condition is the whole functor.

- Conjugating N and both flags by g leaves the descended w-condition unchanged.

- For n=1 the Weyl group has size 1; a component missing the residual point has 0 residual objects and no local domain is asserted.

### 6.6 Normality of the framed component rings

For w∈S(x_pdR), `X^(pdR,w)_(D,F)` is represented by a complete local normal domain of dimension d(n²+n(n+1)/2), formally smooth over `X_hat_(w,x_pdR)` with relative dimension dn(n+1)/2. Cohen–Macaulayness follows from the imported local-model CM theorem and formal smoothness; neither conclusion asserts smoothness of X_w.

(BHS19 Corollary 3.5.11 and its proof, p. 361; Cohen–Macaulayness through Proposition 2.3.3 as used in Corollary 3.7.10, p. 371; BHS19 line 2479.)

One proof proceeds as follows. Use normality and CM of the supplier’s incidence components. Pass to completion using excellence; preserve normality and CM under a power-series extension. Exclude the empty case before applying domain statements.

*Needs:* §6.5; §6.4; SpringerResolutionAndCharacteristicCycles §5.4; SpringerResolutionAndCharacteristicCycles §4.3; DeformationAndDerivedPatchingAlgebra §§1.13–1.14; SchemeAndStackFoundations §§0.17, 0.21; DeformationAndDerivedPatchingAlgebra §§1.13–1.14, 3.1–3.2; SchemeAndStackFoundations §§0.17, 0.21.

**Checks.**

- For n=2,d=2 the component dimension is 14=8+6; the zero functor at a missing component has no residue-E point and is excluded by w∈S.

- A normal singular local domain can have embedding dimension larger than its Krull dimension, so normality supplies no equality of those dimensions.

### 6.7 Weight-graph detection of a component

Let `Theta=(kappa_triangulation,kappa_Hodge):X_(D,F) -> (t x_(t/S) t)^completion_(0,0)`. For w∈S(x_pdR), its restriction to `X^w_(D,F)` factors through the completed graph `T_(w')={(z,(w')^(-1)z)}` if and only if w′=w; the framed version is equivalent. This is scheme-theoretic factorization, including nilpotent Artinian weight directions.

(BHS19 Corollary 3.5.12, pp. 361–362; BHS19 line 2500.)

One proof proceeds as follows. Identify Θ with the two Cartan projections in the double-flag model. Use formal smoothness and faithful flatness to descend the imported formal component-detection criterion. Transport the criterion through the framing torsor.

*Needs:* §6.5; §3.5; SpringerResolutionAndCharacteristicCycles §13.3; SpringerResolutionAndCharacteristicCycles §5.1.

**Checks.**

- For a transposition s and z=(ε,2ε), s⁻¹z=(2ε,ε), which differs from z; on residue points both are (0,0).

- For the cycle w=(123) acting by (wz)_i=z_(w⁻¹i), z=(ε,2ε,3ε) gives w⁻¹z=(2ε,3ε,ε), whereas wz=(3ε,ε,2ε).

### 6.8 Framed Galois component rings

Let r:G_K→GL_n(E) have D=D_r and a generic locally algebraic localized triangulation, with regular W⁺. The framed Galois functor `X_(r,F)` is prorepresented by a reduced equidimensional complete local ring `R_(r,F)` of dimension n²+dn(n+1)/2. Its minimal primes p_w are indexed by S(x_pdR); `R_(r,F)/p_w` is a normal domain representing `X^w_(r,F)`. Its Θ-map factors through T_w and no other weight graph.

(BHS19 Theorem 3.6.2, pp. 362–364; BHS19 line 2567.)

A proof route uses the étale Robba–Galois equivalence and the framed deformation ring of r. Compare the n²-dimensional Galois framing torsor with the dn²-dimensional period framing torsor. Apply §6.6 and the component detection theorem to identify exactly the minimal primes.

*Needs:* §6.6; §6.7; LocalGaloisDeformationRings §1.18; PadicHodgeTheory §4.3; PadicHodgeTheory §§4.4–4.5, 5.2; gap:artinian-b-pairs.

**Checks.**

- For n=2,d=2 the Galois component dimension is 4+6=10, and 10+8=14+4 after adding both framings.

- For n=1,d=2 the dimension is 1+2=3, with one component.

### 6.9 Tangent dimensions and relative-position support

For w∈S(x_pdR), `dim_E T X^w_(r,F)=n^2-dn^2+dn(n+1)/2+dim_E T_(x_pdR) X_w`. If w_x is the relative position of the two flags, then w_x≤w is necessary for w∈S(x_pdR). Sufficiency is asserted at N=0, not for an arbitrary nonzero nilpotent N.

(BHS19 Corollary 3.6.3 and Proposition 3.6.4, pp. 364–365; BHS19 line 2596.)

One proof proceeds as follows. Subtract the period framing dimension and add the Galois framing dimension in the smooth comparison. Use the supplier’s Bruhat support of X_w; at N=0 its zero-fibre components give sufficiency.

*Needs:* §6.8; §6.4; SpringerResolutionAndCharacteristicCycles §3.6; SpringerResolutionAndCharacteristicCycles §7.3.

**Checks.**

- For n=2,d=2 and a smooth incidence point with tangent dimension 8, 4−8+6+8=10.

- For GL₂ at N=0 and equal flags, relative position e permits both e and s; for distinct flags, relative position s excludes e.

### Examples

For n=2,d=1, the framed Galois component dimension is 7. Adding the period frame gives dimension 11, while the incidence component has dimension 4 and the relative smooth dimension is 3. The formula 7+4=4+3+4 checks both frame contributions. At N=0, Bruhat support is sufficient; the same claim is not made for an arbitrary nonzero nilpotent.

### Dependencies

§3.4; §3.2; §2.2; PhiGammaModulesAndIwasawaCohomology §3.9; PadicHodgeTheory §4.5; PadicHodgeTheory §§4.4–4.5, 5.2; §5.1; DeformationAndDerivedPatchingAlgebra §§2.1–2.5; SchemeAndStackFoundations §§4.3–4.5; PhiGammaModulesAndIwasawaCohomology §2.7; §3.1; §5.2; §5.3; §1.4; §2.4; SpringerResolutionAndCharacteristicCycles §3.1; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7; SpringerResolutionAndCharacteristicCycles §3.5; SpringerResolutionAndCharacteristicCycles §5.4; SpringerResolutionAndCharacteristicCycles §4.3; DeformationAndDerivedPatchingAlgebra §§1.13–1.14; SchemeAndStackFoundations §§0.17, 0.21; DeformationAndDerivedPatchingAlgebra §§1.13–1.14, 3.1–3.2; §3.5; SpringerResolutionAndCharacteristicCycles §13.3; SpringerResolutionAndCharacteristicCycles §5.1; LocalGaloisDeformationRings §1.18; PadicHodgeTheory §4.3; SpringerResolutionAndCharacteristicCycles §3.6; SpringerResolutionAndCharacteristicCycles §7.3.

## Layer 7: The analytic trianguline variety near a generic point

The analytic space is defined by reduced closure. At a generic regular-Sen point its completed ring selects one incidence component, even when the displayed parameter no longer gives a saturated integral triangulation. This component identification, rather than a density assertion alone, gives local normality and Cohen–Macaulayness.

### 7.1 A unique flag at generic closure points

For x=(r,δ)∈X_tri with δ∈T₀ⁿ, the localized D_r[1/t] has a unique full triangulation with parameter δ, where algebraic twists are identified after inversion of t. Its period flag is intrinsic. There is no assertion that D_r has a saturated integral triangulation with that exact tuple.

(BHS19 Proposition 3.7.1 and proof, pp. 365–366; BHS19 line 2641.)

One proof proceeds as follows. Apply global triangulation after a proper birational modification on each irreducible component through x. Use specialization and the rank-one localization classification to obtain a localized flag at x. Use generic H⁰ vanishing to prove uniqueness, independent of component and modification.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); PhiGammaModulesAndIwasawaCohomology §§7.6–7.8; PhiGammaModulesAndIwasawaCohomology §7.8; §5.4.

**Checks.**

- Rank one has one localized flag; multiplication by t changes the integral lattice while becoming invertible on the localized line.

- For R[1/t]² with repeated parameter there are distinct e₁ and e₂ lines; the excluded ratio 1 explains the generic hypothesis.

### 7.2 The completed analytic space imposes the localized flag

For a generic x=(r,δ), the map X̂_tri,x→X_r obtained by forgetting δ factors through the closed localized-trianguline condition `X_(r,F)`; both `X_hat_tri,x -> X_(r,F)` and X̂_tri,x→X_r are closed immersions, compatible with ω′ into T̂_δⁿ. The point-completion X_r is the completion of the framed lifting space at r.

(BHS19 Propositions 3.7.2–3.7.3 and their proofs, pp. 366–367; BHS19 line 2660.)

One proof proceeds as follows. Use the supplier’s framed point-completion theorem. Pull the global triangulation to a proper birational modification, normalizing after each Fitting blowup so that the modification is a composite of normal stages, each locally the analytification of a projective birational morphism over an affinoid algebra; the pulled-back flag keeps its properties because each stage maps every component dominantly onto a component. Above the dense saturated locus the closed condition holds. Use reducedness and the injectivity of Ô_(X_tri,x) into the product of the completed rings at chosen points of the modification above each of the finitely many normalization points over x (gap:completed-normalization-injectivity) to descend the defining ideal; a single point upstairs does not suffice at a point with several branches. Recover the parameter from the based uniqueness theorem.

*Needs:* §7.1; §5.4; LocalGaloisDeformationRings §1.18; PhiGammaModulesAndIwasawaCohomology §§7.6–7.8; AdicSpacesPartII R1; RigidAnalyticGeometry §§1.2, 8.1 (gap:completed-normalization-injectivity).

**Checks.**

- At rank one, an infinitesimal unramified twist changes the representation and its forced full parameter together; an independent parameter perturbation is not a point of the closed completion.

- For tR⊂R the localized flag survives while the quotient R/tR is nonprojective; the closed condition concerns localization.

- For the node A=E[[x,y]]/(xy), the normalization map A→E[[x]]×E[[y]] sends y to (0,y) and has kernel 0, whereas the projection to the single branch E[[x]] kills y; descent of the ideal uses the product over all branches.

### 7.3 Sen polynomials and infinitesimal root matching

On X_tri the τ-Sen polynomial of r equals ∏_i(T−wtτδ_i). If the residual weights are distinct, equality of these factorizations over an Artinian local algebra matches the roots by the unique permutation determined over E. Thus if wtδ=w(h) for increasing residual h, the completed Θ-map factors scheme-theoretically through T_w.

(BHS19 Lemma 3.7.4 and Lemmas 3.7.5–3.7.7, pp. 368–370; BHS19 line 2729.)

One proof proceeds as follows. Prove the Sen identity on the dense saturated locus using the exact period flag, then extend it by reducedness. For each residual distinct pair, its difference is a unit in A; evaluate the factorized polynomial at a root and remove all unit factors. Combine matching with §3.5 and the fixed Hodge jumps.

*Needs:* §7.2; §3.5; §2.3; PadicHodgeTheory §4.4.

**Checks.**

- Over E[ε]/ε², roots 0+ε and 2+3ε reduce to distinct 0 and 2, fixing their matching; their polynomial is X²−(2+4ε)X+2ε.

- With repeated residual roots 0,0, the polynomial X² is also (X−ε)(X+ε), so simple residual roots are essential.

### 7.4 The trianguline variety local-model theorem

Let x=(r,δ)∈X_tri with δ locally algebraic generic and with distinct labelled Sen weights. Let w satisfy wtδ=w(h) for increasing h. Then `X_hat_tri,x ~= X^w_(r,F)`. Adding a D_pdR frame gives `X^(pdR,w)_(r,F) -> X^w_(r,F)` of relative dimension dn². Forgetting the Galois frame gives `X^(pdR,w)_(r,F) -> X^(pdR,w)_(D,F)` of relative dimension n², and the latter maps formally smoothly to `X_hat_(w,x_pdR)` with relative dimension dn(n+1)/2. Thus R_tri[[u₁,…,u_dn²]] is noncanonically isomorphic to `O_hat_(X_w,x_pdR)[[v_1,...,v_(n^2+dn(n+1)/2)]]`, with the compatible Cartan/character maps furnished by this diagram.

(BHS19 Corollary 3.7.8 and diagram (3.33), pp. 370–371; BHS19 line 2838.)

One proof proceeds as follows. The closed immersion §7.2 lies in the union of minimal components of the same dimension. Use the root-matching weight graph and §6.7 to select only the w-component. Reducedness and equidimensionality remove any additional ideal on that component. Base-change the double-flag comparison, then forget the independent n²-dimensional Galois frame. Retain both torsors and the Cartan maps: the total smooth dimension on the incidence side is n²+dn(n+1)/2.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); §7.3; §6.8; §6.4; §6.7; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7.

**Checks.**

- For n=2,d=2 the two sides have dimensions 10+8=8+(4+6)=18.

- For n=1,d=2 the dimensions are 3+2=2+(1+2)=5; period and Galois framings cannot both be counted as dn².

### 7.5 Normality and Cohen–Macaulayness at generic algebraic points

Under §7.4, X_tri is normal, locally irreducible and Cohen–Macaulay in a neighbourhood of x. The conclusion includes de Rham points and applies under the weaker locally algebraic generic, regular-Sen hypotheses of Remark 3.7.9. Smoothness requires a separate condition on the incidence component.

(BHS19 Remark 3.7.9, pp. 370–371; Corollary 3.7.10, p. 371; BHS19 line 2879.)

One proof proceeds as follows. Apply the normal and CM local component theorem to the completed ring. Use excellence of the rigid local ring and descent of normality and CM from its completion. Shrink an affinoid neighbourhood using openness of the resulting loci.

*Needs:* §7.4; §6.6; AdicSpacesPartII R1; RigidAnalyticGeometry §§1.2, 8.1 (gap:rigid-normal-cm-openness); DeformationAndDerivedPatchingAlgebra §§1.13–1.14, 3.1–3.2; SchemeAndStackFoundations §§0.17, 0.21.

**Checks.**

- For n=1 the local ring has dimension d+1 and is smooth, hence normal and Cohen–Macaulay; for n=2,d=1 the dimension is 7.

- At a normal singular incidence point, tangent dimension exceeds Krull dimension; the comparison preserves this defect rather than asserting smoothness.

### Examples

A closure point can have a unique localized flag with the displayed parameter and still fail to have a saturated integral flag of that parameter. At a generic regular-Sen point the completed trianguline variety is one normal component, not the union of all components of the localized deformation condition.

### Dependencies

CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); PhiGammaModulesAndIwasawaCohomology §§7.6–7.8; PhiGammaModulesAndIwasawaCohomology §7.8; §5.4; LocalGaloisDeformationRings §1.18; AdicSpacesPartII R1; RigidAnalyticGeometry §§1.2, 8.1 (gap:completed-normalization-injectivity); RigidAnalyticGeometry §§1.2, 8.1 (gap:rigid-normal-cm-openness); §3.5; §2.3; PadicHodgeTheory §4.4; §6.8; §6.4; §6.7; DeformationAndDerivedPatchingAlgebra §§1.9, 1.11, 2.7; §6.6; DeformationAndDerivedPatchingAlgebra §§1.13–1.14, 3.1–3.2; SchemeAndStackFoundations §§0.17, 0.21.

## Layer 8: Flatness, accumulation and companion geometry

Flatness comes from the Cartan map. Crystalline accumulation additionally needs a saturation argument with quantitative weight gaps and bounded uniformizer valuations. The companion criterion fixes the ordered Weil–Deligne refinement of a crystabelline representation and varies only its weight permutation; it is a local assertion about this analytic space.

### 8.1 Flatness of character and weight projections

At x satisfying §7.4, ω′:X_tri→Tⁿ is flat in a neighbourhood of x. Consequently its restriction-of-characters composition ω:X_tri→Wⁿ is flat there. No smoothness of either morphism is asserted.

(BHS19 Proposition 4.1.1, pp. 371–372; BHS19 line 2897.)

One proof proceeds as follows. Add the period frame and use the cartesian comparison with the first Cartan map on X_w. Import flatness of that Cartan map at every point of every fibre; descend flatness by the smooth faithfully flat frame maps and pass from completed to rigid local rings by faithful flatness of completion. Spread flatness at x to an affinoid neighbourhood. Use the smooth projection Tⁿ→Wⁿ of relative dimension n.

*Needs:* §7.4; SpringerResolutionAndCharacteristicCycles §4.4; §6.2; PhiGammaModulesAndIwasawaCohomology §2.7; RigidAnalyticGeometry §§7.3, 8.1 (gap:rigid-flat-openness).

**Checks.**

- For n=2,d=1 the trianguline dimension is 7, full-character dimension 4 and unit-weight dimension 2, giving fibre dimensions 3 and 5.

- The flat map E[t]→E[x,y], t↦xy, has a singular zero-product fibre at t=0; a flat projection with such a fibre need not be smooth.

### 8.2 Crystalline accumulation property

For x=(r,δ) whose unit restriction ω(x)=`delta|_((O_K^*)^n)` is an algebraic character, the accumulation property means that for every C>0 the set of crystalline strictly dominant noncritical points x′=(r′,δ′), with pairwise distinct Frobenius eigenvalues and algebraic unit restriction ω(x′)=δ_(k′), the character sending u∈O_K^× in the i-th factor to ∏_τ τ(u)^(k′_(τ,i)), whose integers satisfy `k'_(tau,1)>...>k'_(tau,n)` and `k'_(tau,i)-k'_(tau,i+1)>C`, accumulates at x: there is a neighbourhood basis at x on each member of which this set is Zariski dense. The k′ are the parameter weights in decreasing order; the h used for local-model indexing are the same spectrum sorted increasingly.

(BHS19 Definition 4.1.3, p. 373; BHS19 line 2939; δ_k as in BHSsmooth17 §2.1, p. 7; BHSsmooth17 line 255.)

One proof proceeds as follows. Use the imported notion of crystalline representations and the noncritical refinement condition. Use the supplier’s rigid accumulation convention: Zariski density on a neighbourhood basis, not mere existence of a converging sequence.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); LocalGaloisDeformationRings §3.10.

The reusable interface has the following properties.

- Assert density for every C>0 on a neighbourhood basis at x.

- Pass to smaller admissible neighbourhoods of x.

- Obtain density with the stated adjacent-weight lower bound.

**Checks.**

- Density for C=1 alone does not satisfy the definition.

- Density in one distant component cannot certify accumulation at x.

- Crystalline points with repeated weights fail the strictly dominant condition.

- For K=ℚₚ, choose weights (a+(p−1)p^m,b−(p−1)p^m): their gap tends to +∞ as an ordinary integer while both weights converge p-adically to (a,b); at p=2 the factor p−1 is 1.

### 8.3 Large weight gaps force saturated crystalline refinements

Put e=[K:K₀] and normalize v_p(p)=1. At every point x=(r,δ) of X_tri, v_p((δ₁⋯δ_i)(ϖ_K))≥0 for 1≤i≤n. Let x satisfy δ_i(u)=∏_τ `tau(u)^(k_(tau,i))` for every u∈𝒪_K× and 1≤i≤n, with integers `k_(tau,i)`. If `k_(tau,i)-k_(tau,i+1)>e*v_p((delta_1...delta_i)(varpi_K))` for every τ and 1≤i<n, then `k_(tau,1)>...>k_(tau,n)` at every τ, the point is saturated and r is semistable. If also δ∈T_regⁿ, r is crystalline, the parameter is strictly dominant and the refinement is noncritical. No dominance of k is assumed: it follows from the prefix bound and the gap inequalities. This result uses the decreasing parameter-weight convention, not the increasing sorting h of the local model.

(BHSsmooth17 Lemma 2.10 and proof, author PDF p. 15 (Lemma 3.12 in arXiv:1510.01222v1); BHSsmooth17 lines 617–656.)

One proof proceeds as follows. First the prefix bound: on U_tri the parameter δ is that of a saturated triangulation of the étale Robba module of r, so R(δ₁⋯δ_i) is a saturated rank-one submodule of its i-th exterior power and has slope ≥0, that is v_p((δ₁⋯δ_i)(ϖ_K))≥0. The locus of X_tri where `|(delta_1...delta_i)(varpi_K)|>1` is an admissible open contained in the complement of U_tri; that complement is Zariski closed of dimension less than dim X_tri in the reduced equidimensional X_tri, while a nonempty admissible open has full local dimension, so the locus is empty. Next, the gap inequalities and the prefix bound give `k_(tau,i)-k_(tau,i+1)>0`. Use the specialization theorem to obtain a saturated parameter δ′ with `delta'_i=delta_i z^(k_(w^(-1)(i))-k_i)` for some w=(w_τ)∈(Sₙ)^Σ. The slope bound for δ′ gives `e*v_p((delta_1...delta_i)(varpi_K))>=sum_(j<=i) sum_tau (k_(tau,j)-k_(tau,w_tau^(-1)(j)))`. Induct on i: if w_τ⁻¹ fixes 1,…,i−1 for all τ, every summand `k_(tau,i)-k_(tau,w_tau^(-1)(i))` is nonnegative by strict dominance and a nonzero one is at least `k_(tau,i)-k_(tau,i+1)`, contradicting the gap bound; hence w=1 and δ′=δ. The comparison of a sum over embeddings with a single gap needs every summand nonnegative, which the prefix bound supplies; without it the induction step is incomplete. With δ′=δ apply the semistability contract to the saturated triangulation, whose parameters have the algebraic unit restrictions z^(k_i) with strictly decreasing k. The regular-character exclusions eliminate the Frobenius ratios permitting nonzero monodromy, so semistability becomes crystallinity and gives the stated noncriticality.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); RigidAnalyticGeometry §§1.2, 7.3; AdicSpacesPartII R1.9; PhiGammaModulesAndIwasawaCohomology §7.8; PadicHodgeTheory §5.2; PadicHodgeTheory §§4.4–4.5, 5.2; gap:dominant-trianguline-semistability.

**Checks.**

- For n=1 the prefix bound is the equality v_p(δ₁(ϖ_K))=0 of an étale rank-one module; the unramified character with uniformizer value p has valuation 1 and is not a point of X_tri.

- The arithmetic data d=2, e=1, n=2, weights (0,2) at both embeddings and prefix valuation −3 satisfy −2>−3 at each embedding, and with w=s at both embeddings the slope inequality −3≥(0−2)+(0−2)=−4 also holds, so the induction step alone does not force w=1. The prefix bound excludes valuation −3, so these data occur at no point of X_tri.

- For e=2, prefix slope 1 and decreasing weights (4,1), the required inequality is 3>2; equality gap 2 would fail.

- At prefix valuation 0 the gap condition reads k_(τ,i)>k_(τ,i+1); the nondominant weights (0,2) fail it at every point of X_tri, so the hypothesis forces strict dominance rather than assuming it.

- A nontrivial ramified finite-order rank-one character has derivative weight 0 and no adjacent inequality, but need not be semistable over K. It is excluded because its unit restriction is not the algebraic character 1; integrality of derivatives alone is insufficient.

### 8.4 Accumulation at generic points with algebraic unit restriction

A point x satisfying §7.4 whose restriction `delta|_((O_K^*)^n)` is algebraic has the accumulation property of §8.2. This uses the crystalline density theorem on the regular triangulation locus in addition to flatness; it does not follow from flatness alone.

(BHS19 Proposition 4.1.4, pp. 373–374; BHS19 line 2946; BHSsmooth17 Lemma 2.10 and proof, author PDF pp. 15–16; first half of Proposition 2.12, pp. 16–17; BHSsmooth17 line 617.)

One proof proceeds as follows. Choose a flat affinoid neighbourhood of x whose weight image is an admissible open of Wⁿ (gap:rigid-flat-openness). Use density of U_tri, local irreducibility (§7.5) and openness of the normal locus (gap:rigid-normal-cm-openness) as in BHS19 Proposition 4.1.4 to reduce to points of the regular locus whose unit restriction is algebraic; retain the algebraic-centre hypothesis in this reduction. On each chosen affinoid the finitely many prefix uniformizer valuations are bounded. At each such reduced point, use a local product chart for the smooth weight map and the accumulation of algebraic weights with arbitrarily large decreasing gaps at that centre in Wⁿ (gap:general-character-spaces). Apply §8.3 and the regular-character condition to obtain crystalline noncritical Frobenius-distinct points. Use the smooth weight map on U_tri and local irreducibility to obtain density in a neighbourhood basis, for every prescribed gap bound.

*Needs:* §8.1; §8.2; CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); §8.3; §7.5; PhiGammaModulesAndIwasawaCohomology §2.7 (gap:general-character-spaces); AdicSpacesPartII R1; RigidAnalyticGeometry §§1.2, 8.1 (gap:rigid-normal-cm-openness); RigidAnalyticGeometry §§7.3, 8.1 (gap:rigid-flat-openness).

**Checks.**

- Taking weights (a+(p−1)p^m,b−(p−1)p^m) gives gap a−b+2(p−1)p^m>C for large m, while their p-adic distance to (a,b) tends to 0.

- A disjoint component carrying a dense crystalline subset has empty intersection with a neighbourhood of x on another component; density must be local at x.

### 8.5 Tangent bounds and smoothness through Schubert geometry

For a de Rham generic regular point, dim T_x X_tri=dim X_tri−dn²+dim `T_(x_pdR) X_w`. With w_x the relative position and d_u=codim t^u, this is at most `dim X_tri-d_(w w_x^(-1))+ell(w_x w_0)+dim T_(pi(x_pdR)) U_bar_w-dn(n-1)`. Smoothness of X_tri at x is equivalent to smoothness of X_w there. It follows when Ū_w is smooth there and `d_(w w_x^(-1))=ell(w)-ell(w_x)`.

(BHS19 Proposition 4.1.5 and Remark 4.1.6, pp. 373–375; BHS19 line 2962.)

One proof proceeds as follows. Apply the formal smooth tangent-dimension identity to the local-model diagram. Insert the supplier’s tangent estimate and smoothness criterion, using the same ordered flag convention. Keep the conjectural general equality of the source separate from this proved upper bound.

*Needs:* §7.4; §6.9; SpringerResolutionAndCharacteristicCycles §13.4; SpringerResolutionAndCharacteristicCycles §13.5.

**Checks.**

- For w=w₀ the bound becomes dim `X_tri-d_(w_x w_0)+ell(w_x w_0)`; a product of distinct simple reflections gives the stated smooth case.

- For n=2,d=1,w=s,w_x=e, d_s=1 and ℓ(s)=1, so the extremal bound is 7−1+1=7.

- For n=3,d=1,w=w₀,w_x=e, d_(w₀)=1 and ℓ(w₀)=3, so the bound is 15−1+3=17; equality of length and fixed-space codimension is not automatic.

### 8.6 Refined crystabelline deformation space and its embedding

Fix strictly dominant labelled weights k (equivalently increasing Hodge–Tate weights h with k=w₀(h)) and an abelian inertial type τ: an n-element multiset of finite-order characters of O_K×, read as characters of I_K through Art_K, with distinct members τ₁,…,τ_s of multiplicities m₁,…,m_s, and let K′/K be a finite abelian extension whose inertia subgroup is killed by every τ_j. Let `X^(k,tau-cr)_(r_bar) subset X_(r_bar)` be the smooth rigid space of framed lifts of r̄ that are crystalline over K′ with labelled Hodge–Tate weights k and inertial type τ: the crystabelline lifts of type (k,τ). For trivial τ these are the crystalline lifts of weight k. Let T_τ⊂Tⁿ be the closed subspace of ordered n-tuples χ=(χ₁,…,χ_n) of smooth characters of K× whose multiset of restrictions to O_K× is τ; a uniformizer identifies each of its finitely many components with (G_m)ⁿ, S_n permutes the coordinates, and `T_tau/S_n = prod_j (G_m)^(m_j)/S_(m_j)`. The refined space `X_tilde^(k,tau-cr)_(r_bar)=X^(k,tau-cr)_(r_bar) x_(T_tau/S_n) T_tau` parametrizes pairs (r,χ) with χ a refinement of r: an ordering of the n characters of W_K with `WD(r)^(F-ss) ~= sum_i chi_i o Art_K^(-1)`. The map to T_τ/S_n records, for each j, the characteristic polynomial of Art_K(ϖ_K) on the τ_j-isotypic part of the family of Weil–Deligne representations; for trivial τ it is the characteristic polynomial of the linearized crystalline Frobenius `phi^([K_0:Q_p])` on D_cris, and χ_i=unr(φ_i) for its eigenvalues φ_i, so that χ_i∘Art_K⁻¹ takes the value φ_i on geometric Frobenius. The refined space is reduced and equidimensional of the dimension of `X^(k,tau-cr)_(r_bar)`. Let P→`X^(k,tau-cr)_(r_bar)` be the period-frame torsor, the `Res_(K'_0/Q_p)GL_n`-torsor of bases of the family D of period modules over `K'_0 tensor_(Q_p) O_X`; the matrices of Frobenius and of the descent data together with the Hodge flag define the period morphism from P to the smooth rigid space M_τ of framed filtered φ-modules with descent data of type (k,τ), and this morphism is smooth of relative dimension n², its fibres being the representation frames. For trivial τ, M_τ is `(Res_(K_0/Q_p)GL_n x Flag)^rig`. The locus of the refined space where the χ_i are pairwise distinct is smooth, Zariski open and dense; on its dense open part W̃ where χ_iχ_j⁻¹∉{1,|·|_K} for i≠j, the refinement defines a flag F_• of the family D_dR by locally free `K tensor O`-submodules, the refinement flag, and the Hodge flag in a basis adapted to F_• defines a smooth Hodge-flag morphism h̃:P_B→(G/B)^rig on the Res_(K/ℚₚ)B-torsor P_B→W̃ of adapted period frames. The Bruhat cell of h̃ relative to the standard flag is constant on the fibres of P_B→W̃, so the relative position of the Hodge flag with respect to F_• is defined on W̃ and each locus of fixed relative position is locally closed there. The morphism `iota_(k,tau):(r,chi) |-> (r,z^(k) chi)` is a closed immersion `X_tilde^(k,tau-cr)_(r_bar) -> X_tri(r_bar)`, and the noncritical regular locus, where the relative position is w₀ and `z^(k_i-k_j) chi_i chi_j^(-1)` lies in T_reg for i≠j, maps into U_tri.

r̄:G_K→GL_n(k_E) is fixed, k is strictly dominant at every embedding, τ is a finite multiset of finite-order characters, and E contains their values and the embeddings of K′₀. Kisin’s potentially crystalline deformation spaces of fixed weight and type are imported from LocalGaloisDeformationRings §§3.4 and 3.10; their finite-projective families of filtered φ-modules with descent data and the specialization comparisons come from LocalGaloisDeformationRings §3.5 with inertia type τ and L=K′ (trivial type and L=K in the crystalline case), and §3.6 supplies the deformation theory of those filtered modules together with the formal smoothness of framed lifts over it. The Weil–Deligne representation and its inertial type are PadicHodgeTheory §5.3’s; its arithmetic Weil eigenvalue on the χ_i-line is χ_i(ϖ_K)⁻¹.

(BHSsmooth17 §2.2, (2.4)–(2.9), Lemmas 2.2–2.4 and Corollary 2.5, author PDF pp. 8–12; BHSsmooth17 line 357; BHS19 Proof of Theorem 4.2.3, (4.2)–(4.5), and Remark 4.2.4, pp. 376–377; BHS19 lines 3040, 3098; HartlHellmann Theorem 8.15, Corollary 8.16 and Proposition 8.17, pp. 43–44, and (9.1), p. 45; HartlHellmann lines 2085, 2137, 2207.)

A proof route starts from the smooth framed crystabelline deformation space X of type (k,τ) and the finite-projective family (D,Φ,ρ,Fil) over it: D a `K'_0 tensor_(Q_p) O_X`-module of rank n with Frobenius Φ, descent data ρ of Gal(K′/K), and a descent-stable Hodge filtration on D⊗_(K′₀)K′ whose descent to the K⊗O_X-module D_dR is the family of Hodge flags. Form the period-frame torsor P→X, of relative dimension [K′₀:ℚₚ]n². In a basis, Φ, the ρ(g) and the Hodge flag are a point of M_τ, the space of matrices of Φ and of the descent data in `Res_(K'_0/Q_p)GL_n` satisfying the semilinear cocycle and commutation relations and carrying a descent-stable flag of the prescribed jumps; M_τ is smooth: the descent data of type τ form a single orbit, each τ_j-isotypic part descending after a twist by a character extending τ_j to a K₀⊗E-module of rank m_j whose Frobenius is a point of `Res_(K_0/Q_p)GL_(m_j)`, and the descent-stable flags of fixed jumps form a flag variety of the descended module. The period morphism P→M_τ is smooth of relative dimension n²: at each point its completed local ring pro-represents framed lifts of r with a lifted basis of their period module, which the Artinian Fontaine equivalence of LocalGaloisDeformationRings §3.6 identifies with lifts of the framed filtered module together with a representation frame, and the frame is unconstrained. For trivial τ this is the base change along `X^(adm) subset Res_(K_0/Q_p)GL_n x Flag` of the GL_n-torsor of trivializations of the universal crystalline family over the admissible quotient stack, which is Kisin’s space (HartlHellmann Corollary 8.16 and Proposition 8.17). The morphism X→T_τ/S_n is open because P→X is open and surjective and the composite P→M_τ→T_τ/S_n is open, the second map being the characteristic polynomial of the linearized Frobenius on each isotypic part (HartlHellmann (9.1) for trivial τ); the refined space is then reduced because T_τ→T_τ/S_n is finite flat and generically étale (BHSsmooth17 Lemmas 2.2–2.3). Pull the refined space back to P̃=P×_X X̃. Distinctness of the χ_i, noncriticality and regularity of the ratios are inverse images under the smooth morphism P̃→M_τ×_(T_τ/S_n)T_τ of Zariski-open dense subsets, hence smooth, Zariski-open and dense in P̃, and they descend to X̃ along the Zariski-locally trivial torsor. On W̃ the refinement flag of D, the Φ- and ρ-stable flag with `WD(F_i/F_(i-1)) = chi_i o Art_K^(-1)`, is unique because the χ_i are distinct, and descends to the flag F_• of D_dR. Let P_B→W̃ be the Res_(K/ℚₚ)B-torsor of bases of D_dR adapted to F_•, and h̃ the Hodge flag in such a basis. Then h̃ is formally smooth at every point: a lift of the Hodge flag in an adapted basis, together with any lift of (D,Φ,ρ,F_•), which is a direct sum of rank-one objects on W̃, of the adapted basis and of the representation frame, is a crystabelline lift, because an Artinian deformation of a weakly admissible filtered module is an iterated extension of that module and weak admissibility is closed under extensions. Changing the adapted basis moves h̃ inside its Bruhat cell, so the relative position descends to W̃. At noncritical regular points the dictionary of PadicHodgeTheory §5.2 between filtered φ-modules with finite descent and Robba modules turns the ordered refinement into a triangulation with parameter z^(k)χ, so those points map into U_tri; reducedness and density then give `iota_(k,tau)` into X_tri, a closed immersion because `X^(k,tau-cr)_(r_bar) -> X_(r_bar)` and T_τ→Tⁿ are closed immersions.

*Needs:* LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRings §3.10; LocalGaloisDeformationRings §3.5; LocalGaloisDeformationRings §3.6; PadicHodgeTheory §5.2; PadicHodgeTheory §5.3; SpringerResolutionAndCharacteristicCycles §1.1; CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); PhiGammaModulesAndIwasawaCohomology §2.7; AdicSpacesPartII R1; RigidAnalyticGeometry §§7.3, 8.1 (gap:rigid-flat-openness).

The reusable interface has the following properties.

- The fibre product of the type-(k,τ) crystabelline deformation space with T_τ over T_τ/S_n, given by the characteristic polynomials of Art_K(ϖ_K) on the isotypic parts of the Weil–Deligne family.

- Forgetting the ordering is finite and surjective, and étale over the locus of distinct characters.

- The period-frame torsor P and the smooth period morphism P→M_τ of relative dimension n², whose fibres are the representation frames; it is not a morphism from the deformation space itself.

- On W̃, the adapted-frame torsor P_B and the smooth Hodge-flag morphism h̃ on it; the relative position of the Hodge flag with respect to the refinement flag does not depend on the adapted basis.

- `iota_(k,tau)` is a closed immersion into X_tri(r̄) whose composite with ω′ is `(r,chi) |-> z^(k) chi`.

- A point with distinct characters, noncritical refinement and regular ratios maps into U_tri.

**Checks.**

- For n=1 and trivial τ the refined space equals the crystalline space and ι sends r to `(r,z^(k) unr(phi))` with φ its Frobenius eigenvalue.

- In the unramified rank-one weight-zero family with arithmetic Frobenius 1+T, the imported period family has crystalline Frobenius (1+T)⁻¹, so its specialization at T=ε in E[ε]/ε² is 1−ε; reading 1+T as the crystalline eigenvalue would contradict the geometric normalization of Art_K in the Conventions.

- For n=1, K/ℚₚ unramified quadratic, k=0 and trivial τ, the crystalline space is the one-dimensional space of unramified characters while `Res_(K_0/Q_p)G_m` has dimension 2, so no morphism from the crystalline space itself to it is smooth; the period-frame torsor has dimension 1+2=3 and the period morphism from it is smooth of relative dimension 1=n². In a basis the Frobenius has coordinates (a,b) with only ab the crystalline eigenvalue, and the basis change by a unit (u₁,u₂) replaces (a,b) by (au₂/u₁,bu₁/u₂).

- For n=1 and a ramified finite-order character τ₁ of O_K×, the type-τ₁ space of weight 0 is the one-dimensional space of characters χ of K× with χ|O_K×=τ₁, T_τ is one copy of G_m, the refined space equals the type space, and ι sends χ to (χ,χ); the crystalline lifts of the same residual character form a different type space.

- For n=2 and τ consisting of two distinct characters, T_τ has two components exchanged by S₂ and the ordered-root cover is étale of degree two everywhere; for τ=(τ₁,τ₁) it is the ordered-root cover of the crystalline case twisted by τ₁, ramified along the diagonal.

- For n=2 and a point with distinct characters χ₁≠χ₂, the fibre over r consists of exactly the two points (χ₁,χ₂) and (χ₂,χ₁).

- At a point with χ₁=χ₂ the fibre has one underlying point and forgetting the ordering is not étale there; its ordered-root scheme fibre has length two; such points lie outside the smooth locus of distinct characters.

- A critical refinement still gives a point of X_tri through ι, but not a point of U_tri: `z^(k) chi` is not a parameter of a triangulation of r.

- For n=1 the ordered-root cover is the identity; for a transposition the two distinct ordered characters are exchanged.

### 8.7 Generic crystabelline companion points

Let r:G_K→GL_n(E) be crystabelline with distinct labelled Hodge–Tate weights h, increasing at each embedding, and let χ=(χ₁,…,χ_n) be a refinement of r as in §8.6, an ordering of the n smooth characters of K× with `WD(r) ~= sum_i chi_i o Art_K^(-1)`, assumed pairwise distinct with χ_iχ_j⁻¹≠|·|_K for i≠j. Let w_x∈(S_n)^Σ be the relative position of the Hodge flag of D_dR(r) with respect to the refinement flag F_• of §8.6. Put `x_w=(r,z^(w(h)) chi)` for w∈(S_n)^Σ, with the same ordered χ. Then x_w∈X_tri if and only if w_x≤w in product Bruhat order. Such algebraic changes of parameter with fixed r are the companion points in this statement. For crystalline r with linearized Frobenius eigenvalues φ_i and χ_i=unr(φ_i), the refinement is an ordering of the φ_i and the hypothesis reads φ_iφ_j⁻¹∉{1,p^[K₀:ℚₚ]}. In the source’s formulation, r is de Rham, x=(r,z^(w₀(h))χ) has a locally algebraic parameter δ with δ_i/δ_j and εδ_i/δ_j nonalgebraic for i≠j, and the Sen weights are distinct at every embedding; the nonalgebraicity of δ_i/δ_j is the distinctness of χ_i and χ_j, and that of εδ_i/δ_j is χ_jχ_i⁻¹≠|·|_K.

(BHS19 Theorem 4.2.3 and its proof, pp. 375–377, Remark 4.2.4, p. 377, and Remark 3.7.9, p. 372; BHS19 lines 3040, 3098, 2850.)

One proof proceeds as follows. Necessity follows from the local-model support inequality at the point x_w, which satisfies the hypotheses of §6.9 and §7.4 when it lies in X_tri. For sufficiency use the refined crystabelline space §8.6 of type τ the multiset of unit restrictions of the χ_i and weight k=w₀(h): on the adapted-frame torsor P_B the Hodge-flag morphism h̃ is smooth, hence open, so the preimage of the closure of the Bruhat cell of w is the closure of the preimage of the cell; both are stable under the torsor group and the torsor map is open and surjective, so in W̃ the closure of the locus of relative position w is the locus of relative position ≤w. The maps `iota_(h,w):(r_y,chi_y) |-> (r_y,z^(w(h))chi_y)` send the locus of relative position exactly w into U_tri by the finite-descent dictionary, the triangulation induced by the refinement flag having parameter `z^(w(h)) chi_y` there, hence its closure into the closed subspace X_tri, and the given point lies in that closure exactly when w_x≤w. Keep the refinement fixed while varying w; do not identify this criterion with the global companion theorem of BHS §5.

*Needs:* §6.9; §7.4; LocalGaloisDeformationRings §3.6; LocalGaloisDeformationRings §3.10; PadicHodgeTheory §5.2; PadicHodgeTheory §5.3; SpringerResolutionAndCharacteristicCycles §3.6; §8.6.

**Checks.**

- For S₂ and w_x=e, both e and s lie above it; for w_x=s only s lies above it. For weights (0,2), a noncritical first Frobenius line is different from Fil⁰ and gives w_x=s; the split weight-zero Frobenius line equals Fil⁰ and gives w_x=e (BHS19 Remark 4.1.6 and Theorem 4.2.3, pp. 374–376; BHS19 lines 2991, 3047).

- For S₃, s₁≤s₁s₂ but s₂ is not ≤s₁, distinguishing product Bruhat order from an arbitrary enumeration.

- For n=1, h=0 and a ramified finite-order character χ, the refinement is χ itself, w_x=e=w, and x_e=(χ,χ) is the unique point of X_tri above χ; a statement restricted to crystalline r omits this point by hypothesis alone.

- Twisting a generic crystalline r by a ramified finite-order character ψ of K× replaces the refinement (unr(φ_i))_i by (unr(φ_i)ψ)_i and leaves every ratio χ_iχ_j⁻¹, the refinement flag and the Hodge flag unchanged, so for n=2 the twisted point has two companions when w_x=e and one when w_x=s, exactly as before twisting.

### Examples

For a rank-two prefix valuation b and ramification index e, a positive adjacent gap greater than eb satisfies the sufficient saturation bound; equality does not. The density proof chooses gaps exceeding both a prescribed C and the bound on the chosen affinoid. For GL₂, product Bruhat order is the two-element order, so relative position 1 permits both weight permutations, while a noncritical refinement has relative position w₀ and permits only the dominant permutation.

### Dependencies

§7.4; SpringerResolutionAndCharacteristicCycles §4.4; §6.2; CompletedCohomologyAndLocalGlobalCompatibility §5.2a (gap:unrestricted-trianguline-variety); LocalGaloisDeformationRings §3.10; RigidAnalyticGeometry §§1.2, 7.3; AdicSpacesPartII R1.9; PhiGammaModulesAndIwasawaCohomology §7.8; PadicHodgeTheory §5.2; PadicHodgeTheory §§4.4–4.5, 5.2; §7.5; PhiGammaModulesAndIwasawaCohomology §2.7 (gap:general-character-spaces); AdicSpacesPartII R1; RigidAnalyticGeometry §§1.2, 8.1 (gap:rigid-normal-cm-openness); RigidAnalyticGeometry §§7.3, 8.1 (gap:rigid-flat-openness); §6.9; SpringerResolutionAndCharacteristicCycles §13.4; SpringerResolutionAndCharacteristicCycles §13.5; LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRings §3.5; LocalGaloisDeformationRings §3.6; PadicHodgeTheory §5.3; SpringerResolutionAndCharacteristicCycles §1.1; SpringerResolutionAndCharacteristicCycles §3.6.

## Layer 9: Local trianguline cycles and the crystalline multiplicity formula

There are two cycle transfers: first fix logarithmic weights, then fix the remaining unramified character coordinates. The general multiplicity problem lives in a free abelian cycle group and is a conjecture. The crystalline theorem constructs effective cycles; effectivity is not silently inserted into the general formulation. The signed-cycle uniqueness argument uses gap:all-constituent-triangularity, including inducing families outside the locally algebraic generic locus.

### 9.1 Transfer of local-model cycles to Galois weight fibres

For a generic r with integral regular Sen weights, transfer the supplier’s top cycles of the Steinberg zero fibre to cycles Z_v^wt on the fixed logarithmic-weight completed fibre (equivalently, the fixed formal unit-character fibre) of Spf R_r, using the framed smooth comparison and completion cycle map. Define C_v^wt=Σ_u `a_(v,u) Z_u^wt` using the imported simple-module transition matrix. Their ambient codimension is dn(n+1)/2. The transfer is independent of the period frame and of algebraic twisting of the localized parameters.

(BHS19 §4.3, (4.6)–(4.8) and Remark 4.3.1, pp. 377–380; BHS19 line 3079.)

One proof proceeds as follows. Identify the completed logarithmic-weight fibre with the completed unit-character fibre by the étaleness of the logarithmic derivative on the unit character space (gap:general-character-spaces). Pull cycles through the formally smooth diagram with its fixed relative dimensions. Use the imported completion formula for generic lengths, then descend through the period frame. Check equivariance and algebraic-twist invariance before declaring the resulting cycles intrinsic.

*Needs:* §7.4; SpringerResolutionAndCharacteristicCycles §7.1; SpringerResolutionAndCharacteristicCycles §7.2; SpringerResolutionAndCharacteristicCycles §11.4; SpringerResolutionAndCharacteristicCycles §14.1; SpringerResolutionAndCharacteristicCycles §14.2; PhiGammaModulesAndIwasawaCohomology §2.7 (gap:general-character-spaces); `Module.length`; `AlgebraicGeometry.AlgebraicCycle`.

The reusable interface has the following properties.

- Transfer top-dimensional zero-fibre cycles through the specified completed smooth maps.

- Apply the simple-module transition coefficients to the transferred components.

- A different D_pdR frame gives the same cycle on Spf R_r.

- The cycles lie in codimension dn(n+1)/2 of the framed Galois deformation ring.

**Checks.**

- Weight transfer has codimension d in the n=1 ambient framed ring.

- Replacing δ by an algebraic tuple changes neither the fixed unit weight of r nor the transferred intrinsic cycles.

- For n=2,d=1, the ambient dimension is 8 and the weight-fibre dimension is 5, not 3.

- At n=1,d=2, ambient dimension 3 minus weight codimension 2 gives weight-fibre dimension 1.

- At n=2,d=1, 8−3=5; at n=2,d=2, 12−6=6.

### 9.2 Kazhdan–Lusztig identity for weight-fibre cycles

Let r be trianguline with integral distinct labelled Sen weights h, let x=(r,δ)∈X_tri with δ∈T₀ⁿ, let M_• be the unique triangulation of D_rig(r)[1/t] with parameter δ (§7.1), let w satisfy wtδ=w(h), and let w_x be the relative position of x_pdR (§6.9). Then `[Spec O_bar_(X_tri,x)^(wt)]=sum_(w_x<=v<=w) P_(w_0 w,w_0 v)(1) C_v^wt` as cycles on the ambient framed deformation ring. No de Rham hypothesis enters this identity, and individual terms C_v^wt may vanish. If r is moreover de Rham, every term of the sum is nonzero. The extremal `C_(w_0)^wt=Z_(w_0)^wt` is nonzero exactly for de Rham r, and for crystalline r is the corresponding fixed-weight crystalline fundamental cycle.

(BHS19 Remark 4.3.1, Corollary 4.3.2 and (4.9), pp. 379–380; BHS19 lines 3203–3224.)

One proof proceeds as follows. Apply the supplier’s completed KL identity before descending the frame. Use the support and simple-cycle triangularity to restrict the sum to w_x≤v≤w; for de Rham r (ν=0) the Bruhat closure description makes every remaining Z_v, hence every C_v, nonzero. Compare the extremal zero section with the de Rham condition; in the crystalline case identify the appropriate crystalline quotient ring.

*Needs:* §9.1; SpringerResolutionAndCharacteristicCycles §14.4; SpringerResolutionAndCharacteristicCycles §11.3; LocalGaloisDeformationRings §3.4.

**Checks.**

- For S₂ all nonzero relevant KL values at 1 equal 1: w_x=e,w=s gives [fibre]=C_e+C_s, whereas w_x=s gives C_s.

- For w=e,v=s the coefficient P_(s,e)(1)=0; dropping the w₀ factors reverses the support test.

- For n=2,d=1 and the non-de Rham period operator N=[[0,1],[0,0]], the only N-stable line is E e₁, so both flags of x_pdR equal it, w_x=e and the Cartan coordinates vanish; x_pdR lies off the zero-section component Z_(w₀)=Z_s. For w=s the identity reads C_e+C_s with C_s=Z_s=0: a vanishing term that a de Rham nonvanishing clause would wrongly exclude. For N=0 and w_x=e the same sum C_e+C_s has both terms nonzero.

### 9.3 Embedding of the fixed-character fibre

For generic δ, the fixed-full-character completed fibre `X_hat_tri,(r,delta)^(delta) -> X_r` is a closed immersion, even without locally algebraic δ. Thus its fundamental cycle can be viewed on the ambient framed Galois deformation space. This is stronger than specifying a fibre as an abstract analytic space.

(BHS19 Lemma 4.3.3, p. 380; BHS19 line 3226.)

One proof proceeds as follows. Use the uniqueness of the localized generic flag and its based parameter. Apply the completed closed immersion argument to the fixed-character subfunctor.

*Needs:* §7.2; §5.4.

**Checks.**

- For n=1,d=2, fixing the character leaves a 0-dimensional fibre inside a 3-dimensional framed ring; fixing only its units leaves dimension 1.

- Two unramified characters with uniformizer values 1 and 2 have the same unit restriction and different full-character fibres.

### 9.4 The local trianguline multiplicity problem

For generic trianguline r, formulate the local multiplicity problem as existence of cycles `C_(r,Pi)` of codimension dn(n+1)/2+n in the free abelian cycle group of Spec R_r, depending only on r and an irreducible locally analytic constituent Π, such that for every δ∈Tⁿ one has `[Spec O_bar_(X_tri,(r,delta))^delta]=sum_Pi m_(delta,Pi) C_(r,Pi)`. The left side is zero when the parameter point is absent. Here `m_(delta,Pi)` is the finite Jordan–Hölder multiplicity in `I_delta=(Ind_(B_bar(K))^(GL_n(K)) delta_1 tensor delta_2 eps tensor ... tensor delta_n eps^(n-1))^an`. Generic r means all its triangulation parameters are in T₀ⁿ. BHS19 prints this codimension as [K:ℚₚ]n(n+3)/2 (Theorem 1.9, p. 305, BHS19 line 264; (4.12), p. 382, BHS19 line 3330) and the fibre dimension as n²+[K:ℚₚ]n(n−3)/2 (Remark 4.3.5, p. 381; BHS19 line 3270). These agree with dn(n+1)/2+n and with the dimension n²−n+dn(n−1)/2 of §9.6 only for K=ℚₚ; for n=1, d=2 they give codimension 4 and dimension −1 inside the 3-dimensional Spec R_r. The codimension dn(n+1)/2+n is forced by the dimension count of §9.6: the weight fibre has codimension dn(n+1)/2 (BHS19 p. 379, BHS19 line 3173), and fixing the full character fixes n further unramified coordinates, not dn. The assertion is conjectural; existence and effectivity are proved here only in the crystalline case.

The locally analytic induction, finite-length theorem, irreducible labels and multiplicities require the constituent supplier contracts.

(BHS19 Conjecture 4.3.4 and Remark 4.3.5, p. 381; BHS19 line 3263.)

A proof route uses I_δ and its composition factors from the locally analytic representation roadmap; do not define them as formal labels. Specify the target cycle group with the full-character codimension, then formulate the signed-cycle equations, with crystalline effectivity as the theorem of §9.8.

*Needs:* §9.3; SpringerResolutionAndCharacteristicCycles §7.1; gap:constituent-conventions.

The reusable interface has the following properties.

- Assign an integer cycle to every genuine irreducible constituent; effectivity is an additional assertion of the crystalline theorem.

- Require the multiplicity identity for every full parameter δ.

- Cycles indexed by isomorphic Π are equal, independently of a presentation as a principal-series constituent.

**Checks.**

- For n=2,d=1 each cycle has dimension 3 in the ambient framed ring of dimension 8, hence codimension 5=1·2·3/2+2.

- A constituent with zero multiplicity contributes zero to that particular equation, rather than forcing its intrinsic cycle to vanish in every other equation.

- The ambient cycle group contains [Z₁]−[Z₂]; it is not the monoid of effective cycles. Effectivity is an additional property of the crystalline construction.

- For n=2,d=1, dimension 8−(3+2)=3; for n=2,d=2 it is 12−(6+2)=4.

- In the signed cycle group, [Z]+(−[Z])=0 with both summands nonzero; vanishing of a sum does not give termwise vanishing.

### 9.5 Uniqueness conditional on local cycle existence

If generic trianguline r has integral Sen weights and a family of cycles satisfying §9.4 exists, it is unique. This is conditional uniqueness in the free abelian cycle group; it supplies no existence statement for general r. The all-constituent triangularity input is required, including constituents induced by non-locally-algebraic parameters.

The constituent supplier supplies the strong-linkage and unitriangular Jordan–Hölder multiplicity results used in the proof.

(BHS19 Proposition 4.3.6, pp. 382–383; BHS19 line 3288.)

One proof proceeds as follows. For every constituent family, use a principal-series presentation with that constituent occurring once and all remaining constituents strictly higher in the finite linkage order. This includes the non-locally-algebraic parameter families; gap:all-constituent-triangularity specifies that input. Solve the resulting unitriangular system recursively in the free abelian cycle group. Parameters absent from X_tri give zero right-hand equations. Do not infer termwise vanishing from a zero sum of signed cycles. The all-family triangular system supplies this step in the signed cycle group.

*Needs:* §9.4; gap:all-constituent-triangularity.

**Checks.**

- For a two-term unitriangular system F₂=C₂, F₁=C₁+2C₂, one recovers C₂=F₂ and C₁=F₁−2F₂.

- The single equation 0=C₁+C₂ has all pairs (a[Z],−a[Z]) as solutions; the all-constituent triangularity input is essential.

### 9.6 Full-character cycles and their dimensions

For r, x=(r,δ), M_• and x_pdR as in §9.2 (trianguline with integral distinct labelled Sen weights, δ∈T₀ⁿ, no de Rham hypothesis), transfer the same simple local-model cycles to C_v^δ on the full-character fibre through diagram (4.11); the additional n unramified-character coordinates are fixed. These cycles have codimension dn(n+1)/2+n, hence dimension n²−n+dn(n−1)/2, in the smooth ambient Galois ring of dimension n²+dn². The construction is independent of the auxiliary period frame.

(BHS19 Diagram (4.11) and discussion before Proposition 4.3.7, pp. 382–383; BHS19 lines 3303–3334.)

One proof proceeds as follows. Refine the weight-fibre comparison by fixing the n unramified character coordinates. Use smooth pullback and descent of cycles as in the weight transfer. Calculate the codimension from the two independent framing dimensions and all dn+n character coordinates.

*Needs:* §9.1; §9.3; §6.2; SpringerResolutionAndCharacteristicCycles §14.1.

The reusable interface has the following properties.

- Fix full characters rather than only their unit restrictions.

- Return codimension dn(n+1)/2+n.

- Descend the transferred cycle through period-frame changes.

**Checks.**

- For n=1 the full-character fibre has dimension zero, while the weight fibre has dimension one.

- For n=2,d=1 the full-character fibre has dimension 3, compared with weight-fibre dimension 5.

- For n=2,d=2 the full-character dimension is 4 and codimension 8; replacing the extra n by dn would give the wrong answer.

- At n=1,d=2, 3−(2+1)=0; at n=2,d=2, 12−(6+2)=4.

- At n=2,d=2 the weight fibre has dimension 6 and the full-character fibre 4, a difference of n=2 rather than dn=4.

### 9.7 Independence from the principal-series presentation

If two admissible presentations (w,δ) give isomorphic irreducible locally analytic constituents Π_w, the associated full-character cycles C_w^δ agree. Thus they depend only on r and Π_w in the generic setting of §9.6, without a de Rham hypothesis.

The constituent supplier supplies the precise constituent-isomorphism criterion and dominant parabolic conventions.

(BHS19 Proposition 4.3.7 and proof, pp. 383–384; BHS19 line 3342.)

One proof proceeds as follows. Reduce to permutations within the dominant Levi blocks. Stability of the relevant components under the block reflections forces the nilpotent operator induced on each Levi-block graded piece to vanish; apply the ν=0 splitting of §5.4 blockwise, and the supplier’s partial-flag saturation of simple cycles. Transport the resulting identity through the full-character diagram.

*Needs:* §9.6; §5.4; SpringerResolutionAndCharacteristicCycles §12.2; gap:constituent-conventions.

**Checks.**

- For a single identical constituent presentation, the comparison is the identity and the same cycle occurs with coefficient 1.

- In S₂, invariance is imposed only for the parabolic permutations satisfying the constituent-isomorphism condition; distinct irreducibles do not become equal merely by relabelling.

### 9.8 Local multiplicity formula for generic crystalline representations

For crystalline r with distinct labelled Hodge–Tate weights and generic Frobenius eigenvalue ratios as in the crystalline case of §8.7, the effective intrinsic cycles `C_(r,Pi)` exist and satisfy §9.4 for every δ∈Tⁿ, including parameters absent from X_tri. Their dimension is n²−n+dn(n−1)/2. This proves the crystalline case of the local conjecture, not the general conjecture or a global locally analytic socle statement.

(BHS19 Theorem 4.3.8 and proof, pp. 384–385; BHS19 line 3388.)

One proof proceeds as follows. Use the companion criterion to list the relevant parameter points. Transfer the completed geometric KL identity to each full-character fibre. Identify its coefficients with the imported principal-series multiplicities and apply constituent invariance. For an absent parameter, show that any constituent shared with a present parameter has zero cycle: constituent invariance supplies its refinement, and w_x≤w′≤w would contradict the companion criterion. Set every other constituent cycle to zero. Then apply conditional uniqueness to the all-parameter family.

*Needs:* §9.5; §9.7; §9.2; §8.7; SpringerResolutionAndCharacteristicCycles §14.4; gap:constituent-conventions.

**Checks.**

- At n=2,d=1 the split crystalline example gives a full-character fibre with two components of multiplicity 1 and dimension 3, hence cycle [Z_cr]+[Z_other].

- An absent parameter has fibre cycle 0; the triangular multiplicity equations must still hold there.

### 9.9 A rank-two split crystalline fibre calculation

For K=ℚₚ,n=2 and r=χ₁⊕χ₂ with `chi_i=z^(h_i) unr(phi_i)`, h₁<h₂ and generic φ₁/φ₂, use `delta=(z^(h_2) unr phi_1,z^(h_1) unr phi_2)`. X_tri is smooth at x, but its fixed-full-character completed fibre is reduced with two irreducible components, each of dimension 3; one is crystalline and one is not. The weight fibre has dimension 5. This is a test that flatness and smoothness of the ambient space do not imply smoothness of the character or weight projection.

(BHS19 §1, Examples (i) after Theorem 1.9, p. 305; BHS19 line 276.)

One proof proceeds as follows. Apply the two-dimensional incidence calculation and retain the Galois framing directions. Identify the two transferred components and their crystalline/noncrystalline loci. Check dimensions against §9.6 and verify the corresponding two principal-series constituents through gap:constituent-conventions.

*Needs:* §9.8; §8.1; §9.6; SpringerResolutionAndCharacteristicCycles §6.6.

**Checks.**

- dim X_tri is 7, the full-character base dimension 4 and fibre dimension 3; the unit base dimension 2 gives fibre dimension 5.

- The reduced full-character fibre has two generic lengths 1, hence cycle [Z_cr]+[Z_other], rather than 2[Z_cr].

### Examples

For n=2,d=1 the smooth ambient Galois ring has dimension 8. A weight fibre has dimension 5 and a full-character fibre dimension 3. For n=2,d=2 those dimensions are 12, 6 and 4. For n=1,d=2 the full-character fibre is a point, not a negative-dimensional cycle. In the split GL₂ example the ambient trianguline space is smooth but its full-character fibre has two components.

### Dependencies

§7.4; SpringerResolutionAndCharacteristicCycles §7.1; SpringerResolutionAndCharacteristicCycles §7.2; SpringerResolutionAndCharacteristicCycles §11.4; SpringerResolutionAndCharacteristicCycles §14.1; SpringerResolutionAndCharacteristicCycles §14.2; PhiGammaModulesAndIwasawaCohomology §2.7 (gap:general-character-spaces); `Module.length`; `AlgebraicGeometry.AlgebraicCycle`; SpringerResolutionAndCharacteristicCycles §14.4; SpringerResolutionAndCharacteristicCycles §11.3; LocalGaloisDeformationRings §3.4; §7.2; §5.4; §6.2; SpringerResolutionAndCharacteristicCycles §12.2; §8.7; §8.1; SpringerResolutionAndCharacteristicCycles §6.6.

## Layer 10: Crystabelline Hodge parameters and modification

Fix D∈ΦΓ_nc(φ,h), n≥2, φ_i/φ_j∉{1,|·|_K} for ordered i≠j, strictly decreasing h at every embedding, and every Frobenius refinement noncritical. Modules may be non-étale. When D_σ is named, use the modified weights and the specifically defined modified zero kernel. Rank-one and rank-two graded modules inherit their corresponding hypotheses; rank-one derivative statements apply independently of n≥2.

The second branch studies a module whose every refinement is noncritical, without assuming étaleness. The injection between two overlapping rank-(n−1) endpoints retains information lost by their isomorphism classes. The single-embedding modification itself is PadicHodgeTheory §5.2's (gap:selective-modification); this layer builds its endpoint and refinement diagrams.

### 10.1 Generic noncritical crystabelline Hodge parameters

Fix generic φ and labelled weights h that are weakly decreasing at every embedding (h_(τ,1)≥⋯≥h_(τ,n)), as in the Ding setting. ΦΓ_nc(φ,h) consists of rank-n crystabelline Robba modules with D[1/t]≅⊕_i R(φ_i)[1/t] and Hodge–Tate–Sen weights h such that each of the n! Frobenius refinements is noncritical, meaning its i-th graded piece has weights exactly h_i. Call such a module regular when every h_τ is strictly decreasing. The module D of Layers 10–13 is regular; its modification D_σ of §10.5 lies in ΦΓ_nc(φ,T_σh), where T_σh agrees with h at σ and has every weight at τ≠σ equal to h_(τ,n) (Ding25 line 554), without the regularity assumption. For w∈S_n the corresponding integral triangulation has successive parameters `phi_(w^(-1)(i)) z^(h_i)`. No étaleness is required. The permutation is common to the embeddings, whereas the BHS weight permutation lies in (S_n)^Σ.

(Ding25 §2.1 and notation ΦΓ_nc(φ,h), pp. 9–10; Ding25 line 379.)

A proof route uses crystalline filtered-module realization and integral triangulation, then impose noncriticality for every refinement. Use the generic smooth-character ratios to identify the labelled Frobenius lines and their orderings.

*Needs:* PadicHodgeTheory §5.2; PhiGammaModulesAndIwasawaCohomology §7.5; PhiGammaModulesAndIwasawaCohomology §7.1.

The reusable interface has the following properties.

- Return the integral triangulation with parameters `phi_(w^(-1)(i)) z^(h_i)`.

- Identify the labelled direct sum after inverting t.

- Require the noncritical weight order for every common refinement.

- Extend E while preserving all labelled embeddings and refinements.

**Checks.**

- Having only one noncritical refinement does not certify membership.

- A non-étale weakly inadmissible filtered module can still be in this category when its refinements meet the conditions.

- For n=2 the transposition exchanges φ₁ and φ₂ but keeps the decreasing order h₁,h₂ in the two graded positions.

- For n=2, the identity refinement has `(phi_1 z^(h_1),phi_2 z^(h_2))` and the transposition has `(phi_2 z^(h_1),phi_1 z^(h_2))`; the weights stay in decreasing order.

- For w=(123), the labels in positions 1,2,3 are (φ₃,φ₁,φ₂), using w⁻¹ rather than w.

- Negative control for regularity: for d=2, n=3 and off-σ weights (3,1,0), the modified off-σ weights are (0,0,0). They are weakly but not strictly decreasing, so D_σ lies in ΦΓ_nc(φ,T_σh) but is not regular, while D with weights (3,1,0) is regular; a definition requiring strict decrease would leave T_σ without a target.

### 10.2 Canonical labelled crystabelline subquotients

For each proper nonempty subset r⊂{1,…,n} of size k, construct the canonical rank-k D_r⊂D with localized Frobenius labels r and weights (h₁,…,h_k), and `D^r=D/D_(r^(c))`, with labels r and weights `(h_(n-k+1),...,h_n)`. Put `D_1=D_(1,...,n-1)` and `C_1=D^(1,...,n-1)`. The composite ι_D:D₁→D→C₁ is injective. Its source and target both have rank n−1, and their ordered weight lists differ.

(Ding25 §2.1, p. 11; exact sequences (2.1)–(2.2), p. 11; Ding25 line 458.)

One proof proceeds as follows. Take the appropriate initial segment of a noncritical refinement and prove independence of the internal ordering using its labelled localized summands. Form the saturated quotient by the complementary canonical submodule. Use generic rank-one Hom vanishing to show that the displayed composite has full rank and zero kernel.

*Needs:* §10.1; PhiGammaModulesAndIwasawaCohomology §7.5; PhiGammaModulesAndIwasawaCohomology §7.2.

The reusable interface has the following properties.

- Produce D_r with the first k decreasing weights.

- Produce D^r with the last k weights.

- Compose the canonical inclusion D₁→D and projection D→C₁.

- The composite is an injective Robba-module map.

**Checks.**

- For n=2,D₁ has parameter `phi_1 z^(h_1)`, while C₁ has parameter `phi_1 z^(h_2)`.

- For |r|=k, `D/D_(r^(c))` has rank k, not n−k.

- The quotient C₁ carries h₂,…,h_n, so identifying its weights with those of D₁ loses the Hodge information.

- For n=3,h=(3,1,0), D₁ has weights (3,1) and C₁ weights (1,0); both have rank 2 and localized labels {1,2}.

### 10.3 The rank-(n−1) injection pencil

For D∈ΦΓ_nc(φ,h), dim_E Hom(D₁,C₁)≤2. It is two exactly when n≥3 and for each i<n the quotient `(D_1)^(r_i)` is isomorphic to the submodule `(C_1)_(r_i)`, where r_i={1,…,n−1} minus {i}. In that case the quotient–isomorphism–inclusion maps α_i are pairwise linearly independent and noninjective of rank n−2. In particular the dimension is always two when n=3, and when n=4 and K=ℚₚ.

(Ding25 Proposition 2.2 and Remark 2.3, pp. 11–12; Ding25 line 484.)

One proof proceeds as follows. Use the localized direct sum to describe morphisms by labelled scalars. Apply the torsion-period invariant formula and noncritical flags to bound their space by two. Characterize the rank drop and the resulting quotient/submodule identifications; use distinct kernels for pairwise independence.

*Needs:* §10.2; PadicHodgeTheory §4.5.

**Checks.**

- At n=2, dim Hom(D₁,C₁)=1 and no rank-(n−2) nonzero exceptional map occurs.

- At n=3, dim Hom=2 and the two exceptional maps have rank 1; at n=4,K=ℚₚ, the three exceptional maps have rank 2 but are only pairwise independent in a 2-dimensional space.

### 10.4 Recovering a Hodge extension from its injection line

The cup/pushout pairing `Ext^1(R(phi_n z^(h_n)),D_1) x Hom(D_1,C_1) -> Ext^1(R(phi_n z^(h_n)),C_1)` has an annihilator of ι_D of dimension d and containing the nonzero extension line E[D] from `0 -> D_1 -> D -> R(phi_n z^(h_n)) -> 0`. For K=ℚₚ this annihilator equals E[D], so (D₁,C₁,[ι_D],φ_n) determines D up to isomorphism. For general K the dimension d statement alone does not give recovery.

(Ding25 Proposition 2.4, pp. 12–13; Ding25 line 534.)

One proof proceeds as follows. Apply Hom and Ext to the two canonical exact sequences. Compute the relevant rank-one Herr groups and identify the annihilator via the connecting morphism. For d=1 its dimension forces the extension line, and scalar multiples of a nonzero extension yield isomorphic middle modules.

*Needs:* §10.2; §10.3; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §3.8.

**Checks.**

- At d=1 the annihilator has dimension 1 and equals E[D]; at d=2 its dimension is 2 and a one-dimensional extension line alone cannot recover it.

- For a∈E× the annihilators of ι and aι coincide, since a times a cup product vanishes exactly when the cup product does.

### 10.5 Refinement-compatible modified endpoint diagrams

Import the period modification D⊂D_σ from PadicHodgeTheory §5.2 (gap:selective-modification). Define D₁,σ=`(D_sigma)_(1,...,n-1)`, C₁,σ=`(D_sigma)^(1,...,n-1)`, and `iota_(D_sigma)` as their inclusion–projection composite. Identify these endpoints with the modifications of D₁ and C₁ using the ambient off-σ cutoff `h_(tau,n)` for both. Each refinement has parameters `phi_(w^(-1)(i)) z^((T_sigma h)_i)`; the σ-filtered endpoint maps are the original ones. The existence, uniqueness, lattice construction and D_pst comparison of D_σ are imported, used through that contract.

(Ding25 Proposition 2.5 and Lemma 2.6, p. 13; endpoint notation and (2.7), pp. 13–14; Ding25 line 560.)

One proof proceeds as follows. Apply the imported period modification to D and saturate each labelled refinement step in D_σ. Use rank-one character classification to identify its new graded weights. Take the first n−1 labelled submodule and quotient, tracking the ambient cutoff and functorial inclusion–projection map.

*Needs:* §10.2; PadicHodgeTheory §5.2 (gap:selective-modification); PhiGammaModulesAndIwasawaCohomology §7.4; gap:selective-modification.

The reusable interface has the following properties.

- Apply the imported D_σ construction and form its two labelled rank-(n−1) endpoints.

- Retain D⊂D_σ and the equality after inverting t.

- Preserve the complete σ-filtered de Rham module.

- The refinement w has parameters `phi_(w^(-1)(i)) z^((T_sigma h)_i)`.

**Checks.**

- When K=ℚₚ the modification is D itself.

- For two embeddings, weights (3,1,0) at τ≠σ become (0,0,0), so D_σ is not regular at τ.

- Changing the σ-Hodge filtration while keeping φ,h fixed changes D_σ; the construction cannot discard that filtration.

- For n=3 and off-σ weights (3,1,0), both D₁,σ and C₁,σ have weights (0,0); replacing the first endpoint cutoff by 1 is incorrect.

- For two embeddings and h_τ=(3,1,0) off σ, both endpoint weight lists become (0,0); using D₁’s own cutoff 1 would give the wrong (1,1).

### 10.6 The modified injection determines the σ-Hodge filtration

Every refinement of D_σ has the parameters in §10.5. The Hom-pencil bound and its rank-drop criterion hold for (D₁,σ,C₁,σ). The annihilator of `iota_(D_sigma)` under the corresponding extension pairing is the one-dimensional line E[D_σ] for every K. Hence `(D_1,sigma,C_1,sigma,[iota_(D_sigma)],phi_n)` recovers D_σ and the original σ-Hodge filtration.

(Ding25 Propositions 2.7–2.8, p. 14; Ding25 line 599.)

One proof proceeds as follows. Apply the explicit modified period lattices to all refinement subquotients. Repeat the Hom and Ext calculation, noting that only the σ-filtration contributes a nontrivial annihilator direction. Recover the extension line, then use the preserved σ-filtration.

*Needs:* §10.5; §10.4; §10.3.

**Checks.**

- At d=2 the original annihilator has dimension 2 but the modified annihilator has dimension 1; equal off-σ endpoint weights contribute 0 to the latter quotient.

- At d=1, D_σ=D and both annihilator dimensions are 1.

### 10.7 A rank-three Hodge parameter recovered from an injection

For n=3 fix the Frobenius-labelled basis e₁,e₂,e₃ and a∈E minus {0,1}. At σ choose the Hodge plane span(e₁+e₂,e₁+a e₂+e₃) and Hodge line E(e₁+a e₂+e₃). The induced top lines of D₁,σ and C₁,σ are E(e₁+e₂) and E(e₁+a e₂); the projective class of their canonical injection recovers a once the labelled φ and weights are fixed. The excluded values produce a critical refinement and are not examples in ΦΓ_nc.

For the displayed crystalline realization assume K/ℚₚ unramified and D crystalline, as in the source example.

(Ding25 Example 2.9, pp. 14–15; Ding25 line 617.)

One proof proceeds as follows. Intersect and project the displayed flag to the labelled Frobenius subquotients. Write the injection in the induced bases and solve for the ratio a. Check that a=0 or a=1 forces failure of the all-refinement noncriticality condition.

*Needs:* §10.6.

**Checks.**

- For a=2, the plane has normal vector (1,−1,1) and the line vector (1,2,1), whose dot product is 0; all three plane coefficients and all three line coordinates are nonzero.

- At a=0 the line has second coordinate 0; at a=1 the plane normal has third coordinate 0, exhibiting the two excluded critical cases.

### 10.8 Every single-embedding module lifts to a regular one

The map T_σ:ΦΓ_nc(φ,h)→ΦΓ_nc(φ,T_σh) is surjective on isomorphism classes. Thus every module with the specified single varying σ-filtration comes from a module regular at every embedding, without asserting that the choice of the other filtrations is unique.

(Ding25 Surjectivity assertion in (2.7), p. 13; Ding25 line 546.)

One proof proceeds as follows. Start with its fixed labelled Deligne–Fontaine module and retain the σ-filtration. At each τ≠σ choose a full flag transverse to every one of the finitely many Frobenius refinement flags. The required open subset of the full flag variety is nonempty over the infinite coefficient field. Give that flag the strictly decreasing jumps h_τ and reconstruct the crystabelline module by the imported filtered-module equivalence. Its modification is the original target.

*Needs:* §10.5; PadicHodgeTheory §5.2; SpringerResolutionAndCharacteristicCycles §1.3.

**Checks.**

- At d=1, T_σ is the identity on the single filtration and hence surjective.

- At d=2, every generic σ-flag admits generic off-σ flags, but choosing distinct such off-σ flags gives the same modified object; surjectivity does not imply injectivity.

### Examples

For n=3, off-σ weights (3,1,0) become (0,0,0). Both rank-two endpoints must then have weights (0,0), using the ambient minimum 0; independently modifying the first endpoint with its own minimum 1 gives the wrong diagram. At σ, the two endpoint Hodge lines E(e₁+e₂) and E(e₁+a e₂) retain the projective parameter a∉{0,1}.

### Dependencies

PadicHodgeTheory §5.2; PhiGammaModulesAndIwasawaCohomology §7.5; PhiGammaModulesAndIwasawaCohomology §7.1; PhiGammaModulesAndIwasawaCohomology §7.2; PadicHodgeTheory §4.5; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §3.8; PadicHodgeTheory §5.2 (gap:selective-modification); PhiGammaModulesAndIwasawaCohomology §7.4; SpringerResolutionAndCharacteristicCycles §1.3.

## Layer 11: Refinement tangent spaces and paraboline relations

Fix D∈ΦΓ_nc(φ,h), n≥2, φ_i/φ_j∉{1,|·|_K} for ordered i≠j, strictly decreasing h at every embedding, and every Frobenius refinement noncritical. Modules may be non-étale. When D_σ is named, use the modified weights and the specifically defined modified zero kernel. Rank-one and rank-two graded modules inherit their corresponding hypotheses; rank-one derivative statements apply independently of n≥2.

Use LocalGaloisDeformationRings §1.23's deformation functors and identify the tangent subspaces of their simultaneous refinements. First establish the graded paraboline quotient isomorphism directly, then prove refinement generation in Layer 13. Reversing that order would create a circular argument.

### 11.1 Rank-one self-extensions as character derivatives

Use the supplier’s identification of first-order deformations with Ext¹(D,D), where ε acts on an extension by projection followed by inclusion. In rank one Ext¹(R(δ),R(δ))≅Hom_cont(K×,E), with ψ corresponding to δ(1+εψ). The smooth subspace has dimension 1, the locally σ-analytic subspace dimension 2, and the full space dimension d+1. These normalizations fix the signs of all κ-maps below.

(Ding25 §2.3.1, (2.11), p. 15; Ding25 line 627.)

A proof route uses Herr–Yoneda Ext and local Galois/Robba deformation equivalences. Differentiate multiplication of rank-one characters over E[ε]/ε². Use the unit/uniformizer decomposition of K× and the d independent embedding logarithms.

*Needs:* LocalGaloisDeformationRings §§0.4, 1.23; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §§2.7, 7.3.

**Checks.**

- For ψ=v_K normalized by v_K(ϖ)=1, the first-order character has value 1+ε at ϖ and value 1 on units.

- For ψ=log_σ normalized to vanish at ϖ, the uniformizer value is 1 and the σ-unit derivative is ε; at d=2 the smooth, σ-analytic and full dimensions are 1,2,3.

### 11.2 Refinement deformation spaces and parameter derivatives

For each refinement w let Ext¹_w(D,D) be the subspace of first-order deformations lifting its integral triangulation. Define κ_w:Ext¹_w→Hom_cont((K×)^n,E) from the derivatives of its n lifted characters, in their ordered graded positions. Ext¹_g(D,D) denotes the de Rham first-order subspace. The underlying deformation functors and their representing rings are imported; this target specifies their simultaneous refinement subspaces and derivatives.

(Ding25 §2.3.1, (2.11)–(2.12) and Proposition 2.10, pp. 15–16; Ding25 line 679.)

One proof proceeds as follows. Use the supplier’s trianguline first-order cartesian square, keeping the chosen refinement. Read the rank-one graded derivatives through §11.1. Define the de Rham condition by the period comparison, then verify the conditions form E-linear subspaces.

*Needs:* §10.1; §11.1; LocalGaloisDeformationRings §§0.4, 1.23.

The reusable interface has the following properties.

- Require a lift of the specified integral refinement.

- Return the ordered character derivative.

- Forget the refinement to obtain an element of Ext¹(D,D).

- On a refinement, de Rham classes are exactly those whose κ is smooth.

**Checks.**

- D⊗R(1+εψ) belongs to every refinement space, with κ_w=(ψ,…,ψ).

- For a logarithmic nonsmooth ψ, that scalar twist is not de Rham.

- For an unramified ψ, the scalar twist is de Rham and has the same ψ in every ordered position.

- For a scalar derivative ψ, κ_w=(ψ,…,ψ); if ψ is logarithmic the twist is not de Rham, whereas unramified ψ is smooth and de Rham.

### 11.3 Dimensions and Weyl transport of refinement tangents

For the individual tangent spaces with the dimensions supplied by LocalGaloisDeformationRings §1.23, prove that each κ_w is surjective and κ_w⁻¹(Hom_sm(T(K),E))=Ext¹_g. On Ext¹_g, prove `kappa_(w_2)=(w_2 w_1^(-1)) kappa_(w_1)`, with the permutation action matching the ordered character positions.

(Ding25 Proposition 2.10 and Lemma 2.11, pp. 16–17; Ding25 line 679.)

One proof proceeds as follows. Compute H⁰ and H² of ad D by genericity and apply the Herr Euler characteristic. Compute the de Rham local condition from the labelled regular filtration. Use the trianguline smooth deformation ring and rank-one character derivatives for surjectivity and the displayed fibre condition. Track the labelled Frobenius eigencharacters on de Rham lifts for Weyl transport.

*Needs:* §11.2; PhiGammaModulesAndIwasawaCohomology §3.4a; LocalGaloisDeformationRings §§0.4, 1.23.

**Checks.**

- At n=3,d=1, the supplied self, de Rham and refinement dimensions are 10,4,7; the derivative target has dimension 6, so its common kernel has dimension 1.

- On smooth tuples, for w₁=e,w₂=(123), (a₁,a₂,a₃) maps to (a₃,a₁,a₂); for w₂=s∈S₂ the tuple (1,2) maps to (2,1).

### 11.4 The common zero-parameter quotient

Let Ext¹₀(D,D)=ker κ_w; it is independent of w, lies in Ext¹_g and has dimension 1−n+dn(n−1)/2. Put barExt¹=Ext¹/Ext¹₀ and similarly for subspaces containing Ext¹₀. Then barExt¹_w≅Hom_cont(T(K),E), barExt¹_g≅Hom_sm(T(K),E), and dim barExt¹=dn(n+1)/2+n. This full-kernel identity applies to the regular original D and must not be transferred unchanged to D_σ.

(Ding25 §2.3.1, (2.14)–(2.16), p. 17; Ding25 line 714.)

One proof proceeds as follows. Use Weyl transport on the de Rham subspace and the κ fibre characterization. Apply rank-nullity and descend κ to the indicated quotient. Verify quotient maps agree for all refinements.

*Needs:* §11.3; `LinearMap.ker`; `LinearMap.finrank_range_add_finrank_ker`.

The reusable interface has the following properties.

- Use the common kernel as a native linear subspace of self-Ext.

- Form the module quotient by that subspace.

- Descend κ_w to an isomorphism barExt¹_w≅Hom_cont(T(K),E).

- Compute dim Ext¹₀ and dim barExt¹ as stated.

**Checks.**

- For n=2,d=1, dim Ext¹₀=0 and dim barExt¹=5.

- For n=3,d=1, dim Ext¹₀=1 and dim barExt¹=9.

- For d>1 the full kernel of κ on D_σ is larger than its de Rham zero-parameter subspace; the present definition is not silently reused there.

- At n=2,d=1 the kernel dimension is 1−2+1=0 and quotient dimension 5; at n=3,d=1 they are 1 and 9.

### 11.5 De Rham deformation directions up to scalar twist

Define `Ext^1_(g')(D,D)` as de Rham deformations up to a rank-one character twist. Let `Hom_(g')(T(K),E)=Hom_sm(T(K),E)+{psi o det:psi in Hom_cont(K^*,E)}`. Then `Ext^1_(g')=kappa_w^(-1)(Hom_(g'))` for every w and has dimension 1+d(n(n−1)/2+1). Weyl transport of κ holds on this larger subspace.

(Ding25 §2.3.1, (2.17), p. 18; Ding25 line 789.)

One proof proceeds as follows. Use additivity of first-order character twists. Identify the common derivative direction with ψ∘det and quotient its overlap with the smooth subspace. Use the de Rham fibre formula and Weyl invariance of determinant.

*Needs:* §11.4; §11.1.

The reusable interface has the following properties.

- Add the scalar character-twist directions to Ext¹_g.

- Recognize membership by smooth derivatives plus one common continuous derivative.

- Transport derivatives by the refinement permutation.

**Checks.**

- Every common ψ in all n coordinates is admitted.

- A tuple of unrelated nonsmooth derivatives in two positions is excluded unless their difference is smooth.

- For n=2,d=1 its dimension is 3, compared with de Rham dimension 2.

- At n=2,d=1 the de Rham dimension is 2 and adjoining scalar logarithms gives dimension 3; derivatives (log,0) are excluded modulo smooth tuples.

### 11.6 Paraboline deformation subspaces

For a standard parabolic P with ordered block sizes n₁,…,n_r summing to n and a saturated P-filtration F_P of D, let M_i=gr_i F_P have rank n_i. `Ext^1_(F_P)(D,D)` consists of deformations lifting F_P, and `kappa_(F_P)` sends them to the tuple in ∏_i Ext¹(M_i,M_i). A refinement w is compatible when its full flag refines F_P. Define quotient versions only after proving `Ext^1_0 subset Ext^1_(F_P)`.

(Ding25 §2.3.1, P-filtration and (2.18), pp. 18–19; Ding25 line 820.)

One proof proceeds as follows. Use the relative Robba deformation category with a filtration of specified ranks. Take the induced first-order deformations of the graded modules. Verify independence of representatives and linearity via the Yoneda interpretation.

*Needs:* §11.2; §10.2; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2.

The reusable interface has the following properties.

- Lift F_P with graded ranks n_i, not cumulative ranks.

- Return each first-order graded self-extension.

- A compatible full refinement induces this filtration and the corresponding graded refinements.

- Each gr_i has rank n_i; the i-th filtration term has rank n₁+⋯+n_i.

**Checks.**

- For P=GL_n the paraboline space is the entire self-Ext and κ is the identity.

- For P=B and the corresponding refinement, the condition is the trianguline condition and κ records rank-one derivatives.

- For block sizes (2,1), graded ranks are (2,1), while filtration ranks are (2,3).

- For blocks (2,1), the graded ranks are (2,1) and cumulative ranks (2,3); P=G gives one block and the identity graded map.

### 11.7 Paraboline dimensions and quotient product formulas

`kappa_(F_P)` is surjective and dim `Ext^1_(F_P)=1+d` dim P, where dim P=`sum_(i<=j) n_i n_j`. For a compatible refinement w, Ext¹_w is the inverse image of `prod Ext^1_(w_i)(M_i,M_i)`. The quotient `barExt^1_(F_P) ~= prod barExt^1(M_i,M_i)` has dimension d dim(B∩L_P)+n, and its compatible trianguline quotients identify with the product of graded trianguline quotients. The sign before n is positive.

(Ding25 Proposition 2.13 and Corollary 2.14, pp. 18–19; Ding25 line 818.)

One proof proceeds as follows. Use successive extension lifting and rank-one H² vanishing to lift arbitrary graded deformations. Compute the filtered endomorphism Euler characteristic and scalar H⁰. Identify the common zero-parameter kernel by the graded de Rham derivative maps; apply rank-nullity to obtain the quotient product formula. If using the source’s alternative spanning argument, order it after §13.8, rather than making that argument circular.

*Needs:* §11.6; §11.4; PhiGammaModulesAndIwasawaCohomology §3.4a; §5.2.

**Checks.**

- At n=3,d=1 with blocks (2,1), dim P=4+2+1=7, so dim Ext¹_F=8 and quotient dimension 8−1=7=dim(B∩L)+3=4+3.

- For B with three blocks of size 1, the quotient dimension is 3d+3; for G it is 6d+3.

### 11.8 Blockwise de Rham directions and Weyl transport

Let `Ext^1_(F_P,g')` be the `kappa_(F_P)`-inverse image of `prod Ext^1_(g')(M_i,M_i)`. Its compatible-refinement derivative image is `Hom_(P,g')=Hom_sm(T(K),E)+sum_i{psi_i o det_i}`, of dimension n+rd. Derivative transport is equivariant for W_P, and membership is equivalent to the displayed blockwise condition.

(Ding25 Corollary 2.15, (2.21) and proof, pp. 19–20; Ding25 line 881.)

One proof proceeds as follows. Apply the one-block up-to-twist calculation to each graded module. Pull the condition back through `kappa_(F_P)` and a compatible refinement. Track the permutations within each Levi block, whose determinant is invariant.

*Needs:* §11.7; §11.5.

**Checks.**

- At n=3,d=2 and blocks (2,1), the derivative-image dimension is n+rd=3+4=7; one scalar logarithm per block, rather than per graded coordinate, is allowed.

- For blocks (2,1), (log,log,0) is allowed and (log,0,0) is excluded modulo smooth characters.

- For n=2,d=2 and the single block P=G, the derivative image has dimension n+rd=2+2=4 and excludes (log_σ,0), because (log_σ,0)−(ψ,ψ) is smooth only when ψ and log_σ are both smooth; for P=B it has dimension 2+2·2=6 and contains (log_σ,0). A block may carry one logarithmic derivative without forcing equality across different blocks.

### Examples

For n=2,d=1, the full, de Rham and trianguline self-Ext dimensions are 5, 2 and 4; the common zero-parameter kernel is zero. For n=3,d=1 that kernel has dimension 1 and the full quotient dimension is 9. A P-filtration with block sizes (2,1) has graded ranks (2,1) and cumulative filtration ranks (2,3).

### Dependencies

LocalGaloisDeformationRings §§0.4, 1.23; PhiGammaModulesAndIwasawaCohomology §3.4a; PhiGammaModulesAndIwasawaCohomology §§2.7, 7.3; §10.1; `LinearMap.ker`; `LinearMap.finrank_range_add_finrank_ker`; §10.2; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2; §5.2.

## Layer 12: Partial de Rham deformation spaces

Fix D∈ΦΓ_nc(φ,h), n≥2, φ_i/φ_j∉{1,|·|_K} for ordered i≠j, strictly decreasing h at every embedding, and every Frobenius refinement noncritical. Modules may be non-étale. When D_σ is named, use the modified weights and the specifically defined modified zero kernel. Rank-one and rank-two graded modules inherit their corresponding hypotheses; rank-one derivative statements apply independently of n≥2.

The σ-subscript means de Rham at every embedding except σ. Modification makes all other weights equal and changes the de Rham zero-parameter kernel; the full trianguline κ-kernel must not be substituted for it. The first-order construction uses the one-jump replacement of the period filtration and retains its nilpotent coefficient operator.

### 12.1 Partial de Rham self-extension conditions

For J⊂Σ a Robba module is J-de Rham when dim_E D_dR,τ equals its rank for every τ∈J. Write Ext¹_σ(D,D) for self-extensions that are (Σ minus {σ})-de Rham, and intersect this subspace with the refinement, paraboline and g′ conditions to obtain `Ext^1_(sigma,?)`. Quotients `barExt^1_(sigma,?)` are taken by Ext¹₀ whenever it is contained. For a de Rham rank-one character, Ext¹_σ≅Hom_σ(K×,E).

(Ding25 §2.3.2, (2.22)–(2.25), pp. 20–21; Ding25 line 900.)

A proof route uses partial B-pair de Rham local conditions at individual split embeddings. Use the de Rham condition on each period component to define linear self-extension subspaces. Apply the rank-one derivative comparison to identify the σ-analytic character directions.

*Needs:* §11.2; §11.4; PadicHodgeTheory §4.5.

The reusable interface has the following properties.

- Intersect the required period-kernel conditions at τ≠σ.

- Intersect with the specified refinement or paraboline space.

- Identify rank-one partial classes with locally σ-analytic additive characters.

- Requiring de Rhamness at every embedding recovers Ext¹_g.

**Checks.**

- For K=ℚₚ there are no τ≠σ conditions, so Ext¹_σ is the full self-Ext space.

- For d>1 the rank-one partial space has dimension 2, while full character derivatives have dimension d+1.

- A nonsmooth derivative supported at τ≠σ violates the condition; a σ-logarithmic derivative is allowed.

- For d=1 the complement of {σ} is empty and no period condition remains; for d=2 a rank-one σ-partial space has dimension 2 versus full dimension 3.

### 12.2 Partial de Rham dimensions and paraboline products

For regular D, dim Ext¹_σ(D,D)=1+(d−1)n(n−1)/2+n². For a P-filtration, dim `Ext^1_(sigma,F_P)=1+(d-1)n(n-1)/2+dim` P; its graded map is surjective and induces `barExt^1_(sigma,F_P) ~= prod_i` barExt¹_σ(M_i,M_i). Compatible refinement quotients identify with the product of graded refinement quotients, and κ_w induces `barExt^1_(sigma,w) ~= Hom_sigma(T(K),E)`.

Use the partial-cohomology supplier contract: the partial B-pair dimension/exactness formula, verified in Ding19 Appendix A, Propositions A.3 and A.5, with the modified H²-vanishing hypotheses checked for the filtered endomorphism pieces.

(Ding25 Lemma 2.16, Proposition 2.17 and Corollaries 2.18–2.19, pp. 20–21; Ding25 line 928.)

One proof proceeds as follows. Identify each deformation subspace with `H^1_(g,Sigma minus {sigma})` of the appropriate endomorphism B-pair. Compute the τ≠σ period invariants from the descending weight differences, using the rank n_i graded pieces. Compare dimensions with the paraboline graded map; its kernel is de Rham, so the partial map is surjective. Pass through the common zero-parameter quotient and use the rank-one partial comparison.

*Needs:* §12.1; §11.7; PadicHodgeTheory §4.5; PadicHodgeTheory §§4.4–4.5, 5.2; gap:partial-de-rham-cohomology.

**Checks.**

- At n=3,d=2, the full partial dimension is 1+3+9=13; for blocks (2,1) it is 1+3+7=11.

- The original zero kernel has dimension 1−3+6=4, so that partial paraboline quotient has dimension 7; its rank-two and rank-one block quotients have dimensions 5 and 2.

### 12.3 Tangent dimensions for the modified module

For D_σ, dim Ext¹=1+n²d, dim Ext¹_g=1+n(n−1)/2, and dim `Ext^1_(F_P)=1+d` dim P. Every de Rham deformation lifts every such P-filtration, and the graded paraboline map is surjective. However κ_w⁻¹(Hom_sm) has dimension 1+dn(n−1)/2, so strictly contains Ext¹_g when d>1. The partial dimensions are dim Ext¹_σ=1+n² and dim `Ext^1_(sigma,F_P)=1+dim` P.

(Ding25 Proposition 2.20, Remark 2.21 and Proposition 2.22, pp. 22–23; Ding25 line 990; Ding19 Appendix A, Propositions A.3, A.5 and Corollary A.4, author preprint pp. 44–47; Ding19 line 1990.)

One proof proceeds as follows. Use generic H⁰=E and H²=0 for the full self-Ext dimension. Use the constant τ≠σ weights to compute n² period invariants at those embeddings. Show the off-diagonal de Rham Ext groups obstructing a filtration vanish; lift the filtration successively. Apply the partial B-pair formula and then rank-nullity for κ_w.

*Needs:* §10.5; §12.2; PhiGammaModulesAndIwasawaCohomology §3.4a; PadicHodgeTheory §§4.4–4.5, 5.2; gap:partial-de-rham-cohomology.

**Checks.**

- At n=2,d=2, the full self-Ext dimension is 9, de Rham dimension 2 and full-refinement smooth-derivative preimage dimension 3; the latter exceeds the former by 1.

- The modified partial self-Ext has dimension 5 and modified partial B-filtration space dimension 4.

### 12.4 Modification of first-order deformations

For each deformation D̃ over `R_(K,E[eps]/eps^2)`, construct a unique D̃_σ⊃D̃ with the same localization, the same σ-Sen weights, and τ≠σ Sen weights, as E-weights, all equal to `h_(tau,n)`. It reduces to D_σ and defines an E-linear map T_σ:Ext¹(D,D)→Ext¹(D_σ,D_σ), preserving partial de Rhamness and saturated filtrations. Constant E-weights do not impose vanishing of nilpotent Sen operators.

(Ding25 Proposition 2.23 and (2.29), p. 23; Ding25 line 1031; BHS19 Lemma 3.2.2, pp. 337–340; Proposition 3.5.1 and Remark 3.5.2, pp. 355–356 (construction of the omitted coefficient details); BHS19 line 1568.)

One proof proceeds as follows. Put A=E[ε]/ε². The underlying E-representation W_dR(D̃) is almost de Rham; apply the coefficient D_pdR equivalence without setting its nilpotent ν to zero. At σ retain the original ν-stable filtration. At τ≠σ replace it by the one-jump filtration Fil^i=D_pdR(D̃)_τ for `i<=-h_(tau,n)` and Fil^i=0 otherwise. Its only graded piece is A-free, and it contains the original lattice filtration because `h_(tau,n)` is the ambient minimum. Apply §2.2 to this filtration and §6.1 to the unchanged localized module. This produces the unique free A-Robba module containing D̃ with the specified localization and E-Sen spectrum. Uniqueness follows from the one-jump filtration off σ and, at σ, inclusion of lattices with the same elementary-divisor multiset. The replacement commutes with finite coefficient tensor products and is exact on sequences using the same ambient cutoff. Thus pullback, pushout, Baer sums and scalar multiplication commute with it. Apply the same cutoff to filtration terms and quotients; their A-free graded pieces give saturation. Partial de Rhamness is ν=0 at the required embeddings, which this construction preserves.

*Needs:* §10.5; §2.2; §3.4; PadicHodgeTheory §4.4; §1.1; §6.1.

The reusable interface has the following properties.

- Modify a genuine first-order Robba deformation over K.

- Retain D̃⊂D̃_σ and the localized equality.

- Commute with scalar multiplication and Baer sums of self-extensions.

- Modify a saturated filtration and its graded deformations compatibly.

**Checks.**

- For K=ℚₚ the map is the identity.

- A scalar infinitesimal twist supported at τ≠σ can have nonzero nilpotent Sen derivative after modification; constant residual E-weights do not kill it.

- The split self-extension maps to the split self-extension of D_σ.

- For d=1 the modification is the identity; for the split first-order extension its image is the split extension, with class 0.

- Over E[ε]/ε² the operator ε·id has residual E-spectrum {0,0} but is nonzero; constant E-weights do not imply zero nilpotent Sen operator.

### 12.5 Kernel and restricted surjectivity of modification

ker T_σ has dimension (d−1)n(n−1)/2 and lies in Ext¹_g(D,D). Restrictions to Ext¹_g, Ext¹_σ and `Ext^1_(sigma,F_P)` are surjective onto the corresponding spaces for D_σ, with this same kernel. The graded diagram commutes, and `Ext^1_(sigma,F_P)(D_sigma,D_sigma) -> prod Ext^1_sigma(M_i,sigma,M_i,sigma)` is surjective. The full map on Ext¹ is not surjective when d>1 and n≥2.

(Ding25 Proposition 2.24 and diagram (2.30), pp. 23–24; Ding25 line 1041.)

One proof proceeds as follows. Compare T_σ with pushforward Ext¹(D,D)→Ext¹(D,D_σ) and the injective pullback from Ext¹(D_σ,D_σ). Compute its kernel as torsion-quotient invariants using PadicHodgeTheory §4.5. Evaluate the period-lattice quotient dimensions; compare source and target dimensions for the three stated restrictions. Use construction-level graded compatibility and the regular-module partial surjectivity.

*Needs:* §12.4; PadicHodgeTheory §4.5; §12.3; §12.2.

**Checks.**

- At n=3,d=2 the kernel dimension is 3; original de Rham dimension 7 maps onto modified dimension 4, and partial dimensions 13→10 have the same difference 3.

- The full self-Ext spaces both have dimension 19; a 3-dimensional kernel forces image dimension 16, so the full map is not surjective.

### 12.6 The modified de Rham zero-parameter quotient

Define Ext¹₀(D_σ,D_σ) as the kernel of κ_w restricted to Ext¹_g(D_σ,D_σ). It is independent of w, has dimension 1−n+n(n−1)/2, and is strictly smaller than ker κ_w on the full refinement space if d>1. Define modified barExt¹ by this de Rham kernel. The maps κ_w:Ext¹_g→Hom_sm are surjective and obey Weyl transport.

(Ding25 Corollary 2.25 and definition before Corollary 2.26, p. 24; Ding25 line 1075.)

One proof proceeds as follows. Use the modified de Rham dimension and parameter surjectivity obtained through T_σ. Restrict before taking the kernel; apply rank-nullity and Weyl transport. Compare its dimension with the full refinement kernel computed in §12.3.

*Needs:* §12.5; §12.3; §11.4.

The reusable interface has the following properties.

- Take the parameter kernel inside Ext¹_g, not inside all Ext¹_w.

- Form the quotient by precisely this subspace.

- Show independence of w by the de Rham derivative permutation.

- Compute dimension 1−n+n(n−1)/2.

**Checks.**

- For n=2,d=2 the modified de Rham zero kernel is zero, while the full refinement κ-kernel has dimension one.

- For n=3 any d the modified zero kernel has dimension one.

- For d=1 it agrees with the original regular-module zero kernel.

- At n=2,d=2 the modified de Rham zero kernel has dimension 1−2+1=0, while the full-refinement kernel has dimension 1−2+2=1.

### 12.7 Modification induces partial tangent quotient isomorphisms

Ext¹₀(D,D)=T_σ⁻¹(Ext¹₀(D_σ,D_σ)), and T_σ maps these zero subspaces surjectively. For *=g,σ or (σ,F_P), it induces barExt¹_*(D,D)≅barExt¹_*(D_σ,D_σ). The paraboline product isomorphisms commute with this comparison and the graded modifications.

(Ding25 Corollaries 2.26–2.27, pp. 24–25; Ding25 line 1091.)

One proof proceeds as follows. Use the kernel and restricted surjectivity theorem and the commuting κ diagram. Characterize both zero subspaces inside their respective de Rham spaces. Apply the quotient isomorphism theorem and compare the two graded product diagrams.

*Needs:* §12.6; §12.5; §11.4; §12.2.

**Checks.**

- At n=3,d=2, original zero kernel dimension 4 maps onto modified zero kernel dimension 1 with kernel dimension 3; partial quotient dimensions are 13−4=10−1=9.

### Examples

For n=2,d=2, original Ext¹₀ has dimension 1, modified Ext¹₀ has dimension 0, and the modification map has kernel dimension 1. Both full self-Ext spaces have dimension 9, so the full map cannot be surjective. The partial spaces have dimensions 6 and 5, and their restricted map is surjective with that kernel. A nonsmooth scalar twist at τ≠σ remains visible as a nilpotent Sen operator after modification.

### Dependencies

§11.2; §11.4; PadicHodgeTheory §4.5; §11.7; PadicHodgeTheory §§4.4–4.5, 5.2; §10.5; PhiGammaModulesAndIwasawaCohomology §3.4a; §2.2; §3.4; PadicHodgeTheory §4.4; §1.1; §6.1.

## Layer 13: Higher intertwining and recovery of Hodge parameters

Fix D∈ΦΓ_nc(φ,h), n≥2, φ_i/φ_j∉{1,|·|_K} for ordered i≠j, strictly decreasing h at every embedding, and every Frobenius refinement noncritical. Modules may be non-étale. When D_σ is named, use the modified weights and the specifically defined modified zero kernel. Rank-one and rank-two graded modules inherit their corresponding hypotheses; rank-one derivative statements apply independently of n≥2.

Pullback and pushout must come from the same extension. Their signed image is the compatibility relation; the product of their separate images loses the required datum. Higher intertwining identifies that relation with the kernel of the sum of the two paraboline maps. The original and single-embedding exact sequences recover different amounts of Hodge data.

### 13.1 Pullback and pushout along a Hodge injection

For ι:D₁→C₁ define ι⁻:Ext¹(C₁,D₁)→Ext¹(D₁,D₁) by pullback and ι⁺:Ext¹(C₁,D₁)→Ext¹(C₁,C₁) by pushout. Write Ext¹_ι for their respective image subspaces. Both maps are E-linear and preserve de Rham local conditions. This notation includes noninjective ι, but later rigidity theorems specify injectivity.

(Ding25 Formula (2.34), pp. 25–26; Ding25 line 1136.)

One proof proceeds as follows. Use the supplier’s exact category and native Yoneda functoriality. Apply the universal pullback and pushout constructions with all identifications of endpoints. Verify compatibility with the period functor and addition of extensions.

*Needs:* §10.2; PhiGammaModulesAndIwasawaCohomology §3.4a; `LinearMap.range`.

The reusable interface has the following properties.

- Pull an extension back along ι on its quotient.

- Push an extension out along ι on its submodule.

- Take the native linear range of each map.

- Both operations preserve the period-local extension subspace.

**Checks.**

- For ι=0 both maps and both image subspaces are zero.

- For ι=id on a single module both maps are the identity on self-Ext.

- Replacing ι by a∈E× times ι scales both linear maps and preserves their image subspaces.

- For ι=0, pullback and pushout give maps 0 with image {0}; for ι=id both are identity with image the full self-Ext space.

### 13.2 Dimensions of the exceptional noninjective images

Assume dim Hom(D₁,C₁)=2 and use the rank-(n−2) maps α_i. Each `Ext^1_(alpha_i)` has dimension (n−1)(n−2)d. For distinct i,j their intersection has dimension (n−1)(n−3)d+d−1 and their sum has dimension 1+n(n−2)d. Both assertions hold on the D₁ and on the C₁ side.

(Ding25 Lemma 2.28 and proof, p. 26; Ding25 line 1140.)

One proof proceeds as follows. Express the image as the kernel of pullback to the corresponding rank-one labelled submodule. Compute the two-map kernel by the torsion-period invariant formula. Use the native dimension identity for a sum and intersection of subspaces.

*Needs:* §13.1; §10.3; PadicHodgeTheory §4.5; `Submodule.finrank_sup_add_finrank_inf_eq`.

**Checks.**

- At n=3,d=1, image dimensions are 2, intersection dimension 0 and sum dimension 4=2+2; at d=2 they are 4,1,7=4+4−1.

- At n=4,d=1, the dimensions are 6,3,9=6+6−3; the n≥3 pencil hypothesis excludes a negative n−3 rank term at n=2.

### 13.3 Self-extension images determine the injection line

If ι:D₁→C₁ is injective, both Ext¹_ι image spaces have dimension 1+(n−1)(n−2)d and contain the relevant de Rham self-Ext space. For any ι′, equality of either image with the corresponding image of ι is equivalent to ι′=aι for a∈E×. Put φ_end=(φ₁,…,φₙ₋₁), the ordered refinement shared by D₁ and C₁, and T_end=(G_m)^(n−1). Let κ_end,D₁:Ext¹_g(D₁,D₁)→Hom_sm(T_end(K),E) and κ_end,C₁:Ext¹_g(C₁,C₁)→Hom_sm(T_end(K),E) be the §11.2 derivative maps of this ordered refinement restricted to de Rham self-extensions. For every M∈Ext¹_g(C₁,D₁), `kappa_end,D1(iota^(-)M)=kappa_end,C1(iota^(+)M)` as ordered (n−1)-tuples.

(Ding25 Proposition 2.29 and Lemma 2.30, pp. 26–28; Ding25 line 1168.)

One proof proceeds as follows. Compute the kernel from torsion period invariants and obtain the image dimension. Use the de Rham local-condition dimension formula to prove surjectivity onto de Rham self-Ext. If ι′ is not proportional, the two exceptional α_i images would both lie in an image too small for their computed sum. Compare the de Rham rank-one character derivatives under the induced injection between the two self-extensions.

*Needs:* §13.2; §12.2; §11.3.

**Checks.**

- At n=3,d=2 an injective image has dimension 1+2·1·2=5, whereas a noninjective pencil image has dimension 4; zero ι has dimension 0.

- Scaling ι by 2 preserves the image; a nonproportional injection has a different image by the rigidity assertion.

- At n=3, an unramified scalar twist direction ψ gives the ordered pair (ψ,ψ) on both endpoints; a map that reversed the endpoint order would send a general pair (ψ₁,ψ₂) to (ψ₂,ψ₁) and is not the derivative of the ordered refinement φ_end, so the comparison is between two coordinates in fixed order, not one character.

### 13.4 The signed matched-extension relation

Define I_ι as the image of M↦(ι⁻M,−ι⁺M) in Ext¹(D₁,D₁)×Ext¹(C₁,C₁). Equivalently its points are pairs arising from one common extension with the indicated minus sign. For native linear maps f:U→V and g:U→W this is `LinearMap.range` applied to the product of f and −g; it is a submodule, not the product of the two separate ranges.

(Ding25 Formula (2.36) and Corollary 2.31, p. 28; Ding25 line 1224.)

One proof proceeds as follows. Use the linear pullback/pushout maps and the native product linear map. Take its native range; express membership by existence of a common preimage. Keep the sign fixed to match the kernel of the addition map in the higher-intertwining exact sequence.

*Needs:* §13.1; `LinearMap.prod`; `LinearMap.range`.

The reusable interface has the following properties.

- On the actual extension space, take the range of the product of the pullback map and the negative pushout map.

- (v,w) belongs iff ∃u, f(u)=v and −g(u)=w.

- Multiplying both maps by a nonzero scalar preserves the relation.

- Project a related pair to the separate ranges; the converse needs a common preimage.

**Checks.**

- For f=g=0 the relation is the zero subspace.

- For f=g=id_E the relation is the anti-diagonal {(a,−a)}; (1,1) is not related in characteristic zero.

- For f=g=id_E the pair (1,0) lies in the product of ranges but not in the matched relation.

- Scaling both identity maps by 2 preserves the anti-diagonal over E.

- For f=g=id_E, the relation is {(a,−a)} and contains (1,−1); it excludes (1,1) since 1≠−1 in E.

- The product of the separate ranges contains (1,0), but the matched relation does not; scaling both maps by 2 still gives the anti-diagonal.

### 13.5 The matched relation determines the Hodge injection

For injective ι and ι′, `I_iota=I_(iota')` if and only if ι′∈E×ι. For D,D′ in the nonempty family ΦΓ_nc(D₁,C₁,φ_n) with the same fixed endpoints, equality `I_D=I_(D')` is equivalent to equality of the injection lines; when K=ℚₚ it is equivalent to D≅D′.

The family consists of isomorphism classes with the displayed endpoint identifications and Hom(D₁,D)=Hom(D,C₁)=E.

(Ding25 Corollary 2.31, p. 28; Ding25 line 1230.)

One proof proceeds as follows. Project the common signed relation onto either self-Ext space and apply image rigidity. Conversely rescale the common extension variable. Apply §10.4 for the ℚₚ recovery assertion.

*Needs:* §13.4; §13.3; §10.4.

**Checks.**

- Scaling ι by 2 preserves I_ι; ι=0 gives the zero relation and cannot equal the nonzero relation of an injection.

- At d=1 equal injection lines recover isomorphic D; at d=2 the earlier annihilator has dimension 2, so no unmodified isomorphism conclusion is made.

### 13.6 The first/last-filtration higher-intertwining criterion

Let F be D₁⊂D and G be `R(phi_n z^(h_1)) subset D`. In filtration order, F has graded pieces D₁ of rank n−1 and `R(phi_n z^(h_n))`, and G has graded pieces `R(phi_n z^(h_1))` and C₁ of rank n−1; first-order deformations of a rank-one module are Hom(K×,E) by §11.1. Define κ_F=(κ_(F,1),κ_(F,2)):Ext¹_F(D,D)→Ext¹(D₁,D₁)×Hom(K×,E) as §11.6's graded map of F. Define κ_G=(κ_(G,1),κ_(G,2)):Ext¹_G(D,D)→Ext¹(C₁,C₁)×Hom(K×,E) as §11.6's graded map of G, whose target in filtration order is Hom(K×,E)×Ext¹(C₁,C₁), followed by the exchange of the two factors: κ_(G,1) records the quotient C₁ and κ_(G,2) the rank-one submodule. The partial maps κ_(σ,F) and κ_(σ,G) on the partial paraboline spaces of §12.2, for D and for D_σ, are defined in the same way, κ_(σ,G) with the same exchange. These conventions are used in §§13.6–13.15.

For D̃∈Ext¹_F(D,D), write κ_F(D̃)=(D̃₁,ψ). Then D̃ also belongs to Ext¹_G if and only if D̃₁⊗R(1−εψ) belongs to `Ext^1_(iota_D)(D_1,D_1)`. In that case κ_(G,2)(D̃)=ψ and there is M∈Ext¹(C₁,D₁) with D̃₁=ι_D⁻M⊗R(1+εψ) and κ_(G,1)(D̃)=ι_D⁺M⊗R(1+εψ). All Robba coefficients are over K.

(Ding25 Theorem 2.32, pp. 28–29; Ding25 line 1233.)

One proof proceeds as follows. Twist by 1−εψ to reduce to ψ=0. Identify the two filtration conditions as kernels of the relevant pullback/pushout compositions. Use torsion-period invariants to show the intermediate rank-one Ext map is injective. The remaining kernel is the image of Ext¹(C₁,D₁); restore the common twist to read both graded maps.

*Needs:* §11.7; §13.1; PadicHodgeTheory §4.5; §13.3.

**Checks.**

- For a scalar twist D⊗R(1+εψ), twisting its first graded piece by 1−εψ cancels since (1+εψ)(1−εψ)=1.

- At ψ=0 the condition is exactly membership of the pullback image and both graded twists are trivial.

- At n=3,d=1 the filtration-ordered target of G is Hom(K×,E)×Ext¹(C₁,C₁), of dimensions (2,5), whereas κ_G lands in Ext¹(C₁,C₁)×Hom(K×,E), of dimensions (5,2). For the scalar deformation D⊗R(1+εψ) the filtration-ordered output of G is (ψ,C₁⊗R(1+εψ)), and κ_G gives (C₁⊗R(1+εψ),ψ): κ_(G,2)=ψ and κ_(G,1)=ι_D⁺(0)⊗R(1+εψ) with M=0, as asserted. Without the exchange the second coordinate would be C₁⊗R(1+εψ), not ψ.

### 13.7 Two paraboline spaces span self-Ext

dim(Ext¹_F∩Ext¹_G)=1+(n²−2n+2)d, and Ext¹_F+Ext¹_G=Ext¹(D,D). Here each of Ext¹_F and Ext¹_G has dimension 1+(n²−n+1)d. Compute dim(F+G)=dim F+dim G−dim(F∩G), subtracting the whole intersection dimension including its constant term.

(Ding25 Corollary 2.33, p. 29; Ding25 line 1263.)

One proof proceeds as follows. Use the higher-intertwining criterion, the rank-one character space of dimension d+1, and ker κ_F of dimension −1+(n−1)d to compute the intersection. Apply the native submodule dimension identity and compare with dim Ext¹(D,D).

*Needs:* §13.6; §11.7; §11.3; `Submodule.finrank_sup_add_finrank_inf_eq`.

**Checks.**

- At n=3,d=2 each paraboline dimension is 15, intersection dimension 11 and sum dimension 15+15−11=19=1+9·2.

- At n=2,d=1 the dimensions are 4,4,3 and 5=4+4−3; forgetting the intersection constant term would give 6.

### 13.8 All noncritical refinements span the tangent space

The sum map `directSum_(w in S_n) Ext^1_w(D,D) -> Ext^1(D,D)` is surjective, and remains surjective after quotienting by Ext¹₀. This is proved by rank induction from the first/last-filtration spanning theorem and the graded refinement preimage formula, rather than using this result as its own prerequisite.

(Ding25 Proposition 2.12, p. 18, with the rank-induction proof indicated there using Corollary 2.33, p. 29; Ding25 line 801.)

One proof proceeds as follows. For rank one there is a single refinement. Use §13.7 in rank n. Lift spanning refinement directions from the rank n−1 graded module through each paraboline graded map; its kernel is contained in each compatible refinement space. Pass to the common quotient.

*Needs:* §13.7; §11.7; §11.4.

**Checks.**

- At n=2,d=1 the two refinement spaces have dimensions 4 each and intersection dimension 3, so their sum has dimension 5, the full self-Ext dimension.

- At n=3,d=1 the first/last spaces have dimensions 8 and intersection dimension 6, giving 10; induction through rank-two graded pieces supplies all six refinements.

### 13.9 The higher-intertwining relation on tangent quotients

Set V=(barExt¹(D₁,D₁)×Hom(K×,E))⊕(barExt¹(C₁,C₁)×Hom(K×,E)). Define L(D,D₁,C₁) to consist of ((a,ψ),(b,−ψ)) for which representatives ã,b̃ satisfy (ã⊗R(1−εψ), b̃⊗R(1+εψ))∈I_D. Existence of such representatives is required; an unqualified condition on arbitrary representatives before quotienting is insufficient.

(Ding25 Definition preceding Corollary 2.34, p. 30; Ding25 line 1274.)

One proof proceeds as follows. Use the quotient paraboline product isomorphisms, through κ_F and the exchanged κ_G of §13.6, to identify V with barExt¹_F⊕barExt¹_G. Show that changing representatives by Ext¹₀ is absorbed by the de Rham image subspaces in I_D. Apply the signed matched relation after the two opposite twists and prove the result is a linear subspace.

*Needs:* §13.4; §11.4; §11.7; §13.6.

The reusable interface has the following properties.

- Require the signed scalar coordinates and existence of matched twisted representatives.

- The existential condition descends through both zero-parameter quotients.

- For ψ=0 the condition is the image of I_D in the product quotient.

- Identify V with the sum of the two quotient paraboline spaces.

**Checks.**

- Every member has scalar coordinates ψ and −ψ; unrelated coordinates are excluded.

- A pair coming from M gives (([ι⁻M],0),([−ι⁺M],0)).

- Changing either representative by an allowed common zero-parameter class does not change membership.

- At ψ=0 a common M gives the pair ([ι⁻M],[−ι⁺M]) in the relation; using a plus sign on the second entry would fail the sum-map kernel.

- For a scalar twist, (1−εψ)(1+εψ)=1 and the scalar entries ψ,−ψ sum to 0.

### 13.10 A tangent presentation that recovers the Hodge parameter

There is a natural short exact sequence 0→L(D,D₁,C₁)→V→barExt¹(D,D)→0, where the last map adds the two paraboline classes. For fixed endpoints and φ_n, L(D,D₁,C₁)=L(D′,D₁,C₁) if and only if ι_D′∈E×ι_D; for K=ℚₚ this is equivalent to D≅D′.

(Ding25 Corollary 2.34 and (2.40), p. 30; Ding25 line 1292.)

One proof proceeds as follows. Use §13.7 for surjectivity after quotienting. Use §13.6 and the opposite-sign relation to identify the kernel. Set ψ=0 to recover each self-Ext image modulo Ext¹₀; de Rham containment lifts equality to full images. Apply injection rigidity and §10.4.

*Needs:* §13.9; §13.7; §13.5.

**Checks.**

- At n=3,d=1 each endpoint quotient has dimension 5 and each scalar space dimension 2, so dim V=14; target quotient dimension 9 gives relation dimension 5.

- At n=2,d=1, dim V=8 and target dimension 5, so dim L=3, agreeing with the first/last intersection.

### 13.11 Partial extension images recover the modified injection

For injective ι_σ:D₁,σ→C₁,σ, use Ext¹_σ(C₁,σ,D₁,σ) in the pullback and pushout maps. Their image dimensions are 1+(n−1)(n−2), they contain the respective de Rham self-Ext spaces, and equality of either image determines ι_σ up to E×. The signed relation `I_(D_sigma)` determines D_σ up to isomorphism for every K.

(Ding25 Proposition 2.35 and Corollary 2.36, pp. 30–31; Ding25 line 1319.)

One proof proceeds as follows. Repeat the torsion-quotient image computation with the partial local condition. Use the partial B-pair exact-sequence theorem, including its hypotheses, to justify each dévissage rather than treating partial H¹ as automatically exact. Apply the modified Hom-pencil argument and §10.6.

*Needs:* §13.3; §10.6; §12.2; §12.3.

**Checks.**

- At n=3,d=2 the partial injective-image dimension is 1+2·1=3, versus original image dimension 5; the common scalar rescaling leaves both images fixed.

- At n=2 the partial injective-image dimension is 1 and the zero map has image dimension 0.

### 13.12 Higher intertwining with one varying Hodge embedding

For `D_tilde_sigma in Ext^1_(sigma,F)(D_sigma,D_sigma)` with κ_(σ,F)(D̃_σ)=(D̃₁,σ,ψ), ψ∈Hom_σ(K×,E), the additional G-filtration exists exactly when `D_tilde_1,sigma tensor R_(K,E[eps]/eps^2)(1-eps psi)` belongs to the partial injection image. In this case κ_(σ,G,2)(D̃_σ)=ψ, and a common M∈Ext¹_σ(C₁,σ,D₁,σ) gives D̃₁,σ=ι_(D_σ)⁻M⊗R(1+εψ) and κ_(σ,G,1)(D̃_σ)=ι_(D_σ)⁺M⊗R(1+εψ), with κ_(σ,G) exchanged as in §13.6.

(Ding25 Theorem 2.37, p. 31; Ding25 line 1349.)

One proof proceeds as follows. Repeat the first/last-filtration kernel argument using partial Ext. Invoke the requested partial exact-sequence input, with its modified H²-vanishing condition at each dévissage. Use the modified torsion-period vanishing and restore the twist over the K-Robba ring.

*Needs:* §13.6; §13.11; §12.3; PadicHodgeTheory §§4.4–4.5, 5.2; gap:partial-de-rham-cohomology.

**Checks.**

- For ψ=log_σ, the cancelling products of first-order twists are 1; for ψ=log_τ with τ≠σ the deformation violates the specified partial condition.

- At ψ=0 the partial criterion is exactly membership in the partial injection image.

### 13.13 The single-embedding higher-intertwining relation

Set V_σ=(barExt¹_σ(D₁,σ,D₁,σ)×Hom_σ(K×,E))⊕(barExt¹_σ(C₁,σ,C₁,σ)×Hom_σ(K×,E)), using the modified de Rham zero subspaces. Define L_σ(D_σ,D₁,σ,C₁,σ) by the signed opposite-twist representative condition with `I_(D_sigma)`, exactly as in §13.9. Both the C₁,σ endpoint and the σ-subscript on the partial condition are essential.

(Ding25 Definition preceding Corollary 2.38, pp. 31–32; Ding25 line 1356.)

One proof proceeds as follows. Use the partial graded quotient products through κ_(σ,F) and the exchanged κ_(σ,G), and the modified zero subspaces. Descend the partial matched relation through those quotients using its de Rham image containment. Verify compatibility with the scalar σ-analytic character coordinates.

*Needs:* §13.12; §12.6; §13.9.

The reusable interface has the following properties.

- Use partial Ext and the modified quotient kernels.

- Descend the opposite-twist condition to quotient classes.

- Read ψ∈Hom_σ and the opposite coordinate −ψ.

**Checks.**

- For K=ℚₚ this reduces to the original L relation.

- For d=2 and τ≠σ, the scalar coordinate ψ=log_τ is not σ-analytic: its derivative along the τ-direction of the units is 1, so ψ∉Hom_σ(K×,E) and no element of V_σ has scalar coordinates (ψ,−ψ), although ψ+(−ψ)=0; for ψ=log_σ that derivative is 0 and the pair is admissible. Cancellation of the scalar coordinates alone does not impose the σ-condition.

- For n=2,d=2 use the zero modified de Rham kernel, not the one-dimensional full refinement kernel.

- At n=2,d=2 the modified endpoint quotients use the zero de Rham kernel, giving endpoint dimensions 2 and scalar dimensions 2; both scalar entries are ψ and −ψ.

### 13.14 The single-embedding recovery exact sequence

There is a short exact sequence 0→L_σ(D_σ,D₁,σ,C₁,σ)→V_σ→barExt¹_σ(D_σ,D_σ)→0. For fixed endpoints and φ_n, equality of these L_σ relations is equivalent to D_σ≅D′_σ, for every finite K/ℚₚ. Hence the relation determines the original σ-Hodge filtration.

(Ding25 Corollary 2.38 and (2.42), p. 32; Ding25 line 1367.)

One proof proceeds as follows. Apply the partial higher-intertwining criterion to identify the kernel. Compute the partial first/last-filtration intersection and sum to prove surjectivity. Use partial image rigidity and the one-dimensional modified annihilator for recovery.

*Needs:* §13.13; §13.11; §10.6.

**Checks.**

- At n=3,d=2 each modified partial endpoint quotient has dimension 5 and scalar dimension 2, so dim V_σ=14; target quotient dimension 9 and relation dimension 5 give 14=9+5.

- For d=1 these dimensions and the entire sequence equal the unmodified ones.

### 13.15 Modification identifies the two recovery sequences

Let V(D₁,C₁)_σ be the partial subspace of V and L(D,D₁,C₁)_σ=L∩V_σ. Modification T_σ identifies its exact sequence 0→L_σ→V_σ→barExt¹_σ(D,D)→0 with the modified sequence of §13.14, by isomorphisms on all three terms. Thus the original module’s partial tangent relation recovers its σ-Hodge filtration.

(Ding25 Proposition 2.39, p. 32; Ding25 line 1386.)

One proof proceeds as follows. Use §12.7 for the two endpoint and target quotient isomorphisms. Check commutativity of pullback, pushout, character twists and modification. Transfer exactness and identify the kernel relation.

*Needs:* §12.7; §13.10; §13.14.

**Checks.**

- At n=3,d=2 the original and modified partial quotient targets both have dimension 9, each V-term dimension 14 and each relation dimension 5; quotienting removes kernels of dimensions 4 and 1 respectively.

### 13.16 Partial refinement spaces generate all partial deformations

For both D and D_σ the map `directSum_(w in S_n) Ext^1_(sigma,w) -> Ext^1_sigma` is surjective, as is its barExt quotient. This generation statement includes the original and modified modules with their different zero kernels.

(Ding25 Corollary 2.40 and its proof, p. 32; Ding25 line 1396.)

One proof proceeds as follows. Use §13.15 to span the quotient partial tangent space by the first/last paraboline spaces. Induct on rank using the partial graded product and compatible-refinement preimage formulas. Since the relevant Ext¹₀ lies in every compatible refinement, lift quotient surjectivity to full partial Ext.

*Needs:* §13.15; §12.2; §12.6.

**Checks.**

- At n=2,d=2 the original partial full, refinement and first/last-intersection dimensions are 6,5,4, giving 5+5−4=6; the modified dimensions are 5,4,3, giving 4+4−3=5.

### Examples

For f=g=id_E, the matched relation is {(a,−a)}. Its two projections are both all of E, but (1,0) is not related. For n=3,d=1, each first/last paraboline space has dimension 8 and their intersection dimension 6, giving 8+8−6=10=dim Ext¹(D,D). The common-preimage sign and the full intersection subtraction are independent checks.

### Dependencies

§10.2; PhiGammaModulesAndIwasawaCohomology §3.4a; `LinearMap.range`; §10.3; PadicHodgeTheory §4.5; `Submodule.finrank_sup_add_finrank_inf_eq`; §12.2; §11.3; `LinearMap.prod`; §10.4; §11.7; §11.4; §10.6; §12.3; PadicHodgeTheory §§4.4–4.5, 5.2; §12.6; §12.7.

## Downstream consumers

PadicHodgeParametersInLocallyAnalyticRepresentations TR1–TR5 consume the refinement derivatives, paraboline products, injection images, higher-intertwining relations and σ-partial recovery sequences of Layers 10–13. Its locally analytic representation comparison supplies no prerequisite here.

PadicFamilies, CompletedCohomologyAndLocalGlobalCompatibility and ModularityAndLanglandsExtensions consume none of its results; the latter two are suppliers named above. The local companion criterion and the crystalline cycle theorems assert no global companion, socle or automorphy statement.

## Worked examples

For K=ℚₚ,n=2 and generic split crystalline r=χ₁⊕χ₂ with labelled weights h₁<h₂, choose the reversed dominant parameter `(z^(h_2) unr phi_1,z^(h_1) unr phi_2)`. The trianguline space is smooth of dimension 7. Its full-character completed fibre is reduced with two components of dimension 3, one crystalline and one noncrystalline; its unit-weight fibre has dimension 5. The fibre cycle has two generic multiplicities 1. Thus flatness and smoothness of the source do not imply smoothness of either projection (BHS19 example following Theorem 1.9, p. 305; BHS19 line 262).

For an unramified quadratic K/ℚₚ, n=3 and off-σ weights (3,1,0), the modification has off-σ weights (0,0,0), and both endpoints have (0,0). At σ take the Hodge line E(e₁+2e₂+e₃) in the plane spanned by e₁+e₂ and e₁+2e₂+e₃. The induced endpoint top lines are E(e₁+e₂) and E(e₁+2e₂); their injection line recovers a=2. The plane normal (1,−1,1) has no zero coordinate, whereas at a=1 it would have a zero third coordinate. The excluded a=0 gives a zero second line coordinate (Ding25 Example 2.9, pp. 14–15; Ding25 line 617).

At n=3,d=2, first and last paraboline tangent spaces each have dimension 15 and intersection dimension 11. Their sum dimension is 19=1+n²d. The original σ-partial quotient has dimension 13−4=9, the modified one 10−1=9. Their recovery sequences have middle dimension 14 and relation dimension 5. These computations distinguish full self-Ext generation, partial generation and the two different zero kernels (Ding25 Corollaries 2.27, 2.33, 2.38, pp. 25, 29, 32; Ding25 lines 1098, 1263, 1367).

## References

- **BHS19**. Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [A local model for the trianguline variety and applications](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf). Publications Mathématiques de l’IHÉS 130 (2019), 299–412. Locators use this linked version.
- **Ding25**. Yiwen Ding, [p-Adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf). Publications Mathématiques de l’IHÉS 142 (2025), 1–74. Locators use this linked version.
- **NT21**. James Newton and Jack A. Thorne, [Symmetric power functoriality for holomorphic modular forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf). Publications Mathématiques de l’IHÉS 134 (2021), 1–116. Locators use this linked version.
- **Colmez08**. Pierre Colmez, [Représentations triangulines de dimension 2](https://www.numdam.org/item/AST_2008__319__213_0.pdf). Astérisque 319 (2008), 213–258. Locators use this linked version.
- **BHS17**. Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [Une interprétation modulaire de la variété trianguline](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/eigenvariete.pdf). Author final copy; Mathematische Annalen 367 (2017), 1587–1645. Locators use this linked version.
- **BHSsmooth17**. Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [Smoothness and classicality on eigenvarieties](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/classicite.pdf). Author final copy; Inventiones Mathematicae 209 (2017), 197–274. Locators use this linked version.
- **HartlHellmann**. Urs Hartl and Eugen Hellmann, [The universal family of semi-stable p-adic Galois representations](https://arxiv.org/pdf/1312.6371v2). arXiv:1312.6371v2 (16 January 2020); published Algebra & Number Theory 14 (2020), 1055–1121. Locators use this linked version.
- **Ding19**. Yiwen Ding, [Companion points and locally analytic socle for GL₂(L)](https://arxiv.org/pdf/1602.08859v2). arXiv:1602.08859v2 (21 February 2019); published Israel Journal of Mathematics 231 (2019), 47–122. Locators use this linked version.
