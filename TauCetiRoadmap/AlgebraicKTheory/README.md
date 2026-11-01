# Roadmap: algebraic K-theory in low degrees

**Summary.** Develop the algebraic K-groups of arbitrary associative unital rings through degrees zero, one and two, with their usable matrix and projective-module APIs, relative groups, stable-range theorems and Milnor patching. From Tau Ceti's split Grothendieck group and finite-projective category, Mathlib's matrix groups and Tau Ceti's balanced tensor product, the roadmap builds K₀ with extension of scalars along arbitrary ring maps (Layer 0), the stable general linear group and Whitehead's lemma (Layer 1), K₁ and its automorphism presentation (Layer 2), relative groups and the relative triple group of an additive functor (Layer 3), Bass–Vaserstein stability and the covering-dimension calculation of stable ranks of function rings (Layer 4), Steinberg groups and K₂ (Layer 5), Milnor patching with its Mayer–Vietoris sequence (Layer 6), gluing calculations (Layer 7) and the comparison map from algebraic K₁ of a Banach algebra to its stable component group (Layer 8). Its end theorems are the patching equivalence and the six-term exact sequence of a Milnor square, Vaserstein's stable-range formulas for `C(X,ℂ)` and `C(X,ℝ)`, the universal central extension `St(R)→E(R)` with Matsumoto's presentation of K₂ of a field, and the explicit K₀ and K₁ calculations of Layers 0, 2 and 7. All ring homomorphisms preserve one. Rings can be noncommutative and can be the zero ring. A division-ring or nonzero-space calculation states its nontriviality hypothesis.

Algebraic K₁ is the abelianization of the stable general linear group. It is not the group of connected components of a topological matrix group. For instance K₁ᵃˡᵍ(ℂ) is ℂˣ, whereas K₁ᵗᵒᵖ(ℂ)=0. The comparison in Layer 8 constructs the quotient map and its kernel; it does not identify these functors.

The definitive specification is this README. Suggested.lean is its acceptance test, not an exhaustive list of its targets: it states the headline theorems that are statable against the pinned Mathlib and Tau Ceti, with the few definitions they need, and its module docstring names the headlines that are not statable there and the carrier each lacks.

## Scope and ownership

The layers are labelled A0–A8 in the layer headings below, and other roadmaps cite them by those labels.

This roadmap owns, for arbitrary associative unital rings: the extension-of-scalars functor on all modules and its adjunction with restriction, built on Tau Ceti's balanced tensor product (0.2); the matrix realization of Tau Ceti's finite-projective category and the idempotent monoid V(R) (0.1, 0.4); the elementary subgroups, the stable general linear group and Whitehead's lemma (Layer 1); K₁(R), the automorphism presentation K₁ᴮ(C) of K₁ of a small additive category and the Dieudonné determinant (Layer 2); the relative groups K₁(R,I), the relative triple group K₀(T) of an additive functor, its boundary and its exactness statements, and the Dorroh unitization (Layer 3); the stable-range predicate, the Bass–Vaserstein stability theorems, the Lebesgue covering-dimension predicate and Vaserstein's stable-rank formulas for function rings (Layer 4); the Steinberg groups, K₂, Steinberg symbols and Matsumoto's presentation (Layer 5); Milnor patching and its boundary (Layer 6); the gluing calculations (Layer 7); and the comparison of algebraic K₁ of a complex Banach algebra with its stable component group (Layer 8).

What it leaves to the libraries: Tau Ceti's `TauCeti.SplitK0` is the single categorical split K₀ engine and Tau Ceti's `TauCeti.finiteProjectiveModules` the single finite-projective category; neither is constructed again (0.1, 0.3). Equivalence invariance of K₀ is Tau Ceti's Morita theorem and the matrix Morita equivalence is Mathlib's `ModuleCat.matrixEquivalence`; only the corner-module convention and the matrix description of the resulting isomorphism are targets here (0.3). The balanced tensor product is Tau Ceti's quotient carrier; its outer ring actions, associators and coherence are targets here, and no second quotient is built (Conventions, 0.2). The fibre product of rings is Mathlib's `RingHom.pullback` (6.1). The covering-dimension predicate is this roadmap's: neither pinned library defines covering dimension, and no roadmap on main constructs it (4.3).

What it leaves to other roadmaps, all of which are its consumers and none of which it cites as an input. OperatorKTheory owns C*-algebra K-theory (projection K₀, unitary K₁, Bott periodicity, extension boundaries and KK) and every comparison of it with the groups here: its unitary K₁ with Layer 8's stable component group by the polar deformation (its K2), its pullback boundary with Layer 6's boundary after Layer 8's quotient map (its K3), and the equivalence of the category of finitely generated projective right modules that its K1 constructs over a unital C*-algebra A with Proj(A) of 0.1, which by `TauCeti.SplitK0.mapEquiv` carries its K1 isomorphism of projection K₀ with `TauCeti.SplitK0` of that category to an isomorphism with K₀(A) of 0.3; nothing in Layer 0 depends on that comparison, and Layer 8 uses no C*-algebra theory. The higher algebraic K-theory of rings and its comparison with the low-degree groups built here belong to consumers: GeneralAlgebraicKTheory owns exact-category Q/S theory, the ring plus/Q comparison, Bass nonconnective K-theory and the Bass/Schlichting comparison, and consumes the conventions, Layers 0–3 and Layer 6. Its §3.14 (`ringKGroup.zeroEquiv`, `ringKGroup.oneEquiv`) compares π₀ with K₀ of 0.3 and π₁ with K₁ of 2.1, and its §8.7 compares relative π₁ with K₁(R,I) of 3.1. Its §§4.15–4.17 state, for a small additive functor T:C→D, the relative triple group with direct-sum and composition relations, the automorphism presentation of K₁ of a small additive category with its boundary for summand-dense T, and the five-term sequence; these are the objects of 2.2, 3.2 and 3.3. This roadmap owns them and supplies them to GeneralAlgebraicKTheory: 2.2's K₁ᴮ(C), 3.2's K₀(T) and 3.3's boundary δ, exactness at K₀(T) and K₀(C) for summand-dense T, and exactness at K₁ᴮ(D) for full summand-dense T. GeneralAlgebraicKTheory owns only the extension of exactness at K₁ᴮ(D) to summand-dense functors that are not full. GeometryOfNumbersAndQuadraticArithmetic §6.1.7 (`ringKTheoryModels`) owns the right-projective convention adapter, the comparison of π₂ with K₂ of 5.2 and the transport of Layer 6's boundary with its normalization δ([u])=[M(u)]−[Dⁿ], and its §6.10 (`plusConstructionComparison`) the plus-construction comparison. StableHomotopyKTheory consumes Layers 0–1 and compares its generic universal-central-extension predicate with the Steinberg statement of 5.1; 5.1 states the three defining conditions directly and uses nothing from that roadmap. Whitehead torsion, Wh(π), PL surgery and the Bass–Heller–Swan computations belong to GeometricTopology. NoncommutativeGeometry N2 consumes Layers 0–3 and owns its algebraic cyclic pairings. None of Layers 0–6 uses topological K-theory, a higher K-spectrum or Q-theory.

## Conventions

Finitely generated projective modules are **right** R-modules, expressed in Lean as left modules over Rᵐᵒᵖ. Matrices act on columns by left multiplication; this commutes with right scalar multiplication. Commutators are [x,y]=xyx⁻¹y⁻¹. K₀ and K₁ are written additively, with [uv]=[u]+[v] in K₁. The boundary of a Milnor square is normalized by δ([u])=[M(u)]−[Dⁿ] (6.3). A common module universe contains the scalar and module carriers; transport along universe lifts is provided where a construction is universe-polymorphic.

Extension of scalars along a unital map f:R→S of arbitrary associative rings is P⊗ᵣS, with the native bimodule/opposite-ring encoding and the relation pr⊗s=p⊗f(r)s; R is not required to be commutative to form it. Use the commuting-action vocabulary of `Mathlib.Algebra.Module.Bimodule`. Adopt Tau Ceti's `TauCeti.BalancedTensorProduct k A M N` (module `TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic`), the quotient of `M ⊗[k] N` by the submodule `balancedTensorRelations` spanned by `(m·a)⊗n−m⊗(a·n)`, for a right A-module M (a module over Aᵐᵒᵖ) and a left A-module N over a commutative ground ring k; here k=ℤ, A=R, M=P and N=S with R acting on S through f. At the pinned Tau Ceti this carrier is a module over the ground ring k only. Its `Basic` module gives the quotient map `mkQ`, the pure tensors `mk`/`tmul`, pure-tensor induction `induction_on`, extensionality `hom_ext`, the balanced universal property `lift`/`liftEquiv` and the functorial `map`; its `Unit` module gives the k-linear unit isomorphisms `lid : BalancedTensorProduct k A A N ≃ₗ[k] N` and `rid : BalancedTensorProduct k A M A ≃ₗ[k] M`; its `Corner` module identifies `eA ⊗_A Af` with the corner `eAf` for idempotents e,f of a k-algebra (`spanSingletonBalancedTensorProductEquivCorner`), and its `OuterFactors` module gives a k-linear identification `outerFactors` of `(M ⊗[k] L) ⊗_A (N ⊗[k] P)` with `(M ⊗_A N) ⊗[k] (L ⊗[k] P)` isolating the balanced middle factor. The last two are present at the pin and not consumed here; none of the four gives the balanced product an action of an outer ring, an associator or a coherence law. Use this quotient carrier and its API; do not construct a second quotient. The outer actions, the associativity isomorphisms and their coherence are targets of 0.2. Construct the right S-action as the outer action of Sᵐᵒᵖ on the second factor, (p⊗s)·s′=p⊗ss′; give its pure-tensor formula and prove the required commuting-action instances. For left-module extension S⊗ᵣM use `BalancedTensorProduct ℤ R S M`, where S has right R-action s·r=s f(r), with the outer left S-action a·(s⊗m)=(as)⊗m on the first factor. The ℤ-actions commute with these ring actions. No flatness assumption is used anywhere.

Matrices use Mathlib's `Matrix.GeneralLinearGroup n R=(Matrix n n R)ˣ`, `Matrix.single`, `Matrix.fromBlocks`, `Units.map`, `Subgroup.closure`, `QuotientGroup`, `Abelianization`, `MulOpposite` and the direct limits of `Mathlib.Algebra.Colimit`. The elementary formulas of Mathlib's `Matrix.transvection` (stated for commutative rings) are generalized to arbitrary rings with the same expressions (1.1). Follow the elementary-subgroup and transvection API in Mathlib PRs [44314](https://github.com/leanprover-community/mathlib4/pull/44314), [44228](https://github.com/leanprover-community/mathlib4/pull/44228) and the finite-rank commutator API in [33882](https://github.com/leanprover-community/mathlib4/pull/33882), and the semilocal stable-range-one direction of [44734](https://github.com/leanprover-community/mathlib4/pull/44734): build the needed generalizations in Tau Ceti and adopt the Mathlib interfaces as they become available; implementation does not wait on their merge.

## Exact supplier contracts

### From Mathlib

- `Matrix.GeneralLinearGroup n R`, `Matrix.single i j a` (`Mathlib.Data.Matrix.Basis`), `Matrix.fromBlocks` (`Mathlib.Data.Matrix.Block`), `Units.map`, `Subgroup.closure`, `commutator`, `Abelianization` (`Mathlib.GroupTheory.Abelianization.Defs`), `MulOpposite`: the matrix and group carriers of Layers 1–2, for any `[Ring R]` and finite index type.
- `Matrix.transvection` (`Mathlib.LinearAlgebra.Matrix.Transvection`) and `Matrix.GeneralLinearGroup.transvection` (`Mathlib.LinearAlgebra.Matrix.ElementaryRowOperations`, for `[CommRing R]` only) and `Matrix.SpecialLinearGroup.toGL` (`Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs`): the commutative transvection formulas that 1.1 generalizes and the SL comparison it keeps; neither pinned library has an elementary subgroup over an arbitrary ring.
- `Module.Finite.exists_comp_eq_id_of_projective` (`Mathlib.RingTheory.Finiteness.Projective`): a finitely generated projective module is a direct summand of a finite free module, with actual splitting maps `f ∘ₗ g = id`, `f` surjective and `g` injective; applied over Rᵐᵒᵖ in 0.1.
- `ModuleCat.matrixEquivalence` (`Mathlib.RingTheory.Morita.Matrix`, any `[Ring R]`): the equivalence of module categories of R and Mₙ(R) used in 0.3 and 2.3. `RingEquiv.mopMatrix : Matrix m m αᵐᵒᵖ ≃+* (Matrix m m α)ᵐᵒᵖ` (`Mathlib.Data.Matrix.Basic`, `M ↦ op (Mᵀ.map unop)`, for any `[Mul α] [AddCommMonoid α]`): its inverse is the ring isomorphism Mₙ(R)ᵐᵒᵖ≅Mₙ(Rᵐᵒᵖ), op(g)↦(gᵀ with entries in Rᵐᵒᵖ), used for the right-module convention in 0.3; it needs no commutativity.
- `ModuleCat.restrictScalars f` (`Mathlib.Algebra.Category.ModuleCat.ChangeOfRings`, any rings): restriction along f with R-action r·n=f(r)·n, used in 0.2. `ModuleCat.extendScalars` and `ModuleCat.extendRestrictScalarsAdj` (same file) require `[CommRing R] [CommRing S]`: 0.2 proves the comparison with them when both rings are commutative and does not use them otherwise.
- `RingHom.pullback f g`, `RingHom.pullbackFst`, `RingHom.pullbackSnd` (`Mathlib.RingTheory.LocalRing.Pullback`, `[Ring R] [Ring S] [Semiring T]`): the subring {(a₁,a₂) | π₁(a₁)=π₂(a₂)} of A₁×A₂ with its projections, the carrier of 6.1.
- `MaximalSpectrum` (`Mathlib.RingTheory.Spectrum.Maximal.Defs`) and `ringKrullDim` (`Mathlib.RingTheory.KrullDimension.Basic`, valued in `WithBot ℕ∞`): the hypotheses of 4.2.
- `ContinuousMap` `C(X,𝕜)` with its ring structure, `AddCircle`, `Function.Antiperiodic` (`Mathlib.Algebra.Ring.Periodic`), `crossProduct` (`Mathlib.LinearAlgebra.CrossProduct`), `Matrix.conjTranspose`, the intermediate value theorem and the Tietze extension theorem (`Mathlib.Topology.TietzeExtension`): the carriers of the function-ring examples of 0.6–0.8, 4.5 and 7.1.
- `CompHaus.hasColimits` (`Mathlib.Topology.Category.CompHaus.Basic`): the pushout of compact Hausdorff spaces in 7.1.
- `FreeGroup`, `PresentedGroup`: the carriers of the Steinberg groups of 5.1.

### From Tau Ceti

- `TauCeti.SplitK0` (`TauCeti.CategoryTheory.GrothendieckGroup.Split`) with `TauCeti.SplitK0.of`, `TauCeti.SplitK0.of_biprod`, `TauCeti.SplitK0.exists_eq_sub`, `TauCeti.SplitK0.liftEquiv`, `TauCeti.SplitK0.map` and `TauCeti.SplitK0.mapEquiv`: the split Grothendieck group of an additive category, its generators, the biproduct relation, the fact that every class is a difference of generators, its universal property and its functoriality along additive functors and equivalences. It is the single K₀ engine of 0.3 and 3.2.
- `TauCeti.finiteProjectiveModules R` (`TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`): the full subcategory of `ModuleCat R` on `Module.Finite` and `Module.Projective` objects, replete, with zero, biproducts, essential smallness and an induced exact structure; `TauCeti.finiteProjectiveModulesExactStructure_eq_split` identifies that structure as split. Applied to Rᵐᵒᵖ in 0.1.
- `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv` (`TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita`, for an equivalence of module categories) and `RingEquiv.finiteProjectiveModulesK0Equiv` (`TauCeti.Algebra.Category.ModuleCat.CartanMap.RingEquiv`): equivalence invariance of the exact K₀, transported to the split K₀ by `finiteProjectiveModulesExactStructure_eq_split` in 0.3.
- `TauCeti.BalancedTensorProduct` with the API of its `Basic` and `Unit` modules named in Conventions (`mkQ`, `mk`, `tmul`, `induction_on`, `hom_ext`, `lift`, `liftEquiv`, `map`, `lid`, `rid`): a ground-ring module with its balanced universal property. Its `Corner` and `OuterFactors` modules exist at the pin and are not consumed.

### From TauCetiRoadmap.DifferentialGeometry

- 11.1 `exists_eq_zero_of_inner_eq_zero`: for even n, a continuous field `w` on the unit sphere of a Euclidean space of dimension n+1 with ⟪w x, x⟫=0 at every point has a zero (the hairy ball theorem); for n=2 these are exactly the fields v:S²→ℝ³ with ⟨x,v(x)⟩=0 of 0.6. Its outward sphere orientation is used in 0.7.

### From TauCetiRoadmap.CharacteristicClasses

- C7: the smooth identification of the tangent bundle of Sⁿ with the bundle of fibres x^⊥, the Euler number 1+(−1)ⁿ of the oriented TSⁿ, and the comparison e=c₁ on an oriented plane bundle; used only in the terminal comparison of 0.7.

### From TauCetiRoadmap.TopologicalKTheory

- T1: the category of continuous finite-rank bundles and the clutching construction with its fixed convention; T4: the sphere group `K(S²)≅ℤ[β]/(β²)` with β=[L]−1. Used in 7.1 to read the class of a glued bundle; the source group of the boundary there stays algebraic K₁.

### From TauCetiRoadmap.BanachAlgebras

- A2: the holomorphic functional calculus of a complete unital complex Banach algebra, with its completeness and spectrum hypotheses: the convergent logarithm on {g : ‖g−1‖<1} and the exponential path used in 8.2.

### From TauCetiRoadmap.HilbertModules

- H2: for a unital C*-algebra, a finitely generated projective right module admits a complete Hilbert-module structure, every module isomorphism between two such is adjointable with a polar decomposition, and the projection model `pAⁿ`; H5: over compact X the continuous section modules of finite-rank Hermitian bundles are identified with the finitely generated projective modules of H2, with morphisms, tensor products and pullbacks. Used in 7.1 through the forgetting adapter to the algebraic modules of 0.1.

## How to read the build

Layer 0 fixes the carriers: Tau Ceti's finite-projective category over Rᵐᵒᵖ, the split K₀ on it, extension of scalars on all modules and its restriction to finite projectives, the idempotent monoid, and three explicit function-ring modules that witness the failure of cancellation. Layer 1 builds the elementary and stable general linear groups and proves Whitehead's lemma, the engine of every later identification. Layer 2 defines K₁ and its automorphism presentation and computes it for fields, division rings and ℤ. Layer 3 adds the relative groups, the relative triple group of an additive functor with its boundary and exact sequences, and the unitization of nonunital rings. Layer 4 is the finite-size theory: stable range, the stability theorems, covering dimension and Vaserstein's formulas. Layer 5 adds the Steinberg groups and K₂ and extends the relative sequence one step to the left. Layer 6 proves Milnor patching and the six-term Mayer–Vietoris sequence of a square with one surjective leg; Layer 7 exercises it on glued spaces and arithmetic squares; Layer 8 compares algebraic K₁ of a Banach algebra with its stable component group. Layers 1–3 and 5 use only Mathlib, Tau Ceti and Layer 0; Layers 4 and 6 use Layers 0–3; Layer 7 uses Layer 6 and the bundle roadmaps; Layer 8 uses Layers 1–2 and BanachAlgebras.

## Layer 0: Finite projectives and matrix K₀ (A0)

### 0.1 The category of finite projectives

Use Proj(R)=(`TauCeti.finiteProjectiveModules Rᵐᵒᵖ`).FullSubcategory, which Suggested.lean names `FiniteProjectiveRight`. Adopt its existing native `Module.Finite`/`Module.Projective` objects, repleteness, zero, biproducts, essential smallness and induced exact structure; `finiteProjectiveModulesExactStructure_eq_split` identifies that structure as split. Extend its API with the finite-presentation/idempotent small models, explicit universe transport and direct-summand closure needed by the matrix comparison of 0.4. A projective module here is not required to have a chosen basis or constant rank. That every object is a direct summand of a finite free module, with actual splitting maps, is `Module.Finite.exists_comp_eq_id_of_projective` applied over Rᵐᵒᵖ; package from it a complementary finite projective object Q of Proj(R) with P⊕Q≅Rⁿ.

- Every object P of Proj(R) has a complement Q in Proj(R) with an explicit isomorphism P⊕Q≅Rⁿ and the two splitting maps.
- A direct summand of an object of Proj(R) is an object of Proj(R); a finite direct sum of objects is an object.
- Proj(R) is essentially small, with the small model given by idempotent matrices (0.4).

**Checks.**

- Over a division ring D every object is free, and the isomorphism classes of objects are in bijection with ℕ by dimension; a definition that forgot finite generation would admit the infinite-dimensional free module.
- The ℤ-module ℤ/5 is finitely generated but not projective (it is torsion, hence not a summand of a free ℤ-module), so it is not an object of Proj(ℤ); a definition that forgot projectivity would admit it.
- Over the zero ring every module is zero, Proj(0) has one object up to isomorphism, and the complement of 0 is 0 with n=0.

*Needs:* Tau Ceti `TauCeti.finiteProjectiveModules`, `TauCeti.finiteProjectiveModulesExactStructure_eq_split`; Mathlib `Module.Finite.exists_comp_eq_id_of_projective`.

### 0.2 Extension of scalars on all modules

The balanced construction first acts on **all** modules. For a unital map f:R→S of arbitrary associative rings, construct the additive extension functor on left modules E_f(M)=S⊗_R M with relations (s f(r))⊗m=s⊗(r m), left S-action a·(s⊗m)=(as)⊗m and map E_f(g)(s⊗m)=s⊗g(m), on the carrier `BalancedTensorProduct ℤ R S M` of Conventions. Reuse native `ModuleCat.restrictScalars f` for restriction, whose R-action is r·n=f(r)·n. Construct the natural adjunction `Hom_S(E_f(M),N) ≃ Hom_R(M,Res_f(N))` by h↦(m↦h(1⊗m)) and g↦(s⊗m↦s·g(m)). Prove balanced well-definedness, linearity, both inverse laws and naturality in M,N. Give its unit m↦1⊗m, counit s⊗n↦s·n, and both triangle identities on pure tensors before packaging the native categorical adjunction. No flatness, injectivity, finiteness or commutativity hypothesis is needed. For right modules the same construction, transported through opposite rings, has unit p↦p⊗1 and counit n⊗s↦n·s; identify its relation pr⊗s=p⊗f(r)s explicitly. Construct the associativity isomorphism (P⊗ᵣS)⊗ₛT≅P⊗ᵣT for composable maps R→S→T and the unit isomorphism P⊗ᵣR≅P from `rid`, with their coherence (the pentagon and triangle identities on pure tensors). Prove the comparison with native `ModuleCat.extendRestrictScalarsAdj` when both rings are commutative. Give the native module-category functors, ring-map adapters, finite-free base-change formulas and natural comparison with the commutative tensor API here, and the comparison with the left-module convention by passing to Rᵐᵒᵖ, including the transpose and inverse conventions on matrix automorphisms. 0.3 restricts the extension functor to finite projectives by the finite-free splitting argument. It does not assert that restriction along an arbitrary ring map preserves finite projectivity, nor that this all-module adjunction restricts to the finite-projective categories.

- E_f is an additive functor from left R-modules to left S-modules, with E_f(Rⁿ)≅Sⁿ for every n.
- The adjunction E_f ⊣ Res_f, with its unit and counit and the triangle identities.
- Functoriality in f: E_(g∘f)≅E_g∘E_f and E_id≅id, coherently.

**Checks.**

- For f=id the unit isomorphism `lid` gives E_id(M)≅M by s⊗m↦s·m, and the adjunction becomes the identity on Hom; a construction with a wrong balancing side would not make s⊗m↦s·m well defined.
- For R=S=𝔽₄ over the ground ring ℤ, the balanced product 𝔽₄⊗_𝔽₄𝔽₄ has 4 elements, while the unbalanced ℤ-tensor product 𝔽₄⊗_ℤ𝔽₄=𝔽₄⊗_𝔽₂𝔽₄ has 16; the balancing relations are what shrink it.
- For f:ℤ→ℚ and M=ℤ, E_f(ℤ)≅ℚ, not ℤ: the extension is along the target ring, not the image of f; and the counit ℚ⊗_ℤℚ→ℚ, s⊗n↦sn, is an isomorphism.

*Needs:* Tau Ceti `TauCeti.BalancedTensorProduct` with `lift`, `liftEquiv`, `induction_on`, `hom_ext`, `map`, `lid`, `rid`; Mathlib `ModuleCat.restrictScalars`, `ModuleCat.extendRestrictScalarsAdj` (commutative comparison only), `Mathlib.Algebra.Module.Bimodule`.

### 0.3 K₀ and its functoriality

Use K₀(R), written `KZero`, as the split K₀ `TauCeti.SplitK0` of Proj(R), with its canonical comparison to the induced exact K₀ through `finiteProjectiveModulesExactStructure_eq_split`. Restrict the extension functor of 0.2 to finite projectives: prove that base change preserves finite projectivity by transporting a finite free splitting P⊕Q≅Rⁿ to (P⊗ᵣS)⊕(Q⊗ᵣS)≅Sⁿ, without a flatness hypothesis on S; obtain the additive functor Proj(R)→Proj(S) with its associator and unit isomorphisms, and the functorial map K₀(f):K₀(R)→K₀(S) by `TauCeti.SplitK0.map`. Give identity, composition, naturality and finite products. Equivalence invariance is `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv` and `RingEquiv.finiteProjectiveModulesK0Equiv`, stated for the exact K₀ and transported to `KZero`; the matrix Morita equivalence is `ModuleCat.matrixEquivalence` composed with these. For the right-module convention use the inverse of `RingEquiv.mopMatrix`, the ring isomorphism Mₙ(R)ᵐᵒᵖ≅Mₙ(Rᵐᵒᵖ), op(g)↦(gᵀ with entries in Rᵐᵒᵖ). The targets kept here are the corner-module convention for Mₙ(R), n≥1, which sends a right R-module P to the right Mₙ(R)-module P¹ˣⁿ of rows, so that [R]↦[e₁₁Mₙ(R)] while the free module Mₙ(R) corresponds to n[R], and the matrix description of the resulting isomorphism K₀(R)≅K₀(Mₙ(R)). Prove `kZero_divisionRing`: K₀ of a division ring D is ℤ, with the class of the free right module of rank one sent to 1 (Weibel, The K-book, Chapter II, §2, the division-ring example in the opening paragraphs of §2, before Lemma 2.1). Compute K₀(ℤ)≅ℤ, K₀ of finite products by components, K₀ of matrix rings by the corner-module Morita map, the zero-ring value K₀(0)=0 and all size-zero matrix conventions.

- `KZero R` is an abelian group generated by the classes [P] with [P⊕Q]=[P]+[Q]; every element is [P]−[Q] (`TauCeti.SplitK0.exists_eq_sub`).
- `kZero_divisionRing`: K₀(D)≅ℤ for a division ring D, sending [D] to 1.
- K₀(f) is functorial in f, and K₀(R×S)≅K₀(R)⊕K₀(S); K₀(Mₙ(R))≅K₀(R) sends [Mₙ(R)] to n[R].

**Checks.**

- K₀(0)=0, since Proj(0) has one object and [0]=[0⊕0]=2[0]; a definition without the biproduct relation would give the free abelian group on one generator.
- K₀(M₂(k))≅K₀(k)=ℤ for a field k, with [e₁₁M₂(k)]↦1 and [M₂(k)]↦2; a convention sending the free module M₂(k) to 1 would make the corner module have class 1/2.
- In K₀(C(S²,ℝ)) the tangent-section module P of 0.6 has [P]=2[R] although P≄R²: K₀ does not see freeness, only stable isomorphism.

*Needs:* 0.1, 0.2; Tau Ceti `TauCeti.SplitK0.of`, `TauCeti.SplitK0.of_biprod`, `TauCeti.SplitK0.exists_eq_sub`, `TauCeti.SplitK0.liftEquiv`, `TauCeti.SplitK0.map`, `TauCeti.SplitK0.mapEquiv`, `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv`, `RingEquiv.finiteProjectiveModulesK0Equiv`; Mathlib `ModuleCat.matrixEquivalence`, `RingEquiv.mopMatrix`.

### 0.4 Idempotents and rectangular equivalence

Use idempotents e²=e in Mₙ(R), with no adjoint or topology. Relate their images eRⁿ as right modules to all finite projectives: every object of Proj(R) is isomorphic to the image of an idempotent, by 0.1's splitting. Develop rectangular algebraic equivalence: e∈Mₙ(R) and f∈Mₘ(R) are equivalent if there are rectangular x (n×m) and y (m×n) with xy=e, yx=f, ex=x=xf and fy=y=ye; compare this with isomorphism of their images. Prove invariance under conjugation and direct sums, transport under ring maps and finite-index reindexing. Compare stable equivalence with stable similarity after adding zero blocks. Define the idempotent monoid V(R) as the set of idempotents modulo equivalence, with direct sum, and prove that V(R) has the same group completion as K₀(R): construct the comparison and its class formula, rather than defining another K₀. Prove every class of K₀(R) is [P]−[Q] and also [e]−[Rᵐ] for an idempotent e, by taking a complement of Q. Equality [P]=[Q] means P⊕T≅Q⊕T for some finite projective T; replacing T by T⊕T′ gives a free stabilizer. Use this to produce explicit common identity/zero blocks and stable conjugators in matrix calculations. Do not assume cancellation in V(R). Describe the image of V(R) in K₀(R) as the algebraic positive cone, without asserting it defines a proper order for arbitrary rings.

- Equivalence of idempotents is an equivalence relation and e∼f iff eRⁿ≅fRᵐ as right R-modules.
- V(R) is a commutative monoid under block sum, and K₀(R) is its group completion, with [e]↦[eRⁿ].
- Every element of K₀(R) is [e]−[Rᵐ] for some idempotent e and some m.

**Checks.**

- In M₂(k), e=E₁₁ and f=E₂₂ are equivalent through x=E₁₂, y=E₂₁: xy=E₁₁, yx=E₂₂, ex=E₁₂=xf and fy=E₂₁=ye. The side conditions can always be arranged: in M₁(k) with e=f=0 the pair x=1, y=0 has xy=0=e and yx=0=f but ex=0≠x, and replacing x by exf=0 and y by fye=0 repairs it; they are imposed so that x and y are mutually inverse module maps between the images fRᵐ→eRⁿ and eRⁿ→fRᵐ.
- In M₂(k), e=E₁₁ is not equivalent to 0 and not equivalent to 1: the images have dimensions 1, 0 and 2.
- For a field k, V(k)≅ℕ by rank and its group completion is ℤ; over the zero ring all idempotents are equivalent and V(0) is the trivial monoid.

*Needs:* 0.1, 0.3; Mathlib `Matrix.fromBlocks`, `Matrix.single`.

### 0.5 Cancellation fails: the tangent-section module over C(S²,ℝ)

Give a concrete failure of cancellation over the real ring `R=C(S²,ℝ)`. For x∈S²⊂ℝ³ put `p(x)=I₃−xxᵀ`, prove p is an idempotent matrix over R, and set P=pR³. Identify P directly with the continuous fields `{v:S²→ℝ³:∀x,⟨x,v(x)⟩=0}` by its pointwise projection; no tangent-bundle adapter is needed, because DifferentialGeometry 11.1 (`exists_eq_zero_of_inner_eq_zero`) is stated for exactly such fields. Construct the splitting `P⊕R≅R³`, `(v,f)↦(x↦v(x)+f(x)x)`, with inverse `w↦(p w,x↦⟨x,w(x)⟩)`. Prove P is not free: evaluations force any free rank to be two, and a free basis would yield a nowhere-zero continuous field v with ⟨x,v(x)⟩=0, contradicting DifferentialGeometry 11.1. This is the continuous-function version of the polynomial example in Weibel, The K-book, Chapter I, Example 1.2.2. Thus `P⊕R≅R²⊕R` but `P≄R²`, while `[P]=2[R]` in K₀(R). Supply this direct section/idempotent comparison rather than assuming a complex Serre–Swan theorem applies to real coefficients.

- P is an object of Proj(R) with P⊕R≅R³, and [P]=2[R] in K₀(R).
- P is not free.

**Checks.**

- p(x)²=I−2xxᵀ+x(xᵀx)xᵀ=I−xxᵀ=p(x) because xᵀx=1, and p(x)x=x−x(xᵀx)=0; without the normalization xᵀx=1 (for instance on the sphere of radius 2) p is not idempotent.
- The splitting composes to the identity: p(v+fx)=pv+f·px=v because pv=v−x⟨x,v⟩=v, and ⟨x,v+fx⟩=f.
- At x=(0,0,1), p(x)=diag(1,1,0) has rank 2, so evaluation at that point forces a free basis of P to have two elements; the trivial module R² has a nowhere-vanishing section (1,0), and P has none by the hairy ball theorem.

*Needs:* 0.1, 0.3, 0.4; DifferentialGeometry 11.1 `exists_eq_zero_of_inner_eq_zero`; Mathlib `ContinuousMap`.

### 0.6 Sphere complexification and complex frames

Resolve the scalar distinction in the real tangent-section example. For `R_ℂ=C(S²,ℂ)` let `p_ℂ(x)=I₃−xxᵀ` be the entrywise complexification of the real projection of 0.5, and `P_ℂ=p_ℂ R_ℂ³`. Construct `P⊗_R R_ℂ≃P_ℂ` for the pointwise scalar inclusion using 0.3's finite-idempotent base-change maps, with the formula `v⊗f↦(x↦f(x)v(x))`. Identify P_ℂ with the continuous complex vectors z(x) satisfying x·z(x)=0 for the complex-bilinear dot product. This is a complex rank-two module; build its free basis explicitly, without assuming cancellation or a complex bundle-classification theorem. Use coordinates x=(x₀,x₁,x₂) with x·x=1, set a=(1,i,0), `w(x)=a−(x₀+i x₁)x`, `d(x)=sqrt(1+x₂²)`, `u(x)=w(x)/d(x)` and `v(x)=x×conj(u(x))`, where × is the complex-bilinear extension of the native real cross product. Prove x·w=0 and `conj(w)·w=1+x₂²>0`, then that the columns u,v,x form a continuous unitary matrix. In particular u,v are an orthonormal basis of x's complex orthogonal complement. Give the inverse module maps `R_ℂ²→P_ℂ`, `(f,g)↦fu+gv`, and `z↦(conj(u)·z,conj(v)·z)`, including continuity, the reconstruction identity and compatibility with the pointwise Hermitian pairing. Thus this real cancellation counterexample becomes free after complex scalar extension. It cannot be used as a complex cancellation counterexample.

As a terminal comparison, distinguish this complexification from the complex line obtained on the real tangent plane by `J_x(y)=x×y`. Use DifferentialGeometry's outward sphere orientation, CharacteristicClasses C7's smooth identification of the sphere's tangent bundle with the bundle of fibres x^⊥, and C7's sphere Euler number and oriented-plane `e=c₁` comparison to give this line Chern number +2 and hence nontriviality. That characteristic-class comparison is downstream of the explicit frame and is not a prerequisite for the algebraic K₀/K₁ constructions.

- `P⊗_R R_ℂ≃P_ℂ` as right R_ℂ-modules, and P_ℂ≅R_ℂ² through the frame (u,v).
- The 3×3 matrix with columns u,v,x is unitary at every point of S² and continuous in x.

**Checks.**

- With λ=x₀+ix₁=a·x: x·w=a·x−λ(x·x)=λ−λ=0, and conj(w)·w=conj(a)·a−λ(conj(a)·x)−conj(λ)(x·a)+|λ|²=2−|λ|²=2−(1−x₂²)=1+x₂²; the unnormalized w has conj(w)·w=2 at the poles, so u=w/d is needed for a unit vector.
- At the north pole x=(0,0,1): w=a, d=√2, u=(1,i,0)/√2, v=x×conj(u)=(i,1,0)/√2; then conj(u)·v=(i−i)/2=0, conj(v)·v=1 and x·u=x·v=0.
- At x=(1,0,0): λ=1, w=(0,i,0), d=1, u=(0,i,0), v=(1,0,0)×(0,−i,0)=(0,0,−i), again orthonormal and orthogonal to x; so the frame is continuous and unitary at points where the naive choice a itself is not tangent.

*Needs:* 0.3, 0.5; Mathlib `crossProduct`, `Matrix.conjTranspose`; CharacteristicClasses C7 and DifferentialGeometry's sphere orientation for the terminal comparison only.

### 0.7 Antiperiodic sections and the Möbius module

Let `T=AddCircle (1:ℝ)`, `R_ℝ=C(T,ℝ)` and `R_ℂ=C(T,ℂ)`, and write [t] for its quotient coordinate. Define M_𝕜 to be the continuous functions v:ℝ→𝕜 with `v(t+1)=−v(t)` (Mathlib's `Function.Antiperiodic v 1`), for 𝕜=ℝ,ℂ. Give it the right R_𝕜-action `(v·f)(t)=v(t)f([t])`, pointwise inner product `conj(v(t))w(t)` descending to T, and norm `sup_(0≤t≤1)|v(t)|`. Prove boundedness, completeness and independence of the chosen unit interval, and the continuity/quotient-descent laws used here. This is the section module of the Möbius bundle, the nontrivial real line bundle on the circle, while every complex vector bundle on the circle is trivial (Weibel, The K-book, Chapter I, (4.9.1)); the treatment here is explicit and requires no general Serre–Swan theorem.

Put `u(t)=(cos(πt),sin(πt))` and `p([t])=u(t)u(t)ᵀ`. Prove p is a well-defined continuous symmetric idempotent of rank 1 in M₂(R_ℝ). Construct the mutually inverse R_ℝ-linear maps `M_ℝ→pR_ℝ²`, `v↦([t]↦v(t)u(t))`, and `w↦(t↦⟨u(t),w([t])⟩)`. They preserve the pointwise inner product. Thus M_ℝ is a finite projective, with the native image/direct-summand API of 0.4. Prove it has no free basis: evaluations force any free rank to be 1; a generator would be nowhere zero, while every continuous real antiperiodic function has a zero in [0,1] by the intermediate value theorem. Construct `M_ℝ⊕M_ℝ≃R_ℝ²` explicitly using the frame `u(t),u_perp(t)`, where `u_perp(t)=(−sin(πt),cos(πt))`, applied to the two antiperiodic coefficients.

In K₀(R_ℝ), prove `η=[M_ℝ]−[R_ℝ]` has exact order 2. The doubled splitting proves 2η=0. For nonvanishing, 0.4's free stabilization criterion would give `M_ℝ⊕R_ℝ^N≃R_ℝ^(N+1)` if η=0. Pull a putative basis back to ℝ in its frame with monodromy diag(−1,1,…,1): its N+1 members are continuous functions ℝ→ℝ^(N+1) whose matrix B satisfies B(t+1)=diag(−1,1,…,1)B(t) and is invertible at every t because evaluation at a point sends a basis to a basis. Then det B is a continuous nowhere-zero antiperiodic function, contradicting the same zero theorem. Build this evaluation/determinant argument explicitly; nonfreeness alone does not establish a nonzero K₀ class.

For complex scalars put `χ(t)=exp(πit)`. Prove χ is antiperiodic and has modulus 1, and construct the isometric R_ℂ-linear isomorphism `R_ℂ≃M_ℂ`, `f↦(t↦χ(t)f([t]))`, with inverse `v↦([t]↦χ(t)⁻¹v(t))`. Identify scalar extension `M_ℝ⊗_(R_ℝ)R_ℂ≃M_ℂ` for the pointwise real-to-complex ring map, using the balanced tensor carrier of 0.2 and the formula `v⊗f↦(t↦v(t)f([t]))`. Prove the resulting K₀ map sends η to 0. This identifies the actual complexified module with a free line; it does not infer real freeness from complex freeness.

- M_ℝ≅pR_ℝ² is an object of Proj(R_ℝ), not free, with M_ℝ⊕M_ℝ≅R_ℝ²; η=[M_ℝ]−[R_ℝ] has order exactly 2 in K₀(R_ℝ).
- M_ℂ≅R_ℂ, `M_ℝ⊗_(R_ℝ)R_ℂ≃M_ℂ`, and K₀(R_ℝ)→K₀(R_ℂ) sends η to 0.

**Checks.**

- u(t+1)=−u(t), so p([t])=u(t)u(t)ᵀ is 1-periodic (the sign squares away), symmetric, p²=u(uᵀu)uᵀ=p and trace p=cos²+sin²=1, so p has rank 1; the matrix uuᵀ without the normalization |u|=1 is not idempotent.
- The two maps compose to the identity: v↦⟨u,v u⟩=v|u|²=v, and for w=pw, ⟨u,w⟩u=u(uᵀw)=pw=w; both v(t)u(t) and ⟨u(t),w([t])⟩ have the required periodicity because u and v are antiperiodic and w is periodic.
- v(1)=−v(0) for antiperiodic v, so v has a zero in [0,1] by the intermediate value theorem (the constant 1 is periodic but not antiperiodic and has no zero, so the argument uses the sign); χ(t+1)=e^(πi)χ(t)=−χ(t) with |χ|=1, so the complex module is free of rank 1 while the real one is not.

*Needs:* 0.2, 0.3, 0.4; Mathlib `AddCircle`, `Function.Antiperiodic`, `ContinuousMap`, the intermediate value theorem.

### Examples

K₀(k)=ℤ for a field, K₀(ℤ)=ℤ, K₀(M₂(k))≅ℤ with the corner module as generator; the non-free tangent-section module P over C(S²,ℝ) with [P]=2[R]; its complexification P_ℂ free of rank 2 through the explicit frame; the Möbius module M_ℝ with η of order 2 and η↦0 under complexification. These are the worked examples that every later layer recomputes: Layer 2 reads them in K₁ (K₁(k)=kˣ), Layer 6 in a Milnor square and Layer 7 in a glued bundle.

### Dependencies

Mathlib `Module.Finite.exists_comp_eq_id_of_projective`, `ModuleCat.matrixEquivalence`, `RingEquiv.mopMatrix`, `ModuleCat.restrictScalars`, `Function.Antiperiodic`, `crossProduct`; Tau Ceti `TauCeti.SplitK0`, `TauCeti.finiteProjectiveModules`, `TauCeti.BalancedTensorProduct`, the Morita and RingEquiv K₀ equivalences of `CartanMap`; DifferentialGeometry 11.1; CharacteristicClasses C7 for the terminal comparison of 0.6 only.

## Layer 1: Stable matrices, elementary operations and Whitehead's lemma (A1)

### 1.1 Elementary matrices and Eₙ(R)

For each finite index type n let GLₙ(R) be Mathlib's `Matrix.GeneralLinearGroup n R`, and define eᵢⱼ(a)=1+aEᵢⱼ for i≠j, with Eᵢⱼ=`Matrix.single i j 1`. Prove inversion by replacing a by −a; same-index addition eᵢⱼ(a)eᵢⱼ(b)=eᵢⱼ(a+b); distant commutation [eᵢⱼ(a),eₖₗ(b)]=1 for j≠k and i≠l; and [eᵢⱼ(a),eⱼₖ(b)]=eᵢₖ(ab) for distinct i,j,k. State the index conditions on every identity; do not replace ab by ba. Prove ring-map, block embedding and reindexing formulas. Define Eₙ(R), written `elementary`, as the subgroup generated by these units; provide finite-product membership witnesses, induction and lift/map lemmas. Supply upper and lower rectangular block-unipotent decompositions into elementary matrices. For commutative R, prove that the image under `Matrix.SpecialLinearGroup.toGL` of the subgroup of `Matrix.SpecialLinearGroup n R` generated by the transvections `Matrix.transvection i j c`, i≠j, is `elementary`; neither pinned library names that subgroup of SL.

- `elementary n` is a subgroup of GLₙ(R) containing every eᵢⱼ(a), and every element is a finite product of them.
- Ring maps R→S send Eₙ(R) into Eₙ(S); block embeddings and reindexings send Eₙ into Eₘ.
- A block-unipotent matrix [[1,A],[0,1]] is a product of elementary matrices, one per entry of A.

**Checks.**

- e₁₂(a)e₁₂(b)=1+(a+b)E₁₂ because E₁₂²=0, and e₁₂(a)e₁₂(−a)=1; a definition with 1−aEᵢⱼ would still be a generator set but would reverse the sign law.
- In GL₃ over R=M₂(k) with a=E₁₂ and b=E₂₁ (matrix units of R as coefficients), [e₁₂(a),e₂₃(b)]=e₁₃(ab)=e₁₃(E₁₁), while e₁₃(ba)=e₁₃(E₂₂)≠e₁₃(E₁₁): the order of the product matters over a noncommutative ring.
- Over a field k, Eₙ(k)=SLₙ(k) for every n, so E₂(𝔽₂)=SL₂(𝔽₂)=GL₂(𝔽₂)≅S₃ is not abelian; a definition that included the diagonal matrices as generators would give GLₙ(k) instead.

*Needs:* Mathlib `Matrix.GeneralLinearGroup`, `Matrix.single`, `Subgroup.closure`, `Matrix.transvection`, `Matrix.SpecialLinearGroup.toGL`.

### 1.2 The stable general linear group

Construct GL∞(R) as the directed colimit of GLₙ(R) under g↦diag(g,1), using the direct limits of `Mathlib.Algebra.Colimit` and proving the full directed-system laws. Provide canonical embeddings, injectivity, finite-stage representatives, equality at a common finite stage, multiplication/inverse at a common stage, universal mapping property and induced ring maps. Prove the comparison with finitary automorphisms of the countable free module that fix every basis vector outside a finite set and preserve its finite coordinate complement. Define E∞(R) as the union/generated subgroup of the embedded Eₙ(R), with the precise finite-stage membership criterion. Arbitrary finite index types compare by finite reindexing.

- Every element of GL∞(R) is the image of some g∈GLₙ(R), and two such images are equal iff they agree after stabilizing to a common size.
- GLₙ(R)→GL∞(R) is an injective homomorphism, and E∞(R) is the union of the images of the Eₙ(R).
- GL∞ and E∞ are functorial in ring maps and commute with filtered colimits of rings.

**Checks.**

- The element diag(−1)∈GL₁(ℤ) and diag(−1,1)∈GL₂(ℤ) have the same image in GL∞(ℤ); diag(−1,−1) is a different element, since the two differ at every common stage.
- Over the zero ring GLₙ(0) is trivial for every n and GL∞(0)=1.
- The finitary automorphism of ℤ^(ℕ) sending e₂ to e₂+e₁ and fixing every other eₖ is the image of e₁₂(1)∈GL₂(ℤ) under the column convention (column j is the image of eⱼ), so it has finite stage 2; it is not the image of any element of GL₁(ℤ)={±1}.

*Needs:* 1.1; Mathlib direct limits (`Mathlib.Algebra.Colimit`), `Matrix.fromBlocks`.

### 1.3 Whitehead's lemma

Give an explicit elementary factorization of diag(T,T⁻¹) for every T∈GLₙ(R), including n=0. Start with the three block-unipotent product [[0,T],[−T⁻¹,0]]=[[1,T],[0,1]]·[[1,0],[−T⁻¹,1]]·[[1,T],[0,1]] and multiply by the constant block rotation [[0,−I],[I,0]] to obtain diag(T,T⁻¹); factor that constant rotation as well. Deduce conjugation invariance of E∞ and that stable commutators lie in E∞. Conversely every elementary generator is a stable commutator by adjoining a distinct third index and taking b=1. Prove E∞=[GL∞,GL∞], normality, perfectness of E∞, and the abelianity of GL∞/E∞ (Weibel, The K-book, Chapter III, Whitehead's Lemma 1.3.3 with the factorization (1.3.4), and Lemma 1.3.2). At finite size this is the pair `whitehead_commutator_elementary`, that diag(ghg⁻¹h⁻¹,Iₙ) is a product of elementary matrices of size 2n for all g,h∈GLₙ(R) (Lemma 1.3.3, (1.3.4)), and `elementary_le_commutator`, that Eₙ(R)≤[GLₙ(R),GLₙ(R)] when n≥3, because Eₙ(R) is perfect for n≥3 (Lemma 1.3.2). In finite rank do not assume Eₙ is normal or equal to a commutator subgroup without additional hypotheses.

- `whitehead_commutator_elementary`: diag([g,h],Iₙ)∈E₂ₙ(R) for g,h∈GLₙ(R).
- `elementary_le_commutator`: Eₙ(R)≤[GLₙ(R),GLₙ(R)] for n≥3.
- E∞(R)=[GL∞(R),GL∞(R)] is perfect and normal, and GL∞(R)/E∞(R) is abelian.

**Checks.**

- For n=1, T=−1 over ℤ: [[1,−1],[0,1]]·[[1,0],[1,1]]·[[1,−1],[0,1]]=[[0,−1],[1,0]], the rotation, whose square is −I=diag(−1,(−1)⁻¹); so diag(−1,−1)∈E₂(ℤ) although −1∉E₁(ℤ)=1.
- Eₙ(R) is perfect for n≥3 because eᵢⱼ(a)=[eᵢₖ(a),eₖⱼ(1)] with k a third index; for n=2 over 𝔽₂, E₂(𝔽₂)≅S₃ has abelianization ℤ/2, so the bound n≥3 in `elementary_le_commutator` is needed: E₂(𝔽₂)=GL₂(𝔽₂) is not contained in [GL₂(𝔽₂),GL₂(𝔽₂)]≅ℤ/3.
- For n=0 the factorization is the empty product and diag(T,T⁻¹) is the empty matrix.

*Needs:* 1.1, 1.2.

### 1.4 Lifting elementary matrices through surjections

Prove elementary products lift invertibly, with the same matrix size, through every surjective unital ring map, by lifting their finitely many coefficients. In particular diag(T,T⁻¹) lifts through any surjection to R. This never says that an arbitrary invertible matrix lifts. The class of all universally liftable matrices is not used as the defining relation: −1 lifts through every unital surjection and its class in K₁(ℤ) is nonzero. Supply this example explicitly.

- For a surjection π:A→R and e∈Eₙ(R) there is ẽ∈Eₙ(A) with π(ẽ)=e; a recorded elementary word lifts word by word.

**Checks.**

- For π:ℤ→𝔽₅ and e=diag(2,3)=diag(2,2⁻¹)∈E₂(𝔽₅), the elementary word of 1.3 lifts to an element of E₂(ℤ) of determinant 1, not to the entrywise lift diag(2,3), whose determinant 6 is not a unit of ℤ: the lift is of the word, not of the entries.
- The matrix 2∈GL₁(𝔽₅) has no invertible lift in GL₁(ℤ)={±1}: invertible matrices do not lift in general.
- −1∈GL₁(ℤ) lifts through every surjection A→ℤ (to −1_A), and [−1]≠0 in K₁(ℤ)={±1} (2.3): universal liftability is not the relation defining K₁.

*Needs:* 1.1, 1.3.

### Examples

The rotation [[0,−1],[1,0]] as a product of three elementary matrices over ℤ, and −I₂ as its square; the perfectness witness eᵢⱼ(a)=[eᵢₖ(a),eₖⱼ(1)] for n≥3 and its failure for GL₂(𝔽₂)≅S₃; the lift of diag(2,2⁻¹)∈E₂(𝔽₅) to E₂(ℤ).

### Dependencies

Mathlib `Matrix.GeneralLinearGroup`, `Matrix.single`, `Matrix.fromBlocks`, `Subgroup.closure`, `commutator`, the direct limits of `Mathlib.Algebra.Colimit`; Layer 0 only for the comparison of GL∞ with finitary automorphisms of the countable free module.

## Layer 2: Algebraic K₁ and projective automorphisms (A2)

### 2.1 K₁(R)

Define K₁(R)=Abelianization(GL∞(R)) and identify it canonically with GL∞/E∞ using 1.3. Use additive notation with [uv]=[u]+[v]. Give the class map on every GLₙ, common-stage induction, the elementary and conjugation relations, block-sum formula [diag(u,v)]=[u]+[v], inverse formula, generation and universal property for elementary-invariant stable homomorphisms to abelian groups. Prove the colimit comparison with the finite-rank **abelianizations** of GLₙ; the individual Eₙ quotients need not be groups. Supply ring functoriality, zero-ring and finite-product formulas, and continuity under filtered colimits of unital rings by descending finite matrices and their finite inverse/elementary witnesses.

- K₁(R)≅GL∞(R)/E∞(R), an abelian group with [diag(u,v)]=[u]+[v], [u⁻¹]=−[u] and [gug⁻¹]=[u].
- K₁ is a functor on rings, K₁(0)=0, K₁(R×S)≅K₁(R)⊕K₁(S), and K₁ commutes with filtered colimits.

**Checks.**

- K₁(0)=0 and K₁(R×S)=K₁(R)⊕K₁(S) by components; a definition as the abelianization of a single GLₙ would give, for R=𝔽₂ and n=2, the group ℤ/2 of 2.3 instead of 0.
- [diag(u,u⁻¹)]=0 by Whitehead, so [u⁻¹]=−[u]; the quotient by the normal closure of the elementary matrices in a fixed GLₙ would not see this relation at n=1.
- Over ℤ, [−1]≠0 (2.3) while [diag(−1,−1)]=0: the class of a matrix is not determined by its entries being universally liftable (1.4).

*Needs:* 1.2, 1.3; Mathlib `Abelianization`, `QuotientGroup`.

### 2.2 The automorphism presentation K₁ᴮ(C)

Give the intrinsic Bass presentation by automorphisms for an arbitrary small additive category C: the abelian group K₁ᴮ(C) generated by pairs [X,α], α∈Aut(X), with isomorphism invariance [Y,fαf⁻¹]=[X,α] for f:X≅Y, composition [X,αβ]=[X,α]+[X,β] and direct sums [X⊕Y,α⊕β]=[X,α]+[Y,β], functorial in additive functors. Prove that it already satisfies the split-exact relation: an upper-triangular automorphism of X⊕Y with diagonal blocks α,β has class [X,α]+[Y,β], because the unipotent factor becomes a commutator of elementary blocks after adding a second copy of Y. The projective automorphisms [P,u] are the case C=Proj(R). Construct its comparison with the matrix definition of 2.1 by choosing P⊕Q≅Rⁿ and adjoining the identity on Q. Prove independence of complement, trivialization and stabilization. Prove that this is an isomorphism K₁ᴮ(Proj(R))≅K₁(R) and derive the relation for an automorphism of a split short exact sequence, including its upper-triangular off-diagonal block. Develop naturality and additivity of the automorphism class, identity, inverse and conjugation. This is not a claim that every stabilized automorphism is trivial.

- K₁ᴮ(C) is an abelian group with [X,id]=0, [X,α⁻¹]=−[X,α], [X,αβ]=[X,α]+[X,β], [X⊕Y,α⊕β]=[X,α]+[Y,β], and [X⊕Y,upper triangular with diagonal α,β]=[X,α]+[Y,β].
- K₁ᴮ(Proj(R))≅K₁(R), sending [Rⁿ,u] to the class of u.
- K₁ᴮ is functorial in additive functors C→D.

**Checks.**

- For C=Proj(k), k a field, [kⁿ,g]↦det g is well defined on the presentation (det is invariant under conjugation, multiplicative, and multiplicative on block sums), so K₁ᴮ(Proj(k))→kˣ is onto and agrees with 2.3; a presentation lacking the conjugation relation would not factor through it.
- The upper-triangular automorphism [[α,γ],[0,β]] of X⊕Y has class [X,α]+[Y,β]: for k-spaces its determinant is det α·det β, independent of γ.
- For the zero additive category K₁ᴮ(0)=0, and over ℤ the automorphism −1 of ℤ has class [ℤ,−1]≠0 of order 2 (2.3).

*Needs:* 0.1, 1.3, 2.1.

### 2.3 Morita invariance, determinants and computations

Construct the Morita equivalence K₁(Mₙ(R))≅K₁(R), n≥1, by flattening block matrices and compare it with the finite-projective equivalence of 0.3, including corner embeddings and repeated matrix sizes. Prove compatibility with products and filtered colimits; compatibility with Layer 6's boundary is proved in 6.3. For commutative R, construct the split determinant map K₁(R)→Rˣ with scalar section, define SK₁(R) as its kernel and identify the resulting decomposition K₁(R)≅Rˣ⊕SK₁(R). Compute K₁(F)=Fˣ for fields by Gaussian elimination, K₁(D)=Dˣ/[Dˣ,Dˣ] for division rings using the Dieudonné determinant, K₁(ℤ)={±1}, and finite products/matrix algebras via these maps. Build the Dieudonné determinant, its elementary reduction independence and multiplicativity here. State it as `dieudonne_determinant`: for a division ring D and n≥2 there is a surjective homomorphism GLₙ(D)→Dˣ/[Dˣ,Dˣ] with kernel exactly Eₙ(D), sending the diagonal matrix with one entry d and the others 1 to the class of d (Weibel, The K-book, Chapter III, 1.2.4 and Exercise 1.2). For n=1 the kernel is [Dˣ,Dˣ], not E₁(D)=1, so the bound n≥2 is needed for a noncommutative D. Normalize [−1]∈K₁(ℤ) as the nonzero order-two class.

- `dieudonne_determinant`: for a division ring D and n≥2, a surjection GLₙ(D)→Dˣ/[Dˣ,Dˣ] with kernel Eₙ(D) and the stated value on diagonal matrices.
- K₁(F)=Fˣ for a field, K₁(D)=Dˣ/[Dˣ,Dˣ] for a division ring, K₁(ℤ)={±1}, K₁(Mₙ(R))≅K₁(R).
- For commutative R, K₁(R)≅Rˣ⊕SK₁(R).

**Checks.**

- K₁(𝔽₂)=𝔽₂ˣ=0 while GL₂(𝔽₂)≅S₃ has abelianization ℤ/2: a finite-rank abelianization is not K₁ (the extra class dies at size 3 by 1.3); Weibel's parenthetical "except n=2 when D=𝔽₂" in 1.2.4 concerns the commutator subgroup, since GL₂(𝔽₂)/E₂(𝔽₂)=0=𝔽₂ˣ.
- K₁(ℤ)={±1}: det gives K₁(ℤ)→{±1} onto, and SK₁(ℤ)=0 because SLₙ(ℤ) is generated by elementary matrices (Euclidean algorithm); [−1]↦−1 is the nonzero class.
- For D=ℍ, [ℍˣ,ℍˣ] is the group of unit quaternions and ℍˣ/[ℍˣ,ℍˣ]≅ℝ_(>0) by the norm, so the Dieudonné determinant of diag(i,1) is trivial although i≠1, while that of diag(2,1) is 2; for n=1 the kernel of ℍˣ→ℝ_(>0) is the unit sphere, not E₁(ℍ)=1.

*Needs:* 0.3, 1.1, 1.3, 2.1, 2.2; Mathlib `Matrix.det` for the commutative determinant, `ModuleCat.matrixEquivalence`.

### Examples

K₁(k)=kˣ, K₁(𝔽₂)=0 against GL₂(𝔽₂)≅S₃, K₁(ℤ)={±1} with [−1] the generator, K₁(ℍ)≅ℝ_(>0), and the determinant [[α,γ],[0,β]]↦det α·det β on the automorphism presentation.

### Dependencies

Layers 0–1; Mathlib `Abelianization`, `QuotientGroup`, `Matrix.det`, `ModuleCat.matrixEquivalence`; Tau Ceti `TauCeti.finiteProjectiveModules` for C=Proj(R).

## Layer 3: Relative groups and unitizations (A3)

### 3.1 Relative K₁(R,I)

For a two-sided ideal I⊲R, define GL∞(R,I)=ker(GL∞(R)→GL∞(R/I)) and E∞(R,I) as the normal closure in E∞(R) of the elementary matrices with entries in I. Prove the relative commutator formulas, stability, normality of E∞(R,I) in GL∞(R,I), and that K₁(R,I)=GL∞(R,I)/E∞(R,I) is abelian (Weibel, The K-book, Chapter III, Relative Whitehead Lemma 2.1 and Definition 2.2). Give finite matrix representatives and their stabilization, ring/ideal-map functoriality, products and independence of presentations. The map K₁(R,I)→K₁(R) has image ker(K₁(R)→K₁(R/I)); it is not defined as that kernel. Prove that K₁(R,I)→K₁(R)→K₁(R/I) is exact at K₁(R); 5.2 extends this sequence to the left by K₂. No terminal zero is appended when units do not lift stably.

- K₁(R,I) is an abelian group, functorial in morphisms of pairs (R,I)→(S,J).
- K₁(R,I)→K₁(R)→K₁(R/I) is exact at K₁(R).

**Checks.**

- I=R: GL∞(R,R)=GL∞(R) (the quotient is the zero ring) and E∞(R,R)=E∞(R), so K₁(R,R)=K₁(R); I=0: GL∞(R,0)=1 and K₁(R,0)=0.
- R=ℤ, I=5ℤ: ker(K₁(ℤ)→K₁(𝔽₅)) is trivial because −1↦4≠1 in 𝔽₅ˣ, so the image of K₁(ℤ,5ℤ)→K₁(ℤ) is 0; with I=2ℤ it is all of K₁(ℤ)={±1}, since −1≡1 mod 2.
- E∞(R,I) is the normal closure in E∞(R) of the eᵢⱼ(x), x∈I, as in the Relative Whitehead Lemma: a conjugate e₁₂(r)e₂₁(x)e₁₂(−r) with x∈I, r∈R lies in it by definition and lies in GL∞(R,I) because e₂₁(x)≡1 mod I; for I=R the normal closure is E∞(R) and the quotient is K₁(R).

*Needs:* 1.2, 1.3, 2.1; Mathlib `Ideal.Quotient`.

### 3.2 The relative triple group of an additive functor

For an additive functor T:C→D between small additive categories, define the relative group K₀(T) by triples (P,α,Q), where P and Q are objects of C and α:T(P)≅T(Q) is an isomorphism in D. Impose isomorphism invariance under isomorphisms f:P≅P′, g:Q≅Q′ with α′∘T(f)=T(g)∘α, the direct-sum relation (P,α,Q)+(P′,α′,Q′)=(P⊕P′,α⊕α′,Q⊕Q′) and the composition relation (P,α,Q)+(Q,β,S)=(P,β∘α,S); these give (P,id,P)=0, (Q,α⁻¹,P)=−(P,α,Q) and (P,T(γ),Q)=0 for every isomorphism γ:P≅Q. Construct the difference map K₀(T)→K₀(C), [(P,α,Q)]↦[P]−[Q], into the `TauCeti.SplitK0` group of C, the maps for additive commuting squares with a specified comparison isomorphism, generation by triples and the universal property. Weibel's presentation imposes additivity along every short exact sequence of triples instead of along direct sums only. Prove that the two presentations agree when T is full: after splitting P≅P′⊕P″ and Q≅Q′⊕Q″, the isomorphism α of a short exact sequence of triples is upper triangular with diagonal blocks α′,α″ and corner γ:T(P″)→T(Q′); write α as the unipotent automorphism with corner γα″⁻¹ composed with α′⊕α″, lift the unipotent factor to an automorphism v of Q by fullness, and use (Q,T(v),Q)=0. Prove that base change T_I=−⊗ᵣR/I:Proj(R)→Proj(R/I) is full: a right R/I-linear map P/PI→Q/QI lifts to P→Q because P is projective and Q→Q/QI is onto. Define K₀(R,I)=K₀(T_I), with its maps for morphisms of ring/ideal pairs, independence of small-model choices and compatibility with opposite conventions (Weibel, The K-book, Chapter II, Definition 2.10, Exercise 2.17(a)–(b) and Exercise 2.4(e)).

- K₀(T) is an abelian group generated by the triples, with the three relations and their consequences (P,id,P)=0, (Q,α⁻¹,P)=−(P,α,Q), (P,T(γ),Q)=0.
- The difference map K₀(T)→K₀(C) and the functoriality in commuting squares.
- For full T, K₀(T) agrees with Weibel's short-exact-sequence presentation; T_I is full and K₀(R,I)=K₀(T_I).

**Checks.**

- For T=id every triple (P,α,Q) is isomorphic to (Q,id,Q) through f=α and g=id, so K₀(id)=0; a presentation without the invariance relation would not vanish here.
- For D=0 the isomorphism α is unique and the difference map is an isomorphism K₀(T)≅K₀(C) with inverse [P]↦[(P,0,0)]; hence K₀(R,R)=K₀(R), while I=0 gives K₀(R,0)=0.
- For R=ℤ and I=5ℤ the five-term sequence of 3.3 gives K₀(ℤ,5ℤ)≅𝔽₅ˣ/{±1}≅ℤ/2, generated by [(ℤ,2,ℤ)], with zero difference map since both modules have rank one; the class of 2 is nonzero because 2∉{±1} in 𝔽₅ˣ.
- Base change ℤ→ℚ is summand-dense but not full. There (ℤ²,diag(2,1/2),ℤ²)=(ℤ,2,ℤ)+(ℤ,1/2,ℤ)=(ℤ,1,ℤ)=0 by the direct-sum and composition relations, yet after adding any identity triple it is not isomorphic to an identity triple, since that would make diag(2,1/2)⊕Iₘ a product T(g)⁻¹T(f) of integral invertible matrices; so the equality criterion of 3.3 needs fullness, while δ and exactness at K₀(T) and K₀(C) do not.

*Needs:* 0.1, 0.3; Tau Ceti `TauCeti.SplitK0`, `TauCeti.SplitK0.liftEquiv`.

### 3.3 The boundary and the exact sequences

Call T summand-dense if every object of D is a direct summand of some T(P). For summand-dense T construct the boundary δ:K₁ᴮ(D)→K₀(T) on 2.2's automorphism presentation: for α∈Aut(X) choose X⊕Y≅T(P) and send [X,α] to the class of (P,α⊕id_Y,P) transported along that isomorphism. Prove independence of the complement and of the transport, preservation of composition and direct sums, and naturality in commuting squares of such functors. Fullness is not used: by the composition relation the class of (P,σβσ⁻¹,P) equals that of (P,β,P) for every automorphism σ of T(P), and two choices X⊕Y≅T(P) and X⊕Y′≅T(P′) are compared on T(P⊕P′)≅X⊕Y⊕X⊕Y′ by the automorphism exchanging the two copies of X. Prove that K₁ᴮ(D)→K₀(T)→K₀(C)→K₀(D) is exact at K₀(T) and K₀(C) (Weibel, The K-book, Chapter II, (2.10.2) and Exercise 2.17(c)–(e), stated there for cofinal functors). For full T prove the equality criterion: two triples have the same class in K₀(T) iff they become isomorphic after adding an identity triple (S,id,S) to each; the stable isomorphism classes satisfy the composition relation and have inverses because the automorphism `[[0,α⁻¹],[α,0]]` of T(P)⊕T(Q) is T of a product of three unipotent automorphisms, lifted by fullness, and diag(−1,1). Deduce that for T full and summand-dense the sequence K₁ᴮ(C)→K₁ᴮ(D)→K₀(T)→K₀(C)→K₀(D) is exact at its three interior terms: if δ[X,α]=0 the criterion writes α⊕id as T of an automorphism of C after stabilization. Base change T_I is full (3.2) and summand-dense, since every finite projective R/I-module is a summand of (R/I)ⁿ=T_I(Rⁿ). Through 2.2's comparison of K₁ᴮ(Proj(R)) with matrix K₁ its boundary sends the class of u∈GLₙ(R/I) to [(Rⁿ,u,Rⁿ)], and the sequence becomes K₁(R)→K₁(R/I)→K₀(R,I)→K₀(R)→K₀(R/I), with all naturality diagrams for morphisms of ring/ideal pairs. Neither the presentation nor these exactness proofs uses Q-theory, a higher K-spectrum or a homotopy-fibre comparison; those comparisons consume the groups and maps of this layer.

- δ:K₁ᴮ(D)→K₀(T) for summand-dense T, a homomorphism natural in commuting squares.
- Exactness of K₁ᴮ(D)→K₀(T)→K₀(C)→K₀(D) at K₀(T) and K₀(C) for summand-dense T.
- For full summand-dense T, the equality criterion and exactness at K₁ᴮ(D); for rings, the five-term sequence K₁(R)→K₁(R/I)→K₀(R,I)→K₀(R)→K₀(R/I).

**Checks.**

- For T_I with R=ℤ, I=5ℤ: δ(2)=[(ℤ,2,ℤ)]≠0, δ(−1)=δ(4)=[(ℤ,T(−1),ℤ)]=0 since −1 lifts, and δ(2)+δ(3)=δ(6)=δ(1)=0, so δ(3)=−δ(2)=δ(2) in ℤ/2; the sequence {±1}→𝔽₅ˣ→K₀(ℤ,5ℤ)→ℤ→ℤ with the last map an isomorphism gives K₀(ℤ,5ℤ)≅ℤ/4 / {±1}≅ℤ/2.
- For T=id, δ[X,α]=[(X,α,X)]=[(X,T(α),X)]=0 and K₀(id)=0: the sequence is exact with the middle group zero, and exactness at K₁ᴮ(D)=K₁ᴮ(C) holds because the first map is the identity.
- For ℤ→ℚ (summand-dense, not full), δ(2)=[(ℤ,2,ℤ)]≠0 because (P,α,Q)↦det α modulo ±1 is well defined on the presentation (integral isomorphisms have determinant ±1) and sends it to 2; so ker δ={±1}=im(K₁(ℤ)→K₁(ℚ)), and exactness at K₁ᴮ(D) holds in this non-full instance although the equality criterion fails (3.2).

*Needs:* 2.2, 3.2.

### 3.4 Dorroh unitization and reduced groups

For a nonunital associative ring J use the integral Dorroh unitization J⁺=ℤ⊕J with (m,x)(n,y)=(mn,my+nx+xy), and define reduced Kᵢ(J) as ker(Kᵢ(J⁺)→Kᵢ(ℤ)), i=0,1; 5.2 gives the case i=2. Build the augmentation splitting, maps for nonunital homomorphisms and the comparison with a unital ring regarded as nonunital via J⁺≅ℤ×J. For complex algebras also construct ℂ⊕A and the comparison appropriate to ℂ-linear maps; distinguish the base-ring-relative construction from arbitrary nonunital-ring excision. No target asserts that integral reduced K-theory of an ideal equals every ambient relative group without an excision theorem. Export precisely these relative-unitization interfaces to the cyclic-pairing consumer named in Scope.

- J⁺ is a unital ring with augmentation J⁺→ℤ split by m↦(m,0); reduced Kᵢ(J)=ker(Kᵢ(J⁺)→Kᵢ(ℤ)) is functorial in nonunital homomorphisms.
- For unital A, J⁺≅ℤ×A and reduced Kᵢ(A)≅Kᵢ(A).

**Checks.**

- For unital A, (m,x)↦(m,m·1_A+x) is a ring isomorphism J⁺≅ℤ×A: (m,x)(n,y)=(mn,my+nx+xy) maps to (mn,(m1+x)(n1+y)); hence reduced K₀(A)=ker(K₀(ℤ)⊕K₀(A)→K₀(ℤ))=K₀(A).
- J=0: J⁺=ℤ and reduced Kᵢ(0)=0.
- J=5ℤ⊂ℤ: J⁺≅{(m,k)∈ℤ×ℤ : k≡m mod 5}, the fibre product ℤ×_𝔽₅ℤ of 7.2, by (m,x)↦(m,m+x); so reduced K₀(5ℤ)=ker(K₀(ℤ×_𝔽₅ℤ)→K₀(ℤ))≅ℤ/2 by 7.2, which here agrees with K₀(ℤ,5ℤ)≅ℤ/2 of 3.2; a unitization over ℂ instead of ℤ would not even be defined for this J.

*Needs:* 0.3, 2.1, 3.1.

### Examples

K₁(ℤ,5ℤ)→K₁(ℤ) with zero image; K₀(ℤ,5ℤ)≅ℤ/2 generated by (ℤ,2,ℤ); the non-full base change ℤ→ℚ where the equality criterion fails but δ(2)≠0; J⁺ of 5ℤ as the arithmetic fibre product.

### Dependencies

Layers 0–2; Mathlib `Ideal.Quotient`; Tau Ceti `TauCeti.SplitK0`.

## Layer 4: Stable range and finite matrix sizes (A4)

### 4.1 Stable range and the stability theorems

Define right-unimodular rows (a₁,…,aₙ), with witnesses Σaᵢbᵢ=1, and Bass stable range at most s, written `HasStableRangeLE R s`: every right-unimodular (s+1)-row can be shortened to a right-unimodular row (aᵢ+aₛ₊₁cᵢ)ᵢ≤s. Prove the equivalent all-longer-row formulation, monotonicity in s, left/opposite-ring comparison, and invariance under ring isomorphism. Develop the elementary row-reduction, orbit and stabilization lemmas from this definition. Prove for stable range at most s that GLₙ(R)→K₁(R) is surjective for n≥s, and GLₙ(R)/Eₙ(R)→K₁(R) is an isomorphism for n≥s+1, proving normality there (Weibel, The K-book, Chapter III, Remark 1.2.5 and Exercise 1.3). At finite size these are `surjective_stability`, that for n≥s every invertible matrix of size n+k is diag(h,Iₖ) times an elementary matrix, and `injective_stability`, that for n≥s+1 an invertible g of size n with diag(g,Iₖ) elementary is itself elementary. Stable range at most 0 holds only for the zero ring, since the row (1) is unimodular. For n≥max(3,s+1), deduce [GLₙ,GLₙ]=Eₙ and hence the corresponding isomorphism from the finite-rank abelianization. State the bounds as sufficient ranges, not as the smallest n in every ring; identify the finite-rank kernel outside the stable range by its actual quotient map.

- `HasStableRangeLE R s` is monotone in s, invariant under ring isomorphism, and equivalent to its opposite-ring and all-longer-row formulations.
- `surjective_stability` and `injective_stability` as stated, hence K₁(R)≅GLₙ(R)/Eₙ(R) for n≥s+1.
- Eₙ(R) is normal in GLₙ(R) for n≥s+1, and equals [GLₙ,GLₙ] for n≥max(3,s+1).

**Checks.**

- `HasStableRangeLE R 0` forces 1=0: the row (1) is unimodular and its shortening is the empty row, whose witness sum is 0; so only the zero ring has stable range at most 0.
- ℤ does not have stable range at most 1: (2,5) is unimodular (2·3+5·(−1)=1) but 2+5c is never ±1; ℤ has stable range at most 2 by 4.2, matching Krull dimension 1. A field has stable range at most 1: for (a₀,a₁) unimodular, a₀+a₁c is a unit with c=0 if a₀≠0 and c=1 otherwise.
- GL₂(𝔽₂)≅S₃ has abelianization ℤ/2 while K₁(𝔽₂)=0: the injective bound n≥s+1=2 is sufficient for GL₂/E₂→K₁ (both sides are 0 since E₂(𝔽₂)=GL₂(𝔽₂)) but the abelianization comparison needs n≥3.

*Needs:* 1.1, 1.3, 2.1.

### 4.2 Semilocal rings and Bass's bound

Prove stable range one for semilocal rings, using reduction to their semisimple Artinian quotients and lifting modulo the Jacobson radical (Weibel, The K-book, Chapter I, Exercises 1.5(c) and 1.12(v)); the commutative specialization is `hasStableRangeLE_one_of_finite_maximalSpectrum`, for commutative rings with finitely many maximal ideals. Prove the Bass bound s≤d+1 for commutative Noetherian rings of Krull dimension at most d, `hasStableRangeLE_of_ringKrullDim_le`, with the dimension/drop argument explicitly developed (Bass, Algebraic K-Theory, Benjamin 1968, Theorem V.3.5, as recalled in Weibel, The K-book, Chapter I, Exercise 1.5(b)).

- `hasStableRangeLE_one_of_finite_maximalSpectrum`: a commutative ring with finitely many maximal ideals has stable range at most 1.
- `hasStableRangeLE_of_ringKrullDim_le`: a commutative Noetherian ring of Krull dimension at most d has stable range at most d+1.
- Stable range does not change modulo a radical ideal, and sr(R)≥sr(R/I) for every ideal.

**Checks.**

- A field, a local ring and 𝔽₅×𝔽₇ have stable range at most 1; ℤ (Krull dimension 1, infinitely many maximal ideals) does not, by the row (2,5) of 4.1, so the finiteness of the maximal spectrum cannot be dropped.
- ℤ has stable range at most 2 (d=1), and ℤ[x] (Krull dimension 2) at most 3; the zero ring has Krull dimension ⊥≤d for every d and stable range at most d+1 trivially.
- The Artinian ring 𝔽₂[x]/(x²) has stable range 1 by lifting through its radical (x): the unimodular row (x,1+x) shortens to x+(1+x)·1=1.

*Needs:* 4.1; Mathlib `MaximalSpectrum`, `ringKrullDim`, `IsNoetherianRing`, the Jacobson radical.

### 4.3 Covering dimension

Define the covering-dimension predicate `HasCoveringDimensionLE X d` for a topological space X and d∈ℕ: every open cover of X, taken as a set of open sets, has an open refinement, again a set of open sets each contained in a member of the cover, in which every point lies in at most d+1 distinct members. Counting distinct members rather than indices follows the design of the closed, unmerged Mathlib proposals [#43476](https://github.com/leanprover-community/mathlib4/pull/43476) and [#43475](https://github.com/leanprover-community/mathlib4/pull/43475), which are design sources and not installed declarations. Build on it the strict and finite-dimensional variants, the dimension value in WithBot ℕ∞ (the empty space has value ⊥, dimension −1, and ⊤ means no finite bound), monotonicity in d, homeomorphism invariance, closed-subspace monotonicity and the finite closed-cover theorem for compact Hausdorff spaces. This is Lebesgue covering dimension; no equality with the separate small inductive dimension is assumed.

- `HasCoveringDimensionLE X d` is monotone in d and invariant under homeomorphism.
- For compact Hausdorff X, a closed subspace of X satisfies the predicate with the same d, and a finite closed cover by subspaces of dimension at most d gives dimension at most d.
- The dimension value in WithBot ℕ∞ with its order characterization.

**Checks.**

- A finite discrete space satisfies the predicate with d=0 via the cover by singletons; the empty space satisfies it for every d, with the empty refinement.
- [0,1] fails it with d=0: a refinement of order one is a partition into open sets, so by connectedness it is {[0,1]}, which refines no cover such as {[0,2/3),(1/3,1]}; it satisfies it with d=1.
- The Hilbert cube [0,1]^ℕ fails it for every d, because it contains the closed subspace [0,1]^(d+1), which has dimension d+1; so its value is ⊤.

*Needs:* Mathlib topology (`IsOpen`, `Set.encard`, `CompactSpace`, `T2Space`).

### 4.4 Finite covers and sphere extension

For compact Hausdorff X and d∈ℕ, prove the finite/indexed-cover characterization of `HasCoveringDimensionLE`: every finite indexed open cover admits a finite indexed open refining cover (V_j), a parent map p with V_j⊂U_(p j), and `encard {j : x∈V_j}≤d+1` for every x. Preserve these parents and containment witnesses in every conversion. From the arbitrary-cover predicate take a finite subcover of a refinement, deduplicate/reindex it by its distinct nonempty open sets, and choose each original parent; indexed multiplicity then equals range multiplicity. Conversely take a finite subcover of any given open cover, apply the finite characterization, and compose parent assignments to refine the original cover; a range-order bound follows from the indexed bound. Compare finite-set and finite-family encodings and their refinement maps. Do not transfer a range bound to the original indexing without deduplication: two identical copies of the one-point space have range multiplicity one and indexed multiplicity two. Supply the compact-Hausdorff partition-of-unity and sphere-extension characterizations: characterize `HasCoveringDimensionLE X d` by extension to X of every continuous map from a closed subset into Sᵈ, and prove that this equals Vaserstein's stable-value dimension d(X), the largest d admitting a continuous map X→ℝᵈ with 0 a stable value, equivalently the largest d admitting an essential map to Sᵈ (Vaserstein 1971, the definitions of d(X) and d′(X) on pp. 19–20 and the remark that d(X) agrees with the cube definition). Develop the resulting approximation/extension lemmas for the stable-range upper bound and the nonextendable-map obstruction for its lower bound.

- The finite indexed-cover characterization, with parents and containment witnesses.
- The sphere-extension characterization, and its agreement with Vaserstein's d(X) for compact Hausdorff X (both ∞ when no finite d works).
- Partitions of unity subordinate to finite open covers of compact Hausdorff spaces with the multiplicity bound.

**Checks.**

- Two identical copies of the one-point space, indexed by j∈{1,2}, have range multiplicity one and indexed multiplicity two: a conversion that forgets deduplication would raise the dimension of a point from 0 to 1.
- For X=[0,1] and d=0: the inclusion of the closed subset {0,1} into S⁰={±1} sending 0↦−1, 1↦1 does not extend continuously (connectedness), so the sphere-extension characterization correctly refuses d=0; with d=1 every map from a closed subset into S¹ extends.
- For X a point, d(X)=0: the constant map to ℝ⁰ has 0 as a stable value, and no map to ℝ¹ has 0 as a stable value (perturb by a constant).

*Needs:* 4.3; Mathlib `CompactSpace`, `T2Space`, the Tietze extension theorem, `Metric.sphere`.

### 4.5 Vaserstein's theorems for function rings

Compute the Bass stable rank of C(X,ℂ), for nonempty compact Hausdorff X of covering dimension d, as floor(d/2)+1, and of C(X,ℝ) as d+1; the empty space gives the zero ring. Derive the explicit finite-matrix surjectivity and injectivity ranges of 4.1 for C(X). In terms of the stable-range predicate both calculations are the equivalences `hasStableRangeLE_continuousMap_complex_iff`, that for compact Hausdorff X and s≥1, C(X,ℂ) has stable range at most s iff `HasCoveringDimensionLE X (2s−1)`, and `hasStableRangeLE_continuousMap_real_iff`, the same for C(X,ℝ) with `HasCoveringDimensionLE X (s−1)` (Vaserstein 1971, Theorems 5 and 7, p. 20, stated there for every topological space in terms of d(X), with d(X)=∞ allowed; 4.4 identifies d(X) with covering dimension for compact Hausdorff X). No finite-dimensionality hypothesis is needed: when X has no finite covering dimension, d(X)=∞, the stable rank is infinite and both sides of each equivalence are false for every s. The bound s≥1 is needed: a one-point X has dimension 0 but C(X,ℂ)=ℂ does not have stable range at most 0. The comparison of Bass and topological stable ranks used for these commutative function rings is a theorem here, with its density/shortening proof; no assertion for all Banach algebras is imported without its hypotheses. TopologicalKTheory may consume these ranges for its bundle stabilization, without supplying the algebraic Whitehead theorem backwards.

- `hasStableRangeLE_continuousMap_complex_iff` and `hasStableRangeLE_continuousMap_real_iff` as stated, for compact Hausdorff X and s≥1.
- The Bass stable rank of C(X,ℂ) equals its topological stable rank, the least n such that the unimodular n-rows are dense in C(X,ℂ)ⁿ.

**Checks.**

- X a point: both rings are fields of stable range 1, and the equivalences read "true iff dim ≤ 1" and "true iff dim ≤ 0" at s=1.
- X=[0,1]: the complex ring has stable range 1 (floor(1/2)+1) and the real ring 2 (1+1); at s=1 the real equivalence reads "false iff dim ≤ 0", both false, and at s=2 "true iff dim ≤ 1", both true. X=S²: the complex ring has stable range 2, so at s=1 both sides are false (dim S²=2>1) and at s=2 both true (2≤3).
- X the Hilbert cube: C(X,ℂ) has no finite stable range and X satisfies no `HasCoveringDimensionLE X d`, so both sides are false for every s, as the equivalence requires; X=∅: C(∅,𝕜) is the zero ring, which has every stable range, and the empty space has every dimension bound.

*Needs:* 4.1, 4.3, 4.4; Mathlib `ContinuousMap`, `CompactSpace`, `T2Space`.

### Examples

The row (2,5) over ℤ; GL₂(𝔽₂) against K₁(𝔽₂); the stable ranks 1, 1, 2, 2 of C(pt,ℂ), C([0,1],ℂ), C([0,1],ℝ), C(S²,ℂ); the Hilbert cube with infinite stable rank.

### Dependencies

Layers 1–2; Mathlib `MaximalSpectrum`, `ringKrullDim`, `IsNoetherianRing`, `ContinuousMap`, `CompactSpace`, `T2Space`, `Set.encard`, the Tietze extension theorem.

## Layer 5: Steinberg groups and K₂ (A5)

### 5.1 Steinberg groups and the universal central extension

For arbitrary R define Stₙ(R) on generators xᵢⱼ(a), i≠j, with xᵢⱼ(a)xᵢⱼ(b)=xᵢⱼ(a+b), distant-commutator relations [xᵢⱼ(a),xₖₗ(b)]=1 for i≠l and j≠k, and [xᵢⱼ(a),xⱼₖ(b)]=xᵢₖ(ab) for distinct i,j,k. Use the native free-group/quotient-by-normal-relations API. Provide maps to Eₙ, coefficient maps, index inclusions/reindexing, colimit St∞ and its stable generator induction/universal property. Prove St∞(R)→E∞(R) is the universal central extension of the perfect group E∞(R): it is surjective, its kernel is central, and for every surjective homomorphism q′:E′→E∞ with central kernel there is exactly one homomorphism St∞→E′ whose composite with q′ is St∞→E∞ (Weibel, The K-book, Chapter III, Definition 5.3.1 and Theorem 5.5). Prove centrality in the stable group; do not assert this for every Stₙ without stable-rank hypotheses.

- Stₙ(R) with xᵢⱼ(a)↦eᵢⱼ(a) onto Eₙ(R); St∞(R) as the colimit.
- St∞(R)→E∞(R) is surjective with central kernel and is universal among central extensions of E∞(R).

**Checks.**

- For n=2 there are no three distinct indices, so St₂(R) has only the additivity relations and is the free product of two copies of (R,+); a definition that imposed [x₁₂(a),x₂₁(b)]=1 would make St₂ abelian, which St₂(ℤ)→E₂(ℤ)=SL₂(ℤ) is not.
- The relation [xᵢⱼ(a),xⱼₖ(b)]=xᵢₖ(ab) maps to the identity [eᵢⱼ(a),eⱼₖ(b)]=eᵢₖ(ab) of 1.1, so xᵢⱼ(a)↦eᵢⱼ(a) is well defined; with ba in place of ab it would not be, by the M₂(k) witness of 1.1.
- The trivial extension id:E∞(R)→E∞(R) is central; it is universal iff K₂(R)=0, which fails for R=ℤ, where K₂(ℤ)≅ℤ/2 generated by {−1,−1} (Milnor, Introduction to Algebraic K-Theory, §10).

*Needs:* 1.1, 1.2, 1.3; Mathlib `FreeGroup`, `PresentedGroup`.

### 5.2 K₂, the relative sequence and symbols

Define K₂(R) as the kernel of St∞(R)→E∞(R), obtain its abelian group structure, naturality, products, filtered-colimit and matrix Morita comparisons, and the exact sequence 1→K₂(R)→St∞(R)→GL∞(R)→K₁(R)→0, interpreting the middle image as E∞. Give the relative Steinberg diagram for R→R/I and construct the connecting homomorphism K₂(R/I)→K₁(R,I) to 3.1's relative group by lifting words and comparing their elementary images. Prove independence of words and lifts, and extend 3.1's sequence to K₂(R)→K₂(R/I)→K₁(R,I)→K₁(R)→K₁(R/I), exact at K₂(R/I) and K₁(R,I). For a nonunital ring J define reduced K₂(J) as ker(K₂(J⁺)→K₂(ℤ)) on 3.4's Dorroh unitization, with its augmentation splitting and maps for nonunital homomorphisms. For fields develop Steinberg symbols {a,b}, bilinearity, {a,1−a}=1 and Matsumoto's presentation of K₂(F) by symbols with these relations; distinguish this field computation from the tensor-symbol Milnor K-groups in arbitrary degrees. Compute K₂ of finite fields as zero using that presentation and its finite-field symbol calculation. A general Milnor square in Layer 6 supplies the stated low-degree sequence, not an automatic homotopy-cartesian square of all algebraic K-spectra: any higher-excision theorem must state and prove its additional homological hypotheses, no K₂(Q)→K₁(D) arrow or cyclic Bott continuation is asserted merely from one surjective leg, and the K₂ construction answers the low-degree object question independently of such a continuation.

- K₂(R) is abelian, functorial, and K₂(Mₙ(R))≅K₂(R); the four-term exact sequence 1→K₂(R)→St∞(R)→GL∞(R)→K₁(R)→0.
- The connecting map K₂(R/I)→K₁(R,I) and the exactness of the five-term relative sequence at K₂(R/I) and K₁(R,I).
- Matsumoto's presentation of K₂(F) for a field F, and K₂(𝔽_q)=0.

**Checks.**

- K₂(0)=0: St∞(0) is trivial since all generators xᵢⱼ(0)=1 by additivity.
- Symbols: {a,1−a}=1 and bilinearity give {a,−a}=1 and {a,b}{b,a}=1 for all a,b∈Fˣ; in a finite field 𝔽_q every symbol is trivial, so K₂(𝔽_q)=0, while K₂(ℝ) has the nontrivial symbol {−1,−1} (it is detected by the sign of a Hilbert symbol).
- For R=ℤ and I=5ℤ, the relative sequence K₂(ℤ)→K₂(𝔽₅)=0→K₁(ℤ,5ℤ)→K₁(ℤ)={±1}→𝔽₅ˣ is exact at K₁(ℤ,5ℤ); the map K₁(ℤ,5ℤ)→K₁(ℤ) is zero by 3.1, so its kernel is all of K₁(ℤ,5ℤ), which therefore equals the image of K₂(𝔽₅)=0: K₁(ℤ,5ℤ)=0.

*Needs:* 1.3, 2.1, 3.1, 3.4, 5.1.

### Examples

St₂(R) as a free product; K₂(𝔽_q)=0 from Matsumoto; K₂(ℤ)≅ℤ/2 as the non-universality witness; the relative sequence for (ℤ,5ℤ).

### Dependencies

Layers 1–3; Mathlib `FreeGroup`, `PresentedGroup`.

## Layer 6: Milnor patching and the boundary (A6)

### 6.1 Milnor squares

Let π₁:A₁→Q and π₂:A₂→Q be arbitrary unital maps of arbitrary associative rings, and assume **at least one map is surjective**. First choose π₁ surjective; prove the symmetric formulation. Use D=A₁×_Q A₂ as Mathlib's `RingHom.pullback π₁ π₂`, the subring {(a₁,a₂) | π₁(a₁)=π₂(a₂)} of A₁×A₂, with projections pⱼ given by `RingHom.pullbackFst` and `RingHom.pullbackSnd`. Prove the ring universal property, base-change maps between squares and canonical isomorphisms, matrix/unit compatibility (Mₙ(D)≅Mₙ(A₁)×_(Mₙ(Q))Mₙ(A₂) and GLₙ(D) as the corresponding fibre product of groups), kernels and quotient identifications (ker p₂≅ker π₁ and D/ker p₂≅A₂ when π₁ is surjective), and the corresponding category-theoretic pullback comparison. Do not impose two surjective legs.

- D with p₁, p₂ is the pullback of π₁, π₂ in rings; Mₙ(D) and GLₙ(D) are the fibre products of the matrix rings and groups.
- When π₁ is surjective, p₂ is surjective with kernel ker π₁×0.

**Checks.**

- A₁=A₂=ℤ, Q=𝔽₅, both maps reduction: D={(a,b) | a≡b mod 5}, Dˣ={(1,1),(−1,−1)} since (1,−1) would need 1≡−1 mod 5; p₂ is onto with kernel 5ℤ×0.
- A₁=𝔽₅[t]→Q=𝔽₅[t]/(t²) and A₂=𝔽₅→Q the constants: D≅𝔽₅+t²𝔽₅[t]=𝔽₅[t²,t³] through p₁, which is injective because the second component is determined by the first; here p₂ is onto but π₂ is not.
- Q=0: D=A₁×A₂ and the square is a product, both legs surjective; A₂=Q and π₂=id: D≅A₁ through p₁.

*Needs:* Mathlib `RingHom.pullback`, `RingHom.pullbackFst`, `RingHom.pullbackSnd`.

### 6.2 Patching triples and the patching theorem

Define the category of patching triples (P₁,P₂,α), where Pⱼ is finite projective right Aⱼ and α:P₁⊗Q≅P₂⊗Q is Q-linear, with the extension functors of 0.3; morphisms are compatible pairs. Its inverse functor is the actual module M(P₁,P₂,α)={(x,y)∈P₁×P₂ | α(x⊗1)=y⊗1}. Construct its right D-action, prove finite projectivity and the two canonical base-change isomorphisms M⊗_D Aⱼ≅Pⱼ, and show that restriction/base change and patching are inverse additive equivalences (Weibel, The K-book, Chapter II, Milnor patching; the commutative proof with one surjective leg is Stacks 15.6.9, and Stacks 93.4 spells out the category equivalence and its inverse). Prove full faithfulness, essential surjectivity, coherence of the comparison maps, and compatibility with direct sums, isomorphisms, idempotent images and maps of squares. The theorem is for finite projectives; it does not claim descent for all modules from these hypotheses alone. Give a finite complement and a matrix idempotent for a patched object, with an explicit finite construction; do not treat finite projectivity as an unexplained gluing axiom.

- Patching triples form an additive category, and M(−) is an additive functor from it to Proj(D).
- M(−) and P↦(P⊗_D A₁,P⊗_D A₂,canonical) are inverse equivalences when one leg is surjective.
- For a triple with Pⱼ=Aⱼⁿ and α=u∈GLₙ(Q), M(u) has an explicit finite complement and idempotent (6.3).

**Checks.**

- For the identity triple (A₁ⁿ,A₂ⁿ,1), M=Dⁿ; a definition of M by the condition α(x⊗1)=y⊗1 with α replaced by α⁻¹ would give the same module here but a different one for u≠1, which is why the orientation is fixed in 6.3.
- In the arithmetic square of 6.1, M(2) for u=2∈𝔽₅ˣ is {(a,b)∈ℤ×ℤ | 2a≡b mod 5}, projective of rank one and not free: if it were free on (a,b), the base-change isomorphisms M(2)⊗_D ℤ≅ℤ along the two projections would make a and b generators of ℤ, so a,b∈{±1}, and 2a≡b mod 5 has no solution with a,b=±1; so [M(2)]≠[D] (7.2).
- With π₂ an isomorphism, M(P₁,P₂,α)≅P₁ and the equivalence is the identity on Proj(A₁).

*Needs:* 0.1, 0.2, 0.3, 0.4, 6.1; Stacks 15.6.9 and 93.4 for the commutative proof shape.

### 6.3 The boundary and its matrix formula

Fix α=u∈GLₙ(Q) on Qⁿ and set M(u)={(a,b)∈A₁ⁿ×A₂ⁿ | uπ₁(a)=π₂(b)}. Normalize the boundary by δ([u])=[M(u)]−[Dⁿ]. Relate this module formula to the following finite matrix formula. Choose an invertible lift X∈GL₂ₙ(A₁) of diag(u,u⁻¹), available by 1.3 and 1.4. Let e=diag(Iₙ,0ₙ) and E=(XeX⁻¹,e)∈M₂ₙ(D), using π₁(XeX⁻¹)=e. Then prove δ([u])=[E]−[(e,e)] in K₀(D), where the latter pair is the standard rank-n idempotent over D. The image of E is isomorphic to M(u) with the displayed orientation. This formula uses idempotents, and XeX⁻¹ need not be selfadjoint even when the inputs are C*-algebras. Prove independence of the lift X, matrix size, representative u and all complement choices; more generally, for v∈GLₙ(Q) and m≥0 such that diag(u⊕Iₘ,v⊕Iₘ) lies in E₂₍ₙ₊ₘ₎(Q) with a recorded finite elementary-word witness, lift that word coefficientwise by 1.4 to X′∈E₂₍ₙ₊ₘ₎(A₁), form E′=(X′e′X′⁻¹,e′) with e′=diag(Iₙ₊ₘ,0), and show that [E′]−[(e′,e′)]=δ([u]), independently of v, of the stabilization and of the elementary witness. Invertibility and equal size alone do not suffice: diag(u,v) lifts by 1.4 only when it is elementary, and v=u⁻¹ is the case 1.3 factors explicitly. Equivalently start from [v]=−[u] in K₁(Q) and use 1.2's common-stage criterion to produce the stabilization and the witness. Supply the stabilizing block permutation/conjugation formulas, common-stage lemmas and free-complement steps used in those proofs. Prove δ([uv])=δ([u])+δ([v]), elementary vanishing, invariance under multiplication on either side by matrices lifted from either Aⱼ, and all naturality diagrams. Prove that δ commutes with 2.3's matrix Morita isomorphisms and finite-product decompositions applied to all four rings of the square, and with filtered colimits of squares. Under swapping the two legs and the canonical identification of D, δ changes sign. Give each assertion on matrix representatives before passing to K₁.

- δ:K₁(Q)→K₀(D), δ([u])=[M(u)]−[Dⁿ], a well-defined homomorphism.
- δ([u])=[E]−[(e,e)] for any invertible lift X of diag(u,u⁻¹).
- δ vanishes on the images of K₁(A₁) and K₁(A₂), commutes with Morita and products, and changes sign under swapping the legs.

**Checks.**

- u=1: X=I, E=(e,e), δ(1)=0; and if u=π₁(ũ) for a unit ũ of A₁ then (d₁,d₂)↦(ũ⁻¹d₁,d₂) is a D-linear isomorphism D≅M(u), so δ([u])=0, as exactness at K₁(Q) requires.
- Swapping the legs: the module of the swapped square for u is {(b,a) | uπ₂(b)=π₁(a)}={(a,b) | u⁻¹π₁(a)=π₂(b)}=M(u⁻¹), so δ′([u])=δ([u⁻¹])=−δ([u]). In the square ℤ→𝔽₇←ℤ, K₁(𝔽₇)/(±1)≅ℤ/3 injects into K₀(D) by 6.4, and δ(2)≠δ(4)=δ(2⁻¹)=−δ(2) there (2·4=8≡1 mod 7): the sign is visible, unlike in the 𝔽₅ square where the image is ℤ/2.
- The orientation uπ₁(a)=π₂(b) is the one for which the image of E=(XeX⁻¹,e) is M(u): for n=1 and X=[[ũ,0],[0,ũ⁻¹]] when u lifts, XeX⁻¹=e and M(u)≅D as computed above; with the condition π₁(a)=uπ₂(b) instead one obtains M(u⁻¹) and the boundary of the swapped square.

*Needs:* 0.3, 0.4, 1.3, 1.4, 2.1, 2.3, 6.1, 6.2.

### 6.4 The Mayer–Vietoris exact sequence

With fᵢ=(Kᵢ(p₁),Kᵢ(p₂)) and gᵢ(x,y)=Kᵢ(π₁)x−Kᵢ(π₂)y, prove the sequence

    K₁(D) →ᶠ¹ K₁(A₁)⊕K₁(A₂) →ᵍ¹ K₁(Q) →δ K₀(D) →ᶠ⁰ K₀(A₁)⊕K₀(A₂) →ᵍ⁰ K₀(Q)

is exact **at its four interior terms**: ker g₁=im f₁, ker δ=im g₁, ker f₀=im δ, and ker g₀=im f₀ (Weibel, The K-book, Chapter II, the Mayer–Vietoris sequence of a Milnor square; Grebennikov, Non-surjective Milnor patching diagrams, Section 2.3, for the hypotheses on the legs). Prove every adjacent composite zero and both containments at each named term, with compatible sign choices. In the K₀ proof explicitly stabilize arbitrary projective complements to free ones, convert rectangular equivalence to stable conjugacy, lift diag(U,U⁻¹) and align the quotient idempotents. In the kernel-of-f₀ proof construct the block-centralizer normal form and recover the actual boundary class. In the K₁ proof align stable representatives using elementary lifts; do not infer exactness solely by group-completing the projective patching equivalence. No injectivity of f₁ or surjectivity of g₀ is asserted without another hypothesis.

- Exactness at K₁(A₁)⊕K₁(A₂), K₁(Q), K₀(D) and K₀(A₁)⊕K₀(A₂), for any square with one surjective leg.

**Checks.**

- Arithmetic square ℤ→𝔽₅←ℤ: g₁({±1}⊕{±1})={±1}⊂𝔽₅ˣ, so coker g₁≅ℤ/2 injects into K₀(D) by exactness at K₁(Q) and K₀(D); ker g₀ is the diagonal of ℤ⊕ℤ, so K₀(D)≅ℤ⊕ℤ/2 (7.2).
- Q=0 (a product square): K₁(Q)=K₀(Q)=0, so f₁ is injective and f₀ an isomorphism, which is K₁(A₁×A₂)=K₁(A₁)⊕K₁(A₂) and the same for K₀ (0.3, 2.1).
- g₀ need not be onto: for A₁=A₂=ℤ and Q=ℤ/6≅𝔽₂×𝔽₃ (both legs reduction), K₀(Q)=ℤ² and g₀(x,y)=(x−y,x−y) has image the diagonal; exactness at K₀(A₁)⊕K₀(A₂) still holds, ker g₀ being the diagonal of ℤ⊕ℤ, which is im f₀.

*Needs:* 0.3, 0.4, 1.3, 1.4, 2.1, 6.1, 6.2, 6.3.

### Examples

The arithmetic square with K₀(D)≅ℤ⊕ℤ/2; the 𝔽₇ square where δ(2)≠−δ(2); the one-leg polynomial square with D=𝔽₅[t²,t³]; M(2) as a non-free rank-one projective over ℤ×_𝔽₅ℤ.

### Dependencies

Layers 0–3; Mathlib `RingHom.pullback`, `RingHom.pullbackFst`, `RingHom.pullbackSnd`, `Ideal.Quotient`, `Polynomial`.

## Layer 7: Gluing examples and calculations (A7)

### 7.1 Pushouts of compact Hausdorff spaces and section modules

For compact Hausdorff X,Y,S, continuous i:S→X and j:S→Y, let M be their pushout in compact Hausdorff spaces (`CompHaus.hasColimits`). Construct the isomorphism of C(M,ℂ) with the fibre product of C(X,ℂ) and C(Y,ℂ) over C(S,ℂ), with both norm/topological and underlying-ring comparisons. If i is a closed embedding, prove the restriction C(X)→C(S) is surjective by complex Tietze extension; no embedding or surjectivity is required of j. Consume HilbertModules H5's compact-X comparison between finite-rank Hermitian bundles and finite projective section modules, with TopologicalKTheory T1's bundle category and clutching conventions. Supply the forgetting adapter to 0.1's algebraic finite-projective right C(X)-modules: H2's projection model equips every such module with a compatible Hermitian norm, and every algebraic module map is bounded and adjointable by its finite-matrix realization. Prove independence of metric choices up to module isomorphism, using all continuous fibrewise linear bundle maps as morphisms. Through this equivalence identify 6.2's patched projectives with the actual glued vector bundles, including gluing maps and section modules. Define the corresponding idempotent explicitly and show its class agrees with 6.3. For two closed disks glued along their boundary, use the fixed clutching convention and compare δ of a clutching matrix with the reduced bundle class on the sphere; the reduced class is read in TopologicalKTheory T4's `K(S²)≅ℤ[β]/(β²)`, and the source group of δ stays the algebraic K₁ of C(S¹,ℂ) rather than being replaced by topological K₁. Include the line bundle on S² from a degree-one circle clutching function and its sign under reversing the gluing.

- C(M,ℂ)≅C(X,ℂ)×_(C(S,ℂ))C(Y,ℂ), with C(X)→C(S) surjective when i is a closed embedding.
- The patched module of a clutching triple is the section module of the glued bundle, and δ of the clutching function z (degree one) is ±β in K(S²)≅ℤ[β]/(β²), with the sign fixed by the clutching convention and reversed by swapping the disks.

**Checks.**

- X=Y=point, S=∅: M is two points, C(M)=ℂ², and the fibre product over the zero ring C(∅)=0 is ℂ×ℂ; a construction requiring S nonempty would miss it.
- X=Y=[0,1], S={0,1} embedded as the endpoints of each: M is a circle, and C(S¹) is the fibre product of two copies of C([0,1]) over ℂ²; here both legs are surjective.
- Two disks glued along S¹ with clutching function z^k: δ([z^k])=kδ([z])=±kβ, so degree k gives the k-th power of the Hopf line class; k=0 gives the trivial bundle, class 0.

*Needs:* 0.1, 6.1, 6.2, 6.3; Mathlib `CompHaus.hasColimits`, the Tietze extension theorem; HilbertModules H2 and H5; TopologicalKTheory T1 and T4.

### 7.2 Arithmetic and polynomial Milnor squares

Compute the arithmetic Milnor square A₁=ℤ, A₂=ℤ, Q=𝔽₅, π₁ reduction and π₂ the same reduction, and D={(a,b) | a≡b mod 5}. Compute the units and the normalized sequence using K₁(ℤ)={±1}, K₁(𝔽₅)=𝔽₅ˣ and 0.3's K₀ calculations. Prove ker(K₀(D)→ℤ²)≅𝔽₅ˣ/{±1}≅ℤ/2 and identify its nonzero class by M(2); compute the image of K₀(D) in ℤ² as the diagonal and hence K₀(D)≅ℤ⊕ℤ/2 with rank-one generator. Obtain the compatible group identifications by explicit split maps, not only cardinalities. This example uses two surjective legs, while the gluing example of 7.1 exercises the strictly one-surjective-leg case. For a concrete ring example with only one leg surjective, use A₁=𝔽₅[t]→Q=𝔽₅[t]/(t²) and A₂=𝔽₅→Q via constants; identify D≅𝔽₅+t²𝔽₅[t], its projections and patching modules, and verify the theorem without strengthening hypotheses. Construct Q, the constants map and the pullback isomorphism using native polynomial/ideal quotients.

- K₀(ℤ×_𝔽₅ℤ)≅ℤ⊕ℤ/2, with the torsion class [M(2)]−[D].
- For the polynomial square, ker f₀≅coker g₁≅(1+t𝔽₅)≅ℤ/5, generated by δ([1+t]).

**Checks.**

- In the arithmetic square the classes δ(2) and δ(3) coincide (3=2⁻¹ in 𝔽₅ and the image is ℤ/2) and δ(4)=δ(−1)=0; so exactly one nonzero torsion class, [M(2)]−[D].
- In the polynomial square, K₁(Q)=Qˣ=𝔽₅ˣ×(1+t𝔽₅) (Q is local Artinian, stable range 1 by 4.2), g₁ has image 𝔽₅ˣ (the constants from either leg), so coker g₁≅1+t𝔽₅≅ℤ/5 and ker f₀≅ℤ/5; this agrees with the Picard group of the cuspidal curve D=𝔽₅[t²,t³], which is 𝔽₅ by the conductor sequence (conductor t²𝔽₅[t], D/𝔠=𝔽₅, 𝔽₅[t]/𝔠=Q).
- Replacing 𝔽₅ by 𝔽₂ in the arithmetic square gives K₁(𝔽₂)=0 and K₀(ℤ×_𝔽₂ℤ)≅ℤ: the torsion disappears exactly when 𝔽_pˣ/{±1} is trivial.

*Needs:* 0.3, 2.3, 4.2, 6.1, 6.3, 6.4; Mathlib `Polynomial`, `Ideal.Quotient`.

### Examples

C(S¹) as a fibre product of two interval algebras; the Hopf line bundle class ±β from the degree-one clutching function; K₀(ℤ×_𝔽₅ℤ)≅ℤ⊕ℤ/2; the cusp 𝔽₅[t²,t³] with ker f₀≅ℤ/5.

### Dependencies

Layers 0–4 and 6; Mathlib `CompHaus.hasColimits`, the Tietze extension theorem, `Polynomial`, `Ideal.Quotient`; HilbertModules H2 and H5; TopologicalKTheory T1 and T4.

## Layer 8: Comparison with topological K-theory (A8)

### 8.1 The stable component group and the comparison map

For a unital complex Banach algebra A, define the stable component group K₁ᵗᵒᵖ(A) as the colimit of the groups GLₙ(A)/GLₙ(A)₀ under g↦diag(g,1), where GLₙ(A)₀ is the identity component, a normal subgroup; it is functorial for continuous unital algebra homomorphisms. Continuity is needed: the functor is defined through norm-continuous paths, which a discontinuous ring homomorphism need not preserve. Every elementary matrix is connected to 1 through t↦eᵢⱼ(ta). Therefore construct the natural surjection K₁ᵃˡᵍ(A)→K₁ᵗᵒᵖ(A), which makes K₁ᵗᵒᵖ(A) abelian, and identify its kernel as the image of the stable identity component modulo E∞. Give representative, stabilization, multiplication and functoriality formulas for continuous unital homomorphisms. Show K₁ᵃˡᵍ(ℂ)=ℂˣ and that the comparison kills every class, because every GLₙ(ℂ) is connected. Do not assert algebraic K₁ agrees with topological K₁ even for a dense holomorphically closed subalgebra; its topological homotopy quotient is an extra operation.

- K₁ᵗᵒᵖ(A) is an abelian group, functorial in continuous unital homomorphisms.
- K₁ᵃˡᵍ(A)→K₁ᵗᵒᵖ(A) is a natural surjection with kernel the image of GL∞(A)₀.

**Checks.**

- A=ℂ: K₁ᵃˡᵍ(ℂ)=ℂˣ, K₁ᵗᵒᵖ(ℂ)=0 since GLₙ(ℂ) is connected, and the kernel is all of ℂˣ; A=Mₖ(ℂ): K₁ᵃˡᵍ≅ℂˣ by 2.3 and K₁ᵗᵒᵖ=0 again.
- A=C(S¹,ℂ): the unitary z has winding number 1, which is locally constant on GL₁(A), so [z]≠0 in K₁ᵗᵒᵖ(A); the comparison sends [z]∈K₁ᵃˡᵍ(A) to this nonzero class, while every class [e^f], f∈A, maps to 0 along t↦e^(tf).
- The elementary path t↦eᵢⱼ(ta) stays in GLₙ(A) because eᵢⱼ(ta)⁻¹=eᵢⱼ(−ta); so E∞(A) lies in the stable identity component and the comparison factors through K₁ᵃˡᵍ(A)=GL∞/E∞.

*Needs:* 1.1, 1.2, 2.1; Mathlib `NormedRing`, `ContinuousMap`, path components.

### 8.2 Exponentials and the identity component

For a surjective continuous unital homomorphism of complex Banach algebras, prove exponentials and finite products of exponentials lift through matrix maps. Prove the identity component is the subgroup generated by any sufficiently small norm ball about 1 contained in {g : ‖g−1‖<1}, using the convergent logarithm and its exponential path, and hence equals the path component. A norm ball about 1 need not be inverse invariant. If a symmetric generating neighborhood is used, take an open neighborhood U contained in that ball and replace it by U∩U⁻¹; prove openness, symmetry and containment rather than calling the ball symmetric. All norm-contour/logarithm construction is consumed from BanachAlgebras A2's holomorphic functional calculus with its actual completeness and spectrum hypotheses. Spectral invariance of a noncomplete normed algebra alone supplies neither contour integrals in its own topology nor a continuous functional-calculus path, so the statements here are for complete normed algebras. No six-term cyclic sequence or Bott continuation is asserted for arbitrary rings from Layer 6.

- GLₙ(A)₀ is generated by {g : ‖g−1‖<1}, equals the path component of 1, and consists of finite products of exponentials.
- Exponentials lift through surjective continuous unital homomorphisms, so K₁ᵗᵒᵖ(A)→K₁ᵗᵒᵖ(B) is onto for surjective A→B.

**Checks.**

- In A=ℂ, g=1/10 has ‖g−1‖=9/10<1 but g⁻¹=10 has ‖g⁻¹−1‖=9: the ball is not inverse invariant, which is why the symmetric neighborhood U∩U⁻¹ is formed explicitly.
- For ‖g−1‖<1 the logarithm series converges and exp(t log g) is a path from 1 to g inside GL₁(A); for g=−1∈ℂ the series does not apply, and −1 is reached instead by the path e^(iπt), a product of exponentials.
- For the surjection C([0,1],ℂ)→C({0,1},ℂ)=ℂ², the unit (1,−1) lifts to the exponential of a continuous function (log along the interval), as the lifting statement requires; the kernel of K₁ᵗᵒᵖ(C([0,1]))→K₁ᵗᵒᵖ(ℂ²) is everything, both groups being 0.

*Needs:* 8.1; BanachAlgebras A2; Mathlib `NormedRing`, `exp`.

### Examples

K₁ᵃˡᵍ(ℂ)=ℂˣ against K₁ᵗᵒᵖ(ℂ)=0; the winding number on C(S¹,ℂ); the non-inverse-invariant ball; exponential lifts along a surjection of function algebras.

### Dependencies

Layers 1–2; BanachAlgebras A2; Mathlib `NormedRing`, path components, `ContinuousMap`.

## Downstream consumers

OperatorKTheory consumes Layers 0, 6 and 8 for its comparisons of C*-algebraic K-theory with the groups here, as described in Scope. GeneralAlgebraicKTheory consumes the conventions and Layers 0–3 and 6 (its §3.14, §§4.15–4.17 and §8.7). GeometryOfNumbersAndQuadraticArithmetic consumes Layers 0, 5 and 6 (its §6.1.7 and §6.10). StableHomotopyKTheory consumes Layers 0–1 and the three defining conditions of 5.1. NoncommutativeGeometry N2 consumes Layers 0–3 and the unitization interfaces of 3.4. KTheoryLowDegrees and K2SymbolsBrauer consume the matrix, relative and Steinberg groups of Layers 1–5. TopologicalKTheory may consume the stable ranges of 4.5 for bundle stabilization.

## References

- John Milnor, [Introduction to Algebraic K-Theory](https://www.jstor.org/stable/j.ctt1b9x0xv), Annals of Mathematics Studies 72, Princeton 1971, §§1–6 and 9–12: projective patching, stable matrices, K₁, Steinberg groups and K₂, and §10 for K₂(ℤ)≅ℤ/2; §7, the case of a commutative Banach algebra, is the classical source for Layer 8. Cited by locator; the text is not open.
- Charles Weibel, [The K-book](https://sites.math.rutgers.edu/~weibel/Kbook.html) (the chapter files on the author's page), Chapters I–III: finite projectives, Milnor squares, K₀, the relative triple group and its sequence for cofinal functors (Chapter II, Definition 2.10, (2.10.2) and Exercise 2.17), K₁ (Chapter III, 1.2.4, Remark 1.2.5, Lemmas 1.3.2–1.3.3, Exercises 1.2–1.3, Relative Whitehead Lemma 2.1, Definition 2.2) and K₂ (Chapter III, Definition 5.3.1, Theorem 5.5); Chapter I, Example 1.2.2 (the stably free tangent-section module over the coordinate ring of S²), Exercises 1.5 and 1.12 (stable range) and (4.9.1) (the Möbius bundle, and triviality of complex bundles on the circle).
- The Stacks Project [15.6.9](https://stacks.math.columbia.edu/tag/0D2J) supplies a detailed commutative-ring projective patching proof; [93.4](https://stacks.math.columbia.edu/tag/0DVN) spells out the category equivalence and inverse. Layer 6 states and develops the noncommutative version independently.
- Alexandr Grebennikov, [Non-surjective Milnor patching diagrams](https://arxiv.org/abs/2306.13180), Section 2.3, clarifies projective patching data and its hypotheses; it does not justify dropping Layer 6's hypothesis for arbitrary squares.
- Hyman Bass, Algebraic K-Theory, Benjamin, 1968, Theorem V.3.5 (cited by locator, as recalled in Weibel, Chapter I, Exercise 1.5(b)).
- Leonid N. Vaserstein, Stable rank of rings and dimensionality of topological spaces, Funktsional. Anal. i Prilozhen. 5:2 (1971), 17–27 (English translation: Functional Analysis and Its Applications 5:2 (1971), 102–110): the definitions of d(X) and d′(X) (pp. 19–20), Theorem 5 (the real stable rank d(X)+1) and Theorem 7 (the complex stable rank [d(X)/2]+1), both on p. 20.
- Native Mathlib entry points are `Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs`, `Mathlib.Data.Matrix.Block`, `Mathlib.LinearAlgebra.Matrix.Transvection`, `Mathlib.Algebra.Colimit`, `Mathlib.GroupTheory.Abelianization`, `Mathlib.GroupTheory.FreeGroup`, `Mathlib.GroupTheory.PresentedGroup`, `Mathlib.Algebra.Module.Projective`, `Mathlib.Algebra.Category.ModuleCat.Basic`, `Mathlib.RingTheory.Ideal.Quotient` and `Mathlib.RingTheory.LocalRing.Pullback`. Tau Ceti's `TauCeti.CategoryTheory.GrothendieckGroup.Split` supplies the single categorical K₀ engine and `TauCeti.LinearAlgebra.TensorProduct.Balanced` the tensor carrier.
