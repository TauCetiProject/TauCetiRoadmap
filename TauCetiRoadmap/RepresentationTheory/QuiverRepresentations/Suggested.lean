import Mathlib
import TauCeti.RepresentationTheory.Quiver.AdmissibleIdeal.Basic
import TauCeti.RepresentationTheory.Quiver.Representation.HomDifferential
import TauCeti.RepresentationTheory.Quiver.Representation.VertexSimpleModule
import TauCeti.RepresentationTheory.Quiver.Representation.FiniteDimensional
import TauCeti.RingTheory.Semisimple.BasicAlgebra
import TauCeti.Algebra.Module.AuslanderReiten.Translate
import TauCeti.CategoryTheory.AlmostSplit.Uniqueness
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.FactorThrough
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Additive
import TauCeti.CategoryTheory.Preadditive.Radical.Quotient

/-!
# Quiver representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the remaining headline
theorems against the pinned APIs: injective envelopes, basic Morita reduction, admissible presentations with the
Ext-quiver identification, heredity and the comparison with native Ext, the rational root-system
bridge, stable translate equivalence, Auslander–Reiten duality, almost-split existence and identification of its left end,
and the mesh multiplicity identity.

Path algebras and their module equivalence, Krull–Schmidt, projective covers, BGP reflection
and Coxeter survival, and the finite-dimensional Gabriel correspondence are supplied by Tau Ceti;
the README specifies the exact declarations. Almost-split uniqueness extending a specified
endpoint isomorphism is also supplied, by ShortComplex.IsAlmostSplit.exists_iso_τ₃_eq together
with finite-length locality. None is restated as an admitted theorem.

All remaining headlines are statable. The finite AR quiver is assembled in README Layer 6 from
the native irreducible-morphism spaces, finite-dimensional indecomposable skeleton and almost-split
sequences. Its elementary finiteness consequence is not a separate deep acceptance theorem.
The translate used here is the native dual transpose of an explicit minimal presentation;
no object-level translate or arrow instance is supplied as admitted data.
-/

namespace TauCetiRoadmap.QuiverRepresentations

open CategoryTheory CategoryTheory.Limits CategoryTheory.Abelian
open scoped ModuleCat

universe u

/-! ## Layer 3: finite-dimensional algebras and admissible presentations -/

/-- Every finite-dimensional algebra is linearly Morita equivalent to a finite-dimensional basic
algebra; the left-module construction uses the opposite endomorphism ring of a basic progenerator.
Assem–Simson–Skowroński, I.6.10, with the left-module convention. -/
theorem exists_basic_morita (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] :
    ∃ (B : Type u) (_ : Ring B) (_ : Algebra k B) (_ : FiniteDimensional k B),
      TauCeti.IsBasic B ∧ Nonempty (MoritaEquivalence k A B) := sorry

/-- Every finite-dimensional module over a finite-dimensional algebra has a finite-dimensional
injective envelope: the embedding is essential, so every map out of the envelope whose restriction
is monic is itself monic. -/
theorem exists_injectiveEnvelope (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] (M : ModuleCat.{u} A) [Module.Finite A M] :
    ∃ (I : ModuleCat.{u} A) (i : M ⟶ I), Module.Finite A I ∧ Injective I ∧ Mono i ∧
      ∀ (X : ModuleCat.{u} A) (f : I ⟶ X), Mono (i ≫ f) → Mono f := sorry

/-- A basic finite-dimensional algebra over an algebraically closed field has a finite bound-quiver
presentation. Its vertex simples exhaust the simple modules without repetition, their pullbacks
are the native vertex simples, and arrow multiplicities equal the indicated Ext dimensions.
The kernel is admissible with respect to the arrow ideal, not the path algebra's Jacobson radical.
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

/-! ## Layer 4: heredity and the Euler–Ext comparison -/

/-- A finite acyclic path algebra is hereditary: all module Ext groups in degrees at least two
vanish, including for modules that are not finite-dimensional. -/
theorem pathAlgebra_higher_ext_vanish (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (hQ : TauCeti.Quiver.IsAcyclic Q)
    (M N : ModuleCat.{u} (TauCeti.pathAlgebra k Q)) (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (Ext M N n) := sorry

/-- The cokernel of the vertex-to-arrow Hom differential computes native module-category Ext¹.
This is an equivalence of vector spaces, not just an equality of dimensions. -/
theorem homDifferential_coker_equiv_ext (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (hQ : TauCeti.Quiver.IsAcyclic Q)
    (M N : TauCeti.QuiverRep.{u, u, u, u} k Q) :
    Nonempty ((TauCeti.QuiverRep.HomArrow M N ⧸
      LinearMap.range (TauCeti.QuiverRep.homDifferential M N)) ≃ₗ[k]
      Ext ((TauCeti.quiverRepEquivalence k Q).functor.obj M)
        ((TauCeti.quiverRepEquivalence k Q).functor.obj N) 1) := sorry

/-- For finite-dimensional representations of a finite acyclic quiver, the integral Euler form
is dim Hom minus dim Ext¹. Both dimensions are cast before subtraction. -/
theorem eulerForm_eq_hom_sub_ext (k Q : Type u) [Field k] [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (hQ : TauCeti.Quiver.IsAcyclic Q)
    (M N : TauCeti.QuiverRep.{u, u, u, u} k Q)
    (hM : TauCeti.IsFinDim k Q M) (hN : TauCeti.IsFinDim k Q N) :
    TauCeti.eulerForm Q (fun i => (TauCeti.dimVector M i : ℤ))
      (fun i => (TauCeti.dimVector N i : ℤ)) =
      (Module.finrank k (M ⟶ N) : ℤ) -
        (Module.finrank k (Ext ((TauCeti.quiverRepEquivalence k Q).functor.obj M)
          ((TauCeti.quiverRepEquivalence k Q).functor.obj N) 1) : ℤ) := sorry

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

/-! ## Layer 6: Auslander–Reiten duality and almost-split sequences -/

attribute [local instance] HasBinaryBiproducts.of_hasBinaryCoproducts

/-- The k-subspace of module morphisms generated by maps factoring through injective modules.
For finite-dimensional algebras and finite-dimensional endpoints this is the usual injectively
trivial subspace, defining costable Hom. -/
def injectiveFactorSubmodule (k A : Type u) [Field k] [Ring A] [Algebra k A]
    (M N : ModuleCat.{u} A) : Submodule k (M ⟶ N) :=
  Submodule.span k {f | ∃ (I : ModuleCat.{u} A), Injective I ∧
    ∃ (g : M ⟶ I) (h : I ⟶ N), g ≫ h = f}

/-- AR duality identifies D Ext¹(M,N) with costable Hom(N,D Tr M), for a finite minimal
projective presentation of M. The quotient kills injective factorizations, not projective ones. -/
theorem auslanderReiten_duality (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] (M N P₀ P₁ : ModuleCat.{u} A)
    [Module.Finite A M] [Module.Finite A N]
    [Module.Finite A P₀] [Module.Finite A P₁]
    (p : P₁ ⟶ P₀) (π : P₀ ⟶ M)
    (hp : TauCeti.IsMinimalProjectivePresentation p.hom π.hom) :
    Nonempty (Module.Dual k (Ext M N 1) ≃ₗ[k]
      ((N ⟶ ModuleCat.of A (TauCeti.AuslanderReitenTranslate k p.hom)) ⧸
        injectiveFactorSubmodule k A N
          (ModuleCat.of A (TauCeti.AuslanderReitenTranslate k p.hom)))) := sorry

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

/-- Every nonprojective indecomposable finite-dimensional module over a finite-dimensional algebra
ends an almost-split short exact sequence in its finitely generated module category. -/
theorem exists_almostSplitSequence (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] (M : FGModuleCat.{u} A)
    (hM : Indecomposable M) (hP : ¬ Projective M) :
    ∃ S : ShortComplex (FGModuleCat.{u} A), S.IsAlmostSplit ∧ Nonempty (S.X₃ ≅ M) := sorry

/-- The left end of an almost-split sequence is the dual transpose of a minimal projective
presentation of its right end. The comparison is an A-module isomorphism. -/
theorem almostSplit_left_iso_translate (k A : Type u) [Field k] [Ring A] [Algebra k A]
    [FiniteDimensional k A] (S : ShortComplex (FGModuleCat.{u} A)) (hS : S.IsAlmostSplit)
    (P₀ P₁ : ModuleCat.{u} A) [Module.Finite A P₀] [Module.Finite A P₁]
    (p : P₁ ⟶ P₀) (π : P₀ ⟶ S.X₃.obj)
    (hp : TauCeti.IsMinimalProjectivePresentation p.hom π.hom) :
    Nonempty (S.X₁.obj ≅ ModuleCat.of A (TauCeti.AuslanderReitenTranslate k p.hom)) := sorry

/-- Over an algebraically closed field, the two sides of an AR mesh have equal arrow
multiplicities: Irr(X,M) and Irr(τM,X) have the same k-dimension for indecomposable X. -/
theorem almostSplit_mesh_multiplicity (k A : Type u) [Field k] [IsAlgClosed k]
    [Ring A] [Algebra k A] [FiniteDimensional k A]
    (S : ShortComplex (FGModuleCat.{u} A)) (hS : S.IsAlmostSplit)
    (X : FGModuleCat.{u} A) (hX : Indecomposable X) :
    Module.finrank k (TauCeti.irreducibleMorphismSpace k X S.X₃) =
      Module.finrank k (TauCeti.irreducibleMorphismSpace k S.X₁ X) := sorry

end TauCetiRoadmap.QuiverRepresentations
