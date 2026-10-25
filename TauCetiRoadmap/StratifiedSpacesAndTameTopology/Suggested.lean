import Mathlib

/-!
# Stratified spaces, tubular data and tame topology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below force several load-bearing design choices and suggest Lean
forms for milestones; proving all of them would finish neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

The choices fixed here are: a stratification is a map to a poset that is continuous for the
upper-set (Alexandrov) topology, so closures of strata go *down* the poset; the open cone carries
the uniform-collar topology at its apex rather than the quotient topology; an exit path is a path
along which the stratum index is monotone; a cylinder over `Fin n → R` adds coordinate `0` and
projects by `Fin.tail`, as in the cylindrical algebraic decomposition of RealAlgebraicGeometry.
The smoothness conditions of Thom--Mather control data are stated in `README.md`; the structure
below records their topological part only.
-/

noncomputable section

namespace TauCetiRoadmap.StratifiedSpacesAndTameTopology

open Set Topology unitInterval CategoryTheory

universe u v

/-! ## Layer 1: stratified spaces over a poset -/

/-- A stratification of `X` by the poset `P`: the stratum index is continuous for the upper-set
(Alexandrov) topology of `P`, i.e. the preimage of every upper set is open. -/
structure Stratification (X : Type u) [TopologicalSpace X] (P : Type v) [PartialOrder P] where
  /-- The index of the stratum containing a point. -/
  toFun : X → P
  isOpen_preimage : ∀ U : Set P, IsUpperSet U → IsOpen (toFun ⁻¹' U)

namespace Stratification

variable {X : Type u} [TopologicalSpace X] {P : Type v} [PartialOrder P]

/-- The stratum of index `p`. -/
def stratum (s : Stratification X P) (p : P) : Set X := s.toFun ⁻¹' {p}

/-- The definition agrees with continuity into Mathlib's `Topology.WithUpperSet`. -/
theorem continuous_toUpperSet (s : Stratification X P) :
    Continuous (fun x => Topology.WithUpperSet.toUpperSet (s.toFun x)) := by
  sorry

theorem isLocallyClosed_stratum (s : Stratification X P) (p : P) :
    IsLocallyClosed (s.stratum p) := by
  sorry

theorem closure_stratum_subset (s : Stratification X P) (p : P) :
    closure (s.stratum p) ⊆ s.toFun ⁻¹' Iic p := by
  sorry

/-- The frontier condition: a stratum meeting the closure of another lies in that closure. -/
def SatisfiesFrontierCondition (s : Stratification X P) : Prop :=
  ∀ p q : P, (s.stratum p ∩ closure (s.stratum q)).Nonempty →
    s.stratum p ⊆ closure (s.stratum q)

end Stratification

/-! ## Layer 2: open cones and conically stratified spaces -/

/-- The open cone on `L`: `none` is the apex, `some (x, t)` the point of `L` at height `t > 0`. -/
def OpenCone (L : Type u) : Type u := Option (L × Ioi (0 : ℝ))

namespace OpenCone

variable {L : Type u}

/-- The apex of the cone. -/
def apex : OpenCone L := (none : Option (L × Ioi (0 : ℝ)))

/-- The point of `L` at height `t`. -/
def mk (x : L) (t : Ioi (0 : ℝ)) : OpenCone L := (some (x, t) : Option (L × Ioi (0 : ℝ)))

/-- The cone topology: a set is open when its trace on `L × (0, ∞)` is open and, if it contains
the apex, it contains a uniform collar `L × (0, ε)`. For compact `L` this is the quotient
topology of `L × [0, ∞)` with `L × {0}` collapsed; for noncompact `L` it is not. -/
instance [TopologicalSpace L] : TopologicalSpace (OpenCone L) where
  IsOpen U := IsOpen {z : L × Ioi (0 : ℝ) | mk z.1 z.2 ∈ U} ∧
    (apex ∈ U → ∃ ε : ℝ, 0 < ε ∧ ∀ (x : L) (t : Ioi (0 : ℝ)), (t : ℝ) < ε → mk x t ∈ U)
  isOpen_univ := sorry
  isOpen_inter := sorry
  isOpen_sUnion := sorry

/-- The stratification of the cone on `L` over `P`, sending the apex to `p`, when `L` is
stratified over `P` by indices strictly above `p`. -/
def stratification [TopologicalSpace L] {P : Type v} [PartialOrder P] (p : P)
    (sL : Stratification L P) (hp : ∀ y, p < sL.toFun y) : Stratification (OpenCone L) P where
  toFun c := Option.elim (c : Option (L × Ioi (0 : ℝ))) p (fun y => sL.toFun y.1)
  isOpen_preimage := sorry

end OpenCone

/-- A stratified space is conically stratified when every point `x` has an open neighbourhood
of the form `Z × C(L)`, stratum-preservingly, with `x` in `Z × {apex}` and `L` stratified by the
indices strictly above that of `x` (Lurie, *Higher Algebra*, Definition A.5.5). -/
def IsConicallyStratified {X : Type u} [TopologicalSpace X] {P : Type v} [PartialOrder P]
    (s : Stratification X P) : Prop :=
  ∀ x : X, ∃ (Z : Type u) (_ : TopologicalSpace Z) (L : Type u) (_ : TopologicalSpace L)
    (sL : Stratification L P) (hL : ∀ y, s.toFun x < sL.toFun y) (e : Z × OpenCone L → X),
    IsOpenEmbedding e ∧ (∃ z, e (z, OpenCone.apex) = x) ∧
      ∀ (z : Z) (c : OpenCone L),
        s.toFun (e (z, c)) = (OpenCone.stratification (s.toFun x) sL hL).toFun c

/-! ## Layer 3: exit paths -/

section ExitPaths

variable {X : Type u} [TopologicalSpace X] {P : Type v} [PartialOrder P]

/-- An exit path: the stratum index is monotone along the path. -/
def IsExitPath (s : Stratification X P) {x y : X} (γ : Path x y) : Prop :=
  Monotone fun t : I => s.toFun (γ t)

/-- Two exit paths are exit-homotopic when they are homotopic rel endpoints through exit paths. -/
def ExitHomotopic (s : Stratification X P) {x y : X} (γ δ : Path x y) : Prop :=
  ∃ F : Path.Homotopy γ δ, ∀ u : I, IsExitPath s (F.eval u)

/-- Morphisms of the exit-path category: exit paths up to exit homotopy. -/
def ExitHom (s : Stratification X P) (x y : X) : Type u :=
  Quot fun γ δ : {γ : Path x y // IsExitPath s γ} => ExitHomotopic s γ.1 δ.1

/-- The exit-path category of a stratified space; its objects are the points. -/
structure ExitPathCategory (s : Stratification X P) where
  /-- The underlying point. -/
  pt : X

instance (s : Stratification X P) : CategoryTheory.Category (ExitPathCategory s) where
  Hom a b := ExitHom s a.pt b.pt
  id := sorry
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- For a trivial stratification the exit-path category is the fundamental groupoid. -/
theorem nonempty_equivalence_fundamentalGroupoid [Subsingleton P] (s : Stratification X P) :
    Nonempty (ExitPathCategory s ≌ FundamentalGroupoid X) := by
  sorry

/-- An exit path between two points of one stratum stays in that stratum. -/
theorem IsExitPath.mem_stratum {s : Stratification X P} {x y : X} {γ : Path x y}
    (hγ : IsExitPath s γ) (hxy : s.toFun x = s.toFun y) (t : I) :
    γ t ∈ s.stratum (s.toFun x) := by
  sorry

end ExitPaths

/-! ## Layer 5: tubes and control data (topological part) -/

section Tubes

variable {X : Type u} [TopologicalSpace X] {P : Type v} [PartialOrder P]

/-- A tube around the stratum `p`: an open neighbourhood, a retraction onto the stratum and a
tubular function vanishing exactly on the stratum. -/
structure Tube (s : Stratification X P) (p : P) where
  /-- The open tubular neighbourhood. -/
  carrier : Set X
  isOpen_carrier : IsOpen carrier
  stratum_subset : s.stratum p ⊆ carrier
  /-- The retraction `π_p`. -/
  retraction : X → X
  continuousOn_retraction : ContinuousOn retraction carrier
  retraction_mem : ∀ x ∈ carrier, retraction x ∈ s.stratum p
  retraction_eq_self : ∀ x ∈ s.stratum p, retraction x = x
  /-- The tubular function `ρ_p`. -/
  distance : X → ℝ
  continuousOn_distance : ContinuousOn distance carrier
  distance_nonneg : ∀ x ∈ carrier, 0 ≤ distance x
  distance_eq_zero_iff : ∀ x ∈ carrier, distance x = 0 ↔ x ∈ s.stratum p

/-- The control conditions of Mather: `π_p ∘ π_q = π_p` and `ρ_p ∘ π_q = ρ_p` wherever both
sides are defined, for `p < q`. -/
structure TopologicalControlData (s : Stratification X P) where
  /-- The tube around each stratum. -/
  tube : ∀ p : P, Tube s p
  retraction_comp : ∀ p q : P, p < q → ∀ x ∈ (tube p).carrier ∩ (tube q).carrier,
    (tube q).retraction x ∈ (tube p).carrier →
      (tube p).retraction ((tube q).retraction x) = (tube p).retraction x
  distance_comp : ∀ p q : P, p < q → ∀ x ∈ (tube p).carrier ∩ (tube q).carrier,
    (tube q).retraction x ∈ (tube p).carrier →
      (tube p).distance ((tube q).retraction x) = (tube p).distance x

end Tubes

/-! ## Layer 4: o-minimal structures -/

/-- A structure on a linearly ordered type `R` in the sense of van den Dries, with o-minimality
built in: definable sets of every arity form Boolean algebras closed under cylinders on either
side, containing the diagonals and the order, closed under the projection `Fin.tail`, and the
definable subsets of `R` are exactly the finite unions of points and open intervals. -/
structure OMinimalStructure (R : Type u) [LinearOrder R] where
  /-- The definable subsets of `Fin n → R`. -/
  Definable : (n : ℕ) → Set (Set (Fin n → R))
  empty_mem : ∀ n, (∅ : Set (Fin n → R)) ∈ Definable n
  compl_mem : ∀ n, ∀ A ∈ Definable n, Aᶜ ∈ Definable n
  union_mem : ∀ n, ∀ A ∈ Definable n, ∀ B ∈ Definable n, A ∪ B ∈ Definable n
  tail_cylinder_mem : ∀ n, ∀ A ∈ Definable n,
    {x : Fin (n + 1) → R | Fin.tail x ∈ A} ∈ Definable (n + 1)
  init_cylinder_mem : ∀ n, ∀ A ∈ Definable n,
    {x : Fin (n + 1) → R | Fin.init x ∈ A} ∈ Definable (n + 1)
  diagonal_mem : ∀ n (i j : Fin n), {x : Fin n → R | x i = x j} ∈ Definable n
  lt_mem : {x : Fin 2 → R | x 0 < x 1} ∈ Definable 2
  image_tail_mem : ∀ n, ∀ A ∈ Definable (n + 1),
    {y : Fin n → R | ∃ x ∈ A, Fin.tail x = y} ∈ Definable n
  mem_one_iff : ∀ A : Set (Fin 1 → R), A ∈ Definable 1 ↔
    ∃ (F : Finset R) (J : Finset (WithBot R × WithTop R)),
      A = {x | x 0 ∈ (F : Set R) ∨
        ∃ ab ∈ J, ab.1 < ((x 0 : R) : WithBot R) ∧ ((x 0 : R) : WithTop R) < ab.2}

namespace OMinimalStructure

variable {R : Type u} [LinearOrder R]

/-- A function on `C ⊆ Fin n → R` is definable when its graph, with the value as coordinate `0`,
is definable. -/
def DefinableFunOn (S : OMinimalStructure R) {n : ℕ} (C : Set (Fin n → R))
    (f : (Fin n → R) → R) : Prop :=
  {y : Fin (n + 1) → R | Fin.tail y ∈ C ∧ y 0 = f (Fin.tail y)} ∈ S.Definable (n + 1)

/-- A map on `A ⊆ Fin m → R` is definable when its graph is definable. -/
def DefinableMapOn (S : OMinimalStructure R) {m n : ℕ} (A : Set (Fin m → R))
    (f : (Fin m → R) → (Fin n → R)) : Prop :=
  {z : Fin (m + n) → R | ∃ x ∈ A, z = Fin.append x (f x)} ∈ S.Definable (m + n)

variable [TopologicalSpace R] [OrderTopology R]

/-- Cells, built by graphs and bands over cells of one dimension lower; the new coordinate is
coordinate `0`. A band boundary is either infinite or a continuous definable function. -/
inductive IsCell (S : OMinimalStructure R) : (n : ℕ) → Set (Fin n → R) → Prop
  | zero : IsCell S 0 univ
  | graph {n : ℕ} {C : Set (Fin n → R)} (f : (Fin n → R) → R) :
      IsCell S n C → ContinuousOn f C → S.DefinableFunOn C f →
      IsCell S (n + 1) {y | Fin.tail y ∈ C ∧ y 0 = f (Fin.tail y)}
  | band {n : ℕ} {C : Set (Fin n → R)} (f : (Fin n → R) → WithBot R)
      (g : (Fin n → R) → WithTop R) :
      IsCell S n C →
      ((∀ x ∈ C, f x = ⊥) ∨ ∃ f' : (Fin n → R) → R, ContinuousOn f' C ∧
        S.DefinableFunOn C f' ∧ ∀ x ∈ C, f x = (f' x : WithBot R)) →
      ((∀ x ∈ C, g x = ⊤) ∨ ∃ g' : (Fin n → R) → R, ContinuousOn g' C ∧
        S.DefinableFunOn C g' ∧ ∀ x ∈ C, g x = (g' x : WithTop R)) →
      (∀ x ∈ C, ∃ t : R, f x < (t : WithBot R) ∧ (t : WithTop R) < g x) →
      IsCell S (n + 1)
        {y | Fin.tail y ∈ C ∧ f (Fin.tail y) < ((y 0 : R) : WithBot R) ∧
          ((y 0 : R) : WithTop R) < g (Fin.tail y)}

open scoped Classical in
/-- A cell decomposition of `Fin n → R` (van den Dries, Chapter 3, §2). -/
def IsCellDecomposition (S : OMinimalStructure R) :
    (n : ℕ) → Finset (Set (Fin n → R)) → Prop
  | 0, 𝒞 => 𝒞 = {univ}
  | n + 1, 𝒞 => (∀ C ∈ 𝒞, S.IsCell (n + 1) C) ∧ Setoid.IsPartition (𝒞 : Set (Set _)) ∧
      IsCellDecomposition S n (𝒞.image fun C => {x : Fin n → R | ∃ y ∈ C, Fin.tail y = x})

/-- The cell decomposition theorem (van den Dries, Chapter 3, (2.11)(I)), for an o-minimal
structure on a dense linear order without endpoints. -/
theorem exists_isCellDecomposition [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R]
    (S : OMinimalStructure R) {n : ℕ} (𝒜 : Finset (Set (Fin n → R)))
    (h𝒜 : ∀ A ∈ 𝒜, A ∈ S.Definable n) :
    ∃ 𝒞 : Finset (Set (Fin n → R)), S.IsCellDecomposition n 𝒞 ∧
      ∀ A ∈ 𝒜, ∀ C ∈ 𝒞, C ⊆ A ∨ Disjoint C A := by
  sorry

end OMinimalStructure

/-- The open simplex spanned by a finite set of points: strictly positive barycentric
combinations. -/
def openSimplex {R : Type u} [Field R] [LinearOrder R] {n : ℕ} (σ : Finset (Fin n → R)) :
    Set (Fin n → R) :=
  {x | ∃ w : (Fin n → R) → R, (∀ v ∈ σ, 0 < w v) ∧ ∑ v ∈ σ, w v = 1 ∧
    ∑ v ∈ σ, w v • v = x}

/-- The triangulation theorem (van den Dries, Chapter 8, (2.9)) for an o-minimal expansion of an
ordered field: a definable set is definably homeomorphic to a union of open simplices of a finite
complex, compatibly with finitely many definable subsets. -/
theorem OMinimalStructure.exists_triangulation {R : Type u} [Field R] [LinearOrder R]
    [IsStrictOrderedRing R] [TopologicalSpace R] [OrderTopology R] (S : OMinimalStructure R)
    (hadd : {x : Fin 3 → R | x 0 = x 1 + x 2} ∈ S.Definable 3)
    (hmul : {x : Fin 3 → R | x 0 = x 1 * x 2} ∈ S.Definable 3)
    {n : ℕ} (A : Set (Fin n → R)) (hA : A ∈ S.Definable n)
    (ℬ : Finset (Set (Fin n → R))) (hℬ : ∀ B ∈ ℬ, B ∈ S.Definable n ∧ B ⊆ A) :
    ∃ (K : Geometry.SimplicialComplex R (Fin n → R)) (T : Set (Finset (Fin n → R)))
      (Φ : (Fin n → R) → (Fin n → R)),
      K.faces.Finite ∧ T ⊆ K.faces ∧ S.DefinableMapOn A Φ ∧ ContinuousOn Φ A ∧ InjOn Φ A ∧
      Φ '' A = ⋃ σ ∈ T, openSimplex σ ∧ ContinuousOn (Function.invFunOn Φ A) (Φ '' A) ∧
      ∀ B ∈ ℬ, ∃ T' ⊆ T, Φ '' B = ⋃ σ ∈ T', openSimplex σ := by
  sorry

end TauCetiRoadmap.StratifiedSpacesAndTameTopology
