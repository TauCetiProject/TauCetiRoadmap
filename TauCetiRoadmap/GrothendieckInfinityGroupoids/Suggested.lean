import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map

set_option autoImplicit false

/-!
# Grothendieck ∞-groupoids and the homotopy hypothesis: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. `sorry` is allowed in this human-owned roadmap library: these are goals, not proofs.

Conventions follow Ara, *On the homotopy theory of Grothendieck ∞-groupoids*, J. Pure Appl.
Algebra 217 (2013): globular sums of tables glued by target on the left and source on the right
(1.3); admissible pairs `(f, g) : D_n → S` with `dim S ≤ n + 1` (2.3); coherators free and
contractible (2.11); ∞-groupoids of type `C` are presheaves sending globular sums to globular
products (1.8, 2.5). Globular extensions are prototyped with objects indexed by tables (Ara 2013,
Remark 2.6), which is the case for free ones.

The only Tau Ceti declaration consumed is `HomotopyGroup.map`. Weak homotopy equivalences are
spelled out in `weTop` with the two fields of Tau Ceti's `ContinuousMap.IsWeakHomotopyEquivalence`
(the AlgebraicTopology roadmap's), which is not yet in the Tau Ceti revision this repository pins;
`weTop` is to be replaced by that predicate when the pin moves. Definitions have
real bodies; only theorem statements are `sorry`. The universal property of a globular sum is
stated directly (unique factorization of compatible families) rather than through Mathlib's
`IsColimit` on an explicit diagram, which Layer 1.2 builds. Not prototyped: the cellular towers
that make a pseudo-coherator a coherator (Layer 2.4), the homotopy groups and weak equivalences of
∞-groupoids (Layer 4), and the elementary expansion theorem (Layer 6); the homotopy hypothesis is
therefore stated for an abstract weak-equivalence class `W`, to be instantiated by Layer 4.
-/

namespace TauCetiRoadmap.GrothendieckInfinityGroupoids

open CategoryTheory Limits Opposite

universe u v

/-! ## Layer 0: globular sets -/

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

/-- A family of maps out of the disks of a table is compatible when it agrees on each gluing:
target face on the left, source face on the right. -/
def Compatible (T : Table) {Y : K} (φ : ∀ k, D.disk (T.top k) ⟶ Y) : Prop :=
  ∀ j, D.faceTo (T.bot_lt_left j) true ≫ φ j.castSucc =
    D.faceTo (T.bot_lt_right j) false ≫ φ j.succ

end CoglobularObject

/-! ## Layer 2: globular extensions and (pseudo-)coherators -/

/-- A globular extension whose objects are tables (Ara 2013, 1.4, with Remark 2.6): disks, the
inclusions of the disks of a table into its object, and the universal property of the globular
sum. -/
structure GlobularExtension where
  /-- The objects. -/
  Obj : Type
  [cat : Category.{0} Obj]
  /-- The object of a table. -/
  ofTable : Table → Obj
  ofTable_bijective : Function.Bijective ofTable
  /-- The disks. -/
  disks : CoglobularObject Obj
  /-- The inclusion of the `k`-th disk of a table. -/
  incl : ∀ (T : Table) (k : Fin (T.width + 1)), disks.disk (T.top k) ⟶ ofTable T
  incl_compatible : ∀ T, disks.Compatible T (incl T)
  isGlobularSum : ∀ (T : Table) (Y : Obj) (φ : ∀ k, disks.disk (T.top k) ⟶ Y),
    disks.Compatible T φ → ∃! u : ofTable T ⟶ Y, ∀ k, incl T k ≫ u = φ k

attribute [instance] GlobularExtension.cat

namespace GlobularExtension

variable (C : GlobularExtension)

/-- Two maps `D_n ⟶ S` are parallel: equal sources and targets (no condition for `n = 0`). -/
def Parallel : (n : ℕ) → {S : C.Obj} → (C.disks.disk n ⟶ S) → (C.disks.disk n ⟶ S) → Prop
  | 0, _, _, _ => True
  | n + 1, _, f, g => C.disks.σ n ≫ f = C.disks.σ n ≫ g ∧ C.disks.τ n ≫ f = C.disks.τ n ≫ g

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

end GlobularExtension

/-- A contractible globular extension (Ara's « pseudo-coherator », 2013, 2.4). A coherator is a
pseudo-coherator with a defining cellular tower (Ara 2013, 2.10–2.11); the tower is Layer 2.4's
`CellularTower` and is not prototyped here, so this structure omits freeness. -/
structure PseudoCoherator extends GlobularExtension where
  contractible : toGlobularExtension.IsContractible

/-! ## Layer 3: ∞-groupoids of type `C` -/

/-- A presheaf on `C` sends globular sums to globular products: every compatible family of
elements on the disks of a table comes from a unique element on the table. -/
def IsGlobularPresheaf (C : GlobularExtension) (X : C.Objᵒᵖ ⥤ Type) : Prop :=
  ∀ (T : Table) (v : ∀ k, X.obj (op (C.disks.disk (T.top k)))),
    (∀ j, X.map (C.disks.faceTo (T.bot_lt_left j) true).op (v j.castSucc) =
      X.map (C.disks.faceTo (T.bot_lt_right j) false).op (v j.succ)) →
    ∃! a : X.obj (op (C.ofTable T)), ∀ k, X.map (C.incl T k).op a = v k

/-- **Layer 3.1.** The category `∞-Gpd_C` of ∞-groupoids of type `C` (Ara 2013, 2.5). -/
abbrev InfinityGroupoid (C : PseudoCoherator) : Type 1 :=
  ObjectProperty.FullSubcategory (IsGlobularPresheaf C.toGlobularExtension)

/-! ## Layer 5: spaces and the fundamental ∞-groupoid -/

/-- The weak homotopy equivalences of `TopCat.{0}`: surjective on path components and bijective on
every `π_n(X, x)`. These are the fields of Tau Ceti's `ContinuousMap.IsWeakHomotopyEquivalence`,
which replaces this body once the pinned Tau Ceti contains it. -/
def weTop : MorphismProperty TopCat.{0} := fun X Y f =>
  (∀ y : Y, ∃ x : X, Joined (f.hom x) y) ∧
    ∀ (n : ℕ) (x : X),
      Function.Bijective (HomotopyGroup.map (N := Fin n) f.hom (rfl : f.hom x = f.hom x))

/-- **Layer 5.2.** The fundamental ∞-groupoid presheaf `Π_∞^R(X) = TopCat(R(−), X)` for a functor
`R : C ⥤ TopCat`. -/
def piPresheaf (C : PseudoCoherator) (R : C.Obj ⥤ TopCat.{0}) :
    TopCat.{0} ⥤ (C.Objᵒᵖ ⥤ Type) :=
  yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj R.op

/-- **Layer 5.2.** When `R` sends the disks to the topological disks and preserves globular sums,
`Π_∞^R(X)` is an ∞-groupoid of type `C`. The hypothesis is stated in the form Layer 5.1 proves:
`R` carries each globular-sum cocone of `C` to a colimit cocone in `TopCat`. -/
theorem piPresheaf_isGlobular (C : PseudoCoherator) (R : C.Obj ⥤ TopCat.{0})
    (hR : ∀ (T : Table) (Y : TopCat.{0}) (φ : ∀ k, R.obj (C.disks.disk (T.top k)) ⟶ Y),
      (∀ j, R.map (C.disks.faceTo (T.bot_lt_left j) true) ≫ φ j.castSucc =
        R.map (C.disks.faceTo (T.bot_lt_right j) false) ≫ φ j.succ) →
      ∃! u : R.obj (C.ofTable T) ⟶ Y, ∀ k, R.map (C.incl T k) ≫ u = φ k)
    (X : TopCat.{0}) : IsGlobularPresheaf C.toGlobularExtension ((piPresheaf C R).obj X) := by
  sorry

/-! ## Layer 7: the homotopy hypothesis -/

/-- **Layer 7.3.** The homotopy hypothesis for a functor `Pi : TopCat ⥤ G` into a category with
weak equivalences `W`, inverting weak homotopy equivalences: the induced functor
`TopCat[W_Top⁻¹] ⥤ G[W⁻¹]` is an equivalence. For `G = ∞-Gpd_C`, `W` the weak equivalences of
Layer 4 and `Pi = Π_∞^R`, this is Ara 2013, Conjecture 8.14. -/
def HomotopyHypothesisFor {G : Type 1} [Category.{0} G] (W : MorphismProperty G)
    (Pi : TopCat.{0} ⥤ G) (hPi : weTop.IsInvertedBy (Pi ⋙ W.Q)) : Prop :=
  (Localization.lift (Pi ⋙ W.Q) hPi weTop.Q).IsEquivalence

end TauCetiRoadmap.GrothendieckInfinityGroupoids
