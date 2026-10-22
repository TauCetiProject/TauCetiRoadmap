import Mathlib
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric

/-!
# Geometric Satake and fusion: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The GS4 neutral Tannaka reconstruction theorem is stated on the pinned categories
of finite-dimensional modules and comodules. It constructs a commutative Hopf
algebra from an arbitrary neutral tensor category, together with a symmetric tensor
equivalence respecting the given fibre functor. It does not assume a coordinate
Hopf algebra in advance.

The geometric headline results require carriers absent from the pins. GS0's bounded
Witt and Beilinson–Drinfeld Grassmannians, projective perfect models and their
geometric determinant lines have not been constructed. Witt-vector rings, ordinary
schemes and the module Grassmannian do not supply these moduli spaces. GS1's ULA
recognition, relative perversity and special/generic comparison require the local
Hecke v-stacks and their constructible sheaf categories. Those same missing
categories prevent statements of GS2's tensor convolution and rigidity, GS3's
coherent parity-corrected symmetric fusion, and GS4's geometric reconstruction,
integral pinned dual identification and rational Witt and normalized integral
Satake equivalences. The relative reconstruction theorem additionally needs the
coherent linear-category and internal-comodule constructions in its README target.
The perfect-complex extension requires the relative perfect categories of
classifying stacks and the enhanced Hecke category; the classical comparison
requires Frobenius-descended Satake objects and the spherical Hecke transform.
No geometric equivalence or trace comparison is stated without these objects.
-/

namespace TauCeti.GeometricSatake

open CategoryTheory CategoryTheory.Limits CategoryTheory.MonoidalCategory

universe u v

/-- Neutral Tannaka reconstruction (GS4, relative reconstruction; DM Theorem 2.11).
An essentially small rigid abelian tensor category over a field, with scalar
endomorphisms of the unit and an exact faithful symmetric tensor fibre functor,
is the category of finite-dimensional comodules of a commutative Hopf algebra.
The equivalence is symmetric monoidal and its forgetful functor agrees with the
given fibre functor by a monoidal natural isomorphism. Finite comodules use the
pinned semimodule forgetful functor; the module/semimodule equivalence transports
the other side to the same carrier. -/
theorem neutralTannakaReconstruction (k : Type u) [Field k]
    (C : Type v) [Category.{u} C] [EssentiallySmall.{u} C]
    [Abelian C] [Linear k C] [MonoidalCategory C] [SymmetricCategory C]
    [RigidCategory C] [MonoidalPreadditive C] [MonoidalLinear k C]
    (hunit : Function.Bijective (fun a : k => a • 𝟙 (𝟙_ C)))
    (F : C ⥤ FGModuleCat.{u} k) [F.Linear k] [F.Faithful]
    [F.Braided] [PreservesFiniteLimits F] [PreservesFiniteColimits F] :
    ∃ (H : CommHopfAlgCat.{u} k) (E : C ≌ TauCeti.FGComoduleCat.{u, u, u} k H)
      (hE : E.functor.Braided),
      letI := hE
      ∃ (e : E.functor ⋙ forget₂ (TauCeti.FGComoduleCat k H) (SemimoduleCat k) ≅
        F ⋙ forget₂ (FGModuleCat k) (ModuleCat k) ⋙
          (ModuleCat.equivalenceSemimoduleCat (R := k)).functor), e.hom.IsMonoidal := by
  sorry

end TauCeti.GeometricSatake
