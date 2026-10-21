import Mathlib
import TauCetiRoadmap.AlgebraicCurves.Suggested

/-!
# Algebraic curves: constant extensions and the residue-scope boundary

Additional target signatures for Layers 2, 8 and 12B.0. The complete programme is
README.md. The existing Suggested.lean and its carriers are reused unchanged.
Theorems carrying `sorry` are proof targets, not validated results. In particular,
tensor-domain regularity below does not imply smoothness of a complete model or
genus invariance. The latter uses the actual smooth-model cut in README.md.
-/

namespace TauCetiRoadmap.AlgebraicCurves

open scoped TensorProduct WithZero

universe u v w

section Fields

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- A separating element has the actual finite separable extension as input.
This generic field condition alone does not conserve genus. -/
def IsSeparatingElement (x : F) : Prop :=
  Transcendental k x ∧
    FiniteDimensional (IntermediateField.adjoin k {x}) F ∧
    Algebra.IsSeparable (IntermediateField.adjoin k {x}) F

/-- Perfectness supplies a separating element for the one-variable field.
The proof compares the native finite transcendence basis with hF, not a new
notion of a separably generated extension. -/
theorem exists_isSeparatingElement [PerfectField k] (hF : IsFunctionField k F) :
    ∃ x : F, IsSeparatingElement (k := k) x := by
  sorry

/-- Exact constants PLUS generic separability give a tensor domain for every
constant extension. Its fraction field is constructed only after this result.
This is generic geometric integrality, not whole-model geometric regularity. -/
theorem constantExtension_isDomain
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hsep : ∃ x : F, IsSeparatingElement (k := k) x)
    (K : Type w) [Field K] [Algebra k K] :
    IsDomain (K ⊗[k] F) := by
  sorry

/-- The pole fibre uses vanishing of the inverse coordinate, not all primes in
the inverse-coordinate chart. After the Layer2 dictionary this set is the fibre
above the base ideal (x⁻¹). -/
def poleFibre (x : F) : Set (Place k F) :=
  {P | P.valuation (x⁻¹) < 1}

/-- The nonzero guard prevents use of the junk additive order at zero. -/
theorem mem_poleFibre_iff (x : F) (hx : x ≠ 0) (P : Place k F) :
    P ∈ poleFibre x ↔ P.ord x < 0 := by
  sorry

/-- This is the real residue-separability input for the k-compatible completion
chart; it is independent of generic separable generation of F/k. -/
def HasSeparableResidue (P : Place k F) : Prop :=
  Algebra.IsSeparable k P.ResidueField

end Fields

section TraceGram

variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- The trace matrix is built from the actual native algebra trace, not an
uninterpreted numerical different. An integral basis is supplied by the local
normalization producer before applying the discriminant/length comparison. -/
noncomputable def traceGram (b : Module.Basis ι K L) : Matrix ι ι K :=
  Algebra.traceMatrix K b

/-- Separability of fraction fields, not residue fields, is what makes the trace
matrix invertible. It therefore remains available in the fierce branch. -/
theorem traceGram_det_ne_zero [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (b : Module.Basis ι K L) : (traceGram b).det ≠ 0 := by
  simpa only [traceGram, Algebra.traceMatrix_of_basis] using det_traceForm_ne_zero b

/-- Reuse the native dual basis: the complementary-module producer proves which
A-span it gives for an A-integral basis, rather than defining a second trace. -/
noncomputable def traceDualBasis [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (b : Module.Basis ι K L) : Module.Basis ι K L := b.traceDual

/-- The defining duality equation is an existing native theorem. -/
theorem trace_traceDualBasis_mul [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (b : Module.Basis ι K L) (i j : ι) :
    Algebra.trace K L (traceDualBasis b i * b j) = if j = i then 1 else 0 :=
  b.trace_traceDual_mul i j

end TraceGram

section SchemeBaseChange

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

variable (k : Type u) [Field k] (X : Scheme.{u})
variable (f : X ⟶ Spec (CommRingCat.of k))

/-- Actual native base-change structures used by 12B.0b. These are scheme
properties, not an arbitrary proposition asserted to be a smooth model.
Both fields may be placed in any common universe; the generic tensor statement
above retains independent carrier universes. This signature is unvalidated. -/
example [Smooth f] [IsProper f] [GeometricallyIntegral f]
    (K : Type u) [Field K] [Algebra k K] :
    let a := Spec.map (CommRingCat.ofHom (algebraMap k K))
    Smooth (pullback.snd f a) ∧ IsProper (pullback.snd f a) ∧
      GeometricallyIntegral (pullback.snd f a) := by
  dsimp
  exact ⟨inferInstance, inferInstance, inferInstance⟩

end SchemeBaseChange

end TauCetiRoadmap.AlgebraicCurves
