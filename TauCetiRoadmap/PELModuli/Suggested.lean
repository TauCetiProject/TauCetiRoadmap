import Mathlib
import TauCeti.Geometry.Symplectic.AlmostComplex

/-!
# Siegel and PEL moduli: headline theorem statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`.

The statements here are the semisimple representation-classification theorem of M0.15,
by determinant polynomials in every characteristic and by traces in characteristic zero,
and the real order-linear conjugacy theorem of M0.11. The determinant polynomial has a
body on Mathlib's generic characteristic-polynomial carrier; conjugacy uses Tau Ceti's
symplectic forms and compatible almost complex structures directly.

The Albert-type and similitude-group classification needs the positive-involution PEL
and group-scheme adapters of M0.1–M0.8. The Hasse and rational-form classification needs
continuous nonabelian Galois cohomology of these groups with all-place localization
(M0.9, M3.1–M3.2). Those interfaces are absent at the pins.

The geometric and arithmetic headlines are deferred as statements: the integral–rational
comparison and descent (M1), smooth representability, Kodaira–Spencer, division-algebra
properness and Wedhorn's criterion (M2), full-group complex uniformization and its
algebraization (M3), canonical models and rank-one CM reciprocity (M4), the Siegel,
Hilbert and unitary moduli comparisons (M5), and coarse spaces, descent gerbes, bounded
fields of definition, Hodge lines and finite-field finiteness (M6). The pins lack relative
abelian schemes with duals, polarizations and Tate levels, algebraic spaces and PEL
moduli stacks, complex analytic spaces and their Betti comparison, Shimura data and
canonical models, and the structured Dieudonné/display objects needed by these results.
An ordinary abelian-variety carrier alone does not express a polarized PEL family or its
homology comparison.
-/

namespace TauCetiRoadmap.PELModuli

section Determinant

variable {R : Type*} [CommRing R] {O : Type*} [AddCommGroup O] [Module R O]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]

/-- **Determinant polynomial** `Det_{O|M}` (M0.14). For a linear family `φ : O → End M` and a basis
of `O`, `(−1)^{rank M}` times the constant coefficient of the generic characteristic polynomial
`LinearMap.polyCharpoly`; its value at `x` is `det(φ x)` (Lan, Definition 1.1.2.17, p. 19). -/
noncomputable def detPoly (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) :
    MvPolynomial ι R :=
  (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ b).coeff 0

end Determinant

section ModuleClassification

variable {k C M N : Type*} [Field k] [Ring C] [Algebra k C]
variable [FiniteDimensional k C] [IsSemisimpleRing C]
variable [AddCommGroup M] [Module k M] [FiniteDimensional k M]
variable [AddCommGroup N] [Module k N] [FiniteDimensional k N]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Determinant polynomials classify finite-dimensional representations of a semisimple algebra in
every characteristic, with no separability hypothesis on its centre (M0.15). After separable-centre
scalar extension, apply this to the extended semisimple algebra. Lan, Proposition 1.1.2.16. -/
theorem detPoly_classifies (φ : C →ₐ[k] Module.End k M) (ψ : C →ₐ[k] Module.End k N)
    (b : Module.Basis ι k C) :
    detPoly φ.toLinearMap b = detPoly ψ.toLinearMap b ↔
      ∃ f : M ≃ₗ[k] N, ∀ a x, f (φ a x) = ψ a (f x) := by
  sorry

/-- In characteristic zero, traces also classify finite-dimensional semisimple representations
(M0.15; Milne, Proposition 8.1). -/
theorem detPoly_classifies_charZero [CharZero k]
    (φ : C →ₐ[k] Module.End k M) (ψ : C →ₐ[k] Module.End k N) :
    (∀ a, LinearMap.trace k M (φ a) = LinearMap.trace k N (ψ a)) ↔
      ∃ f : M ≃ₗ[k] N, ∀ a x, f (φ a x) = ψ a (f x) := by
  sorry

end ModuleClassification

/-- Compatible order-linear complex structures lie in one real isometry orbit
(M0.11; Kottwitz, Lemma 4.3, p. 388). -/
theorem compatibleComplexStructures_conjugacy
    {O V : Type*} [Ring O] [StarRing O] [AddCommGroup V] [Module ℝ V]
    [FiniteDimensional ℝ V]
    (ρ : O →+* Module.End ℝ V) (ω : TauCeti.SymplecticForm V)
    (hρ : ∀ b x y, ω (ρ b x) y = ω x (ρ (star b) y))
    (J J' : TauCeti.AlmostComplexStructure V)
    (hJ : ω.Compatible J) (hJ' : ω.Compatible J')
    (hcomm : ∀ b x, J (ρ b x) = ρ b (J x))
    (hcomm' : ∀ b x, J' (ρ b x) = ρ b (J' x)) :
    ∃ g : V ≃ₗ[ℝ] V,
      (∀ x y, ω (g x) (g y) = ω x y) ∧
      (∀ b x, g (ρ b x) = ρ b (g x)) ∧
      ∀ x, g (J x) = J' (g x) := by
  sorry

end TauCetiRoadmap.PELModuli
