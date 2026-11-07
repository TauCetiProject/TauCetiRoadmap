import Mathlib
import TauCeti.RepresentationTheory.Quiver.AdmissibleIdeal.Basic
import TauCeti.RepresentationTheory.Quiver.Representation.HomDifferential
import TauCeti.RepresentationTheory.Quiver.Representation.VertexSimpleModule
import TauCeti.RepresentationTheory.Quiver.Representation.AsModule
import TauCeti.RingTheory.Semisimple.BasicAlgebra
import TauCeti.Algebra.Module.AuslanderReiten.Translate
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.FactorThrough
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Additive

/-!
# Quiver representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the remaining headline
theorems against the pinned APIs: the Ext-quiver identification in admissible presentations,
heredity of every finite path algebra and the comparison of the Hom differential with native Ext,
the rational root-system bridge, and the stable translate equivalence.

Path algebras and their module equivalence, Krull–Schmidt, projective covers, injective envelopes
and minimal injective copresentations, Morita reduction to a basic corner, the bound-quiver
surjection with admissible kernel, the Ext-Euler characteristic as the Euler form of dimension
vectors with its inverse-Cartan form, BGP reflection and Coxeter survival, the
finite-dimensional Gabriel correspondence, the module-level Auslander–Reiten translate,
Auslander–Reiten duality, almost-split existence with the translate as left end, and the quiver
of irreducible morphisms with its k-dimensional mesh relation are supplied by Tau Ceti; the README
specifies the exact declarations. The Euler–Hom–Ext identity is a corollary of the pinned
Hom-minus-cokernel identity and the Ext comparison stated here, so it is not stated separately.
None is restated as an admitted theorem.

The translate used here is the native dual transpose of an explicit minimal presentation. The
companion duality formula and the valued mesh of README Layer 6 are specified there in prose.
-/

namespace TauCetiRoadmap.QuiverRepresentations

open CategoryTheory CategoryTheory.Limits CategoryTheory.Abelian
open scoped ModuleCat

universe u

/-! ## Layer 3: finite-dimensional algebras and admissible presentations -/

/-- A basic finite-dimensional algebra over an algebraically closed field has a finite bound-quiver
presentation. Its vertex simples exhaust the simple modules without repetition, their pullbacks
are the native vertex simples, and arrow multiplicities equal the indicated Ext dimensions.
The kernel is admissible with respect to the arrow ideal, not the path algebra's Jacobson radical.
The surjection with admissible kernel alone is
`TauCeti.IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker`; the new content is the
identification of the simples and of the arrow counts.
Assem–Simson–Skowroński, II.2.1, II.3.7 and III.2.12, transposed to left modules. -/
theorem exists_admissible_presentation (k A : Type u) [Field k] [IsAlgClosed k] [Ring A]
    [Algebra k A] [FiniteDimensional k A] (hA : TauCeti.IsBasic A) :
    ∃ (Q : Type u) (_ : Quiver Q) (_ : Fintype Q) (_ : ∀ i j : Q, Fintype (i ⟶ j))
      (f : TauCeti.pathAlgebra k Q →ₐ[k] A) (S : Q → ModuleCat.{u} A),
      Function.Surjective f ∧ TauCeti.IsAdmissibleIdeal (RingHom.ker f) ∧
      (∀ i, Simple (S i)) ∧
      (∀ X : ModuleCat.{u} A, Simple X → ∃! i, Nonempty (S i ≅ X)) ∧
      (∀ i, Nonempty ((ModuleCat.restrictScalars f.toRingHom).obj (S i) ≅
        TauCeti.vertexSimpleModule k Q i)) ∧
      (∀ i j, Fintype.card (i ⟶ j) = Module.finrank k (Ext (S i) (S j) 1)) := sorry

/-! ## Layer 4: heredity and the Ext comparison -/

/-- The path algebra of a finite quiver is hereditary: all module Ext groups in degrees at least
two vanish, including for modules that are not finite-dimensional and for quivers with oriented
cycles. -/
theorem pathAlgebra_higher_ext_vanish (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)]
    (M N : ModuleCat.{u} (TauCeti.pathAlgebra k Q)) (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (Ext M N n) := sorry

/-- The cokernel of the vertex-to-arrow Hom differential computes native module-category Ext¹,
for every finite quiver. This is an equivalence of vector spaces, not just an equality of
dimensions. -/
theorem homDifferential_coker_equiv_ext (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)]
    (M N : TauCeti.QuiverRep.{u, u, u, u} k Q) :
    Nonempty ((TauCeti.QuiverRep.HomArrow M N ⧸
      LinearMap.range (TauCeti.QuiverRep.homDifferential M N)) ≃ₗ[k]
      Ext ((TauCeti.quiverRepEquivalence k Q).functor.obj M)
        ((TauCeti.quiverRepEquivalence k Q).functor.obj N) 1) := sorry

/-! ## Layer 5: the root-system bridge -/

/-- A nonempty connected quiver with positive-definite Tits form determines a reduced,
crystallographic, irreducible rational root system whose roots are the integral vectors of
Tits value one. The base is marked by the standard vertex vectors. -/
theorem exists_rootPairing_titsForm {Q : Type} [Quiver Q] [Fintype Q] [Nonempty Q]
    [∀ a b : Q, Fintype (a ⟶ b)] [DecidableEq Q]
    (hconn : Subsingleton (Quiver.WeaklyConnectedComponent Q))
    (hADE : (TauCeti.titsForm Q).PosDef) :
    ∃ (ι : Type) (P : RootPairing ι ℚ (Q → ℚ) (Q → ℚ)) (b : P.Base)
      (_ : P.IsRootSystem) (_ : P.IsCrystallographic) (_ : P.IsReduced) (_ : P.IsIrreducible)
      (e : Q ≃ b.support),
      (∀ i : Q, P.root (e i) = Pi.single i 1) ∧
      (∀ i j : Q, b.cartanMatrix (e i) (e j)
          = (if i = j then (2 : ℤ) else 0)
            - (Fintype.card (i ⟶ j) + Fintype.card (j ⟶ i))) ∧
      ∀ d : Q → ℤ, (∃ r : ι, P.root r = fun v => (d v : ℚ)) ↔
        (d ≠ 0 ∧ TauCeti.titsForm Q d = 1) := sorry

/-! ## Layer 6: stable categories and the translate equivalence -/

/-- The ideal generated by morphisms factoring through projective finitely generated modules. -/
def projectiveFactorIdeal (A : Type u) [Ring A] : TauCeti.MorphismIdeal (FGModuleCat.{u} A) :=
  CategoryTheory.ObjectProperty.factorIdeal
    (fun M => Projective M : ObjectProperty (FGModuleCat.{u} A))

/-- The ideal generated by morphisms factoring through injective finitely generated modules. -/
def injectiveFactorIdeal (A : Type u) [Ring A] : TauCeti.MorphismIdeal (FGModuleCat.{u} A) :=
  CategoryTheory.ObjectProperty.factorIdeal
    (fun M => Injective M : ObjectProperty (FGModuleCat.{u} A))

/-- The dual transpose induces an equivalence from the projective stable category to the
injective stable category. Its value on every module is represented by the dual transpose of
each finite minimal projective presentation of that module. -/
theorem exists_stable_translate_equivalence (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] :
    ∃ E : (projectiveFactorIdeal A).Quotient ≌ (injectiveFactorIdeal A).Quotient,
      ∀ (M : FGModuleCat.{u} A) (P₀ P₁ : ModuleCat.{u} A)
        [Module.Finite A P₀] [Module.Finite A P₁]
        (p : P₁ ⟶ P₀) (π : P₀ ⟶ M.obj),
        TauCeti.IsMinimalProjectivePresentation p.hom π.hom →
        ∃ T : FGModuleCat.{u} A,
          Nonempty (T.obj ≅ ModuleCat.of A (TauCeti.AuslanderReitenTranslate k p.hom)) ∧
          Nonempty (E.functor.obj ((projectiveFactorIdeal A).quotientFunctor.obj M) ≅
            (injectiveFactorIdeal A).quotientFunctor.obj T) := sorry

end TauCetiRoadmap.QuiverRepresentations
