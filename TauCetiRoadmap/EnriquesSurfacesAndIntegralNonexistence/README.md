# Roadmap: Enriques surfaces and nonexistence over the integers

**Summary.** This arithmetic Part II to EnriquesSurfaces extends its characteristic-not-two surface theory to characteristic two and arbitrary-field descent. Build the arithmetic geometry of Enriques surfaces from their geometric definition and numerical intersection lattice through genus-one fibrations, canonical coverings and Picard descent. The main targets exclude nonexceptional Enriques surfaces over F₂ with constant full Picard scheme, and then flat proper families over Spec ℤ with geometric Enriques fibres. The route includes characteristic-two deformation theory and two separate classification obligations: an exhaustive fourteen-case rational-Jacobian classification and the exclusion of three additional Enriques configurations. These obligations are part of the specification of the proof, including every use of the eight-case residual table.

## Scope and ownership

This roadmap owns the coherent Enriques invariants, its numerical intersection lattice, half-fibres and Enriques-specific two-sections, the characteristic-two type distinctions, conductrix and exceptionality, families and canonical coverings, and the Enriques applications of numerical descent. It owns the four-global-twist comparison, the Enriques-to-Jacobian comparison, the configuration exclusions, and the lifting and nonexistence theorems. Its statements concern actual schemes, algebraic spaces, line bundles and cohomology groups.

EnriquesSurfaces E0–E1f develops the geometric characteristic-not-two invariants, numerical lattice, canonical étale cover, lifting, half-fibres and nodal reflection reduction. Its core stops before the characteristic-two types and arithmetic descent. The variants here add characteristic two, arbitrary ground fields or algebraic-space families; their characteristic-not-two geometric specializations use that interface.

The following material has other owners and is used through their interfaces.

- **NeronModelsAndSemistableAbelianVarietiesPartII** §2.9 owns finite-field labelled fibre-graph descent, including rationality of reducible base points and component normalizations. Its §3.11 owns geometric torsor/Jacobian Kodaira matching after removing torsor multiplicity. Those general statements are consumed directly. The simple-fibre identification in §4.4 below additionally descends an actual isomorphism to the residue field F₂.
- **InverseGaloisAndArithmeticFundamentalGroups** §IG.0.3 owns finite monodromy and a finite étale trivializing cover for integral local systems on a connected normal locally Noetherian scheme. The integral Num specialization uses this theorem.
- **IntegralLattices**, including its completed Layers 1–5, owns integral lattices, duality, finite discriminant forms, root lattices and even overlattices. Its Layer 6, milestone 6A, owns indefinite unimodular classification. The geometric identification of Num(Y), Lang’s positive-cone decomposition theorem, the two particular Gram matrices and their geometric applications belong here.
- **AdicSpacesPartIII** F0.3 owns the comparison of Cartesian adic towers with formal schemes and their coherent modules; F0.8 owns effective algebraization of proper formal schemes with an invertible sheaf whose closed-fibre restriction is ample. These supply the projective scheme and ample line in §8.3a. SchemeAndStackFoundations §4.10 supplies coherent existence and compatible morphisms on given proper schemes.
- **AlgebraicVectorBundles** owns invertible sheaves, tensor operations and relative Spec. The pinned Tau Ceti library has `LineBundleClass`, `Scheme.CartierDivisor.toLineBundleClassHom`, the regular-curve `LineBundleClass.eulerDegreeHom` and `LineBundleClass.picZero`, and `rigidifiedPicardFunctor` for a scheme morphism with a section. These are the underlying objects for the relevant adapters; no second abstract Picard group, degree-zero group or rigidified functor is introduced. Surface Picard representability and the unpointed fppf sheaf are additional interfaces.
- **JacobianChallenge**, Layer D, owns projective Picard representability for geometrically integral projective schemes over a field, including Enriques surfaces, and the pointed smooth-curve Jacobian specialization. Its Layer E concerns abelian varieties. The generic curve of an Enriques fibration need not have a rational point; a quasielliptic generic curve is regular and nonsmooth. Their Picard and compactification adapters, Kodaira fibres, regular minimal models and rational-elliptic classification belong to **NeronModelsAndSemistableAbelianVarietiesPartII**, §§2.1–2.16, 3.7–3.11, 4.1–4.18, 5.1–5.8, 6.1 and 7.4. Its §2.14 supplies the constant-Num I₀* exclusion over F₂, including its Enriques specialization.
- **LocalFieldsRamification**, Layers 1–2, owns local-field unit filtrations, power classes and unramified extensions. Here its Q₂ specialization is connected to the four units of ℤ[1/2] modulo squares and to canonical-cover twisting. The pinned Tau Ceti library has the square-class group `TauCeti.SquareClassGroup`, the count `TauCeti.card_unitSquareClasses_padic_two` of the four unit square classes of ℚ₂, Padic.not_isSquare_five, and the unramified quadratic extension `TauCeti.UnramifiedQuadratic` of ℚ₂, defined by X²+X+1. The dyadic statements of Layer 3 are proved from these. The class-five model z²−z−1 used in Layer 3 defines the same extension: the discriminants 5 and −3 differ by −15, which is a square in ℚ₂ because −15≡1 mod 16.
- **SchemeAndStackFoundations**, **AlgebraicModuliForArithmeticGeometry**, **FiniteFlatGroupsAndIntegralPadicHodgeTheory** and **WeilConjectures** supply the general geometry, cohomology, finite-flat groups and trace formula specified below. The finite-flat contract rests on objects in the pinned Tau Ceti library: Cartier duality of finite locally free commutative affine group schemes over a ring (`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`), the roots-of-unity group schemes μ_n and the Frobenius kernel α_p of the additive group. No second construction of these is planned here. **SchemeAndStackFoundations**, Part II §numerical-contraction-descent, is the owner requested for the general numerical descent extension specified below. **K3SurfacesAndSymplecticBoundedness** §§1.1–1.3 owns the shared geometric K3 predicate and its projectivity; §6.0b owns the shared genus-one carrier, component lattices, wild canonical formula, regular Jacobian and Euler comparison, including quasielliptic fibrations. **PadicHodgeTheory**, Part II §everywhere-good-reduction, is the owner requested for Fontaine's obstruction. **WeilConjectures**, WC.7, owns the arbitrary-field Enriques predicate, its numerical-canonical characterization, field extension, projectivity, étale invariants and the constant-Num Enriques count. This roadmap consumes those results; its Layer 0 adds Picard length, coherent invariants and the numerical lattice. **ComplexComparisonPartII** C3.2d.2–C3.2d.5 owns relative Picard algebraic-space representability, Picard–Brauer descent and finite Cartier-dual torsors; **AlgebraicModuliForArithmeticGeometry** §7.6 supplies its relative sheaf and base-change inputs.

The Enriques geometric invariants, primitive-nef linear-system theorem, nodal reflection reduction and integral-two-section theorem include the classical foundational arguments cited by Schröer and Martin–Mezzedimi–Veniani. These are mathematical proof targets here. Statements of older results in those papers identify the required input; they do not replace a proof of it. Layer 1 includes Lang's general effective-divisor and numerical reducibility theorems and their separate coset-preserving two-section application.

## Conventions

A geometric surface means a surface over an algebraically closed field. Otherwise the ground field is arbitrary, without an implicit perfectness or characteristic restriction. `IsEnriques(Y/k)` is imposed after algebraic closure on a smooth proper k-scheme of pure dimension two. Projectivity is a theorem. An Enriques family is a flat proper finitely presented algebraic space over its base, with geometric Enriques fibres; the source is not assumed to be a scheme. Smoothness follows from flatness, finite presentation and smooth geometric fibres.

Use Pic for the fppf relative Picard sheaf and its representing group object, Pic^τ for numerically trivial classes and Num = Pic/Pic^τ. Over a geometric field, `Num(Y)` is the free rank-ten group with its divisor intersection form. Distinguish constant Num, a split Picard extension and constant **full** Picard scheme `(ℤ¹⁰ ⊕ ℤ/2)_S`. A connected group scheme μ₂ or α₂ has length two in characteristic two even though it has one geometric point. All finite-flat torsors and their canonical-cover obstruction use fppf cohomology. Write `H²_et(S,G_m)` for the whole cohomological group in the affine descent hypothesis; no identification with an Azumaya subgroup is assumed for a general base.

A genus-one fibration has geometrically connected fibres and is relatively minimal; its generic fibre is geometrically integral of arithmetic genus one. It is elliptic when that generic curve is smooth and quasielliptic when it is regular but geometrically cuspidal. A full scheme fibre is `φ*([a])`. A half-fibre F includes its component multiplicities and satisfies `2F = φ*([a])`; it is not the reduced support. A two-section R is integral horizontal of degree two: `R·(2F)=2`, hence `R·F=1`. It can have square zero. For partner half-fibres `F·F′=1`, the two full fibre classes have intersection four. The lower bound four for distinct pencils always refers to full fibre classes.

Use the intersection sign convention `C² = −2` for a geometric rational nodal curve. The hyperbolic block is `U = [[0,1],[1,0]]`, and the rank-eight summand in `Num(Y) ≅ U ⊕ E₈(−1)` is negative definite. The native discriminant quadratic map is `x ↦ (x,x)/2` in ℚ/ℤ: full norm −2 gives zero; full norm −1 gives 1/2. Nondegeneracy is needed for finiteness of the discriminant group, not for the Gram-lattice constructor.

In fibre tables, E_n is a smooth elliptic curve over F₂ with n rational points, and Ĩ_n is a nonsplit semistable fibre. A type label records the geometric Kodaira symbol separately from the scheme multiplicity and from splitness over the residue field. Triples are considered up to automorphism of P¹ over F₂. Geometric Frobenius acts by q on untwisted divisor cohomology and by one after the Tate twist `(1)`; point counts use ℓ ≠ char(k).

The component intersection graph records vertices and total intersection numbers. It does not distinguish individual conjugate nodes or branches of a node. Thus descent of this graph is compatible with nonsplit I₁ or I₂ fibres; it does not turn Ĩ_n into I_n.

The Enriques API below is specified in prose. In `Suggested.lean` the corresponding representative names live under `TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence`. Its matrices and dyadic representative function have real bodies on existing carriers. The geometric objects and theorems are specified here; the Lean module docstring identifies their missing carriers.

## Exact supplier contracts

### From Mathlib

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` for the representative Lean signatures.

- `Pi.basisFun`, `Mathlib/LinearAlgebra/StdBasis.lean`, supplies the standard basis of a finite coordinate-function module. In Layer 6 use `Pi.basisFun ℚ (Fin 10)`.
- `bijective_algebraMap_int_of_finite_of_unramified`, `Mathlib/NumberTheory/NumberField/ExistsRamified.lean`, says that the integer algebra map into a finite unramified faithful ℤ-algebra that is a domain is bijective. The passage from a general finite étale ℤ-algebra to its domain factors, and then to the triviality of π₁(Spec ℤ), uses the scheme-theoretic decomposition contract below.
- `hensels_lemma`, `Mathlib/NumberTheory/Padics/Hensel.lean`, supplies a p-adic integral root under the strict inequality `‖F(a)‖ < ‖F′(a)‖²`, with the nearby-root uniqueness and derivative norm assertion. For an odd dyadic unit u with `u ≡ 1 mod 8`, use `F(X)=X²−u`, `a=1`: `‖F(1)‖ ≤ 1/8 < 1/4 = ‖F′(1)‖²`. The strict inequality matters at p=2.

### From Tau Ceti and its existing roadmaps

At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use `TauCeti.IntegralLattice` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`: a full finitely generated ℤ-submodule of a rational vector space together with an integral symmetric bilinear form. Its `ofGramMatrix` takes a finite rational basis, an integer matrix and a proof of symmetry; integralForm_ofGramMatrix_apply computes its native carrier-basis pairing. The construction also permits degenerate forms: the structure fields are carrier, form, lattice spanning/finiteness, symmetry and integrality, with no nondegeneracy field (TauCeti/LinearAlgebra/IntegralLattice/Basic.lean line 63). Its use here never supplies nondegeneracy by assumption.

`IntegralLattice.hyperbolicPlane` in `Examples.lean` fixes the U block. `IntegralLattice.d8PlusLattice` in `RootLattice/D8Plus/Basic.lean` supplies the positive spinor-glue E₈ model; negate its form for the Enriques comparison. `IntegralLattice.discriminantQuadraticMap` in `Discriminant/Quadratic.lean` has the half-norm convention fixed above. `IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup` in `Overlattice/Isotropic.lean` identifies even intermediate carriers with quadratic-isotropic subgroups of the native discriminant group. The associated determinant, index and discriminant-cardinality theory is consumed through that API.

The **IntegralLattices Layer 6, milestone 6A** (indefinite classification) contract is uniqueness of an indefinite even unimodular integral lattice at fixed signature. Its specialization at `(1,9)` supplies the isometry after the geometric perfectness and signature arguments. The definite analogue at rank sixteen is false and is not used. For geometry use the pinned native Cartier-divisor and line-bundle objects listed under Scope.

The **AlgebraicVectorBundles** tensor and relative-Spec interface is used to form the rank-two algebra of a canonical covering. The **JacobianChallenge Layer D** contract supplies projective geometrically integral field-scheme Picard representability, as well as its pointed smooth-curve specialization, with base-change and restriction maps. The **LocalFieldsRamification Layer 1** unit and power-class interface and **Layer 2** unramified-extension interface are used at Q₂: valuation parity and the four odd residues modulo eight classify square classes; the class five has the étale model `ℤ₂[z]/(z²−z−1)`, whose discriminant is five and whose reduction is the irreducible separable polynomial `z²+z+1`.

### From TauCetiRoadmap.EnriquesSurfaces

Use E0 for the surface/curve restriction and field-extension adapters on the shared Cartier-divisor and line-bundle carriers. E1a supplies coherent vanishing, the numerical Picard kernel, the canonical étale K3 cover and a projective W(k)-lift in characteristic greater than two; E1b–E1e supplies the integral numerical pairing and its U ⊕ E₈(−1) isometry outside characteristic two. E1f supplies geometric genus-one existence, half-fibres, the two tame double fibres and effective-root reflection reduction on that same characteristic-not-two domain. Here §§0.2–0.4, 1.1–1.10, 3.10 and 8.3a extend those results to characteristic two or arbitrary fields as stated. No positive-characteristic-two conclusion is inferred from those imports.

Use InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 on Spec ℤ: its normality, connectedness and local Noetherianity allow finite monodromy for the integral numerical local system, and its finite étale trivializing cover becomes trivial by the stated unramified-algebra theorem.

### General geometric and cohomological suppliers

- **SchemeAndStackFoundations** §§1.3–1.9 supplies algebraic spaces and properness; §0.11 supplies base change; §§4.1–4.6 supplies marked deformation functors, hulls, tangent and obstruction spaces. Use §2.6 for coherent cohomology, §2.20 for duality, §§5.9–5.10 for surface intersections, adjunction, Riemann–Roch and Hodge index, and §1.2 for effective descent. Nilpotent thickenings and smooth lifting use §4.1. Finite étale Galois categories and fundamental groups use EtaleCohomologyFoundations §F.0.2; §2.15 supplies the field étale cohomology input.
- **AdicSpacesPartIII** F0.3's formal-scheme-carrier-comparison and coherent-module comparison take a locally Noetherian Cartesian adic tower with finitely generated first-order ideal, and compatible invertible sheaves, to a formal scheme with an invertible sheaf. F0.8's grothendieck-algebraization and ample-line conclusion construct a projective scheme over a complete Noetherian adic ring A, with that formal completion and that ample line, when the formal scheme is proper and the line is ample modulo the ideal of definition. In §8.3a use A=V and I=(π), with every level smooth over V/(π^(n+1)). R2.10's adic-local-flatness-criterion gives flatness at the closed fibre, and R2.9's smooth-formal-scheme comparison gives smoothness there; F0.7's closed-fibre-neighbourhood then makes the open smooth locus the whole proper algebraization. SchemeAndStackFoundations §4.10 supplies coherent existence and full faithfulness for compatible morphisms on the resulting proper scheme, with no construction of that scheme inferred from coherent existence.
- **SchemeAndStackFoundations** §§2.2–2.4, 2.11, 2.15 and 2.22 supplies Leray, fppf torsors, Kummer, field étale cohomology and cohomological Brauer groups. Use **ComplexComparisonPartII** C3.2d.4 for `picard_brauer_obstruction` and C3.2d.5 for `finite_picard_cartier_torsors`, including non-étale finite flat groups. Use **WeilConjectures** WC.7 for Galois-compatible divisor cycle classes and the constant-Num count.
- **AlgebraicModuliForArithmeticGeometry** §7.6.1–§7.6.1a supplies `relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel` and `sectionPicardSplit`. **ComplexComparisonPartII** C3.2d.2 supplies `relative_picard_algebraicSpace` for proper flat finitely presented algebraic-space morphisms with universal functions, quasi-separated and locally of finite presentation; no general separatedness assertion is added. The Enriques improvement to a scheme follows the relative-invariants argument in §2.3 here.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory** R07.1 supplies rank-two Oort–Tate groups with parameters `ab=2`, Hopf algebras, Frobenius, Verschiebung and Cartier duality over the field and Witt bases. Its base roadmap does not supply the nonlifting extension requested below.
- **WeilConjectures** WC.7 supplies `IsEnriques`, `enriques_characterization`, `enriques_baseChange`, projectivity, `enriques_etaleInvariants`, `numericalPicardLocalSystem`, `count_surface_of_constant_num` and `count_enriques_or_rational_genus_one`. In particular b₁=b₃=0 and b₂=ρ=10, and a constant-Num Enriques surface over F_q has `1+10q^r+q^(2r)` points over F_(q^r), r≥1.
- **K3SurfacesAndSymplecticBoundedness** §1.1 supplies `IsK3`; §1.2 supplies `isK3_fieldExtension_iff` and isomorphism transport; §1.3 supplies projectivity. These are the shared K3 objects used in §3.10. Its §6.0b supplies the genus-one carrier, component lattices, wild canonical formula, regular Jacobian and Euler comparison, including quasielliptic fibrations, used in §§4.1–4.2.
- **NeronModelsAndSemistableAbelianVarietiesPartII** §§2.1–2.5 supplies genus-one fibrations, fibre divisors and Kodaira types in every characteristic; §§2.9–2.16 supplies finite-field labelled component descent, counts and forms of P¹; §2.14 supplies the I₀* exclusion over F₂ under constant Num; §§3.7–3.11 supplies the local torsor comparison, the F₂ reduced-fibre isomorphism and geometric Kodaira matching. §§4.1–4.3 supplies canonical and Euler formulas; §6.1 supplies the characteristic-independent surface rationality criterion H¹(O)=H⁰(ω²)=0; §§4.7–4.8 and 4.16 supplies restriction with vertical kernel, Shioda–Tate and quasielliptic 2-torsion; §4.17 supplies unpointed and regular nonsmooth generic Jacobians and minimal models; §4.18 supplies geometric Tsen. §§5.1–5.8 supplies the auxiliary count and rational-Jacobian constant-Picard criterion. §7.4 supplies completeness of the fourteen-model rational-elliptic classification, including the three nonsplit completions. These inputs are imported rather than constructed here; K3SurfacesAndSymplecticBoundedness §6.0b supplies the shared geometric genus-one theory and NeronModelsAndSemistableAbelianVarietiesPartII §§2–4 its arithmetic models and local comparisons.

The pinned dyadic-unit inputs are `TauCeti.exists_eq_neg_one_pow_mul_five_pow_mul_sq` and `TauCeti.isSquare_coe_iff_mem_unitsPrincipal_three` in `TauCeti/NumberTheory/Padics/SerreSigns.lean`. The full eight-class count is `TauCeti.card_squareClasses_padic_two` in `TauCeti/NumberTheory/LocalField/SquareClass.lean` line 128. Layer 3 supplies the explicitly ordered representative comparison and the canonical-twist comparison, rather than a second square-class group or cardinality theorem. The native Cartier duality is in `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`; `TauCeti.AlgebraicGeometry.LineBundleClass` is in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`, `Scheme.CartierDivisor.toLineBundleClassHom` is in `TauCeti/AlgebraicGeometry/CartierDivisor/Picard.lean`, the regular-curve `LineBundleClass.eulerDegreeHom` and `LineBundleClass.picZero` are in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.lean`, and `rigidifiedPicardFunctor` is in `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean`.

### Supplier extension contracts

What SchemeAndStackFoundations must provide (gap:numerical-contraction-descent): In Part II §numerical-contraction-descent, extend the numerical divisor quotient to arbitrary-field proper schemes and to proper flat finitely presented families with flat Pic^τ and locally constant geometric numerical rank, with base-change comparison; prove descent of projective contractions under constant Num, and for a smooth proper surface with H⁰(O)=k prove fibre-graph descent, preservation of intersection labels when the reduced residue fibre is geometrically reduced, and purely inseparable residue field for a geometrically reducible fibre (SCH23, Theorem 1.3, pp. 6–7, and Theorem 2.1, pp. 8–9). Local projectivity in §3.3 uses a section to split the Picard obstruction, constant Num and `2 Pic^τ=0`, not general Brauer vanishing.

The numerical quotient extension must identify line-bundle classes modulo numerical triviality, carry the pullback homomorphism and its identity/composition laws, and supply the stated base-change comparison on the flat-Pic^τ, locally constant-rank family domain. The contraction statement requires a proper k-scheme X and a projective geometric target, with O of the target equal to the contraction pushforward; its descended target is a k-form, without a chosen projective-space embedding.

**Checks.**

- The split quadric P¹×P¹ has Num=ℤ² and its two ruling classes have pairing matrix U; collapsing both classes would give rank zero and lose the ruling contraction.
- For the nonsplit smooth quadric over a finite field, Frobenius exchanges the two geometric rulings. The invariant diagonal has rank one, so the constant-Num premise fails and the individual ruling contraction cannot be deduced over that field.
- On the constant characteristic-two family with Pic^τ=α₂ over k[ε]/ε², the numerical quotient still has rank ten and the torsion subgroup has k-length four; taking geometric points of Pic^τ would erase its length-two infinitesimal structure.

What AlgebraicModuliForArithmeticGeometry must provide (gap:picard-flatness-betti): In Part II §picard-deformations, for a smooth proper geometrically connected Y/k over an algebraically closed field of characteristic p>0, and a proper flat deformation over a local Noetherian W(k)-algebra with closed fibre Y, prove relative Picard flatness when `b₁(Y)=2(h¹(O_Y)−h²(O_Y))`; over a Henselian base of dimension at most one, include the proper flat identity-component scheme and its finite-flat specialization when Pic⁰(Y) is finite (DI21, proof of Theorem 4.3, pp. 16–17).

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:finite-local-group-w2-nonlifting): In Part II §finite-local-group-nonlifting, for algebraically closed k of characteristic p>0 and a finite commutative local k-group L, if its unipotent quotient by its multiplicative part has α_(p^n), n≥1, as a direct summand, prove that L has no finite flat W₂(k)-lift (DI21, Proposition 4.2, pp. 15–16). In §8.2 take L=α₂; the base R07.1 Oort–Tate classification alone is not this theorem.

What SchemeAndStackFoundations must provide (gap:one-obstruction-regularity): In Part II §one-obstruction-deformations, for a smooth proper Y/k with k algebraically closed of characteristic p>0, h¹(Θ)=s and h²(Θ)=1, prove that nonlifting to W₂(k) makes its miniversal ring `W(k)[[T₁,…,T_s]]/(f)` regular of dimension s; additionally prove that formal lifting to characteristic zero is equivalent to singularity of A/pA and makes A W(k)-flat of relative dimension s−1 (DI21, Proposition 3.3 and Corollary 3.4, pp. 11–12). Regularity alone does not give flatness.

What SchemeAndStackFoundations must provide (gap:differential-w2-nonlifting): In Part II §differential-nonlifting, for a smooth proper surface Y over an algebraically closed field of characteristic two with a coherent quotient Ω¹→F invertible in codimension one, put L=Hom(F,O) and require the sequence `0→L⊗ω→Ω¹→I L⁻¹→0`, I of finite support, ω of exact order two, a semiample curve H with L·H>0, and 2-divisibility of L⊗ω in Pic(Y); prove `h¹(Ω¹_Y)=h¹(Hom(Frob_*Ω¹_Y,O_(Y⁽¹⁾)))` and `h⁰(L)≤h⁰(L⊗ω)`, with equality implying no W₂-lift (DI21, Theorem 6.1, pp. 20–22).

What PadicHodgeTheory must provide (gap:fontaine-low-degree-hodge): In Part II §everywhere-good-reduction, prove that a smooth proper Q-scheme X admitting, for every prime p, a smooth proper Z_p-scheme model of X over Q_p has `h^(i,j)(X)=0` for i≠j and i+j≤3 (Fontaine, preprint 91-02, Theorem 1 and Remark (a), printed p. 3, PDF p. 4). The K3 application uses h²(O)=1 and the projective local scheme models of §3.11.

These six Part II contracts specify the required general extensions and their exact consumers. They do not assert that the base roadmaps contain those sections.

## How to read the build

Layer 0 identifies the surface and its numerical lattice. Layer 1 develops the linear systems, local coverings and exceptional configurations. Layer 2 treats families and descent. Layer 3 proves numerical constancy and point counts before comparing canonical covers; its four-twist argument yields full Picard constancy over ℤ. Layer 4 compares Enriques fibrations with rational Jacobians, Layer 5 enumerates and reduces the possibilities, and Layers 6–7 perform the two lattice and incidence eliminations. Layer 8 combines the independent lifting obstruction with the finite-field and integral endpoints. The exhaustive rational-Jacobian theorem and the three additional configuration exclusions are separate proof obligations; every argument using the residual eight-case list depends on both. The arithmetic matrix and incidence calculations assert no geometric realizability.

## Layer 0: geometric Enriques surfaces and their numerical lattice

Separate the defining conjunction from the classification consequences. In particular neither Picard rank nor perfectness of the numerical pairing is a field in the surface definition.


### 0.2 Numerically trivial Picard group of an Enriques surface

k is algebraically closed; Y/k is a geometric Enriques surface.

In characteristic two, prove that Pic^τ(Y) has scheme length two. Its geometric rational-point group is generated by the class of ω_Y; scheme length is not replaced by the number of rational points.

Apply the Enriques classification input; compare the finite subgroup with the numerical Picard quotient. The connected cases have one geometric point and still length two. ([SCH23](#references), §4, p. 12)

**Checks.**

- μ₂ and α₂ in characteristic two each have length two and one geometric point.

*Needs:* WeilConjectures WC.7 (`IsEnriques`); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 0.3 Enriques numerical and cohomological invariants

k is algebraically closed; Y/k is a geometric Enriques surface.

In characteristic two, prove h¹(O_Y)=h²(O_Y)≤1. The numerical rank and étale invariants used here are the WeilConjectures WC.7 inputs listed under Scope and ownership.

Use Picard finiteness, coherent duality and the geometric Enriques classification; request the cycle-class rank comparison and ℓ-independent Betti package. These are geometric invariants, not data assumed in a surface record. ([SCH23](#references), §4, p. 12)

*Needs:* WeilConjectures WC.7 (`IsEnriques`); [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); SchemeAndStackFoundations, §§2.6 and 2.20; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22; WeilConjectures, WC.7; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 0.4 The Enriques numerical lattice

k is algebraically closed; Y/k is a geometric Enriques surface.

Extend the numerical-lattice comparison to characteristic two: the intersection pairing on geometric Num(Y) is even, unimodular and has signature (1,9). As an integral lattice it is isometric to U⊕E₈(−1), where U has off-diagonal entries one and diagonal entries zero.

In characteristic two descend divisor intersection through Pic^τ and prove freeness, evenness, integral perfectness and Hodge-index signature on Num(Y); combine this with EnriquesSurfaces E1b–E1e in the other characteristics. The identification with U ⊕ E₈(−1) then follows from the classification contract under Exact supplier contracts. In particular perfectness is a geometric theorem, not a consequence of the rank alone. ([SCH23](#references), §4, p. 12)

*Needs:* [0.3](#03-enriques-numerical-and-cohomological-invariants); SchemeAndStackFoundations, §§5.9–5.10; IntegralLattices, Layer 6, milestone 6A (indefinite classification); `TauCeti.IntegralLattice`; `TauCeti.IntegralLattice.hyperbolicPlane`; `TauCeti.IntegralLattice.d8PlusLattice`; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### Examples

Over an algebraically closed field of characteristic two, the schemes μ₂ and α₂ each have coordinate algebra of dimension two and only one geometric point. Thus the Picard-length conclusion is compatible with a connected Picard scheme. Replacing length by the number of geometric points would incorrectly exclude ordinary and supersingular Enriques surfaces.

For the intersection convention, let e,f be the U basis. Then e²=f²=0, e·f=1 and (e+f)²=2. A rational nodal curve instead has square −2. These computations fix both the sign of the root-lattice summand and the distinction between a primitive isotropic half-fibre and a positive-square divisor. The signature comparison uses an indefinite rank-ten lattice, so the definite rank-sixteen counterexamples to uniqueness of even unimodular lattices are irrelevant.

### Dependencies

Surface intersection, duality and Riemann–Roch from SchemeAndStackFoundations §§2.6, 2.20 and 5.9–5.10; Enriques geometric invariant arguments; the rank-two group interface R07.1; and the indefinite lattice classification contract under Exact supplier contracts.

## Layer 1: half-fibres, canonical coverings and exceptionality

Construct the objects on the surface and prove the linear-system and exceptional-fibration results before using partner fibrations. Keep square-zero two-sections alongside rational two-sections.

### 1.1 Half-fibre

k is any field; Y/k is geometrically Enriques and φ:Y→P¹_k is a genus-one fibration. A stated half-fibre lies over a k-rational point.

For a genus-one fibration φ:Y→P¹_k on an Enriques surface, a half-fibre is an effective Cartier divisor F on Y together with a k-rational base point a and equality 2F=φ*([a]) as divisors. F retains its component multiplicities; it is not defined as the reduced support.

Use the supplier fibre divisor and effective Cartier operations. Over k̄ obtain half-fibres from the multiplicity-two theorem; construct base change on the equality. ([SCH23](#references), §4, p. 12)

Its API consists of the following facts.

- Data (F,a) with F effective Cartier, a rational, and 2F the scheme fibre.

- Extend F and a along any field extension, preserving twice-the-divisor equality.

- Its intersection square is zero.

- D·φ*([a])=2(D·F) for every Cartier divisor D.

- Two half-fibre data for the same fibration are equal when their effective Cartier divisors and rational base points agree; equality witnesses do not affect the data.

- Twice the half-fibre divisor is exactly the pulled-back rational-point divisor.

**Checks.**

- For a smooth double fibre 2E, the half-fibre E has square zero; the candidate 2E fails because twice that candidate is 4E rather than 2E.

- For a double IV* fibre, the primitive central coefficient is 3 and the full-fibre coefficient is 6. Twice the reduced support has central coefficient 2 and cannot be the full fibre.

- The zero divisor fails: twice zero is zero, while the fibre over the rational base point is nonzero, with coefficient 2 on a component of a smooth double fibre.

*Needs:* WeilConjectures WC.7 (`IsEnriques`); SchemeAndStackFoundations, §§5.9–5.10; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 1.2 (−2)-curve and two-section on an Enriques surface

k is any field; Y/k is geometrically Enriques and φ:Y→P¹_k is a genus-one fibration. A stated half-fibre lies over a k-rational point.

A geometric (−2)-curve is an integral curve of square −2 on an Enriques surface; adjunction makes it smooth rational. Over k the term means a curve whose geometric base change is such a curve. A two-section is an integral horizontal curve R with degree two over the fibration base, equivalently R·(full fibre)=2 or R·F=1. It can have square zero, so it need not be rational.

Use adjunction for K numerically zero to prove the rationality assertion. Relate degree to the full Cartier fibre and then to its half-fibre. Keep geometric integrality in the k-form. ([SCH23](#references), Proposition 4.1, p. 12; Proposition 4.4(ii), p. 13; Theorem 5.6(iii), p. 17)

Its API consists of the following facts.

- Geometric integrality and geometric self-intersection −2 on an Enriques surface.

- Integral curve with degree two over P¹; equivalent to intersection two with a full fibre.

- A two-section meets a half-fibre with degree one.

- The geometric curve condition is preserved and reflected by field extension.

- For an integral horizontal curve, degree two is equivalent to full-fibre intersection two, and to half-fibre intersection one when a half-fibre is given.

**Checks.**

- An integral geometric square −2 curve is a smooth P¹ by adjunction.

- An integral half-fibre of a partner fibration is a two-section with square zero; the rational-curve predicate rejects it.

- Degree two against 2F means degree one against F, not degree two against F.

- A k-curve whose base change to k̄ is the union of two conjugate (−2)-curves meeting transversally in one point is integral over k and has square −2−2+2=−2, but it is not geometrically integral, so it is not a (−2)-curve over k; a definition that checks integrality only over k would accept it.

- An integral horizontal curve R with R·F=2 has R·(2F)=4, so it is a four-section and fails IsTwoSection; a definition that tests R·F≥1 instead of R·(2F)=2 would accept it.

*Needs:* WeilConjectures WC.7 (`IsEnriques`); [1.1](#11-half-fibre); SchemeAndStackFoundations, §§5.9–5.10.

### 1.3 Curves of canonical type on an Enriques surface induce genus-one fibrations

k is algebraically closed; Y/k is a geometric Enriques surface.

An indecomposable effective curve of canonical type on a geometric Enriques surface determines a unique genus-one fibration, up to base isomorphism, in which it is either a full fibre or a half-fibre.

Import the generic canonical-type condition and negative-semidefinite intersection kernel. Prove the Enriques linear-system theorem, including possible doubling and uniqueness, from the Enriques surface prerequisites. This is the geometry behind every later graph-generated fibration. ([SCH23](#references), §4, p. 12, sentence before Proposition 4.1 (BM1977, Theorem 3 and Proposition 11; Cossec–Dolgachev 1989, Chapter III); §4, p. 12; used in the proofs of Propositions 11.2–14.1, pp. 34–49; [MMV22](#references), §2.1, Lemmas 2.1–2.4, pp. 3–4)

*Needs:* WeilConjectures WC.7 (`IsEnriques`); [1.1](#11-half-fibre); SchemeAndStackFoundations, §§5.9–5.10.

### 1.4 Nef primitive isotropic half-fibres

k is algebraically closed; Y/k is a geometric Enriques surface. D is nonzero and effective.

A nonzero effective divisor D on a geometric Enriques surface is a half-fibre of a genus-one fibration if and only if D is nef, its class in Num(Y) is primitive, and D²=0.

Use the Enriques linear-system theorem for a nef primitive isotropic divisor to construct the pencil |2D|. Conversely a half-fibre has square zero, is nef and primitive. MMV22 quotes this criterion from the Enriques-surface literature without proof; a complete proof is part of this target. ([MMV22](#references), §2.1, Lemma 2.1, p. 3)

*Needs:* [1.1](#11-half-fibre); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); SchemeAndStackFoundations, §§5.9–5.10.

### 1.5 Nef reduction by nodal reflections

k is algebraically closed; Y/k is a geometric Enriques surface. D is an effective divisor with nonnegative square.

Extend nodal reflection reduction to characteristic two: if D is effective with D²≥0 on a geometric Enriques surface in that characteristic, there are a nef divisor D′ and nonnegative integers a_i with D linearly equivalent to D′+Σa_iR_i for (−2)-curves R_i. The nef representative in the nodal Weyl orbit is unique and D′²=D².

Combine the characteristic-two theorem with EnriquesSurfaces E1f in other characteristics. Reflect in a nodal class with negative intersection, extracting a nonnegative effective nodal multiple. Use termination of the reflection process and uniqueness of the nef representative in the nodal Weyl orbit, not only the abstract signature. MMV22 quotes the result without proof; a complete proof is part of this target. ([MMV22](#references), §2.1, Lemma 2.3, p. 4)

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); SchemeAndStackFoundations, §§5.9–5.10; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 1.6 Existence of genus-one fibrations

k is algebraically closed; Y/k is a geometric Enriques surface.

In characteristic two, prove that every Enriques surface over an algebraically closed field has a genus-one fibration to P¹.

Together with EnriquesSurfaces E1f this gives existence in every characteristic. Use the numerical U⊕E₈(−1) lattice to find an effective nef primitive isotropic class by Riemann–Roch and reflections; apply the half-fibre linear-system theorem. The reflection/effectivity theorem is a separate geometric proof obligation, not a consequence of abstract lattice isometry alone. ([SCH23](#references), Proposition 4.1, p. 12; [MMV22](#references), §2.1, Lemmas 2.1–2.4, pp. 3–4)

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [1.4](#14-nef-primitive-isotropic-half-fibres); [1.5](#15-nef-reduction-by-nodal-reflections); SchemeAndStackFoundations, §§5.9–5.10; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 1.7 Double fibres

k is algebraically closed; Y/k is a geometric Enriques surface.

Each geometric Enriques genus-one fibration has a multiple fibre; every such scheme fibre has multiplicity exactly two.

Apply the Enriques genus-one canonical-bundle and linear-system theory. Multiplicity refers to the gcd of the scheme fibre coefficients; the underlying indecomposable divisor may be nonreduced. ([SCH23](#references), Proposition 4.1, p. 12)

*Needs:* [1.6](#16-existence-of-genus-one-fibrations); [1.1](#11-half-fibre).

### 1.8 Integral two-sections

k is algebraically closed; Y/k is a geometric Enriques surface.

A geometric Enriques genus-one fibration admits an integral two-section of square −2 or zero; it can be chosen as a (−2)-curve or as a half-fibre of another fibration.

Use the general existence assertion of SCH23 Proposition 4.1: the integral degree-two curve can be chosen rational or as a partner half-fibre. Prove the required classical Enriques linear-system and reducibility result. It does not follow from the narrower, generic-Pic⁰-order-two contract, which is used only for Layer 6 coset preservation. ([SCH23](#references), Proposition 4.1, p. 12; [MMV22](#references), §2.1, Lemmas 2.1–2.4, pp. 3–4)

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [1.4](#14-nef-primitive-isotropic-half-fibres); [1.5](#15-nef-reduction-by-nodal-reflections).

### 1.9 Classical Enriques criteria

k is algebraically closed; Y/k is a geometric Enriques surface.

For geometric Enriques Y, the following conditions are equivalent: ω_Y has exact order two; H¹(O_Y)=0; some genus-one fibration has no wild fibre; some genus-one fibration has two distinct multiple fibres.

Use Pic^τ length two and the Enriques canonical bundle formula. Prove both existential implications rather than replacing them with universal claims; the universal consequence is the next target. ([SCH23](#references), Proposition 4.2, p. 12)

*Needs:* [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.7](#17-double-fibres).

### 1.10 Tame double fibres and canonical bundle

k is algebraically closed; Y/k is a geometric Enriques surface. The canonical-bundle formula assumes ω_Y has exact order two.

When the classical criteria hold, every genus-one fibration has precisely two tame double fibres 2F₁ and 2F₂, and ω_Y≅O(F₁−F₂).

Apply the genus-one canonical bundle formula to the two tame multiplicities and compare Pic^τ points with ω_Y. The characteristic-two ordinary case is distinguished by its local Picard torsion. ([SCH23](#references), Proposition 4.2, p. 12)

*Needs:* [1.9](#19-classical-enriques-criteria); [1.1](#11-half-fibre); EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 1.11 Characteristic-two tame half-fibre types

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. φ is a genus-one fibration with two distinct double fibres.

In characteristic two, if an Enriques genus-one fibration has two distinct double fibres, each half-fibre is ordinary smooth elliptic or singular additive. A supersingular smooth elliptic or semistable half-fibre is excluded.

Use the normal bundle of a tame half-fibre: it is a nontrivial line bundle of order two in its Pic⁰. Compare the ordinary, supersingular and multiplicative Pic⁰ group schemes. ([SCH23](#references), Lemma 4.3, pp. 12–13)

*Needs:* [1.10](#110-tame-double-fibres-and-canonical-bundle); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 1.12 Ordinary Enriques surfaces

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For a geometric Enriques surface in characteristic two, the ordinary type is defined by Pic^τ≅μ₂. Its canonical-cover group is (Z/2), and its canonical bundle is trivial. The type condition and these consequences are kept separate.

Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual; the canonical-bundle assertion follows from the canonical generator of Pic^τ(k) in §0.2. Fundamental groups are computed separately in §3.10a. ([SCH23](#references), §4, p. 13)

Its API consists of the following facts.

- The Pic^τ-isomorphism condition μ₂ in characteristic two.

- The Cartier dual of its Pic^τ is (Z/2).

- The geometric type is invariant under field extension.

**Checks.**

- On k[ε]/ε² the coproduct Δε=ε⊗1+1⊗ε+ε⊗ε gives μ₂. Omitting ε⊗ε gives α₂ and fails the ordinary condition despite the identical underlying ring.

- The other two length-two group schemes fail the ordinary predicate.

- Dualizing μ₂ gives (Z/2); swapping Pic^τ with its dual fails this test except for α₂.

*Needs:* [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.9](#19-classical-enriques-criteria); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 1.13 Classical Enriques surfaces

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For a geometric Enriques surface in characteristic two, the classical type is defined by Pic^τ≅(Z/2). Its canonical-cover group is μ₂, and its canonical bundle is of exact order two. The type condition and these consequences are kept separate.

Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual; the canonical-bundle assertion follows from the canonical generator of Pic^τ(k) in §0.2. Fundamental groups are computed separately in §3.10a. ([SCH23](#references), §4, p. 13)

Its API consists of the following facts.

- The Pic^τ-isomorphism condition (Z/2) in characteristic two.

- The Cartier dual of its Pic^τ is μ₂.

- The geometric type is invariant under field extension.

**Checks.**

- The reduced algebra k×k has two geometric points and zero tangent space at the identity; k[ε]/ε² has one geometric point and tangent dimension one and cannot model the classical type.

- The other two length-two group schemes fail the classical predicate.

- Dualizing (Z/2) gives μ₂; swapping Pic^τ with its dual fails this test except for α₂.

*Needs:* [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.9](#19-classical-enriques-criteria); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 1.14 Supersingular Enriques surfaces

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For a geometric Enriques surface in characteristic two, the supersingular type is defined by Pic^τ≅α₂. Its canonical-cover group is α₂, and its canonical bundle is trivial. The type condition and these consequences are kept separate.

Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual; the canonical-bundle assertion follows from the canonical generator of Pic^τ(k) in §0.2. Fundamental groups are computed separately in §3.10a. ([SCH23](#references), §4, p. 13)

Its API consists of the following facts.

- The Pic^τ-isomorphism condition α₂ in characteristic two.

- The Cartier dual of its Pic^τ is α₂.

- The geometric type is invariant under field extension.

**Checks.**

- The primitive coproduct Δε=ε⊗1+1⊗ε on k[ε]/ε² gives α₂. Adding ε⊗ε gives μ₂ and fails the supersingular condition.

- The other two length-two group schemes fail the supersingular predicate.

- The Cartier dual of α₂ is α₂, whereas neither the dual of μ₂ nor the dual of ℤ/2 is α₂. This check complements the distinct ordinary and classical duality checks.

*Needs:* [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.9](#19-classical-enriques-criteria); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 1.15 K3-like canonical covering

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is classical or supersingular, so its canonical-cover group is local. The normalization is taken on the integral canonical torsor.

For classical or supersingular geometric Enriques Y in characteristic two, its K3-like cover is the nontrivial torsor X→Y under (Pic^τ)^D corresponding to Pic^τ↪Pic. The map is finite flat of degree two and a universal homeomorphism. This term does not assert that X is a smooth K3 surface.

Use the Picard–torsor correspondence for finite flat Cartier duals. Nontriviality follows from the nonzero inclusion; the local group makes the map radicial. Verify integrality and Cohen–Macaulay/Gorenstein properties before normalization. ([SCH23](#references), §4, p. 13)

Its API consists of the following facts.

- The canonical local torsor attached to Pic^τ↪Pic.

- The torsor and its canonical Picard section commute with field extension.

- It is finite flat of rank two.

- Its finite flat morphism is a universal homeomorphism.

**Checks.**

- Classical Pic^τ=Z/2 gives a μ₂-cover, not an étale Z/2-cover.

- Supersingular Pic^τ=α₂ gives an α₂-cover.

- The ordinary canonical cover is étale and is excluded from the K3-like local construction.

*Needs:* [1.13](#113-classical-enriques-surfaces); [1.14](#114-supersingular-enriques-surfaces); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22.

### 1.16 Cohomology of the K3-like cover

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is classical or supersingular, so its canonical-cover group is local. The normalization is taken on the integral canonical torsor.

The local K3-like cover X has h⁰(O_X)=h²(O_X)=1 and h¹(O_X)=0, trivial dualizing sheaf, and a nonempty singular locus.

Compute the pushforward rank-two algebra and its Euler characteristic; use Gorenstein duality to obtain the cohomology. Prove singularity for the classical/supersingular types, while keeping the ordinary étale case outside the statement. ([SCH23](#references), §4, p. 13)

*Needs:* [1.15](#115-k3-like-canonical-covering); SchemeAndStackFoundations, §§2.6 and 2.20.

### 1.17 Conductrix and exceptionality

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is classical or supersingular, so its canonical-cover group is local. The normalization is taken on the integral canonical torsor.

Normalize the integral K3-like cover X to X′. The map X′→Y is finite flat purely inseparable of degree two, and the conductor ideal of X′→X is O_X′(−R′) with R′ the pullback of an effective Cartier divisor C on Y. C is the conductrix and 2C the biconductrix. A classical or supersingular characteristic-two Enriques surface is exceptional exactly when H¹ of the structure sheaf of 2C is nonzero; ordinary surfaces are nonexceptional by this convention. Section 3.10a identifies these two types with the simply connected types.

Apply ESB Lemma 2.3 to the two finite flat degree-two algebras, then verify that normalization meets its hypotheses. Uniqueness of the descended conductor divisor gives C. Define exceptionality by the cohomology of the actual doubled Cartier subscheme. ([SCH23](#references), §4, p. 13; [ESB21](#references), §2, conductor construction and Lemma 2.3, pp. 4–5)

Its API consists of the following facts.

- The unique effective Cartier divisor whose pullback is the normalization conductor divisor.

- The conductor ideal is the pullback of O_Y(−C).

- The effective divisor 2C with its Cartier scheme structure.

- Classical or supersingular characteristic-two Enriques and H¹ of the Cartier subscheme 2C nonzero; false for ordinary type.

- Equality of the pulled-back normalization conductor ideals implies equality of the effective conductrix divisors by faithful flatness.

- The Cartier biconductrix divisor is twice the conductrix, including its scheme multiplicities.

**Checks for the conductrix.**

- For an ordinary surface the canonical cover is normal and étale, so its conductor is the unit ideal and C=0; it is outside the local-cover construction (ESB21, Proposition 2.7).
- At a generic point where C has multiplicity m, its ideal has order m; replacing C by 2C would give order 2m in the pulled-back normalization conductor and fails its defining equality for m>0.
- On an exceptional T₂,₃,₇ surface C is nonzero with C²=−2 and reduced support a rational tree; a zero-divisor model fails the square (ESB21, Theorem 1.1 and Proposition 2.8(3)).

**Checks for the biconductrix.**

- C=0 gives 2C=0 and the empty Cartier subscheme, with H¹=0.
- At a smooth point of C of multiplicity one, 2C has local equation t²=0; replacing it by its reduction t=0 deletes the nonzero nilpotent class of t.
- On an exceptional T₂,₃,₇ surface H¹(O_(2C))≠0, whereas the rational tree C_red has H¹(O_(C_red))=0. For C=0 both groups vanish (ESB21, Theorem 1.1, existence discussion on p. 2, and Proposition 2.8(3)).

**Checks for exceptionality.**

- For an exceptional classical T₂,₃,₇ surface, h¹(O_(2C))=1 and h⁰(O_(2C))=5, while h⁰(Y,O_Y(2C))=1. Indeed (2C)²=−8 gives χ(O_(2C))=4; the differential sequence of §1.17a, vector-field criterion and duality give h¹=1. Substituting surface line-bundle cohomology changes the object.
- C=0 gives the empty subscheme and h¹=0, so the predicate fails even in a local-cover type.
- Replacing the exceptional doubled conductrix by its reduced rational tree gives h¹=0 and incorrectly rejects that exceptional surface (ESB21, Proposition 2.8(3),(6), pp. 6–7).

*Needs:* [1.15](#115-k3-like-canonical-covering); [1.16](#116-cohomology-of-the-k3-like-cover); SchemeAndStackFoundations, §§1.3–1.9 and 4.1; SchemeAndStackFoundations, §§2.6 and 2.20.

### 1.17a The conductrix differential sequence

Let Y be a classical or supersingular geometric Enriques surface in characteristic two, with conductrix C. Construct the saturated injection O_Y(2C)→Ω¹_Y and a finite subscheme W⊂Y with exact sequence `0→O_Y(2C)→Ω¹_Y→I_W⊗ω_Y(−2C)→0`. Its dual is `0→ω_Y(2C)→Θ_Y→I_W(−2C)→0`. Prove h⁰(Y,Ω¹_Y)=1 and, when C≠0, h⁰(Y,O_Y(2C))=1 (ESB21, Lemma 2.4 and equation (2.5), p. 5, ESB21 lines 163–178; proof of Proposition 2.8(2), p. 6, ESB21 lines 219–221).

Derive the map from the normalization’s factorization of Frobenius: locally a section f of the normalization algebra maps to d(f²) on Y. Normality gives saturation, and the determinant of Ω¹_Y identifies the quotient, including the ideal of the finite subscheme. Prove the one-form dimension for these two local-cover types as part of this target, using the canonical-cover differential calculation. For C≠0, compute Chern classes and use this one-form dimension to obtain the section assertion. The sheaf sequence concerns Y; it does not identify O_Y(2C) with the structure sheaf of the doubled subscheme.

The interface has these properties.

- The injection has source O_Y(2C), target Ω¹_Y and torsion-free rank-one quotient I_W⊗ω_Y(−2C); the ideal I_W has zero-dimensional support quotient.
- Dualizing gives the displayed tangent sequence, with the same finite subscheme W.
- The one-form space has dimension one (ESB21 line 220; DI21 line 1051); for C≠0 the surface line bundle O_Y(2C) also has exactly one independent global section.

**Checks.**

- At a multiplicity-one component of C, the saturated source has divisor coefficient 2; using O_Y(C) gives coefficient 1 and misses the Frobenius square.
- For C≠0, C²=−2 gives (2C)²=−8 and length(W)=12−8=4; replacing I_W by O_Y would give length zero and violate the Chern-class equality length(W)−(2C)²=12.
- On an exceptional classical surface, the dual sequence has h⁰(ω_Y(2C))=h⁰(Θ_Y)=1 since H⁰(I_W(−2C))=0, and h⁰(O_Y(2C))=1. For C=0, the positivity required in §8.3 instead has value C·H=0, so this sequence alone supplies no lifting obstruction.

*Needs:* §1.17 for the normalized canonical cover and conductrix; §0.3 for coherent invariants; SchemeAndStackFoundations §0.29 for scheme Frobenius, §2.20 for duality and §5.10 for Chern classes and Noether’s formula; Mathlib `KaehlerDifferential` in `Mathlib/RingTheory/Kaehler/Basic.lean` for the local construction.

### 1.18 Special double-fibre characterization of exceptionality

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

In characteristic two a geometric Enriques surface is exceptional if and only if it has a genus-one fibration with a rational (−2)-curve two-section and a double fibre whose indecomposable divisor has type IV*, III* or II*.

Use ESB Theorem 4.2, including both directions: classify the conductrix possibilities to construct a special fibration; conversely use the conductrix foliation and intersections in the special double fibre. The conductrix classification on which that proof rests is part of this target. ([ESB21](#references), §4, Theorem 4.2 and proof, pp. 13–14)

*Needs:* [1.17](#117-conductrix-and-exceptionality); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations).

### 1.19 Nonexceptional quasielliptic restriction

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is nonexceptional; the quasielliptic assertion assumes φ quasielliptic, and the multiple-special assertion assumes a rational (−2)-curve two-section.

On a nonexceptional geometric Enriques surface in characteristic two, a quasielliptic fibration cannot have a III* or II* fibre, whether simple or double.

Take the contrapositive of ESB Proposition 3.16, whose proof on pp. 12–13 uses the quasielliptic conductrix and fibre classification. Match affine E₇/E₈ with III*/II* for both multiplicities; the quasielliptic conductrix and fibre classification used there are part of this target. ([SCH23](#references), Proposition 4.4(i), p. 13; [ESB21](#references), §1, Theorems 1.1–1.3, pp. 1–3; [ESB21](#references), §3, Proposition 3.16 and proof, pp. 12–13)

**Checks.**

- A simple quasielliptic III* or II* fibre implies exceptionality and is forbidden here.

- A double quasielliptic III* or II* fibre also implies exceptionality and is forbidden here.

- The assertion does not exclude a III* fibre in an elliptic fibration solely from its symbol; §1.20 separately retains specialness for its general genus-one statement.

*Needs:* [1.17](#117-conductrix-and-exceptionality).

### 1.20 Nonexceptional multiple exceptional-type restriction

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is nonexceptional; the quasielliptic assertion assumes φ quasielliptic, and the multiple-special assertion assumes a rational (−2)-curve two-section.

On a nonexceptional geometric Enriques surface in characteristic two, a multiple IV*, III* or II* fibre cannot occur in a fibration that has a (−2)-curve as a two-section.

Apply the contrapositive of ESB Theorem 1.1(3), matching its special bisection definition with the integral two-section degree. A square-zero two-section does not make a fibration special. ([SCH23](#references), Proposition 4.4(ii), p. 13; [ESB21](#references), §1, Theorems 1.1–1.3, pp. 1–3)

*Needs:* [1.17](#117-conductrix-and-exceptionality); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [1.18](#118-special-double-fibre-characterization-of-exceptionality).

### 1.21 The extra-special affine E₈ type

k is algebraically closed; Y/k is a geometric Enriques surface.

An extra-special geometric Enriques surface of affine E₈ type has the dual intersection graph of ALL its (−2)-curves isomorphic to the ten-vertex tree T₂,₃,₇: one trivalent vertex and arms of edge lengths 1,2,6, every edge intersection one. A contained subgraph alone does not define the predicate. This is the unique extra-special type needed for the half-fibre partner exception.

Use the actual collection of geometric (−2)-curves and intersection numbers from Layer 1, rather than an arbitrary graph supplied as surface data. Define graph isomorphism to the finite explicit tree; prove isomorphism and algebraically closed field-extension invariance. Its characteristic-two-only and unique-fibration properties are the separate general-partner contract. ([MMV22](#references), §1, Definition 1.1, p. 1, first ten-vertex diagram)

Its API consists of the following facts.

- The entire dual intersection graph of geometric (−2)-curves is the ten-vertex T₂,₃,₇ tree.

- A geometric surface isomorphism preserves and reflects the predicate.

- There are exactly ten (−2)-curves.

- The entire curve graph has no cycle, so no I_n cycle can be realized by its (−2)-curves.

**Checks.**

- The trivalent tree with arm lengths 1,2,6 has 1+1+2+6=10 vertices and nine edges; replacing the long arm by length five gives nine vertices and fails the predicate.

- A T₂,₃,₇ subgraph together with one additional (−2)-curve has eleven vertices and fails the entire-graph condition.

- A connected ten-vertex graph with ten edges has cycle rank one, whereas T₂,₃,₇ has cycle rank zero; it fails the tree-isomorphism condition.

*Needs:* [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); SchemeAndStackFoundations, §§5.9–5.10.

### 1.22 Extra-special E₈ surfaces are exceptional

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. The entire (−2)-curve graph is T₂,₃,₇.

A geometric extra-special Enriques surface of affine E₈ type is exceptional in characteristic two.

The whole-graph condition in particular gives the contained T₂,₃,₇ configuration. Apply ESB Corollary 4.3. No claim that every contained graph determines the entire extra-special predicate is needed. ([ESB21](#references), §4, Corollary 4.3 and proof, p. 14)

*Needs:* [1.21](#121-the-extra-special-affine-e-type); [1.17](#117-conductrix-and-exceptionality); [1.18](#118-special-double-fibre-characterization-of-exceptionality).

### 1.23 Every half-fibre has a partner (Cossec–Dolgachev)

k is algebraically closed; Y/k is a geometric Enriques surface.

For an Enriques surface over any algebraically closed field, every half-fibre F has another half-fibre F′ with F·F′=1 unless the surface is extra-special of affine E₈ type. Such extra-special surfaces occur only in characteristic two and have just one genus-one fibration.

Use the extension theorem stated in MMV22 Theorem 1.2, together with its unique-fibration and characteristic-two exception in Remark 1.5. The foundational proof is Cossec–Dolgachev III.3.4.1, or the corresponding CDL2021, Theorem 6.1.10 (2021 draft). A proof here follows that argument or proves the extension theorem independently; MMV22 states the theorem without proof. ([SCH23](#references), proof of Proposition 4.4(iii), p. 13, citing Cossec–Dolgachev 1989, Theorem 3.4.1; [MMV22](#references), §1, Theorem 1.2 and Remarks 1.4–1.5, pp. 1–2)

*Needs:* [1.1](#11-half-fibre); [0.4](#04-the-enriques-numerical-lattice); [1.21](#121-the-extra-special-affine-e-type).

### 1.24 Partner genus-one fibration

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Y is nonexceptional; φ is any genus-one fibration.

For each genus-one fibration on a nonexceptional geometric characteristic-two Enriques surface there is another with intersection of full fibre classes equal to four.

By [1.22](#122-extra-special-e-surfaces-are-exceptional), nonexceptionality excludes the affine E₈ exception in the characteristic-independent half-fibre partner theorem. Apply that theorem and double both half-fibre classes to obtain full-fibre intersection four. ([SCH23](#references), Proposition 4.4(iii), p. 13; [ESB21](#references), §1, Theorems 1.1–1.3, pp. 1–3)

*Needs:* [1.23](#123-every-half-fibre-has-a-partner-cossecdolgachev); [1.17](#117-conductrix-and-exceptionality); [1.1](#11-half-fibre); [1.22](#122-extra-special-e-surfaces-are-exceptional).

### 1.25 Intersection of distinct genus-one fibrations

k is algebraically closed; Y/k is a geometric Enriques surface. The two fibrations are distinct up to base isomorphism.

If F and F′ are half-fibres of distinct genus-one fibrations on a geometric Enriques surface, then F·F′≥1 and (2F)·(2F′)≥4. Equality of the full-fibre intersection to four is equivalent to F·F′=1.

Nef isotropic classes lie in the same closed positive cone. If their intersection is zero, the signature-(1,9) form makes them proportional; primitivity makes their numerical classes equal. Pic^τ is killed by two, so 2F and 2F′ are linearly equivalent and define the same genus-one pencil, a contradiction. Integral intersection then is at least one. ([MMV22](#references), §2.1, Lemma 2.1, p. 3; [SCH23](#references), proof of Proposition 13.2, p. 47, last displayed inequality)

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.4](#14-nef-primitive-isotropic-half-fibres); SchemeAndStackFoundations, §§5.9–5.10.

### 1.26 Enriques reducibility and its two-section application

For every geometric Enriques Y and effective divisor D with D²>0, prove that D is linearly equivalent to D₁+D₂ with nonzero effective Dᵢ and Dᵢ²≥0 (Lang1983, Theorem 4.1, printed p. 62; Lang1983 line 757). No classical or generic-Pic⁰-order hypothesis is imposed.

Define `enriquesNumericalLattice` as the native orthogonal sum of the hyperbolic plane and the negated spinor-glue E₈ lattice. For h,d in this integral carrier L=U⊕E₈(−1), with h²>0, d²>0 and d·h>0, prove `positive_cone_decomposition`: d=d₁+d₂ with nonzero integral dᵢ, dᵢ²≥0 and dᵢ·h>0 (Lang1983, Theorem 4.2, printed p. 62; Lang1983 line 760). The numerical theorem is independent of any chosen fibration. The model uses the native integral pairing, rather than the entire rational ambient space.

Its API consists of the following facts.

- The pairing is the orthogonal sum U⊕E₈(−1); negation changes the form, preserving the E₈ carrier.
- The carrier is integral of rank ten, and contains the two primitive isotropic U basis vectors.
- The theorem supplies both summands in that carrier and in the same positive-cone closure as h.

**Checks for the native model.**

- For the U basis e,f, e²=f²=0 and e·f=1, so (e+f)²=2; a positive-definite replacement has no such isotropic basis.
- An E₈ root r has r²=−2, while (e+f)·r=0. Omitting negation would give +2.
- The ambient vector e/2 is outside the carrier: its U coordinate 1/2 is not integral; adding a rational ambient summand would admit it.

**Checks for general reducibility.**

- In U, take h=d=e+f. Then h²=d²=2, d·h=2, and d₁=e,d₂=f have square zero and dᵢ·h=1.
- With an E₈ root r of square −2 orthogonal to U, h=e+f and d=2e+f+r have squares 2 and 2 and pairing 3. The split d₁=e, d₂=e+f+r has squares 0,0 and pairings 1,2 with h, so it tests the negative E₈ summand as well.
- D=0 has D²=0 and is outside the positive-square theorem; it cannot be a sum of two nonzero effective divisors.
- With h=e+f and d=−e−f, d²=2 but d·h=−2. It cannot split into two classes each pairing positively with h, so the positive-cone hypothesis is necessary.

The two-section application has the following additional hypotheses.

Let k be algebraically closed, let Y/k be classical Enriques, and let φ be a genus-one fibration whose generic degree-zero Picard group has order two. Given an integral two-section T and the nonzero class N in that group, prove that N ⊗ O(T_K) has a representative arising from an integral two-section R̃ with R̃² equal to zero or −2, allowing only vertical or half-fibre adjustments that preserve this generic class.

The pencil has index two: a K-point would extend to a section, contradicting `R·(2F)=1`. Riemann–Roch on the regular generic genus-one curve gives an effective degree-two divisor in N⊗O(T_K); since no degree-one point exists, it is a single degree-two closed point. Its closure is an integral two-section. Choose one of minimum self-intersection in that generic line-bundle class; adjunction bounds the even square below by −2. If its square is positive, the general reducibility theorem writes its class as D₁+D₂ with effective nonzero Dᵢ of nonnegative square. Exactly one Dᵢ is horizontal, because every horizontal degree is a positive even integer. The other is vertical with square zero and hence a nonzero sum of fibre divisors up to rational multiples; it has positive intersection with the two-section. Thus the horizontal summand has strictly smaller square. Write it R′+V with R′ its unique degree-two horizontal component and V vertical. It has nonnegative intersection with every vertical component, because it is linearly equivalent to the original horizontal curve minus a fibre-numerical divisor. Hence `(R′+V)²−R′² = R′·V+(R′+V)·V ≥ 0`, so R′² is smaller still. All discarded divisors are vertical and restrict trivially to the generic curve: R′ represents the same N⊗O(T_K), contradicting minimality. The remaining squares are zero and −2. This proves the coset equality in Pic of the generic fibre, not just its numerical degree. ([Lang1983](#references), Theorem 4.1, printed p. 62; [SCH23](#references), proofs of Propositions 12.2–12.3, pp. 42–43.)

**Checks.**

- Both square-zero and square−2 branches survive the construction; preserving the nontrivial coset must be checked explicitly.

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations). The numerical headline uses `IntegralLattice.hyperbolicPlane`, `IntegralLattice.d8PlusLattice`, `IntegralLattice.orthogonalSum` and native form negation. NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 2.2 and 4.7 supplies fibre divisors and generic restriction with vertical kernel; SchemeAndStackFoundations §§2.6, 2.20 and 5.9–5.10 supplies curve Riemann–Roch and adjunction.

### Examples

If F·F′=1 for two half-fibres, then (2F)·(2F′)=4. A claimed full-fibre lower bound of one would mix these two normalizations. A horizontal integral curve R with R·F=1 has degree R·(2F)=2 over the base even if R²=0; the degree condition does not force R to be a nodal rational curve.

Over a nonclosed field, a smooth proper geometrically rational curve may be a nonsplit conic. Its geometric genus and self-intersection do not by themselves produce a rational point. The degree-one line-bundle argument in Layer 2 is what makes the descended nodal curves P¹ in that arithmetic setting.

For classical surfaces in characteristic two, Pic^τ=ℤ/2 and its Cartier dual μ₂ produces a local canonical covering. For ordinary surfaces the two groups are reversed: Pic^τ=μ₂ and the dual ℤ/2-cover is étale. For supersingular surfaces the self-dual α₂ gives the local case. Thus the singular K3-like cover in this layer is not an alternative name for the smooth K3 cover in Layer 3.

### Dependencies

Layer 0; genus-one linear systems, Kodaira geometry and generic restriction from NeronModelsAndSemistableAbelianVarietiesPartII §§2–5; SchemeAndStackFoundations §§2.6, 2.20, 5.9–5.10 and R07.1. The general partner theorem includes the foundational linear-system input cited in MMV22; the local characteristic-two restrictions use ESB21. The precise generic-coset assertion in 1.26 requires its own proof or an exact older-source derivation.

## Layer 2: families, Picard descent and canonical torsors

Work with the full algebraic-space family contract. Cover existence, cover twisting and descent of numerical line-bundle classes have different hypotheses, which are kept separate.

### 2.1 Family of Enriques surfaces

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

An Enriques family over a scheme S is an algebraic space f:Y→S which is flat, proper and finitely presented, with every geometric fibre a geometric Enriques surface. Its isomorphisms and pullbacks form the fppf stack M_Enr. Over an affine S=Spec R this is the integral-family contract; representability by a scheme is a consequence only under additional hypotheses.

Use the general algebraic-space and fppf descent suppliers. Flat finite presentation and smooth geometric fibres imply f is smooth. Check descent of the geometric Enriques condition and the isomorphism groupoid. ([SCH23](#references), §5, p. 14)

Its API consists of the following facts.

- A flat proper finitely presented algebraic-space morphism with geometric Enriques fibres.

- Pull back the space, structure map and geometric fibre proofs along any S′→S.

- An isomorphism over S gives an isomorphism of families; compose and invert these.

- Every Enriques family is smooth from flat finite presentation and geometric smoothness.

**Checks.**

- For a geometric Enriques Y/k, the constant family Y×Spec(k[t]) is an Enriques family; every geometric fibre has b₂=10.
- Restricting this family to Spec(k[t]/(t²)) still satisfies the definition, including on the nonreduced base.
- P² over k[t] is smooth and proper but has geometric b₂=1 and fails the Enriques-family predicate.

*Needs:* WeilConjectures WC.7 (`IsEnriques`); SchemeAndStackFoundations, §§1.3–1.9 and 4.1; SchemeAndStackFoundations, §§2.6 and 2.20; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22.

### 2.2 Relative Picard representability

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

For any Enriques family over S=Spec R, the relative fppf Picard sheaf is a quasi-separated algebraic space locally of finite presentation, with its base-change comparison. Prove O_S→f_*O_Y universally an isomorphism by coherent base change and geometric connectedness (SCH23, Proposition 5.3 and its preceding paragraph, p. 14; SCH23 lines 601–610).

Apply ComplexComparisonPartII C3.2d.2 and AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a. This step uses no flatness of Pic^τ or numerical local system. Over a geometric field, JacobianChallenge Layer D gives the projective-scheme specialization. The scheme-representability conclusion over arbitrary affine bases follows in §2.3 after the relative invariants.

*Needs:* [2.1](#21-family-of-enriques-surfaces); [0.3](#03-enriques-numerical-and-cohomological-invariants); SchemeAndStackFoundations §2.6; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2; JacobianChallenge Layer D for the field specialization.

### 2.3 Relative numerical invariants

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

Prove that relative Pic^τ is an open finite locally free subgroup of rank two, and Num=Pic/Pic^τ is étale locally isomorphic to ℤ¹⁰, with base change for both. Then prove that full Pic is a scheme over any affine S (SCH23, Proposition 5.3, p. 14; EHS12, Proposition 4.2 and Corollary 4.3, printed pp. 31–32, EHS12 lines 1369–1408).

Start with the algebraic space of §2.2. Establish Picard flatness on local Artinian tests with algebraically closed residue field, without assuming full Pic is a scheme: the deformation of Y is a scheme by invariance under nilpotent thickening. In positive characteristic apply gap:picard-flatness-betti with b₁=2(h¹(O)−h²(O))=0 from §0.3 and WeilConjectures WC.7. In characteristic zero h²(O)=0 gives unobstructed Picard deformation. Prove the passage from these tests to arbitrary affine bases by Noetherian approximation and the local flatness criterion. Establish openness of the numerically trivial locus and its properness and finiteness in Enriques families by the torsion argument of EHS12 Corollary 4.3; together with geometric length two this makes Pic^τ finite locally free of rank two. Constant fibre length alone does not give flatness.

Only then apply gap:numerical-contraction-descent to form the étale rank-ten quotient and its base-change comparison. Finally, full Pic→Num is a torsor under finite locally free Pic^τ. Prove scheme representability by the Enriques numerical-component and finite-torsor descent argument of SCH23 Proposition 5.3 and EHS12 Corollary 4.3. This step includes effectivity of that descent for these Picard spaces over arbitrary affine bases; a general algebraic space does not become a scheme merely because it has an étale scheme cover. No scheme premise enters the preceding flatness or quotient arguments.

**Checks.**

- For the constant deformation of a classical surface over R=k[ε]/ε², Pic^τ=(ℤ/2)_R has rank two and k-length four. The connected α₂_R also has k-length four; connectedness does not change rank.
- In characteristic two, R[t]/(t²,εt) with primitive t has special fibre k[t]/t² of length two, but its underlying R-module R⊕kt has k-length three rather than four. Thus the geometric-fibre length test cannot replace flatness.
- The coherent pairs (h¹,h²)=(0,0) and (1,1) both give 2(h¹−h²)=0=b₁. Requiring h²=0 in every characteristic would incorrectly exclude the latter Enriques types.

*Needs:* [2.2](#22-relative-picard-representability); [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [0.3](#03-enriques-numerical-and-cohomological-invariants); WeilConjectures WC.7; SchemeAndStackFoundations §§1.2–1.9, 4.1 and 0.9 for descent, nilpotent thickenings and Noetherian approximation; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; gap:picard-flatness-betti; gap:numerical-contraction-descent. The Enriques torsion-finiteness argument and passage from Artinian tests are targets of this subsection.

### 2.4 Family of canonical coverings

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

Put P=Pic^τ(Y/S) and G=P^D for an Enriques family. Via the finite-flat Picard–torsor correspondence, P↪Pic(Y/S) defines a distinguished section χ in H⁰(S,R¹f_*G_Y). A canonical covering family is a G_Y-torsor over Y whose fppf cohomology class maps to χ. It is defined independently of a chosen global lift.

Use the supplier finite flat Cartier duality and fppf cohomology. Construct χ from the actual inclusion, with pullback compatibility, then characterize its lifts by the Leray edge map. ([SCH23](#references), §5, pp. 14–15)

Its API consists of the following facts.

- A G_Y-torsor with specified equality of its edge image to χ.

- χ and its Cartier-dual group pull back compatibly.

- Base change a canonical torsor to a canonical torsor.

- Isomorphisms are equivariant torsor isomorphisms over Y preserving the edge condition.

**Checks.**

- For classical characteristic-two Pic^τ, the fibre group is μ₂ in the fppf topology.

- For ordinary characteristic-two Pic^τ, the fibre group is the étale Z/2.

- Over a nonempty base, the trivial torsor has zero edge class, whereas the inclusion P↪Pic restricts nontrivially to any geometric fibre; the trivial torsor therefore fails the canonical-cover condition. Over the empty base both classes are zero and the unique torsor is canonical.

*Needs:* [2.3](#23-relative-numerical-invariants); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22; ComplexComparisonPartII C3.2d.5.

### 2.5 Canonical-cover obstruction

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

With G=P^D, fppf cohomology has the exact row 0→H¹(S,G)→H¹(Y,G_Y)→H⁰(S,R¹f_*G_Y)→H²(S,G)→H²(Y,G_Y). The image of χ in H²(S,G) vanishes exactly when a canonical covering family exists.

First prove O_S→f_*O_Y universally an isomorphism and hence f_*G_Y=G. Apply the Leray low-degree sequence in the fppf topology; étale cohomology alone cannot express the α₂ or characteristic-two μ₂ case. ([SCH23](#references), §5 equation(2), pp. 14–15)

*Needs:* [2.4](#24-family-of-canonical-coverings); SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22; ComplexComparisonPartII C3.2d.5.

### 2.6 Injective pullback criterion for a canonical cover

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. Pullback H²_fppf(S,G)→H²_fppf(Y,G_Y) is injective.

If pullback H²_fppf(S,G)→H²_fppf(Y,G_Y) is injective, an Enriques family has a canonical covering family.

Exactness puts the obstruction in the kernel of pullback. Injectivity kills it, and exactness of the edge sequence supplies a torsor lift. ([SCH23](#references), Proposition 5.4, p. 15)

*Needs:* [2.5](#25-canonical-cover-obstruction).

### 2.7 Section criterion for a canonical cover

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. f has an S-section.

An Enriques family with an S-section has a canonical covering family.

Pullback along the section is a retraction of f* on H²_fppf. Use the injective-pullback criterion. ([SCH23](#references), Proposition 5.4, p. 15)

*Needs:* [2.6](#26-injective-pullback-criterion-for-a-canonical-cover).

### 2.8 Étale Picard torsion criterion for a canonical cover

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. P=Pic^τ(Y/S) is étale and Pic(S)=0.

If Pic^τ is étale and Pic(S)=0, an Enriques family has a canonical covering family.

Over the connected components, the étale rank-two P is constant Z/2 and generated by the fibrewise canonical line bundle. Descend ω² from S; Pic(S)=0 trivializes that line bundle. Construct the rank-two algebra `O_Y⊕ω_Y^{-1}`, using the dual of the chosen multiplication isomorphism so products have the correct tensor type. Apply the generic relative Spec/vector-bundle interfaces. ([SCH23](#references), Proposition 5.4, p. 15)

**Checks.**

- The multiplication uses `ω^{-2}→O`; an ω²→O map has the wrong type here.

*Needs:* [2.4](#24-family-of-canonical-coverings); [1.10](#110-tame-double-fibres-and-canonical-bundle); SchemeAndStackFoundations, §§1.3–1.9 and 4.1.

### 2.9 Twisting of canonical coverings

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. A canonical covering family exists.

Whenever a canonical covering family exists, its equivariant isomorphism classes form a principal homogeneous space under H¹_fppf(S,G), by twisting with pullbacks of base torsors.

Injectivity of the first map in the edge row gives freeness; equality of the two edge images puts their difference in its image and gives transitivity. Construct the contracted product and prove action/identity/inverse laws. ([SCH23](#references), Proposition 5.4, p. 15)

*Needs:* [2.5](#25-canonical-cover-obstruction); [2.4](#24-family-of-canonical-coverings).

### 2.10 Constant and split Picard schemes

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques.

For a commutative group-scheme extension 0→P→E→N→0 with N étale locally free of rank ten, define numerical constancy by N≅(Z¹⁰)_S, full constancy by an isomorphism of the extension to 0→(Z/2)_S→(Z¹⁰⊕Z/2)_S→(Z¹⁰)_S→0, and splitness by a group-scheme section N→E. Specialize these predicates to the relative Picard extension. Constant numerical Picard means Num≅(Z¹⁰)_S. Constant full Picard means Pic(Y/S)≅(Z¹⁰⊕Z/2)_S as a group scheme. A split Picard extension means only that 0→Pic^τ→Pic→Num→0 admits a homomorphic section. These are predicates invariant under isomorphism; numerical constancy and splitness do not by themselves force constant full Picard.

Use the actual relative Picard extension, and define each condition on it. Prove the implications of full constancy and isolate the extra étale-Pic^τ condition needed for the converse. ([SCH23](#references), §5, p. 15)

Its API consists of the following facts.

- An isomorphism Num≅(Z¹⁰)_S exists.

- An isomorphism Pic≅(Z¹⁰⊕Z/2)_S exists.

- The relative Picard quotient has a group-scheme section.

- Full constancy implies numerical constancy, étale Pic^τ and splitness.

- Constant full Picard is equivalent to constant Num, split extension and Pic^τ≅(Z/2)_S; splitness alone is insufficient.

**Checks for numerical constancy.**

- (Z¹⁰⊕Z/2)_S has constant numerical quotient Z¹⁰.
- The split extension (Z¹⁰⊕α₂)_k in characteristic two still has constant numerical quotient, despite its local torsion.
- Over R descend Z¹⁰ from C with conjugation negating its first generator. Its fixed subgroup has rank nine, so the rank-ten numerical local system is not constant.

**Checks for full constancy.**

- The standard extension (Z¹⁰⊕Z/2)_S is constant full Picard.
- (Z¹⁰⊕α₂)_k fails full constancy: its length-two torsion has one geometric point, whereas Z/2 has two.
- (Z¹⁰⊕μ₂)_k in characteristic two also fails full constancy for the same point-count reason, although its quotient is constant.

**Checks for splitness.**

- The standard constant extension splits by n↦(n,0).
- (Z¹⁰⊕α₂)_k and (Z¹⁰⊕μ₂)_k are split extensions, although neither has constant full Picard.
- Over R descend Z¹⁰⊕Z/2 by σ(e₁)=e₁+τ, σ(τ)=τ and σ(eᵢ)=eᵢ for i>1. Since σ²(e₁)=e₁+2τ=e₁, this is descent data. Its quotient is constant, but each lift e₁+aτ maps to e₁+(a+1)τ, so no invariant lift exists and the extension is nonsplit.

These are group-extension controls; no realization by an Enriques family is asserted.

*Needs:* [2.3](#23-relative-numerical-invariants).

### 2.11 Canonical covers with constant Picard

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, full Picard is constant and Pic(R)=0. H²_ét(S,G_m)=0 is required only when this cover classification is combined with the subsequent descent targets.

If Pic(Y/R) is constant full Picard and Pic(R)=0, canonical covering families exist and their classes are a torsor under R×/(R×)². In the simultaneous descent package also assume H²_ét(Spec R,G_m)=0.

Full constancy makes P étale Z/2 with G=μ₂. Use the étale-Picard criterion, the twisting action, and fppf Kummer with Pic(R)=0. This part does not need the stronger Brauer vanishing; that hypothesis belongs to numerical-class descent below. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [2.10](#210-constant-and-split-picard-schemes); [2.8](#28-étale-picard-torsion-criterion-for-a-canonical-cover); [2.9](#29-twisting-of-canonical-coverings); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 2.12 Canonical bundle order

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, full Picard is constant and R→k is any field map; no Brauer or Pic(R) vanishing is needed for this conclusion.

Under full Picard constancy, for every field map R→k the canonical line bundle of Y_k has exact order two.

Base change P to the constant étale group of order two. The generator of its geometric points is ω; descend the assertion and rule out triviality. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [2.10](#210-constant-and-split-picard-schemes); [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [2.3](#23-relative-numerical-invariants).

### 2.13 Descent of numerical classes

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, Pic(R)=0 and H²_ét(S,G_m)=0; full relative Picard is constant. R→k is any field-valued point.

For an Enriques family over R with constant full Picard, Pic(R)=0 and H²_ét(Spec R,G_m)=0, each geometric numerical class on a field fibre Y_k is represented by a k-line bundle. Its class in Pic(Y_k) is unique modulo tensoring with ω_Yk.

Use the Picard Leray edge sequence over R to lift sections of the full relative Picard to line bundles; the stated H² kills its obstruction. Restrict to k and compare the kernel Pic^τ(k)=⟨ω⟩. Azumaya Brauer vanishing alone is not substituted for the full cohomological group on arbitrary affine R. ([SCH23](#references), Theorem 5.6, pp. 16–18)

**Checks.**

- Retain full H²_ét(G_m)=0 on a nonregular R.

*Needs:* [2.10](#210-constant-and-split-picard-schemes); [2.12](#212-canonical-bundle-order); SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22; ComplexComparisonPartII C3.2d.4.

### 2.14 Descent of (-2)-curves

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, Pic(R)=0 and H²_ét(S,G_m)=0; full relative Picard is constant. R→k is any field-valued point.

With the hypotheses of numerical-line-bundle descent, every geometric (−2)-curve on Y_k descends to a k-curve isomorphic to P¹_k.

Lift its numerical class to a line bundle. Use Riemann–Roch and the uniqueness of the effective geometric (−2)-representative to descend the divisor. Perfectness of the Enriques lattice gives a line bundle of degree one on the descended genus-zero curve, splitting its conic form. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [2.13](#213-descent-of-numerical-classes); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [0.4](#04-the-enriques-numerical-lattice); SchemeAndStackFoundations, §§5.9–5.10.

### 2.15 Descent of genus-one fibrations

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, Pic(R)=0 and H²_ét(S,G_m)=0; full relative Picard is constant. R→k is any field-valued point.

With the same constant-full-Picard, Pic(R)=0 and cohomological-Brauer-zero hypotheses, each geometric genus-one fibration descends to a fibration Y_k→P¹_k, up to base isomorphism.

Descend its half-fibre class and the effective divisor through Riemann–Roch. Descend the pencil to a genus-zero base; the half-fibre yields a degree-one point/divisor on the base and identifies it with P¹ rather than a nonsplit conic. Descend the structure map by the linear system and verify its generic fibre. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [2.13](#213-descent-of-numerical-classes); [1.1](#11-half-fibre); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); SchemeAndStackFoundations, §§5.9–5.10.

### 2.16 Rational tame double fibres

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, Pic(R)=0 and H²_ét(S,G_m)=0; full relative Picard is constant. R→k is any field-valued point.

Every descended fibration in that descent package has precisely two tame double fibres, and both base points are k-rational.

The canonical bundle has order two, so the geometric classical formula gives exactly two tame fibres. The separately descended effective half-fibres force their base points to be rational, rather than only their sum being Galois invariant. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [2.12](#212-canonical-bundle-order); [2.15](#215-descent-of-genus-one-fibrations); [1.10](#110-tame-double-fibres-and-canonical-bundle); [2.13](#213-descent-of-numerical-classes).

### 2.17 Existence over the residue field

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R, Pic(R)=0 and H²_ét(S,G_m)=0; full relative Picard is constant. R→k is any field-valued point.

Every field fibre of the descent package has a genus-one fibration to P¹_k.

Choose a geometric fibration using Layer 1 and descend it with Layer 2. This conclusion uses the full Picard hypotheses, not numerical constancy alone. ([SCH23](#references), Theorem 5.6, pp. 16–18)

*Needs:* [1.6](#16-existence-of-genus-one-fibrations); [2.15](#215-descent-of-genus-one-fibrations).

### 2.18 Finite-field specialization of Picard descent

k is finite; Y/k is Enriques with constant full Picard.

For an Enriques surface over a finite field with constant full Picard, the numerical-class, (−2)-curve, genus-one-fibration and tame-double-fibre descent conclusions of Layer 2 apply over that field.

Pic(k)=0 and H²_ét(k,G_m)=0: use the finite-field Brauer vanishing input (Wedderburn together with the field cohomological Brauer identification). Specialize the descent package with R=k. These general finite-field cohomology interfaces belong to §§2.2–2.4, 2.11, 2.15 and 2.22, not a new Enriques definition. ([SCH23](#references), §3, Proposition 3.1 proof, p. 11; Theorem 5.6, pp. 16–18)

*Needs:* [2.13](#213-descent-of-numerical-classes); [2.14](#214-descent-of--2-curves); [2.15](#215-descent-of-genus-one-fibrations); [2.16](#216-rational-tame-double-fibres); SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22.

### Examples

For a rank-two algebra O_Y ⊕ ω_Y⁻¹, a trivialization t:ω_Y²≃O_Y gives multiplication on the odd summand through (t∨)⁻¹:ω_Y⁻²→O_Y. Tensor powers have opposite signs here: using t directly would have the wrong domain. Multiplying this map by a unit changes the cover while preserving the underlying rank-two module.

The low-degree sequence is

```text
0 → H¹(S,G) → H¹(Y,G_Y) → H⁰(S,R¹f_*G_Y)
  → H²(S,G) → H²(Y,G_Y).
```

The middle class is the specified character χ:G∨→Pic(Y/S), namely the inclusion Pic^τ→Pic. A section of f makes the final pullback injective; hence the obstruction of χ vanishes. This is a cover-existence argument. The separate hypothesis H²_et(S,G_m)=0 in numerical line-bundle descent concerns a different coefficient group.

For a hypothetical I₀* fibre over F₂, each of its four outer smooth rational components must attach at a different rational point on the central P¹. Since P¹(F₂) has three elements, this configuration cannot occur. Counting geometric points over F̄₂ would miss the contradiction. For an irreducible nodal or cuspidal rational fibre it is its normalization that is P¹, not the singular fibre itself.

### Dependencies

Layers 0–1; SchemeAndStackFoundations §§1.3–1.9, 2.2–2.6, 2.11, 2.15, 2.22 and 5.9–5.10; ComplexComparisonPartII C3.2d.2 relative Picard representability; R07.1; and numerical and labelled-graph descent. The finite-field specialization proves Pic and cohomological Brauer vanishing directly over the residue field and does not assume an integral model.

## Layer 3: point counts, dyadic twists and integral Picard constancy

The finite-field count needs only constant Num. It supplies local sections before full Picard constancy is known. Compare two actual canonical coverings over Q₂ and then choose a globally permitted twist.


### 3.2 Numerical constancy over the integers

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z.

For an Enriques family over Z, Num is constant of rank ten, and over F_p its fibre has 1+10p+p² points; in particular the F₂ fibre has 25 points.

Apply finite étale decomposition over ℤ and bijective_algebraMap_int_of_finite_of_unramified to prove that every connected finite étale ℤ-algebra is ℤ. InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 gives finite monodromy on the normal connected locally Noetherian base Spec ℤ; the EtaleCohomologyFoundations §F.0.2 adapter then trivializes the action on the rank-ten numerical local system. For each finite residue field, double numerical sections into relative Picard and use finite-field cohomological Brauer vanishing to obtain an ample line bundle on the fibre. This gives its projective scheme model before applying the Num-only trace calculation of WeilConjectures WC.7. It does not assume full Picard constancy or the later local-projectivity theorem. ([SCH23](#references), Proposition 5.5, author pp. 15–16; Corollary 7.3, p. 21)

*Needs:* [2.3](#23-relative-numerical-invariants); [0.3](#03-enriques-numerical-and-cohomological-invariants); WeilConjectures, WC.7; Mathlib `bijective_algebraMap_int_of_finite_of_unramified`; SchemeAndStackFoundations, §§1.3–1.9 and 4.1; WeilConjectures WC.7 (`count_enriques_or_rational_genus_one`); SchemeAndStackFoundations §2.15; gap:numerical-contraction-descent; InverseGaloisAndArithmeticFundamentalGroups §IG.0.3; EtaleCohomologyFoundations §F.0.2.

### 3.3 Local projectivity of Enriques families

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec R with R Noetherian local; f has an R-section and constant Num. The Z_p application starts from a Z-family and obtains its section by the Num-only finite-field point count from WeilConjectures WC.7 and smooth Henselian lifting. No vanishing of H²(R,G_m) is assumed.

An Enriques family over a Noetherian local ring R with a section and constant Num is a projective R-scheme. For a family over Z, its base change to Z_p has this property at every prime p.

With Pic^τ killed by two, double a numerical section into relative Picard. The section splits the Brauer edge obstruction, so it lifts to a line bundle. Lift an ample geometric closed-fibre numerical class and use numerical invariance of ampleness. Apply the algebraic-space spreading result in its geometric-fibre form (Stacks 0D3D); a neighbourhood containing the closed point of a local base is the whole base. Properness and an ample sheaf give projective scheme representability. For Z_p lift a nonempty F_p point by smooth Henselian lifting. The point count is [3.2](#32-numerical-constancy-over-the-integers), independent of full Picard constancy. This projectivity statement does not need the μ₂ branch. ([SCH23](#references), Proposition 5.5 and proof, pp. 15–16, of which this local-projectivity statement is an addition proved with the listed Stacks lemmas; [Stacks](#references), Lemma 74.13.2, tag 0D3D; Lemma 99.11.4, section tag 0D24; [Stacks](#references), Lemma 68.11.4, section tag 0EMV; Lemma 15.13.3, tag 0H74)

*Needs:* [3.2](#32-numerical-constancy-over-the-integers); [2.7](#27-section-criterion-for-a-canonical-cover); SchemeAndStackFoundations, §§1.3–1.9 and 4.1; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22; SchemeAndStackFoundations, §§5.9–5.10; ComplexComparisonPartII C3.2d.4; gap:numerical-contraction-descent.

### 3.4 Canonical cover over Z₂ before Picard constancy

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z. The hypothetical branch P=Pic^τ(Y/Z)≅μ₂ is assumed; G=P^D≅Z/2.

In the hypothetical Pic^τ=μ₂ branch of an Enriques family over Z, there is a canonical finite étale Z/2-cover over Z₂.

Numerical constancy gives 25 F₂-points, and smooth Henselian lifting gives a Z₂-section. The section criterion produces the canonical torsor; Cartier duality makes its group étale Z/2. No full-Picard theorem or finite-field endpoint is invoked. ([SCH23](#references), Proposition 5.5, pp. 15–16; Corollary 7.3, p. 21; Proposition 5.4(ii), p. 15; [Stacks](#references), Lemma 68.11.4, section tag 0EMV; Lemma 15.13.3, tag 0H74)

*Needs:* [3.2](#32-numerical-constancy-over-the-integers); [2.7](#27-section-criterion-for-a-canonical-cover); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.

### 3.5 Canonical-cover twists supported at two

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z. The hypothetical branch P=Pic^τ(Y/Z)≅μ₂ is assumed; G=P^D≅Z/2.

For a canonical Z/2-cover X of an Enriques family on Spec Z[1/2] in the Pic^τ=μ₂ branch, twisting by the base torsors s²=u for u=1,−1,2,−2 produces canonical finite étale covers. These four torsors are all the classes in H¹(Z[1/2],Z/2).

On Z[1/2], identify Z/2 with μ₂ and apply the fppf Kummer sequence. The localization is a PID with Pic=0, and its units are ±2^n. Reducing n modulo two gives exactly 1,−1,2,−2. These global units are elementary localization arithmetic, not an input from LocalFieldsRamification. Use Layer 2 canonical twisting to apply those four base torsors to the chosen cover; the result stays canonical and finite étale. ([SCH23](#references), Proposition 5.4 twisting action; explicit construction supplementing Proposition 5.5)

Its API consists of the following facts.

- For a canonical Z/2-cover on Z[1/2], the four contracted-product covers for units 1,−1,2,−2.

- The twisting law is multiplication of unit square classes; the unit-one twist is isomorphic to the original cover.

- Every base Z/2-torsor on Z[1/2] has precisely one of the four unit square classes.

- Each twisted cover has the same canonical Picard edge class after every base change.

**Checks.**

- The unit-one twist is canonically equivalent to twisting by the trivial base torsor.

- Two unit-two twists compose to unit-four, a trivial square class, and recover the original cover.

- The equation s²=5 does not define a base torsor over Z[1/2], because 5 is not a unit.

- Every chosen s²=u cover is finite étale of rank two over Z[1/2]; these equations are not used for an étale Z/2-cover on Z₂.

*Needs:* [2.9](#29-twisting-of-canonical-coverings); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; SchemeAndStackFoundations, §§2.2–2.4, 2.11, 2.15 and 2.22.

### 3.6 Dyadic representatives

e,a,b lie in {0,1}; dyadic representatives live in Q× and are embedded in Q₂×. Global twists are units of Z[1/2]. No surface is assumed.

For e,a,b∈{0,1}, dyadicRepresentative(e,a,b)=(−1)^e2^a5^b∈Q×. After embedding in Q₂ these eight numbers represent distinct square classes, and every nonzero dyadic number has a unique represented class.

Specialize the existing local-field unit filtration to Q₂: valuation parity gives a, odd units modulo eight give e,b. For units congruent to one modulo eight, apply the existing strong Hensel theorem to the square equation. Unramified quadratic class five has the étale integral equation z²−z−1. ([SCH23](#references), Proposition 5.5, pp. 15–16, for the canonical-cover application; the explicit four-twist comparison is the strengthened argument specified in this layer.)

Its API consists of the following facts.

- `dyadicRepresentative`: The explicit rational number (−1)^e2^a5^b, with each exponent Fin 2.

- Each representative is nonzero.

- The representative is u(e,a) times 5^b.

- `dyadic_square_classes`: For x∈Q₂× there is a unique triple (e,a,b) for which x/representative(e,a,b) is a square.

**Checks.**

- The sign bit gives representative(1,0,0)=−1, whose odd residue is 7 modulo eight; a definition omitting the sign would give residue 1.

- The valuation bit gives representative(0,1,0)=2 of valuation one; omitting that factor would give valuation zero.

- The unramified bit gives representative(0,0,1)=5 of odd residue 5 modulo eight; it is distinct from the square-unit residue 1.

- All three bits give representative(1,1,1)=−10; x=0 would make all eight quotients square zero, so uniqueness requires x≠0.

*Needs:* LocalFieldsRamification, Layer 1; LocalFieldsRamification, Layer 2; Mathlib `hensels_lemma`; TauCeti/NumberTheory/Padics/SerreSigns.lean.

### 3.7 Global twist

e,a,b lie in {0,1}; dyadic representatives live in Q× and are embedded in Q₂×. Global twists are units of Z[1/2]. No surface is assumed.

Define u(e,a)=(−1)^e2^a in Q, regarded as a unit of Z[1/2]. Multiplication of a difference representative by this same global twist removes its ramified factors: representative(e,a,b)·u(e,a)=5^b(2^a)². Thus only classes one and five remain locally.

The sign and factor two each have exponent zero or one. Their squares disappear in Q₂×/(Q₂×)². Use the canonical torsor-twisting API over Z[1/2] and the étale local twist for class five; retain a Q₂-isomorphism of the resulting covers before gluing local good-reduction models. ([SCH23](#references), Proposition 5.5, pp. 15–16; the global-to-dyadic matching is the additional comparison specified here.)

Its API consists of the following facts.

- The global twist is the rational number (−1)^e2^a with e,a∈Fin 2.

- Each of the four rational twists is nonzero.

- Representative(e,a,b)·u(e,a)=5^b(2^a)².

**Checks.**

- u(0,0)=1.

- u(1,0)=−1.

- u(0,1)=2 and u(1,1)=−2.

*Needs:* [3.6](#36-dyadic-representatives); [3.5](#35-canonical-cover-twists-supported-at-two).

### 3.8 Dyadic difference class of canonical covers

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z. The hypothetical branch P=Pic^τ(Y/Z)≅μ₂ is assumed; G=P^D≅Z/2.

Two canonical Z/2-covers over the same Q₂-fibre differ uniquely by a class in Q₂×/Q₂×²; this applies to a Z[1/2]-cover and the generic fibre of a Z₂-cover.

Apply canonical twisting over Q₂. Identify Z/2 with μ₂ only after inverting two, then use Kummer over the field. Do not identify finite étale Z/2-torsors over Z₂ with μ₂ Kummer torsors there. ([SCH23](#references), Proposition 5.4, p. 15; the comparison required by Proposition 5.5, pp. 15–16)

*Needs:* [2.9](#29-twisting-of-canonical-coverings); [3.4](#34-canonical-cover-over-z-before-picard-constancy); [3.5](#35-canonical-cover-twists-supported-at-two); LocalFieldsRamification, Layer 1.

### 3.9 Removing the ramified part of the difference

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z. The hypothetical branch P=Pic^τ(Y/Z)≅μ₂ is assumed; G=P^D≅Z/2.

Write the difference class c uniquely as (−1)^e·2^a·5^b with e,a,b∈{0,1}. Exactly one u among 1,−1,2,−2 has cu in {1,5}, namely u=(−1)^e2^a. The global u-twist and the local twist by the unramified 5-class have isomorphic Q₂-fibres.

Import dyadic unit/square classification from LocalFieldsRamification Layers 1–2 and native strong Hensel. The polynomial z²−z−1 over Z₂ is finite étale and has discriminant five, modelling the nontrivial unramified class. Multiplication of the exponent triples modulo two removes e,a and retains b; twist the local cover by that étale model when b=1. ([SCH23](#references), Proposition 5.5, pp. 15–16; the explicit global-to-dyadic comparison is the additional target specified here)

*Needs:* [3.8](#38-dyadic-difference-class-of-canonical-covers); LocalFieldsRamification, Layer 1; LocalFieldsRamification, Layer 2; Mathlib `hensels_lemma`.

### 3.10 Étale canonical covers are K3 surfaces

k is algebraically closed; Y/k is a geometric Enriques surface. The canonical Cartier-dual group is étale of rank two; X→Y is the canonical nontrivial torsor.

For an ordinary geometric Enriques surface in characteristic two, prove that its canonical étale torsor is a connected smooth K3 surface.

Combine this ordinary characteristic-two result with EnriquesSurfaces E1a outside characteristic two. The canonical inclusion is nonzero, so the étale double torsor is connected. Étaleness gives smoothness, pullback trivializes ω and Euler characteristic doubles to two; coherent duality gives H¹(O)=0. Use the shared K3 definition from K3SurfacesAndSymplecticBoundedness, including its proper/projective bridge. Do not rename the singular K3-like local covers as K3 surfaces. ([SCH23](#references), §4, p. 13, and Proposition 5.5, pp. 15–16, using the canonical-cover theorem.)

*Needs:* [2.4](#24-family-of-canonical-coverings); [0.2](#02-numerically-trivial-picard-group-of-an-enriques-surface); [1.10](#110-tame-double-fibres-and-canonical-bundle); [1.12](#112-ordinary-enriques-surfaces); SchemeAndStackFoundations, §§2.6 and 2.20; K3SurfacesAndSymplecticBoundedness §§1.1–1.3; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 3.10a Étale fundamental groups of geometric Enriques surfaces

For a geometric Enriques surface Y, prove π₁ᵉᵗ(Y)≅Z/2 outside characteristic two and for ordinary type in characteristic two; in the classical and supersingular characteristic-two types prove π₁ᵉᵗ(Y)=1 (SCH23, §4, p. 13; CDL2021, 2024 draft Theorem 1.4.13, printed pp. 231–232, CDL2021 line 11531).

Own the finite-cover argument here: every connected finite étale Z→Y of degree d is smooth projective with numerically trivial canonical bundle and χ(O_Z)=dχ(O_Y)=d. A nonzero section of its canonical line bundle has numerically trivial effective divisor; intersection with an ample divisor forces that divisor to vanish. Consequently h⁰(ω_Z)≤1 and χ(O_Z)=1−h¹(O_Z)+h⁰(ω_Z)≤2, so every such cover has d≤2. The profinite fundamental group therefore has order at most two. In characteristic two, a connected degree-two cover would be a Z/2-torsor; ComplexComparisonPartII C3.2d.5 identifies its nonzero class with a nonzero μ₂→Pic^τ. Such a map exists exactly for Pic^τ=μ₂. In the other characteristics, and in the ordinary characteristic-two case, the canonical étale double cover supplies the nontrivial cover. This argument proves the bound without assuming simple connectivity of a K3 cover.

**Checks.**

- Ordinary Pic^τ=μ₂ admits the identity μ₂→μ₂, giving a connected degree-two cover and group order two.
- Classical Pic^τ=Z/2 admits no nonzero map from the connected μ₂, giving group order one.
- Supersingular Pic^τ=α₂ admits no nonzero multiplicative-to-unipotent map μ₂→α₂, again giving group order one.

*Needs:* §3.10 for existence of the canonical étale cover; §0.2 and §§1.12–1.14 for the Picard types; SchemeAndStackFoundations §§2.6, 2.15, 2.20 and 5.9–5.10 for finite étale covers, duality, ample intersections and coherent Euler multiplicativity for finite étale maps by Riemann–Roch; ComplexComparisonPartII C3.2d.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1. EtaleCohomologyFoundations §F.0.2 supplies the finite étale Galois category.

### 3.11 Canonical-cover compatibility at two

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z. The hypothetical branch P=Pic^τ(Y/Z)≅μ₂ is assumed; G=P^D≅Z/2.

In the Pic^τ=μ₂ branch over Z, one of the four Z[1/2]-twists of a canonical cover has a geometric K3 generic fibre over Q and smooth proper projective scheme models over Z_p for every prime p.

Construct a canonical cover over Z[1/2], where P is étale and Pic of the base is zero. Choose the Z₂-cover independently. Over Q₂ remove the ramified difference by the global u-twist and the unramified local 5-twist. At odd p base change the twisted global étale cover; at two use the corrected Z₂-cover. Each base is a projective scheme by local-projectivity and its finite étale cover is projective and smooth. The Q_p generic models agree with the chosen global Q-cover; the Q₂-isomorphism is part of this comparison. The resulting everywhere-good-reduction K3 surface is what 3.13 feeds to Fontaine's theorem (h²,⁰ would vanish, against the K3 value one). ([SCH23](#references), Proposition 5.5 proof, p. 16; [Fontaine](#references), Theorem 1 and Remark (a), printed p. 3 (PDF p. 4))

*Needs:* [3.5](#35-canonical-cover-twists-supported-at-two); [3.4](#34-canonical-cover-over-z-before-picard-constancy); [3.8](#38-dyadic-difference-class-of-canonical-covers); [3.9](#39-removing-the-ramified-part-of-the-difference); [3.3](#33-local-projectivity-of-enriques-families); [3.10](#310-étale-canonical-covers-are-k3-surfaces); [3.6](#36-dyadic-representatives); [3.7](#37-global-twist).

### 3.12 Splitting of Z/2-extensions of a constant lattice over Spec Z

S is connected and every finite étale Z/2-torsor on S is trivial. The extension is a commutative group-scheme extension of the constant free group (Zⁿ)_S by (Z/2)_S.

Over a connected base S with every finite étale Z/2-torsor trivial, any commutative group-scheme extension of (Zⁿ)_S by (Z/2)_S splits. Over Z this applies to the Enriques Picard extension once P is the étale branch.

Above each numerical basis vector the fibre is a finite étale Z/2-torsor. Choose its S-section and extend the chosen lifts additively from the free lattice; commutativity makes this a group-scheme splitting. Apply trivial finite étale covers of Spec Z. ([SCH23](#references), proof of Proposition 5.5, p. 16 (sequence (4)))

*Needs:* [2.10](#210-constant-and-split-picard-schemes); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; Mathlib `bijective_algebraMap_int_of_finite_of_unramified`; SchemeAndStackFoundations, §§1.3–1.9 and 4.1.

### 3.13 Constant Picard scheme over Z

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z.

Every Enriques family over Z has constant full Picard scheme (Z¹⁰⊕Z/2)_Z.

Start with Num constancy, then Oort–Tate rank-two classification over Z gives P=μ₂ or Z/2. The four-twist K3 good-reduction argument and the imported Fontaine obstruction exclude μ₂. In the remaining étale branch split the extension by lifting all numerical basis vectors through trivial étale torsors. This order avoids circularity with descent and F₂ nonexistence. ([SCH23](#references), Proposition 5.5, pp. 15–16)

*Needs:* [3.2](#32-numerical-constancy-over-the-integers); [3.11](#311-canonical-cover-compatibility-at-two); [3.12](#312-splitting-of-z2-extensions-of-a-constant-lattice-over-spec-z); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; gap:fontaine-low-degree-hodge.

### Examples

Under constant Num over F_q, the divisor classes span H²(1), so geometric Frobenius has trace 10q on H², and the trace formula gives 1+10q+q². At q=2 this is 25. Over F₄ it is 57, not 25 or 29. No assertion of constant full Picard scheme is needed to obtain these numbers.

The eight representatives of Q₂×/Q₂×² are obtained from the four odd unit classes 1,−1,5,−5 and their multiples by 2. The four globally permitted twists are 1,−1,2,−2: 5 is a local comparison class, not a unit of ℤ[1/2]. If the difference class of two actual Q₂-covers is c=(−1)^e2^a5^b and the global twist is u=(−1)^e2^a, then cu=5^b(2^a)², as in 3.9. Thus the remaining class is either trivial or unramified. For example, c=−10 and u=−2 give cu=20=5·2². If c=2, then u=2 gives 4, a square. The polynomial z²−z−1 defines the étale unramified quadratic ℤ₂-algebra in the class five, even though adjoining √5 by the Kummer equation x²−5 is not an étale integral presentation at 2.

To justify the unit square criterion, Hensel at a=1 for x²−u requires v₂(u−1)≥3. The derivative has norm 1/2, so the strict comparison is 1/8<1/4. A unit congruent to five modulo eight fails this criterion and represents the nontrivial unramified class. These statements are specific to Q₂, not arbitrary ramified dyadic fields.

### Dependencies

Layers 0–2; WeilConjectures WC.7; finite étale decomposition over ℤ; LocalFieldsRamification Layers 1–2 and Mathlib Hensel; the shared K3 predicate; and Fontaine’s good-reduction obstruction. Only after the four-twist contradiction is the remaining étale Pic^τ combined with the split étale-lattice extension to prove constant full Picard over ℤ.

## Layer 4: Enriques fibrations and their rational Jacobians

The Jacobian construction includes both kinds of genus-one fibration. The subsequent residue-field fibre comparisons and constant-Picard theorem in this layer concern elliptic fibrations on a constant-full-Picard Enriques surface over F₂.

### 4.1 Jacobian of an Enriques genus-one fibration

k is any field; Y/k is geometrically Enriques and φ:Y→P¹_k is a genus-one fibration, elliptic or quasielliptic. The shared genus-one supplier provides generic Pic⁰, its regular compactification when necessary, and the relatively minimal regular surface model.

Given an Enriques genus-one fibration φ:Y→P¹_k, its Jacobian is the generic Pic⁰ curve in the elliptic case and the regular compactification of that group curve in the quasielliptic case, extended by the supplier relatively minimal regular surface model J→P¹. It has its canonical zero-section. This construction is an Enriques adapter to the shared genus-one Jacobian construction.

Import generic Pic⁰ and its minimal regular model from NeronModelsAndSemistableAbelianVarietiesPartII §§2–5, including the unpointed genus-one torsor and regular nonsmooth quasielliptic cases. JacobianChallenge supplies shared relative-Picard sheaf foundations and the smooth pointed constructor where a point has been obtained, not a general quasielliptic surface Jacobian. ([SCH23](#references), §6, p. 19)

Prove the Enriques geometric-comparison adapter: J is geometrically integral, and, writing Jᵍ→P¹_k̄ for the regular Jacobian constructed from φ_k̄, there is a nonempty open V⊂P¹_k̄ and a V-isomorphism between J_k̄|_V and Jᵍ|_V respecting their generic Pic⁰ identifications and zero-sections. Thus J_k̄ and Jᵍ are birational over P¹_k̄. On the dense smooth locus of φ, strict-henselian local sections identify its torsor with its Jacobian; compatibility of generic Pic⁰ with field extension and descent gives the common open. Use these local identifications and flatness over the integral base to prove geometric integrality of J. ([SCH23](#references), Proposition 6.2, first part of proof, p. 19; SCH23 lines 830–838)

Its API consists of the following facts.

- Specialize the shared Jacobian minimal regular model to an Enriques genus-one fibration.

- The generic identity extends to the zero-section of the minimal model.

- Its generic fibre identifies with Pic⁰ or its regular compactification, according to elliptic/quasielliptic type.

- Isomorphic fibrations induce the supplier Jacobian isomorphism.

- J is geometrically integral, including over an imperfect ground field.

- After algebraic closure, J_k̄ and the regular Jacobian Jᵍ of φ_k̄ have the stated dense-open isomorphism and hence the same function field over k̄(t), preserving the generic identity.

**Checks.**

- An index-two smooth generic torsor has no K-point, while its Jacobian has its K-rational identity. Replacing the Jacobian by the torsor fails this point test.

- In the quasielliptic branch the affine dimension-one Pic⁰ group has infinitely many linearly independent global functions, whereas its proper regular genus-one compactification has H⁰=K of dimension one. They cannot be the same curve.

- The Jacobian has a section, so it does not inherit a torsor fibre multiplicity two as a Jacobian scheme fibre.

- For k=F₂(s), the regular integral affine surface Spec k[u,v,w]/(u²−s) becomes Spec k(√s)[ε,v,w]/(ε²). Its nonzero ε has ε²=0, so regularity alone cannot prove geometric integrality; the adapter uses the fibration's dense smooth locus.

- Blowing up P²_k̄ at one point gives Picard rank two instead of one, while both function fields are k̄(x,y). A dense-open comparison fixes the birational class without asserting an isomorphism of whole surface models.

*Needs:* WeilConjectures WC.7 (`IsEnriques`); SchemeAndStackFoundations, §§1.3–1.9 and 4.1; NeronModelsAndSemistableAbelianVarietiesPartII §4.17 for generic Pic⁰, regular compactification and uniqueness with fixed generic fibre; K3SurfacesAndSymplecticBoundedness §6.0b for field change of the Enriques pencil; JacobianChallenge Layer D and ComplexComparisonPartII C3.2d.2–C3.2d.3 for generic Picard representability and base change.

### 4.2 Rationality of the Enriques Jacobian

k is any field; Y/k is geometrically Enriques and φ:Y→P¹_k is a genus-one fibration, elliptic or quasielliptic. The shared genus-one supplier provides generic Pic⁰, its regular compactification when necessary, and the relatively minimal regular surface model.

The relatively minimal regular Jacobian surface of any Enriques genus-one fibration is geometrically rational.

First apply §4.1 to compare J_k̄ birationally with Jᵍ, the regular Jacobian constructed from the geometric pencil. On Jᵍ, use K3SurfacesAndSymplecticBoundedness §6.0b to obtain χ(O_Jᵍ)=χ(O_Y_k̄)=1, including the quasielliptic case. This geometric relatively minimal Jacobian is smooth projective, has no multiple fibres and has R¹jᵍ_*O_Jᵍ=O(−1). Leray gives H¹(O_Jᵍ)=0 and the canonical formula gives ω_Jᵍ=O(−F), so H⁰(ω_Jᵍ²)=0. Apply NeronModelsAndSemistableAbelianVarietiesPartII §6.1, the surface rationality criterion for smooth projective surfaces over an algebraically closed field, to Jᵍ. Its rationality and the birational comparison prove geometric rationality of J. ([SCH23](#references), Proposition 6.2, p. 19)

*Needs:* [4.1](#41-jacobian-of-an-enriques-genus-one-fibration); [0.3](#03-enriques-numerical-and-cohomological-invariants); SchemeAndStackFoundations, §§2.6 and 2.20; K3SurfacesAndSymplecticBoundedness §6.0b; NeronModelsAndSemistableAbelianVarietiesPartII §§4.1–4.3, 4.17 and 6.1.

**Checks.**

- For E×P¹ the values χ(O)=0 and h¹(O)=1 exclude the rationality criterion, although the fibration has a section.
- For χ(O_J)=1, H⁰(P¹,O(−1))=H¹(P¹,O)=0, so Leray gives h¹(O_J)=0; H⁰(P¹,O(−2))=0 gives the second plurigenus zero.
- For a Jacobian K3, χ(O)=2 gives R¹j_*O=O(−2) and ω_J=O, so h⁰(ω_J²)=1; a section alone cannot imply rationality.

### 4.4 Simple-fibre identification

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

At a simple fibre of that elliptic fibration, the Jacobian fibre and Enriques fibre are isomorphic over the residue field.

Find a point of the smooth locus of the whole scheme fibre. For tree additive types choose a multiplicity-one terminal component; for I_n cycles remove at most two intersection points from a split P¹; for type IV remove its single triple-intersection point. Treat nonsplit I₁/I₂ by their normalization/conductor descriptions. Do not use the regular locus of the reduction when the scheme fibre has thicker components. Lift that smooth point over the Henselian local base, trivialize the generic torsor and invoke uniqueness of the minimal regular model. This supplies the residue-field isomorphism, not only equal geometric type. ([SCH23](#references), Proposition 9.2, p. 24)

**Checks.**

- The smooth-point argument covers I_n cycles and type IV, neither of which has a terminal dual-graph vertex.

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §3.11; [2.14](#214-descent-of--2-curves); SchemeAndStackFoundations, §§1.3–1.9 and 4.1; NeronModelsAndSemistableAbelianVarietiesPartII §§3.7–3.9.

### 4.5 Nonrational fibres

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

Each geometric Jacobian fibre above a non-F₂-rational closed point is irreducible.

Apply numerical contraction descent to the Enriques surface: a reducible geometric fibre would force a purely inseparable residue extension of F₂ and hence a rational base point. Transfer component counts via Kodaira matching. ([SCH23](#references), Proposition 9.3, p. 25)

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §3.11; [2.10](#210-constant-and-split-picard-schemes); NeronModelsAndSemistableAbelianVarietiesPartII §2.9.

### 4.6 Excluded I₀*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

No geometric Jacobian fibre in this setting has type I₀*.

NeronModelsAndSemistableAbelianVarietiesPartII §2.14 excludes the Enriques I₀* fibre for either kind of genus-one fibration. For this elliptic Jacobian adapter, transfer geometric Kodaira symbols by NeronModelsAndSemistableAbelianVarietiesPartII §3.11. ([SCH23](#references), Proposition 9.3, p. 25)

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §3.11; [2.14](#214-descent-of--2-curves); NeronModelsAndSemistableAbelianVarietiesPartII §2.14.

### 4.7 Semistable graph descent

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

For each semistable Jacobian fibre, base change to an algebraic closure induces an isomorphism on the dual graph over its residue field.

Use the constant numerical Enriques local system and the supplier graph descent. Combine simple-fibre isomorphism with the fact that semistable fibres are simple under the tame double-fibre restrictions. ([SCH23](#references), Proposition 9.3, p. 25)

*Needs:* [4.4](#44-simple-fibre-identification); [1.11](#111-characteristic-two-tame-half-fibre-types); [2.16](#216-rational-tame-double-fibres); NeronModelsAndSemistableAbelianVarietiesPartII §2.9.

### 4.8 At most one semistable or supersingular rational fibre

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

Among the three F₂-rational base points, at most one Jacobian fibre is semistable or smooth supersingular.

The Enriques fibration has two rational tame double fibres, whose half-fibres are ordinary or additive. For smooth multiple reduction use the F₂ multiple-fibre isomorphism of NeronModelsAndSemistableAbelianVarietiesPartII §3.9 (SCH23, Corollary 8.3, p. 23), not just the Kodaira symbol I₀, to transfer ordinarity. Simple fibres use the fibre isomorphism. ([SCH23](#references), Proposition 9.3, p. 25)

*Needs:* [1.11](#111-characteristic-two-tame-half-fibre-types); [2.16](#216-rational-tame-double-fibres); [4.4](#44-simple-fibre-identification); NeronModelsAndSemistableAbelianVarietiesPartII §3.9.

### 4.9 Descent of all Mordell–Weil sections

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

Every geometric Mordell–Weil section of the Jacobian of a constant-full-Picard Enriques elliptic fibration over F₂ is defined over F₂. Thus MW(J/P¹)=MW(J_F̄₂/P¹_F̄₂) under base change.

Over F̄₂(t), Tsen kills the Brauer obstruction to Picard points being line bundles. Restriction from geometric Pic(Y) to the generic curve is surjective; subtract degree/2 times a descended two-section R to obtain the Galois-equivariant surjection to Pic⁰, hence MW. Constant full Picard makes this quotient action trivial; Galois-fixed points of J(F̄₂(t)) descend to J(F₂(t)). Br(F₂(t)) is not claimed zero, and the square-zero two-section case is retained. ([SCH23](#references), Proposition 9.3, p. 25)

**Checks.**

- Tsen is used over F̄₂(t) only; no line-bundle descent over F₂(t) is inferred from it.

*Needs:* [1.8](#18-integral-two-sections); [2.13](#213-descent-of-numerical-classes); [2.15](#215-descent-of-genus-one-fibrations); [4.1](#41-jacobian-of-an-enriques-genus-one-fibration); JacobianChallenge, Layer D; [2.18](#218-finite-field-specialization-of-picard-descent).

### 4.10 The auxiliary Jacobian count equals the Enriques fibre count

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

At each a∈P¹(F₂), the point-count quantity n_a attached to the Jacobian equals #Y_a(F₂). Summing the three values gives 25.

At simple fibres use the actual fibre isomorphism. At smooth multiple reduction use the local torsor-reduction isomorphism of NeronModelsAndSemistableAbelianVarietiesPartII §3.9 (SCH23, Corollary 8.3, p. 23). For additive multiple fibres use the supplier singular-fibre count and the descended graph of the Enriques fibre; nilpotent thickening does not change rational points. Sum over the rational base and use the Num-only surface count. ([SCH23](#references), §9, p. 26)

Define n_a as an auxiliary number from the Jacobian fibre type, its geometric component count and, in the smooth case, its residue-field elliptic curve. The formulas used in the enumeration are

| Jacobian fibre data | Auxiliary n_a |
| --- | --- |
| smooth E_n | n |
| split semistable I_r | 2r |
| nonsplit semistable Ĩ_r, r=1 or 2 | 2r+2 |
| labelled additive fibre with r geometric components | 2r+1 |

The simple-fibre isomorphism supplies n_a=#Y_a(F₂) for simple smooth or semistable fibres; the additive and multiple-fibre assertions use their local comparison and the descended Enriques components. Equality with #J_a(F₂) is deduced only after §4.11 proves constant Picard and labelled component descent for J. Nilpotent thickening of a multiple fibre does not change its rational points. Summing over the three rational base points gives 25. These are counts over F₂, not a claim about every finite residue field.

*Needs:* [4.4](#44-simple-fibre-identification); [4.8](#48-at-most-one-semistable-or-supersingular-rational-fibre); WeilConjectures WC.7 (`count_enriques_or_rational_genus_one`); NeronModelsAndSemistableAbelianVarietiesPartII §§2.10–2.13, 3.9 and 5.1.

### 4.11 Constant Picard of the Jacobian

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` `φ:Y→P¹_{F₂}` is an elliptic fibration, and `J→P¹_{F₂}` is its relatively minimal regular Jacobian with zero-section.

The Jacobian of an elliptic fibration on a constant-full-Picard Enriques surface over F₂ has constant Picard scheme.

Verify the supplier rational-Jacobian criterion: irreducibility at nonrational points, no I₀*, split semistable graphs, at most one semistable/supersingular rational fibre, full Mordell–Weil descent and fibre-count sum 25. Its graph proof must use the unimodular pairing argument for affine D-types, direct IV triangle argument and multiplicity-labelled E₇/E₈ terminal vertices. Apply the criterion to the geometrically rational J. Its labelled component descent then gives n_a=#J_a(F₂); this equality is a conclusion, not an input to the criterion. ([SCH23](#references), Theorem 9.1, p. 24)

*Needs:* [4.2](#42-rationality-of-the-enriques-jacobian); [4.5](#45-nonrational-fibres); [4.6](#46-excluded-i); [4.7](#47-semistable-graph-descent); [4.8](#48-at-most-one-semistable-or-supersingular-rational-fibre); [4.9](#49-descent-of-all-mordellweil-sections); [4.10](#410-the-auxiliary-jacobian-count-equals-the-enriques-fibre-count); NeronModelsAndSemistableAbelianVarietiesPartII §5.8.

### Examples

For a reducible split semistable fibre I_r over F₂, its r rational components contribute 3r points before identifying r nodes, giving 2r. For the nonsplit I₁ and I₂ possibilities the point counts are respectively 4 and 6. A labelled additive fibre with r rational components contributes 2r+1. In particular I₁* has r=6 and contributes 13; adding a smooth E₄ and split I₄ gives 13+4+8=25.

A two-section may be a square-zero genus-one curve. Consequently the restriction map used for Mordell–Weil descent must accept all integral two-sections. It cannot be replaced by an argument requiring a rational nodal bisection. The geometric generic restriction argument uses Br(F̄₂(t))=0 by Tsen; Br(F₂(t)) is not asserted to vanish.

For a simple fibre isomorphism, a rational point on a singular component must lie in the smooth locus of the whole fibre, not merely in the component’s own smooth locus. A split I_r cycle has no terminal component, and a type IV fibre also requires the conductor argument. Their comparison is included explicitly rather than inferred from a terminal-component argument.

### Dependencies

Layers 1–3; unpointed and quasielliptic Picard adapters, minimal regular Jacobian models, local torsor comparison, rationality and constant-Picard criteria from NeronModelsAndSemistableAbelianVarietiesPartII §§2–5; the geometric-integrality and dense-open comparison of §4.1; numerical descent, intersection theory and geometric Tsen. The residue-field comparisons use the full-Picard hypotheses in §§4.4–4.11.

## Layer 5: fibre configurations and the first exclusions

The elliptic enumeration uses the rational-Jacobian completeness theorem; the quasielliptic enumeration is an independent component-count argument. The later eight-case reduction also needs the three additional Enriques exclusions.

### 5.1 Elliptic configurations on constant-Picard Enriques surfaces

Let Y/F₂ have constant full Picard scheme and let φ be an elliptic genus-one fibration on it. Assuming the rational-Jacobian completeness theorem under Exact supplier contracts, prove that its three rational-fibre types occur in the fourteen-entry list below. Nonexceptionality and the three Enriques exclusions are not assumptions of this enumeration. In the final three entries the additive fibre and E₄ are multiple and the nonsplit semistable fibre is simple. These are necessary possibilities, without an assertion that any is realized by an Enriques surface.

Apply Layer 4 rationality, constant Picard, point counts and the at-most-one semistable-or-supersingular restriction to the rational-Jacobian classification. Transfer types and residue-field smooth curves through the local comparison. Proving completeness is a separate supplier obligation; listing fourteen model equations alone does not discharge it. ([SCH23](#references), Proposition 11.1 and table (12), pp. 32–33 (the proposition begins on p. 32, the table is on p. 33); proof pp. 33–34)

The elliptic triples, with the fibre symbols understood as above, are:

| Additive or largest fibre | Second rational fibre | Third rational fibre |
| --- | --- | --- |
| II* | E4 | I1 |
| II* | E2 | Ĩ1 |
| III* | E4 | I2 |
| III* | E2 | Ĩ2 |
| III* | E4 | E4 |
| IV* | E3 | IV |
| IV* | E5 | III |
| I4* | E4 | E2 |
| I1* | E4 | I4 |
| I1* | E5 | IV |
| I8 | E4 | III |
| I2* | E4 | Ĩ2 |
| I3* | E4 | Ĩ1 |
| IV* | E4 | Ĩ2 |

*Needs:* [4.11](#411-constant-picard-of-the-jacobian); NeronModelsAndSemistableAbelianVarietiesPartII §3.11; [4.4](#44-simple-fibre-identification); [4.8](#48-at-most-one-semistable-or-supersingular-rational-fibre); [4.10](#410-the-auxiliary-jacobian-count-equals-the-enriques-fibre-count); NeronModelsAndSemistableAbelianVarietiesPartII §7.4.

### 5.2 Quasielliptic component sum

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` φ is quasielliptic; all geometric reducible fibres lie over the three rational points and are split as in NeronModelsAndSemistableAbelianVarietiesPartII §2.9.

For a quasielliptic fibration on a constant-full-Picard Enriques surface over F₂, r₀+r₁+r_∞=11. The possible symbols with at most nine components are II, III, I₂*, III*, II*, I₄*, with counts 1,2,7,8,9,9.

Use the supplier 2-torsion generic Pic⁰ and the vertical Picard rank formula ρ=2+Σ(r_a−1). Numerical contraction descent confines reducible fibres to rational points. Exclude I₀* by the rational-point argument and larger `I_{2n}*` by the component bound. ([SCH23](#references), Proposition 11.1 proof, p. 33)

*Needs:* [0.3](#03-enriques-numerical-and-cohomological-invariants); [2.10](#210-constant-and-split-picard-schemes); WeilConjectures WC.7 (`count_enriques_or_rational_genus_one`); NeronModelsAndSemistableAbelianVarietiesPartII §2.14; NeronModelsAndSemistableAbelianVarietiesPartII §2.9; NeronModelsAndSemistableAbelianVarietiesPartII §§4.8 and 4.16.

### 5.3 Quasielliptic configurations

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` φ is quasielliptic; all geometric reducible fibres lie over the three rational points and are split as in NeronModelsAndSemistableAbelianVarietiesPartII §2.9.

The rational-fibre type triple of a quasielliptic fibration in that setting is one of II*+II+II, III*+III+II, I₄*+II+II or I₂*+III+III, up to permutation of the rational base points.

Enumerate component counts adding to eleven from the six permitted symbols, using NeronModelsAndSemistableAbelianVarietiesPartII §§2–5 quasielliptic classification. Keep the two different symbols with nine components as separate cases. This component-count argument does not certify the elliptic candidate list. ([SCH23](#references), Proposition 11.1, p. 33)

The weighted component count gives the following four triples. Each entry includes all three rational fibres.

| First fibre | Second fibre | Third fibre |
| --- | --- | --- |
| II* | II | II |
| III* | III | II |
| I₄* | II | II |
| I₂* | III | III |

Here the component counts of II, III, I₂*, III*, II* and I₄* are respectively 1,2,7,8,9,9. The sum is eleven. For example 7+2+2=11 gives the last row; replacing one III by II gives ten and fails the rank calculation. This arithmetic does not identify scheme multiplicities.

*Needs:* [5.2](#52-quasielliptic-component-sum).

### 5.4 Forced multiple fibres

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. The fourteen-case elliptic list is exhaustive (rational-Jacobian completeness). Quasielliptic possibilities use the independent four-case enumeration.

For a nonexceptional constant-full-Picard Enriques Y/F₂, every IV, IV*, II* or I₁* fibre is multiple, assuming the fourteen-case elliptic classification is exhaustive.

In every relevant elliptic candidate a different fibre is semistable or supersingular and hence cannot be one of the two tame multiple fibres. The added IV* case still forces IV* and E₄ multiple. In the quasielliptic II* case use the simple-fibre exceptionality restriction. ([SCH23](#references), Proposition 11.1(i), p. 33)

*Needs:* [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [5.3](#53-quasielliptic-configurations); [1.11](#111-characteristic-two-tame-half-fibre-types); [2.16](#216-rational-tame-double-fibres); [1.19](#119-nonexceptional-quasielliptic-restriction).

### 5.5 Simple III* preliminary restriction

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. The fourteen-case elliptic list is exhaustive (rational-Jacobian completeness). Quasielliptic possibilities use the independent four-case enumeration.

A simple III* fibre on a nonexceptional constant-full-Picard Enriques Y/F₂ forces an elliptic fibration with rational-fibre configuration III*+E₄+E₄, subject to classification completeness.

Exclude quasielliptic simplicity by Layer 1. In the other two III* elliptic candidates the semistable fibre is simple, forcing III* to be multiple; only the two ordinary smooth fibres remain. ([SCH23](#references), Proposition 11.1(ii), p. 33)

*Needs:* [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [5.3](#53-quasielliptic-configurations); [1.19](#119-nonexceptional-quasielliptic-restriction); [1.11](#111-characteristic-two-tame-half-fibre-types); [2.16](#216-rational-tame-double-fibres).

### 5.6 Excluded rational two-section for exceptional-type half-fibres

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. The specified IV*, III* or II* fibre is multiple; no classification-completeness hypothesis is needed for this local exceptional-fibration restriction.

For a multiple IV*, III* or II* fibre on such Y, no (−2)-curve R has intersection one with its indecomposable divisor.

Since the full fibre is twice the indecomposable divisor, this intersection makes R a rational two-section. Apply the nonexceptional multiple-special restriction. ([SCH23](#references), Proposition 11.1(iii), p. 33)

*Needs:* [1.20](#120-nonexceptional-multiple-exceptional-type-restriction); [1.2](#12-2-curve-and-two-section-on-an-enriques-surface); [1.1](#11-half-fibre).

### 5.7 Three additional configuration exclusions

For a nonexceptional Enriques surface Y/F₂ with constant full Picard scheme, prove that no genus-one fibration has rational-fibre triple I₂* + E₄ + Ĩ₂, I₃* + E₄ + Ĩ₁, or IV* + E₄ + Ĩ₂.

This is a new proof target extending the treatment of SCH23 Proposition 11.1 and §§11–15, pp. 33–49. Exclude all three Enriques realizations using their multiple additive and E₄ fibres, simple nonsplit fibre, numerical lattice and partner half-fibres. Give a complete incidence argument for every branch, and justify each new fibration by the canonical-type theorem. For IV* + E₄ + Ĩ₂ the other half-fibre is smooth ordinary; the four-rational-points argument using a III or IV half-fibre in the other IV* cases does not apply. The model classification and the eight-case conclusion cannot serve as premises for this exclusion. ([SCH23](#references), Proposition 11.1 and table (12), pp. 32–34; IV* argument in Proposition 11.3, p. 37; Theorem 15.1, p. 49. The three-case exclusion is an additional proof obligation, not a theorem proved at these locators.)

**Checks.**

- A proof must exclude three Enriques realizations; it cannot infer nonexistence solely from a Jacobian model list.

*Needs:* [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [1.24](#124-partner-genus-one-fibration); [2.15](#215-descent-of-genus-one-fibrations); [5.6](#56-excluded-rational-two-section-for-exceptional-type-half-fibres).

### 5.8 Partner fibration over F₂

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. φ is any genus-one fibration; no candidate classification is needed for existence or descent of its partner.

Each genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has a partner fibration defined over F₂ with full fibre-class intersection four.

Apply the geometric nonexceptional partner theorem over F̄₂, then descend the fibration using the full-Picard descent package. Intersection is preserved by base change, so the degree remains four over F₂. ([SCH23](#references), Proposition 11.4, p. 38)

*Needs:* [1.24](#124-partner-genus-one-fibration); [2.15](#215-descent-of-genus-one-fibrations); [2.18](#218-finite-field-specialization-of-picard-descent).

### 5.9 Elimination of I₈

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

On a nonexceptional constant-full-Picard Enriques Y/F₂ there is no genus-one fibre of type I₈, once the fourteen-case classification and omitted-case exclusions are supplied.

Use the partner half-fibre and the degree-one incidence with a III half-fibre to force the partner configuration III+E₄+I₈. Enumerate the additional components and their nonnegative incidences. The two remaining incidence choices generate canonical-type I₃ or I₇ curves, hence fibrations outside the candidate table after both classification proofs. The nonexceptional hypothesis supplies the partner omitted in the printed statement. ([SCH23](#references), Proposition 11.2, pp. 34–35)

*Needs:* [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [5.3](#53-quasielliptic-configurations); [5.7](#57-three-additional-configuration-exclusions); [1.24](#124-partner-genus-one-fibration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [2.16](#216-rational-tame-double-fibres).

### 5.10 Elimination of II*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on such a nonexceptional constant-full-Picard Y/F₂ has a II* fibre, after both classification proofs.

It must be multiple. A partner half-fibre meets its unique multiplicity-one component once, leaving the E₈ subgraph vertical. A II* partner fibre is multiple; its additional component meets a component of multiplicity at least two, contradicting half-fibre intersection one. ([SCH23](#references), Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38))

*Needs:* [5.4](#54-forced-multiple-fibres); [5.7](#57-three-additional-configuration-exclusions); [1.24](#124-partner-genus-one-fibration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations).

### 5.11 No multiple I₄*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on such Y has a multiple I₄* fibre, after both classification proofs.

The partner half-fibre leaves D₈ vertical. With II* excluded, the additional partner component must complete another I₄*. Intersection at most two forces it disjoint from the original terminal component, producing an I₀* canonical-type curve. This contradicts the I₀* exclusion. ([SCH23](#references), Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38))

*Needs:* [5.10](#510-elimination-of-ii); [5.7](#57-three-additional-configuration-exclusions); [1.24](#124-partner-genus-one-fibration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); NeronModelsAndSemistableAbelianVarietiesPartII §2.14.

### 5.12 Elimination of IV*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on such Y has a IV* fibre, after classification completeness and the separate IV*+E₄+Ĩ₂ exclusion.

Work on the printed IV*+E₃+IV or IV*+E₅+III branch only. A partner leaves E₆ vertical; a IV* completion contradicts intersection one, and a simple III* completion has two ordinary half-fibres. Enumerate intersections with the other III/IV half-fibre, reject an I₈ curve, then force four distinct rational points on a descended P¹. The smooth ordinary other-half-fibre case is handled by [5.7](#57-three-additional-configuration-exclusions), not by this four-point argument. ([SCH23](#references), Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38))

*Needs:* [5.4](#54-forced-multiple-fibres); [5.5](#55-simple-iii-preliminary-restriction); [5.10](#510-elimination-of-ii); [5.9](#59-elimination-of-i); [5.7](#57-three-additional-configuration-exclusions); [1.24](#124-partner-genus-one-fibration); [2.14](#214-descent-of--2-curves); [2.16](#216-rational-tame-double-fibres); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations).

### 5.13 Elimination of IV

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on such Y has a IV fibre, after both classification proofs.

In the IV+I₁*+E₅ branch choose the partner half-fibre, with both additive fibres multiple. The remaining D₅ and A₂ vertical subgraphs either lie in different partner fibres, forcing two simple fibres, or in the same one. Include the missing same-fibre branch: after II*, IV* and I₈ are excluded, its simple I₄* completion places an A₂ on components of weights two and one. Intersection at least three contradicts the bound two. This uses the I₁* indecomposable fibre in the first intersection inequality, correcting the printed base-point slip. ([SCH23](#references), Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38))

*Needs:* [5.10](#510-elimination-of-ii); [5.12](#512-elimination-of-iv); [5.9](#59-elimination-of-i); [5.11](#511-no-multiple-i); [5.7](#57-three-additional-configuration-exclusions); [1.24](#124-partner-genus-one-fibration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [2.16](#216-rational-tame-double-fibres).

### 5.14 The eight residual configurations

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

Once classification completeness and [5.7](#57-three-additional-configuration-exclusions) hold, only eight rational-fibre configurations remain: elliptic I₄*+E₄+E₂, III*+E₄+I₂, III*+E₂+Ĩ₂, III*+E₄+E₄, I₁*+E₄+I₄; quasielliptic I₄*+II+II, III*+III+II, I₂*+III+III.

Remove I₈, II*, IV*, IV and the three extra candidates from the fourteen-plus-four list. The eight-case reduction depends on the fourteen-case completeness theorem and the three exclusions in §5.7. ([SCH23](#references), Proposition 11.4, p. 38)

After completeness and the three additional exclusions, and after the other exclusions in this layer, the list is

| Kind | Three rational fibres |
| --- | --- |
| elliptic | I₄* + E₄ + E₂ |
| elliptic | III* + E₄ + I₂ |
| elliptic | III* + E₂ + Ĩ₂ |
| elliptic | III* + E₄ + E₄ |
| elliptic | I₁* + E₄ + I₄ |
| quasielliptic | I₄* + II + II |
| quasielliptic | III* + III + II |
| quasielliptic | I₂* + III + III |

This is a conditional consequence of both classification proofs. Neither this table nor the finite-field nonexistence target is evidence for the missing three exclusions.

*Needs:* [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [5.3](#53-quasielliptic-configurations); [5.7](#57-three-additional-configuration-exclusions); [5.9](#59-elimination-of-i); [5.10](#510-elimination-of-ii); [5.12](#512-elimination-of-iv); [5.13](#513-elimination-of-iv).

### 5.15 Multiplicity restrictions in the residual table

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

Within the residual table after both classification proofs I₁* fibres are multiple, whereas I₄*, semistable I_n and nonsplit I₂ fibres are simple.

Use forced I₁* multiplicity, the multiple-I₄* exclusion and the tame characteristic-two half-fibre restrictions. Keep type and scheme multiplicity as separate data. ([SCH23](#references), Proposition 11.4, p. 38)

*Needs:* [5.14](#514-the-eight-residual-configurations); [5.4](#54-forced-multiple-fibres); [5.11](#511-no-multiple-i); [1.11](#111-characteristic-two-tame-half-fibre-types); [2.16](#216-rational-tame-double-fibres).

### Examples

The proposed extra triple I₂*+E₄+Ĩ₂ satisfies the point count: 15+4+6=25. Likewise I₃*+E₄+Ĩ₁ gives 17+4+4=25, and IV*+E₄+Ĩ₂ gives 15+4+6=25. Thus point counts cannot remove these cases. Their exclusions must use Enriques geometry.

For the printed IV* cases the other multiple fibre has type III or IV. A central rational component is forced to contain four distinct rational points. In IV*+E₄+Ĩ₂ the other half-fibre is ordinary smooth; it supplies no such rational component. This case belongs to 5.7 and cannot be discarded by the same argument.

In the IV exclusion, put the relevant D₅ and A₂ divisors in the same partner I₄* fibre as one of the branches. The labels at the shared edge have multiplicities two and one. The resulting intersection is at least three, while the partner half-fibre condition gives two. The contradiction uses these weighted divisors; forgetting their coefficients would give a different calculation.

### Dependencies

Layers 1–4; the exhaustive fourteen-case rational-Jacobian classification; quasielliptic component/rank theory; canonical-type reconstruction; and the separate three-configuration exclusion 5.7. The no-I₈, no-IV*, residual and later elimination arguments carry both classification prerequisites. The local prohibition on rational special two-sections does not require the classification.

## Layer 6: ten-curve lattices and the I₄* exclusion

First do the two exact lattice calculations over ℚ. Apply them geometrically with the specified curve incidences, then prove the first ten-curve exclusion and the independent opposite-tip argument before proving the second exclusion. This order avoids using the completed I₄* exclusion inside its own proof.

### 6.1 The two integral Gram models

The two explicit integer matrices have indices Fin 10 and are realized on the standard rational coordinate basis. No surface or geometric realization is assumed.

Define firstGram=N₁ and secondGram=N₂ on Fin 10 with the two ordered bases in [6.2](#62-first-ten-curve-lattice-discriminant) and [6.3](#63-second-ten-curve-lattice-discriminant). Construct firstLattice and secondLattice with IntegralLattice.ofGramMatrix and Pi.basisFun over Q, retaining its full Z-carrier. The matrices are symmetric and even, have determinant −4, and induce their displayed entries on the native carrier basis.

Enter the integer matrices rather than a new abstract lattice record. Their D₈ chain has edges (C₁,C₂),…,(C₅,C₆),(C₆,C₇),(C₆,C₈). N₁ adds R²=−2, R·C₄=R·F=1; N₂ has the orthogonal U block F′·F=1. Invoke native Gram constructor and basis-pairing theorem. Exact rational elimination verifies both inverses against (14),(16), determinant −4 and rank eight modulo two. The latter with determinant absolute value four proves Smith factors 1⁸,2,2. Verify the dual norm coefficients and the fifteen incidence cosets with the native half-norm convention. ([SCH23](#references), §12, matrices (14), (16), author pp. 41–44)

Its API consists of the following facts.

- `firstGram`: N₁ in basis (C₁,…,C₈,R,F), with the explicit entries stated above.

- `secondGram`: N₂ in basis (C₁,…,C₈,F′,F), D₈(−1)⊕U.

- `firstLattice`: The native IntegralLattice.ofGramMatrix of N₁ on Q¹⁰.

- `secondLattice`: The native IntegralLattice.ofGramMatrix of N₂ on Q¹⁰.

- Both displayed matrices are symmetric; their symmetry proofs are constructor arguments.

- det N₁=−4.

- det N₂=−4.

- The native firstLattice.IsEven condition holds.

- The native secondLattice.IsEven condition holds.

**Checks.**

- firstGram 8 3=1.

- firstGram 8 9=1.

- firstGram 9 9=0.

- secondGram 8 8=0 and secondGram 8 9=1.

- secondGram 8 3=0: it does not have the R-to-C₄ edge of N₁.

- secondGram 5 6=secondGram 5 7=1.

The complete matrices can be specified sparsely without suppressing entries. In the order C₁,…,C₈, use diagonal −2 and off-diagonal +1 exactly at

```text
(1,2), (2,3), (3,4), (4,5), (5,6), (6,7), (6,8)
```

and their transposes. All other entries of the eight-by-eight block are zero. For N₁ append R,F with R²=−2, F²=0, R·C₄=R·F=1 and all other new entries zero. For N₂ append F′,F with F′²=F²=0, F′·F=1 and both orthogonal to the eight-by-eight block. The Lean indices are zero-based, so C₄ has index 3 and R or F′ has index 8.

In addition to the six entry Checks above, check the native lattices separately: the carrier-basis pair at indices (8,3) is one for the first and zero for the second; the last basis vector has square zero in both; and the two off-diagonal fork entries (5,6) and (5,7) are one. For both matrices compute determinant −4 and rank eight modulo two, whence the Smith factors are eight ones and two twos. The rational inverse has denominator two, not four. These matrix Checks distinguish N₁ from N₂. For each native carrier, additionally use these membership Checks.

- The standard vector e₁ lies in the carrier, with integer coordinates (1,0,…,0) and norm −2.
- The ambient vector e₁/2 does not lie in the carrier, which is the ℤ-span of the standard rational basis: its first coordinate is 1/2, and its norm is −1/2. Allowing it would violate integrality.
- The vectors e₁+e₂ and −2e₁ lie in the carrier, with first two coordinates (1,1) and (−2,0), and norms −2 and −8. Integer addition and scalar multiplication stay in the carrier; arbitrary rational scalar multiplication does not.

*Needs:* `TauCeti.IntegralLattice.ofGramMatrix`; `TauCeti.IntegralLattice.integralForm_ofGramMatrix_apply`; Mathlib `Pi.basisFun`.

The basis-pairing recovery in both models uses `TauCeti.IntegralLattice.integralForm_ofGramMatrix_apply`, `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, rather than an admitted wrapper. The entry, inverse, denominator and mod-two-rank computations above are README Checks.

### 6.2 First ten-curve lattice discriminant

Let Y/k be geometric Enriques. Assume a simple I₄* fibre C₀+C₁+2(C₂+⋯+C₆)+C₇+C₈, with affine D₈ edges and a (−2)-curve R meeting only C₄ once, with simple normal crossings. Choose a half-fibre F of this pencil. The subgroup S generated by (C₁,…,C₈,R,F) has Gram matrix N₁ from 6.1. It has determinant −4, invariant factors 1⁸,2,2 and index two in unimodular Num(Y). The vector discriminant class has full norm −1 and the two spinor classes full norm −2; their native half-norm values are 1/2,0,0 modulo ℤ.

Construct the integral Gram lattice using the native ofGramMatrix, compute determinant, inverse and Smith data exactly, and compare the chosen geometric classes with that basis. Use the native discriminant cardinality and index-square formula for the embedding in Num(Y). Translate full norm modulo 2Z to the built half-norm modulo Z; do not define another discriminant form. ([SCH23](#references), §12 matrix(14), pp. 41–42)

The native headline `firstLattice_discriminant_group` asserts an additive equivalence of its discriminant group with ZMod 2 × ZMod 2. The native headline `firstLattice_isotropic_card` asserts evenness and exactly three isotropic classes, including zero; the two nonzero isotropic classes are the spinors.

**Checks.**

- `N₁^{-1}` must match all entries of matrix (14); negative full norm −2 has native q=0.

Fix C₀=2F−C₁−2(C₂+⋯+C₆)−C₇−C₈. The full squared norms in the dual basis are

```text
(C₁*)²=−1, (C₇*)²=(C₈*)²=−2,
(R*)²=0, (F*)²=−2,
C₈*·R*=0, C₈*·F*=2, R*·F*=1.
```

The class of C₁* is the anisotropic vector class: its native q-value is (−1)/2≡1/2 modulo ℤ. The two spinor classes have full norm −2 and q-value −1≡0. Only the latter can generate an even index-two intermediate lattice. A test that compares q directly with the full norm would incorrectly call all three classes isotropic.

*Needs:* [0.4](#04-the-enriques-numerical-lattice); `TauCeti.IntegralLattice.discriminantQuadraticMap`; `TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`; [6.1](#61-the-two-integral-gram-models).

### 6.3 Second ten-curve lattice discriminant

Let Y/k be geometric Enriques with affine D₈ curves C₀,…,C₈ and a further (−2)-curve R such that R·C₀=2, R·C₂=1 and the other intersections with C_i vanish, with simple normal crossings away from R,C₀. Assume the canonical-type divisors obtained by replacing C₀ with R and by keeping C₀ give simple I₄* fibres of two pencils with half-fibres F′,F satisfying F·F′=1. The subgroup S generated by (C₁,…,C₈,F′,F) has Gram matrix N₂ from 6.1, namely D₈(−1)⊕U. Its determinant is −4, its invariant factors are 1⁸,2,2 and Num(Y)/S has order two. Its three nonzero discriminant classes are one anisotropic vector class and two isotropic spinor classes.

Use the native Gram lattice, exact inverse (16), Smith/cardinality and even-overlattice classification. Determine the two allowed index-two even extensions. The generic degree part is split off separately and is not included in this order-two quotient. ([SCH23](#references), §12 matrix(16), p. 43)

The native headlines `secondLattice_discriminant_group` and `secondLattice_isotropic_card` give the same group and three isotropic classes, including zero, and assert evenness of the second model.

*Needs:* [0.4](#04-the-enriques-numerical-lattice); [6.2](#62-first-ten-curve-lattice-discriminant); `TauCeti.IntegralLattice.discriminantQuadraticMap`; [6.1](#61-the-two-integral-gram-models).

### 6.4 Generic degree-zero Picard quotient

k is algebraically closed; Y/k is a geometric Enriques surface carrying the first or second ten-curve configuration of 6.2 or 6.3, with its genus-one fibration and ordered classes. For the generic Pic⁰ quotient and its splitting, Y is classical, so its canonical line bundle is a difference of half-fibres and restricts trivially.

For either ten-curve setting, let T be the two-section R in the first case or the integral half-fibre F′ in the second. The map `L↦(L−(L·F)T)|_{Y_K}` induces Num(Y)/⟨C₁,…,C₈,T,F⟩≅Pic⁰(Y_K), of order two. Restriction splits Pic(Y_K)=Pic⁰(Y_K)⊕Z[T_K], with degree image 2Z.

Import surjectivity of restriction on the regular surface and its vertical-divisor kernel from NeronModelsAndSemistableAbelianVarietiesPartII §§2–5. The canonical class is a difference of half-fibres and restricts trivially, so the map descends through Num. Prove kernel exactly S and use T to remove the degree component. The second case source prints Pic in place of Pic⁰; retaining the infinite degree factor would invalidate the index-two assertion. ([SCH23](#references), Proposition 12.3 proof, p. 43)

*Needs:* [1.10](#110-tame-double-fibres-and-canonical-bundle); [6.2](#62-first-ten-curve-lattice-discriminant); [6.3](#63-second-ten-curve-lattice-discriminant); [4.1](#41-jacobian-of-an-enriques-genus-one-fibration).

### 6.5 Two-section of square zero or minus two

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

The nonzero class of the order-two generic Pic⁰ quotient is represented by an integral two-section R̃ with R̃²=0 or −2 and Num(Y)=S+ZR̃, defined over F₂ in the two configurations.

Twist the chosen degree-two line bundle by the nontrivial Pic⁰ class, use Riemann–Roch on the genus-one generic curve and close its divisor in Y. Apply geometric degree-two reducibility while preserving that quotient class, then descend the resulting curve/fibration. Neither R̃≅P¹ nor R̃²=−2 is assumed. ([SCH23](#references), Proposition 12.2 proof, pp. 41–42)

*Needs:* [6.4](#64-generic-degree-zero-picard-quotient); [1.26](#126-enriques-reducibility-and-its-two-section-application); [2.14](#214-descent-of--2-curves); [2.15](#215-descent-of-genus-one-fibrations); [2.16](#216-rational-tame-double-fibres); [2.18](#218-finite-field-specialization-of-picard-descent).

### 6.6 Incidences of the generating two-section

k is algebraically closed; Y/k is a geometric Enriques surface carrying the first or second ten-curve configuration of 6.2 or 6.3, with its ordered classes; the degree-zero restriction map uses its integral two-section T. For [6.6](#66-incidences-of-the-generating-two-section) and [6.7](#67-square-zero-two-section-calculation), R̃ represents the nonzero even-overlattice coset and has square zero or −2, as specified.

For the generating two-section R̃ in either ten-curve setting, precisely two of (R̃·C₀,…,R̃·C₈) are one and all others zero. The pairs are {0,8},{1,7} for one spinor class and {0,7},{1,8} for the other. In the first setting independent terminal swaps preserve S and allow {0,8}; in the second only the {7,8} swap is used, leaving {0,8} and {1,8}.

Enumerate all fifteen nonnegative incidence vectors of weighted degree two for the affine D₈ fibre. Map each through the inverse Gram matrix into S*/S; the zero and vector classes are excluded by generation and evenness. Check the actions of the terminal swaps on the actual basis, using C₀=2F−C₁−2(C₂+⋯+C₆)−C₇−C₈. A congruence R̃≡C₈* alone does not select the required incidence pair. Perform the finite enumeration and symmetry reduction explicitly before using the square calculation. ([SCH23](#references), proof of Proposition 12.2, p. 42; proof of Proposition 12.3, pp. 43–44)

Let a_i=R̃·C_i. Since the affine D₈ fibre is simple, its weighted incidence equation is a₀+a₁+2(a₂+⋯+a₆)+a₇+a₈=2. Its fifteen solutions consist of five single interior hits, four double terminal hits, and six pairs of distinct terminal hits. The spinor-class test leaves the four pairs

```text
{0,8}, {1,7};     {0,7}, {1,8}.
```

The semicolon separates the two spinor classes. In N₁ the terminal swaps allow the representative {0,8}. In N₂ preserve the marked F′ incidence: swapping the right tips reduces to {0,8} or {1,8}, and both branches are retained. An unmarked affine-graph reversal is not automatically an isometry preserving that marked divisor.

*Needs:* [6.2](#62-first-ten-curve-lattice-discriminant); [6.3](#63-second-ten-curve-lattice-discriminant).

### 6.7 Square-zero two-section calculation

k is algebraically closed; Y/k is a geometric Enriques surface carrying the first or second ten-curve configuration of 6.2 or 6.3, with its ordered classes; the degree-zero restriction map uses its integral two-section T. For [6.6](#66-incidences-of-the-generating-two-section) and [6.7](#67-square-zero-two-section-calculation), R̃ represents the nonzero even-overlattice coset and has square zero or −2, as specified.

After the first-setting symmetry reduction, a square-zero generating two-section has class C₈*+nR*+F* with n=R̃·R≥0. The inverse matrix gives its square 2n, hence n=0 and R̃ is disjoint from R.

Use the normalized incidences to express the vector in the dual basis. Expand its square with entries C₈*²=F*²=−2, R*²=C₈*·R*=0, C₈*·F*=2, R*·F*=1. Then nonnegative intersection zero gives disjoint support. ([SCH23](#references), Proposition 12.2 proof, p. 42)

**Checks.**

- This calculation is made only after the symmetry normalization, not from the spinor congruence alone.

For R̃=C₈*+nR*+F*, the displayed pairings give

```text
R̃² = −2 + n²·0 − 2 + 2(0+2+n) = 2n.
```

For the square-zero two-section this implies n=0, so R̃ and R are disjoint. The vanishing of (R*)² is essential; confusing R* with R would introduce an erroneous quadratic term. No identity is inferred by treating a dual basis as an orthogonal basis.

*Needs:* [6.6](#66-incidences-of-the-generating-two-section); [6.2](#62-first-ten-curve-lattice-discriminant).

### 6.8 First forbidden ten-curve configuration

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No nonexceptional constant-full-Picard Enriques Y/F₂ has ten (−2)-curves C₀,…,C₈,R with affine D₈ incidence and R meeting only C₄ once, all intersections simple normal crossings, after both classification proofs.

Use the first lattice and generic Pic⁰ quotient to choose the generating two-section. In square −2 its normalized incidences create an I₈ canonical-type curve, already excluded. In square zero the dual-basis calculation gives R̃·R=0, producing a simple III* partner fibration. An integral half-fibre of the original I₄* fibration has exactly two smooth rational points in either residual I₄* configuration. The two multiple partner half-fibres consume those points while the degree-one intersection with R gives a third, a contradiction. Check distinctness and smoothness of these intersections. ([SCH23](#references), Proposition 12.2 and dual graph (13), p. 41; proof pp. 41–42)

*Needs:* [6.2](#62-first-ten-curve-lattice-discriminant); [6.4](#64-generic-degree-zero-picard-quotient); [6.5](#65-two-section-of-square-zero-or-minus-two); [6.6](#66-incidences-of-the-generating-two-section); [6.7](#67-square-zero-two-section-calculation); [5.9](#59-elimination-of-i); [5.14](#514-the-eight-residual-configurations); [5.8](#58-partner-fibration-over-f); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [2.16](#216-rational-tame-double-fibres); [2.14](#214-descent-of--2-curves); [1.25](#125-intersection-of-distinct-genus-one-fibrations).

### 6.9 The independent opposite-tip argument

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

Under the residual table after both classification proofs and [6.8](#68-first-forbidden-ten-curve-configuration), an I₄* fibration cannot have a partner half-fibre F with F·C₀=F·C₈=1 and all other F·C_i=0.

The vertical chain C₁+⋯+C₇ can complete only to I₄* or III*. In the I₄* case the extra end components force an I₀* canonical-type curve by the full-fibre intersection-four bound. In the III* case its new middle component meets C₄ once and the same bound makes it disjoint from C₀ and C₈, giving the first forbidden ten-curve graph. This branch uses neither [6.10](#610-second-forbidden-ten-curve-configuration) nor the completed no-I₄* theorem. ([SCH23](#references), §12, proof of Proposition 12.1, opposite-terminal branch, author p. 40)

*Needs:* [5.14](#514-the-eight-residual-configurations); [5.15](#515-multiplicity-restrictions-in-the-residual-table); [5.8](#58-partner-fibration-over-f); [6.8](#68-first-forbidden-ten-curve-configuration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); NeronModelsAndSemistableAbelianVarietiesPartII §2.14.

### 6.10 Second forbidden ten-curve configuration

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No such Y has affine D₈ curves C₀,…,C₈ and another (−2)-curve R with R·C₀=2, R·C₂=1 and all other R·C_i=0. Require simple normal crossings away from the pair R,C₀; impose only intersection length two on that pair.

The two I₄* subconfigurations give fibrations with fibre intersection four and half-fibres F,F′ meeting once. Use the second lattice, generic Pic⁰ quotient and reducibility to get the two-section. Enumerate spinor incidences. Square −2 creates I₈. Square zero is excluded by the incidence branch in the I₄* proof having F·C₀=F·C₈=1; that branch uses only the first ten-curve exclusion and no invocation of this second exclusion. Extract this branch as an independent lemma to avoid circularity. ([SCH23](#references), Proposition 12.3 and dual graph (15), p. 42; proof pp. 43–44)

For the remaining incidence pair {1,8}, relabel the unmarked original affine D₈ fibre by exchanging C₀ and C₁ before applying 6.9 to the square-zero two-section as a partner half-fibre. This uses the geometric lemma for the original pencil, not an assertion that the relabelling preserves the marked F′ in the second lattice.

*Needs:* [6.3](#63-second-ten-curve-lattice-discriminant); [6.4](#64-generic-degree-zero-picard-quotient); [6.5](#65-two-section-of-square-zero-or-minus-two); [6.6](#66-incidences-of-the-generating-two-section); [6.8](#68-first-forbidden-ten-curve-configuration); [5.9](#59-elimination-of-i); [5.14](#514-the-eight-residual-configurations); [5.8](#58-partner-fibration-over-f); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [6.9](#69-the-independent-opposite-tip-argument); [1.25](#125-intersection-of-distinct-genus-one-fibrations).

### 6.11 Six I₄* half-fibre incidence cases

The affine D₈ graph is numbered C₀,…,C₈, with weights (1,1,2,2,2,2,2,1,1). The nonnegative integer incidence vector has weighted sum two. This finite arithmetic enumeration makes no geometric-existence claim.

For a simple I₄* fibre with weights (1,1,2,2,2,2,2,1,1), a partner half-fibre of full-fibre degree two has fifteen nonnegative incidence vectors in six graph-symmetry orbits: a single one at C₂,C₃ or C₄; ones at {C₀,C₁} or {C₀,C₈}; or a two at C₀.

Enumerate weighted-degree-two nonnegative integral vectors. Act by swaps of the two fork tips and reversal of the D̃₈ chain, an order-eight group. Verify every vector lies in exactly one of the six representative orbits; this is arithmetic and does not assert realizability of the vectors. ([SCH23](#references), Proposition 12.1 proof, pp. 38–40)

The weighted-incidence set has fifteen elements; this arithmetic count is a README target on nonnegative integer vectors. Since every weight is at least one and the total is two, each entry is automatically in {0,1,2}. This bound makes the finite carrier equivalent to the nonnegative integer enumeration; the six symmetry orbits are the stronger geometric interface specified above.

*Needs:* finite nonnegative integer vectors, weighted sums and graph permutations.

### 6.12 Elimination of I₄*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has an I₄* fibre, after both classification proofs.

The fibre is simple. Use the six incidence orbits: middle C₄ creates I₈; C₃ creates an I₄ contradiction or too-large intersection; C₂ completions give I₈/I₄ or the first ten-curve graph; fork-tip pair creates I₀*; opposite-tip pair reduces to the first forbidden graph; a double terminal incidence reduces to the second forbidden graph. Separate the opposite-tip square-zero branch before invoking the second ten-curve exclusion. Every generated canonical-type curve is converted to a fibration through Layer 1 and compared with the residual list after both classification proofs. ([SCH23](#references), Proposition 12.1, p. 38; proof pp. 38–40 (it uses Propositions 12.2 and 12.3, pp. 41–44))

*Needs:* [6.11](#611-six-i-half-fibre-incidence-cases); [6.8](#68-first-forbidden-ten-curve-configuration); [6.10](#610-second-forbidden-ten-curve-configuration); [5.9](#59-elimination-of-i); [5.14](#514-the-eight-residual-configurations); [5.15](#515-multiplicity-restrictions-in-the-residual-table); [5.8](#58-partner-fibration-over-f); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [6.9](#69-the-independent-opposite-tip-argument); NeronModelsAndSemistableAbelianVarietiesPartII §2.14.

### Examples

On U, a basis vector is isotropic, but its sum with the other basis vector has square two. Thus the second Gram matrix really contains a hyperbolic plane and is indefinite. In the first matrix the added R meets C₄; setting this entry to zero would change the inverse and invalidate the dual-coordinate square calculation.

The native discriminant map sends full norm −1 to 1/2 and full norm −2 to zero in ℚ/ℤ. Its target has no chosen rational representative; −1 and zero represent the same class there. This is the normalization used when passing from a geometric unimodular index-two overlattice to one of the two spinor classes.

For the I₄* incidence equation, the five interior single-hit vectors form orbits represented by C₂,C₃,C₄, of sizes two, two and one. Distinct terminal pairs split into the two same-fork pairs and four opposite-fork pairs; double terminal hits form an orbit of size four. Hence the six orbit sizes are 2,2,1,2,4,4, totaling fifteen. This computation concerns possible intersection numbers; a fibration realizing each vector is a further geometric assertion.

### Dependencies

Layers 0–5, including both classification proofs where the residual list or no-I₈ is used; generic restriction and the narrow coset-preserving degree-two theorem; native lattice, discriminant and even-overlattice interfaces; canonical-type reconstruction and labelled graph descent. The first forbidden graph precedes the independent opposite-tip argument, which precedes the second forbidden graph and the completed I₄* exclusion.

## Layer 7: III* exclusions and restricted fibrations

Exclude multiple III* before simple III*. The final restricted-configuration theorem is an arbitrary-characteristic geometric statement and uses the characteristic-independent partner theorem.

### 7.1 Elimination of multiple III*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has a multiple III* fibre, after both classification proofs.

A partner half-fibre intersects its sole chosen weight-one terminal component, leaving E₇ vertical; the partner has another III* fibre. With the affine E₇ numbering of SCH23 figure (17) and new terminal C₀′, the primitive I₂* divisor is D=C₀+C₀′+C₂+C₅+2(C₁+C₃+C₄). It has D·C₆=1, so its full fibre is 2D: a simple full fibre would have odd intersection with C₆, whereas every full fibre class on this classical surface is twice an integral half-fibre class. The auxiliary fibration has two further III fibres, exactly one multiple by §1.10. Keep their primitive divisors C₇+C₇′ and R+R′ separate from their full fibres. Use the first forbidden ten-curve graph to exclude C₆·R=1 and C₆·R′=1. Since C₆·(2D)=2, positivity then forces the incidences with R,R′ to be 0,2 up to interchange, and forces this III fibre to be simple; the C₇+C₇′ fibre is double. The zero incidence makes R vertical for the partner. The partner III* is then multiple and the half-fibre intersection one equals two, a contradiction. ([SCH23](#references), Proposition 13.1, pp. 44–45; SCH23 lines 1993–2022)

**Checks.**

- In the displayed I₂* divisor the only component meeting C₆ is C₅, with coefficient one, so D·C₆=1 and (2D)·C₆=2. Calling D a simple full fibre contradicts evenness of full-fibre intersections.
- A classical pencil has two double fibres. The double I₂* therefore leaves one double and one simple III fibre; calling both III fibres half-fibres would give three double fibres.
- The simple III pair has primitive and full intersection 0+2=2 with C₆. Doubling that pair would give 4, contradicting C₆·(2D)=2; exchanging R and R′ gives 2+0=2 and the same conclusion.

*Needs:* [5.14](#514-the-eight-residual-configurations); [5.8](#58-partner-fibration-over-f); [6.8](#68-first-forbidden-ten-curve-configuration); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [5.5](#55-simple-iii-preliminary-restriction); [1.10](#110-tame-double-fibres-and-canonical-bundle).

### 7.2 Four simple III* half-fibre cases

The affine E₇ graph has the numbering of SCH23 figure (17), weights (1,2,2,3,4,3,2,1), and nonnegative integer incidence vector of weighted sum two.

For a simple III* fibre numbered as in (17) with weights (1,2,2,3,4,3,2,1), a partner half-fibre of degree two has six nonnegative incidence vectors in four symmetry orbits: one at C₂; ones at C₀,C₇; one at C₁; or two at C₀.

Enumerate the six degree-two vectors and identify them under the graph reversal C₀↔C₇, C₁↔C₆, C₃↔C₅. Record the fixed C₂ case independently from the C₁/C₆ orbit. ([SCH23](#references), Proposition 13.2 proof, pp. 45–47)

The weighted-incidence set has six elements; the bound on entries follows from positivity of the displayed weights. The four-orbit assertion additionally records the indicated affine-graph involution.

*Needs:* finite nonnegative integer vectors, weighted sums and graph permutations.

### 7.3 Elimination of simple III*

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

No genus-one fibration on such Y has a simple III* fibre, after both classification proofs.

In the C₂ branch the completion contributes intersection at least eight to a pair with bound four. The opposite terminal branch produces the first forbidden ten-curve graph. In the C₁ branch rule out I₄* and III* completions, leaving I₂*; degree-one extra incidence creates I₆ and degree-zero forces another forbidden graph. For the double-terminal branch the new terminal curve forms a III pair and a further I₂* fibration. Track which fibres are simple or multiple and use the already proved multiple-III* exclusion; the final constructed simple III* fibre has intersection two with a distinct fibration, below the minimum four. Import the distinct-fibration lower bound with full versus half-fibre normalization. ([SCH23](#references), Proposition 13.2, pp. 45–47)

*Needs:* [7.2](#72-four-simple-iii-half-fibre-cases); [7.1](#71-elimination-of-multiple-iii); [6.12](#612-elimination-of-i); [6.8](#68-first-forbidden-ten-curve-configuration); [5.14](#514-the-eight-residual-configurations); [5.15](#515-multiplicity-restrictions-in-the-residual-table); [5.8](#58-partner-fibration-over-f); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [5.5](#55-simple-iii-preliminary-restriction); [1.25](#125-intersection-of-distinct-genus-one-fibrations).

### 7.4 Final two-configuration impossibility

k is algebraically closed; Y/k is a geometric Enriques surface. Y is classical. Every genus-one fibration has one of the two stated reducible-fibre configurations, including the stated multiple-fibre conditions. No characteristic-two or finite-field hypothesis is imposed.

Over any algebraically closed field of any characteristic, no classical Enriques surface has every genus-one fibration restricted to reducible-fibre configurations I₁*+I₄ with I₁* multiple, or I₂*+III+III with exactly two multiple fibres.

In characteristic two the exceptional-fibration characterization excludes exceptionality because neither allowed configuration contains a special double IV*, III* or II*. Then the general partner theorem applies. Outside characteristic two its extra-special affine E₈ exception cannot occur. No characteristic-two proposition is invoked universally. For an I₁* fibration the partner completion either contradicts half-fibre intersection one or yields a IV* canonical-type curve. Then exclude a multiple I₂* by an I₀* completion. Finally all I₂* fibres are simple and both III fibres multiple; the horizontal components of two partner III fibres together with those of the original pair produce an I₄ canonical-type curve, outside the allowed global restrictions. ([SCH23](#references), Proposition 14.1, pp. 47–49; [ESB21](#references), §1, Theorems 1.1–1.3, pp. 1–3)

*Needs:* [1.23](#123-every-half-fibre-has-a-partner-cossecdolgachev); [1.17](#117-conductrix-and-exceptionality); [1.3](#13-curves-of-canonical-type-on-an-enriques-surface-induce-genus-one-fibrations); [1.10](#110-tame-double-fibres-and-canonical-bundle); [1.18](#118-special-double-fibre-characterization-of-exceptionality); [1.21](#121-the-extra-special-affine-e-type).

### Examples

For the III* weights (1,2,2,3,4,3,2,1), the weighted-degree-two solutions are the three single hits at C₁,C₂,C₆, the two double hits at C₀,C₇, and the terminal pair {C₀,C₇}. Reversal pairs C₁ with C₆ and C₀ with C₇ while fixing C₂ and the terminal-pair vector, giving four orbits of sizes 2,1,2,1.

If a newly constructed pencil has full-fibre intersection two with another distinct pencil, it contradicts the lower bound four. This final contradiction uses full fibres on both sides; replacing one by its half-fibre would lose a factor of two. In the no-multiple-III* argument a multiple partner component instead yields the incompatible half-fibre equality 1=2.

### Dependencies

Layers 0–6, both classification proofs, the first ten-curve exclusion, the completed no-I₄* theorem, and the characteristic-independent partner theorem. The restricted geometric endpoint uses no claim that every algebraically closed ground field has characteristic two.

## Layer 8: lifting and the two nonexistence theorems

Compute tangent cohomology and prove supersingular nonlifting separately. The differential obstruction applies only in the exceptional classical branch. The final finite-field theorem also needs the configuration proofs of Layers 5–7.

### 8.1 Tangent cohomology of Enriques surfaces

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For geometric Enriques Y in characteristic two, (h⁰(Θ_Y),h¹(Θ_Y),h²(Θ_Y)) is (1,12,1) if Y is exceptional or supersingular, and (0,10,0) otherwise.

Classical vector fields are characterized by ESB Proposition 2.8(6); the ordinary and supersingular values of h⁰(Θ_Y), which DI21 Proposition 7.1 quotes from the literature, are part of this target. Serre duality identifies h⁰ and h². Riemann–Roch gives χ(Θ_Y)=−10, so h¹=10+2h⁰. The printed +10 is a sign typo, not the value used here. ([DI21](#references), §7, Proposition 7.1 and proof, p. 23; [ESB21](#references), §2, Proposition 2.8(6) and proof, pp. 6–7)

*Needs:* §1.17a; [0.3](#03-enriques-numerical-and-cohomological-invariants); [1.17](#117-conductrix-and-exceptionality); [1.12](#112-ordinary-enriques-surfaces); [1.14](#114-supersingular-enriques-surfaces); SchemeAndStackFoundations, §§2.6 and 2.20; SchemeAndStackFoundations, §§5.9–5.10.

### 8.2 Supersingular Enriques surfaces do not lift to W₂

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two. Pic⁰(Y/k)=Pic^τ(Y/k)≅α₂.

A supersingular geometric Enriques surface over an algebraically closed field of characteristic two has no flat proper W₂(k)-lift.

Use b₁=0 and h¹(O_Y)=h²(O_Y) in DI Theorem 4.3 to get the relative Picard flatness condition. Pic⁰_red=0, so a W₂-lift would induce a finite flat lift of α₂. Apply gap:finite-local-group-w2-nonlifting to L=α₂; its Hopf-algebra obstruction contradicts such a lift. Relative Picard flatness and its finite identity-component specialization use gap:picard-flatness-betti. ([DI21](#references), §4, Proposition 4.2 and Theorem 4.3, pp. 15–17; Theorem 7.2 proof, p. 24)

*Needs:* [1.14](#114-supersingular-enriques-surfaces); [0.3](#03-enriques-numerical-and-cohomological-invariants); [2.3](#23-relative-numerical-invariants); AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1; SchemeAndStackFoundations, §§4.1–4.6; gap:finite-local-group-w2-nonlifting; gap:picard-flatness-betti.

### 8.3 Characteristic-two Enriques lifting criterion

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For an Enriques surface over an algebraically closed field k of characteristic two, a flat proper W₂(k)-lift exists exactly when the surface is neither exceptional nor supersingular.

For supersingular Y use [8.2](#82-supersingular-enriques-surfaces-do-not-lift-to-w): Pic⁰=α₂ gives a finite-flat group obstruction. This branch cannot use DI Theorem 6.1, which requires the canonical bundle to have exact order two. For exceptional classical Y set L=ω_Y(2C) and use the differential sequence of §1.17a. Its dual and H⁰(I_W(−2C))=0 identify H⁰(L) with H⁰(Θ_Y), of dimension one by §8.1. Also L⊗ω_Y=O_Y(2C) has h⁰=1 by §1.17a. Choose a sufficiently divisible ample divisor H, hence semiample: C≠0 gives L·H=2C·H>0, and L⊗ω_Y is twice the class C. Thus all hypotheses of DI Theorem 6.1 hold, including ω_Y of exact order two and equality of the two section dimensions. Apply gap:differential-w2-nonlifting for the general Frobenius/de Rham nonlifting criterion. Otherwise [8.1](#81-tangent-cohomology-of-enriques-surfaces) gives h²(Θ)=0; formal smooth deformation over W(k) supplies a W₂-lift. These are the three branches of DI Theorem 7.2. ([SCH23](#references), Theorem 5.2, p. 14; [DI21](#references), §7, Proposition 7.1 and Theorem 7.2, pp. 23–24; §6, Theorem 6.1, pp. 20–22)

*Needs:* §1.17a; [1.17](#117-conductrix-and-exceptionality); [1.13](#113-classical-enriques-surfaces); [1.14](#114-supersingular-enriques-surfaces); SchemeAndStackFoundations, §§4.1–4.6; SchemeAndStackFoundations, §§2.6 and 2.20; [8.1](#81-tangent-cohomology-of-enriques-surfaces); [8.2](#82-supersingular-enriques-surfaces-do-not-lift-to-w); gap:differential-w2-nonlifting.

### 8.3a Characteristic-zero lifting after a finite Witt extension

For every geometric Enriques surface Y/k in characteristic two, prove that there is a finite extension V of W(k), a complete DVR with residue field k, and a smooth proper projective V-scheme with special fibre Y. Together with EnriquesSurfaces E1a in characteristic greater than two, this gives the finite-Witt-extension lifting theorem in every positive characteristic. Thus the miniversal deformation formally lifts to characteristic zero (CDL2021, 2024 draft Theorem 5.11.5, printed pp. 610–611; CDL2021 lines 28665–28696).

Prove this independently of §8.4. The Enriques deformation calculation of CDL2021 Theorem 5.11.4 supplies the characteristic-zero branch in characteristic two; its construction, rather than the regularity conclusion of §8.4, is part of this target. Lift an ample line bundle after the finite extension using the Enriques polarized deformation argument, retaining compatible smooth proper levels Y_n over V/(π^(n+1)) and line bundles L_n with ample L₀. Apply AdicSpacesPartIII F0.3 to obtain the proper formal scheme and its invertible sheaf, and F0.8's grothendieck-algebraization with its ample-line conclusion to construct the projective V-scheme and line bundle. The flatness and smoothness comparisons in the supplier contract make this algebraization smooth over V. The ramified base is essential; this does not imply a W₂(k)-lift.

**Checks.**

- In the unobstructed branch V=W(k) and the unpolarized formal ring is W(k)[[t₁,…,t₁₀]], of absolute dimension eleven.
- For a supersingular surface no W₂(k)-lift exists, while a ramified characteristic-zero lift does; the two assertions concern different bases.
- For V=W(k)[π]/(π²−p), any W(k)-algebra map V→W₂(k) with π reducing to zero would have π² mapping to zero but p mapping to nonzero p, so the ramified lift cannot be restricted in that way.
- The compatible tower (P¹ over V/(π^(n+1)),O(1)) algebraizes to (P¹_V,O(1)), with line degree one at levels zero and one. Taking O(1) at level zero and O(2) at level one fails compatibility since their restrictions have degrees one and two; properness of the levels alone cannot replace the compatible ample line.

*Needs:* §§0.2–0.4 and 8.1 for Enriques coherent and tangent invariants; the polarized Enriques characteristic-zero deformation construction of CDL2021 Theorems 5.11.4–5.11.5, proved in this target; SchemeAndStackFoundations §§4.1–4.6 for deformation; AdicSpacesPartIII F0.3, F0.7, F0.8, R2.9 smooth-formal-scheme and R2.10 adic-local-flatness-criterion for the tower comparison, projective algebraization and smoothness; K3SurfacesAndSymplecticBoundedness §§1.1–1.3 for the canonical-cover K3 comparison used in that construction; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; EnriquesSurfaces E1a–E1f for the characteristic-not-two specialization.

### 8.4 Miniversal Enriques deformation ring

k is algebraically closed; Y/k is a geometric Enriques surface. Characteristic k is two.

For that geometric characteristic-two Enriques surface, its miniversal complete local W(k)-deformation ring A is regular and W(k)-flat with dimension 11 or 12. Dimension 12, absolute ramification index at least two, exceptionality-or-supersingularity, and nonexistence of a W₂-lift are equivalent.

Use DI21 Proposition 7.1, Theorem 7.2 and Proposition 3.3. The nonexceptional nonsupersingular case has unobstructed ring W[[T₁,…,T₁₀]]. In the other case tangent dimension twelve, obstruction dimension one and nonlifting give a regular one-equation base. Apply the independent characteristic-zero lifting target §8.3a: the defining relation is not associated to 2, so the regular base is W-flat. DI21 Corollary 3.4 identifies this condition with singular reduction modulo 2. Tangent dimensions and nonlifting alone do not imply W-flatness. ([SCH23](#references), Theorem 5.2, p. 14; [DI21](#references), §7, Proposition 7.1 and Theorem 7.2, pp. 23–24; §6, Theorem 6.1, pp. 20–22; [DI21](#references), §3, Proposition 3.3 and Corollary 3.4, pp. 11–12)

*Needs:* [8.3](#83-characteristic-two-enriques-lifting-criterion); SchemeAndStackFoundations, §§4.1–4.6; [8.1](#81-tangent-cohomology-of-enriques-surfaces); §8.3a; gap:one-obstruction-regularity.

### 8.5 Exceptional fibres do not lift modulo four

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec(Z/4Z); its geometric characteristic-two special fibre is assumed exceptional for contradiction.

No Enriques family over Z/4Z has an exceptional geometric special fibre.

Extend the residue field to F̄₂ and the nilpotent base to W₂(F̄₂). A nilpotent algebraic-space thickening of a scheme is a scheme, so this gives the flat proper scheme lift excluded by the geometric W₂ criterion. This step retains the algebraic-space family scope. ([SCH23](#references), Theorem 5.2, p. 14; [DI21](#references), §7, Theorem 7.2, pp. 23–24)

*Needs:* [2.1](#21-family-of-enriques-surfaces); [8.3](#83-characteristic-two-enriques-lifting-criterion); SchemeAndStackFoundations, §§1.3–1.9 and 4.1.

### 8.6 No nonexceptional constant-Picard Enriques surface over F₂

Y/F₂ is an Enriques surface with constant full relative Picard group scheme `(Z¹⁰⊕Z/2)_{F₂}.` Its geometric base change is nonexceptional. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

There is no Enriques surface over F₂ that is both nonexceptional and has constant full Picard scheme.

Descend a genus-one fibration and every geometric one. Numerical contraction descent makes nonrational geometric fibres irreducible and the tame descent makes them simple. Require the exhaustive fourteen-plus-four classification and all three omitted exclusions before using the residual table. Exclude I₄* and both multiple and simple III*. For the classical base change to F̄₂, every fibration then has the two configurations excluded by the arbitrary-characteristic restricted-configurations theorem. This proves the desired contradiction only when both classification proofs are supplied. ([SCH23](#references), §15 and Theorem 15.1 with its proof, p. 49)

*Needs:* [2.17](#217-existence-over-the-residue-field); [5.1](#51-elliptic-configurations-on-constant-picard-enriques-surfaces); [5.3](#53-quasielliptic-configurations); [5.7](#57-three-additional-configuration-exclusions); [5.14](#514-the-eight-residual-configurations); [6.12](#612-elimination-of-i); [7.1](#71-elimination-of-multiple-iii); [7.3](#73-elimination-of-simple-iii); [7.4](#74-final-two-configuration-impossibility); [2.12](#212-canonical-bundle-order); [2.18](#218-finite-field-specialization-of-picard-descent).

### 8.7 No Enriques surface over the integers

f:Y→S is a flat proper finitely presented algebraic-space Enriques family, with every geometric fibre Enriques. S=Spec Z, assumed for contradiction. Assume the fourteen-case rational-Jacobian completeness theorem and the three additional Enriques exclusions in [5.7](#57-three-additional-configuration-exclusions).

There is no flat proper finitely presented algebraic-space family over Spec Z with geometric Enriques fibres; equivalently the groupoid M_Enr(Z) is empty.

Assume such a family. Layer 3 proves constant full Picard over ℤ. Its F₂ fibre inherits that constancy, and its ℤ/4 restriction makes the geometric fibre nonexceptional by the lifting obstruction. Apply the finite-field theorem. Both the exhaustive rational-Jacobian classification and the three additional Enriques exclusions are required in this proof; neither follows from the integral covering argument. ([SCH23](#references), Theorem 5.1, p. 14; §15, proof of Theorem 15.1, p. 49)

*Needs:* [2.1](#21-family-of-enriques-surfaces); [3.13](#313-constant-picard-scheme-over-z); [8.5](#85-exceptional-fibres-do-not-lift-modulo-four); [8.6](#86-no-nonexceptional-constant-picard-enriques-surface-over-f).

### Examples

The tangent-cohomology triples (h⁰(Θ),h¹(Θ),h²(Θ)) are (0,10,0) in the unobstructed case and (1,12,1) in the exceptional or supersingular case. In both cases h⁰−h¹+h²=−10. A sign +10 for χ(Θ) is incompatible with both triples.

The formally smooth base W(k)[[t₁,…,t₁₀]] has absolute Krull dimension eleven. In the exceptional or supersingular case the miniversal base has dimension twelve and ramification index at least two. Tangent and obstruction dimensions alone do not prove that this base is regular: the one-equation and flatness criterion is an additional input. A supersingular canonical bundle is trivial, so the differential theorem requiring exact order two cannot prove its nonlifting; its α₂ Picard obstruction is used instead.

A hypothetical Enriques algebraic space over ℤ/4, after base change to W₂(F̄₂), is a nilpotent thickening of a scheme and hence is a scheme. Thus the geometric nonlifting result applies. The final passage from ℤ to F₂ uses this obstruction and full-Picard constancy; it still depends on both classification proofs in the finite-field endpoint.

### Dependencies

Layers 0–7; SchemeAndStackFoundations §§2.6, 2.20, 4.1–4.6 deformation theory, including the exact DI21 differential hypotheses; AdicSpacesPartIII F0.3, F0.7, F0.8, R2.9 and R2.10 for polarized algebraization and its smoothness comparison in §8.3a; the gap:picard-flatness-betti and R07.1 α₂ nonlifting; nilpotent scheme thickenings; and both classification proofs. The integral theorem uses the four-twist and full-Picard result of Layer 3, rather than assuming full Picard constancy at the start.

## Downstream consumers

Any later work on Enriques surfaces over arbitrary fields, for instance over the reals, should use the WeilConjectures WC.7 predicate and the canonical coverings of Layers 1–2 rather than define its own. The finite-field configuration theorems supply the characteristic-two arithmetic endpoint for the integral theorem. The numerical-descent adapters, canonical-cover comparison and Enriques deformation statements can also be used separately, with their stated hypotheses. None of the lattice or incidence computations asserts that a candidate configuration is realized geometrically.

## References

Page numbers below refer to the indicated author manuscripts. They are not silently transferred to published pagination.

- **SCH23.** Stefan Schröer, *There is no Enriques surface over the integers*, author manuscript, revision 19 July 2022, [author PDF](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf), 52 PDF pages, mathematical text pp. 1–49. The relevant locators appear at each target. The fourteen-case classification and the three additional exclusions go beyond what this source proves; see 5.1 and 5.7.

- **ESB21.** Torsten Ekedahl and Nicholas I. Shepherd-Barron, *On exceptional Enriques surfaces*, [arXiv:math/0405510v2](https://arxiv.org/abs/math/0405510v2), 26 August 2021, 19 pages. Use §2 for canonical coverings and conductrices, §3 for fibre restrictions, Theorem 4.2 and Corollary 4.3 for exceptionality and distinguished configurations.

- **EHS12.** Torsten Ekedahl, J. M. E. Hyland and Nicholas I. Shepherd-Barron, *Moduli and periods of simply connected Enriques surfaces*, [arXiv:1210.0342v1](https://arxiv.org/abs/1210.0342v1), manuscript version 7 dated 25 February 2018. Proposition 4.2 and Corollary 4.3, printed pp. 31–32, supply the Picard-flatness argument used in §§2.2–2.3.

- **DI21.** Stefan Schröer, *The Deligne–Illusie theorem and exceptional Enriques surfaces*, author manuscript, 4 January 2021, [author PDF](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/DeligneIllusie_2021.pdf), 34 PDF pages; published in *European Journal of Mathematics* 7 (2021), 489–525. Use the manuscript page numbers for Proposition 3.3, Corollary 3.4, Proposition 4.2, Theorem 6.1, Proposition 7.1 and Theorem 7.2.

- **MMV22.** Gebhard Martin, Giacomo Mezzedimi and Davide Cesare Veniani, *On extra-special Enriques surfaces*, [arXiv:2201.05481v1](https://arxiv.org/abs/2201.05481v1), submitted 14 January 2022, manuscript dated 17 January 2022, nine pages. Theorem 1.2 and Remark 1.5, pp. 1–2, identify the general partner theorem and its unique-fibration exception. The older proofs they cite are part of the targets that use them.

- **Fontaine.** Jean-Marc Fontaine, *Schémas propres et lisses sur ℤ*, preprint 91-02, [author scan](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf). Theorem 1 and Remark (a), printed p. 3, PDF p. 4, give the low-degree Hodge obstruction with smooth proper local models. The journal article is *Proceedings of the Indo-French Conference on Geometry*, 1993, pp. 43–56; these journal pages are not the scan’s locators.

- **Stacks Project.** [Tag 0D24, §99.11](https://stacks.math.columbia.edu/tag/0D24), Lemmas 99.11.3–99.11.4 and Proposition 99.11.8, for relative Picard descent, a section splitting the obstruction, and algebraic-space representability. [Tag 0D3D, Lemma 74.13.2](https://stacks.math.columbia.edu/tag/0D3D), for openness of relative ampleness; [Tag 0EMV, §68.11](https://stacks.math.columbia.edu/tag/0EMV), especially Lemma 68.11.4, for étale neighbourhoods at residue-field points; [Tag 0H74, Lemma 15.13.3](https://stacks.math.columbia.edu/tag/0H74), for smooth lifting over a Henselian pair. Tags are the stable locators.

- **Lang1983.** William E. Lang, *On Enriques surfaces in characteristic p. I*, Math. Ann. 265 (1983), 45–65, [GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0265/LOG_0011.pdf). Theorems 4.1–4.2, printed p. 62 (Lang1983 lines 757–778).

- **BM1977.** Enrico Bombieri and David Mumford, *Enriques' classification of surfaces in characteristic p. II*, in *Complex Analysis and Algebraic Geometry* (1977), 23–42. Theorem 3 and Proposition 11.

- **CD89.** François Cossec and Igor Dolgachev, *Enriques Surfaces I*, Progress in Mathematics 76 (1989). Chapter III, Theorem 3.4.1; published locator, uncertified text.

- **CDL2021.** François Cossec, Igor Dolgachev and Christian Liedtke, *Enriques Surfaces I*. Theorem 6.1.10 uses the 2021 draft numbering. The [author draft of 19 April 2024](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf) supplies Theorem 1.4.13, printed pp. 231–232, and Theorems 5.11.4–5.11.5, printed pp. 609–611; these version-specific locators are not interchanged.

- **LLR04.** Qing Liu, Dino Lorenzini and Michel Raynaud, *Néron models, Lie algebras, and reduction of curves of genus one*, Invent. Math. 157 (2004), 455–518, [author copy](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf). Theorem 6.6 and Remark 6.8, pp. 496–497.

- **LLR2018.** The same authors, *Corrigendum to Néron models, Lie algebras, and reduction of curves of genus one*, Invent. Math. 214 (2018), 593–604, [author copy](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf). Corrected Theorem 4.3, pp. 593–595, concerns the global comparison; §4.3 here uses the local LLR04 theorem.
