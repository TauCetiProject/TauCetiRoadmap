import TauCeti.Algebra.Lie.UniversalEnveloping.Prod
import TauCeti.Algebra.Lie.UniversalEnveloping.Abelian
import TauCeti.Algebra.Lie.GeneralLinear.TraceForm
import Mathlib.Algebra.Algebra.Subalgebra.Centralizer
import Mathlib.RepresentationTheory.Basic
import Mathlib.Basic.Complex.Basic

/-!
Illustrative target signatures; the README is definitive and this companion is nonexhaustive.
The product and abelian enveloping equivalences, trace form and tensor maps are native.
New center membership/range and quotient-descent laws below are proof targets.
-/

open scoped TensorProduct

namespace TauCetiRoadmap.LieHighestWeight.ReductiveCenter

universe u v w x

section Product
variable (K : Type u) [CommRing K]
variable (Z : Type v) [LieRing Z] [LieAlgebra K Z] [IsLieAbelian Z]
variable (S : Type w) [LieRing S] [LieAlgebra K S]

/-- Actual native product comparison followed by the inverse abelian comparison. -/
noncomputable def productEnveloping :
    UniversalEnvelopingAlgebra K (Z × S) ≃ₐ[K]
      SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S :=
  (TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor K Z S).trans
    (Algebra.TensorProduct.congr
      (TauCeti.UniversalEnvelopingAlgebra.symmetricAlgebraEquiv K Z).symm
      (AlgEquiv.refl : UniversalEnvelopingAlgebra K S ≃ₐ[K] _))

variable {L : Type x} [LieRing L] [LieAlgebra K L]

/-- Retains the actual chosen center/derived splitting; no decomposition is assumed from a name. -/
noncomputable def splitEnveloping (e : L ≃ₗ⁅K⁆ Z × S) :
    UniversalEnvelopingAlgebra K L ≃ₐ[K]
      SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S :=
  (TauCeti.UniversalEnvelopingAlgebra.mapEquiv K e).trans
    (productEnveloping K Z S)

theorem productEnveloping_generator (z : Z) (s : S) :
    productEnveloping K Z S (UniversalEnvelopingAlgebra.ι K (z, s)) =
      SymmetricAlgebra.ι K Z z ⊗ₜ[K] (1 : UniversalEnvelopingAlgebra K S) +
        (1 : SymmetricAlgebra K Z) ⊗ₜ[K] UniversalEnvelopingAlgebra.ι K s := by
  simp [productEnveloping, Algebra.TensorProduct.congr_apply, Algebra.TensorProduct.map_tmul]

/-- Center inclusion on the second tensor factor, an actual native algebra map. -/
noncomputable def tensorCenterInclusion :
    SymmetricAlgebra K Z ⊗[K]
        Subalgebra.center K (UniversalEnvelopingAlgebra K S) →ₐ[K]
      SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S :=
  Algebra.TensorProduct.map (AlgHom.id K (SymmetricAlgebra K Z))
    (Subalgebra.center K (UniversalEnvelopingAlgebra K S)).val

end Product

section Center
variable (K : Type u) [Field K]
variable (Z : Type v) [LieRing Z] [LieAlgebra K Z] [IsLieAbelian Z]
variable (S : Type w) [LieRing S] [LieAlgebra K S]

/-- Tensor flatness over the field, applied to the actual center inclusion. -/
theorem tensorCenterInclusion_injective :
    Function.Injective (tensorCenterInclusion K Z S) := sorry

/-- Consume the native includeRight centralizer theorem; the first factor is commutative. -/
theorem tensorCenterInclusion_range :
    (tensorCenterInclusion K Z S).range =
      Subalgebra.center K
        (SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S) := sorry

variable {L : Type x} [LieRing L] [LieAlgebra K L]

theorem splitEnveloping_mem_center_iff (e : L ≃ₗ⁅K⁆ Z × S)
    (a : UniversalEnvelopingAlgebra K L) :
    splitEnveloping K Z S e a ∈
        Subalgebra.center K
          (SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S) ↔
      a ∈ Subalgebra.center K (UniversalEnvelopingAlgebra K L) := sorry
end Center

section Trace
variable (K : Type u) [CommRing K] (n : Type v) [Fintype n]

/-- The existing nondegenerate matrix trace form, including the empty index type. -/
def matrixTracePairing : LinearMap.BilinForm K (Matrix n n K) :=
  TauCeti.traceBilinForm K n

theorem matrixTracePairing_apply (a b : Matrix n n K) :
    matrixTracePairing K n a b = Matrix.trace (a * b) := rfl

theorem matrixTracePairing_nondegenerate : (matrixTracePairing K n).Nondegenerate :=
  TauCeti.traceBilinForm_nondegenerate K n
end Trace

section CentralCover
variable {Z : Type u} {S : Type v} [Group Z] [Group S]
variable {V : Type w} [AddCommGroup V] [Module ℂ V]

/-- Actual scalar central action times the specified derived-group action. -/
noncomputable def centralTensorRepresentation (chi : Z →* ℂˣ)
    (sigma : Representation ℂ S V) : Representation ℂ (Z × S) V where
  toFun g := (chi g.1 : ℂ) • sigma g.2
  map_one' := by ext v; simp
  map_mul' g h := by
    ext v
    simp [Module.End.mul_apply, smul_smul, mul_comm]

theorem centralTensorRepresentation_apply (chi : Z →* ℂˣ)
    (sigma : Representation ℂ S V) (g : Z × S) (v : V) :
    centralTensorRepresentation chi sigma g v = (chi g.1 : ℂ) • sigma g.2 v := rfl

/-- Actual descent condition, not a replacement of the full character lattice by a Lie weight. -/
def centralKernelTrivial (F : Subgroup (Z × S)) (chi : Z →* ℂˣ)
    (sigma : Representation ℂ S V) : Prop :=
  ∀ f : F, centralTensorRepresentation chi sigma f = 1

variable {G : Type x} [Group G]

/-- The algebraic descent law on the supplied surjective covering homomorphism.
Continuity/smoothness of the descended map uses the quotient topology, as specified in the README. -/
theorem centralTensorRepresentation_descends_iff (q : Z × S →* G)
    (hq : Function.Surjective q) (chi : Z →* ℂˣ) (sigma : Representation ℂ S V) :
    (∃ rho : Representation ℂ G V,
      ∀ g : Z × S, rho (q g) = centralTensorRepresentation chi sigma g) ↔
      centralKernelTrivial q.ker chi sigma := sorry
end CentralCover

end TauCetiRoadmap.LieHighestWeight.ReductiveCenter
