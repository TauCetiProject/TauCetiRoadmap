/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Hilbert C*-modules, Morita equivalence, and continuous trace: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib, each with `sorry`. Right Hilbert
`A`-modules use Mathlib's `CStarModule Aᵐᵒᵖ E`: the right action `x a` is `MulOpposite.op a • x`
and the usual `A`-valued inner product is `MulOpposite.unop (inner Aᵐᵒᵖ x y)`.

Stated here: the adjoint identity forces linearity, boundedness and module linearity (H2); the
C*-identity `‖T*T‖ = ‖T‖²` for adjointable maps (H2); and, for unital `A`, existence of a finite
Parseval frame is equivalent to algebraic finite generation and projectivity (H2).

Not statable at the pins, and therefore not stated:
* `L_A(E) ≅ M(K_A(E))`, Morita equivalence via imprimitivity bimodules `A ≅ K_B(E)`, the linking
  algebra and the Rieffel correspondence (H2–H3): the pinned Mathlib has no C*-algebra of
  adjointable or module-compact operators and no interior tensor product of Hilbert modules.
* Kasparov stabilization `E ⊕ H_A ≅ H_A` (H4): no standard module `H_A = ℓ²(ℕ, A)` with its
  Hilbert-module structure.
* Brown–Green–Rieffel `A ∼ B ↔ A ⊗min K(ℓ²) ≅ B ⊗min K(ℓ²)` (H4): no minimal tensor product of
  C*-algebras.
* Continuous trace ⇔ local Morita equivalence to `C₀(X)` and the Dixmier–Douady classification
  `Br(X) ≅ ČH³(X, ℤ)` (H5): no unitary dual `Â` with its topology, no continuous-trace predicate and
  no Čech cohomology of the sheaves of continuous functions on a locally compact space.
* The bounded-transform correspondence and the local–global principle for regular operators
  (H6–H7): no module-valued adjoint of a partial operator, no regularity predicate and no
  localization `E ⊗_A H_π`.
-/

namespace TauCetiRoadmap.HilbertModules

/-! ## Layer H2: adjointable maps and module compact operators -/

/-- Two plain functions `T : E → F` and `S : F → E` between right Hilbert `A`-modules form an
adjoint pair when `⟨T x, y⟩ = ⟨x, S y⟩` for all `x, y` (Raeburn–Williams, Definition 2.17). -/
def IsAdjointPair {A E F : Type*} [NonUnitalCStarAlgebra A] [PartialOrder A]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [NormedAddCommGroup F] [NormedSpace ℂ F]
    [SMul Aᵐᵒᵖ E] [SMul Aᵐᵒᵖ F] [CStarModule Aᵐᵒᵖ E] [CStarModule Aᵐᵒᵖ F]
    (T : E → F) (S : F → E) : Prop :=
  ∀ x y, inner Aᵐᵒᵖ (T x) y = inner Aᵐᵒᵖ x (S y)

/-- The adjoint identity alone forces both functions to be bounded complex-linear maps and `T` to
commute with the right `A`-action: linearity and module linearity come from nondegeneracy of the
inner product, boundedness from the closed graph theorem. -/
theorem adjointPair_exists_continuousLinearMaps {A E F : Type*} [NonUnitalCStarAlgebra A]
    [PartialOrder A] [StarOrderedRing A]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]
    [SMul Aᵐᵒᵖ E] [SMul Aᵐᵒᵖ F] [CStarModule Aᵐᵒᵖ E] [CStarModule Aᵐᵒᵖ F]
    {T : E → F} {S : F → E} (h : IsAdjointPair (A := A) T S) :
    ∃ (T' : E →L[ℂ] F) (S' : F →L[ℂ] E),
      (∀ x, T' x = T x) ∧ (∀ y, S' y = S y) ∧ ∀ (a : Aᵐᵒᵖ) (x : E), T (a • x) = a • T x := by
  sorry

/-- The C*-identity for adjointable maps: if `S` is an adjoint of `T` then `‖S ∘ T‖ = ‖T‖²`
(Blackadar, *Operator Algebras*, II.7). Together with the adjoint laws it makes `L_A(E)` a
C*-algebra. -/
theorem norm_adjoint_comp_self {A E F : Type*} [NonUnitalCStarAlgebra A]
    [PartialOrder A] [StarOrderedRing A]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [NormedAddCommGroup F] [NormedSpace ℂ F]
    [SMul Aᵐᵒᵖ E] [SMul Aᵐᵒᵖ F] [CStarModule Aᵐᵒᵖ E] [CStarModule Aᵐᵒᵖ F]
    {T : E →L[ℂ] F} {S : F →L[ℂ] E} (h : IsAdjointPair (A := A) T S) :
    ‖S.comp T‖ = ‖T‖ ^ 2 := by
  sorry

/-- Over a unital C*-algebra `A`, a right Hilbert `A`-module `E` has a finite Parseval frame,
vectors `x₁, …, xₙ` with `z = Σᵢ xᵢ ⟨xᵢ, z⟩` for every `z` (that is, `Σᵢ θ_(xᵢ,xᵢ) = id_E`), if and
only if `E` is finitely generated and projective as a right `A`-module (Roe, *Lectures on
K-Theory and Operator Algebras*, Proposition 10.2). -/
theorem exists_parseval_frame_iff_finite_projective {A E : Type*} [CStarAlgebra A]
    [PartialOrder A] [StarOrderedRing A]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    [Module Aᵐᵒᵖ E] [CStarModule Aᵐᵒᵖ E] :
    (∃ (n : ℕ) (x : Fin n → E), ∀ z, ∑ i, inner Aᵐᵒᵖ (x i) z • x i = z) ↔
      Module.Finite Aᵐᵒᵖ E ∧ Module.Projective Aᵐᵒᵖ E := by
  sorry

end TauCetiRoadmap.HilbertModules
