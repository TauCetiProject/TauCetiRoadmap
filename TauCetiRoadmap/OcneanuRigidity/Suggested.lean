import Mathlib
import TauCeti.CategoryTheory.Semisimple.GrothendieckRing

/-!
# Ocneanu rigidity: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The headlines are cohomological vanishing (4.1), formal rigidity (5.5–5.7 and 6.6),
finiteness (8.1–8.5), and fields of definition (8.6), with their characteristic-zero
forms (9.1). The finiteness statements below use native families of categories; no
symbol presentations are needed to state them.

The other headlines are not statable at the pins:
* Vanishing needs the relative centre and Davydov–Yetter cochain complex (Layers 1–3).
* Formal rigidity needs the F- and R-symbol presentations and their models supplied by
  PresentationsOfMonoidalCategories, and the module-symbol presentations of Layer 6.
* Fields of definition need those models and their scalar-extension constructions.
* The arbitrary-characteristic forms need the squared-norm global dimension of
  PivotalSpherical 6.2. The statements below instead give exactly the characteristic-zero
  forms of 9.1, where separability follows from PivotalSpherical 6.9.
-/

namespace TauCetiRoadmap.OcneanuRigidity

open CategoryTheory MonoidalCategory TauCeti

universe w v u v' u' t z

/-! ## Layer 8: finiteness theorems -/

/-- A family of fusion categories over an algebraically closed field of characteristic zero,
with common fusion coefficients under specified bijections of simple classes, has finitely
many representatives up to linear monoidal equivalence (8.1 and 9.1; ENO Theorem 2.28). -/
theorem finite_fusion_representatives
    (k : Type w) [Field k] [IsAlgClosed k] [CharZero k]
    (I : Type t) (C : I → Type u) [∀ i, Category.{v} (C i)]
    [∀ i, MonoidalCategory (C i)] [∀ i, RigidCategory (C i)]
    [∀ i, Abelian (C i)] [∀ i, MonoidalPreadditive (C i)]
    [∀ i, Linear k (C i)] [∀ i, MonoidalLinear k (C i)]
    [∀ i, IsFiniteSemisimpleCategory (C i)]
    [∀ i, ∀ X Y : C i, FiniteDimensional k (X ⟶ Y)]
    [∀ i, Simple (𝟙_ (C i))] [∀ i, Fintype (SimpleClasses (C i))]
    (ι : Type z) [Fintype ι] (N : ι → ι → ι → ℕ)
    (e : ∀ i, SimpleClasses (C i) ≃ ι)
    (hN : ∀ i S T U, fusionCoeff k S T U = N (e i S) (e i T) (e i U)) :
    ∃ s : Finset I, ∀ i, ∃ j ∈ s, ∃ E : C i ≌ C j,
      Nonempty E.functor.Monoidal ∧ E.functor.Linear k := sorry

/-- A fusion category in characteristic zero has finitely many braidings (8.2 and 9.1;
ENO Remark 2.33). -/
theorem finite_braidedCategory
    (k : Type w) [Field k] [IsAlgClosed k] [CharZero k]
    (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [Abelian C] [MonoidalPreadditive C] [Linear k C] [MonoidalLinear k C]
    [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    [Simple (𝟙_ C)] [Fintype (SimpleClasses C)] :
    Finite (BraidedCategory C) := sorry

/-- A family of braided fusion categories in characteristic zero with common fusion coefficients
has finitely many representatives up to linear braided monoidal equivalence (8.3 and 9.1). -/
theorem finite_braided_fusion_representatives
    (k : Type w) [Field k] [IsAlgClosed k] [CharZero k]
    (I : Type t) (C : I → Type u) [∀ i, Category.{v} (C i)]
    [∀ i, MonoidalCategory (C i)] [∀ i, RigidCategory (C i)]
    [∀ i, Abelian (C i)] [∀ i, MonoidalPreadditive (C i)]
    [∀ i, Linear k (C i)] [∀ i, MonoidalLinear k (C i)]
    [∀ i, IsFiniteSemisimpleCategory (C i)]
    [∀ i, ∀ X Y : C i, FiniteDimensional k (X ⟶ Y)]
    [∀ i, Simple (𝟙_ (C i))] [∀ i, Fintype (SimpleClasses (C i))]
    [∀ i, BraidedCategory (C i)]
    (ι : Type z) [Fintype ι] (N : ι → ι → ι → ℕ)
    (e : ∀ i, SimpleClasses (C i) ≃ ι)
    (hN : ∀ i S T U, fusionCoeff k S T U = N (e i S) (e i T) (e i U)) :
    ∃ s : Finset I, ∀ i, ∃ j ∈ s, ∃ E : C i ≌ C j,
      Nonempty E.functor.Braided ∧ E.functor.Linear k := sorry

/-- For a fixed fusion category in characteristic zero, a family of finite semisimple linear
module categories of fixed rank has finitely many representatives up to linear module
equivalence (8.4 and 9.1; ENO Corollary 2.35). -/
theorem finite_module_representatives
    (k : Type w) [Field k] [IsAlgClosed k] [CharZero k]
    (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [Abelian C] [MonoidalPreadditive C] [Linear k C] [MonoidalLinear k C]
    [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    [Simple (𝟙_ C)] [Fintype (SimpleClasses C)]
    (I : Type t) (M : I → Type u') [∀ i, Category.{v'} (M i)]
    [∀ i, Abelian (M i)] [∀ i, Linear k (M i)]
    [∀ i, IsFiniteSemisimpleCategory (M i)]
    [∀ i, ∀ X Y : M i, FiniteDimensional k (X ⟶ Y)]
    [∀ i, Fintype (SimpleClasses (M i))] [∀ i, MonoidalLeftAction C (M i)]
    [∀ i (X : C), (MonoidalLeftAction.actionLeft (M i) X).Linear k]
    [∀ i Y, (MonoidalLeftAction.actionRight C (Y : M i)).Linear k]
    (r : ℕ) (hr : ∀ i, Fintype.card (SimpleClasses (M i)) = r) :
    ∃ s : Finset I, ∀ i, ∃ j ∈ s, ∃ E : M i ≌ M j,
      Nonempty (E.functor.LeftLinear C) ∧ E.functor.Linear k := sorry

/-- For a fixed fusion category in characteristic zero, a family of indecomposable finite
semisimple linear module categories has finitely many representatives (8.5 and 9.1;
EGNO Corollary 9.1.6(ii)). Indecomposability is expressed by nonemptiness of the simple
classes and the action connecting every pair of simples, as in 6.8. -/
theorem finite_indecomposable_module_representatives
    (k : Type w) [Field k] [IsAlgClosed k] [CharZero k]
    (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [Abelian C] [MonoidalPreadditive C] [Linear k C] [MonoidalLinear k C]
    [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    [Simple (𝟙_ C)] [Fintype (SimpleClasses C)]
    (I : Type t) (M : I → Type u') [∀ i, Category.{v'} (M i)]
    [∀ i, Abelian (M i)] [∀ i, Linear k (M i)]
    [∀ i, IsFiniteSemisimpleCategory (M i)]
    [∀ i, ∀ X Y : M i, FiniteDimensional k (X ⟶ Y)]
    [∀ i, Fintype (SimpleClasses (M i))] [∀ i, MonoidalLeftAction C (M i)]
    [∀ i (X : C), (MonoidalLeftAction.actionLeft (M i) X).Linear k]
    [∀ i Y, (MonoidalLeftAction.actionRight C (Y : M i)).Linear k]
    [∀ i, Nonempty (SimpleClasses (M i))]
    (hconn : ∀ i (S T : SimpleClasses (M i)), ∃ X : C,
      Nontrivial (MonoidalLeftAction.actionObj X S.repr ⟶ T.repr)) :
    ∃ s : Finset I, ∀ i, ∃ j ∈ s, ∃ E : M i ≌ M j,
      Nonempty (E.functor.LeftLinear C) ∧ E.functor.Linear k := sorry

end TauCetiRoadmap.OcneanuRigidity
