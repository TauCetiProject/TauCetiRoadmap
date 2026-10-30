# Roadmap: counting bundles and Hall algebras of curves

**Summary.** Build the counting theory of geometrically indecomposable bundles on smooth projective curves over every finite field. Starting with coherent sheaves, Harder–Narasimhan theory, curve arithmetic and complete Adams series, identify nilpotent-pair masses with a spherical Hall partition expression. The end theorems are the universal partition residue formula, the all-characteristic coprime stable Higgs count, pure Higgs cohomology and its compact Poincaré polynomial, the nilpotent-cone component formula, and Mellit's integral, degree-independent universal count. Parabolic universality, slope refinements and the constructible spherical Hall Lie algebra complete the library; the precise remaining HN and Hall assertions are formulated as conjectures.

## Scope and ownership

This roadmap owns coherent nilpotent pairs and their Jordan correspondences, the finite-field nilpotent enumeration, curve Hall convolution and its spherical generic form, ordered shuffle residues, the curve partition kernels, the positive canonical Higgs exact category and its coherent comparisons, the stable canonical Higgs coarse geometry and its Białynicki-Birula strata, the all-characteristic Higgs count, the Higgs cohomological formulas, and the curve-specific Mellit deformation and its consequences. The positive exact category and stable canonical coarse geometry extend the supplied coherent Higgs carrier and the supplied bundle HN and deformation theory. The coprime Higgs count is the all-characteristic Hall comparison of §8.3. The framed central deformation of S16 §§6.6–6.9 is not a route here: it takes affine GIT quotients of a cotangent space of the singular closure of a framed Quot chart, formed fibre by fibre as ambient covectors modulo conormal covectors, and that fibrewise quotient is not a separated scheme receiving the natural projection (S16, §6.6, p.342; S16 line 2638).

The following constructions belong to the named suppliers and have no second construction here. The fixed-rank degree in §0.2 is only the native specialization needed to state the absolute-count headline; the general degree and Riemann–Roch API belongs to SchemeAndStackFoundations §3.3.

- AlgebraicVectorBundles Layers L0A–L2B owns finite locally free sheaves, ranks, tensor and dual, pullback and geometric total spaces. RepresentationTheory/ArtinAlgebras Layer 0 owns Krull–Schmidt categories: recognition, uniqueness of decompositions, local endomorphism rings and the radical block description. RepresentationTheory/QuiverRepresentations Layer 2 owns the module-level Krull–Schmidt theorem that Layer 0 generalizes. Sections 1.2–1.3 consume the categorical results; their targets concern the finite residue fields and nilpotence in coherent endomorphism algebras.
- SchemeAndStackFoundations §§1.18–1.21, 2.20, 3.3, 3.6–3.7 and 4.14 owns stacks and descent, duality, degree and Riemann–Roch, Picard torsors and Quot. GlobalShtukasAndFunctionFieldLanglands §§0.5–0.6 and 0.13 owns coherent HN theory, boundedness and the bundle/torsion mass formulas. Those masses are consumed in Hall pairings; their construction is not a target here.
- WeilConjectures WC.1, “Finite groupoid mass”, owns rational finite groupoid mass, equivalence invariance, products, unions and action-groupoid cardinality. Section 2.1 adds homotopy-fibre Fubini for the Jordan correspondences, using that mass.
- EndoscopicTransferAndUnitaryTraceComparison §3.6 owns the reductive bundle Higgs stack in characteristic prime to the Weyl order; §3.7 owns the all-field coherent canonical Higgs carrier with ordinary slope stability, existential good lines and the bounded Quot presentations of Higgs sheaves. AutomorphicSpectralTheory §6.22c owns ordinary bundle Higgs HN theory and coprime stability; §6.24 owns the canonical bundle Higgs deformation complex and strict-slope extension formula. Section 7.1 here adds the positive exact category and the coherent derived comparison. ReductiveGroupsPartII §RG2.3.7 owns Lang's theorem; the descent-gerbe neutrality statement of §1.6 is a separate theorem.
- ClassicalGroupsPartII §§CG.0.4–CG.0.5 and CG.2.4–CG.2.6 owns the reciprocal torus, Weyl action and full character ring. Section 0.1 specializes them to counting coefficients. FunctionFieldArithmetic §§0.2–0.3 and 5.1–5.4 owns the degree-one divisor, Picard comparison and zeta formulas.
- SchemeKTheoryOperations §§6.2.1–6.2.2 owns special λ-rings and Adams operations. HabiroNahmSeries §5.1 owns the augmentation-complete ordinary multivariate logarithm and exponential over a ℚ-algebra and the plethystic coefficient family over ℚ(q), including uniqueness and admissibility. HabiroCyclotomicCompletions §1.1 owns elementary simultaneous q-and-series Adams substitution and its plethystic exponential on tℚ((q))[[t]]. The complete-Adams contract below extends the supplied plethystic calculus to complete filtered rational special λ-algebras and their coefficient parameters.
- QSeriesPartitionsAndMockModularForms §§2.4 and 3.5 owns q-binomial and ordinary partition-series interfaces. Its Macdonald admissibility contract below asks that one roadmap for both generic modified Macdonald admissibility and Mellit's regular-sequence deformation theorem. RepresentationTheory/SchurWeyl Layer 7 owns symmetric functions: Schur polynomials and the Frobenius characteristic, and the stable symmetric-function ring with its Hall inner product, which that layer names as its step after the finite-variable Frobenius characteristic. The Macdonald contract is built on that ring and pairing, with no second symmetric-function carrier. The generic theorem is an input to Layer 10, whose own deformation is the curve partition identity.
- DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 7.15 and 10.5 owns Frobenius linear algebra, projective purity and equidistribution. EtaleDualityAndPerverseSheaves §§0.4 and 0.6–0.7 owns duality and trace comparisons. CohomologicalPointCounting’s “The combined endpoint” section and ComplexComparisonPartII §C6.6 own compact cohomology and comparison. Section 9.3 compares the compact cohomology of a fixed complex Higgs space with a finite-field fibre of its spread-out.
- Mathlib already has Young diagrams, transpose, Jacobson-radical structure and the general-linear-group cardinality; Tau Ceti already has arm and leg lengths; these are used with their pinned hypotheses. No second partition carrier or general-linear-group counting theorem is planned.

Mellit's parabolic theorem is outside this roadmap. It states that every marked count of §11.1, with flags padded by zero jumps to a common length, is the corresponding coefficient of the plethystic logarithm H^HLV of the genus-g Hausel–Letellier–Rodriguez-Villegas kernel with one puncture per marked point, taken at t=1. That coefficient lies in ℚ[q,σ_1^(±1),…,σ_g^(±1)], where σ_i is one Frobenius coordinate from each reciprocal pair; its average over the reciprocal Weyl group is an element of R_g with the same curve specializations, and the coefficient does not depend on the degree (M20P, arXiv v1, Theorem 7.1 and Corollary 7.4, pp.54–55; M20P line 2433 and M20P line 2503). Its route goes through parabolic sheaves with nilpotent endomorphisms and the affine Springer fibre interpretation of modified Macdonald polynomials; §11.2 proves the K_g statement by the parabolic Hall route.

## Conventions

Fix a finite field k of cardinality q=p^f, f≥1, and a smooth projective geometrically connected curve X/k of dimension one and genus g. Thus q≥2. Rank r is positive and degree d is an integer in the universal bundle formulas; the native bundle count also admits rank zero, with value zero in every degree. Rank-zero coherent torsion counts are separate from this bundle count. Nonzero torsion sheaves have slope +∞. The zero sheaf has the empty HN filtration and belongs to the slope-cut subcategories by the empty-filtration convention, but is never indecomposable. HN factors have decreasing slopes. All sheaves, their finite flags and skeletons lie in fixed universes; use essentially small categories and isomorphism classes, with finiteness proved before taking a natural cardinality or a rational mass. Pullback to an algebraic closure tests absolute indecomposability and geometric stability. Statements about field extension concern extensions of fields, not arbitrary nonflat changes of a family base.

The Euler form is χ((r,d),(s,e))=(1−g)rs+re−sd. Its symmetrization is 2(1−g)rs. Put P_X(t)=∏ⱼ(1−αⱼt), with α₂ᵢ₋₁α₂ᵢ=q, and ζ_X(t)=P_X(t)/((1−t)(1−qt)). The αⱼ are geometric-Frobenius eigenvalues on H¹; extension of degree m replaces every αⱼ and q by their m-th powers. Every Adams index m is positive. Universal coefficients are characteristic-zero rational algebras. Specialization takes values in an algebraically closed characteristic-zero coefficient field; it never evaluates the integer q inside k. Synthetic reciprocal tuples in rational-function Checks need not be Weil tuples. In particular (−1,−2) at q=2 is a formal test tuple: its two absolute values are not √2, so it does not describe a genus-one curve. A normalized pole evaluation is taken only after establishing regularity or the indicated nonzero denominators. At a finite-field tuple, q and q^m−1 are nonzero for m≥1. The origin evaluation in §6.5 concerns a regular extension to an affine cone, where q is allowed to vanish; it is not evaluation on the Laurent coefficient ring.

Hall multiplication places the quotient on the left and subobject on the right, with v²=q and twist v^χ. Numerical v is a chosen positive square root in characteristic zero; generic coefficients use the algebra with v²=q. The Green pairing is bilinear, with automorphism denominator, without complex conjugation. HN support completions admit only coefficient sums whose finiteness or convergence is proved. Bilateral degree distributions are multiplied by Laurent polynomials to clear denominators; there is no unrestricted product of distributions. Write V_r for the supplied fixed-degree bundle mass and V_0=1 for the zero bundle. Infinite numerical mass products use nonnegative real convergence at q>1, and formal products use the specified coefficient topology.

Exp and Log are plethystic; all coefficient parameters and grading variables participate in Adams operations. Symmetric sums over permutations are unaveraged. Rows of a partition are indexed from zero using Mathlib's Young diagram, with arm to the right and leg in the transpose direction; only actual cells are used in products. Multiplicity r_i counts parts of size i. Set ⟨λ,λ⟩=∑ⱼ(λ′ⱼ)².

At u≠0, rRes is the coefficient of (1−z/u)⁻¹ in a function. The differential residue dRes applies to f(z)dz/z. At a simple pole dRes=−rRes; higher poles need their full differential expansion. Iterated block residues take the highest designated variable first, with the others in the coefficient field. Roots-of-unity Fourier extraction over a field K requires r>0 and (r:K)≠0; all universal applications satisfy this in characteristic zero.

For g≥1 and coprime (r,d), put D=1+(g−1)r². The canonical stable Higgs coarse space has dimension 2D, its scalar-gerbe stack dimension 2D−1 and its reduced nilpotent cone dimension D. Write Λ_sch=h⁻¹(0) for the scheme-theoretic Hitchin fibre and Λ=(Λ_sch)_red for its reduced support; affine strata and the Lagrangian assertion refer to Λ. An ℓ-adic assertion has ℓ prime, ℓ≠p, and rational coefficients. Geometric Frobenius acts on the twist (−a) by q^a; an affine fibre of rank a shifts compact degree by 2a. Cohomology is zero outside its natural range. Compact Poincaré polynomials carry the sign (−1)^n; the unsigned variant is stated separately. Equalities in a Frobenius Grothendieck group assert equality of semisimplifications and do not choose a splitting or assert arithmetic semisimplicity. Genus zero is proved by splitting on the projective line, which every finite-field genus-zero curve is; positive-genus Mellit and symplectic arguments retain g≥1.

Every API bullet and Check below has the hypotheses and source locators of its subsection. A route names sufficient inputs for that proof, not a restriction on other proofs.

**Checks.**

- On P¹, χ(O,O(1))=2 and χ(O(1),O)=0. Quotient-left multiplication distinguishes these orders.
- For the formal reciprocal pair (−1,−2) at q=2, P(1)=6, ψ₂(1−α₁−α₂+q)=1−1−4+4=0, and ψ₂((q−1)⁻¹)=1/3. Fixing the coefficients in Adams would instead give 6 and 1.
- On the curve y²+y=x³ over 𝔽₄, the nine points and reciprocal eigenvalue pair (−2,−2) give 1+4−(−2−2)=9; over the cubic extension the point count is 1+64−(−8−8)=81. Fixing coefficient eigenvalues under Adams would incorrectly leave the original 9.
- For f=(1−z)⁻¹, rRes=1 and dRes(f dz/z)=−1; for f=(1−z)⁻² they are 0 and −1. Interchanging the conventions changes the recovered rank-one count.
- For rank-one Higgs bundles in genus two, D=2: the coarse space Pic^d×A² has dimension 4, the stack dimension 3, H_c has its affine shift in degree 4 with twist −2, and the cone Pic^d has top degree 4. A shift by 2 or a reciprocal prefactor q⁴ fails this witness.

## Exact supplier contracts

The named sections specify the material consumed. A paragraph beginning “Required extension” specifies additional mathematics needed from that owner; it does not attribute that extension to the cited section. The scope of each counting theorem includes the corresponding contract.

### From Mathlib

Use `Matrix`, `IsNilpotent` and `Nat.card` for finite-field nilpotent enumeration. `Matrix.card_GL_field` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean`, line 120, supplies the product `∏_{i:Fin n}(Q^n−Q^i)` for a finite field; its n=0 value is 1. `IsArtinianRing.isNilpotent_jacobson_bot` in `Mathlib/RingTheory/Artinian/Ring.lean`, line 54, assumes an associative ring and its Artinian condition. `IsArtinianRing.isSemisimpleRing_iff_jacobson` in `Mathlib/RingTheory/Artinian/Module.lean`, line 641, supplies the radical criterion. `Finite.isDomain_to_isField` in `Mathlib/RingTheory/LittleWedderburn.lean`, line 176, applies to a finite ring with a domain instance, including the residue division ring.

Use `Indecomposable` in `Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean`, line 1096: it excludes zero and requires every binary biproduct decomposition to have a zero summand. `Skeleton` in `Mathlib/CategoryTheory/Skeletal.lean`, line 74, identifies objects up to isomorphism, and `ObjectProperty.FullSubcategory` in `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`, line 39, retains all morphisms between objects satisfying the degree and geometric predicate. These provide the native absolute bundle count, not its finiteness theorem.

Use `YoungDiagram` and `YoungDiagram.transpose` in `Mathlib/Combinatorics/Young/YoungDiagram.lean` for partitions. A diagram is a finite lower-closed set of pairs of natural numbers; a cell hypothesis is needed for its row and column subtractions. These declarations do not provide curve counts or formal plethystic operations.

### From Tau Ceti

`FiniteLocallyFreeSheaf.FixedRank` and its pullback in `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean`, lines 69 and 104, supply the native fixed-rank carrier and field-base-change functor. `Scheme.Modules.eulerCharBelow` in `TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`, line 105, is the truncated alternating finrank, with no cohomological finiteness or vanishing hypotheses. `InvertibleSheaf.trivial` in `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, line 131, supplies O_X. The proper smooth curve hypotheses in §10.4 ensure that truncation 2 computes χ; an infinite-dimensional finrank would otherwise contribute its total-function value zero.

`YoungDiagram.armLength` and `YoungDiagram.legLength` in `TauCeti/Combinatorics/Young/HookLength/Basic.lean`, lines 136 and 140, are the row and column lengths minus the cell coordinate and one. They are total natural-number functions; statements about cells retain membership. For λ=(2), its left cell has arm 1 and leg 0; for λ=(1,1), its upper indexed cell has arm 0 and leg 1. An out-of-diagram coordinate is not used in a product.

### From TauCetiRoadmap.AlgebraicVectorBundles

Layers L0A–L0C supply the tensor, dual, constant-rank finite-locally-free sheaves and determinant; Layers L1–L2B supply the affine and geometric comparisons and base change. On a smooth noetherian curve use the coherent full subcategory of the supplier module category. Its kernels, cokernels and finite sums are those of that category; no separate sheaf or bundle type is introduced.

### From TauCetiRoadmap.RepresentationTheory.ArtinAlgebras

Layer 0, “Recognition”, “Uniqueness” and “Indecomposables”, supplies Krull–Schmidt recognition for idempotent-complete Hom-finite categories over a commutative Artinian ring, uniqueness of finite decompositions and local endomorphism rings. Its “The radical in a Krull-Schmidt category” paragraph supplies the radical block description: between nonisomorphic indecomposables every Hom lies in the radical, and a repeated summand contributes the full matrix algebra over its endomorphism radical. Apply these results to the abelian category Coh(X), Hom-finite over k by SchemeAndStackFoundations §2.6. The zero object has the empty decomposition; a line has local endomorphism ring k, whereas O² has endomorphism ring M₂(k).

### From TauCetiRoadmap.ClassicalGroupsPartII

Sections CG.0.4–CG.0.5 supply the diagonal GSp torus and the action generated by permuting reciprocal pairs and a_i↔q/a_i; CG.2.4–CG.2.6 supply the full integral Weyl-fixed Laurent ring and its rational character isomorphism. Tensor it with ℚ. Section CG.3's positive tensor-constituent subring is a different object and is not substituted for the full character ring. At g=0 retain the separate G_m parameter q.

### From TauCetiRoadmap.FunctionFieldArithmetic

Sections 0.2–0.3 supply a degree-one integer divisor and the identification of rational divisor classes with Picard points over finite fields. Sections 5.1–5.4 supply ζ_X(t)=P_X(t)/((1−t)(1−qt)), the extension-field point-count identity, P_X(1)=#Pic⁰_X(k), and compatibility with the scheme curve. A degree-one divisor need not be effective. These inputs hold even if X(k) is empty. For P¹, P_X=1 and the degree-one line class has exactly one representative up to isomorphism in each degree.

### From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

Sections 0.1, 0.5–0.6 supply fixed-class GL_r bundles, coherent rank and degree, hereditary Coh(X), the Euler form, existence and uniqueness of coherent HN filtrations, finite rational class sets in bounded HN opens and the nonnegative cutoff. Central degree is fixed in every finiteness assertion. Field-extension compatibility for these coherent filtrations is proved in §0.2 from uniqueness, effective descent and Quot; it is not an additional assertion attributed to §0.5.

Section 0.13 supplies `V_r=q^((g−1)(r²−1))P_X(1)/(q−1)∏_{i=2}^r ζ_X(q⁻ⁱ)` for r>0, independently of d; the torsion series `∏_{i≥1}ζ_X(q⁻ⁱs)=exp(∑_{m≥1}#X(k_m)s^m/(m(q^m−1)))`; and, for r>0 in fixed degree d, the full coherent mass `q^((g−1)(r²−1))P_X(1)/(q−1)∏_{i≥2}ζ_X(q⁻ⁱ)`. The bundle/torsion splitting contributes q^(−r l). Use its real convergence or its coefficient topology before using the product. V_0=1 is the zero bundle convention, not a torsion mass formula. At r=1 the mass is P_X(1)/(q−1), and the coefficient of s is #X(k)/(q−1) (S16, Theorem 4.1, pp.316–317; S16 line 1015).

### From TauCetiRoadmap.WeilConjectures

WC.1, “Finite groupoid mass”, supplies the mass of an essentially finite groupoid, equivalence invariance, products, finite disjoint unions and mass([S/G])=#S/#G for a finite group action. Automorphism cardinalities are positive by the identity element. It applies to an actual finite groupoid; BG as a one-object abstract groupoid must be distinguished from the finite-field point groupoid of an algebraic classifying stack. Section 2.1 supplies the homotopy-fibre formula used here. For S₃ acting on three letters the action mass is 3/6=1/2; for a point with stabilizer S₃ it is 1/6.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 1.18–1.21 give effective coherent and flag descent, quotient stacks, stabilizers, gerbes and atlas independence. Sections 2.6, 2.18, 2.20 and 3.3 give finite-dimensional proper coherent cohomology, derived Hom and direct image, natural duality, degree and Riemann–Roch. Sections 3.6–3.7 give Picard torsors and stacks, and §4.14 gives projective Quot with a fixed source. Sections 4.1 and 4.5 supply natural infinitesimal deformation maps and their tangent-obstruction sequences.

Required extension of SchemeAndStackFoundations (coherent Ext–Serre duality): For every smooth projective geometrically connected curve and coherent U,V, provide a natural isomorphism Ext¹(U,V)* ≃ Hom(V,U⊗Ω), compatible with restriction, pushout and field extension, without requiring U locally free.

The general coherent Ext–Hom contract is restricted here to smooth curves: on a nodal cubic the node skyscraper has Ext¹ dimension 2 but self-Hom dimension 1. On a smooth local curve k[t], Ext¹(k,k) and Hom(k,k) both have dimension 1. Strong generation means both Ext¹(L,F)=0 and surjectivity of Hom(L,F)⊗L→F; on P¹ the line O(−1) has Ext¹(O,O(−1))=0 but zero evaluation.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Section 1.3 supplies coherent quotients and relative partial flags. The fixed-source Quot construction of SchemeAndStackFoundations §4.14 supplies the charts and their family base change. Section 4.19's affine-stabilizer quotients require the following reductive character-quotient extension; finite-inertia coarse-space results alone cannot quotient a scalar G_m stabilizer.

Required extension of AlgebraicModuliForArithmeticGeometry (reductive character GIT): Provide character-linearized reductive GIT for products of general linear groups, the Hilbert–Mumford criterion, geometric free projective-group quotients, base change and the projective morphism from the character quotient to the affine quotient.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Section 3.7 supplies coherent canonical Higgs sheaves and ordinary geometric slope (semi)stability over every field, and the bounded good-line presentation: the strongly L₁-generated sheaves of class α form the quotient of the single-frame Quot open by GL_N, N=χ(L₁,F), and §3.7(a) puts every semistable Higgs bundle of class α there. Section 3.6 supplies the general reductive bundle Higgs stack, with its stated restriction on the characteristic and Weyl order. Use the coherent GL_r carrier of §3.7 with this bounded presentation for the stable moduli of §7.3. The locally free open gives the all-characteristic bundle carrier; comparison with §3.6 uses that section’s characteristic restriction.

Required extension of EndoscopicTransferAndUnitaryTraceComparison (locally free canonical Higgs locus): For every field, construct the canonical GL_r Higgs bundle stack as the locally free open substack of the coherent canonical Higgs carrier of §3.7, with its bounded Quot charts; over finite fields identify it with the GL_r Hitchin stack of §3.6 when the characteristic does not divide r!.

The stable canonical coarse geometry and the positive exact category are targets here. The generic higher-degree-twist smoothness and anisotropic properness results are not used as canonical-twist stable coarse theorems. For r=1 every Higgs bundle of class (1,d) is semistable and lies in the presentation. On P¹ with L₁=O(−n), the bundle O(a)⊕O(−a) with a≥n+2 has Ext¹(L₁,O(−a))=H¹(O(n−a))≠0 and lies outside it; every Higgs field on it leaves O(a) invariant, since O(a)→O(−a−2) vanishes, so it is unstable, as §3.7(a) requires.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Section 6.22c supplies ordinary geometric bundle Higgs HN filtrations, uniqueness, field-extension compatibility, Hom vanishing between separated slopes and semistability implying stability in coprime rank and degree. Section 6.24 supplies the canonical two-term sheaf Hom complex on bundles, its morphism and extension comparisons, the degree-two Serre-dual obstruction, and the extension-groupoid mass for strict slope separation. The input here is that geometric theory over finite fields and their geometric extensions; the Arthur kernels and integrated Fourier comparison are not used. The coherent comparison in §7.1 retains derived Hom terms for torsion objects. For A=B=(O_X,0), the supplied complex has degree-two dimension 1; when g=2 and A=(O_X(P),0), B=(O_X,0), its cohomology dimensions are 1,3,0 and the extension mass is q².

### From TauCetiRoadmap.ReductiveGroupsPartII

Section RG2.3.7, “Lang's theorem and lifting”, supplies surjectivity of g↦g⁻¹F(g) on geometric points and H¹(k,G)=1 for smooth connected finite-type algebraic groups, over every finite extension. Unit groups of finite-dimensional endomorphism algebras are smooth geometrically connected opens in affine space. Nonabelian H² neutrality is proved separately in §1.6. For G_m/F₃ the geometric Lang map is z↦z² and is onto over the algebraic closure; its restriction to F₃× is the constant 1 and is not the theorem being used.

### From TauCetiRoadmap.HabiroNahmSeries

Section 5.1 supplies ordinary multivariate augmentation logarithms and exponentials over a ℚ-algebra, their inverse and product/sum laws, and coefficientwise finite zero-augmentation substitutions. It also supplies the unique plethystic family L_n for constant-one series over ℚ(q), its triangular coefficient laws, product/inversion closure and Laurent admissibility. With the conventions here, L_n=(q−1)[t^n]Log F; the coefficient Adams structure on R_g is additional. For log(1+uv), the coefficients of uv and u²v² are 1 and −1/2, and exp(log(1+uv))=1+uv.

Required extension of HabiroNahmSeries (complete Adams series): Extend the plethystic coefficient family and inverse Exp/Log calculus of §5.1 from ℚ(q) coefficients to augmentation-complete series over complete filtered rational special λ-algebras supplied by SchemeKTheoryOperations §§6.2.1–6.2.2, with continuous Adams operations acting on every coefficient parameter and grading variable; include coefficientwise functoriality, the finite-extension Möbius identity and agreement with HabiroCyclotomicCompletions §1.1 under Laurent-series specialization.

### From TauCetiRoadmap.SchemeKTheoryOperations

Sections 6.2.1–6.2.2 supply pre-λ and special λ-rings, the line-monomial structure and Newton Adams operations, with ψ_mψ_n=ψ_(mn) and ψ_m(a)=a^m for line elements. Restrict the rational line-monomial structure to reciprocal Weyl invariants and extend the Adams maps to K_g; the complete-series extension uses this structure. For a line variable a, ψ₂(a)=a²; for the integer 2 in the binomial structure, ψ₂(2)=2, not 4.

### From TauCetiRoadmap.HabiroCyclotomicCompletions

Section 1.1 supplies the simultaneous substitutions q↦q^m, t↦t^m on tℚ((q))[[t]], their composition law and the elementary plethystic exponential. The complete-Adams supplier contract extends these operations to the curve coefficient rings; require agreement under the Laurent-series specialization, rather than defining a second operation there. For a positive-degree monomial, Exp(t)=(1−t)⁻¹ and Exp(−t)=1−t; the t² coefficients are respectively 1 and 0. The inverse logarithm and the additional reciprocal-coordinate Adams operations belong to the complete-Adams extension.

### From TauCetiRoadmap.RepresentationTheory.SchurWeyl

Layer 7 supplies Schur polynomials in finitely many variables and the finite-variable Frobenius characteristic, and names the stable symmetric-function ring with the Hall inner product, in which the Frobenius characteristic is an isometry, as its separately stated step after them. That ring and pairing are the carrier of the Macdonald admissibility contract below; no second symmetric-function carrier is introduced here or there. In the Hall inner product (p_λ,p_λ)=z_λ and distinct power-sum products are orthogonal: (p₂,p₂)=2 and (p₁²,p₁²)=2, while (p₁²,p₂)=0.

### From TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

Sections 2.4 and 3.5 supply q-binomial and Euler series and native partition adapters. Use the formal Euler specialization at base v=q⁻¹ for Heine summation; the corresponding logarithm is formed with the ordinary augmentation calculus supplied by HabiroNahmSeries §5.1, and the Laurent-series specialization agrees with HabiroCyclotomicCompletions §1.1. The symmetric-function continuation has the following exact contract (M20, Definition 5.1 and Lemma 5.1, pp.315–319).

Required extension of QSeriesPartitionsAndMockModularForms (Macdonald admissibility): On the stable symmetric-function ring and Hall inner product of RepresentationTheory/SchurWeyl Layer 7, with no second carrier, provide modified Macdonald functions, the S-twisted Hall pairing `(p_λ,p_μ)_S=(p_λ,p_μ)∏_i S(q^(λ_i),t^(λ_i))` with S(q,t)=−(q−1)(t−1), equivalently (f,g)_S=(f,g[SX]) under plethystic substitution, ∇ and τ, integral HLV logarithms and Mellit’s regular symmetric Laurent sequence deformation theorem over rational λ-rings with injective localization.

Specifically, for a rational λ-ring R containing ℚ(t)[q±1], with injective localization `R→R⊗_{ℚ(t)[q±1]}ℚ(q,t)`, take Ω=∑c_λ H̃_λ with c_empty=1 and (q−1)Log Ω integral over R. For a regular symmetric Laurent sequence `f(u)=1+∑_{j>0}u^j f^(j)`, the deformed Ω_f has (q−1)Log Ω_f in R[[u]], with the same reduction modulo q−1. Here q is the deformation variable, which becomes z in Layer 10; the Hall pairing uses S=−(q−1)(t−1). In these generic variables the sequence condition is `f_{n+1}(1,x1,...,xn)=f_n(t*x1,...,t*xn)`. Under q_M=z and t_M=q this becomes the q-scaling condition of §10.2. The same contract also asks for the integral HLV conclusion (M20, Definition 5.1 and Lemma 5.1, pp.315–319; M18, Theorem 7.1 and Corollary 7.2, pp.29–31). Layer 10 consumes this generic theorem under the stated contract.

For a single degree variable T, Exp(T)=1+T+T²+⋯; fixing T under Adams would give exp(T) instead, whose T² coefficient is 1/2. For q=2, ψ₂((q−1)⁻¹)=1/3, not 1. These witnesses apply also to the Hall and Mellit series. For the nonconstant regular-sequence witness f₁(x)=x and f₂(x,y)=t(x+y−1), take q_M=2, t_M=3 and x=5: f₂(1,5)=15=f₁(3·5), whereas replacing the t_M shift by q_M gives 10. This pins the generic-to-curve variable exchange. For the one-box function H̃_(1)=p₁, (p₁,p₁)_S=S(q,t)=−(q−1)(t−1), the S-norm of H̃_(1); the untwisted Hall pairing gives 1. For p₂, (p₂,p₂)_S=2S(q²,t²)=−2(q²−1)(t²−1); applying S(q,t) to every part would give −2(q−1)(t−1) (M18, equation (2) and the norm formula following it, p.2; M18 line 51 and M18 line 58).

### From TauCetiRoadmap.DeligneWeightsAndPurity

Sections 0.10, 0.12 and 0.16–0.18 supply power-sum determination of signed finite eigenvalue multisets, extension-field powers, perfect-pairing reciprocity and disjoint weights, without a diagonalizability hypothesis. Section 1.7 supplies curve H¹ weight one, §7.15 smooth projective purity, and §10.5 the degree-fibre Frobenius equidistribution of Weil II (3.5.3). Sections 7.12 and 8.8–8.11 supply the weight bounds used on localization and affine strata. No canonical arithmetic Frobenius splitting is assumed. For A¹ the sole compact eigenvalue is q in degree 2; for P¹ it is 1 in degree 0 and q in degree 2. Inverting this convention changes the trace from q to q⁻¹ (WII, (3.5.1)–(3.5.3), pp.210–211).

### From TauCetiRoadmap.ArithmeticStatisticsPartVIII

Section 5.17, “Mod l hyperelliptic monodromy is symplectic”, “Integral lift of full mod l symplectic image” and “Monodromy of the odd degree polynomial family”, supplies geometric symplectic monodromy for y²=∏ᵢ(x−aᵢ), with 1≤i≤2g+1, over the configuration space of distinct branch points in odd characteristic. For the density route choose an auxiliary ℓ≥5 different from the characteristic, so the genus-one lifting exception at ℓ=3 never enters. This is a route for universal uniqueness, not a restriction on the counting theorems. For g=0 the infinitely many q-coordinates are dense in G_m (S16, Proposition 4.7 and Appendix B, pp.321,357–358; S16 line 1250 and S16 line 3319).

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Sections 0.4 and 0.6–0.7 supply Frobenius-equivariant duality and integration. For smooth projective Z of dimension m, H^(2m−j)(Z)*(−m)≃H^j(Z), with geometric Frobenius.

Required extension of EtaleDualityAndPerverseSheaves (affine bundle compact shift): Export the Frobenius-equivariant compact-cohomology comparison for every Zariski locally trivial rank-a affine bundle, with degree shift 2a, twist −a and compatibility with base change and the localization filtration.

Section 0.4 supplies top cohomology on the geometric components, including Frobenius descent; §0.6 supplies rational realization. Its dimension counts geometric components even if Frobenius permutes them; its trace counts the fixed components. For two exchanged components the top representation has dimension 2 and trace 0 at the first Frobenius power, so dimension is not inferred from that trace alone.

### From TauCetiRoadmap.CohomologicalPointCounting

Its “The combined endpoint” section, using FrobeniusGeometry, CompactSupport Layers 6–8, EllAdicRealization Layers 7–9 and TraceFormula Layers 11–12, supplies geometric compact cohomology, localization and the Grothendieck trace formula on finite-type schemes, with the scheme-Frobenius/geometric-Galois convention bridge. Use the constructible compact direct-image complexes of CompactSupport Layer 8 and EllAdicRealization Layer 9 and the coefficient comparisons below in finite-type spread-outs. For A¹ and G_m, the compact alternating traces are respectively q and q−1; ordinary cohomology would give the wrong latter trace.

### From TauCetiRoadmap.ComplexComparisonPartII

Sections C6.3–C6.6 supply ordinary and compact-support étale–singular comparison for separated finite-type complex schemes, finite, integral and rational coefficients, compatible with localization, cups and traces. Use the constant coefficient object on the Higgs scheme, with the normalized rational realization and the uniform constructibility bounds of C6.6.

Section 9.3 uses a dense open with locally constant compact-cohomology ranks in a spread-out of the specified complex curve and its Higgs space. CompactSupport Layer 8 and EllAdicRealization Layer 9 supply constructibility and coefficient realization; no identification of unrelated complex curves is required.

## How to read the build

Layers 0–2 fix coefficients and residues, apply categorical decomposition to coherent sheaves, and express nilpotent-pair masses by Jordan flags and a finite-field tower exponential. Layers 3–5 turn those flags into Hall pairings, construct the universal spherical form and evaluate the pairings by ordered shuffle residues. Layer 6 extracts bundle counts and their origin constants. Layers 7–8 build coherent canonical Higgs geometry and the stable Higgs moduli, prove the Białynicki-Birula–Hesselink strata theorem, and compare Higgs and bundle counts in every characteristic by positive Higgs HN integration. Layer 9 converts those counts into pure cohomology, positivity and nilpotent-cone invariants. Layer 10 applies the supplied Macdonald theorem to the curve kernel to prove Laurent integrality and degree independence. Layer 11 treats quasi-parabolic counts, exact HN types and constructible Hall theory. Within a layer, named dependencies determine the construction order. Suggested.lean states the finite-field nilpotent matrix count and degree independence of the native absolute bundle count; its docstring identifies the other headlines and their missing carriers.

## Layer 0: universal coefficients, absolute counts and residues

### 0.1 universal counting coefficient ring

Define the following objects and their indicated structure. For g≥1 use the diagonal torus and reciprocal Weyl action of ClassicalGroupsPartII, rationalize its full integral invariant ring to R_g=Q[q±1,a_1±1,…,a_g±1]^W with paired coordinates α=(a_1,q/a_1,…,a_g,q/a_g). Set K_g=R_g[(q^m−1)⁻¹:m≥1]. For g=0 take T_0=G_m with coordinate q, W_0=1. Curve specialization sends q to #k and α to the geometric-Frobenius eigenvalues of H¹(X). For l≥1, Adams ψ_l raises all torus coordinates to the l-th power and extends to K_g. (S16, §1.1, p.299; §1.4, pp.302–303; S16 line 81).

The interface has the following properties.

- Any reciprocal tuple over a Q-algebra with q and all q^m−1 invertible induces the unique K_g algebra map extending its invariant evaluation.
- ev_X∘ψ_l=ev_(X_Fq^l) on K_g.
- For g≥1, R_g is Q tensored with the full algebraic GSp character ring, through the character restriction map of ClassicalGroupsPartII §CG.2.6; it is not Yu’s positive tensor-constituent subring.

One route is as follows. Base-change the supplier lattice and invariant presentation to Q. Localize at the W-fixed elements q^m−1 and use their nonvanishing at prime powers. Check ψ_l preserves the multiplicative set and sends a curve specialization to the corresponding finite extension.

*Needs:* ClassicalGroupsPartII §CG.0.4; ClassicalGroupsPartII §CG.0.5; ClassicalGroupsPartII §CG.2.6; FunctionFieldArithmetic §§5.1–5.4; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- R_0=Q[q±1], not Q.
- For g=1, a+q/a is Weyl fixed while a alone is not.
- ψ_2((q−1)⁻¹)=(q²−1)⁻¹, not (q−1)⁻².

### 0.2 geometrically indecomposable counts

For the native headline, let k be a field and X a scheme over Spec k in the same universe. On `FiniteLocallyFreeSheaf.FixedRank X r`, define `bundleDegree` as χ₂(E)−rχ₂(O_X), where χ₂ is `Scheme.Modules.eulerCharBelow` with truncation 2. This is the fixed-rank specialization of SchemeAndStackFoundations §3.3's degree formula; the general degree theory remains there. On the smooth proper geometrically connected curves used below, coherent cohomology is finite-dimensional and vanishes above degree one, so this is the usual degree (S16, §2.1, pp.306–307; S16 line 520).

On smooth proper geometrically connected curves, its interface has the following properties.

- Isomorphic fixed-rank bundles have the same degree.
- Finite sums have additive degree and the trivial rank-r bundle has degree zero.
- On the intended curves the formula agrees with determinant degree by Riemann–Roch.

**Checks.**

- On P¹, χ₂(O(1))=2 and χ₂(O)=1, so the degree is 2−1=1.
- On a genus-two curve, χ₂(O)=−1 and the degree of O² is −2−2(−1)=0; using χ₂(E) alone would give −2.
- On P¹, O(1)⊕O(−1) has χ₂=2+0=2 and rank 2, so degree 2−2=0; it is not required to be trivial.

Define `IsAbsolutelyIndecomposable` by applying Mathlib's `Indecomposable` to the underlying sheaf of the pullback along X×ₖk̄→X. It includes nonzeroness. Define `absIndecCount` as `Nat.card` of the skeleton of the full fixed-rank subcategory on degree d and this predicate. It counts isomorphism classes, with no automorphism weights. The finiteness theorem §1.10 justifies the natural cardinality for finite-field curves; on arbitrary schemes the total functions alone make no finiteness claim.

On these curves the predicate's interface has the following properties.

- Bundle isomorphisms preserve the predicate, and extension to an algebraic closure tests it.
- Pullback along any field extension preserves and detects absolute indecomposability.
- The zero bundle and any sum of two nonzero bundles fail the predicate.

**Checks.**

- O_X on a geometrically connected smooth proper curve is nonzero and indecomposable after k̄ extension, since its global endomorphisms are k̄.
- O_X⊕O_X has the nontrivial projector diag(1,0), so it fails the predicate.
- The rank-zero bundle is zero after pullback and fails the predicate, even though it has no decomposition into two nonzero summands.

The native count's interface has the following properties.

- Isomorphic bundles represent one skeleton element, irrespective of their chosen presentations.
- In positive rank it is A_X(r,d) below; in rank zero it is zero for every d.
- The count is finite on finite-field curves by §1.10, and its degree independence is the headline `absIndecCount_eq_of_degree` of §10.4.

**Checks.**

- Over 𝔽₃ a single line class contributes 1 to the count and 1/2 to its stack mass; only the former enters the skeleton cardinality.
- On P¹, rank-one degree −1 and degree 1 each have count 1; rank-two bundles have count 0 in either degree.
- At r=0, the full subcategory is empty in every degree because zero is not indecomposable, giving count 0 rather than the zero-object mass 1.

Define the following objects and their indicated structure. For r>0 and d∈Z, A_X(r,d) is the cardinality of the set of k-isomorphism classes of rank-r degree-d vector bundles whose pullback to k̄ is nonzero and indecomposable. `A_X^{≥ν}(r,d)` imposes μ_min≥ν, and `A_X^{≤ν}` imposes μ_max≤ν. `A_X^{≥0}(0,d)=#X(k)` for d>0 counts coherent torsion objects; set the zero-object indecomposable count to zero. Positive-rank A without a slope decoration always counts bundles. (S16, §1.2, p.299; §2.1, pp.307–308; §5.7, p.334; §8.1, p.353; S16 line 81).

The interface has the following properties.

- The predicate is preserved by bundle isomorphism and finite extension, with extension to k̄ canonically identified.
- `A_X^{≥ν}` counts exactly the subset of absolute indecomposables satisfying the imported μ_min bound.
- For d>0 the only absolute indecomposable torsion objects are length-d modules at k-rational points, so their number is #X(k).

Prove that for every coherent F on the finite-field curve and every field extension L/k, the HN filtration of F_L is the pullback of that of F, with unchanged ranks, degrees and slopes. Consequently the two slope-cut predicates commute with field extension (S16, §2.1, p.307; S16 line 536).

One route is as follows. Define the isomorphism-invariant geometric predicate and its class cardinality. For HN compatibility, uniqueness over k̄ makes the geometric filtration invariant under Galois; its finite-presentation data descend over a finite extension and then effectively to k. For an extension beyond k̄, a new destabilizing quotient would give a point of a fixed projective Quot scheme over an algebraically closed extension; its nonempty finite-type locus has a k̄-point, contradicting geometric semistability. Separate the torsion subobject first. Use these HN subcategories for decorated counts; finiteness is §1.10. This uses GlobalShtukasAndFunctionFieldLanglands §0.5 for existence and uniqueness and SchemeAndStackFoundations §§1.18–1.21 and 4.14 for descent and Quot.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§1.18–1.21, 3.3 and 4.14; `FiniteLocallyFreeSheaf.FixedRank`; `FiniteLocallyFreeSheaf.FixedRank.pullback`; `Scheme.Modules.eulerCharBelow`; `Indecomposable`; §0.1.

**Checks.**

- A_X(1,d)=#Pic⁰_X(k), independently of whether X(k) is empty.
- The zero sheaf contributes neither to A_X(0,0) nor to any indecomposable Euler product.
- A torsion sheaf simple over a closed point of degree e>1 is k-indecomposable but splits over k̄ and is not counted in A_X(0,e).
- O(2)⊕O(−1) on P¹ retains slopes (2,−1) after every field extension; a degree-two skyscraper splits geometrically into two length-one sheaves but retains its single torsion HN slope +∞; zero retains the empty filtration.

### 0.3 normalized and differential residues

Define the following objects and their indicated structure. For u≠0, expand a rational function f(z) in h=1−z/u and define rRes_(z=u) f as its h⁻¹ coefficient. Separately dRes_(z=u)(f(z)dz/z) is the ordinary differential residue. For a simple pole dRes(f dz/z)=−rRes f; for higher-order poles no such equality is asserted. An iterated block residue uses the specified descending variable order with other variables in the coefficient field. (S16, §1.4, p.303; Theorem 1.6, p.304; S16 line 242).

The interface has the following properties.

- rRes and dRes are linear over the coefficient field.
- For f with pole order ≤1 at u, dRes(f dz/z)=−rRes f.
- The descending list of variables and pole equations is part of an iterated residue operation, not a permutation-invariant set.

One route is as follows. Use the local Laurent expansion at a nonzero point. For differential residue substitute dz/z=−dh/(1−h). Iterate one-variable normalized residues in the exact block order.

*Needs:* §0.1.

**Checks.**

- rRes at z=u of 1/(1−z/u) is 1, and dRes of that function times dz/z is −1.
- For f=(1−z/u)⁻², rRes f=0 but dRes(f dz/z)=−1.
- A function regular at u has both residues zero.

### Examples

For a line bundle the unweighted absolute count is P_X(1). The universal expression P(1) evaluates to 6 at the formal reciprocal pair (−1,−2), q=2; this tuple is not a curve specialization. A rational length-two torsion block is absolute, whereas the simple sheaf at a degree-two point splits into two geometric summands. The simple and double pole witnesses in §0.3 fix every residue sign used below (S16, pp.299,303,334; S16 line 81 and S16 line 2205).

### Dependencies

- ClassicalGroupsPartII §CG.0.4.
- ClassicalGroupsPartII §CG.0.5.
- ClassicalGroupsPartII §CG.2.6.
- FunctionFieldArithmetic §§5.1–5.4.
- DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- SchemeAndStackFoundations §§1.18–1.21, 3.3 and 4.14.
- `FiniteLocallyFreeSheaf.FixedRank` and `FiniteLocallyFreeSheaf.FixedRank.pullback`.
- `Scheme.Modules.eulerCharBelow` and `Indecomposable`.

## Layer 1: coherent decomposition and finite-field enumeration

### 1.2 Krull–Schmidt for coherent sheaves

Apply the decomposition, uniqueness and local-endomorphism criteria of RepresentationTheory/ArtinAlgebras Layer 0 to Coh(X). Prove the finite-field refinement: the local endomorphism algebra of an indecomposable has a finite residue division field k_M/F_q. Every endomorphism of an indecomposable is either a unit or nilpotent. (S16, §2.2, Lemma 2.3 and Corollary 2.5, p.309; S16 line 615).

One route is as follows. Coh(X) is abelian, has finite biproducts and is Hom-finite over k by SchemeAndStackFoundations §2.6. Apply RepresentationTheory/ArtinAlgebras Layer 0, “Recognition”, “Uniqueness” and “Indecomposables”. Its finite-dimensional local endomorphism algebra has nilpotent Jacobson radical, so every nonunit is nilpotent. Apply Wedderburn’s finite division-ring theorem to its residue division ring.

*Needs:* RepresentationTheory/ArtinAlgebras Layer 0; SchemeAndStackFoundations §2.6; `IsArtinianRing.isNilpotent_jacobson_bot`; `Finite.isDomain_to_isField`.

**Checks.**

- 0; L; L²: Summand counts 0,1,2; End(L)/rad=k; for L² the quotient is M₂(k), which is not local. Categorical recognition applies although a line has the infinite coherent subsheaf chain L(−nx).

### 1.3 radical and semisimple matrix quotient

For `M=⊕_i M_i^{n_i}` with pairwise nonisomorphic indecomposable coherent M_i, apply RepresentationTheory/ArtinAlgebras Layer 0’s radical block description and prove the finite-field identification `End(M)/rad≃∏_i M_{n_i}(k_{M_i})`. The radical is nilpotent, and an endomorphism is nilpotent iff its image in every matrix quotient is nilpotent. (S16, §2.2, Lemma 2.4, p.309 (matrix-block correction); S16 line 615).

One route is as follows. Write composition in block matrices and identify the ideal by its action on the distinct simple projective tops. Use the semisimple quotient and nilpotent radical of the Artinian endomorphism algebra. Lift nilpotence through a nilpotent ideal.

*Needs:* §1.2; RepresentationTheory/ArtinAlgebras Layer 0, The radical in a Krull-Schmidt category; `IsArtinianRing.isNilpotent_jacobson_bot`; `IsArtinianRing.isSemisimpleRing_iff_jacobson`.

**Checks.**

- N=k[t]/t²; M=N² over 𝔽₂: dim rad End(N)=1; dim M₂(rad End(N))=4 versus the incorrect 2; quotient M₂(𝔽₂) has 16 elements. Use full repeated-summand matrix blocks.

### 1.4 finite-field nilpotent matrix count

Prove the following statement. For a finite field K of cardinality Q and n≥0, `#{u∈M_n(K):u is nilpotent}=Q^{n(n−1)}`. The empty matrix counts once. The unit denominator used in §1.5 is the supplied general-linear-group cardinality. The headline `nilpotent_matrix_count` states the formula for every field K with a finite underlying type and every natural n. (S16, §2.2, Corollary 2.5, p.309; Appendix A, p.356 (Fine–Herstein input); S16 line 615).

The supporting input is FH58, Theorem 1, p.499, proof pp.499–503; the same count is stated in S16, Corollary 2.5, p.309.

One route is as follows. Classify nilpotent modules by Jordan partitions and compute their centralizer units. Sum the reciprocal centralizer masses by the q-binomial/Heine identity. Multiply by #GL_n(K); the exact primary proof of the partition summation is part of the enumeration proof.

*Needs:* `Matrix.card_GL_field`; QSeriesPartitionsAndMockModularForms §2.4.

**Checks.**

- n=0,1,2 over 𝔽₂ and n=2 over 𝔽₃: Counts 1,1,4,9 equal Q^(n(n−1)); GL counts at n=0,1,2 over 𝔽₂ are 1,1,6. Keep the field and finiteness hypotheses.

### 1.5 nilpotent-to-automorphism ratio

Prove the following statement. For the decomposition above, `#End_nil(M)/#Aut(M)=∏_i Q_i^{n_i(n_i−1)}/#GL_{n_i}(F_{Q_i})`, where `Q_i=#k_{M_i}`. The identical radical-fibre factor cancels from numerator and denominator. (S16, §2.2, Corollary 2.5, p.309; S16 line 615).

One route is as follows. Push nilpotents and units to the semisimple quotient; both maps have fibres of size #rad. Factor over simple matrix components and apply the matrix count.

*Needs:* §1.3; §1.4.

**Checks.**

- 0; L over 𝔽₃; L² over 𝔽₂; k[t]/t² over 𝔽₂: Ratios 1,1/2,4/6=2/3,2/2=1; residue formula gives respectively 1,1/2,2/3,1. Cancel the identical radical fibre.

### 1.6 neutrality for finite-field algebraic bands

Prove the following statement. Let k be finite. For every algebraic group A over k̄ and every k-kernel (band) on A, all nonabelian H² classes are neutral, with no connectedness or linearity assumption on A. Here algebraic groups have the classical reduced finite-type meaning; over a perfect field they are smooth. Thus a Frobenius-stable geometric isomorphism class of coherent sheaves admits a k-form. For the smooth connected unit groups of coherent endomorphism algebras, uniqueness of the form uses the separately imported H¹(k,G)=1. (S16, §2.2, proof of Lemma 2.6, p.311, citing Springer 1966 Theorem 3.5; S16 line 740).

The supporting input is SPR66, Theorem 3.5, p.179; SPR66 line 6739.

One route is as follows. Realize the isomorphism-class descent problem as a gerbe banded by the unit group of a finite-dimensional endomorphism algebra. Prove the general finite-field neutrality theorem for algebraic bands, then apply it to this descent gerbe; apply Lang to the set of forms only for its smooth connected unit group. Treat H² as classes with a distinguished neutral subset rather than as an ordinary group.

*Needs:* SchemeAndStackFoundations §§1.18–1.21; ReductiveGroupsPartII §RG2.3.7, Lang’s theorem.

**Checks.**

- For G_m over 𝔽₃, H² is zero and H¹ has one class, so the corresponding neutral gerbe has one isomorphism class of objects.
- For (𝔽₂[t]/t²)×, the two rational units are 1 and 1+t; its connected algebraic unit group has neutral H² and trivial H¹.
- For the disconnected constant C₂ over 𝔽₃, H²=0 but H¹ has two classes. Neutrality persists, while the uniqueness assertion requires connectedness.

### 1.7 Galois orbits of absolute summands

Prove the following statement. A k-indecomposable M with residue field `F_{q^e}` becomes over k̄ the sum of e pairwise nonisomorphic absolute indecomposables, permuted transitively by Frobenius, each of class [M]/e. Conversely a length-e Frobenius orbit of absolute indecomposables descends to exactly one k-indecomposable. If c_e(α) counts those orbits in geometric class α, then `A_{X_Fq^l}(α)=∑_{e|l} e c_e(α)`. In particular e divides both r and d for a bundle of class (r,d). (S16, §2.2, Lemma 2.6 and equations (2.4)–(2.5), pp.310–311; S16 line 658).

One route is as follows. Split the residue field under base extension and lift primitive idempotents across the radical. Indecomposability forces transitivity; identify the Frobenius orbit and its residue degree. Use neutrality for existence of descent and connected-unit-group Lang for uniqueness; count fixed points over Fq^l.

*Needs:* §1.2; §1.3; §1.6; ReductiveGroupsPartII §RG2.3.7, Lang’s theorem; §0.2.

**Checks.**

- Orbit e=1; orbit e=2 over 𝔽₂ with l=1,2: An e=2 orbit contributes 0 to A over k and 2 over k₂; divisor sum gives 0 and 2; descended class (2r,2d). Do not confuse orbit class α and descended class eα.

### 1.8 coprime indecomposables are absolute

Prove the following statement. If r>0 and gcd(r,d)=1, every k-indecomposable bundle of class (r,d) is absolutely indecomposable and End(M)/rad=k. Every f∈End(M) has a unique expression c·Id+n with c∈k and n nilpotent. This conclusion does not assert End(M)=k. (S16, §2.2, Lemma 2.6, pp.310–311; §6.5, Lemma 6.2, p.341; S16 line 658).

One route is as follows. The residue degree divides gcd(r,d), hence is one. Use the nilpotent radical and its scalar quotient to split each endomorphism.

*Needs:* §1.7; §1.3.

**Checks.**

- Class (2,1); local algebra k[t]/t²: e divides gcd(2,1)=1; End/rad=k while dim End=2; c+bt has unique scalar c and nilpotent bt. Do not claim End=k.

### 1.9 large degree and nonnegative HN slopes

Prove the following statement. If M is an indecomposable vector bundle of rank r>0 and d>(g−1)r(r−1), then μ_min(M)≥0. Thus `A_X^{≥0}(r,d)=A_X(r,d)` in that range. For g≥1 adjacent HN slopes of an indecomposable differ by at most 2g−2; genus zero uses the splitting theorem separately. (S16, §2.1, Proposition 2.1, p.308; Mozgovoy–Schiffmann §4, Lemma 4.1 and Corollary 4.2, p.8; S16 line 560; MS14, §4, Lemma 4.1 and Corollary 4.2, p.8; MS14 line 481).

One route is as follows. A larger slope gap kills the relevant Ext¹ by Serre duality and forces a direct-sum decomposition. Bound the spread of at most r positive-rank HN factors and compare the mean degree to the minimum. Use genus-zero splitting for the exceptional negative value of 2g−2.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract; §1.2.

**Checks.**

- g=0 and 1; rank 1, d=−1,0,1; g=2,r=2: Rank-one cutoff indicators are 0,1,1; g=2 bound is d>2, so d=3 is in range; genus-one gap bound is 0. Retain strict degree inequality and separate g=0.

### 1.10 basic count normalizations

Prove the following statement. For r>0 the count is finite, A_X(r,d+r)=A_X(r,d), and A_X(r,−d)=A_X(r,d). For r=1 it equals P_X(1)=#Pic⁰_X(k). For X of genus zero it is 1 for r=1 and 0 for r>1. No choice of rational point on X is required. (S16, §1.2, p.299; §5.8, pp.334–335; S16 line 81).

One route is as follows. Tensor with O(D_1) for a degree-one integer divisor, preserving all decompositions after base change. Dualization reverses degree and preserves absolute indecomposability. Use the Picard torsor and finite-field descent for rank one; use the genus-zero splitting theorem for higher ranks. Finiteness follows from §1.9 and HN boundedness.

*Needs:* §0.2; FunctionFieldArithmetic §0.2; FunctionFieldArithmetic §§5.1–5.4; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract; §1.9.

**Checks.**

- P¹ ranks 1,2; line twist and dual: Counts 1,0; A(1,−1)=A(1,0)=A(1,1)=P(1). Use a degree-one divisor, not a rational point.

### Examples

Over 𝔽₂ the four nilpotent 2×2 matrices are the zero matrix and the three conjugates of its nonzero Jordan block. The general-linear group has six elements, so their mass ratio is 4/6=2/3. A line over 𝔽₃ has one nilpotent endomorphism and two automorphisms, giving 1/2 (S16, Corollary 2.5, p.309; S16 line 639).

### Dependencies

- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.
- RepresentationTheory/ArtinAlgebras Layer 0.
- SchemeAndStackFoundations §2.6.
- `Finite.isDomain_to_isField`.
- `IsArtinianRing.isNilpotent_jacobson_bot`.
- `IsArtinianRing.isSemisimpleRing_iff_jacobson`.
- `Matrix.card_GL_field`.
- QSeriesPartitionsAndMockModularForms §2.4.
- SchemeAndStackFoundations §§1.18–1.21.
- ReductiveGroupsPartII §RG2.3.7, Lang’s theorem.
- §0.2.
- FunctionFieldArithmetic §0.2.
- FunctionFieldArithmetic §§5.1–5.4.

## Layer 2: nilpotent pairs and Jordan filtrations

### 2.1 homotopy fibres and mass Fubini

Define the following objects and their indicated structure. For a functor F:G→H between essentially finite groupoids, define its homotopy fibre over h as the groupoid of pairs (x,φ:F(x)≅h) with commuting isomorphisms. Using the supplied rational groupoid mass, prove mass(G)=∑_[h] mass(F⁻¹(h))/#Aut(h). For a nonnegative infinite mass sum, convergence is a separate hypothesis before a real value is used. (S16, §2.1–2.2, pp.308–309; §3.2–3.3, pp.313–315 (fibre convention made explicit); S16 line 560).

The interface has the following properties.

- The projection F⁻¹(h)→G forgets φ, with its specified source and target.
- An equivalence of arrows of groupoids induces an equivalence of homotopy fibres, hence preserves their supplied masses.
- The homotopy-fibre formula holds for an essentially finite base and essentially finite fibres; the nonnegative convergent version follows by regrouping the terms.

One route is as follows. Identify the fibre groupoid of a representative with the corresponding isomorphism-marked objects. Apply finite orbit–stabilizer to each automorphism action and sum over the finite base skeleton.

*Needs:* WeilConjectures WC.1, Finite groupoid mass; SchemeAndStackFoundations §§1.18–1.21.

**Checks.**

- For Id:BS₃→BS₃ the homotopy fibre has mass 1, and Fubini gives 1/6=1·(1/6).
- For BC₂→BS₃ induced by a transposition subgroup, the fibre is the three-element coset set, and 1/2=3·(1/6).
- For B(C₂×C₂)→BC₂ induced by projection, the fibre is BC₂, and 1/4=(1/2)·(1/2). Taking inverse images of isomorphism classes instead would lose these fibre automorphisms.

### 2.2 nilpotent-pair groupoids

Define the following objects and their indicated structure. Nil_α has objects (F,θ), F∈Coh_α(X), θ∈End(F), θ^s=0 for some s≥1; arrows are isomorphisms intertwining θ. `Nil_α^{≥0}` requires `F∈Coh^{≥0}`. For each fixed α=(r,d) with r,d≥0 the truncated groupoid is essentially finite and `mass(Nil_α^{≥0})=∑_[F] #End_nil(F)/#Aut(F)`. Include (0,0) as the unit pair. (S16, §2.1, p.308; §2.2, Proposition 2.2, pp.308,311–312; S16 line 560).

The interface has the following properties.

- Forget θ and retain the underlying coherent sheaf, compatibly with field extension.
- The action-groupoid mass is #nilpotents/#Aut, not a count of conjugacy classes.
- The unique zero pair has trivial automorphism group and mass 1.

One route is as follows. Form the action groupoid of Aut(F) on nilpotent endomorphisms over each sheaf class. Use finite-type HN boundedness and finite endomorphism sets. Apply mass_actionGroupoid on each isomorphism class.

*Needs:* §2.1; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; §1.9.

**Checks.**

- On a fixed line bundle only θ=0 is nilpotent, and its mass is 1/(q−1).
- Id_L is excluded from Nil for nonzero L.
- For k[t]/t² supported at a rational point, multiplication by t is a nonzero nilpotent pair.

### 2.3 nilpotent-pair exponential identity

Prove the following statement. In Q[[T,z]] with α=(r,d), r,d≥0, `∑_α mass(Nil_α^{≥0})T^r z^d = exp(∑_{l≥1}∑_{α≠0} A_{X_Fq^l}^{≥0}(α)T^{lr}z^{ld}/(l(q^l−1)))`. After universal Adams-compatible coefficients exist this is `Exp(∑_{α≠0} A_{g,α}^{≥0}T^r z^d/(q−1))`. The first identity is an ordinary exponential of a tower of numerical counts. (S16, §2.2, Proposition 2.2 and its proof, pp.308,311–312; S16 line 560).

One route is as follows. Factor the sum into one Euler factor per k-indecomposable, using Krull–Schmidt and the unit ratio. Use Heine’s series for each multiplicity. Regroup Frobenius orbits with the divisor identity from galois-orbits.

*Needs:* §2.2; §1.5; §1.7; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- One absolute line factor at q=2; degrees 0,1,2: Series coefficients 1,1,2/3; exp(T+T²/6+⋯) gives 1,1,1/2+1/6=2/3. Adams changes both q and T.

### 2.4 Jordan type of a coherent nilpotent pair

Define the following objects and their indicated structure. Let K_i=ker θ^i and F_i=im θ^i, with θ^s=0. Define `α_i=[F_{i−1}/F_i]−[F_i/F_{i+1}]` for 1≤i≤s (F_s=0). These are classes of actual coherent kernel quotients, satisfy ∑i iα_i=[F], and allow zero internal terms; only trailing zero terms are omitted. Their rank multiplicities r_i give `λ=(1^{r_1}2^{r_2}…)`. (S16, §3.1, pp.312–313; §5.6, pp.331–332; S16 line 800).

The interface has the following properties.

- ∑i iα_i equals the full rank-degree class of F.
- Flat finite-field extension preserves image, kernel and the Jordan class tuple.
- Generic fibre has r_i blocks of size i, in the imported YoungDiagram convention.

One route is as follows. Use the surjection `F_{i−1}/F_i→F_i/F_{i+1}` to realize each difference as its kernel class. Telescope the class identities with weights i. At the generic point recover the usual nilpotent Jordan-block partition.

*Needs:* §2.2; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; `YoungDiagram`.

**Checks.**

- For θ=0 on nonzero F, α_1=[F] and every α_i with i>1 is zero.
- For a two-dimensional nilpotent Jordan block over the generic field, ranks are r_1=0,r_2=1, giving total rank 2 rather than 1.
- For rank-zero F all r_i vanish but the nonzero degree components of α_i must be retained.

### 2.5 filtered-sheaf groupoids

Define the following objects and their indicated structure. For a finite tuple α=(α_1,…,α_s), Filt_α consists of flags 0=H_0⊂H_1⊂…⊂H_s=H with `[H_i/H_{i−1}]=α_i`, allowing equality for zero class. `Filt_α^{≥0}` restricts the total H to `Coh^{≥0}`, not every quotient to a semistability condition. Coh_α is the product `∏_i Coh_{α_i}`. (S16, §3.2–3.3, pp.313–315; S16 line 846).

The interface has the following properties.

- Send a flag to the ordered tuple of quotients `H_i/H_{i−1}`.
- The total class is ∑α_i and is preserved by flag isomorphisms.
- Deleting a zero graded step gives an equivalent groupoid with the same total-sheaf cutoff.

One route is as follows. Use the supplier abelian category and flag isomorphisms. Define the graded-object functor and the full subcategory on a total-sheaf HN cutoff.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§1.18–1.21; §2.1.

**Checks.**

- On P¹ the flag 0⊂O(−1)⊂O², with quotient O(1), has total minimum slope 0 and passes the cutoff at 0, although its first graded piece has slope −1. A cutoff on every graded piece would reject it.
- The flag 0⊂O(1)⊂O(1)⊕O(−1) has total minimum slope −1 and fails the cutoff at 0, although its first graded piece has positive slope.
- Over 𝔽₂ the flags with fixed total O² and graded pieces O,O give three subobjects. Their quotient by GL₂(𝔽₂), of order 6, has mass 3/6=1/2; counting unweighted isomorphism classes would give 1.

### 2.6 Jordan grading functors

Define the following objects and their indicated structure. For (F,θ) of Jordan type α, set H=F/im θ and H_i=ker θ^i/(ker θ^i∩im θ)⊂H. The functor π′ maps to this flag, π″ takes its graded quotients, and π=π″∘π′ maps to Coh_α. The cutoff square `Nil_α^{≥0}→Nil_α` over `Filt_α^{≥0}→Filt_α` is cartesian. (S16, §3.2, pp.313–314; S16 line 846).

The interface has the following properties.

- π equals π″ composed with π′ on objects and morphisms.
- The i-th output has class α_i.
- `F∈Coh^{≥0}` iff `F/im θ∈Coh^{≥0}`.

One route is as follows. Identify the i-th graded quotient with the kernel quotient defining α_i. Check intertwining isomorphisms preserve all terms. Use quotient and extension closure of `Coh^{≥0}` to prove the cutoff equivalence.

*Needs:* §2.4; §2.5.

**Checks.**

- The zero endomorphism on O has H=O, H₁=O and gives the one-step identity flag.
- A length-two block has H₁=0,H₂=H, rather than a nonzero first step.
- On F=O(−1)² over P¹, let θ send the second summand identically to the first and kill the first. Then H=O(−1), H₁=0,H₂=H. Both total-F and total-H cutoffs at 0 are false, with minimum slopes −1.
- At a rational point x, take F=k[t]/(t²) and θ multiplication by t. Then H=k_x, H₁=0,H₂=k_x and α₂=(0,1). F and H have degrees 2 and 1 and minimum slope +∞, so both cutoffs at 0 are true.

### 2.7 Jordan fibre mass formula

Prove the following statement. Write E(α,β)=(1−g)rr′+rd′−r′d and S(α,β)=E(α,β)+E(β,α). Set `d=−∑_i(i−1)E(α_i,α_i)−∑_{i<j}iS(α_i,α_j)`, `d″=−∑_{i<j}E(α_j,α_i)`, d′=d−d″. Every homotopy fibre of π,π′,π″ has respective mass `q^d,q^{d′},q^{d″}`. In particular `mass(Nil_α^{≥0})=q^{d′}mass(Filt_α^{≥0})`. (S16, §3.2–3.3, Proposition 3.1, pp.313–315; S16 line 846).

One route is as follows. Build the nilpotent diagram from its last nonzero step by extension torsors. At each stage the automorphisms and possible lifts contribute q^(dim Ext¹−dim Hom). Apply Euler–Riemann–Roch and telescope to the displayed exponents; apply Fubini to the cutoff square.

*Needs:* §2.6; §2.1; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.

**Checks.**

- One step; α₂=[O] in genus g over 𝔽₂: One step d=d′=d″=0 gives fibre mass 1; length-two d=g−1,d″=0 gives 2^(g−1); for g=0 it is 1/2. Keep homotopy markings in the fibre.

### Examples

For a single absolute line species over 𝔽₂, multiplicity two contributes 2/3. In the numerical tower exponential the coefficient is 1/2+1/(2(2²−1))=2/3. For a length-two Jordan block the only nonzero generic multiplicity is r₂=1, and its underlying rank is 2, not 1 (S16, Proposition 2.2 and (3.2), pp.308–312; S16 line 600 and S16 line 831).

### Dependencies

- WeilConjectures WC.1, Finite groupoid mass.
- SchemeAndStackFoundations §§1.18–1.21.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- §1.9.
- §1.5.
- §1.7.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- `YoungDiagram`.
- SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.

## Layer 3: the curve Hall algebra and flag masses

### 3.1 Hall algebra of a curve

Define the following objects and their indicated structure. For each class α let H_α be all Q(v)-valued functions on coherent isomorphism classes, v²=q, and H_fin its finitely supported part. For f∈H_β,g∈H_α set `(fg)(F)=v^{E(β,α)}∑_{A⊂F,[A]=α} f(F/A)g(A)`. Define `Δ′h(B,A)=v^{E(β,α)}∑_{ξ∈Ext¹(B,A)}h(F_ξ)/#Hom(B,A)`. Adjoin k_γ,γ∈Z² with `k_γ f k_−γ=v^{S(γ,α)}f` for f∈H_α and `Δh=∑_{β+α=[h]}Δ′_{β,α}(h)(k_α⊗1)`, Δk_γ=k_γ⊗k_γ. Products on completions are defined only with support conditions giving finite coefficients. (S16, §4.1, pp.315–316; S16 line 934).

The interface has the following properties.

- The product coefficient is the displayed finite subobject sum whenever the support conditions hold.
- Associativity follows from the two ways of forgetting a length-two flag; the zero sheaf is the unit.
- The extension-groupoid formula agrees with Δ′, including the Hom denominator.
- Coefficient-ring extension preserves product, coproduct and group-like elements wherever both sides are defined.

One route is as follows. Push and pull along the groupoid of short exact sequences, using homotopy-fibre mass. Identify the product with actual subobjects and the coproduct with extension classes divided by Hom. Adjoin the numerical group algebra and prove the stated commutation relations.

*Needs:* §2.1; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.

**Checks.**

- δ_0 f=f=f δ_0.
- If Ext¹(B,A)=0, `Δ′δ_(A⊕B)(B,A)=v^{E(β,α)}/#Hom(B,A)`.
- Switching A and B changes E(β,α) to E(α,β); these exponents need not agree for unequal degrees.

### 3.2 Green bialgebra and hopf pairing

Prove the following statement. The extended curve Hall algebra with the specified graded completion is a bialgebra. On finite support, (f|g)=∑_[F] f(F)g(F)/#Aut(F); its compatibility is (fg|h)=(f⊗g|Δ′h), and the extended pairing uses the corresponding v-power on k_γ. Coproduct/product continuity is proved in the HN support completion, not an unqualified algebraic tensor product. (S16, §4.1, p.316; S16 line 979; HN10, §1.2–1.3, pp.2–3; HN10 line 46).

One route is as follows. Compare two-step exact-sequence diagrams and their homotopy fibres; hereditary Coh(X) eliminates Ext². Prove Green’s coefficient identity with the numerical Euler twist. Verify pairing adjunction on delta functions and extend to the stated support domains.

*Needs:* §3.1; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.

**Checks.**

- O and O on P¹ over 𝔽₂: δ_O²(O²)=3v and |GL₂(𝔽₂)|=6, giving v/2; Δ′ at (O,O)=v/2 and |Aut O|=1, giving v/2. The two sides agree with the same Euler sign.

### 3.3 Hall characteristic functions

Define the following objects and their indicated structure. Write `1_α,1_α^vec,1_α^{≥0},1_α^{<0}` for the characteristic functions of all sheaves, bundles and the indicated total-HN cutoffs in class α; use superscripts together for intersections. The symbol 1_0 denotes δ_0. These may lie in the HN completion rather than H_fin. Pairing a cutoff characteristic with itself gives its groupoid mass. (S16, §4.2, pp.315–316; §4.4, p.319; S16 line 1001 and S16 line 1137).

The interface has the following properties.

- Evaluation is 1 exactly on the named isomorphism-invariant subcategory and 0 outside it.
- The self-pairing equals the mass of that subgroupoid when finite or proved convergent.
- For γ=(r,d), r>0, `1_γ=∑_{l≥0}v^{−rl}1^vec_(r,d−l)1_(0,l)` in the HN completion.

One route is as follows. Pull the characteristic predicates back to isomorphism classes. Verify their support in each finite HN quotient and establish evaluation by delta functions. Identify the pairing with the mass sum on its convergence domain.

*Needs:* §3.1; §3.2; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.

**Checks.**

- 1_(0,d) is a torsion characteristic for d>0, and 1^vec_(0,d)=0.
- For rank 0 and degree <0, all these functions vanish.
- For r=2,l=1 the coefficient is v^−2; replacing it by v^−1 fails to cancel the Hall Euler twist.

### 3.4 Hall expression for filtered masses

Prove the following statement. For α=(α_1,…,α_s), `mass(Filt_α^{≥0})=q^{−(1/2)∑_{i>j}E(α_i,α_j)}(1_{α_s}⋯1_{α_1}|1^{≥0}_{∑α_i})`. The same formula applies to other total-HN cutoffs whose masses are finite. (S16, §4.2, equation (4.1), p.316; S16 line 979).

One route is as follows. Expand the ordered Hall product by successive subobjects. Compute its accumulated Euler exponent. Pair with the total-HN characteristic and divide by automorphisms of the total sheaf.

*Needs:* §2.5; §3.3; §3.2.

**Checks.**

- Flag O⊂O² on P¹/𝔽₂: Three flags divided by 6 automorphisms give 1/2; q^(−1/2) times pairing v/2 gives 1/2. Order and Euler correction match.

### Examples

On P¹/𝔽₂, the sheaf O² has three O-subobjects with quotient O and six automorphisms. The flag mass is 1/2; the Hall product has coefficient 3v, the Green pairing v/2, and the Euler correction v⁻¹ recovers 1/2. This same quotient-left order fixes every Eisenstein shift in Layer 4 (S16, (4.1), p.316; S16 line 1011).

### Dependencies

- §2.1.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.
- §2.5.

## Layer 4: Eisenstein series and universal Hall forms

### 4.1 curve Eisenstein series

Define the following objects and their indicated structure. Set `E_r(z)=∑_{d∈Z}1_(r,d)z^d` and E_r^vec(z)=∑_d1^vec_(r,d)z^d for r>0. Set `E_0(z)=1+∑_{l>0}1_(0,l)z^l` and E_0^vec(z)=1. A superscript ≥0 or <0 restricts the total sheaf by HN slopes. The positive-rank untruncated series are bilateral distributions; rational identities mean identities after evaluation with the specified regional expansions. They are not all elements of one Laurent-series field. (S16, §4.3, pp.317–318; §4.4, p.319; S16 line 1030).

The interface has the following properties.

- The z^d coefficient is the named characteristic function in class (r,d).
- `E_r(z)=E_r^vec(z)E_0(q^{−r/2}z)`, for r≥0 in its valid support completion.
- HN restriction of each coefficient gives the corresponding ≥0 or <0 series.

One route is as follows. Package homogeneous characteristic coefficients as formal distributions. For products specify coefficientwise finite HN restrictions, or evaluate on one fixed sheaf to obtain a rational expression. Use torsion-factor normalization to get `E_r(z)=E_r^vec(z)E_0(q^{−r/2}z)`.

*Needs:* §3.3; supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13.

**Checks.**

- On P¹/𝔽₂ evaluate the rank-one torsion factorization on O⊕k_x for rational x. The unique torsion subobject has Hall factor v and the substituted E₀ coefficient has factor v⁻¹, giving z on both sides. Omitting the substitution gives vz.
- On O(1)⊕O(−1), the degree-zero coefficient of E₂ has value 1 and its ≥0 restriction has value 0; on O² both values are 1. Restricting by average slope would fail this test.
- On O(−1), E₁^vec evaluates to z⁻¹, its ≥0 restriction to 0 and its <0 restriction to z⁻¹. Thus the unrestricted series needs negative degrees.

### 4.2 Harder hecke commutation

Prove the following statement. With |z|≪|w| and r≥0, `E_0(z)E_r^vec(w)=∏_{i=0}^{r−1}ζ_X(q^{−r/2+i}z/w) E_r^vec(w)E_0(z)`. The zeta factors are expanded at z/w=0. (S16, §4.3, Theorem 4.2(ii), p.318; S16 line 1080).

One route is as follows. Compute the torsion modification correspondence on bundles. Factor by closed points and apply the local Hecke calculation. Assemble the Euler product with the displayed rank-dependent q-shifts.

*Needs:* §4.1; §3.1; FunctionFieldArithmetic §§5.1–5.4.

**Checks.**

- r=0,1,2 at q=2: Empty zeta product 1; arguments q⁻¹ᐟ²z/w for r=1, and z/(2w),z/w for r=2. Expand at z/w=0.

### 4.3 Harder Eisenstein coproduct

Prove the following statement. For r=s+t, `Δ′E_r(z)=∑_{s+t=r}q^{st(g−1)/2}E_s(q^{t/2}z)⊗E_t(q^{−s/2}z)`. For bundles replace the first factor by `E_s^vec(q^{t/2}z)E_0(q^{(t−s)/2}z)E_0(q^{−(t+s)/2}z)⁻¹` and the second by `E_t^vec(q^{−s/2}z)`. The sums include s=0,t=0 with the rank-zero conventions. (S16, §4.3, Theorem 4.2(iii), p.318; S16 line 1080).

One route is as follows. Expand Δ′ by extensions and apply the Euler form to fix q-powers. For bundle factors remove the torsion factor using E_r=E_r^vec E_0 and its invertible constant term. Check the first factor’s quotient placement against the chosen Hall order.

*Needs:* §4.1; §3.2; §4.2.

**Checks.**

- r=0; rank split (1,1) in genus 0: Δ′E₀=E₀⊗E₀; prefactor q⁻¹ᐟ² and arguments q¹ᐟ²z,q⁻¹ᐟ²z. Keep zero-rank factors and argument signs.

### 4.4 bundle Eisenstein residue presentation

Prove the following statement. For r≥1, `E_r^vec(q^{(1−r)/2}z_1)=q^{−(g−1)r(r−1)/4}V_1^{−r}V_r · rRes_(z_r/z_(r−1)=q⁻¹,…,z_2/z_1=q⁻¹)[E_1^vec(z_r)⋯E_1^vec(z_1)]`. Here rRes is the coefficient of (1−z_i/(q⁻¹z_(i−1)))⁻¹, taken in descending variable order; it is not the usual differential residue. (S16, §4.3, Theorem 4.2(iv), p.318; §1.4, p.303; S16 line 1080).

One route is as follows. Use Harder’s rank-one Eisenstein residue theorem. Normalize the coefficient by comparing the Green pairing with the known V_r. Apply the fixed descending-variable normalized residues.

*Needs:* §4.3; supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13; §0.3.

**Checks.**

- r=1; r=2,g=1: r=1 prefactor V₁⁻¹V₁=1 with no residues; rank-two chain z₂/z₁=q⁻¹ has rRes h⁻¹=1. Do not use the differential sign.

### 4.5 HN relations for truncated Eisenstein series

Prove the following statement. In the HN completion `E_r(z)=∑_{s+t=r}q^{(g−1)st/2}E_s^{<0}(q^{t/2}z)E_t^{≥0}(q^{−s/2}z)`, and the same identity holds for the bundle series. Also `E_r^{≥0}(z)=E_r^{vec,≥0}(z)E_0(q^{−r/2}z)`. (S16, §4.4, equation (4.4), p.319; S16 line 1128).

One route is as follows. Use the unique HN split into negative-slope quotient and nonnegative-slope subobject. Evaluate its Hall Euler factor. Separate the torsion piece of the nonnegative part.

*Needs:* §4.1; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; §3.1.

**Checks.**

- O(1)⊕O(−1) on P¹: Positive subobject has degree 1, negative quotient −1; E((1,−1),(1,1))=3 and shifts multiply the correction to 1. Negative quotient lies on the left.

### 4.6 spherical curve Hall algebra

Define the following objects and their indicated structure. H_sph is the subalgebra of H_fin generated by 1^vec_(1,d),d∈Z, and 1_(0,l),l>0. Its extension includes all k_γ. Its HN completion is obtained using the same slope-bounded quotients as H. The word integral in an R_g-form concerns its coefficient ring; it does not assert every counting polynomial has integer monomial coefficients. (S16, §4.5, pp.319–320; S16 line 1128; HN10, §1.3, p.3; HN10 line 95).

The interface has the following properties.

- The inclusion into H_fin is an injective algebra map compatible with the extended group algebra.
- An algebra map out of H_sph is determined by its values on the rank-one and torsion generators satisfying their Hall relations.
- The closure is computed in the HN support topology, not by a degree-only completion.

One route is as follows. Take the generated subalgebra in the imported function space. Restrict the Hall operations and specify the completion. Use the HN membership theorem below rather than assume completed characteristic functions have finite support.

*Needs:* §3.1; §3.3.

**Checks.**

- On P¹/𝔽₂ the degree-zero line generator squared has value 3√2 on O²: there are three sublines O with quotient O and Euler twist √2. The rank-two degree-zero bundle characteristic has value 1 there.
- The degree-one torsion generator has value 1 on κ(x) for a rational point x and value 0 on O; it is distinct from the line generator.
- The pairwise nonisomorphic bundles O(m)⊕O(−m), m≥0, all have class (2,0), and its full characteristic takes value 1 on each. It has infinite support and requires the HN completion.

### 4.7 HN strata are spherical

Prove the following statement. For every fixed HN type τ the finite-support characteristic 1_τ belongs to H_sph. Consequently the total ≥0 and <0 characteristics and fixed-class bundle characteristics belong to its HN completion. (HN10, Theorem 3.1 and its proof, pp.5–8; Corollary 3.5, p.8; HN10 line 184; S16, §4.5, p.319, using HN10 Theorem 3.1; S16 line 1128).

One route is as follows. Apply the source’s induction on rank and HN polygon to recover semistable characteristics from rank-one generators. Recover a fixed HN stratum by its ordered semistable Hall product. Pass to HN-finite coefficient sums for the completed characteristics.

*Needs:* §4.6; §4.5; §4.4; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.

**Checks.**

- On P¹ the HN types ((2,0)) and ((1,1),(1,−1)) each have one rational bundle class, O² and O(1)⊕O(−1), respectively. The types ((1,m),(1,−m)), m>0, together with ((2,0)), give infinitely many classes in total class (2,0). The putative two-step type ((1,0),(1,0)) is inadmissible because its slopes are equal; its HN stratum is empty.

### 4.8 universal spherical Hall form

Prove the following statement. There is a torsion-free generic spherical form generated by the rank-one, torsion and k_γ symbols, whose Hall multiplication and Green pairings are rational functions of the reciprocal Weil coordinates. After dividing scalar flag masses by their Hall Euler twists, these masses lie in K_g and specialize to the curve values. The standard v²=q normalization may first be constructed over R_g[v±1]/(v²−q); descent of the normalized algebra structure to R_g and its scalar pairings to K_g with denominators generated by q^m−1 is part of this target, not an assumed square-root cancellation. (S16, §4.5, Theorem 4.4, pp.319–320; §4.6, p.321; S16 line 1128; SV12, §1.11, preprint p.13; SV12 line 659).

One route is as follows. Use the shuffle presentation to construct the torus coefficient algebra and its torsion-free generated form. Extend by the torsion Hecke algebra and numerical group algebra, preserving the pairing. Descend the reciprocal-invariant scalar expressions and track every allowed denominator. Prove the comparison between the torus coefficient form and the reciprocal-invariant paired form, including its denominator bounds.

*Needs:* §4.6; §4.7; §4.2; §4.3; §0.1.

**Checks.**

- One line mass; q=2,3: P(1)/(q−1) specializes to P(1),P(1)/2; normalized flag v factors cancel in the one-step scalar. Require invariant descent and allowed denominators.

### 4.9 universal truncated and bundle counts

Prove the following statement. There are unique elements C_α(K_g) for the truncated coherent masses and N_α(K_g) for the truncated nilpotent masses, and `A_{g,α}^{≥0}∈K_g`, whose specializations are their named finite-field values. Their plethystic relation is `Exp(∑_{α≠0}A_{g,α}^{≥0}T^r z^d/(q−1))=∑_α N_αT^r z^d`. For r>0 eventual periodicity defines a unique `A_{g,r,d}∈K_g` specializing to A_X(r,d). (S16, §4.5, Corollaries 4.5–4.6, pp.320–321; §4.6, p.321; Theorem 1.1, p.299; S16 line 1179).

One route is as follows. Express every fixed-cutoff flag mass by spherical pairings and apply generic-form. Sum finitely many Jordan types in each class and apply the plethystic logarithm coefficient recursion. Use large-degree and tensor periodicity to remove the cutoff; use §4.10 for uniqueness.

*Needs:* §4.8; §3.4; §2.7; §2.3; §1.9; §1.10; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5; §4.10.

**Checks.**

- Write N(T,z)=∑N_(r,d)T^rz^d and N₀(z)=[T⁰]N(T,z). The zero-class mass is 1, while N₀ includes nonzero torsion sheaves and need not equal 1.
- After dividing out N₀(z), the rank-one coefficient is P(1)/((q−1)(1−z)); multiplying the rank-one coefficient of Log N by q−1 recovers P(1)/(1−z). Adams operations of index greater than one cannot contribute to rank one. The torsion cancellation is the passage from (5.19) to (5.20) (S16, p.334; S16 line 2224 and S16 line 2246).
- On P¹/𝔽₂, N₀=1+3z+O(z²) and [T]N=N₀/(1−z)=1+4z+O(z²), whereas [Tz](N/N₀)=1. In class (1,1), O(1) contributes 1 and each of the three O⊕κ(x) contributes 2/2=1: nilpotence forces both diagonal entries to vanish and leaves two choices for the off-diagonal entry. All four sheaves satisfy the cutoff. Dropping torsion from N would give 1 instead of 4.

### 4.10 density of curve Weil tuples

Prove the following statement. For every g≥1, the classes σ_X in T_g/W_g of smooth projective geometrically connected genus-g curves over finite fields of odd characteristic are Zariski dense, with q retained as the unnormalized multiplier coordinate. For g=0, the prime-power values of q are dense in G_m. This density subset suffices for uniqueness of functions whose specializations are asserted over every finite field. (S16, Proposition 4.7 and Appendix B, pp.321,357–358; S16 line 1258 and S16 line 3321).

One route is as follows. Fix an odd q₀ and an auxiliary ℓ≥5 prime to q₀. Use the odd-degree hyperelliptic family of ArithmeticStatisticsPartVIII §5.17, whose geometric monodromy is Sp_(2g)(ℤ_ℓ). Half-Tate normalization puts its classes in the compact symplectic group; apply DeligneWeightsAndPurity §10.5 on the degree fibres. To recover the radial direction, pull a Weyl-invariant Laurent function back along (z,t)↦(tz₁,…,tz_(2g)), so q=t², and divide by its highest power of t. The leading coefficient h₀(z) is nonzero if the function is nonzero, and all remaining powers of t are negative. Equidistribution supplies normalized tuples z_m approaching a point with h₀≠0 along unbounded extension degrees m. At t=q₀^(m/2), the lower terms tend to zero while h₀(z_m) tends to a nonzero value, contradicting vanishing on every curve tuple. This uses boundedness of the coefficient functions on the compact torus; density in q alone would not prove the claim. For g=0 a nonzero Laurent polynomial has only finitely many nonzero roots (S16 line 3363).

*Needs:* §0.1; ArithmeticStatisticsPartVIII §5.17; DeligneWeightsAndPurity §§1.7, 10.5.

**Checks.**

- At g=1, ℓ=5 the integral geometric image is Sp₂(ℤ₅); the full mod-3 image alone would allow a proper genus-one subgroup of index 27.
- At q₀=3 and extension degrees 1 and 2, half-Tate normalization changes multipliers 3 and 9 to 1 and 1. The unnormalized q coordinate still takes values 3 and 9; replacing it by 1 loses the radial direction.
- At g=0, a Laurent polynomial vanishing on every 3^m, m≥1, is zero. The nonzero polynomial q−3 vanishes at q=3 but takes value 6 at q=9. In the radial argument, (q−3)/t²=1−3/t² at t=3^(m/2) has values 0, 2/3 and 8/9 for m=1,2,3 and tends to 1, contradicting vanishing along an unbounded-degree sequence.

### Examples

At rank one the bundle mass V₁ is P_X(1)/(q−1); at rank zero the bundle series is 1 and the coherent series has torsion coefficient #X(k)/(q−1). On P¹ the bundles O(m)⊕O(−m), m≥0, show why a fixed class alone is not finite support (S16, Theorems 4.1–4.2, pp.316–318; S16 line 1015 and S16 line 1092).

### Dependencies

- §3.3.
- supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13.
- §3.1.
- FunctionFieldArithmetic §§5.1–5.4.
- §3.2.
- §0.3.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- §0.1.
- §3.4.
- §2.7.
- §2.3.
- §1.9.
- §1.10.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- §4.10.
- ArithmeticStatisticsPartVIII §5.17.
- DeligneWeightsAndPurity §§1.7, 10.5.

## Layer 5: shuffle pairings and partition kernels

### 5.1 Eisenstein pairing series

Define the following objects and their indicated structure. For a finite rank tuple r=(r_1,…,r_s) with n=∑r_i, define `G_r^{≥0}(z_s,…,z_1;w)=(E_{r_s}(z_s)⋯E_{r_1}(z_1)|E_n^{≥0}(w))`, and `Y_r^*(z_s,…,z_1;w)=(E^vec_{r_s}(z_s)⋯E^vec_{r_1}(z_1)|E_n^*(w))`, for *=empty,≥0,<0. Write `r_<i=∑_{j<i}r_j,r_>i=∑_{j>i}r_j`. The ≥0 rational function is expanded with z_1≫⋯≫z_s and w≪1, in power series in z_(i+1)/z_i and w; the <0 expression uses the same z order and w≫1, hence powers of w⁻¹ (S16, Proposition 5.3, p.325; S16 line 1545). Coefficients specify the degree in each slot, so this notation is a distribution where n>0 and *=empty. (S16, §5.1–5.2, pp.321–324; S16 line 1218).

The interface has the following properties.

- The `z_1^{d_1}⋯z_s^{d_s}w^{∑d_i}` coefficient is the named ordered Hall pairing.
- A zero bundle rank slot contributes the unit and may be deleted from Y, while a coherent rank-zero slot contributes torsion in G.
- The rational representative and its regional expansions agree coefficientwise with the defining pairing on the indicated domains.

One route is as follows. Pair each graded coefficient using finite HN cutoffs. Use the coproduct to establish rationality in the two specified regions. Distinguish the source’s reversed tuple notation from the order of the z_i symbols.

*Needs:* §4.1; §3.2.

**Checks.**

- `Y_(r)(z;w)=V_r∑_{d∈Z}(zw)^d` for r>0.
- For s=1, V₁/(1−zw) at w=0 has coefficients V₁ in degrees d≥0; −V₁/(1−zw) at w=∞ has coefficients V₁ in degrees d<0. Expanding the first expression at infinity would give −V₁ in negative degrees and would fail the nonnegative cutoff.
- Y_(0,r) and Y_(r) agree after forgetting the unused zero-rank variable.
- For two unequal ranks reversing the Hall order also reverses the cross-term q-shifts; simply reversing the displayed tuple is invalid.

### 5.2 separation of the torsion factor

Prove the following statement. With n=∑r_i and X=[1−∑α_j+q], set `X_r(z;w)=Exp(X/(q−1)·[∑_i q^{−(n+r_i)/2}z_iw+∑_{i>j}(z_i/z_j)(q^{r_j/2}−q^{−r_j/2})q^{−r_i/2}])`. Then `G_r^{≥0}=X_r Y_r^{≥0}` in the ordered expansion region; ev_X(X)=#X(k), and Adams on X gives #X(Fq^l). (S16, §5.1, Proposition 5.1 and proof, pp.321–323; S16 line 1218).

One route is as follows. Insert E_r=E_r^vec E_0(q^−r/2 z) in the ordered product. Commute all torsion factors to the right using the Hecke identity. Pair them against `E_n^{≥0}`; collect cross terms and use the torsion mass exponential.

*Needs:* §5.1; §4.2; §4.3; supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- One rank-one slot; q=2: X₁=Exp([X]zw/(q(q−1))); its zw coefficient is #X(k)/2, not #X(k). Retain the total-rank shift.

### 5.3 untruncated bundle pairing

Prove the following statement. For all r_i≥0, `Y_r(z_s,…,z_1;w)=q^{(g−1)∑_{i>j}r_ir_j/2}(∏_i V_{r_i})∏_i ∑_{l∈Z}(z_iw q^{(r_<i−r_>i)/2})^l`, deleting zero-rank bundle slots before interpreting their bilateral factor. (S16, §5.3, Lemma 5.2, p.324; S16 line 1432).

One route is as follows. Iterate the coherent Eisenstein coproduct. Pair each bundle factor using the degree-independent mass V_r. Read the remaining coefficient constraints as separate bilateral delta distributions.

*Needs:* §5.1; §4.3; supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13.

**Checks.**

- s=1; (r₁,r₂)=(1,2): s=1 gives V_r∑(zw)^d; two shifts are q⁻¹ and q¹ᐟ², interchanged incorrectly by a silent order reversal. Delete zero slots before bilateral factors.

### 5.4 separation of regional expansions

Prove the following statement. Let f_1,…,f_m be rational functions with denominators products of nonzero binomials in the degree variables, and let each be expanded in an admissible monomial order as a formal distribution. If the sum of these distributions is zero, then ∑_i f_i=0 as a rational function. Only multiplication of a distribution by a Laurent polynomial is required. (S16, §5.4, Lemma 5.4, pp.328–329; S16 line 1689).

One route is as follows. Choose a common Laurent-polynomial denominator. Multiplication clears each expansion to the same Laurent polynomial. Inject Laurent polynomials into the distribution module and cancel the nonzero denominator in the rational function field.

*Needs:* §5.1.

**Checks.**

- 1/(1−z) at 0 and infinity: Expansions `∑_{n≥0}z^n` and `−∑_{n<0}z^n`; multiplying either by 1−z gives 1. Equality is after polynomial denominator clearing.

### 5.5 rank-one truncated shuffle formulas

Prove the following statement. Let s≥1, `Z=∏_{i<j}ζ̃(z_i/z_j)` and `C=q^{(g−1)s(s−1)/4}V_1^s/Z`. Then `Y_(1^s)^{≥0}=C·∑_{σ∈S_s}σ[Z/(∏_{i<s}(1−qz_(i+1)/z_i)·(1−q^{(1−s)/2}z_1w))]`. For <0 the formula is `(−1)^s C·∑_σ σ[Z/(∏_{i<s}(1−q⁻¹z_i/z_(i+1))·(1−q^{(s−1)/2}z_sw))]`. `ζ̃(t)=t^{1−g}ζ(t)`. The ≥0 and <0 functions are expanded in their respective regions. (S16, §5.4, Proposition 5.3, pp.325–331; S16 line 1493).

One route is as follows. Induct on s using the HN convolution relation and the known untruncated distribution. Compute each nontrivial split contribution by Hecke commutation. Identify the rational positive and negative parts using expansion-separation and their pole bounds.

*Needs:* §5.1; §5.3; §4.5; §5.4; FunctionFieldArithmetic §§5.1–5.4.

**Checks.**

- s=1; s=2 sign: Positive expression V₁/(1−zw); negative expression −V₁/(1−zw) expanded at infinity has coefficients V₁ for negative degrees; s=2 sign is +1. Retain regions and (−1)^s.

### 5.6 arbitrary-rank block residue formula

Prove the following statement. For r_i>0, n=∑r_i and a(r)=−(g−1)∑r_i(r_i−1)/4, let R_r take descending normalized residues inside each block z_j^(i)/z_(j−1)^(i)=q⁻¹, largest block first. Then `Y_r^{≥0}(q^{(1−r_s)/2}z_1^(s),…,q^{(1−r_1)/2}z_1^(1);w)=q^{a(r)}V_1^{−n}(∏_iV_{r_i}) R_r[Y_(1^n)^{≥0}(z_n,…,z_1;w)]`. Equivalently, after scaling each surviving variable by q^−1/2, the prefactor is `q^{b(r)}∏V_{r_i}`, `b(r)=(g−1)∑_{i<j}r_ir_j/2`, and the shuffle denominator’s final factor is 1−q^−n/2 z_1w. Zero-rank slots are deleted. (S16, §5.5, equations (5.14)–(5.15), pp.331–332; S16 line 1971).

One route is as follows. Replace each higher-rank bundle series by its rank-one residue presentation. Commute the finitely many formal residues with the valid pairing coefficients. Collect the a(r) and rank-one prefactors to derive b(r) and the surviving-variable scaling.

*Needs:* §5.5; §4.4; §0.3.

**Checks.**

- Tuple (1); tuple (2),g=2: No residues and prefactor 1 for the first; a(2)=−1/2 and chain z₂/z₁=q⁻¹ for the second. Scaling is part of the formula.

### 5.7 generic Jordan-type generating sum

Define the following objects and their indicated structure. A generic Jordan type is a finitely supported sequence r_i≥0, with weighted size |λ|=∑i i r_i and `λ=(1^{r_1}2^{r_2}…)`. Define `Ξ_r(z,T)=∑_{α:rank α_i=r_i} mass(Nil_α^{≥0}) z^{∑i i deg α_i}T^{∑i i r_i}`, allowing additional rank-zero Jordan steps. Set `e(r)=(g−1)[∑(i−1)r_i²+∑_{i<j}(2i−1/2)r_ir_j]` and `x_l=z^l q^{(r_>l−r_<l)/2}`. The weight is the class of the underlying F, not its quotient F/im θ. (S16, §5.6, equations (5.16)–(5.18), pp.331–333 (weighted exponent made explicit); S16 line 1971).

The interface has the following properties.

- The weighted-size-r multiplicity sequences correspond bijectively to partitions of r, retaining internal zeros.
- The coefficient of T^r z^d sums exactly nilpotent-pair masses of class (r,d) with the chosen generic type.
- Truncating the number of Jordan steps stabilizes each fixed coefficient, because the total torsion degree bounds the extra nonzero rank-zero steps.

One route is as follows. Identify finite rank multiplicities with the imported partitions. Define the classwise finite coefficient sum and retain all possible torsion tails. Use the flag-pairing expression to substitute x_l for degree variables.

*Needs:* §2.4; §2.7; §5.1; `YoungDiagram`.

**Checks.**

- At rank zero Ξ_empty is the nontrivial torsion nilpotent series, not just 1.
- r_2=1,r_i=0 otherwise gives T² and not T.
- A nonzero degree in α_2 contributes twice that degree to the underlying sheaf class.

### 5.8 positive-arm plethystic product

Prove the following statement. For `λ=(1^{r_1}2^{r_2}…)` and `r_[i,j]=∑_{k=i}^j r_k`, `Exp(X/(q−1)·∑_{i,l≥1}q^{−r_[i,i+l]}(q^{r_(i+l)}−1)z^l)=∏_{s∈λ,arm(s)>0}ζ(q^{−1−leg(s)}z^{arm(s)})`. The product excludes precisely the cells of arm length zero. (S16, §5.6, Lemma 5.5, p.333; S16 line 2107).

One route is as follows. Group the cells by their positive arm length and by the multiplicity blocks of their row lengths. Telescope the powers of q for fixed arm length. Apply ζ(t)=Exp(Xt) and additivity of Exp.

*Needs:* §0.1; §5.7; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5; `YoungDiagram.armLength`; `YoungDiagram.legLength`; FunctionFieldArithmetic §§5.1–5.4.

**Checks.**

- λ=(1),(2),(1,1): Products respectively 1,ζ(q⁻¹z),1; only (2) has a cell of positive arm. Exclude every arm-zero cell.

### 5.9 partition residue kernels

Define the following objects and their indicated structure. For `λ=(1^{r_1}2^{r_2}…)`, n=∑r_i, set `J_λ(z)=∏_{s∈λ}ζ*(q^{−1−leg(s)}z^{arm(s)})`. Define ζ*(q⁻¹)=∏_j(1−α_j⁻¹)/(1−q⁻¹), ζ*(1)=∏_j(1−α_j)/(1−q), and ζ* equal to ζ at other specified monomials. With `Z_n=∏_{i<j}ζ̃(z_i/z_j)`, `L_n=Z_n⁻¹∑_{σ∈S_n}σ[Z_n/(∏_{i<n}(1−qz_(i+1)/z_i)(1−z_1))]`. Take normalized residues along adjacent variables within each multiplicity block, starting from the largest indices, and substitute each surviving `z_(1+r_<i)=z^i q^{−r_<i}`; the result is H_λ(z). Define J_empty=H_empty=1. The symmetric sum is unaveraged. (S16, §1.4, equations (1.1)–(1.3), pp.303–304; S16 line 242).

The interface has the following properties.

- For the empty diagram both kernels are 1.
- `J_(1)=ζ*(q⁻¹)=q^{1−g}P(1)/(q−1)`, and H_(1)=1/(1−z), using paired reciprocal coordinates.
- Coefficient specialization commutes with each rational operation and ordered residue wherever the indicated denominators specialize nontrivially.
- Zero multiplicity blocks introduce neither a variable nor a residue, and the surviving-variable substitution is unchanged.

One route is as follows. Use the baseline YoungDiagram arms and legs; enumerate multiplicities without replacing the carrier. Form the rational shuffle kernel over the localization and apply ordered normalized residues. Prove the specialization is well defined after taking residues, including vanished multiplicity blocks.

*Needs:* §0.3; §0.1; FunctionFieldArithmetic §§5.1–5.4; `YoungDiagram.armLength`; `YoungDiagram.legLength`; `YoungDiagram.transpose`.

**Checks.**

- For λ=(1), `q^{g−1}J_(1)H_(1)=P(1)/((q−1)(1−z))`; omitting `q^{1−g}` in J_(1) fails this test.
- For λ=(2), n=1 and there is no block residue: the substitution z₁=z² gives H_(2)(z)=1/(1−z²), whose z and z² coefficients are 0 and 1. H_(1)(z)=1/(1−z) has both coefficients 1; replacing weighted size by multiplicity length fails.
- The empty partition has J_empty=H_empty=1, whereas H_(1) has a pole at 1 and H_(2) has poles at both 1 and −1. The zero-partition convention cannot be obtained by using a nonempty block. λ=(1,1) has two variables and one block residue.

### 5.10 Jordan sum as a partition product

Prove the following statement. For λ associated with r, `Ξ_r=q^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z) Exp(Xz/((q−1)(1−z)))T^{|λ|}`, where `⟨λ,λ⟩=∑_j(λ′_j)²=∑_i i r_i²+2∑_{i<j}i r_ir_j`. Before simplification `Ξ_r=q^{e(r)}Exp(X/(q−1)[∑_{i,l≥1}q^{−r_[i,i+l]}(q^{r_(i+l)}−1)z^l+z/(1−z)])Y_r^{≥0}(x_s,…,x_1;1)T^{|λ|}`. (S16, §5.6, equations (5.16)–(5.18), pp.332–333; S16 line 2034).

One route is as follows. Apply the finite-step flag formula and torsion separation. Take the coefficientwise-stable torsion-tail limit, producing z/(1−z). Use the positive-arm identity, Siegel factors for zero-arm cells, and block residues to obtain J_λH_λ.

*Needs:* §5.7; §5.2; §5.6; §5.8; §5.9; supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13.

**Checks.**

- λ empty and one box: Empty term is the torsion exponential; one-box bundle factor is P(1)/((q−1)(1−z)), then multiplied by the same torsion exponential. Cancel torsion only after summing.

### Examples

The one-box partition gives q^(g−1)J_(1)H_(1)=P(1)/((q−1)(1−z)). The two partitions of size two have different multiplicity lengths: (2) has one variable and no block residue, while (1,1) has two variables and one normalized residue. The positive-arm product is ζ(q⁻¹z) for (2) and 1 for (1,1) (S16, (1.1)–(1.3) and Lemma 5.5, pp.303–304,333; S16 line 242 and S16 line 2200).

### Dependencies

- §4.1.
- §3.2.
- §4.2.
- §4.3.
- supplier contract for GlobalShtukasAndFunctionFieldLanglands §0.13.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- §4.5.
- FunctionFieldArithmetic §§5.1–5.4.
- §4.4.
- §0.3.
- §2.4.
- §2.7.
- `YoungDiagram`.
- §0.1.
- `YoungDiagram.armLength`.
- `YoungDiagram.legLength`.
- `YoungDiagram.transpose`.

## Layer 6: partition residue formulas and origin constants

### 6.1 universal partition generating identity

Prove the following statement. In K_g[[T,z]], `Exp(∑_{r>0,d≥0} A_{g,r,d}^{≥0}T^rz^d/(q−1))=∑_λ q^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z)T^{|λ|}`, with each rational coefficient expanded at z=0. The rank-zero part of the coherent nilpotent series is Exp(Xz/((q−1)(1−z))) and cancels from both sides. (S16, §5.7, equations (5.19)–(5.21), pp.333–334; S16 line 2107).

One route is as follows. Sum the Jordan product over all partitions, coefficientwise. Identify absolute indecomposable torsion sheaves over every extension field and cancel their exponential. Use the universal coefficient specialization and density to obtain equality in K_g.

*Needs:* §5.10; §2.3; §4.9; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- T=0 and coefficient T: Both sides have constant 1; T coefficient P(1)/((q−1)(1−z)). Do not keep rank-zero exponential twice.

### 6.2 eventually periodic residue extraction

Prove the following statement. Let K be a field and r>0 with (r:K)≠0. If a_d∈K, d≥0, is eventually r-periodic, r>0, and its eventual values are b_j for j mod r, then `F(z)=∑a_dz^d=P(z)+∑_{j=0}^{r−1}b_j z^j/(1−z^r)`, with P polynomial. It has at most simple poles in μ_r, and `b_d=−∑_{ξ∈μ_r}ξ^{−d}dRes_(z=ξ)(F(z)dz/z)`, computed after a cyclotomic extension and descending to K. For bundle counts `a_d=A_{g,r,d}^{≥0}` and `b_d=A_{g,r,d}`. (S16, §5.8, equation (5.22), pp.334–335; S16 line 2205).

One route is as follows. Remove the finite nonperiodic prefix to get the rational form. Compute each simple differential residue as −∑_j b_j ξ^j/r. Use finite Fourier orthogonality to recover b_d and Galois invariance to descend.

*Needs:* §0.3; §1.10; §1.9; §4.9.

**Checks.**

- r=2, b₀=2,b₁=3 in ℚ; characteristic 2 control: Residues at 1,−1 are −5/2,1/2; negative Fourier sums give 2,3; in characteristic 2, 1−z²=(1−z)². Require (r:K)≠0.

### 6.3 Schiffmann partition residue formula

Prove the following statement. Define `A_{g,r}(z)` by `∑_{r≥1}A_{g,r}(z)T^r=(q−1)Log(∑_λq^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z)T^{|λ|})`. For all d∈Z, `A_{g,r,d}=−∑_{ξ∈μ_r}ξ^{−d}dRes_(z=ξ)(A_{g,r}(z)dz/z)`. Each coefficient has at most simple poles, all in μ_r. Each fixed rank uses finitely many partitions and Adams divisors. (S16, §1.4, Theorem 1.6, p.304; §5.7–5.8, pp.333–335; S16 line 307).

One route is as follows. Apply Log to the universal generating identity. Identify `A_{g,r}(z)` with the generating series of truncated counts. Apply residue-extraction; finite rank bounds the partition sum and all Adams divisors.

*Needs:* §6.1; §6.2; §5.9; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- Rank 1: `A_{g,1}(z)=P(1)/(1−z)`, dRes at 1=−P(1); negative extraction gives P(1). Keep minus differential-residue sign.

- On P¹ the rank-two logarithmic coefficient is identically zero; its differential residues at 1 and −1 are both zero and give count 0 in every degree.
- On E/𝔽₂ with #E(𝔽₂)=3, the rank-two coefficient is 3/(1−z). Its differential residues at 1 and −1 are −3 and 0, so the negative Fourier sum is 3 for either degree class. A spurious pole at −1 would change one parity.

### 6.4 rank-two universal check

Prove the following statement. Put P=∏(1−α_i), U=∏(1−qα_i), V=∏(1+α_i), S=∑(1−α_i)⁻¹. The rank-two count is P[U/((q−1)(q²−1))−V/(4(1+q))+P/(2(q−1))(1/2−1/(q−1)−S)], independently of d; the displayed apparent α_i=1 poles cancel after multiplying by P². At g=0 it is 0; at g=1 it is P. (S16, §1.4, rank-two example, p.305; Appendix C, p.358; S16 line 387).

One route is as follows. Enumerate λ=(2),(1,1) in the partition formula. Compute the T² logarithmic coefficient, including ψ_2 of the rank-one term. Take its residues and simplify using α_iα_(paired i)=q.

*Needs:* §6.3; §0.1.

**Checks.**

- q=2, empty list; pair (−1,−2): Empty bracket 1/3−1/12−1/4=0; for pair P=6,U=15,V=0,S=5/6, bracket 5−4=1 and count 6. Cancel apparent poles as rational functions.

### 6.5 origin constant of the bundle invariant

Define the following objects and their indicated structure. Work in the paired-coordinate affine cone Q[q,α_1,…,α_(2g)]/(α_(2i−1)α_(2i)−q), with the origin q=α_i=0 and g≥1. The rational functions `A_{g,r,d}` from the partition formula extend regularly to that origin. Define `A_{g,r,d}(0)` by that local evaluation. This is not evaluation of an arbitrary element of K_g or of an arbitrary character Laurent polynomial at zero. (S16, §5.9, proof of Corollary 1.9, pp.335–336; S16 line 2295).

The interface has the following properties.

- The count belongs to the subring of rational functions regular at the affine-cone origin.
- Any two regular rational representatives give the same value at the origin.
- Degree periodicity and Mellit degree independence commute with this evaluation once regularity is established.

One route is as follows. Rewrite the complete `q^{(g−1)⟨λ,λ⟩}J_λH_λ` factors with denominators whose specialization in Q(z) is nonzero. Track each permutation term after the ordered residues; all nonidentity contributions vanish at the origin. Prove regularity survives the logarithmic coefficients and differential residue extraction.

*Needs:* §6.3; §5.9.

**Checks.**

- `A_{g,1,d}(0)=1` for every g≥1.
- q⁻¹ is a valid torus function but is not regular at the origin and has no origin constant.
- α_1α_2 and q both specialize to zero, consistently with their relation.

### 6.6 constant-term partition formula

Prove the following statement. For g≥1 set `K_λ(z)=∏_i∏_{j=1}^{r_i}(1−z^−j)⁻¹` and define `∑_{r≥1}A^0_{g,r}(z)T^r=−Log(∑_λ z^{(g−1)⟨λ,λ⟩−length(λ)}K_λ(z)T^{|λ|})`. Then `A_{g,r,d}(0)=−∑_{ξ∈μ_r}ξ^−d dRes_(z=ξ)(A^0_{g,r}(z)dz/z)`. For r=1,2,3,4 these values are 1,g,4·binom(g,2)+g,32·binom(g,3)+20·binom(g,2)+g. For fixed r the value is a polynomial in g of degree r−1 on g≥1. (S16, §1.4, Corollary 1.9 and examples, pp.305–306; §5.9, pp.335–336; S16 line 387).

One route is as follows. Evaluate the regular partition factors at the origin and combine the surviving binomial factors into K_λ. Keep the minus sign in the definition of A⁰ and use the negative differential-residue extraction, as in §6.2. Compute partitions through rank four and prove the fixed-rank polynomial degree in g.

*Needs:* §6.5; §6.2; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- Rank 1 and g=1,2; ranks 2,3,4 at g=2: A⁰₁=z^(g−1)/(1−z), residue −1; −residue=1; higher constants 2,6,22. Use the negative differential-residue sign.
- For r=1, the one-box term gives A⁰_(g,1)(z)=z^(g−1)/(1−z). Its differential residue at 1 is −1, so the negative extraction gives the required origin count 1. A positive extraction would give −1.
- In genus one, the rank-two, rank-three and rank-four origin constants are all 1; in genus three they are 3, 15 and 95. Substituting g=1 and g=3 in the displayed genus polynomials gives these values, distinguishing the binomial terms from powers of g.

### Examples

With q=2 and paired eigenvalues (−1,−2), P=6, U=15, V=0 and S=5/6. The rank-two bracket is 5−4=1 and the count is 6. At the origin, ranks one through four in genus two give 1,2,6,22. In genus three, ranks three and four give 15 and 95. These are origin values, not full counting functions (S16, pp.305–306; S16 line 388 and S16 line 451).

### Dependencies

- §5.10.
- §2.3.
- §4.9.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- §0.3.
- §1.10.
- §1.9.
- §5.9.
- §0.1.

## Layer 7: canonical Higgs sheaves and stable Higgs moduli

### 7.1 positive canonical Higgs sheaves and coherent comparisons

Use EndoscopicTransferAndUnitaryTraceComparison §3.7's coherent canonical Higgs sheaves, their underlying sheaves and ordinary geometric slope (semi)stability. Define the full positive subcategory A_K^+ by μ_min(F)≥0, with the exact structure induced from coherent Higgs sheaves. Relative (semi)stability tests invariant subobjects belonging to A_K^+ (the quotient is then positive). It is not defined by intersecting the usual semistable locus with A_K^+. For g≥1 and d>binom(r,2)(2g−2), prove that the relative and usual semistable moduli agree; outside that range no equality is asserted. Positive-rank ordinarily semistable coherent Higgs sheaves are bundles because their maximal torsion subsheaf is invariant and has slope +∞. Use the bundle HN theory and bundle deformation complex of AutomorphicSpectralTheory §§6.22c and 6.24. Extend ordinary HN filtrations to coherent Higgs sheaves by placing their invariant torsion part first, and construct relative HN filtrations in A_K^+. For coherent F,G, identify derived Higgs Hom with the total complex of RHom_X(F,G)→RHom_X(F,G⊗Ω), with columns in degrees zero and one and differential f↦θ_G∘f−(f⊗1)∘θ_F; retain the derived terms in each column. On bundles this agrees with the supplied two-term sheaf Hom complex. Its degree-two Ext group need not vanish. (S16, §6.2, pp.336–337; S16 line 2365; MS14, §1, p.2; §2.1, Theorem 2.1 and Corollaries 2.2–2.4, p.4; MS14 line 219; §3, pp.5–7, especially Corollary 3.3, p.6; MS14 line 386).
The interface has the following properties.

- Forget θ to the supplier coherent category; kernels and cokernels carry induced Higgs fields.
- For a bundle it suffices to test saturated proper positive-rank invariant subsheaves.
- For gcd(r,d)=1, Higgs semistability implies stability.
- Geometric (semi)stability is preserved and detected by field extension; the definition used for moduli is geometric.
- Two Higgs morphisms are equal when their underlying coherent maps agree; a coherent isomorphism lifts to a Higgs isomorphism exactly when it intertwines the two fields.
- A short exact coherent Higgs sequence with positive endpoints has positive middle object; positivity is preserved by quotients. Do not assert that every coherent subobject of a positive object is positive.
- For g≥1 and d>binom(r,2)(2g−2), the relative semistable positive moduli identify with the usual semistable Higgs moduli, compatibly with field extension.

One route is as follows. Use the supplied coherent Higgs carrier and identify its locally free locus with the bundle carrier. The invariant torsion subsheaf supplies the first ordinary HN factor; apply the supplied bundle HN theorem to its quotient. For the coherent deformation comparison, totalize the two columns of derived Hom, obtaining the long exact sequence of MS14 Theorem 2.1. Restrict to the HN-nonnegative exact category and establish its relative HN induction using positive quotients and bounded slopes. For a semistable Higgs bundle of rank s, consecutive underlying HN slopes differ by at most 2g−2. The binomial degree bound forces positivity; applying the same bound to a semistable destabilizer proves the converse comparison of the two stability conditions (MS14 Corollary 3.3).

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract; SchemeAndStackFoundations §§1.18–1.21; EndoscopicTransferAndUnitaryTraceComparison §3.6; EndoscopicTransferAndUnitaryTraceComparison §3.7. AutomorphicSpectralTheory §§6.22c, 6.24; SchemeAndStackFoundations §2.18.

**Checks.**

- Every line bundle with any Ω-valued field is stable.
- (L⊕L,0) is semistable of equal slope but not stable.
- A nonzero torsion summand in a positive-rank Higgs sheaf is invariant and violates semistability.
- On P¹, O(−1) injects into O² with quotient O(1). The middle object and quotient are positive but the subobject is not; for zero Higgs fields the induced exact category must not be treated as an abelian subcategory.
- The relative stability predicate quantifies only over invariant subobjects with μ_min≥0. A test with μ_min<0 belongs to the usual predicate but is excluded from the relative predicate, even when its average slope is positive.
- At a smooth rational point x, take T=k_x with zero Higgs field and trivialize Ω locally. The two derived-Hom columns each have dimensions 1 in degrees 0 and 1, and the differential is zero. Higgs self-Ext therefore has dimensions 1,2,1 in degrees 0,1,2; the ordinary sheaf-Hom columns alone would give 1,1,0. Torsion requires the derived comparison.
- On an elliptic curve with a nowhere-zero canonical form η, the commutator column map from (O,0) to (O,η) sends Id to η, with coefficient +1 in that trivialization. The two-term sheaf complex is an isomorphism complex and has zero cohomology; reversing the written differential would give coefficient −1.

### 7.2 Serre-dual Higgs criterion

Use the natural coherent isomorphism Ext¹(V,W)*≃Hom(W,V⊗Ω_X) from the coherent Ext–Serre duality contract. Prove its Higgs-invariance application: for a subsheaf W⊂V, write a:Ext¹(V,V)*→Ext¹(V,W)* and b:Ext¹(W,W)*→Ext¹(V,W)* for the dual restriction and pushout maps. A functional ν corresponds to a Higgs field preserving W iff a(ν)∈im b. (S16, §6.2, equation (6.1), p.337; S16 line 2408).

One route is as follows. Import Serre duality in its natural coherent form, not an isomorphism chosen separately for each pair. Identify the two maps with restriction and the inclusion of W⊗Ω in V⊗Ω. Read preservation as factorization.

*Needs:* §7.1; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.

**Checks.**

- V=k² with W=ke₁; θ matrices [[1,1],[0,2]] and [[1,0],[1,2]]: First preserves W since lower-left entry 0; second fails since lower-left 1; factorization criterion true and false respectively. Naturality fixes the actual maps.

### 7.3 stable canonical Higgs moduli

Define the following objects and their indicated structure. For g≥1,r>0,gcd(r,d)=1, construct the finite-type stable Higgs stack and its coarse smooth geometrically connected quasiprojective scheme H_(r,d), of dimension 2D, D=1+(g−1)r². The stack is a G_m-gerbe over H and has stable-locus dimension 2D−1. Construct `h:H→⊕_{i=1}^r H⁰(X,Ω_X^i)` by characteristic coefficients and prove it proper. Write Λ_sch=h⁻¹(0) and Λ=(Λ_sch)_red. Prove that Λ is projective Lagrangian of pure dimension D, in every characteristic. Reduction identifies their points over every field, geometric irreducible components and ℓ-adic étale cohomology (Stacks, Tags 04DZ and 03SI, §59.45; STACKS line 3033 and STACKS line 3130). For g=0 use H_(1,d)=A⁰ and H_(r,d)=empty for r>1 in coprime classes. (S16, §6.2, p.337; §6.10–6.11, pp.349–352; S16 line 2408).

The interface has the following properties.

- The coarse map is universal to algebraic spaces and identifies geometric points with stable Higgs isomorphism classes.
- For a fixed complex curve and its coprime stable Higgs scheme, the moduli construction spreads over a finitely generated integral subring of ℂ; after shrinking, every field fibre is the stable Higgs coarse space of the corresponding smooth genus-g curve, with the same rank and degree.
- The stabilizer is exactly G_m; over a finite field the rational-point fibre is neutral, so stack mass is #H(k)/(q−1).
- Under θ↦tθ, the i-th Hitchin coefficient scales by t^i.
- On a family base S, Λ_sch imposes vanishing of every characteristic coefficient, which implies θ^r=0 by Cayley–Hamilton. On field-valued points this is equivalent to nilpotence under iterated Ω-twisted composition. Over nonreduced S, a nilpotent field can have nonzero nilpotent characteristic coefficients; arbitrary nilpotent families need not factor through Λ_sch. The reduction Λ has the same field-valued points.

One route is as follows. Use stable Higgs sheaf GIT and fixed-degree boundedness for the coarse moduli problem, retaining the scalar gerbe. Compute the tangent-obstruction complex; scalar automorphisms and their dual obstruction give the smooth coarse dimension 2D. Prove canonical Hitchin properness, geometric connectedness and the pure-D-dimensional nilpotent Lagrangian theorem, in every characteristic; §§8.1 and 9.1 use them.

*Needs:* §7.1; SchemeAndStackFoundations §§1.18–1.21; AlgebraicModuliForArithmeticGeometry §1.3; SchemeAndStackFoundations §4.14; AlgebraicModuliForArithmeticGeometry §4.19 and its reductive-character-GIT contract; EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.7 and its locally-free-locus contract; SchemeAndStackFoundations §§4.1, 4.5.

**Checks.**

- H_(1,d)=Pic^d×A^g, D=g, and Λ=Pic^d.
- For a rational stable Higgs object the stack weight is 1/(q−1), whereas its coarse point counts as 1.
- For rank two, trace scales with weight 1 and determinant with weight 2; the whole Hitchin base does not have weight 1.
- In characteristic two on a genus-one curve, a stable rank-two degree-one bundle has scalar fields θ=a·Id after trivializing Ω. Their polynomial is t²+a², so the Hitchin fibre is locally Pic¹×Spec k[a]/(a²), whereas Λ=Pic¹ and D=1. Locally du∧da restricts nontrivially to the thickened fibre, but vanishes on its reduced core; only the latter is asserted Lagrangian.
- Over k[ε]/(ε²), the rank-one field θ=ε is nilpotent but its characteristic polynomial t−ε has nonzero coefficient. It does not lie in Λ_sch, whose rank-one equation is θ=0. Nilpotence alone does not define the scheme-theoretic fibre on families.

### Examples

For rank one, H=Pic^d×A^g and Λ=Pic^d; its scalar stack has one fewer dimension. On a rank-two field scaling by t multiplies trace by t and determinant by t² (S16, §6.2, p.337, and §6.10, p.349; S16 line 2408).

### Dependencies

- AutomorphicSpectralTheory §§6.22c, 6.24.
- SchemeAndStackFoundations §2.18.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.
- SchemeAndStackFoundations §§1.18–1.21.
- EndoscopicTransferAndUnitaryTraceComparison §3.6.
- EndoscopicTransferAndUnitaryTraceComparison §3.7.
- AlgebraicModuliForArithmeticGeometry §1.3; SchemeAndStackFoundations §4.14.
- AlgebraicModuliForArithmeticGeometry §4.19 and its reductive-character-GIT contract.
- EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.7 and its locally-free-locus contract.
- SchemeAndStackFoundations §§4.1, 4.5.

## Layer 8: Białynicki-Birula strata and all-characteristic Higgs counting

### 8.1 Białynicki-Birula–Hesselink strata

Prove the following statement. Let Y be a smooth quasiprojective scheme over a field k with a G_m action, a projective fixed locus, limits at zero for all geometric points and an equivariant projective morphism to an affine scheme with positive weights. The attracting strata form a filtration of Y by locally closed affine bundles over the smooth projective fixed components Z_i, with ranks n_i equal to the positive tangent dimensions along Z_i; the strata and bundle maps are defined over k after grouping Galois orbits of fixed components. Construct the opposite-action version on the reduced proper core, the reduced closed subscheme of points whose limit as t→∞ exists, with the reduced induced strata; no affine-bundle assertion is made for a nonreduced scheme-theoretic fibre. Over a finite field k=𝔽_Q this gives #Y(𝔽_Q)=∑_i Q^(n_i)#Z_i(𝔽_Q). (S16, §6.9, decomposition (6.8), pp.348–349; S16 line 2933.)

The supporting input is HES81, Theorem 5.7, pp.55–89.

The interface has the following properties.

- Each geometric point lies in exactly one attracting stratum, the one containing its limit.
- The opposite strata cover the core and have ranks equal to the negative tangent dimensions.
- An equivariant isomorphism of two such schemes matches fixed components, strata and ranks.

One route is as follows. Use the projective morphism to the positively weighted affine scheme to prove existence of limits and properness of the fixed locus. Linearize the action on a quasiprojective embedding, decompose tangent spaces along the fixed components by weight, and prove the local product structure of the attracting sets. Descend the strata and bundle maps to k by Galois descent, grouping fixed components in Galois orbits, and count affine fibres.

*Needs:* SchemeAndStackFoundations §§1.18–1.21.

**Checks.**

- On P¹ over 𝔽_Q with t·[x:y]=[tx:y], the fixed points [0:1] and [1:0] have attracting strata of ranks 1 and 0, and Q·1+1=#P¹(𝔽_Q). Assigning rank 1 to both fixed points would give 2Q.
- G_m acting on A¹ with weight −1 has no limit at zero for t·1, and the identity map to A¹ has negative weight; the hypotheses exclude it. Counting only the stratum {0} would give 1 instead of Q.
- For the characteristic-two elliptic Higgs surface of §7.3, the opposite stratum is Pic¹ with affine rank zero. The thickening Pic¹×Spec k[a]/(a²) is not that affine bundle, although its field-valued points and étale cohomology agree with Pic¹.

### 8.2 HN integration for canonical Higgs sheaves

Prove the following statement. For g≥1 use A_K^+ and its relative semistability from §7.1. For r>0,d≥0 define `I_K^+(r,d)=q^{(1−g)r²}mass(all canonical Higgs bundles of class (r,d) with underlying μ_min≥0)`. Define Ω_K^+ by `1+∑_{r>0,d≥0}I_K^+(r,d)T^rz^d=Exp(∑Ω_K^+(r,d)T^rz^d/(q−1))`. MS14 Theorem 1.2 (4) identifies each positive-slope Exp factor with the `q^{(1−g)r²}`-normalized mass of relatively semistable positive Higgs bundles. Prove the slope-zero identity as well: extract z⁰ from the ordered HN integration product over τ∈[0,+∞), so that only its slope-zero factor remains, and compare plethystic logarithms (MS14, proof of Theorem 1.2, pp.6–7; MS14 line 427 and MS14 line 442). With quotient-left/subobject-right multiplication, the HN product places smaller slopes on the left. For usual semistable E,F with μ(E)<μ(F), Ext²(E,F)=Hom(F,E)*=0; the positive-category factorization uses the ordered integration theorem of MS14 §3.1, rather than identifying relative factors with usual ones. No Green bialgebra for the whole Higgs category is inferred. The untruncated DT invariants are defined separately by `1+∑_{r>0,d/r=τ}q^{(1−g)r²}mass(Higgs^ss_(r,d))T^rz^d=Exp(∑_{d/r=τ}Ω_K(r,d)T^rz^d/(q−1))`. (MS14, Theorem 1.2, p.2; §2.1–2.3, pp.3–5; §3.1, pp.6–7; MS14 line 58).

One route is as follows. Use AutomorphicSpectralTheory §§6.22c and 6.24 for the bundle deformation complex, Serre duality and Ext² vanishing for usual semistable factors in the displayed slope order. Apply MS14 Theorem 1.2 and §3.1 to the positive-category HN factorization, with relative semistable factors and the normalization `q^{(1−g)r²}`; keep this separate from any claim that relative semistability is usual semistability. For slope zero use the z⁰ extraction just stated; then take the coefficientwise plethystic logarithm and its slope factors to define Ω_K^+. Define Ω_K by the independent usual-semistable same-slope formula; compare them only in the eventual degree range.

*Needs:* §7.1; §3.1; §4.5; AutomorphicSpectralTheory §§6.22c, 6.24; SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- At q=2,g=1,r=1 and d≥0 on E:y²+y=x³, P(1)=3, so I_K^+(1,d)=2·3/(2−1)=6 and the Tz^d coefficient of Exp gives Ω_K^+(1,d)=6. The usual rank-one same-slope formula also gives Ω_K(1,d)=6. The mass is 6, whereas the unnormalized bundle mass alone is 3.
- At q=2,g=2,r=1,d≥0, there are q²P(1) Higgs fields over the line classes. Thus I_K^+=q⁻¹q²P(1)/(q−1)=2P(1), and Ω_K^+=Ω_K=2P(1). Reversing the normalization to `q^(g-1)` gives 8P(1), which fails this computation within g≥1.
- At q=2,g=1 and d=0 on that elliptic curve, rank-two Higgs mass is 30: the three distinct pairs of rational lines contribute 12, three doubled lines contribute 8, three nonsplit self-extensions contribute 6, and the three degree-two line orbits contribute 4. Therefore I_K^+(2,0)=30. In the plethystic logarithm subtract 6²/2=18 and the second-Adams contribution (4·9/(4−1))/2=6; the remainder is Ω_K^+(2,0)/(2−1)=6. Positive underlying degree-zero bundles are semistable, so the usual slope-zero factor also gives Ω_K(2,0)=6. This tests the slope-zero comparison and the Adams action on the field cardinality and Picard count.
- For r=1,d=−1 on the same elliptic curve the usual invariant is Ω_K(1,−1)=6, while the positive generating series has coefficient 0 in negative degree. The two definitions do not agree in every degree.
- For usual semistable E,F with μ(E)<μ(F), Ext²(E,F)=Hom(F,E)*=0; for E=F=(O_X,0) it has dimension 1. The ordered integration cannot discard the strict slope condition or replace relative factors by usual ones outside their comparison range.

### 8.3 all-characteristic coprime Higgs count

Prove the following statement. For every finite field and g≥1, Ω_K(r,d)=q A_X(r,d). Hence for r>0,gcd(r,d)=1, #H_(r,d)(F_q)=q^D A_X(r,d), D=1+(g−1)r², with no characteristic restriction; applied over each finite extension it gives the same equation there. Genus zero is handled directly: rank one has both counts 1, and the higher-rank coprime stable and absolute-indecomposable loci are empty. (MS14, Mozgovoy–Schiffmann §4, Theorem 4.3 and Corollaries 4.4–4.5, pp.8–9; MS14 line 481).

One route is as follows. For the positive bundle cutoff, apply the same Krull–Schmidt Euler product to the Serre-dual cotangent fibre: `∑I_K^+=Exp(∑q A_X^{≥0}/(q−1))`. Compare the relative positive-category slope factors using MS14 Theorem 1.2. For d>binom(r,2)(2g−2), MS14 Corollary 3.3 and Theorem 1.2 identify both the positive Higgs invariants and the indecomposable cutoff counts with the untruncated ones. Remove the cutoff by degree-r periodicity; in a coprime class convert the stable stack mass to coarse points by its neutral G_m-gerbe.

*Needs:* §8.2; §2.3; §1.7; §1.9; §1.10; §7.2; §7.3; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- In characteristic two, q=2^f with f≥1, so Ω_K=qA in rank one and coprime rank two; the stable mass #H/(q−1) and the normalization of §8.2 give #H=q^D A. The factor is the field cardinality, and no characteristic hypothesis enters.
- On P¹ over any finite field, rank one gives #H_(1,d)=1=q⁰A(1,d) with D=0; in rank two and odd degree both sides are 0, because every indecomposable bundle on P¹ is a line.
- For E:y²+y=x³ over 𝔽₂, only x=0 has affine solutions, with two choices of y; the point at infinity gives #E=3. Thus A_E(1,d)=3, Ω_K(1,d)=6 and #H_(1,d)=6, with stable stack mass 6/(2−1)=6.
- Over 𝔽₄ the same curve has nine points: x³ is 0 or 1, and each value has two preimages under y↦y²+y, so all four x-values contribute two points. Hence A_E(1,d)=9, Ω_K(1,d)=36 and #H_(1,d)=36; the stable stack mass is 36/(4−1)=12 and multiplication by q−1 recovers 36. Replacing q by the characteristic would give 18 (MS14, Corollary 4.5, p.9; MS14 line 582).

### Examples

For rank one, the scaling action on H_(1,d)=Pic^d×A^g has the single fixed component Pic^d, one attracting stratum of rank g and the opposite stratum Pic^d of rank zero. The stratum count q^g#Pic^d(𝔽_q)=q^gP_X(1) agrees with the all-characteristic formula q^D A_X(1,d), D=g. For g=2,r=2,d=1, D=5 and #H_(2,1)(𝔽_q)=q⁵A_X(2,1) holds in characteristics two and three as well (S16, §6.10, pp.349–350; MS14, Theorem 4.3 and Corollaries 4.4–4.5, pp.8–9).

### Dependencies

- SchemeAndStackFoundations §§1.18–1.21.
- §7.1.
- §3.1.
- §4.5.
- AutomorphicSpectralTheory §§6.22c, 6.24.
- SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality contract.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- §2.3.
- §1.7.
- §1.9.
- §1.10.
- §7.2.
- §7.3.

## Layer 9: pure cohomology, positivity and the nilpotent cone

### 9.1 pure Higgs cohomology and BB shifts

Prove the following statement. For g≥1,r>0,gcd(r,d)=1 and ℓ≠p, the geometric compactly supported cohomology H_c^n(H,Q_ℓ) is pure of weight n. For the scaling fixed components Z_i, put m_i=dim Z_i and `b_i=dim T_{Z_i}^{<0}`. The weight-one symplectic form gives m_i+b_i=D and `dim T^{>0}=D`. In the Grothendieck group of continuous Frobenius representations, `[H_c^n(H)]=∑_i[H^{n−2D}(Z_i)(−D)]` and `[H^n(Λ)]=∑_i[H^{n−2b_i}(Z_i)(−b_i)]`. These are identities of semisimplified representations; a canonical splitting is not claimed. (S16, §6.10–6.11, pp.349–352, equations (6.11)–(6.13), with doubled cohomological shifts; S16 line 2926).

One route is as follows. The proper weighted Hitchin map gives limits and projective smooth fixed components. Use the symplectic form of scaling weight one to pair tangent weights a and 1−a and obtain the dimension identities. Apply the BB filtrations and the compact cohomology of affine bundles. Purity of the projective bases forces the spectral sequences to degenerate by weights; use the opposite action on the reduced core Λ. The comparisons with Λ_sch use reduction invariance, not affine strata on the thickening.

*Needs:* §7.3; §8.1; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7; EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12; DeligneWeightsAndPurity §§7.15, 8.8–8.11; EtaleDualityAndPerverseSheaves, affine-bundle contract.

**Checks.**

- Rank1,g=2; affine fibre A¹: m=2,b=0,D=2; H_c^n=H^(n−4)(Pic)(−2), cone H^n(Pic); A¹ contributes only degree2,twist−1. Double the affine rank in cohomological degree.
- For g=1,r=2,d=1 in characteristic two, m=1,b=0,D=1 and Λ=Pic¹. The scheme fibre has local equation a²=0, but both fibres have the same H^n(Pic¹); the BB formula applies to the reduced core.

### 9.2 trace reconstruction and coprime positivity

Prove the following statement. For g≥1,r>0 and gcd(r,d)=1, the universal count `A_{g,r,d}` extends to the paired affine-cone ring of §6.5. Its class `A_{g,r,d}(−α_1,…,−α_{2g})` is Weyl invariant and admits a polynomial representative with nonnegative integer coefficients in the α_j, of degree 2D. The representative need not be Weyl invariant before imposing the paired-coordinate relations. Its diagonal specialization is monic of degree 2D. The Higgs Frobenius eigenvalues are products `q^D∏α_j^{e_j}` with total weight n in H_c^n, and their multiplicities are recovered from the signed count polynomial; equal specialized monomials are grouped before comparing multiplicities. (S16, Corollary 1.5, pp.301–302; §6.10, equations (6.9)–(6.10), pp.349–350; §6.11, p.352; S16 line 162).

One route is as follows. Clear the q^m−1 denominators by a monic polynomial in q. Use equality of all power sums from finite extensions to identify signed eigenvalue multisets. Separate weights by purity and cancel the highest-weight terms inductively; use universal Weil density to identify the invariant class on the paired cone. Connectedness and smooth dimension 2D fix the top coefficient. Prove independence of that class, rather than of its polynomial representatives, and perform the denominator cancellation universally.

*Needs:* §9.1; §8.3; §4.9; §0.1; §6.5; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7.

**Checks.**

- Rank1,g=1, q=α₁α₂: A(−α)=(1+α₁)(1+α₂)=1+α₁+α₂+q; diagonal leading term t² has coefficient1. Group equal monomials before traces.
- For g=2,r=2,d=1, D=5 and the top diagonal term is t¹⁰. A nonnegative integral polynomial with monic diagonal has just one top monomial; Weyl invariance in the free polynomial ring would make its four exponents equal, forcing 10 to be divisible by 4. Thus such an invariant representative is impossible.
- The class q⁵ has positive representatives α₁⁵α₂⁵ and α₃⁵α₄⁵, interchanged by swapping pairs. They agree on the cone and each specializes to t¹⁰; their invariant average has coefficients 1/2. Keeping q as a variable of weight two gives the invariant monomial q⁵.

### 9.3 compact Poincaré polynomial over ℂ

Prove the following statement. For a smooth connected projective complex curve of genus g≥1 and gcd(r,d)=1, define the signed polynomial P_c(H;t)=∑_n(−1)^n dim H_c^n(H(C),Q)t^n. Then `P_c(H;t)=t^{2D}A_{g,r,d}(t,…,t)`, with q=t² in the paired relation. The unsigned polynomial is `t^{2D}A_{g,r,d}(−t,…,−t)`. The top compact degree is 4D. (S16, Corollary 1.3, p.300; §6.10, pp.350–351; S16 line 122).

One route is as follows. For the specified complex curve, spread the curve, a degree-d line class and the coprime stable Higgs moduli over a finitely generated integral subring R⊂ℂ, inverting an auxiliary prime ℓ. Shrink Spec R so that the curve is smooth projective of genus g and the separated finite-type Higgs scheme π has the base-change moduli interpretation of §7.3. CompactSupport Layer 8 and EllAdicRealization Layer 9 make Rπ_!ℚ_ℓ bounded constructible. Choose a dense connected open U on which each of its finitely many cohomology sheaves is lisse. The embedding R→ℂ lands over the generic point, hence in U. Choose a closed point s∈U, whose residue field is finite. Compact base change identifies both stalks with the respective geometric compact cohomology; lissity makes their dimensions equal in every degree. Apply §§8.3 and 9.1–9.2 at s, then the compact Artin comparison of ComplexComparisonPartII §§C6.4 and C6.6 at ℂ. This proves the formula for the given complex fibre without a genus-wise topological identification (S16, §6.10, p.351; S16 line 3020).

*Needs:* §7.3; §8.3; §9.2; §9.1; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12; ComplexComparisonPartII §§C6.3–C6.6; CohomologicalPointCounting, The combined endpoint.

**Checks.**

- Rank1,g=1,2: Signed polynomials t²(1−t)² and t⁴(1−t)⁴; unsigned t²(1+t)² and t⁴(1+t)⁴; top degrees4,8. Keep signs and q=t².
- For a fixed elliptic complex curve, the stalk dimensions in compact degrees 2,3,4 are 1,2,1 on the chosen lisse open and at its finite-field closed point; both signed polynomials are t²−2t³+t⁴.
- The constant compact degree-zero cohomology has dimension 1 for a point but 2 for two disjoint points. These fibres cannot lie on one lisse rank stratum; constructibility alone without choosing that open does not justify equal dimensions.

### 9.4 nilpotent-cone trace and components

Prove the following statement. For g≥1 and gcd(r,d)=1, Λ=(Λ_sch)_red is pure and `#Λ(F_q)=q^D A_{g,r,d}(α_1⁻¹,…,α_{2g}⁻¹)`, where inversion also sends q to q⁻¹. Moreover `dim H^{2D}(Λ_kbar,Q_ℓ)=dim H^{2D}(H_kbar,Q_ℓ)=A_{g,r,d}(0)`, the number of geometric irreducible components of Λ. The same component number holds over C. The reciprocal trace formula holds after every finite extension. The same point, component and étale-cohomology formulas hold for Λ_sch by reduction invariance. (S16, Corollary 1.4, pp.301–302 (corrected exponent); §6.11, pp.351–352; S16 line 162).

One route is as follows. Combine the two BB formulas using m_i+b_i=D and projective Poincaré duality on each Z_i. Take traces to obtain the reciprocal formula with q^D. Use purity and the degree shifts by twice the affine ranks to identify top cohomology with the origin coefficient; use top cohomology of a proper equidimensional scheme to count geometric components.

*Needs:* §9.1; §9.2; §9.3; EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12.

**Checks.**

- Rank1; g=2; two Frobenius-exchanged components: q^g∏(1−α_j⁻¹)=P(1); top degree2g=4 has dimension1; exchanged components have dimension2,trace0. Use prefactor q^D and degree 2D.

### Examples

In rank one and genus two, the signed compact polynomial is t⁴(1−t)⁴ and the unsigned polynomial t⁴(1+t)⁴. The nilpotent cone is Pic^d, with one component and top degree four. The reciprocal identity is q²∏(1−αⱼ⁻¹)=P(1); using q⁴ would introduce a spurious factor q² (S16, Corollaries 1.3–1.5 and §6.11, pp.300–302,351–352; S16 line 150 and S16 line 3045).

### Dependencies

- §7.3.
- §8.1.
- DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7.
- EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7.
- CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12.
- DeligneWeightsAndPurity §§7.15, 8.8–8.11.
- EtaleDualityAndPerverseSheaves, affine-bundle contract.
- §8.3.
- §4.9.
- §0.1.
- §6.5.
- ComplexComparisonPartII §§C6.3–C6.6; CohomologicalPointCounting, The combined endpoint.

## Layer 10: Mellit integrality and degree independence

### 10.1 Mellit partition generating function

Define the following objects and their indicated structure. For g≥1 define `Ω_g(T;z,q,α)=∑_λ T^{|λ|}∏_{s∈λ}{∏_{i=1}^g[(z^{a(s)+1}−α_i q^{l(s)})(z^{a(s)}−α_i⁻¹q^{l(s)+1})]}/{[(z^{a(s)+1}−q^{l(s)})(z^{a(s)}−q^{l(s)+1})]}`. Put H_g=−(1−q)(1−z)Log Ω_g and `H_{g,r}=[T^r]H_g`. Use one coordinate α_i of each reciprocal pair; ψ_m acts on T,z,q,α_i simultaneously by m-th powers. (M20, Mellit 2020 §1, Theorem 1.1, pp.302–303).

The interface has the following properties.

- The empty coefficient of Ω_g is 1 and H_g has zero constant coefficient.
- `H_{g,1}=∏_{i=1}^g(z−α_i)(1−q/α_i)`; at z=1 this equals P_X(1).
- Replacing α_i by q/α_i for any i preserves the recovered z=1 counting function.
- Finite-extension specialization commutes with the Adams operations used in Log.

One route is as follows. Form the partition products over the existing finite Young diagrams. Work coefficientwise in T over the generic rational function field, then apply the imported plethystic logarithm. Check reciprocal-coordinate and normalization compatibility with the S16 kernel.

*Needs:* §0.1; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §3.5 and its Macdonald contract; `YoungDiagram.armLength`; `YoungDiagram.legLength`.

**Checks.**

- At g=1,q=2,α₁=−1, the one-box coefficient is H₁(z)=3(z+1), so H₁(1)=6 and H₁(0)=3.
- Swapping α₁ with q/α₁=−2 gives H₁(z)=2(z+2), with H₁(1)=6 but H₁(0)=4. Reciprocal invariance belongs to the specialization at z=1; the full kernel is different. These are formal reciprocal tuples, not Weil tuples.
- For g=1,q=2 and the actual elliptic curve y²+y=x³, the reciprocal pair has sum 0 and product 2, so H₁(1)=1+2=3. This differs from the formal tuple’s value 6. Taking T=0 gives Ω_g=1 and H_g=0.

### 10.2 Schiffmann kernel as a regular deformation

Prove the following statement. Write `N_λ(u)=∏_{s∈λ}(z^{a(s)}−u q^{l(s)+1})(z^{a(s)+1}−u⁻¹q^{l(s)})`. The S16 partition coefficient is a product of ∏_i N_λ(α_i⁻¹)/N_λ(1) and a symmetric rational factor f_λ obtained by evaluation of Mellit’s shuffle function f_n at the n monomials `z^{λ_i}q^{−n+i}`. In the shuffle factor f_λ, replace each α_i⁻¹ by uα_i⁻¹; the resulting factor is a formal u-series with constant term 1. Its coefficients come from symmetric Laurent function sequences satisfying `f_{n+1}(1,x_1,…,x_n)=f_n(qx_1,…,qx_n)`. The numerator-clearing product of Proposition 4.2 gives a uniform finite denominator bound for each partition coefficient. (M20, Mellit 2020 §3, Proposition 3.1, pp.310–312; §4, Proposition 4.2 and Corollaries 4.3,4.5, pp.312–315).

One route is as follows. Rewrite the S16 J and H factors using the explicit permutation shuffle sum in equation (5); verify the factors rather than identify similarly named kernels. Prove the pole cancellation and padding identity from §4. Use the degree bound of the symmetric shuffle numerator to obtain f_λ(0)=1 and bounded denominators.

*Needs:* §5.9; §10.1; §5.10; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §3.5 and its Macdonald contract.

**Checks.**

- Empty partition; regular sequence f=1: f_empty=1; deformation constant term1; `f_{n+1}(1,x)=1=f_n(qx)`. Only the shuffle factor is deformed.

### 10.3 laurent integrality of the Mellit coefficients

Prove the following statement. For every g≥1,r>0, `H_{g,r}` belongs to Z[q±1,z±1,α_1±1,…,α_g±1]. In particular it is regular at z=1. Separately, let `H^Sch_{g,r}=(1−z)A_{g,r}(z)`, where `A_{g,r}(z)` is the Schiffmann logarithmic count series of §6.3. Mellit Theorem 5.2(i), with q_M=z and t_M=q, gives `H^Sch_{g,r}∈Q(q)[z±1,α_1±1,…,α_g±1]`. Theorem 5.2(ii) gives `H^Sch_{g,r}(z=1;q,α)=H_{g,r}(z=1;q,α)`. Thus `A_{g,r}(z)` has no poles at nonzero finite z other than possibly z=1. No integral-coefficient assertion for H^Sch before specialization is inferred. (M20, §5, Theorem 5.2(i)–(ii), pp.319–321; M18, §7, Theorem 7.1 and Corollary 7.2, pp.29–31; M18 line 1287).

One route is as follows. Apply HLV-kernel admissibility to remove denominators from H_g. Apply the regular-sequence deformation and finite denominator bounds to obtain the global Laurent conclusion of Mellit Theorem 5.2(i); use part (ii) for equality at z=1. Keep q_M=z and t_M=q throughout. Upgrade rational coefficients to integral coefficients through the integral modified-Macdonald expansion. Use the integral HLV supplier theorem.

*Needs:* supplier contract for QSeriesPartitionsAndMockModularForms (Macdonald admissibility contract) on RepresentationTheory/SchurWeyl Layer 7; §10.2; §10.1; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §3.5 and its Macdonald contract.

**Checks.**

- Rank1; function 1/(1+z) as negative control: H₁ is Laurent polynomial and regular at1; 1/(1+z) is regular at1 but has pole−1. Local regularity alone does not prove degree independence.

### 10.4 degree-independent universal bundle count

Prove the following statement. For every g≥1,r>0,d∈Z, `A_{g,r,d}=H_{g,r}(z=1;q,α)∈R_g`. Thus A_X(r,d) is independent of d, and the universal count lies in the unlocalized invariant Laurent ring, with integral Laurent coefficients. The native headline `absIndecCount_eq_of_degree` states that, for every finite field k and every proper, smooth geometrically connected relative-dimension-one X/k, `absIndecCount` at (r,d) equals its value at (r,d′) for all r∈ℕ and d,d′∈ℤ. It uses `bundleDegree` and `IsAbsolutelyIndecomposable` of §0.2; at r=0 both sides are zero. Genus zero has the separate rank-one/empty classification. Together with the coprime result, degree independence transfers positivity and origin regularity to all degrees. It supplies no analogous theorem for parabolic or fixed-HN counts. (M20, Mellit 2020 §1, Theorem 1.1, pp.302–303; §5, Theorem 5.2, pp.319–321).

One route is as follows. Compare the S16 logarithmic numerator and Mellit H using the regular deformation. Global Laurentness of H^Sch=(1−z)A removes every nonzero finite pole of A except possibly 1. The Layer 6 Taylor expansion at 0 removes negative powers there. Its rational form is therefore a polynomial plus H^Sch(1)/(1−z); the polynomial changes only finitely many truncated coefficients. Fourier residue extraction gives the same eventual count H(1) in every degree class. Use universal density to promote equality at every curve to equality in R_g.

*Needs:* §10.3; §6.3; §6.2; §4.9; §1.10; §4.10.

**Checks.**

- Rank1; genus1 every rank; (2+3z)/(1−z²) control: Counts P(1),P(1); control has eventual values2,3 and pole−1, excluded by global Laurentness. Use global pole removal.

### 10.5 positivity and constants in every degree

Prove the following statement. For g≥1 and every r>0,d∈Z, `A_{g,r,d}=A_{g,r,1}`. Consequently its Weyl-invariant class has a representative with nonnegative integer coefficients in the variables −α_j, without requiring the representative to be invariant in the free polynomial ring; it is regular at the affine-cone origin, has total degree 2D with monic diagonal specialization, and its origin value is independent of d. This comparison does not identify a noncoprime stable Higgs moduli space with a coprime one. (M20, Mellit 2020 Theorem 1.1, pp.302–303, combined with S16 Corollary 1.5, pp.301–302).

One route is as follows. Apply degree independence with d′=1, which is coprime to every positive r. Transfer the invariant class, its positive representative and its local-ring properties from that coprime class.

*Needs:* §10.4; §9.2; §6.5.

**Checks.**

- r=2,d=0 and1; genus2 origin: gcd(2,1)=1; universal counts equal and both origin2; no equality of noncoprime and coprime stable spaces asserted. Transfer the universal function, not moduli.

### Examples

The one-box Mellit coefficient is ∏ᵢ(z−aᵢ)(1−q/aᵢ); its value at z=1 is P(1). A rational function may be regular at 1 and still have another root-of-unity pole: 1/(1+z) has a pole at −1. The global Laurent numerator theorem, rather than local regularity alone, removes the degree dependence (M20, Theorems 1.1 and 5.2, pp.302–303,319–321).

### Dependencies

- §0.1.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §3.5 and its Macdonald contract.
- `YoungDiagram.armLength`.
- `YoungDiagram.legLength`.
- §5.9.
- §5.10.
- supplier contract for QSeriesPartitionsAndMockModularForms (Macdonald admissibility contract).
- RepresentationTheory/SchurWeyl Layer 7.
- §6.3.
- §6.2.
- §4.9.
- §1.10.
- §4.10.
- §9.2.
- §6.5.

## Layer 11: parabolic refinements and constructible Hall theory

### 11.1 quasi-parabolic bundles and absolute counts

Define the following objects and their indicated structure. Fix distinct k-rational marked points x_i and integers p_i≥1. A quasi-parabolic bundle is a bundle V with a possibly non-strict flag `0⊆F_1^(i)⊆…⊆F_{p_i}^(i)=V|_{x_i}`. Its type is (r,d,d^(i)_j), with `0≤d^(i)_1≤…≤d^(i)_{p_i}=r`. Isomorphisms preserve every flag. Absolute indecomposability is tested in this additive category after k̄ extension; its count is `A_{X,p,α}`. No weights or parabolic stability condition are part of this definition. (S16, §7.1, pp.352–353; S16 line 3077).

The interface has the following properties.

- Forget flags to a bundle of the same rank and degree.
- Scalar extension preserves the type at the specified rational marked points and commutes with sums.
- If all p_i=1, the category and its absolute count identify with ordinary bundles.
- Tensoring by a degree-one line bundle preserves flags and shifts d by r.

One route is as follows. Use the supplier bundle and fibre functors and relative flag schemes. Define direct sums componentwise and scalar extension on flags. Apply boundedness for indecomposable parabolic objects to obtain a finite class set; prove this by parabolic HN boundedness.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§1.18–1.21; §0.2.

**Checks.**

- With no marked points the count recovers A_X(r,d).
- For rank one every admissible flag is unique and the count is #Pic⁰(k).
- On P¹ take O² with three rational marks and fibre lines ke₁, ke₂, k(e₁+e₂). An endomorphism preserving the first two is diagonal; preserving the third forces its two entries equal. Thus its geometric endomorphism ring is k̄ and the flagged object is absolutely indecomposable, although O² is decomposable. With only the first two flags it splits into two flagged lines. All three marks exist even over 𝔽₂.
- A closed point of residue degree e>1 is outside this theorem and needs extra arithmetic parameters.

### 11.2 universal parabolic counting functions

Prove the following statement. For a fixed genus, flag lengths and admissible class α, there is a unique `A_{g,p,α}∈K_g` specializing to `A_{X,p,α}` for every curve with distinct rational marked points of that type. The proof includes a parabolic spherical Hall and shuffle calculation, boundedness of absolute indecomposables and density of marked curves. This is the localized conclusion of the parallel proof. Mellit's parabolic theorem, outside this roadmap (see Scope and ownership), identifies `A_{X,p,α}` with a coefficient of the logarithm of the punctured HLV kernel at t=1 and so places `A_{g,p,α}` in R_g by a different route (M20P, Theorem 7.1 and Corollary 7.4, pp.54–55). (S16, §7.1–7.2, Theorem 7.1, pp.352–353; S16 line 3077).

The supporting input is LIN15, arXiv v2, §1.2–§1.3 and Theorems 3.1, 3.16; LIN15 line 232 and LIN15 line 327.

For parabolic bundles of ordinary classes (r,d),(s,e) and flag jumps mᵢⱼ,nᵢⱼ at the same rational marks, the Euler form is `E_par=(1−g)rs+re−sd−∑ᵢ∑_{j<k}mᵢⱼnᵢₖ`; extend it by additivity to coherent numerical classes. At one two-step mark on P¹, equal-degree lines jumping in steps 1 and 2 have E_par=0 in that order and 1 in the reverse order, matching the zero and one-dimensional spaces of flag-preserving maps (LIN15, §1.6, Corollary 1.5, equation (1.11); LIN15 line 517).

One route is as follows. Construct the parabolic coherent Hall algebra with local flag generators, the displayed Euler form and hereditary correspondence. Prove its generic form, HN membership and shuffle specialization, then repeat the nilpotent groupoid calculation. Prove density using the open configuration space of distinct rational marks on the universal smooth curve, allowing all finite extensions, and track only the q^m−1 denominators of K_g. The unmarked Mellit theorem is not used to infer parabolic denominator removal.

*Needs:* §11.1; §4.8; §4.9; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.

**Checks.**

- With no marks the K_g function is the ordinary A of §4.9; flags of length one give the same function.
- In rank one every flag is unique, so the universal value is P(1), which happens to lie in R_g.
- The allowed K_g element (q−1)⁻¹ has value 1 at q=2 and a pole at q=1; a localized Hall calculation alone cannot put it in R_g.

### 11.3 slope-cut and fixed-HN absolute counts

Define the following objects and their indicated structure. Use the slope-cut counts of §0.2 for rational ν. For a decreasing HN type β=(α_1,…,α_t) of total (r,d), define A_X,β by requiring the exact HN type β. The objects counted are absolutely indecomposable bundles, although their HN graded objects can be decomposable. A slope cut is a finite union of HN strata in each fixed bounded rank-degree range. (S16, §8.1–8.2, Corollary 8.1 and Conjecture 8.2, pp.353–354; S16 line 3116).

The interface has the following properties.

- An absolute count on a bounded union of distinct HN types is the sum of the type counts.
- Dualization identifies ≥ν counts at (r,d) with ≤−ν counts at (r,−d).
- Degree-one tensoring shifts each HN slope by one and the total degree by r.

One route is as follows. Use the imported HN type and its scalar-extension compatibility. Intersect each type or slope condition with the absolute-indecomposable class set. Use the HN spread bound to make the relevant unions finite.

*Needs:* §0.2; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.

**Checks.**

- For rank one and ν=0, degrees −1 and 0 give lower-cut counts 0 and P(1); the degree-zero line is semistable at the boundary ν=d/r.
- For the nonsplit genus-two bundle in the next Check, μ=1/2 but μ_min=0, so its ≥1/2 indicator is 0. For any ν>1/2 the class-(2,1) lower-cut count is also 0; an average-slope cutoff would wrongly admit that bundle at 1/2.
- On a genus-two curve with rational P, Ext¹(O,O(P))=H¹(O(P))=k. A nonzero extension 0→O(P)→E→O→0 has exact HN classes ((1,1),(1,0)) and is absolutely indecomposable: a decomposition would split this unique HN extension, while its nonzero class stays nonzero over k̄. The split extension has the same HN type and is not absolutely indecomposable.

### 11.4 universal slope-cut counting functions

Prove the following statement. For every rational ν and class (r,d) with r>0, there are unique elements `A_{g,r,d}^{≥ν},A_{g,r,d}^{≤ν}∈K_g` specializing to the two slope-cut absolute counts. Degree-one twist and duality hold universally. This theorem does not assert membership in R_g or a universal element for each exact HN type. (S16, §8.1, Corollary 8.1, p.353; §4.5–4.6, pp.319–321; S16 line 3116).

One route is as follows. Use HN characteristic functions in the generic spherical Hall algebra for the specified cutoff. Apply truncated nilpotent counting and coefficientwise plethystic logarithms. Identify the specialization and use universal density for uniqueness.

*Needs:* §11.3; §4.7; §4.8; §2.3; §4.9; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- Rank1,d=−1,0 at ν=0; dual ν=0: Lower-cut values0,P(1); dual upper-cut values at d=1,0 are0,P(1). Only K_g is asserted.

### 11.5 Euler-characteristic spherical Hall Lie algebra

Define the following objects and their indicated structure. Over an algebraically closed characteristic-zero field, construct the constructible Euler-characteristic Hall convolution for coherent sheaves, using compact Euler integration on finite-type subsheaf correspondences and comparison with ℂ by spread-out. The direct-sum pullback first takes values in constructible functions on the product moduli problem; an algebraic tensor target is asserted only on the spherical subalgebra. Prove that the graded subalgebra generated by torsion constants and all line-bundle constants has a cocommutative Hopf structure. Define its primitive subspace h_X^sph with the commutator bracket. Establish every finite-coefficient support condition before forming a coproduct or antipode. A finite-field evaluation at α_j=1 does not define this algebra. (S16, §8.3, pp.354–355; S16 line 3188).

The supporting input is BTL12, arXiv v5, §§4.2–4.4, pp.17–19; BTL12 line 766 and BTL12 line 850.

The interface has the following properties.

- The zero-sheaf delta function is the convolution unit and the degree-zero primitive part is zero.
- If Δx=x⊗1+1⊗x and similarly for y, then [x,y] is primitive.
- A curve isomorphism induces a grading-preserving Hopf equivalence and a primitive Lie equivalence.

One route is as follows. Construct Euler pushforward on the relevant finite-type constructible correspondences and prove independence of presentations. Prove Hall convolution and direct-sum compatibility for coherent sheaves; the finite-dimensional-module argument of BTL12 §4 is a model whose finite-length hypotheses are replaced by bounded coherent correspondences. Prove the spherical subalgebra is closed under the algebraic coproduct, construct its antipode on the stated grading, and take primitives.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; SchemeAndStackFoundations §§1.18–1.21; §3.1.

**Checks.**

- Over characteristic zero a scalar multiple of the Hopf unit is primitive only when it is zero.
- On P¹_C the torsion degree-one characteristic is primitive. Its quotient-left product with the degree-d line characteristic takes value χ(P¹)=2 on O(d+1), from the sublines O(d+1)(−x). The reversed product has value 0 because a line has no torsion subsheaf. The commutator therefore has value 2, fixing the Hall order.
- The K_g function (q−1)⁻¹ has a pole at the proposed α=1 limit, so naive numerical evaluation does not define the Euler Hall product.
- For an unrestricted constructible function on a product moduli space, the direct-sum pullback need not be a finite sum of separated-variable functions. The coproduct is first defined on the product function space; the spherical closure theorem supplies the algebraic tensor target.

### 11.6 precise remaining Hall and HN conjectures

Define the following objects and their indicated structure. Formulate the following conjectures: (i) for every exact HN type β its absolute count is a specialization of some `A_{g,β}∈R_g`; (ii) each difference `A^{≥i}_{g,r,d}−A^{≥i+1}_{g,r,d}`, i≥0, has a Weyl-invariant class on the paired affine cone with a representative having nonnegative integer coefficients in the variables −α_j; invariance of the representative before the paired relations is not asserted; (iii) h_X^sph is independent of X of genus g, has finite-dimensional graded pieces, and `dim h^sph_(r,d)=A_{g,r,d}(0)`; (iv) for `H_sph^{≥0}`, the subalgebra of spherical functions supported on the nonnegative HN category, `∑_β dim H_sph,β^{≥0}z^β=Exp(∑_β A_{g,β}^{≥0}(0)z^β)`. Any origin evaluation in (ii)–(iv) includes the regularity assertion needed to define it. The commuting-variety K-theory/cohomology degeneration mentioned in S16 is a separate proposed geometric mechanism, not a proved consequence. (S16, §8.1 remarks and §8.2–8.3, Conjectures 8.2–8.4, pp.353–355; S16 line 3116).

The interface has the following properties.

- The fixed-type proposition includes equality for every finite field and curve, not just a chosen X.
- The Hall-Lie statement entails origin regularity and finite-dimensionality before equating two integers.
- The Hilbert-series statement is equivalent to equality of every finite bidegree coefficient after the specified Exp expansion.

One route is as follows. Form each proposition using the imported graded coefficient and algebra notions. Keep the underlying universal count, denominator-removal and finite-dimensionality assertions separate. Keep these conjectures separate from the preceding theorems; no theorem uses them as hypotheses.

*Needs:* §11.3; §11.4; §11.5; §6.5; §4.6; HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.

**Checks.**

- Degree independence of the untruncated A does not imply fixed-HN polynomiality.
- In coprime rank one the proposed root multiplicity is 1, the proved nilpotent-cone component count.
- A slope-cut coefficient with an uncancelled q⁻¹ has no origin value; it cannot be inserted in the Hilbert identity.

### Examples

No marked points, or only flags of length one, recovers ordinary bundles. Every admissible rank-one flag is unique, so its absolute count is P(1). For the Euler Hall coproduct, a scalar c times the unit is primitive only if c=2c, hence c=0; for primitive x,y the mixed tensor terms cancel in Δ[x,y] (S16, §§7–8, pp.352–355; S16 line 3096 and S16 line 3188).

### Dependencies

- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13.
- SchemeAndStackFoundations §§1.18–1.21.
- §0.2.
- §4.8.
- §4.9.
- HabiroNahmSeries §5.1 and its complete-Adams contract; QSeriesPartitionsAndMockModularForms §§2.4, 3.5.
- §4.7.
- §2.3.
- §3.1.
- §6.5.
- §4.6.

## Downstream consumers

TopologicalMirrorSymmetryForHitchinSystems consumes the stable canonical GL_r Higgs geometry and its purity theorem, adding fixed-determinant and rigidified relative moduli in its own direction. Applications to trace-formula counts use the same reciprocal Weil coordinates, full character-ring specialization, quasi-parabolic counts, slope-cut invariants and the distinction between a stack mass and a coarse point count. Function-field counting applications use the universal bundle invariant, Higgs point count and nilpotent-cone component number. They receive the all-characteristic formulas of §§8.3 and 10.4. The conjectures in §11.6 are not supplier theorems for any consumer.

## Worked examples

For rank one, A_X(1,d)=#Pic⁰_X(k)=P_X(1), even if X(k) is empty. Degree shifting uses an integer divisor of degree one and the Picard torsor. Canonical Higgs fields form H⁰(X,Ω), so H_(1,d)=Pic^d×A^g and #H=q^gP_X(1). The signed compact Poincaré polynomial is t^(2g)(1−t)^(2g), its unsigned variant t^(2g)(1+t)^(2g). The nilpotent cone Pic^d has one geometric component, top degree 2g, and reciprocal trace q^g∏ⱼ(1−αⱼ⁻¹)=P_X(1). Dividing the Higgs point count by q^g gives the polynomial P_X(1), whose regular origin value is 1; the reciprocal trace gives the same polynomial. Dividing the signed compact polynomial by t^(2g) leaves constant coefficient 1 (S16, Theorem 1.2, Corollaries 1.3–1.5 and §6.11; S16 line 136 and S16 line 3045).

On P¹, every indecomposable bundle is a line. Hence the absolute counts are 1 in rank one and 0 in higher rank; a coprime stable Higgs locus is a point in rank one and empty in higher rank. In genus one, the degree-independent count is P_X(1) in every positive rank. The rank-two formula with the empty eigenvalue tuple gives 0 at q=2, while with (−1,−2), q=2, it gives 6=P_X(1). These are two different genera with the same formal q, not two evaluations of a fixed-genus count (S16, pp.305–306 and Appendix C; S16 line 388; M20, Theorem 1.1, pp.302–303).

For the origin formula in genus two, the rank-one logarithmic coefficient is z/(1−z), whose differential residue at 1 is −1. Its negative gives 1. The next three constants are 2,6,22; in genus three the rank-three and rank-four values are 15 and 95. These values agree with the constant genus polynomials and the component formula, and the rank-one witness fixes the sign used at every rank (S16, Corollary 1.9 and examples, pp.305–306, with the differential-residue normalization of §0.3; S16 line 428 and S16 line 453).

## References

- **S16.** Olivier Schiffmann, [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), 2016. Published version, §§1–8 and Appendices A–C, pp.297–362; PDF page 1 is printed p.297.
- **M20.** Anton Mellit, [Poincaré polynomials of moduli spaces of Higgs bundles and character varieties (no punctures)](https://link.springer.com/content/pdf/10.1007/s00222-020-00950-1.pdf), 2020. Published Theorems 1.1 and 5.2; Proposition 3.1; §§4–5, pp.302–303,310–321. Cited by theorem and page locator.
- **MS14.** Sergey Mozgovoy and Olivier Schiffmann, [Counting Higgs bundles](https://arxiv.org/abs/1411.2101v1), 2014. arXiv:1411.2101v1, Theorem 1.2, §§2–4, pp.2–9.
- **HN10.** Olivier Schiffmann, [Spherical Hall algebras of curves and Harder–Narasimhan stratas](https://arxiv.org/abs/1002.0987v1), 2010. arXiv:1002.0987v1, §§1.2–1.3, Theorem 3.1 and Corollary 3.5, pp.2–3,5–8.
- **SV12.** Olivier Schiffmann and Eric Vasserot, [Hall algebras of curves, commuting varieties and Langlands duality](https://arxiv.org/abs/1009.0678v1), 2010. arXiv:1009.0678v1, §1.11, p.13.
- **M20P.** Anton Mellit, [Poincaré polynomials of character varieties, Macdonald polynomials and affine Springer fibers](https://arxiv.org/abs/1710.04513v1), 2017. arXiv:1710.04513v1, §7.1, Theorems 7.1–7.2, Proposition 7.3 and Corollary 7.4, pp.54–55; the numbering is that of the version read.
- **M18.** Anton Mellit, [Integrality of Hausel–Letellier–Rodriguez-Villegas kernels](https://arxiv.org/abs/1605.01299v2), 2018. arXiv:1605.01299v2, §§5–7, especially Theorem 7.1, p.30, and Corollary 7.2, p.31.
- **WII.** Pierre Deligne, [La conjecture de Weil : II](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf), 1980. Weil II (3.5.1)–(3.5.3), pp.210–211.
- **LIN15.** Jyun-Ao Lin, [Spherical Hall algebras of a weighted projective curve](https://arxiv.org/abs/1410.0896v2), 2014. arXiv:1410.0896v2, §§1.2–1.3, Corollary 1.5 in §1.6, Theorems 3.1 and 3.16.
- **BTL12.** Tom Bridgeland, Valerio Toledano Laredo, [Stability conditions and Stokes factors](https://arxiv.org/abs/0801.3974v5), 2012. arXiv:0801.3974v5, §§4.2–4.4, pp.17–19; its module-category hypotheses are retained when adapting the argument.
- **FH58.** N. J. Fine, I. N. Herstein, [The probability that a matrix be nilpotent](https://doi.org/10.1215/ijm/1255454112), 1958. Theorem 1, p.499, proof pp.499–503. The same count is stated in S16, Corollary 2.5, p.309. Cited by theorem and page locator.
- **SPR66.** T. A. Springer, [Nonabelian H² in Galois cohomology](https://www-fourier.univ-grenoble-alpes.fr/~panchish/ETE%20LAMA%202018-AP/Borel_Algebraic%20Groups%20and%20Discontinuous%20Subgroups.pdf), 1966. Theorem 3.5, p.179; SPR66 line 6739.
- **HES81.** W. H. Hesselink, [Concentration under actions of algebraic groups](https://doi.org/10.1007/BFb0090380), 1981. Theorem 5.7, pp.55–89. Cited by theorem and page locator.
- **STACKS.** The Stacks Project Authors, [Topological invariance of the small étale site](https://stacks.math.columbia.edu/tag/04DY), §59.45, Theorem 59.45.2 (Tag 04DZ) and Proposition 59.45.4 (Tag 03SI); STACKS line 3033 and STACKS line 3130.
