# Roadmap: sheaf-theoretic Smith theory, parity sheaves and Satake base change

**Summary.** Build Smith restriction for admissible prime-order actions on étale sheaves, its sheaf Tate quotient, relative localization and bounded six-operation comparisons, and its integral parity lifting. For H connected reductive, G=Hᵖ with cyclic rotation, and odd p good for the dual root system, construct a k-linear base change functor BC on normalized parity sheaves and prove the natural comparison Sat_H ∘ BC ≅ Res_Δ ∘ Sat_G, where Δ:Ĥ→Ĥᵖ. The construction passes through the convolution norm, integral Smith restriction and normalized lifting, then cancels coefficient Frobenius on the source. A parallel algebraic output is the Tate diagonal and unique extension of transfer-annihilating characters. The sheaf theory, modular Satake extension and representation interfaces form general libraries; goodness enters the parity-perversity theorem, rather than the underlying Smith or algebra theories.

## Scope and ownership

This roadmap owns the sheaf Tate quotient and its Smith comparisons (Layers 0–2), the k and W(k) extension of equal-characteristic Satake over arbitrary separably closed geometric fields (Layer 3), the étale parity and integral Tate lifting theory (Layer 4), and the cyclic norm, natural Satake comparison, arithmetic descent and algebra diagonal (Layers 5–8). The natural integral comparison on the norm image is a separate theorem from the objectwise integral comparison. Each is proved on its stated morphism domain.

The following objects are supplied elsewhere and are not constructed again here.

- Mathlib's `DerivedCategory`, `MonoidAlgebra`, `WittVector`, `frobeniusEquiv`, finite local flat-module freeness and character independence are already in the library. Mathlib's `tateCohomology` and Tau Ceti's degree-zero norm quotient and cyclic periodicity supply the module theory; the variants here are sheaf localizations and their functor comparisons.
- SchemeAndStackFoundations §§1.17, 1.21 and 1.23 owns quotient predicates, projective finite-group quotients and quotient stacks; its admissible-action gluing extension is an exact supplier contract below. ModularCurves Layer 0C owns free finite constant-group actions with an invariant affine cover and their torsor quotients. Layer 0 uses these for cyclic geometric actions. EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4, E3.4 and E5:abstract owns the enhancement, replacements, tensor–Hom, coherent mates and stable quotient infrastructure. EtaleCohomologyFoundations F.1 owns constructible coefficient categories and the common-interval geometric-stalk Tor criterion. Layer 0 specializes them to cyclic group-ring coefficients.
- DeformationAndDerivedPatchingAlgebra §7.5 states arbitrary-rank freeness for flat modules over a local ring with nilpotent maximal ideal. Layer 0 retains its application to cyclic group rings and its distinction from cohomology-wise flatness.
- GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3 owns equal-characteristic modification/fusion geometry; §§1.8–1.9 and 1.14 states the finite-extension integral and torsion Satake equivalence. GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison*, owns the ordinary local reduced Schubert models before perfection. Layer 3 extends the coefficient and geometric-field range of these results and proves the additional compatibility with parity, Smith and normalized constant terms; it does not repeat the finite-extension theorem.
- ReductiveGroups Layers 1, 4, 9 and 10A–10B and ReductiveGroupsPartII §§RG2.0a, RG2.5.1–RG2.5.2 owns rational algebraic representations, torus weights, pinned integral dual groups, products and Galois actions. ReductiveGroups §10B owns the Weyl/induced modules and their base change; LanglandsParameterStacks §LP3.0 supplies the good-filtration theory and tensor theorem. Layer 3 owns the finite-dimensional tilting subcategory, tilting character determination and bounded derived generation, using those inputs.
- Spectral Tate diagonals in AInfCohomology §AI.7.2 concern spectra and their coherent multiplicative structure. Layer 8 concerns the ordinary invariant ring modulo the additive transfer for a specified algebra automorphism. The categorical diagonal of Layer 5 concerns maps in the concrete parity category. Neither variant constructs the spectral theory.

The modular exotic/Soergel comparison used to prove parity perversity belongs to §4.5 below: the characteristic-zero Springer correspondence does not supply it. Generic quotients, higher categories, algebraic-group carriers and finite-extension adic theory retain their named owners.

## Conventions

Fix a prime p and a separably closed geometric field F of characteristic different from p. Write k=F̄_p, O=W(k), C_p=⟨σ⟩ with a specified generator, A_Λ=Λ[C_p], and N=1+σ+⋯+σᵖ⁻¹. Schemes are separated and locally of finite type over F. Geometric equivariance means sheaves on [Y/C_p]; only a trivial geometric action identifies these with A_Λ-sheaves. Arithmetic semilinear actions are separately specified. Unless a theorem states otherwise, Λ is k or O; O/pᵐ occurs at finite adic levels with m≥1. The algebraic Layer 8 permits every prime, including 2, and every commutative ring, including the zero ring; it imposes no characteristic hypothesis on the source ring, because p·b=Tr(b) for every fixed b, so the transfer quotient is automatically an F_p-algebra. The sheaf Smith construction also precedes the odd-prime hypothesis. Oddness and goodness are imposed for the normalized cyclic Satake comparison.

A good prime does not divide a coefficient of a highest root in any irreducible factor of the root system. Type A excludes none; B, C and D exclude 2; G₂, F₄, E₆ and E₇ exclude 2 and 3; E₈ excludes 2, 3 and 5. This condition agrees for dual root systems. No such restriction is imposed on the general modular Satake or tilting tensor theorems (Feng24 §4.6.1, p.24, Feng24 line 1039; MR18 Corollary 1.6, p.6, MR18 line 273).

All tensor products, internal Hom, limits and sheaf operations are derived. Cohomological shift satisfies Hʲ(K[n])=Hʲ⁺ⁿ(K). Use the cyclic differential σ−1 in the pinned module convention: in even degree the incoming differential is N and the outgoing one is σ−1; in odd degree their roles reverse. The source convention 1−σ is compared by multiplying the relevant complex terms by −1. Fix the resulting class Λ→Λ[2] and use its powers for every periodic shift comparison. T* denotes quotient projection, while Tʲ denotes a cohomology sheaf. On a trivial O-free module M, T²ⁱ(M)=M/pM and T²ⁱ⁺¹(M)=0; over k both parities equal M. For p=3 and u=σ−1, N=u² in k[C₃], and 1−σ=−u. On O the two differentials on a trivial module are p and 0 (Feng24 §§3.4.1–3.4.2, pp.17–18, Feng24 line 759).

Every globally bounded assertion includes one common cohomological and Tor interval on the bounded-dimensional piece in use. The ind category is the filtered-colimit enlargement of constructible coefficients with a common degree interval. Ind-schemes use compatible invariant closed finite-dimensional pieces, and any assertion beyond a piece states its common bounds. Integral O-sheaves are normalized compatible adic systems with a common finite support stratification, degree/Tor bounds and the limit comparisons in the supplier contract; they are not discrete torsion sheaves. In every F₉ Check take p=3 and choose α with α²=−1; then α³=−α and inverse Frobenius also sends α to −α. To distinguish their directions, take β∈F₂₇⊂k with β³−β−1=0; Fr(β)=β+1 and Fr⁻¹(β)=β⁹=β−1. Fix small geometric sites and coefficient objects in a universe u; functor categories and Ind-enlargements lie in a larger universe. Supports and indexing diagrams are small in those universes.

A finite smooth connected stratification has a frontier condition and a pariversity † with values in ℤ/2. In positive geometric characteristic the Grassmannian category uses constant local systems on each stratum, equivalently the local systems equivariant under its connected stabilizers. General parity theory allows a stated class of local systems satisfying the JMW condition. Normalized generators restrict to L[dim Y_λ] on their dense stratum; arbitrary ordinary shifts are not adjoined. Parenthesized group subscripts mean orbit constructibility after forgetting actual equivariance. Ordinary parity maps, coefficient C_p-equivariant maps, and norm-generated equivariant maps have different domains (JMW14 §2.1 and Definitions 2.3–2.4, pp.4–5, JMW14 line 199; Feng24 §4.1, pp.19–20, Feng24 line 849).

For Satake, choose compatible Borels, maximal tori and pinnings. G=Hᵖ, σ sends factor i to i+1, and Ĝ=Ĥᵖ. Sat is directed from sheaves to rational representations of the dual algebraic group. For the positive-Borel semi-infinite orbit S_ν, normalized CT at ν is RΓ_c(S_ν,−)[⟨2ρ,ν⟩]. A chosen F_p-form determines the Frobenius self-equivalence; linearization precomposes its inverse on the source. The endpoint is a natural isomorphism of additive k-linear functors on tiltings. The construction of an additional tensor structure on BC is not part of that statement (Feng24 Definition 4.18, p.27, Feng24 line 1189; Appendix A.4, p.58, Feng24 line 2628).

## Exact supplier contracts

### From Mathlib

Use Mathlib revision f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti revision 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, with the following native declarations and boundaries.

- `DerivedCategory` in `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` is localization of complexes in an abelian category at quasi-isomorphisms. The enhanced geometric realization is supplied by EnhancedDerivedSheaves.
- `MonoidAlgebra` in `Mathlib/Algebra/MonoidAlgebra/Defs.lean`, applied to Multiplicative (ZMod p), is the group-ring carrier. `WittVector` in `Mathlib/RingTheory/WittVector/Defs.lean` is the coefficient carrier. Neither imposes geometric equivariance. For k a perfect field of characteristic p, `WittVector.isDiscreteValuationRing` in `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean`, line 148, supplies the DVR, while `WittVector.quotientPEquiv` and `WittVector.isAdicCompleteIdealSpanP` in `Mathlib/RingTheory/WittVector/Complete.lean`, lines 105 and 116, supply O/(p)≅k and p-adic completeness.
- `Module.free_of_flat_of_isLocalRing` in `Mathlib/RingTheory/LocalRing/Module.lean`, line 299, requires a commutative local ring, a module, finite generation and flatness. Its arbitrary-rank extension is the contract with DeformationAndDerivedPatchingAlgebra.
- `tateCohomology` and `tateCohomologyFunctor` in `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean`, lines 140–145, take a representation of a finite group over a commutative ring to a module in every integer degree, with the norm splice and long exact sequence. They supply the point comparison.
- `frobeniusEquiv` in `Mathlib/FieldTheory/Perfect.lean`, line 121, uses characteristic p and `PerfectRing` and sends a to aᵖ. `linearIndependent_monoidHom` in `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean`, line 502, assumes a multiplicative source and a commutative domain as target, with no algebraic-closedness assumption. It supplies character independence.
- `RingHom.eqLocus` in `Mathlib/Algebra/Ring/Subring/Basic.lean`, line 867, is the fixed-subring carrier used by `fixedSubring`. `Ideal.span` in `Mathlib/RingTheory/Ideal/Span.lean`, line 45, and `Ideal.Quotient.mk` in `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`, line 83, supply the actual transfer-generated ideal and quotient ring, including a quotient whose unit is zero.

### From Tau Ceti

`TauCeti.TateCohomology.H0IsoNormQuotient` in `TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean`, line 152, identifies degree-zero Tate cohomology with invariants modulo the image of the additive norm for finite groups over commutative rings. `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` and `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` / `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd` in `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean`, lines 302, 167 and 200, provide the all-degree module comparisons with g=σ under the hypothesis hg that every group element lies in its integer powers. For the specified generator σ of C_p, discharge hg by writing every element as σⁱ with 0≤i<p. The identities `Rep.FiniteCyclicGroup.periodicIsoOfGenerator_hom_comp_tateCohomologyIsoEven_hom` and `Rep.FiniteCyclicGroup.periodicIsoOfGenerator_hom_comp_tateCohomologyIsoOdd_hom` at lines 322 and 332 require the periodic comparison followed by the selected even/odd model comparison to equal the comparison in the source degree, with that same σ. These do not identify a sheaf Verdier quotient. The proof of the sheaf comparison must intertwine its periodic class with this module convention.

`TauCeti.AffineInvariantQuotient.isFinite_projection` and `TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType` in `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean`, lines 66 and 73, supply finite affine invariant projections under, respectively, finite type over the invariant ring or over an invariant base. Their source and target are Spec A and Spec A^Γ; they do not assert flatness or finite presentation.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections 0.1–0.4 and E1.3–E1.4 supply enhanced module sheaves on small ringed sites, functorial K-flat/K-injective replacements, tensor–Hom, coefficient extension/restriction, coherent derived limits and the homotopy-category comparison with `DerivedCategory`. Section E1.3 supplies exact filtered colimits compatible with cohomology. Section E3.4 supplies coherent diagram categories, coefficient towers, mates and Beck–Chevalley transformations. Layer E5:abstract supplies stable quotients, idempotent completion and the monoidal localization comparison, using its own generic suppliers. These are enhancement-level statements, rather than diagrams only in the homotopy category.

### From TauCetiRoadmap.EtaleCohomologyFoundations

F.1, *Bounded constructible and ctf categories*, supplies bounded constructibility, finite-Tor coefficients and detection of a specified common Tor interval on geometric stalks; §§F.2–F.3 and §0.8 supply finite-type compact supports, projection and Künneth, base change and the compact-support cohomological dimension bound 2d for fibres of dimension at most d. Sections 0.10 and F.5–F.6 supply smooth-pair fundamental classes, purity and finite-Tor Verdier duality. Use these for torsion coefficients whose annihilator is invertible on the geometric base, and retain every boundedness and constructibility hypothesis.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Sections 0.1–0.2 extend finite-coefficient biduality to self-injective coefficients and retain the finite-Tor domain for general Noetherian torsion rings. Sections 2.2 and 2.4–2.5 provide recollement and perverse functors with noetherian coefficients; §§3.1–3.2 provide normalized ramified adic systems and strict reduction for O_E finite over ℤ_p. Section 7.3, *Tame fixed subschemes*, supplies the full scheme fixed locus of a tame finite-order automorphism and the absence of fixed points on its punctured normal cone; it asserts no smoothness, which comes from the ReductiveGroupsPartII contract below. Section 5.2, Curve Euler–Poincaré with Swan conductors, supplies the Artin–Schreier negative control used in §4.4, including its finite-coefficient conductor calculation. Use purity only for a smooth fixed subscheme inside a smooth stratum, with its twist and even codimension shift.

What EtaleDualityAndPerverseSheaves must provide (gap:witt-adic-uniform-operations): Extend the normalized systems of §§3.1–3.2 to O=W(F̄_p) with common finite strata and degree/Tor intervals, coherent coefficient reduction, biduality, compact-support projection and derived-limit comparison, and a uniform ambient local bound for Rj* on the finite-dimensional schemes used here.

This is the coefficient extension beyond the finite-DVR theory; its Smith-specific quotient comparison is §1.1 here. The torsion theory with k and O/pᵐ coefficients uses the stated Noetherian-ring range.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 1.17, 1.21 and 1.23 supply categorical/geometric quotient predicates, projective finite-group quotient gluing and the quotient-stack groupoid. Section 0.23a supplies étale invariance under nilpotent thickenings and universal homeomorphisms; the schemes themselves retain their scheme structures.

What SchemeAndStackFoundations must provide (gap:admissible-invariant-quotient-gluing): For a finite constant group Γ acting by F-automorphisms on a separated locally finite type F-scheme Y whose orbits have invariant affine neighbourhoods, glue the affine invariant quotients into a separated locally finite type scheme Q with finite categorical/geometric quotient q:Y→Q, and identify its restriction over every invariant open, in particular the free locus, with that open's quotient.

The free-locus identification uses the following existing torsor contract, so it includes the finite étale conclusion without constructing torsors again.

### From TauCetiRoadmap.ModularCurves

Layer 0C, *Finite quotients and torsors*, supplies the scheme fppf quotient of a free finite constant-group action on a scheme with an invariant affine open cover, with the torsor identity Γ×U≅U×_(U/Γ)U. Since Γ is constant finite étale, the quotient projection is finite étale, locally free of rank |Γ|. Apply this to U=Y∖Y^σ for Γ=C_p using the invariant affine cover established in §0.2; the admissible gluing contract identifies this quotient with the corresponding open of Y/C_p.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Section 7.5, *Infinite rank local freeness and complete flat models*, supplies arbitrary flat-module freeness over a commutative local ring with nilpotent maximal ideal, including arbitrary lifted residue bases. No finite-rank hypothesis is inferred for stalks. Section 7.5's completion results are not needed to replace this purely algebraic statement.

### From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

Sections 1.1–1.3 supply the equal-characteristic BD/loop Grassmannian, finite Schubert supports, positive-loop and finite-jet actions, Beauville–Laszlo modification description and Hecke/fusion correspondences. Sections 1.5 and 1.8–1.9 supply convolution and the fusion sign convention; §1.14 supplies finite-extension integral/torsion Satake, its flat/free restriction and coefficient comparisons. Layer 3 extends their range to arbitrary separably closed F and k/W(k), using the same geometry and root datum.

What GlobalShtukasAndFunctionFieldLanglands must provide (gap:grassmannian-arbitrary-geometric-field): Extend the geometric constructions and finite-jet/factorization comparisons of §§1.1–1.3 from the curve setting to split connected reductive H over every separably closed field F, retaining the ordinary scheme-theoretic test-ring functor and its finite Schubert models.

### From TauCetiRoadmap.GeometricSatakeAndFusion

GS0, *Equal-characteristic Schubert models and coefficient comparison*, supplies ordinary reduced local Schubert models, positive-loop strata, closure order, Demazure resolutions and finite-jet actions before perfection. Consume them through the field/curve comparisons of the preceding contract. The perfection comparison does not replace ordinary test rings in the diagonal fixed-Grassmannian theorem.

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.ReductiveGroupsPartII

ReductiveGroups Layers 1, 4 and 9 and §§10A–10B supply rational representations as algebraic comodules, tensor/dual, torus character decomposition, pinned split integral group schemes, induced/Weyl modules and their canonical map, and the ordinary-dual versus contravariant-dual conventions. ReductiveGroupsPartII §RG2.0a, *weil-restriction-separable-splitting*, supplies separable product splitting with its Galois permutation. The same section's *Edixhoven's tame fixed-point theorem* (*tame-fixed-points-of-weil-restriction*) states that, for a discrete valuation ring R, an R-algebra R′ finite free over R with an action of a finite group Γ of order invertible in R by R-algebra automorphisms, and X smooth affine over R′ with a semilinear Γ-action, the fixed scheme of the Weil restriction of X along R→R′ is smooth over R. Apply it with R′=R=F[[t]], Γ=C_p acting trivially on F[[t]], and X the base change of a C_p-invariant affine open of a smooth F-scheme; fixed subschemes commute with base change, so the closed fibre gives smoothness over F of the fixed subscheme of a tame C_p-action on a smooth F-scheme. Sections RG2.5.1–RG2.5.2, *langlands-dual-group*, *galois-action-on-dual-group* and *dual-isogenies-and-products*, supply integral dual root data, product duality and the pinned Galois action with the common cyclotomic normalization. Rational representations in the statements below are not arbitrary representations of the discrete group of geometric points.

### From TauCetiRoadmap.LanglandsParameterStacks

Using the Weyl modules Δ(λ), induced modules ∇(λ) and their canonical map of ReductiveGroups §10B, section LP3.0, *Highest-weight modules and good filtrations*, supplies good/Weyl filtrations and the Donkin–Wang–Mathieu tensor theorem over a split connected reductive group in characteristic p. It also states that H^i(G,∇(λ)⊗∇(μ)) is the coefficient field for i=0 and μ=−w₀λ and zero otherwise; since Δ(λ)=∇(−w₀λ)* and Ext^i_G(Δ(λ),V)=H^i(G,∇(−w₀λ)⊗V) for finite-dimensional V (the identification used in its good-filtration criterion), this is the computation that Hom(Δ(λ),∇(μ)) is the coefficient field for λ=μ and zero otherwise, with all higher Δ-to-∇ Ext zero. That computation is consumed here, not requested. Only finite-dimensional representations and finite filtrations are used in Layer 3.

What LanglandsParameterStacks must provide (gap:finite-highest-weight-ideals): Provide the finite saturated highest-weight-ideal categories associated to LP3.0, namely the finite-dimensional rational modules all of whose composition factors L(μ) have μ in a finite saturated set of dominant weights, with enough tiltings (modules with both a Δ-filtration and a ∇-filtration) and finite standard-to-tilting resolutions in each, compatibly with inclusions of ideals and with field extension.

What LanglandsParameterStacks must provide (gap:integral-highest-weight-orders): For O=W(k), k=F̄_p, and a split connected reductive group over O, extend the finite saturated highest-weight-ideal categories of LP3.0 to split highest-weight O-orders whose standards and costandards are the finite free integral Weyl lattices of ReductiveGroups §10B and their duals under its perfect integral evaluation pairing, with Hom(Δ(λ),∇(μ))=O for λ=μ and zero otherwise, Extⁿ(Δ(λ),∇(μ))=0 for n>0, finite projective generators and p-adically complete finite Hom modules, compatibly with inclusions of finite ideals.

What LanglandsParameterStacks must provide (gap:integral-tilting-lifts): In the split highest-weight O-orders of gap:integral-highest-weight-orders, prove existence of tilting lifts, finite freeness and reduction base change for Hom between tiltings, lifting of idempotents in their endomorphism orders, detection of tilting on O-free objects by reduction, and a bijection on isomorphism classes of indecomposable tiltings under reduction to k, compatibly with inclusions of finite ideals, duals and external products.

The generic highest-weight inputs precede their parameter-stack applications; no theorem about parameters is a prerequisite for this roadmap.

## How to read the build

Layers 0–1 apply the supplied geometry and enhanced coefficients to cyclic flat kernels, sheaf Tate quotients and periodic cohomology. Layer 2 proves relative Smith localization. Layer 3 extends modular Satake and supplies tilting representation theory independently of cyclic base change. Layer 4 builds parity, the good-prime perversity engine and normalized lifting, including its grading on maps. Layer 5 constructs the cyclic norm and proves additivity on morphisms before descending through ordinary reduction and inverse source Frobenius. Layer 6 compares normalized constant terms, first for tori, then for the full dual group using actual root-subgroup-equivariant comparison components. Layer 7 gives exactness, continuous arithmetic descent and the separate integral norm-image comparison. Layer 8 is an algebraic endpoint using cyclic coefficients and coefficient Frobenius. The weight functors used to prove Layer 3's Satake theorem are constructed there; Layer 6 adds their Smith/base-change comparisons, so the two layers have no circular dependence. `Suggested.lean` states `algebra_tate_diagonal` and `tate_character_extension`; its docstring lists the sheaf headlines whose carriers must first be built.


## Layer 0: Actions, coefficients and finite Tor dimension


### 0.1 Coefficient and cyclic-action conventions

A coefficient datum consists of a prime p, a separably closed geometric field F with p invertible, k=an algebraic closure of F_p, O=W(k), and C_p with specified generator σ. Use Λ=k, O/p^m or O, as individually stated. Write A_Λ=Λ[C_p] and N=Σᵢ₌₀ᵖ⁻¹σ^i. Ordinary coefficient actions are Λ-linear; arithmetic semilinear actions are separately marked. Goodness means p does not divide any coefficient of a highest root in each irreducible dual root system. Type A has no excluded primes, B/C/D exclude 2, G₂/F₄/E₆/E₇ exclude 2,3, and E₈ excludes 2,3,5. (Feng24, §1.5 (Notation), p.7; §4.6.1, pp.23–24, Feng24 line 317.)

The API:

- Use the existing monoid algebra with its Λ-algebra action.

- Goodness for a product is goodness for each irreducible factor.

- (σ−1)N=N(σ−1)=0; N acts as p on trivial modules.

*Proof route.* Use the existing Witt ring and dual-root-datum carriers. Prove the good-prime predicate is invariant under duality of root systems and products. Coefficients are discrete at torsion level; O is an adic coefficient system, not a discrete torsion ring.

*Needs:* Mathlib `WittVector`; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2.

**Checks.**

- p=3 is odd and good for GL₂, but not good for G₂.

- At p=2, A_k=k[u]/u² with u=σ−1 and N=u. The Tate pairs (even, odd) of trivial k, trivial O and the regular k[C₂]-module are (k,k), (k,0) and (0,0): on O the differentials are 0 and 2, and on the regular module ker u=im u=k·u. These are coefficient data for Smith theory regardless of the odd-prime normalization boundary.

- On a trivial O-module N is multiplication by p; on a regular orbit N is the orbit sum, not zero.

- O/p identifies with k, whereas O itself has characteristic zero.

- highest-root coefficients: A₁=1, G₂=(3,2); N(1_O)=3, N(1_A)=1+σ+σ²; O/p=k, char O=0. Keep geometric and coefficient characteristics separate.


### 0.2 Admissible geometric actions

Apply the affine invariant projections and the admissible-action gluing contract to C_p-actions on separated locally finite type F-schemes. An action is admissible when each orbit lies in an invariant affine open. Use the scheme-theoretic equalizer Y^σ of σ and the identity, and the glued invariant quotient Y/C_p. Because p is prime, every geometric stabilizer is either 1 or C_p; hence U=Y∖Y^σ has a free action and U→U/C_p is a finite étale C_p-torsor. For ind-schemes use an invariant closed filtration by finite-type pieces. (Feng24, §3.2, p.14; Lemma 3.6, p.15, Feng24 line 650.)

The API:

- Maps T→Y^σ are exactly maps T→Y fixed by σ.

- An invariant map Y→Z factors uniquely through Y/C_p.

- The complement quotient is finite étale of degree p.

- For separated Y, the fixed locus Y^σ is a closed subscheme; its open complement carries a free action and is invariant.

*Proof route.* Use the supplied invariant affine quotient and scheme equalizer. Prove the prime-order stabilizer dichotomy. To cover the free complement by invariant affines, choose an invariant affine V=Spec B containing the orbit of y∈U. The closed subscheme Z=V∩Y^σ misses every point of that orbit. Finite prime avoidance gives f∈I(Z) outside all the orbit primes. The product n=∏ᵢ₌₀ᵖ⁻¹σⁱ(f) is invariant, lies in I(Z), and vanishes at none of the orbit points. Thus D(n)⊂V is an invariant affine neighbourhood of the orbit contained in U. Apply ModularCurves Layer 0C to this cover; the gluing contract identifies its quotient with the quotient open. Retain nilpotent test rings.

*Needs:* §0.1; the SchemeAndStackFoundations contract gap:admissible-invariant-quotient-gluing; SchemeAndStackFoundations §§1.17, 1.21, 1.23; ModularCurves Layer 0C; Tau Ceti `TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType`.

**Checks.**

- Cyclic rotation on X^p fixes the diagonal scheme X, including nilpotent test rings.

- For a primitive p-th root ζ∈F, the scalar action x↦ζx on A¹ has fixed locus {0}. Its free complement G_m has quotient G_m by x↦xᵖ, finite étale of rank p: F[x,x⁻¹] has basis 1,x,…,xᵖ⁻¹ over F[xᵖ,x⁻ᵖ], and p xᵖ⁻¹ is a unit. At p=3 the derivative is 3x². G_m over F is not projective, so projective quotient gluing alone cannot supply this example.

- For the scalar action, choose f=x in I({0}). Its invariant product is n=ζ^(p(p−1)/2)xᵖ: at p=3 it is x³, while at p=2 it is −x². In both cases D(n)=G_m is affine, invariant and disjoint from the fixed point. Merely intersecting an affine with U does not establish affineness; these principal opens do.

- The trivial action has Y^σ=Y and its free complement is empty.

- fixed tuples (a,a,a) over every test ring; fixed equation (ζ−1)x=0 gives x=0; U=∅ for trivial action. Use scheme equalizers and geometric stabilizers.


### 0.3 Equivariant and ind-constructible derived categories

Set D_σ(Y;Λ)=D([Y/C_p];Λ) in the imported enhanced étale sheaf theory. Its bounded constructible subcategory has bounded constructible cohomology on Y; ind-constructible means the filtered-colimit enlargement with a uniform cohomological bound on the bounded part. If the geometric action is trivial, identify this with the derived category of sheaves of A_Λ-modules. For a nontrivial action keep the quotient-stack category: a coefficient C_p-action alone is different. Extra L^+G-equivariance means equivariant derived sheaves before passage to the constructible homotopy category; parentheses around L^+G mean constructibility for its orbits after forgetting this extra equivariance. (Feng24, §1.5 (Notation), p.7; §3.2, p.15, display (3.2), Feng24 line 656; Feng24, §4.2, p.20, Feng24 line 900.)

The API:

- For trivial action identify equivariant derived sheaves with A_Λ-sheaves, compatibly with tensor and restriction.

- Forget geometric equivariance to D(Y;Λ), keeping its action-groupoid descent data available.

- A bounded ind object has a uniform cohomological interval and locally ind-constructible cohomology.

*Proof route.* Use enhanced descent on the action groupoid. Form the bounded and constructible full subcategories, then the designated ind enlargement. Keep the comparison for a trivial geometric action and the forgetful functor to orbit-constructible sheaves explicit.

*Needs:* §0.2; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; SchemeAndStackFoundations §§1.17, 1.21, 1.23; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2; EnhancedDerivedSheaves §§E1.3, E3.4.

**Checks.**

- On a point this category is derived A_Λ-modules, so nontrivial C_p-representations remain visible.

- On a free orbit equivariant sheaves descend to a point; a constant sheaf with trivial independent coefficient action does not replace the geometric regular representation after quotient pushforward.

- The direct sum of Λ[2n] over n≥0 is not bounded even though each finite subsum is bounded.

- point category D(A); q_*Λ=A with rank 3, versus Λ³ with trivial action; H^(−2n) of the sum is Λ for every n. Require geometric descent and a common bound.


### 0.4 Arbitrary flat cyclic group-ring modules

Identify k[C_p] with k[u]/(uᵖ), sending σ to 1+u, for every field k of characteristic p. Its maximal ideal is (u), its residue field is k and (u)ᵖ=0. Apply the arbitrary-rank flat/free theorem of the supplier contract to these stalk modules, without adding finite generation. (Stacks, Tag 051E: Lemmas 10.101.1–10.101.3 (online), Stacks line 11344; Feng24, §3.4.1, p.18; proof of Lemma 3.2, p.14, Feng24 line 779.)

*Proof route.* Use the characteristic-p binomial identity and the p-element group basis to identify the truncated polynomial algebra; apply the nilpotent-local-ring supplier theorem to its modules.

*Needs:* §0.1; Mathlib `Module.free_of_flat_of_isLocalRing`; Mathlib `MonoidAlgebra`; DeformationAndDerivedPatchingAlgebra §7.5.

**Checks.**

- At p=2 over F₂, (1+u)²=1 in F₂[u]/u². Over ℤ[u]/u² the same expression minus 1 is 2u≠0, so σ↦1+u does not respect σ²=1 there. In general characteristic p, (1+u)ᵖ=1+uᵖ=1; the inverse identification sends u to σ−1.

- At p=3, σ⁻¹ maps to (1+u)²=1−u+u² and its product with 1+u is 1. The alternative σ↦u fails because u is nilpotent and not a unit. At p=2, N=1+σ maps to u, agreeing with §0.1; at p=3, N maps to u².

- For A=k[u]/u³, the regular module has rank 1 and is flat, and A^(ℕ) is free of rank ℵ₀. The zero module is free of rank 0. The residue module k has Tor₁^A(k,k)=k≠0 and is not flat. The infinite-rank example requires the arbitrary-rank supplier theorem.


### 0.5 Flat and perfect equivariant complexes

For trivial geometric action on Y, Flat^b(Y;A_Λ) is the full thick subcategory of complexes locally represented by bounded complexes of flat A_Λ-sheaves with finite Tor amplitude locally on Y; the globally bounded variant requires a uniform bound on the chosen bounded-dimensional piece. Perf_c is its intersection with D^b_c. On a point with finite modules, perfect means a bounded complex of finite projectives. For a nontrivial geometric action retain D_σ(Y;Λ); the group-ring flat kernel is imposed only on a trivially acted-on base or on the fixed locus, rather than identifying the source with group-ring sheaves. (Feng24, Definition 3.1 and Lemma 3.2, pp.13–14, Feng24 line 595.)

Use the supplied finite-Tor predicate; the cyclic flat kernel is its full thick subcategory with a common interval on the piece under consideration.

The API:

- Tor amplitude [a,b] means K⊗^L M has cohomology in [a,b] for every A_Λ-module sheaf M in degree zero.

- The subcategory is closed under shifts, cones and direct summands.

- At a geometric point the condition agrees with the corresponding group-ring Tor condition; a common bound is recorded separately.

*Proof route.* Specify the local versus uniform bounds separately. Use K-flat replacements rather than termwise tensoring an arbitrary representative; form the full stable subcategory.

*Needs:* §0.3; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; §0.4.

**Checks.**

- A free regular module and all its shifts lie in the kernel; the trivial k[C_p]-module k does not.

- The cone of any morphism between flat bounded complexes remains in the thick kernel.

- Finite Tor dimension must be over A_Λ: k is Λ-flat when Λ=k, but is not A_k-flat.

- Tor amplitude A=[0,0], k unbounded; C=[A→u A] has amplitude [0,1], H⁰=(u²), H¹=A/(u), both dimension 1. The kernel is defined on complexes, not on cohomology modules.


### 0.6 Flat resolutions and stalkwise Tor detection

Apply the supplied common-interval geometric-stalk Tor criterion to A_Λ-sheaves. Over k[C_p] and (O/pᵐ)[C_p], a bounded complex of finite Tor amplitude has a bounded flat representative, using the nilpotent-local-ring theorem on its final syzygy. For finite modules, finite projective dimension implies projectivity; the arbitrary-rank argument uses nilpotence and flatness, rather than finite Nakayama. Integral O-complexes retain finite Tor dimension and the separate uniform adic passage. (Stacks, Tag 08G1 (Lemma 21.46.3, Cohomology on Sites, Stacks line 5207); Tag 0DJJ (Lemma 21.46.10, Cohomology on Sites, Stacks line 5300); Tag 0A5N (Definition 15.70.1, More on Algebra, Stacks line 8130); Tag 051H (Lemma 10.101.3, in Algebra §10.101, Tag 051E), Stacks line 11356; Feng24, proof of Lemma 3.2, pp.13–14, Feng24 line 601.)

*Proof route.* Use the supplied geometric-stalk criterion and K-flat resolution; truncate by the Tor-vanishing syzygy argument. Keep a common interval in every global assertion and prove the O-adic passage by the stated uniform coefficient comparisons.

*Needs:* §0.5; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; §0.4; EtaleCohomologyFoundations F.1.

**Checks.**

- For the two-term regular complex A→A with differential u over A=k[u]/u^p, finite Tor amplitude holds although its nonzero cohomology modules are not flat. Keep a common interval at every stalk; individually finite intervals on a disjoint union do not give a bounded global one.

- C⊗ᴸk=[k→0 k] in degrees 0,1; individual family degrees −2n admit no common finite interval. Import stalk detection and retain the uniform interval.


### Examples

For p=3, k[C₃]=k[u]/u³ with u=σ−1 and N=u². The complex [A→u A] in degrees 0 and 1 has H⁰=(u²)≅k and H¹=A/(u)≅k. It is perfect even though neither cohomology module is flat. Arbitrary free direct sums are covered by the supplier theorem; the finite local theorem alone does not handle them.

### Dependencies

Mathlib coefficient/module carriers; SchemeAndStackFoundations §§1.17, 1.21, 1.23 and gap:admissible-invariant-quotient-gluing; ModularCurves Layer 0C; EnhancedDerivedSheaves §§0.1–0.4; EtaleCohomologyFoundations F.1; DeformationAndDerivedPatchingAlgebra §7.5; ReductiveGroupsPartII §RG2.5.1.


## Layer 1: Sheaf Tate categories and periodic cohomology


### 1.1 Constructible and bounded ind Tate categories

For trivial geometric action and Λ=k or O, define Perf(Y;TΛ)=D^b_c(Y;A_Λ)/Perf_c(Y;A_Λ) and Shv(Y;TΛ)=D^b_ind(Y;A_Λ)/Flat^b(Y;A_Λ) as stable Verdier localizations, then take their homotopy categories. Write T* for the quotient projections. The word Perf in Perf(Y;TΛ) denotes the constructible quotient, not the subcategory being killed. Its map to Shv(Y;TΛ) is conservative under the stalkwise finite-Tor criterion. At O-level the conservative comparison is conditional on the uniform adic finite-Tor criterion of the uniform adic supplier contract. (Feng24, Definition 3.3 and display (3.1), p.14, Feng24 line 623.)

At O-level prove the kernel comparison using the uniform normalized-adic supplier contract, including conservativity after passage to the bounded ind quotient. Kernel equality establishes conservativity; full faithfulness requires a separate localization argument and is not inferred here.

The API:

- Projection is exact and annihilates exactly the thick kernel.

- Exact functors annihilating the kernel factor with the localization coherence.

- The quotient comparison is conservative on constructible objects under the stated Tor criterion.

- Flat^b and the perfect kernel are tensor ideals for ⊗^L_Λ with diagonal C_p-action, so the quotients inherit a tensor product and T* is monoidal; this is what the projection formula in §2.8 uses.

*Proof route.* Use the universal property of localization at maps with flat/perfect cones. Compare the kernels on constructible objects; prove conservativity, without claiming full faithfulness merely from this kernel calculation.

*Needs:* §0.5; §0.6; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- At a point the regular A_Λ-module becomes zero; the trivial O-module has nonzero even Tate cohomology k.

- A map becomes invertible exactly when its cone is in the designated kernel.

- The trivial k-module survives: this quotient is not obtained by killing all Λ-perfect objects.

- T*A=0; T⁰O=k, T¹O=0; T⁰k=T¹k=k; cone(id)=0. Use the group-ring kernel and conservative comparison.


### 1.2 Two-periodicity of the Tate quotient

For Λ=k or O, there is a natural isomorphism [2]≅Id on these Tate categories, compatible with restriction. It comes from the class Λ→Λ[2] of the periodic C_p-resolution. The cone has a bounded induced A_Λ-resolution; tensoring with a bounded input over Λ remains in Flat^b because Λ has finite global dimension. This is a categorical statement, stronger than the existing isomorphism of Tate groups. (Feng24, Example 3.4, p.14; display (3.5), p.17, Feng24 line 641.)

The assertion is for Λ=k or O. It is not asserted for every bounded (O/pᵐ)-complex: these coefficient rings have infinite global dimension. Use coefficient-flat representatives when applying the finite-level periodic resolution.

*Proof route.* Construct the periodicity class using N and σ−1 in the existing group cohomology model. Its cone is Λ-perfect and induced over A_Λ. Tensor and check the flat bound, then use the quotient universal property. Use g=σ in the pinned explicit-generator all-degree Tate API, supplying hg locally from the specified generator: every element is σⁱ for some 0≤i<p. Require both its even- and odd-model composition identities, so the sheaf class and the point comparison have the same selected generator and norm sign.

*Needs:* §1.1; Tau Ceti `Rep.FiniteCyclicGroup.periodicIsoOfGenerator`; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- At a point the trivial k-module survives the quotient and becomes two-periodic; the regular representation becomes zero. The periodicity cone must have induced terms, not a claimed contracting homotopy of the resolution.

- even/odd pairs (k,0), (k,k), (0,0) recur after +2; at p=3, N=u² and σ−1=u. Fix the periodic class; an acyclic resolution need not contract.

- For C₃, the powers of σ list 1,σ,σ², and those of σ² list 1,σ²,σ; both choices satisfy hg. The choice g=1 lists only 1 and fails hg. With F₃ coefficients, replacing σ by σ⁻¹ multiplies the normalized H² class by 2. Indeed inversion multiplies H¹ by 2 and its Bockstein, the H² generator, by 2 as well. The Tate dimensions remain 1 in both parities; those dimensions cannot determine the chosen class.


### 1.3 Tate cohomology of complexes and sheaves

For a bounded A_Λ-complex K on a trivially acted-on étale space S, put `T^j(K) = colim_n H^(j+2n)(RHom_(A_Lambda)(Lambda,K))`, with transition induced by Λ→Λ[2]. This is an étale sheaf (internal Hom followed by cohomology), not the set of global morphisms. Its coefficient ring is T^0Λ and its index is naturally modulo two. On a point compare this construction with hypercohomology of the existing complete cyclic resolution. For Λ=k or O it annihilates Flat^b and descends to Shv(S;TΛ); the O-adic construction and its uniform comparisons require the uniform adic supplier contract. (Feng24, §§3.4.1–3.4.2 and Remark 3.13, pp.17–18, Feng24 line 759.)

In the displayed formula RHom means internal sheaf Hom on S, followed by its cohomology sheaf and exact filtered colimit. At O-level prove its compatibility with the normalized inverse system and its common bounds before passing to the quotient.

The API:

- Geometric stalks commute with the finite-bound Tate construction.

- Tʲ⁺²(K)≅Tʲ(K), compatibly with the chosen periodicity class.

- On a point in degree zero this is the pinned finite-group Tate cohomology.

*Proof route.* Use the supplied module norm splice; extend to bounded complexes by totalization and sheafification. Exact filtered colimits give the sheaf and independence of resolutions. Check vanishing on bounded flat complexes before descending.

*Needs:* §1.2; Mathlib `tateCohomology`; §0.4; EnhancedDerivedSheaves §§E1.3, E3.4.

**Checks.**

- For a trivial k-module M, T^0(M)=T^1(M)=M; for a free A_k-module both vanish.

- For a trivial O-free module M, T²ⁱ(M)=M/pM and T²ⁱ⁺¹(M)=0.

- Internal Tate sheaves on a disconnected S have independent local sections; replacing internal Hom by global Hom gives the wrong sheaf.

- T⁰k=T¹k=k; T⁰O=k,T¹O=0; sections on the two points are k⊕k, restrictions are the two projections. Use internal sheaf Hom.


### 1.4 The two-periodic long exact sequence

A distinguished triangle K′→K→K″→K′[1] of bounded equivariant complexes produces a functorial long exact sequence of Tate cohomology sheaves, with the connecting map T^jK″→Tʲ⁺¹K′ and period two. After a bounded Rf! the same sequence is the relative Tate sequence. (Feng24, §3.4.4, p.18, Feng24 line 807.)

*Proof route.* Apply RHom(Λ,−), take the long exact cohomology sequence and pass to exact filtered colimits. Relative statements additionally require the bounded compact-support theorem of Layer 2; this node supplies only the Tate exact-sequence operation.

*Needs:* §1.3; EnhancedDerivedSheaves §§E1.3, E3.4.

**Checks.**

- For a short exact sequence of cyclic modules, recover the pinned module Tate connecting map at a point. For a split sequence, its connecting map is zero and the quotient-level statement is additive.

- split boundary=0; integral boundary T¹k=k→T²O=k is an isomorphism, T⁰O→T⁰k is identity. Keep connecting map degree +1.


### 1.5 Trivial-action and integral-unit formulas

For C∈D^b(k) inflated to k[C_p], T^*(C)≅H^*(C)⊗_k T^*(k), with the total grading modulo two. For an O-free module L with trivial action, T^even(L)=L/pL and T^odd(L)=0. On a stratum the latter formula applies to O-free local systems stalkwise, giving the even Tate unit. No claim that every constructible sheaf complex is globally formal is used. (Feng24, Lemma 3.14, p.18; display (4.1), p.20, Feng24 line 788.)

*Proof route.* Use the existing cyclic two-periodic resolution. For a trivial action its differentials are 0 and p. Over k both vanish; over O, p is injective on L. For complexes of vector spaces the derived-category splitting supplies the formula, and naturality is checked at the cohomology functor level.

*Needs:* §1.3; Tau Ceti `TauCeti.TateCohomology.H0IsoNormQuotient`.

**Checks.**

- For p=3 and L=O, check T⁰=k and T¹=0 from the alternating maps 0 and p. For the trivial k-module both groups equal k; for an induced regular module both vanish.

- T^even/odd=(k,0),(k,k),(0,0); H^(−1)(k[1])=k, total grading shifts by −1. Distinguish mod-p from the integral Tate unit.


### 1.6 The stratified integral Tate category

For a finite stratification S of a finite-type Y, Perf_S(Y;TO) is the essential stable image of D^b_S(Y;O[C_p]) in the constructible Tate quotient; equivalently use its quotient by S-constructible perfect complexes after verifying the restriction functors preserve that kernel. Inflation ε* assigns the trivial coefficient C_p-action to an O-complex. The pariversity is a function S→Z/2, independent of coefficient C_p-actions. (Feng24, §4.2, pp.20–21, Feng24 line 888; LL21, Corollary 4.5.2, p.14; opening of §5, p.19, LL21 line 624.)

The API:

- ε*:D^b_S(Y;O)→D^b_S(Y;O[C_p]) preserves restrictions and derived duality in the stated finite-Tor category.

- Both i_λ* and i_λ! descend to the corresponding stratum Tate category.

- The S-constructible quotient identifies with the essential stratified image, with a proof of this localization statement.

*Proof route.* Check the stratified localization comparison by restriction to strata and induction across recollement; define inflation via augmentation, with its enhancement.

*Needs:* §1.1; §0.3.

**Checks.**

- For one point, inflated O is the even Tate unit and its shift by one is odd.

- Inflating a rank-two free local system preserves both its rank after reduction and its monodromy.

- A complex constructible only for a refinement does not automatically belong to the coarser S-constructible source.

- T*O even, T*O[1] odd; O²/p=k²; a skyscraper is not a local system on P¹. Retain the chosen stratification.


### Examples

For the short exact sequence 0→O→ᵖO→k→0 with trivial action, the map on even integral Tate groups induced by p is zero. The boundary T¹(k)→T²(O) is an isomorphism k→k, while T⁰(O)→T⁰(k) is identity. This fixes the connecting-map degree and distinguishes the integral from the mod-p unit.

### Dependencies

Layer 0; EnhancedDerivedSheaves E1.3–E1.4 and E5:abstract; the pinned module Tate comparisons; the uniform W(k)-adic supplier contract for integral coefficients.


## Layer 2: Smith restriction, operations and localization


### 2.1 Separate Tor bounds for compact support and open direct image

Let A=k[C_p] or (O/p^m)[C_p], and let f:Y→S be separated of finite type, with geometric fibres of dimension ≤d, under the torsion étale projection formula and the bound cd_c(f)≤2d. If K has A-Tor amplitude [a,b], then Rf!K has amplitude [a,b+2d]. For a quasi-compact open immersion j:U→X into a finite-dimensional noetherian scheme, Rj* preserves finite A-Tor dimension when the relevant ambient local étale cohomological dimension is uniformly bounded. Its bound is that ambient bound, not 2 times the relative dimension of j. At adic O-level require one compatible finite-level system, a uniform bound and the derived-limit/projection-formula comparisons. (Feng24, Lemma 3.9, p.16; proof of Lemma 3.7, pp.15–16, Feng24 line 709.)

*Proof route.* Tensor with an arbitrary A-module, apply projection formula, then use the compact-support cohomological bound. For j use stalks as cohomology of punctured strict henselian neighborhoods and an ambient bound. The adic comparison is the uniform adic supplier contract, not a formal consequence of these torsion estimates.

*Needs:* §0.6; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2; EnhancedDerivedSheaves §§E1.3, E3.4; EtaleDualityAndPerverseSheaves §§3.1–3.2 and the W(k)-adic supplier contract.

**Checks.**

- For A=k[C_p] on A¹, RΓ_c(A¹,A)=A(−1)[−2] attains degree 2. For G_m→A¹, use the Kummer example below to reject a relative-dimension-zero bound on Rj*.

- RΓ_c(A¹,A)=A(−1)[−2], H²=A(−1); nearby C has H⁰=k,H¹=k(−1). Use 2d for compact support and ambient local bounds for Rj*.


### 2.2 Compact supports in locally finite type

For a separated equivariant f:Y→S locally of finite type of bounded geometric fibre dimension, construct Rf! from the directed system of quasi-compact opens of Y over finite-type opens of S, using extension by zero and the imported enhanced compact-support functors. A bounded input with a uniform degree interval has a bounded ind-constructible output under a common 2d bound. Constructibility of the output requires the additional usual finite-type and constructible-input hypotheses. (Feng24, §3.3, pp.16–17; proof of Lemma 3.9 and Remark 3.10, p.16; Proposition 3.12, p.17, Feng24 line 712.)

The API:

- On finite-type pieces recover the imported Rf!.

- R(gf)!≅Rg!Rf! with coherent associativity whenever uniform bounds apply.

- Geometric base change and projection formula pass through the colimit with the stated tensor/limit hypotheses.

*Proof route.* Construct the diagram with the enhancement and its extension-by-zero transition maps; prove independence by cofinality. Uniform support/fibre bounds keep the colimit bounded. Compare on each finite-type open of S.

*Needs:* §2.1; EnhancedDerivedSheaves §§E1.3, E3.4; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2.

**Checks.**

- For an infinite disjoint union of points over a point, compact support is the direct sum, not the product.

- For A¹→pt, RΓ_c(k)=k(−1)[−2], so an input in degree zero can have output in degree two.

- The family ⊔_n A^n has no common dimension bound and is excluded from the bounded output assertion.

- RΓ_c=⊕ℕΛ, not ∏ℕΛ; A¹ has H²_c=Λ(−1); union has H^(2n)_c≠0 for all n. Keep common fibre-dimension and degree bounds.


### 2.3 A free geometric quotient produces flat complexes

If C_p acts freely and admissibly on Y, q:Y→Y/C_p is its finite étale quotient and E∈D^b_σ(Y;Λ) has finite Λ-Tor dimension, then q_*E, with its quotient C_p-action, has locally a bounded induced A_Λ-resolution and is flat over A_Λ. For Λ=k the coefficient Tor hypothesis is automatic. The hypothesis is geometric equivariance, not a second independent C_p-action on an arbitrary sheaf. (Feng24, Lemma 3.6, p.15, Feng24 line 677.)

*Proof route.* Étale locally trivialize the torsor; descent identifies E with identical coefficient complexes on p sheets. Pushforward is induction from Λ to A_Λ. Tensor a Λ-flat resolution with the regular representation.

*Needs:* §0.2; §0.3; §0.6.

**Checks.**

- For p disjoint points permuted cyclically and an equivariant constant Λ-sheaf, q_* gives the regular Λ[C_p]-module. Giving p constant summands an unrelated trivial coefficient action fails this test.

- q_*Λ=Λ[C₃] of rank 3; N sends e₀ to e₀+e₁+e₂; unrelated trivial action has N=0 over k. Require geometrically equivariant input.


### 2.4 The nearby free complement has flat fixed stalks

Let i:Y^σ→Y and j:U=Y\Y^σ→Y, with Y separated finite-dimensional of finite type and admissible C_p-action. For E∈D^b_σ(U;Λ) with the stated finite coefficient Tor bounds, the fixed stalks of i*Rj*E have finite A_Λ-Tor dimension with a uniform ambient bound. In the O-adic case this uses the uniform adic supplier contract. (Feng24, Lemma 3.7, pp.15–16, Feng24 line 684.)

*Proof route.* Factor the open complement through its free finite quotient, apply the regular-module calculation there, and compute Rj* on strict local neighborhoods. Apply the ambient local cohomological bound, not a relative-dimension-zero bound.

*Needs:* §2.3; §2.1; §0.2.

**Checks.**

- For scalar rotation on A¹ the fixed-origin nearby stalk is the two-term complex k[C_p]→k[C_p] with differential σ−1, a perfect complex with two nonflat cohomology modules. This tests the complex criterion rather than a false cohomology-wise freeness claim.

- C=[A→u A], H⁰=k,H¹=k(−1), Tor amplitude [0,1], quotient C=0. Reject cohomology-wise freeness and a degree-zero Rj* bound.


### 2.5 Extraordinary and ordinary fixed restriction agree in the quotient

For a bounded-dimensional Y as in the previous node and E∈D^b_σ(Y;Λ), with the indicated coefficient finite-Tor/adic assumptions, the cone of the natural map i!E→i*E lies in Flat^b(Y^σ;A_Λ). Thus T*i!E≅T*i*E naturally. On finite-type constructible objects the cone is perfect and the comparison is in Perf(Y^σ;TΛ). (Feng24, Lemma 3.8, p.16, Feng24 line 703.)

*Proof route.* Restrict the open–closed localization triangle to Y^σ. Its error term is i*Rj*j*E, treated by the previous node. The dimension bound is required for this term to be globally bounded.

*Needs:* §2.4; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2; §1.1.

**Checks.**

- For trivial action i=id the comparison is identity. For scalar rotation on A¹ its cone is the perfect nearby complex. The disjoint union of A^n tests why a uniform dimension hypothesis is required.

- identity cone=0; scalar-action cone C is perfect; i!k on Aⁿ=k(−n)[−2n]. Require a global bound for a globally bounded conclusion.


### 2.6 The Smith operation

For i:Y^σ→Y define Psm(E)=T*i*E from D^b_σ(Y;Λ) to Shv(Y^σ;TΛ), and from the constructible source to Perf(Y^σ;TΛ). The fixed locus has trivial geometric action, so the target group-ring category is available. Under the hypotheses of §2.5 there is also the natural presentation T*i!E. (Feng24, §3.2, displays (3.2)–(3.4) and Remark 3.5, p.15, Feng24 line 661.)

The API:

- Psm is T* composed with fixed-locus pullback.

- Identify with T*i! only under the finite-dimension and coefficient assumptions.

- Equivariant pullback commutes with Psm and restriction to fixed loci.

- For Λ=O, Psm commutes with derived reduction k⊗^L_O−, from equivariant O-sheaves to the k-Tate category, naturally on the constructible bounded domain (used for the bottom face of Feng Lemma 4.24).

*Proof route.* Compose ordinary fixed-locus pullback with localization. Keep its alternative !-presentation as a theorem with bounds, not an unconditional part of the definition.

*Needs:* §2.5; §1.1.

**Checks.**

- For trivial geometric action, Psm is the quotient projection and does not kill the trivial coefficient module.

- For a free geometric action the fixed locus is empty, hence Psm is zero.

- On A¹ with x↦ζx and constant k, Psm has the nonzero trivial Tate unit at 0.

- Psm=T* for i=id; free fixed locus ∅ gives 0; fixed origin has T⁰=T¹=k with k coefficients. Distinguish quotient projection from invariants.


### 2.7 Flat kernels survive compact-support pushforward

For f between trivially C_p-acted-on schemes and finite-Tor bounds as in §2.1, Rf! carries Flat^b(Y;A_Λ) to Flat^b(S;A_Λ). For a free admissible geometric action on Y and a C_p-equivariant map f:Y→S with trivial action on S, Rf!E is flat over A_Λ for any bounded equivariant E with the needed coefficient bounds. For nontrivial S the statement is instead applied to the base change over S^σ. (Feng24, Lemma 3.9 and Corollary 3.11, p.16, Feng24 line 709.)

*Proof route.* The first assertion is the projection formula/Tor bound. For a free source factor through q and apply the first assertion to q*E. The base of a flat quotient assertion is S^σ, not Y.

*Needs:* §2.2; §2.3; §2.1.

**Checks.**

- For a free p-point orbit mapping to a point, compact pushforward is regular and vanishes in the quotient. For identity on a trivially acted-on point it preserves the flat kernel without killing the trivial nonflat module.

- RΓ_c=A and T*A=0; id_!A=A, id_!k=k and T*k≠0. The flat output is on the target.


### 2.8 Operations on Tate categories

Between trivially acted-on finite-dimensional spaces, descend pullback, bounded compact-support pushforward, tensor and the compatible constructible duality to the designated Tate quotients. With finite-Tor constructible coefficients, define f! and Rf* by the dual formulas and identify them with the descent of the ordinary operations where that descent is established. Internal Hom descends in a variable when the other is Λ-perfect. These are functors on their specified bounded domains; arbitrary unbounded Rf* is not asserted. (Feng24, §§3.3.1–3.3.2, pp.16–17; Appendix A.1, pp.56–57, Feng24 line 729.)

The API:

- Supply the natural factorization through T* with coherent composition.

- Rf!(K⊗f*L)≅Rf!K⊗L on the specified finite-Tor domains.

- D exchanges f* with f! and Rf! with Rf*, under constructible biduality hypotheses.

*Proof route.* Check that each operation annihilates the quotient kernel before descending. For duality use finite coefficient Tor dimension and the imported biduality theorem. Derive !-pullback and *-pushforward compatibilities by duality; keep all boundedness hypotheses in the functor signatures.

*Needs:* §2.7; §2.5; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- Pullback along an identity and the descended identity agree as functors.

- Projection formula with the Tate unit recovers the original object, whereas tensor with a regular A_Λ-module becomes zero.

- For a proper f the ! and * pushforwards agree; for a nonproper f they retain their distinct compact-support meanings.

- id*=id; K⊗Λ=K; K⊗A has induced action and projects to 0; RΓ_c(A¹,k) has H²=k(−1), RΓ(A¹,k) has H⁰=k. Retain each functor domain and supports.


### 2.9 Smith commutes with compact supports

Let f:Y→S be a separated admissibly C_p-equivariant locally finite type morphism between bounded-dimensional schemes, with the uniform cohomological and coefficient Tor hypotheses above. There is a natural equivalence Psm_S Rf!≅R(f^σ)! Psm_Y. For finite-type constructible inputs this is in the constructible Tate category. Proper pushforward is a special case; properness is not needed for the !-version. (Feng24, Proposition 3.12, p.17; §3.4.5, p.19, Feng24 line 742.)

*Proof route.* Base change first to S^σ. In that fibre, remove Y^σ using open–closed localization. The complement has a free C_p-action; its compact-support image is flat and vanishes in the quotient. The resulting natural transformation is invertible; verify coherence with composition.

*Needs:* §2.6; §2.7; §2.8; EnhancedDerivedSheaves §§E1.3, E3.4.

**Checks.**

- For the structure map of the free p-point orbit both sides are zero. For the identity map the comparison is the identity natural transformation, including on a nonzero scalar morphism.

- both sides 0 on a free orbit; identity carries scalar 2 to 2; k⊕A projects to k. Compare natural maps and use compact supports.


### 2.10 Equivariant localization of cohomology

For S=Spec(F) with trivial action, the previous equivalence gives T*RΓ_c(Y,E)≅RΓ_c(Y^σ,Psm(E)) in Shv(pt;TΛ). Applying T^j gives the two-periodic localization on cohomology. This is a quotient-level natural isomorphism before extracting groups, and requires all the boundedness hypotheses of §2.9. (Feng24, §3.4.5, display (3.6), p.19, Feng24 line 816.)

*Proof route.* Specialize f to the structure map and use the trivial-action identification of Smith at a point. Pass to relative Tate cohomology; do not identify it with an ordinary non-equivariant cohomology group without the trivial-action formula.

*Needs:* §2.9; §1.3.

**Checks.**

- For Y the disjoint union of one fixed point and one free orbit, equivariant constant k-coefficients localize to precisely the fixed point. Compare both parity indices with module Tate cohomology.

- RΓ_c=k⊕A; Tate groups (k,k) on both sides; free-orbit contribution (0,0). A quotient equivalence precedes passage to cohomology.


### Examples

On the disjoint union of one fixed point and a free three-point orbit, compact cohomology is k⊕k[C₃]. Quotient projection kills the second summand, leaving the fixed-point Tate unit in both parities. On scalar rotation of A¹, the nearby fixed stalk has the regular two-term model of Layer 0, with its degree-one Tate twist; its image in the quotient is zero.

### Dependencies

Layers 0–1; EnhancedDerivedSheaves E3.4; EtaleCohomologyFoundations §§F.2–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2 and its uniform W(k)-adic contract.


## Layer 3: Modular Satake and rational tilting representations


### 3.1 Modular equal-characteristic geometric Satake

Extend the supplied finite-extension equal-characteristic Satake equivalence to connected reductive H over every separably closed F of characteristic different from p and to coefficients k=F̄_p and O=W(k). The spherical perverse category with k coefficients and fusion symmetry is tensor-equivalent to finite-dimensional rational Rep_k(Ĥ). The O-flat perverse subcategory is tensor-equivalent to finite free rational representations of Ĥ_O. Identify total cohomology, corrected for the parity sign in fusion symmetry, with the fibre functor. Prove the compatible coefficient, weight-functor, finite-support and field-extension comparisons; the equal-characteristic scheme Grassmannian and its ordinary Schubert models remain the supplied ones. (MV07, Proposition 11.1, p.31; Theorem 12.1, p.33; Theorem 14.1, p.40, MV07 line 1647; Feng24, opening of §4, p.19; §4.5, p.23; Remark A.1, p.58, Feng24 line 824.)

*Proof route.* Extend the supplied weight-functor and projective-generator reconstruction through the permitted finite coefficient levels and their enhanced limits, and through arbitrary separably closed base change. Verify the dual root datum, fusion signs, perverse-flat/free restriction, field extension and coefficients. Construct the semi-infinite estimates needed by this proof independently of cyclic Smith compatibility in Layer 6.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract; EtaleDualityAndPerverseSheaves §§2.4–2.5; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; ReductiveGroups Layer 1; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; GlobalShtukasAndFunctionFieldLanglands §§1.8–1.9, 1.14; GeometricSatakeAndFusion GS0, Equal-characteristic Schubert models and coefficient comparison.

**Checks.**

- For a split torus, point sheaves indexed by coweights correspond to one-dimensional characters; fusion adds coweights. For H=PGL₂ the IC/parity representation of the dual SL₂ has the expected highest weight, so using the original root datum instead of the dual is detected.

- χ₁χ₋₁=χ₀; dual SL₂ standard has weights ±1 and dimension 2; O-unit reduces to k-unit. Import finite-extension Satake; extend its field/coefficient range.


### 3.2 Satake standards and coefficient change

Fix a Borel and dominant λ. Under §3.1, the perverse standard ^pj_!Λ[dim Gr^λ] corresponds to the Weyl module Δ(λ), and the perverse costandard ^pj_*Λ[dim Gr^λ] to ∇(λ), with the canonical highest-weight map matched. On O-flat objects the k-reduction comparison is derived tensor k⊗^L_O, with ordinary representation reduction on the other side. Do not assert that derived reduction of an arbitrary integral perverse object stays in the perverse heart. (MV07, Proposition 13.1 and Corollary 13.2, pp.39–40, MV07 line 1608; Feng24, §4.5, p.23, Feng24 line 983.)

*Proof route.* Use the universal properties on each saturated highest-weight ideal, evaluated by the λ-weight functor. Compare standard/costandard maps and integral projective generators before extending scalars. Track derived tensor for torsion objects.

*Needs:* §3.1; ReductiveGroups §10B; LanglandsParameterStacks §LP3.0 and its finite-highest-weight-ideals, integral-highest-weight-orders and integral-tilting-lifts contracts; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- At λ=0 both standard and costandard are the unit. For dual SL₂ in characteristic 3, distinguish Δ(3) from ∇(3); do not identify them by semisimplicity or an integral arbitrary-object reduction argument.

- Δ(0)=∇(0)=k; dim Δ(3)=dim ∇(3)=4, Loewy layers reversed; T(3) dimension 6. Do not infer isomorphism from equal Weyl/induced characters.


### 3.3 The category of rational tilting representations

Using the Weyl and dual-Weyl modules of ReductiveGroups §10B and the filtrations, finite-highest-weight-ideal, integral-highest-weight-orders and integral-tilting-lifts contracts with LanglandsParameterStacks §LP3.0, Tilt_Λ(Ĥ) is the full additive subcategory of finite free rational Ĥ_Λ-modules admitting both a finite Δ-filtration and a finite ∇-filtration. For Λ=k, finite free means finite-dimensional. Its exact structure is inherited from rational representations on the finite free coefficient domain; it is closed under direct summands, not under all kernels and cokernels. Use the integral reductive group representation carrier, not arbitrary representations of the discrete group of k-points. (JMW16, §1.1 and Theorem 1.1, p.1, JMW16 line 24; Don93, Theorem 1.1; Feng24, §4.5, p.23, Feng24 line 993.)

The field classification is Donkin's theorem (Don93, Theorem 1.1), the algebraic-group case of Ringel's existence theorem for highest-weight categories, as recalled in JMW16 Theorem 1.1 (JMW16 lines 22–27). For O, existence, classification, summand closure and Hom reduction use the integral-tilting-lifts supplier contract; they are not consequences of defining the intersection of two filtration predicates.

The API:

- Tilting is the conjunction of Δ-filtered and ∇-filtered on the actual rational representation.

- Up to isomorphism T(λ) is the unique indecomposable tilting of highest weight λ; its highest-weight line is free of rank one over Λ. Choosing a normalization of that line does not assert uniqueness of an object isomorphism.

- Finite sums, duals and direct summands preserve tilting.

*Proof route.* Import the highest-weight predicates, and define their intersection as a full subcategory. For the integral API use the split highest-weight O-orders of the integral-highest-weight-orders contract: Δ-to-∇ Ext vanishing makes Hom between tiltings finite free with reduction base change; lift finite-ideal tilting generators and split lifted idempotents in their complete endomorphism orders. Reduction then identifies indecomposable labels and detects tilting on coefficient-free objects. Morphisms retain the algebraic comodule structure. This input precedes the parity comparison of §4.5.

*Needs:* ReductiveGroups §§10A–10B; LanglandsParameterStacks §LP3.0 and its finite-highest-weight-ideals, integral-highest-weight-orders and integral-tilting-lifts contracts; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; ReductiveGroups Layer 1.

**Checks.**

- The trivial representation is tilting, with both filtrations of length one. For the trivial group End_O(O)=O is free of rank one and End_O(O)⊗_O k=k=End_k(k); reduction is Hom base change, not an equality of the two endomorphism rings.

- For SL₂ at p=3 the integral T_O(3) has rank 6 and reduces to the 6-dimensional T_k(3). The O-Weyl module Δ_O(3) has rank 4 and reduces to the non-tilting Δ_k(3); it cannot substitute for the tilting lift.

- The zero representation reduces to zero and is tilting but is not indecomposable; O⊕O reduces to k² and retains two rank-one summands. Classification concerns nonzero indecomposables.

- For a split torus every finite-dimensional rational representation is tilting, with its finite character decomposition.

- For SL₂ in characteristic 3, the Weyl module Δ(3) has an exact sequence 0→L(1)→Δ(3)→L(3)→0 of two-dimensional simple factors; ∇(3) has the reversed Loewy layers. Thus Δ(3) is not tilting, while T(3) has character ch Δ(3)+ch Δ(1) and dimension 6.

- unit has two length-one filtrations; torus weights give all modules; Δ(3) is not tilting, ch T(3)=ch Δ(3)+ch Δ(1), dim=4+2=6. Tilting is a condition on rational representations, not arbitrary point-group actions.


### 3.4 Tensor closure and character determination

Tensor products of finite-dimensional rational tilting modules for a split connected reductive group over k are tilting. For a product group, external tensor products of indecomposable tiltings give its indecomposable tiltings. The characters ch T(λ) are triangular with leading dominant weight λ of multiplicity one, so equal characters imply isomorphism for finite direct sums of tiltings. Restriction to a maximal torus is faithful, but it is generally not full. (JMW16, Theorem 1.2, p.1; Theorems 5.1 and 5.3, p.16, JMW16 line 30; Feng24, footnote 11, p.27; §A.4, p.60, Feng24 line 1212.)

*Proof route.* Use the good-filtration tensor theorem (Donkin, Wang, Mathieu) and its dual from LanglandsParameterStacks §LP3.0; no parameter-stack hypothesis is imposed on this generic representation theorem. Krull–Schmidt and the triangular highest-weight characters determine multiplicities recursively. Restriction forgets structure and is faithful; no inference of fullness is allowed.

*Needs:* §3.3; LanglandsParameterStacks §LP3.0 and its finite-highest-weight-ideal contract; ReductiveGroups Layer 4.

**Checks.**

- For dual SL₂ in characteristic 3, the standard two-dimensional tilting module has tensor square T(2)⊕T(0). Torus restriction is faithful but its diagonal weight-space endomorphisms need not be SL₂-intertwiners.

- V⊗V=T(2)⊕T(0), dimensions 3+1=4; diag(1,2) commutes with torus but not upper unipotent. Use tensor theorem and character triangularity, not torus fullness.


### 3.5 Tiltings generate bounded rational derived categories

The canonical functor K^b(Tilt_k(Ĥ))→D^b(Rep_k(Ĥ)) is an equivalence, where Rep denotes finite-dimensional rational representations. Prove this first inside each finite saturated highest-weight ideal and then pass to their filtered union; this does not give a uniform tilting-resolution length for all highest weights. (Feng24, Proposition 4.10, p.23, Feng24 line 1017.)

*Proof route.* Within a finite highest-weight ideal, Ext^n(T,T′)=0 for n>0 by Δ/∇ Ext-vanishing, giving full faithfulness of the homotopy functor. Resolve standards by tiltings inductively on the finite weight poset; standards generate its bounded derived category. Any bounded complex involves finitely many weights and fits in such an ideal. Use the finite-highest-weight-ideal supplier contract with LanglandsParameterStacks §LP3.0.

*Needs:* §3.3; LanglandsParameterStacks §LP3.0 and its finite-highest-weight-ideal contract; Mathlib `DerivedCategory`.

**Checks.**

- For a torus the category is semisimple and degree-zero objects generate by characters. For a nonsemisimple finite highest-weight ideal, check full faithfulness through vanishing of positive Ext between tiltings and generation via finite standard/costandard resolutions.

- torus has Extⁿ=0 for n>0; zero resolves by zero; Δ(3) fits in 0→Δ(3)→T(3)→Δ(1)→0 with dimensions 4→6→2. Require finite ideals without a uniform global resolution length.


### Examples

For dual SL₂ in characteristic 3, Δ(3) has dimension 4 and is not tilting. The indecomposable T(3) has Weyl character ch Δ(3)+ch Δ(1), hence dimension 6. The standard tilting V has V⊗V≅T(2)⊕T(0), of dimensions 3+1. Characters use integer multiplicities, even when the coefficient field has characteristic 3.

### Dependencies

Layer 0; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.5, 1.8–1.9, 1.14 and its field-extension contract; GeometricSatakeAndFusion GS0; ReductiveGroups Layers 1, 4, 9; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; LanglandsParameterStacks §LP3.0 and the finite-highest-weight-ideals, integral-highest-weight-orders and integral-tilting-lifts contracts; EnhancedDerivedSheaves E1.4; EtaleDualityAndPerverseSheaves §§2.4–2.5 and the adic contract.


## Layer 4: Parity, integral Tate Hom and normalized lifting


### 4.1 Even stratifications and pariversities

A JMW stratification S of Y has finitely many connected smooth locally closed strata, the usual frontier condition, and the following coefficient condition for Λ=k or O: for finite free local systems L,L′ on each stratum, every Ext^n(L,L′) is finite free over Λ and vanishes for odd n. A pariversity † assigns an element of Z/2 to each stratum; the dimension pariversity is dim(Y_λ) mod 2. Simple connectivity is an additional hypothesis used for lifting, not part of the general definition. The class of local systems is part of the data: over a base field of positive characteristic it is taken to be the constant (or group-equivariant) ones, since wild local systems on affine strata can have odd cohomology. (JMW14, §2.1, conditions (2.1)–(2.2), pp.4–5; Definition 2.3, p.5, JMW14 line 199; Feng24, §4.1, pp.19–20, Feng24 line 849.)

The API:

- Odd Ext groups vanish and even ones are finite free, with no inverted condition.

- Associate dim mod 2 to the chosen smooth strata.

- Shifting † by one exchanges the even and odd conditions.

*Proof route.* Use local-system Ext in the imported constructible derived category. Require freeness and odd vanishing; even nonzero Ext is allowed. Retain the specified class of finite free local systems on each stratum, with its even-Ext and freeness hypotheses; a non-simply-connected stratum does not justify enlarging that class.

*Needs:* EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2.

**Checks.**

- An affine space with constant coefficients satisfies the condition; its dimension changes † but not the odd-Ext vanishing.

- P¹ with its one smooth stratum has nonzero H², which is allowed; a smooth elliptic curve with H¹≠0 fails the condition for the constant local system.

- The same stratification can be used with constant †=0 and dimension †; on a one-dimensional stratum these give different even objects.

- Ext⁰(A¹)=Λ, positive ordinary Ext=0; P¹ has H⁰=Λ,H²=Λ(−1); elliptic H¹ has rank 2. Odd Ext vanishes; even nonzero Ext is allowed.


### 4.2 Parity complexes and parity sheaves

An object E∈D^b_S(Y;Λ) is *-even for † if each i_λ*E has finite free local-system cohomology only in degrees congruent to †(λ); !-even uses i_λ!E. Even means both, odd means E[1] is even, and parity means a direct sum of an even and an odd object. A parity sheaf E(λ,L) is an indecomposable parity object supported on closure(Y_λ) whose restriction to Y_λ is L[dim Y_λ], for an indecomposable finite free local system L. Existence is an independent theorem. (JMW14, Definition 2.4, p.5; Theorem 2.12, p.7; Definition 2.14, p.8, JMW14 line 228; Feng24, §4.1, pp.19–20, Feng24 line 858.)

The API:

- Both stalk and costalk conditions are part of evenness; neither implies the other by definition.

- A shift by one exchanges even and odd; a shift by two preserves them.

- Verdier duality preserves parity under the finite-free local-system and smooth-stratum hypotheses.

*Proof route.* Define the four restriction predicates and their conjunction/direct-sum form. Specify the indecomposable normalized extension separately; never define it by choosing an extension that has not been proved to exist.

*Needs:* §4.1; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2.

**Checks.**

- On a smooth one-dimensional stratum Λ[1] is even for dimension pariversity and Λ[0] is odd.

- On a point O/p in degree zero is not O-parity because its cohomology is not O-free.

- A point-supported Λ⊕Λ[1] is parity but neither even nor odd; the condition is not a single parity for all summands.

- Λ[1] has H^(−1)=Λ and is dimension-even; O/p not free; k⊕k[1] has both degrees 0,−1. Require both stalk and costalk freeness; parity can be a sum of both parities.


### 4.3 Uniqueness and Krull–Schmidt for parity extensions

In the finite JMW setting with complete local coefficient ring Λ, parity objects have Krull–Schmidt decompositions. Every indecomposable parity object has one irreducible support closure(Y_λ), restricts there to one indecomposable local system shifted by an integer, and is determined up to isomorphism by that restriction and support. This proves uniqueness of E(λ,L), not its existence. (JMW14, Remark 2.1, p.4; Theorem 2.12, p.7, JMW14 line 323; Feng24, Theorem 4.1, p.20, Feng24 line 866.)

*Proof route.* Induct over strata using odd-Hom vanishing to extend maps between restrictions. Endomorphism rings of finite-support parity objects are finite over the complete local coefficient ring, so idempotents split and the usual local-ring criterion gives Krull–Schmidt. The dense-stratum inverse lifts modulo the boundary radical.

*Needs:* §4.2; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2.

**Checks.**

- On a point over complete local O, the only normalized rank-one extension is O. Uniqueness must not imply existence for an arbitrary stratified singular variety; the Grassmannian existence theorem is an additional input.

- End(O)=O local; End(O²)=M₂(O) contains idempotent diag(1,0); O[1] restricts in a different degree. Uniqueness for fixed dense restriction does not assert existence.


### 4.4 Parity extensions on the equal-characteristic Grassmannian

The L^+H-orbit stratification of every finite Schubert union in Gr_H satisfies the JMW condition for Λ=k,O with constant local systems on the strata, equivalently L^+H-equivariant ones, since the stabilizers are connected; these are the only local systems used. In characteristic 0 the strata are simply connected. Over a field of positive characteristic ℓ the condition fails for arbitrary étale local systems, so the orbit-constructible category is taken with constant restrictions to strata. Its normalized parity extensions exist for all dominant coweights and trivial finite free local systems. They admit compatible L^+H-equivariant structures in the precise non-torsion-prime setting of JMW16 Theorem 1.4; for every good prime the equivariant realization of the normalized category is part of §4.5. Do not identify the full equivariant derived category with the orbit-constructible one. (Feng24, §4.1, p.20; §4.5, pp.22–23, Feng24 line 983; JMW16, Theorem 1.4 and footnote 3, p.2, JMW16 line 72.)

*Proof route.* Build Bott–Samelson parity pushforwards on affine flag varieties, then take the appropriate summands on the partial flag/Grassmannian. Check evenness, the local-system condition and integral lifting on each bounded piece. Carry out these arguments directly for étale sheaves on the scheme-theoretic Grassmannian over F, in place of the complex topology: Iwahori orbits on the affine flag variety are affine spaces, the projection to the Grassmannian restricts on strata to projections between affine spaces and is therefore even, and proper even pushforward preserves parity (JMW14, Proposition 2.34, p.15, JMW14 line 668; §4.1, p.29, JMW14 line 1340; Proposition 4.10, p.33, JMW14 line 1505), using proper base change, Künneth and purity for the étale cohomology of fibres. Every target of Layers 4–6 is stated for étale sheaves over F and proved here; none imports a complex-topological statement as a theorem.

*Needs:* §4.3; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract; GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison*; EtaleCohomologyFoundations §§F.2–F.3, F.5–F.6; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- For a torus every stratum is a point and its extension is Λ. For a GL₂ minuscule closed Schubert P¹ the normalized extension is Λ[1]. Check ordinary Hom separately from equivariant Hom.

- Over an algebraic closure of F_ℓ, a one-dimensional Schubert cell of the affine flag variety is A¹, and the Artin–Schreier sheaf L_ψ(x^d), for d≥3 prime to ℓ and ψ a nontrivial character of F_ℓ into k^×, has H¹ of dimension d−1. The constant-local-system convention excludes it (EtaleDualityAndPerverseSheaves §5.2, Curve Euler–Poincaré with Swan conductors).

- point generator Λ; P¹ generator Λ[1]; in geometric characteristic ℓ≠3, H¹(A¹,Lψ(x³)) has dimension 2, whereas constant H¹=0. Restrict positive-characteristic stratum local systems to the stated class.


### 4.5 Normalized parity sheaves are tilting Satake objects

For every prime p good for the root system of Ĥ (equivalently H), including p=2 when every irreducible factor has type A, every normalized k- or O-parity sheaf on Gr_H is perverse. Being perverse and constructible for the L^+H-orbits with constant restrictions to strata, each carries its canonical L^+H-equivariant structure; this is the equivariant realization used below. Modular Satake induces `Parity^0_(L^+H)(Gr_H;k)`≅Tilt_k(Ĥ). The integral equivalence identifies the normalized O-parity category with Tilt_O(Ĥ), through the O-flat perverse Satake category and the integral tilting reduction theorem. The characteristic assumption is goodness; neither very goodness nor the larger bounds of JMW16 Theorem 1.8 is required. (Feng24, Theorem 4.8 and Remark 4.9, p.23, Feng24 line 997; MR18, Corollary 1.6, p.6, MR18 line 273; §6.5, p.60, MR18 line 2734; MV07, Proposition 2.1, p.6, MV07 line 259.)

Build the good-prime perversity engine at its full stated generality: the modular exotic highest-weight category on the dual Springer resolution, the Kostant–Whittaker/Soergel comparison, its graded tilting generators and the derived-group, central-quotient and product reductions. In the complex model, for Ĥ a product of simply connected quasi-simple groups and general linear groups, with p very good for each quasi-simple factor, the equivalence between Iwahori-constructible parity sheaves on the Grassmannian of H and graded exotic tilting sheaves sends E_λ to the exotic tilting with label −λ and [1] to grading shift ⟨−1⟩ (MR18, §1.1, p.1, MR18 line 20; Theorem 1.1, p.3, MR18 line 105). Perversity for every Ĥ and every good p follows by the reductions, which replace Ĥ by a product of simply connected quasi-simple groups not of type A, for which good and very good agree, and of general linear groups (MR18, §6.5, p.60, MR18 line 2751; JMW16, Lemma 3.6, p.10, JMW16 line 415). Prove the constructible side for étale sheaves over F, where the one step of MR18 §3 that uses the complex loop-group presentation (the factorization of the equivariant-cohomology map through the diagonal) needs a characteristic-free argument (Feng24, proof of Theorem 4.8, p.23, Feng24 line 1007), and prove the O-flat lifting from the residue-field assertion. Another proof of the same good-prime theorem may replace this route; a stronger numerical bound does not prove the target.

*Proof route.* Use MR18 Theorem 1.1 under its hypotheses: the mixed/parity affine-Grassmannian category is related to the exotic coherent category on the Springer resolution of the dual group, compatibly with grading and tilting generators. Its Corollary 1.6 establishes perversity for every good prime: a Verdier self-dual object with no Hom to its shifts by n<−1 is perverse (MR18, Lemma 6.6, p.60), and the exotic side gives this vanishing for E_λ. The orbit-constructible and equivariant spherical perverse categories agree on each finite Schubert support (the étale form of MV07 Proposition 2.1), which gives the equivariant realization. The exotic/Soergel proof engine and its étale constructible side are not supplied by the characteristic-zero Springer roadmap; §4.5 supplies this comparison. Once perversity holds, Δ/∇-filtrations characterize the Satake images as tilting.

*Needs:* §4.4; §3.1; §3.2; §3.3.

**Checks.**

- For the GL₂ minuscule P¹ stratum, k[1] is perverse and maps to the corresponding two-dimensional fundamental tilting representation, both for p=3 and for p=2; both primes are good for GL₂, and Theorem 1.1 of MR18 applies to Ĥ=GL₂ directly, since it has no quasi-simple factor.

- For Ĥ=SL₂ (H=PGL₂) at p=2, the prime is good but not very good for A₁ (2 divides 2), so MR18 Theorem 1.1 does not apply to SL₂ itself; perversity comes from Theorem 1.1 for GL₂, whose derived group is SL₂, through the derived-group reduction (JMW16, Lemma 3.6(1), JMW16 line 415). A statement requiring very good p would wrongly exclude this case.

- For G₂, p=3 divides the highest-root coefficient 3, so 3 is bad and lies outside the theorem; p=2 is also bad for G₂. Zero maps to zero. Goodness is the exact theorem hypothesis; the general library remains unrestricted.


### 4.6 External products of normalized Grassmannian parity sheaves

For G=H^r, every normalized O-parity object on Gr_G≅(Gr_H)^r is a finite direct sum of E(λ₁)⊠⋯⊠E(λ_r). The external product is the normalized indecomposable extension on the product stratum. Its stalk and costalk cohomology are the graded tensor products of the corresponding finite free O-modules, including the Koszul symmetry signs. (Feng24, proof of Lemma 4.14, p.24; Theorem 4.8, p.23, Feng24 line 1066.)

*Proof route.* Use the Künneth theorem for finite free stalks and costalks, and dense-stratum normalization. Indecomposability follows either from the product tilting classification under Satake, using §3.3 and the integral-tilting-lifts contract for O and external products, or from the local endomorphism criterion. This direct-sum argument controls norm stalks without applying a nonadditive functor or a non-t-exact restriction to a perverse filtration.

*Needs:* §4.4; §4.5; §3.3; §3.4; LanglandsParameterStacks §LP3.0, gap:integral-highest-weight-orders, gap:integral-tilting-lifts; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- The product of the GL₂ minuscule generators is the constant O-sheaf on (P¹)ʳ shifted by r and has rank-one dense-stratum restriction. A direct sum of two generators stays a direct sum and is not mislabeled indecomposable.

- generators O[0], O[1], O[2]; dense ranks 1; E⊕E has dense rank 2 and is decomposable. Include zero factors, finite sums and Koszul signs.


### 4.7 The graded Hom formula and its composition law

For bounded constructible O-complexes E,F in the LL integral Tate setting, with trivial coefficient C_p-action and the finite-support coefficient hypotheses, the group of morphisms from T*ε*E to T*ε*F in Perf(Y;TO) is naturally the direct sum over i∈ℤ of the groups of morphisms from k⊗^L E to (k⊗^L F)[2i] in D^b(Y;k). Composition adds the indices using shifts. Require the stratified version with finite Hom groups. For normalized parity inputs whose cross-Hom groups in negative degrees vanish before and after reduction, prove nilpotence of the positive-degree endomorphism ideal; only on this domain do the positive degrees form the ideal used for lifting. The *-Tate-even and !-Tate-even subcategories, and hence the Tate-parity category, are Krull–Schmidt under the stated finite-stratification, finite-Hom and local-system hypotheses. (LL21, Proposition 4.6.1, p.14; Proposition 5.5.2, p.22, LL21 line 641; Feng24, display (4.2), p.22, Feng24 line 950.)

For the étale realization, replace topological simple connectivity by the specified constant-local-system class where appropriate, and prove restriction, composition, coefficient and periodicity compatibility on each finite Schubert support. More precisely, for every finite Schubert union of Gr_H over separably closed F of characteristic different from p, with the constant-local-system class and Λ=k,O, prove the JMW condition and parity Hom and Krull–Schmidt conclusions of §§4.1–4.4 and the graded Tate Hom formula and composition law of this section, compatibly with restriction, coefficient change and the chosen periodicity class. This étale realization is part of the present target, proved directly for étale sheaves rather than imported from the complex topology.

*Proof route.* Compare the periodic complete resolution with derived reduction, then compute quotient morphisms by stabilized Hom. Check naturality and the index-addition composition formula before projecting any grading. Run the argument in the étale coefficient setting itself, using the étale stalk and costalk computations of §4.4 on each finite Schubert support. Finite support and bounded Hom ensure the nonnegative endomorphism algebra has nilpotent positive ideal in the perverse case.

*Needs:* §1.6; §1.2; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; §4.4.

**Checks.**

- For `E=O_(P^1)[1]`, the Tate endomorphisms have index-zero k and index-one H²(P¹;k). Composition of homogeneous classes adds indices; at a point only index zero remains for degree-zero inputs.

- End_T(E)=k⊕k·h with indices 0,1; h²=0 since H⁴(P¹;k)=0; point degree-zero Hom=k. Composition adds indices before projection.


### 4.8 Tate parity and Tate-parity sheaves

In Perf_S(Y;TO), an object K is *-Tate-even when the Tate cohomology of i_λ*K vanishes in degree †(λ)+1 for each λ, and !-Tate-even uses i_λ!K. Tate-even requires both; Tate-odd means a shift by one is even, and Tate-parity means their direct sum. A Tate-parity sheaf is an indecomposable such object whose dense-stratum restriction is T*ε*L[dim Y_λ] for an indecomposable O-free local system L. The integral coefficient ring O is essential: the mod-p Tate unit has nonzero odd cohomology. (Feng24, Definitions 4.2 and 4.4, pp.20–21, Feng24 line 892; LL21, Definition 5.3.1, p.20, LL21 line 899.)

The API:

- Evenness is opposite-parity vanishing, not nonvanishing.

- Oddness is evenness after a one-shift and two-shifts preserve Tate parity.

- Record both ordinary and extraordinary stratum restrictions in the API.

*Proof route.* Define vanishing of the opposite parity of Tate cohomology on both restrictions. Normalized dense-stratum data is specified separately from arbitrary shifts and from existence.

*Needs:* §1.6; §4.1; §1.5.

**Checks.**

- At a point T*O is Tate-even and T*O[1] is Tate-odd.

- A regular O[C_p]-module projects to zero, hence satisfies both even and odd vanishing conditions.

- Replacing O by k makes the trivial Tate unit have odd Tate cohomology and fails the intended even-unit test.

- opposite groups T¹O=0, T⁰(O[1])=0; regular groups both 0; mod-p unit has T¹k=k. Use integral coefficients for the even unit.


### 4.9 Uniqueness of Tate-parity extensions

In the finite JMW integral Tate setting with simply connected strata and the stated finite-Hom hypotheses, with the specified constant-local-system substitute in positive characteristic, an indecomposable Tate-parity object has support the closure of one stratum and is determined by its restriction to the dense stratum. Existence is separate. If E(λ,L) is an O-parity sheaf with no negative self-Ext before and after reduction, then T*ε*E is the corresponding indecomposable Tate-parity sheaf. (Feng24, Proposition 4.3, p.21; Proposition 4.5 and its proof, pp.21–22, Feng24 line 906; LL21, Theorem 5.5.6, p.23; Proposition 5.6.3 and Theorem 5.6.4, p.24, LL21 line 1072.)

*Proof route.* Repeat support induction with Tate odd-Hom vanishing. For the inflated parity sheaf use the graded Hom formula: its degree-zero endomorphism ring is local, negative degrees vanish and the positive ideal is nilpotent. Thus its full endomorphism ring is local.

*Needs:* §4.8; §4.7; §4.3.

**Checks.**

- At a point the integral Tate unit is the normalized even generator. On P¹ the inflated normalized parity extension is indecomposable because its positive endomorphism ideal is nilpotent, even though that ideal is nonzero.

- End_T(O)=k; End_T(O_P¹[1])=k[h]/h² is local although h≠0. Negative self-Hom and nilpotence give indecomposability.


### 4.10 Modular reduction on the non-equivariant parity category

For a finite JMW stratification with simply connected strata (in positive characteristic: with the class of constant local systems, for which the same lifting argument applies), suppose all normalized O- and k-parity extensions exist. Then F=k⊗^L_O sends O-parity extensions to the corresponding k-parity extensions; for parity E,F′, Hom_O(E,F′) is finite free and k⊗_O Hom_O(E,F′)≅Hom_k(FE,FF′). Consequently Parity^0_S(Y;O)⊗_O k→Parity^0_S(Y;k) is an equivalence of additive categories. This statement is about the non-C_p-equivariant orbit-constructible category. Arbitrary C_p-equivariant reduction is not full. (JMW14, Remark 2.7, p.7; display (2.13) and Proposition 2.39, p.17, JMW14 line 785; Feng24, Lemma 4.16, p.26, Feng24 line 1126.)

*Proof route.* Use free even local-system Hom and induction across strata for Hom base change. Complete-local idempotent lifting and the existence/uniqueness of all parity extensions give essential surjectivity. For the equivariant non-example, the O[C_p]-augmentation ideal I has no C_p-invariants, but I/pI has nonzero C_p-invariants. This obstruction cannot be removed by forgetting the difference between equivariant and ordinary Hom.

*Needs:* §4.3; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- At a point ordinary Hom(O,O) reduces to Hom(k,k). The augmentation ideal I has no C_p-invariants but I/pI has nonzero C_p-invariants; this rejects full equivariant reduction without affecting the ordinary equivalence.

- Hom_O(O,O)⊗k=k=Hom_k(k,k); I^C₃=0, (I/pI)^C₃=k·u² has dimension 1. Reject full equivariant reduction.


### 4.11 Normalized parity categories

Parity^0_S(Y;Λ) is the full additive closure of unshifted normalized parity sheaves E(λ,L). Parity^0_S(Y;TO) is defined similarly using Tate-parity sheaves. For the lifting functor require all parity extensions to exist and the cross-negative-Hom condition Hom(E(λ,L),E(μ,L′)[n])=0 for all pairs and every n<0, together with the same condition after reduction. On Gr_H it follows from perversity, once §4.5 has been proved. (Feng24, Definition 4.7 and the paragraph after it, p.22, Feng24 line 965; LL21, Theorem 5.6.6, p.25, LL21 line 1120.)

The API:

- Every object is a finite direct sum of the normalized extensions.

- Use all ordinary/Tate morphisms between the normalized objects; do not replace Hom by isomorphism classes.

- Expose the uniform cross-negative-Hom assumption needed for graded projection.

*Proof route.* Take additive closures without adjoining arbitrary shifts. Distinguish negative self-Ext, enough for individual indecomposability, from cross-negative-Hom, needed for a functor on the whole additive category.

*Needs:* §4.2; §4.9; §4.10.

**Checks.**

- On a point Λ in degree zero is normalized; Λ[1] is not.

- T*O[2]≅T*O is normalized in the Tate category, but O[2] is not normalized in the ordinary category.

- Two perverse parity sheaves have no negative cross-Hom, so the full normalized Grassmannian category satisfies the lifting hypothesis.

- O normalized, O[1] and O[2] not; T*O[2]≅T*O; Hom_perverse(E,F[n])=0 for n<0. Require cross-negative-Hom for every pair, not only self-Hom.


### 4.12 Lifting normalized Tate parity

Under the hypotheses of §4.11, construct an additive k-linear functor L:Parity^0_S(Y;TO)→Parity^0_S(Y;k), taking E_T(λ,L₀) to E(λ,L₀/pL₀). On Hom use projection to index zero in §4.7, extended by matrices over finite sums. There is a natural isomorphism L T*ε*≅F on normalized ordinary parity objects and their ordinary morphisms. Writing F_T for coefficient reduction into the k-Tate category and I_k for trivial-action inflation followed by quotient, the identity I_k L≅F_T does not extend to every integral Tate morphism. (Feng24, §4.4 and diagram (4.3), p.22, Feng24 line 962; LL21, Theorem 5.6.6, p.25, LL21 line 1120.)

The API:

- L sends each normalized indecomposable to its k-parity lift.

- The Hom map is the degree-zero projection in the fixed comparison.

- L T*ε*≅k⊗^L_O on the ordinary normalized parity category, naturally on its morphisms.

*Proof route.* Use uniqueness/classification of normalized generators and the Hom formula. Cross-negative-Hom leaves only nonnegative indices; index zero of a composite is the composite of index-zero parts. Show independence of choices of decompositions by natural isomorphism.

*Needs:* §4.11; §4.7; §4.10.

**Checks.**

- L takes the integral Tate unit at a point to k and preserves its scalar endomorphisms.

- A nonzero index-one morphism in the Tate Hom sum is sent to zero.

- For ordinary normalized parity morphisms α, L(T*ε*α)=Fα; this test does not assert fullness of T*ε*.

- L(T*O)=k; L(h)=0; L(T*2)=2 mod p. Projection keeps index zero and is natural on ordinary inflated maps.


### Examples

On the GL₂ minuscule Schubert P¹, E=O[1] is normalized and perverse. Its integral Tate endomorphism algebra is k[h]/h², with h in index one and the identity in index zero. L sends h to zero and the identity to the identity. Coefficient reduction to the mod-p Tate category retains h, so object identification cannot supply naturality on every Tate map.

### Dependencies

Layers 0–3; the equal-characteristic Schubert/Demazure geometry; EnhancedDerivedSheaves E1.4; EtaleCohomologyFoundations recollement and smooth-pair purity. The modular exotic/Soergel comparison and its étale constructible side are §4.5 targets here.


## Layer 5: Cyclic norm and linear base change


### 5.1 The cyclic fixed Grassmannian is diagonal

For G=H^p with σ rotating factors, Gr_G≅(Gr_H)^p and Gr_G^σ≅Gr_H by the diagonal map, as ind-schemes on test rings. The stratum indexed by (λ₁,…,λ_p) meets this fixed locus exactly when all λ_i are equal, in which case the intersection is Gr_H^λ. Its dimension is d_λ on H and p d_λ on G, so the two dimension pariversities agree for odd p. (Feng24, Lemma 4.11, p.24; §4.6.3, p.26, Feng24 line 1036.)

*Proof route.* Apply the product description of loop groups and positive loops to the fppf quotient; test-ring fixed points force all components equal. Use the imported dimension formula d_λ=⟨2ρ,λ⟩. Equality mod two is not equality of the integer shifts.

*Needs:* §0.2; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract; §0.1.

**Checks.**

- For H=G_m the fixed coweight tuples are exactly (ν,…,ν). For a minuscule H-stratum of dimension 1, its p-fold source stratum has dimension p, hence equal parity for odd p but a different integer normalization.

- fixed tuples are (ν,ν,ν); equalizer on every test ring is X; dimensions 3 and 1 differ by 2. Use the full test-ring functor and only compare shifts after quotient.

- For p=2 and a dimension-one stratum, dimensions 2 and 1 have opposite parities. The Smith functor exists, while this dimension-pariversity normalization needs oddness.


### 5.2 The cyclic convolution norm

On the spherical symmetric monoidal category for G=H^p, define Nm(E)=E*σE*⋯*σᵖ⁻¹E with σ-linearization given by cyclic rotation through the fusion symmetry. On maps take the corresponding product of the σ-translates of a map. Define it on all k-Satake objects for every prime; for odd p good for Ĥ, also use the O-flat normalized parity domain of §4.5. It is a plain functor to the σ-equivariant category; it is neither additive nor O-linear before Smith projection. (Feng24, Definition 4.12 and display (4.4), p.24, Feng24 line 1045; JMW16, Theorem 1.5, p.2, JMW16 line 79.)

The API:

- Specify the C_p-equivariant structure and the coherence giving σ^p=1.

- Nm preserves identities and composition with the product-of-maps formula.

- For odd p good for Ĥ and normalized O-parity E the norm is again a perverse parity object, with the stated cyclic action.

- Nm(E⊕F)≅Nm(E)⊕Nm(F)⊕M, where M is a finite sum of objects induced from the trivial subgroup along the free cyclic orbits of mixed words (Feng §A.3).

*Proof route.* Use fusion associativity and the sign-corrected symmetry to construct the cyclic linearization and prove its p-th power is the identity. For odd p good for Ĥ, the parity–tilting comparison and tensor closure under Satake give closure on normalized parity objects; the all-k-Satake norm itself uses no goodness restriction.

*Needs:* §3.1; §5.1; §4.5 only for the normalized parity domain; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract.

**Checks.**

- For the convolution unit, Nm(1)=1 with trivial C_p-action.

- Nm(a·id_E) is aᵖ times the identity of Nm(E), so ordinary scalar linearity fails for general a∈k.

- Nm(E⊕F) contains the pure E and pure F terms and mixed cyclic orbits; before quotienting those mixed terms must remain.

- Nm(1)=1; α³=−α for α²=−1; expansion has 2 pure and 6 mixed terms. Construct cyclic coherence; norm is nonadditive before quotient.


### 5.3 Trivial and free cyclic summands in norm stalks

For odd p good for Ĥ and E a normalized O-parity object on `Gr_(H^p)`, the stalk and costalk cohomology of Nm(E) at every diagonal fixed point has a C_p-stable filtration whose associated graded is a direct sum of trivial O-free modules and free O[C_p]-modules. The statement here is restricted to the normalized Grassmannian parity objects used in BC. The direct-product basis argument applies to these normalized parity inputs. (Feng24, Lemma 4.14 and its proof, pp.24–25, Feng24 line 1059.)

*Proof route.* Decompose E into finite sums of external products of normalized parity extensions. Under the good-prime parity–tilting comparison of §4.5, for one external product, rotation and factorwise convolution give an external p-th power of a single parity object on H, whose finite free stalk and costalk cohomology have a Künneth basis. Cyclic permutation of basis tensors has orbits of size one or p. Koszul signs on a constant p-tuple multiply to +1 for odd p; on a length-p orbit absorb signs into a regular-module basis. Mixed summands from expanding a direct sum form induced cyclic orbits. No perverse filtration is pulled back through i*, and Nm is never applied to an exact sequence as an additive functor.

*Needs:* §5.2; §4.6; §3.4.

**Checks.**

- For a stalk with O-basis e₀,e₁ and p=3, the eight tensor words form two fixed words and two free orbits. On an odd-degree basis vector the sign of the length-three cycle is +1. Mixed direct-sum summands are induced.

- 8 words=2 fixed+2 orbits of size 3; odd constant word has cycle sign (−1)²=1; zero gives 0 words. Use basis-orbit decomposition of parity products.


### 5.4 Smith preserves parity with the cyclic stalk criterion

Let Y be a finite-dimensional smooth-stratified JMW variety with tame admissible C_p-action preserving each relevant stratum. If E is an equivariant O-parity object and its fixed-point stalk and costalk cohomology have C_p-stable filtrations with trivial O-free or free O[C_p] graded pieces, then Psm(E) is Tate-parity for the induced strata and induced pariversity. Assume the induced fixed stratification is JMW for the classification/lifting applications. For odd p good for Ĥ, application to Nm on `Gr_(H^p)` produces normalized Tate parity for the dimension pariversity on Gr_H; the general induced-pariversity assertion does not require oddness. (Feng24, Proposition 4.15, p.25; §4.6.3, p.26, Feng24 line 1090.)

If a fixed stratum is disconnected, refine it into its smooth connected components and restrict the induced pariversity to each component. Smooth-pair purity is used only for the cohomologically locally constant restriction on a smooth stratum, with i! identified with i*(−c)[−2c].

*Proof route.* For stalks use the trivial/free Tate formulas and the long exact sequence. For costalks use the !-presentation of Smith and the smooth-pair Gysin comparison. The fixed subscheme of the tame C_p-action on a smooth invariant stratum is smooth: apply ReductiveGroupsPartII §RG2.0a, *Edixhoven's tame fixed-point theorem*, as in the supplier contract, on invariant affine opens of the stratum around its fixed points (the norm of a function cutting out a basic open neighbourhood is invariant). Its tangent space is the fixed tangent subspace. The codimension purity shift is even. On the Grassmannian with odd p, p d_λ≡d_λ mod 2, while the difference of the two normalization shifts is even and hence disappears only in the Tate quotient.

*Needs:* §2.6; §1.4; §4.8; §5.3 for the norm application; EtaleCohomologyFoundations §§0.10, F.6; ReductiveGroupsPartII §RG2.0a, *Edixhoven's tame fixed-point theorem*; EtaleDualityAndPerverseSheaves §7.3; §5.1.

**Checks.**

- For the norm of a rank-one point sheaf, the fixed stalk is the trivial O-module and becomes the even Tate unit. A free orbit summand becomes zero. Compare the shifted dimension normalization for odd p explicitly.

- T⁰O=k,T¹O=0; regular groups 0; source shift 3 and target shift 1 differ by 2. The purity codimension shift is even; refine fixed components.


### 5.5 Additivity and Frobenius semilinearity on morphisms

For G=H^p and odd p good for Ĥ, on the ordinary normalized O-parity category of Gr_G, D=Psm∘Nm takes values in normalized Tate parity and is additive on objects and morphisms: D(f+g)=D(f)+D(g) and D(a f)=ā^p D(f), for a∈O and ā its image in k. Its canonical biproduct identifications are natural in both arguments. In particular D kills p times every Hom group. Only ordinary source parity morphisms are asserted here, with their norm-generated equivariant morphisms in the intermediate category. (Feng24, §4.6.3, pp.26–27; §A.3, p.57, Feng24 line 2575.)

*Proof route.* Expand the p-fold tensor/convolution product for a biproduct and for (f+g) in the symmetric monoidal category. The two constant words give the pure terms. Since p is prime every other word has an orbit of length p. The mixed sum of morphisms factors through an induced C_p-object; on the fixed locus it is a transfer through a perfect/flat group-ring complex, hence zero after T*. Verify this factorization on maps and its compatibility with composition, not only a direct-sum decomposition of objects. The scalar identity is the product of p copies of a; the integral Tate Hom formula reduces its action to ā^p. The factorization/coherence is a new proof target with these explicit steps, not a claim that Feng proves it.

*Needs:* §5.2; §5.4; §4.7.

**Checks.**

- For p=3 check the tensor cube of f+g: the six mixed words form two transfers through induced objects. On a scalar a∈O the output scalar is ā³, and a=p gives zero. Perform this calculation on maps, not only objects.

- 8 terms=2 pure+6 mixed=2 transfers; mixed classes 0; p maps to 0; α maps to α³=−α. Prove transfer factorization on maps and natural biproducts.


### 5.6 Frobenius twists and linearization of categories

For a k-linear category C define C^(p) with the same objects and the scalar extension of Hom_C(X,Y) along Frobenius on k, composition induced by tensor product. The tautological functor Fr_C is Frobenius-semilinear and has the universal property for such functors into k-linear categories. If a specific F_p-form C₀ and scalar-extension equivalence are given, define Fr_C₀:C→C by fixing C₀ and applying Frobenius to scalars. A Frobenius-semilinear functor D:C→E is linearized by D∘Fr_C₀⁻¹. The form is data, not an automatic choice for any k-linear category. (Feng24, Construction 4.17 and display (4.6), pp.26–27, Feng24 line 1162.)

The API:

- Frobenius-semilinear functors C→E correspond to k-linear functors C^(p)→E.

- A specified F_p-form gives the semilinear self-equivalence with a specified inverse.

- D∘Fr_C₀⁻¹ is k-linear and has the same underlying object assignment up to the form identification.

*Proof route.* Base-change each Hom space and its bilinear composition. Prove the universal property, then use perfectness of k and the supplied form to identify the twist with C. Keep the inverse Frobenius on the source.

*Needs:* Mathlib `frobeniusEquiv`; §0.1; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4.

**Checks.**

- In the one-object category with endomorphism algebra k, the tautological map sends a scalar to its Frobenius image after the form identification.

- Over k=F₉ choose a∉F₃; precomposing D(a·id)=a³D(id) with inverse Frobenius makes the result a·id.

- Changing the F_p-form changes the chosen self-equivalence data; without a form only C^(p) is canonical.

- Fr(α)=−α, Fr⁻¹(α)=−α; D(Fr⁻¹α)=α; zero maps to zero. A form specifies the self-equivalence; inverse Frobenius is on the source.

- At p=3 choose β∈F₂₇⊂k with β³−β−1=0. The polynomial has values −1 at 0, 1 and 2, hence is irreducible over F₃. Then Fr(β)=β+1, Fr⁻¹(β)=β⁹=β−1 and β²⁷=β. For the scalar map D(a)=a³, D(Fr⁻¹β)=β, whereas D(Frβ)=β−1≠β. This excludes precomposing source Frobenius; F₉ alone cannot distinguish it from its inverse.


### 5.7 The prime-field form of normalized parity

The ordinary normalized k-parity category on Gr_G has a specified F_p-form compatible with Satake and the integral split dual group. On each finite Schubert support, scalar extension on Hom and the normalized generators gives the form; the resulting semilinear Frobenius equivalence is compatible with tensor/convolution, pullback by geometric automorphisms and the normalized constant terms. A field-of-definition assertion for all arbitrary étale sheaves is unnecessary. (Feng24, display (4.6), p.27; the paragraph after Definition 4.18, p.27, Feng24 line 1198.)

Construct the scalar-extension equivalence on the additive category of normalized generators and all ordinary Hom groups, allowing the idempotent completion if needed. Its compatibility with the geometric norm/Smith maps and with CT is a target, rather than a field-of-definition claim about arbitrary étale sheaves.

*Proof route.* Construct the normalized parity generators and their ordinary Hom base change over F_p using the constant-local-system extension and reduction arguments of §§4.3–4.4 and 4.10. Descend their finite sums and summands, and verify scalar extension on finite-support Hom. For good p identify this form under Satake with the F_p-Chevalley dual group and its tilting generators. This must agree with the geometric form on the norm/Smith construction and its automorphism actions; that comparison, on each finite Schubert support of the étale Grassmannian over F, is part of the present target.

*Needs:* §§4.3–4.4; §4.10; §3.1 and §4.5 for the good-prime Satake identification; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; §5.6.

**Checks.**

- For a torus generator with rank-one endomorphisms, the chosen form acts by a↦a^p on scalars. Over F₉ a scalar outside F₃ checks the form and its inverse; over F_p it is invisible.

- Fr(2)=2 over F₃; Fr(α)=−α≠α over F₉. Check the prime-field form and its geometric compatibility.

- On the weight-zero torus generator over F₂₇, the form sends the scalar β to β+1 and its inverse sends it to β−1; cubing the latter gives β. An F₉-only test would miss the direction error.


### 5.8 The linear base change functor

For G=H^p and odd p good for Ĥ, define BC^(p):`Parity^0_(L^+G)(Gr_G;k)`→`Parity^0_(L^+H)(Gr_H;k)` by descending L Psm Nm through ordinary reduction. Its Hom map is Frobenius-semilinear. Define BC by precomposing BC^(p) with inverse Frobenius on the source F_p-form; this is k-linear and additive. Use ordinary orbit-constructible morphisms, with the proven equivariant realizations and only norm-generated intermediate C_p-morphisms. The source of descent is not the falsely asserted full C_p-equivariant reduction category. (Feng24, Definition 4.18 and diagram (4.7), p.27; §A.5, p.60, Feng24 line 1189.)

The API:

- BC^(p)F≅L Psm Nm naturally for ordinary integral parity morphisms.

- BC is additive and k-linear with the inverse Frobenius applied on the source.

- Changing integral lifts yields canonically isomorphic descent functors through the ordinary reduction equivalence.

*Proof route.* Additivity and annihilation of p Hom groups let L Psm Nm factor through O-Hom tensor k. The valid non-equivariant reduction equivalence gives the functor, uniquely up to natural isomorphism. Use the selected prime-field form to cancel Frobenius on source maps. Independence of integral lifts follows from full faithfulness of the reduced ordinary Hom functor.

*Needs:* §5.5; §4.12; §4.10; §5.7.

**Checks.**

- BC preserves zero objects and biproducts with natural inclusions and projections.

- BC(a·f)=a·BC(f), including a∈F₉\F₃; before linearization BC^(p)(a·f)=a^pBC^(p)(f).

- Replacing the source by arbitrary C_p-equivariant parity objects fails the augmentation-ideal Hom test and is forbidden.

- BC(0)=0; two pure summands survive; BC(αf)=αBC(f); equivariant reduction Hom changes dimension 0→1. Descend only through ordinary parity reduction after additivity.

- For a torus point generator with identity f, use the F₂₇ element β of §5.6. BC^(p)(βf)=(β+1)BC^(p)(f); inverse source Frobenius restores β, while source Frobenius would give β−1. This tests the chosen direction on an actual parity Hom space.


### Examples

A rank-two free stalk with basis e₀,e₁ has eight tensor words for p=3: two constant words and two free orbits of length three. The free orbits give induced summands and vanish after Smith projection. The cycle sign on an odd constant word is (−1)²=1. For α²=−1 in F₉, Frobenius sends α to −α; source inverse Frobenius followed by the norm restores α. For the F₂₇ witness β of §5.6, these compositions give β in the inverse direction and β−1 in the forward direction.

### Dependencies

Layers 2–4; GlobalShtukasAndFunctionFieldLanglands §1.5 convolution/fusion; the pinned Frobenius automorphism; ReductiveGroupsPartII §RG2.0a (tame fixed-point smoothness) and §RG2.5.1. The construction uses ordinary parity Hom base change, graded integral Tate Hom and cyclic transfer factorization.


## Layer 6: Constant terms and natural diagonal restriction


### 6.1 Hyperbolic localization and equal-characteristic constant terms

Choose B_H⊃T_H and a regular dominant cocharacter κ:G_m→T_H. On Gr_H the κ-attractors are S_ν with inclusions i_ν:S_ν→Gr_H and retractions p_ν:S_ν→{t^ν}. For bounded-support κ-monodromic étale complexes define CT_H=⊕_ν R(p_ν)! i_ν*, calculated on bounded Schubert supports, and CT_H^norm at ν by [⟨2ρ_H,ν⟩]. Here monodromic means in the triangulated subcategory generated by objects coming from κ-equivariant derived sheaves; an invariant support alone does not suffice. Define the repelling version as well and prove its natural agreement on this domain. Coefficients are k and O with the compatible adic conditions. (Feng24, §A.4, display (A.1) and Remark A.1, p.58, Feng24 line 2590; MV07, §3: Theorem 3.2, p.9; Theorems 3.5–3.6, pp.10–11, MV07 line 427; Braden03, Theorem 1, p.2; Lemma 6, p.5, Braden03 line 45.)

For a bounded Schubert piece choose normal equivariant local models, or prove the contraction argument there directly; Braden’s Theorem 1 assumes a normal variety and weak equivariance. Construct the attracting/repelling correspondence and its natural comparison on this precise domain, then glue through bounded supports. The input is the triangulated closure of equivariant objects, rather than a condition on support alone.

The API:

- The ν-component is RΓ_c(S_ν,i_ν*E)[⟨2ρ,ν⟩].

- The attracting !* and repelling *! descriptions agree naturally on the monodromic domain.

- Definitions agree on nested finite Schubert supports and commute with permitted coefficient change.

*Proof route.* Use the imported loop/Schubert geometry but construct these equal-characteristic modular functors here. Apply Braden’s natural transformation on equivariant linear/projective ambient models containing each bounded piece; the contraction lemma and open–closed localization prove it invertible on weakly equivariant generators, then on their triangulated closure. Patch bounded supports and finite coefficient levels, using the uniform adic contract gap:witt-adic-uniform-operations for O; the contraction and localization arguments are run directly for étale sheaves on the bounded pieces. The normalized shift convention is positive [⟨2ρ,ν⟩], so weight cohomology is in degree zero.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6; EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2 and its contract gap:witt-adic-uniform-operations; §2.2; §2.8.

**Checks.**

- For a split torus ρ=0 and the attracting loci are points; CT is the identity on its finite-supported sheaf category.

- For the spherical unit supported at t^0, CT^norm has just the zero-weight copy of Λ in degree zero.

- A sheaf supported on the non-invariant diagonal in A² with weights (+1,−1) need not have equal attracting and repelling localizations; monodromicity is required.

- ρ=0, CT=identity on point supports; CT(unit)=Λ at 0; nonmonodromic diagonal gives stalk k versus costalk k(−1)[−2]. Require monodromicity and specify attracting versus repelling maps.


### 6.2 Semi-infinite intersections at extreme weights

For dominant λ and the chosen positive Borel, the semi-infinite orbit indexed by w₀λ meets Gr_H^λ in the single point indexed by w₀λ. If that orbit meets Gr_H^μ with μ dominant in the same component, then λ≤μ in the dominance order. More generally the weights in Gr_H^μ lie in the Weyl-polytope of μ, and the intersection dimension is ⟨ρ,μ+ν⟩. These are scheme/étale-geometric statements on finite Schubert pieces, not formal consequences of a B_dR^+ Satake result. (MV07, Theorem 3.2, display (3.6) and the paragraph after it, p.9, MV07 line 356; Feng24, proof of Lemma A.3, p.61, Feng24 line 2742.)

The dimension formula is asserted only for a nonempty intersection S_ν∩Gr_H^μ, with μ dominant and ν a coweight in its Weyl polytope and component. Empty intersections have no dimension prescribed by that expression.

*Proof route.* Compute the antidominant intersection using loop-unipotent factorization; the opposite positive loops fix its coweight point. Use the Schubert order and torus weight polytope for the support exclusion. These are statements about the scheme-theoretic Grassmannian over F, proved with the supplied equal-characteristic geometry and its arbitrary-geometric-field contract, not transported from the complex Grassmannian.

*Needs:* §6.1; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.14 and the arbitrary-geometric-field contract.

**Checks.**

- For H=GL₂ and λ=(1,0), the antidominant semi-infinite intersection with the minuscule P¹ is one point. Its dimension from ⟨ρ,λ+w₀λ⟩ is zero; a larger Schubert support cannot be excluded without dominance.

- ⟨ρ,λ+ν⟩=0; intersection is one reduced point; ν=(2,−1) outside the Weyl polytope gives ∅. State the dimension only for nonempty intersections.


### 6.3 Normalized constant term is restriction to the dual torus

CT_H^norm is exact on the k-Satake heart and sends O-flat Satake objects to O-free finite-supported weight modules. It is symmetric monoidal and corresponds under modular Satake to restriction from Ĥ to T̂_H. For p good for Ĥ it preserves normalized parity, where a torus parity object is a finite sum of point-supported coefficient modules in degree zero. Its construction and natural transformations commute with the relevant coefficient extensions. (MV07, Theorems 3.5–3.6 and Corollary 3.7, pp.10–12; Propositions 6.3–6.4, pp.20–21, MV07 line 879; Feng24, display (A.1) and Remark A.1, p.58, Feng24 line 2628.)

*Proof route.* Use the semi-infinite dimension estimate and the perverse stalk/costalk inequalities to concentrate ν-cohomology in degree ⟨2ρ,ν⟩. Braden’s comparison identifies the two bounds. Fusion gives the convolution tensor decomposition of weight spaces, including the symmetry sign correction. During reconstruction of the dual group these weight functors define its torus, giving the claimed natural restriction comparison.

*Needs:* §6.1; §6.2; §3.1 for the full Satake assertion at every prime; §4.5 only for preservation of normalized parity at good primes.

**Checks.**

- For the minuscule GL₂ representation, normalized CT gives its two one-dimensional torus weights in degree zero. On the unit only weight zero remains. Tensor convolution gives the usual sum of weights.

- weight (1,0): RΓ_c(A¹,Λ[1])=Λ(−1)[−1], shift +1 gives degree 0; (0,1): Λ[1], shift −1 gives degree 0; square multiplicities 1,2,1. Pin the positive normalization and weight signs.


### 6.4 Smith commutes with normalized constant term

For G=H^p and odd p, take the diagonal κ-action commuting with cyclic rotation. On the bounded monodromic equivariant domains there is a natural equivalence CT_H^norm Psm≅Psm CT_G^norm in integral and mod-p Tate categories. Under the diagonal identification a fixed weight is (ν,…,ν); the G-shift p⟨2ρ_H,ν⟩ differs from the H-shift by the even integer (p−1)⟨2ρ_H,ν⟩. Use the fixed categorical periodicity isomorphism to compare them. (Feng24, Appendix A.1, pp.56–57; display (A.2), p.58, Feng24 line 2634.)

For every prime p, before normalization construct the natural equivalence CT_H Psm≅Psm CT_G on these same bounded monodromic equivariant domains. This statement uses no parity-perversity hypothesis; the additional normalized comparison above uses oddness.

*Proof route.* On each attracting correspondence use pullback compatibility and the compact-support Smith theorem. Restrict to fixed weights and track the componentwise normalization shifts through the chosen periodicity class. Check coherence on maps and nested supports; equality of parities by itself is not a natural isomorphism.

*Needs:* §2.9; §2.8; §6.1; §5.1; §1.2.

**Checks.**

- At a diagonal weight ν, compute p⟨2ρ,ν⟩−⟨2ρ,ν⟩ explicitly and use the chosen two-periodicity generator. For a torus all shifts vanish. An arbitrary nonfixed weight has no fixed-locus contribution.

- 3·1−1=2; 3·(−1)−(−1)=−2; torus shifts 0; tuple (1,0,0) has empty diagonal intersection. Use the chosen periodicity class with integer powers. At p=2 and ⟨2ρ,ν⟩=1 the shift difference is 1, which two-periodicity cannot remove; the unnormalized six-operation square still exists.


### 6.5 Constant terms, lifting and base change

For p good for Ĥ, on normalized integral Tate parity objects of Gr_H, CT_H^norm commutes naturally with L after passage to the normalized torus parity category. For G=H^p and odd p good for Ĥ, consequently CT_H^norm BC≅BC_T CT_G^norm naturally on ordinary normalized k-parity objects. The proof must use the graded Hom formula with composition and coefficient-change compatibility, rather than essential surjectivity of T*ε* alone. (Feng24, Lemma A.2 and its proof, diagrams (A.3)–(A.5), pp.59–60, Feng24 line 2648.)

*Proof route.* For inflated ordinary parity objects compare both composites with ordinary reduced CT. Under §4.7 the normalized CT map preserves the integer index, because the construction commutes with coefficients and the periodicity class. Its target is a finite sum of point-supported degree-zero modules, so positive-index ordinary Hom there is zero. Projection to index zero therefore commutes with CT on every Tate morphism. Extend across decompositions by naturality, then use the full ordinary reduction equivalence for BC, tensor compatibility for Nm and the fixed prime-field form. This avoids asserting that inflation is full. The graded comparison is proved in the étale realization, using the étale form of the Hom formula of §4.7.

*Needs:* §6.3; §6.4; §4.12; §4.7; §5.8.

**Checks.**

- For normalized torus objects, Hom(E,F[2i]) is zero for i>0 and i<0. Check that the image of the P¹ positive-index Tate class is killed on the torus, using graded CT compatibility; objectwise essential surjectivity cannot replace this test.

- Hom(k,k[2i])=0 for i≠0; h of index 1 maps to 0 on CT; index-zero scalar remains itself. Require graded CT compatibility, not only object surjectivity.


### 6.6 Base change for a split torus on objects and maps

For H a split torus with cocharacter lattice X_*(H), BC takes the point object at (ν₁,…,ν_p) on `Gr_(H^p)` to the point object at ν₁+⋯+ν_p on Gr_H. On a scalar endomorphism a it acts by a after inverse Frobenius, not a^p. On arbitrary finite sums its action is the corresponding matrix/block map. Under torus Satake this is naturally diagonal restriction. (Feng24, §A.5, p.60, Feng24 line 2707.)

*Proof route.* The norm sums the p coweights in every factor and fixed restriction is the diagonal point. Compute the norm on scalar maps as a^p, then precompose source inverse Frobenius. Torus rational representations decompose by weights; additivity extends the scalar computation to all matrices and yields naturality.

*Needs:* §5.8; §6.3; ReductiveGroups Layer 4.

**Checks.**

- For H=G_m, p=3 and coweights (2,−1,4), the output is weight 5. A scalar a∈F₉ outside F₃ is unchanged after linearization; without inverse Frobenius it becomes a³.

- sum=5; BC(α)=α whereas unlinearized value=−α; a 2×2 matrix is sent entrywise unchanged within the same output weight. For β∈F₂₇ as in §5.6 the correct linearization gives β, and the opposite direction gives β−1. Extend the calculation to all morphisms via biproducts.


### 6.7 Objectwise diagonal restriction

For G=H^p and odd p good for Ĥ, for every normalized k-parity object E on `Gr_(H^p)`, Sat_H(BC(E)) and Res_Δ(Sat_G(E)) have naturally identified T̂_H-restrictions, once §6.5 has been proved. Therefore their characters agree and the two tilting objects are isomorphic. This conclusion alone does not produce an Ĥ-equivariant natural isomorphism of functors. (Feng24, Theorem 4.20, pp.27–28; §§A.4–A.5, pp.58–60, Feng24 line 2701.)

*Proof route.* Apply normalized constant terms and the torus functor comparison. Triangular tilting characters then determine the object isomorphism class. State separately which weight comparison is natural; no lifting of weight-space maps is inferred from faithfulness.

*Needs:* §6.5; §6.6; §3.4.

**Checks.**

- For source external tiltings T(λ₁)⊠⋯⊠T(λ_p), the output character is the product of the factor characters. This identifies its tilting isomorphism class and its torus weights, while leaving equivariance of the chosen comparison open.

- (x+x⁻¹)³=x³+3x+3x⁻¹+x⁻³; ch T(3)+ch T(1) has the same integer multiplicities 1,3,3,1 and dimension 8. Characters take integer multiplicities even in characteristic 3.


### 6.8 Equivariance of the base change comparison maps

For G=H^p and odd p good for Ĥ, construct, for every tilting V of Ĥ^p, an invertible Ĥ-equivariant map α_V:Sat_H BC Sat_G⁻¹(V)→Res_Δ V whose restriction to T̂_H is the natural torus/constant-term comparison and for which α_W BC(f)=Res_Δ(f) α_V for every tilting morphism f:V→W. The exact missing assertion is equivariance of the existing weight-space comparison, not equality of tilting characters. (Feng24, §A.4, the paragraph after the proof of Lemma A.2, p.60, Feng24 line 2701.)

The source of the naturality identity is V and its target is W after applying the two actual functors: α_W ∘ (Sat_H BC Sat_G⁻¹)(f) = Res_Δ(f) ∘ α_V. Require the same components to commute with both simple-root subgroups and the torus, and prove coherence with the coefficient form. This is a theorem target needed to pass from weight comparison to a natural Ĥ-comparison.

*Proof route.* For natural dual-group equivariance, prove that the weight comparison intertwines each simple-root subgroup of Ĥ, for example by constructing compatible rank-one Levi comparisons and their Chevalley generators. Then the torus and root subgroups generate Ĥ, so components are Ĥ-equivariant; their weight-level naturality proves naturality. Prove the rank-one compatibility, including the selected comparison components, before invoking faithful torus restriction. Alternatively supply a direct tensor/fibre-functor construction with the same normalized components.

*Needs:* §6.7; §6.5; §6.6; §3.3.

**Checks.**

- For dual SL₂, verify the comparison commutes with the upper and lower root subgroup operators as well as the diagonal torus. A diagonal weight-space automorphism with unequal scalar entries supplies a torus-intertwiner that need not pass this test.

- DU=[[1,1],[0,2]]; UD=[[1,2],[0,2]]; D commutes with torus but DU≠UD. Require upper and lower root-subgroup intertwining and naturality.


### 6.9 Feng’s Satake base change theorem

For separably closed F of characteristic different from p, H connected reductive, G=H^p with cyclic rotation, k=Fbar_p, and odd p good for Ĥ, the k-linear additive functor BC on normalized Grassmannian parity objects corresponds, under modular Satake and the parity–tilting equivalences, to restriction along the diagonal Ĥ→Ĥ^p. The comparison is an isomorphism of functors, natural in every tilting morphism. The natural comparison uses the root-subgroup-equivariant components of §6.8. (Feng24, Theorem 4.20 and footnote 11, pp.27–28; Appendix A, pp.56–61, Feng24 line 1209.)

*Proof route.* After the root-subgroup comparison supplies actual equivariant comparison components, use their naturality and invertibility to identify the functors. Diagonal restriction lands in tiltings by tensor closure. The torus and objectwise results are established as separate weaker targets, so this final theorem is not silently substituted by a character identity.

*Needs:* §6.8; §4.5; §5.8; §3.4; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2.

**Checks.**

- For H a torus, recover the full natural formula of §6.6. For dual SL₂ and an external product of standard tiltings, require intertwining of both root subgroups on every component; equality of characters is insufficient.

- torus (2,−1,4)↦5; diagonal SL₂ tensor dimension 2³=8; root operators must agree on α components. A character identity does not supply the natural comparison.


### Examples

For the minuscule GL₂ P¹, the two weights are ν₊=(1,0) and ν₋=(0,1). Their attracting intersections are A¹ and a point. With E=Λ[1], compact cohomology is Λ(−1)[−1] and Λ[1]; the shifts +1 and −1 put both in degree zero. For p=3 the source/target normalization differences are +2 and −2, compared using inverse powers of the same periodicity class.

### Dependencies

Layers 1–5; equal-characteristic bounded Schubert geometry; EtaleCohomologyFoundations compact supports; the explicit adic contract and the étale forms of §§4.4–4.7. The natural reductive endpoint additionally needs §6.8 root-subgroup equivariance.


## Layer 7: Exactness, descent and the integral norm image


### 7.1 Conservativity of Tate constant terms

On the κ-monodromic orbit-constructible k-coefficient Tate category of Gr_H with finite Schubert support, CT_H^norm is conservative: CT(K)=0 implies K=0, hence CT detects equivalences. Extend to an ind object only when the support argument or a filtered-piece detection theorem applies; the finite-support result is enough for exactness of a fixed finite-dimensional Satake sequence. (Feng24, Lemma A.3, p.61, Feng24 line 2742.)

*Proof route.* Choose a maximal dominant λ among the finitely many strata supporting K. The support exclusion and extreme point calculation identify its lowest-weight constant term with the stalk at the point indexed by w₀λ; all other supported strata are excluded. Orbit constructibility and homogeneity show this stalk cannot vanish if K is nonzero on that stratum. Apply to a cone to detect isomorphisms. The unnormalized CT is conservative as well, since each weightwise normalization is an invertible shift.

*Needs:* §6.1; §6.2; §1.1.

**Checks.**

- For a nonzero finite-support Tate object choose a maximal supported Schubert stratum and its antidominant point; CT detects that restriction. The zero object is detected as zero. Do not infer conservativity from faithfulness of a representation forgetful functor.

- CT(0)=0; lowest-weight component of the minuscule generator has rank 1 and detects it. Use finite support and orbit-constant restrictions in the quotient.


### 7.2 Exactness of the mod-p Smith norm on Satake

For any prime p and every short exact sequence 0→V′→V→V″→0 in finite-dimensional rational Rep_k(Ĥ^p), the sequence obtained by Fr⁻¹, geometric Satake, Nm and Psm is a distinguished triangle in the constructible k-Tate category, with the comparison from the cone to the third term specified by the enhanced construction. This is an exactness assertion for the composite into the Tate quotient, not exactness of Nm as an additive functor before quotienting. (Feng24, Lemma 4.21, p.28; §A.6, p.61, Feng24 line 1228.)

Here Fr⁻¹ on the full rational representation category is inverse coefficient Frobenius on algebraic comodules for the chosen split F_p-Chevalley form, transported to the Satake heart. Construct this semilinear equivalence and its inverse on all finite-dimensional comodules; its restriction to tiltings agrees with §5.7. It changes coefficient descent data, and is not pullback of a representation along the algebraic-group Frobenius isogeny.

The morphism-level transfer argument is also proved on all k-Satake maps used here, not only integral normalized parity maps: after fixed restriction the mixed p-fold summands factor through k[C_p]-induced complexes on the bounded support. This supplies additivity on the full heart. Construct the canonical cone comparison in the enhancement from the p-cube of the short exact sequence, then prove it invertible by CT; no arbitrary choice of a cone map is used.

*Proof route.* Construct the cone comparison using the functorial p-cube associated to the two maps and their canonical zero composite in the perverse heart; this avoids an arbitrary cone comparison. Apply unnormalized CT, which is symmetric monoidal on the full Satake heart with its weight gradings, commutes with Smith and detects equivalences on the finite support. The shifts of §6.4 are unnecessary for this equivalence test; do not invoke the odd-prime normalized square at p=2. The representation sequence splits after restriction to a torus. Mixed cyclic terms vanish in the Tate quotient, so the torus case reduces to additive split exactness.

*Needs:* §7.1; the unnormalized Smith/constant-term comparison of §6.4 (no oddness); §6.3 on the full Satake heart (no goodness); the all-k-Satake transfer argument in this section; §5.2; §5.6; ReductiveGroups Layer 1 and §9 for algebraic comodules over the chosen split form.

**Checks.**

- For a split short exact sequence of torus representations, mixed terms form free cyclic orbits and the image triangle splits. For a nonsplit rational reductive sequence, CT makes it split; conservativity detects the enhanced cone comparison.

- 0→k→k²→k→0 gives two pure summands after quotient; Δ(3) has weight multiplicities 1 at ±3,±1 and restricts to a split torus sequence of dimensions 2,4,2. Construct the enhanced cone map before using CT conservativity.

- At p=2 the square of a two-summand object has two pure terms and one induced orbit of size two; only the two pure terms survive in the k-Tate quotient. On the standard two-dimensional SL₂ representation, coefficient Frobenius preserves weights +1 and −1 and dimension 2; pullback along the group Frobenius instead gives weights +2 and −2. This distinguishes the equivalence used here from a Frobenius-twisted representation.


### 7.3 Continuous equivariantization of the parity category

For a discrete group Γ acting coherently on an additive category C, define the equivariantization of C by objects E with isomorphisms u_γ:γE→E such that u₁ is the unit isomorphism 1E≅E of the action and u_γδ=u_γ∘γ(u_δ) after inserting the action's composition isomorphism γ(δE)≅(γδ)E, and by morphisms commuting with every u_γ. For profinite Γ and the k-parity categories here require continuity on the finite coefficient/support data; formulate O-descent as a compatible adic system. A coherently Γ-equivariant functor induces a functor of these equivariantizations. For enhanced derived sheaves use homotopy-coherent descent before taking the desired parity subcategory: fixed objects of an ordinary derived homotopy category are not asserted to equal the equivariant derived category. (Feng24, §4.6.4, p.28, Feng24 line 1234.)

The API:

- The forgetful functor retains an object of C and exposes each descent map.

- The structure map for γδ is u_γ∘γ(u_δ), using the composition isomorphisms of the action, and u₁ is its unit isomorphism; every u_γ is invertible.

- A coherently Γ-equivariant functor sends descent data to descent data and intertwining maps to intertwining maps.

*Proof route.* Write the cocycle and intertwining conditions, including coherent structure of the group action. For arithmetic descent work with continuous finite-level Galois descent and its enhancement; then restrict to the parity objects with descent data.

*Needs:* §0.3; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; EnhancedDerivedSheaves §§E1.3, E3.4.

**Checks.**

- For Γ trivial, equivariantization recovers C: u₁ must be the identity of E. The pair (k,0) on finite-dimensional k-vector spaces satisfies the multiplication law u₁=u₁∘u₁ but violates the unit law and is not invertible, so it is excluded; without the unit law the equivariantization would contain such extra objects.

- For a trivial action on finite-dimensional k-vector spaces and finite Γ, equivariant objects are actual k[Γ]-representations and intertwining maps.

- For Γ=∏ℕ C₂, a nonzero F₂-linear functional on Γ/(⊕ℕ C₂) yields a discontinuous sign character on a one-dimensional F₃-space: every finite-support element acts by 1 and some element acts by −1. Its cocycle holds but its kernel contains a dense proper subgroup and is not open, so continuity excludes it.

- For Γ=S₃, take its permutation action on k³. The transposition matrices P₁₂ and P₂₃ satisfy (P₁₂P₂₃)³=1 and P₁₂P₂₃≠P₂₃P₁₂. The descent cocycle uses this ordered product and does not assume that Γ is abelian.


### 7.4 Galois equivariance and descent of base change

For odd p good for Ĥ, let H descend to F₀⊂F and `G=Res_(E0/F0)(H_E0)` for a cyclic degree-p extension E₀/F₀. After choosing a geometric splitting G_F≅H_F^p, Γ=Gal(F/F₀) acts compatibly with the cyclic norm construction. BC is coherently Γ-equivariant on normalized k-parity objects with the chosen prime-field form. Prove that the natural Ĥ-comparison of §6.9 is Γ-equivariant, and that its equivariantization identifies the descended BC with restriction along the diagonal map of geometric L-groups, with the same cyclotomic normalization on both sides. (Feng24, Lemma 4.22, p.28; Corollary 4.23, p.29, Feng24 line 1239.)

For continuous Galois descent take F to be a separable closure of F₀, so Γ=Gal(F/F₀) is a profinite group. For a merely separably closed overfield the automorphism-group statement is formulated separately and does not identify it with the absolute Galois group. Prove Γ-equivariance of the actual comparison components as part of the descended natural theorem.

*Proof route.* Reuse separable Weil-restriction splitting and the integral dual Galois action. Norm, fixed restriction, coefficient change and the chosen lifting/Frobenius comparisons commute with Γ. Descend using the full ordinary parity reduction equivalence and check the cocycle, not only a family of object isomorphisms. For the L-group comparison require the components in the root-subgroup comparison to respect Γ; character equality is insufficient.

*Needs:* §7.3; §5.8; ReductiveGroupsPartII §RG2.0a; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; §6.9.

**Checks.**

- For trivial Γ recover BC. For a cyclic permutation of geometric Weil-restriction factors, check the descent cocycle around the full orbit. A family of object isomorphisms without a cocycle is not descent.

- trivial descent recovers BC; three cyclic permutations compose to identity and uγ γ(uγ) γ²(uγ)=1. Specify F as a separable closure of F₀ for Galois descent.


### 7.5 The valid objectwise integral comparison

Let F_T:Perf_S(Y;TO)→Perf_S(Y;Tk) be derived coefficient reduction, and I_k=T*ε*_k:D^b_S(Y;k)→Perf_S(Y;Tk). For a normalized integral Tate-parity object K, there is an object isomorphism I_k L(K)≅F_T(K). It is natural on morphisms arising by inflation of ordinary normalized O-parity morphisms. It is not claimed natural on every Tate morphism. Smith commutes naturally with coefficient reduction on its valid domain, without using this stronger false right face. (Feng24, Lemma 4.24 and diagrams (4.8)–(4.10), pp.29–30, Feng24 line 1273.)

The naturality subcategory here is the image of ordinary normalized O-parity maps under inflation and quotient. It is not the full subcategory on the same Tate objects.

*Proof route.* Choose the ordinary parity generator for K and use L T*ε*≅F; extend to finite sums. Ordinary inflated maps occupy index zero, where the comparison is natural. In the GL₂ minuscule closed Schubert variety P¹ with E=O[1], the class H²(P¹;k) gives an index-one Tate morphism: L kills it, whereas coefficient reduction to the k-Tate category retains it. Thus essential surjectivity cannot promote the object comparison to a natural transformation on all Tate maps.

*Needs:* §4.12; §4.7; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4; §2.6.

**Checks.**

- On the integral Tate unit the comparison is the coefficient quotient O→k. On P¹ with E=O[1], the object comparison holds while a nonzero index-one endomorphism disproves its naturality on every Tate map.

- objects reduce to k-unit; L(h)=0, but F_T(h)=h≠0 of index 1. State naturality only on ordinary inflated maps.


### 7.6 The integral comparison on norm-generated morphisms

For G=H^p and odd p good for Ĥ, let D=Psm Nm on ordinary normalized O-parity objects. Construct coherent object identifications F_T D(E)≅I_k L D(E) that intertwine F_T D(f) with I_k L D(f) for every ordinary parity morphism f, and are compatible with reduction and inverse Frobenius. This gives the natural back-face comparison needed by the global Tate-cohomology consumer. Only the norm-generated maps are in this target; arbitrary integral Tate maps are excluded. (Feng24, Lemma 4.24, pp.29–30; proof of Proposition 5.12(i), p.39, Feng24 line 1742.)

Prove this natural comparison on every ordinary normalized integral source map. One sufficient route is an index-zero theorem for its norm-generated image; another is annihilation of every positive-index component by coefficient reduction with coherent object identifications. The objectwise comparison alone supplies neither assertion.

*Proof route.* For the integral norm-image comparison, control the positive-index terms of D(f) in the integral Tate Hom formula relative to coherent choices of the normalized lifts. A sufficient condition is that norm-generated morphisms have only index zero; a weaker sufficient condition is that all remaining terms are killed by F_T. Neither follows from objectwise normalization or from additivity. Supply a proof of one such condition, or a direct comparison natural in f. The P¹ endomorphism h distinguishes this norm-generated domain from the full Tate category.

*Needs:* §7.5; §5.5; §5.8.

**Checks.**

- At p=3 take H=G_m, the point object O² at the coweight (0,0,0) of `Gr_(H^3)`, and the endomorphism f with matrix [[1,[β]],[0,1]], where [β] is the Teichmüller lift of the F₂₇ witness β of §5.6. In f^⊗3 the eight tensor words are the two fixed words e₁e₁e₁, e₂e₂e₂ and two free orbits of size three; f^⊗3(e₂e₂e₂)=[β]³e₁e₁e₁+[β]²N(e₁e₁e₂)+[β]N(e₁e₂e₂)+e₂e₂e₂, and the two orbit terms lie in the norm image. In the bases of the fixed words, F_T D(f) and I_k L D(f) are both [[1,β+1],[0,1]] over k, since β³=β+1; a comparison identifying D(f) with the reduction [[1,β],[0,1]] of f fails the square. At a point all Tate Hom has index zero, so this Check tests the fixed-word computation and the Frobenius power, while the next Check tests the restriction of the domain.

- norm scalar 2³ mod 3=2 on both sides; arbitrary h gives F_T(h)=h but I_k L(h)=0. Prove a separate natural square on the norm-generated domain.


### Examples

For the standard SL₂ representation in characteristic 3, the torus endomorphism diag(1,2) fails upper-root equivariance: multiplying [[1,1],[0,1]] on the two sides gives top-right entries 1 and 2. Thus faithful torus restriction detects equality of existing Ĥ-maps, but cannot construct them. The norm-image integral comparison separately checks the natural square on ordinary source maps.

### Dependencies

Layers 2–6; EnhancedDerivedSheaves E3.4 coherent descent; ReductiveGroupsPartII §§RG2.0a, RG2.5.1–RG2.5.2. Exactness uses the all-k-Satake morphism argument of §7.2; the stronger integral naturality is §7.6.


## Layer 8: Algebra Tate diagonal and characters


### 8.1 The Tate diagonal of a commutative algebra

For a commutative ring A, a prime p and a ring automorphism σ with σᵖ=1, define `fixedSubring` as the equalizer of σ and the identity. Define `cyclicTransfer` by Tr(a)=Σᵢ₌₀ᵖ⁻¹ σⁱ(a) and `cyclicNorm` by Nm(a)=Πᵢ₌₀ᵖ⁻¹ σⁱ(a). Define `transferIdeal` as the ideal in the fixed subring generated by transfer values, and prove that it is exactly the transfer image. Put T⁰(A)=A^σ/Tr(A). Prove `algebra_tate_diagonal`: there is a unique unital ring homomorphism Δ_p:A→T⁰(A) whose value at a is the class of Nm(a). No characteristic hypothesis on A is imposed: p·b=Tr(b) for fixed b, so p lies in the transfer ideal and T⁰(A) is always an F_p-algebra. Feng24 states the definition for algebras in characteristic p; the orbit proof uses only primality of p and σᵖ=1. When A is an F_p-algebra the F_p-linearity of Δ_p is automatic; if A is a k-algebra and σ is k-linear, Δ_p(λa)=λᵖΔ_p(a). This includes p=2 and the zero quotient. The underlying additive quotient is compared with the pinned module Tate group. (Feng24, Definition 5.14, p.42, Feng24 line 1863.)

The API:

- For `fixedSubring`, use the native equalizer membership criterion σ(a)=a and its inherited ring operations; no periodicity hypothesis is needed to form it.

- For `cyclicTransfer`, prove additivity, Tr(1)=p, invariance under σ when σᵖ=1, and b·Tr(a)=Tr(ba) for every fixed b. The finite sum is defined even when its values are not invariant.

- For `cyclicNorm`, prove multiplicativity, Nm(1)=1, invariance when σᵖ=1, and Nm(ba)=bᵖNm(a) for fixed b. Additivity is asserted only after passage to the transfer quotient.

- For `transferIdeal`, construct the ideal in the fixed subring and prove its elements are exactly the transfer image under σᵖ=1.

- Δ_p(a) is the quotient class of the cyclic product, and its additive defect is an explicit transfer.

- Equivariant algebra homomorphisms induce T^0 maps commuting with Δ_p, including the Frobenius scalar law.

*Proof route.* Prove Tr(A) is additively closed and b Tr(a)=Tr(ba) for fixed b. Expand Nm(a+b); nonconstant binary words form free cyclic orbits, and each orbit sum is a transfer. Multiplicativity and the unit are direct. Match the underlying additive quotient with H0IsoNormQuotient without claiming that existing additive Tate cohomology already supplies this ring homomorphism.

*Needs:* §0.1; Tau Ceti `TauCeti.TateCohomology.H0IsoNormQuotient`.

**Checks.**

- For trivial σ, Tr=0 in characteristic p and Δ_p(a)=a^p, so over F₉ it is not the identity on all scalars.

- For A=B^p with cyclic factor rotation, transfer surjects onto the diagonal invariants and T^0(A)=0, including its unit as the zero ring.

- For A=k[x₀,…,xₚ₋₁] with cyclic permutation, Nm(x₀)=∏x_i and every mixed orbit sum in Nm(a+b) is killed; the transfer ideal is inside A^σ, not the ideal it generates in all of A.

- Δ(x)=xᵖ; Tr(B³)=diag B so T⁰=0; Δ(ε)=εᵖ=0; p=2 mixed sum aσb+bσa=Tr(aσb). The transfer ideal belongs to invariants; allow the zero quotient.

- For the fixed subring, identity σ fixes every element; rotation on k³ fixes precisely (a,a,a); in k[x₀,x₁,x₂] the element x₀ is not fixed. Equality in the native equalizer excludes a coefficient-ring-only model.

- For transfer at p=3, trivial action gives Tr(a)=3a=0, rotation on k³ sends (a,b,c) to (a+b+c,a+b+c,a+b+c), and permutation variables give Tr(x₀)=x₀+x₁+x₂. At the total-function input p=0 the empty sum is 0; at p=1 it is a. No prime-order theorem is asserted at either length.

- For norm at p=3, trivial action gives a³, rotation on k³ gives the diagonal value abc, and permutation variables give Nm(x₀)=x₀x₁x₂. At p=0 the empty product is 1, distinguishing it from transfer; at p=1 the product is a. Norm sends 0 to 0 for prime p and 1 to 1.

- For the transfer ideal, identity action on a characteristic-p algebra gives the zero ideal, cyclic kᵖ gives the unit ideal of the diagonal subring, and the zero source ring gives the zero ring again. The image identity b·Tr(a)=Tr(ba), for fixed b, proves that taking the span introduces no extra elements.

- Primality is essential for the stated orbit proof: for length four and an automorphism of order two on F₂[x,y] interchanging x,y, the four-term transfer is zero but Nm(x+y)−Nm(x)−Nm(y)=(x+y)⁴≠0. Length four is outside the theorem, even though four is zero in this ring.

- For A=F₂[x]/(x³) and σ(x)=x+x², the fixed subring is F₂+F₂x², Tr(A)=(x²), and Nm(x)=x², so Δ₂(x)=0 in the quotient F₂. For A=F₃[x]/(x⁴) and σ(x)=x+x³, the fixed subring is F₃+F₃x²+F₃x³, Tr(A)=0 and Δ₃(x)=x³≠0. A nilpotent input need not have zero Tate diagonal. Both automorphisms have the required prime period.

- No characteristic hypothesis on the source: for A=ℤ, σ=id and p=2 the fixed subring is ℤ, the transfer ideal is 2ℤ and Δ₂(a)=a² mod 2=a mod 2 is reduction. For A=ℤ[i] with complex conjugation and p=2 the fixed subring is ℤ, Tr(a+bi)=2a, the transfer ideal is 2ℤ, and Δ₂(a+bi)=a²+b² mod 2=a+b mod 2 is the ring homomorphism ℤ[i]→F₂ with kernel (1+i). A hypothesis p·1=0 in A would exclude both, although the theorem holds.



### 8.2 Unique extension of a Tate character

For a commutative ring A and σᵖ=1, with p prime, let κ be a perfect field of characteristic p and A′ a unital subring of A^σ containing every norm and transfer. Prove `tate_character_extension`: each unital ring homomorphism χ:A′→κ annihilating transfers has exactly one unital ring-homomorphism extension χ̃:A→κ. Its value is Frob_κ⁻¹(χ(Nm(a))). As in §8.1 no characteristic hypothesis on A is needed: χ kills Tr(1)=p·1 in any case. If A is a k-algebra, σ is k-linear, κ=k and χ is k-linear, the extension is k-linear. For A′=A^σ this gives the restriction bijection between σ-invariant k-algebra characters of A and k-algebra characters of T⁰(A). (Feng24, Lemma 5.15 and display (5.20), p.42, Feng24 line 1869; TV16, §3.4, display (3.4.1), pp.11–12, TV16 line 512.)

*Proof route.* The additive-defect transfer formula and multiplicativity prove the displayed map is a ring homomorphism. For a′∈A′ use Nm(a′)=a′^p to check extension. Any other extension annihilates all transfers, so the sum of its p cyclic translates is zero. If its orbit had length p these would be distinct multiplicative characters, contradicting the existing linear-independence theorem; hence it is σ-invariant. Taking the p-th power then determines its value uniquely by perfectness.

*Needs:* §8.1; Mathlib `frobeniusEquiv`; Mathlib `linearIndependent_monoidHom`.

**Checks.**

- For trivial σ on A=k[x], A′=A and κ perfect, the formula Frob⁻¹(χ(a^p)) recovers χ(a). For a cyclic product algebra the transfer ideal contains 1, so no unital transfer-annihilating character to a nonzero field exists.

- For A=k^p with cyclic rotation, the p coordinate characters are permuted freely, so no character is σ-invariant, matching T^0(A)=0 having no characters; for trivial σ the bijection is the identity of Hom(A,k).

- Frob⁻¹χ(aᵖ)=χ(a); the cyclic product has 1 in transfer so no character exists. Without perfectness take trivial σ on A=F_p[x], A′=F_p[xᵖ] and κ=F_p(t): χ(xᵖ)=t admits no extension since t∉κᵖ. Keep perfectness and all containment/annihilation hypotheses explicit.

- For A=ℤ, σ=id, p=2, A′=ℤ, κ=F₂ and χ reduction mod 2, χ kills every transfer 2a and its unique extension is χ itself, given by Frob⁻¹(χ(a²))=χ(a); the source ring has characteristic zero.


### 8.3 Frobenius twist and linearization of algebras

For a k-vector space W, define W^(p) as the tensor product of W with k along coefficient Frobenius: the same vectors with λ acting as Frob⁻¹(λ), so that the tautological map W→W^(p) is Frobenius-semilinear. For a commutative k-algebra A, A^(p) is this twist of the underlying module with the tensor-product algebra structure. Its tautological map is Frobenius-semilinear and universal for such maps from A to commutative k-algebras. Given a specific F_p-form A₀ and an identification of A with the scalar extension of A₀ to k, let Fr_A₀ fix A₀ and send scalar λ to λ^p. Linearize a Frobenius-semilinear map f:A→B as f∘Fr_A₀⁻¹. Apply this to Δ_p to obtain a k-algebra map after choosing a form. (Feng24, Construction 5.17, p.43, Feng24 line 1896; TV16, §2.1, p.5, TV16 line 207.)

The balancing relation is (λw)⊗μ=w⊗λᵖμ. The right factor gives the scalar action. In the same-vector model λ acts as λ¹ᐟᵖ; a specified F_p-form then supplies the semilinear self-equivalence used for linearization. Generic tensor products and Frobenius automorphisms are used unchanged.

The API:

- For a k-vector space W, W^(p) is the tensor product of W with k along coefficient Frobenius, with k acting on the right factor; equivalently W with λ∗w=Frob⁻¹(λ)w. It is functorial in k-linear maps, preserves dimension, and is the underlying k-module of A^(p) and of the Hom spaces of C^(p).

- Use the actual base-changed commutative algebra with its balancing relation.

- Semilinear maps A→B are equivalent to k-algebra maps A^(p)→B.

- Precomposing source inverse Frobenius yields a k-linear map, functorially relative to the chosen form.

*Proof route.* Use the existing tensor-product algebra and Frobenius ring equivalence. Prove the scalar-extension universal property with the correct balancing relation; identify the twist using the given form. No canonical self-linearization is asserted in the absence of the form.

*Needs:* §5.6; §8.1; Mathlib `frobeniusEquiv`.

**Checks.**

- For A=k[x] with form F_p[x], Fr fixes x and raises only coefficients to p-th powers.

- For trivial σ on A=k[x], linearizing Δ_p sends x to x^p and scalars to themselves; it is not the identity endomorphism of A.

- Over F₉ a scalar a outside F₃ is restored to a by source inverse Frobenius followed by the p-semilinear map.

- At p=3 choose β∈F₂₇⊂k with β³−β−1=0. The polynomial has values −1 at 0, 1 and 2, hence is irreducible over F₃. Then Fr(β)=β+1, Fr⁻¹(β)=β⁹=β−1 and β²⁷=β. For the scalar map D(a)=a³, D(Fr⁻¹β)=β, whereas D(Frβ)=β−1≠β. This excludes precomposing source Frobenius; F₉ alone cannot distinguish it from its inverse.

- For W=k, the map a⊗μ↦a^pμ is a k-linear isomorphism k^(p)≅k, under which the tautological map k→k^(p) is a↦a^p; over F₉ it moves every scalar outside F₃.

- Fr fixes x; Δ linearized sends x↦xᵖ and α↦α; a⊗μ↦aᵖμ balances (aλ)⊗μ=a⊗λᵖμ. Use source inverse Frobenius and a specified form.


### Examples

For trivial σ on k[x], Tr=0 and Δ_p(x)=xᵖ. With the F_p[x] form, linearization fixes every scalar but still sends x to xᵖ. For Bᵖ with rotation, every diagonal element is the transfer of an element supported in one factor; T⁰(Bᵖ)=0 and no unital character to a nonzero field exists. In k[ε]/ε² with trivial action, Δ_p(ε)=0 for every prime p; reducedness is not a hypothesis.

### Dependencies

Layer 0 coefficient conventions and §5.6 coefficient Frobenius orientation; Mathlib ring automorphisms, finite sums/products, subrings, ideals/quotients, Frobenius and character independence; Tau Ceti degree-zero Tate comparison for the additive identification.


## Downstream consumers

The Tate-cohomology-of-shtukas and global base change development consumes Layers 2, 3 and 7: relative localization, the modular Satake extension, exactness and the integral comparison natural on norm-generated maps. It imports the k/W(k) Satake functor of §3.1 and the CT comparison of Layer 6. The local cyclic base change development consumes the same sheaf and Satake comparisons and Layer 8's algebra diagonal, character extension and coefficient Frobenius linearization. The mod-p functoriality development consumes the vector-space twist of §8.3 and the σ-invariant-character bijection of §8.2, together with the shared algebra diagonal. These consumers do not supply prerequisites for the present construction.

## Worked examples

**Cyclic coefficients and a perfect nearby complex.** At p=3, A=k[u]/u³ with N=u². On the regular module the Tate pair is (0,0); on trivial k it is (k,k); on trivial O it is (k,0). The complex [A→u A] has Tor amplitude [0,1] and cohomology k in degrees 0 and 1, with the geometric degree-one twist in the Kummer punctured-neighbourhood model. The complex vanishes in the quotient although its cohomology modules survive. This is the scalar-rotation model for i*Rj* and the error term in i!→i* (§§0.5–0.6, 2.4–2.5; Feng24 Lemmas 3.7–3.8, pp.15–16, Feng24 line 684).

**Ordinary reduction and equivariant failure.** For the augmentation ideal I⊂O[C₃], an invariant element would be a multiple of N, whose augmentation is three times its coefficient, so I^C₃=0. Modulo p, I becomes (u)⊂k[u]/u³ and its invariants are k·u². Consequently equivariant Hom from O to I changes from zero to a one-dimensional space after reduction. Ordinary parity Hom reduction retains its valid base-change theorem (§4.10; JMW14 Proposition 2.39 and (2.13), p.17, JMW14 line 785; Feng24 Lemma 4.16, p.26, Feng24 line 1126).

**An object comparison tested on a map.** On the minuscule GL₂ Schubert P¹, E=O[1] has integral Tate endomorphisms k⊕k·h with h²=0. L discards the index-one class h; derived coefficient reduction to the k-Tate category keeps it. Thus the comparison of the two reduced objects is not natural on every Tate map. The target of §7.6 is a natural comparison on precisely the norm-generated images of ordinary parity maps (§§4.7, 7.5–7.6; LL21 Proposition 4.6.1, pp.14–15, LL21 line 641; Feng24 Lemma 4.24, pp.29–30, Feng24 line 1273).

**Torus weights, scalars and matrices.** For H=G_m, p=3 and coweights (2,−1,4), norm and diagonal Smith restriction produce weight 5. The torus has ρ=0, so normalized CT and lifting add no integer shifts. A scalar a becomes a³ before linearization. Source inverse Frobenius sends a to a¹ᐟ³ first, giving a afterward; for a=α with α²=−1 in F₉, the two unlinearized values are α and −α. For β∈F₂₇ with β³−β−1=0, the inverse source direction yields β and the forward direction β−1, so the two choices are separated. Biproduct inclusions and projections extend the same calculation entrywise to every matrix of maps, proving the natural torus comparison (§6.6; Feng24 §A.5, p.60, Feng24 line 2707).

**The algebra diagonal with and without characters.** For trivial σ on k[x], Δ_p is absolute Frobenius. With the F_p[x] form its linearization fixes k and sends x to xᵖ. For A=Bᵖ with rotation, transfer is onto the diagonal invariants, so T⁰(A)=0. There is no unital transfer-annihilating character to a field. The p coordinate characters of kᵖ form a free orbit and none is σ-invariant, agreeing with the character bijection for the zero quotient (§§8.1–8.3; Feng24 Definition 5.14 and Lemma 5.15, p.42, Feng24 line 1863; TV16 (3.4.1), pp.11–12, TV16 line 512).

## References

Every statement is expressed in the roadmap's words. Printed page numbers and theorem, section or tag locators refer to the versions specified below. Line locators identify the corresponding legally fetched text by source id; the Stacks chapter or tag distinguishes its chapter extractions.

- **Feng24.** Tony Feng, with Appendix A jointly with Gus Lonergan, [*Smith theory and cyclic base change functoriality*](https://doi.org/10.1017/fmp.2023.32), Forum of Mathematics, Pi 12 (2024), e1, pp.1–66. Version of record; §§3–4, pp.13–30, Definition 5.14 and Lemma 5.15, p.42, Construction 5.17, p.43, Appendix A, pp.56–61. The source arguments are used with the hypotheses and map-level comparisons stated above.
- **LL21.** Spencer Leslie and Gus Lonergan, [*Parity sheaves and Smith theory*](https://arxiv.org/abs/1708.08174v4), J. reine angew. Math. 777 (2021). Locators use arXiv v4: Corollary 4.5.2, p.14; Proposition 4.6.1, pp.14–15; §§5.5–5.6, pp.21–25.
- **JMW14.** Daniel Juteau, Carl Mautner and Geordie Williamson, [*Parity sheaves*](https://arxiv.org/abs/0906.2994v3), JAMS 27 (2014), pp.1169–1212. Locators use arXiv v3: §2.1 and Definitions 2.3–2.4, pp.4–5; Theorem 2.12 and Definition 2.14, pp.7–8; Proposition 2.34, p.15; Proposition 2.39 and (2.13), pp.17–18; §4.1, p.29, and Proposition 4.10, p.33.
- **JMW16.** The same authors, [*Parity sheaves and tilting modules*](https://arxiv.org/abs/1403.1647v1), Ann. Sci. ENS 49 (2016), pp.257–275. Locators use arXiv v1: Theorems 1.1–1.5, pp.1–2; Lemma 3.6, p.10; Theorems 5.1 and 5.3, p.16.
- **MR18.** Carl Mautner and Simon Riche, [*Exotic tilting sheaves, parity sheaves on affine Grassmannians, and the Mirković–Vilonen conjecture*](https://arxiv.org/abs/1501.07369v3), JEMS 20 (2018), pp.2259–2332. Locators use arXiv v3: §1.1, p.1; Theorem 1.1, p.3; Corollary 1.6, p.6; §6.5 and Lemma 6.6, p.60; §6.6, p.61.
- **MV07.** Ivan Mirković and Kari Vilonen, [*Geometric Langlands duality and representations of algebraic groups over commutative rings*](https://arxiv.org/abs/math/0401222v5), Ann. of Math. 166 (2007), pp.95–143. Locators use arXiv v5: Proposition 2.1, p.6; Theorem 3.2 and (3.6), p.9; Theorems 3.5–3.6 and Corollary 3.7, pp.10–12; Propositions 6.3–6.4, pp.20–21; Proposition 11.1, p.31; Theorem 12.1, p.33; Proposition 13.1 and Corollary 13.2, pp.39–40; Theorem 14.1, p.40.
- **Stacks.** The Stacks Project Authors, [*The Stacks Project*](https://stacks.math.columbia.edu/): Algebra §10.101, Tag 051E, especially Lemmas 10.101.1–10.101.3, Stacks line 11331, with Lemma 10.101.3 (Tag 051H) at Stacks line 11356; Cohomology on Sites Lemmas 21.46.3 and 21.46.10, Tags 08G1 and 0DJJ, Stacks lines 5207 and 5300; More on Algebra Definition 15.70.1, Tag 0A5N, Stacks line 8130; Fields Lemma 9.13.1, Tag 0CKL in §0CKK, Stacks line 728.
- **Don93.** Stephen Donkin, [*On tilting modules for algebraic groups*](https://doi.org/10.1007/bf02571640), Math. Z. 212 (1993). Cited by its locator, Theorem 1.1, for existence and classification of indecomposable tilting modules, as recalled in JMW16 Theorem 1.1.
- **Braden03.** Tom Braden, [*Hyperbolic localization of intersection cohomology*](https://arxiv.org/abs/math/0202251v5), Transformation Groups 8 (2003), pp.209–216. Locators use arXiv v5: Theorem 1, p.2, and Lemma 6, p.5; weak equivariance and normality are retained.
- **TV16.** David Treumann and Akshay Venkatesh, [*Functoriality, Smith theory, and the Brauer homomorphism*](https://arxiv.org/abs/1407.2346v1), Ann. of Math. 183 (2016), pp.177–228. Locators use arXiv v1: §2.1, p.5, and §3.4, (3.4.1), pp.11–12.
