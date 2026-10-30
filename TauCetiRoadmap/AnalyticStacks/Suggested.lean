module

import Mathlib

/-!
# Analytic stacks and their six-functor formalisms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, where their carriers exist.

Stated below: the restricted-diagonal theorem of Liu and Zheng (README 0.3(1); LZ12b
Theorem 4.27, SixFF Theorem 4.8), on Mathlib's simplicial sets, quasicategories, internal Homs
and homotopy categories. The few definitions it needs (the bisimplices, the subobjects `Cpt_n`,
the restricted diagonal and the restriction map) have real bodies on these carriers. Also
stated: the gluing theorem of Liu and Zheng for the cartesian nerve of an ordinary category
(README 0.3(2), its case k = 2, E₀ = all morphisms; LZ12b Corollary 0.2), on Mathlib's nerve,
pullback squares and morphism properties, with the cartesian nerve defined here; and Stone
duality for spectral spaces (README 2.10; GvG24 Theorems 5.38 and 6.4), on Mathlib's
`SpectralSpace`, `SpectralMap`, `TopologicalSpace.CompactOpens` and `BddDistLat`, with the
category of spectral spaces, the distributive lattice of compact opens and the preimage
functor defined here.

The other headline theorems are not statable at these pins, for the following missing carriers.

* README 0.3(2) beyond ordinary categories, the gluing theorem for restricted multisimplicial
  nerves of an ∞-category (LZ12b Theorem 5.4): it needs pullback squares in a quasicategory, to
  define the nerves `C^cart_{E_1, ..., E_k}`; Mathlib's quasicategories carry no limits. For
  ordinary categories the general form (LZ12b Theorem 0.1, k ≥ 2 and arbitrary E₀) would need
  multisimplicial nerves and the nerve of the wide subcategory on E₀; only its case k = 2,
  E₀ = all morphisms is stated below.
* README 0.5, the construction principle (HM Proposition 3.3.3, Man22 Proposition A.5.10), and
  README 0.6, the extension of a sheafy formalism to sheaves (HM Theorem 3.4.11): they need the
  ∞-category `Cat∞`, its commutative algebras, ∞-operads, the symmetric monoidal ∞-category of
  correspondences `Corr(C, E)` and ∞-topoi of sheaves of anima.
* README 0.12 and 0.13, the Künneth criteria for !-descent and the ∞-topos of D-stacks
  (RCSolid Proposition 6.3.7, Corollary 6.3.15): they need presentable ∞-categories with
  Lurie's tensor product and left exact localizations of ∞-topoi.
* README 3.3, the quasi-coherent six-functor formalism on the ∞-topos `AnStk(C₀)` of analytic
  stacks (RCSolid Corollaries 6.3.4 and 6.3.19): it needs light condensed animated rings,
  analytic rings as full subcategories of stable module ∞-categories, the !-able class and
  the localization at !-equivalences.
* README 3.8, the realization of algebraic stacks as analytic stacks (ALRS Remark 2.9.1): it
  needs the ∞-topos of algebraic stacks in the !-topology and its quasi-coherent ∞-categories.
* README 4.2, the duality for classifying stacks of locally profinite groups (HM Proposition
  5.1.12 and Examples 5.3.21–5.3.22): it needs the ∞-topos of light condensed anima, its
  six-functor formalism `D(-, Λ)`, suave objects and the derived ∞-category of smooth
  representations.
* README 6.6, solid Serre duality `f^! 1 ≅ det(L_f)[n]` (RCSolid Theorem 7.7.21): it needs
  solid Huber rings, the cotangent complex of analytic rings, the exceptional inverse image
  on their module ∞-categories and determinants of perfect modules over them.
* README 7.6, stacky Cartier duality for vector bundles and their gerbes (RC26a Theorem 3.2.37,
  Proposition 3.3.3): it needs kernel categories of Künneth formalisms, bialgebras in linear
  presentable ∞-categories, ring stacks and transmutation.

Mathlib's 1-categorical shadows of these objects, such as the span bicategory
`CategoryTheory.Span.SpanBicat` and the morphism properties stable under base change, do not
carry the coherences these statements are about, and no weaker substitute is stated here.
-/

namespace TauCetiRoadmap.AnalyticStacks

open CategoryTheory

universe u v

/-! ## Layer 0: Abstract six-functor formalisms -/

/-- The cosimplicial bisimplicial set `[n] ↦ Δ^{n,n}`. The `(p, q)`-bisimplices of `Δ^{n,n}`
are the pairs of monotone maps `([p] → [n], [q] → [n])`, so that `Δ^{n,n}` represents the
`(n, n)`-bisimplices; a monotone map `[m] → [n]` acts by postcomposition in both coordinates
(LZ12b Notation 4.1). -/
def bisimplex : SimplexCategory ⥤ (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) where
  obj n :=
    { obj := fun pq => ULift.{u} ((pq.1.unop ⟶ n) × (pq.2.unop ⟶ n))
      map := fun f => TypeCat.ofHom fun x => ⟨(f.1.unop ≫ x.down.1, f.2.unop ≫ x.down.2)⟩ }
  map θ := { app := fun _ => TypeCat.ofHom fun x => ⟨(x.down.1 ≫ θ, x.down.2 ≫ θ)⟩ }

/-- The cosimplicial bisimplicial set `[n] ↦ Cpt_n`, where `Cpt_n ⊆ Δ^{n,n}` is the
sub-bisimplicial set spanned by the vertices `(i, j)` with `0 ≤ i ≤ j ≤ n`: a pair `(α, β)` lies
in it when `α a ≤ β b` for all vertices `a` of `[p]` and `b` of `[q]`. For `n = 1` it omits
exactly the vertex `(1, 0)` (LZ12b Notation 4.1). -/
def compactificationBisimplex :
    SimplexCategory ⥤ (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) where
  obj n :=
    { obj := fun pq => {x : ULift.{u} ((pq.1.unop ⟶ n) × (pq.2.unop ⟶ n)) //
        ∀ a b, x.down.1.toOrderHom a ≤ x.down.2.toOrderHom b}
      map := fun f => TypeCat.ofHom fun x =>
        ⟨⟨(f.1.unop ≫ x.1.down.1, f.2.unop ≫ x.1.down.2)⟩, fun _ _ => x.2 _ _⟩ }
  map θ := { app := fun _ => TypeCat.ofHom fun x =>
    ⟨⟨(x.1.down.1 ≫ θ, x.1.down.2 ≫ θ)⟩, fun a b => θ.toOrderHom.monotone (x.2 a b)⟩ }

/-- The restricted diagonal `δ*₂∇ X` of a bisimplicial set `X`: its `n`-simplices are the maps
of bisimplicial sets `Cpt_n → X` (LZ12b Definition 4.26). -/
def restrictedDiagonal (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) : SSet.{u} :=
  compactificationBisimplex.{u}.op ⋙ yoneda.obj X

/-- Restriction along the inclusions `Cpt_n ⊆ Δ^{n,n}`, from the simplicial set
`n ↦ Hom(Δ^{n,n}, X)`, which is the diagonal `δ*₂ X` by the Yoneda lemma, to the restricted
diagonal `δ*₂∇ X`. It forgets the bisimplices that leave `Cpt_n` (LZ12b, before Theorem 4.27). -/
def restrictedDiagonalMap (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) :
    bisimplex.{u}.op ⋙ yoneda.obj X ⟶ restrictedDiagonal X :=
  Functor.whiskerRight
    (NatTrans.op (F := compactificationBisimplex.{u}) (G := bisimplex.{u})
      { app := fun _ => { app := fun _ => TypeCat.ofHom fun x => x.1 } })
    (yoneda.obj X)

/-- **The restricted-diagonal theorem of Liu and Zheng.** For every bisimplicial set `X`, the
restriction `δ*₂ X → δ*₂∇ X` is a categorical equivalence: for every quasicategory `Q`,
precomposition with it induces an equivalence between the homotopy categories of the
functor simplicial sets `Fun(δ*₂∇ X, Q)` and `Fun(δ*₂ X, Q)`. Quantified over all quasicategories,
including the functor quasicategories `Fun(K, Q)`, this is equivalent to restriction being an
equivalence of quasicategories `Fun(δ*₂∇ X, Q) → Fun(δ*₂ X, Q)` (LZ12b Theorem 4.27;
SixFF Theorem 4.8). -/
theorem restrictedDiagonalMap_isEquivalence_hoFunctor
    (X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) (Q : SSet.{u}) [Q.Quasicategory] :
    (SSet.hoFunctor.map
      ((MonoidalClosed.pre (restrictedDiagonalMap X)).app Q)).toFunctor.IsEquivalence := by
  sorry

/-- The cartesian nerve `δ*₂N(C)^cart_{E₁,E₂}` of a category `C` with morphism properties `E₁`,
`E₂`: its `n`-simplices are the functors `F : [n] × [n] ⥤ C` sending every edge `(i, j) → (i', j)`
into `E₁`, every edge `(i, j) → (i, j')` into `E₂`, and every rectangle with corners `(i, j)`,
`(i, j')`, `(i', j)`, `(i', j')` to a pullback square; a monotone `θ : [m] → [n]` acts by
precomposition with `θ × θ` (LZ12b, Introduction, the simplicial set before (0.1)). -/
def cartesianNerve (C : Type u) [Category.{v} C] (E₁ E₂ : MorphismProperty C) :
    SSet.{max u v} where
  obj n := {F : Fin (n.unop.len + 1) × Fin (n.unop.len + 1) ⥤ C //
    (∀ (i i' j : Fin (n.unop.len + 1)) (hi : i ≤ i'),
      E₁ (F.map ((homOfLE hi, 𝟙 j) : ((i, j) : Fin _ × Fin _) ⟶ (i', j)))) ∧
    (∀ (i j j' : Fin (n.unop.len + 1)) (hj : j ≤ j'),
      E₂ (F.map ((𝟙 i, homOfLE hj) : ((i, j) : Fin _ × Fin _) ⟶ (i, j')))) ∧
    (∀ (i i' j j' : Fin (n.unop.len + 1)) (hi : i ≤ i') (hj : j ≤ j'),
      IsPullback (F.map ((𝟙 i, homOfLE hj) : ((i, j) : Fin _ × Fin _) ⟶ (i, j')))
        (F.map ((homOfLE hi, 𝟙 j) : ((i, j) : Fin _ × Fin _) ⟶ (i', j)))
        (F.map ((homOfLE hi, 𝟙 j') : ((i, j') : Fin _ × Fin _) ⟶ (i', j')))
        (F.map ((𝟙 i', homOfLE hj) : ((i', j) : Fin _ × Fin _) ⟶ (i', j'))))}
  map θ := TypeCat.ofHom fun F =>
    ⟨(θ.unop.toOrderHom.monotone.functor.prod θ.unop.toOrderHom.monotone.functor) ⋙ F.1,
      fun _ _ j hi => F.2.1 _ _ (θ.unop.toOrderHom j) (θ.unop.toOrderHom.monotone hi),
      fun i _ _ hj => F.2.2.1 (θ.unop.toOrderHom i) _ _ (θ.unop.toOrderHom.monotone hj),
      fun _ _ _ _ hi hj => F.2.2.2 _ _ _ _ (θ.unop.toOrderHom.monotone hi)
        (θ.unop.toOrderHom.monotone hj)⟩
  map_id _ := rfl
  map_comp _ _ := rfl

/-- The map from the cartesian nerve to the nerve of `C`, restricting a grid `[n] × [n] ⥤ C`
along the diagonal `i ↦ (i, i)` (LZ12b, map (0.2)). -/
def cartesianNerveToNerve (C : Type u) [Category.{v} C] (E₁ E₂ : MorphismProperty C) :
    cartesianNerve C E₁ E₂ ⟶ nerve C where
  app _ := TypeCat.ofHom fun F => (𝟭 _).prod' (𝟭 _) ⋙ F.1
  naturality _ _ _ := rfl

/-- **The gluing theorem of Liu and Zheng for ordinary categories.** Let `C` have pullbacks and
let `E₁`, `E₂` be admissible: they contain the identities, are stable under base change, and
`q ≫ p ∈ Eᵢ ↔ q ∈ Eᵢ` whenever `p ∈ Eᵢ`. If every morphism of `C` factors as `q ≫ p` with
`q ∈ E₂` and `p ∈ E₁`, then the diagonal restriction `δ*₂N(C)^cart_{E₁,E₂} → N(C)` is a
categorical equivalence: for every quasicategory `Q`, precomposition with it induces an
equivalence of the homotopy categories of `Fun(N(C), Q)` and `Fun(δ*₂N(C)^cart_{E₁,E₂}, Q)`
(LZ12b Corollary 0.2; the case k = 2 of LZ12b Theorem 0.1). -/
theorem cartesianNerveToNerve_isEquivalence_hoFunctor (C : Type u) [Category.{v} C]
    [Limits.HasPullbacks C] (E₁ E₂ : MorphismProperty C)
    [E₁.ContainsIdentities] [E₂.ContainsIdentities]
    [E₁.IsStableUnderBaseChange] [E₂.IsStableUnderBaseChange]
    (h₁ : ∀ ⦃X Y Z : C⦄ (q : X ⟶ Y) (p : Y ⟶ Z), E₁ p → (E₁ (q ≫ p) ↔ E₁ q))
    (h₂ : ∀ ⦃X Y Z : C⦄ (q : X ⟶ Y) (p : Y ⟶ Z), E₂ p → (E₂ (q ≫ p) ↔ E₂ q))
    (hfac : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), ∃ (Z : C) (q : X ⟶ Z) (p : Z ⟶ Y), E₂ q ∧ E₁ p ∧ q ≫ p = f)
    (Q : SSet.{max u v}) [Q.Quasicategory] :
    (SSet.hoFunctor.map
      ((MonoidalClosed.pre (cartesianNerveToNerve C E₁ E₂)).app Q)).toFunctor.IsEquivalence := by
  sorry

/-! ## Layer 2: Light analytic rings -/

/-- The category of spectral spaces: a type with a topology that is a `SpectralSpace` (T0,
compact, quasi-sober, quasi-separated, with a basis of compact opens), the morphisms being
Mathlib's `SpectralMap`s (continuous maps under which preimages of compact opens are compact). -/
structure SpectralSpaceCat : Type (u + 1) where
  /-- The underlying type. -/
  carrier : Type u
  [str : TopologicalSpace carrier]
  [isSpectral : SpectralSpace carrier]

attribute [instance] SpectralSpaceCat.str SpectralSpaceCat.isSpectral

/-- A bundled spectral space is viewed as its underlying type. -/
instance : CoeSort SpectralSpaceCat.{u} (Type u) := ⟨SpectralSpaceCat.carrier⟩

/-- Spectral spaces form a category, with the spectral maps as morphisms and their usual
identity and composition. -/
instance : Category SpectralSpaceCat.{u} where
  Hom X Y := SpectralMap X Y
  id X := SpectralMap.id X
  comp f g := g.comp f
  id_comp f := SpectralMap.comp_id f
  comp_id f := SpectralMap.id_comp f
  assoc f g h := (SpectralMap.comp_assoc h g f).symm

/-- The quasi-compact open subsets of a quasi-separated space form a distributive lattice under
union and intersection, a sublattice of the lattice of all subsets. -/
instance compactOpensDistribLattice (X : Type u) [TopologicalSpace X] [QuasiSeparatedSpace X] :
    DistribLattice (TopologicalSpace.CompactOpens X) :=
  SetLike.coe_injective.distribLattice _ .rfl .rfl (fun _ _ => rfl) (fun _ _ => rfl)

/-- Preimage along a spectral map `f : X → Y`, as a bounded lattice homomorphism from the compact
opens of `Y` to those of `X`: it preserves unions, intersections, `∅` and the whole space. -/
def compactOpensComap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [QuasiSeparatedSpace X] [CompactSpace X] [QuasiSeparatedSpace Y] [CompactSpace Y]
    (f : SpectralMap X Y) :
    BoundedLatticeHom (TopologicalSpace.CompactOpens Y) (TopologicalSpace.CompactOpens X) where
  toFun U := ⟨⟨f ⁻¹' U, U.isCompact.preimage_of_isOpen f.spectral' U.isOpen⟩,
    U.isOpen.preimage f.spectral'.continuous⟩
  map_sup' _ _ := rfl
  map_inf' _ _ := rfl
  map_top' := rfl
  map_bot' := rfl

/-- The contravariant functor from spectral spaces to bounded distributive lattices sending a
spectral space to its lattice of quasi-compact open subsets and a spectral map to preimage. -/
def compactOpensFunctor : SpectralSpaceCat.{u} ⥤ BddDistLat.{u}ᵒᵖ where
  obj X := Opposite.op (BddDistLat.of (TopologicalSpace.CompactOpens X))
  map {X Y} f := Quiver.Hom.op (BddDistLat.ofHom (compactOpensComap (X := X) (Y := Y) f))
  map_id _ := rfl
  map_comp _ _ := rfl

/-- **Stone duality for spectral spaces.** The functor sending a spectral space to its lattice
of quasi-compact open subsets and a spectral map to preimage is an equivalence between the
category of spectral spaces and spectral maps and the opposite of the category of bounded
distributive lattices (GvG24 Theorems 5.38 and 6.4; RCSolid Theorem 5.1.13). -/
theorem spectralStoneDuality : compactOpensFunctor.{u}.IsEquivalence := by
  sorry

end TauCetiRoadmap.AnalyticStacks
