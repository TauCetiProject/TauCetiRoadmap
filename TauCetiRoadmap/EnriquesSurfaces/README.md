# Roadmap: enriques surfaces, projective models and automorphisms

**Summary.** Construct the algebraic geometry of Enriques surfaces, their low-degree linear systems, Reye and double-plane models, and the actions relating these models to integral lattices. Build usable geometric objects and their maps before identifying automorphism groups or counting presentations. The characteristic-dependent theorems, generic loci and equivalences are part of each statement.

## Scope and ownership

This roadmap owns the Enriques-specific integral Picard and numerical comparisons, linear systems, resolved presentations, Reye geometry and automorphism actions. WeilConjectures WC.7 supplies the Enriques predicate, its field-extension invariance, projectivity and the invariant theorem b₁=0, b₂=ρ=10, including characteristic two. Layer 1 supplies the characteristic-not-two adapter and integral refinements, not a second predicate or rational invariant theorem.

SchemeAndStackFoundations §§0–5 supplies the general scheme, divisor, intersection and deformation theory; AlgebraicVectorBundles L0A–L1 supplies invertible sheaves. AbelianSchemesAndArithmeticModuli A4.8 supplies general polarized formal algebraization, and ComplexComparisonPartII C5.4 supplies the integral exponential/Chern comparison. RootSystems Layer 3 supplies abstract exchange and Matsumoto; its finite-root chambers do not supply indefinite geometric faithfulness. Section 5.2 owns the general geometric-faithfulness theorem and its root-sign theory on the native Coxeter representation, beyond those abstract and finite-root inputs.

K3Surfaces K0–K6, K7.A–B and §7.3 supply independent K3 theory, the integral involution model, its fixed-locus realization and the independent free/nodal period criteria. The canonical-cover adapter and descent belong here in §6.2, after the integral comparison of Layer 1: the supplier contract excludes K7.C. In particular, no result consumed from K3Surfaces may use an Enriques numerical-lattice or automorphism theorem. FourManifolds F7 owns its topological Enriques example. EnriquesSurfacesAndIntegralNonexistence consumes the surface geometry and retains the arithmetic nonexistence application.

## Conventions

Use schemes and morphisms over the actual `Spec k`, their native `Over` category, `Scheme.Modules`, native invertible sheaves and `LineBundleClass`, and the existing Cartier divisor class map. A smooth projective surface has pure relative dimension two and is geometrically integral. Projective embeddings, an ample bundle, a basis of sections, a resolution and a marking are additional data, not hidden fields in a competing surface carrier.

Use WeilConjectures WC.7's Enriques condition: a smooth proper geometrically connected surface with numerically trivial canonical bundle and χ(O)=1. Over algebraically closed k of characteristic different from two, prove its equivalence with h¹(O)=0 and nontrivial canonical bundle K satisfying K^⊗2≃O. Prove pg=0 and minimality on this domain; the numerical invariants enter through WC.7 (Dolgachev, §3, pp. 7–9). General sheaf, double-cover and divisor constructions retain their natural wider bases with explicitly stated hypotheses. Characteristic-two classical, singular and supersingular Enriques theories require separate statements; none is inferred from this core. The 1985 generic-nodal theorem retains characteristic zero or p outside{2,3,5,7,17}.

Keep Pic, the Néron–Severi group, and the numerical divisor quotient distinct. Tensor product is the group law of native LineBundleClass; additive divisor notation denotes its translated additive group. Intersections use the single intersection pairing and numerical divisor quotient of SchemeAndStackFoundations5.9–5.10. Its signature is expressed as(t₊,t₀,t₋), as in IntegralLattices. A root of the geometric intersection lattice has square−2. The source's positive-root T246 Gram is the negative of that intersection form. An isometry must preserve the complete form and integral carrier.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `CoxeterMatrix`, `CoxeterSystem`, `Module.End`, `LinearEquiv` and `ZMod`. Tau Ceti `CoxeterSystem.geometricRepresentation` in `TauCeti/GroupTheory/Coxeter/Geometric.lean` supplies the actual representation and its simple-generator equation, not faithfulness. Use `Scheme.Modules.baseRingToGlobalSections` and `Scheme.Modules.globalSectionsSmul_naturality` from `TauCeti/AlgebraicGeometry/Modules/GlobalSections.lean` for the scalar action; neither is a new acceptance target. Native schemes, scheme modules and invertible sheaves are the carriers throughout. The Coxeter proof inputs also include `CoxeterSystem.strongExchange` and `CoxeterSystem.deletionCondition` in `TauCeti/GroupTheory/Coxeter/StrongExchange.lean`, `CoxeterSystem.exists_isMinimalCosetRep` and `CoxeterSystem.length_mul_of_isMinimalCosetRep` in `TauCeti/GroupTheory/Coxeter/Parabolic.lean`, and `CoxeterSystem.wordProd_alternatingWord_eq_of_mem_parabolic_pair` in `TauCeti/GroupTheory/Coxeter/Dihedral.lean`; their length and standard-parabolic theory does not assume geometric faithfulness.

### From the named roadmaps

Each row specifies the mathematical output and its hypotheses, not whole-roadmap completion:

| Producer | Output consumed here |
| --- | --- |
| [AlgebraicVectorBundles L0A–L1 and native scheme modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md) | Actual tensor/dual/pullback of modules and invertible sheaves; coherent algebra and relative Spec with affine and base-change comparisons |
| [JacobianChallenge A–C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md); [AlgebraicCurves curve/scheme dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicCurves/README.md) | Existing line-bundle/divisor/degree/cohomology carriers, proper curve RR/duality and field-extension comparisons; no surface lattice is imported from a curve theorem |
| [SchemeAndStackFoundations0.3,2.6,2.19–2.20,4.6–4.10,4.11,4.13,5.1–5.10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md) | Projective/coherent foundation, proper cohomology/duality, finite Stein factor, modifications, curve resolution and the complete single surface intersection/Num/adjunction/RR/Hodge-index API |
| [StableReduction2/4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md) | The actual relative-Proj, blowup/universal ideal and strict-transform constructions; its arithmetic fibre matrices are not a definition of the numerical lattice of an arbitrary projective surface |
| [AlgebraicModuliForArithmeticGeometry1.1–1.3,2 and3.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md); [SchemeAndStackFoundations1.13–1.23](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md); [ModularCurves0G](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md) | Quotient-convention projective/Grassmann spaces, universal evaluation/Plücker and Hom/Isom machinery, action groupoids/quotient stacks/coarse spaces, effective polarized descent and qualified finite quotients |
| [IntegralLattices0–1,5,6A and6C/6F](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md) | Finite free integral forms, rational ambient spaces, Gram/index/signature, discriminant forms/gluing and actual E7/E8 models; no mass formula or theta series |
| [ComplexComparisonPartII C3.2d.1–C3.2d.2, C6.3, C6.5 and C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md) | Represented relative Picard sheaf/algebraic space and its bundle-class dictionary; finite Artin, smooth cup/trace and normalized integral adic Betti comparisons, with twists and complex orientation |
| [AlgebraicModuliForArithmeticGeometry7.3,7.6.1 and7.6.1a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) | Framed line-bundle obstruction groupoid, relative Picard sheaf/base change and actual class/section-splitting hypotheses, with scalar automorphisms retained |
| [RootSystems Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md) and native Coxeter.Geometric | Abstract exchange and Matsumoto; finite-root positive-definite chamber theorems do not apply to T246 |
| [K3Surfaces K0.A, K1–K6, K7.A–B and §7.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/K3Surfaces/README.md) | Early algebraic global-differential vanishing for the obstruction consumer; independently, actual complex cohomology/marked families/periods/cones/Torelli and independent integral involution gluing, fixed-locus realization and §7.3’s free/nodal period criteria for §6.2. No complex result supplies the tame nodal proof |

Additional exact contracts are WeilConjectures WC.7 (the predicate and rational invariants), AbelianSchemesAndArithmeticModuli A4.8 (a cartesian proper system over an ideal-adically complete Noetherian ring with compatible line bundles ample on the initial fibre algebraizes to a proper scheme with an ample bundle), and ComplexComparisonPartII C5.4 (the integral exponential connecting map equals the first Chern class, compatibly with the sheaf/singular comparison). For the Witt lift, the polarized algebraization contract is applied to all W(k)/pⁿ and compatible ample bundles, not to coherent sheaves on an assumed algebraization.

Use only the named independent producer cuts. General characteristic-zero resolution cannot discharge positive-characteristic branch resolution. FourManifolds owns its topological Enriques example; complex analytification consumes, and never replaces, the algebraic constructions here.

## How to read the build

Layer 0 adapts the shared surface and family carriers. Layer 1 constructs integral comparisons and half-fibres; Layers 2–3 build resolved models and their groupoids. Layers 4–5 develop Reye families and reflection actions. Layer 6 identifies the nodal and unnodal automorphism groups on their distinct loci. Layer 7 compares the intrinsic classification with the source's representation relation. The labels E0–E7 denote Layers 0–7; E1a–E1f denote §§1.1–1.6, E6.U0–U4 denote §6.2 and E6.U5 denotes §6.3.

## Layer 0: surface and family interfaces

### 0.1 Surface adapters

Specialize the producer intersection/duality theory to smooth projective surfaces. Export its divisor/Pic/Num comparisons with the exact coefficient and base morphisms, arithmetic genus and adjunction, surface RR and trace-duality. Include restriction to proper integral curves and their normalizations, blowup intersection formulas, canonical pullback/discrepancy, projection formula and field-extension laws. These are adapters around the producers, not duplicate Chow, Picard, numerical-equivalence or cohomology objects.

**API — Surface comparison maps.**

- Transport tensor products to addition and pullback to the existing divisor pullback.
- Preserve intersection, adjunction and Euler characteristics under the specified isomorphisms.

**Checks.**

- On P¹×P¹ the two ruling classes have squares 0 and mutual intersection 1.
- For a blowup exceptional curve E, E²=−1 and K·E=−1; it cannot be an Enriques root.
- On the blowup chart y=xt, dx∧d(xt)=x dx∧dt has vanishing order 1 on E; a negative discrepancy would give order −1.
- For L=O the RR polarization gives χ(M)−χ(O)−χ(M)+χ(O)=0.

These are constructed adapters: the intersection and restriction-degree comparisons are SchemeAndStackFoundations §5.9’s surface pairing, and adjunction, RR and Num are §5.10’s adjunction, surface Riemann–Roch and numerical-equivalence targets. Trace-duality is §2.20; Chern-class pullback and projection formulas are §§5.3 and 5.6. For blowups, use StableReduction Layer 4’s exceptional-divisor/intersection construction and derive the canonical discrepancy K_(Bl S)=π*K_S+E at a smooth point from the chart y=xt, where π*(dx∧dy)=x dx∧dt; transport along the divisor–line-bundle comparison of SchemeAndStackFoundations §5.3. Field-extension identities use coherent flat base change (§2.6) and flat pullback and degree compatibility (§§5.2–5.3), together with the intersection product (§5.6), with the same smooth projective hypotheses. The degree compatibility preserves intersection numbers after field extension; tensor extension preserves each coherent-cohomology dimension and hence χ.

*Needs:* SchemeAndStackFoundations §§2.6, 2.20, 5.2–5.3, 5.6, 5.9–5.10; StableReduction Layer 4; AlgebraicVectorBundles L0A–L1.

### 0.2 Linear systems and base ideals

For actual invertible L, construct the finite-dimensional section module H⁰(S,L), the evaluation map, scheme-theoretic base ideal and base scheme. A chosen complete-system map uses the quotient convention P(H⁰(S,L)): evaluation gives a line quotient of the pulled-back module. Explain the equivalent lines-in-the-dual convention by a named comparison, with its O(1) identity. A complete linear system has projective dimension h⁰−1; no map is created from the zero module. Resolve the rational map by the canonical blowup of the actual base ideal, or an explicitly compared refinement; retain the invertible exceptional ideal and pullback formula. Build restrictions, isomorphism transport and compatible composition/base change wherever the producer hypotheses imply them. Normalization and Stein factorization do not commute with arbitrary base change without proof.

**API — Evaluation, base schemes and resolved linear systems.**

- Identify the base ideal with the image of evaluation tensored by L⁻¹; transport it under isomorphisms.
- The blowup pulls the base ideal back to an invertible ideal and resolves the evaluation quotient.
- Prove the lines-in-the-dual/quotient-projective-space comparison and its O(1) identity.

**Checks.**

- The section 1 of O on A¹ gives ideal (1), hence empty base scheme.
- The section t gives ideal (t), hence the reduced origin; the empty section family gives ideal (0), hence all of A¹.
- Section dimensions 0, 1 and 3 give no map, a map to P⁰ and a map to P² respectively; no natural subtraction h⁰−1 is used at zero.

These are constructed adapters, with finite-dimensional H⁰ from SchemeAndStackFoundations §2.6’s proper coherent-cohomology finiteness and evaluation from the quotient universal property of AlgebraicModuliForArithmeticGeometry §1.1. Its projective-bundle dual-convention comparison identifies the dual-line convention and O(1). The image of evaluation tensored by L⁻¹ defines the base ideal; StableReduction Layer 4’s blowup universal property and exceptional-ideal formula give the resolved quotient. Use its flat-base-change comparison only when the section module also satisfies SchemeAndStackFoundations §2.6’s quasi-compact, quasi-separated and flat-base-change hypotheses; Stein factorization is §4.9. These ingredient statements do not assert arbitrary base change for normalization.

*Needs:* §0.1; SchemeAndStackFoundations §§2.6, 4.9; AlgebraicModuliForArithmeticGeometry §§1.1–1.3; StableReduction Layers 2, 4.

### 0.3 Polarized isomorphisms

Construct isomorphism and automorphism groupoids of polarized surfaces and of resolved presentations, with actual commuting diagrams, identities, inverse/composition, forgetful functors and scalar rigidification. Use the native groupoid/category vocabulary. Prove H⁰(O_S)=k for the proper geometrically integral surfaces used here; line-bundle automorphisms are k×. Equality of class representatives is not literal equality of their chosen sheaves or bases.

**API — Polarized groupoids.**

- Construct identity, inverse and composition with pullback coherence.
- Identify scalar automorphisms with global units before scalar rigidification.

**Checks.**

- For O on a proper geometrically integral surface the scalar kernel is k×.
- For a disconnected union of two such surfaces it is k××k×, excluding the same scalar identification.
- Multiplication by 2 then by 3 in characteristic zero induces multiplication by 6 on sections and identity on their projectivization.

The groupoid is a specialization of the supplied polarized isomorphism groupoid.

*Needs:* §0.2; AlgebraicModuliForArithmeticGeometry §2 and §7.3.

### Examples

On P¹×P¹, evaluation of O(1,1) is base-point free and its ruling intersection is 1.

### Dependencies

The projective, module, intersection and groupoid contracts in the supplier table.

## Layer 1: integral invariants and genus-one pencils

### 1.1 Canonical cover, Picard kernel and the characteristic-bearing lift

Construct the canonical algebra and its trace, norm and pullback maps before the numerical marking. For the stated algebraically closed field of characteristic different from two, prove H⁰(K)=0, H²(O)=0, χ(O)=1, minimality and the K3 invariants of the connected étale canonical cover. For a numerically trivial nontrivial line bundle L, surface RR gives χ(L)=1 and duality gives h⁰(L)+h⁰(K−L)≥1. A nonzero effective divisor has positive intersection with an ample class; hence a numerically trivial effective line bundle is trivial. Deduce L=K. This proves the kernel of Pic→Num is exactly {O,K}, not merely the torsion subgroup of an unspecified cohomology group. Surface RR and numerical triviality of K then prove that the Num pairing is even. Use the existing finite generation and torsion-freeness of the single Num quotient from SchemeAndStackFoundations5.10.

For p>2 construct the following Enriques-specific vanishing and lifting theorem before any rank or discriminant assertion. Pull back Ω¹_S and Ω¹_S⊗K_S along the actual canonical étale cover X→S. K3Surfaces K0.A proves H⁰(X,Ω¹_X)=0 on its algebraic characteristic-bearing domain, independently of Num, Enriques lifting and complex periods. Faithfully flat pullback is injective on sections, so H⁰(S,Ω¹_S⊗K_S)=0. Surface duality identifies its dual with H²(S,T_S), which therefore vanishes. No characteristic-zero Hodge symmetry is used here.

Apply SchemeAndStackFoundations4.6's actual smooth-proper deformation obstruction H²(T_S)⊗I along W(k)/pⁿ, retaining compatible identifications of every reduction. Construct a smooth proper formal surface lifting S. AM7.3 `picard_infinitesimal_lifting`, on these actual thickenings, lifts a chosen ample line bundle because H²(O_S)=0. Use AbelianSchemesAndArithmeticModuli A4.8's general polarized formal algebraization (Stacks, Theorem 30.28.4, tag 089A) to construct a projective smooth scheme 𝒮 over W(k), a relatively ample invertible sheaf, and an identification of its special fibre with S. Smoothness is proved by the formal lifting criterion and openness on the proper algebraized family. This is a surface-lifting construction, not an application of the Picard obstruction theorem alone. The relative canonical bundle, its chosen square trivialization and the canonical double cover are transported by the subsequent Picard comparison.

**API — Canonical cover and characteristic-not-two adapter.**

- Construct O⊕K⁻¹ using the chosen square trivialization, with trace, norm, deck action and étale base change.
- Prove the WC.7 equivalence, connectedness of the cover, its K3 invariants, and the Pic→Num kernel {O,K}.
- Transport the ample bundle and all reduction identifications through polarized algebraization.

**Checks.**

- For a nontrivial canonical bundle h⁰(K)=0, χ(O)=1 and χ(O_cover)=2.
- For a trivial square-root line and b=1 the algebra is k×k, so the cover is disconnected; nontriviality of K is necessary.
- In characteristic 2, t²−1=(t−1)², so this algebra is nonreduced and the trace splitting fails.
- K3 and abelian surfaces have χ(O)=2 and 0 respectively, excluding both from WC.7; a blowup has K·E=−1.
- Over W(k)/pⁿ the ideal of the next thickening is square-zero and H²(T)⊗I=H²(O)⊗I=0; coherent existence on an already constructed scheme alone does not produce a scheme.

Dolgachev, §3, pp. 7–10; Stacks, tag 089A for the algebraization step.

*Needs:* §0.1; WeilConjectures WC.7; K3Surfaces K0.A; SchemeAndStackFoundations §§4.6, 4.10; AlgebraicModuliForArithmeticGeometry §7.3; AbelianSchemesAndArithmeticModuli A4.8.

### 1.2 Actual Picard specialization and its integral pairing

For a chosen lift over R=W(k), construct restriction and specialization on Pic, retaining the maps for finite extensions of its fraction field and their complete valuation rings. Because H¹(O_S)=H²(O_S)=0, reduction Pic(𝒮_(n+1))→Pic(𝒮_n) is bijective on isomorphism classes. Automorphisms remain global units; there is no assertion of a unique unframed bundle isomorphism. Make the chosen reduction comparisons compatible and use Grothendieck existence and its fully faithful morphism comparison on the actual projective 𝒮 to algebraize their inverse systems.

For a line bundle on the geometric generic fibre, descend it to a finite fraction-field extension. On the resulting regular smooth model, extend a rational divisor by horizontal closure, which is Cartier because the model is regular. Prove that two extensions differ by a vertical divisor and that the sole geometric special fibre is a principal divisor. This defines specialization independently of the extension. For injectivity, a bundle whose special reduction is trivial has trivial class on every thickening; choose compatible trivializations and apply fully faithful coherent existence. For surjectivity, algebraize the formal lifts of any special-fibre bundle. Prove the resulting map

`specialization : Pic(𝒮_geometricGeneric) ≃ Pic(S)`

is a group isomorphism, with inverse, finite-extension independence and compatibility with tensor, dual, canonical class, cover algebra and isomorphisms of chosen lifts. These assertions are on Picard classes, not literal representatives or trivializations. They require the specified Enriques vanishings; an arbitrary smooth proper family has no such Picard specialization isomorphism.

Construct the pairing comparison integrally. For two extended bundles use constancy of coherent Euler characteristics and the polarization of surface RR,

`(L,M) = χ(L⊗M) − χ(L) − χ(M) + χ(O)`.

Prove that specialization preserves this pairing and its radical, hence descends to an integral isometry `numerical specialization : Num(𝒮_geometricGeneric) ≃ Num(S)`. This supplies every prime, including p, rather than only prime-to-p completions. An independent choice of lift is compared through the displayed special-fibre maps; no canonical lift is asserted.

**API — Picard specialization.**

- Construct mutually inverse specialization and formal-lifting maps on classes, independent of finite extension.
- Preserve tensor, dual, K, the cover algebra and integral intersection, and descend to the numerical quotient.

**Checks.**

- O specializes to O and K to the nonzero order-two class K; a rational comparison would erase the latter.
- For ruling classes F,G with F²=G²=0 and F·G=1 the RR polarization reads 2−1−1+1=1.
- A vertical special fibre is div(p), hence class 0; adding it changes a divisor representative without changing specialization.
- The trivial line has automorphism group R×, not a singleton, even though its Picard class lifts uniquely.

The displayed construction combines coherent existence with regular-model divisor extension; the isomorphism is restricted to the stated H¹/H² vanishings.

*Needs:* §1.1; SchemeAndStackFoundations §§4.10, 5.9–5.10; ComplexComparisonPartII C3.2d.1–C3.2d.2.

### 1.3 Characteristic-zero integral cohomology and descent

For a complex Enriques surface, use ComplexComparisonPartII's proper coherent GAGA and line-bundle dictionary, ComplexComparisonPartII C5.4's exponential sequence and integral Chern comparison, and AlgebraicTopology's integral sheaf/singular comparison and oriented Poincaré duality. The actual H¹(O)=H²(O)=0 gives `c₁ : Pic(S) ≃ H²(S_an,ℤ)`. Prove cup/intersection compatibility on those maps, identify its torsion quotient with the shared Num, and use Poincaré duality on the free quotient to prove unimodularity.

Apply WeilConjectures WC.7 to obtain b₁=0 and b₂=ρ=10; Poincaré duality gives b₃=0. Compare these supplied rational invariants with the integral groups constructed here. Hodge index on the existing Num then supplies signature(1,0,9). The canonical cover's algebraic construction and these basic cohomology inputs precede this calculation; no period map, global Torelli theorem or already computed Enriques Num is a premise.

Extend the result to any algebraically closed characteristic-zero field by finite-presentation descent and an embedding of a finitely generated field of definition into ℂ. Prove invariance of Pic and Num under algebraically closed extension on this Enriques domain using ComplexComparisonPartII C3.2d.2 `relative_picard_algebraicSpace`, its C3.2d.1 Picard-stack input and AlgebraicModuliForArithmeticGeometry7.6.1/7.6.1a relative sheaf/base-change and class/section comparisons, together with7.3 framed deformations. Verify proper flat finite presentation and universal functions on this geometrically integral domain, and retain the actual geometric-point/line-bundle-class identification and local finite presentation. Its H¹/H² vanishings then make it étale, and its geometric components are points. The scalar automorphisms belong to the Picard stack and are not discarded by an unexplained equality of line bundles. An arbitrary very large algebraically closed field need not embed in ℂ. For p>2 apply E1b to the geometric generic fibre and transport its integral rank, evenness, signature and unimodularity to S. This completes the p-primary discriminant step without a crystalline-cohomology assumption.

**API — Integral Chern and numerical comparisons.**

- Identify c₁ with the exponential connecting map and preserve cup/intersection with complex orientation.
- Retain integral torsion before passing to Num and compare under algebraically closed extensions.

**Checks.**

- The map exp(2πiu) sends integers 0 and 1 to 1; its kernel is ℤ.
- On P¹ the classes of O(1), O(−1) have degrees 1, −1, fixing the Chern sign.
- For the Enriques K, c₁(K) has exact order 2 and rational image 0; c₁(O)=0.
- The free form has rank 10 and signature (1,0,9); neither these values nor determinant alone determine a general integral form.

Dolgachev, §3, pp. 8–10, with the integral comparison supplied by ComplexComparisonPartII C5.4.

*Needs:* §1.2; WeilConjectures WC.7; ComplexComparisonPartII C1.9, C3.2d.1–C3.2d.2 and C5.4; AlgebraicTopology integral Poincaré duality; SchemeAndStackFoundations §5.10.

### 1.4 Coefficient-specific cycle comparisons

Use SchemeAndStackFoundations2.11 for the Kummer sequence with ℓⁿ invertible, [EtaleCohomologyFoundations F.0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md) for the actual μ_(ℓⁿ) twist, F.2.1/F.2.2 for proper/smooth base change, F.4.1–F.4.4 for normalized derived inverse limits and integral reduction, 0.9 for the normalized Chern class, and F.5–F.6 for smooth duality, trace, cup products and the algebraic/étale intersection comparison. F.6 supplies `etaleGaussBonnet` with the complex-orientation normalization.

For each prime ℓ different from the characteristic and n≥1 construct

`0 → Pic(S)/ℓⁿ → H²_et(S,μ_(ℓⁿ)) → Br(S)[ℓⁿ] → 0`,

with its actual transition maps, pullback, norm and coefficient compatibility. Retain the Brauer term and every coefficient transition. Apply ComplexComparisonPartII C6.3 `artinComparison`, C6.5 `artinSmoothTrace` and C6.6 `adicArtinComparison` for the finite/integral Betti comparison. Keep the chosen compatible root-of-unity coordinate, positive complex orientation, cup product and trace maps, finite reductions and normalized derived limits; GAGA alone is not this comparison. Compare the integral cycle map with the Betti Chern map in E1c and, for p>2, with E1b and proper smooth base change.

Prove the Milnor lim¹ vanishings only for the inverse systems that satisfy their actual Mittag–Leffler hypotheses; finiteness of each finite-coefficient cohomology group gives stabilization at each fixed level. Do not discard the derived-reduction term. On the complex branch put C=RΓ_et(S,ℤ₂(1)) and construct the exact sequence

`0 → H²(C)/2ⁿ → H²_et(S,μ_(2ⁿ)) → H³(C)[2ⁿ] → 0`.

Compute H³(C)=ℤ/2 using the simply connected canonical K3 cover from K3Surfaces K2, its degree-two deck action, the resulting π₁(S)=ℤ/2, and integral Poincaré/universal-coefficient comparison. Thus its displayed right term is ℤ/2 for every n≥1, and under the E1c Picard/Chern comparison it is the finite Kummer Brauer contribution. Prove this finite comparison with its transition maps: the maps on Br(S)[2ⁿ] are multiplication by2, so the inverse Tate module is zero although every finite term is nonzero. Distinguish this zero inverse limit from the surviving finite Tor term and from the separately vanishing Milnor lim¹. Transport the prime-to-p systems to the positive-characteristic lift by the stated finite/adic proper smooth comparisons. These computations use only K3 K1–K2 and E1b/E1c, never the later cover-period or automorphism theorem.

Retain canonical Picard two-torsion in the integral degree-two object, and quotient by precisely its torsion for the numerical comparison. Construct the pairing-preserving isomorphism

`Num(S) ⊗ ℤ_ℓ ≃ H²_et(S,ℤ_ℓ(1))/torsion`.

Identify the Picard torsion separately, in particular the nontrivial canonical class at ℓ=2. Neither the finite Kummer map nor a rational rank equality implies the integral discriminant theorem. The ℓ=p coefficients in positive characteristic are outside this Kummer assertion; E1b, not an extrapolation of it, supplies the integral conclusion.

**API — Kummer and integral coefficient maps.**

- Retain the Brauer term at finite level and its multiplication-by-ℓ transitions.
- Compare normalized Chern classes, trace and cup products through finite and integral Artin comparison.
- Separate derived-reduction Tor, Milnor lim¹ and the inverse Tate module.

**Checks.**

- At ℓ=2 each Br[2ⁿ] is ℤ/2, its transition is multiplication by 2=0, and its inverse limit is 0.
- At ℓ odd the canonical order-two class has zero image in ℓ-primary torsion; at ℓ=2 it survives.
- For n=1, H³(C)[2]=ℤ/2, so finite reduction cannot be just H²(C)/2.
- In characteristic p the µ_p cover has infinitesimal fibres; the étale Kummer statement requires ℓ≠p.

Dolgachev, §3, pp. 8–10; the integral refinement uses the stated coefficient and duality suppliers.

*Needs:* §§1.2–1.3; K3Surfaces K1–K2; EtaleCohomologyFoundations F.0.3, F.2, F.4–F.6; ComplexComparisonPartII C6.3, C6.5–C6.6.

### 1.5 Integral normal form and functorial marking

Apply IntegralLattices6A to the actual even, nondegenerate, indefinite unimodular Num of signature(1,9). Construct the integral isometry with U⊕E8(−1), its inverse, coordinate maps and compatibility with the integral pairing and rational/real extensions. Do not infer an isometry from determinant and rank, and do not substitute definite-only6C/6F for6A. Those definite clauses and Layer5 retain their own roles in the later E7/E8 and discriminant-gluing calculations.

**API — Integral marking.**

- Construct inverse isometries Num(S)≃U⊕E₈(−1) and compare scalar extensions.
- Changing a marking conjugates the ensuing orthogonal actions.

**Checks.**

- For a U basis e,f, e²=f²=0, e·f=1 and (e+f)²=2.
- The determinant is −1 and signature (1,0,9); U⊕E₇(−1)⊕⟨−2⟩ instead has determinant −4.
- Scaling the form by 2 multiplies determinant by 2¹⁰, so it cannot be the unscaled Num isometry.

Dolgachev, §3, p. 9; the even indefinite unimodular classification is supplied by IntegralLattices §6A.

*Needs:* §§1.2–1.4; IntegralLattices §6A.

### 1.6 Genus-one geometry follows the completed numerical comparison


Develop effective and nef classes, genus-one fibrations and half-fibres. Prove existence, the two tame double fibres in characteristic≠2, their relation by K, singular-fibre and restriction formulas needed below, and the invariance of these data under surface isomorphism. A half-fibre F has F²=0 and |2F| a genus-one pencil; it need not itself move. For big nef D define Φ(D) as the positive minimum of D·F over half-fibres; prove existence, positivity, numerical invariance and the bounds used in classification. Construct the effective-root reflection reduction to nef representatives with a terminating ample-height argument. Nodal means containing a smooth rational curve, and adjunction makes its square−2. Do not identify all lattice roots with effective nodal curves.

**API — Half-fibres, nef reduction and Φ.**

- Construct the genus-one pencil from |2F| and identify the second half-fibre with F+K.
- For big nef D prove the minimum Φ(D) exists, is positive and is invariant under numerical equivalence.
- Prove effective-root reflections preserve square and terminate the reduction to a nef representative by decreasing ample height.

**Checks.**

- For a half-fibre F, F²=0, h⁰(F)=1 and h⁰(2F)=2; the half-fibre is not the fibre class.
- For D=2F₁+F₂ with F₁·F₂=1, D²=4 and Φ(D)=1.
- D=0 has minimum intersection 0 and is excluded from the big-nef positive minimum.
- For an effective nodal root R and ample H, H·R>0 while H·(−R)<0, so numerical roots are not all effective.

Dolgachev, §4, pp. 11–13; genus-one carriers are supplied by the named owners.

*Needs:* §1.5; NeronModelsAndSemistableAbelianVarietiesPartII §2.1; WeilConjectures WC.7.

### Examples

A half-fibre and its canonical twist have the same numerical class and distinct Picard classes; their difference has exact order 2.

### Dependencies

Layer 0, WC.7, K3 K0.A/K1–K2, the polarized algebraization, coherent/exponential/étale comparisons and integral lattice classification listed per subsection.

## Layer 2: hyperelliptic systems and double covers

### 2.1 Hyperelliptic classification

For big nef D with Φ(D)=1 and D²=2n, n≥1, prove the classification into the systems nF₁+F₂, (n+1)F+R, (n+1)F+R+K, with F₁·F₂=1, F·R=1 and R a nodal curve. Pin actual linear equivalence and the canonical twist, uniqueness/ambiguity of witnesses, fixed divisors and base schemes. Call the first system type nonspecial and the latter two special in this low-degree-system terminology. Keep that system predicate separate from Averbukh's surface-level existence predicate.

For the moving square-four case n=2 prove h⁰=3, no fixed component, the two base points with their scheme structures, and the degree-two rational map to P² after base-ideal resolution. For higher n construct the corresponding scroll and actual map, not a dimension-only classification. At n=1 special h=2F+R has fixed R: prove |h|=|2F|+R. Thus the two-base-point assertion is never applied to every Φ=1 class regardless of fixed components.

**API — Hyperelliptic systems.**

- Classify linear equivalence, canonical twists, fixed parts and base schemes, including witness ambiguity.
- Construct scroll maps for n>2 and the resolved plane map for n=2.

**Checks.**

- For 2F₁+F₂, square=4, h⁰=3, and after the two base points the moving self-intersection is 4−1−1=2.
- For 2F+R with F·R=1 and R²=−2, square=2 and intersection with R=0; R is fixed at n=1.
- For 3F+R the square is 6−2=4 and R-intersection is 3−2=1; adding K does not change either value.

Cossec–Dolgachev–Liedtke, Proposition 2.6.1, pp. 290–291 (all-n classification and fixed part), Proposition 2.6.4 and Corollary 2.6.5, pp. 292–294 (base points and resolved map), and Proposition 3.2.1, pp. 308–309 (scroll image), in the April 19, 2024 author manuscript.

*Needs:* §1.6; §0.2; SchemeAndStackFoundations surface RR and curve restriction.

### 2.2 Finite double-cover algebra

Factor the resolved square-four map X→P² through a normal finite cover Y→P². Prove its degree, separability, finite flatness under the actual surface hypotheses and trace splitting. For a finite flat degree-two cover in characteristic≠2 build the actual algebra O⊕A⁻¹ with multiplication determined by b∈H⁰(A²), the deck involution, branch/discriminant, isomorphism and base-change API, and the canonical sheaf formula in its Gorenstein range. Reuse relative Spec and module algebra; do not install a second finite-cover or line-bundle carrier. Identify A=O(4) for the Enriques presentation, hence its branch divisor is an octic. The resolved map X→P² may contract curves and is not declared finite.

**API — Double-cover algebra.**

- Construct multiplication, trace, norm and deck involution on O⊕A⁻¹ from b.
- Prove isomorphism, pullback and discriminant formulas, and ω_Y≃f*(ω_B⊗A) for a smooth base in the finite-flat Gorenstein range.

**Checks.**

- For b=1 over a field with 2 invertible, k[t]/(t²−1)≃k×k; trace(a+ct)=2a and norm=a²−c².
- For b=0, t is nonzero nilpotent and norm(a+ct)=a²; the algebra is finite flat but not étale.
- In characteristic 2 with b=1 the algebra has (t−1)²=0; separability and trace splitting fail.
- A=O(4) gives b in O(8), hence branch degree 8; a degree-6 branch would use A=O(3).

Dolgachev, §4, pp. 12–13, for the double-plane model; the algebra and its maps are constructed on the supplied module carrier.

*Needs:* §2.1; AlgebraicVectorBundles L0A–L1; SchemeAndStackFoundations relative Spec and duality.

### 2.3 Branch resolution and plane models

Construct the branch-resolution comparisons on a smooth surface. Under a point blowup σ and branch multiplicity m, the transformed line is σ*A−⌊m/2⌋E and branch is strict(B)+(m mod2)E. Prove2A'=B', normalization and chart equations, inverse birational identification, canonical discrepancies and the induced resolved cover. Supply the finite point-blowup embedded resolution of the actual reduced plane branch curve in every allowed characteristic, including the explicit resolutions of the families used here; a characteristic-zero-only resolution citation cannot supply the source's positive-characteristic range. Smooth crossings of two odd branch components require their own blowup. Normal branch covers can have nonrational singularities; neither pg nor canonical positivity of Y is silently transferred to its resolution.

Construct the sextic-plus-two-distinguished-lines branch models, their actual base/infinitely-near data and the special and nonspecial linear-system constructions. Local singularities and degenerations retain their explicit equations and hypotheses. The displayed classical square-four construction and its canonical resolution fix the actual function field and maps; an arbitrary octic is not an Enriques example.

**API — Branch transform and resolved plane model.**

- Prove the transformed branch/line identity and compare the normal cover function fields.
- Construct resolution morphisms, canonical discrepancies and the distinguished-line and infinitely-near data.

**Checks.**

- At multiplicity m=1 the new branch is strict(B)+E and A′=σ*A.
- At m=2 the new branch is strict(B) and A′=σ*A−E; at m=3 it is strict(B)+E with the same A′.
- At an odd-odd transverse crossing m=2, blowup removes the double exceptional contribution; omitting this step leaves the cover singular.

Dolgachev, §4, pp. 12–13; the branch transform follows by removing the square exceptional factor in the local cover equation.

*Needs:* §2.2; StableReduction §4; SchemeAndStackFoundations §§4.11, 4.13; the embedded plane-curve resolution target in this subsection.

### Examples

A moving square-four class loses two simple base-point contributions, leaving a degree-two plane map.

### Dependencies

Layers 0–1, relative Spec, curve and blowup geometry; positive-characteristic resolution is retained as a target.

## Layer 3: presentation groupoids

### 3.1 Complete presentations and scalar rigidification

For a fixed S, let H₄(S) be the subset of actual LineBundleClass with big nef square4, Φ=1 and the moving complete-system conclusions of E2. Define the groupoid of complete projective presentations: an actual representative L, projective frame of H⁰(S,L), canonical base-ideal blowup, the induced resolved map and its O(1)/exceptional identity, and the normal finite cover/branch data derived in E2. Morphisms use a surface isomorphism, projective plane-coordinate change and induced resolution isomorphism with the actual commutative map equations. The core objects use the canonical base-ideal blowup, unique up to its universal isomorphism. Arbitrary extra blowups are not isomorphic resolutions: compare them by their maps to that core, and construct a separate localization at common refinements if such resolutions are admitted as objects. A bare birational source equivalence is not a core morphism.

Use the following raw morphisms of complete presentations. An arrow from (S,L,frame,canonical blowup,φ,derived cover) to the primed object consists of a base-field surface isomorphism a:S→S′, an actual invertible-sheaf isomorphism θ:L≅a*L′, the induced isomorphism of the scheme-theoretic base ideals and their canonical blowups, and b∈PGL₃ induced by θ on the chosen projective section frames. Require the resolved equation φ′∘ã=b∘φ and the pulled-back O(1)/exceptional identity. The normal cover arrow is the induced one on Stein algebras. It is not an independently chosen resolution arrow.

Composition uses the canonical pullback-composition isomorphism and composition of θ; inverse and identity use the corresponding unit/coherence maps. Prove these laws on the actual bundle, section and blowup maps. Scalar multiplication θ↦λθ, λ∈k×, changes neither a nor b nor the induced base ideal/resolution/cover map. On each nonempty fixed-(a,b) arrow fibre it acts simply transitively; this is the central scalar kernel removed by rigidification. The centre follows from naturality of global scalar multiplication. H⁰(O_S)=k identifies that kernel with k×, while the sheaf statement over more general bases retains global units.

Rigidify precisely this subgroup. Then descend projective-frame choices as an action-groupoid comparison, retaining isomorphisms rather than choosing one representative object per orbit. The functor sends an object to [L]∈H₄(S) and an arrow to a. For fixed a, a*L′≅L exactly when the corresponding class equation holds; after scalar rigidification the induced b and the canonical blowup arrow are unique. Full faithfulness uses E2's moving complete-system and hyperplane-recovery theorem, so a fixed divisor cannot be silently added to the same rational map. Construct an inverse, unit and counit with their naturality equations.

For the left action a·[L]=(a⁻¹)*[L], this gives the action-groupoid equivalence with Aut(S) acting on H₄(S). Surface automorphisms, including any actual deck-induced surface automorphism, remain arrows. Forgetting a finite cover's deck μ₂ is a separate operation, not the scalar rigidification here. The source's ChapterX equivalence and34780/136 remain distinct required reconciliation targets.

Prove the following precise intrinsic equivalence. After rigidifying scalar automorphisms of L and quotienting projective-frame choices, this presentation groupoid is equivalent to the action groupoid of Aut(S) on H₄(S). Give the forward functor, the inverse construction, unit, counit and naturality. A left action under functional-composition conventions uses a·L=(a⁻¹)*L; verify the corresponding native Aut/opposite convention rather than treating contravariant pullback as a covariant action. Full faithfulness uses recovery of the moving system from inverse images of hyperplanes and the no-fixed-component condition; rational maps alone cannot distinguish an added fixed divisor. Its isoclass statement is Presentations(S)/≅ ≃ Aut(S)\H₄(S), preserving the E2 types. This is a geometric theorem with a specified equivalence, not a declaration that the 1985 source chose this relation.

**API — Presentation groupoid and its equivalence.**

- Construct the raw arrows with the commuting resolved-map equation and coherent composition.
- Rigidify the scalar kernel, descend projective frames and give both functors, unit and counit of the action-groupoid equivalence.
- Use the left action a·L=(a⁻¹)*L, preserving the system type and surface stabilizers.

**Checks.**

- A scalar λ on L induces identity on its projective sections and canonical blowup; its raw arrow is nevertheless nonidentity when λ≠1.
- For automorphisms a,b, pullback reverses order, and ((ab)⁻¹)*=(a⁻¹)*∘(b⁻¹)* gives the stated left action.
- An extra point blowup adds an exceptional curve of square −1, so its resolution is not isomorphic to the canonical one.
- Adding a fixed divisor leaves the rational map unchanged; H₄ excludes it, making hyperplane recovery possible.

This is the intrinsic groupoid theorem defined here; Cossec–Dolgachev, Theorem 2, p. 247 does not specify this equivalence relation.

*Needs:* §0.3; §§2.1–2.3; AlgebraicModuliForArithmeticGeometry §2.

### 3.2 Branch presentations and minimalization

Compare the normal finite-cover/branch presentations of §2.2 separately, with nonzero branch section. On P², Pic has no2-torsion and every nonzero scalar has a square root over k; prove the resulting uniqueness on isomorphism classes of the double cover. The cover retains its deck μ₂ automorphism: forgetting it is not an equivalence of unrigidified groupoids. Birational minimalization recovers S only through the nonruled minimal-surface uniqueness theorem, with the actual graph and contraction maps. Prove the needed surface birational factorization/minimality adapter; do not identify arbitrary resolutions with a canonical plane presentation.

**API — Cover comparison and minimalization.**

- Prove class-level uniqueness of the double cover over P² with fixed branch under the stated square-root hypotheses.
- Retain deck isotropy and construct minimal-model comparison through actual contractions.

**Checks.**

- For a nonzero branch section the deck t↦−t has order 2 and fixes the branch datum; the forgetful fibre therefore has µ₂ isotropy.
- For b=0 in k[t]/(t²), every t↦ct with c∈k× is an automorphism; this nonnormal cover is excluded from the µ₂ assertion.
- Multiplying b by c² gives an isomorphic cover via t↦ct for c≠0; c=0 is not invertible.
- P² and P¹×P¹ are birational minimal rational surfaces with Picard ranks 1 and 2; omitting the nonruled hypothesis would give false uniqueness.
- The two line bundles with the same square on a base with nontrivial Pic[2] need not coincide; Pic(P²)[2]=0 is essential.

This is a constructed comparison, not a groupoid theorem attributed to the survey. In §2.2’s algebra, a fixed nonzero branch section determines its square-root line uniquely on P² because Pic(P²)=ℤ (Stacks, Lemma 31.29.5, tag 0BXJ); two sections with the same divisor differ by a global unit, which is a square over the algebraically closed field. The resulting cover isomorphism retains its deck μ₂. Construct the smooth projective surface birational-factorization adapter from point blowups (Stacks, Lemmas 54.17.1–54.17.2, tags 0C5R–0C5S), and the minimalization and uniqueness theorem for nonruled smooth projective surfaces over algebraically closed k (Cossec–Dolgachev–Liedtke, Theorem 1.1.3 and Remark 1.1.4(1), p. 201). These give the comparison with S using its minimality from §1.1; uniqueness is relative to the birational identification, not uniqueness of a chosen resolution.

*Needs:* §§1.1, 2.2–2.3, 3.1; StableReduction Layer 4’s blowup construction; the surface factorization and nonruled minimalization targets of this subsection.

### 3.3 Ordered systems and Picard lifts

For ample numerical h²=2 prove the unordered isotropic pair{f,g}, h=f+g, and build |2h| as the double cover of the four-nodal quartic del Pezzo. Keep an ordering and the actual chosen contraction to P². The systems2f+g andf+2g have square4 and produce the two ordered presentations; compute their Cremona comparison. Nonlinear Cremona equivalence is not projective equivalence. Different blowdowns are records or explicitly quotiented choices, never automatically one object.

For special D=3F+R(+K) construct h=2F+R. Prove h²=2, h·R=0, nefness, bigness and failure of ampleness. This boundary class is outside the ample carrier above. Its two Picard lifts and the canonical-twist systems remain distinct until the actual automorphism stabilizer action is determined. More generally construct the two-element Picard-lift torsor over each numerical class; prove the stabilizer action and the effect of changing a splitting of Pic→Num. An orbit of numerical classes contributes one or two lift-orbits according to that action; no unconditional factor two is permitted.

**API — Ordered double-plane records and Picard-lift torsors.**

- Construct both ordered systems and their actual Cremona comparison.
- Retain chosen blowdowns and the two-element Picard-lift torsor with its stabilizer action.

**Checks.**

- For h=f+g, f²=g²=0, f·g=1: h²=2 and (2f+g)²=(f+2g)²=4.
- The two ordered classes differ by f−g of square −2, so they are unequal.
- For h=2F+R, h²=2 and h·R=0; h is not ample.
- A trivial stabilizer action on the two Picard lifts gives two orbits, while a transposition gives one.

Dolgachev, §4, pp. 12–13; the Picard-lift bookkeeping refines that class-level geometry.

*Needs:* §§1.1, 2.1, 3.1–3.2.

### Examples

A transposition on a two-point Picard-lift torsor merges its two points into one orbit.

### Dependencies

Layers 0–2 and the groupoid/descent suppliers.

## Layer 4: Reye families and generic loci

### 4.1 Degeneracy schemes and symmetroids

Let V be the actual ten-dimensional module of quadratic forms on k⁴. Webs are four-dimensional subspaces, equivalently six-dimensional quotients with the kernel remembered, in the producer Grassmannian. On Gr(2,k⁴) the restriction of a web to a line is a map T→Sym²(U*) of ranks4→3; define the Reye subscheme by rank≤2, with its minors, universal ideal and arbitrary-base-change equations. Its points are exactly lines contained in a pencil of web quadrics. Prove codimension2 and the surface, smoothness and degree10 claims on the specified open regular locus by the actual degeneracy resolution/intersection computations; do not define it as an unnamed set of lines.

Construct the Plücker embedding, canonical bundle, cohomological Enriques invariants, nodal curves and degrees on that locus. Define the associated determinant quartic symmetroid, its ten rank-two nodes and their incidence data, resolution and K3 cover, deck involution and descent maps. Prove the explicit degree10/no-rational-curve-of-degree<4 recognition criterion and the canonical-twist reembedding where needed. Keep polarizations and underlying surfaces distinct.

**API — Reye degeneracy scheme and determinant symmetroid.**

- Construct the minors, universal ideal, arbitrary-base-change law and PGL₄ equivariance.
- On the regular locus prove codimension, smoothness, degree, Enriques invariants and the cover/incidence comparisons.

**Checks.**

- A map of ranks 4→3 with rank 2 has kernel dimension 2, giving a pencil; rank 3 has kernel dimension 1 and is excluded.
- The expected codimension is (4−2)(3−2)=2 in the four-dimensional Grassmannian of lines.
- A zero restriction map satisfies every 3-minor but is not a regular codimension-two point; regular-locus hypotheses cannot be dropped.
- A 4×4 symmetric matrix with linear entries has determinant of degree 4; Plücker degree of the regular Reye surface is 10, a different degree.

Cossec–Dolgachev, Proposition 2 and §4, p. 248; Dolgachev, §5, pp. 16–18.

*Needs:* §§0.1–0.2; AlgebraicModuliForArithmeticGeometry §§1.1–1.3; SchemeAndStackFoundations intersection theory.

### 4.2 Parameter quotients

Construct the PGL₄ action on webs and all maps. Build the actual quotient stack from the shared action-groupoid interfaces. Prove that the web stabilizer has finite generic fibre, then construct the invariant open where the inertia morphism is finite; a count of dimensions or finite abstract point stabilizers alone is insufficient. Apply the shared coarse-space theorem with its actual finiteness/separatedness hypotheses, construct a nonempty scheme open in that finite-type algebraic space, and compare its geometric fibres with the PGL₄ orbits. This supplies the needed parameter variety without assuming an uncommissioned reductive GIT theorem. Universal surface families remain on the web atlas/quotient stack; do not assert they descend to the coarse variety without the necessary stabilizer/descent proof. The web Grassmannian dimension is24 and PGL₄ has dimension15, but9 follows only after these actual quotient/inertia and dimension comparisons. Define each bad/singular/fixed-point condition used in the proof and a single explicit nonempty invariant open intersection. Exhibit a member or a genuine nonvanishing/open-density argument for nonemptiness. The generic-nodal theorem quantifies over this locus, never over every nodal degeneration. The cited complex assertion that generic nodal surfaces admit a Reye model is a separate coverage theorem, with the actual forgetful-map fibres and moduli comparison, not a dimension count.

**API — Web quotient and generic open.**

- Construct action, stabilizer and finite inertia on the open used by the coarse-space theorem.
- Identify geometric fibres with orbits and prove nonemptiness of the intersection of the required opens.

**Checks.**

- Gr(4,10) has dimension 4·6=24 and PGL₄ has dimension 16−1=15, yielding 9 only for finite generic stabilizer.
- A trivial PGL₄ action would leave quotient dimension 24, refuting dimension subtraction without stabilizers.
- A nontrivial stabilizer acts on the universal family over the stack; passing to the coarse point does not automatically descend that family.

Cossec–Dolgachev, §1, p. 247 and §4, p. 248; stack and finite-inertia comparisons are the specified construction route.

*Needs:* §4.1; AlgebraicModuliForArithmeticGeometry §2 and §3.5; SchemeAndStackFoundations §§1.13–1.23.

### Examples

The regular rank-two restriction locus has dimension 4−2=2; the web parameter quotient has dimension 24−15=9 under the stabilizer hypotheses.

### Dependencies

Layer 0, the surface comparisons of Layer 1, Grassmannians, degeneracy intersections and finite-inertia quotients.

## Layer 5: the two lattices and the faithful reflection action

### 5.1 Integral lattices

Use the single numerical lattice M≃U⊕E8(−1). An isotropic10-sequence fᵢ has fᵢ·fⱼ=1−δᵢⱼ and δ=(Σfᵢ)/3 integral, δ²=10, δ·fᵢ=3. Construct and compare the integral basis(f₁,…,f₉,δ), with f₁₀=3δ−Σ₁⁹fᵢ. Set β₀=δ−f₁−…−f₄ and βᵢ=fᵢ−fᵢ₊₁. Prove all pairings: βᵢ²=−2 and distinct adjacent pairings1 exactly for the chain1–…–9 and edge0–4. Their lattice R has determinant−4 and index2 in unimodular M; it is not M.

For r=δ−2f₁₀ prove r²=−2, r·βᵢ=0 for i<9 and r·β₉=−2. Prove R={x∈M:x·r even}, using inclusion and the determinant/index calculation, and construct its isometry with U⊕E7(−1)⊕⟨−2⟩ with explicit maps/inverses. Relate this algebraic construction to the actual geometric nodal-congruence class on the generic family. The source's square+2 Gram is−R and has signature(9,0,1). Track the sign conversion in every reflection and discriminant map.

**API — The marked lattices M and R.**

- Construct the integral β-span, parity-kernel comparison, index and Reye normal form with inverses.
- Track the sign change to the source form and extension to M by discriminant gluing.

**Checks.**

- The Gram on (f₁,…,f₉,δ) has determinant −1; the β Gram has determinant −4 and index 2.
- β₀·β₄=1 whereas β₀·β₃=0; all βᵢ²=−2.
- For r=δ−2f₁₀, r²=−2, r·β₉=−2 and r·βᵢ=0 for i<9.

Peters–Sterk, Appendix A.2, Lemma A.5, pp. 1624–1625.

*Needs:* §1.5; IntegralLattices §§1, 5, 6A, 6C/6F.

### 5.2 Coxeter comparison and normal kernels

First prove `coxeterGeometricFaithful`: for every index type I, group W, Coxeter matrix M and Coxeter system cs on W, the native real representation `CoxeterSystem.geometricRepresentation` on I →₀ ℝ is injective. No finiteness, nondegeneracy or positive-definiteness hypothesis is imposed. The standard form has diagonal 1 and off-diagonal entry −cos(π/m); native m=0 denotes an infinite Coxeter exponent, so that entry is −1 (Davis, second edition, §6.12, equations (6.32)–(6.33), pp. 108–109; Corollary D.1.2, p. 446).

Develop its root-sign theory on the orbit of the simple basis vectors: a positive root has all coordinates nonnegative and is nonzero, and a negative root is the negative of a positive root. Prove every root has exactly one sign, and ρ(w)eᵢ is positive precisely when ℓ(wsᵢ)=ℓ(w)+1, negative precisely when ℓ(wsᵢ)+1=ℓ(w). Establish transport under reindexing and restriction to standard parabolics. These are properties of the native form and representation, not assumptions on an arbitrary action. One proof route constructs the dual half-spaces, proves the rank-two sign alternative for finite and infinite exponents, and proves the half-space induction and chamber-disjointness theorem before deducing faithfulness and the right-multiplication root criterion (Davis, Lemma 4.8.3, pp. 51–53, Lemma D.1.5 and Theorem D.1.1, pp. 446–448). The half-space induction is a target here; it is not imported as a consequence of pairwise reflection orders. For an infinite I, carry out the induction on finite words and their finite coordinate supports, with no interior in an infinite-dimensional topology required.

**API — General geometric faithfulness and root signs.**

- Prove injectivity for every native Coxeter system, including degenerate and indefinite forms.
- Prove the two root-sign/length equivalences, with right multiplication by the simple generator and disjoint positive and negative root sets.
- Compare the action and the signs under index equivalences and standard-parabolic inclusions.

**Checks.**

- For I empty, W is trivial and the zero vector space has one endomorphism; the representation is injective. In rank one, e maps to −e under s, ℓ(1)=0 and ℓ(s)=1; the zero vector is not a root.
- In A₂, ρ(s₁)e₂=e₁+e₂ and ℓ(s₁s₂)=2, whereas ρ(s₂s₁)e₁=−e₁−e₂ and ℓ(s₂s₁s₁)=1. The identity action would fail the simple-root negation equation.
- For the infinite dihedral matrix, B=[[1,−1],[−1,1]] has determinant 0; (s₁s₂)ⁿe₁=(2n+1)e₁+2ne₂, giving (1,0), (3,2), (5,4) for n=0,1,2. Degeneracy does not destroy faithfulness.
- For T246, the positive integral Gram 2B has determinant −4 and signature (9,0,1); its chain 1–9 is positive definite of determinant 10, so the negative determinant forces exactly one negative direction. This indefinite case is in the theorem's domain.

Define the ten-generator W as the image of the actual integral simple reflections, and the abstract T246 Coxeter matrix with diagonal1, adjacent3 and other off-diagonal2. Use the native geometric representation and prove their faithful comparison, using the general faithfulness theorem above; 2 times the native standard real form is the positive integral Gram. Finite E7/E8 parabolic subgroups use their existing finite-root/Coxeter API. The group generated by ALL roots of R is larger than W: construct the extra reflection in r, its normal closure and the exact chamber/semidirect comparison needed for the nodal ample cone. Neither finite-root positive-definiteness nor equality of rank/determinant proves these facts.

Define B and K as the longest elements in E8 on{0,2,…,8} and E7 on{0,1,…,6}; let G be the longest element in E7 on{0,2,…,7} times s₉, with the rightmost reflection applied first. Construct these elements and actual matrices. Define W(2) as the kernel of action on R/2R and prove it equals the normal closure of B,K. Define Wbar(2) by normal closure of B,K,G.

**API — Coxeter generators and normal kernels.**

- The graph predicate `reyeAdjacent` and its decision instance `reyeAdjacentDecidable` determine `reyeCoxeterEntry` and `reyeDiagram`; prove the integral/real reflection comparison.
- Define `reyeRealPairing` on ℝ¹⁰ by diagonal 2 and edge entries −1. Prove `reyeGeometricFaithful`: the reflections x↦x−reyeRealPairing(x,eᵢ)eᵢ extend to an injective representation of this T246 Coxeter group, and compare it with the native standard representation by the factor-two form identity.
- Construct B,K,G from the finite parabolics and prove the two normal-closure descriptions with quotient and conjugation laws.

**Checks.**

- The diagonal entry is 1, entry (0,4) is 3, and entry (0,3) is 2; adjacency is symmetric and irreflexive.
- The real pairing has values 2 on (e₀,e₀), −1 on (e₀,e₄), and 0 on (e₀,e₃). For β²=−2 the reflection sends β to −β; the native real form has B(β,β)=1 and −intersection=2B.
- The roots on {0,2,…,8} form E₈, while {0,1,…,6} and {0,2,…,7} form E₇; the latter G includes s₉.
- Two adjacent mod-two reflections have product of order 3; two distinct nonadjacent ones commute and have product order 2.

Cossec–Dolgachev, Proposition 1, p. 248; Peters–Sterk, Lemma A.5, for the indefinite lattice/chamber comparison.

*Needs:* for the general theorem, the native representation, exchange, length and parabolic declarations listed in the supplier contracts, real trigonometry and the half-space induction constructed here; for T246 and its normal kernels, §5.1, the general theorem of this subsection and RootSystems Layer 4’s finite-parabolic longest elements.

### 5.3 The reduction and its two kernels
 Use the β-basis of R to identify
H=R/2R with F₂¹⁰, writing e₀,…,e₉ for its coordinate vectors. The
index-two inclusion R→M does not identify H with a subspace of M/2M.
Define q(x)=(x,x)/2 modulo2, with polar form b(x,y)=(x,y) modulo2.
In these coordinates q(x)=Σᵢxᵢ+the sum of xᵢxⱼ over the unoriented edges {i,j}, with each
T246 edge counted once. Prove that the radical of b is exactly
⟨u,z⟩, where u=e₀+e₅+e₇+e₉ and z=e₁+e₃+e₅+e₇+e₉.
Prove q(au+bz)=b for a,b∈F₂. Thus the quadratic form does not descend
to H/rad(b), although the polar form induces a nondegenerate alternating
form on that eight-dimensional quotient.

Choose a linear complement V to rad(b), put q_V=q|V, and write
x=v+au+bz. Construct the full group of q-isometries fixing rad(b)
pointwise and its split description V*⋊Sp(V). Its shears are
T_ℓ(v,a,b)=(v,a+ℓ(v),b), and a section of the symplectic projection is
S_g(v,a,b)=(gv,a,b+q_V(gv)+q_V(v)). Prove these formulas are linear
isometries, their composition and inverse laws, and their exhaustiveness;
the action on V* is g·ℓ=ℓ∘g⁻¹. Compare different complements and
symplectic bases by the induced isometries and conjugacies.

Prove that the reductions of the ten simple reflections fix rad(b)
pointwise and induce a surjection W→Sp(V). Compute the reduction of G
on H explicitly as G(x)=x+x₈u; x₈ vanishes on rad(b) and gives a
nonzero functional on V. Conjugating this shear and using the natural
Sp(V)-action on V* must supply every shear. Deduce the actual reduction
image W/W(2)≃V*⋊Sp(V), the identification Wbar(2)/W(2)≃V*, and
the exact sequence 1→V*→W/W(2)→Sp(V)→1 with its constructed splitting.
In particular W→Sp₈(F₂) has kernel Wbar(2), whereas W(2) is its
strictly smaller full mod-two kernel. Construct the quotient maps and
inverse comparisons from these actions and generator calculations.

Supply generator/evaluation/normality/quotient/isometry/restriction/marking-change APIs. Prove that the actual over-lattice gluing determines the extension of the relevant R isometries to M. Prove the tame characteristic condition corresponds to the primes of |Sp₈(F₂)|=2¹⁶3⁵5²7·17. No group quotient is defined by stipulating this order.

**API — Quadratic reduction and its full image.**

- Define `ReyeReduction` as Fin 10 → ZMod 2; `reyeQuadratic` is the displayed half-norm and `reyePolar` its polarization.
- Prove `reyeReductionImage`: the simple-generator formula determines a homomorphism whose image is exactly the quadratic isometries fixing the polar radical pointwise.
- Construct both quotient maps, the shear inclusion and symplectic splitting, with inverse, conjugacy and complement-change laws.

**Checks.**

- q(0)=0, q(e₀)=1 and q(e₀+e₄)=1; counting both orientations of the edge would give 0.
- The polar radical has four vectors 0,u,z,u+z, with q-values 0,0,1,1; q does not descend to the quotient.
- For G(x)=x+x₈u, G(e₈)=e₈+u≠e₈ and G²(e₈)=e₈; its action on the symplectic quotient is identity.
- For a simple generator, eᵢ is fixed, a neighboring eⱼ goes to eⱼ+eᵢ and a nonneighbor is fixed.
- The symplectic quotient has order 47,377,612,800=2¹⁶·3⁵·5²·7·17, and the full image has 2⁸ times that order.

Cossec–Dolgachev, §2, p. 247 and Proposition 1, p. 248 specify the quotient/kernels; the full-image refinement is derived here from the displayed radical and shear actions.

*Needs:* §§5.1–5.2; native finite vector spaces and linear equivalences.

### Examples

The shear G fixes the eight-dimensional symplectic quotient but moves e₈ by u, distinguishing the two kernels.

### Dependencies

Layer 1 integral marking, native Coxeter representations, finite-root and lattice suppliers, and §5.2’s general geometric faithfulness and root-sign theory.

## Layer 6: surface automorphism groups

### 6.1 Generic nodal Coble action

Construct the marked ten-node symmetroid/Reye parameter space and the actual Coble transformations on its open charts, with inverse and transition equations and Coxeter relations. Compare this geometric action with E5 on lattice markings, including Picard lifts and canonical twist. Build the centralizer/descent sequence for the K3 cover and identify the surface automorphisms by actual maps. Prove faithfulness of the needed numerical/geometric representation on the stated generic locus; do not assume every numerical isometry lifts to a surface automorphism.

Identify the normal kernel Wbar(2) by the actual parameter action and prove Aut(S)≃Wbar(2), with both maps, inverse laws and marking conjugacy. Under characteristic zero or p outside{2,3,5,7,17}, prove the required good open locus is nonempty and the finite quotient action has the prescribed freeness. Faithful finite-action fixed-locus arguments, liftability, separability and use of the characteristic hypothesis are separate steps; invertibility of the group order alone is not a freeness proof.

Prove the source's rational-curve transitivity for Aut(S), with the same generic/field hypotheses, using actual effective curves and the exact normal-subgroup/chamber comparison. Transitivity under the larger W is insufficient. Construct the Bertini/Geiser/Kantor involution models used in the generators, their actual double-cover maps, exceptional curves and induced matrices, and reconcile the symmetroid and intrinsic descriptions.

**API — Coble action and generic nodal automorphisms.**

- Construct chart transformations, inverses, Coxeter relations and marking-equivariant lifts to actual surfaces.
- Identify Aut(S) with Wbar(2) and prove transitivity on actual smooth rational curves on the same nonempty open.

**Checks.**

- Characteristic 11 does not divide the finite quotient order; characteristics 2,3,5,7,17 do.
- An order-two projective action [x:y]↦[−x:y] fixes [0:1] and [1:0] even in characteristic zero; invertibility of the order does not prove freeness.
- The simple reflection in an effective root sends that root to its negative; it cannot by itself be a surface automorphism preserving effectivity.

Cossec–Dolgachev, §1 and Theorem 1, p. 247; Theorem 3, p. 248; §5, pp. 248–249.

*Needs:* §§2.2, 3.1, 4.1–4.2, 5.1–5.3.

### 6.2 Complex unnodal covers, periods and descent

The unnodal comparison has its own required producer, [K3Surfaces K0–K6, K7.A–B and §7.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/K3Surfaces/README.md). Keep the complex period-theoretic very-general statement and the algebraic generic-open statement as distinct theorems. Neither is an input to the preceding tame positive-characteristic nodal Reye/Coble theorem. A general nodal surface, an unnodal surface and the source's model classes are three different carriers.

**U0 — actual cover and markings.** For a complex Enriques surface S, form the canonical finite étale cover π:Y→S from E1's actual canonical algebra. Use E1's integral numerical-lattice isometry Num(S)≃M=U⊕E₈(−1); this theorem is not supplied by comparing ranks. K3K0/K1 identifies Y as an algebraic/analytic K3. Construct the primitive pullback π*:Num(S)(2)→H²(Y,ℤ), the invariant lattice S₊=M(2), the anti-invariant T=U⊕M(2), and the actual markings and discriminant anti-isometry γ by comparison with the independent model of K3Surfaces K7.A. The scaling equation is (π*x,π*y)=2(x,y). Do not replace π* by an unscaled integral isometry. In coordinates Λ=U₀⊕U₁⊕U₂⊕E_a⊕E_b the deck action is (−1,swap,swap), as specified in K3Surfaces K7.A.

Construct the canonical-cover adapter here: prove that primitive pullback identifies Num(S)(2) with the invariant lattice and construct its discriminant gluing with the anti-invariant lattice. Construct lifting of surface isomorphisms through the canonical algebra and effective finite-étale descent. Every automorphism has two lifts, differing by the deck involution; establish Aut(S)≃Centralizer(ι)/⟨ι⟩ with composition and marking-change laws. These are Enriques constructions after Layer 1, not consequences imported from K3Surfaces K7.C (Peters–Sterk, §2 and Proposition A.6).

**U1 — the precise very-general condition.** On one component of the type-IV domain Ω_T define the free-cover period locus by K3Surfaces §7.3, ‘Free and nodal period loci’: remove the hyperplanes perpendicular to square −2 vectors in T for the free locus, then the hyperplanes perpendicular to primitive square −4 vectors of divisibility two for the unnodal locus. Here divisibility is the positive generator of the pairing ideal in ℤ; K7.B supplies the geometric fixed-locus theorem used by §7.3. Remove the rational hyperplanes that would enlarge NS(Y) beyond S₊. In addition, for each a∈O(T) other than ±id remove every proper locus on which a fixes the period line. Such loci may be projective eigenspace intersections, not merely rational hyperplanes. Prove none fills Ω_T: an integral linear isometry that fixes all lines of its open isotropic quadric is scalar, hence is ±id. Since the integral isometry group is countable, local period charts and Baire give a nonempty dense complement in every nonempty appropriate period ball. Construct a free algebraic cover at such a period using K3Surfaces K6, K7.B and §7.3; the positive class in S₊ supplies projectivity. Denote this complement Ω_T^vg. Its properties are

    NS(Y)=S₊,   O_Hdg(T)= {id,−id},   S is unnodal.

The second condition is not deduced from the first. No (−2)-class lies in S₊ because every square there is divisible by4; K3K6.B consequently identifies the ample cone of Y with its positive component. The countable complement is a *very-general complex* locus, not by this argument a finite-type Zariski-open locus. All resulting statements are invariant under the specified marking changes and pass to the marked-family groupoid.

**U2 — restriction, gluing and descent.** Define O⁺(M) using the positive-cone component containing an ample class, and

    Γ(2)=ker(O⁺(M)→O(M/2M)).

Here O(M/2M) means the orthogonal group of the quadratic form q(x mod2M)=(x,x)/2 mod2, not merely the group preserving its alternating polar form. Identify A_(M(2)) with M/2M using M's unimodular pairing and the *same* numerical marking. K3Surfaces K7.A gives extension of a pair (g,h) on S₊⊕T exactly when γḡ=h̄γ. For every g∈Γ(2), the pair (g,id_T) therefore extends to an integral Hodge isometry of H²(Y,ℤ). It preserves the actual ample cone at Ω_T^vg, so K3K6.A produces a unique automorphism of Y. Its cohomology action commutes with the deck involution; K3 cohomological faithfulness proves actual commutation. Descend it along π to an automorphism of S, and prove its action on Num(S) is g.

Conversely lift an automorphism of S to Y through the actual cover algebra. Its anti-invariant Hodge action is ±id_T. Since A_T has exponent2, either sign acts identically on A_T. Integral gluing forces the numerical action to lie in Γ(2). If the numerical action is identity, the lifted action on H²(Y,ℤ) is id on S₊ and ±id on T; these are respectively the identity and the deck involution. K3 Torelli faithfulness and finite-étale descent show that the original automorphism of S was identity. Thus restriction and the constructed descent map are inverse group homomorphisms

    Aut(S) ≃ Γ(2)

on the stated very-general complex locus. Supply identity/composition/inverse equations, conjugacy under re-marking, and the equivalent centralizer/deck quotient. The argument computes the kernel here; it does not assert numerical faithfulness for every Enriques surface from the lattice alone.

**U3 — the T237 identification in the same lattice.** Use E5's isotropic ten-sequence f_i in M and δ=(Σf_i)/3. Set α₀=δ−f₁−f₂−f₃ and α_i=f_i−f_(i+1), 1≤i≤9. Prove these ten vectors are an integral basis of M, with square−2, consecutive-chain pairings1 and α₀ attached to α₃. The Gram determinant is−1. This is T237; E5's four-f-vector β₀ attached to β₄ instead spans the index-two T246 lattice R and must not be substituted. Construct the chamber action of the simple reflections s_α(x)=x+(x,α)α, prove they generate O⁺(M) by a well-founded ample-height descent argument on positive integral vectors, and prove the Coxeter presentation using RootSystems Layer 3's exchange/deletion theorem and §5.2’s general geometric faithfulness theorem with its actual geometric action. Keep chamber orientation and inverse maps in the presentation equivalence. Define W_T237(2) as the kernel of its *actual* reduction action on M/2M. U2 then gives Aut(S)≃W_T237(2), not W_T246(2), not the T246 symplectic quotient and not an all-root group chosen by matching notation.

**U4 — full geometric lift criterion beyond the very-general locus.** Retain a theorem for every complex unnodal canonical cover: a specified numerical isometry g lifts precisely when there is an integral Hodge isometry h of the actual anti-invariant lattice satisfying γḡ=h̄γ and whose glued action preserves the actual ample cone. Construct the set/group of compatible pairs, the cohomology lift and the deck quotient, with all restriction and descent maps. Very-general U2 is a specialization with h=±id. Special rank-ten covers can have additional anti-invariant Hodge isometries; their existence is not excluded by NS(Y)=S₊. Preserve their actual extra automorphisms and stabilizers rather than force the generic group onto them.

**API — Marked covers, periods and compatible pairs.**

- Construct primitive pullback, discriminant anti-isometry and the centralizer/deck quotient.
- Define the very-general locus by both Picard rank and Hodge stabilizer conditions and construct the compatible-pair lift criterion for every complex unnodal cover.
- Prove the inverse Aut(S)≃Γ(2) maps on that locus and identify Γ(2) with the actual T237 reduction kernel.

**Checks.**

- For e·f=1, (π*e)·(π*f)=2; using an unscaled isometry would give 1.
- In T=U⊕M(2), e′−f′ in the U(2) summand has square −4 and divisibility 2, while e−2f in U has square −4 and divisibility 1; only the former meets the nodal-hyperplane condition.
- In M(2) every norm is divisible by 4, excluding roots of norm −2; its discriminant has 2¹⁰ elements.
- On the exponent-two discriminant, +id and −id agree; on T itself they differ, producing the two lifts modulo the deck action.
- An extra Hodge isometry on a special period is not ruled out by NS=M(2); the ±id condition is separately imposed.
- The T237 extra root meets α₃ and has Gram determinant −1; the T246 extra root meets β₄ and has determinant −4.

Peters–Sterk, §2 and Proposition A.6, pp. 1625–1626; the very-general specialization uses the stated Torelli and period suppliers.

*Needs:* §1.5; §5.2; K3Surfaces K0–K6, K7.A–B and §7.3; IntegralLattices §§1, 5.

### 6.3 Algebraic generic-open comparison

Independently construct the algebraic local-family proof of the generic unnodal statement. On an étale atlas for unnodal Enriques surfaces over algebraically closed fields of characteristic different from2, own the following finite construction. First construct the bielliptic involutions from every pair of half-fibres and prove that their numerical actions generate the subgroup W_T237(2); prove numerical faithfulness on unnodal surfaces by the actual genus-one pencil and canonical-cover geometry. Define extra automorphisms as the resulting quotient, and prove the required finite-group restrictions by their actions on the genus-one pencils, not by assuming the desired generic conclusion.

Construct the finite W_T237(2)-orbit set of primitive isotropic nef classes from the reduction action on M/2M, and prove its comparison with actual genus-one fibrations, with fibre class2F and half-fibre F retained. Use the finite quadratic-space computation for its527 orbits; this number is not either of the source's34780/136 model counts. After an étale base change extend the chosen finite set of pencils and the two marked double fibres in the local Enriques family. Construct their relative Jacobian rational elliptic surfaces, sections, marked base points, discriminants and minimal Weierstrass charts. Classify the possible nontrivial extra base actions on those actual charts, compute their fixed loci modulo the legitimate coordinate changes, and obtain bounds on the dimensions of the order-two/order-four loci in the marked rational-elliptic-family parameters.

Prove the comparison from Enriques deformations to the finite collection of marked Jacobian deformations is unramified: identify its kernel as the infinitesimal difference of the genus-one torsors. The double-fibre/bisection structure makes this kernel2-torsion, while the infinitesimal coherent deformation difference is p-torsion in characteristic p; for p≠2 they have zero intersection. In characteristic zero use the corresponding multiplication-by2 isomorphism on the infinitesimal tangent group. Keep the existence and base-change of these torsors and their relative Jacobians as actual constructions, not an assertion that a Jacobian determines every torsor globally.

Construct a smooth local ten-dimensional family/atlas and the finite union of the relevant closed exceptional-locus closures. Prove the extra-automorphism≥2 closure has dimension≤5 and the extra-automorphism≥4 closure dimension≤2 in that local family, with the precise geometric fibres and inertia accounted for. Its complement is therefore a nonempty Zariski open on which Aut(S)≃W_T237(2). Prove overlap invariance and the exact passage to the intended generic moduli statement; a coarse moduli space alone is not a universal family. In the complex case compare this open-locus theorem with U1–U2 on their intersection. Do not claim that the very-general period set equals the whole algebraic open complement.

The algebraic generic-family proof and the complex period proof are both part of the programme. The former does not turn K3 global Torelli into a positive-characteristic theorem; the latter does not prove the tame nodal Reye statement. The primary refinement is [Martin, *Automorphisms of unnodal Enriques surfaces*](https://arxiv.org/html/1908.00049), especially its local-family generic-locus theorem. The local-family hypotheses and dimension bounds are those of Martin, Lemma 5.4, pp. 16–19, and Corollary 5.5, p. 19, in arXiv:1908.00049v1.

**Source boundary.** These outputs commission the cited generic unnodal comparison and its lattice/action dictionary. They neither identify the source's unlabeled representation relation with E3's chosen intrinsic groupoid nor establish34780/136. Layer 7 specifies the exact equivalence and stabilizer/fibre enumeration separately; the Chapter X relation is not identified with the intrinsic groupoid without that comparison.

**API — Unnodal local families and extra automorphisms.**

- Extend the finite list of pencils and marked double fibres étale locally and construct their relative Jacobians.
- Prove the tangent comparison and finite exceptional-locus dimension bounds with overlap invariance.
- Identify the automorphism group on the resulting nonempty open, separately from the very-general period complement.

**Checks.**

- The split ten-dimensional quadratic space has 528 isotropic vectors including 0, hence 527 nonzero isotropic vectors/pencil orbits.
- In characteristic 3, a tangent class killed by both 2 and 3 is killed by 3−2=1 and is zero; in characteristic 2 this argument fails.
- A ten-dimensional local family minus a finite union of closed subsets of dimension at most 5 is nonempty; the order-four bound is 2.
- A countable union of proper analytic loci need not be a finite Zariski closed set; the two generic loci are not equated.

Martin, Theorems 1.2/1.4, Proposition 1.9, Theorem 3.7, Lemma 5.4, pp. 16–19, and Corollary 5.5, p. 19.

*Needs:* §§1.6, 6.2; the relative Jacobian construction in this subsection; AlgebraicModuliForArithmeticGeometry §7.3.

### Examples

The deck involution is nontrivial on T and trivial on S₊; it descends to identity on the Enriques surface.

### Dependencies

Layers 1–5; independent K3 period/Torelli/involution results for the complex branch and local Jacobian deformation theory for the algebraic branch.

## Layer 7: finite orbits and the source representation bridge

### 7.1 Orbit decomposition

First prove the intrinsic groupoid theorem of E3 and construct the effective Aut action on every relevant numerical class, Picard-lift torsor, ordered half-fibre system and blowdown record. A W action on lattice markings does not automatically act on the same Picard systems or preserve the chosen nef chamber. Construct the recentering/lifting comparisons and prove the exact fibre relation before using any orbit calculation.

For each actual carrier used in the finite reduction, prove a finite and exhaustive type decomposition, complete representatives and stabilizers. If H is normal in W, Q=W/H finite and a component is W/K, prove `H \ (W/K)` ≃ `Q / image(K)`. Sum the resulting indices only over the proved disjoint components; retain extra Picard-lift and contraction fibres with their actual stabilizer action. For more general carriers give the corresponding explicit groupoid/orbit comparison instead of assuming this formula applies. Counts here are unweighted cardinalities of isomorphism classes, never stack mass weighted by inverse automorphism orders. Prove exhaustiveness and stabilizer identities on the specified finite actions; cardinality equality alone is not a geometric bijection.

**API — Orbit comparison.**

- Construct the bijection from H-orbits of W/K to right cosets of image(K) in W/H for normal H.
- Prove disjointness and exhaustiveness of all components and include Picard-lift fibres with their stabilizer action.

**Checks.**

- For W=S₃, H=A₃ and K=⟨(12)⟩, both sets have cardinality 1.
- For H={1} and the same K, both sets have cardinality 3; for H=W both have cardinality 1.
- For a transitive action with stabilizer of order 2, one orbit contributes 1 to the unweighted count, not 1/2.

The normal-subgroup orbit identity follows directly from the two quotient maps; the application is the representation comparison of Cossec–Dolgachev, Theorem 2, p. 247.

*Needs:* §§3.1–3.3; §§5.2–5.3; §6.1.

### 7.2 Source representations and regular Cremona moves

Keep the parallel Coble problem explicit. Construct the carrier of quartic symmetroids with their ten-node and marking data, its projective isomorphisms and the specified regular Cremona moves. Prove on the actual charts when these moves induce isomorphisms of the resolved K3/Enriques models, with inverse, composition and incidence transport. Compare this move relation and projective-class count with the plane-presentation records only by explicit constructions in both directions. Ordinary birational equivalence or a projective-coordinate change cannot replace a regular Cremona move by notation. The announcement's reconstruction of Coble's result is a required comparison programme, not an extra count already supplied by E3.

The source announces34780 nonspecial and136 special nonisomorphic double-plane representations and delegates its terminology to Averbukh ChapterX. Reconstruct the exact source relation and type predicate on actual representation data. Prove the comparison with E3, specifying whether it identifies projective coordinate changes, surface automorphisms, different blowdowns, canonical twists, or the two Cremona-related ordered maps. The double-plane construction and a surface-level existence predicate do not by themselves decide this equivalence. This identification is a required construction, not an arbitrary equivalence chosen to obtain the desired integers.

Determine the cardinalities from the proved representation/orbit bijection and exact arithmetic, and prove the comparison with the announcement's 34,780 and 136 (Cossec–Dolgachev, Theorem 2, p. 247). These numerical claims depend on its Chapter X relation, not solely on the intrinsic groupoid. In particular34780=2²·5·37·47 cannot be the single index of a subgroup of Sp₈(F₂); any proof using E5 must explain the genuine multiple-type/fibre mechanism.136 equals the number of even quadratic refinements in dimension8, but that equality alone is not a classification of special plane models. Neither count is assumed as a defining property of a carrier or made an unconditional proved theorem by this specification.

**API — Source representation relation.**

- Construct regular Cremona moves, inverses and incidence transport on the actual symmetroid and plane models.
- Specify the Chapter X relation and compare its projective, surface, twist and contraction identifications with the intrinsic groupoid before counting.

**Checks.**

- 34,780=2²·5·37·47 has prime factors 37 and 47 absent from |Sp₈(F₂)|, so it cannot be one subgroup index.
- There are 2³(2⁴+1)=136 even quadratic refinements in dimension 8; equality of this integer alone supplies no presentation bijection.
- A nonlinear quadratic Cremona transformation has degree 2, whereas a projective coordinate change has degree 1, so the two relations differ.

Cossec–Dolgachev, §1 and Theorem 2, p. 247, with its reference to Averbukh Chapter X; the precise source relation is not certified by the announcement alone.

*Needs:* §7.1; §§2.3, 3.1–3.3, 4.1, 6.1.

### Examples

The S₃/A₃ example gives one double coset; the 34,780 divisibility test rules out a single Sp₈ subgroup index.

### Dependencies

Layers 2–6 and the specified source representation relation.

## Downstream consumers

EnriquesSurfacesAndIntegralNonexistence consumes the characteristic-sensitive surface geometry, and FourManifolds F7 compares its topological Enriques model. The canonical-cover adapter stays here; K3Surfaces' independent inputs do not consume it. The complex period branch and the algebraic generic-family branch give separate comparisons with the automorphism action.

## References

- Cossec–Dolgachev, *On Automorphisms of Nodal Enriques Surfaces*, Bulletin AMS 12 (1985), pp. 247–249: §1 (field and generic-locus hypotheses), Theorem 1 (nodal automorphisms), Theorem 2 (announced representation counts), Theorem 3 (rational-curve transitivity), Proposition 1 (the two normal kernels), Proposition 2 (Reye recognition). [Author copy](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/nodal85.pdf).
- Dolgachev, *A brief introduction to Enriques surfaces*, arXiv:1412.7744v2: §3, pp. 7–10 (invariants and numerical lattice), §4, pp. 11–15 (polarizations and double planes, especially p. 12 for the degree-two map and octic branch), §5, pp. 15–18 (nodal geometry), §6, pp. 19–26 (automorphisms). [Preprint](https://arxiv.org/abs/1412.7744).
- Martin, *Automorphisms of unnodal Enriques surfaces*, arXiv:1908.00049v1: Theorems 1.2 and 1.4, Proposition 1.9, Theorem 3.7, Lemma 5.4 and Corollary 5.5. [Preprint](https://arxiv.org/abs/1908.00049).
- Peters–Sterk, *On K3 double planes covering Enriques surfaces*, Mathematische Annalen 376 (2020), pp. 1599–1628: §2 (cover lattice), §5 (automorphism comparison), Appendix A.2, Lemma A.5 (Reye lattice), Proposition A.6 (integral gluing). These are complex statements. [Institutional copy](https://pure.tue.nl/ws/portalfiles/portal/149561221/Peters_Sterk2020_Article_OnK3DoublePlanesCoveringEnriqu.pdf).
- Averbukh, Chapter X in Shafarevich (ed.), *Algebraic surfaces*, Proceedings of the Steklov Institute 75 (1964 Russian edition). This is the terminology source cited in Cossec–Dolgachev, Theorem 2; its precise equivalence relation is a separate source-reconciliation condition in §7.2.
- Cossec–Dolgachev–Liedtke, *Enriques Surfaces I*, author manuscript dated April 19, 2024: Theorem 1.1.3 and Remark 1.1.4(1), p. 201; Proposition 2.6.1, pp. 290–291; Proposition 2.6.4 and Corollary 2.6.5, pp. 292–294; Proposition 3.2.1, pp. 308–309. [Author copy](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf).
- Stacks Project, [Theorem 30.28.4, tag 089A](https://stacks.math.columbia.edu/tag/089A), for polarized algebraization; [§54.17, Lemmas 54.17.1–54.17.2, tags 0C5R–0C5S](https://stacks.math.columbia.edu/tag/0C5Q), for surface birational factorization; [Lemma 31.29.5, tag 0BXJ](https://stacks.math.columbia.edu/tag/0BXJ), for Pic(P²).
- Davis, *The Geometry and Topology of Coxeter Groups*, second edition (2025): §6.12, equations (6.32)–(6.33), pp. 108–109; Lemma 4.8.3, pp. 51–53; Theorem D.1.1, Corollary D.1.2 and Lemma D.1.5, pp. 446–448. [Author copy](https://people.math.osu.edu/davis.12/second_edition.pdf).
