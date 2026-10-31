import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map

/-!
# Grothendieck ∞-groupoids: globular theories, coherators and their models — target signatures

`README.md` is the definitive roadmap. Each declaration below is an acceptance test for the README
item named in its docstring: that item is done when the declaration exists with this name and
signature, its `sorry` is proved, and everything else the README asks of the item is built.

Conventions follow Ara, *On the homotopy theory of Grothendieck ∞-groupoids*, J. Pure Appl.
Algebra 217 (2013): in the globular sum of a table, the left disk of each gluing is attached by
its source face and the right disk by its target face (1.3); a globular extension is a category
with a coglobular object in which every globular sum exists (1.4), here with a chosen globular
sum for each table, which by Ara's Remark 1.7 is the same as a lifting of `Θ₀`, and with the sum
of the one-disk table `(n)` the disk itself; admissible pairs `(f, g) : D_n → S` with
`dim S ≤ n + 1` (2.3); ∞-groupoids of type `C` are presheaves sending globular sums to globular
products (1.8, 2.5); homotopy groups and weak equivalences as in 4.11 and 4.17.

The globe category `Globe` is the carrier that HomotopyTheoryOfCategories (Layer 8.6) proves
direct; this file states nothing about direct or Reedy categories. The only Tau Ceti declaration
consumed is `HomotopyGroup.map`. `weTop` repeats the body of `IsWeakHomotopyEquivalence`, which
StableHomotopyKTheory §2.1 owns; it is that predicate, not a variant of it. `TopCat` carries the
coglobular space `stdDisks` of disks and hemisphere inclusions (Ara 2013, Examples 1.5.2), and
`piPresheaf_isWeakEquivalence_iff` is Ara's Corollaries 8.9–8.11 for it. Definitions have real
bodies; only theorem statements are `sorry`.

Not stated here: Ara's Theorem 8.7, whose isomorphisms are of groups and the group structure on
`π_n` comes from the composition operations of Layer 3.2, and Proposition 5.5 with Corollary 8.8,
which compare the groupoids `ϖ_n` and the groups `π_n` of Layer 4.1; the README states them in
Layers 5.3 and 7.2. Not prototyped either: the cellular towers that make a pseudo-coherator a
coherator (Layer 2.4) and cellular ∞-groupoids (Layer 6).
-/

namespace TauCetiRoadmap.GrothendieckInfinityGroupoids

open CategoryTheory Limits Opposite

universe u v w

/-! ## Layer 0: globular sets -/

/-- **Layer 0.1.** The objects of the globe category `𝔾`: the natural numbers, wrapped so that the
category structure below is not confused with the order category of `ℕ`. -/
structure Globe where
  /-- The dimension `n` of the object `n` of `𝔾`. -/
  dim : ℕ

namespace Globe

/-- The morphisms `m ⟶ n` of `𝔾`: the identity of `n`, and for `m < n` the two sides
(`false` = source `σ`, `true` = target `τ`). A morphism `m ⟶ n` with `m < n` is determined by its
side. -/
inductive Hom : ℕ → ℕ → Type
  /-- The identity of `n`. -/
  | id (n : ℕ) : Hom n n
  /-- The side `ε` from `m` to `n`, for `m < n`. -/
  | side {m n : ℕ} (h : m < n) (ε : Bool) : Hom m n

/-- Composition in `𝔾`: the composite of the side `ε` then the side `δ` is `ε`. -/
def Hom.comp {l m n : ℕ} : Hom l m → Hom m n → Hom l n
  | .id _, g => g
  | .side h ε, .id _ => .side h ε
  | .side h ε, .side h' _ => .side (h.trans h') ε

/-- **Layer 0.1.** The globe category `𝔾`, the carrier HomotopyTheoryOfCategories (Layer 8.6)
proves direct. -/
instance : Category Globe where
  Hom m n := Hom m.dim n.dim
  id m := .id m.dim
  comp := Hom.comp
  id_comp _ := rfl
  comp_id {X Y} f := by cases X; cases Y; cases f <;> rfl
  assoc {W X Y Z} f g h := by
    cases W; cases X; cases Y; cases Z
    cases f <;> cases g <;> cases h <;> rfl

/-- The source `σ_n : n ⟶ n + 1`. -/
def σ (n : ℕ) : (⟨n⟩ : Globe) ⟶ ⟨n + 1⟩ := Hom.side (Nat.lt_succ_self n) false

/-- The target `τ_n : n ⟶ n + 1`. -/
def τ (n : ℕ) : (⟨n⟩ : Globe) ⟶ ⟨n + 1⟩ := Hom.side (Nat.lt_succ_self n) true

end Globe

/-- **Layer 0.1.** Globular sets as presheaves on `𝔾`; Layer 0.1 proves this category equivalent to
the explicit description `GlobularSet`. -/
abbrev GlobularPresheaf := Globeᵒᵖ ⥤ Type u

/-- A globular set, in explicit form: cells in each dimension, with source and target maps
satisfying the globular identities. -/
structure GlobularSet where
  /-- The `n`-cells. -/
  Cell : ℕ → Type u
  /-- The source of an `(n+1)`-cell. -/
  src : ∀ n, Cell (n + 1) → Cell n
  /-- The target of an `(n+1)`-cell. -/
  tgt : ∀ n, Cell (n + 1) → Cell n
  src_src : ∀ n c, src n (src (n + 1) c) = src n (tgt (n + 1) c)
  tgt_src : ∀ n c, tgt n (src (n + 1) c) = tgt n (tgt (n + 1) c)

namespace GlobularSet

/-- Two `n`-cells are joined if some `(n+1)`-cell goes from the first to the second. -/
def Joined (X : GlobularSet.{u}) (n : ℕ) (a b : X.Cell n) : Prop :=
  ∃ h : X.Cell (n + 1), X.src n h = a ∧ X.tgt n h = b

end GlobularSet

/-! ## Layer 1: coglobular objects and tables -/

/-- A coglobular object of a category `K`: disks `D n` with source and target inclusions
`σ n, τ n : D n ⟶ D (n+1)` satisfying the coglobular identities. -/
structure CoglobularObject (K : Type u) [Category.{v} K] where
  /-- The `n`-disk. -/
  disk : ℕ → K
  /-- The source inclusion. -/
  σ : ∀ n, disk n ⟶ disk (n + 1)
  /-- The target inclusion. -/
  τ : ∀ n, disk n ⟶ disk (n + 1)
  σ_σ : ∀ n, σ n ≫ σ (n + 1) = σ n ≫ τ (n + 1)
  τ_σ : ∀ n, τ n ≫ σ (n + 1) = τ n ≫ τ (n + 1)

namespace CoglobularObject

variable {K : Type u} [Category.{v} K] (D : CoglobularObject K)

/-- The face `D m ⟶ D (m + k + 1)` of side `ε` (`false` = source, `true` = target): the first
step is `σ` or `τ`, the later ones `σ` (any choice gives the same map, by the identities). -/
def face (m : ℕ) : (k : ℕ) → Bool → (D.disk m ⟶ D.disk (m + k + 1))
  | 0, ε => if ε then D.τ m else D.σ m
  | k + 1, ε => face m k ε ≫ D.σ (m + k + 1)

/-- The face `D m ⟶ D n` of side `ε`, for `m < n`. -/
def faceTo {m n : ℕ} (h : m < n) (ε : Bool) : D.disk m ⟶ D.disk n :=
  D.face m (n - m - 1) ε ≫ eqToHom (congrArg D.disk (by omega))

end CoglobularObject

/-- **Layer 1.1.** The point `(x, √(1 − ‖x‖²))` (side `ε = false`, the source) or
`(x, −√(1 − ‖x‖²))` (side `ε = true`, the target) of `ℝ^{n+1}`, for `x ∈ ℝ^n` (Ara 2013,
Examples 1.5.2). -/
noncomputable def hemiPoint (n : ℕ) (ε : Bool) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin (n + 1)) :=
  WithLp.toLp 2 (Fin.snoc (α := fun _ => ℝ) (fun i => x i)
    ((if ε then -1 else 1) * Real.sqrt (1 - ‖x‖ ^ 2)))

/-- **Layer 1.1.** A point of the closed unit ball goes to the unit sphere. -/
theorem norm_hemiPoint (n : ℕ) (ε : Bool) {x : EuclideanSpace ℝ (Fin n)} (hx : ‖x‖ ≤ 1) :
    ‖hemiPoint n ε x‖ = 1 := by
  sorry

/-- **Layer 1.1.** The map `x ↦ (x, ±√(1 − ‖x‖²))` is continuous. -/
theorem continuous_hemiPoint (n : ℕ) (ε : Bool) : Continuous (hemiPoint n ε) := by
  sorry

/-- **Layer 1.1.** The coglobular identities on points: `hemiPoint n δ x` lies on the unit sphere,
so both maps of dimension `n + 1` send it to the point with last coordinate `0`. -/
theorem hemiPoint_hemiPoint (n : ℕ) (δ ε ε' : Bool) {x : EuclideanSpace ℝ (Fin n)}
    (hx : ‖x‖ ≤ 1) :
    hemiPoint (n + 1) ε (hemiPoint n δ x) = hemiPoint (n + 1) ε' (hemiPoint n δ x) := by
  sorry

/-- **Layer 1.1.** The hemisphere inclusion `D^n → D^{n+1}` of side `ε` on Mathlib's disks
`TopCat.disk` (Ara 2013, Examples 1.5.2). -/
noncomputable def hemisphere (n : ℕ) (ε : Bool) : TopCat.disk.{0} n ⟶ TopCat.disk.{0} (n + 1) :=
  TopCat.ofHom
    ⟨ULift.map (fun p : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 =>
        (⟨hemiPoint n ε p.1, mem_closedBall_zero_iff.2
          (norm_hemiPoint n ε (mem_closedBall_zero_iff.1 p.2)).le⟩ :
          Metric.closedBall (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)),
      continuous_uliftMap _
        (Continuous.subtype_mk ((continuous_hemiPoint n ε).comp continuous_subtype_val) _)⟩

/-- **Layer 1.1.** The coglobular identities for the hemisphere inclusions. -/
theorem hemisphere_hemisphere (n : ℕ) (δ ε ε' : Bool) :
    hemisphere n δ ≫ hemisphere (n + 1) ε = hemisphere n δ ≫ hemisphere (n + 1) ε' := by
  sorry

/-- **Layer 1.1.** The coglobular space of disks `D^n` and hemisphere inclusions `σ, τ` (Ara 2013,
Examples 1.5.2), the coglobular object of `TopCat` used throughout. -/
noncomputable def stdDisks : CoglobularObject TopCat.{0} where
  disk n := TopCat.disk.{0} n
  σ n := hemisphere n false
  τ n := hemisphere n true
  σ_σ n := hemisphere_hemisphere n false false true
  τ_σ n := hemisphere_hemisphere n true false true

/-- A table of dimensions `(i₁, i'₁, i₂, …, i'_{m−1}, i_m)` with `i_k > i'_k < i_{k+1}` (Ara 2013,
1.3): `top` has one more entry than `bot`. -/
structure Table where
  /-- The number of gluings `m − 1`. -/
  width : ℕ
  /-- The top dimensions `i_k`. -/
  top : Fin (width + 1) → ℕ
  /-- The gluing dimensions `i'_k`. -/
  bot : Fin width → ℕ
  bot_lt_left : ∀ k, bot k < top k.castSucc
  bot_lt_right : ∀ k, bot k < top k.succ

namespace Table

/-- The table `(n)` of the disk `D_n`. -/
def globe (n : ℕ) : Table where
  width := 0
  top := fun _ => n
  bot := Fin.elim0
  bot_lt_left := fun k => k.elim0
  bot_lt_right := fun k => k.elim0

/-- The dimension of a table: its largest top dimension. -/
def dim (T : Table) : ℕ := Finset.univ.sup T.top

end Table

namespace CoglobularObject

variable {K : Type u} [Category.{v} K] (D : CoglobularObject K)

/-- A family of maps out of the disks of a table is compatible when it agrees on each gluing, in
Ara's orientation (2013, 1.3): the source face of the left disk equals the target face of the
right disk. -/
def Compatible (T : Table) {Y : K} (φ : ∀ k, D.disk (T.top k) ⟶ Y) : Prop :=
  ∀ j, D.faceTo (T.bot_lt_left j) false ≫ φ j.castSucc =
    D.faceTo (T.bot_lt_right j) true ≫ φ j.succ

end CoglobularObject

/-! ## Layer 2: globular extensions and (pseudo-)coherators -/

/-- **Layer 2.1.** A choice of globular sum for every table (Ara 2013, 1.3): an object, the
inclusions of the disks of the table, and the universal property of the iterated pushout; the sum
of the one-disk table `(n)` is `D n` itself. -/
structure GlobularSums {K : Type u} [Category.{v} K] (D : CoglobularObject K) where
  /-- The globular sum of a table. -/
  sum : Table → K
  /-- The inclusion of the `k`-th disk of a table. -/
  incl : ∀ (T : Table) (k : Fin (T.width + 1)), D.disk (T.top k) ⟶ sum T
  incl_compatible : ∀ T, D.Compatible T (incl T)
  isGlobularSum : ∀ (T : Table) (Y : K) (φ : ∀ k, D.disk (T.top k) ⟶ Y),
    D.Compatible T φ → ∃! u : sum T ⟶ Y, ∀ k, incl T k ≫ u = φ k
  sum_globe : ∀ n, sum (Table.globe n) = D.disk n
  incl_globe : ∀ n, incl (Table.globe n) ⟨0, Nat.zero_lt_succ 0⟩ = eqToHom (sum_globe n).symm

/-- **Layer 1.2.** In a category with pushouts every coglobular object has globular sums (Ara
2013, Examples 1.5.1); in particular `stdDisks` in `TopCat`. -/
theorem GlobularSums.nonempty_of_hasPushouts {K : Type u} [Category.{v} K] [HasPushouts K]
    (D : CoglobularObject K) : Nonempty (GlobularSums D) := by
  sorry

/-- **Layer 2.1.** A globular extension (Ara 2013, 1.4): a category with a coglobular object and
a chosen globular sum for every table. No condition is put on the objects: `TopCat` with its
disks is one, and so is every free globular extension. -/
structure GlobularExtension where
  /-- The objects. -/
  Obj : Type u
  [cat : Category.{v} Obj]
  /-- The disks. -/
  disks : CoglobularObject Obj
  /-- The chosen globular sums. -/
  sums : GlobularSums disks

attribute [instance] GlobularExtension.cat

namespace GlobularExtension

variable (C : GlobularExtension)

/-- The globular sum of a table. -/
abbrev ofTable (T : Table) : C.Obj := C.sums.sum T

/-- The inclusion of the `k`-th disk of a table into its globular sum. -/
abbrev incl (T : Table) (k : Fin (T.width + 1)) : C.disks.disk (T.top k) ⟶ C.ofTable T :=
  C.sums.incl T k

/-- The globular sum of the one-disk table `(n)` is the disk `D_n`. -/
theorem ofTable_globe (n : ℕ) : C.ofTable (Table.globe n) = C.disks.disk n :=
  C.sums.sum_globe n

/-- Two maps `D_n ⟶ S` are parallel: equal sources and targets (no condition for `n = 0`). -/
def Parallel : (n : ℕ) → {S : C.Obj} → (C.disks.disk n ⟶ S) → (C.disks.disk n ⟶ S) → Prop
  | 0, _, _, _ => True
  | n + 1, _, f, g => C.disks.σ n ≫ f = C.disks.σ n ≫ g ∧ C.disks.τ n ≫ f = C.disks.τ n ≫ g

/-- Every map is parallel to itself. -/
theorem parallel_refl : ∀ (n : ℕ) {S : C.Obj} (f : C.disks.disk n ⟶ S), C.Parallel n f f
  | 0, _, _ => True.intro
  | _ + 1, _, _ => And.intro rfl rfl

/-- An admissible pair (Ara 2013, 2.3): parallel `f, g : D_n ⟶ S` with `S` the globular sum of a
table of dimension at most `n + 1`. -/
structure AdmissiblePair where
  /-- The dimension `n`. -/
  n : ℕ
  /-- The arity table. -/
  T : Table
  dim_le : T.dim ≤ n + 1
  /-- The first map. -/
  f : C.disks.disk n ⟶ C.ofTable T
  /-- The second map. -/
  g : C.disks.disk n ⟶ C.ofTable T
  parallel : C.Parallel n f g

/-- A lifting of an admissible pair. -/
def IsLifting (p : C.AdmissiblePair) (h : C.disks.disk (p.n + 1) ⟶ C.ofTable p.T) : Prop :=
  C.disks.σ p.n ≫ h = p.f ∧ C.disks.τ p.n ≫ h = p.g

/-- Contractibility (Ara 2013, 2.4): every admissible pair has a lifting. -/
def IsContractible : Prop := ∀ p : C.AdmissiblePair, ∃ h, C.IsLifting p h

/-- The admissible pair `(1_{D_n}, 1_{D_n})`, whose liftings give the identity cells. -/
def idPair (n : ℕ) : C.AdmissiblePair where
  n := n
  T := Table.globe n
  dim_le := show Finset.univ.sup (fun _ : Fin 1 => n) ≤ n + 1 from
    Finset.sup_le fun _ _ => Nat.le_succ n
  f := eqToHom (C.ofTable_globe n).symm
  g := eqToHom (C.ofTable_globe n).symm
  parallel := C.parallel_refl n _

end GlobularExtension

/-- **Layer 2.1.** A globular functor from a globular extension `C` to a category `K` with a
coglobular object `D` (Ara 2013, 1.4): `R` sends the disks and faces of `C` to those of `D`, and
the image of each globular sum of `C` is a globular sum in `K`. -/
structure IsGlobularFunctor {K : Type u} [Category.{v} K] (C : GlobularExtension)
    (D : CoglobularObject K) (R : C.Obj ⥤ K) : Prop where
  obj_disk : ∀ n, R.obj (C.disks.disk n) = D.disk n
  map_σ : ∀ n, R.map (C.disks.σ n) =
    eqToHom (obj_disk n) ≫ D.σ n ≫ eqToHom (obj_disk (n + 1)).symm
  map_τ : ∀ n, R.map (C.disks.τ n) =
    eqToHom (obj_disk n) ≫ D.τ n ≫ eqToHom (obj_disk (n + 1)).symm
  isGlobularSum : ∀ (T : Table) (Y : K) (φ : ∀ k, D.disk (T.top k) ⟶ Y), D.Compatible T φ →
    ∃! u : R.obj (C.ofTable T) ⟶ Y,
      ∀ k, R.map (C.incl T k) ≫ u = eqToHom (obj_disk (T.top k)) ≫ φ k

/-- A contractible globular extension, called a pseudo-coherator by Maltsiniotis (2010) and in
Ara's thesis, as Ara 2013, 2.4, recalls. A coherator is a pseudo-coherator with a defining
cellular tower (Ara 2013, 2.10–2.11); the tower is Layer 2.4's `CellularTower` and is not
prototyped here, so this structure omits freeness. -/
structure PseudoCoherator extends GlobularExtension where
  contractible : toGlobularExtension.IsContractible

/-! ## Layer 3: ∞-groupoids of type `C` -/

/-- A presheaf on `C` sends globular sums to globular products: every compatible family of
elements on the disks of a table comes from a unique element on the table (Ara 2013, 1.8). -/
def IsGlobularPresheaf (C : GlobularExtension) (X : C.Objᵒᵖ ⥤ Type w) : Prop :=
  ∀ (T : Table) (v : ∀ k, X.obj (op (C.disks.disk (T.top k)))),
    (∀ j, X.map (C.disks.faceTo (T.bot_lt_left j) false).op (v j.castSucc) =
      X.map (C.disks.faceTo (T.bot_lt_right j) true).op (v j.succ)) →
    ∃! a : X.obj (op (C.ofTable T)), ∀ k, X.map (C.incl T k).op a = v k

/-- **Layer 3.1.** The category `∞-Gpd_C` of ∞-groupoids of type `C` (Ara 2013, 2.5). -/
abbrev InfinityGroupoid (C : PseudoCoherator) :=
  ObjectProperty.FullSubcategory
    (fun X : C.Objᵒᵖ ⥤ Type w => IsGlobularPresheaf C.toGlobularExtension X)

/-! ## Layer 4: homotopy groups and weak equivalences -/

namespace GlobularExtension

variable (C : GlobularExtension)

/-- The `n`-cells `X(D_n)` of a presheaf on `C`. -/
abbrev Cell (X : C.Objᵒᵖ ⥤ Type w) (n : ℕ) : Type w := X.obj (op (C.disks.disk n))

/-- The source of an `(n+1)`-cell. -/
abbrev cellSrc (X : C.Objᵒᵖ ⥤ Type w) (n : ℕ) : C.Cell X (n + 1) → C.Cell X n :=
  fun a => X.map (C.disks.σ n).op a

/-- The target of an `(n+1)`-cell. -/
abbrev cellTgt (X : C.Objᵒᵖ ⥤ Type w) (n : ℕ) : C.Cell X (n + 1) → C.Cell X n :=
  fun a => X.map (C.disks.τ n).op a

/-- **Layer 4.1.** Two `n`-cells are homotopic, `a ∼_n b`: some `(n+1)`-cell goes from `a` to `b`
(Ara 2013, 4.2). -/
def CellJoined (X : C.Objᵒᵖ ⥤ Type w) (n : ℕ) (a b : C.Cell X n) : Prop :=
  ∃ h : C.Cell X (n + 1), C.cellSrc X n h = a ∧ C.cellTgt X n h = b

/-- `φ` induces a bijection `π₀ X → π₀ Y`, written out on `0`-cells modulo `∼₀` (Ara 2013, 4.11). -/
def BijectiveOnComponents {X Y : C.Objᵒᵖ ⥤ Type w} (φ : X ⟶ Y) : Prop :=
  (∀ y : C.Cell Y 0, ∃ x : C.Cell X 0, C.CellJoined Y 0 (φ.app _ x) y) ∧
    ∀ x x' : C.Cell X 0, C.CellJoined Y 0 (φ.app _ x) (φ.app _ x') → C.CellJoined X 0 x x'

/-- `φ` induces a bijection `π_{n+1}(X, u) → π_{n+1}(Y, φ u)` for an `n`-cell `u`, where
`π_{n+1}(X, u)` is the set of `(n+1)`-cells from `u` to `u` modulo `∼_{n+1}` (Ara 2013, 4.11). -/
def BijectiveOnLoops {X Y : C.Objᵒᵖ ⥤ Type w} (φ : X ⟶ Y) (n : ℕ) (u : C.Cell X n) : Prop :=
  (∀ β : C.Cell Y (n + 1), C.cellSrc Y n β = φ.app _ u → C.cellTgt Y n β = φ.app _ u →
      ∃ α : C.Cell X (n + 1), C.cellSrc X n α = u ∧ C.cellTgt X n α = u ∧
        C.CellJoined Y (n + 1) (φ.app _ α) β) ∧
    ∀ α α' : C.Cell X (n + 1), C.cellSrc X n α = u → C.cellTgt X n α = u →
      C.cellSrc X n α' = u → C.cellTgt X n α' = u →
      C.CellJoined Y (n + 1) (φ.app _ α) (φ.app _ α') → C.CellJoined X (n + 1) α α'

end GlobularExtension

namespace PseudoCoherator

variable (C : PseudoCoherator)

/-- **Layer 3.2.** The structural map `D_{n+1} ⟶ D_n` of identities: a chosen lifting of the
admissible pair `(1_{D_n}, 1_{D_n})`. -/
noncomputable def identityMap (n : ℕ) : C.disks.disk (n + 1) ⟶ C.disks.disk n :=
  Classical.choose (C.contractible (C.idPair n)) ≫ eqToHom (C.ofTable_globe n)

/-- **Layer 4.1.** The iterated identity `1^n_x` of a `0`-cell `x` (Ara's `k⁰_n(x)`, 2013, 4.11). -/
noncomputable def iteratedIdentity (X : C.Objᵒᵖ ⥤ Type w) : (n : ℕ) → C.Cell X 0 → C.Cell X n
  | 0, x => x
  | n + 1, x => X.map (C.identityMap n).op (iteratedIdentity X n x)

/-- **Layer 4.3.** Weak equivalences (Ara 2013, 4.17): a bijection on `π₀` and on every
`π_{n+1}(X, x) = π_{n+1}(X, 1^n_x)`. Since `φ` commutes with the structural maps,
`φ (1^n_x) = 1^n_{φ x}`, so the target loops are Ara's. -/
def IsWeakEquivalence {X Y : C.Objᵒᵖ ⥤ Type w} (φ : X ⟶ Y) : Prop :=
  C.BijectiveOnComponents φ ∧
    ∀ (n : ℕ) (x : C.Cell X 0), C.BijectiveOnLoops φ n (C.iteratedIdentity X n x)

/-- **Layer 4.3.** Ara 2013, Theorem 4.18, (1) ⇔ (2): between ∞-groupoids of type `C`, a weak
equivalence is a bijection on `π₀` and on `π_{n+1}(X, u)` at every `n`-cell `u`. -/
theorem isWeakEquivalence_iff {X Y : C.Objᵒᵖ ⥤ Type w}
    (hX : IsGlobularPresheaf C.toGlobularExtension X)
    (hY : IsGlobularPresheaf C.toGlobularExtension Y) (φ : X ⟶ Y) :
    C.IsWeakEquivalence φ ↔
      C.BijectiveOnComponents φ ∧ ∀ (n : ℕ) (u : C.Cell X n), C.BijectiveOnLoops φ n u := by
  sorry

/-- **Layer 7.1.** The class `W_C` of weak equivalences, on presheaves; `W_C` on `∞-Gpd_C` is its
inverse image under the inclusion. -/
def weakEquivalences : MorphismProperty (C.Objᵒᵖ ⥤ Type w) := fun _ _ φ => C.IsWeakEquivalence φ

end PseudoCoherator

/-! ## Layer 5: spaces and the fundamental ∞-groupoid -/

/-- The weak homotopy equivalences `W_Top` of `TopCat.{0}`: bijective on path components and on
every `π_{n+1}(X, x)`. The body is that of `IsWeakHomotopyEquivalence` (StableHomotopyKTheory
§2.1), applied to `f.hom`. -/
def weTop : MorphismProperty TopCat.{0} := fun X _ f =>
  Function.Bijective (ZerothHomotopy.lift (fun x => ZerothHomotopy.mk (f.hom x))
    (fun {_ _} p => ZerothHomotopy.sound (p.map f.hom.continuous))) ∧
    ∀ (x : X) (n : ℕ),
      Function.Bijective (HomotopyGroup.map (N := Fin (n + 1)) (x := x) f.hom rfl)

/-- **Layer 5.2.** The fundamental ∞-groupoid presheaf `Π_∞^R(X) = TopCat(R(−), X)` for a functor
`R : C ⥤ TopCat` (Ara 2013, 5.2); when `R` is a globular functor into `stdDisks`
(`IsGlobularFunctor`) it is an ∞-groupoid of type `C`. -/
def piPresheaf (C : PseudoCoherator) (R : C.Obj ⥤ TopCat.{0}) :
    TopCat.{0} ⥤ (C.Objᵒᵖ ⥤ Type) :=
  yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj R.op

/-- **Layer 5.4.** Ara 2013, Corollaries 8.9–8.11 in `TopCat`: for a globular functor
`R : C ⥤ TopCat` with the coglobular space `stdDisks`, `Π_∞^R f` is a weak equivalence of
∞-groupoids of type `C` if and only if `f` is a weak homotopy equivalence. Ara states it for a
formal coherator (8.1); both sides involve only the cells `TopCat(D^n, X)`, their faces and the
iterated identities, which factor through the point `D^0`, so it is stated for every
pseudo-coherator. Without `hR` it fails: for `R` constant at a point, every cell is a point. -/
theorem piPresheaf_isWeakEquivalence_iff (C : PseudoCoherator) (R : C.Obj ⥤ TopCat.{0})
    (hR : IsGlobularFunctor C.toGlobularExtension stdDisks R) {X Y : TopCat.{0}} (f : X ⟶ Y) :
    C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f := by
  sorry

end TauCetiRoadmap.GrothendieckInfinityGroupoids
