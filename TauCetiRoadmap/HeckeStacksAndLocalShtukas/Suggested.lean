import Mathlib

/-!
# Hecke stacks and local shtukas: representative target signatures

These are suggested Lean forms, not an exhaustive checklist. `README.md` is the definitive
specification. This file records the component-action milestones of HS2.16 and the monoidal
creation/annihilation identities of HS4.2 on pinned Mathlib carriers. Global Hecke stacks,
local shtuka spaces and their enhanced cohomology are targets in the README.
-/

open CategoryTheory MonoidalCategory

namespace TauCeti.HeckeShtukas

/-! ## HS2.16: components of continuous group actions -/

/-- A continuous profinite action with connected orbit space is transitive on connected components. -/
theorem componentTransitivity_profinite (K : Type*) [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K] [TotallyDisconnectedSpace K] (A : Type*)
    [TopologicalSpace A] [MulAction K A] [ContinuousSMul K A]
    (h : ConnectedSpace (MulAction.orbitRel.Quotient K A)) (a a' : A) :
    ∃ k : K, connectedComponent (k • a) = connectedComponent a' := sorry

/-- Components of an orbit space for a continuous profinite action are the orbits of components. -/
theorem componentTransitivity_quotient (K : Type*) [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K] [TotallyDisconnectedSpace K] (A : Type*)
    [TopologicalSpace A] [MulAction K A] [ContinuousSMul K A] (a a' : A) :
    connectedComponent (Quotient.mk'' a : MulAction.orbitRel.Quotient K A) =
        connectedComponent (Quotient.mk'' a' : MulAction.orbitRel.Quotient K A) ↔
      ∃ k : K, connectedComponent (k • a) = connectedComponent a' := sorry

/-- A compact open subgroup with open finite-level components gives transitivity for a connected orbit space. -/
theorem componentTransitivity_locallyProfinite (H : Type*) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [T2Space H] [TotallyDisconnectedSpace H] (K : OpenSubgroup H)
    (hK : IsCompact (K : Set H)) (A : Type*) [TopologicalSpace A] [MulAction H A]
    [ContinuousSMul H A]
    (hopen : ∀ x : MulAction.orbitRel.Quotient K.toSubgroup A, IsOpen (connectedComponent x))
    (h : ConnectedSpace (MulAction.orbitRel.Quotient H A)) (a a' : A) :
    ∃ h : H, connectedComponent (h • a) = connectedComponent a' := sorry

/-- Translation of the p-adic integers by the integers has connected orbit space and is not transitive on components. -/
theorem componentTransitivity_counterexample (p : ℕ) [Fact p.Prime] :
    letI : AddAction ℤ ℤ_[p] := AddAction.compHom ℤ_[p] (Int.castAddHom ℤ_[p])
    ConnectedSpace (AddAction.orbitRel.Quotient ℤ ℤ_[p]) ∧
      ¬ ∀ a a' : ℤ_[p], ∃ n : ℤ, connectedComponent (n +ᵥ a) = connectedComponent a' := sorry

/-! ## HS4.2: monoidal creation and annihilation -/

open Functor.LaxMonoidal Functor.OplaxMonoidal

variable {C E : Type*} [Category C] [Category E] [MonoidalCategory C] [MonoidalCategory E]
  (T : C ⥤ E) [T.Monoidal] (V W : C) [ExactPairing V W]

/-- Creation is the image of coevaluation under a monoidal functor, with its unit and tensor constraints. -/
def monoidalCoev : 𝟙_ E ⟶ T.obj V ⊗ T.obj W := ε T ≫ T.map (η_ V W) ≫ δ T V W

/-- Annihilation is the image of evaluation under a monoidal functor, with its tensor and unit constraints. -/
def monoidalEval : T.obj W ⊗ T.obj V ⟶ 𝟙_ E := μ T W V ≫ T.map (ε_ V W) ≫ η T

/-- Creation and annihilation satisfy the triangle identity on the first paired object. -/
theorem monoidalCoev_eval_left : monoidalCoev T V W ▷ T.obj V ≫
    (α_ (T.obj V) (T.obj W) (T.obj V)).hom ≫ T.obj V ◁ monoidalEval T V W =
    (λ_ (T.obj V)).hom ≫ (ρ_ (T.obj V)).inv := sorry

/-- Creation and annihilation satisfy the triangle identity on the second paired object. -/
theorem monoidalCoev_eval_right : T.obj W ◁ monoidalCoev T V W ≫
    (α_ (T.obj W) (T.obj V) (T.obj W)).inv ≫ monoidalEval T V W ▷ T.obj W =
    (ρ_ (T.obj W)).hom ≫ (λ_ (T.obj W)).inv := sorry

/-- Creation for the unit pairing is the inverse right unitor transported by the monoidal unit map. -/
theorem monoidalCoev_unit :
    monoidalCoev T (𝟙_ C) (𝟙_ C) = (ρ_ (𝟙_ E)).inv ≫ (ε T ⊗ₘ ε T) := sorry

/-- Annihilation for the unit pairing is the right unitor transported by the monoidal counit map. -/
theorem monoidalEval_unit :
    monoidalEval T (𝟙_ C) (𝟙_ C) = (η T ⊗ₘ η T) ≫ (ρ_ (𝟙_ E)).hom := sorry

/-- The identity functor retains the coevaluation, including its direction. -/
example : monoidalCoev (𝟭 C) V W = η_ V W := by
  simp [monoidalCoev]

/-- The identity functor retains the evaluation, including the reversed pair. -/
example : monoidalEval (𝟭 C) V W = ε_ V W := by
  simp [monoidalEval]

end TauCeti.HeckeShtukas
