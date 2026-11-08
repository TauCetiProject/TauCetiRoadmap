module

import Mathlib
import TauCeti.RepresentationTheory.Quiver.AdmissibleIdeal.Basic
import TauCeti.RepresentationTheory.Quiver.Representation.HomDifferential
import TauCeti.RepresentationTheory.Quiver.Representation.VertexSimpleModule
import TauCeti.RepresentationTheory.Quiver.Representation.AsModule
import TauCeti.RingTheory.Semisimple.BasicAlgebra

/-!
# Quiver representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the remaining headline
theorems against the pinned APIs: the Ext-quiver identification in admissible presentations,
heredity of every finite path algebra and the comparison of the Hom differential with native Ext,
and the rational root-system bridge.

Path algebras and their module equivalence, Krull–Schmidt, projective covers, injective envelopes
and minimal injective copresentations, Morita reduction to a basic corner, the bound-quiver
surjection with admissible kernel, the Ext-Euler characteristic as the Euler form of dimension
vectors with its inverse-Cartan form, the standard bimodule resolution of a path algebra, the
Hom-cocycle computation of Ext¹, the classification of quiver extensions with fixed end terms by
arrow families modulo the Hom differential, Baer-sum additivity of extension classes, BGP
reflection and Coxeter survival, the finite-dimensional Gabriel correspondence, the module-level
Auslander–Reiten translate, Auslander–Reiten duality, almost-split existence with the translate
as left end, and the quiver of irreducible morphisms with its k-dimensional mesh relation are
supplied by Tau Ceti; the README specifies the exact
declarations. The Euler–Hom–Ext identity is a corollary of the pinned Hom-minus-cokernel identity
and the Ext comparison stated here, so it is not stated separately. None is restated as an
admitted theorem.

The stable translate equivalence between the projective and injective stable categories, the
companion Auslander–Reiten formula and the valued mesh are owned by the ArtinAlgebras roadmap
for Artin algebras, of which the field case is the case `R = k`; they are not stated here.
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
cycles. The route is the pinned standard bimodule resolution tensored with the module.
Crawley-Boevey, *Lectures on Representations of Quivers*, §1, the standard resolution, p.7, and
its consequence (1), p.8; Assem–Simson–Skowroński VII.1.7(a) is the finite connected acyclic
case. -/
theorem pathAlgebra_higher_ext_vanish (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)]
    (M N : ModuleCat.{u} (TauCeti.pathAlgebra k Q)) (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (Ext M N n) := sorry

/-- The cokernel of the vertex-to-arrow Hom differential computes native module-category Ext¹,
for every finite quiver. This is an equivalence of vector spaces, not just an equality of
dimensions; the README names the canonical map, the pinned Hom-cocycle equivalence composed with
the identification of the tensored bimodule resolution. Crawley-Boevey, *Lectures on
Representations of Quivers*, §1, the exact sequence in the proof of consequence (3), p.8. -/
theorem nonempty_homDifferential_coker_linearEquiv_ext (k Q : Type u) [Field k] [Quiver Q]
    [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)]
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

end TauCetiRoadmap.QuiverRepresentations
