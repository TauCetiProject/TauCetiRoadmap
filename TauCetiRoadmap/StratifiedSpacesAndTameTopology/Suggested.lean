module

public import Mathlib
public import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic
public import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function

/-!
# Stratified spaces, tubular data and tame topology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on
native carriers. The API around each target, the special cases and the Checks stay in the README.

Three design choices are fixed here. A stratification is a map to a poset that is continuous for
the upper-set (Alexandrov) topology, so closures of strata go down the poset. The open cone
carries the uniform-collar topology at its apex. The exit-path category is the quotient of the
free category on exit paths by exit homotopy, concatenation and the constant paths.

Headlines stated here (README target, Lean name):

* 1.1, `Stratification`.
* 2.1, `OpenCone` with its topology and `OpenCone.stratification`.
* 3.2, `IsExitPath`, `ExitHomotopic` and `ExitPathCategory` (on `ExitPathCategory.Rel`).
* 3.3(a), `ExitPathCategory.nonempty_equivalence_fundamentalGroupoid`.
* 3.3(e), `OpenCone.nonempty_unique_hom_apex`.
* 3.4, `nonempty_equivalence_sphere` (on `sphereStratification`).
* 4.1, `OMinimalStructure`, `OMinimalStructure.DefinableFunOn`,
  `OMinimalStructure.DefinableMapOn`.
* 4.2, `exists_oMinimalStructure_eq_isSemialgebraic`.
* 4.4, `OMinimalStructure.IsCell`, `OMinimalStructure.IsCellDecomposition` and the cell
  decomposition theorem `OMinimalStructure.exists_isCellDecomposition`.
* 4.7, `OMinimalStructure.exists_triangulation` (on `openSimplex`).
* 4.9(b), `exists_triangulation_semialgebraic`.

Not statable at the pins, with the carrier each lacks:

* 5.3, existence of control data; 5.5, Thom's first isotopy lemma and its corollary 5.5(a), local
  conical structure: they lack smooth stratified spaces, whose strata are smooth manifolds with
  the subspace topology; no structure of a smooth manifold on a subset with its subspace
  topology is declared at the pins.
* 7.3–7.4, unfolding of a Thom–Mather space and reconstruction: they lack, in addition,
  DifferentialGeometry 5.5's abstract boundary of a manifold with corners, on which the face
  structure of 6.1 is built; neither pin declares it.
* 8.2, Whitney stratification of definable sets, and 8.3, Nash strata: they lack the same
  submanifold carrier as 5.3.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.StratifiedSpacesAndTameTopology

open Set Topology unitInterval CategoryTheory

universe u v

/-! ## Layer 1: stratified spaces over a poset -/

/-- **Layer 1.1.** A stratification of `X` by the poset `P`: the stratum index is continuous for
the upper-set (Alexandrov) topology of `P`, i.e. the preimage of every upper set is open. -/
structure Stratification (X : Type u) [TopologicalSpace X] (P : Type v) [PartialOrder P] where
  /-- The index of the stratum containing a point. -/
  toFun : X → P
  /-- The preimage of every upper set is open. -/
  isOpen_preimage : ∀ U : Set P, IsUpperSet U → IsOpen (toFun ⁻¹' U)

/-! ## Layer 2: open cones -/

/-- **Layer 2.1.** The open cone on `L`: `none` is the apex, `some (x, t)` the point of `L` at
height `t > 0`. -/
def OpenCone (L : Type u) : Type u := Option (L × Ioi (0 : ℝ))

namespace OpenCone

variable {L : Type u}

/-- **Layer 2.1.** The apex of the cone. -/
def apex : OpenCone L := (none : Option (L × Ioi (0 : ℝ)))

/-- **Layer 2.1.** The point of `L` at height `t`. -/
def mk (x : L) (t : Ioi (0 : ℝ)) : OpenCone L := (some (x, t) : Option (L × Ioi (0 : ℝ)))

/-- **Layer 2.1.** The cone topology: a set is open when its trace on `L × (0, ∞)` is open and, if
it contains the apex, it contains a uniform collar `L × (0, ε)`. For compact `L` this is the
quotient topology of `L × [0, ∞)` with `L × {0}` collapsed; for noncompact `L` it is not. -/
instance [TopologicalSpace L] : TopologicalSpace (OpenCone L) where
  IsOpen U := IsOpen {z : L × Ioi (0 : ℝ) | mk z.1 z.2 ∈ U} ∧
    (apex ∈ U → ∃ ε : ℝ, 0 < ε ∧ ∀ (x : L) (t : Ioi (0 : ℝ)), (t : ℝ) < ε → mk x t ∈ U)
  isOpen_univ := ⟨by simp, fun _ => ⟨1, one_pos, fun _ _ _ => mem_univ _⟩⟩
  isOpen_inter U V hU hV := by
    refine ⟨hU.1.inter hV.1, fun h => ?_⟩
    obtain ⟨ε, hε, hεU⟩ := hU.2 h.1
    obtain ⟨δ, hδ, hδV⟩ := hV.2 h.2
    exact ⟨min ε δ, lt_min hε hδ, fun x t ht =>
      ⟨hεU x t (ht.trans_le (min_le_left _ _)), hδV x t (ht.trans_le (min_le_right _ _))⟩⟩
  isOpen_sUnion S hS := by
    refine ⟨?_, fun h => ?_⟩
    · have : {z : L × Ioi (0 : ℝ) | mk z.1 z.2 ∈ ⋃₀ S} =
          ⋃ U ∈ S, {z : L × Ioi (0 : ℝ) | mk z.1 z.2 ∈ U} := by
        ext z; simp
      rw [this]
      exact isOpen_biUnion fun U hU => (hS U hU).1
    · obtain ⟨U, hU, ha⟩ := h
      obtain ⟨ε, hε, hεU⟩ := (hS U hU).2 ha
      exact ⟨ε, hε, fun x t ht => ⟨U, hU, hεU x t ht⟩⟩

/-- **Layer 2.1.** The stratification of the cone on `L` over `P`, sending the apex to `p`, when
`L` is stratified over `P` by indices strictly above `p`. -/
def stratification [TopologicalSpace L] {P : Type v} [PartialOrder P] (p : P)
    (sL : Stratification L P) (hp : ∀ y, p < sL.toFun y) : Stratification (OpenCone L) P where
  toFun c := Option.elim (c : Option (L × Ioi (0 : ℝ))) p (fun y => sL.toFun y.1)
  isOpen_preimage U hU := by
    refine ⟨?_, fun h => ⟨1, one_pos, fun x _ _ => ?_⟩⟩
    · exact (sL.isOpen_preimage U hU).preimage continuous_fst
    · exact hU (hp x).le h

end OpenCone

/-! ## Layer 3: exit paths and the exit-path category -/

section ExitPaths

variable {X : Type u} [TopologicalSpace X] {P : Type v} [PartialOrder P]

/-- **Layer 3.1.** An exit path: the stratum index is monotone along the path. -/
def IsExitPath (s : Stratification X P) {x y : X} (γ : Path x y) : Prop :=
  Monotone fun t : I => s.toFun (γ t)

/-- **Layer 3.2.** Two exit paths are exit-homotopic when they are homotopic rel endpoints through
exit paths. -/
def ExitHomotopic (s : Stratification X P) {x y : X} (γ δ : Path x y) : Prop :=
  ∃ F : Path.Homotopy γ δ, ∀ u : I, IsExitPath s (F.eval u)

/-- **Layer 3.2.** The quiver of exit paths: its vertices are the points of `X`, its arrows the
exit paths. -/
structure ExitPathQuiver (s : Stratification X P) where
  /-- The underlying point. -/
  pt : X

/-- **Layer 3.2.** The arrows of the quiver of exit paths from `a` to `b` are the exit paths from
`a.pt` to `b.pt`. -/
instance (s : Stratification X P) : Quiver (ExitPathQuiver s) where
  Hom a b := {γ : Path a.pt b.pt // IsExitPath s γ}

/-- **Layer 3.2.** The relations of the exit-path category on the free category of the quiver of
exit paths: exit-homotopic paths are identified, a concatenation is the composite of its two
halves, and the constant path is the identity. -/
inductive ExitPathCategory.Rel (s : Stratification X P) : HomRel (Paths (ExitPathQuiver s))
  /-- Exit-homotopic exit paths are equal. -/
  | homotopic {a b : ExitPathQuiver s} (γ δ : a ⟶ b) (h : ExitHomotopic s γ.1 δ.1) :
      ExitPathCategory.Rel s ((Paths.of _).map γ) ((Paths.of _).map δ)
  /-- A concatenation of exit paths is the composite of the two paths. -/
  | trans {a b c : ExitPathQuiver s} (γ : a ⟶ b) (δ : b ⟶ c)
      (h : IsExitPath s (γ.1.trans δ.1)) :
      ExitPathCategory.Rel s ((Paths.of _).map (⟨γ.1.trans δ.1, h⟩ : a ⟶ c))
        ((Paths.of _).map γ ≫ (Paths.of _).map δ)
  /-- The constant path is the identity. -/
  | refl (a : ExitPathQuiver s) (h : IsExitPath s (Path.refl a.pt)) :
      ExitPathCategory.Rel s ((Paths.of _).map (⟨Path.refl a.pt, h⟩ : a ⟶ a))
        (𝟙 (show Paths (ExitPathQuiver s) from a))

/-- **Layer 3.2.** The exit-path category of a stratified space: objects the points, morphisms
exit paths modulo exit homotopy, composition by concatenation. -/
abbrev ExitPathCategory (s : Stratification X P) : Type u :=
  CategoryTheory.Quotient (ExitPathCategory.Rel s)

/-- **Layer 3.2.** The object of the exit-path category at a point. -/
def ExitPathCategory.mk (s : Stratification X P) (x : X) : ExitPathCategory s :=
  ⟨(⟨x⟩ : ExitPathQuiver s)⟩

/-- **Layer 3.3(a).** For a trivial stratification the exit-path category is the fundamental
groupoid. -/
theorem ExitPathCategory.nonempty_equivalence_fundamentalGroupoid [Subsingleton P]
    (s : Stratification X P) :
    Nonempty (ExitPathCategory s ≌ FundamentalGroupoid X) := by
  sorry

end ExitPaths

/-- **Layer 3.3(e).** In the exit-path category of an open cone with its cone stratification,
there is exactly one morphism from the apex to every object. -/
theorem OpenCone.nonempty_unique_hom_apex {L : Type u} [TopologicalSpace L] {P : Type v}
    [PartialOrder P] (p : P) (sL : Stratification L P) (hp : ∀ y, p < sL.toFun y)
    (y : ExitPathCategory (OpenCone.stratification p sL hp)) :
    Nonempty (Unique (ExitPathCategory.mk _ OpenCone.apex ⟶ y)) := by
  sorry

/-- **Layer 3.4.** The sphere `S² = ℂ ∪ {∞}` stratified by `{∞} < ℂ` over `Fin 2`. -/
def sphereStratification : Stratification (OnePoint ℂ) (Fin 2) where
  toFun z := OnePoint.elim z 0 fun _ => 1
  isOpen_preimage U hU := by
    by_cases h0 : (0 : Fin 2) ∈ U
    · have h1 : (1 : Fin 2) ∈ U := hU (by decide) h0
      convert isOpen_univ
      ext z
      induction z using OnePoint.rec <;> simp [h0, h1]
    · by_cases h1 : (1 : Fin 2) ∈ U
      · convert OnePoint.isOpen_range_coe (X := ℂ)
        ext z
        induction z using OnePoint.rec <;> simp [h0, h1]
      · convert isOpen_empty
        ext z
        induction z using OnePoint.rec <;> simp [h0, h1]

/-- **Layer 3.4.** The exit-path category of `S²` stratified by a point is equivalent to the poset
`Fin 2`, whose nerve is contractible: the exit-path category does not determine the homotopy type
of `S²` (Treumann, Example 1.4). -/
theorem nonempty_equivalence_sphere :
    Nonempty (ExitPathCategory sphereStratification ≌ Fin 2) := by
  sorry

/-! ## Layer 4: o-minimal structures, cells, dimension, triangulation -/

/-- **Layer 4.1.** A structure on a linearly ordered type `R` in the sense of van den Dries, with
o-minimality built in: definable sets of every arity form Boolean algebras closed under cylinders
on either side, containing the diagonals and the order, closed under the projection `Fin.tail`,
and the definable subsets of `R` are exactly the finite unions of points and open intervals. -/
structure OMinimalStructure (R : Type u) [LinearOrder R] where
  /-- The definable subsets of `Fin n → R`. -/
  Definable : (n : ℕ) → Set (Set (Fin n → R))
  /-- The empty set is definable. -/
  empty_mem : ∀ n, (∅ : Set (Fin n → R)) ∈ Definable n
  /-- Complements of definable sets are definable. -/
  compl_mem : ∀ n, ∀ A ∈ Definable n, Aᶜ ∈ Definable n
  /-- Unions of two definable sets are definable. -/
  union_mem : ∀ n, ∀ A ∈ Definable n, ∀ B ∈ Definable n, A ∪ B ∈ Definable n
  /-- Cylinders `R × A`, with the new coordinate `0`, are definable. -/
  tail_cylinder_mem : ∀ n, ∀ A ∈ Definable n,
    {x : Fin (n + 1) → R | Fin.tail x ∈ A} ∈ Definable (n + 1)
  /-- Cylinders `A × R`, with the new coordinate last, are definable. -/
  init_cylinder_mem : ∀ n, ∀ A ∈ Definable n,
    {x : Fin (n + 1) → R | Fin.init x ∈ A} ∈ Definable (n + 1)
  /-- The diagonals are definable. -/
  diagonal_mem : ∀ n (i j : Fin n), {x : Fin n → R | x i = x j} ∈ Definable n
  /-- The order is definable. -/
  lt_mem : {x : Fin 2 → R | x 0 < x 1} ∈ Definable 2
  /-- Images under the projection `Fin.tail` are definable. -/
  image_tail_mem : ∀ n, ∀ A ∈ Definable (n + 1),
    {y : Fin n → R | ∃ x ∈ A, Fin.tail x = y} ∈ Definable n
  /-- O-minimality: the definable subsets of `R` are the finite unions of points and open
  intervals. -/
  mem_one_iff : ∀ A : Set (Fin 1 → R), A ∈ Definable 1 ↔
    ∃ (F : Finset R) (J : Finset (WithBot R × WithTop R)),
      A = {x | x 0 ∈ (F : Set R) ∨
        ∃ ab ∈ J, ab.1 < ((x 0 : R) : WithBot R) ∧ ((x 0 : R) : WithTop R) < ab.2}

namespace OMinimalStructure

variable {R : Type u} [LinearOrder R]

/-- **Layer 4.1.** A function on `C ⊆ Fin n → R` is definable when its graph, with the value as
coordinate `0`, is definable. -/
def DefinableFunOn (S : OMinimalStructure R) {n : ℕ} (C : Set (Fin n → R))
    (f : (Fin n → R) → R) : Prop :=
  {y : Fin (n + 1) → R | Fin.tail y ∈ C ∧ y 0 = f (Fin.tail y)} ∈ S.Definable (n + 1)

/-- **Layer 4.1.** A map on `A ⊆ Fin m → R` is definable when its graph is definable. -/
def DefinableMapOn (S : OMinimalStructure R) {m n : ℕ} (A : Set (Fin m → R))
    (f : (Fin m → R) → (Fin n → R)) : Prop :=
  {z : Fin (m + n) → R | ∃ x ∈ A, z = Fin.append x (f x)} ∈ S.Definable (m + n)

variable [TopologicalSpace R] [OrderTopology R]

/-- **Layer 4.4.** Cells, built by graphs and bands over cells of one dimension lower; the new
coordinate is coordinate `0`. A band boundary is either infinite or a continuous definable
function. -/
inductive IsCell (S : OMinimalStructure R) : (n : ℕ) → Set (Fin n → R) → Prop
  /-- The point `Fin 0 → R` is a cell. -/
  | zero : IsCell S 0 univ
  /-- The graph of a continuous definable function on a cell is a cell. -/
  | graph {n : ℕ} {C : Set (Fin n → R)} (f : (Fin n → R) → R) :
      IsCell S n C → ContinuousOn f C → S.DefinableFunOn C f →
      IsCell S (n + 1) {y | Fin.tail y ∈ C ∧ y 0 = f (Fin.tail y)}
  /-- The band between two continuous definable functions, or infinite boundaries, on a cell is
  a cell. -/
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
/-- **Layer 4.4.** A cell decomposition of `Fin n → R` (van den Dries, Chapter 3, (2.10)): a
finite partition into cells whose projections form a cell decomposition one dimension lower. -/
def IsCellDecomposition (S : OMinimalStructure R) :
    (n : ℕ) → Finset (Set (Fin n → R)) → Prop
  | 0, 𝒞 => 𝒞 = {univ}
  | n + 1, 𝒞 => (∀ C ∈ 𝒞, S.IsCell (n + 1) C) ∧
      Setoid.IsPartition (↑𝒞 : Set (Set (Fin (n + 1) → R))) ∧
      IsCellDecomposition S n (𝒞.image fun C => {x : Fin n → R | ∃ y ∈ C, Fin.tail y = x})

/-- **Layer 4.4.** The cell decomposition theorem, part (I) (van den Dries, Chapter 3, (2.11)),
for an o-minimal structure on a nonempty dense linear order without endpoints. -/
theorem exists_isCellDecomposition [Nonempty R] [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R]
    (S : OMinimalStructure R) {n : ℕ} (𝒜 : Finset (Set (Fin n → R)))
    (h𝒜 : ∀ A ∈ 𝒜, A ∈ S.Definable n) :
    ∃ 𝒞 : Finset (Set (Fin n → R)), S.IsCellDecomposition n 𝒞 ∧
      ∀ A ∈ 𝒜, ∀ C ∈ 𝒞, C ⊆ A ∨ Disjoint C A := by
  sorry

end OMinimalStructure

/-- **Layer 4.7.** The open simplex spanned by a finite set of points: strictly positive
barycentric combinations. -/
def openSimplex {R : Type u} [Field R] [LinearOrder R] {n : ℕ} (τ : Finset (Fin n → R)) :
    Set (Fin n → R) :=
  {x | ∃ w : (Fin n → R) → R, (∀ v ∈ τ, 0 < w v) ∧ ∑ v ∈ τ, w v = 1 ∧
    ∑ v ∈ τ, w v • v = x}

/-- **Layer 4.7.** The triangulation theorem (van den Dries, Chapter 8, (2.9)) for an o-minimal
expansion of an ordered field: a definable set is definably homeomorphic to a union of open
simplices of a finite complex, compatibly with finitely many definable subsets. -/
theorem OMinimalStructure.exists_triangulation {R : Type u} [Field R] [LinearOrder R]
    [IsStrictOrderedRing R] [TopologicalSpace R] [OrderTopology R] (S : OMinimalStructure R)
    (hadd : {x : Fin 3 → R | x 0 = x 1 + x 2} ∈ S.Definable 3)
    (hmul : {x : Fin 3 → R | x 0 = x 1 * x 2} ∈ S.Definable 3)
    {n : ℕ} (A : Set (Fin n → R)) (hA : A ∈ S.Definable n)
    (ℬ : Finset (Set (Fin n → R))) (hℬ : ∀ B ∈ ℬ, B ∈ S.Definable n ∧ B ⊆ A) :
    ∃ (K : Geometry.SimplicialComplex R (Fin n → R)) (T : Set (Finset (Fin n → R)))
      (Φ : (Fin n → R) → (Fin n → R)),
      K.faces.Finite ∧ T ⊆ K.faces ∧ S.DefinableMapOn A Φ ∧ ContinuousOn Φ A ∧ InjOn Φ A ∧
      Φ '' A = ⋃ τ ∈ T, openSimplex τ ∧ ContinuousOn (Function.invFunOn Φ A) (Φ '' A) ∧
      ∀ B ∈ ℬ, ∃ T' ⊆ T, Φ '' B = ⋃ τ ∈ T', openSimplex τ := by
  sorry

/-! ## Layers 4.2 and 4.9: the semialgebraic structure and the specialization -/

/-- **Layer 4.2.** Semialgebraic sets form an o-minimal structure on `ℝ`: there is one whose
definable sets are exactly the `TauCeti.IsSemialgebraic` sets. Closure under `Fin.tail` is Tau
Ceti's `TauCeti.IsSemialgebraic.image_tail` (Tarski–Seidenberg); the one-variable axiom comes from
the sign descriptions of semialgebraic sets and the finiteness of real roots. -/
theorem exists_oMinimalStructure_eq_isSemialgebraic :
    ∃ S : OMinimalStructure ℝ, ∀ n, S.Definable n = {A | TauCeti.IsSemialgebraic A} := by
  sorry

/-- **Layer 4.9(b).** The semialgebraic triangulation theorem, the specialization of
`OMinimalStructure.exists_triangulation` to the structure of 4.2: a semialgebraic set is
semialgebraically homeomorphic to a union of open simplices of a finite complex, compatibly with
finitely many semialgebraic subsets. -/
theorem exists_triangulation_semialgebraic {n : ℕ} (A : Set (Fin n → ℝ))
    (hA : TauCeti.IsSemialgebraic A) (ℬ : Finset (Set (Fin n → ℝ)))
    (hℬ : ∀ B ∈ ℬ, TauCeti.IsSemialgebraic B ∧ B ⊆ A) :
    ∃ (K : Geometry.SimplicialComplex ℝ (Fin n → ℝ)) (T : Set (Finset (Fin n → ℝ)))
      (Φ : (Fin n → ℝ) → (Fin n → ℝ)),
      K.faces.Finite ∧ T ⊆ K.faces ∧ TauCeti.IsSemialgebraicOn Φ A ∧
      ContinuousOn Φ A ∧ InjOn Φ A ∧ Φ '' A = ⋃ τ ∈ T, openSimplex τ ∧
      ContinuousOn (Function.invFunOn Φ A) (Φ '' A) ∧
      ∀ B ∈ ℬ, ∃ T' ⊆ T, Φ '' B = ⋃ τ ∈ T', openSimplex τ := by
  sorry

end TauCetiRoadmap.StratifiedSpacesAndTameTopology
