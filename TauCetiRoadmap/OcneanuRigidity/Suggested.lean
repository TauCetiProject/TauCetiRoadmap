import Mathlib
import TauCeti.CategoryTheory.Semisimple.Basic
import TauCeti.CategoryTheory.Simple.Classes

/-!
# Ocneanu rigidity: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Everything below is stated against the pinned carriers (`CategoryTheory.BraidedCategory`,
`TauCeti.IsFiniteSemisimpleCategory`, `TauCeti.SimpleClasses`, Mathlib's `HalfBraiding`).

Not stated here, because the carrier is a construction that does not exist at the pin:

* Layers 1 to 4: `RelCenter F`, its induction and coinduction functors, the central comonad, the
  augmented comonad resolution, `Comonad.cochainComplex` and `DYComplex`, about which the
  vanishing theorem 4.1 is stated.
* Layers 5, 6 and 8: `FSymbols`, `RSymbols`, `Model P` (PresentationsOfMonoidalCategories) and
  `ModuleSymbols`, about which formal rigidity and the finiteness of fusion and module categories
  are stated.
* Layer 7: the coordinate rings of the symbol functors and the gauge group schemes.
* The separability hypothesis `normGlobalDim C ≠ 0`, whose carrier is PivotalSpherical 6.2; the
  braiding statement below is therefore given in characteristic zero, where 9.1 removes it.
-/

namespace TauCetiRoadmap.OcneanuRigidity

open CategoryTheory MonoidalCategory TauCeti

universe w v u

/-! ## Layer 1: half-braidings relative to a functor -/

section RelativeHalfBraiding

variable {C : Type u} [Category.{v} C] [MonoidalCategory C]
  {D : Type u} [Category.{v} D] [MonoidalCategory D]

/-- **A half-braiding relative to a monoidal functor** `F : C ⥤ D` on `X : D` (Layer 1.1;
Gainutdinov–Haferkamp–Schweigert, Definition 3.1): a natural family
`X ⊗ F.obj Y ≅ F.obj Y ⊗ X`, in the direction of Mathlib's `HalfBraiding`. The compatibility
with `F`'s tensorator and unit is part of the target structure and is omitted here. -/
structure RelHalfBraidingData (F : C ⥤ D) (X : D) where
  /-- The components of the half-braiding. -/
  β : ∀ Y : C, X ⊗ F.obj Y ≅ F.obj Y ⊗ X
  /-- Naturality in `Y`. -/
  naturality : ∀ {Y Y' : C} (f : Y ⟶ Y'),
    X ◁ F.map f ≫ (β Y').hom = (β Y).hom ≫ F.map f ▷ X

end RelativeHalfBraiding

/-! ## Layers 8 and 9: finitely many braidings -/

section Braidings

variable (k : Type w) [Field k] [IsAlgClosed k] [CharZero k] (C : Type u) [Category.{v} C]
  [MonoidalCategory C] [RigidCategory C] [Abelian C] [MonoidalPreadditive C] [Linear k C]
  [MonoidalLinear k C] [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
  [Simple (𝟙_ C)] [Fintype (SimpleClasses C)]

include k in
/-- **A fusion category has finitely many braidings** (Layer 8.2, in the characteristic-zero form
of 9.1; Etingof–Nikshych–Ostrik, *On fusion categories*, Remark 2.33). -/
theorem finite_braidedCategory : Finite (BraidedCategory C) := sorry

end Braidings

end TauCetiRoadmap.OcneanuRigidity
