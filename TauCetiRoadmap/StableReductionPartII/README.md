# Roadmap: stable reduction of curves, Part II

**Summary.** StableReduction ends with curve families, stabilization and stable reduction over traits. This continuation develops the explicit geometry of their moduli: tricanonical frames, the pointed-node dual ideal, expansion and contraction, decorated boundary normalization, integral Hodge and Noether comparisons, stable compactifications, Torelli and degree-Picard parameters. It uses the stable-stack and projective-level theorems of SchemeAndStackFoundations §4.15. Its end results prove, coherently over all schemes, the identification of the unrestricted universal curve with the added-marking moduli problem that SchemeAndStackFoundations §4.15 states, give the integral Noether line isomorphism, extend families after finite base change, prove Hodge positivity under maximal variation, and distinguish relative Picard classes from their actual lifts. [Suggested.lean](Suggested.lean) states the local headline theorems on native polynomial quotients; the geometric targets are specified here.

## Scope and ownership

The owned constructions are the explicit tricanonical comparison, the coefficient-general quadratic section ideal and its dual, arbitrary-coefficient and completed-local comparisons, the expansion charts and their coherent inverse comparison, decorated node incidence, marking-line and determinant signs, the integral Noether comparison and moduli-specific compactification, Torelli and Picard applications. Finite-free and finite-projective tensor/limit comparisons keep the original and completed coefficient rings distinct. They do not imply arbitrary-module interchange or completed-ring Hom/Ext comparison; those are the separate relative stable-reflexivity, hull, globalization and approximation targets in Layer 2. The polynomial theorem permits a zero coefficient ring and a repeated quadratic root; the geometric nodal theorem requires the nondegeneracy and finiteness hypotheses stated in its section.

The following objects are in the library or stated by the named roadmap and are consumed rather than declared again:

- StableReduction Layers 1–3 supply nodes, normalization and dual graphs, coherent curve duality, log stability, smooth-section pushouts and the single-mark contraction; Layers 8–9 supply stable reduction and unique extension over traits. Its stable-map objects and map-aware stabilization remain there.
- SchemeAndStackFoundations §4.15 supplies the stable pointed stack, its finite unramified Isom, proper smooth Deligne–Mumford structure, smoothing coordinates, normal-crossings boundary, universal forgetting with its stated identification of `M̄_{g,n+1}` as the universal curve (`Mbar.forget`), normalized level covers, pluricanonical nefness, determinant-quotient ampleness and projective level covers. Its §§1.18–1.23 supply stacks, coarse spaces and their universal properties. In §4.15, `stableCurveDirectImage_nef` includes the curve-test criterion, quotients, extensions, symmetric powers and finite pullback/descent; `determinantQuotient_ample` includes the Grassmannian positivity argument. These generic constructions remain with that owner. The explicit framed charts and decorated-node comparisons here refine those statements; they do not add a second terminal stable-stack theorem. Layer 2 §2.248 supplies the proof route of the universal-curve identification and its coherent inverse over arbitrary schemes; it does not plan that identification a second time.
- AlgebraicVectorBundles L0A–L0C supplies sheaf tensor, dual, finite local freeness, symmetric/exterior powers and ordinary determinants with pullback. PadicMeasuresIwasawaAlgebras §5.1 supplies the ring-level parity-graded determinant; the integer-grade refinement and geometric descent are the distinct contracts below. JacobianChallengePartII §1.3a supplies determinant of cohomology for its smooth Noetherian curve families. Their arbitrary-base nodal and stack descent extensions are supplier contracts below.
- JacobianChallenge Layers A–F and JacobianChallengePartII §§0.1–0.4, 1.1–1.4, 4.4 and 6.1–6.3 supply degree-Picard components, relative Jacobians, principal polarization, the Picard obstruction and stable Hodge comparisons. The applications here classify the universal curve family and its lifts. They do not reconstruct the relative Jacobian.
- AbelianSchemesAndArithmeticModuliPartII §B4.1 owns the characteristic-zero fine symplectic curve-level scheme M_g[ℓ] over ℚ(ζ_ℓ), its universal curve, finite étale level changes and quasi-finite Torelli map. The targets here extend these over Z[1/N,ζ_N], including every residue characteristic prime to N, and identify their restriction to ℚ(ζ_N) with that construction.
- SchemeAndStackFoundations §4.15 `level_structure_cover_ample` owns the uniform tricanonical equations on the integral normalized level cover and its single ample determinant line; the coarse projectivity here transports that line.
- K3SurfacesAndSymplecticBoundedness §6.0b owns the genus-one canonical formula and Hodge-line degree used by the weighted positivity argument.
- NeronModelsAndSemistableAbelianVarieties §§4.1 and 4.13 supplies normalization sequences and the semi-abelian Picard identity component of an integral Noetherian stable family. PELModuli §§M5.1–M5.3 and M6.9–M6.10 supplies ppav level moduli and Hodge lines. ShimuraCompactifications Layers 6–7 supplies its integral minimal compactification interfaces in their stated base range.
- ModularCurvesPartII §§2.1–2.3 and 2.11 supplies the generalized elliptic groupoids and polygon-count stacks; polygon count one gives the integral proper smooth Deligne–Mumford stack with constant C₂ cusp inertia. The construction here compares this groupoid with stable one-pointed genus-one curves. ModularCurves §§1C–1D, 2D, 4A–4B and 9E supplies the elliptic groupoid, Weierstrass changes, group-law uniqueness and coarse j-line. AlgebraicCurves Layers 0–12 retains the function-field, divisor and Riemann–Roch dictionaries.
- ComplexCurveModuli D7 constructs the universal curve, marking operations and external and self-clutching on the analytic stable pointed chart groupoid over ℂ; the clutching morphisms, boundary normalization and cotangent lines of Layer 3 here are morphisms of algebraic stacks over arbitrary schemes, a different carrier.
- StablePeriodicCurved Layer 2 and Tau Ceti's total-acyclicity module supply finite-projective complete resolutions and Gorenstein-projective modules. The relative flat-cycle and coefficient-universal conditions here are stronger comparisons on these objects.
- Mathlib supplies polynomial quotients, tensor products, duals, categorical Ext, completion and limits. In `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, `TensorProduct.piScalarRight`, `TensorProduct.piScalarRightHom_tmul` and `TensorProduct.piScalarRight_symm_single` supply finite coordinates. In `Mathlib/RingTheory/AdicCompletion/Basic.lean`, `AdicCompletion.transitionMap_comp_eval_apply` supplies completion compatibility; the targets here compare these maps with the specific coefficient and quotient diagrams. Tau Ceti supplies the split smoothing algebra, its Jacobian singular subscheme, curve-family predicate and absolute line-bundle class group. The pointed quadratic section model differs by retaining the arbitrary section, nonsplit quadratic form and dual-ideal data.

## Conventions

Work in a fixed scheme universe; small diagram and module universes are retained explicitly. The finite-free completion comparisons use a common coefficient/module universe. A stable pair has g,n in ℕ and the integer inequality 2g−2+n>0. The stack `M̄_{g,n}` has ordered disjoint markings in the relative smooth locus and marking-preserving isomorphisms; `M_{g,n}` is its smooth-family open. Families are proper flat finitely presented, geometrically connected and nodal, of pure relative dimension one. General constructions are over arbitrary schemes; a Noetherian, integral or field hypothesis in a target restricts that target only. No scalar characteristic is excluded without an explicit hypothesis.

An additional section of the universal curve is unrestricted. It may be a node or an old mark; expansion makes it a disjoint smooth new mark. A represented two-fibre product retains its chosen family identification. Projectivization parametrizes invertible quotients; Proj of the expansion sheaf does not assume that sheaf locally free. For g≥2, tricanonical rank is 5g−5, projective dimension 5g−6, degree 6g−6, and Hilbert polynomial (g−1)(6T−1). A projective frame permits the base-line twist O_C(1)≅ω³⊗f*B.

Rings are commutative with identity, including the zero ring for polynomial assertions. Write M*=Hom_R(M,R), with canonical evaluation into M**. For (A,p)→(R,m), completions Â and R̂ retain their own ideals and scalar rings; Hom_R and Hom_R̂ remain distinct. Tensor over A and tensor over Â have different balancing relations. A finite-projective tensor/limit comparison is not an arbitrary-module comparison.

For smooth curve level take g≥2 and N≥3 invertible on the base. Similitude frames include their primitive multiplier; exact symplectic frames use Spec ℤ[1/N,ζ_N]. Curve cohomology versus Jacobian torsion retains the dual and Tate twist. A constant finite branch-exchange group remains a stack stabilizer even in characteristic two.

The untwisted Hodge bundle is E=f_*ω and λ=det E; rank-zero determinant is O. Ordered Hodge exchange has sign `(−1)^{g₁g₂}`. Smoothing conormal L_a⊗L_b has unsigned branch exchange, whereas residue reversal changes sign. Determinants are formed with their integer grades before comparison maps forget the grades. The symmetry ⟨L,M⟩≅⟨M,L⟩ of the Deligne pairing is Deligne's isomorphism built from symbols and norms, sending ⟨l,m⟩ to ⟨m,l⟩; on ⟨L,L⟩ it acts by `(−1)^{deg L}`. The Koszul permutation of the two factors d(L)∨ of the four-determinant expression acts by `(−1)^{χ(L)}`, so on the diagonal the symmetry is that permutation multiplied by `(−1)^{χ(O_C)}`. Relative Picard points are fppf-sheafified line classes. Actual lifts have scalar automorphisms; when nonempty, their global isomorphism classes form a Pic(T)-torsor.

**Checks.**

- At (g,n)=(0,3), stability degree is −2+3=1 and moduli dimension is −3+3=0; at (0,2) stability degree is 0. This excludes nonnegative degree as a stability definition.
- At g=2, tricanonical rank is 5, ambient dimension 4, degree 6 and Hilbert polynomial 6T−1; at T=1 it equals 5. Confusing rank with projective dimension fails this witness.
- Exchanging two genus-one Hodge factors has sign −1; exchanging factors of ranks one and two has sign +1. Interchanging the two smoothing cotangent factors is +1 in both cases. Residues (r,−r) become (−r,r).
- On ℙ¹, the determinant grades of O(1), O and O(−2) are 2, 1 and −1; [R → R] with identity differential in degrees 0,1 has grade 0. The symmetry of ⟨O(1),O(1)⟩ on ℙ¹ is (−1)^1=−1 in characteristic different from two, and the symmetry of ⟨ω,ω⟩ in genus g is `(−1)^{2g−2}=+1`. The bare Koszul permutation gives `(−1)^{χ(O(1))}=(−1)^2=+1` on ℙ¹ and `(−1)^{χ(ω)}=(−1)^{g−1}` on ⟨ω,ω⟩, so it is not the symmetry; the factor `(−1)^{χ(O_C)}`, which is −1 on ℙ¹ and `(−1)^{1−g}` in genus g, restores −1 and +1.
- With N=3, multiplier 2 becomes multiplier 1 after precomposition by diag(2I_g,I_g), since 2·2=1 in ℤ/3ℤ. A multiplier without its component is insufficient.

## Exact supplier contracts

### From Mathlib

Use `AlgebraicGeometry.Scheme` and `CategoryTheory.Pseudofunctor.IsStack` on the scheme fppf site, and native `MvPolynomial`, `AdjoinRoot`, `Ideal`, `Module.Dual`, `Module.IsReflexive`, `TensorProduct`, `Matrix.mulVecLin`, `LinearMap.restrictScalars`, `LinearMap.rTensor`, `AdicCompletion` and `CategoryTheory.Limits.limit`. Scheme objects do not include genus or marked stability; the stack predicate asserts descent, not representability. The matrix and tensor maps retain the displayed scalar ring. The polynomial quotient and dual carriers use the native ideal and linear-map modules.

The reusable module interfaces are in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, `Mathlib/LinearAlgebra/Dual/Defs.lean`, `Mathlib/RingTheory/AdicCompletion/Basic.lean`, `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean`, `Mathlib/CategoryTheory/Abelian/Ext.lean` and `Mathlib/Algebra/Category/ModuleCat/Limits.lean`. The finite-presentation, flatness, finite-projective and completion hypotheses of the named applications below are retained.

Use `TensorProduct.piScalarRight`, `TensorProduct.piScalarRightHom_tmul` and `TensorProduct.piScalarRight_symm_single` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, lines 163, 140 and 176, directly. Use `AdicCompletion.transitionMap_comp_eval_apply` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`, line 414, for the native transition law; the coefficient-linear and two-base comparisons below retain their additional scalar hypotheses.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.FamilyOfCurves` in `TauCeti/AlgebraicGeometry/Curves/Family.lean`: proper, flat, locally finitely presented and relative dimension at most one; it imposes neither geometric connectedness nor exact genus nor pure dimension one. Use `TauCeti.NodeAlgebra` in `TauCeti/RingTheory/Node/Basic.lean`, `TauCeti.NodeAlgebra.jacobianQuotientEquiv` in `TauCeti/RingTheory/Node/Jacobian/Locus.lean`, and the singular-locus comparison in `TauCeti/AlgebraicGeometry/Curves/Node/SingularLocus.lean`. Use `CochainComplex.IsTotallyAcyclic` and `TauCeti.IsGorensteinProjective` in `TauCeti/Algebra/Homology/TotallyAcyclic.lean`; every term is finite projective and both the complex and its ring-dual are acyclic. Use `TauCeti.AlgebraicGeometry.LineBundleClass` in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` as the absolute Picard group; `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk` (line 104) identifies inversion with the class of the dual, and the CommGroup instance is at line 142.

### From TauCetiRoadmap.StableReduction

What StableReduction must provide (gap:relative-node-branch-data): For a proper flat finitely presented nodal family, provide its finite unramified relative singular scheme, its étale-local node and branch labels, and, over a persistent chosen node, the simultaneous partial normalization with two smooth sections and locally constant arithmetic genera on the open-and-closed separating and nonseparating type loci, coherently under base change. (Layer 1.)

What StableReduction must provide (gap:stable-tricanonical-embedding): For every geometrically connected projective nodal stable curve C of arithmetic genus g≥2 over an algebraically closed field of any characteristic, including reducible curves and curves with self-nodes, prove that ω_C³ is very ample and H¹(C,ω_C³)=0. (Layer 8.)

Layers 1–3 and 8–9 supply the exact family, nodality, normalization, duality, log-stability, one-mark contraction and stable-reduction contracts described under Scope and ownership, including the universal global-functions comparison under every base change. Locally Noetherian coherent results are extended only through Layer 0 finite-diagram approximation and the explicit duality contracts.

### From TauCetiRoadmap.SchemeAndStackFoundations

What SchemeAndStackFoundations must provide (gap:numerical-nef-big-transfer): For a projective integral d-dimensional scheme X over any field and an invertible line L, provide field-extension invariance of nefness and bigness, detection on the normalized reduced geometric components with their generic multiplicities, for finite surjective h:Y→X with Y integral, the degree formula (c₁(h*L)^d·[Y])=deg(Y/X)(c₁(L)^d·[X]), and the criterion that a nef L is big exactly when (c₁(L)^d·[X])>0, including d=0. (§§5.1–5.10.)

What SchemeAndStackFoundations must provide (gap:surface-low-genus-positivity): For a relatively minimal smooth projective surface fibred over a smooth projective curve over an algebraically closed field, with smooth geometrically connected generic fibre, supply the genus-zero Hodge-index section argument and, in genus one with a section, χ(O_S)≥0 and the resulting nefness of the weighted pluricanonical direct images, using the canonical formula of K3SurfacesAndSymplecticBoundedness §6.0b, including positive characteristic; permit finite surjective base change to acquire a section and retain the actual pushforward comparisons. (§5.10.)

What SchemeAndStackFoundations must provide (gap:weighted-collision-transport): Let f:S→B be a projective nodal fibration from a smooth surface to a smooth projective connected curve over an algebraically closed field, with smooth geometrically connected generic fibre, and let D_i be generically distinct smooth-locus sections; for a sequence of smooth-point blowups b:S′→S such that f′=f∘b is nodal and the strict transforms D′_i are disjoint smooth-locus sections, m≥2 and 0≤a_i≤m, prove that nefness of E=f_*ω_(S/B)^m(Σa_iD_i) implies nefness of E′=f′_*ω_(S′/B)^m(Σa_iD′_i), meaning every quotient line of h*E′ has nonnegative degree for every finite morphism h:B′→B from a smooth projective curve; the comparison must retain the coefficient m−Σ_(i through p)a_i and b_*O(−kE_p)=I_p^k for negative discrepancies, without imposing Σa_i≤m. (§5.10.)

What SchemeAndStackFoundations must provide (gap:surface-pluricanonical-comparison): For a projective nodal fibration over a smooth curve with smooth generic fibre, resolve its isolated rational double points crepantly, preserving every relative pluricanonical direct image; for a blowup b:S′→S of a smooth point, prove K_(S′/B)=b*K_(S/B)+E and b_*O(kE)=O for k≥0, while b_*O(−kE)=I_p^k for k≥0. (§5.10.)

What SchemeAndStackFoundations must provide (gap:surface-general-type): Over an algebraically closed field of any characteristic, for a smooth projective surface fibred over a smooth projective connected curve B with geometrically connected smooth generic fibre of genus at least two and g(B)≥2, prove that the surface has Kodaira dimension two and that its minimal model is a smooth projective surface of general type. (§5.10.)

What SchemeAndStackFoundations must provide (gap:formal-proj-completed-cokernel): For a Noetherian ring R, an ideal I and a finite R-module K, identify the I-adic formal completion of Proj_R Sym K with the compatible Proj models of K/I^nK, preserving tautological quotient maps and finitely presented cokernel sections; for a proper finite-presentation morphism over a Noetherian local base, supply detection of flatness along its closed fibre by the faithfully flat completed local maps. (§§0.3, 4.10.)

What SchemeAndStackFoundations must provide (gap:relative-boundary-coordinates): For a smooth finite-presentation scheme T over a base S and functions a₁,…,aδ whose relative differentials are independent at a point, provide smoothness of (a₁,…,aδ):T→A^δ_S near that point, extension to relative étale coordinates, and smooth-atlas descent of the resulting relative normal-crossings Cartier divisor. (§§0.8, 4.1.)

What SchemeAndStackFoundations must provide (gap:coefficient-completion-smoothness): For a finitely presented scheme over ℤ and a geometric point with residue k, provide faithful-flat comparison after extension to k in characteristic zero or W(k) in characteristic p and completion, detecting invertible ideals, regular sequences, relative smoothness and their finite intersections from the corresponding coefficient power-series presentations. (§§0.21, 4.1, 4.10.)

What SchemeAndStackFoundations must provide (gap:coherent-curve-deformation-ext): For a proper nodal curve C over an algebraically closed field and coherent F,G with F locally having a finite locally free resolution, provide the local-to-global spectral sequence H^p(C, sheaf-Ext^q(F,G))⇒Ext^(p+q)(F,G), its edge maps and finite-support H¹ vanishing, with the local hypersurface cotangent resolution at a node. (§§2.18, 4.5–4.6.)

Use §§0.3, 0.8–0.9, 0.11 and 0.17–0.21 for relative Proj, approximation, local criteria and finite normalization; §§1.1–1.2 and 1.18–1.23 for descent, stacks, finite diagonals, quotient stacks and coarse spaces; §§2.1–2.2, 2.6 and 2.18–2.22 for cohomology and duality; §§3.3–3.7 for degree, Picard groupoids and obstruction conventions; §§4.1–4.10, 4.14–4.15 for deformations, Hilbert, stable moduli and normalized projective level; §§5.1–5.10 for intersection theory within their stated scheme and base range. The terminal stable-stack results are consumers of their generic foundations, never premises for their own chart proof refinements. Use §4.15 `stableCurveDirectImage_nef` for the generic curve-test nefness operations (quotients, extensions, symmetric powers and finite pullback/descent), and `determinantQuotient_ample` for the determinant-quotient and Grassmannian criterion. The marked nodal-model transport is the distinct gap:weighted-collision-transport.

What SchemeAndStackFoundations must provide (gap:cm-duality-arbitrary-base): Extend rigid relative duality to arbitrary-base flat finitely presented Cohen–Macaulay maps of pure relative dimension d, with a base-flat dualizing module in degree −d, Gorenstein invertibility and coherent arbitrary base change. (§2.20.)

What SchemeAndStackFoundations must provide (gap:source-dense-valuative): Provide the locally Noetherian source-dense trait criterion for properness of the universal finite-presentation Isom relation with its separation and generic-density hypotheses, before specialization to arbitrary pairs of stable curves. (§§1.9, 4.15.)

What SchemeAndStackFoundations must provide (gap:finite-scheme-cover): Provide a representable finite surjective scheme cover of every finite-type algebraic stack with quasi-finite diagonal over a Noetherian base and finite-surjective detection of relative ampleness on proper algebraic spaces. (§1.20.)

What SchemeAndStackFoundations must provide (gap:coarse-line-power): For a quasi-compact separated finite-type Deligne–Mumford stack over a Noetherian base, provide descent of a positive power of an invertible sheaf to its coarse space with the actual norm cocycle, including non-tame residue characteristics. (§1.23.)

What SchemeAndStackFoundations must provide (gap:positive-surface-twist): Over an algebraically closed field k, for a smooth projective minimal surface S of general type and a reduced effective Cartier divisor D whose connected components have genus at least two and whose normal line O_S(D)|_D is trivial, prove h¹(S,ω_S^m(D))=0 for m≥2 unless char(k)=2 and m=2, when it is at most one. (§5.10.)

What SchemeAndStackFoundations must provide (gap:graded-perfect-stack-descent): Refine the parity-graded ring determinant to integer-graded lines, then descend to schemes and stack atlases with exact-sequence, shift, quasi-isomorphism and arbitrary proper-flat perfect-pushforward comparisons, extending the smooth Noetherian curve determinant. (§§1.22, 2.18.)

What SchemeAndStackFoundations must provide (gap:integral-deligne-pairing): Provide the integral four-determinant Deligne pairing for locally projective faithfully flat finitely presented pure curve morphisms over arbitrary bases, with coherent bilinearity, base change, norm and scalar laws, and Deligne's symmetry isomorphism ⟨L,M⟩≅⟨M,L⟩ built from symbols and norms, which acts on ⟨L,L⟩ by `(−1)^{deg L}`. (§3.4.)

What SchemeAndStackFoundations must provide (gap:stack-chow-grr): Provide rational codimension-one Chow and Picard comparison, proper pushforward, Chern and projection laws and Grothendieck–Riemann–Roch on the smooth Deligne–Mumford moduli stack needed by the Noether computation. (§§5.1–5.8.)

The surface contracts use [clm](#references), Lemma 6.4, p. 23 (clm line 918), Lemma 6.5 and Proposition 6.3, pp. 23–25, and Proposition 6.7, pp. 25–27. In positive characteristic the general-type input is [mc4-chen-zhang](#references), Theorem 1.3, p. 2 (mc4-chen-zhang line 56): both genera at least two give κ(S)≥1+1=2. The characteristic-zero nefness argument uses spreading as in [clm](#references), Proposition 6.3, pp. 24–25; it does not apply that positive-characteristic theorem directly to a characteristic-zero surface. The marked-model transport contract asks for the additional comparison in that argument; the displayed blowup identity alone does not give nefness of a negative elementary modification.

**Checks.**

- For S=C₂×ℙ¹ and D=C₂×{point}, the normal line is trivial but S is not general type. At m=2, h¹(ω_S²(D))=h⁰(ω_C₂²)h¹(O_ℙ¹(−3))=3·2=6. This is excluded by the general-type hypothesis, not assigned the bound one.
- In characteristic two at m=2 the positive-twist bound is at most one; a contradiction with a Frobenius-produced lower bound two still follows from 2>1. For m=3 or characteristic three the asserted bound is zero.
- For a smooth point blowup and m=2, no incident marks give coefficient 2 and pushforward O; two incident weights 2 give coefficient −2 and pushforward I_p². Nefness of an unmodified bundle does not identify these sheaves.
- A fibration with both base and smooth generic fibre of genus two has general-type minimal model. C₂×ℙ¹ with projection to ℙ¹ fails the base-genus hypothesis; its Kodaira dimension is −∞.
- For a constant elliptic product E×B the relative dualizing line is O and χ(O_(E×B))=0. In genus zero, no weights give degree −2m on a fibre and zero pushforward; total weight 2m gives fibre degree zero and rank one.

#### Graded determinant of cohomology

For schemes, realize the commutative-ring virtual determinant in graded invertible sheaves, descend it from finite-projective complexes to perfect complexes and glue. For proper flat finitely presented f, perfect E has perfect Rf_*E and λ_f(E)=det Rf_*E commutes with arbitrary derived base change. Locally λ_f(E) has line `⊗_i(det P^i)^{(−1)^i}` and grade Σ_i(−1)^i rank(P^i) for a finite-projective model of Rf_*E. Quasi-isomorphisms and acyclic models have the specified canonical comparisons; exact-sequence and shift comparisons retain Koszul signs. This is not the assertion that every distinguished triangle has a functorial arbitrary-triangle determinant isomorphism.

*Needs:* AlgebraicVectorBundles L0A–L0C; PadicMeasuresIwasawaAlgebras §5.1; SchemeAndStackFoundations §§1.1, 1.22, 2.18, 3.4.

The supplier provides the following comparison laws.

- On an affine and a degree-zero finite projective module, agree with AV-L0C exterior determinant, with grade equal to its rank.
- An acyclic perfect complex has the canonical determinant trivialization, compatible with quasi-isomorphisms.
- A short exact sequence of perfect complex models gives a natural additivity isomorphism with the Knudsen–Mumford coherence laws.
- Shifting by one inverts the graded line; the integer grade changes sign.
- For every S′→S, derived base change identifies pullback of λ_f(E) with λ_f′(Lh*E), with identity and composition cocycles.
- Use actual curve Serre duality to compare det Rf_*O and det Rf_*ω with the ordinary Hodge determinant; do not identify their integer grades.

**Checks.**

- For R² in degree zero the line is ∧²R² and the grade is 2; exchanging the two standard basis vectors acts by −1.
- For [R --id→ R] in degrees 0,1 the grade is 0 and the canonical acyclic determinant is R.
- For R concentrated in degree 1 the determinant line is R∨ and its grade is −1, rather than +1.
- The required base-change map exists for Spec(F_p)→Spec(Z); requiring this map to be flat fails the contract.
- For P¹_R→Spec(R), λ(O(1)) is det(R²) of grade 2, while λ(O(−2)) has grade −1; these are not both H⁰ determinants.

**Sources.** [Finn Faye Knudsen; David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf), §1, pp. 20–21; Lemma 2, p. 28; bounded-complex formula, pp. 30–32: Supplies graded lines, their sign symmetry and the passage from complexes to determinant data.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Propositions 4.14(2), 4.15(2), Definition 4.16, pp. 286–287 (mc5-erikssonfreixas2024 line 1778): Gives the proper flat finite-presentation perfect pushforward and arbitrary-base-change range, including non-Noetherian bases.

#### Integral Deligne pairing

For f:X→S locally projective, faithfully flat, finitely presented and of pure relative dimension one, construct the integral Deligne pairing on actual line bundles, with arbitrary base change. Put d(A)=underlying line of λ_f(A). In the fixed order, ⟨L,M⟩=d(L⊗M)⊗d(O_X)⊗d(L)∨⊗d(M)∨. The determinant calculation is made in graded lines before passing to its grade-zero line. Coherent bilinearity, permutation, norm and divisor comparisons are data to prove, not consequences of an equality in K₀ or Pic⊗Q. No smoothness or Noetherian assumption is imposed.

*Needs:* AlgebraicVectorBundles L0A–L0C; PadicMeasuresIwasawaAlgebras §5.1; SchemeAndStackFoundations §§1.1, 1.22, 2.18, 3.4.

The supplier provides the following comparison laws.

- Use exactly the four-term determinant expression above; its Euler-characteristic grade is zero by curve Riemann–Roch.
- Tensor-product additivity in both arguments, coherent with unit, associativity, interchange and permutations.
- Pullback identifies the pairing with the pairing on the cartesian family for every base morphism; identity and composition comparisons satisfy descent.
- For a relative effective Cartier divisor D finite flat over S, identify ⟨O(D),M⟩ with N_D/S(M|D). If D is empty on an open-and-closed component, the value there is the trivial line.
- Multiplication by u on L acts on the pairing by `u^{deg(M)}` on each rank/degree component.
- The symmetry ⟨L,M⟩≅⟨M,L⟩ is Deligne's isomorphism sending ⟨l,m⟩ to ⟨m,l⟩; on ⟨L,L⟩ it is multiplication by `(−1)^{deg(L)}`, which equals the Koszul permutation of the two `d_f(L)∨` factors multiplied by `(−1)^{χ(O_C)}`. It is not always the identity.
- On the divisorial-scheme range of Corollary 6.9 identify the pairing class with the degree-two Chern pushforward in the graded K-group; the Chow and stack extensions are separate named needs.

**Checks.**

- ⟨O_X,M⟩ has the bilinear unit trivialization; omitting the d(O_X) term breaks this normalization.
- For a section s in the smooth locus, ⟨O(s),M⟩≅s*M by the degree-one norm; no inverse appears.
- For P¹_k and L=O(1), the canonical self-interchange is −1 when char(k)≠2, even though the pairing line is one-dimensional.
- For a connected stable genus-g fibre, deg(ω)=2g−2 is even, so the symmetry of ⟨ω,ω⟩ is +1. The bare Koszul permutation of the determinant factors gives `(−1)^{χ(ω)}=(−1)^{g−1}`, which is −1 at g=2, and on ℙ¹ with L=O(1) it gives (−1)^2=+1; a supplier that takes that permutation as the symmetry fails both values.
- For L=f*A, identify ⟨f*A,M⟩ with `A^{deg(M)}`. For M=O(1) on P¹ this is A, not A∨.
- For a stable nodal family over Z and its F_p fibre, the integral pairing specializes; a smooth-family-only or flat-base-change-only definition fails.
- For a relative divisor of degree two, multiplication by u on M acts by u² on its norm pairing, not by u.

**Sources.** [Pierre Deligne](https://publications.ias.edu/sites/default/files/Number58.pdf), Construction 7.2, (7.2.1), pp. 147–149; §7.4, p. 150; §6.2, p. 142 for the symmetry: Gives the rank-zero determinant expression and the coherent bilinear comparison for proper flat curves, beyond the smooth discussion in §6.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Definition 1.1, p. 258; (6.3), Proposition 6.1, Remark 6.2, pp. 310–312 (mc5-erikssonfreixas2024 line 2864): Supplies the locally projective arbitrary-base version and the sign, scalar and relative-divisor laws.

For the Deligne pairing the four-determinant formula must be interpreted before forgetting the grading:

⟨L,M⟩_f = d_f(L⊗M)⊗d_f(O_C)⊗d_f(L)∨⊗d_f(M)∨.

The locally constant grade is zero. Nevertheless the symmetry need not be the identity on an equal argument. Deligne's symmetry, built from symbols and norms (Deligne §6.2, p. 142; Eriksson–Freixas i Montplet, Proposition 6.1(2), p. 311), acts on ⟨L,L⟩ by `(−1)^{deg L}`. The Koszul permutation of the two factors d_f(L)∨, each of grade −χ(L), acts by `(−1)^{χ(L)²}=(−1)^{χ(L)}=(−1)^{deg L+1−g}`. On the diagonal the symmetry is therefore that permutation multiplied by `(−1)^{χ(O_C)}`. For the dualizing line the degree is 2g−2 and the symmetry is +1, while the bare permutation is `(−1)^{g−1}`. Taking the bare permutation as the symmetry fails the test L=O(1) on ℙ¹, and forgetting all signs fails it too.

Deligne's smooth discussion in §6 is not used to assert a theorem about all nodal families. Construction 7.2, pp. 147–149, and Eriksson–Freixas i Montplet's arbitrary-base construction supply the required range. The latter's locally projective condition is Zariski-local on the base and stable under every base change; it does not require a Noetherian base. A relative effective Cartier divisor in the norm law must be flat over the base. An arbitrary vertical divisor is not substituted into that law.

### From TauCetiRoadmap.EnhancedDerivedSheaves

§E1.9 `perfect_proper_pushforward` supplies, for a finitely presented morphism of algebraic spaces and a perfect complex, perfectness of the derived pushforward with proper support and the arbitrary derived base-change isomorphism, with no Noetherian hypothesis on the base; it is used here with coefficient O_X[0] for proper flat finitely presented curve families.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

What AlgebraicModuliForArithmeticGeometry must provide (gap:projective-frame-line-twist): For finite locally free E,F of the same positive rank over any scheme S, identify an S-isomorphism P(E)≅P(F) with a line L and an isomorphism E≅F⊗L modulo compatible line isomorphisms, and show the projective-frame sheaf is a torsor under the smooth affine group PGL of relative dimension r²−1. (§§1.1, 2.1.)

Use §§1.1–1.7 for quotient-projective spaces, coherent Grassmannians, Hilbert polynomials, regularity and relative Serre generation; §§2.1–2.2 for graph-Hilbert Isom and automorphisms; §§3.1–3.5 for finite-source descent and polarized comparisons; §§5.1–5.4 for rigidification and normalization; §§7.2–7.3, 7.6 and 8.1–8.3 for perfect-complex rank loci, relative Picard sheafification, framed deformation and algebraization with effectivity, versality and limit preservation supplied separately. Use §7.2 `single_degree_free_locus` for the open locus where a perfect complex is a locally free module in one degree, compatibly with arbitrary base change, and `universal_functions` for O_T≅(f_T)_*O for proper flat finitely presented families with geometrically reduced connected fibres, with the étale-local splitting Rf_*O≅O⊕P, P perfect of Tor amplitude at least 1. Use §3.5 `ModuliDescent.polarizedDescentComparison` for effective descent of a proper finitely presented polarized scheme with its actual line cocycle, morphisms, sections and arbitrary-base-change coherence; flatness descends separately along the same fppf cover. The arithmetic elliptic object itself is the ModularCurves comparison, not a consequence of generic formal algebraization.

What AlgebraicModuliForArithmeticGeometry must provide (gap:integral-node-incidence): Provide finite normalization of Deligne–Mumford stacks over excellent integer bases, its étale atlas descent, and the comparison of an integral persistent-node incidence cover with boundary normalization. (§5.4.)

What AlgebraicModuliForArithmeticGeometry must provide (gap:level-tame-components): Provide tame abelian Teichmüller-level normalization with flatness, geometrically normal fibres, boundary Kummer charts and locally constant component count when N is invertible, without requiring the frame deck-group order invertible. (§§5.4, 8.3.)

What AlgebraicModuliForArithmeticGeometry must provide (gap:proper-flat-picard-quotient): For a strongly quasi-projective scheme over a Noetherian base and a proper flat finitely presented equivalence relation with finitely many fibre Hilbert polynomials, provide its strongly quasi-projective effective fppf quotient and graph-descent comparison used by the relative Picard proof. (§3.5.)

### From TauCetiRoadmap.JacobianChallengePartII

Use §§0.1–0.4 for degree components, relative Picard representability and degree torsors on Noetherian smooth curve families; §§1.1–1.4 for the relative Jacobian, base change, curve determinant and canonical principal polarization; §4.4 for actual-to-relative Picard obstruction; §§6.1–6.3 for stable Picard Lie/cohomology and Hodge comparison over integral Noetherian bases. §7.1 supplies the levelled polarized Jacobian (J(C/M),λ_C,α) of a smooth projective curve family with full symplectic level ℓ≥3 over a Noetherian ℤ[1/ℓ,ζ_ℓ]-scheme, with its pairing condition and base-change comparison; it is stated for any such family and is consumed by the Torelli constructions of Layer 6.

What JacobianChallengePartII must provide (gap:strong-torelli-faithfulness): Provide strong Torelli and faithfulness of curve automorphisms on the principally polarized Jacobian in every characteristic, with the two signs and the hyperelliptic distinction retained. (§1.4.)

### From TauCetiRoadmap.JacobianChallenge

Layers A–F supply absolute line classes, coherent H¹, genus, duality, relative cohomology and the pointed field Jacobian. Coherent H¹ is not identified with étale H¹.

### From TauCetiRoadmap.AlgebraicVectorBundles

L0A–L0C supplies sheaf tensor, pullback coherence, finite local freeness, ordinary duals, exterior determinants and fixed-rank determinant pullback on schemes. Apply on atlases and use actual descent isomorphisms.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§5.1 supplies parity-graded determinant lines of bounded finite-projective complexes over arbitrary commutative rings, including shift, quasi-isomorphism, acyclic and short-exact comparisons. The integer-grade refinement is part of gap:graded-perfect-stack-descent, rather than part of this parity carrier.

### From TauCetiRoadmap.StablePeriodicCurved

Layer 2 supplies finite-projective totally acyclic complexes and Gorenstein-projective modules. Layer 2 here adds relative coefficient universality and flat cycles, rather than another absolute complete-resolution carrier.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

What NeronModelsAndSemistableAbelianVarieties must provide (gap:stable-picard-arbitrary-base): For proper flat finitely presented stable genus-g curves with g≥2 over arbitrary schemes, extend the integral Noetherian Pic⁰ representation to a smooth separated group scheme with semiabelian geometric fibres, identify it with the fibrewise neutral relative fppf Picard sheaf, and supply canonical arbitrary-base-change isomorphisms with their descent cocycles. (§4.13.)

§4.1 `NormalizationExactSequence` supplies the normalization sequence and graph torus for every proper connected geometric nodal curve, independently of a DVR model; §4.13 supplies the Picard identity component for an integral Noetherian stable genus-g family, g>1, allowing singular total space and jumping toric rank.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§§A3.1–A3.8 supplies multiplication kernels, torsion divisibility, polarized Weil pairings and full level. §A6.18 `polarizedAutomorphisms` supplies rigidity on the group scheme of N-torsion for polarization-preserving automorphisms, and `eq_one_of_finiteOrder_congruence` supplies the finite-order congruence tool. These arguments act on the kernel scheme, not merely its geometric points.

What AbelianSchemesAndArithmeticModuli must provide (gap:polarized-atlas-descent): Provide polarized relative-Jacobian descent from Noetherian curve atlases together with the exact dual and Tate-twist comparison between Jacobian torsion frames and constant-coefficient curve H¹. (§§A2.5, A3.5–A3.8.)

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

§B4.1 supplies, in characteristic zero over ℚ(ζ_ℓ), the fine scheme M_g[ℓ] of smooth genus-g curves with full symplectic level ℓ≥3, its universal curve, finite étale level changes and the quasi-finite Torelli map compatible with Jacobians and principal polarizations. The integral fine level scheme and Torelli map here extend these over ℤ[1/N,ζ_N] and restrict to that construction over ℚ(ζ_N).

### From TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness

§6.0b supplies, for a relatively minimal genus-one fibration f:S→B over an algebraically closed field with proper base, the torsion splitting of R¹f_*O_S with invertible quotient L, the canonical formula ω_S≅f*(ω_B⊗L⁻¹)⊗O_S(Σa_t F̄_t) with its multiple-fibre coefficients, and deg L=−χ(O_S)−length(T), in every characteristic including quasi-elliptic fibrations.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

§§5.9, 5.11 and 5.12 supply the mapping class group of a compact oriented surface, Dehn twists and their action on first homology; the boundary Dehn twists of the torsion argument in Layer 5 are these.

### From TauCetiRoadmap.PELModuli

§§M5.1–M5.3 supplies principal Siegel moduli with full level; §§M6.9–M6.10 supplies the Hodge bundle and arithmetic moduli interface. Pairing components and universal abelian families must agree with the curve level convention.

### From TauCetiRoadmap.ShimuraCompactifications

§§6.1–6.7 and 6.10 supply semi-abelian schemes, polarized degeneration data, Mumford's construction, the degeneration equivalence, the universal degeneration on a cusp chart and boundary level structures; §§7.13–7.17 supply Hodge semiampleness, finite generation of the Hodge section algebra, the integral minimal compactification with its contraction from the toroidal model and its ample Hodge line, all in its stated integral PEL range (good primes, level prime to them); §2.8 is the characteristic-zero map to the minimal compactification. The extension to every residue characteristic prime to the level is the contract below.

What ShimuraCompactifications must provide (gap:minimal-siegel-all-characteristics): Provide the principal Siegel minimal compactification over ℤ[1/N,ζ_N] in every residue characteristic not dividing N, with ample rational Hodge line and extension and Hodge pullback for arbitrary stable curve families. (§§6.1–6.7, 7.16–7.17.)

### From TauCetiRoadmap.ComplexComparisonPartII

§§C3.2d.1–C3.2d.4 supplies the Picard stack, relative sheaf and Brauer obstruction comparisons. The analytic boundary monodromy contract below retains its proper-stack hypotheses.

What ComplexComparisonPartII must provide (gap:stack-topology-boundary): Provide analytic/algebraic torsion-line and finite-cover comparison for the proper stable curve stack, together with Teichmüller contractibility and the boundary Dehn-twist monodromy comparison used for torsion freeness. (§§C3.2d.1–C3.2d.4.)

### From TauCetiRoadmap.ModularCurvesPartII

Use §§2.1–2.3 for generalized elliptic curves, their actions, standard polygons and automorphisms, and §2.11 `polygonCountStack` at polygon count one for the proper smooth dimension-one stack over ℤ, its Deligne–Mumford property and reduced Cartier boundary B(C₂). The group is constant, including in characteristic two. The Weierstrass and group-law comparisons use ModularCurves at the sections below.

### From TauCetiRoadmap.ModularCurves

§§1C–1D, 2D, 4A–4B and 9E supplies the Weierstrass presentation and changes, elliptic group law and uniqueness, elliptic groupoid and coarse j-line. The (1,1) comparison preserves the marked universal family and scalar automorphisms.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§3.3 supplies the local Noetherian fibre injection criterion: for a finite B-module N flat over A and an arbitrary A-flat target P, an A-linear map N→P injective modulo the maximal ideal of A is injective with A-flat cokernel. Localizing finite windows of the projective resolutions supplies the coefficient exactness tests; no finite generation over A is inferred from finite generation over B.

### From TauCetiRoadmap.AlgebraicCurves

Layers 0–12 supplies divisors, genus and Riemann–Roch with the function-field/scheme comparison. No new function-field dictionary is constructed here.

## How to read the build

Layer 0 fixes arbitrary-base family and descent comparisons. Layer 1 makes the tricanonical and completed boundary charts explicit. Layer 2 proves the section-ideal algebra before completed-local transfer, then constructs expansion and its inverse comparison. Layer 3 globalizes decorated node choices and cotangent lines. Layer 4 applies positivity to level and coarse comparisons and transports the supplier's ample determinant line to the coarse space. Layer 5 forms Hodge determinants and the integral Noether isomorphism. Layer 6 builds stable compactifications and Torelli/Hodge applications; Layer 7 compares degree-Picard parameters with actual triples and supplies the six consumer interfaces. The numbered targets are in dependency order within each layer; each Needs clause identifies its inputs. Examples and API consequences do not serve as premises.

## Layer 0: the pointed curve moduli problem

### 0.1 Finite-stage models of pointed curve diagrams

Let A be a filtered colimit of finite-type Z-algebras A_i. Any finite diagram over Spec A of proper, flat, finitely presented, geometrically connected nodal curves of pure relative dimension one, equipped with finitely many ordered pairwise disjoint sections in the relative smooth locus and a fixed fibre genus for each curve, descends to some Spec A_i. Specified maps, isomorphisms, inverses, and finitely many commutative diagrams descend after a common refinement. Smoothness of a specified family and stability of a specified pointed family descend after refinement. The latter means positivity of 2h_v−2+b_v+m_v for every normalized geometric component, where b_v counts node branches. Two such finite-stage realizations of the same finite diagram become isomorphic at a common later stage, compatibly with all specified identifications. This is a local-on-the-base approximation theorem; it asserts no single Noetherian model for a non-quasi-compact base.

Every curve morphism is of finite presentation; only a finite diagram and finitely many marked sections are being descended. The A_i form a filtered system of finite-type Z-algebras with colimit A. Fixed genus, nonempty geometrically connected fibres, and pure relative dimension one are part of the objects.

One proof uses the following inputs and comparisons. Import SchemeAndStackFoundations §0.9 for schemes, arrows, equalities and inverse equations. Spread properness and flatness after refining. Apply Stacks Lemma 53.20.10 to spread nodality, using its syntomic relative-dimension-one and unramified-singular-locus criterion. Spread geometric connectedness using the SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 property-spreading contract; use the locally Noetherian genus strata from StableReduction Layer 2 to select genus g. Over a Noetherian model, the failure loci for smooth marked sections, disjointness, smooth fibres and stable fibres are closed after taking the appropriate proper images. Remove their images and refine the model until the limit base factors through the resulting open. Fixed-genus strata are open and closed. Apply the finite-presentation limit theorem again to comparisons and all finite relations. Apply the construction on affine opens of a general base and compare on affine refinements of their intersections; do not assume intersections or the base are quasi-compact.

A marking permutation is a separately specified arrow, not an equality of ordered markings. Nilpotents of the base are retained by scheme approximation. No bound on the number of affine opens of an arbitrary base is imposed.

([stacks-noetherian-valuative-KKjBS6](#references), Lemmas 32.10.1 (01ZM), pp. 25–27; 32.10.2 (01ZR), pp. 27–28; 32.4.15 (09MT), p. 9. Finite-presentation objects, arrows and equalities admit finite-stage models; ampleness can be detected at a later stage.; [mc0-stacks-curves](#references), Lemmas 53.20.1 (0C59), 53.20.9–53.20.10 (0C5E–0C5F), pp. 49–51. Nodality is described by finitely presented local conditions, is fpqc local and spreads through affine-transition limits.; [knudsen2](#references), Definition 1.1, pp. 162–163; Definition 1.2, p. 164. The curve, section and fibrewise stability conditions being spread are those of the pointed moduli problem.)

*Needs:* SchemeAndStackFoundations §0.9, SchemeAndStackFoundations §0.8, StableReduction Layer 0, StableReduction Layer 1, StableReduction Layer 2, StableReduction Layer 3.

### 0.2 Genus and cohomology over arbitrary bases

For a proper flat finitely presented scheme morphism f:C→S with nonempty geometrically connected nodal fibres of pure dimension one, the unit O_S→f_*O_C is an isomorphism universally; R¹f_*O_C is finite locally free, commutes with arbitrary base change, and R^qf_*O_C vanishes for q≥2. The geometric-fibre equality dim H¹(C_s,O)=g is equivalent to R¹f_*O_C having constant rank g. Formation of the genus-g open-and-closed locus commutes with arbitrary base change. On a locally Noetherian base this identifies with the genus convention and coherent cohomology of StableReduction Layer 2; over an affine base its groups identify with Tau Ceti scheme-module sheaf cohomology. No canonical splitting of Rf_*O_C is asserted.

Here S is any scheme, including nonreduced and non-Noetherian schemes. Geometric connectedness, reduced nodal fibres, properness, flatness and finite presentation are essential hypotheses.

One proof uses the following inputs and comparisons. Use the SchemeAndStackFoundations §§2.1–2.2, 2.6, 2.18–2.22 perfect-pushforward theorem with E=O_C to obtain a perfect complex whose derived formation commutes with arbitrary base change. Use geometric connectedness and geometric reducedness to identify fibre H⁰ with the residue field. The unit then gives a local splitting as in Stacks 36.32.5. Fibre dimension one eliminates cohomology in degrees ≥2. Apply the perfect-complex fibre-amplitude criterion of AlgebraicModuliForArithmeticGeometry §7.2 (`single_degree_free_locus`) to the complementary complex, whose fibres are concentrated in degree one. Its degree-one cohomology is finite locally free and has arbitrary base change. Identify affine sections using SchemeAndStackFoundations §2.6 and Tau Ceti Cohomology; compare with the Noetherian supplier using pointed-approximation and uniqueness of base-change identifications.

For P¹_S, R¹f_*O=0 and the genus is zero. For a smooth elliptic family the first cohomology has rank one, including after a nonflat change of base. Two disjoint copies of P¹ fail the unit-isomorphism assertion: f_*O is O_S⊕O_S.

([mc0-stacks-curves](#references), Lemma 53.20.12 (0GKA), pp. 52–53. A proper geometrically connected nodal family has universal degree-zero comparison, finite locally free first cohomology and higher vanishing.; [mc0-stacks-perfect](#references), Lemma 36.30.4 (0B91), p. 74; Lemma 36.32.5 (0E62), pp. 79–80. Perfect pushforward and arbitrary base change yield the cohomological argument, with a local splitting rather than a distinguished one.; [mc0-stacks-moduli](#references), Lemmas 109.9.3–109.9.4 (0E1J, 0E6K), pp. 10–11; Lemma 109.20.3 (0E6V), p. 22. These identify the constant-genus locus by the rank of first cohomology.)

*Needs:* AlgebraicModuliForArithmeticGeometry §7.2, SchemeAndStackFoundations §2.6, SchemeAndStackFoundations §2.18, SchemeAndStackFoundations §§2.1–2.2, 2.6, 2.18–2.22, `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, StableReduction Layer 2, [finite-stage models of pointed curve diagrams](#01-finite-stage-models-of-pointed-curve-diagrams).

### 0.3 Log dualizing sheaves over arbitrary bases

For a proper flat finitely presented nodal curve f:C→S of pure relative dimension one over any scheme S, take the canonical relative dualizing complex supplied by SchemeAndStackFoundations §2.20, with its diagonal rigidity and, for proper f, trace normalization. It is concentrated in degree −1, with cohomology `ω_{C/S}`; ω is an invertible O_C-module. For ordered disjoint smooth sections σ_i, their images are relative effective Cartier divisors D_i. Define `L=ω_{C/S}(ΣD_i)` using the existing invertible-sheaf tensor and Cartier-twist operations. Canonical comparisons `u_C^*ω_{C/S}≅ω_{C_T/T}` and u_C^*L≅L_T hold for every T→S, respect isomorphisms of pointed curves, and satisfy unit and composition coherence. On the locally Noetherian domain these identify with StableReduction Layer 2, including trace and smooth differential comparisons. On a geometric normalized component v, deg L=2h_v−2+b_v+m_v; a self-node contributes two to b_v. L is relatively ample exactly when all these degrees are positive. This extends the existing curve-specific dualizing interface; it does not introduce another line-bundle or generic duality theory.

Nodal fibres are Gorenstein and geometrically reduced; all geometric components have dimension one. Each σ_i is a section in the relative smooth locus and the sections are pairwise disjoint. For ampleness the morphism is proper and of finite presentation; no Noetherian condition is imposed on S.

One proof uses the following inputs and comparisons. Import the arbitrary-base rigid dualizing complex from SchemeAndStackFoundations §§2.1–2.2, 2.6, 2.18–2.22. Use the arbitrary-base Cohen–Macaulay concentration and Gorenstein invertibility of gap:cm-duality-arbitrary-base to obtain its degree −1 module, with arbitrary base change. Import relative Cartier marking divisors and log twists from StableReduction Layers 2–3. Form their tensor product with ω using the line-bundle API by AlgebraicVectorBundles; do not replan those operations. Compare with SchemeAndStackFoundations §2.20 and the existing StableReduction sheaf on Noetherian models. Trace/rigidity uniqueness makes the comparisons independent of models and coherent; pointed-approximation handles finite diagrams. Import the normalization residue and degree formula and componentwise positivity from StableReduction Layers 1–3. Reduce the fibrewise calculation to the Noetherian case; apply the relative ampleness criterion locally on S.

P¹ with three distinct markings has L≅O(1), whereas two markings give O(0) and fail stability. On two rational components joined at one node, each carrying two markings, L has multidegree (1,1). A rational irreducible one-nodal curve with one smooth mark has degree one: the self-node has two branches.

The construction has the following API.

- The invertible sheaf is H⁻¹ of the supplied rigid relative dualizing complex.
- A smooth section determines its relative effective Cartier divisor, compatibly with base change.
- Form ω twisted by the sum of the ordered marking divisors in the existing invertible-sheaf category.
- Every base change has a canonical log-line isomorphism, with identity and composition coherence.
- A marking-preserving family isomorphism induces the canonical log-line isomorphism; its composition law lifts scheme cocycles.
- On locally Noetherian bases identify ω, its trace, and the marked twist with StableReduction Layer 2 and SchemeAndStackFoundations §2.20.
- On the relative smooth locus ω identifies with `Ω¹_{C/S}`; the twist retains the marking divisors.
- Degree on a normalized geometric component is 2h_v−2+b_v+m_v, counting both flags of a self-node.
- Relative ampleness is equivalent to positivity of that degree on every geometric component.

**Checks.**

- Over any field with three distinct chosen points of P¹, L≅O(1), so the family is stable.
- For two distinct marks of P¹, L≅O(0); excluding this family prevents mere nonnegative degree from being used for stability.
- For a two-component stable genus-zero four-pointed fibre split 2+2, log multidegree is (1,1), not (2,2).
- For an irreducible rational one-nodal curve with one mark, degree is −2+2+1=1, hence stable.
- For any pointed stable family over k[ε]/(ε²), reduction to k identifies its log line with the fibre log line by the canonical base-change isomorphism.

([mc0-stacks-moduli](#references), Lemma 109.19.1, Definition 109.19.2 and Lemma 109.19.3 (0E6P, 0E6Q, 0E6R), pp. 20–21. For arbitrary-base Cohen–Macaulay curve families the relative dualizing complex is a shifted flat module, and it is invertible in the Gorenstein case.; [mc0-stacks-duality](#references), Remark 48.12.5 (0B6S), p. 30; Section 48.28, especially Lemma 48.28.6, pp. 72–75. Proper relative duality supplies the normalized complex; rigidity gives uniqueness and base-change compatibility.; [knudsen2](#references), Definition 1.1 and discussion of ω, pp. 162–163. The pointed stability condition uses the log dualizing line, and the source separates its base-change assertion from the Noetherian duality argument.)

*Needs:* SchemeAndStackFoundations §2.20, SchemeAndStackFoundations §§2.1–2.2, 2.6, 2.18–2.22, StableReduction Layer 1, StableReduction Layer 2, StableReduction Layer 3, `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`, [finite-stage models of pointed curve diagrams](#01-finite-stage-models-of-pointed-curve-diagrams).

### 0.4 Geometric realization of the pointed moduli pseudofunctor

For naturals g,n with 2g−2+n>0 computed in Z, realize the stable pointed-curve moduli pseudofunctor of SchemeAndStackFoundations §4.15 on all schemes. Start with the category whose objects are an object q:C→S of the native slice category Over S and an ordered n-tuple of slice morphisms from id_S to q; morphisms are slice arrows preserving each of the n sections. Restrict by the actual geometric predicates: proper, flat, finitely presented, nonempty geometrically connected genus-g fibres of pure dimension one, nodality, disjointness and smoothness of the sections, and relative ampleness of the canonical log line. Take the native categorical core of this full subcategory. This is the stable fibre groupoid; its full subgroupoid cut out by smoothness of C→S is the smooth fibre groupoid. Reindex along u:T→S by the native slice pullback and the induced sections. Transport the native slice pullback identity and composition isomorphisms through the pointed full subcategories and their cores to obtain a Pseudofunctor on LocallyDiscrete(Schemeᵒᵖ) with values in Cat and groupoid fibres. The comparisons preserve the ordered marking data and satisfy the unit and pentagon laws. Geometric points recover the groupoid of pointed curves with their full marking-preserving automorphism groups, rather than its set of isomorphism classes.

Fix universes for schemes, fibre categories and the Cat-valued pseudofunctor; use universe enlargement where required. The geometric predicates refer to the existing StableReduction objects, with arbitrary-base genus and log-duality comparisons above. There is no assumption that the moduli problem is algebraic or has a Hilbert atlas.

One proof uses the following inputs and comparisons. Use the moduli pseudofunctor of SchemeAndStackFoundations §4.15 as the specification and StableReduction Layer 3 as the family and stability interface. Realize sections as actual morphisms in Over S, not named points or unconnected labels. Use [genus and cohomology over arbitrary bases](#02-genus-and-cohomology-over-arbitrary-bases) and [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases) to interpret the family predicates without a locally Noetherian restriction. On the total curve of a pullback, the i-th section is the unique map with components σ_i∘u and id_T. All geometric conditions are preserved by base change. Use Over.pullbackId and Over.pullbackComp for canonical comparisons, verify their equations on both projections and all marked sections, and apply Functor.core and Iso.core. These comparison maps give the coherent pullback pseudofunctor of the pointed moduli problem. Identify arrows in the core with inverse pairs of section-preserving over-S morphisms, and identify geometric fibres with the groupoid of pointed stable curves over an algebraically closed field of StableReduction Layer 3.

A smooth elliptic curve with its origin retains its inversion automorphism in characteristic different from two. For a fixed ordered triple on P¹, the identity scheme map is not an arrow to a differently ordered triple unless it preserves each label. A noninvertible section-preserving endomorphism belongs to the ambient pointed slice category when defined, but is not an arrow of the moduli groupoid.

The construction has the following API.

- The fibre over S is the core of the full subcategory cut out by the geometric predicates inside the category of ordered n-pointed objects of Over S; its arrows preserve every marking.
- Arrows are precisely marking-preserving scheme isomorphisms over the fixed base.
- A scheme map induces the actual fibre-product functor on pointed families and isomorphisms.
- The native identity-pullback isomorphism identifies every marking with its original section.
- The native iterated-pullback comparison preserves every marking and satisfies pentagon and unit laws.
- Smooth families form a full subgroupoid, and their inclusion is pseudonatural in the base.
- Evaluation on an algebraically closed field is equivalent to the usual geometric pointed-curve groupoid, preserving automorphism groups.
- Restriction to locally Noetherian schemes identifies with the StableReduction family interface and the moduli pseudofunctor of SchemeAndStackFoundations §4.15.

**Checks.**

- For an elliptic curve E over an algebraically closed field of characteristic ≠2, (E,0) is an object at (g,n)=(1,1) and [−1] is a nonidentity automorphism. A set-valued replacement fails this test.
- The identity of P¹ is not a marking-preserving map from (0,1,∞) to (1,0,∞); relabelling is not an implicit identification of objects.
- In characteristic p>0, the Frobenius endomorphism of P¹ over F_p preserves 0,1,∞ but is not a moduli arrow, since it is not an isomorphism.
- Over the empty scheme the stable fibre category is equivalent to the terminal groupoid, with empty total curve and uniquely determined marking maps; fibre conditions are vacuous.
- The pullback of each marking is the unique graph map with components σ_i∘u and id_T. Iterated pullback gives the same marking through the native comparison.

([knudsen2](#references), Definitions 1.1–1.2, pp. 162–164. Ordered smooth disjoint markings, fibrewise stability and cartesian family isomorphisms specify the geometric fibre categories and their reindexing.; [knudsen2012](#references), Introduction, pp. 1–2. The moduli objects are families over schemes, with base change, and carry a universal family.)

*Needs:* StableReduction Layer 3, SchemeAndStackFoundations §1.18, `CategoryTheory.Over.pullback`, `CategoryTheory.Over.pullbackId`, `CategoryTheory.Over.pullbackComp`, `CategoryTheory.Core`, `CategoryTheory.Functor.core`, `CategoryTheory.Iso.core`, SchemeAndStackFoundations §4.15, [finite-stage models of pointed curve diagrams](#01-finite-stage-models-of-pointed-curve-diagrams), [genus and cohomology over arbitrary bases](#02-genus-and-cohomology-over-arbitrary-bases), [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases).

### 0.5 Effective descent of the geometric pointed moduli problem

For an fppf covering of any scheme S, restriction of either the stable or the smooth pointed genus-(g,n) groupoid to its descent-data category is an equivalence. In the stable case, a family isomorphism cocycle induces a specified cocycle of isomorphisms on L=ω(ΣD_i), using rigidity/base-change coherence; this is a lift of the cocycle to line-bundle data, not merely invariance of a line-bundle isomorphism class. Apply polarized descent to obtain a scheme family and descend the marking sections and their equalities. The descended geometric predicates and fixed genus are the ones of [geometric realization of the pointed moduli pseudofunctor](#04-geometric-realization-of-the-pointed-moduli-pseudofunctor). These equivalences give the native Pseudofunctor.IsStack instance for Scheme.fppfTopology and the specified groupoid fibres separately. On the locally Noetherian étale subsite the descended family and log line agree, by a uniquely determined isomorphism compatible with the chosen descent identifications, with the polarized descent by StableReduction Layer 2. The same uniqueness compares with the polarized descent comparison of AlgebraicModuliForArithmeticGeometry §§3.1–3.5 on their common domain.

Use AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.polarizedDescentComparison`, including actual cocycle isomorphisms, arrows and marking maps; descend flatness separately along the fppf cover. The stable log line is relatively ample by gap:cm-duality-arbitrary-base. The smooth groupoid is the full subcategory satisfying smoothness, an fppf-local condition.

One proof uses the following inputs and comparisons. Use log-duality mapIso and baseChange to lift the curve descent cocycle canonically to L, with its identity and triple-overlap equations. Use AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.polarizedDescentComparison` with the specified log-line cocycle. Relative ampleness is fpqc local, and the descended ample invertible sheaf makes the descended algebraic space a scheme (Stacks 74.13.1). Descend sections and marking-preserving arrows using the morphism part of the supplier and subcanonicity. Properness, flatness, finite presentation, nodality, geometric connectedness, genus, smoothness/disjointness of markings and log ampleness descend; use Stacks 53.20.9 for nodality. Translate full faithfulness and essential surjectivity of the descent functor into native IsStack via SchemeAndStackFoundations §1.18. Preserve automorphisms in this equivalence. Compare étale and fppf descent constructions using full faithfulness, not a chosen equality of objects.

For a finite separable splitting cover of a genus-zero three-pointed form, descent recovers the marked curve and its descent identifications. The triviality theorem is proved in Layer 2 and is not used to prove descent. An elliptic involution in an overlap cocycle descends as actual automorphism data; it is not discarded by passing to classes. Specifying that a line-bundle class is fixed, without cocycle isomorphisms, is insufficient input to polarized descent.

([mc0-stacks-quot](#references), Lemma 99.14.3 (0D40), pp. 38–39. The fppf stack property for polarized proper flat finitely presented schemes follows from space descent, module descent and descent of ampleness.; [mc0-stacks-descent](#references), Lemma 74.13.1 (0D3C), pp. 21–22. An ample line descends along fpqc covers, and its existence over a scheme base forces the descended space to be a scheme.; [knudsen2](#references), Definition 1.2 and following stack assertion, p. 164. The original fibred category and its étale stack assertion motivate the comparison; the fppf and arbitrary-base strengthening uses the Stacks arguments explicitly.)

*Needs:* gap:cm-duality-arbitrary-base, AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.polarizedDescentComparison`, SchemeAndStackFoundations §1.2, SchemeAndStackFoundations §1.1, SchemeAndStackFoundations §1.18, SchemeAndStackFoundations §§1.18–1.23, StableReduction Layer 2, `CategoryTheory.Pseudofunctor.IsStack`, `AlgebraicGeometry.Scheme.fppfTopology`, [geometric realization of the pointed moduli pseudofunctor](#04-geometric-realization-of-the-pointed-moduli-pseudofunctor), [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases).

### 0.6 The universal curve represents an unrestricted additional section

Realize the universal curve by the pseudofunctor `Z̄_{g,n}` whose S-objects are stable pointed families (C/S,σ_i) together with any section Δ:S→C, and whose arrows are marking-preserving isomorphisms carrying Δ to Δ. Forgetting Δ defines π:Z̄→M̄. The extra-section pseudofunctor is an fppf stack by effective family descent and descent of section morphisms. For a family x over S, there is a pseudonatural equivalence `h_S×_{M̄}Z̄≃h_C` over h_S: an object over u:T→S includes a specified isomorphism of its underlying family with u^*x, and that isomorphism carries its extra section to a unique map T→C over S. Thus π is represented by schemes, and its base change along x is exactly f:C→S. It is representable, proper, flat, finitely presented and nodal of pure relative dimension one, with geometrically connected genus-g fibres. Its relative smooth locus is identified under every such base change with that of f; a geometric point is smooth for π exactly when it is smooth in the corresponding geometric curve. The n marking maps M̄→Z̄ send Δ to σ_i. Their images are disjoint and in the relative smooth locus. Δ is otherwise unrestricted and can coincide with a mark or pass through a node; it is not a new stable disjoint marking. The identification of `M̄_{g,n+1}` with this universal curve is the statement of SchemeAndStackFoundations §4.15 `Mbar.forget`; §2.248 supplies its proof route and the coherent inverse over arbitrary schemes, and nothing in this target assumes it.

Here g,n satisfy the stable range and x is an actual object of [geometric realization of the pointed moduli pseudofunctor](#04-geometric-realization-of-the-pointed-moduli-pseudofunctor). The two-fibre product includes an isomorphism to the fixed pulled-back family. The representability statement is about the projection, not algebraicity of M̄.

One proof uses the following inputs and comparisons. Use the native over-S section Hom description and fibre-product universal property to identify sections of C_T→T with maps T→C over S. Using SchemeAndStackFoundations §1.18, identify an object with a family, an identification with x_T, and an extra section. Transport the section to x_T. The inverse uses x_T with its given section and identity identification. Prove full faithfulness: an arrow compatible with the fixed identification is uniquely determined. This makes each represented fibre discrete while leaving the automorphisms of Z̄ and M̄ intact. Check pseudonaturality in T and x. Transport the curve properties through this equivalence and identify the n marking maps. Extra-section descent follows from descent of morphisms; there is no smooth-locus condition on Δ.

Over a field the fibre over a pointed curve together with its fixed identification is its entire curve, including every node. A marking section is itself a valid extra section. For a curve with automorphisms, discreteness is asserted only after specifying the identification with the fixed family.

The construction has the following API.

- Sections of C_T→T are naturally equivalent to over-S maps T→C, via the native slice pullback.
- The two-fibre product `h_S×_{M̄}Z̄` is represented by C over S, naturally in the classified family.
- The i-th marking morphism is obtained by choosing Δ=σ_i, for each i in the fixed ordered index set. Composing it with the projection is canonically identified with the identity of the moduli pseudofunctor.
- Under the representing equivalence of this target, the i-th marking pulls back to the original σ_i, with the slice-section identification.
- Every scheme base change of the projection is the classified proper flat finitely presented nodal curve. Its geometric fibres are connected of genus g, and its pointwise relative smooth locus is that of the classified curve.
- The representing equivalence commutes with arbitrary change of base and with family isomorphisms, coherently.
- Restriction over the smooth-family subfunctor is the whole smooth family; over the stable base the relative smooth locus alone omits nodes.

**Checks.**

- For a stable genus-zero four-pointed curve with two rational components carrying two marks each, the node defines a geometric point of the universal fibre.
- For any pointed family with n≥1, choosing Δ=σ_1 defines an object of Z̄; it does not define a disjoint n+1-st marking on the same total curve.
- The universal projection has a nonsmooth fibre at that node, so it is not smooth over the entire stable moduli problem.
- Under `h_S×_{M̄}Z̄≃h_C`, each marking map is precisely the given section σ_i.
- For an elliptic pointed curve with nontrivial automorphisms, an automorphism in the represented two-fibre fibre compatible with a fixed identification must be the identity.

([knudsen2012](#references), Introduction, pp. 1–2, the cartesian universal-family square. An extra section has no smoothness or disjointness requirement; applying the construction to the diagonal of C×_S C identifies the pulled-back universal family with C.; [knudsen2](#references), Definition 1.2, p. 164; Corollary 2.6, p. 179. The extra-section category is distinct from the stable extra-marking category; expansion and contraction compare them in Layer 2.)

*Needs:* SchemeAndStackFoundations §1.18, `CategoryTheory.Over.pullback`, [geometric realization of the pointed moduli pseudofunctor](#04-geometric-realization-of-the-pointed-moduli-pseudofunctor), [effective descent of the geometric pointed moduli problem](#05-effective-descent-of-the-geometric-pointed-moduli-problem).

### 0.7 The smooth-family open and the relative smooth locus

For a stable family f:C→S, let C_sm be the relative smooth locus, and define S_sm as the open subscheme with underlying set S minus f(|C| minus |C_sm|). The complementary image is closed because f is proper. For any u:T→S, the family C_T→T is smooth exactly when u factors through S_sm; the open S_sm and the resulting cartesian square commute with arbitrary base change. Hence the smooth pointed pseudofunctor is a full open subfunctor of the stable one, represented on every scheme test object by S_sm. Pulling the universal curve back to that subfunctor gives C×_S S_sm, with all its markings. This differs from C_sm→S, which keeps smooth points of nodal fibres. Smoothness of the moduli stack over Z, supplied by SchemeAndStackFoundations §4.15, is a separate assertion and implies no smoothness of the universal projection over nodal curves.

Here f is proper, flat and finitely presented with nodal pure-one-dimensional geometric fibres. The relative smooth locus is taken for f, not for the total space over Z.

One proof uses the following inputs and comparisons. Use the native Scheme.Hom.smoothLocus for the relative smooth locus and its base-change characterization. Properness makes the image of its closed complement closed. The fibre over s is smooth precisely when the entire fibre lies in C_sm. Faithfully flat field extension detects this condition, proving the arbitrary-base-change characterization of the resulting open subscheme. Apply this construction naturally to every classified family to obtain the represented open subfunctor; identify the restricted universal curve by universal-evaluation.

For a smooth family S_sm=S and C_sm=C. For a stable nodal curve over an algebraically closed field S_sm is empty while C_sm is nonempty. At a smoothing xy=t, the special fibre contains a nonsmooth node even though the total space may be smooth over the ground field.

**Checks.**

- For a smooth family, C_sm=C and S_sm=S; the smooth pointed subfunctor contains every test object.
- For a constant nodal stable family C₀×S→S, every fibre is singular and S_sm is empty, while C_sm→S is still surjective onto S; the locus C_sm→S does not define the smooth-family open.
- For a stable family over Spec k[t] whose only singular fibre lies over t=0, with one node of local equation xy=t, S_sm=D(t); its pullback along t↦t² is again D(t), as base change of the open requires.

([mc0-stacks-moduli](#references), Lemma 109.16.1 (0DZZ), p. 16. The smooth-family locus is obtained by removing the proper image of the nonsmooth locus and commutes with arbitrary base change.; [knudsen2012](#references), Introduction, pp. 1–2. Universal evaluation pulls the entire classified curve back; restricting the base to smooth families therefore restricts the whole curve.)

*Needs:* `AlgebraicGeometry.Scheme.Hom.smoothLocus`, [geometric realization of the pointed moduli pseudofunctor](#04-geometric-realization-of-the-pointed-moduli-pseudofunctor), [the universal curve represents an unrestricted additional section](#06-the-universal-curve-represents-an-unrestricted-additional-section).

### Examples

For (0,3) the family is (ℙ¹;0,1,∞), with trivial automorphism group. For (1,1) in characteristic zero inversion fixes the mark and is nontrivial. In the represented universal fibre its chosen identification fixes the underlying arrow, so this automorphism does not create an extra fibre arrow. A dual-number base and the empty scheme test descent on schemes rather than only geometric points.

### Dependencies

StableReduction Layers 1–3; SchemeAndStackFoundations §§0.9, 1.1–1.2, 1.18–1.23, 2.18–2.20; AlgebraicVectorBundles L0A–L0C. The finite-diagram and arbitrary-base duality contracts precede effective descent.

## Layer 1: the unpointed Deligne–Mumford comparison

### 1.1 The tricanonical Hilbert polynomial

For g a natural number define P_g in Z[T] by P_g(T)=(g−1)(6T−1), with the subtraction performed in Z. The geometric use assumes g≥2. Its linear coefficient is 6(g−1), its value at zero is 1−g, and P_g(1)=5(g−1).

Here g is a natural number; stable-curve applications assume g≥2.

One proof uses the following inputs and comparisons. Use the existing constant and variable polynomials, rather than introducing a new polynomial carrier. Apply Riemann–Roch for ω³ on a stable genus-g curve from StableReduction Layer 2 to identify this numerical profile with its Hilbert polynomial.

For g≥2, P_g(1)>0 and the ambient projective dimension is P_g(1)−1, not P_g(1).

The construction has the following API.

- P_g(a)=(g−1)(6a−1) for every integer a.
- The coefficient of T is 6(g−1).
- P_g(0)=1−g.
- P_g(1)=5(g−1), the rank of the tricanonical pushforward.
- P_g(2a)=(g−1)(12a−1), the polynomial for an isomorphism graph with product polarization.

**Checks.**

- P_2=6T−1 and P_2(1)=5.
- P_3=12T−2 and P_3(1)=10.
- P_1=0; this numerical extension is not a genus-one stable-curve atlas.
- P_0=1−6T, detecting subtraction in Z rather than truncated natural subtraction.

([dm](#references), §1, pp. 77–78, tricanonical Hilbert construction preceding Theorem 1.6. The tricanonical dimension and degree give this linear polynomial.)

*Needs:* `Polynomial.C`, `Polynomial.X`, `Polynomial.eval`, StableReduction Layer 2.

### 1.2 Arbitrary-base tricanonical comparison

Let f:C→S be a proper flat finitely presented family of geometrically connected nodal curves, of constant arithmetic genus g≥2, with relatively ample dualizing line bundle ω. Then ω is invertible and compatible with arbitrary base change; Rf_*ω³ is the finite locally free sheaf E=f_*ω³ in degree zero, of rank r=5g−5, and formation of E commutes with every base change. The evaluation f*E→ω³ gives a closed immersion C→P_S(E). The polynomial with respect to ω³ is P_g and deg(ω³)=6g−6.

No Noetherian hypothesis on S. Projective bundles use invertible quotients; g is constant on S.

One proof uses the following inputs and comparisons. Use gap:stable-tricanonical-embedding for very ampleness of ω³ and H¹(ω³)=0 on every geometric stable fibre; StableReduction Layer 8 proves only global generation of ω³ and the vanishing, which do not give an embedding. Use the arbitrary-base Gorenstein dualizing comparison of gap:cm-duality-arbitrary-base, the proper perfect pushforward of EnhancedDerivedSheaves §E1.9 and the single-degree free-locus criterion of AlgebraicModuliForArithmeticGeometry §7.2. Fibre vanishing makes the degree-zero locus all of S. Apply the relative very-ampleness criterion to evaluation. On affine qcqs bases, descend the finitely presented family, nodality, stability and the polarization to a Noetherian model; glue the base-change-compatible comparison. Use Layer 0 finite-stage, cohomology and log-dualizing comparisons, EnhancedDerivedSheaves §E1.9 `perfect_proper_pushforward`, AlgebraicModuliForArithmeticGeometry §7.2 `single_degree_free_locus` and gap:cm-duality-arbitrary-base for the arbitrary-base extension.

For g=2, E has rank 5 and evaluation embeds in P⁴ with degree 6. The result applies to nonreduced and non-Noetherian bases, without silently restricting the moduli functor.

([dm](#references), §1, pp. 76–78, duality and tricanonical embedding; Theorem 1.2, p. 77 (dm line 105), very ampleness of ω³ and vanishing of H¹(ω^n) for n≥2 on a stable curve. Provides the stable-fibre calculation, with relative conclusions whose arbitrary-base extension is made explicit here.; [mc0-stacks-moduli](#references), Lemmas 109.19.1 and 109.19.3 (0E6R), pp. 19–21. Gorenstein curve families have an invertible relative dualizing sheaf compatible with unrestricted base change.; [mc1-perf](#references), Lemma 75.25.4(1) (0CTM), pp. 61–62; Lemma 75.26.4, pp. 64–65. The flat proper finitely presented special case gives perfect pushforward and arbitrary derived base change; the single-degree free locus then gives the required bundle universally.)

*Needs:* gap:stable-tricanonical-embedding, gap:cm-duality-arbitrary-base, EnhancedDerivedSheaves §E1.9 (`perfect_proper_pushforward`), StableReduction Layer 2, StableReduction Layer 3, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, SchemeAndStackFoundations §0.9, SchemeAndStackFoundations §5.4, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [the tricanonical hilbert polynomial](#11-the-tricanonical-hilbert-polynomial), [genus and cohomology over arbitrary bases](#02-genus-and-cohomology-over-arbitrary-bases), [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases).

### 1.3 Tricanonical Hilbert polynomial and frame rank

Apply the pluricanonical vanishing and cohomology and base change of StableReduction Layers 2 and 8, with very ampleness of ω³ from gap:stable-tricanonical-embedding, to a stable genus-g curve, g≥2. Its tricanonical direct image has rank 5g−5, the canonical embedding is into P_S(f_*ω³), of relative projective dimension 5g−6, becoming an embedding into `P^{5g−6}_S` after a local projective frame, its degree is 6g−6 and its Hilbert polynomial is (6t−1)(g−1). These are the numerical inputs to the Hilbert moduli construction, not a second development of the curve cohomology of StableReduction Layer 2.

Here g≥2; every curve family is stable, unpointed, proper, flat and finitely presented with geometrically connected nodal genus-g fibres. The base-general conclusion requires the stated foundational and arbitrary-base approximation inputs; the cohomology and duality results of StableReduction Layer 2 have locally Noetherian base scope.

One proof uses the following inputs and comparisons. Use the m≥2 vanishing of StableReduction Layer 8, very ampleness of ω³ from gap:stable-tricanonical-embedding, and the arbitrary-base extension gap:cm-duality-arbitrary-base, to obtain locally free direct images and their compatible evaluation embedding. Compute the degree of ω³ from deg ω=2g−2 and its Hilbert polynomial and rank by Riemann–Roch on the curve (AlgebraicCurves, StableReduction Layer 2).

For m=3 the rank is 5g−5 and the projective dimension is 5g−6.

([dm](#references), Theorem 1.2 and its corollary, printed pp. 77–78 (PDF pp. 4–5).)

*Needs:* gap:stable-tricanonical-embedding, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, StableReduction Layer 2, StableReduction Layer 3, [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison).

### 1.4 The universal relative polarization locus

Put r=5g−5 and let V be the open locus of stable genus-g curves in `Hilb^{P_g}(P^{r−1}_Z)`. On its universal family f:C_V→V put H=O_C(1) and F=H⊗ω^−3. Form the locally closed universal lowest-cohomology rank-one stratum Z⊂V for Rf_*F. On Z let L=f_*F, with universal base change. Define W⊂Z by requiring the evaluation f*L→F to be an isomorphism. Then W→V is locally closed of finite presentation and, for every T→V, factorization through W is equivalent to existence of a base line bundle L_T with F_T≅f_T*L_T. No such isomorphism or trivialization is retained as extra data.

Here g≥2; all Hilbert objects have polynomial P_g. V is Noetherian and of finite type over Z; testing schemes T are arbitrary. The rank stratum represents the universal base-change condition, not the pointwise equation h⁰=1.

One proof uses the following inputs and comparisons. Stability is open in the universal proper flat Hilbert family; use the existing stable-family definition and the openness part of the comparisons in [finite-stage models](#01-finite-stage-models-of-pointed-curve-diagrams), [genus and cohomology](#02-genus-and-cohomology-over-arbitrary-bases), [log dualizing sheaves](#03-log-dualizing-sheaves-over-arbitrary-bases) and [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison), using EnhancedDerivedSheaves §E1.9 `perfect_proper_pushforward`, AlgebraicModuliForArithmeticGeometry §7.2 `single_degree_free_locus` and gap:cm-duality-arbitrary-base. Rf_*F is perfect of Tor amplitude [0,1]. Apply the existing lowest-degree rank-stratum node with a=0, r=1. Locally a two-term free complex represents it and the rank of its differential is rk(K⁰)−1. This is a scheme-theoretic condition. On Z, remove the proper image of the non-isomorphism support of f*L→F; this produces the open W in Z. Universal base change makes this construction stable under every pullback. If F_T=f_T*B for a line B, universal f_*O=O identifies f_*F_T with B, so T factors through Z and the counit is invertible. Conversely the counit on W supplies the required pullback line. The groupoid of such (B,isomorphism) is contractible, rather than providing a chosen trivialization.

The universal property quantifies over arbitrary, including infinitesimal, T→V. The base line is allowed to be nontrivial.

The construction has the following API.

- W→V→Hilb is a locally closed immersion of finite presentation.
- L=f_*F is invertible on W with evaluation f*L≅F.
- A morphism T→V factors uniquely through W iff F_T is pulled back from a line on T.
- W, L and evaluation pull back to the corresponding construction for every T; the comparison satisfies identity and composition laws.
- For a specified presentation F_T≅f_T*B the identification B≅(f_T)_*F_T is the one induced by adjunction; any two presentations have a unique compatible isomorphism.

**Checks.**

- A tricanonically embedded constant stable curve has F=O and factors through W.
- Over an algebraically closed field take a smooth genus-g curve and a nontrivial degree-zero line A. The very ample H=ω³⊗A has polynomial P_g, but F=A is not pulled back from the field and the point is excluded.
- For a smooth curve C/k and a nonzero class in H¹(C,O), the associated deformation F of O on C×Spec(k[ε]/ε²) is trivial on the geometric fibre but is not pulled back from the base. Whenever H=ω³⊗F is embedded by a lifted complete frame, the resulting Hilbert map does not factor through W.
- If F=f*B for a nontrivial base line B, then the family factors through W and f_*F≅B.

([dm](#references), §1, pp. 77–78, locally closed tricanonical Hilbert locus. The claimed locus is refined into universal rank and evaluation conditions.; [mc1-perf](#references), Lemma 75.26.6 (0D21), p. 65; Lemmas 75.26.7–75.26.8 (0E0S), pp. 65–66. The lowest-cohomology stratum is universal; Lemma 75.26.8 gives universal pushforward of functions for geometrically reduced connected fibres, via Lemma 75.26.7.; [mc0-stacks-moduli](#references), Lemmas 109.22.1, 109.22.3 and 109.22.5, pp. 25–27. Stability and genus cut out the initial Hilbert open.)

*Needs:* EnhancedDerivedSheaves §E1.9 (`perfect_proper_pushforward`), gap:cm-duality-arbitrary-base, AlgebraicModuliForArithmeticGeometry §§2.1–2.2, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, SchemeAndStackFoundations §0.18, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison).

### 1.5 The complete tricanonical Hilbert locus

Over W the bundle f_*H≅E⊗L has rank r. Let a:O_W^r→f_*H be induced by the ambient homogeneous coordinates. Define U_g⊂W as the open where a is an isomorphism, cut out by invertibility of its determinant. Thus U_g is locally closed and of finite type over Z. A T-point is precisely an embedded stable family satisfying H≅ω³⊗f*L and the completeness condition a_T an isomorphism.

Use W and its base line from [the universal relative polarization locus](#14-the-universal-relative-polarization-locus). The map a is the actual coordinate restriction, not a freely chosen trivialization.

One proof uses the following inputs and comparisons. Use projection formula and [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison) to identify f_*H with E⊗L and its arbitrary-base comparison. Use the existing scheme-theoretic rank locus for a morphism between rank-r bundles. Intersect this open with W; the two universal properties give exactly the tricanonical Hilbert presentation of SchemeAndStackFoundations §4.15.

The map U_g→Hilb is locally closed; its points retain an embedded subscheme, not an extra basis of a line.

The construction has the following API.

- U_g→W is the determinant-open immersion.
- The coordinate restriction O^r≅f_*H is canonical on U_g.
- A W-valued family factors through U_g exactly when coordinate restriction is an isomorphism.
- The determinant open, universal curve and coordinate restriction commute with arbitrary base change.

**Checks.**

- The complete genus-two tricanonical embedding belongs to `U_2⊂Hilb^{6T−1}(P⁴)`.
- On a smooth genus-two curve, project a tricanonical embedding in P⁴ from a point outside its secant variety to P³ and include P³ as a hyperplane in P⁴. The resulting embedding has H=ω³ and the same polynomial, but a has rank at most 4, so it is excluded.
- Multiplying every homogeneous coordinate by the same unit leaves the embedded point and its projective frame unchanged.
- For every T→W the complete-series locus is U_g×_W T, including when T is nonreduced.

([dm](#references), §1, pp. 77–78, tricanonical Hilbert scheme. A tricanonical embedding uses all r sections; the determinant condition enforces this over every base.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [the universal relative polarization locus](#14-the-universal-relative-polarization-locus), [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison).

### 1.6 Projective frames and the base-line twist

For every scheme T, U_g(T) is naturally equivalent to the groupoid of stable genus-g C/T with an isomorphism α:P_T(f_*ω³)≅P_T(O_T^r), where an isomorphism of curves must carry α to α. This groupoid is discrete up to unique isomorphism. The induced embedding satisfies H≅ω³⊗f*L for a base line L; L and its trivialization are not extra moduli. For fixed C/T the sheaf of such frames is represented by Isom_T(P(E),P(O^r)), a smooth surjective PGL_r-torsor of relative dimension r²−1.

Projective-bundle convention is invertible quotients. PGL_r denotes the group scheme, equivalently the fppf quotient GL_r/G_m, rather than the quotient of matrices on every ring of points.

One proof uses the following inputs and comparisons. On U_g the identity f_*H≅E⊗L and the coordinate isomorphism give P(E)≅P(E⊗L)≅P(O^r). Conversely, apply the projective-bundle line-twist comparison gap:projective-frame-line-twist to α and the tricanonical immersion. The coordinate restriction is complete by construction, so the resulting embedded curve factors through U_g. Use functoriality of ω and its pushforward to identify the two constructions and all isomorphisms. Faithfulness of the closed immersion makes an automorphism preserving the frame the identity. Apply the smooth group-scheme and projective-frame torsor statement in gap:projective-frame-line-twist. For torsor representability use only part (a) of SchemeAndStackFoundations §1.15: PGL_r is affine, so affine fpqc descent represents its torsors by affine schemes. The general non-affine-group algebraic-space bootstrap is not used.

Projective frames exist fppf locally even when E has no global linear frame. A simultaneous scalar change is invisible; an independent automorphism of C need not be invisible. Over a base with a nontrivial line L and E⊗L≅O^r, the frame is admitted without imposing L≅O.

([dm](#references), §1, pp. 78 and 82–83, projective action; §5, Proposition 5.1, p. 104. Connects tricanonical coordinates, the projective linear action and the atlas; the generic relative line-twist proof is an explicit supplier request.)

*Needs:* gap:projective-frame-line-twist, SchemeAndStackFoundations §5.4, SchemeAndStackFoundations §1.15, SchemeAndStackFoundations §§1.18–1.23, SchemeAndStackFoundations §1.1, SchemeAndStackFoundations §2.22, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [the complete tricanonical hilbert locus](#15-the-complete-tricanonical-hilbert-locus), [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison).

### 1.7 The tricanonical Hilbert locus

For g≥2 put r=5g−5 and `E=f_*ω_{C/S}³`. Define U_g as the locally closed Hilbert subscheme of `P^{r−1}_Z` representing isomorphism classes of stable genus-g families C/S equipped with an S-isomorphism `α:P_S(E)≅P^{r−1}_S`. The embedded curve is obtained by composing the complete tricanonical embedding C→P_S(E) with α. It has Hilbert polynomial (6t−1)(g−1). On an embedded family, O_C(1) identifies with `ω_{C/S}³` up to tensoring by the pullback of an invertible sheaf from S; no trivialization of that base line is part of the projective-frame data. Impose the canonical relative polarization and complete-projective-frame condition, not just the Hilbert polynomial.

Here g≥2 and r=5g−5; projective bundles parametrize rank-one quotients of E. S is an arbitrary scheme; the extension of the locally Noetherian direct-image and base-change theory of StableReduction Layer 2 to arbitrary bases is gap:cm-duality-arbitrary-base.

One proof uses the following inputs and comparisons. Use the tricanonical evaluation embedding C→P_S(f_*ω³) and the fixed-polynomial universal flat Hilbert family. Construct the stable locally closed Hilbert locus with the complete canonical relative polarization. Compare `O_C(1)⊗ω^{-3}` with a base line, retaining that line in descent; a projective frame need not lift to a linear frame. Use relative Hilbert/Isom representability and the projective-frame functor to identify U_g; changing α defines the PGL_r action. The relative-polarization and projective-bundle comparison inputs are [the universal relative polarization locus](#14-the-universal-relative-polarization-locus) and [projective frames and the base-line twist](#16-projective-frames-and-the-base-line-twist).

A curve with the same Hilbert polynomial but the wrong polarization is excluded.

The construction has the following API.

- Pull back the universal embedded stable curve with its complete tricanonical projective frame; O_C(1)≅ω³⊗f*L for an invertible sheaf L on the base, without a chosen trivialization of L.
- S-points of U_g identify with stable C/S equipped with `α:P_S(f_*ω³)≅P^{5g−6}_S`, modulo pointed-family isomorphisms carrying α to α; no linear frame or base-line trivialization is retained.
- PGL(5g−5) acts by changing the projective frame and preserves the locus.

**Checks.**

- For g=2 the embedding is in P⁴, has degree 6, and Hilbert polynomial6t−1.
- The Hilbert polynomial alone does not impose the complete tricanonical relative polarization: the additional condition is O_C(1)≅ω³⊗f*L for a base line L, together with the complete projective-frame comparison.
- A base change of a framed family corresponds to the base change of its point of U_g.
- Over an algebraically closed field k of characteristic zero fix a smooth genus-g curve C₀ with a tricanonical projective coordinate, g≥2, and put r=5g−5. Let `S=D_+(det)⊂P(Mat_r)=P^{r²−1}_k`, so `S≅PGL_{r,k}`. The constant family C₀×S with its tautological varying projective coordinate is an S-point of U_g. Its embedded hyperplane line is `pr_C₀*ω_{C₀/k}³⊗pr_S*O_S(1)`; O_S(1) has exact order r in Pic(S), so it is nontrivial. Requiring an untwisted global hyperplane identification would exclude this projectively framed family.

([dm](#references), Printed p. 78 (PDF p. 5), displayed isomorphism of the H_g functor; Proposition 5.1 proof p. 104 (PDF p. 31); [stacks-projective-bundles-review](#references), Definition 27.21.1 and rank-one quotient representing property; [stacks-projective-picard-review](#references), Lemma 31.29.5, complete statement and proof; [stacks-projective-picard-review](#references), Lemma 31.29.3, complete statement and proof.)

*Needs:* [tricanonical hilbert polynomial and frame rank](#13-tricanonical-hilbert-polynomial-and-frame-rank), AlgebraicModuliForArithmeticGeometry §§2.1–2.2, StableReduction Layer 3, AlgebraicModuliForArithmeticGeometry §§3.1–3.5, [the universal relative polarization locus](#14-the-universal-relative-polarization-locus), [the complete tricanonical hilbert locus](#15-the-complete-tricanonical-hilbert-locus), [projective frames and the base-line twist](#16-projective-frames-and-the-base-line-twist).

### 1.8 The projective-frame torsor

For a stable genus-g family C/S, g≥2, the fibre product `S×_{M̄_g}` U_g is the PGL(5g−5)-torsor of projective frames of P(f_*ω³); it is representable smooth and surjective over S.

Here g≥2; C/S is a stable unpointed genus-g family over a scheme S; projective frames trivialize P_S(f_*ω³).

One proof uses the following inputs and comparisons. Use the framed representing property and locally free base change. Trivialize f_*ω³ locally; transitions are projective linear maps. Import the smoothness of PGL over Z and descent of a torsor.

The torsor need not have a global section.

([dm](#references), Proposition 5.1 proof, p. 104.)

*Needs:* [the tricanonical hilbert locus](#17-the-tricanonical-hilbert-locus), AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, SchemeAndStackFoundations §4.15, [projective frames and the base-line twist](#16-projective-frames-and-the-base-line-twist), SchemeAndStackFoundations §1.15.

### 1.9 A single graph polynomial for stable-curve isomorphisms

For two stable genus-g curves C,D over S, the full unpolarized Isom_S(C,D) lies in the graph-Hilbert component of C×_S D with polynomial Q_g(n)=P_g(2n)=(g−1)(12n−1), computed using pr_C*ω_C³⊗pr_D*ω_D³. Consequently it is represented, locally on S and compatibly with descent, by a quasi-projective scheme of finite presentation. No isomorphism between chosen polarization lines is included as extra data.

Here g≥2; the relative ω³ lines are canonical and ample. Use the Noetherian projective graph construction first, followed by finite-presentation approximation and gluing; arbitrary S is allowed.

One proof uses the following inputs and comparisons. Functoriality of the relative dualizing line gives φ*ω_D≅ω_C for every curve isomorphism φ. The product polarization on its graph is therefore ω_C^6, so its Hilbert polynomial is Q_g. Choose local tricanonical embeddings after trivializing the relevant vector bundles. Apply the Isom representability for a fixed graph Hilbert polynomial of AlgebraicModuliForArithmeticGeometry §§2.1–2.2; this is finite presentation, whereas the unbounded Isom theorem is only locally of finite presentation. The representing schemes and their canonical functors descend on overlaps. Use the comparisons in [finite-stage models](#01-finite-stage-models-of-pointed-curve-diagrams), [genus and cohomology](#02-genus-and-cohomology-over-arbitrary-bases), [log dualizing sheaves](#03-log-dualizing-sheaves-over-arbitrary-bases) and [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison), using EnhancedDerivedSheaves §E1.9 `perfect_proper_pushforward` and gap:cm-duality-arbitrary-base to descend the curve and dualizing data to Noetherian affine models and recover arbitrary-base finite presentation. Do not invoke polarized Isom representability for pairs (φ,line-isomorphism): that adds a G_m worth of data.

For genus two the graph polynomial is 12n−1. An automorphism contributes one Isom point; choosing a scalar identification of polarization lines must not multiply it by G_m. The finite-presentation conclusion does not come from treating an arbitrary unbounded Hilbert union as finite type.

([dm](#references), §1, Theorem 1.11 and its proof, pp. 84–85. Represents stable Isom and uses preservation of the canonical polarization to control the graph.; [dm](#references), §1, pp. 77–78. Riemann–Roch determines Q_g by doubling the twist exponent.)

*Needs:* EnhancedDerivedSheaves §E1.9 (`perfect_proper_pushforward`), gap:cm-duality-arbitrary-base, AlgebraicModuliForArithmeticGeometry §§2.1–2.2, SchemeAndStackFoundations §0.9, SchemeAndStackFoundations §1.15, [the tricanonical hilbert polynomial](#11-the-tricanonical-hilbert-polynomial), [arbitrary-base tricanonical comparison](#12-arbitrary-base-tricanonical-comparison).

### 1.10 The universal Isom scheme as an action groupoid

Let C_U→U=U_g be the universal curve and `R=Isom_{U×U}(pr_1*C_U,pr_2*C_U)`. There is a canonical isomorphism U×PGL_r≅R sending (u,h) to (u,h·u,h restricted to C_u). Its source is u, its target is h·u, its unit is (u,1), its inverse is (h·u,h^−1), and composition of h_1 followed by h_2 is h_2h_1. These formulas identify the scheme groupoid with the projective-coordinate action, functorially on all schemes.

Use complete projective frames, not bases of E. R is the bounded bare Isom scheme of [a single graph polynomial for stable-curve isomorphisms](#19-a-single-graph-polynomial-for-stable-curve-isomorphisms).

One proof uses the following inputs and comparisons. Every isomorphism of universal curves induces an isomorphism of their tricanonical bundles; frame comparison extends it uniquely to an ambient projective transformation. Conversely restrict an ambient transformation carrying one embedded curve to the other. The two maps are inverse on every test scheme, so Yoneda identifies the schemes. Transport identities, inverses and composition through this bijection. The fppf frame-torsor description then identifies [U/PGL_r] with the defined stable-curve stack; generic quotient-stack theory is imported from SchemeAndStackFoundations §§1.18–1.23, not redeveloped.

The relation has dimension dim(U)+r²−1 when U is smooth, even though R→U×U has zero-dimensional geometric fibres.

The construction has the following API.

- U×PGL_r≅R over U×U with (s,t)(u,h)=(u,h·u).
- The identity arrow at u is (u,1).
- The composite (u,h_1) then (h_1·u,h_2) is (u,h_2h_1).
- The inverse of (u,h) is (h·u,h^−1).
- The comparison commutes with pullback of schemes and with both groupoid projections.

**Checks.**

- Restricting the identity projective transformation gives the identity curve isomorphism.
- For a curve with a nontrivial automorphism, the stabilizer of its Hilbert point has the corresponding distinct element; the quotient is not an orbit set.
- A scalar matrix represents the identity element of PGL_r and produces the identity relation arrow.
- For two successive coordinate changes the order is h_2h_1, as verified by restriction to the embedded curve.

([dm](#references), §1, pp. 82–83, projective action; §5, Proposition 5.1, p. 104. The projective action gives the moduli presentation; this target supplies the all-test-scheme relation identification.)

*Needs:* SchemeAndStackFoundations §1.21, SchemeAndStackFoundations §1.20, SchemeAndStackFoundations §4.15, [projective frames and the base-line twist](#16-projective-frames-and-the-base-line-twist), [a single graph polynomial for stable-curve isomorphisms](#19-a-single-graph-polynomial-for-stable-curve-isomorphisms).

### 1.11 Hilbert quotient presentation

For g≥2 the natural morphism [U_g/PGL(5g−5)]→M̄_g is an equivalence of stacks; it gives a finite-type smooth atlas and does not require a GIT coarse quotient.

Here g≥2; every curve family is stable, unpointed, proper, flat and finitely presented with geometrically connected nodal genus-g fibres. The base-general conclusion requires the stated foundational and arbitrary-base approximation inputs; the cohomology and duality results of StableReduction Layer 2 have locally Noetherian base scope.

One proof uses the following inputs and comparisons. An equivariant family descends through the projective-frame torsor by effective descent. Every stable family acquires a frame locally; marking-free isomorphisms are exactly the descended arrows.

Keep quotient stack and coarse quotient distinct.

([dm](#references), Proposition 5.1 and its proof, printed p. 104 (PDF p. 31); framed functor p. 78 (PDF p. 5).)

*Needs:* [the projective-frame torsor](#18-the-projective-frame-torsor), SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, [the universal isom scheme as an action groupoid](#110-the-universal-isom-scheme-as-an-action-groupoid), SchemeAndStackFoundations §1.21, SchemeAndStackFoundations §1.20.

### 1.12 The normalization sequence and the deformation dimension

Let C/k be a proper geometrically connected nodal curve of pure dimension one over an algebraically closed field, and ν:⊔C_v→C its normalization. Let D_v be the reduced divisor of branches above nodes and `N_q=T_{q+}C_v⊗_k T_{q−}C_w` (also when both branches lie on one component). Then `T_C≅ν_*(⊔T_{C_v}(−D_v))`, Ext²_C(Ω_C,O_C)=0, and there is a natural exact sequence 0→⊕_v `H¹(C_v,T_{C_v}(−D_v))→Ext¹_C(Ω_C,O_C)→⊕_q` N_q→0. If C is stable of genus g≥2, then also Ext⁰_C(Ω_C,O_C)=0 and dim Ext¹_C(Ω_C,O_C)=3g−3. The sequence has no asserted canonical splitting.

Properness, geometric connectedness, nodality and pure dimension one suffice for Ext² vanishing and the exact sequence; only Ext⁰ vanishing and the dimension formula require stability and g≥2. All characteristics are allowed. Ext is coherent sheaf Ext over O_C followed by global derived Hom; Ω_C is algebraic Kähler differentials on the finite-type curve. N_q is a tensor product of tangent lines, not a chosen copy of k until branch parameters are fixed.

One proof uses the following inputs and comparisons. Use normalization at nodes from StableReduction Layer 1: a derivation on the node lifts to derivations vanishing on both branches. The local hypersurface resolution gives sheaf Ext¹ supported at nodes with fibres N_q and sheaf Ext^i=0 for i≥2. On the reduced nodal curve the conormal map in the hypersurface presentation is injective, so the cotangent complex is quasi-isomorphic to Ω_C for this computation. Use the local-to-global coherent Ext spectral sequence of gap:coherent-curve-deformation-ext, together with cohomological dimension one from StableReduction Layer 2. This gives the exact sequence and vanishing; the zero-dimensional support kills H¹ of sheaf Ext¹. For the stable clause, stability implies `H⁰(T_{C_v}(−D_v))=0`. Riemann–Roch gives h¹=3g_v−3+deg D_v. Use Σdeg D_v=2δ and g=Σg_v+δ−|vertices|+1 to obtain Σh¹+δ=3g−3. The global-to-local deformation map is smooth by SchemeAndStackFoundations §4.6 and Lemma 93.16.3; the displayed tangent surjection identifies its δ local smoothing directions. With unobstructedness these become independent parameters in the completed framed Hilbert charts of §1.13. Tangent surjectivity alone is not the formal smoothness assertion. No averaging over automorphism groups is used.

For smooth genus two, the local-node sum is zero and h¹(T_C)=3. For an irreducible one-nodal genus-two curve, the normalization has genus one: h¹(T_E(−p−q))=2 and the local contribution is 1. For the genus-two theta curve consisting of two P¹s meeting at three nodes, both `H¹(T_{P¹}(−3 points))` vanish, and the three local directions give dimension 3. Ordinary algebraic differentials of k[[u,v]] must not replace continuous deformation theory of a complete local algebra. For the unstable smooth curve P¹, the same Ext² vanishing and exact sequence hold, while h⁰(T)=3 and Ext¹=0; neither stable-only conclusion may be applied.

([dm](#references), §1, Lemmas 1.3–1.4 and Proposition 1.5, pp. 79–82; Theorem 1.6, p. 83. The obstruction calculation and independent node parameters are expanded into the normalization and local-to-global sequence.; [mc1-def](#references), Lemmas 93.16.3–93.16.4 (0DZP, 0DZQ), pp. 28–29; Lemma 93.15.1, p. 27. For separated finite-type curves smooth outside finitely many points, Lemma 93.16.3 gives a smooth global-to-local deformation map and the henselian/completed comparisons with tangent isomorphisms; the lci hypothesis in Lemma 93.16.4 gives unobstructedness.)

*Needs:* gap:coherent-curve-deformation-ext, StableReduction Layer 1, StableReduction Layer 2, StableReduction Layer 3, SchemeAndStackFoundations §4.6, SchemeAndStackFoundations §§2.1–2.2, 2.6, 2.18–2.22.

### 1.13 Completed framed Hilbert charts

Let C/k be a stable connected nodal curve of genus g≥2 over an algebraically closed field, with δ nodes. Choose Λ=k in characteristic zero and Λ=W(k) in characteristic p. The deformation groupoid over Artinian local Λ-algebras with residue k and a fixed special-fibre identification has no infinitesimal automorphisms; its isomorphism-class functor is prorepresented by `R_C≅Λ[[t_1,…,t_{3g−3}]]`, noncanonically, with the node equations uv=t_i for 1≤i≤δ. At a chosen framed point u of (U_g)_Λ(k), the completed local ring is noncanonically `R_C[[z_1,…,z_{r²−1}]]`. Hence U_g→Spec Z is smooth of relative dimension (3g−3)+(r²−1), and its smooth-curve open U_g^sm is dense in every irreducible component.

The chosen special-fibre identification is part of a deformation object; automorphisms of C are not discarded from the moduli stack. The displayed completed ring is that of the Λ-base-changed Hilbert scheme at its k-rational point. It is not claimed to be the completion of a finite-type Z-point with residue field an arbitrary algebraically closed k. The identifications of power-series rings and node parameters involve choices.

One proof uses the following inputs and comparisons. Import the versal deformation of a node from SchemeAndStackFoundations §§4.1–4.10, 4.14–4.15 and the exact sequence above, using the continuous-versus-algebraic comparison of Lemma 93.16.3 (0DZP) for the completed node. Schlessinger prorepresentability uses H⁰(T_C)=0, not absence of finite automorphisms of C. Compare the deformation functor of the existing Hilbert scheme with deformations of C and a lift of its projective frame. The frame torsor is smooth of dimension r²−1, so frame liftings contribute exactly that many formal variables. Use the scheme-formal comparison of AlgebraicModuliForArithmeticGeometry §§8.1–8.3 after base change to Λ; u is a finite-type point over Λ. The ample compatible ω³ and SchemeAndStackFoundations §§4.1–4.10, 4.14–4.15 Grothendieck algebraization give effectivity and full faithfulness of the formal family, without invoking a generic algebraization theorem whose finite-type-residue hypothesis over Z fails for k=F_p-bar. Apply the infinitesimal lifting criterion for the finitely presented atlas, coefficient-ring descent, and the dimension comparison in gap:coefficient-completion-smoothness. This supplies native scheme smoothness rather than equating formal smoothness with smoothness without finite presentation. In each such completion the nonsmooth-curve locus is the union t_1…t_δ=0; the complement is dense. Faithful-flat local comparison gives density in each irreducible component of U. This conclusion uses no properness of Isom or of the moduli stack.

For genus two the miniversal curve deformation has 3 variables; the P⁴ Hilbert atlas has 3+24=27 relative variables. The Hilbert atlas is smooth of positive relative dimension over the moduli stack; it is not declared étale. The construction remains valid at a stable curve whose automorphism group has order divisible by the residue characteristic.

([dm](#references), Deformation argument, pp. 78–83; Theorem 1.6 and Corollary 1.7, p. 83. Supplies the smooth deformation picture, embedding directions and local node equations.; [mc1-def](#references), Lemmas 93.16.3–93.16.4 (0DZP, 0DZQ), pp. 28–29. The smooth global-to-local map, local-to-completed comparisons and lci unobstructedness justify using the continuous completed-node hull; these are not the gluing statement of Lemma 93.16.2.; [mc0-stacks-moduli](#references), §109.15, Lemma 109.15.1, pp. 15–16; Lemmas 109.22.6 and 109.22.8, pp. 26–27. Explains the Cohen-coefficient lifting argument for smoothness over Z and density of smooth curves.; [mc1-stackdim](#references), Definition 107.5.7 (0DRL) and Lemma 107.5.10 (0DRP), pp. 11–13 (mc1-stackdim lines 508–536). The relative dimension of the smooth Hilbert atlas at a point adds to the dimension of the stack: 27=3+24 at genus two.)

*Needs:* gap:coefficient-completion-smoothness, SchemeAndStackFoundations §4.6, SchemeAndStackFoundations §4.4, SchemeAndStackFoundations §4.10, SchemeAndStackFoundations §4.1, AlgebraicModuliForArithmeticGeometry §§8.1–8.3, [the normalization sequence and the deformation dimension](#112-the-normalization-sequence-and-the-deformation-dimension), [projective frames and the base-line twist](#16-projective-frames-and-the-base-line-twist).

### 1.14 Algebraic labelled boundary branches

Let u be a geometric point of U_g whose curve has δ nodes. Pull back the finite unramified singular scheme Σ=Sing(C_U/U), defined by Fitt_1(Ω), to an étale neighbourhood T→U of u. After shrinking T, it splits as a disjoint union of δ closed immersions Z_i→T. The labels are auxiliary; the ideals I_i defining Z_i are actual algebraic ideals. After the completed framed comparison each I_i becomes the ideal (t_i). The nonsmooth-curve locus on T has underlying set ⋃|Z_i|, and its reduced effective Cartier divisor structure is identified in §1.15.

Here T contains the chosen geometric lift of u and no additional singular branches meeting that lift. Σ is finite unramified, not necessarily flat or étale over U.

One proof uses the following inputs and comparisons. Import the finite unramified singular scheme from SchemeAndStackFoundations §4.18. In a node chart xy=a its ideal is (x,y), and its map to the base is the closed immersion a=0. Apply the finite-unramified splitting theorem of SchemeAndStackFoundations §0.11 (Stacks Lemma 41.17.3, tag 04HJ); shrink to remove pieces with no point over u. Identify each branch ideal after the Λ-completed local comparison by the node equation xy=t_i. Keep these algebraic ideals for the boundary argument, rather than postulating descent of arbitrary factors of a formal equation.

Every geometric node yields one branch at the chosen lift, while monodromy may permute labels on overlaps.

The construction has the following API.

- `Σ_T≅⊔_{i=1}^δ` Z_i over T, with each Z_i→T a closed immersion.
- I_i is the finite-presentation ideal of Z_i; after completed framed comparison it generates (t_i).
- A point of T represents a smooth curve iff it lies in no Z_i.
- Refining T or permuting node labels pulls back or permutes the ideals; their union and eventual product divisor are label-independent.

**Checks.**

- For a smooth curve δ=0, Σ_T is empty and the branch family is empty.
- For a one-node versal chart xy=t, Σ is Spec(A/(t)) and its base ideal is (t). It is not an étale cover of Spec A.
- For two independent nodes, Σ_T=V(t_1)⊔V(t_2). The divisors intersect in T, but the two components of Σ_T are disjoint.
- A permutation of two nodes interchanges I_1,I_2 and preserves I_1I_2 and the smooth-curve open.

([mc1-etale](#references), Lemma 41.17.3 (04HJ), pp. 19–20. Finite unramified maps split into closed immersions after étale target localization.; [dm](#references), Theorem 1.6 and Corollary 1.9, pp. 78–83. Independent node equations identify the completed ideals of the labelled branches.)

*Needs:* SchemeAndStackFoundations §0.11, SchemeAndStackFoundations §4.18, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, [completed framed hilbert charts](#113-completed-framed-hilbert-charts).

### 1.15 Transverse relative boundary charts

At the geometric point u above, choose T and I_1,…,I_δ as in [algebraic labelled boundary branches](#114-algebraic-labelled-boundary-branches). After shrinking, each I_i is generated by a nonzerodivisor a_i, every intersection V(a_i:i∈J) is smooth over Z of relative codimension |J| in T, and (a_1,…,a_δ):T→A^δ_Z is smooth near u. Étale locally this extends to relative étale coordinates on T. Thus the effective Cartier divisor with ideal ∏I_i is reduced, has support equal to the complement of U^sm in T, and has equation a_1…a_δ=0 in these coordinates. These divisors descend to the relative normal-crossing boundary of the stable-curve stack. Global strict normal crossings and globally labelled branches are not asserted.

Here g≥2; U is smooth of relative dimension N=3g−3+r²−1 by [completed framed hilbert charts](#113-completed-framed-hilbert-charts). Relative normal crossings over Z means étale locally the union of coordinate hyperplanes in a scheme étale over A^N_Z; it is stronger than absolute regularity of intersections.

One proof uses the following inputs and comparisons. Use actual algebraic ideals I_i, and the faithful-flat coefficient-completion comparison in gap:coefficient-completion-smoothness to detect invertibility and injectivity of I_i→O_T from their completed ideals (t_i). Apply the same comparison to all finite intersections: their completed rings are Λ[[remaining t,z]], so the intersections are smooth over Z of the stated codimensions. gap:coefficient-completion-smoothness explicitly includes descent of these native scheme properties. The relative differentials da_1,…,da_δ are independent at u; equivalently the relative tangent map of (a_1,…,a_δ) is surjective there. The smooth coordinate criterion in gap:relative-boundary-coordinates gives a smooth map to A^δ_Z and then étale coordinates after adjoining N−δ functions. The product ideal defines a reduced effective Cartier divisor and is independent of choices of generators and labels. The intrinsic singular scheme makes its ideals agree on refinements of the relation groupoid. Use the relative-normal-crossing descent contract in gap:relative-boundary-coordinates to descend the divisor along the smooth atlas and obtain the normal-crossings boundary of SchemeAndStackFoundations §4.15. The generic absolute-normal-crossings node alone is insufficient.

For δ=0 the product ideal is O_T and the divisor is empty. For two nodes the boundary equation is a_1a_2, each component has relative codimension 1 and their intersection has relative codimension 2. Over Z_p, the vertical divisor p=0 in a smooth chart is not a relative boundary branch: it fails relative smoothness and cannot serve as a_i. Automorphisms may exchange the branches, so the descended boundary need not be globally strict normal crossing.

([dm](#references), Definition 1.8 and Corollary 1.9, p. 83; §5, Proposition 5.1, p. 104. The boundary is described by independent node parameters and transported to moduli.; [mc1-etale](#references), §41.21, Lemmas 41.21.2 (0BIA), 41.21.3 (0CBP), 41.21.5 (0CBQ), 41.21.6 (0CBR) and 41.21.7 (0CBS), pp. 26–29. These give the absolute regular-intersection criterion, smooth pullback and étale-local tests. Lemma 41.21.7 assumes J-2 or Nagata; the finite-type Z charts satisfy both. None substitutes for the relative smooth-intersection enhancement of gap:relative-boundary-coordinates.)

*Needs:* gap:relative-boundary-coordinates, gap:coefficient-completion-smoothness, SchemeAndStackFoundations §§4.1–4.10, 4.14–4.15, SchemeAndStackFoundations §§1.18–1.23, [algebraic labelled boundary branches](#114-algebraic-labelled-boundary-branches), [completed framed hilbert charts](#113-completed-framed-hilbert-charts).

### 1.16 The universal source-density valuative test

For the universal Isom morphism R=U_g×PGL_r→U_g×U_g, the open R^sm=U_g^sm×PGL_r is dense in every irreducible component of its SOURCE. The refined source-generic DVR properness test therefore involves two stable families whose common generic curve is smooth. Smooth-generic stable uniqueness over the same DVR supplies the unique lift, so R→U_g×U_g is proper. Fppf local projective frames and base change then imply properness of Isom_S(C,D) for every pair of stable curves over arbitrary S, including those with nodal generic fibre.

Here U_g is of finite type over Z; its universal relation is finite type by the bounded graph theorem. The refined test fixes A⊂κ(η), Frac(A)=κ(η), for a generic point η of an irreducible component of R. Use the same-DVR uniqueness theorem for two existing stable models; no extension of the fraction field is allowed in this Isom test.

One proof uses the following inputs and comparisons. Smoothness of PGL_r makes its projection from R open and surjective. Density of U^sm in U therefore pulls back to density in every component of R. A generic point of R lies in R^sm, independently of whether its image is generic in U×U. Apply the source-dense trait criterion of gap:source-dense-valuative, proved as in Stacks 32.15.3, not the source paper’s unproved generic assertion. For its canonical generic-point top arrow, both universal curves have a smooth generic fibre. The upstream StableReduction Layer 8 uniqueness theorem extends this isomorphism uniquely across A. The extension is a point of the full bare Isom scheme, with its original two frames. Conclude properness over U×U and descend on an fppf cover of S on which C and D acquire projective frames. Properness is stable under base change and local on the target in this topology. This covers nodal generic fibres without incorrectly applying smooth-generic uniqueness directly to them.

Density in the target U×U alone does not supply the hypothesis. A test pair with nodal generic fibre is covered by descent of universal properness, not by a false smooth-generic reduction on that pair. After the unramified criterion, proper plus locally quasi-finite gives finite by the existing native Mathlib declaration.

([dm](#references), Theorem 1.11, pp. 84–85; Theorem 4.19, p. 103; §5, proof of Theorem 5.2, pp. 104–105. Uses smooth generic curves to prove universal separatedness; the source-density quantifiers are made explicit.; [stacks-noetherian-valuative-KKjBS6](#references), Lemmas 32.15.2–32.15.3 (0207, 0208), pp. 39–42. Proves that actual generic points of irreducible components of the source suffice for the DVR criterion.; [mc1-stackval](#references), Lemma 106.11.3 (0CQM), pp. 28–29 (mc1-stackval lines 1400–1412). The stack form of the same criterion, with a dense-image test morphism into a separated finite-type source, is the form consumed by the properness proof of SchemeAndStackFoundations §4.15.)

*Needs:* gap:source-dense-valuative, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, StableReduction Layer 8, SchemeAndStackFoundations §1.20, [the universal isom scheme as an action groupoid](#110-the-universal-isom-scheme-as-an-action-groupoid), [completed framed hilbert charts](#113-completed-framed-hilbert-charts), [a single graph polynomial for stable-curve isomorphisms](#19-a-single-graph-polynomial-for-stable-curve-isomorphisms).

### Examples

At g=2 the Hilbert polynomial is 6T−1. A frame is projective: tensoring all five sections by a base line changes a GL frame but preserves its PGL frame. For a curve with one node the formal chart has one smoothing coordinate t; with two nodes it has t₁,t₂ and boundary t₁t₂=0. Permuting branches need not define globally labelled components.

### Dependencies

Layer 0; StableReduction Layers 2–3, 8–9; SchemeAndStackFoundations §§4.6, 4.10, 4.14–4.15; AlgebraicModuliForArithmeticGeometry §§1.1–2.2, 7.2, 8.1–8.3. Hilbert quotient identification uses the family object, not terminal algebraicity or properness as its own premise.

## Layer 2: universal curves and the full pointed stable range

### 2.0 Coefficients, completions and scalar actions

A labelled setup applies only to the statement or hypothesis that links to it. Every formula and finiteness condition below is retained from that target; subsequent local hypotheses can specialize its range. In particular finite-projective hypotheses in a setup govern its assembly/equivalence assertions, rather than every projection constructed before those hypotheses.

#### Coefficient convention C1

Let A be a commutative ring, γ,δ,s,t∈A, R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), ι:A→R its actual coefficient map, p⊆A and m⊆R with p⊆ι⁻¹(m), Â=AdicCompletion(p,A), R̂=AdicCompletion(m,R), and Qₙ=R/mⁿ with the completed-coefficient actions. Let N be an Â-module with its compatible restricted A-action (Module A N and IsScalarTower A Â N are explicit native binders), and G_N the native Â-linear diagram n↦Qₙ⊗_Â N. This action compatibility imposes no flatness or finite-generation condition on N. In the retraction statements F=Fin(r)→Â and Â-linear maps i:N→F, r:F→N are displayed data; factorisation, separation and the limit assertion explicitly require r∘i=id_N. In the projective statements require N finite and projective over Â, not finite over A. A and N lie in one common universe, matching the finite-free limit construction; no universe-resizing comparison is supplied.

#### Coefficient convention C2

Let A be a commutative ring and R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), with its native coefficient map ι:A→R. Choose ideals p⊆A and m⊆R with p⊆ι⁻¹(m). Write Â=AdicCompletion(p,A), R̂=AdicCompletion(m,R), Qₙ=R/mⁿ and T=R̂⊗_Â N. The Â-actions are the inherited completed coefficient actions; R acts on R̂ and Qₙ by the native completion and quotient maps, and on tensors through the left factor. These commuting actions also define the Â-module structure on R-linear Hom spaces. N has compatible A/Â-actions and is finite projective over Â in the assembly and equivalence assertions; it need not be finite over A. L is any R-module, including the actual section ideal J=(X−ι(s),Y−ι(t)) or D=Hom_R(J,R); no Â-action on L is assumed. A,N,L and any further source K inhabit one common universe in the native comparison. Let G_N be the native Â-module diagram n↦Qₙ⊗_Â N, with transitions τᵢⱼ for i≤j, and Pₙ:T→Qₙ⊗_Â N its actual tensor evaluation.

#### Coefficient convention C3

Let A be a commutative ring, γ,δ,s,t∈A, q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)) the existing polynomial nodal chart and ι:A→R its native coefficient map. Let p⊆A and m⊆R be ideals with h:p⊆ι⁻¹(m). Put Â=AdicCompletion(p,A), R̂=AdicCompletion(m,R), e_A:A→Â and e_R:R→R̂ the native maps, π_A,n and π_R,n the native finite-quotient evaluations, and λₙ:A/pⁿ→R/mⁿ the ring map induced by ι, which exists since pⁿ⊆ι⁻¹(mⁿ).

#### Coefficient convention C4

Let A be a commutative ring, γ,δ,s,t∈A, R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), ι:A→R the inherited native coefficient map, p⊆A and m⊆R ideals with p⊆ι⁻¹(m), and n≥0. Put Â=AdicCompletion(p,A), Bₙ=A/pⁿ and Qₙ=R/mⁿ. The actual actions on Qₙ are induced by λₙ:Bₙ→Qₙ, A→Bₙ and evalₙ:Â→Bₙ.

#### Coefficient convention C5

Let A be a commutative ring, γ,δ,s,t∈A, R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), ι:A→R its actual coefficient map, p⊆A and m⊆R ideals with p⊆ι⁻¹(m), Â=AdicCompletion(p,A), R̂=AdicCompletion(m,R), Qₙ=R/mⁿ with the inherited Â-actions, r∈ℕ, N=Fin(r)→Â, and G the native Â-linear diagram n↦Qₙ⊗_Â N. The proof of p⊆ι⁻¹(m) is packaged as Fact in the comparison; it is not an extra hypothesis.

#### Coefficient convention C6

Let A be a commutative ring, γ,δ,s,t∈A, R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), ι:A→R its actual coefficient homomorphism, p⊆A and m⊆R ideals with p⊆ι⁻¹(m). Set Â=AdicCompletion(p,A), Qₙ=R/mⁿ, and let N be an arbitrary Â-module with its restricted A-action and the actual scalar tower A→Â→N. On each Qₙ use the finite coefficient actions induced by A/pⁿ and evaluation Â→A/pⁿ, identified with the inherited A-action by the explicit scalar bridge.

#### Coefficient convention C7

Let A be a commutative ring, γ,δ,s,t∈A, R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), ι:A→R the actual coefficient homomorphism, p⊆A and m⊆R ideals with p⊆ι⁻¹(m), Â=AdicCompletion(p,A), and Qₙ=R/mⁿ. Let N be an arbitrary Â-module with its restricted A-action and the actual scalar tower A→Â→N. Use the finite quotient Â-actions induced by evaluation Â→A/pⁿ, quotient transitions τᵢⱼ:Qⱼ→Qᵢ, and original-base diagram Fᴬ with objects Qₙ⊗_A N.

#### Coefficient convention C8

Let A be any commutative ring, γ,δ,s,t∈A, q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the coefficient algebra map, u=[X], v=[Y], J=(u−ιs,v−ιt) and D=Hom_R(J,R). All duals are R-linear and use native Module.Dual. For any A-module M put N_M=R⊗_A M with its inherited left R-action and η=Module.Dual.eval R J.

#### Coefficient convention C9

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map.

### 2.1 The binary quadratic node form

For a commutative ring A and γ,δ∈A define `q_{γ,δ}(x,y)=x²+γxy+δy²`. Its nondegeneracy condition is that γ²−4δ is a unit. Over a field this describes a possibly nonsplit ordinary double point, including characteristic two. The definition is the polynomial form; the discriminant condition is an explicit hypothesis, not an arbitrary predicate field.

One proof uses the following inputs and comparisons. Construct the polynomial and its evaluation using the existing ring operations. The coefficient matrix ((2,γ),(γ,2δ)) of its partial derivatives has determinant 4δ−γ²=−(γ²−4δ), a unit exactly when the discriminant is; the lifting lemma is a separate target.

No division by 2 is used.

The construction has the following API.

- q(x,y)=x²+γxy+δy².
- For a ring map φ, `φ(q(x,y))=q_{φγ,φδ}(φx,φy)`.
- For ε²=0 and f=(γ²−4δ)(xu+yv), the explicit coordinate changes μ=−2δu+γv and ν=γu−2v give q(x+εμ,y+εν)=q(x,y)+εf. This ring identity specializes to formal power series; expressing a zero-constant series as xu+yv is the separate algebraic input.

**Checks.**

- `q_{0,−1}(x,y)=x²−y²`; this is nondegenerate when2 is invertible.
- Over a characteristic-two field `q_{1,0}=x²+xy` has unit discriminant1 and two distinct branches.
- `q_{0,0}=x²` has discriminant0 and is excluded from the nondegenerate node hypothesis.

([knudsen2012](#references), Definition 1.1, pp. 4–5.)

*Needs:* `IsUnit`.

### 2.2 The three-pointed rational moduli scheme

M₀,₃=M̄₀,₃≅Spec Z. Every ordered smooth three-pointed rational family is uniquely trivialized as (P¹;0,1,∞); no singular stable genus-zero three-pointed fibre exists.

The fixed stable pair is (g,n)=(0,3); S is a base scheme.

One proof uses the following inputs and comparisons. Use the normalization genus and stable-flag count to exclude reducible stable three-pointed trees. Trivialize the genus-zero family locally and use the unique three-point projectivity; descend the unique trivialization.

The automorphism group of the ordered triple is trivial.

([knudsen2](#references), Theorem 2.7 proof, printed p. 179 (PDF p. 19), initial g=0,n=3 case.)

*Needs:* SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, StableReduction Layer 1, StableReduction Layer 3.

### 2.3 Coefficient Hom and matrix transpose

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For every 2×2 matrix W over R and every tensor z∈R²⊗_A M, E_M(U_M(Wᵀ)z)=E_M(z)∘W, where W is its native matrix-to-linear map.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use tensor induction. The pure-tensor case evaluates E_M via the native finite-free Hom formula, expands the two finite sums and rearranges ring multiplication; addition and zero follow from linearity.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495.)

*Needs:* `TensorProduct.piLeft`, `LinearEquiv.piRing`, `LinearEquiv.piRing_symm_apply`.

### 2.4 Completed coefficient evaluations commute

Under coefficient convention C3. For i≤j and a∈Â, factor_p(j,i)(π_A,j(a))=π_A,i(a).

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Transport raw completion coherence through the native quotient-by-pⁿ•⊤ identification; quotient representatives verify the transition square.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* `AdicCompletion.transitionMap_comp_eval_apply`, `AdicCompletion.evalₐ`.

### 2.5 Completed coefficients on the finite base

Under coefficient convention C4. Equip Bₙ with the Â-algebra defined by the native finite evaluation evalₙ.

All actions are the specified actual restrictions. No noetherianity, localness or discriminant hypothesis is introduced.

One proof uses the following inputs and comparisons. Use the algebra attached to the actual evaluation ring homomorphism.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

The construction has the following API.

- Under coefficient convention C4. The chosen algebra map Â→Bₙ is evalₙ on every a∈Â.
- Under coefficient convention C4. For a∈A, evalₙ(e_A(a))=[a].
- Under coefficient convention C4. The actual algebra map Â→Bₙ is surjective.
- Under coefficient convention C4. Assume p is finitely generated. If evalₙ(a)=0, then a∈pⁿ·Â, viewed as pⁿ acting on the whole A-module Â.

**Checks.**

- For A=ℤ, p=(2) and n=3, evaluation sends the completed coefficient 1/3∈ℤ₂ to 3 in B₃=ℤ/8, since 3·3=9≡1 modulo 8; acting by 1/3 then sends 2 to 6, so the Â-action on B₃ is not the trivial action through 1.
- In the same fixture 8∈ℤ₂ evaluates to 0 in B₃ and lies in 2³ℤ₂, while 4 evaluates to 4≠0; an evaluation modulo pⁿ⁻¹ instead of pⁿ would kill 4.
- At n=0 the quotient B₀=A/A is the zero ring and evaluation is the zero map; at n=3 the image of 1 is nonzero, so the level index is not ignored.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* `AdicCompletion.evalₐ`.

### 2.6 Coordinate correction over a small extension

Let A be a commutative ring, γ,δ∈A with d=γ²−4δ a unit, and B=A[ε]/(ε²). For every power series f∈A[[x,y]] with zero constant term, write f=xu′+yv′ with u′,v′∈A[[x,y]], put u=d⁻¹u′, v=d⁻¹v′, μ=−2δu+γv and ν=γu−2v; then q(x+εμ,y+εν)=q(x,y)+εf in B[[x,y]]. The identity works also in characteristic two.

One proof uses the following inputs and comparisons. Expand the two squares and the cross term. Terms with ε² vanish; the remaining coefficient is d(xu+yv)=f.

Whenγ=1 and char2 the formulas still give the required correction.

([knudsen2012](#references), Lemma 2.6 and proof, pp. 8–9.)

*Needs:* [the binary quadratic node form](#21-the-binary-quadratic-node-form).

### 2.7 The node-section matrix factorization

For a commutative ring A and γ,δ,x,y,s,t∈A define Φ=((δy+δt+γx,x+s+γt);(−(x−s),y−t)) and Ψ=((y−t,−(x+s+γt));(x−s,δy+δt+γx)). These explicit matrices constitute the special node-section factorization; their polynomial product relation and the noetherian nodal exactness theorem are separate nodes. No unit-discriminant hypothesis is needed to form the matrices.

The two matrices on the actual pointed quotient are `nodePhi` and `nodePsi` in Suggested.lean.

One proof uses the following inputs and comparisons. Use the pinned Matrix.of to form the two matrices from their four entries. The product relation and exactness are separate applications; forming the two matrices does not depend on those proofs.

The general Eisenbud regular-local MCM equivalence is not needed.

The construction has the following API.

- The left matrix is Φ with the stated entries.
- The right matrix is Ψ with the stated entries.
- ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂.
- In the polynomial quotient, cokernel Ψ is J via [z]↦cz₀−dz₁; cokernel Φ is Hom_R(J,R) via [z]↦z₀incl−z₁ε. These are separate targets.

**Checks.**

- At s=t=0 the left matrix has entries (δy+γx,x;−x,y), the explicit specialization used for the node ideal.
- The same product identities hold when2=0 andγ=1.
- The geometric node conclusions require unit discriminant; the raw matrix product identity alone does not exclude a double line.
- Specializing γ=δ=s=t=0 and the coordinates to the scalars x=y=0 in ℤ makes both matrices zero, with kernel ℤ² and image zero; the discriminant there is 0, so this is no counterexample to the nodal theorem, but exactness is a statement about the polynomial quotient, not about specialized scalar matrices.

([knudsen2012](#references), §3, pp. 11–12.)

*Needs:* [the binary quadratic node form](#21-the-binary-quadratic-node-form), `Matrix.of`, `Matrix.scalar`.

### 2.8 Polynomial ring of a pointed section

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct these as native polynomial quotient, ideal and linear-map modules; the section evaluation ev:R→A sends u to s and v to t.

The definitions `pointedNodeEquation`, `pointedNodeRing` and `pointedSectionIdeal` of Suggested.lean realize F, R and J; the multivariable quotient is canonically the same nested monic polynomial quotient.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the nested polynomial A[Y][X] and the existing quotient AdjoinRoot F. Evaluation at (s,t) kills F, so its ring map descends. Take the two-generator ideal and its actual R-linear dual. The native section evaluation body verifies evaluation of the nested polynomial at (s,t) by ring normalization; the quotient ideal and dual are the existing native objects. monicity of F handles the subsingleton base separately and then uses leadingCoeff_quadratic; only the degree-two assertion assumes Nontrivial A.

The section can meet the singular point; no smoothness or invertibility of J is assumed.

The construction has the following API.

- F=X²+γYX+δY²−q(s,t) in A[Y][X].
- ι is the composite of the two coefficient inclusions and the quotient map.
- ev(u)=s, ev(v)=t, ev(ιz)=z.
- J is Ideal.span {u−ιs,v−ιt}; D is J→ₗ[R]R.
- F is monic over every commutative base ring, including the zero ring.
- For nontrivial A the outer polynomial F has natural degree two. This degree assertion is not made for the zero ring.
- The first section coordinate c belongs to the actual ideal span{c,d}.
- The second section coordinate d belongs to the actual ideal span{c,d}.

**Checks.**

- q(u,v)=ι(q(s,t)).
- If A is the zero ring then R, J and D are subsingleton.
- Native AdjoinRoot.lift evaluates u,v and coefficients to s,t and the original coefficient.
- The zero-base polynomial is monic; its natural degree is not asserted to be two.
- Over ZMod 2, F=X²+YX has outer natural degree two.
- Over ZMod 4 with γ=δ=s=t=0, multiplication by v remains injective despite coefficient zero divisors and zero discriminant.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [the binary quadratic node form](#21-the-binary-quadratic-node-form), `AdjoinRoot`, `AdjoinRoot.of`, `AdjoinRoot.root`, `AdjoinRoot.lift`, `Polynomial.evalRingHom`, `Polynomial.leadingCoeff_quadratic`, `Polynomial.natDegree_quadratic`.

### 2.9 The polynomial section Hom differential

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Define d(e,n):H→H for e∈{false,true} and n≥0: choose L_Φ if (n mod 2=0) has the same truth value as e=true, and L_Ψ otherwise. The false phase is the section-ideal Hom sequence; the true phase is the dual Hom sequence.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

The construction has the following API.

- The actual degree-zero differential d(false,0) equals L_Ψ, as required by ker(P_J)=im(Ψ).
- The actual degree-zero differential d(true,0) equals L_Φ, as required by ker(P_D)=im(Φ).
- For either phase e and every n≥0, d(e,n+2)=d(e,n) as an R-linear map.

**Checks.**

- With γ=δ=s=t=0, every A and every m∈M, d(false,0)(E((0,1)⊗m))(1,0)=u⊗m; this fixes the Ψ starting phase.
- With γ=δ=s=t=0, every A and every m∈M, d(true,0)(E((0,1)⊗m))(1,0)=−u⊗m; this fixes the Φ starting phase and its negative entry.
- For either phase and every coefficient module, d(e,n+2)=d(e,n) as native R-linear maps.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose).)

*Needs:* [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose), `LinearMap.lcomp`.

### 2.10 Normal form of a pointed nodal deformation

Let Λ be complete noetherian local with residue field k and let q over k have unit discriminant. The pointed node k[[x,y]]/(q), with x,y↦0, has a formally versal hull A_pd=Λ[[s,t]] and R_pd=A_pd[[x,y]]/(q̃(x,y)−q̃(s,t)), with section x↦s,y↦t. The tangent map is an isomorphism k²→k². This is a hull, not a claim that the deformation groupoid is represented by a fine scheme.

One proof uses the following inputs and comparisons. Use power-series division by a monic quadratic to express each element uniquely as f(y)+xg(y); flatness of noetherian formal power-series rings gives flatness of R_pd. Lift pointed coordinates across a small extension and use coordinate correction to remove the error. Use flatness and nilpotent Nakayama to show that the resulting surjective map has zero kernel. Compute the tangent pair from the images of x,y under the section.

Do not assert absence of automorphisms in the pointed-node deformation groupoid.

([knudsen2012](#references), Proposition 2.1 and Lemmas 2.5,2.7–2.9, pp. 6–10.)

*Needs:* [the binary quadratic node form](#21-the-binary-quadratic-node-form), [coordinate correction over a small extension](#26-coordinate-correction-over-a-small-extension), AlgebraicModuliForArithmeticGeometry §§8.1–8.3.

### 2.11 Products of the explicit node matrices

For a commutative ring A and arbitrary γ,δ,x,y,s,t∈A, the displayed Φ and Ψ satisfy ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂. This polynomial identity needs neither noetherianity nor the unit-discriminant hypothesis.

One proof uses the following inputs and comparisons. Compute the two off-diagonal entries as zero. Each diagonal entry is δ(y²−t²)+γx(y−t)+(x+s+γt)(x−s)=q(x,y)−q(s,t).

The identity specializes in characteristic two.

([knudsen2012](#references), §3, pp. 11–12.)

*Needs:* [the binary quadratic node form](#21-the-binary-quadratic-node-form), [the node-section matrix factorization](#27-the-node-section-matrix-factorization), `Matrix.mul_apply`.

### 2.12 Regularity of the monic relation

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Multiplication by F on A[Y][X] is injective.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. For nonzero A, F is monic of degree two in X; the top nonzero coefficient of a product survives. If A is the zero ring the domain is a singleton. One route applies Polynomial.Monic.isRegular directly to monicity of F; no discriminant or noetherian input is used.

Do not deduce this from unit discriminant after specializing coordinates to a receiving ring.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `Polynomial.Monic.isRegular`.

### 2.13 Kernel of section evaluation

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). ev∘ι=id_A, ker(ev)=J, and 0→J→R→A→0 splits A-linearly by ι.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the built AdjoinRoot.induction_on to represent r by a bivariate polynomial P. The built lift_mk and eval₂_evalRingHom identify section evaluation with (P.eval(C s)).eval t. The built Polynomial.mem_span_C_X_sub_C_X_sub_C_iff_eval_eval_eq_zero puts every vanishing representative in span{C(Y−t),X−C(s)}. This proves the two-variable division statement; do not plan a private generic remainder lemma. Map that ideal through the actual AdjoinRoot.mk using Ideal.mem_map_of_mem and Ideal.map_span. Its two generator images are v−ιt and u−ιs, so the image lies in J. Conversely both generators evaluate to zero. Ideal.span_le puts J in the actual evaluation kernel. AdjoinRoot.lift_of and evaluation on constants give ev∘ι=id_A. The A-linear splitting is made explicit by the coefficient-linear splitting of section evaluation (§2.61). This proof does not use a normal-form basis, noetherianity, a unit discriminant or flatness of a coefficient map.

The splitting is A-linear; the section map ι is not R-linear for the evaluation action on A.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `Polynomial.mem_span_C_X_sub_C_X_sub_C_iff_eval_eval_eq_zero`, `Polynomial.eval₂_evalRingHom`, `AdjoinRoot.induction_on`, `AdjoinRoot.lift_mk`, `Ideal.map_span`, `Ideal.mem_map_of_mem`, `Ideal.span_le`.

### 2.14 Coefficient map of pointed node rings

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any ring map f:A→A′, define R′ using the mapped coefficients and φ:R→R′ by the native AdjoinRoot.map. It sends u,v and ιz to u′,v′ and ι′f(z), preserves the section evaluation and sends c,d,a,b to their primed counterparts.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Coefficient mapping sends F to F′. Apply the existing quotient map construction. Check the images on the two variables and coefficients. Use the existing composition law and generator extensionality for identity and composition. The native map body checks the mapped defining relation. Pinned AdjoinRoot.map_of/map_root give its values. Ring-map extensionality on the coefficient polynomial ring and the adjoined root verifies identity and composition.

No flatness or injectivity of f is required.

The construction has the following API.

- The native quotient homomorphism is induced by the mapped polynomial.
- φ(u)=u′, φ(v)=v′ and φ(ιz)=ι′f(z).
- For f=id_A, φ=id_R.
- For A→A′→A″, `φ_g∘φ_f=φ_{g∘f}`.
- The existing φ sends all four section coordinates c,d,a,b to c′,d′,a′,b′, with mapped coefficients and the same order.

**Checks.**

- For ℤ→𝔽₂ with γ=1 and δ=s=t=0, so that R=ℤ[u,v]/(u²+uv) and R′=𝔽₂[u′,v′]/(u′²+u′v′), φ(2v)=2v′=0 although 2v≠0 in R: φ is not injective, and no injectivity is asserted.
- For ℤ→ℤ/4 with s=3 and γ=δ=t=0, F=X²−9 maps to X²−1 over ℤ/4, so φ(u)²=φ(9)=1 in R′, and φ(c)=φ(u−3)=u′−3=u′+1=c′. Since −u′ is also a root of X²−1, the ring map sending u to −u′ and v to v′ is a second ℤ/4-algebra map R→R′; it sends c to −u′−3=−c′−2≠c′, so the construction is the map of adjoined roots, not an arbitrary root-preserving map.
- For ℤ→ℤ/4→𝔽₂ with zero parameters, 3u+2v maps to 3u′+2v′ and then to u″, which is the direct image of 3u+2v under ℤ→𝔽₂; exchanging the coordinates would give v″.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `AdjoinRoot.map`, `Polynomial.mapRingHom`, `AdjoinRoot.map_comp_map`, `AdjoinRoot.map_of`, `AdjoinRoot.map_root`, `AdjoinRoot.ringHom_ext`.

### 2.15 Section ideal under flat ambient extension

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_J:B⊗_R J≃_B J_B by E_J(b⊗j)=b·φ(j), where φ:R→B is the algebra map.

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B).

One proof uses the following inputs and comparisons. Tensor the injective subtype J→R by the flat R-module B. Compose B⊗J→B⊗R with the pinned tensor unit equivalence; its image is exactly the B-span of φ(c),φ(d), hence J_B. Corestrict to that actual ideal. Tensor generation determines E_J uniquely.

The extension is over R, not over A. Nonflat ambient maps are not permitted by this result.

The construction has the following API.

- E_J with the stated B-linear source, target and formula.
- The underlying B-value of E_J(b⊗j) is bφ(j).
- Any B-linear equivalence with these pure-tensor values equals E_J.

**Checks.**

- E_J(1⊗j) has underlying value φ(j).
- For B=R, E_J(r⊗j)=rj, agreeing with the tensor unit and subtype.
- When B is the zero ring, J_B is subsingleton.

([stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `Module.Flat.lTensor_preserves_injective_linearMap`, `TensorProduct.AlgebraTensorModule.rid`, `Ideal.map_span`.

### 2.16 Native coefficient action on the pointed node

For R=A[Y][X]/(X²+γYX+δY²−q(s,t)), the explicit coefficient inclusion ι:A→R equals the native algebra structure map A→R. Consequently the existing A-scalar action is a·r=ι(a)r.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The inherited scalar tower is A→A[Y]→AdjoinRoot F. Use the built AdjoinRoot algebra-map composition law and polynomial coefficient algebra-map identity. Both yield the actual composite defining ι, without adding an instance.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `AdjoinRoot.algebraMap_eq'`, `Polynomial.algebraMap_eq`.

### 2.17 Monicity of the defining polynomial

For the inherited polynomial F=X²+C(γY)X+C(δY²−q(s,t)) in A[Y][X], F is monic in X.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The leading X² coefficient is one; both other summands have smaller X degree. No nontriviality or discriminant condition is required.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section).

### 2.18 The section-coordinate relation

With the inherited coordinates c,d,a,b in R, cb+da=0.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The actual quotient map sends F to zero. Expand q(s,t) and the definitions of c,d,a,b; commutative ring normalization identifies cb+da with the quotient relation.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), [the binary quadratic node form](#21-the-binary-quadratic-node-form), `AdjoinRoot.mk_self`.

### 2.19 Degree of the node polynomial

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. If A is nontrivial, the outer natural degree of F is two. The zero ring is excluded only from this degree assertion.

Here A is a nontrivial commutative ring; γ,δ,s,t∈A. No noetherianity or discriminant assumption.

One proof uses the following inputs and comparisons. Apply the pinned quadratic degree formula with leading coefficient one in A[Y].

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Nonreduced coefficient rings are included; the zero ring is excluded from this degree assertion.

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `Polynomial.natDegree_quadratic`.

### 2.20 Commutation of ideal values in the dual

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For h∈D and j,k∈J, jh(k)=kh(j).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The actual ideal scalar products jk and kj agree as subtype elements; apply the R-linear map h.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section).

### 2.21 The ordered surjection to the section ideal

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. Construct the R-linear map P_J:R²→J, P_J(z)=cz₀−dz₁. Its surjectivity and kernel are separate lemmas.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The expression belongs to J because its coefficients in the ordered spanning pair are z₀ and −z₁. Additivity and scalar compatibility follow by commutative ring algebra.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

The construction has the following API.

- The underlying element is cz₀−dz₁; surjectivity and the kernel are the separate targets below.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u: P_J(1,0)=u and P_J(0,1)=−v; Ψ(1,0)=(v,u) gives P_J(v,u)=uv−vu=0, while the unsigned map cz₀+dz₁ would give 2uv≠0.
- In the same fixture Φ(1,0)=(a,−c)=(0,−u) gives P_J(0,−u)=uv≠0, so im Φ is not in the kernel: exchanging the two matrices fails.
- Over 𝔽₂ with γ=1 and δ=s=t=0, a=b=u and Ψ(0,1)=(−u,u)=(u,u); then P_J(u,u)=u²−uv=0, since u²=−vu=vu in R.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), `Ideal.mem_span_pair`.

### 2.22 The right node matrix acting on a column

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For z∈R², Ψz=(dz₀−bz₁,cz₀+az₁).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate the two native matrix row sums in the order 0,1.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the node-section matrix factorization](#27-the-node-section-matrix-factorization), `Matrix.mulVecLin`, `Matrix.mulVecLin_apply`.

### 2.23 The left node matrix acting on a column

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For z∈R², Φz=(az₀+bz₁,−cz₀+dz₁).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate the two native matrix row sums in the order 0,1.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the node-section matrix factorization](#27-the-node-section-matrix-factorization), `Matrix.mulVecLin`, `Matrix.mulVecLin_apply`.

### 2.24 The transposed left matrix acting on a column

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. Φᵀz=(az₀−cz₁,bz₀+dz₁).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate the two column sums, retaining the negative entry −c.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the node-section matrix factorization](#27-the-node-section-matrix-factorization), `Matrix.mulVecLin`, `Matrix.mulVecLin_apply`.

### 2.25 The transposed right matrix acting on a column

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. Ψᵀz=(dz₀+cz₁,−bz₀+az₁).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate the two column sums, retaining the negative entry −b.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the node-section matrix factorization](#27-the-node-section-matrix-factorization), `Matrix.mulVecLin`, `Matrix.mulVecLin_apply`.

### 2.26 The symplectic rotation of section coordinates

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the R-linear equivalence p:R²≃R² with p(z₀,z₁)=(−z₁,z₀) and inverse p⁻¹(z₀,z₁)=(z₁,−z₀).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Define both ordered coordinate functions; verify both inverse laws and R-linearity coordinatewise.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

The construction has the following API.

- p(z₀,z₁)=(−z₁,z₀).
- p⁻¹(z₀,z₁)=(z₁,−z₀).
- p(p(z))=−z.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, p(u,v)=(−v,u) and p⁻¹(−v,u)=(u,v); applying p twice gives (−u,−v)≠(u,v), so p is not its own inverse, and the candidate inverse (z₀,z₁)↦(−z₁,z₀) fails.
- For A=Z/4, γ=s=1 and δ=t=0, p(p(z))=−z on the actual node coordinates.
- For A=Z/1 and zero parameters, the constructed rotation inverse fixes p(z).

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section).

### 2.27 Coefficient linearity of section evaluation

In the same actual polynomial quotient, ev(a·r)=a ev(r) for every a∈A and r∈R, using the inherited A-module structure on R and regular A-module structure on A.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Rewrite the inherited scalar action as multiplication by ι(a). Evaluation preserves multiplication and ev(ι(a))=a by the existing kernel/coefficient-identity theorem. No cancellation or nontriviality is used.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node), [kernel of section evaluation](#213-kernel-of-section-evaluation).

### 2.28 Freeness over the polynomial coefficient ring

The native quotient R=AdjoinRoot(F) is a free A[Y]-module, for the existing AdjoinRoot algebra structure.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Apply the pinned monic AdjoinRoot freeness theorem directly. This short freeness interface does not assume or replace the full two-coefficient normal-form theorem.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [monicity of the defining polynomial](#217-monicity-of-the-defining-polynomial), `Polynomial.Monic.free_adjoinRoot`.

### 2.29 Divisibility on the actual section ideal

For every actual j∈J=(c,d), there exists z∈R with dz=bj.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Native binary ideal membership gives j=xc+yd. Choose z=−ax+by and use cb+da=0. No ideal-generation assumption, localization or inverse of d is introduced.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [the section-coordinate relation](#218-the-section-coordinate-relation), `Ideal.mem_span_pair`.

### 2.30 Ordered polynomial coordinates

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct the A[Y]-linear equivalence E:R≃A[Y]×A[Y] with E⁻¹(p,q₁)=of (p)+u·of (q₁), including the zero ring.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. For nontrivial A reindex the native monic power basis by Fin 2 and compose its coordinate equivalence with Mathlib’s ordered two-entry product equivalence. For subsingleton A use the existing native module structures to prove the quotient and coefficient pair subsingleton, then use the pinned subsingleton linear equivalence.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

The construction has the following API.

- E(of (p))=(p,0).
- E(u)=(0,1).
- E⁻¹(p,q₁)=of (p)+u·of (q₁).
- of (E(r)₀)+u·of (E(r)₁)=r.
- There is a unique ordered coefficient pair representing r.
- For p∈A[Y], r∈R, E(of (p)r)=(pE(r)₀,pE(r)₁).
- E(dr)=((Y−t)E(r)₀,(Y−t)E(r)₁).
- E(ur)=((q(s,t)−δY²)E(r)₁,E(r)₀−γYE(r)₁).
- E(cr)₁=E(r)₀−(s+γY)E(r)₁.
- E(b)=(C(s+γt),1).

**Checks.**

- Over Z/1Z, E(r)=(0,0) for every native quotient element r.
- Over Z/2Z with γ=1,δ=s=t=0, E(u)=(0,1), in that order.
- Over Z/4Z with all parameters zero, E(of (2Y⁹))=(2Y⁹,0).

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [monicity of the defining polynomial](#217-monicity-of-the-defining-polynomial), [degree of the node polynomial](#219-degree-of-the-node-polynomial), `AdjoinRoot.powerBasis'`, `Module.Basis.reindex`, `Module.Basis.equivFun`, `LinearEquiv.finTwoArrow`, `LinearEquiv.ofSubsingleton`, `Module.subsingleton`.

### 2.31 Ideal Hom coordinates with coefficients

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the A-linear map C_J,M:Hom_R(J,N_M)→R²⊗_A M as C_J,M(h)=E_M⁻¹(h∘P_J). In ordinary pair coordinates this uses (h(c),−h(d)).

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Compose the pinned Hom precomposition map for P_J with E_M⁻¹. Use the ordered negative second generator of the actual ideal presentation.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- The map C_J,M is injective.
- U_M(Ψᵀ) C_J,M(h)=0 for every h:J→N_M.
- C_J,M(θ_D,M(U_M(P_D)z))=−U_M(p)U_M(Ψ)z for every tensor z∈R²⊗_A M.

**Checks.**

- For A=ℤ, γ=δ=s=t=0 and M=A, so that R=ℤ[u,v]/(u²), J=(u,v), ε(u)=0 and ε(v)=u: C_J(ε)=(ε(u),−ε(v))=(0,−u) and C_J(incl)=(u,−v); the unsigned convention (h(c),h(d)) would give (0,u) and (u,v).
- In the same fixture with z=(1,0): U(P_D)z=incl, C_J(θ_D(incl))=(u,−v), while Ψ(1,0)=(v,u), p(v,u)=(−u,v) and −p(Ψ(1,0))=(u,−v); both sides of the composite law agree, and dropping the minus sign fails.
- For M=ℤ/4 and h the reduction of incl, C_J,M(h)=(u,−v)⊗1=(u,3v)⊗1≠(u,v)⊗1 in R²⊗_ℤℤ/4, so the sign of the second coordinate is visible on a nonflat coefficient module.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal).)

*Needs:* [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), `LinearMap.lcomp`, `TensorProduct.piLeft`, `LinearEquiv.piRing`.

### 2.32 Coefficient powers enter the nodal ideal powers

Under coefficient convention C3. For every n≥0, pⁿ⊆ι⁻¹(mⁿ).

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Apply the native map/comap adjunction, transport ideal powers through ι, and use monotonicity of ideal powers.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* `Ideal.map_le_iff_le_comap`, `Ideal.map_pow`.

### 2.33 Regularity of the second section coordinate

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Multiplication by d=v−ιt on R is injective.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Install the native A[Y]-module freeness of R using monicity of F. The pinned free-module instance supplies torsion freeness for regular scalars over arbitrary rings. The monic polynomial Y−t is regular; IsRegular.isSMulRegular makes its action on R injective. Identify its scalar action with multiplication by d=v−ι(t) in the existing coefficient tower.

A can have zero divisors; d is not chosen to be invertible.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [freeness over the polynomial coefficient ring](#228-freeness-over-the-polynomial-coefficient-ring), `Module.Basis.isTorsionFree`, `Polynomial.Monic.isRegular`, `Polynomial.monic_X_sub_C`, `IsRegular.isSMulRegular`.

### 2.34 Canonical retraction onto the section ideal

For the actual polynomial quotient R and J=(u−ιs,v−ιt)=ker(ev), construct the canonical A-linear map p:R→J, p(r)=r−ι(ev(r)). Its composite with J→R fixes J and kills the coefficient image. This is the explicit first coordinate of the coefficient-linear splitting of section evaluation (§2.61); it is not generally R-linear.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Evaluation of r−ιev(r) is zero, so the existing kernel equivalence places it in the actual ideal J. Verify addition by ring normalization and A-linearity by [coefficient linearity of section evaluation](#227-coefficient-linearity-of-section-evaluation) and the native coefficient action. For j∈J, ev(j)=0 makes p(j)=j. For a∈A, ev(ι(a))=a makes p(ι(a))=0. Use these two identities in both inverse laws of the splitting of §2.61 and as the actual coefficient-flatness retraction.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

The construction has the following API.

- The underlying ring element of p(r) equals r−ι(ev(r)).
- For j∈J the projection of its underlying ring element equals j.
- For a∈A the projection of ι(a) is the zero element of J.
- The actual section ideal J is projective as an A-module.
- For every A-module M, (id_M⊗p)∘(id_M⊗i)=id on M⊗_A J, where i:J→R is the actual inclusion and p is the canonical coefficient projection.
- For every A-module M, the actual coefficient-linear inclusion id_M⊗i:M⊗_A J→M⊗_A R is injective, without a flatness assumption on M.

**Checks.**

- For an arbitrary actual ideal element j, projection after the native inclusion returns exactly j.
- Over Z/1 with all parameters zero, every quotient element projects to the zero ideal element, without a nontrivial-base assumption.
- Over Z/4 with γ=δ=t=0 and s=1, the underlying projection of u is u−ι(1), despite zero discriminant and nonreduced coefficients.
- Over ℚ with γ=1 and δ=s=t=0, p(1)=0 and p(u)=u≠0. The identity p(rz)=r p(z) fails for (r,z)=(u,1).
- Over Z/4 with γ=δ=t=0 and s=1, the actual ideal is projective over its coefficient ring.
- Over Z/1 with zero parameters, the actual ideal is coefficient-flat with no nontriviality hypothesis.
- Over A=Z with zero parameters and M=Z/2, the actual tensorized ideal inclusion is injective; no flatness of M is assumed.
- For every coefficient module M and every z in M⊗_A J, tensor projection after actual tensor inclusion returns z.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [kernel of section evaluation](#213-kernel-of-section-evaluation), [coefficient linearity of section evaluation](#227-coefficient-linearity-of-section-evaluation), [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node).

### 2.35 The ordered basis one and root

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct a native A[Y]-basis B indexed by Fin 2 with B(0)=1 and B(1)=u, including subsingleton A.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Compose E with the inverse of the pinned product/function equivalence and use the existing finite coordinate-to-basis constructor.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

The construction has the following API.

- For every i∈Fin 2, B(i)=uⁱ.
- B(0)=1.
- B(1)=u.

**Checks.**

- For A=ℤ and all parameters zero, 2+3u has coordinates (2,3); exchanging the two basis vectors would give (3,2).
- For A=𝔽₂, γ=1 and the other parameters zero, F=X²+YX and u²=−Yu=Yu, so u² has coordinates (0,Y); the false relation u²=0 would give (0,0).
- For A=ℤ/4 and zero parameters, 2Yu has coordinates (0,2Y) and is nonzero, although 2 is a zero divisor in A: R is free over A[Y] on 1,u.

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), `Module.Basis.ofEquivFun`, `LinearEquiv.finTwoArrow`.

### 2.36 Surjectivity of the ordered ideal presentation

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. P_J is surjective.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. For j∈J choose j=xc+yd using the native two-generator span theorem. The vector (x,−y) maps to j, with the required sign.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), `Ideal.mem_span_pair`.

### 2.37 Rotation intertwines Φ transpose

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Φᵀ∘p=p∘Ψ.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Evaluate the existing native matrix action and the actual rotation on each of the two coordinates; retain the minus signs.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates), [the transposed left matrix acting on a column](#224-the-transposed-left-matrix-acting-on-a-column), [the right node matrix acting on a column](#222-the-right-node-matrix-acting-on-a-column).

### 2.38 Rotation intertwines Ψ transpose

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Ψᵀ∘p=p∘Φ.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Evaluate the existing native matrix action and the actual rotation on each of the two coordinates; retain the minus signs.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates), [the transposed right matrix acting on a column](#225-the-transposed-right-matrix-acting-on-a-column), [the left node matrix acting on a column](#223-the-left-node-matrix-acting-on-a-column).

### 2.39 Finite-level nodal coefficient map

Under coefficient convention C3. Construct λ_n:A/pⁿ→R/mⁿ as the actual quotient map induced by ι.

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Use the proved power containment in the native ideal quotient map.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

The construction has the following API.

- Under coefficient convention C3. For every a∈A and n≥0, λ_n([a])=[ι(a)].
- Under coefficient convention C3. For i≤j, factor_m(j,i)∘λ_j=λ_i∘factor_p(j,i).
- Under coefficient convention C3. For every n and a,b∈A/pⁿ, λ_n(ab)=λ_n(a)λ_n(b).

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²) and R/mⁿ=(ℤ/2ⁿ)[u,v]/(u²): λ₃([5])=[5] and λ₁([5])=[1]; the transition from level 3 to level 1 sends [5] to [1] on both sides of the compatibility square.
- In the same fixture λ₃([3])λ₃([3])=[9]=[1]=λ₃([1]) in (ℤ/8)[u,v]/(u²), and λ₂([2])=[2]≠0 although 2 is a zero divisor of ℤ/4.
- With p=(2) and m=(u,v) the containment p⊆ι⁻¹(m) fails, since 2∉(u,v): the would-be λ₁:ℤ/2→R/(u,v)=ℤ does not exist, because 2 maps to 2≠0. The hypothesis h is not decorative.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* [coefficient powers enter the nodal ideal powers](#232-coefficient-powers-enter-the-nodal-ideal-powers), `Ideal.quotientMap`.

### 2.40 Denominator-free dual generator

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). There is a unique ε∈D with d ε(j)=b j for every j∈J. Its generator values are ε(c)=−a and ε(d)=b.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. For each actual j∈J choose a witness z of dz=bj, supplied by the native divisibility lemma. Regularity of d makes that witness unique; apply cancellation to prove additivity and R-linearity. The canonical map satisfies its denominator-free formula. The coordinate relation proves both generator values and regularity proves uniqueness.

The notation b/d is explanatory only; no inverse or localization surrogate is used.

The construction has the following API.

- Exactly one actual R-linear map satisfies d ε(j)=b j.
- ε(c)=−a and ε(d)=b.
- Two R-linear maps with the denominator-free characterization are equal.

**Checks.**

- For a zero coefficient ring D and R×A are subsingleton.
- In F₃[u,v]/(u²+uv), ε(u)=−u, ε(v)=u and u≠−u.
- For every A and all coefficients the value on d is b, including A with zero divisors.
- On the actual untruncated Z/4 polynomial quotient with γ=δ=0,s=1,t=0, the named ε sends d=v to u+1.
- On the actual F₃ polynomial quotient with γ=1,δ=s=t=0, the named ε sends c to −u and d to u, with u≠−u.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [divisibility on the actual section ideal](#229-divisibility-on-the-actual-section-ideal).

### 2.41 Underlying element of the section projection

For every r∈R, the underlying ring element of the native ideal projection p(r) is r−ιev(r).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Unfold the constructed native projection; its subtype value is exactly the displayed difference.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal).

### 2.42 Untruncated node monomial basis

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct a native A-basis indexed by N×Fin 2; its vector at (n,i) is vⁿuⁱ, with no bound on n. The A-action is the inherited polynomial/AdjoinRoot scalar tower.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the pinned monomial basis of A[Y] and the preceding two-term basis, then compose them by the native scalar-tower basis construction.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

The construction has the following API.

- The (n,i)-vector is vⁿuⁱ.
- This basis equals the pinned scalar-tower composition of the native polynomial monomial basis with B.
- The coefficient at (n,i) is the n-th polynomial basis coordinate of the i-th B-coordinate of r.

**Checks.**

- Over Z/2Z, γ=1 and remaining parameters zero, the (37,0)-vector is v³⁷.
- Over Z/4Z with zero parameters, the (3,1)-vector is v³u.
- Over Z/1Z with zero parameters, the (37,1)-vector is zero.

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [the ordered basis one and root](#235-the-ordered-basis-one-and-root), `Polynomial.basisMonomials`, `Module.Basis.smulTower`, `Module.Basis.smulTower_repr`.

### 2.43 Multiplication into the actual section dual

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. Construct m:R→D, m(r)(j)=rj, as an R-linear map. It is injective and uses the existing ideal inclusion.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The formula is R-linear in both its argument and its ideal input by commutativity. If m(r)=m(z), evaluate at the actual generator d and cancel regular d.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

The construction has the following API.

- m(r) is the R-linear map j↦rj.
- m(r)(j)=rj on each actual ideal element.
- The actual map m is injective, including for the zero coefficient ring.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u: m(u)=vε, since both send u to 0 and v to uv.
- In the same fixture ε is not m(r) for any r, since rv=u has no solution in R; m is injective but not surjective, so D is not R.
- m(r)=0 if and only if r=0; multiplication does not lose nonzero quotient elements, including over ℤ/4 where 2 is a zero divisor of A.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [polynomial ring of a pointed section](#28-polynomial-ring-of-a-pointed-section), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.44 Tensor rotation intertwines Φ transpose

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(Φᵀ)∘T_M(p)=T_M(p)∘T_M(Ψ), where p:R²→R², p(z)=(−z₁,z₀), is the rotation and T_M(p)=id_M⊗_A p.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Restrict the actual R-linear intertwining identity to A. Tensor its two compositions using the pinned composition law and equivalence coercion formula.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [rotation intertwines φ transpose](#237-rotation-intertwines-φ-transpose), `LinearEquiv.restrictScalars`, `LinearEquiv.lTensor`, `LinearEquiv.coe_lTensor`, `LinearMap.lTensor_comp`.

### 2.45 Tensor rotation intertwines Ψ transpose

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(Ψᵀ)∘T_M(p)=T_M(p)∘T_M(Φ), where p:R²→R², p(z)=(−z₁,z₀), is the rotation and T_M(p)=id_M⊗_A p.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Restrict the actual R-linear intertwining identity to A. Tensor its two compositions using the pinned composition law and equivalence coercion formula.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [rotation intertwines ψ transpose](#238-rotation-intertwines-ψ-transpose), `LinearEquiv.restrictScalars`, `LinearEquiv.lTensor`, `LinearEquiv.coe_lTensor`, `LinearMap.lTensor_comp`.

### 2.46 Right-tensor rotation of the first transpose

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Φᵀ)∘U_M(p)=U_M(p)∘U_M(Ψ), using the native tensor of the coefficient-restricted rotation equivalence.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Apply the native right-tensor map to Φᵀ∘p=p∘Ψ and the pinned composition/coercion formulas.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291, and `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [rotation intertwines φ transpose](#237-rotation-intertwines-φ-transpose).)

*Needs:* [rotation intertwines φ transpose](#237-rotation-intertwines-φ-transpose), `LinearMap.rTensor_comp`, `LinearEquiv.coe_rTensor`.

### 2.47 Right-tensor rotation of the second transpose

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Ψᵀ)∘U_M(p)=U_M(p)∘U_M(Φ).

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Apply the native right tensor to the listed Ψᵀ∘p=p∘Φ relation; use the pinned composition/coercion formulas.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291, and `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [rotation intertwines ψ transpose](#238-rotation-intertwines-ψ-transpose).)

*Needs:* [rotation intertwines ψ transpose](#238-rotation-intertwines-ψ-transpose), `LinearMap.rTensor_comp`, `LinearEquiv.coe_rTensor`.

### 2.48 Compatible completed coefficient family

Under coefficient convention C3. Construct f_n:Â→R/mⁿ as λ_n∘π_A,n.

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Compose the actual quotient map with native completion evaluation, as a ring homomorphism.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

The construction has the following API.

- Under coefficient convention C3. For i≤j, factor_m(j,i)∘f_j=f_i.
- Under coefficient convention C3. For every a∈A and n≥0, f_n(e_A(a))=[ι(a)].
- Under coefficient convention C3. For every n≥0, f_n(1)=1.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²), f₃(1/3)=3 in Q₃ and f₂(1/3)=3 in Q₂, and the transition Q₃→Q₂ reduces the first to the second; a family sending 1/3 to 1 is not multiplicative, since 3·1≠1 modulo 8.
- At n=0 the target R/m⁰ is the zero ring and f₀ is the unique map to it; at n=1, f₁(1/3)=1 in Q₁=𝔽₂[u,v]/(u²), so levels 1 and 3 are distinguished.
- With p=(2) and m=(u,v) the containment p⊆ι⁻¹(m)=0 fails and no family exists: 1/3 would need an image in R/(u,v)=ℤ, where 3 is not invertible.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* [finite-level nodal coefficient map](#239-finite-level-nodal-coefficient-map), `AdicCompletion.evalₐ`.

### 2.49 Finite nodal coefficient algebra

Under coefficient convention C4. Equip Qₙ with the Bₙ-algebra induced by the previously constructed λₙ.

All actions are the specified actual restrictions. No noetherianity, localness or discriminant hypothesis is introduced.

One proof uses the following inputs and comparisons. Use the actual quotient coefficient ring homomorphism.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

The construction has the following API.

- Under coefficient convention C4. The chosen algebra map Bₙ→Qₙ equals λₙ.
- Under coefficient convention C4. For a∈A, λₙ([a])=[ι(a)].
- Under coefficient convention C4. For a∈Â, λₙ(evalₙ(a)) equals the existing completed coefficient family at n.
- Under coefficient convention C4. For b∈pⁿ and q∈Qₙ, bq=0.
- Under coefficient convention C4. The chosen actions form the actual scalar tower A→Â→Qₙ.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²) and n=3, λ₃:ℤ/8→Q₃ sends 5 to 5; the element 2∈p acts on v by 2v≠0 in Q₃, while 8∈p³ acts by zero, as the annihilation law requires.
- The completed coefficient 1/3 acts on v∈Q₃ by 3v, the same as acting through evaluation 1/3↦3 in B₃ and then λ₃; the trivial action through 1 would give v.
- With p=(2) and m=(u,v) the containment fails: ℤ/2→R/(u,v)=ℤ is not a ring map, so the finite coefficient algebra is not defined without p⊆ι⁻¹(m).

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [finite-level nodal coefficient map](#239-finite-level-nodal-coefficient-map).

### 2.50 Projection fixes the section ideal

For every j∈J, p(j)=j using the actual native ideal inclusion J→R.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. The existing kernel equivalence gives ev(j)=0. Apply the underlying-element formula and coefficient inclusion at zero, then native subtype extensionality.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [underlying element of the section projection](#241-underlying-element-of-the-section-projection), [kernel of section evaluation](#213-kernel-of-section-evaluation).

### 2.51 Projection kills the coefficient section

For every a∈A, p(ι(a))=0 as an element of the actual section ideal J.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use ev(ι(a))=a from the existing kernel/coefficient theorem. The projection formula gives ι(a)−ι(a)=0; apply native subtype extensionality.

Use the existing polynomial quotient, coefficient algebra and actual ideal carrier; no new scalar action, chosen basis or unit discriminant.

([knudsen2012](#references), §3 Key Example and Proposition 3.1, printed pp. 11–12; Corollary 3.2.)

*Needs:* [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [underlying element of the section projection](#241-underlying-element-of-the-section-projection), [kernel of section evaluation](#213-kernel-of-section-evaluation).

### 2.52 The canonical dual-generator identity

For every j∈J, d ε(j)=bj for the named canonical R-linear the dual generator ε.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Apply the chosen witness specification in the canonical map. The map linearity was proved by cancelling the regular coordinate d.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [denominator-free dual generator](#240-denominator-free-dual-generator), [divisibility on the actual section ideal](#229-divisibility-on-the-actual-section-ideal).

### 2.53 Unique ordered coefficient pair

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every r there exists a unique ordered pair (p,q₁) with of (p)+u·of (q₁)=r.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use E(r) as witness, and apply injectivity of E⁻¹ to any other candidate pair.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates).

### 2.54 Values of the node monomial basis

In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every n∈N and i∈Fin 2 the A-basis vector at (n,i) equals vⁿuⁱ.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the pinned scalar-tower basis formula and the two-term vector formula; the native quotient homomorphism carries Yⁿ to vⁿ.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, monic polynomial division preceding Proposition 3.1.)

*Needs:* [untruncated node monomial basis](#242-untruncated-node-monomial-basis), [the ordered basis one and root](#235-the-ordered-basis-one-and-root), `Module.Basis.smulTower_apply`, `Polynomial.coe_basisMonomials`.

### 2.55 Coordinates of the first section generator

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. E(c)=(−C(s),1).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Use E(u)=(0,1), E(ιs)=(Cs,0) and additivity of the existing coordinate equivalence.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates).

### 2.56 The ordered surjection to the section dual

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For the characterized ε∈D with dε(j)=bj, construct the R-linear map P_D:R²→D sending z to z₀·incl−z₁·ε.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Combine the actual multiplication map with scalar multiplication of the canonical ε. Check both linear-map laws pointwise on J.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

The construction has the following API.

- Evaluation on j is z₀j−z₁ε(j).

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u: P_D(1,0)=incl and P_D(0,1)=−ε, whose value at v is −u.
- In the same fixture Φ(0,1)=(u,v) gives u·incl−vε, which vanishes at u (u²=0) and at v (uv−vu=0); the unsigned map z₀incl+z₁ε would give the value 2uv≠0 at v.
- In the same fixture Ψ(1,0)=(v,u) gives v·incl−uε, whose value at v is v²≠0, so im Ψ is not in the kernel of P_D.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.57 The actual dual coefficient-Hom map

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear map θ_D,M:D⊗_A M→Hom_R(J,N_M), characterized on pure tensors by θ_D,M(h⊗m)(j)=h(j)⊗m.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Apply the pinned heterobasic tensor lift to (h,m)↦(j↦h(j)⊗m). Verify R-linearity in h and j and A-balancing in m using the inherited scalar tower. The source is the actual R-linear dual D; the target has the inherited left R-action on R⊗_A M.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- For h∈D,m∈M,j∈J, θ_D,M(h⊗m)(j)=h(j)⊗m.
- For any A-linear f:M→M′, tensor x∈D⊗_A M and j∈J, θ_D,M′((id_D⊗f)x)(j)=(id_R⊗f)(θ_D,M(x)(j)). All tensor maps are the native R-linear heterobasic maps.
- For M=A and every x∈D⊗_A A, postcompose θ_D,A(x) with the native R-linear unit R⊗_A A≃R. The result equals the native unit D⊗_A A≃D applied to x.

**Checks.**

- For A=ℤ, γ=δ=s=t=0 and M=ℤ/2, so that R⊗_ℤℤ/2=𝔽₂[u,v]/(u²): θ_D,M(ε⊗1)(v)=ε(v)⊗1=u⊗1≠0 and θ_D,M(ε⊗1)(u)=0, while θ_D,M(incl⊗1)(u)=u⊗1.
- For M=ℤ/4, θ_D,M(−ε⊗1)(v)=−u⊗1=3u⊗1≠u⊗1 in (ℤ/4)[u,v]/(u²): the ordered negative second generator is visible on a nonflat coefficient module.
- For M=ℤ/2, θ_D,M(m(u)⊗1) and θ_D,M(vε⊗1) both send v to uv⊗1 and u to 0, as m(u)=vε requires; a comparison that evaluated h only at u would not distinguish m(u) from the zero map, since m(u)(u)=u²=0.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node).)

*Needs:* [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node), `TensorProduct.AlgebraTensorModule.lift`.

### 2.58 The coefficient-valued bidual evaluation map

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear map θ_J,M:J⊗_A M→Hom_R(D,N_M), θ_J,M(j⊗m)(h)=h(j)⊗m.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the pinned heterobasic lift of the actual evaluation pairing, checking R-linearity in j and h and A-balancing in m. No substitute dual carrier, completed ring or chosen tensor action is introduced.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- Θ_J,M(j⊗m)(h)=h(j)⊗m.
- For any A-linear f:M→M′, x∈J⊗_A M and h∈D, θ_J,M′((id_J⊗f)x)(h)=(id_R⊗f)(θ_J,M(x)(h)).
- For M=A and x∈J⊗_A A, postcomposing θ_J,A(x) by the native unit R⊗_A A≃R equals Module.Dual.eval R J applied to the native unit J⊗_A A≃J of x.

**Checks.**

- For A=ℤ, γ=δ=s=t=0 and M=ℤ/2: θ_J,M(v⊗1)(ε)=ε(v)⊗1=u⊗1≠0 and θ_J,M(u⊗1)(ε)=0, while θ_J,M(u⊗1)(incl)=u⊗1; evaluation distinguishes the two dual generators.
- For M=ℤ/4, θ_J,M(−d⊗1)(ε)=−b⊗1=−u⊗1=3u⊗1≠u⊗1 in (ℤ/4)[u,v]/(u²).
- For M=ℤ/2, θ_J,M(v⊗1)(m(u))=uv⊗1=θ_J,M(v⊗1)(vε), consistent with m(u)=vε.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node).)

*Needs:* [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node), `TensorProduct.AlgebraTensorModule.lift`, `Module.Dual.eval`.

### 2.59 The finite quotient retains its native original-coefficient action

For b∈A and q∈R/mⁿ, the inherited scalar b·q equals the level-n completed coefficient map ([b]) times q in the native quotient ring.

Here A is any commutative ring; R=A[Y][X]/(q(X,Y)−q(s,t)) is the polynomial nodal chart with its coefficient homomorphism ι, and q(X,Y)=X²+γXY+δY². Ideals p⊆A and m⊆R satisfy p⊆coefficient map⁻¹(m). The finite coefficient and chart actions are the residue algebra structure Â→Bₙ, the finite chart algebra structure Bₙ→Qₙ and their composed native scalar actions. This scalar comparison holds without finite generation of p and without any coefficient module.

One proof uses the following inputs and comparisons. Choose an actual original chart representative r of q using native quotient surjectivity. The inherited quotient A-action sends b·[r] to [b·r]. In R, [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node) identifies b·r with coefficient map (b)r. The finite coefficient map sends [b] to [coefficient map (b)]; the native quotient ring hom preserves products. This proves the equation without assuming that two independently inferred scalar structures are definitionally equal.

The theorem compares the inherited scalar action with the displayed coefficient map. It does not replace that action or add an equality assumption.

([knudsen2](#references), Appendix, Propositions 6–7, printed pp. 194–195, use these finite transitions in the completed-local comparison; the statement itself is a consequence of the cited targets and of `AdicCompletion.transitionMap_comp_eval_apply`.)

*Needs:* [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node), [finite-level nodal coefficient map](#239-finite-level-nodal-coefficient-map), `Ideal.Quotient.mk_surjective`, `Algebra.smul_def`.

### 2.60 Monic normal form in the section ring

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For every r∈R there is a unique pair (p,q₁)∈A[Y]² with r=p(v)+u q₁(v). Thus R is free over A[Y] with basis (1,u), and free over A by the monomials vⁿ,u vⁿ.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Apply the native unique ordered coordinate pair theorem, with the equality reversed to the displayed normal form r=p(v)+u q₁(v). The specified two-term and monomial bases supply both freeness instances through the pinned basis-to-free constructor. No relation truncating powers of v is added.

No relation truncating powers of v is introduced.

The construction has the following API.

- The actual node quotient is free both over A[Y] and over A using the prescribed bases.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

**Checks.**

- Over ℤ with γ=δ=s=t=0, u² reduces to 0, while u has ordered coordinates (0,1); confusing the leading coefficient with the constant coefficient fails.
- Over 𝔽₂ with γ=1 and δ=s=t=0, u² reduces to uv, with coordinates (0,v); the minus sign equals plus in characteristic two.
- Over the zero coefficient ring every pair and every quotient element is zero. Monicity remains true, while natural degree is 0 rather than 2.

*Needs:* [unique ordered coefficient pair](#253-unique-ordered-coefficient-pair), [values of the node monomial basis](#254-values-of-the-node-monomial-basis), `Module.Free.of_basis`.

### 2.61 Coefficient-linear splitting of section evaluation

For the actual polynomial node ring R and J=ker(ev), construct the canonical A-linear equivalence e:R≃J×A, e(r)=(r−ι(ev(r)),ev(r)); its inverse sends (j,a) to j+ι(a). This makes 0→J→R→A→0 split over A, including the zero base ring, and fixes the maps rather than only an abstract isomorphism class.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the existing inherited A-module structures on R, J and A; [native coefficient action on the pointed node](#216-native-coefficient-action-on-the-pointed-node) identifies the actual coefficient inclusion with the native algebra map. Define e(r)=(p(r),ev(r)), with p the retraction of [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), and inverse (j,a)↦j+ι(a). The forward/inverse identities follow from p(j)=j, p(ι(a))=0 and ev(j)=0. The other composition is the additive identity r−ιev(r)+ιev(r)=r. Use p’s LinearMap laws and [coefficient linearity of section evaluation](#227-coefficient-linearity-of-section-evaluation) for addition and scalar multiplication. This directly instantiates the canonical formulas without choosing a complementary submodule. The inherited zero-base, nonreduced and non-R-linear tests all check against these actual bodies. No chosen basis or inverse discriminant is used.

The equivalence is over A, with the actual ideal carrier J and actual evaluation map; never strengthen it to an R-linear splitting. No finite A-rank or R-flatness of J is implied.

The construction has the following API.

- The first coordinate, viewed in R, is r−ι(ev(r)).
- The second coordinate is ev(r).
- The inverse sends (j,a) to j+ι(a).
- e(ι(a))=(0,a), agreeing with the coefficient section of evaluation.

**Checks.**

- Over Z/4 with γ=δ=t=0 and s=1, the class u maps to (u−1,1), despite nonreduced coefficients and zero discriminant.
- For A=Z/1 every element maps to (0,0), without any nontrivial-base assumption.
- For A=ℚ, γ=1 and δ=s=t=0, the ideal projection takes 1 to 0 and the nonzero class u to u. It fails Φ(rz)=rΦ(z), so replacing A-linearity by R-linearity is rejected.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [coefficient linearity of section evaluation](#227-coefficient-linearity-of-section-evaluation), [kernel of section evaluation](#213-kernel-of-section-evaluation), [underlying element of the section projection](#241-underlying-element-of-the-section-projection), [projection fixes the section ideal](#250-projection-fixes-the-section-ideal), [projection kills the coefficient section](#251-projection-kills-the-coefficient-section).

### 2.62 Uniqueness from the second ideal generator

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. If dr+ιαb=dr′+ια′b for pairs in R×A, then (r,α)=(r′,α′).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Take the second E-coordinate and evaluate at t. The d term vanishes and the b term evaluates to α, so α=α′. Subtract the equal numerator terms, then cancel regular d to obtain r=r′.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.63 Multiplication by the dual numerator in coordinates

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For r∈R, E(br)₁=E(r)₀+(C(s+γt)−Cγ·Y)E(r)₁.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Write b=u+of (C(s+γt)); apply the existing root and coefficient multiplication formulas and collect the second coordinate.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates).

### 2.64 Evaluation of the ordered dual presentation

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For z∈R² and j∈J, P_D(z)(j)=z₀j−z₁ε(j).

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate the defined sum of linear maps on j.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual).

### 2.65 The dual generator module relation

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. d·ε=b·incl in D.

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. Evaluate both linear maps at j∈J and use dε(j)=bj; multiplication by 1 is inclusion.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

([knudsen2012](#references), §3 Key Example, multiplication description of J∨ and Proposition 3.1; compare Corollary 3.2 and §4.)

*Needs:* [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity), [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual).

### 2.66 The signed section-ideal generators

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. P_J(z)=z₀·c−z₁·d as an equality in the actual ideal subtype J, not only after inclusion into R.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the actual P_J formula, ideal subtype extensionality and commutativity of ring multiplication.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291, and `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), [denominator-free dual generator](#240-denominator-free-dual-generator).)

*Needs:* [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.67 Dual Hom coordinates with coefficients

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the A-linear map C_D,M:Hom_R(D,N_M)→R²⊗_A M by C_D,M(h)=E_M⁻¹(h∘P_D). Its pair coordinates are (h(incl),−h(ε)).

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Compose native precomposition by the actual signed P_D with E_M⁻¹.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- C_D,M is injective.
- U_M(Φᵀ) C_D,M(h)=0 for every h:D→N_M.
- For every tensor z∈R²⊗_A M, C_D,M(θ_J,M(U_M(P_J)z))=U_M(p)U_M(Φ)z.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u, and M=ℤ, the R-linear evaluation h(f)=f(v) on D has coordinates C_D(h)=(h(incl),−h(ε))=(v,−u); a convention without the sign would give (v,u).
- Under E_M, C_D(h) at the second standard basis vector equals −h(ε), not h(ε).
- Equality of C_D coordinates implies equality of homomorphisms from the actual R-dual D, since incl and ε generate D.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual).)

*Needs:* [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual), `LinearMap.lcomp`, `TensorProduct.piLeft`, `LinearEquiv.piRing`.

### 2.68 Completed nodal coefficient homomorphism

Under coefficient convention C3. Construct ĩ:Â→R̂ as the native completion lift of the compatible f_n.

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Instantiate the native completion universal property with the proved compatible finite family.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

The construction has the following API.

- Under coefficient convention C3. For every a∈Â and n≥0, π_R,n(ĩ(a))=λ_n(π_A,n(a)).
- Under coefficient convention C3. For every a∈A, ĩ(e_A(a))=e_R(ι(a)).
- Under coefficient convention C3. If f:Â→R̂ is a ring homomorphism satisfying π_R,n(f(a))=λ_n(π_A,n(a)) for every n,a, then f=ĩ.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that Â=ℤ₂: π_R,3(ĩ(1/3))=λ₃([3])=[3] in (ℤ/8)[u,v]/(u²) and π_R,4(ĩ(1/3))=[11] in (ℤ/16)[u,v]/(u²), since 3·3≡1 modulo 8 and 3·11≡1 modulo 16; the two levels differ, so ĩ(1/3)≠e_R(3).
- In the same fixture ĩ(e_A(−1))=e_R(−1), whose level-2 projection is [3].
- A ring homomorphism f:ℤ₂→R̂ with f(1/3)=e_R(3) satisfies the projection law at level 3 but not at level 4, where [3]≠[11]; so f≠ĩ, which is the only ring homomorphism with every prescribed finite projection.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* [compatible completed coefficient family](#248-compatible-completed-coefficient-family), `AdicCompletion.liftRingHom`.

### 2.69 Finite quotient transition over completed coefficients

For i≤j, equip the actual native quotient transition R/mʲ→R/mⁱ with its Â-algebra-hom structure, using the finite completed-coefficient actions.

Here A is any commutative ring; R=A[Y][X]/(q(X,Y)−q(s,t)) is the polynomial nodal chart with its coefficient homomorphism ι, and q(X,Y)=X²+γXY+δY². Ideals p⊆A and m⊆R satisfy p⊆coefficient map⁻¹(m). The finite coefficient and chart actions are the residue algebra structure Â→Bₙ, the finite chart algebra structure Bₙ→Qₙ and their composed native scalar actions. For the four tensor-naturality lemmas, p is finitely generated and N,N′ are arbitrary Â=AdicCompletion p A modules, with specified A-actions satisfying the native scalar-tower equations. The transition algebra homomorphism and its four structural laws do not require p finitely generated. No noetherianity or locality of A or R, finite generation or flatness of N, global tensor/limit interchange, or injectivity of the whole completed-ring tensor comparison is assumed.

One proof uses the following inputs and comparisons. Retain the native Ideal.Quotient.factorPow ring map; only its completed-coefficient compatibility needs a separate comparison. The equation factorPow∘the completed coefficient family at level j=the completed coefficient family at level i is exactly the algebra-map square. Evaluate it at an arbitrary a∈Â, without assuming that a comes from A. Package that square in the native AlgHom structure. Finite generation of p is unnecessary for this transition.

The construction has the following API.

- The ring homomorphism underlying the finite quotient transition is the native quotient transition `Ideal.Quotient.factorPow` for mʲ⊆mⁱ.
- The completed-coefficient transition from level n to itself is the identity Â-algebra homomorphism.
- For i≤j≤k, the level-k-to-j transition followed by the level-j-to-i transition equals the direct level-k-to-i transition as Â-algebra homomorphisms.
- For every a∈Â and q∈R/mʲ, the finite transition sends a·q to a times the image of q, with the specified completed-coefficient actions.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, the level-3-to-2 transition sends [1+2v+4v²] to [1+2v] and [3+6v+4v²] to [3+2v] in (ℤ/4)[u,v]/(u²).
- With the completed coefficient 1/3∈ℤ₂, (1/3)·[1+2v+4v²]=[3+6v+4v²] at level 3 transitions to [3+2v], which is (1/3)·[1+2v] at level 2, since 1/3≡3 modulo 4; the Â-linearity is checked on a coefficient that is not in A.
- The level-2-to-0 transition is the zero map to the zero ring R/m⁰ and sends [1+2v] to 0, while the level-2-to-2 transition is the identity and fixes [1+2v].

([knudsen2](#references), Appendix, Propositions 6–7, printed pp. 194–195, use these finite transitions in the completed-local comparison; the statement itself is a consequence of the cited targets and of `AdicCompletion.transitionMap_comp_eval_apply`.)

*Needs:* [compatible completed coefficient family](#248-compatible-completed-coefficient-family), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `AlgHom`, `Ideal.Quotient.factorPow`.

### 2.70 Coefficient base change of the node ring

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any f:A→A′, let R′ be the same construction over A′ with the mapped parameters f(γ),f(δ),f(s),f(t), ι′:A′→R′ its coefficient map and φ:R→R′ the coefficient map of [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings). The canonical A′-linear map A′⊗_A R→R′, a′⊗r↦ι′a′ φ(r), is an equivalence and respects the algebra multiplication.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Extend the monomial basis vⁿ,u vⁿ through tensoring. The same monic normal form over A′ identifies the image basis with that of R′. Multiplication compatibility follows on pure tensors.

The algebra equivalence of §2.80 has the same underlying linear map.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), [monic normal form in the section ring](#260-monic-normal-form-in-the-section-ring), `TensorProduct.lift`.

### 2.71 Naturality of section evaluation

Under coefficient convention C9. ev′(φ(r))=f(ev(r)) for every r∈R.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Both sides are ring maps R→A′; evaluate them on u, v and every coefficient ιz. Use the unique expression p(v)+u q₁(v) to reduce the equality to coefficientwise polynomial evaluation. A direct proof compares the two ring maps by AdjoinRoot.ringHom_ext; their values on coefficient polynomials and the root agree. This direct proof requires only those evaluations, with no flatness assumption.

The equation holds also when f kills a nonzero coefficient; it is not cancellation through f.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), [monic normal form in the section ring](#260-monic-normal-form-in-the-section-ring), `AdjoinRoot.ringHom_ext`.

### 2.72 Section evaluation of a dual value

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For every h∈D and j_d=⟨d⟩∈J, evaluating at Y=t gives E(h(j_d))₀(t)=(s+γt)E(h(j_d))₁(t).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Apply commutation at the two actual ideal generators c,d. Take the second polynomial coordinate, evaluate at t, and use Y−t=0; no reducedness of A is used.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [commutation of ideal values in the dual](#220-commutation-of-ideal-values-in-the-dual), [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.73 Relations between the section ideal generators

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. If cx=dy for x,y∈R, there are r∈R and α∈A with x=dr+ιαb and y=cr−ιαa.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Write E(x)=(p,q₁). The second coordinate of cx=dy evaluated at Y=t gives p(t)=(s+γt)q₁(t). Put α=q₁(t); divide p−C((s+γt)α) and q₁−Cα by Y−t using the pinned arbitrary-ring monic divisibility theorem. Reconstruct r from their quotient polynomials. E(b)=(C(s+γt),1) gives x=dr+ιαb. Substitute this equality into cx=dy, use cb+da=0 and cancel the regular element d to obtain y=cr−ιαa.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [the section-coordinate relation](#218-the-section-coordinate-relation), `Polynomial.X_sub_C_dvd_sub_C_eval`.

### 2.74 Relations in the section dual presentation

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. If dx=by for x,y∈R, there are r∈R and α∈A with x=br−ιαa and y=dr+ιαc.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Write E(y)=(p,q₁). Evaluate the second coordinate of dx=by at Y=t to get p(t)=−s q₁(t). Put α=q₁(t) and divide the two coordinate polynomials after subtracting their values at t by Y−t. Since E(c)=(−Cs,1), inverse coordinates give y=dr+ιαc. Use cb+da=0 in dx=by and cancel d to obtain x=br−ιαa.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [multiplication by the dual numerator in coordinates](#263-multiplication-by-the-dual-numerator-in-coordinates), [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), [coordinates of the first section generator](#255-coordinates-of-the-first-section-generator), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [the section-coordinate relation](#218-the-section-coordinate-relation), `Polynomial.X_sub_C_dvd_sub_C_eval`.

### 2.75 The scalar equation for vanishing in the dual

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. P_D(z)=0 if and only if dz₀=bz₁.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Evaluate a zero map on d and use ε(d)=b for the forward implication. For the reverse implication multiply the evaluation at any j by d, use dε(j)=bj and cancel d.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [evaluation of the ordered dual presentation](#264-evaluation-of-the-ordered-dual-presentation), [denominator-free dual generator](#240-denominator-free-dual-generator), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.76 The bidual generator relation

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Every F∈Hom_R(D,R) satisfies dF(ε)=bF(incl).

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. Apply the R-linear functional F to d·ε=b·incl and use R-linearity.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

([knudsen2012](#references), §3 Key Example, multiplication description of J∨ and Proposition 3.1; compare Corollary 3.2 and §4.)

*Needs:* [the dual generator module relation](#265-the-dual-generator-module-relation).

### 2.77 The actual completed coefficient algebra

Under coefficient convention C3. Equip R̂ with the Â-algebra induced by ĩ. Keep the inherited A-algebra coming from R.

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Use the algebra attached to the constructed ring homomorphism.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

The construction has the following API.

- Under coefficient convention C3. The chosen algebra map Â→R̂ equals ĩ on every a∈Â.
- Under coefficient convention C3. The chosen algebra map sends e_A(a) to e_R(ι(a)) for every a∈A.
- Under coefficient convention C3. The inherited A-action and the chosen Â-action on R̂ form IsScalarTower(A,Â,R̂).

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²) and Â=ℤ₂. ĩ(1/3) is the element of R̂ with 3·ĩ(1/3)=1; its images in R/4R and R/8R are both 3, since 3·3≡1 modulo 4 and modulo 8. The inherited ℤ-action does not produce this element.
- In the same fixture ĩ(2^k)=2^k≠0 in R̂ for every k, so ĩ does not factor through A/p=𝔽₂.
- For the unit ideals p=A and m=R, which satisfy p⊆ι⁻¹(m), Â=0 and R̂=0, and the algebra map is the map of zero rings.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* [completed nodal coefficient homomorphism](#268-completed-nodal-coefficient-homomorphism).

### 2.78 Completion kernel vanishes in the finite tensor

Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. For c∈pⁿ·Â, q∈Qₙ and z∈N, q⊗_A(cz)=0.

The displayed finite-generation hypothesis is used only where stated. All actions are the specified actual restrictions. No flatness of N, no noetherianity or localness, and no discriminant hypothesis is introduced. The completed-base module N is arbitrary.

One proof uses the following inputs and comparisons. Induct on c in the submodule generated by products b·d with b∈pⁿ and d∈Â. Move b across the A-tensor using the actual tower on N; its action on Qₙ is zero. Addition follows from tensor additivity.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `Submodule.smul_induction_on`.

### 2.79 Coefficient flatness of the section ideal

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). J is flat as an A-module.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. R is A-free by the existing monomial normal form. The ideal projection p is the A-linear retraction R→J and fixes each actual ideal element; it is exactly the first coordinate of [coefficient-linear splitting of section evaluation](#261-coefficient-linear-splitting-of-section-evaluation). Apply the cited retract-of-flat theorem. No R-flatness or relative stable reflexivity is asserted. An alternative proof uses [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal) and the existing projective/free-flat instance. 

No claim that J is R-flat, projective over R or invertible at the node.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [monic normal form in the section ring](#260-monic-normal-form-in-the-section-ring), `Module.Flat.of_retract`, `Module.Flat.of_free`, [coefficient-linear splitting of section evaluation](#261-coefficient-linear-splitting-of-section-evaluation), [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [projection fixes the section ideal](#250-projection-fixes-the-section-ideal), `Module.Flat.of_projective`.

### 2.80 Algebraic tensor comparison for a pointed node

Under coefficient convention C9. Construct the unique A′-algebra equivalence E_R:A′⊗_A R≃R′ with E_R(a′⊗r)=ι′a′·φ(r). The tensor algebra multiplication is (a′⊗r)(b′⊗z)=a′b′⊗rz.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. The coefficient map is an A-algebra map after restricting the target through f; its scalar equation follows on coefficients. Use the baseline algebra base-change universal property to obtain the A′-algebra map with the specified pure-tensor formula. The existing linear tensor comparison has the same formula, hence the same underlying map by tensor induction. Transfer its inverse/bijectivity, not an unproved algebra isomorphism. Uniqueness follows by equality on pure tensors.

Multiplication preservation is required; an unrelated A′-linear normal-coordinate identification does not suffice.

The construction has the following API.

- Construct E_R as the natural A′-algebra equivalence A′⊗_A R≃R′.
- E_R(a′⊗r)=ι′a′φ(r).
- Every A′-algebra equivalence with this pure-tensor formula equals E_R.
- For f=id_A, E_R(a⊗r)=ιa·r on the actual polynomial ring.
- For A —f→ A′ —g→ A″, `E_{R,g}(a″⊗E_{R,f}(a′⊗r))=E_{R,g∘f}((a″g(a′))⊗r)`, with γ,δ,s,t mapped at each step. Equality on pure tensors gives the tensor-associativity composition square.

**Checks.**

- For ℤ→ℤ/4 with s=3 and γ=δ=t=0: E_R(1⊗c)=u′+1, E_R(3⊗u)=3u′, and E_R((1⊗u)(1⊗u))=E_R(1⊗9)=1=u′²=E_R(1⊗u)² in R′=(ℤ/4)[v′][u′]/(u′²−1); multiplicativity is a computed identity, not a definition.
- For ℤ→𝔽₂ with γ=1 and δ=s=t=0, 1⊗2v=2⊗v=0 in 𝔽₂⊗_ℤR and E_R(1⊗2v)=2v′=0: the vanishing is in the tensor product, so E_R loses no injectivity.
- For ℤ→ℤ/4→𝔽₂ with zero parameters, `E_{R,g}(1⊗E_{R,f}(1⊗(3u+2v)))=E_{R,g}(1⊗(3u′+2v′))=u″=E_{R,g∘f}(1⊗(3u+2v))`.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [coefficient base change of the node ring](#270-coefficient-base-change-of-the-node-ring), [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), `AlgHom.liftEquiv`.

### 2.81 Semilinear coefficient map on the section ideal

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. Construct the actual φ-semilinear restriction ψ:J→J′, whose underlying ring value is ψ(j)=φ(j). It sends the two ordered ideal generators to their corresponding primed generators, satisfies ψ(rj)=φ(r)ψ(j), and obeys identity and composition on actual ideal elements. This restriction is not asserted injective or an equivalence; the tensor equivalence is a separate existing obligation.

Here A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Naturality of ev sends every j∈ker(ev) into ker(ev′), hence into the native J′. Restrict the native ring homomorphism to the two native ideal subtypes; use its additive and multiplicative equations for the built semilinear LinearMap structure. The existing coefficient projection formulas give the two generator values. The native ring-map identity and composition prove the pointwise identities by subtype extensionality. A nonflat coefficient map can annihilate a nonzero ideal element; do not infer a pure-map inverse from a later tensor comparison.

Underlying carrier is the native Ideal.span subtype, not a new quotient or tensor carrier. Semilinearity uses φ on R-scalars; f-linearity without scalar transport would be ill-typed.

The construction has the following API.

- The coefficient map restricts to an actual φ-semilinear map ψ:J→J′.
- For every j∈J, the underlying ring element of ψ(j) is φ(j).
- ψ sends the native generator c with its actual membership proof to c′.
- ψ sends the native generator d with its actual membership proof to d′.
- For the identity coefficient homomorphism, ψ(j)=j for every actual j∈J.
- For A→A′→A″, `ψ_g(ψ_f(j))=ψ_{g∘f}(j)`, with all four parameters mapped.
- For every r∈R and j∈J, ψ(r•j)=φ(r)•ψ(j), using the existing ideal scalar actions.

**Checks.**

- For every coefficient ring and every actual ideal element j, the identity coefficient map fixes j.
- For every coefficient map, the ordered native section-ideal generators c and d map to c′ and d′; this excludes swapping the two coordinates or keeping unmapped parameters.
- For A=ℤ, γ=1,δ=s=t=0 and f:ℤ→ℤ/2, the actual ideal element j=2d is nonzero in the untruncated polynomial model, but ψ(j)=0. Thus arbitrary coefficient restriction is not injective and need not be flat.

([knudsen2012](#references), Introduction, base-change requirement; §3 Key Example through Proposition 3.1 and Corollary 3.2 proof, especially regularity of v−t and the generator formulas.)

*Needs:* [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), [naturality of section evaluation](#271-naturality-of-section-evaluation), [kernel of section evaluation](#213-kernel-of-section-evaluation), `LinearMap.map_smulₛₗ`.

### 2.82 Polynomial decomposition of the second dual value

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For every h∈D there exists (r,α)∈R×A such that h(⟨d⟩)=dr+ιαb.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Put (p,q₁)=E(h(⟨d⟩)) and α=q₁(t). The preceding relation identifies p(t)=(s+γt)α. Divide p−C(p(t)) and q₁−C(α) by the monic Y−t using the existing arbitrary-ring divisibility theorem. For the resulting quotient polynomials p₀,q₀, set r=E⁻¹(p₀,q₀). The two coordinate multiplication formulas give the stated equality by injectivity of E.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [section evaluation of a dual value](#272-section-evaluation-of-a-dual-value), [ordered polynomial coordinates](#230-ordered-polynomial-coordinates), `Polynomial.X_sub_C_dvd_sub_C_eval`.

### 2.83 The relations of the section ideal surjection

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker P_J=im Ψ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. P_J(z)=0 is exactly cz₀=dz₁. The ideal syzygy gives z=Ψ(r,−ια). Conversely P_J(Ψw)=−w₁(cb+da)=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), [relations between the section ideal generators](#273-relations-between-the-section-ideal-generators), [the right node matrix acting on a column](#222-the-right-node-matrix-acting-on-a-column), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.84 The relations of the section dual surjection

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker P_D=im Φ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Vanishing is dz₀=bz₁. The dual syzygy supplies z=Φ(−ια,r). Conversely the first scalar equation for Φw is w₀(da+bc)=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the scalar equation for vanishing in the dual](#275-the-scalar-equation-for-vanishing-in-the-dual), [relations in the section dual presentation](#274-relations-in-the-section-dual-presentation), [the left node matrix acting on a column](#223-the-left-node-matrix-acting-on-a-column), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.85 Exactness at the transposed left matrix

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker Φᵀ=im Ψᵀ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The second zero coordinate gives d(−z₁)=bz₀. Apply the dual syzygy to (−z₁,z₀), giving z=Ψᵀ(r,ια). The reverse containment is a direct two-coordinate use of cb+da=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the transposed left matrix acting on a column](#224-the-transposed-left-matrix-acting-on-a-column), [the transposed right matrix acting on a column](#225-the-transposed-right-matrix-acting-on-a-column), [relations in the section dual presentation](#274-relations-in-the-section-dual-presentation), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.86 Exactness at the transposed right matrix

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker Ψᵀ=im Φᵀ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The first zero coordinate gives c(−z₁)=dz₀. The ideal syzygy gives z=Φᵀ(−ια,−r). The reverse containment follows coordinatewise from cb+da=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the transposed left matrix acting on a column](#224-the-transposed-left-matrix-acting-on-a-column), [the transposed right matrix acting on a column](#225-the-transposed-right-matrix-acting-on-a-column), [relations between the section ideal generators](#273-relations-between-the-section-ideal-generators), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.87 Bidual values belong to the section ideal

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), F(incl)∈J.

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. Apply the earlier dual syzygy to x=F(ε), y=F(incl). It gives y=dr+ιαc, hence ideal membership.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

([knudsen2012](#references), §3 Key Example, multiplication description of J∨ and Proposition 3.1; compare Corollary 3.2 and §4.)

*Needs:* [the bidual generator relation](#276-the-bidual-generator-relation), [relations in the section dual presentation](#274-relations-in-the-section-dual-presentation), `Ideal.mem_span_pair`.

### 2.88 Completed scalars balance at finite level

Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. For a∈Â, q∈Qₙ and z∈N, (aq)⊗_A z=q⊗_A(az).

The displayed finite-generation hypothesis is used only where stated. All actions are the specified actual restrictions. No flatness of N, no noetherianity or localness, and no discriminant hypothesis is introduced. The completed-base module N is arbitrary.

One proof uses the following inputs and comparisons. Choose b∈A lifting evalₙ(a). The difference a−e_A(b) belongs to pⁿ·Â. Its action contributes zero to the A-tensor by the preceding lemma, and zero to Qₙ by the chosen finite action. Reduce to the ordinary A-balancing relation. Use [the finite quotient retains its native original-coefficient action](#259-the-finite-quotient-retains-its-native-original-coefficient-action) to compare the inherited original-coefficient action with the displayed finite coefficient homomorphism.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [completed coefficients on the finite base](#25-completed-coefficients-on-the-finite-base), [completion kernel vanishes in the finite tensor](#278-completion-kernel-vanishes-in-the-finite-tensor), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `Ideal.Quotient.mk_surjective`, `AdicCompletion.evalₐ_of`, `AdicCompletion.algebraMap_apply`, [the finite quotient retains its native original-coefficient action](#259-the-finite-quotient-retains-its-native-original-coefficient-action).

### 2.89 Cokernel presentation of the section ideal

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), construct eJ:coker Ψ≃ₗ[R]J with eJ([z₀,z₁])=c z₀−d z₁.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the established kernel equality to transport the native quotient by the matrix range to the quotient by the presentation kernel. Apply the pinned first isomorphism theorem to the actual surjective presentation map. Its representative formula gives the prescribed comparison.

The RIGHT matrix has cokernel J.

The construction has the following API.

- The R-linear equivalence is specified by [z]↦c z₀−d z₁.
- The classes of (1,0),(0,1) map to c,−d.
- Any two linear equivalences with the displayed quotient formula agree.

**Checks.**

- [1,0] maps to c.
- [0,1] maps to −d, retaining the sign outside characteristic two.
- Over Z/4 with γ=δ=t=0 and s=1, the actually constructed ideal cokernel equivalence sends the two basis classes to u−1 and −v.
- The actual ideal cokernel comparison exists over the zero coefficient ring Z/1.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), `Submodule.quotEquivOfEq`, `Submodule.quotEquivOfEq_mk`, `LinearMap.quotKerEquivOfSurjective`, `LinearMap.quotKerEquivOfSurjective_apply_mk`.

### 2.90 Coefficient base change of the section ideal

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any f:A→A′, the canonical map A′⊗_A J→J′, a′⊗j↦ι′a′ φ(j), is an A′-linear equivalence onto J′=(c′,d′).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Tensor the split A-linear evaluation sequence: it stays exact for every A′. Identify R′ and A′ and compare their evaluations. The kernel is exactly J′, with the specified images of c,d.

No flatness of f is used; the source sequence is split.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [coefficient base change of the node ring](#270-coefficient-base-change-of-the-node-ring), [kernel of section evaluation](#213-kernel-of-section-evaluation), [coefficient flatness of the section ideal](#279-coefficient-flatness-of-the-section-ideal), `TensorProduct.lift`.

### 2.91 Coefficient naturality of the ideal projection

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. For every r∈R, ψ(p(r))=p′(φ(r)) as actual elements of J′.

Here A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Apply native subtype extensionality. The left underlying value is φ(r−ιev(r))=φ(r)−ι′f(ev(r)). Naturality of evaluation identifies the last coefficient with ev′(φ(r)), exactly the right projection formula.

Equality is in the native target ideal, not merely in an unspecified ambient carrier.

([knudsen2012](#references), Introduction, base-change requirement; §3 Key Example through Proposition 3.1 and Corollary 3.2 proof, especially regularity of v−t and the generator formulas.)

*Needs:* [semilinear coefficient map on the section ideal](#281-semilinear-coefficient-map-on-the-section-ideal), [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [underlying element of the section projection](#241-underlying-element-of-the-section-projection), [naturality of section evaluation](#271-naturality-of-section-evaluation).

### 2.92 Coefficient naturality of the canonical dual generator

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. For every actual j∈J, φ(ε(j))=ε′(ψ(j)). This is pointwise naturality of the existing canonical generators, not an isomorphism between the entire dual modules.

Here A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Multiply both candidate values by the target regular element d′. Mapping dε(j)=bj and using φ(d)=d′ and φ(b)=b′ gives d′φ(ε(j))=b′φ(j). The primed generator formula at the actual ideal element ψ(j) gives the same value. Cancel multiplication by d′ in R′. No cancellation through φ or flat coefficient Hom-exchange theorem is used.

Only native target-coordinate regularity is used; injectivity of f or φ is not assumed.

([knudsen2012](#references), Introduction, base-change requirement; §3 Key Example through Proposition 3.1 and Corollary 3.2 proof, especially regularity of v−t and the generator formulas.)

*Needs:* [semilinear coefficient map on the section ideal](#281-semilinear-coefficient-map-on-the-section-ideal), [denominator-free dual generator](#240-denominator-free-dual-generator), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings).

### 2.93 Existence of section-dual normal coordinates

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. Given ε∈D with dε(j)=bj, every h∈D admits (r,α)∈R×A with h(j)=rj+ιαε(j) for all j∈J.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Choose the pair from h(⟨d⟩). Multiply the desired equality on any j by d. Use jh(⟨d⟩)=dh(j) and dε(j)=bj; cancel the proved regular d.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [polynomial decomposition of the second dual value](#282-polynomial-decomposition-of-the-second-dual-value), [commutation of ideal values in the dual](#220-commutation-of-ideal-values-in-the-dual), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.94 Exactness at the left node matrix

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker Φ=im Ψ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The second coordinate of Φz=0 makes P_J(z)=0. Conversely z=Ψw gives Φz=0 coordinatewise from cb+da=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [the ordered surjection to the section ideal](#221-the-ordered-surjection-to-the-section-ideal), [the left node matrix acting on a column](#223-the-left-node-matrix-acting-on-a-column), [the right node matrix acting on a column](#222-the-right-node-matrix-acting-on-a-column), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.95 Exactness at the right node matrix

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. ker Ψ=im Φ.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The first coordinate of Ψz=0 is precisely P_D(z)=0. Conversely z=Φw is killed by Ψ using cb+da=0.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [the scalar equation for vanishing in the dual](#275-the-scalar-equation-for-vanishing-in-the-dual), [the left node matrix acting on a column](#223-the-left-node-matrix-acting-on-a-column), [the right node matrix acting on a column](#222-the-right-node-matrix-acting-on-a-column), [the section-coordinate relation](#218-the-section-coordinate-relation).

### 2.96 Tensor inclusion of the right matrix image

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(im(Ψ)↪R²) is injective; M need not be flat.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. The actual surjection P_J has kernel im Ψ and A-flat codomain J. Apply the pinned short-exact-sequence tensor-injection theorem with this cokernel.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [coefficient flatness of the section ideal](#279-coefficient-flatness-of-the-section-ideal), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), `LinearMap.lTensor_injective_of_exact_of_flat`.

### 2.97 Tensor exactness of the ideal presentation

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(P_J)=im T_M(Ψ).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. The actual native presentation is surjective with the stated matrix kernel. Apply pinned tensor right exactness without assuming M flat.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), `LinearMap.exact_iff`, `lTensor_exact`.

### 2.98 The tensorized ideal cokernel

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the A-linear equivalence E_J^M:coker T_M(Ψ)≃M⊗_A J characterized by E_J^M([z])=T_M(P_J)(z).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Apply the pinned right-exact tensor quotient equivalence to the actual ordered presentation and its verified kernel. The domain is the actual quotient by the image of the tensorized matrix and the codomain is the actual tensor of J, with their inherited coefficient structures.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

The construction has the following API.

- E_J^M([z])=T_M(P_J)(z) for every tensor z, including sums of pure tensors.
- E_J^M([m⊗z])=m⊗P_J(z).
- E_J^M⁻¹(T_M(P_J)(z))=[z].
- Any A-linear equivalence e:coker T_M(Ψ)≃M⊗_A J with e([z])=T_M(P_J)(z) for every tensor z equals E_J^M.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u, and M=ℤ/2, E_J^M sends the class of 1⊗(1,0) to 1⊗u and the class of 1⊗(0,1) to −1⊗v=1⊗v; 1⊗u is nonzero in M⊗_A J, since J is A-free with u a basis element.
- In the same fixture the relation 1⊗Ψ(1,0)=1⊗(v,u) maps to 1⊗(uv−vu)=0, as the quotient by im T_M(Ψ) requires; 1⊗Φ(1,0)=1⊗(0,−u) maps to 1⊗uv≠0, so Φ is not the presenting matrix of J.
- Over the zero ring both sides are zero and E_J^M is the unique map.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), `LinearMap.exact_iff`, `lTensor.equiv`.

### 2.99 Inverse of section bidual evaluation

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Construct the R-linear map ψ:Hom_R(D,R)→J with underlying value ψ(F)=F(incl).

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. Use membership to form the actual ideal subtype. Addition and scalar multiplication are inherited from evaluation at incl.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

The construction has the following API.

- The image of ψ(F) in R is F(incl).
- For every j∈J, ψ(η(j))=j.
- For every F∈Hom_R(D,R), η(ψ(F))=F.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u: η(v) has values η(v)(incl)=v and η(v)(ε)=u, and ψ(η(v))=v; the alternative F↦F(ε) would give u, so it is not the inverse of evaluation.
- In the same fixture ψ(η(u))=u, and the two values ψ(η(u)), ψ(η(v)) generate J.
- Over ℤ/4 with s=1 and γ=δ=t=0, ψ(η(u−1))=u−1, so the formula is not tied to s=0.

([knudsen2012](#references), §3, pp. 11–13, separating the polynomial multiplication argument on pp. 11–12 (knudsen2012 lines 484–508) from the completed Corollary 3.2 on pp. 12–13 (knudsen2012 lines 509–524). This inverse is a deduction from the preceding bidual-membership target and canonical evaluation, not an additional assertion of completion flatness.)

*Needs:* [bidual values belong to the section ideal](#287-bidual-values-belong-to-the-section-ideal).

### 2.100 Degree-zero cycles factor through the section ideal

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Precomposition by the actual P_J: R²→J followed by d(false,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_J for R-linear f:J→N; precomposition is injective because P_J is surjective.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Reuse the existing exact presentation Ψ→R²→J and its actual surjectivity. Apply native left exactness of R-linear Hom into N; no coefficient flatness is needed.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291, and `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the polynomial section Hom differential](#29-the-polynomial-section-hom-differential), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation).)

*Needs:* [the polynomial section Hom differential](#29-the-polynomial-section-hom-differential), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), `LinearMap.exact_lcomp_of_exact_of_surjective`, `LinearMap.exact_iff`, `LinearMap.lcomp_injective_of_surjective`.

### 2.101 Compatible completed scalars at finite level

Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. The actual actions satisfy native CompatibleSMul(A,Â,Qₙ,N).

The displayed finite-generation hypothesis is used only where stated. All actions are the specified actual restrictions. No flatness of N, no noetherianity or localness, and no discriminant hypothesis is introduced. The completed-base module N is arbitrary.

One proof uses the following inputs and comparisons. Package the proved balancing equality in the existing native class.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [completed scalars balance at finite level](#288-completed-scalars-balance-at-finite-level).

### 2.102 Finite tensor diagram over the original base

Under coefficient convention C6. Construct the actual functor Fᴬ_N:ℕᵒᵖ→ModuleCat(A), with object Qₙ⊗_A N at n and map τᵢⱼ⊗id_N from level j to i for i≤j. Here τᵢⱼ is the inherited actual quotient transition. Finite generation of p is unnecessary.

Here N is arbitrary: no finite generation, flatness or quotient-annihilation hypothesis on N. No noetherianity, localness, discriminant or regular-sequence assumption is used. No finite-generation assumption on p.

One proof uses the following inputs and comparisons. Define the actual object and morphism data at each quotient level, retaining the specified scalar actions. Prove identity on pure tensors from the actual quotient transition identity. Prove composition on actual quotient representatives, then extend by native tensor induction.

Use actual native modules, quotient transition maps, functors, natural isomorphisms and limits. Retain every quotient-transition direction and the actual inherited/restricted scalar action. The two-base ordinary completion, stable-reflexivity, pointed hull and family/stack conclusions retain their exact independent inputs.

The construction has the following API.

- At level n the diagram object is the actual A-module Qₙ⊗_AN.
- For i≤j the j-to-i diagram transition sends q⊗z to τᵢⱼ(q)⊗z over A.
- The transition at equal levels is the identity on the actual tensor module.
- For i≤j≤k the k-to-i transition is the composite of the k-to-j and j-to-i transitions.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²). With N=ℤ₂ the level-2 object Q₂⊗_ℤℤ₂ is Q₂, because ℤ/4⊗_ℤℤ₂=ℤ/4, and the transition from level 3 to level 2 sends (u+5)⊗1 to (u+1)⊗1. A transition keeping the level-3 representative does not land in this 4-torsion module.
- In the same fixture with N=ℚ₂ every object Qₙ⊗_ℤℚ₂ is 0, since 2ⁿ kills Qₙ and is a unit in ℚ₂. A diagram with object Qₙ alone is nonzero there.
- At level zero Q₀=R/R=0, so every transition from level j to level zero on the actual tensor module is zero.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), [the finite quotient retains its native original-coefficient action](#259-the-finite-quotient-retains-its-native-original-coefficient-action).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), [the finite quotient retains its native original-coefficient action](#259-the-finite-quotient-retains-its-native-original-coefficient-action), `CategoryTheory.Functor`, `CategoryTheory.leOfHom`, `ModuleCat.of`, `ModuleCat.ofHom`, `ModuleCat.hom_injective`, `TensorProduct.induction_on`, `DFunLike.ext`, `Ideal.Quotient.mk_surjective`.

### 2.103 Finite tensor diagram over the completed base

Under coefficient convention C6. Construct the actual functor FÂ_N:ℕᵒᵖ→ModuleCat(A), with object Qₙ⊗_Â N at n, restricted to A through native ModuleCat.restrictScalars along A→Â, and map τᵢⱼ⊗id_N over Â, restricted to A, from level j to i. Finite generation of p is unnecessary.

Here N is arbitrary: no finite generation, flatness or quotient-annihilation hypothesis on N. No noetherianity, localness, discriminant or regular-sequence assumption is used. No finite-generation assumption on p.

One proof uses the following inputs and comparisons. Form each tensor over Â with the actual finite quotient action. Restrict the bundled Â-module through the native ModuleCat scalar-restriction functor along A→Â; its A-action is exactly Module.compHom. Apply the same native restriction functor to the actual Â-linear transition tensor map. Prove identity on pure tensors using the quotient identity and composition on actual quotient representatives, then extend by native tensor induction.

Use actual native modules, quotient transition maps, functors, natural isomorphisms and limits. Retain every quotient-transition direction and the actual inherited/restricted scalar action. The two-base ordinary completion, stable-reflexivity, pointed hull and family/stack conclusions retain their exact independent inputs.

The construction has the following API.

- At level n the diagram object is the actual A-module Qₙ⊗_ÂN.
- For i≤j the j-to-i diagram transition sends q⊗z to τᵢⱼ(q)⊗z over Â.
- The transition at equal levels is the identity on the actual tensor module.
- For i≤j≤k the k-to-i transition is the composite of the k-to-j and j-to-i transitions.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²). With N=ℤ₂² the level-2 object is Q₂², and the transition from level 3 to level 2 sends (u+5)⊗(1,1/3) to (u+1,3u+3), because 1/3≡3 modulo 4.
- In the same fixture with N=ℚ₂ every object `Qₙ⊗_{ℤ₂}ℚ₂` is 0, as over the original base.
- At level zero Q₀=R/R=0, so every transition from level j to level zero on the actual tensor module is zero.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `CategoryTheory.Functor`, `CategoryTheory.leOfHom`, `ModuleCat.of`, `ModuleCat.ofHom`, `ModuleCat.hom_injective`, `TensorProduct.induction_on`, `DFunLike.ext`, `Ideal.Quotient.mk_surjective`, `ModuleCat.restrictScalars`.

### 2.104 Native completed-coefficient tensor diagram

Under coefficient convention C7. Construct G:ℕᵒᵖ→ModuleCat(Â), with object Qₙ⊗_Â N and transition τᵢⱼ⊗id_N for i≤j. This is the native Â-linear diagram before scalar restriction.

Here N is arbitrary: no flatness, finite generation or annihilation hypothesis on the finite quotients. No noetherianity, localness, discriminant or regular-sequence hypothesis. No finite-generation hypothesis on p.

One proof uses the following inputs and comparisons. Give the actual finite completed tensor objects and completed-linear transitions before scalar restriction. Prove identity by the inherited actual quotient identity on pure tensors; prove composition on actual quotient representatives and extend by native tensor induction.

Use actual native tensor objects, scalar actions, quotient transitions and limit projections. Retain the ordinary two-base completion/stable-reflexivity theorem, faithful reflection, pointed hull, sheaf/family descent and arbitrary-base approximation as separate required work.

The construction has the following API.

- At level n, G(n) is the actual native Â-module Qₙ⊗_Â N.
- For i≤j, G(j→i)(q⊗z)=τᵢⱼ(q)⊗z over Â, with the actual quotient coefficient actions.
- For any j and x∈G(j), G(j→0)(x)=0 because Q₀=R/R=0.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²) with N=ℤ₂², G(3) sends (1+2v+4v²)⊗(1,1/3) to (1+2v+4v², 3+6v+4v²) under the coordinate identification with Q₃²; the transition to level 2 gives (1+2v, 3+2v).
- Acting by 1/3 before or after the transition gives (3+6v+4v², 1+2v+4v²) at level 3, using (1/3)²≡1 modulo 8; exchanging the coordinates or using the coefficient 1 in place of 1/3 gives a different pair.
- Every transition to level zero is the zero map, since Q₀=R/R=0; this includes the identity at level zero.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `CategoryTheory.Functor`, `ModuleCat.of`, `ModuleCat.ofHom`, `CategoryTheory.leOfHom`, `TensorProduct.induction_on`, `Ideal.Quotient.mk_surjective`, `ModuleCat.hom_injective`, `DFunLike.ext`.

### 2.105 Exactness of the node-section complex

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

Here A is any commutative ring; γ,δ,s,t∈A. The proof uses regular F before quotienting, not regularity of A.

One proof uses the following inputs and comparisons. Assemble the four separately proved kernel/image equalities. Each uses the ordered coordinate syzygies and cb+da=0 in the actual quotient; no general matrix-factorization theorem is assumed.

The conclusion does not hold for arbitrary specialized coordinate values in another ring. No general MCM/matrix-factorization equivalence is reproved.

**Checks.**

- In A[u,v]/(u²+uv), characteristic two does not affect ker Φ=im Ψ.
- Over Z with γ=1,δ=0 and all coordinates zero, both matrices are zero but kernel is Z² and image is zero.
- Over Z/4 with γ=δ=t=0 and s=1, actual quotient exactness and transposed quotient exactness hold.
- Exactness holds in the actual polynomial quotient over the zero coefficient ring.

([knudsen2012](#references), Proposition 3.1 and proof, pp. 11–12.)

*Needs:* [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix), [exactness at the transposed left matrix](#285-exactness-at-the-transposed-left-matrix), [exactness at the transposed right matrix](#286-exactness-at-the-transposed-right-matrix).

### 2.106 Normal form in the actual section dual

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). With the characterized ε, every h∈D has a unique expression h=r·incl+ια·ε with (r,α)∈R×A.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the proved existence pair for every ideal input. For two pairs evaluate at the actual generator d; the characterization of ε and regularity give ε(d)=b. Apply the separate coordinate-uniqueness lemma.

The second coordinate lies in A, not a second independent copy of R.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [existence of section-dual normal coordinates](#293-existence-of-section-dual-normal-coordinates), [uniqueness from the second ideal generator](#262-uniqueness-from-the-second-ideal-generator), [denominator-free dual generator](#240-denominator-free-dual-generator), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.107 Scalar correction in dual coordinates

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). There is a unique A-linear K:R→R satisfying d K(r)=b(r−ι(ev r)). It obeys K(rz)=rK(z)+ι(ev z)K(r), K(c)=−a, K(d)=b and K(ια)=0.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Define the named A-linear K as the existing R-linear ε restricted to A, composed with the actual A-linear ideal projection p. Its denominator-free formula is the dual-generator formula evaluated at p(r). Multiplicativity of ev and ι and cancellation of d prove K(rz)=rK(z)+ι(ev(z))K(r). The projection fixes c,d and kills coefficients, giving K(c)=−a, K(d)=b and K(ι(α))=0. Cancellation also proves uniqueness among all A-linear maps with the characterization.

The product law uses ev(z) multiplying K(r); reversing that convention without changing the first term is incorrect.

The construction has the following API.

- The denominator-free identity uniquely specifies the correction.
- K(ια)=0 for every α∈A.
- Two A-linear maps satisfying the identity agree.
- The named K(r) equals ε(p(r)), with the existing ideal projection p.
- For the named K and every r, d K(r)=b(r−ι(ev(r))).
- The named K satisfies K(rz)=rK(z)+ι(ev(z))K(r).
- The named K satisfies K(c)=−a and K(d)=b.
- For every α∈A, the named K satisfies K(ι(α))=0.
- For the named canonical K=ε∘p, φ(K(r))=K′(φ(r)) for every coefficient map, without flatness.

**Checks.**

- On the actual F₂ polynomial quotient with γ=1,δ=s=t=0, the named K sends u to u; the minus sign becomes equal only in characteristic two.
- For every coefficient ring, all coefficients and all r∈R, the named K satisfies K(rd)=rb because ev(d)=0. The product-law orientation is detected at r=1.
- The identity coefficient map fixes the named canonical correction K(r) for every r.
- For every actual j∈J and every coefficient map, φ(K(j))=ε′(ψ(j)); the ideal projection fixes j, so no artificial correction term remains.
- For the actual ℤ model with γ=1,δ=s=t=0 and f:ℤ→ℤ/2, φ(K(u))=u′. The source value is −u and its negative becomes equal to u′ only in characteristic two; nonflat change is allowed.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [canonical retraction onto the section ideal](#234-canonical-retraction-onto-the-section-ideal), [denominator-free dual generator](#240-denominator-free-dual-generator), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), `LinearMap.restrictScalars`, [coefficient naturality of the ideal projection](#291-coefficient-naturality-of-the-ideal-projection), [coefficient naturality of the canonical dual generator](#292-coefficient-naturality-of-the-canonical-dual-generator).

### 2.108 Finite presentation of the polynomial section ideal

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). J is finitely presented as an R-module, even if A is nonnoetherian.

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m).

One proof uses the following inputs and comparisons. The inherited eJ identifies J with the cokernel of the two-by-two matrix Ψ. The image of R²→R² is finitely generated by the images of two basis vectors. Apply the pinned finite-presentation quotient theorem to the surjection R²→J; no coherence assumption on A is used.

Finite generation of an ideal alone would not imply finite presentation over an arbitrary ring. This target uses the exact presentation of [cokernel presentation of the section ideal](#289-cokernel-presentation-of-the-section-ideal).

([knudsen2012](#references), §3, Proposition 3.1, pp. 11–12, for the presentation of J as the cokernel of Ψ; finite presentation then follows from `Module.finitePresentation_of_surjective`.)

*Needs:* [cokernel presentation of the section ideal](#289-cokernel-presentation-of-the-section-ideal), `Module.finitePresentation_of_surjective`, `Submodule.fg_range`.

### 2.109 Generators of the ideal cokernel

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For any e_J with the prescribed quotient formula, e_J([1,0])=c and e_J([0,1])=−d.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Substitute the two standard coordinate vectors into the quotient formula.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [cokernel presentation of the section ideal](#289-cokernel-presentation-of-the-section-ideal).

### 2.110 Uniqueness of the ideal cokernel comparison

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. Any two R-linear cokernel equivalences with underlying formula [z]↦cz₀−dz₁ agree.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Every class has a representative z. Use the two formula hypotheses and ideal subtype extensionality; quotient induction gives equality of the maps.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [cokernel presentation of the section ideal](#289-cokernel-presentation-of-the-section-ideal), `Submodule.Quotient.induction_on`.

### 2.111 Coefficient universal exactness at Ψ

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Ψ)=im T_M(Φ).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Factor Ψ through its actual image. The restricted corestriction is surjective and its preceding pair is exact. Pinned right exactness preserves that pair for arbitrary M. Postcompose with the proved tensor-image injection and use the native tensor composition law to recover T_M(Ψ).

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

**Checks.**

- For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual right alternating tensor pair is exact.
- For A=Z/1 with zero parameters and M=Z/1, the actual right alternating tensor pair is exact.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix), [tensor inclusion of the right matrix image](#296-tensor-inclusion-of-the-right-matrix-image), `lTensor_exact`, `LinearMap.rangeRestrict`, `LinearMap.ker_rangeRestrict`, `LinearMap.surjective_rangeRestrict`, `LinearMap.subtype_comp_rangeRestrict`, `LinearMap.lTensor_comp`, `Function.Injective.comp_exact_iff_exact`.

### 2.112 The polynomial section chain differential

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Define B(e,n) as the actual R-linear matrix map F→F; false starts with Ψ and true with Φ.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Select the actual matrix by parity; retain its signs and source/target order.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- B(false,0)=Ψ as an actual R-linear map.
- B(true,0)=Φ as an actual R-linear map.
- B(e,n+2)=B(e,n) for every e,n as actual R-linear maps.

**Checks.**

- For γ=δ=s=t=0 over every A, B(false,0)(1,0) has second coordinate u.
- For γ=δ=s=t=0 over every A, B(true,0)(1,0) has second coordinate −u.
- For γ=δ=s=t=0 over A=ℤ, Ψ(1,0)=(v,u) and Φ(v,u)=(u²,0)=(0,0) in R; over ℤ[u,v], before the quotient, the same composite is (u²,0)≠0, so B(e,n)∘B(e,n+1)=0 uses the defining relation.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix).)

*Needs:* [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix).

### 2.113 Finite two-base tensor equivalence

Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. Construct the actual Qₙ-linear equivalence Eₙ,N:Qₙ⊗_A N≃Qₙ⊗_Â N.

The displayed finite-generation hypothesis is used only where stated. All actions are the specified actual restrictions. No flatness of N, no noetherianity or localness, and no discriminant hypothesis is introduced. The completed-base module N is arbitrary.

One proof uses the following inputs and comparisons. The new balancing lemma supplies one native CompatibleSMul instance. The actual A→Â scalar towers supply the reverse instance. Specialize the existing native tensor equivalence; its two maps preserve pure tensors.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

The construction has the following API.

- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. Eₙ,N(q⊗_A z)=q⊗_Â z.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. Eₙ,N⁻¹(q⊗_Â z)=q⊗_A z.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. For every x∈Qₙ⊗_A N, Eₙ,N⁻¹(Eₙ,N(x))=x.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. For every y∈Qₙ⊗_Â N, Eₙ,N(Eₙ,N⁻¹(y))=y.
- For every i≤j and x∈(R/mʲ)⊗_A N, first transition over A and then apply the level-i comparison equals first apply the level-j comparison and then transition over Â.
- For every i≤j and x∈(R/mʲ)⊗_Â N, the level-i inverse after transition equals the A-transition after the level-j inverse.
- For every Â-linear f:N→N′, applying id⊗f over A and then the finite comparison equals applying the finite comparison and then id⊗f over Â.
- For every Â-linear f:N→N′, the inverse finite comparison intertwines id⊗f over Â with id⊗f over A.

**Checks.**

- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, Eₙ,N(q⊗_A z)=q⊗_Â z.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, Eₙ,N⁻¹(q⊗_Â z)=q⊗_A z.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, every a∈Â balances across the original A-tensor; this excludes a spurious comparison that ignores completed coefficients.
- For any finite tensor sum x at level j and i≤j, the comparison commutes with the actual quotient transition; x is not assumed pure.
- For every completed-coefficient-linear map f:N→N′, the forward finite comparison intertwines the actual native left tensor maps.
- The inverse finite comparison intertwines the same coefficient maps on arbitrary completed-base tensors, with the original-side scalar restriction explicit.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [compatible completed scalars at finite level](#2101-compatible-completed-scalars-at-finite-level), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `TensorProduct.CompatibleSMul`, `TensorProduct.equivOfCompatibleSMul`.

### 2.114 Restriction of the native completed diagram

Under coefficient convention C7. Construct the natural isomorphism ρ from the A-linear completed-tensor diagram F̂ to G followed by native restriction of scalars along A→Â. Both components are the identity on actual tensors; morphisms are the same restricted Â-linear quotient transitions.

Here N is arbitrary: no flatness, finite generation or annihilation hypothesis on the finite quotients. No noetherianity, localness, discriminant or regular-sequence hypothesis. No finite-generation hypothesis on p.

One proof uses the following inputs and comparisons. Compare the actual object carriers and restricted module actions by unfolding their native definitions. Use identity components; naturality identifies the same actual quotient transition before and after scalar restriction.

Use actual native tensor objects, scalar actions, quotient transitions and limit projections. Retain the ordinary two-base completion/stable-reflexivity theorem, faithful reflection, pointed hull, sheaf/family descent and arbitrary-base approximation as separate required work.

The construction has the following API.

- The forward component ρₙ is the identity of the actual restricted tensor module.
- The inverse component ρₙ⁻¹ is the identity of the same restricted tensor module.
- The completed diagram transition is exactly the restriction of G(j→i) along A→Â.

**Checks.**

- The forward component is the identity on each actual quotient tensor, also at n=0.
- The inverse component is the identity on each actual quotient tensor.
- Every actual quotient transition agrees after native restriction of scalars.

(The construction-specific inputs are [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [finite tensor diagram over the completed base](#2103-finite-tensor-diagram-over-the-completed-base).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [finite tensor diagram over the completed base](#2103-finite-tensor-diagram-over-the-completed-base), `CategoryTheory.NatIso.ofComponents`, `ModuleCat.restrictScalars`.

### 2.115 Completed-chart coefficient-linear evaluation

Under coefficient convention C5. Construct eₙ:R̂→ₐ[Â]Qₙ whose underlying ring map is the native completion evaluation at n.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Use the actual completed coefficient algebra and the inherited completed coefficient evaluation square to prove that evaluation preserves Â coefficients.

The construction has the following API.

- For every u∈R̂, eₙ(u)=AdicCompletion.evalₐ(m,n,u).
- For i≤j and u∈R̂, τᵢⱼ(eⱼ(u))=eᵢ(u).
- On the native completion image of r∈R, evaluation gives its actual class modulo mⁿ.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²). The element `σ=Σ_{k≥0}2^k v^k` of R̂ evaluates to 1+2v in Q₂ and to 1+2v+4v² in Q₃. Evaluation modulo m instead of mⁿ would give 1 at every level.
- In the same fixture e₃((1/3)σ)=3(1+2v+4v²)=3+6v+4v² in Q₃, and reducing to level 2 gives 3+2v. The value 3 for e₂(1/3) already follows from additivity and e₂(1)=1, since 3 is invertible modulo 4; it is a value check, not a separation of the two scalar structures.
- At n=0 the target Q₀ is the zero ring and e₀ is zero; at n=1, e₁(σ)=1 in Q₁=𝔽₂[u,v]/(u²).

(Deduction using `AdicCompletion.transitionMap_comp_eval_apply` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`, line 414. The construction-specific inputs are [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [completed nodal coefficient homomorphism](#268-completed-nodal-coefficient-homomorphism), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [completed nodal coefficient homomorphism](#268-completed-nodal-coefficient-homomorphism), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `TensorProduct`.

### 2.116 Assembly of completed-chart quotient families

Under coefficient convention C5. For every family fₙ∈Qₙ satisfying τᵢⱼ(fⱼ)=fᵢ for i≤j, construct u∈R̂ from this actual family, without choosing representatives as mathematical data.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Convert Qₙ to the native submodule quotient R/(mⁿ·R); prove its coherence by the supplied quotient equations and quotient representatives. The native subtype is reused, not redefined.

The construction has the following API.

- For every coherent family f and every n, evalₙ(assemble(f))=fₙ.
- Assembling the identically zero compatible family produces zero in the actual completion.
- Assembling all quotients of an existing element of R̂ recovers that element.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²) and Qₙ=(ℤ/2ⁿ)[u,v]/(u²). The compatible family `fₙ=1+2v+⋯+2^{n−1}v^{n−1}` assembles to `σ=Σ_{k≥0}2^k v^k`, which is not the image of an element of R because its v-degrees are unbounded.
- A family with f₁=1 and f₂=0 is not compatible, since τ₁₂(0)=0≠1; it is not an input of the assembly.
- The constant family fₙ=u assembles to the image of u∈R, and the identically zero family to 0.

(The construction-specific inputs are [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `Ideal.Quotient.factor`, `Ideal.Quotient.factorPow`, `Ideal.Quotient.mk_surjective`, `TensorProduct`.

### 2.117 Finite-free quotient tensor coordinates

Under coefficient convention C5, put cₙ equal to the imported finite-coordinate equivalence `TensorProduct.piScalarRight` for Qₙ and Fin(r). Prove only its compatibility with this roadmap's Â-linear quotient-transition diagram: for i≤j, x∈G(j) and k∈Fin(r), cᵢ(G(j→i)x)(k)=τᵢⱼ(cⱼ(x)(k)). This specializes the native equivalence to the actual quotient Â-actions; it does not construct another coordinate equivalence or its inverse.

The proof evaluates on q⊗z, using `TensorProduct.map_tmul` and `TensorProduct.piScalarRightHom_tmul`, then extends by tensor induction. Both sides are z(k)·τᵢⱼ(q), because τᵢⱼ is Â-linear.

**Checks.**

- With p=(2), j=4, i=3, r=2, q=3 and z=(2,3), level-four coordinates are (6,9), which reduce to (6,1) modulo 8. Transition first gives the same (6,1); omitting reduction would retain 9.
- With r=1, j=3 and i=2 the coordinate 3·2=6 reduces to 2 modulo 4 on both routes. The native inverse recovers 6e₀ at level three.
- With r=0 the coordinate module and tensor are zero at every level. At rank two the native inverse sends (6,9) to 6⊗e₀+9⊗e₁, so a zero coordinate map fails the nonzero-level test.

(Deduction from `TensorProduct.piScalarRightHom_tmul`, `TensorProduct.piScalarRight_symm_single` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, lines 140, 176, and `TensorProduct.map_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, line 59, with the quotient transitions of the cited earlier targets.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `TensorProduct.piScalarRight`.

### 2.118 Embedding a nodal cone into finite coordinates

Under coefficient convention C1. For any Â-linear i:N→F and cone c over G_N, construct a cone over G_F with point c.pt and component (id_Qₙ⊗i)∘cₙ. The construction does not require a splitting.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; no flatness of N is assumed.

One proof uses the following inputs and comparisons. Combine c naturality with commutation of the actual quotient transition and native lTensor(i), proved by tensor induction.

The construction has the following API.

- Under coefficient convention C1. At n and x∈c.pt, the embedded cone component is (id_Qₙ⊗i)(cₙ(x)).
- Under coefficient convention C1. For j≤k, its k-component followed by G_F(k→j) equals its j-component.
- Under coefficient convention C1. For the zero map i:N→F, every component of the embedded cone is zero; this is a cone computation and does not assert that zero is a splitting.

**Checks.**

- Under coefficient convention C1. For every Â-linear i:N→F, cone c over G_N, x∈c.pt and n, the embedded cone n-component at x equals (id_Qₙ⊗i)(cₙ(x)). No splitting is assumed.
- Under coefficient convention C1. For every Â-linear i:N→F, cone c and j≤k, the embedded cone k-component followed by G_F(k→j) equals its j-component.
- Under coefficient convention C1. For the zero embedding map i:N→F, every embedded cone component is zero on every x∈c.pt. This does not assert that zero is a splitting.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `TensorProduct`, `LinearMap.lTensor`.

### 2.119 Compatible quotient Hom families

Under coefficient convention C2. Construct H_L as the native Â-submodule of ∏ₙ Hom_R(L,Qₙ⊗_Â N) consisting of families h with τᵢⱼ(hⱼ(x))=hᵢ(x) for every i≤j and x∈L. This carrier exists for every N.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is arbitrary: no finiteness, projectivity or flatness of N is used. No noetherian, local, discriminant or finiteness-over-A hypothesis.

One proof uses the following inputs and comparisons. Use the commuting R/Â tensor actions for pointwise Hom coefficients; linear transitions make the stated carrier closed under zero, addition and Â-scalars.

The construction has the following API.

- Under coefficient convention C2. For h∈H_L, i≤j and x∈L, τᵢⱼ(hⱼ(x))=hᵢ(x).
- Under coefficient convention C2. For every n and x∈L, the zero element of H_L has value zero at (n,x).
- Under coefficient convention C2. Two members h,k∈H_L are equal if hₙ(x)=kₙ(x) for all n and x.

**Checks.**

- Take A=ℤ, p=(2), R=ℤ[u,v]/(u²), completion ideal (2), N=ℤ₂ and L=R. The compatible R-linear family of multiplication by 5 has h₂(1)=1 modulo 4, so it belongs to H_L and is nonzero. A zero-submodule carrier excludes it.
- In the same setting, let h₁ be multiplication by 0 modulo 2 and h₂ multiplication by 1 modulo 4. Transition gives 1 modulo 2 rather than 0, so no member of H_L can have these two components.
- The compatible multiplication families 5 and 1 agree at levels one and two, with values 1 modulo 2 and 1 modulo 4 at 1. At level three their values are 5 and 1 modulo 8. They are distinct in H_L; truncation to the first two levels cannot detect equality.

(Deduction using `ModuleCat.sectionsSubmodule` in `Mathlib/Algebra/Category/ModuleCat/Limits.lean`, line 45. The construction-specific inputs are [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).)

*Needs:* [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `TensorProduct`.

### 2.120 Coefficient-linear normal coordinates of the dual

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct the A-linear equivalence D≃ₗ[A]R×A whose inverse sends (r,α) to j↦rj+ια ε(j).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Construct the actual A-linear map (r,α)↦m(r)+α·ε. Native scalar restriction supplies A-linearity of the first summand. Normal-form uniqueness gives injectivity and existence gives surjectivity. Apply the pinned bijective-linear-map equivalence and take its inverse. The inverse formula is its actual pointwise value, rather than an assumed model of the dual.

This equivalence is not R-linear for the componentwise action.

The construction has the following API.

- The inverse evaluates as rj+ιαε(j).
- The inclusion j↦j has coordinates (1,0).
- The dual generator ε has coordinates (0,1).
- The actual R-linear dual D=Hom_R(J,R), restricted to coefficients, is free over A.

**Checks.**

- Applying the equivalence after its inverse fixes every pair (r,α).
- An actually constructed normal equivalence sends the actual map m(1) to (1,0).
- Over Z/4Z with γ=δ=s=t=0, an actually constructed normal equivalence sends the canonical native ε to (0,1).
- An actually constructed equivalence satisfies every pair round trip and the prescribed pointwise inverse formula.
- Over Z/4 with γ=δ=t=0 and s=1, the actual R-linear dual is free over coefficients.
- Over Z/1 with zero parameters, the actual R-linear dual is coefficient-flat.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [normal form in the actual section dual](#2106-normal-form-in-the-actual-section-dual), [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), `LinearMap.map_smul_of_tower`, `LinearEquiv.ofBijective`.

### 2.121 Dual of the extended section ideal

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_D:B⊗_R D≃_B D_B, canonically characterized by E_D(b⊗h)(E_J(b′⊗j))=bb′φ(h(j)). Also expose the actual B-linear multiplication map m_B:B→D_B.

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B).

One proof uses the following inputs and comparisons. Use finite presentation of J and B-flatness in Module.FinitePresentation.isBaseChange_map to identify B⊗Hom_R(J,R) with Hom_B(B⊗J,B⊗R). Transport the domain along E_J⁻¹ and the codomain along the pinned tensor unit equivalence. Evaluate on pure tensors; the images of c,d generate J_B, giving uniqueness. Define m_B by multiplication, independently of E_D.

The target is Hom_B of the mapped ideal. No free-pair coordinate model replaces that Hom.

The construction has the following API.

- The specified B-linear E_D.
- E_D(b⊗h)(E_J(b′⊗j))=bb′φ(h(j)).
- The displayed evaluations uniquely determine E_D.
- m_B:B→_B Hom_B(J_B,B) is the actual multiplication map.
- m_B(b)(j)=bj.

**Checks.**

- E_D(1⊗h)(E_J(1⊗j))=φ(h(j)).
- For B=R the last evaluation is h(j).
- When B is the zero ring, Hom_B(J_B,B) is subsingleton.

([stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [finite presentation of the polynomial section ideal](#2108-finite-presentation-of-the-polynomial-section-ideal), [section ideal under flat ambient extension](#215-section-ideal-under-flat-ambient-extension), `Module.FinitePresentation.isBaseChange_map`, `IsBaseChange.equiv`, `IsBaseChange.equiv_tmul`, `LinearMap.baseChangeHom`, `TensorProduct.AlgebraTensorModule.rid`.

### 2.122 The canonical correction identity

For every r∈R, d K(r)=b(r−ι(ev(r))) for K=ε∘p.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Apply the canonical dual-generator identity to the actual ideal element p(r). Use the inherited projection formula p(r)=r−ι(ev(r)).

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3, Proposition 3.1 multiplication identities, p. 12 (knudsen2012 lines 484–508). The displayed correction is a deduction using p(r)=r−ι(ev(r)); the completed Corollary 3.2 and its proof occupy pp. 12–13 (knudsen2012 lines 509–524).)

*Needs:* [scalar correction in dual coordinates](#2107-scalar-correction-in-dual-coordinates), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity), [underlying element of the section projection](#241-underlying-element-of-the-section-projection).

### 2.123 Surjectivity of the ordered dual presentation

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. P_D is surjective.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. The established dual normal form writes h=r·incl+ια·ε; hence P_D(r,−ια)=h.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [evaluation of the ordered dual presentation](#264-evaluation-of-the-ordered-dual-presentation), [normal form in the actual section dual](#2106-normal-form-in-the-actual-section-dual), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity).

### 2.124 Coefficient universal exactness at Φᵀ

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Φᵀ)=im T_M(Ψᵀ).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Use T_M(p) in all three columns of the commuting ladder. The pinned exactness transport along linear equivalences gives this transposed pair from the opposite ordinary pair.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

**Checks.**

- For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual transposed left alternating tensor pair is exact.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [tensor rotation intertwines φ transpose](#244-tensor-rotation-intertwines-φ-transpose), [tensor rotation intertwines ψ transpose](#245-tensor-rotation-intertwines-ψ-transpose), [coefficient universal exactness at ψ](#2111-coefficient-universal-exactness-at-ψ), `Function.Exact.of_ladder_linearEquiv_of_exact`.

### 2.125 Exactness of consecutive section chain maps

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n+1) followed by B(e,n) is exact.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Separate the two parity values and phases. Apply ker Φ=im Ψ or ker Ψ=im Φ in the indicated order.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix).)

*Needs:* [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [exactness at the right node matrix](#295-exactness-at-the-right-node-matrix).

### 2.126 The section-ideal augmentation kills the first chain map

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. P_J∘B(false,0)=P_J∘Ψ=0.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. The actual signed presentation has kernel im Ψ; apply its exact-pair composite.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection).)

*Needs:* [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), `Function.Exact.linearMap_comp_eq_zero`.

### 2.127 The dual augmentation kills the first chain map

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. P_D∘B(true,0)=P_D∘Φ=0.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. The actual signed dual presentation has kernel im Φ; apply its exact-pair composite.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection).)

*Needs:* [the polynomial section chain differential](#2112-the-polynomial-section-chain-differential), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), `Function.Exact.linearMap_comp_eq_zero`.

### 2.128 Two-base tensor quotient for the nodal chart

Under coefficient convention C3. For every Â-module N with the compatible restricted A-action, construct the R̂-linear map c_N:R̂⊗_A N→R̂⊗_Â N induced by r⊗n↦r⊗n.

Only the displayed commutative-ring and ideal-containment assumptions are used. No noetherianity, localness, nontriviality, discriminant condition or flatness of N is required for these comparisons. The source completion criterion has additional noetherian/local hypotheses and is not proved here.

One proof uses the following inputs and comparisons. Specialize the existing generic compatible-scalar tensor map to the actual completed coefficient algebra and scalar tower. Do not construct a duplicate tensor carrier.

Use the inherited polynomial nodal chart, native ideal quotients and actual AdicCompletion rings. All chosen algebra structures and scalar restrictions must be explicit. This is a prerequisite for the two-base completion argument, not a proof of Knudsen Appendix Proposition 6, relative stable reflexivity, pointed hull identification or sheaf descent.

The construction has the following API.

- Under coefficient convention C3. For every such N, r∈R̂ and n∈N, c_N(r⊗_A n)=r⊗_Â n.
- Under coefficient convention C3. For every such N, c_N is surjective. No flatness or finite-generation assumption is placed on N.
- Under coefficient convention C3. For a∈Â,r∈R̂,n∈N, c_N((a•r)⊗_A n)=c_N(r⊗_A(a•n)).
- Under coefficient convention C3. As an Â-submodule, ker(c_N)=span_Â{(a•r)⊗_A n−r⊗_A(a•n):a∈Â,r∈R̂,n∈N}; restrict the R̂-linear map to Â to state this exact kernel.

**Checks.**

- Under coefficient convention C3. For every n∈N the comparison sends 1⊗_A n to 1⊗_Â n.
- Under coefficient convention C3. For every a∈Â,r∈R̂,n∈N the additional balancing difference maps to zero.
- Under coefficient convention C3. Every arbitrary target tensor has a preimage; the statement covers sums rather than only pure tensors.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6, printed194–195 (physical31–35).)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), `TensorProduct.mapOfCompatibleSMul`.

### 2.129 Finite two-base Hom target equivalence

Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. For arbitrary Qₙ-module L construct the actual Qₙ-linear equivalence Hₙ,N,L:Hom_Qₙ(L,Qₙ⊗_A N)≃Hom_Qₙ(L,Qₙ⊗_Â N) by postcomposition with Eₙ,N.

The displayed finite-generation hypothesis is used only where stated. All actions are the specified actual restrictions. No flatness of N, no noetherianity or localness, and no discriminant hypothesis is introduced. The completed-base module N is arbitrary.

One proof uses the following inputs and comparisons. Specialize native postcomposition on linear-map spaces. Neither finite presentation nor projectivity of L is required.

Use the actual native polynomial chart, ideal quotients, adic completion, tensor product and linear-map spaces. No comparison conclusion is an input hypothesis. A finite quotient equivalence does not identify the whole completed tensor products and does not close Proposition 6, Proposition 7, stable-reflexivity, pointed hull or moduli geometry.

The construction has the following API.

- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. For Qₙ-module L, f:L→Qₙ⊗_A N and x∈L, Hₙ,N,L(f)(x)=Eₙ,N(f(x)).
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. Hₙ,N,L⁻¹(g)(x)=Eₙ,N⁻¹(g(x)) for every g:L→Qₙ⊗_Â N.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. Assume p is finitely generated. Hₙ,N,L⁻¹(Hₙ,N,L(f))=f for every Qₙ-linear f:L→Qₙ⊗_A N.

**Checks.**

- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, Hₙ,N,L sends the zero linear map to zero.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, every actual Qₙ-linear map is recovered by the inverse after postcomposition.
- Under coefficient convention C4. For arbitrary Â-module N equip N with its restricted A-action; require the actual scalar tower A→Â→N. Neither flatness nor finite generation of N is assumed, and its action need not factor through Bₙ. With p finitely generated, specialize L=Qₙ⊗_R J for the actual section ideal J=(X−s,Y−t). For every f and x, H(f)(x)=E(f(x)). This is an actual module input, not a placeholder hull.

([knudsen2](#references), Appendix, Definition 1 and Theorem 2, printed pp. 191–193, set up the completed coefficient rings and modules used here; the statement itself is a consequence of the definitions and of the cited targets.)

*Needs:* [finite two-base tensor equivalence](#2113-finite-two-base-tensor-equivalence), `LinearEquiv.congrRight`.

### 2.130 Ordinary completed tensor projection

Under coefficient convention C5. Construct ρₙ:R̂⊗_Â N→ₗ[Â]G(n) as eₙ⊗id_N.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Right-tensor the actual completed-coefficient-linear evaluation; use the G object.

The construction has the following API.

- For u∈R̂ and z∈N, ρₙ(u⊗z)=evalₙ(u)⊗z over Â.
- For x∈R̂⊗_Â N and k∈Fin(r), cₙ(ρₙx)(k)=eₙ(ĉ(x)(k)), where ĉ is the pinned piScalarRight equivalence for R̂.
- For x,y∈R̂⊗_Â N, if ρₙ(x)=ρₙ(y) for every n, then x=y.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂, Qₙ=(ℤ/2ⁿ)[u,v]/(u²) and `σ=Σ_{k≥0}2^k v^k∈R̂` and N=ℤ₂, `ρ₃(σ⊗1)=(1+2v+4v²)⊗1` and `ρ₂(σ⊗1)=(1+2v)⊗1`; evaluation modulo m instead of mⁿ would give 1⊗1.
- In the same fixture ρ₃(σ⊗(1/3))=(3+6v+4v²)⊗1, using Â-balancing of the tensor over Â.
- The level-zero projection is the zero map, since Q₀=0.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `TensorProduct`.

### 2.131 Ordinary completed tensor projections

Under coefficient convention C1. Construct P_N,n=eₙ⊗id_N:R̂⊗_Â N→ₗ[Â]Qₙ⊗_Â N using the actual completed-chart evaluation.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; no flatness of N is assumed.

One proof uses the following inputs and comparisons. Apply native LinearMap.rTensor to the Â-algebra evaluation; no finiteness is needed.

The construction has the following API.

- Under coefficient convention C1. For u∈R̂ and z∈N, P_N,n(u⊗z)=evalₙ(u)⊗z.
- Under coefficient convention C1. For every compatible Â-module K and Â-linear f:N→K, P_K,n∘(id_R̂⊗f)=(id_Qₙ⊗f)∘P_N,n.
- Under coefficient convention C1. For every n, P_N,n(0)=0.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With N=ℤ₂², P_N,2(σ⊗(1,1/3)) is (1+2v,3+2v) in `Q₂⊗_{ℤ₂}ℤ₂²≅Q₂²`, since 3(1+2v)=3+6v≡3+2v modulo 4.
- In the same fixture with N=ℚ₂ every target `Qₙ⊗_{ℤ₂}ℚ₂` is 0, so every projection is zero although 1⊗1≠0 in `R̂⊗_{ℤ₂}ℚ₂=R̂[1/2]`. Joint injectivity of the projections needs the finiteness hypotheses of the limit statements.
- For f the multiplication by 2 on N=ℤ₂, both composites send σ⊗1 to 2+4v≡2 in Q₂.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `TensorProduct`.

### 2.132 Cokernel presentation of the section dual

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct eD:coker Φ≃ₗ[R]D with d eD([z₀,z₁])(j)=(d z₀−b z₁)j; equivalently [z]↦z₀ incl−z₁ ε.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Use the established kernel equality to transport the native quotient by the matrix range to the quotient by the presentation kernel. Apply the pinned first isomorphism theorem to the actual surjective presentation map. Its representative formula gives the prescribed comparison. Multiply evaluations by d and use dε(j)=bj to obtain the denominator-free formula.

The LEFT matrix has cokernel D; its second basis class represents −ε.

The construction has the following API.

- The denominator-free evaluation formula specifies the equivalence.
- [1,0] acts as inclusion and [0,1] as −ε.
- Two equivalences with the displayed evaluation formula agree by regularity of d.

**Checks.**

- [1,0] evaluates on d to d.
- [0,1] evaluates on d to −b.
- Over Z/3 with γ=1 and δ=s=t=0, the actually constructed dual cokernel equivalence sends its second basis class to −ε.
- The actual dual cokernel equivalence exists over Z/2 with γ=1 and δ=s=t=0.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), `Submodule.quotEquivOfEq`, `Submodule.quotEquivOfEq_mk`, `LinearMap.quotKerEquivOfSurjective`, `LinearMap.quotKerEquivOfSurjective_apply_mk`, [evaluation of the ordered dual presentation](#264-evaluation-of-the-ordered-dual-presentation), [the canonical dual-generator identity](#252-the-canonical-dual-generator-identity).

### 2.133 Natural coefficient base change of the section dual

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For every f:A→A′, the natural comparison A′⊗_A D≃ₗ[A′]D′ satisfies e(a′⊗h)(φ(j))=ι′a′φ(h(j)). It sends ε to ε′ and multiplication maps to multiplication maps; residue and K commute with coefficient mapping.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Identify the two sides with R′×A′ by the normal equivalences and ring base change. The relation d′φ(ε(j))=b′φ(j) and regularity of d′ identify the mapped generator with ε′. Exact monic division for P,Q commutes with coefficient mapping; hence φ(Kr)=K′φ(r). The correction formula proves compatibility with the scalar action of φ(r), and pure tensors specify the natural evaluation comparison.

The native canonical dual comparison, tensor action, R′-linearity, identity/composition and quotient comparison are separate statements. No completed-local or global sheaf conclusion follows.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [coefficient base change of the section ideal](#290-coefficient-base-change-of-the-section-ideal), [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [scalar correction in dual coordinates](#2107-scalar-correction-in-dual-coordinates), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), `TensorProduct.lift`.

### 2.134 Coefficient naturality of dual scalar correction

Under coefficient convention C9. If K:R→R and K′:R′→R′ are the coefficient-linear corrections dK(r)=b(r−ιev(r)) and d′K′(r′)=b′(r′−ι′ev′(r′)), then φ(K(r))=K′(φ(r)) for every r.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Apply φ to the defining correction equation; naturality of evaluation changes its right side into the primed correction right side. Subtract the primed equation at φ(r); regularity of d′ forces equality. No injectivity of φ or flatness of f is used. The native proof applies the existing target-coordinate regularity to the two characterized corrections. The named canonical specialization is also proved by the two actual ideal-valued naturality lemmas. Neither proof uses the unproved dual tensor equivalence.

Taking r=d gives φ(b)=b′; taking r=c gives φ(−a)=−a′.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [scalar correction in dual coordinates](#2107-scalar-correction-in-dual-coordinates), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), [naturality of section evaluation](#271-naturality-of-section-evaluation), [the canonical correction identity](#2122-the-canonical-correction-identity).

### 2.135 Completion of the polynomial section dual

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A. Construct Ê_D:AdicCompletion I D≃_C Hom_C(J·C,C), characterized by Ê_D(b·of (h))=E_D(b⊗h).

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A.

One proof uses the following inputs and comparisons. J is a finite R-module. For noetherian R, the pinned isNoetherian_linearMap theorem makes D=Hom_R(J,R) noetherian. Apply Module.Finite.of_injective to its identity map to obtain finiteness. Use the actual module-completion equivalence C⊗D≃AdicCompletion I D, and its inverse. Compose that inverse with E_D at B=C; the pinned completion-flatness instance supplies the ambient hypothesis. Check the canonical map of (h) and C-multiples thereof.

Noetherianity is required here; the earlier polynomial calculations did not require it. I need not lie in the Jacobson radical for this equivalence. This is not Knudsen Proposition 6.

The construction has the following API.

- Ê_D on actual AdicCompletion I D and actual Hom_C(J·C,C).
- Ê_D(of (h))=E_D(1⊗h).
- Ê_D(b·of (h))=E_D(b⊗h).

**Checks.**

- Ê_D(of (m(r)))=m_C(φ(r)), retaining the multiplication map.
- With I=(2,u,v) in the fixture A=ℤ, γ=δ=s=t=0, so that C=ℤ₂[[u,v]]/(u²): Ê_D(of(ε))(E_J(1⊗v))=φ(ε(v))=u and Ê_D(of(ε))(E_J(1⊗u))=0, whereas Ê_D(of (m(u)))=m_C(u) sends E_J(1⊗v) to uv≠u; the completed equivalence distinguishes ε from every multiplication map.
- Ê_D(of (h))(E_J(1⊗j))=φ(h(j)).

([stacks-completion](#references), Stacks §10.97, Lemmas 10.97.1(3),10.97.2(1),10.97.3; [stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [dual of the extended section ideal](#2121-dual-of-the-extended-section-ideal), `AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian_apply`, `isNoetherian_linearMap`, `Module.Finite.of_injective`.

### 2.136 The twisted correction product

For all r,z∈R, K(rz)=rK(z)+ι(ev(z))K(r).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Multiply both sides by d and use the correction identity at rz,z,r. The two native ring maps ev and ι preserve products. Ring normalization and cancellation of d prove the displayed orientation.

Use the existing untruncated polynomial quotient, native coefficient algebra and actual coordinate ideal. Include zero and nonreduced coefficient rings.

([knudsen2012](#references), §3 Key Example, full Proposition 3.1 and Corollary 3.2 proofs, printed pp. 11–12.)

*Needs:* [the canonical correction identity](#2122-the-canonical-correction-identity), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.137 Correction of the ring action on the dual generator

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. If dε(j)=bj and dK(z)=b(z−ιev(z)), then (z−ιev(z))ε(j)=K(z)j.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Multiply both sides by d; the two given formulas make them equal by commutativity. Cancel the proved regular d.

Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.)

*Needs:* [denominator-free dual generator](#240-denominator-free-dual-generator), [the canonical correction identity](#2122-the-canonical-correction-identity), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate).

### 2.138 Tensor exactness of the dual presentation

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(P_D)=im T_M(Φ).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. The actual native presentation is surjective with the stated matrix kernel. Apply pinned tensor right exactness without assuming M flat.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), `LinearMap.exact_iff`, `lTensor_exact`.

### 2.139 The tensorized dual cokernel

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the A-linear equivalence E_D^M:coker T_M(Φ)≃M⊗_A D characterized by E_D^M([z])=T_M(P_D)(z).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Apply the pinned right-exact tensor quotient equivalence to the actual ordered presentation and its verified kernel. The domain is the actual quotient by the image of the tensorized matrix and the codomain is the actual tensor of D, with their inherited coefficient structures.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

The construction has the following API.

- E_D^M([z])=T_M(P_D)(z) for every tensor z, including sums of pure tensors.
- E_D^M([m⊗z])=m⊗P_D(z).
- E_D^M⁻¹(T_M(P_D)(z))=[z].
- Any A-linear equivalence e:coker T_M(Φ)≃M⊗_A D with e([z])=T_M(P_D)(z) for every tensor z equals E_D^M.

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u, and M=ℤ/2, E_D^M sends the class of 1⊗(0,1) to −1⊗ε=1⊗ε and the class of 1⊗Φ(0,1)=1⊗(u,v) to 1⊗(u·incl−vε)=0.
- In the same fixture 1⊗Ψ(1,0)=1⊗(v,u) maps to 1⊗(v·incl−uε), which is nonzero since v·incl−uε takes the value v² at v and D is A-free; Ψ is not the presenting matrix of D.
- Over the zero ring both sides are zero and E_D^M is the unique map.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), `LinearMap.exact_iff`, `lTensor.equiv`.

### 2.140 Exactness of right then left Hom precomposition

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The native R-linear maps L_Ψ then L_Φ form an exact pair for every coefficient module M.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Reuse coefficient-universal exactness of Ψ-transpose then Φ-transpose. Use right-tensor exactness and the same actual E coordinate ladder in the reversed order.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose), [coefficient universal exactness at φᵀ](#2124-coefficient-universal-exactness-at-φᵀ).)

*Needs:* [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose), [coefficient universal exactness at φᵀ](#2124-coefficient-universal-exactness-at-φᵀ), `LinearMap.rTensor_exact_iff_lTensor_exact`, `Function.Exact.of_ladder_linearEquiv_of_exact`, `LinearMap.restrictScalars`.

### 2.141 Degree-zero cycles factor through the section dual

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Precomposition by the actual P_D: R²→D followed by d(true,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_D for R-linear f:D→N; precomposition is injective because P_D is surjective.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Reuse the existing exact presentation Φ→R²→D and its actual surjectivity. Apply native left exactness of R-linear Hom into N; no coefficient flatness is needed.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [the polynomial section Hom differential](#29-the-polynomial-section-hom-differential), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation).)

*Needs:* [the polynomial section Hom differential](#29-the-polynomial-section-hom-differential), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), `LinearMap.exact_lcomp_of_exact_of_surjective`, `LinearMap.exact_iff`, `LinearMap.lcomp_injective_of_surjective`.

### 2.142 The section chain differential squares to zero

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n)∘B(e,n+1)=0 as R-linear maps.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Apply the native zero-composite theorem to the exact pair.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [exactness of consecutive section chain maps](#2125-exactness-of-consecutive-section-chain-maps).)

*Needs:* [exactness of consecutive section chain maps](#2125-exactness-of-consecutive-section-chain-maps), `Function.Exact.linearMap_comp_eq_zero`.

### 2.143 The native polynomial section chain complex

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Construct C(e) as a native ℕ-indexed ChainComplex of ModuleCat R with its actual successor maps.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Bundle F and each actual B(e,n); prove the square-zero equation.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- For every e,n, C(e).X n is the native object ModuleCat.of R F.
- For every e,n, C(e).d(n+1,n)=ModuleCat.ofHom(B(e,n)).
- C(e).d(i,j)=0 whenever j+1≠i; there is no upward differential or negative degree.
- Every C(e).X n is a projective object of ModuleCat R.
- For every e,n, the native module underlying C(e).X n has both Module.Free R and Module.Finite R instances; it is the actual F=Fin 2→R.
- For every A-module M, every phase e and n≥0, native R-linear precomposition by the underlying C(e).d(n+1,n) equals exactly the section Hom differential d(e,n) of §2.9 on Hom_R(F,R⊗_A M). This fixes the actual coefficient cochain differential; it does not construct a categorical Hom-complex isomorphism or a native Ext comparison.

**Checks.**

- For A=Z/4 and γ=δ=t=0,s=1, C(false) is ExactAt 2.
- For A=ℤ, γ=δ=s=t=0 and M=ℤ, precomposition by C(false).d(1,0)=Ψ sends the coordinate functional h=(1,0)∈Hom_R(R²,R) to h∘Ψ=(d,−b)=(v,−u), the first row of Ψ, as d(false,0) of §2.9 prescribes; precomposition by Φ instead gives (a,b)=(0,u).
- C(e).X 0=R² is free of rank two over R, whereas J and D are not R-free: the chain terms are the presentations, not the augmentation targets.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the section chain differential squares to zero](#2142-the-section-chain-differential-squares-to-zero).)

*Needs:* [the section chain differential squares to zero](#2142-the-section-chain-differential-squares-to-zero), `ChainComplex.of`, `ModuleCat.of`, `ModuleCat.ofHom`.

### 2.144 The native augmentation to the actual section ideal

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Construct π_J:C(false)→single₀(J) as the native chain map whose degree-zero component is P_J.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Use the native chain-map equivalence with a map in degree zero annihilating d(1,0).

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- π_J.f 0=ModuleCat.ofHom(P_J), including the prescribed negative second generator.

**Checks.**

- π_J.f 0 sends (1,0) to the actual ideal generator c=u−ιs.
- π_J.f 0 sends (0,1) to −d=−(v−ιt), retaining the signed presentation.
- Every positive component π_J.f(n+1) is the zero morphism.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the section-ideal augmentation kills the first chain map](#2126-the-section-ideal-augmentation-kills-the-first-chain-map).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the section-ideal augmentation kills the first chain map](#2126-the-section-ideal-augmentation-kills-the-first-chain-map), `ChainComplex.toSingle₀Equiv`.

### 2.145 The native augmentation to the actual dual

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Construct π_D:C(true)→single₀(D) as the native chain map whose degree-zero component is P_D.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Use the native chain-map equivalence with a map in degree zero annihilating d(1,0).

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- π_D.f 0=ModuleCat.ofHom(P_D), including the prescribed negative ε generator.

**Checks.**

- π_D.f 0 sends (1,0) to the inclusion J→R.
- π_D.f 0 sends (0,1) to −ε, evaluated on each actual j∈J.
- Every positive component π_D.f(n+1) is the zero morphism.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the dual augmentation kills the first chain map](#2127-the-dual-augmentation-kills-the-first-chain-map).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the dual augmentation kills the first chain map](#2127-the-dual-augmentation-kills-the-first-chain-map), `ChainComplex.toSingle₀Equiv`.

### 2.146 Ordinary completed tensor cone

Under coefficient convention C1. Construct a native Cone G_N with point ModuleCat.of Â (R̂⊗_Â N) and components P_N,n.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; no flatness, finiteness or freeness of N is assumed. For N=Fin(r)→Â this is the cone whose components [finite-free coordinates of the completed tensor cone](#2148-finite-free-coordinates-of-the-completed-tensor-cone) identifies with the finite-free projections; no second cone is constructed there.

One proof uses the following inputs and comparisons. Use the actual quotient-transition/evaluation square on pure tensors to prove naturality.

The construction has the following API.

- Under coefficient convention C1. The n-component of this cone equals the actual map P_N,n; on u⊗z it is evalₙ(u)⊗z.
- Under coefficient convention C1. For j≤k, the k-component followed by G_N(k→j) equals the j-component.
- Under coefficient convention C1. For b∈Â and x∈R̂⊗_Â N, the n-component sends b·x to b times its value at x.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂, Qₙ=(ℤ/2ⁿ)[u,v]/(u²) and `σ=Σ_{k≥0}2^k v^k∈R̂`, and N=ℤ₂, the level-3 component sends σ⊗1 to (1+2v+4v²)⊗1, and the transition to level 2 carries this to (1+2v)⊗1, the level-2 component of σ⊗1; components evaluating modulo m instead of mⁿ would send σ⊗1 to 1⊗1 at every level.
- In the same fixture the components are Â-linear for completed scalars that are not in A: σ⊗(1/3)=(1/3)·(σ⊗1), and its level-3 component is (3+6v+4v²)⊗1 since 1/3≡3 modulo 8. In R̂⊗_ℤ ℤ₂ the elements σ⊗(1/3) and (1/3)σ⊗1 differ, so a cone built on the tensor product over A instead of Â would not have this value forced.
- For the non-free coefficient module N=ℤ₂/(4) in the same fixture, Qₙ⊗_Â N=Qₙ/4Qₙ is 𝔽₂[u,v]/(u²) at level 1 and (ℤ/4)[u,v]/(u²) at every level n≥2; the level-1 component sends 1⊗1̄ to 1⊗1̄≠0, and for every n≥2 the n-component sends σ⊗1̄ to (1+2v)⊗1̄, because 2ᵏvᵏ⊗1̄=vᵏ⊗2ᵏ·1̄=0 for k≥2. A construction restricted to free N has no component here, and one that recorded the level-n truncation 1+2v+⋯+2ⁿ⁻¹vⁿ⁻¹ of σ in Qₙ instead of its image in Qₙ⊗_Â N would not see that the components stabilise from level 2 on.
- For N=ℚ₂ in the same fixture every Qₙ⊗_Â N is zero, so every component is zero although the point R̂⊗_Â ℚ₂=R̂[1/2] is not; a definition asserting joint injectivity of the components for arbitrary N would be false, which is why the limit statements of this layer require N finite projective.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), `TensorProduct`.

### 2.147 Completed coordinate of a cone lift

Under coefficient convention C5. For any actual cone C over G, x∈C.pt and k∈Fin(r), assemble the quotient family n↦cₙ(C.πₙ(x))(k) into an element of R̂.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Derive quotient coherence from C's native naturality and cₙ's transition equation, then apply the actual chart family assembly.

The construction has the following API.

- For every C,x,k,n, evalₙ(the lift coordinate(C,x,k))=cₙ(C.πₙ(x))(k).
- The coordinate lift sends the zero cone element to zero in R̂.
- For the ordinary cone itself, the lift coordinate of u⊗z is exactly z(k)·u.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With r=2 and the ordinary cone, the two coordinates of σ⊗(1,1/3) lift to σ and (1/3)σ, with level-2 quotients 1+2v and 3+2v.
- For x=u⊗(0,1) the first coordinate lifts to 0 and the second to u. A lift that ignored the index k would give equal coordinates.
- For the cone with point ℤ₂ and legs `a↦a(1+2v+⋯+2^{n−1}v^{n−1})⊗(1,0)`, the first coordinate of 1 lifts to σ and the second to 0.

(Deduction using `TensorProduct.piScalarRightHom_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, line 140. The construction-specific inputs are [assembly of completed-chart quotient families](#2116-assembly-of-completed-chart-quotient-families), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite-free quotient tensor coordinates](#2117-finite-free-quotient-tensor-coordinates), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), [assembly of completed-chart quotient families](#2116-assembly-of-completed-chart-quotient-families), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite-free quotient tensor coordinates](#2117-finite-free-quotient-tensor-coordinates), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `TensorProduct`.

### 2.148 Finite-free coordinates of the completed tensor cone

Under coefficient convention C5. Identify the components of the cone of [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone) at N=Fin(r)→Â, with its restricted A-action and the scalar tower A→Â→N, with the projections ρₙ of [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection), and compute them in the coordinates cₙ of [finite-free quotient tensor coordinates](#2117-finite-free-quotient-tensor-coordinates).

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p. This target constructs no cone: the cone is that of §2.146, and only the finite-free identification and coordinate formula are added.

One proof uses the following inputs and comparisons. Both P_N,n and ρₙ are eₙ⊗id_N, so the components agree by construction; prove the coordinate formula on pure tensors from the quotient evaluation coherence of cₙ and extend by tensor induction.

The construction has the following API.

- For u∈R̂ and z∈N, the n-component sends u⊗z to evalₙ(u)⊗z over Â, and equals ρₙ.
- For x∈R̂⊗_Â N and k∈Fin(r), cₙ(ρₙx)(k)=eₙ(ĉ(x)(k)), where ĉ is the pinned piScalarRight equivalence for R̂.
- The n-th native cone morphism is exactly ModuleCat.ofHom(ρₙ), with the actual ordinary tensor point.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²), with `σ=Σ_{k≥0}2^k v^k∈R̂`, r=2 and x=σ⊗(1,1/3): ĉ(x)=(σ,(1/3)σ), and at level 2 the two coordinates of ρ₂(x) are 1+2v and 3+2v, since 1/3≡3 modulo 4; a formula that ignored the index k would give equal coordinates.
- For x=u⊗(0,1) with r=2 the coordinates at every level n≥1 are 0 and the class of u in Qₙ, which is nonzero since u≠0 in Q₁=𝔽₂[u,v]/(u²); a coordinate formula valued in Â instead of in Qₙ could not record u.
- With r=1 the formula reduces to the identification Qₙ⊗_Â Â≅Qₙ: the single coordinate of ρ₃(σ⊗1) is 1+2v+4v²=e₃(σ); a coordinate read after the transition to level 2 would give 1+2v. With r=0 the point R̂⊗_Â 0 is zero and there are no coordinates.

(Deduction using `TensorProduct.piScalarRightHom_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, line 140, and `TensorProduct.map_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, line 59. The construction-specific inputs are [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection), [finite-free quotient tensor coordinates](#2117-finite-free-quotient-tensor-coordinates), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection), [finite-free quotient tensor coordinates](#2117-finite-free-quotient-tensor-coordinates), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), `AdicCompletion`, `AdicCompletion.evalₐ`, `ModuleCat.ofHom`, `TensorProduct.piScalarRight`.

### 2.149 Original-ring scalar in tensor evaluations

Under coefficient convention C2. For r∈R and x∈T, Pₙ(r·x)=r·Pₙ(x), using the actual R-actions.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is arbitrary: no finiteness, projectivity or flatness of N is used. No noetherian, local, discriminant or finiteness-over-A hypothesis.

One proof uses the following inputs and comparisons. Use tensor induction and R-linearity of the native algebra evaluation evalₙ:R̂→Qₙ.

(The construction-specific inputs are [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation).)

*Needs:* [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), `AdicCompletion.evalₐ`, `TensorProduct.leftModule`.

### 2.150 Node-ring action on the dual coordinates

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For normal coordinates (r,α) of h and the unique scalar correction K:R→R with dK(r)=b(r−ι(ev r)), the coordinates of z·h are (zr+ια K(z), (ev z)α).

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Expand h in the inverse equivalence formula and use the separate generator-action correction. The injective inverse equivalence identifies the resulting pair (zr+ιαK(z),ev(z)α). This argument does not assume the residue theorem.

The correction term rules out a componentwise R action.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [correction of the ring action on the dual generator](#2137-correction-of-the-ring-action-on-the-dual-generator).

### 2.151 Canonical tensor comparison for the section dual

Under coefficient convention C9. Construct the canonical A′-linear equivalence E_D:A′⊗_A D≃D′ characterized by E_D(a′⊗h)(φ(j))=ι′a′φ(h(j)). It is identity-compatible and composition-compatible under the canonical heterobasic base-change cancellation a″⊗(a′⊗h)↦a″g(a′)⊗h: for g:A′→A″, `E_{D,g}(a″⊗E_{D,f}(a′⊗h))=E_{D,gf}(a″g(a′)⊗h)`.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Identify the mapped-polynomial quotient in the existing tensor theorem with R′ by coefficientwise mapping of the explicit polynomial; transport the ideal and dual through that equality. Pure-tensor evaluation determines the dual map because φ(c),φ(d) generate J′ as an R′-ideal; do not assume φ(J) is all of J′ as a set. For the identity, compare evaluations on c,d. For composition, evaluate the two nested maps on φ_gφ_f(c),φ_gφ_f(d), and use coefficient-map composition. Use the baseline heterobasic base-change cancellation `A″⊗_{A′}(A′⊗_A D)≃A″⊗_A D`, sending a″⊗(a′⊗h) to a″g(a′)⊗h. Tensor generation extends the displayed formula to the full comparison square.

For f:ℤ→F₂ and γ=1,δ=s=t=0 the equivalence exists although F₂ is not flat over ℤ.

The construction has the following API.

- E_D(a′⊗h)(φ(j))=ι′a′φ(h(j)).
- `E_{D,id}(a⊗h)=a·h`.
- `E_{D,g}(a″⊗E_{D,f}(a′⊗h))=E_{D,gf}(a″g(a′)⊗h)` under the canonical heterobasic base-change cancellation.
- E_D(a′⊗(r·h))=φ(r)·E_D(a′⊗h). This is the pure-tensor case of the R-linearity of E_D.

**Checks.**

- For identity coefficients, E_D(a⊗h)=a·h.
- `E_{D,g}(1⊗E_{D,f}(1⊗h))=E_{D,gf}(1⊗h)`.
- For γ=1,δ=s=t=0, F₂ is not ℤ-flat but F₂⊗_ℤ D_ℤ≃D_F₂.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [natural coefficient base change of the section dual](#2133-natural-coefficient-base-change-of-the-section-dual), [coefficient map of pointed node rings](#214-coefficient-map-of-pointed-node-rings), [coefficient base change of the section ideal](#290-coefficient-base-change-of-the-section-ideal), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), `TensorProduct.AlgebraTensorModule.cancelBaseChange`.

### 2.152 Generators of the dual cokernel

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. For any characterized ε and any e_D with d e_D([z])(j)=(dz₀−bz₁)j, the first basis class is inclusion and the second is −ε.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Substitute the two basis vectors. Multiply the target evaluations by d; use the formula for ε and cancel d.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [cokernel presentation of the section dual](#2132-cokernel-presentation-of-the-section-dual), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.153 Uniqueness of the dual cokernel comparison

For every commutative ring A and γ,δ,s,t∈A, let F=X²+C(γY)X+C(δY²−q(s,t)), q(x,y)=x²+γxy+δy², R=AdjoinRoot(F), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), and E:R≃A[Y]×A[Y] the ordered polynomial coordinates. Put Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)). The canonical ε∈D is characterized by dε(j)=bj. The ordered maps are P_J(z)=cz₀−dz₁ and P_D(z)=z₀·incl−z₁·ε. Any two R-linear cokernel equivalences satisfying the prescribed denominator-free evaluation formula agree.

Here A may be the zero ring or have nilpotents. No noetherianity, domain or unit-discriminant assumption is made for this polynomial algebra statement.

One proof uses the following inputs and comparisons. Apply quotient induction and pointwise dual extensionality. Their evaluations have equal multiples by d, so regularity gives equality.

Use the actual polynomial quotient and the stated ordered matrices; an arbitrary receiving ring with specialized coordinates does not satisfy this contract. Preserve the sign of the second cokernel generator. No conclusion about completion, Hom/Ext exchange or moduli geometry follows.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12, matrix and κ/λ comparisons and Proposition 3.1 proof.)

*Needs:* [cokernel presentation of the section dual](#2132-cokernel-presentation-of-the-section-dual), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), `Submodule.Quotient.induction_on`.

### 2.154 Ordinary reflexivity of the section ideal

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The actual ideal J satisfies Module.IsReflexive R J, with its native bidual evaluation map.

The headline `pointedSection_reflexive` states canonical reflexivity of J over every commutative A, including the zero ring. Reflexivity of the actual R-linear dual D then follows from the Mathlib instance `Module.instIsReflexiveDual` and needs no separate statement.

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. The explicit two-sided inverse makes native evaluation bijective, exactly the field required by Module.IsReflexive.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

**Checks.**

- For A=Z/4 and γ=δ=s=t=0, the actual ideal J is reflexive over R; no reducedness or unit discriminant is used.
- For A=Z/1 and γ=δ=s=t=0, native Module.IsReflexive R J still holds.
- The Mathlib instance making the dual of a reflexive module reflexive (Mathlib/LinearAlgebra/Dual/Defs.lean, line 263) gives reflexivity of D from that of J; reflexivity of D is not a separate computation.

([knudsen2012](#references), §3 Key Example, multiplication description of J∨ and Proposition 3.1; compare Corollary 3.2 and §4.)

*Needs:* [inverse of section bidual evaluation](#299-inverse-of-section-bidual-evaluation), `Module.IsReflexive`, `Module.instIsReflexiveDual`.

### 2.155 Injectivity of the dual coefficient-Hom map

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The actual R-linear map θ_D,M is injective for every coefficient module M.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. By tensor surjectivity of P_D, write a difference tensor as U_M(P_D)z. If its θ_D image vanishes, the coordinate-presentation formula and invertibility of U_M(p) give U_M(Ψ)z=0. Use the listed coefficient-universal exactness, transported through native tensor commutation, to write z in im U_M(Φ). The tensor presentation exactness then gives U_M(P_D)z=0.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

**Checks.**

- Both comparisons apply over the nonreduced coefficient ring Z/4; for the dual take M=Z/4 and all parameters zero.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ideal Hom coordinates with coefficients](#231-ideal-hom-coordinates-with-coefficients), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), [coefficient universal exactness at ψ](#2111-coefficient-universal-exactness-at-ψ), [tensor exactness of the dual presentation](#2138-tensor-exactness-of-the-dual-presentation), [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates).)

*Needs:* [ideal Hom coordinates with coefficients](#231-ideal-hom-coordinates-with-coefficients), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), [coefficient universal exactness at ψ](#2111-coefficient-universal-exactness-at-ψ), [tensor exactness of the dual presentation](#2138-tensor-exactness-of-the-dual-presentation), `LinearMap.rTensor_surjective`, `LinearMap.rTensor_exact_iff_lTensor_exact`, [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates), `LinearEquiv.rTensor`.

### 2.156 Surjectivity of coefficient-valued bidual evaluation

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M is surjective for every A-module M.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Coordinates y=C_D,M(h) lie in ker U_M(Φᵀ); universal transpose exactness supplies w with U_M(Ψᵀ)w=y. Use the right-tensor rotation identity and coordinate-presentation formula to obtain θ_J,M(U_M(P_J)(U_M(p)⁻¹w))=h, then cancel C_D,M.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [dual Hom coordinates with coefficients](#267-dual-hom-coordinates-with-coefficients), [right-tensor rotation of the second transpose](#247-right-tensor-rotation-of-the-second-transpose), [coefficient universal exactness at φᵀ](#2124-coefficient-universal-exactness-at-φᵀ).)

*Needs:* [dual Hom coordinates with coefficients](#267-dual-hom-coordinates-with-coefficients), [right-tensor rotation of the second transpose](#247-right-tensor-rotation-of-the-second-transpose), [coefficient universal exactness at φᵀ](#2124-coefficient-universal-exactness-at-φᵀ), `LinearMap.rTensor_exact_iff_lTensor_exact`.

### 2.157 Natural two-base finite tensor comparison

Under coefficient convention C6. Assume p finitely generated. Construct the actual native natural isomorphism E_N:Fᴬ_N≅FÂ_N with component at n the inherited Qₙ-linear finite tensor equivalence Eₙ,N as an A-linear isomorphism to the actual native restricted object. Verify A-linearity of both maps through the scalar tower; do not assume the two tensor actions are definitionally identical. Prove naturality for every inequality i≤j, including its inverse.

Here N is arbitrary: no finite generation, flatness or quotient-annihilation hypothesis on N. No noetherianity, localness, discriminant or regular-sequence assumption is used. p is finitely generated.

One proof uses the following inputs and comparisons. Build the actual forward and inverse ModuleCat morphisms from the finite Qₙ-linear equivalence. Check their A-linearity on pure tensors using the actual A→Â→Qₙ scalar tower, then native tensor induction. Both inverse equations are those of the finite equivalence. Specialize the all-quotient-transition equation to every arrow of ℕᵒᵖ; use native NatIso.ofComponents. Inverse naturality follows from the actual inverse, without an unproved compatibility field.

Use actual native modules, quotient transition maps, functors, natural isomorphisms and limits. Retain every quotient-transition direction and the actual inherited/restricted scalar action. The two-base ordinary completion, stable-reflexivity, pointed hull and family/stack conclusions retain their exact independent inputs.

The construction has the following API.

- Assume p finitely generated. The forward component at n sends q⊗_A z to the same pure tensor q⊗_Â z.
- Assume p finitely generated. The inverse component at n sends q⊗_Â z to q⊗_A z.
- Assume p finitely generated. For every i≤j, τᴬᵢⱼ followed by Eᵢ equals Eⱼ followed by τÂᵢⱼ.
- Assume p finitely generated. The inverse components commute with every quotient transition.
- Assume p finitely generated. The left component roundtrip at n is the identity.
- Assume p finitely generated. The right component roundtrip at n is the identity.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2), finitely generated, and m=2R, so Qₙ=(ℤ/2ⁿ)[u,v]/(u²). With N=ℤ₂ at n=2, 1⊗_ℤ(1/3) equals 3⊗_ℤ1 in Q₂⊗_ℤℤ₂ although 1/3∉ℤ, and the forward component sends it to `1⊗_{ℤ₂}(1/3)=3` in `Q₂⊗_{ℤ₂}ℤ₂≅Q₂`.
- In the same fixture with N=ℚ₂ both diagrams are zero at every level, so every component is the zero isomorphism.
- Starting at level 3 with (u+7)⊗_ℤ1, the transition to level 2 followed by E₂, and E₃ followed by the transition, both give u+3 in Q₂.

(The construction-specific inputs are [finite tensor diagram over the original base](#2102-finite-tensor-diagram-over-the-original-base), [finite tensor diagram over the completed base](#2103-finite-tensor-diagram-over-the-completed-base), [finite two-base tensor equivalence](#2113-finite-two-base-tensor-equivalence), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [finite tensor diagram over the original base](#2102-finite-tensor-diagram-over-the-original-base), [finite tensor diagram over the completed base](#2103-finite-tensor-diagram-over-the-completed-base), [finite two-base tensor equivalence](#2113-finite-two-base-tensor-equivalence), [finite nodal coefficient algebra](#249-finite-nodal-coefficient-algebra), `CategoryTheory.NatIso.ofComponents`, `ModuleCat.restrictScalars`, `ModuleCat.hom_injective`, `TensorProduct.induction_on`, `DFunLike.ext`, `TensorProduct.smul_tmul'`, `IsScalarTower.algebraMap_smul`.

### 2.158 Ring-linear finite tensor projection

Under coefficient convention C2. Package Pₙ as an actual R-linear map T→Qₙ⊗_Â N, before imposing finiteness on N.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is arbitrary: no finiteness, projectivity or flatness of N is used. No noetherian, local, discriminant or finiteness-over-A hypothesis.

One proof uses the following inputs and comparisons. Retain the evaluation function and additive law, and prove the preceding R-scalar law.

The construction has the following API.

- Under coefficient convention C2. For u∈R̂ and z∈N, Pₙ(u⊗z)=evalₙ(u)⊗z, also in its R-linear packaging.
- Under coefficient convention C2. For a∈Â and x∈T, the R-linear packaged Pₙ satisfies Pₙ(a·x)=a·Pₙ(x).
- Under coefficient convention C2. Pₙ(0)=0 in Qₙ⊗_Â N.

**Checks.**

- Under coefficient convention C2. At every n the ring-linear projection takes u⊗z to evalₙ(u)⊗z.
- Under coefficient convention C2. At every n it respects the original R-action on the actual tensor carriers.
- Under coefficient convention C2. At every n it also respects the distinct completed Â-action.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [original-ring scalar in tensor evaluations](#2149-original-ring-scalar-in-tensor-evaluations).)

*Needs:* [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [original-ring scalar in tensor evaluations](#2149-original-ring-scalar-in-tensor-evaluations), `TensorProduct`.

### 2.159 Residue of the section dual

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct the A-linear residue ρ:D→A as the second normal coordinate. It is surjective, ρ(ε)=1, and ker ρ is exactly the image of injective multiplication R→D. Furthermore ρ(zh)=ev(z)ρ(h). Hence D/R≅A with the section action.

Here A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

One proof uses the following inputs and comparisons. Compose the normal equivalence with the native A-linear second projection. The pairs (0,α) prove surjectivity and ε has pair (0,1). The inverse formula identifies zero residue exactly with maps j↦rj. The separate actual multiplication construction is injective by regularity of d. Apply the independently derived correction/scalar-action formula to identify ρ(zh)=ev(z)ρ(h). For nonzero A, a purported R-linear splitting has dσ(1)=σ(ev(d))=σ(0)=0. Pointwise regularity forces σ(1)=0, contradicting its right inverse property.

For nonzero A, there is no R-linear section of ρ: d kills A but acts injectively on D.

The construction has the following API.

- ρ is surjective with the specified kernel and section action.
- Every characterized residue sends ε to 1.
- Every characterized residue kills multiplication maps j↦rj.
- The R-linear map m:R→D sends r to (j↦rj); its range is the submodule in the actual dual quotient.
- m(r)(j)=rj.

**Checks.**

- For nonzero A a right inverse σ of ρ cannot satisfy σ(ev(r)z)=r·σ(z) for all r,z.
- An actually constructed surjective A-linear residue sends the canonical native dual generator to 1, including the zero base.
- An actually constructed surjective A-linear residue kills m(r) for every r∈R.

([knudsen2012](#references), §3, printed pp. 11–12: monic division, κ/λ comparisons and proof of Proposition 3.1.)

*Needs:* [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [node-ring action on the dual coordinates](#2150-node-ring-action-on-the-dual-coordinates), [the canonical correction identity](#2122-the-canonical-correction-identity), [multiplication into the actual section dual](#243-multiplication-into-the-actual-section-dual), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), [kernel of section evaluation](#213-kernel-of-section-evaluation), `LinearMap.snd`.

### 2.160 Tensor-ring action on the section dual

Under coefficient convention C9. Equip A′⊗_A D with the canonical module structure over the actual tensor algebra T=A′⊗_A R, uniquely characterized by (a′⊗r)·(b′⊗h)=a′b′⊗(r·h). This specializes the existing module/tensor universal properties, and introduces no new abstract theory of tensor representations.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. The displayed product is additive and A-balanced separately in both pairs, using the coefficient scalar tower on D; extend it by the tensor universal property. Check unit, associativity and both distributivities on pure tensors and extend by tensor induction. In the normal coordinates of D, use r·(z,α)=(rz+ιαK(r),ev(r)α). This checks that the tensor action is not the componentwise action on R⊕A.

For r=d, d·ε=m(b), not zero. On a nonzero base monic normal form gives b≠0 and injectivity of m, so a componentwise action gives the wrong answer.

The construction has the following API.

- The native module structure on A′⊗_A D has scalar ring A′⊗_A R and the specified pure-tensor action.
- (a′⊗r)·(b′⊗h)=a′b′⊗(r·h).
- A module structure with the specified action on every pair of pure tensors equals the canonical tensor-ring action.

**Checks.**

- The action on two pure tensors is (a′b′)⊗(r·h).
- For f=id_A, (1⊗d)·(1⊗ε)=1⊗m(b).
- For the zero ring A, A⊗_A D has one element.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [node-ring action on the dual coordinates](#2150-node-ring-action-on-the-dual-coordinates), [algebraic tensor comparison for a pointed node](#280-algebraic-tensor-comparison-for-a-pointed-node), `TensorProduct.lift`, [the twisted correction product](#2136-the-twisted-correction-product).

### 2.161 Tensor inclusion of the left matrix image

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(im(Φ)↪R²) is injective; M need not be flat.

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. The actual surjection P_D has kernel im Φ and A-flat codomain D. Apply the pinned short-exact-sequence tensor-injection theorem with this cokernel.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), `LinearMap.lTensor_injective_of_exact_of_flat`.

### 2.162 Canonical section bidual equivalence

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Construct E:J≃ₗ[R]Hom_R(D,R) as native Module.evalEquiv R J using the proved ordinary reflexivity.

No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

One proof uses the following inputs and comparisons. Supply the proved native reflexivity instance and use the library evaluation equivalence.

Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

The construction has the following API.

- For every j∈J and h∈D, E(j)(h)=h(j).
- For every F∈Hom_R(D,R), E⁻¹(F)=ψ(F).
- The underlying linear map of E equals Module.Dual.eval R J.

**Checks.**

- E(⟨c,c∈J⟩)(ε)=−a.
- E(⟨d,d∈J⟩)(ε)=b.
- E(−⟨d,d∈J⟩)(ε)=−b; the sign agrees with the ordered dual presentation.
- For arbitrary F∈Hom_R(D,R), E(ψ(F))=F.

([knudsen2012](#references), §3 Key Example, multiplication description of J∨ and Proposition 3.1; compare Corollary 3.2 and §4.)

*Needs:* [ordinary reflexivity of the section ideal](#2154-ordinary-reflexivity-of-the-section-ideal), `Module.evalEquiv`, [denominator-free dual generator](#240-denominator-free-dual-generator).

### 2.163 Two-base inverse-limit tensor comparison

Under coefficient convention C6. Assume p finitely generated. Construct the actual native A-linear isomorphism Λ_N:lim Fᴬ_N≅lim FÂ_N from the natural isomorphism E_N. Its projections are Eₙ,N on the finite components, its inverse has components Eₙ,N⁻¹, and it carries every compatible cone to the transported cone. This identifies two limits of tensor products; no equality with an ordinary tensor product of a completed ring is asserted.

Here N is arbitrary: no finite generation, flatness or quotient-annihilation hypothesis on N. No noetherianity, localness, discriminant or regular-sequence assumption is used. p is finitely generated.

One proof uses the following inputs and comparisons. Use native ModuleCat limits and HasLimit.isoOfNatIso; do not construct another inverse-limit carrier. Specialize the native forward/inverse projection equations, cone-lift comparison and limit.hom_ext. The actual isomorphism gives both roundtrips.

Use actual native modules, quotient transition maps, functors, natural isomorphisms and limits. Retain every quotient-transition direction and the actual inherited/restricted scalar action. The two-base ordinary completion, stable-reflexivity, pointed hull and family/stack conclusions retain their exact independent inputs.

The construction has the following API.

- Assume p finitely generated. Projection at n after the limit comparison equals projection at n followed by Eₙ.
- Assume p finitely generated. Projection at n after the inverse limit comparison equals projection at n followed by Eₙ⁻¹.
- Assume p finitely generated. The left limit roundtrip is the identity.
- Assume p finitely generated. The right limit roundtrip is the identity.
- Assume p finitely generated. Any A-linear map between the two limits with all the prescribed finite-component equations equals the limit comparison.
- Assume p finitely generated. For every actual cone c to the A-tensor diagram, transport its legs by Eₙ; its universal lift to the limit of the completed-base tensor diagram is the old lift followed by the limit comparison.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2), finitely generated, and m=2R, so Qₙ=(ℤ/2ⁿ)[u,v]/(u²). With N=ℤ₂, the element of lim Fᴬ_N with components `(1+2v+⋯+2^{n−1}v^{n−1})⊗_ℤ1` goes to the element of lim FÂ_N whose level-3 projection is 1+2v+4v² in `Q₃⊗_{ℤ₂}ℤ₂≅Q₃`.
- With N=0 both limits are 0; with N=ℚ₂ both limits are 0 although N is not.
- A family with level-1 component 1⊗1 and level-2 component 0 is not compatible, since the transition from level 2 to level 1 sends 0 to 0≠1⊗1; it lies in neither limit.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95. The construction-specific inputs are [natural two-base finite tensor comparison](#2157-natural-two-base-finite-tensor-comparison).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [natural two-base finite tensor comparison](#2157-natural-two-base-finite-tensor-comparison), `ModuleCat.hasLimits`, `CategoryTheory.Limits.HasLimit.isoOfNatIso`.

### 2.164 Finite-free ordinary tensor cone lift

Under coefficient convention C5. For every Cone C over G, construct an actual Â-linear lift C.pt→R̂⊗_Â N by assembling all r coordinates and applying ĉ⁻¹.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Prove additivity and Â-linearity by native completion evaluation extensionality, the coordinate evaluation law, and actual cone projection linearity.

The construction has the following API.

- For every C,x,n, ρₙ(lift(C)(x))=C.πₙ(x).
- The actual finite-free lift sends zero to zero.
- The actual finite-free lift respects every completed coefficient scalar.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With r=1, the cone with point ℤ₂ and legs `a↦a(1+2v+⋯+2^{n−1}v^{n−1})⊗1` lifts to a↦aσ⊗1.
- The cone with all legs zero lifts to the zero map, even on a nonzero cone point; the cone with legs a↦a·uv⊗1 at every level lifts to a↦a·uv⊗1.
- In the first cone, the lift of 1/3 is (1/3)σ⊗1, whose level-2 image is 3+2v.

(Deduction using `TensorProduct.piScalarRight` and `TensorProduct.piScalarRight_symm_single` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean`, lines 163 and 176; tensor components use `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [completed coordinate of a cone lift](#2147-completed-coordinate-of-a-cone-lift), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [completed-chart coefficient-linear evaluation](#2115-completed-chart-coefficient-linear-evaluation), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [completed coordinate of a cone lift](#2147-completed-coordinate-of-a-cone-lift), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), `AdicCompletion`, `AdicCompletion.evalₐ`, `AdicCompletion.ext_evalₐ`, `RingHom`, `TensorProduct.piScalarRight`.

### 2.165 Separation by finite tensor projections

Under coefficient convention C1. If r∘i=id_N and P_N,n(x)=P_N,n(y) for every n, then x=y in R̂⊗_Â N.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis.

One proof uses the following inputs and comparisons. Embed x,y by id_R̂⊗i, use the finite-free projection extensionality, and retract by id_R̂⊗r. No flatness of R̂ or N is assumed.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [ordinary completed tensor projections](#2131-ordinary-completed-tensor-projections), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection), `TensorProduct`, `LinearMap.lTensor_comp_apply`, `LinearMap.lTensor_id_apply`.

### 2.166 Projection of actual relative Hom maps

Under coefficient convention C2. Construct C_L:Hom_R(L,T)→ₗ[Â]H_L by (C_L(f))ₙ=Pₙ∘f; finiteness of N is unnecessary for this map.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is arbitrary: no finiteness, projectivity or flatness of N is used. No noetherian, local, discriminant or finiteness-over-A hypothesis.

One proof uses the following inputs and comparisons. Compose with the actual R-linear projection; native tensor-cone naturality gives coherence, and the inherited Â-linearity gives additivity and scalar compatibility.

The construction has the following API.

- Under coefficient convention C2. For every f,n,x, (C_L(f))ₙ(x)=Pₙ(f(x)).
- Under coefficient convention C2. C_L(0)=0.
- Under coefficient convention C2. For a∈Â and f∈Hom_R(L,T), C_L(a·f)=a·C_L(f).

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2), m=2R and N=ℤ₂, with L=J and f=m(u):J→T, j↦uj⊗1: `(C_J(f))₂(v)=P₂(uv⊗1)=[uv]⊗1` in `Q₂⊗_{ℤ₂}ℤ₂` and `(C_J(f))₁(u)=P₁(u²⊗1)=0`.
- For a=1/3∈Â, (C_J((1/3)·f))₂(v)=(1/3)·([uv]⊗1)=[3uv]⊗1, since 1/3≡3 modulo 4, while (C_J(f))₂(v)=[uv]⊗1; the Â-action on the projected family is not through 1.
- The maps m(u) and m(v) have projected families that differ already at level 1: `(C_J(m(v)))₁(u)=[uv]⊗1≠0` in `𝔽₂[u,v]/(u²)⊗_{ℤ₂}ℤ₂` while `(C_J(m(u)))₁(u)=0`.

(Deduction using `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [compatible quotient hom families](#2119-compatible-quotient-hom-families), [ring-linear finite tensor projection](#2158-ring-linear-finite-tensor-projection), [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone).)

*Needs:* [compatible quotient hom families](#2119-compatible-quotient-hom-families), [ring-linear finite tensor projection](#2158-ring-linear-finite-tensor-projection), [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), `TensorProduct`.

### 2.167 Ring-linear tensor comparison for the section dual

Under coefficient convention C9. Transport the preceding T-module structure along E_R⁻¹:R′→T. Then E_D is an R′-linear equivalence for this action and the usual action on `Hom_{R′}(J′,R′)`. In particular E_D(a′⊗(r·h))=φ(r)·E_D(a′⊗h).

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. For pure scalars a′⊗r and pure vectors b′⊗h, compare evaluations on φ(c),φ(d); the natural formula gives ι′a′φ(r)·E_D(b′⊗h). Use tensor induction in scalar and vector to establish T-linearity. Equivalently the normal-coordinate calculation uses φK=K′φ and the non-diagonal correction term. Restrict the canonical T action through E_R⁻¹ using the baseline scalar restriction; the bijective map E_D is then R′-linear.

The R′ action is transported from the specified tensor-ring action, not defined by conjugating the desired E_D; linearity is a theorem rather than tautological by design.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [algebraic tensor comparison for a pointed node](#280-algebraic-tensor-comparison-for-a-pointed-node), [canonical tensor comparison for the section dual](#2151-canonical-tensor-comparison-for-the-section-dual), [tensor-ring action on the section dual](#2160-tensor-ring-action-on-the-section-dual), [coefficient naturality of dual scalar correction](#2134-coefficient-naturality-of-dual-scalar-correction), `Module.compHom`.

### 2.168 Residue equivalence for the actual dual quotient

Under coefficient convention C9. Form Q=D/im(m), using the image of the actual injective R-linear multiplication map m:R→D. Construct the canonical A-linear equivalence E_Q:Q≃A induced by ρ, normalized by E_Q([ε])=1. The inherited R action satisfies E_Q(r·z)=ev(r)E_Q(z).

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. The characterized residue kills precisely im(m), so descend it through the native quotient universal property. The inverse sends α to [ιαε]; the unique dual normal form proves both inverse identities. Transport the residue scalar equation to quotient representatives; every quotient element has a representative.

Q is the quotient by multiplication maps, not an arbitrary kernel or a second copy of A inserted by fiat. d kills Q although d acts injectively on D.

The construction has the following API.

- E_Q is the residue-induced equivalence Q≃A for Q=D/im(m).
- E_Q([ε])=1.
- E_Q(r·z)=ev(r)E_Q(z).

**Checks.**

- With γ=δ=s=t=0 over any A, the dual generator satisfies ε(u)=0 and ε(v)=u, so v·ε=m(u) and [v·ε]=0 in Q, while E_Q([(3+v)ε])=ev(3+v)=3, not 3+v; it also differs from −3 whenever 6≠0 in A, for example over ℤ.
- [m(r)]=0 in Q for every r∈R.
- d·z=0 for every z∈Q, whereas multiplication by d is injective on D.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [residue of the section dual](#2159-residue-of-the-section-dual), [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [regularity of the second section coordinate](#233-regularity-of-the-second-section-coordinate), `Submodule.liftQ`.

### 2.169 Multiplication maps under ambient transport

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). E_D(b⊗m(r))=m_B(bφ(r)). Consequently E_D carries the image of B⊗m onto im(m_B).

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B).

One proof uses the following inputs and comparisons. Evaluate both sides on E_J(b′⊗j), using E_D evaluation and m(r)(j)=rj. B-linearity and the pure-tensor spanning property give equality. Use the tensor unit B⊗R≃B to identify the full image, not only individual multiplication maps.

The quotient comparison uses this range equality; an abstract isomorphism D_B≃B⊕(B⊗A) is insufficient.

([stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [dual of the extended section ideal](#2121-dual-of-the-extended-section-ideal), [residue of the section dual](#2159-residue-of-the-section-dual).

### 2.170 Coefficient universal exactness at Φ

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Φ)=im T_M(Ψ).

The headline `nodeSection_universallyExact` states both alternating exactness assertions and both transposed assertions after tensoring over A with an arbitrary A-module N, with no flatness, discriminant or Noetherian assumption. One route lifts a kernel vector to N[X,Y]². The lifted image is F times a vector, and subtracting the other matrix applied to that vector makes its image zero before quotient. Multiplication by the monic F is injective on N[Y][X], so the matrix product F·I cancels and the lifted vector lies in the required image. The same argument applies in both phases and to transposes. This proves the actual arbitrary-coefficient exactness, rather than inferring it after specialization to an arbitrary receiving ring. (knudsen2012 line 414, §3, pp. 11–12; the coefficient-module lift-and-cancel argument gives the stated extension.)

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Factor Φ through its actual image. The restricted corestriction is surjective and its preceding pair is exact. Pinned right exactness preserves that pair for arbitrary M. Postcompose with the proved tensor-image injection and use the native tensor composition law to recover T_M(Φ).

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

**Checks.**

- For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual left alternating tensor pair is exact.
- For A=Z/1 with zero parameters and M=Z/1, the actual left alternating tensor pair is exact.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [exactness at the left node matrix](#294-exactness-at-the-left-node-matrix), [tensor inclusion of the left matrix image](#2161-tensor-inclusion-of-the-left-matrix-image), `lTensor_exact`, `LinearMap.rangeRestrict`, `LinearMap.ker_rangeRestrict`, `LinearMap.surjective_rangeRestrict`, `LinearMap.subtype_comp_rangeRestrict`, `LinearMap.lTensor_comp`, `Function.Injective.comp_exact_iff_exact`.

### 2.171 Positive-degree exactness of the section chain

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. C(e) is natively ExactAt(n+1) for every e and n≥0.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Identify the actual associated short complex with B(e,n+1), B(e,n). Use the kernel/image exactness and native module exactness criterion.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [exactness of consecutive section chain maps](#2125-exactness-of-consecutive-section-chain-maps).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [exactness of consecutive section chain maps](#2125-exactness-of-consecutive-section-chain-maps), `HomologicalComplex.exactAt_iff'`, `CategoryTheory.ShortComplex.moduleCat_exact_iff`.

### 2.172 Two-base finite-tensor limit with completed target

Under coefficient convention C7. Assume p is finitely generated. Construct the A-linear isomorphism E:lim Fᴬ≅Res_A^Â(lim G), composing the finite-tensor limit isomorphism, the limit of ρ and the inverse native restriction-of-scalars limit comparison. Its target is the restriction of the actual Â-module limit.

Here N is arbitrary: no flatness, finite generation or annihilation hypothesis on the finite quotients. No noetherianity, localness, discriminant or regular-sequence hypothesis. p is finitely generated, exactly as required by the finite tensor equivalence.

One proof uses the following inputs and comparisons. Compose the actual finite-tensor limit isomorphism with the limit induced by the restriction natural isomorphism. Use the inverse native scalar-restriction comparison, whose preservation hypothesis is provided by ModuleCat.preservesLimit_restrictScalars for this countable diagram.

Use actual native tensor objects, scalar actions, quotient transitions and limit projections. Retain the ordinary two-base completion/stable-reflexivity theorem, faithful reflection, pointed hull, sheaf/family descent and arbitrary-base approximation as separate required work.

The construction has the following API.

- For every n, E followed by the restricted native projection π⁽ᴳ⁾ₙ equals the original projection π⁽ᴬ⁾ₙ followed by the finite tensor comparison αₙ.
- For every n, E⁻¹ followed by π⁽ᴬ⁾ₙ equals the restricted native projection π⁽ᴳ⁾ₙ followed by αₙ⁻¹.
- The composite E followed by E⁻¹ is the identity of the original A-linear limit.

**Checks.**

- Every forward finite-level projection is the prescribed finite tensor comparison.
- Every inverse finite-level projection is the prescribed inverse comparison.
- The composite E⁻¹ followed by E is the identity of Res_A^Â(lim G).

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95. The construction-specific inputs are [restriction of the native completed diagram](#2114-restriction-of-the-native-completed-diagram), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [two-base inverse-limit tensor comparison](#2163-two-base-inverse-limit-tensor-comparison).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [restriction of the native completed diagram](#2114-restriction-of-the-native-completed-diagram), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [two-base inverse-limit tensor comparison](#2163-two-base-inverse-limit-tensor-comparison), `CategoryTheory.Limits.HasLimit.isoOfNatIso`, `ModuleCat.preservesLimit_restrictScalars`, `CategoryTheory.preservesLimitIso`.

### 2.173 Retracting the finite-coordinate lift

Under coefficient convention C1. For any i:N→F and r:F→N, define L_i,r(c)=(id_R̂⊗r)∘L_F(c embedded by i):c.pt→ₗ[Â]R̂⊗_Â N. The formula exists before assuming r∘i=id.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis.

One proof uses the following inputs and comparisons. Use the finite-free native lift and native lTensor(r), with their actual Â-actions.

The construction has the following API.

- Under coefficient convention C1. If r∘i=id_N then P_N,n(L_i,r(c)(x))=cₙ(x) for every cone c, x and n.
- Under coefficient convention C1. For two splittings through Fin(r)→Â and Fin(r′)→Â, their lifts of the same cone agree pointwise, even if r≠r′.
- Under coefficient convention C1. For any displayed i,r and any cone c, L_i,r(c)(0)=0, before any splitting assumption.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂, Qₙ=(ℤ/2ⁿ)[u,v]/(u²) and `σ=Σ_{k≥0}2^k v^k∈R̂`, N=ℤ₂, F=ℤ₂², i(z)=(z,0) and r(x,y)=x, so r∘i=id; for the cone of the truncations of σ⊗1 the level-3 projection of the lift is (1+2v+4v²)⊗1.
- In the same fixture with i=0 and r=0, r∘i=0≠id and the lift is zero, so its level-3 projection is 0≠(1+2v+4v²)⊗1: the factorisation needs the retraction hypothesis.
- The rank-one splitting i=r=id and the rank-two splitting above give the same lift σ⊗1, as independence of the chosen finite free retract requires.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [embedding a nodal cone into finite coordinates](#2118-embedding-a-nodal-cone-into-finite-coordinates), [finite-free ordinary tensor cone lift](#2164-finite-free-ordinary-tensor-cone-lift).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [embedding a nodal cone into finite coordinates](#2118-embedding-a-nodal-cone-into-finite-coordinates), [finite-free ordinary tensor cone lift](#2164-finite-free-ordinary-tensor-cone-lift), `TensorProduct`, `LinearMap.lTensor`.

### 2.174 Finite projections separate completed tensors

Under coefficient convention C2. For finite projective N, if Pₙ(x)=Pₙ(y) for all n then x=y in T.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is finite projective over Â, hence flat; it need not be finite over A. No noetherian, local or discriminant hypothesis.

One proof uses the following inputs and comparisons. Use the pinned finite-projective splitting and retract projection separation. No basis of N is chosen as a hypothesis.

(The construction-specific inputs are [separation by finite tensor projections](#2165-separation-by-finite-tensor-projections).)

*Needs:* [separation by finite tensor projections](#2165-separation-by-finite-tensor-projections), `TensorProduct`, `Module.Finite.exists_comp_eq_id_of_projective`.

### 2.175 Coefficient base change of the actual dual quotient

Under coefficient convention C9. Construct the canonical A′-linear equivalence `E_{Q,f}:A′⊗_A` Q≃Q′ satisfying `E_{Q,f}(a′⊗[h])=[E_D(a′⊗h)]` and `E_Q′(E_{Q,f}(a′⊗z))=a′f(E_Q(z))`. This is the base change of D/im(m), not an identification of chosen unrelated copies of A.

All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

One proof uses the following inputs and comparisons. Tensor E_Q, use the native heterobasic right unit TensorProduct.AlgebraTensorModule.rid A A′ A′ : A′⊗_A A≃ₗ[A′]A′, then compose with E_Q′⁻¹. Its coefficient action is through f and its A′-linearity is retained. The evaluation formula and generation of J′ show E_D(a′⊗m(r))=m′(ι′a′φ(r)); hence passing from h to its quotient class is well-defined. Evaluate E_D in normal coordinates: it takes r incl+ιαε to the corresponding primed expression, sends ε to ε′, and its residue is a′f(ρh). This proves the quotient-representative formula agrees with the constructed equivalence. Identity and composition follow from the residue formula and injectivity of E_Q′; no tensor left-exactness or flatness of f is assumed.

Nonflat specialization ℤ→F₂ with γ=1,δ=s=t=0 preserves the actual quotient and sends its residue generator to residue 1.

The construction has the following API.

- `E_{Q,f}:A′⊗_A` Q≃Q′ is the natural dual-quotient comparison.
- `E_{Q,f}(a′⊗[h])=[E_D(a′⊗h)]`.
- `E_Q′(E_{Q,f}(a′⊗z))=a′f(E_Q(z))`.
- For f=id_A, `E_{Q,id}(a⊗z)=a·z` for every actual quotient class z∈Q.
- For A —f→ A′ —g→ A″, `E_{Q,g}(a″⊗E_{Q,f}(a′⊗z))=E_{Q,g∘f}((a″g(a′))⊗z)`, for every actual z∈D/im(m), without flatness.
- Any A′-linear equivalence e:A′⊗_A Q≃Q′ with E_Q′(e(a′⊗z))=a′f(E_Q(z)) for all a′,z equals `E_{Q,f}`.

**Checks.**

- For every a′,z, the residue of the tensor comparison is a′f(E_Q(z)).
- `E_{Q,id}(a⊗z)=a·z`.
- For f:ℤ→F₂ and γ=1,δ=s=t=0, F₂ is not ℤ-flat and `E_Q′(E_{Q,f}(1⊗z))=f(E_Q(z))` for every z∈Q.

([knudsen2012](#references), §3, printed pp. 11–12, monic division and the dual residue calculation preceding Proposition 3.1.)

*Needs:* [residue equivalence for the actual dual quotient](#2168-residue-equivalence-for-the-actual-dual-quotient), [canonical tensor comparison for the section dual](#2151-canonical-tensor-comparison-for-the-section-dual), [algebraic tensor comparison for a pointed node](#280-algebraic-tensor-comparison-for-a-pointed-node), [ring-linear tensor comparison for the section dual](#2167-ring-linear-tensor-comparison-for-the-section-dual), `TensorProduct.AlgebraTensorModule.rid`, `Submodule.liftQ`.

### 2.176 Residue quotient under ambient extension

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_Q:B⊗_R Q≃_B Q_B with E_Q(b⊗[h])=[E_D(b⊗h)].

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B).

One proof uses the following inputs and comparisons. Use the pinned tensor-quotient equivalence to quotient B⊗D by the image of B⊗im(m). The multiplication range equality identifies this image under E_D with im(m_B). Descend the specified map and its inverse; use pure tensors of quotient classes for uniqueness. Right exactness supplies the quotient step; no extra left-exactness of an arbitrary coefficient change is inserted.

If φ(d) is a unit, J_B=B, m_B is an isomorphism and Q_B=0. This prevents confusing ambient localization with a new pointed coefficient model whose residue always looks like A.

The construction has the following API.

- The B-linear E_Q on the actual multiplication quotient.
- E_Q(b⊗[h])=[E_D(b⊗h)].
- The stated pure-tensor quotient formula uniquely determines E_Q.

**Checks.**

- E_Q(b⊗[m(r)])=0.
- For B=R, E_Q(1⊗[h])=[E_D(1⊗h)].
- If φ(d) is a unit then Q_B is subsingleton; a constant nonzero residue module over B would fail.

([stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [multiplication maps under ambient transport](#2169-multiplication-maps-under-ambient-transport), `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv_apply_tmul`.

### 2.177 Coefficient universal exactness at Ψᵀ

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Ψᵀ)=im T_M(Φᵀ).

Here A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

One proof uses the following inputs and comparisons. Use T_M(p) in all three columns of the commuting ladder. The pinned exactness transport along linear equivalences gives this transposed pair from the opposite ordinary pair.

Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

**Checks.**

- For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual transposed right alternating tensor pair is exact.

([knudsen2012](#references), §3 Key Example, printed pp. 11–12: pψ=φᵀp, pφ=ψᵀp and Proposition 3.1.)

*Needs:* [tensor rotation intertwines φ transpose](#244-tensor-rotation-intertwines-φ-transpose), [tensor rotation intertwines ψ transpose](#245-tensor-rotation-intertwines-ψ-transpose), [coefficient universal exactness at φ](#2170-coefficient-universal-exactness-at-φ), `Function.Exact.of_ladder_linearEquiv_of_exact`.

### 2.178 Injectivity of coefficient-valued bidual evaluation

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M is injective for every A-module M.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Lift a difference tensor through the tensor-surjective P_J. The coordinate-presentation formula and invertible U_M(p) reduce vanishing to U_M(Φ)z=0. Universal exactness gives z∈im U_M(Ψ), and tensor presentation exactness gives U_M(P_J)z=0.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

**Checks.**

- The ideal tensor–Hom comparison also holds over the zero coefficient ring Z/1 with its actual native carriers.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [dual Hom coordinates with coefficients](#267-dual-hom-coordinates-with-coefficients), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), [coefficient universal exactness at φ](#2170-coefficient-universal-exactness-at-φ), [tensor exactness of the ideal presentation](#297-tensor-exactness-of-the-ideal-presentation), [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates).)

*Needs:* [dual Hom coordinates with coefficients](#267-dual-hom-coordinates-with-coefficients), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), [coefficient universal exactness at φ](#2170-coefficient-universal-exactness-at-φ), [tensor exactness of the ideal presentation](#297-tensor-exactness-of-the-ideal-presentation), `LinearMap.rTensor_surjective`, `LinearMap.rTensor_exact_iff_lTensor_exact`, [the symplectic rotation of section coordinates](#226-the-symplectic-rotation-of-section-coordinates), `LinearEquiv.rTensor`.

### 2.179 The section-ideal augmentation is a native quasi-isomorphism

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. π_J is a QuasiIso: its map on native homology is an isomorphism in every degree.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. In degree zero use the actual augmented short complex; ker P_J=im Ψ and surjectivity give exactness and epi. Identify that short complex through a native isomorphism and apply the degree-zero quasi-isomorphism criterion. At n+1 both complexes are exact, so the native criterion gives QuasiIsoAt.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the native augmentation to the actual section ideal](#2144-the-native-augmentation-to-the-actual-section-ideal), [positive-degree exactness of the section chain](#2171-positive-degree-exactness-of-the-section-chain), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation).)

*Needs:* [the native augmentation to the actual section ideal](#2144-the-native-augmentation-to-the-actual-section-ideal), [positive-degree exactness of the section chain](#2171-positive-degree-exactness-of-the-section-chain), [the relations of the section ideal surjection](#283-the-relations-of-the-section-ideal-surjection), [surjectivity of the ordered ideal presentation](#236-surjectivity-of-the-ordered-ideal-presentation), `ChainComplex.quasiIsoAt₀_iff`, `CategoryTheory.ShortComplex.quasiIso_iff_of_zeros'`, `CategoryTheory.ShortComplex.exact_and_epi_g_iff_of_iso`, `CategoryTheory.ShortComplex.isoMk`, `ModuleCat.epi_iff_surjective`, `quasiIsoAt_iff_exactAt'`, `ChainComplex.exactAt_succ_single_obj`.

### 2.180 The dual augmentation is a native quasi-isomorphism

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. π_D is a QuasiIso: its map on native homology is an isomorphism in every degree.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. In degree zero use the actual augmented short complex; ker P_D=im Φ and surjectivity give exactness and epi. Identify that short complex through a native isomorphism and apply the degree-zero quasi-isomorphism criterion. At n+1 both complexes are exact, so the native criterion gives QuasiIsoAt.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; The construction-specific inputs are [the native augmentation to the actual dual](#2145-the-native-augmentation-to-the-actual-dual), [positive-degree exactness of the section chain](#2171-positive-degree-exactness-of-the-section-chain), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation).)

*Needs:* [the native augmentation to the actual dual](#2145-the-native-augmentation-to-the-actual-dual), [positive-degree exactness of the section chain](#2171-positive-degree-exactness-of-the-section-chain), [the relations of the section dual surjection](#284-the-relations-of-the-section-dual-surjection), [surjectivity of the ordered dual presentation](#2123-surjectivity-of-the-ordered-dual-presentation), `ChainComplex.quasiIsoAt₀_iff`, `CategoryTheory.ShortComplex.quasiIso_iff_of_zeros'`, `CategoryTheory.ShortComplex.exact_and_epi_g_iff_of_iso`, `CategoryTheory.ShortComplex.isoMk`, `ModuleCat.epi_iff_surjective`, `quasiIsoAt_iff_exactAt'`, `ChainComplex.exactAt_succ_single_obj`.

### 2.181 Completed coefficient action on the original tensor limit

Under coefficient convention C7. Assume p is finitely generated. Equip the underlying abelian group L of lim Fᴬ with the Â-module structure transported along the actual additive equivalence underlying E to the native Â-module lim G. Explicitly b⋆x=E⁻¹(b·E(x)); preserve the existing A-module structure on L.

Here N is arbitrary: no flatness, finite generation or annihilation hypothesis on the finite quotients. No noetherianity, localness, discriminant or regular-sequence hypothesis. p is finitely generated, exactly as required by the finite tensor equivalence.

One proof uses the following inputs and comparisons. Turn E into its actual A-linear and additive equivalence. Transport only the completed action through native AddEquiv.module; the existing abelian group and A-action remain the original ones.

Use actual native tensor objects, scalar actions, quotient transitions and limit projections. Retain the ordinary two-base completion/stable-reflexivity theorem, faithful reflection, pointed hull, sheaf/family descent and arbitrary-base approximation as separate required work.

The construction has the following API.

- The transported action satisfies IsScalarTower(A,Â,L) with the existing A-action and the actual A→Â coefficient algebra.
- For every b∈Â and x∈L, E(b⋆x)=b·E(x), using the actual completed action on lim G.
- For every a∈A and x∈L, ι̂(a)⋆x=a·x, where ι̂ is the actual completion coefficient map A→Â and the right action is the existing A-action.

**Checks.**

- The zero completed scalar annihilates every x∈L.
- For a∈A, b∈Â and x∈L, (a·b)⋆x=a·(b⋆x) with the original coefficient action.
- The image of every original coefficient acts by the unchanged A-action.

(The construction-specific inputs are [two-base finite-tensor limit with completed target](#2172-two-base-finite-tensor-limit-with-completed-target).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [two-base finite-tensor limit with completed target](#2172-two-base-finite-tensor-limit-with-completed-target), `CategoryTheory.Iso.toLinearEquiv`, `AddEquiv.module`.

### 2.182 Finite-free completed tensor universal property

Under coefficient convention C5. Supply native IsLimit for the actual ordinary completed tensor cone: every Cone C has a unique Â-linear map C.pt→R̂⊗_Â N factoring all projections.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Use the constructed lift and factorization law; prove uniqueness from joint faithfulness of the actual finite tensor projections.

The construction has the following API.

- For every C,x,n, ρₙ(lift(C)(x))=C.πₙ(x).
- For x,y∈R̂⊗_Â N, if ρₙ(x)=ρₙ(y) for every n, then x=y.
- The IsLimit lift of the ordinary cone itself is the identity, excluding a nonfaithful limiting construction.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With r=1, the cone with point ℤ₂ and legs `a↦a(1+2v+⋯+2^{n−1}v^{n−1})⊗1` factors through a↦aσ⊗1. The element σ⊗1 does not come from R⊗_ℤℤ₂=ℤ₂[u,v]/(u²), so a cone vertex R⊗_A N in place of R̂⊗_Â N has no such factorization.
- Any actual cone-point morphism factoring all levels equals the specified IsLimit lift.
- With r=0 every cone point maps to the zero module and the lift is zero.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite-free ordinary tensor cone lift](#2164-finite-free-ordinary-tensor-cone-lift), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), [finite-free coordinates of the completed tensor cone](#2148-finite-free-coordinates-of-the-completed-tensor-cone), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite-free ordinary tensor cone lift](#2164-finite-free-ordinary-tensor-cone-lift), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary completed tensor cone](#2146-ordinary-completed-tensor-cone), [finite-free coordinates of the completed tensor cone](#2148-finite-free-coordinates-of-the-completed-tensor-cone), [ordinary completed tensor projection](#2130-ordinary-completed-tensor-projection), `AdicCompletion`, `AdicCompletion.evalₐ`, `CategoryTheory.Limits.IsLimit`, `DFunLike.ext`, `ModuleCat.hom_injective`, `ModuleCat.ofHom`, `TensorProduct`.

### 2.183 Completion of the actual residue quotient

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A. Construct Ê_Q:AdicCompletion I Q≃_C Q_C, characterized by Ê_Q(b·of([h]))=[E_D(b⊗h)].

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A.

One proof uses the following inputs and comparisons. Q is a quotient of the finite R-module D, hence finite. Compose the inverse of C⊗Q≃AdicCompletion I Q with E_Q at B=C. The two canonical equations show that completion of the quotient agrees with quotient of the completed dual by multiplication maps.

The completed quotient is Q_C=Hom_C(J·C,C)/im(C→Hom_C(J·C,C)), not a guessed coefficient completion.

The construction has the following API.

- Ê_Q on actual module completion and actual C-multiplication quotient.
- Ê_Q(of([h]))=[Ê_D(of (h))].
- Ê_Q(b·of([h]))=[E_D(b⊗h)].

**Checks.**

- For A=ℤ and γ=δ=s=t=0, so that R=ℤ[u,v]/(u²), c=u, d=v, b=u, a=0, J=(u,v), ε(u)=0 and ε(v)=u, Q=D/im(m) is generated by [ε] with u and v acting by zero (vε=m(u) and uε=0), so Q≅ℤ.
- In the same fixture with I=(2,u,v), the completion of Q is ℤ₂·[ε]; with I=(u,v), I acts by zero on Q and the completion is Q itself, so the ideal is not irrelevant.
- If φ(d) is a unit in C then Q_C is subsingleton.

([stacks-completion](#references), Stacks §10.97, Lemmas 10.97.1(3),10.97.2(1),10.97.3; [stacks-hom-flat](#references), Stacks tag 087R, Lemma 15.67.4(1), together with the proof at 087Q; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [completion of the polynomial section dual](#2135-completion-of-the-polynomial-section-dual), [residue quotient under ambient extension](#2176-residue-quotient-under-ambient-extension), `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian_apply`.

### 2.184 Faithful detection for the residue quotient

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). If B is a faithfully flat R-algebra and f:Q→_R Q, then 1_B⊗f is bijective if and only if f is bijective.

Here A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is faithfully flat over R; flatness alone is insufficient.

One proof uses the following inputs and comparisons. Apply the pinned faithful-flat bijectivity theorem to the actual R-module Q. Transport along E_Q when working with Q_B. Faithfulness is separately required; a flat localization away from the section kills Q.

Identity maps provide the basic case. Nonfaithful flat extension does not reflect a zero endomorphism of a nonzero residue quotient. For completion, first prove I⊂Jac(R), or work at a noetherian local ring with its maximal-ideal completion.

([stacks-completion](#references), Stacks §10.39 Definition 10.39.1 and Lemma 10.39.14, statements and proof; [stacks-completion](#references), Stacks §10.97, Lemmas 10.97.1(3),10.97.2(1),10.97.3; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [residue quotient under ambient extension](#2176-residue-quotient-under-ambient-extension), `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

### 2.185 Surjectivity of the dual coefficient-Hom map

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The actual R-linear map θ_D,M is surjective for every coefficient module M.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. For h:J→N_M, its coordinates y=C_J,M(h) lie in ker U_M(Ψᵀ). Universal transpose exactness supplies w with U_M(Φᵀ)w=y. The right-tensor rotation identity and coordinate-presentation formula show that U_M(P_D)(−U_M(p)⁻¹w) maps to h; cancel the injective C_J,M.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ideal Hom coordinates with coefficients](#231-ideal-hom-coordinates-with-coefficients), [right-tensor rotation of the first transpose](#246-right-tensor-rotation-of-the-first-transpose), [coefficient universal exactness at ψᵀ](#2177-coefficient-universal-exactness-at-ψᵀ).)

*Needs:* [ideal Hom coordinates with coefficients](#231-ideal-hom-coordinates-with-coefficients), [right-tensor rotation of the first transpose](#246-right-tensor-rotation-of-the-first-transpose), [coefficient universal exactness at ψᵀ](#2177-coefficient-universal-exactness-at-ψᵀ), `LinearMap.rTensor_exact_iff_lTensor_exact`.

### 2.186 Coefficient-valued bidual equivalence

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear equivalence Θ_J,M:J⊗_A M≃Hom_R(D,N_M) with forward map θ_J,M, for every A-module M.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the proved injectivity and surjectivity and the native equivalence of a bijective linear map. This is the explicit coefficient-valued evaluation comparison; it does not assert relative stable reflexivity or higher Ext.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- Θ_J,M(j⊗m)(h)=h(j)⊗m.
- Θ_J,M⁻¹(θ_J,M(j⊗m))=j⊗m.
- Any R-linear equivalence e:J⊗_A M≃Hom_R(D,N_M) with e(j⊗m)(h)=h(j)⊗m for all j,m,h equals Θ_J,M.

**Checks.**

- The inverse of θ_J,M sends the pure evaluation homomorphism h↦h(j)⊗m to j⊗m.
- For r∈R, x∈J⊗_A M and h∈D, θ_J,M(rx)(h)=rθ_J,M(x)(h), with no auxiliary action chosen.
- For A=Z, M=Z/3 and zero parameters in the degenerate quadratic polynomial model, the actual J tensor–Hom map is bijective without a nondegeneracy assumption.

([knudsen2012](#references), arXiv:1106.1588v2 §3, Proposition 3.1, printed p. 12; motivating noetherian/unit-discriminant example, with arbitrary-module exchange deduced here.)

*Needs:* [the coefficient-valued bidual evaluation map](#258-the-coefficient-valued-bidual-evaluation-map), [injectivity of coefficient-valued bidual evaluation](#2178-injectivity-of-coefficient-valued-bidual-evaluation), [surjectivity of coefficient-valued bidual evaluation](#2156-surjectivity-of-coefficient-valued-bidual-evaluation), `LinearEquiv.ofBijective`.

### 2.187 Exactness of left then right Hom precomposition

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The native R-linear maps L_Φ then L_Ψ form an exact pair for every coefficient module M.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Reuse coefficient-universal exactness of Φ-transpose then Ψ-transpose. Commute left and right tensor factors with the existing native tensor-exactness equivalence. Restrict the R-linear Hom maps to A only for the coordinate ladder. The actual E conjugates tensor-transpose maps to precomposition, so native exactness transports back to the R-linear Hom maps.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose), [coefficient universal exactness at ψᵀ](#2177-coefficient-universal-exactness-at-ψᵀ).)

*Needs:* [coefficient hom and matrix transpose](#23-coefficient-hom-and-matrix-transpose), [coefficient universal exactness at ψᵀ](#2177-coefficient-universal-exactness-at-ψᵀ), `LinearMap.rTensor_exact_iff_lTensor_exact`, `Function.Exact.of_ladder_linearEquiv_of_exact`, `LinearMap.restrictScalars`.

### 2.188 The actual section-ideal projective resolution

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Bundle C(false), its degreewise projectivity and π_J into the native ProjectiveResolution of J. This is the actual signed two-periodic resolution, not an arbitrarily chosen generic resolution.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Supply the actual complex, augmentation, projectivity and QuasiIso to the existing native structure.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- The underlying complex of the two-periodic resolution of J is exactly C(false).
- Its augmentation is exactly π_J.

**Checks.**

- The native section-ideal resolution differential d(1,0) is exactly Ψ.
- Its next native differential d(2,1) is exactly Φ.
- Over the zero ring Z/1 with all parameters zero, the actual ideal-resolution augmentation is a native QuasiIso.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the section-ideal augmentation is a native quasi-isomorphism](#2179-the-section-ideal-augmentation-is-a-native-quasi-isomorphism).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the section-ideal augmentation is a native quasi-isomorphism](#2179-the-section-ideal-augmentation-is-a-native-quasi-isomorphism), `CategoryTheory.ProjectiveResolution`.

### 2.189 The actual dual projective resolution

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. Bundle C(true), its degreewise projectivity and π_D into the native ProjectiveResolution of D. This is the actual signed two-periodic resolution, not an arbitrarily chosen generic resolution.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Supply the actual complex, augmentation, projectivity and QuasiIso to the existing native structure.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

The construction has the following API.

- The underlying complex of the two-periodic resolution of D is exactly C(true).
- Its augmentation is exactly π_D.

**Checks.**

- The native dual-resolution differential d(1,0) is exactly Φ.
- Its next native differential d(2,1) is exactly Ψ.
- Over Z/4 with γ=δ=t=0,s=1, the actual dual-resolution augmentation is a native QuasiIso.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the dual augmentation is a native quasi-isomorphism](#2180-the-dual-augmentation-is-a-native-quasi-isomorphism).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the dual augmentation is a native quasi-isomorphism](#2180-the-dual-augmentation-is-a-native-quasi-isomorphism), `CategoryTheory.ProjectiveResolution`.

### 2.190 Completed-linear equivalence of finite tensor limits

Under coefficient convention C7. Assume p is finitely generated. With precisely the transported Â-action on L, construct Ê:L≃ₗ[Â]lim G from the same underlying additive equivalence as E. Its maps are the actual maps E and E⁻¹; no additional scalar action is selected.

Here N is arbitrary: no flatness, finite generation or annihilation hypothesis on the finite quotients. No noetherianity, localness, discriminant or regular-sequence hypothesis. p is finitely generated, exactly as required by the finite tensor equivalence.

One proof uses the following inputs and comparisons. Apply native AddEquiv.linearEquiv to the same actual additive equivalence and exactly the transported module. The forward and inverse maps agree with E and E⁻¹, and native completed-linear projections give scalar compatibility.

Use actual native tensor objects, scalar actions, quotient transitions and limit projections. Retain the ordinary two-base completion/stable-reflexivity theorem, faithful reflection, pointed hull, sheaf/family descent and arbitrary-base approximation as separate required work.

The construction has the following API.

- For every x∈L, the forward completed-linear equivalence evaluates as E(x).
- For every y∈lim G, its inverse evaluates as E⁻¹(y).
- For b∈Â, x∈L and every n, π⁽ᴳ⁾ₙ(Ê(b⋆x))=b·π⁽ᴳ⁾ₙ(Ê(x)) in the actual finite Â-tensor module.

**Checks.**

- Ê⁻¹(Ê(x))=x for every x∈L.
- Ê(Ê⁻¹(y))=y for every y∈lim G.
- Every completed finite-level projection commutes with every b∈Â after the original-limit action is transported.

(The construction-specific inputs are [completed coefficient action on the original tensor limit](#2181-completed-coefficient-action-on-the-original-tensor-limit), [two-base finite-tensor limit with completed target](#2172-two-base-finite-tensor-limit-with-completed-target).; [knudsen2](#references), Appendix Proposition 6, printed194–195 (physical34–35).)

*Needs:* [completed coefficient action on the original tensor limit](#2181-completed-coefficient-action-on-the-original-tensor-limit), [two-base finite-tensor limit with completed target](#2172-two-base-finite-tensor-limit-with-completed-target), `CategoryTheory.Iso.toLinearEquiv`, `AddEquiv.linearEquiv`.

### 2.191 Ordinary tensor and native limit isomorphism

Under coefficient convention C5. Construct an actual ModuleCat(Â) isomorphism R̂⊗_Â N≅lim G from the two native limiting cones.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Reuse pinned IsLimit.conePointUniqueUpToIso with the proved ordinary cone and limit.isLimit(G).

The construction has the following API.

- For every x and n, πₙ(E(x))=ρₙ(x).
- For every y∈lim G and n, ρₙ(E⁻¹(y))=πₙ(y).
- The forward morphism followed by the inverse is the actual identity morphism.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With r=1, the forward map sends σ⊗1 to the compatible family (1, 1+2v, 1+2v+4v², …), with level-3 term 1+2v+4v².
- The inverse sends the constant family (u⊗1, u⊗1, …) to u⊗1; the family with level-1 term 1 and level-2 term 0 is not an element of lim G.
- With r=0 both sides are 0.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95; tensor components use `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [finite-free completed tensor universal property](#2182-finite-free-completed-tensor-universal-property).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [finite-free completed tensor universal property](#2182-finite-free-completed-tensor-universal-property), `AdicCompletion`, `AdicCompletion.evalₐ`, `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`, `CategoryTheory.Limits.limit.isLimit`, `ModuleCat.of`, `TensorProduct`.

### 2.192 Native limit for a finite-free retract

Under coefficient convention C1. If r∘i=id_N, the ordinary completed tensor cone is a native IsLimit with lift L_i,r.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis.

One proof uses the following inputs and comparisons. Use the factorisation theorem for fac, then finite projection separation and the candidate cone equations for uniq.

The construction has the following API.

- Under coefficient convention C1. For every c and n, the native limit lift followed by the ordinary n-projection is cₙ.
- Under coefficient convention C1. Any cone morphism f into the ordinary tensor cone with f followed by every projection equal to cₙ is its limit lift.
- Under coefficient convention C1. The lift of the ordinary tensor cone to itself is its identity morphism.

**Checks.**

- In the fixture A=ℤ, γ=δ=s=t=0, p=(2) and m=2R, so that R=ℤ[u,v]/(u²), Â=ℤ₂, Qₙ=(ℤ/2ⁿ)[u,v]/(u²) and `σ=Σ_{k≥0}2^k v^k∈R̂` and N=ℤ₂ with i=r=id, the cone of the truncations of σ⊗1 lifts to σ⊗1∈R̂⊗_Â N, and any other map with the same projections equals it.
- For N=ℚ₂, which is not a retract of a finite free ℤ₂-module, every Qₙ⊗ℚ₂ is zero, since 2ⁿ kills Qₙ and is invertible on ℚ₂; the cone has limit 0 while R̂⊗_Â ℚ₂=R̂[1/2]≠0, so the retract hypothesis cannot be dropped.
- For N=0 the tensor product and every Qₙ⊗N are zero, and the lift is the zero map.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95. The construction-specific inputs are [retracting the finite-coordinate lift](#2173-retracting-the-finite-coordinate-lift), [separation by finite tensor projections](#2165-separation-by-finite-tensor-projections).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [retracting the finite-coordinate lift](#2173-retracting-the-finite-coordinate-lift), [separation by finite tensor projections](#2165-separation-by-finite-tensor-projections), `TensorProduct`.

### 2.193 Coefficient tensor–Hom equivalence for the dual

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear equivalence Θ_D,M:D⊗_A M≃Hom_R(J,N_M) whose forward map is θ_D,M. It holds for every M, including nonflat torsion modules.

Here A is an arbitrary commutative ring; M is an arbitrary A-module, with no flatness hypothesis. All tensor actions and Hom spaces are the actual native inherited ones; no noetherianity, nontriviality or unit-discriminant assumption is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the separately proved injectivity and surjectivity of the actual canonical θ_D,M and the native bijective-linear-map equivalence. Do not use finite-projectivity over R or impose flatness on M.

The statement uses the actual section ideal and actual R-linear dual in the untruncated polynomial ring. Keep this algebra calculation separate from higher Ext, relative stable-reflexivity, completed-local and family/sheaf descent.

The construction has the following API.

- Θ_D,M(h⊗m)(j)=h(j)⊗m.
- Θ_D,M⁻¹(θ_D,M(h⊗m))=h⊗m.
- Any R-linear equivalence e:D⊗_A M≃Hom_R(J,N_M) satisfying e(h⊗m)(j)=h(j)⊗m for all h,m,j equals Θ_D,M.

**Checks.**

- The inverse of the actual dual tensor–Hom equivalence sends θ_D,M(h⊗m) to h⊗m.
- For actual r∈R, x∈D⊗_A M and j∈J, θ_D,M(rx)(j)=rθ_D,M(x)(j) for the inherited left R-action on both tensors.
- For A=Z, γ=δ=s=t=0 and M=Z/3, the canonical dual tensor–Hom map is bijective; no flatness of the coefficient module is required.

([knudsen2012](#references), arXiv:1106.1588v2 §3, Proposition 3.1, printed p. 12; motivating noetherian/unit-discriminant example, with arbitrary-module exchange deduced here.)

*Needs:* [the actual dual coefficient-hom map](#257-the-actual-dual-coefficient-hom-map), [injectivity of the dual coefficient-hom map](#2155-injectivity-of-the-dual-coefficient-hom-map), [surjectivity of the dual coefficient-hom map](#2185-surjectivity-of-the-dual-coefficient-hom-map), `LinearEquiv.ofBijective`.

### 2.194 Every adjacent section Hom pair is exact

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, d(e,n) then d(e,n+1) form an exact pair.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Split the two phases and the two possible parity residues; apply the matching native Hom exact pair.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [the polynomial section hom differential](#29-the-polynomial-section-hom-differential), [exactness of left then right hom precomposition](#2187-exactness-of-left-then-right-hom-precomposition), [exactness of right then left hom precomposition](#2140-exactness-of-right-then-left-hom-precomposition).)

*Needs:* [the polynomial section hom differential](#29-the-polynomial-section-hom-differential), [exactness of left then right hom precomposition](#2187-exactness-of-left-then-right-hom-precomposition), [exactness of right then left hom precomposition](#2140-exactness-of-right-then-left-hom-precomposition).

### 2.195 The bundled section-ideal resolution is augmented by a quasi-isomorphism

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. The actual bundled the augmentation of the two-periodic resolution of J is a native QuasiIso in every degree.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Use the native certified quasi-isomorphism field of this actual resolution.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291. The construction-specific inputs are [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution).)

*Needs:* [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution).

### 2.196 The bundled dual resolution is augmented by a quasi-isomorphism

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential `C(e)_{n+1}→C(e)_n` given by B(e,n), and zero off that shape. The actual bundled the augmentation of the two-periodic resolution of D is a native QuasiIso in every degree.

Here A is any commutative ring; no noetherianity, nontriviality or unit-discriminant assumption is required for this actual polynomial calculation. Coefficients M, when present, are any A-module, without M-flatness.

One proof uses the following inputs and comparisons. Use the native certified quasi-isomorphism field of this actual resolution.

Use the actual signed P_J/P_D maps and native ModuleCat complex, projectivity and QuasiIso. Do not infer native Ext, relative stable reflexivity, two-base completion, hull identification or family/sheaf descent from the resolutions or differential comparison alone.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; The construction-specific inputs are [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution).)

*Needs:* [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution).

### 2.197 Canonical coefficient exchange for the section dual

Under coefficient convention C8. The canonical exchange Φ_D,M:D∨⊗_A M≃ₗ[R]Hom_R(D,N_M) is an equivalence with Φ_D,M(F⊗m)(h)=F(h)⊗m. Construct it as (η⁻¹⊗id_M) followed by the existing Θ_J,M.

No noetherianity, reducedness, nonzero coefficient ring, unit discriminant or flatness of M is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Tensor the explicit native bidual equivalence with id_M using the heterobasic R-linear tensor equivalence. Compose its inverse direction with Θ_J,M. On pure tensors, η(η⁻¹F)(h)=F(h) proves that the result is the actual canonical exchange map. Tensor induction gives uniqueness and naturality for every A-linear map M→M′.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

The construction has the following API.

- Under coefficient convention C8. Φ_D,M(F⊗m)(h)=F(h)⊗m.
- Under coefficient convention C8. Φ_D,M⁻¹(Φ_D,M(F⊗m))=F⊗m.
- Under coefficient convention C8. Every R-linear equivalence e:D∨⊗_A M≃Hom_R(D,N_M) satisfying e(F⊗m)(h)=F(h)⊗m for all F,m,h equals Φ_D,M.
- Under coefficient convention C8. For any A-linear f:M→M′, x∈D∨⊗_A M and h∈D, Φ_D,M′((id_D∨⊗f)x)(h)=(id_R⊗f)(Φ_D,M(x)(h)).

**Checks.**

- Under coefficient convention C8. For M=A, the native R-linear right tensor unit sends Φ_D,A(F⊗1)(h) to F(h).
- Under coefficient convention C8. For A=ℤ, (γ,δ,s,t)=(1,0,1,0), M=ℤ/2, Φ_D,M(F⊗1)(h)=F(h)⊗1 for all F,h. No flatness of M is available.
- Under coefficient convention C8. For A=ℤ/4 and γ=δ=s=t=0, Φ_D,A⁻¹(Φ_D,A(F⊗1))=F⊗1 for all F. Neither reducedness nor invertible discriminant is available.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [canonical section bidual equivalence](#2162-canonical-section-bidual-equivalence), [coefficient-valued bidual equivalence](#2186-coefficient-valued-bidual-equivalence), `TensorProduct.AlgebraTensorModule.congr`.

### 2.198 Ordinary tensor and native limit linear equivalence

Under coefficient convention C5. Construct E:R̂⊗_Â N≃ₗ[Â]lim G from the actual module-category isomorphism.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. No finite-generation condition on p.

One proof uses the following inputs and comparisons. Use ModuleCat.Iso.toLinearEquiv; no alternate limit carrier or transported ad hoc scalar action is introduced.

The construction has the following API.

- For every x and n, πₙ(E(x))=ρₙ(x).
- For every y∈lim G and n, ρₙ(E⁻¹(y))=πₙ(y).
- For u∈R̂,z∈N and every n, πₙ(E(u⊗z))=evalₙ(u)⊗z over Â.
- For every x∈R̂⊗_Â N, E⁻¹(E(x))=x.
- For every y∈lim G, E(E⁻¹(y))=y.

**Checks.**

- The equivalence's inverse after forward map is the identity on every ordinary completed tensor.
- The equivalence's forward after inverse map is the identity on every native limit element.
- Every native limit projection of E(u⊗z) is evalₙ(u)⊗z over Â.
- For rank zero, inverse after forward sends every tensor to zero, agreeing with the unique empty-coordinate tensor.
- For rank one and its basis vector 1, the sole coordinate of each projected E(u⊗1) is exactly evalₙ(u).

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary tensor and native limit isomorphism](#2191-ordinary-tensor-and-native-limit-isomorphism).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary tensor and native limit isomorphism](#2191-ordinary-tensor-and-native-limit-isomorphism), `AdicCompletion`, `AdicCompletion.evalₐ`, `CategoryTheory.Iso.toLinearEquiv`, `TensorProduct`.

### 2.199 Native limit for finite projective coefficients

Under coefficient convention C1. For every finite projective Â-module N, the ordinary completed tensor cone is a native IsLimit, without choosing a basis of N or assuming N free.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis. N is finite and projective over Â; a basis or freeness is not assumed.

One proof uses the following inputs and comparisons. Import Module.Finite.exists_comp_eq_id_of_projective at the pin. Apply the explicit finite-free retract construction and choose a witness of Nonempty IsLimit. The generic retraction theorem is not replanned.

The construction has the following API.

- Under coefficient convention C1. For every c and n, its native limit lift followed by the ordinary n-projection is cₙ.
- Under coefficient convention C1. A cone morphism into the ordinary tensor cone is the lift exactly when it has every required finite projection.
- Under coefficient convention C1. The native lift of the ordinary tensor cone to itself is its identity morphism.

**Checks.**

- Under coefficient convention C1. For finite projective N, the native projective limit lift of any cone c followed by its n-projection equals cₙ for every n.
- Under coefficient convention C1. For finite projective N, an Â-linear map f:c.pt→R̂⊗_Â N whose every finite projection equals cₙ is the native projective limit lift of c.
- Under coefficient convention C1. For finite projective N, lifting the ordinary completed tensor cone into itself with the native projective limit gives its identity morphism.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95. The construction-specific inputs are [native limit for a finite-free retract](#2192-native-limit-for-a-finite-free-retract).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [native limit for a finite-free retract](#2192-native-limit-for-a-finite-free-retract), `TensorProduct`, `Module.Finite.exists_comp_eq_id_of_projective`.

### 2.200 The section Hom differential squares to zero

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, d(e,n+1)∘d(e,n)=0 as an actual R-linear map H→H.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104; `LinearMap.comp_apply` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, line 495. The construction-specific inputs are [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact).)

*Needs:* [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact), `Function.Exact.linearMap_comp_eq_zero`.

### 2.201 Positive exactness of actual categorical Hom precomposition

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For e=false and e=true and every n≥0, the actual maps Hom_R(C(e)_n,N)→Hom_R(C(e)_(n+1),N)→Hom_R(C(e)_(n+2),N), by precomposition with the resolution differentials, are Function.Exact. A cocycle is the precomposition of an actual predecessor morphism; no coefficient flatness is assumed.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407. The construction-specific inputs are [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact), [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex).)

*Needs:* [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact), [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), `HomologicalComplex.d_comp_d`.

### 2.202 Evaluation factorization of the second exchange map

Under coefficient convention C8. For every x∈J⊗_A M, Φ_D,M((η⊗id_M)x)=Θ_J,M(x) in Hom_R(D,N_M). This identifies Knudsen’s ψ, and Ile’s σ_J⊗id followed by exchange, with the previously constructed evaluation comparison.

No noetherianity, reducedness, nonzero coefficient ring, unit discriminant or flatness of M is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Check both sides on j⊗m: evaluation at h is h(j)⊗m. Use tensor induction for zero and addition; the result is equality of actual R-linear maps on every tensor.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

**Checks.**

- Under coefficient convention C8. At every pure tensor j⊗m and h∈D, Φ_D,M((Module.Dual.eval R J⊗id_M)(j⊗m))(h)=h(j)⊗m.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [canonical coefficient exchange for the section dual](#2197-canonical-coefficient-exchange-for-the-section-dual), [coefficient-valued bidual equivalence](#2186-coefficient-valued-bidual-equivalence), [canonical section bidual equivalence](#2162-canonical-section-bidual-equivalence), `TensorProduct.AlgebraTensorModule.rTensor`.

### 2.203 Original tensor limit to ordinary completed tensor

Under coefficient convention C5. Assume additionally p.FG. For the actual original-base diagram Fᴬ:n↦Qₙ⊗_A N, with the transported Â-action on Lᴬ=lim Fᴬ, construct Lᴬ≃ₗ[Â]R̂⊗_Â N as E⁻¹ composed with the inherited completed-linear limit comparison.

No noetherian, local, regular-sequence or discriminant hypothesis. The coefficient module is exactly Fin(r)→Â; no arbitrary-module completion interchange is asserted. p is finitely generated; this is inherited from the original-base finite tensor comparison.

One proof uses the following inputs and comparisons. Compose the inherited completed-linear equivalence with the finite-free ordinary equivalence's inverse. Retain the finite-generation condition required by the original finite-level comparison.

The construction has the following API.

- For p.FG, x∈Lᴬ and every n, ρₙ(E_original(x))=πₙ(E_inherited(x)), where E_inherited:Lᴬ≃ₗ[Â]lim G is the completed-linear comparison.
- With p.FG and the completed action, inverse after forward is the identity on the actual original tensor limit.
- With p.FG, forward after inverse is the identity on the ordinary completed tensor.

**Checks.**

- Take A=ℤ, γ=δ=s=t=0, p=(2), finitely generated, and m=2R, so R=ℤ[u,v]/(u²), Â=ℤ₂ and Qₙ=(ℤ/2ⁿ)[u,v]/(u²); put `σ=Σ_{k≥0}2^k v^k∈R̂`. With r=1, the element of Lᴬ with components `(1+2v+⋯+2^{n−1}v^{n−1})⊗_ℤ1` goes to σ⊗1.
- The constant family 1⊗_ℤ(1/3) goes to ĩ(1/3)⊗1, whose level-2 projection is 3; on the original base the scalar 1/3 is visible only through 1⊗_ℤ(1/3)=3⊗_ℤ1 at level 2.
- With r=0 both sides are 0.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95; tensor components use `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [completed-linear equivalence of finite tensor limits](#2190-completed-linear-equivalence-of-finite-tensor-limits), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite tensor diagram over the original base](#2102-finite-tensor-diagram-over-the-original-base), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary tensor and native limit linear equivalence](#2198-ordinary-tensor-and-native-limit-linear-equivalence), [completed coefficient action on the original tensor limit](#2181-completed-coefficient-action-on-the-original-tensor-limit).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [completed-linear equivalence of finite tensor limits](#2190-completed-linear-equivalence-of-finite-tensor-limits), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [finite tensor diagram over the original base](#2102-finite-tensor-diagram-over-the-original-base), [finite quotient transition over completed coefficients](#269-finite-quotient-transition-over-completed-coefficients), [native completed-coefficient tensor diagram](#2104-native-completed-coefficient-tensor-diagram), [ordinary tensor and native limit linear equivalence](#2198-ordinary-tensor-and-native-limit-linear-equivalence), [completed coefficient action on the original tensor limit](#2181-completed-coefficient-action-on-the-original-tensor-limit), `AdicCompletion`, `AdicCompletion.evalₐ`, `TensorProduct`.

### 2.204 Ordinary tensor and projective tensor limit

Under coefficient convention C1. For finite projective N construct the native Â-linear equivalence R̂⊗_Â N≃ₗ[Â]lim G_N.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis. N is finite and projective over Â; a basis or freeness is not assumed.

One proof uses the following inputs and comparisons. Use the uniqueness isomorphism of two native limit cones and ModuleCat.Iso.toLinearEquiv.

The construction has the following API.

- Under coefficient convention C1. For every x and n, πₙ(E_N(x))=P_N,n(x).
- Under coefficient convention C1. For every y∈lim G_N and n, P_N,n(E_N⁻¹(y))=πₙ(y).
- Under coefficient convention C1. For every x∈R̂⊗_Â N, E_N⁻¹(E_N(x))=x.
- Under coefficient convention C1. For every y∈lim G_N, E_N(E_N⁻¹(y))=y.

**Checks.**

- Under coefficient convention C1. For finite projective N, every x∈R̂⊗_Â N and every n satisfy πₙ(E_N(x))=P_N,n(x).
- Under coefficient convention C1. For finite projective N, every y∈lim G_N and every n satisfy P_N,n(E_N⁻¹(y))=πₙ(y).
- Under coefficient convention C1. For finite projective N and every x∈R̂⊗_Â N, E_N⁻¹(E_N(x))=x.
- Under coefficient convention C1. For finite projective N and every y∈lim G_N, E_N(E_N⁻¹(y))=y.
- Under coefficient convention C1. For N=Fin(0)→Â and every x∈R̂⊗_Â N, E_N⁻¹(E_N(x))=0; the completed tensor is the zero module.
- Under coefficient convention C1. For N=Fin(1)→Â and every x∈R̂⊗_Â N, E_N(x) equals the finite-free completion equivalence applied to x.

(Deduction using `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [native limit for finite projective coefficients](#2199-native-limit-for-finite-projective-coefficients).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [native limit for finite projective coefficients](#2199-native-limit-for-finite-projective-coefficients), `TensorProduct`.

### 2.205 Assembly of native compatible tensor sections

Under coefficient convention C2. For finite projective N, construct the Â-linear map B from the existing ModuleCat sections submodule of G_N to T.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is finite projective over Â, hence flat; it need not be finite over A. No noetherian, local or discriminant hypothesis.

One proof uses the following inputs and comparisons. Make the evaluation cone on the native sections submodule and apply the actual projective tensor IsLimit lift.

The construction has the following API.

- Under coefficient convention C2. For a compatible tensor section v, Pₙ(B(v))=vₙ.
- Under coefficient convention C2. If y∈T satisfies Pₙ(y)=vₙ for every n, then y=B(v).
- Under coefficient convention C2. B(0)=0.

**Checks.**

- Under coefficient convention C2. Every compatible tensor section is recovered at each n by the finite projection of its assembled tensor.
- Under coefficient convention C2. A tensor with all the prescribed finite values is the assembled tensor.
- In the fixture A=ℤ, γ=δ=s=t=0, p=(2), m=2R and N=ℤ₂: the compatible section n↦[1+2v+⋯+2^(n−1)v^(n−1)]⊗1 assembles to σ⊗1 with σ=Σ2^k v^k, which is not in the image of R⊗_ℤℤ₂; the section n↦[1/3 modulo 2ⁿ]⊗1, with values [1],[3],[3],[11] at levels 1–4, assembles to (1/3)·(1⊗1), and an assembly sending it to 3·(1⊗1) fails at level 4.

(The construction-specific inputs are [native limit for finite projective coefficients](#2199-native-limit-for-finite-projective-coefficients).)

*Needs:* [native limit for finite projective coefficients](#2199-native-limit-for-finite-projective-coefficients), `TensorProduct`, `ModuleCat.sectionsSubmodule`.

### 2.206 The native polynomial section Hom cochain complex

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Construct C_e as a native nonnegative cochain complex in ModuleCat R, with object H in each degree and successive differential d(e,n). Use the existing CochainComplex.of constructor and the actual square-zero proof.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

The construction has the following API.

- For either phase e and every n≥0, C_e.X(n)=ModuleCat.of R H, with the actual native R-module structure on the Hom space.
- For either phase e and every n≥0, the native morphism C_e.d(n,n+1) is ModuleCat.ofHom(d(e,n)). The morphism comparison is stated with the source and target object identifications: compare the differential maps after transporting along those identifications.
- For either phase e and i,j≥0 with i+1≠j, C_e.d(i,j)=0.

**Checks.**

- For A=ℤ, γ=1,δ=0,s=1,t=0 and M=ℤ/2, the ideal-phase native cohomology object in degree three is zero; the coefficient module is not flat over ℤ.
- For A=ℤ/4, γ=δ=0,s=1,t=0 and M=ℤ/4, the dual-phase native cohomology object in degree two is zero; neither reducedness nor a unit discriminant is required by this algebra calculation.
- For A=M=ℤ/1 and all parameters zero, the ideal-phase native cohomology object in degree one is zero.
- For every n, the ideal-phase successor differential is the actual ModuleCat morphism of d(false,n), not a chosen zero differential.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `CochainComplex.of` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 890. The construction-specific inputs are [the polynomial section hom differential](#29-the-polynomial-section-hom-differential), [the section hom differential squares to zero](#2200-the-section-hom-differential-squares-to-zero).)

*Needs:* [the polynomial section hom differential](#29-the-polynomial-section-hom-differential), [the section hom differential squares to zero](#2200-the-section-hom-differential-squares-to-zero), `CochainComplex.of`, `ModuleCat.of`, `ModuleCat.ofHom`, `ModuleCat.hom_ext`.

### 2.207 Positive native localization Ext vanishing for the section ideal

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0, every class α in the localization-defined Ext group `CategoryTheory.Abelian.Ext` of J and R⊗_A M in degree n+1 is zero. This is proved for that Ext directly, without identifying it with the derived-functor Ext.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Represent α by a cocycle on the two-periodic projective resolution, which is possible since a class of this Ext is realized on any projective resolution. Positive-degree exactness of the Hom cochain gives a predecessor, so the cocycle is a coboundary and the class vanishes.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

**Checks.**

- For A=Z, γ=1,δ=0,s=1,t=0 and M=Z/2, every element of native localization Abelian.Ext^4(J,R⊗M) is zero.
- For A=Z/1 and M=A, every native localization Abelian.Ext^1(J,R⊗M) class is zero.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.extMk_surjective` and `CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff` in `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`, lines 211 and 196. The construction-specific inputs are [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution), [positive exactness of actual categorical hom precomposition](#2201-positive-exactness-of-actual-categorical-hom-precomposition).)

*Needs:* [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution), [positive exactness of actual categorical hom precomposition](#2201-positive-exactness-of-actual-categorical-hom-precomposition), `CategoryTheory.Abelian.Ext`, `CategoryTheory.ProjectiveResolution.extMk_surjective`, `CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff`, `CategoryTheory.hasExt_of_enoughProjectives`.

### 2.208 Positive native localization Ext vanishing for the section dual

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0, every class α in the localization-defined Ext group `CategoryTheory.Abelian.Ext` of D and R⊗_A M in degree n+1 is zero. No coefficient flatness of D and no identification with the derived-functor Ext is assumed.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Represent α by a cocycle on the two-periodic projective resolution, which is possible since a class of this Ext is realized on any projective resolution. Positive-degree exactness of the Hom cochain gives a predecessor, so the cocycle is a coboundary and the class vanishes.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

**Checks.**

- For A=Z/4, γ=δ=t=0,s=1 and M=A, every native localization Abelian.Ext^2(D,R⊗M) class is zero.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.extMk_surjective` and `CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff` in `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`, lines 211 and 196. The construction-specific inputs are [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution), [positive exactness of actual categorical hom precomposition](#2201-positive-exactness-of-actual-categorical-hom-precomposition).)

*Needs:* [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution), [positive exactness of actual categorical hom precomposition](#2201-positive-exactness-of-actual-categorical-hom-precomposition), `CategoryTheory.Abelian.Ext`, `CategoryTheory.ProjectiveResolution.extMk_surjective`, `CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff`, `CategoryTheory.hasExt_of_enoughProjectives`.

### 2.209 Original-base limit and ordinary projective tensor

Under coefficient convention C1. If p is finitely generated and N is finite projective over Â, the actual original A-linear finite-tensor limit, endowed with the transported Â-action, is Â-linearly equivalent to R̂⊗_Â N.

A and N lie in one common universe and carry explicit compatible A/Â-actions. No noetherian, locality or discriminant hypothesis; N is projective over Â, hence flat, by the retraction or finite-projectivity hypothesis. N is finite and projective over Â; a basis or freeness is not assumed. p is finitely generated; the original limit uses exactly the transported Â-action.

One proof uses the following inputs and comparisons. Compose [completed-linear equivalence of finite tensor limits](#2190-completed-linear-equivalence-of-finite-tensor-limits) with E_N⁻¹. Keep the ordinary R̂⊗_A N quotient comparison distinct.

The construction has the following API.

- Under coefficient convention C1. For x in the original limit, P_N,n of its ordinary-tensor image equals the n-projection of the completed-linear limit image.
- Under coefficient convention C1. The composite equivalence followed by its inverse fixes every point of the original limit, with the same transported Â-action.
- Under coefficient convention C1. The inverse followed by the composite equivalence fixes every tensor in R̂⊗_Â N.

**Checks.**

- Under coefficient convention C1. For p finitely generated and finite projective N, the original-base comparison followed by its inverse fixes every point of the original limit, with its transported Â-action.
- Under coefficient convention C1. For p finitely generated and finite projective N, the inverse original-base comparison followed by that comparison fixes every x∈R̂⊗_Â N.
- Under coefficient convention C1. For p finitely generated, finite projective N, every x in the original A-limit and every n, P_N,n of its ordinary-tensor image equals πₙ of its completed-linear limit image.

(Deduction using `CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self` in `Mathlib/CategoryTheory/Limits/IsLimit.lean`, lines 232 and 95; tensor components use `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [ordinary tensor and projective tensor limit](#2204-ordinary-tensor-and-projective-tensor-limit), [completed-linear equivalence of finite tensor limits](#2190-completed-linear-equivalence-of-finite-tensor-limits).; [knudsen2](#references), Appendix Proposition 6, pp. 194–195, for the surrounding two-base completion problem; the displayed native diagram calculation is the deduction specified here.)

*Needs:* [ordinary tensor and projective tensor limit](#2204-ordinary-tensor-and-projective-tensor-limit), [completed-linear equivalence of finite tensor limits](#2190-completed-linear-equivalence-of-finite-tensor-limits), `TensorProduct`.

### 2.210 The native successor differential

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native morphism C_e.d(n,n+1) is ModuleCat.ofHom(d(e,n)). The comparison uses the specified native Hom object identifications.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `Matrix.mulVecLin_apply` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, line 291, and `TensorProduct.map_tmul` and `TensorProduct.map_comp` in `Mathlib/LinearAlgebra/TensorProduct/Map.lean`, lines 59 and 104. The construction-specific inputs are [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex).)

*Needs:* [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex), `CochainComplex.of_d`.

### 2.211 Positive categorical Ext of the section ideal into its ring

Under coefficient convention C8. For every n≥0 and α∈CategoryTheory.Abelian.Ext (ModuleCat.of R J) (ModuleCat.of R R) (n+1), α=0.

No noetherianity, reducedness, nonzero coefficient ring or unit discriminant is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Map the native R-linear tensor-unit isomorphism through the localization-defined Ext functor in its target argument. Apply the inherited coefficient-module vanishing with M=A to the inverse image of α. Map the zero equality forward and use the actual categorical inverse identity. This is separate from the root Ext module-valued interface; no equality of the two Ext constructions is assumed.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

**Checks.**

- Under coefficient convention C8. For A=ℤ, (γ,δ,s,t)=(1,0,1,0), every categorical Ext³_R(J,R) class is zero.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [positive native localization ext vanishing for the section ideal](#2207-positive-native-localization-ext-vanishing-for-the-section-ideal), `TensorProduct.AlgebraTensorModule.rid`, `LinearEquiv.toModuleIso`, `CategoryTheory.Functor.mapIso`, `CategoryTheory.Abelian.extFunctorObj`.

### 2.212 Positive categorical Ext of the section dual into its ring

Under coefficient convention C8. For every n≥0 and α∈CategoryTheory.Abelian.Ext (ModuleCat.of R D) (ModuleCat.of R R) (n+1), α=0.

No noetherianity, reducedness, nonzero coefficient ring or unit discriminant is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Map the native R-linear tensor-unit isomorphism through the localization-defined Ext functor in its target argument. Apply the inherited coefficient-module vanishing with M=A to the inverse image of α. Map the zero equality forward and use the actual categorical inverse identity. This is separate from the root Ext module-valued interface; no equality of the two Ext constructions is assumed.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

**Checks.**

- Under coefficient convention C8. For A=ℤ/4, (γ,δ,s,t)=(0,0,1,0), every categorical Ext⁴_R(D,R) class is zero.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [positive native localization ext vanishing for the section dual](#2208-positive-native-localization-ext-vanishing-for-the-section-dual), `TensorProduct.AlgebraTensorModule.rid`, `LinearEquiv.toModuleIso`, `CategoryTheory.Functor.mapIso`, `CategoryTheory.Abelian.extFunctorObj`.

### 2.213 Ring-linear assembly of compatible Hom families

Under coefficient convention C2. For finite projective N construct A_L:H_L→ₗ[Â]Hom_R(L,T), with A_L(h)(x)=B((hₙ(x))ₙ).

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is finite projective over Â, hence flat; it need not be finite over A. No noetherian, local or discriminant hypothesis.

One proof uses the following inputs and comparisons. For each x use the native compatible tensor section. Finite-projection separation proves additivity, R-linearity in x, and Â-linearity in h from the corresponding finite-level laws. No completed coefficient action on L is needed.

The construction has the following API.

- Under coefficient convention C2. For h∈H_L and x∈L, Pₙ(A_L(h)(x))=hₙ(x).
- Under coefficient convention C2. For f∈Hom_R(L,T), A_L(C_L(f))=f.
- Under coefficient convention C2. For h∈H_L, C_L(A_L(h))=h.
- Under coefficient convention C2. For an R-module K, an R-linear map b:K→L, h∈H_L and k∈H_K with kₙ(x)=hₙ(b(x)) for every n,x, A_K(k)=A_L(h)∘b.

**Checks.**

- Under coefficient convention C2. For the actual section ideal J, assembling the projection of any R-linear map J→T recovers that map.
- Under coefficient convention C2. For D=Hom_R(J,R), projecting the assembly of every compatible family D→Qₙ⊗_Â N recovers that family.
- Under coefficient convention C2. For every R-linear b:K→L and families k,h satisfying kₙ(x)=hₙ(b(x)), assembly commutes with precomposition by b.

(The construction-specific inputs are [compatible quotient hom families](#2119-compatible-quotient-hom-families), [assembly of native compatible tensor sections](#2205-assembly-of-native-compatible-tensor-sections), [finite projections separate completed tensors](#2174-finite-projections-separate-completed-tensors), [original-ring scalar in tensor evaluations](#2149-original-ring-scalar-in-tensor-evaluations).)

*Needs:* [compatible quotient hom families](#2119-compatible-quotient-hom-families), [assembly of native compatible tensor sections](#2205-assembly-of-native-compatible-tensor-sections), [finite projections separate completed tensors](#2174-finite-projections-separate-completed-tensors), [original-ring scalar in tensor evaluations](#2149-original-ring-scalar-in-tensor-evaluations), `TensorProduct`.

### 2.214 Positive-degree exactness of the native Hom complex

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native C_e satisfies HomologicalComplex.ExactAt at n+1. This is categorical exactness of its actual R-module short complex.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Use the native successor differential formula at n and n+1. Apply native exactAt_iff with the actual predecessor n and successor n+2. Use moduleCat_exact_iff to transport the actual kernel/image witnesses, without replacing the complex or its modules.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `HomologicalComplex.ExactAt.isZero_homology` in `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`, line 696, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407. The construction-specific inputs are [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex), [the native successor differential](#2210-the-native-successor-differential), [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact).)

*Needs:* [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex), [the native successor differential](#2210-the-native-successor-differential), [every adjacent section hom pair is exact](#2194-every-adjacent-section-hom-pair-is-exact), `HomologicalComplex.ExactAt`, `HomologicalComplex.exactAt_iff'`, `CategoryTheory.ShortComplex.moduleCat_exact_iff`.

### 2.215 Categorical Hom cochains of the section resolutions

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). Construct the actual native ModuleCat R isomorphism C(e).linearYonedaObj R (R⊗_A M) ≅ H(e,M). In every degree it sends a categorical morphism h:F→R⊗_A M to its underlying R-linear map h.hom; its inverse is ModuleCat.ofHom. The differential squares commute with precomposition by B(e,n), including degree zero.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

The construction has the following API.

- In every degree n, the forward component of the categorical Hom-cochain comparison sends h:C(e)_n→R⊗_A M to the actual linear map h.hom. Use the native termwise module identifications; the component equation is equality of the resulting linear maps.
- In every degree n the inverse component is exactly ModuleCat.ofHom composed with ModuleCat.homLinearEquiv.symm, as a native categorical map from the R-linear Hom module. The component equality is taken after the specified native termwise identifications.

**Checks.**

- The forward comparison in every degree sends an actual categorical morphism to its R-linear map, after the native termwise identifications, including degree zero.
- The inverse followed by the forward comparison has the identity component in every degree of the actual Hom cochain.
- Every A-linear coefficient map gives the stated Hom-comparison naturality square in every degree.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex), [the native successor differential](#2210-the-native-successor-differential).)

*Needs:* [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [the native polynomial section hom cochain complex](#2206-the-native-polynomial-section-hom-cochain-complex), [the native successor differential](#2210-the-native-successor-differential), `ChainComplex.linearYonedaObj`, `HomologicalComplex.Hom.isoOfComponents`, `ModuleCat.homLinearEquiv`, `LinearEquiv.toModuleIso`.

### 2.216 Vanishing positive cohomology of the native Hom complex

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native homology object C_e.homology(n+1) is a zero object in ModuleCat R. No assertion of higher Ext is made until these complexes are identified with native Hom applied to the augmented projective resolutions.

Here A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

One proof uses the following inputs and comparisons. Apply native ExactAt.isZero_homology in the abelian category of R-modules.

Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

([knudsen2012](#references), §3 Key Example, the exact matrix-factorization sequences preceding and in Proposition 3.1; §4 identifies completion/descent as separate inputs.; Deduction using `HomologicalComplex.ExactAt.isZero_homology` in `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`, line 696, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407. The construction-specific inputs are [positive-degree exactness of the native hom complex](#2214-positive-degree-exactness-of-the-native-hom-complex).)

*Needs:* [positive-degree exactness of the native hom complex](#2214-positive-degree-exactness-of-the-native-hom-complex), `HomologicalComplex.ExactAt.isZero_homology`.

### 2.217 Derived-functor Ext of the actual section ideal

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 construct a native R-module isomorphism between the derived-functor Ext module Ext^n_R(J,N), Mathlib's root-namespace bifunctor `Ext` evaluated contravariantly at J and covariantly at N, and H(false,M).homology n, by the Ext comparison of the two-periodic resolution of J followed by homology of the categorical Hom-cochain comparison. This `Ext` is the left-derived linear Yoneda bifunctor, not a new carrier and not the localization-defined `CategoryTheory.Abelian.Ext`.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

The construction has the following API.

- The forward and inverse maps of the derived-functor Ext comparison for J compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.
- The forward comparison sends the zero native Ext element to zero cohomology in every degree.

**Checks.**

- The ideal Ext comparison round-trips an arbitrary actual degree-zero Ext element; positive vanishing is not falsely extended to degree zero.
- For A=Z, γ=1,δ=0,s=1,t=0 and the non-flat coefficient module M=Z/2, the actual derived-functor Ext^3(J,R⊗_Z M) module is zero.
- For the zero coefficient ring A=Z/1 and M=A, the actual ideal derived-functor Ext^1 module is zero; no Nontrivial hypothesis is introduced.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.isoExt` in `Mathlib/CategoryTheory/Abelian/Ext.lean`, line 68, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution), [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions).)

*Needs:* [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution), [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions), `CategoryTheory.ProjectiveResolution.isoExt`, `HomologicalComplex.homologyFunctor`, `Ext`.

### 2.218 Derived-functor Ext of the actual section dual

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 construct a native R-module isomorphism between the derived-functor Ext module Ext^n_R(D,N), Mathlib's root-namespace bifunctor `Ext` evaluated contravariantly at D and covariantly at N, and H(true,M).homology n, by the Ext comparison of the two-periodic resolution of D followed by homology of the categorical Hom-cochain comparison. Its alternating phase is the actual dual resolution, not the ideal phase.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

The construction has the following API.

- The forward and inverse maps of the derived-functor Ext comparison for D compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.
- The forward comparison sends the zero native Ext element to zero cohomology in every degree.

**Checks.**

- The dual Ext comparison round-trips every actual degree-zero Ext element.
- For the nonreduced base A=Z/4, γ=δ=t=0,s=1 and M=A, the actual dual derived-functor Ext^2 module is zero.
- For A=Z, γ=1,δ=0,s=1,t=0 and M=Z/2 without flatness, the actual dual derived-functor Ext^1 module is zero.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.isoExt` in `Mathlib/CategoryTheory/Abelian/Ext.lean`, line 68, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution), [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions).)

*Needs:* [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution), [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions), `CategoryTheory.ProjectiveResolution.isoExt`, `HomologicalComplex.homologyFunctor`, `Ext`.

### 2.219 Coefficient naturality of the categorical Hom comparison

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every A-linear coefficient map f:M→M′, every e,n and actual categorical h:C(e)_n→R⊗_A M, the forward Hom-comparison component applied to h followed by id_R⊗f is exactly the underlying map (id_R⊗f)∘h.hom. These are all degreewise naturality squares of the actual Hom-complex comparison. No naturality assertion for an unconstructed geometric or completed-family Ext comparison is inferred.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions).)

*Needs:* [categorical hom cochains of the section resolutions](#2215-categorical-hom-cochains-of-the-section-resolutions), `TensorProduct.AlgebraTensorModule.map`.

### 2.220 Positive derived-functor Ext vanishing for the section ideal

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 the derived-functor Ext module Ext^(n+1)_R(J,R⊗_A M), Mathlib's root-namespace `Ext` as opposed to `CategoryTheory.Abelian.Ext`, is a zero object. Transport the zero positive cohomology through the actual section-ideal Ext isomorphism.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.isoExt` in `Mathlib/CategoryTheory/Abelian/Ext.lean`, line 68, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [derived-functor ext of the actual section ideal](#2217-derived-functor-ext-of-the-actual-section-ideal), [vanishing positive cohomology of the native hom complex](#2216-vanishing-positive-cohomology-of-the-native-hom-complex).)

*Needs:* [derived-functor ext of the actual section ideal](#2217-derived-functor-ext-of-the-actual-section-ideal), [vanishing positive cohomology of the native hom complex](#2216-vanishing-positive-cohomology-of-the-native-hom-complex), `CategoryTheory.Limits.IsZero.of_iso`.

### 2.221 Positive derived-functor Ext vanishing for the section dual

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 the derived-functor Ext module Ext^(n+1)_R(D,R⊗_A M), Mathlib's root-namespace `Ext` as opposed to `CategoryTheory.Abelian.Ext`, is a zero object. Use the dual resolution and the corresponding actual Hom phase.

Here A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

One proof uses the following inputs and comparisons. Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

The two native Mathlib Ext definitions are distinguished, with both positive vanishing statements proved separately. Degree zero is included in the isomorphisms, not asserted to vanish. Signed ideal/dual phases and actual R-actions are retained.

([knudsen2012](#references), arXiv:1106.1588v2 §3 Key Example, Proposition 3.1 and Corollary 3.2; §4 separates completed-local descent.; Deduction using `CategoryTheory.ProjectiveResolution.isoExt` in `Mathlib/CategoryTheory/Abelian/Ext.lean`, line 68, and `ModuleCat.homLinearEquiv` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 407, and `HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498. The construction-specific inputs are [derived-functor ext of the actual section dual](#2218-derived-functor-ext-of-the-actual-section-dual), [vanishing positive cohomology of the native hom complex](#2216-vanishing-positive-cohomology-of-the-native-hom-complex).)

*Needs:* [derived-functor ext of the actual section dual](#2218-derived-functor-ext-of-the-actual-section-dual), [vanishing positive cohomology of the native hom complex](#2216-vanishing-positive-cohomology-of-the-native-hom-complex), `CategoryTheory.Limits.IsZero.of_iso`.

### 2.222 Actual relative Hom and compatible quotient Homs

Under coefficient convention C2. Construct E_L:Hom_R(L,T)≃ₗ[Â]H_L with forward map C_L and inverse A_L, for finite projective N.

Native A,N,L,K have a common universe with compatible A/Â-actions on N. Here N is finite projective over Â, hence flat; it need not be finite over A. No noetherian, local or discriminant hypothesis.

One proof uses the following inputs and comparisons. Apply native LinearEquiv.ofLinearMap to the proved two inverse composite identities.

The construction has the following API.

- Under coefficient convention C2. For every f,n,x, (E_L(f))ₙ(x)=Pₙ(f(x)).
- Under coefficient convention C2. For h∈H_L, Pₙ(E_L⁻¹(h)(x))=hₙ(x).
- Under coefficient convention C2. E_L⁻¹(E_L(f))=f.
- Under coefficient convention C2. E_L(E_L⁻¹(h))=h.

**Checks.**

- Under coefficient convention C2. For L=J, forward equivalence evaluation equals Pₙ(f(j)) for each actual section-ideal element j.
- Under coefficient convention C2. For L=D, inverse equivalence followed by the n-projection at d gives hₙ(d).
- Under coefficient convention C2. For every R-linear f:L→T, forward followed by inverse equivalence recovers f.
- Under coefficient convention C2. For every h∈H_L, inverse followed by forward equivalence recovers h.

(The construction-specific inputs are [ring-linear assembly of compatible Hom families](#2213-ring-linear-assembly-of-compatible-hom-families).)

*Needs:* [ring-linear assembly of compatible Hom families](#2213-ring-linear-assembly-of-compatible-hom-families), `TensorProduct`, `LinearEquiv.ofLinearMap`.

### 2.223 Positive derived Ext of the section ideal into its ring

Under coefficient convention C8. For every n≥0, the derived-functor Ext module Ext^(n+1)_R(J,R), Mathlib's root-namespace `Ext` as opposed to `CategoryTheory.Abelian.Ext`, is a zero R-module object.

No noetherianity, reducedness, nonzero coefficient ring or unit discriminant is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Specialize coefficient-module vanishing for J to M=A. Apply the actual Ext functor to the native R-linear tensor-unit isomorphism R⊗_A A≃R. Transport IsZero along the inverse of that image isomorphism. Keep the R-action, variance and universe unchanged.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

**Checks.**

- Under coefficient convention C8. For A=ℤ/1 and γ=δ=s=t=0, native derived Ext¹_R(J,R) is zero.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [positive derived-functor ext vanishing for the section ideal](#2220-positive-derived-functor-ext-vanishing-for-the-section-ideal), `TensorProduct.AlgebraTensorModule.rid`, `LinearEquiv.toModuleIso`, `CategoryTheory.Functor.mapIso`, `CategoryTheory.Limits.IsZero.of_iso`.

### 2.224 Positive derived Ext of the section dual into its ring

Under coefficient convention C8. For every n≥0, the derived-functor Ext module Ext^(n+1)_R(D,R), Mathlib's root-namespace `Ext` as opposed to `CategoryTheory.Abelian.Ext`, is a zero R-module object.

No noetherianity, reducedness, nonzero coefficient ring or unit discriminant is assumed. Ext vanishing is only in positive degrees.

One proof uses the following inputs and comparisons. Specialize coefficient-module vanishing for D to M=A. Apply the actual Ext functor to the native R-linear tensor-unit isomorphism R⊗_A A≃R. Transport IsZero along the inverse of that image isomorphism. Keep the R-action, variance and universe unchanged.

Use the actual ideal subtype, native R-duals and R-module tensor action. No private stable-reflexivity predicate or replacement Ext carrier is introduced. This polynomial calculation does not supply the two-base completion comparison, pointed formal hull or family/sheaf descent.

**Checks.**

- Under coefficient convention C8. For A=ℤ/4, γ=δ=s=t=0, native derived Ext²_R(D,R) is zero.

([knudsen2](#references), Appendix Definition 1 and Theorem 2(1), printed191–193; Proposition 6 printed194–195; [ile](#references), arXiv 1110.3909v3 §3 Definition 3.1 and Remark 3.6, PDF pp. 6–8.)

*Needs:* [positive derived-functor ext vanishing for the section dual](#2221-positive-derived-functor-ext-vanishing-for-the-section-dual), `TensorProduct.AlgebraTensorModule.rid`, `LinearEquiv.toModuleIso`, `CategoryTheory.Functor.mapIso`, `CategoryTheory.Limits.IsZero.of_iso`.

### 2.225 Stably reflexive module

For a commutative ring R and an R-module M, stable reflexivity means that the native evaluation M→M** is bijective and Ext_R^i(M,R)=Ext_R^i(M*,R)=0 for every i>0, where M*=Hom_R(M,R). The predicate itself imposes no finiteness; it is `IsStablyReflexive`, with Ext the native `Ext R (ModuleCat R)` in positive degrees. The finite Noetherian theory below adds those hypotheses explicitly. On finite modules over a Noetherian R this agrees with the existing finitely generated Gorenstein-projective predicate; no second complete-resolution or Gorenstein-projective object is defined here.

Here R is commutative; M is an R-module.

One proof uses the following inputs and comparisons. Conjoin the existing reflexivity predicate with categorical vanishing of the two actual positive Ext families. Use native ModuleCat Ext objects; identify their zero objects with vanishing of the underlying module. In the finite Noetherian case, splice the two finite free resolutions to compare with the imported Gorenstein-projective predicate; in the other direction its totally acyclic complex gives the two Ext vanishings and canonical biduality. This is a compatibility theorem, not a new complete-resolution infrastructure.

The bidual map must be canonical evaluation. Both positive Ext families, at every degree, are required.

The construction has the following API.

- Stable reflexivity implies Mathlib Module.IsReflexive R M, and the induced equivalence is native evaluation.
- Extract each of the two positive-degree Ext vanishings separately.
- Every finite projective R-module is stably reflexive.
- An R-linear equivalence M≃N preserves and reflects stable reflexivity, with natural evaluation squares.
- If R is Noetherian and M finite stably reflexive, M* is finite stably reflexive and M** identifies canonically with M.
- For finitely many finite modules over a Noetherian R, their direct sum is stably reflexive exactly when each summand is.
- For a finite module over a commutative Noetherian R, absolute stable reflexivity is equivalent to the existing StablePeriodicCurved Layer 2 Gorenstein-projective predicate. Use the pinned TauCeti.IsGorensteinProjective for the finite comparison. Identify the cycle and cokernel conventions by an explicit degree-one shift.

**Checks.**

- Over Z/4Z the rank-two free module satisfies the predicate; nilpotents in R do not exclude it.
- The zero module is stably reflexive over every commutative ring, including the zero ring.
- Z/2Z as a Z-module is not stably reflexive: its Z-dual is zero, so evaluation to its bidual is not injective.
- For R=k[x,y]_(x,y)/(xy), the maximal ideal (x,y) is stably reflexive by the alternating resolutions of §§2.188–2.189 and the bidual calculation of §2.186, but is not free or projective: its minimal number of generators is two, while it has rank one on either branch.

([ile](#references), Definition 3.1 and Remark 3.2, §3, p. 6. Defines absolute stable reflexivity; for finite modules over Noetherian rings it agrees with Gorenstein dimension zero.; [ile](#references), Remark 3.2, p. 6; Proposition 4.3, pp. 9–10. The finite Noetherian absolute theory has Gorenstein dimension zero and a complete projective hull; this identifies it with the imported cycle description.)

*Needs:* `Module.IsReflexive`, `Ext`, StablePeriodicCurved Layer 2.

### 2.226 Relative stable reflexivity

For a flat commutative ring map A→R and an R-module M, relative stable reflexivity means: M is flat over A and for each s in the image of MaxSpec R→Spec A, M_s=M⊗_A κ(s) is absolutely stably reflexive over R_s=R⊗_A κ(s). The image consists of contractions of maximal ideals of R, not necessarily maximal ideals of A. The predicate imposes no hidden finiteness. It is `IsRelativelyStablyReflexive`, where the fibre M⊗_A κ(s) is written as the base change of M to R⊗_A κ(s).

Here A→R is flat.

One proof uses the following inputs and comparisons. Use native module flatness and actual scalar extension to residue fields. Take all coefficient points hit by maximal chart ideals; the local specialization is the one closed coefficient fibre.

Do not test only maximal ideals of A in the nonlocal version. A-flatness of M is part of the definition, not inferred from geometric flatness of R.

The construction has the following API.

- Extract A-flatness of M.
- Extract absolute stable reflexivity of M_s for every s hit by a maximal R-ideal.
- For a local map of local rings, the predicate is exactly A-flatness together with stable reflexivity of the closed fibre.
- For Noetherian A,R and finite M, the predicate is equivalent to the two canonical coefficient Hom isomorphisms and both positive Ext vanishings for every A-module.
- Under the finite Noetherian source hypotheses, every A→A′ preserves relative stable reflexivity, with canonical dual and bidual identifications.
- For Noetherian A,R and finite relative stably reflexive M, its R-dual is finite, A-flat and relatively stably reflexive.
- For Noetherian R and finite M relative to R→R, this predicate is equivalent to M being finite projective; its absolute specialization relative to a field remains strictly weaker than projectivity over R.

**Checks.**

- For finite M over a Noetherian A with R=A, relative stable reflexivity is finite projectivity: coefficient flatness is essential.
- For A=R=Z_(2), M=A/(2) fails the predicate although every residue-field fibre is a finite-dimensional vector space.
- Over a field k, the ideal (x,y) in k[x,y]_(x,y)/(xy) is relatively stably reflexive and is not projective over the nodal chart.
- For A=k[t]_(t), R=k(t), the maximal ideal of R contracts to (0); the definition tests its generic coefficient fibre, even though no maximal ideal of A is hit.

([ile](#references), Definition 3.4, §3, p. 6. Specifies flatness and the fibres over the image of maximal chart ideals.; [knudsen2](#references), Appendix, Definition 1 and Theorem 2, pp. 191–194. Supplies the equivalent universal-coefficient formulation in the finite Noetherian setting.)

*Needs:* `Module.Flat`, [stably reflexive module](#2225-stably-reflexive-module).

### 2.227 Universally acyclic complete hull

For Noetherian A,R, a flat map A→R, and finite relatively stably reflexive M, choose the existing StablePeriodicCurved Layer 2 finite-projective complete complex E with augmentation M≃coker(d_E^(-1)) and the additional coefficient-universality property below. Put (E∨)^i=Hom_R(E^(1−i),R) and d_(E∨)^i=(d_E^(−i))*; there is no alternating sign in this shifted-dual convention. Both E⊗_A N and E∨⊗_A N are exact for every A-module N. Every cycle of E and E∨ is finite over R and flat over A. This is an existence theorem with comparison maps, not a preferred resolution functor. Its underlying complex is the imported totally acyclic complex. Because M=coker d^(−1)≃Z¹(E), E shifted by one has the supplier cycle convention M≃Z⁰(E[1]); the shifted dual here is an explicit reindexing of its ordinary dual.

Here A,R are Noetherian; R is A-flat; M is finite over R and relatively stably reflexive.

One proof uses the following inputs and comparisons. Use the imported finite-projective totally acyclic complex and complete-resolution comparison infrastructure. For the relative existence theorem, splice finite free resolutions of M and M* through evaluation; the new content is universal exactness over A and A-flat cycles, not definition of an ordinary complete resolution. Apply the fibre/coefficient criterion to E and its shifted dual. Exactness after every coefficient tensor makes each short exact sequence of cycles universally exact. Flatness of the finite projective terms over A and the Tor exact sequences give A-flatness of all cycles; finite generation follows from Noetherianity. Record the finite-projective dual-tensor isomorphisms before comparing E∨ with the dual of a base-changed complex.

Coker degree −1, not a randomly chosen homology group, is M. All coefficient modules and both complexes must be tested.

The construction has the following API.

- Retain a specified equivalence coker d^(-1)≃M; exactness identifies it with im d^0.
- The dual has term Hom_R(E^(1−i),R), differential precomposition by d^(−i), and canonical double-dual comparison.
- For every A-module N both tensor complexes are exact; no flatness of N is assumed.
- Each cycle in either complex is a finite R-module flat over A.
- Finite projectivity identifies E∨⊗_A A′ with (E⊗_A A′)∨ canonically; the tensor hull augments to M⊗_A A′.
- A module isomorphism lifts to comparison maps of complete projective hulls, unique up to homotopy when the augmentation is fixed; no strict choice-independence of a chosen complex is asserted.
- Forgetting coefficient-universality gives the existing total-acyclicity predicate, with finiteness on every term. The augmentation identifies M with Z¹(E), hence with the supplier Z⁰ of E[1]; no alternate Gorenstein-projective type is introduced.

**Checks.**

- For finite projective M, the two-term identity complex E^0=M→E^1=M, zero elsewhere, is an exact hull with coker d^(−1)=M. Its shifted dual is the identity complex on M* in degrees 0 and 1; an isomorphism M≅M* is not asserted.
- For this two-term hull the shifted dual again occupies degrees 0 and 1; an unshifted dual instead occupies degrees −1 and 0 and fails the pinned convention.
- Over R=ℤ[ω] with ω²−ω+6=0 and the invertible ideal I=(2,ω), the identity disk on I is a hull of I whose shifted dual is the identity disk on I*≅I⁻¹. Since I·(2,1−ω)=(2) while I²≠(2) (modulo 2, ω²=ω≠0, and ω²∈I²), the class of I has order three and I≄I⁻¹: the two disks are homotopy equivalent complexes of projectives but not termwise isomorphic, so termwise self-duality is not part of the hull property.
- A projective resolution of Z/2Z over Z placed in degrees ≤0 is not a complete hull: it has nonzero degree-zero homology, and its dual detects Ext^1_Z(Z/2Z,Z).
- Tensor the nodal alternating hull of §§2.188–2.189 over a polynomial coefficient A with N=A/(a), for a nonzero nonunit coefficient a; both complexes remain exact even though N need not be A-flat.
- Over a field, add an identity disk on an infinite-dimensional vector space in degrees 3 and 4 to the finite two-term hull of k. The degree-zero cokernel stays k and both complexes stay acyclic, but the result is rejected because those two terms are not finite projective.

([ile](#references), Definition 4.1, Proposition 4.3 and Remark 4.4, §4, pp. 9–10. Splicing the module and dual resolutions gives a complete hull; its tensor and shifted-dual tensor complexes are exact.; [knudsen2](#references), Appendix, Theorem 2(2), pp. 192–194, knudsen2 line 977. Uses a doubly infinite finite locally free complex and its dual with universal coefficient acyclicity.)

*Needs:* `CategoryTheory.ProjectiveResolution.isoExt`, DeformationAndDerivedPatchingAlgebra §3.3, StablePeriodicCurved Layer 2, [relative stable reflexivity](#2226-relative-stable-reflexivity).

### 2.228 Universal coefficient criterion

For Noetherian A,R, A→R flat, and M finite over R, relative stable reflexivity is equivalent to the following for every A-module N: α_N:M*⊗_A N→Hom_R(M,R⊗_A N), f⊗n↦(m↦f(m)⊗n), and β_N:M⊗_A N→Hom_R(M*,R⊗_A N), m⊗n↦(f↦f(m)⊗n), are isomorphisms, and Ext_R^i(M,R⊗_A N)=Ext_R^i(M*,R⊗_A N)=0 for every i>0. It is also equivalent to existence of a universally acyclic complete hull. In particular M and M* are A-flat and M→M** is canonical evaluation. The Hom-exchange and Ext conditions for every A-module N form `HasUniversalCoefficients`, and the first equivalence is `relativelyStablyReflexive_iff_universalCoefficients` (Ile, Definition 3.4, Proposition 3.5 and Remark 3.6, ile lines 286–365). For the pointed section ideal, `pointedSection_universalCoefficients` states these conditions over every commutative A, with no Noetherian hypothesis; they are the two coefficient tensor–Hom equivalences and the two positive Ext vanishings for J and D proved above.

Noetherian A,R; R A-flat; M finite over R.

One proof uses the following inputs and comparisons. For the fibre definition, use the coefficient cohomology/base-change criterion on finite projective presentations and both resolution complexes; filtered colimits extend finite coefficients to every N. Identify β_N with canonical bidual evaluation followed by the first Hom exchange for M*. Conversely the two exchange maps force M* and M to be A-flat by the same coefficient criterion; change-of-rings for their flat fibres gives biduality and both fibre Ext vanishings. The complete-hull characterization is the splicing theorem and the converse obtained by reading Hom cohomology of the two halves.

β_N is evaluation, not an arbitrary isomorphism between modules. Prove the converse without assuming flatness of M beforehand. Native Ext agrees with the explicit projective resolutions.

([ile](#references), Proposition 3.5, Remark 3.6, pp. 6–8; Proposition 4.3 and Remark 4.4, pp. 9–10. Proves the fibre, universal Hom/Ext and complete-hull characterizations with the Noetherian/coherent hypotheses.; [knudsen2](#references), Appendix, Theorem 2, pp. 192–194, knudsen2 line 977. Three equivalent relative stable-reflexivity criteria.)

*Needs:* DeformationAndDerivedPatchingAlgebra §3.3, [relative stable reflexivity](#2226-relative-stable-reflexivity), [universally acyclic complete hull](#2227-universally-acyclic-complete-hull).

### 2.229 Faithfully flat reflection of stable reflexivity

Let A,R,T be Noetherian, R flat over A, T flat over R, and M finite over R. Relative stable reflexivity of M over A implies relative stable reflexivity of T⊗_R M over A. If R→T is faithfully flat the converse holds. Absolute stable reflexivity has the same preservation/reflection statement for Noetherian R,T and finite M. Canonical duals and all coefficient Hom/Ext comparison maps are obtained by tensoring finite free resolutions, not by assuming Hom commutes with an inverse limit.

Noetherian rings as displayed; M finite over R; faithful flatness required only for reflection.

One proof uses the following inputs and comparisons. Use degreewise finite free resolutions to compare Hom and Ext after the flat chart extension R→T; compare M* and its bidual by finite-presentation flat Hom base change. For each A-module N identify T⊗_R(R⊗_A N) with T⊗_A N. Flat tensor commutes with homology; faithful flat tensor detects the kernel and cokernel of α_N, β_N and each positive Ext module. Apply the coefficient criterion; the absolute case uses the same calculation with target R and its dual.

A flat map alone gives no reflection; include R→0 as a failure test. The all-N assertion uses degreewise finite free terms, not a bounded resolution assumption.

([knudsen2](#references), Appendix, Proposition 5 and Proposition 6, pp. 194–195. Localizes the relative condition and compares it with completion.; [ile](#references), Remark 3.6, pp. 7–8, and Proposition 4.3, pp. 9–10. Universal-coefficient and complete-resolution criteria yield the displayed ambient flat change and reflection.; [stacks-completion](#references), Algebra Lemma 10.97.3, tag 00MC. Provides the faithful flatness needed when the ambient extension is maximal-ideal completion.)

*Needs:* `CategoryTheory.ProjectiveResolution.isoExt`, DeformationAndDerivedPatchingAlgebra §3.3, [universal coefficient criterion](#2228-universal-coefficient-criterion).

### 2.230 Knudsen completion theorem

Let (A,p)→(R,m) be a flat local homomorphism of Noetherian local rings and M a finite R-module. Write Â=lim A/p^n, R̂=lim R/m^n and M̂=R̂⊗_R M, with the continuous local map Â→R̂. Then R̂ is flat over Â, and the following are equivalent: M is relatively stably reflexive over A; M̂ is relatively stably reflexive over A; M̂ is relatively stably reflexive over Â. These statements use all A-modules and all Â-modules in their respective universal criteria. In each case M̂*=R̂⊗_R M* canonically.

Here A→R flat and local; A,R Noetherian local; M finite over R; both completions are at the displayed maximal ideals.

One proof uses the following inputs and comparisons. Faithfully flat R→R̂ gives equivalence of the first two conditions and identifies the completed dual by finite-presentation flat Hom base change. Flat A→Â has the same residue field k. For any Â-module B, a free A-resolution of k tensored with Â gives Tor_1^Â(k,B)≃Tor_1^A(k,B). Apply the local Tor criterion to the finite R̂-module B=R̂; its A-flatness proves Â-flatness of R̂. For the second condition take an A-universally acyclic finite projective R̂-hull. Its cycles and shifted-dual cycles are finite R̂-modules and A-flat. Apply the same Tor comparison and local Tor criterion to each cycle, proving Â-flatness. Their short exact cycle sequences stay exact after tensor with every Â-module, so the hull is Â-universal. In the reverse direction a hull universal over Â has Â-flat cycles; restricting along the flat A→Â makes its cycles A-flat, hence makes both complexes universal over A. This supplies the needed completion input by a public local-flatness proof. It does not infer any ordinary tensor/limit interchange for arbitrary completed coefficients.

The map Â→R̂ must be the continuous extension of A→R; an Â-algebra structure on R̂ that restricts to A→R and is local is that extension, since a local homomorphism between Noetherian local rings is adic-continuous, the image of A is dense in Â, and R̂ is separated. Here M̂ is the m-adic completion of M, which for finite M over Noetherian R is R̂⊗_R M by the finite Noetherian completion equivalence. The flatness of R̂ over Â and the three-way equivalence are `relativelyStablyReflexive_iff_completion`, stated on the native maximal-ideal completions with the Â-algebra structure on R̂ and the Â-module structure on M̂ taken as data pinned by those scalar-tower and locality laws. Check the cycle argument for every integer degree and the shifted dual. No finite-projectivity assumption on completed coefficient modules is allowed.

**Checks.**

- For A=R=ℤ_(2) and M=R: Â=R̂=ℤ₂ and M̂=ℤ₂; R̂ is flat over Â, and all three relative conditions hold, each with value true.
- For A=R=ℤ_(2) and M=R/(2): M̂=ℤ₂/(2)=𝔽₂ is flat neither over ℤ_(2) nor over ℤ₂, so all three conditions are false together; a version of the theorem that only transferred the condition from M to M̂ without the converse would not be refuted here, so the next instance tests the Â-side.
- For A=ℤ_(2), R=ℤ_(2)[x]_(2,x) and M=R/(x)≅ℤ_(2): M is A-flat, but its fibre over 𝔽₂ is the residue field 𝔽₂ of the discrete valuation ring 𝔽₂[x]_(x), whose Ext¹ into that ring is 𝔽₂≠0; so M is not relatively stably reflexive. Its completion M̂=ℤ₂ over R̂=ℤ₂[[x]] has fibre 𝔽₂ over 𝔽₂[[x]] with the same nonzero Ext¹, so both completed conditions are false as well. Flatness of M over A does not suffice, on either side of the completion. For A=R=k a field with M=kʳ, the completions are k and the three conditions coincide with finite-dimensionality.

([knudsen2](#references), Appendix, Proposition 6, pp. 194–195. States the three-way equivalence with both coefficient and chart completion; cites Bourbaki rather than supplying this argument.; [ile](#references), Proposition 4.3 and Remark 4.4, pp. 9–10. Supplies the universally acyclic hull and its flat cycle characterization used here.; [stacks-completion](#references), Algebra Lemma 10.99.7, tag 00MK. The local Tor test applies to a finite module over the Noetherian local target; it applies to every completed chart cycle.)

*Needs:* SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `AdicCompletion.residueField_map_bijective`, DeformationAndDerivedPatchingAlgebra §3.3, [faithfully flat reflection of stable reflexivity](#2229-faithfully-flat-reflection-of-stable-reflexivity), [universally acyclic complete hull](#2227-universally-acyclic-complete-hull), [universal coefficient criterion](#2228-universal-coefficient-criterion).

### 2.231 Relative reflexivity of the polynomial section ideal

For the monic polynomial nodal model R=A[X,Y]/(q(X,Y)−q(s,t)) of §§2.1–2.224, J=(x−s,y−t), with A Noetherian, the actual ideal J and its actual dual D are relatively stably reflexive over A. The two canonical coefficient Hom maps are exactly the maps of §§2.186 and 2.193, and their native positive Ext groups vanish against R⊗_A N for every A-module N. Flat local chart extensions and both local completions have the corresponding relative conclusions. The polynomial identities of §§2.1–2.224 over arbitrary A, including the zero ring, retain their original non-Noetherian scope.

Here A Noetherian for the relative criterion; q=X²+γXY+δY² as in §2.1; no condition that δ be a unit.

One proof uses the following inputs and comparisons. Read the maps of §§2.186 and 2.193 on pure tensors and verify that the second is the canonical coefficient-valued evaluation β_N. Read the augmented finite-free resolutions of §§2.188–2.189 and the Ext comparisons of §§2.217–2.224, retaining arbitrary coefficient N. Apply the relative criterion once; use the flat reflection and completion theorems for their stated local extensions.

The ideal and dual are the native submodule and Hom module, not modules defined from a matrix cokernel alone. Keep the polynomial theorem over non-Noetherian A distinct from the finite Noetherian relative criterion.

([knudsen2012](#references), Proposition 3.1 and Corollary 3.2, §3, pp. 11–13. Computes the actual section ideal and dual and then passes to complete local rings.; [ile](#references), Remark 3.6, pp. 7–8. Matches the canonical Hom and Ext calculations of §§2.186–2.224 with relative stable reflexivity.)

*Needs:* [universal coefficient criterion](#2228-universal-coefficient-criterion), [faithfully flat reflection of stable reflexivity](#2229-faithfully-flat-reflection-of-stable-reflexivity), [knudsen completion theorem](#2230-knudsen-completion-theorem), [coefficient flatness of the section ideal](#279-coefficient-flatness-of-the-section-ideal), [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [coefficient tensor–hom equivalence for the dual](#2193-coefficient-tensorhom-equivalence-for-the-dual), [coefficient-valued bidual equivalence](#2186-coefficient-valued-bidual-equivalence), [positive derived-functor ext vanishing for the section ideal](#2220-positive-derived-functor-ext-vanishing-for-the-section-ideal), [positive derived-functor ext vanishing for the section dual](#2221-positive-derived-functor-ext-vanishing-for-the-section-dual).

### 2.232 Base change for relative stable reflexivity

Under the finite Noetherian hypotheses of the universal coefficient criterion, let A→A′ be any ring map, R′=R⊗_A A′ and M′=M⊗_A A′. Then M′ and (M′)* are flat over A′, M′ is relatively and absolutely stably reflexive over R′, and M*⊗_A A′≃Hom_(R′)(M′,R′). Both canonical Hom exchange maps and both positive Ext vanishings hold for every A′-module N′. No Noetherianity or coherence is required of A′ or R′.

Here A,R Noetherian; R A-flat; M finite relative stably reflexive; A′ arbitrary.

One proof uses the following inputs and comparisons. Base change the complete hull term by term; its finite projective terms have canonical dual-tensor identifications. For any A′-module N′, associativity identifies each new tensor complex with the original one tensored over A with N′. Read the two Hom maps and Ext groups from its augmented halves, and apply again with N′ equal to residue fields.

Include nonflat A′ and nonflat N′. The dual map sends f⊗a′ to m⊗b′↦f(m)⊗a′b′; identity and composition squares commute.

([ile](#references), Proposition 3.5(i)–(iii), pp. 6–7; Proposition 4.3(ii)(b), pp. 9–10. Allows arbitrary coefficient-ring and coefficient-module changes from the Noetherian source.; [knudsen2](#references), Appendix, Proposition 4, p. 194. Relative stable reflexivity is preserved by coefficient base change, including its canonical dual comparison.)

*Needs:* [universal coefficient criterion](#2228-universal-coefficient-criterion), [universally acyclic complete hull](#2227-universally-acyclic-complete-hull).

### 2.233 Section ideal of a local Gorenstein family

Let (A,p)→(R,m) be a flat local map of Noetherian local rings with a retraction R→A whose composite is the identity, and suppose R/pR is a one-dimensional Gorenstein local ring. For J=ker(R→A), J is relatively stably reflexive over A. Multiplication embeds R in J*=Hom_R(J,R), and J*/R is free of rank one over A, supported on the section. Its generator is a choice, not a canonical trivialization. Duals and this exact quotient commute with arbitrary coefficient base change. In particular this applies at every smooth or nodal point of a section of a Noetherian nodal family.

Local flat Noetherian coefficient map with a specified section retraction; one-dimensional Gorenstein closed chart fibre.

One proof uses the following inputs and comparisons. The exact sequence 0→J→R→A→0 makes J A-flat. On the closed fibre its maximal ideal is maximal Cohen–Macaulay over a one-dimensional Gorenstein ring, hence has canonical biduality and both positive dual Ext vanishings. Apply the relative fibre criterion. The Hom long exact sequence identifies J*/R with Ext_R^1(A,R); fibre duality and coefficient exchange make this an A-free rank-one module locally. A fibre regular element in the section ideal lifts to a nonzerodivisor, proving multiplication R→J* injective. Apply the canonical exchanges for arbitrary coefficients and exactness of the A-flat quotient to obtain the base-change exact sequence.

Do not claim the family pairing image J·J*=J. In R=A[x,y]/(xy−bc), Δ(x)=b, Δ(y)=c, the section pullback of J* is A⊕A/(b,c), so the rank-two statement holds only on the persistent nodal-section locus.

([ile](#references), Theorem 6.1(i)–(iv), §6, pp. 18–19; Remark 6.4 and Example 6.5, pp. 20–21. Proves the local Gorenstein section-ideal theorem and corrects the pairing statement over moving families.; [knudsen2012](#references), Main Lemma, p. 3, and §4, p. 13. States the three actual section-ideal properties used by stabilization.)

*Needs:* StableReduction Layer 1, StableReduction Layer 2, DeformationAndDerivedPatchingAlgebra §3.3, [universal coefficient criterion](#2228-universal-coefficient-criterion), [base change for relative stable reflexivity](#2232-base-change-for-relative-stable-reflexivity).

### 2.234 Completed-ring Hom and Ext

For a flat map of commutative rings R→T, any R-module L, and any T-module V, restriction along L→T⊗_R L gives canonical Hom_T(T⊗_R L,V)≃Hom_R(L,V), f↦(l↦f(1⊗l)). The derived comparison gives Ext_T^i(T⊗_R L,V)≃Ext_R^i(L,V) for all i≥0, because a projective R-resolution remains a projective T-resolution. Apply this to T=R̂ and L=J or J*. For finite-projective completed coefficients, composing with the compatible-quotient Hom comparison of §2.222 identifies actual completed-ring Hom with those families. This comparison makes no claim that arbitrary Ext commutes with inverse limits.

Here R→T flat; L arbitrary R-module; V arbitrary T-module. For T=R̂, R is Noetherian.

One proof uses the following inputs and comparisons. Use scalar extension/restriction adjunction in degree zero, retaining the explicit 1⊗l formula. Extend a projective resolution of L along the flat map; its augmentation remains exact and its terms are projective after extension. Apply the Hom adjunction degreewise and pass to cohomology; identify the degree-zero map with the explicit one. For finite projective Â-coefficients use the inverse-limit equivalence of §2.222 after restriction to R. For other coefficients use the completion theorem instead.

The source module is T⊗_R L, not L endowed with an invented completed action. Finite projectivity is required only by the compatible-family comparison of §2.222, not by this Hom/Ext adjunction.

([ile](#references), Example 2.6 and Corollary 2.7, §2, pp. 4–5; Remark 3.6, pp. 7–8. Uses projective resolutions to compare fibre/change-of-rings Ext; the displayed flat adjunction is the degreewise specialization.; [knudsen2](#references), Appendix, Theorem 2 and Proposition 6, pp. 192–195. The completed criterion concerns actual duals and Ext over the completed chart ring.)

*Needs:* `CategoryTheory.ProjectiveResolution.isoExt`, DeformationAndDerivedPatchingAlgebra §3.3, [faithfully flat reflection of stable reflexivity](#2229-faithfully-flat-reflection-of-stable-reflexivity), [actual relative hom and compatible quotient homs](#2222-actual-relative-hom-and-compatible-quotient-homs).

### 2.235 Arbitrary completed-coefficient exchange

In the two-base completion theorem, suppose M is relatively stably reflexive over A and put D̂=Hom_(R̂)(M̂,R̂)=R̂⊗_R M*. For every Â-module N, with V=R̂⊗_Â N, the actual R̂-linear maps D̂⊗_Â N→Hom_(R̂)(M̂,V) and M̂⊗_Â N→Hom_(R̂)(D̂,V) are the evaluation isomorphisms, and Ext_(R̂)^i(M̂,V)=Ext_(R̂)^i(D̂,V)=0 for all i>0. All maps are natural in N and in compatible local changes, and compose with completed-ring adjunction to actual Hom_R/Ext_R comparisons.

Flat local Noetherian A→R; M finite relatively stably reflexive; N any Â-module.

One proof uses the following inputs and comparisons. Apply the completion theorem to obtain relative stable reflexivity over Â. Apply its universal coefficient criterion with the actual Â-module N. Identify D̂ with the completed original dual by the flat Hom comparison; use evaluation formulas to check naturality. Use flat adjunction for the comparison with original-ring Hom and Ext.

Take N=Â/J for arbitrary ideals J, including nonflat coefficients. No term R̂⊗_A N is substituted for R̂⊗_Â N. No finite presentation of N is assumed.

([knudsen2](#references), Appendix, Theorem 2(1), pp. 192–194, and Proposition 6, pp. 194–195. The universal coefficient formulation after both completions supplies these precise actual-ring conclusions.; [ile](#references), Proposition 3.5(iii) and Remark 3.6, pp. 7–8. Identifies the two canonical exchanges and the positive Ext vanishings.)

*Needs:* [knudsen completion theorem](#2230-knudsen-completion-theorem), [universal coefficient criterion](#2228-universal-coefficient-criterion), [completed-ring hom and ext](#2234-completed-ring-hom-and-ext).

### 2.236 Pointed hull and completed family chart

Let C→Spec A be a flat finitely presented nodal curve over a Noetherian local ring, with section Δ through a node of its closed fibre, and x=Δ(p). After the coefficient and formal coordinate choices of the pointed-node hull ([normal form of a pointed nodal deformation](#210-normal-form-of-a-pointed-nodal-deformation) with AlgebraicModuliForArithmeticGeometry §§8.1–8.3), the completed local pointed algebra is a continuous pullback of R_pd over A_pd: R̂_x≃Â[[u,v]]/(q̃(u,v)−q̃(s,t)), Δ(u)=s, Δ(v)=t. This is the (p,u,v)-adic completion of the polynomial model of §§2.1–2.224 over Â. The isomorphism sends the actual section ideal to (u−s,v−t), and its actual dual and residue quotient to the completed ones of §§2.135 and 2.183. Its maps, rather than its coordinate choices, are the data retained in a comparison. At a smooth point the corresponding chart is Â[[z]], Δ(z)=a. No fine representability or canonical hull ring for a stack is asserted.

Here C/A nodal and finitely presented; A Noetherian local; x on the section; a coefficient-base map into Â and lifts of the nondegenerate binary quadratic form have been chosen.

One proof uses the following inputs and comparisons. Use the pointed-node hull and its small-extension lifting property for the compatible Artinian quotients of the completed family. Choose compatible lifts inductively and pass to continuous maps of complete local rings; the completed curve and section identify with the displayed quotient. Identify it with completion of the actual polynomial ring model, not with an ordinary tensor product of two power-series rings. Apply the finite-module dual/residue completion comparisons and the two-base criterion; use the completed-ring Hom adjunction when switching the ring of linearity.

The family base need not map flatly to or from the hull base. The section point has the same residue field as the coefficient point; nonsplit nodes use the quadratic form, not an unjustified split xy model. A hull map is a choice, not a representing universal object for the deformation groupoid.

**Checks.**

- Over a field k with γ=1, δ=s=t=0, the completed algebra is k[[u,v]]/(u²+uv), an ordinary node with branches u=0 and u+v=0, and the section ideal (u,v) is the maximal ideal.
- Over k with γ=δ=0 the form u² has discriminant 0 and k[[u,v]]/(u²) is a double line, not a node; it is excluded by the nodal hypothesis rather than covered by the chart.
- Over A=ℤ_(2) with γ=1, δ=s=t=0, Â=ℤ₂ and R̂_x=ℤ₂[[u,v]]/(u²+uv); its closed fibre is the node over 𝔽₂, where the discriminant 1 is still a unit.

([knudsen2012](#references), Proposition 2.1, §2, pp. 5–10; Corollary 3.2, pp. 12–13. Supplies the pointed hull with the two section coordinates, and its completed ideal calculation.; [ile](#references), §7, pp. 25–27, application of the pointed local calculation to stabilization. Uses formal local comparisons to transfer the polynomial construction to the family.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§8.1–8.3, StableReduction Layer 1, [normal form of a pointed nodal deformation](#210-normal-form-of-a-pointed-nodal-deformation), [knudsen completion theorem](#2230-knudsen-completion-theorem), [arbitrary completed-coefficient exchange](#2235-arbitrary-completed-coefficient-exchange), [completion of the polynomial section dual](#2135-completion-of-the-polynomial-section-dual), [completion of the actual residue quotient](#2183-completion-of-the-actual-residue-quotient).

### 2.237 Global section dual and residue line

For a nodal family C/S over a locally Noetherian scheme, an arbitrary section Δ with ideal sheaf J has a quasi-coherent dual J∨=Hom_O_C(J,O_C) and an exact sequence 0→O_C→J∨→Δ_*L_Δ→0, with L_Δ invertible on S. These are the actual sheaf dual and quotient, and their formation commutes canonically with every base change S′→S, including non-Noetherian S′. The canonical Hom comparisons agree on chart overlaps, satisfy identity and composition laws, and coincide with the polynomial generators of §§2.1–2.224 wherever those coordinates are chosen.

Here C/S flat, finitely presented, nodal of pure relative dimension one; S locally Noetherian; Δ arbitrary.

One proof uses the following inputs and comparisons. Use the local Gorenstein theorem at each point on Δ and invertibility of J off Δ. Localize the canonical dual exchange maps on affine charts. The quotient is annihilated by J and hence is Δ_* of an O_S-module. The local rank-one identifications make that module invertible; they are not a chosen global trivialization. Glue actual internal Hom modules by their universal property; polynomial formulas give chart comparisons, while uniqueness gives the cocycle. The local universal coefficient theorem identifies the sheaf pullback dual with the dual of the pulled-back ideal for arbitrary S′; exactness of the quotient is preserved by its coefficient flatness.

A residue generator changes by a unit on overlaps and must descend as a line. Arbitrary base change is justified by relative reflexivity; the generic flat-base-change theorem for internal Hom alone is insufficient.

([knudsen2](#references), Lemma 2.2, pp. 175–176; Definition 2.3, p. 176. Uses the section dual, its residue line and their base-change compatibility.; [knudsen2012](#references), Main Lemma, p. 3, and §4, p. 13. Supplies the sheaf form of the ideal, dual and residue assertions.; [ile](#references), §7, pp. 25–27. Globalizes the local section-ideal theorem for stabilization.)

*Needs:* SchemeAndStackFoundations §0.9, StableReduction Layer 2, [section ideal of a local gorenstein family](#2233-section-ideal-of-a-local-gorenstein-family), [pointed hull and completed family chart](#2236-pointed-hull-and-completed-family-chart), [base change for relative stable reflexivity](#2232-base-change-for-relative-stable-reflexivity), [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases).

### 2.238 Dual ideal of an arbitrary nodal section

For a nodal family C/S over a locally noetherian base and an arbitrary section Δ with ideal J, J is stably reflexive, formation of J∨ and J∨/O_C commutes with arbitrary base change, and Δ*(J∨/O_C) is an invertible sheaf. In the local quadratic model J∨ is generated by 1 and ε=(x+s+γt)/(y−t) in the total quotient ring, and J∨/R≅A via the class of ε.

Here C→S is a flat finitely presented nodal family with reduced geometric fibres of pure dimension one; S is locally Noetherian and Δ:S→C is any section, possibly through a node. The source Main Lemma has this locally Noetherian scope. Formation under arbitrary base change is asserted for this family; extension of the starting theorem to an arbitrary non-Noetherian base uses the finite-stage approximation of [finite-stage models of pointed curve diagrams](#01-finite-stage-models-of-pointed-curve-diagrams).

One route starts with the actual polynomial quotient and its signed section-ideal and dual presentations. Monic cancellation gives the canonical dual generator, quotient residue, coefficient-flatness, both coefficient Hom exchange maps and the canonical bidual comparison; the augmented projective resolutions identify all positive Ext groups for arbitrary coefficient modules. Apply the Noetherian fibre criterion and the two-base completion theorem to the section ideal and its dual. The pointed hull identifies this completed chart with the completed local ring of the family at a singular section point. Identify Hom and Ext over that completed chart ring using the completed-ring adjunction, rather than confusing them with Hom over the uncompleted ring or interchanging arbitrary tensors and limits. Faithful flat reflection then gives the local family result. At smooth section points the ideal is invertible. Glue these local comparisons with their coefficient naturality to obtain the sheaf dual and residue line, and use the finite-diagram approximation target for the arbitrary-base extension. Knudsen's Appendix Proposition 6 has a separate local-flatness/complete-hull proof route; finite-projective tensor/limit interchange alone does not imply its all-coefficient assertion.

Do not strengthen this to J·J∨=J throughout a smoothing family: that equality holds only on the nodal-section locus.

([knudsen2012](#references), Proposition 3.1,Corollary 3.2 and §4, pp. 12–13; [knudsen2](#references), Appendix Definition 1, Theorem 2, Propositions 4–7, printed191–195 (PDF pp. 31–35).)

*Needs:* [normal form of a pointed nodal deformation](#210-normal-form-of-a-pointed-nodal-deformation), [exactness of the node-section complex](#2105-exactness-of-the-node-section-complex), SchemeAndStackFoundations §§1.18–1.23, [residue of the section dual](#2159-residue-of-the-section-dual), [natural coefficient base change of the section dual](#2133-natural-coefficient-base-change-of-the-section-dual), [coefficient flatness of the section ideal](#279-coefficient-flatness-of-the-section-ideal), [coefficient-linear normal coordinates of the dual](#2120-coefficient-linear-normal-coordinates-of-the-dual), [ring-linear tensor comparison for the section dual](#2167-ring-linear-tensor-comparison-for-the-section-dual), [coefficient base change of the actual dual quotient](#2175-coefficient-base-change-of-the-actual-dual-quotient), StableReduction Layer 1, [finite presentation of the polynomial section ideal](#2108-finite-presentation-of-the-polynomial-section-ideal), [dual of the extended section ideal](#2121-dual-of-the-extended-section-ideal), [residue quotient under ambient extension](#2176-residue-quotient-under-ambient-extension), [completion of the polynomial section dual](#2135-completion-of-the-polynomial-section-dual), [completion of the actual residue quotient](#2183-completion-of-the-actual-residue-quotient), [faithful detection for the residue quotient](#2184-faithful-detection-for-the-residue-quotient), [coefficient universal exactness at φ](#2170-coefficient-universal-exactness-at-φ), [coefficient universal exactness at ψ](#2111-coefficient-universal-exactness-at-ψ), [coefficient universal exactness at φᵀ](#2124-coefficient-universal-exactness-at-φᵀ), [coefficient universal exactness at ψᵀ](#2177-coefficient-universal-exactness-at-ψᵀ), [the tensorized ideal cokernel](#298-the-tensorized-ideal-cokernel), [the tensorized dual cokernel](#2139-the-tensorized-dual-cokernel), [ordinary reflexivity of the section ideal](#2154-ordinary-reflexivity-of-the-section-ideal), [canonical section bidual equivalence](#2162-canonical-section-bidual-equivalence), [coefficient tensor–hom equivalence for the dual](#2193-coefficient-tensorhom-equivalence-for-the-dual), [coefficient-valued bidual equivalence](#2186-coefficient-valued-bidual-equivalence), [the actual dual coefficient-Hom map](#257-the-actual-dual-coefficient-hom-map), [the coefficient-valued bidual evaluation map](#258-the-coefficient-valued-bidual-evaluation-map), [vanishing positive cohomology of the native hom complex](#2216-vanishing-positive-cohomology-of-the-native-hom-complex), [degree-zero cycles factor through the section ideal](#2100-degree-zero-cycles-factor-through-the-section-ideal), [degree-zero cycles factor through the section dual](#2141-degree-zero-cycles-factor-through-the-section-dual), [the actual section-ideal projective resolution](#2188-the-actual-section-ideal-projective-resolution), [the actual dual projective resolution](#2189-the-actual-dual-projective-resolution), [the native polynomial section chain complex](#2143-the-native-polynomial-section-chain-complex), [positive native localization ext vanishing for the section ideal](#2207-positive-native-localization-ext-vanishing-for-the-section-ideal), [positive native localization ext vanishing for the section dual](#2208-positive-native-localization-ext-vanishing-for-the-section-dual), [coefficient naturality of the categorical hom comparison](#2219-coefficient-naturality-of-the-categorical-hom-comparison), [canonical coefficient exchange for the section dual](#2197-canonical-coefficient-exchange-for-the-section-dual), [evaluation factorization of the second exchange map](#2202-evaluation-factorization-of-the-second-exchange-map), [positive derived ext of the section ideal into its ring](#2223-positive-derived-ext-of-the-section-ideal-into-its-ring), [positive derived ext of the section dual into its ring](#2224-positive-derived-ext-of-the-section-dual-into-its-ring), [positive categorical ext of the section ideal into its ring](#2211-positive-categorical-ext-of-the-section-ideal-into-its-ring), [positive categorical ext of the section dual into its ring](#2212-positive-categorical-ext-of-the-section-dual-into-its-ring), [completed nodal coefficient homomorphism](#268-completed-nodal-coefficient-homomorphism), [the actual completed coefficient algebra](#277-the-actual-completed-coefficient-algebra), [two-base tensor quotient for the nodal chart](#2128-two-base-tensor-quotient-for-the-nodal-chart), [finite two-base tensor equivalence](#2113-finite-two-base-tensor-equivalence), [finite two-base Hom target equivalence](#2129-finite-two-base-hom-target-equivalence), [ring-linear finite tensor projection](#2158-ring-linear-finite-tensor-projection), [actual relative hom and compatible quotient homs](#2222-actual-relative-hom-and-compatible-quotient-homs), [ring-linear assembly of compatible Hom families](#2213-ring-linear-assembly-of-compatible-hom-families), [relative reflexivity of the polynomial section ideal](#2231-relative-reflexivity-of-the-polynomial-section-ideal), [section ideal of a local gorenstein family](#2233-section-ideal-of-a-local-gorenstein-family), [global section dual and residue line](#2237-global-section-dual-and-residue-line).

### 2.239 Expansion at an arbitrary extra section

Given such C/S with old markings sᵢ and arbitrary extra section Δ, put D=Σsᵢ and J=I_Δ. Let p:J∨⊕O_C(D)→K be the cokernel of the diagonal map h↦(h,h), and put C^s=Proj_C Sym K. Set L_s=K/p(J∨) and L_Δ=K/p(O_C(D)). The canonical invertible quotients sᵢ*K→sᵢ*L_s and Δ*K→Δ*L_Δ give the ordered lifted markings. On the stated locally Noetherian bases the construction commutes canonically with base change and with pointed isomorphisms; the arbitrary-base extension is §2.246. On geometric fibres it is an isomorphism at a disjoint smooth new point, inserts a rational tail at a collision, and inserts a rational bridge at a node.

Here g,n are nonnegative integers with 2g−2+n>0; C/S is a stable ordered n-pointed family and Δ:S→C is any section. The dual-ideal theorem is verified over locally Noetherian bases. The extension of this construction to arbitrary schemes uses the finite-stage approximation and descent of §§0.1 and 0.5.

One proof uses the following inputs and comparisons. Use the effective Cartier divisor and invertible-sheaf statements of StableReduction Layer 2 for D, the dual of the section ideal for J, and the diagonal map to form the finitely presented cokernel K. Its two quotients restrict to invertible sheaves along the old markings and along Δ. Use the quotient convention for relative Proj of Sym of a finitely presented sheaf to define the lifts and the projection C^s→C; K need not be a vector bundle at Δ. Transport the sheaf sequence, symmetric algebra, Proj, projection and section quotients through base change and pointed isomorphisms. Their universal properties give identity/composition coherence. Flatness and stable fibres remain the separate next targets; arbitrary bases require the exact approximation gap.

An arbitrary extra section is not assumed Cartier.

The construction has the following API.

- The new curve is Proj_C Sym K, with its canonical projection p:C^s→C over S and K defined by the diagonal cokernel.
- Lift sᵢ using sᵢ*K→sᵢ*(K/p(J∨)), and lift Δ using Δ*K→Δ*(K/p(O_C(D))); all target lines are invertible.
- For f:T→S between locally Noetherian bases, pullback of C^s identifies canonically with expansion of C_T; the isomorphism commutes with p and every marking. The arbitrary-base version requires the finite-stage approximation of §0.1.
- For h:T→C and an invertible quotient h*K→L, the quotient-convention relative Proj universal property gives a unique lift T→C^s with this quotient up to its line isomorphism; the marked lifts are its two specified cases.
- A pointed isomorphism C→C′ carrying Δ to Δ′ induces an isomorphism C^s→(C′)^s preserving projection and all lifted markings; identity and composition are respected.
- For U→T→S in the stated base class, the direct base-change comparison equals the composite comparison under the canonical fibre-product associator; base change by the identity gives the identity comparison.

**Checks.**

- For Δ disjoint from old marks and contained in the smooth locus, C^s≅C.
- For Δ=s₁, the new fibre has a P¹ tail carrying the two distinct lifts of s₁ and Δ.
- For Δ at a node, the new fibre has a P¹ bridge with two attachment points and a third point given by the new mark.

([knudsen2](#references), Definition 2.3 and Theorem 2.4, printed pp. 176–177 (PDF pp. 16–17); [knudsen2012](#references), Introduction equation (1) and quotient sheaves, PDF pp. 2–3; Theorems 5.1–5.2, pp. 13–16.)

*Needs:* SchemeAndStackFoundations §4.15, [dual ideal of an arbitrary nodal section](#2238-dual-ideal-of-an-arbitrary-nodal-section), AlgebraicModuliForArithmeticGeometry §§1.1–1.7, StableReduction Layer 2, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21.

### 2.240 Collision chart of pointed expansion

In an étale smooth coordinate neighborhood with old marking z=0 and extra section z=a over a commutative ring A, the diagonal-cokernel expansion of §2.239 has the actual presentation Proj_(A[z]) A[z][U,V]/((z−a)U+zV), with U,V in degree one. Its U-chart is z(1+v)=a, v=V/U, and its V-chart is z(u+1)=au, u=U/V. The new marking is v=0,z=a, the old one is u=0,z=0. Over a=0 the exceptional P¹ has new mark v=0, old mark v=∞, and attaching point v=−1. The coordinates are local choices; the scheme is the intrinsic Proj construction of §2.239.

Here A arbitrary commutative ring; the curve is étale locally the smooth coordinate chart; exactly one old mark can meet Δ because old marks are pairwise disjoint.

One proof uses the following inputs and comparisons. Trivialize J∨ by 1/(z−a) and O(D) by 1/z; the diagonal map is the column ((z−a),z). Take the symmetric algebra of this actual cokernel, obtaining the displayed linear homogeneous relation. Dehomogenize and read the quotient lines defining the lifted sections. Glue the two charts; changing the generators multiplies the homogeneous coordinates by units, yielding the same intrinsic expansion.

The signs must match the positive diagonal map of §2.239. The three special points on the exceptional line remain distinct in characteristic two.

The construction has the following API.

- Identify the intrinsic Sym K of §2.239 with A[z][U,V]/((z−a)U+zV), retaining the degree-one quotient generators.
- Export both affine chart rings and the gluing u=v^(−1) on U,V nonzero.
- The new section has [U:V]=[1:0], z=a; the old section has [0:1], z=0.
- Every A→B sends a to its image and pulls back both charts, lifted sections and the contraction to Spec A[z].
- At a=0 the exceptional component z=0 is P¹; its attachment to the retained component is [1:−1].
- The local presentation isomorphisms respect changes of smooth coordinate and of the two invertible generators because they identify the same quotient K and quotient lines.

**Checks.**

- If a is a unit, the two sections are disjoint and the Proj contracts isomorphically to the original smooth chart; no exceptional component occurs.
- Over a field with a=0, z(U+V)=0 is the union of the retained affine line and the exceptional P¹, meeting at [1:−1].
- Over F₂ with a=0 the attachment is v=1, while the two lifted markings are 0 and ∞; all remain distinct.
- For A=k[ε]/(ε²), a=ε, the U-chart is A[z,w]/(zw−ε). It is A-flat although a is a zero divisor; the construction must not require a to be regular.

([knudsen2](#references), Definition 2.3 and Theorem 2.4, pp. 176–177, smooth/collision case. The diagonal-cokernel Proj inserts a three-special-point rational tail at an old-mark collision.; [knudsen2012](#references), Theorem 5.1 and opening of its proof, pp. 13–14. States stable pointed expansion but leaves the smooth and collision calculations to the reader and refers to the original proof. The displayed signed chart is derived here from the diagonal cokernel in Knudsen II Definition 2.3 and Theorem 2.4, pp. 176–177.)

*Needs:* SchemeAndStackFoundations §0.3, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [expansion at an arbitrary extra section](#2239-expansion-at-an-arbitrary-extra-section), [global section dual and residue line](#2237-global-section-dual-and-residue-line).

### 2.241 Flatness at an old-mark collision

The collision Proj is flat and finitely presented over every coefficient ring A. Its geometric fibres are nodal, its two lifted markings are smooth and disjoint, and the collision fibre has the same arithmetic genus as the original curve. For a=0 the inserted rational tail has exactly the old mark, the new mark and its attachment as special points.

The collision chart and its intrinsic gluing are as specified; no flatness or regularity is imposed on a.

One proof uses the following inputs and comparisons. On D_+(U), write w=1+v: the ring A[z,w]/(zw−a) is A-free with the normal-form basis 1,z^i,w^j for i,j≥1. The rest is covered in D_+(V) by u+1 invertible, where z=au/(u+1) and the ring is A[u,(u+1)^(−1)]. These two opens cover because outside U one has u=0. At the new and old sections the relative Jacobian in z is a unit; the sections are disjoint since their homogeneous coordinates differ. Use the fibre union and normalization exact sequence to read nodality and genus, and the three flags to read stability of the tail.

The affine cover is displayed and is valid over nonreduced A. The new marking is not the attaching point; its smoothness is a relative assertion.

([knudsen2](#references), Theorem 2.4, pp. 176–177. Collision stabilization inserts a rational tail and gives a stable flat family.; [knudsen2012](#references), Theorem 5.1 and opening of its proof, pp. 13–14. Asserts the stable-family result and omits the smooth-point calculation. The explicit coefficient-free affine cover and normal-form flatness proof are deductions here from the preceding collision presentation, rather than calculations printed in this theorem.)

*Needs:* StableReduction Layer 1, StableReduction Layer 3, [collision chart of pointed expansion](#2240-collision-chart-of-pointed-expansion).

### 2.242 Flatness transfer from the pointed formal chart

For the Noetherian pointed nodal family, C^s=Proj_C Sym K is flat over the coefficient base near the preimage of a nodal section point. The completed family comparison identifies its formal affine charts with completed base changes of the polynomial expansion charts of §2.240. This is a statement about actual local rings of the intrinsic Proj. It uses neither algebraization of an arbitrary formal scheme nor excellence of the coefficient ring.

Noetherian local coefficient base; finitely presented nodal curve with section; the intrinsic finite-presentation sheaf K and the pointed formal comparison.

One proof uses the following inputs and comparisons. On a distinguished affine H of the actual Proj over the local chart R, the formal ring is lim H/m^kH, where m is the maximal ideal of R at the section point. This is completion along the inverse image of that point. Use Sym/Proj base change and then complete this affine ring; a polynomial algebra over R̂ is not itself presumed complete. The pointed formal comparison identifies these rings with the (p,u,v)-adic completions of the polynomial expansion charts of §2.240 over Â. The first polynomial chart has monic leading term vy²; the complementary localization of the second is a polynomial localization. Their explicit normal forms in §2.240 give Â-flatness before completion. All these polynomial charts are Noetherian. Their displayed ideal-adic completions are flat over them and hence Â-flat. At a point under test, localize in the compared formal charts and complete once more at its maximal ideal; this yields the same maximal-ideal completion B̂ of the actual Proj local ring B. No ordinary tensor product of power-series rings is used. The resulting B̂ is Â-flat and hence A-flat. Since B→B̂ is faithfully flat, descend A-flatness to B. Away from the exceptional locus the intrinsic Proj is the original curve. This uses only completions of actual Noetherian rings and requires no algebraization of an arbitrary formal scheme.

Distinguish completion after coefficient base change from a bare tensor product with R_pd. State the ideals of formal completion on each distinguished affine and then localize at the point under test. Together with the collision calculation, cover every possible location of Δ.

([knudsen2012](#references), Theorem 5.1, especially the flatness argument, pp. 14–16. Transfers the explicit nodal affine-chart calculation through the completed pointed local model.; [ile](#references), §7, pp. 25–27. Discusses the formal local reduction of stabilization to these charts.; [stacks-completion](#references), Algebra Lemma 10.97.3, tag 00MC. Faithfully flat local completion reflects module flatness.)

*Needs:* SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, SchemeAndStackFoundations §4.8, DeformationAndDerivedPatchingAlgebra §3.3, [pointed hull and completed family chart](#2236-pointed-hull-and-completed-family-chart), [global section dual and residue line](#2237-global-section-dual-and-residue-line), [knudsen completion theorem](#2230-knudsen-completion-theorem), [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual).

### 2.243 Flatness of the expanded family

Over a locally Noetherian S the expanded C^s/S is flat and finitely presented. In the polynomial nodal model q(u,v)=q(s,t), its Proj charts are R₀=A[v,y]/(v(y²−γy+δ)+s(2y−γ)+t(−y²+2γy−γ²+δ)) and R₁=A[u,x]/(u(δx²−γx+1)+s(δx²−1)+tδ(γx²−2x)). R₀ has free A-basis the monomials vⁱyʲ excluding i≥1,j≥2. With h=δx²−γx+1, Spec R₀ and Spec R₁[h⁻¹] cover; R₁[h⁻¹]≅A[x,h⁻¹]. Transferring this calculation to C^s uses the actual formal completion and faithful flatness comparison. The arbitrary-base extension is §§2.253–2.254.

Use the stable range and the family/section data of expansion. The formal-local proof is over a locally Noetherian base. In the polynomial node chart, A is commutative and γ²−4δ is a unit; the pointed completed-local comparison is an additional input, not an identification with an algebraic chart.

One proof uses the following inputs and comparisons. Use the actual signed dual presentation to write Sym J∨ as the homogeneous quotient and eliminate u or v on its two Proj charts. The coefficients of the leading vy² term and of the localized linear u term give the displayed basis and localization, respectively. Since h(0)=1, V(h) is in the chart where x is invertible and hence in Spec R₀. Thus these two flat opens cover the polynomial expansion. For a general family, identify the completed expansion along the exceptional fibre with the completed polynomial Proj model using the pointed hull, completed dual and quotient comparisons, and relative Proj completion compatibility. Reflect flatness by the applicable local faithfully flat completions. These formal-local inputs are gap:formal-proj-completed-cokernel. At an old-mark collision use Knudsen II Theorem 2.4 Case II and the Cartier-divisor and curve-cohomology inputs of StableReduction Layer 2; away from nodes and collisions the projection is an isomorphism. The finitely presented sheaf/graded-algebra construction gives finite presentation. Extend beyond locally Noetherian bases only via the finite-stage approximation of §0.1.

A fibrewise description alone does not prove flatness over a nonreduced base.

**Checks.**

- With γ=δ=s=t=0 the first chart is R₀=A[v,y]/(vy²), with free A-basis 1, vⁱ (i≥1), yʲ (j≥1) and vⁱy (i≥1), as the excluded range i≥1, j≥2 predicts.
- With γ=δ=0, h=δx²−γx+1=1, and with s=t=0 the second chart is R₁=A[u,x]/(u)=A[x], so R₁[h⁻¹]=A[x] and the two charts cover.
- Over 𝔽₂ with γ=1 and δ=s=t=0, R₀=A[v,y]/(v(y²+y)); the relation vy²=vy still reduces every vⁱyʲ with j≥2, so the basis description holds in characteristic two.

([knudsen2012](#references), Theorem 5.1 proof, equations (4)–(5) and formal comparison, PDF pp. 14–16; [knudsen2](#references), Theorem 2.4 Case II, printed p. 177 (PDF p. 17).)

*Needs:* gap:formal-proj-completed-cokernel, [expansion at an arbitrary extra section](#2239-expansion-at-an-arbitrary-extra-section), [normal form of a pointed nodal deformation](#210-normal-form-of-a-pointed-nodal-deformation), AlgebraicModuliForArithmeticGeometry §§1.1–1.7, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, [dual ideal of an arbitrary nodal section](#2238-dual-ideal-of-an-arbitrary-nodal-section), [the ordered surjection to the section dual](#256-the-ordered-surjection-to-the-section-dual), AlgebraicModuliForArithmeticGeometry §§8.1–8.3, StableReduction Layer 2, [flatness transfer from the pointed formal chart](#2242-flatness-transfer-from-the-pointed-formal-chart), [flatness at an old-mark collision](#2241-flatness-at-an-old-mark-collision).

### 2.244 Stability of the expanded family

C^s with its n+1 lifted sections is a stable pointed family of the same arithmetic genus g. Its new marking is in the relative smooth locus and is disjoint from every retained mark; in the node case the inserted P¹ has three distinct special flags.

Use the stable pair and pointed family of expansion, with the base and formal comparison hypotheses of [flatness of the expanded family](#2243-flatness-of-the-expanded-family).

One proof uses the following inputs and comparisons. Identify geometric fibres by the Proj charts, including nodal and collision cases. Compute the genus using the normalization and dual-graph formula of StableReduction Layer 1. Check log-canonical degrees on every component using the pointed-stability criterion of StableReduction Layer 3.

At a node neither attaching point is the new marking.

([knudsen2012](#references), Theorem 5.1, PDF pp. 13–16, especially the geometric-fibre and smooth-marking calculations on pp. 15–16; [knudsen2](#references), Theorem 2.4 Case II and Figure 3, printed p. 177 (PDF p. 17).)

*Needs:* [flatness of the expanded family](#2243-flatness-of-the-expanded-family), [expansion at an arbitrary extra section](#2239-expansion-at-an-arbitrary-extra-section), StableReduction Layer 3, StableReduction Layer 1.

### 2.245 Approximation of pointed nodal families

For every scheme S, a stable pointed family C/S and one arbitrary additional section admit, locally on affine S, a model over a finite-type Z-algebra A₀ with a stable pointed nodal family, its ordered markings and additional section. Any finite collection of family isomorphisms and their equations descends after enlargement of A₀. The actual section ideal, its dual, residue line, diagonal cokernel, symmetric algebra and Proj are canonically the pullbacks of the corresponding Noetherian-model objects. Two models give the same comparisons after a common enlargement. No global qcqs hypothesis is imposed on S.

Here C/S proper, flat and finitely presented, with pure one-dimensional geometrically connected nodal genus-g fibres; ordered disjoint smooth old markings; log-dual relatively ample; arbitrary Δ.

One proof uses the following inputs and comparisons. On an affine base descend the finitely presented curve, all sections and the invertible log-dual line. Use the limit property theorems for properness, flatness, syntomic nodality and disjoint smooth markings, and the fibrewise genus and ampleness criteria of StableReduction Layers 2–3. The section ideal pulls back exactly: in 0→J→O_C→Δ_*O_S→0, the quotient is S-flat. Over the Noetherian model J is finitely presented, and its actual dual commutes with every coefficient pullback by the relative theorem. Pull back the residue line and the finite diagonal-cokernel presentation. Sym and Proj commute with coefficient change by their existing universal properties. Descend morphisms and equations by the finite-presentation limit theorem; compare two choices after a common enlargement. Glue over affine covers and their refinements using the canonical comparisons.

A finite-presentation module can have a dual that fails arbitrary base change in general; the section-ideal theorem is the essential extra input. Do not replace the infinite graded contraction ring by an unjustified interchange of an infinite limit: use the finite Veronese presentation of the single-marking contraction of StableReduction Layer 3. A non-qcqs base is handled by local affine constructions and descent.

([knudsen2](#references), §2, pp. 171–179, especially the base-change claims in Definition 2.3 and Corollary 2.6. The geometric constructions are natural over family bases; this theorem supplies their explicit approximation extension.; [ile](#references), Proposition 3.5, pp. 6–7, and §7, pp. 25–27. Arbitrary coefficient change of the section dual is the local algebra input; the approximation part is a deduction using the cited foundational suppliers.)

*Needs:* SchemeAndStackFoundations §0.9, StableReduction Layer 2, StableReduction Layer 3, [global section dual and residue line](#2237-global-section-dual-and-residue-line), [finite-stage models of pointed curve diagrams](#01-finite-stage-models-of-pointed-curve-diagrams).

### 2.246 Expansion over arbitrary schemes

The existing intrinsic diagonal-cokernel construction defines stable (g,n+1)-pointed expansion over every scheme S for each stable pair (g,n), including old-mark collisions and nodal sections. The result is proper, flat and finitely presented over S, of the same genus, with disjoint smooth lifted markings and positive log-dual degree on every geometric component. Its canonical base-change and pointed-isomorphism comparisons satisfy the identity and composition cocycles. The new section is not required to be smooth or disjoint before expansion.

Stable (g,n)-pointed C/S; 2g−2+n>0; arbitrary extra section Δ.

One proof uses the following inputs and comparisons. Work over a Noetherian model. The complement of Δ is unchanged; the smooth disjoint case is an isomorphism, the collision case is the displayed tail chart, and the node case is the formal-transfer chart. These charts prove flatness, nodality, smoothness/disjointness of lifted marks and the geometric three-flag description. The graph/genus and componentwise degree formulas prove same genus and stability. Pull back to an arbitrary base using the approximation theorem, then glue across affine charts. All comparisons arise from the canonical sheaf dual, cokernel, Sym and Proj maps, so their identity and composition laws follow from those universal properties.

Include all three fibre types in a single construction. Retain automorphisms of the original pointed family and naturality on their isomorphisms.

([knudsen2](#references), Definition 2.3 and Theorem 2.4, pp. 176–177. Defines expansion and identifies its stable pointed fibres.; [knudsen2012](#references), Theorems 5.1 and 5.2, pp. 13–16. Verifies flatness and the functorial stable-family construction.)

*Needs:* SchemeAndStackFoundations §0.3, StableReduction Layer 1, StableReduction Layer 2, StableReduction Layer 3, [approximation of pointed nodal families](#2245-approximation-of-pointed-nodal-families), [flatness at an old-mark collision](#2241-flatness-at-an-old-mark-collision), [flatness transfer from the pointed formal chart](#2242-flatness-transfer-from-the-pointed-formal-chart), [expansion at an arbitrary extra section](#2239-expansion-at-an-arbitrary-extra-section).

### 2.247 Recovery of a contracted pointed family

Let Y/S be stable (g,n+1)-pointed, and let q:Y→C be the single-marking contraction of StableReduction Layer 3 after omitting its last marking, with 2g−2+n>0. Let Δ be the image of the omitted mark. There is a unique pointed isomorphism Y≃C^s over C compatible with q, the lifted old markings and the last marking. It is natural in family isomorphisms and every base change. The only contracted component is the rational three-flag tail or bridge rendered unstable by removal of that one marking; no stable component is contracted.

The StableReduction Layer 3 single-marking contraction with its universal structure-sheaf and base-change properties; stable source and stable retained pair.

One proof uses the following inputs and comparisons. Use that contraction and componentwise log-dual degrees to classify its exceptional fibre: collision tail, nodal bridge, or none. Write D for the old divisor on C, D_Y for the retained divisor on Y and l for the last section. The fibrewise tail/bridge calculations and cohomology/base change give q_*O_Y(l−D_Y)≃J∨(−D). The evaluation diagram identifies q_*O_Y(l) with K(−D), not K itself, and gives q^*K(−D)→O_Y(l) surjective. Tensor by q^*O_C(D), or use Proj Sym K(−D)≃Proj Sym K, to obtain the map Y→C^s with the specified quotient lines. Keep the signs compatible with the positive diagonal. The map preserves all quotient lines and is an isomorphism on geometric fibres, hence is quasi-finite. It is proper because Y is proper over S and C^s is separated over S, and is therefore finite. For a finite map between S-flat finitely presented curves, fibrewise isomorphism makes its structure-sheaf map an isomorphism by Nakayama and coefficient-flatness. The quotient universal property and the contraction factorization property give uniqueness. Prove over Noetherian models and descend to arbitrary S.

Verify the sheaf comparison and the induced evaluation quotient, not only a bijection on geometric points. Include an omitted marking on a rational bridge and one colliding with an old marking. Retain the twist K(−D) in the recovery evaluation diagram; its Proj is canonically the same as that of K.

([knudsen2](#references), Lemma 2.5 and Corollary 2.6, pp. 178–179. Constructs the unique map from a contraction back to the intrinsic expansion and proves the inverse comparisons.; [knudsen2012](#references), Theorem 5.2, p. 16. States functoriality of stabilization. The inverse comparison comes from Knudsen II Lemma 2.5 and Corollary 2.6, not from this later theorem alone.)

*Needs:* StableReduction Layer 3, StableReduction Layer 9, StableReduction Layer 2, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, [expansion over arbitrary schemes](#2246-expansion-over-arbitrary-schemes), SchemeAndStackFoundations §4.15.

### 2.248 Coherent universal-curve equivalence

This proves the identification asserted by SchemeAndStackFoundations §4.15 `Mbar.forget` (Knudsen II, Corollary 2.6): the imported morphisms s:Z̄_(g,n)→M̄_(g,n+1) and c:M̄_(g,n+1)→Z̄_(g,n) form an equivalence of groupoid-valued pseudofunctors over M̄_(g,n) on all schemes. The natural isomorphisms cs≅id and sc≅id are the pointed recovery maps; they commute with pullback, satisfy both triangle identities, and respect reindexing of retained markings. For a family C/S classified by S→M̄_(g,n), the two-fibre product S×_(M̄_(g,n)) M̄_(g,n+1) is canonically the actual curve C. The structural projection is proper flat nodal, and the n old marking loci are actual sections of this universal curve.

Here g,n≥0, 2g−2+n>0; imported curve-moduli groupoids and their coherent pullback.

One proof uses the following inputs and comparisons. Apply the recovery comparison to sc; contracting the intrinsic expansion recovers the original family and its arbitrary extra section, giving cs. Uniqueness of pointed recovery over the contraction makes the two unit/counit composites agree, proving triangle identities and all pullback squares. The universal-curve moduli problem represents arbitrary sections of C_T; the equivalence identifies its groupoid with the two-fibre product. Transport the actual proper flat nodal curve morphism and marking sections through this equivalence.

Automorphism groups are preserved; do not pass to isomorphism classes. At a fibre node the projection is nodal, not smooth. Iterated forgetting is compared over the final contraction, with permutation and pullback compatibility.

([knudsen2](#references), Corollary 2.6, p. 179. Identifies the two operations as inverse and hence identifies the universal stable curve with the next pointed moduli stack.; [knudsen2012](#references), Theorem 5.2, p. 16. Supplies the functorial stabilization operation. Its coherent inverse is justified here by the original recovery lemma and Corollary 2.6 together with uniqueness, rather than attributed to this theorem.)

*Needs:* [recovery of a contracted pointed family](#2247-recovery-of-a-contracted-pointed-family), [expansion over arbitrary schemes](#2246-expansion-over-arbitrary-schemes), SchemeAndStackFoundations §4.15.

### 2.249 The cross-ratio compactification

M₀,₄≅P¹_Z minus {0,1,∞} and M̄₀,₄≅P¹_Z. The three boundary points are precisely the three unordered2+2 partitions of the four ordered markings.

The fixed stable pair is (g,n)=(0,4), with four ordered labels; the construction is over Spec Z.

One proof uses the following inputs and comparisons. The universal curve over M̄₀,₃ is P¹ with its three sections. Use expansion at the fourth section: outside the three sections the fourth coordinate is the cross-ratio; at the three sections it creates the corresponding stable two-component curve.

The compactification adds three points, each with a stable rational tail.

([knudsen2](#references), Corollary 2.6 and Theorem 2.7 proof, printed p. 179 (PDF p. 19), universal-curve induction over M̄₀,₃.)

*Needs:* [the three-pointed rational moduli scheme](#22-the-three-pointed-rational-moduli-scheme), [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence), SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, StableReduction Layer 3.

### 2.250 Stable genus-one curves and one-gons

For every scheme S, forgetting the generalized elliptic action gives an equivalence from the imported one-gon generalized elliptic groupoid E₁(S) to the groupoid of stable one-pointed genus-one curves over S. The inverse uses the unique group law on the relative smooth locus with the mark as identity, and its unique extension action on the cubic. It commutes with arbitrary pullback. Consequently M̄₁,₁ is proper smooth Deligne–Mumford over Z of relative dimension one; its reduced boundary is the smooth Cartier stack B(C₂). This proof is independent of the triangle embedding.

Stable pointed genus-one family; the ordered single mark is relatively smooth.

One proof uses the following inputs and comparisons. The total log-dual degree is 2g−2+n=1. Positivity on each geometric component forces one component: a smooth genus-one curve or an irreducible rational nodal curve. The degree-three marked polarization gives the relative noncuspidal Weierstrass cubic locally on S. Use the existing integral Weierstrass presentation and its coordinate-change group; its generalized elliptic law is uniquely recovered from the pointed cubic. The coordinate comparisons descend and are compatible with all pullbacks, identifying the two groupoids and preserving their automorphisms. Import properness, smoothness, DM and the one-gon cusp from ModularCurvesPartII §§2.1–2.3 and 2.11; no new construction of generalized elliptic curves is made here.

Exclude polygons with more than one component: unmarked components have log degree zero and are not stable. The nodal cusp retains the inversion automorphism; it is B(C₂), not Spec Z. The Weierstrass discriminant boundary remains valid in characteristics two and three.

**Checks.**

- A smooth pointed elliptic curve recovers its group law with the mark as zero. Translating the identity without moving the mark fails the comparison.
- The pointed rational one-gon has inversion inertia C₂. Over an algebraic closure of 𝔽₂ it has two geometric automorphisms, whereas μ₂ has one geometric point.
- On a two-gon with a single mark, the other rational component has log-dual degree zero. It is excluded from the stable pointed groupoid and from polygon count one.

([knudsen2](#references), Theorem 2.7 and its genus-one argument, p. 179. Requires the genus-one pointed base; the displayed independent route uses the existing one-gon supplier instead of deriving it from a triangle.; ModularCurvesPartII §§2.1–2.3 and 2.11, polygon-count-one specialization. The integral stack and its cusp inertia are imported; the pointed cubic comparison uses ModularCurves §§1C–1D and 4A–4B.)

*Needs:* ModularCurvesPartII §§2.1–2.3 and 2.11, ModularCurves §§1C–1D and 4A–4B, StableReduction Layer 1, StableReduction Layer 2, SchemeAndStackFoundations §4.15, [approximation of pointed nodal families](#2245-approximation-of-pointed-nodal-families).

### 2.251 Recovery of the labelled rational triangle

Let E/Z be the fixed three-pointed rational triangle (ℙ¹;0,1,∞) of [the three-pointed rational moduli scheme](#22-the-three-pointed-rational-moduli-scheme), and let ι attach its mark P₁ to a stable one-pointed genus-one family F, retaining P₂,P₃. For every scheme S, each isomorphism of the resulting ordered two-pointed genus-two families lifts uniquely to an isomorphism of the original F families and the identity on E_S. Recovery and its comparisons commute with arbitrary base change, including nilpotent thickenings. Hence ι is a representable monomorphism. Using the independent genus-one properness theorem and separatedness of M̄₂,₂, it is a proper monomorphism and therefore a closed immersion.

Here E is the fixed labelled triangle, not an arbitrary three-pointed genus-one curve; the target retains the ordered P₂,P₃; S arbitrary.

One proof uses the following inputs and comparisons. For a glued family identify the three triangle components by their labelled graph and the two retained markings; the attachment is the unique separating edge adjacent to the unmarked triangle vertex. This graph identification is invariant under every pointed isomorphism. The four persistent nodes are actual sections of the relative singular scheme. For a proper nodal curve this scheme is finite unramified over S. Its open diagonal makes two sections agreeing on all geometric fibres equal even over nilpotent bases. Thus a pointed family isomorphism preserves these four singular sections scheme-theoretically, not just as vertices of fibre graphs. Cut the four selected nodes by the canonical finite algebra End(I), where I is their ideal. On an étale persistent-node chart R=A[x,y]/(xy), I=(x,y), this algebra is A[x]⊕A[y]; its equal-constant subalgebra is R. The completed version is A[[x]]⊕A[[y]]. Away from the selected sections I is the unit ideal, so End(I)=R. These calculations glue and commute with coefficient change, giving a partial normalization only at the selected nodes. Every isomorphism preserving I lifts canonically to this cut; this is not normalization of the whole nonreduced family. Each recovered rational component has three labelled disjoint smooth sections, so the imported genus-zero base identifies it uniquely with P¹; thus its automorphism is the identity. The remaining component with its recovered attachment mark is F. Glue the local recovery maps uniquely by the pushout property and descend from Noetherian models; this proves full faithfulness over arbitrary S, not only on geometric points. A monomorphism of these algebraic stacks is representable. Properness of the source over Z and separatedness of the ambient target make this map proper; a proper representable monomorphism is a closed immersion.

Include F nodal: its self-node is not among the four nodes cut out. Include nonreduced bases; fibre graph uniqueness by itself is insufficient. Fixing P₂,P₃ individually excludes reversal of the triangle.

([knudsen2](#references), Theorem 2.7 and Figure 4, p. 179; Theorem 3.4, pp. 181–183. Uses the rigid triangle for the genus-one base and gives the smooth-section pushout used for family recovery.; [knudsen2](#references), Theorem 3.7, pp. 187–190, with the corrected nodal-section pairing scope. Provides the labelled rational-component recovery pattern. The present persistent-node argument does not use its erroneous unrestricted pairing equality.; [mc0-stacks-curves](#references), Algebraic Curves Lemma 53.20.1, tag 0C59 (mc0-stacks-curves lines 2165–2174). Nodality makes the Fitting singular scheme unramified over the base; properness then makes this closed singular scheme finite.; [mc2-stacks-unramified-diagonal](#references), Morphisms Lemma 29.36.13, tag 02GE. The open diagonal detects equality of singular sections from their agreement at every geometric point, including over nonreduced bases.)

*Needs:* StableReduction Layer 3, StableReduction Layer 1, SchemeAndStackFoundations §§1.18–1.23, [stable genus-one curves and one-gons](#2250-stable-genus-one-curves-and-one-gons), [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence), [approximation of pointed nodal families](#2245-approximation-of-pointed-nodal-families), SchemeAndStackFoundations §4.15, [the three-pointed rational moduli scheme](#22-the-three-pointed-rational-moduli-scheme).

### 2.252 Universal-curve induction

Suppose for a stable pair (g,n) the imported M̄_(g,n) is smooth proper DM over Z, of relative dimension d=3g−3+n, and its nodal deformations have independent smoothing coordinates with reduced normal-crossings boundary. Then M̄_(g,n+1) has the same properties with dimension d+1. Over a point at an old node, the universal curve replaces its base coordinate t₁ by xy=t₁, so x and y are the two smoothing coordinates of the expanded bridge. Over an old-mark collision its new tail has smoothing coordinate a transverse to the old boundary. This is an induction theorem, not an assertion that the universal projection is smooth.

The stated smooth proper DM and independent-node-coordinate hypotheses for (g,n); 2g−2+n>0.

One proof uses the following inputs and comparisons. Representability of the universal-curve morphism transfers DM algebraicity from the base and gives properness by composition; its relative dimension is one. On a smooth atlas at a point away from an old node, the universal curve is smooth relative dimension one. At an old node its local deformation equation is xy=t₁; eliminating the independent parameter t₁ proves smoothness of the total space over Z. At a collision, the explicit tail chart identifies the new node parameter with the transverse coordinate a; at an old node the bridge chart identifies its two node parameters with x,y. Retain every other old node coordinate. Thus the boundary coordinates remain independent, and the complement of their zero loci is the dense smooth-family open. Use the same atlas and the formal-to-étale coordinate comparison of [completed framed hilbert charts](#113-completed-framed-hilbert-charts), rather than infer étale normal crossings from arbitrary formal equations.

Dimension increases by one, including g=0 and g=1. The nodal universal projection remains nonsmooth at xy=t₁ with x=y=0. Prove smoothness and the node-coordinate hypothesis together in the induction.

([knudsen2](#references), Theorem 2.7, p. 179. Uses universal-curve induction for the full pointed stable range and its boundary.; [knudsen2012](#references), Proposition 2.1 and Theorem 5.1, pp. 5–10 and 13–16. Supplies the local pointed node and bridge calculations needed to track smoothing coordinates.)

*Needs:* SchemeAndStackFoundations §§1.18–1.23, [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence), [flatness at an old-mark collision](#2241-flatness-at-an-old-mark-collision), [collision chart of pointed expansion](#2240-collision-chart-of-pointed-expansion), [flatness transfer from the pointed formal chart](#2242-flatness-transfer-from-the-pointed-formal-chart), SchemeAndStackFoundations §4.15.

### 2.253 Four fixed triangle smoothing parameters

At a geometric point in the labelled triangle immersion, choose the independent ambient M̄₂,₂ node-smoothing coordinates. Its formal image is defined by the vanishing of the four coordinates for the three internal triangle nodes and the attachment. The remaining parameter is free. If F is nodal, it is precisely its fifth ambient node-smoothing parameter and cuts out the boundary of M̄₁,₁; if F is smooth it is the one-dimensional smooth deformation coordinate. After the formal-to-étale comparison of [completed framed hilbert charts](#113-completed-framed-hilbert-charts) these equations describe the image étale locally. There is no assertion that the fifth parameter vanishes on the whole image.

Geometric pointed triangle point; specified branches of the four persistent nodes; independent ambient node parameters on a smooth atlas.

One proof uses the following inputs and comparisons. The three rational triangle components have three labelled flags each and thus no moduli; retain their four gluing nodes unsmoothed. Cutting those nodes as in the family-recovery theorem identifies their equisingular deformation groupoid with the one-pointed genus-one deformation groupoid. The ambient independent-node deformation ring therefore restricts by setting exactly those four parameters to zero; the source dimension one accounts for the remaining coordinate. At a nodal F its own self-node is left free, so its parameter is the source cusp parameter. Apply the same formal-to-étale supplier as the ambient boundary theorem.

The ambient relative dimension is five and the source relative dimension is one. At nodal F count five nodes, of which exactly four are fixed. Compare deformation groupoids with automorphisms, not only their tangent spaces.

([knudsen2](#references), Theorem 2.7, Figure 4 and final local argument, p. 179. The fixed triangle and its attachment give the rigid genus-one locus; the four/five-node count is the explicit graph calculation.)

*Needs:* [recovery of the labelled rational triangle](#2251-recovery-of-the-labelled-rational-triangle), [stable genus-one curves and one-gons](#2250-stable-genus-one-curves-and-one-gons), SchemeAndStackFoundations §4.15, [universal-curve induction](#2252-universal-curve-induction).

### 2.254 The rigid triangle locus

Let E/Z be the ordered three-pointed genus-one curve of Knudsen II Figure 4: three rational components arranged in a cycle, with one smooth marking P₁,P₂,P₃ on each component. Glue P₁ to the marking of a stable one-pointed genus-one family F/S and retain P₂,P₃ as ordered markings. The resulting genus-two two-pointed family defines a closed immersion M̄₁,₁→M̄₂,₂ with uniquely recoverable labelled rational triangle. Étale locally its image is cut out by four distinguished node-smoothing parameters: the three internal triangle nodes and the attachment node. If F is nodal there is a fifth boundary parameter; that parameter is not set to zero on the image.

Here F/S is a stable ordered one-pointed genus-one family; E is the fixed split labelled triangle pulled back from Z. The assertion about intersections is étale local with the four chosen branches distinguished; it is not an intersection of four globally embedded boundary components.

One proof uses the following inputs and comparisons. Use the external clutching pushout of StableReduction Layer 3 to attach F to E at its first marking; the triangle has Betti number one, so the glued genus is two. Each rational triangle component has exactly three special flags. Recover the component containing P₂, the component containing P₃, and the unmarked connecting triangle component with its attachment flag. Prove this recovery on families and pointed isomorphisms, including when F is irreducible nodal; triviality of the automorphism group of the ordered triangle is only one part of this family comparison. Use the higher-genus pointed deformation charts: dim M̄₂,₂=5, and impose the three internal smoothing parameters and the attachment smoothing parameter. Four independent equations leave relative dimension one. At a nodal F the remaining fifth parameter cuts out its boundary. The family recovery and closed-image argument are [recovery of the labelled rational triangle](#2251-recovery-of-the-labelled-rational-triangle), not an inference from fibrewise rigidity.

For smooth F there are four nodes, four irreducible components, vertex genera summing to one and graph Betti number one; the genus is two. For irreducible nodal F there are five nodes, four rational normalization components and graph Betti number two; the genus is still two. Three equations in the five-dimensional ambient stack would give relative dimension two and cannot describe M̄₁,₁.

**Checks.**

- For F smooth of genus one, the glued curve has 4 nodes (three in the triangle and the attachment node), 4 components and dual-graph Betti number 4−4+1=1; its arithmetic genus is 1+1=2.
- For F a one-nodal rational curve, the glued curve has 5 nodes, 4 components and Betti number 5−4+1=2; arithmetic genus 0+2=2, and the fifth smoothing parameter is not set to zero on the image.
- dim M̄₁,₁=1 and dim M̄₂,₂=3·2−3+2=5, so the image has codimension 4, matching the four distinguished smoothing parameters.

([knudsen2](#references), Theorem 2.7 proof and Figure 4, printed p. 179 (PDF p. 19).)

*Needs:* SchemeAndStackFoundations §4.15, [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence), AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, StableReduction Layer 1, StableReduction Layer 3, [recovery of the labelled rational triangle](#2251-recovery-of-the-labelled-rational-triangle), [four fixed triangle smoothing parameters](#2253-four-fixed-triangle-smoothing-parameters).

### 2.255 The one-pointed genus-one base stack

M̄₁,₁ is a proper smooth Deligne–Mumford stack over Z of relative dimension one with relative normal-crossings boundary. Its rigid triangle-clutching realization in M̄₂,₂ is étale locally the intersection of four distinguished boundary branches. At a nodal one-pointed genus-one curve, the fifth ambient node-smoothing branch restricts to the boundary of M̄₁,₁.

The stack parametrizes stable one-pointed genus-one families, including irreducible nodal rational fibres; it is not the smooth elliptic locus alone.

One proof uses the following inputs and comparisons. Obtain the genus-at-least-two pointed stacks first by universal-curve induction, so the ambient M̄₂,₂ does not depend on this genus-one theorem. Use the specific rigid triangle closed immersion and its family recovery, not the false general closed-immersion claim of Knudsen II Corollary 3.9(b). On a smooth relative five-dimensional ambient chart, impose the four independent smoothing parameters from the rigid triangle and its attachment. The remaining relative parameter gives dimension one. Properness follows from the closed immersion into the proper ambient stack; the fifth branch at the nodal point gives the relative normal-crossings boundary.

The smooth elliptic locus has one remaining deformation parameter after imposing four equations in relative dimension five. The boundary parameter of an irreducible nodal genus-one curve remains free on the image; imposing it too would give only the boundary point.

([knudsen2](#references), Theorem 2.7 proof, printed p. 179 (PDF p. 19).)

*Needs:* [the rigid triangle locus](#2254-the-rigid-triangle-locus), SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, [stable genus-one curves and one-gons](#2250-stable-genus-one-curves-and-one-gons), [four fixed triangle smoothing parameters](#2253-four-fixed-triangle-smoothing-parameters).

### 2.256 Infinitesimal stable-reflexivity criterion

For a flat local map of Noetherian local rings (A,p)→(R,m), finite R-module M and ideal I⊆p, M is relatively stably reflexive over A if and only if M/I^nM is relatively stably reflexive over A/I^n for every n≥1, with chart ring R/I^nR. This is the local scope of Appendix Proposition 7. A global assertion needs the corresponding Jacobson condition on IR, not just I⊆Jac(A).

Local flat Noetherian A→R; M finite; I⊆p.

One proof uses the following inputs and comparisons. The forward direction is arbitrary coefficient base change. For the reverse direction, all quotient modules are A/I^n-flat. The infinitesimal flatness criterion gives A-flatness of M since IR is in the maximal ideal of R. The n=1 relative condition descends further to the closed coefficient fibre and supplies its absolute stable reflexivity; the local fibre definition applies.

Include I=0 and I=p. Prevent the false nonlocal extension: A=k[t]_(t), R=k(t)[x], I=(t), M=R/(x) has all quotient modules zero but is not relatively stably reflexive.

([knudsen2](#references), Appendix, Proposition 7, p. 195, in the local setup following Proposition 6. States the infinitesimal criterion as an exercise.; [stacks-completion](#references), Algebra Lemma 10.99.11, tag 0523. Flatness of every infinitesimal quotient detects flatness at target primes above the ideal; local targets satisfy the required support condition.)

*Needs:* DeformationAndDerivedPatchingAlgebra §3.3, [base change for relative stable reflexivity](#2232-base-change-for-relative-stable-reflexivity), [relative stable reflexivity](#2226-relative-stable-reflexivity).

### 2.257 Boundary under forgetting a mark

Under the universal-curve equivalence, the reduced boundary divisors satisfy B_(g,n+1)=π*B_(g,n)+Σ_(i=1)^n s_i(M̄_(g,n)) as relative effective Cartier divisors on the universal curve. The first term records old nodal fibres; the extra n section divisors record new old-mark collision tails. At a universal point on the j-th old node, t_j=xy and a local boundary equation becomes xy∏_(k≠j)t_k; at an old marking a local equation is a∏_k t_k. These are normal crossings étale locally, without asserting globally simple normal crossings.

The induction-step hypotheses, and reduced boundary with independent smoothing coordinates; ordered disjoint old markings.

One proof uses the following inputs and comparisons. A new expanded family is nodal exactly when the old curve was nodal or the extra point meets an old mark. The local smoothing calculations give multiplicity one for every component and identify the Cartier equations. Old markings lie in the smooth locus and are disjoint, so their new divisors are smooth relative to the base and meet only the old boundary branches transversely. Use the independent coordinates on a smooth atlas to descend relative normal crossings.

For (g,n)=(0,3), the old boundary is empty but the new boundary has three components. Do not omit the section terms or call the global boundary simple.

([knudsen2](#references), Theorem 2.7, p. 179, boundary induction. Describes the next boundary as old-boundary inverse image together with the canonical section loci.)

*Needs:* StableReduction Layer 2, [universal-curve induction](#2252-universal-curve-induction), [collision chart of pointed expansion](#2240-collision-chart-of-pointed-expansion), [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence).

### Two coefficient rings and a noninjective balancing quotient

The map R̂⊗_A N→R̂⊗_Â N imposes the relations (râ)⊗n=r⊗(ân); it is surjective and its kernel is generated by those differences. It need not be injective even when N is free of rank one over Â. Take A=ℚ[t]_(t), R=A, Â=R̂=ℚ[[t]] and N=Â. Choose α∈ℚ[[t]] outside ℚ(t), and a ℚ(t)-linear functional ℓ:ℚ((t))→ℚ(t) with ℓ(1)=0 and ℓ(α)=1. In `ℚ((t))⊗_{ℚ(t)}ℚ((t))`, the image of α⊗1−1⊗α is sent by ℓ⊗id to 1, hence is nonzero; multiplication sends it to 0. The finite-projective limit theorem concerns tensor over Â and does not identify it with tensor over A. (Knudsen II, Appendix Proposition 6, pp. 194–195; the counterexample is the displayed field-linear calculation.)

### Examples

At s=t=0 and γ=1, δ=0 in characteristic two, q=X(X+Y) has discriminant 1. At γ=δ=0, q=X² has discriminant 0: the polynomial matrix theorem still applies but the nodal geometric conclusion does not. At the origin Φ=((0,X),(−X,Y)) and Ψ=((Y,−X),(X,0)); their products equal X²I before quotient and zero after quotient. For the smooth elliptic attachment the labelled triangle gives four fixed nodes in dimension five; at its cusp there is a fifth node, while only the four fixed smoothing parameters are killed. The source has dimension one in both cases.

### Dependencies

Layers 0–1; StableReduction Layers 1–3 and 9; StablePeriodicCurved Layer 2; native polynomial, tensor, dual, categorical Ext, completion and limit APIs. Polynomial matrix and bidual comparisons precede relative criteria; completed coefficient exchange precedes formal-to-geometric transfer; expansion charts precede flatness and coherent inverse comparison.

## Layer 3: clutching, boundary strata and cotangent lines

### 3.1 Separating clutching morphism

For ordered complementary marking sets I,J and g₁+g₂=g, with stable source pairs (g₁,|I|+1),(g₂,|J|+1), define `ξ_{g₁,I}:M̄_{g₁,I∪{a}}×M̄_{g₂,J∪{b}}→M̄_{g,n}` by gluing a and b in the disjoint union. The new node is distinguished in the construction, but is forgotten in the target. The two source components may each be reducible.

All marking sets are finite and ordered/reindexed explicitly; every source vertex pair satisfies 2g_v−2+n_v>0. The stack morphism is specified on arbitrary schemes; the coherent pushout proof of StableReduction Layer 3 over locally Noetherian bases extends to arbitrary bases by the finite-stage approximation of §0.1.

One proof uses the following inputs and comparisons. Apply the external scheme clutching of StableReduction Layer 3 and reindex the remaining markings. Its arbitrary-base-change and isomorphism compatibility define the stack morphism.

Do not assume the target distinguishes which node was glued.

The construction has the following API.

- Glue the two distinguished smooth sections over their common base.
- The target arithmetic genus is g₁+g₂ with the ordered I∪J markings.
- The construction respects pullback and the canonical exchange of the two labelled inputs.
- Marked isomorphisms of each input induce the unique isomorphism of glued curves whose restrictions to the two inputs are the given maps; identity and composition follow from the pushout universal property.
- For any S-scheme T, maps from the glued curve to T are exactly pairs of maps from the two input curves that agree on the identified sections; the descended map is unique.

**Checks.**

- Gluing two copies of M̄₀,₃ gives a boundary point of M̄₀,₄ indexed by a2+2 partition.
- For n=0 and equal genera, swapping the two source factors induces the same target object; the graph exchange symmetry must be retained.
- Over C let three pairwise nonisomorphic elliptic curves form a stable genus-three one-pointed tree with the mark on the middle component. Choosing either outer elliptic tail gives two nonisomorphic preimages under `ξ_{1,∅}:M̄₁,₁×M̄₂,₂→M̄₃,₁`.

([knudsen2](#references), Definition 3.8, printed p. 190 (PDF p. 30), with Theorem 3.4 construction, pp. 181–183 (PDF pp. 21–23).)

*Needs:* SchemeAndStackFoundations §4.15, StableReduction Layer 3, StableReduction Layer 1.

### 3.2 Nonseparating clutching morphism

For g≥1 with stable source pair (g−1,n+2), define `ξ_irr:M̄_{g−1,n+2}→M̄_{g,n}` by identifying the last two ordered smooth sections. The genus increases by one and both glued labels disappear. Exchanging these two sections gives the same glued target and is part of the graph automorphism quotient, including characteristic two.

All marking sets are finite and ordered/reindexed explicitly; every source vertex pair satisfies 2g_v−2+n_v>0. The stack morphism is specified on arbitrary schemes; the coherent pushout proof of StableReduction Layer 3 over locally Noetherian bases extends to arbitrary bases by the finite-stage approximation of §0.1.

One proof uses the following inputs and comparisons. Apply the self-clutching pushout of StableReduction Layer 3 with its base-change isomorphisms. Use the graph-genus formula of StableReduction Layer 1 to obtain genus g.

An unlabelled nonseparating node does not order its branches.

The construction has the following API.

- Glue the last two sections by the self-clutching pushout of StableReduction Layer 3.
- Exchanging the two removed sections yields a canonically isomorphic target.
- The graph gains one edge and b₁ increases by one.
- The gluing comparison after T→S is the unique isomorphism induced by the two pushout diagrams; it preserves retained markings and satisfies identity and iterated-base-change coherence.
- A map from the self-glued curve to an S-scheme T is uniquely determined by a map from the input curve equal on the two identified sections.

**Checks.**

- M̄₀,₃ maps to the rational nodal boundary of M̄₁,₁.
- The boundary normalization retains the branch-exchange quotient; `M̄_{g−1,n+2}` alone is not the unlabelled normalization.
- Self-gluing two disjoint points on a connected genus-h curve gives arithmetic genus h+1.

([knudsen2](#references), Definition 3.8, printed p. 190 (PDF p. 30), with Theorem 3.4 construction, pp. 181–183 (PDF pp. 21–23).)

*Needs:* SchemeAndStackFoundations §4.15, StableReduction Layer 3, StableReduction Layer 1.

### 3.3 Cotangent lines at the markings

For the universal stable pointed curve `f:C→M̄_{g,n}`, define `Lᵢ=sᵢ*ω_{C/M̄}`. Each is an invertible sheaf because the marking is in the relative smooth locus; it identifies with `sᵢ*Ω¹_{C/M̄}`. Base change and relabelling preserve this line. The class ψᵢ=c₁(Lᵢ) is an exported input to the consumer’s tautological Chow-ring construction, not a new Chow theory here.

Here g,n≥0 with 2g−2+n>0 and 1≤i≤n; the universal marking sᵢ lies in the relative smooth locus. Use the relative dualizing sheaf of StableReduction Layer 2 and its base-change isomorphisms with the actual stack descent.

One proof uses the following inputs and comparisons. Pull back the nodal relative dualizing line of StableReduction Layer 2 along the smooth section. Use its agreement with relative differentials on the smooth locus and its base-change cocycle to descend a line on the stack.

The dual line is the normal line to the section.

The construction has the following API.

- For a family over S, the pulled-back line is `sᵢ*ω_{C/S}`.
- At a smooth marking `Lᵢ≅sᵢ*Ω¹_{C/S}`.
- Permuting marking labels permutes the corresponding line bundles.
- The line comparison for composable base maps U→T→S equals the composite of their comparisons under the canonical pullback associator, and the identity comparison is the identity; isomorphisms of pointed families preserve this data.
- On a family, the marking ideal Iᵢ gives Lᵢ≅sᵢ*(Iᵢ/Iᵢ²), canonically, using the smooth-section conormal/differential comparison. The section normal line is its dual.

**Checks.**

- On M̄₀,₃≅Spec Z every marking cotangent line is trivial.
- On M̄₀,₄≅P¹ each Lᵢ has degree 1.
- The section normal line is Lᵢ∨, so its first Chern class is −ψᵢ, not ψᵢ.

([knudsen3](#references), §4 definition (d), printed p. 201 (PDF p. 2), with sheaf descent preceding it on pp. 200–201.)

*Needs:* SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§1.18–1.23, StableReduction Layer 2.

### 3.4 The stack of persistent nodes

For stable g,n, define `N_{g,n}` over `M̄_{g,n}`: its objects over S are stable ordered n-pointed families C/S together with a section q:S→Sing(C/S) of the scheme-theoretic relative singular locus. Arrows preserve q. Its pullback along a family C/S is canonically Sing(C/S), so N→M̄ is representable by schemes, finite and unramified, with empty pullback for a smooth family. Over N there is a finite étale degree-two scheme B→N of branches at the chosen node, and its ordering torsor is a torsor under the constant group C₂. This étaleness is over N, not over M̄ or an arbitrary smoothing base.

Here g,n≥0, 2g−2+n>0; base schemes are arbitrary; family, singular-scheme and gluing inputs are the supplier contracts gap:integral-node-incidence and gap:relative-node-branch-data below. A chosen node is a section of Sing as a scheme, including its nilpotents. It need not exist on the whole base of a family with singular geometric fibres. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. Pull back the relative singular scheme (StableReduction Layer 1) of the universal curve and use its formation under arbitrary base change to define the stack of pairs. The identification `S×_{M̄}N=Sing(C/S)` includes its structure sheaf. The singular locus is closed in a proper curve, of finite presentation, and has finite geometric fibres. Apply AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite to obtain finiteness; nodality makes it unramified. On xy=a over R, it is Spec(R/(a)), since the relative Jacobian ideal is (x,y). On the base of a chosen persistent node, use the local gluing and normalization contract gap:relative-node-branch-data: split xy=0 has two branches, and their permutations are étale transition data. Descend the two-element scheme and its ordering torsor. Every change of split nodal chart permutes the two branches and satisfies the cocycle.

For xy=t over k[t], the node incidence is Spec k→Spec k[t], finite unramified and nonflat. The branch-ordering cover has two geometric points in characteristic two; it is not μ₂. A family pulled back into t=0 may have a persistent node even over a nonreduced base; use relative partial normalization rather than absolute normalization.

The construction has the following API.

- The stack N of stable curves with a chosen singular section.
- `S×_{M̄}N≅Sing(C/S)` as S-schemes, naturally in the family C/S and its isomorphisms.
- Node incidence commutes with every base map, with identity and composition comparisons inherited from the universal curve and singular-scheme base change.
- The forgetful morphism to M̄ is representable finite unramified.
- The degree-two finite étale branch scheme on N and its canonical free exchange involution.
- The Isom({a,b},B) ordering cover is a torsor under the constant permutation group of a two-element set; its quotient is N.
- Isomorphisms from (C,q) to (C′,q′) over S are exactly marked-family isomorphisms carrying q to q′. Forgetting the chosen node is faithful on arrows; identities and composition are inherited from families.

**Checks.**

- For C=Spec(k[t,x,y]/(xy−t)) over Spec k[t], the relative singular scheme is V(t), and its map to the base is not flat. This affine chart test does not require the curve to be proper.
- For R=k[ε]/ε² and xy=ε, the node incidence is Spec k, so its geometric node does not extend to a node section over Spec R.
- For xy=0 over any commutative R, incidence is Spec R and the branch scheme is Spec R ⨿ Spec R.
- For a smooth stable family Sing and its node-choice space are empty. In particular `N_{0,3}` is empty.
- Over F₂ the branch-ordering fibre is the constant two-element scheme, which is reduced; μ₂ is nonreduced.

([knudsen2](#references), Definition 3.8 and Corollary 3.9(a), §3, printed p. 190 (PDF p. 30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part (b), that a separating clutching morphism is a closed immersion, fails: a genus 2 curve with two elliptic components has two separating preimages, as in [finite unramified clutching](#37-finite-unramified-clutching).; [mc0-stacks-curves](#references), Lemma 53.21.1, §53.21, tag 0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.)

*Needs:* gap:integral-node-incidence, gap:relative-node-branch-data, StableReduction Layer 1, StableReduction Layer 3, SchemeAndStackFoundations §§1.18–1.23, SchemeAndStackFoundations §1.19, `Ideal.Quotient.mk`, `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, SchemeAndStackFoundations §4.15.

### 3.5 Stable one-edge boundary types

A pointed boundary type is a stable connected genus-g graph with n labelled legs and exactly one edge, up to label-preserving graph isomorphism, using the weighted dual graphs of StableReduction Layer 1. Its compactified normalization parameter stack is the product of the vertex moduli stacks modulo the finite automorphism group of this graph. For n=0,g≥2 the types are Δ₀ and Δᵢ for1≤i≤⌊g/2⌋, where Δ₀ is the closure of the nonseparating one-node locus, not merely the locus of irreducible nodal curves.

Here g,n≥0 with 2g−2+n>0; vertex genera are nonnegative integers; graph legs carry distinct fixed labels. At each vertex 2g_v−2+val(v)>0, where valence counts both flags of a loop and all legs. Graph automorphisms act by relabelling the corresponding vertex markings.

One proof uses the following inputs and comparisons. Specialize the stable graphs of StableReduction Layer 1 to one edge and keep leg labels. Use the normalization data of StableReduction Layer 1 and finite graph automorphisms to form the quotient parameter.

Higher-node curves can lie on several branches of the same global boundary component.

The construction has the following API.

- Associate the product of the pointed vertex moduli stacks.
- Graph automorphisms preserve genera and every external leg label.
- Clutching descends through the graph automorphism action to the target boundary divisor.
- The quotient [∏_v `M̄_{g_v,val(v)}/Aut(Γ)]` classifies, over S, an Aut(Γ)-torsor together with an equivariant family in the vertex product. Its descended clutching is compatible with pullback; quotient by the constant group retains stabilizers, including in characteristic two.

**Checks.**

- There are exactly three one-edge types for (g,n)=(0,4).
- The unpointed genus-two types are Δ₀ and Δ₁; Δ₁ has the exchange of its two genus-one vertices.
- The one-loop graph has branch-exchange automorphism, even in characteristic two; the quotient is by a constant finite group, not by μ₂.
- There is no stable one-edge genus-zero graph with three labelled legs: for two genus-zero vertices joined by an edge, stability requires at least two legs on each vertex. Thus M̄₀,₃ has empty boundary.

([knudsen2](#references), Definition 3.8, printed p. 190 (PDF p. 30).)

*Needs:* [separating clutching morphism](#31-separating-clutching-morphism), [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), SchemeAndStackFoundations §§1.18–1.23, StableReduction Layer 1.

### 3.6 Clutching fibres as decorated node choices

For a stable connected one-edge graph Γ with labelled external legs, let PΓ be the existing compactified vertex product and GΓ its constant finite label-preserving automorphism group. Let `NΓ⊂N_{g,n}` be the open-and-closed substack where partial normalization at the chosen node, with all other nodes retained, has the connected-component genera and external marking sets prescribed by Γ. Cutting and the gluing of StableReduction Layer 3 give an equivalence [PΓ/GΓ]≃NΓ over `M̄_{g,n}`. The map PΓ→NΓ is a finite étale GΓ-torsor in the sense of stacks, even when GΓ acts with fixed isomorphism classes. For any C/S, `S×_{M̄}PΓ` is the scheme of Γ-decorated node choices on C/S; forgetting the decoration is finite étale over the corresponding open-and-closed subspace of Sing(C/S). Consequently both ordered clutching maps are representable finite unramified, without a global closed-immersion assertion.

The family-level inverse to gluing is supplied by gap:relative-node-branch-data: partial normalization at a persistent node, compatible with arbitrary base change and retaining every other node. The original definitions of PΓ, GΓ and both clutching functors are imported without new copies. Γ has exactly one edge, and all its vertex types are stable. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. Over the branch-ordering cover use relative partial normalization, locally R[x,y]/(xy)→R[x]×R[y], with equal constants giving the original ring. Replace only the selected node. For an external edge the result has two connected components; for a loop it is connected. In either case its new smooth sections carry the two flags. The genus and stability formulas of StableReduction Layers 1 and 3 give exactly the vertex types. The gluing universal property and the relative partial-normalization comparison provide natural unit and counit isomorphisms on objects and arrows, compatible with base change. Thus this is an equivalence of groupoids over each scheme, not a count of geometric points. For families with a chosen node, its separating/nonseparating character and the genus/leg partition of the cut components are étale locally constant: the relative cut is proper flat nodal and its connected components and their genera persist in the nodal deformation charts. Equivalently smoothing the unchosen edges contracts only edges other than the chosen one and preserves these data. Use the relative component/genus contract in gap:relative-node-branch-data, not absolute normalization of the total space. Decorations are exactly identifications of these components/flags with Γ, a simply transitive GΓ-set after an étale cover. Descend their torsor. This proves the quotient equivalence and represents the fibre product by a finite étale cover of an open-and-closed part of Sing(C/S). Finiteness and unramifiedness then follow from persistent-node incidence; no argument infers étaleness over a smoothing base.

The fibre-product equivalence fixes the target family and its gluing isomorphism; it therefore keeps two different chosen nodes even if an automorphism of the target exchanges them. For a loop GΓ=C₂; for a separating edge it is C₂ exactly when g₁=g₂ and there are no external legs, and is trivial otherwise. The three-elliptic-chain counterexample has two node choices of the same Γ and hence two distinct preimages in the same ordered separating source. Use a relative cut over the actual base. Absolute normalization of a nonnormal or nonreduced total space is not this construction.

([knudsen2](#references), Definition 3.8 and Corollary 3.9(a), §3, printed p. 190 (PDF p. 30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part (b), that a separating clutching morphism is a closed immersion, fails: a genus 2 curve with two elliptic components has two separating preimages, as in [finite unramified clutching](#37-finite-unramified-clutching).; [mc3-edidin-fulghesu](#references), Propositions 4.4–4.6 and Theorem 4.7, §4, printed pp. 177–180 (PDF pp. 11–14). Graph labels give finite étale covers of a fixed stratum, and the quotient of the compactified vertex product is its stack normalization. The relative one-edge comparison below includes further degenerations and labelled external markings.; [mc0-stacks-curves](#references), Lemma 53.21.1, §53.21, tag 0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.)

*Needs:* gap:integral-node-incidence, gap:relative-node-branch-data, StableReduction Layer 1, StableReduction Layer 2, StableReduction Layer 3, SchemeAndStackFoundations §1.21, SchemeAndStackFoundations §1.15, SchemeAndStackFoundations §§1.18–1.23, [the stack of persistent nodes](#34-the-stack-of-persistent-nodes), [separating clutching morphism](#31-separating-clutching-morphism), [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), [stable one-edge boundary types](#35-stable-one-edge-boundary-types).

### 3.7 Finite unramified clutching

Both clutching morphisms are representable finite and unramified. For a fixed target stable curve their geometric fibres are finite choices of a node and, when relevant, an ordering or genus/marking assignment to its branches. These choices can be more than one even for a fixed separating genus and marking partition.

Use stable source and target pairs and the actual scheme clutching of StableReduction Layer 3. Relative singular loci in a smoothing need not be flat or étale over the base; only unramifiedness is used here.

One proof uses the following inputs and comparisons. An automorphism of the input mapping to the identity of the target restricts to the identity on its partial normalization, giving injectivity on stabilizers. Use the representability criterion for morphisms of Deligne–Mumford stacks by injectivity on stabilizers (SchemeAndStackFoundations §§1.18–1.23). Over a target family the fibre product records a persistent chosen node and ordered branch/marking/genus data, as in Knudsen’s auxiliary doubled stabilization argument. The relative singular locus is finite unramified for a proper nodal family, but generally not flat. The family representability and node-choice comparison is gap:relative-node-branch-data. The representable morphism is quasi-finite by finite node choices. Properness follows from proper source and separated target over Z; proper plus quasi-finite gives finiteness. The node-choice factorization gives unramifiedness; none of these steps requires a closed immersion of the entire separating map.

There can be two distinct separating preimages for two elliptic tails. For xy=t over k[t], the relative singular scheme has coordinate ring k[t]/(t); it is finite unramified over k[t] but not flat. Do not replace the node-choice scheme by a finite étale cover over a smoothing base.

([knudsen2](#references), Corollary 3.9(a) and its singular-locus factorization proof, printed p. 190 (PDF p. 30).)

*Needs:* gap:relative-node-branch-data, SchemeAndStackFoundations §§1.18–1.23, [separating clutching morphism](#31-separating-clutching-morphism), [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, StableReduction Layer 1, [the stack of persistent nodes](#34-the-stack-of-persistent-nodes), [clutching fibres as decorated node choices](#36-clutching-fibres-as-decorated-node-choices).

### 3.8 Node incidence on pointed boundary charts

Let `U→M̄_{g,n}` be a sufficiently small étale scheme chart at a geometric stable curve with r nodes, with the independent smoothing coordinates t₁,…,tᵣ of the pointed normal-crossing chart. After further étale localization, `U×_{M̄}N_{g,n}≅⨿_{j=1}^r` V(tⱼ). The universal curve near the jth selected node has equation xⱼyⱼ=tⱼ after étale localization on curve and base. The chosen-node map V(tⱼ)→U is a regular codimension-one immersion and its conormal is (tⱼ)/(tⱼ²). On overlaps nodes can be permuted, and the corresponding local conormal lines identify coherently. For a map S→U, the node-incidence formula pulls back to ⨿V(tⱼ|S); that pullback need not be normal or Cartier.

Here U is an étale chart of the moduli stack itself over Z, not an arbitrary family base. The pointed DM, universal-curve and normal-crossing results are imported from SchemeAndStackFoundations §4.15 and Layer 2; the underlying unpointed versal parameters are those of [completed framed hilbert charts](#113-completed-framed-hilbert-charts). Parameters are local near a fixed finite set of nodes, after shrinking. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. Start with the versal node coordinates of [completed framed hilbert charts](#113-completed-framed-hilbert-charts) for g≥2. Extend to pointed types using the universal-curve equivalence of [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence): adding a point at an old node replaces t by uv in the total base, while at a smooth point it adds a smooth coordinate; the new expanded curve has the corresponding two node parameters. Start separately at (0,3) and (1,1), as in the imported pointed DM proof. This is the chart form of that existing theorem, not a new moduli representability argument. Use the arbitrary-base nodal normal form of gap:relative-node-branch-data and the Jacobian calculation of incidence near each node. Finite unramified incidence can be étale locally separated into the chosen node branches, and after shrinking no additional singular points occur. Thus the jth branch is precisely V(tⱼ), with its scheme structure. Since U is smooth over Z and the tⱼ are independent relative parameters, each V(tⱼ) is smooth over Z, hence regular and normal, and tⱼ is a nonzerodivisor. The unramified morphism has the displayed rank-one conormal. On a common chart refinement the chosen node determines the same local closed immersion; compare its ideal quotients and descend.

For r=0 the incidence is empty and the boundary equation is the unit empty product. At r=2 the total boundary is V(t₁t₂), while its two node branches are V(t₁) and V(t₂). Over S mapping into tⱼ=0, pull back the conormal line from V(tⱼ); do not replace it by the ideal quotient of the zero ideal on S.

([mc0-stacks-curves](#references), Lemma 53.21.1, §53.21, tag 0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.; [mc1-etale](#references), Lemma 41.21.6, §41.21, tag 0CBR (unpaginated HTML). The normalization of a normal-crossings divisor is étale locally the disjoint union of its regular branches, with the conormal of each selected branch of rank one.; [knudsen2](#references), Definition 3.8 and Corollary 3.9(a), §3, printed p. 190 (PDF p. 30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part (b), that a separating clutching morphism is a closed immersion, fails: a genus 2 curve with two elliptic components has two separating preimages, as in [finite unramified clutching](#37-finite-unramified-clutching).)

*Needs:* gap:integral-node-incidence, gap:relative-node-branch-data, StableReduction Layer 1, SchemeAndStackFoundations §1.22, `Ideal.Cotangent`, [the stack of persistent nodes](#34-the-stack-of-persistent-nodes), SchemeAndStackFoundations §4.15, [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence).

### 3.9 Chosen nodes and stack normalization

Let Δ be the reduced total boundary of `M̄_{g,n}` over Z. Its normalization, in the sense of the imported DMNormalization construction, is canonically `N_{g,n}`. More explicitly, `⨿_{[Γ]}[PΓ/GΓ]≃N_{g,n}≃Δ^ν`, compatibly with the maps to `M̄_{g,n}`. The normalization map is representable finite unramified and is an equivalence over the one-node boundary locus. The statement is about stacks: inertia that fixes a selected node remains, while automorphisms permuting distinct nodes act between different lifts. The construction agrees with AlgebraicModuliForArithmeticGeometry §§5.1–5.4 normalization on every smooth chart; no normalization/base-change claim for an arbitrary family base is included.

Here g,n≥0 in the stable range; Δ is the reduced relative normal-crossings boundary over Z. Ordinary normalization means normalization of the reduction in its total rings of fractions. Z is an excellent Nagata base. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. By [node incidence on pointed boundary charts](#38-node-incidence-on-pointed-boundary-charts), the incidence over U is ⨿V(tⱼ) and the reduced boundary has equation ∏tⱼ. These branches are normal; their disjoint union is the normalization of V(∏tⱼ), including when several j have the same global boundary type. Invoke the planned AlgebraicModuliForArithmeticGeometry §§5.1–5.4 and its smooth-chart characterization to glue this identification uniquely on atlas overlaps; invoke the finite normalization of gap:integral-node-incidence for finiteness over Z. Do not construct stack normalization again here. Use the relative decorated-node equivalence to identify the connected type pieces of N with the graph quotients. Over a one-node curve the node scheme is the base, so the incidence is an equivalence on that locus, including its stabilizers. Combine with the local branch computation to obtain the original boundary-normalization endpoint.

On M̄₀,₃ the boundary, N and the coproduct of graph quotients are empty. For (0,4), the normalization is the three boundary sections over Spec Z. For (1,1), the boundary normalization is [M̄₀,₃/C₂]≃BC₂, not Spec Z. For (2,0), both Δ₀ and Δ₁ have the appropriate C₂ quotients. At the two-tail genus-three curve N has two selected-node lifts in the same type piece; a global boundary component need not be embedded smoothly.

([mc3-edidin-fulghesu](#references), Propositions 4.4–4.6 and Theorem 4.7, §4, printed pp. 177–180 (PDF pp. 11–14). Graph labels give finite étale covers of a fixed stratum, and the quotient of the compactified vertex product is its stack normalization. The relative one-edge comparison below includes further degenerations and labelled external markings.; [mc3-stacks-norm](#references), Lemmas 101.46.1–101.46.2 and Definition 101.46.3, §101.46, tags0GMI–0GMK (unpaginated HTML). Stack normalization is characterized by normalization on smooth scheme charts and glued from the normalized groupoid. AlgebraicModuliForArithmeticGeometry §§5.1–5.4 owns this general construction.; [mc1-etale](#references), Lemma 41.21.6, §41.21, tag 0CBR (unpaginated HTML). Normal crossings give an unramified normalization locally equal to the separate regular divisor branches.)

*Needs:* gap:integral-node-incidence, gap:relative-node-branch-data, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, SchemeAndStackFoundations §1.21, [clutching fibres as decorated node choices](#36-clutching-fibres-as-decorated-node-choices), [node incidence on pointed boundary charts](#38-node-incidence-on-pointed-boundary-charts).

### 3.10 Normalization of the boundary

The normalization of the reduced total boundary of `M̄_{g,n}` is the disjoint union, over stable one-edge types, of the corresponding vertex-product quotient stacks. Its finite map to the boundary records a distinguished node; it separates branches at curves with several nodes of the same type.

Use the full stable range, reduced total boundary and compactified vertex stacks; no quotient coarse spaces replace these stacks. The graph quotient is by the constant finite automorphism group acting on vertex factors and flag labels. Characteristic two is included without using μ₂ or averaging.

One proof uses the following inputs and comparisons. Use finite representable clutching and its invariant descent through the constant graph automorphism group. The product of vertex stacks is smooth and normal; its finite-group quotient is normal as a stack because the torsor atlas is étale, including in characteristic two. On the one-node stratum, partial normalization recovers the vertex data uniquely up to graph automorphisms, including automorphisms on objects. Check this as an equivalence of groupoids, not just uniqueness of geometric points. Local nodal smoothing charts show the same map separates the branches at a curve with several nodes. Use the stack normalization universal property after an étale atlas, with finite birational comparison and effective gluing. AlgebraicModuliForArithmeticGeometry §§5.1–5.4 names normalization but does not specify this stack-level theorem, which is gap:integral-node-incidence. The characteristic-zero descriptions in Hacking and CLP do not fill the integral supplier gap.

The map is not globally an isomorphism onto a smooth boundary divisor.

([knudsen2](#references), Definition 3.8 and Corollary 3.9(a), printed p. 190 (PDF p. 30); local normal-crossings charts in Theorem 2.7, p. 179; [hacking-boundary-review](#references), §4 normalization discussion, printed p. 813 (PDF p. 6), with §2 characteristic-zero hypotheses on p. 810 (PDF p. 3); [clp-normalized-boundary-review](#references), §2.1 opening and Lemma 2.1 proof, PDF pp. 4–5.)

*Needs:* gap:integral-node-incidence, [stable one-edge boundary types](#35-stable-one-edge-boundary-types), [finite unramified clutching](#37-finite-unramified-clutching), SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, [chosen nodes and stack normalization](#39-chosen-nodes-and-stack-normalization).

### 3.11 Cotangent-line correction under forgetting

For `π:M̄_{g,n+1}→M̄_{g,n}` and retained i, let `D_{i,n+1}` be the divisor of a rational tail carrying exactly marks i,n+1 and its attachment. Then Lᵢ on the source is `π*Lᵢ⊗O(D_{i,n+1})`; equivalently `π*Lᵢ=Lᵢ⊗O(−D_{i,n+1})`.

Here g,n≥0 with 2g−2+n>0, 1≤i≤n, and π forgets the last marking; `D_{i,n+1}` is the specified rational-tail Cartier divisor.

One proof uses the following inputs and comparisons. Use expansion/contraction of the universal curve to compare the two marking ideals, as in the exact sequence at the start of Knudsen III p. 203. Transversality of the retained section with the exceptional collision locus makes the pulled-back sequence exact; the quotient is a rank-one sheaf supported with multiplicity one on `D_{i,n+1}`. Take the associated divisor to obtain π*Lᵢ≅Lᵢ(−D). The coherent transverse-pullback comparison is part of gap:relative-node-branch-data.

In genus zero the degree difference produces deg Lᵢ=1 on M̄₀,₄.

([knudsen3](#references), Theorem 4.1(c), printed p. 202 (PDF p. 3); proof’s transverse-section exact sequence, p. 203 (PDF p. 4).)

*Needs:* [cotangent lines at the markings](#33-cotangent-lines-at-the-markings), SchemeAndStackFoundations §4.15, [stable one-edge boundary types](#35-stable-one-edge-boundary-types), StableReduction Layer 2, [coherent universal-curve equivalence](#2248-coherent-universal-curve-equivalence).

### 3.12 The integral smoothing conormal

For `j:N_{g,n}≃Δ^ν→M̄_{g,n}`, construct the invertible conormal C_j by its étale-local description (t)/(t²) for the selected node branch, and its dual normal line C_j^∨. On the vertex-product cover PΓ→NΓ, give the canonical isomorphism C_j|PΓ≅L_a⊗L_b. The graph-equivariant structure uses ordinary unsigned symmetry when the flags are exchanged. In split charts a change of branch parameters x′=u₁x+O(x²), y′=v₁y+O(y²) on the cut central curve multiplies the smoothing conormal generator by u₁v₁; general lifts across the first infinitesimal neighborhood give the same law, regardless of their higher terms. These transitions satisfy composition, base-change and atlas-refinement coherence over Z, including characteristic two.

Here j is the finite unramified chosen-node map; its local closed-immersion charts are supplied by [node incidence on pointed boundary charts](#38-node-incidence-on-pointed-boundary-charts). L_a,L_b are the imported marking cotangent lines on the cut curve, using their identification with branch differentials. The coordinates are formal parameters along the two smooth sections; their linear coefficients are units in the base ring. This concerns the conormal of the chosen branch in the moduli stack. It is not the ideal of an arbitrary pulled-back boundary family, or the torsion differential on the singular curve. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. On each pointed nodal moduli chart use the conormal of V(t) in U, and descend on common étale refinements. This produces a line because t is regular on the moduli chart. The native module for an affine ideal quotient is Ideal.Cotangent; scheme and stack sheafification remain supplier operations. Compute the first-order smoothing class of xy=0 over any R by the relation module of the hypersurface: the map A²→A is (α,β)↦yα+xβ, and its cokernel is A/(x,y)=R, where A=R[x,y]/(xy). A perturbation of the equation contributes its value at the node; changes of lifted coordinates contribute a Jacobian term and disappear in this quotient. This computation, including nilpotents in R, shows that higher branch-parameter terms change no first-order multiplier. Comparing xy=t and x′y′=t′ gives [t′]=u₁v₁[t]. At each branch, [dx′]=u₁[dx] and [dy′]=v₁[dy]. Hence [t]↦[dx]⊗[dy] is independent of the split parameter choice. On overlaps with varying base coordinates use these pullback differential lines and the same relative Jacobian calculation. The product of slopes under composition is exactly the tensor transition cocycle. Polishchuk Proposition 3.5 and Lemma 4.6 provide an independent integral formal-coordinate check; Theorem 1.2 over Q is not used. For exchange x↔y, the relation xy and t are unchanged. The tensor identification exchanges the two factors by TensorProduct.comm without a sign. Descend the equivariant line along the constant GΓ-torsor and then along the moduli atlas by SchemeAndStackFoundations §1.22. Invertibility and equality of maps can be checked after the faithfully flat cover. Use no averaging and no exactness claim for invariants. Dualizing gives the normal line L_a^∨⊗L_b^∨; with a consumer’s integral or rational first-Chern-class API its class is −ψ_a−ψ_b. Only the class notation is imported from intersection theory, not a new Chow theory.

Exchange must preserve the smoothing conormal over Z. The differential x dy instead changes to y dx=−x dy on xy=0 and is a different object. The identification extends across extra nodes because it is made for the selected branch rather than only on the open one-node locus. For a change x′=x+cx² on a branch, its slope is 1, hence the induced conormal multiplier is 1; nonlinear terms cannot create an extra factor.

The construction has the following API.

- The invertible conormal of N→M̄ from its étale-local codimension-one immersions.
- On the selected-node chart V(t)⊂U the line is the sheaf associated to (t)/(t²).
- On PΓ identify the conormal with L_a⊗L_b by [t]↦dx⊗dy.
- For arbitrary formal changes of the two branch parameters with slopes u₁,v₁, the conormal comparison multiplies by u₁v₁. Coordinate-lift errors in the Jacobian ideal do not contribute.
- The comparison C_j|PΓ≅L_a⊗L_b commutes with flag exchange and the unsigned symmetry of the two cotangent factors; exchange squared is the identity.
- Pullback of the line along S→N agrees with s_a*Ω⊗s_b*Ω on an ordered cut, and the comparisons satisfy identity, composition and common-atlas-refinement coherence.
- The dual line, with its canonical comparison to L_a^∨⊗L_b^∨ on every vertex cover.
- Two morphisms between the descended conormal lines agree if their pullbacks agree on a jointly surjective étale selected-node atlas. In particular the chart comparison and C_j|PΓ≅L_a⊗L_b determine the descended comparison uniquely, also in characteristic two.

**Checks.**

- For x′=ux,y′=vy,t′=uvt with u,v units in any R, both conormal and branch tensor generators scale by uv; the normal generator scales by (uv)^(−1).
- The change x′=x+cx² with inverse as a formal series, and y′=y+dy², has trivial induced multiplier on the chosen conormal. This checks more than constant rescalings.
- The exchange of x and y fixes [t] and gives dx⊗dy↦dy⊗dx integrally, including over F₂. The constant exchange torsor remains étale in characteristic two.
- On V(t₁t₂)⊂U, choosing node1 gives (t₁)/(t₁²). Pulling back the total divisor conormal instead brings the other branch factor and vanishes in its comparison at t₂=0; it cannot replace the chosen conormal.
- A family S→N with t|S=0 still pulls back a rank-one conormal line. The ideal of its inverse-image boundary in S is zero and would give a zero conormal.

([mc3-polishchuk](#references), Proposition 3.5, §3.3, p. 11; Lemma 4.6 and proof of Theorem 1.1, §4.3, pp. 15–16. Over commutative Z[q]/q^(n+1)-algebras, the boundary section is the smoothing parameter and its determinant trivialization is invariant under the gluing group, with the inverse scaling for a parameter rescaling. This supports the integral transition law; the arbitrary-pointed atlas and conormal comparison are deduced explicitly here.; [hacking-boundary-review](#references), §3 pp. 810–811 and Lemma 4.2, §4, pp. 813–814 (PDF pp. 3–4,6–7). The normal space is the local node-deformation space, and the pullback of the boundary conormal is the tensor of branch cotangent lines. The source’s characteristic-zero scope is retained as a comparison check.; [mc0-stacks-curves](#references), Lemma 53.21.1, §53.21, tag 0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.)

*Needs:* gap:integral-node-incidence, gap:relative-node-branch-data, StableReduction Layer 1, StableReduction Layer 2, SchemeAndStackFoundations §1.22, SchemeAndStackFoundations §1.1, `Ideal.Cotangent`, `TensorProduct.comm`, `TensorProduct.map`, `TensorProduct.map_comp`, `TauCeti.AlgebraicGeometry.InvertibleSheaf`, [chosen nodes and stack normalization](#39-chosen-nodes-and-stack-normalization), [node incidence on pointed boundary charts](#38-node-incidence-on-pointed-boundary-charts), [clutching fibres as decorated node choices](#36-clutching-fibres-as-decorated-node-choices), [cotangent lines at the markings](#33-cotangent-lines-at-the-markings).

### 3.13 The node-smoothing conormal line

On the vertex-product cover of a normalized one-edge boundary branch, its conormal line is canonically L_a⊗L_b, with the two cotangent lines at the preimages of the distinguished node. This identity is equivariant for the constant graph automorphism group and descends to the boundary normalization. The corresponding normal line is L_a∨⊗L_b∨. Where the consumer supplies first Chern classes on these stacks, its class is −ψ_a−ψ_b. This is a chosen-branch statement, not a claim that the whole boundary component is smoothly embedded.

Use a distinguished node branch on the normalized reduced boundary; do not replace its conormal with the conormal of the entire possibly self-intersecting component. The line identity is integral. Hacking’s explicit source statement is characteristic zero; extending it over Z uses gap:relative-node-branch-data and gap:integral-node-incidence.

One proof uses the following inputs and comparisons. Work on a versal nodal deformation chart xy=t with the selected boundary branch t=0. Its conormal is generated by t modulo t². For changes of branch parameters x′=ux+higher terms and y′=vy+higher terms, the first-order smoothing class t′ modulo t² transforms by u₀v₀. The branch differential frames transform by u₀ and v₀; identify the conormal with their tensor. Prove independence from the higher-order terms via the node deformation module, rather than checking only linear rescalings. Branch exchange sends x,y to y,x and preserves xy=t, so the conormal exchange is the usual unsigned tensor symmetry, including characteristic two. Check all graph-equivariance and atlas/base-change cocycles. The integral deformation-line and descent input is gap:relative-node-branch-data with gap:integral-node-incidence; the characteristic-zero reference is not silently generalized.

Dualizing changes the sign of both ψ classes. For x′=ux and y′=vy, the conormal generator transforms by uv, whereas the dual normal generator transforms by (uv)⁻¹. Exchanging the two branches preserves the smoothing parameter; an extra sign representation on the nonseparating conormal would be wrong. The torsion-differential generator x dy changes sign under branch exchange and is therefore not a substitute for the smoothing conormal without an additional comparison.

([hacking-boundary-review](#references), Lemma 4.2, printed p. 814 (PDF p. 7); branch/Ext description on p. 811 (PDF p. 4); characteristic-zero scope on p. 810.)

*Needs:* gap:relative-node-branch-data, gap:integral-node-incidence, [cotangent lines at the markings](#33-cotangent-lines-at-the-markings), [normalization of the boundary](#310-normalization-of-the-boundary), SchemeAndStackFoundations §4.15, StableReduction Layer 1, [the integral smoothing conormal](#312-the-integral-smoothing-conormal).

### 3.14 Marking lines under clutching and forgetting

For every retained external label i, separating or nonseparating clutching pulls L_i on the target back canonically to the marking cotangent line on the vertex factor carrying i. These isomorphisms commute with marked-family isomorphisms, relabelling, iterated arbitrary base change, and permitted graph permutations. The marking-line conormal comparison L_i≅s_i*(I_i/I_i²) uses the smooth section; its dual is the section normal line. For `π:M̄_{g,n+1}→M̄_{g,n}` the contraction-induced morphism π*L_i→L_i factors through the imported isomorphism `π*L_i≅L_i(−D_{i,n+1})` followed by the canonical inclusion `L_i(−D_{i,n+1})→L_i`. This morphism has a simple zero along the rational-tail divisor. Its identity away from D and divisor description are compatible with the same pullback and relabelling conventions.

Here 2g−2+n>0 for the forgetful target; i is retained, and all source vertex types of a clutching map are stable. `D_{i,n+1}` is the rational tail with marks i,n+1 and the attaching node, a Cartier divisor on the moduli stack. The comparison is pulled back as a line-bundle isomorphism even when a family maps into D. The arbitrary-base dualizing and Cartier-section comparisons use gap:cm-duality-arbitrary-base and finite-diagram approximation in Layer 0. Arbitrary-base pullback uses [finite-diagram approximation](#01-finite-stage-models-of-pointed-curve-diagrams), gap:relative-node-branch-data and gap:integral-node-incidence; the smoothing-line calculation is proved in this layer.

One proof uses the following inputs and comparisons. The clutching morphism of StableReduction Layer 3 is an isomorphism near every retained smooth section. Pull back relative differentials along that section and use the imported canonical identification s_i*ω≅s_i*Ω. This gives the retained-line comparison without choices of local coordinates. Use the smooth-section conormal/differential comparison in the integral smoothing-conormal comparison in this layer; the ideal vanishes along the section, but its restriction I/I² is rank one. Base change and gluing uniqueness (StableReduction Layer 3) give unit, composition, relabelling and graph-equivariance diagrams; descent uses the compatible-family formulation of stack QCoh. For forgetting use [cotangent-line correction under forgetting](#311-cotangent-line-correction-under-forgetting) with its source proof: Knudsen III Theorem 4.1(c), pp. 202–203, pulls the exact sequence to a section transverse to the exceptional divisor. The quotient has length one along D, so the map π*L_i→L_i has exactly that simple zero. This fixes the sign and hence L_i≅π*L_i⊗O(D). Do not reprove contraction or construct new ordinary sheaf tensor operations here.

For M̄₀,₄→M̄₀,₃, π*L_i is trivial and `D_{i,4}` is one boundary section; thus L_i has degree 1 on P¹, fixing the sign. For retained marks on opposite sides of separating clutching, the two comparisons land on their respective factors. Self-clutching leaves every retained marking line unchanged. Pullback along a constant map into D preserves the line-bundle identity; it does not preserve the effective-Cartier presentation as an embedding in that base.

([knudsen3](#references), Marking-line definition in §4, printed p. 201 (PDF p. 2); Theorem 4.1(c) and its proof, printed pp. 202–203 (PDF pp. 3–4). The contraction comparison has the negative rational-tail twist on π*L_i, proved using a transverse-section exact sequence.; [knudsen2](#references), Definition 3.8 and Corollary 3.9(a), §3, printed p. 190 (PDF p. 30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part (b), that a separating clutching morphism is a closed immersion, fails: a genus 2 curve with two elliptic components has two separating preimages, as in [finite unramified clutching](#37-finite-unramified-clutching).; [hacking-boundary-review](#references), §3 pp. 810–811 and Lemma 4.2, §4, pp. 813–814 (PDF pp. 3–4,6–7). The normal space is the local node-deformation space, and the pullback of the boundary conormal is the tensor of branch cotangent lines. The source’s characteristic-zero scope is retained as a comparison check.)

*Needs:* gap:cm-duality-arbitrary-base, gap:integral-node-incidence, gap:relative-node-branch-data, StableReduction Layer 2, StableReduction Layer 3, SchemeAndStackFoundations §1.22, `TauCeti.AlgebraicGeometry.InvertibleSheaf`, [cotangent lines at the markings](#33-cotangent-lines-at-the-markings), [cotangent-line correction under forgetting](#311-cotangent-line-correction-under-forgetting), [separating clutching morphism](#31-separating-clutching-morphism), [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), SchemeAndStackFoundations §4.15.

### Examples

For the genus-two curve with two rational components joined at three nodes, the dual graph has V=2, E=3 and b₁=3−2+1=2. Its split graph automorphism group is S₃×C₂, of order twelve: edge permutations and component exchange commute. Choosing one persistent node gives an orbit of size 12/4=3; choosing an ordered pair of its branches gives 12/2=6. The nonabelian S₃ action and the cyclic branch exchange remain quotient-stack data in characteristics two and three; division by their orders is not part of the construction. This detects both discarded inertia and confusion of node choices with ordered branch choices. (Knudsen II, §3; Canning–Larson–Payne v3, §2.1, pp. 4–5; the displayed graph calculation gives the orbit sizes.)

A self-node contributes two flags. The (0,4) boundary has three points whereas (0,3) has none, so old-mark collisions contribute to forgetting. Exchanging genus-one factors changes the ordered Hodge determinant by −1, but the smoothing conormal exchange by +1. Constant C₂ inertia survives over characteristic two.

### Dependencies

Layers 0–2; StableReduction Layers 1–3; SchemeAndStackFoundations §§1.18–1.23 and 4.15; AlgebraicModuliForArithmeticGeometry §5.4. Construct elementary clutching and the boundary graph set before their decorated-fibre comparison; construct marking lines before proving their clutching laws. These API consequences are not premises for the defining constructions.

## Layer 4: coarse moduli, projectivity and full level

### 4.1 Coarse spaces of pointed curve stacks

For each stable pair construct the coarse algebraic spaces `q:M̄_{g,n}→M̄^{coarse}_{g,n}` and `q°:M_{g,n}→M^{coarse}_{g,n}`. They are initial for maps to algebraic spaces and induce bijections between geometric points and isomorphism classes. Stable coarse spaces are proper over Z. Existence alone gives neither smoothness of the coarse space nor a universal family on it; base change is used only with the hypotheses of the imported coarse-space theorem.

One proof uses the following inputs and comparisons. The finite diagonal gives finite inertia; apply the generic coarse-space existence theorem with its noetherian finite-type hypotheses. Use the proper coarse-space comparison to deduce properness. Restrict the stable coarse space to the saturated smooth open; geometric curve smoothness is invariant under isomorphism.

Smooth stacks can have singular coarse spaces.

The construction has the following API.

- For algebraically closed k, coarse k-points correspond to curve isomorphism classes.
- A stack morphism to an algebraic space factors uniquely through q.
- The smooth coarse space is the saturated open corresponding to smooth curves.
- For each base change covered by the finite-inertia coarse-space theorem, compare the base-changed coarse space with the coarse space of the base-changed curve stack. State the permitted class (for example flat base change); do not claim all base changes without a theorem.

**Checks.**

- For (g,n)=(0,3),q is the isomorphism Spec Z→Spec Z.
- The stable coarse space for (0,4) is P¹_Z.
- Over a characteristic-zero field (E,0) retains [−1] in the stack although its coarse point has no automorphism data; a coarse class does not make it a fine moduli object.

([clm](#references), Lemma 1.3, p. 3.)

*Needs:* SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§5.1–5.4.

### 4.2 Full symplectic level on smooth curves

Fix g≥2 and N≥3 invertible on the base. A full homogeneous Jacobi level on a smooth genus-g curve is a group-scheme isomorphism `α:(Z/N)^{2g}→J(C)[N]` whose transported Weil pairing is the standard alternating form through some isomorphism Z/N≅μ_N. Fixing a primitive root ζ_N specifies a base Z[1/N,ζ_N] and the symplectic subfunctor with that exact pairing. The homogeneous functor over Z[1/N] has its induced primitive-root/multiplier morphism; after choosing ζ_N its symplectic-similitude frames separate according to the multiplier. The exact symplectic component and the whole similitude functor are distinct, not equivalent moduli problems after forgetting the choice.

Here g≥2; N≥3 is invertible on every test base. The fixed symplectic flavour includes a chosen primitive root ζ_N; the homogeneous flavour retains its multiplier. The JacobianChallengePartII §§1.1–1.4 suppliers initially construct smooth projective geometrically connected families over Noetherian bases. General test families require the tricanonical Noetherian atlas, arbitrary pullback and effective polarized-abelian descent specified below; no field theorem is used as family representability.

One proof uses the following inputs and comparisons. On the Noetherian smooth-curve tricanonical atlas from [hilbert quotient presentation](#111-hilbert-quotient-presentation) import JacobianChallengePartII §§1.1–1.4. JacobianChallengePartII §§1.1–1.4 supplies arbitrary, including nonreduced, pullbacks of this family. Descend these actual polarized abelian schemes along the curve-family atlas, using functorial curve isomorphisms and their all-test-scheme cocycle. The precise arbitrary-base polarized-Jacobian descent and cohomological frame bridge is gap:polarized-atlas-descent; the Noetherian JacobianChallengePartII §§1.1–1.4 statements do not by themselves prove it. Use A3 prime-to-characteristic torsion and Weil pairing and M6 symplectic frames. Define the pairing-preserving isomorphism functor and curve-level isomorphisms. For the DM H¹ étale formulation retain the separate SchemeAndStackFoundations §§3.3–3.7 cup-product/Tate-twist/dual comparison; a Jacobian existence theorem does not fix that convention.

N is invertible; level at the characteristic is a different problem.

The construction has the following API.

- The Weil pairing is the standard form through the chosen ζ_N in the fixed-component flavour.
- Base change pulls back the Jacobian torsion and the pairing identification.
- Forgetting the chosen μ_N trivialization gives the homogeneous symplectic-similitude object, with its multiplier component.
- For `A∈Sp_{2g}(Z/N)`, α↦α∘A preserves the fixed pairing component and gives a right action with α∘1=α and (α∘A)∘B=α∘(AB). A GSp frame change instead transforms the multiplier by its similitude factor.
- Two levels on a fixed smooth curve are equal exactly when their group-scheme maps on `(Z/N)^{2g}` agree; isomorphisms of curve-level objects must carry one such map to the other.

**Checks.**

- The full similitude-level space over Q can have several geometric components; the DGH space selects one via ζ_N.
- For N=2 the automorphism [−1] acts trivially on N-torsion, so this level does not remove the hyperelliptic curve stabilizer.
- If char(k) divides N, J[N] need not be constant étale of rank `N^{2g}`; the stated definition of full étale level does not apply.

([dm](#references), Definitions 5.3–5.4 and §5.14, pp. 105,108; [blr-relative-picard-LwkQQl](#references), §9.4 Proposition 4, statement p. 260 and section-translation descent proof pp. 260–261.)

*Needs:* gap:polarized-atlas-descent, SchemeAndStackFoundations §4.15, AbelianSchemesAndArithmeticModuli §§A3.1–A3.8, PELModuli §§M6.9–M6.10, SchemeAndStackFoundations §§3.3–3.7, [hilbert quotient presentation](#111-hilbert-quotient-presentation), JacobianChallengePartII §§1.1–1.4, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3.

### 4.3 Nefness with smooth generic fibre

Let f:X→B be a family of nodal curves of genus g≥2 over a smooth projective curve over an algebraically closed field, with smooth generic fibre. For m≥2, f_*ω^m is nef.

One proof uses the following inputs and comparisons. Resolve the isolated rational double points crepantly and preserve pluricanonical pushforwards. Treat contraction of smooth exceptional curves separately; its discrepancy divisor must be retained: K_X=b*K_Y+E for a blowup of a smooth surface point. After finite base covers arrange base genus≥2. In characteristic p>0, iterate Frobenius to make a negative line quotient `f_*ω^m→M^{-1}` have arbitrarily negative degree; write M=ω_B^m⊗L with L very ample. The quotient gives H¹(B,L⊗ω_B^m⊗f_*ω^m) of dimension≥g(B)≥2. Projection formula and the low-degree Leray injection give H¹(X,ω_X^m⊗f*L) of dimension≥2 on a smooth minimal general-type surface. Choose a reduced union D of smooth fibres in |f*L|. Its connected components have genus≥2 and O(D)|_D is trivial. Apply the Mumford–Ekedahl bound to the positive twist ω_X^m(D): zero except possibly p=2,m=2, where the dimension is≤1. Use finite-cover nef descent and spreading of the negative quotient to positive characteristic. Rational-double-point resolution, general type, contraction, vanishing and spreading are gap:surface-pluricanonical-comparison, gap:surface-general-type and gap:positive-surface-twist.

The exceptional surface bound is sufficient; it is not claimed to be zero.

([clm](#references), Proposition 6.3 and Lemmas 6.4–6.5, pp. 23–26.)

*Needs:* gap:positive-surface-twist, gap:surface-general-type, gap:surface-pluricanonical-comparison, SchemeAndStackFoundations §§5.1–5.10, StableReduction Layer 2, StableReduction Layer 4, StableReduction Layer 5.

### 4.4 Rigidity of full curve level

For a smooth genus-g curve g≥2 over an algebraically closed field with N≥3 prime to the characteristic, an automorphism acting trivially on full N-torsion of its Jacobian is the identity. Consequently the curve full-level stack has trivial inertia.

One proof uses the following inputs and comparisons. Use faithfulness of Aut(C)→Aut(J(C),λ), separately from finite curve automorphism groups. Use Serre’s full-level rigidity for finite-order abelian automorphisms: choose an odd prime dividing N or the level-four2-adic case. Use AbelianSchemesAndArithmeticModuli §A6.18 `polarizedAutomorphisms` on the canonically polarized Jacobian; the finite-order congruence tool there also supplies the odd-prime and level-four route described by Serre’s Appendix.

N=2 fails because of hyperelliptic[−1].

([dm](#references), §5.14, p. 108.)

*Needs:* AbelianSchemesAndArithmeticModuli §A6.18 `polarizedAutomorphisms`, gap:strong-torelli-faithfulness, [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), PELModuli §§M6.9–M6.10, StableReduction Layer 3, JacobianChallenge Layer D.

### 4.5 Nonnegative dualizing degree along a section

Let B be a smooth projective connected curve over an algebraically closed field and f:X→B a proper flat finitely presented family of geometrically connected nodal curves of arithmetic genus g≥2, with smooth generic fibre. For every section s:B→X through the relative smooth locus, `deg(s*ω_{X/B})≥0`.

Use the smooth-generic direct-image nef theorem for m≥3; no stability assumption on every fibre and no special-fibre vanishing for ω^m(−s) are imposed. StableReduction Layers 2 and 8 supply relative duality and generic pluricanonical generation; torsion-free modules on the nonsingular curve give the invertible evaluation image and its effective-divisor comparison, while SchemeAndStackFoundations §4.15 supplies nef quotients.

One proof uses the following inputs and comparisons. Choose m≥3. On the smooth generic fibre, ω^m is globally generated, so evaluation f_*ω^m→s*ω^m is generically surjective. On the smooth integral base curve B the image is an invertible sheaf I=s*ω^m(−D) for an effective divisor D. It is a locally free quotient of the nef bundle f_*ω^m, hence deg I≥0. Thus m deg(s*ω)=deg I+deg D≥0. No vanishing of R¹f_*(ω^m(−s)) on every special fibre is used: an unstable rational tail can make it nonzero. A nonzero subsheaf of a line on a nonsingular curve is that line tensored with an effective ideal O(−D); use SchemeAndStackFoundations §4.15 for nef quotient positivity.

For the blowup of a smooth genus≥2 family at a special-fibre point, a section on the exceptional rational tail still has nonnegative dualizing degree. On a genus≥2 curve with an attached rational tail containing s, Serre duality gives nonzero H¹(ω^m(−s)) for m≥2: the dual `ω^{1−m}(s)` has sections supported on the tail and vanishing at the attaching point. The proof must survive this failure of the former vanishing claim.

([clm](#references), Corollary 6.6, printed/PDF p. 25 (statement and proof).)

*Needs:* [nefness with smooth generic fibre](#43-nefness-with-smooth-generic-fibre), StableReduction Layer 2, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21.

### 4.6 Nefness on pointed normalization components

Let f:X→B be a nodal family over a smooth projective algebraically closed field curve with smooth connected generic fibre, and s_i disjoint smooth-locus sections. For integers m≥2 and 0≤a_i≤m, f_*ω^m(Σa_i s_i) is nef, including a zero direct image in the negative-degree genus-zero cases.

One proof uses the following inputs and comparisons. Use gap:surface-pluricanonical-comparison and gap:weighted-collision-transport for the passage between marked models in Proposition 6.7. If b:S′→S blows up a smooth point p through sections indexed by I, the marked relative pluricanonical line on S′ is b*ω_(S/B)^m(Σa_iD_i)⊗O((m−Σ_(i∈I)a_i)E). Individual bounds 0≤a_i≤m do not bound the sum at a collision. For coefficient k≥0 its pushforward is the original line; for k<0 it is that line tensored with I_p^(−k). Nefness on the original marked model therefore requires the stated marked-model transport, including these negative elementary modifications; it does not follow from nefness of the unmodified pushforward. For genus≥2 begin with the smooth-generic nef theorem. The section increment has adjunction quotient `(s_i*ω)^{m−a_i−1}` with nonnegative exponent and degree. Justify the direct-image sequence on the reduced model; do not assert fibrewise R¹-vanishing on an arbitrary unstable original nodal family. For genus 0, the direct image is zero when Σa_i<2m. Once Σa_i≥2m, Hodge index for the disjoint sections allows an increment with nonpositive self-intersection; adjunction gives a nonnegative quotient degree. For genus 1 with a section use the canonical formula ω_S≅f*(ω_B⊗L⁻¹)⊗O_S(Σa_tF̄_t) and deg L=−χ(O_S)−length(T) of K3SurfacesAndSymplecticBoundedness §6.0b, and χ(O_S)≥0 from gap:surface-low-genus-positivity. If there are no sections, supply a finite base change acquiring one and descend nefness. Use gap:weighted-collision-transport and gap:surface-low-genus-positivity for these model comparisons; finite-cover nef descent is SchemeAndStackFoundations §4.15.

This is a positivity statement for vector bundles, not just numerical degree of their determinants. The final weight range remains 0≤a_i≤m.

**Checks.**

- Let B=ℙ¹, S=ℙ¹×B, D₁ the constant zero section and D₂ the diagonal; they meet at p=(0,0). For m=a₁=a₂=2, ω_(S/B)²(2D₁+2D₂)=O_S(0,2). Blowing up p separates the sections and gives b*O_S(0,2)⊗O(−2E), so b_*O(−2E)=I_p². On B the direct images are O_B(2) and O_B(2)(−2[0])=O_B, of degrees 2 and 0. Both are nef; equating them would fail.
- A single incident weight a=m gives exceptional coefficient zero, hence no ideal correction. Two incident weights m give coefficient −m, including m=2 in characteristics two and three.
- For a constant genus-zero family with disjoint constant marks, Σa_i<2m gives zero pushforward; Σa_i=2m gives the trivial rank-one bundle. At Σa_i=2m+1 its rank is two. These cases use the whole weight range.

([clm](#references), Proposition 6.7, printed/PDF pp. 25–27, statement p. 25 and three genus cases pp. 26–27.)

*Needs:* gap:weighted-collision-transport, gap:surface-low-genus-positivity, gap:surface-pluricanonical-comparison, K3SurfacesAndSymplecticBoundedness §6.0b, [nefness with smooth generic fibre](#43-nefness-with-smooth-generic-fibre), [nonnegative dualizing degree along a section](#45-nonnegative-dualizing-degree-along-a-section), SchemeAndStackFoundations §§5.1–5.10, StableReduction Layer 2.

### 4.7 Direct-image sequence at persistent nodes

After a finite base change splitting the horizontal nodes of a stable family X/B, normalize along them, ν:X^ν→X, and let D^ν be the two branch divisors. Then `ν*ω_{X/B}≅ω_{X^ν/B}(D^ν)`. For m≥2 there is an exact sequence `0→(fν)_*ω_{X^ν/B}^m((m−1)D^ν)→f_*ω_{X/B}^m→f_*O_D→0`, with f_*O_D a direct sum of copies of O_B.

One proof uses the following inputs and comparisons. Use the conductor and dualizing comparison of StableReduction Layers 1–2 and the antidiagonal gluing condition on the two branch values. Adjunction gives `ω_{X^ν/B}(D^ν)|_{D^ν}≅O_{D^ν}`. The componentwise pointed vanishing gives the direct-image exact sequence and its base-change ranks. Descend the two branch quotients to the one O_D quotient using the antidiagonal condition; retain the signs in the m-th tensor power.

The residue sequence concerns a persistently nodal generic fibre; isolated special-fibre nodes use the smooth-generic theorem.

([clm](#references), Lemma 6.8, printed/PDF pp. 27–28; Proposition 6.9, p. 28, exact sequences.)

*Needs:* [nefness on pointed normalization components](#46-nefness-on-pointed-normalization-components), SchemeAndStackFoundations §§1.18–1.23, StableReduction Layer 1, StableReduction Layer 2.

### 4.8 The fine smooth full-level curve scheme

The fixed symplectic component M_g[N] over Z[1/N,ζ_N] is a smooth quasi-projective scheme of relative dimension 3g−3, carrying a smooth projective universal curve of genus g. Forgetting level to M_g is representable finite étale. It is regular; geometric irreducibility is the separate connectedness theorem.

One proof uses the following inputs and comparisons. The torsion-frame functor is finite étale; pulling back the smooth-curve stack gives the level stack. Trivial inertia makes it an algebraic space; identify its finite coarse map to the smooth coarse space to deduce quasi-projectivity and therefore schemeness. Use the tricanonical universal embedding for projectivity of its curve. Geometric irreducibility requires the distinct connectedness argument below.

This concerns smooth curves; it is not naive full-level representability on all nodal curves.

AbelianSchemesAndArithmeticModuliPartII §B4.1 constructs the characteristic-zero fine scheme M_g[ℓ] over ℚ(ζ_ℓ) with its universal curve and finite étale level changes. Its restriction of M_g[N] along Z[1/N,ζ_N]→ℚ(ζ_N) is identified with that scheme by the unique isomorphism of representing objects of the same level functor; the identification carries universal curve to universal curve and commutes with level change. The integral extension, including every residue characteristic prime to N, is the content of this target.

([dm](#references), §5.14, printed p. 108: full Jacobi level is a scheme for N≥3; §5.15, pp. 108–109: pairing-component connectedness; [dgh](#references), §6.1, printed/PDF p. 23, first two moduli paragraphs.)

*Needs:* AbelianSchemesAndArithmeticModuliPartII §B4.1, [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), [rigidity of full curve level](#44-rigidity-of-full-curve-level), SchemeAndStackFoundations §4.15, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks), AlgebraicModuliForArithmeticGeometry §§5.1–5.4, AlgebraicModuliForArithmeticGeometry §§2.1–2.2.

### 4.9 Jacobi level as an abelian Teichmuller component

Fix g≥2 and N≥3, B=Spec Z[1/N], and `G=(Z/N)^{2g}`. On the smooth genus-g stack the sheaf of exterior epimorphisms from the prime-to-residue-characteristic fundamental group to G is the full abelian torsion-frame sheaf, after the canonical H¹/Jacobian dual-and-Tate-twist comparisons. In this sheaf the homogeneous symplectic-similitude frames form an open and closed subfunctor, stable under `GSp_{2g}(Z/N)`. Its multiplier map has target the primitive-pairing scheme B_N=Spec Z[1/N,ζ_N]. Fixing a B_N-point gives exactly the symplectic Jacobi-level problem; the unconditioned sheaf of all frames is larger. Pairing conventions use e_N:J[N]×J[N]→μ_N, whereas DM 5.3 uses the H¹ pairing with values in `μ_N^{-1}`.

Import the relative Jacobian, canonical polarization and arbitrary pullback on the Noetherian tricanonical atlas of [hilbert quotient presentation](#111-hilbert-quotient-presentation) from JacobianChallengePartII §§1.1–1.4, and effective polarized-family descent from AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3. N is invertible, so torsion and frame sheaves are finite étale; the comparison is étale-local and natural in the base. The primitive root is part of the base change, not a choice silently made over B.

One proof uses the following inputs and comparisons. Use relative Kummer theory to identify J[N] with R¹f_*μ_N, and duality between H¹ with constant coefficients and the abelianized fundamental group modulo N. Exterior conjugation is trivial because G is abelian. An epimorphism to G from the rank-2g abelianization modulo N is an isomorphism: a surjection of finite free modules of equal finite cardinality has zero kernel, including composite N. Transport the cup-product orientation through the dual and Tate twist. Retain its inverse on changing between the H¹ and torsion conventions; test rather than erase this sign/twist. Étale-locally all relevant sheaves are finite constant, so the condition that an isomorphism takes the symplectic form to a scalar multiple is a union of connected components. The scalar is primitive and defines the multiplier morphism. Fixing the multiplier gives the symplectic level problem; the full GL-frame sheaf is a finite union of translates of the homogeneous subfunctor. This comparison is used only over the smooth locus.

Do not call all GL frames symplectic similitudes when g≥2. An H¹-level frame and a torsion frame require the specified dual and twist; a literal identification of their pairings is wrong.

The construction has the following API.

- After the Kummer and dual/twist comparison, the abelian exterior-epimorphism sheaf equals the torsion-frame sheaf.
- The homogeneous subfunctor maps to Isom(Z/N,μ_N), with inverse-pairing comparison to the DM convention.
- The fibre at ζ_N is the exact symplectic-level sheaf, not the homogeneous sheaf with ζ forgotten.
- Kummer, duality, the homogeneous subfunctor and multiplier commute with every pullback between admissible bases.

**Checks.**

- For N=3 and a standard symplectic basis e₁,f₁,e₂,f₂, scaling e₁ by 2 and fixing the other basis vectors is invertible but scales the two symplectic blocks differently; this GL₄-frame is outside GSp₄.
- Over C at N=3 there are two primitive pairing choices, ζ₃ and `ζ₃^{-1}`; the homogeneous problem has both and a fixed component has one.
- At N=4 the standard frame is an abelian epimorphism and has multiplier 1 after the chosen trivialization, although Z/4 is not a field.
- In characteristic p with p|N, J[N] need not be finite étale; the finite-étale frame argument is inapplicable.

([dm](#references), Definitions 5.3–5.8, pp. 105–106; 5.14–5.15, pp. 108–109. Jacobi level is an open-and-closed part of abelian Teichmuller level, and the multiplier separates the fixed symplectic problems.)

*Needs:* JacobianChallengePartII §§1.1–1.4, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, SchemeAndStackFoundations §§3.3–3.7, [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves).

### 4.10 Tame normalization of a fixed pairing level

Over B_N=Spec Z[1/N,ζ_N], let U be the smooth genus-g stack and U_N its fixed-pairing Jacobi-level cover, g≥2 and N≥3. Normalize the stable stack M̄_g×B_N in U_N, retaining every generic component. The resulting stack Y is finite over M̄_g×B_N, proper and flat of finite presentation over B_N; every geometric fibre of Y is normal, and U_N is dense in every such fibre. Consequently its geometric fibre component count is locally constant on B_N and equals that of U_N. Y is not asserted to be a scheme, a smooth stack, or a naive nodal full-level moduli problem.

The charts of [transverse relative boundary charts](#115-transverse-relative-boundary-charts) are excellent regular schemes, smooth over the integer base, with a relative normal-crossing boundary. Its generic divisorial points have characteristic zero, as required by the absolute local Lemma 5.10 of DM. The DM tame Teichmuller normalization theorem applies to `G=(Z/N)^{2g}`, whose order `N^{2g}` is invertible on B_N. Use the exact finite normalization and normal-component comparison supplier contracts; no arbitrary normalization/base-change claim is made.

One proof uses the following inputs and comparisons. Use the open-and-closed abelian Teichmuller comparison to select the fixed-pairing component before normalization. Normalize each generic component and descend the finite normalization from étale atlases (AlgebraicModuliForArithmeticGeometry §§5.1–5.4). Apply the tame local theorem of DM 5.9–5.10. On strict local normal-crossing charts, the cover is dominated by adjoining roots of the boundary parameters of order invertible on the residue base, and the normalization is obtained by the appropriate finite tame quotient. The generic Kummer-chart supplier must give flatness and geometrically normal fibres after taking this quotient; its proof uses the root charts, tame invariants and normality. This is gap:level-tame-components, rather than a consequence of finiteness of normalization. The nonempty smooth part is dense on every geometric fibre by those same boundary charts. Apply the proper-flat-geometrically-normal component-count theorem DM 4.17(iii), pp. 102–103, and its application in 5.11, p. 107. Use 4.16 for irreducibility of normal connected components; 4.19 is instead the valuative criterion for properness. A normal Noetherian geometric fibre has disjoint irreducible components, so deleting this dense boundary complement preserves its connected-component count.

The tame hypothesis concerns G of order `N^{2g}`, not the order of GL or Sp acting on its frames. In characteristic 2, level 3 is admissible even though Sp₄(F₃) has even order. Geometrically normal fibres are a theorem of the Kummer local description; ordinary normalization alone does not imply it.

The construction has the following API.

- Y→M̄_g×B_N is the finite normalization in the prescribed generic cover.
- Its inverse image over U is the original fixed-pairing smooth level cover U_N.
- Every geometric fibre is normal and contains the original smooth-level fibre densely.
- The connected-component count of a geometric fibre is locally constant and equals that of its smooth open.
- For a normal Noetherian scheme T→M̄_g×B_N with U_T dense in T, a lift U_T→U_N extends uniquely to T→Y. This determines the normalization and comparisons independently of the chosen atlas.
- For an etale chart T→M̄_g×B_N, Y×T is the normalization of T in U_N×T. The comparison isomorphisms satisfy identity and composition and agree on overlaps; arbitrary ramified base change is not covered.

**Checks.**

- Restriction to a smooth stable-moduli chart gives the original finite étale level cover; the normalization adds no sheets there.
- At one nonseparating node the primitive transvection T=[[1,1],[0,1]] satisfies T^k=[[1,k],[0,1]] and has exact order N modulo N, including N=4. Thus boundary ramification can have order N; the cover is not required to be etale there. At N=4, T² has off-diagonal entry 2 and T⁴=I, so level two cannot replace level four in this rigidity argument.
- For N=3, `G=(Z/3)^{2g}` has odd order and satisfies the tame theorem in characteristic 2; rejection because the symplectic deck group has even order is incorrect.
- The construction and its normal-fibre theorem are not asserted above any prime dividing N.
- Over C the Kummer normalization z^3=t becomes z^3=s^3 after t=s^3. The raw pullback has three components meeting at the origin; its normalization is three disjoint affine lines. Thus even this tame local model does not commute with arbitrary base change without renormalizing.

([dm](#references), Theorem 5.9 and local Lemma 5.10, pp. 106–107; Corollary 5.11, p. 107; 5.15, pp. 108–109; Proposition 4.16 and Theorem 4.17, pp. 102–103; normalization after 4.20, pp. 103–104. The tame normalization and proper component-count route transfers connectedness to every admissible characteristic. The statement is an application of this route, not fine representability on the boundary.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§5.1–5.4, SchemeAndStackFoundations §§1.18–1.23, [jacobi level as an abelian teichmuller component](#49-jacobi-level-as-an-abelian-teichmuller-component), SchemeAndStackFoundations §4.15.

### 4.11 The complex fixed-pairing orbit calculation

Let g≥2, N≥3 and ζ_N∈C be primitive. Assuming the generic marked-surface uniformization and integral symplectic-reduction supplier contracts, the analytification of the fixed-pairing smooth curve level scheme is connected: its components correspond to orbits of the orientation-preserving genus-g mapping class group on symplectic frames modulo N, and that action is transitive. This complex calculation together with [tame normalization of a fixed pairing level](#410-tame-normalization-of-a-fixed-pairing-level) proves every geometric fibre over B_N is connected.

Use the actual analytification of the fine smooth scheme of [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), with the H¹/torsion convention of [jacobi level as an abelian teichmuller component](#49-jacobi-level-as-an-abelian-teichmuller-component). The Teichmuller space is connected; its mapping-class quotient supplies the analytic moduli comparison, rather than an assumed connected moduli space. The integral symplectic reduction `Sp_{2g}(Z)→Sp_{2g}(Z/N)` is onto for composite N as well as prime N.

One proof uses the following inputs and comparisons. Use connected marked Teichmuller space and identify the analytic moduli cover as the quotient of its product with the finite set of frames. Components are the mapping-class orbits of that finite set. The mapping-class action on integral first homology surjects onto `Sp_{2g}(Z)` (DM 5.12). Reduce modulo N; use elementary symplectic generators over Z/N, or Chinese remainder and prime-power generators, rather than a finite-field-only argument. The symplectic group acts transitively on its own frame torsor, so there is one orbit. Connected analytification implies connectedness of the algebraic complex fibre. Since B_N is connected, the locally constant component count from [tame normalization of a fixed pairing level](#410-tame-normalization-of-a-fixed-pairing-level) equals one everywhere. Geometric normality plus density then gives connectedness of the smooth fibre, and smoothness makes it irreducible.

Fix the primitive pairing before computing orbits; homogeneous level can have several multiplier components. The Teichmüller theory and the homology-action theorem are gap:stack-topology-boundary.

([dm](#references), 5.12–5.13, pp. 107–108; 5.15 and Lemma 5.16, pp. 108–109. DM reduces component counts to the connected marked space and the symplectic orbit calculation. Teichmüller connectedness and symplectic monodromy use the topology supplier contract.)

*Needs:* gap:stack-topology-boundary, [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [jacobi level as an abelian teichmuller component](#49-jacobi-level-as-an-abelian-teichmuller-component), [tame normalization of a fixed pairing level](#410-tame-normalization-of-a-fixed-pairing-level).

### 4.12 Connectedness of a pairing component

Every geometric fibre of the full Jacobi-level scheme over Spec Z[1/N,ζ_N] is connected, hence irreducible by smoothness. The homogeneous-similitude scheme over Z[1/N] is not asserted geometrically connected without fixing the multiplier.

One proof uses the following inputs and comparisons. Normalize stable moduli in the finite level cover and apply tame local Kummer normal forms along the normal-crossings boundary to compare component counts in characteristic zero and positive characteristic. Over C use connected Teichmüller space and surjectivity of mapping-class monodromy to `Sp_{2g}(Z/N)`. The Dehn-twist and Teichmüller inputs use the topology contract from ComplexComparisonPartII §§C3.2d.1–C3.2d.4.

The primitive rootζ_N is fixed for the DGH component.

([dm](#references), Theorems 5.9,5.13,5.15;Lemma 5.16, pp. 106–109.)

*Needs:* gap:level-tame-components, [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), SchemeAndStackFoundations §4.15, AbelianSchemesAndArithmeticModuli §§A3.1–A3.8, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, [the complex fixed-pairing orbit calculation](#411-the-complex-fixed-pairing-orbit-calculation).

### 4.13 Geometric irreducibility of stable moduli

For g≥2 every geometric fibre of M̄_g over Spec Z is irreducible and its dense smooth open M_g is geometrically irreducible.

One proof uses the following inputs and comparisons. For a residue characteristic p choose level N≥3 prime to p, choosing N=3 except at p=3 where N=4 suffices. The fixed pairing-component fine-level cover is connected and smooth, hence irreducible, and surjects onto smooth moduli. Density of smooth curves in all versal charts gives irreducibility of its stable closure.

One fixed level cannot be used at the primes dividing it.

([dm](#references), Theorems 5.9,5.15 and concluding argument, p. 109.)

*Needs:* [connectedness of a pairing component](#412-connectedness-of-a-pairing-component), SchemeAndStackFoundations §4.15.

### 4.14 One determinant line over the integer base

Let g≥2, let q:M̄_g→M be the proper coarse algebraic space of the stable genus-g stack over Z, and let h:N→M be the composite of q with the integral normalized level cover `N=N_{g,0}(15)→M̄_g` of SchemeAndStackFoundations §4.15. Let d be such that λ=det `f_*ω^{3d}` of the pulled-back universal curve is ample on N over Z, as `level_structure_cover_ample` provides. Suppose there are an invertible sheaf L on M and e>0 with q*L≅λ^e on M̄_g, where λ also denotes the same determinant on the stack. Then L is ample over Z and M is a projective Z-scheme.

Here M̄_g is proper of finite type and Deligne–Mumford over Z, with finite inertia. The descent q*L≅λ^e of a positive power to the coarse space is gap:coarse-line-power, not a consequence of coarse-space existence. The uniform tricanonical equations, the fixed degree d and the ampleness of λ on N over Z are the supplier's; this target only transports that line to the coarse space.

One proof uses the following inputs and comparisons. N→M̄_g is finite and surjective and q is proper and quasi-finite, so h is proper and quasi-finite, hence finite, and surjective. Pull q*L≅λ^e back to N: h*L≅λ^e is ample on N over Z. Descend ampleness along the finite surjection h of proper algebraic spaces over the Noetherian ring Z; this also shows that M is a scheme. An algebraic space carrying an ample invertible sheaf over Spec Z that is proper over Z is a projective Z-scheme. No base-change theorem for coarse spaces is used, and no comparison between `λ_{3d}` for different d.

**Checks.**

- For g=2 the tricanonical rank is r=5; in degree d=2 the source Sym² has rank 15 and `f_*ω^6` has rank (6·2−1)(2−1)=11, so a surjective multiplication map has kernel of rank 4. At d=1 the kernel is zero for every tricanonical curve and cuts out the whole `P^{5g−6}`, not the curve; the degree supplied with the ample line is not assumed to be 2.
- For a constant genus-two family over a positive-dimensional proper base the determinant of `f_*ω^{3d}` is trivial and cannot be ample; such a family does not factor through a finite map to M, so the finite surjection h is essential.
- Over Z every residue characteristic is kept: the supplier's level 15 uses level-five rigidity in characteristic three and level-three rigidity in characteristic five, and neither fibre of M is discarded.

([clm](#references), Theorem 7.2, pp. 30–31, for the conclusion; [stacks-spaces-cohomology](#references), Cohomology of Algebraic Spaces, Lemma 21.2 (tag 0GFB). Tag 0GFB descends ampleness along a finite surjection of proper algebraic spaces over a Noetherian ring and gives schemeness.)

*Needs:* gap:coarse-line-power, SchemeAndStackFoundations §4.15 (`level_structure_cover_ample`, `level_structure_cover_projective`), SchemeAndStackFoundations §§1.18–1.23, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks).

### Positivity, collisions and a single integral determinant

For the section-degree argument use the image I of evaluation in s*ω^m, which is an invertible quotient of a nef bundle and has the form s*ω^m(−D), D effective. Thus deg I≥0 gives m·deg(s*ω)=deg I+deg D≥0. The conclusion does not require surjectivity onto s*ω^m on every special fibre. In contrast, a subsheaf of a line of nonnegative degree need not have nonnegative degree: O(−1)⊂O on ℙ¹ has degrees −1 and 0. Under a blowup where several marked sections meet, the transformed coefficient is m−Σaᵢ; individual aᵢ≤m does not imply nonnegative coefficient. For m=2 and a₁=a₂=2 it is −2. Use gap:weighted-collision-transport for this comparison; sections on a contracted model can collide. (CLM, Lemmas 6.4–6.5 and Proposition 6.7, pp. 23–27.)

The positive-twist surface input is h¹(ω^m(D))≤1 on the specified minimal general-type surface, for m≥2 and D a reduced disjoint union of smooth genus-at-least-two curves with trivial normal line. The exceptional characteristic-two, m=2 case remains included. General type for the fibred surface, crepant rational-double-point resolution and pluricanonical pushforward under exceptional contractions are separate inputs; spreading a negative quotient to positive characteristic retains coherent base change. (Ekedahl, II Theorem 1.7, pp. 126–127; Chen–Zhang v1, Theorem 1.3 and §4, pp. 2,10–11; CLM, Lemma 7.1 and Theorem 7.2, pp. 29–31.)

### Examples

For a constant genus-two family E₃ has rank five and degree zero; its determinant is trivial on a positive-dimensional proper base and cannot be ample. For N=3 the exact symplectic and multiplier-2 components are distinct. For the integral composite level 15, characteristic three uses level five rigidity and characteristic five uses level three rigidity; neither fibre is discarded.

### Dependencies

Layers 0–3; SchemeAndStackFoundations §§1.23 and 4.15; AlgebraicModuliForArithmeticGeometry §§1.1–1.7, 5.4; JacobianChallengePartII §§1.1–1.4; AbelianSchemesAndArithmeticModuli §§A3.1–A3.8. The single ample determinant on the integral level cover is SchemeAndStackFoundations §4.15 `level_structure_cover_ample`.

## Layer 5: Hodge determinant and integral Noether comparison

### 5.1 The Hodge bundle of stable pointed curves

For the universal stable pointed family `f:C→M̄_{g,n}`, define `E_{g,n}=f_*ω_{C/M̄}`. It is locally free of rank g, including rank zero for g=0, and formation commutes with arbitrary base change with its canonical cocycle. The relative dualizing sheaf is untwisted by the markings.

One proof uses the following inputs and comparisons. Relative duality identifies f_*ω with the dual of R¹f_*O_C, whose locally free genus-g and base-change statements are those of StableReduction Layer 2. Descend the sheaf along the atlas using its pullback cocycle.

Adding markings does not change the fibre Hodge rank.

The construction has the following API.

- At a geometric curve the fibre is H⁰(C,ω_C), of dimension g.
- For a classifying family C/S the pullback is `f_*ω_{C/S}`.
- `E_{g,n}≅(R¹f_*O_C)∨`, with the Serre-duality convention of StableReduction Layer 2.
- A pointed curve isomorphism induces pullback on H⁰(ω); identity and composition agree with the contravariant pullback convention and with the atlas cocycle.
- The two-step pullback of f_*ω is identified with the one-step pullback by the canonical cocycle, including the identity base map. Arbitrary-base formation uses the finite-stage approximation of §0.1.
- E=f_*ω is locally free of constant rank g.
- For every base change h, h*E≅E′, with the identity/composition cocycle.
- Use ω, not ω(sum of markings); the usual Serre trace comparison is retained.

**Checks.**

- E₀,ₙ has rank zero on the stable genus-zero range.
- E₂,ₙ has rank 2; it is not an invertible sheaf.
- For the nodal rational genus-one boundary, the Hodge fibre is one-dimensional, generated by the differential with opposite residues at the two normalization branches.
- On M̄_0,3 the Hodge bundle is zero; f_*ω(sum marks) has rank two and is the wrong definition.
- On M̄_1,1 the Hodge bundle has rank one, not the number of markings.
- A genus-two fibre made from two elliptic components has Hodge space the direct sum of their one-dimensional spaces.

([knudsen3](#references), §4, printed p. 201 (PDF p. 2): descent cocycle and definition (b); [yuan-author-http](#references), §3.1.1, printed/PDF p. 41: Hodge determinant and vector-bundle distinction.)

*Needs:* SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§1.18–1.23, StableReduction Layer 2, [genus and cohomology over arbitrary bases](#02-genus-and-cohomology-over-arbitrary-bases), [log dualizing sheaves over arbitrary bases](#03-log-dualizing-sheaves-over-arbitrary-bases).

### 5.2 The universal boundary Cartier divisor

For g≥2 let Δ be the effective Cartier divisor M̄_g minus M_g, with coefficient 1 on each reduced local node branch. Its global decomposition is `Δ=Σ_{i=0}^{⌊g/2⌋}Δᵢ` according to the one-edge unpointed types. For a generically smooth stable family over an integral noetherian S, its pullback is an effective Cartier divisor Δ_S; arbitrary families mapping entirely into Δ do not have this effective-Cartier pullback.

One proof uses the following inputs and comparisons. Use the local product of the independent node parameters. Collect branches into their global genus types while preserving multiplicity one. For an integral generically smooth base the pulled-back local equation is nonzero, hence a non-zero-divisor.

Generically smooth is required for the family divisor.

The construction has the following API.

- Étale locally Δ has equation∏tᵢ.
- The unpointed components are Δ₀ and the separating Δᵢ up to genus exchange.
- Pullback to an integral generically smooth stable family is the corresponding effective Cartier divisor.
- The invertible sheaf O(Δ) and its canonical section pull back along every classifying map even when the pulled-back section is identically zero. Only the claim that the zero locus is an effective Cartier divisor needs the generically smooth integral-base hypothesis.
- Use (O(Δ),s_Δ) on the stack; locally s_Δ is the product of the node smoothing parameters.
- The line and section pull back along every map; Cartier-divisor pullback requires the pulled-back section to be regular.
- On a normal generically smooth trait the order is the residue-degree-weighted sum of smoothing thicknesses.

**Checks.**

- For an everywhere smooth family Δ_S=0.
- For a constant nodal family the pullback equation is zero; there is no effective Cartier divisor on the base defined by that equation.
- For a versal curve with two nodes the local boundary equation is t₁t₂, including when both nodes belong to Δ₀.
- For xy=π³, the order is 3.
- For split nodes of thicknesses 2 and 5, the total order is 7.
- A closed node of residue degree d and thickness m contributes d·m before splitting.
- A nodal stable curve over a field has pulled-back section zero; its line still exists but the zero subscheme is not an effective Cartier divisor.

([yuan-author-http](#references), §3.1.1–3.1.2, pp. 41–43.)

*Needs:* SchemeAndStackFoundations §4.15, [stable one-edge boundary types](#35-stable-one-edge-boundary-types), StableReduction Layer 2.

### 5.3 Boundary twists kill torsion-line monodromy

Let g≥2 and L be an r-torsion line on M̄_g/C with a chosen L^r≅O and r≥1. The associated μ_r-torsor on the stack has trivial monodromy on M_g/C: after analytification and pullback to Teichmüller space, its character Mod_g→μ_r is trivial. Indeed extension over each transverse one-node smoothing kills the associated Dehn twist, and Dehn twists generate Mod_g. The torsor is then trivial over the normal compactified stack, so L is trivial. Quotient stacks and their inertia are retained throughout; a coarse-space argument is insufficient, including in genus two.

Use algebraic finite étale μ_r-torsors over C, where r is invertible; do not use the same étale argument in characteristic dividing r. gap:stack-topology-boundary supplies the analytic stack quotient [T_g/Mod_g], simple connectedness of T_g, mapping-class generation, nodal monodromy and cover comparison, including algebraic recovery on the proper DM stack.

One proof uses the following inputs and comparisons. Construct `Spec(⊕_{i=0}^{r−1}L^i)`, with multiplication from L^r≅O, using the existing torsor/relative-Spec machinery. Pull the analytic torsor to the contractible Teichmüller space. Descent along the action groupoid T_g×Mod_g gives a character of the full mapping-class group. The nerve has action face maps: it is not the product simplicial object with constant T_g; its realization is a homotopy quotient with contractible fibre over BMod_g. A transverse smoothing disk has trivial étale/topological cover when filled in, so the loop around its puncture acts trivially; its mapping-class monodromy is the corresponding Dehn twist. Use Luo’s generation theorem to kill the character. Extend the analytic cover splitting from the dense smooth locus across the normal compactified stack by normalization, retaining inertia; the disk argument is applied in stack charts. Hall Theorem 1 with proper DM source M̄_g/C and target Bμ_r algebraizes the trivialization and its inverse. Equivalently apply separated GAGA to the line isomorphism on the proper stack.

Include separating as well as nonseparating nodal monodromy, and do not suppress inertia by replacing the stack with its coarse space. For r=1 the torsor is trivial. For arbitrary r over C it is étale; this reasoning does not assert the same in characteristic p dividing r. Triviality on the dense open is extended by normality, not by an unproved claim that restriction of arbitrary line bundles is injective.

([mumford1977](#references), Lemma 5.14, statement p. 102 and proof pp. 103–105. Uses the Teichmüller-space cover, mapping-class characters and boundary Dehn twists to eliminate torsion; the cited analytic inputs require separate supplier contracts.; [mc5-fredianineumann2004](#references), Theorem 2.5 and Proposition 2.6, p. 11; §2.3, pp. 17–19. Supplies Teichmüller representability and contractibility. Use the action groupoid and homotopy quotient, retaining stabilizers; the source's argument through a product of simplicial spaces is replaced by the nerve of the action groupoid.; [mc5-luo1998](#references), §1, main unnumbered theorem, p. 2. Presents the orientation-preserving mapping class group of a compact oriented surface by all Dehn twists, hence gives generation for the closed genus-g surface.; [mc5-hall2011](#references), Theorem 1, p. 1; Theorem A.1 and Corollary A.3, p. 17. For a proper DM source, analytification recovers morphisms to the DM target Bμ_r and their isomorphisms. Separated GAGA also recovers coherent line isomorphisms on the proper compactification.)

*Needs:* gap:stack-topology-boundary, SchemeAndStackFoundations §1.15, SchemeAndStackFoundations §1.21, MordellLawrenceVenkatesh §§5.9, 5.11–5.12, [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), SchemeAndStackFoundations §4.15.

### 5.4 Torsion freeness of the stable-stack Picard group

For g≥2 `Pic(M̄_{g,C})` is torsion free. A torsion line gives a finite cyclic cover of the stack. Over Teichmüller space this cover splits; its character factors through the mapping-class group, and extending over every boundary kills each Dehn-twist generator, so the cover and line are trivial.

One proof uses the following inputs and comparisons. The proof uses connected simply connected Teichmüller space, the analytic presentation of the smooth stack and generation by Dehn twists. These analytic inputs are gap:stack-topology-boundary. Use the one-node smoothing monodromy to identify the boundary loop with the corresponding Dehn twist. Since the cover extends over that divisor, its cyclic monodromy on the loop vanishes; all generators vanish.

Retain stack stabilizers; passing first to the coarse space is not this proof.

([mumford1977](#references), Lemma 5.14 proof, pp. 103–105.)

*Needs:* gap:stack-topology-boundary, SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, [boundary twists kill torsion-line monodromy](#53-boundary-twists-kill-torsion-line-monodromy).

### 5.5 Global units on integral stable moduli

For g≥2, `Γ(M̄_{g,Z},O)=Z` and `Γ(M̄_{g,Z},O×)={±1}`. This follows from properness, smoothness and geometrically connected fibres with cohomology/base change.

One proof uses the following inputs and comparisons. Use the universally connected proper-fibre O-pushforward comparison and the base Spec Z. Take units of Z; do not replace the integral base by an arbitrary field, where more units exist.

Over C the global units include all of C×.

([yuan-author-http](#references), §3.1.2, p. 42.)

*Needs:* SchemeAndStackFoundations §4.15, [geometric irreducibility of stable moduli](#413-geometric-irreducibility-of-stable-moduli), AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3, StableReduction Layer 2.

### 5.6 A complex trivialization descends to the rational fibre

Let X=M̄_g/Z, g≥2, and L a line on X. If L_C is trivial, then L_Q is trivial. More precisely H⁰(X_Q,L_Q)⊗_Q C≅H⁰(X_C,L_C) is one-dimensional, because Γ(X_C,O)=C. Choose a nonzero rational section in this space; after base change it is a nonzero constant multiple of a trivialization and hence nowhere vanishing. Faithful flatness then makes its evaluation O_XQ→L_Q an isomorphism.

Proper stable-moduli stack over Z, and the geometrically connected/irreducible fibre statements imported from SchemeAndStackFoundations §4.15 and [geometric irreducibility of stable moduli](#413-geometric-irreducibility-of-stable-moduli). SchemeAndStackFoundations §§1.1 and 1.22 supply H⁰ flat field-extension base change on the proper DM stack and descent of the evaluation isomorphism. No claim is made that a line trivial after every arbitrary field extension descends without these H⁰ hypotheses.

One proof uses the following inputs and comparisons. Use flat cohomology base change for Q→C, without asserting the chosen complex section itself has rational coefficients. The right-hand H⁰ has dimension one since the line is trivial and the proper connected complex stack has only constant functions. A nonzero rational vector becomes a nonzero scalar multiple of a complex trivialization. Descend invertibility of its evaluation map by faithful flatness.

One-dimensionality is proved before selecting the rational section. The evaluation map, rather than only its space of sections, descends as an isomorphism. The argument respects stabilizer actions and thus applies to the stack line, not only its atlas restriction.

([mumford1977](#references), Paragraph following Lemma 5.14, printed pp. 102–103. Uses invariant global sections and flat base change to pass from a complex trivial line to a rational section, before the vertical-divisor argument.)

*Needs:* SchemeAndStackFoundations §1.1, SchemeAndStackFoundations §1.22, SchemeAndStackFoundations §4.15, [geometric irreducibility of stable moduli](#413-geometric-irreducibility-of-stable-moduli), [global units on integral stable moduli](#55-global-units-on-integral-stable-moduli).

### 5.7 Vertical divisors on the integral stable stack

For X=M̄_g/Z, g≥2, every Cartier divisor whose support is vertical is a finite sum D=Σ_p n_p X_Fp of whole prime fibres, with integral n_p. Since X/Z is smooth with geometrically irreducible fibres, each X_Fp is reduced, irreducible and Cartier of multiplicity one. Consequently D=div_X(∏_p `p^{n_p})`. In particular, for any line L on X, a trivialization of L|X_Q extends after multiplication by a rational number to a nowhere-vanishing section on X.

Here X is the smooth integral noetherian stable DM stack with geometrically irreducible fibres. The Cartier/Weil comparison, divisors of rational sections and the codimension-one criterion on this smooth DM stack follow from the scheme statements of SchemeAndStackFoundations §§3.3–3.7 on a smooth atlas, by descent along the atlas groupoid (SchemeAndStackFoundations §1.1), since codimension of points, regularity and Cartier divisors are smooth-local.

One proof uses the following inputs and comparisons. A codimension-one irreducible vertical support lies over a unique prime and equals that whole irreducible fibre; use smoothness and dimension to exclude a proper codimension-one subvariety of the fibre. Smoothness makes each prime fibre reduced, and flatness makes p a nonzerodivisor, with divisor exactly that fibre. A Cartier divisor has finitely many such components on the quasi-compact stack. Compare with the principal divisor of the rational number `∏p^{n_p}`. For a line rationally trivialized on X_Q, subtract this principal divisor from the divisor of its rational section; regularity/codimension-one comparison then makes it a global trivialization.

Negative coefficients are allowed; the correcting scalar belongs to Q×, not necessarily Z. Multiplicity one uses smoothness; the same formula without multiplicities is false for a nonreduced prime fibre. The scheme excision node does not prove this stack statement.

([mumford1977](#references), Integral descent after Lemma 5.14, printed pp. 102–103. Removes vertical zeros or poles by whole-prime-fibre principal divisors, proving the needed integral restriction injectivity.)

*Needs:* SchemeAndStackFoundations §1.1, SchemeAndStackFoundations §3.4, SchemeAndStackFoundations §4.15, [geometric irreducibility of stable moduli](#413-geometric-irreducibility-of-stable-moduli).

### 5.8 Integral-to-complex Picard injection

For g≥2 restriction `Pic(M̄_{g,Z})→Pic(M̄_{g,C})` is injective. A line trivial over C is generically trivial; on the smooth integral stack with geometrically irreducible fibres its vertical divisor is a sum of whole prime fibres, hence principal on Spec Z.

One proof uses the following inputs and comparisons. Use coherent proper base change to descend a nonzero trivializing section to the rational generic fibre. Extend it as a rational section; its zero and pole divisors are vertical. Every codimension-one vertical component is a whole prime fibre, and an integer rational function removes their multiplicities. This uses geometric irreducibility of stable moduli; the source’s §3/§5 component argument is not replaced by mere smoothness.

Global units after the resulting trivialization are±1.

([mumford1977](#references), paragraph after Lemma 5.14, pp. 102–103.)

*Needs:* SchemeAndStackFoundations §4.15, [geometric irreducibility of stable moduli](#413-geometric-irreducibility-of-stable-moduli), AlgebraicModuliForArithmeticGeometry §§5.1–5.4, SchemeAndStackFoundations §§5.1–5.10, [a complex trivialization descends to the rational fibre](#56-a-complex-trivialization-descends-to-the-rational-fibre), [vertical divisors on the integral stable stack](#57-vertical-divisors-on-the-integral-stable-stack).

### 5.9 Boundary multiplicity equals node thickness

Let S be normal integral noetherian and a stable genus-g family g≥2 be generically smooth. At a codimension-one point v, after a finite unramified extension splitting the special-fibre nodes, write `xy=π^{m(x)}` up to a unit at each node. Then ord_v `Δᵢ=Σ_{i(x)=i}m(x)`, and ord_v Δ=Σ_x m(x). Before splitting, descend this formula with the residue-degree multiplicities of the closed node points.

One proof uses the following inputs and comparisons. Pull the product of the universal node smoothing parameters back to the trait. The local valuation of each factor is its thickness; sum the factors of the same genus type. Use unramified invariance and descent of Cartier-divisor multiplicities.

A node of thickness m contributes m, not1.

([yuan-author-http](#references), §3.1.2, p. 43.)

*Needs:* [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§5.1–5.10, StableReduction Layer 1.

### 5.10 Hodge pullback under forgetting

For `π:M̄_{g,n+1}→M̄_{g,n}`, `π*E_{g,n}≅E_{g,n+1}` and therefore `π*λ_{g,n}≅λ_{g,n+1}`, canonically with coherent repeated forgetting.

One proof uses the following inputs and comparisons. Use the universally trivial O-pushforward and vanishing R¹ along the single-marking contraction of StableReduction Layer 3. Compare R¹O on the two families by Leray, dualize and take determinants.

There is no cotangent-tail correction in the Hodge pullback.

([knudsen3](#references), Theorem 4.1(a), p. 202.)

*Needs:* [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, SchemeAndStackFoundations §4.15, StableReduction Layer 3, StableReduction Layer 2.

### 5.11 Hodge determinant under separating clutching

Under ordered separating clutching, `ξ*E_{g,n}≅pr₁*E_{g₁,n₁+1}⊕pr₂*E_{g₂,n₂+1}`, hence `ξ*λ_{g,n}≅pr₁*λ_{g₁,n₁+1}⊗pr₂*λ_{g₂,n₂+1}`. The determinant comparison uses concatenated wedge bases in that order. Exchanging the two factors contributes the Koszul sign `(−1)^{g₁g₂}`; descent to a permitted graph-exchange quotient retains this action, rather than the ordinary unsigned symmetry of the two line factors alone.

One proof uses the following inputs and comparisons. The normalization exact sequence for O has no new graph-cycle H¹ in the separating case. Dualize the cohomology decomposition and take the determinant.

The ranks add as g=g₁+g₂. For two genus-one branches, exchanging the two summands negates their determinant wedge. In characteristic 2 this sign becomes trivial, without changing the integral convention.

([knudsen3](#references), Theorem 4.2(a), printed p. 203 (PDF p. 4), and normalization exact-sequence proof.)

*Needs:* [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [separating clutching morphism](#31-separating-clutching-morphism), StableReduction Layer 1, StableReduction Layer 2.

### 5.12 Hodge determinant under self-clutching

For ξ_irr there is an exact `sequence0→E_{g−1,n+2}→ξ_irr*E_{g,n}→O→0` with the last map the residue at an ordered branch. It gives `ξ_irr*λ_g≅λ_{g−1,n+2}`. Exchanging the two branches negates the residue; the induced equivariant determinant data must retain this sign when descending to the unlabelled graph quotient.

One proof uses the following inputs and comparisons. Use the residue description of nodal dualizing forms (StableReduction Layer 2); opposite residues give one additional one-dimensional quotient. Use determinant exact-sequence multiplicativity; record the effect of branch exchange on the chosen residue trivialization.

The determinant identity does not identify the two Hodge vector bundles, whose ranks differ by one.

([knudsen3](#references), Theorem 4.2(a), printed p. 203 (PDF p. 4), and normalization exact-sequence proof.)

*Needs:* [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), StableReduction Layer 1, StableReduction Layer 2.

### 5.13 Hodge determinant and derived direct image

For a proper stable family f:C→S of connected arithmetic genus g, let E=f_*ω and λ=det E. There are natural underlying-line isomorphisms d_f(ω)≅λ and d_f(O_C)≅λ, coherent with arbitrary base change. In graded lines their integer degrees are respectively g−1 and 1−g; these grades are not silently identified with the ordinary rank-g determinant grading.

Here S is a scheme chart of the stable stack, including arbitrary base via gap:cm-duality-arbitrary-base. Relative trace R¹f_*ω≅O_S and Serre duality R¹f_*O≅E∨, with f_*O≅O_S.

One proof uses the following inputs and comparisons. Use the connected-nodal cohomology and duality of StableReduction Layer 2 to identify the two cohomology sheaves in degrees zero and one. Compute the alternating determinant, retaining the trace trivialization and canonical double-dual comparison. Transport the identifications along derived base change; check the equality of grades and descent separately from the underlying line.

For g=0 on a stable pointed genus-zero family, both underlying lines are trivial but the two derived grades are −1 and +1. For a smooth genus-one family, both derived grades are zero while E has rank one. R¹f_*ω cannot be omitted from the determinant formula.

([knudsen3](#references), §4, definitions (a)–(b), p. 201; Theorem 4.1 proof, p. 202. Defines the Hodge line by the derived determinant and compares the O and dualizing determinants using curve duality.; [mumford1977](#references), Definition 5.9 and Theorem 5.10, pp. 100–102. Uses the determinant of the derived direct image for the Hodge and pluricanonical lines.; [mc5-erikssonfreixas2024](#references), Definition 4.16, p. 287. Specifies the graded determinant-of-cohomology convention used in the comparison.)

*Needs:* gap:cm-duality-arbitrary-base, gap:graded-perfect-stack-descent, StableReduction Layer 2, SchemeAndStackFoundations §3.4, [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5.

### 5.14 Dualizing Deligne pairing

For g≥2 and f:C→M̄_g over Z, construct P_g=⟨ω_f,ω_f⟩ as a line object on M̄_g. Precisely, P_g is a cartesian assignment to each T-valued stable curve of the gap:integral-deligne-pairing line ⟨ω_C/T,ω_C/T⟩ in the core of InvertibleSheaf T, together with base-change isomorphisms and their cocycle. Equivalently it is a 1-morphism M̄_g→BG_m, using the existing line-stack equivalence. Its tensor operations and isomorphisms occur in this Picard groupoid, not in its set of isomorphism classes.

Here g≥2; universal unpointed stable curve; untwisted relative dualizing sheaf. gap:graded-perfect-stack-descent/gap:integral-deligne-pairing and the arbitrary-base nodal-dualizing extension in gap:cm-duality-arbitrary-base are supplied.

One proof uses the following inputs and comparisons. On a scheme chart use the stable-curve dualizing line of StableReduction Layer 2, local projectivity of a stable curve and the integral gap:integral-deligne-pairing construction. Its canonical base-change comparisons, and the dualizing base-change maps, give descent along the chart groupoid. Apply SchemeAndStackFoundations §§1.18–1.23 line-stack equivalence and effective descent to obtain a line on the stack; verify identity, composition and 2-isomorphism invariance.

A chartwise line plus class equality is insufficient: its actual comparison morphisms satisfy the groupoid cocycle. Specialization to a nodal F_p-valued stable curve is admitted. The universal line is independent, up to the specified coherent isomorphism, of a choice of chart.

The construction has the following API.

- For x:T→M̄_g, x*P_g≅⟨ω_Cx/T,ω_Cx/T⟩, with its actual four-determinant expression.
- The chart comparison is coherent for arbitrary T′→T, for identities/composites, and for isomorphisms of stable families.
- Deligne's symmetry on P_g is +1, since it acts by `(−1)^{deg ω}=(−1)^{2g−2}`, including on nodal fibres; the bare Koszul permutation of the four determinant factors acts by `(−1)^{χ(ω)}=(−1)^{g−1}` and the factor `(−1)^{χ(O_C)}=(−1)^{1−g}` converts it into the symmetry.
- On a scheme chart the value belongs to the core of the pinned InvertibleSheaf category, via SchemeAndStackFoundations §§1.18–1.23’s BG_m equivalence, not merely to LineBundleClass.

**Checks.**

- For a fixed stable genus-two curve C/k pulled to S, P is the pullback of the one-dimensional k-line ⟨ω_C,ω_C⟩; the degree for self-symmetry is 2.
- A stable nodal genus-two curve over k has a pairing line; restricting this construction to smooth curves fails.
- Base change along Spec(F_p)→Spec(Z), which is not flat, preserves the stated chart comparison.
- For every g≥2 Deligne's symmetry on P_g is +1. At g=2 the bare Koszul permutation is `(−1)^{χ(ω)}=−1`, so taking it as the symmetry gives the wrong value; for an odd-degree line L the symmetry on ⟨L,L⟩ is −1.

([yuan-author-http](#references), Theorem 3.3, §3.1.1, p. 42; §3.1.2, pp. 42–43. Uses the universal relative-dualizing pairing and its classifying pullback.; [mc5-erikssonfreixas2024](#references), (6.3), Proposition 6.1, pp. 310–312. Supplies the actual line-valued chart construction and coherent arbitrary base change, permitting effective descent.)

*Needs:* gap:graded-perfect-stack-descent, gap:cm-duality-arbitrary-base, gap:integral-deligne-pairing, SchemeAndStackFoundations §1.21, SchemeAndStackFoundations §1.1, SchemeAndStackFoundations §3.4, StableReduction Layer 2, [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), SchemeAndStackFoundations §4.15.

### 5.15 Chern class of the dualizing pairing

On M̄_g/C, g≥2, the universal pairing satisfies c₁(P_g)=f_*(c₁(ω_f)²) in CH¹(M̄_g/C;Q). The scheme-level integral input is the degree-one graded-K comparison for Deligne pairings on divisorial bases. Its passage to rational Chow and then to the moduli stack must use named comparison/descent maps, and is not an integral identification of arbitrary stack Chow and Picard groups.

Use SchemeAndStackFoundations §§5.1–5.10 stack Chow with rational coefficients and its actual first-Chern/proper-pushforward operations. gap:stack-chow-grr supplies the pairing Chern comparison and the codimension-one Picard comparison for this smooth DM stack, including stabilizers.

One proof uses the following inputs and comparisons. On a suitable divisorial scheme chart apply Eriksson–Freixas Corollary 6.9 to the two line arguments. Use the rational Chern-character comparison to convert its graded-K identity to Chow. Use a smooth equivariant Hilbert presentation of the moduli stack and compatible mixed quotients (Edidin–Graham, Propositions 14–19), so that the chart computation is an equivariant identity and not merely an identity after forgetting equivariance. Theorem 3.1 of their Riemann–Roch paper supplies the compatible proper pushforward. The comparison to the chosen SchemeAndStackFoundations §§5.1–5.10 stack-Chow carrier is part of gap:stack-chow-grr; pullback to a plain atlas alone is not an injection on Picard groups.

State the divisorial-scheme hypothesis before using Corollary 6.9. The smooth-scheme GRR signature is not advertised as arbitrary singular or stack GRR. The sign in the pairing term is positive.

([mc5-erikssonfreixas2024](#references), §6.1.4, Proposition 6.8 and Corollary 6.9, pp. 316–318. Identifies the Deligne-pairing Chern class with the direct image in graded K-theory under the divisorial-base hypothesis. The projection-formula display in the Proposition 6.8 proof omits a gamma operation on its left side; the intended graded K-group statement and Corollary 6.9 are unchanged.; [mumford1977](#references), Theorem 5.10, rational calculation, pp. 100–102. Supplies the moduli rational computation, including the local singularity correction; a formal stack Chow comparison is required.; [mc5-edidingraham1997](#references), Theorem 1, pp. 7–8; Corollary 1, p. 9; Propositions 14–19, pp. 28–29. Gives the equivariant Chern/Picard comparison, its quotient-stack interpretation and rational intersection-product compatibility.; [mc5-edidingraham1999](#references), Theorem 3.1(b)–(e), pp. 13–14. Supplies proper equivariant pushforward and the smooth/qualified-lci Riemann–Roch compatibilities needed in a quotient presentation, with rational coefficients.)

*Needs:* gap:stack-chow-grr, SchemeAndStackFoundations §§5.1–5.10, SchemeAndStackFoundations §5.3, SchemeAndStackFoundations §§5.4, 5.8, [dualizing deligne pairing](#514-dualizing-deligne-pairing).

### 5.16 Rational Noether identity

Over C, for the universal stable genus-g family with g≥2, 12c₁(λ)=f_*(c₁(ω)²)+[Δ] in codimension-one Chow groups with rational coefficients, equivalently the corresponding Picard identity modulo torsion after the line-valued Deligne-pairing comparison. Each universal node smoothing branch contributes coefficient 1. The integral identity over Z is proved separately by complex torsion freeness and the integral Picard injection, not by an unstated mixed-characteristic GRR theorem.

One proof uses the following inputs and comparisons. Work on the characteristic-zero smooth tricanonical moduli charts with the equivariant descent needed for the stack. The universal curve is regular; its relative nodal morphism is lci, with its cotangent complex and virtual relative tangent convention specified. In the universal node chart xy=t, Ω¹→ω has cokernel at the codimension-two singular locus. Compute the node term and descend the branch contribution. Apply the source-scoped GRR, extended to the stack by gap:stack-chow-grr, and extract codimension one on the base; R¹f_*ω≅O has trivial determinant. Compare the pushforward intersection class with the first Chern class of the Deligne pairing. Use Pic≅CH¹ on the regular stack in this range to obtain the line identity modulo torsion. The integral Noether formula of §5.19 then uses torsion freeness and injection from Z to C.

A rational Chow identity alone is not the integral Picard identity.

([mumford1977](#references), Theorem 5.10 calculation, pp. 100–102.)

*Needs:* gap:stack-chow-grr, AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§5.1–5.10, StableReduction Layer 2, [hodge determinant and derived direct image](#513-hodge-determinant-and-derived-direct-image), [chern class of the dualizing pairing](#515-chern-class-of-the-dualizing-pairing).

### 5.17 Noether defect line

For g≥2 define the line `N_g=λ_g^{⊗12}⊗P_g∨⊗O(−Δ)` as an object of the line Picard groupoid on M̄_g/Z, where P_g is the actual universal dualizing pairing and O(−Δ)=O(Δ)∨. Its class vanishes exactly when a Noether isomorphism `λ_g^{⊗12}≅P_g⊗O(Δ)` exists. This criterion concerns existence; the set of choices is a torsor under global units.

Here g≥2; use the reduced local-node boundary convention of [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor). All tensor powers, duals, evaluation and cancellation maps live in the stack Picard groupoid supplied by SchemeAndStackFoundations §§1.18–1.23/SchemeAndStackFoundations §§3.3–3.7.

One proof uses the following inputs and comparisons. Apply tensor, dual and powers to the imported Hodge and boundary lines and the constructed P_g. Tensor cancellation identifies trivializations of N_g with Noether comparison isomorphisms. The Picard-groupoid unit automorphisms identify the ratio of two trivializations with a global unit.

The boundary occurs with a negative sign in N_g and a positive sign on the right of the Noether isomorphism. A vanishing rational Chern class alone does not construct a trivialization. Two comparisons are compared as maps of line objects before passing to classes.

The construction has the following API.

- Pull back N_g with its tensor and dual comparisons along any classifying map; for arbitrary families the boundary term means the pullback line.
- Trivializations N_g≅O correspond to isomorphisms λ_g^12≅P_g⊗O(Δ), with inverse given by tensor cancellation.
- Its Picard class is 12[λ_g]−[P_g]−[O(Δ)]; on an actual scheme chart equality of line classes is the pinned nonempty-isomorphism criterion.
- Given two trivializations, a unique unit takes one to the other; class equality contains no preferred choice.

**Checks.**

- If λ, P and O(Δ) are equipped with trivializations on a test scheme, the induced N is trivial; changing a trivialization changes the map, not its class.
- For a trait with one split node xy=π^m, the canonical rational section of the boundary factor O(−Δ) in N has order −m; the section of O(Δ) on the Noether right-hand side has order +m. This does not assign an order to an unspecified rational section of the whole defect line.
- For a nontrivial torsion line, vanishing in Pic⊗Q does not give an integral trivialization; the proof must still use complex torsion-freeness.
- On a Q-scheme, multiplying a comparison by 2 produces another comparison. It need not be the pullback of a universal choice differing by ±1.

([yuan-author-http](#references), Theorem 3.3 and §3.1.2, p. 42. The three lines and the universal-choice convention yield this obstruction line by tensor cancellation.; [mumford1977](#references), Theorem 5.10 and its proof, pp. 100–103. Separates the rational computation, torsion-freeness step and integral descent; the defect packages precisely those steps.)

*Needs:* SchemeAndStackFoundations §1.21, SchemeAndStackFoundations §3.4, `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`, `TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`, AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), [dualizing deligne pairing](#514-dualizing-deligne-pairing).

### 5.18 Rational Noether computation gives a torsion defect

For g≥2 the class [N_g/C] is torsion in Pic(M̄_g/C). Equivalently, some positive tensor power of N_g/C is trivial. This is the precise intermediate conclusion of rational Noether: 12c₁λ=f_*(c₁ω²)+[Δ] together with the pairing Chern comparison and the rational codimension-one Picard–Chow comparison.

The [rational noether identity](#516-rational-noether-identity) is over C and has coefficient one on every reduced universal node branch. gap:stack-chow-grr supplies an injective Pic⊗Q→CH¹⊗Q comparison for the actual stack; N_g is a genuine line, not a rational formal symbol.

One proof uses the following inputs and comparisons. Compute c₁(N_g/C) from its three factors and cancel using [rational noether identity](#516-rational-noether-identity) and [chern class of the dualizing pairing](#515-chern-class-of-the-dualizing-pairing). Transport the vanishing to Pic⊗Q through the specified codimension-one comparison. Use that the kernel of an abelian group’s map to its rationalization is its torsion subgroup; do not infer [N]=0 integrally yet.

The conclusion includes an existential positive exponent, not a canonical trivialization or an asserted exponent 12. A torsion character line on Bμ_r over C demonstrates why a rational class identity does not by itself imply an integral one.

([mumford1977](#references), Theorem 5.10, pp. 100–105; Lemma 5.14, p. 102. First obtains the line relation rationally and then needs a separate torsion-freeness theorem to make it integral.; [yuan-author-http](#references), Theorem 3.3, p. 42. States the integral endpoint, for which this target supplies only the rational and torsion intermediate step.; [mc5-edidingraham1997](#references), Corollary 1, p. 9; Propositions 16–19, pp. 28–29. Identifies equivariant Picard and codimension-one Chow for a smooth quotient presentation; rationalization detects exactly the torsion ambiguity.)

*Needs:* gap:stack-chow-grr, SchemeAndStackFoundations §3.4, [noether defect line](#517-noether-defect-line), [chern class of the dualizing pairing](#515-chern-class-of-the-dualizing-pairing), [rational noether identity](#516-rational-noether-identity).

### 5.19 Integral universal Noether formula

For g≥2 there is an isomorphism of invertible sheaves on `M̄_{g,Z}:λ^{⊗12}≅⟨ω,ω⟩⊗O(Δ)`. The relative Deligne pairing is a line on the base; its first Chern class is f_*(c₁ω·c₁ω). This is an integral Picard-group identity, natural under classifying pullback.

One proof uses the following inputs and comparisons. Use the generic integral Deligne-pairing construction, its base-change cocycle and c₁ comparison; this line-valued input is gap:integral-deligne-pairing. Restrict the difference line `λ^{12}⊗⟨ω,ω⟩^{-1}⊗O(−Δ)` to the complex stack. The characteristic-zero [rational noether identity](#516-rational-noether-identity) makes this complex restriction torsion in Pic. Complex Picard torsion freeness makes that restriction trivial. The injection `Pic(M̄_{g,Z})→Pic(M̄_{g,C})` then makes the integral difference line trivial, yielding an integral isomorphism. Choose one universal integral isomorphism and pull it back coherently. No rational Chow identity on an arbitrary family is substituted for this universal integral line identity.

The coefficient of Δ is +1 and the power on λ is 12.

([yuan-author-http](#references), Theorem 3.3 and §3.1.2, p. 42.)

*Needs:* gap:integral-deligne-pairing, [rational noether identity](#516-rational-noether-identity), [torsion freeness of the stable-stack picard group](#54-torsion-freeness-of-the-stable-stack-picard-group), [integral-to-complex picard injection](#58-integral-to-complex-picard-injection), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), SchemeAndStackFoundations §§5.1–5.10, [noether defect line](#517-noether-defect-line), [rational noether computation gives a torsion defect](#518-rational-noether-computation-gives-a-torsion-defect).

### 5.20 Noether isomorphism under arbitrary classifying pullback

Choose one universal integral isomorphism e:λ_g^12≅P_g⊗O(Δ), g≥2. For every stable genus-g family C→S classified by c:S→M̄_g, pullback and the Hodge/pairing comparisons give an actual line isomorphism (det f_*ω)^12≅⟨ω,ω⟩⊗c*O(Δ), coherent under arbitrary base change and isomorphisms of families. If S is integral noetherian and the family is generically smooth, c*O(Δ)=O(Δ_S) with its pulled-back effective-Cartier section. For a family lying in the boundary, c*O(Δ) still exists but its pulled-back section can be zero and need not cut out an effective Cartier divisor. Any two universal choices differ by ±1, whose images may coincide over characteristic two. Arbitrary family isomorphisms can instead differ by any unit on S.

All stable-family Hodge and dualizing base-change comparisons have been extended to arbitrary bases as specified in gap:cm-duality-arbitrary-base. [Integral universal noether formula](#519-integral-universal-noether-formula) and [global units on integral stable moduli](#55-global-units-on-integral-stable-moduli) give a universal choice and its universal ambiguity. An effective-Cartier family boundary is asserted only under the stated integral/noetherian/generically-smooth hypotheses.

One proof uses the following inputs and comparisons. Apply the stack Picard pullback functor to e; identify its left side using Hodge base change and AV determinant pullback. Identify the pairing by [dualizing deligne pairing](#514-dualizing-deligne-pairing) and keep the boundary as a line with its pulled-back section. Use nonvanishing of the generic smoothing parameters only when identifying the pulled-back section with a Cartier divisor. Transport the unique ratio unit of two universal comparisons through the same pullback functor; Γ(M̄_g/Z,O×)=Z× supplies ±1.

For a stable nodal curve over a field, the boundary line pulls back while its boundary section is zero; do not call that zero locus an effective Cartier divisor. For xy=π^m on a trait, the pulled-back boundary section has order m, not one. On an F₂-scheme the two universal signs have identical images. On a Q-scheme, multiplying a family comparison by 2 shows why arbitrary comparisons are not exhausted by the universal choices.

([yuan-author-http](#references), §3.1.2, pp. 42–43. States the classifying-pullback comparison and its universal-choice interpretation for generically smooth integral Noetherian families; arbitrary-base line pullback here follows from the explicit stack line and base-change contracts.; [mc5-erikssonfreixas2024](#references), Definition 4.16, p. 287; Proposition 6.1, pp. 311–312. Provides the nonflat and non-Noetherian pairing base-change input for the stated extension.)

*Needs:* gap:cm-duality-arbitrary-base, SchemeAndStackFoundations §3.4, `AlgebraicGeometry.Scheme.Modules.pullback`, `CategoryTheory.Functor.mapIso`, [integral universal noether formula](#519-integral-universal-noether-formula), [global units on integral stable moduli](#55-global-units-on-integral-stable-moduli), [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [dualizing deligne pairing](#514-dualizing-deligne-pairing), [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor).

### 5.21 Semi-canonical Noether comparison

For a stable genus-g family g≥2 over an integral noetherian S, generically smooth, call a Noether line isomorphism semi-canonical when it is the pullback of a chosen universal integral isomorphism on `M̄_{g,Z}`. All such isomorphisms differ by multiplication by ±1. This compares choices of universal isomorphism; arbitrary line isomorphisms on S may differ by other units.

One proof uses the following inputs and comparisons. Specify the universal source of the chosen line isomorphism and pull it back along the classifying morphism. Use the universal-unit theorem to compare choices.

Do not infer Γ(S,O×)={±1}.

The construction has the following API.

- The underlying line isomorphism is `λ_S^{⊗12}≅⟨ω_{C/S},ω_{C/S}⟩⊗O(Δ_S)`.
- A fixed universal line comparison, pulled back with the stated Hodge and pairing comparisons, is a semi-canonical family comparison, and a compatible base change pulls it back.
- Two universal choices differ by a unique element of Z×={±1}; their family pullbacks differ by its image in Γ(S,O_S)×.
- The chosen comparisons commute with arbitrary classifying pullback, with the Cartier-boundary interpretation restricted to generically smooth integral Noetherian bases.

**Checks.**

- For a smooth family the comparison has no boundary line factor.
- Over S=Spec C multiplying the line isomorphism by 2 yields another isomorphism but not a second universal integral choice: the ratio 2 is not the image of ±1.
- The two universal integral choices are φ and −φ and are distinct on `M̄_{g,Z}`. Their pullbacks coincide on every nonempty base of characteristic 2 (for instance Spec F₂) and are distinct wherever 2 is invertible.

([yuan-author-http](#references), §3.1.2, pp. 42–43.)

*Needs:* [integral universal noether formula](#519-integral-universal-noether-formula), [global units on integral stable moduli](#55-global-units-on-integral-stable-moduli), [the universal boundary cartier divisor](#52-the-universal-boundary-cartier-divisor), [noether isomorphism under arbitrary classifying pullback](#520-noether-isomorphism-under-arbitrary-classifying-pullback).

### Examples

At a node xy=π^e over a DVR, the boundary branch pulls back to e times the closed point. Two nodes of thicknesses 2 and 3 give total boundary length 5. The local residue vector (r,−r) changes to (−r,r) on branch reversal. For g=0 the Hodge bundle has rank zero and determinant O, while the unpointed integral Noether statement is scoped to g≥2.

### Dependencies

Layers 0–4; AlgebraicVectorBundles L0A–L0C; PadicMeasuresIwasawaAlgebras §5.1; JacobianChallengePartII §1.3a; SchemeAndStackFoundations §§1.22, 2.18–2.20, 3.4, 5.1–5.8; ComplexComparisonPartII §§C3.2d.1–C3.2d.4. The graded determinant and integral pairing contracts precede the rational Chow computation and the integral torsion argument.

## Layer 6: stable compactifications and Torelli

### 6.1 Maximal variation of a curve family

For an integral finite-type base S over a field and a smooth genus-g family, g≥2, maximal variation means that the coarse classifying map `S→M_g^{coarse}` is generically quasi-finite onto its image. The definition uses geometric curve isomorphism classes, not choices of frames or markings.

One proof uses the following inputs and comparisons. Take the coarse classifying map and require dimension of its geometric generic fibre over its image to be zero.

An isotrivial family over a positive-dimensional base does not have maximal variation.

The construction has the following API.

- The image dimension equals dim S.
- A finite dominant change of integral base preserves maximal variation.
- The condition is checked on the coarse classifying map.
- Extension of the ground field preserves zero-dimensional geometric generic fibres of the coarse classifying map; when the extended base has several components, assert the condition separately on each dominating integral component.

**Checks.**

- A constant family on a positive-dimensional integral base fails maximal variation.
- A family on an integral zero-dimensional field base has maximal variation.
- The positive-dimensional projective-frame torsor of one fixed curve is not maximal variation.

([yuan-author-http](#references), Introduction, p. 2; §3.4, p. 56.)

*Needs:* SchemeAndStackFoundations §4.15, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks).

### 6.2 Stable compactification of a smooth family

For k a field or Z, an integral quasi-projective k-scheme S and a smooth genus-g family X/S, g≥2, a stable compactification consists of a projective integral k-scheme S̄ containing S as a dense open, a stable family X̄/S̄, and a Cartesian comparison `X≅X̄×_{S̄}S`. The open immersion on total spaces is the one induced by this comparison.

One proof uses the following inputs and comparisons. Specify a projective compactification of the base and a stable extension restricting to the given family, including its classifying isomorphism.

The base compactification is part of the data.

The construction has the following API.

- S̄ is projective integral and S→S̄ is a dense open immersion.
- The square of families over S→S̄ is Cartesian.
- The extended Hodge line restricts to the Hodge line of the original family.
- Transport a compactification along a curve-family isomorphism over S by composing its restriction comparison; the base and stable extension are unchanged and identity/composition hold.

**Checks.**

- A smooth family over a projective integral base admits the identity compactification.
- Over a discrete valuation test base, stable reduction supplies the stable extension after the allowed finite field extension.
- Closing the constant classifying image in a moduli cover cannot compactify a positive-dimensional base.

([yuan-author-http](#references), §3.1.4, p. 45.)

*Needs:* SchemeAndStackFoundations §4.15, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, StableReduction Layer 3.

### 6.3 The smooth full-level Torelli morphism

Over the fixed pairing base and for g≥2, form τ:M_g[N]→A_g[N] by the relative Jacobian with its canonical principal polarization and induced full level. The pullback of the universal abelian scheme is canonically Jac(C_g/M_g[N]); in particular the square of abelian schemes is Cartesian.

Here g≥2 and N≥3; work over B=Spec Z[1/N,ζ_N] in the fixed symplectic component, with the same pairing convention in M_g[N] and A_g[N]. The fine curve scheme is Noetherian, and its universal curve is smooth projective geometrically connected of genus g; hence the JacobianChallengePartII §§1.1–1.4 suppliers apply without choosing a section of the curve.

One proof uses the following inputs and comparisons. Apply the exact JacobianChallengePartII §§1.1–1.4 imports to the universal curve over the Noetherian fine scheme. All satisfy g>0, smoothness, projectivity and geometric connectedness. Arbitrary test-scheme pullbacks are supplied by their base-change comparisons. The levelled polarized Jacobian (J(C/M),λ_C,α) with its base-change comparison is JacobianChallengePartII §7.1; apply the fine principally polarized moduli universal property of PELModuli §§M5.1–M5.3 to it over the identical cyclotomic base. The classifying map and its universal-family identification give the Cartesian square.

The curve-to-Jacobian construction is not abelian-scheme duality. The Hodge comparison along this morphism is §6.7; no generic Picard Lie or curve duality theorem is reconstructed here.

The construction has the following API.

- τ sends (C,α) to (J(C),λ_C,α).
- τ* of the universal ppav is the relative Jacobian of the universal curve.
- τ* of the ppav Hodge determinant is det f_*ω of the curve family.
- Change of base over the fixed pairing base commutes with τ and its universal-Jacobian comparison through the relative Picard base-change isomorphism; identity and composition satisfy the same cocycle.

**Checks.**

- In genus 2 both smooth moduli and ppav moduli have dimension 3.
- For nonhyperelliptic genus≥3, (C,α) and (C,−α) can be distinct curve-level objects although their ppav-level images are isomorphic.
- The hyperelliptic involution realizes sign change of level on the curve.

([dgh](#references), §6.1, pp. 23–24.)

*Needs:* [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), PELModuli §§M5.1–M5.3, PELModuli §§M6.9–M6.10, JacobianChallengePartII §§1.1–1.4, JacobianChallengePartII §7.1.

### 6.4 The compactified Torelli and Hodge comparison

Over an algebraically closed field k of characteristic zero, the coarse stable curve moduli admits a morphism `t̄:M̄_g^{coarse}→A_g^{min}` extending smooth Torelli. On a stable curve it uses the abelian part of the generalized Jacobian and maps to the corresponding minimal-compactification stratum. The descended rational Hodge line satisfies λ_coarse=t̄*ω_min, with ω_min ample.

One proof uses the following inputs and comparisons. On integral Noetherian stable-family atlas charts import NeronModelsAndSemistableAbelianVarieties §4.13 `StableFamilyPicard` and JacobianChallengePartII §§6.1–6.3. The source does not require a regular total space. Descending the semiabelian group and line comparisons to the stack remains part of the atlas/descent contract. For a geometric stable curve use NeronModelsAndSemistableAbelianVarieties §4.1 `NormalizationExactSequence` to identify the abelian quotient with the product of normalized-component Jacobians; the torus retains loops and multiple edges. Use the minimal Siegel extension theorem and descended rational automorphic Hodge line; in positive characteristic the same morphism is [compactified torelli in every characteristic](#617-compactified-torelli-in-every-characteristic), which uses gap:minimal-siegel-all-characteristics. Check the extension and line comparison on the boundary with the source’s abelian-part interpretation and descent. NeronModelsAndSemistableAbelianVarieties §4.1 applies directly to every geometric nodal curve; its normalization sequence is not restricted to a DVR. Arbitrary-base representation and descent of the stable Picard scheme use gap:stable-picard-arbitrary-base. The Hodge comparison of §6.7 applies to smooth full-level Torelli, so the stable boundary comparison imports JacobianChallengePartII §§6.1–6.3 directly.

The entire semiabelian Jacobian is not an abelian scheme at a non-compact-type node.

([knudsen3](#references), §6, printed pp. 210–211 (PDF pp. 11–12), characteristic-zero Satake map and properties (1)–(2) on p. 211; [yuan-author-http](#references), §3.4, printed/PDF p. 56, compactified Torelli/Hodge paragraph.)

*Needs:* gap:stable-picard-arbitrary-base, ShimuraCompactifications §2.8, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, ShimuraCompactifications §§6.1–6.7, ShimuraCompactifications §6.10, ShimuraCompactifications §§7.13–7.17, NeronModelsAndSemistableAbelianVarieties §4.13, NeronModelsAndSemistableAbelianVarieties §4.1, JacobianChallengePartII §§6.1–6.3.

### 6.5 Graph-closure compactification after a finite cover

Choose a projective compactification S̄₀ of S and the normal projective finite scheme cover V→M̄_g (the normalization of a cover from gap:finite-scheme-cover). Let `W=S×_{M̄_g}V`, choose a reduced irreducible component W₀ dominating S, and normalize it to S′. In S̄₀×V close the finite image of W₀, then normalize that integral closure in the finite function-field extension K(W₀) to obtain S̄′. The resulting S′ is the inverse image of S under S̄′→S̄₀, and the family pulled back from V extends X×_S S′.

One proof uses the following inputs and comparisons. W is finite surjective over S because the cover map is representable finite. A component dominates the generic point of integral S. The map W→S×V is finite, as the pullback of the finite diagonal of M̄_g. It need not be a monomorphism: the chosen isomorphism of the two curve families is part of W. Close its finite image in the projective product, preserving the S̄₀-coordinate and then its function field K(W₀); normalization in a finite extension is finite over the excellent finite-type base. Because W₀ is finite over its image, normalization over the open S in K(W₀) is the normalization of W₀; the extension family is obtained from the second projection to V.

The graph retains the base coordinate even for a constant family.

The construction has the following API.

- S′→S is finite dominant and surjective.
- S̄′ is normal integral projective over k.
- The stable family on S̄′ restricts to X×_S S′.
- The original isomorphism over W₀ between the pulled-back curve and the family from V extends to its normalization S′ by pullback. Keep this family isomorphism as data; W₀→S×V is finite and need not be a monomorphism.

**Checks.**

- For a constant family on A¹, S̄₀×V retains the A¹ direction; closing only in V loses it.
- If W is reducible, take a component dominating S rather than assert that all of W is integral.
- Normalization commutes with restriction to the open inverse image of S.
- For a constant smooth genus≥2 curve over A¹_k, the retained-base graph closure has dimension 1; after the finite-cover normalization it still compactifies a one-dimensional base, even though the moduli image is a point.

([yuan-author-http](#references), §3.1.4, p. 45, final paragraph (corrected graph closure).)

*Needs:* gap:finite-scheme-cover, [stable compactification of a smooth family](#62-stable-compactification-of-a-smooth-family), SchemeAndStackFoundations §4.15, AlgebraicModuliForArithmeticGeometry §§5.1–5.4, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21.

### 6.6 Finite Torelli fibres and the sign ambiguity

On geometric points the smooth full-level Torelli morphism has fibres of size at most2. On nonhyperelliptic curves the two objects (C,α) and (C,−α) are distinct for N≥3; for hyperelliptic curves they are isomorphic. Since every smooth genus-two curve is hyperelliptic, the genus-two map is injective on geometric points. Finite fibres do not imply the smooth Torelli map is a finite morphism.

One proof uses the following inputs and comparisons. Import strong classical Torelli: a ppav isomorphism of Jacobians equals ± the Jacobian of a curve isomorphism, with the hyperelliptic qualification. Apply the pairing-level compatibility; on a nonhyperelliptic curve there is no curve automorphism inducing −1. For genus 2 use the hyperelliptic double cover. Strong Torelli with its sign and hyperelliptic distinction is gap:strong-torelli-faithfulness.

The blanket claim of noninjectivity for every g≥2 is excluded.

([milne](#references), Theorem 12.1(a)–(b), printed/PDF p. 38; uniqueness/sign proof pp. 38–39; proof of (a) §13, pp. 40–45; [dgh](#references), §6.1, printed/PDF p. 24, paragraph following diagram (6.1).)

*Needs:* gap:strong-torelli-faithfulness, [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), [rigidity of full curve level](#44-rigidity-of-full-curve-level), JacobianChallenge Layer D.

### 6.7 Hodge pullback along smooth full-level Torelli

For g≥2 and N≥3 over the fixed pairing base B=Spec Z[1/N,ζ_N], let τ:M_g[N]→A_g[N] be smooth full-level Torelli. The canonical comparison of its universal families identifies τ* of the ppav Hodge bundle with f_*ω of the universal curve; its determinant identifies τ* of the ppav Hodge line with the curve Hodge line. Pullback along every T→M_g[N], including nonreduced T, respects these comparisons and their identity/composition isomorphisms.

The fine-level scheme and its universal smooth projective curve have the properties of [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme); g≥2, N≥3 invertible, with the same ζ_N pairing component on both moduli schemes. JacobianChallengePartII §§6.1–6.3 supplies the generic stable-family comparison over integral Noetherian bases with g>1. Apply it componentwise on the regular Noetherian fine curve scheme using the explicit SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 component criterion; do not silently apply that supplier over an arbitrary nonintegral base.

One proof uses the following inputs and comparisons. The fine curve scheme is regular Noetherian and quasi-compact. Use the SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 statement that such a scheme is a finite disjoint union of open-and-closed integral connected components. This avoids requiring the separate Teichmüller/level-connectedness theorem merely to use JacobianChallengePartII §§6.1–6.3. On each component the universal smooth curve is a stable connected nodal family of genus g>1. Import JacobianChallengePartII §§6.1–6.3; their generic Lie/duality construction stays in the Jacobian owner. The Cartesian abelian-family comparison of [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism) identifies the invariant differentials with the pullback ppav Hodge bundle. Assemble the componentwise isomorphisms on their disjoint cover and take the determinant. Pull back the resulting universal comparison to arbitrary T by the supplied Hodge-bundle and Jacobian base-change isomorphisms. Check identity/composition; no new arbitrary-base Picard representability theorem is inferred from the integral-base JacobianChallengePartII §§6.1–6.3 statement.

This is a canonical algebraic line comparison; metrics on the Hodge line are not part of it.

([yuan-author-http](#references), Lemma 3.4 and proof, pp. 43–44.)

*Needs:* [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), JacobianChallengePartII §§6.1–6.3, SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme).

### 6.8 Existence after a finite dominant base change

Every smooth genus-g family g≥2 over an integral quasi-projective scheme over a field or Z admits a stable compactification after a finite surjective morphism S′→S with S′ normal integral.

One proof uses the following inputs and comparisons. Use the graph construction and its stable pullback family. The closed finite image of the dominating component contains the generic point of S and hence all of S.

No maximal-variation hypothesis is needed.

([yuan-author-http](#references), §3.1.4, pp. 45–46.)

*Needs:* [graph-closure compactification after a finite cover](#65-graph-closure-compactification-after-a-finite-cover), [stable compactification of a smooth family](#62-stable-compactification-of-a-smooth-family).

### 6.9 Nef and big Hodge line for maximal variation

Let k be a field of characteristic zero, S̄ normal integral projective over k, and f:X̄→S̄ a stable genus-g family g≥2 with smooth restriction over a dense open S. If that smooth family has maximal variation, `λ_{S̄}=det` f_*ω is nef and big. No maximal-variation conclusion is asserted for an isotrivial positive-dimensional family. Over an arbitrary field the same conclusion is [hodge positivity over an arbitrary field](#622-hodge-positivity-over-an-arbitrary-field).

One proof uses the following inputs and comparisons. After a finite field or level-cover change use the compactified Torelli and ample rational Hodge line on the minimal Siegel compactification. The composite classifying map is generically finite onto its image by maximal variation and finite Torelli fibres. The pullback of an ample line along a projective generically finite map is nef and big; descend nefness/bigness through the finite cover.

Only finite fibres on the smooth locus are used.

([yuan-author-http](#references), §3.4 (which begins on p. 54), argument following Remark 3.9, pp. 55–56.)

*Needs:* [maximal variation of a curve family](#61-maximal-variation-of-a-curve-family), [the compactified torelli and hodge comparison](#64-the-compactified-torelli-and-hodge-comparison), [finite torelli fibres and the sign ambiguity](#66-finite-torelli-fibres-and-the-sign-ambiguity), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, SchemeAndStackFoundations §§5.1–5.10.

### 6.10 A stable compactification for the fine level family

The universal smooth family over a fixed full-level component M_g[N] has a stable compactification after a finite dominant cover. Choose a projective coarse compactification, close the graph into a stable moduli scheme cover and normalize as above. Do not assert that the boundary represents naive full torsion frames of every stable Jacobian.

One proof uses the following inputs and comparisons. Apply the general graph-closure theorem to the quasi-projective integral fine-level component, after geometric component choice as required. Keep the stable extension and the dense-open level interpretation distinct.

N remains invertible on the original level base.

([yuan-author-http](#references), §3.1.4, p. 46.)

*Needs:* [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [existence after a finite dominant base change](#68-existence-after-a-finite-dominant-base-change).

### 6.11 Stable compactification of a stable input family

Let B be Spec Z or Spec k for an arbitrary field k, S an integral quasi-projective B-scheme and C→S a stable genus-g family, g≥2. There exist a normal integral scheme S′, a finite surjective map p:S′→S, an open immersion j:S′→S̄′ with S̄′ normal integral projective over B, and a stable family C̄′→S̄′ whose restriction is isomorphic to C×_S S′. The construction preserves a nodal family; smooth generic fibre is not required. This extends [graph-closure compactification after a finite cover](#65-graph-closure-compactification-after-a-finite-cover) and [existence after a finite dominant base change](#68-existence-after-a-finite-dominant-base-change) from smooth to stable input families.

Integral means reduced and irreducible; finite type is included in quasi-projective. A compactification is over the same B. The finite projective cover V→M̄_g is a representable finite surjective map to the stack, carrying the universal stable family.

One proof uses the following inputs and comparisons. Choose a projective B-compactification S̄₀. In `W=S×_{M̄_g}V` choose a reduced irreducible component W₀ dominating S. Its field L=K(W₀) is finite over K(S). The stack diagonal is finite, so W→S×_B V is finite, not generally a monomorphism. Let D be the integral reduced closure of its W₀-image in S̄₀×_B V. Define S̄′ to be the normalization of D in L. D is excellent and Nagata. The exact SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 finite-normalization target gives a finite S̄′→D, hence projectivity. Over S the result is the normalization of W₀, with a finite surjective map to S. Both normalizations use L; normalization in K(D) can discard isomorphism data. Pull the stable universal curve on V to S̄′. The defining stack fibre product supplies the isomorphism on S′. None of these steps uses smoothness of the initial family.

For C=C₀×A¹ with fixed stable C₀, S̄′ has dimension 1. Closing only the point [C₀] does not pass. Over a field of characteristic≠2, a quadratic twist of a genus 2 curve with automorphism group {±1} can become isomorphic to the original curve only over a quadratic field L. The corresponding isomorphism component in the stack fibre product has field L, while its image point has the smaller field. The normalization must retain L. For a stable C₀ with a node, the constant family over A¹ satisfies the hypotheses; no smooth-generic restriction is introduced.

([yuan-author-http](#references), §3.1.4, p. 45. Stable extension after a finite cover; use the correction retaining the base and the finite-cover function field, rather than closing only the moduli image.)

*Needs:* SchemeAndStackFoundations §§0.20–0.21, `AlgebraicGeometry.IsFinite.of_comp`, `CategoryTheory.Limits.pullback.lift`, [graph-closure compactification after a finite cover](#65-graph-closure-compactification-after-a-finite-cover), SchemeAndStackFoundations §4.15.

### 6.12 Full-level Torelli by the relative Jacobian

Fix g≥2, N≥3 and B_N=Spec Z[1/N,ζ_N] with the chosen primitive root specifying the symplectic pairing. For the universal smooth curve of [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme) f:C_g[N]→M_g[N], use JacobianChallengePartII §§1.1–1.4 to form `J=Pic⁰_{C/M}`, its canonical principal polarization and the induced full symplectic level. Its PEL classifying map τ_N:M_g[N]→A_g[N] has a canonical isomorphism `J≅M_g[N]×_{A_g[N]}A_g[N]^univ` preserving polarization and level. Formation is natural under every test-scheme pullback; it does not choose a section of C. This is the morphism τ of [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), constructed here with its universal Cartesian comparison over B_N.

Both source and target use the same fixed cyclotomic pairing component. N is invertible on B_N. The fine Siegel target may be used as an algebraic space; its scheme realization (PELModuli §§M5.1–M5.3) is not needed to define the classifying map.

One proof uses the following inputs and comparisons. Import the family Picard construction and its base change. Use the canonical polarization descended from local theta data; there is no global Abel–Jacobi base point. The levelled polarized Jacobian (J,λ,α) with its base-change comparison is JacobianChallengePartII §7.1, whose pairing condition is the agreed Weil pairing. Apply fine ppav representability to the object (J,λ,α). The universal property supplies the Cartesian family comparison and its identity/composition coherence, rather than just agreement on geometric points.

Over ℚ(ζ_N), τ_N restricts to the quasi-finite Torelli map of AbelianSchemesAndArithmeticModuliPartII §B4.1 under the identification of [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), since both classify the same polarized Jacobian with level. A genus≥2 family without a section still has τ_N and the Cartesian Jacobian comparison. A map from Spec k[ε]/(ε²) is tested by pullback of the same relative Picard object, not just a pointwise Jacobian assignment. Changing ζ_N changes the paired base/component; a map between mismatched pairing components is rejected.

The construction has the following API.

- τ_N classifies exactly (Pic⁰, canonical principal polarization, induced symplectic level).
- The displayed universal-Jacobian square is Cartesian as a square of families, with the polarization and level comparisons.
- For T→M_g[N] the pulled-back universal comparison is the JacobianChallengePartII §§1.1–1.4 comparison for C_T; identity and successive pullbacks agree.
- For N dividing N′, with compatible cyclotomic base maps and both levels≥3, forgetting level commutes with τ and its family comparison.
- Forgetting full level gives the stack morphism M_g→A_g and then the coarse smooth Torelli map.

**Checks.**

- A smooth family with no global section is allowed; replacing Pic⁰ by a pointed Abel–Jacobi construction fails.
- The construction on a dual-number test scheme is the pullback abelian scheme with its level, including nilpotent directions.
- A level with Weil pairing ζ_N^a for a∈(Z/NZ)× with a≠1 in Z/NZ does not lie in the fixed ζ_N component until the base/pairing convention changes. Taking a=1+N leaves the pairing unchanged and is not a counterexample.

([dgh](#references), §6.1, pp. 23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JacobianChallengePartII §§1.1–1.4 and PELModuli, not inferred from this complex-geometric passage.; [blr-relative-picard-LwkQQl](#references), §8.4, Theorem 1(a), pp. 231–232; §9.4, Theorem 1 and Proposition 4, pp. 259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular.)

*Needs:* AbelianSchemesAndArithmeticModuliPartII §B4.1, JacobianChallengePartII §§1.1–1.4, PELModuli §§M5.1–M5.3, PELModuli §§M6.9–M6.10, [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), JacobianChallengePartII §7.1.

### 6.13 Canonical Hodge comparison on the fine moduli scheme

For τ_N above, let `E_A=e*Ω¹_{A_g[N]^univ/A_g[N]}`, `E_C=f_*ω_{C/M}`, and λ_A=det E_A, λ_C=det E_C. There are canonical coherent isomorphisms τ_N*E_A≅E_C and τ_N*λ_A≅λ_C. Their pullback along every T→M_g[N], including nonreduced T, is the relative Jacobian Hodge comparison for C_T. Both bundles have rank g; the second comparison is its determinant. This is the comparison of [hodge pullback along smooth full-level torelli](#67-hodge-pullback-along-smooth-full-level-torelli), with the componentwise argument written out for τ_N.

Here g≥2, N≥3 and B_N as above; M_g[N] is regular, Noetherian and quasi-compact. The integral-base JacobianChallengePartII §§6.1–6.3 theorem is applied on integral open-and-closed components of this fine scheme, not to an arbitrary test scheme T.

One proof uses the following inputs and comparisons. Regular local rings are integrally closed domains. SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 identifies finitely many disjoint integral open-and-closed components; no geometric irreducibility theorem is required. Apply JacobianChallengePartII §§6.1–6.3 on each component to identify e*Ω¹_J with (R¹f_*O_C)∨≅f_*ω. Use the Cartesian Jacobian comparison to identify the left side with τ_N*E_A. Glue the canonical componentwise maps. Pull this map and the represented Picard/base-change comparisons to arbitrary T; do not reapply an integral theorem to nonreduced T. Take the fixed-rank determinant using the existing AlgebraicVectorBundles L0C functor imported in Layer 5. Identity and composition coherence come from the same natural maps.

On two disconnected integral components the maps glue componentwise, without assuming the full fine scheme integral. For a dual-number test base the same comparison survives and its reduction agrees with the geometric comparison. In genus 2 the bundle rank is 2 but its determinant rank is 1; replacing E by λ fails.

([blr-relative-picard-LwkQQl](#references), §8.4, Theorem 1(a), pp. 231–232; §9.4, Theorem 1 and Proposition 4, pp. 259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular.; [dgh](#references), §6.1, pp. 23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JacobianChallengePartII §§1.1–1.4 and PELModuli, not inferred from this complex-geometric passage.; [mc6-stacksregular](#references), Lemmas28.7.5–6 and 28.9.4. Regularity supplies normal local domains; quasi-compact Noetherian normal schemes split into finitely many integral components.)

*Needs:* SchemeAndStackFoundations §0.30, JacobianChallengePartII §§6.1–6.3, [full-level torelli by the relative jacobian](#612-full-level-torelli-by-the-relative-jacobian), [hodge pullback along smooth full-level torelli](#67-hodge-pullback-along-smooth-full-level-torelli), [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5.

### 6.14 The sign ambiguity in geometric Torelli fibres

Over an algebraically closed field k of arbitrary characteristic with N invertible, the fibre of τ_N over a geometric point is empty or has at most two geometric points. If a preimage is (C,α), the possible points are (C,α) and (C,−α). They are distinct precisely when C is nonhyperelliptic; for hyperelliptic C the hyperelliptic involution identifies them. In genus 2 every C is hyperelliptic, so the map is injective on geometric points. Thus τ_N is quasi-finite. No assertion of reduced fibres, separability or proper finiteness is made. This is the fibre statement of [finite torelli fibres and the sign ambiguity](#66-finite-torelli-fibres-and-the-sign-ambiguity) for τ_N, in every residue characteristic prime to N.

Here g≥2, N≥3, p∤N, and the fixed symplectic pairing convention of τ_N. Use strong Torelli including its ± uniqueness statement, not merely injectivity of the curve-isomorphism-class map.

One proof uses the following inputs and comparisons. Use strong Torelli in every characteristic, gap:strong-torelli-faithfulness. Compare two polarized Jacobian isomorphisms using the induced curve isomorphism up to sign. Transport full level across that curve isomorphism. The only remaining possibilities are α and −α. For N≥3 these levels differ as torsion trivializations, including in characteristic 2. Strong Torelli says −1 is induced by a curve automorphism exactly in the hyperelliptic case. The resulting point count and finite-type morphism give quasi-finiteness; no infinitesimal-fibre conclusion follows.

For a nonhyperelliptic genus 3 curve and N=3 there are two different curve-level points with the same ppav-level image. For a genus 2 curve and any allowed N there is one point in a nonempty fibre. Characteristic2 with odd N is allowed: multiplication by −1 on étale N-torsion is not multiplication by 1. A compact-type degeneration of a smooth genus 2 curve to two elliptic components has decomposable Jacobian in A₂ but no smooth preimage there; smooth Torelli is not proper.

([milne](#references), Theorem 12.1(a,b), pp. 38–39; existence proof begins §13, pp. 40–41. A polarized Jacobian isomorphism is induced by a curve isomorphism up to sign; sign uniqueness depends on hyperellipticity.; [dgh](#references), §6.1, pp. 23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JacobianChallengePartII §§1.1–1.4 and PELModuli, not inferred from this complex-geometric passage.)

*Needs:* gap:strong-torelli-faithfulness, JacobianChallengePartII §§1.1–1.4, [full-level torelli by the relative jacobian](#612-full-level-torelli-by-the-relative-jacobian), [finite torelli fibres and the sign ambiguity](#66-finite-torelli-fibres-and-the-sign-ambiguity), [rigidity of full curve level](#44-rigidity-of-full-curve-level).

### 6.15 Stable Picard and Hodge comparison along a moduli atlas

Let U→M̄_g be a quasi-compact regular Noetherian smooth scheme atlas over Z, g≥2, and `R=U×_{M̄_g}U`. On integral open-and-closed components of U and R the NeronModelsAndSemistableAbelianVarieties §4.13 stable-family Picard and JacobianChallengePartII §§6.1–6.3 comparison identify `e*Ω¹_{Pic⁰}` with f_*ω. Canonical pullback isomorphisms of the represented relative Picard functor identify the two objects on R and satisfy the cocycle on triple overlaps. They descend a semiabelian Picard group object over the stack and its rank-g Hodge comparison. For any test scheme T→M̄_g the comparison is the pullback one for the classified stable curve, including nonreduced T; a scheme-representability claim on T requires the NeronModelsAndSemistableAbelianVarieties §4.13 arbitrary-base export, not algebraic-space descent alone.

The atlas of SchemeAndStackFoundations §4.15 is smooth over the regular base Z and finite type; its overlaps are representable schemes and regular Noetherian. The arbitrary-base Picard identification and effective scheme representation are gap:stable-picard-arbitrary-base. Geometric normalization is imported directly from NeronModelsAndSemistableAbelianVarieties §4.1.

One proof uses the following inputs and comparisons. Use regularity and the exact SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21 component criterion on U, R and triple overlaps; apply integral-base NeronModelsAndSemistableAbelianVarieties §4.13 and JacobianChallengePartII §§6.1–6.3 componentwise. All comparison maps arise from pullback of the same fppf Picard sheaf and the natural Lie/cohomology map. Hence they agree on overlaps and satisfy the cocycle before taking determinants. Use algebraic-space group descent and quasi-coherent descent for the stack object and Hodge isomorphism. Use gap:stable-picard-arbitrary-base for scheme representation; algebraic-space descent alone is insufficient. For arbitrary T, pull back the canonical atlas descent and compare its represented Picard functor. This transfers the formula without assuming T integral or regular.

For a stable one-node irreducible genus 2 curve with elliptic normalization, the semiabelian fibre has torus rank 1 and abelian rank 1, but its Hodge rank is 2. For two elliptic components joined at one separating node, torus rank is 0 and Pic⁰ is their product. A stable degeneration with local total-space equation xy=t² has nonregular total space at the node; it still lies in the source range. On a nonreduced test scheme only the canonical pullback comparison is used; splitting it into integral components is invalid.

([blr-relative-picard-LwkQQl](#references), §8.4, Theorem 1(a), pp. 231–232; §9.4, Theorem 1 and Proposition 4, pp. 259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular.; [yuan-author-http](#references), Lemma 3.4, pp. 43–44. Uses BLR9.4/1 for stable Picard and the Lie–cohomology/duality comparison; integral Noetherian scope is not a regular-total-space hypothesis.)

*Needs:* gap:stable-picard-arbitrary-base, SchemeAndStackFoundations §0.30, SchemeAndStackFoundations §1.2, SchemeAndStackFoundations §1.1, NeronModelsAndSemistableAbelianVarieties §4.13, JacobianChallengePartII §§6.1–6.3, [hilbert quotient presentation](#111-hilbert-quotient-presentation), SchemeAndStackFoundations §4.15, [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves).

### 6.16 The abelian part of a stable Jacobian

For a stable connected curve C of genus g≥2 over an algebraically closed field k, let ν:⊔_v C̃_v→C be its normalization and Γ its dual multigraph, allowing loops. There is a canonical fppf exact sequence 1→T_Γ→Pic⁰_C→∏_v J(C̃_v)→0, with X*(T_Γ)=H₁(Γ,Z). Put r=b₁(Γ) and a=Σ_v g(C̃_v)=g−r. The abelian quotient has the product principal polarization and defines a point of the a-dimensional ppav stratum of A_g^min. Hodge rank of Pic⁰_C remains g, not a.

Vertices index geometric irreducible components; edges index nodes, including self-nodes. The normalized component Jacobians and their principal polarizations are imports, not reconstructed here.

One proof uses the following inputs and comparisons. Import NeronModelsAndSemistableAbelianVarieties §4.1 `NormalizationExactSequence` and its graph-character calculation. Use arithmetic-genus additivity to identify g=a+r. Give the abelian quotient the product polarization; its determinant differential is not the whole rank-g semiabelian Hodge bundle. Apply the description of the strata of the minimal compactification by abelian parts (ShimuraCompactifications §§7.16–7.17, in every characteristic by gap:minimal-siegel-all-characteristics). No claim that the nonproper generalized Jacobian itself lies in A_g is made.

An irreducible stable genus 2 curve with one node and elliptic normalization maps to the A₁ stratum, and X*(T)=Z. A union of two elliptic curves meeting at one node maps to their product in the interior A₂ (compact type). A rational curve with two self-nodes is stable of genus 2: X*(T)=Z², abelian quotient 0, and the minimal image lies in A₀. Counting only edges between different components fails.

([blr-relative-picard-LwkQQl](#references), §8.4, Theorem 1(a), pp. 231–232; §9.4, Theorem 1 and Proposition 4, pp. 259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular.; [mc6-fc1990](#references), IV Proposition 5.1, Remark 5.3, Theorem 5.7, pp. 113–117; V Theorem 2.3, pp. 150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension and Hodge comparison independent of a chosen cone is part of gap:minimal-siegel-all-characteristics, not a statement of these theorems.)

*Needs:* gap:minimal-siegel-all-characteristics, NeronModelsAndSemistableAbelianVarieties §4.1, NeronModelsAndSemistableAbelianVarieties §4.13, JacobianChallengePartII §§1.1–1.4, ShimuraCompactifications §§6.1–6.7, ShimuraCompactifications §6.10, ShimuraCompactifications §§7.13–7.17, [stable picard and hodge comparison along a moduli atlas](#615-stable-picard-and-hodge-comparison-along-a-moduli-atlas).

### 6.17 Compactified Torelli in every characteristic

For every algebraically closed field k and g≥2 construct t̄_g:M̄_g^coarse→A_g^min over k, extending coarse smooth Torelli. Its value on a stable curve C is the principally polarized abelian part ∏_v J(C̃_v) in the A_a stratum, a=g−b₁(Γ). The stack morphism is defined by canonical semiabelian specialization on regular atlases and descends by the coarse universal property. It is independent of the atlas, finite stable-family cover and any toroidal cone choices; it commutes with extension of algebraically closed fields.

Here A_g^min is the unlevelled principal Siegel minimal compactification over k of gap:minimal-siegel-all-characteristics, whose existence over Z is Faltings–Chai V Theorem 2.3. A literal identification with a geometric fibre of the integral model is not assumed; a characteristic-zero Satake theorem alone does not supply this target. The normal-base semiabelian extension and Hodge-power statements are part of gap:minimal-siegel-all-characteristics. No use is made of Faltings–Chai V Theorem 6.7 in characteristic p. Coarse formation is used over fixed k and permitted flat field extension; no arbitrary nonflat base-change theorem is asserted.

One proof uses the following inputs and comparisons. Choose a quasi-compact smooth scheme atlas of M̄_g over the fixed field k. Smoothness of M̄_g over k (SchemeAndStackFoundations §4.15) makes the atlas and its scheme double overlaps regular, and the dense smooth-curve locus meets every integral component by the boundary theorem. On each component use its stable Picard semiabelian scheme, generically a canonically polarized abelian scheme. Invoke the stable-Jacobian polarized-trait compatibility of gap:minimal-siegel-all-characteristics before applying the normal-base minimal-extension/Hodge-power contract. Both this trait identification and the minimal contraction remain in gap:minimal-siegel-all-characteristics; semiabelianity alone is not the asserted input. Uniqueness and the canonical Picard overlap isomorphisms make these maps agree on double overlaps. Descend the stack map; the categorical coarse universal property factors it uniquely through M̄_g^coarse. At geometric boundary points apply the abelian-part stratum rule. On the smooth open this is the JacobianChallengePartII §§1.1–1.4 Jacobian, so the result extends smooth Torelli. Faltings–Chai IV Proposition 5.1 requires a common toroidal cone on a general normal base; independence after contraction to the minimal space is part of gap:minimal-siegel-all-characteristics.

A separating elliptic–elliptic genus 2 boundary curve maps into A₂, not the lower-dimensional boundary. A rational stable genus 2 curve with two nodes maps into A₀. Moving the attaching points of two fixed smooth components leaves the product-Jacobian image fixed; compactified Torelli need not have finite fibres. A characteristic 2 example is covered by the minimal compactification over Z and gap:minimal-siegel-all-characteristics, not by characteristic-zero purity.

The construction has the following API.

- Restriction to M_g^coarse is coarse smooth Torelli induced by JacobianChallengePartII §§1.1–1.4.
- At C the stratum and ppav point are the polarized product of normalization-component Jacobians.
- The morphism agrees with every atlas-local semiabelian classifying extension and is uniquely determined by this property.
- Extension of algebraically closed fields preserves the morphism and the boundary-value formula.
- Its pullback of the minimal ample Hodge power is the same positive power of the stable curve Hodge line, as supplied by gap:minimal-siegel-all-characteristics.

**Checks.**

- For C=E₁∪E₂ meeting at one node, t̄(C)=[E₁×E₂] in A₂.
- For a rational curve with two self-nodes, t̄(C) is the unique A₀ point in A₂^min.
- For two fixed genus≥2 components joined at a node, varying one attaching point changes the stable curve through infinitely many classes while t̄ stays constant.
- The same normalization/torus formula is required in characteristic 2; an extension proved only in characteristic zero, such as [the compactified torelli and hodge comparison](#64-the-compactified-torelli-and-hodge-comparison), does not suffice.
- At a stable curve not of compact type the whole semiabelian Jacobian is not an abelian variety; only its abelian part gives the point of A_g^min.

([mc6-fc1990](#references), IV Proposition 5.1, Remark 5.3, Theorem 5.7, pp. 113–117; V Theorem 2.3, pp. 150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension and Hodge comparison independent of a chosen cone is part of gap:minimal-siegel-all-characteristics, not a statement of these theorems.; [knudsen3](#references), §6, printed pp. 210–211 (PDF11–12). Characteristic-zero map from a finite stable-family cover to the Satake compactification and identification of a positive Hodge power. It alone does not prove the all-characteristic target.; [yuan-author-http](#references), §3.4, p. 56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.)

*Needs:* gap:minimal-siegel-all-characteristics, SchemeAndStackFoundations §1.23, ShimuraCompactifications §§7.13–7.17, [the compactified torelli and hodge comparison](#64-the-compactified-torelli-and-hodge-comparison), [full-level torelli by the relative jacobian](#612-full-level-torelli-by-the-relative-jacobian), [stable picard and hodge comparison along a moduli atlas](#615-stable-picard-and-hodge-comparison-along-a-moduli-atlas), [the abelian part of a stable jacobian](#616-the-abelian-part-of-a-stable-jacobian), SchemeAndStackFoundations §4.15, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks).

### 6.18 Stable Hodge as a minimal Hodge pullback

Over the field k of [compactified torelli in every characteristic](#617-compactified-torelli-in-every-characteristic), let q:M̄_g→M̄_g^coarse and λ=det(f_*ω). There exist m>0 and an ample invertible sheaf A on A_g^min such that (t̄_g∘q)*A≅λ^⊗m canonically with the semiabelian Hodge comparison. Equivalently, λ descends as a rational line λ_coarse with λ_coarse=t̄_g*ω_min and ω_min ample as a rational line. For every stable family over a projective k-scheme X this yields λ_X^⊗m≅h_X*A; the comparison survives nonreduced test pullback. The power absorbs stabilizer actions and toric determinant signs.

Here A and m are chosen compatibly from the Siegel minimal Hodge-power theorem; the unlevelled coarse Hodge line need not itself descend integrally. Use the rank-g semiabelian invariant-differential determinant across the boundary, not the smaller-rank abelian-part differential determinant.

One proof uses the following inputs and comparisons. Use the all-characteristic Siegel minimal ample power of gap:minimal-siegel-all-characteristics and its pullback identification on semiabelian normal bases. Compare this semiabelian Hodge line with the stable Hodge line by [stable picard and hodge comparison along a moduli atlas](#615-stable-picard-and-hodge-comparison-along-a-moduli-atlas). Glue the canonical positive-power isomorphisms on overlaps and factor the target morphism through the coarse space. This directly supplies a descending power of λ, without an unsupported wild coarse-line descent assertion. For a family pull back the stack equality. Rationalize the line group only after the positive-power statement, with coherent determinant base change.

At an irreducible nodal genus 2 curve the rank 2 semiabelian determinant is used although the abelian quotient has dimension 1. For two components of genera g₁,g₂ the determinant symmetry contains (−1)^(g₁g₂); a suitable positive power absorbs this sign on coarse descent. For a family over dual numbers the equality is an invertible-sheaf isomorphism pulled back from the stack, not a numerical equality of degrees.

([mc6-fc1990](#references), IV Proposition 5.1, Remark 5.3, Theorem 5.7, pp. 113–117; V Theorem 2.3, pp. 150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension and Hodge comparison independent of a chosen cone is part of gap:minimal-siegel-all-characteristics, not a statement of these theorems.; [knudsen3](#references), §6, printed pp. 210–211 (PDF11–12). Characteristic-zero map from a finite stable-family cover to the Satake compactification and identification of a positive Hodge power. It alone does not prove the all-characteristic target.; [yuan-author-http](#references), §3.4, p. 56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.)

*Needs:* gap:minimal-siegel-all-characteristics, ShimuraCompactifications §§7.13–7.17, JacobianChallengePartII §§6.1–6.3, [compactified torelli in every characteristic](#617-compactified-torelli-in-every-characteristic), [stable picard and hodge comparison along a moduli atlas](#615-stable-picard-and-hodge-comparison-along-a-moduli-atlas), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5.

### 6.19 Generic finiteness of the extended Torelli classifying map

Let k be algebraically closed, X normal integral projective over k, and C→X a stable genus-g family, g≥2, smooth over a dense open U. If U→M_g^coarse has maximal variation in the sense of [maximal variation of a curve family](#61-maximal-variation-of-a-curve-family), the composite h:X→M̄_g^coarse→A_g^min is generically finite onto its reduced integral image Z. The finite field extension K(X)/K(Z) need not be separable. No global finiteness of h or t̄ is required.

The classifying map is to coarse curve moduli; adding a level is not part of maximal variation. X is integral and U is dense and nonempty; a dimension-zero X is permitted.

One proof uses the following inputs and comparisons. Unlevelled strong Torelli gives finite geometric fibres on the smooth locus; this follows from the same JacobianChallengePartII §§1.1–1.4 supplier used in [the sign ambiguity in geometric torelli fibres](#614-the-sign-ambiguity-in-geometric-torelli-fibres) after forgetting level. Compose the generically quasi-finite U classifying map with this quasi-finite smooth Torelli map. The image of U is dense in h(X), so the resulting dominant map to Z has finite generic residue-field extension. Retain the full inseparable degree. Positive-dimensional boundary fibres of t̄ do not change the generic calculation.

An isotrivial family over a positive-dimensional X fails maximal variation; its constant h is not generically finite. A generically finite purely inseparable base change of a maximal-variation family stays in range; no generic étaleness test is imposed. For X a point the image dimension is 0 and the finite field extension condition holds.

([yuan-author-http](#references), §3.4, p. 56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.; [milne](#references), Theorem 12.1, pp. 38–39. Strong Torelli implies finiteness of smooth geometric fibres; no properness theorem is supplied.)

*Needs:* gap:numerical-nef-big-transfer, [maximal variation of a curve family](#61-maximal-variation-of-a-curve-family), [the sign ambiguity in geometric torelli fibres](#614-the-sign-ambiguity-in-geometric-torelli-fibres), [compactified torelli in every characteristic](#617-compactified-torelli-in-every-characteristic), [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks).

### 6.20 Nefness and bigness of the Hodge line under maximal variation

For the family over X in [generic finiteness of the extended torelli classifying map](#619-generic-finiteness-of-the-extended-torelli-classifying-map), λ_X=det f_*ω is nef and big. Choose m,A from [stable hodge as a minimal hodge pullback](#618-stable-hodge-as-a-minimal-hodge-pullback), let d=dim X, Z=h(X)_red and e=[K(X):K(Z)]. Then deg_X(c₁(λ_X^⊗m)^d)=e·deg_Z(c₁(A|Z)^d)>0. Nefness follows by curve degrees; the nef-and-positive-top-intersection criterion gives bigness, and positive powers detect both properties.

Here k algebraically closed; X normal integral projective, stable genus g≥2, smooth over a dense maximal-variation open. Big means the imported section-growth convention, and nef means nonnegative degree on every integral curve. These are generic SchemeAndStackFoundations §§5.1–5.10 notions, not new definitions.

One proof uses the following inputs and comparisons. Use λ_X^m≅h*A. The pullback theorem of gap:numerical-nef-big-transfer makes it nef. Projective h is generically finite onto integral Z, so weighted cycle pushforward gives h_*[X]=e[Z]. Apply the Chern projection formula d times and the degree map, including inseparable e. The ample restriction A|Z has positive top degree, including the degree convention in dimension 0. Apply gap:numerical-nef-big-transfer and invariance under positive power.

On a positive-dimensional constant family λ_X is a constant line and has zero top degree, so omitting maximal variation would fail. On an integral projective base curve the formula is deg λ_X^m=e deg A|Z>0. For d=0 the degree is positive and a line is big by constant section growth; no positive-dimension assumption is inserted.

([yuan-author-http](#references), §3.4, p. 56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.)

*Needs:* gap:numerical-nef-big-transfer, SchemeAndStackFoundations §§5.1–5.10, SchemeAndStackFoundations §5.2, SchemeAndStackFoundations §3.3, [generic finiteness of the extended torelli classifying map](#619-generic-finiteness-of-the-extended-torelli-classifying-map), [stable hodge as a minimal hodge pullback](#618-stable-hodge-as-a-minimal-hodge-pullback).

### 6.21 Hodge positivity descends from a finite cover

Let p:Y→X be a finite surjective morphism of normal integral projective schemes over an arbitrary field k, and C→X a stable genus-g family g≥2. Put λ_X=det f_*ω and λ_Y for its pulled-back family. Canonically λ_Y≅p*λ_X. Consequently λ_X is nef if and only if λ_Y is nef, and, when these lines are nef, λ_X is big if and only if λ_Y is big. This applies when Y is a normal stable-family cover or a constructed finite normalization; flatness and separability of p are unnecessary.

Both schemes are projective over the same k; p is finite and surjective, not just dominant on an open. The bigness equivalence here is stated for nef lines and uses top intersection, avoiding a stronger unproved general section-growth descent assertion.

One proof uses the following inputs and comparisons. Use arbitrary base change for the Hodge bundle and coherent determinant pullback to identify λ_Y. For curves use a component of the finite preimage dominating each integral curve of X; degree scales by its positive field degree. This proves nef descent, and the same projection argument proves ascent. For d=dim X use deg_Y(c₁(p*λ_X)^d)=[K(Y):K(X)]deg_X(c₁(λ_X)^d). Apply the nef/big criterion in both directions.

For relative Frobenius `F_{Y/k}:Y→Y^(p)` on a smooth geometrically integral projective k-curve in characteristic p, pull a stable family on X=Y^(p) back to Y. This finite k-morphism has degree p, so deg λ_Y=p·deg λ_X; an étale-only proof fails. Absolute Frobenius need not be a k-morphism. For a finite nonflat cover of a singular normal projective base over k, the equality uses the full generic field degree; no flat pullback of Chow cycles is assumed. A positive-dimensional constant family stays nonbig under any finite surjective cover; a cover cannot manufacture maximal variation.

([yuan-author-http](#references), §3.4, argument following Remark 3.9, pp. 55–56. Finite-cover reductions in the geometric argument and the subsequent Hodge positivity argument; the general numerical transfer belongs to SchemeAndStackFoundations §§5.1–5.10.)

*Needs:* gap:numerical-nef-big-transfer, SchemeAndStackFoundations §5.2, SchemeAndStackFoundations §§5.1–5.10, SchemeAndStackFoundations §3.3, [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5.

### 6.22 Hodge positivity over an arbitrary field

Let k be any field, X a normal integral projective k-scheme, and f:C→X a stable genus-g family, g≥2, smooth over a dense open U. If U→M_g^coarse is generically quasi-finite onto its image, then λ_X=det f_*ω is nef and big. No perfectness or geometric-integrality assumption on k or X is imposed. The conclusion is geometric positivity of this line, not arithmetic bigness over Spec Z.

Normality is that of X itself; X over an algebraic closure may be nonreduced or reducible. Use the arbitrary-field numerical/base-extension and reduced-component comparison of gap:numerical-nef-big-transfer.

One proof uses the following inputs and comparisons. Extend to an algebraic closure k̄. For each integral component Z of (X_k̄)_red take its finite normalization Y. The Y are normal integral projective k̄-schemes; pull back the stable family and its Hodge line. The smooth dense open and generic quasi-finiteness persist on these components. Use the permitted flat field-base-change comparison for coarse spaces, not arbitrary nonflat coarse base change. Apply [nefness and bigness of the hodge line under maximal variation](#620-nefness-and-bigness-of-the-hodge-line-under-maximal-variation) to each Y. Use gap:numerical-nef-big-transfer for component/reduction/normalization detection of nefness and positivity of top intersection, and flat field-extension invariance, to descend to X. Nonreduced geometric base change is treated with its generic multiplicities, not declared integral. Apply the nef/big numerical criterion on the original integral X.

In characteristic p, X may have a finite purely inseparable field of constants over k. Its geometric base change can be nonreduced; the theorem still applies after reduction and normalization, with positive generic multiplicities. A geometrically disconnected smooth projective X over a nonclosed k is treated componentwise after k̄, not by choosing just one component. A constant positive-dimensional family is excluded by maximal variation even after extending k.

([yuan-author-http](#references), §3.4, argument following Remark 3.9, pp. 55–56, geometric Hodge-positivity argument. The minimal-Torelli pullback supplies the geometric positivity argument. Extension to an arbitrary field uses the field-extension and component detection of gap:numerical-nef-big-transfer.)

*Needs:* gap:numerical-nef-big-transfer, SchemeAndStackFoundations §§0.20–0.21, SchemeAndStackFoundations §§5.1–5.10, [maximal variation of a curve family](#61-maximal-variation-of-a-curve-family), [nefness and bigness of the hodge line under maximal variation](#620-nefness-and-bigness-of-the-hodge-line-under-maximal-variation), [hodge positivity descends from a finite cover](#621-hodge-positivity-descends-from-a-finite-cover), [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks), [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5.

### Examples

The constant family C₀×𝔸¹ must compactify a one-dimensional base even though its moduli image is a point. A quadratic twist with generic isomorphism field L of degree two requires normalization in L, rather than in the image field. On a positive-dimensional isotrivial projective base λ is numerically trivial and is not big; on a point the dimension-zero bigness convention is satisfied.

### Dependencies

Layers 4–5; JacobianChallengePartII §§1.1–1.4 and 6.1–6.3; NeronModelsAndSemistableAbelianVarieties §§4.1 and 4.13; PELModuli §§M5.1–M5.3, M6.9–M6.10; ShimuraCompactifications §§6.1–6.7, 6.10 and 7.13–7.17. The all-characteristic principal Siegel supplier contract is needed for compactified Torelli and its positivity application.

## Layer 7: level Picard parameters and consumer interfaces

### 7.1 The degree-d level Picard parameter functor

For g≥2, N≥3 invertible with a fixed ζ_N pairing component, and d∈Z, define `P_g,N^d=Pic^d_{C_g/M_g[N]}` on the fppf site. This represented smooth quasi-projective degree-d sheaf is a torsor under the relative Jacobian, parametrizing sheafified relative line classes on the universal smooth curve. An algebraically closed field point corresponds to an isomorphism class of triples (C,α,L). For a general T→M_g[N], lifting a sheaf point to an actual degree-d line bundle is controlled by the boundary to H²_fppf(T,G_m); when it vanishes, the line-bundle isomorphism classes lifting that point form a torsor under Pic(T) by base pullback. The triple groupoid and this sheaf are distinct.

Here g≥2, N≥3 invertible and d an arbitrary integer; the fixed pairing component is over Z[1/N,ζ_N]. The universal curve lies over the Noetherian fine scheme and is smooth projective with geometrically connected genus-g fibres, so JacobianChallengePartII §§0.1–0.4 representability and torsor statements apply. For every test base T, use `O_T≅(f_T)_*O_{C_T}` universally from the global-functions comparison of StableReduction Layer 3 before applying the exact obstruction and kernel statements.

One proof uses the following inputs and comparisons. Apply JacobianChallengePartII §§0.1–0.4 to the universal curve on its Noetherian fine base. Representability and all arbitrary-base-change identifications use the relative Picard sheaf of AlgebraicModuliForArithmeticGeometry §7.6, not global representatives. Verify the universal global-functions isomorphism for the proper flat smooth geometrically connected family, then apply JacobianChallengePartII §4.4 to every pullback C_T/T. Its exact sequence is `0→Pic(T)→Pic(C_T)→Pic_{C_T/T}(T)→H²_fppf(T,G_m)→H²_fppf(C_T,G_m)`. Restrict the lifting assertion to the degree-d component. Exactness gives existence when the boundary vanishes and the Pic(T)-torsor of lifts, using injectivity of base pullback. A chosen curve section kills the boundary and permits the section-splitting rigidification of AlgebraicModuliForArithmeticGeometry §7.6.1a; no section of the unpointed universal curve is assumed. Over algebraically closed k, choose an fppf-local actual line representative. A nonempty finite-type open of the covering scheme has a k-point, whose pullback supplies an actual line on C_k; thus the boundary of every relative point vanishes. Pic(k)=0 makes the lift class unique. Full-level rigidity controls the curve-level isomorphism; scalar line automorphisms survive in the groupoid. Use JacobianChallengePartII §§6.1–6.3 on a constant smooth genus-two family over C for the dual-number test, together with the exact arbitrary-pullback Picard comparison.

The Picard parameter is a sheaf of classes, not the automorphism groupoid of line bundles.

The construction has the following API.

- The fibre over a smooth curve-level point is its degree-d Picard scheme.
- Picᵈ is a torsor under the relative Jacobian; there need not be a canonical origin.
- For p∈P^d(T) the Leray boundary δ(p)∈H²_fppf(T,G_m) vanishes exactly when an actual degree-d line bundle on C_T represents p, under `O_T≅(f_T)_*O_{C_T}` universally. The cohomological group is not identified with Azumaya classes without an additional theorem.
- Over any T→M_g[N], pullback of P_g,N^d represents the fppf degree-d Picard sheaf of C_T/T, with canonical identity/composition comparisons; no universal line is inferred.
- Tensor product gives `P^d×_{M_g[N]}P^e→P^{d+e}`; O is the degree-zero unit and dualization `P^d→P^{−d}` gives the inverse. The degree-zero action on P^d is the stated Jacobian torsor action.
- If δ(p)=0, tensoring any lift L by f_T*M identifies the set of line-bundle isomorphism classes lifting p with a Pic(T)-torsor. Two lifts differ by a unique base line-bundle class. For a field Pic(T)=0 this set is a singleton; general bases need not have that uniqueness.

**Checks.**

- For d=0 the relative Picard component is the Jacobian with its canonical origin.
- A chosen section permits rigidification and a Poincaré line; the unpointed universal family is not assumed to have that section.
- The groupoid of triples has G_m scalar automorphisms of L; it cannot be identified with the represented Picard sheaf as a groupoid.
- The dualizing line of the universal smooth curve determines a canonical section of `P^{2g−2}`; a canonical section of P¹ is not inferred from full level alone.
- Take T=P¹_C, a constant smooth genus-two curve C with fixed symplectic level 3, and any degree-d line L on C. The lines pr_C*L and pr_C*L⊗pr_T*O(1) are distinct on C×T, as restriction along a C-point distinguishes them, but give the same point of the relative degree-d Picard sheaf. This rejects a parameter functor of unquotiented global line classes.
- For a fixed smooth genus-two curve over C with symplectic level 3 and degree-d line L, first-order relative Picard deformations over C[ε]/(ε²) reducing to [L] form a torsor under H¹(C,O_C), a two-dimensional C-vector space. The constant lift chooses an origin. This rejects a functor keeping only reduced geometric points.

([yuan-author-http](#references), §4.3.2, printed/PDF pp. 73–75; representability and geometric triples, pp. 74–75; [blr-relative-picard-LwkQQl](#references), §9.3 Theorem 1 and proof p. 252; §8.1 Leray discussion p. 203 and Proposition 4 pp. 204–205.)

*Needs:* [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), JacobianChallengePartII §§0.1–0.4, JacobianChallengePartII §4.4, JacobianChallengePartII §§6.1–6.3, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, StableReduction Layer 3, [rigidity of full curve level](#44-rigidity-of-full-curve-level).

### 7.2 Universal global functions for the level family

Let f:C→M be the universal smooth projective genus-g curve on the fixed symplectic level component M=M_g[N] over B=Spec Z[1/N,ζ_N]. For every scheme T→M, including non-Noetherian and nonreduced T, the canonical unit `O_T→(f_T)_*O_{C_T}` is an isomorphism. The identifications for identity and composite base changes agree with the structure-sheaf pullback maps. In particular Γ(C_T,O)^×=Γ(T,O)^× canonically.

Here g≥2, N≥3; N invertible and a primitive ζ_N fixed. f is the smooth projective universal family supplied by [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme); its geometric fibres are connected.

One proof uses the following inputs and comparisons. Apply the imported universal-functions statement for prestable curves, or its independent proper-flat-finite-presentation criterion in Stacks Lemma 36.32.6. Smooth connected geometric curve fibres are geometrically reduced and connected. The criterion has no Noetherian-base assumption: its proof uses perfect proper-flat cohomology (Lemma 36.32.5) and H⁰(C_s,O)=κ(s) for geometrically reduced connected proper fibres (Lemma 33.9.3(7)). Its conclusion quantifies over all base changes, so it does not merely compare closed fibres. All maps are the canonical units; naturality of the unit and uniqueness of inverses give identity/composition coherence. Take global sections and units.

Specialize to T with nilpotents and to a non-Noetherian affine scheme without adding reducedness or local-Noetherianity. For a geometrically disconnected proper family the conclusion can fail: two copies of T give O_T×O_T; connectedness is essential.

([mc0-stacks-perfect](#references), Lemma 36.32.6 (0E0L); Lemma 36.32.5 (0E62); [stacks-varieties](#references), Lemma 33.9.3(7) (0BUG), stacks-varieties line 903. The all-base-change unit isomorphism follows from proper flat finite presentation and geometrically reduced connected fibres.; StableReduction Layer 3, prestable families. StableReduction Layer 3 includes universal global functions for prestable families; this target applies it to the level family.)

*Needs:* StableReduction Layer 3, [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [genus and cohomology over arbitrary bases](#02-genus-and-cohomology-over-arbitrary-bases).

### 7.3 All-base comparison for degree-Picard parameters

For f:C→M as above and d∈Z, let P=P^d be the degree-d scheme of [the degree-d level picard parameter functor](#71-the-degree-d-level-picard-parameter-functor) and J=P^0. On the big fppf site Sch/M, h_P is naturally the degree-d subsheaf of a_fppf(T↦Pic(C_T)). This is also the sheafification of Pic(C_T)/f_T*Pic(T), with the degree condition imposed on every geometric fibre. P is smooth separated quasi-projective over M, J acts by tensor, and (a,x)↦(x,a·x) identifies J×_M P with P×_M P. Difference is δ(x,y)=y⊗x⁻¹. All these comparisons and actions commute with arbitrary base change, including identity/composition coherence. They make no assertion that P(T) is the pointwise quotient of globally defined line bundles.

Same fixed-component hypotheses as [universal global functions for the level family](#72-universal-global-functions-for-the-level-family); d is a fixed integer. The Noetherian scheme M and its projective smooth connected family satisfy the exact JacobianChallengePartII §§0.1–0.4 representability hypotheses. Degree d is imposed on all components of T; variable locally constant degree belongs to the full disjoint union of components.

One proof uses the following inputs and comparisons. Apply the JacobianChallengePartII §§0.1–0.4 degree and representability statements to the Noetherian base M. For their proof route, Bosch–Lütkebohmert–Raynaud 9.3/1 reduces to 8.2/1, 8.2/5 and 8.4/2; the quotient by a proper flat equivalence relation in that route is gap:proper-flat-picard-quotient, and the Hilbert and divisor inputs are imported with JacobianChallengePartII §§0.1–0.4. AlgebraicModuliForArithmeticGeometry §7.6 gives the two sheafification descriptions and its arbitrary-base-change theorem. A base-changed representing object represents the restricted sheaf by Yoneda, so arbitrary T does not require a new representability theorem over non-Noetherian bases. For the JacobianChallengePartII §§0.1–0.4 torsor, the smooth surjection C→M is an fppf cover and its pullback family has the diagonal section. Its divisor d·Γ (inverse tensor powers for d<0) gives a local degree-d origin. Tensor/difference yield the displayed isomorphism locally; equality and inverses descend in the represented sheaves. Transfer the defined tensor, inverse and pullback coherence through representability. Fix the orientation δ(x,y)=y−x so the torsor identity is δ(x,a·x)=a.

P^0 has its canonical zero, while P^1 has no chosen origin from this construction. A canonical class of degree 2g−2 does not choose a degree-one class. On T=T₀⊔T₁ a class of degrees 0 and 1 is not a P^d(T)-point for any single d. Base change of the action/difference square agrees for two successive morphisms and on dual numbers.

([blr-relative-picard-LwkQQl](#references), §9.3 Theorem 1 p. 252, proof citing 8.2/1, 8.2/5 and 8.4/2; §9.2 Corollary 13 p. 251. The existing curve Picard theorem supplies represented degree components and their torsor structure.; [yuan-author-http](#references), §4.3.2 pp. 74–75. The degree pieces are used as relative parameters; this comparison specifies their sheaf meaning on general bases.; [dgh](#references), §6.1 printed/PDF pp. 23–24, relative Picard and Pic¹ discussion. DGH uses represented degree pieces and their difference map on the universal fine-level family; this is a second consumer of the relative sheaf comparison.)

*Needs:* gap:proper-flat-picard-quotient, JacobianChallengePartII §§0.1–0.4, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, `AlgebraicGeometry.Scheme.fppfTopology`, `CategoryTheory.Sheaf`, `CategoryTheory.GrothendieckTopology.yonedaEquiv`, [the degree-d level picard parameter functor](#71-the-degree-d-level-picard-parameter-functor), [universal global functions for the level family](#72-universal-global-functions-for-the-level-family).

### 7.4 Actual triples and their class morphism

For a B-scheme T let Trip^d_N(T) be the groupoid of triples (f_T:X→T,η,L): X/T is a smooth projective geometrically connected genus-g curve, η is the fixed-pairing full level N on its Jacobian, and L is an invertible O_X-module of degree d on every geometric fibre. A morphism (X,η,L)→(X′,η′,L′) is a T-isomorphism u:X≅X′ preserving η together with an isomorphism L≅u*L′. Pullback makes a category fibred in groupoids, with its actual tensor/pullback coherence. The functor forgetting L takes values in the fine level moduli groupoid, which is equivalent to the discrete sheaf h_M; sending L to its relative class gives a morphism of fppf stacks q:Trip^d_N→h_P. The fixed-curve fibre is the degree-d full subgroupoid of Core(InvertibleSheaf X), not the full category of module maps and not its set of isomorphism classes.

Here g≥2,N≥3, chosen ζ_N and exact pairing component; d∈Z. All morphisms of line bundles in this groupoid are isomorphisms. Fineness/rigidity of the level curve is imported, not postulated for arbitrary unlevelled curves.

One proof uses the following inputs and comparisons. Use the fine curve/level groupoid of [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme). Attach native invertible sheaves and invertible module maps by the existing line-bundle stack, retaining scalar automorphisms. Compose isomorphisms with the canonical pullback-composition isomorphism. Pullback of a triple uses the actual cartesian square and the line-bundle pullback of AlgebraicVectorBundles L0A–L0C. Degree descent is JacobianChallengePartII §§0.1–0.4 through the sheaf comparison. Curve-family and level descent are those of Layer 4; invertible-module descent is AlgebraicModuliForArithmeticGeometry §§3.1–3.5/SchemeAndStackFoundations §§1.18–1.23. The class map q is compatible with these data, since relative Picard classes are functorial. On a fixed X identify the groupoid with the core of the degree-d subcategory; equality of native LineBundleClass is only existence of an isomorphism. No claim that the core itself is discrete follows.

Comparison with h_P is a stack morphism with groupoid-valued source and discrete target; no equivalence is asserted on T.

The construction has the following API.

- For a:T′→T, pull back the curve, level and invertible sheaf; the canonical identity and composite isomorphisms satisfy their cocycle constraints.
- An arrow consists exactly of a level-preserving curve isomorphism and an isomorphism of the pulled-back invertible sheaves.
- q is a cartesian/fppf stack morphism to the discrete represented sheaf h_P and commutes with arbitrary pullback.
- Fixing a level curve identifies its line-bundle fibre with the degree-d part of the native core; the absolute class comparison agrees with LineBundleClass.mk.
- Every automorphism of a triple is scalar multiplication by a unique unit of Γ(T,O_T), by level rigidity and [universal global functions for the level family](#72-universal-global-functions-for-the-level-family).
- Tensor gives `Trip^d×_{h_M}Trip^e→Trip^{d+e}`; its image under q is the represented relative tensor law.

**Checks.**

- Over an algebraically closed field k and a level curve, a fixed L has automorphism group k×. For k=C this group is nontrivial although the corresponding h_P-point has trivial inertia.
- For a fixed level genus-two curve C/C, T=P¹_C and L_T the pullback of a degree-d line bundle L on C, L_T and L_T⊗f_T*O_T(1) are distinct isomorphism classes of triples with the same q-image. Restriction to a constant point of C proves distinctness.
- The zero endomorphism of an invertible sheaf on a nonempty curve is a morphism in the native full module subcategory but is not an arrow of Trip^d_N.
- At a fixed curve the class of L⊗K agrees with multiplication in the pinned LineBundleClass commutative group. On ℙ¹, the classes of O(1) and O(−1) multiply to the identity: 1+(−1)=0 in Pic(ℙ¹)=ℤ, using `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk`.

([blr-relative-picard-LwkQQl](#references), §8.1 pp. 203–205, Picard functor and rigidification discussion. Relative classes forget line-bundle automorphisms and base twists.; [stacks-moduli-stacks](#references), Moduli Stacks, Lemma 9.1 (tag 0DME). The Picard stack maps to its sheaf of classes with local lifts and local isomorphisms.; [yuan-author-http](#references), §4.3.2 pp. 73–75. The triples motivating the parameter space contain actual line bundles; the geometric-field qualification must be preserved.)

*Needs:* SchemeAndStackFoundations §1.21, AlgebraicModuliForArithmeticGeometry §§3.1–3.5, `CategoryTheory.Core`, `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `TauCeti.AlgebraicGeometry.LineBundleClass`, `TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`, `TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct`, JacobianChallenge Layer A, [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [rigidity of full curve level](#44-rigidity-of-full-curve-level), [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), [all-base comparison for degree-picard parameters](#73-all-base-comparison-for-degree-picard-parameters).

### 7.5 The groupoid of lifts of a relative class

For T→M and p∈P^d(T), define Lift_T(p) as the fibre of q over p: objects are actual invertible sheaves L on C_T whose relative class is p, and arrows are invertible sheaf isomorphisms. Its restriction to Sch/T is fppf locally nonempty and any two objects are fppf locally isomorphic; the automorphism sheaf of any object is canonically G_m,T. Thus it is the G_m-banded gerbe of lifts, with pullback `Lift_T(p)|_{T′}≃Lift_{T′}(p|_{T′})`. This description asserts the local properties directly and needs no general classification of gerbes by H².

The fixed level family and degree-d component of §§7.1–7.4. p is a sheaf point; existence of a global lift is not a hypothesis.

One proof uses the following inputs and comparisons. Use the fixed level-family identification to take the genuine groupoid fibre of q, not the fibre of a purported bijection of sets. Sheafification provides an fppf cover on which p is represented by a line bundle. Equality of two sheafified classes gives local equality of absolute isomorphism classes after refinement, hence local line-bundle isomorphisms. The automorphism sheaf of a line bundle on C_U is Γ(C_U,O)^× for every U/T; [universal global functions for the level family](#72-universal-global-functions-for-the-level-family) identifies this with Γ(U,O)^×, compatibly with restriction. Pullback of line bundles, their isomorphisms and the relative class furnishes the cartesian equivalence with its identity/composition constraints.

A nonempty fibre can have many global isomorphism classes and nontrivial inertia; neither property contradicts local isomorphism. No global Poincaré line bundle is inferred from local nonemptiness.

The construction has the following API.

- An object over U/T is an actual L on C_U together with equality of its relative class with p|_U.
- Every p has lifts on an fppf cover; any pair of local lifts becomes isomorphic after a further fppf cover.
- For any lift L over U, its automorphism sheaf on Sch/U is G_m,U, naturally in U.
- Restriction along T′→T is equivalent to `Lift_{T′}(p|_{T′})`; equivalences respect identities and composite pullbacks.

**Checks.**

- For algebraically closed k the fibre has an object, every two objects are isomorphic, and its scalar automorphism group is k×; it is equivalent to BG_m(k), not a discrete singleton.
- A section σ:T→C_T gives each p a normalized lift L_norm with σ*L_norm≅O_T, unique up to unique rigidification-preserving isomorphism. Every unnormalized lift is isomorphic to L_norm⊗f_T*N for some base line bundle N. For the constant family over P¹_C, N=O(1) gives a lift not isomorphic to L_norm, although their relative classes agree.
- Over P¹_C, the nonisomorphic lifts differing by O(1) become isomorphic over the standard affine trivializing cover. This tests local isomorphism without global uniqueness.

([stacks-moduli-stacks](#references), Moduli Stacks, Lemma 9.1 (tag 0DME), proof of local nonemptiness and local isomorphism. The gerbe property follows from the definition of the sheafified Picard functor.; [blr-relative-picard-LwkQQl](#references), §8.1 Proposition 4 and rigidification discussion pp. 204–205. Scalars and descent account for the distinction between a relative class and an actual line bundle.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, SchemeAndStackFoundations §1.21, [actual triples and their class morphism](#74-actual-triples-and-their-class-morphism), [universal global functions for the level family](#72-universal-global-functions-for-the-level-family).

### 7.6 The obstruction to a global line-bundle lift

For every T→M there is the functorial exact sequence `0→Pic(T)→Pic(C_T)→Pic_{C_T/T}(T)→H²_fppf(T,G_m)→H²_fppf(C_T,G_m)`. Its boundary β_T is the Leray differential `d₂^{0,1}` after identifying `f_{T,*}G_m=G_m`. For p∈P^d(T), β_T(p)=0 if and only if Lift_T(p) has a global object. Pullback carries β_T(p) to `β_{T′}(p|_{T′})`. The target is cohomological H², without any identification with Azumaya classes. A section of C_T/T makes β_T zero by the imported splitting; no section of the relative Jacobian is treated as a section of C_T.

Arbitrary T→M; the global-functions isomorphism of [universal global functions for the level family](#72-universal-global-functions-for-the-level-family) holds universally for f_T. Pic means actual line bundles up to isomorphism; the relative Picard term is the fppf sheaf, not a pointwise quotient.

One proof uses the following inputs and comparisons. Use the general proper-flat/universal-functions clause of JacobianChallengePartII §4.4. The other clauses concerning Pic⁰(J) and autoduality are not prerequisites of this specialization. Identify f_*G_m with G_m as sheaves on the big fppf base site, using the universal unit isomorphism on every U/T. Identify H¹(G_m) with the Picard group via SchemeAndStackFoundations §§1.18–1.23. Read the low-degree Leray sequence with R¹f_*G_m the relative Picard sheaf. Its transgression gives the boundary and its naturality. AlgebraicModuliForArithmeticGeometry §7.6 supplies exactness/injectivity at the earlier terms. Exactness at the relative Picard term says precisely that p is the class of an actual L. This is global nonemptiness of Lift_T(p), not a chosen lift. For a section use the section splitting of AlgebraicModuliForArithmeticGeometry §7.6.1a.

State every sheaf and cohomology site in the exact sequence and check naturality for arbitrary T′→T. Zero obstruction yields existence, not a canonical bundle or a trivial automorphism group. The specialization does not import JacobianChallengePartII §4.4 autoduality or a section of a Jacobian as a curve section.

([blr-relative-picard-LwkQQl](#references), §8.1 Proposition 4 pp. 204–205 and preceding Leray sequence p. 203. The obstruction is the low-degree cohomological boundary under universal global functions.)

*Needs:* JacobianChallengePartII §4.4, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, SchemeAndStackFoundations §§1.15, 2.3, SchemeAndStackFoundations §2.2, SchemeAndStackFoundations §2.11, [universal global functions for the level family](#72-universal-global-functions-for-the-level-family), [all-base comparison for degree-picard parameters](#73-all-base-comparison-for-degree-picard-parameters), [the groupoid of lifts of a relative class](#75-the-groupoid-of-lifts-of-a-relative-class).

### 7.7 Picard torsor of global lifts

For p∈P^d(T), let LiftClasses_T(p)={a∈Pic(C_T): a maps to p}. This is the set of isomorphism classes of Lift_T(p). Pic(T) acts by n·a=a⊗f_T*n. The action is free, and for any a,b in the fibre there is a unique n with n·a=b. Therefore the fibre is empty exactly when β_T(p)≠0; when β_T(p)=0 it is a Pic(T)-torsor, with no chosen origin. A chosen actual lift L₀ gives a groupoid equivalence Lines(T)→Lift_T(p), N↦L₀⊗f_T*N, as well as a Pic(T)-equivariant bijection Pic(T)→LiftClasses_T(p). These statements are natural for pullback of a specified L₀. Lines(T) means the groupoid Core(InvertibleSheaf T).

Arbitrary T→M, p∈P^d(T). The torsor assertion includes nonemptiness precisely under β_T(p)=0; the unpointed fibre is not made into a group.

One proof uses the following inputs and comparisons. Tensor by a pullback line bundle does not change the sheafified relative class, so it defines the action. The kernel theorem gives injectivity of f_T*:Pic(T)→Pic(C_T), hence freeness. For two classes a,b in the fibre, b⊗a⁻¹ lies in the kernel. AlgebraicModuliForArithmeticGeometry §7.6 identifies it with a unique class from Pic(T), giving transitivity and the unique difference in the stated orientation. For a chosen L₀, tensor/pullback gives the displayed functor on actual line bundles. Essential surjectivity follows from the same kernel descent. Full faithfulness uses descent of homomorphisms between pullback invertible sheaves: locally trivialize N,N′ and apply O_T≅f_*O_C; the Hom sheaves and their invertible sections then agree. Tensor associativity, pullback monoidality and their coherence are those of AlgebraicVectorBundles L0A–L0C. They give equivariance, the change-of-origin translation formula, and compatibility with successive base changes.

Do not confuse this Pic(T)-torsor of lifts with the J_T-torsor P^d_T of relative degree-d classes. A global lift changes the entire groupoid to Lines(T), not to a discrete copy of Pic(T).

The construction has the following API.

- n∈Pic(T) acts by tensor with f_T*n, with unit/associativity and degree preservation.
- For a,b in one fibre there is exactly one n∈Pic(T) such that b=a⊗f_T*n.
- LiftClasses_T(p) is nonempty if and only if β_T(p)=0.
- A specified lift L₀ identifies Pic(T) equivariantly with LiftClasses_T(p); the origin maps satisfy `Φ_{L₀⊗f_T*N}([M])=Φ_{L₀}([N]+[M])`, so a fixed lift has new coordinate equal to its old coordinate minus [N].
- A specified L₀ gives Lines(T)≃Lift_T(p), naturally on every U/T, preserving the G_m-band.
- Pullback gives a map of lift fibres equivariant for Pic(T)→Pic(T′); identity and composition agree. A bijection is not asserted for arbitrary base change.
- If σ:T→C_T is given, L↦L⊗f_T*(σ*L)⁻¹ is the section-normalized representative of AlgebraicModuliForArithmeticGeometry §7.6.1a; its σ-rigidification removes the scalar ambiguity.

**Checks.**

- For C/C a fixed level genus-two curve, T=P¹_C and a pullback L₀, the lifts L₀⊗f*O(n) are pairwise nonisomorphic for n∈Z. They all map to one p; the difference between n and m is O(m−n).
- For T=Spec k with k algebraically closed, Pic(T)=0, so the lift-class fibre is a singleton, while the actual lift groupoid has automorphism group k×.
- For the same constant family with a constant section σ, all L₀⊗f*O(n) have the same normalized representative. Their σ-rigidified normalized objects are uniquely isomorphic.
- The theorem is conditional on β=0 for nonemptiness: an empty fibre with β≠0 is never assigned a torsor structure with an inhabited carrier.

([blr-relative-picard-LwkQQl](#references), §8.1 Proposition 4 and rigidification/descent discussion pp. 204–205. Kernel and scalar descent give the ambiguity of a global representative by a line bundle from the base.; [stacks-moduli-stacks](#references), Moduli Stacks, Lemma 9.1 (tag 0DME). Local equality of lifts retains their invertible-sheaf isomorphisms.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, AlgebraicModuliForArithmeticGeometry §§3.1–3.5, SchemeAndStackFoundations §1.21, JacobianChallenge Layer A, [the obstruction to a global line-bundle lift](#76-the-obstruction-to-a-global-line-bundle-lift), [the groupoid of lifts of a relative class](#75-the-groupoid-of-lifts-of-a-relative-class).

### 7.8 Geometric triples and the Picard sheaf

For an algebraically closed field k in which N is invertible, geometric points of P_g,N^d identify with isomorphism classes of triples of a curve, a full level structure and a degree-d line bundle. For general bases retain the fppf sheafification and the obstruction/rigidification distinction; the existence of the parameter scheme does not produce a tautological line on every pulled-back curve.

Here g≥2, N≥3 and d∈Z as in §7.1; k is algebraically closed with N invertible, and the fixed pairing primitive root is part of the level datum. General-base remarks use the universal global-functions statement of §7.2.

One proof uses the following inputs and comparisons. Use the represented degree-d relative sheaf and JacobianChallengePartII §4.4. Over algebraically closed k a local fppf representative lifts to an actual line by choosing a k-point in a nonempty finite-type open of its covering scheme. Hence its Leray boundary vanishes. Pic(k)=0 makes the actual line class unique. This gives the bijection without reconstructing general Brauer cohomology theory here. Use [rigidity of full curve level](#44-rigidity-of-full-curve-level) to identify curve-level representatives uniquely up to their prescribed isomorphism; passage to line-bundle classes removes scalar inertia. For general bases, boundary vanishing only gives existence, and base Picard twists still give multiple actual line classes.

Scalar automorphisms disappear only after passage to classes.

([yuan-author-http](#references), §4.3.2, printed/PDF p. 75, first two paragraphs.)

*Needs:* [the degree-d level picard parameter functor](#71-the-degree-d-level-picard-parameter-functor), [rigidity of full curve level](#44-rigidity-of-full-curve-level), JacobianChallengePartII §4.4, [actual triples and their class morphism](#74-actual-triples-and-their-class-morphism), [the obstruction to a global line-bundle lift](#76-the-obstruction-to-a-global-line-bundle-lift), [picard torsor of global lifts](#77-picard-torsor-of-global-lifts).

### 7.9 Fixed-curve infinitesimal Picard points

Let k be algebraically closed with N invertible, C/k a fixed smooth projective geometrically connected genus-g≥2 curve with fixed full level, and L₀ an actual degree-d line bundle. Put A=k[ε]/(ε²), C_A=C×Spec A. The fibre of P^d_C(A)→P^d_C(k) over [L₀] is canonically, using the constant lift of L₀ as origin, the additive k-vector space H¹(C,O_C), of dimension g. It is also the set of isomorphism classes of pairs (L,φ), where L is a line bundle on C_A and φ:L|_C≅L₀, and arrows respect φ. Each framed object has automorphism group 1+εk≅(k,+). Thus a fixed geometric point can have many infinitesimal lifts even though Pic(Spec A)=0. Curve, level and special-fibre bundle stay fixed; this does not compute the tangent space of the full varying-curve stack.

Algebraically closed k; fixed curve C, fixed level η, actual L₀ and its constant pullback. The JacobianChallengePartII §§6.1–6.3 Lie theorem is applied with integral Noetherian base Spec k, not with nonreduced base Spec A.

One proof uses the following inputs and comparisons. Tensor by the inverse of the constant lift of L₀ identifies the degree-d reduction fibre with the infinitesimal kernel at zero in J_C. Apply JacobianChallengePartII §§6.1–6.3 at Spec k and its dual-number definition of Lie to identify this with H¹(C,O_C). Concretely 1+εO_C is additively O_C and the split reduction sequence of units identifies the kernel of Pic(C_A)→Pic(C) with H¹(C,O_C). Constants lift all units, so a chosen reduction framing does not change the set of isomorphism classes. C has a k-point, giving a constant section over A. The pointed splitting of AlgebraicModuliForArithmeticGeometry §7.6.1a identifies relative classes with absolute classes modulo Pic(A), and Pic(A)=0 because A is local. This relates the actual framed problem to P^d_C(A), without applying an integral-base theorem to Spec A. Framed automorphisms are units reducing to 1: by universal global functions these are exactly 1+εk. Genus gives dim_k H¹(C,O_C)=g by JacobianChallenge Layer B.

For genus 2 the reduction fibre is a two-dimensional k-vector space and is not a singleton. The constant deformation is zero and adding a class means tensoring its infinitesimal line bundle. Changing a reduction framing is absorbable by a constant scalar, but scalar units reducing to 1 remain automorphisms.

([blr-relative-picard-LwkQQl](#references), §8.4 Theorem 1 pp. 231–232. The dual-number unit sequence identifies the Lie algebra of the Picard functor with H¹ of the structure sheaf.; [yuan-author-http](#references), §3.1.3 Lemma 3.4 pp. 43–44. The Lie/cohomology comparison is the algebraic input used for the Hodge comparison, with an integral Noetherian original base.)

*Needs:* JacobianChallengePartII §§6.1–6.3, JacobianChallengePartII §§0.1–0.4, AlgebraicModuliForArithmeticGeometry §§7.2–7.3, 7.6, JacobianChallenge Layer B, [picard torsor of global lifts](#77-picard-torsor-of-global-lifts).

### 7.10 Curve-family export for symplectic L-functions

For each g≥2, the smooth unpointed curve stack M_g and its universal smooth projective family, after base change to Z[1/|G|] for `G=Sp_{2r}(F_ℓ)` as in Abdurrahman–Venkatesh, supply the curve-family base of their §5.1 Hurwitz problem. For every T-point h of that Hurwitz stack, the underlying curve is the pullback of the universal M_g-curve along its forgetful map h→M_g. This identification is cartesian and coherent under arbitrary base change; it retains the category-valued curve automorphisms before any level is added.

Here g≥2 for this unpointed stable-range export. Fix r≥1 and a finite field F_ℓ of odd cardinality, as in the consumer; invert `|Sp_{2r}(F_ℓ)|` on the curve-moduli base. The consumer supplies its own connected-fibre G-cover problem, cyclotomic twist and forgetful morphism.

One proof uses the following inputs and comparisons. Apply the universal property of M_g (SchemeAndStackFoundations §4.15) to the underlying smooth proper curve family in the Hurwitz object. Over a scheme the curve is projective by the genus≥2 canonical-polarization input of SchemeAndStackFoundations §4.15. Base change the universal curve along the consumer forgetful morphism to obtain the same curve over its Hurwitz groupoid. The cartesian equivalence is the classifying-family equivalence, natural on arrows as well as objects. The central deck transformations, connected-cover condition, possible failure of étaleness of the Hurwitz forgetful map, cyclotomic multiplier and symplectic local system are defined by Abdurrahman–Venkatesh and are not part of this roadmap. They are not consequences of the curve fine-level scheme.

Over a test scheme and after a second pullback the classifying curve is canonically the same family. A central deck automorphism in AV Example 5.1 is not removed by replacing the consumer stack with a curve full-level scheme. No assertion of an unmarked genus-one DM stack or étaleness of the Hurwitz map is made.

([av-moduli-consumer-LwkQQl](#references), §§5.1–5.2 pp. 39–41, including Example 5.1. The argument uses a universal curve over a Hurwitz groupoid, with central cover automorphisms still present.)

*Needs:* SchemeAndStackFoundations §4.15, [hilbert quotient presentation](#111-hilbert-quotient-presentation).

### 7.11 Pointed stable-stack export for tautological operations

For all ordered stable pairs (g,n) with 2g−2+n>0, SchemeAndStackFoundations §4.15 supplies the smooth proper Deligne–Mumford stack M̄_g,n/Z of relative dimension 3g−3+n, its dense smooth-curve open M_g,n and universal stable family, relabelling of the n ordered marks, forgetting a mark followed by stabilization, and separating/nonseparating clutching. The normalization of the reduced total boundary is the finite disjoint union of the one-edge vertex-product quotient stacks, retaining the constant finite graph-automorphism groups. After base change to C or to the relevant étale-cohomology base these maps and their coherent compositions are the geometric input of Canning–Larson–Payne §2.1.

Stable pairs, with marks ordered, disjoint and in the smooth locus of each curve. The consumer supplies Chow/cohomology theories, graph invariants and their push-pull formalism.

One proof uses the following inputs and comparisons. Use the definition of SchemeAndStackFoundations §4.15 with ordered marks and its stack theorem on the whole stable range, including genus 0 and genus 1. Relabelling is induced by permuting the tuple, with the permutation law on the actual sections. Compose the existing forget/stabilization and clutching morphisms; pullback of their universal families identifies them with the consumer operations. The contraction coherence of StableReduction Layer 3 handles successive forgetting. For the boundary use [normalization of the boundary](#310-normalization-of-the-boundary), not the unnormalized image of a clutching map. Descent by the constant graph-automorphism group retains branch exchange and self-intersection data. Tautological rings, motivic and cohomological structures, cycle maps, graph complexes and push-pull theorems belong to the consumer (Canning–Larson–Payne), not to this roadmap. This export supplies their domain stacks and algebraic maps only.

(g,n)=(0,3) gives a point and (0,4) has three distinct normalized boundary points. At a curve with two nodes of the same one-edge type the normalization distinguishes the two chosen nodes. The branch-exchange group is the constant order-two group; in characteristic 2 it is not replaced by μ₂.

([clp-normalized-boundary-review](#references), Introduction pp. 1–2; §2.1 pp. 4–5. The tautological extensions are defined through relabelling, forgetting and gluing operations on pointed moduli stacks.)

*Needs:* SchemeAndStackFoundations §4.15, [separating clutching morphism](#31-separating-clutching-morphism), [nonseparating clutching morphism](#32-nonseparating-clutching-morphism), [normalization of the boundary](#310-normalization-of-the-boundary).

### 7.12 Elliptic-stack and coarse-scheme comparison

For every coefficient field k, the smooth one-pointed genus-one stack `M_{1,1,k}` of SchemeAndStackFoundations §4.15 is equivalent to the elliptic-curve stack Ell/k of ModularCurves §§4A–4B, compatibly with the marked universal curve and arbitrary base change. Its coarse algebraic space is therefore canonically the coarse j-line A¹_k=Spec k[j] of ModularCurves §9E. The comparison is characterized by the coarse classifying maps. It supplies Chen’s elliptic stack and its distinct coarse scheme M(1), without putting a universal elliptic curve on the coarse scheme.

The one mark is a section; the fibres are smooth proper of genus one. Import ModularCurves §§1C, 1D, 2D, 4A, 4B, 9D and 9E and the elliptic and coarse-j statements of AlgebraicModuliForArithmeticGeometry §§5.1–5.4. The coarse-space comparison of SchemeAndStackFoundations §§1.18–1.23 for finite quotients supplies universality among algebraic spaces; the scheme-target universal property of ModularCurves `CoarseModuliData` alone does not.

One proof uses the following inputs and comparisons. Use ModularCurves §1C for the pointed Weierstrass presentation and §1D for the canonical scheme-level group law, including arbitrary-base-change compatibility. Use ModularCurves `isGroupHom_of_mapsZero` (Katz–Mazur 2.5.1) to show that pointed isomorphisms preserve that law and that a compatible group structure is unique. Forgetting the group law while retaining the identity section is then quasi-inverse to this construction, naturally under base change. The marked family is identified with the elliptic universal family by the classifying equivalence, not by a coarse-point bijection. Use AlgebraicModuliForArithmeticGeometry §§5.1–5.4: the full level 3 rigidifier on D(3) and the level 4 rigidifier on D(2) give the quotient-stack charts of ModularCurves §§4C and 9D. SchemeAndStackFoundations §1.23 upgrades their invariant quotients to coarse spaces universal for algebraic-space targets. The unique comparisons glue on overlaps. AlgebraicModuliForArithmeticGeometry §§5.1–5.4 then identifies this coarse space with the coefficient-ring j-line of ModularCurves §9E, including characteristics 2 and 3. Transport through the stack equivalence and use the uniqueness in [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks). This proves the latter is a scheme; scheme-target universality alone would not justify the comparison. No proof of coarse-j representability or of its invariant-ring computations is added here. Hurwitz, Nielsen, Higman and Markoff constructions belong to InverseGaloisAndArithmeticFundamentalGroups Layer IG.5.

Over k of characteristic 2 or 3 use the coefficient-ring theorem `coarseJLine` of ModularCurves §9E, not commutation of arbitrary coarse-space formation with base change. The stack retains automorphisms of elliptic curves with a marked identity, whereas the j-line is a scheme. A map to the j-line does not provide a universal elliptic family; the universal curve lives over `M_{1,1}`.

([chen-moduli-consumer-LwkQQl](#references), Introduction pp. 2–3, notation M(1). The consumer distinguishes the elliptic moduli stack from its coarse scheme.; ModularCurves §§1C, 1D, 2D, 4A, 4B, 9D and 9E, with `coarseJLine_int` and `coarseJLine`. The elliptic-family category and the coarse j-line are owned there; only their comparison with the stack of SchemeAndStackFoundations §4.15 is added.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§5.1–5.4, SchemeAndStackFoundations §1.23, ModularCurves §§1C–1D, 2D, 4A–4C, 9D–9E, SchemeAndStackFoundations §4.15, [the one-pointed genus-one base stack](#2255-the-one-pointed-genus-one-base-stack), [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks).

### 7.13 Fine-level and Picard export for DGH

Fix g≥2,N≥3 and a primitive Nth root over Q̄. On the corresponding exact symplectic component, M_g[N] is a regular geometrically irreducible quasi-projective variety of dimension 3g−3 with a universal smooth projective curve f:C→M. The Torelli map τ:M→A_g[N] uses the same level and pairing, and Jac(C/M)≅τ*U_g as principally polarized abelian schemes with level; this is the cartesian square of DGH, diagram (6.1). The smooth Torelli map has finite geometric fibres (at most two), not an asserted globally finite morphism. The section-free Abel map a₁:C→P¹ and the difference map P¹×_M P¹→J are defined without a section of f and commute with every base change. These compose the moduli/Picard interface used in DGH §6.1.

Characteristic zero, fixed exact pairing component, g≥2,N≥3. The ppav fine scheme/universal family, principal polarization and strong-Torelli input are the exact suppliers of Layer 6. In characteristic zero the fine curve scheme, its universal curve and the quasi-finite Torelli map are those of AbelianSchemesAndArithmeticModuliPartII §B4.1, identified with the restriction of the integral construction by [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme); this export adds the sign-qualified fibre bound and the section-free Abel and difference maps.

One proof uses the following inputs and comparisons. Choose the pairing component on both curve and ppav moduli before applying the fine universal properties. Smoothness and connectedness from Layer 4 imply geometric irreducibility; regularity/quasi-projectivity and dimension come from fineness. [The smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), with its existing ppav and Jacobian suppliers, identifies the actual pulled-back abelian family with Jac(C/M). Yoneda gives the square on arbitrary test schemes, not only on Q̄-points. Use [finite torelli fibres and the sign ambiguity](#66-finite-torelli-fibres-and-the-sign-ambiguity) with its sign qualification. In genus 2 all curves are hyperelliptic and the map is injective on geometric points; in the nonhyperelliptic range the two signs can be distinct. Specialize the JacobianChallengePartII §§2.1–2.3 diagonal-divisor Abel map to the universal family and the imported JacobianChallengePartII §§0.1–0.4 torsor difference to P¹. The orientation is a₁(y)−a₁(x). The universal Faltings–Zhang morphism belongs to JacobianChallengePartII Layers 5 and 7 and is not repeated here.

The Jacobian square commutes after dual-number base change and identifies the same principal polarization and level, rather than merely isomorphic geometric fibres. The construction uses P¹ before choosing a degree-one origin; a curve section is not supplied by the identity section of J. Preserve finite-to-one versus finite, and check genus 2 separately from nonhyperelliptic curves.

([dgh](#references), §6.1 pp. 23–24, diagram(6.1) and degree-Picard discussion. The exact inputs are regular irreducible level moduli, the cartesian Jacobian square, finite-to-one Torelli, and the section-free Pic¹ difference construction.)

*Needs:* AbelianSchemesAndArithmeticModuliPartII §B4.1, JacobianChallengePartII §§2.1–2.3, [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [connectedness of a pairing component](#412-connectedness-of-a-pairing-component), [the smooth full-level torelli morphism](#63-the-smooth-full-level-torelli-morphism), [finite torelli fibres and the sign ambiguity](#66-finite-torelli-fibres-and-the-sign-ambiguity), [hodge pullback along smooth full-level torelli](#67-hodge-pullback-along-smooth-full-level-torelli), [all-base comparison for degree-picard parameters](#73-all-base-comparison-for-degree-picard-parameters).

### 7.14 Pointed-family export for canonical representations

For a stable pair (g,n), let B be a connected complex variety and π:C→B a smooth proper genus-g curve with n ordered pairwise disjoint sections. Its classifying morphism B→M_g,n,C is characterized by a cartesian equivalence of the marked family with the universal family, naturally under scheme base change. The consumer’s versality condition is exactly that this morphism is dominant and étale. Neither existence of such a presentation for every family nor versality of an arbitrary family is asserted.

Here 2g−2+n>0; B a connected complex variety; sections disjoint. The base letter B here denotes the consumer variety, not the fixed cyclotomic base of the unpointed level convention.

One proof uses the following inputs and comparisons. Restrict the stable pointed stack and universal curve of SchemeAndStackFoundations §4.15 to their smooth open and base change to C. Apply the classifying property to the actual ordered sections. The cartesian equivalence is natural on marked-curve isomorphisms and all scheme pullbacks. Express the consumer’s dominant-étale predicate on this classifying morphism without deriving it from smoothness of π. Removal of the section divisor, the punctured family, dominant étale charts used in its arguments, analytification, stack fundamental groups and mapping-class identifications belong to MappingClassGroupsAndCanonicalRepresentations. The coarse space cannot replace this stack in those constructions.

The constant family with (g,n)=(0,4) over a positive-dimensional B has a classifying map to a point of M_0,4, hence is not versal. The ordered sections and their labels survive the classifying equivalence; permutation is a specified operation. Unmarked genus 1 is outside the stable range; marked genus 1 and stable genus 0 pairs are included.

([ll-moduli-consumer-LwkQQl](#references), Notation 1.10.1–1.10.3 pp. 10–11. The consumer works with marked families over connected complex bases and defines versality via a dominant étale map to the moduli stack.)

*Needs:* SchemeAndStackFoundations §4.15.

### 7.15 Stable, level and Picard export for Yuan

For g>1 the smooth/stable curve stacks and universal families of SchemeAndStackFoundations §4.15 and Layers 0–2, together with their separate coarse schemes from Layer 4 (projective for the stable unpointed space), supply Yuan §3.1.1. On each fixed symplectic level component with N≥3 invertible, the fine smooth scheme and the stable extension after a finite dominant cover are the exports of Layers 4 and 6 used in the fine-level compactification discussion. For degree-d triples in §4.3.2, fix ζ_N over an algebraically closed field k. Yuan permits symplectic similitude multiplier c∈(Z/N)×; his parameter is therefore the finite disjoint union P^d_sim=⊔_c P^d_c, not just the exact c=1 component. Precomposition by diag(c⁻¹I_g,I_g) identifies the c-component with the exact component; precomposition by diag(cI_g,I_g) is the inverse. For every algebraically closed extension F/k, P^d_sim(F) is bijective to isomorphism classes of Yuan’s actual degree-d level-N triples over F. For a general T, use q and its obstruction/torsor of lifts instead. The algebraic Lie/Hodge comparison in Lemma 3.4 is imported on its integral Noetherian stable-family bases; its metric assertion is outside this export.

Here g>1; in the level/Picard clause, N≥3 invertible and primitive ζ_N fixed. The stable extension is after the cover and normalization of [graph-closure compactification after a finite cover](#65-graph-closure-compactification-after-a-finite-cover); no moduli interpretation by naive nodal full torsion frames is used. For Lemma 3.4 the original base is integral Noetherian; geometric constant-field conventions in §4.3.2 use the chosen embedding k̄→K̄.

One proof uses the following inputs and comparisons. Compose the smooth/stable stack universal properties with their coarse classifying maps, keeping the universal family on the stack. SchemeAndStackFoundations §4.15 and [one determinant line over the integer base](#414-one-determinant-line-over-the-integer-base) make the stable unpointed coarse algebraic space a projective scheme. Its smooth-curve open is the smooth coarse scheme, using coarse restriction under open (hence flat) base change. Apply the exact finite-cover stable-compactification export on each smooth level component; the stable extension is that of [a stable compactification for the fine level family](#610-a-stable-compactification-for-the-fine-level-family), not inferred from the Picard scheme. For a frame η with `e(ηv,ηw)=ζ_N^{c⟨v,w⟩}`, precompose η with diag(c⁻¹I_g,I_g) to obtain an exact frame; the inverse precomposition gives multiplier c. This works over any base with ζ_N and separates the finitely many constant multiplier components. Apply the same change of frame to the pulled-back universal curves and degree-Picard schemes. For F algebraically closed, use the geometric-point comparison of [geometric triples and the picard sheaf](#78-geometric-triples-and-the-picard-sheaf) on each component. Its surjectivity follows by finding an F-point in an fppf cover carrying a lift; uniqueness of the line-bundle class uses Pic(F)=0. Scalar automorphisms remain in the triple groupoid. Disjoint union gives the stated similitude comparison. For arbitrary T apply §§7.6–7.7. For Lemma 3.4, use JacobianChallengePartII §§6.1–6.3 Lie(J/S)≅R¹π_*O and stable-curve duality to obtain π_*ω≅e*Ω¹_J/S and then its determinant. Layer 5 forms the determinant and Layer 6 gives the smooth universal comparison; metric compatibility remains the arithmetic/analytic consumer’s work. The routed Picard item requires the geometric triple comparison, not a new proof of Lemma 4.8 or a rational-field isotriviality criterion. Do not infer descent of an actual line bundle to a smaller nonclosed field from descent of its sheaf class.

For N=3 there are two multiplier components c=1,2; the exact component alone does not parametrize all the permitted frames. Over algebraically closed F the lift-class fibre is a singleton with scalar inertia F×; over T=P¹_C the base-twist test refutes the unqualified global-bundle interpretation. In a one-variable function-field application read the bars in k̄ and K̄ geometrically; the geometric-point bijection uses no rational-field descent theorem. The stable family lies over the covering compactification, and the boundary is not claimed to carry ordinary full N-torsion of an abelian Jacobian. The determinant Hodge line λ and the rank-g Hodge vector bundle E have distinct types.

([yuan-author-http](#references), §3.1.1 p. 41; §3.1.3 Lemma 3.4 pp. 43–44; pp. 45–46 and p. 57; §4.3.2 pp. 73–75. The routed uses need stack/coarse separation, a covered stable extension, the algebraic Hodge comparison, and Picard parameters for triples allowing all similitude multipliers.; [blr-relative-picard-LwkQQl](#references), §8.4 Theorem 1 pp. 231–232; §9.4 Theorem 1 p. 259. Lie/cohomology and the stable semiabelian identity component are existing Jacobian/Néron suppliers.)

*Needs:* JacobianChallengePartII §§6.1–6.3, StableReduction Layer 2, SchemeAndStackFoundations §4.15, [coarse spaces of pointed curve stacks](#41-coarse-spaces-of-pointed-curve-stacks), [full symplectic level on smooth curves](#42-full-symplectic-level-on-smooth-curves), [the fine smooth full-level curve scheme](#48-the-fine-smooth-full-level-curve-scheme), [a stable compactification for the fine level family](#610-a-stable-compactification-for-the-fine-level-family), [the hodge bundle of stable pointed curves](#51-the-hodge-bundle-of-stable-pointed-curves), AlgebraicVectorBundles L0C and the Hodge descent comparison in Layer 5, [hodge pullback along smooth full-level torelli](#67-hodge-pullback-along-smooth-full-level-torelli), [the degree-d level picard parameter functor](#71-the-degree-d-level-picard-parameter-functor), [geometric triples and the picard sheaf](#78-geometric-triples-and-the-picard-sheaf), [actual triples and their class morphism](#74-actual-triples-and-their-class-morphism), [the obstruction to a global line-bundle lift](#76-the-obstruction-to-a-global-line-bundle-lift), [picard torsor of global lifts](#77-picard-torsor-of-global-lifts), [all-base comparison for degree-picard parameters](#73-all-base-comparison-for-degree-picard-parameters).

### Examples

Over an algebraically closed field Pic(k)=0, so a nonempty lift-class fibre is a singleton, while its scalar automorphisms are k×. Over T=ℙ¹_ℂ, tensoring a lift by the base line O(1) produces a distinct actual lift with the same relative class. Over k[ε]/ε² the fixed-curve reduction fibre is H¹(C,O_C), of dimension two at genus two, with scalar infinitesimal inertia 1+εk.

### Dependencies

Layers 0–6; JacobianChallenge Layers A–F and JacobianChallengePartII §§0.1–0.4, 4.4, 6.1–6.3; AlgebraicModuliForArithmeticGeometry §§3.5, 7.6; ModularCurves §§1C–1D, 2D, 4A–4B, 9E. Relative Picard is imported without using its later full-level application to construct curve level.

## Downstream consumers

The six consumer interfaces in Layer 7 supply the curve-family bases of Abdurrahman–Venkatesh, the pointed boundary operations of Canning–Larson–Payne, Chen’s elliptic-stack comparison, the full-level and Picard families of Dimitrov–Gao–Habegger, the pointed families of Landesman–Litt, and Yuan’s stable, level and degree-Picard parameters. Hurwitz moduli, mapping-class representations, tautological-ring presentations, adelic metrics and arithmetic heights remain in their respective consumer roadmaps. A universal curve is pulled back from the stack or fine level scheme; a coarse classifying space alone carries no claimed universal family. Among roadmaps, HeightsRationalPointsAndObstructionsPartII consumes the fine level scheme, Torelli and Picard exports (§§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15), and ArakelovGeometryAndAbelianHeightsPartII consumes the Hodge, boundary and Noether statements of Layer 5 and the compactification and positivity statements of Layer 6.

## Worked examples

A general Lefschetz pencil of curves of bidegree (2,3) on ℙ¹×ℙ¹ over ℂ has genus (2−1)(3−1)=2 and twelve transverse base points. Blow them up. The resulting surface has K²=8−12=−4 and χ(O)=1. Over ℙ¹ its relative canonical square is κ=−4+8(g−1)=4 and deg λ=χ(O)+(g−1)=2. Its Euler number is 4+12=16; subtracting the smooth-fibration Euler number 2(2−2g)=−4 gives twenty ordinary nodes. Thus the Noether degrees are 12·2=4+20=24, and the defect has degree 24−4−20=0. Reversing the boundary sign would give 24−4+20=40. (Mumford, Theorem 5.10 computation, pp. 100–102; Yuan, Theorem 3.3, p. 42, yuan-author-http line 1390; the pencil invariants are the displayed surface calculations.)

For (0,3) the family is (ℙ¹;0,1,∞), with trivial automorphism group. For (1,1) in characteristic zero inversion fixes the mark and is nontrivial. In the represented universal fibre its chosen identification fixes the underlying arrow, so this automorphism does not create an extra fibre arrow. A dual-number base and the empty scheme test descent on schemes rather than only geometric points.

At g=2 the Hilbert polynomial is 6T−1. A frame is projective: tensoring all five sections by a base line changes a GL frame but preserves its PGL frame. For a curve with one node the formal chart has one smoothing coordinate t; with two nodes it has t₁,t₂ and boundary t₁t₂=0. Permuting branches need not define globally labelled components.

At s=t=0 and γ=1, δ=0 in characteristic two, q=X(X+Y) has discriminant 1. At γ=δ=0, q=X² has discriminant 0: the polynomial matrix theorem still applies but the nodal geometric conclusion does not. At the origin Φ=((0,X),(−X,Y)) and Ψ=((Y,−X),(X,0)); their products equal X²I before quotient and zero after quotient. For the smooth elliptic attachment the labelled triangle gives four fixed nodes in dimension five; at its cusp there is a fifth node, while only the four fixed smoothing parameters are killed. The source has dimension one in both cases.

A self-node contributes two flags. The (0,4) boundary has three points whereas (0,3) has none, so old-mark collisions contribute to forgetting. Exchanging genus-one factors changes the ordered Hodge determinant by −1, but the smoothing conormal exchange by +1. Constant C₂ inertia survives over characteristic two.

For a constant genus-two family E₃ has rank five and degree zero; its determinant is trivial on a positive-dimensional proper base and cannot be ample. For N=3 the exact symplectic and multiplier-2 components are distinct. For the integral composite level 15, characteristic three uses level five rigidity and characteristic five uses level three rigidity; neither fibre is discarded.

At a node xy=π^e over a DVR, the boundary branch pulls back to e times the closed point. Two nodes of thicknesses 2 and 3 give total boundary length 5. The local residue vector (r,−r) changes to (−r,r) on branch reversal. For g=0 the Hodge bundle has rank zero and determinant O, while the unpointed integral Noether statement is scoped to g≥2.

The constant family C₀×𝔸¹ must compactify a one-dimensional base even though its moduli image is a point. A quadratic twist with generic isomorphism field L of degree two requires normalization in L, rather than in the image field. On a positive-dimensional isotrivial projective base λ is numerically trivial and is not big; on a point the dimension-zero bigness convention is satisfied.

## References

- **mumford1977**: David Mumford, [Stability of projective varieties](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), 1977.

- **milne**: J. S. Milne, [Jacobian Varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), 2021.

- **dm**: Pierre Deligne; David Mumford, [The irreducibility of the space of curves of given genus](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1969c--IrredModCurves-Deligne-Numdam.pdf), 1969.

- **knudsen2012**: Finn F. Knudsen, [A closer look at the stacks of stable pointed curves](https://arxiv.org/abs/1106.1588v2), 2012. arXiv:1106.1588v2; theorem numbering follows this version.

- **ile**: Runar Ile, [Stably reflexive modules and a lemma of Knudsen](https://arxiv.org/abs/1110.3909v3), 2013. arXiv:1110.3909v3; theorem numbering follows this version.

- **clm**: Raymond Cheng; Carl Lian; Takumi Murayama; in collaboration with Yordanka Kovacheva and Monica Marinescu, [Projectivity of the moduli of curves](https://chngr.github.io/assets/mgbar.pdf), 2021.

- **yuan-author-http**: Xinyi Yuan, [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 2024.

- **dgh**: Vesselin Dimitrov, Ziyang Gao, Philipp Habegger, [Uniformity in Mordell-Lang for curves](https://arxiv.org/abs/2001.10276v3), 2020. arXiv:2001.10276v3; theorem numbering follows this version.

- **stacks-hom-flat**: The Stacks Project Authors, [The Stacks Project: More on Algebra](https://stacks.math.columbia.edu/tag/087Q), 2026.

- **stacks-completion**: The Stacks Project Authors, [The Stacks Project: Algebra](https://stacks.math.columbia.edu/tag/0BNH), 2026.

- **stacks-projective-bundles-review**: The Stacks Project Authors, [The Stacks Project: Constructions](https://stacks.math.columbia.edu/tag/01OA), 2026.

- **stacks-projective-picard-review**: The Stacks Project Authors, [The Stacks Project: Divisors](https://stacks.math.columbia.edu/tag/0BXJ), 2026.

- **clp-normalized-boundary-review**: Samir Canning, Hannah Larson, Sam Payne, [Extensions of tautological rings and motivic structures in the cohomology of `M̄_{g,n}`](https://arxiv.org/abs/2307.08830v3), 2024. arXiv:2307.08830v3; theorem numbering follows this version.

- **stacks-noetherian-valuative-KKjBS6**: The Stacks Project Authors, [The Stacks Project: Limits of Schemes](https://stacks.math.columbia.edu/tag/0208), 2026.

- **blr-relative-picard-LwkQQl**: Siegfried Bosch; Werner Lütkebohmert; Michel Raynaud, [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), 1990. Uncertified; cited by the theorem, section and page locators in the layers.

- **av-moduli-consumer-LwkQQl**: Amina Abdurrahman, Akshay Venkatesh, [Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://arxiv.org/abs/2303.13436v1), 2023. arXiv:2303.13436v1; theorem numbering follows this version.

- **chen-moduli-consumer-LwkQQl**: William Chen, [Nonabelian level structures, Nielsen equivalence, and Markoff triples](https://arxiv.org/abs/2011.12940v2), 2021. arXiv:2011.12940v2; theorem numbering follows this version.

- **ll-moduli-consumer-LwkQQl**: Aaron Landesman, Daniel Litt, [Canonical representations of surface groups](https://arxiv.org/abs/2205.15352v4), 2023. arXiv:2205.15352v4; theorem numbering follows this version.

- **mc0-stacks-curves**: The Stacks Project Authors, [The Stacks Project: Algebraic Curves](https://stacks.math.columbia.edu/download/curves.pdf), 2026.

- **mc0-stacks-moduli**: The Stacks Project Authors, [The Stacks Project: Moduli of Curves](https://stacks.math.columbia.edu/download/moduli-curves.pdf), 2026.

- **mc0-stacks-duality**: The Stacks Project Authors, [The Stacks Project: Duality for Schemes](https://stacks.math.columbia.edu/download/duality.pdf), 2026.

- **mc0-stacks-perfect**: The Stacks Project Authors, [The Stacks Project: Derived Categories of Schemes](https://stacks.math.columbia.edu/download/perfect.pdf), 2026.

- **mc0-stacks-descent**: The Stacks Project Authors, [The Stacks Project: Descent and Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-descent.pdf), 2026.

- **mc0-stacks-quot**: The Stacks Project Authors, [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), 2026.

- **mc1-perf**: The Stacks Project Authors, [The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), 2026.

- **mc1-def**: The Stacks Project Authors, [The Stacks Project: Deformation Problems](https://stacks.math.columbia.edu/download/examples-defos.pdf), 2026.

- **mc1-etale**: The Stacks Project Authors, [The Stacks Project: Étale Morphisms of Schemes](https://stacks.math.columbia.edu/download/etale.pdf), 2026.

- **mc1-stackdim**: The Stacks Project Authors, [The Stacks Project: The Geometry of Algebraic Stacks](https://stacks.math.columbia.edu/download/stacks-geometry.pdf), 2026.

- **mc1-stackval**: The Stacks Project Authors, [The Stacks Project: More on Morphisms of Stacks](https://stacks.math.columbia.edu/download/stacks-more-morphisms.pdf), 2026.

- **mc2-stacks-unramified-diagonal**: The Stacks Project Authors, [The Stacks Project: Morphisms of Schemes](https://stacks.math.columbia.edu/tag/02GE), 2026.

- **mc3-polishchuk**: Alexander Polishchuk, [Extended clutching construction for the moduli of stable curves](https://arxiv.org/abs/2110.04682v3), 2024. arXiv:2110.04682v3; theorem numbering follows this version.

- **mc3-stacks-norm**: The Stacks Project Authors, [Normalization of algebraic stacks](https://stacks.math.columbia.edu/tag/0GMH), 2026.

- **mc4-serre**: Jean-Pierre Serre, appendix to Alexandre Grothendieck, expose 17, [Rigidite du foncteur de Jacobi d echelon n >= 3](https://www.numdam.org/item/SHC_1960-1961__13_2_A4_0.pdf), 1961.

- **mc4-ehkv**: D. Edidin, B. Hassett, A. Kresch, A. Vistoli, [Brauer groups and quotient stacks](https://arxiv.org/abs/math/9905049v3), 2001. arXiv:math/9905049v3; theorem numbering follows this version.

- **mc4-ekedahl**: Torsten Ekedahl, [Canonical models of surfaces of general type in positive characteristic](https://www.numdam.org/item/PMIHES_1988__67__97_0.pdf), 1988.

- **mc4-chen-zhang**: Yifei Chen, Lei Zhang, [The subadditivity of the Kodaira Dimension for Fibrations of Relative Dimension One in Positive Characteristics](https://arxiv.org/abs/1305.6024v1), 2013. arXiv:1305.6024v1; theorem numbering follows this version.

- **stacks-moduli-stacks**: The Stacks Project Authors, [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), 2026.

- **stacks-varieties**: The Stacks Project Authors, [The Stacks Project: Varieties](https://stacks.math.columbia.edu/download/varieties.pdf), 2026.
- **stacks-spaces-cohomology**: The Stacks Project Authors, [The Stacks Project: Cohomology of Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-cohomology.pdf), 2026.

- **mc5-deligne1987**: Pierre Deligne, [Le déterminant de la cohomologie](https://publications.ias.edu/sites/default/files/Number58.pdf), 1987.

- **mc5-knudsenmumford1976**: Finn Faye Knudsen; David Mumford, [The projectivity of the moduli space of stable curves I: Preliminaries on det and Div](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf), 1976.

- **mc5-edidingraham1997**: Dan Edidin, William Graham, [Equivariant intersection theory](https://arxiv.org/abs/alg-geom/9609018v3), 1997. arXiv:alg-geom/9609018v3; theorem numbering follows this version.

- **mc5-edidingraham1999**: Dan Edidin, William Graham, [Riemann-Roch for equivariant Chow groups](https://arxiv.org/abs/math/9905081v2), 1999. arXiv:math/9905081v2; theorem numbering follows this version.

- **mc5-luo1998**: Feng Luo, [A Presentation of the Mapping Class Groups](https://arxiv.org/abs/math/9801025v1), 1998. arXiv:math/9801025v1; theorem numbering follows this version.

- **mc5-hall2011**: Jack Hall, [Generalizing the GAGA Principle](https://arxiv.org/abs/1101.5123v2), 2011. arXiv:1101.5123v2; theorem numbering follows this version.

- **mc5-fredianineumann2004**: Paola Frediani, Frank Neumann, [Etale homotopy types of moduli stacks of algebraic curves with symmetries](https://arxiv.org/abs/math/0404387v1), 2004. arXiv:math/0404387v1; theorem numbering follows this version.

- **mc6-fc1990**: Gerd Faltings, Ching-Li Chai, [Degeneration of Abelian Varieties](https://doi.org/10.1007/978-3-662-02632-8), 1990. Uncertified; cited by the theorem, section and page locators in the layers.

- **mc6-stacksregular**: The Stacks Project Authors, [The Stacks Project: Properties of Schemes](https://stacks.math.columbia.edu/tag/033H), 2026.

- **knudsen2**: Finn Faye Knudsen, [The projectivity of the moduli space of stable curves, II: The stacks `M_{g,n}`](https://journals.msp.org/mscand/article/download/1622/1621/1653), 1983.

- **knudsen3**: Finn Faye Knudsen, [The projectivity of the moduli space of stable curves, III: The line bundles on `M_{g,n}`, and a proof of the projectivity of `M̄_{g,n}` in characteristic 0](https://journals.msp.org/mscand/article/download/1623/1622/1654), 1983.

- **hacking-boundary-review**: Paul Hacking, [The moduli space of curves is rigid](https://msp.org/ant/2008/2-7/ant-v2-n7-p03-s.pdf), 2008.

- **mc3-edidin-fulghesu**: Dan Edidin; Damiano Fulghesu, [Normalization of the 1-stratum of the moduli space of stable curves](https://ems.press/content/serial-article-files/44698?nt=1), 2012.

- **mc5-erikssonfreixas2024**: Dennis Eriksson; Gerard Freixas i Montplet, [Deligne–Riemann–Roch and intersection bundles](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), 2024.

