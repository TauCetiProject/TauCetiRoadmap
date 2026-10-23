# Roadmap: algebraic cycles, pure and mixed motives

**Summary.** Build correspondences from intersection theory, construct pure motives and their classical realizations, and prove semisimplicity for numerical motives. Then construct finite correspondences, effective motivic complexes, geometric motives with compact support and Nori motives, compare these constructions, and develop neutral and relative Tannaka reconstruction and the algebra of formal periods. The final layer gives precise predicates for cycle conjectures and proves their known consequences and specified cases. Conjectures are propositions to formulate, not theorem targets asserting their truth. Integral cycles, real varieties, and arithmetic heights retain their own coefficient and hypothesis conventions throughout.

## Scope and ownership

This roadmap owns graded correspondences, adequate relations on cycles, the contravariant category of pure motives, realization compatibility, numerical semisimplicity, finite correspondences, effective and geometric motives and their higher-Chow comparisons, Nori's diagram construction and its geometric realization, arbitrary-category Tannaka reconstruction, and formal periods. It also owns the interfaces that distinguish rational, integral, equivariant, and arithmetic cycle conjectures. Building the full constructions and the proof routes below is part of the roadmap: a theorem about an abstract realization does not supply a geometric realization.

The shared cycle/cohomology core is §§0.1–0.2, 0.5 and 2.2–2.4: componentwise graded correspondences and their actions, minimal classical Weil cohomology, and homological/numerical equivalence. Sections 7.3–7.4 own the shared standard-conjecture predicates, their general implications and the curve case. **StandardConjectures** consumes these interfaces for its Lefschetz-structure formulation. Weak and hard Lefschetz are a separate refinement of the minimal Weil theory; forgetting that refinement preserves its cycles, traces and correspondence actions. The normalized realizations and motive-specific consequences belong here.

Ordinary cycles, rational equivalence, refined intersection, projective bundles, Chern classes, degree, and Riemann–Roch belong to **SchemeAndStackFoundations**, §§5.1–5.8 (intersection theory). **KTheoryFiniteLocalFields**, §3.0a (`motivicCycles`), supplies Bloch's higher-cycle complexes, higher Chow groups, derived coefficients and their moving, localization, homotopy, product and transfer theory, consumed in §§4.7–4.8. This roadmap constructs finite correspondences, presheaves and Nisnevich sheaves with transfers, Suslin and Tate complexes, effective `𝔸¹` localization, relative-cycle specialization, cancellation, and the cdh comparison in §§4.1–4.10, followed by the motive-category comparisons in §§4.15–4.18. **MotivicEtaleKTheory** consumes these motivic constructions for its downstream comparisons and K-theoretic applications. Algebraic K-theory operations and the rational gamma-filtration comparison belong to **SchemeKTheoryOperations**, §§7.1–7.2.

The affine-group/Hopf-algebra dictionary, finite comodules and their tensor products and duals, finite-dimensional subcoalgebras, and reconstruction of a *given* affine group from its representations belong to **ReductiveGroups**, Layers 0–1, and the corresponding Tau Ceti modules. This roadmap's reconstruction starts from an arbitrary category and fiber functor; its task is to construct the coalgebra, multiplication, and antipode. Pure Hodge structures and their linear algebra are Tau Ceti objects. Tau Ceti’s `RepresentationTheory/QuaternionicStructure` supplies the generic quaternionic-structure predicate, bijectivity and absence of nonzero fixed vectors; §7.11 adds only a particular coefficient action. Analytic Hodge decomposition and geometric cycle classes are distinct geometric inputs, specified below. Semialgebraic syntax and projection in **RealAlgebraicGeometry** do not supply semialgebraic cohomology or equivariant Poincaré duality.

The additive Grothendieck group of a triangulated category is Tau Ceti's `TriangulatedK0`. Section 4.20 constructs tensor-induced multiplication and its functoriality on that existing group, together with the compactly supported motivic measure from the scissor ring. Mixed Tate hearts and arithmetic regulators remain with their respective owners. The pure Tate subcategory here is closed under sums and subquotients; extension closure is a different construction. **PeriodsAndSpecialValues**, period-integration layer, consumes the formal period algebra and its marked evaluation constructed here, and develops its special-value applications downstream. Automorphic, local theta, Galois-representation, and height machinery used in the last arithmetic application is consumed through the exact contracts stated there.

## Conventions

The ground field is `k`. Unless a paragraph says otherwise, pure motives have rational coefficients and their varieties are smooth projective schemes of finite type, including the empty scheme and finite disjoint unions of different dimensions. A variety called integral is integral; geometric integrality is stated when needed. A pointed curve and its Jacobian in the projector and acceptance statements mean a smooth projective geometrically connected curve with a chosen rational point. General curves are treated componentwise after geometric base change, with their descent data retained. `CH_j` is dimension graded and `CH^j` is codimension graded. Coefficients `CH_F` mean tensoring the integral Chow group with a characteristic-zero field `F`.

For equidimensional `X` of dimension `d`, `Corr^r(X,Y)=CH^{d+r}(X×Y)_ℚ`. For general `X`, take the direct sum over its equidimensional open-and-closed pieces. Composition is written `b ∘ a`, with `a` applied first. The graph of `f:Y→X` lies in `Corr^0(X,Y)`: hence `h` is contravariant. A motive is `(X,p,m)`, with `Hom((X,p,m),(Y,q,n))=q Corr^{n-m}(X,Y) p`. Write `𝟙(n)` for `(Spec k,id,n)` and `L=𝟙(-1)`.

In classical cohomology `F[n]` is supported in degree `-n`. Graded tensor symmetry is the Koszul symmetry `(-1)^{ij}`. A Tate twist `(m)` shifts the realized degree of `(X,p,m)` to `H^{j+2m}(X)(m)` in graded degree `j`. Betti's Tate line is `T_B=(2πi)ℚ`; de Rham's is the line with generator `t_dR`; the comparison sends `t_dR` to `(2πi)⁻¹t_B`. Étale `T_ℓ=lim μ_{ℓ^a}⊗ℚ_ℓ` has geometric Frobenius `q⁻¹`. Traces are normalized on a closed point by its residue degree.

In the triangulated theory `M(X)` is homological and covariant for ordinary scheme maps. `R(1)[2]` is the reduced motive of `ℙ¹`. The contravariant bridge from Chow motives sends `(X,p,m)` to the image of `pᵗ` on `M(X)(-m)[-2m]`. In Nori's *cohomological* category, `L_N=H¹_N(𝔾_m,{1})=𝟙_N(-1)` lies in the heart. Thus the contravariant geometric realization sends `R(1)[2]` to `L_N[-2]`.

Resolution hypotheses refer to resolution in the form used by Friedlander–Voevodsky, Definition 3.4, including perfectness. They are kept on the compact-support and duality results that use that proof. Smooth blow-ups, smooth Gysin triangles, cancellation, and their perfect-field consequences do not acquire a resolution hypothesis from a longer proof route. In integral localization sequences tensoring with an arbitrary coefficient ring means derived tensor; ordinary tensor is used only with a stated flatness hypothesis.

For real closed `R`, let `C=R(i)` and `G=Gal(C/R)`. Over the actual real numbers, equivariant cohomology is Borel equivariant cohomology of complex points. Over arbitrary real closed fields, use the semialgebraic theory with its comparison and transfer theorems; analytic Hodge decomposition is not silently transported to such a field. `ℤ(j)` has the sign action raised to `j`. Every assertion involving a prime `ℓ` assumes `ℓ≠char k`.

## Exact supplier contracts

The resolution, complex-comparison, rational K-theory and higher-cycle inputs come from **ResolutionOfSingularitiesCharacteristicZero**, **ComplexComparisonPartII**, **SchemeKTheoryOperations** and **KTheoryFiniteLocalFields**, respectively. The contracts below specify the sections and hypotheses used. StandardConjectures and the reconstruction consumers receive the shared interfaces described under Downstream consumers.

### From Mathlib and Tau Ceti

The library contracts use Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. Roadmap contracts below refer to the named sections; a geometric construction absent from these contracts is a target here.

Use Mathlib's `AlgebraicGeometry.Scheme`, over-categories, proper/smooth/projective morphism predicates, fiber products, `Submodule`, `TensorProduct`, `ModuleCat`, `FGModuleCat`, `LinearMap`, `LinearEquiv`, `Coalgebra`, `Bialgebra`, and `HopfAlgebra`. `CategoryTheory.Idempotents.Karoubi`, its morphisms, `toKaroubi`, preadditivity and idempotent completeness supply the envelope. Section 1.1 equips this envelope with the rational scalar action inherited from correspondences, using the library preadditive structure. `ExactPairing`, `RigidCategory`, `MonoidalCategory`, `SymmetricCategory`, biproducts, `DerivedCategory`, distinguished triangles, and `TStructure` retain their library meaning. For the Nisnevich and cdh sites of Layer 4, `GrothendieckTopology`, `Sheaf`, sheafification, `GrothendieckTopology.MayerVietorisSquare` with its sheaf condition and Mayer–Vietoris sequence, `Sheaf.H` and `GrothendieckTopology.Point` are the generic carriers; §4.3 restricts the supplied Nisnevich topology and squares to `Sm k` and constructs transfer structures; §4.10 constructs the cdh comparison.

Use Tau Ceti's `FGComoduleCat` and its `Finite/Monoidal` modules. The `Algebra/Coalgebra/Comodule/Finite/Abelian` module supplies abelianness and exactness of the forgetful functor over a field; it proves the stronger Noetherian-base, flat-coalgebra statement. This result is a dependency, not another reconstruction target. `Algebra/AlgebraicGroup/Representation/Comodule/Equivalence` and the `Representation/Tannaka` modules supply the known-Hopf comparison, including `TauCeti.Tannaka.tensorAutFunctor` and `pointsFunctorIsoTensorAutFunctor`. They do not imply neutral reconstruction before its coefficient Hopf algebra is constructed.

Use `TauCeti.Hodge.Conjugation`, `HodgeStructureOn`, its `piece` and `F`, `HodgeStructureOn.IsMorphism`, `map_piece_le`, and `tate` with `tate_piece` from `Geometry/Hodge/{Structure,Morphism,Tate/Basic}`. The Tate structure `tate m` has weight `-2m` and its only piece is indexed by `-m`. `TauCeti/CategoryTheory/Monoidal/Rigid/Biproduct` already supplies duals of finite biproducts; the corresponding general construction is not repeated. `CategoryTheory/GrothendieckGroup/Triangulated` supplies `TriangulatedK0`, `of`, triangle relations, `of_shift_one`, `lift`, and `map`. The graded carriers are `TauCeti.GradedVectorSpace` from `Algebra/Category/GradedVectorSpace/Basic`, `TauCeti.gradedCochainComplex` from `Algebra/Homology/GradedCochainComplex`, and the tensor signs in `Algebra/Module/GradedModule/KoszulTensor`. Section 2.1 equips integer-graded vector spaces with the categorical Koszul symmetry and restricts to finite total dimension.

The quaternionic predicate is `Representation.IsQuaternionicStructure`, with `sq_eq_neg`, `bijective` and `eq_zero_of_apply_eq_self`, in Tau Ceti `RepresentationTheory/QuaternionicStructure`. It applies to the coefficient action of §7.11 through the trivial group representation; the exclusion of an invariant complex line additionally uses semilinearity and the nonnegativity of `a ā`.

From **PivotalSpherical**, Layers 1–2 and the symmetric case of Layer 7 supply the canonical pivotal/spherical structure on a rigid symmetric category, `trace`, `quantumDim`, cyclicity, tensor and biproduct compatibility, and preservation by strong symmetric monoidal functors. Use the scalar identification `End(𝟙)=F` to read the dimension in `F`. Layer 3 supplies `IsFiniteSemisimpleCategory` (finite biproduct decompositions into simple objects), finite length, and decomposition and equivalence-transport APIs; it does not impose finitely many simple isomorphism classes or finite-dimensional Hom spaces. Section 3.2 constructs abelianness from Jannsen's endomorphism-algebra criterion, and §3.5 computes the supplied trace for motives and for the signed symmetry.

### Geometric foundations and cohomology

From **SchemeAndStackFoundations**, §§2.12–2.14 supply `Nisnevich.nisnevichTopology`, `Nisnevich.ElementaryDistinguishedSquare`, `henselianStalk`, `nisnevich_points_henselization` and `nisnevich_cohomological_dimension`. Section 4.3 constructs their smooth-site restriction and transfer extension. Sections 5.1–5.8 supply `CH`, proper pushforward, flat pullback, refined Gysin, exterior product, associativity, projection and base-change formulas, projective-bundle decomposition, Chern classes, and the degree map. Sections 3.1–3.8 supply the curve/Picard objects, Jacobians, symmetric powers of a pointed curve and the Abel map in degree at least `2g-1`. Sections 0.8, 4.11–4.13 and 5.5 supply smooth étale coordinates, flattening, normal cones and the birational foundations on their stated domains. **EtaleCohomologyFoundations**, §§G.1–G.3, supplies Nagata compactification and common refinements. In characteristic zero, **ResolutionOfSingularitiesCharacteristicZero**, §§5.2, 5.5 and 6.2–6.4, supplies resolution, SNC compactification and its coordinates. Over fields of other characteristics, retain the stated resolution hypotheses rather than assert unconditional resolution. The smooth-pair coordinate adapter needed for motivic Gysin purity is constructed in §4.8b; a coordinate theorem about smooth schemes alone does not supply coordinates adapted to a closed smooth subscheme.

**SchemeAndStackFoundations**, §§2.1–2.2, 2.9–2.11 and 2.17, supplies generic derived site cohomology, Kummer classes and pro-étale foundations. **EnhancedDerivedSheaves**, §§0.1–0.4, supplies the module-valued enhancements, tensor–Hom and coherent derived limits. **EtaleCohomologyFoundations**, §§F.0–F.4, supplies finite constructible coefficients, finite and adic cohomology, native pro-étale comparison, rationalization and continuous Galois actions. Its §§0.7–0.11 and F.5–F.6 supply supports, algebraic cycle classes, normalized traces, finite/adic/rational duality and smooth Gysin operations. In particular use `ClassicalAlgebraic.cycleClasses`, `ClassicalAlgebraic.smoothTrace`, `VanishingCycles.etaleKunneth`, `VanishingCycles.classicalAdicRealization`, `VanishingCycles.etaleProetaleAdicComparison`, `VanishingCycles.rationalAdicRealization`, `VanishingCycles.etaleVerdierDuality` and `VanishingCycles.smoothPairGysin` on their stated coefficient and geometric domains. These contracts give every degree and Tate twist; §§2.6–2.8 construct the normalized Weil realizations and verify compatibility of their operations with the comparisons, including reduction, cup, Kummer, exponential Tate markings and normalized traces. An additive `ℓ`-adic complex alone does not supply the multiplicative Weil realization.

**DifferentialGeometry**, Layers 5–8, supplies the analytic de Rham complex, Stokes, integration and analytic de Rham theorem, using Tau Ceti's singular cohomology and **AlgebraicTopology**, Stages 2–3 and 6 (relative cohomology, cup products, duality and cohomological Mayer–Vietoris). The algebraic-to-analytic comparison and compatibility with algebraic cycles remain the geometric supplier contract below; analytic de Rham alone does not provide them.

**ComplexComparisonPartII**, §§C5.1 and C5.3–C5.4, supplies algebraic de Rham hypercohomology, its filtered complex, `properDeRhamBetti` for smooth proper varieties, Kähler Hodge decomposition for smooth projective varieties, and the complex integration comparison. The exact cycle compatibility is `cl(Z)∈H^{p,p}` and `∫_X comp(cl_dR(Z))=(2πi)^d deg Z` in top degree with the raw analytic comparison. **SchemeAndStackFoundations**, §§2.19–2.20, supplies coherent duality, its trace and the smooth dualizing module. Section 2.6 constructs the induced normalized trace on algebraic de Rham hypercohomology over every characteristic-zero field, its field-base-change compatibility and its comparison with complex integration. Relative de Rham cohomology of *arbitrary* pairs additionally requires descent by smooth hypercovers or the h-topology, with excision, triple boundaries, and a multiplicative Betti comparison. This relative-pair construction belongs to §5.7; smooth-proper de Rham comparison does not imply it. The finite-level, relative, integral and rational Artin comparisons are **ComplexComparisonPartII**, §§C6.3–C6.6 (`artinComparison`, `relativeArtinComparison`, `artinSmoothTrace`, `adicArtinComparison`). Sections 2.6–2.8 and 5.7 give the sources and proof tasks for their realization adapters.

For Bloch–Ogus and the real applications require the Gersten/coniveau spectral sequence, cohomology sheaves `ℋ^q(A(j))`, residue and corestriction compatibility, purity, the comparison with cycles modulo algebraic equivalence in the relevant bidegree, and restriction to the real locus. The real theory additionally requires equivariant localization, semialgebraic Poincaré duality, Steenrod squares, Borel–Haefliger classes, norm/restriction, and Hochschild–Serre. The cohomology-with-supports and Gersten foundations are targets in §§0.5a–0.5b; the semialgebraic/equivariant construction and operations are targets in §§7.6a–7.6b, followed by the cycle adapters in §§0.6 and 7.8–7.15; generic sites or semialgebraic quantifier elimination do not discharge them. Sources: Colliot-Thélène–Voisin, §§2–3 and Appendix, pp.3–15, 42–44; Benoist–Wittenberg I, §§1–2, pp.8–41.

### Effective foundations and K-theory

*Needs:* **KTheoryFiniteLocalFields**, §3.0a's `motivicCycles` contract: the integral `BlochCycle` and `HigherChow` carriers for separated finite-type schemes over arbitrary fields, dimension/weight conversion, ordered face signs, arbitrary derived coefficients, proper and flat maps, products, closed-open localization and dimension-shifting homotopy invariance. Its smooth-target incidence moving includes simultaneous good position, affine-to-global Zariski descent and finite-correspondence actions with their composition and product identities. Finite-field moving uses coprime-degree restriction/transfer descent integrally. Sections 4.7–4.8 use these exports; the additional diagonal, norm-residue and K-theory tower comparisons of `motivicToK` are not prerequisites for the motive constructions here. Sources: MVW, Lecture 17 and Appendix 17A, pp.135–146; Levine, *Techniques of localization*, Theorems 1.7, 1.10, 6.12, Proposition 6.14 and §7, pp.2–5,37–44 of the author preprint.

The remaining effective foundations are constructed locally in §§4.1–4.10 from this higher-cycle contract, the intersection/Picard/birational contracts above and Mathlib's existing category, site, complex and derived-category carriers. Finite correspondences, transfer presheaves, Nisnevich sheafification, Suslin and Tate complexes and effective localization work over arbitrary fields with arbitrary commutative coefficient rings. Strict homotopy invariance, the homotopy-invariant-cohomology criterion and derived cancellation use perfectness in the proofs stated here. Exact cdh pullback and the complex-level Brown–Gersten comparison use the stated resolution hypothesis. The unbounded ambient category and its compact-generation/comparison adapters are also local targets. These distinctions do not impose resolution, rational coefficients or a prime restriction on the earlier constructions. Sources: MVW, Lectures 1–4, 7–8, 11–14, 21–24; Voevodsky, *Cancellation theorem*, §§3–4; Cisinski–Déglise, §11.1.

**SchemeKTheoryOperations**, §§7.1–7.2, supplies the gamma-filtration comparison and rational Chern character `K₀(X)_ℚ ≃ ⊕ CH^i(X)_ℚ`, its leading-term formula on a structure sheaf, Adams eigenvalues and product compatibility for smooth quasi-projective schemes over a field, in particular the smooth projective schemes used here. Layer 2 constructs a cohomological cycle class from this isomorphism; the isomorphism itself is not rebuilt. The additive `TriangulatedK0` and its triangle relations are supplied by Tau Ceti as above; the tensor ring and its functoriality are targets in §4.20.

### Arithmetic inputs

The final height application consumes number fields, Hecke algebras, automorphic representations, Shimura varieties, étale realizations, local theta correspondence and normalized local zeta factors from their owners. Its precise all-level modularity, semisimple Galois-isotypic identification and local intersection identity are stated in §7.19. These data are explicit hypotheses of the application, including the existence and compatibility of its Shimura, theta, Galois and height objects. The divisor cases in §7.2 take the Faltings isogeny theorem as an explicit hypothesis on abelian varieties over number fields. Explicit numerical data are hypotheses of the results that use them.

## How to read the build

The correspondence and pure-motive constructions of §§0.1–0.5 and Layer 1 use intersection and Picard theory. Layer 2 provides normalized realizations and their algebraic/homological compatibility, without using any cycle conjecture. Construct cohomology with supports and Gersten theory in §§0.5a–0.5b before the coniveau applications of §0.6. For their real instances, first construct the independent semialgebraic/equivariant foundations of §§7.6a–7.6b; these also precede §§7.7–7.15. Layer 3 proves numerical semisimplicity, then homological radical/idempotent lifting before numerical grading and its rank formula; its Tannakian consequence needs algebraic Künneth projectors but does not assert that a Weil realization descends to numerical motives. Layer 4 consumes KTheoryFiniteLocalFields §3.0a's `motivicCycles` in §§4.7–4.8 and constructs the transfer and Suslin/Tate foundations, including singular-base cycle operations (§4.8a) and adapted smooth-pair coordinates (§4.8b) before cancellation and cdh comparison; the triangulated, bivariant and compact-support consequences and higher-Chow comparisons follow. Layer 5 constructs Nori motives and the contravariant realization of geometric motives. Layer 6 proves reconstruction and identifies formal periods with the coordinate algebra of a bitorsor. Layer 7 formulates conjectures and proves the stated implications and examples. The abstract reconstruction arguments can be developed before the geometric instances; they do not depend on the conjectural mixed-motive heart.

## Layer 0: correspondences, equivalence relations, and support

### 0.1 Graded correspondences and their actions

Define `Corr k X Y r` by the componentwise formula in the conventions. Its API includes the equidimensional identification, coercion into total Chow groups, degree transport along equality, extensionality, zero/add/scalar membership, and compatibility with decomposition into components. Define `Corr.pullback` on `CH_j(Y)` with target `CH_{j-r}(X)` and `Corr.pushforward` on `CH^i(X)` with target `CH^{i+r}(Y)`, using the two projection–intersection–pushforward formulas. Prove linearity in the cycle and in the correspondence, and identify `Corr^r(X,Spec k)=CH_{-r}(X)_ℚ` and `Corr^r(Spec k,X)=CH^r(X)_ℚ`. These are different gradings even for a connected variety. (Stacks, Weil Cohomology, §3, Tag 0FFZ, pp.3–4, Lemma 3.1/0FG0.)

Define `Corr.comp b a=pr₁₃,*(pr₁₂* a · pr₂₃* b)`. Prove closure in degree `r+s`, bilinearity, associativity on fourfold products, the diagonal identity, and compatibility of the two actions with composition. Identify action on cycles with composition through the point. The degree-zero groups form a `ℚ`-linear category; disjoint unions give biproducts, block-matrix composition, and the empty scheme gives its zero object. All these identities use the supplied projection and base-change formulas, not a postulated correspondence category. (Stacks, Lemma 3.1, Example 3.2 and Lemmas 3.3–3.4, Tags 0FG0–0FG3, pp.3–5.)

**Checks.**

- For the point, `Corr^0=ℚ`, every nonzero degree is zero, and composition is multiplication.
- On `ℙ¹`, a degree-one correspondence sends `CH^0` to `CH^1`; pretending every action preserves codimension fails.
- For two copies of the point, endomorphisms are `2×2` matrices; `E₁₂E₂₁=E₁₁`, whereas reversing the composite gives `E₂₂`.
- The empty scheme has zero correspondence groups in both variables and its identity is zero. A single-dimension convention cannot express the biproduct of a point and `ℙ¹`.
- A degree-one correspondence followed by degree minus one has degree zero. Zero acts by zero, the diagonal acts identically, and `Corr^0(ℙ¹,ℙ¹)` has dimension two. For a surface, `Corr^0(X,Spec k)=CH²(X)_ℚ`, not `CH⁰`.

### 0.2 Graphs, transpose, and tensor product

Define `Corr.graph f` for `f:Y→X` and prove contravariant composition and identity. Its pushforward action is refined Gysin pullback by `f`; its pullback action is proper pushforward by `f`. The transpose gives the opposite two actions. For pure dimensions `d=dim X`, `e=dim Y`, transpose sends `Corr^r(X,Y)` to `Corr^{d-e+r}(Y,X)`, is involutive, and reverses composition. For disconnected schemes this is a matrix of componentwise degrees, not one falsely homogeneous transpose. (Stacks, Example 3.2, Remark 3.5 and Lemma 3.6, Tags 0FG1, 0FG4–0FG5, pp.4–6.)

Define exterior tensor of correspondences by pulling back from `X×Y` and `X'×Y'` to `(X×X')×(Y×Y')` and intersecting. Prove degree addition, bilinearity, interchange with composition, compatibility with graphs, and the associator, symmetry and unit constraints. With `η_X` the diagonal class regarded as `Corr^{-d}(X×X,Spec k)`, prove the graph-against-diagonals identity that identifies the two contractions of `a` and `aᵗ`; for `a:X→Y`, both are the same class on `X×Y`. This supplies naturality of the duality of §1.3. (Stacks, Lemmas 3.8–3.9, Tags 0FG7–0FG8, pp.6–7.)

**Checks.**

- For `x:Spec k→X`, its graph is the cycle `[x]` in `Corr^0(X,Spec k)`; the structural map has graph `[X]` in `Corr^0(Spec k,X)`.
- Their composite through `X` is `id_Spec`; their composite through the point is `[x×X]`, which need not be `Δ_X`.
- Transposing the graph of the structure map of a curve changes degree from `0` to `-1`; an unshifted transpose fails.
- Tensoring `E₁₂` and `E₂₁` on two finite point schemes verifies interchange with ordinary matrix multiplication, with no Koszul sign in the cycle category.
- For a surface source and curve target, transposing degree zero produces degree one. Tensoring degrees one and zero produces degree one; graph tensors are graphs of product maps and tensoring with the point is the unit.

### 0.3 Projectors on lines and curves

For a rational point `x` of `ℙ¹`, put `a=[x×ℙ¹]` and `b=[ℙ¹×x]`. Prove `a+b=Δ`, `a²=a`, `b²=b`, and `ab=ba=0`; compute their two actions and `End(h(ℙ¹))=ℚ×ℚ`. For a smooth projective pointed curve `(C,e)`, put `π₀=e×C`, `π₂=C×e`, `π₁=Δ-π₀-π₂`. Prove orthogonality and completeness, with transpose exchanging `π₀,π₂` and fixing `π₁`. (Stacks, Example 3.7/0FG6, p.6; Scholl, §1, pp.3–6.)

**Checks.**

- `a_*` fixes `CH^0(ℙ¹)` and kills `CH^1`; `b_*` does the reverse. For the dimension-graded pullback action, `a^*` fixes `CH_0` and kills `CH_1`.
- On `ℙ¹`, `π₁=0`; on a positive-genus curve its degree-one cohomological action is the identity.
- Replacing the identity of the summand cut by `a` with `Δ` fails `a f a=f` for its identity morphism.

### 0.4 Algebraic equivalence over the ground field

Define `AlgTrivial k X j` as the subgroup generated by refined-fiber differences `Z_{t₁}-Z_{t₀}`, where `T` is smooth geometrically integral quasiprojective over `k`, `t₀,t₁∈T(k)`, and `Z∈CH_{j+dim T}(T×X)`. Give zero, negation, addition, one-family normal form, coefficient extension by span, proper pushforward, smooth/refined pullback where defined, exterior product, and forward base change. Define its quotient and the universal lift of any map annihilating the subgroup. Prove that smooth curve parameters suffice; over a perfect field they can be smooth projective curve parameters, and then abelian-variety parameters suffice. The projective-curve version is not imposed over arbitrary imperfect fields. (Achter–Casalaina-Martin–Vial, Definition 2.1, Remark 2.3, Proposition 2.5, Lemma 2.8, and Propositions 2.10, 2.11 and 2.14, pp.4–8; Appendix A, pp.17–18.)

Prove that algebraic equivalence is adequate using the family operations. On a smooth projective geometrically connected curve over an algebraically closed field, algebraically trivial zero-cycles are exactly degree-zero classes; identify this with the Picard/Jacobian description. For a disconnected curve over that field, use the kernel of the separate degree maps to one copy of `ℤ` per connected component. Compatibility with classical geometric cycle classes is a target of §2.3. Do not infer descent of algebraic triviality from its truth after an arbitrary field extension. (Same source, §§2.1–2.3, pp.4–10; Stacks, Weil Cohomology, §8, Tags 0FHD–0FHM.)

**Checks.**

- On `Spec k`, the subgroup is zero; a nonzero degree cannot be algebraically trivial.
- Any two rational points of `ℙ¹` have algebraically trivial difference, already rationally zero.
- On `ℙ¹_ℂ⊔ℙ¹_ℂ`, `CH₀=ℤ²` and the algebraically trivial subgroup is zero. The class `(1,-1)` has total degree zero but fails the componentwise degree test.
- On a complex elliptic curve, choose a point of infinite order: `[P]-[0]` is algebraically trivial and nonzero in `CH₀`; this distinguishes algebraic from rational equivalence.
- Base change preserves a displayed family with its two rational parameters; geometric algebraic triviality alone does not supply such parameters over `k`.
- On `E: y²+y=x³-x` over `ℚ`, the infinite-order point `(0,0)` gives a nonzero rational divisor class `[P]-[0]` which is numerically trivial. Over a finite field the rational points of the Jacobian are torsion, so that field cannot supply this particular nonzero rational example.

### 0.5 Adequate and numerical relations

Define `AdequateRelation F` as graded `F`-subspaces `I^j(X)⊆CH^j(X)_F`, stable under the required pullbacks, proper pushforwards, and products, so that intersection and correspondence composition descend. Give equality/order extensionality, intersections and sums, the rational relation `0`, the relation killing every cycle, quotient maps, and induced correspondence categories. Define `NumTrivial` as the kernel of all complementary intersection-degree pairings; test against every complementary class, not just powers of one ample class. Prove adequacy of numerical equivalence and the rational-to-algebraic-to-numerical inclusions by the family operations and intersection degrees. The inclusions through homological equivalence belong to §2.3. (Jannsen 1992, p.447 and Theorem 1 proof, pp.448–450; Stacks, §§8–10.)

Prove the normalization alternative: if `I^0(Spec k)=0`, then `I⊆Num`; if `I^0(Spec k)≠0`, adequacy forces `I` to kill all cycles. The latter relation is allowed by the definition, but is excluded from the characterization of numerical equivalence in Layer 3. Give `quotientComparison I J` for `I≤J`, with composition, identity and factorization laws. (Jannsen, Theorem 1 proof, p.448, with the point normalization made explicit.)

**Checks.**

- The numerical subgroup of a point is zero; the relation killing all cycles fails point normalization.
- On `ℙ¹×ℙ¹`, let `u,v` be the two ruling classes. Although `(u-v)(u+v)` has degree zero, `(u-v)u` has degree `-1`; testing only the ample class would give the wrong numerical kernel.
- Taking all positive-codimension classes and zero in codimension zero is not adequate: pushing a rational point of `ℙ¹` to the point violates stability.
- Quotienting rational equivalence further by algebraic equivalence kills the elliptic-curve example of §0.4 without killing its degree-one point class.

### 0.5a Cohomology and homology with supports

Construct the twisted cohomology-with-supports and proper-covariant homology data used in the coniveau arguments. For Betti cohomology over `ℂ`, construct supports and Borel–Moore homology from the supplied singular theory. For étale cohomology over a perfect field, assemble the supplied prime-to-characteristic supports, traces and duality. For real closed fields, use §§7.6a–7.6b's semialgebraic equivariant construction. Give localization and excision, cap products, fundamental classes, proper pushforward, étale restriction, their base-change and projection formulas, and purity with its codimension and twist shifts. Prove the duality-with-supports axioms and principal triviality for a smooth principal divisor on a smooth scheme. The theories have their stated coefficient domains: integral Betti and semialgebraic coefficients and their coefficient sequences; finite prime-to-characteristic, adic and rational étale coefficients with the supplied limit comparisons. (Bloch–Ogus, §§1–2, pp.182–187, especially Definition 1.3 and axiom 1.5; Benoist–Wittenberg I, §1.1.4, pp.12–14.)

**Checks.**

- For empty support every group is zero; full support recovers ordinary cohomology. For nested supports the connecting map raises cohomological degree by one.
- For `{0}⊂𝔸¹`, purity shifts cohomological degree by two and twist by one in the complex/étale theory. Codimension zero gives the identity on an open-and-closed component.
- The first Chern class of the trivial line bundle is zero, giving principal triviality; this is not the assertion that the local fundamental class of its zero divisor vanishes in supported cohomology.
- Proper pushforward of a closed point has its residue degree, and the empty scheme has zero homology. A nonproper structural map cannot be used as a proper pushforward.

### 0.5b Gersten residues and the coniveau spectral sequence

For each theory of §0.5a and smooth `X` over its perfect ground field, construct the coniveau exact couple, its residues and finite corestrictions, with compatibility for field extensions, products and coefficient sequences. Prove local effacement and the hypotheses of Bloch–Ogus Theorem 4.2. Obtain the flasque Gersten resolution of `ℋ^q(A(j))`, with codimension-`r` term `⊕_{x∈X^{(r)}}H^{q-r}(κ(x),A(j-r))`, differential square zero, and the spectral sequence `H^p(X,ℋ^q(A(j)))⇒H^{p+q}(X,A(j))`. Fields in these terms mean neighbourhood colimits with their inherited theory. Prove the cycle-modulo-algebraic-equivalence comparison and correspondence action in the complex Betti setting of Colliot-Thélène–Voisin. For real equivariant cohomology construct the correspondence action from Chow groups modulo rational equivalence and the real-locus restriction needed by §0.6 and §7.12; descent through any further cycle relation requires its own vanishing theorem. This is a cohomology-with-supports construction, distinct from the contracted-transfer-sheaf Gersten resolution of §4.5. (Bloch–Ogus, Proposition 3.7, Theorem 4.2 and §§5–7, pp.188–200; Colliot-Thélène–Voisin, §§2–3 and Proposition 9.1, pp.3–15,42–44; Benoist–Wittenberg I, §5.1, equations (5.1)–(5.2), and Proposition 5.1, pp.62–65.)

**Checks.**

- On a field the Gersten complex has only its generic term; on a smooth curve it has only codimensions zero and one. The empty scheme gives the zero complex.
- For finite étale coefficients `μ_n`, with `n` invertible, the residue of the Kummer class of `t^a u` at a smooth parameter `t` is `a mod n`; units have residue zero. Corestriction retains residue degrees.
- On `ℙ¹_ℂ`, the divisor class of a point generates the diagonal coniveau cycle group. A degree-zero divisor acts trivially there even when its Chow class is nonzero on a positive-genus curve.
- The coniveau boundary lowers the residue-field degree and Tate twist by one; its composition with the next boundary is zero. Real-locus restriction commutes with these boundaries rather than being an unrelated group map.

### 0.5c Characteristic-power alterations of supports

Construct `pAlterationSupport`: for an integral proper finite-type scheme `W/k`, with characteristic exponent `p` (`p=1` in characteristic zero), produce a finite purely inseparable extension `L/k`, a smooth integral proper `W′/L`, and a proper surjective generically finite map `W′→(W_L)_red` of degree `p^e`. Over perfect `k`, take `L=k`. Apply Temkin's perfect-field theorem over the perfection and descend the finite-presentation data, smoothness, properness and generic degree to a finite purely inseparable extension; regularity over an imperfect field alone does not supply smoothness. Give the field-extension and reduction maps, degree multiplication in towers, restriction/corestriction on cycles of the ambient smooth schemes, and the proper push–pull formulas over the dense flat locus, with closure and localization for supported cycles. Keep `[L:k]` separate from the alteration degree over `L`. This strengthening of ordinary de Jong alterations is constructed here. (Temkin, *Tame distillation and desingularization by p-alterations*, Theorem 4.3.1, especially (iii), Ann. Math. 186 (2017), pp.97–126; Achter–Casalaina-Martin–Vial 2025, Lemma 3.1 and proof, pp.15–16.)

**Checks.**

- For smooth integral proper `W/k`, choose `L=k` and the identity, of degree one. In characteristic zero the characteristic exponent is one, so the alteration has degree one.
- For `W=Spec(k[u]/(u^p-t))` over `k=𝔽_p(t)`, choose `L=k(t^{1/p})`; `(W_L)_red=Spec L` has a degree-one smooth model over `L`. The field restriction/corestriction on ambient cycles still has multiplier `p`, not one.
- Composing generically finite maps of degrees `p^a` and `p^b` gives degree `p^{a+b}`; a tower of ground-field extensions also multiplies their separate restriction/corestriction factors.

### 0.6 Universal support, diagonal decomposition, and coniveau

Define `UniversalCH0Support X s` by requiring, for every algebraically closed extension `K/k`, a closed subscheme `Y_K⊆X_K` of dimension at most `s` that supports integral `CH₀(X_K)`. The support may depend on `K`. Give monotonicity in `s`, base-change stability, invariance under isomorphism, and a separate fixed-support predicate requiring a specified `Y` after *all* field extensions. Construct the adapter from varying supports to a fixed support over a finitely generated field, with proper-to-projective reductions explicitly proved when used. (Benoist–Wittenberg I, §5.1, pp.62–65; Bloch–Srinivas argument as used there.)

If a fixed `Y` supports `CH₀` after algebraic closure of `k(X)`, prove `NΔ_X=Γ_D+Γ_Y` for some positive integer `N`, with `D⊊X`, `Γ_D` supported on `D×X`, and `Γ_Y` on `X×Y`. If support already holds over `k(X)`, take `N=1`. Include descent and the multiplication by a finite extension degree. Over perfect `k` with resolution in the required support dimensions, factor a supported correspondence through a smooth proper model of its *actual projected image*, using the strict transform of each component and a degree-one map. An arbitrary resolution of a larger supporting divisor does not give the required equality. Over arbitrary `k`, use `pAlterationSupport` from §0.5c to obtain a finite purely inseparable extension `L/k` and a support model smooth proper over `L`. Keep restriction/corestriction and their multiplier `[L:k]` in addition to the characteristic-power alteration degree over `L`. This gives a cycle factorization with a model over `L`, not a smooth `k`-object. Any use inside the pure `k`-motive category additionally assumes a radicial base-change equivalence compatible with these cycle maps; the supported-cycle theorem alone does not provide it. (Achter–Casalaina-Martin–Vial 2025, Lemma 3.1 and proof, pp.15–16.)

For smooth projective complex `X,Y`, with `d=dim X`, and every abelian group `A`, construct the correspondence action
`CH^{d+r}(X×Y)/alg → Hom(H^p(X,ℋ^q(A)), H^{p+r}(Y,ℋ^{q+r}(A(r))))`,
with addition, composition, identity, graph and coefficient compatibility from Gersten residues and corestrictions. For smooth projective connected complex `X`, a decomposition `NΔ_X=Γ_D+Γ_Y` as above, with `dim Y≤s`, gives `N H^p(X,ℋ^d(A))=0` for `0≤p<d-s`; apply this componentwise for general `X`. In particular these groups vanish for rational coefficients. (Colliot-Thélène–Voisin, Propositions 3.3(ii) and 9.1, pp.10–11,42–44.)

For smooth proper equidimensional `X,Y` over a real closed `R`, with `d=dim X`, every `G`-module `A` and integer `j`, construct instead
`CH^{d+r}(X×Y) → Hom(H^p(X,ℋ_X^q(A(j))), H^{p+r}(Y,ℋ_Y^{q+r}(A(j+r))))`.
Here Chow groups already impose rational equivalence, and `ℋ_X^q` sheafifies equivariant semialgebraic cohomology. Prove the same functorial and coefficient compatibilities using equivariant purity and the coniveau cycle map, including the integral sign-twisted coefficients. A further quotient requires proof that its kernel acts trivially. (Benoist–Wittenberg I, §1.6, Theorems 1.18, 1.21 and equation (1.58); §5.1, equations (5.1)–(5.2).)

For `R` real closed, `X/R` smooth proper geometrically integral of dimension `d≥3`, universal support in dimension two implies `H^{d-3}(X_C,ℋ^d(ℚ))=0` in geometric semialgebraic cohomology. Put `π:X_C→X`. The regular-module identity `ℋ_X^d(ℚ[G])≃π_*ℋ_{X_C}^d(ℚ)` and the projectors `(1±g)/2` split off `ℋ_X^d(ℚ(d-1))`. Prove the resulting injection
`H^{d-3}(X,ℋ_X^d(ℚ(d-1))) ↪ H^{d-3}(X_C,ℋ_{X_C}^d(ℚ))=0`.
This rational real vanishing holds with or without real points. (Benoist–Wittenberg I, Proposition 5.1(i) and proof of Proposition 5.2, pp.62–67.)

**Checks.**

- `ℙ^n` has universal support in dimension zero; `C×ℙ^n` has support in dimension at most one.
- A complex positive-genus curve does not have support on a zero-dimensional subscheme: degree-zero classes are not all generated by finitely many points.
- Over `k=𝔽_p(t)`, the point `u^p=t` in `ℙ¹_k` admits no map from a nonempty smooth zero-dimensional `k`-scheme: its residue extension is inseparable. Its smooth support model is over `k(t^{1/p})`, and restriction/corestriction has multiplier `p`.
- For dimension zero, `D=∅`; the diagonal formula must still hold. A proof dividing by `d` fails this case.
- For a threefold and `s=2`, the asserted rational vanishing is in degree `p=0`; `p=1` is outside the inequality.
- With real points, rational equivariant cohomology can retain contributions in other degrees. The regular-module proof fixes the twist and the specific sheaf group.
- A point class acts on `H⁰` by its integer multiplicity; on a smooth projective complex curve a degree-zero divisor acts by zero on the diagonal Betti coniveau group. The output has the declared cohomological and Tate shifts. Universal support requires every algebraically closed extension in its definition; the fixed-support predicate separately quantifies over all extensions.
- On the smooth projective real elliptic curve `E:y²=x³−x`, let `O` be infinity and `P=(-1,0)`. The diagonal family with parameters `P,O` makes `D=[P]−[O]` algebraically trivial under §0.4. The two points lie on different real components, so `cl_BH(D)=(1,1)∈H¹(E(ℝ),𝔽₂)=𝔽₂²`. Hence `cl_G(D)≠0`. The curve coniveau sequence identifies `H¹(E,ℋ_E¹(ℤ(1)))` with `N¹H²_G(E(ℂ),ℤ(1))`; `D` sends the unit of `Spec ℝ` to this nonzero class. Thus the integral real action does not descend through algebraic equivalence.
- On `X=ℙ³_ℝ`, the standard diagonal decomposition has `N=1,s=0`, but the pullback of the nonzero class in `H³(G,𝔽₂)` gives a nonzero section of `ℋ_X³(𝔽₂)`. Every nonempty Zariski open has a real point splitting structural pullback. Consequently `H⁰(X,ℋ_X³(𝔽₂))≠0`, distinguishing the rational real vanishing from an integral or mod-two support bound.

### 0.7 Hypersurfaces and Euler-characteristic indices

Prove the low-degree hypersurface result used by universal support: over an algebraically closed field of any characteristic, a smooth degree-`e` hypersurface in `ℙ^n`, `n≥2`, `1≤e≤n`, has `CH₀≃ℤ` by degree. Use Roitman, §5, Theorem 6(a) and Lemma 17, pp.587–588, and §2, Lemma 13 and Proposition 1, pp.582–583. At a point `x`, choose a line with total contact of order `e`, or a contained line, by solving at most `e-1` homogeneous equations on `ℙ^{n-1}`. The inequality `e≤n` ensures a solution. Refined intersection makes `e[x]` independent of `x`; for a contained line use its normal-bundle excess formula and rational equivalence of its points. Thus `e` annihilates the degree-zero Chow group. That group is divisible, using curves through the cycle support and multiplication on their Jacobians, so it is zero. Roitman works over an uncountable algebraically closed field of characteristic zero; neither convention is used here, since the line count, the refined intersection and divisibility of Jacobian points hold over every algebraically closed field. Applying the result after every algebraically closed extension gives universal support in dimension zero for smooth quartic threefolds. It does not assert the existence of a real point.

For proper `X/k`, define `ELW_i(X)` as the ideal of `ℤ` generated by `χ(X,ℱ)` for coherent sheaves with support dimension at most `i`, put `ELW_{-1}=0`, and let `ind_i` be its nonnegative generator. Give monotonicity of ideals, `ind_j | ind_i` for `i≤j`, eventual stabilization, invariance under reduction, proper-pushforward and base-change ideal inclusions, and `ind₀=ind(X)`. Define the cycle Euler map `Σ n_Z[Z]↦Σ n_Zχ(O_Z)` modulo `ELW_{i-1}` for `i`-cycles. Prove descent through rational and algebraic equivalence using coherent dévissage and the normalization congruence; normalization gives a congruence in this quotient, not an integer equality. (Kollár, Definition 1, Lemma 3, Proposition 4 and Lemma 5, pp.1–3; Definition 13 and Proposition 14, p.4; Achter–Casalaina-Martin–Vial, Definition 2.17 and Lemma 2.18, pp.9–10.)

**Checks.**

- A point has every nonnegative index equal to one; the empty scheme has ideal zero and generator zero.
- An anisotropic real conic has `ind₀=2` and `ind₁=1`, since `χ(O_C)=1`; after adjoining `i`, its index is one. Base change gives divisibility, not equality.
- On a zero-cycle of degree `m`, `χ₀=m`; on a singular curve, replacing the curve by its normalization changes `χ` by its singularity correction, which disappears only in the specified quotient.
- A smooth quartic threefold has geometric universal support zero even when its real index is two.
- Positive characteristic is included: over `𝔽̄_p`, for every `p` including `p=3`, a smooth cubic surface (`e=n=3`) has `CH₀≃ℤ` by the same argument. The contact line at `x` meets the surface in a length-three scheme supported at `x`, so `3[x]` is the class of a line section, and divisibility removes the `3`-torsion. A characteristic-zero hypothesis would wrongly exclude these surfaces.
- Every intermediate index of projective space is one. A residue-degree-one skyscraper sheaf has Euler characteristic one, testing the divisibility statement without any denominator.

### 0.8 A torsion cycle on an anisotropic quadric

For a smooth projective variety over a field, let `τ∈CH_i` be torsion with nonzero Euler invariant in `ℤ/ELW_{i-1}`. Prove that `τ` is not algebraically trivial, using the descent of the Euler map from §0.7. If the target of its integral `ℓ`-adic cycle class is torsion free, prove that its cycle class is zero. Rationalization kills `τ`; this distinguishes the integral relations without contradicting rational numerical theory. The numerical invariants of a specified variety are hypotheses of this criterion. (Kollár, Proposition 14, p.4, and the algebraic-equivalence descent of §0.7; torsion is killed by a homomorphism to a torsion-free group.)

Use the following quadric as a worked Check. Over `F=ℂ((t))((u))((v))`, let `Q` be the anisotropic threefold quadric of the five-dimensional form `⟨1,t,u,tu,v⟩`. Assume its index is `2`, its Chow group contains a nonzero order-two class `τ∈CH₁` with Euler invariant `1 mod 2`, and the relevant integral `2`-adic cohomology is torsion free. The criterion proves that `τ` is homologically trivial and not algebraically trivial. The source obtains these data by Clifford-algebra/Grothendieck-group and Hochschild–Serre calculations; the application takes the displayed values as hypotheses. (Karpenko, §§3.1–3.9, pp.126–129, Theorem 3.8, p.128, and §5.3, p.132; Benoist–Wittenberg I, Remark 3.13, p.52.)

**Checks.**

- `2τ=0` and `χ₁(τ)=1∈ℤ/2`; replacing the invariant by an integer-valued map would force the wrong value.
- After a splitting extension, the anisotropic calculation is no longer applicable; the split quadric has a different cycle description.
- `τ⊗1=0` in rational Chow groups, while its integral algebraic-equivalence class is nonzero.

### Examples

The two projectors of `ℙ¹` determine all four action conventions and identify `L` in Layer 1. The elliptic-curve difference separates rational and algebraic equivalence; the quadric torsion separates algebraic and homological equivalence integrally. These are complementary examples: rational coefficients deliberately erase the torsion example. Universal support of a quartic threefold is geometric and supplies the coniveau input of Layer 7, independently of its real locus.

### Dependencies

SchemeAndStackFoundations supplies intersection theory and Picard geometry. The support arguments use its birational layer, the characteristic-power alteration construction of §0.5c, and the cohomology-with-supports/Gersten constructions of §§0.5a–0.5b; their real instances first use §§7.6a–7.6b. The low-degree hypersurface theorem and the torsion-cycle criterion are targets in this layer; the specified quadric data are hypotheses of its worked Check. No category of motives or conjectural cycle-class injectivity is used; the homological conclusion of §0.8 takes its stated geometric cycle map as input.

## Layer 1: pure motives, twists, and duality

### 1.1 Twisted correspondences and the Karoubi envelope

Construct `TwistedCorr k` with objects `(X,m)`, `m∈ℤ`, and morphisms `Corr^{n-m}(X,Y)`. Composition uses degree addition; shifting both integers by one is an autoequivalence. The degree-zero correspondence category embeds fully faithfully at twist zero. Define `ChowMotive k` as its Mathlib Karoubi envelope, with concrete notation `(X,p,m)`. The morphism extensionality and membership lemmas identify `q f p=f` with the two fixed-point equations `q f=f=f p`. Identity is `p`. Give the inherited rational linear category, the contravariant functor `h`, and the concrete splitting of an idempotent `a` by `(X,a,m)`. (Stacks, §4/0FG9, Lemmas 4.1–4.2/0FGA–0FGB, pp.7–8.)

**Checks.**

- `Hom(𝟙(m),𝟙(n))=ℚ` for `m=n` and zero otherwise; ignoring the twist fails already on the point.
- `Hom((ℙ¹,a,0),(ℙ¹,b,0))=0`, although the ambient degree-zero correspondence space has dimension two.
- For the zero projector the object is zero; for `p=Δ` its identity is `Δ`; for a proper projector its identity is not `Δ`.
- A map `Y→X` induces `h(X)→h(Y)`, and the two-point matrix check of §0.1 verifies the order of composition.
- `Hom(𝟙,h(ℙ¹)(1))=CH¹(ℙ¹)_ℚ` is a line. Adding the same integer twist to source and target preserves the morphism space, including for negative integers.

### 1.2 Tensor product, Tate objects, and additivity

Define tensor by `(X,p,m)⊗(Y,q,n)=(X×Y,p⊗q,m+n)`, with unit `𝟙` and geometric constraints. Define `M(n)=M⊗𝟙(n)` and prove addition of twists, inverse twist, and compatibility with tensor and `h`. Identify `(ℙ¹,b,0)` with `L=𝟙(-1)` using the point/fundamental-class correspondences, and prove `h(ℙ¹)≃𝟙⊕L`. (Stacks, Lemmas 4.3–4.4 and 4.7, Tags 0FGC–0FGD, 0FGG, pp.8–10.)

For `n≤m`, identify `(X,p,n)` with `(X×(ℙ¹)^{m-n},p⊗b^{⊗(m-n)},m)`. Use this to move two motives to a common twist and construct their biproduct from a disjoint union and block-diagonal projector. Prove independence up to the canonical biproduct isomorphism, component inclusion/projection identities, additivity of `h`, and the empty zero object. This proves finite additivity without assuming all objects initially have the same twist. (Stacks, Lemma 4.6/0FGF, pp.9–10.)

**Checks.**

- `L(1)≃𝟙`, so `L` is the *negative* Tate twist under this convention.
- The common-twist construction for `(Spec k,id,-1)` at twist zero uses one `ℙ¹` factor; using `m-n` with the opposite sign would require a negative power of a scheme.
- A biproduct with zero is the other summand; `h(∅)=0`; `h(X⊔Y)≃h(X)⊕h(Y)` even when dimensions differ.
- `𝟙(1)⊗𝟙(-1)≃𝟙` and the swap has no additional graded sign in the motive category.
- Twisting `h(X)` changes its integer mark, without replacing `X`. The symmetry on untwisted geometric objects is induced by the switch of scheme factors.

### 1.3 Diagonal duality and retracts

For smooth projective pure-dimensional `X`, `dim X=d`, construct the exact pairing with dual `h(X)(d)` using the diagonal for evaluation and coevaluation. Verify the two triangle identities by correspondence composition and their naturality by §0.2. In Mathlib's `ExactPairing h(X) (h(X)(d))` this is a right dual, even when a source calls it a left dual. For a projector `p`, the dual projector is its transpose; construct the dual of `(X,p,m)` as `(X,pᵗ,d-m)`. Use componentwise duality and the supplied biproduct-duality construction for general `X`. Prove rigidity of Chow motives. The remaining general adapter needed here is splitting a mate idempotent on an exact pairing, with evaluation/coevaluation restricted by its inclusion and projection. (Stacks, Lemmas 4.9–4.10/0FGI–0FGJ, pp.11–12; Jannsen, p.447.)

**Checks.**

- `𝟙(m)^∨=𝟙(-m)` and `L^∨=𝟙(1)`.
- Transpose exchanges the point and Lefschetz projectors on `ℙ¹`, and the dimension twist restores the expected dual summands.
- The dual of the zero projector is zero, and a two-summand pairing contracts equal indices and vanishes off the diagonal.
- For a curve, `h(C)^∨=h(C)(1)`; omitting the dimension twist breaks the degree of the diagonal evaluation.

### 1.4 Chow groups and the identity principle

Define `CH^i(M)=im(p_*:CH^{i+m}(X)_ℚ→CH^{i+m}(X)_ℚ)` for `M=(X,p,m)`. Give the image inclusion, projector characterization, action of a motive morphism, functoriality, twist formula, biproduct formula and the natural isomorphism `CH^i(M)≃Hom(𝟙(-i),M)`. Prove Manin's identity principle: a morphism `u:M→N` is an isomorphism if `u⊗id_{h(T)}` induces an isomorphism on `CH^i` for every integer `i` and every smooth projective `T`. The quantifier over products is essential; Chow groups of the point alone do not detect arbitrary motives. (Stacks, §5, Definition 5.1/0FGL and Lemmas 5.2–5.3/0FGM–0FGN, p.12.)

**Checks.**

- `CH^i(𝟙(n))` is `ℚ` exactly when `i+n=0`, and is zero otherwise.
- `CH^1(L)=ℚ` while `CH^0(L)=0`; the formula with `i-m` would reverse these values.
- The action of the identity `p` on its image is the identity, including the zero image.
- The identity principle applies to the two projective-line summands after tensoring with every `h(T)`; merely checking ranks of `CH^0` does not satisfy its hypothesis.

### 1.5 The universal property

For a rational-linear Karoubian symmetric monoidal category `C`, a rational-linear strong symmetric monoidal functor on degree-zero correspondences whose image of `b` on `ℙ¹` is invertible extends to Chow motives. Construct its value on `(X,p,m)` as the image of `F(p)` tensored with the `(-m)`-th power of that Lefschetz image, and prove independence of common-twist descriptions and functoriality on all degrees. State uniqueness as uniqueness up to a unique monoidal natural isomorphism compatible with the given functor and the chosen Tate identification. Literal equality of functors is not required by chosen splittings. (Stacks, Lemma 4.8/0FGH, pp.10–11.)

**Checks.**

- The image of `L` is the specified invertible object, and the image of `𝟙(1)` is its inverse.
- A functor for which the Lefschetz image is zero in a nonzero target cannot satisfy the hypothesis.
- Different choices of splitting of a projector yield canonically isomorphic outputs with the specified markings, rather than equal underlying objects.

### 1.6 Projective bundles and explicit projectors

For a vector bundle `E` of positive rank `r` on smooth projective `X`, normalize `p:ℙ(E)→X` by `p_*O(1)=E`. The correspondences `ξ^i[Γ_p]`, `0≤i<r`, induce an isomorphism `⊕ h(X)(-i)→h(ℙ(E))`. Prove it by the Chow projective-bundle formula and the identity principle, also giving the triangular inverse matrix with diagonal one. Rank zero is the empty bundle with empty direct sum. (Stacks, Lemma 6.1/0FGQ, pp.13–14.)

Construct the relative diagonal as the zero locus of the canonical section of `q₁*S^∨⊗q₂*O(1)` on `ℙ(E)×_Xℙ(E)`, where `S=ker(p*E→O(1))`; prove regularity and its top-Chern formula. Push it to the absolute square to obtain
`[Δ_ℙ(E)] = Σ_{i=0}^{r-1} c_{r-1-i}(pr₁*S^∨) ξ₂^i · (p×p)*[Δ_X]`.
Every coefficient is one. The tensor-with-a-line top-Chern identity here has no binomial coefficient. Specialize to `ℙ^n`: `π_i=h₁^{n-i}h₂^i`, `0≤i≤n`, are orthogonal projectors summing to the diagonal and cut out `𝟙(-i)`. (Stacks, Lemma 6.2/0FGR, p.14, with the top-Chern expansion checked on its zero-section construction.)

**Checks.**

- Rank one gives `ℙ(E)=X` and only the identity summand; rank zero gives zero.
- For `ℙ¹`, the two projectors are exactly `a,b` of §0.3.
- For `ℙ²`, `Δ=h₁²+h₁h₂+h₂²`; a binomial coefficient two on the middle term would act by two on `CH^1` and fail idempotence.
- The relative diagonal has codimension `r-1`; using rank `r` for its normal section gives the wrong cycle degree.

### 1.7 Other adequate quotients

For an adequate relation `I` and characteristic-zero coefficient field `F`, repeat the twisted-correspondence/Karoubi construction on the quotient Chow groups, obtaining `MotiveMod I`. Give quotient maps from rational motives after extending coefficients, tensor and twists, duality, and internal Hom. For equidimensional `X`, the internal Hom from `(X,p,m)` to `(Y,q,n)` is `(X×Y,pᵗ⊗q,dim X-m+n)`. For `I≤J`, construct the full tensor quotient functor `MotiveMod I→MotiveMod J` on the objects coming from `I`, and then its Karoubi extension. Every object of the target is a retract of an image; essential surjectivity requires a separate idempotent-lifting theorem. (Jannsen, p.447 and pp.450–452; Scholl, §§1–2, pp.3–8.)

**Checks.**

- Rational equivalence gives the Chow category; numerical equivalence gives the category of Layer 3.
- Internal Hom from `𝟙(m)` to `𝟙(n)` is `𝟙(n-m)`.
- A projector in a quotient ring need not lift to a projector in the original ring; fullness on morphisms does not prove essential surjectivity.
- The total adequate relation produces the zero category and zero endomorphism ring of its unit. The quotient construction permits this case; the normalized semisimplicity theorem of §3.3 excludes it.

### Examples

`h(ℙ^n)=⊕_{i=0}^n 𝟙(-i)` simultaneously checks the projective-bundle sign, representability of Chow groups and duality. A pointed curve gives `𝟙⊕h¹(C)⊕L`; the middle projector vanishes for genus zero. The tensor-dual of the entire curve is its twist by one, whereas the individual Tate summands exchange places.

### Dependencies

Layer 0, Mathlib's Karoubi envelope and the supplied exact-pairing/biproduct API suffice. The projective-bundle and diagonal formulas use the ordinary intersection-theory supplier, not higher Chow groups. No realization or standard conjecture is needed.

<a id="mc2"></a>

## Layer 2 (MC.2): classical realizations and normalized comparisons

### 2.1 Graded coefficient spaces

On the supplied graded vector-space and Koszul tensor carriers, construct `KoszulGradedVect F`: integer-graded vector spaces with convolution tensor and symmetry `v_i⊗w_j↦(-1)^{ij}w_j⊗v_i`. Give degreewise maps, tensor associativity/unit coherence, shifts `F[n]`, and the embedding as zero-differential cochain complexes. Prove that dualizability is equivalent to finite total dimension, with dual component `(V^∨)^i=(V^{-i})^∨`, and that the invertible objects are the one-dimensional spaces in a single degree. This finite-total-support subcategory is the target of classical realizations, rather than the category of arbitrary graded spaces declared rigid. (Stacks, Weil Cohomology, §7, pp.15–17; Scholl, §1, pp.3–6.)

**Checks.**

- `F[2]` is supported in degree `-2`, and `F[2]⊗F[-2]` is the unit.
- The interchange of two odd lines is `-id`; on two even lines it is `id`. In characteristic two the two scalars agree, without changing the grading rule.
- The zero graded space is dualizable, but the space with one copy of `F` in every degree is not. Finite dimension in each degree alone does not suffice.
- An invertible object has total dimension one; a two-dimensional degree-zero space is dualizable and not invertible.

### 2.2 Classical Weil cohomology

Define `WeilCohomology k F` over algebraically closed `k`, `char F=0`, first on smooth projective integral varieties. Include a contravariant unital graded-commutative `F`-algebra functor, rational cycle maps `CH^p→H^{2p}(p)`, trace `H^{2d}(d)→F`, finite total dimension and vanishing outside `[0,2d]`, the perfect Poincaré pairings and trace isomorphism, Künneth isomorphisms, and cycle compatibility with pullback, Gysin/proper pushforward, products, and degree. Give naturality/extensionality, restriction to each degree, and the trace of the unit point equal to one. Package the classical axioms without replacing the dimensional vanishing or point normalization by arbitrary functor data. (Stacks, §7, the data (D1)–(D3) with axiom (A), Definition 7.3/0FGV and Lemmas 7.4–7.11, pp.14–21.)

Construct pushforward for `f:X→Y`, dimensions `d,e`, as Poincaré adjoint of pullback, with degree `2(e-d)` and twist `e-d`. Prove functoriality, projection formula, agreement with cycle pushforward, trace of a product, and the trace formula for either projection. Prove the fundamental class maps to `1`. Write the diagonal using a homogeneous basis and its Poincaré-dual basis, with the Koszul sign dictated by their order. Derive `deg Δ_X²=Σ(-1)^i dim H^i(X)=deg c_d(T_X)` and the Lefschetz formula `deg(c·Δ_X)=Σ(-1)^i Tr(c_*|H^i(X))`. (Stacks, §§7 and 12–13, pp.17–21, 41–48; Jannsen, Lemma 1, p.448.)

Extend to all smooth projective schemes by products over components. Traces add on components of a fixed dimension; mixed dimensions use separate graded traces. For arbitrary `k`, choose an algebraic closure and pull cycles to it to obtain the geometric Weil theory. Include residue inseparability degrees. Prove continuity of Chow groups over algebraic extensions as a filtered colimit of finite subextensions, that the kernel of base change to an algebraic closure is torsion, and thus rational injectivity. For smooth projective `X`, prove that zero-cycles are generated modulo rational equivalence by closed points separable over `k`. These are distinct statements; injectivity does not assert surjectivity. (Stacks, §§11–12 and §14, pp.37–45, 48–49.)

**Checks.**

- `H(ℙ¹)` has dimensions `1,0,1`; `H(ℙ¹×ℙ¹)` has dimensions `1,0,2,0,1`, and diagonal self-intersection two for `ℙ¹`.
- Multiplying every trace by two violates the point normalization and cycle-degree axiom.
- Regrading the Hodge summands of a complex elliptic curve by `3p-q` preserves a possible graded tensor structure but introduces degree `-1`; it fails classical Weil vanishing.
- Two disjoint points have `H⁰=F²`, trace the sum, not an isomorphism to `F`. The empty scheme has zero cohomology.
- For an inseparable closed point, base change carries its multiplicity; counting only geometric support points gives the wrong trace.
- An odd-degree class squares to zero in characteristic zero. For `Spec k ⊔ ℙ¹`, `H⁰` has dimension two and `H²` dimension one: a single global top-degree perfect pairing is incorrect. For `Spec L` with `L/k` finite separable, the fundamental class has all-one coordinates over a splitting field. Rational base-change need not be surjective on cycle classes.

### 2.3 Realizing pure motives and identifying homological quotients

Extend a Weil theory to correspondences by `c_*(α)=pr₂,*(cl(c)∪pr₁*α)`. Prove all-degree composition, exterior-product and graph identities, and the exact-pairing compatibility of the graph and diagonal. The universal property gives `realize_H:ChowMotive k→KoszulGradedVect F` with `realize_H(X,p,m)^j=im(p_*|H^{j+2m}(X)(m))`. Include the Tate marking, naturality on projector images, tensor, dual and twist coherence. (Stacks, §§7–8, pp.18–25; Scholl, §§1.4–1.13, pp.3–6.)

Conversely, for a strong symmetric monoidal functor on Chow motives with a specified Tate identification `G(𝟙(1))≃F[2]`, recover cup products, cycle classes and traces from diagonal and structural maps. It gives a *classical* Weil theory only with the required nonnegative-degree and geometric degree-zero conditions, equivalently the classical dimension/trace normalization conditions in this setting. Prove the two constructions are inverse up to marked monoidal isomorphism. If the Tate marking is multiplied by `λ∈Fˣ`, compute the change `cl^r↦λ^{-r}cl^r` and `Tr_X↦λ^dTr_X`; it is not an unmarked equivalence. (Stacks, §§7–8, especially the equivalence construction, pp.21–25.)

Define `HomTrivial_H` as the kernel of the cycle class, with coefficient field or subfield stated. Using connected parameter spaces and specialization, prove that geometric cycle classes kill algebraically trivial cycles. Prove adequacy and the rational-to-algebraic-to-homological-to-numerical inclusions, using the normalized trace pairing for the last inclusion. For a correspondence, prove its class is zero if and only if all its degreewise actions are zero, by Künneth and Poincaré duality. The realization of the homological quotient is faithful; it is not asserted full. For any adequate `J`, it factors through `J` exactly when `J⊆HomTrivial_H`. Descent through numerical equivalence requires equality with the numerical kernel, namely the relevant standard conjecture D. (Stacks, §8; Jannsen, pp.448–451.)

**Checks.**

- `realize_H(L)=F[-2]`, while `realize_H(𝟙(1))=F[2]`; the latter is in degree `-2`.
- A scalar change of the Tate marking changes the point class of `ℙ¹` inversely and its trace directly; their composite remains degree one.
- The point cycle is never homologically trivial in a normalized Weil theory.
- A faithful embedding of the homological quotient does not identify every linear map with an algebraic correspondence. Numerical descent cannot be deduced just from the inclusion of kernels.

### 2.4 Künneth components and cycle maps from Chern classes

Define the `j`-th cohomological Künneth component of the diagonal in `H^{2d-j}(X)⊗H^j(X)(d)`. Its action projects onto `H^j`. Prove orthogonality, sum, transpose, product and trace identities. Algebraicity is a *separate predicate*, with rational and `F`-linear algebraicity distinguished. For a curve a closed point of degree `a>0` gives rational degree-zero and top projectors after division by `a`; a rational point is unnecessary. (Stacks, §§9–10, pp.26–37; Scholl, §2, pp.6–8.)

Construct `cycleClassFromChern` for a nonnegative cohomology theory on smooth projective schemes over any field `k`, with coefficients in a characteristic-zero field `F`, with its Tate line, natural first Chern class on line bundles, projective-bundle formula and smooth-divisor support. Use the supplied rational Chern character comparison to define `cl=ch_H∘ch_CH⁻¹`. Prove unitality, products, pullback, uniqueness from first Chern classes and the leading-term formula
`cl[Z]=(-1)^{r-1} c_r([O_Z])/(r-1)!`
for codimension `r≥1`. The denominator is invertible in the coefficient field. The construction alone does not manufacture Poincaré duality, traces or compatibility with arbitrary proper pushforward; these are separate realization targets. (Grothendieck 1958, §4.3, formulas (15)–(16), pp.150–151; SchemeKTheoryOperations' rational gamma/Chow comparison; Scholl, §1, pp.3–8.)

*Needs:* SchemeKTheoryOperations §§7.1–7.2 (rational gamma/Chow comparison and Chern-character isomorphism).

**Checks.**

- On a curve, the degree-zero and degree-two projectors are represented by a degree-one rational zero-cycle even without a rational point; a positive-genus curve also has its degree-one projector.
- On `ℙ²`, `c₂([O_point])=-[point]`; omitting the sign gives the negative cycle class.
- A line bundle's divisor class agrees with its first Chern class, and the unit class is `1`.
- `r=0` is the unit case, not the displayed factorial formula. Rational algebraicity implies coefficient-linear algebraicity; the converse needs a descent argument.
- The empty cycle has zero class, and the class of a negative divisor is the negative first Chern class. For a curve with rational point `x`, `[x×C]∈H²(C)⊗H⁰(C)` acts on `H⁰(C)`, whereas `[C×x]∈H⁰(C)⊗H²(C)` acts on `H²(C)`. Transpose exchanges these projectors; merely exchanging the Künneth factors changes the degree acted on.

### 2.5 Normalized comparisons

Define `NormalizedComparison H K E` for embeddings of the two coefficient fields into a common characteristic-zero field `E`: natural all-degree base-change equivalences, preserving unit, cup product, cycle classes, and trace, together with a Tate-line isomorphism `τ:T_H⊗E≃T_K⊗E`. Its powers for negative integers use dual inverse powers. Give identity, composition, inverse, coefficient extension and cocycle laws. Prove compatibility with Poincaré pushforward and every correspondence of every degree; then restrict to projector images to obtain the marked monoidal comparison of Chow-motive realizations. The kernel and projector-image restrictions are elementary linear-algebra steps on genuine equivalences; they do not replace the geometric comparison theorem. (Deligne 1982, revised pp.8–11, original pp.17–22; Scholl, §1.13, pp.5–6.)

**Checks.**

- Multiplying an alleged comparison by two violates the unit and is excluded, although it is a vector-space isomorphism.
- For `ℙ¹`, raw analytic integration of `c₁,dR(O(1))` is `2πi`. With `τ(t_dR)=(2πi)⁻¹t_B`, the *twisted* point class has trace one.
- For a finite flat map of curves of constant degree `a`, normalized comparison intertwines `f_*f^*=a`; changing the trace without changing the Tate line fails this check.
- On twist `-1`, the comparison uses the inverse of `τ`, not another copy of `τ`. The zero projector restricts to the unique equivalence of zero spaces.
- Comparison is the identity for equal marked theories, including the empty scheme. On a quadratic finite étale algebra, the algebraic de Rham trace of one is two.

### 2.6 Betti and de Rham realizations

For `σ:k→ℂ`, construct `BettiRealization σ` from rational singular cohomology of `X_σ(ℂ)`, with `T_B=(2πi)ℚ`. Define a codimension-`r` cycle's class in `H^{2r}(r)` by the fundamental class multiplied by `(2πi)^r`, and normalize the trace by the Tate generator. Establish finite dimension, Künneth, Poincaré duality, algebraic cycles and proper maps, including disconnected schemes. This requires the geometric singular-cohomology and cycle-integration supplier, not merely abstract Hodge structures. (Scholl, §1; Deligne 1982, revised pp.8–11; Demailly, Chapter V, §13, pp.271–272.)

For any characteristic-zero `k`, construct `DeRhamRealization k` from hypercohomology of `Ω^•_{X/k}`, the algebraic cup product, first Chern classes, algebraic trace and field base change. For smooth projective pure-dimensional `X/k` of dimension `d`, prove the top edge isomorphism `H^d(X,Ω^d_{X/k})≃H^{2d}_dR(X/k)` and transport the supplied coherent-duality trace through the smooth dualizing-module identification and this isomorphism. Prove that the resulting `Tr_dR:H^{2d}_dR(X/k)→k` is normalized on cycle classes by degree and commutes with every extension `k→k'`; include the base-change isomorphism on de Rham cohomology and the trace square. Use separate traces on the equidimensional components. This construction belongs here and requires no complex embedding. (SchemeAndStackFoundations §§2.19–2.20; Stacks, de Rham Cohomology, §§20 and 22, Tags 0FW3 and 0FWC.)

Fix the totalization and `dlog` signs by Deligne's convention in Hodge II, §2.2.4.1, pp.28–29. Supply all the Weil axioms from algebraic duality, the projective-bundle formula and Chern-character construction. For `σ:k→ℂ` and `α∈H^{2d}_dR(X/k)`, prove `σ(Tr_dR(α))=(2πi)^(-d) ∫_{X_σ(ℂ)} comp_σ(α)`. Express the same identity as preservation of `H^{2d}(d)→𝟙` with the marked Tate line: `t_dR^⊗d` maps to `(2πi)^(-d)t_B^⊗d`. Thus the degree-`j` part of `(X,p,m)` is multiplied by `(2πi)^(-m)` relative to the raw comparison. (Grothendieck 1966, Theorem 1′, pp.95–96; Hodge II, §2.2.4, pp.28–29; Deligne 1982, revised pp.8–11.)

*Needs:* SchemeAndStackFoundations §§2.19–2.20 (coherent duality, trace and smooth dualizing modules); ComplexComparisonPartII §§C5.1, C5.3–C5.4 (algebraic de Rham, proper comparison, geometric Hodge theory and complex integration).

**Checks.**

- Both realizations of `h(ℙ¹)` are a unit in degree zero and `𝟙(-1)` in degree two; the inverse Tate object occurs in degree `-2`.
- For finite étale `K/k`, `H⁰_dR=K` with field trace, whereas Betti gives a coordinate for every embedding extending `σ`, with trace the sum.
- An elliptic curve's two odd classes swap with a minus sign; using an unsigned tensor target breaks multiplicativity.
- The algebraic trace of the divisor class of `O(1)` on `ℙ¹` is one, while its raw complex integral is `2πi`.
- For `ℙ²`, the algebraic trace of `c₁,dR(O(1))²` is one and the raw complex integral is `(2πi)²`. Extension between characteristic-zero fields preserves the algebraic trace even without a chosen complex embedding.

### 2.7 Étale realization and all-degree comparison

For any `k` and `ℓ≠char k`, construct `EtaleRealization k ℓ` with geometric cohomology `H^j_et(X_kbar,ℚ_ℓ)`, continuous `G_k` action, Kummer Tate line and compatible traces and cycle classes. Include finite coefficients `μ_{ℓ^a}^{⊗m}`, derived inverse limit, rationalization, functorial base change, and all Weil operations. Taking `G_k` invariants is not part of the geometric Weil realization, and need not preserve the dimensions required for a Weil theory. (Milne, Lectures on Étale Cohomology, §§19, 21–24, pp.123–126, 130–145.)

If `k⊂ℂ` with a compatible embedding of an algebraic closure, construct the comparison after *forgetting* the Galois action. Begin with the all-degree finite-coefficient comparison, identifying `μ_{ℓ^a}` with `ℤ(1)/ℓ^a` by `a↦exp(2πia/ℓ^a)`, then pass through compatible limits and tensor with `ℚ_ℓ`. Riemann existence for finite covers alone is not the required all-degree theorem. Prove compatibility with cup, traces, Kummer classes, all twists and correspondences, and hence with Chow projectors. Combined with §2.6 this proves independence of the rational homological kernel from the embedding and the prime in characteristic zero with these comparison hypotheses. It is not a characteristic-`p` independence theorem. (SGA 4, Exposé XVI, Theorem 4.1, printed pp.232–234, retyped pp.13–14; Milne, Theorem 21.5 and its proof, pp.132–134; §24, pp.144–145.)

*Needs:* ComplexComparisonPartII §§C6.3–C6.6 (finite, relative, integral and rational Artin comparisons and smooth traces).

**Checks.**

- Over `𝔽_q`, geometric Frobenius acts by `q` on `H²(ℙ¹,ℚ_ℓ)`, by `q⁻¹` on `ℚ_ℓ(1)`, and by one on `H²(ℙ¹,ℚ_ℓ(1))`.
- A finite étale scheme gives its permutation Galois representation, not a vector space with trivial action.
- The comparison for `H⁰` recovers embeddings; the degree-two comparison for `ℙ¹` detects the Tate normalization that degree zero cannot see.
- At `ℓ=char k` the stated Kummer/étale construction is inapplicable; no crystalline substitute is inferred.

### 2.8 Curve acceptance and realization kernels

For a smooth projective curve, prove `cl(D)=c₁(O(D))`, normalized trace `Tr(cl(D))=deg D`, and for finite flat `f` of constant degree `a`, `f_*f^*=a id`. In general use multiplication by the locally constant degree on each target component, with the separate traces on geometric components. Use these as acceptance theorems for each classical realization and each comparison. For projector realizations prove comparison restricts to images, respects sums/twists/duals, and identifies the homological kernel exactly, with the geometric class-to-action theorem of §2.3 as a prerequisite. The elementary `comparison_on_images` step should use the library range equivalence, not introduce a separate image carrier. (Scholl, §§1.4–1.13, pp.3–8; Milne, §§19 and 24, pp.123–126, 142–145.)

**Checks.**

- A degree-zero divisor on a complex curve has zero degree-two class, even when its Chow class is nonzero.
- For a closed point of residue degree `a`, all normalized traces are `a`; raw de Rham integration is `(2πi)a`.
- The inclusion of one component in `ℙ¹⊔ℙ¹` is finite flat of locally constant degrees `(1,0)`; `f_*f^*` is that component projector, not a scalar multiple of the identity.
- The constant map of a curve is not a finite positive-degree map and cannot be substituted into the finite-map formula.

### Examples

The divisors of a pointed curve detect graph variance, trace, Tate twist and the comparison scalar in one calculation. `ℙ¹×ℙ¹` detects the middle Künneth multiplicity and prevents replacing all cycle classes by a one-dimensional degree map. A finite étale scheme separates de Rham's field trace from Betti's embedding coordinates while their base changes agree.

### Dependencies

Layers 0–1, the exact classical-cohomology contracts, and the rational gamma/Chow comparison. This layer supplies homological equivalence to Layer 3 without using its semisimplicity. The geometric Hodge and relative-pair extensions are explicit constructions, not consequences of the linear-algebraic Hodge API.

## Layer 3: numerical motives and semisimplicity

### 3.1 Finite numerical groups and trace radicals

Prove finite dimensionality of `CH_num^j(X)_ℚ` for smooth projective `X` over any field by its pairing quotient and a geometric Weil cohomology bound. For every characteristic-zero coefficient field `F`, prove `CH_num^j(X)_ℚ⊗F≃CH_num^j(X)_F`, compatibly with products, degree and correspondences. For homological correspondences establish
`deg(f·gᵗ)=Σ_i(-1)^i Tr((f∘g)|H^i(X))`.
Keep transpose in the intersection pairing and ordinary composition inside the trace. (Jannsen 1992, Lemma 1 and Theorem 1 proof, pp.448–450; Milne, Motives, §6.)

Prove the finite-algebra ingredients: over a characteristic-zero field, the Jacobson radical of a finite-dimensional algebra commutes with field extension; and a finite-dimensional endomorphism with `Tr(u^n)=0` for every positive `n` is nilpotent. For the unconditional numerical theorem, extend to a realization coefficient field and write `B→A` for the finite-dimensional homological-to-numerical algebra quotient. Its radicals satisfy `rad(A)=image(rad(B))`. A lift in `rad(B)`, multiplied by any element of `B`, is nilpotent, so its trace in *each* cohomological degree vanishes. The trace formula then makes its numerical image zero. No Künneth algebraicity is used here. The converse assertion identifying the entire quotient kernel with `rad(B)` does need Künneth projectors and belongs to §3.4. (Jannsen, pp.448–450.)

**Checks.**

- The point gives numerical group `ℚ` and trace `ab`; the empty scheme gives zero.
- On a curve the supertrace of the identity is `2-2g`; it is not its total Betti dimension `2+2g`.
- In characteristic `p`, `id` on a `p`-dimensional space has all power traces zero but is not nilpotent; characteristic zero is essential.
- The dual-number algebra has nonzero nilpotent radical, and scalar extension does not remove that radical.

### 3.2 The category criterion

Use PivotalSpherical Layer 3's `IsFiniteSemisimpleCategory` on the abelian category constructed here: every object is a finite biproduct of simple objects. Prove Jannsen's additional criterion for an `F`-linear additive idempotent-complete category: if every endomorphism algebra is finite dimensional and semisimple, then the category is abelian and satisfies that supplied predicate. Construct kernels and cokernels from decompositions of endomorphism rings, prove the canonical coimage-to-image map is invertible, and establish finite length. Conversely a semisimple abelian category with finite-dimensional endomorphisms has semisimple endomorphism algebras. (Jannsen, Lemma 2 and Theorem 1, pp.449–450.)

In `Suggested.lean`, `jannsen_category_criterion` states the endomorphism-algebra criterion, constructing an abelian structure with the given addition and a finite biproduct decomposition of each object into simple objects.

**Checks.**

- Finite-dimensional vector spaces and the zero category satisfy the criterion; finite-group representations over characteristic zero do too.
- Finite-dimensional modules over `F[ε]/ε²` are abelian but the extension `0→F→F[ε]→F→0` does not split.
- The category of finite free modules over the dual numbers is additive and idempotent complete with a faithful forgetful functor, but is not abelian: multiplication by `ε` has no kernel object in that category. A categorical simplicity heuristic is not a substitute for the endomorphism-ring hypothesis.

### 3.3 Jannsen's theorem and the quotient

For a characteristic-zero `F` and an adequate relation `I` normalized by `I^0(Spec k)=0`, prove the equivalence: `MotiveMod I` is abelian and satisfies `IsFiniteSemisimpleCategory`; every degree-zero self-correspondence algebra modulo `I` is finite-dimensional semisimple; and `I=Num`. In the semisimple-to-numerical direction a nonzero map from the unit splits, so each nonzero cycle pairs nontrivially with a complementary one. In the other direction use §§3.1–3.2. No standard conjecture is assumed. (Jannsen, Theorem 1, pp.448–450.)

Construct `ChowMotive→NumericalMotive` as the full tensor quotient with the numerical ideal as kernel. Describe its Karoubi completion: each numerical object is a retract of an image. Do not claim arbitrary numerical projectors lift to Chow projectors. This is the precise unconditional numerical category. (Jannsen, pp.450–452.)

**Checks.**

- For the relation killing every cycle, the motive category is zero and semisimple, but the relation is not numerical. The point-normalization hypothesis excludes this counterexample.
- The unit remains nonzero with endomorphism field `F` for every relation covered by the theorem.
- A rationally trivial correspondence maps to zero; a correspondence numerically zero but not known rationally zero belongs to the quotient kernel without acquiring a Chow-level vanishing theorem.
- The nonzero Chow correspondence `([P]-[0])×E` from an infinite-order elliptic point becomes zero numerically. On `ℙ¹`, passage to numerical endomorphisms is an isomorphism.

### 3.4 Homological radicals and noncanonical cohomology pieces

Under algebraic Künneth projectors, prove that the kernel from homological to numerical self-correspondences is a nilpotent ideal and equals the relevant Jacobson radical. Use each cohomological degree's traces, then the finite-dimensional algebra argument over the realization coefficient field. If correspondences are defined over a subfield of that coefficient field, do not assume their algebra is finite dimensional over the smaller field without proof. Lift numerical idempotents through the nilpotent ideal, with uniqueness up to conjugation by a unit congruent to one, obtaining homological pieces `H^r(M)` up to noncanonical isomorphism. This does not define a canonical cohomology functor on numerical motives. (Jannsen, Corollary 1, pp.449–450, and Corollary 2, pp.450–451.)

**Checks.**

- A zero numerical projector may lift to different nilpotent-perturbed presentations, but its lifted idempotent is conjugate to zero and hence zero.
- Two lifts of a projector need not be equal; conjugacy, rather than equality of the chosen subspaces, is the uniqueness conclusion.
- A field extension can turn a finite-dimensional coefficient algebra into an infinite-dimensional vector space over the original subfield; dimensions are always attached to the stated field.

### 3.5 Categorical rank and signed symmetry

Consume PivotalSpherical Layers 1–2 and the symmetric case of Layer 7: the canonical pivotal/spherical structure on a rigid symmetric category, `trace`, `quantumDim`, and their cyclicity, tensor, biproduct and symmetric-functor compatibility. With the scalar identification `End(𝟙)=F`, use `quantumDim` as categorical rank. This section computes it for motives using Layer 1 duality and Layer 2 traces, and computes its change under the signed symmetry. Identify it with dimension on finite vector spaces and with Euler characteristic on finite graded spaces with Koszul symmetry. (Jannsen, pp.450–451; Deligne–Milne, §2, pp.16–20.)

Assume rational algebraicity of the Künneth components for all smooth projective varieties. Their numerical classes are orthogonal central projectors and give `M=⊕M^r`, where for `(X,p,m)` the projector on `M^r` is `pπ_{r+2m}`. Prove well-definedness through numerical equivalence without claiming the original Weil functor descends. Modify the commutativity on `M^r⊗N^s` by `(-1)^{rs}`. For a numerical object, choose a homological idempotent lift by §3.4 before computing its realized image. For the modified symmetry the rank is the nonnegative integer `Σ dim pH^i(X)` for such a lift after the required coefficient extension; conjugacy of lifts makes this dimension independent of the choice. In characteristic zero Deligne's criterion yields a Tannakian category, possibly requiring an extension field for its fiber functor. Neutrality over `F` is a separate assertion. (Jannsen, Corollaries 1–2, pp.449–451.)

**Checks.**

- For a genus-two curve the original categorical rank is `-2`; this rules out an ordinary symmetric vector-space fiber functor with that original symmetry.
- Its modified rank is six; the odd–odd geometric interchange and the inserted sign multiply to `+1`.
- A point has rank one with either symmetry; zero has rank zero. Nonnegative rank does not itself select an `F`-rational fiber functor.
- For `𝟙(m)`, the grading is `-2m`, so changing the symmetry leaves its self-interchange unchanged.
- An odd one-dimensional graded object has categorical rank minus one before the symmetry correction and unsigned dimension one afterward.

### 3.6 Tannakian terminology

For characteristic-zero `F`, define a Tannakian category to be an essentially small rigid symmetric `F`-linear abelian category with `End(𝟙)=F` admitting an exact faithful strong symmetric monoidal fiber functor to finite vector spaces over some extension field `F'/F`. Call it neutral if such a fiber exists over `F`. Give transport across a marked tensor equivalence and scalar-compatibility lemmas. The abstract neutral reconstruction in Layer 6 works in arbitrary field characteristic; this paragraph's characteristic-zero restriction is for the positivity criterion used above. (Deligne–Milne, Definition 2.19 and §3, pp.24, 30–31; Jannsen, p.452.)

**Checks.**

- Finite vector spaces over `F` are neutral; super vector spaces with an odd line do not have the ordinary symmetric forgetful functor in characteristic different from two.
- A fiber valued in `F'` does not assert the existence of one valued in `F`.
- The zero category fails `End(𝟙)=F`: its unit endomorphism ring is zero, whereas `F` is a field.
- Mixed motives are not declared semisimple merely because their pure numerical subcategory is semisimple.

### Examples

The dual-number examples isolate the categorical hypotheses in Jannsen's theorem. A positive-genus curve isolates the role of symmetry in Tannakian recognition. A numerical projector defines a genuine numerical summand unconditionally; realizing that summand cohomologically requires the additional lifting assumptions and choices of §3.4.

### Dependencies

Layers 0–2 and finite-dimensional algebra, with PivotalSpherical Layers 1–3 and 7 supplying generic trace, dimension and finite semisimplicity. Section 3.2 supplies the additional endomorphism-algebra criterion. The unconditional semisimplicity theorem uses no standard conjecture. The grading, signed symmetry and radical-lifting refinements explicitly assume algebraic Künneth components. Abstract arbitrary-category reconstruction is in Layer 6 and can be proved independently of the geometric layers.

## Layer 4: transfer foundations, geometric motives, and compact support

Here `R` is an arbitrary commutative coefficient ring. Units and additive-functions examples are integral transfer objects before coefficient extension; no action of an arbitrary `R` on these groups is presumed. All constructions use separated finite-type schemes, and the smooth site includes nonquasiprojective schemes.

### 4.1 Finite correspondences on smooth schemes

For any field `k`, let `Sm k` be a small model of smooth separated finite-type `k`-schemes, including the empty scheme and disconnected schemes. Define `FiniteCor k X Y` as the free abelian group on integral closed subschemes `W⊂X×Y` finite and surjective over a connected component of `X`. Supply generator membership, coefficient extensionality, support, addition, and decomposition in either variable over finite disjoint unions. The support condition is finiteness over the *source*, not properness over the target. The coefficient version is `FiniteCor k X Y ⊗ℤ R` for a commutative ring `R`. These are actual cycles, before rational equivalence; Layer 0's Chow correspondences are not a substitute. (MVW, Definition 1.1 and Example 1.2, pp.3–4.)

Construct composition by intersecting the two pulled-back cycles on `X×Y×Z` and pushing along `pr₁₃` on their support. Prove proper intersection, finiteness of the resulting support over `X`, and independence of representatives of cycles; the projection is proper on that support although the ambient schemes need not be proper. Prove associativity using the regular middle schemes and the supplied intersection multiplicity/base-change formulas. The diagonal is the identity. Define `SmCor k R`, the graph functor `Sm k → SmCor k R`, and exterior product, with bilinearity, interchange, unit, symmetry and associator. Establish finite separable extension/restriction and continuity over filtered field extensions, including multiplicities. A finite flat map has a transpose correspondence; an arbitrary map need not. (MVW, Lemma 1.4, Definition 1.5 and Lemmas 1.6–1.7, Definition 1.9, Exercises 1.10–1.13 and Appendix 1A, pp.4–11; Lecture 9, pp.65–70.)

**Checks.**

- `FiniteCor(point,point)=ℤ` and composition is multiplication. With two points the matrix units satisfy `E₁₂E₂₁=E₁₁`; reversing composition gives `E₂₂`. Empty source or target gives zero, so the empty scheme has zero identity.
- The graph of `𝔸¹→point` is finite over its source and is a correspondence. Its transpose is not finite over the point; declaring all transposes admissible fails on this example.
- For a finite flat `f:X→Y` of constant degree `d`, `Γ_f ∘ Γ_fᵗ=d·id_Y`. This includes a purely inseparable finite flat map in characteristic `p`: its multiplicity is not the number of geometric points.
- Exterior product with the point is the identity, and with an empty scheme is zero. For `R=0` every Hom is zero; none of the category axioms require nonzero coefficients.

### 4.2 Presheaves with transfers and their tensor product

Define `PST k R` as additive `R`-linear functors `(SmCor k R)ᵒᵖ → ModuleCat R`; give the forgetful functor to ordinary presheaves, evaluation, kernels, cokernels, sums and filtered colimits. These are computed objectwise, and the category is abelian with enough projectives and injectives. Define `Rtr X(Y)=FiniteCor k Y X ⊗ R`. Prove the linear Yoneda isomorphism `Hom(Rtr X,F)≃F(X)`, its naturality, projectivity of `Rtr X` in `PST`, and the canonical epimorphism from a sum of representables indexed by sections. Constant presheaves with transfers use locally constant functions and degree-weighted transfer on each connected component; the units presheaf uses norms, not additive trace. (MVW, Definition 2.1, Examples 2.2 and Theorem 2.3, pp.13–14; Lemma 8.1, p.55.)

Construct `TransferTensor` by extending `Rtr X ⊗tr Rtr Y=Rtr(X×Y)` along presentations by sums of representables, equivalently by the additive coend. Give the balanced universal property for pairings, right exactness, preservation of colimits, internal Hom, tensor unit `Rtr(point)`, and symmetric monoidal coherence. It is not the pointwise tensor of the underlying presheaves: a correspondence acts once on a pairing, whereas separately applying it to both factors would square its multiplicity. For a pointed `X` with `x:point→X`, define `Rtr(X,x)=coker(R→Rtr X)`; the structural retraction splits it off. Define the smash representable of several pointed schemes by tensoring these reduced summands and identify it with the quotient by the coordinate basepoint summands. (MVW, Definition 8.2 and Lemma 8.3, pp.55–56; Definition 2.12 and Lemma 2.13, pp.15–16.)

**Checks.**

- **Presheaves.** Yoneda at the point identifies `Hom(R,F)` with `F(k)`. At the empty scheme an additive presheaf is zero. Evaluation of an exact sequence is exact in `PST`; this does not assert that sections are exact after Nisnevich sheafification.
- **Presheaves.** On the constant object, the transfer of a degree-two point extension is multiplication by two. On units it is the norm; for an element of the ground field it is its square. Both controls remain meaningful in characteristic two.
- **Presheaves.** A morphism of underlying presheaves which does not commute with the norm is not a morphism in `PST`. Graph naturality alone does not test transfer naturality.
- **Tensor.** For two disjoint points `S`, `Rtr S⊗tr Rtr S=Rtr(S×S)` has four point summands. Tensoring with `Rtr(point)` preserves an object and tensoring with zero gives zero.
- **Tensor.** The correspondence `2id` acts as two on the unit. A putative pointwise tensor action on both unit factors gives four and violates the tensor-unit constraint, already over `ℤ`.
- **Tensor.** Three two-point representables give eight summands under either parenthesization. The associator preserves their three ordered indices; an arbitrary isomorphism between rank-eight modules does not specify that coherence.
- **Reduced object.** Reducing the pointed point gives zero; the unreduced point representable is the unit.
- **Reduced object.** Reducing `point ⊔ point` at its first point gives one unit; the unreduced representable has two. The basepoint inclusion has zero kernel, so using its kernel would lose the remaining point.
- **Reduced object.** Smashing with the pointed point gives zero; smashing two pointed two-point schemes gives one reduced point summand, rather than all four unreduced summands.

### 4.3 Nisnevich descent with transfers

Restrict SchemeAndStackFoundations §§2.12–2.14's `Nisnevich.nisnevichTopology` and `Nisnevich.ElementaryDistinguishedSquare` to `Sm k`. Construct comparison with the supplied small Nisnevich sites on each smooth scheme, using the essentially smooth neighbourhood limits for `henselianStalk`. Transport `nisnevich_points_henselization` and `nisnevich_cohomological_dimension` to this restriction. An upper distinguished square has an open immersion `U→X`, an étale `V→X`, and an isomorphism over the reduced closed complement; `W=U×_X V`. Construct its `GrothendieckTopology.MayerVietorisSquare` instance on the smooth site. Prove that a module presheaf is a sheaf exactly when it vanishes on the empty scheme and sends these squares to pullbacks, compatibly with the supplied small-site criterion. Cohomology uses `Sheaf.H` and the resulting bound `cd_Nis X≤dim X`. These are restriction and comparison results; transfer extension and sheafification are constructed below. (MVW, Lecture 12, definition preceding Example 12.1, Definition 12.5, Lemma 12.7 and Porism 12.8, pp.89–92; SchemeAndStackFoundations §§2.12–2.14.)

Define `ShNisTr k R` as the full subcategory of `PST` whose underlying presheaf is a Nisnevich sheaf. Construct `a_NisTr`, left adjoint to inclusion, with underlying ordinary associated sheaf, and prove exactness, uniqueness of the extended transfer structure, abelianness, and enough injectives. The construction extends a finite correspondence over a henselian local source by its finite local pieces and glues their actions; check composition before descending from stalks. Prove that `Rtr X` is already a Nisnevich sheaf and that `Extⁿ_ShNisTr(Rtr X,F)=Hⁿ_Nis(X,F)` naturally. Extend to derived Hom and hypercohomology for complexes using injective resolutions and the finite cohomological-dimension bound. Do not assert that `Rtr X` remains projective after sheafification. (MVW, Theorem 13.1, Lemma 13.4 and Exercise 13.5, pp.99–100; Lemma 6.2, p.37.)

**Checks.**

- **Topology and square.** The identity and an open cover are covers. A nontrivial separable field extension by itself is étale but is not a Nisnevich cover of the point, since its residue field is different. An empty family covers only the empty scheme.
- **Topology and square.** If `U=X`, the square condition reduces to an identity; if `U=∅`, the distinguished-square condition forces `V≃X`. A general étale map cannot replace this complement isomorphism.
- **Topology and square.** A henselian local test scheme has no positive Nisnevich cohomology; a field is the dimension-zero case. The bound on a smooth curve permits `H¹`, whereas asserting vanishing on every affine smooth scheme would fail for `𝔾_m` on an affine scheme with nontrivial Picard group.
- **Transfer sheaves.** Applying `a_NisTr` twice gives the same sheaf; the constant transfer object and units sheaf are unchanged. A locally zero section becomes zero even if it was globally nonzero before sheafification.
- **Transfer sheaves.** An exact sequence of sheaves is locally surjective on sections, not necessarily surjective on `X`-sections. In particular `Ext¹(Rtr X,𝔾_m)=Pic X` can be nonzero; objectwise projectivity from `PST` does not survive.
- **Transfer sheaves.** The degree-two transfer of a constant section remains twice that section after sheafification, including over `𝔽₂`; changing the topology does not erase integral multiplicities.

### 4.4 Suslin complexes and effective Tate complexes

For `F∈PST`, define the simplicial transfer object `n↦F(-×Δⁿ)`, where `Δⁿ=Spec k[t₀,…,t_n]/(Σt_i-1)`, with every face and degeneracy induced by the cosimplicial affine simplex. Define `SuslinComplex F=C_*F` with differential `Σ(-1)^i δ_i*`, putting chain degree `n` in cohomological degree `-n`. Give the normalized model and its natural quasi-isomorphism with the unnormalized one, augmentation `F→C_*F`, functoriality, additivity, field extension, and totalization on bounded-above complexes. Construct the prism homotopy between the two endpoint maps and prove `H_n(C_*F)` is a homotopy invariant presheaf with transfers. Its zeroth homology is the universal homotopy invariant quotient of `F`. (MVW, Definition 2.14, Lemma 2.16, Definition 2.17, Lemma 2.18, Corollaries 2.19 and 2.24 and Definition 2.25, pp.16–20.)

For `q≥0`, define `Z(q)=C_*Ztr(𝔾_m,1)^{∧q}[-q]` and `R(q)=Z(q)⊗ℤ R`, with `Ztr(𝔾_m,1)^{∧0}=Z`. Supply the degreewise flat model, so this coefficient change computes derived tensor, and prove Nisnevich descent termwise. Give the products `R(p)⊗tr^L R(q)→R(p+q)` through exterior product and Eilenberg–Zilber; after localization in §4.6 they are isomorphisms. Define `H^{a,q}(X,R)=𝔥ᵃ_Zar(X,R(q))`, with restriction, cup product and coefficient-change maps; its Nisnevich description over perfect fields follows below. Negative Tate twists come from the stabilization of §4.11, not from extrapolating this effective definition. (MVW, Definition 3.1 and §3 products, pp.21–24; Definitions 8.2 and 14.2, pp.56,109.)

Prove `Z(0)≃Z[0]` and the integral weight-one comparison `Z(1)≃𝔾_m[-1]` over any field. Construct the divisor sequence on the pointed projective line: rational functions regular with value one at both boundary points give principal divisors, and the remaining invariants are degree and norm of the coordinate. Contract the function complex by the explicit affine-parameter homotopy to identify its cone. Include compatibility with transfer norms. This supplies the weight-one calculation rather than assuming it in the Tate notation. (MVW, Theorem 4.1 and Lemmas 4.4–4.6, pp.25–27.)

**Checks.**

- **Suslin complex.** On a constant transfer object `A`, all face maps are identities, hence the unnormalized differentials are `d₁=0`, `d₂=id`, `d₃=0`; the normalized complex is `A[0]`. A zero differential in every degree would give incorrect higher homology.
- **Suslin complex.** With `t=t₁` on `Δ¹`, the boundary is `value at 1 − value at 0`. The identity path on `𝔸¹` therefore has boundary `[1]-[0]`. The two endpoints become equal in `H₀` over every field, including `𝔽₂`, with integral coefficients.
- **Suslin complex.** `H₀(C_*Ztr(𝔸¹))=ℤ`, while `CH₀(𝔸¹)=0`. A Suslin complex of finite correspondences cannot be replaced by the unrestricted Bloch cycle complex. Empty representables give the zero complex.
- **Tate complexes.** `R(0)=R`, and `R(1)[2]` has the projective-line reduced-motive normalization. The weight-one formula gives `H^{1,1}(X,ℤ)=O(X)*` and `H^{2,1}(X,ℤ)=Pic X`, not the reverse degrees.
- **Tate complexes.** At a field `H^{1,1}(k,ℤ)=k*` and `H^{2,1}(k,ℤ)=0`; on `ℙ¹`, the latter group is `ℤ`. Multiplication by a field unit respects its norm under finite extension.
- **Tate complexes.** Although `𝔾_m(𝔽₂)` has one rational point, the reduced transfer complex is not zero: weight one on `ℙ¹_𝔽₂` still has `H^{2,1}=ℤ`. Replacing a scheme by its rational-point set would fail this test.
- **Tate complexes.** Coefficients `ℤ/n` use the displayed flat complex: the derived long exact coefficient sequence retains torsion. Ordinary tensoring of an already computed cohomology group cannot replace that sequence. For `R=0` all these complexes vanish.

### 4.5 Excision, contraction and strict homotopy invariance

Define `HI_PST` by requiring `F(X)→F(X×𝔸¹)` to be an isomorphism for every smooth `X`. Construct the relative-Picard adapter with boundary: `PicWithBoundary(Xbar,D)` is the group of line bundles on `Xbar` with a specified trivialization on the reduced closed `D`, modulo isomorphism preserving that trivialization. Supply tensor/inverse, pullback, forgetting or restricting the boundary, the exact sequence `O(Xbar)*→O(D)*→PicWithBoundary(Xbar,D)→Pic(Xbar)→Pic(D)`, and the divisor map. For `S∈Sm k`, a smooth quasi-affine relative curve `X/S` with normal proper compactification `Xbar` and reduced boundary `D` in an affine open, define `RelativeFiniteCycles(X/S,n)` by integral closed cycles in `X×Δⁿ` finite and surjective over components of `S×Δⁿ`, with face pullback and alternating differential. For this smooth base `S`, identify its degree-zero homology with `PicWithBoundary(Xbar,D)`. Trivializations extend near the boundary, giving surjectivity by Cartier divisors away from it; the kernel consists of principal divisors of functions equal to one there and is killed by `1-t+tf`. For `S∈Sm k` and `F∈HI_PST`, give the pairing `PicWithBoundary(Xbar,D)⊗F(X)→F(S)`, functoriality, and the finite-map norm compatibility needed for excision. This augments the supplied relative Picard geometry with boundary data; it does not replan ordinary Picard groups. (MVW, Definition 7.10, Corollary 7.12, Theorem 7.16, Corollary 7.17 and Lemma 7.24, pp.49–54.)

To prove the sheaf and cohomology assertions used by localization, construct the standard-triple presentation and its excision homotopies. A standard triple consists of a normal proper relative curve `Xbar→S` over smooth affine `S`, a boundary `X∞` with smooth quasi-affine complement `X`, and a disjoint closed `Z⊂X`, with `Z∪X∞` in an affine open of `Xbar`. Supply restriction and refinement; splitting over `U⊂X` means that the diagonal line bundle on `U×_S Xbar` becomes trivial on `U×_S Z`. Construct the corresponding finite-correspondence lift `U→X-Z` up to `𝔸¹` homotopy by relative Picard with boundary and principal divisors. Construct presentations around each specified point by projection of an affine neighborhood and normal compactification. Over an infinite field use the open set of admissible projections; over a finite field pass to two towers of extensions of coprime degrees and descend the identities by restriction/corestriction and Bézout. No division by an extension degree is needed. (MVW, Definitions 11.5 and 11.11, Lemma 11.14 and Proposition 11.15 and Theorem 11.17 with Porism 11.18, pp.84–87.)

Prove injectivity of `F(S)→F(V)` for a dense open of a smooth semilocal scheme at finitely many points of a quasiprojective smooth scheme. Construct the split-triple cover homotopies for an upper distinguished square and prove Nisnevich excision for `HI_PST`. Deduce, over *any* field, that `F_Zar` has a unique transfer structure, is a homotopy invariant Nisnevich sheaf, and equals `F_Nis`; dense-open restriction is injective after sheafification. The square homotopy is built from two Picard lifts whose difference is the principal-divisor homotopy, and gives the required nullhomotopy on the Mayer–Vietoris complex after shrinking. It is not supplied by the definition of the topology. (MVW, Proposition 11.1, Corollary 11.2 and Theorem 11.3, pp.83–84; Definition 21.1, Theorem 21.6 and Lemmas 21.7–21.9, pp.175–181; Theorems 22.1–22.3, Lemmas 22.8–22.10 and Theorem 22.15, pp.183–188.)

For a homotopy invariant transfer sheaf define the contraction `F_{-1}(X)=coker(F(X×𝔸¹)→F(X×𝔾_m))`. The section `1` splits the restriction and identifies this with the kernel of evaluation at `1`; construct transfers, iteration and commutation with sheafification. Construct the residue sheaf for a smooth divisor by Nisnevich excision and identify the affine normal-line model with `F_{-1}`. Over a perfect field prove **strict** homotopy invariance `Hⁿ_Nis(X,F)≃Hⁿ_Nis(X×𝔸¹,F)` for all `n≥0`. Build the henselian-local affine-line vanishing by induction on dimension, using smooth-divisor residues and the Leray edge map; perfectness is used when choosing smooth dense strata. Construct the resulting Gersten resolution with degree-`r` term `⊕_{x∈X^{(r)}}F_{-r}(κ(x))`, residues, and differential-square-zero, so its flasqueness computes the sheaf cohomology. This is the local proof engine for the effective category, distinct from Layer 7's cohomology-with-supports applications. (MVW, definition preceding Example 23.1, Proposition 23.5, Definition 23.6 and Proposition 23.10, Lemma 23.11 and Theorem 23.12, pp.191–195; Theorems 24.1–24.2, Proposition 24.3 and Lemma 24.4, Corollary 24.5, Example 24.6 and Theorem 24.11, pp.197–201.)

**Checks.**

- **Homotopy invariance.** A constant transfer sheaf and units are homotopy invariant: smooth schemes are reduced, so polynomial units are constant in the affine-line coordinate.
- **Homotopy invariance.** The additive functions presheaf is a transfer presheaf but fails already at `k→k[t]`; the section `t` is absent from the source. Existence of trace transfers does not imply homotopy invariance.
- **Homotopy invariance.** The zero presheaf satisfies the condition. For a disjoint union, the comparison is the product of comparisons on its components; a test only at the field would not establish the quantified condition on every smooth scheme.
- **Boundary Picard.** Empty boundary gives ordinary Picard; a boundary equal to the whole scheme forces a trivialized line bundle and gives the zero group. For `(ℙ¹,{∞})` over a field the result is `ℤ`, because the two unit groups in the exact sequence coincide.
- **Boundary Picard.** For `(ℙ¹,{0,∞})` the kernel of forgetting the boundary is `k*`, the quotient of `(k*)²` by diagonal units; thus the group is an extension of `ℤ` by `k*`. Forgetting both trivializations would lose that kernel.
- **Boundary Picard.** A function equal to one along the boundary has zero class under its principal divisor. A boundary ratio changes the class exactly when it is nonzero in `O(D)*/image(O(Xbar)*)`; a finite-map pushforward uses its norm. On `(ℙ¹_ℚ,{∞})`, the constant function `2` gives the same boundary-Picard class as `1` after a global-unit change. On `(ℙ¹,{0,∞})`, the ratio `(1,a)` for `a≠1` gives a nonzero kernel class. The zero divisor maps to the trivial line bundle with trivialization one.
- **Relative finite cycles.** For the singular normal base `S=Spec(ℚ[x,y,z]/(xy-z²))`, `𝔸¹_S→S` is smooth with normal compactification `ℙ¹_S` and boundary `∞`, but `F(S)` is outside the domain of `F∈PST`. The boundary-Picard group still makes sense; the comparison and transfer pairing above require `S∈Sm k`.
- **Relative finite cycles.** For `S=point` and `X=𝔸¹`, degree-zero homology is `ℤ` via degree, in contrast with `CH₀(𝔸¹)=0`. For `X=𝔾_m` and its two-point boundary in `ℙ¹`, it retains the additional `k*` boundary-Picard invariant.
- **Relative finite cycles.** A section of `X→S` gives a finite relative cycle even when `X` is not proper. The whole positive-dimensional fiber does not; finite support over `S` is required. Empty `X` gives zero cycles.
- **Relative finite cycles.** For a function `f=1` on the boundary, the divisor family `1-t+tf` has boundary `div(f)-0`; omitting the affine-homotopy quotient would leave this principal divisor nonzero. The pairing of a section with `F(X)` agrees with restriction along that section.
- **Triple and splitting.** `(ℙ¹, {∞}, {0})` over a field is a standard triple. It splits even over all of `X=𝔸¹`: the diagonal line bundle on `𝔸¹×𝔸¹` is trivial. The definition asks for a trivialization of a line bundle, not that its distinguished diagonal section be nowhere zero.
- **Triple and splitting.** On a smooth affine curve `X=Spec A` and rational point `z`, splitting over `D(f)` requires the ideal of `z` to become principal in `A[1/f]`; a nonprincipal such ideal gives a nonsplit example. With `Z=∅` the boundary trivialization is empty data. A boundary meeting `Z`, or a complement not smooth over `S`, is inadmissible. A chosen affine neighborhood of one point does not assert that any finite set in a nonquasiprojective scheme lies in an affine open.
- **Triple and splitting.** Over `𝔽₂` a nonempty open parameter set can have no rational point. If two extension degrees `d,e` are coprime, identities killed by both are killed by `ad+be=1`; a single extension of degree two does not justify integral descent of a two-torsion identity.
- **Contraction.** For constant `A`, `A_{-1}=0`. For `𝔾_m`, units in `O(X)[t,t⁻¹]` on a connected smooth scheme are `u t^n`, so `(𝔾_m)_{-1}=ℤ`, with evaluation at one removing `u`; evaluating at zero would not be defined.
- **Contraction.** On a smooth DVR the units residue is the valuation: `res(t)=1`, `res(u)=0`. Thus `0→O*→K*→ℤ→0` fixes the sign. With zero sheaf the residue sequence is zero, and a contraction without the constant summand removed would fail both controls.
- **Contraction.** Contracting units twice gives zero, because their first contraction is the constant `ℤ` sheaf. Disconnected smooth schemes give one exponent for each component, not one exponent for the whole scheme.
- **Strict invariance.** For a field or smooth henselian local scheme, positive Nisnevich cohomology vanishes. For `F=𝔾_m`, degree one recovers `Pic(X)≃Pic(X×𝔸¹)`; strict invariance does not say that this Picard group is zero. No strict-invariance theorem over an imperfect field is inferred from the all-field degree-zero result.
- **Gersten resolution.** For a constant sheaf on a connected smooth integral scheme, the generic term is that constant group and all positive-codimension terms vanish, since its contractions vanish. The degree-zero kernel recovers its sections; adding an unreduced constant summand to contraction would create spurious terms.
- **Gersten resolution.** For units on a smooth curve the complex is `k(X)*→⊕_{x∈X^{(1)}}ℤ`, with the valuation differential. On `ℙ¹` its cokernel is `ℤ` by divisor degree; on `𝔸¹` its cokernel is zero. A complex computing only generic sections would miss the first Picard group.
- **Gersten resolution.** At a smooth local parameter `t`, the divisor differential of `t^a u` is `a`, including negative `a`; a unit has differential zero. The higher terms for units vanish because the second contraction is zero. For the zero sheaf every term and its augmentation are zero.

### 4.6 Effective localization, derived tensor and the ambient category

Use Mathlib's `DerivedCategory`, quotient/localization and triangulated carriers for the abelian category `ShNisTr k R` of §4.3. Define `DM_eff,-(k,R)` as `D⁻(ShNisTr k R)` localized at the cones of `Rtr(X×𝔸¹)→Rtr X`. The kernel is the triangulated subcategory closed under retracts and those sums that exist in `D⁻`, generated by these cones. Give the quotient functor, factorization/uniqueness for exact functors annihilating these cones, and `M(X)` as the image of `Rtr X`. Construct derived `⊗tr` by representable resolutions in `PST` followed by exact Nisnevich sheafification. Prove independence of resolution, unit and symmetric monoidal coherence, `M(X)⊗M(Y)≃M(X×Y)`, and that the `𝔸¹` kernel is a tensor ideal. Generic derived categories are already in Mathlib; the transfer-specific resolutions, descent and localization compatibility are the new targets. These constructions work over any field and any commutative coefficient ring. (MVW, Definitions 14.1–14.2 and Lemma 14.4, pp.109–111; Lecture 8, pp.55–63.)

Over perfect `k`, prove that the `𝔸¹`-local complexes in `D⁻` are exactly those whose Nisnevich cohomology sheaves are homotopy invariant. Prove `K→Tot C_*K` is the localization map and identify the quotient with this full subcategory. The proof first shows that a Nisnevich-acyclic transfer presheaf has acyclic sheafified Suslin complex, then uses strict invariance and the bounded-above hypercohomology spectral sequence. Export `Hom_DM(M(X),L[n])≃𝔥ⁿ_Nis(X,L)` for local `L`, agreement with Zariski hypercohomology for homotopy invariant cohomology sheaves, functoriality in `X,L`, shifts and coefficients, and the relocated tensor `Tot C_*(K⊗tr^L L)`. Do not identify an unlocalized objectwise tensor with this tensor. (MVW, Proposition 13.7, Theorem 13.8, Propositions 13.9–13.10, Theorem 13.12 and Corollary 13.14, pp.100–102; Proposition 14.8, Corollary 14.9, Theorem 14.11 and Proposition 14.16, pp.112–115.)

Construct also `DM_eff(k,R)` from the **unbounded** derived category by localization at the localizing subcategory generated by the same cones. Give existence of the localization/right adjoint through a transfer-specific complex resolution: representable cells, Nisnevich hypercover descent, then `𝔸¹` cells. Prove that finite upper-distinguished-square complexes generate Nisnevich descent and that finite cohomological dimension makes the smooth representables compact after this localization. Deduce compact generation and identify the compact objects with the thick closure of the `M(X)`. Over perfect fields construct the fully faithful comparison from `DM_eff,-` to this ambient category, compatible with tensors, the generators, and every coproduct that exists in the bounded-above presentation. Use truncation and the bounded Nisnevich descent generators for this comparison; do not extend a bounded-above totalization argument to arbitrary complexes without that step. Sources for this precise unbounded construction and compactness are Cisinski–Déglise, Definition 11.1.1 and paragraph 11.1.2, Example 11.1.3, Definitions 11.1.7 and 11.1.10 and Theorem 11.1.13, pp.304–307, using §5.2, Proposition 5.2.38 and Corollary 5.2.39, p.200, and Remark 10.3.18, pp.296–297. Only their field-base specialization is required here; compact generation itself does not require perfectness or rational coefficients.

**Checks.**

- **Localization.** `M(point)=R`, `M(∅)=0`, and each projection `M(X×𝔸¹)→M(X)` becomes invertible by the defining quotient. Its cone is killed; the universal property requires killing that cone, not all acyclic-looking geometric diagrams.
- **Localization.** For perfect `k`, the constant sheaf is local while additive functions fail the degree-zero invariance test. A local complex shifted by any integer is still local; checking only its zeroth sheaf would miss a noninvariant sheaf shifted into degree one.
- **Localization.** The zero complex is local and any exact functor killing the projection cones factors through the quotient. An exact functor which sends one projection to a nonisomorphism cannot factor; exactness alone is not the factorization premise.
- **Derived tensor.** Tensoring representables for two two-point schemes gives four summands and the point is the tensor unit. A derived coefficient change `ℤ→ℤ/n` preserves the distinguished coefficient triangle; underived tensor of its cohomology need not.
- **Derived tensor.** The projection cone stays killed after tensoring with `M(Y)`, because it becomes the projection cone for `X×Y`. This is the generator test for the tensor ideal, including `Y=∅`.
- **Derived tensor.** Over integral coefficients, `ℤ/2 ⊗tr^L ℤ/2` is represented by multiplication by two on `ℤ/2`, hence has `ℤ/2` in degrees `0` and `-1`. Underived tensor has only degree zero; the discrepancy survives evaluation at a field.
- **Ambient category.** For nonzero `R`, an infinite sum of shifts `⊕_{n≥0}R[-n]` is unbounded above and is not an object of `D⁻`; the ambient category permits it. Uniform upper bounds are required for termwise sums that remain in `D⁻`.
- **Ambient category.** `Hom(M(X),⊕L_i)=⊕Hom(M(X),L_i)` for the smooth compact generators. An infinite sum of nonzero units is not compact: its identity cannot factor through a finite subsum. For `R=0` that negative control is deliberately unavailable.
- **Ambient category.** Over `𝔽₂` the construction still uses integral transfer coefficients, not coefficients with two inverted. Over an imperfect field the definition and compact-generation theorem remain targets, but the perfect-field cohomology-sheaf criterion is not asserted by this proof.

### 4.7 Bloch's higher-cycle complexes

Use **KTheoryFiniteLocalFields**, §3.0a (`motivicCycles`), for `BlochCycle X r n=z_r(X,n)` and `HigherChow X r n=H_n(z_r(X,*))`, with `X/k` separated of finite type, `r∈ℤ`, `n≥0`, and zero higher Chow groups for `n<0`. Its generators have dimension `r+n` in `X×Δⁿ` and meet every iterated face `F` in dimension at most `r+dim F`; empty intersections are allowed. Use the supplied face intersections, flat degeneracies, ordered alternating differential, normalization, nilpotent invariance and finite-disjoint-union decomposition. For pure-dimensional `X` of dimension `d`, the supplied conversion is `CH^q(X,n)=CH_{d-q}(X,n)`; use it componentwise in mixed dimensions. Negative `r` are allowed. This Bloch complex remains distinct from this roadmap's `C_*Ztr X`; their geometric comparisons belong to §§4.15–4.18. (MVW, Definition 17.1, Exercise 17.3 and Appendix 17A, pp.135–137,143–146; Levine, *Techniques of localization*, §1.1 and §1.8, pp.1,3–4 of the author preprint.)

Use `motivicCycles`' proper pushforward, zero when image dimension drops, flat pullback of relative dimension `e` into `z_{r+e}`, open restriction, shuffle external products and their projection/base-change identities. Its coefficient complex `z_r(X,*)⊗ℤ R` computes derived coefficient change because the terms are free; its degree-zero identification is `CH_r(X,0)=CH_r(X)`. All motive comparisons here use these same objects and maps, including the supplied smooth intersection product through the good-position comparison of §4.8. (MVW, pp.135–137 and Appendix 17A, pp.143–146; Levine, §1.1 and §1.6, pp.1–2.)

**Checks.**

- **Complex.** In degree zero every dimension-`r` cycle is admissible. In degree one `d=[fiber at 1]-[fiber at 0]`; on the path `Δ¹→𝔸¹`, the resulting boundary is `[1]-[0]`. In degree two each codimension-two face occurs twice with opposite signs, giving `d₁d₂=0` integrally, including in characteristic two.
- **Complex.** A cycle supported inside a vertex face is inadmissible when it has excess dimension there. Checking only that a cycle meets the codimension-one faces, rather than checking all iterated faces properly, fails this test.
- **Complex.** At `X=point,r=0`, the unnormalized groups are `ℤ` with alternating differentials, so `CH₀(point,0)=ℤ` and `CH₀(point,n)=0` for `n>0`. At `r=-1`, the complex has no degree-zero cycles but can have degree-one homology: `CH^1(k,1)=k*`.
- **Groups and operations.** `CH₀(𝔸¹,0)=0` and `CH₀(ℙ¹,0)=ℤ`; removing the properness hypothesis would give an invalid degree pushforward from `𝔸¹`. Flat pullback along `𝔸¹→point` sends `CH₀(point,0)` to `CH₁(𝔸¹,0)`, not to `CH₀`.
- **Groups and operations.** Empty schemes give zero; a fat point has the same complex as its reduced point. This does not assert integral invariance under every universal homeomorphism. A disjoint union of a point and a curve needs the dimension grading, not one global codimension conversion.
- **Groups and operations.** `CH^1(k,1;ℤ)=k*`, `CH^1(k,0)=0`, and `CH^0(k,0)=ℤ`. A coefficient triangle can have a nonzero torsion connecting map, so tensoring the integral homology alone is insufficient.

### 4.8 Moving, localization, homotopy and higher-Chow transfers

Use **KTheoryFiniteLocalFields**, §3.0a (`motivicCycles`), for the admissible-closure subcomplex `z_r(U,*)_X` and its quasi-isomorphism to `z_r(U,*)` for every open `U⊂X` in a separated finite-type scheme over any field. The supplied proof includes face subdivision, face-blow-up refinements, finite-family relative moving homotopies and passage through finite truncations and affine covers. These constructions, including the cycle-admissibility specialization of monomial-ideal flattening, belong to that supplier. (Levine, *Techniques*, Theorems 1.10 and 6.12, Proposition 6.14, pp.4–5,37–42.)

Consume its distinguished triangle `z_r(Z,*)→z_r(X,*)→z_r(U,*)→z_r(Z,*)[1]` for every closed `Z⊂X`, `U=X-Z`, and its flat homotopy quasi-isomorphism `z_r(X,*)→z_{r+e}(X×𝔸^e,*)` for every `r∈ℤ`, `e≥0`, with their naturality squares and arbitrary derived coefficients. No smoothness or quasiprojectivity is imposed on these localization and homotopy results. Pushforward and restriction are the first two triangle maps; restriction need not be surjective degreewise. Use the supplier's integral finite-field descent by two coprime extension degrees, with no resolution or rationalization hypothesis. (MVW, Properties 17.4, pp.136–137; Levine, Theorem 1.7, Lemma 7.1 and §7, pp.2–3,43–44 of the author preprint.)

For finite correspondences `W:X→Y` in §4.1's `SmCor`, use `motivicCycles`' good-position subcomplex `z^q(Y,*)_W`, its global quasi-isomorphism and its intersection-pushforward action through the derived inverse. Here `X,Y` are smooth separated finite-type schemes; incidence moving requires the smooth target. The supplier's simultaneous-incidence version includes both correspondences and their composite, Zariski hypercohomology descent on affine-cover overlaps, independence, graph agreement, identity, additivity, composition and external-product compatibility. Thus the higher Chow groups used here carry the supplied presheaf-with-transfers structure on all smooth schemes, with agreement with the Jouanolou construction on quasiprojective schemes. The raw cycle complex has no unrestricted strict correspondence pullback. These supplied maps are the higher-Chow maps used by the motive-category comparisons in §§4.15–4.18; relative-cycle specialization and cancellation remain the targets of §§4.8a and 4.9. (MVW, Definition 17.5, Proposition 17.6, Definition 17.7, Lemma 17.10, Corollary 17.11, Lemma 17.13 and Theorem 17.21, pp.137–142; Levine, *Techniques*, Theorem 8.2, pp.45–46.)

**Checks.**

- **Moving subcomplex.** For `U=X` it is the whole complex; for `U=∅` it is zero. An admissible cycle on `U×Δⁿ` whose closure acquires an excess component at a face is excluded, even though its restriction on `U` was admissible.
- **Moving subcomplex.** For a cycle already in good position the comparison preserves its homology class; simultaneous moving must preserve this property throughout the relative homotopy. A parameter chosen separately for each face need not define a chain map.
- **Moving subcomplex.** Over `𝔽₂`, adjoining parameters in one even-degree extension alone leaves possible two-torsion in the cone. Two coprime extension degrees remove it. No element `1/2` is used in the integral complexes.
- **Localization and homotopy.** For `Z=X` and `Z=∅` the triangles are the identity triangles. For `{0}⊂𝔸¹`, the map `CH₀(point,0)=ℤ→CH₀(𝔸¹,0)=0` is zero, so its preceding boundary must be capable of detecting that point class.
- **Localization and homotopy.** Affine-line invariance reads `CH_r(X,n)≃CH_{r+1}(X×𝔸¹,n)`. For the point at `r=0,n=0` the target is `CH₁(𝔸¹)=ℤ`; the unshifted `CH₀` is zero. Rank zero gives the identity comparison.
- **Localization and homotopy.** The closed-open triangle is a derived assertion; replacing it by a termwise short exact sequence would incorrectly force every admissible open cycle to have admissible closure. Derived coefficient change preserves it for `R=ℤ/2`.
- **Transfer action.** `id` acts as identity, a graph acts as ordinary pullback, and `2id` multiplies by two, not four. At a finite flat point extension, restriction then transfer multiplies by its degree.
- **Transfer action.** On weight one the action is the norm on `k*`. On `CH^0` it is degree. For two correspondences, imposing good position only for the first does not establish the composition formula; the simultaneous subcomplex must include all three constraints.
- **Transfer action.** The empty correspondence acts as zero. A finite affine cover of a nonquasiprojective smooth scheme still defines the action through descent, while a globally chosen Jouanolou torsor is not a prerequisite on that scheme.

### 4.8a Relative-cycle specialization and Cartier intersection

Over a noetherian base `S`, construct the universally defined finite relative cycles `c(X/S)` for separated finite-type `X/S`, their specialization multiplicities, and pullback along arbitrary base morphisms. Construct the equidimensional relative-cycle operations needed by §4.14 as well. Over a regular base the finite cycles have the usual free-generator description; over singular bases admissibility is additional data and naive fiberwise lengths are not the definition. Give identity, composition, proper pushforward, flat pullback, base change, exterior products, and the composition of relative cycles. For a Cartier divisor meeting a relative cycle properly in every required fiber, construct intersection, its specialization compatibility, and commutation with proper pushforward and base change on the stated admissible domain. These operations provide the singular-support multiplicities used by cancellation. (Suslin–Voevodsky, *Relative cycles and Chow sheaves*, §§3.3–3.4, pp.23–38, and §§3.6–3.7, pp.43–55; Voevodsky, *Cancellation theorem*, §§2–3, Proposition 3.1, Lemmas 3.2–3.3 and Corollary 3.4, pp.2–8.)

**Checks.**

- Over a field, a finite point of residue degree `a` pushes forward to `a`; empty support gives zero. Base pullback along an identity preserves every multiplicity.
- Intersecting `𝔸¹` with `t^p=0` in characteristic `p` gives `p[0]`, not one reduced point. Proper intersection is required even when the divisor is principal.
- For an admissible cycle over a singular base, successive specializations equal pullback along the composite; a nonflat support does not justify a flat-pullback formula.
- An intersection with a divisor containing an entire fiber is outside the proper-fiber-intersection domain. No Cartier operation on that cycle is inferred merely from the divisor's existence.

### 4.8b Adapted coordinates for smooth pairs

For a smooth closed immersion `Z→X` of pure codimension `c` between smooth finite-type schemes over any field `k`, construct Nisnevich-local adapted coordinates: on each pure-dimensional neighbourhood, with `d=dim X`, the pair admits an étale map to `(𝔸^d,𝔸^{d-c})` whose inverse image of the coordinate subspace is `Z`. Prove compatibility with restriction and products; the normal directions are exactly `c` coordinates. Derive this from the supplied smooth coordinates and the conormal exact sequence. These coordinates precede the smooth-blow-up contraction in §4.10 and the motivic Gysin construction in §4.13. (Voevodsky, proof of Proposition 3.5.4, pp.37–39; MVW, proof of Theorem 15.15.)

**Checks.**

- The pair `(𝔸^d,𝔸^{d-c})` has the identity adapted chart, with exactly `c` normal directions.
- For `c=0`, there is no normal coordinate and the closed subscheme is open and closed locally.
- Products of coordinate pairs concatenate the normal coordinates and add codimensions.
- A singular closed subscheme cannot satisfy the smooth-pair coordinate conclusion.

### 4.9 Integral cancellation and its derived form

Let `S_t^1=Ztr(𝔾_m,1)` in `PST`. Construct the cancellation homotopies on finite correspondences over any field. For coordinates `f₁,f₂` on the two multiplicative-group factors and a correspondence on `𝔾_m×X→𝔾_m×Y`, define the partially defined operator `ρ_n` by intersection with the principal divisor of `g_n=(f₁^{n+1}-1)/(f₁^{n+1}-f₂)` and projection to `X×Y`. Its API records the admissibility bound: for every finite collection of correspondences there is `N` such that all `n≥N` give proper intersections finite over the source. Prove independence up to admissible affine homotopy for large `n`, compatibility with composition and exterior products, and annihilation of the basepoint summands. For `n≥1`, `ρ_n(id_𝔾_m⊗W)=W`; for `n≥0`, it kills the map factoring through `1`. Construct the flip/inversion homotopies used to compare the left and right tensor factors, and deduce, for smooth `Y`, that `Ztr Y→F_Y`, where `F_Y(X)=Hom_PST(S_t^1⊗tr Ztr X,S_t^1⊗tr Ztr Y)`, induces `C_*Ztr Y(X)≃C_*F_Y(X)` for every smooth `X`. Sources: Voevodsky, *Cancellation theorem*, Lemmas 4.1 and 4.3–4.5, Theorem 4.6, Lemmas 4.7–4.8 and Corollary 4.9, pp.9–14. Relative-cycle pullback and proper Cartier-divisor intersection used in this construction are constructed over singular bases in §4.8a; the singular-support multiplicities are those in the paper's §3, Proposition 3.1, Lemmas 3.2–3.3 and Corollary 3.4, pp.6–8.

Over perfect `k`, use §4.5 strict homotopy invariance and §4.6 local-complex comparison to prove cancellation `Hom_DM(K,L)≃Hom_DM(K(1),L(1))` for arbitrary `K,L∈DM_eff,-(k,R)`. Give naturality in both variables, compatibility with shift, composition, coefficient extension and iteration, and full faithfulness of tensoring by `R(1)`. The chain construction is integral and extends `R`-linearly before taking the derived category; it is not obtained by tensoring integral Hom groups with `R`. On the unbounded compact subcategory the same comparison follows from its geometric generators and finite triangle/retract closure. These are the precise outputs used by §4.11 stabilization. This proof requires perfectness only at the descent/local-complex step, not in the finite-correspondence homotopies, and uses no norm-residue theorem. (Voevodsky, Corollary 4.10 and proof, pp.14–15; MVW, Theorem 16.25 and Remark 16.26, p.131.)

**Checks.**

- **Cancellation operator.** Restricting `g_n` to the diagonal has divisor of total degree one for `n≥1`, so the identity correspondence returns `W` with coefficient one. At `n=0` the diagonal denominator vanishes identically; that case is deliberately excluded from this identity formula.
- **Cancellation operator.** The basepoint projection is killed, whereas the reduced identity survives. Thus the proof descends to `S_t^1` and is not an inverse on the entire unreduced `Ztr 𝔾_m` summand.
- **Cancellation operator.** In characteristic `p`, roots of `t^{n+1}-1` can have multiplicity. Cartier multiplicities still give degree one in the ratio; counting only distinct geometric roots would fail. At `p=2` neither this degree computation nor the flip homotopy requires division by two.
- **Derived cancellation.** Tensoring the identity of the unit gives the identity of `R(1)`. Iterating twice agrees with twist two, and shifts commute with the isomorphism. For `R=0` it is the unique map between zero Hom groups.
- **Derived cancellation.** Full faithfulness does not identify `R(1)` with `R` or supply a negative twist in the effective category. A general tensor functor, such as rationalization of abelian groups killing prime torsion, need not be faithful.
- **Derived cancellation.** The perfect-field theorem applies over `𝔽₂` with integral coefficients and all coefficient primes. An imperfect-field input does not satisfy this proof's descent hypothesis, even though its `ρ_n` construction is available.

### 4.10 Exact cdh pullback and the complex comparison

On separated finite-type schemes define the cdh topology generated by Nisnevich covers and abstract blow-up squares (proper maps isomorphic off the closed center). Construct the morphism of sites from this site to the smooth Nisnevich site, with inverse image `π* : Sh_Nis(Sm k,R)→Sh_cdh(Sch k,R)`. It acts on **ordinary** sheaves; a transfer structure on every singular test scheme is not assumed. Under the stated Friedlander–Voevodsky resolution hypothesis, prove that `π*` is exact. Construct smooth hypercovers, refine cdh covers of smooth schemes by Nisnevich covers and smooth blow-ups, and prove the section-killing lemma for a sheaf with zero cdh image. Prove bounded cdh cohomological dimension on a finite-dimensional test scheme by the blow-up/Nisnevich dimension filtration, so the complex comparison below has a bounded cohomological range. These are the topology and exactness inputs, beyond a formal left Kan extension. Sources: MVW, Example 12.24 and end of Lecture 12, pp.95–97, especially Lemma 12.30; Suslin–Voevodsky, *Bloch–Kato conjecture and motivic cohomology with finite coefficients*, Proposition 5.11 and Theorem 5.13, pp.39–42 of the author preprint; Friedlander–Voevodsky, Definition 3.4, p.10.

Under the same resolution hypothesis, prove: if a transfer presheaf `F` has zero associated cdh sheaf, then `(C_*F)_Nis` is acyclic. Build the smooth-blow-up Mayer–Vietoris Ext vanishing for homotopy invariant transfer sheaves using §4.8b’s smooth-pair local-coordinate contraction; use the section-killing lemma and the least nonzero Suslin homology sheaf to obtain the acyclicity, not just vanishing of `H₀`. Deduce that for smooth `U` and homotopy invariant transfer sheaf `F`, `Hⁿ_Nis(U,F)≃Hⁿ_cdh(U,π*F)` for every `n≥0`, with restriction, transfer and connecting-map compatibility. (MVW, Propositions 13.19 and 13.23, Theorem 13.25 and Proposition 13.27, pp.103–106; Friedlander–Voevodsky, Theorem 5.5 and its proof, pp.23–25.)

Construct the **complex-level** comparison for every bounded-above complex `K` of transfer sheaves whose cohomology sheaves are homotopy invariant:
`RΓ_Nis(U,K) → RΓ_cdh(U,π*K)` is a quasi-isomorphism, hence an isomorphism in every integer hypercohomological degree. For a bounded-above transfer presheaf complex first apply `K=(Tot C_*F)_Nis`. Give the comparison as a natural derived morphism, its compatibility with shifts, cones, the Suslin augmentation and products on admissible exterior-product models. Prove it by the cohomology-sheaf comparison and bounded cohomological dimension on `U`, using truncation so each total degree has a finite comparison range; exactness of `π*` identifies the cohomology sheaves on the right. Also identify Zariski hypercohomology with the left side via strict homotopy invariance. This is the Brown–Gersten adapter consumed by the bivariant and singular-motive constructions; no claim for unrestricted unbounded complexes is needed. (MVW, Propositions 13.10 and 13.27 and Theorem 14.20, pp.101,106,115; Suslin–Voevodsky, Corollary 5.12.3 and Theorem 5.14, pp.42–43; Friedlander–Voevodsky, Theorem 5.5, pp.23–25, extended to bounded-above complexes by the displayed truncation argument.)

**Checks.**

- **Topology and pullback.** A blow-up with empty center is an identity cover; an abstract blow-up over its center still needs the center term. On a smooth point a Nisnevich field cover must have a residue-field-preserving lift. These definitions do not require a rational point on an arbitrary proper cover.
- **Topology and pullback.** The zero sheaf pulls back to zero and an exact sheaf sequence remains exact under `π*` under resolution. Exactness here is a theorem about these sites, not a property of every left Kan extension.
- **Topology and pullback.** Nilpotent thickening is invisible to cdh sheaves through the corresponding abstract blow-up cover; this does not identify all purely inseparable changes of smooth ground field with isomorphisms of the integral transfer theory.
- **Vanishing and comparison.** If `F_cdh=0`, every Suslin homology sheaf vanishes, including degree one; an assertion just about `H₀` would not prove this. For zero `F` the resulting complex and comparisons are zero.
- **Vanishing and comparison.** `K=F[0]` recovers the sheaf theorem. `K=F[1]` has `𝔥^{-1}(U,K)=F(U)`, so a comparison only in nonnegative degrees would miss a nonzero group.
- **Vanishing and comparison.** A split two-term complex `F→0 G` shifted arbitrarily compares in both of its degrees; cones require the connecting maps as well as isomorphisms of groups. The empty test scheme gives zero derived sections.
- **Vanishing and comparison.** On smooth `U`, constant transfer coefficients retain their integral degree maps and units retain their norm maps. Over a field for which the stated resolution premise is unavailable these cdh conclusions remain conditional; the smooth localization and perfect-field cancellation above do not inherit that premise.

### 4.11 The geometric subcategory and stabilization

Inside the effective ambient category of §4.6 define `DM_eff,gm(k,R)` as the smallest strictly full thick triangulated subcategory containing `M(X)` for every smooth finite-type `X`. Give membership and induction principles for shifts, triangles, isomorphisms and retracts, the induced tensor structure and Tate objects, and the fully faithful inclusion. Use §4.6 compact generation to identify this subcategory with the compact objects. Over perfect fields its fully faithful bounded-above comparison identifies it with the corresponding thick subcategory of `DM_eff,-`; this comparison preserves every coproduct that exists there, while the bounded-above category itself does not have arbitrary coproducts. For uniformly bounded families whose coproduct exists there, state the compactness equation directly. (MVW, Definitions 14.1–14.2, pp.109–110, and Lecture 20, pp.167–171; Voevodsky, §2.1, pp.5–7.)

Construct the general symmetric tensor localization `InvertTensor C T`: the object `(X,m)` denotes `X⊗T^m`, and morphisms to `(Y,n)` are the filtered colimit of `Hom(X⊗T^{m+i},Y⊗T^{n+i})` over large enough `i`. Equality of representatives means equality after a common further tensor power. Give functoriality, tensor product, inclusion, invertibility of `T`, and the universal property for strong symmetric monoidal functors sending `T` to an invertible object. Require the cyclic permutation of `T⊗T⊗T` to act trivially for the indicated symmetric localization construction; provide compatible triangulated structure for an exact tensor category. If tensoring by `T` is fully faithful, the inclusion is fully faithful. (Voevodsky, §2.1, pp.5–7.)

Over a perfect field prove the cyclic action condition for the effective Tate object, then apply §4.9 cancellation to obtain `DM_gm(k,R)`. Give integer twists, full faithfulness of stabilization, and the representation of every object as an effective geometric motive with a negative twist. The cyclic-action calculation and the geometric restriction of stabilization are targets here; cancellation and its descent proof are constructed in §4.9. (MVW, Corollary 15.8, p.122, Theorem 16.25 and Remark 16.26, p.131; Voevodsky, Cancellation theorem, final corollary.)

**Checks.**

- The zero object, every shift of `M(Spec k)=R`, and every retract of a geometric motive are geometric. For `R≠0`, the infinite coproduct of units in the ambient category is not compact.
- Inverting the unit changes nothing; in the discrete tensor monoid `ℕ` with generator `1`, localization gives `ℤ`.
- Inverting `ℚ` as a tensor object in abelian groups kills `ℤ/p`; inclusion is not faithful there, so the cancellation hypothesis cannot be omitted.
- `R(1)⊗R(-1)≃R`; stabilization does not identify a twist with the original object merely because tensoring by it is fully faithful.
- Inverting the tensor unit leaves a category equivalent to itself; inverting a monoid generator changes the exponent monoid `ℕ` to `ℤ`. A `ℤ/p` object vanishes on rationalization. The noncompactness test using an infinite sum of units requires nonzero coefficients.

### 4.12 Homotopy, projective space, and projective bundles

Prove `M(X×𝔸¹)≃M(X)`, the Zariski Mayer–Vietoris triangle with maps `(i_*,-j_*)` and `(j_*,i_*)` in a fixed order, and vector-bundle invariance by local triviality and this triangle. Construct `M(𝔾_m)≃R⊕R(1)[1]` and `M(ℙ¹)≃R⊕R(1)[2]` over any field in the effective theory. For perfect `k`, construct `M(ℙ^n)≃⊕_{i=0}^nR(i)[2i]`, the hyperplane cofiber `M(ℙ^n)/M(ℙ^{n-1})≃R(n)[2n]`, and the split inclusions of linear projective subspaces. Include the affine-line-bundle projection off a point used in the proof, and compatibility with its cofiber maps. (MVW, Lectures 14–15, pp.109–124; Voevodsky, §3.5, pp.33–35.)

For a rank-`r` bundle on smooth `X` over a perfect field, define the projective-bundle map `M(ℙ(E))→⊕_{i=0}^{r-1}M(X)(i)[2i]` using the projection and powers of the tautological Chern class, and prove it is an isomorphism. This homological map has the opposite direction to the contravariant Chow-bundle map in §1.6. Rank zero has empty source and empty sum. (Voevodsky, Proposition 3.5.1, pp.33–35; MVW, Lecture 15.)

**Checks.**

- `n=0` gives `M(ℙ⁰)=R`; `n=1` gives one reduced summand `R(1)[2]`; the hyperplane quotient for `n=2` is `R(2)[4]`.
- A rank-one projective bundle gives `M(X)`; a vector bundle of rank zero has total space `X` and its motive is `M(X)`, whereas the rank-zero *projective* bundle is empty.
- For an open cover with one open equal to `X`, the Mayer–Vietoris complex is contractible. The opposite signs on its first map make the composite zero.
- `M(𝔸¹)=R` but its compactly supported motive is `R(1)[2]` (§4.17); ordinary and compactly supported homotopy formulas differ.

### 4.13 Smooth blow-up and Gysin triangles

Use §4.8b’s adapted smooth-pair coordinates for the local contractions and purity maps below.

For smooth `X/k` and smooth closed `Z⊂X`, over perfect `k`, let `p:Ẋ→X` be the blow-up, `E` its exceptional divisor and `q:E→Z`. Prove the triangle `M(E)→M(Z)⊕M(Ẋ)→M(X)→M(E)[1]`, first map `(q_*,i_*)`, second `(j_*,-p_*)`. For pure codimension `c≥1`, give the splitting
`M(Ẋ)≃M(X)⊕⊕_{i=1}^{c-1}M(Z)(i)[2i]`.
Construct the smooth-pair Gysin map and purity isomorphism `M(X/(X-Z))≃M(Z)(c)[2c]`, with smooth-pair base change and products, and derive `M(X-Z)→M(X)→M(Z)(c)[2c]→`. These results use smooth blow-ups and local coordinates, not resolution of singularities. (Voevodsky, Propositions 3.5.2–3.5.4, pp.35–39; compare MVW, Theorem 13.26 for a longer route.)

For a smooth curve and a finite closed divisor give the integral weight-one localization sequence from units through valuations to Picard groups. Prove the divisor boundary sends a local parameter to `+1` with the chosen triangle convention. Under flat coefficients tensor this exact sequence ordinarily; for general `R`, retain derived tensor and the possible Tor contribution from Picard groups. (MVW, Lectures 4 and 13, weight-one and Gysin computations.)

**Checks.**

- Blowing up a Cartier divisor (`c=1`) adds no summands; blowing up a point of a smooth surface adds `R(1)[2]`.
- In the blow-up triangle the two composites from `E` are equal before the minus sign and cancel afterward.
- For `(𝔸¹,{0})`, the boundary of `t` is `1`, and the Gysin target is `R(1)[2]`.
- For `c=0`, purity gives the identity on the open-and-closed component, using §4.8b’s chart with no normal directions.
- Tensoring an integral Picard sequence with a nonflat ring is not asserted exact. Over a field of positive characteristic the smooth-pair theorem still applies with the stated coefficient theory and perfectness.

### 4.14 Equidimensional cycles and transfers

For finite-type `T/k`, define `z_equi(T,r)` on smooth test schemes `S` by integral cycles in `S×T` dominant over a component of `S`, with pure relative dimension `r`. Use §4.8a’s relative-cycle specialization multiplicities and pullback, with its independence, identity and composition, on the regular smooth test base. Give generators, zero/addition, base change and coefficient extension. Extend it to finite correspondences by transfer, and prove graph agreement and composition, including transfers supported on singular correspondences. The transfer proof must use relative cycles and finite pushforward, not apply flat pullback to a nonflat support. (Suslin–Voevodsky, §§3.3–3.4, pp.23–38, §§3.6–3.7, pp.43–55; Friedlander–Voevodsky, §2, pp.3–9.)

Give proper pushforward and flat equidimensional pullback with shift `r↦r+n`, compatible base change, and exterior products over *independent* test bases as the transfer-compatible pairing. Restriction along the diagonal gives an ordinary same-base pairing, but not separate additivity for arbitrary transfers in both factors. Define `z_equi(U,X,r)(S)=z_equi(X,r)(U×S)` for smooth pure-dimensional `U`, and the injective cycle-forgetting map `D:z_equi(U,X,r)→z_equi(U×X,r+dim U)`. Identify `ℤ_tr(T)⊂z_equi(T,0)` and prove equality for proper `T`, not for every `T`. (Same sources; Friedlander–Voevodsky, §§2 and 7.)

**Checks.**

- For a proper point, `z_equi(point,0)(S)` is generated by components of `S`; the graph of the identity acts as the identity transfer.
- The curve `st=1` in `𝔸¹_s×𝔸¹_t` is equidimensional of relative dimension zero over its image with empty fiber allowed, but is not finite over `𝔸¹_s`; equidimensional cycles are not all finite correspondences.
- A transfer `2id` acts by two on a product restricted along one diagonal. Pulling each factor separately would give four, so that is not a valid transfer-bilinear identity.
- Flat pullback along `𝔸¹→point` raises relative cycle dimension by one; an unshifted formula fails.
- `z_equi(Spec k,r)=0` for `r>0`; the diagonal finite correspondence acts identically. Point exterior products and proper pushforward by a finite map recover product multiplicities and residue degrees.

### 4.15 Bivariant cohomology, moving, and localization

Define `A_{r,i}(Y,X)=H^{-i}_cdh(Y,π* C_*z_equi(X,r))`, `r≥0`, for finite-type schemes. Give contravariance in `Y`, proper covariance and flat dimension-shifting contravariance in `X`, the naive-to-cdh map, and Mayer–Vietoris and abstract blow-up sequences in `Y`. At a point identify it with equidimensional-cycle homology `h_i(z_equi(X,r))(Spec k)` and prove `A_{r,0}(point,X)=CH_r(X)`. For affine equidimensional `X` and `i≥0`, identify it with `CH^{dim X-r}(X,i)`. For proper `X`, the `r=0` cycle complex agrees with the finite-correspondence complex defining ordinary Suslin homology; this identification is not asserted for nonproper `X`. (Friedlander–Voevodsky, Theorem 4.2(1)–(2) and Definition 4.3, pp.16–18; Voevodsky, Definition 4.2.1, p.46.)

Use §4.10's resolution-dependent cdh-vanishing theorem and complex-level Nisnevich/cdh hypercohomology comparison to construct localization, Mayer–Vietoris and abstract blow-up sequences in the `X` variable, and `𝔸¹` invariance in `Y`. The proof also uses the supplied flattening geometry; ordinary cdh sheafification alone does not give the comparison. (Friedlander–Voevodsky, Theorems 5.5, 5.11 and 5.14, pp.23–29.)

Construct the bounded-family moving homotopies on a smooth projective `m`-fold: for degree bounds `d,e`, and dimensions `r,s` with `r+s≥m`, provide natural monoid maps `H⁺,H⁻` over an open parameter neighborhood of `0∈𝔸¹`. At zero their difference is the original cycle, with excess components confined to the original bad intersection; away from zero intersections with every prescribed bounded-degree `s`-cycle are proper. Prove the induced chain homotopies and the admissibility of the Chow-parameter families. Over infinite fields make the simultaneous choices; over finite fields use the sufficiently-large-field statement and the descent argument actually required by the projective duality theorem, not an arbitrary-field rational-point assertion. (Friedlander–Lawson, Theorem 1.7 and §3, pp.10–26; Friedlander–Voevodsky, Theorem 6.3, Proposition 6.4 and Lemma 6.6, pp.30–37.)

**Checks.**

- `A_{0,0}(point,point)=ℤ` and the other positive homological degrees for two points vanish.
- For an affine scheme the comparison recovers the corresponding higher Chow group; `A_r(Y,X×𝔸¹)` is not identified with `A_r(Y,X)` without a dimension shift.
- A moving family has the original cycle as its difference at parameter zero; requiring both effective terms individually to equal it is too strong.
- A Chow-variety morphism is admitted only with its relative-cycle admissibility property; parameter points over a finite field cannot be chosen by an infinite-field genericity argument.
- `A_{0,i}(Spec k)=ℤ` for `i=0` and zero otherwise. `A_{0,0}(𝔸¹)=CH₀(𝔸¹)=0`, whereas ordinary Suslin homology has `H₀^S(𝔸¹)=ℤ`. Also `A_{0,0}(Spec k)=ℤ`: the second bivariant variable is not homotopy invariant in that grading. Affine-space formulas for higher Chow groups must include the dimension shift.

### 4.16 Duality and the naive comparison

For smooth projective equidimensional `U,X` over an arbitrary field, prove `D` induces an isomorphism on every homology presheaf. The projective proof includes the moving lemma and finite-field descent. Under resolution and with smooth quasiprojective pure-dimensional `U`, extend the evaluated comparison to arbitrary finite-type `X` by compactification, flattening and localization. Prove for such `U` the naive bivariant homology agrees with the cdh definition, using the complex-level Brown–Gersten adapter of §4.10. Deduce
`A_{r,i}(Y×U,X)≃A_{r+dim U,i}(Y,X×U)`
under the resolution hypotheses, naturally in the other variables. (Friedlander–Voevodsky, Theorems 7.1, 7.4 and 8.2, pp.37–43; MVW, Theorem 19.11, pp.162–163.)

Prove suspension in the cycle variable, `A_{r+1,i}(Y,X×𝔸¹)≃A_{r,i}(Y,X)`, and the split `ℙ¹` formula `A_{r,i}(Y×ℙ¹,X)≃A_{r,i}(Y,X)⊕A_{r+1,i}(Y,X)`, with projection and point-section maps specified. For a smooth closed pair `Z⊂U` of codimension `c`, give the Gysin long exact sequence with `A_{r+c,i}(Z,X)→A_{r,i}(U,X)→A_{r,i}(U-Z,X)→A_{r+c,i-1}(Z,X)`. (Friedlander–Voevodsky, Theorem 8.3, pp.43–45.)

**Checks.**

- For `U=point`, duality is the identity and has no dimension shift.
- For a smooth projective `U`, `A_{0,0}(U,X)=CH_{dim U}(U×X)`; using codimension `dim U` would be wrong when `dim X≠dim U`.
- With `U=ℙ¹`, the two summands differ by *one* in cycle dimension, not homological degree.
- In the Gysin boundary, the homological index decreases by one; the closed term's cycle dimension increases by `c`.

### 4.17 Compact support and the Suslin–Friedlander comparison

Define `Mᶜ(X)=C_*z_equi(X,0)` in the effective ambient category for any finite-type `X`. Give proper covariance, étale pullback, the natural `M(X)→Mᶜ(X)` for smooth `X`, and the isomorphism for proper `X`. Over perfect fields construct `Mᶜ(𝔸^n)=R(n)[2n]` by identifying the Suslin–Friedlander complex `C_*z_equi(𝔸^n,0)[-2n]` with the motivic complex `R(n)` of §4.4. This is a comparison, not a second definition of motivic cohomology. Construct its map into Bloch's cycle complex and prove sheaf quasi-isomorphism from field comparison, homotopy invariance and descent. Deduce `H^{a,b}(X,R)≃CH^b(X,2b-a;R)` for smooth `X` over a perfect field, with the derived coefficient convention. (MVW, Lectures 16 and 19, pp.125–131, 159–163; Voevodsky, §4.1, pp.40–43.)

Under resolution, construct `Mᶜ(Z)→Mᶜ(X)→Mᶜ(X-Z)→Mᶜ(Z)[1]`, Künneth `Mᶜ(X)⊗Mᶜ(Y)≃Mᶜ(X×Y)`, and geometricity for every finite-type `X`. Construct the analogous ordinary motive of singular `X`, its abstract blow-up triangle and geometricity, and prove generation of geometric motives by smooth projective motives and twists using resolution and compactification. Include independence and functoriality of these models. (Voevodsky, Propositions 4.1.1–4.1.8, pp.41–43; MVW, Lecture 20, pp.167–168.)

**Checks.**

- For proper `X`, ordinary and compactly supported motives agree; `Mᶜ(∅)=0`.
- `Mᶜ(𝔸¹)=R(1)[2]` and `Mᶜ(𝔾_m)` is obtained from the localization of `{0}⊂𝔸¹`, not from ordinary homotopy invariance.
- For `b<0`, the effective higher-Chow comparison is not stated as a complex of codimension-negative cycles; for `a>2b≥0` the displayed higher-Chow degree is negative and the group vanishes.
- Nilpotent thickening does not change the underlying cycle complex. A general universal homeomorphism is not identified integrally merely from this observation.
- `Mᶜ(𝔸¹)` differs from `Mᶜ(Spec k)`: maps from the unit in degree zero give zero and `R`, respectively. An arbitrary nonproper map is not a compact-support pushforward.

### 4.18 Representability, Borel–Moore homology, and the Chow bridge

Under resolution, prove
`Hom(C_*(Y)(r)[2r+i],Mᶜ(X))≃A_{r,i}(Y,X)`
for `r≥0`, and its internal-Hom form `RHom(R(r)[2r],Mᶜ(X))≃C_*z_equi(X,r)`. Deduce flat pullback `Mᶜ(Y)(n)[2n]→Mᶜ(X)` for flat equidimensional `X→Y` of relative dimension `n`. For smooth proper `X,Y`, prove `Hom(M(X),M(Y))≃CH_{dim X}(X×Y)` and `Hom(M(X),M(Y)[i])=0` for `i>0`. These formulas are in the homological convention. (Voevodsky, Propositions 4.2.3 and 4.2.8 and Corollaries 4.2.4–4.2.7, pp.47–49.)

Define compactly supported motivic cohomology `Hᶜ^{a,b}(X)=Hom(Mᶜ(X),R(b)[a])` and Borel–Moore motivic homology `H^BM_{a,b}(X)=Hom(R(b)[a],Mᶜ(X))`. Give their oppositely directed localization sequences, proper and étale functoriality, twists, products and coefficient changes. The representability theorem supplies cycle-class maps and not just group cardinalities. (Friedlander–Voevodsky, §9, pp.46–54; Voevodsky, §4.2.)

Construct the homological effective Chow category with morphisms `CH_{dim X}(X×Y)_R` and its graph-covariant tensor functor to effective geometric motives. Construct the correspondence-to-morphism map by Voevodsky, Proposition 2.1.4, pp.5–6, using §4.16's projective moving/duality theorem (Friedlander–Voevodsky, Theorem 7.1, p.37), including its finite-field descent. Prove compatibility with composition, exterior products, graphs and rational equivalence. This projective construction uses no resolution hypothesis.

Over a perfect field prove the projective Hom/Chow comparison and positive-Ext vanishing independently of the resolution-dependent smooth-proper comparison above. In the homological Chow category with coefficients `R`, construct duals after Lefschetz inversion using the diagonal evaluation and coevaluation formulas of §1.3. Extend the tensor functor through this inversion and transport those maps to obtain `M(Y)^∨=M(Y)(-e)[-2e]` for smooth projective pure-dimensional `Y`, `e=dim Y`. This uses duality of these images, independently of §4.19's general geometric duality. Combining it with §4.17's perfect-field higher-Chow comparison and §4.9's cancellation gives
`Hom(M(X),M(Y)[i])≃H^{2e+i,e}(X×Y,R)≃CH^e(X×Y,-i;R)`.
For `i=0` this is `CH_{dim X}(X×Y)_R`, and for `i>0` it is zero. Prove that the inverse at `i=0` is the actual correspondence-to-morphism map just constructed, with composition and tensor products preserved. Work componentwise for mixed dimensions. (Friedlander–Voevodsky, Theorem 7.1; Voevodsky, Proposition 2.1.4; MVW, Theorems 19.1 and 16.25, with Remark 16.26 for perfect-field cancellation.)

For the category of Layer 1, over a perfect field with rational coefficients construct the fully faithful strong monoidal functor `ChowMotive(k)ᵒᵖ→DM_gm(k,ℚ)` with object assignment
`(X,p,m) ↦ im(pᵗ:M(X)(-m)[-2m]→M(X)(-m)[-2m])`.
A Chow map from `A` to `B` gives a geometric map from the displayed image of `B` to that of `A`. Use the projective comparison, projective-bundle summands and cancellation to extend full faithfulness through all Tate twists and projector images. No assumption that the two Chow conventions have identical morphisms is permitted. (Voevodsky, §§2.1 and 4.2; MVW, Proposition 20.1 and Remark 20.2 for the resolution-dependent route.)

**Checks.**

- For a point, both representability descriptions give `R`; for `𝔸¹`, `H^BM_{2,1}=R`.
- `CH^b(X)=Hom(M(X),R(b)[2b])` for smooth `X`; this is not the reversed Hom.
- The Chow Lefschetz object maps to `R(1)[2]`, and a Chow `𝟙(1)` maps to `R(-1)[-2]`.
- A graph `Y→X` gives a Chow map `h(X)→h(Y)` but its transpose is used for the map of the indicated homological motives; the point-in-curve example fixes the direction.
- `H^{BM}_{n,0}(Spec k)` is `R` for `n=0` and zero otherwise. Localization at the origin in `𝔸¹` tests the boundary and its shift.
- Over a perfect field of positive characteristic, the projective calculation gives `Hom(M(ℙ¹),M(ℙ¹))=R²` and zero positive Ext without assuming resolution. Its two diagonal projectors are the images of the point/line Chow projectors, so an abstract isomorphism of groups alone does not suffice.

### 4.19 Stable duality and Tate motives

Under resolution, construct the dual of a geometric motive by `RHom(M(r),R(i))(r-i)` for sufficiently large `i`. Prove independence of `i,r`, contravariant exact functoriality, compatibility with shifts and twists, and the evaluation/coevaluation identities. For smooth pure-dimensional `X`, `dim X=d`, prove `M(X)^∨≃Mᶜ(X)(-d)[-2d]`, starting with `RHom(M(X),R(d))≃Mᶜ(X)[-2d]` in the effective category. Prove the double-dual and tensor-dual isomorphisms and rigidity. The stable dual is not in general the effective `RHom(-,R)`. (MVW, Proposition 20.3, Corollary 20.4, Definition 20.6, Lemma 20.7, Propositions 20.8, 20.12–20.14, pp.167–171; Voevodsky, §4.3, pp.50–55.)

Define `DTM(k,R)` as the thick tensor subcategory generated by all `R(n)`, `n∈ℤ`. Give its induction principle and compute
`Hom(R(p),R(q)[m])=H^{m,q-p}(k,R)` for `q≥p`, and zero for `q<p` in the stated motivic setting. Include the weight-one `kˣ` calculation and distinguish the effective subcategory generated by nonnegative twists. This is a triangulated Tate category, not a claim that it carries a mixed Tate heart. (MVW, Lectures 4, 14 and 20.)

**Checks.**

- The stable dual of `L_geom=R(1)[2]` is `R(-1)[-2]`, whereas its effective `RHom(L_geom,R)` can be zero.
- `M(𝔸¹)^∨=R`, using `Mᶜ(𝔸¹)(-1)[-2]=R`; omitting compact support would give the wrong answer.
- A Tate Hom in negative weight vanishes in this setting; a positive-weight Hom such as weight one can contain `kˣ`.
- For `R≠0`, the effective positive-twist subcategory does not acquire `R(-1)` just by being closed under shifts.
- In the rational Tate category, `Hom(𝟙,ℚ(1)[1])=k×⊗ℚ`, while `Pic(Spec k)=0`.

### 4.20 The scissor ring and motivic measure

Define `K₀Var k` from isomorphism classes of separated finite-type schemes in a fixed small model, with relations `[X]=[Z]+[X-Z]` for every closed immersion and multiplication by product over `k`. Give the ring structure, independence of the small model, the universal property for additive multiplicative invariants, and `[X]=[X_red]`. This definition works over any field; no characteristic-zero blow-up presentation is assumed. Write `𝕃=[𝔸¹]`. (Bittner, §3 before Theorem 3.1, p.3, with the elementary scissor construction extended to nonreduced schemes by the stated relation.)

For an essentially small symmetric monoidal triangulated category `C` whose tensor product is exact in each variable, give the existing `TriangulatedK0 C` the commutative ring structure `[X][Y]=[X⊗Y]`, with unit `[𝟙]`. Use `TriangulatedK0.lift` twice and prove that tensoring respects the triangle relations in both variables. Its API is distributivity, associativity, commutativity, the unit formula and uniqueness on object classes. An exact strong symmetric monoidal functor induces a ring map whose additive map is `TriangulatedK0.map`; prove identity, composition and invariance under monoidal triangulated equivalence. This adds multiplication to the supplied additive group without another quotient carrier. (Source: the universal triangle presentation in Tau Ceti `CategoryTheory/GrothendieckGroup/Triangulated`, `TriangulatedK0.lift` and `of_distTriang`, applied in each variable; the motivic tensor product is Voevodsky, Proposition 2.1.3, pp.4–5.)

Under resolution and the compact-support Künneth theorem, construct the ring homomorphism `χᶜ:K₀Var k→TriangulatedK0(DM_gm(k,R))`, `[X]↦[Mᶜ(X)]`. It uses the tensor ring on the existing triangulated Grothendieck group constructed in this subsection. Prove its localization relation, multiplicativity, and `χᶜ(𝕃)=[R(1)[2]]=[R(1)]`. Coefficient extension gives the map induced by derived extension of coefficients; rational coefficients do not mean tensoring the Grothendieck group itself with `ℚ`. Extend after inverting `𝕃`, and after also inverting `1-𝕃^{-i}` only when the *target* is localized at the corresponding elements. (Voevodsky, §§4.1–4.3; Bittner, §3, p.3.)

**Checks.**

- `[ℙ¹]=1+𝕃`, `[𝔾_m]=𝕃-1`, and `[Spec k[ε]/ε²]=1`.
- An invariant additive only for disjoint unions need not respect a closed-open decomposition, so does not automatically factor through `K₀Var`.
- Ordinary `𝔸¹`-homotopy motives would send `𝕃` to `1`; then `1-𝕃^{-1}` maps to zero and cannot be inverted in a nonzero target. Compact support and target localization are essential.
- An odd shift negates the class in `TriangulatedK0`; the shift `[2]` in the Lefschetz image has positive sign.
- On perfect complexes over a field, Euler characteristic sends the tensor product to the product of Euler characteristics and the unit to one.
- Tensoring a distinguished triangle gives its relation after multiplication by `[X]`; tensoring the zero object gives zero.
- An exact monoidal identity functor induces the identity ring map.
- A nilpotent fat point has scissor class one. The decomposition of connected `𝔸¹` into the origin and its complement is a scissor relation without a disjoint-sum isomorphism. The measure of `𝔾_m` is `[R(1)[2]]-1`. In the compact-support assignment, `1-𝕃^{-i}` maps to `1-[R(-i)]`, which is inverted only in the designated localized target.

### Examples

The pair `(𝔸¹,{0})` tests the Gysin boundary and distinguishes ordinary from compact support. A point blow-up on a surface adds one Lefschetz summand. The two conventions of Chow motive give the same geometric Lefschetz object only after the transpose and inverse twist in §4.18. The scissor relation for `ℙ¹` then agrees with the direct-sum decomposition of its motive.

### Dependencies

Ordinary intersection theory and relative Picard geometry from SchemeAndStackFoundations; KTheoryFiniteLocalFields §3.0a's `motivicCycles` objects and maps consumed in §§4.7–4.8; Mathlib sites, complexes, derived categories and triangulated localization; birational compactification, flattening and resolution where stated; and §4.20’s tensor-ring extension of the supplied additive `TriangulatedK0`. The remaining constructions in §§4.1–4.10, including singular-base cycle operations in §4.8a and adapted smooth-pair coordinates in §4.8b, provide the foundations for cancellation and cdh comparison before the bivariant, Gysin, compact-support and higher-Chow comparison targets of §§4.11–4.20. The arbitrary-field constructions, perfect-field cohomology/cancellation results, and resolution-dependent cdh/bivariant/compact-support proof routes retain their separate scopes.

## Layer 5: diagram categories and Nori motives

### 5.1 Finite endomorphism algebras and their dual coalgebras

A `Diagram` is a quiver with a distinguished identity loop at each vertex, without imposed composition relations. A representation assigns finite-dimensional `K`-spaces to vertices and linear maps to edges, sending each distinguished loop to the identity. For a finite subdiagram `D₀`, define `End(T|D₀)` as compatible tuples in `∏_v End_K(Tv)`. Give its algebra structure, membership equations, restriction homomorphisms and functoriality. Finite vertex sets suffice for finite dimension even if the edge constraints are infinite, since they cut out a subspace of the finite product. Restrictions need not be surjective. (Huber–Müller-Stach 2017, §§7.1–7.2, pp.136–149; von Wangenheim, §§2.1–2.2.)

Define the compatible endomorphism algebra also over a Noetherian commutative ring `R` for finitely generated vertex modules; it is a finite `R`-module. For a Dedekind domain and finite projective vertex modules, dualize the finite endomorphism algebras and take the filtered coalgebra colimit. Expose the same restriction and coefficient APIs, with flatness of that coalgebra. Do not dualize arbitrary nonprojective finite modules as though their dual tensor comparison were an isomorphism. (Huber–Müller-Stach 2014, Propositions B.7–B.8, pp.17–18.)

Dualize each finite endomorphism algebra to a coalgebra and assemble the filtered colimit `A(D,T)`. Prove the finite algebra's left-module/right-dual-comodule equivalence using `ρ(m)=Σ e_i m⊗e_i^∨`, with basis independence, counit, coassociativity, and morphism compatibility. Construct transition coalgebra maps with the reversed direction dictated by duality, without assuming they are injective. Prove that a finite comodule, its coaction equations, and a finite collection of maps descend to a sufficiently large finite piece. (Same source, §§7.2–7.3, pp.149–166; Huber–Müller-Stach 2014, Appendix B, pp.17–26.)

**Checks.**

- One isolated vertex `K²` has algebra `M₂(K)`, not `K²`. An identity edge between two lines forces equal scalars; a zero edge imposes no condition.
- An identity loop adds no condition, whereas a Jordan-block loop gives its centralizer. Forgetting edges changes the answer.
- In the left regular matrix module, `E₁₂E₂₁=E₁₁`; the opposite multiplication gives `E₂₂` and detects an incorrect module/comodule side.
- The empty diagram gives the zero category. A transition can identify coefficient classes, so filtered descent cannot be proved by treating all transition maps as inclusions.
- Sending every positive element of the one-object monoid `ℕ` to multiplication by two, and the distinguished zero loop to identity, is a quiver representation but fails composition. Sending the distinguished identity to zero is forbidden. Infinitely many isolated lines give a direct-sum coalgebra, not its product; a single size-two Jordan loop has a two-dimensional centralizer.

### 5.2 The universal abelian category

Define `DiagramCategory D T` using the supplied category of finite right comodules over `A(D,T)`. Give its exact faithful forgetful functor and the canonical lift `T̃:D→C(D,T)`. Prove that the category is generated by subquotients of finite sums of the lifted vertices, and that an edge represented by an isomorphism lifts to an isomorphism. Its abelianness comes from the finite-comodule supplier in the boundaries section. The reconstruction work is the comparison of finite pieces, generators and the universal property. (Huber–Müller-Stach 2017, Theorems 7.1.12–7.1.13, pp.138–139, Corollary 7.1.15 and Proposition 7.1.16, pp.139–140; Propositions 7.4.1–7.4.2, pp.164–165.)

For an essentially small abelian `K`-linear category `B`, an exact faithful `U:B→Vect_fd(K)`, and a lift `S:D→B` with specified `US≃T`, construct an exact faithful `L:C(D,T)→B` with compatible isomorphisms on the diagram and forgetful functor. State uniqueness up to the unique natural isomorphism preserving these markings. Prove the finite case through the representing projective object, then filtered descent. Also reconstruct an arbitrary abelian category with faithful exact finite-dimensional fiber by using its full underlying diagram. These statements do not assume tensor structure or rigidity. (Same source, Propositions 7.4.1–7.4.2, pp.164–165; von Wangenheim, §5.4, Satz 5.23.)

In `Suggested.lean`, `coalgebra_reconstruction` states reconstruction of an arbitrary linear abelian category from its exact faithful finite-dimensional fiber as finite comodules, preserving the specified fiber.

**Checks.**

- The isolated line yields `Vect_fd(K)` with its specified generator; the isolated `K²` still has a Morita-equivalent diagram category but remembers the two-dimensional lifted object.
- An invertible edge becomes invertible, while a nonzero noninvertible Jordan map need not.
- For the identity lift into the diagram category, the universal functor is the identity up to the marked isomorphism, not an arbitrary automorphism of the fiber.
- The dual-number module category is allowed here: no semisimplicity is inferred from an exact faithful fiber.

### 5.3 Pair diagrams and geometric cohomology

Over `ℚ⊂ℂ`, define the effective pair diagram with vertices `(X,Y,i)`, where `X` is a reduced separated finite-type variety, `Y` closed, and `i∈ℤ`. Pullback edges go `(X',Y',i)→(X,Y,i)` for a pair map `(X,Y)→(X',Y')`; triple edges go `(Y,Z,i)→(X,Y,i+1)`. Define good pairs by rational cohomological concentration in degree `i`; define very good pairs by adding affineness, smooth `X-Y`, and `dim X=i`, `dim Y=i-1`, or `X=Y` with `dim X<i`. Include the integrally good finite-free subdiagram and prove it gives the same rational category. (Huber–Müller-Stach 2017, Definition 9.2.1, pp.210–211; annotated 2025 edition, pp.213–214.)

Construct the singular cohomology representation, its triple exact sequence and naturality, and its external product on good pairs `((X,Y,i),(A,B,j))↦(X×A,Y×A∪X×B,i+j)`. Prove finite dimensionality through a finite compatible triangulation after compactification, or the homotopy type needed to compute the pair, rather than asserting a nonproper variety is homeomorphic to a finite compact complex. Prove the affine cohomological dimension bound and the relative vanishing after removing lower-dimensional components. Use the existing relative singular homology/cohomology and universal-coefficient interfaces. (Huber–Müller-Stach 2017, §§2.4–2.5, pp.40–52; Harrer, §§1.10 and 4.1, pp.61–65, 123–128.)

**Checks.**

- `(Spec ℚ,∅,0)` gives `ℚ`; `(X,X,i)` gives zero; the empty pair satisfies the zero case.
- The triple `ℙ¹⊃{0,∞}⊃{0}` has a nonzero connecting map in the appropriate relative degree; it is not permissible to set every boundary edge to zero.
- `H¹(𝔾_m,{1})=ℚ(-1)` as a Tate object; placing it in degree zero would violate the pair representation.
- The product of good pairs is good by the relative Künneth theorem; it need not be *very* good, so the very-good diagram alone is not declared product closed.
- For `ℙ¹⊃{0,∞}⊃∅`, the relative boundary identifies the reduced degree-zero class of the two points with relative `H¹`; the remaining groups fit the triple exact sequence. The pair `(𝔸¹,{0,1})` is very good in degree one.

### 5.4 The Basic Lemma and cellular filtrations

Prove Nori's Basic Lemma: for affine reduced `X/k`, for any subfield `k⊂ℂ`, of dimension `n` and closed `W` of dimension less than `n`, there is closed `Z⊇W`, `dim Z<n`, with `X-Z` smooth and integral relative cohomology `H^i(X,Z;ℤ)` concentrated in degree `n` and free of finite rank. Handle the empty and zero-dimensional cases separately. Prove the stronger constructible-sheaf version: for a weakly constructible sheaf with finite coefficient module and a finite family of such data, choose a common dense open avoiding `W` for which `H^i(X,j_!ℱ|_U)` vanishes outside degree `n` and its top group has the prescribed finite sum of stalk modules. This stronger version is used for quotient compatibility; it is not supplied by the constant-coefficient statement alone. (Huber–Müller-Stach 2017, Theorems 2.5.2 and 2.5.7 and proofs, pp.45–52; Harrer, Theorems 4.3.1 and 4.3.8, pp.130–132, and Theorem 4.4.5, pp.136–137.)

Construct cellular filtrations `∅=F_{-1}⊂F₀⊂⋯⊂F_N=X`, `N≥dim X`, with every consecutive pair very good. Give prescribed-subset enlargement, common enlargement and simultaneous filtrations for finite acyclic geometric diagrams. The levels above dimension may repeat; below dimension the required pair dimensions must be maintained. Define `C_F^i(X)=H_N^i(F_i,F_{i-1})` with differential the triple boundary. Prove `d²=0`, contravariant filtered functoriality, refinement quasi-isomorphisms and a natural *derived* Betti identification with singular cochains. (Huber–Müller-Stach 2017, Proposition 9.2.3 and Definitions/Propositions 9.2.17–9.2.18, pp.211, 214–215; Harrer, Definition 4.2.1 and Proposition 4.2.3, pp.128–129.)

**Checks.**

- A point has cellular complex `ℚ[0]`; a repeated filtration level contributes zero.
- For `{0,1}⊂𝔸¹`, the complex is `ℚ²→ℚ`, differential `(a,b)↦b-a`, with diagonal kernel and zero cokernel. The two points do not give two independent `H⁰` classes.
- In a surface the chain `{0}⊂{0}⊂𝔸²` fails the very-good dimension conditions at degree two: `(𝔸²,{0},2)` has a zero-dimensional lower term instead of dimension one. The degree-one pair `({0},{0},1)` satisfies the repeated-level exception; zero relative cohomology alone does not repair the degree-two pair.
- Taking an arbitrary open without the constructible-sheaf lemma does not guarantee that a finite-group quotient inherits an integral cellular filtration.
- Self-refinement induces identity in the derived category. A cellular filtration of `𝔸¹` starting at one point has cohomology `ℚ` in degree zero, with no spurious degree-one class.

### 5.5 Affine covers and all pairs

For a separated variety choose a finite ordered affine cover. Define its normalized increasing-index Čech terms and compatible cellular filtrations of the finite intersection diagram. Give the total differential `d_v+(-1)^q d_h` on vertical degree `q`, and its augmentation. Prove cover refinement, pullback after affine refinement, and independence in the derived category. A map of cover index sets is not unique: use explicit prism homotopies with compatible filtrations, or rigidified covers as in the source. For a double complex whose horizontal and vertical maps commute, the cross terms in the square cancel because the vertical differential raises `q`, giving opposite signs to the two cross terms. (Huber–Müller-Stach 2017, Example 9.2.6, Definitions 9.2.7, 9.2.12–9.2.13 and Lemmas 9.2.9–9.2.16, pp.212–214.)

Construct `R(X)` from this totalization, and `R(X,Y)=Cone(R(X)→R(Y))[-1]`. Extend its cohomology to the all-pairs diagram and prove `C(VGood)≃C(Good)≃C(Pairs)`, preserving Betti fibers. For supports in `Z⊂X`, define `R_Z(X)=Cone(R(X)→R(X-Z))[-1]`, using restriction. Prove the support triangle `R_Z(X)→R(X)→R(X-Z)→R_Z(X)[1]` and its functoriality. This extension is built through complexes; degreewise cohomology on all pairs is not a multiplicative diagram in a single degree. (Huber–Müller-Stach 2017, Theorem 9.2.22 and Corollary 9.2.23, pp.216–217; annotated edition, the same statements, pp.220–222.)

**Checks.**

- A singleton affine cover gives the cellular complex; the two standard charts of `ℙ¹` give `H⁰=ℚ`, `H²=ℚ(-1)`, `H¹=0`.
- `{X}` refines `{X,X}` in two ways. No further refinement makes their index maps equal, but the induced maps are homotopic. Strict uniqueness is false.
- The unnormalized Čech nerve of a singleton cover has arbitrarily high simplicial degrees; finite cover cardinality bounds only the normalized increasing-index construction.
- For a commuting square with both maps nonzero, the two total cross terms have coefficients `+1,-1`; omitting the vertical-degree sign gives twice the composite over `ℚ`.
- `R(X,X)=0` and `R(X,∅)=R(X)`. Omitting the `[-1]` in the relative cone shifts these acceptance values.
- Empty support gives zero and full support gives `R(X)`; both follow from restriction in the corrected cone. The punctured-line boundary identifies `H¹(𝔾_m)` with the supported degree-two class in `ℙ¹`.

### 5.6 Tensor structure, excision, and Tate localization

Adjoin inverse excision edges to the good-pair diagram: the cohomological restriction for an open subset contained in the closed member is an isomorphism, and its inverse is a new edge. Prove this does not change the diagram category. For a triple `X⊃Y⊃Z` and pair `(A,B)`, put `S=Y×A∪X×B`, `T=Z×A∪X×B`. The first-factor product boundary is the inverse excision from `(Y×A,Z×A∪Y×B)` to `(S,T)`, followed directly by the boundary for `X×A⊃S⊃T`. Its endpoints are good. The tempting intermediate pair `(S,Z×A∪Y×B)` need not be good and is not used. Even for very good inputs the required excision target may only be good. (Huber–Müller-Stach, annotated edition, corrected Proposition 9.3.1 and Theorem 9.3.4, pp.222–225.)

Define a graded multiplicative diagram representation with coherent products, unit, boundary products and ordinary symmetric tensor fiber. With the usual cross product `κ`, the product of two representation maps is `δa×b` or `a×δb`; the second differs from the geometric total-boundary path by `(-1)^{deg a}`. Equivalently use the source's `τ⁻¹(a⊗b)=(-1)^{ij}a×b`: then a first-factor edge of parity `r` contributes `(-1)^{rj}`, and a second-factor edge contributes no sign. The ordinary symmetry is `(-1)^{ij}` times geometric interchange. Construct the commutative coefficient bialgebra by dualizing finite endomorphism maps, and use its supplied finite-comodule tensor structure. (Huber–Müller-Stach, annotated edition, Definition 8.1.3, Proposition 8.1.5, pp.180–185, and corrected §9.3; Barbieri-Viale–Huber–Prest, Definitions 2.11–2.15 and Theorem 2.18, pp.11–14.)

For a graded multiplicative diagram and a marked rank-one vertex `f₀`, construct the localized diagram with vertices `(f,n)` for inverse tensor powers of `f₀`, its edge relations and the extended representation. Prove its universal property among tensor representations making `T(f₀)` invertible, and show every localized object has the form `X⊗f₀^{-n}`. The extension of the original representation and its canonical coefficient map must agree with this universal construction.

The multiplicative coefficient bialgebra and rank-one localization constructions also apply over a Dedekind domain with finite projective fibers; they do not assert rigidity of all finitely generated modules.

Define effective Nori motives as this good-pair category and full Nori motives by tensor localization at `L_N=H¹_N(𝔾_m,{1})`. Construct the rank-one group-like coefficient `χ` and prove that the *canonical* map from the effective coefficient bialgebra to the full one is localization at `χ`. Give the exact faithful effective-to-full functor and twists; do not assert fullness. (Huber–Müller-Stach, annotated edition, Proposition 8.2.5, pp.188–192, Theorem 9.3.4 and Remark 9.3.5, p.225.)

**Checks.**

- Empty excision is identity. For `X=𝔸¹`, `Y={0,1}`, `Z=∅`, and `(A,B)=(𝔸¹,{0,1})`, the first product boundary has rank one; a reversed or zero excision map fails.
- Taking `(A,B)` to be an affine plane with a smooth affine cubic boundary produces the nongood intermediate pair above, with cohomology in two degrees.
- For a boundary of parity one tensored with a degree-one class, the source's signed cross-product convention contributes `-1`; the second-factor convention contributes `+1`.
- On two degree-one Tate generators, geometric flip is `-1` and the corrected ordinary symmetry is `+1`.
- `ℚ[t]→ℚ`, `t↦1`, sends `t` to a unit but is not its localization: a unit-image condition alone does not prove the canonical Tate localization theorem.
- Localizing at the unit changes nothing. A rank-two fiber cannot be made tensor-invertible while keeping a faithful ordinary vector-space fiber. For the unit diagram the canonical coefficient map is identity; for a rank-one vertex its group-like coefficient and inverse satisfy both unit equations.

### 5.7 Generators, rigidity, and the two geometric fibers

Prove that every full Nori motive is a subquotient of finite sums of twists of normal-crossings pair motives `H_N^n(W-D_∞,D₀-D_∞)`, for smooth projective `n`-dimensional `W` with the required normal-crossings divisors. Construct their dual pairings by the diagonal and Gysin maps with support; the dual pair is `H_N^n(W-D₀,D_∞-D₀)(n)`. Prove Betti perfectness by Poincaré–Lefschetz duality, and propagate duals to the generated subquotient category over the coefficient field. This field version is not an assertion that arbitrary torsion objects over a Dedekind base are rigid. (Huber–Müller-Stach 2014, Lemma 1.13, Theorem 1.14, p.8, and Appendix C, pp.26–28; annotated book, Corollary 9.2.23 and §§9.3.2–9.3.3, pp.221–228.)

Prove the abstract field-valued rigidity criterion: an abelian symmetric tensor category with an exact faithful tensor fiber to finite-dimensional `K`-spaces is rigid if it is generated as an abelian tensor category by objects admitting pairings with other objects whose fibers are perfect. The dual coevaluation version is equivalent. Construct the missing duality maps, rather than merely testing nondegeneracy of a hypothetical dual. (Huber–Müller-Stach 2014, Proposition C.4 and Remark C.5, p.28.) Over `ℤ`, finitely generated modules with the ordinary tensor product show why the printed Dedekind wording needs additional hypotheses: the unit generates by cokernels, but `ℤ/2` is not dualizable.

Construct top cohomology and Gysin identifications with their component hypotheses: for geometrically irreducible smooth projective `n`-folds, top cohomology is `L_N^n`; for smooth supports of codimension `c`, `H_Z^{2c}(X)=H⁰(Z)⊗L_N^c`. A unit Tate object is obtained from the latter only for geometrically connected `Z`. Define homological pair motives by dualizing; finite-dimensional universal coefficients identify their Betti realization with relative singular homology, and the dual triple sequence has boundary from degree `i+1` to degree `i`. (Huber–Müller-Stach 2014, §1 and Appendix D, pp.5–8, 29–33.)

Construct the nonproper comparison for every smooth separated finite-type variety over `k⊂ℂ`. Choose a smooth proper SNC compactification and compare its logarithmic de Rham complex with the analytic derived direct image from the open variety, using the logarithmic Poincaré lemma. Prove agreement with algebraic de Rham hypercohomology, independence under common refinements, products, and residue/boundary compatibility. For nonquasiprojective varieties use affine-cover descent to obtain the same comparison. Then construct h-descent and smooth-hypercover models for relative de Rham data of arbitrary pairs, with excision, units, products, triple boundaries and multiplicative Betti comparison. These nonproper and arbitrary-pair comparisons are construction targets here. (Grothendieck 1966, Theorems 1 and 1′, pp.95–96; Deligne, Hodge II, Proposition 3.1.8, p.33; Huber–Müller-Stach 2017, §§3 and 5 for the pair models.) The diagonal and support calculations give full rigidity first. Then apply the fiber-extension theorem of §6.8 exactly once to extend relative de Rham data to an exact faithful tensor fiber on full Nori motives. Its comparison with Betti is marked on every pair and every integer twist. Nonvanishing of the Tate period follows from this one-dimensional comparison; its value `2πi` uses the analytic integration supplier. (Annotated book, Theorem 9.1.10 and Examples 9.1.11–9.1.13, pp.212–213; §§3 and 5 for relative de Rham and comparison.)

*Needs:* ComplexComparisonPartII §§C5.1, C5.3–C5.4 (proper de Rham comparison and cycle integration).

**Checks.**

- `H_N^{2n}(ℙ^N)=L_N^n` for `0≤n≤N`; outside that range it is zero.
- `Spec ℚ(i)` has two geometric points and its `H⁰` has dimension two. Connected over `ℚ` alone does not make top cohomology one Tate line.
- For a support consisting of two rational points, the Gysin target has two Tate summands; dropping `H⁰(Z)` would give the wrong rank.
- The normal-crossings pairing for a zero-dimensional pair is ordinary finite-dimensional duality; zero generators cause no exception.
- On `𝔾_m`, logarithmic `dz/z` gives a nonzero degree-one class and period `2πi`; on `𝔸¹`, degree one vanishes. Proper comparison alone has neither open variety as its input.
- A common SNC refinement induces the same comparison, and the residue of `dz/z` at zero is `+1`, with the boundary period `2πi`.
- The Tate comparison is invertible and nonzero; its numerical value cannot be obtained from abstract tensor reconstruction alone.

### 5.8 Equivariance and finite correspondences

For a finite group acting on an affine variety, construct an invariant cellular filtration such that the quotient filtration is integral good and, after rationalization, quotient pullback identifies its cellular complex with the invariants. Prove this with the constructible Basic Lemma applied to quotient data, not by taking invariants of a filtration chosen without the group. State explicitly the isolated-quotient-arrow endpoint condition in the finite diagram used by Harrer. (Harrer, Theorem 4.4.5 and Lemma 4.4.7, pp.136–138.)

For smooth affine varieties, use the finite-correspondence carrier of §4.1 to construct cellular pullback for correspondences via multivalued maps, symmetric powers and trace. Prove additivity, diagonal action, graph agreement, composition and tensor compatibility up to the specified chain homotopies. Choose filtrations simultaneously for finite hom-almost-acyclic diagrams: finite hom sets, endomorphisms coming from actual finite automorphism groups, and the acyclic quotient condition are part of the statement. Include the comparison to singular transfer. (Harrer, §§3.7–3.9, pp.95–121, §§4.5–4.8, pp.145–157.)

**Checks.**

- The trivial group recovers an ordinary cellular filtration; a nontrivial quotient requires integral good pairs before rational invariants are used.
- The correspondence `rΔ` acts by multiplication by `r`, including `r=0` and negative coefficients.
- The sum of the two maps from a point to two points acts by the sum of coordinates, not their average.
- A finite endomorphism monoid with noninvertible maps is not automatically an allowed finite automorphism group in the simultaneous-filtration theorem.

### 5.9 From geometric motives to Nori complexes

Construct affine unifibrant and component-rigidified Nisnevich covers of finite correspondence diagrams, their bridges and compositions, and normalized Čech complexes. Covers are chosen first and filtrations second. Prove comparison maps through common refinements and homotopies with cocycle laws. The combined cover/filtration indexing has comparison zigzags; it is not falsely treated as a directed poset with unique maps. For the total degree convention `Tot^{i,-j,-k}`, prove bounded cohomology and passage to `D^b` even when the displayed total complex starts only bounded below. (Harrer, §§5.2–5.5, pp.158–180, §§6.5–6.6, pp.187–198, §§7.1–7.3, pp.198–209.)

Use these explicit complexes to construct the contravariant triangulated tensor realization
`R_N,eff:DM_eff,gm(ℚ,ℚ)→D^b(Nori_eff(ℚ))`,
whose Betti realization is singular cochains. Prove Nisnevich and `𝔸¹` relations, descent of correspondence maps, tensor coherence and independence of choices. For a good pair of smooth varieties, the image of `Cone(M(Y)→M(X))` has its sole cohomology `H_N^n(X,Y)` in degree `n`. Extend through Tate localization to `R_N:DM_gm(ℚ,ℚ)→D^b(Nori(ℚ))` and prove
`R_N(M(j)[r])≃R_N(M)⊗ℚ_N(-j)[-r]`.
The construction is a realization, not an equivalence or a full-faithfulness theorem. Extension of this comparison to singular-pair geometric models needs the singular-motive descent adapter; it is not inferred from the smooth-pair statement. (Harrer, Theorem 7.3.1, pp.205–207; Theorem 7.4.10, pp.209–210; Theorem 7.4.17, pp.212–213.)

**Checks.**

- `R_N(M(point))=ℚ_N[0]` and `R_N(ℚ(1)[2])=L_N[-2]`.
- The cellular complex `{0,1}⊂𝔸¹` still has its rank-one differential after passage through the comparison, ruling out a construction that remembers only graded Betti dimensions.
- The image of `Cone(M(Y)→M(X))` is relative cochains, with the cohomological cone shift of §5.5 fixed by contravariance.
- Comparing through two different cover-index choices gives equal morphisms in the derived category through the prism homotopy, not necessarily equal cochain maps.

### Examples

The pair `(𝔸¹,{0,1})` detects a genuine differential, product-boundary signs and the failure of strict uniqueness for covers. A finite étale scheme detects component multiplicities in top cohomology. The Tate pair detects the difference between geometric shifts and heart objects. Together these examples prevent reconstruction of a motive category solely from an unmarked list of Betti vector spaces.

### Dependencies

Finite comodules and their abelian/tensor API are supplied. The new algebraic work is finite-piece reconstruction and its universal property. Geometric singular cohomology, the constructible Basic Lemma, Picard/symmetric-power geometry and relative de Rham descent supply the geometric steps. Layer 4 supplies the geometric source of §5.9. The neutral abstract arguments of Layer 6 are independent of this construction and may be proved first; its fiber extension is applied after the geometric data and rigidity above, avoiding a circular use of two already-extended fibers.

## Layer 6: Tensor reconstruction and formal periods

### 6.1 Neutral fibers and finite reconstruction

A neutral fiber datum over a field `K` consists of an essentially small `K`-linear abelian rigid symmetric monoidal category `C`, an identification `End(1)=K`, and a `K`-linear exact faithful strong symmetric monoidal functor `ω:C→Vect_fd(K)` with ordinary symmetry. It contains no group or Hopf algebra. Its API includes coherent scalar extension to finite projective modules over every `K`-algebra, reflection of zero objects and isomorphisms, and transport through equivalences preserving the marked fiber. Prove finite length with length bounded by `dim ω(X)`. (Deligne–Milne, Definition 2.19 and Theorem 2.11, pp.20–24.)

For each `X`, let `⟨X⟩` consist of subquotients of finite sums of `X`. Construct its finite endomorphism algebra `A_X⊂End_K(ωX)` by simultaneous preservation of all fiber subspaces coming from subobjects of all finite powers of `X`. Establish the matrix and relation API, including compatibility with morphisms in this full subcategory. Construct a representing object `P_X` for the restricted fiber, identify its fiber with the regular left `A_X`-module, and prove `⟨X⟩≃A_X-Mod_fd` over vector spaces. Do not replace preservation of all such subobjects by preservation of only subobjects of `X`. For nested finite hulls construct the transition maps and prove their unit, composition and fiber compatibilities. (Deligne–Milne, Lemma 2.13 and Propositions 2.14–2.16, pp.21–24.)

**Checks.**

- Vector spaces with the identity fiber reconstruct the trivial group; the zero-object hull is the zero category, not the whole category.
- Super vector spaces with Koszul symmetry in characteristic different from two do not have an ordinary symmetric forgetful fiber: the odd line has self-symmetry `-1`.
- Finite free abelian groups fail the abelian-category hypothesis: multiplication by two is both mono and epi there but is not invertible.
- In characteristic `p`, representations of `C_p` have an exact faithful symmetric fiber, although the regular representation is not semisimple.
- A single nontrivial character of `𝔾_m` generates a finite sum/subquotient hull which is not closed under tensor product; finite hull and tensor hull must remain distinct.

### 6.2 The neutral group and its noncircular antipode

Assemble the duals `A_X^∨` into a filtered coalgebra `B`, with universal matrix coefficients and compatible finite-piece comodules. Prove the equivalence `C≃Comod_fd(B)` over `ω`. Use tensor products and the unit in `C` to give this same coalgebra a commutative bialgebra structure; verify multiplication on coefficients, unit, commutativity and bialgebra identities. Reconstruct natural tensor endomorphisms on every value algebra `R` as algebra maps `B→R`.

Construct the antipode from the duals in `C`: evaluation and coevaluation give the two convolution identities. Do this before identifying tensor endomorphisms with tensor automorphisms. The resulting affine group scheme `G_ω=Spec B` represents `Aut^⊗(ω)` and gives a symmetric monoidal equivalence `C≃Rep_fd(G_ω)`. The known-group Hopf/comodule dictionary is supplied by the existing library and ReductiveGroups; the new result reconstructs a group from an arbitrary neutral category. (Deligne–Milne, Theorem 2.11 and its proof, pp.20–24.)

In `Suggested.lean`, `neutralTannakian_recognition` states reconstruction with the symmetric monoidal equivalence and the marked monoidal fiber comparison.

The API must expose coefficient generation, finite-piece descent of every comodule, functoriality of the equivalence, and the agreement between categorical and Hopf duals. Also prove the abstract milestone: a commutative bialgebra over a field whose category of finite comodules is rigid has an antipode satisfying both convolution equations.

In `Suggested.lean`, `exists_antipode_of_rigid_finite_comodules` states this rigidity-to-antipode theorem with both convolution identities.

**Checks.**

- A coefficient `c(v,λ)` evaluates on an endomorphism `f` as `λ(fv)`; taking only diagonal coefficients loses an off-diagonal matrix entry.
- For the identity fiber on vector spaces, the coefficient algebra is `K` with its trivial Hopf structure.
- The matrix monoid has a coefficient bialgebra; its defining representation has no tensor dual there. Rigidity is needed to obtain an antipode.
- On a character of `𝔾_m`, the antipode sends `t` to `t⁻¹`; an identity antipode fails one convolution equation.

### 6.3 Generation, functoriality and finite type

Prove that `G_ω` is finite precisely when one object generates `C` under finite sums and subquotients. It is of finite type precisely when one object tensor-generates using its dual and then finite sums and subquotients. Express `G_ω` as an inverse limit of its finite-type quotient group schemes, with faithfully flat transition maps and coordinate algebra the union of the corresponding finitely generated Hopf subalgebras. In characteristic zero, prove the connectedness criterion using nontrivial finite tensor subcategories: for every object with nontrivial action, its finite sum/subquotient hull cannot already be tensor closed. State the characteristic-zero restriction and the meaning of nontrivial action explicitly. (Deligne–Milne, Proposition 2.20 and Corollary 2.22, pp.24–25.)

For a tensor functor `U:D→C` with a marked fiber comparison, construct `G_C→G_D`. Prove it faithfully flat exactly when `U` is fully faithful and its image is closed under ambient subobjects; it is a closed immersion exactly when every object of `C` is a subquotient of an object in the image. Include the induced coordinate maps and composition law. These are statements about affine group schemes on all algebras. (Deligne–Milne, Proposition 2.21, p.25.)

**Checks.**

- `𝔾_m` is of finite type and is not finite; its degree-one character is a tensor generator, not a finite sum/subquotient generator.
- Restriction from `𝔾_m` to `μ₂` corresponds to a closed immersion and need not be full.
- In characteristic `p`, `α_p` prevents extending the characteristic-zero connectedness criterion unchanged.
- `μ_p` over characteristic `p` has nontrivial infinitesimal points; testing only field-valued points loses its scheme structure.

### 6.4 Relative reconstruction and the coequalizer obligation

Let `A` be essentially small rigid symmetric monoidal. Give a symmetric monoidal `C` a coherent tensor `A`-action and a conservative `A`-linear strong symmetric monoidal functor `F:C→A`. Choose a small filtered full exhaustion `C_i`, stable under the action and the indicated `F_i`-split coequalizers, together with `X_i` representing the enriched fiber:
`Hom_Ci(V⊙X_i,Y)≃Hom_A(V,F_iY)`.
An `F_i`-split pair is a parallel pair whose image belongs to a specified split coequalizer diagram in `A`. The datum includes existence and reflection of these coequalizers. For the sufficient reconstruction theorem also assume that `F_i` and the transition inclusions preserve them. Preservation and reflection are separate hypotheses; no implication between them is asserted here. This is the explicit proof obligation in applying the reflection-only formulation of Fargues–Scholze, Proposition VI.10.2, pp.232–234.

The API includes action coherence, the adjunction `V↦V⊙X_i ⊣ F_i` with both triangle identities, transition representer maps, and internal comodules `M→M⊗H` in `Ind(A)` with `M∈A`. Apply the monadic coequalizer criterion to identify the finite piece with modules over `A_i=F(X_i)`, whose multiplication comes from the adjunction. Assemble the duals into `H=colim A_i^∨`; prove every finite-valued comodule descends to a piece and obtain `C≃Comod_A(H)`. Construct multiplication using tensor products in larger pieces. In the coefficient-coend description impose the balancing relation for the `A`-action, using evaluation against duals of `V∈A`. Prove the bialgebra laws in `Ind(A)`. When `C` is rigid, construct the antipode from evaluation and coevaluation without assuming the group representation theorem. (Fargues–Scholze, proof of Proposition VI.10.2, pp.233–234.)

**Checks.**

- For the regular left module over `M₂(K)`, the local monad has product `E₁₂E₂₁=E₁₁`; reversing the algebra gives `E₂₂`.
- Finite-support integer-graded vector spaces have no global finite representer. The sum of weight lines over a finite set represents the corresponding piece; its algebra is `K^S`, and the dual pieces assemble to `K[ℤ]`.
- Relative reconstruction of the identity `A→A` gives the unit coalgebra after action balancing. The unbalanced coefficient coend need not do so.
- Finite representations of the matrix monoid test bialgebra reconstruction without rigidity; no antipode is concluded.
- Merely reflecting a split-image coequalizer does not supply a `PreservesColimit` instance. A use of the strengthened theorem must exhibit that instance.
- For a left `B`-module, evaluation of its reconstructed right `B∨`-coaction at `b` is `b·v`; at one it is `v`. Coactions agree on overlapping pieces after a common refinement, and a constant finite system reconstructs its original dual coalgebra. Tensor-object coaction multiplies the two coactions, with the specified unit coaction.

### 6.5 Heaps and affine torsors without a chosen point

Define a heap on a set, allowing the empty set, by a ternary operation `h` satisfying `h(x,y,y)=x=h(y,y,x)` and
`h(h(x,y,z),u,v)=h(x,h(u,z,y),v)=h(x,y,h(z,u,v))`.
The middle expression reverses `u,z,y`. With a chosen point `e`, prove that `x*y=h(x,e,y)` and `x⁻¹=h(e,x,e)` define a group recovering the heap. For a nonempty heap construct its canonical left translation group from classes of pairs `(a,b)`, where `(a,b)∼(h(a,b,x),x)`. Its action is `x↦h(a,b,x)`, its product is `[(a,b)][(c,d)]=[(h(a,b,c),d)]`, and inverse swaps the pair. Prove well-definedness, simple transitivity, functoriality and the chosen-point identification `x↦[(x,e)]`. Construct the analogous commuting right group. An empty heap has no such simply transitive group reconstruction. (Huber–Müller-Stach 2014, Appendix A, pp.14–16.)

An affine heap over `R` is a commutative `R`-algebra with ternary co-operation `A→A⊗A⊗A` whose functor of points satisfies these identities. Include algebra maps, scalar extension, the zero algebra and compatibility with pointwise heaps. For a nonempty affine heap `X` over a field `k`, construct its affine translation groups by descent along the fpqc cover `X→Spec k`. The tautological point `e` over this cover gives the pointed group `G_e` on the base-changed heap. On double overlaps use the group isomorphism `G_e→G_f`, `x↦h(x,e,f)`; the identity `h(h(x,e,f),f,g)=h(x,e,g)` is its cocycle law. Descend the affine scheme, group laws and action `G_e×X→X`, `(x,y)↦h(x,e,y)`. Prove the torsor identities after this faithfully flat base change, and identify the descended group with the fpqc sheaf of left translations; construct the commuting right group likewise. No `k`-rational point is assumed. The library's torsor API for an already supplied group is imported. (Huber–Müller-Stach 2014, Proposition A.6, p.16, for the heap-to-torsor statement; Stacks, Lemmas 35.37.1, Tag `0245`, and 35.35.11, Tag `02W0`, for effective affine descent and descent of morphisms.)

**Checks.**

- A group gives `h(x,y,z)=xy⁻¹z`, including noncommutative groups.
- The additive affine line has co-operation `t↦t⊗1⊗1-1⊗t⊗1+1⊗1⊗t`.
- Changing the chosen point changes the group identification, while leaving the heap unchanged.
- The real affine scheme `Spec(ℝ[t]/(t²+1))` has heap law `h(x,y,z)=-xyz` and no real point. Its translation group is `μ₂`, and it is a `μ₂`-torsor. Requiring a rational base point would exclude this nonempty affine heap.
- The empty heap satisfies the ternary equations but cannot be treated as a pointed group.
- In the integer heap, `h(5,2,3)=6` and pairs `(5,2)` and `(3,0)` represent the same translation. On `ℤ/3`, `x+y+z` fails `h(0,1,1)=0`; using `h(z,u,y)` in place of the middle reversed term fails at `x=y=v=u=0,z=1`. The zero algebra gives the empty affine heap over a nonzero value algebra.

### 6.6 Two diagram fibers and their coefficient algebra

For representations `T₁,T₂` of one diagram by finite free modules, define the coefficient module as the filtered colimit of `Hom(T₁|F,T₂|F)^∨` over finite subdiagrams. Give generators `c(v,λ)` with evaluation `λ(fv)`, transitions and linearity. For a source vector and target covector, the coefficient is the linear functional `f↦λ(fv)` on comparison maps; give evaluation, linearity in each coefficient argument and vanishing when either argument is zero. For graded multiplicative representations construct the coefficient algebra, including the unit and products. The self-coefficient algebra is the diagram coalgebra with its bialgebra multiplication. Source precomposition gives a right coaction `A₁₂→A₁₂⊗A₁`; target postcomposition gives a left coaction `A₁₂→A₂⊗A₁₂`. Verify their commutation. (Huber–Müller-Stach 2014, Definition 2.1 and §2, pp.9–11.)

Define the formal coefficient presentation by linear symbols and the edge relation
`[v',T₁(f)v,λ]=[v,v,T₂(f)^∨λ]`,
where the first entry records the vertex. Prove its universal bilinear property and compatibility with tensor products. Over a field, prove this presentation is the coefficient algebra. Over a Dedekind domain, identify the coefficient algebra with the torsion-free quotient of the presentation; do not assert the stronger integral isomorphism. Prove the saturated-relation criterion under which the integral comparison is an isomorphism. (Huber–Müller-Stach 2014, Definition 2.4, p.9, and Remark 2.7, p.10, with the integral torsion qualification.)

**Checks.**

- On a one-arrow diagram with both rank-one maps multiplication by two, the presentation has relation `2(y-x)=0` and nonzero two-torsion, whereas the dual-Hom coefficient module is torsion free. Over `ℚ` they agree.
- The detector `(a,b)↦b mod 2` kills `(-2,2)` but not `(-1,1)`, proving the previous torsion class does not vanish in the presentation.
- For the free tensor diagram on that arrow the algebra is `ℤ[x,y]/(2(y-x))`, with torsion-free quotient `ℤ[t]`.
- Replacing the arrow by multiplication by one makes the relation saturated and removes the defect.
- Off-diagonal `f:(a,b)↦(b,0)`, `v=(0,1)` and the first covector give coefficient one. A diagonal-only definition gives zero.
- A single vertex with fibers `K^m,K^n` gives dimension `mn`; the unit diagram gives `K`. Every coefficient comes from a finite subdiagram, and the identifications commute with restriction.

### 6.7 Formal periods and the exact Tate localization

Over `ℚ`, define the effective formal period algebra by symbols `(X,Y,ω,γ)` with `ω∈H^n_dR(X,Y)` and `γ∈H_n^B(X,Y;ℚ)`, in the same degree, subject to bilinearity, change of variables and the relative-boundary/Stokes relation. Products use exterior products and the corresponding singular cross product; the point gives the unit. All-pair products are implemented through the good-pair diagram equivalence of Layer 5, not by pretending that degreewise cohomology on all pairs is already a multiplicative representation.

Let `ℓ` be the class of `(𝔾_m,{1},dlog z,γ_+)`, with the positively oriented loop. Define the full algebra `P=P_eff[ℓ⁻¹]`, with both inverse equations. Relate the presentation to the coefficient algebra of the marked de Rham and Betti diagram representations. The two Koszul signs cancel in the pairing, so the period product itself has no added sign. Use DifferentialGeometry Layers 5–8 for analytic integration and Stokes, and the algebraic-to-analytic comparison contract above for the relative de Rham classes. Construct the marked evaluation of this formal algebra and compute `∫γ_+dlog z=2πi` using `z=e^{2πit}`, `0≤t≤1`; the integrand pulls back to `2πi dt`. PeriodsAndSpecialValues consumes this evaluated algebra downstream. (Huber–Müller-Stach 2014, §§1–2, pp.2–11; 2017, Definition 13.1.1 and Theorem 13.1.4, pp.271–273.)

Prove that the canonical effective-to-full diagram coefficient map, obtained by extending these very representations through Tate localization, corresponds exactly to `P_eff→P`. On finite subdiagrams the isomorphisms use the marked comparison identifications and their duals, and commute with restriction. State the localization universal property for this canonical map, including the image of `ℓ`, inverse generation and uniqueness of the extended algebra map. An abstract isomorphism between the two algebras is insufficient. (Huber–Müller-Stach 2014, §§2–3 and Appendix B, pp.9–13,17–26.)

**Checks.**

- Periods of the point are rational scalars and its fundamental class gives one.
- The relative interval symbol obeys Stokes with the oriented endpoint difference; reversing it changes sign.
- Interchanging two degree-one factors changes both the cohomology and homology signs, leaving their paired symbol unchanged.
- The image of `ℓ` is invertible in the full coefficient algebra, and negative Tate objects supply its inverse.
- An arbitrary map `ℚ[t]→ℚ`, `t↦1`, is not localization away from `t`: it imposes a new relation. This rules out proving only invertibility.

### 6.8 Extending fibers and representing tensor isomorphisms

For two finite-dimensional field-valued diagram representations with a comparison after a field extension, construct the second exact faithful fiber on the diagram category generated by the first. Prove agreement on vertices and arrows, uniqueness through the universal property and faithfulness by scalar extension. For multiplicative diagrams include product and unit comparison to obtain the strong symmetric monoidal structure. Apply this to the Betti and relative de Rham data of §5.7, first effectively and then through the marked Tate localization, obtaining the canonical fibers `ω_dR,ω_B` on the same full Nori category. This is the required fiber-extension step; it does not assume both full fibers at the outset. (Huber–Müller-Stach 2014, Appendix B, especially its fiber-functor constructions, pp.17–26; 2017, §9.3.)

For any neutral category and exact faithful tensor fiber `η` in finite projective modules over a `K`-algebra `R`, prove that every tensor morphism `ω_R→η` is invertible. Construct `Isom^⊗(ω_R,η)` as an affine faithfully flat right `G_ω,R`-torsor. In the unit/faithful-flatness argument work cofinally with finite hulls containing the unit, for example generated by `X⊕1`; arbitrary finite hull representers need not preserve a unit. Prove the torsor isomorphism, scalar extension and effective descent. (Deligne–Milne, Theorem 3.2 and Remark 3.3, pp.30–31.)

On every `R`-algebra `S`, specify right precomposition `p·g=p∘g` and commuting left postcomposition `h·p=h∘p`. The associated left `G_ω,R`-action is `g·p=p∘g⁻¹`. When `G_ω` is of finite type, prove finite presentation of the torsor by fpqc descent from `G_ω,R`, and identify this fppf torsor with SchemeAndStackFoundations §§1.15 and 2.3's common torsor-class carrier. The comparison preserves these actions, the marked fibers, scalar extension in `R` and tensor isomorphisms of `η`. The general affine theorem uses fpqc torsors without a tensor-generator hypothesis; the finite-type specialization requires neither smoothness nor connectedness. (Deligne–Milne, Theorem 3.2(a)–(b), Remark 3.3(b), pp.30–31.)

For two neutral fibers over `K`, prove that `Spec A₁₂` represents their tensor isomorphisms, with left `G₂` and right `G₁` action, inverse represented by `A₂₁`, and composition `X₁₂×X₂₁→G₂`. Deduce the heap `h(f,g,h)=fg⁻¹h` and its affine co-operation. The inverse operation is justified by rigidity, not merely by a multiplicative effective diagram. The group `Aut^⊗(η)` is the twist of `G_ω,R` for conjugation: an fpqc section `t` gives `g↦tgt⁻¹`, and replacing `t` by `th` conjugates this identification by `h`. No rational point of the torsor is asserted.

**Checks.**

- Equal fibers give the group acting on itself by left and right translations.
- A tensor morphism must preserve the unit; a zero natural transformation is not one.
- Finite hulls missing the unit do not justify a unit-preserving representing map.
- A trivialization over a faithfully flat extension gives an inner-form identification there, with the stated conjugation change on overlaps.
- Invertible scalar transformations of a Tate line extend uniquely to its inverse Tate line; the zero scalar cannot extend.
- In the effective rank-one model `K[t]`, evaluation at zero is multiplicative but noninvertible; it cannot extend to `K[t,t⁻¹]`. Composition `X₁₂×X₂₁→G₂` and the reverse product into `G₁` fix the action sides by types. No canonical identity exists in `X₁₂` without a section.
- For `G=GL₂`, take `a=[[1,1],[0,1]]` and `b=[[1,0],[1,1]]`. Then `(p·a)·b=p∘a∘b` and `ab≠ba`; postcomposition by `h` commutes with this right action, and the associated left action uses the inverse.
- For `G=μ₂/ℚ`, the descended fiber from the torsor `Spec ℚ(√2)` gives a tensor-isomorphism torsor without a rational section. The supplier and its finite-type specialization both become the neutral torsor over `ℚ(√2)`.

### 6.9 The motivic period torsor and its marked complex point

Identify `Spec P` with `Isom^⊗(ω_dR,ω_B)`. Prove that the Betti group acts on the left and the de Rham group on the right, with commuting coactions
`P→O(G_B)⊗P`, `P→P⊗O(G_dR)`.
Check these on coefficient generators and prove both torsor identities. The heap on a comparison matrix has entries `Σ_{k,l}P_ik⊗(P⁻¹)_kl⊗P_lj`; the middle factor is the inverse matrix, not entrywise inversion. (Huber–Müller-Stach 2014, Theorem 2.10 and Corollary 2.11, p.11, and §3, pp.12–13.)

The analytic comparison `Φ:ω_dR,ℂ≃ω_B,ℂ` gives a marked point `per:P→ℂ`, evaluating a period by the pairing `γ(Φω)` and sending `ℓ` to `2πi`. Prove `h(Φ,Φ,Φ)=Φ`. For every complex point `x`, give the unique left and right group elements `b=xΦ⁻¹`, `d=Φ⁻¹x`; these lie in the two different fiber groups. Establish invariance of the period presentation under replacement by the very-good-pair generators of Layer 5. Injectivity of `per` is a period conjecture, not a theorem of reconstruction.

**Checks.**

- On the pure Tate torsor, `P=ℚ[t,t⁻¹]`, the coactions are `t↦u⊗t` and `t↦t⊗v`, and the heap sends `t↦t⊗t⁻¹⊗t`.
- In two dimensions let `b=[[1,1],[0,1]]`, `d=[[1,0],[1,1]]`, and `Φ=I`. Then `bΦd=[[2,1],[1,1]]`, whereas reversing the order gives `[[1,1],[1,2]]`.
- `2Φ` need not preserve the tensor unit, even though it is an invertible linear comparison on each positive-dimensional fiber considered separately.
- The marked point evaluates the Tate inverse to `(2πi)⁻¹`; replacing full periods by effective periods loses this generator.
- Representability of the torsor supplies a complex point and does not prove that its evaluation has zero kernel.

### 6.10 Artin and pure Tate acceptance cases

For `k⊂ℂ`, form the rational diagram category of finite étale schemes with fiber `H⁰_B(X)=ℚ^{Hom_k(X,ℂ)}`. Supply pullback, products, disjoint sums, subquotients and duals. At a finite Galois extension with group `Γ`, compute the diagram endomorphism algebra as the regular `ℚ[Γ]` with `Δ(g)=g⊗g`, not as a full matrix algebra. Prove equivalence with finite-dimensional discrete continuous rational representations of `Γ_k`; each factors through a finite quotient. The group is the proconstant group scheme with coordinate Hopf algebra `colim_K ℚ^{Gal(K/k)}`. Its values on disconnected algebras are not defined to be the same abstract set `Γ_k`. (Huber–Müller-Stach 2025 corrections, Definitions 9.4.1–9.4.2, pp.229–230.)

Before embedding this category in Nori motives, extend Layer 5 from `ℚ` to the chosen `k⊂ℂ`, with restriction/corestriction, finite descent and an ℓ-adic realization agreeing with finite-étale permutation representations. These are additional construction targets of this subsection. Then prove the Artin inclusion fully faithful with image closed under ambient subobjects and quotients, characterized by becoming a finite sum of units over `kbar`. Apply §6.3 to obtain a faithfully flat quotient `G_mot(k)→Γ_k,ℚ`. Use the corrected finite-descent proof, not the superseded argument. (Huber–Müller-Stach, corrected Proposition 9.5.3, Corollary 9.5.5 and repaired Theorem 9.1.16, pp.232–239, correction of 26 June 2025.)

Let `L=1(-1)=H¹_N(𝔾_m,{1})`. Define the pure Tate subcategory as the replete full closure of all `L^n`, `n∈ℤ`, under finite sums, subobjects and quotients. Include powers, inverse, coherent multiplication and duality. Supply a Hodge realization distinguishing their types `(n,n)`; this separation is an additional realization obligation and does not require an unproved global weight filtration. Prove `Hom(L^m,L^n)=0` for `m≠n` and `End(L^n)=ℚ`, finite direct-sum decomposition and a symmetric tensor equivalence with finite-support integer-graded rational spaces, using ordinary symmetry. Fixing the positively oriented Betti generator identifies the total fiber. Tensor automorphisms over every algebra are `Rˣ`, acting on weight `n` by `a^n`; thus the group is `𝔾_m` with Hopf algebra `ℚ[t,t⁻¹]` and gives a faithfully flat motivic quotient. (Huber–Müller-Stach, 2017 edition, Definition 10.3.1 and Lemma 10.3.2, pp.239–240; Deligne–Milne, Example 2.30, p.27.)

**Checks.**

- A split two-point scheme has trivial action; a quadratic extension splits rationally into the unit and sign representation.
- A nonnormal extension is governed by its embeddings in a Galois closure, not just by its own automorphism group.
- `End(1⊕L)=ℚ×ℚ`, and `L⊗L⁻¹=1`.
- The self-symmetry of `L` is `+1`; exponent one is not cohomological odd degree.
- A nontrivial unipotent two-dimensional representation of `𝔾_a` has unit subobject and quotient. This abstract example shows why adjoining all extensions would change the pure Tate definition; it is not an asserted Nori realization.

### Examples

The Artin and Tate cases test the reconstruction with a finite nontrivial group, a profinite quotient and a group of finite type which is not finite. The off-diagonal coefficient and the integral two-torsion relation test the actual coefficient algebra. The noncommuting two-by-two matrices fix the side of both period actions. All value-algebra statements include disconnected and nonreduced algebras.

### Dependencies

Use Mathlib's monads, filtered colimits, `Ind`, linear duals and affine group-scheme functor of points, and Tau Ceti's finite-comodule, rigidity and existing known-group representation API. The arbitrary neutral and relative reconstruction arguments here precede their Nori applications. Layer 5 supplies the diagram category and geometric comparison; §6.8 supplies the second fiber extension. DifferentialGeometry Layers 5–8 supplies analytic integration; §§6.7–6.9 construct marked period evaluation using the relative comparison contract. **SchemeAndStackFoundations**, §§1.1–1.2, supplies finite étale descent, and **EtaleCohomologyFoundations**, §F.0.2, supplies its Galois-category description. Section 6.10 constructs the stated Nori descent and realization extensions.

## Layer 7: Cycle conjectures and arithmetic applications

### 7.1 Rational Hodge classes with an explicit comparison

For a rational vector space `V`, a complex vector space `W` with compatible restricted scalars, conjugation `ω`, a pure Hodge structure `hs` of weight `n`, and a rational linear map `i:V→W`, define the rational class subspace of type `(p,n-p)` as the inverse image of `hs.piece p=F^p∩conj(F^{n-p})`. The definition does not assume injectivity or conjugation-fixed image. Its API is membership by inverse image, extensionality, functoriality for commuting squares with a Hodge morphism, and transport by compatible linear equivalences. Prove that in weight `2p`, a conjugation-fixed comparison image has membership exactly in `F^p`. If the comparison is injective and conjugation fixed and `n≠2p`, prove that the subspace is zero. Without injectivity it need only equal the comparison kernel. (Deligne, Hodge-conjecture description, §§1–2, pp.1–3; Tau Ceti's Hodge-piece and conjugation API.)

For smooth projective `X/ℂ`, `dim X=d`, specialize in degree `2p` to the canonical rational-to-complex comparison. Define `Hdg^{2p}(X,ℚ)` and the rational Hodge conjecture as surjectivity of `CH^p(X)_ℚ→Hdg^{2p}(X,ℚ)`, `0≤p≤d`. Construct the comparison to the preceding inverse-image definition, including Tate twist, products and correspondence action. Prove unconditionally that cycle classes are Hodge, using the proper pure Hodge comparison and the description by fundamental classes and integration currents; this does not prove the surjectivity predicate. (Deligne, §§1–3, pp.1–4; Demailly, chapter III, §2, integration currents and their bidegrees.)

**Checks.**

- For the unit Tate structure `tate 0` and `ℚ→ℂ`, the type `(0,0)` subspace is all of `ℚ`; type `(1,-1)` gives zero.
- For `tate(-1)`, of weight two, type `(1,1)` gives all of `ℚ`, while the index zero piece gives zero; these computations fix the twist sign.
- A zero comparison has every source vector in every inverse-image piece; it cannot satisfy the injectivity conclusion unless the source is zero.
- The point satisfies rational Hodge in degree zero; codimension-one surjectivity is the divisor theorem. Rational Hodge does not imply integral Hodge, and the predicate here concerns projective algebraic varieties, not every compact Kähler manifold.

### 7.2 Tate predicates, arithmetic variants and known divisors

For a smooth projective variety over a field finitely generated over its prime field and `ℓ≠char k`, define Tate in codimension `p` as surjectivity
`CH^p(X)⊗ℚ_ℓ→H^{2p}(X_ksep,ℚ_ℓ(p))^{G_k}`.
Its API includes the fixed-vector target, functoriality, finite-extension restriction/norm and the distinct geometric target given by the union of invariants under open subgroups. Strong Tate adds a `G_k`-stable complement to the invariant subspace. Over a finite field, Tate–Beilinson adds injectivity of `CH^p(X)⊗ℚ→H^{2p}(X_ksep,ℚ_ℓ(p))`; do not replace its rational source by a claimed `ℚ_ℓ`-linear injection. Integral `ℤ_ℓ` surjectivity is a separate, generally false strengthening. (Totaro, §1, Conjecture 1.1, pp.2–3, and §2, pp.5–7.)

Formulate the Borel–Moore variant for arbitrary varieties. Derive it from the smooth-projective statement when the variety admits a resolution and a smooth compactification, using localization, degree-normalized restriction/norm and the singular comparison contract. Over a finite field, prove rational divisor Tate implies integral divisor Tate. Record as separate proof targets the implication from divisor Tate for all finite-field surfaces to integral one-cycle Tate over their algebraic closures, and the following arithmetic equivalences: for a smooth projective surface fibred with connected fibers over a smooth projective curve, with smooth generic fiber of Jacobian `J`, divisor Tate, finiteness of the Brauer group, finiteness of `Sha(J)` and BSD for `J` over the function field are equivalent. The latter inputs require their arithmetic proofs; a survey citation supplies the statements, not those proofs. Global strong Tate for all smooth projective varieties and their needed powers implies the Lefschetz, Künneth and numerical standard conjectures in this realization. It supplies no positive-characteristic Hodge-positivity implication. (Totaro, §1, pp.4–5, §2, pp.6–7.)

The divisor acceptance register distinguishes: abelian varieties over finite fields (strong Tate), number fields (strong Tate via Faltings), and arbitrary finitely generated fields; number-field varieties with `h^{2,0}=0`; K3 and irreducible hyperkähler varieties over number fields; characteristic-zero finitely generated fields with `h^{2,0}=1` and a complex embedding admitting a genuinely varying `H²` deformation; and K3 surfaces over finite fields, including characteristic two. All have `ℚ_ℓ` cycle coefficients with invertible `ℓ`. Prove the rational divisor injection in Tate–Beilinson over finite fields from finiteness of rational points of `Pic⁰` and the divisor comparison. The other register entries require the primary proofs named by Totaro, with their characteristic/deformation hypotheses; the historical nonsupersingular result for `p>5` does not prove the characteristic-two K3 entry. For the number-field abelian-variety case, assume the Faltings Hom/isogeny comparison `Hom_k(A,B)⊗ℚ_ℓ ≃ Hom_{G_k}(V_ℓ A,V_ℓ B)` and semisimplicity of the Tate-module representations; prove the divisor consequence from these explicit arithmetic hypotheses. (Totaro, §§2–4, pp.7–10, Theorem 4.1 and opening of §5, pp.10–11.)

**Checks.**

- On a geometrically connected smooth projective variety, the fundamental class gives codimension-zero surjectivity and a closed point of degree `m>0` spans top cohomology after dividing by `m` in `ℚ_ℓ`. In general use closed points and separate trace maps componentwise, retaining the Galois orbits of geometric components. For `Spec k⊔Spec k` over a finite field the invariant target is `ℚ_ℓ²`: one degree-one point spans `(1,0)` but misses `(0,1)`.
- A nontrivial character can acquire invariant vectors after finite extension. The geometric invariant union need not equal the original `G_k`-invariants.
- A two-dimensional Frobenius Jordan block at eigenvalue one has invariants without an invariant complement, distinguishing Tate from strong Tate.
- Finite-field degree-zero rational divisor classes vanish after tensoring with `ℚ`, which is the needed injectivity input; over a number field that assertion would be false.
- Invertibility of `ℓ` and nontrivial deformation in the `h^{2,0}=1` case are checked hypotheses, not omitted defaults.
- Over a finite field, rational divisor classes on a curve inject because the degree-zero Jacobian points are torsion. For a complex elliptic curve the corresponding rational injectivity fails, so that finite-field hypothesis is essential. In codimension zero the rational-source injection `ℚ→ℚ_ℓ` is injective, without asserting it is onto as a rational map.

### 7.3 The standard conjectures with rational cycle representatives

Fix a classical Weil theory `H`, a smooth projective `d`-fold, an ample rational divisor `η`, and hard Lefschetz for `L=η∪-`. Hard Lefschetz is an additional supplied theorem, not a Weil axiom. Let `A_H^j(X)` be the rational image of Chow cycles in cohomology, even when the coefficient field `F` is larger than `ℚ`.

Define `A_H(X,η)` by bijectivity of `L^{d-2j}:A_H^j→A_H^{d-j}` for `0≤2j≤d`. Its API includes equivalence with surjectivity by hard Lefschetz, invariance under positive rational rescaling of `η`, and polarized transport. Define `B_H(X)` by algebraicity of the inverse of `L^{d-i}:H^i→H^{2d-i}` for `0≤i≤d`: its representative belongs to `CH^i(X×X)_ℚ`, a correspondence of degree `i-d`. Prove equivalence with algebraicity of the lowering operator and the Lefschetz/primitive projectors, and independence of polarization. This is the equivalence of Kleiman's `θ` and `B`, not an assumption in the predicate. (Kleiman, §4, p.14, Theorem 4.1, pp.14–15.)

Define `C_ℚ,H(X)` by rational cycle representatives for the canonical cohomological Künneth projectors in `H^{2d}(X×X)(d)`. Prove action by degree, scalar extension to the `F`-linear cycle version, and the exterior-product formula for product projectors. The converse from `F`-linear to rational algebraicity requires a descent argument and is not part of the definition. No chosen representative is asserted Chow-idempotent. Define `D_ℚ,H(X)` by vanishing of the realization of every rational cycle numerically trivial against every complementary rational cycle. Its API is equality of the numerical and homological kernels, nondegeneracy of the rational algebraic-image pairing and transport. The reverse kernel containment is unconditional by the trace formula of Layer 2. An `F`-linear variant is kept separately when coefficient extension is needed. (Kleiman, §§3–5, pp.12–17; Jannsen 1992, p.451.)

Define Hodge standard positivity on primitive algebraic classes `PA_H^j=A_H^j∩ker L^{d-2j+1}` by positive definiteness of
`(a,b)↦(-1)^j deg(a·b·η^{d-2j})`, `2j≤d`.
Its values are rational; no ordering on `ℚ_ℓ` is used. Supply primitive restriction, bilinearity, symmetry, positivity on nonzero classes, positive rescaling and transport. (Kleiman, §5, pp.16–19.)

Prove `B⇒A,C`, `A(X×X)` for the product polarization implies `B(X)`, and hence the global equivalence of A and B. Prove `D⇒A` and `A` together with Hodge positivity implies `D`. Over the complex numbers rational Hodge for all required codimensions gives A and D; Hodge for `X×X` gives B. The numerical realization factors through numerical motives only after D in the relevant coefficient scope. (Kleiman, Theorem 4.1, Corollary 4.2, pp.14–15, Proposition 5.1 and its consequences, pp.17–19.)

**Checks.**

- On `ℙ^d`, `h^j↦h^{d-j}` gives A. At `2j=d`, the map is the identity. On a positive-genus curve A holds on the algebraic image although `CH¹_ℚ` has a degree-zero kernel, ruling out defining A on Chow groups themselves.
- For a curve, the inverse of `L:H⁰→H²` has coefficient `1/deg η`. For a surface, the inverse from `H⁴` to `H⁰` has codimension zero on `X×X`, not codimension two.
- On a point C has just its degree-zero diagonal. On projective space odd projectors vanish. Modifying a representative by a homologically trivial correspondence does not preserve Chow-idempotence automatically.
- On `ℙ¹×ℙ¹`, with divisor generators `a,b`, `a-b` pairs to zero with `a+b` but to `-1` with `a`. D must test all complementary cycles.
- For surfaces the primitive divisor form is minus intersection; on a point it is multiplication. Rescaling an ample class by a positive rational number preserves positivity.

### 7.4 Established standard cases and point smash nilpotence

Keep the precise proof scope of the known standard cases. B holds for curves; for surfaces with `dim H¹=2dim Pic⁰` (automatic for ℓ-adic cohomology and in characteristic zero); for abelian varieties and generalized flag varieties; and is stable under products and smooth hyperplane sections. C holds in dimension at most two and for abelian varieties, with product stability. For a smooth projective variety over a finite field, assume that the characteristic polynomials of Frobenius on each degree of the specified ℓ-adic cohomology lie in `ℚ[T]` and are pairwise coprime. Construct rational cycles acting as the Künneth projectors by the Chinese remainder theorem and Cayley–Hamilton, as polynomials in the Frobenius graph. Transport them after algebraic field extension. This conditional construction requires neither semisimplicity of Frobenius nor a weight theorem. The unconditional finite-field case requires smooth-projective purity and rational degree-factor extraction; at this stage their polynomial output is an explicit hypothesis. No Chow-idempotence of the chosen representatives is asserted. Hodge positivity holds in characteristic zero for Betti and its compared étale theory, and for surfaces over an algebraically closed field in any characteristic via the Hodge index theorem and the identification of numerically and homologically trivial divisors. The geometric divisor identification and the primary proofs behind the remaining B/C cases are explicit prerequisites to proving this register. (Kleiman, Proposition 4.3, p.16, §5, pp.16–19; Jannsen 1992, Remarks 1–2, p.451.)

For geometrically integral smooth projective `X/k` and `x,x'∈X(k)`, prove that `([x]-[x'])^{×n}` is torsion in `CH₀(X^n)` for sufficiently large `n`. Reduce over an algebraic closure to a smooth curve `C` through the points and use the algebraic-extension torsion-kernel theorem to return to `k`. For `π:C^n→Sym^n C`, degree `n!`, set `L=O_C(x-x')`, `L_i=pr_i^*L`, `N=Norm_π(L₁)`. Prove
`π^*N=(⊗L_i)^((n-1)!)`,
`π^*(c₁(N)^n)=((n-1)!)^n n! ∏c₁(L_i)`.
For `n>g` and `n≥max(0,2g-1)`, the Abel map is a projective bundle; prove that `N` descends from `Pic^n C`, so `c₁(N)^n=0` by dimension. The displayed nonzero integer kills the exterior cycle. This corrects the larger erroneous coefficient in the online argument without changing the torsion conclusion. (Stacks, Lemma 0FH9 and its proof, Lemma 0FH8, and the Bertini step in Lemma 0FH7; the norm calculation above corrects the coefficient without changing the torsion conclusion.)

**Checks.**

- For `ℙ¹/𝔽_q`, the Frobenius polynomials are `T-1` and `T-q`; the projector polynomials are `(q-T)/(q-1)` and `(T-1)/(q-1)`. They act on the required degrees, including after base extension.
- If two nonzero degrees have polynomials with a common root, the Chinese remainder construction cannot separate those degrees. A Jordan block within one degree is permitted because its full characteristic polynomial is used.
- If `x=x'`, the exterior cycle is zero for every positive `n`.
- For `n=2`, the pullback coefficient is two; for `n=3`, it is `2³·6=48`, not `6³`.
- On a genus-zero curve the degree-zero divisor is already rationally trivial.
- The condition `n>g` is separate from the projective-bundle range. At `n=g` the dimension argument does not force the top power to vanish.

### 7.5 Bloch–Beilinson filtrations and Murre projectors

For a fixed field and Weil realization, formulate the global version-one Bloch–Beilinson assertion as descending filtrations on every `CH^j(X)_ℚ`, with `F⁰=CH^j`, `F¹=ker cl`, multiplicativity `F^aF^b⊂F^{a+b}`, compatibility with pullback and proper pushforward in the correct codimensions, and correspondence action on the associated graded depending only on the cohomology class. Under C, `π_i` acts on `Gr_F^νCH^j` by `δ_{i,2j-ν}`. Require eventual zero for each fixed `X,j`. The strong variant adds `F^{j+1}=0`. Supply filtration transport, product and correspondence APIs and the relation to motives. (Jannsen 1994, Conjecture 2.1 and strong form, §2, pp.257–260, §§4–5.)

Murre data are actual Chow projectors `π₀,…,π_{2d}`, orthogonal idempotent with sum `Δ`, lifting the cohomological degree projectors. Require high-index action `π_iCH^j=0` for `i>2j`; define
`F^νCH^j=⋂_{r=0}^{ν-1}ker(π_{2j-r})`
with the empty intersection all of Chow. Require independence of filtration from the permissible choice of projectors and `F¹=ker cl`. The strong variant adds low-index vanishing for `i<j`. Its API includes motivic direct-sum decomposition, projectors' action, filtration independence and the strong cutoff. Prove equivalence of global Murre and global version-one Bloch–Beilinson, including equality of their filtrations and the strong variants. A decomposition on one variety alone is not this global theorem. (Jannsen 1994, Conjecture 5.1 and Theorem 5.2, p.288, proof in Propositions 5.3–5.8, pp.289–296.)

**Checks.**

- On a pointed curve, `π₀=[o×C]`, `π₂=[C×o]`, `π₁=Δ-π₀-π₂`; `F¹CH¹=Pic⁰_ℚ`, and the strong `F²` is zero.
- On projective space, `π_{2j}=h₁^{d-j}h₂^j` acts as identity on `CH^j`, all odd projectors vanish, and `F¹=0`.
- `F⁰` uses an empty intersection, not the zero group. Eventual vanishing and the strong `j+1` cutoff are different requirements.
- Independence equates filtrations, not every pair of Chow projectors. A cohomological Künneth lift alone is insufficient Murre data.

### 7.6 A motivic t-structure and its conditional consequences

On `DM_gm(k,ℚ)` for perfect `k` admitting resolution, fix a Betti realization to `D^b(Vec_ℚ)` when `k⊂ℂ`, or a geometric ℓ-adic realization to `D^b(Vec_ℚℓ)`. Define a motivic t-structure using the existing categorical `TStructure`, with conservative cohomology, unit in the heart, joint tensor bounds `μ^{≤a}⊗μ^{≤b}⊂μ^{≤a+b}` and `μ^{≥a}⊗μ^{≥b}⊂μ^{≥a+b}` for every pair of integers, and t-exact chosen realization. Its heart is the intersection of the two degree-zero halves. The conjecture is existence. The perfectness/resolution scope comes from the geometric category constructed here; extending its construction would extend this scope. Supply truncation, heart inclusion, tensor bounds and conservative-cohomology APIs. (Beilinson 2010, §§1.1–1.2, p.1.)

Under this premise prove boundedness and uniqueness relative to the realization, conservative realization, finite length, exact Tate twists, and that the heart is a Tannakian `ℚ`-category with fiber in the realization coefficient field. Prove motivic hard Lefschetz, a generally noncanonical decomposition `M(X)≃⊕μH^a(M(X))[-a]`, and B and C. In characteristic zero, use comparison to obtain all standard conjectures and semisimplicity of the pure heart objects. The mixed heart need not be semisimple, and an ℓ-adic fiber does not assert `ℚ`-neutrality. (Beilinson 2010, §1.3, pp.1–2, proposition and corollary of §1.4, pp.2–3, §1.5, p.3.)

**Checks.**

- `ℚ(1)` is in the heart, whereas `ℚ(1)[2]` is shifted. In the homological convention `M(ℙ¹)` has μ-cohomology in degrees zero and minus two.
- Tensoring with a heart object is t-exact; tensoring with its nonzero shift is not asserted t-exact.
- T-exactness alone would allow a realization killing a nonzero object; conservative cohomology and the resulting conservative realization prevent that candidate.
- In a mixed heart, extensions between pure objects need not split; the pure semisimplicity consequence must not be applied to all objects.

### 7.6a Semialgebraic and equivariant cohomology

For every real closed `R` and `C=R(i)`, construct the locally semialgebraic spaces `X(R)` and `X(C)` for separated finite-type `X/R`, using affine charts and gluing without a quasiprojectivity assumption. Construct their semialgebraic sheaf sites, integral cohomology, compact supports and locally constant coefficient systems. Define `G=Gal(C/R)`-equivariant sheaves and cohomology as derived invariant sections, including supports and the sign twists `ℤ(j)`. Give pullback, localization, coefficient sequences, products, extension along real closed field extensions and its invariance for these finite-type data. Over the actual real numbers construct comparison with singular and Borel equivariant cohomology. Construct restriction, norm, the real-complex exact sequences and Hochschild–Serre, with their products and boundary maps. This constructs the theory used by §§0.5a–0.6 and 7.7–7.15; polynomial quantifier elimination supplies only its semialgebraic input. (Benoist–Wittenberg I, §§1.1.1–1.1.3, pp.9–12, equations (1.1)–(1.9); its semialgebraic sources Delfs–Knebusch and Delfs, as cited there.)

**Checks.**

- For `X=Spec R`, equivariant cohomology is group cohomology: `H_G⁰(ℤ)=ℤ`, `H_G²(ℤ)=ℤ/2`, `H_G⁰(ℤ(1))=0` and `H_G¹(ℤ(1))=ℤ/2`. Erasing the sign action fails these tests.
- For `X=Spec C` regarded over `R`, the action on its two complex points is free and positive-degree equivariant cohomology with constant integral coefficients vanishes. Restriction followed by norm on the untwisted constant class multiplies by two.
- The semialgebraic interval is connected with `H⁰=ℤ` over every real closed field, including non-Archimedean ones. This uses semialgebraic connectedness rather than order-topological connectedness.
- Empty spaces have zero cohomology, and a split two-point real scheme has two degree-zero summands. Real closed extension preserves these computations.

### 7.6b Duality, real-locus decomposition and cycle operations

On the theory of §7.6a construct semialgebraic dualizing complexes, proper traces, Poincaré duality with the orientation local system, and equivariant purity for smooth pairs. Give products, projection and base-change formulas, compatible restriction/corestriction and real-locus localization. Prove the mod-two real-locus decomposition `H_G^m(X(R),𝔽₂)≃⊕_{p=0}^m H^p(X(R),𝔽₂)` and the integral sign-twisted decomposition with its coefficient-reduction map; do not infer integral product formulas from the mod-two formula. Construct Steenrod squares with naturality, Cartan and Thom identities, the equivariant integral algebraic cycle map and Borel–Haefliger classes. Prove their proper-pushforward, pullback, product and boundary compatibilities and the real-locus component equations of Benoist–Wittenberg I Theorem 1.18, including Theorem 1.21's proper-pushforward compatibility. Supply these operations with supports to §§0.5a–0.5b's duality/Gersten construction and coniveau restriction. (Benoist–Wittenberg I, §§1.1.4–1.6, pp.12–34, equations (1.16), (1.21), (1.26), (1.29)–(1.31), Definition 1.19 and Theorems 1.18, 1.21; semialgebraic duality: Delfs, *Homology of Locally Semialgebraic Spaces*, Chapter III §9, Theorem 9.3, as used there.)

**Checks.**

- On a real point the decomposition recovers the group-cohomology computation of §7.6a; on an empty real locus it has no summands. The `p`th component is zero for `p` outside the displayed range.
- On `ℙ¹_R`, `c₁(O(1))` restricts to the nonzero Borel–Haefliger generator of `H¹(ℙ¹(R),𝔽₂)`. Its first Steenrod square is zero by the dimension of the circle.
- Purity for a smooth codimension-`c` complex pair shifts degree by `2c` and twist by `c`; the real-locus mod-two Thom isomorphism instead shifts degree by `c`.
- The trace pairs complementary degrees and uses the orientation sheaf; an integral untwisted orientation on a nonorientable real component is not supplied. A norm of a nonreal point has degree two.

### 7.7 Integral and real admissible Hodge targets

For smooth proper complex `X` and `k≥0`, define integral Hodge classes as the inverse image of `H^{k,k}` in `H^{2k}(X,ℤ(k))`; integral Hodge means surjectivity from `CH^k(X)`, with defect its cokernel. Include the subgroup, cycle factorization, rationalization and defect-zero APIs. Every torsion cohomology class lies in this subgroup. (Benoist–Wittenberg I, §2.1, pp.35–36.)

For smooth proper `X/ℝ`, let `G=Gal(ℂ/ℝ)` and use the equivariant integral theory of §§7.6a–7.6b. Write `A_G^{2k}(X,ℤ(k))` for the admissible subgroup: in the canonical mod-two decomposition of restriction to the real locus require `α_{k+i}=Sq^i(α_k)` for every even integer `i`, with negative squares and out-of-range components zero. Define `Hdg_G^{2k}{}_0` as its intersection with the inverse image of ordinary integral Hodge classes. Real integral Hodge is surjectivity from `CH^k(X)` to this intersection. Its API includes the membership equations, defect, pullback, cup product, proper pushforward and identification of the component `α_k` with Borel–Haefliger cycle class. (Benoist–Wittenberg I, Definition 1.19 and equation (1.58), pp.31–32, Definition 2.2 and equation (2.1), p.37.)

Over any real closed `R`, put `C=R(i)`. Under the vanishings `H^q(X,Ω_X^p)=0` for `p+q=2k`, `(p,q)≠(k,k)`, define the real-closed property as surjectivity to the semialgebraic admissible subgroup `A_G^{2k}`. Give its defect-zero, isomorphism-transport and comparison APIs. Over `ℝ` those vanishings identify this with the preceding predicate. No analytic Hodge decomposition or embedding in `ℝ` is assumed for arbitrary `R`. (Benoist–Wittenberg I, Definition 2.3 and preceding paragraph, p.37.)

If complex rational Hodge holds, prove rational surjectivity of the real target by norm and division by two. For positive even `k`, prove the constant torsion class `ω^{2k}`, interpreted in twist `k`, is admissible exactly when `X(R)` is empty. Over `ℝ` it is Hodge because torsion maps to zero in complex cohomology. The unit case `k=0` is excluded. (Benoist–Wittenberg I, Remark 2.4 and following discussion, pp.37–38.)

**Checks.**

- On a complex point the degree-zero target is `ℤ`; torsion in any integral cohomology group belongs to its integral Hodge subgroup, even when its complex image is zero.
- In codimension one the real admissibility equations impose no extra constraint. Omitting the Hodge condition still changes the target when `H²(O)` is nonzero.
- For positive even `k` and a nonempty real locus, `ω^{2k}` fails admissibility although it is Hodge; the intersection cannot be replaced by the entire equivariant Hodge group.
- In top degree `k=d` the off-diagonal vanishings hold by dimension. For divisors they follow from `H²(O)=0` and its conjugate.
- A non-Archimedean real closed field with off-diagonal cohomology does not acquire an analytic predicate from this construction.

### 7.8 Divisors, zero-cycles, projective space and blowups

Prove the complex integral divisor theorem `Pic→Hdg²(ℤ(1))` and its real equivariant counterpart `Pic→Hdg_G²(ℤ(1))`. For arbitrary real closed `R`, prove `H²(O_X)=0` implies surjectivity `Pic(X)→H_G²(X(C),ℤ(1))`, using Kummer comparison and the torsion-free divisor cokernel. The last proof is algebraic/semialgebraic and does not invoke analytic Hodge theory over `R`. (Benoist–Wittenberg I, Propositions 2.8–2.9, pp.39–40; Benoist, real period–index paper, proofs of Proposition 1.2 and Proposition 6.6.)

For every smooth proper pure `d`-fold over a real closed field, prove surjectivity for zero-cycles to the admissible group. Identify generators from a real point in each semialgebraic connected component and norms of complex points in each complex component. Prove the real-closed property in every codimension on projective space, generated by hyperplane powers. Keep the unit and out-of-range zero conventions. (Benoist–Wittenberg I, Propositions 2.10 and 2.15, pp.40,43–44.)

For a blowup `π:X̃→X` of a smooth proper variety in a smooth codimension-`r` center `Y`, with exceptional maps `τ:E→Y`, `ι:E→X̃` and `ξ=c₁(O_E(1))`, prove the admissible-group isomorphism
`(α,(β_i))↦π*α+Σ_{i=k-r+1}^{k-1}ι*(ξ^{k-i-1}τ*β_i)`
in codimension `k`, and preservation of the Hodge subgroup over `ℝ`. Terms outside the geometric range are zero. Deduce birational invariance of the real integral Hodge defect in codimension two and for one-cycles, and over arbitrary real closed fields birational invariance of the cokernel of `CH₁→A_G^{2d-2}`. (Benoist–Wittenberg I, Proposition 2.13, Lemma 2.14 and equations (2.2)–(2.3), pp.41–42.)

**Checks.**

- On `ℙ^d`, `h^k` generates the target for `0≤k≤d`; `k>d` has zero target.
- A blowup in a divisor has no extra summand. Blowing up a point on a surface adds the exceptional divisor with exponent zero.
- With codimension-three center and `k=2`, the extra terms have `i=0,1` and powers `ξ¹,ξ⁰`, checking the index reversal.
- A norm of a nonreal point has degree two. Dividing by two proves a rational statement and cannot prove the integral zero-cycle statement by itself.

### 7.9 One-cycle detectors, genus and torsion descent

Here `R` is real closed and `X/R` smooth proper geometrically integral of dimension `d≥1`. Define `M=𝔽₂` if `X(R)=∅`, and otherwise `M=H^{d-1}(X(R),𝔽₂)`, with dual respectively `𝔽₂` or `H¹(X(R),𝔽₂)` by total Poincaré duality. Use the detector `ψ:A_G^{2d-2}→M`: cup with `ω²` followed by `H_G^{2d}(ℤ(d+1))≃𝔽₂` in the empty case, and the Borel–Haefliger component otherwise. Define `ψ':Pic(X_C)^G[2^∞]→M^*` by the Brauer descent obstruction in the empty case and the Borel–Haefliger class of torsion line bundles otherwise; when a real point exists `Pic(X)=Pic(X_C)^G`. Prove their images are exact annihilators. (Benoist–Wittenberg I, Definitions 3.1–3.2 and Theorem 3.3, pp.46–49.)

Put `φ=ψ∘cl` on `CH₁(X)`. For empty real locus, an integral curve contributes one exactly when its normalization is geometrically integral of even genus; otherwise it contributes zero. For a smooth proper geometrically integral empty-real curve `B`, prove surjectivity on invariant two-primary torsion line bundles exactly when its genus is even, using descent of invariant line bundles of degree congruent to the genus modulo two. If `E→F` is finite between such curves, `F(R)=∅` and `g(F)` is even, prove `g(E)` even exactly when the degree is odd. (Benoist–Wittenberg I, Theorem 3.6, Lemma 3.7 and Sublemma 3.8, pp.49–50, Proposition 3.12, p.52.)

For `d≥2`, construct an odd-geometric-genus curve, and, when `X(R)` is nonempty, an even-geometric-genus curve. For any nonempty proper variety, including singular ones, prove that the intermediate Euler-characteristic index `ind₁` is one exactly when there is a real point or a geometrically integral even-geometric-genus curve, and otherwise is two. Under the smooth hypotheses and `Pic(X_C)[2]=0`, prove exactness of
`H^{2d-2}(X(C),ℤ(d-1)) —norm→ A_G^{2d-2} —ψ→ M →0`.
This last statement requires no integral Hodge conjecture. (Benoist–Wittenberg I, Propositions 3.9–3.10 and Corollary 3.11, pp.51–52, Proposition 3.14 and Lemma 3.15, pp.53–54.)

**Checks.**

- A real-point curve contributes its Borel–Haefliger fundamental class; an empty-real geometrically integral genus-zero curve contributes one.
- An empty-real odd-genus curve has detector zero and `ind₁=2`; a curve not geometrically integral contributes zero even if an arithmetic genus expression alone suggests otherwise.
- Over an empty-real even-genus base curve, odd cover degree preserves even genus and even degree gives odd genus.
- The existence of an even-genus curve from a real point uses `d≥2`; an odd-genus curve with real points in dimension one is a counterexample to dropping it.
- The norm's image is admissible and equals the kernel; it need not equal the whole admissible group when `M≠0`.

### 7.10 Obstruction predicates, surfaces and descent of algebraicity

Define a topological detector obstruction as failure of surjectivity of `ψ`. Over `ℝ`, define a Hodge obstruction as surjective `ψ` but failure on `Hdg_G{}_0`, and a cycle obstruction as surjectivity on that Hodge subgroup but failure of `φ`. Over arbitrary real closed fields with `H²(O)=0`, a cycle obstruction means surjective `ψ` but nonsurjective `φ`. Supply membership, transport and implication APIs. Topological failure requires `Pic(X_C)[2]≠0`; Hodge failure requires `H²(O)≠0`; cycle failure contradicts the real integral Hodge property. These predicates classify detector failures, not all integral Hodge defects. (Benoist–Wittenberg I, §3.6.1, pp.54–55.)

Assuming `H²(O)=0` and real integral Hodge for one-cycles, prove that all curve classes and two-primary torsion divisor classes are exact orthogonal complements on the real locus. If additionally `d≥2` or `X(R)=∅`, prove existence of an even-geometric-genus curve exactly when `Pic(X)[2^∞]→Pic(X_C)^G[2^∞]` is onto. The dimension-or-emptiness condition repairs the unqualified assertion: a real-point odd-genus curve disproves it in dimension one. If `Pic(X_C)[2]=0`, the curve class map is onto and an even-genus curve exists; in dimension one this torsion hypothesis forces genus zero. (Benoist–Wittenberg I, Theorem 3.16, p.55, with the curve-existence conditions of Proposition 3.9.)

For surfaces with `H²(O)=0`, apply the divisor theorem to obtain orthogonality of `cl_R(Pic)` and `cl_R(Pic[2^∞])` and the lower bound `dim H¹_alg≥½dim H¹`. For Enriques surfaces use geometric two-primary torsion generated by the descended canonical class to obtain an even-genus curve. Over `ℝ`, prove `H¹_alg=w₁(X(ℝ))^⊥`, proper exactly when some component is nonorientable. The Picard-torsion description and `cl_R(K_X)=w₁` are explicit geometric inputs to prove. (Benoist–Wittenberg I, Corollary 3.17, Remark 3.18, Example 3.19 and Corollary 3.20, pp.56–57.)

Under `Pic(X_C)[2]=0`, `H²(O)=0` and surjectivity of the complex integral one-cycle map, prove real integral Hodge for one-cycles exactly when `φ` is onto. With real points this is full Borel–Haefliger surjectivity; without real points it is existence of a geometrically integral even-genus curve. Apply to geometrically rationally connected threefolds, and geometrically simply connected Calabi–Yau threefolds with `K=O`, `H¹(O)=H²(O)=0`, only after supplying the complex integral one-cycle theorem and Picard-torsion vanishing. Those are primary-proof obligations, not consequences of a variety's name. (Benoist–Wittenberg I, Theorem 3.22 and Corollary 3.23, pp.57–58.)

**Checks.**

- A geometrically integral real curve with at least two real components has only its constant fundamental class in `H⁰`; its detector is topologically deficient.
- In the `H²(O)=0` range there is no intervening Hodge obstruction.
- The real-point odd-genus curve fixes the repaired dimension hypothesis above, while an empty-real curve remains in the genus/descent theorem.
- Surjective `φ` without the complex algebraicity and Picard-torsion conditions is not a proof of real integral Hodge.
- On a real Enriques surface a nonorientable component makes the canonical Borel–Haefliger class nonzero and its orthogonal complement proper.

### 7.11 Explicit obstructions and the Euler-characteristic restriction

Construct the real geometric examples below with their specified cohomological properties. Real Enriques surfaces with a nonorientable component require the classification/existence input. For a sharp surface bound, construct a conic bundle over a real elliptic curve with two real components, smooth above its real locus and with connected nonempty total real locus, and calculate `dim H¹=2`, `dim H¹_alg=1`. The bundle and class calculation remain needed. Construct a real K3 with nonzero topological `H¹` but zero algebraic `H¹`, including its real-locus topology and the vanishing of the Borel–Haefliger image. (Benoist–Wittenberg I, Examples 4.1–4.3, pp.58–59, Remarks 3.21, p.57.)

There is an explicit obstruction to the displayed Campedelli construction. For a primitive eighth root `ζ` set
`f[x₀:…:x₆]=[ζx̄₁:x̄₀:ζ²x̄₃:x̄₂:ζ³x̄₅:x̄₄:x̄₆]`.
Then `g=f²` has weights `(1,7,2,6,3,5,0)` modulo eight and `f` has order sixteen. Prove that even quadratic weight spaces have dimension four and odd ones dimension three. On the weight-four basis `(x₀x₄,x₁x₅,x₂²,x₃²)`, the conjugate-linear operator `T(Q)=overline(Q(f(x)))` acts on coefficients by
`(A,B,C,D)↦(B̄,-Ā,D̄,-C̄)`, so `T²=-1`.
It has no invariant complex line. Thus a smooth scheme-theoretic complete intersection with one nonzero quadric in each weight `0,2,4,6` cannot be `f`-stable: its quadratic ideal would give an invariant line of weight four. Give the coefficient action's conjugate-linearity, square as minus the identity and exclusion of invariant complex lines. (Benoist–Wittenberg I, Example 4.4, pp.59–60, corrected by this calculation.)

**Odd Euler characteristic forces torsion descent.** For every smooth projective geometrically integral `X/R`, prove that odd `χ(X,O_X)` makes `Pic(X)_tors → (Pic(X_C)_tors)^G` an isomorphism, hence also on two-primary torsion. Here is a proof route independent of the invalid construction. For an invariant line bundle `L` on `X_C`, an isomorphism to its conjugate squares to a scalar `c∈R*`, because global units on `X_C` are `C*`; commuting with that isomorphism makes `c` real. Rescaling changes `c` by a norm. A positive `c` can be normalized to one and gives descent. A negative `c` can be normalized to minus one. In that case each coherent cohomology group of `L` has a conjugate-linear operator `J_i` squaring to minus one. In a basis write `J_i(v)=M_i v̄`; then `M_i M̄_i=-I`, so `N(det M_i)=(-1)^{n_i}` for `n_i=dim_C H^i(X_C,L)`. Thus every `n_i` is even and `χ(X_C,L)` is even. For torsion `L`, rational Chern character is one, and Riemann–Roch gives `χ(X_C,L)=χ(X_C,O)=χ(X,O)`, a contradiction. Finally Hilbert 90 makes `Pic(X)→Pic(X_C)` injective, so a descended torsion class has the same order. The API includes restriction to `n`-torsion for every `n≥1`, uniqueness of descent, and the corollary for vanishing higher coherent cohomology. This is a deduction from descent and Riemann–Roch, not a theorem attributed to Example 4.4. (Compare the descent obstruction in Benoist–Wittenberg I, Lemma 3.7 and Sublemma 3.8, p.50; Stacks, *Chow Homology and Chern Classes*, §§45,66, Tags 02UM,02UO, pp.90–91,154, version `ed88ff78`.)

In particular, `H^i(X,O_X)=0` for all `i>0` gives `χ=1`: a surface with these hypotheses and failed invariant torsion descent cannot exist. For an actual real-empty surface with failed descent, use `S=B×ℙ¹_R`, where
`B={x₀²+x₁²+x₂²+x₃²=x₁²+2x₂²+3x₃²=0} ⊂ ℙ³_R`.
The first quadric has no real point. Distinct diagonal coefficients make the two gradients independent at every common geometric zero: a dependence would leave at most one nonzero coordinate, contradicting the first equation. The Koszul resolution gives geometric connectedness, and smoothness then gives geometric integrality. Adjunction gives trivial canonical bundle and genus one. Lemma 3.7 supplies a non-descending invariant two-torsion line bundle on `B_C`; explicitly its proof starts with a non-descending degree-zero class `L=2L₀` and uses `L-N(L₀)`. Pullback to `S_C` still fails to descend, since restriction along the real section `B→S` would descend the original class. Coherent Künneth gives `h¹(S,O)=1`, `h²(S,O)=0`, `χ=0`. Thus the nonvanishing of higher coherent cohomology is necessary here. By §7.10 this surface has the topological obstruction and `ind₁(S)=2`. The API is the pullback/restriction witness, the coherent invariants and the obstruction calculation; its geometric inputs come from the existing intersection, coherent-cohomology and Picard suppliers. (Benoist–Wittenberg I, Lemma 3.7, p.50, Corollary 3.17(ii), p.56, and Example 4.2, p.58, together with the displayed complete-intersection calculation.)

Construct two quartic-surface Hodge obstructions using a real Noether–Lefschetz/deformation theorem. Near a quartic containing a real line, transport the line class to a very general quartic with `Pic(X_C)=ℤh`. Its odd pairing with `h` cannot be a multiple of `h²=4`. For a very general empty-real quartic with the same Picard group, a smooth hyperplane section has genus three and detector zero, so every divisor has detector zero and no geometrically integral even-geometric-genus curve exists. The required real fibers and Picard ranks are geometric proof obligations; arithmetic and geometric genus are not identified for singular curves. (Benoist–Wittenberg I, Examples 4.5–4.6, p.60.)

Over `𝔽̄_p((t))`, prove that `x₀⁴+t x₁⁴+t²x₂⁴+t³x₃⁴=0` has no point over an odd-degree finite extension: its odd ramification index makes nonzero term valuations distinct modulo four. Use DVR cycle specialization in the bidegree `(4,4)` degeneration
`v(u³x₀⁴+u²v x₁⁴+uv²x₂⁴+v³x₃⁴)=0`
to force even projection degree for every complex curve of the constructed smooth fibration. A real approximation over `ℙ¹` can then have a real section with nonzero topological projection while all algebraic curves have zero mod-two projection. Over an empty-real conic base use the finite-cover parity theorem to force odd geometric genus for all geometrically integral curves and hence `ind₁=2`. DVR specialization and real approximation are necessary construction targets; specialization to a normal cone alone is insufficient. (Benoist–Wittenberg I, Examples 4.7–4.8, pp.60–61; Totaro 2013, Theorem 2.1 and proof, author preprint p.3.)

Finally, for the anisotropic smooth projective quadric of dimension `n` over real closed `R`, prove that `ω⁴` is algebraic exactly when `-1` is a sum of seven squares in `R(X)`, exactly when `n≤6`. Thus `n≥7` gives an admissible nonalgebraic codimension-two constant class. The real function-field comparison and Pfister sums-of-squares theorem are named primary-proof inputs still to supply. (Benoist–Wittenberg I, Example 2.5, p.38.)

**Checks.**

- In the Campedelli calculation `T(0)=0` and `T²v=-v`; if `Tv=av` for a nonzero vector, applying `T` gives `-v=|a|²v`, impossible. On coefficients `((i,0),(0,0))` the action gives `((0,i),(0,0))`; omitting conjugation changes that sign.
- A zero cohomology group has even dimension; a one-dimensional conjugate-linear `J` cannot square to minus one because `a ā≥0`. Two dimensions admit `J(z,w)=(w̄,-z̄)`. This checks the parity step including its degenerate case.
- The trivial torsion line always descends. For geometrically integral `X` with vanishing higher coherent cohomology, `χ=1` rules out failed torsion descent in every dimension. This does not rule out real forms of Campedelli surfaces whose torsion does descend.
- In the replacement surface `B×ℙ¹`, `q=1`, `p_g=0` and `χ=0`; the real section of the projection detects failed descent. Replacing `B` by an empty-real conic gives genus zero and surjective torsion descent instead. No higher-cohomology-vanishing assertion is retained for the obstruction surface.
- The transported quartic line has odd hyperplane intersection, whereas any multiple of `h` has intersection divisible by four.
- In the valuation example an odd ramification index permutes the four residue classes modulo four; no two minimal nonzero terms can cancel. A zero coordinate contributes no valuation term.
- Empty-real conic genus zero is the even-genus base in the parity criterion. Curves in its fibers are included in the degeneration argument, not discarded by calling every curve a multisection.
- The anisotropic-quadric threshold is six versus seven; the constant-class test applies only in positive even codimension.

### 7.12 Unramified defects, coefficient boundaries and torsion cycles

For smooth proper geometrically integral `X/R`, `d≥3`, assume universal support of `CH₀` on a surface after every algebraically closed extension. Let `ℋ_X^q(A(j))` be the Zariski sheaf of the equivariant cohomology presheaf, and let its subscript zero mean the kernel of restriction to the real-locus sheaf of `H^q(G,A(j))`. Prove the canonical identification
`H^{d-3}(X,ℋ_X^d(ℚ/ℤ(d-1))_0) ≃ coker(CH₁(X)→A_G^{2d-2})_tors`.
Under `R=ℝ` or `H²(O)=0`, prove real integral Hodge for one-cycles exactly when this group vanishes. For `d=3` identify it with `H³_nr(X,ℚ/ℤ(2))_0`, the unramified classes vanishing at every real point. Keep the supported-diagonal, Gersten and real restriction comparison as explicit prerequisites. (Benoist–Wittenberg I, Proposition 5.1, pp.62–65, Proposition 5.2 and Remarks 5.3, pp.66–67.)

Under the same smooth hypotheses, `R=ℝ` or `H²(O)=0`, real integral Hodge for one-cycles and universal surface support, define
`∂:H_G^{2d-3}(ℚ/ℤ(d-1))→H_G^{2d-2}(ℤ(d-1))`.
Here the subscript-zero subgroup in the *source* means `∂⁻¹(A_G^{2d-2})`. Prove
`∂⁻¹(N^{d-2}H_G^{2d-2}(ℤ(d-1)))=N^{d-2}H_G^{2d-3}(ℚ/ℤ(d-1))`.
Construct Bloch's torsion Abel–Jacobi map and prove it surjective onto `H_G^{2d-3}(ℚ/ℤ(d-1))_0`, and bijective for `d≤3`. In low dimensions use the zero-group conventions instead of a negative-degree unramified expression. Prove that two-primary torsion curve classes are the exact annihilator of the image of `H_G²(ℤ(1))` in `H¹(X(R),𝔽₂)`; when `H²(O)=0`, this image is that of all divisors. (Benoist–Wittenberg I, Theorem 5.4, Corollary 5.5, Lemma 5.6 and proofs, pp.68–70.)

For smooth connected projective complex `X`, `d≥3`, with `CH₀` supported on a surface, prove the finite integral Hodge defect in degree `2d-2` is `H^{d-3}(X,ℋ_X^d(ℚ/ℤ(d-1)))`. These are ordinary complex sheaves; no real-locus-zero subscript appears. The proof uses the diagonal support bound and the integral Bloch–Ogus coefficient sequence. (Colliot-Thélène–Voisin, Proposition 3.3(ii), pp.10–11, Theorem 3.11 and Corollary 3.12, pp.14–15 of the 2011 preprint.)

**Checks.**

- In dimension three the sheaf-cohomology exponent is zero, giving unramified degree three. For `d≤2` it is not interpreted as an ordinary nonnegative-degree group; divisors and zero-cycles supply the low-dimensional conclusions.
- If the real locus is empty, restriction-to-real-locus imposes no extra condition; over a complex variety no such condition is introduced at all.
- The boundary raises degree by one and keeps twist `d-1`. Its source-zero notation is a preimage, not the kernel of `∂`.
- The orthogonality here pairs torsion curves with all divisors. The earlier theorem pairs all curves with torsion divisors; interchanging them changes the assertion.

### 7.13 Quartic threefold calculations and their hypotheses

For a smooth quartic `X⊂ℙ⁴_R` with empty real locus, assuming real integral Hodge for one-cycles, prove
`CH₁(X)_tors≃𝔽₂⊕(ℚ/ℤ)^30`.
Assume the explicit cohomological data `H_G⁴(ℤ(2))≃ℤ⊕𝔽₂`, primitivity of the norm of a line and rank thirty for `H_G³(ℤ(2))`. Use universal surface support and the coefficient-boundary and torsion-cycle comparisons of §7.12 to deduce the displayed Chow torsion. The numerical cohomology data are hypotheses, with their integral lattice and norm structure retained. Over `ℝ`, the real-empty Fano-threefold theorem removes the integral Hodge premise. Over arbitrary real closed fields retain it. (Benoist–Wittenberg I, Proposition 5.7 and Lemmas 5.8–5.9, pp.70–71; II, Theorem 7.1 and Corollary 7.2, pp.389–390.)

For the full Chow group of an empty-real quartic over `ℝ`, take as additional input its real intermediate Jacobian, the comparison with the degree-zero Chow group, and the resulting group description `ℤ⊕𝔽₂⊕(ℝ/ℤ)^30`; the Checks below test its relation to the torsion theorem. For the real-point quartic `x₀⁴+x₁⁴=x₂⁴+x₃⁴+x₄⁴`, take the admissible degree-four lattice, degree-three rank and integral Hodge assertion as explicit inputs to the same torsion comparison, giving `𝔽₂⊕(ℚ/ℤ)^30`. These specified-variety data are hypotheses, rather than additional computation targets. (Benoist–Wittenberg I, Remark 5.10, pp.71–72.)

Prove the general geometric criterion: for a smooth Fano threefold over `ℝ` with very ample `-K_X`, a smooth anticanonical surface `S` with nonzero `(-1)`-eigenspace in `H^{1,1}_van(S_C)` has algebraic image under `H_G²(S_C,ℤ(1))→H_G⁴(X_C,ℤ(2))`. If the pushforward `H₁(S(ℝ),𝔽₂)→H₁(X(ℝ),𝔽₂)` on singular homology is also surjective, deduce real integral Hodge for one-cycles. Applying it to the displayed quartic assumes those surface and restriction properties. This retains the geometric theorem at its general Fano scope. (Benoist–Wittenberg II, Proposition 7.7 and proof, pp.393–395.)

**Checks.**

- The displayed full group has torsion exactly `𝔽₂⊕(ℚ/ℤ)^30`, since the torsion of `ℝ/ℤ` is `ℚ/ℤ`; the converse reconstruction of the full group from its torsion is invalid.
- The exponent thirty is a cohomology-rank calculation, not the complex middle Betti number inserted without real descent.
- The explicit quartic has real points, so the empty-locus theorem cannot be applied to it.
- An arbitrary real closed field does not acquire the analytic Fano-threefold input merely from the same equation.

### 7.14 Quantified cycle questions

Formulate, without asserting their open status, the source questions: whether all smooth proper rationally connected complex varieties satisfy integral Hodge for one-cycles; whether some real closed field admits a smooth proper odd-dimensional empty-real variety with nonalgebraic `ω^{2d-2}`; whether real varieties with complexification a uniruled threefold, a Calabi–Yau threefold with `K=O`, `H¹(O)=H²(O)=0`, or a rationally connected variety satisfy real integral Hodge for one-cycles; and whether complex integral Hodge for one-cycles can coexist with a real cycle obstruction. These are universally or existentially quantified predicates, not unconditional theorem targets. (Benoist–Wittenberg I, Questions 2.1, 2.6, 2.16 and 4.9, pp.36,38,44,61.)

**Checks.**

- `complexProjectiveThreeSpaceLine`: on `ℙ³_ℂ`, the one-cycle map sends the line generator of `CH₁=ℤ` to the generator of integral degree-four Hodge cohomology.
- `realProjectiveThreeSpaceLine`: on `ℙ³_R`, a real line generates the admissible one-cycle target and has nonzero Borel–Haefliger class.
- `anisotropicQuadricThreefoldOmegaFour`: an anisotropic real quadric threefold has algebraic `ω⁴` by §7.11, so it does not witness the existential odd-dimensional obstruction.
- `emptyRealConicUnit`: an empty-real conic has algebraic `ω⁰=1`, fixing the dimension-one boundary.

These are named acceptance theorem targets on the geometric carriers of §§7.6a–7.8 and 7.11, with the sources of those sections; the quantified predicates themselves remain questions.

### 7.15 Compatible Hodge and Tate classes

For a number field `k` and coefficient number field `L⊂ℂ`, use the compatible-realization category with Betti `L`-space `V_B`, its `L`-Hodge structure, and, for every rational prime `ℓ`, a continuous `G_k`-module `V_ℓ` with comparison `i_ℓ:V_B⊗ℚ_ℓ≃V_ℓ`. Define `HT(V)` by type `(0,0)` and `G_k`-invariance of `i_ℓ(c⊗1)` for every `ℓ`. Its API includes the `L`-subspace, membership, morphism functoriality and a scalar-extension map `HT(V)⊗_L L'→HT(V⊗_L L')`; do not assert this map is an isomorphism without proof. For nonreal `L` retain the source's `L`-Hodge convention; identification with an underlying rational Hodge structure is a separate comparison. This terminology means simultaneous Hodge and Tate classes, not p-adic Hodge–Tate weights. (Ichino–Prasanna, §2.1, p.12, Definition 12.1, p.82 of arXiv v2.)

**Checks.**

- The compatible unit has `HT=L`.
- A nonzero Tate twist `L(1)` has type `(-1,-1)` and no such class.
- A nontrivial quadratic Artin line has type `(0,0)` but nontrivial Galois action, so its `HT` is zero; a Hodge-only test would fail.
- Testing one convenient prime is insufficient for the every-prime definition.

### 7.16 Beilinson–Bloch rank predicates

For smooth projective `X/E`, `E` a number field, `dim X=2r-1`, `r≥1`, let `CH^r(X)^0` denote geometrically homologically trivial cycles in the fixed compatible realizations. Given the motivic L-data, analytic continuation, prime independence and finite order at zero, define Beilinson–Bloch by
`rank_ℤ CH^r(X)^0=ord_{s=0}L(s,H^{2r-1}(X_Ebar,ℚ_ℓ(r)))`.
For a correspondence algebra `T` and a nonzero irreducible finite-dimensional complex `T`-module `ρ`, define its equivariant variant by replacing cycle rank with `dim_ℂHom_T(ρ,CH^r(X)^0_ℂ)` and the realization by the same `Hom_T` on cohomology, using the compatible coefficient embedding. The analytic conditions are hypotheses; finite cycle rank is part of the conjectural conclusion. Supply transport by compatible module isomorphisms, the scalar-algebra specialization and the finite-rank consequence of finite analytic order. (Li–Liu, introduction and equation (1.1), pp.2–3.)

**Checks.**

- For `r=1` and an elliptic curve, `CH¹_hom=Pic⁰(E)(E)` and the twist places the usual BSD center at one.
- Analytic order zero predicts vanishing after rationalization; it does not kill integral torsion.
- With `T=ℂ` and its one-dimensional scalar representation, the refined formula reduces to the unrefined formula after coefficient comparison.
- Nonzero Hecke localization alone does not imply a one-dimensional Hom multiplicity or the rank equality.

### 7.17 Rational primitive heights, coefficient extension and normalization

For smooth projective geometrically integral `X/E` of dimension `d` over a number field `E`, write `V^p=CH^p(X)_hom,ℚ`. The height pairs codimensions `p` and `d+1-p`, not `d-p`. Specify its construction domain before stating positivity. On a regular projective flat model `𝒳/O_E`, let `A^p` be the model Chow classes with homologically trivial generic restriction and `F^p` the classes with zero generic restriction. Given the Gillet–Soulé arithmetic-intersection pairing on these model classes, define
`D^p_𝒳 = image({a∈A^p : ⟨a,v⟩_𝒳=0 for every v∈F^{d+1-p}} → V^p)`.
For `x∈D^p_𝒳`, `y∈D^{d+1-p}_𝒳`, define `h_raw(x,y)` by arithmetic degree of the product of orthogonal lifts with curvature-zero Green currents. A change of lift is vertical and pairs to zero; a change of the Green currents pairs to zero because the other generic class is homologically trivial. Its API is bilinearity, symmetry with the codimensions exchanged, independence of these choices, and correspondence adjunction. This is a conditional construction from the specified model intersection pairing, not from ordinary Chow intersection or line-bundle arithmetic degree alone. To obtain a pairing on all `V^p`, require existence of the regular model and surjectivity `D^p_𝒳=V^p` in every relevant codimension. With those hypotheses, prove independence of the model and descent from a finite number-field extension; pullback over `E'/E` multiplies `h_raw` by `[E':E]`. For abelian varieties the required models and orthogonal lifts after finite extension are theorem targets without a conjectural existence premise. (Künnemann 1996, §5, equations (15)–(17), pp.786–787; Künnemann 2001, §1, Assumptions 1.2–1.3, equation (7), Lemma 1.5, Theorem 1.6 and Corollary 1.7, pp.505–507.)

Given the full pairing, an ample line bundle `η`, and `p≥0` with `2p≤d+1`, let `L` mean intersection with `c₁(η)`, `m=d+1-2p` and
`P^p_ℚ=ker(L^{m+1}:V^p→V^{d+2-p})`.
Define the rational primitive height conjecture by
`(-1)^p h_raw(x,L^m x)>0` for every nonzero `x∈P^p_ℚ`.
The adjacent height Lefschetz conjecture is that `L^m:V^p→V^{d+1-p}` is an isomorphism; it is a separate predicate. These are Künnemann's explicit formulation of Beilinson's conjectures, rather than an identification based only on the arithmetic-theta application. At `d=2r-1`, `p=r`, one has `m=0` and exactly `P^r_ℚ=ker(L:V^r→V^{r+1})`. For a supplied `ℚ`-bilinear real-valued pairing on a rational subspace `P`, signed positivity requires `(-1)^p h(x,x)>0` for every nonzero `x∈P`; here use `h(x,y)=h_raw(x,L^m y)`. Give the zero-self-height criterion on `P`, rational scaling by `a²`, and transport by a rational linear isometry carrying `P` onto the new domain. (Künnemann 1996, Conjecture 5.2(i)–(ii), p.787; for the primitive convention in an application, Zhang, §5.3, pp.82–83 of arXiv:0812.0371v1.)

Define the absolute normalization by `h_abs=h_raw/[E:ℚ]`; it is unchanged by number-field extension and has the same positivity sign. On a curve `C/E`, with Abel–Jacobi `AJ` and canonical principal polarization `λ_C`, pin the convention by
`h_abs(D,D')=-NT_Jac(C)(AJ(D),λ_C AJ(D'))`.
Here `NT` is the canonical pairing between the Jacobian and its dual, with the polarization used exactly as displayed; no additional quadratic-height polarization factor is implicit. (Künnemann 1996, Theorem 6.1, p.788.)

Keep complex positivity distinct. Scalar extension of the symmetric real-valued rational pairing defines a Hermitian form, linear in the first variable, by `h_ℂ(x⊗a,y⊗b)=a b̄ h(x,y)` on the complexified domain. Flatness identifies complexification of the rational primitive kernel with the kernel of the complexified `L^{m+1}`. Define the complex positivity predicate by `(-1)^p h_ℂ(z,z)>0` for nonzero primitive `z`, with a real diagonal value understood. Its API is the zero-height criterion, scaling by `|a|²`, restriction to rational cycles and transport by complex linear isometries. Rational strict positivity alone does not imply this stronger predicate: on `ℚ²`, the symmetric form `b(x,y)=ℓ(x)ℓ(y)`, `ℓ(u,v)=u-√2 v`, is strictly positive on every nonzero rational diagonal but its real and complex extensions vanish on `(√2,1)`. Strict complex positivity needs its own hypothesis, or positivity and absence of a radical after real scalar extension. This distinction concerns the coefficient extension of an actual pairing and does not construct heights on additional cycles.

Under the projective unitary hypotheses of §7.19 (`F≠ℚ`), retain Li–Liu's separate domain and normalization for the arithmetic-theta application. `CH^r(X_L)^{⟨ℓ⟩}` consists of classes admitting representatives whose cycle classes vanish in `H^{2r}(X_L⊗E E_u,ℚ_ℓ(r))` at every finite `u∤ℓ`; geometric homological triviality alone is weaker. For an allowed prime and good reduction at `u|ℓ`, their pairing initially takes values in `ℂ⊗ℚ ℚ_ℓ`. Equation (6.1) sums twice each archimedean local index and `log(q_u)` times each finite local index. Under Hypothesis 6.6, Proposition 6.10(3) puts their theta classes in that domain, and Definition 6.11 sets `h^♮=vol^♮(L) h^ℓ_{X_L,E}`. The volume is positive, and the projection formula makes this value independent of level; its complex value and prime independence in the computed case are conclusions of their height formula. Do not identify this normalization with `h_abs` without a comparison of the constructions. Their primitivity statement also requires injectivity of the étale Abel–Jacobi map; Remark 1.10 predicts the weak inequality `(-1)^r h^♮(z,z)≥0`. (Li–Liu, Notation 2.5(C3), p.14; §6, equation (6.1), pp.28–29; Proposition 6.10 and Definition 6.11 with footnote 10, p.32; Remark 1.10, p.8.)

**Checks.**

- The zero vector has height zero and is excluded from the strict inequality.
- On the zero module, or on the zero primitive subspace, both positivity predicates hold vacuously and the zero-height criterion still holds. Bilinearity gives the rational scalar-square formula. For `n=0,1,2`, rational multiplication changes self-height by `0,1,4`; complex multiplication by `i` changes it by one.
- At `r=1`, the pairing `h(x,y)=-xy` on the rational vector space underlying `ℝ`, with full domain, satisfies signed rational positivity; `h(x,y)=xy` fails at `x=1`. For curves the absolute raw height is the negative polarized Néron–Tate pairing just displayed.
- Scaling by a nonzero complex scalar preserves strict signed positivity, with factor `|a|²>0`.
- No value or positivity is concluded for a vector outside the specified primitive height domain.
- At `d=3,p=2`, the primitive kernel is `ker L`, not all homologically trivial codimension-two cycles by definition. At `d=1,p=1`, the target `CH²` is zero, so every homologically trivial divisor is primitive.
- At `d=2,p=1`, the primitive condition is `L²x=0` and the paired class is `Lx`. Replacing the condition by `Lx=0` changes the conjecture. At `p=0`, `V⁰=0`, so positivity is vacuous and the height Lefschetz map is the isomorphism between zero spaces.
- The irrational-kernel example has strict rational positivity and a nonzero zero-height complex vector. It prevents using the rational conjecture to assert strict positivity for arbitrary complex theta classes.
- Changing an orthogonal lift by a vertical class changes no height; an arbitrary lift without the orthogonality condition has no such guarantee. A finite extension of degree two doubles `h_raw` and leaves `h_abs` unchanged.
- Degree-one extension does nothing; in a tower of degrees two and three the raw multiplier is six, which cancels the same factor in the absolute normalization. A genus-zero curve has zero homologically trivial divisor group, so the polarized Jacobian identity is the zero pairing.
- Li–Liu's factor `vol^♮(L)>0` preserves the parity sign, while the factor two on archimedean local indices remains in equation (6.1). Values in `ℂ⊗ℚ ℚ_ℓ` are not ordered before the stated complex-value comparison.

### 7.18 The unitary specialization of the rank conjecture

Let `E/F` be CM, `n=2r>0`, and `V/E` have signature `(n-1,1)` at one real place and `(n,0)` at all others. Put `H=U(V)` and use the smooth projective Shimura tower `X_L/E` at neat levels. In the general `F=ℚ` formulation use the canonical smooth toroidal compactification specified by the source. For tempered cuspidal `π` of `U(r,r)(𝔸_F)` and irreducible admissible `π̃^∞` of `H(𝔸_F^∞)`, nearly equivalent at the identified good places and occurring in `colim H^{n-1}_dR(X_L/ℂ)`, formulate
`dim_ℂ Hom_H(π̃^∞,colim CH^r(X_L)^0_ℂ)=ord_{s=1/2}L(s,Π_j(π̃^∞))`.
Here `Π_j` is the particular cuspidal factor of the base change selected by cohomological occurrence, not automatically the entire base change. Prove the translation from the equivariant predicate and its shift of center, assuming the automorphic and Galois comparison data. (Li–Liu, Conjecture 1.1 and footnote 2, pp.3–4.)

**Checks.**

- For `n=2`, the Shimura variety has dimension one, matching middle divisors.
- If base change has more than one cuspidal factor, the selected `Π_j` cannot be replaced by their product without changing the analytic order.
- Nearly equivalent finite representations still require the stated cohomological occurrence to select the factor.
- The nonzero derivative result below gives a nonzero Hom space, not the asserted dimension equality.

### 7.19 Li–Liu: exact hypotheses, localization and the height formula

For the two theorem targets in this subsection impose the following specific contract. The CM extension is unramified at all finite places, all two-adic places split, and hence `[F:ℚ]` is even; `n=2r`. The cuspidal `π` has at infinity holomorphic discrete series with Harish–Chandra parameters `{(1-n)/2,(3-n)/2,…,(n-1)/2}`. At split finite places it is principal series; at inert finite places it is unramified or almost unramified for the specified `K_r`, the latter places unramified over `ℚ`. All finite components are tempered. Let `R_π` be the ramified split places and `S_π` the almost-unramified inert places; assume `|S_π|` odd. The resulting totally positive incoherent space determines the coherent `V` of §7.18 with these finite local spaces. (Li–Liu, Assumption 1.3, pp.4–5.)

Hypothesis 6.6 must be supplied for every rational prime and coefficient identification `ℚ̄_ℓ≃ℂ`: for every relevant `π̃^∞` with the stated good-place base change and case (b) of Lemma 3.15, the semisimplified `G_E`-module
`Hom_H(π̃^∞,colim H^{2r-1}_ét(X_L⊗Ebar,ℚ̄_ℓ))`
is `ρ^c_{Π_j(π̃^∞)}`. Hypothesis 4.5, when separately used, quantifies over every open compact level (neat levels are cofinal), every invariant Schwartz function `φ` and every complex linear functional `λ` on `CH^r(X_L)_ℂ`: the scalar theta series `λ(Z_φ(g)_L)` converges absolutely and is an automorphic form in `A^[r]`. A formal modularity identity is weaker. The almost-self-dual local intersection identity below is an additional premise for both targets. (Li–Liu, Hypotheses 4.5 and 6.6, pp.24,30.)

Specify that local premise as follows. At an inert place write the local quadratic extension as `F_v′/F_v`, with odd residue characteristic and residue cardinality `q` for `F_v`. In the notation of Li–Zhang, §§9–10, for a full-rank lattice `L` in their split hermitian space `W_n`, require
`Int′(L)=(∂Den_Λ(L)-Den(L))/(q+1)`.
Here `Int′` is the Euler characteristic of the derived intersection of the `n` special divisors on the almost-principally-polarized Rapoport–Zink space, defined in Definition 10.1.1, p.64; the two density terms retain the normalizations of §9. The subtraction and denominator cannot be omitted. The Whittaker translation is Remark 10.5.4, p.72; this is the input to Li–Liu, Proposition 9.1, equation (9.3) and its proof, pp.44–45, before the global argument in §11. Li–Zhang, Theorem 10.5.1, p.70 of arXiv v3, proves it conditional on Conjecture 10.4.1, p.67, concerning the finite-flat degree-`q+1` map and the blow-up model. A subsequent geometric proof route is Li–Rapoport–Zhang, arXiv:2404.02214v2, Theorem 14.6.2, pp.60–61, and §16, pp.65–71. Its Corollary 16.1.5, p.69, identifies the exceptional divisor with the **reduced** inverse image of the closed balloon locus. Prove the comparison of these local models, the corrected divisor multiplicities, and the density/Whittaker normalizations before replacing the explicit local premise by this route. The unreduced equality printed in the older conjecture is not an available theorem. Neither global target below is asserted without the local premise.

Assume the contract including Hypothesis 6.6 and `L'(1/2,π)≠0`. For a finite set of finite places `R` containing `R_π` and with **at least two split places**, choose the source's special maximal level away from `R`, Hecke character and maximal ideal `m_π^R`. Prove
`colim_{L_R}(CH^r(X_{L_R L^R})^0_ℚac)_{m_π^R}≠0`,
already witnessed by the specified special cycles. This is localization, not an eigenspace statement, and needs no Hypothesis 4.5. The cardinality condition is `|R∩V_F^spl|≥2`. (Li–Liu, Theorem 1.5, pp.5–6, Remark 1.6, Lemma 11.1 and proof of Theorem 1.5, pp.49,52.)

Add Hypothesis 4.5. For pure tensor cusp vectors `ϕ₁,ϕ₂` of lowest weight at infinity with `⟨ϕ₁,v^c,ϕ₂,v⟩=1` there, and finite pure tensor Schwartz functions, prove the arithmetic inner-product formula
`⟨Θ_{φ₁}(ϕ₁),Θ_{φ₂}(ϕ₂)⟩^natural = L'(1/2,π)/b_{2r}(0) · C_r^[F:ℚ] · ∏_{v finite} Z_v^natural(ϕ₁,v^c,ϕ₂,v,φ₁,v⊗φ₂,v^c)`,
where
`C_r=(-1)^r 2^{-2r}π^{r²}(∏_{j=1}^rΓ(j))/(∏_{j=r+1}^{2r}Γ(j))`.
The Gross-motive factor `b_{2r}(0)` is positive and almost all normalized local factors equal one. The normalized height initially lies in `ℂ⊗ℚ_ℓ` on its specified domain; the formula places it in `ℂ` independently of the prime. Nonzero derivative implies a nonzero `Hom_H` for the finite theta lift of `π^∞`; it gives no dimension-one conclusion. The suppliers must construct the Shimura tower, theta cycles, all-level modularity, normalized local zeta integrals and height pairing before this formula is applied. (Li–Liu, Theorem 1.7 and footnote 4, pp.6–7, proof in §11, pp.52–53.)

**Checks.**

- At `r=1`, `C₁=-π/4`; the parity `[F:ℚ]` even makes `C₁^[F:ℚ]` positive. Gamma factors at positive integers and the positive Gross factor have no zero denominators.
- Exactly two split places in `R` satisfy the cardinality condition; replacing intersection by set difference would test the wrong places.
- Localization can be nonzero with no one-dimensional eigenspace conclusion. No refined rank conjecture is deduced solely from nonvanishing.
- Hypothesis 4.5 is needed for the height formula and is not inserted into the localized nonvanishing theorem.
- The all-prime semisimplified Galois identification is distinct from semisimplicity of the full cohomology representation.
- At odd residue characteristic `q≥3`, the local denominator `q+1` is nonzero. The local formula has both a derivative-density term and a subtraction term; the self-dual formula cannot replace it. Reduced and scheme-theoretic inverse images need not have the same divisor multiplicities.

### Examples

The point, projective spaces, pointed curves and the two rulings on `ℙ¹×ℙ¹` separate each rational standard predicate from a tempting stronger or weaker one. Real-point and empty-real curves separate genus, topological and Hodge tests. The norm coefficient at `n=3`, the quaternionic weight-four quadratic space, and the two-split-place condition are explicit calculations fixing normalization errors which an elaboration check alone cannot detect. The arithmetic application remains conditional on its exact local and global inputs.

### Dependencies

Layers 0–2 provide Chow operations and geometric realizations; Layers 3–6 provide the motive categories and reconstruction used by the conditional consequences. Hard Lefschetz and pure Hodge comparison are geometric cohomology inputs. The real applications require the full semialgebraic/equivariant and Gersten contracts, the diagonal-support bounds of Layer 0, Picard descent, and the specifically marked primary geometric constructions. Arithmetic applications require their general Shimura, automorphic, local-theta, Galois and height suppliers with the exact hypotheses of §7.19. No conjecture in this layer is used to construct the unconditional pure or Nori categories.

## Downstream consumers

StandardConjectures §§2.1–2.5 uses the shared core from §§0.1–0.2, 0.5, 2.2–2.4 and 7.3–7.4. Its geometric Weil structure is the minimal theory together with separately stated weak/hard Lefschetz data; the forgetful comparison preserves degree, trace, Tate marking and cycle maps. Its correspondence action uses the same componentwise degrees and transpose, its homological/numerical comparison uses the same kernels, and its geometric standard predicates use rational cycle representatives. Its Lefschetz linear algebra specializes these interfaces with an ample class. The shared implications and curve results are supplied here, with their Lefschetz hypotheses carried where used.

Sections 6.1–6.4 supply generic neutral recognition, finite-type and characteristic-zero connectedness recognition, finite-piece relative reconstruction, coalgebra assembly, bialgebra reconstruction and the rigidity antipode to **PadicDifferentialEquationsAndRigidCohomology** RD.6.64 and **GeometricSatakeAndFusion** GS4. Their geometric categories and verification of the recognition hypotheses are applications. Use the retained RD6 neutral-recognition signature and GS4 named reconstruction contracts as application adapters to these general results, with the general proofs owned by §§6.1–6.4.

For RD.6.64 and GS4's neutral recognition, identify the reconstructed category with Tau Ceti's finite right comodules over the coefficient Hopf algebra and preserve the specified fiber by a monoidal natural isomorphism. This identifies their tensor-automorphism functors on every coefficient algebra, compatibly with scalar extension. For GS4's relative finite-piece, coalgebra, bialgebra and antipode contracts, use §6.4 with its enriched representers, forward dual transition maps and explicit preservation/reflection of split-image coequalizers. The Satake category, sign correction, bounded representers and geometric verification remain GS4's targets. Sources: Deligne–Milne, Theorem 2.11, Proposition 2.20 and Corollary 2.22, pp.20–25; Fargues–Scholze, Proposition VI.10.2, pp.232–234.

Section 6.8 supplies the general tensor-isomorphism torsor theorem, its commuting right precomposition and left postcomposition actions, scalar extension and descent to **AnabelianGeometryAndNonabelianChabauty** §2.1 and **PadicHodgeTheory** §5.5. Their retained NeutralTensor.tensorIsomTorsor, NeutralTensor.tensorIsomTorsor_repEquiv, tensorIsomTorsor and action-comparison names specialize this supplier. On every value algebra their comparison sends a tensor isomorphism to itself, preserves `p·g=p∘g`, `h·p=h∘p` and `g·p=p∘g⁻¹`, and commutes with base change and tensor isomorphisms of the marked fibers. The finite-type specialization preserves finite presentation and the common fppf torsor class. Neutral recognition for the anabelian consumer also comes from §§6.1–6.3. The unipotent specialization and Galois-class constructions belong to those consumers. The theorem here allows arbitrary field characteristic and needs no tensor generator; the consumers' characteristic-zero and finite-type cases retain their own geometric hypotheses.

**MotivicEtaleKTheory** imports this roadmap's `SmCor`, transfer presheaves/sheaves, Suslin/Tate complexes, bounded-above effective localization and its unbounded compact comparison, perfect-field cancellation, resolution-dependent exact cdh pullback with the complex comparison, and motive-category comparisons. The shared Bloch complexes and their localization/homotopy/transfer API come from KTheoryFiniteLocalFields §3.0a's `motivicCycles`, as consumed in §§4.7–4.8. Its downstream motivic/étale and K-theoretic comparisons use these same carriers and maps.

PeriodsAndSpecialValues uses the formal period presentation, its marked evaluation and the two motivic group actions. Mixed-Tate and motivic Galois applications use the full Tate localization, not only effective diagram categories. Arithmetic cycle applications consume compatible Hodge/Tate classes and the precise Beilinson–Bloch and height predicates; a Hecke-localized nonvanishing theorem is not promoted to a rank formula. Integral and real arithmetic geometry uses admissible cycle targets, genus detectors and unramified defects. Any proposed realization on numerical motives must first supply D in its stated coefficient scope.

## References

Locators above use printed pages unless a version or PDF page is stated. The following primary sources fix the constructions and normalizations; references to a known-case survey retain the primary-proof obligations explicitly identified in the text.

- [Stacks Project, Weil Cohomology](https://stacks.math.columbia.edu/download/weil.pdf), especially §§3–10 and the cited tags; the tag is the stable locator when pagination changes.
- J. S. Milne, [Motives](https://www.jmilne.org/math/xnotes/MOT.pdf), pure-motive and Weil-realization sections.
- J. Achter, S. Casalaina-Martin and C. Vial, [Parameter spaces for algebraic equivalence](https://www.math.colostate.edu/~achter/math/abtriv0717.pdf), §§2 and Appendix A.
- J. Achter, S. Casalaina-Martin and C. Vial, [Decomposition of the diagonal, intermediate Jacobians, and universal codimension-2 cycles in positive characteristic](https://smf.emath.fr/system/files/filepdf/smf_ast_455.pdf), the version with Lemma 3.1 used for alterations and diagonal support.
- M. Temkin, [Tame distillation and desingularization by p-alterations](https://math.huji.ac.il/~temkin/papers/Tame_Distillation.pdf), Ann. Math. 186 (2017), pp.97–126, Theorem 4.3.1.
- J.-L. Colliot-Thélène and C. Voisin, [Cohomologie non ramifiée et conjecture de Hodge entière](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf), 2011 preprint, especially §§2–3 and Appendix.
- J. Kollár, [Esnault–Levine–Wittenberg indices](https://arxiv.org/pdf/1312.3923v2), §2, Proposition 14, p.4.
- S. Bloch and A. Ogus, [Gersten’s conjecture and the homology of schemes](https://www.numdam.org/article/ASENS_1974_4_7_2_181_0.pdf), Theorem 4.2, p.190, and §§4–7 for the Gersten proof under the duality-with-supports axioms.
- S. Bloch, [Torsion algebraic cycles and a theorem of Roitman](https://www.numdam.org/item/CM_1979__39_1_107_0.pdf), §§1–3, pp.108–118, for the prime-to-characteristic torsion cycle map over an algebraically closed field; the equivariant real adapter remains a separate target.
- A. Roitman, [Rational equivalence of zero-cycles](https://www.mathnet.ru/php/getFT.phtml?jrnid=sm&option_lang=eng&paperid=3248&what=fullteng), §5, Theorem 6(a) and Lemma 17, pp.587–588, for the line-contact proof used in §0.7.
- N. Karpenko, [Algebro-geometric invariants of quadratic forms](https://sites.ualberta.ca/~karpenko/publ/agiqf.pdf), the quadric-degree and middle-cycle results cited in §0.8.
- U. Jannsen, [Motives, numerical equivalence, and semi-simplicity](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf), Invent. Math. 107 (1992), pp.447–452.
- U. Jannsen, [Motivic sheaves and filtrations on Chow groups](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf), in *Motives* (1994), pp.245–302; in particular Conjectures 2.1 and 5.1 and Theorem 5.2.
- S. Kleiman, *The standard conjectures*, in *Motives* (1994), pp.3–20.
- A. J. Scholl, [Classical motives](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/classical_motives.pdf), §§1–2.
- A. Grothendieck, [La théorie des classes de Chern](https://www.numdam.org/article/BSMF_1958__86__137_0.pdf), Bull. SMF 86 (1958), pp.137–154.
- A. Grothendieck, [On the de Rham cohomology of algebraic varieties](https://www.numdam.org/item/PMIHES_1966__29__95_0/), Publ. Math. IHÉS 29 (1966), pp.95–103.
- P. Deligne, [Théorie de Hodge II](https://www.numdam.org/item/PMIHES_1971__40__5_0/), Publ. Math. IHÉS 40 (1971), especially §2.
- P. Deligne, [Hodge cycles on abelian varieties](https://www.jmilne.org/math/Documents/Deligne82.pdf), §§1–2, comparison and absolute-Hodge conventions.
- P. Deligne, [The Hodge conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), §§1–3, Hodge-class and cycle conventions.
- J.-P. Demailly, [Complex analytic and differential geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), chapter III, integration currents.
- J. S. Milne, [Lectures on étale cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), cycle classes, traces and comparison.
- [SGA 4, tome 3](https://www.numdam.org/volume/SGA_1973__3_/), Exposé XVI, comparison and base change.
- V. Voevodsky, [Triangulated categories of motives over a field](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), §§2–4.
- A. Suslin and V. Voevodsky, [Relative cycles and Chow sheaves](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf), §§3–4.
- A. Suslin and V. Voevodsky, [Bloch–Kato conjecture and motivic cohomology with finite coefficients](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf), §5, Proposition 5.11, Corollary 5.12.3 and Theorems 5.13–5.14, author preprint pp.39–43, for exact cdh pullback and the derived comparison.
- E. Friedlander and V. Voevodsky, [Bivariant cycle cohomology](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), §§3–8.
- E. Friedlander and H. Lawson, [Moving algebraic cycles of bounded degree](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/14.pdf), the moving statements used for equidimensional cycles.
- C. Mazza, V. Voevodsky and C. Weibel, [Lecture notes on motivic cohomology](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/Lecture_notes_on_motivic_cohology_published.pdf), Lectures 1–4, 7–8, 11–17 and 19–24.
- V. Voevodsky, [Cancellation theorem](https://arxiv.org/pdf/math/0202012v1), §§3–4, pp.5–15: all-field correspondence homotopies and perfect-field derived cancellation.
- D.-C. Cisinski and F. Déglise, [Triangulated categories of mixed motives](https://cisinski.app.uni-regensburg.de/DM.pdf), 2019, §5.2, pp.199–200, Remark 10.3.18, pp.296–297, and §11.1, pp.304–307, for the unbounded effective category and compact objects.
- M. Levine, [Techniques of localization in the theory of algebraic cycles](https://web.archive.org/web/20150326202512/https://www.uni-due.de/~bm0032/publ/TechLoc.pdf), J. Algebraic Geom. 10 (2001), pp.299–363; locators here are to the author preprint, Theorems 1.7, 1.10 and 6.12, Proposition 6.14 and §7, pp.2–5,37–44.
- E. Bittner, [The universal Euler characteristic for varieties of characteristic zero](https://arxiv.org/pdf/math/0111062v1), Theorem 3.1.
- A. Huber and S. Müller-Stach, [On the relation between Nori motives and Kontsevich periods](https://arxiv.org/pdf/1105.0865v5), §§2–3 and Appendices A–B.
- A. Huber and S. Müller-Stach, [Periods and Nori motives](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), 2017 version, with the [2025 corrected edition and errata](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf) for the corrected finite-descent arguments. Edition-specific locators are marked in the text.
- F. von Wangenheim, [Nori-Motive und Tannaka-Theorie](https://arxiv.org/pdf/1111.5146v1), §§2–3, diagram coalgebras and their universal category.
- A. Harrer, [Comparison of the categories of motives defined by Voevodsky and Nori](https://arxiv.org/pdf/1609.05516), especially §§3–7.
- L. Barbieri-Viale, A. Huber and M. Prest, [Tensor structure for Nori motives](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/huber-TT1.pdf), the universal diagram-category construction.
- P. Deligne and J. S. Milne, [Tannakian categories](https://www.jmilne.org/math/xnotes/tc.pdf), corrected 2012 text, §§2–3.
- L. Fargues and P. Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), Proposition VI.10.2, pp.232–234.
- B. Totaro, [Recent progress on the Tate conjecture](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf), §§1–5; a statement register, with primary-proof tasks as in §7.2.
- B. Totaro, [On the integral Hodge and Tate conjectures over a number field](https://www.math.ucla.edu/~totaro/papers/public_html/integral.pdf), the valuation/specialization argument of Theorem 2.1.
- O. Benoist and O. Wittenberg, [On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Invent. Math. 222 (2020), pp.1–77, and [II](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf), Journal de l’École polytechnique — Mathématiques 7 (2020), pp.373–429.
- O. Benoist, [The period-index problem for real surfaces](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf), the divisor/Kummer arguments cited in §7.8.
- A. Beilinson, [Remarks on Grothendieck's standard conjectures](https://arxiv.org/pdf/1006.1116v2), §§1.1–1.5.
- A. Ichino and K. Prasanna, [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2), compatible realizations, §2.1 and Definition 12.1, p.82.
- C. Li and W. Zhang, [Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/pdf/1908.01701v3), Definition 10.1.1, Conjecture 10.4.1, Theorem 10.5.1 and Remark 10.5.4, pp.64,67,70–72.
- C. Li, M. Rapoport and W. Zhang, [Quasi-canonical AFL and arithmetic transfer conjectures at parahoric levels](https://arxiv.org/pdf/2404.02214v2), Theorem 14.6.2 and §16, pp.60–61,65–71; the version fixes the local geometric model used in §7.19.
- C. Li and Y. Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Assumption 1.3, Theorems 1.5 and 1.7, Hypotheses 4.5 and 6.6 and §11.
- K. Künnemann, [Higher Picard varieties and the height pairing](https://doi.org/10.1353/ajm.1996.0033), Amer. J. Math. 118 (1996), pp.781–797; §5, equations (15)–(17), Conjecture 5.2, pp.786–787, and Theorem 6.1, p.788. These give the rational primitive-height formulation and curve normalization used in §7.17.
- K. Künnemann, [Height pairings for algebraic cycles on abelian varieties](https://www.numdam.org/article/ASENS_2001_4_34_4_503_0.pdf), Ann. Sci. ENS 34 (2001), pp.503–523; §1, Assumptions 1.2–1.3, Lemma 1.5, Theorem 1.6 and Corollary 1.7, pp.505–507, for construction hypotheses, field descent and the abelian case.
- S.-W. Zhang, [Gross–Schoen cycles and dualising sheaves](https://arxiv.org/pdf/0812.0371v1), §5.3, pp.82–83 of this preprint, for the primitive-height convention in the abelian-variety application; §2.1, pp.19–20, for orthogonal arithmetic lifts.
