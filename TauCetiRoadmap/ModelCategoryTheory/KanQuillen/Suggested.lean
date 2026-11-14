module

public import Mathlib
public import TauCeti.AlgebraicTopology.SimplicialSet.Factorization
public import TauCeti.AlgebraicTopology.SimplicialSet.Fiber
public import TauCeti.AlgebraicTopology.SimplicialSet.KanComplex.HomotopyGroup
public import TauCeti.AlgebraicTopology.SimplicialSet.KanComplex.SimplicialGroup.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence

/-!
# The Kan–Quillen model structure: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions their statements need.

Simplicial sets are Mathlib's `SSet`. Cofibrations are the monomorphisms and fibrations the Kan
fibrations, Mathlib's scoped classes in `SSet.modelCategoryQuillen`. Weak homotopy equivalences
are Tau Ceti's `SSet.IsWeakHomotopyEquivalence` (bijection on `π₀ Fun(−, Z)` for every Kan complex
`Z`). The model structure `modelCategory` is a definition, not an instance, over the structure
`categoryWithWeakEquivalences`; nothing here uses or changes the realization-based scoped class
`weakEquivalences SSet`.

Mathlib has `SSet.sd ⊣ SSet.ex` but not the last-vertex map `sd X ⟶ X`; it is defined below from
the largest element of a nonempty subset, extended along the left Kan extension `sd`, and gives
the comparison map `X ⟶ Ex X` and `Ex^∞` (README Layer 2).

Not stated in this file:
* combinatoriality of `modelCategory` (README §3.3.1): the notion of a combinatorial model
  category is ModelCategoryTheory Part ModelCategories', and Mathlib has none; its generating sets
  follow from `anodyneExtensions_eq`, with Tau Ceti's `SSet.modelCategoryQuillen.llp_rlp_I`;
* the connecting map and the action of `π₁` on the components of the fiber (README §1.2.1), and
  change of basepoint along an edge (README §1.1.3): stated in the README only, since their content
  is the construction of the maps, which a `sorry`'d existential would not pin; only the exactness
  at the total space is stated below;
* the weak contractibility of categories of factorizations in a Reedy category with a good
  filtration (README §3.6.2): Mathlib's `HomotopicalAlgebra.ReedyStructure` has no good filtrations;
* stability of `n`-connective maps under homotopy pushout (README §4.3.1): homotopy pushout squares
  of simplicial sets have no carrier in Mathlib or Tau Ceti.
-/

public section

open CategoryTheory Limits MorphismProperty HomotopicalAlgebra Simplicial Opposite
open SSet SSet.modelCategoryQuillen

universe u

namespace TauCetiRoadmap.ModelCategoryTheory.KanQuillen

/-! ## Layer 1: Kan complexes and their homotopy groups -/

/-- The homotopy groups `π n X x` of a Kan complex are abelian for `n ≥ 2` (README §1.1.2; Kerodon,
Lemma 3.2.3.9 and §3.2.3). -/
theorem π_mul_comm {X : SSet.{u}} [KanComplex X] (x : X _⦋0⦌) (n : ℕ)
    (a b : KanComplex.π (n + 2) X x) : a * b = b * a := by
  sorry

/-- Exactness of `π n F → π n E → π n B` at the total space, for a Kan fibration `p : E ⟶ B` onto a
Kan complex and its fiber `F` over a vertex `b`: a class of `E` based in `F` maps to the base point
of `B` exactly when it comes from `F`. For `n = 0` these are pointed sets (README §1.2.1; Kerodon,
Prop. 3.2.6.2 and Corollary 3.2.6.3). -/
theorem range_π_map_fiber_ι {E B : SSet.{u}} (p : E ⟶ B) [Fibration p] [KanComplex B]
    (b : B _⦋0⦌) (e : (SSet.fiber p b : SSet.{u}) _⦋0⦌) (n : ℕ) :
    Set.range (KanComplex.π.map (SSet.fiber p b).ι rfl :
        KanComplex.π n (SSet.fiber p b) e → KanComplex.π n E ((SSet.fiber p b).ι.app _ e)) =
      {a | KanComplex.π.map p rfl a = 1} := by
  sorry

/-- Whitehead's theorem in the form of the Kan-group criterion: a map of Kan complexes is a weak
homotopy equivalence exactly when it is bijective on `π₀` and on every `π (n + 1)` at every vertex
(README §1.3.3; Kerodon, Theorem 3.2.7.1). -/
theorem isWeakHomotopyEquivalence_iff_bijective_π {X Y : SSet.{u}} [KanComplex X]
    [KanComplex Y] (f : X ⟶ Y) :
    IsWeakHomotopyEquivalence f ↔ Function.Bijective (mapπ₀ f) ∧
      ∀ (n : ℕ) (x : X _⦋0⦌), Function.Bijective
        (KanComplex.π.map f rfl :
          KanComplex.π (n + 1) X x → KanComplex.π (n + 1) Y (f.app _ x)) := by
  sorry

/-! ## Layer 2: Subdivision and Kan's Ex^∞ -/

/-- The largest element of a nonempty subset of `{0, …, n}`, monotone for inclusion (README §2.1.1).
-/
noncomputable def lastVertexOrderHom (n : SimplexCategory) :
    PartialOrder.NonemptyFiniteChains (ULift.{u} (Fin (n.len + 1))) →o
      ULift.{u} (Fin (n.len + 1)) where
  toFun s := s.finset.max' s.nonempty
  monotone' _ _ h := Finset.max'_subset _ h

/-- The last-vertex map on the posets of nonempty subsets, natural in `⦋n⦌`: a monotone map
`f` sends the largest element of `s` to the largest element of `f(s)` (README §2.1.1). -/
noncomputable def lastVertexPartOrd :
    SimplexCategory.toPartOrd.{u} ⋙ PartOrd.nonemptyFiniteChainsFunctor ⟶
      SimplexCategory.toPartOrd.{u} where
  app n := PartOrd.ofHom (lastVertexOrderHom n)
  naturality n m f := by
    ext s
    let g : ULift.{u} (Fin (n.len + 1)) →o ULift.{u} (Fin (m.len + 1)) :=
      (SimplexCategory.toPartOrd.map f).hom
    let t : PartialOrder.NonemptyFiniteChains (ULift.{u} (Fin (n.len + 1))) := s
    change (t.map g).finset.max' (PartialOrder.NonemptyFiniteChains.nonempty _) =
      g (t.finset.max' t.nonempty)
    apply le_antisymm
    · refine Finset.max'_le _ _ _ fun y hy ↦ ?_
      obtain ⟨x, hx, rfl⟩ := (PartialOrder.NonemptyFiniteChains.mem_map_iff _ _ _).mp hy
      exact g.monotone (Finset.le_max' _ _ hx)
    · exact Finset.le_max' _ _ ((PartialOrder.NonemptyFiniteChains.mem_map_iff _ _ _).mpr
        ⟨_, Finset.max'_mem _ _, rfl⟩)

/-- Mathlib's isomorphisms `Δ[n] ≅ nerve [n]`, inverted, as a natural transformation (README
§2.1.1). -/
noncomputable def nerveToStdSimplex :
    SimplexCategory.toPartOrd.{u} ⋙ PartOrd.nerveFunctor ⟶ SSet.stdSimplex.{u} where
  app n := (SSet.stdSimplex.isoNerve.{u} n.len).inv
  naturality n m f := by
    ext d F
    apply SSet.stdSimplex.objEquiv.injective
    ext i
    rfl

/-- The last-vertex map `sd Δ[n] ⟶ Δ[n]`, natural in `⦋n⦌`: the nerve of the map sending a
nonempty subset of `[n]` to its largest element (README §2.1.1). -/
noncomputable def lastVertexStdSimplex : SimplexCategory.sd.{u} ⟶ SSet.stdSimplex.{u} :=
  Functor.whiskerRight lastVertexPartOrd.{u} PartOrd.nerveFunctor ≫ nerveToStdSimplex

/-- The last-vertex map `λ_X : sd X ⟶ X`, natural in `X`, extended from the simplices along the
left Kan extension `sd` (README §2.1.1; Kerodon, Construction 3.3.4.3). -/
noncomputable def lastVertex : sd.{u} ⟶ 𝟭 SSet.{u} :=
  sd.descOfIsLeftKanExtension SSet.stdSimplex.sdIso.inv (𝟭 _) lastVertexStdSimplex

/-- The comparison map `ρ_X : X ⟶ Ex X`, the transpose of the last-vertex map under
`sd ⊣ Ex` (README §2.1.1; Kerodon, Construction 3.3.4.3). -/
noncomputable def exComparison : 𝟭 SSet.{u} ⟶ ex.{u} :=
  sdExAdjunction.unit ≫ Functor.whiskerRight lastVertex ex

/-- The iterates `Ex^k` (README §2.2.1). -/
noncomputable def exPow (k : ℕ) : SSet.{u} ⥤ SSet.{u} :=
  Nat.rec (𝟭 _) (fun _ F ↦ F ⋙ ex) k

/-- The sequence `X ⟶ Ex X ⟶ Ex² X ⟶ ⋯`, the `k`-th map being `ρ` at `Ex^k X`
(README §2.2.1; Kerodon, Construction 3.3.6.1). -/
noncomputable def exPowSequence : ℕ ⥤ (SSet.{u} ⥤ SSet.{u}) :=
  Functor.ofSequence (X := exPow) fun k ↦
    (Functor.rightUnitor (exPow k)).inv ≫ Functor.whiskerLeft (exPow k) exComparison

/-- Kan's functor `Ex^∞`, the colimit of the sequence `X ⟶ Ex X ⟶ Ex² X ⟶ ⋯`
(README §2.2.1; Kerodon, Construction 3.3.6.1). -/
noncomputable def exInfty : SSet.{u} ⥤ SSet.{u} := colimit exPowSequence.{u}

/-- The natural map `ρ^∞_X : X ⟶ Ex^∞ X` (README §2.2.1). -/
noncomputable def toExInfty : 𝟭 SSet.{u} ⟶ exInfty.{u} := (colimit.ι exPowSequence.{u} 0 :)

/-- `Ex^∞ X` is a Kan complex for every simplicial set `X` (README §2.2.1; Kerodon, Prop. 3.3.6.9;
Moss, Prop. 3.2). -/
theorem kanComplex_exInfty_obj (X : SSet.{u}) : KanComplex (exInfty.obj X) := by
  sorry

/-- `ρ^∞_X : X ⟶ Ex^∞ X` is a strong anodyne map, in particular a monomorphism and a weak
homotopy equivalence; with `kanComplex_exInfty_obj`, `Ex^∞` is a functorial Kan replacement
(README §2.2.1; Kerodon, Props. 3.3.6.2 and 3.3.6.7; Moss, Corollary 3.11). -/
theorem strongAnodyneExtensions_toExInfty_app (X : SSet.{u}) :
    strongAnodyneExtensions (toExInfty.app X) := by
  sorry

/-! ## Layer 3: Weak homotopy equivalences and the Kan–Quillen model structure -/

/-- The weak homotopy equivalences, as a class of morphisms: Tau Ceti's
`SSet.IsWeakHomotopyEquivalence` (README §3.1.1; Kerodon, Definition 3.1.7.12). -/
def weakHomotopyEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsWeakHomotopyEquivalence f

/-- The maps with the right lifting property against all monomorphisms are exactly the Kan
fibrations that are weak homotopy equivalences (README §3.2.1; Kerodon, Prop. 3.3.7.6; HTT §A.2.7).
-/
theorem rlp_monomorphisms_eq :
    (monomorphisms SSet.{u}).rlp = fibrations SSet.{u} ⊓ weakHomotopyEquivalences.{u} := by
  sorry

/-- The anodyne maps are exactly the monomorphisms that are weak homotopy equivalences (README
§3.2.1; Kerodon, Corollary 3.3.7.7; HTT §A.2.7). -/
theorem anodyneExtensions_eq :
    anodyneExtensions.{u} = monomorphisms SSet.{u} ⊓ weakHomotopyEquivalences.{u} := by
  sorry

/-- The weak homotopy equivalences as a `CategoryWithWeakEquivalences` structure on `SSet`. It is a
definition, not an instance, so that it never meets the realization-based scoped instance (README
§3.2.1). -/
@[instance_reducible]
def categoryWithWeakEquivalences : CategoryWithWeakEquivalences SSet.{u} :=
  ⟨weakHomotopyEquivalences⟩

/-- The Kan–Quillen model structure on `SSet`: cofibrations the monomorphisms, fibrations the Kan
fibrations, weak equivalences the weak homotopy equivalences (HTT §A.2.7; Kerodon,
Prop. 3.3.7.6 and Corollary 3.3.7.7), assembled by `ModelCategory.mk'` from Tau Ceti's two
weak factorization systems, `rlp_monomorphisms_eq` and `anodyneExtensions_eq` (README §3.2.1). -/
@[instance_reducible]
noncomputable def modelCategory : ModelCategory SSet.{u} :=
  let _ : CategoryWithWeakEquivalences SSet.{u} := categoryWithWeakEquivalences.{u}
  have : (weakEquivalences SSet.{u}).HasTwoOutOfThreeProperty :=
    { comp_mem := fun f g hf hg ↦ by
        have : IsWeakHomotopyEquivalence f := hf
        have : IsWeakHomotopyEquivalence g := hg
        exact (inferInstance : IsWeakHomotopyEquivalence (f ≫ g))
      of_postcomp := fun f g hg hfg ↦ by
        have : IsWeakHomotopyEquivalence g := hg
        have : IsWeakHomotopyEquivalence (f ≫ g) := hfg
        exact IsWeakHomotopyEquivalence.of_postcomp f g
      of_precomp := fun f g hf hfg ↦ by
        have : IsWeakHomotopyEquivalence f := hf
        have : IsWeakHomotopyEquivalence (f ≫ g) := hfg
        exact IsWeakHomotopyEquivalence.of_precomp f g }
  have : IsWeakFactorizationSystem (cofibrations SSet.{u}) (trivialFibrations SSet.{u}) := by
    have h : trivialFibrations SSet.{u} = I.rlp := by
      rw [← SSet.rlp_monomorphisms, rlp_monomorphisms_eq]
      rfl
    rw [h, cofibrations_eq]
    infer_instance
  have : IsWeakFactorizationSystem (trivialCofibrations SSet.{u}) (fibrations SSet.{u}) := by
    have h : trivialCofibrations SSet.{u} = anodyneExtensions.{u} := by
      rw [anodyneExtensions_eq]
      rfl
    rw [h]
    infer_instance
  ModelCategory.mk' SSet.{u}

/-- Weak homotopy equivalences are stable under filtered colimits (README §3.3.1; Kerodon, Prop.
3.2.8.3). -/
theorem isStableUnderFilteredColimits_weakHomotopyEquivalences :
    weakHomotopyEquivalences.{u}.IsStableUnderFilteredColimits.{u, u} := by
  sorry

/-- Left properness: a pushout of a weak homotopy equivalence along a monomorphism is a weak
homotopy equivalence (README §3.4.1; HTT, Prop. A.2.4.2, all objects being cofibrant). -/
theorem isWeakHomotopyEquivalence_of_isPushout {A B C D : SSet.{u}} {f : A ⟶ C} {i : A ⟶ B}
    {j : C ⟶ D} {g : B ⟶ D} (h : IsPushout f i j g) [Mono i] [IsWeakHomotopyEquivalence f] :
    IsWeakHomotopyEquivalence g := by
  sorry

/-- Right properness: a pullback of a weak homotopy equivalence along a Kan fibration is a weak
homotopy equivalence (README §3.4.1; Kerodon, Corollary 3.3.7.4; Moss, Theorem 5.1). -/
theorem isWeakHomotopyEquivalence_of_isPullback {P T X S : SSet.{u}} {fst : P ⟶ T}
    {snd : P ⟶ X} {v : T ⟶ S} {p : X ⟶ S} (h : IsPullback fst snd v p) [Fibration p]
    [IsWeakHomotopyEquivalence v] : IsWeakHomotopyEquivalence snd := by
  sorry

/-- A map whose pullback along every simplex of its target is weakly contractible is a weak
homotopy equivalence (README §3.5.1; Kerodon, Corollary 3.4.2.17). -/
theorem isWeakHomotopyEquivalence_of_isWeaklyContractible_pullback {X S : SSet.{u}}
    (f : X ⟶ S) (h : ∀ (n : ℕ) (σ : Δ[n] ⟶ S), IsWeaklyContractible (pullback σ f)) :
    IsWeakHomotopyEquivalence f := by
  sorry

/-! ## Layer 4: Connectivity -/

/-- A Kan complex `X` is `n`-connective when it is nonempty and `π m X x` is trivial for every
vertex `x` and every `m < n` (README §4.1.1; Kerodon, Definition 3.5.1.1). -/
def IsConnective (n : ℕ) (X : SSet.{u}) [KanComplex X] : Prop :=
  Nonempty (X _⦋0⦌) ∧ ∀ (m : ℕ), m < n → ∀ x : X _⦋0⦌, Subsingleton (KanComplex.π m X x)

/-- A Kan fibration has `n`-connective fibers exactly when it has the right lifting property
against `∂Δ[m] ⊆ Δ[m]` for every `m ≤ n` (README §4.2.1; Kerodon, Prop. 3.5.2.1). -/
theorem isConnective_fiber_iff {X Y : SSet.{u}} (p : X ⟶ Y) [Fibration p] (n : ℕ) :
    (∀ y : Y _⦋0⦌, IsConnective n (SSet.fiber p y)) ↔
      ∀ m ≤ n, HasLiftingProperty (∂Δ[m]).ι p := by
  sorry

/-! ## Layer 5: Truncation, Postnikov sections and Eilenberg–MacLane complexes -/

/-- A Kan complex `X` is `n`-truncated when `π m X x` is trivial for every vertex `x` and every
`m > n` (README §5.1.1; Kerodon, Definition 3.5.7.1 with Prop. 3.5.7.9). -/
def IsTruncated (n : ℕ) (X : SSet.{u}) [KanComplex X] : Prop :=
  ∀ (m : ℕ), n < m → ∀ x : X _⦋0⦌, Subsingleton (KanComplex.π m X x)

/-- Moore's `n`-th Postnikov section: the image of `X` in its `n`-coskeleton, in which two
simplices are identified when their restrictions to the `n`-skeleton agree (README §5.1.1). -/
noncomputable def postnikovSection (n : ℕ) (X : SSet.{u}) : SSet.{u} :=
  Subcomplex.range ((SSet.coskAdj n).unit.app X)

/-- The quotient map from `X` to its `n`-th Postnikov section (README §5.1.1). -/
noncomputable def toPostnikovSection (n : ℕ) (X : SSet.{u}) : X ⟶ postnikovSection n X :=
  Subcomplex.toRange ((SSet.coskAdj n).unit.app X)

/-- The Postnikov sections of a Kan complex are Kan complexes (README §5.1.1; May, *Simplicial
objects in algebraic topology*, §8). -/
theorem kanComplex_postnikovSection (n : ℕ) (X : SSet.{u}) [KanComplex X] :
    KanComplex (postnikovSection n X) := by
  sorry

/-- The `n`-th Postnikov section of a Kan complex is `n`-truncated (README §5.1.1; May, §8; Kerodon,
Definition 3.5.7.20). -/
theorem isTruncated_postnikovSection (n : ℕ) (X : SSet.{u}) [KanComplex X]
    [KanComplex (postnikovSection n X)] : IsTruncated n (postnikovSection n X) := by
  sorry

/-- The map to the `n`-th Postnikov section is bijective on `π m` for `m ≤ n` (README §5.1.1; May,
§8). -/
theorem bijective_π_toPostnikovSection (n : ℕ) (X : SSet.{u}) [KanComplex X] (m : ℕ)
    (hm : m ≤ n) (x : X _⦋0⦌) :
    Function.Bijective (KanComplex.π.map (toPostnikovSection n X) rfl :
      KanComplex.π m X x →
        KanComplex.π m (postnikovSection n X) ((toPostnikovSection n X).app _ x)) := by
  sorry

/-- Convergence of towers: for a tower of Kan fibrations between Kan complexes `Y n` whose transition
maps are bijective on `π k` for `k ≤ n`, the projection from the limit to `Y n` is bijective on `π k`
for `k ≤ n` (README §5.3.1; Goerss–Jardine, §VI.2; compare Kerodon,
Definition 3.5.8.1, for Postnikov towers). -/
theorem bijective_π_limit_π (Y : ℕᵒᵖ ⥤ SSet.{u}) [∀ n, KanComplex (Y.obj n)]
    (hY : ∀ n : ℕ, Fibration (Y.map (homOfLE (Nat.le_succ n)).op))
    
    (hb : ∀ (n k : ℕ), k ≤ n → ∀ y : (Y.obj (op (n + 1))) _⦋0⦌, Function.Bijective
      (KanComplex.π.map (Y.map (homOfLE (Nat.le_succ n)).op) rfl :
        KanComplex.π k (Y.obj (op (n + 1))) y → KanComplex.π k (Y.obj (op n)) _))
    (x : (limit Y) _⦋0⦌) (n k : ℕ) (hk : k ≤ n) :
    Function.Bijective (KanComplex.π.map (limit.π Y (op n)) rfl :
      KanComplex.π k (limit Y) x → KanComplex.π k (Y.obj (op n)) _) := by
  sorry

/-- The Eilenberg–MacLane complex `K(A, n)` of an abelian group `A`, viewed as a `ℤ`-module: the
underlying simplicial set of the simplicial module `Γ(A[n])` that Mathlib's Dold–Kan functor assigns
to `A` placed in degree `n` (Kerodon, Construction 2.5.6.9). Over `ModuleCat ℤ`, Tau Ceti's
`ChainComplex.doldKanPiAddEquivHomology` computes its homotopy groups at the zero vertex (README
§5.4.1). -/
noncomputable def eilenbergMacLane (A : ModuleCat.{u} ℤ) (n : ℕ) : SSet.{u} :=
  Idempotents.DoldKan.Γ.obj
      ((HomologicalComplex.single (ModuleCat.{u} ℤ) (ComplexShape.down ℕ) n).obj A) ⋙
    forget (ModuleCat.{u} ℤ)

/-- `K(A, n)` is a Kan complex, being a simplicial group (README §5.4.1; Tau Ceti's Moore theorem).
-/
noncomputable instance (A : ModuleCat.{u} ℤ) (n : ℕ) : KanComplex (eilenbergMacLane A n) :=
  inferInstanceAs (KanComplex (_ ⋙ forget (ModuleCat.{u} ℤ)))

/-- The base vertex of `K(A, n)`, the zero of its group of vertices (README §5.4.1). -/
noncomputable def eilenbergMacLane.basepoint (A : ModuleCat.{u} ℤ) (n : ℕ) :
    (eilenbergMacLane A n) _⦋0⦌ :=
  (0 : (Idempotents.DoldKan.Γ.obj
      ((HomologicalComplex.single (ModuleCat.{u} ℤ) (ComplexShape.down ℕ) n).obj A)) _⦋0⦌)

/-- `π (n + 1)` of `K(A, n + 1)` at the base vertex is `A` (README §5.4.1; Kerodon, Exercise
3.2.2.22; Tau Ceti's `ChainComplex.doldKanPiAddEquivHomology` with the homology of the single
complex). -/
theorem nonempty_mulEquiv_π_eilenbergMacLane (A : ModuleCat.{u} ℤ) (n : ℕ) :
    Nonempty (KanComplex.π (n + 1) (eilenbergMacLane A (n + 1))
      (eilenbergMacLane.basepoint A (n + 1)) ≃* Multiplicative A) := by
  sorry

/-- The homotopy groups of `K(A, n)` vanish outside degree `n`, at every vertex (README §5.4.1;
Kerodon, Exercise 3.2.2.22, moved to other vertices by translation in the simplicial group). -/
theorem subsingleton_π_eilenbergMacLane (A : ModuleCat.{u} ℤ) (n m : ℕ) (h : m ≠ n)
    (x : (eilenbergMacLane A n) _⦋0⦌) :
    Subsingleton (KanComplex.π m (eilenbergMacLane A n) x) := by
  sorry

/-- Uniqueness of Eilenberg–MacLane homotopy types: two Kan complexes which are
`(n + 1)`-connective and `(n + 1)`-truncated, with isomorphic `π (n + 1)`, are related by a weak
homotopy equivalence (README §5.5.2; Kerodon, Corollary 3.5.7.19). -/
theorem exists_isWeakHomotopyEquivalence_of_mulEquiv {X Y : SSet.{u}} [KanComplex X]
    [KanComplex Y] (n : ℕ) (hX : IsConnective (n + 1) X) (hY : IsConnective (n + 1) Y)
    (hX' : IsTruncated (n + 1) X) (hY' : IsTruncated (n + 1) Y) (x : X _⦋0⦌) (y : Y _⦋0⦌)
    (e : KanComplex.π (n + 1) X x ≃* KanComplex.π (n + 1) Y y) :
    ∃ f : X ⟶ Y, IsWeakHomotopyEquivalence f := by
  sorry

/-- The pointed mapping complex `Map_*(K, Y)`: the fiber over the vertex `y` of restriction
`Fun(K, Y) ⟶ Fun(Δ[0], Y)` along the vertex `k` (README §5.6.1). -/
noncomputable def pointedMap {K Y : SSet.{u}} (k : K _⦋0⦌) (y : Y _⦋0⦌) : SSet.{u} :=
  SSet.fiber ((MonoidalClosed.pre (yonedaEquiv.symm k)).app Y)
    (yonedaEquiv (MonoidalClosed.curry
      (CartesianMonoidalCategory.fst Δ[0] Δ[0] ≫ yonedaEquiv.symm y)))

/-- Pointed maps between Eilenberg–MacLane complexes: for `n ≥ 1` and abelian groups `A`, `B`,
sending a pointed map `K(A, n) → K(B, n)` to the homomorphism it induces on `π n` is a bijection
from pointed homotopy classes onto homomorphisms: every homomorphism is induced, and two pointed
maps inducing the same homomorphism are pointed homotopic (May, §23). With
`nonempty_mulEquiv_π_eilenbergMacLane` this identifies the classes with `A →+ B` (README §5.6.1). -/
theorem exists_mapHom_eq_and_homotopyClass_eq (A B : ModuleCat.{u} ℤ) (n : ℕ) :
    (∀ h : KanComplex.π (n + 1) (eilenbergMacLane A (n + 1))
          (eilenbergMacLane.basepoint A (n + 1)) →*
        KanComplex.π (n + 1) (eilenbergMacLane B (n + 1))
          (eilenbergMacLane.basepoint B (n + 1)),
      ∃ (f : eilenbergMacLane A (n + 1) ⟶ eilenbergMacLane B (n + 1))
        (hf : f.app _ (eilenbergMacLane.basepoint A (n + 1)) =
          eilenbergMacLane.basepoint B (n + 1)),
        KanComplex.π.mapHom f hf = h) ∧
    ∀ (f g : eilenbergMacLane A (n + 1) ⟶ eilenbergMacLane B (n + 1))
      (hf : f.app _ (eilenbergMacLane.basepoint A (n + 1)) =
        eilenbergMacLane.basepoint B (n + 1))
      (hg : g.app _ (eilenbergMacLane.basepoint A (n + 1)) =
        eilenbergMacLane.basepoint B (n + 1)),
      KanComplex.π.mapHom (n := n + 1) f hf = KanComplex.π.mapHom g hg →
        (RelativeMorphism.ofSimplex₀ f _ _ hf).homotopyClass =
          (RelativeMorphism.ofSimplex₀ g _ _ hg).homotopyClass := by
  sorry

/-- The components of `Map_*(K(A, n), K(B, n))` are contractible for `n ≥ 1` (README §5.6.1; May,
§23). -/
theorem subsingleton_π_pointedMap (A B : ModuleCat.{u} ℤ) (n m : ℕ)
    (v : (pointedMap (eilenbergMacLane.basepoint A (n + 1))
      (eilenbergMacLane.basepoint B (n + 1))) _⦋0⦌) :
    Subsingleton (KanComplex.π (m + 1) (pointedMap (eilenbergMacLane.basepoint A (n + 1))
      (eilenbergMacLane.basepoint B (n + 1))) v) := by
  sorry

end TauCetiRoadmap.ModelCategoryTheory.KanQuillen
