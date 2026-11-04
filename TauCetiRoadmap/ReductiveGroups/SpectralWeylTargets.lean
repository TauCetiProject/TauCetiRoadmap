import TauCetiRoadmap.ReductiveGroups.Suggested
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Tangent
import TauCeti.Algebra.AlgebraicGroup.Tangent.Lie
import TauCeti.Algebra.AlgebraicGroup.Tangent.CounitPoints
import TauCeti.LinearAlgebra.RootSystem.BaseChange
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Presentation
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.AlgebraicTopology.FundamentalGroup.BasepointChange
import Mathlib

/-!
# Spectral quotients and finite Weyl monodromy: selected target forms

This file is not the roadmap and is not exhaustive. README.md Layer11 is definitive.
These are suggested interfaces, not implementations of the spectral or arrangement theorems.
In particular an admitted continuous map/equivalence below remains a construction target.
Every admitted data family keeps its mathematical inputs after the result-type colon.
The concrete Hopf points, tangent Lie algebra, torus subgroup, root pairings, Artin groups,
configurations and fundamental groups are the existing native carriers or explicit subtypes
and quotients of them. IG.5.1 supplies the generic configuration/disc comparison; the plane
interfaces below are its specified application and do not introduce a second braid engine.
-/

noncomputable section
open scoped Topology BigOperators Matrix
open CategoryTheory

namespace TauCetiRoadmap.ReductiveGroups.Spectral

/-! ## Type A configurations and explicit centering -/

abbrev OrderedPlane (n : ℕ) := {z : Fin n → ℂ // Function.Injective z}

/-- Left permutation action, with inverse on the coordinate index. -/
def permute {n : ℕ} (σ : Equiv.Perm (Fin n)) (z : OrderedPlane n) : OrderedPlane n :=
  ⟨fun i => z.1 (σ⁻¹ i), z.property.comp σ.symm.injective⟩

instance planePermutationAction (n : ℕ) : MulAction (Equiv.Perm (Fin n)) (OrderedPlane n) where
  smul := permute
  one_smul z := Subtype.ext (by funext i; rfl)
  mul_smul σ τ z := Subtype.ext (by funext i; rfl)

abbrev UnorderedPlane (n : ℕ) :=
  Quotient (MulAction.orbitRel (Equiv.Perm (Fin n)) (OrderedPlane n))

def forgetOrder {n : ℕ} (z : OrderedPlane n) : UnorderedPlane n := Quotient.mk _ z

def planeBase (n : ℕ) : OrderedPlane n :=
  ⟨fun i => (i.val : ℂ), by
    intro i j h
    apply Fin.ext
    change (i.val : ℂ) = (j.val : ℂ) at h
    exact_mod_cast h⟩

def centroid {n : ℕ} (z : Fin n → ℂ) : ℂ := (n : ℂ)⁻¹ * ∑ i, z i

abbrev CenteredPlane (n : ℕ) := {z : OrderedPlane n // ∑ i, z.1 i = 0}

/-- Explicit translation and centering; the hypothesis excludes reciprocal zero. -/
noncomputable def centerHomeomorph : ∀ (n : ℕ), 0 < n →
    OrderedPlane n ≃ₜ ℂ × CenteredPlane n := sorry

theorem centerHomeomorph_fst (n : ℕ) (hn : 0 < n) (z : OrderedPlane n) :
    (centerHomeomorph n hn z).1 = centroid z.1 := sorry

theorem centerHomeomorph_snd (n : ℕ) (hn : 0 < n) (z : OrderedPlane n) (i : Fin n) :
    (centerHomeomorph n hn z).2.1.1 i = z.1 i - centroid z.1 := sorry

theorem centerHomeomorph_symm (n : ℕ) (hn : 0 < n) (c : ℂ)
    (z : CenteredPlane n) (i : Fin n) :
    ((centerHomeomorph n hn).symm (c,z)).1 i = z.1.1 i + c := sorry

/-- Plane/disc and actual basepoint transports followed by the IG.5.1 comparison. -/
noncomputable def planeBraidEquiv : ∀ n : ℕ,
    FundamentalGroup (UnorderedPlane n) (forgetOrder (planeBase n)) ≃*
      TauCeti.BraidGroup n := sorry

noncomputable def planePureEquiv : ∀ n : ℕ,
    FundamentalGroup (OrderedPlane n) (planeBase n) ≃*
      TauCeti.BraidGroup.pureSubgroup n := sorry

theorem continuous_forgetOrder (n : ℕ) :
    Continuous (forgetOrder : OrderedPlane n → UnorderedPlane n) := sorry

def orderedCover (n : ℕ) : C(OrderedPlane n, UnorderedPlane n) :=
  ⟨forgetOrder, continuous_forgetOrder n⟩

theorem orderedCover_pi1 (n : ℕ)
    (γ : FundamentalGroup (OrderedPlane n) (planeBase n)) :
    planeBraidEquiv n (FundamentalGroup.map (orderedCover n) (planeBase n) γ) =
      (planePureEquiv n γ : TauCeti.BraidGroup n) := sorry

/-- The covering permutation, with inverse-endpoint convention fixed in the README. -/
def planeMonodromy (n : ℕ) :
    FundamentalGroup (UnorderedPlane n) (forgetOrder (planeBase n)) →*
      Equiv.Perm (Fin n) :=
  (TauCeti.BraidGroup.permHom n).comp (planeBraidEquiv n).toMonoidHom

theorem planeMonodromy_endpoint (n : ℕ) (σ : Equiv.Perm (Fin n))
    (γ : Path (forgetOrder (planeBase n)) (forgetOrder (planeBase n)))
    (η : Path (planeBase n) (σ • planeBase n))
    (hη : ∀ t, forgetOrder (η t) = γ t) :
    planeMonodromy n (FundamentalGroup.fromPath ⟦γ⟧) = σ⁻¹ := sorry

theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := sorry

/-! ## Actual type-A spectral polynomial, without a private eigenvalue carrier -/

abbrev SimpleSpectrum (n : ℕ) :=
  {A : Matrix (Fin n) (Fin n) ℂ // A.charpoly.Separable}

/-- The unordered roots of the actual separable characteristic polynomial. -/
noncomputable def matrixSpectrum : ∀ n : ℕ, SimpleSpectrum n → UnorderedPlane n := sorry

theorem matrixSpectrum_charpoly (n : ℕ) (A : SimpleSpectrum n) (z : OrderedPlane n)
    (hz : matrixSpectrum n A = forgetOrder z) :
    A.1.charpoly = ∏ i, (Polynomial.X - Polynomial.C (z.1 i)) := sorry

theorem continuous_matrixSpectrum (n : ℕ) : Continuous (matrixSpectrum n) := sorry

/-! ## Actual complex reductive-group carriers -/

abbrev Coordinate := TauCeti.FiniteTypeCommHopfAlgCat.{0,0} ℂ
abbrev PointGroup (H : Coordinate) := WithConv (H →ₐ[ℂ] ℂ)
abbrev TangentLie (H : Coordinate) :=
  Derivation ℂ H (TauCeti.Bialgebra.CounitAlgebra ℂ H ℂ)

/-- Evaluation topology of the actual affine complex points. The finite-type analytic
comparison, rather than a new choice of topology, is a target of the lower FCO dictionary. -/
instance pointTopology (H : Coordinate) : TopologicalSpace (PointGroup H) :=
  TopologicalSpace.induced (fun g : PointGroup H => fun a : H => g.ofConv a) inferInstance

instance tangentTopology (H : Coordinate) : TopologicalSpace (TangentLie H) :=
  TopologicalSpace.induced
    (fun d : TangentLie H => fun a : H =>
      TauCeti.Bialgebra.CounitAlgebra.algEquivSelf ℂ H ℂ (d a)) inferInstance

/-- Reuse the native convolution adjoint representation, transported to ordinary complex points. -/
def adjoint (H : Coordinate) : Representation ℂ (PointGroup H) (TangentLie H) :=
  (Derivation.adRepresentation (R := ℂ) (A := H) ℂ).comp
    (TauCeti.Bialgebra.CounitAlgebra.pointsMulEquiv ℂ H ℂ).symm.toMonoidHom

instance adjointAction (H : Coordinate) : MulAction (PointGroup H) (TangentLie H) where
  smul g x := adjoint H g x
  one_smul x := by
    change (adjoint H 1) x = x
    rw [map_one]
    rfl
  mul_smul g h x := by
    change (adjoint H (g*h)) x = (adjoint H g) ((adjoint H h) x)
    rw [map_mul]
    rfl

abbrev TorusLie (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  TauCeti.HopfIdeal.lieSubalgebra (B := ℂ) I

abbrev TorusPoints (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of ℂ ℂ)

abbrev FlagCoset (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  PointGroup H ⧸ TorusPoints H I

/-- The regular Cartan criterion uses the actual torus Lie subalgebra and ambient bracket. -/
abbrev TorusRegular (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {t : TorusLie H I // ∀ x : TangentLie H,
    ⁅(t : TangentLie H), x⁆ = 0 ↔ x ∈ TorusLie H I}

/-- Actual adjoint translates. Equivalence with the usual regular-semisimple condition,
independence of the maximal torus and agreement of analytic topologies are Layer11C targets. -/
abbrev RegularSemisimple (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {x : TangentLie H // ∃ g : PointGroup H, ∃ t : TorusRegular H I,
    adjoint H g t.1.1 = x}

abbrev AdjointQuotient (H : Coordinate) :=
  Quotient (MulAction.orbitRel (PointGroup H) (TangentLie H))

abbrev SpectralBase (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {q : AdjointQuotient H // ∃ x : RegularSemisimple H I, Quotient.mk _ x.1 = q}

def spectralProjection (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (x : RegularSemisimple H I) : SpectralBase H I :=
  ⟨Quotient.mk _ x.1, x, rfl⟩

def torusInclusion (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (t : TorusRegular H I) : RegularSemisimple H I :=
  ⟨t.1.1, 1, t, by simp [adjoint]⟩

/-- This is the actual pullback of the specified spectral projection. -/
abbrev Cameral (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {p : RegularSemisimple H I × TorusRegular H I //
    spectralProjection H I p.1 = spectralProjection H I (torusInclusion H I p.2)}

theorem continuous_spectralProjection (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    Continuous (spectralProjection H I) := sorry

def spectralContinuousMap (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    C(RegularSemisimple H I, SpectralBase H I) :=
  ⟨spectralProjection H I, continuous_spectralProjection H I hG hT⟩

/-- Hard geometric family: the actual product-to-pullback homeomorphism. -/
noncomputable def cameralEquiv : ∀ (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H),
    TauCeti.reductiveCommHopfAlgProperty ℂ H →
    TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I →
    FlagCoset H I × TorusRegular H I ≃ₜ Cameral H I := sorry

theorem cameralEquiv_apply (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (g : PointGroup H) (t : TorusRegular H I) :
    ((cameralEquiv H I hG hT (QuotientGroup.mk g, t)).1.1 : TangentLie H) =
      adjoint H g t.1.1 := sorry

theorem cameralEquiv_second (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (p : FlagCoset H I × TorusRegular H I) :
    (cameralEquiv H I hG hT p).1.2 = p.2 := sorry

theorem simplyConnected_flagCoset (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    SimplyConnectedSpace (FlagCoset H I) := sorry

/-- Its underlying homomorphism is required below to be the actual induced map of χ. -/
noncomputable def spectralFundamentalEquiv : ∀ (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (x : RegularSemisimple H I),
    FundamentalGroup (RegularSemisimple H I) x ≃*
      FundamentalGroup (SpectralBase H I) (spectralProjection H I x) := sorry

theorem spectralFundamentalEquiv_toMonoidHom (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (x : RegularSemisimple H I) :
    (spectralFundamentalEquiv H I hG hT x).toMonoidHom =
      FundamentalGroup.map (spectralContinuousMap H I hG hT) x := sorry

/-! ## A genuine real root pairing, its native complex base change and finite arrangement -/

section Arrangement
variable {ι κ : Type} [Finite ι] [Fintype κ]

abbrev ComplexPairing (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  TauCeti.rootPairingBaseChange ℂ P hP

abbrev RegularArrangement (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  {z : κ → ℂ // ∀ i : ι, (ComplexPairing P hP).coroot' i z ≠ 0}

/-- Restriction of the actual Weyl action; preservation of the complement is part of
this target, and the value equation prevents an unrelated action from satisfying it. -/
noncomputable def arrangementAction :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y),
      MulAction (ComplexPairing P hP).weylGroup (RegularArrangement P hP) := sorry

instance arrangementMulAction (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :
    MulAction (ComplexPairing P hP).weylGroup (RegularArrangement P hP) :=
  arrangementAction P hP

theorem arrangement_smul_coe (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y)
    (w : (ComplexPairing P hP).weylGroup) (z : RegularArrangement P hP) :
    (w • z).1 = w • z.1 := sorry

abbrev ArrangementBase (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  Quotient (MulAction.orbitRel (ComplexPairing P hP).weylGroup (RegularArrangement P hP))

def arrangementProjection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y)
    (z : RegularArrangement P hP) : ArrangementBase P hP := Quotient.mk _ z

noncomputable def arrangementArtinEquiv :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ)) [P.IsCrystallographic] [P.IsReduced]
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
      (z : RegularArrangement P hP),
      FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) ≃*
        TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b) := sorry

/-- This is the existing native presentation map, not a private Weyl-group presentation. -/
def artinWeylProjection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] (b : P.Base) :
    TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b) →* P.weylGroup :=
  (TauCeti.weylCoxeterHom P b).comp
    (TauCeti.ArtinGroup.toCoxeterGroup (TauCeti.coxeterMatrixOfBase P b).toCoxeterSystem)

/-- Native complexification on standard coordinates still needs the explicit Weyl comparison. -/
noncomputable def baseChangeWeylEquiv :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y),
      P.weylGroup ≃* (ComplexPairing P hP).weylGroup := sorry

theorem baseChangeWeylEquiv_reflection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (i : ι) :
    baseChangeWeylEquiv P hP (RootPairing.weylGroup.ofIdx P i) =
      RootPairing.weylGroup.ofIdx (ComplexPairing P hP) i := sorry

def arrangementMonodromy (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) :
    FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) →*
      (ComplexPairing P hP).weylGroup :=
  (baseChangeWeylEquiv P hP).toMonoidHom.comp
    ((artinWeylProjection P b).comp (arrangementArtinEquiv P hP b z).toMonoidHom)

theorem arrangementMonodromy_endpoint
    (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ)) [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) (w : (ComplexPairing P hP).weylGroup)
    (γ : Path (arrangementProjection P hP z) (arrangementProjection P hP z))
    (η : Path z (w • z))
    (hη : ∀ t, arrangementProjection P hP (η t) = γ t) :
    arrangementMonodromy P hP b z (FundamentalGroup.fromPath ⟦γ⟧) = w⁻¹ := sorry

/-- Concrete root-index transport through the actual Weyl permutation representation. -/
def rootMonodromy (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) :
    FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) →* Equiv.Perm ι :=
  (ComplexPairing P hP).weylGroupToPerm.comp (arrangementMonodromy P hP b z)

end Arrangement
end TauCetiRoadmap.ReductiveGroups.Spectral
