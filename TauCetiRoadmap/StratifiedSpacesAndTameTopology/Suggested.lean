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
* 4.3, `exists_triangulation_semialgebraic`.

Not statable at the pins, with the carrier each lacks (a roadmap's module cannot import another
roadmap's, and neither pin declares these carriers):

* 4.1, the triangulation theorem for an o-minimal expansion of an ordered field: it lacks
  ShimuraVarieties §3.4b's `TauCetiRoadmap.ShimuraVarieties.OMinimalStructure`.
* 6.3–6.4, unfolding of a Thom–Mather space and reconstruction: they lack AlgebraicTopologyPartII
  §§16.1a–16.1b's `TauCetiRoadmap.AlgebraicTopologyPartII.IsSmoothStratification` and
  `TauCetiRoadmap.AlgebraicTopologyPartII.ControlData`, and DifferentialGeometry 5.5's abstract
  boundary of a manifold with corners, on which the face structure of 5.1 is built.
* 7.2, Whitney stratification of definable sets, and 7.3, Nash strata: they lack
  AlgebraicTopologyPartII §16.1a's `TauCetiRoadmap.AlgebraicTopologyPartII.IsWhitneyStratification`
  and ShimuraVarieties §3.4b's o-minimal structures.
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
quotient topology of `L × [0, ∞)` with `L × {0}` collapsed; for `L = ℕ` it is strictly coarser
than that quotient topology. -/
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

/-! ## Layer 4: triangulation and conical structure of definable sets -/

/-- **Layer 4.3.** The semialgebraic triangulation theorem, the specialization of the o-minimal
triangulation theorem 4.1 to the semialgebraic structure on `ℝ`: a semialgebraic set is
semialgebraically homeomorphic to a union of open simplices of a finite complex, compatibly with
finitely many semialgebraic subsets. -/
theorem exists_triangulation_semialgebraic {n : ℕ} (A : Set (Fin n → ℝ))
    (hA : TauCeti.IsSemialgebraic A) (ℬ : Finset (Set (Fin n → ℝ)))
    (hℬ : ∀ B ∈ ℬ, TauCeti.IsSemialgebraic B ∧ B ⊆ A) :
    ∃ (K : Geometry.SimplicialComplex ℝ (Fin n → ℝ)) (T : Set (Finset (Fin n → ℝ)))
      (Φ : (Fin n → ℝ) → (Fin n → ℝ)),
      K.faces.Finite ∧ T ⊆ K.faces ∧ TauCeti.IsSemialgebraicOn Φ A ∧
      ContinuousOn Φ A ∧ InjOn Φ A ∧
      Φ '' A = ⋃ τ ∈ T, intrinsicInterior ℝ (convexHull ℝ (τ : Set (Fin n → ℝ))) ∧
      ContinuousOn (Function.invFunOn Φ A) (Φ '' A) ∧
      ∀ B ∈ ℬ, ∃ T' ⊆ T,
        Φ '' B = ⋃ τ ∈ T', intrinsicInterior ℝ (convexHull ℝ (τ : Set (Fin n → ℝ))) := by
  sorry

end TauCetiRoadmap.StratifiedSpacesAndTameTopology
