import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.InnerConjugation

/-!
# Arithmetic locally symmetric spaces: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones; discharging all of them
finishes neither a layer nor the roadmap.

The ALS.0.1 existence and conjugacy theorems for Cartan involutions are stated below for every
connected reductive real algebraic group, using Tau Ceti's finite-type coordinate Hopf algebras,
its reductivity predicate and its algebraic inner conjugation. The compact-twist definition uses
actual complex algebra-valued points. Their evaluation maps into the product of copies of `ℂ`
give the usual topology on complex points of an affine algebraic group of finite type.
The comparison `IsCartanInvolution.iff_inverseAdjoint` requires the rational inverse-adjoint
Cartan datum of AdelicAlgebraicGroups, which is absent at the pin, so it is not stated.

The other geometric headlines (ALS.F.1 and ALS.0–ALS.2) require the real-points Lie-group adapter,
the split-centre symmetric space, adelic level quotients and neat levels, arithmetic local
systems and Betti complexes, and the Borel–Serre bordification and its strata. These objects are
not provided by the pinned libraries and cannot be supplied by a few elementary definitions.
In particular, the `cellular-freeness` and `neat-component-group-cohomology` supplier contracts
specify comparisons with cellular chains and group cohomology, rather than the arithmetic
complexes themselves.

The Hecke comparison and strict-complex theorems (ALS.3), Eisenstein boundary vanishing for
`GL_n` and Siegel-stratum localization for `U(n,n)` (ALS.4), Poincaré–Verdier duality with
orientation coefficients and Hecke adjoints (ALS.5a), and finite-cover descent and its
Hochschild–Serre sequence (ALS.6) all require those missing arithmetic objects. The last-layer
cuspidality, degree-range and semisimplicity theorems (ALS.5b) additionally require automorphic
forms, compatible `(𝔤,K)`-modules and relative Lie algebra cohomology; the absolute cochain
complex needed for Nomizu and Kostant is also absent. None of these results is stated here.
-/

namespace TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

open CategoryTheory

/-- ALS.0.1: an involution of a real affine algebraic group of finite type is Cartan when its
twisted real form is compact. For the finitely generated coordinate Hopf algebra `H`, a complex
point is an algebra homomorphism `H →ₐ[ℝ] ℂ`. The equation cuts out `g = θ(ḡ)`; since `H` is of
finite type, its evaluation image carries the usual topology on complex points. -/
def IsCartanInvolution {H : TauCeti.FiniteTypeCommHopfAlgCat ℝ} (θ : H.obj ≅ H.obj) : Prop :=
  θ.hom ≫ θ.hom = 𝟙 H.obj ∧
    IsCompact ((fun p : H.obj →ₐ[ℝ] ℂ => (p : H.obj → ℂ)) ''
      {p | ∀ h : H.obj, p (θ.hom.hom h) = star (p h)})

/-- ALS.0.1 (Satake): every connected reductive real algebraic group has a Cartan involution.
Tau Ceti's reductivity predicate includes smoothness and geometric connectedness. -/
theorem IsCartanInvolution.exists (H : TauCeti.FiniteTypeCommHopfAlgCat ℝ)
    (hH : TauCeti.reductiveCommHopfAlgProperty ℝ H) :
    ∃ θ : H.obj ≅ H.obj, IsCartanInvolution θ := by
  sorry

/-- ALS.0.1: any two Cartan involutions are conjugate by a real point.
Coordinate pullback reverses composition: this is `θ' = ad(g) ∘ θ ∘ ad(g)⁻¹` on points. -/
theorem IsCartanInvolution.conj (H : TauCeti.FiniteTypeCommHopfAlgCat ℝ)
    (hH : TauCeti.reductiveCommHopfAlgProperty ℝ H) (θ θ' : H.obj ≅ H.obj)
    (hθ : IsCartanInvolution θ) (hθ' : IsCartanInvolution θ') :
    ∃ g : TauCeti.HopfAlgebra.points (R := ℝ) (H := H) (CommAlgCat.of ℝ ℝ),
      θ' = ((TauCeti.CommHopfAlgCat.innerConjugationIso H.obj g).trans θ).trans
        (TauCeti.CommHopfAlgCat.innerConjugationIso H.obj g).symm := by
  sorry

end TauCetiRoadmap.ArithmeticLocallySymmetricSpaces
